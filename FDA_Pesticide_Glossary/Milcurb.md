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
-3.550837, 1.317038, -1.19455, 1, 0, 0, 1,
-3.539493, 0.9254894, -2.634559, 1, 0.007843138, 0, 1,
-3.365387, 2.059153, -1.413374, 1, 0.01176471, 0, 1,
-2.809195, 0.6096026, -3.037619, 1, 0.01960784, 0, 1,
-2.808399, -0.2365613, -2.728262, 1, 0.02352941, 0, 1,
-2.647311, 0.00454034, -1.395154, 1, 0.03137255, 0, 1,
-2.59557, -0.01200147, -1.856926, 1, 0.03529412, 0, 1,
-2.380619, -1.027743, -1.39895, 1, 0.04313726, 0, 1,
-2.36875, -0.2985923, 0.01069934, 1, 0.04705882, 0, 1,
-2.356661, 0.7861995, 0.5739696, 1, 0.05490196, 0, 1,
-2.29694, -1.633334, -1.850521, 1, 0.05882353, 0, 1,
-2.289927, 0.7664384, -1.66872, 1, 0.06666667, 0, 1,
-2.254984, -0.3740223, -3.171465, 1, 0.07058824, 0, 1,
-2.230066, -0.6355169, -3.308091, 1, 0.07843138, 0, 1,
-2.21931, -1.611705, -3.358122, 1, 0.08235294, 0, 1,
-2.179558, 1.423584, 0.1815748, 1, 0.09019608, 0, 1,
-2.174882, 0.1544281, -2.62955, 1, 0.09411765, 0, 1,
-2.153595, -1.231065, -2.675675, 1, 0.1019608, 0, 1,
-2.133829, -0.6848415, -1.156881, 1, 0.1098039, 0, 1,
-2.102109, 0.5120857, -1.589427, 1, 0.1137255, 0, 1,
-2.081048, 1.517504, -1.366896, 1, 0.1215686, 0, 1,
-2.07894, -0.321291, -0.6081869, 1, 0.1254902, 0, 1,
-2.066552, 0.7993404, -1.470188, 1, 0.1333333, 0, 1,
-2.064185, -0.9293495, -1.301655, 1, 0.1372549, 0, 1,
-2.057805, -2.127479, -2.859721, 1, 0.145098, 0, 1,
-2.035285, 0.06882641, -1.345301, 1, 0.1490196, 0, 1,
-2.0289, -0.6865678, -3.161583, 1, 0.1568628, 0, 1,
-1.999417, 0.2104556, -0.2926962, 1, 0.1607843, 0, 1,
-1.967703, 0.5295539, -1.350193, 1, 0.1686275, 0, 1,
-1.957477, 1.356603, 0.4945966, 1, 0.172549, 0, 1,
-1.937966, -1.394097, -2.216572, 1, 0.1803922, 0, 1,
-1.934379, 0.9810925, -0.2234193, 1, 0.1843137, 0, 1,
-1.928922, 0.6188384, -1.265059, 1, 0.1921569, 0, 1,
-1.921456, 0.6056699, -0.7599211, 1, 0.1960784, 0, 1,
-1.86254, 0.08406869, -2.131207, 1, 0.2039216, 0, 1,
-1.851859, -1.035275, -2.697711, 1, 0.2117647, 0, 1,
-1.830104, 0.6504182, -0.9474355, 1, 0.2156863, 0, 1,
-1.822829, 0.2776829, -2.474124, 1, 0.2235294, 0, 1,
-1.821696, -0.02398419, -1.988894, 1, 0.227451, 0, 1,
-1.821568, -0.9830502, -1.41144, 1, 0.2352941, 0, 1,
-1.808965, -0.0264102, -0.5853351, 1, 0.2392157, 0, 1,
-1.805232, 0.08878597, -2.061195, 1, 0.2470588, 0, 1,
-1.803202, -1.390972, -3.398068, 1, 0.2509804, 0, 1,
-1.801631, -0.2188735, -4.63243, 1, 0.2588235, 0, 1,
-1.793814, -0.7931412, -0.8526644, 1, 0.2627451, 0, 1,
-1.778233, 0.75611, -3.338697, 1, 0.2705882, 0, 1,
-1.775614, 0.7299078, -1.275664, 1, 0.2745098, 0, 1,
-1.774127, -0.6589292, -0.7901905, 1, 0.282353, 0, 1,
-1.74366, -0.4407091, -2.719663, 1, 0.2862745, 0, 1,
-1.733683, -1.973105, -1.454307, 1, 0.2941177, 0, 1,
-1.721809, 0.18985, -0.8454005, 1, 0.3019608, 0, 1,
-1.717548, -0.3361158, -2.068907, 1, 0.3058824, 0, 1,
-1.699448, -1.310615, -1.282726, 1, 0.3137255, 0, 1,
-1.679059, -1.066908, -2.912553, 1, 0.3176471, 0, 1,
-1.677188, -2.675783, -2.736777, 1, 0.3254902, 0, 1,
-1.675292, 0.2428026, -1.382494, 1, 0.3294118, 0, 1,
-1.657874, 0.1015312, -0.2765634, 1, 0.3372549, 0, 1,
-1.65749, 0.5680013, -2.638294, 1, 0.3411765, 0, 1,
-1.650909, -0.5709839, -1.472477, 1, 0.3490196, 0, 1,
-1.649332, 0.8514468, -1.981469, 1, 0.3529412, 0, 1,
-1.628616, 1.816647, 0.5557474, 1, 0.3607843, 0, 1,
-1.626376, 0.38566, -1.433994, 1, 0.3647059, 0, 1,
-1.618905, 0.7689113, 0.1414453, 1, 0.372549, 0, 1,
-1.60346, -0.3356008, -3.487977, 1, 0.3764706, 0, 1,
-1.598398, 1.428132, -1.098067, 1, 0.3843137, 0, 1,
-1.594242, 0.7233425, 0.1103461, 1, 0.3882353, 0, 1,
-1.58888, 1.364331, -2.258242, 1, 0.3960784, 0, 1,
-1.583173, 1.161282, 0.3271953, 1, 0.4039216, 0, 1,
-1.565529, -0.1136661, -1.123482, 1, 0.4078431, 0, 1,
-1.561373, -0.5001165, -0.1063888, 1, 0.4156863, 0, 1,
-1.551207, 0.4020558, -0.6425034, 1, 0.4196078, 0, 1,
-1.533997, -0.1336843, 0.3215873, 1, 0.427451, 0, 1,
-1.533283, -1.229806, -1.72909, 1, 0.4313726, 0, 1,
-1.525701, -1.489682, -1.318719, 1, 0.4392157, 0, 1,
-1.522853, -0.796152, -3.846771, 1, 0.4431373, 0, 1,
-1.517851, 0.1942964, -0.4475168, 1, 0.4509804, 0, 1,
-1.514086, 0.7435239, -0.5937157, 1, 0.454902, 0, 1,
-1.512645, -0.01851055, -1.623023, 1, 0.4627451, 0, 1,
-1.508937, -0.08007782, -1.535559, 1, 0.4666667, 0, 1,
-1.508472, -0.9110056, -2.835314, 1, 0.4745098, 0, 1,
-1.48125, -0.3234492, -2.811068, 1, 0.4784314, 0, 1,
-1.478045, 1.684686, -0.3344757, 1, 0.4862745, 0, 1,
-1.471289, -0.4260752, -2.54242, 1, 0.4901961, 0, 1,
-1.470587, 1.083898, -1.838472, 1, 0.4980392, 0, 1,
-1.462728, -1.912356, -3.246608, 1, 0.5058824, 0, 1,
-1.456538, 0.6759272, -1.480879, 1, 0.509804, 0, 1,
-1.45595, -0.3811601, -2.107549, 1, 0.5176471, 0, 1,
-1.450622, -0.6448056, -1.693556, 1, 0.5215687, 0, 1,
-1.449909, -0.6046729, -0.4342792, 1, 0.5294118, 0, 1,
-1.437093, 0.5600861, -2.642846, 1, 0.5333334, 0, 1,
-1.429136, 0.5711997, -2.12127, 1, 0.5411765, 0, 1,
-1.414907, 0.9424989, -0.4104698, 1, 0.5450981, 0, 1,
-1.412185, 0.322667, -1.857622, 1, 0.5529412, 0, 1,
-1.404603, -0.3873848, -2.433564, 1, 0.5568628, 0, 1,
-1.40176, -0.5641677, -1.819358, 1, 0.5647059, 0, 1,
-1.400687, 3.09902, -0.8617388, 1, 0.5686275, 0, 1,
-1.399577, 0.3250144, 0.400727, 1, 0.5764706, 0, 1,
-1.398391, -0.5299438, -2.316269, 1, 0.5803922, 0, 1,
-1.394933, 2.080585, -0.2597929, 1, 0.5882353, 0, 1,
-1.384085, -0.05212928, -1.509613, 1, 0.5921569, 0, 1,
-1.37919, -1.800531, -3.277309, 1, 0.6, 0, 1,
-1.369636, -0.4393071, -2.697186, 1, 0.6078432, 0, 1,
-1.366484, 1.6048, -1.837236, 1, 0.6117647, 0, 1,
-1.36307, -0.7408045, -0.7190066, 1, 0.6196079, 0, 1,
-1.35986, -0.2319179, -1.036229, 1, 0.6235294, 0, 1,
-1.356547, 0.6549438, -1.131099, 1, 0.6313726, 0, 1,
-1.342479, 0.08870888, 0.1156146, 1, 0.6352941, 0, 1,
-1.32929, 0.2032893, -2.309238, 1, 0.6431373, 0, 1,
-1.328896, 0.8222064, -1.850374, 1, 0.6470588, 0, 1,
-1.32251, 0.2725177, -0.885139, 1, 0.654902, 0, 1,
-1.314656, -0.9793407, -2.189715, 1, 0.6588235, 0, 1,
-1.313946, -0.4732738, -0.8609613, 1, 0.6666667, 0, 1,
-1.312218, -1.032339, -2.101032, 1, 0.6705883, 0, 1,
-1.311673, -0.02809163, -2.014829, 1, 0.6784314, 0, 1,
-1.307917, 0.5001405, -0.9404541, 1, 0.682353, 0, 1,
-1.300543, 0.1493705, -1.599534, 1, 0.6901961, 0, 1,
-1.293942, 0.2170718, -0.3172373, 1, 0.6941177, 0, 1,
-1.29354, -0.6253986, -2.41082, 1, 0.7019608, 0, 1,
-1.292187, 0.2814655, -1.786703, 1, 0.7098039, 0, 1,
-1.289906, 0.2126358, -2.68082, 1, 0.7137255, 0, 1,
-1.289728, 0.3784357, -0.9927478, 1, 0.7215686, 0, 1,
-1.284937, -0.8634396, -2.391697, 1, 0.7254902, 0, 1,
-1.27817, 1.476012, -0.1088661, 1, 0.7333333, 0, 1,
-1.275284, 0.8452982, -0.9964709, 1, 0.7372549, 0, 1,
-1.274144, 1.143738, -0.2822955, 1, 0.7450981, 0, 1,
-1.273009, -0.5982772, -3.048157, 1, 0.7490196, 0, 1,
-1.269839, -0.04405034, -0.05161838, 1, 0.7568628, 0, 1,
-1.265134, 0.1876398, -1.255265, 1, 0.7607843, 0, 1,
-1.262829, -2.170383, -1.7003, 1, 0.7686275, 0, 1,
-1.23884, -1.249618, -3.744961, 1, 0.772549, 0, 1,
-1.237279, -0.560361, -1.133929, 1, 0.7803922, 0, 1,
-1.232908, -0.5535713, -0.1342683, 1, 0.7843137, 0, 1,
-1.23193, -1.071226, -1.647189, 1, 0.7921569, 0, 1,
-1.23177, -0.7844347, -3.553643, 1, 0.7960784, 0, 1,
-1.216869, 0.07577787, -2.990625, 1, 0.8039216, 0, 1,
-1.21479, -1.780171, -1.738995, 1, 0.8117647, 0, 1,
-1.213358, 0.7110733, -0.6194015, 1, 0.8156863, 0, 1,
-1.20849, -0.5029588, -1.565688, 1, 0.8235294, 0, 1,
-1.200264, -0.9291935, -1.162163, 1, 0.827451, 0, 1,
-1.193709, 1.649482, 0.5276287, 1, 0.8352941, 0, 1,
-1.174381, 0.1337909, -0.121572, 1, 0.8392157, 0, 1,
-1.160091, 0.06462119, -3.403256, 1, 0.8470588, 0, 1,
-1.14937, 0.8748856, -1.718996, 1, 0.8509804, 0, 1,
-1.142788, 0.8478581, -0.5780116, 1, 0.8588235, 0, 1,
-1.138422, -0.4279802, -1.818431, 1, 0.8627451, 0, 1,
-1.134047, -0.1901201, -1.88724, 1, 0.8705882, 0, 1,
-1.127533, -1.789704, -2.302674, 1, 0.8745098, 0, 1,
-1.119268, 1.796622, -1.223397, 1, 0.8823529, 0, 1,
-1.117936, -0.8312089, -1.490887, 1, 0.8862745, 0, 1,
-1.113662, 0.6416664, -0.7060861, 1, 0.8941177, 0, 1,
-1.108413, 1.367509, -1.575255, 1, 0.8980392, 0, 1,
-1.108352, 2.192762, -2.313378, 1, 0.9058824, 0, 1,
-1.108308, -0.09099506, -2.303867, 1, 0.9137255, 0, 1,
-1.107283, -0.09486279, -2.80522, 1, 0.9176471, 0, 1,
-1.103607, 0.9477959, -0.30907, 1, 0.9254902, 0, 1,
-1.092065, 0.08509813, -2.467871, 1, 0.9294118, 0, 1,
-1.090382, -0.06424413, -0.5483558, 1, 0.9372549, 0, 1,
-1.089806, -0.1593495, -1.819003, 1, 0.9411765, 0, 1,
-1.089499, -0.6289715, -1.862038, 1, 0.9490196, 0, 1,
-1.087824, 1.003636, -1.149214, 1, 0.9529412, 0, 1,
-1.087109, -1.87076, -4.790584, 1, 0.9607843, 0, 1,
-1.085443, 0.5775359, -0.9412587, 1, 0.9647059, 0, 1,
-1.084828, -0.5181535, -3.890803, 1, 0.972549, 0, 1,
-1.083779, -1.371434, -1.96865, 1, 0.9764706, 0, 1,
-1.078573, 1.261279, -0.6611664, 1, 0.9843137, 0, 1,
-1.071766, -0.7468364, -1.458813, 1, 0.9882353, 0, 1,
-1.070992, 0.329436, -1.315557, 1, 0.9960784, 0, 1,
-1.068465, -0.4530187, -2.02977, 0.9960784, 1, 0, 1,
-1.06588, -0.2507251, -1.950997, 0.9921569, 1, 0, 1,
-1.058378, -2.175744, -3.788503, 0.9843137, 1, 0, 1,
-1.054348, -0.05362092, -3.652026, 0.9803922, 1, 0, 1,
-1.050326, -0.7857825, -2.567507, 0.972549, 1, 0, 1,
-1.039768, 0.5331968, -0.7547407, 0.9686275, 1, 0, 1,
-1.028549, 0.51358, -2.199913, 0.9607843, 1, 0, 1,
-1.019557, 0.2356868, -2.21564, 0.9568627, 1, 0, 1,
-1.016828, -0.2775577, -1.837365, 0.9490196, 1, 0, 1,
-1.007754, -0.4523072, -3.563002, 0.945098, 1, 0, 1,
-0.9978601, 0.879045, -1.27008, 0.9372549, 1, 0, 1,
-0.993719, -2.75223, -2.115576, 0.9333333, 1, 0, 1,
-0.9922616, 0.653361, -1.793331, 0.9254902, 1, 0, 1,
-0.9908561, 0.8856586, -1.968175, 0.9215686, 1, 0, 1,
-0.9905105, -0.3061077, -1.811325, 0.9137255, 1, 0, 1,
-0.9882802, 0.04122226, -1.638086, 0.9098039, 1, 0, 1,
-0.9870773, 1.226979, -0.4022327, 0.9019608, 1, 0, 1,
-0.9817591, -0.178356, -1.974463, 0.8941177, 1, 0, 1,
-0.9715859, 0.8987268, 0.04774017, 0.8901961, 1, 0, 1,
-0.9703355, -0.1694851, -0.7498347, 0.8823529, 1, 0, 1,
-0.9682435, 1.1489, -2.425492, 0.8784314, 1, 0, 1,
-0.9669864, 0.0509442, -1.521074, 0.8705882, 1, 0, 1,
-0.9652246, -1.450836, 0.09353122, 0.8666667, 1, 0, 1,
-0.9558417, -0.3179691, -2.820905, 0.8588235, 1, 0, 1,
-0.9538695, -0.7215227, -2.325581, 0.854902, 1, 0, 1,
-0.9535912, 0.358238, -2.198486, 0.8470588, 1, 0, 1,
-0.9534013, 1.757644, -0.6557447, 0.8431373, 1, 0, 1,
-0.9527261, 0.180787, -0.7862365, 0.8352941, 1, 0, 1,
-0.9433735, 0.9899884, -0.1103658, 0.8313726, 1, 0, 1,
-0.9419838, 1.415306, 0.1499229, 0.8235294, 1, 0, 1,
-0.9368315, 1.858565, 1.091126, 0.8196079, 1, 0, 1,
-0.9196766, 0.07417326, -2.414975, 0.8117647, 1, 0, 1,
-0.9170464, -0.7731785, -4.213289, 0.8078431, 1, 0, 1,
-0.9138016, 1.344121, 0.04128846, 0.8, 1, 0, 1,
-0.9080288, 1.742538, 0.6340882, 0.7921569, 1, 0, 1,
-0.9070162, -0.4504102, -1.254796, 0.7882353, 1, 0, 1,
-0.9027575, -2.007026, -3.608168, 0.7803922, 1, 0, 1,
-0.9023884, 0.04029364, -2.662965, 0.7764706, 1, 0, 1,
-0.8982742, 0.2265824, -1.890863, 0.7686275, 1, 0, 1,
-0.8944045, -1.74538, -1.706187, 0.7647059, 1, 0, 1,
-0.89166, -0.1761011, -2.470925, 0.7568628, 1, 0, 1,
-0.8911763, 0.3772894, 0.1897159, 0.7529412, 1, 0, 1,
-0.8905346, -0.3061176, -2.683423, 0.7450981, 1, 0, 1,
-0.8881748, -1.110113, -2.598168, 0.7411765, 1, 0, 1,
-0.8870537, 0.2142092, -0.6077707, 0.7333333, 1, 0, 1,
-0.8714758, -0.2637342, -1.26905, 0.7294118, 1, 0, 1,
-0.8681435, -0.1967372, -1.128851, 0.7215686, 1, 0, 1,
-0.8638948, -0.2847638, -2.876699, 0.7176471, 1, 0, 1,
-0.856558, 0.1120974, -0.2283062, 0.7098039, 1, 0, 1,
-0.852263, -1.141819, -2.799142, 0.7058824, 1, 0, 1,
-0.8507651, -0.9909136, -3.638273, 0.6980392, 1, 0, 1,
-0.8468957, 0.7924516, -1.103412, 0.6901961, 1, 0, 1,
-0.8450448, -0.5056803, -2.433189, 0.6862745, 1, 0, 1,
-0.8442532, 1.125145, -0.2191272, 0.6784314, 1, 0, 1,
-0.8389657, -0.06195, -1.437227, 0.6745098, 1, 0, 1,
-0.8333948, 0.05876706, 0.1650214, 0.6666667, 1, 0, 1,
-0.8273357, 1.626667, -2.127518, 0.6627451, 1, 0, 1,
-0.8261237, -0.667567, -3.275184, 0.654902, 1, 0, 1,
-0.8174809, -1.003208, -3.197559, 0.6509804, 1, 0, 1,
-0.8142682, -0.1279039, -1.493953, 0.6431373, 1, 0, 1,
-0.8100569, -0.7831622, -3.898585, 0.6392157, 1, 0, 1,
-0.8091903, 0.3851229, -1.572325, 0.6313726, 1, 0, 1,
-0.8010303, -0.9986381, -2.943198, 0.627451, 1, 0, 1,
-0.7938196, 0.09472804, -5.003814, 0.6196079, 1, 0, 1,
-0.789729, -0.5942543, -2.789925, 0.6156863, 1, 0, 1,
-0.7850073, 1.725146, -1.025238, 0.6078432, 1, 0, 1,
-0.7782999, 0.6593688, -1.137183, 0.6039216, 1, 0, 1,
-0.774837, 0.1213936, -1.140213, 0.5960785, 1, 0, 1,
-0.7719118, -1.642941, -3.239935, 0.5882353, 1, 0, 1,
-0.7684947, -0.8216907, -3.683336, 0.5843138, 1, 0, 1,
-0.7682088, 0.03301744, -0.3652293, 0.5764706, 1, 0, 1,
-0.7630925, -1.722321, -2.50354, 0.572549, 1, 0, 1,
-0.7618151, 1.285097, -0.9491233, 0.5647059, 1, 0, 1,
-0.7604783, 0.1535802, -1.17316, 0.5607843, 1, 0, 1,
-0.7568372, -1.897078, -3.625997, 0.5529412, 1, 0, 1,
-0.7477483, 0.4675206, 0.2178027, 0.5490196, 1, 0, 1,
-0.7474821, 1.077101, -0.8682343, 0.5411765, 1, 0, 1,
-0.7470236, 0.6724084, -1.16823, 0.5372549, 1, 0, 1,
-0.7378609, 0.02172734, -1.591134, 0.5294118, 1, 0, 1,
-0.7377555, 0.9152496, 0.1842261, 0.5254902, 1, 0, 1,
-0.7374018, -1.051029, -2.033653, 0.5176471, 1, 0, 1,
-0.7324004, 2.081892, -0.9912931, 0.5137255, 1, 0, 1,
-0.7278643, -1.25835, -3.55823, 0.5058824, 1, 0, 1,
-0.7230412, 1.958222, -1.413123, 0.5019608, 1, 0, 1,
-0.72208, -0.5260145, -3.069193, 0.4941176, 1, 0, 1,
-0.712141, 0.965187, -0.5065213, 0.4862745, 1, 0, 1,
-0.7120432, 0.1163626, -2.407959, 0.4823529, 1, 0, 1,
-0.7079312, 1.31825, 1.081694, 0.4745098, 1, 0, 1,
-0.7031454, -0.02562435, -1.860762, 0.4705882, 1, 0, 1,
-0.7029684, 1.828709, -1.176305, 0.4627451, 1, 0, 1,
-0.7028688, 0.3282606, -0.4908661, 0.4588235, 1, 0, 1,
-0.70256, 1.546987, -0.7491754, 0.4509804, 1, 0, 1,
-0.698888, -1.468475, -2.899648, 0.4470588, 1, 0, 1,
-0.6975584, 1.455141, -0.06369705, 0.4392157, 1, 0, 1,
-0.6967469, -1.392455, -3.776973, 0.4352941, 1, 0, 1,
-0.6950885, 0.5166851, 0.633167, 0.427451, 1, 0, 1,
-0.6856555, -0.877346, -2.109447, 0.4235294, 1, 0, 1,
-0.6790775, -0.446432, -2.728179, 0.4156863, 1, 0, 1,
-0.6750296, -0.08870967, -1.141307, 0.4117647, 1, 0, 1,
-0.6746804, -1.074687, -2.849753, 0.4039216, 1, 0, 1,
-0.6746485, 0.111944, -0.715621, 0.3960784, 1, 0, 1,
-0.6739271, 0.628551, 0.9404255, 0.3921569, 1, 0, 1,
-0.6721972, -0.01527388, -1.80728, 0.3843137, 1, 0, 1,
-0.6660209, -0.147599, -0.8453261, 0.3803922, 1, 0, 1,
-0.6631368, -0.5163044, -2.184085, 0.372549, 1, 0, 1,
-0.6507065, 0.6472212, -2.315238, 0.3686275, 1, 0, 1,
-0.635242, -0.3663043, -1.379234, 0.3607843, 1, 0, 1,
-0.631795, 1.42928, -0.6034344, 0.3568628, 1, 0, 1,
-0.6260187, 0.9995269, -1.875017, 0.3490196, 1, 0, 1,
-0.621994, 0.2583058, -0.5355361, 0.345098, 1, 0, 1,
-0.6102645, -0.3964314, 0.08102194, 0.3372549, 1, 0, 1,
-0.6042938, -0.2275682, -1.52562, 0.3333333, 1, 0, 1,
-0.6006224, -0.4078412, -2.246823, 0.3254902, 1, 0, 1,
-0.5939699, -0.2838318, -0.9980699, 0.3215686, 1, 0, 1,
-0.5935504, -0.4582942, -3.746464, 0.3137255, 1, 0, 1,
-0.5887852, -0.255267, -2.746092, 0.3098039, 1, 0, 1,
-0.5839417, 1.470005, 0.1538757, 0.3019608, 1, 0, 1,
-0.5794168, 1.038149, -0.8825974, 0.2941177, 1, 0, 1,
-0.5771223, 1.160679, -0.9449165, 0.2901961, 1, 0, 1,
-0.5760854, -0.3127874, -0.5851175, 0.282353, 1, 0, 1,
-0.5748863, -1.086824, -3.563748, 0.2784314, 1, 0, 1,
-0.5730419, -0.6439309, -4.618852, 0.2705882, 1, 0, 1,
-0.5710757, -1.541584, -3.43474, 0.2666667, 1, 0, 1,
-0.5688236, 0.03430046, -1.33228, 0.2588235, 1, 0, 1,
-0.5668019, -0.1672215, -1.77327, 0.254902, 1, 0, 1,
-0.5611394, -0.1431542, -2.022568, 0.2470588, 1, 0, 1,
-0.555593, 0.6871469, 0.4425564, 0.2431373, 1, 0, 1,
-0.5521307, 0.5406223, -1.820454, 0.2352941, 1, 0, 1,
-0.551287, -0.424036, 0.2165221, 0.2313726, 1, 0, 1,
-0.5493421, -0.6478063, -2.211609, 0.2235294, 1, 0, 1,
-0.5485108, 0.1525223, 0.6214266, 0.2196078, 1, 0, 1,
-0.5465804, 0.269562, -1.741273, 0.2117647, 1, 0, 1,
-0.5383901, -0.4766984, -1.659205, 0.2078431, 1, 0, 1,
-0.5364167, 0.2414989, -1.05494, 0.2, 1, 0, 1,
-0.5217081, 0.5485412, -1.280509, 0.1921569, 1, 0, 1,
-0.518102, -2.135673, -3.381741, 0.1882353, 1, 0, 1,
-0.5121489, 0.06707294, -2.021699, 0.1803922, 1, 0, 1,
-0.5077255, 1.681441, 0.227661, 0.1764706, 1, 0, 1,
-0.5065774, -2.202389, -3.331894, 0.1686275, 1, 0, 1,
-0.5010891, 1.169611, 1.205468, 0.1647059, 1, 0, 1,
-0.499344, 2.18616, -2.105016, 0.1568628, 1, 0, 1,
-0.4990417, 0.4520554, -0.728787, 0.1529412, 1, 0, 1,
-0.4966207, 0.366669, 0.6813357, 0.145098, 1, 0, 1,
-0.4938511, 0.2114276, -1.387, 0.1411765, 1, 0, 1,
-0.4918721, 1.923774, -1.250515, 0.1333333, 1, 0, 1,
-0.4868653, -1.12835, -3.000791, 0.1294118, 1, 0, 1,
-0.4868027, 0.9165728, 0.2010923, 0.1215686, 1, 0, 1,
-0.4837786, 0.7667107, -0.1840772, 0.1176471, 1, 0, 1,
-0.4827785, 1.756227, -0.3940242, 0.1098039, 1, 0, 1,
-0.4821679, -0.8593565, -3.037256, 0.1058824, 1, 0, 1,
-0.4773289, -0.2529414, -1.159715, 0.09803922, 1, 0, 1,
-0.4733874, 1.254389, -0.3411235, 0.09019608, 1, 0, 1,
-0.468593, -0.01956353, -1.553634, 0.08627451, 1, 0, 1,
-0.4624661, 0.762783, 0.6924649, 0.07843138, 1, 0, 1,
-0.456578, 0.608448, -0.2421604, 0.07450981, 1, 0, 1,
-0.455471, -0.5805671, -3.954424, 0.06666667, 1, 0, 1,
-0.4513099, 0.7342703, 1.454504, 0.0627451, 1, 0, 1,
-0.4487847, -0.300336, -2.214791, 0.05490196, 1, 0, 1,
-0.439998, -0.09689597, -1.533417, 0.05098039, 1, 0, 1,
-0.4391871, 0.5048753, 0.5736601, 0.04313726, 1, 0, 1,
-0.4374163, -0.6019121, -2.519278, 0.03921569, 1, 0, 1,
-0.4346651, 0.2629524, -0.1377812, 0.03137255, 1, 0, 1,
-0.4251314, 1.073369, -1.817867, 0.02745098, 1, 0, 1,
-0.4229542, -0.3110558, -1.972844, 0.01960784, 1, 0, 1,
-0.4222063, 0.3028319, -1.930917, 0.01568628, 1, 0, 1,
-0.4161435, 0.5645614, 0.7161339, 0.007843138, 1, 0, 1,
-0.4161143, -1.31505, -2.312305, 0.003921569, 1, 0, 1,
-0.4131157, 1.91252, -0.001136229, 0, 1, 0.003921569, 1,
-0.4116816, 0.8988266, 0.9730843, 0, 1, 0.01176471, 1,
-0.409768, 0.385939, -0.3060456, 0, 1, 0.01568628, 1,
-0.4095641, -0.7862241, -3.095634, 0, 1, 0.02352941, 1,
-0.4089126, 0.476134, 0.6743619, 0, 1, 0.02745098, 1,
-0.4087161, -0.07066561, -2.547221, 0, 1, 0.03529412, 1,
-0.3972404, -0.3547232, -1.159231, 0, 1, 0.03921569, 1,
-0.3946986, 0.09301873, -0.5164689, 0, 1, 0.04705882, 1,
-0.393168, 0.7397078, -0.6012654, 0, 1, 0.05098039, 1,
-0.3904813, -0.1516668, -5.511901, 0, 1, 0.05882353, 1,
-0.3876777, -0.4462783, -2.937396, 0, 1, 0.0627451, 1,
-0.3774205, 0.9708389, -1.077981, 0, 1, 0.07058824, 1,
-0.3764577, -0.5249471, -3.074428, 0, 1, 0.07450981, 1,
-0.3728907, 0.7773705, 0.5379342, 0, 1, 0.08235294, 1,
-0.3701588, 0.1158369, -3.789066, 0, 1, 0.08627451, 1,
-0.3667183, -0.1837318, -1.645455, 0, 1, 0.09411765, 1,
-0.3662972, 1.674795, 0.6148831, 0, 1, 0.1019608, 1,
-0.3640848, 0.8741829, 0.6050966, 0, 1, 0.1058824, 1,
-0.3585352, -0.5907541, -2.267895, 0, 1, 0.1137255, 1,
-0.3583211, -1.075494, -2.654106, 0, 1, 0.1176471, 1,
-0.350311, 1.627385, 0.06555653, 0, 1, 0.1254902, 1,
-0.3500755, 2.120472, 0.3889364, 0, 1, 0.1294118, 1,
-0.3483107, -1.421703, -2.719889, 0, 1, 0.1372549, 1,
-0.3454192, -1.514, -2.430436, 0, 1, 0.1411765, 1,
-0.3440212, 0.7534068, 0.2617235, 0, 1, 0.1490196, 1,
-0.3438845, -1.68176, -2.704221, 0, 1, 0.1529412, 1,
-0.3384061, 0.4773761, -0.165857, 0, 1, 0.1607843, 1,
-0.3363974, 0.9324722, 0.08884299, 0, 1, 0.1647059, 1,
-0.3286342, -1.513011, -4.3501, 0, 1, 0.172549, 1,
-0.3282857, 0.9480337, 0.7670066, 0, 1, 0.1764706, 1,
-0.3233845, 2.393554, 0.3847994, 0, 1, 0.1843137, 1,
-0.3199423, -0.3076415, -3.820356, 0, 1, 0.1882353, 1,
-0.3178148, -0.7403544, -3.414278, 0, 1, 0.1960784, 1,
-0.3167337, 0.100467, -0.4972928, 0, 1, 0.2039216, 1,
-0.3037643, -0.2635505, -2.747077, 0, 1, 0.2078431, 1,
-0.3015871, -1.650661, -3.969358, 0, 1, 0.2156863, 1,
-0.3005794, 0.7649899, -0.8146961, 0, 1, 0.2196078, 1,
-0.2997924, -1.08335, -2.244301, 0, 1, 0.227451, 1,
-0.2992864, 0.4613317, -1.801809, 0, 1, 0.2313726, 1,
-0.2980427, -1.756549, -2.266085, 0, 1, 0.2392157, 1,
-0.2959129, 0.1610735, -0.7141345, 0, 1, 0.2431373, 1,
-0.2952439, -0.5432742, -3.163894, 0, 1, 0.2509804, 1,
-0.2897838, -0.3355582, -4.018643, 0, 1, 0.254902, 1,
-0.289593, 1.202076, -1.125733, 0, 1, 0.2627451, 1,
-0.2860979, -0.1269647, -2.188441, 0, 1, 0.2666667, 1,
-0.2850856, -1.106598, -2.577806, 0, 1, 0.2745098, 1,
-0.2825145, -0.1692955, -3.855984, 0, 1, 0.2784314, 1,
-0.278783, -0.8185788, -4.862738, 0, 1, 0.2862745, 1,
-0.2748134, 0.2212635, -1.835415, 0, 1, 0.2901961, 1,
-0.2727805, 0.7986625, -0.3497306, 0, 1, 0.2980392, 1,
-0.2695121, 0.03907287, -1.631657, 0, 1, 0.3058824, 1,
-0.2690883, -0.649034, -1.875952, 0, 1, 0.3098039, 1,
-0.2646747, 0.2911702, -0.4745401, 0, 1, 0.3176471, 1,
-0.264505, -0.8887246, -1.910404, 0, 1, 0.3215686, 1,
-0.2606883, -0.6888247, -3.750607, 0, 1, 0.3294118, 1,
-0.2602762, 1.251702, 0.2181906, 0, 1, 0.3333333, 1,
-0.2541008, 0.3545968, -0.8851319, 0, 1, 0.3411765, 1,
-0.252704, -0.5187485, -3.579979, 0, 1, 0.345098, 1,
-0.2492756, 0.3190711, 1.15106, 0, 1, 0.3529412, 1,
-0.2480741, -0.3624597, -2.620761, 0, 1, 0.3568628, 1,
-0.2399999, -1.056759, -4.298883, 0, 1, 0.3647059, 1,
-0.2343609, -0.9176686, -3.187353, 0, 1, 0.3686275, 1,
-0.2280128, 0.5701198, -0.6007279, 0, 1, 0.3764706, 1,
-0.2278531, -0.1459545, -1.329402, 0, 1, 0.3803922, 1,
-0.2276138, -0.9998836, -3.513921, 0, 1, 0.3882353, 1,
-0.2241015, -1.074449, -2.351274, 0, 1, 0.3921569, 1,
-0.2235781, 0.6771904, -0.6831328, 0, 1, 0.4, 1,
-0.2227639, -1.378157, -0.8201256, 0, 1, 0.4078431, 1,
-0.2204803, 1.212437, 0.5453869, 0, 1, 0.4117647, 1,
-0.2156775, -0.03462458, -1.486436, 0, 1, 0.4196078, 1,
-0.215492, 0.8800291, 0.6262279, 0, 1, 0.4235294, 1,
-0.2134282, -0.6740636, -3.188268, 0, 1, 0.4313726, 1,
-0.2104701, 0.01227152, -1.77975, 0, 1, 0.4352941, 1,
-0.2095696, -1.17569, -0.9686613, 0, 1, 0.4431373, 1,
-0.2035572, -1.27287, -2.777778, 0, 1, 0.4470588, 1,
-0.2018883, -0.3415425, -1.574834, 0, 1, 0.454902, 1,
-0.1957812, 1.104236, 0.674474, 0, 1, 0.4588235, 1,
-0.1938433, -0.7920081, -1.691223, 0, 1, 0.4666667, 1,
-0.1883864, 0.6110076, -1.262546, 0, 1, 0.4705882, 1,
-0.1789926, 0.9607684, -0.9114398, 0, 1, 0.4784314, 1,
-0.1788468, 0.04763012, -1.575056, 0, 1, 0.4823529, 1,
-0.1772637, 0.8289037, -0.2663368, 0, 1, 0.4901961, 1,
-0.1723346, -0.3574445, -1.634744, 0, 1, 0.4941176, 1,
-0.1723205, 0.8302059, 1.059175, 0, 1, 0.5019608, 1,
-0.1666764, 0.8256437, -0.4583474, 0, 1, 0.509804, 1,
-0.1664249, 0.7617757, 0.8523977, 0, 1, 0.5137255, 1,
-0.1649616, 0.5996537, -1.27448, 0, 1, 0.5215687, 1,
-0.1628043, 0.3057302, -0.02259929, 0, 1, 0.5254902, 1,
-0.1583756, -2.068775, -5.04154, 0, 1, 0.5333334, 1,
-0.1580751, -0.9999539, -2.587522, 0, 1, 0.5372549, 1,
-0.1575541, -0.2991004, -1.912803, 0, 1, 0.5450981, 1,
-0.1569608, -0.6124119, -2.892392, 0, 1, 0.5490196, 1,
-0.152657, 0.2504178, 0.9138389, 0, 1, 0.5568628, 1,
-0.1494031, 0.530017, -1.563373, 0, 1, 0.5607843, 1,
-0.1457749, 1.450941, -0.02324761, 0, 1, 0.5686275, 1,
-0.1451199, 1.276888, 0.4991933, 0, 1, 0.572549, 1,
-0.1402071, 0.1642436, 0.55088, 0, 1, 0.5803922, 1,
-0.1383283, -0.5884684, -2.759952, 0, 1, 0.5843138, 1,
-0.1379582, -0.4408303, -2.327374, 0, 1, 0.5921569, 1,
-0.1369613, -1.094862, -3.561341, 0, 1, 0.5960785, 1,
-0.1367382, 0.5918217, -2.087376, 0, 1, 0.6039216, 1,
-0.1293471, -0.1678609, -2.174955, 0, 1, 0.6117647, 1,
-0.1293357, -0.7112907, -2.514536, 0, 1, 0.6156863, 1,
-0.1292556, 0.005451895, -2.866843, 0, 1, 0.6235294, 1,
-0.1211454, 0.2490998, -0.2484075, 0, 1, 0.627451, 1,
-0.120782, -1.411369, -2.639673, 0, 1, 0.6352941, 1,
-0.1185495, 0.8140568, -0.01514313, 0, 1, 0.6392157, 1,
-0.1178032, -0.4045524, -4.549917, 0, 1, 0.6470588, 1,
-0.1161843, 0.6837075, 0.5882333, 0, 1, 0.6509804, 1,
-0.1128209, 2.619135, 0.09693781, 0, 1, 0.6588235, 1,
-0.112493, -0.5686726, -5.669376, 0, 1, 0.6627451, 1,
-0.1110745, -0.3829537, -3.139986, 0, 1, 0.6705883, 1,
-0.1083803, 0.8983043, 2.659725, 0, 1, 0.6745098, 1,
-0.1060348, -1.527056, -2.567511, 0, 1, 0.682353, 1,
-0.103888, 0.5914751, -2.214719, 0, 1, 0.6862745, 1,
-0.1025687, -1.281185, -3.213452, 0, 1, 0.6941177, 1,
-0.1018796, -1.224444, -2.874689, 0, 1, 0.7019608, 1,
-0.1016466, -0.7231016, -0.730051, 0, 1, 0.7058824, 1,
-0.1005239, 0.8401994, 0.217819, 0, 1, 0.7137255, 1,
-0.09431593, 0.460933, -0.4482774, 0, 1, 0.7176471, 1,
-0.09050558, 0.9366604, -0.7590883, 0, 1, 0.7254902, 1,
-0.09003728, -1.925948, -3.065028, 0, 1, 0.7294118, 1,
-0.08671322, 2.194602, 0.08314487, 0, 1, 0.7372549, 1,
-0.08371525, -0.6491933, -1.950368, 0, 1, 0.7411765, 1,
-0.07586139, 0.2915461, 0.4439997, 0, 1, 0.7490196, 1,
-0.07384557, 1.065066, 0.5429916, 0, 1, 0.7529412, 1,
-0.07315525, -0.08376361, -3.019325, 0, 1, 0.7607843, 1,
-0.07203086, -0.4976742, -2.541493, 0, 1, 0.7647059, 1,
-0.07186806, 0.05265156, -1.793615, 0, 1, 0.772549, 1,
-0.06879987, 1.011186, 1.168787, 0, 1, 0.7764706, 1,
-0.06571472, -1.462687, -3.992207, 0, 1, 0.7843137, 1,
-0.06165456, 0.7122387, 0.06056362, 0, 1, 0.7882353, 1,
-0.06136637, 0.3797594, -1.418919, 0, 1, 0.7960784, 1,
-0.05330056, -1.637307, -1.553343, 0, 1, 0.8039216, 1,
-0.05305497, 0.1659448, 0.2006244, 0, 1, 0.8078431, 1,
-0.04927981, 1.423881, -1.220519, 0, 1, 0.8156863, 1,
-0.04872693, 1.052628, -1.513123, 0, 1, 0.8196079, 1,
-0.04612804, 0.2152835, 0.9894414, 0, 1, 0.827451, 1,
-0.0424853, -0.9458538, -3.041646, 0, 1, 0.8313726, 1,
-0.04069528, 0.458134, -0.3160109, 0, 1, 0.8392157, 1,
-0.03811814, -0.6441357, -6.595315, 0, 1, 0.8431373, 1,
-0.03796823, 1.305386, -0.009043388, 0, 1, 0.8509804, 1,
-0.03562558, -0.7219779, -4.676217, 0, 1, 0.854902, 1,
-0.03361516, 0.1243435, 0.1174736, 0, 1, 0.8627451, 1,
-0.03029264, 1.293798, 0.5265977, 0, 1, 0.8666667, 1,
-0.02848323, -0.1624669, -2.237513, 0, 1, 0.8745098, 1,
-0.02182342, 0.3904664, 0.4529077, 0, 1, 0.8784314, 1,
-0.01963, -1.385734, -3.510301, 0, 1, 0.8862745, 1,
-0.01407829, 0.2773256, 0.6402299, 0, 1, 0.8901961, 1,
-0.009261514, -0.595359, -3.170155, 0, 1, 0.8980392, 1,
-0.008429098, -0.1317966, -3.969031, 0, 1, 0.9058824, 1,
-0.0001735282, 0.7849873, 0.3449417, 0, 1, 0.9098039, 1,
-9.052258e-05, -1.478471, -2.81679, 0, 1, 0.9176471, 1,
0.002918478, 1.552049, -0.4120935, 0, 1, 0.9215686, 1,
0.00521493, -0.3142688, 2.852238, 0, 1, 0.9294118, 1,
0.005411341, 0.2370799, 0.3529216, 0, 1, 0.9333333, 1,
0.006138484, 1.229899, -0.1471751, 0, 1, 0.9411765, 1,
0.006141761, -1.081669, 2.307095, 0, 1, 0.945098, 1,
0.008819273, -1.605418, 4.499478, 0, 1, 0.9529412, 1,
0.01068593, -0.3895463, 3.583572, 0, 1, 0.9568627, 1,
0.01353078, -0.8908026, 3.581971, 0, 1, 0.9647059, 1,
0.01680137, -2.460269, 2.65407, 0, 1, 0.9686275, 1,
0.01710882, 0.8714714, 0.08483971, 0, 1, 0.9764706, 1,
0.02012512, 0.4905185, -0.05739793, 0, 1, 0.9803922, 1,
0.02338023, -0.1197502, 4.756909, 0, 1, 0.9882353, 1,
0.02573602, -0.6930597, 4.364597, 0, 1, 0.9921569, 1,
0.02901825, -0.2130888, 2.597528, 0, 1, 1, 1,
0.03175055, 0.6800706, -2.593096, 0, 0.9921569, 1, 1,
0.03749852, 0.3265596, 0.784381, 0, 0.9882353, 1, 1,
0.04248578, -0.1209736, 3.285425, 0, 0.9803922, 1, 1,
0.04331222, -0.8780319, 3.734626, 0, 0.9764706, 1, 1,
0.04410826, 0.4495786, -0.5204619, 0, 0.9686275, 1, 1,
0.04546489, -0.3078025, 2.28237, 0, 0.9647059, 1, 1,
0.04755837, -0.1333012, 3.77254, 0, 0.9568627, 1, 1,
0.04923905, 0.4575221, 0.5407548, 0, 0.9529412, 1, 1,
0.055608, -0.8817038, 3.161952, 0, 0.945098, 1, 1,
0.05641796, 0.92736, -0.1297843, 0, 0.9411765, 1, 1,
0.05739252, 0.2697974, 1.406578, 0, 0.9333333, 1, 1,
0.05882933, 0.5182397, 0.7542439, 0, 0.9294118, 1, 1,
0.06114255, 1.089254, 0.9147031, 0, 0.9215686, 1, 1,
0.06693497, 0.03474133, 2.025878, 0, 0.9176471, 1, 1,
0.06902865, -0.7791629, 2.823847, 0, 0.9098039, 1, 1,
0.07410278, -0.7241622, 2.471756, 0, 0.9058824, 1, 1,
0.07484613, -1.567725, 3.712389, 0, 0.8980392, 1, 1,
0.07851814, 0.4578325, 0.182828, 0, 0.8901961, 1, 1,
0.08130304, 0.713362, -1.010015, 0, 0.8862745, 1, 1,
0.085098, -0.8770251, 1.022573, 0, 0.8784314, 1, 1,
0.08626664, -0.7017698, 2.106807, 0, 0.8745098, 1, 1,
0.08665016, -0.8598468, 5.082052, 0, 0.8666667, 1, 1,
0.08727425, 1.38912, -0.8301399, 0, 0.8627451, 1, 1,
0.08901276, 0.9218045, -0.1744573, 0, 0.854902, 1, 1,
0.09271946, 1.891556, -0.5980178, 0, 0.8509804, 1, 1,
0.0937933, 0.5256097, 1.058718, 0, 0.8431373, 1, 1,
0.093826, 1.509265, 0.2946831, 0, 0.8392157, 1, 1,
0.09516883, -0.2528777, 2.657272, 0, 0.8313726, 1, 1,
0.1096441, 0.6257095, 0.3872738, 0, 0.827451, 1, 1,
0.1119357, -0.4848437, 3.331212, 0, 0.8196079, 1, 1,
0.1132339, 0.7891117, 1.2372, 0, 0.8156863, 1, 1,
0.114229, 0.9470232, -0.8483291, 0, 0.8078431, 1, 1,
0.1144238, -0.1837108, 2.431077, 0, 0.8039216, 1, 1,
0.1171208, -1.378292, 3.408321, 0, 0.7960784, 1, 1,
0.1174532, 1.734123, -0.01414031, 0, 0.7882353, 1, 1,
0.1178151, 0.381046, 0.4008715, 0, 0.7843137, 1, 1,
0.1182932, 1.056684, -1.656168, 0, 0.7764706, 1, 1,
0.1189919, -1.28591, 4.8906, 0, 0.772549, 1, 1,
0.1230616, -0.5346932, 3.631282, 0, 0.7647059, 1, 1,
0.1250468, 0.1273412, -0.8161064, 0, 0.7607843, 1, 1,
0.1255024, 0.2014608, 0.5252762, 0, 0.7529412, 1, 1,
0.1263192, 0.5028462, -1.880405, 0, 0.7490196, 1, 1,
0.1280238, -0.06536774, 2.452241, 0, 0.7411765, 1, 1,
0.130229, -0.1249965, 2.747819, 0, 0.7372549, 1, 1,
0.1317079, -2.261172, 1.360902, 0, 0.7294118, 1, 1,
0.1375145, 0.3345653, 1.279675, 0, 0.7254902, 1, 1,
0.1381123, 1.190039, -1.157079, 0, 0.7176471, 1, 1,
0.1382274, -1.677762, 4.056707, 0, 0.7137255, 1, 1,
0.1418883, 0.3559491, 1.200859, 0, 0.7058824, 1, 1,
0.1454982, -0.4364115, 3.255173, 0, 0.6980392, 1, 1,
0.1455602, 1.227991, 0.2299564, 0, 0.6941177, 1, 1,
0.1459958, -1.205528, 2.873454, 0, 0.6862745, 1, 1,
0.1469217, -0.07937679, 2.594551, 0, 0.682353, 1, 1,
0.1511, 1.10998, 0.1397888, 0, 0.6745098, 1, 1,
0.1517239, -1.615583, 3.381392, 0, 0.6705883, 1, 1,
0.1518854, 1.526902, 1.902883, 0, 0.6627451, 1, 1,
0.1531644, -1.590565, 1.889768, 0, 0.6588235, 1, 1,
0.1547372, -0.6696028, 4.021091, 0, 0.6509804, 1, 1,
0.1553994, -0.1177023, 3.055279, 0, 0.6470588, 1, 1,
0.1565233, -0.2214836, 3.071041, 0, 0.6392157, 1, 1,
0.1595637, 1.412195, 0.9823312, 0, 0.6352941, 1, 1,
0.1598611, -1.746618, 2.489979, 0, 0.627451, 1, 1,
0.1607038, 1.083665, -0.540786, 0, 0.6235294, 1, 1,
0.1645747, -1.659868, 4.399762, 0, 0.6156863, 1, 1,
0.1663674, 0.554867, 0.5672918, 0, 0.6117647, 1, 1,
0.1715075, -0.1677545, 3.042197, 0, 0.6039216, 1, 1,
0.1716427, 0.1956932, -0.8873027, 0, 0.5960785, 1, 1,
0.1735264, 1.521473, 0.5257894, 0, 0.5921569, 1, 1,
0.1758746, 0.4833156, 1.387669, 0, 0.5843138, 1, 1,
0.1769153, -0.1784796, 2.879698, 0, 0.5803922, 1, 1,
0.1777252, -0.5955824, 3.728216, 0, 0.572549, 1, 1,
0.1808728, -0.3679927, 2.072681, 0, 0.5686275, 1, 1,
0.1826969, 1.382819, -0.1677658, 0, 0.5607843, 1, 1,
0.1830405, 0.3335638, 0.6609046, 0, 0.5568628, 1, 1,
0.1842038, 1.543845, 0.05632377, 0, 0.5490196, 1, 1,
0.1857171, 1.403277, -2.146108, 0, 0.5450981, 1, 1,
0.1884741, -1.052641, 3.23469, 0, 0.5372549, 1, 1,
0.1991389, 0.5586287, -0.2066781, 0, 0.5333334, 1, 1,
0.1996749, 0.8343735, -0.7487454, 0, 0.5254902, 1, 1,
0.2067748, 0.9177247, -0.9097323, 0, 0.5215687, 1, 1,
0.2067782, -0.08987637, 1.744922, 0, 0.5137255, 1, 1,
0.2076449, 0.6136467, -0.4118701, 0, 0.509804, 1, 1,
0.2076891, 0.0231292, 2.585308, 0, 0.5019608, 1, 1,
0.2087732, -1.10467, 3.527359, 0, 0.4941176, 1, 1,
0.2087817, -0.2350056, 0.6692501, 0, 0.4901961, 1, 1,
0.2096102, 0.537647, -0.2463344, 0, 0.4823529, 1, 1,
0.2108583, 0.6072814, 1.013435, 0, 0.4784314, 1, 1,
0.2125093, 0.1941551, 2.442373, 0, 0.4705882, 1, 1,
0.214892, 1.762739, 1.454771, 0, 0.4666667, 1, 1,
0.2174147, -0.6566874, 2.722487, 0, 0.4588235, 1, 1,
0.2206144, -0.5659999, 2.857512, 0, 0.454902, 1, 1,
0.2211032, -0.55028, 3.641514, 0, 0.4470588, 1, 1,
0.2221092, 0.1913841, 1.886212, 0, 0.4431373, 1, 1,
0.2222134, 0.9957699, 1.543167, 0, 0.4352941, 1, 1,
0.2225453, 0.9087873, 0.6785924, 0, 0.4313726, 1, 1,
0.2240493, -0.01104914, 2.885012, 0, 0.4235294, 1, 1,
0.2318582, -0.1428618, 3.381704, 0, 0.4196078, 1, 1,
0.2322115, 0.5646604, -0.9332616, 0, 0.4117647, 1, 1,
0.2329443, 0.4966024, 1.593055, 0, 0.4078431, 1, 1,
0.2340834, 0.2331328, 0.3395366, 0, 0.4, 1, 1,
0.237926, 0.1335922, 0.9201667, 0, 0.3921569, 1, 1,
0.240398, 1.861814, -0.1463674, 0, 0.3882353, 1, 1,
0.2415149, 0.4460475, 2.249225, 0, 0.3803922, 1, 1,
0.2420316, -1.888646, 2.348608, 0, 0.3764706, 1, 1,
0.2454783, -0.1171543, 3.861506, 0, 0.3686275, 1, 1,
0.2514101, -2.492991, 1.567969, 0, 0.3647059, 1, 1,
0.2582701, 0.3939873, 2.124064, 0, 0.3568628, 1, 1,
0.2586631, -0.8683026, 3.565319, 0, 0.3529412, 1, 1,
0.2679946, -0.01725034, 0.2140405, 0, 0.345098, 1, 1,
0.2713116, 0.3354976, 1.361623, 0, 0.3411765, 1, 1,
0.2767304, -0.4119984, 0.9474679, 0, 0.3333333, 1, 1,
0.2769143, -1.1034, 1.378138, 0, 0.3294118, 1, 1,
0.2770768, -0.00681164, 0.6180126, 0, 0.3215686, 1, 1,
0.2820913, 0.2188231, 1.168616, 0, 0.3176471, 1, 1,
0.2838629, -1.022104, 1.171165, 0, 0.3098039, 1, 1,
0.2840788, 1.60746, 0.9313599, 0, 0.3058824, 1, 1,
0.2845348, -0.7070084, 2.856794, 0, 0.2980392, 1, 1,
0.285917, 0.8295496, 1.154505, 0, 0.2901961, 1, 1,
0.2873912, 0.8574457, -0.208281, 0, 0.2862745, 1, 1,
0.2941489, -1.618521, 6.568729, 0, 0.2784314, 1, 1,
0.295794, -1.139077, 4.191505, 0, 0.2745098, 1, 1,
0.3015062, -1.421695, 2.170022, 0, 0.2666667, 1, 1,
0.3091608, -1.341236, 4.082139, 0, 0.2627451, 1, 1,
0.310554, 0.003999621, 1.251241, 0, 0.254902, 1, 1,
0.3184765, -0.8236728, 2.479934, 0, 0.2509804, 1, 1,
0.3204876, -0.1617528, 3.117043, 0, 0.2431373, 1, 1,
0.3225583, 0.03305752, 1.427042, 0, 0.2392157, 1, 1,
0.3237185, -0.3291342, 2.878917, 0, 0.2313726, 1, 1,
0.3260064, 1.100719, -1.325939, 0, 0.227451, 1, 1,
0.327268, 0.03425567, 2.355906, 0, 0.2196078, 1, 1,
0.3306991, 0.02860021, 1.30854, 0, 0.2156863, 1, 1,
0.3322919, -0.2047802, 1.843363, 0, 0.2078431, 1, 1,
0.336174, -0.9457794, 2.849958, 0, 0.2039216, 1, 1,
0.3378972, -1.06083, 1.708407, 0, 0.1960784, 1, 1,
0.3418245, 0.07507481, 1.634001, 0, 0.1882353, 1, 1,
0.345562, 1.625829, 0.6372994, 0, 0.1843137, 1, 1,
0.3473343, -0.1696094, 2.69201, 0, 0.1764706, 1, 1,
0.353317, -0.2662201, 1.069952, 0, 0.172549, 1, 1,
0.3535812, 1.816743, 0.7824581, 0, 0.1647059, 1, 1,
0.3537904, 0.8454185, -1.12614, 0, 0.1607843, 1, 1,
0.353979, 0.1299623, -0.2248666, 0, 0.1529412, 1, 1,
0.3547677, 0.7134754, 0.06859509, 0, 0.1490196, 1, 1,
0.3557334, 1.011565, 2.616503, 0, 0.1411765, 1, 1,
0.3624021, -0.1672747, 3.081481, 0, 0.1372549, 1, 1,
0.3646493, 1.625801, -0.4650527, 0, 0.1294118, 1, 1,
0.364857, -0.595823, 3.43202, 0, 0.1254902, 1, 1,
0.3688926, -0.5485188, 2.881643, 0, 0.1176471, 1, 1,
0.3701279, 1.798886, 1.481227, 0, 0.1137255, 1, 1,
0.3730222, -0.5597289, 2.095547, 0, 0.1058824, 1, 1,
0.3747267, -0.6496056, 2.957045, 0, 0.09803922, 1, 1,
0.3797338, -0.521714, 1.421516, 0, 0.09411765, 1, 1,
0.3816631, 0.6127957, 1.140711, 0, 0.08627451, 1, 1,
0.3857933, -0.1216554, 3.215974, 0, 0.08235294, 1, 1,
0.388124, 1.510795, -1.144483, 0, 0.07450981, 1, 1,
0.388517, -0.5190849, 1.404426, 0, 0.07058824, 1, 1,
0.3897826, 0.106409, 0.2344195, 0, 0.0627451, 1, 1,
0.3909475, -0.4836501, 1.547063, 0, 0.05882353, 1, 1,
0.3923677, -0.675046, 4.834402, 0, 0.05098039, 1, 1,
0.3947568, 1.524248, 0.2073174, 0, 0.04705882, 1, 1,
0.401014, -0.07953493, -0.07898893, 0, 0.03921569, 1, 1,
0.4032692, 0.1991622, 2.028128, 0, 0.03529412, 1, 1,
0.4036753, 0.3710414, -0.1606451, 0, 0.02745098, 1, 1,
0.4040202, 0.05055372, 0.9418637, 0, 0.02352941, 1, 1,
0.4074169, -0.0828172, 1.223495, 0, 0.01568628, 1, 1,
0.4102139, 0.3844243, 0.4811682, 0, 0.01176471, 1, 1,
0.4201083, 1.313401, 1.302225, 0, 0.003921569, 1, 1,
0.4238535, 0.7155331, 1.488418, 0.003921569, 0, 1, 1,
0.4256838, -0.8655105, 4.706729, 0.007843138, 0, 1, 1,
0.4289595, -0.3402039, 1.670211, 0.01568628, 0, 1, 1,
0.4296349, 2.440248, -0.001369058, 0.01960784, 0, 1, 1,
0.4297614, -0.8258325, 1.566776, 0.02745098, 0, 1, 1,
0.4300341, -0.913143, 3.308705, 0.03137255, 0, 1, 1,
0.4367084, -0.9267911, 2.648591, 0.03921569, 0, 1, 1,
0.4400707, -2.195785, 3.494734, 0.04313726, 0, 1, 1,
0.4444221, -0.8003665, 1.234095, 0.05098039, 0, 1, 1,
0.4545177, 1.814423, 1.348047, 0.05490196, 0, 1, 1,
0.4567181, 0.7803765, 2.235148, 0.0627451, 0, 1, 1,
0.4591739, -0.9629107, 4.193538, 0.06666667, 0, 1, 1,
0.4648132, -0.1544683, 2.656021, 0.07450981, 0, 1, 1,
0.4664458, 0.3088556, 0.2490997, 0.07843138, 0, 1, 1,
0.4689671, -0.004869873, -0.5201656, 0.08627451, 0, 1, 1,
0.4742658, 1.576539, 1.952161, 0.09019608, 0, 1, 1,
0.4755569, 1.817804, -0.2828173, 0.09803922, 0, 1, 1,
0.4760828, 1.538455, 2.504687, 0.1058824, 0, 1, 1,
0.4766842, 0.4368927, 2.49707, 0.1098039, 0, 1, 1,
0.4774939, -0.1153855, 0.75438, 0.1176471, 0, 1, 1,
0.4809691, 0.8864329, -1.301004, 0.1215686, 0, 1, 1,
0.481684, 0.6328719, 1.472439, 0.1294118, 0, 1, 1,
0.4835503, 0.4690234, 1.097838, 0.1333333, 0, 1, 1,
0.4847898, 0.8311722, 0.9985409, 0.1411765, 0, 1, 1,
0.4860296, -2.001684, 4.413158, 0.145098, 0, 1, 1,
0.4861529, -0.4460005, 3.272814, 0.1529412, 0, 1, 1,
0.4867069, 0.07648696, 1.028831, 0.1568628, 0, 1, 1,
0.4886245, -0.9487557, 2.708388, 0.1647059, 0, 1, 1,
0.4892753, -1.066727, 3.366837, 0.1686275, 0, 1, 1,
0.493694, -1.528573, 3.993168, 0.1764706, 0, 1, 1,
0.495422, 1.671154, 1.89326, 0.1803922, 0, 1, 1,
0.4970397, 1.045413, 1.985209, 0.1882353, 0, 1, 1,
0.5033844, 0.9082811, 0.4207208, 0.1921569, 0, 1, 1,
0.5099949, -2.236138, 4.790055, 0.2, 0, 1, 1,
0.5103195, -0.8578135, 2.561849, 0.2078431, 0, 1, 1,
0.5164375, -0.7508312, 2.546192, 0.2117647, 0, 1, 1,
0.5170472, 0.7846751, -0.4358854, 0.2196078, 0, 1, 1,
0.5202107, -0.976859, 1.749139, 0.2235294, 0, 1, 1,
0.5215714, 0.3610147, 1.671013, 0.2313726, 0, 1, 1,
0.52184, 1.201829, 0.9958727, 0.2352941, 0, 1, 1,
0.5260335, 0.5537826, -0.1207364, 0.2431373, 0, 1, 1,
0.5284594, 1.694575, 0.9699551, 0.2470588, 0, 1, 1,
0.5312026, -0.2669314, 0.8364922, 0.254902, 0, 1, 1,
0.5333198, -1.859561, 1.583152, 0.2588235, 0, 1, 1,
0.5333973, -1.269449, 2.95294, 0.2666667, 0, 1, 1,
0.5365679, 0.3385924, 2.658216, 0.2705882, 0, 1, 1,
0.5397663, 0.2889712, -0.06555463, 0.2784314, 0, 1, 1,
0.5399838, -0.63492, 2.866238, 0.282353, 0, 1, 1,
0.5402576, 0.2232821, 1.369442, 0.2901961, 0, 1, 1,
0.5455101, -1.306082, 2.501949, 0.2941177, 0, 1, 1,
0.5518321, -0.09541878, 0.6107703, 0.3019608, 0, 1, 1,
0.5522751, 1.689648, -0.4132843, 0.3098039, 0, 1, 1,
0.5525131, 0.811155, 0.8015776, 0.3137255, 0, 1, 1,
0.5547093, 0.3735903, -0.2597904, 0.3215686, 0, 1, 1,
0.5566809, 0.5559133, 2.929579, 0.3254902, 0, 1, 1,
0.5636801, -0.07336488, 0.8184514, 0.3333333, 0, 1, 1,
0.5661481, -1.435273, 1.676646, 0.3372549, 0, 1, 1,
0.5677278, 0.6570131, 0.3207479, 0.345098, 0, 1, 1,
0.5685636, 0.8189368, 1.229585, 0.3490196, 0, 1, 1,
0.5692976, 0.4628019, 1.057343, 0.3568628, 0, 1, 1,
0.5697455, 1.140847, 0.835355, 0.3607843, 0, 1, 1,
0.5744631, 0.7217453, 0.3568923, 0.3686275, 0, 1, 1,
0.5756754, -1.812316, 2.696904, 0.372549, 0, 1, 1,
0.5765188, 1.015123, 0.6920077, 0.3803922, 0, 1, 1,
0.5832708, 0.5619798, -0.3348127, 0.3843137, 0, 1, 1,
0.586394, 1.784602, -0.83408, 0.3921569, 0, 1, 1,
0.5881891, -2.110273, 2.351334, 0.3960784, 0, 1, 1,
0.5891182, 1.414018, 1.149227, 0.4039216, 0, 1, 1,
0.5893955, -0.5804893, 3.438049, 0.4117647, 0, 1, 1,
0.5967439, 1.460087, 0.74927, 0.4156863, 0, 1, 1,
0.5974506, -0.3303316, 0.7819556, 0.4235294, 0, 1, 1,
0.6127003, 0.5606109, 1.590813, 0.427451, 0, 1, 1,
0.6232432, -1.262501, 4.056488, 0.4352941, 0, 1, 1,
0.6247465, 0.8585627, 0.3779337, 0.4392157, 0, 1, 1,
0.6251816, -2.370613, 2.951396, 0.4470588, 0, 1, 1,
0.629484, -0.2049283, 3.17398, 0.4509804, 0, 1, 1,
0.6294934, -0.7877105, 3.171638, 0.4588235, 0, 1, 1,
0.6314564, -0.354874, 2.531085, 0.4627451, 0, 1, 1,
0.6339964, 0.3593839, 0.8225167, 0.4705882, 0, 1, 1,
0.6471351, -0.8903852, 1.940258, 0.4745098, 0, 1, 1,
0.6506377, -3.124961, 3.961245, 0.4823529, 0, 1, 1,
0.653888, -1.120531, 2.675989, 0.4862745, 0, 1, 1,
0.6558918, 0.02155384, 1.697525, 0.4941176, 0, 1, 1,
0.6589957, 0.500597, -0.6037236, 0.5019608, 0, 1, 1,
0.6592979, -0.00195566, 0.9774861, 0.5058824, 0, 1, 1,
0.6611972, 0.2640508, 0.7050822, 0.5137255, 0, 1, 1,
0.6616469, 0.9506919, -0.5613299, 0.5176471, 0, 1, 1,
0.6631165, -0.2953645, 1.022638, 0.5254902, 0, 1, 1,
0.6665273, 0.7860729, 0.1780632, 0.5294118, 0, 1, 1,
0.6665725, 0.7433302, 1.242664, 0.5372549, 0, 1, 1,
0.6693416, -0.9917647, 2.898014, 0.5411765, 0, 1, 1,
0.6743624, 0.1049813, 1.996341, 0.5490196, 0, 1, 1,
0.6804696, -0.6947117, 1.67545, 0.5529412, 0, 1, 1,
0.6829419, -0.7325238, 2.652745, 0.5607843, 0, 1, 1,
0.6832793, 0.6517587, 0.06148882, 0.5647059, 0, 1, 1,
0.6872587, 0.07857431, 2.059466, 0.572549, 0, 1, 1,
0.6892022, 2.35539, 2.083979, 0.5764706, 0, 1, 1,
0.6911013, 0.9848318, 0.02993414, 0.5843138, 0, 1, 1,
0.6958819, -1.076256, 3.469985, 0.5882353, 0, 1, 1,
0.7010564, 0.7484246, 0.5566605, 0.5960785, 0, 1, 1,
0.7011851, 0.2750458, 2.535035, 0.6039216, 0, 1, 1,
0.7042675, -0.4978947, 1.5013, 0.6078432, 0, 1, 1,
0.7076471, 0.1713566, 0.2119443, 0.6156863, 0, 1, 1,
0.7125008, 0.289456, 1.060681, 0.6196079, 0, 1, 1,
0.7125698, 0.1412255, 1.705002, 0.627451, 0, 1, 1,
0.7133334, 0.2806094, 0.01555629, 0.6313726, 0, 1, 1,
0.7210738, -1.283133, 3.686515, 0.6392157, 0, 1, 1,
0.7234373, 0.1279808, -0.4193517, 0.6431373, 0, 1, 1,
0.7240582, 0.552589, 2.540971, 0.6509804, 0, 1, 1,
0.7243163, -1.610246, 3.383017, 0.654902, 0, 1, 1,
0.724438, -1.248744, 2.830038, 0.6627451, 0, 1, 1,
0.7252508, -0.3773281, 2.463327, 0.6666667, 0, 1, 1,
0.7287307, 0.3068695, 0.3921582, 0.6745098, 0, 1, 1,
0.7360709, 0.1927872, 1.634256, 0.6784314, 0, 1, 1,
0.7387155, 0.2911586, 1.466778, 0.6862745, 0, 1, 1,
0.7454741, 1.368044, -0.1476556, 0.6901961, 0, 1, 1,
0.7593213, 1.063334, 1.340115, 0.6980392, 0, 1, 1,
0.7616581, -0.04078007, 1.940185, 0.7058824, 0, 1, 1,
0.7729018, -0.2891208, 2.013549, 0.7098039, 0, 1, 1,
0.7825643, 1.347052, -0.1050956, 0.7176471, 0, 1, 1,
0.7829214, 0.8606222, 0.8265532, 0.7215686, 0, 1, 1,
0.7972807, -1.276631, 3.111996, 0.7294118, 0, 1, 1,
0.7983464, 0.5939977, 1.047062, 0.7333333, 0, 1, 1,
0.7985536, 0.5706863, 2.879377, 0.7411765, 0, 1, 1,
0.8074211, 0.07154943, 0.9375077, 0.7450981, 0, 1, 1,
0.8112431, 0.06894208, 1.08655, 0.7529412, 0, 1, 1,
0.8237145, 0.04470031, 1.494589, 0.7568628, 0, 1, 1,
0.8242568, -2.945233, 2.163013, 0.7647059, 0, 1, 1,
0.8244638, -1.835065, 2.401528, 0.7686275, 0, 1, 1,
0.8322117, -0.3658331, 1.221932, 0.7764706, 0, 1, 1,
0.8352138, 0.9264055, 2.089108, 0.7803922, 0, 1, 1,
0.8488272, 0.3463386, 1.25125, 0.7882353, 0, 1, 1,
0.84982, -0.6559667, 3.584806, 0.7921569, 0, 1, 1,
0.8529987, -0.2856426, 3.479221, 0.8, 0, 1, 1,
0.8545699, -0.6815435, 1.021937, 0.8078431, 0, 1, 1,
0.8584422, 0.07675956, 2.017116, 0.8117647, 0, 1, 1,
0.8621262, 0.9262185, 1.883928, 0.8196079, 0, 1, 1,
0.8638869, 0.2898141, 1.693871, 0.8235294, 0, 1, 1,
0.8759784, 1.174194, 0.3678001, 0.8313726, 0, 1, 1,
0.8775006, 0.583357, 1.942076, 0.8352941, 0, 1, 1,
0.8781, 0.8703645, 0.0814933, 0.8431373, 0, 1, 1,
0.8794283, -1.138983, 2.919025, 0.8470588, 0, 1, 1,
0.8863957, -1.429036, 1.961501, 0.854902, 0, 1, 1,
0.8878033, 0.8430053, 0.5079136, 0.8588235, 0, 1, 1,
0.895804, 0.6943415, 1.224188, 0.8666667, 0, 1, 1,
0.9004425, -0.5863135, 1.292848, 0.8705882, 0, 1, 1,
0.9052516, -0.8541828, 1.331429, 0.8784314, 0, 1, 1,
0.909017, 0.3815576, 0.9478517, 0.8823529, 0, 1, 1,
0.9137706, 0.6997361, 0.8389487, 0.8901961, 0, 1, 1,
0.9218656, -1.07841, 1.214235, 0.8941177, 0, 1, 1,
0.9310609, -0.09094711, 1.394874, 0.9019608, 0, 1, 1,
0.9332835, 1.395776, 2.201112, 0.9098039, 0, 1, 1,
0.9342002, -1.087412, 2.283903, 0.9137255, 0, 1, 1,
0.936418, -0.8067762, 0.05157282, 0.9215686, 0, 1, 1,
0.9407659, -0.5730554, 0.2406882, 0.9254902, 0, 1, 1,
0.9458799, -0.7649764, 2.929703, 0.9333333, 0, 1, 1,
0.9462342, 1.669057, 1.198819, 0.9372549, 0, 1, 1,
0.9498512, 0.60537, 0.7417169, 0.945098, 0, 1, 1,
0.9535235, -0.4967759, 1.302021, 0.9490196, 0, 1, 1,
0.9578849, -0.9652017, 3.664686, 0.9568627, 0, 1, 1,
0.958258, 0.304628, 2.189752, 0.9607843, 0, 1, 1,
0.9584885, 0.9452026, 2.23829, 0.9686275, 0, 1, 1,
0.9699252, -2.711738, 2.971898, 0.972549, 0, 1, 1,
0.9699748, -0.2871534, 2.250984, 0.9803922, 0, 1, 1,
0.9719923, 0.4808344, 1.388713, 0.9843137, 0, 1, 1,
0.9741845, 0.5756748, 1.339355, 0.9921569, 0, 1, 1,
0.9792437, 0.7122197, 1.637961, 0.9960784, 0, 1, 1,
0.9798104, -0.295698, 1.128168, 1, 0, 0.9960784, 1,
0.9912188, 0.3257668, 2.172028, 1, 0, 0.9882353, 1,
0.9960869, -0.1902771, 2.149451, 1, 0, 0.9843137, 1,
0.9995331, -0.5996695, 3.194535, 1, 0, 0.9764706, 1,
1.004752, 0.8624124, 0.4592919, 1, 0, 0.972549, 1,
1.010687, 0.1390589, -0.001967272, 1, 0, 0.9647059, 1,
1.011317, 0.9666746, -1.815452, 1, 0, 0.9607843, 1,
1.018579, -0.7506133, 0.6037921, 1, 0, 0.9529412, 1,
1.019233, -1.610314, 1.331675, 1, 0, 0.9490196, 1,
1.022485, -0.7310119, 2.034543, 1, 0, 0.9411765, 1,
1.025948, 0.7313381, 1.592444, 1, 0, 0.9372549, 1,
1.027859, 1.337173, 1.206166, 1, 0, 0.9294118, 1,
1.029716, 0.07769033, 2.28748, 1, 0, 0.9254902, 1,
1.041404, -0.5984486, 3.308542, 1, 0, 0.9176471, 1,
1.041543, 0.4662853, 0.1349016, 1, 0, 0.9137255, 1,
1.042388, 0.09435319, -0.5540617, 1, 0, 0.9058824, 1,
1.053313, 0.4750556, -0.1469644, 1, 0, 0.9019608, 1,
1.059907, 0.272644, 1.078532, 1, 0, 0.8941177, 1,
1.062635, 0.1494474, -0.1838846, 1, 0, 0.8862745, 1,
1.064574, -0.2385022, 1.937211, 1, 0, 0.8823529, 1,
1.073129, 0.8165888, 0.820715, 1, 0, 0.8745098, 1,
1.07642, -0.7302992, 3.244292, 1, 0, 0.8705882, 1,
1.088863, 0.04319197, 0.7180587, 1, 0, 0.8627451, 1,
1.097483, 1.415231, 0.284923, 1, 0, 0.8588235, 1,
1.098474, 0.4297071, 0.911307, 1, 0, 0.8509804, 1,
1.103466, -0.1097621, 1.611778, 1, 0, 0.8470588, 1,
1.11354, 0.902588, 1.021768, 1, 0, 0.8392157, 1,
1.116459, 1.49596, -0.5805071, 1, 0, 0.8352941, 1,
1.117477, -1.149143, 1.395162, 1, 0, 0.827451, 1,
1.117592, -0.2935555, -0.09376113, 1, 0, 0.8235294, 1,
1.121235, -0.9405996, 1.387546, 1, 0, 0.8156863, 1,
1.122381, 1.645959, 2.152928, 1, 0, 0.8117647, 1,
1.124648, -0.3229369, 1.928718, 1, 0, 0.8039216, 1,
1.125154, 0.5215297, 0.9805093, 1, 0, 0.7960784, 1,
1.133452, 0.1740066, 0.7602748, 1, 0, 0.7921569, 1,
1.134204, -1.824782, 3.036328, 1, 0, 0.7843137, 1,
1.136602, -0.6179165, 0.8317267, 1, 0, 0.7803922, 1,
1.142468, 0.6295713, 0.6650981, 1, 0, 0.772549, 1,
1.145524, 0.2092477, 0.989266, 1, 0, 0.7686275, 1,
1.151792, -1.643474, 2.699266, 1, 0, 0.7607843, 1,
1.154246, 0.3285279, -0.3714482, 1, 0, 0.7568628, 1,
1.163666, 1.454067, 2.611173, 1, 0, 0.7490196, 1,
1.166838, 0.4588727, 1.997741, 1, 0, 0.7450981, 1,
1.179013, -0.1155012, 2.226561, 1, 0, 0.7372549, 1,
1.180017, -0.6125689, 0.3562851, 1, 0, 0.7333333, 1,
1.180847, 0.6541209, 0.6795869, 1, 0, 0.7254902, 1,
1.201715, -0.2297797, 0.8009389, 1, 0, 0.7215686, 1,
1.201948, -0.1233999, 2.757247, 1, 0, 0.7137255, 1,
1.204174, -0.9818383, 2.634264, 1, 0, 0.7098039, 1,
1.204602, -0.3981261, 1.50868, 1, 0, 0.7019608, 1,
1.205491, 0.7576132, 3.234804, 1, 0, 0.6941177, 1,
1.207064, 1.432288, -1.677986, 1, 0, 0.6901961, 1,
1.209117, 0.892752, 1.848525, 1, 0, 0.682353, 1,
1.212148, -0.322589, 1.206949, 1, 0, 0.6784314, 1,
1.223909, 0.1713682, 1.200285, 1, 0, 0.6705883, 1,
1.231357, 0.184326, 1.184669, 1, 0, 0.6666667, 1,
1.244685, -0.3093614, 1.748125, 1, 0, 0.6588235, 1,
1.24967, 1.247007, 1.668329, 1, 0, 0.654902, 1,
1.250211, 2.175198, 1.408861, 1, 0, 0.6470588, 1,
1.251147, -0.3561202, 1.920816, 1, 0, 0.6431373, 1,
1.252242, 0.6379217, 1.589645, 1, 0, 0.6352941, 1,
1.253924, -0.3089265, 2.037001, 1, 0, 0.6313726, 1,
1.260039, -0.730356, 1.154862, 1, 0, 0.6235294, 1,
1.264288, -0.1668225, 0.6399365, 1, 0, 0.6196079, 1,
1.268294, 0.8363987, -1.044303, 1, 0, 0.6117647, 1,
1.26996, -0.1687292, 3.305244, 1, 0, 0.6078432, 1,
1.274443, 0.4883668, 1.621848, 1, 0, 0.6, 1,
1.28485, 0.1394129, 1.612761, 1, 0, 0.5921569, 1,
1.288187, -0.4016327, 1.225384, 1, 0, 0.5882353, 1,
1.290753, -0.1497942, 2.245201, 1, 0, 0.5803922, 1,
1.294092, 0.7727585, -1.087988, 1, 0, 0.5764706, 1,
1.296732, 0.841087, 1.752644, 1, 0, 0.5686275, 1,
1.307245, 0.5925541, 1.307626, 1, 0, 0.5647059, 1,
1.311125, -0.7478905, 0.6779251, 1, 0, 0.5568628, 1,
1.340749, -1.340345, 2.643556, 1, 0, 0.5529412, 1,
1.347411, 0.8016472, 1.838465, 1, 0, 0.5450981, 1,
1.349172, 0.06216022, 2.633006, 1, 0, 0.5411765, 1,
1.358887, -1.60221, 2.538631, 1, 0, 0.5333334, 1,
1.361671, -0.2022167, 1.77389, 1, 0, 0.5294118, 1,
1.366458, 1.679243, 0.8994412, 1, 0, 0.5215687, 1,
1.387033, -0.810547, 2.966938, 1, 0, 0.5176471, 1,
1.387126, 1.460214, 0.627088, 1, 0, 0.509804, 1,
1.399656, -1.713153, 2.764166, 1, 0, 0.5058824, 1,
1.402228, -1.070444, 2.597183, 1, 0, 0.4980392, 1,
1.406958, -0.3214549, 0.893863, 1, 0, 0.4901961, 1,
1.409292, 1.756436, 0.2924387, 1, 0, 0.4862745, 1,
1.410071, 0.4013605, 0.345904, 1, 0, 0.4784314, 1,
1.418805, -0.7750523, 0.5128552, 1, 0, 0.4745098, 1,
1.431172, -0.1313744, 0.6346276, 1, 0, 0.4666667, 1,
1.45043, -0.4594197, 1.684507, 1, 0, 0.4627451, 1,
1.455886, 0.1020735, -0.5086775, 1, 0, 0.454902, 1,
1.457055, -2.620162, 4.453971, 1, 0, 0.4509804, 1,
1.469526, 1.64595, 0.7237117, 1, 0, 0.4431373, 1,
1.470152, 0.4840558, 2.329275, 1, 0, 0.4392157, 1,
1.477363, 0.4364949, 0.690249, 1, 0, 0.4313726, 1,
1.491566, 0.7164254, 1.809986, 1, 0, 0.427451, 1,
1.491648, 1.0329, 2.418395, 1, 0, 0.4196078, 1,
1.493104, -0.395552, 2.62687, 1, 0, 0.4156863, 1,
1.493463, 1.651779, 0.9692058, 1, 0, 0.4078431, 1,
1.49947, 0.1295811, 1.677717, 1, 0, 0.4039216, 1,
1.50443, -0.9329072, 2.977065, 1, 0, 0.3960784, 1,
1.509561, -0.7541846, 2.714127, 1, 0, 0.3882353, 1,
1.5287, -1.539433, 4.792964, 1, 0, 0.3843137, 1,
1.541358, -0.9009651, 1.862074, 1, 0, 0.3764706, 1,
1.550197, -1.5129, 2.296143, 1, 0, 0.372549, 1,
1.557415, 0.853224, 1.502979, 1, 0, 0.3647059, 1,
1.558144, -1.211386, 2.055187, 1, 0, 0.3607843, 1,
1.558703, 1.263594, 1.555111, 1, 0, 0.3529412, 1,
1.568635, -0.4517119, 1.402015, 1, 0, 0.3490196, 1,
1.56979, 0.7787059, 0.6126931, 1, 0, 0.3411765, 1,
1.582313, -0.6671645, 0.8918791, 1, 0, 0.3372549, 1,
1.590308, 1.024824, -0.7344112, 1, 0, 0.3294118, 1,
1.592821, -0.5185387, 2.291974, 1, 0, 0.3254902, 1,
1.596183, -0.983331, 1.366912, 1, 0, 0.3176471, 1,
1.598322, 1.358572, 2.285292, 1, 0, 0.3137255, 1,
1.603413, -1.831851, 1.26705, 1, 0, 0.3058824, 1,
1.63483, -0.5049972, 2.431421, 1, 0, 0.2980392, 1,
1.636637, 1.298162, 2.557184, 1, 0, 0.2941177, 1,
1.647971, 0.7544388, 0.308231, 1, 0, 0.2862745, 1,
1.654268, 1.888032, 0.7254613, 1, 0, 0.282353, 1,
1.658729, 0.4085742, 1.55364, 1, 0, 0.2745098, 1,
1.659891, 0.3897527, 3.799959, 1, 0, 0.2705882, 1,
1.675834, -0.01861558, 0.4685459, 1, 0, 0.2627451, 1,
1.676142, 1.294457, 0.08935861, 1, 0, 0.2588235, 1,
1.695177, -0.7141127, 2.723408, 1, 0, 0.2509804, 1,
1.701859, -0.1040566, 2.206806, 1, 0, 0.2470588, 1,
1.705488, 0.6713659, 1.38586, 1, 0, 0.2392157, 1,
1.705882, 0.03877508, 1.5149, 1, 0, 0.2352941, 1,
1.722302, -1.48842, 0.9184681, 1, 0, 0.227451, 1,
1.738552, -0.15657, -0.4698122, 1, 0, 0.2235294, 1,
1.740657, -0.2771256, 1.507863, 1, 0, 0.2156863, 1,
1.742738, -0.4282729, 1.695338, 1, 0, 0.2117647, 1,
1.744043, -1.738629, 3.159703, 1, 0, 0.2039216, 1,
1.74594, -1.82869, 3.068595, 1, 0, 0.1960784, 1,
1.748535, -1.338626, 2.940024, 1, 0, 0.1921569, 1,
1.750077, -1.078665, 2.46719, 1, 0, 0.1843137, 1,
1.751559, 2.743278, 0.1815726, 1, 0, 0.1803922, 1,
1.754909, 2.044525, 1.359488, 1, 0, 0.172549, 1,
1.781397, -0.4590085, 3.063325, 1, 0, 0.1686275, 1,
1.801559, 1.002643, 0.8460423, 1, 0, 0.1607843, 1,
1.806407, 0.7578628, 1.287897, 1, 0, 0.1568628, 1,
1.812495, -1.523866, 1.040894, 1, 0, 0.1490196, 1,
1.822099, 0.09032572, 1.596984, 1, 0, 0.145098, 1,
1.827514, -0.06742036, 1.16456, 1, 0, 0.1372549, 1,
1.837815, 0.3092816, -1.365939, 1, 0, 0.1333333, 1,
1.89426, 1.663967, 2.086423, 1, 0, 0.1254902, 1,
1.921495, -1.423396, 2.063722, 1, 0, 0.1215686, 1,
1.98007, 0.3947537, 1.58926, 1, 0, 0.1137255, 1,
2.018024, -1.486454, 1.859525, 1, 0, 0.1098039, 1,
2.030751, -0.382605, 1.688458, 1, 0, 0.1019608, 1,
2.077888, -0.4834894, 1.924632, 1, 0, 0.09411765, 1,
2.084262, -0.9507566, 0.1562524, 1, 0, 0.09019608, 1,
2.133464, 0.5905657, 1.222086, 1, 0, 0.08235294, 1,
2.205841, 0.09727556, 1.354143, 1, 0, 0.07843138, 1,
2.241055, -0.4971973, 1.345562, 1, 0, 0.07058824, 1,
2.246419, -1.560062, 1.021537, 1, 0, 0.06666667, 1,
2.303831, 1.497064, 2.144132, 1, 0, 0.05882353, 1,
2.335037, -1.09883, 3.076331, 1, 0, 0.05490196, 1,
2.33684, 0.340537, 0.6023469, 1, 0, 0.04705882, 1,
2.396693, 0.3312919, 0.5074764, 1, 0, 0.04313726, 1,
2.423132, -0.650544, 1.98562, 1, 0, 0.03529412, 1,
2.429708, -0.4730968, 1.841718, 1, 0, 0.03137255, 1,
2.431633, -1.424359, 3.10473, 1, 0, 0.02352941, 1,
2.606589, 0.126661, -0.09725179, 1, 0, 0.01960784, 1,
3.060735, 0.01706431, 3.170498, 1, 0, 0.01176471, 1,
3.414135, 0.1413668, 1.738026, 1, 0, 0.007843138, 1
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
-0.06835091, -4.179925, -8.82662, 0, -0.5, 0.5, 0.5,
-0.06835091, -4.179925, -8.82662, 1, -0.5, 0.5, 0.5,
-0.06835091, -4.179925, -8.82662, 1, 1.5, 0.5, 0.5,
-0.06835091, -4.179925, -8.82662, 0, 1.5, 0.5, 0.5
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
-4.7314, -0.01297045, -8.82662, 0, -0.5, 0.5, 0.5,
-4.7314, -0.01297045, -8.82662, 1, -0.5, 0.5, 0.5,
-4.7314, -0.01297045, -8.82662, 1, 1.5, 0.5, 0.5,
-4.7314, -0.01297045, -8.82662, 0, 1.5, 0.5, 0.5
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
-4.7314, -4.179925, -0.01329279, 0, -0.5, 0.5, 0.5,
-4.7314, -4.179925, -0.01329279, 1, -0.5, 0.5, 0.5,
-4.7314, -4.179925, -0.01329279, 1, 1.5, 0.5, 0.5,
-4.7314, -4.179925, -0.01329279, 0, 1.5, 0.5, 0.5
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
-3, -3.218321, -6.792775,
3, -3.218321, -6.792775,
-3, -3.218321, -6.792775,
-3, -3.378588, -7.131749,
-2, -3.218321, -6.792775,
-2, -3.378588, -7.131749,
-1, -3.218321, -6.792775,
-1, -3.378588, -7.131749,
0, -3.218321, -6.792775,
0, -3.378588, -7.131749,
1, -3.218321, -6.792775,
1, -3.378588, -7.131749,
2, -3.218321, -6.792775,
2, -3.378588, -7.131749,
3, -3.218321, -6.792775,
3, -3.378588, -7.131749
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
-3, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
-3, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
-3, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
-3, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5,
-2, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
-2, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
-2, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
-2, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5,
-1, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
-1, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
-1, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
-1, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5,
0, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
0, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
0, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
0, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5,
1, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
1, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
1, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
1, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5,
2, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
2, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
2, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
2, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5,
3, -3.699123, -7.809698, 0, -0.5, 0.5, 0.5,
3, -3.699123, -7.809698, 1, -0.5, 0.5, 0.5,
3, -3.699123, -7.809698, 1, 1.5, 0.5, 0.5,
3, -3.699123, -7.809698, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.655312, -3, -6.792775,
-3.655312, 3, -6.792775,
-3.655312, -3, -6.792775,
-3.83466, -3, -7.131749,
-3.655312, -2, -6.792775,
-3.83466, -2, -7.131749,
-3.655312, -1, -6.792775,
-3.83466, -1, -7.131749,
-3.655312, 0, -6.792775,
-3.83466, 0, -7.131749,
-3.655312, 1, -6.792775,
-3.83466, 1, -7.131749,
-3.655312, 2, -6.792775,
-3.83466, 2, -7.131749,
-3.655312, 3, -6.792775,
-3.83466, 3, -7.131749
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
"-3",
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
-4.193356, -3, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, -3, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, -3, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, -3, -7.809698, 0, 1.5, 0.5, 0.5,
-4.193356, -2, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, -2, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, -2, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, -2, -7.809698, 0, 1.5, 0.5, 0.5,
-4.193356, -1, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, -1, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, -1, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, -1, -7.809698, 0, 1.5, 0.5, 0.5,
-4.193356, 0, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, 0, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, 0, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, 0, -7.809698, 0, 1.5, 0.5, 0.5,
-4.193356, 1, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, 1, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, 1, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, 1, -7.809698, 0, 1.5, 0.5, 0.5,
-4.193356, 2, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, 2, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, 2, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, 2, -7.809698, 0, 1.5, 0.5, 0.5,
-4.193356, 3, -7.809698, 0, -0.5, 0.5, 0.5,
-4.193356, 3, -7.809698, 1, -0.5, 0.5, 0.5,
-4.193356, 3, -7.809698, 1, 1.5, 0.5, 0.5,
-4.193356, 3, -7.809698, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.655312, -3.218321, -6,
-3.655312, -3.218321, 6,
-3.655312, -3.218321, -6,
-3.83466, -3.378588, -6,
-3.655312, -3.218321, -4,
-3.83466, -3.378588, -4,
-3.655312, -3.218321, -2,
-3.83466, -3.378588, -2,
-3.655312, -3.218321, 0,
-3.83466, -3.378588, 0,
-3.655312, -3.218321, 2,
-3.83466, -3.378588, 2,
-3.655312, -3.218321, 4,
-3.83466, -3.378588, 4,
-3.655312, -3.218321, 6,
-3.83466, -3.378588, 6
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
"-6",
"-4",
"-2",
"0",
"2",
"4",
"6"
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
-4.193356, -3.699123, -6, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, -6, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, -6, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, -6, 0, 1.5, 0.5, 0.5,
-4.193356, -3.699123, -4, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, -4, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, -4, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, -4, 0, 1.5, 0.5, 0.5,
-4.193356, -3.699123, -2, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, -2, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, -2, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, -2, 0, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 0, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 0, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 0, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 0, 0, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 2, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 2, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 2, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 2, 0, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 4, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 4, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 4, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 4, 0, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 6, 0, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 6, 1, -0.5, 0.5, 0.5,
-4.193356, -3.699123, 6, 1, 1.5, 0.5, 0.5,
-4.193356, -3.699123, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.655312, -3.218321, -6.792775,
-3.655312, 3.19238, -6.792775,
-3.655312, -3.218321, 6.76619,
-3.655312, 3.19238, 6.76619,
-3.655312, -3.218321, -6.792775,
-3.655312, -3.218321, 6.76619,
-3.655312, 3.19238, -6.792775,
-3.655312, 3.19238, 6.76619,
-3.655312, -3.218321, -6.792775,
3.51861, -3.218321, -6.792775,
-3.655312, -3.218321, 6.76619,
3.51861, -3.218321, 6.76619,
-3.655312, 3.19238, -6.792775,
3.51861, 3.19238, -6.792775,
-3.655312, 3.19238, 6.76619,
3.51861, 3.19238, 6.76619,
3.51861, -3.218321, -6.792775,
3.51861, 3.19238, -6.792775,
3.51861, -3.218321, 6.76619,
3.51861, 3.19238, 6.76619,
3.51861, -3.218321, -6.792775,
3.51861, -3.218321, 6.76619,
3.51861, 3.19238, -6.792775,
3.51861, 3.19238, 6.76619
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
var radius = 8.877702;
var distance = 39.4979;
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
mvMatrix.translate( 0.06835091, 0.01297045, 0.01329279 );
mvMatrix.scale( 1.338005, 1.497301, 0.7079262 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.4979);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Milcurb<-read.table("Milcurb.xyz")
```

```
## Error in read.table("Milcurb.xyz"): no lines available in input
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
-3.550837, 1.317038, -1.19455, 0, 0, 1, 1, 1,
-3.539493, 0.9254894, -2.634559, 1, 0, 0, 1, 1,
-3.365387, 2.059153, -1.413374, 1, 0, 0, 1, 1,
-2.809195, 0.6096026, -3.037619, 1, 0, 0, 1, 1,
-2.808399, -0.2365613, -2.728262, 1, 0, 0, 1, 1,
-2.647311, 0.00454034, -1.395154, 1, 0, 0, 1, 1,
-2.59557, -0.01200147, -1.856926, 0, 0, 0, 1, 1,
-2.380619, -1.027743, -1.39895, 0, 0, 0, 1, 1,
-2.36875, -0.2985923, 0.01069934, 0, 0, 0, 1, 1,
-2.356661, 0.7861995, 0.5739696, 0, 0, 0, 1, 1,
-2.29694, -1.633334, -1.850521, 0, 0, 0, 1, 1,
-2.289927, 0.7664384, -1.66872, 0, 0, 0, 1, 1,
-2.254984, -0.3740223, -3.171465, 0, 0, 0, 1, 1,
-2.230066, -0.6355169, -3.308091, 1, 1, 1, 1, 1,
-2.21931, -1.611705, -3.358122, 1, 1, 1, 1, 1,
-2.179558, 1.423584, 0.1815748, 1, 1, 1, 1, 1,
-2.174882, 0.1544281, -2.62955, 1, 1, 1, 1, 1,
-2.153595, -1.231065, -2.675675, 1, 1, 1, 1, 1,
-2.133829, -0.6848415, -1.156881, 1, 1, 1, 1, 1,
-2.102109, 0.5120857, -1.589427, 1, 1, 1, 1, 1,
-2.081048, 1.517504, -1.366896, 1, 1, 1, 1, 1,
-2.07894, -0.321291, -0.6081869, 1, 1, 1, 1, 1,
-2.066552, 0.7993404, -1.470188, 1, 1, 1, 1, 1,
-2.064185, -0.9293495, -1.301655, 1, 1, 1, 1, 1,
-2.057805, -2.127479, -2.859721, 1, 1, 1, 1, 1,
-2.035285, 0.06882641, -1.345301, 1, 1, 1, 1, 1,
-2.0289, -0.6865678, -3.161583, 1, 1, 1, 1, 1,
-1.999417, 0.2104556, -0.2926962, 1, 1, 1, 1, 1,
-1.967703, 0.5295539, -1.350193, 0, 0, 1, 1, 1,
-1.957477, 1.356603, 0.4945966, 1, 0, 0, 1, 1,
-1.937966, -1.394097, -2.216572, 1, 0, 0, 1, 1,
-1.934379, 0.9810925, -0.2234193, 1, 0, 0, 1, 1,
-1.928922, 0.6188384, -1.265059, 1, 0, 0, 1, 1,
-1.921456, 0.6056699, -0.7599211, 1, 0, 0, 1, 1,
-1.86254, 0.08406869, -2.131207, 0, 0, 0, 1, 1,
-1.851859, -1.035275, -2.697711, 0, 0, 0, 1, 1,
-1.830104, 0.6504182, -0.9474355, 0, 0, 0, 1, 1,
-1.822829, 0.2776829, -2.474124, 0, 0, 0, 1, 1,
-1.821696, -0.02398419, -1.988894, 0, 0, 0, 1, 1,
-1.821568, -0.9830502, -1.41144, 0, 0, 0, 1, 1,
-1.808965, -0.0264102, -0.5853351, 0, 0, 0, 1, 1,
-1.805232, 0.08878597, -2.061195, 1, 1, 1, 1, 1,
-1.803202, -1.390972, -3.398068, 1, 1, 1, 1, 1,
-1.801631, -0.2188735, -4.63243, 1, 1, 1, 1, 1,
-1.793814, -0.7931412, -0.8526644, 1, 1, 1, 1, 1,
-1.778233, 0.75611, -3.338697, 1, 1, 1, 1, 1,
-1.775614, 0.7299078, -1.275664, 1, 1, 1, 1, 1,
-1.774127, -0.6589292, -0.7901905, 1, 1, 1, 1, 1,
-1.74366, -0.4407091, -2.719663, 1, 1, 1, 1, 1,
-1.733683, -1.973105, -1.454307, 1, 1, 1, 1, 1,
-1.721809, 0.18985, -0.8454005, 1, 1, 1, 1, 1,
-1.717548, -0.3361158, -2.068907, 1, 1, 1, 1, 1,
-1.699448, -1.310615, -1.282726, 1, 1, 1, 1, 1,
-1.679059, -1.066908, -2.912553, 1, 1, 1, 1, 1,
-1.677188, -2.675783, -2.736777, 1, 1, 1, 1, 1,
-1.675292, 0.2428026, -1.382494, 1, 1, 1, 1, 1,
-1.657874, 0.1015312, -0.2765634, 0, 0, 1, 1, 1,
-1.65749, 0.5680013, -2.638294, 1, 0, 0, 1, 1,
-1.650909, -0.5709839, -1.472477, 1, 0, 0, 1, 1,
-1.649332, 0.8514468, -1.981469, 1, 0, 0, 1, 1,
-1.628616, 1.816647, 0.5557474, 1, 0, 0, 1, 1,
-1.626376, 0.38566, -1.433994, 1, 0, 0, 1, 1,
-1.618905, 0.7689113, 0.1414453, 0, 0, 0, 1, 1,
-1.60346, -0.3356008, -3.487977, 0, 0, 0, 1, 1,
-1.598398, 1.428132, -1.098067, 0, 0, 0, 1, 1,
-1.594242, 0.7233425, 0.1103461, 0, 0, 0, 1, 1,
-1.58888, 1.364331, -2.258242, 0, 0, 0, 1, 1,
-1.583173, 1.161282, 0.3271953, 0, 0, 0, 1, 1,
-1.565529, -0.1136661, -1.123482, 0, 0, 0, 1, 1,
-1.561373, -0.5001165, -0.1063888, 1, 1, 1, 1, 1,
-1.551207, 0.4020558, -0.6425034, 1, 1, 1, 1, 1,
-1.533997, -0.1336843, 0.3215873, 1, 1, 1, 1, 1,
-1.533283, -1.229806, -1.72909, 1, 1, 1, 1, 1,
-1.525701, -1.489682, -1.318719, 1, 1, 1, 1, 1,
-1.522853, -0.796152, -3.846771, 1, 1, 1, 1, 1,
-1.517851, 0.1942964, -0.4475168, 1, 1, 1, 1, 1,
-1.514086, 0.7435239, -0.5937157, 1, 1, 1, 1, 1,
-1.512645, -0.01851055, -1.623023, 1, 1, 1, 1, 1,
-1.508937, -0.08007782, -1.535559, 1, 1, 1, 1, 1,
-1.508472, -0.9110056, -2.835314, 1, 1, 1, 1, 1,
-1.48125, -0.3234492, -2.811068, 1, 1, 1, 1, 1,
-1.478045, 1.684686, -0.3344757, 1, 1, 1, 1, 1,
-1.471289, -0.4260752, -2.54242, 1, 1, 1, 1, 1,
-1.470587, 1.083898, -1.838472, 1, 1, 1, 1, 1,
-1.462728, -1.912356, -3.246608, 0, 0, 1, 1, 1,
-1.456538, 0.6759272, -1.480879, 1, 0, 0, 1, 1,
-1.45595, -0.3811601, -2.107549, 1, 0, 0, 1, 1,
-1.450622, -0.6448056, -1.693556, 1, 0, 0, 1, 1,
-1.449909, -0.6046729, -0.4342792, 1, 0, 0, 1, 1,
-1.437093, 0.5600861, -2.642846, 1, 0, 0, 1, 1,
-1.429136, 0.5711997, -2.12127, 0, 0, 0, 1, 1,
-1.414907, 0.9424989, -0.4104698, 0, 0, 0, 1, 1,
-1.412185, 0.322667, -1.857622, 0, 0, 0, 1, 1,
-1.404603, -0.3873848, -2.433564, 0, 0, 0, 1, 1,
-1.40176, -0.5641677, -1.819358, 0, 0, 0, 1, 1,
-1.400687, 3.09902, -0.8617388, 0, 0, 0, 1, 1,
-1.399577, 0.3250144, 0.400727, 0, 0, 0, 1, 1,
-1.398391, -0.5299438, -2.316269, 1, 1, 1, 1, 1,
-1.394933, 2.080585, -0.2597929, 1, 1, 1, 1, 1,
-1.384085, -0.05212928, -1.509613, 1, 1, 1, 1, 1,
-1.37919, -1.800531, -3.277309, 1, 1, 1, 1, 1,
-1.369636, -0.4393071, -2.697186, 1, 1, 1, 1, 1,
-1.366484, 1.6048, -1.837236, 1, 1, 1, 1, 1,
-1.36307, -0.7408045, -0.7190066, 1, 1, 1, 1, 1,
-1.35986, -0.2319179, -1.036229, 1, 1, 1, 1, 1,
-1.356547, 0.6549438, -1.131099, 1, 1, 1, 1, 1,
-1.342479, 0.08870888, 0.1156146, 1, 1, 1, 1, 1,
-1.32929, 0.2032893, -2.309238, 1, 1, 1, 1, 1,
-1.328896, 0.8222064, -1.850374, 1, 1, 1, 1, 1,
-1.32251, 0.2725177, -0.885139, 1, 1, 1, 1, 1,
-1.314656, -0.9793407, -2.189715, 1, 1, 1, 1, 1,
-1.313946, -0.4732738, -0.8609613, 1, 1, 1, 1, 1,
-1.312218, -1.032339, -2.101032, 0, 0, 1, 1, 1,
-1.311673, -0.02809163, -2.014829, 1, 0, 0, 1, 1,
-1.307917, 0.5001405, -0.9404541, 1, 0, 0, 1, 1,
-1.300543, 0.1493705, -1.599534, 1, 0, 0, 1, 1,
-1.293942, 0.2170718, -0.3172373, 1, 0, 0, 1, 1,
-1.29354, -0.6253986, -2.41082, 1, 0, 0, 1, 1,
-1.292187, 0.2814655, -1.786703, 0, 0, 0, 1, 1,
-1.289906, 0.2126358, -2.68082, 0, 0, 0, 1, 1,
-1.289728, 0.3784357, -0.9927478, 0, 0, 0, 1, 1,
-1.284937, -0.8634396, -2.391697, 0, 0, 0, 1, 1,
-1.27817, 1.476012, -0.1088661, 0, 0, 0, 1, 1,
-1.275284, 0.8452982, -0.9964709, 0, 0, 0, 1, 1,
-1.274144, 1.143738, -0.2822955, 0, 0, 0, 1, 1,
-1.273009, -0.5982772, -3.048157, 1, 1, 1, 1, 1,
-1.269839, -0.04405034, -0.05161838, 1, 1, 1, 1, 1,
-1.265134, 0.1876398, -1.255265, 1, 1, 1, 1, 1,
-1.262829, -2.170383, -1.7003, 1, 1, 1, 1, 1,
-1.23884, -1.249618, -3.744961, 1, 1, 1, 1, 1,
-1.237279, -0.560361, -1.133929, 1, 1, 1, 1, 1,
-1.232908, -0.5535713, -0.1342683, 1, 1, 1, 1, 1,
-1.23193, -1.071226, -1.647189, 1, 1, 1, 1, 1,
-1.23177, -0.7844347, -3.553643, 1, 1, 1, 1, 1,
-1.216869, 0.07577787, -2.990625, 1, 1, 1, 1, 1,
-1.21479, -1.780171, -1.738995, 1, 1, 1, 1, 1,
-1.213358, 0.7110733, -0.6194015, 1, 1, 1, 1, 1,
-1.20849, -0.5029588, -1.565688, 1, 1, 1, 1, 1,
-1.200264, -0.9291935, -1.162163, 1, 1, 1, 1, 1,
-1.193709, 1.649482, 0.5276287, 1, 1, 1, 1, 1,
-1.174381, 0.1337909, -0.121572, 0, 0, 1, 1, 1,
-1.160091, 0.06462119, -3.403256, 1, 0, 0, 1, 1,
-1.14937, 0.8748856, -1.718996, 1, 0, 0, 1, 1,
-1.142788, 0.8478581, -0.5780116, 1, 0, 0, 1, 1,
-1.138422, -0.4279802, -1.818431, 1, 0, 0, 1, 1,
-1.134047, -0.1901201, -1.88724, 1, 0, 0, 1, 1,
-1.127533, -1.789704, -2.302674, 0, 0, 0, 1, 1,
-1.119268, 1.796622, -1.223397, 0, 0, 0, 1, 1,
-1.117936, -0.8312089, -1.490887, 0, 0, 0, 1, 1,
-1.113662, 0.6416664, -0.7060861, 0, 0, 0, 1, 1,
-1.108413, 1.367509, -1.575255, 0, 0, 0, 1, 1,
-1.108352, 2.192762, -2.313378, 0, 0, 0, 1, 1,
-1.108308, -0.09099506, -2.303867, 0, 0, 0, 1, 1,
-1.107283, -0.09486279, -2.80522, 1, 1, 1, 1, 1,
-1.103607, 0.9477959, -0.30907, 1, 1, 1, 1, 1,
-1.092065, 0.08509813, -2.467871, 1, 1, 1, 1, 1,
-1.090382, -0.06424413, -0.5483558, 1, 1, 1, 1, 1,
-1.089806, -0.1593495, -1.819003, 1, 1, 1, 1, 1,
-1.089499, -0.6289715, -1.862038, 1, 1, 1, 1, 1,
-1.087824, 1.003636, -1.149214, 1, 1, 1, 1, 1,
-1.087109, -1.87076, -4.790584, 1, 1, 1, 1, 1,
-1.085443, 0.5775359, -0.9412587, 1, 1, 1, 1, 1,
-1.084828, -0.5181535, -3.890803, 1, 1, 1, 1, 1,
-1.083779, -1.371434, -1.96865, 1, 1, 1, 1, 1,
-1.078573, 1.261279, -0.6611664, 1, 1, 1, 1, 1,
-1.071766, -0.7468364, -1.458813, 1, 1, 1, 1, 1,
-1.070992, 0.329436, -1.315557, 1, 1, 1, 1, 1,
-1.068465, -0.4530187, -2.02977, 1, 1, 1, 1, 1,
-1.06588, -0.2507251, -1.950997, 0, 0, 1, 1, 1,
-1.058378, -2.175744, -3.788503, 1, 0, 0, 1, 1,
-1.054348, -0.05362092, -3.652026, 1, 0, 0, 1, 1,
-1.050326, -0.7857825, -2.567507, 1, 0, 0, 1, 1,
-1.039768, 0.5331968, -0.7547407, 1, 0, 0, 1, 1,
-1.028549, 0.51358, -2.199913, 1, 0, 0, 1, 1,
-1.019557, 0.2356868, -2.21564, 0, 0, 0, 1, 1,
-1.016828, -0.2775577, -1.837365, 0, 0, 0, 1, 1,
-1.007754, -0.4523072, -3.563002, 0, 0, 0, 1, 1,
-0.9978601, 0.879045, -1.27008, 0, 0, 0, 1, 1,
-0.993719, -2.75223, -2.115576, 0, 0, 0, 1, 1,
-0.9922616, 0.653361, -1.793331, 0, 0, 0, 1, 1,
-0.9908561, 0.8856586, -1.968175, 0, 0, 0, 1, 1,
-0.9905105, -0.3061077, -1.811325, 1, 1, 1, 1, 1,
-0.9882802, 0.04122226, -1.638086, 1, 1, 1, 1, 1,
-0.9870773, 1.226979, -0.4022327, 1, 1, 1, 1, 1,
-0.9817591, -0.178356, -1.974463, 1, 1, 1, 1, 1,
-0.9715859, 0.8987268, 0.04774017, 1, 1, 1, 1, 1,
-0.9703355, -0.1694851, -0.7498347, 1, 1, 1, 1, 1,
-0.9682435, 1.1489, -2.425492, 1, 1, 1, 1, 1,
-0.9669864, 0.0509442, -1.521074, 1, 1, 1, 1, 1,
-0.9652246, -1.450836, 0.09353122, 1, 1, 1, 1, 1,
-0.9558417, -0.3179691, -2.820905, 1, 1, 1, 1, 1,
-0.9538695, -0.7215227, -2.325581, 1, 1, 1, 1, 1,
-0.9535912, 0.358238, -2.198486, 1, 1, 1, 1, 1,
-0.9534013, 1.757644, -0.6557447, 1, 1, 1, 1, 1,
-0.9527261, 0.180787, -0.7862365, 1, 1, 1, 1, 1,
-0.9433735, 0.9899884, -0.1103658, 1, 1, 1, 1, 1,
-0.9419838, 1.415306, 0.1499229, 0, 0, 1, 1, 1,
-0.9368315, 1.858565, 1.091126, 1, 0, 0, 1, 1,
-0.9196766, 0.07417326, -2.414975, 1, 0, 0, 1, 1,
-0.9170464, -0.7731785, -4.213289, 1, 0, 0, 1, 1,
-0.9138016, 1.344121, 0.04128846, 1, 0, 0, 1, 1,
-0.9080288, 1.742538, 0.6340882, 1, 0, 0, 1, 1,
-0.9070162, -0.4504102, -1.254796, 0, 0, 0, 1, 1,
-0.9027575, -2.007026, -3.608168, 0, 0, 0, 1, 1,
-0.9023884, 0.04029364, -2.662965, 0, 0, 0, 1, 1,
-0.8982742, 0.2265824, -1.890863, 0, 0, 0, 1, 1,
-0.8944045, -1.74538, -1.706187, 0, 0, 0, 1, 1,
-0.89166, -0.1761011, -2.470925, 0, 0, 0, 1, 1,
-0.8911763, 0.3772894, 0.1897159, 0, 0, 0, 1, 1,
-0.8905346, -0.3061176, -2.683423, 1, 1, 1, 1, 1,
-0.8881748, -1.110113, -2.598168, 1, 1, 1, 1, 1,
-0.8870537, 0.2142092, -0.6077707, 1, 1, 1, 1, 1,
-0.8714758, -0.2637342, -1.26905, 1, 1, 1, 1, 1,
-0.8681435, -0.1967372, -1.128851, 1, 1, 1, 1, 1,
-0.8638948, -0.2847638, -2.876699, 1, 1, 1, 1, 1,
-0.856558, 0.1120974, -0.2283062, 1, 1, 1, 1, 1,
-0.852263, -1.141819, -2.799142, 1, 1, 1, 1, 1,
-0.8507651, -0.9909136, -3.638273, 1, 1, 1, 1, 1,
-0.8468957, 0.7924516, -1.103412, 1, 1, 1, 1, 1,
-0.8450448, -0.5056803, -2.433189, 1, 1, 1, 1, 1,
-0.8442532, 1.125145, -0.2191272, 1, 1, 1, 1, 1,
-0.8389657, -0.06195, -1.437227, 1, 1, 1, 1, 1,
-0.8333948, 0.05876706, 0.1650214, 1, 1, 1, 1, 1,
-0.8273357, 1.626667, -2.127518, 1, 1, 1, 1, 1,
-0.8261237, -0.667567, -3.275184, 0, 0, 1, 1, 1,
-0.8174809, -1.003208, -3.197559, 1, 0, 0, 1, 1,
-0.8142682, -0.1279039, -1.493953, 1, 0, 0, 1, 1,
-0.8100569, -0.7831622, -3.898585, 1, 0, 0, 1, 1,
-0.8091903, 0.3851229, -1.572325, 1, 0, 0, 1, 1,
-0.8010303, -0.9986381, -2.943198, 1, 0, 0, 1, 1,
-0.7938196, 0.09472804, -5.003814, 0, 0, 0, 1, 1,
-0.789729, -0.5942543, -2.789925, 0, 0, 0, 1, 1,
-0.7850073, 1.725146, -1.025238, 0, 0, 0, 1, 1,
-0.7782999, 0.6593688, -1.137183, 0, 0, 0, 1, 1,
-0.774837, 0.1213936, -1.140213, 0, 0, 0, 1, 1,
-0.7719118, -1.642941, -3.239935, 0, 0, 0, 1, 1,
-0.7684947, -0.8216907, -3.683336, 0, 0, 0, 1, 1,
-0.7682088, 0.03301744, -0.3652293, 1, 1, 1, 1, 1,
-0.7630925, -1.722321, -2.50354, 1, 1, 1, 1, 1,
-0.7618151, 1.285097, -0.9491233, 1, 1, 1, 1, 1,
-0.7604783, 0.1535802, -1.17316, 1, 1, 1, 1, 1,
-0.7568372, -1.897078, -3.625997, 1, 1, 1, 1, 1,
-0.7477483, 0.4675206, 0.2178027, 1, 1, 1, 1, 1,
-0.7474821, 1.077101, -0.8682343, 1, 1, 1, 1, 1,
-0.7470236, 0.6724084, -1.16823, 1, 1, 1, 1, 1,
-0.7378609, 0.02172734, -1.591134, 1, 1, 1, 1, 1,
-0.7377555, 0.9152496, 0.1842261, 1, 1, 1, 1, 1,
-0.7374018, -1.051029, -2.033653, 1, 1, 1, 1, 1,
-0.7324004, 2.081892, -0.9912931, 1, 1, 1, 1, 1,
-0.7278643, -1.25835, -3.55823, 1, 1, 1, 1, 1,
-0.7230412, 1.958222, -1.413123, 1, 1, 1, 1, 1,
-0.72208, -0.5260145, -3.069193, 1, 1, 1, 1, 1,
-0.712141, 0.965187, -0.5065213, 0, 0, 1, 1, 1,
-0.7120432, 0.1163626, -2.407959, 1, 0, 0, 1, 1,
-0.7079312, 1.31825, 1.081694, 1, 0, 0, 1, 1,
-0.7031454, -0.02562435, -1.860762, 1, 0, 0, 1, 1,
-0.7029684, 1.828709, -1.176305, 1, 0, 0, 1, 1,
-0.7028688, 0.3282606, -0.4908661, 1, 0, 0, 1, 1,
-0.70256, 1.546987, -0.7491754, 0, 0, 0, 1, 1,
-0.698888, -1.468475, -2.899648, 0, 0, 0, 1, 1,
-0.6975584, 1.455141, -0.06369705, 0, 0, 0, 1, 1,
-0.6967469, -1.392455, -3.776973, 0, 0, 0, 1, 1,
-0.6950885, 0.5166851, 0.633167, 0, 0, 0, 1, 1,
-0.6856555, -0.877346, -2.109447, 0, 0, 0, 1, 1,
-0.6790775, -0.446432, -2.728179, 0, 0, 0, 1, 1,
-0.6750296, -0.08870967, -1.141307, 1, 1, 1, 1, 1,
-0.6746804, -1.074687, -2.849753, 1, 1, 1, 1, 1,
-0.6746485, 0.111944, -0.715621, 1, 1, 1, 1, 1,
-0.6739271, 0.628551, 0.9404255, 1, 1, 1, 1, 1,
-0.6721972, -0.01527388, -1.80728, 1, 1, 1, 1, 1,
-0.6660209, -0.147599, -0.8453261, 1, 1, 1, 1, 1,
-0.6631368, -0.5163044, -2.184085, 1, 1, 1, 1, 1,
-0.6507065, 0.6472212, -2.315238, 1, 1, 1, 1, 1,
-0.635242, -0.3663043, -1.379234, 1, 1, 1, 1, 1,
-0.631795, 1.42928, -0.6034344, 1, 1, 1, 1, 1,
-0.6260187, 0.9995269, -1.875017, 1, 1, 1, 1, 1,
-0.621994, 0.2583058, -0.5355361, 1, 1, 1, 1, 1,
-0.6102645, -0.3964314, 0.08102194, 1, 1, 1, 1, 1,
-0.6042938, -0.2275682, -1.52562, 1, 1, 1, 1, 1,
-0.6006224, -0.4078412, -2.246823, 1, 1, 1, 1, 1,
-0.5939699, -0.2838318, -0.9980699, 0, 0, 1, 1, 1,
-0.5935504, -0.4582942, -3.746464, 1, 0, 0, 1, 1,
-0.5887852, -0.255267, -2.746092, 1, 0, 0, 1, 1,
-0.5839417, 1.470005, 0.1538757, 1, 0, 0, 1, 1,
-0.5794168, 1.038149, -0.8825974, 1, 0, 0, 1, 1,
-0.5771223, 1.160679, -0.9449165, 1, 0, 0, 1, 1,
-0.5760854, -0.3127874, -0.5851175, 0, 0, 0, 1, 1,
-0.5748863, -1.086824, -3.563748, 0, 0, 0, 1, 1,
-0.5730419, -0.6439309, -4.618852, 0, 0, 0, 1, 1,
-0.5710757, -1.541584, -3.43474, 0, 0, 0, 1, 1,
-0.5688236, 0.03430046, -1.33228, 0, 0, 0, 1, 1,
-0.5668019, -0.1672215, -1.77327, 0, 0, 0, 1, 1,
-0.5611394, -0.1431542, -2.022568, 0, 0, 0, 1, 1,
-0.555593, 0.6871469, 0.4425564, 1, 1, 1, 1, 1,
-0.5521307, 0.5406223, -1.820454, 1, 1, 1, 1, 1,
-0.551287, -0.424036, 0.2165221, 1, 1, 1, 1, 1,
-0.5493421, -0.6478063, -2.211609, 1, 1, 1, 1, 1,
-0.5485108, 0.1525223, 0.6214266, 1, 1, 1, 1, 1,
-0.5465804, 0.269562, -1.741273, 1, 1, 1, 1, 1,
-0.5383901, -0.4766984, -1.659205, 1, 1, 1, 1, 1,
-0.5364167, 0.2414989, -1.05494, 1, 1, 1, 1, 1,
-0.5217081, 0.5485412, -1.280509, 1, 1, 1, 1, 1,
-0.518102, -2.135673, -3.381741, 1, 1, 1, 1, 1,
-0.5121489, 0.06707294, -2.021699, 1, 1, 1, 1, 1,
-0.5077255, 1.681441, 0.227661, 1, 1, 1, 1, 1,
-0.5065774, -2.202389, -3.331894, 1, 1, 1, 1, 1,
-0.5010891, 1.169611, 1.205468, 1, 1, 1, 1, 1,
-0.499344, 2.18616, -2.105016, 1, 1, 1, 1, 1,
-0.4990417, 0.4520554, -0.728787, 0, 0, 1, 1, 1,
-0.4966207, 0.366669, 0.6813357, 1, 0, 0, 1, 1,
-0.4938511, 0.2114276, -1.387, 1, 0, 0, 1, 1,
-0.4918721, 1.923774, -1.250515, 1, 0, 0, 1, 1,
-0.4868653, -1.12835, -3.000791, 1, 0, 0, 1, 1,
-0.4868027, 0.9165728, 0.2010923, 1, 0, 0, 1, 1,
-0.4837786, 0.7667107, -0.1840772, 0, 0, 0, 1, 1,
-0.4827785, 1.756227, -0.3940242, 0, 0, 0, 1, 1,
-0.4821679, -0.8593565, -3.037256, 0, 0, 0, 1, 1,
-0.4773289, -0.2529414, -1.159715, 0, 0, 0, 1, 1,
-0.4733874, 1.254389, -0.3411235, 0, 0, 0, 1, 1,
-0.468593, -0.01956353, -1.553634, 0, 0, 0, 1, 1,
-0.4624661, 0.762783, 0.6924649, 0, 0, 0, 1, 1,
-0.456578, 0.608448, -0.2421604, 1, 1, 1, 1, 1,
-0.455471, -0.5805671, -3.954424, 1, 1, 1, 1, 1,
-0.4513099, 0.7342703, 1.454504, 1, 1, 1, 1, 1,
-0.4487847, -0.300336, -2.214791, 1, 1, 1, 1, 1,
-0.439998, -0.09689597, -1.533417, 1, 1, 1, 1, 1,
-0.4391871, 0.5048753, 0.5736601, 1, 1, 1, 1, 1,
-0.4374163, -0.6019121, -2.519278, 1, 1, 1, 1, 1,
-0.4346651, 0.2629524, -0.1377812, 1, 1, 1, 1, 1,
-0.4251314, 1.073369, -1.817867, 1, 1, 1, 1, 1,
-0.4229542, -0.3110558, -1.972844, 1, 1, 1, 1, 1,
-0.4222063, 0.3028319, -1.930917, 1, 1, 1, 1, 1,
-0.4161435, 0.5645614, 0.7161339, 1, 1, 1, 1, 1,
-0.4161143, -1.31505, -2.312305, 1, 1, 1, 1, 1,
-0.4131157, 1.91252, -0.001136229, 1, 1, 1, 1, 1,
-0.4116816, 0.8988266, 0.9730843, 1, 1, 1, 1, 1,
-0.409768, 0.385939, -0.3060456, 0, 0, 1, 1, 1,
-0.4095641, -0.7862241, -3.095634, 1, 0, 0, 1, 1,
-0.4089126, 0.476134, 0.6743619, 1, 0, 0, 1, 1,
-0.4087161, -0.07066561, -2.547221, 1, 0, 0, 1, 1,
-0.3972404, -0.3547232, -1.159231, 1, 0, 0, 1, 1,
-0.3946986, 0.09301873, -0.5164689, 1, 0, 0, 1, 1,
-0.393168, 0.7397078, -0.6012654, 0, 0, 0, 1, 1,
-0.3904813, -0.1516668, -5.511901, 0, 0, 0, 1, 1,
-0.3876777, -0.4462783, -2.937396, 0, 0, 0, 1, 1,
-0.3774205, 0.9708389, -1.077981, 0, 0, 0, 1, 1,
-0.3764577, -0.5249471, -3.074428, 0, 0, 0, 1, 1,
-0.3728907, 0.7773705, 0.5379342, 0, 0, 0, 1, 1,
-0.3701588, 0.1158369, -3.789066, 0, 0, 0, 1, 1,
-0.3667183, -0.1837318, -1.645455, 1, 1, 1, 1, 1,
-0.3662972, 1.674795, 0.6148831, 1, 1, 1, 1, 1,
-0.3640848, 0.8741829, 0.6050966, 1, 1, 1, 1, 1,
-0.3585352, -0.5907541, -2.267895, 1, 1, 1, 1, 1,
-0.3583211, -1.075494, -2.654106, 1, 1, 1, 1, 1,
-0.350311, 1.627385, 0.06555653, 1, 1, 1, 1, 1,
-0.3500755, 2.120472, 0.3889364, 1, 1, 1, 1, 1,
-0.3483107, -1.421703, -2.719889, 1, 1, 1, 1, 1,
-0.3454192, -1.514, -2.430436, 1, 1, 1, 1, 1,
-0.3440212, 0.7534068, 0.2617235, 1, 1, 1, 1, 1,
-0.3438845, -1.68176, -2.704221, 1, 1, 1, 1, 1,
-0.3384061, 0.4773761, -0.165857, 1, 1, 1, 1, 1,
-0.3363974, 0.9324722, 0.08884299, 1, 1, 1, 1, 1,
-0.3286342, -1.513011, -4.3501, 1, 1, 1, 1, 1,
-0.3282857, 0.9480337, 0.7670066, 1, 1, 1, 1, 1,
-0.3233845, 2.393554, 0.3847994, 0, 0, 1, 1, 1,
-0.3199423, -0.3076415, -3.820356, 1, 0, 0, 1, 1,
-0.3178148, -0.7403544, -3.414278, 1, 0, 0, 1, 1,
-0.3167337, 0.100467, -0.4972928, 1, 0, 0, 1, 1,
-0.3037643, -0.2635505, -2.747077, 1, 0, 0, 1, 1,
-0.3015871, -1.650661, -3.969358, 1, 0, 0, 1, 1,
-0.3005794, 0.7649899, -0.8146961, 0, 0, 0, 1, 1,
-0.2997924, -1.08335, -2.244301, 0, 0, 0, 1, 1,
-0.2992864, 0.4613317, -1.801809, 0, 0, 0, 1, 1,
-0.2980427, -1.756549, -2.266085, 0, 0, 0, 1, 1,
-0.2959129, 0.1610735, -0.7141345, 0, 0, 0, 1, 1,
-0.2952439, -0.5432742, -3.163894, 0, 0, 0, 1, 1,
-0.2897838, -0.3355582, -4.018643, 0, 0, 0, 1, 1,
-0.289593, 1.202076, -1.125733, 1, 1, 1, 1, 1,
-0.2860979, -0.1269647, -2.188441, 1, 1, 1, 1, 1,
-0.2850856, -1.106598, -2.577806, 1, 1, 1, 1, 1,
-0.2825145, -0.1692955, -3.855984, 1, 1, 1, 1, 1,
-0.278783, -0.8185788, -4.862738, 1, 1, 1, 1, 1,
-0.2748134, 0.2212635, -1.835415, 1, 1, 1, 1, 1,
-0.2727805, 0.7986625, -0.3497306, 1, 1, 1, 1, 1,
-0.2695121, 0.03907287, -1.631657, 1, 1, 1, 1, 1,
-0.2690883, -0.649034, -1.875952, 1, 1, 1, 1, 1,
-0.2646747, 0.2911702, -0.4745401, 1, 1, 1, 1, 1,
-0.264505, -0.8887246, -1.910404, 1, 1, 1, 1, 1,
-0.2606883, -0.6888247, -3.750607, 1, 1, 1, 1, 1,
-0.2602762, 1.251702, 0.2181906, 1, 1, 1, 1, 1,
-0.2541008, 0.3545968, -0.8851319, 1, 1, 1, 1, 1,
-0.252704, -0.5187485, -3.579979, 1, 1, 1, 1, 1,
-0.2492756, 0.3190711, 1.15106, 0, 0, 1, 1, 1,
-0.2480741, -0.3624597, -2.620761, 1, 0, 0, 1, 1,
-0.2399999, -1.056759, -4.298883, 1, 0, 0, 1, 1,
-0.2343609, -0.9176686, -3.187353, 1, 0, 0, 1, 1,
-0.2280128, 0.5701198, -0.6007279, 1, 0, 0, 1, 1,
-0.2278531, -0.1459545, -1.329402, 1, 0, 0, 1, 1,
-0.2276138, -0.9998836, -3.513921, 0, 0, 0, 1, 1,
-0.2241015, -1.074449, -2.351274, 0, 0, 0, 1, 1,
-0.2235781, 0.6771904, -0.6831328, 0, 0, 0, 1, 1,
-0.2227639, -1.378157, -0.8201256, 0, 0, 0, 1, 1,
-0.2204803, 1.212437, 0.5453869, 0, 0, 0, 1, 1,
-0.2156775, -0.03462458, -1.486436, 0, 0, 0, 1, 1,
-0.215492, 0.8800291, 0.6262279, 0, 0, 0, 1, 1,
-0.2134282, -0.6740636, -3.188268, 1, 1, 1, 1, 1,
-0.2104701, 0.01227152, -1.77975, 1, 1, 1, 1, 1,
-0.2095696, -1.17569, -0.9686613, 1, 1, 1, 1, 1,
-0.2035572, -1.27287, -2.777778, 1, 1, 1, 1, 1,
-0.2018883, -0.3415425, -1.574834, 1, 1, 1, 1, 1,
-0.1957812, 1.104236, 0.674474, 1, 1, 1, 1, 1,
-0.1938433, -0.7920081, -1.691223, 1, 1, 1, 1, 1,
-0.1883864, 0.6110076, -1.262546, 1, 1, 1, 1, 1,
-0.1789926, 0.9607684, -0.9114398, 1, 1, 1, 1, 1,
-0.1788468, 0.04763012, -1.575056, 1, 1, 1, 1, 1,
-0.1772637, 0.8289037, -0.2663368, 1, 1, 1, 1, 1,
-0.1723346, -0.3574445, -1.634744, 1, 1, 1, 1, 1,
-0.1723205, 0.8302059, 1.059175, 1, 1, 1, 1, 1,
-0.1666764, 0.8256437, -0.4583474, 1, 1, 1, 1, 1,
-0.1664249, 0.7617757, 0.8523977, 1, 1, 1, 1, 1,
-0.1649616, 0.5996537, -1.27448, 0, 0, 1, 1, 1,
-0.1628043, 0.3057302, -0.02259929, 1, 0, 0, 1, 1,
-0.1583756, -2.068775, -5.04154, 1, 0, 0, 1, 1,
-0.1580751, -0.9999539, -2.587522, 1, 0, 0, 1, 1,
-0.1575541, -0.2991004, -1.912803, 1, 0, 0, 1, 1,
-0.1569608, -0.6124119, -2.892392, 1, 0, 0, 1, 1,
-0.152657, 0.2504178, 0.9138389, 0, 0, 0, 1, 1,
-0.1494031, 0.530017, -1.563373, 0, 0, 0, 1, 1,
-0.1457749, 1.450941, -0.02324761, 0, 0, 0, 1, 1,
-0.1451199, 1.276888, 0.4991933, 0, 0, 0, 1, 1,
-0.1402071, 0.1642436, 0.55088, 0, 0, 0, 1, 1,
-0.1383283, -0.5884684, -2.759952, 0, 0, 0, 1, 1,
-0.1379582, -0.4408303, -2.327374, 0, 0, 0, 1, 1,
-0.1369613, -1.094862, -3.561341, 1, 1, 1, 1, 1,
-0.1367382, 0.5918217, -2.087376, 1, 1, 1, 1, 1,
-0.1293471, -0.1678609, -2.174955, 1, 1, 1, 1, 1,
-0.1293357, -0.7112907, -2.514536, 1, 1, 1, 1, 1,
-0.1292556, 0.005451895, -2.866843, 1, 1, 1, 1, 1,
-0.1211454, 0.2490998, -0.2484075, 1, 1, 1, 1, 1,
-0.120782, -1.411369, -2.639673, 1, 1, 1, 1, 1,
-0.1185495, 0.8140568, -0.01514313, 1, 1, 1, 1, 1,
-0.1178032, -0.4045524, -4.549917, 1, 1, 1, 1, 1,
-0.1161843, 0.6837075, 0.5882333, 1, 1, 1, 1, 1,
-0.1128209, 2.619135, 0.09693781, 1, 1, 1, 1, 1,
-0.112493, -0.5686726, -5.669376, 1, 1, 1, 1, 1,
-0.1110745, -0.3829537, -3.139986, 1, 1, 1, 1, 1,
-0.1083803, 0.8983043, 2.659725, 1, 1, 1, 1, 1,
-0.1060348, -1.527056, -2.567511, 1, 1, 1, 1, 1,
-0.103888, 0.5914751, -2.214719, 0, 0, 1, 1, 1,
-0.1025687, -1.281185, -3.213452, 1, 0, 0, 1, 1,
-0.1018796, -1.224444, -2.874689, 1, 0, 0, 1, 1,
-0.1016466, -0.7231016, -0.730051, 1, 0, 0, 1, 1,
-0.1005239, 0.8401994, 0.217819, 1, 0, 0, 1, 1,
-0.09431593, 0.460933, -0.4482774, 1, 0, 0, 1, 1,
-0.09050558, 0.9366604, -0.7590883, 0, 0, 0, 1, 1,
-0.09003728, -1.925948, -3.065028, 0, 0, 0, 1, 1,
-0.08671322, 2.194602, 0.08314487, 0, 0, 0, 1, 1,
-0.08371525, -0.6491933, -1.950368, 0, 0, 0, 1, 1,
-0.07586139, 0.2915461, 0.4439997, 0, 0, 0, 1, 1,
-0.07384557, 1.065066, 0.5429916, 0, 0, 0, 1, 1,
-0.07315525, -0.08376361, -3.019325, 0, 0, 0, 1, 1,
-0.07203086, -0.4976742, -2.541493, 1, 1, 1, 1, 1,
-0.07186806, 0.05265156, -1.793615, 1, 1, 1, 1, 1,
-0.06879987, 1.011186, 1.168787, 1, 1, 1, 1, 1,
-0.06571472, -1.462687, -3.992207, 1, 1, 1, 1, 1,
-0.06165456, 0.7122387, 0.06056362, 1, 1, 1, 1, 1,
-0.06136637, 0.3797594, -1.418919, 1, 1, 1, 1, 1,
-0.05330056, -1.637307, -1.553343, 1, 1, 1, 1, 1,
-0.05305497, 0.1659448, 0.2006244, 1, 1, 1, 1, 1,
-0.04927981, 1.423881, -1.220519, 1, 1, 1, 1, 1,
-0.04872693, 1.052628, -1.513123, 1, 1, 1, 1, 1,
-0.04612804, 0.2152835, 0.9894414, 1, 1, 1, 1, 1,
-0.0424853, -0.9458538, -3.041646, 1, 1, 1, 1, 1,
-0.04069528, 0.458134, -0.3160109, 1, 1, 1, 1, 1,
-0.03811814, -0.6441357, -6.595315, 1, 1, 1, 1, 1,
-0.03796823, 1.305386, -0.009043388, 1, 1, 1, 1, 1,
-0.03562558, -0.7219779, -4.676217, 0, 0, 1, 1, 1,
-0.03361516, 0.1243435, 0.1174736, 1, 0, 0, 1, 1,
-0.03029264, 1.293798, 0.5265977, 1, 0, 0, 1, 1,
-0.02848323, -0.1624669, -2.237513, 1, 0, 0, 1, 1,
-0.02182342, 0.3904664, 0.4529077, 1, 0, 0, 1, 1,
-0.01963, -1.385734, -3.510301, 1, 0, 0, 1, 1,
-0.01407829, 0.2773256, 0.6402299, 0, 0, 0, 1, 1,
-0.009261514, -0.595359, -3.170155, 0, 0, 0, 1, 1,
-0.008429098, -0.1317966, -3.969031, 0, 0, 0, 1, 1,
-0.0001735282, 0.7849873, 0.3449417, 0, 0, 0, 1, 1,
-9.052258e-05, -1.478471, -2.81679, 0, 0, 0, 1, 1,
0.002918478, 1.552049, -0.4120935, 0, 0, 0, 1, 1,
0.00521493, -0.3142688, 2.852238, 0, 0, 0, 1, 1,
0.005411341, 0.2370799, 0.3529216, 1, 1, 1, 1, 1,
0.006138484, 1.229899, -0.1471751, 1, 1, 1, 1, 1,
0.006141761, -1.081669, 2.307095, 1, 1, 1, 1, 1,
0.008819273, -1.605418, 4.499478, 1, 1, 1, 1, 1,
0.01068593, -0.3895463, 3.583572, 1, 1, 1, 1, 1,
0.01353078, -0.8908026, 3.581971, 1, 1, 1, 1, 1,
0.01680137, -2.460269, 2.65407, 1, 1, 1, 1, 1,
0.01710882, 0.8714714, 0.08483971, 1, 1, 1, 1, 1,
0.02012512, 0.4905185, -0.05739793, 1, 1, 1, 1, 1,
0.02338023, -0.1197502, 4.756909, 1, 1, 1, 1, 1,
0.02573602, -0.6930597, 4.364597, 1, 1, 1, 1, 1,
0.02901825, -0.2130888, 2.597528, 1, 1, 1, 1, 1,
0.03175055, 0.6800706, -2.593096, 1, 1, 1, 1, 1,
0.03749852, 0.3265596, 0.784381, 1, 1, 1, 1, 1,
0.04248578, -0.1209736, 3.285425, 1, 1, 1, 1, 1,
0.04331222, -0.8780319, 3.734626, 0, 0, 1, 1, 1,
0.04410826, 0.4495786, -0.5204619, 1, 0, 0, 1, 1,
0.04546489, -0.3078025, 2.28237, 1, 0, 0, 1, 1,
0.04755837, -0.1333012, 3.77254, 1, 0, 0, 1, 1,
0.04923905, 0.4575221, 0.5407548, 1, 0, 0, 1, 1,
0.055608, -0.8817038, 3.161952, 1, 0, 0, 1, 1,
0.05641796, 0.92736, -0.1297843, 0, 0, 0, 1, 1,
0.05739252, 0.2697974, 1.406578, 0, 0, 0, 1, 1,
0.05882933, 0.5182397, 0.7542439, 0, 0, 0, 1, 1,
0.06114255, 1.089254, 0.9147031, 0, 0, 0, 1, 1,
0.06693497, 0.03474133, 2.025878, 0, 0, 0, 1, 1,
0.06902865, -0.7791629, 2.823847, 0, 0, 0, 1, 1,
0.07410278, -0.7241622, 2.471756, 0, 0, 0, 1, 1,
0.07484613, -1.567725, 3.712389, 1, 1, 1, 1, 1,
0.07851814, 0.4578325, 0.182828, 1, 1, 1, 1, 1,
0.08130304, 0.713362, -1.010015, 1, 1, 1, 1, 1,
0.085098, -0.8770251, 1.022573, 1, 1, 1, 1, 1,
0.08626664, -0.7017698, 2.106807, 1, 1, 1, 1, 1,
0.08665016, -0.8598468, 5.082052, 1, 1, 1, 1, 1,
0.08727425, 1.38912, -0.8301399, 1, 1, 1, 1, 1,
0.08901276, 0.9218045, -0.1744573, 1, 1, 1, 1, 1,
0.09271946, 1.891556, -0.5980178, 1, 1, 1, 1, 1,
0.0937933, 0.5256097, 1.058718, 1, 1, 1, 1, 1,
0.093826, 1.509265, 0.2946831, 1, 1, 1, 1, 1,
0.09516883, -0.2528777, 2.657272, 1, 1, 1, 1, 1,
0.1096441, 0.6257095, 0.3872738, 1, 1, 1, 1, 1,
0.1119357, -0.4848437, 3.331212, 1, 1, 1, 1, 1,
0.1132339, 0.7891117, 1.2372, 1, 1, 1, 1, 1,
0.114229, 0.9470232, -0.8483291, 0, 0, 1, 1, 1,
0.1144238, -0.1837108, 2.431077, 1, 0, 0, 1, 1,
0.1171208, -1.378292, 3.408321, 1, 0, 0, 1, 1,
0.1174532, 1.734123, -0.01414031, 1, 0, 0, 1, 1,
0.1178151, 0.381046, 0.4008715, 1, 0, 0, 1, 1,
0.1182932, 1.056684, -1.656168, 1, 0, 0, 1, 1,
0.1189919, -1.28591, 4.8906, 0, 0, 0, 1, 1,
0.1230616, -0.5346932, 3.631282, 0, 0, 0, 1, 1,
0.1250468, 0.1273412, -0.8161064, 0, 0, 0, 1, 1,
0.1255024, 0.2014608, 0.5252762, 0, 0, 0, 1, 1,
0.1263192, 0.5028462, -1.880405, 0, 0, 0, 1, 1,
0.1280238, -0.06536774, 2.452241, 0, 0, 0, 1, 1,
0.130229, -0.1249965, 2.747819, 0, 0, 0, 1, 1,
0.1317079, -2.261172, 1.360902, 1, 1, 1, 1, 1,
0.1375145, 0.3345653, 1.279675, 1, 1, 1, 1, 1,
0.1381123, 1.190039, -1.157079, 1, 1, 1, 1, 1,
0.1382274, -1.677762, 4.056707, 1, 1, 1, 1, 1,
0.1418883, 0.3559491, 1.200859, 1, 1, 1, 1, 1,
0.1454982, -0.4364115, 3.255173, 1, 1, 1, 1, 1,
0.1455602, 1.227991, 0.2299564, 1, 1, 1, 1, 1,
0.1459958, -1.205528, 2.873454, 1, 1, 1, 1, 1,
0.1469217, -0.07937679, 2.594551, 1, 1, 1, 1, 1,
0.1511, 1.10998, 0.1397888, 1, 1, 1, 1, 1,
0.1517239, -1.615583, 3.381392, 1, 1, 1, 1, 1,
0.1518854, 1.526902, 1.902883, 1, 1, 1, 1, 1,
0.1531644, -1.590565, 1.889768, 1, 1, 1, 1, 1,
0.1547372, -0.6696028, 4.021091, 1, 1, 1, 1, 1,
0.1553994, -0.1177023, 3.055279, 1, 1, 1, 1, 1,
0.1565233, -0.2214836, 3.071041, 0, 0, 1, 1, 1,
0.1595637, 1.412195, 0.9823312, 1, 0, 0, 1, 1,
0.1598611, -1.746618, 2.489979, 1, 0, 0, 1, 1,
0.1607038, 1.083665, -0.540786, 1, 0, 0, 1, 1,
0.1645747, -1.659868, 4.399762, 1, 0, 0, 1, 1,
0.1663674, 0.554867, 0.5672918, 1, 0, 0, 1, 1,
0.1715075, -0.1677545, 3.042197, 0, 0, 0, 1, 1,
0.1716427, 0.1956932, -0.8873027, 0, 0, 0, 1, 1,
0.1735264, 1.521473, 0.5257894, 0, 0, 0, 1, 1,
0.1758746, 0.4833156, 1.387669, 0, 0, 0, 1, 1,
0.1769153, -0.1784796, 2.879698, 0, 0, 0, 1, 1,
0.1777252, -0.5955824, 3.728216, 0, 0, 0, 1, 1,
0.1808728, -0.3679927, 2.072681, 0, 0, 0, 1, 1,
0.1826969, 1.382819, -0.1677658, 1, 1, 1, 1, 1,
0.1830405, 0.3335638, 0.6609046, 1, 1, 1, 1, 1,
0.1842038, 1.543845, 0.05632377, 1, 1, 1, 1, 1,
0.1857171, 1.403277, -2.146108, 1, 1, 1, 1, 1,
0.1884741, -1.052641, 3.23469, 1, 1, 1, 1, 1,
0.1991389, 0.5586287, -0.2066781, 1, 1, 1, 1, 1,
0.1996749, 0.8343735, -0.7487454, 1, 1, 1, 1, 1,
0.2067748, 0.9177247, -0.9097323, 1, 1, 1, 1, 1,
0.2067782, -0.08987637, 1.744922, 1, 1, 1, 1, 1,
0.2076449, 0.6136467, -0.4118701, 1, 1, 1, 1, 1,
0.2076891, 0.0231292, 2.585308, 1, 1, 1, 1, 1,
0.2087732, -1.10467, 3.527359, 1, 1, 1, 1, 1,
0.2087817, -0.2350056, 0.6692501, 1, 1, 1, 1, 1,
0.2096102, 0.537647, -0.2463344, 1, 1, 1, 1, 1,
0.2108583, 0.6072814, 1.013435, 1, 1, 1, 1, 1,
0.2125093, 0.1941551, 2.442373, 0, 0, 1, 1, 1,
0.214892, 1.762739, 1.454771, 1, 0, 0, 1, 1,
0.2174147, -0.6566874, 2.722487, 1, 0, 0, 1, 1,
0.2206144, -0.5659999, 2.857512, 1, 0, 0, 1, 1,
0.2211032, -0.55028, 3.641514, 1, 0, 0, 1, 1,
0.2221092, 0.1913841, 1.886212, 1, 0, 0, 1, 1,
0.2222134, 0.9957699, 1.543167, 0, 0, 0, 1, 1,
0.2225453, 0.9087873, 0.6785924, 0, 0, 0, 1, 1,
0.2240493, -0.01104914, 2.885012, 0, 0, 0, 1, 1,
0.2318582, -0.1428618, 3.381704, 0, 0, 0, 1, 1,
0.2322115, 0.5646604, -0.9332616, 0, 0, 0, 1, 1,
0.2329443, 0.4966024, 1.593055, 0, 0, 0, 1, 1,
0.2340834, 0.2331328, 0.3395366, 0, 0, 0, 1, 1,
0.237926, 0.1335922, 0.9201667, 1, 1, 1, 1, 1,
0.240398, 1.861814, -0.1463674, 1, 1, 1, 1, 1,
0.2415149, 0.4460475, 2.249225, 1, 1, 1, 1, 1,
0.2420316, -1.888646, 2.348608, 1, 1, 1, 1, 1,
0.2454783, -0.1171543, 3.861506, 1, 1, 1, 1, 1,
0.2514101, -2.492991, 1.567969, 1, 1, 1, 1, 1,
0.2582701, 0.3939873, 2.124064, 1, 1, 1, 1, 1,
0.2586631, -0.8683026, 3.565319, 1, 1, 1, 1, 1,
0.2679946, -0.01725034, 0.2140405, 1, 1, 1, 1, 1,
0.2713116, 0.3354976, 1.361623, 1, 1, 1, 1, 1,
0.2767304, -0.4119984, 0.9474679, 1, 1, 1, 1, 1,
0.2769143, -1.1034, 1.378138, 1, 1, 1, 1, 1,
0.2770768, -0.00681164, 0.6180126, 1, 1, 1, 1, 1,
0.2820913, 0.2188231, 1.168616, 1, 1, 1, 1, 1,
0.2838629, -1.022104, 1.171165, 1, 1, 1, 1, 1,
0.2840788, 1.60746, 0.9313599, 0, 0, 1, 1, 1,
0.2845348, -0.7070084, 2.856794, 1, 0, 0, 1, 1,
0.285917, 0.8295496, 1.154505, 1, 0, 0, 1, 1,
0.2873912, 0.8574457, -0.208281, 1, 0, 0, 1, 1,
0.2941489, -1.618521, 6.568729, 1, 0, 0, 1, 1,
0.295794, -1.139077, 4.191505, 1, 0, 0, 1, 1,
0.3015062, -1.421695, 2.170022, 0, 0, 0, 1, 1,
0.3091608, -1.341236, 4.082139, 0, 0, 0, 1, 1,
0.310554, 0.003999621, 1.251241, 0, 0, 0, 1, 1,
0.3184765, -0.8236728, 2.479934, 0, 0, 0, 1, 1,
0.3204876, -0.1617528, 3.117043, 0, 0, 0, 1, 1,
0.3225583, 0.03305752, 1.427042, 0, 0, 0, 1, 1,
0.3237185, -0.3291342, 2.878917, 0, 0, 0, 1, 1,
0.3260064, 1.100719, -1.325939, 1, 1, 1, 1, 1,
0.327268, 0.03425567, 2.355906, 1, 1, 1, 1, 1,
0.3306991, 0.02860021, 1.30854, 1, 1, 1, 1, 1,
0.3322919, -0.2047802, 1.843363, 1, 1, 1, 1, 1,
0.336174, -0.9457794, 2.849958, 1, 1, 1, 1, 1,
0.3378972, -1.06083, 1.708407, 1, 1, 1, 1, 1,
0.3418245, 0.07507481, 1.634001, 1, 1, 1, 1, 1,
0.345562, 1.625829, 0.6372994, 1, 1, 1, 1, 1,
0.3473343, -0.1696094, 2.69201, 1, 1, 1, 1, 1,
0.353317, -0.2662201, 1.069952, 1, 1, 1, 1, 1,
0.3535812, 1.816743, 0.7824581, 1, 1, 1, 1, 1,
0.3537904, 0.8454185, -1.12614, 1, 1, 1, 1, 1,
0.353979, 0.1299623, -0.2248666, 1, 1, 1, 1, 1,
0.3547677, 0.7134754, 0.06859509, 1, 1, 1, 1, 1,
0.3557334, 1.011565, 2.616503, 1, 1, 1, 1, 1,
0.3624021, -0.1672747, 3.081481, 0, 0, 1, 1, 1,
0.3646493, 1.625801, -0.4650527, 1, 0, 0, 1, 1,
0.364857, -0.595823, 3.43202, 1, 0, 0, 1, 1,
0.3688926, -0.5485188, 2.881643, 1, 0, 0, 1, 1,
0.3701279, 1.798886, 1.481227, 1, 0, 0, 1, 1,
0.3730222, -0.5597289, 2.095547, 1, 0, 0, 1, 1,
0.3747267, -0.6496056, 2.957045, 0, 0, 0, 1, 1,
0.3797338, -0.521714, 1.421516, 0, 0, 0, 1, 1,
0.3816631, 0.6127957, 1.140711, 0, 0, 0, 1, 1,
0.3857933, -0.1216554, 3.215974, 0, 0, 0, 1, 1,
0.388124, 1.510795, -1.144483, 0, 0, 0, 1, 1,
0.388517, -0.5190849, 1.404426, 0, 0, 0, 1, 1,
0.3897826, 0.106409, 0.2344195, 0, 0, 0, 1, 1,
0.3909475, -0.4836501, 1.547063, 1, 1, 1, 1, 1,
0.3923677, -0.675046, 4.834402, 1, 1, 1, 1, 1,
0.3947568, 1.524248, 0.2073174, 1, 1, 1, 1, 1,
0.401014, -0.07953493, -0.07898893, 1, 1, 1, 1, 1,
0.4032692, 0.1991622, 2.028128, 1, 1, 1, 1, 1,
0.4036753, 0.3710414, -0.1606451, 1, 1, 1, 1, 1,
0.4040202, 0.05055372, 0.9418637, 1, 1, 1, 1, 1,
0.4074169, -0.0828172, 1.223495, 1, 1, 1, 1, 1,
0.4102139, 0.3844243, 0.4811682, 1, 1, 1, 1, 1,
0.4201083, 1.313401, 1.302225, 1, 1, 1, 1, 1,
0.4238535, 0.7155331, 1.488418, 1, 1, 1, 1, 1,
0.4256838, -0.8655105, 4.706729, 1, 1, 1, 1, 1,
0.4289595, -0.3402039, 1.670211, 1, 1, 1, 1, 1,
0.4296349, 2.440248, -0.001369058, 1, 1, 1, 1, 1,
0.4297614, -0.8258325, 1.566776, 1, 1, 1, 1, 1,
0.4300341, -0.913143, 3.308705, 0, 0, 1, 1, 1,
0.4367084, -0.9267911, 2.648591, 1, 0, 0, 1, 1,
0.4400707, -2.195785, 3.494734, 1, 0, 0, 1, 1,
0.4444221, -0.8003665, 1.234095, 1, 0, 0, 1, 1,
0.4545177, 1.814423, 1.348047, 1, 0, 0, 1, 1,
0.4567181, 0.7803765, 2.235148, 1, 0, 0, 1, 1,
0.4591739, -0.9629107, 4.193538, 0, 0, 0, 1, 1,
0.4648132, -0.1544683, 2.656021, 0, 0, 0, 1, 1,
0.4664458, 0.3088556, 0.2490997, 0, 0, 0, 1, 1,
0.4689671, -0.004869873, -0.5201656, 0, 0, 0, 1, 1,
0.4742658, 1.576539, 1.952161, 0, 0, 0, 1, 1,
0.4755569, 1.817804, -0.2828173, 0, 0, 0, 1, 1,
0.4760828, 1.538455, 2.504687, 0, 0, 0, 1, 1,
0.4766842, 0.4368927, 2.49707, 1, 1, 1, 1, 1,
0.4774939, -0.1153855, 0.75438, 1, 1, 1, 1, 1,
0.4809691, 0.8864329, -1.301004, 1, 1, 1, 1, 1,
0.481684, 0.6328719, 1.472439, 1, 1, 1, 1, 1,
0.4835503, 0.4690234, 1.097838, 1, 1, 1, 1, 1,
0.4847898, 0.8311722, 0.9985409, 1, 1, 1, 1, 1,
0.4860296, -2.001684, 4.413158, 1, 1, 1, 1, 1,
0.4861529, -0.4460005, 3.272814, 1, 1, 1, 1, 1,
0.4867069, 0.07648696, 1.028831, 1, 1, 1, 1, 1,
0.4886245, -0.9487557, 2.708388, 1, 1, 1, 1, 1,
0.4892753, -1.066727, 3.366837, 1, 1, 1, 1, 1,
0.493694, -1.528573, 3.993168, 1, 1, 1, 1, 1,
0.495422, 1.671154, 1.89326, 1, 1, 1, 1, 1,
0.4970397, 1.045413, 1.985209, 1, 1, 1, 1, 1,
0.5033844, 0.9082811, 0.4207208, 1, 1, 1, 1, 1,
0.5099949, -2.236138, 4.790055, 0, 0, 1, 1, 1,
0.5103195, -0.8578135, 2.561849, 1, 0, 0, 1, 1,
0.5164375, -0.7508312, 2.546192, 1, 0, 0, 1, 1,
0.5170472, 0.7846751, -0.4358854, 1, 0, 0, 1, 1,
0.5202107, -0.976859, 1.749139, 1, 0, 0, 1, 1,
0.5215714, 0.3610147, 1.671013, 1, 0, 0, 1, 1,
0.52184, 1.201829, 0.9958727, 0, 0, 0, 1, 1,
0.5260335, 0.5537826, -0.1207364, 0, 0, 0, 1, 1,
0.5284594, 1.694575, 0.9699551, 0, 0, 0, 1, 1,
0.5312026, -0.2669314, 0.8364922, 0, 0, 0, 1, 1,
0.5333198, -1.859561, 1.583152, 0, 0, 0, 1, 1,
0.5333973, -1.269449, 2.95294, 0, 0, 0, 1, 1,
0.5365679, 0.3385924, 2.658216, 0, 0, 0, 1, 1,
0.5397663, 0.2889712, -0.06555463, 1, 1, 1, 1, 1,
0.5399838, -0.63492, 2.866238, 1, 1, 1, 1, 1,
0.5402576, 0.2232821, 1.369442, 1, 1, 1, 1, 1,
0.5455101, -1.306082, 2.501949, 1, 1, 1, 1, 1,
0.5518321, -0.09541878, 0.6107703, 1, 1, 1, 1, 1,
0.5522751, 1.689648, -0.4132843, 1, 1, 1, 1, 1,
0.5525131, 0.811155, 0.8015776, 1, 1, 1, 1, 1,
0.5547093, 0.3735903, -0.2597904, 1, 1, 1, 1, 1,
0.5566809, 0.5559133, 2.929579, 1, 1, 1, 1, 1,
0.5636801, -0.07336488, 0.8184514, 1, 1, 1, 1, 1,
0.5661481, -1.435273, 1.676646, 1, 1, 1, 1, 1,
0.5677278, 0.6570131, 0.3207479, 1, 1, 1, 1, 1,
0.5685636, 0.8189368, 1.229585, 1, 1, 1, 1, 1,
0.5692976, 0.4628019, 1.057343, 1, 1, 1, 1, 1,
0.5697455, 1.140847, 0.835355, 1, 1, 1, 1, 1,
0.5744631, 0.7217453, 0.3568923, 0, 0, 1, 1, 1,
0.5756754, -1.812316, 2.696904, 1, 0, 0, 1, 1,
0.5765188, 1.015123, 0.6920077, 1, 0, 0, 1, 1,
0.5832708, 0.5619798, -0.3348127, 1, 0, 0, 1, 1,
0.586394, 1.784602, -0.83408, 1, 0, 0, 1, 1,
0.5881891, -2.110273, 2.351334, 1, 0, 0, 1, 1,
0.5891182, 1.414018, 1.149227, 0, 0, 0, 1, 1,
0.5893955, -0.5804893, 3.438049, 0, 0, 0, 1, 1,
0.5967439, 1.460087, 0.74927, 0, 0, 0, 1, 1,
0.5974506, -0.3303316, 0.7819556, 0, 0, 0, 1, 1,
0.6127003, 0.5606109, 1.590813, 0, 0, 0, 1, 1,
0.6232432, -1.262501, 4.056488, 0, 0, 0, 1, 1,
0.6247465, 0.8585627, 0.3779337, 0, 0, 0, 1, 1,
0.6251816, -2.370613, 2.951396, 1, 1, 1, 1, 1,
0.629484, -0.2049283, 3.17398, 1, 1, 1, 1, 1,
0.6294934, -0.7877105, 3.171638, 1, 1, 1, 1, 1,
0.6314564, -0.354874, 2.531085, 1, 1, 1, 1, 1,
0.6339964, 0.3593839, 0.8225167, 1, 1, 1, 1, 1,
0.6471351, -0.8903852, 1.940258, 1, 1, 1, 1, 1,
0.6506377, -3.124961, 3.961245, 1, 1, 1, 1, 1,
0.653888, -1.120531, 2.675989, 1, 1, 1, 1, 1,
0.6558918, 0.02155384, 1.697525, 1, 1, 1, 1, 1,
0.6589957, 0.500597, -0.6037236, 1, 1, 1, 1, 1,
0.6592979, -0.00195566, 0.9774861, 1, 1, 1, 1, 1,
0.6611972, 0.2640508, 0.7050822, 1, 1, 1, 1, 1,
0.6616469, 0.9506919, -0.5613299, 1, 1, 1, 1, 1,
0.6631165, -0.2953645, 1.022638, 1, 1, 1, 1, 1,
0.6665273, 0.7860729, 0.1780632, 1, 1, 1, 1, 1,
0.6665725, 0.7433302, 1.242664, 0, 0, 1, 1, 1,
0.6693416, -0.9917647, 2.898014, 1, 0, 0, 1, 1,
0.6743624, 0.1049813, 1.996341, 1, 0, 0, 1, 1,
0.6804696, -0.6947117, 1.67545, 1, 0, 0, 1, 1,
0.6829419, -0.7325238, 2.652745, 1, 0, 0, 1, 1,
0.6832793, 0.6517587, 0.06148882, 1, 0, 0, 1, 1,
0.6872587, 0.07857431, 2.059466, 0, 0, 0, 1, 1,
0.6892022, 2.35539, 2.083979, 0, 0, 0, 1, 1,
0.6911013, 0.9848318, 0.02993414, 0, 0, 0, 1, 1,
0.6958819, -1.076256, 3.469985, 0, 0, 0, 1, 1,
0.7010564, 0.7484246, 0.5566605, 0, 0, 0, 1, 1,
0.7011851, 0.2750458, 2.535035, 0, 0, 0, 1, 1,
0.7042675, -0.4978947, 1.5013, 0, 0, 0, 1, 1,
0.7076471, 0.1713566, 0.2119443, 1, 1, 1, 1, 1,
0.7125008, 0.289456, 1.060681, 1, 1, 1, 1, 1,
0.7125698, 0.1412255, 1.705002, 1, 1, 1, 1, 1,
0.7133334, 0.2806094, 0.01555629, 1, 1, 1, 1, 1,
0.7210738, -1.283133, 3.686515, 1, 1, 1, 1, 1,
0.7234373, 0.1279808, -0.4193517, 1, 1, 1, 1, 1,
0.7240582, 0.552589, 2.540971, 1, 1, 1, 1, 1,
0.7243163, -1.610246, 3.383017, 1, 1, 1, 1, 1,
0.724438, -1.248744, 2.830038, 1, 1, 1, 1, 1,
0.7252508, -0.3773281, 2.463327, 1, 1, 1, 1, 1,
0.7287307, 0.3068695, 0.3921582, 1, 1, 1, 1, 1,
0.7360709, 0.1927872, 1.634256, 1, 1, 1, 1, 1,
0.7387155, 0.2911586, 1.466778, 1, 1, 1, 1, 1,
0.7454741, 1.368044, -0.1476556, 1, 1, 1, 1, 1,
0.7593213, 1.063334, 1.340115, 1, 1, 1, 1, 1,
0.7616581, -0.04078007, 1.940185, 0, 0, 1, 1, 1,
0.7729018, -0.2891208, 2.013549, 1, 0, 0, 1, 1,
0.7825643, 1.347052, -0.1050956, 1, 0, 0, 1, 1,
0.7829214, 0.8606222, 0.8265532, 1, 0, 0, 1, 1,
0.7972807, -1.276631, 3.111996, 1, 0, 0, 1, 1,
0.7983464, 0.5939977, 1.047062, 1, 0, 0, 1, 1,
0.7985536, 0.5706863, 2.879377, 0, 0, 0, 1, 1,
0.8074211, 0.07154943, 0.9375077, 0, 0, 0, 1, 1,
0.8112431, 0.06894208, 1.08655, 0, 0, 0, 1, 1,
0.8237145, 0.04470031, 1.494589, 0, 0, 0, 1, 1,
0.8242568, -2.945233, 2.163013, 0, 0, 0, 1, 1,
0.8244638, -1.835065, 2.401528, 0, 0, 0, 1, 1,
0.8322117, -0.3658331, 1.221932, 0, 0, 0, 1, 1,
0.8352138, 0.9264055, 2.089108, 1, 1, 1, 1, 1,
0.8488272, 0.3463386, 1.25125, 1, 1, 1, 1, 1,
0.84982, -0.6559667, 3.584806, 1, 1, 1, 1, 1,
0.8529987, -0.2856426, 3.479221, 1, 1, 1, 1, 1,
0.8545699, -0.6815435, 1.021937, 1, 1, 1, 1, 1,
0.8584422, 0.07675956, 2.017116, 1, 1, 1, 1, 1,
0.8621262, 0.9262185, 1.883928, 1, 1, 1, 1, 1,
0.8638869, 0.2898141, 1.693871, 1, 1, 1, 1, 1,
0.8759784, 1.174194, 0.3678001, 1, 1, 1, 1, 1,
0.8775006, 0.583357, 1.942076, 1, 1, 1, 1, 1,
0.8781, 0.8703645, 0.0814933, 1, 1, 1, 1, 1,
0.8794283, -1.138983, 2.919025, 1, 1, 1, 1, 1,
0.8863957, -1.429036, 1.961501, 1, 1, 1, 1, 1,
0.8878033, 0.8430053, 0.5079136, 1, 1, 1, 1, 1,
0.895804, 0.6943415, 1.224188, 1, 1, 1, 1, 1,
0.9004425, -0.5863135, 1.292848, 0, 0, 1, 1, 1,
0.9052516, -0.8541828, 1.331429, 1, 0, 0, 1, 1,
0.909017, 0.3815576, 0.9478517, 1, 0, 0, 1, 1,
0.9137706, 0.6997361, 0.8389487, 1, 0, 0, 1, 1,
0.9218656, -1.07841, 1.214235, 1, 0, 0, 1, 1,
0.9310609, -0.09094711, 1.394874, 1, 0, 0, 1, 1,
0.9332835, 1.395776, 2.201112, 0, 0, 0, 1, 1,
0.9342002, -1.087412, 2.283903, 0, 0, 0, 1, 1,
0.936418, -0.8067762, 0.05157282, 0, 0, 0, 1, 1,
0.9407659, -0.5730554, 0.2406882, 0, 0, 0, 1, 1,
0.9458799, -0.7649764, 2.929703, 0, 0, 0, 1, 1,
0.9462342, 1.669057, 1.198819, 0, 0, 0, 1, 1,
0.9498512, 0.60537, 0.7417169, 0, 0, 0, 1, 1,
0.9535235, -0.4967759, 1.302021, 1, 1, 1, 1, 1,
0.9578849, -0.9652017, 3.664686, 1, 1, 1, 1, 1,
0.958258, 0.304628, 2.189752, 1, 1, 1, 1, 1,
0.9584885, 0.9452026, 2.23829, 1, 1, 1, 1, 1,
0.9699252, -2.711738, 2.971898, 1, 1, 1, 1, 1,
0.9699748, -0.2871534, 2.250984, 1, 1, 1, 1, 1,
0.9719923, 0.4808344, 1.388713, 1, 1, 1, 1, 1,
0.9741845, 0.5756748, 1.339355, 1, 1, 1, 1, 1,
0.9792437, 0.7122197, 1.637961, 1, 1, 1, 1, 1,
0.9798104, -0.295698, 1.128168, 1, 1, 1, 1, 1,
0.9912188, 0.3257668, 2.172028, 1, 1, 1, 1, 1,
0.9960869, -0.1902771, 2.149451, 1, 1, 1, 1, 1,
0.9995331, -0.5996695, 3.194535, 1, 1, 1, 1, 1,
1.004752, 0.8624124, 0.4592919, 1, 1, 1, 1, 1,
1.010687, 0.1390589, -0.001967272, 1, 1, 1, 1, 1,
1.011317, 0.9666746, -1.815452, 0, 0, 1, 1, 1,
1.018579, -0.7506133, 0.6037921, 1, 0, 0, 1, 1,
1.019233, -1.610314, 1.331675, 1, 0, 0, 1, 1,
1.022485, -0.7310119, 2.034543, 1, 0, 0, 1, 1,
1.025948, 0.7313381, 1.592444, 1, 0, 0, 1, 1,
1.027859, 1.337173, 1.206166, 1, 0, 0, 1, 1,
1.029716, 0.07769033, 2.28748, 0, 0, 0, 1, 1,
1.041404, -0.5984486, 3.308542, 0, 0, 0, 1, 1,
1.041543, 0.4662853, 0.1349016, 0, 0, 0, 1, 1,
1.042388, 0.09435319, -0.5540617, 0, 0, 0, 1, 1,
1.053313, 0.4750556, -0.1469644, 0, 0, 0, 1, 1,
1.059907, 0.272644, 1.078532, 0, 0, 0, 1, 1,
1.062635, 0.1494474, -0.1838846, 0, 0, 0, 1, 1,
1.064574, -0.2385022, 1.937211, 1, 1, 1, 1, 1,
1.073129, 0.8165888, 0.820715, 1, 1, 1, 1, 1,
1.07642, -0.7302992, 3.244292, 1, 1, 1, 1, 1,
1.088863, 0.04319197, 0.7180587, 1, 1, 1, 1, 1,
1.097483, 1.415231, 0.284923, 1, 1, 1, 1, 1,
1.098474, 0.4297071, 0.911307, 1, 1, 1, 1, 1,
1.103466, -0.1097621, 1.611778, 1, 1, 1, 1, 1,
1.11354, 0.902588, 1.021768, 1, 1, 1, 1, 1,
1.116459, 1.49596, -0.5805071, 1, 1, 1, 1, 1,
1.117477, -1.149143, 1.395162, 1, 1, 1, 1, 1,
1.117592, -0.2935555, -0.09376113, 1, 1, 1, 1, 1,
1.121235, -0.9405996, 1.387546, 1, 1, 1, 1, 1,
1.122381, 1.645959, 2.152928, 1, 1, 1, 1, 1,
1.124648, -0.3229369, 1.928718, 1, 1, 1, 1, 1,
1.125154, 0.5215297, 0.9805093, 1, 1, 1, 1, 1,
1.133452, 0.1740066, 0.7602748, 0, 0, 1, 1, 1,
1.134204, -1.824782, 3.036328, 1, 0, 0, 1, 1,
1.136602, -0.6179165, 0.8317267, 1, 0, 0, 1, 1,
1.142468, 0.6295713, 0.6650981, 1, 0, 0, 1, 1,
1.145524, 0.2092477, 0.989266, 1, 0, 0, 1, 1,
1.151792, -1.643474, 2.699266, 1, 0, 0, 1, 1,
1.154246, 0.3285279, -0.3714482, 0, 0, 0, 1, 1,
1.163666, 1.454067, 2.611173, 0, 0, 0, 1, 1,
1.166838, 0.4588727, 1.997741, 0, 0, 0, 1, 1,
1.179013, -0.1155012, 2.226561, 0, 0, 0, 1, 1,
1.180017, -0.6125689, 0.3562851, 0, 0, 0, 1, 1,
1.180847, 0.6541209, 0.6795869, 0, 0, 0, 1, 1,
1.201715, -0.2297797, 0.8009389, 0, 0, 0, 1, 1,
1.201948, -0.1233999, 2.757247, 1, 1, 1, 1, 1,
1.204174, -0.9818383, 2.634264, 1, 1, 1, 1, 1,
1.204602, -0.3981261, 1.50868, 1, 1, 1, 1, 1,
1.205491, 0.7576132, 3.234804, 1, 1, 1, 1, 1,
1.207064, 1.432288, -1.677986, 1, 1, 1, 1, 1,
1.209117, 0.892752, 1.848525, 1, 1, 1, 1, 1,
1.212148, -0.322589, 1.206949, 1, 1, 1, 1, 1,
1.223909, 0.1713682, 1.200285, 1, 1, 1, 1, 1,
1.231357, 0.184326, 1.184669, 1, 1, 1, 1, 1,
1.244685, -0.3093614, 1.748125, 1, 1, 1, 1, 1,
1.24967, 1.247007, 1.668329, 1, 1, 1, 1, 1,
1.250211, 2.175198, 1.408861, 1, 1, 1, 1, 1,
1.251147, -0.3561202, 1.920816, 1, 1, 1, 1, 1,
1.252242, 0.6379217, 1.589645, 1, 1, 1, 1, 1,
1.253924, -0.3089265, 2.037001, 1, 1, 1, 1, 1,
1.260039, -0.730356, 1.154862, 0, 0, 1, 1, 1,
1.264288, -0.1668225, 0.6399365, 1, 0, 0, 1, 1,
1.268294, 0.8363987, -1.044303, 1, 0, 0, 1, 1,
1.26996, -0.1687292, 3.305244, 1, 0, 0, 1, 1,
1.274443, 0.4883668, 1.621848, 1, 0, 0, 1, 1,
1.28485, 0.1394129, 1.612761, 1, 0, 0, 1, 1,
1.288187, -0.4016327, 1.225384, 0, 0, 0, 1, 1,
1.290753, -0.1497942, 2.245201, 0, 0, 0, 1, 1,
1.294092, 0.7727585, -1.087988, 0, 0, 0, 1, 1,
1.296732, 0.841087, 1.752644, 0, 0, 0, 1, 1,
1.307245, 0.5925541, 1.307626, 0, 0, 0, 1, 1,
1.311125, -0.7478905, 0.6779251, 0, 0, 0, 1, 1,
1.340749, -1.340345, 2.643556, 0, 0, 0, 1, 1,
1.347411, 0.8016472, 1.838465, 1, 1, 1, 1, 1,
1.349172, 0.06216022, 2.633006, 1, 1, 1, 1, 1,
1.358887, -1.60221, 2.538631, 1, 1, 1, 1, 1,
1.361671, -0.2022167, 1.77389, 1, 1, 1, 1, 1,
1.366458, 1.679243, 0.8994412, 1, 1, 1, 1, 1,
1.387033, -0.810547, 2.966938, 1, 1, 1, 1, 1,
1.387126, 1.460214, 0.627088, 1, 1, 1, 1, 1,
1.399656, -1.713153, 2.764166, 1, 1, 1, 1, 1,
1.402228, -1.070444, 2.597183, 1, 1, 1, 1, 1,
1.406958, -0.3214549, 0.893863, 1, 1, 1, 1, 1,
1.409292, 1.756436, 0.2924387, 1, 1, 1, 1, 1,
1.410071, 0.4013605, 0.345904, 1, 1, 1, 1, 1,
1.418805, -0.7750523, 0.5128552, 1, 1, 1, 1, 1,
1.431172, -0.1313744, 0.6346276, 1, 1, 1, 1, 1,
1.45043, -0.4594197, 1.684507, 1, 1, 1, 1, 1,
1.455886, 0.1020735, -0.5086775, 0, 0, 1, 1, 1,
1.457055, -2.620162, 4.453971, 1, 0, 0, 1, 1,
1.469526, 1.64595, 0.7237117, 1, 0, 0, 1, 1,
1.470152, 0.4840558, 2.329275, 1, 0, 0, 1, 1,
1.477363, 0.4364949, 0.690249, 1, 0, 0, 1, 1,
1.491566, 0.7164254, 1.809986, 1, 0, 0, 1, 1,
1.491648, 1.0329, 2.418395, 0, 0, 0, 1, 1,
1.493104, -0.395552, 2.62687, 0, 0, 0, 1, 1,
1.493463, 1.651779, 0.9692058, 0, 0, 0, 1, 1,
1.49947, 0.1295811, 1.677717, 0, 0, 0, 1, 1,
1.50443, -0.9329072, 2.977065, 0, 0, 0, 1, 1,
1.509561, -0.7541846, 2.714127, 0, 0, 0, 1, 1,
1.5287, -1.539433, 4.792964, 0, 0, 0, 1, 1,
1.541358, -0.9009651, 1.862074, 1, 1, 1, 1, 1,
1.550197, -1.5129, 2.296143, 1, 1, 1, 1, 1,
1.557415, 0.853224, 1.502979, 1, 1, 1, 1, 1,
1.558144, -1.211386, 2.055187, 1, 1, 1, 1, 1,
1.558703, 1.263594, 1.555111, 1, 1, 1, 1, 1,
1.568635, -0.4517119, 1.402015, 1, 1, 1, 1, 1,
1.56979, 0.7787059, 0.6126931, 1, 1, 1, 1, 1,
1.582313, -0.6671645, 0.8918791, 1, 1, 1, 1, 1,
1.590308, 1.024824, -0.7344112, 1, 1, 1, 1, 1,
1.592821, -0.5185387, 2.291974, 1, 1, 1, 1, 1,
1.596183, -0.983331, 1.366912, 1, 1, 1, 1, 1,
1.598322, 1.358572, 2.285292, 1, 1, 1, 1, 1,
1.603413, -1.831851, 1.26705, 1, 1, 1, 1, 1,
1.63483, -0.5049972, 2.431421, 1, 1, 1, 1, 1,
1.636637, 1.298162, 2.557184, 1, 1, 1, 1, 1,
1.647971, 0.7544388, 0.308231, 0, 0, 1, 1, 1,
1.654268, 1.888032, 0.7254613, 1, 0, 0, 1, 1,
1.658729, 0.4085742, 1.55364, 1, 0, 0, 1, 1,
1.659891, 0.3897527, 3.799959, 1, 0, 0, 1, 1,
1.675834, -0.01861558, 0.4685459, 1, 0, 0, 1, 1,
1.676142, 1.294457, 0.08935861, 1, 0, 0, 1, 1,
1.695177, -0.7141127, 2.723408, 0, 0, 0, 1, 1,
1.701859, -0.1040566, 2.206806, 0, 0, 0, 1, 1,
1.705488, 0.6713659, 1.38586, 0, 0, 0, 1, 1,
1.705882, 0.03877508, 1.5149, 0, 0, 0, 1, 1,
1.722302, -1.48842, 0.9184681, 0, 0, 0, 1, 1,
1.738552, -0.15657, -0.4698122, 0, 0, 0, 1, 1,
1.740657, -0.2771256, 1.507863, 0, 0, 0, 1, 1,
1.742738, -0.4282729, 1.695338, 1, 1, 1, 1, 1,
1.744043, -1.738629, 3.159703, 1, 1, 1, 1, 1,
1.74594, -1.82869, 3.068595, 1, 1, 1, 1, 1,
1.748535, -1.338626, 2.940024, 1, 1, 1, 1, 1,
1.750077, -1.078665, 2.46719, 1, 1, 1, 1, 1,
1.751559, 2.743278, 0.1815726, 1, 1, 1, 1, 1,
1.754909, 2.044525, 1.359488, 1, 1, 1, 1, 1,
1.781397, -0.4590085, 3.063325, 1, 1, 1, 1, 1,
1.801559, 1.002643, 0.8460423, 1, 1, 1, 1, 1,
1.806407, 0.7578628, 1.287897, 1, 1, 1, 1, 1,
1.812495, -1.523866, 1.040894, 1, 1, 1, 1, 1,
1.822099, 0.09032572, 1.596984, 1, 1, 1, 1, 1,
1.827514, -0.06742036, 1.16456, 1, 1, 1, 1, 1,
1.837815, 0.3092816, -1.365939, 1, 1, 1, 1, 1,
1.89426, 1.663967, 2.086423, 1, 1, 1, 1, 1,
1.921495, -1.423396, 2.063722, 0, 0, 1, 1, 1,
1.98007, 0.3947537, 1.58926, 1, 0, 0, 1, 1,
2.018024, -1.486454, 1.859525, 1, 0, 0, 1, 1,
2.030751, -0.382605, 1.688458, 1, 0, 0, 1, 1,
2.077888, -0.4834894, 1.924632, 1, 0, 0, 1, 1,
2.084262, -0.9507566, 0.1562524, 1, 0, 0, 1, 1,
2.133464, 0.5905657, 1.222086, 0, 0, 0, 1, 1,
2.205841, 0.09727556, 1.354143, 0, 0, 0, 1, 1,
2.241055, -0.4971973, 1.345562, 0, 0, 0, 1, 1,
2.246419, -1.560062, 1.021537, 0, 0, 0, 1, 1,
2.303831, 1.497064, 2.144132, 0, 0, 0, 1, 1,
2.335037, -1.09883, 3.076331, 0, 0, 0, 1, 1,
2.33684, 0.340537, 0.6023469, 0, 0, 0, 1, 1,
2.396693, 0.3312919, 0.5074764, 1, 1, 1, 1, 1,
2.423132, -0.650544, 1.98562, 1, 1, 1, 1, 1,
2.429708, -0.4730968, 1.841718, 1, 1, 1, 1, 1,
2.431633, -1.424359, 3.10473, 1, 1, 1, 1, 1,
2.606589, 0.126661, -0.09725179, 1, 1, 1, 1, 1,
3.060735, 0.01706431, 3.170498, 1, 1, 1, 1, 1,
3.414135, 0.1413668, 1.738026, 1, 1, 1, 1, 1
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
var radius = 10.69255;
var distance = 37.55715;
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
mvMatrix.translate( 0.06835103, 0.01297045, 0.01329279 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.55715);
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
