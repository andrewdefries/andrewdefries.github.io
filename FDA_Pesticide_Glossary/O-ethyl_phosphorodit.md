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
-3.213298, -0.515604, -3.791287, 1, 0, 0, 1,
-2.953513, -2.012359, -1.2622, 1, 0.007843138, 0, 1,
-2.662227, -0.06813499, -0.8008226, 1, 0.01176471, 0, 1,
-2.366084, 0.8519722, 1.037718, 1, 0.01960784, 0, 1,
-2.33054, 1.180123, -1.157259, 1, 0.02352941, 0, 1,
-2.29254, -0.6188112, -1.405943, 1, 0.03137255, 0, 1,
-2.162512, 1.580162, -2.060083, 1, 0.03529412, 0, 1,
-2.139821, 0.8212623, -1.789281, 1, 0.04313726, 0, 1,
-2.126953, 0.2299384, -2.405592, 1, 0.04705882, 0, 1,
-2.124155, 0.4722276, -1.372764, 1, 0.05490196, 0, 1,
-2.078874, 0.0392106, -1.311566, 1, 0.05882353, 0, 1,
-2.036288, -0.495352, -1.473382, 1, 0.06666667, 0, 1,
-2.016444, 1.024449, -1.30867, 1, 0.07058824, 0, 1,
-2.008824, 0.9966211, -0.1979208, 1, 0.07843138, 0, 1,
-2.008558, -1.626956, -1.126499, 1, 0.08235294, 0, 1,
-2.007284, 0.06282332, -0.9427862, 1, 0.09019608, 0, 1,
-2.003307, 1.241792, -0.9873623, 1, 0.09411765, 0, 1,
-1.988501, 0.1909179, -2.775469, 1, 0.1019608, 0, 1,
-1.953585, -1.398621, -0.4810922, 1, 0.1098039, 0, 1,
-1.940689, 1.230691, -5.364877, 1, 0.1137255, 0, 1,
-1.923827, 0.4408283, -1.395218, 1, 0.1215686, 0, 1,
-1.887351, -0.9793283, -2.554168, 1, 0.1254902, 0, 1,
-1.865675, -0.1140238, -2.98497, 1, 0.1333333, 0, 1,
-1.847435, -2.295986, -2.440221, 1, 0.1372549, 0, 1,
-1.804568, -0.5865874, -2.255414, 1, 0.145098, 0, 1,
-1.799286, -1.717442, -2.968962, 1, 0.1490196, 0, 1,
-1.795354, 1.014139, -1.775945, 1, 0.1568628, 0, 1,
-1.778217, -0.1633733, -1.789643, 1, 0.1607843, 0, 1,
-1.735297, 1.093553, -1.976642, 1, 0.1686275, 0, 1,
-1.721951, 0.971649, -1.556625, 1, 0.172549, 0, 1,
-1.709313, 0.7562926, -1.136719, 1, 0.1803922, 0, 1,
-1.709222, 1.199943, -2.26799, 1, 0.1843137, 0, 1,
-1.704002, 0.1543589, -1.505367, 1, 0.1921569, 0, 1,
-1.696738, 1.344555, -1.394025, 1, 0.1960784, 0, 1,
-1.689995, 0.1040324, -0.1944713, 1, 0.2039216, 0, 1,
-1.688166, -0.2017911, -1.540058, 1, 0.2117647, 0, 1,
-1.688133, 0.5757185, 0.1161609, 1, 0.2156863, 0, 1,
-1.679408, 0.07344412, -2.465558, 1, 0.2235294, 0, 1,
-1.665943, 2.106209, 0.7029955, 1, 0.227451, 0, 1,
-1.647123, 0.7332789, -1.485548, 1, 0.2352941, 0, 1,
-1.642768, 1.372321, -1.108599, 1, 0.2392157, 0, 1,
-1.639771, -0.4605986, -1.907181, 1, 0.2470588, 0, 1,
-1.621168, 0.8023731, -0.8808762, 1, 0.2509804, 0, 1,
-1.618568, 2.643656, -0.6953722, 1, 0.2588235, 0, 1,
-1.615202, 0.7264109, -0.6018615, 1, 0.2627451, 0, 1,
-1.611181, 1.677675, -2.052603, 1, 0.2705882, 0, 1,
-1.549402, 1.029085, 0.1059272, 1, 0.2745098, 0, 1,
-1.540765, -1.209104, -2.524134, 1, 0.282353, 0, 1,
-1.526374, 0.8761739, -1.416508, 1, 0.2862745, 0, 1,
-1.523252, 1.024963, -0.573338, 1, 0.2941177, 0, 1,
-1.520618, 1.260189, 0.1250201, 1, 0.3019608, 0, 1,
-1.511387, 0.2787387, -1.343827, 1, 0.3058824, 0, 1,
-1.510599, -0.09240809, -1.58935, 1, 0.3137255, 0, 1,
-1.497301, -0.5743718, -1.825347, 1, 0.3176471, 0, 1,
-1.494058, 1.18901, 0.1562538, 1, 0.3254902, 0, 1,
-1.479732, 0.7954411, -0.1282673, 1, 0.3294118, 0, 1,
-1.472647, 0.969678, -0.8984482, 1, 0.3372549, 0, 1,
-1.456832, 0.04334567, -2.594274, 1, 0.3411765, 0, 1,
-1.456347, 0.6494951, -0.7147576, 1, 0.3490196, 0, 1,
-1.439712, 0.7028222, -0.0004839158, 1, 0.3529412, 0, 1,
-1.430827, 0.01369915, -2.678612, 1, 0.3607843, 0, 1,
-1.430481, -0.3609673, -1.750686, 1, 0.3647059, 0, 1,
-1.429299, 1.741099, -1.04064, 1, 0.372549, 0, 1,
-1.429026, 0.260446, -1.166823, 1, 0.3764706, 0, 1,
-1.406323, 0.6835623, -1.204402, 1, 0.3843137, 0, 1,
-1.404377, -0.414027, -2.669405, 1, 0.3882353, 0, 1,
-1.402376, 0.2488411, -2.637199, 1, 0.3960784, 0, 1,
-1.402193, 0.3697303, -0.7632564, 1, 0.4039216, 0, 1,
-1.392082, 0.5459586, -1.434885, 1, 0.4078431, 0, 1,
-1.391654, -0.3018585, -0.1918935, 1, 0.4156863, 0, 1,
-1.391197, 0.7292984, -0.08538485, 1, 0.4196078, 0, 1,
-1.374573, -0.8087975, -2.522975, 1, 0.427451, 0, 1,
-1.369461, -0.9213273, -2.31541, 1, 0.4313726, 0, 1,
-1.349008, -0.723267, -0.1685972, 1, 0.4392157, 0, 1,
-1.338794, -1.51142, -3.710146, 1, 0.4431373, 0, 1,
-1.327911, 0.4864684, -2.548205, 1, 0.4509804, 0, 1,
-1.327752, -0.09480131, -2.008446, 1, 0.454902, 0, 1,
-1.323568, -0.5745302, -2.660668, 1, 0.4627451, 0, 1,
-1.305219, 0.09102748, 0.01877742, 1, 0.4666667, 0, 1,
-1.304439, -0.06747033, -0.95613, 1, 0.4745098, 0, 1,
-1.304187, 1.097593, 0.8532965, 1, 0.4784314, 0, 1,
-1.293677, -0.5648426, -3.822866, 1, 0.4862745, 0, 1,
-1.291602, 2.15519, -1.114323, 1, 0.4901961, 0, 1,
-1.280854, 0.5516113, -3.354092, 1, 0.4980392, 0, 1,
-1.270946, 0.4159735, -0.3217377, 1, 0.5058824, 0, 1,
-1.266893, 0.7577621, 0.3234396, 1, 0.509804, 0, 1,
-1.263223, 1.743727, 0.3253971, 1, 0.5176471, 0, 1,
-1.258197, 0.5425648, -1.571337, 1, 0.5215687, 0, 1,
-1.257139, 1.303751, -0.001573888, 1, 0.5294118, 0, 1,
-1.255849, 0.2611678, -2.63333, 1, 0.5333334, 0, 1,
-1.254233, 0.6305107, -1.256808, 1, 0.5411765, 0, 1,
-1.244767, 0.5851106, 0.03248842, 1, 0.5450981, 0, 1,
-1.239014, -0.2894682, -2.949345, 1, 0.5529412, 0, 1,
-1.238292, 0.4440233, 0.03663698, 1, 0.5568628, 0, 1,
-1.238286, 0.4511813, -0.8488298, 1, 0.5647059, 0, 1,
-1.235331, -0.3286392, -1.223538, 1, 0.5686275, 0, 1,
-1.228253, 0.8074778, -0.5221192, 1, 0.5764706, 0, 1,
-1.222478, -0.4138178, -2.846014, 1, 0.5803922, 0, 1,
-1.214328, 1.119333, -0.2225726, 1, 0.5882353, 0, 1,
-1.209063, 0.8227482, -0.4212516, 1, 0.5921569, 0, 1,
-1.207652, 1.347209, 1.222625, 1, 0.6, 0, 1,
-1.197078, -1.377509, -2.461155, 1, 0.6078432, 0, 1,
-1.196196, 1.517761, -2.495775, 1, 0.6117647, 0, 1,
-1.187644, 0.8356335, -1.27572, 1, 0.6196079, 0, 1,
-1.181927, 0.7992055, 1.312097, 1, 0.6235294, 0, 1,
-1.177379, -0.7196813, -1.611586, 1, 0.6313726, 0, 1,
-1.165514, 1.492249, -2.24747, 1, 0.6352941, 0, 1,
-1.163027, -0.269795, -1.018984, 1, 0.6431373, 0, 1,
-1.156922, -0.3643709, -2.265703, 1, 0.6470588, 0, 1,
-1.150483, 0.08052545, -1.186309, 1, 0.654902, 0, 1,
-1.14782, 1.871182, -1.773821, 1, 0.6588235, 0, 1,
-1.147734, 0.4702656, -1.980171, 1, 0.6666667, 0, 1,
-1.146687, 0.5660172, 0.1470707, 1, 0.6705883, 0, 1,
-1.139248, -0.6245806, -2.178728, 1, 0.6784314, 0, 1,
-1.132627, -1.141479, -1.545632, 1, 0.682353, 0, 1,
-1.124405, 1.310618, -1.992368, 1, 0.6901961, 0, 1,
-1.123268, 0.7356943, 2.459726, 1, 0.6941177, 0, 1,
-1.119554, -1.018146, -2.558007, 1, 0.7019608, 0, 1,
-1.117754, 1.23047, -2.406106, 1, 0.7098039, 0, 1,
-1.114257, -0.7278975, -2.148284, 1, 0.7137255, 0, 1,
-1.111856, 1.118668, -0.1294197, 1, 0.7215686, 0, 1,
-1.109621, 0.257343, -1.062248, 1, 0.7254902, 0, 1,
-1.108716, 1.492849, -0.7212779, 1, 0.7333333, 0, 1,
-1.104498, -0.03628203, -3.761573, 1, 0.7372549, 0, 1,
-1.098808, 0.9769571, -1.176157, 1, 0.7450981, 0, 1,
-1.097357, 1.785122, 0.2208016, 1, 0.7490196, 0, 1,
-1.083626, 0.8028848, -1.903051, 1, 0.7568628, 0, 1,
-1.069302, -0.6863106, -0.7790682, 1, 0.7607843, 0, 1,
-1.060596, -0.8768874, -4.688285, 1, 0.7686275, 0, 1,
-1.057064, -1.21697, -2.589572, 1, 0.772549, 0, 1,
-1.056635, -0.1654857, -1.955071, 1, 0.7803922, 0, 1,
-1.054184, -0.5254914, -2.261029, 1, 0.7843137, 0, 1,
-1.033177, -1.705647, -2.546648, 1, 0.7921569, 0, 1,
-1.031639, -0.8430527, -3.577403, 1, 0.7960784, 0, 1,
-1.030003, -0.4799593, -0.6092135, 1, 0.8039216, 0, 1,
-1.02797, -0.4401185, -2.51403, 1, 0.8117647, 0, 1,
-1.026693, -0.8285196, -1.996335, 1, 0.8156863, 0, 1,
-1.012856, 0.4943011, -1.747139, 1, 0.8235294, 0, 1,
-1.012518, -0.8604209, -4.119253, 1, 0.827451, 0, 1,
-1.008482, -1.834715, -2.616693, 1, 0.8352941, 0, 1,
-1.003095, 0.3745808, -0.9195813, 1, 0.8392157, 0, 1,
-0.9885285, 1.444733, -0.2450253, 1, 0.8470588, 0, 1,
-0.9877243, -1.001486, -2.544774, 1, 0.8509804, 0, 1,
-0.9840926, 1.687004, 0.3826669, 1, 0.8588235, 0, 1,
-0.9819756, -0.7753912, -2.76631, 1, 0.8627451, 0, 1,
-0.980545, -0.8591421, -2.915991, 1, 0.8705882, 0, 1,
-0.9799037, -1.027902, -1.151778, 1, 0.8745098, 0, 1,
-0.9795477, -0.392903, -1.724435, 1, 0.8823529, 0, 1,
-0.9688527, -0.9762074, -1.738295, 1, 0.8862745, 0, 1,
-0.9623141, -1.496745, -2.226165, 1, 0.8941177, 0, 1,
-0.9579626, 1.572014, -0.1727029, 1, 0.8980392, 0, 1,
-0.9524136, 1.847857, -1.36125, 1, 0.9058824, 0, 1,
-0.9389242, 1.557989, -1.610417, 1, 0.9137255, 0, 1,
-0.9371634, 0.813015, -2.488466, 1, 0.9176471, 0, 1,
-0.9335415, 0.2605175, -1.480768, 1, 0.9254902, 0, 1,
-0.9326572, 1.509463, 0.3998604, 1, 0.9294118, 0, 1,
-0.9308397, -0.3864198, -3.097569, 1, 0.9372549, 0, 1,
-0.9288667, 0.8743113, -0.6374102, 1, 0.9411765, 0, 1,
-0.9259601, -0.3504429, -2.967576, 1, 0.9490196, 0, 1,
-0.9072248, -0.9870518, 0.2123156, 1, 0.9529412, 0, 1,
-0.9065444, -0.9118502, -3.017718, 1, 0.9607843, 0, 1,
-0.9061931, -0.8161744, -2.382292, 1, 0.9647059, 0, 1,
-0.8995506, 0.8491237, -1.243883, 1, 0.972549, 0, 1,
-0.8984969, 0.2568985, -1.00238, 1, 0.9764706, 0, 1,
-0.892597, -0.4308424, -0.7239943, 1, 0.9843137, 0, 1,
-0.8912595, 0.1391442, -2.554688, 1, 0.9882353, 0, 1,
-0.8872831, -0.3810208, -3.292852, 1, 0.9960784, 0, 1,
-0.8836703, 0.4705224, 0.2325221, 0.9960784, 1, 0, 1,
-0.8795481, -0.6890432, -2.232909, 0.9921569, 1, 0, 1,
-0.8794397, 0.3776597, 0.01899836, 0.9843137, 1, 0, 1,
-0.8706663, -1.829461, -4.525839, 0.9803922, 1, 0, 1,
-0.8667912, -0.9047568, -1.759972, 0.972549, 1, 0, 1,
-0.864513, -2.77612, -1.868423, 0.9686275, 1, 0, 1,
-0.8622589, -0.8874028, -2.374214, 0.9607843, 1, 0, 1,
-0.8622013, 1.515587, 0.3629855, 0.9568627, 1, 0, 1,
-0.8605651, -1.203256, -4.167566, 0.9490196, 1, 0, 1,
-0.856699, 1.653725, -0.04123575, 0.945098, 1, 0, 1,
-0.8556554, 0.6958315, -0.695917, 0.9372549, 1, 0, 1,
-0.8546019, 0.7924106, 0.3196059, 0.9333333, 1, 0, 1,
-0.8519822, 1.013054, -0.8548809, 0.9254902, 1, 0, 1,
-0.8456567, -0.4689651, -2.429614, 0.9215686, 1, 0, 1,
-0.8430951, -0.1643888, -2.571905, 0.9137255, 1, 0, 1,
-0.8358703, -2.288909, -1.32294, 0.9098039, 1, 0, 1,
-0.8223692, 0.02842944, -2.692377, 0.9019608, 1, 0, 1,
-0.8219026, -0.7282115, -3.798768, 0.8941177, 1, 0, 1,
-0.8211414, -0.5716912, -1.112125, 0.8901961, 1, 0, 1,
-0.8176067, 0.01023378, -1.645365, 0.8823529, 1, 0, 1,
-0.8141837, 0.559989, -0.9686042, 0.8784314, 1, 0, 1,
-0.8139305, 2.193847, 0.683187, 0.8705882, 1, 0, 1,
-0.8133305, -1.263474, -2.724887, 0.8666667, 1, 0, 1,
-0.8130837, 0.2277863, -1.897658, 0.8588235, 1, 0, 1,
-0.812175, 1.64471, -0.5015067, 0.854902, 1, 0, 1,
-0.8121443, -0.9870278, -2.808727, 0.8470588, 1, 0, 1,
-0.8111243, -0.7017739, -3.303336, 0.8431373, 1, 0, 1,
-0.8096394, 0.7095919, -2.761558, 0.8352941, 1, 0, 1,
-0.8095487, 1.464849, 0.6640546, 0.8313726, 1, 0, 1,
-0.803709, 0.7899471, -1.986618, 0.8235294, 1, 0, 1,
-0.8034918, 0.1348721, -2.026293, 0.8196079, 1, 0, 1,
-0.8019405, 0.3422637, -0.8134853, 0.8117647, 1, 0, 1,
-0.8012301, -0.6783746, -1.406906, 0.8078431, 1, 0, 1,
-0.7968652, 0.4838415, -2.959074, 0.8, 1, 0, 1,
-0.7942371, 1.176806, -2.386652, 0.7921569, 1, 0, 1,
-0.794001, -0.5396068, -4.805958, 0.7882353, 1, 0, 1,
-0.7934529, -0.07853774, -1.788708, 0.7803922, 1, 0, 1,
-0.7914, 0.7283422, -0.9131351, 0.7764706, 1, 0, 1,
-0.7843312, -0.1987891, -1.094576, 0.7686275, 1, 0, 1,
-0.7811434, -0.2600251, -2.004704, 0.7647059, 1, 0, 1,
-0.7801893, -0.07407802, -1.893524, 0.7568628, 1, 0, 1,
-0.7800409, -0.4131207, -2.253046, 0.7529412, 1, 0, 1,
-0.7772774, -1.035565, -1.411726, 0.7450981, 1, 0, 1,
-0.7736802, -0.05667752, -3.149605, 0.7411765, 1, 0, 1,
-0.7689624, 0.4521412, -0.7982282, 0.7333333, 1, 0, 1,
-0.7684896, -0.9896268, -2.908613, 0.7294118, 1, 0, 1,
-0.7645748, -0.03530955, -2.180214, 0.7215686, 1, 0, 1,
-0.7641651, -0.3656768, -1.84664, 0.7176471, 1, 0, 1,
-0.7605526, -0.1509482, -2.338314, 0.7098039, 1, 0, 1,
-0.7574297, -0.1148193, -3.743984, 0.7058824, 1, 0, 1,
-0.7531938, -0.123872, -0.9472724, 0.6980392, 1, 0, 1,
-0.7523027, 1.060343, 0.5180969, 0.6901961, 1, 0, 1,
-0.7360083, 0.2157345, -0.9491557, 0.6862745, 1, 0, 1,
-0.7357298, -0.1779426, -3.435843, 0.6784314, 1, 0, 1,
-0.7353733, 0.7520474, 0.4599246, 0.6745098, 1, 0, 1,
-0.7346012, 1.451859, -1.044636, 0.6666667, 1, 0, 1,
-0.7329983, 0.07717284, -0.8055493, 0.6627451, 1, 0, 1,
-0.7326469, -0.02592628, -0.594199, 0.654902, 1, 0, 1,
-0.7322395, 1.72869, -0.1858406, 0.6509804, 1, 0, 1,
-0.7305606, -0.4832848, -3.540524, 0.6431373, 1, 0, 1,
-0.7304485, -0.5505947, -0.6989313, 0.6392157, 1, 0, 1,
-0.7289594, 0.07654878, -1.21598, 0.6313726, 1, 0, 1,
-0.726606, -0.7655271, -4.223285, 0.627451, 1, 0, 1,
-0.7261186, 0.1910896, -2.072098, 0.6196079, 1, 0, 1,
-0.7256162, 0.9082787, -1.02658, 0.6156863, 1, 0, 1,
-0.7207932, 1.33939, 1.404492, 0.6078432, 1, 0, 1,
-0.7180897, -0.6726295, -2.80615, 0.6039216, 1, 0, 1,
-0.7169113, 0.05955609, -1.893027, 0.5960785, 1, 0, 1,
-0.7128932, -1.669654, -3.938551, 0.5882353, 1, 0, 1,
-0.7127607, -1.263135, -1.124396, 0.5843138, 1, 0, 1,
-0.7096764, -0.6503711, -2.495312, 0.5764706, 1, 0, 1,
-0.7069851, -0.1140778, -1.960934, 0.572549, 1, 0, 1,
-0.6965296, -1.067998, -1.065695, 0.5647059, 1, 0, 1,
-0.6951092, -0.4560137, -0.8435733, 0.5607843, 1, 0, 1,
-0.6944778, -0.03522684, -0.6361443, 0.5529412, 1, 0, 1,
-0.6932231, -0.2643884, 0.0083067, 0.5490196, 1, 0, 1,
-0.6925827, -1.952556, -3.199996, 0.5411765, 1, 0, 1,
-0.6904864, -0.1845145, -1.386406, 0.5372549, 1, 0, 1,
-0.6873052, 1.874949, -0.5736259, 0.5294118, 1, 0, 1,
-0.6860906, -0.5547768, -2.192491, 0.5254902, 1, 0, 1,
-0.6759815, 0.1738184, -2.354603, 0.5176471, 1, 0, 1,
-0.6737815, 1.672363, -0.3453892, 0.5137255, 1, 0, 1,
-0.6635759, 0.3098075, -0.7332326, 0.5058824, 1, 0, 1,
-0.6631347, -0.2261119, -1.662336, 0.5019608, 1, 0, 1,
-0.6615725, 1.220411, 0.05398168, 0.4941176, 1, 0, 1,
-0.6614166, 0.4550839, -2.371306, 0.4862745, 1, 0, 1,
-0.6568937, 1.22907, -0.7847068, 0.4823529, 1, 0, 1,
-0.6557318, -1.824194, -3.95336, 0.4745098, 1, 0, 1,
-0.6538197, 1.698941, -1.14467, 0.4705882, 1, 0, 1,
-0.6523589, -1.377675, -1.276767, 0.4627451, 1, 0, 1,
-0.6478547, 0.008701066, -1.170188, 0.4588235, 1, 0, 1,
-0.6478469, 0.2389657, -0.4112627, 0.4509804, 1, 0, 1,
-0.6458619, 0.9024264, 0.7816925, 0.4470588, 1, 0, 1,
-0.6453597, -1.649237, -5.306225, 0.4392157, 1, 0, 1,
-0.6452391, 0.6288862, -2.050952, 0.4352941, 1, 0, 1,
-0.6414188, -0.1829796, -2.037466, 0.427451, 1, 0, 1,
-0.6406907, 0.4732495, -0.074968, 0.4235294, 1, 0, 1,
-0.6371831, 0.944157, 0.4897742, 0.4156863, 1, 0, 1,
-0.6288342, -0.6216629, -1.535704, 0.4117647, 1, 0, 1,
-0.6265465, 0.07168029, -0.9578033, 0.4039216, 1, 0, 1,
-0.6233693, -2.027069, -3.416539, 0.3960784, 1, 0, 1,
-0.6222066, 0.5207978, -0.1923451, 0.3921569, 1, 0, 1,
-0.6187458, -0.6179997, -3.41403, 0.3843137, 1, 0, 1,
-0.6182104, -1.471489, -1.795783, 0.3803922, 1, 0, 1,
-0.6176556, -0.2940847, -2.049407, 0.372549, 1, 0, 1,
-0.6126627, -1.380896, -2.538621, 0.3686275, 1, 0, 1,
-0.6084442, 0.1213735, -0.6699024, 0.3607843, 1, 0, 1,
-0.6016994, -0.8196943, -2.550852, 0.3568628, 1, 0, 1,
-0.6006796, -0.06128775, -1.69568, 0.3490196, 1, 0, 1,
-0.5978978, 1.351048, -0.4378687, 0.345098, 1, 0, 1,
-0.5960758, -0.1211288, -0.142928, 0.3372549, 1, 0, 1,
-0.5952134, 0.09715104, -0.7505788, 0.3333333, 1, 0, 1,
-0.5921709, -1.205399, -1.883237, 0.3254902, 1, 0, 1,
-0.5817147, -2.095849, -2.382587, 0.3215686, 1, 0, 1,
-0.580566, -0.4909748, -0.7034906, 0.3137255, 1, 0, 1,
-0.5798956, 0.2840284, -0.9986493, 0.3098039, 1, 0, 1,
-0.5790949, 1.182973, -0.6831787, 0.3019608, 1, 0, 1,
-0.5787088, 0.3264397, -0.4609743, 0.2941177, 1, 0, 1,
-0.5760335, 1.126737, -0.4725057, 0.2901961, 1, 0, 1,
-0.5736412, 0.9677145, 0.800048, 0.282353, 1, 0, 1,
-0.5710052, -0.8433397, -1.494165, 0.2784314, 1, 0, 1,
-0.5677205, -1.088659, -2.744386, 0.2705882, 1, 0, 1,
-0.5601599, 0.5594606, -0.4598252, 0.2666667, 1, 0, 1,
-0.5584868, -1.259949, -1.282099, 0.2588235, 1, 0, 1,
-0.5499862, -1.773074, -1.593582, 0.254902, 1, 0, 1,
-0.5482889, -0.2501164, -2.437107, 0.2470588, 1, 0, 1,
-0.5470492, -1.595183, -2.711159, 0.2431373, 1, 0, 1,
-0.5460702, -0.8670561, -3.965822, 0.2352941, 1, 0, 1,
-0.5451216, 0.5118697, -1.928787, 0.2313726, 1, 0, 1,
-0.5435534, 0.6717632, -0.1244402, 0.2235294, 1, 0, 1,
-0.5413622, -0.4649103, -3.1064, 0.2196078, 1, 0, 1,
-0.5401986, -0.3187156, -1.057611, 0.2117647, 1, 0, 1,
-0.5397306, 0.8305861, -0.5485122, 0.2078431, 1, 0, 1,
-0.5360654, -1.37316, -3.199841, 0.2, 1, 0, 1,
-0.5349163, 0.2217587, -1.152626, 0.1921569, 1, 0, 1,
-0.5329134, -0.3714901, -1.166932, 0.1882353, 1, 0, 1,
-0.5311518, 1.449273, -2.064482, 0.1803922, 1, 0, 1,
-0.5300264, -0.3396938, -1.619307, 0.1764706, 1, 0, 1,
-0.5255671, -0.6126547, -3.039254, 0.1686275, 1, 0, 1,
-0.5231903, 1.21979, 0.566049, 0.1647059, 1, 0, 1,
-0.5226133, 1.133183, 0.1857831, 0.1568628, 1, 0, 1,
-0.521163, -0.6692835, -1.218948, 0.1529412, 1, 0, 1,
-0.5175814, -1.100835, -3.394648, 0.145098, 1, 0, 1,
-0.5167035, 0.2947671, 0.08051184, 0.1411765, 1, 0, 1,
-0.5125185, 0.5880412, 0.5454291, 0.1333333, 1, 0, 1,
-0.5108709, 1.208525, 0.2149858, 0.1294118, 1, 0, 1,
-0.5107545, -0.5919048, -2.81546, 0.1215686, 1, 0, 1,
-0.5064218, -1.011278, -2.038669, 0.1176471, 1, 0, 1,
-0.506379, 1.524353, -2.080928, 0.1098039, 1, 0, 1,
-0.5049086, -1.947126, -3.453406, 0.1058824, 1, 0, 1,
-0.5024144, -0.5556597, -2.278398, 0.09803922, 1, 0, 1,
-0.5010412, 0.2560067, -0.1157157, 0.09019608, 1, 0, 1,
-0.4985834, 0.03764142, -2.391941, 0.08627451, 1, 0, 1,
-0.4976124, 2.271833, 0.2731958, 0.07843138, 1, 0, 1,
-0.493687, 1.536638, -0.1165289, 0.07450981, 1, 0, 1,
-0.4926966, 0.7321339, -1.407963, 0.06666667, 1, 0, 1,
-0.4869332, 0.4726273, -1.398985, 0.0627451, 1, 0, 1,
-0.4867564, -1.174057, -2.495175, 0.05490196, 1, 0, 1,
-0.4811648, 0.02386474, -4.146661, 0.05098039, 1, 0, 1,
-0.4795472, 1.716938, -0.6003221, 0.04313726, 1, 0, 1,
-0.4788456, 0.2558647, -2.033518, 0.03921569, 1, 0, 1,
-0.4729158, -0.2704456, -2.525923, 0.03137255, 1, 0, 1,
-0.4722843, -0.08863439, -1.040798, 0.02745098, 1, 0, 1,
-0.4710968, 0.6564437, -0.548889, 0.01960784, 1, 0, 1,
-0.470335, -1.400081, -3.608167, 0.01568628, 1, 0, 1,
-0.4691585, 0.6642889, -2.27581, 0.007843138, 1, 0, 1,
-0.468963, -0.4087787, -0.7320864, 0.003921569, 1, 0, 1,
-0.4659162, -2.548041, -2.94238, 0, 1, 0.003921569, 1,
-0.4492822, 1.236459, -0.1888897, 0, 1, 0.01176471, 1,
-0.4478269, 1.392511, 0.3793, 0, 1, 0.01568628, 1,
-0.4467696, 1.915199, 0.8597741, 0, 1, 0.02352941, 1,
-0.4378726, 0.1669764, -1.128173, 0, 1, 0.02745098, 1,
-0.435974, 1.382483, 1.374354, 0, 1, 0.03529412, 1,
-0.43419, -1.007901, -3.764427, 0, 1, 0.03921569, 1,
-0.4337789, -0.5459448, -3.166851, 0, 1, 0.04705882, 1,
-0.4310247, 0.03698704, -1.242915, 0, 1, 0.05098039, 1,
-0.4295635, -2.286296, -1.650023, 0, 1, 0.05882353, 1,
-0.4255389, -0.9050284, -1.994895, 0, 1, 0.0627451, 1,
-0.4230568, -1.041933, -2.518499, 0, 1, 0.07058824, 1,
-0.4204865, -1.247056, -2.839779, 0, 1, 0.07450981, 1,
-0.4186599, -1.048485, -2.534727, 0, 1, 0.08235294, 1,
-0.4182121, -1.454024, -2.425744, 0, 1, 0.08627451, 1,
-0.4162646, 0.06102801, 1.180891, 0, 1, 0.09411765, 1,
-0.4124967, 1.004069, -0.7601131, 0, 1, 0.1019608, 1,
-0.4109012, 0.7020189, -0.0710559, 0, 1, 0.1058824, 1,
-0.4089648, -0.4971155, -1.935753, 0, 1, 0.1137255, 1,
-0.4069434, -1.339421, -0.9102899, 0, 1, 0.1176471, 1,
-0.4062293, -1.700004, -3.227129, 0, 1, 0.1254902, 1,
-0.402721, -3.213228, -2.44461, 0, 1, 0.1294118, 1,
-0.4013862, 2.016677, -1.636622, 0, 1, 0.1372549, 1,
-0.4013546, -1.044053, -1.741947, 0, 1, 0.1411765, 1,
-0.4006556, 0.07932049, -1.237538, 0, 1, 0.1490196, 1,
-0.4001716, 0.6395885, -0.9264007, 0, 1, 0.1529412, 1,
-0.3988427, -1.163721, -2.83909, 0, 1, 0.1607843, 1,
-0.396303, 0.2368272, -1.07678, 0, 1, 0.1647059, 1,
-0.3885797, 0.0004720658, -0.8131173, 0, 1, 0.172549, 1,
-0.3882411, -0.5843098, -2.583058, 0, 1, 0.1764706, 1,
-0.3870691, -1.536801, -1.060592, 0, 1, 0.1843137, 1,
-0.3814211, -0.3288837, -1.696495, 0, 1, 0.1882353, 1,
-0.3775441, 2.098946, 0.3802271, 0, 1, 0.1960784, 1,
-0.3751714, 0.1172967, -0.9648674, 0, 1, 0.2039216, 1,
-0.3716078, -0.3003089, -4.496147, 0, 1, 0.2078431, 1,
-0.3630943, 1.021106, 0.7969744, 0, 1, 0.2156863, 1,
-0.3622252, -0.1442575, -1.60604, 0, 1, 0.2196078, 1,
-0.3612075, -0.994435, -2.851263, 0, 1, 0.227451, 1,
-0.3591153, -0.3993022, -3.074502, 0, 1, 0.2313726, 1,
-0.3587096, -1.627573, -1.36029, 0, 1, 0.2392157, 1,
-0.3540846, -0.3251702, -0.2899245, 0, 1, 0.2431373, 1,
-0.3438185, -1.317013, -4.224468, 0, 1, 0.2509804, 1,
-0.3425532, -1.12131, -2.337125, 0, 1, 0.254902, 1,
-0.3422821, -0.5769428, -3.037789, 0, 1, 0.2627451, 1,
-0.3413278, -0.1252795, -2.96123, 0, 1, 0.2666667, 1,
-0.3382019, 1.025804, -0.664044, 0, 1, 0.2745098, 1,
-0.3324793, 1.259652, -2.229377, 0, 1, 0.2784314, 1,
-0.3302805, -0.06386957, -3.726086, 0, 1, 0.2862745, 1,
-0.3269968, 1.508459, -0.7386423, 0, 1, 0.2901961, 1,
-0.3262089, 0.1294683, -2.136106, 0, 1, 0.2980392, 1,
-0.3237614, 1.103792, -0.6120902, 0, 1, 0.3058824, 1,
-0.3236679, -1.256133, -4.129578, 0, 1, 0.3098039, 1,
-0.322921, 1.856716, -0.2301607, 0, 1, 0.3176471, 1,
-0.315206, 2.04983, -0.2315644, 0, 1, 0.3215686, 1,
-0.3110743, 1.730725, -1.240411, 0, 1, 0.3294118, 1,
-0.3037094, -1.442076, -4.005942, 0, 1, 0.3333333, 1,
-0.3027914, -0.8256418, -3.451398, 0, 1, 0.3411765, 1,
-0.2990154, -0.6030529, -3.754116, 0, 1, 0.345098, 1,
-0.2973567, -0.5857918, -2.677404, 0, 1, 0.3529412, 1,
-0.296105, -0.4604167, -4.047155, 0, 1, 0.3568628, 1,
-0.2924218, 0.5446556, 0.2011456, 0, 1, 0.3647059, 1,
-0.2893545, 0.9407551, -1.601559, 0, 1, 0.3686275, 1,
-0.2870545, 0.5113314, -2.377482, 0, 1, 0.3764706, 1,
-0.2865181, 0.9682587, -0.8198102, 0, 1, 0.3803922, 1,
-0.2751088, -0.5132017, -2.667042, 0, 1, 0.3882353, 1,
-0.2750763, 0.6781818, -2.090802, 0, 1, 0.3921569, 1,
-0.2737187, -0.1733561, -1.503171, 0, 1, 0.4, 1,
-0.2732648, -1.185219, -2.918968, 0, 1, 0.4078431, 1,
-0.2724527, -1.007669, -1.960743, 0, 1, 0.4117647, 1,
-0.268699, 0.4322979, -1.685861, 0, 1, 0.4196078, 1,
-0.267011, 0.8305113, -0.6330364, 0, 1, 0.4235294, 1,
-0.2522105, -0.636632, -1.669221, 0, 1, 0.4313726, 1,
-0.2517139, 0.2964617, 0.8614408, 0, 1, 0.4352941, 1,
-0.2515981, 0.5801837, -1.561891, 0, 1, 0.4431373, 1,
-0.2514071, 0.1476443, -1.090631, 0, 1, 0.4470588, 1,
-0.2462108, -0.6442145, -2.426453, 0, 1, 0.454902, 1,
-0.2457206, -0.326941, -2.093661, 0, 1, 0.4588235, 1,
-0.2447871, 0.2490632, -3.533764, 0, 1, 0.4666667, 1,
-0.2405751, 1.089848, 1.874447, 0, 1, 0.4705882, 1,
-0.232507, 0.406329, -0.4938295, 0, 1, 0.4784314, 1,
-0.2316612, -0.7616573, -3.672629, 0, 1, 0.4823529, 1,
-0.2315155, -0.3462493, -3.618057, 0, 1, 0.4901961, 1,
-0.2292327, 0.03957839, -0.405797, 0, 1, 0.4941176, 1,
-0.2235457, 0.258045, -1.253626, 0, 1, 0.5019608, 1,
-0.2221368, 0.0951167, -1.364417, 0, 1, 0.509804, 1,
-0.2174069, 0.3062463, -1.453654, 0, 1, 0.5137255, 1,
-0.2160311, 0.8709716, -0.2966013, 0, 1, 0.5215687, 1,
-0.2126908, -0.8614263, -3.114566, 0, 1, 0.5254902, 1,
-0.2122429, -0.6258925, -4.739084, 0, 1, 0.5333334, 1,
-0.2053472, 0.9870335, -1.13974, 0, 1, 0.5372549, 1,
-0.2043921, 0.5797276, 0.8580208, 0, 1, 0.5450981, 1,
-0.2031021, 0.3925992, -0.918985, 0, 1, 0.5490196, 1,
-0.1990549, 0.7755315, 1.212954, 0, 1, 0.5568628, 1,
-0.198023, -0.00508603, -0.8929704, 0, 1, 0.5607843, 1,
-0.1978505, -0.492525, -2.112448, 0, 1, 0.5686275, 1,
-0.1968497, 0.4331559, 0.493172, 0, 1, 0.572549, 1,
-0.1955549, 0.2840225, -1.252501, 0, 1, 0.5803922, 1,
-0.1937982, 0.182827, -1.750356, 0, 1, 0.5843138, 1,
-0.1913699, 0.7116389, -0.5595799, 0, 1, 0.5921569, 1,
-0.1849169, -0.8687434, -3.197645, 0, 1, 0.5960785, 1,
-0.1845778, 0.990819, -1.299419, 0, 1, 0.6039216, 1,
-0.1823533, 1.113448, 0.994599, 0, 1, 0.6117647, 1,
-0.181592, -0.09414716, -1.552305, 0, 1, 0.6156863, 1,
-0.1813361, 1.950748, 1.222124, 0, 1, 0.6235294, 1,
-0.1777553, -0.2460395, -2.42874, 0, 1, 0.627451, 1,
-0.1703496, 1.433602, 0.4653972, 0, 1, 0.6352941, 1,
-0.1691096, 0.4481553, -0.1813052, 0, 1, 0.6392157, 1,
-0.1647893, 0.1097492, 0.4751931, 0, 1, 0.6470588, 1,
-0.1608273, -1.11827, -2.846171, 0, 1, 0.6509804, 1,
-0.1498017, -0.06689103, -2.3109, 0, 1, 0.6588235, 1,
-0.1408068, -0.01091688, -0.8189139, 0, 1, 0.6627451, 1,
-0.1374255, -0.5508569, -4.126327, 0, 1, 0.6705883, 1,
-0.1354543, -0.7283254, -0.1573539, 0, 1, 0.6745098, 1,
-0.1349629, 0.72554, 0.02241443, 0, 1, 0.682353, 1,
-0.1307065, 1.378023, 0.2610096, 0, 1, 0.6862745, 1,
-0.1301611, 0.3122481, 0.3953598, 0, 1, 0.6941177, 1,
-0.1278591, -0.7822713, -4.006678, 0, 1, 0.7019608, 1,
-0.1274464, 1.321706, 0.1711249, 0, 1, 0.7058824, 1,
-0.1271474, -0.3563855, -2.486495, 0, 1, 0.7137255, 1,
-0.1223514, 0.5822316, 0.8583331, 0, 1, 0.7176471, 1,
-0.1208034, -0.8971104, -2.276163, 0, 1, 0.7254902, 1,
-0.1195598, 0.6021994, 0.2409274, 0, 1, 0.7294118, 1,
-0.1147867, 1.220595, 0.6545065, 0, 1, 0.7372549, 1,
-0.1143291, -0.4825714, -1.552007, 0, 1, 0.7411765, 1,
-0.1103939, -0.6964759, -3.678032, 0, 1, 0.7490196, 1,
-0.110023, 1.096396, -1.350809, 0, 1, 0.7529412, 1,
-0.1061678, -0.4425578, -3.02784, 0, 1, 0.7607843, 1,
-0.1043922, 1.346872, 1.720893, 0, 1, 0.7647059, 1,
-0.09716461, 0.3104043, 0.2928044, 0, 1, 0.772549, 1,
-0.09449209, 0.6619245, 0.6050214, 0, 1, 0.7764706, 1,
-0.09283805, 1.650949, 1.367855, 0, 1, 0.7843137, 1,
-0.09112409, -0.9359529, -2.351478, 0, 1, 0.7882353, 1,
-0.07767975, -0.4405137, -0.8520369, 0, 1, 0.7960784, 1,
-0.07669211, -0.03069995, -0.3746459, 0, 1, 0.8039216, 1,
-0.07279186, 0.9830678, -0.8864324, 0, 1, 0.8078431, 1,
-0.0636608, 2.290416, 0.6774405, 0, 1, 0.8156863, 1,
-0.06309845, 0.07367358, -0.8834456, 0, 1, 0.8196079, 1,
-0.06204773, -1.601523, -2.308049, 0, 1, 0.827451, 1,
-0.06039189, 1.081568, -0.5536804, 0, 1, 0.8313726, 1,
-0.05974999, -2.700107, -2.624483, 0, 1, 0.8392157, 1,
-0.05667754, -0.2489984, -4.050474, 0, 1, 0.8431373, 1,
-0.05649996, 0.8379619, 1.115986, 0, 1, 0.8509804, 1,
-0.05205202, -0.8361377, -2.859876, 0, 1, 0.854902, 1,
-0.05194709, 0.5816131, -1.193684, 0, 1, 0.8627451, 1,
-0.04858718, 0.5948433, 0.6715779, 0, 1, 0.8666667, 1,
-0.04767741, 0.9734432, 1.076581, 0, 1, 0.8745098, 1,
-0.047452, 0.4625655, -2.370642, 0, 1, 0.8784314, 1,
-0.04720281, -0.9957854, -5.161552, 0, 1, 0.8862745, 1,
-0.0458745, 0.635424, -0.9280691, 0, 1, 0.8901961, 1,
-0.04564571, -0.7264165, -3.635828, 0, 1, 0.8980392, 1,
-0.04419599, 1.879112, 1.035559, 0, 1, 0.9058824, 1,
-0.04370726, 0.2335163, -0.004963849, 0, 1, 0.9098039, 1,
-0.04235066, -1.132523, -2.285893, 0, 1, 0.9176471, 1,
-0.04232857, 1.178558, -0.6021694, 0, 1, 0.9215686, 1,
-0.0390512, 0.133403, 0.05616244, 0, 1, 0.9294118, 1,
-0.03803659, -0.2863609, -2.837912, 0, 1, 0.9333333, 1,
-0.0379884, 1.168551, -1.097442, 0, 1, 0.9411765, 1,
-0.03788485, -3.19704, -2.898139, 0, 1, 0.945098, 1,
-0.03626207, -0.7572424, -2.116669, 0, 1, 0.9529412, 1,
-0.0358065, -2.320277, -2.954405, 0, 1, 0.9568627, 1,
-0.03413572, -0.9870774, -2.860748, 0, 1, 0.9647059, 1,
-0.03177952, -1.575243, -2.895997, 0, 1, 0.9686275, 1,
-0.02839512, -2.008427, -2.864842, 0, 1, 0.9764706, 1,
-0.02449024, -0.2910745, -4.143603, 0, 1, 0.9803922, 1,
-0.02421376, 1.872678, -1.658788, 0, 1, 0.9882353, 1,
-0.02011266, 0.4401695, -1.456097, 0, 1, 0.9921569, 1,
-0.01761567, 1.0879, 0.3885142, 0, 1, 1, 1,
-0.01702264, 0.2834624, -0.9631082, 0, 0.9921569, 1, 1,
-0.016894, 0.1995595, -1.61671, 0, 0.9882353, 1, 1,
-0.01231763, -1.17431, -4.025903, 0, 0.9803922, 1, 1,
-0.004853155, -1.684074, -2.049242, 0, 0.9764706, 1, 1,
-0.003905078, 0.08317493, -0.8403134, 0, 0.9686275, 1, 1,
-0.0007104541, 0.7791069, 0.7609822, 0, 0.9647059, 1, 1,
0.005512263, -0.02062055, 4.250496, 0, 0.9568627, 1, 1,
0.009512685, 0.9031458, 0.3423508, 0, 0.9529412, 1, 1,
0.01040678, 0.5401335, 0.04846148, 0, 0.945098, 1, 1,
0.01517222, -0.4197228, 4.589253, 0, 0.9411765, 1, 1,
0.01554904, 0.198559, 1.460931, 0, 0.9333333, 1, 1,
0.02161589, -0.3799794, 2.87394, 0, 0.9294118, 1, 1,
0.0286652, 0.05607528, -0.2486787, 0, 0.9215686, 1, 1,
0.03286577, -0.2125163, 2.036198, 0, 0.9176471, 1, 1,
0.04172422, -1.520606, 3.651645, 0, 0.9098039, 1, 1,
0.04210055, -0.390793, 2.096542, 0, 0.9058824, 1, 1,
0.04609898, 0.9822205, -0.1864609, 0, 0.8980392, 1, 1,
0.04679629, 3.404223, 0.39677, 0, 0.8901961, 1, 1,
0.0472662, 0.2609354, 0.8018178, 0, 0.8862745, 1, 1,
0.0478382, -0.08394119, 3.651424, 0, 0.8784314, 1, 1,
0.04926284, 1.826288, 0.1223218, 0, 0.8745098, 1, 1,
0.05176672, 1.876342, -0.6482847, 0, 0.8666667, 1, 1,
0.06099283, -0.5418633, 3.037615, 0, 0.8627451, 1, 1,
0.06326058, -0.6751775, 3.131592, 0, 0.854902, 1, 1,
0.06582249, -0.4715943, 3.493558, 0, 0.8509804, 1, 1,
0.06815994, -0.825289, 1.093781, 0, 0.8431373, 1, 1,
0.0689079, 0.2336754, 0.4601592, 0, 0.8392157, 1, 1,
0.07002647, 2.216985, -1.056523, 0, 0.8313726, 1, 1,
0.07026681, -0.7033525, 2.963849, 0, 0.827451, 1, 1,
0.07246874, -1.072212, 3.889884, 0, 0.8196079, 1, 1,
0.07634755, 0.4811089, 0.7151169, 0, 0.8156863, 1, 1,
0.08754089, -0.9726384, 2.229554, 0, 0.8078431, 1, 1,
0.09356594, -0.9722636, 0.9455037, 0, 0.8039216, 1, 1,
0.09493874, 0.6949686, 0.6053916, 0, 0.7960784, 1, 1,
0.09640553, 0.3833655, 0.3704259, 0, 0.7882353, 1, 1,
0.1042914, -0.3480289, 3.476853, 0, 0.7843137, 1, 1,
0.1051651, 0.9019397, 0.2184919, 0, 0.7764706, 1, 1,
0.1065754, -0.7979862, 3.968738, 0, 0.772549, 1, 1,
0.1081108, -0.5738351, 2.263461, 0, 0.7647059, 1, 1,
0.1124377, 0.01571706, 2.817556, 0, 0.7607843, 1, 1,
0.116637, 1.357461, -0.9732167, 0, 0.7529412, 1, 1,
0.1169932, 0.06824028, 0.8654857, 0, 0.7490196, 1, 1,
0.1238979, -1.164142, 1.948229, 0, 0.7411765, 1, 1,
0.1289366, 0.3291807, 1.655735, 0, 0.7372549, 1, 1,
0.1299449, 0.3575657, 1.497471, 0, 0.7294118, 1, 1,
0.1318978, -0.3429859, 1.991763, 0, 0.7254902, 1, 1,
0.1321506, 1.373861, -0.7534885, 0, 0.7176471, 1, 1,
0.133156, -0.4261733, 2.295958, 0, 0.7137255, 1, 1,
0.1345786, 2.008919, 0.1092721, 0, 0.7058824, 1, 1,
0.1436684, 0.0093477, 2.310661, 0, 0.6980392, 1, 1,
0.1480203, 0.739248, -0.3643457, 0, 0.6941177, 1, 1,
0.152922, -0.1412363, 2.119714, 0, 0.6862745, 1, 1,
0.1541429, -0.1920337, 3.230668, 0, 0.682353, 1, 1,
0.1552922, 1.007642, 0.6267864, 0, 0.6745098, 1, 1,
0.1566705, -0.7032381, 3.346178, 0, 0.6705883, 1, 1,
0.1594979, 2.190691, -0.2048972, 0, 0.6627451, 1, 1,
0.159788, 0.314287, -0.3169645, 0, 0.6588235, 1, 1,
0.1660976, 0.5332562, 2.430698, 0, 0.6509804, 1, 1,
0.1709076, 1.017265, -1.060294, 0, 0.6470588, 1, 1,
0.1714544, -2.335722, 2.464543, 0, 0.6392157, 1, 1,
0.1752271, -1.670274, 1.661479, 0, 0.6352941, 1, 1,
0.1758792, 0.5862263, -1.434965, 0, 0.627451, 1, 1,
0.177049, 0.9957191, 0.8571156, 0, 0.6235294, 1, 1,
0.1776852, 0.8813652, 1.495589, 0, 0.6156863, 1, 1,
0.1798226, -0.5892267, 4.510626, 0, 0.6117647, 1, 1,
0.1802164, 0.2931569, 0.7399663, 0, 0.6039216, 1, 1,
0.1809702, 1.558748, 0.3772819, 0, 0.5960785, 1, 1,
0.1821069, -1.008343, 3.596293, 0, 0.5921569, 1, 1,
0.1882392, 0.2975825, 1.904414, 0, 0.5843138, 1, 1,
0.1904477, 0.1456512, 2.463732, 0, 0.5803922, 1, 1,
0.1986542, 0.3312604, -0.1214364, 0, 0.572549, 1, 1,
0.2002883, -0.7999704, 4.123036, 0, 0.5686275, 1, 1,
0.2007698, 1.497555, 1.02525, 0, 0.5607843, 1, 1,
0.2034722, 0.1468886, 0.9381834, 0, 0.5568628, 1, 1,
0.206372, -2.301205, 3.580092, 0, 0.5490196, 1, 1,
0.206436, -0.9598427, 2.58313, 0, 0.5450981, 1, 1,
0.2073179, 1.281561, 0.06449666, 0, 0.5372549, 1, 1,
0.2097814, -0.4243362, 1.654697, 0, 0.5333334, 1, 1,
0.2158193, -0.07165199, 3.012278, 0, 0.5254902, 1, 1,
0.216732, -0.2838621, 3.326338, 0, 0.5215687, 1, 1,
0.219253, -0.1300356, 2.831899, 0, 0.5137255, 1, 1,
0.2224167, -0.3226272, 3.020783, 0, 0.509804, 1, 1,
0.2227742, 0.7625398, -1.546156, 0, 0.5019608, 1, 1,
0.2239553, -0.8397808, 1.518842, 0, 0.4941176, 1, 1,
0.2247717, -2.155773, 0.6368632, 0, 0.4901961, 1, 1,
0.2250321, 1.805795, 1.830543, 0, 0.4823529, 1, 1,
0.2283509, 0.05610237, 0.3047245, 0, 0.4784314, 1, 1,
0.2311782, 0.4234519, 0.8230107, 0, 0.4705882, 1, 1,
0.2339634, -0.7885736, 3.074564, 0, 0.4666667, 1, 1,
0.2344806, 0.7998446, 0.208642, 0, 0.4588235, 1, 1,
0.2444834, 0.08588404, 2.274754, 0, 0.454902, 1, 1,
0.2487208, 0.1572865, 1.343208, 0, 0.4470588, 1, 1,
0.2508443, 0.2761223, -0.4196267, 0, 0.4431373, 1, 1,
0.2515999, -0.8547759, 1.736992, 0, 0.4352941, 1, 1,
0.2602426, -1.468751, 3.400734, 0, 0.4313726, 1, 1,
0.2627639, -1.826664, 2.806211, 0, 0.4235294, 1, 1,
0.2645269, 0.5758815, 1.683047, 0, 0.4196078, 1, 1,
0.2669008, 0.1950781, 0.9754676, 0, 0.4117647, 1, 1,
0.2676747, -0.3080944, 2.643692, 0, 0.4078431, 1, 1,
0.267823, -1.867296, 3.118532, 0, 0.4, 1, 1,
0.2682622, -0.2574669, 1.61293, 0, 0.3921569, 1, 1,
0.271686, -0.2793265, 3.749489, 0, 0.3882353, 1, 1,
0.2808428, -1.260441, 2.241848, 0, 0.3803922, 1, 1,
0.2832552, 0.1777455, 1.406024, 0, 0.3764706, 1, 1,
0.2849653, -0.5446866, 2.680159, 0, 0.3686275, 1, 1,
0.2905972, -0.4422883, 2.289741, 0, 0.3647059, 1, 1,
0.2954665, 0.2542011, 1.175859, 0, 0.3568628, 1, 1,
0.3107736, 0.8240353, 0.8524764, 0, 0.3529412, 1, 1,
0.3114508, -2.415879, 1.878864, 0, 0.345098, 1, 1,
0.3192444, -0.7922358, 4.182428, 0, 0.3411765, 1, 1,
0.3240005, 0.9917116, 0.5997211, 0, 0.3333333, 1, 1,
0.3296984, -0.4482089, 1.558679, 0, 0.3294118, 1, 1,
0.3306541, -0.3955979, 2.966656, 0, 0.3215686, 1, 1,
0.3316893, -0.3710595, 2.509949, 0, 0.3176471, 1, 1,
0.3317264, -0.5866659, 3.437316, 0, 0.3098039, 1, 1,
0.3395941, 1.630409, 0.727001, 0, 0.3058824, 1, 1,
0.3433546, -0.8606722, 2.483304, 0, 0.2980392, 1, 1,
0.3436051, 1.015303, -0.7356871, 0, 0.2901961, 1, 1,
0.3440435, -0.2556328, 0.6746228, 0, 0.2862745, 1, 1,
0.3450864, 1.49775, -1.507192, 0, 0.2784314, 1, 1,
0.3468603, -0.5685869, 2.925711, 0, 0.2745098, 1, 1,
0.3471086, 1.228487, 0.4476217, 0, 0.2666667, 1, 1,
0.3488615, -0.07366697, -1.035959, 0, 0.2627451, 1, 1,
0.3496677, 0.8390458, -1.006006, 0, 0.254902, 1, 1,
0.353477, 0.01500931, 1.177223, 0, 0.2509804, 1, 1,
0.3541444, -0.1520805, 1.562279, 0, 0.2431373, 1, 1,
0.3564998, 1.409609, 1.084299, 0, 0.2392157, 1, 1,
0.3599499, -0.08700592, 3.647647, 0, 0.2313726, 1, 1,
0.3632643, 0.7394955, 0.8139652, 0, 0.227451, 1, 1,
0.3634344, 2.602546, -0.5803239, 0, 0.2196078, 1, 1,
0.3636282, -0.1853862, 2.304383, 0, 0.2156863, 1, 1,
0.3645681, -1.323812, 4.433573, 0, 0.2078431, 1, 1,
0.3668019, -0.4800485, 2.141253, 0, 0.2039216, 1, 1,
0.3684227, 0.3946342, 2.370439, 0, 0.1960784, 1, 1,
0.3716612, 0.6622806, 1.48195, 0, 0.1882353, 1, 1,
0.3863803, 2.018766, -0.2352019, 0, 0.1843137, 1, 1,
0.3879398, -1.677911, 2.695916, 0, 0.1764706, 1, 1,
0.39012, 0.01171408, -0.0433355, 0, 0.172549, 1, 1,
0.391541, -0.3492191, 2.49499, 0, 0.1647059, 1, 1,
0.3923355, 0.5461104, 0.8364258, 0, 0.1607843, 1, 1,
0.3945977, -0.2872638, 2.682611, 0, 0.1529412, 1, 1,
0.3966624, -0.5502872, 1.540408, 0, 0.1490196, 1, 1,
0.4028967, 1.893839, 0.7856083, 0, 0.1411765, 1, 1,
0.4060216, -0.7260612, 4.149664, 0, 0.1372549, 1, 1,
0.4072808, 1.317017, -0.1601085, 0, 0.1294118, 1, 1,
0.4077555, -0.3337749, 2.29221, 0, 0.1254902, 1, 1,
0.4091305, -0.9758376, 2.301525, 0, 0.1176471, 1, 1,
0.4098402, -0.02874858, 1.933664, 0, 0.1137255, 1, 1,
0.4102615, 0.594919, -1.284244, 0, 0.1058824, 1, 1,
0.410906, 0.09650072, 1.454841, 0, 0.09803922, 1, 1,
0.4129917, 0.02536475, 2.241172, 0, 0.09411765, 1, 1,
0.4188094, -0.1828573, 1.48596, 0, 0.08627451, 1, 1,
0.4193632, 0.6388716, 0.5371585, 0, 0.08235294, 1, 1,
0.4233375, -1.108686, 2.966122, 0, 0.07450981, 1, 1,
0.4249217, -0.8854929, -0.09236312, 0, 0.07058824, 1, 1,
0.4249614, -0.5665807, 2.200986, 0, 0.0627451, 1, 1,
0.4273534, 1.696413, -0.7131744, 0, 0.05882353, 1, 1,
0.4285729, -1.147381, 2.211866, 0, 0.05098039, 1, 1,
0.4304479, 0.6742384, 1.277384, 0, 0.04705882, 1, 1,
0.4312597, 0.7503276, 0.9047503, 0, 0.03921569, 1, 1,
0.4345021, -0.5042148, 3.112456, 0, 0.03529412, 1, 1,
0.4365344, 0.9385772, 0.4707537, 0, 0.02745098, 1, 1,
0.441401, -0.01671138, 2.060281, 0, 0.02352941, 1, 1,
0.4415852, 0.3192411, 1.77309, 0, 0.01568628, 1, 1,
0.4435409, -0.4510747, 3.188956, 0, 0.01176471, 1, 1,
0.4443184, 0.2058162, 1.821368, 0, 0.003921569, 1, 1,
0.446519, 0.6235716, 0.2583497, 0.003921569, 0, 1, 1,
0.4495367, 0.1362383, 1.721074, 0.007843138, 0, 1, 1,
0.4505619, -0.2451015, 2.000816, 0.01568628, 0, 1, 1,
0.451763, 2.017294, 0.08486421, 0.01960784, 0, 1, 1,
0.4520606, 0.08092838, 0.9127584, 0.02745098, 0, 1, 1,
0.4527685, -0.701315, 3.270836, 0.03137255, 0, 1, 1,
0.4534635, -0.9930546, 1.192023, 0.03921569, 0, 1, 1,
0.4578533, 0.4135398, -0.9054752, 0.04313726, 0, 1, 1,
0.4581657, 1.508285, 1.067504, 0.05098039, 0, 1, 1,
0.4651047, -0.3845345, 3.892034, 0.05490196, 0, 1, 1,
0.4668278, -1.166787, 2.321073, 0.0627451, 0, 1, 1,
0.46957, 1.157344, 1.71812, 0.06666667, 0, 1, 1,
0.4739161, 1.571957, 0.576231, 0.07450981, 0, 1, 1,
0.4750485, -0.08954836, -0.5949305, 0.07843138, 0, 1, 1,
0.476001, 0.5258372, 0.2940135, 0.08627451, 0, 1, 1,
0.4785733, -0.958584, 1.558697, 0.09019608, 0, 1, 1,
0.4791585, -0.3141614, -0.3403592, 0.09803922, 0, 1, 1,
0.4799846, -0.8034375, 2.853368, 0.1058824, 0, 1, 1,
0.4826679, 0.09565157, 2.125766, 0.1098039, 0, 1, 1,
0.4831689, -1.349734, 2.220532, 0.1176471, 0, 1, 1,
0.4844835, -0.6089529, 1.996018, 0.1215686, 0, 1, 1,
0.4859799, -0.2877999, 1.466725, 0.1294118, 0, 1, 1,
0.4888229, 0.02707588, 2.033983, 0.1333333, 0, 1, 1,
0.4897131, -1.463866, 3.279458, 0.1411765, 0, 1, 1,
0.4925321, 0.8285708, 1.394868, 0.145098, 0, 1, 1,
0.4952066, -0.6757721, 0.9053311, 0.1529412, 0, 1, 1,
0.4961657, -0.04432715, 1.984081, 0.1568628, 0, 1, 1,
0.4961898, -0.1768089, 2.764185, 0.1647059, 0, 1, 1,
0.5037229, 1.406909, 0.4410916, 0.1686275, 0, 1, 1,
0.5038102, 1.323611, 1.232754, 0.1764706, 0, 1, 1,
0.5065975, -0.2734451, 3.991324, 0.1803922, 0, 1, 1,
0.512922, 1.260448, 0.5705838, 0.1882353, 0, 1, 1,
0.5133637, -0.3686708, 2.435115, 0.1921569, 0, 1, 1,
0.514721, -0.6019079, 3.74781, 0.2, 0, 1, 1,
0.5190307, -1.826537, 3.729659, 0.2078431, 0, 1, 1,
0.5193982, 0.5110788, 1.026078, 0.2117647, 0, 1, 1,
0.5228063, -0.3687468, 2.420024, 0.2196078, 0, 1, 1,
0.5254859, 1.843899, -1.461136, 0.2235294, 0, 1, 1,
0.5264167, 0.3313354, 0.3134667, 0.2313726, 0, 1, 1,
0.5335733, -0.2201332, 1.932008, 0.2352941, 0, 1, 1,
0.5350641, -0.5275093, 1.582927, 0.2431373, 0, 1, 1,
0.5412489, 1.736976, -0.001051172, 0.2470588, 0, 1, 1,
0.5427349, -0.5111106, 3.135457, 0.254902, 0, 1, 1,
0.5432039, 0.1858302, 0.2103211, 0.2588235, 0, 1, 1,
0.5451356, -0.5396221, -0.02590131, 0.2666667, 0, 1, 1,
0.5458516, 0.6858196, 1.068021, 0.2705882, 0, 1, 1,
0.5477166, 0.9225197, -1.648894, 0.2784314, 0, 1, 1,
0.5525346, 0.1287585, 2.193981, 0.282353, 0, 1, 1,
0.5621913, 0.201492, 1.571135, 0.2901961, 0, 1, 1,
0.5623106, 1.342275, -0.1157207, 0.2941177, 0, 1, 1,
0.5662268, 0.9471143, -0.646459, 0.3019608, 0, 1, 1,
0.5688083, -1.787936, 3.955572, 0.3098039, 0, 1, 1,
0.5696008, -0.330687, 2.127559, 0.3137255, 0, 1, 1,
0.5718816, -1.899069, 3.57433, 0.3215686, 0, 1, 1,
0.5729151, -1.264198, 1.906701, 0.3254902, 0, 1, 1,
0.5739613, 0.7974527, 2.225576, 0.3333333, 0, 1, 1,
0.5773588, -0.2470705, 2.957436, 0.3372549, 0, 1, 1,
0.578384, 0.6050279, 1.358374, 0.345098, 0, 1, 1,
0.5794451, -1.384086, 3.967148, 0.3490196, 0, 1, 1,
0.5811703, -0.8100306, 2.572541, 0.3568628, 0, 1, 1,
0.5821279, 0.8672795, -0.2208404, 0.3607843, 0, 1, 1,
0.5836036, 0.1693484, 0.5631361, 0.3686275, 0, 1, 1,
0.5946234, 1.491775, 1.345722, 0.372549, 0, 1, 1,
0.5952053, -0.7471489, 2.770314, 0.3803922, 0, 1, 1,
0.6007259, 0.9157601, 2.065214, 0.3843137, 0, 1, 1,
0.6052875, -0.1913731, 3.110948, 0.3921569, 0, 1, 1,
0.6081378, 0.5773847, -1.328825, 0.3960784, 0, 1, 1,
0.6234357, -0.5306652, 1.113019, 0.4039216, 0, 1, 1,
0.6261911, -1.441231, 3.031391, 0.4117647, 0, 1, 1,
0.6286729, -0.6397348, 2.489918, 0.4156863, 0, 1, 1,
0.6299219, 0.8969842, 0.2723965, 0.4235294, 0, 1, 1,
0.632978, 1.099794, -0.5448717, 0.427451, 0, 1, 1,
0.633454, 1.070206, 2.22252, 0.4352941, 0, 1, 1,
0.6336972, -1.015217, 3.014837, 0.4392157, 0, 1, 1,
0.6352026, -0.9407796, 2.439196, 0.4470588, 0, 1, 1,
0.635456, 0.2028435, 2.251417, 0.4509804, 0, 1, 1,
0.6414817, -1.284163, 5.130226, 0.4588235, 0, 1, 1,
0.6426682, -1.329711, 2.657327, 0.4627451, 0, 1, 1,
0.6465054, -0.615706, 3.38394, 0.4705882, 0, 1, 1,
0.6467796, 1.113758, 0.6594865, 0.4745098, 0, 1, 1,
0.649404, -0.3120539, 1.16256, 0.4823529, 0, 1, 1,
0.6560158, 1.369234, 0.5285662, 0.4862745, 0, 1, 1,
0.6621178, 0.4059345, 3.297412, 0.4941176, 0, 1, 1,
0.6653536, -1.322898, 4.050411, 0.5019608, 0, 1, 1,
0.6673951, -0.1561069, 1.602327, 0.5058824, 0, 1, 1,
0.6684866, 1.806791, 1.599702, 0.5137255, 0, 1, 1,
0.6685839, 0.2141335, 1.734218, 0.5176471, 0, 1, 1,
0.6719022, -0.1075361, 1.944361, 0.5254902, 0, 1, 1,
0.6842009, 1.25706, 0.1824771, 0.5294118, 0, 1, 1,
0.6849915, 0.6106345, 2.84994, 0.5372549, 0, 1, 1,
0.6896585, 0.8348891, 0.4510483, 0.5411765, 0, 1, 1,
0.6912075, 0.7148429, 1.993725, 0.5490196, 0, 1, 1,
0.6930637, -0.6352175, 0.0741348, 0.5529412, 0, 1, 1,
0.6944125, -2.355238, 3.645279, 0.5607843, 0, 1, 1,
0.6950415, -0.2869179, 1.838152, 0.5647059, 0, 1, 1,
0.6980205, -1.78476, 3.01745, 0.572549, 0, 1, 1,
0.7026282, 0.2187914, -1.068402, 0.5764706, 0, 1, 1,
0.7028846, 1.669937, 0.4323994, 0.5843138, 0, 1, 1,
0.7041425, 0.1695802, 0.09113514, 0.5882353, 0, 1, 1,
0.7108307, -0.03267501, 1.558962, 0.5960785, 0, 1, 1,
0.7117447, 0.4350708, 1.34144, 0.6039216, 0, 1, 1,
0.7181117, -0.07596098, 1.447874, 0.6078432, 0, 1, 1,
0.7191464, 0.1050041, 1.918367, 0.6156863, 0, 1, 1,
0.726719, 0.1979829, -0.2228766, 0.6196079, 0, 1, 1,
0.7288573, 0.1817769, 2.866296, 0.627451, 0, 1, 1,
0.7371693, -1.469516, 1.90507, 0.6313726, 0, 1, 1,
0.7407123, 0.6782937, 0.6276559, 0.6392157, 0, 1, 1,
0.7462358, 1.464498, 0.474763, 0.6431373, 0, 1, 1,
0.7492348, 0.4952392, 2.939787, 0.6509804, 0, 1, 1,
0.7529972, -0.6501723, -0.2711658, 0.654902, 0, 1, 1,
0.757392, 0.8603991, 2.008276, 0.6627451, 0, 1, 1,
0.7652913, -0.0982324, 1.177479, 0.6666667, 0, 1, 1,
0.7692422, 0.8016838, -0.729906, 0.6745098, 0, 1, 1,
0.7854229, -0.2452395, 1.747239, 0.6784314, 0, 1, 1,
0.7865792, 1.492355, 0.6372506, 0.6862745, 0, 1, 1,
0.7879997, -2.874847, 3.767528, 0.6901961, 0, 1, 1,
0.7890735, -0.7645961, 2.033975, 0.6980392, 0, 1, 1,
0.7891052, 2.251546, -1.522777, 0.7058824, 0, 1, 1,
0.7976199, 0.1179365, -0.08952127, 0.7098039, 0, 1, 1,
0.8083991, 0.6838962, 1.063178, 0.7176471, 0, 1, 1,
0.8195027, 0.1869783, 0.5915762, 0.7215686, 0, 1, 1,
0.8265212, -0.02559946, 2.584636, 0.7294118, 0, 1, 1,
0.8302783, 0.5337222, 0.7842106, 0.7333333, 0, 1, 1,
0.8356084, -1.06801, 2.404577, 0.7411765, 0, 1, 1,
0.8366702, 0.06350879, 1.935279, 0.7450981, 0, 1, 1,
0.8372245, -0.489758, -0.5545918, 0.7529412, 0, 1, 1,
0.8456678, -0.7178664, 1.794325, 0.7568628, 0, 1, 1,
0.846825, -0.06460768, 1.440803, 0.7647059, 0, 1, 1,
0.8482068, -1.751848, 3.179298, 0.7686275, 0, 1, 1,
0.851993, -0.3376904, 2.348969, 0.7764706, 0, 1, 1,
0.8551981, -0.1352701, 1.222705, 0.7803922, 0, 1, 1,
0.8558658, 0.1930341, 0.9202648, 0.7882353, 0, 1, 1,
0.8749985, 0.08682526, 2.669624, 0.7921569, 0, 1, 1,
0.8762519, -0.8725718, 1.5218, 0.8, 0, 1, 1,
0.876994, 0.3355149, 0.2818206, 0.8078431, 0, 1, 1,
0.8780478, 1.208505, -0.1787379, 0.8117647, 0, 1, 1,
0.88679, 0.8141221, 0.5688348, 0.8196079, 0, 1, 1,
0.8906022, -0.1279487, 2.144716, 0.8235294, 0, 1, 1,
0.8937025, 2.374291, 0.4137971, 0.8313726, 0, 1, 1,
0.8955177, -2.433061, 4.67297, 0.8352941, 0, 1, 1,
0.8964128, -0.8883944, 3.038901, 0.8431373, 0, 1, 1,
0.8968213, -0.1912073, 1.283958, 0.8470588, 0, 1, 1,
0.8969271, 0.7154383, 2.492286, 0.854902, 0, 1, 1,
0.91843, -0.4567971, 1.609887, 0.8588235, 0, 1, 1,
0.9351674, -0.08674213, 0.6853393, 0.8666667, 0, 1, 1,
0.937303, -0.8322613, 2.482831, 0.8705882, 0, 1, 1,
0.9437755, 0.3473476, 2.089917, 0.8784314, 0, 1, 1,
0.9453502, -0.6915995, 1.484172, 0.8823529, 0, 1, 1,
0.950093, -1.327913, 1.343724, 0.8901961, 0, 1, 1,
0.9545431, 0.372387, 1.651078, 0.8941177, 0, 1, 1,
0.954652, -0.4305706, 1.032143, 0.9019608, 0, 1, 1,
0.9546695, 0.3842282, 0.4806377, 0.9098039, 0, 1, 1,
0.9581813, 0.1648861, 1.604742, 0.9137255, 0, 1, 1,
0.9601561, 1.11283, 0.9189258, 0.9215686, 0, 1, 1,
0.9618952, -1.731004, 2.943785, 0.9254902, 0, 1, 1,
0.9647029, 0.3376788, 2.279364, 0.9333333, 0, 1, 1,
0.9676108, 1.614544, 0.9580515, 0.9372549, 0, 1, 1,
0.9718742, 0.6377395, -0.4599527, 0.945098, 0, 1, 1,
0.9733366, -0.5110039, 2.086112, 0.9490196, 0, 1, 1,
0.9937769, 0.9891872, 1.988888, 0.9568627, 0, 1, 1,
0.9949197, -0.2263389, 1.171628, 0.9607843, 0, 1, 1,
0.9963733, -2.138917, 0.4357472, 0.9686275, 0, 1, 1,
1.006261, -0.02832218, 1.322932, 0.972549, 0, 1, 1,
1.00745, 0.9225182, 1.2472, 0.9803922, 0, 1, 1,
1.008889, -2.326906, 2.696364, 0.9843137, 0, 1, 1,
1.009869, 1.28411, -0.5289782, 0.9921569, 0, 1, 1,
1.015962, -1.519401, 2.644616, 0.9960784, 0, 1, 1,
1.018829, 1.469639, -1.59764, 1, 0, 0.9960784, 1,
1.019901, -1.653452, 2.595426, 1, 0, 0.9882353, 1,
1.021779, 1.536887, 2.47086, 1, 0, 0.9843137, 1,
1.024499, -0.7036484, 2.623942, 1, 0, 0.9764706, 1,
1.03202, 2.249892, -0.3910454, 1, 0, 0.972549, 1,
1.032177, -0.2275699, 0.7527524, 1, 0, 0.9647059, 1,
1.033263, 0.8199108, 0.2276036, 1, 0, 0.9607843, 1,
1.033267, -1.571807, 1.02092, 1, 0, 0.9529412, 1,
1.034057, -0.6370983, 2.175906, 1, 0, 0.9490196, 1,
1.03494, 1.070432, 1.502259, 1, 0, 0.9411765, 1,
1.035227, -2.000484, 2.463637, 1, 0, 0.9372549, 1,
1.043407, 0.483739, 0.7669581, 1, 0, 0.9294118, 1,
1.04861, -0.8930772, 0.4973796, 1, 0, 0.9254902, 1,
1.051169, 1.256137, 0.7592803, 1, 0, 0.9176471, 1,
1.051863, 0.1051865, 0.1155061, 1, 0, 0.9137255, 1,
1.053641, -1.079645, 2.703013, 1, 0, 0.9058824, 1,
1.055488, -0.9585883, 1.882517, 1, 0, 0.9019608, 1,
1.058185, -0.4905507, 1.971558, 1, 0, 0.8941177, 1,
1.061703, -0.4901391, 2.271662, 1, 0, 0.8862745, 1,
1.064292, -1.238772, 2.116479, 1, 0, 0.8823529, 1,
1.0691, -0.6064969, 1.781363, 1, 0, 0.8745098, 1,
1.093255, 1.764727, -1.261922, 1, 0, 0.8705882, 1,
1.097794, -0.2611211, 2.796025, 1, 0, 0.8627451, 1,
1.104232, 0.3883367, 1.265503, 1, 0, 0.8588235, 1,
1.104919, 0.2253448, 0.2480919, 1, 0, 0.8509804, 1,
1.104928, -1.209261, -0.5439938, 1, 0, 0.8470588, 1,
1.105505, -1.889022, 2.610631, 1, 0, 0.8392157, 1,
1.11146, 0.1511538, 0.2415757, 1, 0, 0.8352941, 1,
1.11211, -0.4853751, 1.537139, 1, 0, 0.827451, 1,
1.120794, -0.2056326, 0.416488, 1, 0, 0.8235294, 1,
1.124385, 1.068819, -1.063762, 1, 0, 0.8156863, 1,
1.124961, 1.718161, -0.2599739, 1, 0, 0.8117647, 1,
1.125317, -0.8819777, 2.84487, 1, 0, 0.8039216, 1,
1.125983, 0.369512, 3.026874, 1, 0, 0.7960784, 1,
1.135375, -0.1670371, 0.3354547, 1, 0, 0.7921569, 1,
1.137102, -0.06093993, 2.373318, 1, 0, 0.7843137, 1,
1.137115, -0.9872912, 3.66687, 1, 0, 0.7803922, 1,
1.138125, 0.2950445, 2.195147, 1, 0, 0.772549, 1,
1.139303, -1.599771, 3.639974, 1, 0, 0.7686275, 1,
1.140116, 0.1172283, 1.179859, 1, 0, 0.7607843, 1,
1.141234, 2.013457, 0.2341944, 1, 0, 0.7568628, 1,
1.146414, 1.065, 0.8945348, 1, 0, 0.7490196, 1,
1.151278, -0.2002449, 3.083137, 1, 0, 0.7450981, 1,
1.152209, 0.1574475, 0.7179646, 1, 0, 0.7372549, 1,
1.169331, 0.9553269, 1.166014, 1, 0, 0.7333333, 1,
1.173599, 1.937636, 0.4879287, 1, 0, 0.7254902, 1,
1.173775, 0.9922596, 0.5862354, 1, 0, 0.7215686, 1,
1.174064, 0.5375637, 1.647535, 1, 0, 0.7137255, 1,
1.18783, -1.334083, 2.576125, 1, 0, 0.7098039, 1,
1.225305, 1.639559, 0.3939526, 1, 0, 0.7019608, 1,
1.230107, 1.336262, 0.8463374, 1, 0, 0.6941177, 1,
1.230428, -0.8799878, 2.580491, 1, 0, 0.6901961, 1,
1.238258, 0.7661396, 0.4104736, 1, 0, 0.682353, 1,
1.240002, -0.05682804, 3.858566, 1, 0, 0.6784314, 1,
1.241982, -0.2596087, 1.85537, 1, 0, 0.6705883, 1,
1.257003, 2.257303, -0.0003888162, 1, 0, 0.6666667, 1,
1.271681, 1.152078, -0.1361729, 1, 0, 0.6588235, 1,
1.273352, 1.12244, 0.8481012, 1, 0, 0.654902, 1,
1.288459, 0.1083463, 0.91436, 1, 0, 0.6470588, 1,
1.293981, 0.6486663, 1.004721, 1, 0, 0.6431373, 1,
1.296815, -0.4246887, 0.03890652, 1, 0, 0.6352941, 1,
1.304888, -1.033959, 2.255882, 1, 0, 0.6313726, 1,
1.30847, 0.1239633, 1.978748, 1, 0, 0.6235294, 1,
1.317394, 0.8911775, 1.609565, 1, 0, 0.6196079, 1,
1.329858, -0.0171722, 2.319601, 1, 0, 0.6117647, 1,
1.330626, 0.9736446, 1.210574, 1, 0, 0.6078432, 1,
1.331912, 0.0342849, 1.399999, 1, 0, 0.6, 1,
1.33277, 0.0946829, 2.821766, 1, 0, 0.5921569, 1,
1.335483, 0.6518133, 0.5451427, 1, 0, 0.5882353, 1,
1.33724, 0.1818423, 3.370406, 1, 0, 0.5803922, 1,
1.337359, 0.1554511, 1.25416, 1, 0, 0.5764706, 1,
1.339362, -1.126993, 1.491357, 1, 0, 0.5686275, 1,
1.340228, -2.238114, 0.9260151, 1, 0, 0.5647059, 1,
1.364993, -0.002932342, 1.086594, 1, 0, 0.5568628, 1,
1.367463, -1.421616, 3.667397, 1, 0, 0.5529412, 1,
1.370656, -0.863777, 1.932745, 1, 0, 0.5450981, 1,
1.37753, 0.8103752, 2.073384, 1, 0, 0.5411765, 1,
1.37756, -1.624097, 1.581767, 1, 0, 0.5333334, 1,
1.386201, 0.2923592, -0.1109397, 1, 0, 0.5294118, 1,
1.386539, 1.015372, 1.49407, 1, 0, 0.5215687, 1,
1.389534, 0.2754459, 0.2922109, 1, 0, 0.5176471, 1,
1.396306, -0.1866152, 0.7102423, 1, 0, 0.509804, 1,
1.399421, 0.3698442, 0.7091408, 1, 0, 0.5058824, 1,
1.40008, 0.8177363, -1.178275, 1, 0, 0.4980392, 1,
1.402851, -1.166864, 1.726969, 1, 0, 0.4901961, 1,
1.408526, -0.8176286, 1.324677, 1, 0, 0.4862745, 1,
1.410827, -0.4273851, 1.34703, 1, 0, 0.4784314, 1,
1.41724, 0.9143276, 1.610256, 1, 0, 0.4745098, 1,
1.427436, 1.182004, 1.976809, 1, 0, 0.4666667, 1,
1.433653, -0.3682255, 4.328773, 1, 0, 0.4627451, 1,
1.445872, -2.26566, 2.177907, 1, 0, 0.454902, 1,
1.446605, -0.3756465, 1.89545, 1, 0, 0.4509804, 1,
1.448522, 1.101218, -0.6102753, 1, 0, 0.4431373, 1,
1.450414, 2.048834, 1.773999, 1, 0, 0.4392157, 1,
1.450854, -0.6074805, 2.397236, 1, 0, 0.4313726, 1,
1.458455, -1.846225, 2.78751, 1, 0, 0.427451, 1,
1.461911, -1.694305, 3.815856, 1, 0, 0.4196078, 1,
1.462436, 1.52597, 0.4024963, 1, 0, 0.4156863, 1,
1.468297, -1.06143, 1.457155, 1, 0, 0.4078431, 1,
1.482492, 0.2482217, -0.4149157, 1, 0, 0.4039216, 1,
1.490774, 0.8128299, 1.642284, 1, 0, 0.3960784, 1,
1.495836, 0.7778872, -0.2765002, 1, 0, 0.3882353, 1,
1.510875, 1.059875, 2.012422, 1, 0, 0.3843137, 1,
1.513195, 0.3018645, 2.046244, 1, 0, 0.3764706, 1,
1.530668, -0.1596373, 2.684051, 1, 0, 0.372549, 1,
1.541644, -1.597449, 3.151624, 1, 0, 0.3647059, 1,
1.551741, 0.218957, -0.2537963, 1, 0, 0.3607843, 1,
1.598171, -0.320226, 2.093146, 1, 0, 0.3529412, 1,
1.605143, -1.566063, 2.836028, 1, 0, 0.3490196, 1,
1.610979, 1.236188, 1.864064, 1, 0, 0.3411765, 1,
1.614963, 1.245182, 0.6031712, 1, 0, 0.3372549, 1,
1.61871, 0.2635287, 1.117367, 1, 0, 0.3294118, 1,
1.621097, -0.932682, 1.727332, 1, 0, 0.3254902, 1,
1.632641, -0.3964384, 2.174874, 1, 0, 0.3176471, 1,
1.638502, -0.346456, 1.004091, 1, 0, 0.3137255, 1,
1.644881, -0.4250369, 1.742067, 1, 0, 0.3058824, 1,
1.648687, -0.2631056, 1.566859, 1, 0, 0.2980392, 1,
1.650377, 0.1153117, 1.893709, 1, 0, 0.2941177, 1,
1.652732, -0.8771302, 2.988086, 1, 0, 0.2862745, 1,
1.676321, -0.01979175, 1.394246, 1, 0, 0.282353, 1,
1.688174, -1.335255, 1.45207, 1, 0, 0.2745098, 1,
1.70599, 0.05077631, 0.1502901, 1, 0, 0.2705882, 1,
1.708596, 0.001530045, 2.385125, 1, 0, 0.2627451, 1,
1.711686, 0.2634085, 1.509808, 1, 0, 0.2588235, 1,
1.756508, 0.6033514, 1.960895, 1, 0, 0.2509804, 1,
1.756691, -1.948883, 1.974892, 1, 0, 0.2470588, 1,
1.76354, 0.1612716, -0.04130095, 1, 0, 0.2392157, 1,
1.764305, -0.3555088, 2.169748, 1, 0, 0.2352941, 1,
1.765788, -1.449426, 1.129313, 1, 0, 0.227451, 1,
1.805037, 0.5764188, 1.534582, 1, 0, 0.2235294, 1,
1.805176, 0.1839333, 2.243365, 1, 0, 0.2156863, 1,
1.824901, -0.8005602, 1.985111, 1, 0, 0.2117647, 1,
1.827947, 0.4310456, 1.254501, 1, 0, 0.2039216, 1,
1.84285, -0.9712422, 1.821883, 1, 0, 0.1960784, 1,
1.863532, 1.066358, 2.789881, 1, 0, 0.1921569, 1,
1.872154, -0.7563105, 1.440701, 1, 0, 0.1843137, 1,
1.874492, -0.8139078, 1.499284, 1, 0, 0.1803922, 1,
1.874847, 0.3372294, 1.627627, 1, 0, 0.172549, 1,
1.884002, -0.2239752, 2.951604, 1, 0, 0.1686275, 1,
1.930192, -0.8295987, 2.068536, 1, 0, 0.1607843, 1,
1.93101, 2.412996, 1.7732, 1, 0, 0.1568628, 1,
1.963557, 0.7140605, 1.927375, 1, 0, 0.1490196, 1,
1.97792, -0.9184958, 1.281731, 1, 0, 0.145098, 1,
1.983885, -0.8595772, 1.819572, 1, 0, 0.1372549, 1,
1.984558, 1.717013, -0.3999212, 1, 0, 0.1333333, 1,
2.004773, -0.08560626, -0.1088619, 1, 0, 0.1254902, 1,
2.017407, -1.671985, 2.862145, 1, 0, 0.1215686, 1,
2.024835, -0.1496383, 2.390418, 1, 0, 0.1137255, 1,
2.029844, 1.500463, 1.487817, 1, 0, 0.1098039, 1,
2.04201, 0.7909127, 1.193451, 1, 0, 0.1019608, 1,
2.084987, 1.730347, 2.14997, 1, 0, 0.09411765, 1,
2.102933, 1.166555, 1.542952, 1, 0, 0.09019608, 1,
2.120883, 0.6703307, 1.785941, 1, 0, 0.08235294, 1,
2.13827, 0.05104361, 2.056598, 1, 0, 0.07843138, 1,
2.170001, 0.9598223, 0.4276459, 1, 0, 0.07058824, 1,
2.180523, 0.192189, 1.93455, 1, 0, 0.06666667, 1,
2.189152, 0.6855703, 2.338404, 1, 0, 0.05882353, 1,
2.18926, 1.192677, 1.201185, 1, 0, 0.05490196, 1,
2.242341, -2.000593, 2.284416, 1, 0, 0.04705882, 1,
2.283252, -0.6317369, 2.166522, 1, 0, 0.04313726, 1,
2.4658, -0.7080336, 1.374507, 1, 0, 0.03529412, 1,
2.520372, -1.182259, 1.591923, 1, 0, 0.03137255, 1,
2.592752, 1.368643, 2.489278, 1, 0, 0.02352941, 1,
2.632228, 1.111688, 3.054892, 1, 0, 0.01960784, 1,
2.886918, -0.2165365, 2.961916, 1, 0, 0.01176471, 1,
3.567828, 0.4161421, 0.03300067, 1, 0, 0.007843138, 1
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
0.1772647, -4.334886, -7.143797, 0, -0.5, 0.5, 0.5,
0.1772647, -4.334886, -7.143797, 1, -0.5, 0.5, 0.5,
0.1772647, -4.334886, -7.143797, 1, 1.5, 0.5, 0.5,
0.1772647, -4.334886, -7.143797, 0, 1.5, 0.5, 0.5
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
-4.362699, 0.09549773, -7.143797, 0, -0.5, 0.5, 0.5,
-4.362699, 0.09549773, -7.143797, 1, -0.5, 0.5, 0.5,
-4.362699, 0.09549773, -7.143797, 1, 1.5, 0.5, 0.5,
-4.362699, 0.09549773, -7.143797, 0, 1.5, 0.5, 0.5
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
-4.362699, -4.334886, -0.1173255, 0, -0.5, 0.5, 0.5,
-4.362699, -4.334886, -0.1173255, 1, -0.5, 0.5, 0.5,
-4.362699, -4.334886, -0.1173255, 1, 1.5, 0.5, 0.5,
-4.362699, -4.334886, -0.1173255, 0, 1.5, 0.5, 0.5
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
-3, -3.31249, -5.522304,
3, -3.31249, -5.522304,
-3, -3.31249, -5.522304,
-3, -3.482889, -5.792552,
-2, -3.31249, -5.522304,
-2, -3.482889, -5.792552,
-1, -3.31249, -5.522304,
-1, -3.482889, -5.792552,
0, -3.31249, -5.522304,
0, -3.482889, -5.792552,
1, -3.31249, -5.522304,
1, -3.482889, -5.792552,
2, -3.31249, -5.522304,
2, -3.482889, -5.792552,
3, -3.31249, -5.522304,
3, -3.482889, -5.792552
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
-3, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
-3, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
-3, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
-3, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5,
-2, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
-2, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
-2, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
-2, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5,
-1, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
-1, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
-1, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
-1, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5,
0, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
0, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
0, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
0, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5,
1, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
1, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
1, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
1, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5,
2, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
2, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
2, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
2, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5,
3, -3.823688, -6.333051, 0, -0.5, 0.5, 0.5,
3, -3.823688, -6.333051, 1, -0.5, 0.5, 0.5,
3, -3.823688, -6.333051, 1, 1.5, 0.5, 0.5,
3, -3.823688, -6.333051, 0, 1.5, 0.5, 0.5
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
-3.315015, -3, -5.522304,
-3.315015, 3, -5.522304,
-3.315015, -3, -5.522304,
-3.489629, -3, -5.792552,
-3.315015, -2, -5.522304,
-3.489629, -2, -5.792552,
-3.315015, -1, -5.522304,
-3.489629, -1, -5.792552,
-3.315015, 0, -5.522304,
-3.489629, 0, -5.792552,
-3.315015, 1, -5.522304,
-3.489629, 1, -5.792552,
-3.315015, 2, -5.522304,
-3.489629, 2, -5.792552,
-3.315015, 3, -5.522304,
-3.489629, 3, -5.792552
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
-3.838857, -3, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, -3, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, -3, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, -3, -6.333051, 0, 1.5, 0.5, 0.5,
-3.838857, -2, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, -2, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, -2, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, -2, -6.333051, 0, 1.5, 0.5, 0.5,
-3.838857, -1, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, -1, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, -1, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, -1, -6.333051, 0, 1.5, 0.5, 0.5,
-3.838857, 0, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, 0, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, 0, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, 0, -6.333051, 0, 1.5, 0.5, 0.5,
-3.838857, 1, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, 1, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, 1, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, 1, -6.333051, 0, 1.5, 0.5, 0.5,
-3.838857, 2, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, 2, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, 2, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, 2, -6.333051, 0, 1.5, 0.5, 0.5,
-3.838857, 3, -6.333051, 0, -0.5, 0.5, 0.5,
-3.838857, 3, -6.333051, 1, -0.5, 0.5, 0.5,
-3.838857, 3, -6.333051, 1, 1.5, 0.5, 0.5,
-3.838857, 3, -6.333051, 0, 1.5, 0.5, 0.5
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
-3.315015, -3.31249, -4,
-3.315015, -3.31249, 4,
-3.315015, -3.31249, -4,
-3.489629, -3.482889, -4,
-3.315015, -3.31249, -2,
-3.489629, -3.482889, -2,
-3.315015, -3.31249, 0,
-3.489629, -3.482889, 0,
-3.315015, -3.31249, 2,
-3.489629, -3.482889, 2,
-3.315015, -3.31249, 4,
-3.489629, -3.482889, 4
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
-3.838857, -3.823688, -4, 0, -0.5, 0.5, 0.5,
-3.838857, -3.823688, -4, 1, -0.5, 0.5, 0.5,
-3.838857, -3.823688, -4, 1, 1.5, 0.5, 0.5,
-3.838857, -3.823688, -4, 0, 1.5, 0.5, 0.5,
-3.838857, -3.823688, -2, 0, -0.5, 0.5, 0.5,
-3.838857, -3.823688, -2, 1, -0.5, 0.5, 0.5,
-3.838857, -3.823688, -2, 1, 1.5, 0.5, 0.5,
-3.838857, -3.823688, -2, 0, 1.5, 0.5, 0.5,
-3.838857, -3.823688, 0, 0, -0.5, 0.5, 0.5,
-3.838857, -3.823688, 0, 1, -0.5, 0.5, 0.5,
-3.838857, -3.823688, 0, 1, 1.5, 0.5, 0.5,
-3.838857, -3.823688, 0, 0, 1.5, 0.5, 0.5,
-3.838857, -3.823688, 2, 0, -0.5, 0.5, 0.5,
-3.838857, -3.823688, 2, 1, -0.5, 0.5, 0.5,
-3.838857, -3.823688, 2, 1, 1.5, 0.5, 0.5,
-3.838857, -3.823688, 2, 0, 1.5, 0.5, 0.5,
-3.838857, -3.823688, 4, 0, -0.5, 0.5, 0.5,
-3.838857, -3.823688, 4, 1, -0.5, 0.5, 0.5,
-3.838857, -3.823688, 4, 1, 1.5, 0.5, 0.5,
-3.838857, -3.823688, 4, 0, 1.5, 0.5, 0.5
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
-3.315015, -3.31249, -5.522304,
-3.315015, 3.503485, -5.522304,
-3.315015, -3.31249, 5.287652,
-3.315015, 3.503485, 5.287652,
-3.315015, -3.31249, -5.522304,
-3.315015, -3.31249, 5.287652,
-3.315015, 3.503485, -5.522304,
-3.315015, 3.503485, 5.287652,
-3.315015, -3.31249, -5.522304,
3.669545, -3.31249, -5.522304,
-3.315015, -3.31249, 5.287652,
3.669545, -3.31249, 5.287652,
-3.315015, 3.503485, -5.522304,
3.669545, 3.503485, -5.522304,
-3.315015, 3.503485, 5.287652,
3.669545, 3.503485, 5.287652,
3.669545, -3.31249, -5.522304,
3.669545, 3.503485, -5.522304,
3.669545, -3.31249, 5.287652,
3.669545, 3.503485, 5.287652,
3.669545, -3.31249, -5.522304,
3.669545, -3.31249, 5.287652,
3.669545, 3.503485, -5.522304,
3.669545, 3.503485, 5.287652
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
var radius = 7.776649;
var distance = 34.59919;
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
mvMatrix.translate( -0.1772647, -0.09549773, 0.1173255 );
mvMatrix.scale( 1.203836, 1.233611, 0.777826 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59919);
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
O-ethyl_phosphorodit<-read.table("O-ethyl_phosphorodit.xyz")
```

```
## Error in read.table("O-ethyl_phosphorodit.xyz"): no lines available in input
```

```r
x<-O-ethyl_phosphorodit$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-ethyl_phosphorodit$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-ethyl_phosphorodit$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.213298, -0.515604, -3.791287, 0, 0, 1, 1, 1,
-2.953513, -2.012359, -1.2622, 1, 0, 0, 1, 1,
-2.662227, -0.06813499, -0.8008226, 1, 0, 0, 1, 1,
-2.366084, 0.8519722, 1.037718, 1, 0, 0, 1, 1,
-2.33054, 1.180123, -1.157259, 1, 0, 0, 1, 1,
-2.29254, -0.6188112, -1.405943, 1, 0, 0, 1, 1,
-2.162512, 1.580162, -2.060083, 0, 0, 0, 1, 1,
-2.139821, 0.8212623, -1.789281, 0, 0, 0, 1, 1,
-2.126953, 0.2299384, -2.405592, 0, 0, 0, 1, 1,
-2.124155, 0.4722276, -1.372764, 0, 0, 0, 1, 1,
-2.078874, 0.0392106, -1.311566, 0, 0, 0, 1, 1,
-2.036288, -0.495352, -1.473382, 0, 0, 0, 1, 1,
-2.016444, 1.024449, -1.30867, 0, 0, 0, 1, 1,
-2.008824, 0.9966211, -0.1979208, 1, 1, 1, 1, 1,
-2.008558, -1.626956, -1.126499, 1, 1, 1, 1, 1,
-2.007284, 0.06282332, -0.9427862, 1, 1, 1, 1, 1,
-2.003307, 1.241792, -0.9873623, 1, 1, 1, 1, 1,
-1.988501, 0.1909179, -2.775469, 1, 1, 1, 1, 1,
-1.953585, -1.398621, -0.4810922, 1, 1, 1, 1, 1,
-1.940689, 1.230691, -5.364877, 1, 1, 1, 1, 1,
-1.923827, 0.4408283, -1.395218, 1, 1, 1, 1, 1,
-1.887351, -0.9793283, -2.554168, 1, 1, 1, 1, 1,
-1.865675, -0.1140238, -2.98497, 1, 1, 1, 1, 1,
-1.847435, -2.295986, -2.440221, 1, 1, 1, 1, 1,
-1.804568, -0.5865874, -2.255414, 1, 1, 1, 1, 1,
-1.799286, -1.717442, -2.968962, 1, 1, 1, 1, 1,
-1.795354, 1.014139, -1.775945, 1, 1, 1, 1, 1,
-1.778217, -0.1633733, -1.789643, 1, 1, 1, 1, 1,
-1.735297, 1.093553, -1.976642, 0, 0, 1, 1, 1,
-1.721951, 0.971649, -1.556625, 1, 0, 0, 1, 1,
-1.709313, 0.7562926, -1.136719, 1, 0, 0, 1, 1,
-1.709222, 1.199943, -2.26799, 1, 0, 0, 1, 1,
-1.704002, 0.1543589, -1.505367, 1, 0, 0, 1, 1,
-1.696738, 1.344555, -1.394025, 1, 0, 0, 1, 1,
-1.689995, 0.1040324, -0.1944713, 0, 0, 0, 1, 1,
-1.688166, -0.2017911, -1.540058, 0, 0, 0, 1, 1,
-1.688133, 0.5757185, 0.1161609, 0, 0, 0, 1, 1,
-1.679408, 0.07344412, -2.465558, 0, 0, 0, 1, 1,
-1.665943, 2.106209, 0.7029955, 0, 0, 0, 1, 1,
-1.647123, 0.7332789, -1.485548, 0, 0, 0, 1, 1,
-1.642768, 1.372321, -1.108599, 0, 0, 0, 1, 1,
-1.639771, -0.4605986, -1.907181, 1, 1, 1, 1, 1,
-1.621168, 0.8023731, -0.8808762, 1, 1, 1, 1, 1,
-1.618568, 2.643656, -0.6953722, 1, 1, 1, 1, 1,
-1.615202, 0.7264109, -0.6018615, 1, 1, 1, 1, 1,
-1.611181, 1.677675, -2.052603, 1, 1, 1, 1, 1,
-1.549402, 1.029085, 0.1059272, 1, 1, 1, 1, 1,
-1.540765, -1.209104, -2.524134, 1, 1, 1, 1, 1,
-1.526374, 0.8761739, -1.416508, 1, 1, 1, 1, 1,
-1.523252, 1.024963, -0.573338, 1, 1, 1, 1, 1,
-1.520618, 1.260189, 0.1250201, 1, 1, 1, 1, 1,
-1.511387, 0.2787387, -1.343827, 1, 1, 1, 1, 1,
-1.510599, -0.09240809, -1.58935, 1, 1, 1, 1, 1,
-1.497301, -0.5743718, -1.825347, 1, 1, 1, 1, 1,
-1.494058, 1.18901, 0.1562538, 1, 1, 1, 1, 1,
-1.479732, 0.7954411, -0.1282673, 1, 1, 1, 1, 1,
-1.472647, 0.969678, -0.8984482, 0, 0, 1, 1, 1,
-1.456832, 0.04334567, -2.594274, 1, 0, 0, 1, 1,
-1.456347, 0.6494951, -0.7147576, 1, 0, 0, 1, 1,
-1.439712, 0.7028222, -0.0004839158, 1, 0, 0, 1, 1,
-1.430827, 0.01369915, -2.678612, 1, 0, 0, 1, 1,
-1.430481, -0.3609673, -1.750686, 1, 0, 0, 1, 1,
-1.429299, 1.741099, -1.04064, 0, 0, 0, 1, 1,
-1.429026, 0.260446, -1.166823, 0, 0, 0, 1, 1,
-1.406323, 0.6835623, -1.204402, 0, 0, 0, 1, 1,
-1.404377, -0.414027, -2.669405, 0, 0, 0, 1, 1,
-1.402376, 0.2488411, -2.637199, 0, 0, 0, 1, 1,
-1.402193, 0.3697303, -0.7632564, 0, 0, 0, 1, 1,
-1.392082, 0.5459586, -1.434885, 0, 0, 0, 1, 1,
-1.391654, -0.3018585, -0.1918935, 1, 1, 1, 1, 1,
-1.391197, 0.7292984, -0.08538485, 1, 1, 1, 1, 1,
-1.374573, -0.8087975, -2.522975, 1, 1, 1, 1, 1,
-1.369461, -0.9213273, -2.31541, 1, 1, 1, 1, 1,
-1.349008, -0.723267, -0.1685972, 1, 1, 1, 1, 1,
-1.338794, -1.51142, -3.710146, 1, 1, 1, 1, 1,
-1.327911, 0.4864684, -2.548205, 1, 1, 1, 1, 1,
-1.327752, -0.09480131, -2.008446, 1, 1, 1, 1, 1,
-1.323568, -0.5745302, -2.660668, 1, 1, 1, 1, 1,
-1.305219, 0.09102748, 0.01877742, 1, 1, 1, 1, 1,
-1.304439, -0.06747033, -0.95613, 1, 1, 1, 1, 1,
-1.304187, 1.097593, 0.8532965, 1, 1, 1, 1, 1,
-1.293677, -0.5648426, -3.822866, 1, 1, 1, 1, 1,
-1.291602, 2.15519, -1.114323, 1, 1, 1, 1, 1,
-1.280854, 0.5516113, -3.354092, 1, 1, 1, 1, 1,
-1.270946, 0.4159735, -0.3217377, 0, 0, 1, 1, 1,
-1.266893, 0.7577621, 0.3234396, 1, 0, 0, 1, 1,
-1.263223, 1.743727, 0.3253971, 1, 0, 0, 1, 1,
-1.258197, 0.5425648, -1.571337, 1, 0, 0, 1, 1,
-1.257139, 1.303751, -0.001573888, 1, 0, 0, 1, 1,
-1.255849, 0.2611678, -2.63333, 1, 0, 0, 1, 1,
-1.254233, 0.6305107, -1.256808, 0, 0, 0, 1, 1,
-1.244767, 0.5851106, 0.03248842, 0, 0, 0, 1, 1,
-1.239014, -0.2894682, -2.949345, 0, 0, 0, 1, 1,
-1.238292, 0.4440233, 0.03663698, 0, 0, 0, 1, 1,
-1.238286, 0.4511813, -0.8488298, 0, 0, 0, 1, 1,
-1.235331, -0.3286392, -1.223538, 0, 0, 0, 1, 1,
-1.228253, 0.8074778, -0.5221192, 0, 0, 0, 1, 1,
-1.222478, -0.4138178, -2.846014, 1, 1, 1, 1, 1,
-1.214328, 1.119333, -0.2225726, 1, 1, 1, 1, 1,
-1.209063, 0.8227482, -0.4212516, 1, 1, 1, 1, 1,
-1.207652, 1.347209, 1.222625, 1, 1, 1, 1, 1,
-1.197078, -1.377509, -2.461155, 1, 1, 1, 1, 1,
-1.196196, 1.517761, -2.495775, 1, 1, 1, 1, 1,
-1.187644, 0.8356335, -1.27572, 1, 1, 1, 1, 1,
-1.181927, 0.7992055, 1.312097, 1, 1, 1, 1, 1,
-1.177379, -0.7196813, -1.611586, 1, 1, 1, 1, 1,
-1.165514, 1.492249, -2.24747, 1, 1, 1, 1, 1,
-1.163027, -0.269795, -1.018984, 1, 1, 1, 1, 1,
-1.156922, -0.3643709, -2.265703, 1, 1, 1, 1, 1,
-1.150483, 0.08052545, -1.186309, 1, 1, 1, 1, 1,
-1.14782, 1.871182, -1.773821, 1, 1, 1, 1, 1,
-1.147734, 0.4702656, -1.980171, 1, 1, 1, 1, 1,
-1.146687, 0.5660172, 0.1470707, 0, 0, 1, 1, 1,
-1.139248, -0.6245806, -2.178728, 1, 0, 0, 1, 1,
-1.132627, -1.141479, -1.545632, 1, 0, 0, 1, 1,
-1.124405, 1.310618, -1.992368, 1, 0, 0, 1, 1,
-1.123268, 0.7356943, 2.459726, 1, 0, 0, 1, 1,
-1.119554, -1.018146, -2.558007, 1, 0, 0, 1, 1,
-1.117754, 1.23047, -2.406106, 0, 0, 0, 1, 1,
-1.114257, -0.7278975, -2.148284, 0, 0, 0, 1, 1,
-1.111856, 1.118668, -0.1294197, 0, 0, 0, 1, 1,
-1.109621, 0.257343, -1.062248, 0, 0, 0, 1, 1,
-1.108716, 1.492849, -0.7212779, 0, 0, 0, 1, 1,
-1.104498, -0.03628203, -3.761573, 0, 0, 0, 1, 1,
-1.098808, 0.9769571, -1.176157, 0, 0, 0, 1, 1,
-1.097357, 1.785122, 0.2208016, 1, 1, 1, 1, 1,
-1.083626, 0.8028848, -1.903051, 1, 1, 1, 1, 1,
-1.069302, -0.6863106, -0.7790682, 1, 1, 1, 1, 1,
-1.060596, -0.8768874, -4.688285, 1, 1, 1, 1, 1,
-1.057064, -1.21697, -2.589572, 1, 1, 1, 1, 1,
-1.056635, -0.1654857, -1.955071, 1, 1, 1, 1, 1,
-1.054184, -0.5254914, -2.261029, 1, 1, 1, 1, 1,
-1.033177, -1.705647, -2.546648, 1, 1, 1, 1, 1,
-1.031639, -0.8430527, -3.577403, 1, 1, 1, 1, 1,
-1.030003, -0.4799593, -0.6092135, 1, 1, 1, 1, 1,
-1.02797, -0.4401185, -2.51403, 1, 1, 1, 1, 1,
-1.026693, -0.8285196, -1.996335, 1, 1, 1, 1, 1,
-1.012856, 0.4943011, -1.747139, 1, 1, 1, 1, 1,
-1.012518, -0.8604209, -4.119253, 1, 1, 1, 1, 1,
-1.008482, -1.834715, -2.616693, 1, 1, 1, 1, 1,
-1.003095, 0.3745808, -0.9195813, 0, 0, 1, 1, 1,
-0.9885285, 1.444733, -0.2450253, 1, 0, 0, 1, 1,
-0.9877243, -1.001486, -2.544774, 1, 0, 0, 1, 1,
-0.9840926, 1.687004, 0.3826669, 1, 0, 0, 1, 1,
-0.9819756, -0.7753912, -2.76631, 1, 0, 0, 1, 1,
-0.980545, -0.8591421, -2.915991, 1, 0, 0, 1, 1,
-0.9799037, -1.027902, -1.151778, 0, 0, 0, 1, 1,
-0.9795477, -0.392903, -1.724435, 0, 0, 0, 1, 1,
-0.9688527, -0.9762074, -1.738295, 0, 0, 0, 1, 1,
-0.9623141, -1.496745, -2.226165, 0, 0, 0, 1, 1,
-0.9579626, 1.572014, -0.1727029, 0, 0, 0, 1, 1,
-0.9524136, 1.847857, -1.36125, 0, 0, 0, 1, 1,
-0.9389242, 1.557989, -1.610417, 0, 0, 0, 1, 1,
-0.9371634, 0.813015, -2.488466, 1, 1, 1, 1, 1,
-0.9335415, 0.2605175, -1.480768, 1, 1, 1, 1, 1,
-0.9326572, 1.509463, 0.3998604, 1, 1, 1, 1, 1,
-0.9308397, -0.3864198, -3.097569, 1, 1, 1, 1, 1,
-0.9288667, 0.8743113, -0.6374102, 1, 1, 1, 1, 1,
-0.9259601, -0.3504429, -2.967576, 1, 1, 1, 1, 1,
-0.9072248, -0.9870518, 0.2123156, 1, 1, 1, 1, 1,
-0.9065444, -0.9118502, -3.017718, 1, 1, 1, 1, 1,
-0.9061931, -0.8161744, -2.382292, 1, 1, 1, 1, 1,
-0.8995506, 0.8491237, -1.243883, 1, 1, 1, 1, 1,
-0.8984969, 0.2568985, -1.00238, 1, 1, 1, 1, 1,
-0.892597, -0.4308424, -0.7239943, 1, 1, 1, 1, 1,
-0.8912595, 0.1391442, -2.554688, 1, 1, 1, 1, 1,
-0.8872831, -0.3810208, -3.292852, 1, 1, 1, 1, 1,
-0.8836703, 0.4705224, 0.2325221, 1, 1, 1, 1, 1,
-0.8795481, -0.6890432, -2.232909, 0, 0, 1, 1, 1,
-0.8794397, 0.3776597, 0.01899836, 1, 0, 0, 1, 1,
-0.8706663, -1.829461, -4.525839, 1, 0, 0, 1, 1,
-0.8667912, -0.9047568, -1.759972, 1, 0, 0, 1, 1,
-0.864513, -2.77612, -1.868423, 1, 0, 0, 1, 1,
-0.8622589, -0.8874028, -2.374214, 1, 0, 0, 1, 1,
-0.8622013, 1.515587, 0.3629855, 0, 0, 0, 1, 1,
-0.8605651, -1.203256, -4.167566, 0, 0, 0, 1, 1,
-0.856699, 1.653725, -0.04123575, 0, 0, 0, 1, 1,
-0.8556554, 0.6958315, -0.695917, 0, 0, 0, 1, 1,
-0.8546019, 0.7924106, 0.3196059, 0, 0, 0, 1, 1,
-0.8519822, 1.013054, -0.8548809, 0, 0, 0, 1, 1,
-0.8456567, -0.4689651, -2.429614, 0, 0, 0, 1, 1,
-0.8430951, -0.1643888, -2.571905, 1, 1, 1, 1, 1,
-0.8358703, -2.288909, -1.32294, 1, 1, 1, 1, 1,
-0.8223692, 0.02842944, -2.692377, 1, 1, 1, 1, 1,
-0.8219026, -0.7282115, -3.798768, 1, 1, 1, 1, 1,
-0.8211414, -0.5716912, -1.112125, 1, 1, 1, 1, 1,
-0.8176067, 0.01023378, -1.645365, 1, 1, 1, 1, 1,
-0.8141837, 0.559989, -0.9686042, 1, 1, 1, 1, 1,
-0.8139305, 2.193847, 0.683187, 1, 1, 1, 1, 1,
-0.8133305, -1.263474, -2.724887, 1, 1, 1, 1, 1,
-0.8130837, 0.2277863, -1.897658, 1, 1, 1, 1, 1,
-0.812175, 1.64471, -0.5015067, 1, 1, 1, 1, 1,
-0.8121443, -0.9870278, -2.808727, 1, 1, 1, 1, 1,
-0.8111243, -0.7017739, -3.303336, 1, 1, 1, 1, 1,
-0.8096394, 0.7095919, -2.761558, 1, 1, 1, 1, 1,
-0.8095487, 1.464849, 0.6640546, 1, 1, 1, 1, 1,
-0.803709, 0.7899471, -1.986618, 0, 0, 1, 1, 1,
-0.8034918, 0.1348721, -2.026293, 1, 0, 0, 1, 1,
-0.8019405, 0.3422637, -0.8134853, 1, 0, 0, 1, 1,
-0.8012301, -0.6783746, -1.406906, 1, 0, 0, 1, 1,
-0.7968652, 0.4838415, -2.959074, 1, 0, 0, 1, 1,
-0.7942371, 1.176806, -2.386652, 1, 0, 0, 1, 1,
-0.794001, -0.5396068, -4.805958, 0, 0, 0, 1, 1,
-0.7934529, -0.07853774, -1.788708, 0, 0, 0, 1, 1,
-0.7914, 0.7283422, -0.9131351, 0, 0, 0, 1, 1,
-0.7843312, -0.1987891, -1.094576, 0, 0, 0, 1, 1,
-0.7811434, -0.2600251, -2.004704, 0, 0, 0, 1, 1,
-0.7801893, -0.07407802, -1.893524, 0, 0, 0, 1, 1,
-0.7800409, -0.4131207, -2.253046, 0, 0, 0, 1, 1,
-0.7772774, -1.035565, -1.411726, 1, 1, 1, 1, 1,
-0.7736802, -0.05667752, -3.149605, 1, 1, 1, 1, 1,
-0.7689624, 0.4521412, -0.7982282, 1, 1, 1, 1, 1,
-0.7684896, -0.9896268, -2.908613, 1, 1, 1, 1, 1,
-0.7645748, -0.03530955, -2.180214, 1, 1, 1, 1, 1,
-0.7641651, -0.3656768, -1.84664, 1, 1, 1, 1, 1,
-0.7605526, -0.1509482, -2.338314, 1, 1, 1, 1, 1,
-0.7574297, -0.1148193, -3.743984, 1, 1, 1, 1, 1,
-0.7531938, -0.123872, -0.9472724, 1, 1, 1, 1, 1,
-0.7523027, 1.060343, 0.5180969, 1, 1, 1, 1, 1,
-0.7360083, 0.2157345, -0.9491557, 1, 1, 1, 1, 1,
-0.7357298, -0.1779426, -3.435843, 1, 1, 1, 1, 1,
-0.7353733, 0.7520474, 0.4599246, 1, 1, 1, 1, 1,
-0.7346012, 1.451859, -1.044636, 1, 1, 1, 1, 1,
-0.7329983, 0.07717284, -0.8055493, 1, 1, 1, 1, 1,
-0.7326469, -0.02592628, -0.594199, 0, 0, 1, 1, 1,
-0.7322395, 1.72869, -0.1858406, 1, 0, 0, 1, 1,
-0.7305606, -0.4832848, -3.540524, 1, 0, 0, 1, 1,
-0.7304485, -0.5505947, -0.6989313, 1, 0, 0, 1, 1,
-0.7289594, 0.07654878, -1.21598, 1, 0, 0, 1, 1,
-0.726606, -0.7655271, -4.223285, 1, 0, 0, 1, 1,
-0.7261186, 0.1910896, -2.072098, 0, 0, 0, 1, 1,
-0.7256162, 0.9082787, -1.02658, 0, 0, 0, 1, 1,
-0.7207932, 1.33939, 1.404492, 0, 0, 0, 1, 1,
-0.7180897, -0.6726295, -2.80615, 0, 0, 0, 1, 1,
-0.7169113, 0.05955609, -1.893027, 0, 0, 0, 1, 1,
-0.7128932, -1.669654, -3.938551, 0, 0, 0, 1, 1,
-0.7127607, -1.263135, -1.124396, 0, 0, 0, 1, 1,
-0.7096764, -0.6503711, -2.495312, 1, 1, 1, 1, 1,
-0.7069851, -0.1140778, -1.960934, 1, 1, 1, 1, 1,
-0.6965296, -1.067998, -1.065695, 1, 1, 1, 1, 1,
-0.6951092, -0.4560137, -0.8435733, 1, 1, 1, 1, 1,
-0.6944778, -0.03522684, -0.6361443, 1, 1, 1, 1, 1,
-0.6932231, -0.2643884, 0.0083067, 1, 1, 1, 1, 1,
-0.6925827, -1.952556, -3.199996, 1, 1, 1, 1, 1,
-0.6904864, -0.1845145, -1.386406, 1, 1, 1, 1, 1,
-0.6873052, 1.874949, -0.5736259, 1, 1, 1, 1, 1,
-0.6860906, -0.5547768, -2.192491, 1, 1, 1, 1, 1,
-0.6759815, 0.1738184, -2.354603, 1, 1, 1, 1, 1,
-0.6737815, 1.672363, -0.3453892, 1, 1, 1, 1, 1,
-0.6635759, 0.3098075, -0.7332326, 1, 1, 1, 1, 1,
-0.6631347, -0.2261119, -1.662336, 1, 1, 1, 1, 1,
-0.6615725, 1.220411, 0.05398168, 1, 1, 1, 1, 1,
-0.6614166, 0.4550839, -2.371306, 0, 0, 1, 1, 1,
-0.6568937, 1.22907, -0.7847068, 1, 0, 0, 1, 1,
-0.6557318, -1.824194, -3.95336, 1, 0, 0, 1, 1,
-0.6538197, 1.698941, -1.14467, 1, 0, 0, 1, 1,
-0.6523589, -1.377675, -1.276767, 1, 0, 0, 1, 1,
-0.6478547, 0.008701066, -1.170188, 1, 0, 0, 1, 1,
-0.6478469, 0.2389657, -0.4112627, 0, 0, 0, 1, 1,
-0.6458619, 0.9024264, 0.7816925, 0, 0, 0, 1, 1,
-0.6453597, -1.649237, -5.306225, 0, 0, 0, 1, 1,
-0.6452391, 0.6288862, -2.050952, 0, 0, 0, 1, 1,
-0.6414188, -0.1829796, -2.037466, 0, 0, 0, 1, 1,
-0.6406907, 0.4732495, -0.074968, 0, 0, 0, 1, 1,
-0.6371831, 0.944157, 0.4897742, 0, 0, 0, 1, 1,
-0.6288342, -0.6216629, -1.535704, 1, 1, 1, 1, 1,
-0.6265465, 0.07168029, -0.9578033, 1, 1, 1, 1, 1,
-0.6233693, -2.027069, -3.416539, 1, 1, 1, 1, 1,
-0.6222066, 0.5207978, -0.1923451, 1, 1, 1, 1, 1,
-0.6187458, -0.6179997, -3.41403, 1, 1, 1, 1, 1,
-0.6182104, -1.471489, -1.795783, 1, 1, 1, 1, 1,
-0.6176556, -0.2940847, -2.049407, 1, 1, 1, 1, 1,
-0.6126627, -1.380896, -2.538621, 1, 1, 1, 1, 1,
-0.6084442, 0.1213735, -0.6699024, 1, 1, 1, 1, 1,
-0.6016994, -0.8196943, -2.550852, 1, 1, 1, 1, 1,
-0.6006796, -0.06128775, -1.69568, 1, 1, 1, 1, 1,
-0.5978978, 1.351048, -0.4378687, 1, 1, 1, 1, 1,
-0.5960758, -0.1211288, -0.142928, 1, 1, 1, 1, 1,
-0.5952134, 0.09715104, -0.7505788, 1, 1, 1, 1, 1,
-0.5921709, -1.205399, -1.883237, 1, 1, 1, 1, 1,
-0.5817147, -2.095849, -2.382587, 0, 0, 1, 1, 1,
-0.580566, -0.4909748, -0.7034906, 1, 0, 0, 1, 1,
-0.5798956, 0.2840284, -0.9986493, 1, 0, 0, 1, 1,
-0.5790949, 1.182973, -0.6831787, 1, 0, 0, 1, 1,
-0.5787088, 0.3264397, -0.4609743, 1, 0, 0, 1, 1,
-0.5760335, 1.126737, -0.4725057, 1, 0, 0, 1, 1,
-0.5736412, 0.9677145, 0.800048, 0, 0, 0, 1, 1,
-0.5710052, -0.8433397, -1.494165, 0, 0, 0, 1, 1,
-0.5677205, -1.088659, -2.744386, 0, 0, 0, 1, 1,
-0.5601599, 0.5594606, -0.4598252, 0, 0, 0, 1, 1,
-0.5584868, -1.259949, -1.282099, 0, 0, 0, 1, 1,
-0.5499862, -1.773074, -1.593582, 0, 0, 0, 1, 1,
-0.5482889, -0.2501164, -2.437107, 0, 0, 0, 1, 1,
-0.5470492, -1.595183, -2.711159, 1, 1, 1, 1, 1,
-0.5460702, -0.8670561, -3.965822, 1, 1, 1, 1, 1,
-0.5451216, 0.5118697, -1.928787, 1, 1, 1, 1, 1,
-0.5435534, 0.6717632, -0.1244402, 1, 1, 1, 1, 1,
-0.5413622, -0.4649103, -3.1064, 1, 1, 1, 1, 1,
-0.5401986, -0.3187156, -1.057611, 1, 1, 1, 1, 1,
-0.5397306, 0.8305861, -0.5485122, 1, 1, 1, 1, 1,
-0.5360654, -1.37316, -3.199841, 1, 1, 1, 1, 1,
-0.5349163, 0.2217587, -1.152626, 1, 1, 1, 1, 1,
-0.5329134, -0.3714901, -1.166932, 1, 1, 1, 1, 1,
-0.5311518, 1.449273, -2.064482, 1, 1, 1, 1, 1,
-0.5300264, -0.3396938, -1.619307, 1, 1, 1, 1, 1,
-0.5255671, -0.6126547, -3.039254, 1, 1, 1, 1, 1,
-0.5231903, 1.21979, 0.566049, 1, 1, 1, 1, 1,
-0.5226133, 1.133183, 0.1857831, 1, 1, 1, 1, 1,
-0.521163, -0.6692835, -1.218948, 0, 0, 1, 1, 1,
-0.5175814, -1.100835, -3.394648, 1, 0, 0, 1, 1,
-0.5167035, 0.2947671, 0.08051184, 1, 0, 0, 1, 1,
-0.5125185, 0.5880412, 0.5454291, 1, 0, 0, 1, 1,
-0.5108709, 1.208525, 0.2149858, 1, 0, 0, 1, 1,
-0.5107545, -0.5919048, -2.81546, 1, 0, 0, 1, 1,
-0.5064218, -1.011278, -2.038669, 0, 0, 0, 1, 1,
-0.506379, 1.524353, -2.080928, 0, 0, 0, 1, 1,
-0.5049086, -1.947126, -3.453406, 0, 0, 0, 1, 1,
-0.5024144, -0.5556597, -2.278398, 0, 0, 0, 1, 1,
-0.5010412, 0.2560067, -0.1157157, 0, 0, 0, 1, 1,
-0.4985834, 0.03764142, -2.391941, 0, 0, 0, 1, 1,
-0.4976124, 2.271833, 0.2731958, 0, 0, 0, 1, 1,
-0.493687, 1.536638, -0.1165289, 1, 1, 1, 1, 1,
-0.4926966, 0.7321339, -1.407963, 1, 1, 1, 1, 1,
-0.4869332, 0.4726273, -1.398985, 1, 1, 1, 1, 1,
-0.4867564, -1.174057, -2.495175, 1, 1, 1, 1, 1,
-0.4811648, 0.02386474, -4.146661, 1, 1, 1, 1, 1,
-0.4795472, 1.716938, -0.6003221, 1, 1, 1, 1, 1,
-0.4788456, 0.2558647, -2.033518, 1, 1, 1, 1, 1,
-0.4729158, -0.2704456, -2.525923, 1, 1, 1, 1, 1,
-0.4722843, -0.08863439, -1.040798, 1, 1, 1, 1, 1,
-0.4710968, 0.6564437, -0.548889, 1, 1, 1, 1, 1,
-0.470335, -1.400081, -3.608167, 1, 1, 1, 1, 1,
-0.4691585, 0.6642889, -2.27581, 1, 1, 1, 1, 1,
-0.468963, -0.4087787, -0.7320864, 1, 1, 1, 1, 1,
-0.4659162, -2.548041, -2.94238, 1, 1, 1, 1, 1,
-0.4492822, 1.236459, -0.1888897, 1, 1, 1, 1, 1,
-0.4478269, 1.392511, 0.3793, 0, 0, 1, 1, 1,
-0.4467696, 1.915199, 0.8597741, 1, 0, 0, 1, 1,
-0.4378726, 0.1669764, -1.128173, 1, 0, 0, 1, 1,
-0.435974, 1.382483, 1.374354, 1, 0, 0, 1, 1,
-0.43419, -1.007901, -3.764427, 1, 0, 0, 1, 1,
-0.4337789, -0.5459448, -3.166851, 1, 0, 0, 1, 1,
-0.4310247, 0.03698704, -1.242915, 0, 0, 0, 1, 1,
-0.4295635, -2.286296, -1.650023, 0, 0, 0, 1, 1,
-0.4255389, -0.9050284, -1.994895, 0, 0, 0, 1, 1,
-0.4230568, -1.041933, -2.518499, 0, 0, 0, 1, 1,
-0.4204865, -1.247056, -2.839779, 0, 0, 0, 1, 1,
-0.4186599, -1.048485, -2.534727, 0, 0, 0, 1, 1,
-0.4182121, -1.454024, -2.425744, 0, 0, 0, 1, 1,
-0.4162646, 0.06102801, 1.180891, 1, 1, 1, 1, 1,
-0.4124967, 1.004069, -0.7601131, 1, 1, 1, 1, 1,
-0.4109012, 0.7020189, -0.0710559, 1, 1, 1, 1, 1,
-0.4089648, -0.4971155, -1.935753, 1, 1, 1, 1, 1,
-0.4069434, -1.339421, -0.9102899, 1, 1, 1, 1, 1,
-0.4062293, -1.700004, -3.227129, 1, 1, 1, 1, 1,
-0.402721, -3.213228, -2.44461, 1, 1, 1, 1, 1,
-0.4013862, 2.016677, -1.636622, 1, 1, 1, 1, 1,
-0.4013546, -1.044053, -1.741947, 1, 1, 1, 1, 1,
-0.4006556, 0.07932049, -1.237538, 1, 1, 1, 1, 1,
-0.4001716, 0.6395885, -0.9264007, 1, 1, 1, 1, 1,
-0.3988427, -1.163721, -2.83909, 1, 1, 1, 1, 1,
-0.396303, 0.2368272, -1.07678, 1, 1, 1, 1, 1,
-0.3885797, 0.0004720658, -0.8131173, 1, 1, 1, 1, 1,
-0.3882411, -0.5843098, -2.583058, 1, 1, 1, 1, 1,
-0.3870691, -1.536801, -1.060592, 0, 0, 1, 1, 1,
-0.3814211, -0.3288837, -1.696495, 1, 0, 0, 1, 1,
-0.3775441, 2.098946, 0.3802271, 1, 0, 0, 1, 1,
-0.3751714, 0.1172967, -0.9648674, 1, 0, 0, 1, 1,
-0.3716078, -0.3003089, -4.496147, 1, 0, 0, 1, 1,
-0.3630943, 1.021106, 0.7969744, 1, 0, 0, 1, 1,
-0.3622252, -0.1442575, -1.60604, 0, 0, 0, 1, 1,
-0.3612075, -0.994435, -2.851263, 0, 0, 0, 1, 1,
-0.3591153, -0.3993022, -3.074502, 0, 0, 0, 1, 1,
-0.3587096, -1.627573, -1.36029, 0, 0, 0, 1, 1,
-0.3540846, -0.3251702, -0.2899245, 0, 0, 0, 1, 1,
-0.3438185, -1.317013, -4.224468, 0, 0, 0, 1, 1,
-0.3425532, -1.12131, -2.337125, 0, 0, 0, 1, 1,
-0.3422821, -0.5769428, -3.037789, 1, 1, 1, 1, 1,
-0.3413278, -0.1252795, -2.96123, 1, 1, 1, 1, 1,
-0.3382019, 1.025804, -0.664044, 1, 1, 1, 1, 1,
-0.3324793, 1.259652, -2.229377, 1, 1, 1, 1, 1,
-0.3302805, -0.06386957, -3.726086, 1, 1, 1, 1, 1,
-0.3269968, 1.508459, -0.7386423, 1, 1, 1, 1, 1,
-0.3262089, 0.1294683, -2.136106, 1, 1, 1, 1, 1,
-0.3237614, 1.103792, -0.6120902, 1, 1, 1, 1, 1,
-0.3236679, -1.256133, -4.129578, 1, 1, 1, 1, 1,
-0.322921, 1.856716, -0.2301607, 1, 1, 1, 1, 1,
-0.315206, 2.04983, -0.2315644, 1, 1, 1, 1, 1,
-0.3110743, 1.730725, -1.240411, 1, 1, 1, 1, 1,
-0.3037094, -1.442076, -4.005942, 1, 1, 1, 1, 1,
-0.3027914, -0.8256418, -3.451398, 1, 1, 1, 1, 1,
-0.2990154, -0.6030529, -3.754116, 1, 1, 1, 1, 1,
-0.2973567, -0.5857918, -2.677404, 0, 0, 1, 1, 1,
-0.296105, -0.4604167, -4.047155, 1, 0, 0, 1, 1,
-0.2924218, 0.5446556, 0.2011456, 1, 0, 0, 1, 1,
-0.2893545, 0.9407551, -1.601559, 1, 0, 0, 1, 1,
-0.2870545, 0.5113314, -2.377482, 1, 0, 0, 1, 1,
-0.2865181, 0.9682587, -0.8198102, 1, 0, 0, 1, 1,
-0.2751088, -0.5132017, -2.667042, 0, 0, 0, 1, 1,
-0.2750763, 0.6781818, -2.090802, 0, 0, 0, 1, 1,
-0.2737187, -0.1733561, -1.503171, 0, 0, 0, 1, 1,
-0.2732648, -1.185219, -2.918968, 0, 0, 0, 1, 1,
-0.2724527, -1.007669, -1.960743, 0, 0, 0, 1, 1,
-0.268699, 0.4322979, -1.685861, 0, 0, 0, 1, 1,
-0.267011, 0.8305113, -0.6330364, 0, 0, 0, 1, 1,
-0.2522105, -0.636632, -1.669221, 1, 1, 1, 1, 1,
-0.2517139, 0.2964617, 0.8614408, 1, 1, 1, 1, 1,
-0.2515981, 0.5801837, -1.561891, 1, 1, 1, 1, 1,
-0.2514071, 0.1476443, -1.090631, 1, 1, 1, 1, 1,
-0.2462108, -0.6442145, -2.426453, 1, 1, 1, 1, 1,
-0.2457206, -0.326941, -2.093661, 1, 1, 1, 1, 1,
-0.2447871, 0.2490632, -3.533764, 1, 1, 1, 1, 1,
-0.2405751, 1.089848, 1.874447, 1, 1, 1, 1, 1,
-0.232507, 0.406329, -0.4938295, 1, 1, 1, 1, 1,
-0.2316612, -0.7616573, -3.672629, 1, 1, 1, 1, 1,
-0.2315155, -0.3462493, -3.618057, 1, 1, 1, 1, 1,
-0.2292327, 0.03957839, -0.405797, 1, 1, 1, 1, 1,
-0.2235457, 0.258045, -1.253626, 1, 1, 1, 1, 1,
-0.2221368, 0.0951167, -1.364417, 1, 1, 1, 1, 1,
-0.2174069, 0.3062463, -1.453654, 1, 1, 1, 1, 1,
-0.2160311, 0.8709716, -0.2966013, 0, 0, 1, 1, 1,
-0.2126908, -0.8614263, -3.114566, 1, 0, 0, 1, 1,
-0.2122429, -0.6258925, -4.739084, 1, 0, 0, 1, 1,
-0.2053472, 0.9870335, -1.13974, 1, 0, 0, 1, 1,
-0.2043921, 0.5797276, 0.8580208, 1, 0, 0, 1, 1,
-0.2031021, 0.3925992, -0.918985, 1, 0, 0, 1, 1,
-0.1990549, 0.7755315, 1.212954, 0, 0, 0, 1, 1,
-0.198023, -0.00508603, -0.8929704, 0, 0, 0, 1, 1,
-0.1978505, -0.492525, -2.112448, 0, 0, 0, 1, 1,
-0.1968497, 0.4331559, 0.493172, 0, 0, 0, 1, 1,
-0.1955549, 0.2840225, -1.252501, 0, 0, 0, 1, 1,
-0.1937982, 0.182827, -1.750356, 0, 0, 0, 1, 1,
-0.1913699, 0.7116389, -0.5595799, 0, 0, 0, 1, 1,
-0.1849169, -0.8687434, -3.197645, 1, 1, 1, 1, 1,
-0.1845778, 0.990819, -1.299419, 1, 1, 1, 1, 1,
-0.1823533, 1.113448, 0.994599, 1, 1, 1, 1, 1,
-0.181592, -0.09414716, -1.552305, 1, 1, 1, 1, 1,
-0.1813361, 1.950748, 1.222124, 1, 1, 1, 1, 1,
-0.1777553, -0.2460395, -2.42874, 1, 1, 1, 1, 1,
-0.1703496, 1.433602, 0.4653972, 1, 1, 1, 1, 1,
-0.1691096, 0.4481553, -0.1813052, 1, 1, 1, 1, 1,
-0.1647893, 0.1097492, 0.4751931, 1, 1, 1, 1, 1,
-0.1608273, -1.11827, -2.846171, 1, 1, 1, 1, 1,
-0.1498017, -0.06689103, -2.3109, 1, 1, 1, 1, 1,
-0.1408068, -0.01091688, -0.8189139, 1, 1, 1, 1, 1,
-0.1374255, -0.5508569, -4.126327, 1, 1, 1, 1, 1,
-0.1354543, -0.7283254, -0.1573539, 1, 1, 1, 1, 1,
-0.1349629, 0.72554, 0.02241443, 1, 1, 1, 1, 1,
-0.1307065, 1.378023, 0.2610096, 0, 0, 1, 1, 1,
-0.1301611, 0.3122481, 0.3953598, 1, 0, 0, 1, 1,
-0.1278591, -0.7822713, -4.006678, 1, 0, 0, 1, 1,
-0.1274464, 1.321706, 0.1711249, 1, 0, 0, 1, 1,
-0.1271474, -0.3563855, -2.486495, 1, 0, 0, 1, 1,
-0.1223514, 0.5822316, 0.8583331, 1, 0, 0, 1, 1,
-0.1208034, -0.8971104, -2.276163, 0, 0, 0, 1, 1,
-0.1195598, 0.6021994, 0.2409274, 0, 0, 0, 1, 1,
-0.1147867, 1.220595, 0.6545065, 0, 0, 0, 1, 1,
-0.1143291, -0.4825714, -1.552007, 0, 0, 0, 1, 1,
-0.1103939, -0.6964759, -3.678032, 0, 0, 0, 1, 1,
-0.110023, 1.096396, -1.350809, 0, 0, 0, 1, 1,
-0.1061678, -0.4425578, -3.02784, 0, 0, 0, 1, 1,
-0.1043922, 1.346872, 1.720893, 1, 1, 1, 1, 1,
-0.09716461, 0.3104043, 0.2928044, 1, 1, 1, 1, 1,
-0.09449209, 0.6619245, 0.6050214, 1, 1, 1, 1, 1,
-0.09283805, 1.650949, 1.367855, 1, 1, 1, 1, 1,
-0.09112409, -0.9359529, -2.351478, 1, 1, 1, 1, 1,
-0.07767975, -0.4405137, -0.8520369, 1, 1, 1, 1, 1,
-0.07669211, -0.03069995, -0.3746459, 1, 1, 1, 1, 1,
-0.07279186, 0.9830678, -0.8864324, 1, 1, 1, 1, 1,
-0.0636608, 2.290416, 0.6774405, 1, 1, 1, 1, 1,
-0.06309845, 0.07367358, -0.8834456, 1, 1, 1, 1, 1,
-0.06204773, -1.601523, -2.308049, 1, 1, 1, 1, 1,
-0.06039189, 1.081568, -0.5536804, 1, 1, 1, 1, 1,
-0.05974999, -2.700107, -2.624483, 1, 1, 1, 1, 1,
-0.05667754, -0.2489984, -4.050474, 1, 1, 1, 1, 1,
-0.05649996, 0.8379619, 1.115986, 1, 1, 1, 1, 1,
-0.05205202, -0.8361377, -2.859876, 0, 0, 1, 1, 1,
-0.05194709, 0.5816131, -1.193684, 1, 0, 0, 1, 1,
-0.04858718, 0.5948433, 0.6715779, 1, 0, 0, 1, 1,
-0.04767741, 0.9734432, 1.076581, 1, 0, 0, 1, 1,
-0.047452, 0.4625655, -2.370642, 1, 0, 0, 1, 1,
-0.04720281, -0.9957854, -5.161552, 1, 0, 0, 1, 1,
-0.0458745, 0.635424, -0.9280691, 0, 0, 0, 1, 1,
-0.04564571, -0.7264165, -3.635828, 0, 0, 0, 1, 1,
-0.04419599, 1.879112, 1.035559, 0, 0, 0, 1, 1,
-0.04370726, 0.2335163, -0.004963849, 0, 0, 0, 1, 1,
-0.04235066, -1.132523, -2.285893, 0, 0, 0, 1, 1,
-0.04232857, 1.178558, -0.6021694, 0, 0, 0, 1, 1,
-0.0390512, 0.133403, 0.05616244, 0, 0, 0, 1, 1,
-0.03803659, -0.2863609, -2.837912, 1, 1, 1, 1, 1,
-0.0379884, 1.168551, -1.097442, 1, 1, 1, 1, 1,
-0.03788485, -3.19704, -2.898139, 1, 1, 1, 1, 1,
-0.03626207, -0.7572424, -2.116669, 1, 1, 1, 1, 1,
-0.0358065, -2.320277, -2.954405, 1, 1, 1, 1, 1,
-0.03413572, -0.9870774, -2.860748, 1, 1, 1, 1, 1,
-0.03177952, -1.575243, -2.895997, 1, 1, 1, 1, 1,
-0.02839512, -2.008427, -2.864842, 1, 1, 1, 1, 1,
-0.02449024, -0.2910745, -4.143603, 1, 1, 1, 1, 1,
-0.02421376, 1.872678, -1.658788, 1, 1, 1, 1, 1,
-0.02011266, 0.4401695, -1.456097, 1, 1, 1, 1, 1,
-0.01761567, 1.0879, 0.3885142, 1, 1, 1, 1, 1,
-0.01702264, 0.2834624, -0.9631082, 1, 1, 1, 1, 1,
-0.016894, 0.1995595, -1.61671, 1, 1, 1, 1, 1,
-0.01231763, -1.17431, -4.025903, 1, 1, 1, 1, 1,
-0.004853155, -1.684074, -2.049242, 0, 0, 1, 1, 1,
-0.003905078, 0.08317493, -0.8403134, 1, 0, 0, 1, 1,
-0.0007104541, 0.7791069, 0.7609822, 1, 0, 0, 1, 1,
0.005512263, -0.02062055, 4.250496, 1, 0, 0, 1, 1,
0.009512685, 0.9031458, 0.3423508, 1, 0, 0, 1, 1,
0.01040678, 0.5401335, 0.04846148, 1, 0, 0, 1, 1,
0.01517222, -0.4197228, 4.589253, 0, 0, 0, 1, 1,
0.01554904, 0.198559, 1.460931, 0, 0, 0, 1, 1,
0.02161589, -0.3799794, 2.87394, 0, 0, 0, 1, 1,
0.0286652, 0.05607528, -0.2486787, 0, 0, 0, 1, 1,
0.03286577, -0.2125163, 2.036198, 0, 0, 0, 1, 1,
0.04172422, -1.520606, 3.651645, 0, 0, 0, 1, 1,
0.04210055, -0.390793, 2.096542, 0, 0, 0, 1, 1,
0.04609898, 0.9822205, -0.1864609, 1, 1, 1, 1, 1,
0.04679629, 3.404223, 0.39677, 1, 1, 1, 1, 1,
0.0472662, 0.2609354, 0.8018178, 1, 1, 1, 1, 1,
0.0478382, -0.08394119, 3.651424, 1, 1, 1, 1, 1,
0.04926284, 1.826288, 0.1223218, 1, 1, 1, 1, 1,
0.05176672, 1.876342, -0.6482847, 1, 1, 1, 1, 1,
0.06099283, -0.5418633, 3.037615, 1, 1, 1, 1, 1,
0.06326058, -0.6751775, 3.131592, 1, 1, 1, 1, 1,
0.06582249, -0.4715943, 3.493558, 1, 1, 1, 1, 1,
0.06815994, -0.825289, 1.093781, 1, 1, 1, 1, 1,
0.0689079, 0.2336754, 0.4601592, 1, 1, 1, 1, 1,
0.07002647, 2.216985, -1.056523, 1, 1, 1, 1, 1,
0.07026681, -0.7033525, 2.963849, 1, 1, 1, 1, 1,
0.07246874, -1.072212, 3.889884, 1, 1, 1, 1, 1,
0.07634755, 0.4811089, 0.7151169, 1, 1, 1, 1, 1,
0.08754089, -0.9726384, 2.229554, 0, 0, 1, 1, 1,
0.09356594, -0.9722636, 0.9455037, 1, 0, 0, 1, 1,
0.09493874, 0.6949686, 0.6053916, 1, 0, 0, 1, 1,
0.09640553, 0.3833655, 0.3704259, 1, 0, 0, 1, 1,
0.1042914, -0.3480289, 3.476853, 1, 0, 0, 1, 1,
0.1051651, 0.9019397, 0.2184919, 1, 0, 0, 1, 1,
0.1065754, -0.7979862, 3.968738, 0, 0, 0, 1, 1,
0.1081108, -0.5738351, 2.263461, 0, 0, 0, 1, 1,
0.1124377, 0.01571706, 2.817556, 0, 0, 0, 1, 1,
0.116637, 1.357461, -0.9732167, 0, 0, 0, 1, 1,
0.1169932, 0.06824028, 0.8654857, 0, 0, 0, 1, 1,
0.1238979, -1.164142, 1.948229, 0, 0, 0, 1, 1,
0.1289366, 0.3291807, 1.655735, 0, 0, 0, 1, 1,
0.1299449, 0.3575657, 1.497471, 1, 1, 1, 1, 1,
0.1318978, -0.3429859, 1.991763, 1, 1, 1, 1, 1,
0.1321506, 1.373861, -0.7534885, 1, 1, 1, 1, 1,
0.133156, -0.4261733, 2.295958, 1, 1, 1, 1, 1,
0.1345786, 2.008919, 0.1092721, 1, 1, 1, 1, 1,
0.1436684, 0.0093477, 2.310661, 1, 1, 1, 1, 1,
0.1480203, 0.739248, -0.3643457, 1, 1, 1, 1, 1,
0.152922, -0.1412363, 2.119714, 1, 1, 1, 1, 1,
0.1541429, -0.1920337, 3.230668, 1, 1, 1, 1, 1,
0.1552922, 1.007642, 0.6267864, 1, 1, 1, 1, 1,
0.1566705, -0.7032381, 3.346178, 1, 1, 1, 1, 1,
0.1594979, 2.190691, -0.2048972, 1, 1, 1, 1, 1,
0.159788, 0.314287, -0.3169645, 1, 1, 1, 1, 1,
0.1660976, 0.5332562, 2.430698, 1, 1, 1, 1, 1,
0.1709076, 1.017265, -1.060294, 1, 1, 1, 1, 1,
0.1714544, -2.335722, 2.464543, 0, 0, 1, 1, 1,
0.1752271, -1.670274, 1.661479, 1, 0, 0, 1, 1,
0.1758792, 0.5862263, -1.434965, 1, 0, 0, 1, 1,
0.177049, 0.9957191, 0.8571156, 1, 0, 0, 1, 1,
0.1776852, 0.8813652, 1.495589, 1, 0, 0, 1, 1,
0.1798226, -0.5892267, 4.510626, 1, 0, 0, 1, 1,
0.1802164, 0.2931569, 0.7399663, 0, 0, 0, 1, 1,
0.1809702, 1.558748, 0.3772819, 0, 0, 0, 1, 1,
0.1821069, -1.008343, 3.596293, 0, 0, 0, 1, 1,
0.1882392, 0.2975825, 1.904414, 0, 0, 0, 1, 1,
0.1904477, 0.1456512, 2.463732, 0, 0, 0, 1, 1,
0.1986542, 0.3312604, -0.1214364, 0, 0, 0, 1, 1,
0.2002883, -0.7999704, 4.123036, 0, 0, 0, 1, 1,
0.2007698, 1.497555, 1.02525, 1, 1, 1, 1, 1,
0.2034722, 0.1468886, 0.9381834, 1, 1, 1, 1, 1,
0.206372, -2.301205, 3.580092, 1, 1, 1, 1, 1,
0.206436, -0.9598427, 2.58313, 1, 1, 1, 1, 1,
0.2073179, 1.281561, 0.06449666, 1, 1, 1, 1, 1,
0.2097814, -0.4243362, 1.654697, 1, 1, 1, 1, 1,
0.2158193, -0.07165199, 3.012278, 1, 1, 1, 1, 1,
0.216732, -0.2838621, 3.326338, 1, 1, 1, 1, 1,
0.219253, -0.1300356, 2.831899, 1, 1, 1, 1, 1,
0.2224167, -0.3226272, 3.020783, 1, 1, 1, 1, 1,
0.2227742, 0.7625398, -1.546156, 1, 1, 1, 1, 1,
0.2239553, -0.8397808, 1.518842, 1, 1, 1, 1, 1,
0.2247717, -2.155773, 0.6368632, 1, 1, 1, 1, 1,
0.2250321, 1.805795, 1.830543, 1, 1, 1, 1, 1,
0.2283509, 0.05610237, 0.3047245, 1, 1, 1, 1, 1,
0.2311782, 0.4234519, 0.8230107, 0, 0, 1, 1, 1,
0.2339634, -0.7885736, 3.074564, 1, 0, 0, 1, 1,
0.2344806, 0.7998446, 0.208642, 1, 0, 0, 1, 1,
0.2444834, 0.08588404, 2.274754, 1, 0, 0, 1, 1,
0.2487208, 0.1572865, 1.343208, 1, 0, 0, 1, 1,
0.2508443, 0.2761223, -0.4196267, 1, 0, 0, 1, 1,
0.2515999, -0.8547759, 1.736992, 0, 0, 0, 1, 1,
0.2602426, -1.468751, 3.400734, 0, 0, 0, 1, 1,
0.2627639, -1.826664, 2.806211, 0, 0, 0, 1, 1,
0.2645269, 0.5758815, 1.683047, 0, 0, 0, 1, 1,
0.2669008, 0.1950781, 0.9754676, 0, 0, 0, 1, 1,
0.2676747, -0.3080944, 2.643692, 0, 0, 0, 1, 1,
0.267823, -1.867296, 3.118532, 0, 0, 0, 1, 1,
0.2682622, -0.2574669, 1.61293, 1, 1, 1, 1, 1,
0.271686, -0.2793265, 3.749489, 1, 1, 1, 1, 1,
0.2808428, -1.260441, 2.241848, 1, 1, 1, 1, 1,
0.2832552, 0.1777455, 1.406024, 1, 1, 1, 1, 1,
0.2849653, -0.5446866, 2.680159, 1, 1, 1, 1, 1,
0.2905972, -0.4422883, 2.289741, 1, 1, 1, 1, 1,
0.2954665, 0.2542011, 1.175859, 1, 1, 1, 1, 1,
0.3107736, 0.8240353, 0.8524764, 1, 1, 1, 1, 1,
0.3114508, -2.415879, 1.878864, 1, 1, 1, 1, 1,
0.3192444, -0.7922358, 4.182428, 1, 1, 1, 1, 1,
0.3240005, 0.9917116, 0.5997211, 1, 1, 1, 1, 1,
0.3296984, -0.4482089, 1.558679, 1, 1, 1, 1, 1,
0.3306541, -0.3955979, 2.966656, 1, 1, 1, 1, 1,
0.3316893, -0.3710595, 2.509949, 1, 1, 1, 1, 1,
0.3317264, -0.5866659, 3.437316, 1, 1, 1, 1, 1,
0.3395941, 1.630409, 0.727001, 0, 0, 1, 1, 1,
0.3433546, -0.8606722, 2.483304, 1, 0, 0, 1, 1,
0.3436051, 1.015303, -0.7356871, 1, 0, 0, 1, 1,
0.3440435, -0.2556328, 0.6746228, 1, 0, 0, 1, 1,
0.3450864, 1.49775, -1.507192, 1, 0, 0, 1, 1,
0.3468603, -0.5685869, 2.925711, 1, 0, 0, 1, 1,
0.3471086, 1.228487, 0.4476217, 0, 0, 0, 1, 1,
0.3488615, -0.07366697, -1.035959, 0, 0, 0, 1, 1,
0.3496677, 0.8390458, -1.006006, 0, 0, 0, 1, 1,
0.353477, 0.01500931, 1.177223, 0, 0, 0, 1, 1,
0.3541444, -0.1520805, 1.562279, 0, 0, 0, 1, 1,
0.3564998, 1.409609, 1.084299, 0, 0, 0, 1, 1,
0.3599499, -0.08700592, 3.647647, 0, 0, 0, 1, 1,
0.3632643, 0.7394955, 0.8139652, 1, 1, 1, 1, 1,
0.3634344, 2.602546, -0.5803239, 1, 1, 1, 1, 1,
0.3636282, -0.1853862, 2.304383, 1, 1, 1, 1, 1,
0.3645681, -1.323812, 4.433573, 1, 1, 1, 1, 1,
0.3668019, -0.4800485, 2.141253, 1, 1, 1, 1, 1,
0.3684227, 0.3946342, 2.370439, 1, 1, 1, 1, 1,
0.3716612, 0.6622806, 1.48195, 1, 1, 1, 1, 1,
0.3863803, 2.018766, -0.2352019, 1, 1, 1, 1, 1,
0.3879398, -1.677911, 2.695916, 1, 1, 1, 1, 1,
0.39012, 0.01171408, -0.0433355, 1, 1, 1, 1, 1,
0.391541, -0.3492191, 2.49499, 1, 1, 1, 1, 1,
0.3923355, 0.5461104, 0.8364258, 1, 1, 1, 1, 1,
0.3945977, -0.2872638, 2.682611, 1, 1, 1, 1, 1,
0.3966624, -0.5502872, 1.540408, 1, 1, 1, 1, 1,
0.4028967, 1.893839, 0.7856083, 1, 1, 1, 1, 1,
0.4060216, -0.7260612, 4.149664, 0, 0, 1, 1, 1,
0.4072808, 1.317017, -0.1601085, 1, 0, 0, 1, 1,
0.4077555, -0.3337749, 2.29221, 1, 0, 0, 1, 1,
0.4091305, -0.9758376, 2.301525, 1, 0, 0, 1, 1,
0.4098402, -0.02874858, 1.933664, 1, 0, 0, 1, 1,
0.4102615, 0.594919, -1.284244, 1, 0, 0, 1, 1,
0.410906, 0.09650072, 1.454841, 0, 0, 0, 1, 1,
0.4129917, 0.02536475, 2.241172, 0, 0, 0, 1, 1,
0.4188094, -0.1828573, 1.48596, 0, 0, 0, 1, 1,
0.4193632, 0.6388716, 0.5371585, 0, 0, 0, 1, 1,
0.4233375, -1.108686, 2.966122, 0, 0, 0, 1, 1,
0.4249217, -0.8854929, -0.09236312, 0, 0, 0, 1, 1,
0.4249614, -0.5665807, 2.200986, 0, 0, 0, 1, 1,
0.4273534, 1.696413, -0.7131744, 1, 1, 1, 1, 1,
0.4285729, -1.147381, 2.211866, 1, 1, 1, 1, 1,
0.4304479, 0.6742384, 1.277384, 1, 1, 1, 1, 1,
0.4312597, 0.7503276, 0.9047503, 1, 1, 1, 1, 1,
0.4345021, -0.5042148, 3.112456, 1, 1, 1, 1, 1,
0.4365344, 0.9385772, 0.4707537, 1, 1, 1, 1, 1,
0.441401, -0.01671138, 2.060281, 1, 1, 1, 1, 1,
0.4415852, 0.3192411, 1.77309, 1, 1, 1, 1, 1,
0.4435409, -0.4510747, 3.188956, 1, 1, 1, 1, 1,
0.4443184, 0.2058162, 1.821368, 1, 1, 1, 1, 1,
0.446519, 0.6235716, 0.2583497, 1, 1, 1, 1, 1,
0.4495367, 0.1362383, 1.721074, 1, 1, 1, 1, 1,
0.4505619, -0.2451015, 2.000816, 1, 1, 1, 1, 1,
0.451763, 2.017294, 0.08486421, 1, 1, 1, 1, 1,
0.4520606, 0.08092838, 0.9127584, 1, 1, 1, 1, 1,
0.4527685, -0.701315, 3.270836, 0, 0, 1, 1, 1,
0.4534635, -0.9930546, 1.192023, 1, 0, 0, 1, 1,
0.4578533, 0.4135398, -0.9054752, 1, 0, 0, 1, 1,
0.4581657, 1.508285, 1.067504, 1, 0, 0, 1, 1,
0.4651047, -0.3845345, 3.892034, 1, 0, 0, 1, 1,
0.4668278, -1.166787, 2.321073, 1, 0, 0, 1, 1,
0.46957, 1.157344, 1.71812, 0, 0, 0, 1, 1,
0.4739161, 1.571957, 0.576231, 0, 0, 0, 1, 1,
0.4750485, -0.08954836, -0.5949305, 0, 0, 0, 1, 1,
0.476001, 0.5258372, 0.2940135, 0, 0, 0, 1, 1,
0.4785733, -0.958584, 1.558697, 0, 0, 0, 1, 1,
0.4791585, -0.3141614, -0.3403592, 0, 0, 0, 1, 1,
0.4799846, -0.8034375, 2.853368, 0, 0, 0, 1, 1,
0.4826679, 0.09565157, 2.125766, 1, 1, 1, 1, 1,
0.4831689, -1.349734, 2.220532, 1, 1, 1, 1, 1,
0.4844835, -0.6089529, 1.996018, 1, 1, 1, 1, 1,
0.4859799, -0.2877999, 1.466725, 1, 1, 1, 1, 1,
0.4888229, 0.02707588, 2.033983, 1, 1, 1, 1, 1,
0.4897131, -1.463866, 3.279458, 1, 1, 1, 1, 1,
0.4925321, 0.8285708, 1.394868, 1, 1, 1, 1, 1,
0.4952066, -0.6757721, 0.9053311, 1, 1, 1, 1, 1,
0.4961657, -0.04432715, 1.984081, 1, 1, 1, 1, 1,
0.4961898, -0.1768089, 2.764185, 1, 1, 1, 1, 1,
0.5037229, 1.406909, 0.4410916, 1, 1, 1, 1, 1,
0.5038102, 1.323611, 1.232754, 1, 1, 1, 1, 1,
0.5065975, -0.2734451, 3.991324, 1, 1, 1, 1, 1,
0.512922, 1.260448, 0.5705838, 1, 1, 1, 1, 1,
0.5133637, -0.3686708, 2.435115, 1, 1, 1, 1, 1,
0.514721, -0.6019079, 3.74781, 0, 0, 1, 1, 1,
0.5190307, -1.826537, 3.729659, 1, 0, 0, 1, 1,
0.5193982, 0.5110788, 1.026078, 1, 0, 0, 1, 1,
0.5228063, -0.3687468, 2.420024, 1, 0, 0, 1, 1,
0.5254859, 1.843899, -1.461136, 1, 0, 0, 1, 1,
0.5264167, 0.3313354, 0.3134667, 1, 0, 0, 1, 1,
0.5335733, -0.2201332, 1.932008, 0, 0, 0, 1, 1,
0.5350641, -0.5275093, 1.582927, 0, 0, 0, 1, 1,
0.5412489, 1.736976, -0.001051172, 0, 0, 0, 1, 1,
0.5427349, -0.5111106, 3.135457, 0, 0, 0, 1, 1,
0.5432039, 0.1858302, 0.2103211, 0, 0, 0, 1, 1,
0.5451356, -0.5396221, -0.02590131, 0, 0, 0, 1, 1,
0.5458516, 0.6858196, 1.068021, 0, 0, 0, 1, 1,
0.5477166, 0.9225197, -1.648894, 1, 1, 1, 1, 1,
0.5525346, 0.1287585, 2.193981, 1, 1, 1, 1, 1,
0.5621913, 0.201492, 1.571135, 1, 1, 1, 1, 1,
0.5623106, 1.342275, -0.1157207, 1, 1, 1, 1, 1,
0.5662268, 0.9471143, -0.646459, 1, 1, 1, 1, 1,
0.5688083, -1.787936, 3.955572, 1, 1, 1, 1, 1,
0.5696008, -0.330687, 2.127559, 1, 1, 1, 1, 1,
0.5718816, -1.899069, 3.57433, 1, 1, 1, 1, 1,
0.5729151, -1.264198, 1.906701, 1, 1, 1, 1, 1,
0.5739613, 0.7974527, 2.225576, 1, 1, 1, 1, 1,
0.5773588, -0.2470705, 2.957436, 1, 1, 1, 1, 1,
0.578384, 0.6050279, 1.358374, 1, 1, 1, 1, 1,
0.5794451, -1.384086, 3.967148, 1, 1, 1, 1, 1,
0.5811703, -0.8100306, 2.572541, 1, 1, 1, 1, 1,
0.5821279, 0.8672795, -0.2208404, 1, 1, 1, 1, 1,
0.5836036, 0.1693484, 0.5631361, 0, 0, 1, 1, 1,
0.5946234, 1.491775, 1.345722, 1, 0, 0, 1, 1,
0.5952053, -0.7471489, 2.770314, 1, 0, 0, 1, 1,
0.6007259, 0.9157601, 2.065214, 1, 0, 0, 1, 1,
0.6052875, -0.1913731, 3.110948, 1, 0, 0, 1, 1,
0.6081378, 0.5773847, -1.328825, 1, 0, 0, 1, 1,
0.6234357, -0.5306652, 1.113019, 0, 0, 0, 1, 1,
0.6261911, -1.441231, 3.031391, 0, 0, 0, 1, 1,
0.6286729, -0.6397348, 2.489918, 0, 0, 0, 1, 1,
0.6299219, 0.8969842, 0.2723965, 0, 0, 0, 1, 1,
0.632978, 1.099794, -0.5448717, 0, 0, 0, 1, 1,
0.633454, 1.070206, 2.22252, 0, 0, 0, 1, 1,
0.6336972, -1.015217, 3.014837, 0, 0, 0, 1, 1,
0.6352026, -0.9407796, 2.439196, 1, 1, 1, 1, 1,
0.635456, 0.2028435, 2.251417, 1, 1, 1, 1, 1,
0.6414817, -1.284163, 5.130226, 1, 1, 1, 1, 1,
0.6426682, -1.329711, 2.657327, 1, 1, 1, 1, 1,
0.6465054, -0.615706, 3.38394, 1, 1, 1, 1, 1,
0.6467796, 1.113758, 0.6594865, 1, 1, 1, 1, 1,
0.649404, -0.3120539, 1.16256, 1, 1, 1, 1, 1,
0.6560158, 1.369234, 0.5285662, 1, 1, 1, 1, 1,
0.6621178, 0.4059345, 3.297412, 1, 1, 1, 1, 1,
0.6653536, -1.322898, 4.050411, 1, 1, 1, 1, 1,
0.6673951, -0.1561069, 1.602327, 1, 1, 1, 1, 1,
0.6684866, 1.806791, 1.599702, 1, 1, 1, 1, 1,
0.6685839, 0.2141335, 1.734218, 1, 1, 1, 1, 1,
0.6719022, -0.1075361, 1.944361, 1, 1, 1, 1, 1,
0.6842009, 1.25706, 0.1824771, 1, 1, 1, 1, 1,
0.6849915, 0.6106345, 2.84994, 0, 0, 1, 1, 1,
0.6896585, 0.8348891, 0.4510483, 1, 0, 0, 1, 1,
0.6912075, 0.7148429, 1.993725, 1, 0, 0, 1, 1,
0.6930637, -0.6352175, 0.0741348, 1, 0, 0, 1, 1,
0.6944125, -2.355238, 3.645279, 1, 0, 0, 1, 1,
0.6950415, -0.2869179, 1.838152, 1, 0, 0, 1, 1,
0.6980205, -1.78476, 3.01745, 0, 0, 0, 1, 1,
0.7026282, 0.2187914, -1.068402, 0, 0, 0, 1, 1,
0.7028846, 1.669937, 0.4323994, 0, 0, 0, 1, 1,
0.7041425, 0.1695802, 0.09113514, 0, 0, 0, 1, 1,
0.7108307, -0.03267501, 1.558962, 0, 0, 0, 1, 1,
0.7117447, 0.4350708, 1.34144, 0, 0, 0, 1, 1,
0.7181117, -0.07596098, 1.447874, 0, 0, 0, 1, 1,
0.7191464, 0.1050041, 1.918367, 1, 1, 1, 1, 1,
0.726719, 0.1979829, -0.2228766, 1, 1, 1, 1, 1,
0.7288573, 0.1817769, 2.866296, 1, 1, 1, 1, 1,
0.7371693, -1.469516, 1.90507, 1, 1, 1, 1, 1,
0.7407123, 0.6782937, 0.6276559, 1, 1, 1, 1, 1,
0.7462358, 1.464498, 0.474763, 1, 1, 1, 1, 1,
0.7492348, 0.4952392, 2.939787, 1, 1, 1, 1, 1,
0.7529972, -0.6501723, -0.2711658, 1, 1, 1, 1, 1,
0.757392, 0.8603991, 2.008276, 1, 1, 1, 1, 1,
0.7652913, -0.0982324, 1.177479, 1, 1, 1, 1, 1,
0.7692422, 0.8016838, -0.729906, 1, 1, 1, 1, 1,
0.7854229, -0.2452395, 1.747239, 1, 1, 1, 1, 1,
0.7865792, 1.492355, 0.6372506, 1, 1, 1, 1, 1,
0.7879997, -2.874847, 3.767528, 1, 1, 1, 1, 1,
0.7890735, -0.7645961, 2.033975, 1, 1, 1, 1, 1,
0.7891052, 2.251546, -1.522777, 0, 0, 1, 1, 1,
0.7976199, 0.1179365, -0.08952127, 1, 0, 0, 1, 1,
0.8083991, 0.6838962, 1.063178, 1, 0, 0, 1, 1,
0.8195027, 0.1869783, 0.5915762, 1, 0, 0, 1, 1,
0.8265212, -0.02559946, 2.584636, 1, 0, 0, 1, 1,
0.8302783, 0.5337222, 0.7842106, 1, 0, 0, 1, 1,
0.8356084, -1.06801, 2.404577, 0, 0, 0, 1, 1,
0.8366702, 0.06350879, 1.935279, 0, 0, 0, 1, 1,
0.8372245, -0.489758, -0.5545918, 0, 0, 0, 1, 1,
0.8456678, -0.7178664, 1.794325, 0, 0, 0, 1, 1,
0.846825, -0.06460768, 1.440803, 0, 0, 0, 1, 1,
0.8482068, -1.751848, 3.179298, 0, 0, 0, 1, 1,
0.851993, -0.3376904, 2.348969, 0, 0, 0, 1, 1,
0.8551981, -0.1352701, 1.222705, 1, 1, 1, 1, 1,
0.8558658, 0.1930341, 0.9202648, 1, 1, 1, 1, 1,
0.8749985, 0.08682526, 2.669624, 1, 1, 1, 1, 1,
0.8762519, -0.8725718, 1.5218, 1, 1, 1, 1, 1,
0.876994, 0.3355149, 0.2818206, 1, 1, 1, 1, 1,
0.8780478, 1.208505, -0.1787379, 1, 1, 1, 1, 1,
0.88679, 0.8141221, 0.5688348, 1, 1, 1, 1, 1,
0.8906022, -0.1279487, 2.144716, 1, 1, 1, 1, 1,
0.8937025, 2.374291, 0.4137971, 1, 1, 1, 1, 1,
0.8955177, -2.433061, 4.67297, 1, 1, 1, 1, 1,
0.8964128, -0.8883944, 3.038901, 1, 1, 1, 1, 1,
0.8968213, -0.1912073, 1.283958, 1, 1, 1, 1, 1,
0.8969271, 0.7154383, 2.492286, 1, 1, 1, 1, 1,
0.91843, -0.4567971, 1.609887, 1, 1, 1, 1, 1,
0.9351674, -0.08674213, 0.6853393, 1, 1, 1, 1, 1,
0.937303, -0.8322613, 2.482831, 0, 0, 1, 1, 1,
0.9437755, 0.3473476, 2.089917, 1, 0, 0, 1, 1,
0.9453502, -0.6915995, 1.484172, 1, 0, 0, 1, 1,
0.950093, -1.327913, 1.343724, 1, 0, 0, 1, 1,
0.9545431, 0.372387, 1.651078, 1, 0, 0, 1, 1,
0.954652, -0.4305706, 1.032143, 1, 0, 0, 1, 1,
0.9546695, 0.3842282, 0.4806377, 0, 0, 0, 1, 1,
0.9581813, 0.1648861, 1.604742, 0, 0, 0, 1, 1,
0.9601561, 1.11283, 0.9189258, 0, 0, 0, 1, 1,
0.9618952, -1.731004, 2.943785, 0, 0, 0, 1, 1,
0.9647029, 0.3376788, 2.279364, 0, 0, 0, 1, 1,
0.9676108, 1.614544, 0.9580515, 0, 0, 0, 1, 1,
0.9718742, 0.6377395, -0.4599527, 0, 0, 0, 1, 1,
0.9733366, -0.5110039, 2.086112, 1, 1, 1, 1, 1,
0.9937769, 0.9891872, 1.988888, 1, 1, 1, 1, 1,
0.9949197, -0.2263389, 1.171628, 1, 1, 1, 1, 1,
0.9963733, -2.138917, 0.4357472, 1, 1, 1, 1, 1,
1.006261, -0.02832218, 1.322932, 1, 1, 1, 1, 1,
1.00745, 0.9225182, 1.2472, 1, 1, 1, 1, 1,
1.008889, -2.326906, 2.696364, 1, 1, 1, 1, 1,
1.009869, 1.28411, -0.5289782, 1, 1, 1, 1, 1,
1.015962, -1.519401, 2.644616, 1, 1, 1, 1, 1,
1.018829, 1.469639, -1.59764, 1, 1, 1, 1, 1,
1.019901, -1.653452, 2.595426, 1, 1, 1, 1, 1,
1.021779, 1.536887, 2.47086, 1, 1, 1, 1, 1,
1.024499, -0.7036484, 2.623942, 1, 1, 1, 1, 1,
1.03202, 2.249892, -0.3910454, 1, 1, 1, 1, 1,
1.032177, -0.2275699, 0.7527524, 1, 1, 1, 1, 1,
1.033263, 0.8199108, 0.2276036, 0, 0, 1, 1, 1,
1.033267, -1.571807, 1.02092, 1, 0, 0, 1, 1,
1.034057, -0.6370983, 2.175906, 1, 0, 0, 1, 1,
1.03494, 1.070432, 1.502259, 1, 0, 0, 1, 1,
1.035227, -2.000484, 2.463637, 1, 0, 0, 1, 1,
1.043407, 0.483739, 0.7669581, 1, 0, 0, 1, 1,
1.04861, -0.8930772, 0.4973796, 0, 0, 0, 1, 1,
1.051169, 1.256137, 0.7592803, 0, 0, 0, 1, 1,
1.051863, 0.1051865, 0.1155061, 0, 0, 0, 1, 1,
1.053641, -1.079645, 2.703013, 0, 0, 0, 1, 1,
1.055488, -0.9585883, 1.882517, 0, 0, 0, 1, 1,
1.058185, -0.4905507, 1.971558, 0, 0, 0, 1, 1,
1.061703, -0.4901391, 2.271662, 0, 0, 0, 1, 1,
1.064292, -1.238772, 2.116479, 1, 1, 1, 1, 1,
1.0691, -0.6064969, 1.781363, 1, 1, 1, 1, 1,
1.093255, 1.764727, -1.261922, 1, 1, 1, 1, 1,
1.097794, -0.2611211, 2.796025, 1, 1, 1, 1, 1,
1.104232, 0.3883367, 1.265503, 1, 1, 1, 1, 1,
1.104919, 0.2253448, 0.2480919, 1, 1, 1, 1, 1,
1.104928, -1.209261, -0.5439938, 1, 1, 1, 1, 1,
1.105505, -1.889022, 2.610631, 1, 1, 1, 1, 1,
1.11146, 0.1511538, 0.2415757, 1, 1, 1, 1, 1,
1.11211, -0.4853751, 1.537139, 1, 1, 1, 1, 1,
1.120794, -0.2056326, 0.416488, 1, 1, 1, 1, 1,
1.124385, 1.068819, -1.063762, 1, 1, 1, 1, 1,
1.124961, 1.718161, -0.2599739, 1, 1, 1, 1, 1,
1.125317, -0.8819777, 2.84487, 1, 1, 1, 1, 1,
1.125983, 0.369512, 3.026874, 1, 1, 1, 1, 1,
1.135375, -0.1670371, 0.3354547, 0, 0, 1, 1, 1,
1.137102, -0.06093993, 2.373318, 1, 0, 0, 1, 1,
1.137115, -0.9872912, 3.66687, 1, 0, 0, 1, 1,
1.138125, 0.2950445, 2.195147, 1, 0, 0, 1, 1,
1.139303, -1.599771, 3.639974, 1, 0, 0, 1, 1,
1.140116, 0.1172283, 1.179859, 1, 0, 0, 1, 1,
1.141234, 2.013457, 0.2341944, 0, 0, 0, 1, 1,
1.146414, 1.065, 0.8945348, 0, 0, 0, 1, 1,
1.151278, -0.2002449, 3.083137, 0, 0, 0, 1, 1,
1.152209, 0.1574475, 0.7179646, 0, 0, 0, 1, 1,
1.169331, 0.9553269, 1.166014, 0, 0, 0, 1, 1,
1.173599, 1.937636, 0.4879287, 0, 0, 0, 1, 1,
1.173775, 0.9922596, 0.5862354, 0, 0, 0, 1, 1,
1.174064, 0.5375637, 1.647535, 1, 1, 1, 1, 1,
1.18783, -1.334083, 2.576125, 1, 1, 1, 1, 1,
1.225305, 1.639559, 0.3939526, 1, 1, 1, 1, 1,
1.230107, 1.336262, 0.8463374, 1, 1, 1, 1, 1,
1.230428, -0.8799878, 2.580491, 1, 1, 1, 1, 1,
1.238258, 0.7661396, 0.4104736, 1, 1, 1, 1, 1,
1.240002, -0.05682804, 3.858566, 1, 1, 1, 1, 1,
1.241982, -0.2596087, 1.85537, 1, 1, 1, 1, 1,
1.257003, 2.257303, -0.0003888162, 1, 1, 1, 1, 1,
1.271681, 1.152078, -0.1361729, 1, 1, 1, 1, 1,
1.273352, 1.12244, 0.8481012, 1, 1, 1, 1, 1,
1.288459, 0.1083463, 0.91436, 1, 1, 1, 1, 1,
1.293981, 0.6486663, 1.004721, 1, 1, 1, 1, 1,
1.296815, -0.4246887, 0.03890652, 1, 1, 1, 1, 1,
1.304888, -1.033959, 2.255882, 1, 1, 1, 1, 1,
1.30847, 0.1239633, 1.978748, 0, 0, 1, 1, 1,
1.317394, 0.8911775, 1.609565, 1, 0, 0, 1, 1,
1.329858, -0.0171722, 2.319601, 1, 0, 0, 1, 1,
1.330626, 0.9736446, 1.210574, 1, 0, 0, 1, 1,
1.331912, 0.0342849, 1.399999, 1, 0, 0, 1, 1,
1.33277, 0.0946829, 2.821766, 1, 0, 0, 1, 1,
1.335483, 0.6518133, 0.5451427, 0, 0, 0, 1, 1,
1.33724, 0.1818423, 3.370406, 0, 0, 0, 1, 1,
1.337359, 0.1554511, 1.25416, 0, 0, 0, 1, 1,
1.339362, -1.126993, 1.491357, 0, 0, 0, 1, 1,
1.340228, -2.238114, 0.9260151, 0, 0, 0, 1, 1,
1.364993, -0.002932342, 1.086594, 0, 0, 0, 1, 1,
1.367463, -1.421616, 3.667397, 0, 0, 0, 1, 1,
1.370656, -0.863777, 1.932745, 1, 1, 1, 1, 1,
1.37753, 0.8103752, 2.073384, 1, 1, 1, 1, 1,
1.37756, -1.624097, 1.581767, 1, 1, 1, 1, 1,
1.386201, 0.2923592, -0.1109397, 1, 1, 1, 1, 1,
1.386539, 1.015372, 1.49407, 1, 1, 1, 1, 1,
1.389534, 0.2754459, 0.2922109, 1, 1, 1, 1, 1,
1.396306, -0.1866152, 0.7102423, 1, 1, 1, 1, 1,
1.399421, 0.3698442, 0.7091408, 1, 1, 1, 1, 1,
1.40008, 0.8177363, -1.178275, 1, 1, 1, 1, 1,
1.402851, -1.166864, 1.726969, 1, 1, 1, 1, 1,
1.408526, -0.8176286, 1.324677, 1, 1, 1, 1, 1,
1.410827, -0.4273851, 1.34703, 1, 1, 1, 1, 1,
1.41724, 0.9143276, 1.610256, 1, 1, 1, 1, 1,
1.427436, 1.182004, 1.976809, 1, 1, 1, 1, 1,
1.433653, -0.3682255, 4.328773, 1, 1, 1, 1, 1,
1.445872, -2.26566, 2.177907, 0, 0, 1, 1, 1,
1.446605, -0.3756465, 1.89545, 1, 0, 0, 1, 1,
1.448522, 1.101218, -0.6102753, 1, 0, 0, 1, 1,
1.450414, 2.048834, 1.773999, 1, 0, 0, 1, 1,
1.450854, -0.6074805, 2.397236, 1, 0, 0, 1, 1,
1.458455, -1.846225, 2.78751, 1, 0, 0, 1, 1,
1.461911, -1.694305, 3.815856, 0, 0, 0, 1, 1,
1.462436, 1.52597, 0.4024963, 0, 0, 0, 1, 1,
1.468297, -1.06143, 1.457155, 0, 0, 0, 1, 1,
1.482492, 0.2482217, -0.4149157, 0, 0, 0, 1, 1,
1.490774, 0.8128299, 1.642284, 0, 0, 0, 1, 1,
1.495836, 0.7778872, -0.2765002, 0, 0, 0, 1, 1,
1.510875, 1.059875, 2.012422, 0, 0, 0, 1, 1,
1.513195, 0.3018645, 2.046244, 1, 1, 1, 1, 1,
1.530668, -0.1596373, 2.684051, 1, 1, 1, 1, 1,
1.541644, -1.597449, 3.151624, 1, 1, 1, 1, 1,
1.551741, 0.218957, -0.2537963, 1, 1, 1, 1, 1,
1.598171, -0.320226, 2.093146, 1, 1, 1, 1, 1,
1.605143, -1.566063, 2.836028, 1, 1, 1, 1, 1,
1.610979, 1.236188, 1.864064, 1, 1, 1, 1, 1,
1.614963, 1.245182, 0.6031712, 1, 1, 1, 1, 1,
1.61871, 0.2635287, 1.117367, 1, 1, 1, 1, 1,
1.621097, -0.932682, 1.727332, 1, 1, 1, 1, 1,
1.632641, -0.3964384, 2.174874, 1, 1, 1, 1, 1,
1.638502, -0.346456, 1.004091, 1, 1, 1, 1, 1,
1.644881, -0.4250369, 1.742067, 1, 1, 1, 1, 1,
1.648687, -0.2631056, 1.566859, 1, 1, 1, 1, 1,
1.650377, 0.1153117, 1.893709, 1, 1, 1, 1, 1,
1.652732, -0.8771302, 2.988086, 0, 0, 1, 1, 1,
1.676321, -0.01979175, 1.394246, 1, 0, 0, 1, 1,
1.688174, -1.335255, 1.45207, 1, 0, 0, 1, 1,
1.70599, 0.05077631, 0.1502901, 1, 0, 0, 1, 1,
1.708596, 0.001530045, 2.385125, 1, 0, 0, 1, 1,
1.711686, 0.2634085, 1.509808, 1, 0, 0, 1, 1,
1.756508, 0.6033514, 1.960895, 0, 0, 0, 1, 1,
1.756691, -1.948883, 1.974892, 0, 0, 0, 1, 1,
1.76354, 0.1612716, -0.04130095, 0, 0, 0, 1, 1,
1.764305, -0.3555088, 2.169748, 0, 0, 0, 1, 1,
1.765788, -1.449426, 1.129313, 0, 0, 0, 1, 1,
1.805037, 0.5764188, 1.534582, 0, 0, 0, 1, 1,
1.805176, 0.1839333, 2.243365, 0, 0, 0, 1, 1,
1.824901, -0.8005602, 1.985111, 1, 1, 1, 1, 1,
1.827947, 0.4310456, 1.254501, 1, 1, 1, 1, 1,
1.84285, -0.9712422, 1.821883, 1, 1, 1, 1, 1,
1.863532, 1.066358, 2.789881, 1, 1, 1, 1, 1,
1.872154, -0.7563105, 1.440701, 1, 1, 1, 1, 1,
1.874492, -0.8139078, 1.499284, 1, 1, 1, 1, 1,
1.874847, 0.3372294, 1.627627, 1, 1, 1, 1, 1,
1.884002, -0.2239752, 2.951604, 1, 1, 1, 1, 1,
1.930192, -0.8295987, 2.068536, 1, 1, 1, 1, 1,
1.93101, 2.412996, 1.7732, 1, 1, 1, 1, 1,
1.963557, 0.7140605, 1.927375, 1, 1, 1, 1, 1,
1.97792, -0.9184958, 1.281731, 1, 1, 1, 1, 1,
1.983885, -0.8595772, 1.819572, 1, 1, 1, 1, 1,
1.984558, 1.717013, -0.3999212, 1, 1, 1, 1, 1,
2.004773, -0.08560626, -0.1088619, 1, 1, 1, 1, 1,
2.017407, -1.671985, 2.862145, 0, 0, 1, 1, 1,
2.024835, -0.1496383, 2.390418, 1, 0, 0, 1, 1,
2.029844, 1.500463, 1.487817, 1, 0, 0, 1, 1,
2.04201, 0.7909127, 1.193451, 1, 0, 0, 1, 1,
2.084987, 1.730347, 2.14997, 1, 0, 0, 1, 1,
2.102933, 1.166555, 1.542952, 1, 0, 0, 1, 1,
2.120883, 0.6703307, 1.785941, 0, 0, 0, 1, 1,
2.13827, 0.05104361, 2.056598, 0, 0, 0, 1, 1,
2.170001, 0.9598223, 0.4276459, 0, 0, 0, 1, 1,
2.180523, 0.192189, 1.93455, 0, 0, 0, 1, 1,
2.189152, 0.6855703, 2.338404, 0, 0, 0, 1, 1,
2.18926, 1.192677, 1.201185, 0, 0, 0, 1, 1,
2.242341, -2.000593, 2.284416, 0, 0, 0, 1, 1,
2.283252, -0.6317369, 2.166522, 1, 1, 1, 1, 1,
2.4658, -0.7080336, 1.374507, 1, 1, 1, 1, 1,
2.520372, -1.182259, 1.591923, 1, 1, 1, 1, 1,
2.592752, 1.368643, 2.489278, 1, 1, 1, 1, 1,
2.632228, 1.111688, 3.054892, 1, 1, 1, 1, 1,
2.886918, -0.2165365, 2.961916, 1, 1, 1, 1, 1,
3.567828, 0.4161421, 0.03300067, 1, 1, 1, 1, 1
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
var radius = 9.644564;
var distance = 33.87613;
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
mvMatrix.translate( -0.1772647, -0.09549761, 0.1173255 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87613);
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
