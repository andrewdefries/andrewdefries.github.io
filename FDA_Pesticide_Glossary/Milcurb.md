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
-2.839003, -1.383526, -2.745181, 1, 0, 0, 1,
-2.739248, 0.3197798, -1.066383, 1, 0.007843138, 0, 1,
-2.618771, 1.080716, -1.67142, 1, 0.01176471, 0, 1,
-2.508712, -0.2574264, -2.539621, 1, 0.01960784, 0, 1,
-2.501787, -0.01050382, -2.269568, 1, 0.02352941, 0, 1,
-2.500334, -0.1160254, -2.261826, 1, 0.03137255, 0, 1,
-2.407957, 1.779982, 0.09503734, 1, 0.03529412, 0, 1,
-2.400988, 0.1635108, -3.557988, 1, 0.04313726, 0, 1,
-2.380502, 0.9530693, -2.260104, 1, 0.04705882, 0, 1,
-2.35447, 1.017088, -1.627085, 1, 0.05490196, 0, 1,
-2.309669, 0.2425152, -0.8242689, 1, 0.05882353, 0, 1,
-2.275478, 0.164262, -0.06154357, 1, 0.06666667, 0, 1,
-2.253846, 0.6374477, -4.174772, 1, 0.07058824, 0, 1,
-2.237302, -2.241484, -1.943366, 1, 0.07843138, 0, 1,
-2.143857, 1.529048, -0.9322683, 1, 0.08235294, 0, 1,
-2.106241, -0.1511526, -1.44787, 1, 0.09019608, 0, 1,
-2.088853, -0.3033804, -1.4446, 1, 0.09411765, 0, 1,
-2.086887, -1.255586, -4.667038, 1, 0.1019608, 0, 1,
-2.085035, -0.6715464, -0.4448067, 1, 0.1098039, 0, 1,
-2.06804, -0.5564969, -1.485752, 1, 0.1137255, 0, 1,
-2.046016, -0.4846971, -3.240435, 1, 0.1215686, 0, 1,
-2.022338, 0.4484707, -0.7117765, 1, 0.1254902, 0, 1,
-2.013385, -0.8584572, -2.36682, 1, 0.1333333, 0, 1,
-1.974224, 1.449276, -0.2883633, 1, 0.1372549, 0, 1,
-1.969344, 1.651183, 0.1166414, 1, 0.145098, 0, 1,
-1.967331, -0.3195835, -0.6027263, 1, 0.1490196, 0, 1,
-1.936671, 0.8006919, -3.410658, 1, 0.1568628, 0, 1,
-1.915886, -0.841673, -1.622123, 1, 0.1607843, 0, 1,
-1.876658, -0.9235249, -2.629667, 1, 0.1686275, 0, 1,
-1.847314, -1.168646, -0.4635185, 1, 0.172549, 0, 1,
-1.843236, -0.2768404, -3.254164, 1, 0.1803922, 0, 1,
-1.842672, -0.5536034, 0.1875175, 1, 0.1843137, 0, 1,
-1.841355, -0.732897, -3.174415, 1, 0.1921569, 0, 1,
-1.838714, -0.7949267, -0.5648766, 1, 0.1960784, 0, 1,
-1.818497, -1.487411, -1.585928, 1, 0.2039216, 0, 1,
-1.806536, 0.6704499, 0.3110547, 1, 0.2117647, 0, 1,
-1.761885, -1.338419, -2.766341, 1, 0.2156863, 0, 1,
-1.761171, -0.9419484, -3.267612, 1, 0.2235294, 0, 1,
-1.748626, 1.794738, 0.01467961, 1, 0.227451, 0, 1,
-1.742542, -0.8636205, -1.725662, 1, 0.2352941, 0, 1,
-1.739179, 1.694599, -1.2119, 1, 0.2392157, 0, 1,
-1.737153, 0.2410269, -1.736321, 1, 0.2470588, 0, 1,
-1.735583, -1.295925, -1.506483, 1, 0.2509804, 0, 1,
-1.722633, -1.870675, -2.950342, 1, 0.2588235, 0, 1,
-1.703603, 0.2601938, -0.937251, 1, 0.2627451, 0, 1,
-1.680728, 0.7598477, -2.774361, 1, 0.2705882, 0, 1,
-1.679259, -1.797161, -3.486075, 1, 0.2745098, 0, 1,
-1.674483, 0.4039271, -0.7540642, 1, 0.282353, 0, 1,
-1.658273, 0.4483952, -0.5278561, 1, 0.2862745, 0, 1,
-1.653527, -0.4570453, -2.709952, 1, 0.2941177, 0, 1,
-1.647889, 0.7582916, -0.245495, 1, 0.3019608, 0, 1,
-1.63895, -0.06879418, -1.175664, 1, 0.3058824, 0, 1,
-1.599675, -0.293232, -1.693761, 1, 0.3137255, 0, 1,
-1.593531, 0.3051028, -0.8888935, 1, 0.3176471, 0, 1,
-1.588831, 0.6462843, -0.9920852, 1, 0.3254902, 0, 1,
-1.582349, 0.4836748, -2.173504, 1, 0.3294118, 0, 1,
-1.577175, 1.422916, 0.9697265, 1, 0.3372549, 0, 1,
-1.571967, -0.8013484, -2.172989, 1, 0.3411765, 0, 1,
-1.571134, -1.013479, -2.723093, 1, 0.3490196, 0, 1,
-1.562254, 0.4672821, -0.01402253, 1, 0.3529412, 0, 1,
-1.560002, 1.308988, -1.220424, 1, 0.3607843, 0, 1,
-1.553194, -1.360975, -4.07458, 1, 0.3647059, 0, 1,
-1.553154, 0.2768299, -0.2594359, 1, 0.372549, 0, 1,
-1.53788, -0.1902351, -0.4209741, 1, 0.3764706, 0, 1,
-1.535673, -0.644385, -2.893015, 1, 0.3843137, 0, 1,
-1.529939, -1.66425, -1.488242, 1, 0.3882353, 0, 1,
-1.521662, 2.697571, -2.691102, 1, 0.3960784, 0, 1,
-1.521133, -0.5473613, -3.054732, 1, 0.4039216, 0, 1,
-1.515687, -0.9162091, -1.402059, 1, 0.4078431, 0, 1,
-1.499655, 1.972463, -1.071963, 1, 0.4156863, 0, 1,
-1.497662, -0.2369025, -2.138108, 1, 0.4196078, 0, 1,
-1.472391, 1.435406, -1.877957, 1, 0.427451, 0, 1,
-1.470408, 0.4051203, 0.367435, 1, 0.4313726, 0, 1,
-1.464833, -0.2987155, -1.599468, 1, 0.4392157, 0, 1,
-1.442661, 1.611689, -0.5458593, 1, 0.4431373, 0, 1,
-1.435269, -0.005734333, -2.381298, 1, 0.4509804, 0, 1,
-1.432664, 0.5099232, -1.238322, 1, 0.454902, 0, 1,
-1.432509, 0.09156181, -2.304057, 1, 0.4627451, 0, 1,
-1.424132, 1.313592, -0.8310438, 1, 0.4666667, 0, 1,
-1.412168, 0.9671458, -1.982264, 1, 0.4745098, 0, 1,
-1.406888, -1.472698, -3.368789, 1, 0.4784314, 0, 1,
-1.404528, 0.2153323, -2.412268, 1, 0.4862745, 0, 1,
-1.399493, -1.080865, -4.011601, 1, 0.4901961, 0, 1,
-1.384092, -0.9397541, -3.725607, 1, 0.4980392, 0, 1,
-1.373159, -1.249241, -1.420321, 1, 0.5058824, 0, 1,
-1.372941, -1.065675, -2.072658, 1, 0.509804, 0, 1,
-1.357722, 0.3679122, -1.337679, 1, 0.5176471, 0, 1,
-1.349467, 0.4170721, -1.9749, 1, 0.5215687, 0, 1,
-1.348804, -0.6353861, -2.471771, 1, 0.5294118, 0, 1,
-1.325209, -0.718881, -2.798911, 1, 0.5333334, 0, 1,
-1.308725, -0.3026978, -0.6647625, 1, 0.5411765, 0, 1,
-1.282762, 0.03826282, -1.92544, 1, 0.5450981, 0, 1,
-1.281491, -0.7212423, -1.24783, 1, 0.5529412, 0, 1,
-1.280473, 0.4268831, -1.519472, 1, 0.5568628, 0, 1,
-1.279203, -0.07866253, -0.6053074, 1, 0.5647059, 0, 1,
-1.26842, -0.6369238, -2.160895, 1, 0.5686275, 0, 1,
-1.2646, 1.00326, -1.58278, 1, 0.5764706, 0, 1,
-1.263521, -1.003997, -1.029068, 1, 0.5803922, 0, 1,
-1.251037, -0.5984762, -0.4861434, 1, 0.5882353, 0, 1,
-1.249389, 0.1796085, -1.367689, 1, 0.5921569, 0, 1,
-1.238079, 0.3562754, -1.919652, 1, 0.6, 0, 1,
-1.235085, 0.2753046, -1.446951, 1, 0.6078432, 0, 1,
-1.22517, -0.1610927, -1.315841, 1, 0.6117647, 0, 1,
-1.224663, -0.4404507, -1.268741, 1, 0.6196079, 0, 1,
-1.223212, 0.4584199, -0.05937063, 1, 0.6235294, 0, 1,
-1.212358, -0.9051991, -3.027953, 1, 0.6313726, 0, 1,
-1.211089, -0.1229194, 0.3610342, 1, 0.6352941, 0, 1,
-1.210283, -1.371079, -2.140185, 1, 0.6431373, 0, 1,
-1.202339, -0.1109158, -1.534029, 1, 0.6470588, 0, 1,
-1.199016, -1.161309, -3.900971, 1, 0.654902, 0, 1,
-1.193743, -0.5851613, -2.065098, 1, 0.6588235, 0, 1,
-1.193272, -0.8613065, -2.1008, 1, 0.6666667, 0, 1,
-1.183356, 0.6244358, -1.1138, 1, 0.6705883, 0, 1,
-1.182701, 1.994219, -0.8610772, 1, 0.6784314, 0, 1,
-1.177183, 0.8298609, -1.338829, 1, 0.682353, 0, 1,
-1.171649, 0.2203626, -1.555347, 1, 0.6901961, 0, 1,
-1.157947, -0.01610668, -3.202809, 1, 0.6941177, 0, 1,
-1.156944, -0.4705965, -1.766996, 1, 0.7019608, 0, 1,
-1.150905, -0.4336832, -0.1860517, 1, 0.7098039, 0, 1,
-1.14944, -1.919901, -3.227656, 1, 0.7137255, 0, 1,
-1.147857, -0.5670117, -2.663401, 1, 0.7215686, 0, 1,
-1.131509, -0.8154506, -1.973694, 1, 0.7254902, 0, 1,
-1.123967, -1.770959, -2.889222, 1, 0.7333333, 0, 1,
-1.110279, 0.8477266, -2.843488, 1, 0.7372549, 0, 1,
-1.100585, -0.0377848, -1.092119, 1, 0.7450981, 0, 1,
-1.09537, -0.3028057, -2.99453, 1, 0.7490196, 0, 1,
-1.084721, -0.4608212, -1.929708, 1, 0.7568628, 0, 1,
-1.083239, -1.742838, -2.612467, 1, 0.7607843, 0, 1,
-1.076095, 0.4187818, -1.142401, 1, 0.7686275, 0, 1,
-1.073939, -0.0777595, 0.01656796, 1, 0.772549, 0, 1,
-1.064129, 0.05767947, -1.915437, 1, 0.7803922, 0, 1,
-1.063674, 1.041764, -0.849983, 1, 0.7843137, 0, 1,
-1.060715, 1.058758, 0.4340757, 1, 0.7921569, 0, 1,
-1.060367, -0.6627783, -0.8722661, 1, 0.7960784, 0, 1,
-1.05887, -0.3526315, -2.60023, 1, 0.8039216, 0, 1,
-1.057355, -0.5402329, -1.842975, 1, 0.8117647, 0, 1,
-1.051905, -1.639716, -3.927711, 1, 0.8156863, 0, 1,
-1.040642, -0.02627937, -1.979282, 1, 0.8235294, 0, 1,
-1.038294, -1.529946, -3.019898, 1, 0.827451, 0, 1,
-1.036356, 0.24729, -0.3958139, 1, 0.8352941, 0, 1,
-1.033369, 0.3217334, -0.6840046, 1, 0.8392157, 0, 1,
-1.02771, 0.1456184, -1.840184, 1, 0.8470588, 0, 1,
-1.02681, -0.1237804, -1.678635, 1, 0.8509804, 0, 1,
-1.02394, 1.518937, 0.1181447, 1, 0.8588235, 0, 1,
-1.023024, -1.010079, -1.419277, 1, 0.8627451, 0, 1,
-1.020414, -0.4931077, -1.867021, 1, 0.8705882, 0, 1,
-1.020349, 0.2680547, -1.434171, 1, 0.8745098, 0, 1,
-1.018183, -1.686348, -4.472695, 1, 0.8823529, 0, 1,
-1.015083, 1.299064, -0.3973545, 1, 0.8862745, 0, 1,
-1.01244, -0.8543586, -2.047662, 1, 0.8941177, 0, 1,
-1.01158, 0.5021482, -0.9257802, 1, 0.8980392, 0, 1,
-1.007617, -0.1875848, -2.488588, 1, 0.9058824, 0, 1,
-1.004141, 0.2212651, -1.469767, 1, 0.9137255, 0, 1,
-1.003182, -0.6149906, -2.231863, 1, 0.9176471, 0, 1,
-0.999203, 0.5820717, -1.895356, 1, 0.9254902, 0, 1,
-0.9991129, -0.06618839, -0.9601665, 1, 0.9294118, 0, 1,
-0.9934916, -2.155375, -2.93233, 1, 0.9372549, 0, 1,
-0.9926732, 1.609923, -0.841535, 1, 0.9411765, 0, 1,
-0.9895808, -1.508428, -1.593809, 1, 0.9490196, 0, 1,
-0.988488, 1.091117, -0.4209743, 1, 0.9529412, 0, 1,
-0.9878427, -1.49392, -2.243652, 1, 0.9607843, 0, 1,
-0.9855581, 0.6712593, -1.902579, 1, 0.9647059, 0, 1,
-0.9825525, 0.368216, 0.2507168, 1, 0.972549, 0, 1,
-0.9741736, -0.1492662, -0.6947255, 1, 0.9764706, 0, 1,
-0.9666085, 0.3544329, -4.041841, 1, 0.9843137, 0, 1,
-0.9651981, 0.4002964, -1.602985, 1, 0.9882353, 0, 1,
-0.9646657, 0.4293177, -0.6152099, 1, 0.9960784, 0, 1,
-0.9635037, -0.6741316, -0.8259435, 0.9960784, 1, 0, 1,
-0.9616891, -1.439469, -1.296146, 0.9921569, 1, 0, 1,
-0.9568679, 0.8256196, -0.6092983, 0.9843137, 1, 0, 1,
-0.9567275, -1.100046, -1.616364, 0.9803922, 1, 0, 1,
-0.9368914, 1.327022, -0.01296449, 0.972549, 1, 0, 1,
-0.9302207, 1.065686, -0.5205969, 0.9686275, 1, 0, 1,
-0.9300042, -0.8054574, -1.733697, 0.9607843, 1, 0, 1,
-0.9237151, -0.7259992, -2.776355, 0.9568627, 1, 0, 1,
-0.9206178, -0.4413184, -2.964612, 0.9490196, 1, 0, 1,
-0.9201184, -0.2252106, -1.58711, 0.945098, 1, 0, 1,
-0.9197134, -0.6436752, 0.3742269, 0.9372549, 1, 0, 1,
-0.9134949, 0.3873162, -0.3657981, 0.9333333, 1, 0, 1,
-0.9123143, -0.818341, -2.685323, 0.9254902, 1, 0, 1,
-0.9111389, -0.1469414, -3.990547, 0.9215686, 1, 0, 1,
-0.9048917, -0.1819258, -1.625916, 0.9137255, 1, 0, 1,
-0.9009837, -0.2906771, -3.657489, 0.9098039, 1, 0, 1,
-0.896118, 0.01681179, -1.412287, 0.9019608, 1, 0, 1,
-0.8931959, 0.9258618, -0.5476981, 0.8941177, 1, 0, 1,
-0.8929636, 0.4607112, -1.000787, 0.8901961, 1, 0, 1,
-0.8921019, 0.3899444, -0.9850851, 0.8823529, 1, 0, 1,
-0.8882913, -0.5130119, -3.447679, 0.8784314, 1, 0, 1,
-0.8823979, -0.663153, -2.063266, 0.8705882, 1, 0, 1,
-0.8815759, -1.457475, -2.390894, 0.8666667, 1, 0, 1,
-0.8805239, 1.491955, 1.440119, 0.8588235, 1, 0, 1,
-0.8751529, -1.114791, -3.856598, 0.854902, 1, 0, 1,
-0.8740124, 1.502685, -0.01770019, 0.8470588, 1, 0, 1,
-0.8735508, -1.073154, -2.447591, 0.8431373, 1, 0, 1,
-0.8724761, -0.3819753, -1.177924, 0.8352941, 1, 0, 1,
-0.8674664, -1.668812, -3.150353, 0.8313726, 1, 0, 1,
-0.8628154, 0.9336596, 0.3062789, 0.8235294, 1, 0, 1,
-0.8627434, -0.7857717, -1.39623, 0.8196079, 1, 0, 1,
-0.8626029, -0.7690504, -3.999491, 0.8117647, 1, 0, 1,
-0.8610599, -1.04583, -2.033818, 0.8078431, 1, 0, 1,
-0.8527123, -0.387608, -2.490969, 0.8, 1, 0, 1,
-0.848447, -0.8016878, -2.630269, 0.7921569, 1, 0, 1,
-0.8458492, -0.9260664, -2.660345, 0.7882353, 1, 0, 1,
-0.8443149, -0.9674675, -3.095829, 0.7803922, 1, 0, 1,
-0.8407821, -0.6120676, -2.705072, 0.7764706, 1, 0, 1,
-0.8394945, -1.599259, -4.154435, 0.7686275, 1, 0, 1,
-0.8384802, -0.3507289, -1.222685, 0.7647059, 1, 0, 1,
-0.825267, 0.4328545, -2.048937, 0.7568628, 1, 0, 1,
-0.8243583, -0.573247, -2.063013, 0.7529412, 1, 0, 1,
-0.81995, -0.1068377, -0.8717104, 0.7450981, 1, 0, 1,
-0.79855, -0.476596, -3.349858, 0.7411765, 1, 0, 1,
-0.7971449, -0.6354417, -1.964859, 0.7333333, 1, 0, 1,
-0.7968492, -0.09535354, -2.075363, 0.7294118, 1, 0, 1,
-0.7906783, 0.6222944, 0.09834895, 0.7215686, 1, 0, 1,
-0.7835361, 0.6512081, -1.321662, 0.7176471, 1, 0, 1,
-0.7799535, -0.4980746, -1.34689, 0.7098039, 1, 0, 1,
-0.7773386, 0.1416161, -0.69774, 0.7058824, 1, 0, 1,
-0.7758871, 2.67561, -1.589303, 0.6980392, 1, 0, 1,
-0.771834, 0.4502861, 0.3877681, 0.6901961, 1, 0, 1,
-0.7706934, 0.8264917, -1.752775, 0.6862745, 1, 0, 1,
-0.7695067, 1.401761, 0.6798664, 0.6784314, 1, 0, 1,
-0.7652084, 1.051825, -0.7919796, 0.6745098, 1, 0, 1,
-0.7607141, 0.8554434, -2.086782, 0.6666667, 1, 0, 1,
-0.7596114, 0.5059118, -1.426865, 0.6627451, 1, 0, 1,
-0.757374, 0.5815162, -0.7613133, 0.654902, 1, 0, 1,
-0.7572604, 1.388743, -0.9296116, 0.6509804, 1, 0, 1,
-0.7554317, -0.6434621, -0.6261426, 0.6431373, 1, 0, 1,
-0.7519582, 0.1342614, -2.60142, 0.6392157, 1, 0, 1,
-0.7456135, 0.43449, -1.096475, 0.6313726, 1, 0, 1,
-0.7384425, 0.1455251, -1.046667, 0.627451, 1, 0, 1,
-0.7350649, 0.7752331, -0.5040248, 0.6196079, 1, 0, 1,
-0.7349517, -0.6600711, -2.639291, 0.6156863, 1, 0, 1,
-0.7345605, 0.03498215, -0.7164709, 0.6078432, 1, 0, 1,
-0.7341431, 0.4561241, -1.451406, 0.6039216, 1, 0, 1,
-0.7340015, 1.87025, 0.3251788, 0.5960785, 1, 0, 1,
-0.7323889, -0.2030452, -1.852044, 0.5882353, 1, 0, 1,
-0.7258909, 0.4175429, 0.4959078, 0.5843138, 1, 0, 1,
-0.7258675, -0.8894954, -2.097203, 0.5764706, 1, 0, 1,
-0.7251805, 1.054222, -0.8511115, 0.572549, 1, 0, 1,
-0.7208608, 0.1423575, -1.837366, 0.5647059, 1, 0, 1,
-0.7161705, -0.279946, -2.876583, 0.5607843, 1, 0, 1,
-0.7149965, -0.7651474, -4.265162, 0.5529412, 1, 0, 1,
-0.7138828, 0.7552327, 0.1002855, 0.5490196, 1, 0, 1,
-0.7116179, 0.2218935, -2.936869, 0.5411765, 1, 0, 1,
-0.7099885, 0.8281828, 0.808014, 0.5372549, 1, 0, 1,
-0.7053794, 0.6504933, -0.8423611, 0.5294118, 1, 0, 1,
-0.7045066, -0.2044399, -2.185825, 0.5254902, 1, 0, 1,
-0.7006485, 0.5001599, -0.7038372, 0.5176471, 1, 0, 1,
-0.6958433, -0.5856533, -3.140532, 0.5137255, 1, 0, 1,
-0.6951204, -0.05133719, -1.003093, 0.5058824, 1, 0, 1,
-0.6933634, -0.4105311, -3.323392, 0.5019608, 1, 0, 1,
-0.6926512, -1.307157, -2.851479, 0.4941176, 1, 0, 1,
-0.6813414, -0.8170525, -2.021792, 0.4862745, 1, 0, 1,
-0.6807858, -0.8582935, -3.648772, 0.4823529, 1, 0, 1,
-0.6792272, 0.3877941, 0.9637164, 0.4745098, 1, 0, 1,
-0.6781942, -1.623115, -3.392909, 0.4705882, 1, 0, 1,
-0.66564, -0.7677478, -2.45607, 0.4627451, 1, 0, 1,
-0.6651611, -0.01419254, -1.821571, 0.4588235, 1, 0, 1,
-0.6616754, 0.321979, -0.8908308, 0.4509804, 1, 0, 1,
-0.6578184, -1.55259, -3.147758, 0.4470588, 1, 0, 1,
-0.6425037, -0.7574529, -3.18226, 0.4392157, 1, 0, 1,
-0.6401162, 0.2211913, -2.664836, 0.4352941, 1, 0, 1,
-0.63557, 0.1807711, -1.312525, 0.427451, 1, 0, 1,
-0.6297445, 0.6610805, -0.5386798, 0.4235294, 1, 0, 1,
-0.6294866, 0.3939633, -0.2890743, 0.4156863, 1, 0, 1,
-0.6254575, 0.5543085, -0.09825118, 0.4117647, 1, 0, 1,
-0.6252991, 0.2561376, -2.178972, 0.4039216, 1, 0, 1,
-0.6194718, -0.09766115, 1.015323, 0.3960784, 1, 0, 1,
-0.6094809, -1.001018, -2.237885, 0.3921569, 1, 0, 1,
-0.6073819, -1.298829, -2.648942, 0.3843137, 1, 0, 1,
-0.600755, 1.95117, -0.9315847, 0.3803922, 1, 0, 1,
-0.6006209, 1.012169, -0.1579282, 0.372549, 1, 0, 1,
-0.5996727, 0.3241495, -1.86713, 0.3686275, 1, 0, 1,
-0.5983478, 0.3807872, -2.596309, 0.3607843, 1, 0, 1,
-0.5977249, -0.8500999, -2.927733, 0.3568628, 1, 0, 1,
-0.5968537, -0.8456434, -2.522652, 0.3490196, 1, 0, 1,
-0.5944517, 0.2203675, -0.9944838, 0.345098, 1, 0, 1,
-0.5899844, 1.330949, 0.5265979, 0.3372549, 1, 0, 1,
-0.5849881, 0.5867546, 2.027708, 0.3333333, 1, 0, 1,
-0.5847509, -1.740799, -1.284664, 0.3254902, 1, 0, 1,
-0.5816257, -0.01100767, -2.326412, 0.3215686, 1, 0, 1,
-0.5811618, -1.479054, -2.766096, 0.3137255, 1, 0, 1,
-0.5716218, 0.04968829, -2.299143, 0.3098039, 1, 0, 1,
-0.5679384, 0.2083599, -0.5118726, 0.3019608, 1, 0, 1,
-0.5643178, 1.389462, 0.6032175, 0.2941177, 1, 0, 1,
-0.5632071, -0.09965684, -1.021395, 0.2901961, 1, 0, 1,
-0.5573454, -0.2061472, -1.973935, 0.282353, 1, 0, 1,
-0.5522494, -0.7246084, -1.671751, 0.2784314, 1, 0, 1,
-0.5384375, 1.871292, -2.843238, 0.2705882, 1, 0, 1,
-0.5353224, 0.1094987, -1.076022, 0.2666667, 1, 0, 1,
-0.5325803, -1.114273, -2.691382, 0.2588235, 1, 0, 1,
-0.5300588, -0.01242168, -2.196585, 0.254902, 1, 0, 1,
-0.5278093, -0.6654325, -3.08603, 0.2470588, 1, 0, 1,
-0.5179046, 0.3053678, -2.200027, 0.2431373, 1, 0, 1,
-0.5114402, 1.470693, -1.547499, 0.2352941, 1, 0, 1,
-0.5078437, 0.9783741, 0.1548802, 0.2313726, 1, 0, 1,
-0.4984753, 0.5138898, -0.09753187, 0.2235294, 1, 0, 1,
-0.4967026, 0.2478787, -0.8199617, 0.2196078, 1, 0, 1,
-0.4928143, 0.4525543, -0.8135997, 0.2117647, 1, 0, 1,
-0.4915513, 0.06822204, -2.074037, 0.2078431, 1, 0, 1,
-0.4884521, 0.4730129, -0.8863354, 0.2, 1, 0, 1,
-0.4854532, -0.2006217, -2.986591, 0.1921569, 1, 0, 1,
-0.484022, 0.4189248, -1.922929, 0.1882353, 1, 0, 1,
-0.4815355, -1.116731, -2.257644, 0.1803922, 1, 0, 1,
-0.481467, 0.3362057, -2.019537, 0.1764706, 1, 0, 1,
-0.4801559, 0.8421338, 0.1848947, 0.1686275, 1, 0, 1,
-0.477791, 0.7813302, -1.163285, 0.1647059, 1, 0, 1,
-0.4776843, -0.2487535, -2.534812, 0.1568628, 1, 0, 1,
-0.471797, 0.7188487, -0.5845535, 0.1529412, 1, 0, 1,
-0.4714999, 0.6302617, 0.1411167, 0.145098, 1, 0, 1,
-0.4686963, 0.2003043, -1.436076, 0.1411765, 1, 0, 1,
-0.4686108, 0.9434941, 0.3410032, 0.1333333, 1, 0, 1,
-0.4660664, 0.7710779, -0.192666, 0.1294118, 1, 0, 1,
-0.4652054, -2.088299, -2.706214, 0.1215686, 1, 0, 1,
-0.4613141, 0.3065266, -1.254374, 0.1176471, 1, 0, 1,
-0.4577603, 0.7242724, -0.8620979, 0.1098039, 1, 0, 1,
-0.457266, -0.01179866, 0.02500717, 0.1058824, 1, 0, 1,
-0.4518465, -1.55431, -3.265468, 0.09803922, 1, 0, 1,
-0.4480912, 1.162904, -0.7345497, 0.09019608, 1, 0, 1,
-0.4413731, 1.862992, 0.6549999, 0.08627451, 1, 0, 1,
-0.4397549, -0.1495614, -3.114948, 0.07843138, 1, 0, 1,
-0.4389509, -0.8787711, -2.272143, 0.07450981, 1, 0, 1,
-0.4376315, 0.07198143, -0.2795211, 0.06666667, 1, 0, 1,
-0.4358432, 0.7969701, -1.136386, 0.0627451, 1, 0, 1,
-0.4318703, 0.595894, -1.028655, 0.05490196, 1, 0, 1,
-0.4312135, -0.6432484, -2.662624, 0.05098039, 1, 0, 1,
-0.430967, 0.7858384, 0.4052628, 0.04313726, 1, 0, 1,
-0.4307536, 0.3426483, -1.071334, 0.03921569, 1, 0, 1,
-0.423274, -1.080379, -2.744204, 0.03137255, 1, 0, 1,
-0.4207873, 0.1811357, -0.8912547, 0.02745098, 1, 0, 1,
-0.419623, -1.454262, -3.636722, 0.01960784, 1, 0, 1,
-0.417064, -1.590341, -3.654523, 0.01568628, 1, 0, 1,
-0.4166344, 0.08910292, -2.456309, 0.007843138, 1, 0, 1,
-0.4157721, 0.6352235, -1.920022, 0.003921569, 1, 0, 1,
-0.4132919, 0.1583624, 0.4349047, 0, 1, 0.003921569, 1,
-0.4118741, 2.297179, 1.217058, 0, 1, 0.01176471, 1,
-0.4101721, -0.1569564, -3.906407, 0, 1, 0.01568628, 1,
-0.4089999, -0.8833584, -3.101812, 0, 1, 0.02352941, 1,
-0.408093, 0.9344364, 0.1425253, 0, 1, 0.02745098, 1,
-0.407969, 1.773685, -0.6690581, 0, 1, 0.03529412, 1,
-0.407445, 0.7237656, -0.07260635, 0, 1, 0.03921569, 1,
-0.4069731, 1.036915, -0.1060309, 0, 1, 0.04705882, 1,
-0.4066963, 1.517026, 0.04858959, 0, 1, 0.05098039, 1,
-0.4028226, -0.4396381, -2.037469, 0, 1, 0.05882353, 1,
-0.3988397, -0.4935624, -3.961684, 0, 1, 0.0627451, 1,
-0.3969521, -0.1703843, -3.398282, 0, 1, 0.07058824, 1,
-0.3896266, 0.2052086, -2.806436, 0, 1, 0.07450981, 1,
-0.3857251, 0.499411, -0.5484636, 0, 1, 0.08235294, 1,
-0.3848287, -0.7078696, -2.616602, 0, 1, 0.08627451, 1,
-0.3786156, -1.120821, -3.672995, 0, 1, 0.09411765, 1,
-0.378231, 0.3330798, -0.5433331, 0, 1, 0.1019608, 1,
-0.3760749, -2.43161, -1.499272, 0, 1, 0.1058824, 1,
-0.3748071, 1.492094, -0.4421751, 0, 1, 0.1137255, 1,
-0.3699883, -0.608638, -4.056307, 0, 1, 0.1176471, 1,
-0.3685454, -0.4345095, -1.777167, 0, 1, 0.1254902, 1,
-0.3654672, -0.2651714, -2.318217, 0, 1, 0.1294118, 1,
-0.3651232, -1.654744, -1.948574, 0, 1, 0.1372549, 1,
-0.360809, -0.965953, -3.296105, 0, 1, 0.1411765, 1,
-0.3544047, -0.3220491, -0.5253733, 0, 1, 0.1490196, 1,
-0.3542709, -0.3411846, -1.427323, 0, 1, 0.1529412, 1,
-0.35075, 0.5848941, -0.7817085, 0, 1, 0.1607843, 1,
-0.3489968, 0.5076989, 0.0884498, 0, 1, 0.1647059, 1,
-0.3476317, 0.3629888, -3.169546, 0, 1, 0.172549, 1,
-0.3452086, -0.8244784, -3.418171, 0, 1, 0.1764706, 1,
-0.3423885, 1.297009, -2.484463, 0, 1, 0.1843137, 1,
-0.3419305, 0.3304225, -2.494389, 0, 1, 0.1882353, 1,
-0.3402914, -0.1314185, -1.136865, 0, 1, 0.1960784, 1,
-0.3373634, 2.574161, 1.417409, 0, 1, 0.2039216, 1,
-0.3329826, 1.146858, 0.1693871, 0, 1, 0.2078431, 1,
-0.3315167, -0.2817068, -2.576885, 0, 1, 0.2156863, 1,
-0.3287926, -0.1014907, -1.744815, 0, 1, 0.2196078, 1,
-0.3246099, 1.171984, -2.710902, 0, 1, 0.227451, 1,
-0.3242571, -1.490904, -2.788755, 0, 1, 0.2313726, 1,
-0.3218512, 1.445116, 0.03503316, 0, 1, 0.2392157, 1,
-0.3209167, 0.5687729, -0.6998093, 0, 1, 0.2431373, 1,
-0.3201714, 1.829778, 1.068323, 0, 1, 0.2509804, 1,
-0.318957, 1.252612, 0.01549469, 0, 1, 0.254902, 1,
-0.3187711, -0.1983617, -2.301655, 0, 1, 0.2627451, 1,
-0.3182335, 0.08177311, -5.126628, 0, 1, 0.2666667, 1,
-0.3174379, -0.4265534, -1.918967, 0, 1, 0.2745098, 1,
-0.3163657, -0.583042, -4.262413, 0, 1, 0.2784314, 1,
-0.3145648, 0.2890769, -2.540753, 0, 1, 0.2862745, 1,
-0.310715, 1.173858, -1.045792, 0, 1, 0.2901961, 1,
-0.3099288, -1.586555, -1.941942, 0, 1, 0.2980392, 1,
-0.3092425, 0.8388699, -0.9211072, 0, 1, 0.3058824, 1,
-0.3081075, -1.051934, -3.793604, 0, 1, 0.3098039, 1,
-0.3078951, 0.9098549, 0.8640783, 0, 1, 0.3176471, 1,
-0.3078744, -1.307511, -2.215469, 0, 1, 0.3215686, 1,
-0.3018131, -0.2172774, -2.812514, 0, 1, 0.3294118, 1,
-0.2964944, 0.5932822, -1.855152, 0, 1, 0.3333333, 1,
-0.295557, 1.008798, -0.6306931, 0, 1, 0.3411765, 1,
-0.2954471, -0.4804449, -4.139503, 0, 1, 0.345098, 1,
-0.292092, 0.7034136, -0.2852658, 0, 1, 0.3529412, 1,
-0.2895895, 0.04282144, -1.163496, 0, 1, 0.3568628, 1,
-0.2874131, 2.55208, -1.046775, 0, 1, 0.3647059, 1,
-0.2841898, -0.6164029, -3.91292, 0, 1, 0.3686275, 1,
-0.2828046, 0.6995081, -0.7739053, 0, 1, 0.3764706, 1,
-0.2808173, -0.5792401, -2.933567, 0, 1, 0.3803922, 1,
-0.2780638, 2.203023, -0.1910163, 0, 1, 0.3882353, 1,
-0.2756919, 1.380223, 1.530578, 0, 1, 0.3921569, 1,
-0.2748712, -1.065305, -1.751406, 0, 1, 0.4, 1,
-0.2694196, -0.3868794, -2.807065, 0, 1, 0.4078431, 1,
-0.268374, -1.593065, -3.969363, 0, 1, 0.4117647, 1,
-0.2623767, 0.9863338, 0.6486555, 0, 1, 0.4196078, 1,
-0.2580256, 1.788776, -0.01199911, 0, 1, 0.4235294, 1,
-0.257761, -0.9306954, -2.734128, 0, 1, 0.4313726, 1,
-0.2562384, -1.95592, -2.571534, 0, 1, 0.4352941, 1,
-0.2494164, 0.4403913, -0.6999317, 0, 1, 0.4431373, 1,
-0.2469833, -0.7192735, -3.728656, 0, 1, 0.4470588, 1,
-0.2462911, 0.7041532, -0.7343748, 0, 1, 0.454902, 1,
-0.2398974, 0.1504916, -0.03940054, 0, 1, 0.4588235, 1,
-0.2394059, 0.3897554, -0.64157, 0, 1, 0.4666667, 1,
-0.2340178, 1.112407, -1.256016, 0, 1, 0.4705882, 1,
-0.2312687, 0.5965691, 0.9933035, 0, 1, 0.4784314, 1,
-0.2279824, -2.035627, -2.995005, 0, 1, 0.4823529, 1,
-0.2208524, -1.088382, -1.251227, 0, 1, 0.4901961, 1,
-0.2182015, 2.206333, -0.8746775, 0, 1, 0.4941176, 1,
-0.2147671, 0.6687877, 0.6563545, 0, 1, 0.5019608, 1,
-0.2135112, -1.191836, -3.87669, 0, 1, 0.509804, 1,
-0.2134648, -1.134954, -2.539603, 0, 1, 0.5137255, 1,
-0.2128397, -0.4262238, -1.740123, 0, 1, 0.5215687, 1,
-0.2109793, 0.2532437, -0.9788467, 0, 1, 0.5254902, 1,
-0.2109207, -0.1019082, -3.067244, 0, 1, 0.5333334, 1,
-0.2094156, -1.232877, -3.23516, 0, 1, 0.5372549, 1,
-0.2061933, -1.250725, -2.921786, 0, 1, 0.5450981, 1,
-0.193409, -0.2896213, -1.407475, 0, 1, 0.5490196, 1,
-0.1928044, 1.51793, -0.4162039, 0, 1, 0.5568628, 1,
-0.1927585, 0.6577322, -2.197174, 0, 1, 0.5607843, 1,
-0.1922821, 1.627297, -0.917898, 0, 1, 0.5686275, 1,
-0.1892567, -0.0317539, -1.077327, 0, 1, 0.572549, 1,
-0.1877916, 0.1488634, -0.7515907, 0, 1, 0.5803922, 1,
-0.1870722, -0.3390935, -1.373817, 0, 1, 0.5843138, 1,
-0.1827802, 0.1956748, 0.991297, 0, 1, 0.5921569, 1,
-0.1822579, -0.06344137, -1.867345, 0, 1, 0.5960785, 1,
-0.1811228, -0.2500691, -3.077105, 0, 1, 0.6039216, 1,
-0.1783499, -0.1370113, -2.463882, 0, 1, 0.6117647, 1,
-0.177252, 0.7338476, 0.08877879, 0, 1, 0.6156863, 1,
-0.1724909, 0.1544167, -2.905855, 0, 1, 0.6235294, 1,
-0.1722395, 1.13369, -0.5171414, 0, 1, 0.627451, 1,
-0.1710192, -0.8149754, -2.005267, 0, 1, 0.6352941, 1,
-0.1659615, -2.094649, -3.881268, 0, 1, 0.6392157, 1,
-0.1653801, 1.029687, 0.04140607, 0, 1, 0.6470588, 1,
-0.1576156, 0.1356093, -0.3546934, 0, 1, 0.6509804, 1,
-0.1572794, 0.4903184, 0.0181556, 0, 1, 0.6588235, 1,
-0.1536218, 0.181149, -1.007317, 0, 1, 0.6627451, 1,
-0.1532343, 1.97571, -0.6146013, 0, 1, 0.6705883, 1,
-0.1513644, -1.194578, -1.785255, 0, 1, 0.6745098, 1,
-0.1437127, 0.8867256, -0.03627626, 0, 1, 0.682353, 1,
-0.1429221, 0.3128853, -0.6105115, 0, 1, 0.6862745, 1,
-0.139885, -0.5822509, -3.370704, 0, 1, 0.6941177, 1,
-0.1378771, 1.843798, 0.5821667, 0, 1, 0.7019608, 1,
-0.1351299, -1.621096, -3.231046, 0, 1, 0.7058824, 1,
-0.135126, -0.2921221, -1.729892, 0, 1, 0.7137255, 1,
-0.1315206, -0.7399076, -3.28403, 0, 1, 0.7176471, 1,
-0.1271981, -0.8840232, -2.730812, 0, 1, 0.7254902, 1,
-0.1266552, 1.458534, 1.087783, 0, 1, 0.7294118, 1,
-0.1221112, 0.7210045, 0.6464012, 0, 1, 0.7372549, 1,
-0.1150032, 0.6398879, -0.3209022, 0, 1, 0.7411765, 1,
-0.1142869, -0.8315688, -1.822398, 0, 1, 0.7490196, 1,
-0.1102271, 0.9827679, -0.3500712, 0, 1, 0.7529412, 1,
-0.1088169, -0.8021063, -3.85903, 0, 1, 0.7607843, 1,
-0.1073917, -1.800143, -3.669203, 0, 1, 0.7647059, 1,
-0.1038904, -0.2409415, -1.54141, 0, 1, 0.772549, 1,
-0.1032398, -0.1226718, -2.355931, 0, 1, 0.7764706, 1,
-0.1026535, 0.4709153, 0.9617884, 0, 1, 0.7843137, 1,
-0.1016122, -0.3656778, -2.854193, 0, 1, 0.7882353, 1,
-0.1013972, -0.4815262, -3.431988, 0, 1, 0.7960784, 1,
-0.1008819, -0.7971185, -3.696132, 0, 1, 0.8039216, 1,
-0.09977179, -2.082887, -3.216239, 0, 1, 0.8078431, 1,
-0.09945193, 0.7359908, 0.9718381, 0, 1, 0.8156863, 1,
-0.09759185, 0.9826378, 0.7916704, 0, 1, 0.8196079, 1,
-0.09508109, -0.05640999, -1.47146, 0, 1, 0.827451, 1,
-0.08847212, 0.2400113, -1.667451, 0, 1, 0.8313726, 1,
-0.08827976, 2.033436, 0.6019039, 0, 1, 0.8392157, 1,
-0.08800539, 0.1696497, 0.1346759, 0, 1, 0.8431373, 1,
-0.08783901, 0.4405842, 0.1790605, 0, 1, 0.8509804, 1,
-0.08782057, -1.560621, -3.365947, 0, 1, 0.854902, 1,
-0.08779044, -1.69753, -1.179989, 0, 1, 0.8627451, 1,
-0.08718971, 0.4423069, 0.9879434, 0, 1, 0.8666667, 1,
-0.08302624, 0.488787, -0.5445158, 0, 1, 0.8745098, 1,
-0.08297593, -0.2407703, -2.002127, 0, 1, 0.8784314, 1,
-0.0814648, -0.562134, -0.8980185, 0, 1, 0.8862745, 1,
-0.07699305, -0.3107754, -3.414334, 0, 1, 0.8901961, 1,
-0.07312477, 1.012974, 0.1045505, 0, 1, 0.8980392, 1,
-0.07181811, -0.7109615, -1.323208, 0, 1, 0.9058824, 1,
-0.07035886, 0.3039599, 0.2291198, 0, 1, 0.9098039, 1,
-0.06380396, -0.9495088, -4.556705, 0, 1, 0.9176471, 1,
-0.06327872, 0.3233726, 1.584674, 0, 1, 0.9215686, 1,
-0.06164261, 0.6592644, -1.357086, 0, 1, 0.9294118, 1,
-0.05881378, -0.6397299, -3.495044, 0, 1, 0.9333333, 1,
-0.05555309, 0.5481058, 0.6946599, 0, 1, 0.9411765, 1,
-0.05258645, 0.0320578, -0.520124, 0, 1, 0.945098, 1,
-0.0479153, -1.579737, -3.534417, 0, 1, 0.9529412, 1,
-0.04596992, -1.527649, -3.528587, 0, 1, 0.9568627, 1,
-0.0446104, -0.1031946, -4.102724, 0, 1, 0.9647059, 1,
-0.04287502, -0.8103403, -2.682683, 0, 1, 0.9686275, 1,
-0.03817293, -0.644162, -3.788784, 0, 1, 0.9764706, 1,
-0.03105169, 1.092134, 0.5116143, 0, 1, 0.9803922, 1,
-0.03015179, -0.7724112, -4.049349, 0, 1, 0.9882353, 1,
-0.02317514, -1.00605, -2.088805, 0, 1, 0.9921569, 1,
-0.01247918, 1.280487, 0.8578192, 0, 1, 1, 1,
-0.01186878, 0.8104482, -0.6114407, 0, 0.9921569, 1, 1,
-0.009637124, -1.02565, -2.960575, 0, 0.9882353, 1, 1,
-0.009142008, 0.3378251, 0.4175521, 0, 0.9803922, 1, 1,
-0.008281467, -0.9532515, -2.696636, 0, 0.9764706, 1, 1,
-0.006801391, 0.4453309, 0.7742528, 0, 0.9686275, 1, 1,
-0.005730131, 1.094974, 1.27387, 0, 0.9647059, 1, 1,
-0.005598927, 1.037639, -0.001738522, 0, 0.9568627, 1, 1,
-0.0001095164, 2.188913, -0.4531865, 0, 0.9529412, 1, 1,
0.002636227, 0.326199, -0.6475335, 0, 0.945098, 1, 1,
0.004009559, 0.9281678, -0.9239974, 0, 0.9411765, 1, 1,
0.004335643, -0.3377819, 1.931116, 0, 0.9333333, 1, 1,
0.006056651, 1.394529, -0.5025125, 0, 0.9294118, 1, 1,
0.00826545, 0.151348, 1.451338, 0, 0.9215686, 1, 1,
0.01156681, -0.3586825, 1.683373, 0, 0.9176471, 1, 1,
0.01538504, -2.232423, 2.93703, 0, 0.9098039, 1, 1,
0.01689723, -0.1569255, 2.999286, 0, 0.9058824, 1, 1,
0.02114449, -0.8798996, 3.731956, 0, 0.8980392, 1, 1,
0.02419393, 0.9250345, -0.08453853, 0, 0.8901961, 1, 1,
0.02434537, -0.6807351, 2.928273, 0, 0.8862745, 1, 1,
0.02916015, -0.4841151, 1.578666, 0, 0.8784314, 1, 1,
0.03393407, 0.4915395, 0.896905, 0, 0.8745098, 1, 1,
0.03798487, 0.2202211, -0.89732, 0, 0.8666667, 1, 1,
0.04497929, 2.173322, -0.9602513, 0, 0.8627451, 1, 1,
0.04575533, 0.5230424, -0.7857964, 0, 0.854902, 1, 1,
0.04636099, 0.462512, 0.272884, 0, 0.8509804, 1, 1,
0.05596437, -2.265404, 3.506228, 0, 0.8431373, 1, 1,
0.06271661, 0.4250806, -0.6644924, 0, 0.8392157, 1, 1,
0.06608091, 1.927746, 1.756211, 0, 0.8313726, 1, 1,
0.07395829, 1.216892, -0.07146261, 0, 0.827451, 1, 1,
0.08535472, 1.881195, -0.7924287, 0, 0.8196079, 1, 1,
0.08547384, -0.3878159, 2.415149, 0, 0.8156863, 1, 1,
0.08689234, 0.7538553, -1.971646, 0, 0.8078431, 1, 1,
0.0882891, 0.7032792, -1.063779, 0, 0.8039216, 1, 1,
0.09449923, 0.8349155, -1.768159, 0, 0.7960784, 1, 1,
0.09469911, 0.5654822, -1.194588, 0, 0.7882353, 1, 1,
0.09717745, 0.5081738, -2.013472, 0, 0.7843137, 1, 1,
0.09990445, 0.6986746, 0.3980735, 0, 0.7764706, 1, 1,
0.1032323, -0.653116, 4.324606, 0, 0.772549, 1, 1,
0.1045877, 0.1968485, 1.0808, 0, 0.7647059, 1, 1,
0.1058557, 1.294594, -0.05382221, 0, 0.7607843, 1, 1,
0.1076002, -0.1016368, 3.508917, 0, 0.7529412, 1, 1,
0.1144363, -0.1099717, 3.503561, 0, 0.7490196, 1, 1,
0.1207425, -1.792123, 2.676986, 0, 0.7411765, 1, 1,
0.1281611, -0.3415734, 2.008277, 0, 0.7372549, 1, 1,
0.1293381, 0.7972549, 0.1133108, 0, 0.7294118, 1, 1,
0.1401801, 0.4695605, -0.8960052, 0, 0.7254902, 1, 1,
0.1496544, -0.2866787, 3.087602, 0, 0.7176471, 1, 1,
0.1537175, -0.4622186, 2.321281, 0, 0.7137255, 1, 1,
0.1567536, -0.2485458, 2.731785, 0, 0.7058824, 1, 1,
0.1577379, 0.1397707, 1.486748, 0, 0.6980392, 1, 1,
0.1592521, 0.4897901, 0.6628753, 0, 0.6941177, 1, 1,
0.1616279, 1.695551, -0.5425133, 0, 0.6862745, 1, 1,
0.1621574, -0.08069567, 2.943863, 0, 0.682353, 1, 1,
0.1695088, -0.4726622, 3.17511, 0, 0.6745098, 1, 1,
0.170613, 0.1611496, -0.1971872, 0, 0.6705883, 1, 1,
0.172666, 0.3785782, -0.08192975, 0, 0.6627451, 1, 1,
0.1735062, 0.1676333, -1.09974, 0, 0.6588235, 1, 1,
0.1736563, 0.03582123, 1.162506, 0, 0.6509804, 1, 1,
0.1748317, -0.5940936, 2.375506, 0, 0.6470588, 1, 1,
0.1756283, -2.298512, 4.3508, 0, 0.6392157, 1, 1,
0.1765232, -0.6747625, 1.843396, 0, 0.6352941, 1, 1,
0.1778805, -0.6746739, 3.210299, 0, 0.627451, 1, 1,
0.1813964, -0.352343, 3.132453, 0, 0.6235294, 1, 1,
0.1821034, -0.7737104, 3.757468, 0, 0.6156863, 1, 1,
0.1843609, -1.176597, 1.320767, 0, 0.6117647, 1, 1,
0.1843918, -1.120795, 3.30267, 0, 0.6039216, 1, 1,
0.1946394, 0.5765406, 0.4823355, 0, 0.5960785, 1, 1,
0.1970905, -0.5319803, 2.521191, 0, 0.5921569, 1, 1,
0.1975017, 1.617883, 2.37887, 0, 0.5843138, 1, 1,
0.2032411, 0.7926798, 0.1738108, 0, 0.5803922, 1, 1,
0.2094424, -1.160905, 3.013088, 0, 0.572549, 1, 1,
0.2128548, -0.6232514, 2.726978, 0, 0.5686275, 1, 1,
0.2160614, 0.3868141, 0.03387856, 0, 0.5607843, 1, 1,
0.218501, 0.6060621, 0.06284477, 0, 0.5568628, 1, 1,
0.2187769, -1.111319, 2.342874, 0, 0.5490196, 1, 1,
0.2208745, -1.517387, 3.480477, 0, 0.5450981, 1, 1,
0.2214675, 1.385017, -0.2465822, 0, 0.5372549, 1, 1,
0.2237187, -0.6549518, 2.425397, 0, 0.5333334, 1, 1,
0.2298785, 1.740131, -0.06135223, 0, 0.5254902, 1, 1,
0.2327336, -0.9242832, 2.73787, 0, 0.5215687, 1, 1,
0.2346944, -0.9822817, 3.32699, 0, 0.5137255, 1, 1,
0.2368888, -1.759631, 4.194616, 0, 0.509804, 1, 1,
0.237419, -0.745025, 1.050357, 0, 0.5019608, 1, 1,
0.2391202, -0.9361261, 2.616759, 0, 0.4941176, 1, 1,
0.243279, -1.306395, 3.94397, 0, 0.4901961, 1, 1,
0.2434998, -0.3753287, 1.665773, 0, 0.4823529, 1, 1,
0.2449755, -0.5295507, 2.693657, 0, 0.4784314, 1, 1,
0.2456542, 1.539716, 2.890398, 0, 0.4705882, 1, 1,
0.2465312, -1.04038, 3.335665, 0, 0.4666667, 1, 1,
0.2479035, 1.814469, 0.3951969, 0, 0.4588235, 1, 1,
0.2480788, -0.3220564, 3.267078, 0, 0.454902, 1, 1,
0.2488942, -0.4880618, 1.139924, 0, 0.4470588, 1, 1,
0.2513658, -1.116433, 2.689113, 0, 0.4431373, 1, 1,
0.2586854, -0.03054283, 1.664192, 0, 0.4352941, 1, 1,
0.2590081, 0.6059263, 1.442466, 0, 0.4313726, 1, 1,
0.2625281, -0.360356, 0.5099789, 0, 0.4235294, 1, 1,
0.2640213, -0.1266627, 3.081415, 0, 0.4196078, 1, 1,
0.2681948, -1.255025, 3.148775, 0, 0.4117647, 1, 1,
0.2701303, -0.3192156, 3.771664, 0, 0.4078431, 1, 1,
0.2706665, -0.1797031, 2.277154, 0, 0.4, 1, 1,
0.2707472, 1.263541, -0.3595718, 0, 0.3921569, 1, 1,
0.2764456, 1.131762, 0.2944968, 0, 0.3882353, 1, 1,
0.2778143, -1.390726, 3.035371, 0, 0.3803922, 1, 1,
0.2784273, -0.8495018, 4.639557, 0, 0.3764706, 1, 1,
0.280304, 0.5634746, 0.004043915, 0, 0.3686275, 1, 1,
0.28034, 0.05984383, 0.9235064, 0, 0.3647059, 1, 1,
0.280636, -0.6568631, 3.108516, 0, 0.3568628, 1, 1,
0.2830225, 1.699064, -0.2848356, 0, 0.3529412, 1, 1,
0.2864915, 0.745086, 1.345068, 0, 0.345098, 1, 1,
0.287683, 0.3634056, 2.087877, 0, 0.3411765, 1, 1,
0.2903588, 0.2789226, 0.7520944, 0, 0.3333333, 1, 1,
0.2956792, 0.361286, 0.2224554, 0, 0.3294118, 1, 1,
0.2991646, 2.156126, -0.7187415, 0, 0.3215686, 1, 1,
0.3084267, -0.005310391, 2.390007, 0, 0.3176471, 1, 1,
0.3106001, 0.5283719, 1.9828, 0, 0.3098039, 1, 1,
0.312893, 0.5068403, 2.258058, 0, 0.3058824, 1, 1,
0.315234, -0.04475356, 3.456452, 0, 0.2980392, 1, 1,
0.3164977, -0.02777384, 1.049497, 0, 0.2901961, 1, 1,
0.3168805, -1.295875, 1.323535, 0, 0.2862745, 1, 1,
0.3189357, -0.2708563, 2.777824, 0, 0.2784314, 1, 1,
0.3200381, 1.48782, 0.4259411, 0, 0.2745098, 1, 1,
0.3234618, 0.2034789, 0.4200674, 0, 0.2666667, 1, 1,
0.3250516, -2.482498, 3.22108, 0, 0.2627451, 1, 1,
0.325204, -0.5676919, 2.30907, 0, 0.254902, 1, 1,
0.3268406, 0.01124488, 1.893037, 0, 0.2509804, 1, 1,
0.3297586, 1.774883, -0.8007843, 0, 0.2431373, 1, 1,
0.3310301, 1.898241, 0.2198119, 0, 0.2392157, 1, 1,
0.3321802, 1.481006, 1.507252, 0, 0.2313726, 1, 1,
0.3351218, -0.449432, 3.308913, 0, 0.227451, 1, 1,
0.3369164, 0.7268, 0.2571672, 0, 0.2196078, 1, 1,
0.3376383, -0.5616586, 2.955998, 0, 0.2156863, 1, 1,
0.341565, 1.028787, 0.8096047, 0, 0.2078431, 1, 1,
0.3445357, 0.9989148, -1.354181, 0, 0.2039216, 1, 1,
0.3503198, 1.48653, 0.3774097, 0, 0.1960784, 1, 1,
0.3503956, -1.104086, 3.354414, 0, 0.1882353, 1, 1,
0.3507777, 0.2572793, 2.719959, 0, 0.1843137, 1, 1,
0.3529107, -0.3788508, 2.697576, 0, 0.1764706, 1, 1,
0.3551021, 1.688174, 0.4852989, 0, 0.172549, 1, 1,
0.3612838, 0.4655453, 0.4625474, 0, 0.1647059, 1, 1,
0.3646457, -1.065788, 1.88071, 0, 0.1607843, 1, 1,
0.3708133, -1.527322, 3.139584, 0, 0.1529412, 1, 1,
0.3714681, 0.4857897, 0.04899308, 0, 0.1490196, 1, 1,
0.374193, 0.3576848, 2.152834, 0, 0.1411765, 1, 1,
0.3742294, -0.8864611, 3.75698, 0, 0.1372549, 1, 1,
0.384255, 1.274757, -1.243453, 0, 0.1294118, 1, 1,
0.384761, 0.2458503, 0.6092204, 0, 0.1254902, 1, 1,
0.3853054, -0.6895722, 1.3947, 0, 0.1176471, 1, 1,
0.3880929, -0.1901357, 2.044472, 0, 0.1137255, 1, 1,
0.392132, -0.801993, 0.7083577, 0, 0.1058824, 1, 1,
0.3926088, -1.039289, 3.141133, 0, 0.09803922, 1, 1,
0.3932191, 1.341378, -0.07381558, 0, 0.09411765, 1, 1,
0.3962037, -1.17338, 0.8684427, 0, 0.08627451, 1, 1,
0.398166, 1.50498, 0.8639966, 0, 0.08235294, 1, 1,
0.4012903, 1.932356, 0.5016138, 0, 0.07450981, 1, 1,
0.4024051, 0.6500651, 0.8903807, 0, 0.07058824, 1, 1,
0.4051841, -0.01155632, 1.022862, 0, 0.0627451, 1, 1,
0.4132059, 1.124887, -1.753217, 0, 0.05882353, 1, 1,
0.4159719, 0.4056321, -0.09658724, 0, 0.05098039, 1, 1,
0.4177452, -0.004348237, 1.531206, 0, 0.04705882, 1, 1,
0.4238215, 0.2545548, 2.058264, 0, 0.03921569, 1, 1,
0.4268301, 0.6585796, -0.9577302, 0, 0.03529412, 1, 1,
0.4309469, 0.4577783, 1.013394, 0, 0.02745098, 1, 1,
0.4315726, -0.4137699, 3.17612, 0, 0.02352941, 1, 1,
0.4361568, 1.068088, 0.8218499, 0, 0.01568628, 1, 1,
0.4371243, -0.459837, 4.622942, 0, 0.01176471, 1, 1,
0.4436997, -0.3698542, 0.2488619, 0, 0.003921569, 1, 1,
0.4442431, 0.6392998, 0.4432175, 0.003921569, 0, 1, 1,
0.452885, -0.500282, 1.571776, 0.007843138, 0, 1, 1,
0.462141, 0.9086504, -0.1876482, 0.01568628, 0, 1, 1,
0.4627111, -0.9998266, 4.582472, 0.01960784, 0, 1, 1,
0.4636205, 1.106448, -1.053647, 0.02745098, 0, 1, 1,
0.4653859, -0.2872477, 1.610875, 0.03137255, 0, 1, 1,
0.4665326, -2.094473, 3.805749, 0.03921569, 0, 1, 1,
0.4706067, 0.7665015, 1.242779, 0.04313726, 0, 1, 1,
0.4707766, 0.2040856, 0.0485115, 0.05098039, 0, 1, 1,
0.4710273, 0.1958245, 2.677334, 0.05490196, 0, 1, 1,
0.4757481, -0.2917849, 2.692574, 0.0627451, 0, 1, 1,
0.4842615, 0.3717132, 0.7404228, 0.06666667, 0, 1, 1,
0.4871565, -0.7187291, 3.252591, 0.07450981, 0, 1, 1,
0.4935886, 1.033976, 0.2926702, 0.07843138, 0, 1, 1,
0.4993846, -0.3409163, 2.361647, 0.08627451, 0, 1, 1,
0.5010594, 0.9694359, 1.357537, 0.09019608, 0, 1, 1,
0.5054144, -0.06505023, 3.795073, 0.09803922, 0, 1, 1,
0.5069753, -1.56084, 2.370303, 0.1058824, 0, 1, 1,
0.5072229, 1.307041, 0.5211522, 0.1098039, 0, 1, 1,
0.5073591, -1.649446, 2.528357, 0.1176471, 0, 1, 1,
0.5106761, 0.8364437, 0.4307493, 0.1215686, 0, 1, 1,
0.5119722, 0.8526476, 0.1908131, 0.1294118, 0, 1, 1,
0.5123285, 0.3729148, 1.904919, 0.1333333, 0, 1, 1,
0.518123, 0.6633099, 0.07018244, 0.1411765, 0, 1, 1,
0.5182147, 0.6173352, 0.7040749, 0.145098, 0, 1, 1,
0.5216392, 1.765243, 0.8925412, 0.1529412, 0, 1, 1,
0.5217947, -0.285533, 2.133587, 0.1568628, 0, 1, 1,
0.5235711, 1.21525, 0.8938603, 0.1647059, 0, 1, 1,
0.5302294, -0.30895, 2.841549, 0.1686275, 0, 1, 1,
0.5330787, 1.138579, 1.406565, 0.1764706, 0, 1, 1,
0.5392938, 0.1966927, 0.4374032, 0.1803922, 0, 1, 1,
0.5415986, -0.7948077, 2.452437, 0.1882353, 0, 1, 1,
0.5452725, 0.9221696, -1.486288, 0.1921569, 0, 1, 1,
0.5457511, 0.9665162, 0.05519816, 0.2, 0, 1, 1,
0.5458089, 1.605859, -0.6706166, 0.2078431, 0, 1, 1,
0.5462551, 1.172477, 0.1594478, 0.2117647, 0, 1, 1,
0.5476899, 1.363574, -0.6461757, 0.2196078, 0, 1, 1,
0.5496063, 0.1112604, 0.4437667, 0.2235294, 0, 1, 1,
0.550167, -0.2690303, 2.258332, 0.2313726, 0, 1, 1,
0.5504147, -0.878144, 1.292029, 0.2352941, 0, 1, 1,
0.5518209, 0.1863987, 0.3891637, 0.2431373, 0, 1, 1,
0.5526626, 0.346919, 0.6239855, 0.2470588, 0, 1, 1,
0.554885, -1.314948, 3.144169, 0.254902, 0, 1, 1,
0.5554262, 0.7477382, 1.124623, 0.2588235, 0, 1, 1,
0.5573328, -2.964455, 3.635313, 0.2666667, 0, 1, 1,
0.5577318, 0.686115, 0.1247816, 0.2705882, 0, 1, 1,
0.5614321, 0.2278489, -0.08442447, 0.2784314, 0, 1, 1,
0.5629034, 1.445562, 2.212863, 0.282353, 0, 1, 1,
0.5639033, 0.477557, 2.148603, 0.2901961, 0, 1, 1,
0.5649905, 1.353413, -0.01968401, 0.2941177, 0, 1, 1,
0.5727133, 0.01311785, 1.743929, 0.3019608, 0, 1, 1,
0.5755693, -0.3554861, 1.929901, 0.3098039, 0, 1, 1,
0.5756563, -1.003948, 3.612482, 0.3137255, 0, 1, 1,
0.5788832, 1.09211, -0.4464164, 0.3215686, 0, 1, 1,
0.5807559, -0.2129693, 1.468712, 0.3254902, 0, 1, 1,
0.5812101, 0.3520703, 1.954012, 0.3333333, 0, 1, 1,
0.5831023, -0.7940028, 4.228448, 0.3372549, 0, 1, 1,
0.5835364, 0.7471322, -0.3627427, 0.345098, 0, 1, 1,
0.5844917, -1.10385, 3.117114, 0.3490196, 0, 1, 1,
0.5887983, -0.8684015, 2.477228, 0.3568628, 0, 1, 1,
0.5913022, 0.5681462, 0.90684, 0.3607843, 0, 1, 1,
0.5936194, 0.4514083, 1.721592, 0.3686275, 0, 1, 1,
0.5948583, 0.5530796, -0.3159161, 0.372549, 0, 1, 1,
0.6073422, 2.076842, 0.6450698, 0.3803922, 0, 1, 1,
0.6102872, 1.370666, 0.1998452, 0.3843137, 0, 1, 1,
0.6123737, 0.3585215, 0.8564193, 0.3921569, 0, 1, 1,
0.6127728, 0.8059836, -0.924225, 0.3960784, 0, 1, 1,
0.6149372, -0.906347, 1.405845, 0.4039216, 0, 1, 1,
0.616464, -1.114258, 2.605677, 0.4117647, 0, 1, 1,
0.6169268, 0.6468458, 0.4730787, 0.4156863, 0, 1, 1,
0.6186567, -0.3121303, 2.264267, 0.4235294, 0, 1, 1,
0.6210426, 0.390196, 2.030958, 0.427451, 0, 1, 1,
0.6308455, 0.4169172, -0.07662813, 0.4352941, 0, 1, 1,
0.634061, 1.369798, 0.6361152, 0.4392157, 0, 1, 1,
0.6346334, 0.07097669, 2.429592, 0.4470588, 0, 1, 1,
0.6395066, 0.1444733, -1.510809, 0.4509804, 0, 1, 1,
0.643413, -0.01003719, 1.921658, 0.4588235, 0, 1, 1,
0.6576973, -1.03283, 2.27901, 0.4627451, 0, 1, 1,
0.6614766, 0.4674861, 0.6832726, 0.4705882, 0, 1, 1,
0.6716337, -0.8580832, 4.885329, 0.4745098, 0, 1, 1,
0.6771793, -0.4715926, 0.8769478, 0.4823529, 0, 1, 1,
0.6824795, 0.2344807, 1.661619, 0.4862745, 0, 1, 1,
0.6856807, 1.217013, -0.7798579, 0.4941176, 0, 1, 1,
0.6895843, 0.8230484, 1.010563, 0.5019608, 0, 1, 1,
0.697662, 0.7326379, -0.4251013, 0.5058824, 0, 1, 1,
0.7013042, 0.7599329, 0.7613334, 0.5137255, 0, 1, 1,
0.7029971, -0.7524273, 2.545816, 0.5176471, 0, 1, 1,
0.7050142, -0.3897084, 2.000175, 0.5254902, 0, 1, 1,
0.7117686, -0.7809067, 1.663361, 0.5294118, 0, 1, 1,
0.7122734, -0.2465837, 2.060262, 0.5372549, 0, 1, 1,
0.7183822, 0.3680833, 2.05213, 0.5411765, 0, 1, 1,
0.7205243, -1.04247, 2.360987, 0.5490196, 0, 1, 1,
0.7224149, 1.307382, 0.08863182, 0.5529412, 0, 1, 1,
0.7268889, -0.4975529, 2.695401, 0.5607843, 0, 1, 1,
0.7275319, 0.03573594, 1.448849, 0.5647059, 0, 1, 1,
0.7287877, 0.2665015, 0.9624263, 0.572549, 0, 1, 1,
0.72982, 0.3712434, -0.2516975, 0.5764706, 0, 1, 1,
0.7301703, -0.7595319, 3.541281, 0.5843138, 0, 1, 1,
0.7306615, 1.203051, 0.4624361, 0.5882353, 0, 1, 1,
0.7308855, 0.7638845, 1.617187, 0.5960785, 0, 1, 1,
0.7314346, 0.3511976, 0.562924, 0.6039216, 0, 1, 1,
0.7343109, 0.7780031, -0.2009602, 0.6078432, 0, 1, 1,
0.7371278, -1.212703, 3.492959, 0.6156863, 0, 1, 1,
0.7385868, -0.8059014, 2.744537, 0.6196079, 0, 1, 1,
0.746659, 0.894677, 0.2043003, 0.627451, 0, 1, 1,
0.7497105, -0.6810856, 3.287338, 0.6313726, 0, 1, 1,
0.7514184, -0.08785714, -0.02429455, 0.6392157, 0, 1, 1,
0.75183, 0.06628585, 0.519084, 0.6431373, 0, 1, 1,
0.7523492, -1.547307, 1.659388, 0.6509804, 0, 1, 1,
0.756197, -2.278664, 1.075279, 0.654902, 0, 1, 1,
0.7571384, 0.1081775, 2.811936, 0.6627451, 0, 1, 1,
0.7667851, 0.1838921, 1.547858, 0.6666667, 0, 1, 1,
0.7670262, -0.6371323, 3.008731, 0.6745098, 0, 1, 1,
0.7698088, -0.6833414, 0.2629285, 0.6784314, 0, 1, 1,
0.7705401, 1.741844, -0.5692807, 0.6862745, 0, 1, 1,
0.776217, -0.9000458, 1.204018, 0.6901961, 0, 1, 1,
0.7776978, 0.8302308, -0.9345661, 0.6980392, 0, 1, 1,
0.7788759, -0.8555512, 2.833797, 0.7058824, 0, 1, 1,
0.7802166, 0.3993977, -0.1418922, 0.7098039, 0, 1, 1,
0.781546, 0.4512466, 2.062486, 0.7176471, 0, 1, 1,
0.7894944, -0.6927492, 4.693635, 0.7215686, 0, 1, 1,
0.789691, 0.4411105, 0.5262187, 0.7294118, 0, 1, 1,
0.7900051, 0.3288772, -0.04536085, 0.7333333, 0, 1, 1,
0.7918862, -0.2492464, 2.689416, 0.7411765, 0, 1, 1,
0.7919687, -0.1175758, 1.706646, 0.7450981, 0, 1, 1,
0.8020979, 1.488387, 0.1897733, 0.7529412, 0, 1, 1,
0.8038542, -0.388205, 1.444112, 0.7568628, 0, 1, 1,
0.8059676, -0.1795985, 0.4683037, 0.7647059, 0, 1, 1,
0.809584, 0.5472036, 1.171725, 0.7686275, 0, 1, 1,
0.8174284, -1.37117, 3.034034, 0.7764706, 0, 1, 1,
0.8178713, -1.853062, 0.9358144, 0.7803922, 0, 1, 1,
0.8193717, 1.130613, 0.07096865, 0.7882353, 0, 1, 1,
0.8228256, 0.2585581, 1.969206, 0.7921569, 0, 1, 1,
0.8230602, 0.7995939, 1.354682, 0.8, 0, 1, 1,
0.829325, 0.9552014, 1.457986, 0.8078431, 0, 1, 1,
0.8314398, 0.3368204, 1.632434, 0.8117647, 0, 1, 1,
0.8338455, -0.3559004, 2.498872, 0.8196079, 0, 1, 1,
0.8361802, 0.3097807, 1.821787, 0.8235294, 0, 1, 1,
0.8363301, -0.6122816, 1.912207, 0.8313726, 0, 1, 1,
0.8371005, 0.9380972, 1.275181, 0.8352941, 0, 1, 1,
0.837745, 0.9192444, 0.6861042, 0.8431373, 0, 1, 1,
0.8393636, 0.9104607, -1.721111, 0.8470588, 0, 1, 1,
0.8456697, 0.06989174, 1.051535, 0.854902, 0, 1, 1,
0.8512749, -1.173692, 0.9572748, 0.8588235, 0, 1, 1,
0.8513963, 1.117418, 1.132652, 0.8666667, 0, 1, 1,
0.8532857, -1.108816, 3.801312, 0.8705882, 0, 1, 1,
0.8562155, 0.5726303, 0.7743633, 0.8784314, 0, 1, 1,
0.8649821, 1.846104, 0.469722, 0.8823529, 0, 1, 1,
0.8707511, 1.302661, 0.4997392, 0.8901961, 0, 1, 1,
0.8708129, -1.090956, 1.870758, 0.8941177, 0, 1, 1,
0.871441, 0.6100503, 0.4542231, 0.9019608, 0, 1, 1,
0.8749031, 1.056319, 0.5443127, 0.9098039, 0, 1, 1,
0.8804657, 1.999343, -0.5151923, 0.9137255, 0, 1, 1,
0.8806964, -0.649956, 3.038032, 0.9215686, 0, 1, 1,
0.8814109, 0.7552815, 1.763812, 0.9254902, 0, 1, 1,
0.896716, 0.4817977, 1.455943, 0.9333333, 0, 1, 1,
0.9058395, 0.9943706, 0.8231621, 0.9372549, 0, 1, 1,
0.9067751, 2.4906, -0.1423819, 0.945098, 0, 1, 1,
0.9108682, -0.6450452, 1.673461, 0.9490196, 0, 1, 1,
0.911305, -1.892355, 2.77582, 0.9568627, 0, 1, 1,
0.9164134, -0.0235088, 2.335268, 0.9607843, 0, 1, 1,
0.9228344, -0.5502192, 2.083854, 0.9686275, 0, 1, 1,
0.9290608, 1.705599, 1.049082, 0.972549, 0, 1, 1,
0.9295248, 0.3791725, 1.026643, 0.9803922, 0, 1, 1,
0.9325563, -1.055188, 1.371706, 0.9843137, 0, 1, 1,
0.9461157, 0.640101, 0.4765125, 0.9921569, 0, 1, 1,
0.9482546, -0.9769225, 3.350974, 0.9960784, 0, 1, 1,
0.9530625, -0.4008824, 1.907457, 1, 0, 0.9960784, 1,
0.9553015, 0.2445251, 2.437367, 1, 0, 0.9882353, 1,
0.9555885, 0.3682739, 1.651744, 1, 0, 0.9843137, 1,
0.9562828, -0.7792402, 2.373649, 1, 0, 0.9764706, 1,
0.9630335, -0.939537, 2.302648, 1, 0, 0.972549, 1,
0.9632466, 0.8261496, 1.560603, 1, 0, 0.9647059, 1,
0.9634459, -0.5378239, 2.752278, 1, 0, 0.9607843, 1,
0.9691735, -0.4184307, 2.800225, 1, 0, 0.9529412, 1,
0.9695774, 0.3617021, 1.380356, 1, 0, 0.9490196, 1,
0.9760045, 0.3064024, 1.922602, 1, 0, 0.9411765, 1,
0.9799424, 0.7083605, 1.871915, 1, 0, 0.9372549, 1,
0.9836592, -1.253201, 3.117748, 1, 0, 0.9294118, 1,
0.9838812, -0.1402472, 0.5870421, 1, 0, 0.9254902, 1,
0.9996879, 0.6580415, -0.5962769, 1, 0, 0.9176471, 1,
1.005468, -1.245425, 2.630459, 1, 0, 0.9137255, 1,
1.00596, -1.112564, 1.827173, 1, 0, 0.9058824, 1,
1.008066, -0.78635, 0.823213, 1, 0, 0.9019608, 1,
1.009892, -0.3150389, 2.988203, 1, 0, 0.8941177, 1,
1.022044, -0.5576077, 2.925994, 1, 0, 0.8862745, 1,
1.022526, -0.4843811, 2.920685, 1, 0, 0.8823529, 1,
1.025354, 0.2571572, 0.8688072, 1, 0, 0.8745098, 1,
1.028227, -1.22154, 1.251703, 1, 0, 0.8705882, 1,
1.03325, -0.3709785, 1.528529, 1, 0, 0.8627451, 1,
1.033595, 1.084372, 0.05789818, 1, 0, 0.8588235, 1,
1.034287, -2.200973, 2.261589, 1, 0, 0.8509804, 1,
1.03634, 0.3936246, -0.2104526, 1, 0, 0.8470588, 1,
1.040139, 0.4759235, 0.8562997, 1, 0, 0.8392157, 1,
1.045214, 2.02065, 1.458647, 1, 0, 0.8352941, 1,
1.050647, 0.05315055, 0.747883, 1, 0, 0.827451, 1,
1.051096, -0.7693977, 1.236933, 1, 0, 0.8235294, 1,
1.058756, 0.4483079, 2.290683, 1, 0, 0.8156863, 1,
1.063627, 0.4030093, 1.241594, 1, 0, 0.8117647, 1,
1.065235, -0.007236311, 1.632829, 1, 0, 0.8039216, 1,
1.066582, -1.309413, 2.005215, 1, 0, 0.7960784, 1,
1.076815, 0.4784794, 2.04121, 1, 0, 0.7921569, 1,
1.076875, -1.492542, 3.204175, 1, 0, 0.7843137, 1,
1.078176, -0.6701512, 1.323589, 1, 0, 0.7803922, 1,
1.086144, -1.272904, 4.152465, 1, 0, 0.772549, 1,
1.095478, -0.536538, 2.595387, 1, 0, 0.7686275, 1,
1.098908, -0.1852074, 1.330814, 1, 0, 0.7607843, 1,
1.101937, 0.400653, 2.105299, 1, 0, 0.7568628, 1,
1.109633, -0.06223128, 1.985821, 1, 0, 0.7490196, 1,
1.110564, 1.343507, 0.1726677, 1, 0, 0.7450981, 1,
1.112696, 1.774671, 2.090216, 1, 0, 0.7372549, 1,
1.117848, -2.260728, 2.243262, 1, 0, 0.7333333, 1,
1.123293, -1.465167, 1.701316, 1, 0, 0.7254902, 1,
1.12589, 1.059756, 0.1352386, 1, 0, 0.7215686, 1,
1.134307, 1.260376, -0.9571669, 1, 0, 0.7137255, 1,
1.13865, -2.004714, 2.745328, 1, 0, 0.7098039, 1,
1.139296, 0.3034853, 0.6961689, 1, 0, 0.7019608, 1,
1.144056, -0.39765, 2.211799, 1, 0, 0.6941177, 1,
1.157146, 0.5648684, -1.558842, 1, 0, 0.6901961, 1,
1.164119, -1.433108, 4.095139, 1, 0, 0.682353, 1,
1.172648, -1.541832, 2.067864, 1, 0, 0.6784314, 1,
1.175744, 0.5189434, -0.8064335, 1, 0, 0.6705883, 1,
1.17649, -0.603103, 2.061081, 1, 0, 0.6666667, 1,
1.187089, 0.3713252, 2.456998, 1, 0, 0.6588235, 1,
1.19174, -1.599887, 2.104653, 1, 0, 0.654902, 1,
1.1975, -0.7687121, 1.187148, 1, 0, 0.6470588, 1,
1.21247, -0.6668724, 1.291551, 1, 0, 0.6431373, 1,
1.229775, 0.9374437, -0.3147731, 1, 0, 0.6352941, 1,
1.22988, 0.6026363, 1.82426, 1, 0, 0.6313726, 1,
1.243062, -0.3617907, 1.060172, 1, 0, 0.6235294, 1,
1.250341, 1.299047, 1.461294, 1, 0, 0.6196079, 1,
1.260201, -2.540027, 2.111944, 1, 0, 0.6117647, 1,
1.263682, -0.01275809, 3.338788, 1, 0, 0.6078432, 1,
1.269691, -0.8593311, 2.12876, 1, 0, 0.6, 1,
1.276635, 0.05903684, 1.926419, 1, 0, 0.5921569, 1,
1.279784, -1.414663, 1.679353, 1, 0, 0.5882353, 1,
1.291345, -0.2097826, 3.027005, 1, 0, 0.5803922, 1,
1.293064, -0.9292449, 0.9510875, 1, 0, 0.5764706, 1,
1.296998, 0.3270412, 0.4989946, 1, 0, 0.5686275, 1,
1.320402, -0.3144152, 2.394026, 1, 0, 0.5647059, 1,
1.322718, 0.2791504, 2.293953, 1, 0, 0.5568628, 1,
1.34034, 0.1170343, 1.463301, 1, 0, 0.5529412, 1,
1.341608, 0.3277314, 1.166392, 1, 0, 0.5450981, 1,
1.348604, 0.03002362, 1.402338, 1, 0, 0.5411765, 1,
1.356731, 1.451647, 0.7934586, 1, 0, 0.5333334, 1,
1.360252, -0.7893763, 2.2676, 1, 0, 0.5294118, 1,
1.371879, 1.184399, 1.616919, 1, 0, 0.5215687, 1,
1.37284, -0.23802, 2.437625, 1, 0, 0.5176471, 1,
1.375469, 0.3156314, 0.3312778, 1, 0, 0.509804, 1,
1.387356, -0.7513754, -0.5697533, 1, 0, 0.5058824, 1,
1.395589, -0.04604207, 1.115688, 1, 0, 0.4980392, 1,
1.396171, 1.549008, 0.8216499, 1, 0, 0.4901961, 1,
1.396203, -0.1185762, 2.340548, 1, 0, 0.4862745, 1,
1.396218, -0.7306123, 1.255795, 1, 0, 0.4784314, 1,
1.397993, 1.020235, 1.239658, 1, 0, 0.4745098, 1,
1.409524, -0.6799429, 3.074378, 1, 0, 0.4666667, 1,
1.411703, 1.412829, -0.4191492, 1, 0, 0.4627451, 1,
1.415466, -1.145395, 0.8334123, 1, 0, 0.454902, 1,
1.417143, 1.296107, 0.2603665, 1, 0, 0.4509804, 1,
1.431517, -0.1943652, 2.725989, 1, 0, 0.4431373, 1,
1.440359, 0.1993625, 2.480417, 1, 0, 0.4392157, 1,
1.455741, -1.361724, 1.296902, 1, 0, 0.4313726, 1,
1.469701, 0.7026866, 0.548735, 1, 0, 0.427451, 1,
1.475364, 1.165777, 1.826297, 1, 0, 0.4196078, 1,
1.484739, 1.171967, 2.604535, 1, 0, 0.4156863, 1,
1.502646, 1.513117, 1.286226, 1, 0, 0.4078431, 1,
1.50883, 0.5200872, 1.057106, 1, 0, 0.4039216, 1,
1.512718, -0.9925647, 1.829996, 1, 0, 0.3960784, 1,
1.526676, 2.108518, -1.075951, 1, 0, 0.3882353, 1,
1.540249, -0.1581511, 1.677867, 1, 0, 0.3843137, 1,
1.565149, -1.038116, 3.274793, 1, 0, 0.3764706, 1,
1.576101, -1.103066, 2.633628, 1, 0, 0.372549, 1,
1.579013, 0.09256919, 0.2123098, 1, 0, 0.3647059, 1,
1.583698, -0.8343383, 1.864918, 1, 0, 0.3607843, 1,
1.590096, -1.393339, 1.745684, 1, 0, 0.3529412, 1,
1.61058, 0.004769971, 1.195193, 1, 0, 0.3490196, 1,
1.611608, -0.8971887, 3.130211, 1, 0, 0.3411765, 1,
1.621742, -0.29, 1.131484, 1, 0, 0.3372549, 1,
1.639193, -1.400544, 2.503731, 1, 0, 0.3294118, 1,
1.676518, -0.1623505, 0.02682138, 1, 0, 0.3254902, 1,
1.68775, 0.04275405, 3.024803, 1, 0, 0.3176471, 1,
1.695631, 0.3084186, 1.428192, 1, 0, 0.3137255, 1,
1.701943, -0.1716549, 1.621779, 1, 0, 0.3058824, 1,
1.704051, -0.6237702, 1.441479, 1, 0, 0.2980392, 1,
1.704264, 0.9537556, -0.474697, 1, 0, 0.2941177, 1,
1.708827, -0.9241238, 1.040417, 1, 0, 0.2862745, 1,
1.70952, 0.8946911, 1.219795, 1, 0, 0.282353, 1,
1.724696, -0.7089799, -0.003759746, 1, 0, 0.2745098, 1,
1.725535, -1.224994, 1.684406, 1, 0, 0.2705882, 1,
1.74979, 0.7344738, 0.7461705, 1, 0, 0.2627451, 1,
1.753044, 0.7165712, 2.0507, 1, 0, 0.2588235, 1,
1.763655, 0.7474841, -0.2362744, 1, 0, 0.2509804, 1,
1.764835, 0.2660928, 3.332411, 1, 0, 0.2470588, 1,
1.778333, 0.9034652, -0.04542461, 1, 0, 0.2392157, 1,
1.779296, 1.20506, 1.604043, 1, 0, 0.2352941, 1,
1.783817, -0.9376633, 0.6522321, 1, 0, 0.227451, 1,
1.797774, -0.2036181, 0.9019436, 1, 0, 0.2235294, 1,
1.801833, -1.72431, 1.123822, 1, 0, 0.2156863, 1,
1.802265, -0.3407796, 1.981008, 1, 0, 0.2117647, 1,
1.82025, 0.8638785, 2.556361, 1, 0, 0.2039216, 1,
1.844359, 2.724545, 1.663007, 1, 0, 0.1960784, 1,
1.865634, 0.2709137, 1.41311, 1, 0, 0.1921569, 1,
1.873055, -0.3358033, 1.586866, 1, 0, 0.1843137, 1,
1.889767, -2.170089, 1.77041, 1, 0, 0.1803922, 1,
1.890314, 0.512361, 1.070246, 1, 0, 0.172549, 1,
1.893732, -1.099177, 0.7455077, 1, 0, 0.1686275, 1,
1.894727, 0.7730637, 0.8464905, 1, 0, 0.1607843, 1,
1.912716, 0.8083877, -0.4048614, 1, 0, 0.1568628, 1,
1.92321, 1.054898, 2.734939, 1, 0, 0.1490196, 1,
1.933953, 0.7997465, -0.7038294, 1, 0, 0.145098, 1,
1.952543, -0.501856, 1.09005, 1, 0, 0.1372549, 1,
1.964181, 0.2821144, 1.351805, 1, 0, 0.1333333, 1,
2.01266, 0.595657, 2.548413, 1, 0, 0.1254902, 1,
2.037805, 0.584987, -0.3972324, 1, 0, 0.1215686, 1,
2.096932, -0.3687147, 0.5058277, 1, 0, 0.1137255, 1,
2.138001, 1.319607, 1.256074, 1, 0, 0.1098039, 1,
2.242597, -0.4101307, 1.631775, 1, 0, 0.1019608, 1,
2.2513, 0.4710165, 1.024906, 1, 0, 0.09411765, 1,
2.265149, -1.24747, 1.595044, 1, 0, 0.09019608, 1,
2.280909, 0.5430437, 2.039165, 1, 0, 0.08235294, 1,
2.315126, 0.5574964, 0.5860468, 1, 0, 0.07843138, 1,
2.31899, -0.08214507, 2.579084, 1, 0, 0.07058824, 1,
2.34406, -1.185058, 1.779605, 1, 0, 0.06666667, 1,
2.350224, 0.01548855, 2.80237, 1, 0, 0.05882353, 1,
2.379848, -0.2755882, 1.437191, 1, 0, 0.05490196, 1,
2.402768, -0.7738315, 1.626539, 1, 0, 0.04705882, 1,
2.501568, 0.08994021, 1.665087, 1, 0, 0.04313726, 1,
2.56163, 0.5276206, 1.298234, 1, 0, 0.03529412, 1,
2.899808, 0.01272754, 2.170494, 1, 0, 0.03137255, 1,
2.928246, -0.4970569, 2.135399, 1, 0, 0.02352941, 1,
2.976735, -0.05368152, 1.147316, 1, 0, 0.01960784, 1,
3.033279, -0.397816, 1.03342, 1, 0, 0.01176471, 1,
3.068317, 0.3350829, 0.161933, 1, 0, 0.007843138, 1
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
0.1146572, -3.928741, -6.823655, 0, -0.5, 0.5, 0.5,
0.1146572, -3.928741, -6.823655, 1, -0.5, 0.5, 0.5,
0.1146572, -3.928741, -6.823655, 1, 1.5, 0.5, 0.5,
0.1146572, -3.928741, -6.823655, 0, 1.5, 0.5, 0.5
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
-3.840294, -0.1199553, -6.823655, 0, -0.5, 0.5, 0.5,
-3.840294, -0.1199553, -6.823655, 1, -0.5, 0.5, 0.5,
-3.840294, -0.1199553, -6.823655, 1, 1.5, 0.5, 0.5,
-3.840294, -0.1199553, -6.823655, 0, 1.5, 0.5, 0.5
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
-3.840294, -3.928741, -0.1206493, 0, -0.5, 0.5, 0.5,
-3.840294, -3.928741, -0.1206493, 1, -0.5, 0.5, 0.5,
-3.840294, -3.928741, -0.1206493, 1, 1.5, 0.5, 0.5,
-3.840294, -3.928741, -0.1206493, 0, 1.5, 0.5, 0.5
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
-2, -3.04979, -5.276807,
3, -3.04979, -5.276807,
-2, -3.04979, -5.276807,
-2, -3.196282, -5.534615,
-1, -3.04979, -5.276807,
-1, -3.196282, -5.534615,
0, -3.04979, -5.276807,
0, -3.196282, -5.534615,
1, -3.04979, -5.276807,
1, -3.196282, -5.534615,
2, -3.04979, -5.276807,
2, -3.196282, -5.534615,
3, -3.04979, -5.276807,
3, -3.196282, -5.534615
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-2, -3.489265, -6.050231, 0, -0.5, 0.5, 0.5,
-2, -3.489265, -6.050231, 1, -0.5, 0.5, 0.5,
-2, -3.489265, -6.050231, 1, 1.5, 0.5, 0.5,
-2, -3.489265, -6.050231, 0, 1.5, 0.5, 0.5,
-1, -3.489265, -6.050231, 0, -0.5, 0.5, 0.5,
-1, -3.489265, -6.050231, 1, -0.5, 0.5, 0.5,
-1, -3.489265, -6.050231, 1, 1.5, 0.5, 0.5,
-1, -3.489265, -6.050231, 0, 1.5, 0.5, 0.5,
0, -3.489265, -6.050231, 0, -0.5, 0.5, 0.5,
0, -3.489265, -6.050231, 1, -0.5, 0.5, 0.5,
0, -3.489265, -6.050231, 1, 1.5, 0.5, 0.5,
0, -3.489265, -6.050231, 0, 1.5, 0.5, 0.5,
1, -3.489265, -6.050231, 0, -0.5, 0.5, 0.5,
1, -3.489265, -6.050231, 1, -0.5, 0.5, 0.5,
1, -3.489265, -6.050231, 1, 1.5, 0.5, 0.5,
1, -3.489265, -6.050231, 0, 1.5, 0.5, 0.5,
2, -3.489265, -6.050231, 0, -0.5, 0.5, 0.5,
2, -3.489265, -6.050231, 1, -0.5, 0.5, 0.5,
2, -3.489265, -6.050231, 1, 1.5, 0.5, 0.5,
2, -3.489265, -6.050231, 0, 1.5, 0.5, 0.5,
3, -3.489265, -6.050231, 0, -0.5, 0.5, 0.5,
3, -3.489265, -6.050231, 1, -0.5, 0.5, 0.5,
3, -3.489265, -6.050231, 1, 1.5, 0.5, 0.5,
3, -3.489265, -6.050231, 0, 1.5, 0.5, 0.5
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
-2.927613, -2, -5.276807,
-2.927613, 2, -5.276807,
-2.927613, -2, -5.276807,
-3.079726, -2, -5.534615,
-2.927613, -1, -5.276807,
-3.079726, -1, -5.534615,
-2.927613, 0, -5.276807,
-3.079726, 0, -5.534615,
-2.927613, 1, -5.276807,
-3.079726, 1, -5.534615,
-2.927613, 2, -5.276807,
-3.079726, 2, -5.534615
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
"2"
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
-3.383953, -2, -6.050231, 0, -0.5, 0.5, 0.5,
-3.383953, -2, -6.050231, 1, -0.5, 0.5, 0.5,
-3.383953, -2, -6.050231, 1, 1.5, 0.5, 0.5,
-3.383953, -2, -6.050231, 0, 1.5, 0.5, 0.5,
-3.383953, -1, -6.050231, 0, -0.5, 0.5, 0.5,
-3.383953, -1, -6.050231, 1, -0.5, 0.5, 0.5,
-3.383953, -1, -6.050231, 1, 1.5, 0.5, 0.5,
-3.383953, -1, -6.050231, 0, 1.5, 0.5, 0.5,
-3.383953, 0, -6.050231, 0, -0.5, 0.5, 0.5,
-3.383953, 0, -6.050231, 1, -0.5, 0.5, 0.5,
-3.383953, 0, -6.050231, 1, 1.5, 0.5, 0.5,
-3.383953, 0, -6.050231, 0, 1.5, 0.5, 0.5,
-3.383953, 1, -6.050231, 0, -0.5, 0.5, 0.5,
-3.383953, 1, -6.050231, 1, -0.5, 0.5, 0.5,
-3.383953, 1, -6.050231, 1, 1.5, 0.5, 0.5,
-3.383953, 1, -6.050231, 0, 1.5, 0.5, 0.5,
-3.383953, 2, -6.050231, 0, -0.5, 0.5, 0.5,
-3.383953, 2, -6.050231, 1, -0.5, 0.5, 0.5,
-3.383953, 2, -6.050231, 1, 1.5, 0.5, 0.5,
-3.383953, 2, -6.050231, 0, 1.5, 0.5, 0.5
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
-2.927613, -3.04979, -4,
-2.927613, -3.04979, 4,
-2.927613, -3.04979, -4,
-3.079726, -3.196282, -4,
-2.927613, -3.04979, -2,
-3.079726, -3.196282, -2,
-2.927613, -3.04979, 0,
-3.079726, -3.196282, 0,
-2.927613, -3.04979, 2,
-3.079726, -3.196282, 2,
-2.927613, -3.04979, 4,
-3.079726, -3.196282, 4
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
-3.383953, -3.489265, -4, 0, -0.5, 0.5, 0.5,
-3.383953, -3.489265, -4, 1, -0.5, 0.5, 0.5,
-3.383953, -3.489265, -4, 1, 1.5, 0.5, 0.5,
-3.383953, -3.489265, -4, 0, 1.5, 0.5, 0.5,
-3.383953, -3.489265, -2, 0, -0.5, 0.5, 0.5,
-3.383953, -3.489265, -2, 1, -0.5, 0.5, 0.5,
-3.383953, -3.489265, -2, 1, 1.5, 0.5, 0.5,
-3.383953, -3.489265, -2, 0, 1.5, 0.5, 0.5,
-3.383953, -3.489265, 0, 0, -0.5, 0.5, 0.5,
-3.383953, -3.489265, 0, 1, -0.5, 0.5, 0.5,
-3.383953, -3.489265, 0, 1, 1.5, 0.5, 0.5,
-3.383953, -3.489265, 0, 0, 1.5, 0.5, 0.5,
-3.383953, -3.489265, 2, 0, -0.5, 0.5, 0.5,
-3.383953, -3.489265, 2, 1, -0.5, 0.5, 0.5,
-3.383953, -3.489265, 2, 1, 1.5, 0.5, 0.5,
-3.383953, -3.489265, 2, 0, 1.5, 0.5, 0.5,
-3.383953, -3.489265, 4, 0, -0.5, 0.5, 0.5,
-3.383953, -3.489265, 4, 1, -0.5, 0.5, 0.5,
-3.383953, -3.489265, 4, 1, 1.5, 0.5, 0.5,
-3.383953, -3.489265, 4, 0, 1.5, 0.5, 0.5
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
-2.927613, -3.04979, -5.276807,
-2.927613, 2.80988, -5.276807,
-2.927613, -3.04979, 5.035509,
-2.927613, 2.80988, 5.035509,
-2.927613, -3.04979, -5.276807,
-2.927613, -3.04979, 5.035509,
-2.927613, 2.80988, -5.276807,
-2.927613, 2.80988, 5.035509,
-2.927613, -3.04979, -5.276807,
3.156927, -3.04979, -5.276807,
-2.927613, -3.04979, 5.035509,
3.156927, -3.04979, 5.035509,
-2.927613, 2.80988, -5.276807,
3.156927, 2.80988, -5.276807,
-2.927613, 2.80988, 5.035509,
3.156927, 2.80988, 5.035509,
3.156927, -3.04979, -5.276807,
3.156927, 2.80988, -5.276807,
3.156927, -3.04979, 5.035509,
3.156927, 2.80988, 5.035509,
3.156927, -3.04979, -5.276807,
3.156927, -3.04979, 5.035509,
3.156927, 2.80988, -5.276807,
3.156927, 2.80988, 5.035509
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
var radius = 7.118208;
var distance = 31.66971;
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
mvMatrix.translate( -0.1146572, 0.1199553, 0.1206493 );
mvMatrix.scale( 1.264902, 1.313444, 0.7463257 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.66971);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Milcurb<-read.table("Milcurb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Milcurb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Milcurb' not found
```

```r
y<-Milcurb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Milcurb' not found
```

```r
z<-Milcurb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Milcurb' not found
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
-2.839003, -1.383526, -2.745181, 0, 0, 1, 1, 1,
-2.739248, 0.3197798, -1.066383, 1, 0, 0, 1, 1,
-2.618771, 1.080716, -1.67142, 1, 0, 0, 1, 1,
-2.508712, -0.2574264, -2.539621, 1, 0, 0, 1, 1,
-2.501787, -0.01050382, -2.269568, 1, 0, 0, 1, 1,
-2.500334, -0.1160254, -2.261826, 1, 0, 0, 1, 1,
-2.407957, 1.779982, 0.09503734, 0, 0, 0, 1, 1,
-2.400988, 0.1635108, -3.557988, 0, 0, 0, 1, 1,
-2.380502, 0.9530693, -2.260104, 0, 0, 0, 1, 1,
-2.35447, 1.017088, -1.627085, 0, 0, 0, 1, 1,
-2.309669, 0.2425152, -0.8242689, 0, 0, 0, 1, 1,
-2.275478, 0.164262, -0.06154357, 0, 0, 0, 1, 1,
-2.253846, 0.6374477, -4.174772, 0, 0, 0, 1, 1,
-2.237302, -2.241484, -1.943366, 1, 1, 1, 1, 1,
-2.143857, 1.529048, -0.9322683, 1, 1, 1, 1, 1,
-2.106241, -0.1511526, -1.44787, 1, 1, 1, 1, 1,
-2.088853, -0.3033804, -1.4446, 1, 1, 1, 1, 1,
-2.086887, -1.255586, -4.667038, 1, 1, 1, 1, 1,
-2.085035, -0.6715464, -0.4448067, 1, 1, 1, 1, 1,
-2.06804, -0.5564969, -1.485752, 1, 1, 1, 1, 1,
-2.046016, -0.4846971, -3.240435, 1, 1, 1, 1, 1,
-2.022338, 0.4484707, -0.7117765, 1, 1, 1, 1, 1,
-2.013385, -0.8584572, -2.36682, 1, 1, 1, 1, 1,
-1.974224, 1.449276, -0.2883633, 1, 1, 1, 1, 1,
-1.969344, 1.651183, 0.1166414, 1, 1, 1, 1, 1,
-1.967331, -0.3195835, -0.6027263, 1, 1, 1, 1, 1,
-1.936671, 0.8006919, -3.410658, 1, 1, 1, 1, 1,
-1.915886, -0.841673, -1.622123, 1, 1, 1, 1, 1,
-1.876658, -0.9235249, -2.629667, 0, 0, 1, 1, 1,
-1.847314, -1.168646, -0.4635185, 1, 0, 0, 1, 1,
-1.843236, -0.2768404, -3.254164, 1, 0, 0, 1, 1,
-1.842672, -0.5536034, 0.1875175, 1, 0, 0, 1, 1,
-1.841355, -0.732897, -3.174415, 1, 0, 0, 1, 1,
-1.838714, -0.7949267, -0.5648766, 1, 0, 0, 1, 1,
-1.818497, -1.487411, -1.585928, 0, 0, 0, 1, 1,
-1.806536, 0.6704499, 0.3110547, 0, 0, 0, 1, 1,
-1.761885, -1.338419, -2.766341, 0, 0, 0, 1, 1,
-1.761171, -0.9419484, -3.267612, 0, 0, 0, 1, 1,
-1.748626, 1.794738, 0.01467961, 0, 0, 0, 1, 1,
-1.742542, -0.8636205, -1.725662, 0, 0, 0, 1, 1,
-1.739179, 1.694599, -1.2119, 0, 0, 0, 1, 1,
-1.737153, 0.2410269, -1.736321, 1, 1, 1, 1, 1,
-1.735583, -1.295925, -1.506483, 1, 1, 1, 1, 1,
-1.722633, -1.870675, -2.950342, 1, 1, 1, 1, 1,
-1.703603, 0.2601938, -0.937251, 1, 1, 1, 1, 1,
-1.680728, 0.7598477, -2.774361, 1, 1, 1, 1, 1,
-1.679259, -1.797161, -3.486075, 1, 1, 1, 1, 1,
-1.674483, 0.4039271, -0.7540642, 1, 1, 1, 1, 1,
-1.658273, 0.4483952, -0.5278561, 1, 1, 1, 1, 1,
-1.653527, -0.4570453, -2.709952, 1, 1, 1, 1, 1,
-1.647889, 0.7582916, -0.245495, 1, 1, 1, 1, 1,
-1.63895, -0.06879418, -1.175664, 1, 1, 1, 1, 1,
-1.599675, -0.293232, -1.693761, 1, 1, 1, 1, 1,
-1.593531, 0.3051028, -0.8888935, 1, 1, 1, 1, 1,
-1.588831, 0.6462843, -0.9920852, 1, 1, 1, 1, 1,
-1.582349, 0.4836748, -2.173504, 1, 1, 1, 1, 1,
-1.577175, 1.422916, 0.9697265, 0, 0, 1, 1, 1,
-1.571967, -0.8013484, -2.172989, 1, 0, 0, 1, 1,
-1.571134, -1.013479, -2.723093, 1, 0, 0, 1, 1,
-1.562254, 0.4672821, -0.01402253, 1, 0, 0, 1, 1,
-1.560002, 1.308988, -1.220424, 1, 0, 0, 1, 1,
-1.553194, -1.360975, -4.07458, 1, 0, 0, 1, 1,
-1.553154, 0.2768299, -0.2594359, 0, 0, 0, 1, 1,
-1.53788, -0.1902351, -0.4209741, 0, 0, 0, 1, 1,
-1.535673, -0.644385, -2.893015, 0, 0, 0, 1, 1,
-1.529939, -1.66425, -1.488242, 0, 0, 0, 1, 1,
-1.521662, 2.697571, -2.691102, 0, 0, 0, 1, 1,
-1.521133, -0.5473613, -3.054732, 0, 0, 0, 1, 1,
-1.515687, -0.9162091, -1.402059, 0, 0, 0, 1, 1,
-1.499655, 1.972463, -1.071963, 1, 1, 1, 1, 1,
-1.497662, -0.2369025, -2.138108, 1, 1, 1, 1, 1,
-1.472391, 1.435406, -1.877957, 1, 1, 1, 1, 1,
-1.470408, 0.4051203, 0.367435, 1, 1, 1, 1, 1,
-1.464833, -0.2987155, -1.599468, 1, 1, 1, 1, 1,
-1.442661, 1.611689, -0.5458593, 1, 1, 1, 1, 1,
-1.435269, -0.005734333, -2.381298, 1, 1, 1, 1, 1,
-1.432664, 0.5099232, -1.238322, 1, 1, 1, 1, 1,
-1.432509, 0.09156181, -2.304057, 1, 1, 1, 1, 1,
-1.424132, 1.313592, -0.8310438, 1, 1, 1, 1, 1,
-1.412168, 0.9671458, -1.982264, 1, 1, 1, 1, 1,
-1.406888, -1.472698, -3.368789, 1, 1, 1, 1, 1,
-1.404528, 0.2153323, -2.412268, 1, 1, 1, 1, 1,
-1.399493, -1.080865, -4.011601, 1, 1, 1, 1, 1,
-1.384092, -0.9397541, -3.725607, 1, 1, 1, 1, 1,
-1.373159, -1.249241, -1.420321, 0, 0, 1, 1, 1,
-1.372941, -1.065675, -2.072658, 1, 0, 0, 1, 1,
-1.357722, 0.3679122, -1.337679, 1, 0, 0, 1, 1,
-1.349467, 0.4170721, -1.9749, 1, 0, 0, 1, 1,
-1.348804, -0.6353861, -2.471771, 1, 0, 0, 1, 1,
-1.325209, -0.718881, -2.798911, 1, 0, 0, 1, 1,
-1.308725, -0.3026978, -0.6647625, 0, 0, 0, 1, 1,
-1.282762, 0.03826282, -1.92544, 0, 0, 0, 1, 1,
-1.281491, -0.7212423, -1.24783, 0, 0, 0, 1, 1,
-1.280473, 0.4268831, -1.519472, 0, 0, 0, 1, 1,
-1.279203, -0.07866253, -0.6053074, 0, 0, 0, 1, 1,
-1.26842, -0.6369238, -2.160895, 0, 0, 0, 1, 1,
-1.2646, 1.00326, -1.58278, 0, 0, 0, 1, 1,
-1.263521, -1.003997, -1.029068, 1, 1, 1, 1, 1,
-1.251037, -0.5984762, -0.4861434, 1, 1, 1, 1, 1,
-1.249389, 0.1796085, -1.367689, 1, 1, 1, 1, 1,
-1.238079, 0.3562754, -1.919652, 1, 1, 1, 1, 1,
-1.235085, 0.2753046, -1.446951, 1, 1, 1, 1, 1,
-1.22517, -0.1610927, -1.315841, 1, 1, 1, 1, 1,
-1.224663, -0.4404507, -1.268741, 1, 1, 1, 1, 1,
-1.223212, 0.4584199, -0.05937063, 1, 1, 1, 1, 1,
-1.212358, -0.9051991, -3.027953, 1, 1, 1, 1, 1,
-1.211089, -0.1229194, 0.3610342, 1, 1, 1, 1, 1,
-1.210283, -1.371079, -2.140185, 1, 1, 1, 1, 1,
-1.202339, -0.1109158, -1.534029, 1, 1, 1, 1, 1,
-1.199016, -1.161309, -3.900971, 1, 1, 1, 1, 1,
-1.193743, -0.5851613, -2.065098, 1, 1, 1, 1, 1,
-1.193272, -0.8613065, -2.1008, 1, 1, 1, 1, 1,
-1.183356, 0.6244358, -1.1138, 0, 0, 1, 1, 1,
-1.182701, 1.994219, -0.8610772, 1, 0, 0, 1, 1,
-1.177183, 0.8298609, -1.338829, 1, 0, 0, 1, 1,
-1.171649, 0.2203626, -1.555347, 1, 0, 0, 1, 1,
-1.157947, -0.01610668, -3.202809, 1, 0, 0, 1, 1,
-1.156944, -0.4705965, -1.766996, 1, 0, 0, 1, 1,
-1.150905, -0.4336832, -0.1860517, 0, 0, 0, 1, 1,
-1.14944, -1.919901, -3.227656, 0, 0, 0, 1, 1,
-1.147857, -0.5670117, -2.663401, 0, 0, 0, 1, 1,
-1.131509, -0.8154506, -1.973694, 0, 0, 0, 1, 1,
-1.123967, -1.770959, -2.889222, 0, 0, 0, 1, 1,
-1.110279, 0.8477266, -2.843488, 0, 0, 0, 1, 1,
-1.100585, -0.0377848, -1.092119, 0, 0, 0, 1, 1,
-1.09537, -0.3028057, -2.99453, 1, 1, 1, 1, 1,
-1.084721, -0.4608212, -1.929708, 1, 1, 1, 1, 1,
-1.083239, -1.742838, -2.612467, 1, 1, 1, 1, 1,
-1.076095, 0.4187818, -1.142401, 1, 1, 1, 1, 1,
-1.073939, -0.0777595, 0.01656796, 1, 1, 1, 1, 1,
-1.064129, 0.05767947, -1.915437, 1, 1, 1, 1, 1,
-1.063674, 1.041764, -0.849983, 1, 1, 1, 1, 1,
-1.060715, 1.058758, 0.4340757, 1, 1, 1, 1, 1,
-1.060367, -0.6627783, -0.8722661, 1, 1, 1, 1, 1,
-1.05887, -0.3526315, -2.60023, 1, 1, 1, 1, 1,
-1.057355, -0.5402329, -1.842975, 1, 1, 1, 1, 1,
-1.051905, -1.639716, -3.927711, 1, 1, 1, 1, 1,
-1.040642, -0.02627937, -1.979282, 1, 1, 1, 1, 1,
-1.038294, -1.529946, -3.019898, 1, 1, 1, 1, 1,
-1.036356, 0.24729, -0.3958139, 1, 1, 1, 1, 1,
-1.033369, 0.3217334, -0.6840046, 0, 0, 1, 1, 1,
-1.02771, 0.1456184, -1.840184, 1, 0, 0, 1, 1,
-1.02681, -0.1237804, -1.678635, 1, 0, 0, 1, 1,
-1.02394, 1.518937, 0.1181447, 1, 0, 0, 1, 1,
-1.023024, -1.010079, -1.419277, 1, 0, 0, 1, 1,
-1.020414, -0.4931077, -1.867021, 1, 0, 0, 1, 1,
-1.020349, 0.2680547, -1.434171, 0, 0, 0, 1, 1,
-1.018183, -1.686348, -4.472695, 0, 0, 0, 1, 1,
-1.015083, 1.299064, -0.3973545, 0, 0, 0, 1, 1,
-1.01244, -0.8543586, -2.047662, 0, 0, 0, 1, 1,
-1.01158, 0.5021482, -0.9257802, 0, 0, 0, 1, 1,
-1.007617, -0.1875848, -2.488588, 0, 0, 0, 1, 1,
-1.004141, 0.2212651, -1.469767, 0, 0, 0, 1, 1,
-1.003182, -0.6149906, -2.231863, 1, 1, 1, 1, 1,
-0.999203, 0.5820717, -1.895356, 1, 1, 1, 1, 1,
-0.9991129, -0.06618839, -0.9601665, 1, 1, 1, 1, 1,
-0.9934916, -2.155375, -2.93233, 1, 1, 1, 1, 1,
-0.9926732, 1.609923, -0.841535, 1, 1, 1, 1, 1,
-0.9895808, -1.508428, -1.593809, 1, 1, 1, 1, 1,
-0.988488, 1.091117, -0.4209743, 1, 1, 1, 1, 1,
-0.9878427, -1.49392, -2.243652, 1, 1, 1, 1, 1,
-0.9855581, 0.6712593, -1.902579, 1, 1, 1, 1, 1,
-0.9825525, 0.368216, 0.2507168, 1, 1, 1, 1, 1,
-0.9741736, -0.1492662, -0.6947255, 1, 1, 1, 1, 1,
-0.9666085, 0.3544329, -4.041841, 1, 1, 1, 1, 1,
-0.9651981, 0.4002964, -1.602985, 1, 1, 1, 1, 1,
-0.9646657, 0.4293177, -0.6152099, 1, 1, 1, 1, 1,
-0.9635037, -0.6741316, -0.8259435, 1, 1, 1, 1, 1,
-0.9616891, -1.439469, -1.296146, 0, 0, 1, 1, 1,
-0.9568679, 0.8256196, -0.6092983, 1, 0, 0, 1, 1,
-0.9567275, -1.100046, -1.616364, 1, 0, 0, 1, 1,
-0.9368914, 1.327022, -0.01296449, 1, 0, 0, 1, 1,
-0.9302207, 1.065686, -0.5205969, 1, 0, 0, 1, 1,
-0.9300042, -0.8054574, -1.733697, 1, 0, 0, 1, 1,
-0.9237151, -0.7259992, -2.776355, 0, 0, 0, 1, 1,
-0.9206178, -0.4413184, -2.964612, 0, 0, 0, 1, 1,
-0.9201184, -0.2252106, -1.58711, 0, 0, 0, 1, 1,
-0.9197134, -0.6436752, 0.3742269, 0, 0, 0, 1, 1,
-0.9134949, 0.3873162, -0.3657981, 0, 0, 0, 1, 1,
-0.9123143, -0.818341, -2.685323, 0, 0, 0, 1, 1,
-0.9111389, -0.1469414, -3.990547, 0, 0, 0, 1, 1,
-0.9048917, -0.1819258, -1.625916, 1, 1, 1, 1, 1,
-0.9009837, -0.2906771, -3.657489, 1, 1, 1, 1, 1,
-0.896118, 0.01681179, -1.412287, 1, 1, 1, 1, 1,
-0.8931959, 0.9258618, -0.5476981, 1, 1, 1, 1, 1,
-0.8929636, 0.4607112, -1.000787, 1, 1, 1, 1, 1,
-0.8921019, 0.3899444, -0.9850851, 1, 1, 1, 1, 1,
-0.8882913, -0.5130119, -3.447679, 1, 1, 1, 1, 1,
-0.8823979, -0.663153, -2.063266, 1, 1, 1, 1, 1,
-0.8815759, -1.457475, -2.390894, 1, 1, 1, 1, 1,
-0.8805239, 1.491955, 1.440119, 1, 1, 1, 1, 1,
-0.8751529, -1.114791, -3.856598, 1, 1, 1, 1, 1,
-0.8740124, 1.502685, -0.01770019, 1, 1, 1, 1, 1,
-0.8735508, -1.073154, -2.447591, 1, 1, 1, 1, 1,
-0.8724761, -0.3819753, -1.177924, 1, 1, 1, 1, 1,
-0.8674664, -1.668812, -3.150353, 1, 1, 1, 1, 1,
-0.8628154, 0.9336596, 0.3062789, 0, 0, 1, 1, 1,
-0.8627434, -0.7857717, -1.39623, 1, 0, 0, 1, 1,
-0.8626029, -0.7690504, -3.999491, 1, 0, 0, 1, 1,
-0.8610599, -1.04583, -2.033818, 1, 0, 0, 1, 1,
-0.8527123, -0.387608, -2.490969, 1, 0, 0, 1, 1,
-0.848447, -0.8016878, -2.630269, 1, 0, 0, 1, 1,
-0.8458492, -0.9260664, -2.660345, 0, 0, 0, 1, 1,
-0.8443149, -0.9674675, -3.095829, 0, 0, 0, 1, 1,
-0.8407821, -0.6120676, -2.705072, 0, 0, 0, 1, 1,
-0.8394945, -1.599259, -4.154435, 0, 0, 0, 1, 1,
-0.8384802, -0.3507289, -1.222685, 0, 0, 0, 1, 1,
-0.825267, 0.4328545, -2.048937, 0, 0, 0, 1, 1,
-0.8243583, -0.573247, -2.063013, 0, 0, 0, 1, 1,
-0.81995, -0.1068377, -0.8717104, 1, 1, 1, 1, 1,
-0.79855, -0.476596, -3.349858, 1, 1, 1, 1, 1,
-0.7971449, -0.6354417, -1.964859, 1, 1, 1, 1, 1,
-0.7968492, -0.09535354, -2.075363, 1, 1, 1, 1, 1,
-0.7906783, 0.6222944, 0.09834895, 1, 1, 1, 1, 1,
-0.7835361, 0.6512081, -1.321662, 1, 1, 1, 1, 1,
-0.7799535, -0.4980746, -1.34689, 1, 1, 1, 1, 1,
-0.7773386, 0.1416161, -0.69774, 1, 1, 1, 1, 1,
-0.7758871, 2.67561, -1.589303, 1, 1, 1, 1, 1,
-0.771834, 0.4502861, 0.3877681, 1, 1, 1, 1, 1,
-0.7706934, 0.8264917, -1.752775, 1, 1, 1, 1, 1,
-0.7695067, 1.401761, 0.6798664, 1, 1, 1, 1, 1,
-0.7652084, 1.051825, -0.7919796, 1, 1, 1, 1, 1,
-0.7607141, 0.8554434, -2.086782, 1, 1, 1, 1, 1,
-0.7596114, 0.5059118, -1.426865, 1, 1, 1, 1, 1,
-0.757374, 0.5815162, -0.7613133, 0, 0, 1, 1, 1,
-0.7572604, 1.388743, -0.9296116, 1, 0, 0, 1, 1,
-0.7554317, -0.6434621, -0.6261426, 1, 0, 0, 1, 1,
-0.7519582, 0.1342614, -2.60142, 1, 0, 0, 1, 1,
-0.7456135, 0.43449, -1.096475, 1, 0, 0, 1, 1,
-0.7384425, 0.1455251, -1.046667, 1, 0, 0, 1, 1,
-0.7350649, 0.7752331, -0.5040248, 0, 0, 0, 1, 1,
-0.7349517, -0.6600711, -2.639291, 0, 0, 0, 1, 1,
-0.7345605, 0.03498215, -0.7164709, 0, 0, 0, 1, 1,
-0.7341431, 0.4561241, -1.451406, 0, 0, 0, 1, 1,
-0.7340015, 1.87025, 0.3251788, 0, 0, 0, 1, 1,
-0.7323889, -0.2030452, -1.852044, 0, 0, 0, 1, 1,
-0.7258909, 0.4175429, 0.4959078, 0, 0, 0, 1, 1,
-0.7258675, -0.8894954, -2.097203, 1, 1, 1, 1, 1,
-0.7251805, 1.054222, -0.8511115, 1, 1, 1, 1, 1,
-0.7208608, 0.1423575, -1.837366, 1, 1, 1, 1, 1,
-0.7161705, -0.279946, -2.876583, 1, 1, 1, 1, 1,
-0.7149965, -0.7651474, -4.265162, 1, 1, 1, 1, 1,
-0.7138828, 0.7552327, 0.1002855, 1, 1, 1, 1, 1,
-0.7116179, 0.2218935, -2.936869, 1, 1, 1, 1, 1,
-0.7099885, 0.8281828, 0.808014, 1, 1, 1, 1, 1,
-0.7053794, 0.6504933, -0.8423611, 1, 1, 1, 1, 1,
-0.7045066, -0.2044399, -2.185825, 1, 1, 1, 1, 1,
-0.7006485, 0.5001599, -0.7038372, 1, 1, 1, 1, 1,
-0.6958433, -0.5856533, -3.140532, 1, 1, 1, 1, 1,
-0.6951204, -0.05133719, -1.003093, 1, 1, 1, 1, 1,
-0.6933634, -0.4105311, -3.323392, 1, 1, 1, 1, 1,
-0.6926512, -1.307157, -2.851479, 1, 1, 1, 1, 1,
-0.6813414, -0.8170525, -2.021792, 0, 0, 1, 1, 1,
-0.6807858, -0.8582935, -3.648772, 1, 0, 0, 1, 1,
-0.6792272, 0.3877941, 0.9637164, 1, 0, 0, 1, 1,
-0.6781942, -1.623115, -3.392909, 1, 0, 0, 1, 1,
-0.66564, -0.7677478, -2.45607, 1, 0, 0, 1, 1,
-0.6651611, -0.01419254, -1.821571, 1, 0, 0, 1, 1,
-0.6616754, 0.321979, -0.8908308, 0, 0, 0, 1, 1,
-0.6578184, -1.55259, -3.147758, 0, 0, 0, 1, 1,
-0.6425037, -0.7574529, -3.18226, 0, 0, 0, 1, 1,
-0.6401162, 0.2211913, -2.664836, 0, 0, 0, 1, 1,
-0.63557, 0.1807711, -1.312525, 0, 0, 0, 1, 1,
-0.6297445, 0.6610805, -0.5386798, 0, 0, 0, 1, 1,
-0.6294866, 0.3939633, -0.2890743, 0, 0, 0, 1, 1,
-0.6254575, 0.5543085, -0.09825118, 1, 1, 1, 1, 1,
-0.6252991, 0.2561376, -2.178972, 1, 1, 1, 1, 1,
-0.6194718, -0.09766115, 1.015323, 1, 1, 1, 1, 1,
-0.6094809, -1.001018, -2.237885, 1, 1, 1, 1, 1,
-0.6073819, -1.298829, -2.648942, 1, 1, 1, 1, 1,
-0.600755, 1.95117, -0.9315847, 1, 1, 1, 1, 1,
-0.6006209, 1.012169, -0.1579282, 1, 1, 1, 1, 1,
-0.5996727, 0.3241495, -1.86713, 1, 1, 1, 1, 1,
-0.5983478, 0.3807872, -2.596309, 1, 1, 1, 1, 1,
-0.5977249, -0.8500999, -2.927733, 1, 1, 1, 1, 1,
-0.5968537, -0.8456434, -2.522652, 1, 1, 1, 1, 1,
-0.5944517, 0.2203675, -0.9944838, 1, 1, 1, 1, 1,
-0.5899844, 1.330949, 0.5265979, 1, 1, 1, 1, 1,
-0.5849881, 0.5867546, 2.027708, 1, 1, 1, 1, 1,
-0.5847509, -1.740799, -1.284664, 1, 1, 1, 1, 1,
-0.5816257, -0.01100767, -2.326412, 0, 0, 1, 1, 1,
-0.5811618, -1.479054, -2.766096, 1, 0, 0, 1, 1,
-0.5716218, 0.04968829, -2.299143, 1, 0, 0, 1, 1,
-0.5679384, 0.2083599, -0.5118726, 1, 0, 0, 1, 1,
-0.5643178, 1.389462, 0.6032175, 1, 0, 0, 1, 1,
-0.5632071, -0.09965684, -1.021395, 1, 0, 0, 1, 1,
-0.5573454, -0.2061472, -1.973935, 0, 0, 0, 1, 1,
-0.5522494, -0.7246084, -1.671751, 0, 0, 0, 1, 1,
-0.5384375, 1.871292, -2.843238, 0, 0, 0, 1, 1,
-0.5353224, 0.1094987, -1.076022, 0, 0, 0, 1, 1,
-0.5325803, -1.114273, -2.691382, 0, 0, 0, 1, 1,
-0.5300588, -0.01242168, -2.196585, 0, 0, 0, 1, 1,
-0.5278093, -0.6654325, -3.08603, 0, 0, 0, 1, 1,
-0.5179046, 0.3053678, -2.200027, 1, 1, 1, 1, 1,
-0.5114402, 1.470693, -1.547499, 1, 1, 1, 1, 1,
-0.5078437, 0.9783741, 0.1548802, 1, 1, 1, 1, 1,
-0.4984753, 0.5138898, -0.09753187, 1, 1, 1, 1, 1,
-0.4967026, 0.2478787, -0.8199617, 1, 1, 1, 1, 1,
-0.4928143, 0.4525543, -0.8135997, 1, 1, 1, 1, 1,
-0.4915513, 0.06822204, -2.074037, 1, 1, 1, 1, 1,
-0.4884521, 0.4730129, -0.8863354, 1, 1, 1, 1, 1,
-0.4854532, -0.2006217, -2.986591, 1, 1, 1, 1, 1,
-0.484022, 0.4189248, -1.922929, 1, 1, 1, 1, 1,
-0.4815355, -1.116731, -2.257644, 1, 1, 1, 1, 1,
-0.481467, 0.3362057, -2.019537, 1, 1, 1, 1, 1,
-0.4801559, 0.8421338, 0.1848947, 1, 1, 1, 1, 1,
-0.477791, 0.7813302, -1.163285, 1, 1, 1, 1, 1,
-0.4776843, -0.2487535, -2.534812, 1, 1, 1, 1, 1,
-0.471797, 0.7188487, -0.5845535, 0, 0, 1, 1, 1,
-0.4714999, 0.6302617, 0.1411167, 1, 0, 0, 1, 1,
-0.4686963, 0.2003043, -1.436076, 1, 0, 0, 1, 1,
-0.4686108, 0.9434941, 0.3410032, 1, 0, 0, 1, 1,
-0.4660664, 0.7710779, -0.192666, 1, 0, 0, 1, 1,
-0.4652054, -2.088299, -2.706214, 1, 0, 0, 1, 1,
-0.4613141, 0.3065266, -1.254374, 0, 0, 0, 1, 1,
-0.4577603, 0.7242724, -0.8620979, 0, 0, 0, 1, 1,
-0.457266, -0.01179866, 0.02500717, 0, 0, 0, 1, 1,
-0.4518465, -1.55431, -3.265468, 0, 0, 0, 1, 1,
-0.4480912, 1.162904, -0.7345497, 0, 0, 0, 1, 1,
-0.4413731, 1.862992, 0.6549999, 0, 0, 0, 1, 1,
-0.4397549, -0.1495614, -3.114948, 0, 0, 0, 1, 1,
-0.4389509, -0.8787711, -2.272143, 1, 1, 1, 1, 1,
-0.4376315, 0.07198143, -0.2795211, 1, 1, 1, 1, 1,
-0.4358432, 0.7969701, -1.136386, 1, 1, 1, 1, 1,
-0.4318703, 0.595894, -1.028655, 1, 1, 1, 1, 1,
-0.4312135, -0.6432484, -2.662624, 1, 1, 1, 1, 1,
-0.430967, 0.7858384, 0.4052628, 1, 1, 1, 1, 1,
-0.4307536, 0.3426483, -1.071334, 1, 1, 1, 1, 1,
-0.423274, -1.080379, -2.744204, 1, 1, 1, 1, 1,
-0.4207873, 0.1811357, -0.8912547, 1, 1, 1, 1, 1,
-0.419623, -1.454262, -3.636722, 1, 1, 1, 1, 1,
-0.417064, -1.590341, -3.654523, 1, 1, 1, 1, 1,
-0.4166344, 0.08910292, -2.456309, 1, 1, 1, 1, 1,
-0.4157721, 0.6352235, -1.920022, 1, 1, 1, 1, 1,
-0.4132919, 0.1583624, 0.4349047, 1, 1, 1, 1, 1,
-0.4118741, 2.297179, 1.217058, 1, 1, 1, 1, 1,
-0.4101721, -0.1569564, -3.906407, 0, 0, 1, 1, 1,
-0.4089999, -0.8833584, -3.101812, 1, 0, 0, 1, 1,
-0.408093, 0.9344364, 0.1425253, 1, 0, 0, 1, 1,
-0.407969, 1.773685, -0.6690581, 1, 0, 0, 1, 1,
-0.407445, 0.7237656, -0.07260635, 1, 0, 0, 1, 1,
-0.4069731, 1.036915, -0.1060309, 1, 0, 0, 1, 1,
-0.4066963, 1.517026, 0.04858959, 0, 0, 0, 1, 1,
-0.4028226, -0.4396381, -2.037469, 0, 0, 0, 1, 1,
-0.3988397, -0.4935624, -3.961684, 0, 0, 0, 1, 1,
-0.3969521, -0.1703843, -3.398282, 0, 0, 0, 1, 1,
-0.3896266, 0.2052086, -2.806436, 0, 0, 0, 1, 1,
-0.3857251, 0.499411, -0.5484636, 0, 0, 0, 1, 1,
-0.3848287, -0.7078696, -2.616602, 0, 0, 0, 1, 1,
-0.3786156, -1.120821, -3.672995, 1, 1, 1, 1, 1,
-0.378231, 0.3330798, -0.5433331, 1, 1, 1, 1, 1,
-0.3760749, -2.43161, -1.499272, 1, 1, 1, 1, 1,
-0.3748071, 1.492094, -0.4421751, 1, 1, 1, 1, 1,
-0.3699883, -0.608638, -4.056307, 1, 1, 1, 1, 1,
-0.3685454, -0.4345095, -1.777167, 1, 1, 1, 1, 1,
-0.3654672, -0.2651714, -2.318217, 1, 1, 1, 1, 1,
-0.3651232, -1.654744, -1.948574, 1, 1, 1, 1, 1,
-0.360809, -0.965953, -3.296105, 1, 1, 1, 1, 1,
-0.3544047, -0.3220491, -0.5253733, 1, 1, 1, 1, 1,
-0.3542709, -0.3411846, -1.427323, 1, 1, 1, 1, 1,
-0.35075, 0.5848941, -0.7817085, 1, 1, 1, 1, 1,
-0.3489968, 0.5076989, 0.0884498, 1, 1, 1, 1, 1,
-0.3476317, 0.3629888, -3.169546, 1, 1, 1, 1, 1,
-0.3452086, -0.8244784, -3.418171, 1, 1, 1, 1, 1,
-0.3423885, 1.297009, -2.484463, 0, 0, 1, 1, 1,
-0.3419305, 0.3304225, -2.494389, 1, 0, 0, 1, 1,
-0.3402914, -0.1314185, -1.136865, 1, 0, 0, 1, 1,
-0.3373634, 2.574161, 1.417409, 1, 0, 0, 1, 1,
-0.3329826, 1.146858, 0.1693871, 1, 0, 0, 1, 1,
-0.3315167, -0.2817068, -2.576885, 1, 0, 0, 1, 1,
-0.3287926, -0.1014907, -1.744815, 0, 0, 0, 1, 1,
-0.3246099, 1.171984, -2.710902, 0, 0, 0, 1, 1,
-0.3242571, -1.490904, -2.788755, 0, 0, 0, 1, 1,
-0.3218512, 1.445116, 0.03503316, 0, 0, 0, 1, 1,
-0.3209167, 0.5687729, -0.6998093, 0, 0, 0, 1, 1,
-0.3201714, 1.829778, 1.068323, 0, 0, 0, 1, 1,
-0.318957, 1.252612, 0.01549469, 0, 0, 0, 1, 1,
-0.3187711, -0.1983617, -2.301655, 1, 1, 1, 1, 1,
-0.3182335, 0.08177311, -5.126628, 1, 1, 1, 1, 1,
-0.3174379, -0.4265534, -1.918967, 1, 1, 1, 1, 1,
-0.3163657, -0.583042, -4.262413, 1, 1, 1, 1, 1,
-0.3145648, 0.2890769, -2.540753, 1, 1, 1, 1, 1,
-0.310715, 1.173858, -1.045792, 1, 1, 1, 1, 1,
-0.3099288, -1.586555, -1.941942, 1, 1, 1, 1, 1,
-0.3092425, 0.8388699, -0.9211072, 1, 1, 1, 1, 1,
-0.3081075, -1.051934, -3.793604, 1, 1, 1, 1, 1,
-0.3078951, 0.9098549, 0.8640783, 1, 1, 1, 1, 1,
-0.3078744, -1.307511, -2.215469, 1, 1, 1, 1, 1,
-0.3018131, -0.2172774, -2.812514, 1, 1, 1, 1, 1,
-0.2964944, 0.5932822, -1.855152, 1, 1, 1, 1, 1,
-0.295557, 1.008798, -0.6306931, 1, 1, 1, 1, 1,
-0.2954471, -0.4804449, -4.139503, 1, 1, 1, 1, 1,
-0.292092, 0.7034136, -0.2852658, 0, 0, 1, 1, 1,
-0.2895895, 0.04282144, -1.163496, 1, 0, 0, 1, 1,
-0.2874131, 2.55208, -1.046775, 1, 0, 0, 1, 1,
-0.2841898, -0.6164029, -3.91292, 1, 0, 0, 1, 1,
-0.2828046, 0.6995081, -0.7739053, 1, 0, 0, 1, 1,
-0.2808173, -0.5792401, -2.933567, 1, 0, 0, 1, 1,
-0.2780638, 2.203023, -0.1910163, 0, 0, 0, 1, 1,
-0.2756919, 1.380223, 1.530578, 0, 0, 0, 1, 1,
-0.2748712, -1.065305, -1.751406, 0, 0, 0, 1, 1,
-0.2694196, -0.3868794, -2.807065, 0, 0, 0, 1, 1,
-0.268374, -1.593065, -3.969363, 0, 0, 0, 1, 1,
-0.2623767, 0.9863338, 0.6486555, 0, 0, 0, 1, 1,
-0.2580256, 1.788776, -0.01199911, 0, 0, 0, 1, 1,
-0.257761, -0.9306954, -2.734128, 1, 1, 1, 1, 1,
-0.2562384, -1.95592, -2.571534, 1, 1, 1, 1, 1,
-0.2494164, 0.4403913, -0.6999317, 1, 1, 1, 1, 1,
-0.2469833, -0.7192735, -3.728656, 1, 1, 1, 1, 1,
-0.2462911, 0.7041532, -0.7343748, 1, 1, 1, 1, 1,
-0.2398974, 0.1504916, -0.03940054, 1, 1, 1, 1, 1,
-0.2394059, 0.3897554, -0.64157, 1, 1, 1, 1, 1,
-0.2340178, 1.112407, -1.256016, 1, 1, 1, 1, 1,
-0.2312687, 0.5965691, 0.9933035, 1, 1, 1, 1, 1,
-0.2279824, -2.035627, -2.995005, 1, 1, 1, 1, 1,
-0.2208524, -1.088382, -1.251227, 1, 1, 1, 1, 1,
-0.2182015, 2.206333, -0.8746775, 1, 1, 1, 1, 1,
-0.2147671, 0.6687877, 0.6563545, 1, 1, 1, 1, 1,
-0.2135112, -1.191836, -3.87669, 1, 1, 1, 1, 1,
-0.2134648, -1.134954, -2.539603, 1, 1, 1, 1, 1,
-0.2128397, -0.4262238, -1.740123, 0, 0, 1, 1, 1,
-0.2109793, 0.2532437, -0.9788467, 1, 0, 0, 1, 1,
-0.2109207, -0.1019082, -3.067244, 1, 0, 0, 1, 1,
-0.2094156, -1.232877, -3.23516, 1, 0, 0, 1, 1,
-0.2061933, -1.250725, -2.921786, 1, 0, 0, 1, 1,
-0.193409, -0.2896213, -1.407475, 1, 0, 0, 1, 1,
-0.1928044, 1.51793, -0.4162039, 0, 0, 0, 1, 1,
-0.1927585, 0.6577322, -2.197174, 0, 0, 0, 1, 1,
-0.1922821, 1.627297, -0.917898, 0, 0, 0, 1, 1,
-0.1892567, -0.0317539, -1.077327, 0, 0, 0, 1, 1,
-0.1877916, 0.1488634, -0.7515907, 0, 0, 0, 1, 1,
-0.1870722, -0.3390935, -1.373817, 0, 0, 0, 1, 1,
-0.1827802, 0.1956748, 0.991297, 0, 0, 0, 1, 1,
-0.1822579, -0.06344137, -1.867345, 1, 1, 1, 1, 1,
-0.1811228, -0.2500691, -3.077105, 1, 1, 1, 1, 1,
-0.1783499, -0.1370113, -2.463882, 1, 1, 1, 1, 1,
-0.177252, 0.7338476, 0.08877879, 1, 1, 1, 1, 1,
-0.1724909, 0.1544167, -2.905855, 1, 1, 1, 1, 1,
-0.1722395, 1.13369, -0.5171414, 1, 1, 1, 1, 1,
-0.1710192, -0.8149754, -2.005267, 1, 1, 1, 1, 1,
-0.1659615, -2.094649, -3.881268, 1, 1, 1, 1, 1,
-0.1653801, 1.029687, 0.04140607, 1, 1, 1, 1, 1,
-0.1576156, 0.1356093, -0.3546934, 1, 1, 1, 1, 1,
-0.1572794, 0.4903184, 0.0181556, 1, 1, 1, 1, 1,
-0.1536218, 0.181149, -1.007317, 1, 1, 1, 1, 1,
-0.1532343, 1.97571, -0.6146013, 1, 1, 1, 1, 1,
-0.1513644, -1.194578, -1.785255, 1, 1, 1, 1, 1,
-0.1437127, 0.8867256, -0.03627626, 1, 1, 1, 1, 1,
-0.1429221, 0.3128853, -0.6105115, 0, 0, 1, 1, 1,
-0.139885, -0.5822509, -3.370704, 1, 0, 0, 1, 1,
-0.1378771, 1.843798, 0.5821667, 1, 0, 0, 1, 1,
-0.1351299, -1.621096, -3.231046, 1, 0, 0, 1, 1,
-0.135126, -0.2921221, -1.729892, 1, 0, 0, 1, 1,
-0.1315206, -0.7399076, -3.28403, 1, 0, 0, 1, 1,
-0.1271981, -0.8840232, -2.730812, 0, 0, 0, 1, 1,
-0.1266552, 1.458534, 1.087783, 0, 0, 0, 1, 1,
-0.1221112, 0.7210045, 0.6464012, 0, 0, 0, 1, 1,
-0.1150032, 0.6398879, -0.3209022, 0, 0, 0, 1, 1,
-0.1142869, -0.8315688, -1.822398, 0, 0, 0, 1, 1,
-0.1102271, 0.9827679, -0.3500712, 0, 0, 0, 1, 1,
-0.1088169, -0.8021063, -3.85903, 0, 0, 0, 1, 1,
-0.1073917, -1.800143, -3.669203, 1, 1, 1, 1, 1,
-0.1038904, -0.2409415, -1.54141, 1, 1, 1, 1, 1,
-0.1032398, -0.1226718, -2.355931, 1, 1, 1, 1, 1,
-0.1026535, 0.4709153, 0.9617884, 1, 1, 1, 1, 1,
-0.1016122, -0.3656778, -2.854193, 1, 1, 1, 1, 1,
-0.1013972, -0.4815262, -3.431988, 1, 1, 1, 1, 1,
-0.1008819, -0.7971185, -3.696132, 1, 1, 1, 1, 1,
-0.09977179, -2.082887, -3.216239, 1, 1, 1, 1, 1,
-0.09945193, 0.7359908, 0.9718381, 1, 1, 1, 1, 1,
-0.09759185, 0.9826378, 0.7916704, 1, 1, 1, 1, 1,
-0.09508109, -0.05640999, -1.47146, 1, 1, 1, 1, 1,
-0.08847212, 0.2400113, -1.667451, 1, 1, 1, 1, 1,
-0.08827976, 2.033436, 0.6019039, 1, 1, 1, 1, 1,
-0.08800539, 0.1696497, 0.1346759, 1, 1, 1, 1, 1,
-0.08783901, 0.4405842, 0.1790605, 1, 1, 1, 1, 1,
-0.08782057, -1.560621, -3.365947, 0, 0, 1, 1, 1,
-0.08779044, -1.69753, -1.179989, 1, 0, 0, 1, 1,
-0.08718971, 0.4423069, 0.9879434, 1, 0, 0, 1, 1,
-0.08302624, 0.488787, -0.5445158, 1, 0, 0, 1, 1,
-0.08297593, -0.2407703, -2.002127, 1, 0, 0, 1, 1,
-0.0814648, -0.562134, -0.8980185, 1, 0, 0, 1, 1,
-0.07699305, -0.3107754, -3.414334, 0, 0, 0, 1, 1,
-0.07312477, 1.012974, 0.1045505, 0, 0, 0, 1, 1,
-0.07181811, -0.7109615, -1.323208, 0, 0, 0, 1, 1,
-0.07035886, 0.3039599, 0.2291198, 0, 0, 0, 1, 1,
-0.06380396, -0.9495088, -4.556705, 0, 0, 0, 1, 1,
-0.06327872, 0.3233726, 1.584674, 0, 0, 0, 1, 1,
-0.06164261, 0.6592644, -1.357086, 0, 0, 0, 1, 1,
-0.05881378, -0.6397299, -3.495044, 1, 1, 1, 1, 1,
-0.05555309, 0.5481058, 0.6946599, 1, 1, 1, 1, 1,
-0.05258645, 0.0320578, -0.520124, 1, 1, 1, 1, 1,
-0.0479153, -1.579737, -3.534417, 1, 1, 1, 1, 1,
-0.04596992, -1.527649, -3.528587, 1, 1, 1, 1, 1,
-0.0446104, -0.1031946, -4.102724, 1, 1, 1, 1, 1,
-0.04287502, -0.8103403, -2.682683, 1, 1, 1, 1, 1,
-0.03817293, -0.644162, -3.788784, 1, 1, 1, 1, 1,
-0.03105169, 1.092134, 0.5116143, 1, 1, 1, 1, 1,
-0.03015179, -0.7724112, -4.049349, 1, 1, 1, 1, 1,
-0.02317514, -1.00605, -2.088805, 1, 1, 1, 1, 1,
-0.01247918, 1.280487, 0.8578192, 1, 1, 1, 1, 1,
-0.01186878, 0.8104482, -0.6114407, 1, 1, 1, 1, 1,
-0.009637124, -1.02565, -2.960575, 1, 1, 1, 1, 1,
-0.009142008, 0.3378251, 0.4175521, 1, 1, 1, 1, 1,
-0.008281467, -0.9532515, -2.696636, 0, 0, 1, 1, 1,
-0.006801391, 0.4453309, 0.7742528, 1, 0, 0, 1, 1,
-0.005730131, 1.094974, 1.27387, 1, 0, 0, 1, 1,
-0.005598927, 1.037639, -0.001738522, 1, 0, 0, 1, 1,
-0.0001095164, 2.188913, -0.4531865, 1, 0, 0, 1, 1,
0.002636227, 0.326199, -0.6475335, 1, 0, 0, 1, 1,
0.004009559, 0.9281678, -0.9239974, 0, 0, 0, 1, 1,
0.004335643, -0.3377819, 1.931116, 0, 0, 0, 1, 1,
0.006056651, 1.394529, -0.5025125, 0, 0, 0, 1, 1,
0.00826545, 0.151348, 1.451338, 0, 0, 0, 1, 1,
0.01156681, -0.3586825, 1.683373, 0, 0, 0, 1, 1,
0.01538504, -2.232423, 2.93703, 0, 0, 0, 1, 1,
0.01689723, -0.1569255, 2.999286, 0, 0, 0, 1, 1,
0.02114449, -0.8798996, 3.731956, 1, 1, 1, 1, 1,
0.02419393, 0.9250345, -0.08453853, 1, 1, 1, 1, 1,
0.02434537, -0.6807351, 2.928273, 1, 1, 1, 1, 1,
0.02916015, -0.4841151, 1.578666, 1, 1, 1, 1, 1,
0.03393407, 0.4915395, 0.896905, 1, 1, 1, 1, 1,
0.03798487, 0.2202211, -0.89732, 1, 1, 1, 1, 1,
0.04497929, 2.173322, -0.9602513, 1, 1, 1, 1, 1,
0.04575533, 0.5230424, -0.7857964, 1, 1, 1, 1, 1,
0.04636099, 0.462512, 0.272884, 1, 1, 1, 1, 1,
0.05596437, -2.265404, 3.506228, 1, 1, 1, 1, 1,
0.06271661, 0.4250806, -0.6644924, 1, 1, 1, 1, 1,
0.06608091, 1.927746, 1.756211, 1, 1, 1, 1, 1,
0.07395829, 1.216892, -0.07146261, 1, 1, 1, 1, 1,
0.08535472, 1.881195, -0.7924287, 1, 1, 1, 1, 1,
0.08547384, -0.3878159, 2.415149, 1, 1, 1, 1, 1,
0.08689234, 0.7538553, -1.971646, 0, 0, 1, 1, 1,
0.0882891, 0.7032792, -1.063779, 1, 0, 0, 1, 1,
0.09449923, 0.8349155, -1.768159, 1, 0, 0, 1, 1,
0.09469911, 0.5654822, -1.194588, 1, 0, 0, 1, 1,
0.09717745, 0.5081738, -2.013472, 1, 0, 0, 1, 1,
0.09990445, 0.6986746, 0.3980735, 1, 0, 0, 1, 1,
0.1032323, -0.653116, 4.324606, 0, 0, 0, 1, 1,
0.1045877, 0.1968485, 1.0808, 0, 0, 0, 1, 1,
0.1058557, 1.294594, -0.05382221, 0, 0, 0, 1, 1,
0.1076002, -0.1016368, 3.508917, 0, 0, 0, 1, 1,
0.1144363, -0.1099717, 3.503561, 0, 0, 0, 1, 1,
0.1207425, -1.792123, 2.676986, 0, 0, 0, 1, 1,
0.1281611, -0.3415734, 2.008277, 0, 0, 0, 1, 1,
0.1293381, 0.7972549, 0.1133108, 1, 1, 1, 1, 1,
0.1401801, 0.4695605, -0.8960052, 1, 1, 1, 1, 1,
0.1496544, -0.2866787, 3.087602, 1, 1, 1, 1, 1,
0.1537175, -0.4622186, 2.321281, 1, 1, 1, 1, 1,
0.1567536, -0.2485458, 2.731785, 1, 1, 1, 1, 1,
0.1577379, 0.1397707, 1.486748, 1, 1, 1, 1, 1,
0.1592521, 0.4897901, 0.6628753, 1, 1, 1, 1, 1,
0.1616279, 1.695551, -0.5425133, 1, 1, 1, 1, 1,
0.1621574, -0.08069567, 2.943863, 1, 1, 1, 1, 1,
0.1695088, -0.4726622, 3.17511, 1, 1, 1, 1, 1,
0.170613, 0.1611496, -0.1971872, 1, 1, 1, 1, 1,
0.172666, 0.3785782, -0.08192975, 1, 1, 1, 1, 1,
0.1735062, 0.1676333, -1.09974, 1, 1, 1, 1, 1,
0.1736563, 0.03582123, 1.162506, 1, 1, 1, 1, 1,
0.1748317, -0.5940936, 2.375506, 1, 1, 1, 1, 1,
0.1756283, -2.298512, 4.3508, 0, 0, 1, 1, 1,
0.1765232, -0.6747625, 1.843396, 1, 0, 0, 1, 1,
0.1778805, -0.6746739, 3.210299, 1, 0, 0, 1, 1,
0.1813964, -0.352343, 3.132453, 1, 0, 0, 1, 1,
0.1821034, -0.7737104, 3.757468, 1, 0, 0, 1, 1,
0.1843609, -1.176597, 1.320767, 1, 0, 0, 1, 1,
0.1843918, -1.120795, 3.30267, 0, 0, 0, 1, 1,
0.1946394, 0.5765406, 0.4823355, 0, 0, 0, 1, 1,
0.1970905, -0.5319803, 2.521191, 0, 0, 0, 1, 1,
0.1975017, 1.617883, 2.37887, 0, 0, 0, 1, 1,
0.2032411, 0.7926798, 0.1738108, 0, 0, 0, 1, 1,
0.2094424, -1.160905, 3.013088, 0, 0, 0, 1, 1,
0.2128548, -0.6232514, 2.726978, 0, 0, 0, 1, 1,
0.2160614, 0.3868141, 0.03387856, 1, 1, 1, 1, 1,
0.218501, 0.6060621, 0.06284477, 1, 1, 1, 1, 1,
0.2187769, -1.111319, 2.342874, 1, 1, 1, 1, 1,
0.2208745, -1.517387, 3.480477, 1, 1, 1, 1, 1,
0.2214675, 1.385017, -0.2465822, 1, 1, 1, 1, 1,
0.2237187, -0.6549518, 2.425397, 1, 1, 1, 1, 1,
0.2298785, 1.740131, -0.06135223, 1, 1, 1, 1, 1,
0.2327336, -0.9242832, 2.73787, 1, 1, 1, 1, 1,
0.2346944, -0.9822817, 3.32699, 1, 1, 1, 1, 1,
0.2368888, -1.759631, 4.194616, 1, 1, 1, 1, 1,
0.237419, -0.745025, 1.050357, 1, 1, 1, 1, 1,
0.2391202, -0.9361261, 2.616759, 1, 1, 1, 1, 1,
0.243279, -1.306395, 3.94397, 1, 1, 1, 1, 1,
0.2434998, -0.3753287, 1.665773, 1, 1, 1, 1, 1,
0.2449755, -0.5295507, 2.693657, 1, 1, 1, 1, 1,
0.2456542, 1.539716, 2.890398, 0, 0, 1, 1, 1,
0.2465312, -1.04038, 3.335665, 1, 0, 0, 1, 1,
0.2479035, 1.814469, 0.3951969, 1, 0, 0, 1, 1,
0.2480788, -0.3220564, 3.267078, 1, 0, 0, 1, 1,
0.2488942, -0.4880618, 1.139924, 1, 0, 0, 1, 1,
0.2513658, -1.116433, 2.689113, 1, 0, 0, 1, 1,
0.2586854, -0.03054283, 1.664192, 0, 0, 0, 1, 1,
0.2590081, 0.6059263, 1.442466, 0, 0, 0, 1, 1,
0.2625281, -0.360356, 0.5099789, 0, 0, 0, 1, 1,
0.2640213, -0.1266627, 3.081415, 0, 0, 0, 1, 1,
0.2681948, -1.255025, 3.148775, 0, 0, 0, 1, 1,
0.2701303, -0.3192156, 3.771664, 0, 0, 0, 1, 1,
0.2706665, -0.1797031, 2.277154, 0, 0, 0, 1, 1,
0.2707472, 1.263541, -0.3595718, 1, 1, 1, 1, 1,
0.2764456, 1.131762, 0.2944968, 1, 1, 1, 1, 1,
0.2778143, -1.390726, 3.035371, 1, 1, 1, 1, 1,
0.2784273, -0.8495018, 4.639557, 1, 1, 1, 1, 1,
0.280304, 0.5634746, 0.004043915, 1, 1, 1, 1, 1,
0.28034, 0.05984383, 0.9235064, 1, 1, 1, 1, 1,
0.280636, -0.6568631, 3.108516, 1, 1, 1, 1, 1,
0.2830225, 1.699064, -0.2848356, 1, 1, 1, 1, 1,
0.2864915, 0.745086, 1.345068, 1, 1, 1, 1, 1,
0.287683, 0.3634056, 2.087877, 1, 1, 1, 1, 1,
0.2903588, 0.2789226, 0.7520944, 1, 1, 1, 1, 1,
0.2956792, 0.361286, 0.2224554, 1, 1, 1, 1, 1,
0.2991646, 2.156126, -0.7187415, 1, 1, 1, 1, 1,
0.3084267, -0.005310391, 2.390007, 1, 1, 1, 1, 1,
0.3106001, 0.5283719, 1.9828, 1, 1, 1, 1, 1,
0.312893, 0.5068403, 2.258058, 0, 0, 1, 1, 1,
0.315234, -0.04475356, 3.456452, 1, 0, 0, 1, 1,
0.3164977, -0.02777384, 1.049497, 1, 0, 0, 1, 1,
0.3168805, -1.295875, 1.323535, 1, 0, 0, 1, 1,
0.3189357, -0.2708563, 2.777824, 1, 0, 0, 1, 1,
0.3200381, 1.48782, 0.4259411, 1, 0, 0, 1, 1,
0.3234618, 0.2034789, 0.4200674, 0, 0, 0, 1, 1,
0.3250516, -2.482498, 3.22108, 0, 0, 0, 1, 1,
0.325204, -0.5676919, 2.30907, 0, 0, 0, 1, 1,
0.3268406, 0.01124488, 1.893037, 0, 0, 0, 1, 1,
0.3297586, 1.774883, -0.8007843, 0, 0, 0, 1, 1,
0.3310301, 1.898241, 0.2198119, 0, 0, 0, 1, 1,
0.3321802, 1.481006, 1.507252, 0, 0, 0, 1, 1,
0.3351218, -0.449432, 3.308913, 1, 1, 1, 1, 1,
0.3369164, 0.7268, 0.2571672, 1, 1, 1, 1, 1,
0.3376383, -0.5616586, 2.955998, 1, 1, 1, 1, 1,
0.341565, 1.028787, 0.8096047, 1, 1, 1, 1, 1,
0.3445357, 0.9989148, -1.354181, 1, 1, 1, 1, 1,
0.3503198, 1.48653, 0.3774097, 1, 1, 1, 1, 1,
0.3503956, -1.104086, 3.354414, 1, 1, 1, 1, 1,
0.3507777, 0.2572793, 2.719959, 1, 1, 1, 1, 1,
0.3529107, -0.3788508, 2.697576, 1, 1, 1, 1, 1,
0.3551021, 1.688174, 0.4852989, 1, 1, 1, 1, 1,
0.3612838, 0.4655453, 0.4625474, 1, 1, 1, 1, 1,
0.3646457, -1.065788, 1.88071, 1, 1, 1, 1, 1,
0.3708133, -1.527322, 3.139584, 1, 1, 1, 1, 1,
0.3714681, 0.4857897, 0.04899308, 1, 1, 1, 1, 1,
0.374193, 0.3576848, 2.152834, 1, 1, 1, 1, 1,
0.3742294, -0.8864611, 3.75698, 0, 0, 1, 1, 1,
0.384255, 1.274757, -1.243453, 1, 0, 0, 1, 1,
0.384761, 0.2458503, 0.6092204, 1, 0, 0, 1, 1,
0.3853054, -0.6895722, 1.3947, 1, 0, 0, 1, 1,
0.3880929, -0.1901357, 2.044472, 1, 0, 0, 1, 1,
0.392132, -0.801993, 0.7083577, 1, 0, 0, 1, 1,
0.3926088, -1.039289, 3.141133, 0, 0, 0, 1, 1,
0.3932191, 1.341378, -0.07381558, 0, 0, 0, 1, 1,
0.3962037, -1.17338, 0.8684427, 0, 0, 0, 1, 1,
0.398166, 1.50498, 0.8639966, 0, 0, 0, 1, 1,
0.4012903, 1.932356, 0.5016138, 0, 0, 0, 1, 1,
0.4024051, 0.6500651, 0.8903807, 0, 0, 0, 1, 1,
0.4051841, -0.01155632, 1.022862, 0, 0, 0, 1, 1,
0.4132059, 1.124887, -1.753217, 1, 1, 1, 1, 1,
0.4159719, 0.4056321, -0.09658724, 1, 1, 1, 1, 1,
0.4177452, -0.004348237, 1.531206, 1, 1, 1, 1, 1,
0.4238215, 0.2545548, 2.058264, 1, 1, 1, 1, 1,
0.4268301, 0.6585796, -0.9577302, 1, 1, 1, 1, 1,
0.4309469, 0.4577783, 1.013394, 1, 1, 1, 1, 1,
0.4315726, -0.4137699, 3.17612, 1, 1, 1, 1, 1,
0.4361568, 1.068088, 0.8218499, 1, 1, 1, 1, 1,
0.4371243, -0.459837, 4.622942, 1, 1, 1, 1, 1,
0.4436997, -0.3698542, 0.2488619, 1, 1, 1, 1, 1,
0.4442431, 0.6392998, 0.4432175, 1, 1, 1, 1, 1,
0.452885, -0.500282, 1.571776, 1, 1, 1, 1, 1,
0.462141, 0.9086504, -0.1876482, 1, 1, 1, 1, 1,
0.4627111, -0.9998266, 4.582472, 1, 1, 1, 1, 1,
0.4636205, 1.106448, -1.053647, 1, 1, 1, 1, 1,
0.4653859, -0.2872477, 1.610875, 0, 0, 1, 1, 1,
0.4665326, -2.094473, 3.805749, 1, 0, 0, 1, 1,
0.4706067, 0.7665015, 1.242779, 1, 0, 0, 1, 1,
0.4707766, 0.2040856, 0.0485115, 1, 0, 0, 1, 1,
0.4710273, 0.1958245, 2.677334, 1, 0, 0, 1, 1,
0.4757481, -0.2917849, 2.692574, 1, 0, 0, 1, 1,
0.4842615, 0.3717132, 0.7404228, 0, 0, 0, 1, 1,
0.4871565, -0.7187291, 3.252591, 0, 0, 0, 1, 1,
0.4935886, 1.033976, 0.2926702, 0, 0, 0, 1, 1,
0.4993846, -0.3409163, 2.361647, 0, 0, 0, 1, 1,
0.5010594, 0.9694359, 1.357537, 0, 0, 0, 1, 1,
0.5054144, -0.06505023, 3.795073, 0, 0, 0, 1, 1,
0.5069753, -1.56084, 2.370303, 0, 0, 0, 1, 1,
0.5072229, 1.307041, 0.5211522, 1, 1, 1, 1, 1,
0.5073591, -1.649446, 2.528357, 1, 1, 1, 1, 1,
0.5106761, 0.8364437, 0.4307493, 1, 1, 1, 1, 1,
0.5119722, 0.8526476, 0.1908131, 1, 1, 1, 1, 1,
0.5123285, 0.3729148, 1.904919, 1, 1, 1, 1, 1,
0.518123, 0.6633099, 0.07018244, 1, 1, 1, 1, 1,
0.5182147, 0.6173352, 0.7040749, 1, 1, 1, 1, 1,
0.5216392, 1.765243, 0.8925412, 1, 1, 1, 1, 1,
0.5217947, -0.285533, 2.133587, 1, 1, 1, 1, 1,
0.5235711, 1.21525, 0.8938603, 1, 1, 1, 1, 1,
0.5302294, -0.30895, 2.841549, 1, 1, 1, 1, 1,
0.5330787, 1.138579, 1.406565, 1, 1, 1, 1, 1,
0.5392938, 0.1966927, 0.4374032, 1, 1, 1, 1, 1,
0.5415986, -0.7948077, 2.452437, 1, 1, 1, 1, 1,
0.5452725, 0.9221696, -1.486288, 1, 1, 1, 1, 1,
0.5457511, 0.9665162, 0.05519816, 0, 0, 1, 1, 1,
0.5458089, 1.605859, -0.6706166, 1, 0, 0, 1, 1,
0.5462551, 1.172477, 0.1594478, 1, 0, 0, 1, 1,
0.5476899, 1.363574, -0.6461757, 1, 0, 0, 1, 1,
0.5496063, 0.1112604, 0.4437667, 1, 0, 0, 1, 1,
0.550167, -0.2690303, 2.258332, 1, 0, 0, 1, 1,
0.5504147, -0.878144, 1.292029, 0, 0, 0, 1, 1,
0.5518209, 0.1863987, 0.3891637, 0, 0, 0, 1, 1,
0.5526626, 0.346919, 0.6239855, 0, 0, 0, 1, 1,
0.554885, -1.314948, 3.144169, 0, 0, 0, 1, 1,
0.5554262, 0.7477382, 1.124623, 0, 0, 0, 1, 1,
0.5573328, -2.964455, 3.635313, 0, 0, 0, 1, 1,
0.5577318, 0.686115, 0.1247816, 0, 0, 0, 1, 1,
0.5614321, 0.2278489, -0.08442447, 1, 1, 1, 1, 1,
0.5629034, 1.445562, 2.212863, 1, 1, 1, 1, 1,
0.5639033, 0.477557, 2.148603, 1, 1, 1, 1, 1,
0.5649905, 1.353413, -0.01968401, 1, 1, 1, 1, 1,
0.5727133, 0.01311785, 1.743929, 1, 1, 1, 1, 1,
0.5755693, -0.3554861, 1.929901, 1, 1, 1, 1, 1,
0.5756563, -1.003948, 3.612482, 1, 1, 1, 1, 1,
0.5788832, 1.09211, -0.4464164, 1, 1, 1, 1, 1,
0.5807559, -0.2129693, 1.468712, 1, 1, 1, 1, 1,
0.5812101, 0.3520703, 1.954012, 1, 1, 1, 1, 1,
0.5831023, -0.7940028, 4.228448, 1, 1, 1, 1, 1,
0.5835364, 0.7471322, -0.3627427, 1, 1, 1, 1, 1,
0.5844917, -1.10385, 3.117114, 1, 1, 1, 1, 1,
0.5887983, -0.8684015, 2.477228, 1, 1, 1, 1, 1,
0.5913022, 0.5681462, 0.90684, 1, 1, 1, 1, 1,
0.5936194, 0.4514083, 1.721592, 0, 0, 1, 1, 1,
0.5948583, 0.5530796, -0.3159161, 1, 0, 0, 1, 1,
0.6073422, 2.076842, 0.6450698, 1, 0, 0, 1, 1,
0.6102872, 1.370666, 0.1998452, 1, 0, 0, 1, 1,
0.6123737, 0.3585215, 0.8564193, 1, 0, 0, 1, 1,
0.6127728, 0.8059836, -0.924225, 1, 0, 0, 1, 1,
0.6149372, -0.906347, 1.405845, 0, 0, 0, 1, 1,
0.616464, -1.114258, 2.605677, 0, 0, 0, 1, 1,
0.6169268, 0.6468458, 0.4730787, 0, 0, 0, 1, 1,
0.6186567, -0.3121303, 2.264267, 0, 0, 0, 1, 1,
0.6210426, 0.390196, 2.030958, 0, 0, 0, 1, 1,
0.6308455, 0.4169172, -0.07662813, 0, 0, 0, 1, 1,
0.634061, 1.369798, 0.6361152, 0, 0, 0, 1, 1,
0.6346334, 0.07097669, 2.429592, 1, 1, 1, 1, 1,
0.6395066, 0.1444733, -1.510809, 1, 1, 1, 1, 1,
0.643413, -0.01003719, 1.921658, 1, 1, 1, 1, 1,
0.6576973, -1.03283, 2.27901, 1, 1, 1, 1, 1,
0.6614766, 0.4674861, 0.6832726, 1, 1, 1, 1, 1,
0.6716337, -0.8580832, 4.885329, 1, 1, 1, 1, 1,
0.6771793, -0.4715926, 0.8769478, 1, 1, 1, 1, 1,
0.6824795, 0.2344807, 1.661619, 1, 1, 1, 1, 1,
0.6856807, 1.217013, -0.7798579, 1, 1, 1, 1, 1,
0.6895843, 0.8230484, 1.010563, 1, 1, 1, 1, 1,
0.697662, 0.7326379, -0.4251013, 1, 1, 1, 1, 1,
0.7013042, 0.7599329, 0.7613334, 1, 1, 1, 1, 1,
0.7029971, -0.7524273, 2.545816, 1, 1, 1, 1, 1,
0.7050142, -0.3897084, 2.000175, 1, 1, 1, 1, 1,
0.7117686, -0.7809067, 1.663361, 1, 1, 1, 1, 1,
0.7122734, -0.2465837, 2.060262, 0, 0, 1, 1, 1,
0.7183822, 0.3680833, 2.05213, 1, 0, 0, 1, 1,
0.7205243, -1.04247, 2.360987, 1, 0, 0, 1, 1,
0.7224149, 1.307382, 0.08863182, 1, 0, 0, 1, 1,
0.7268889, -0.4975529, 2.695401, 1, 0, 0, 1, 1,
0.7275319, 0.03573594, 1.448849, 1, 0, 0, 1, 1,
0.7287877, 0.2665015, 0.9624263, 0, 0, 0, 1, 1,
0.72982, 0.3712434, -0.2516975, 0, 0, 0, 1, 1,
0.7301703, -0.7595319, 3.541281, 0, 0, 0, 1, 1,
0.7306615, 1.203051, 0.4624361, 0, 0, 0, 1, 1,
0.7308855, 0.7638845, 1.617187, 0, 0, 0, 1, 1,
0.7314346, 0.3511976, 0.562924, 0, 0, 0, 1, 1,
0.7343109, 0.7780031, -0.2009602, 0, 0, 0, 1, 1,
0.7371278, -1.212703, 3.492959, 1, 1, 1, 1, 1,
0.7385868, -0.8059014, 2.744537, 1, 1, 1, 1, 1,
0.746659, 0.894677, 0.2043003, 1, 1, 1, 1, 1,
0.7497105, -0.6810856, 3.287338, 1, 1, 1, 1, 1,
0.7514184, -0.08785714, -0.02429455, 1, 1, 1, 1, 1,
0.75183, 0.06628585, 0.519084, 1, 1, 1, 1, 1,
0.7523492, -1.547307, 1.659388, 1, 1, 1, 1, 1,
0.756197, -2.278664, 1.075279, 1, 1, 1, 1, 1,
0.7571384, 0.1081775, 2.811936, 1, 1, 1, 1, 1,
0.7667851, 0.1838921, 1.547858, 1, 1, 1, 1, 1,
0.7670262, -0.6371323, 3.008731, 1, 1, 1, 1, 1,
0.7698088, -0.6833414, 0.2629285, 1, 1, 1, 1, 1,
0.7705401, 1.741844, -0.5692807, 1, 1, 1, 1, 1,
0.776217, -0.9000458, 1.204018, 1, 1, 1, 1, 1,
0.7776978, 0.8302308, -0.9345661, 1, 1, 1, 1, 1,
0.7788759, -0.8555512, 2.833797, 0, 0, 1, 1, 1,
0.7802166, 0.3993977, -0.1418922, 1, 0, 0, 1, 1,
0.781546, 0.4512466, 2.062486, 1, 0, 0, 1, 1,
0.7894944, -0.6927492, 4.693635, 1, 0, 0, 1, 1,
0.789691, 0.4411105, 0.5262187, 1, 0, 0, 1, 1,
0.7900051, 0.3288772, -0.04536085, 1, 0, 0, 1, 1,
0.7918862, -0.2492464, 2.689416, 0, 0, 0, 1, 1,
0.7919687, -0.1175758, 1.706646, 0, 0, 0, 1, 1,
0.8020979, 1.488387, 0.1897733, 0, 0, 0, 1, 1,
0.8038542, -0.388205, 1.444112, 0, 0, 0, 1, 1,
0.8059676, -0.1795985, 0.4683037, 0, 0, 0, 1, 1,
0.809584, 0.5472036, 1.171725, 0, 0, 0, 1, 1,
0.8174284, -1.37117, 3.034034, 0, 0, 0, 1, 1,
0.8178713, -1.853062, 0.9358144, 1, 1, 1, 1, 1,
0.8193717, 1.130613, 0.07096865, 1, 1, 1, 1, 1,
0.8228256, 0.2585581, 1.969206, 1, 1, 1, 1, 1,
0.8230602, 0.7995939, 1.354682, 1, 1, 1, 1, 1,
0.829325, 0.9552014, 1.457986, 1, 1, 1, 1, 1,
0.8314398, 0.3368204, 1.632434, 1, 1, 1, 1, 1,
0.8338455, -0.3559004, 2.498872, 1, 1, 1, 1, 1,
0.8361802, 0.3097807, 1.821787, 1, 1, 1, 1, 1,
0.8363301, -0.6122816, 1.912207, 1, 1, 1, 1, 1,
0.8371005, 0.9380972, 1.275181, 1, 1, 1, 1, 1,
0.837745, 0.9192444, 0.6861042, 1, 1, 1, 1, 1,
0.8393636, 0.9104607, -1.721111, 1, 1, 1, 1, 1,
0.8456697, 0.06989174, 1.051535, 1, 1, 1, 1, 1,
0.8512749, -1.173692, 0.9572748, 1, 1, 1, 1, 1,
0.8513963, 1.117418, 1.132652, 1, 1, 1, 1, 1,
0.8532857, -1.108816, 3.801312, 0, 0, 1, 1, 1,
0.8562155, 0.5726303, 0.7743633, 1, 0, 0, 1, 1,
0.8649821, 1.846104, 0.469722, 1, 0, 0, 1, 1,
0.8707511, 1.302661, 0.4997392, 1, 0, 0, 1, 1,
0.8708129, -1.090956, 1.870758, 1, 0, 0, 1, 1,
0.871441, 0.6100503, 0.4542231, 1, 0, 0, 1, 1,
0.8749031, 1.056319, 0.5443127, 0, 0, 0, 1, 1,
0.8804657, 1.999343, -0.5151923, 0, 0, 0, 1, 1,
0.8806964, -0.649956, 3.038032, 0, 0, 0, 1, 1,
0.8814109, 0.7552815, 1.763812, 0, 0, 0, 1, 1,
0.896716, 0.4817977, 1.455943, 0, 0, 0, 1, 1,
0.9058395, 0.9943706, 0.8231621, 0, 0, 0, 1, 1,
0.9067751, 2.4906, -0.1423819, 0, 0, 0, 1, 1,
0.9108682, -0.6450452, 1.673461, 1, 1, 1, 1, 1,
0.911305, -1.892355, 2.77582, 1, 1, 1, 1, 1,
0.9164134, -0.0235088, 2.335268, 1, 1, 1, 1, 1,
0.9228344, -0.5502192, 2.083854, 1, 1, 1, 1, 1,
0.9290608, 1.705599, 1.049082, 1, 1, 1, 1, 1,
0.9295248, 0.3791725, 1.026643, 1, 1, 1, 1, 1,
0.9325563, -1.055188, 1.371706, 1, 1, 1, 1, 1,
0.9461157, 0.640101, 0.4765125, 1, 1, 1, 1, 1,
0.9482546, -0.9769225, 3.350974, 1, 1, 1, 1, 1,
0.9530625, -0.4008824, 1.907457, 1, 1, 1, 1, 1,
0.9553015, 0.2445251, 2.437367, 1, 1, 1, 1, 1,
0.9555885, 0.3682739, 1.651744, 1, 1, 1, 1, 1,
0.9562828, -0.7792402, 2.373649, 1, 1, 1, 1, 1,
0.9630335, -0.939537, 2.302648, 1, 1, 1, 1, 1,
0.9632466, 0.8261496, 1.560603, 1, 1, 1, 1, 1,
0.9634459, -0.5378239, 2.752278, 0, 0, 1, 1, 1,
0.9691735, -0.4184307, 2.800225, 1, 0, 0, 1, 1,
0.9695774, 0.3617021, 1.380356, 1, 0, 0, 1, 1,
0.9760045, 0.3064024, 1.922602, 1, 0, 0, 1, 1,
0.9799424, 0.7083605, 1.871915, 1, 0, 0, 1, 1,
0.9836592, -1.253201, 3.117748, 1, 0, 0, 1, 1,
0.9838812, -0.1402472, 0.5870421, 0, 0, 0, 1, 1,
0.9996879, 0.6580415, -0.5962769, 0, 0, 0, 1, 1,
1.005468, -1.245425, 2.630459, 0, 0, 0, 1, 1,
1.00596, -1.112564, 1.827173, 0, 0, 0, 1, 1,
1.008066, -0.78635, 0.823213, 0, 0, 0, 1, 1,
1.009892, -0.3150389, 2.988203, 0, 0, 0, 1, 1,
1.022044, -0.5576077, 2.925994, 0, 0, 0, 1, 1,
1.022526, -0.4843811, 2.920685, 1, 1, 1, 1, 1,
1.025354, 0.2571572, 0.8688072, 1, 1, 1, 1, 1,
1.028227, -1.22154, 1.251703, 1, 1, 1, 1, 1,
1.03325, -0.3709785, 1.528529, 1, 1, 1, 1, 1,
1.033595, 1.084372, 0.05789818, 1, 1, 1, 1, 1,
1.034287, -2.200973, 2.261589, 1, 1, 1, 1, 1,
1.03634, 0.3936246, -0.2104526, 1, 1, 1, 1, 1,
1.040139, 0.4759235, 0.8562997, 1, 1, 1, 1, 1,
1.045214, 2.02065, 1.458647, 1, 1, 1, 1, 1,
1.050647, 0.05315055, 0.747883, 1, 1, 1, 1, 1,
1.051096, -0.7693977, 1.236933, 1, 1, 1, 1, 1,
1.058756, 0.4483079, 2.290683, 1, 1, 1, 1, 1,
1.063627, 0.4030093, 1.241594, 1, 1, 1, 1, 1,
1.065235, -0.007236311, 1.632829, 1, 1, 1, 1, 1,
1.066582, -1.309413, 2.005215, 1, 1, 1, 1, 1,
1.076815, 0.4784794, 2.04121, 0, 0, 1, 1, 1,
1.076875, -1.492542, 3.204175, 1, 0, 0, 1, 1,
1.078176, -0.6701512, 1.323589, 1, 0, 0, 1, 1,
1.086144, -1.272904, 4.152465, 1, 0, 0, 1, 1,
1.095478, -0.536538, 2.595387, 1, 0, 0, 1, 1,
1.098908, -0.1852074, 1.330814, 1, 0, 0, 1, 1,
1.101937, 0.400653, 2.105299, 0, 0, 0, 1, 1,
1.109633, -0.06223128, 1.985821, 0, 0, 0, 1, 1,
1.110564, 1.343507, 0.1726677, 0, 0, 0, 1, 1,
1.112696, 1.774671, 2.090216, 0, 0, 0, 1, 1,
1.117848, -2.260728, 2.243262, 0, 0, 0, 1, 1,
1.123293, -1.465167, 1.701316, 0, 0, 0, 1, 1,
1.12589, 1.059756, 0.1352386, 0, 0, 0, 1, 1,
1.134307, 1.260376, -0.9571669, 1, 1, 1, 1, 1,
1.13865, -2.004714, 2.745328, 1, 1, 1, 1, 1,
1.139296, 0.3034853, 0.6961689, 1, 1, 1, 1, 1,
1.144056, -0.39765, 2.211799, 1, 1, 1, 1, 1,
1.157146, 0.5648684, -1.558842, 1, 1, 1, 1, 1,
1.164119, -1.433108, 4.095139, 1, 1, 1, 1, 1,
1.172648, -1.541832, 2.067864, 1, 1, 1, 1, 1,
1.175744, 0.5189434, -0.8064335, 1, 1, 1, 1, 1,
1.17649, -0.603103, 2.061081, 1, 1, 1, 1, 1,
1.187089, 0.3713252, 2.456998, 1, 1, 1, 1, 1,
1.19174, -1.599887, 2.104653, 1, 1, 1, 1, 1,
1.1975, -0.7687121, 1.187148, 1, 1, 1, 1, 1,
1.21247, -0.6668724, 1.291551, 1, 1, 1, 1, 1,
1.229775, 0.9374437, -0.3147731, 1, 1, 1, 1, 1,
1.22988, 0.6026363, 1.82426, 1, 1, 1, 1, 1,
1.243062, -0.3617907, 1.060172, 0, 0, 1, 1, 1,
1.250341, 1.299047, 1.461294, 1, 0, 0, 1, 1,
1.260201, -2.540027, 2.111944, 1, 0, 0, 1, 1,
1.263682, -0.01275809, 3.338788, 1, 0, 0, 1, 1,
1.269691, -0.8593311, 2.12876, 1, 0, 0, 1, 1,
1.276635, 0.05903684, 1.926419, 1, 0, 0, 1, 1,
1.279784, -1.414663, 1.679353, 0, 0, 0, 1, 1,
1.291345, -0.2097826, 3.027005, 0, 0, 0, 1, 1,
1.293064, -0.9292449, 0.9510875, 0, 0, 0, 1, 1,
1.296998, 0.3270412, 0.4989946, 0, 0, 0, 1, 1,
1.320402, -0.3144152, 2.394026, 0, 0, 0, 1, 1,
1.322718, 0.2791504, 2.293953, 0, 0, 0, 1, 1,
1.34034, 0.1170343, 1.463301, 0, 0, 0, 1, 1,
1.341608, 0.3277314, 1.166392, 1, 1, 1, 1, 1,
1.348604, 0.03002362, 1.402338, 1, 1, 1, 1, 1,
1.356731, 1.451647, 0.7934586, 1, 1, 1, 1, 1,
1.360252, -0.7893763, 2.2676, 1, 1, 1, 1, 1,
1.371879, 1.184399, 1.616919, 1, 1, 1, 1, 1,
1.37284, -0.23802, 2.437625, 1, 1, 1, 1, 1,
1.375469, 0.3156314, 0.3312778, 1, 1, 1, 1, 1,
1.387356, -0.7513754, -0.5697533, 1, 1, 1, 1, 1,
1.395589, -0.04604207, 1.115688, 1, 1, 1, 1, 1,
1.396171, 1.549008, 0.8216499, 1, 1, 1, 1, 1,
1.396203, -0.1185762, 2.340548, 1, 1, 1, 1, 1,
1.396218, -0.7306123, 1.255795, 1, 1, 1, 1, 1,
1.397993, 1.020235, 1.239658, 1, 1, 1, 1, 1,
1.409524, -0.6799429, 3.074378, 1, 1, 1, 1, 1,
1.411703, 1.412829, -0.4191492, 1, 1, 1, 1, 1,
1.415466, -1.145395, 0.8334123, 0, 0, 1, 1, 1,
1.417143, 1.296107, 0.2603665, 1, 0, 0, 1, 1,
1.431517, -0.1943652, 2.725989, 1, 0, 0, 1, 1,
1.440359, 0.1993625, 2.480417, 1, 0, 0, 1, 1,
1.455741, -1.361724, 1.296902, 1, 0, 0, 1, 1,
1.469701, 0.7026866, 0.548735, 1, 0, 0, 1, 1,
1.475364, 1.165777, 1.826297, 0, 0, 0, 1, 1,
1.484739, 1.171967, 2.604535, 0, 0, 0, 1, 1,
1.502646, 1.513117, 1.286226, 0, 0, 0, 1, 1,
1.50883, 0.5200872, 1.057106, 0, 0, 0, 1, 1,
1.512718, -0.9925647, 1.829996, 0, 0, 0, 1, 1,
1.526676, 2.108518, -1.075951, 0, 0, 0, 1, 1,
1.540249, -0.1581511, 1.677867, 0, 0, 0, 1, 1,
1.565149, -1.038116, 3.274793, 1, 1, 1, 1, 1,
1.576101, -1.103066, 2.633628, 1, 1, 1, 1, 1,
1.579013, 0.09256919, 0.2123098, 1, 1, 1, 1, 1,
1.583698, -0.8343383, 1.864918, 1, 1, 1, 1, 1,
1.590096, -1.393339, 1.745684, 1, 1, 1, 1, 1,
1.61058, 0.004769971, 1.195193, 1, 1, 1, 1, 1,
1.611608, -0.8971887, 3.130211, 1, 1, 1, 1, 1,
1.621742, -0.29, 1.131484, 1, 1, 1, 1, 1,
1.639193, -1.400544, 2.503731, 1, 1, 1, 1, 1,
1.676518, -0.1623505, 0.02682138, 1, 1, 1, 1, 1,
1.68775, 0.04275405, 3.024803, 1, 1, 1, 1, 1,
1.695631, 0.3084186, 1.428192, 1, 1, 1, 1, 1,
1.701943, -0.1716549, 1.621779, 1, 1, 1, 1, 1,
1.704051, -0.6237702, 1.441479, 1, 1, 1, 1, 1,
1.704264, 0.9537556, -0.474697, 1, 1, 1, 1, 1,
1.708827, -0.9241238, 1.040417, 0, 0, 1, 1, 1,
1.70952, 0.8946911, 1.219795, 1, 0, 0, 1, 1,
1.724696, -0.7089799, -0.003759746, 1, 0, 0, 1, 1,
1.725535, -1.224994, 1.684406, 1, 0, 0, 1, 1,
1.74979, 0.7344738, 0.7461705, 1, 0, 0, 1, 1,
1.753044, 0.7165712, 2.0507, 1, 0, 0, 1, 1,
1.763655, 0.7474841, -0.2362744, 0, 0, 0, 1, 1,
1.764835, 0.2660928, 3.332411, 0, 0, 0, 1, 1,
1.778333, 0.9034652, -0.04542461, 0, 0, 0, 1, 1,
1.779296, 1.20506, 1.604043, 0, 0, 0, 1, 1,
1.783817, -0.9376633, 0.6522321, 0, 0, 0, 1, 1,
1.797774, -0.2036181, 0.9019436, 0, 0, 0, 1, 1,
1.801833, -1.72431, 1.123822, 0, 0, 0, 1, 1,
1.802265, -0.3407796, 1.981008, 1, 1, 1, 1, 1,
1.82025, 0.8638785, 2.556361, 1, 1, 1, 1, 1,
1.844359, 2.724545, 1.663007, 1, 1, 1, 1, 1,
1.865634, 0.2709137, 1.41311, 1, 1, 1, 1, 1,
1.873055, -0.3358033, 1.586866, 1, 1, 1, 1, 1,
1.889767, -2.170089, 1.77041, 1, 1, 1, 1, 1,
1.890314, 0.512361, 1.070246, 1, 1, 1, 1, 1,
1.893732, -1.099177, 0.7455077, 1, 1, 1, 1, 1,
1.894727, 0.7730637, 0.8464905, 1, 1, 1, 1, 1,
1.912716, 0.8083877, -0.4048614, 1, 1, 1, 1, 1,
1.92321, 1.054898, 2.734939, 1, 1, 1, 1, 1,
1.933953, 0.7997465, -0.7038294, 1, 1, 1, 1, 1,
1.952543, -0.501856, 1.09005, 1, 1, 1, 1, 1,
1.964181, 0.2821144, 1.351805, 1, 1, 1, 1, 1,
2.01266, 0.595657, 2.548413, 1, 1, 1, 1, 1,
2.037805, 0.584987, -0.3972324, 0, 0, 1, 1, 1,
2.096932, -0.3687147, 0.5058277, 1, 0, 0, 1, 1,
2.138001, 1.319607, 1.256074, 1, 0, 0, 1, 1,
2.242597, -0.4101307, 1.631775, 1, 0, 0, 1, 1,
2.2513, 0.4710165, 1.024906, 1, 0, 0, 1, 1,
2.265149, -1.24747, 1.595044, 1, 0, 0, 1, 1,
2.280909, 0.5430437, 2.039165, 0, 0, 0, 1, 1,
2.315126, 0.5574964, 0.5860468, 0, 0, 0, 1, 1,
2.31899, -0.08214507, 2.579084, 0, 0, 0, 1, 1,
2.34406, -1.185058, 1.779605, 0, 0, 0, 1, 1,
2.350224, 0.01548855, 2.80237, 0, 0, 0, 1, 1,
2.379848, -0.2755882, 1.437191, 0, 0, 0, 1, 1,
2.402768, -0.7738315, 1.626539, 0, 0, 0, 1, 1,
2.501568, 0.08994021, 1.665087, 1, 1, 1, 1, 1,
2.56163, 0.5276206, 1.298234, 1, 1, 1, 1, 1,
2.899808, 0.01272754, 2.170494, 1, 1, 1, 1, 1,
2.928246, -0.4970569, 2.135399, 1, 1, 1, 1, 1,
2.976735, -0.05368152, 1.147316, 1, 1, 1, 1, 1,
3.033279, -0.397816, 1.03342, 1, 1, 1, 1, 1,
3.068317, 0.3350829, 0.161933, 1, 1, 1, 1, 1
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
var radius = 8.969108;
var distance = 31.50361;
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
mvMatrix.translate( -0.1146572, 0.1199553, 0.1206493 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.50361);
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