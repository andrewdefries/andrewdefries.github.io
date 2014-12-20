---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.280205, 0.4323071, -1.557962, 1, 0, 0, 1,
-2.603164, 0.2069932, -0.271473, 1, 0.007843138, 0, 1,
-2.597935, -0.8363836, -1.838395, 1, 0.01176471, 0, 1,
-2.550953, -0.7398301, -0.526162, 1, 0.01960784, 0, 1,
-2.544861, 1.253331, -1.998752, 1, 0.02352941, 0, 1,
-2.542746, 0.6525272, -1.614445, 1, 0.03137255, 0, 1,
-2.49005, 0.1818291, -0.5482288, 1, 0.03529412, 0, 1,
-2.449768, 0.9934749, 0.0553451, 1, 0.04313726, 0, 1,
-2.42868, 1.72585, -0.9454781, 1, 0.04705882, 0, 1,
-2.40213, -2.430278, -2.680167, 1, 0.05490196, 0, 1,
-2.359616, -1.033046, -2.45072, 1, 0.05882353, 0, 1,
-2.332753, 2.870117, 0.6454973, 1, 0.06666667, 0, 1,
-2.319778, 1.457687, -0.05510002, 1, 0.07058824, 0, 1,
-2.228899, -1.46832, -3.237511, 1, 0.07843138, 0, 1,
-2.193233, -0.1323825, -1.247774, 1, 0.08235294, 0, 1,
-2.188559, -1.120573, -1.56589, 1, 0.09019608, 0, 1,
-2.177439, -0.2533754, -4.11542, 1, 0.09411765, 0, 1,
-2.146567, 0.445514, 0.1403587, 1, 0.1019608, 0, 1,
-2.143896, 0.5252246, -0.08941118, 1, 0.1098039, 0, 1,
-2.130973, 1.711558, 0.4975723, 1, 0.1137255, 0, 1,
-2.12569, 1.17189, -1.996373, 1, 0.1215686, 0, 1,
-2.122475, 0.123043, 0.2618648, 1, 0.1254902, 0, 1,
-2.117054, 0.8962702, 0.2188426, 1, 0.1333333, 0, 1,
-2.105188, 0.5390052, -2.020145, 1, 0.1372549, 0, 1,
-2.062106, 0.2177669, -2.071232, 1, 0.145098, 0, 1,
-2.038174, -0.1149176, -2.694273, 1, 0.1490196, 0, 1,
-2.029857, -1.529095, -1.921231, 1, 0.1568628, 0, 1,
-1.986592, -2.15553, -2.148848, 1, 0.1607843, 0, 1,
-1.983576, 0.6541625, -1.885351, 1, 0.1686275, 0, 1,
-1.94211, 0.6046062, -0.7748737, 1, 0.172549, 0, 1,
-1.919329, 0.1101536, -0.8766434, 1, 0.1803922, 0, 1,
-1.916965, -0.2270338, -0.8541959, 1, 0.1843137, 0, 1,
-1.907694, 0.6620843, 0.397799, 1, 0.1921569, 0, 1,
-1.840936, -1.368034, -1.887424, 1, 0.1960784, 0, 1,
-1.819842, 0.129793, -0.8653691, 1, 0.2039216, 0, 1,
-1.812732, -0.6546725, -1.912215, 1, 0.2117647, 0, 1,
-1.800535, -1.62514, -2.2236, 1, 0.2156863, 0, 1,
-1.795231, -1.142259, -2.940507, 1, 0.2235294, 0, 1,
-1.79027, -0.03365101, -1.941735, 1, 0.227451, 0, 1,
-1.738982, 0.1194491, -0.4926176, 1, 0.2352941, 0, 1,
-1.728673, -0.3007393, -1.657872, 1, 0.2392157, 0, 1,
-1.726963, -0.859989, -3.101108, 1, 0.2470588, 0, 1,
-1.724299, -1.913704, -3.308409, 1, 0.2509804, 0, 1,
-1.723079, 0.6682267, -2.695052, 1, 0.2588235, 0, 1,
-1.698434, 1.424073, 0.6834425, 1, 0.2627451, 0, 1,
-1.694373, -0.8856842, -0.03852586, 1, 0.2705882, 0, 1,
-1.693945, 0.6922268, -1.829108, 1, 0.2745098, 0, 1,
-1.69313, -0.2524956, -2.567239, 1, 0.282353, 0, 1,
-1.688159, -1.711898, -3.29334, 1, 0.2862745, 0, 1,
-1.687577, -0.4364798, -3.216758, 1, 0.2941177, 0, 1,
-1.687193, 0.1938216, -1.277132, 1, 0.3019608, 0, 1,
-1.685873, 0.2511313, -0.1070778, 1, 0.3058824, 0, 1,
-1.683317, -1.778901, -2.540907, 1, 0.3137255, 0, 1,
-1.678629, 1.143408, -0.3243483, 1, 0.3176471, 0, 1,
-1.675136, 0.1980518, -1.855724, 1, 0.3254902, 0, 1,
-1.665763, 1.473855, -0.5687789, 1, 0.3294118, 0, 1,
-1.651396, 0.06265312, -1.455266, 1, 0.3372549, 0, 1,
-1.648821, 0.403, -3.301672, 1, 0.3411765, 0, 1,
-1.63903, -0.6804856, -2.198435, 1, 0.3490196, 0, 1,
-1.617758, 1.334386, 0.0643848, 1, 0.3529412, 0, 1,
-1.613205, 0.6854379, 1.007758, 1, 0.3607843, 0, 1,
-1.576852, -0.3270727, -1.551686, 1, 0.3647059, 0, 1,
-1.576497, -0.5349365, -2.58794, 1, 0.372549, 0, 1,
-1.565506, -0.3695023, -1.669813, 1, 0.3764706, 0, 1,
-1.559885, 0.3108818, -2.12637, 1, 0.3843137, 0, 1,
-1.515643, 0.3145356, 0.3299326, 1, 0.3882353, 0, 1,
-1.505429, 0.0002673272, -1.978788, 1, 0.3960784, 0, 1,
-1.495768, 0.09545256, -0.752287, 1, 0.4039216, 0, 1,
-1.490568, 0.2005668, -1.813428, 1, 0.4078431, 0, 1,
-1.486468, 1.332872, -2.164245, 1, 0.4156863, 0, 1,
-1.477485, 1.843549, -0.9634224, 1, 0.4196078, 0, 1,
-1.473255, -0.3652074, -1.269824, 1, 0.427451, 0, 1,
-1.46913, 0.9856452, -1.881588, 1, 0.4313726, 0, 1,
-1.455598, 2.131803, -0.7059739, 1, 0.4392157, 0, 1,
-1.45547, -1.401983, -2.498697, 1, 0.4431373, 0, 1,
-1.453482, 1.166199, -0.8224649, 1, 0.4509804, 0, 1,
-1.441173, 0.4120844, -2.80923, 1, 0.454902, 0, 1,
-1.437865, 0.2126108, -2.178108, 1, 0.4627451, 0, 1,
-1.435659, 2.384454, 0.06490752, 1, 0.4666667, 0, 1,
-1.435276, 1.383326, -0.6171099, 1, 0.4745098, 0, 1,
-1.429117, -0.7233085, -3.066151, 1, 0.4784314, 0, 1,
-1.42607, -1.153004, -2.741045, 1, 0.4862745, 0, 1,
-1.42384, 0.5035468, -2.18964, 1, 0.4901961, 0, 1,
-1.405504, -0.174992, -0.8464353, 1, 0.4980392, 0, 1,
-1.402653, 0.709487, -2.847756, 1, 0.5058824, 0, 1,
-1.397943, 0.5682548, 0.526774, 1, 0.509804, 0, 1,
-1.380841, 0.1436054, -1.40918, 1, 0.5176471, 0, 1,
-1.375394, -0.7447636, -2.724669, 1, 0.5215687, 0, 1,
-1.373757, -0.7892323, -0.8858107, 1, 0.5294118, 0, 1,
-1.361936, 2.087788, 0.8775752, 1, 0.5333334, 0, 1,
-1.361243, -0.5967359, -2.404276, 1, 0.5411765, 0, 1,
-1.351685, 0.2470869, -2.111288, 1, 0.5450981, 0, 1,
-1.350559, -0.2766515, -1.785688, 1, 0.5529412, 0, 1,
-1.335579, 0.7638621, -1.004744, 1, 0.5568628, 0, 1,
-1.321386, -0.01699084, -1.249784, 1, 0.5647059, 0, 1,
-1.316561, -0.4023136, -1.584629, 1, 0.5686275, 0, 1,
-1.308326, -1.403076, -3.61443, 1, 0.5764706, 0, 1,
-1.294513, -1.220762, -2.731172, 1, 0.5803922, 0, 1,
-1.293734, -0.9211226, -3.015141, 1, 0.5882353, 0, 1,
-1.290699, -1.778637, -0.817655, 1, 0.5921569, 0, 1,
-1.289017, -1.389948, -2.091027, 1, 0.6, 0, 1,
-1.281045, 0.2624273, -1.612967, 1, 0.6078432, 0, 1,
-1.280291, -1.035522, -2.039392, 1, 0.6117647, 0, 1,
-1.272138, -0.3769191, -2.807406, 1, 0.6196079, 0, 1,
-1.266444, -0.391903, -3.094928, 1, 0.6235294, 0, 1,
-1.261982, 0.7435383, -1.169622, 1, 0.6313726, 0, 1,
-1.25871, 0.5113988, -3.670104, 1, 0.6352941, 0, 1,
-1.251719, 1.123584, -1.597442, 1, 0.6431373, 0, 1,
-1.247141, 1.317379, 0.4224466, 1, 0.6470588, 0, 1,
-1.24581, 0.9680963, -0.1115032, 1, 0.654902, 0, 1,
-1.236778, 0.6383046, -0.05717723, 1, 0.6588235, 0, 1,
-1.229667, -0.5048989, -2.657, 1, 0.6666667, 0, 1,
-1.220958, 0.4436041, -1.221334, 1, 0.6705883, 0, 1,
-1.217555, 1.851139, -0.4017642, 1, 0.6784314, 0, 1,
-1.211758, 0.7432294, -0.9108797, 1, 0.682353, 0, 1,
-1.205524, -0.1572193, -0.7877298, 1, 0.6901961, 0, 1,
-1.20081, -0.6948552, -1.995787, 1, 0.6941177, 0, 1,
-1.200484, 0.1577139, -0.1304907, 1, 0.7019608, 0, 1,
-1.197163, 2.136129, 0.05933187, 1, 0.7098039, 0, 1,
-1.191571, -0.4782847, -4.018281, 1, 0.7137255, 0, 1,
-1.190778, -0.729124, -0.3637367, 1, 0.7215686, 0, 1,
-1.189133, -0.3733073, -3.390455, 1, 0.7254902, 0, 1,
-1.188104, 0.161595, 1.299894, 1, 0.7333333, 0, 1,
-1.18755, 0.4309189, -1.571785, 1, 0.7372549, 0, 1,
-1.184402, 2.515909, -0.6252919, 1, 0.7450981, 0, 1,
-1.182966, -2.058198, -3.249006, 1, 0.7490196, 0, 1,
-1.176667, -0.4845317, -1.922724, 1, 0.7568628, 0, 1,
-1.173482, -0.1389037, -0.6724786, 1, 0.7607843, 0, 1,
-1.173172, -1.053956, -0.8043956, 1, 0.7686275, 0, 1,
-1.166041, 0.03134762, -0.3869295, 1, 0.772549, 0, 1,
-1.163185, -0.4395662, -1.574011, 1, 0.7803922, 0, 1,
-1.161821, 0.0990473, -1.129275, 1, 0.7843137, 0, 1,
-1.158716, 0.5205161, -2.87754, 1, 0.7921569, 0, 1,
-1.15826, -0.6069176, -0.9155514, 1, 0.7960784, 0, 1,
-1.156378, 0.8442743, -0.5936928, 1, 0.8039216, 0, 1,
-1.1536, -1.49577, -0.8296899, 1, 0.8117647, 0, 1,
-1.151648, -0.8943835, -2.911874, 1, 0.8156863, 0, 1,
-1.149954, -0.9382485, -2.895331, 1, 0.8235294, 0, 1,
-1.138238, 0.2033786, -0.7442107, 1, 0.827451, 0, 1,
-1.135319, 0.7211301, -0.3663079, 1, 0.8352941, 0, 1,
-1.133919, 0.007935668, -0.6328496, 1, 0.8392157, 0, 1,
-1.133115, 1.620685, 0.09240155, 1, 0.8470588, 0, 1,
-1.130457, -2.477783, -3.726046, 1, 0.8509804, 0, 1,
-1.118826, 0.3866296, -2.186649, 1, 0.8588235, 0, 1,
-1.109308, 0.2705437, -1.418704, 1, 0.8627451, 0, 1,
-1.106876, -0.6208459, -1.58067, 1, 0.8705882, 0, 1,
-1.106636, 1.575416, -0.7817718, 1, 0.8745098, 0, 1,
-1.077574, 1.520991, -1.329342, 1, 0.8823529, 0, 1,
-1.075106, -1.494696, -3.446822, 1, 0.8862745, 0, 1,
-1.066791, -0.1500826, -1.469673, 1, 0.8941177, 0, 1,
-1.059787, -0.1742834, -1.678051, 1, 0.8980392, 0, 1,
-1.0541, -0.2225765, -1.242173, 1, 0.9058824, 0, 1,
-1.047343, 1.248246, 0.2837452, 1, 0.9137255, 0, 1,
-1.044251, -0.3548872, -0.5165935, 1, 0.9176471, 0, 1,
-1.039986, 1.211827, -1.155263, 1, 0.9254902, 0, 1,
-1.034654, 0.8778009, -1.785093, 1, 0.9294118, 0, 1,
-1.028359, -0.257561, -1.893958, 1, 0.9372549, 0, 1,
-1.025453, 1.062204, -2.811746, 1, 0.9411765, 0, 1,
-1.024059, 0.7747997, -0.8204682, 1, 0.9490196, 0, 1,
-1.022426, 1.585103, -0.2892709, 1, 0.9529412, 0, 1,
-1.019531, -0.5994143, -2.355985, 1, 0.9607843, 0, 1,
-1.012878, -0.5455316, -0.7670311, 1, 0.9647059, 0, 1,
-1.008083, -1.477948, -1.573053, 1, 0.972549, 0, 1,
-1.007139, 0.5217521, -0.1531633, 1, 0.9764706, 0, 1,
-1.003422, -0.8445622, -1.705728, 1, 0.9843137, 0, 1,
-1.00221, -0.4600741, -1.71115, 1, 0.9882353, 0, 1,
-1.00037, 1.51373, 0.6508099, 1, 0.9960784, 0, 1,
-0.9820532, -0.484692, -2.145452, 0.9960784, 1, 0, 1,
-0.9813361, -1.213249, -1.207443, 0.9921569, 1, 0, 1,
-0.9788589, -0.7514265, -1.710371, 0.9843137, 1, 0, 1,
-0.9768975, 0.7995108, -0.02176307, 0.9803922, 1, 0, 1,
-0.9521198, 0.1265863, -0.9478039, 0.972549, 1, 0, 1,
-0.9516617, 0.3395973, -2.767113, 0.9686275, 1, 0, 1,
-0.9479283, -0.4662144, -1.745701, 0.9607843, 1, 0, 1,
-0.9419538, 0.5305793, -0.8521656, 0.9568627, 1, 0, 1,
-0.941556, -0.1869401, -1.163932, 0.9490196, 1, 0, 1,
-0.939283, -0.5780204, -1.736758, 0.945098, 1, 0, 1,
-0.938626, 0.7846576, 0.04458522, 0.9372549, 1, 0, 1,
-0.9384167, 1.353955, -0.5312107, 0.9333333, 1, 0, 1,
-0.9362589, -0.6083882, -2.925748, 0.9254902, 1, 0, 1,
-0.9344463, -1.14584, -1.585219, 0.9215686, 1, 0, 1,
-0.9317436, 0.8237636, -1.164253, 0.9137255, 1, 0, 1,
-0.9162687, -0.6611646, -0.7623122, 0.9098039, 1, 0, 1,
-0.9154795, -1.677724, -2.689123, 0.9019608, 1, 0, 1,
-0.9099078, -0.9148125, -3.713985, 0.8941177, 1, 0, 1,
-0.9081087, -0.9268801, -2.894777, 0.8901961, 1, 0, 1,
-0.9061261, -0.744173, -1.456391, 0.8823529, 1, 0, 1,
-0.9052457, 1.34302, -0.5405023, 0.8784314, 1, 0, 1,
-0.9049867, 0.2490701, 0.6219224, 0.8705882, 1, 0, 1,
-0.9024077, -0.1725706, -1.464763, 0.8666667, 1, 0, 1,
-0.8947885, -2.268005, -2.046343, 0.8588235, 1, 0, 1,
-0.8917007, -0.3651962, 0.0449382, 0.854902, 1, 0, 1,
-0.890419, 0.4666468, -1.258552, 0.8470588, 1, 0, 1,
-0.8889604, -0.3673521, -2.972378, 0.8431373, 1, 0, 1,
-0.8811579, 1.776573, -0.03765732, 0.8352941, 1, 0, 1,
-0.879555, 1.43971, -0.7766251, 0.8313726, 1, 0, 1,
-0.8776564, 1.039936, -0.2392463, 0.8235294, 1, 0, 1,
-0.8743264, -0.5012342, -3.362074, 0.8196079, 1, 0, 1,
-0.8727215, 2.190538, -0.2386211, 0.8117647, 1, 0, 1,
-0.8726555, -0.6090559, -4.129514, 0.8078431, 1, 0, 1,
-0.8650612, -0.5621206, -2.002974, 0.8, 1, 0, 1,
-0.8648612, 1.673484, -0.8328898, 0.7921569, 1, 0, 1,
-0.8613245, 1.092287, -0.02797216, 0.7882353, 1, 0, 1,
-0.8594368, 0.6798743, -2.177967, 0.7803922, 1, 0, 1,
-0.8585224, 0.9341988, 0.5568157, 0.7764706, 1, 0, 1,
-0.8463064, -0.3155462, -0.7467843, 0.7686275, 1, 0, 1,
-0.8457592, 0.8276519, 0.7592972, 0.7647059, 1, 0, 1,
-0.8429398, 0.4675654, 0.1627221, 0.7568628, 1, 0, 1,
-0.834145, -0.4939463, -4.315192, 0.7529412, 1, 0, 1,
-0.8275632, 0.5247632, -1.742299, 0.7450981, 1, 0, 1,
-0.8237877, -1.186692, -2.201691, 0.7411765, 1, 0, 1,
-0.8171092, 0.4509317, -0.1878383, 0.7333333, 1, 0, 1,
-0.8138123, 0.449841, -1.284366, 0.7294118, 1, 0, 1,
-0.8046114, 2.44941, 0.009162406, 0.7215686, 1, 0, 1,
-0.7984154, 0.5619982, -2.055955, 0.7176471, 1, 0, 1,
-0.7958398, -0.3981983, -1.818668, 0.7098039, 1, 0, 1,
-0.795016, -0.4920878, -1.553085, 0.7058824, 1, 0, 1,
-0.7944046, -0.3750662, -2.877502, 0.6980392, 1, 0, 1,
-0.7929603, -0.4082897, -3.045601, 0.6901961, 1, 0, 1,
-0.7925841, -0.6278449, -1.634168, 0.6862745, 1, 0, 1,
-0.7909548, 0.2802068, -0.9987665, 0.6784314, 1, 0, 1,
-0.7797338, 0.589298, -0.2409351, 0.6745098, 1, 0, 1,
-0.7732687, 0.4602931, -0.7840335, 0.6666667, 1, 0, 1,
-0.7698014, 0.6673297, 0.02137526, 0.6627451, 1, 0, 1,
-0.7684215, -0.4071944, -2.315152, 0.654902, 1, 0, 1,
-0.7680344, -0.6734337, -0.002742886, 0.6509804, 1, 0, 1,
-0.7636992, 1.167562, -2.58729, 0.6431373, 1, 0, 1,
-0.7629092, -0.9087708, -3.853036, 0.6392157, 1, 0, 1,
-0.7608113, -0.379767, -0.6831366, 0.6313726, 1, 0, 1,
-0.7568922, -0.6472874, -1.889715, 0.627451, 1, 0, 1,
-0.75137, 0.08812568, -1.922848, 0.6196079, 1, 0, 1,
-0.7494096, -0.5902099, -1.136263, 0.6156863, 1, 0, 1,
-0.7446628, -0.6809629, -4.088326, 0.6078432, 1, 0, 1,
-0.7360507, 0.3980608, -1.349277, 0.6039216, 1, 0, 1,
-0.7358113, 1.207017, -0.03496124, 0.5960785, 1, 0, 1,
-0.7351661, 2.878235, -1.606589, 0.5882353, 1, 0, 1,
-0.7316716, -1.310328, -3.78806, 0.5843138, 1, 0, 1,
-0.7276422, 0.6874231, 0.182233, 0.5764706, 1, 0, 1,
-0.7239694, 1.746424, 0.4928225, 0.572549, 1, 0, 1,
-0.7232121, 0.5829722, -1.192693, 0.5647059, 1, 0, 1,
-0.7206063, -0.7440647, -2.725858, 0.5607843, 1, 0, 1,
-0.713312, -1.900512, -2.503957, 0.5529412, 1, 0, 1,
-0.710686, -0.7128932, -2.296951, 0.5490196, 1, 0, 1,
-0.7085105, 0.3227833, -1.36864, 0.5411765, 1, 0, 1,
-0.7061474, -0.3987779, -3.155893, 0.5372549, 1, 0, 1,
-0.7039344, 1.675097, 0.4326223, 0.5294118, 1, 0, 1,
-0.7034608, -0.2085537, -1.586575, 0.5254902, 1, 0, 1,
-0.6994756, 0.9762972, -0.2519692, 0.5176471, 1, 0, 1,
-0.6919685, 0.09073213, -0.8443517, 0.5137255, 1, 0, 1,
-0.6876391, -0.8859935, -1.19646, 0.5058824, 1, 0, 1,
-0.6865301, -0.6813601, -0.7337152, 0.5019608, 1, 0, 1,
-0.6857519, -0.4203082, -3.160799, 0.4941176, 1, 0, 1,
-0.6853961, 1.774103, -0.362061, 0.4862745, 1, 0, 1,
-0.6821339, -0.3891456, -1.748947, 0.4823529, 1, 0, 1,
-0.6800932, -0.8148192, -1.367147, 0.4745098, 1, 0, 1,
-0.6772955, -0.1461676, -2.576197, 0.4705882, 1, 0, 1,
-0.6766504, 0.2041231, -1.331039, 0.4627451, 1, 0, 1,
-0.6761795, 0.5578249, -0.8466173, 0.4588235, 1, 0, 1,
-0.6716414, 0.7696815, -1.258701, 0.4509804, 1, 0, 1,
-0.6706269, -0.1694613, -1.248122, 0.4470588, 1, 0, 1,
-0.6693414, -2.317631, -1.481602, 0.4392157, 1, 0, 1,
-0.6691752, 0.5872055, 1.898399, 0.4352941, 1, 0, 1,
-0.6681677, 0.3895459, -2.370633, 0.427451, 1, 0, 1,
-0.6634067, 1.173909, -0.5365213, 0.4235294, 1, 0, 1,
-0.653966, 0.3757106, -1.277012, 0.4156863, 1, 0, 1,
-0.6537704, -1.143645, -1.426354, 0.4117647, 1, 0, 1,
-0.6517316, -0.2722129, -0.7682324, 0.4039216, 1, 0, 1,
-0.6503485, -0.1470918, -1.667526, 0.3960784, 1, 0, 1,
-0.6487635, 0.9511496, -2.228617, 0.3921569, 1, 0, 1,
-0.6482515, -1.820227, -2.343796, 0.3843137, 1, 0, 1,
-0.6472131, -0.4920718, -2.433222, 0.3803922, 1, 0, 1,
-0.642294, 0.3697914, -1.310352, 0.372549, 1, 0, 1,
-0.6393324, -0.4523438, -3.631232, 0.3686275, 1, 0, 1,
-0.6327246, 0.7158155, -0.2575568, 0.3607843, 1, 0, 1,
-0.6282431, -0.4396914, -2.723912, 0.3568628, 1, 0, 1,
-0.6280205, 0.9629868, -0.01175855, 0.3490196, 1, 0, 1,
-0.625668, 0.02623887, -2.026967, 0.345098, 1, 0, 1,
-0.6188833, 1.60566, 0.3305196, 0.3372549, 1, 0, 1,
-0.6157298, 0.8133765, -0.03662739, 0.3333333, 1, 0, 1,
-0.6156323, 0.2905258, -0.5858904, 0.3254902, 1, 0, 1,
-0.61076, -1.184514, -2.564627, 0.3215686, 1, 0, 1,
-0.6091019, -0.4043713, -3.305816, 0.3137255, 1, 0, 1,
-0.6032099, 1.992905, -1.048254, 0.3098039, 1, 0, 1,
-0.6019875, 0.503415, -0.9039286, 0.3019608, 1, 0, 1,
-0.6019752, 0.4569526, -1.071241, 0.2941177, 1, 0, 1,
-0.5956298, 1.541502, -0.5296149, 0.2901961, 1, 0, 1,
-0.5922112, -0.6791391, -2.090401, 0.282353, 1, 0, 1,
-0.5903836, 0.2230672, -0.5231627, 0.2784314, 1, 0, 1,
-0.5889344, 1.942744, -0.2878321, 0.2705882, 1, 0, 1,
-0.5874038, -0.005351934, -1.714352, 0.2666667, 1, 0, 1,
-0.5837687, 0.32908, -1.091454, 0.2588235, 1, 0, 1,
-0.5802719, 0.5676392, -0.1627545, 0.254902, 1, 0, 1,
-0.5767902, -0.2265835, -1.591129, 0.2470588, 1, 0, 1,
-0.5766721, 0.78519, 0.2962035, 0.2431373, 1, 0, 1,
-0.574726, -0.4904518, -4.262802, 0.2352941, 1, 0, 1,
-0.573752, -0.9403921, -4.201985, 0.2313726, 1, 0, 1,
-0.5733634, -0.7922038, -3.674532, 0.2235294, 1, 0, 1,
-0.5687885, -1.613515, -3.126372, 0.2196078, 1, 0, 1,
-0.5620837, 0.570201, -1.225461, 0.2117647, 1, 0, 1,
-0.5476095, 1.166715, 0.6347861, 0.2078431, 1, 0, 1,
-0.5420124, -1.834574, -3.04546, 0.2, 1, 0, 1,
-0.5416017, 0.7932488, -2.196047, 0.1921569, 1, 0, 1,
-0.5412948, -1.494482, -3.592495, 0.1882353, 1, 0, 1,
-0.5406802, -0.8282228, -2.608458, 0.1803922, 1, 0, 1,
-0.5389351, 1.292941, -0.02360225, 0.1764706, 1, 0, 1,
-0.5338028, 0.9954221, -0.05517974, 0.1686275, 1, 0, 1,
-0.5336155, -1.330671, -2.759678, 0.1647059, 1, 0, 1,
-0.529739, -0.04172793, -1.411373, 0.1568628, 1, 0, 1,
-0.527528, -0.0801933, -0.4518518, 0.1529412, 1, 0, 1,
-0.5253693, -0.1145509, -0.6029591, 0.145098, 1, 0, 1,
-0.5197414, -0.4364045, -3.516672, 0.1411765, 1, 0, 1,
-0.5189411, 0.7425133, -1.335555, 0.1333333, 1, 0, 1,
-0.5179635, 0.2950312, 0.05135389, 0.1294118, 1, 0, 1,
-0.5159597, -0.5083579, -2.45347, 0.1215686, 1, 0, 1,
-0.5103189, 0.4769874, -0.622736, 0.1176471, 1, 0, 1,
-0.5086064, 1.886378, 0.1936526, 0.1098039, 1, 0, 1,
-0.5078158, -0.3959917, -2.846778, 0.1058824, 1, 0, 1,
-0.5077538, -1.177681, -0.1410238, 0.09803922, 1, 0, 1,
-0.5074714, 0.3545651, -1.727999, 0.09019608, 1, 0, 1,
-0.5054008, 0.2496964, -2.136228, 0.08627451, 1, 0, 1,
-0.5047528, 0.3272772, -2.072745, 0.07843138, 1, 0, 1,
-0.5011901, 0.3702703, -0.6298637, 0.07450981, 1, 0, 1,
-0.4995293, 0.369352, -1.111669, 0.06666667, 1, 0, 1,
-0.4935651, 0.3216077, 0.4904058, 0.0627451, 1, 0, 1,
-0.4920031, -0.05225485, -2.520834, 0.05490196, 1, 0, 1,
-0.4852818, -1.824965, -0.4401881, 0.05098039, 1, 0, 1,
-0.4779426, -1.019742, -4.036296, 0.04313726, 1, 0, 1,
-0.4778202, 1.700741, -0.9565596, 0.03921569, 1, 0, 1,
-0.4724893, -0.7443134, -2.878205, 0.03137255, 1, 0, 1,
-0.4670871, 0.3332387, -0.3867056, 0.02745098, 1, 0, 1,
-0.4629971, -0.1834041, -1.72034, 0.01960784, 1, 0, 1,
-0.4623578, 0.2088816, -0.8198078, 0.01568628, 1, 0, 1,
-0.4614998, -0.3454548, -0.6954832, 0.007843138, 1, 0, 1,
-0.4611487, -1.029234, -5.430876, 0.003921569, 1, 0, 1,
-0.4597435, -0.5237207, -2.08279, 0, 1, 0.003921569, 1,
-0.4548113, -0.9662012, -1.657037, 0, 1, 0.01176471, 1,
-0.443729, 0.1511206, -0.6333988, 0, 1, 0.01568628, 1,
-0.4423636, 1.045446, 0.5604197, 0, 1, 0.02352941, 1,
-0.4368474, -1.222027, -1.499652, 0, 1, 0.02745098, 1,
-0.4329112, -0.7252327, -1.142994, 0, 1, 0.03529412, 1,
-0.4262494, 0.2445021, -1.549236, 0, 1, 0.03921569, 1,
-0.4256015, 0.1587034, 0.2144567, 0, 1, 0.04705882, 1,
-0.4236726, -0.5735112, -3.429778, 0, 1, 0.05098039, 1,
-0.4226084, 0.1717072, -1.084754, 0, 1, 0.05882353, 1,
-0.4223153, -0.08022387, -1.138693, 0, 1, 0.0627451, 1,
-0.4168993, -1.79971, -0.7742658, 0, 1, 0.07058824, 1,
-0.4153591, 1.16838, 0.5246421, 0, 1, 0.07450981, 1,
-0.4140384, -0.4947419, -2.221217, 0, 1, 0.08235294, 1,
-0.41185, 0.4486577, -1.68553, 0, 1, 0.08627451, 1,
-0.4098583, -1.671764, -3.227025, 0, 1, 0.09411765, 1,
-0.4076982, 0.6684874, -0.4115404, 0, 1, 0.1019608, 1,
-0.4027332, -0.1215792, -2.246998, 0, 1, 0.1058824, 1,
-0.4026189, 0.9418958, -0.4122661, 0, 1, 0.1137255, 1,
-0.3994223, -2.006173, -5.323517, 0, 1, 0.1176471, 1,
-0.3956044, 0.1428788, -0.9458424, 0, 1, 0.1254902, 1,
-0.3869989, 0.1654324, -1.903167, 0, 1, 0.1294118, 1,
-0.3843125, 0.2544661, -1.44455, 0, 1, 0.1372549, 1,
-0.3833864, -0.03513503, -1.564367, 0, 1, 0.1411765, 1,
-0.380909, -0.1365756, -2.14698, 0, 1, 0.1490196, 1,
-0.3726516, 0.2474045, -1.26593, 0, 1, 0.1529412, 1,
-0.3677416, 1.793533, -2.789888, 0, 1, 0.1607843, 1,
-0.3660192, -1.291116, -2.542888, 0, 1, 0.1647059, 1,
-0.3660103, -0.7130364, -1.938728, 0, 1, 0.172549, 1,
-0.3644169, -0.8297538, -3.000106, 0, 1, 0.1764706, 1,
-0.3639098, 0.9466568, 0.4946476, 0, 1, 0.1843137, 1,
-0.3633803, 1.763304, 0.3507172, 0, 1, 0.1882353, 1,
-0.3625193, -2.122794, -2.194782, 0, 1, 0.1960784, 1,
-0.3613967, -0.6184551, -3.293345, 0, 1, 0.2039216, 1,
-0.3546097, -0.9455536, -5.150397, 0, 1, 0.2078431, 1,
-0.351626, -0.2867868, -3.274431, 0, 1, 0.2156863, 1,
-0.3510084, 0.7143979, -1.25066, 0, 1, 0.2196078, 1,
-0.3497781, -2.085154, -4.101169, 0, 1, 0.227451, 1,
-0.3478729, 0.6273592, -0.09134522, 0, 1, 0.2313726, 1,
-0.3436684, -0.8501537, -2.663182, 0, 1, 0.2392157, 1,
-0.3371743, 1.260401, -0.5034024, 0, 1, 0.2431373, 1,
-0.3266849, 0.7178827, -0.913364, 0, 1, 0.2509804, 1,
-0.3254456, 1.225619, -1.409024, 0, 1, 0.254902, 1,
-0.3222935, -0.3400096, -3.8193, 0, 1, 0.2627451, 1,
-0.3182468, 0.5692337, 1.040678, 0, 1, 0.2666667, 1,
-0.3128612, 1.599924, -1.593038, 0, 1, 0.2745098, 1,
-0.3073504, -0.7877327, -1.274114, 0, 1, 0.2784314, 1,
-0.2985677, -1.186264, -3.431028, 0, 1, 0.2862745, 1,
-0.2980722, -0.316473, -4.615103, 0, 1, 0.2901961, 1,
-0.2932725, -0.03579676, -0.6061033, 0, 1, 0.2980392, 1,
-0.2881583, 0.1861355, -2.773035, 0, 1, 0.3058824, 1,
-0.2864146, -0.2728902, -0.4542855, 0, 1, 0.3098039, 1,
-0.2804122, -0.02038089, -1.869076, 0, 1, 0.3176471, 1,
-0.2770563, 0.7389234, 0.4060108, 0, 1, 0.3215686, 1,
-0.2731402, 0.1631097, -1.749026, 0, 1, 0.3294118, 1,
-0.2692304, -1.141093, -2.909425, 0, 1, 0.3333333, 1,
-0.2625871, -2.103559, -3.201156, 0, 1, 0.3411765, 1,
-0.256564, -1.450503, -3.219313, 0, 1, 0.345098, 1,
-0.2546836, 0.2094126, -2.22192, 0, 1, 0.3529412, 1,
-0.2540745, 1.294378, -1.304573, 0, 1, 0.3568628, 1,
-0.2534789, 0.06890626, -2.231922, 0, 1, 0.3647059, 1,
-0.252095, 0.560792, -0.3482758, 0, 1, 0.3686275, 1,
-0.2460478, -1.43606, -2.798121, 0, 1, 0.3764706, 1,
-0.2427851, 0.6391011, -0.9934508, 0, 1, 0.3803922, 1,
-0.2425056, -1.70065, -2.401108, 0, 1, 0.3882353, 1,
-0.2383053, 0.001505156, -0.4388035, 0, 1, 0.3921569, 1,
-0.2301331, -0.8091357, -3.824011, 0, 1, 0.4, 1,
-0.2285847, 0.1311713, -1.026268, 0, 1, 0.4078431, 1,
-0.2240928, 1.805244, -0.3719581, 0, 1, 0.4117647, 1,
-0.2187208, -0.02779099, 0.6289122, 0, 1, 0.4196078, 1,
-0.2178262, 1.585229, -0.2434529, 0, 1, 0.4235294, 1,
-0.2170077, 0.1631148, -0.7274268, 0, 1, 0.4313726, 1,
-0.2124339, -0.5953519, -2.570127, 0, 1, 0.4352941, 1,
-0.2117043, 0.4496315, -1.913496, 0, 1, 0.4431373, 1,
-0.204972, -0.8733623, -1.962689, 0, 1, 0.4470588, 1,
-0.2039574, -1.145641, -3.85377, 0, 1, 0.454902, 1,
-0.2024104, -0.1373195, -1.716542, 0, 1, 0.4588235, 1,
-0.1970551, -0.1984451, -2.883886, 0, 1, 0.4666667, 1,
-0.1966726, -0.649312, -4.333207, 0, 1, 0.4705882, 1,
-0.1966106, 2.199137, -1.558468, 0, 1, 0.4784314, 1,
-0.1955168, -1.320759, -2.385745, 0, 1, 0.4823529, 1,
-0.1911526, -1.04687, -4.370308, 0, 1, 0.4901961, 1,
-0.1908939, 0.6064603, -0.5999699, 0, 1, 0.4941176, 1,
-0.1900796, 1.291397, 2.495695, 0, 1, 0.5019608, 1,
-0.1890431, 0.5887555, -0.5075104, 0, 1, 0.509804, 1,
-0.1864812, -0.5138566, -3.230867, 0, 1, 0.5137255, 1,
-0.1788658, -2.576431, -3.113957, 0, 1, 0.5215687, 1,
-0.1741623, 2.16271, -0.2522008, 0, 1, 0.5254902, 1,
-0.173942, -0.2331186, -3.107425, 0, 1, 0.5333334, 1,
-0.1695495, -0.3868925, -3.153167, 0, 1, 0.5372549, 1,
-0.1680638, -0.1177371, -2.17495, 0, 1, 0.5450981, 1,
-0.163297, -0.1154216, -0.965165, 0, 1, 0.5490196, 1,
-0.1624517, -0.2161066, -1.733212, 0, 1, 0.5568628, 1,
-0.1592743, 1.209612, 1.218666, 0, 1, 0.5607843, 1,
-0.1583582, -1.093497, -3.123174, 0, 1, 0.5686275, 1,
-0.1582976, -0.7158721, -2.607897, 0, 1, 0.572549, 1,
-0.1581911, -0.6205623, -1.691119, 0, 1, 0.5803922, 1,
-0.1571737, -1.394946, -3.445725, 0, 1, 0.5843138, 1,
-0.1561645, 1.40544, -0.2560907, 0, 1, 0.5921569, 1,
-0.1555781, -0.7660068, -2.058445, 0, 1, 0.5960785, 1,
-0.1549773, -0.6945139, -2.761999, 0, 1, 0.6039216, 1,
-0.1543469, -0.4848934, -2.00366, 0, 1, 0.6117647, 1,
-0.1458049, 0.3805236, 0.2070419, 0, 1, 0.6156863, 1,
-0.1447344, -0.5006177, -1.257796, 0, 1, 0.6235294, 1,
-0.1431713, -0.5483975, -1.990808, 0, 1, 0.627451, 1,
-0.1407664, 0.3278491, -0.4333961, 0, 1, 0.6352941, 1,
-0.1378882, -0.1542898, -2.765031, 0, 1, 0.6392157, 1,
-0.1375671, 0.5420858, -1.007255, 0, 1, 0.6470588, 1,
-0.137356, -1.339829, -2.388797, 0, 1, 0.6509804, 1,
-0.1355231, 0.04714446, -2.17304, 0, 1, 0.6588235, 1,
-0.1354349, -1.221367, -2.222924, 0, 1, 0.6627451, 1,
-0.1218664, -0.557991, -4.237974, 0, 1, 0.6705883, 1,
-0.1114675, -0.1434012, -4.789738, 0, 1, 0.6745098, 1,
-0.1108898, -0.2858467, -2.645456, 0, 1, 0.682353, 1,
-0.1098427, -1.133571, -3.197457, 0, 1, 0.6862745, 1,
-0.1096768, 1.159967, -0.5205321, 0, 1, 0.6941177, 1,
-0.0959734, 1.32263, -0.8234621, 0, 1, 0.7019608, 1,
-0.09328236, 0.1673237, -0.5677435, 0, 1, 0.7058824, 1,
-0.09205294, 0.3820155, 1.159948, 0, 1, 0.7137255, 1,
-0.08379547, -0.1285323, -3.900874, 0, 1, 0.7176471, 1,
-0.08327286, 0.3275962, -0.1065472, 0, 1, 0.7254902, 1,
-0.08298291, -0.1239914, -1.080672, 0, 1, 0.7294118, 1,
-0.08272482, -0.8244749, -3.475947, 0, 1, 0.7372549, 1,
-0.08211076, 0.9179095, -1.088826, 0, 1, 0.7411765, 1,
-0.08106745, -0.09989952, -3.386285, 0, 1, 0.7490196, 1,
-0.08075637, 0.8178211, -0.8863895, 0, 1, 0.7529412, 1,
-0.08058967, 0.2795952, 0.6123089, 0, 1, 0.7607843, 1,
-0.07919329, -0.6414478, -2.249523, 0, 1, 0.7647059, 1,
-0.07750471, 0.3215556, 0.1370646, 0, 1, 0.772549, 1,
-0.07698312, 1.949456, -0.6666372, 0, 1, 0.7764706, 1,
-0.07079486, -1.196311, -2.020923, 0, 1, 0.7843137, 1,
-0.07039375, 0.05015457, -1.678713, 0, 1, 0.7882353, 1,
-0.06736167, 0.06050481, -0.2061224, 0, 1, 0.7960784, 1,
-0.06704616, -0.5032309, -3.593709, 0, 1, 0.8039216, 1,
-0.06559122, 0.003217657, 0.8941802, 0, 1, 0.8078431, 1,
-0.06444738, 0.1628193, -2.631725, 0, 1, 0.8156863, 1,
-0.06444548, 0.198169, -0.3403927, 0, 1, 0.8196079, 1,
-0.06374721, -0.7969429, -1.344444, 0, 1, 0.827451, 1,
-0.0637259, 0.9472262, 0.03951193, 0, 1, 0.8313726, 1,
-0.06366105, 0.8851917, 1.509818, 0, 1, 0.8392157, 1,
-0.06225136, -0.7527704, -2.914142, 0, 1, 0.8431373, 1,
-0.06120506, 0.1039658, 1.555696, 0, 1, 0.8509804, 1,
-0.05550442, -0.370232, -2.699708, 0, 1, 0.854902, 1,
-0.0551697, 0.930777, -0.1848219, 0, 1, 0.8627451, 1,
-0.05439071, -0.5972517, -4.371302, 0, 1, 0.8666667, 1,
-0.05416094, -1.124684, -4.074571, 0, 1, 0.8745098, 1,
-0.05320854, -0.4198507, -1.238587, 0, 1, 0.8784314, 1,
-0.05290689, -0.349088, -2.031766, 0, 1, 0.8862745, 1,
-0.05135963, 0.8990802, -1.29975, 0, 1, 0.8901961, 1,
-0.05130988, 0.2962286, -0.620262, 0, 1, 0.8980392, 1,
-0.04578697, 0.02992043, -2.566503, 0, 1, 0.9058824, 1,
-0.04152271, -0.7264718, -2.765209, 0, 1, 0.9098039, 1,
-0.03767817, 0.07976799, -0.1556759, 0, 1, 0.9176471, 1,
-0.03527518, 1.010154, 0.4697159, 0, 1, 0.9215686, 1,
-0.03231701, 0.7168878, -0.2302001, 0, 1, 0.9294118, 1,
-0.03001593, -0.8688978, -4.388214, 0, 1, 0.9333333, 1,
-0.02652584, -0.3208491, -2.901011, 0, 1, 0.9411765, 1,
-0.02591527, -0.4829514, -2.993163, 0, 1, 0.945098, 1,
-0.0258246, -2.981109, -3.305867, 0, 1, 0.9529412, 1,
-0.02200798, 1.58886, -0.5145286, 0, 1, 0.9568627, 1,
-0.01914767, 2.356369, -0.2097695, 0, 1, 0.9647059, 1,
-0.01672509, 0.4332698, -0.3230489, 0, 1, 0.9686275, 1,
-0.0166842, 0.0139567, 0.2271317, 0, 1, 0.9764706, 1,
-0.01566825, -1.148363, -4.375916, 0, 1, 0.9803922, 1,
-0.01346049, 1.217838, 0.8155476, 0, 1, 0.9882353, 1,
-0.01260809, 0.489199, 0.1145472, 0, 1, 0.9921569, 1,
-0.009800063, 0.929845, 1.36111, 0, 1, 1, 1,
-0.007225048, -0.294549, -4.276191, 0, 0.9921569, 1, 1,
-0.007001858, -1.026128, -4.485608, 0, 0.9882353, 1, 1,
-0.006985609, -0.8338405, -3.568159, 0, 0.9803922, 1, 1,
-0.005704234, 0.8019704, -0.411536, 0, 0.9764706, 1, 1,
-0.005238994, -0.2530835, -3.764376, 0, 0.9686275, 1, 1,
-0.004611219, -0.08802503, -3.236736, 0, 0.9647059, 1, 1,
-4.037289e-05, 0.2174884, 2.006031, 0, 0.9568627, 1, 1,
4.369239e-05, -0.6278033, 3.809284, 0, 0.9529412, 1, 1,
0.002630234, -1.45567, 3.04992, 0, 0.945098, 1, 1,
0.006591141, 0.682336, -0.7199796, 0, 0.9411765, 1, 1,
0.00688293, -0.7645263, 2.876229, 0, 0.9333333, 1, 1,
0.007844497, 0.2450528, 0.2104829, 0, 0.9294118, 1, 1,
0.008196247, 1.779142, 1.29414, 0, 0.9215686, 1, 1,
0.01685878, -1.227076, 3.743086, 0, 0.9176471, 1, 1,
0.0173564, 0.110743, -0.4487551, 0, 0.9098039, 1, 1,
0.01772872, -0.03830877, 1.640047, 0, 0.9058824, 1, 1,
0.01838072, 0.8661769, 1.522559, 0, 0.8980392, 1, 1,
0.02240358, 0.7032517, -1.393918, 0, 0.8901961, 1, 1,
0.02853014, 0.3323357, 0.473512, 0, 0.8862745, 1, 1,
0.02925832, -0.7333494, 4.698215, 0, 0.8784314, 1, 1,
0.03154725, 0.3748111, -0.4196869, 0, 0.8745098, 1, 1,
0.03202421, -0.4339092, 1.367592, 0, 0.8666667, 1, 1,
0.03228018, -1.28077, 3.250793, 0, 0.8627451, 1, 1,
0.03257108, -0.4674871, 3.65942, 0, 0.854902, 1, 1,
0.033159, 0.09098218, 0.7740832, 0, 0.8509804, 1, 1,
0.03474951, 0.02184679, 1.073024, 0, 0.8431373, 1, 1,
0.03656017, 0.2702383, 0.6108561, 0, 0.8392157, 1, 1,
0.03728983, 0.4003249, -0.05573625, 0, 0.8313726, 1, 1,
0.0438992, -0.1379404, 1.309586, 0, 0.827451, 1, 1,
0.04507178, -0.4656947, 1.609868, 0, 0.8196079, 1, 1,
0.04666788, -0.07754886, 2.923752, 0, 0.8156863, 1, 1,
0.04752949, -0.1241284, 2.829227, 0, 0.8078431, 1, 1,
0.05120615, -0.8904613, 4.906375, 0, 0.8039216, 1, 1,
0.05259854, 0.1020832, 0.3907449, 0, 0.7960784, 1, 1,
0.05564038, 0.8594896, 1.199609, 0, 0.7882353, 1, 1,
0.0596756, -0.2975031, 3.324108, 0, 0.7843137, 1, 1,
0.06193315, 0.5407381, 0.7737069, 0, 0.7764706, 1, 1,
0.06552888, -2.434532, 3.07537, 0, 0.772549, 1, 1,
0.06556029, -0.7425129, 3.708408, 0, 0.7647059, 1, 1,
0.0667685, -1.050022, 0.9994299, 0, 0.7607843, 1, 1,
0.06912063, 0.5681973, 1.250296, 0, 0.7529412, 1, 1,
0.0693735, 0.1452806, 0.5512334, 0, 0.7490196, 1, 1,
0.0734671, -0.4358858, 3.495588, 0, 0.7411765, 1, 1,
0.07505739, -0.1277668, 2.749769, 0, 0.7372549, 1, 1,
0.0821328, -2.161932, 3.989581, 0, 0.7294118, 1, 1,
0.08296823, 0.7102686, -0.2666345, 0, 0.7254902, 1, 1,
0.08698365, 0.6039079, -0.71687, 0, 0.7176471, 1, 1,
0.0884429, -0.2041509, 2.404652, 0, 0.7137255, 1, 1,
0.09077505, -0.7490969, 3.832004, 0, 0.7058824, 1, 1,
0.09131911, 0.8772461, 1.035567, 0, 0.6980392, 1, 1,
0.09479548, 0.1296931, -0.3820734, 0, 0.6941177, 1, 1,
0.0976834, -0.2078677, 3.627185, 0, 0.6862745, 1, 1,
0.100497, 0.1913617, 1.451648, 0, 0.682353, 1, 1,
0.108328, -0.1582591, 1.990598, 0, 0.6745098, 1, 1,
0.1091857, -1.558463, 3.21442, 0, 0.6705883, 1, 1,
0.1126962, -0.7191906, 3.057306, 0, 0.6627451, 1, 1,
0.1172624, -0.1491553, 3.378918, 0, 0.6588235, 1, 1,
0.117933, 0.5913686, -0.3400053, 0, 0.6509804, 1, 1,
0.1194029, 1.349869, 0.8697214, 0, 0.6470588, 1, 1,
0.1241596, 0.2547801, 0.881476, 0, 0.6392157, 1, 1,
0.1265848, -1.016534, 3.168603, 0, 0.6352941, 1, 1,
0.127669, -1.107396, 2.556938, 0, 0.627451, 1, 1,
0.1291393, -0.2725194, 3.708436, 0, 0.6235294, 1, 1,
0.1300477, 0.884401, -0.5513911, 0, 0.6156863, 1, 1,
0.1321482, -0.2674028, 4.120032, 0, 0.6117647, 1, 1,
0.1334963, 0.4719599, -0.3151847, 0, 0.6039216, 1, 1,
0.1356873, -0.1025276, 1.021488, 0, 0.5960785, 1, 1,
0.1362766, 0.254785, -0.1088776, 0, 0.5921569, 1, 1,
0.1378907, -1.022311, 5.697386, 0, 0.5843138, 1, 1,
0.137942, -0.2023432, 2.447305, 0, 0.5803922, 1, 1,
0.1399999, -1.08446, 1.376203, 0, 0.572549, 1, 1,
0.1439384, -0.7355298, 3.474242, 0, 0.5686275, 1, 1,
0.1446579, -0.6768248, 2.159616, 0, 0.5607843, 1, 1,
0.1481258, -0.8306551, 4.06487, 0, 0.5568628, 1, 1,
0.149026, -0.8015309, 3.054886, 0, 0.5490196, 1, 1,
0.1499082, -0.1156833, 2.366133, 0, 0.5450981, 1, 1,
0.150581, 0.06771955, 0.1473589, 0, 0.5372549, 1, 1,
0.1506179, 1.045527, -0.4511501, 0, 0.5333334, 1, 1,
0.1529458, -0.2442689, 2.672645, 0, 0.5254902, 1, 1,
0.1543589, -1.183761, 1.298236, 0, 0.5215687, 1, 1,
0.1560562, -1.003707, 2.45229, 0, 0.5137255, 1, 1,
0.1593034, -0.7712495, 2.610812, 0, 0.509804, 1, 1,
0.1613622, -0.2328123, 1.363796, 0, 0.5019608, 1, 1,
0.1614033, 0.5322916, 2.317104, 0, 0.4941176, 1, 1,
0.1655515, 1.297357, -0.2075036, 0, 0.4901961, 1, 1,
0.1658022, 0.4631814, -1.651591, 0, 0.4823529, 1, 1,
0.1673983, 1.129901, 0.1593623, 0, 0.4784314, 1, 1,
0.1679852, -0.3690702, 1.860666, 0, 0.4705882, 1, 1,
0.1744031, -0.7474058, 2.985469, 0, 0.4666667, 1, 1,
0.1819043, -0.9293888, 3.608344, 0, 0.4588235, 1, 1,
0.1819435, 1.671883, -0.1043663, 0, 0.454902, 1, 1,
0.1838829, -0.4441494, 1.422172, 0, 0.4470588, 1, 1,
0.1840852, -2.368147, 5.088496, 0, 0.4431373, 1, 1,
0.1849824, 1.368232, 0.03821688, 0, 0.4352941, 1, 1,
0.1851715, -1.101005, 3.698028, 0, 0.4313726, 1, 1,
0.1900469, -0.7874937, 2.844076, 0, 0.4235294, 1, 1,
0.1906471, -0.6480837, 2.373319, 0, 0.4196078, 1, 1,
0.1928135, 1.379674, -0.04469399, 0, 0.4117647, 1, 1,
0.1954901, 1.047205, 0.307321, 0, 0.4078431, 1, 1,
0.1966295, 0.6164427, -1.343092, 0, 0.4, 1, 1,
0.1975989, 0.4787455, -0.5002152, 0, 0.3921569, 1, 1,
0.1978077, -2.195349, 3.355923, 0, 0.3882353, 1, 1,
0.2009245, -0.1729173, 0.8187774, 0, 0.3803922, 1, 1,
0.2073968, -0.07089674, 1.197559, 0, 0.3764706, 1, 1,
0.2103356, 0.1724336, 1.76753, 0, 0.3686275, 1, 1,
0.2111767, -0.5087673, 2.320753, 0, 0.3647059, 1, 1,
0.2127787, -0.3531333, 3.673924, 0, 0.3568628, 1, 1,
0.2128865, 0.470274, 1.356285, 0, 0.3529412, 1, 1,
0.2154995, -0.6071799, 3.479666, 0, 0.345098, 1, 1,
0.2210616, -1.461149, 2.746834, 0, 0.3411765, 1, 1,
0.2212289, -1.755469, 3.297132, 0, 0.3333333, 1, 1,
0.2219301, -0.6671016, 2.415931, 0, 0.3294118, 1, 1,
0.2260299, 0.1340892, 3.575476, 0, 0.3215686, 1, 1,
0.2293053, 2.163938, 0.5381691, 0, 0.3176471, 1, 1,
0.2295446, 0.2421771, 2.008265, 0, 0.3098039, 1, 1,
0.2309249, -0.662972, 2.199008, 0, 0.3058824, 1, 1,
0.2319851, 0.4015296, 1.607593, 0, 0.2980392, 1, 1,
0.2332178, -0.2030236, 4.11446, 0, 0.2901961, 1, 1,
0.2347374, 1.09809, 0.145709, 0, 0.2862745, 1, 1,
0.23586, 0.05150608, 2.576123, 0, 0.2784314, 1, 1,
0.2412163, 0.4569667, -0.2412862, 0, 0.2745098, 1, 1,
0.2433271, -1.246695, 1.808111, 0, 0.2666667, 1, 1,
0.2438208, 0.3501314, 1.332697, 0, 0.2627451, 1, 1,
0.2484181, 1.337428, -0.700214, 0, 0.254902, 1, 1,
0.249731, -0.4030894, 2.046345, 0, 0.2509804, 1, 1,
0.25253, 1.196016, -0.3572885, 0, 0.2431373, 1, 1,
0.2525309, 0.4600378, -0.6172379, 0, 0.2392157, 1, 1,
0.2533956, -0.244121, 3.618338, 0, 0.2313726, 1, 1,
0.2648487, 0.4235534, 1.86895, 0, 0.227451, 1, 1,
0.2687565, -0.1289162, 1.564295, 0, 0.2196078, 1, 1,
0.2740662, -2.007544, 3.322109, 0, 0.2156863, 1, 1,
0.2761507, 1.058592, 0.9997627, 0, 0.2078431, 1, 1,
0.2766602, -0.7872463, 2.094836, 0, 0.2039216, 1, 1,
0.2767185, -0.8321721, 2.589671, 0, 0.1960784, 1, 1,
0.2804161, 0.3091996, 2.5255, 0, 0.1882353, 1, 1,
0.2814335, 0.5587348, 1.049358, 0, 0.1843137, 1, 1,
0.2834036, -0.6311237, 2.780495, 0, 0.1764706, 1, 1,
0.2876734, -0.697204, 2.701592, 0, 0.172549, 1, 1,
0.2881011, -0.8442534, 3.455586, 0, 0.1647059, 1, 1,
0.2922908, 0.5195669, -0.2757161, 0, 0.1607843, 1, 1,
0.2934563, -0.6501243, 3.591415, 0, 0.1529412, 1, 1,
0.2953402, -0.6491387, 3.186775, 0, 0.1490196, 1, 1,
0.2971007, 0.02277133, 3.638233, 0, 0.1411765, 1, 1,
0.2986862, 0.3298607, 1.322711, 0, 0.1372549, 1, 1,
0.2990603, 1.008821, 0.6867651, 0, 0.1294118, 1, 1,
0.2996224, -1.216662, 3.144625, 0, 0.1254902, 1, 1,
0.3022637, 0.1385114, 1.813448, 0, 0.1176471, 1, 1,
0.3022994, 1.183473, 1.2617, 0, 0.1137255, 1, 1,
0.3036137, -1.409206, 2.885604, 0, 0.1058824, 1, 1,
0.3076262, -0.0468217, 3.85033, 0, 0.09803922, 1, 1,
0.3089546, 1.205759, 1.585028, 0, 0.09411765, 1, 1,
0.3129177, 2.656415, 1.476932, 0, 0.08627451, 1, 1,
0.3132909, 0.1209762, 0.4574917, 0, 0.08235294, 1, 1,
0.3136979, -0.01812238, 1.087506, 0, 0.07450981, 1, 1,
0.3190179, 0.3445922, 0.781499, 0, 0.07058824, 1, 1,
0.3266, -0.5570621, 3.724103, 0, 0.0627451, 1, 1,
0.3295633, -0.01933466, 0.417273, 0, 0.05882353, 1, 1,
0.3343024, 0.08339489, 2.356128, 0, 0.05098039, 1, 1,
0.3348989, -0.8522087, 1.95139, 0, 0.04705882, 1, 1,
0.3405845, 1.135651, 1.961949, 0, 0.03921569, 1, 1,
0.340786, 0.3771875, 0.2991313, 0, 0.03529412, 1, 1,
0.341372, -1.848712, 1.803433, 0, 0.02745098, 1, 1,
0.3458975, 2.327566, -1.465581, 0, 0.02352941, 1, 1,
0.3470103, -0.1102444, 3.651567, 0, 0.01568628, 1, 1,
0.3477578, 0.8940393, 0.6825911, 0, 0.01176471, 1, 1,
0.350047, -0.4738548, 2.961899, 0, 0.003921569, 1, 1,
0.3524828, -1.422624, 1.818945, 0.003921569, 0, 1, 1,
0.3600555, 1.759147, -0.3877859, 0.007843138, 0, 1, 1,
0.3628765, 0.3701052, 2.617814, 0.01568628, 0, 1, 1,
0.3636864, 0.3093022, 2.227748, 0.01960784, 0, 1, 1,
0.3640268, -0.9655678, 4.13015, 0.02745098, 0, 1, 1,
0.3676886, 1.448293, 0.07287058, 0.03137255, 0, 1, 1,
0.3698047, -1.876636, 2.472151, 0.03921569, 0, 1, 1,
0.3745336, -0.2016609, 1.541835, 0.04313726, 0, 1, 1,
0.3816546, -1.352546, 2.149874, 0.05098039, 0, 1, 1,
0.3875706, -0.6600555, 3.442372, 0.05490196, 0, 1, 1,
0.3924787, -0.1545241, 2.307507, 0.0627451, 0, 1, 1,
0.395845, 1.041598, 1.173043, 0.06666667, 0, 1, 1,
0.3974117, -2.134143, 2.852323, 0.07450981, 0, 1, 1,
0.4005172, -0.2590847, 1.602271, 0.07843138, 0, 1, 1,
0.4010406, 1.9511, 1.120241, 0.08627451, 0, 1, 1,
0.4018504, -0.3724132, 0.5269958, 0.09019608, 0, 1, 1,
0.4025603, 0.5178742, 1.365201, 0.09803922, 0, 1, 1,
0.4028249, -0.2833519, 4.36791, 0.1058824, 0, 1, 1,
0.4033118, 0.4171365, 0.814628, 0.1098039, 0, 1, 1,
0.4077686, 0.7455988, 3.143973, 0.1176471, 0, 1, 1,
0.4085385, -1.24464, 3.770303, 0.1215686, 0, 1, 1,
0.4091713, 1.370608, 0.3730326, 0.1294118, 0, 1, 1,
0.4138892, -1.155172, 4.699954, 0.1333333, 0, 1, 1,
0.414992, -0.1435997, 1.775367, 0.1411765, 0, 1, 1,
0.4151973, -1.929487, 3.435522, 0.145098, 0, 1, 1,
0.4220752, 1.512934, -1.349766, 0.1529412, 0, 1, 1,
0.4272936, 0.5514712, -0.2172768, 0.1568628, 0, 1, 1,
0.4364265, -0.07743755, 3.525267, 0.1647059, 0, 1, 1,
0.439768, 1.247735, 1.802133, 0.1686275, 0, 1, 1,
0.4401824, 0.7581232, 2.106508, 0.1764706, 0, 1, 1,
0.4460185, -0.1007013, 3.253146, 0.1803922, 0, 1, 1,
0.4498457, 1.094858, -0.07906591, 0.1882353, 0, 1, 1,
0.4556371, -0.5262042, 3.53316, 0.1921569, 0, 1, 1,
0.4556823, -0.6108615, 2.849337, 0.2, 0, 1, 1,
0.4630094, -1.406546, 2.55656, 0.2078431, 0, 1, 1,
0.4671833, 0.3111821, 1.091573, 0.2117647, 0, 1, 1,
0.473389, -1.757407, 3.059447, 0.2196078, 0, 1, 1,
0.4777134, 0.9402139, -0.07715503, 0.2235294, 0, 1, 1,
0.4789795, 1.160094, 0.2485628, 0.2313726, 0, 1, 1,
0.4821681, 0.3051535, 0.1294806, 0.2352941, 0, 1, 1,
0.4822873, -0.9711596, 2.947294, 0.2431373, 0, 1, 1,
0.4825233, -0.8313905, 3.276388, 0.2470588, 0, 1, 1,
0.4838492, 0.1133523, 0.4885868, 0.254902, 0, 1, 1,
0.4871915, -0.3178661, 0.07648575, 0.2588235, 0, 1, 1,
0.4896626, -0.08369379, 3.543812, 0.2666667, 0, 1, 1,
0.4897521, -0.3884776, 3.149179, 0.2705882, 0, 1, 1,
0.4907806, -0.7208394, 1.670267, 0.2784314, 0, 1, 1,
0.4927242, 1.749999, -0.456111, 0.282353, 0, 1, 1,
0.4969307, 0.2040821, 1.725625, 0.2901961, 0, 1, 1,
0.5019888, 0.150647, 0.7468745, 0.2941177, 0, 1, 1,
0.5106653, -0.2139093, 3.390645, 0.3019608, 0, 1, 1,
0.5113837, -0.3386296, 2.466623, 0.3098039, 0, 1, 1,
0.5115047, -0.20409, 2.480995, 0.3137255, 0, 1, 1,
0.51354, -0.9044813, 3.242923, 0.3215686, 0, 1, 1,
0.5148087, -0.4380231, 1.438783, 0.3254902, 0, 1, 1,
0.5194098, -0.07210846, 2.689417, 0.3333333, 0, 1, 1,
0.5216102, 1.095137, 0.5143896, 0.3372549, 0, 1, 1,
0.5233195, 0.2715607, 0.1482973, 0.345098, 0, 1, 1,
0.5259312, 0.931434, 1.188824, 0.3490196, 0, 1, 1,
0.5260367, -0.8987423, 3.461119, 0.3568628, 0, 1, 1,
0.5309668, -0.05789449, 2.806143, 0.3607843, 0, 1, 1,
0.5310615, 0.468239, 1.807149, 0.3686275, 0, 1, 1,
0.5319578, 2.286242, -0.1352614, 0.372549, 0, 1, 1,
0.534885, -0.6170981, 0.9213244, 0.3803922, 0, 1, 1,
0.5352558, -0.1849134, 2.006447, 0.3843137, 0, 1, 1,
0.5380242, -0.6363996, 2.658574, 0.3921569, 0, 1, 1,
0.5515121, -0.8676646, 0.6741444, 0.3960784, 0, 1, 1,
0.5565903, 0.9432396, -1.135023, 0.4039216, 0, 1, 1,
0.5595342, -0.1098389, 0.7924846, 0.4117647, 0, 1, 1,
0.5595688, -0.5619041, 3.192698, 0.4156863, 0, 1, 1,
0.5649973, 0.321752, 0.144946, 0.4235294, 0, 1, 1,
0.5690158, 1.142749, 0.6062438, 0.427451, 0, 1, 1,
0.5713187, -1.23851, 2.991582, 0.4352941, 0, 1, 1,
0.572592, 0.1549625, 0.5418878, 0.4392157, 0, 1, 1,
0.5735781, -0.1712254, 2.721586, 0.4470588, 0, 1, 1,
0.5738485, -0.5318315, 3.409765, 0.4509804, 0, 1, 1,
0.5768297, -0.7469382, 2.125412, 0.4588235, 0, 1, 1,
0.5783814, 0.2107599, 0.1635836, 0.4627451, 0, 1, 1,
0.582128, 0.06814837, 0.9556681, 0.4705882, 0, 1, 1,
0.5821366, -1.015966, 1.73794, 0.4745098, 0, 1, 1,
0.5854622, 1.4345, 1.14329, 0.4823529, 0, 1, 1,
0.586708, -0.4854381, 3.883851, 0.4862745, 0, 1, 1,
0.5949829, 0.01357929, 0.8045399, 0.4941176, 0, 1, 1,
0.597615, -0.313055, 2.327291, 0.5019608, 0, 1, 1,
0.5976698, 1.182568, -0.3965417, 0.5058824, 0, 1, 1,
0.6034989, 1.143515, -0.4552768, 0.5137255, 0, 1, 1,
0.6064199, -1.229325, 2.582144, 0.5176471, 0, 1, 1,
0.6083915, 0.071894, 0.357726, 0.5254902, 0, 1, 1,
0.6125576, -0.6350084, 2.047677, 0.5294118, 0, 1, 1,
0.6157995, 1.296705, -0.5086006, 0.5372549, 0, 1, 1,
0.6172342, -1.399098, 2.987282, 0.5411765, 0, 1, 1,
0.6216218, -0.7110141, 3.130037, 0.5490196, 0, 1, 1,
0.6222148, -0.9228876, 4.021704, 0.5529412, 0, 1, 1,
0.6225356, -0.5268463, 2.997391, 0.5607843, 0, 1, 1,
0.6262197, 0.5849402, 1.408148, 0.5647059, 0, 1, 1,
0.6291621, 0.5783905, 1.933069, 0.572549, 0, 1, 1,
0.6309052, -0.7151396, 0.7957222, 0.5764706, 0, 1, 1,
0.6309713, -0.4016864, 2.881263, 0.5843138, 0, 1, 1,
0.6317776, -0.610642, 0.2631371, 0.5882353, 0, 1, 1,
0.6485594, 0.5910128, 1.13186, 0.5960785, 0, 1, 1,
0.6499162, -1.272621, 2.540615, 0.6039216, 0, 1, 1,
0.6564935, -0.4044781, 3.958543, 0.6078432, 0, 1, 1,
0.6626644, -0.8196797, 3.817297, 0.6156863, 0, 1, 1,
0.6653021, -0.7825336, 2.067873, 0.6196079, 0, 1, 1,
0.6664429, -1.947491, 2.986747, 0.627451, 0, 1, 1,
0.6683521, -0.2845537, 1.78519, 0.6313726, 0, 1, 1,
0.6719894, -1.035759, 1.812268, 0.6392157, 0, 1, 1,
0.672011, -1.603572, 3.248157, 0.6431373, 0, 1, 1,
0.6728275, -0.5222827, 1.066128, 0.6509804, 0, 1, 1,
0.6730124, -1.114354, 2.741147, 0.654902, 0, 1, 1,
0.673888, 1.255132, 0.6754746, 0.6627451, 0, 1, 1,
0.6791601, 0.6727534, 1.983373, 0.6666667, 0, 1, 1,
0.6799992, 1.538661, -0.4234692, 0.6745098, 0, 1, 1,
0.6814518, 1.074944, 0.1300847, 0.6784314, 0, 1, 1,
0.6863305, 0.5333776, 1.291341, 0.6862745, 0, 1, 1,
0.6884092, -0.3978176, 2.184293, 0.6901961, 0, 1, 1,
0.6894642, -0.1592255, 1.117331, 0.6980392, 0, 1, 1,
0.7008724, -1.227045, 4.775534, 0.7058824, 0, 1, 1,
0.7012826, 0.2388528, 1.696653, 0.7098039, 0, 1, 1,
0.7039564, 0.6103385, 0.1432046, 0.7176471, 0, 1, 1,
0.707643, -0.6413418, 0.9377829, 0.7215686, 0, 1, 1,
0.7136149, -0.7562787, 2.524812, 0.7294118, 0, 1, 1,
0.7172839, -0.2249809, 2.74314, 0.7333333, 0, 1, 1,
0.7182859, 0.6255835, 0.4351018, 0.7411765, 0, 1, 1,
0.7219476, 0.04133689, 0.6319992, 0.7450981, 0, 1, 1,
0.723663, 0.02079278, 1.840467, 0.7529412, 0, 1, 1,
0.7242528, 0.731125, -0.7083142, 0.7568628, 0, 1, 1,
0.725041, -0.07741652, 2.66132, 0.7647059, 0, 1, 1,
0.7281463, -0.09957308, 1.511076, 0.7686275, 0, 1, 1,
0.7360353, -1.283231, 1.791129, 0.7764706, 0, 1, 1,
0.7407981, 0.6402401, 1.366972, 0.7803922, 0, 1, 1,
0.7432702, -1.479279, 1.791193, 0.7882353, 0, 1, 1,
0.7448977, 0.2587908, 1.917222, 0.7921569, 0, 1, 1,
0.7502068, -0.1695946, 2.855473, 0.8, 0, 1, 1,
0.7504161, -0.04938991, 2.288832, 0.8078431, 0, 1, 1,
0.7508984, -0.6734474, 2.786057, 0.8117647, 0, 1, 1,
0.7513065, 1.021695, 0.1794065, 0.8196079, 0, 1, 1,
0.7533284, -0.9721486, 3.537024, 0.8235294, 0, 1, 1,
0.756432, -2.047903, 2.331867, 0.8313726, 0, 1, 1,
0.7581232, -2.126055, 3.140368, 0.8352941, 0, 1, 1,
0.7661693, -1.142134, 3.612696, 0.8431373, 0, 1, 1,
0.7682965, 0.3244148, 2.414645, 0.8470588, 0, 1, 1,
0.7745525, -1.762179, 3.490663, 0.854902, 0, 1, 1,
0.7888604, 0.745568, 0.1336121, 0.8588235, 0, 1, 1,
0.790504, -0.198753, 2.59321, 0.8666667, 0, 1, 1,
0.7930733, 0.5320667, -0.01266473, 0.8705882, 0, 1, 1,
0.7971257, -0.4065517, 2.669712, 0.8784314, 0, 1, 1,
0.7988994, -0.4559899, 0.9595213, 0.8823529, 0, 1, 1,
0.7995107, 0.2239954, 2.657636, 0.8901961, 0, 1, 1,
0.799593, -0.03241204, 1.477656, 0.8941177, 0, 1, 1,
0.8026958, -1.39755, 4.393504, 0.9019608, 0, 1, 1,
0.8090456, -0.03762718, -0.1888748, 0.9098039, 0, 1, 1,
0.8099728, -0.06716644, 2.804816, 0.9137255, 0, 1, 1,
0.8108245, -0.07956453, 0.7165946, 0.9215686, 0, 1, 1,
0.8200139, -0.7386579, 3.082528, 0.9254902, 0, 1, 1,
0.8221167, 0.9703377, 0.06795592, 0.9333333, 0, 1, 1,
0.8356298, -0.5281945, 3.462236, 0.9372549, 0, 1, 1,
0.8441762, 1.330988, 2.367442, 0.945098, 0, 1, 1,
0.846578, 2.427202, 0.3710013, 0.9490196, 0, 1, 1,
0.8524852, -0.6320517, 1.378122, 0.9568627, 0, 1, 1,
0.8561864, 0.08125927, 1.779879, 0.9607843, 0, 1, 1,
0.85623, 0.09488529, 0.9326617, 0.9686275, 0, 1, 1,
0.8661141, -0.2108276, 1.66558, 0.972549, 0, 1, 1,
0.8696394, 0.9801711, 0.7875685, 0.9803922, 0, 1, 1,
0.8708889, -0.3595832, -0.04998186, 0.9843137, 0, 1, 1,
0.8762964, -0.009257266, 2.292737, 0.9921569, 0, 1, 1,
0.8829478, -0.347118, 2.519563, 0.9960784, 0, 1, 1,
0.8928204, -0.4274567, -0.2648014, 1, 0, 0.9960784, 1,
0.8982343, -2.755624, 2.212443, 1, 0, 0.9882353, 1,
0.9013684, 1.337362, 1.127473, 1, 0, 0.9843137, 1,
0.9016794, 0.4427715, 1.052216, 1, 0, 0.9764706, 1,
0.9062, -0.02144068, 2.31603, 1, 0, 0.972549, 1,
0.9063029, -0.6548857, 1.348433, 1, 0, 0.9647059, 1,
0.9093012, -0.4673954, 1.961743, 1, 0, 0.9607843, 1,
0.9093573, 0.3013891, 2.89121, 1, 0, 0.9529412, 1,
0.9124795, -1.207766, 2.675375, 1, 0, 0.9490196, 1,
0.9150785, 0.1315203, 1.268744, 1, 0, 0.9411765, 1,
0.9198732, -1.711084, 1.577904, 1, 0, 0.9372549, 1,
0.9204635, 0.104951, 1.973561, 1, 0, 0.9294118, 1,
0.9299645, -2.366948, 2.828127, 1, 0, 0.9254902, 1,
0.9369695, -0.3116319, 2.365632, 1, 0, 0.9176471, 1,
0.9383406, 0.6076652, 1.241946, 1, 0, 0.9137255, 1,
0.9493169, 0.4038302, 2.03585, 1, 0, 0.9058824, 1,
0.9571745, 1.832541, 0.2148445, 1, 0, 0.9019608, 1,
0.9572645, 0.4512915, 0.08773594, 1, 0, 0.8941177, 1,
0.9606219, -0.7863759, 3.381747, 1, 0, 0.8862745, 1,
0.9606916, 0.5630785, 0.7660155, 1, 0, 0.8823529, 1,
0.9619689, -0.5411937, 1.454833, 1, 0, 0.8745098, 1,
0.9630271, -1.172078, 1.893456, 1, 0, 0.8705882, 1,
0.9646997, -0.008550731, 1.562923, 1, 0, 0.8627451, 1,
0.965527, 0.01978838, 1.543641, 1, 0, 0.8588235, 1,
0.9745103, 1.469786, -0.82906, 1, 0, 0.8509804, 1,
0.9757869, -0.7680187, 2.610758, 1, 0, 0.8470588, 1,
0.9847753, 0.809207, 0.8555343, 1, 0, 0.8392157, 1,
0.9875497, 1.424644, 0.6301305, 1, 0, 0.8352941, 1,
0.9889063, 0.3135406, 2.018878, 1, 0, 0.827451, 1,
0.9968149, 0.7361635, 1.23869, 1, 0, 0.8235294, 1,
1.000821, -1.007597, 2.653852, 1, 0, 0.8156863, 1,
1.007537, 0.9587831, 0.8502368, 1, 0, 0.8117647, 1,
1.009056, -0.2999876, 2.551612, 1, 0, 0.8039216, 1,
1.009331, 0.6094822, 1.051392, 1, 0, 0.7960784, 1,
1.011124, -1.06015, 3.405603, 1, 0, 0.7921569, 1,
1.013918, 0.3057144, -0.4578985, 1, 0, 0.7843137, 1,
1.022214, 0.1208258, 2.325703, 1, 0, 0.7803922, 1,
1.040268, -0.512106, 2.394156, 1, 0, 0.772549, 1,
1.042051, 0.5117384, 2.540228, 1, 0, 0.7686275, 1,
1.043155, 0.2991505, 3.107198, 1, 0, 0.7607843, 1,
1.047488, 1.267865, 1.094423, 1, 0, 0.7568628, 1,
1.04778, -1.628146, 2.804929, 1, 0, 0.7490196, 1,
1.060735, 0.3467109, -0.6897393, 1, 0, 0.7450981, 1,
1.069582, 0.8531984, 2.716197, 1, 0, 0.7372549, 1,
1.072282, 1.254123, 0.9465155, 1, 0, 0.7333333, 1,
1.073244, 0.994011, 0.9004542, 1, 0, 0.7254902, 1,
1.081086, -0.5147783, 3.576576, 1, 0, 0.7215686, 1,
1.086862, -0.4320475, 2.210134, 1, 0, 0.7137255, 1,
1.08708, -0.7145733, 2.287461, 1, 0, 0.7098039, 1,
1.087508, 0.6115571, 1.583305, 1, 0, 0.7019608, 1,
1.092846, -1.260367, 1.973476, 1, 0, 0.6941177, 1,
1.099797, 1.283991, 0.3673577, 1, 0, 0.6901961, 1,
1.103876, -1.671329, 3.195735, 1, 0, 0.682353, 1,
1.106923, 0.07090349, 0.1914835, 1, 0, 0.6784314, 1,
1.114801, 1.604544, 0.516235, 1, 0, 0.6705883, 1,
1.117385, -0.7474486, 2.131402, 1, 0, 0.6666667, 1,
1.130106, 0.3783855, 0.6244844, 1, 0, 0.6588235, 1,
1.130557, -0.9056459, 0.9488014, 1, 0, 0.654902, 1,
1.13813, 1.441693, -0.8433425, 1, 0, 0.6470588, 1,
1.144967, -0.4877829, 1.425266, 1, 0, 0.6431373, 1,
1.145166, 0.4721429, 0.3445236, 1, 0, 0.6352941, 1,
1.1468, -0.3661161, 3.025875, 1, 0, 0.6313726, 1,
1.158193, 0.2067324, 2.70189, 1, 0, 0.6235294, 1,
1.158315, -1.261817, 1.370489, 1, 0, 0.6196079, 1,
1.170971, 1.288068, 0.7738945, 1, 0, 0.6117647, 1,
1.179953, 0.01631947, 1.63137, 1, 0, 0.6078432, 1,
1.181819, -0.5971604, 1.963593, 1, 0, 0.6, 1,
1.194844, -0.788167, 3.126588, 1, 0, 0.5921569, 1,
1.197304, 0.8755207, -0.7246079, 1, 0, 0.5882353, 1,
1.20217, 0.04177897, 1.353418, 1, 0, 0.5803922, 1,
1.202223, -0.6692044, 1.077576, 1, 0, 0.5764706, 1,
1.204392, -0.6125886, 1.47374, 1, 0, 0.5686275, 1,
1.220795, 0.160379, -1.123316, 1, 0, 0.5647059, 1,
1.224012, 0.2046966, 0.210436, 1, 0, 0.5568628, 1,
1.231051, 1.428278, 0.5503215, 1, 0, 0.5529412, 1,
1.243271, -1.759204, 3.159292, 1, 0, 0.5450981, 1,
1.244361, 1.972927, 2.503898, 1, 0, 0.5411765, 1,
1.249208, 1.256672, -0.416669, 1, 0, 0.5333334, 1,
1.255406, 0.2286491, 0.2295516, 1, 0, 0.5294118, 1,
1.260741, -0.1341142, 1.8564, 1, 0, 0.5215687, 1,
1.26107, -1.904497, 4.326349, 1, 0, 0.5176471, 1,
1.262171, -0.9918275, 1.045188, 1, 0, 0.509804, 1,
1.262334, 0.1506543, 1.851895, 1, 0, 0.5058824, 1,
1.265985, -0.55107, 1.552529, 1, 0, 0.4980392, 1,
1.269416, -0.6138898, -0.09431346, 1, 0, 0.4901961, 1,
1.313306, 0.339283, 2.002591, 1, 0, 0.4862745, 1,
1.319645, 0.02933475, 2.241596, 1, 0, 0.4784314, 1,
1.326454, -0.4158199, 2.813187, 1, 0, 0.4745098, 1,
1.329485, 0.5695713, 1.080174, 1, 0, 0.4666667, 1,
1.353016, 0.2318463, 0.9612315, 1, 0, 0.4627451, 1,
1.357662, 0.3124778, 1.432993, 1, 0, 0.454902, 1,
1.363535, -0.2149958, 1.899216, 1, 0, 0.4509804, 1,
1.365685, 0.8549379, 1.570867, 1, 0, 0.4431373, 1,
1.368499, 0.7302194, 1.168105, 1, 0, 0.4392157, 1,
1.371082, -0.3749557, 3.084921, 1, 0, 0.4313726, 1,
1.374784, -0.1856715, 0.2315451, 1, 0, 0.427451, 1,
1.375268, 0.9144064, 0.7528281, 1, 0, 0.4196078, 1,
1.382631, 0.05522325, 2.289877, 1, 0, 0.4156863, 1,
1.384433, -0.5645546, 0.9405244, 1, 0, 0.4078431, 1,
1.395718, -1.048607, 1.758601, 1, 0, 0.4039216, 1,
1.400382, 0.353378, 1.345925, 1, 0, 0.3960784, 1,
1.405957, 0.991958, 0.2262805, 1, 0, 0.3882353, 1,
1.406688, -0.01569702, 2.214002, 1, 0, 0.3843137, 1,
1.410367, -1.243263, 0.07778712, 1, 0, 0.3764706, 1,
1.411029, 0.0628291, 1.45822, 1, 0, 0.372549, 1,
1.424407, -0.9072775, 1.3573, 1, 0, 0.3647059, 1,
1.425274, 0.4837041, 0.4173841, 1, 0, 0.3607843, 1,
1.458001, 0.4872175, 1.103423, 1, 0, 0.3529412, 1,
1.46292, -0.3661245, 2.755285, 1, 0, 0.3490196, 1,
1.466865, -2.336118, 2.637221, 1, 0, 0.3411765, 1,
1.473173, 0.003312798, 2.04631, 1, 0, 0.3372549, 1,
1.475505, 0.1437539, 0.6451442, 1, 0, 0.3294118, 1,
1.514871, -0.5140235, 3.708465, 1, 0, 0.3254902, 1,
1.527171, 0.4025182, 1.708942, 1, 0, 0.3176471, 1,
1.528963, 3.263171, -0.4933704, 1, 0, 0.3137255, 1,
1.535545, 0.5269191, 1.483521, 1, 0, 0.3058824, 1,
1.567301, 0.8207475, 0.6280018, 1, 0, 0.2980392, 1,
1.578301, -0.09434895, -0.3776355, 1, 0, 0.2941177, 1,
1.57854, 1.129004, 0.3171276, 1, 0, 0.2862745, 1,
1.589528, 0.01809376, 3.230552, 1, 0, 0.282353, 1,
1.589914, 0.9076694, 1.478893, 1, 0, 0.2745098, 1,
1.594579, -1.115864, 2.268568, 1, 0, 0.2705882, 1,
1.600216, -0.0319907, 2.29586, 1, 0, 0.2627451, 1,
1.606512, -0.949471, 2.9582, 1, 0, 0.2588235, 1,
1.613324, -1.973244, 3.647747, 1, 0, 0.2509804, 1,
1.617067, -1.107767, 1.012368, 1, 0, 0.2470588, 1,
1.618082, 1.700353, 2.124583, 1, 0, 0.2392157, 1,
1.627962, -1.819234, 3.379001, 1, 0, 0.2352941, 1,
1.62912, 1.456743, 0.1595873, 1, 0, 0.227451, 1,
1.640227, 0.8245844, 0.4589577, 1, 0, 0.2235294, 1,
1.644348, -0.1542411, 0.5639712, 1, 0, 0.2156863, 1,
1.650074, -0.4668186, 2.357882, 1, 0, 0.2117647, 1,
1.665953, 0.1387229, 0.72897, 1, 0, 0.2039216, 1,
1.678018, -0.3881167, 1.781713, 1, 0, 0.1960784, 1,
1.678498, 1.27672, 0.5888746, 1, 0, 0.1921569, 1,
1.699515, 1.387357, 0.809405, 1, 0, 0.1843137, 1,
1.70542, 0.6715369, 1.044514, 1, 0, 0.1803922, 1,
1.712169, -0.3251082, 2.69924, 1, 0, 0.172549, 1,
1.724556, 0.7478342, 0.03502534, 1, 0, 0.1686275, 1,
1.734899, 0.5518285, -0.01893474, 1, 0, 0.1607843, 1,
1.749241, -0.08754562, 0.4263687, 1, 0, 0.1568628, 1,
1.766023, 1.952661, -0.09642822, 1, 0, 0.1490196, 1,
1.767167, 0.5754279, 1.24512, 1, 0, 0.145098, 1,
1.77803, -1.264571, 3.624436, 1, 0, 0.1372549, 1,
1.804252, -0.481847, 1.724146, 1, 0, 0.1333333, 1,
1.8141, -0.7680133, 2.371868, 1, 0, 0.1254902, 1,
1.815804, 1.096944, 0.5089031, 1, 0, 0.1215686, 1,
1.832605, 0.5575995, 0.838566, 1, 0, 0.1137255, 1,
1.843058, -2.549155, 2.059216, 1, 0, 0.1098039, 1,
1.858871, -0.3265509, 1.316512, 1, 0, 0.1019608, 1,
1.863839, 1.060829, -0.785875, 1, 0, 0.09411765, 1,
1.866714, 0.2807366, 1.504962, 1, 0, 0.09019608, 1,
1.874165, 0.109702, 2.093283, 1, 0, 0.08235294, 1,
1.875687, -0.3986905, 2.460806, 1, 0, 0.07843138, 1,
1.89962, 0.2738753, 0.9892166, 1, 0, 0.07058824, 1,
1.942078, -0.1124543, 0.9985103, 1, 0, 0.06666667, 1,
2.002712, 1.917961, 1.336197, 1, 0, 0.05882353, 1,
2.016816, -0.1924453, 1.021146, 1, 0, 0.05490196, 1,
2.127837, 0.5331641, 1.317407, 1, 0, 0.04705882, 1,
2.193869, -0.2935238, 1.668341, 1, 0, 0.04313726, 1,
2.217207, 0.1656433, 0.8261455, 1, 0, 0.03529412, 1,
2.247394, 0.1019229, 1.263358, 1, 0, 0.03137255, 1,
2.272462, 0.2527325, 1.492133, 1, 0, 0.02352941, 1,
2.399351, -0.3257631, 1.987993, 1, 0, 0.01960784, 1,
2.429757, 0.4614225, 0.8396888, 1, 0, 0.01176471, 1,
2.946422, 1.740812, 1.489739, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.1668915, -4.039515, -7.317116, 0, -0.5, 0.5, 0.5,
-0.1668915, -4.039515, -7.317116, 1, -0.5, 0.5, 0.5,
-0.1668915, -4.039515, -7.317116, 1, 1.5, 0.5, 0.5,
-0.1668915, -4.039515, -7.317116, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.335618, 0.141031, -7.317116, 0, -0.5, 0.5, 0.5,
-4.335618, 0.141031, -7.317116, 1, -0.5, 0.5, 0.5,
-4.335618, 0.141031, -7.317116, 1, 1.5, 0.5, 0.5,
-4.335618, 0.141031, -7.317116, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.335618, -4.039515, 0.133255, 0, -0.5, 0.5, 0.5,
-4.335618, -4.039515, 0.133255, 1, -0.5, 0.5, 0.5,
-4.335618, -4.039515, 0.133255, 1, 1.5, 0.5, 0.5,
-4.335618, -4.039515, 0.133255, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.074774, -5.5978,
2, -3.074774, -5.5978,
-3, -3.074774, -5.5978,
-3, -3.235564, -5.884352,
-2, -3.074774, -5.5978,
-2, -3.235564, -5.884352,
-1, -3.074774, -5.5978,
-1, -3.235564, -5.884352,
0, -3.074774, -5.5978,
0, -3.235564, -5.884352,
1, -3.074774, -5.5978,
1, -3.235564, -5.884352,
2, -3.074774, -5.5978,
2, -3.235564, -5.884352
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.557144, -6.457458, 0, -0.5, 0.5, 0.5,
-3, -3.557144, -6.457458, 1, -0.5, 0.5, 0.5,
-3, -3.557144, -6.457458, 1, 1.5, 0.5, 0.5,
-3, -3.557144, -6.457458, 0, 1.5, 0.5, 0.5,
-2, -3.557144, -6.457458, 0, -0.5, 0.5, 0.5,
-2, -3.557144, -6.457458, 1, -0.5, 0.5, 0.5,
-2, -3.557144, -6.457458, 1, 1.5, 0.5, 0.5,
-2, -3.557144, -6.457458, 0, 1.5, 0.5, 0.5,
-1, -3.557144, -6.457458, 0, -0.5, 0.5, 0.5,
-1, -3.557144, -6.457458, 1, -0.5, 0.5, 0.5,
-1, -3.557144, -6.457458, 1, 1.5, 0.5, 0.5,
-1, -3.557144, -6.457458, 0, 1.5, 0.5, 0.5,
0, -3.557144, -6.457458, 0, -0.5, 0.5, 0.5,
0, -3.557144, -6.457458, 1, -0.5, 0.5, 0.5,
0, -3.557144, -6.457458, 1, 1.5, 0.5, 0.5,
0, -3.557144, -6.457458, 0, 1.5, 0.5, 0.5,
1, -3.557144, -6.457458, 0, -0.5, 0.5, 0.5,
1, -3.557144, -6.457458, 1, -0.5, 0.5, 0.5,
1, -3.557144, -6.457458, 1, 1.5, 0.5, 0.5,
1, -3.557144, -6.457458, 0, 1.5, 0.5, 0.5,
2, -3.557144, -6.457458, 0, -0.5, 0.5, 0.5,
2, -3.557144, -6.457458, 1, -0.5, 0.5, 0.5,
2, -3.557144, -6.457458, 1, 1.5, 0.5, 0.5,
2, -3.557144, -6.457458, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.373605, -2, -5.5978,
-3.373605, 3, -5.5978,
-3.373605, -2, -5.5978,
-3.53394, -2, -5.884352,
-3.373605, -1, -5.5978,
-3.53394, -1, -5.884352,
-3.373605, 0, -5.5978,
-3.53394, 0, -5.884352,
-3.373605, 1, -5.5978,
-3.53394, 1, -5.884352,
-3.373605, 2, -5.5978,
-3.53394, 2, -5.884352,
-3.373605, 3, -5.5978,
-3.53394, 3, -5.884352
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.854612, -2, -6.457458, 0, -0.5, 0.5, 0.5,
-3.854612, -2, -6.457458, 1, -0.5, 0.5, 0.5,
-3.854612, -2, -6.457458, 1, 1.5, 0.5, 0.5,
-3.854612, -2, -6.457458, 0, 1.5, 0.5, 0.5,
-3.854612, -1, -6.457458, 0, -0.5, 0.5, 0.5,
-3.854612, -1, -6.457458, 1, -0.5, 0.5, 0.5,
-3.854612, -1, -6.457458, 1, 1.5, 0.5, 0.5,
-3.854612, -1, -6.457458, 0, 1.5, 0.5, 0.5,
-3.854612, 0, -6.457458, 0, -0.5, 0.5, 0.5,
-3.854612, 0, -6.457458, 1, -0.5, 0.5, 0.5,
-3.854612, 0, -6.457458, 1, 1.5, 0.5, 0.5,
-3.854612, 0, -6.457458, 0, 1.5, 0.5, 0.5,
-3.854612, 1, -6.457458, 0, -0.5, 0.5, 0.5,
-3.854612, 1, -6.457458, 1, -0.5, 0.5, 0.5,
-3.854612, 1, -6.457458, 1, 1.5, 0.5, 0.5,
-3.854612, 1, -6.457458, 0, 1.5, 0.5, 0.5,
-3.854612, 2, -6.457458, 0, -0.5, 0.5, 0.5,
-3.854612, 2, -6.457458, 1, -0.5, 0.5, 0.5,
-3.854612, 2, -6.457458, 1, 1.5, 0.5, 0.5,
-3.854612, 2, -6.457458, 0, 1.5, 0.5, 0.5,
-3.854612, 3, -6.457458, 0, -0.5, 0.5, 0.5,
-3.854612, 3, -6.457458, 1, -0.5, 0.5, 0.5,
-3.854612, 3, -6.457458, 1, 1.5, 0.5, 0.5,
-3.854612, 3, -6.457458, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.373605, -3.074774, -4,
-3.373605, -3.074774, 4,
-3.373605, -3.074774, -4,
-3.53394, -3.235564, -4,
-3.373605, -3.074774, -2,
-3.53394, -3.235564, -2,
-3.373605, -3.074774, 0,
-3.53394, -3.235564, 0,
-3.373605, -3.074774, 2,
-3.53394, -3.235564, 2,
-3.373605, -3.074774, 4,
-3.53394, -3.235564, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.854612, -3.557144, -4, 0, -0.5, 0.5, 0.5,
-3.854612, -3.557144, -4, 1, -0.5, 0.5, 0.5,
-3.854612, -3.557144, -4, 1, 1.5, 0.5, 0.5,
-3.854612, -3.557144, -4, 0, 1.5, 0.5, 0.5,
-3.854612, -3.557144, -2, 0, -0.5, 0.5, 0.5,
-3.854612, -3.557144, -2, 1, -0.5, 0.5, 0.5,
-3.854612, -3.557144, -2, 1, 1.5, 0.5, 0.5,
-3.854612, -3.557144, -2, 0, 1.5, 0.5, 0.5,
-3.854612, -3.557144, 0, 0, -0.5, 0.5, 0.5,
-3.854612, -3.557144, 0, 1, -0.5, 0.5, 0.5,
-3.854612, -3.557144, 0, 1, 1.5, 0.5, 0.5,
-3.854612, -3.557144, 0, 0, 1.5, 0.5, 0.5,
-3.854612, -3.557144, 2, 0, -0.5, 0.5, 0.5,
-3.854612, -3.557144, 2, 1, -0.5, 0.5, 0.5,
-3.854612, -3.557144, 2, 1, 1.5, 0.5, 0.5,
-3.854612, -3.557144, 2, 0, 1.5, 0.5, 0.5,
-3.854612, -3.557144, 4, 0, -0.5, 0.5, 0.5,
-3.854612, -3.557144, 4, 1, -0.5, 0.5, 0.5,
-3.854612, -3.557144, 4, 1, 1.5, 0.5, 0.5,
-3.854612, -3.557144, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.373605, -3.074774, -5.5978,
-3.373605, 3.356836, -5.5978,
-3.373605, -3.074774, 5.86431,
-3.373605, 3.356836, 5.86431,
-3.373605, -3.074774, -5.5978,
-3.373605, -3.074774, 5.86431,
-3.373605, 3.356836, -5.5978,
-3.373605, 3.356836, 5.86431,
-3.373605, -3.074774, -5.5978,
3.039822, -3.074774, -5.5978,
-3.373605, -3.074774, 5.86431,
3.039822, -3.074774, 5.86431,
-3.373605, 3.356836, -5.5978,
3.039822, 3.356836, -5.5978,
-3.373605, 3.356836, 5.86431,
3.039822, 3.356836, 5.86431,
3.039822, -3.074774, -5.5978,
3.039822, 3.356836, -5.5978,
3.039822, -3.074774, 5.86431,
3.039822, 3.356836, 5.86431,
3.039822, -3.074774, -5.5978,
3.039822, -3.074774, 5.86431,
3.039822, 3.356836, -5.5978,
3.039822, 3.356836, 5.86431
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.809228;
var distance = 34.74414;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1668915, -0.141031, -0.133255 );
mvMatrix.scale( 1.316533, 1.312811, 0.7366437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74414);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Parathion<-read.table("Parathion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Parathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Parathion' not found
```

```r
y<-Parathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Parathion' not found
```

```r
z<-Parathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Parathion' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.280205, 0.4323071, -1.557962, 0, 0, 1, 1, 1,
-2.603164, 0.2069932, -0.271473, 1, 0, 0, 1, 1,
-2.597935, -0.8363836, -1.838395, 1, 0, 0, 1, 1,
-2.550953, -0.7398301, -0.526162, 1, 0, 0, 1, 1,
-2.544861, 1.253331, -1.998752, 1, 0, 0, 1, 1,
-2.542746, 0.6525272, -1.614445, 1, 0, 0, 1, 1,
-2.49005, 0.1818291, -0.5482288, 0, 0, 0, 1, 1,
-2.449768, 0.9934749, 0.0553451, 0, 0, 0, 1, 1,
-2.42868, 1.72585, -0.9454781, 0, 0, 0, 1, 1,
-2.40213, -2.430278, -2.680167, 0, 0, 0, 1, 1,
-2.359616, -1.033046, -2.45072, 0, 0, 0, 1, 1,
-2.332753, 2.870117, 0.6454973, 0, 0, 0, 1, 1,
-2.319778, 1.457687, -0.05510002, 0, 0, 0, 1, 1,
-2.228899, -1.46832, -3.237511, 1, 1, 1, 1, 1,
-2.193233, -0.1323825, -1.247774, 1, 1, 1, 1, 1,
-2.188559, -1.120573, -1.56589, 1, 1, 1, 1, 1,
-2.177439, -0.2533754, -4.11542, 1, 1, 1, 1, 1,
-2.146567, 0.445514, 0.1403587, 1, 1, 1, 1, 1,
-2.143896, 0.5252246, -0.08941118, 1, 1, 1, 1, 1,
-2.130973, 1.711558, 0.4975723, 1, 1, 1, 1, 1,
-2.12569, 1.17189, -1.996373, 1, 1, 1, 1, 1,
-2.122475, 0.123043, 0.2618648, 1, 1, 1, 1, 1,
-2.117054, 0.8962702, 0.2188426, 1, 1, 1, 1, 1,
-2.105188, 0.5390052, -2.020145, 1, 1, 1, 1, 1,
-2.062106, 0.2177669, -2.071232, 1, 1, 1, 1, 1,
-2.038174, -0.1149176, -2.694273, 1, 1, 1, 1, 1,
-2.029857, -1.529095, -1.921231, 1, 1, 1, 1, 1,
-1.986592, -2.15553, -2.148848, 1, 1, 1, 1, 1,
-1.983576, 0.6541625, -1.885351, 0, 0, 1, 1, 1,
-1.94211, 0.6046062, -0.7748737, 1, 0, 0, 1, 1,
-1.919329, 0.1101536, -0.8766434, 1, 0, 0, 1, 1,
-1.916965, -0.2270338, -0.8541959, 1, 0, 0, 1, 1,
-1.907694, 0.6620843, 0.397799, 1, 0, 0, 1, 1,
-1.840936, -1.368034, -1.887424, 1, 0, 0, 1, 1,
-1.819842, 0.129793, -0.8653691, 0, 0, 0, 1, 1,
-1.812732, -0.6546725, -1.912215, 0, 0, 0, 1, 1,
-1.800535, -1.62514, -2.2236, 0, 0, 0, 1, 1,
-1.795231, -1.142259, -2.940507, 0, 0, 0, 1, 1,
-1.79027, -0.03365101, -1.941735, 0, 0, 0, 1, 1,
-1.738982, 0.1194491, -0.4926176, 0, 0, 0, 1, 1,
-1.728673, -0.3007393, -1.657872, 0, 0, 0, 1, 1,
-1.726963, -0.859989, -3.101108, 1, 1, 1, 1, 1,
-1.724299, -1.913704, -3.308409, 1, 1, 1, 1, 1,
-1.723079, 0.6682267, -2.695052, 1, 1, 1, 1, 1,
-1.698434, 1.424073, 0.6834425, 1, 1, 1, 1, 1,
-1.694373, -0.8856842, -0.03852586, 1, 1, 1, 1, 1,
-1.693945, 0.6922268, -1.829108, 1, 1, 1, 1, 1,
-1.69313, -0.2524956, -2.567239, 1, 1, 1, 1, 1,
-1.688159, -1.711898, -3.29334, 1, 1, 1, 1, 1,
-1.687577, -0.4364798, -3.216758, 1, 1, 1, 1, 1,
-1.687193, 0.1938216, -1.277132, 1, 1, 1, 1, 1,
-1.685873, 0.2511313, -0.1070778, 1, 1, 1, 1, 1,
-1.683317, -1.778901, -2.540907, 1, 1, 1, 1, 1,
-1.678629, 1.143408, -0.3243483, 1, 1, 1, 1, 1,
-1.675136, 0.1980518, -1.855724, 1, 1, 1, 1, 1,
-1.665763, 1.473855, -0.5687789, 1, 1, 1, 1, 1,
-1.651396, 0.06265312, -1.455266, 0, 0, 1, 1, 1,
-1.648821, 0.403, -3.301672, 1, 0, 0, 1, 1,
-1.63903, -0.6804856, -2.198435, 1, 0, 0, 1, 1,
-1.617758, 1.334386, 0.0643848, 1, 0, 0, 1, 1,
-1.613205, 0.6854379, 1.007758, 1, 0, 0, 1, 1,
-1.576852, -0.3270727, -1.551686, 1, 0, 0, 1, 1,
-1.576497, -0.5349365, -2.58794, 0, 0, 0, 1, 1,
-1.565506, -0.3695023, -1.669813, 0, 0, 0, 1, 1,
-1.559885, 0.3108818, -2.12637, 0, 0, 0, 1, 1,
-1.515643, 0.3145356, 0.3299326, 0, 0, 0, 1, 1,
-1.505429, 0.0002673272, -1.978788, 0, 0, 0, 1, 1,
-1.495768, 0.09545256, -0.752287, 0, 0, 0, 1, 1,
-1.490568, 0.2005668, -1.813428, 0, 0, 0, 1, 1,
-1.486468, 1.332872, -2.164245, 1, 1, 1, 1, 1,
-1.477485, 1.843549, -0.9634224, 1, 1, 1, 1, 1,
-1.473255, -0.3652074, -1.269824, 1, 1, 1, 1, 1,
-1.46913, 0.9856452, -1.881588, 1, 1, 1, 1, 1,
-1.455598, 2.131803, -0.7059739, 1, 1, 1, 1, 1,
-1.45547, -1.401983, -2.498697, 1, 1, 1, 1, 1,
-1.453482, 1.166199, -0.8224649, 1, 1, 1, 1, 1,
-1.441173, 0.4120844, -2.80923, 1, 1, 1, 1, 1,
-1.437865, 0.2126108, -2.178108, 1, 1, 1, 1, 1,
-1.435659, 2.384454, 0.06490752, 1, 1, 1, 1, 1,
-1.435276, 1.383326, -0.6171099, 1, 1, 1, 1, 1,
-1.429117, -0.7233085, -3.066151, 1, 1, 1, 1, 1,
-1.42607, -1.153004, -2.741045, 1, 1, 1, 1, 1,
-1.42384, 0.5035468, -2.18964, 1, 1, 1, 1, 1,
-1.405504, -0.174992, -0.8464353, 1, 1, 1, 1, 1,
-1.402653, 0.709487, -2.847756, 0, 0, 1, 1, 1,
-1.397943, 0.5682548, 0.526774, 1, 0, 0, 1, 1,
-1.380841, 0.1436054, -1.40918, 1, 0, 0, 1, 1,
-1.375394, -0.7447636, -2.724669, 1, 0, 0, 1, 1,
-1.373757, -0.7892323, -0.8858107, 1, 0, 0, 1, 1,
-1.361936, 2.087788, 0.8775752, 1, 0, 0, 1, 1,
-1.361243, -0.5967359, -2.404276, 0, 0, 0, 1, 1,
-1.351685, 0.2470869, -2.111288, 0, 0, 0, 1, 1,
-1.350559, -0.2766515, -1.785688, 0, 0, 0, 1, 1,
-1.335579, 0.7638621, -1.004744, 0, 0, 0, 1, 1,
-1.321386, -0.01699084, -1.249784, 0, 0, 0, 1, 1,
-1.316561, -0.4023136, -1.584629, 0, 0, 0, 1, 1,
-1.308326, -1.403076, -3.61443, 0, 0, 0, 1, 1,
-1.294513, -1.220762, -2.731172, 1, 1, 1, 1, 1,
-1.293734, -0.9211226, -3.015141, 1, 1, 1, 1, 1,
-1.290699, -1.778637, -0.817655, 1, 1, 1, 1, 1,
-1.289017, -1.389948, -2.091027, 1, 1, 1, 1, 1,
-1.281045, 0.2624273, -1.612967, 1, 1, 1, 1, 1,
-1.280291, -1.035522, -2.039392, 1, 1, 1, 1, 1,
-1.272138, -0.3769191, -2.807406, 1, 1, 1, 1, 1,
-1.266444, -0.391903, -3.094928, 1, 1, 1, 1, 1,
-1.261982, 0.7435383, -1.169622, 1, 1, 1, 1, 1,
-1.25871, 0.5113988, -3.670104, 1, 1, 1, 1, 1,
-1.251719, 1.123584, -1.597442, 1, 1, 1, 1, 1,
-1.247141, 1.317379, 0.4224466, 1, 1, 1, 1, 1,
-1.24581, 0.9680963, -0.1115032, 1, 1, 1, 1, 1,
-1.236778, 0.6383046, -0.05717723, 1, 1, 1, 1, 1,
-1.229667, -0.5048989, -2.657, 1, 1, 1, 1, 1,
-1.220958, 0.4436041, -1.221334, 0, 0, 1, 1, 1,
-1.217555, 1.851139, -0.4017642, 1, 0, 0, 1, 1,
-1.211758, 0.7432294, -0.9108797, 1, 0, 0, 1, 1,
-1.205524, -0.1572193, -0.7877298, 1, 0, 0, 1, 1,
-1.20081, -0.6948552, -1.995787, 1, 0, 0, 1, 1,
-1.200484, 0.1577139, -0.1304907, 1, 0, 0, 1, 1,
-1.197163, 2.136129, 0.05933187, 0, 0, 0, 1, 1,
-1.191571, -0.4782847, -4.018281, 0, 0, 0, 1, 1,
-1.190778, -0.729124, -0.3637367, 0, 0, 0, 1, 1,
-1.189133, -0.3733073, -3.390455, 0, 0, 0, 1, 1,
-1.188104, 0.161595, 1.299894, 0, 0, 0, 1, 1,
-1.18755, 0.4309189, -1.571785, 0, 0, 0, 1, 1,
-1.184402, 2.515909, -0.6252919, 0, 0, 0, 1, 1,
-1.182966, -2.058198, -3.249006, 1, 1, 1, 1, 1,
-1.176667, -0.4845317, -1.922724, 1, 1, 1, 1, 1,
-1.173482, -0.1389037, -0.6724786, 1, 1, 1, 1, 1,
-1.173172, -1.053956, -0.8043956, 1, 1, 1, 1, 1,
-1.166041, 0.03134762, -0.3869295, 1, 1, 1, 1, 1,
-1.163185, -0.4395662, -1.574011, 1, 1, 1, 1, 1,
-1.161821, 0.0990473, -1.129275, 1, 1, 1, 1, 1,
-1.158716, 0.5205161, -2.87754, 1, 1, 1, 1, 1,
-1.15826, -0.6069176, -0.9155514, 1, 1, 1, 1, 1,
-1.156378, 0.8442743, -0.5936928, 1, 1, 1, 1, 1,
-1.1536, -1.49577, -0.8296899, 1, 1, 1, 1, 1,
-1.151648, -0.8943835, -2.911874, 1, 1, 1, 1, 1,
-1.149954, -0.9382485, -2.895331, 1, 1, 1, 1, 1,
-1.138238, 0.2033786, -0.7442107, 1, 1, 1, 1, 1,
-1.135319, 0.7211301, -0.3663079, 1, 1, 1, 1, 1,
-1.133919, 0.007935668, -0.6328496, 0, 0, 1, 1, 1,
-1.133115, 1.620685, 0.09240155, 1, 0, 0, 1, 1,
-1.130457, -2.477783, -3.726046, 1, 0, 0, 1, 1,
-1.118826, 0.3866296, -2.186649, 1, 0, 0, 1, 1,
-1.109308, 0.2705437, -1.418704, 1, 0, 0, 1, 1,
-1.106876, -0.6208459, -1.58067, 1, 0, 0, 1, 1,
-1.106636, 1.575416, -0.7817718, 0, 0, 0, 1, 1,
-1.077574, 1.520991, -1.329342, 0, 0, 0, 1, 1,
-1.075106, -1.494696, -3.446822, 0, 0, 0, 1, 1,
-1.066791, -0.1500826, -1.469673, 0, 0, 0, 1, 1,
-1.059787, -0.1742834, -1.678051, 0, 0, 0, 1, 1,
-1.0541, -0.2225765, -1.242173, 0, 0, 0, 1, 1,
-1.047343, 1.248246, 0.2837452, 0, 0, 0, 1, 1,
-1.044251, -0.3548872, -0.5165935, 1, 1, 1, 1, 1,
-1.039986, 1.211827, -1.155263, 1, 1, 1, 1, 1,
-1.034654, 0.8778009, -1.785093, 1, 1, 1, 1, 1,
-1.028359, -0.257561, -1.893958, 1, 1, 1, 1, 1,
-1.025453, 1.062204, -2.811746, 1, 1, 1, 1, 1,
-1.024059, 0.7747997, -0.8204682, 1, 1, 1, 1, 1,
-1.022426, 1.585103, -0.2892709, 1, 1, 1, 1, 1,
-1.019531, -0.5994143, -2.355985, 1, 1, 1, 1, 1,
-1.012878, -0.5455316, -0.7670311, 1, 1, 1, 1, 1,
-1.008083, -1.477948, -1.573053, 1, 1, 1, 1, 1,
-1.007139, 0.5217521, -0.1531633, 1, 1, 1, 1, 1,
-1.003422, -0.8445622, -1.705728, 1, 1, 1, 1, 1,
-1.00221, -0.4600741, -1.71115, 1, 1, 1, 1, 1,
-1.00037, 1.51373, 0.6508099, 1, 1, 1, 1, 1,
-0.9820532, -0.484692, -2.145452, 1, 1, 1, 1, 1,
-0.9813361, -1.213249, -1.207443, 0, 0, 1, 1, 1,
-0.9788589, -0.7514265, -1.710371, 1, 0, 0, 1, 1,
-0.9768975, 0.7995108, -0.02176307, 1, 0, 0, 1, 1,
-0.9521198, 0.1265863, -0.9478039, 1, 0, 0, 1, 1,
-0.9516617, 0.3395973, -2.767113, 1, 0, 0, 1, 1,
-0.9479283, -0.4662144, -1.745701, 1, 0, 0, 1, 1,
-0.9419538, 0.5305793, -0.8521656, 0, 0, 0, 1, 1,
-0.941556, -0.1869401, -1.163932, 0, 0, 0, 1, 1,
-0.939283, -0.5780204, -1.736758, 0, 0, 0, 1, 1,
-0.938626, 0.7846576, 0.04458522, 0, 0, 0, 1, 1,
-0.9384167, 1.353955, -0.5312107, 0, 0, 0, 1, 1,
-0.9362589, -0.6083882, -2.925748, 0, 0, 0, 1, 1,
-0.9344463, -1.14584, -1.585219, 0, 0, 0, 1, 1,
-0.9317436, 0.8237636, -1.164253, 1, 1, 1, 1, 1,
-0.9162687, -0.6611646, -0.7623122, 1, 1, 1, 1, 1,
-0.9154795, -1.677724, -2.689123, 1, 1, 1, 1, 1,
-0.9099078, -0.9148125, -3.713985, 1, 1, 1, 1, 1,
-0.9081087, -0.9268801, -2.894777, 1, 1, 1, 1, 1,
-0.9061261, -0.744173, -1.456391, 1, 1, 1, 1, 1,
-0.9052457, 1.34302, -0.5405023, 1, 1, 1, 1, 1,
-0.9049867, 0.2490701, 0.6219224, 1, 1, 1, 1, 1,
-0.9024077, -0.1725706, -1.464763, 1, 1, 1, 1, 1,
-0.8947885, -2.268005, -2.046343, 1, 1, 1, 1, 1,
-0.8917007, -0.3651962, 0.0449382, 1, 1, 1, 1, 1,
-0.890419, 0.4666468, -1.258552, 1, 1, 1, 1, 1,
-0.8889604, -0.3673521, -2.972378, 1, 1, 1, 1, 1,
-0.8811579, 1.776573, -0.03765732, 1, 1, 1, 1, 1,
-0.879555, 1.43971, -0.7766251, 1, 1, 1, 1, 1,
-0.8776564, 1.039936, -0.2392463, 0, 0, 1, 1, 1,
-0.8743264, -0.5012342, -3.362074, 1, 0, 0, 1, 1,
-0.8727215, 2.190538, -0.2386211, 1, 0, 0, 1, 1,
-0.8726555, -0.6090559, -4.129514, 1, 0, 0, 1, 1,
-0.8650612, -0.5621206, -2.002974, 1, 0, 0, 1, 1,
-0.8648612, 1.673484, -0.8328898, 1, 0, 0, 1, 1,
-0.8613245, 1.092287, -0.02797216, 0, 0, 0, 1, 1,
-0.8594368, 0.6798743, -2.177967, 0, 0, 0, 1, 1,
-0.8585224, 0.9341988, 0.5568157, 0, 0, 0, 1, 1,
-0.8463064, -0.3155462, -0.7467843, 0, 0, 0, 1, 1,
-0.8457592, 0.8276519, 0.7592972, 0, 0, 0, 1, 1,
-0.8429398, 0.4675654, 0.1627221, 0, 0, 0, 1, 1,
-0.834145, -0.4939463, -4.315192, 0, 0, 0, 1, 1,
-0.8275632, 0.5247632, -1.742299, 1, 1, 1, 1, 1,
-0.8237877, -1.186692, -2.201691, 1, 1, 1, 1, 1,
-0.8171092, 0.4509317, -0.1878383, 1, 1, 1, 1, 1,
-0.8138123, 0.449841, -1.284366, 1, 1, 1, 1, 1,
-0.8046114, 2.44941, 0.009162406, 1, 1, 1, 1, 1,
-0.7984154, 0.5619982, -2.055955, 1, 1, 1, 1, 1,
-0.7958398, -0.3981983, -1.818668, 1, 1, 1, 1, 1,
-0.795016, -0.4920878, -1.553085, 1, 1, 1, 1, 1,
-0.7944046, -0.3750662, -2.877502, 1, 1, 1, 1, 1,
-0.7929603, -0.4082897, -3.045601, 1, 1, 1, 1, 1,
-0.7925841, -0.6278449, -1.634168, 1, 1, 1, 1, 1,
-0.7909548, 0.2802068, -0.9987665, 1, 1, 1, 1, 1,
-0.7797338, 0.589298, -0.2409351, 1, 1, 1, 1, 1,
-0.7732687, 0.4602931, -0.7840335, 1, 1, 1, 1, 1,
-0.7698014, 0.6673297, 0.02137526, 1, 1, 1, 1, 1,
-0.7684215, -0.4071944, -2.315152, 0, 0, 1, 1, 1,
-0.7680344, -0.6734337, -0.002742886, 1, 0, 0, 1, 1,
-0.7636992, 1.167562, -2.58729, 1, 0, 0, 1, 1,
-0.7629092, -0.9087708, -3.853036, 1, 0, 0, 1, 1,
-0.7608113, -0.379767, -0.6831366, 1, 0, 0, 1, 1,
-0.7568922, -0.6472874, -1.889715, 1, 0, 0, 1, 1,
-0.75137, 0.08812568, -1.922848, 0, 0, 0, 1, 1,
-0.7494096, -0.5902099, -1.136263, 0, 0, 0, 1, 1,
-0.7446628, -0.6809629, -4.088326, 0, 0, 0, 1, 1,
-0.7360507, 0.3980608, -1.349277, 0, 0, 0, 1, 1,
-0.7358113, 1.207017, -0.03496124, 0, 0, 0, 1, 1,
-0.7351661, 2.878235, -1.606589, 0, 0, 0, 1, 1,
-0.7316716, -1.310328, -3.78806, 0, 0, 0, 1, 1,
-0.7276422, 0.6874231, 0.182233, 1, 1, 1, 1, 1,
-0.7239694, 1.746424, 0.4928225, 1, 1, 1, 1, 1,
-0.7232121, 0.5829722, -1.192693, 1, 1, 1, 1, 1,
-0.7206063, -0.7440647, -2.725858, 1, 1, 1, 1, 1,
-0.713312, -1.900512, -2.503957, 1, 1, 1, 1, 1,
-0.710686, -0.7128932, -2.296951, 1, 1, 1, 1, 1,
-0.7085105, 0.3227833, -1.36864, 1, 1, 1, 1, 1,
-0.7061474, -0.3987779, -3.155893, 1, 1, 1, 1, 1,
-0.7039344, 1.675097, 0.4326223, 1, 1, 1, 1, 1,
-0.7034608, -0.2085537, -1.586575, 1, 1, 1, 1, 1,
-0.6994756, 0.9762972, -0.2519692, 1, 1, 1, 1, 1,
-0.6919685, 0.09073213, -0.8443517, 1, 1, 1, 1, 1,
-0.6876391, -0.8859935, -1.19646, 1, 1, 1, 1, 1,
-0.6865301, -0.6813601, -0.7337152, 1, 1, 1, 1, 1,
-0.6857519, -0.4203082, -3.160799, 1, 1, 1, 1, 1,
-0.6853961, 1.774103, -0.362061, 0, 0, 1, 1, 1,
-0.6821339, -0.3891456, -1.748947, 1, 0, 0, 1, 1,
-0.6800932, -0.8148192, -1.367147, 1, 0, 0, 1, 1,
-0.6772955, -0.1461676, -2.576197, 1, 0, 0, 1, 1,
-0.6766504, 0.2041231, -1.331039, 1, 0, 0, 1, 1,
-0.6761795, 0.5578249, -0.8466173, 1, 0, 0, 1, 1,
-0.6716414, 0.7696815, -1.258701, 0, 0, 0, 1, 1,
-0.6706269, -0.1694613, -1.248122, 0, 0, 0, 1, 1,
-0.6693414, -2.317631, -1.481602, 0, 0, 0, 1, 1,
-0.6691752, 0.5872055, 1.898399, 0, 0, 0, 1, 1,
-0.6681677, 0.3895459, -2.370633, 0, 0, 0, 1, 1,
-0.6634067, 1.173909, -0.5365213, 0, 0, 0, 1, 1,
-0.653966, 0.3757106, -1.277012, 0, 0, 0, 1, 1,
-0.6537704, -1.143645, -1.426354, 1, 1, 1, 1, 1,
-0.6517316, -0.2722129, -0.7682324, 1, 1, 1, 1, 1,
-0.6503485, -0.1470918, -1.667526, 1, 1, 1, 1, 1,
-0.6487635, 0.9511496, -2.228617, 1, 1, 1, 1, 1,
-0.6482515, -1.820227, -2.343796, 1, 1, 1, 1, 1,
-0.6472131, -0.4920718, -2.433222, 1, 1, 1, 1, 1,
-0.642294, 0.3697914, -1.310352, 1, 1, 1, 1, 1,
-0.6393324, -0.4523438, -3.631232, 1, 1, 1, 1, 1,
-0.6327246, 0.7158155, -0.2575568, 1, 1, 1, 1, 1,
-0.6282431, -0.4396914, -2.723912, 1, 1, 1, 1, 1,
-0.6280205, 0.9629868, -0.01175855, 1, 1, 1, 1, 1,
-0.625668, 0.02623887, -2.026967, 1, 1, 1, 1, 1,
-0.6188833, 1.60566, 0.3305196, 1, 1, 1, 1, 1,
-0.6157298, 0.8133765, -0.03662739, 1, 1, 1, 1, 1,
-0.6156323, 0.2905258, -0.5858904, 1, 1, 1, 1, 1,
-0.61076, -1.184514, -2.564627, 0, 0, 1, 1, 1,
-0.6091019, -0.4043713, -3.305816, 1, 0, 0, 1, 1,
-0.6032099, 1.992905, -1.048254, 1, 0, 0, 1, 1,
-0.6019875, 0.503415, -0.9039286, 1, 0, 0, 1, 1,
-0.6019752, 0.4569526, -1.071241, 1, 0, 0, 1, 1,
-0.5956298, 1.541502, -0.5296149, 1, 0, 0, 1, 1,
-0.5922112, -0.6791391, -2.090401, 0, 0, 0, 1, 1,
-0.5903836, 0.2230672, -0.5231627, 0, 0, 0, 1, 1,
-0.5889344, 1.942744, -0.2878321, 0, 0, 0, 1, 1,
-0.5874038, -0.005351934, -1.714352, 0, 0, 0, 1, 1,
-0.5837687, 0.32908, -1.091454, 0, 0, 0, 1, 1,
-0.5802719, 0.5676392, -0.1627545, 0, 0, 0, 1, 1,
-0.5767902, -0.2265835, -1.591129, 0, 0, 0, 1, 1,
-0.5766721, 0.78519, 0.2962035, 1, 1, 1, 1, 1,
-0.574726, -0.4904518, -4.262802, 1, 1, 1, 1, 1,
-0.573752, -0.9403921, -4.201985, 1, 1, 1, 1, 1,
-0.5733634, -0.7922038, -3.674532, 1, 1, 1, 1, 1,
-0.5687885, -1.613515, -3.126372, 1, 1, 1, 1, 1,
-0.5620837, 0.570201, -1.225461, 1, 1, 1, 1, 1,
-0.5476095, 1.166715, 0.6347861, 1, 1, 1, 1, 1,
-0.5420124, -1.834574, -3.04546, 1, 1, 1, 1, 1,
-0.5416017, 0.7932488, -2.196047, 1, 1, 1, 1, 1,
-0.5412948, -1.494482, -3.592495, 1, 1, 1, 1, 1,
-0.5406802, -0.8282228, -2.608458, 1, 1, 1, 1, 1,
-0.5389351, 1.292941, -0.02360225, 1, 1, 1, 1, 1,
-0.5338028, 0.9954221, -0.05517974, 1, 1, 1, 1, 1,
-0.5336155, -1.330671, -2.759678, 1, 1, 1, 1, 1,
-0.529739, -0.04172793, -1.411373, 1, 1, 1, 1, 1,
-0.527528, -0.0801933, -0.4518518, 0, 0, 1, 1, 1,
-0.5253693, -0.1145509, -0.6029591, 1, 0, 0, 1, 1,
-0.5197414, -0.4364045, -3.516672, 1, 0, 0, 1, 1,
-0.5189411, 0.7425133, -1.335555, 1, 0, 0, 1, 1,
-0.5179635, 0.2950312, 0.05135389, 1, 0, 0, 1, 1,
-0.5159597, -0.5083579, -2.45347, 1, 0, 0, 1, 1,
-0.5103189, 0.4769874, -0.622736, 0, 0, 0, 1, 1,
-0.5086064, 1.886378, 0.1936526, 0, 0, 0, 1, 1,
-0.5078158, -0.3959917, -2.846778, 0, 0, 0, 1, 1,
-0.5077538, -1.177681, -0.1410238, 0, 0, 0, 1, 1,
-0.5074714, 0.3545651, -1.727999, 0, 0, 0, 1, 1,
-0.5054008, 0.2496964, -2.136228, 0, 0, 0, 1, 1,
-0.5047528, 0.3272772, -2.072745, 0, 0, 0, 1, 1,
-0.5011901, 0.3702703, -0.6298637, 1, 1, 1, 1, 1,
-0.4995293, 0.369352, -1.111669, 1, 1, 1, 1, 1,
-0.4935651, 0.3216077, 0.4904058, 1, 1, 1, 1, 1,
-0.4920031, -0.05225485, -2.520834, 1, 1, 1, 1, 1,
-0.4852818, -1.824965, -0.4401881, 1, 1, 1, 1, 1,
-0.4779426, -1.019742, -4.036296, 1, 1, 1, 1, 1,
-0.4778202, 1.700741, -0.9565596, 1, 1, 1, 1, 1,
-0.4724893, -0.7443134, -2.878205, 1, 1, 1, 1, 1,
-0.4670871, 0.3332387, -0.3867056, 1, 1, 1, 1, 1,
-0.4629971, -0.1834041, -1.72034, 1, 1, 1, 1, 1,
-0.4623578, 0.2088816, -0.8198078, 1, 1, 1, 1, 1,
-0.4614998, -0.3454548, -0.6954832, 1, 1, 1, 1, 1,
-0.4611487, -1.029234, -5.430876, 1, 1, 1, 1, 1,
-0.4597435, -0.5237207, -2.08279, 1, 1, 1, 1, 1,
-0.4548113, -0.9662012, -1.657037, 1, 1, 1, 1, 1,
-0.443729, 0.1511206, -0.6333988, 0, 0, 1, 1, 1,
-0.4423636, 1.045446, 0.5604197, 1, 0, 0, 1, 1,
-0.4368474, -1.222027, -1.499652, 1, 0, 0, 1, 1,
-0.4329112, -0.7252327, -1.142994, 1, 0, 0, 1, 1,
-0.4262494, 0.2445021, -1.549236, 1, 0, 0, 1, 1,
-0.4256015, 0.1587034, 0.2144567, 1, 0, 0, 1, 1,
-0.4236726, -0.5735112, -3.429778, 0, 0, 0, 1, 1,
-0.4226084, 0.1717072, -1.084754, 0, 0, 0, 1, 1,
-0.4223153, -0.08022387, -1.138693, 0, 0, 0, 1, 1,
-0.4168993, -1.79971, -0.7742658, 0, 0, 0, 1, 1,
-0.4153591, 1.16838, 0.5246421, 0, 0, 0, 1, 1,
-0.4140384, -0.4947419, -2.221217, 0, 0, 0, 1, 1,
-0.41185, 0.4486577, -1.68553, 0, 0, 0, 1, 1,
-0.4098583, -1.671764, -3.227025, 1, 1, 1, 1, 1,
-0.4076982, 0.6684874, -0.4115404, 1, 1, 1, 1, 1,
-0.4027332, -0.1215792, -2.246998, 1, 1, 1, 1, 1,
-0.4026189, 0.9418958, -0.4122661, 1, 1, 1, 1, 1,
-0.3994223, -2.006173, -5.323517, 1, 1, 1, 1, 1,
-0.3956044, 0.1428788, -0.9458424, 1, 1, 1, 1, 1,
-0.3869989, 0.1654324, -1.903167, 1, 1, 1, 1, 1,
-0.3843125, 0.2544661, -1.44455, 1, 1, 1, 1, 1,
-0.3833864, -0.03513503, -1.564367, 1, 1, 1, 1, 1,
-0.380909, -0.1365756, -2.14698, 1, 1, 1, 1, 1,
-0.3726516, 0.2474045, -1.26593, 1, 1, 1, 1, 1,
-0.3677416, 1.793533, -2.789888, 1, 1, 1, 1, 1,
-0.3660192, -1.291116, -2.542888, 1, 1, 1, 1, 1,
-0.3660103, -0.7130364, -1.938728, 1, 1, 1, 1, 1,
-0.3644169, -0.8297538, -3.000106, 1, 1, 1, 1, 1,
-0.3639098, 0.9466568, 0.4946476, 0, 0, 1, 1, 1,
-0.3633803, 1.763304, 0.3507172, 1, 0, 0, 1, 1,
-0.3625193, -2.122794, -2.194782, 1, 0, 0, 1, 1,
-0.3613967, -0.6184551, -3.293345, 1, 0, 0, 1, 1,
-0.3546097, -0.9455536, -5.150397, 1, 0, 0, 1, 1,
-0.351626, -0.2867868, -3.274431, 1, 0, 0, 1, 1,
-0.3510084, 0.7143979, -1.25066, 0, 0, 0, 1, 1,
-0.3497781, -2.085154, -4.101169, 0, 0, 0, 1, 1,
-0.3478729, 0.6273592, -0.09134522, 0, 0, 0, 1, 1,
-0.3436684, -0.8501537, -2.663182, 0, 0, 0, 1, 1,
-0.3371743, 1.260401, -0.5034024, 0, 0, 0, 1, 1,
-0.3266849, 0.7178827, -0.913364, 0, 0, 0, 1, 1,
-0.3254456, 1.225619, -1.409024, 0, 0, 0, 1, 1,
-0.3222935, -0.3400096, -3.8193, 1, 1, 1, 1, 1,
-0.3182468, 0.5692337, 1.040678, 1, 1, 1, 1, 1,
-0.3128612, 1.599924, -1.593038, 1, 1, 1, 1, 1,
-0.3073504, -0.7877327, -1.274114, 1, 1, 1, 1, 1,
-0.2985677, -1.186264, -3.431028, 1, 1, 1, 1, 1,
-0.2980722, -0.316473, -4.615103, 1, 1, 1, 1, 1,
-0.2932725, -0.03579676, -0.6061033, 1, 1, 1, 1, 1,
-0.2881583, 0.1861355, -2.773035, 1, 1, 1, 1, 1,
-0.2864146, -0.2728902, -0.4542855, 1, 1, 1, 1, 1,
-0.2804122, -0.02038089, -1.869076, 1, 1, 1, 1, 1,
-0.2770563, 0.7389234, 0.4060108, 1, 1, 1, 1, 1,
-0.2731402, 0.1631097, -1.749026, 1, 1, 1, 1, 1,
-0.2692304, -1.141093, -2.909425, 1, 1, 1, 1, 1,
-0.2625871, -2.103559, -3.201156, 1, 1, 1, 1, 1,
-0.256564, -1.450503, -3.219313, 1, 1, 1, 1, 1,
-0.2546836, 0.2094126, -2.22192, 0, 0, 1, 1, 1,
-0.2540745, 1.294378, -1.304573, 1, 0, 0, 1, 1,
-0.2534789, 0.06890626, -2.231922, 1, 0, 0, 1, 1,
-0.252095, 0.560792, -0.3482758, 1, 0, 0, 1, 1,
-0.2460478, -1.43606, -2.798121, 1, 0, 0, 1, 1,
-0.2427851, 0.6391011, -0.9934508, 1, 0, 0, 1, 1,
-0.2425056, -1.70065, -2.401108, 0, 0, 0, 1, 1,
-0.2383053, 0.001505156, -0.4388035, 0, 0, 0, 1, 1,
-0.2301331, -0.8091357, -3.824011, 0, 0, 0, 1, 1,
-0.2285847, 0.1311713, -1.026268, 0, 0, 0, 1, 1,
-0.2240928, 1.805244, -0.3719581, 0, 0, 0, 1, 1,
-0.2187208, -0.02779099, 0.6289122, 0, 0, 0, 1, 1,
-0.2178262, 1.585229, -0.2434529, 0, 0, 0, 1, 1,
-0.2170077, 0.1631148, -0.7274268, 1, 1, 1, 1, 1,
-0.2124339, -0.5953519, -2.570127, 1, 1, 1, 1, 1,
-0.2117043, 0.4496315, -1.913496, 1, 1, 1, 1, 1,
-0.204972, -0.8733623, -1.962689, 1, 1, 1, 1, 1,
-0.2039574, -1.145641, -3.85377, 1, 1, 1, 1, 1,
-0.2024104, -0.1373195, -1.716542, 1, 1, 1, 1, 1,
-0.1970551, -0.1984451, -2.883886, 1, 1, 1, 1, 1,
-0.1966726, -0.649312, -4.333207, 1, 1, 1, 1, 1,
-0.1966106, 2.199137, -1.558468, 1, 1, 1, 1, 1,
-0.1955168, -1.320759, -2.385745, 1, 1, 1, 1, 1,
-0.1911526, -1.04687, -4.370308, 1, 1, 1, 1, 1,
-0.1908939, 0.6064603, -0.5999699, 1, 1, 1, 1, 1,
-0.1900796, 1.291397, 2.495695, 1, 1, 1, 1, 1,
-0.1890431, 0.5887555, -0.5075104, 1, 1, 1, 1, 1,
-0.1864812, -0.5138566, -3.230867, 1, 1, 1, 1, 1,
-0.1788658, -2.576431, -3.113957, 0, 0, 1, 1, 1,
-0.1741623, 2.16271, -0.2522008, 1, 0, 0, 1, 1,
-0.173942, -0.2331186, -3.107425, 1, 0, 0, 1, 1,
-0.1695495, -0.3868925, -3.153167, 1, 0, 0, 1, 1,
-0.1680638, -0.1177371, -2.17495, 1, 0, 0, 1, 1,
-0.163297, -0.1154216, -0.965165, 1, 0, 0, 1, 1,
-0.1624517, -0.2161066, -1.733212, 0, 0, 0, 1, 1,
-0.1592743, 1.209612, 1.218666, 0, 0, 0, 1, 1,
-0.1583582, -1.093497, -3.123174, 0, 0, 0, 1, 1,
-0.1582976, -0.7158721, -2.607897, 0, 0, 0, 1, 1,
-0.1581911, -0.6205623, -1.691119, 0, 0, 0, 1, 1,
-0.1571737, -1.394946, -3.445725, 0, 0, 0, 1, 1,
-0.1561645, 1.40544, -0.2560907, 0, 0, 0, 1, 1,
-0.1555781, -0.7660068, -2.058445, 1, 1, 1, 1, 1,
-0.1549773, -0.6945139, -2.761999, 1, 1, 1, 1, 1,
-0.1543469, -0.4848934, -2.00366, 1, 1, 1, 1, 1,
-0.1458049, 0.3805236, 0.2070419, 1, 1, 1, 1, 1,
-0.1447344, -0.5006177, -1.257796, 1, 1, 1, 1, 1,
-0.1431713, -0.5483975, -1.990808, 1, 1, 1, 1, 1,
-0.1407664, 0.3278491, -0.4333961, 1, 1, 1, 1, 1,
-0.1378882, -0.1542898, -2.765031, 1, 1, 1, 1, 1,
-0.1375671, 0.5420858, -1.007255, 1, 1, 1, 1, 1,
-0.137356, -1.339829, -2.388797, 1, 1, 1, 1, 1,
-0.1355231, 0.04714446, -2.17304, 1, 1, 1, 1, 1,
-0.1354349, -1.221367, -2.222924, 1, 1, 1, 1, 1,
-0.1218664, -0.557991, -4.237974, 1, 1, 1, 1, 1,
-0.1114675, -0.1434012, -4.789738, 1, 1, 1, 1, 1,
-0.1108898, -0.2858467, -2.645456, 1, 1, 1, 1, 1,
-0.1098427, -1.133571, -3.197457, 0, 0, 1, 1, 1,
-0.1096768, 1.159967, -0.5205321, 1, 0, 0, 1, 1,
-0.0959734, 1.32263, -0.8234621, 1, 0, 0, 1, 1,
-0.09328236, 0.1673237, -0.5677435, 1, 0, 0, 1, 1,
-0.09205294, 0.3820155, 1.159948, 1, 0, 0, 1, 1,
-0.08379547, -0.1285323, -3.900874, 1, 0, 0, 1, 1,
-0.08327286, 0.3275962, -0.1065472, 0, 0, 0, 1, 1,
-0.08298291, -0.1239914, -1.080672, 0, 0, 0, 1, 1,
-0.08272482, -0.8244749, -3.475947, 0, 0, 0, 1, 1,
-0.08211076, 0.9179095, -1.088826, 0, 0, 0, 1, 1,
-0.08106745, -0.09989952, -3.386285, 0, 0, 0, 1, 1,
-0.08075637, 0.8178211, -0.8863895, 0, 0, 0, 1, 1,
-0.08058967, 0.2795952, 0.6123089, 0, 0, 0, 1, 1,
-0.07919329, -0.6414478, -2.249523, 1, 1, 1, 1, 1,
-0.07750471, 0.3215556, 0.1370646, 1, 1, 1, 1, 1,
-0.07698312, 1.949456, -0.6666372, 1, 1, 1, 1, 1,
-0.07079486, -1.196311, -2.020923, 1, 1, 1, 1, 1,
-0.07039375, 0.05015457, -1.678713, 1, 1, 1, 1, 1,
-0.06736167, 0.06050481, -0.2061224, 1, 1, 1, 1, 1,
-0.06704616, -0.5032309, -3.593709, 1, 1, 1, 1, 1,
-0.06559122, 0.003217657, 0.8941802, 1, 1, 1, 1, 1,
-0.06444738, 0.1628193, -2.631725, 1, 1, 1, 1, 1,
-0.06444548, 0.198169, -0.3403927, 1, 1, 1, 1, 1,
-0.06374721, -0.7969429, -1.344444, 1, 1, 1, 1, 1,
-0.0637259, 0.9472262, 0.03951193, 1, 1, 1, 1, 1,
-0.06366105, 0.8851917, 1.509818, 1, 1, 1, 1, 1,
-0.06225136, -0.7527704, -2.914142, 1, 1, 1, 1, 1,
-0.06120506, 0.1039658, 1.555696, 1, 1, 1, 1, 1,
-0.05550442, -0.370232, -2.699708, 0, 0, 1, 1, 1,
-0.0551697, 0.930777, -0.1848219, 1, 0, 0, 1, 1,
-0.05439071, -0.5972517, -4.371302, 1, 0, 0, 1, 1,
-0.05416094, -1.124684, -4.074571, 1, 0, 0, 1, 1,
-0.05320854, -0.4198507, -1.238587, 1, 0, 0, 1, 1,
-0.05290689, -0.349088, -2.031766, 1, 0, 0, 1, 1,
-0.05135963, 0.8990802, -1.29975, 0, 0, 0, 1, 1,
-0.05130988, 0.2962286, -0.620262, 0, 0, 0, 1, 1,
-0.04578697, 0.02992043, -2.566503, 0, 0, 0, 1, 1,
-0.04152271, -0.7264718, -2.765209, 0, 0, 0, 1, 1,
-0.03767817, 0.07976799, -0.1556759, 0, 0, 0, 1, 1,
-0.03527518, 1.010154, 0.4697159, 0, 0, 0, 1, 1,
-0.03231701, 0.7168878, -0.2302001, 0, 0, 0, 1, 1,
-0.03001593, -0.8688978, -4.388214, 1, 1, 1, 1, 1,
-0.02652584, -0.3208491, -2.901011, 1, 1, 1, 1, 1,
-0.02591527, -0.4829514, -2.993163, 1, 1, 1, 1, 1,
-0.0258246, -2.981109, -3.305867, 1, 1, 1, 1, 1,
-0.02200798, 1.58886, -0.5145286, 1, 1, 1, 1, 1,
-0.01914767, 2.356369, -0.2097695, 1, 1, 1, 1, 1,
-0.01672509, 0.4332698, -0.3230489, 1, 1, 1, 1, 1,
-0.0166842, 0.0139567, 0.2271317, 1, 1, 1, 1, 1,
-0.01566825, -1.148363, -4.375916, 1, 1, 1, 1, 1,
-0.01346049, 1.217838, 0.8155476, 1, 1, 1, 1, 1,
-0.01260809, 0.489199, 0.1145472, 1, 1, 1, 1, 1,
-0.009800063, 0.929845, 1.36111, 1, 1, 1, 1, 1,
-0.007225048, -0.294549, -4.276191, 1, 1, 1, 1, 1,
-0.007001858, -1.026128, -4.485608, 1, 1, 1, 1, 1,
-0.006985609, -0.8338405, -3.568159, 1, 1, 1, 1, 1,
-0.005704234, 0.8019704, -0.411536, 0, 0, 1, 1, 1,
-0.005238994, -0.2530835, -3.764376, 1, 0, 0, 1, 1,
-0.004611219, -0.08802503, -3.236736, 1, 0, 0, 1, 1,
-4.037289e-05, 0.2174884, 2.006031, 1, 0, 0, 1, 1,
4.369239e-05, -0.6278033, 3.809284, 1, 0, 0, 1, 1,
0.002630234, -1.45567, 3.04992, 1, 0, 0, 1, 1,
0.006591141, 0.682336, -0.7199796, 0, 0, 0, 1, 1,
0.00688293, -0.7645263, 2.876229, 0, 0, 0, 1, 1,
0.007844497, 0.2450528, 0.2104829, 0, 0, 0, 1, 1,
0.008196247, 1.779142, 1.29414, 0, 0, 0, 1, 1,
0.01685878, -1.227076, 3.743086, 0, 0, 0, 1, 1,
0.0173564, 0.110743, -0.4487551, 0, 0, 0, 1, 1,
0.01772872, -0.03830877, 1.640047, 0, 0, 0, 1, 1,
0.01838072, 0.8661769, 1.522559, 1, 1, 1, 1, 1,
0.02240358, 0.7032517, -1.393918, 1, 1, 1, 1, 1,
0.02853014, 0.3323357, 0.473512, 1, 1, 1, 1, 1,
0.02925832, -0.7333494, 4.698215, 1, 1, 1, 1, 1,
0.03154725, 0.3748111, -0.4196869, 1, 1, 1, 1, 1,
0.03202421, -0.4339092, 1.367592, 1, 1, 1, 1, 1,
0.03228018, -1.28077, 3.250793, 1, 1, 1, 1, 1,
0.03257108, -0.4674871, 3.65942, 1, 1, 1, 1, 1,
0.033159, 0.09098218, 0.7740832, 1, 1, 1, 1, 1,
0.03474951, 0.02184679, 1.073024, 1, 1, 1, 1, 1,
0.03656017, 0.2702383, 0.6108561, 1, 1, 1, 1, 1,
0.03728983, 0.4003249, -0.05573625, 1, 1, 1, 1, 1,
0.0438992, -0.1379404, 1.309586, 1, 1, 1, 1, 1,
0.04507178, -0.4656947, 1.609868, 1, 1, 1, 1, 1,
0.04666788, -0.07754886, 2.923752, 1, 1, 1, 1, 1,
0.04752949, -0.1241284, 2.829227, 0, 0, 1, 1, 1,
0.05120615, -0.8904613, 4.906375, 1, 0, 0, 1, 1,
0.05259854, 0.1020832, 0.3907449, 1, 0, 0, 1, 1,
0.05564038, 0.8594896, 1.199609, 1, 0, 0, 1, 1,
0.0596756, -0.2975031, 3.324108, 1, 0, 0, 1, 1,
0.06193315, 0.5407381, 0.7737069, 1, 0, 0, 1, 1,
0.06552888, -2.434532, 3.07537, 0, 0, 0, 1, 1,
0.06556029, -0.7425129, 3.708408, 0, 0, 0, 1, 1,
0.0667685, -1.050022, 0.9994299, 0, 0, 0, 1, 1,
0.06912063, 0.5681973, 1.250296, 0, 0, 0, 1, 1,
0.0693735, 0.1452806, 0.5512334, 0, 0, 0, 1, 1,
0.0734671, -0.4358858, 3.495588, 0, 0, 0, 1, 1,
0.07505739, -0.1277668, 2.749769, 0, 0, 0, 1, 1,
0.0821328, -2.161932, 3.989581, 1, 1, 1, 1, 1,
0.08296823, 0.7102686, -0.2666345, 1, 1, 1, 1, 1,
0.08698365, 0.6039079, -0.71687, 1, 1, 1, 1, 1,
0.0884429, -0.2041509, 2.404652, 1, 1, 1, 1, 1,
0.09077505, -0.7490969, 3.832004, 1, 1, 1, 1, 1,
0.09131911, 0.8772461, 1.035567, 1, 1, 1, 1, 1,
0.09479548, 0.1296931, -0.3820734, 1, 1, 1, 1, 1,
0.0976834, -0.2078677, 3.627185, 1, 1, 1, 1, 1,
0.100497, 0.1913617, 1.451648, 1, 1, 1, 1, 1,
0.108328, -0.1582591, 1.990598, 1, 1, 1, 1, 1,
0.1091857, -1.558463, 3.21442, 1, 1, 1, 1, 1,
0.1126962, -0.7191906, 3.057306, 1, 1, 1, 1, 1,
0.1172624, -0.1491553, 3.378918, 1, 1, 1, 1, 1,
0.117933, 0.5913686, -0.3400053, 1, 1, 1, 1, 1,
0.1194029, 1.349869, 0.8697214, 1, 1, 1, 1, 1,
0.1241596, 0.2547801, 0.881476, 0, 0, 1, 1, 1,
0.1265848, -1.016534, 3.168603, 1, 0, 0, 1, 1,
0.127669, -1.107396, 2.556938, 1, 0, 0, 1, 1,
0.1291393, -0.2725194, 3.708436, 1, 0, 0, 1, 1,
0.1300477, 0.884401, -0.5513911, 1, 0, 0, 1, 1,
0.1321482, -0.2674028, 4.120032, 1, 0, 0, 1, 1,
0.1334963, 0.4719599, -0.3151847, 0, 0, 0, 1, 1,
0.1356873, -0.1025276, 1.021488, 0, 0, 0, 1, 1,
0.1362766, 0.254785, -0.1088776, 0, 0, 0, 1, 1,
0.1378907, -1.022311, 5.697386, 0, 0, 0, 1, 1,
0.137942, -0.2023432, 2.447305, 0, 0, 0, 1, 1,
0.1399999, -1.08446, 1.376203, 0, 0, 0, 1, 1,
0.1439384, -0.7355298, 3.474242, 0, 0, 0, 1, 1,
0.1446579, -0.6768248, 2.159616, 1, 1, 1, 1, 1,
0.1481258, -0.8306551, 4.06487, 1, 1, 1, 1, 1,
0.149026, -0.8015309, 3.054886, 1, 1, 1, 1, 1,
0.1499082, -0.1156833, 2.366133, 1, 1, 1, 1, 1,
0.150581, 0.06771955, 0.1473589, 1, 1, 1, 1, 1,
0.1506179, 1.045527, -0.4511501, 1, 1, 1, 1, 1,
0.1529458, -0.2442689, 2.672645, 1, 1, 1, 1, 1,
0.1543589, -1.183761, 1.298236, 1, 1, 1, 1, 1,
0.1560562, -1.003707, 2.45229, 1, 1, 1, 1, 1,
0.1593034, -0.7712495, 2.610812, 1, 1, 1, 1, 1,
0.1613622, -0.2328123, 1.363796, 1, 1, 1, 1, 1,
0.1614033, 0.5322916, 2.317104, 1, 1, 1, 1, 1,
0.1655515, 1.297357, -0.2075036, 1, 1, 1, 1, 1,
0.1658022, 0.4631814, -1.651591, 1, 1, 1, 1, 1,
0.1673983, 1.129901, 0.1593623, 1, 1, 1, 1, 1,
0.1679852, -0.3690702, 1.860666, 0, 0, 1, 1, 1,
0.1744031, -0.7474058, 2.985469, 1, 0, 0, 1, 1,
0.1819043, -0.9293888, 3.608344, 1, 0, 0, 1, 1,
0.1819435, 1.671883, -0.1043663, 1, 0, 0, 1, 1,
0.1838829, -0.4441494, 1.422172, 1, 0, 0, 1, 1,
0.1840852, -2.368147, 5.088496, 1, 0, 0, 1, 1,
0.1849824, 1.368232, 0.03821688, 0, 0, 0, 1, 1,
0.1851715, -1.101005, 3.698028, 0, 0, 0, 1, 1,
0.1900469, -0.7874937, 2.844076, 0, 0, 0, 1, 1,
0.1906471, -0.6480837, 2.373319, 0, 0, 0, 1, 1,
0.1928135, 1.379674, -0.04469399, 0, 0, 0, 1, 1,
0.1954901, 1.047205, 0.307321, 0, 0, 0, 1, 1,
0.1966295, 0.6164427, -1.343092, 0, 0, 0, 1, 1,
0.1975989, 0.4787455, -0.5002152, 1, 1, 1, 1, 1,
0.1978077, -2.195349, 3.355923, 1, 1, 1, 1, 1,
0.2009245, -0.1729173, 0.8187774, 1, 1, 1, 1, 1,
0.2073968, -0.07089674, 1.197559, 1, 1, 1, 1, 1,
0.2103356, 0.1724336, 1.76753, 1, 1, 1, 1, 1,
0.2111767, -0.5087673, 2.320753, 1, 1, 1, 1, 1,
0.2127787, -0.3531333, 3.673924, 1, 1, 1, 1, 1,
0.2128865, 0.470274, 1.356285, 1, 1, 1, 1, 1,
0.2154995, -0.6071799, 3.479666, 1, 1, 1, 1, 1,
0.2210616, -1.461149, 2.746834, 1, 1, 1, 1, 1,
0.2212289, -1.755469, 3.297132, 1, 1, 1, 1, 1,
0.2219301, -0.6671016, 2.415931, 1, 1, 1, 1, 1,
0.2260299, 0.1340892, 3.575476, 1, 1, 1, 1, 1,
0.2293053, 2.163938, 0.5381691, 1, 1, 1, 1, 1,
0.2295446, 0.2421771, 2.008265, 1, 1, 1, 1, 1,
0.2309249, -0.662972, 2.199008, 0, 0, 1, 1, 1,
0.2319851, 0.4015296, 1.607593, 1, 0, 0, 1, 1,
0.2332178, -0.2030236, 4.11446, 1, 0, 0, 1, 1,
0.2347374, 1.09809, 0.145709, 1, 0, 0, 1, 1,
0.23586, 0.05150608, 2.576123, 1, 0, 0, 1, 1,
0.2412163, 0.4569667, -0.2412862, 1, 0, 0, 1, 1,
0.2433271, -1.246695, 1.808111, 0, 0, 0, 1, 1,
0.2438208, 0.3501314, 1.332697, 0, 0, 0, 1, 1,
0.2484181, 1.337428, -0.700214, 0, 0, 0, 1, 1,
0.249731, -0.4030894, 2.046345, 0, 0, 0, 1, 1,
0.25253, 1.196016, -0.3572885, 0, 0, 0, 1, 1,
0.2525309, 0.4600378, -0.6172379, 0, 0, 0, 1, 1,
0.2533956, -0.244121, 3.618338, 0, 0, 0, 1, 1,
0.2648487, 0.4235534, 1.86895, 1, 1, 1, 1, 1,
0.2687565, -0.1289162, 1.564295, 1, 1, 1, 1, 1,
0.2740662, -2.007544, 3.322109, 1, 1, 1, 1, 1,
0.2761507, 1.058592, 0.9997627, 1, 1, 1, 1, 1,
0.2766602, -0.7872463, 2.094836, 1, 1, 1, 1, 1,
0.2767185, -0.8321721, 2.589671, 1, 1, 1, 1, 1,
0.2804161, 0.3091996, 2.5255, 1, 1, 1, 1, 1,
0.2814335, 0.5587348, 1.049358, 1, 1, 1, 1, 1,
0.2834036, -0.6311237, 2.780495, 1, 1, 1, 1, 1,
0.2876734, -0.697204, 2.701592, 1, 1, 1, 1, 1,
0.2881011, -0.8442534, 3.455586, 1, 1, 1, 1, 1,
0.2922908, 0.5195669, -0.2757161, 1, 1, 1, 1, 1,
0.2934563, -0.6501243, 3.591415, 1, 1, 1, 1, 1,
0.2953402, -0.6491387, 3.186775, 1, 1, 1, 1, 1,
0.2971007, 0.02277133, 3.638233, 1, 1, 1, 1, 1,
0.2986862, 0.3298607, 1.322711, 0, 0, 1, 1, 1,
0.2990603, 1.008821, 0.6867651, 1, 0, 0, 1, 1,
0.2996224, -1.216662, 3.144625, 1, 0, 0, 1, 1,
0.3022637, 0.1385114, 1.813448, 1, 0, 0, 1, 1,
0.3022994, 1.183473, 1.2617, 1, 0, 0, 1, 1,
0.3036137, -1.409206, 2.885604, 1, 0, 0, 1, 1,
0.3076262, -0.0468217, 3.85033, 0, 0, 0, 1, 1,
0.3089546, 1.205759, 1.585028, 0, 0, 0, 1, 1,
0.3129177, 2.656415, 1.476932, 0, 0, 0, 1, 1,
0.3132909, 0.1209762, 0.4574917, 0, 0, 0, 1, 1,
0.3136979, -0.01812238, 1.087506, 0, 0, 0, 1, 1,
0.3190179, 0.3445922, 0.781499, 0, 0, 0, 1, 1,
0.3266, -0.5570621, 3.724103, 0, 0, 0, 1, 1,
0.3295633, -0.01933466, 0.417273, 1, 1, 1, 1, 1,
0.3343024, 0.08339489, 2.356128, 1, 1, 1, 1, 1,
0.3348989, -0.8522087, 1.95139, 1, 1, 1, 1, 1,
0.3405845, 1.135651, 1.961949, 1, 1, 1, 1, 1,
0.340786, 0.3771875, 0.2991313, 1, 1, 1, 1, 1,
0.341372, -1.848712, 1.803433, 1, 1, 1, 1, 1,
0.3458975, 2.327566, -1.465581, 1, 1, 1, 1, 1,
0.3470103, -0.1102444, 3.651567, 1, 1, 1, 1, 1,
0.3477578, 0.8940393, 0.6825911, 1, 1, 1, 1, 1,
0.350047, -0.4738548, 2.961899, 1, 1, 1, 1, 1,
0.3524828, -1.422624, 1.818945, 1, 1, 1, 1, 1,
0.3600555, 1.759147, -0.3877859, 1, 1, 1, 1, 1,
0.3628765, 0.3701052, 2.617814, 1, 1, 1, 1, 1,
0.3636864, 0.3093022, 2.227748, 1, 1, 1, 1, 1,
0.3640268, -0.9655678, 4.13015, 1, 1, 1, 1, 1,
0.3676886, 1.448293, 0.07287058, 0, 0, 1, 1, 1,
0.3698047, -1.876636, 2.472151, 1, 0, 0, 1, 1,
0.3745336, -0.2016609, 1.541835, 1, 0, 0, 1, 1,
0.3816546, -1.352546, 2.149874, 1, 0, 0, 1, 1,
0.3875706, -0.6600555, 3.442372, 1, 0, 0, 1, 1,
0.3924787, -0.1545241, 2.307507, 1, 0, 0, 1, 1,
0.395845, 1.041598, 1.173043, 0, 0, 0, 1, 1,
0.3974117, -2.134143, 2.852323, 0, 0, 0, 1, 1,
0.4005172, -0.2590847, 1.602271, 0, 0, 0, 1, 1,
0.4010406, 1.9511, 1.120241, 0, 0, 0, 1, 1,
0.4018504, -0.3724132, 0.5269958, 0, 0, 0, 1, 1,
0.4025603, 0.5178742, 1.365201, 0, 0, 0, 1, 1,
0.4028249, -0.2833519, 4.36791, 0, 0, 0, 1, 1,
0.4033118, 0.4171365, 0.814628, 1, 1, 1, 1, 1,
0.4077686, 0.7455988, 3.143973, 1, 1, 1, 1, 1,
0.4085385, -1.24464, 3.770303, 1, 1, 1, 1, 1,
0.4091713, 1.370608, 0.3730326, 1, 1, 1, 1, 1,
0.4138892, -1.155172, 4.699954, 1, 1, 1, 1, 1,
0.414992, -0.1435997, 1.775367, 1, 1, 1, 1, 1,
0.4151973, -1.929487, 3.435522, 1, 1, 1, 1, 1,
0.4220752, 1.512934, -1.349766, 1, 1, 1, 1, 1,
0.4272936, 0.5514712, -0.2172768, 1, 1, 1, 1, 1,
0.4364265, -0.07743755, 3.525267, 1, 1, 1, 1, 1,
0.439768, 1.247735, 1.802133, 1, 1, 1, 1, 1,
0.4401824, 0.7581232, 2.106508, 1, 1, 1, 1, 1,
0.4460185, -0.1007013, 3.253146, 1, 1, 1, 1, 1,
0.4498457, 1.094858, -0.07906591, 1, 1, 1, 1, 1,
0.4556371, -0.5262042, 3.53316, 1, 1, 1, 1, 1,
0.4556823, -0.6108615, 2.849337, 0, 0, 1, 1, 1,
0.4630094, -1.406546, 2.55656, 1, 0, 0, 1, 1,
0.4671833, 0.3111821, 1.091573, 1, 0, 0, 1, 1,
0.473389, -1.757407, 3.059447, 1, 0, 0, 1, 1,
0.4777134, 0.9402139, -0.07715503, 1, 0, 0, 1, 1,
0.4789795, 1.160094, 0.2485628, 1, 0, 0, 1, 1,
0.4821681, 0.3051535, 0.1294806, 0, 0, 0, 1, 1,
0.4822873, -0.9711596, 2.947294, 0, 0, 0, 1, 1,
0.4825233, -0.8313905, 3.276388, 0, 0, 0, 1, 1,
0.4838492, 0.1133523, 0.4885868, 0, 0, 0, 1, 1,
0.4871915, -0.3178661, 0.07648575, 0, 0, 0, 1, 1,
0.4896626, -0.08369379, 3.543812, 0, 0, 0, 1, 1,
0.4897521, -0.3884776, 3.149179, 0, 0, 0, 1, 1,
0.4907806, -0.7208394, 1.670267, 1, 1, 1, 1, 1,
0.4927242, 1.749999, -0.456111, 1, 1, 1, 1, 1,
0.4969307, 0.2040821, 1.725625, 1, 1, 1, 1, 1,
0.5019888, 0.150647, 0.7468745, 1, 1, 1, 1, 1,
0.5106653, -0.2139093, 3.390645, 1, 1, 1, 1, 1,
0.5113837, -0.3386296, 2.466623, 1, 1, 1, 1, 1,
0.5115047, -0.20409, 2.480995, 1, 1, 1, 1, 1,
0.51354, -0.9044813, 3.242923, 1, 1, 1, 1, 1,
0.5148087, -0.4380231, 1.438783, 1, 1, 1, 1, 1,
0.5194098, -0.07210846, 2.689417, 1, 1, 1, 1, 1,
0.5216102, 1.095137, 0.5143896, 1, 1, 1, 1, 1,
0.5233195, 0.2715607, 0.1482973, 1, 1, 1, 1, 1,
0.5259312, 0.931434, 1.188824, 1, 1, 1, 1, 1,
0.5260367, -0.8987423, 3.461119, 1, 1, 1, 1, 1,
0.5309668, -0.05789449, 2.806143, 1, 1, 1, 1, 1,
0.5310615, 0.468239, 1.807149, 0, 0, 1, 1, 1,
0.5319578, 2.286242, -0.1352614, 1, 0, 0, 1, 1,
0.534885, -0.6170981, 0.9213244, 1, 0, 0, 1, 1,
0.5352558, -0.1849134, 2.006447, 1, 0, 0, 1, 1,
0.5380242, -0.6363996, 2.658574, 1, 0, 0, 1, 1,
0.5515121, -0.8676646, 0.6741444, 1, 0, 0, 1, 1,
0.5565903, 0.9432396, -1.135023, 0, 0, 0, 1, 1,
0.5595342, -0.1098389, 0.7924846, 0, 0, 0, 1, 1,
0.5595688, -0.5619041, 3.192698, 0, 0, 0, 1, 1,
0.5649973, 0.321752, 0.144946, 0, 0, 0, 1, 1,
0.5690158, 1.142749, 0.6062438, 0, 0, 0, 1, 1,
0.5713187, -1.23851, 2.991582, 0, 0, 0, 1, 1,
0.572592, 0.1549625, 0.5418878, 0, 0, 0, 1, 1,
0.5735781, -0.1712254, 2.721586, 1, 1, 1, 1, 1,
0.5738485, -0.5318315, 3.409765, 1, 1, 1, 1, 1,
0.5768297, -0.7469382, 2.125412, 1, 1, 1, 1, 1,
0.5783814, 0.2107599, 0.1635836, 1, 1, 1, 1, 1,
0.582128, 0.06814837, 0.9556681, 1, 1, 1, 1, 1,
0.5821366, -1.015966, 1.73794, 1, 1, 1, 1, 1,
0.5854622, 1.4345, 1.14329, 1, 1, 1, 1, 1,
0.586708, -0.4854381, 3.883851, 1, 1, 1, 1, 1,
0.5949829, 0.01357929, 0.8045399, 1, 1, 1, 1, 1,
0.597615, -0.313055, 2.327291, 1, 1, 1, 1, 1,
0.5976698, 1.182568, -0.3965417, 1, 1, 1, 1, 1,
0.6034989, 1.143515, -0.4552768, 1, 1, 1, 1, 1,
0.6064199, -1.229325, 2.582144, 1, 1, 1, 1, 1,
0.6083915, 0.071894, 0.357726, 1, 1, 1, 1, 1,
0.6125576, -0.6350084, 2.047677, 1, 1, 1, 1, 1,
0.6157995, 1.296705, -0.5086006, 0, 0, 1, 1, 1,
0.6172342, -1.399098, 2.987282, 1, 0, 0, 1, 1,
0.6216218, -0.7110141, 3.130037, 1, 0, 0, 1, 1,
0.6222148, -0.9228876, 4.021704, 1, 0, 0, 1, 1,
0.6225356, -0.5268463, 2.997391, 1, 0, 0, 1, 1,
0.6262197, 0.5849402, 1.408148, 1, 0, 0, 1, 1,
0.6291621, 0.5783905, 1.933069, 0, 0, 0, 1, 1,
0.6309052, -0.7151396, 0.7957222, 0, 0, 0, 1, 1,
0.6309713, -0.4016864, 2.881263, 0, 0, 0, 1, 1,
0.6317776, -0.610642, 0.2631371, 0, 0, 0, 1, 1,
0.6485594, 0.5910128, 1.13186, 0, 0, 0, 1, 1,
0.6499162, -1.272621, 2.540615, 0, 0, 0, 1, 1,
0.6564935, -0.4044781, 3.958543, 0, 0, 0, 1, 1,
0.6626644, -0.8196797, 3.817297, 1, 1, 1, 1, 1,
0.6653021, -0.7825336, 2.067873, 1, 1, 1, 1, 1,
0.6664429, -1.947491, 2.986747, 1, 1, 1, 1, 1,
0.6683521, -0.2845537, 1.78519, 1, 1, 1, 1, 1,
0.6719894, -1.035759, 1.812268, 1, 1, 1, 1, 1,
0.672011, -1.603572, 3.248157, 1, 1, 1, 1, 1,
0.6728275, -0.5222827, 1.066128, 1, 1, 1, 1, 1,
0.6730124, -1.114354, 2.741147, 1, 1, 1, 1, 1,
0.673888, 1.255132, 0.6754746, 1, 1, 1, 1, 1,
0.6791601, 0.6727534, 1.983373, 1, 1, 1, 1, 1,
0.6799992, 1.538661, -0.4234692, 1, 1, 1, 1, 1,
0.6814518, 1.074944, 0.1300847, 1, 1, 1, 1, 1,
0.6863305, 0.5333776, 1.291341, 1, 1, 1, 1, 1,
0.6884092, -0.3978176, 2.184293, 1, 1, 1, 1, 1,
0.6894642, -0.1592255, 1.117331, 1, 1, 1, 1, 1,
0.7008724, -1.227045, 4.775534, 0, 0, 1, 1, 1,
0.7012826, 0.2388528, 1.696653, 1, 0, 0, 1, 1,
0.7039564, 0.6103385, 0.1432046, 1, 0, 0, 1, 1,
0.707643, -0.6413418, 0.9377829, 1, 0, 0, 1, 1,
0.7136149, -0.7562787, 2.524812, 1, 0, 0, 1, 1,
0.7172839, -0.2249809, 2.74314, 1, 0, 0, 1, 1,
0.7182859, 0.6255835, 0.4351018, 0, 0, 0, 1, 1,
0.7219476, 0.04133689, 0.6319992, 0, 0, 0, 1, 1,
0.723663, 0.02079278, 1.840467, 0, 0, 0, 1, 1,
0.7242528, 0.731125, -0.7083142, 0, 0, 0, 1, 1,
0.725041, -0.07741652, 2.66132, 0, 0, 0, 1, 1,
0.7281463, -0.09957308, 1.511076, 0, 0, 0, 1, 1,
0.7360353, -1.283231, 1.791129, 0, 0, 0, 1, 1,
0.7407981, 0.6402401, 1.366972, 1, 1, 1, 1, 1,
0.7432702, -1.479279, 1.791193, 1, 1, 1, 1, 1,
0.7448977, 0.2587908, 1.917222, 1, 1, 1, 1, 1,
0.7502068, -0.1695946, 2.855473, 1, 1, 1, 1, 1,
0.7504161, -0.04938991, 2.288832, 1, 1, 1, 1, 1,
0.7508984, -0.6734474, 2.786057, 1, 1, 1, 1, 1,
0.7513065, 1.021695, 0.1794065, 1, 1, 1, 1, 1,
0.7533284, -0.9721486, 3.537024, 1, 1, 1, 1, 1,
0.756432, -2.047903, 2.331867, 1, 1, 1, 1, 1,
0.7581232, -2.126055, 3.140368, 1, 1, 1, 1, 1,
0.7661693, -1.142134, 3.612696, 1, 1, 1, 1, 1,
0.7682965, 0.3244148, 2.414645, 1, 1, 1, 1, 1,
0.7745525, -1.762179, 3.490663, 1, 1, 1, 1, 1,
0.7888604, 0.745568, 0.1336121, 1, 1, 1, 1, 1,
0.790504, -0.198753, 2.59321, 1, 1, 1, 1, 1,
0.7930733, 0.5320667, -0.01266473, 0, 0, 1, 1, 1,
0.7971257, -0.4065517, 2.669712, 1, 0, 0, 1, 1,
0.7988994, -0.4559899, 0.9595213, 1, 0, 0, 1, 1,
0.7995107, 0.2239954, 2.657636, 1, 0, 0, 1, 1,
0.799593, -0.03241204, 1.477656, 1, 0, 0, 1, 1,
0.8026958, -1.39755, 4.393504, 1, 0, 0, 1, 1,
0.8090456, -0.03762718, -0.1888748, 0, 0, 0, 1, 1,
0.8099728, -0.06716644, 2.804816, 0, 0, 0, 1, 1,
0.8108245, -0.07956453, 0.7165946, 0, 0, 0, 1, 1,
0.8200139, -0.7386579, 3.082528, 0, 0, 0, 1, 1,
0.8221167, 0.9703377, 0.06795592, 0, 0, 0, 1, 1,
0.8356298, -0.5281945, 3.462236, 0, 0, 0, 1, 1,
0.8441762, 1.330988, 2.367442, 0, 0, 0, 1, 1,
0.846578, 2.427202, 0.3710013, 1, 1, 1, 1, 1,
0.8524852, -0.6320517, 1.378122, 1, 1, 1, 1, 1,
0.8561864, 0.08125927, 1.779879, 1, 1, 1, 1, 1,
0.85623, 0.09488529, 0.9326617, 1, 1, 1, 1, 1,
0.8661141, -0.2108276, 1.66558, 1, 1, 1, 1, 1,
0.8696394, 0.9801711, 0.7875685, 1, 1, 1, 1, 1,
0.8708889, -0.3595832, -0.04998186, 1, 1, 1, 1, 1,
0.8762964, -0.009257266, 2.292737, 1, 1, 1, 1, 1,
0.8829478, -0.347118, 2.519563, 1, 1, 1, 1, 1,
0.8928204, -0.4274567, -0.2648014, 1, 1, 1, 1, 1,
0.8982343, -2.755624, 2.212443, 1, 1, 1, 1, 1,
0.9013684, 1.337362, 1.127473, 1, 1, 1, 1, 1,
0.9016794, 0.4427715, 1.052216, 1, 1, 1, 1, 1,
0.9062, -0.02144068, 2.31603, 1, 1, 1, 1, 1,
0.9063029, -0.6548857, 1.348433, 1, 1, 1, 1, 1,
0.9093012, -0.4673954, 1.961743, 0, 0, 1, 1, 1,
0.9093573, 0.3013891, 2.89121, 1, 0, 0, 1, 1,
0.9124795, -1.207766, 2.675375, 1, 0, 0, 1, 1,
0.9150785, 0.1315203, 1.268744, 1, 0, 0, 1, 1,
0.9198732, -1.711084, 1.577904, 1, 0, 0, 1, 1,
0.9204635, 0.104951, 1.973561, 1, 0, 0, 1, 1,
0.9299645, -2.366948, 2.828127, 0, 0, 0, 1, 1,
0.9369695, -0.3116319, 2.365632, 0, 0, 0, 1, 1,
0.9383406, 0.6076652, 1.241946, 0, 0, 0, 1, 1,
0.9493169, 0.4038302, 2.03585, 0, 0, 0, 1, 1,
0.9571745, 1.832541, 0.2148445, 0, 0, 0, 1, 1,
0.9572645, 0.4512915, 0.08773594, 0, 0, 0, 1, 1,
0.9606219, -0.7863759, 3.381747, 0, 0, 0, 1, 1,
0.9606916, 0.5630785, 0.7660155, 1, 1, 1, 1, 1,
0.9619689, -0.5411937, 1.454833, 1, 1, 1, 1, 1,
0.9630271, -1.172078, 1.893456, 1, 1, 1, 1, 1,
0.9646997, -0.008550731, 1.562923, 1, 1, 1, 1, 1,
0.965527, 0.01978838, 1.543641, 1, 1, 1, 1, 1,
0.9745103, 1.469786, -0.82906, 1, 1, 1, 1, 1,
0.9757869, -0.7680187, 2.610758, 1, 1, 1, 1, 1,
0.9847753, 0.809207, 0.8555343, 1, 1, 1, 1, 1,
0.9875497, 1.424644, 0.6301305, 1, 1, 1, 1, 1,
0.9889063, 0.3135406, 2.018878, 1, 1, 1, 1, 1,
0.9968149, 0.7361635, 1.23869, 1, 1, 1, 1, 1,
1.000821, -1.007597, 2.653852, 1, 1, 1, 1, 1,
1.007537, 0.9587831, 0.8502368, 1, 1, 1, 1, 1,
1.009056, -0.2999876, 2.551612, 1, 1, 1, 1, 1,
1.009331, 0.6094822, 1.051392, 1, 1, 1, 1, 1,
1.011124, -1.06015, 3.405603, 0, 0, 1, 1, 1,
1.013918, 0.3057144, -0.4578985, 1, 0, 0, 1, 1,
1.022214, 0.1208258, 2.325703, 1, 0, 0, 1, 1,
1.040268, -0.512106, 2.394156, 1, 0, 0, 1, 1,
1.042051, 0.5117384, 2.540228, 1, 0, 0, 1, 1,
1.043155, 0.2991505, 3.107198, 1, 0, 0, 1, 1,
1.047488, 1.267865, 1.094423, 0, 0, 0, 1, 1,
1.04778, -1.628146, 2.804929, 0, 0, 0, 1, 1,
1.060735, 0.3467109, -0.6897393, 0, 0, 0, 1, 1,
1.069582, 0.8531984, 2.716197, 0, 0, 0, 1, 1,
1.072282, 1.254123, 0.9465155, 0, 0, 0, 1, 1,
1.073244, 0.994011, 0.9004542, 0, 0, 0, 1, 1,
1.081086, -0.5147783, 3.576576, 0, 0, 0, 1, 1,
1.086862, -0.4320475, 2.210134, 1, 1, 1, 1, 1,
1.08708, -0.7145733, 2.287461, 1, 1, 1, 1, 1,
1.087508, 0.6115571, 1.583305, 1, 1, 1, 1, 1,
1.092846, -1.260367, 1.973476, 1, 1, 1, 1, 1,
1.099797, 1.283991, 0.3673577, 1, 1, 1, 1, 1,
1.103876, -1.671329, 3.195735, 1, 1, 1, 1, 1,
1.106923, 0.07090349, 0.1914835, 1, 1, 1, 1, 1,
1.114801, 1.604544, 0.516235, 1, 1, 1, 1, 1,
1.117385, -0.7474486, 2.131402, 1, 1, 1, 1, 1,
1.130106, 0.3783855, 0.6244844, 1, 1, 1, 1, 1,
1.130557, -0.9056459, 0.9488014, 1, 1, 1, 1, 1,
1.13813, 1.441693, -0.8433425, 1, 1, 1, 1, 1,
1.144967, -0.4877829, 1.425266, 1, 1, 1, 1, 1,
1.145166, 0.4721429, 0.3445236, 1, 1, 1, 1, 1,
1.1468, -0.3661161, 3.025875, 1, 1, 1, 1, 1,
1.158193, 0.2067324, 2.70189, 0, 0, 1, 1, 1,
1.158315, -1.261817, 1.370489, 1, 0, 0, 1, 1,
1.170971, 1.288068, 0.7738945, 1, 0, 0, 1, 1,
1.179953, 0.01631947, 1.63137, 1, 0, 0, 1, 1,
1.181819, -0.5971604, 1.963593, 1, 0, 0, 1, 1,
1.194844, -0.788167, 3.126588, 1, 0, 0, 1, 1,
1.197304, 0.8755207, -0.7246079, 0, 0, 0, 1, 1,
1.20217, 0.04177897, 1.353418, 0, 0, 0, 1, 1,
1.202223, -0.6692044, 1.077576, 0, 0, 0, 1, 1,
1.204392, -0.6125886, 1.47374, 0, 0, 0, 1, 1,
1.220795, 0.160379, -1.123316, 0, 0, 0, 1, 1,
1.224012, 0.2046966, 0.210436, 0, 0, 0, 1, 1,
1.231051, 1.428278, 0.5503215, 0, 0, 0, 1, 1,
1.243271, -1.759204, 3.159292, 1, 1, 1, 1, 1,
1.244361, 1.972927, 2.503898, 1, 1, 1, 1, 1,
1.249208, 1.256672, -0.416669, 1, 1, 1, 1, 1,
1.255406, 0.2286491, 0.2295516, 1, 1, 1, 1, 1,
1.260741, -0.1341142, 1.8564, 1, 1, 1, 1, 1,
1.26107, -1.904497, 4.326349, 1, 1, 1, 1, 1,
1.262171, -0.9918275, 1.045188, 1, 1, 1, 1, 1,
1.262334, 0.1506543, 1.851895, 1, 1, 1, 1, 1,
1.265985, -0.55107, 1.552529, 1, 1, 1, 1, 1,
1.269416, -0.6138898, -0.09431346, 1, 1, 1, 1, 1,
1.313306, 0.339283, 2.002591, 1, 1, 1, 1, 1,
1.319645, 0.02933475, 2.241596, 1, 1, 1, 1, 1,
1.326454, -0.4158199, 2.813187, 1, 1, 1, 1, 1,
1.329485, 0.5695713, 1.080174, 1, 1, 1, 1, 1,
1.353016, 0.2318463, 0.9612315, 1, 1, 1, 1, 1,
1.357662, 0.3124778, 1.432993, 0, 0, 1, 1, 1,
1.363535, -0.2149958, 1.899216, 1, 0, 0, 1, 1,
1.365685, 0.8549379, 1.570867, 1, 0, 0, 1, 1,
1.368499, 0.7302194, 1.168105, 1, 0, 0, 1, 1,
1.371082, -0.3749557, 3.084921, 1, 0, 0, 1, 1,
1.374784, -0.1856715, 0.2315451, 1, 0, 0, 1, 1,
1.375268, 0.9144064, 0.7528281, 0, 0, 0, 1, 1,
1.382631, 0.05522325, 2.289877, 0, 0, 0, 1, 1,
1.384433, -0.5645546, 0.9405244, 0, 0, 0, 1, 1,
1.395718, -1.048607, 1.758601, 0, 0, 0, 1, 1,
1.400382, 0.353378, 1.345925, 0, 0, 0, 1, 1,
1.405957, 0.991958, 0.2262805, 0, 0, 0, 1, 1,
1.406688, -0.01569702, 2.214002, 0, 0, 0, 1, 1,
1.410367, -1.243263, 0.07778712, 1, 1, 1, 1, 1,
1.411029, 0.0628291, 1.45822, 1, 1, 1, 1, 1,
1.424407, -0.9072775, 1.3573, 1, 1, 1, 1, 1,
1.425274, 0.4837041, 0.4173841, 1, 1, 1, 1, 1,
1.458001, 0.4872175, 1.103423, 1, 1, 1, 1, 1,
1.46292, -0.3661245, 2.755285, 1, 1, 1, 1, 1,
1.466865, -2.336118, 2.637221, 1, 1, 1, 1, 1,
1.473173, 0.003312798, 2.04631, 1, 1, 1, 1, 1,
1.475505, 0.1437539, 0.6451442, 1, 1, 1, 1, 1,
1.514871, -0.5140235, 3.708465, 1, 1, 1, 1, 1,
1.527171, 0.4025182, 1.708942, 1, 1, 1, 1, 1,
1.528963, 3.263171, -0.4933704, 1, 1, 1, 1, 1,
1.535545, 0.5269191, 1.483521, 1, 1, 1, 1, 1,
1.567301, 0.8207475, 0.6280018, 1, 1, 1, 1, 1,
1.578301, -0.09434895, -0.3776355, 1, 1, 1, 1, 1,
1.57854, 1.129004, 0.3171276, 0, 0, 1, 1, 1,
1.589528, 0.01809376, 3.230552, 1, 0, 0, 1, 1,
1.589914, 0.9076694, 1.478893, 1, 0, 0, 1, 1,
1.594579, -1.115864, 2.268568, 1, 0, 0, 1, 1,
1.600216, -0.0319907, 2.29586, 1, 0, 0, 1, 1,
1.606512, -0.949471, 2.9582, 1, 0, 0, 1, 1,
1.613324, -1.973244, 3.647747, 0, 0, 0, 1, 1,
1.617067, -1.107767, 1.012368, 0, 0, 0, 1, 1,
1.618082, 1.700353, 2.124583, 0, 0, 0, 1, 1,
1.627962, -1.819234, 3.379001, 0, 0, 0, 1, 1,
1.62912, 1.456743, 0.1595873, 0, 0, 0, 1, 1,
1.640227, 0.8245844, 0.4589577, 0, 0, 0, 1, 1,
1.644348, -0.1542411, 0.5639712, 0, 0, 0, 1, 1,
1.650074, -0.4668186, 2.357882, 1, 1, 1, 1, 1,
1.665953, 0.1387229, 0.72897, 1, 1, 1, 1, 1,
1.678018, -0.3881167, 1.781713, 1, 1, 1, 1, 1,
1.678498, 1.27672, 0.5888746, 1, 1, 1, 1, 1,
1.699515, 1.387357, 0.809405, 1, 1, 1, 1, 1,
1.70542, 0.6715369, 1.044514, 1, 1, 1, 1, 1,
1.712169, -0.3251082, 2.69924, 1, 1, 1, 1, 1,
1.724556, 0.7478342, 0.03502534, 1, 1, 1, 1, 1,
1.734899, 0.5518285, -0.01893474, 1, 1, 1, 1, 1,
1.749241, -0.08754562, 0.4263687, 1, 1, 1, 1, 1,
1.766023, 1.952661, -0.09642822, 1, 1, 1, 1, 1,
1.767167, 0.5754279, 1.24512, 1, 1, 1, 1, 1,
1.77803, -1.264571, 3.624436, 1, 1, 1, 1, 1,
1.804252, -0.481847, 1.724146, 1, 1, 1, 1, 1,
1.8141, -0.7680133, 2.371868, 1, 1, 1, 1, 1,
1.815804, 1.096944, 0.5089031, 0, 0, 1, 1, 1,
1.832605, 0.5575995, 0.838566, 1, 0, 0, 1, 1,
1.843058, -2.549155, 2.059216, 1, 0, 0, 1, 1,
1.858871, -0.3265509, 1.316512, 1, 0, 0, 1, 1,
1.863839, 1.060829, -0.785875, 1, 0, 0, 1, 1,
1.866714, 0.2807366, 1.504962, 1, 0, 0, 1, 1,
1.874165, 0.109702, 2.093283, 0, 0, 0, 1, 1,
1.875687, -0.3986905, 2.460806, 0, 0, 0, 1, 1,
1.89962, 0.2738753, 0.9892166, 0, 0, 0, 1, 1,
1.942078, -0.1124543, 0.9985103, 0, 0, 0, 1, 1,
2.002712, 1.917961, 1.336197, 0, 0, 0, 1, 1,
2.016816, -0.1924453, 1.021146, 0, 0, 0, 1, 1,
2.127837, 0.5331641, 1.317407, 0, 0, 0, 1, 1,
2.193869, -0.2935238, 1.668341, 1, 1, 1, 1, 1,
2.217207, 0.1656433, 0.8261455, 1, 1, 1, 1, 1,
2.247394, 0.1019229, 1.263358, 1, 1, 1, 1, 1,
2.272462, 0.2527325, 1.492133, 1, 1, 1, 1, 1,
2.399351, -0.3257631, 1.987993, 1, 1, 1, 1, 1,
2.429757, 0.4614225, 0.8396888, 1, 1, 1, 1, 1,
2.946422, 1.740812, 1.489739, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.652411;
var distance = 33.90369;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1668915, -0.1410309, -0.133255 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90369);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
