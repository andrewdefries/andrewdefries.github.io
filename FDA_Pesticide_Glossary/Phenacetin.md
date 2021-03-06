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
-3.306761, -0.2981778, -1.489481, 1, 0, 0, 1,
-2.942609, -1.237358, -1.878128, 1, 0.007843138, 0, 1,
-2.858323, 0.6913465, -1.367273, 1, 0.01176471, 0, 1,
-2.797461, -1.241039, -0.4273828, 1, 0.01960784, 0, 1,
-2.74312, 1.319694, -1.13949, 1, 0.02352941, 0, 1,
-2.650283, 0.8217254, -0.6235932, 1, 0.03137255, 0, 1,
-2.618757, -0.819013, -1.851032, 1, 0.03529412, 0, 1,
-2.60649, -1.157734, -3.787251, 1, 0.04313726, 0, 1,
-2.568241, 0.5967436, 0.041402, 1, 0.04705882, 0, 1,
-2.538035, -1.413163, -2.68911, 1, 0.05490196, 0, 1,
-2.47187, 0.7568894, -1.337368, 1, 0.05882353, 0, 1,
-2.46849, 0.7084831, -1.09378, 1, 0.06666667, 0, 1,
-2.45916, -0.5234168, -1.871798, 1, 0.07058824, 0, 1,
-2.317049, 0.7367467, 0.06774159, 1, 0.07843138, 0, 1,
-2.182613, -0.1663714, 0.9224616, 1, 0.08235294, 0, 1,
-2.145004, -0.6587287, -3.89554, 1, 0.09019608, 0, 1,
-2.104701, -2.939226, -3.585855, 1, 0.09411765, 0, 1,
-2.093466, 0.4486884, -1.436952, 1, 0.1019608, 0, 1,
-2.074553, 0.05275391, -2.363017, 1, 0.1098039, 0, 1,
-2.069444, -0.8599539, -2.917541, 1, 0.1137255, 0, 1,
-2.015163, -0.7786082, -0.2326344, 1, 0.1215686, 0, 1,
-1.996011, -0.05896992, -0.1326183, 1, 0.1254902, 0, 1,
-1.979767, -0.9734746, -2.866412, 1, 0.1333333, 0, 1,
-1.904089, -0.09767013, -1.836318, 1, 0.1372549, 0, 1,
-1.894915, -0.5201485, 0.3358251, 1, 0.145098, 0, 1,
-1.875347, -0.0645999, -0.4916591, 1, 0.1490196, 0, 1,
-1.863545, -1.166053, -3.131392, 1, 0.1568628, 0, 1,
-1.857939, -0.8329098, -2.155072, 1, 0.1607843, 0, 1,
-1.850055, -1.035848, -1.647235, 1, 0.1686275, 0, 1,
-1.800358, 0.2312742, -0.6020342, 1, 0.172549, 0, 1,
-1.79214, 1.239752, -0.1837862, 1, 0.1803922, 0, 1,
-1.733301, -0.6106297, -2.245063, 1, 0.1843137, 0, 1,
-1.716998, 0.7619601, -0.7150443, 1, 0.1921569, 0, 1,
-1.711828, -0.5279622, -3.321428, 1, 0.1960784, 0, 1,
-1.705873, 0.7663141, -0.8543088, 1, 0.2039216, 0, 1,
-1.682146, 1.869959, -0.0948955, 1, 0.2117647, 0, 1,
-1.674392, 1.054366, -0.7970036, 1, 0.2156863, 0, 1,
-1.646345, -0.1543954, -0.7731537, 1, 0.2235294, 0, 1,
-1.635067, -1.568755, -2.892381, 1, 0.227451, 0, 1,
-1.629446, 0.7562432, -2.610641, 1, 0.2352941, 0, 1,
-1.620038, 1.071857, -1.032404, 1, 0.2392157, 0, 1,
-1.61108, 1.119103, -1.112931, 1, 0.2470588, 0, 1,
-1.606888, -0.1872337, -2.380204, 1, 0.2509804, 0, 1,
-1.606249, 1.089635, -0.8168417, 1, 0.2588235, 0, 1,
-1.605945, -0.8967054, -4.430096, 1, 0.2627451, 0, 1,
-1.605911, -0.9442011, -1.407942, 1, 0.2705882, 0, 1,
-1.600736, -0.02282732, -0.9294374, 1, 0.2745098, 0, 1,
-1.600674, -2.10834, -2.713049, 1, 0.282353, 0, 1,
-1.598332, 1.607843, -0.9275868, 1, 0.2862745, 0, 1,
-1.593997, 0.5779175, -2.34081, 1, 0.2941177, 0, 1,
-1.580689, 0.1671547, -1.124816, 1, 0.3019608, 0, 1,
-1.576118, 0.5051142, -1.391731, 1, 0.3058824, 0, 1,
-1.575598, -1.074064, -1.973143, 1, 0.3137255, 0, 1,
-1.57393, 1.853653, -0.3583542, 1, 0.3176471, 0, 1,
-1.571879, 0.1328535, -1.441421, 1, 0.3254902, 0, 1,
-1.545388, -1.029212, -3.5381, 1, 0.3294118, 0, 1,
-1.539118, 0.6726137, -2.014053, 1, 0.3372549, 0, 1,
-1.51992, -0.1178662, -1.519883, 1, 0.3411765, 0, 1,
-1.514931, 0.8208531, -0.5263678, 1, 0.3490196, 0, 1,
-1.507663, -1.312173, -1.889714, 1, 0.3529412, 0, 1,
-1.496919, 0.2588609, -1.706058, 1, 0.3607843, 0, 1,
-1.492511, 0.7570607, 0.8041373, 1, 0.3647059, 0, 1,
-1.491237, -0.5474162, 0.2875647, 1, 0.372549, 0, 1,
-1.481668, 0.3525229, -1.417146, 1, 0.3764706, 0, 1,
-1.481136, 0.5607736, -2.653117, 1, 0.3843137, 0, 1,
-1.472404, 0.7548176, -0.7026381, 1, 0.3882353, 0, 1,
-1.469394, -1.27048, -3.537573, 1, 0.3960784, 0, 1,
-1.468896, -1.296849, -1.374133, 1, 0.4039216, 0, 1,
-1.467565, -0.5720469, -0.8074624, 1, 0.4078431, 0, 1,
-1.464364, -0.7400928, -3.043153, 1, 0.4156863, 0, 1,
-1.463509, 0.1273763, -3.064561, 1, 0.4196078, 0, 1,
-1.460337, 1.18691, 0.3537182, 1, 0.427451, 0, 1,
-1.457218, 1.698569, 0.2753086, 1, 0.4313726, 0, 1,
-1.452784, -0.9735014, -1.682104, 1, 0.4392157, 0, 1,
-1.444125, -0.7218245, -2.898374, 1, 0.4431373, 0, 1,
-1.423254, -1.204696, -2.273153, 1, 0.4509804, 0, 1,
-1.418899, 0.856626, -1.03048, 1, 0.454902, 0, 1,
-1.415764, -0.1757348, -1.411044, 1, 0.4627451, 0, 1,
-1.407192, -0.7485673, -4.029856, 1, 0.4666667, 0, 1,
-1.400918, 1.034739, -0.7945686, 1, 0.4745098, 0, 1,
-1.398844, -0.2129705, -1.058009, 1, 0.4784314, 0, 1,
-1.396007, -0.9816286, -0.7267425, 1, 0.4862745, 0, 1,
-1.390895, 0.1501378, -3.476394, 1, 0.4901961, 0, 1,
-1.390725, 1.324469, -1.977027, 1, 0.4980392, 0, 1,
-1.389034, -1.185513, -2.450073, 1, 0.5058824, 0, 1,
-1.363456, -1.030389, -1.076497, 1, 0.509804, 0, 1,
-1.356683, -0.2761242, -3.003593, 1, 0.5176471, 0, 1,
-1.3544, -0.760508, -2.442361, 1, 0.5215687, 0, 1,
-1.344992, -0.8502046, -1.159959, 1, 0.5294118, 0, 1,
-1.33908, 1.792535, -0.9740073, 1, 0.5333334, 0, 1,
-1.337581, -0.5252576, 0.1539098, 1, 0.5411765, 0, 1,
-1.328768, -0.1953256, -0.8960515, 1, 0.5450981, 0, 1,
-1.315879, 0.8951579, -1.58329, 1, 0.5529412, 0, 1,
-1.309462, 0.03769274, -1.471462, 1, 0.5568628, 0, 1,
-1.307557, 2.494776, 0.4183509, 1, 0.5647059, 0, 1,
-1.307071, 0.3889512, -1.809925, 1, 0.5686275, 0, 1,
-1.302488, 1.367375, -2.668843, 1, 0.5764706, 0, 1,
-1.288938, -0.3377395, -1.472915, 1, 0.5803922, 0, 1,
-1.288014, 1.824883, -1.061731, 1, 0.5882353, 0, 1,
-1.276434, 0.6156856, -1.675931, 1, 0.5921569, 0, 1,
-1.276053, -1.011311, -0.7302428, 1, 0.6, 0, 1,
-1.267932, 1.278077, -0.6420732, 1, 0.6078432, 0, 1,
-1.259364, 1.379628, -1.774192, 1, 0.6117647, 0, 1,
-1.246542, -0.2160892, -2.507087, 1, 0.6196079, 0, 1,
-1.244657, 1.069977, -1.444455, 1, 0.6235294, 0, 1,
-1.230801, 0.3592421, 1.404109, 1, 0.6313726, 0, 1,
-1.226217, 0.8526593, -1.866918, 1, 0.6352941, 0, 1,
-1.214788, -0.791729, -2.264686, 1, 0.6431373, 0, 1,
-1.205551, 0.8666075, -0.01565353, 1, 0.6470588, 0, 1,
-1.204855, -1.797237, -1.743736, 1, 0.654902, 0, 1,
-1.204626, -0.3720719, -3.659166, 1, 0.6588235, 0, 1,
-1.201107, -0.5505683, -3.488199, 1, 0.6666667, 0, 1,
-1.194758, 0.8797047, -1.335656, 1, 0.6705883, 0, 1,
-1.192957, -1.382001, -2.625903, 1, 0.6784314, 0, 1,
-1.18964, -0.2034364, -1.819498, 1, 0.682353, 0, 1,
-1.183663, 1.04549, -0.9510112, 1, 0.6901961, 0, 1,
-1.172318, 0.5972831, 0.03761323, 1, 0.6941177, 0, 1,
-1.167158, 2.119407, 0.1154824, 1, 0.7019608, 0, 1,
-1.166074, 0.5140383, -0.1703795, 1, 0.7098039, 0, 1,
-1.165949, 0.5739158, 0.1730725, 1, 0.7137255, 0, 1,
-1.158461, -1.112781, -2.746538, 1, 0.7215686, 0, 1,
-1.15609, 0.8890808, -0.4415547, 1, 0.7254902, 0, 1,
-1.155206, 0.04963992, -0.2966504, 1, 0.7333333, 0, 1,
-1.149738, -0.6688307, -2.759081, 1, 0.7372549, 0, 1,
-1.148659, 0.3078083, -1.481122, 1, 0.7450981, 0, 1,
-1.148375, -0.3227118, -1.819186, 1, 0.7490196, 0, 1,
-1.147092, 0.1724695, -1.830935, 1, 0.7568628, 0, 1,
-1.145699, 1.048827, -0.4445432, 1, 0.7607843, 0, 1,
-1.138477, 0.03920693, -1.179118, 1, 0.7686275, 0, 1,
-1.137854, -0.1027168, -3.240072, 1, 0.772549, 0, 1,
-1.134023, -1.499299, -0.7644452, 1, 0.7803922, 0, 1,
-1.122416, 0.5929616, -2.085771, 1, 0.7843137, 0, 1,
-1.119754, 1.670997, 0.7628628, 1, 0.7921569, 0, 1,
-1.117271, 0.3373048, -0.5965161, 1, 0.7960784, 0, 1,
-1.109851, -0.750673, -1.101047, 1, 0.8039216, 0, 1,
-1.106276, -0.004513181, -1.966333, 1, 0.8117647, 0, 1,
-1.098191, 0.2384331, -1.30202, 1, 0.8156863, 0, 1,
-1.098175, 0.5697402, -1.806188, 1, 0.8235294, 0, 1,
-1.093356, 1.15492, -2.337569, 1, 0.827451, 0, 1,
-1.092333, -1.411501, -3.244447, 1, 0.8352941, 0, 1,
-1.092026, -0.2861011, -2.766111, 1, 0.8392157, 0, 1,
-1.091004, 0.5113147, -3.171843, 1, 0.8470588, 0, 1,
-1.090675, -0.3542935, -2.979213, 1, 0.8509804, 0, 1,
-1.086158, 1.081194, -1.334542, 1, 0.8588235, 0, 1,
-1.08469, 0.6238917, -1.362816, 1, 0.8627451, 0, 1,
-1.072301, -0.4213265, -1.507438, 1, 0.8705882, 0, 1,
-1.059489, 0.6916968, -5.165395, 1, 0.8745098, 0, 1,
-1.059362, 1.263584, 0.3855757, 1, 0.8823529, 0, 1,
-1.053555, 0.3790384, -1.657584, 1, 0.8862745, 0, 1,
-1.049667, -0.1967974, -1.239896, 1, 0.8941177, 0, 1,
-1.046211, -0.7370965, -3.169334, 1, 0.8980392, 0, 1,
-1.038917, -0.07640157, -1.831593, 1, 0.9058824, 0, 1,
-1.038853, 1.59804, -1.7931, 1, 0.9137255, 0, 1,
-1.038341, -0.8139456, -2.908884, 1, 0.9176471, 0, 1,
-1.033796, 1.05893, -1.748814, 1, 0.9254902, 0, 1,
-1.032676, 0.3797894, -0.4885097, 1, 0.9294118, 0, 1,
-1.031502, 1.464758, -0.9022307, 1, 0.9372549, 0, 1,
-1.031433, 1.481874, 0.1270242, 1, 0.9411765, 0, 1,
-1.030362, -0.8598768, -0.2423168, 1, 0.9490196, 0, 1,
-1.029814, 1.149609, 0.4054302, 1, 0.9529412, 0, 1,
-1.029449, 0.5382549, 0.2353598, 1, 0.9607843, 0, 1,
-1.027758, -0.4248633, -1.650458, 1, 0.9647059, 0, 1,
-1.027384, 0.2586075, -0.6034724, 1, 0.972549, 0, 1,
-1.027126, -0.4584514, -1.274081, 1, 0.9764706, 0, 1,
-1.026468, -1.462558, -2.976748, 1, 0.9843137, 0, 1,
-1.024693, 1.32098, -0.03576328, 1, 0.9882353, 0, 1,
-1.022764, 0.8966036, -0.7925467, 1, 0.9960784, 0, 1,
-1.02092, 0.341896, -1.812407, 0.9960784, 1, 0, 1,
-1.011145, 0.532679, -0.3137571, 0.9921569, 1, 0, 1,
-1.011028, -1.069006, -1.863764, 0.9843137, 1, 0, 1,
-1.010835, -1.427501, -4.405796, 0.9803922, 1, 0, 1,
-1.008265, 0.3381922, -0.9076967, 0.972549, 1, 0, 1,
-1.008031, 1.238557, -3.044848, 0.9686275, 1, 0, 1,
-1.007939, 0.1054602, -1.801751, 0.9607843, 1, 0, 1,
-1.006276, -0.5720013, -2.911556, 0.9568627, 1, 0, 1,
-1.000943, -0.06744854, -3.221946, 0.9490196, 1, 0, 1,
-0.9911328, -1.762857, -2.210657, 0.945098, 1, 0, 1,
-0.9871773, -0.8247938, -1.394125, 0.9372549, 1, 0, 1,
-0.9845349, 0.3391953, -0.5658627, 0.9333333, 1, 0, 1,
-0.9840175, 1.284866, -0.01669443, 0.9254902, 1, 0, 1,
-0.9826813, -0.4819971, -1.332748, 0.9215686, 1, 0, 1,
-0.9822955, 0.01354692, -0.2080465, 0.9137255, 1, 0, 1,
-0.9774859, -0.007385892, -1.904178, 0.9098039, 1, 0, 1,
-0.976808, 2.304003, 0.7654833, 0.9019608, 1, 0, 1,
-0.971752, 0.101095, -1.797376, 0.8941177, 1, 0, 1,
-0.968474, -0.9244778, -2.708741, 0.8901961, 1, 0, 1,
-0.9666253, 0.9192928, -0.440083, 0.8823529, 1, 0, 1,
-0.9653944, -0.2179081, -1.984861, 0.8784314, 1, 0, 1,
-0.9605911, -0.1074124, -3.860682, 0.8705882, 1, 0, 1,
-0.9581352, 2.170825, -1.21402, 0.8666667, 1, 0, 1,
-0.9580772, -0.636737, -3.699209, 0.8588235, 1, 0, 1,
-0.9563004, -1.712235, -2.038106, 0.854902, 1, 0, 1,
-0.9293811, -0.1335883, -1.040247, 0.8470588, 1, 0, 1,
-0.9271973, 0.1985765, -1.928721, 0.8431373, 1, 0, 1,
-0.9266298, 0.7245432, -0.8320177, 0.8352941, 1, 0, 1,
-0.9257671, -0.5028974, -2.203168, 0.8313726, 1, 0, 1,
-0.9247905, 1.145158, -1.568536, 0.8235294, 1, 0, 1,
-0.9237987, 1.39793, 0.2039097, 0.8196079, 1, 0, 1,
-0.9187838, 0.2739793, -2.683673, 0.8117647, 1, 0, 1,
-0.9146733, 0.4411948, -1.406227, 0.8078431, 1, 0, 1,
-0.9145035, -2.789862, -3.136884, 0.8, 1, 0, 1,
-0.9143575, -0.7422878, -0.1670569, 0.7921569, 1, 0, 1,
-0.9125134, -0.235636, -2.514195, 0.7882353, 1, 0, 1,
-0.907976, -0.1242766, -1.455367, 0.7803922, 1, 0, 1,
-0.9014125, 0.9654314, -1.530615, 0.7764706, 1, 0, 1,
-0.8898768, -0.1900626, -1.286475, 0.7686275, 1, 0, 1,
-0.8887884, 0.02439685, -2.508229, 0.7647059, 1, 0, 1,
-0.8883601, -1.084497, -3.975747, 0.7568628, 1, 0, 1,
-0.8860172, -0.2327187, -1.964296, 0.7529412, 1, 0, 1,
-0.8857527, -0.6399254, -2.790071, 0.7450981, 1, 0, 1,
-0.8630657, 0.9792249, -0.09090818, 0.7411765, 1, 0, 1,
-0.8624704, 1.11854, -0.629831, 0.7333333, 1, 0, 1,
-0.8601071, 0.4284934, -0.9891465, 0.7294118, 1, 0, 1,
-0.858077, 0.104141, -0.6968191, 0.7215686, 1, 0, 1,
-0.8531705, -1.762139, -4.001365, 0.7176471, 1, 0, 1,
-0.8491836, -0.8194481, -3.168104, 0.7098039, 1, 0, 1,
-0.8387096, 1.406981, -3.116346, 0.7058824, 1, 0, 1,
-0.8326662, -0.754309, -2.690753, 0.6980392, 1, 0, 1,
-0.8324885, -0.8195401, -3.166324, 0.6901961, 1, 0, 1,
-0.8266668, 0.2928184, -2.240875, 0.6862745, 1, 0, 1,
-0.8246424, -0.3060399, -2.058349, 0.6784314, 1, 0, 1,
-0.8217971, 2.074368, 1.926758, 0.6745098, 1, 0, 1,
-0.8132041, -0.5459954, -1.595471, 0.6666667, 1, 0, 1,
-0.8094926, -0.3823707, -2.167046, 0.6627451, 1, 0, 1,
-0.7991029, -1.200415, -3.836229, 0.654902, 1, 0, 1,
-0.7947103, -0.7999664, -1.955372, 0.6509804, 1, 0, 1,
-0.7930253, -0.9778464, -2.944763, 0.6431373, 1, 0, 1,
-0.7863528, 1.61148, 0.3012871, 0.6392157, 1, 0, 1,
-0.7820381, -0.1448345, -2.374296, 0.6313726, 1, 0, 1,
-0.7759017, 0.8933257, -0.7043757, 0.627451, 1, 0, 1,
-0.7740518, -2.074167, -2.673174, 0.6196079, 1, 0, 1,
-0.771928, 0.2428773, -1.97729, 0.6156863, 1, 0, 1,
-0.7717788, -1.517496, -4.117756, 0.6078432, 1, 0, 1,
-0.7686607, -0.4143353, -1.853957, 0.6039216, 1, 0, 1,
-0.7646891, -2.005635, -2.10366, 0.5960785, 1, 0, 1,
-0.7636095, 1.171486, -1.560164, 0.5882353, 1, 0, 1,
-0.758382, -1.286127, -2.598814, 0.5843138, 1, 0, 1,
-0.7541176, -1.645564, -1.868295, 0.5764706, 1, 0, 1,
-0.7540629, 0.1789023, -1.590787, 0.572549, 1, 0, 1,
-0.7516128, -1.179167, -2.601883, 0.5647059, 1, 0, 1,
-0.7500455, -1.054148, -2.788543, 0.5607843, 1, 0, 1,
-0.7429067, -0.1503443, -1.999323, 0.5529412, 1, 0, 1,
-0.7421917, -0.06202665, -1.562547, 0.5490196, 1, 0, 1,
-0.7403955, -2.518663, -5.094286, 0.5411765, 1, 0, 1,
-0.7396546, -0.625842, -2.042923, 0.5372549, 1, 0, 1,
-0.7393682, -0.9175971, -4.20782, 0.5294118, 1, 0, 1,
-0.7381092, 1.38514, 0.4006999, 0.5254902, 1, 0, 1,
-0.7262588, -0.07620587, -1.825248, 0.5176471, 1, 0, 1,
-0.7235831, 1.513225, 0.9901592, 0.5137255, 1, 0, 1,
-0.7184168, -0.9479837, -0.9896949, 0.5058824, 1, 0, 1,
-0.7138551, -0.8653949, -2.380639, 0.5019608, 1, 0, 1,
-0.7130054, -0.7633983, -2.758029, 0.4941176, 1, 0, 1,
-0.7092816, -0.3937718, 0.4254076, 0.4862745, 1, 0, 1,
-0.7079799, -1.515852, -1.178441, 0.4823529, 1, 0, 1,
-0.7055545, 0.5657207, -1.074528, 0.4745098, 1, 0, 1,
-0.7009761, -0.2580279, -1.954486, 0.4705882, 1, 0, 1,
-0.6996865, 2.894857, 1.247212, 0.4627451, 1, 0, 1,
-0.6934762, -0.736505, -0.3477579, 0.4588235, 1, 0, 1,
-0.6798263, 0.127479, -1.182984, 0.4509804, 1, 0, 1,
-0.676158, 1.367934, -1.081205, 0.4470588, 1, 0, 1,
-0.6680607, -1.504114, -2.123572, 0.4392157, 1, 0, 1,
-0.667727, 0.8690465, -1.286944, 0.4352941, 1, 0, 1,
-0.6674864, -0.477252, -2.821769, 0.427451, 1, 0, 1,
-0.6647183, 0.5116334, -2.469493, 0.4235294, 1, 0, 1,
-0.6510764, -2.214747, -2.420081, 0.4156863, 1, 0, 1,
-0.6456792, -0.1247391, -1.298834, 0.4117647, 1, 0, 1,
-0.6452826, 0.3207737, -1.021232, 0.4039216, 1, 0, 1,
-0.6425756, 1.177574, -2.863415, 0.3960784, 1, 0, 1,
-0.6322068, 1.242125, -1.209073, 0.3921569, 1, 0, 1,
-0.629384, -0.3308241, -3.502181, 0.3843137, 1, 0, 1,
-0.6288128, -0.3450816, -0.04123617, 0.3803922, 1, 0, 1,
-0.6214736, 1.090781, 0.2429923, 0.372549, 1, 0, 1,
-0.6203791, -1.047673, -2.529643, 0.3686275, 1, 0, 1,
-0.6199697, 1.690661, -0.7927787, 0.3607843, 1, 0, 1,
-0.6196705, 0.8426947, -1.21327, 0.3568628, 1, 0, 1,
-0.619168, -0.02177702, -1.669693, 0.3490196, 1, 0, 1,
-0.6190826, -0.1347656, -3.000329, 0.345098, 1, 0, 1,
-0.6172205, -0.3014227, -2.023291, 0.3372549, 1, 0, 1,
-0.6169766, -0.3978057, -1.982943, 0.3333333, 1, 0, 1,
-0.6151831, 1.386739, -2.809303, 0.3254902, 1, 0, 1,
-0.6120235, 0.5001975, -0.7812725, 0.3215686, 1, 0, 1,
-0.6111259, -0.7163482, -2.548736, 0.3137255, 1, 0, 1,
-0.6087549, -0.4362668, -2.634087, 0.3098039, 1, 0, 1,
-0.6082252, -0.3721901, -2.261685, 0.3019608, 1, 0, 1,
-0.6008726, 0.7078653, 0.142159, 0.2941177, 1, 0, 1,
-0.5995944, -0.4463315, -3.401277, 0.2901961, 1, 0, 1,
-0.5983862, -0.5312696, -2.745731, 0.282353, 1, 0, 1,
-0.5920215, 0.5095893, -2.153955, 0.2784314, 1, 0, 1,
-0.5906414, -0.2674178, -1.729851, 0.2705882, 1, 0, 1,
-0.5884624, -0.9662836, -1.994923, 0.2666667, 1, 0, 1,
-0.5876012, -0.116867, -1.635549, 0.2588235, 1, 0, 1,
-0.5815653, 1.519659, 0.5200316, 0.254902, 1, 0, 1,
-0.5794164, 0.6983339, -2.336365, 0.2470588, 1, 0, 1,
-0.5758283, 0.2099469, 0.08468299, 0.2431373, 1, 0, 1,
-0.5654682, -0.07433437, 0.06668656, 0.2352941, 1, 0, 1,
-0.5584607, 1.021477, 0.1091413, 0.2313726, 1, 0, 1,
-0.5534105, 1.789033, -1.070596, 0.2235294, 1, 0, 1,
-0.550602, 2.329168, 0.08538256, 0.2196078, 1, 0, 1,
-0.550537, 1.286129, -0.253647, 0.2117647, 1, 0, 1,
-0.5496448, -1.138394, -1.728868, 0.2078431, 1, 0, 1,
-0.5463477, -0.4327433, -4.594776, 0.2, 1, 0, 1,
-0.5427756, 0.1690049, 1.047303, 0.1921569, 1, 0, 1,
-0.5400518, 0.7747741, 0.5594161, 0.1882353, 1, 0, 1,
-0.5349714, 1.782021, 1.220424, 0.1803922, 1, 0, 1,
-0.5304664, 1.123325, -0.1383868, 0.1764706, 1, 0, 1,
-0.5301914, -0.1429414, -4.128438, 0.1686275, 1, 0, 1,
-0.5293736, 0.06776719, -2.753851, 0.1647059, 1, 0, 1,
-0.5260662, -0.1213424, -0.210811, 0.1568628, 1, 0, 1,
-0.5260088, 1.493073, 1.442404, 0.1529412, 1, 0, 1,
-0.5231237, 0.6138048, -1.985747, 0.145098, 1, 0, 1,
-0.5226724, -0.265514, -2.10132, 0.1411765, 1, 0, 1,
-0.5223058, -1.320864, -1.565189, 0.1333333, 1, 0, 1,
-0.5167274, 1.153435, 0.355979, 0.1294118, 1, 0, 1,
-0.5133554, 0.8058919, 0.4880772, 0.1215686, 1, 0, 1,
-0.5128305, -1.394173, -1.235734, 0.1176471, 1, 0, 1,
-0.5088366, 0.505161, -1.12483, 0.1098039, 1, 0, 1,
-0.5072277, 1.458991, -0.3411497, 0.1058824, 1, 0, 1,
-0.5048321, -1.44149, -4.188845, 0.09803922, 1, 0, 1,
-0.5039868, 1.95341, -2.068425, 0.09019608, 1, 0, 1,
-0.5029012, 0.7997344, 1.164238, 0.08627451, 1, 0, 1,
-0.4985599, -2.099718, -4.512748, 0.07843138, 1, 0, 1,
-0.4966992, 0.9249861, -0.4720742, 0.07450981, 1, 0, 1,
-0.4958003, 0.7281572, 1.422907, 0.06666667, 1, 0, 1,
-0.4939112, -1.697981, -2.898698, 0.0627451, 1, 0, 1,
-0.4934019, -0.08943433, -2.107247, 0.05490196, 1, 0, 1,
-0.4909091, -0.5939597, -2.277469, 0.05098039, 1, 0, 1,
-0.488719, -0.8776051, -1.888659, 0.04313726, 1, 0, 1,
-0.4877424, -1.434045, -2.918938, 0.03921569, 1, 0, 1,
-0.4871999, 0.5678802, 0.1443996, 0.03137255, 1, 0, 1,
-0.4835104, 1.033802, 0.6550285, 0.02745098, 1, 0, 1,
-0.4825169, -0.8097895, -2.839738, 0.01960784, 1, 0, 1,
-0.4804619, 0.7584782, 1.703818, 0.01568628, 1, 0, 1,
-0.4799051, 0.09501507, -1.578074, 0.007843138, 1, 0, 1,
-0.4778675, -1.28779, -3.712615, 0.003921569, 1, 0, 1,
-0.4771941, 0.9333414, -0.1641711, 0, 1, 0.003921569, 1,
-0.4761906, 1.889104, -0.2110361, 0, 1, 0.01176471, 1,
-0.4760187, -1.64281, -4.71892, 0, 1, 0.01568628, 1,
-0.4716459, -0.2562016, -3.055313, 0, 1, 0.02352941, 1,
-0.4642769, -0.5040075, -1.983624, 0, 1, 0.02745098, 1,
-0.461949, 1.479375, -1.603276, 0, 1, 0.03529412, 1,
-0.4604863, 1.578168, -1.68136, 0, 1, 0.03921569, 1,
-0.4603847, 0.2036616, 0.5162854, 0, 1, 0.04705882, 1,
-0.4599108, -0.3967932, -2.012269, 0, 1, 0.05098039, 1,
-0.4598002, -0.05030954, -1.318812, 0, 1, 0.05882353, 1,
-0.4565082, -1.666718, -4.316683, 0, 1, 0.0627451, 1,
-0.4556684, 0.5250422, 0.2394887, 0, 1, 0.07058824, 1,
-0.4546925, -0.6388665, -2.867665, 0, 1, 0.07450981, 1,
-0.4538113, -1.425496, -3.314991, 0, 1, 0.08235294, 1,
-0.4512556, 0.3046893, 1.269149, 0, 1, 0.08627451, 1,
-0.4483042, -0.2897939, -2.51911, 0, 1, 0.09411765, 1,
-0.4463088, 1.524457, -0.6375821, 0, 1, 0.1019608, 1,
-0.4432466, -0.187393, -1.483558, 0, 1, 0.1058824, 1,
-0.4389012, -0.9960296, -1.436447, 0, 1, 0.1137255, 1,
-0.4379686, 0.5624876, -1.647904, 0, 1, 0.1176471, 1,
-0.43224, 0.9065979, -0.9364793, 0, 1, 0.1254902, 1,
-0.4269719, 0.6866606, 0.1368131, 0, 1, 0.1294118, 1,
-0.4257607, -0.5897878, -2.716537, 0, 1, 0.1372549, 1,
-0.425083, 0.02802163, -1.861394, 0, 1, 0.1411765, 1,
-0.4230782, -1.814961, -4.800315, 0, 1, 0.1490196, 1,
-0.419482, -0.05006596, -2.671674, 0, 1, 0.1529412, 1,
-0.418969, 0.4140582, -1.438967, 0, 1, 0.1607843, 1,
-0.413162, 0.8442318, -0.03532137, 0, 1, 0.1647059, 1,
-0.4116387, -0.1259602, -1.845498, 0, 1, 0.172549, 1,
-0.4052045, -1.440343, -4.178733, 0, 1, 0.1764706, 1,
-0.4046493, 0.9347192, -1.359484, 0, 1, 0.1843137, 1,
-0.4027561, 1.479775, 0.2316805, 0, 1, 0.1882353, 1,
-0.401198, 1.675768, -0.04231513, 0, 1, 0.1960784, 1,
-0.4008685, 0.918439, -1.064703, 0, 1, 0.2039216, 1,
-0.3990051, -1.527363, -3.144972, 0, 1, 0.2078431, 1,
-0.3976682, -0.162345, -2.007223, 0, 1, 0.2156863, 1,
-0.3972687, -1.282661, -1.854762, 0, 1, 0.2196078, 1,
-0.3939285, 0.750869, 0.4694392, 0, 1, 0.227451, 1,
-0.393914, -0.7820524, -3.410896, 0, 1, 0.2313726, 1,
-0.3929989, 0.3581174, -2.284733, 0, 1, 0.2392157, 1,
-0.3916836, 0.1452294, 0.6382707, 0, 1, 0.2431373, 1,
-0.3838141, -1.184087, -2.698019, 0, 1, 0.2509804, 1,
-0.3831663, -0.5628958, -3.135429, 0, 1, 0.254902, 1,
-0.3829223, 1.550508, -0.8675173, 0, 1, 0.2627451, 1,
-0.3794351, -1.167745, -2.303368, 0, 1, 0.2666667, 1,
-0.3757583, -2.391396, -2.014421, 0, 1, 0.2745098, 1,
-0.3748832, -0.03784744, -2.232287, 0, 1, 0.2784314, 1,
-0.37376, 2.151276, 0.6438708, 0, 1, 0.2862745, 1,
-0.3676787, -0.1698851, -2.923666, 0, 1, 0.2901961, 1,
-0.3662596, 0.9774906, -0.02975734, 0, 1, 0.2980392, 1,
-0.3657229, 1.009421, -0.7244499, 0, 1, 0.3058824, 1,
-0.3655471, -0.1936745, -1.789387, 0, 1, 0.3098039, 1,
-0.3622631, -1.343456, -0.794023, 0, 1, 0.3176471, 1,
-0.3596752, 0.9079673, -2.071112, 0, 1, 0.3215686, 1,
-0.349678, -1.03954, -3.141897, 0, 1, 0.3294118, 1,
-0.3490747, -0.410609, -3.594094, 0, 1, 0.3333333, 1,
-0.3414676, 1.083318, 0.3958209, 0, 1, 0.3411765, 1,
-0.3405482, -0.3765053, -4.264938, 0, 1, 0.345098, 1,
-0.3399287, -0.8887892, -3.525811, 0, 1, 0.3529412, 1,
-0.3387753, -0.5493805, -3.686649, 0, 1, 0.3568628, 1,
-0.3380668, -1.098925, -3.343643, 0, 1, 0.3647059, 1,
-0.3343579, -0.272793, -3.42366, 0, 1, 0.3686275, 1,
-0.3315161, -1.456697, -2.687268, 0, 1, 0.3764706, 1,
-0.3275203, -1.432542, -2.573047, 0, 1, 0.3803922, 1,
-0.3203057, 1.570234, 0.1527276, 0, 1, 0.3882353, 1,
-0.3193776, -0.2126699, -1.568487, 0, 1, 0.3921569, 1,
-0.318822, -1.131551, -3.651484, 0, 1, 0.4, 1,
-0.3183114, -0.2352355, -1.256969, 0, 1, 0.4078431, 1,
-0.3163254, 0.5604141, 0.2793286, 0, 1, 0.4117647, 1,
-0.3122017, 0.9411415, 0.006321745, 0, 1, 0.4196078, 1,
-0.3117854, -1.996661, -1.648799, 0, 1, 0.4235294, 1,
-0.3081486, 1.527577, -1.102495, 0, 1, 0.4313726, 1,
-0.3065241, -0.3919471, -0.5863583, 0, 1, 0.4352941, 1,
-0.2983852, -0.2364498, -4.498917, 0, 1, 0.4431373, 1,
-0.2921794, 0.7638919, 0.5471062, 0, 1, 0.4470588, 1,
-0.2899901, 0.3004868, -0.7528248, 0, 1, 0.454902, 1,
-0.2894149, -0.8138934, -3.103863, 0, 1, 0.4588235, 1,
-0.28333, -0.4236883, -1.98436, 0, 1, 0.4666667, 1,
-0.2808768, -0.1893497, -2.227895, 0, 1, 0.4705882, 1,
-0.276782, -0.7944043, -3.973952, 0, 1, 0.4784314, 1,
-0.2763909, 0.1660259, -2.27371, 0, 1, 0.4823529, 1,
-0.2746121, -0.8887662, -3.040543, 0, 1, 0.4901961, 1,
-0.2740582, 0.6509296, -0.9668078, 0, 1, 0.4941176, 1,
-0.27114, -0.8814368, -2.93417, 0, 1, 0.5019608, 1,
-0.2684428, -0.9638055, -3.131055, 0, 1, 0.509804, 1,
-0.2679223, 0.08165392, -1.514443, 0, 1, 0.5137255, 1,
-0.2644624, 0.1899893, 0.3378133, 0, 1, 0.5215687, 1,
-0.2643759, -0.01118287, -2.812128, 0, 1, 0.5254902, 1,
-0.2626802, 0.1542386, -2.235307, 0, 1, 0.5333334, 1,
-0.2586262, 0.2745582, -2.096415, 0, 1, 0.5372549, 1,
-0.2581014, 1.174971, -1.459692, 0, 1, 0.5450981, 1,
-0.248518, -0.1471101, -3.226251, 0, 1, 0.5490196, 1,
-0.2457352, 1.39191, -1.299429, 0, 1, 0.5568628, 1,
-0.2427634, -0.580918, -1.057603, 0, 1, 0.5607843, 1,
-0.2416837, -1.646773, -1.484399, 0, 1, 0.5686275, 1,
-0.24006, 0.2016146, -2.292264, 0, 1, 0.572549, 1,
-0.2375849, 0.5051473, -1.520177, 0, 1, 0.5803922, 1,
-0.2374146, -0.9795506, -3.258938, 0, 1, 0.5843138, 1,
-0.2372893, 0.8304912, -1.097109, 0, 1, 0.5921569, 1,
-0.2371053, -1.238948, -1.459479, 0, 1, 0.5960785, 1,
-0.2369408, -2.048099, -4.127593, 0, 1, 0.6039216, 1,
-0.2367659, -0.7880787, -1.865521, 0, 1, 0.6117647, 1,
-0.2358206, -0.758657, -3.541925, 0, 1, 0.6156863, 1,
-0.2333521, -1.363433, -3.115831, 0, 1, 0.6235294, 1,
-0.230848, 0.1628168, -0.1701228, 0, 1, 0.627451, 1,
-0.2290309, 1.314759, -0.1185003, 0, 1, 0.6352941, 1,
-0.2259363, 0.4863417, 0.1003345, 0, 1, 0.6392157, 1,
-0.2242613, -0.5032772, -1.676028, 0, 1, 0.6470588, 1,
-0.224065, 0.1859096, -0.9276978, 0, 1, 0.6509804, 1,
-0.2227263, -0.0208488, -1.428219, 0, 1, 0.6588235, 1,
-0.2222127, -0.2421138, -0.8006533, 0, 1, 0.6627451, 1,
-0.2186639, -1.408441, -3.365811, 0, 1, 0.6705883, 1,
-0.2155468, -0.6552173, -4.616546, 0, 1, 0.6745098, 1,
-0.212336, 1.202979, -0.4842403, 0, 1, 0.682353, 1,
-0.2049677, 0.3994977, -0.9578944, 0, 1, 0.6862745, 1,
-0.202044, 0.2798439, 0.1705333, 0, 1, 0.6941177, 1,
-0.2012718, 0.1183302, -0.4361531, 0, 1, 0.7019608, 1,
-0.1976696, -0.3834524, -3.11502, 0, 1, 0.7058824, 1,
-0.195189, 0.1603856, -1.053782, 0, 1, 0.7137255, 1,
-0.1935648, 1.019454, 2.52237, 0, 1, 0.7176471, 1,
-0.1930283, 0.3010068, -1.957348, 0, 1, 0.7254902, 1,
-0.1924573, -1.04435, -2.163667, 0, 1, 0.7294118, 1,
-0.189656, -1.173644, -3.994987, 0, 1, 0.7372549, 1,
-0.1880954, -0.8965986, -4.148346, 0, 1, 0.7411765, 1,
-0.1822951, -2.308441, -3.469807, 0, 1, 0.7490196, 1,
-0.1813129, 0.1713468, -0.181649, 0, 1, 0.7529412, 1,
-0.180887, 0.2184133, 1.202695, 0, 1, 0.7607843, 1,
-0.1772495, -1.395277, -2.627758, 0, 1, 0.7647059, 1,
-0.1739967, -0.6478202, -2.425689, 0, 1, 0.772549, 1,
-0.1715387, 0.7676563, -0.1684457, 0, 1, 0.7764706, 1,
-0.1704718, -0.3094313, -3.658104, 0, 1, 0.7843137, 1,
-0.1698937, 0.2734104, -0.709757, 0, 1, 0.7882353, 1,
-0.1668483, -0.8753285, -3.103431, 0, 1, 0.7960784, 1,
-0.1667915, -0.3868832, -2.456083, 0, 1, 0.8039216, 1,
-0.1666856, 0.8860227, -0.5289606, 0, 1, 0.8078431, 1,
-0.1661654, 0.597042, -0.9065573, 0, 1, 0.8156863, 1,
-0.1635838, -1.407441, -5.150448, 0, 1, 0.8196079, 1,
-0.1621607, -1.19571, -2.709908, 0, 1, 0.827451, 1,
-0.1620424, -0.7503008, -2.693654, 0, 1, 0.8313726, 1,
-0.157496, -1.247043, -2.955625, 0, 1, 0.8392157, 1,
-0.1523234, -0.6374, -3.445992, 0, 1, 0.8431373, 1,
-0.1512314, -0.9702922, -1.463225, 0, 1, 0.8509804, 1,
-0.1464027, -0.5197071, -3.923133, 0, 1, 0.854902, 1,
-0.1418986, -0.2098032, -2.169132, 0, 1, 0.8627451, 1,
-0.1405405, -1.344663, -2.626449, 0, 1, 0.8666667, 1,
-0.1348249, -0.7981065, -2.8781, 0, 1, 0.8745098, 1,
-0.1325889, -0.7277756, -2.717881, 0, 1, 0.8784314, 1,
-0.1289412, 1.174861, 1.018574, 0, 1, 0.8862745, 1,
-0.1284885, -1.505541, -3.28305, 0, 1, 0.8901961, 1,
-0.1270837, -0.2933408, -2.069468, 0, 1, 0.8980392, 1,
-0.1183098, 1.291201, -1.46899, 0, 1, 0.9058824, 1,
-0.1139788, -0.1775961, -2.955477, 0, 1, 0.9098039, 1,
-0.1137711, 0.9144276, -1.926915, 0, 1, 0.9176471, 1,
-0.1128058, -0.5015391, -3.314983, 0, 1, 0.9215686, 1,
-0.1105514, -0.9645147, -3.485779, 0, 1, 0.9294118, 1,
-0.1075708, 0.3327994, 0.4511318, 0, 1, 0.9333333, 1,
-0.1030849, -0.7670336, -1.645629, 0, 1, 0.9411765, 1,
-0.1029322, -0.2533199, -2.84794, 0, 1, 0.945098, 1,
-0.1026246, 0.8564906, 0.508899, 0, 1, 0.9529412, 1,
-0.1019028, 1.171388, 0.6604497, 0, 1, 0.9568627, 1,
-0.1008351, 0.08584693, -2.173152, 0, 1, 0.9647059, 1,
-0.09470842, -0.123902, -3.518497, 0, 1, 0.9686275, 1,
-0.09411207, -1.280169, -2.68249, 0, 1, 0.9764706, 1,
-0.09374277, 0.07259131, -0.8974923, 0, 1, 0.9803922, 1,
-0.09267397, 0.4216731, 0.5172037, 0, 1, 0.9882353, 1,
-0.09110054, -0.9143076, -1.970811, 0, 1, 0.9921569, 1,
-0.08694065, 0.5737948, -0.9661282, 0, 1, 1, 1,
-0.08237012, -0.1250407, -3.576261, 0, 0.9921569, 1, 1,
-0.08154201, -0.252685, -3.503024, 0, 0.9882353, 1, 1,
-0.08075101, -1.161748, -1.465756, 0, 0.9803922, 1, 1,
-0.0807349, -0.2190598, -4.890116, 0, 0.9764706, 1, 1,
-0.07962872, 0.5076483, -0.1318327, 0, 0.9686275, 1, 1,
-0.07617167, 0.2709751, 0.7394832, 0, 0.9647059, 1, 1,
-0.0708904, -1.173117, -1.843553, 0, 0.9568627, 1, 1,
-0.06792077, -0.2904677, -3.79286, 0, 0.9529412, 1, 1,
-0.06137675, 0.04068325, -0.5439275, 0, 0.945098, 1, 1,
-0.06127255, 0.4534707, 0.2436283, 0, 0.9411765, 1, 1,
-0.05484896, 0.3869233, 0.8869958, 0, 0.9333333, 1, 1,
-0.04898122, -1.421146, -3.436273, 0, 0.9294118, 1, 1,
-0.0487915, 1.311483, -1.191668, 0, 0.9215686, 1, 1,
-0.04817661, 0.03609664, -0.009164494, 0, 0.9176471, 1, 1,
-0.04786438, 1.428765, 1.694392, 0, 0.9098039, 1, 1,
-0.04604264, 0.7395198, 0.483988, 0, 0.9058824, 1, 1,
-0.04000168, 0.5672554, 0.7347462, 0, 0.8980392, 1, 1,
-0.03704765, -0.6071447, -2.626343, 0, 0.8901961, 1, 1,
-0.03559682, 1.184529, 0.5537047, 0, 0.8862745, 1, 1,
-0.03233629, -0.7458128, -2.291258, 0, 0.8784314, 1, 1,
-0.03019136, 1.156713, 2.508523, 0, 0.8745098, 1, 1,
-0.02856369, -0.3343246, -5.254248, 0, 0.8666667, 1, 1,
-0.02187979, 0.1515789, -1.308773, 0, 0.8627451, 1, 1,
-0.01940521, 0.2524543, 0.4439941, 0, 0.854902, 1, 1,
-0.01916685, 1.983313, -0.3276667, 0, 0.8509804, 1, 1,
-0.01784155, -0.6569889, -2.679577, 0, 0.8431373, 1, 1,
-0.01685773, -1.565044, -3.758677, 0, 0.8392157, 1, 1,
-0.01606992, 0.5271597, -0.8825706, 0, 0.8313726, 1, 1,
-0.01181489, 0.2914703, -0.8834551, 0, 0.827451, 1, 1,
-0.01028545, -0.6387831, -2.573108, 0, 0.8196079, 1, 1,
-0.009401265, 0.3521234, -1.036546, 0, 0.8156863, 1, 1,
-0.007799004, -0.4294696, -2.039595, 0, 0.8078431, 1, 1,
-0.005924793, 0.7055424, 2.823761, 0, 0.8039216, 1, 1,
-0.004387833, -0.289386, -0.5641309, 0, 0.7960784, 1, 1,
0.002124582, 0.1664872, -0.4492677, 0, 0.7882353, 1, 1,
0.006008383, -1.141831, 4.39993, 0, 0.7843137, 1, 1,
0.007453474, -0.126021, 4.1414, 0, 0.7764706, 1, 1,
0.008178629, -0.1906966, 3.351995, 0, 0.772549, 1, 1,
0.01032369, -0.08568045, 1.625926, 0, 0.7647059, 1, 1,
0.01361747, 0.8207285, 0.4011081, 0, 0.7607843, 1, 1,
0.01972156, 1.58557, 0.2750151, 0, 0.7529412, 1, 1,
0.02032978, -0.1364659, 4.39078, 0, 0.7490196, 1, 1,
0.02165764, 1.728438, -0.07741506, 0, 0.7411765, 1, 1,
0.02391811, -0.0977513, 2.812221, 0, 0.7372549, 1, 1,
0.02745011, -1.789409, 3.553635, 0, 0.7294118, 1, 1,
0.03173954, -1.096446, 2.696831, 0, 0.7254902, 1, 1,
0.03179456, 0.7963392, -1.240002, 0, 0.7176471, 1, 1,
0.03521625, 1.994898, 0.7520316, 0, 0.7137255, 1, 1,
0.04767242, 0.008125219, 1.93444, 0, 0.7058824, 1, 1,
0.05277358, 1.080844, 0.4129758, 0, 0.6980392, 1, 1,
0.05425894, 0.490833, 0.255239, 0, 0.6941177, 1, 1,
0.05562615, 0.3052752, 0.8461085, 0, 0.6862745, 1, 1,
0.05624637, 2.452965, 0.05853195, 0, 0.682353, 1, 1,
0.05739765, -1.328748, 2.90148, 0, 0.6745098, 1, 1,
0.06091394, -1.058267, 3.976486, 0, 0.6705883, 1, 1,
0.06101222, -1.862054, 2.648122, 0, 0.6627451, 1, 1,
0.06596749, -2.587515, 3.441905, 0, 0.6588235, 1, 1,
0.06879784, 2.242404, -1.149119, 0, 0.6509804, 1, 1,
0.0724837, 0.09850761, 0.5902686, 0, 0.6470588, 1, 1,
0.07274865, 0.1814144, 0.8669647, 0, 0.6392157, 1, 1,
0.07388803, 1.198735, -2.419361, 0, 0.6352941, 1, 1,
0.07434569, 1.858296, -1.10099, 0, 0.627451, 1, 1,
0.07824259, 0.9474736, 0.103077, 0, 0.6235294, 1, 1,
0.0944319, -0.444669, 5.627603, 0, 0.6156863, 1, 1,
0.09580972, 0.7871724, 1.547837, 0, 0.6117647, 1, 1,
0.0969658, -0.9060341, 0.4714816, 0, 0.6039216, 1, 1,
0.09720947, 0.05715376, 1.396101, 0, 0.5960785, 1, 1,
0.09835064, -0.6906833, 2.782528, 0, 0.5921569, 1, 1,
0.09919022, -0.8095683, 3.8332, 0, 0.5843138, 1, 1,
0.1005263, 0.6174152, -2.590602, 0, 0.5803922, 1, 1,
0.103265, 0.1692808, 0.6577814, 0, 0.572549, 1, 1,
0.1062544, -0.4252663, 2.843581, 0, 0.5686275, 1, 1,
0.1066811, 0.7631688, -0.853269, 0, 0.5607843, 1, 1,
0.1111029, -0.6844423, 1.641021, 0, 0.5568628, 1, 1,
0.112527, -0.5017181, 2.718675, 0, 0.5490196, 1, 1,
0.1139612, -1.282181, 2.508364, 0, 0.5450981, 1, 1,
0.1148153, -0.3121303, 1.553316, 0, 0.5372549, 1, 1,
0.1190271, -1.77905, 0.3691899, 0, 0.5333334, 1, 1,
0.1195991, -1.516799, 3.14677, 0, 0.5254902, 1, 1,
0.1201122, -1.351044, 2.922617, 0, 0.5215687, 1, 1,
0.1214845, 0.6051853, 1.21818, 0, 0.5137255, 1, 1,
0.1262005, 0.5637727, 0.1787324, 0, 0.509804, 1, 1,
0.1286307, -0.08127663, 1.575655, 0, 0.5019608, 1, 1,
0.1317144, 0.2817854, 0.4519401, 0, 0.4941176, 1, 1,
0.1317879, -0.7079094, 2.222492, 0, 0.4901961, 1, 1,
0.1322627, 0.547901, 1.529688, 0, 0.4823529, 1, 1,
0.1353293, -1.334812, 3.528867, 0, 0.4784314, 1, 1,
0.1354439, 0.1412379, 0.7655169, 0, 0.4705882, 1, 1,
0.1366764, -0.4572509, 4.251457, 0, 0.4666667, 1, 1,
0.1373721, -1.482346, 3.228446, 0, 0.4588235, 1, 1,
0.1378721, -0.3831932, 3.18382, 0, 0.454902, 1, 1,
0.1418601, 1.359523, 0.2355279, 0, 0.4470588, 1, 1,
0.1457584, 0.5215189, -0.6823089, 0, 0.4431373, 1, 1,
0.1467564, 1.088137, -0.126914, 0, 0.4352941, 1, 1,
0.1523983, -0.2628769, 1.466037, 0, 0.4313726, 1, 1,
0.1556149, 1.182828, -1.175554, 0, 0.4235294, 1, 1,
0.1574933, 0.7292382, -0.8297445, 0, 0.4196078, 1, 1,
0.1575132, -1.084187, 2.891989, 0, 0.4117647, 1, 1,
0.1595504, -0.08375532, 1.538572, 0, 0.4078431, 1, 1,
0.1598798, 0.6125679, 0.01514846, 0, 0.4, 1, 1,
0.1625515, 0.3922533, -0.343139, 0, 0.3921569, 1, 1,
0.1743448, -1.398458, 2.867729, 0, 0.3882353, 1, 1,
0.1753896, -1.78317, 4.421814, 0, 0.3803922, 1, 1,
0.1824213, 0.09013265, 0.6457845, 0, 0.3764706, 1, 1,
0.1831142, 0.2461737, -0.6996288, 0, 0.3686275, 1, 1,
0.184258, 0.9943013, -1.006564, 0, 0.3647059, 1, 1,
0.1907696, -0.6984162, 2.28671, 0, 0.3568628, 1, 1,
0.20294, -1.204151, 4.949497, 0, 0.3529412, 1, 1,
0.2038579, 1.757308, -0.08788183, 0, 0.345098, 1, 1,
0.2057888, 0.3838954, 1.480874, 0, 0.3411765, 1, 1,
0.2084865, -0.03020235, 1.500927, 0, 0.3333333, 1, 1,
0.2087659, 1.103792, 0.4734027, 0, 0.3294118, 1, 1,
0.2139343, -0.9897943, 2.887823, 0, 0.3215686, 1, 1,
0.2149031, -2.024008, 2.735618, 0, 0.3176471, 1, 1,
0.215397, -1.030387, 5.636708, 0, 0.3098039, 1, 1,
0.2169652, -1.254599, 3.663527, 0, 0.3058824, 1, 1,
0.2183772, -0.6084285, 3.516431, 0, 0.2980392, 1, 1,
0.2200105, -1.6205, 3.215013, 0, 0.2901961, 1, 1,
0.2208852, 1.584701, -0.3624329, 0, 0.2862745, 1, 1,
0.2246762, 2.420147, 0.1279213, 0, 0.2784314, 1, 1,
0.228571, -0.5271953, 3.260094, 0, 0.2745098, 1, 1,
0.2299318, 2.016922, 1.290602, 0, 0.2666667, 1, 1,
0.2336001, 0.3280241, 1.10516, 0, 0.2627451, 1, 1,
0.2381566, -1.136446, 2.975852, 0, 0.254902, 1, 1,
0.2382941, -0.6164185, 2.243668, 0, 0.2509804, 1, 1,
0.2413508, -0.1676991, 0.8342158, 0, 0.2431373, 1, 1,
0.2420168, -0.7304566, 3.079154, 0, 0.2392157, 1, 1,
0.2444685, -0.2022911, 3.940403, 0, 0.2313726, 1, 1,
0.2446643, -0.4735776, 2.682777, 0, 0.227451, 1, 1,
0.2464335, -0.2733453, 0.7560185, 0, 0.2196078, 1, 1,
0.2475429, 0.544963, 1.802055, 0, 0.2156863, 1, 1,
0.249495, -0.3702253, 3.203385, 0, 0.2078431, 1, 1,
0.249964, -0.2249659, 1.426219, 0, 0.2039216, 1, 1,
0.2503611, 1.633485, 0.1972498, 0, 0.1960784, 1, 1,
0.2572211, 0.9095026, 0.2313281, 0, 0.1882353, 1, 1,
0.2622024, -0.2480925, 2.462671, 0, 0.1843137, 1, 1,
0.2634004, -0.814616, 1.978894, 0, 0.1764706, 1, 1,
0.2652137, -0.2216326, 2.678295, 0, 0.172549, 1, 1,
0.26542, 1.063376, 0.3896339, 0, 0.1647059, 1, 1,
0.2759858, -0.3178312, 2.228532, 0, 0.1607843, 1, 1,
0.2760862, -0.3746476, 0.7456382, 0, 0.1529412, 1, 1,
0.2780946, -0.5764709, 3.223785, 0, 0.1490196, 1, 1,
0.2788524, -0.8243095, 2.710565, 0, 0.1411765, 1, 1,
0.2843826, -1.277751, 3.467889, 0, 0.1372549, 1, 1,
0.2937548, -1.521483, 3.128714, 0, 0.1294118, 1, 1,
0.2955989, 0.1474901, 0.3665251, 0, 0.1254902, 1, 1,
0.2983396, -0.3537482, 0.6709795, 0, 0.1176471, 1, 1,
0.2995591, 1.3641, -0.04255158, 0, 0.1137255, 1, 1,
0.3023213, -0.2814361, 2.986778, 0, 0.1058824, 1, 1,
0.3052359, 0.3452352, 1.966978, 0, 0.09803922, 1, 1,
0.3079915, -0.3613609, 2.634905, 0, 0.09411765, 1, 1,
0.3220319, -0.7153436, 2.319527, 0, 0.08627451, 1, 1,
0.3243268, -0.291466, 1.525845, 0, 0.08235294, 1, 1,
0.3254583, 0.2307346, 1.623529, 0, 0.07450981, 1, 1,
0.3255903, -0.9572734, 1.864432, 0, 0.07058824, 1, 1,
0.3257969, -1.749633, 2.746375, 0, 0.0627451, 1, 1,
0.3293522, -0.6250524, 2.226201, 0, 0.05882353, 1, 1,
0.3298344, -0.3345971, 1.602076, 0, 0.05098039, 1, 1,
0.3338485, 0.9228317, -1.516911, 0, 0.04705882, 1, 1,
0.3341242, -0.3570974, 3.251871, 0, 0.03921569, 1, 1,
0.3440964, -0.3977334, 4.432076, 0, 0.03529412, 1, 1,
0.3443315, -0.263002, 2.886779, 0, 0.02745098, 1, 1,
0.3517761, -1.48021, 3.328579, 0, 0.02352941, 1, 1,
0.3525324, -0.7257515, 5.949864, 0, 0.01568628, 1, 1,
0.3566148, 1.071023, 1.291573, 0, 0.01176471, 1, 1,
0.3598051, 0.1453184, 1.672779, 0, 0.003921569, 1, 1,
0.3630856, -1.793779, 3.643093, 0.003921569, 0, 1, 1,
0.3646918, -0.2871516, 3.445503, 0.007843138, 0, 1, 1,
0.3651523, 0.6927171, 2.255986, 0.01568628, 0, 1, 1,
0.3702839, -1.070703, 4.124568, 0.01960784, 0, 1, 1,
0.3763843, -0.02289673, 0.4999716, 0.02745098, 0, 1, 1,
0.3822381, 1.520682, 0.2561885, 0.03137255, 0, 1, 1,
0.3830124, -1.311499, 3.166058, 0.03921569, 0, 1, 1,
0.3833891, 0.4720063, -0.481626, 0.04313726, 0, 1, 1,
0.3834612, 1.246252, 0.08646687, 0.05098039, 0, 1, 1,
0.3875848, 0.1268205, 1.073877, 0.05490196, 0, 1, 1,
0.3934442, 0.2043001, 0.3805328, 0.0627451, 0, 1, 1,
0.3955456, -0.3186095, 2.366798, 0.06666667, 0, 1, 1,
0.4027154, -1.523791, 3.070809, 0.07450981, 0, 1, 1,
0.4084409, 0.548656, 1.402499, 0.07843138, 0, 1, 1,
0.4103905, 0.3664429, 0.8411947, 0.08627451, 0, 1, 1,
0.4115318, -0.6903543, 2.366895, 0.09019608, 0, 1, 1,
0.4151029, 0.5730414, 0.3262265, 0.09803922, 0, 1, 1,
0.4166308, -0.6260619, 1.727702, 0.1058824, 0, 1, 1,
0.4183587, -0.9838906, 2.752727, 0.1098039, 0, 1, 1,
0.4213919, 0.6700577, -0.46935, 0.1176471, 0, 1, 1,
0.4215814, -0.5840985, 2.347947, 0.1215686, 0, 1, 1,
0.422955, 1.141586, -1.321602, 0.1294118, 0, 1, 1,
0.430491, 0.7881096, 0.6929501, 0.1333333, 0, 1, 1,
0.4311725, 2.679944, 0.3474315, 0.1411765, 0, 1, 1,
0.4329392, 0.2671706, 2.996036, 0.145098, 0, 1, 1,
0.4369156, -1.391953, 4.274134, 0.1529412, 0, 1, 1,
0.4373126, -1.05424, 2.349129, 0.1568628, 0, 1, 1,
0.4373394, 1.283139, -0.7744129, 0.1647059, 0, 1, 1,
0.4384962, 0.1246418, 2.73568, 0.1686275, 0, 1, 1,
0.4390315, 0.8869469, 0.8242304, 0.1764706, 0, 1, 1,
0.4403098, 0.7179287, 1.277718, 0.1803922, 0, 1, 1,
0.448374, -1.19805, 2.439276, 0.1882353, 0, 1, 1,
0.454433, 0.6933458, 1.622045, 0.1921569, 0, 1, 1,
0.4562088, 0.2707852, 1.166098, 0.2, 0, 1, 1,
0.4563929, -0.975538, 2.266944, 0.2078431, 0, 1, 1,
0.4575182, -1.165636, 1.279111, 0.2117647, 0, 1, 1,
0.4635994, 0.8881811, -1.061922, 0.2196078, 0, 1, 1,
0.4653479, -0.06728666, 1.178531, 0.2235294, 0, 1, 1,
0.4673336, 0.3147409, -0.02183761, 0.2313726, 0, 1, 1,
0.4693257, -0.4770086, 3.3979, 0.2352941, 0, 1, 1,
0.4696278, -0.5904325, 2.66088, 0.2431373, 0, 1, 1,
0.4718538, 0.2387663, 0.266418, 0.2470588, 0, 1, 1,
0.4729534, -0.1109666, 3.173874, 0.254902, 0, 1, 1,
0.4792976, -0.4048726, 2.041075, 0.2588235, 0, 1, 1,
0.4805067, -0.6891592, 4.555058, 0.2666667, 0, 1, 1,
0.4818501, -1.806793, 2.542955, 0.2705882, 0, 1, 1,
0.4839889, 0.2693604, 0.5868798, 0.2784314, 0, 1, 1,
0.4864019, -0.599947, 2.360101, 0.282353, 0, 1, 1,
0.4867246, 0.9173017, 0.9004526, 0.2901961, 0, 1, 1,
0.4879973, -1.280742, 3.199701, 0.2941177, 0, 1, 1,
0.4991173, 1.059009, 1.744015, 0.3019608, 0, 1, 1,
0.5009158, 1.406031, -0.07796405, 0.3098039, 0, 1, 1,
0.501412, -1.100062, 4.22614, 0.3137255, 0, 1, 1,
0.5082848, 0.8452252, -0.7861288, 0.3215686, 0, 1, 1,
0.5092935, -0.5369254, 1.278937, 0.3254902, 0, 1, 1,
0.5096235, 0.2679534, 2.067687, 0.3333333, 0, 1, 1,
0.5103198, -0.15793, 2.634508, 0.3372549, 0, 1, 1,
0.5143679, 2.496251, -0.420142, 0.345098, 0, 1, 1,
0.5174254, 1.700754, 1.997027, 0.3490196, 0, 1, 1,
0.5189421, 0.9297001, 0.8646144, 0.3568628, 0, 1, 1,
0.5223851, -0.1066114, 1.455959, 0.3607843, 0, 1, 1,
0.5246701, -0.1032094, 1.195202, 0.3686275, 0, 1, 1,
0.5321419, -0.9109408, 2.801324, 0.372549, 0, 1, 1,
0.5321924, 1.194741, -0.7790068, 0.3803922, 0, 1, 1,
0.5327068, -0.1330884, 1.202074, 0.3843137, 0, 1, 1,
0.5414039, 1.200732, -1.038431, 0.3921569, 0, 1, 1,
0.5449321, 0.5917047, 1.392614, 0.3960784, 0, 1, 1,
0.546257, -0.5804036, 3.883194, 0.4039216, 0, 1, 1,
0.5553466, 0.6252644, 1.73441, 0.4117647, 0, 1, 1,
0.5622216, -1.465535, 4.749683, 0.4156863, 0, 1, 1,
0.5633858, -0.1569629, 3.462095, 0.4235294, 0, 1, 1,
0.5748221, -0.3167292, 3.19097, 0.427451, 0, 1, 1,
0.5756555, -0.005583191, 1.78174, 0.4352941, 0, 1, 1,
0.5810109, -0.4599172, 2.795607, 0.4392157, 0, 1, 1,
0.5832825, 0.1338202, 0.4675151, 0.4470588, 0, 1, 1,
0.5875064, 1.088402, 0.02191482, 0.4509804, 0, 1, 1,
0.5886629, 0.6475879, 1.134747, 0.4588235, 0, 1, 1,
0.5893246, -0.5413674, 1.426172, 0.4627451, 0, 1, 1,
0.5898541, -0.7495552, 2.1202, 0.4705882, 0, 1, 1,
0.5985122, -0.6813126, 1.869289, 0.4745098, 0, 1, 1,
0.5986297, 1.004889, 0.9171421, 0.4823529, 0, 1, 1,
0.6047851, -0.2995284, 2.279477, 0.4862745, 0, 1, 1,
0.6092157, -1.696292, 2.641565, 0.4941176, 0, 1, 1,
0.6095775, -0.2846167, -0.6242396, 0.5019608, 0, 1, 1,
0.6174617, 0.5826678, 0.7178341, 0.5058824, 0, 1, 1,
0.6210023, -0.5672709, 0.4424209, 0.5137255, 0, 1, 1,
0.6267601, -1.096818, 1.520745, 0.5176471, 0, 1, 1,
0.6270611, -0.6120309, 1.983567, 0.5254902, 0, 1, 1,
0.6299301, -1.810408, 2.482638, 0.5294118, 0, 1, 1,
0.6303318, -1.218788, 3.689168, 0.5372549, 0, 1, 1,
0.6328709, 0.4288908, 1.631117, 0.5411765, 0, 1, 1,
0.6351125, 0.2815025, 2.186509, 0.5490196, 0, 1, 1,
0.6357695, -0.9312337, 2.482529, 0.5529412, 0, 1, 1,
0.6460803, 1.259391, -0.5019916, 0.5607843, 0, 1, 1,
0.6467562, -0.4990576, 2.725819, 0.5647059, 0, 1, 1,
0.6509719, -0.4323446, 3.629537, 0.572549, 0, 1, 1,
0.6641282, 0.8872133, 0.01853115, 0.5764706, 0, 1, 1,
0.6656486, -0.6472005, 5.25298, 0.5843138, 0, 1, 1,
0.6704298, -1.709416, 2.086093, 0.5882353, 0, 1, 1,
0.6731585, 0.2261529, 1.487722, 0.5960785, 0, 1, 1,
0.6752053, 1.47318, -2.253807, 0.6039216, 0, 1, 1,
0.6787018, -0.08310317, 3.95484, 0.6078432, 0, 1, 1,
0.6795437, 0.3831965, 1.32597, 0.6156863, 0, 1, 1,
0.6822733, 0.1491534, 2.442201, 0.6196079, 0, 1, 1,
0.683094, -0.4875062, 2.714601, 0.627451, 0, 1, 1,
0.687489, -0.008648558, 1.532187, 0.6313726, 0, 1, 1,
0.6960763, -2.496921, 1.537498, 0.6392157, 0, 1, 1,
0.7049106, 0.3416294, 0.7251506, 0.6431373, 0, 1, 1,
0.7061448, 0.01794446, 1.058619, 0.6509804, 0, 1, 1,
0.7063533, -1.533873, 1.654907, 0.654902, 0, 1, 1,
0.7075472, -0.02385095, 2.816271, 0.6627451, 0, 1, 1,
0.7099016, 0.8764743, 1.277791, 0.6666667, 0, 1, 1,
0.7099857, -0.09475897, 0.3969074, 0.6745098, 0, 1, 1,
0.7130825, 1.160703, -0.1849229, 0.6784314, 0, 1, 1,
0.7150349, 0.7631041, 1.315393, 0.6862745, 0, 1, 1,
0.7167381, 0.7113227, 1.884682, 0.6901961, 0, 1, 1,
0.7177161, 0.2608926, 0.897674, 0.6980392, 0, 1, 1,
0.7198098, -0.3299957, 0.9463031, 0.7058824, 0, 1, 1,
0.720603, 0.8662959, 1.418985, 0.7098039, 0, 1, 1,
0.7258189, -1.084628, 2.25251, 0.7176471, 0, 1, 1,
0.7284286, -0.1946329, 0.7909163, 0.7215686, 0, 1, 1,
0.7286896, 0.6121129, -0.3135351, 0.7294118, 0, 1, 1,
0.730144, -0.1785087, 1.138483, 0.7333333, 0, 1, 1,
0.7332922, -0.9009172, 1.952039, 0.7411765, 0, 1, 1,
0.7333339, -0.7496071, 2.912374, 0.7450981, 0, 1, 1,
0.7333549, 0.3184524, 2.660908, 0.7529412, 0, 1, 1,
0.7335146, -0.8334936, 1.642779, 0.7568628, 0, 1, 1,
0.735813, -1.430601, 3.459922, 0.7647059, 0, 1, 1,
0.7359975, -0.853884, 0.03710607, 0.7686275, 0, 1, 1,
0.7389452, -1.133522, 0.9902138, 0.7764706, 0, 1, 1,
0.7394553, 0.7815078, 1.226276, 0.7803922, 0, 1, 1,
0.7470803, 1.829191, -0.2978811, 0.7882353, 0, 1, 1,
0.7471616, 0.6129707, 1.662251, 0.7921569, 0, 1, 1,
0.751532, 0.1675822, 2.244124, 0.8, 0, 1, 1,
0.7524992, -2.301286, 3.250371, 0.8078431, 0, 1, 1,
0.7526883, -1.972639, 4.395236, 0.8117647, 0, 1, 1,
0.7570378, -0.2161224, 0.8596503, 0.8196079, 0, 1, 1,
0.7610044, -0.612505, 1.437857, 0.8235294, 0, 1, 1,
0.7696577, 0.2607841, 3.199684, 0.8313726, 0, 1, 1,
0.773385, -1.492812, 3.580333, 0.8352941, 0, 1, 1,
0.7758375, -2.909162, 3.095442, 0.8431373, 0, 1, 1,
0.7883347, 0.684817, -0.182617, 0.8470588, 0, 1, 1,
0.7950215, 0.5378162, 0.9706109, 0.854902, 0, 1, 1,
0.7957443, 1.584101, 0.9430864, 0.8588235, 0, 1, 1,
0.8073578, -1.172611, 2.816183, 0.8666667, 0, 1, 1,
0.8128566, -1.028325, 2.337775, 0.8705882, 0, 1, 1,
0.8162138, 0.3255993, 1.556926, 0.8784314, 0, 1, 1,
0.8189806, 0.4391528, 0.4771465, 0.8823529, 0, 1, 1,
0.8196868, 1.819142, 1.730445, 0.8901961, 0, 1, 1,
0.8197199, -0.006163489, 3.022802, 0.8941177, 0, 1, 1,
0.8208573, -0.7276922, 3.068969, 0.9019608, 0, 1, 1,
0.8278037, 0.6987146, 1.757387, 0.9098039, 0, 1, 1,
0.8310669, -0.6652077, 0.6488343, 0.9137255, 0, 1, 1,
0.8383169, -0.8798688, 3.558392, 0.9215686, 0, 1, 1,
0.8394094, 0.9264063, -0.2322572, 0.9254902, 0, 1, 1,
0.8412608, -1.002688, 2.19436, 0.9333333, 0, 1, 1,
0.8515577, 1.278264, 0.9457934, 0.9372549, 0, 1, 1,
0.8552288, 0.2674659, 1.112602, 0.945098, 0, 1, 1,
0.8557087, 1.090501, 0.6350479, 0.9490196, 0, 1, 1,
0.8590356, 0.2075183, 1.820797, 0.9568627, 0, 1, 1,
0.8631734, 0.6752499, 0.5976327, 0.9607843, 0, 1, 1,
0.8690766, -0.125355, 0.6892897, 0.9686275, 0, 1, 1,
0.8715526, -0.5205162, 0.1283552, 0.972549, 0, 1, 1,
0.8730884, 2.547561, 0.6682736, 0.9803922, 0, 1, 1,
0.875411, 0.9013963, -0.2568997, 0.9843137, 0, 1, 1,
0.8775669, 0.3245542, -1.226326, 0.9921569, 0, 1, 1,
0.8828707, -0.09647857, 1.769309, 0.9960784, 0, 1, 1,
0.8934927, 1.673234, -0.3390873, 1, 0, 0.9960784, 1,
0.895202, -0.7752845, 2.240369, 1, 0, 0.9882353, 1,
0.8962129, -0.2084929, 2.949633, 1, 0, 0.9843137, 1,
0.8985215, 1.984017, 0.8417194, 1, 0, 0.9764706, 1,
0.9071367, -1.312328, 1.774191, 1, 0, 0.972549, 1,
0.9083312, 0.3691079, 2.098183, 1, 0, 0.9647059, 1,
0.9085769, 2.001811, 0.6545388, 1, 0, 0.9607843, 1,
0.9138058, 0.2266786, 2.243378, 1, 0, 0.9529412, 1,
0.9287944, -0.4704109, 2.312572, 1, 0, 0.9490196, 1,
0.9322896, 0.2399337, -0.7250945, 1, 0, 0.9411765, 1,
0.9330832, -0.01259024, 1.775636, 1, 0, 0.9372549, 1,
0.9356084, 1.977994, 1.198042, 1, 0, 0.9294118, 1,
0.9417449, -0.2184532, 2.290296, 1, 0, 0.9254902, 1,
0.9484425, -0.8803669, 3.728054, 1, 0, 0.9176471, 1,
0.9501407, 2.124175, 1.508473, 1, 0, 0.9137255, 1,
0.9533367, -0.1197655, 0.9973282, 1, 0, 0.9058824, 1,
0.958079, -0.01180989, 1.79337, 1, 0, 0.9019608, 1,
0.9666585, 0.7604914, -1.370712, 1, 0, 0.8941177, 1,
0.9683378, 0.02037595, 1.634496, 1, 0, 0.8862745, 1,
0.9707832, 0.2275183, 2.123016, 1, 0, 0.8823529, 1,
0.9727375, -0.5179155, 4.046047, 1, 0, 0.8745098, 1,
0.9745065, 0.6541706, -0.1124341, 1, 0, 0.8705882, 1,
0.9795009, -1.402934, 2.88548, 1, 0, 0.8627451, 1,
0.9857827, 1.201918, 1.451342, 1, 0, 0.8588235, 1,
0.9876738, -1.404652, 2.351574, 1, 0, 0.8509804, 1,
0.9879305, -0.02897501, 1.572194, 1, 0, 0.8470588, 1,
0.9892542, 0.8491784, 1.787438, 1, 0, 0.8392157, 1,
0.9931898, 0.9802524, 0.02800356, 1, 0, 0.8352941, 1,
0.9943927, 0.4989862, 0.5266317, 1, 0, 0.827451, 1,
0.9969232, 0.7127889, 0.4400577, 1, 0, 0.8235294, 1,
0.9978043, -0.07212337, 1.949631, 1, 0, 0.8156863, 1,
1.001645, -1.745789, 2.738304, 1, 0, 0.8117647, 1,
1.007086, 0.2537122, 0.01862618, 1, 0, 0.8039216, 1,
1.017566, 0.8838663, 0.9493399, 1, 0, 0.7960784, 1,
1.020312, 0.4426312, 1.26726, 1, 0, 0.7921569, 1,
1.026936, -1.463553, 2.249328, 1, 0, 0.7843137, 1,
1.027062, 0.1386814, 3.871473, 1, 0, 0.7803922, 1,
1.031224, -0.8166399, 2.457376, 1, 0, 0.772549, 1,
1.03576, -0.6220561, 1.064289, 1, 0, 0.7686275, 1,
1.036869, 0.655463, 1.039908, 1, 0, 0.7607843, 1,
1.037894, 0.3454444, -0.5022721, 1, 0, 0.7568628, 1,
1.038199, -0.4005462, 1.132489, 1, 0, 0.7490196, 1,
1.046198, -0.7203911, 3.19031, 1, 0, 0.7450981, 1,
1.04802, 0.009919928, 0.7325892, 1, 0, 0.7372549, 1,
1.04911, 1.610453, -0.05705939, 1, 0, 0.7333333, 1,
1.05183, 0.4281849, 0.2949208, 1, 0, 0.7254902, 1,
1.052733, -1.294357, 4.117015, 1, 0, 0.7215686, 1,
1.060893, -1.854683, 3.056002, 1, 0, 0.7137255, 1,
1.061441, 1.245565, -1.131866, 1, 0, 0.7098039, 1,
1.064469, 0.763229, 0.6704963, 1, 0, 0.7019608, 1,
1.066567, -0.6581991, 0.9615759, 1, 0, 0.6941177, 1,
1.070448, 2.541504, 0.5781541, 1, 0, 0.6901961, 1,
1.070821, -0.3712887, 0.08483647, 1, 0, 0.682353, 1,
1.073065, 0.1231324, 1.749532, 1, 0, 0.6784314, 1,
1.076159, -2.258881, 1.945777, 1, 0, 0.6705883, 1,
1.084644, 1.842639, 2.574449, 1, 0, 0.6666667, 1,
1.085324, -1.033426, 3.489911, 1, 0, 0.6588235, 1,
1.085546, -0.1001672, 2.700344, 1, 0, 0.654902, 1,
1.104735, 0.4022945, -0.2964375, 1, 0, 0.6470588, 1,
1.106565, -1.075548, 1.151095, 1, 0, 0.6431373, 1,
1.106782, -0.5507121, 1.779091, 1, 0, 0.6352941, 1,
1.108635, -0.1727155, 0.7510316, 1, 0, 0.6313726, 1,
1.110552, 0.6171724, 1.972294, 1, 0, 0.6235294, 1,
1.121249, 0.6922528, 1.068467, 1, 0, 0.6196079, 1,
1.1231, 1.82495, 0.6568376, 1, 0, 0.6117647, 1,
1.128109, 1.765202, 0.8369172, 1, 0, 0.6078432, 1,
1.134237, -2.031412, 3.088447, 1, 0, 0.6, 1,
1.139475, 0.08275935, 1.431417, 1, 0, 0.5921569, 1,
1.141388, 0.2029406, 0.8376786, 1, 0, 0.5882353, 1,
1.152271, -0.2837507, 3.381264, 1, 0, 0.5803922, 1,
1.154104, -0.8832105, 1.173361, 1, 0, 0.5764706, 1,
1.162868, 1.267624, 1.302399, 1, 0, 0.5686275, 1,
1.165245, 1.18322, -0.5106568, 1, 0, 0.5647059, 1,
1.169203, -0.2831939, 2.226834, 1, 0, 0.5568628, 1,
1.177633, 0.5262972, -0.03820745, 1, 0, 0.5529412, 1,
1.179649, -1.434338, 3.069165, 1, 0, 0.5450981, 1,
1.180268, 0.3346866, 2.254181, 1, 0, 0.5411765, 1,
1.182046, 0.2078776, 2.397002, 1, 0, 0.5333334, 1,
1.183254, 2.099685, -1.1218, 1, 0, 0.5294118, 1,
1.188882, -1.761827, 2.767147, 1, 0, 0.5215687, 1,
1.202835, -0.1734602, 2.038466, 1, 0, 0.5176471, 1,
1.203889, 0.7034954, 1.740226, 1, 0, 0.509804, 1,
1.210197, 0.05942751, -0.4702258, 1, 0, 0.5058824, 1,
1.214154, -0.03556486, 2.234417, 1, 0, 0.4980392, 1,
1.229893, 0.896367, -0.04997702, 1, 0, 0.4901961, 1,
1.231227, -1.422876, 3.39217, 1, 0, 0.4862745, 1,
1.232883, 0.3537531, 0.0590312, 1, 0, 0.4784314, 1,
1.247309, -1.593492, 4.767694, 1, 0, 0.4745098, 1,
1.25427, 0.3793612, 0.2648142, 1, 0, 0.4666667, 1,
1.25933, -0.3893092, 1.870267, 1, 0, 0.4627451, 1,
1.272646, -1.710226, 2.416138, 1, 0, 0.454902, 1,
1.286269, 1.453515, -0.9789224, 1, 0, 0.4509804, 1,
1.287676, -0.5998843, 3.03443, 1, 0, 0.4431373, 1,
1.314796, -0.2519389, 1.900864, 1, 0, 0.4392157, 1,
1.31999, -1.615539, 1.054199, 1, 0, 0.4313726, 1,
1.325758, 0.03930682, 2.352915, 1, 0, 0.427451, 1,
1.330817, 0.3813681, 1.406362, 1, 0, 0.4196078, 1,
1.349623, -0.2889614, 1.024382, 1, 0, 0.4156863, 1,
1.387058, -1.579069, 4.491617, 1, 0, 0.4078431, 1,
1.395007, -2.246634, 1.370318, 1, 0, 0.4039216, 1,
1.403708, 1.123662, 0.08514432, 1, 0, 0.3960784, 1,
1.404536, -0.02450755, 3.370833, 1, 0, 0.3882353, 1,
1.411815, -0.3049017, 2.263258, 1, 0, 0.3843137, 1,
1.419018, -0.3905411, 2.269709, 1, 0, 0.3764706, 1,
1.421109, 0.5461233, 0.8960843, 1, 0, 0.372549, 1,
1.42355, 0.3627681, 2.500596, 1, 0, 0.3647059, 1,
1.426687, -1.931306, 1.982651, 1, 0, 0.3607843, 1,
1.431211, 1.905641, -0.2656778, 1, 0, 0.3529412, 1,
1.440983, 0.8513455, 1.298799, 1, 0, 0.3490196, 1,
1.448242, 0.002275202, 0.2655824, 1, 0, 0.3411765, 1,
1.455818, -1.364265, 3.090825, 1, 0, 0.3372549, 1,
1.463192, -0.8084739, 1.702017, 1, 0, 0.3294118, 1,
1.468107, 0.7193468, -1.394332, 1, 0, 0.3254902, 1,
1.491203, 2.072362, -0.6850711, 1, 0, 0.3176471, 1,
1.500642, -0.2825934, 2.206838, 1, 0, 0.3137255, 1,
1.503746, -0.1873269, 3.890593, 1, 0, 0.3058824, 1,
1.509478, 0.1599499, 1.49816, 1, 0, 0.2980392, 1,
1.510834, -0.9958475, 1.854018, 1, 0, 0.2941177, 1,
1.517924, 1.007485, 1.626902, 1, 0, 0.2862745, 1,
1.51843, 0.1463992, 2.162764, 1, 0, 0.282353, 1,
1.518655, -1.325886, 2.871754, 1, 0, 0.2745098, 1,
1.519946, -0.2397266, 0.4173999, 1, 0, 0.2705882, 1,
1.521002, 0.6251224, 1.684846, 1, 0, 0.2627451, 1,
1.523781, 1.427712, 0.4578867, 1, 0, 0.2588235, 1,
1.529372, 0.3056875, 0.3774768, 1, 0, 0.2509804, 1,
1.552931, 2.446381, 0.2209794, 1, 0, 0.2470588, 1,
1.57332, 1.526493, 1.840214, 1, 0, 0.2392157, 1,
1.579674, -1.455, 1.611128, 1, 0, 0.2352941, 1,
1.608274, -0.7172069, 2.538396, 1, 0, 0.227451, 1,
1.663093, 0.2932402, 1.925862, 1, 0, 0.2235294, 1,
1.663933, 0.5933861, 0.2394047, 1, 0, 0.2156863, 1,
1.664323, -1.739962, 2.190563, 1, 0, 0.2117647, 1,
1.672188, -1.215614, 1.783702, 1, 0, 0.2039216, 1,
1.69715, -0.535314, 1.587546, 1, 0, 0.1960784, 1,
1.697431, -0.1349034, 0.007810359, 1, 0, 0.1921569, 1,
1.707026, 1.220696, 1.251873, 1, 0, 0.1843137, 1,
1.738815, 0.2292075, 2.522789, 1, 0, 0.1803922, 1,
1.740844, -1.118872, 2.666908, 1, 0, 0.172549, 1,
1.747455, -0.7666731, 1.73133, 1, 0, 0.1686275, 1,
1.748493, -0.3926732, 1.398811, 1, 0, 0.1607843, 1,
1.757188, -1.515881, 4.279655, 1, 0, 0.1568628, 1,
1.759007, 0.720248, 1.361821, 1, 0, 0.1490196, 1,
1.849669, -0.4292714, 2.542842, 1, 0, 0.145098, 1,
1.872757, 0.3024538, 1.151402, 1, 0, 0.1372549, 1,
1.913311, 2.120048, 0.8692128, 1, 0, 0.1333333, 1,
1.934822, -1.086345, 1.969115, 1, 0, 0.1254902, 1,
1.983427, -2.125702, 2.327028, 1, 0, 0.1215686, 1,
2.074758, 1.325685, 0.4726001, 1, 0, 0.1137255, 1,
2.1857, -1.093038, 2.528524, 1, 0, 0.1098039, 1,
2.190278, -0.709376, 1.173771, 1, 0, 0.1019608, 1,
2.219895, -0.229696, 0.8769244, 1, 0, 0.09411765, 1,
2.223735, 2.505711, -1.146456, 1, 0, 0.09019608, 1,
2.227644, 0.6030707, 1.301226, 1, 0, 0.08235294, 1,
2.266502, 0.5576429, -0.4592855, 1, 0, 0.07843138, 1,
2.328381, 0.4041133, 1.129338, 1, 0, 0.07058824, 1,
2.419142, 0.1502592, 1.797614, 1, 0, 0.06666667, 1,
2.439941, 0.7927176, 2.752069, 1, 0, 0.05882353, 1,
2.491154, -0.8192526, 2.158134, 1, 0, 0.05490196, 1,
2.53604, 0.589063, 1.0678, 1, 0, 0.04705882, 1,
2.562468, -0.007903366, 2.68801, 1, 0, 0.04313726, 1,
2.58449, 0.608077, 1.515905, 1, 0, 0.03529412, 1,
2.663647, -0.3378301, 2.424045, 1, 0, 0.03137255, 1,
2.668401, -2.659296, 2.682492, 1, 0, 0.02352941, 1,
2.709928, 1.028792, 1.966998, 1, 0, 0.01960784, 1,
2.770544, 0.4468978, 1.901316, 1, 0, 0.01176471, 1,
2.894233, -0.01398011, 2.481031, 1, 0, 0.007843138, 1
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
-0.2062641, -3.928103, -7.153345, 0, -0.5, 0.5, 0.5,
-0.2062641, -3.928103, -7.153345, 1, -0.5, 0.5, 0.5,
-0.2062641, -3.928103, -7.153345, 1, 1.5, 0.5, 0.5,
-0.2062641, -3.928103, -7.153345, 0, 1.5, 0.5, 0.5
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
-4.35783, -0.02218461, -7.153345, 0, -0.5, 0.5, 0.5,
-4.35783, -0.02218461, -7.153345, 1, -0.5, 0.5, 0.5,
-4.35783, -0.02218461, -7.153345, 1, 1.5, 0.5, 0.5,
-4.35783, -0.02218461, -7.153345, 0, 1.5, 0.5, 0.5
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
-4.35783, -3.928103, 0.3478081, 0, -0.5, 0.5, 0.5,
-4.35783, -3.928103, 0.3478081, 1, -0.5, 0.5, 0.5,
-4.35783, -3.928103, 0.3478081, 1, 1.5, 0.5, 0.5,
-4.35783, -3.928103, 0.3478081, 0, 1.5, 0.5, 0.5
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
-3, -3.026738, -5.42231,
2, -3.026738, -5.42231,
-3, -3.026738, -5.42231,
-3, -3.176965, -5.710816,
-2, -3.026738, -5.42231,
-2, -3.176965, -5.710816,
-1, -3.026738, -5.42231,
-1, -3.176965, -5.710816,
0, -3.026738, -5.42231,
0, -3.176965, -5.710816,
1, -3.026738, -5.42231,
1, -3.176965, -5.710816,
2, -3.026738, -5.42231,
2, -3.176965, -5.710816
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
-3, -3.477421, -6.287827, 0, -0.5, 0.5, 0.5,
-3, -3.477421, -6.287827, 1, -0.5, 0.5, 0.5,
-3, -3.477421, -6.287827, 1, 1.5, 0.5, 0.5,
-3, -3.477421, -6.287827, 0, 1.5, 0.5, 0.5,
-2, -3.477421, -6.287827, 0, -0.5, 0.5, 0.5,
-2, -3.477421, -6.287827, 1, -0.5, 0.5, 0.5,
-2, -3.477421, -6.287827, 1, 1.5, 0.5, 0.5,
-2, -3.477421, -6.287827, 0, 1.5, 0.5, 0.5,
-1, -3.477421, -6.287827, 0, -0.5, 0.5, 0.5,
-1, -3.477421, -6.287827, 1, -0.5, 0.5, 0.5,
-1, -3.477421, -6.287827, 1, 1.5, 0.5, 0.5,
-1, -3.477421, -6.287827, 0, 1.5, 0.5, 0.5,
0, -3.477421, -6.287827, 0, -0.5, 0.5, 0.5,
0, -3.477421, -6.287827, 1, -0.5, 0.5, 0.5,
0, -3.477421, -6.287827, 1, 1.5, 0.5, 0.5,
0, -3.477421, -6.287827, 0, 1.5, 0.5, 0.5,
1, -3.477421, -6.287827, 0, -0.5, 0.5, 0.5,
1, -3.477421, -6.287827, 1, -0.5, 0.5, 0.5,
1, -3.477421, -6.287827, 1, 1.5, 0.5, 0.5,
1, -3.477421, -6.287827, 0, 1.5, 0.5, 0.5,
2, -3.477421, -6.287827, 0, -0.5, 0.5, 0.5,
2, -3.477421, -6.287827, 1, -0.5, 0.5, 0.5,
2, -3.477421, -6.287827, 1, 1.5, 0.5, 0.5,
2, -3.477421, -6.287827, 0, 1.5, 0.5, 0.5
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
-3.399776, -2, -5.42231,
-3.399776, 2, -5.42231,
-3.399776, -2, -5.42231,
-3.559452, -2, -5.710816,
-3.399776, -1, -5.42231,
-3.559452, -1, -5.710816,
-3.399776, 0, -5.42231,
-3.559452, 0, -5.710816,
-3.399776, 1, -5.42231,
-3.559452, 1, -5.710816,
-3.399776, 2, -5.42231,
-3.559452, 2, -5.710816
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
-3.878803, -2, -6.287827, 0, -0.5, 0.5, 0.5,
-3.878803, -2, -6.287827, 1, -0.5, 0.5, 0.5,
-3.878803, -2, -6.287827, 1, 1.5, 0.5, 0.5,
-3.878803, -2, -6.287827, 0, 1.5, 0.5, 0.5,
-3.878803, -1, -6.287827, 0, -0.5, 0.5, 0.5,
-3.878803, -1, -6.287827, 1, -0.5, 0.5, 0.5,
-3.878803, -1, -6.287827, 1, 1.5, 0.5, 0.5,
-3.878803, -1, -6.287827, 0, 1.5, 0.5, 0.5,
-3.878803, 0, -6.287827, 0, -0.5, 0.5, 0.5,
-3.878803, 0, -6.287827, 1, -0.5, 0.5, 0.5,
-3.878803, 0, -6.287827, 1, 1.5, 0.5, 0.5,
-3.878803, 0, -6.287827, 0, 1.5, 0.5, 0.5,
-3.878803, 1, -6.287827, 0, -0.5, 0.5, 0.5,
-3.878803, 1, -6.287827, 1, -0.5, 0.5, 0.5,
-3.878803, 1, -6.287827, 1, 1.5, 0.5, 0.5,
-3.878803, 1, -6.287827, 0, 1.5, 0.5, 0.5,
-3.878803, 2, -6.287827, 0, -0.5, 0.5, 0.5,
-3.878803, 2, -6.287827, 1, -0.5, 0.5, 0.5,
-3.878803, 2, -6.287827, 1, 1.5, 0.5, 0.5,
-3.878803, 2, -6.287827, 0, 1.5, 0.5, 0.5
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
-3.399776, -3.026738, -4,
-3.399776, -3.026738, 4,
-3.399776, -3.026738, -4,
-3.559452, -3.176965, -4,
-3.399776, -3.026738, -2,
-3.559452, -3.176965, -2,
-3.399776, -3.026738, 0,
-3.559452, -3.176965, 0,
-3.399776, -3.026738, 2,
-3.559452, -3.176965, 2,
-3.399776, -3.026738, 4,
-3.559452, -3.176965, 4
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
-3.878803, -3.477421, -4, 0, -0.5, 0.5, 0.5,
-3.878803, -3.477421, -4, 1, -0.5, 0.5, 0.5,
-3.878803, -3.477421, -4, 1, 1.5, 0.5, 0.5,
-3.878803, -3.477421, -4, 0, 1.5, 0.5, 0.5,
-3.878803, -3.477421, -2, 0, -0.5, 0.5, 0.5,
-3.878803, -3.477421, -2, 1, -0.5, 0.5, 0.5,
-3.878803, -3.477421, -2, 1, 1.5, 0.5, 0.5,
-3.878803, -3.477421, -2, 0, 1.5, 0.5, 0.5,
-3.878803, -3.477421, 0, 0, -0.5, 0.5, 0.5,
-3.878803, -3.477421, 0, 1, -0.5, 0.5, 0.5,
-3.878803, -3.477421, 0, 1, 1.5, 0.5, 0.5,
-3.878803, -3.477421, 0, 0, 1.5, 0.5, 0.5,
-3.878803, -3.477421, 2, 0, -0.5, 0.5, 0.5,
-3.878803, -3.477421, 2, 1, -0.5, 0.5, 0.5,
-3.878803, -3.477421, 2, 1, 1.5, 0.5, 0.5,
-3.878803, -3.477421, 2, 0, 1.5, 0.5, 0.5,
-3.878803, -3.477421, 4, 0, -0.5, 0.5, 0.5,
-3.878803, -3.477421, 4, 1, -0.5, 0.5, 0.5,
-3.878803, -3.477421, 4, 1, 1.5, 0.5, 0.5,
-3.878803, -3.477421, 4, 0, 1.5, 0.5, 0.5
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
-3.399776, -3.026738, -5.42231,
-3.399776, 2.982368, -5.42231,
-3.399776, -3.026738, 6.117926,
-3.399776, 2.982368, 6.117926,
-3.399776, -3.026738, -5.42231,
-3.399776, -3.026738, 6.117926,
-3.399776, 2.982368, -5.42231,
-3.399776, 2.982368, 6.117926,
-3.399776, -3.026738, -5.42231,
2.987248, -3.026738, -5.42231,
-3.399776, -3.026738, 6.117926,
2.987248, -3.026738, 6.117926,
-3.399776, 2.982368, -5.42231,
2.987248, 2.982368, -5.42231,
-3.399776, 2.982368, 6.117926,
2.987248, 2.982368, 6.117926,
2.987248, -3.026738, -5.42231,
2.987248, 2.982368, -5.42231,
2.987248, -3.026738, 6.117926,
2.987248, 2.982368, 6.117926,
2.987248, -3.026738, -5.42231,
2.987248, -3.026738, 6.117926,
2.987248, 2.982368, -5.42231,
2.987248, 2.982368, 6.117926
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
var radius = 7.739596;
var distance = 34.43434;
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
mvMatrix.translate( 0.2062641, 0.02218461, -0.3478081 );
mvMatrix.scale( 1.310188, 1.392587, 0.7251328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43434);
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
Phenacetin<-read.table("Phenacetin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenacetin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenacetin' not found
```

```r
y<-Phenacetin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenacetin' not found
```

```r
z<-Phenacetin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenacetin' not found
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
-3.306761, -0.2981778, -1.489481, 0, 0, 1, 1, 1,
-2.942609, -1.237358, -1.878128, 1, 0, 0, 1, 1,
-2.858323, 0.6913465, -1.367273, 1, 0, 0, 1, 1,
-2.797461, -1.241039, -0.4273828, 1, 0, 0, 1, 1,
-2.74312, 1.319694, -1.13949, 1, 0, 0, 1, 1,
-2.650283, 0.8217254, -0.6235932, 1, 0, 0, 1, 1,
-2.618757, -0.819013, -1.851032, 0, 0, 0, 1, 1,
-2.60649, -1.157734, -3.787251, 0, 0, 0, 1, 1,
-2.568241, 0.5967436, 0.041402, 0, 0, 0, 1, 1,
-2.538035, -1.413163, -2.68911, 0, 0, 0, 1, 1,
-2.47187, 0.7568894, -1.337368, 0, 0, 0, 1, 1,
-2.46849, 0.7084831, -1.09378, 0, 0, 0, 1, 1,
-2.45916, -0.5234168, -1.871798, 0, 0, 0, 1, 1,
-2.317049, 0.7367467, 0.06774159, 1, 1, 1, 1, 1,
-2.182613, -0.1663714, 0.9224616, 1, 1, 1, 1, 1,
-2.145004, -0.6587287, -3.89554, 1, 1, 1, 1, 1,
-2.104701, -2.939226, -3.585855, 1, 1, 1, 1, 1,
-2.093466, 0.4486884, -1.436952, 1, 1, 1, 1, 1,
-2.074553, 0.05275391, -2.363017, 1, 1, 1, 1, 1,
-2.069444, -0.8599539, -2.917541, 1, 1, 1, 1, 1,
-2.015163, -0.7786082, -0.2326344, 1, 1, 1, 1, 1,
-1.996011, -0.05896992, -0.1326183, 1, 1, 1, 1, 1,
-1.979767, -0.9734746, -2.866412, 1, 1, 1, 1, 1,
-1.904089, -0.09767013, -1.836318, 1, 1, 1, 1, 1,
-1.894915, -0.5201485, 0.3358251, 1, 1, 1, 1, 1,
-1.875347, -0.0645999, -0.4916591, 1, 1, 1, 1, 1,
-1.863545, -1.166053, -3.131392, 1, 1, 1, 1, 1,
-1.857939, -0.8329098, -2.155072, 1, 1, 1, 1, 1,
-1.850055, -1.035848, -1.647235, 0, 0, 1, 1, 1,
-1.800358, 0.2312742, -0.6020342, 1, 0, 0, 1, 1,
-1.79214, 1.239752, -0.1837862, 1, 0, 0, 1, 1,
-1.733301, -0.6106297, -2.245063, 1, 0, 0, 1, 1,
-1.716998, 0.7619601, -0.7150443, 1, 0, 0, 1, 1,
-1.711828, -0.5279622, -3.321428, 1, 0, 0, 1, 1,
-1.705873, 0.7663141, -0.8543088, 0, 0, 0, 1, 1,
-1.682146, 1.869959, -0.0948955, 0, 0, 0, 1, 1,
-1.674392, 1.054366, -0.7970036, 0, 0, 0, 1, 1,
-1.646345, -0.1543954, -0.7731537, 0, 0, 0, 1, 1,
-1.635067, -1.568755, -2.892381, 0, 0, 0, 1, 1,
-1.629446, 0.7562432, -2.610641, 0, 0, 0, 1, 1,
-1.620038, 1.071857, -1.032404, 0, 0, 0, 1, 1,
-1.61108, 1.119103, -1.112931, 1, 1, 1, 1, 1,
-1.606888, -0.1872337, -2.380204, 1, 1, 1, 1, 1,
-1.606249, 1.089635, -0.8168417, 1, 1, 1, 1, 1,
-1.605945, -0.8967054, -4.430096, 1, 1, 1, 1, 1,
-1.605911, -0.9442011, -1.407942, 1, 1, 1, 1, 1,
-1.600736, -0.02282732, -0.9294374, 1, 1, 1, 1, 1,
-1.600674, -2.10834, -2.713049, 1, 1, 1, 1, 1,
-1.598332, 1.607843, -0.9275868, 1, 1, 1, 1, 1,
-1.593997, 0.5779175, -2.34081, 1, 1, 1, 1, 1,
-1.580689, 0.1671547, -1.124816, 1, 1, 1, 1, 1,
-1.576118, 0.5051142, -1.391731, 1, 1, 1, 1, 1,
-1.575598, -1.074064, -1.973143, 1, 1, 1, 1, 1,
-1.57393, 1.853653, -0.3583542, 1, 1, 1, 1, 1,
-1.571879, 0.1328535, -1.441421, 1, 1, 1, 1, 1,
-1.545388, -1.029212, -3.5381, 1, 1, 1, 1, 1,
-1.539118, 0.6726137, -2.014053, 0, 0, 1, 1, 1,
-1.51992, -0.1178662, -1.519883, 1, 0, 0, 1, 1,
-1.514931, 0.8208531, -0.5263678, 1, 0, 0, 1, 1,
-1.507663, -1.312173, -1.889714, 1, 0, 0, 1, 1,
-1.496919, 0.2588609, -1.706058, 1, 0, 0, 1, 1,
-1.492511, 0.7570607, 0.8041373, 1, 0, 0, 1, 1,
-1.491237, -0.5474162, 0.2875647, 0, 0, 0, 1, 1,
-1.481668, 0.3525229, -1.417146, 0, 0, 0, 1, 1,
-1.481136, 0.5607736, -2.653117, 0, 0, 0, 1, 1,
-1.472404, 0.7548176, -0.7026381, 0, 0, 0, 1, 1,
-1.469394, -1.27048, -3.537573, 0, 0, 0, 1, 1,
-1.468896, -1.296849, -1.374133, 0, 0, 0, 1, 1,
-1.467565, -0.5720469, -0.8074624, 0, 0, 0, 1, 1,
-1.464364, -0.7400928, -3.043153, 1, 1, 1, 1, 1,
-1.463509, 0.1273763, -3.064561, 1, 1, 1, 1, 1,
-1.460337, 1.18691, 0.3537182, 1, 1, 1, 1, 1,
-1.457218, 1.698569, 0.2753086, 1, 1, 1, 1, 1,
-1.452784, -0.9735014, -1.682104, 1, 1, 1, 1, 1,
-1.444125, -0.7218245, -2.898374, 1, 1, 1, 1, 1,
-1.423254, -1.204696, -2.273153, 1, 1, 1, 1, 1,
-1.418899, 0.856626, -1.03048, 1, 1, 1, 1, 1,
-1.415764, -0.1757348, -1.411044, 1, 1, 1, 1, 1,
-1.407192, -0.7485673, -4.029856, 1, 1, 1, 1, 1,
-1.400918, 1.034739, -0.7945686, 1, 1, 1, 1, 1,
-1.398844, -0.2129705, -1.058009, 1, 1, 1, 1, 1,
-1.396007, -0.9816286, -0.7267425, 1, 1, 1, 1, 1,
-1.390895, 0.1501378, -3.476394, 1, 1, 1, 1, 1,
-1.390725, 1.324469, -1.977027, 1, 1, 1, 1, 1,
-1.389034, -1.185513, -2.450073, 0, 0, 1, 1, 1,
-1.363456, -1.030389, -1.076497, 1, 0, 0, 1, 1,
-1.356683, -0.2761242, -3.003593, 1, 0, 0, 1, 1,
-1.3544, -0.760508, -2.442361, 1, 0, 0, 1, 1,
-1.344992, -0.8502046, -1.159959, 1, 0, 0, 1, 1,
-1.33908, 1.792535, -0.9740073, 1, 0, 0, 1, 1,
-1.337581, -0.5252576, 0.1539098, 0, 0, 0, 1, 1,
-1.328768, -0.1953256, -0.8960515, 0, 0, 0, 1, 1,
-1.315879, 0.8951579, -1.58329, 0, 0, 0, 1, 1,
-1.309462, 0.03769274, -1.471462, 0, 0, 0, 1, 1,
-1.307557, 2.494776, 0.4183509, 0, 0, 0, 1, 1,
-1.307071, 0.3889512, -1.809925, 0, 0, 0, 1, 1,
-1.302488, 1.367375, -2.668843, 0, 0, 0, 1, 1,
-1.288938, -0.3377395, -1.472915, 1, 1, 1, 1, 1,
-1.288014, 1.824883, -1.061731, 1, 1, 1, 1, 1,
-1.276434, 0.6156856, -1.675931, 1, 1, 1, 1, 1,
-1.276053, -1.011311, -0.7302428, 1, 1, 1, 1, 1,
-1.267932, 1.278077, -0.6420732, 1, 1, 1, 1, 1,
-1.259364, 1.379628, -1.774192, 1, 1, 1, 1, 1,
-1.246542, -0.2160892, -2.507087, 1, 1, 1, 1, 1,
-1.244657, 1.069977, -1.444455, 1, 1, 1, 1, 1,
-1.230801, 0.3592421, 1.404109, 1, 1, 1, 1, 1,
-1.226217, 0.8526593, -1.866918, 1, 1, 1, 1, 1,
-1.214788, -0.791729, -2.264686, 1, 1, 1, 1, 1,
-1.205551, 0.8666075, -0.01565353, 1, 1, 1, 1, 1,
-1.204855, -1.797237, -1.743736, 1, 1, 1, 1, 1,
-1.204626, -0.3720719, -3.659166, 1, 1, 1, 1, 1,
-1.201107, -0.5505683, -3.488199, 1, 1, 1, 1, 1,
-1.194758, 0.8797047, -1.335656, 0, 0, 1, 1, 1,
-1.192957, -1.382001, -2.625903, 1, 0, 0, 1, 1,
-1.18964, -0.2034364, -1.819498, 1, 0, 0, 1, 1,
-1.183663, 1.04549, -0.9510112, 1, 0, 0, 1, 1,
-1.172318, 0.5972831, 0.03761323, 1, 0, 0, 1, 1,
-1.167158, 2.119407, 0.1154824, 1, 0, 0, 1, 1,
-1.166074, 0.5140383, -0.1703795, 0, 0, 0, 1, 1,
-1.165949, 0.5739158, 0.1730725, 0, 0, 0, 1, 1,
-1.158461, -1.112781, -2.746538, 0, 0, 0, 1, 1,
-1.15609, 0.8890808, -0.4415547, 0, 0, 0, 1, 1,
-1.155206, 0.04963992, -0.2966504, 0, 0, 0, 1, 1,
-1.149738, -0.6688307, -2.759081, 0, 0, 0, 1, 1,
-1.148659, 0.3078083, -1.481122, 0, 0, 0, 1, 1,
-1.148375, -0.3227118, -1.819186, 1, 1, 1, 1, 1,
-1.147092, 0.1724695, -1.830935, 1, 1, 1, 1, 1,
-1.145699, 1.048827, -0.4445432, 1, 1, 1, 1, 1,
-1.138477, 0.03920693, -1.179118, 1, 1, 1, 1, 1,
-1.137854, -0.1027168, -3.240072, 1, 1, 1, 1, 1,
-1.134023, -1.499299, -0.7644452, 1, 1, 1, 1, 1,
-1.122416, 0.5929616, -2.085771, 1, 1, 1, 1, 1,
-1.119754, 1.670997, 0.7628628, 1, 1, 1, 1, 1,
-1.117271, 0.3373048, -0.5965161, 1, 1, 1, 1, 1,
-1.109851, -0.750673, -1.101047, 1, 1, 1, 1, 1,
-1.106276, -0.004513181, -1.966333, 1, 1, 1, 1, 1,
-1.098191, 0.2384331, -1.30202, 1, 1, 1, 1, 1,
-1.098175, 0.5697402, -1.806188, 1, 1, 1, 1, 1,
-1.093356, 1.15492, -2.337569, 1, 1, 1, 1, 1,
-1.092333, -1.411501, -3.244447, 1, 1, 1, 1, 1,
-1.092026, -0.2861011, -2.766111, 0, 0, 1, 1, 1,
-1.091004, 0.5113147, -3.171843, 1, 0, 0, 1, 1,
-1.090675, -0.3542935, -2.979213, 1, 0, 0, 1, 1,
-1.086158, 1.081194, -1.334542, 1, 0, 0, 1, 1,
-1.08469, 0.6238917, -1.362816, 1, 0, 0, 1, 1,
-1.072301, -0.4213265, -1.507438, 1, 0, 0, 1, 1,
-1.059489, 0.6916968, -5.165395, 0, 0, 0, 1, 1,
-1.059362, 1.263584, 0.3855757, 0, 0, 0, 1, 1,
-1.053555, 0.3790384, -1.657584, 0, 0, 0, 1, 1,
-1.049667, -0.1967974, -1.239896, 0, 0, 0, 1, 1,
-1.046211, -0.7370965, -3.169334, 0, 0, 0, 1, 1,
-1.038917, -0.07640157, -1.831593, 0, 0, 0, 1, 1,
-1.038853, 1.59804, -1.7931, 0, 0, 0, 1, 1,
-1.038341, -0.8139456, -2.908884, 1, 1, 1, 1, 1,
-1.033796, 1.05893, -1.748814, 1, 1, 1, 1, 1,
-1.032676, 0.3797894, -0.4885097, 1, 1, 1, 1, 1,
-1.031502, 1.464758, -0.9022307, 1, 1, 1, 1, 1,
-1.031433, 1.481874, 0.1270242, 1, 1, 1, 1, 1,
-1.030362, -0.8598768, -0.2423168, 1, 1, 1, 1, 1,
-1.029814, 1.149609, 0.4054302, 1, 1, 1, 1, 1,
-1.029449, 0.5382549, 0.2353598, 1, 1, 1, 1, 1,
-1.027758, -0.4248633, -1.650458, 1, 1, 1, 1, 1,
-1.027384, 0.2586075, -0.6034724, 1, 1, 1, 1, 1,
-1.027126, -0.4584514, -1.274081, 1, 1, 1, 1, 1,
-1.026468, -1.462558, -2.976748, 1, 1, 1, 1, 1,
-1.024693, 1.32098, -0.03576328, 1, 1, 1, 1, 1,
-1.022764, 0.8966036, -0.7925467, 1, 1, 1, 1, 1,
-1.02092, 0.341896, -1.812407, 1, 1, 1, 1, 1,
-1.011145, 0.532679, -0.3137571, 0, 0, 1, 1, 1,
-1.011028, -1.069006, -1.863764, 1, 0, 0, 1, 1,
-1.010835, -1.427501, -4.405796, 1, 0, 0, 1, 1,
-1.008265, 0.3381922, -0.9076967, 1, 0, 0, 1, 1,
-1.008031, 1.238557, -3.044848, 1, 0, 0, 1, 1,
-1.007939, 0.1054602, -1.801751, 1, 0, 0, 1, 1,
-1.006276, -0.5720013, -2.911556, 0, 0, 0, 1, 1,
-1.000943, -0.06744854, -3.221946, 0, 0, 0, 1, 1,
-0.9911328, -1.762857, -2.210657, 0, 0, 0, 1, 1,
-0.9871773, -0.8247938, -1.394125, 0, 0, 0, 1, 1,
-0.9845349, 0.3391953, -0.5658627, 0, 0, 0, 1, 1,
-0.9840175, 1.284866, -0.01669443, 0, 0, 0, 1, 1,
-0.9826813, -0.4819971, -1.332748, 0, 0, 0, 1, 1,
-0.9822955, 0.01354692, -0.2080465, 1, 1, 1, 1, 1,
-0.9774859, -0.007385892, -1.904178, 1, 1, 1, 1, 1,
-0.976808, 2.304003, 0.7654833, 1, 1, 1, 1, 1,
-0.971752, 0.101095, -1.797376, 1, 1, 1, 1, 1,
-0.968474, -0.9244778, -2.708741, 1, 1, 1, 1, 1,
-0.9666253, 0.9192928, -0.440083, 1, 1, 1, 1, 1,
-0.9653944, -0.2179081, -1.984861, 1, 1, 1, 1, 1,
-0.9605911, -0.1074124, -3.860682, 1, 1, 1, 1, 1,
-0.9581352, 2.170825, -1.21402, 1, 1, 1, 1, 1,
-0.9580772, -0.636737, -3.699209, 1, 1, 1, 1, 1,
-0.9563004, -1.712235, -2.038106, 1, 1, 1, 1, 1,
-0.9293811, -0.1335883, -1.040247, 1, 1, 1, 1, 1,
-0.9271973, 0.1985765, -1.928721, 1, 1, 1, 1, 1,
-0.9266298, 0.7245432, -0.8320177, 1, 1, 1, 1, 1,
-0.9257671, -0.5028974, -2.203168, 1, 1, 1, 1, 1,
-0.9247905, 1.145158, -1.568536, 0, 0, 1, 1, 1,
-0.9237987, 1.39793, 0.2039097, 1, 0, 0, 1, 1,
-0.9187838, 0.2739793, -2.683673, 1, 0, 0, 1, 1,
-0.9146733, 0.4411948, -1.406227, 1, 0, 0, 1, 1,
-0.9145035, -2.789862, -3.136884, 1, 0, 0, 1, 1,
-0.9143575, -0.7422878, -0.1670569, 1, 0, 0, 1, 1,
-0.9125134, -0.235636, -2.514195, 0, 0, 0, 1, 1,
-0.907976, -0.1242766, -1.455367, 0, 0, 0, 1, 1,
-0.9014125, 0.9654314, -1.530615, 0, 0, 0, 1, 1,
-0.8898768, -0.1900626, -1.286475, 0, 0, 0, 1, 1,
-0.8887884, 0.02439685, -2.508229, 0, 0, 0, 1, 1,
-0.8883601, -1.084497, -3.975747, 0, 0, 0, 1, 1,
-0.8860172, -0.2327187, -1.964296, 0, 0, 0, 1, 1,
-0.8857527, -0.6399254, -2.790071, 1, 1, 1, 1, 1,
-0.8630657, 0.9792249, -0.09090818, 1, 1, 1, 1, 1,
-0.8624704, 1.11854, -0.629831, 1, 1, 1, 1, 1,
-0.8601071, 0.4284934, -0.9891465, 1, 1, 1, 1, 1,
-0.858077, 0.104141, -0.6968191, 1, 1, 1, 1, 1,
-0.8531705, -1.762139, -4.001365, 1, 1, 1, 1, 1,
-0.8491836, -0.8194481, -3.168104, 1, 1, 1, 1, 1,
-0.8387096, 1.406981, -3.116346, 1, 1, 1, 1, 1,
-0.8326662, -0.754309, -2.690753, 1, 1, 1, 1, 1,
-0.8324885, -0.8195401, -3.166324, 1, 1, 1, 1, 1,
-0.8266668, 0.2928184, -2.240875, 1, 1, 1, 1, 1,
-0.8246424, -0.3060399, -2.058349, 1, 1, 1, 1, 1,
-0.8217971, 2.074368, 1.926758, 1, 1, 1, 1, 1,
-0.8132041, -0.5459954, -1.595471, 1, 1, 1, 1, 1,
-0.8094926, -0.3823707, -2.167046, 1, 1, 1, 1, 1,
-0.7991029, -1.200415, -3.836229, 0, 0, 1, 1, 1,
-0.7947103, -0.7999664, -1.955372, 1, 0, 0, 1, 1,
-0.7930253, -0.9778464, -2.944763, 1, 0, 0, 1, 1,
-0.7863528, 1.61148, 0.3012871, 1, 0, 0, 1, 1,
-0.7820381, -0.1448345, -2.374296, 1, 0, 0, 1, 1,
-0.7759017, 0.8933257, -0.7043757, 1, 0, 0, 1, 1,
-0.7740518, -2.074167, -2.673174, 0, 0, 0, 1, 1,
-0.771928, 0.2428773, -1.97729, 0, 0, 0, 1, 1,
-0.7717788, -1.517496, -4.117756, 0, 0, 0, 1, 1,
-0.7686607, -0.4143353, -1.853957, 0, 0, 0, 1, 1,
-0.7646891, -2.005635, -2.10366, 0, 0, 0, 1, 1,
-0.7636095, 1.171486, -1.560164, 0, 0, 0, 1, 1,
-0.758382, -1.286127, -2.598814, 0, 0, 0, 1, 1,
-0.7541176, -1.645564, -1.868295, 1, 1, 1, 1, 1,
-0.7540629, 0.1789023, -1.590787, 1, 1, 1, 1, 1,
-0.7516128, -1.179167, -2.601883, 1, 1, 1, 1, 1,
-0.7500455, -1.054148, -2.788543, 1, 1, 1, 1, 1,
-0.7429067, -0.1503443, -1.999323, 1, 1, 1, 1, 1,
-0.7421917, -0.06202665, -1.562547, 1, 1, 1, 1, 1,
-0.7403955, -2.518663, -5.094286, 1, 1, 1, 1, 1,
-0.7396546, -0.625842, -2.042923, 1, 1, 1, 1, 1,
-0.7393682, -0.9175971, -4.20782, 1, 1, 1, 1, 1,
-0.7381092, 1.38514, 0.4006999, 1, 1, 1, 1, 1,
-0.7262588, -0.07620587, -1.825248, 1, 1, 1, 1, 1,
-0.7235831, 1.513225, 0.9901592, 1, 1, 1, 1, 1,
-0.7184168, -0.9479837, -0.9896949, 1, 1, 1, 1, 1,
-0.7138551, -0.8653949, -2.380639, 1, 1, 1, 1, 1,
-0.7130054, -0.7633983, -2.758029, 1, 1, 1, 1, 1,
-0.7092816, -0.3937718, 0.4254076, 0, 0, 1, 1, 1,
-0.7079799, -1.515852, -1.178441, 1, 0, 0, 1, 1,
-0.7055545, 0.5657207, -1.074528, 1, 0, 0, 1, 1,
-0.7009761, -0.2580279, -1.954486, 1, 0, 0, 1, 1,
-0.6996865, 2.894857, 1.247212, 1, 0, 0, 1, 1,
-0.6934762, -0.736505, -0.3477579, 1, 0, 0, 1, 1,
-0.6798263, 0.127479, -1.182984, 0, 0, 0, 1, 1,
-0.676158, 1.367934, -1.081205, 0, 0, 0, 1, 1,
-0.6680607, -1.504114, -2.123572, 0, 0, 0, 1, 1,
-0.667727, 0.8690465, -1.286944, 0, 0, 0, 1, 1,
-0.6674864, -0.477252, -2.821769, 0, 0, 0, 1, 1,
-0.6647183, 0.5116334, -2.469493, 0, 0, 0, 1, 1,
-0.6510764, -2.214747, -2.420081, 0, 0, 0, 1, 1,
-0.6456792, -0.1247391, -1.298834, 1, 1, 1, 1, 1,
-0.6452826, 0.3207737, -1.021232, 1, 1, 1, 1, 1,
-0.6425756, 1.177574, -2.863415, 1, 1, 1, 1, 1,
-0.6322068, 1.242125, -1.209073, 1, 1, 1, 1, 1,
-0.629384, -0.3308241, -3.502181, 1, 1, 1, 1, 1,
-0.6288128, -0.3450816, -0.04123617, 1, 1, 1, 1, 1,
-0.6214736, 1.090781, 0.2429923, 1, 1, 1, 1, 1,
-0.6203791, -1.047673, -2.529643, 1, 1, 1, 1, 1,
-0.6199697, 1.690661, -0.7927787, 1, 1, 1, 1, 1,
-0.6196705, 0.8426947, -1.21327, 1, 1, 1, 1, 1,
-0.619168, -0.02177702, -1.669693, 1, 1, 1, 1, 1,
-0.6190826, -0.1347656, -3.000329, 1, 1, 1, 1, 1,
-0.6172205, -0.3014227, -2.023291, 1, 1, 1, 1, 1,
-0.6169766, -0.3978057, -1.982943, 1, 1, 1, 1, 1,
-0.6151831, 1.386739, -2.809303, 1, 1, 1, 1, 1,
-0.6120235, 0.5001975, -0.7812725, 0, 0, 1, 1, 1,
-0.6111259, -0.7163482, -2.548736, 1, 0, 0, 1, 1,
-0.6087549, -0.4362668, -2.634087, 1, 0, 0, 1, 1,
-0.6082252, -0.3721901, -2.261685, 1, 0, 0, 1, 1,
-0.6008726, 0.7078653, 0.142159, 1, 0, 0, 1, 1,
-0.5995944, -0.4463315, -3.401277, 1, 0, 0, 1, 1,
-0.5983862, -0.5312696, -2.745731, 0, 0, 0, 1, 1,
-0.5920215, 0.5095893, -2.153955, 0, 0, 0, 1, 1,
-0.5906414, -0.2674178, -1.729851, 0, 0, 0, 1, 1,
-0.5884624, -0.9662836, -1.994923, 0, 0, 0, 1, 1,
-0.5876012, -0.116867, -1.635549, 0, 0, 0, 1, 1,
-0.5815653, 1.519659, 0.5200316, 0, 0, 0, 1, 1,
-0.5794164, 0.6983339, -2.336365, 0, 0, 0, 1, 1,
-0.5758283, 0.2099469, 0.08468299, 1, 1, 1, 1, 1,
-0.5654682, -0.07433437, 0.06668656, 1, 1, 1, 1, 1,
-0.5584607, 1.021477, 0.1091413, 1, 1, 1, 1, 1,
-0.5534105, 1.789033, -1.070596, 1, 1, 1, 1, 1,
-0.550602, 2.329168, 0.08538256, 1, 1, 1, 1, 1,
-0.550537, 1.286129, -0.253647, 1, 1, 1, 1, 1,
-0.5496448, -1.138394, -1.728868, 1, 1, 1, 1, 1,
-0.5463477, -0.4327433, -4.594776, 1, 1, 1, 1, 1,
-0.5427756, 0.1690049, 1.047303, 1, 1, 1, 1, 1,
-0.5400518, 0.7747741, 0.5594161, 1, 1, 1, 1, 1,
-0.5349714, 1.782021, 1.220424, 1, 1, 1, 1, 1,
-0.5304664, 1.123325, -0.1383868, 1, 1, 1, 1, 1,
-0.5301914, -0.1429414, -4.128438, 1, 1, 1, 1, 1,
-0.5293736, 0.06776719, -2.753851, 1, 1, 1, 1, 1,
-0.5260662, -0.1213424, -0.210811, 1, 1, 1, 1, 1,
-0.5260088, 1.493073, 1.442404, 0, 0, 1, 1, 1,
-0.5231237, 0.6138048, -1.985747, 1, 0, 0, 1, 1,
-0.5226724, -0.265514, -2.10132, 1, 0, 0, 1, 1,
-0.5223058, -1.320864, -1.565189, 1, 0, 0, 1, 1,
-0.5167274, 1.153435, 0.355979, 1, 0, 0, 1, 1,
-0.5133554, 0.8058919, 0.4880772, 1, 0, 0, 1, 1,
-0.5128305, -1.394173, -1.235734, 0, 0, 0, 1, 1,
-0.5088366, 0.505161, -1.12483, 0, 0, 0, 1, 1,
-0.5072277, 1.458991, -0.3411497, 0, 0, 0, 1, 1,
-0.5048321, -1.44149, -4.188845, 0, 0, 0, 1, 1,
-0.5039868, 1.95341, -2.068425, 0, 0, 0, 1, 1,
-0.5029012, 0.7997344, 1.164238, 0, 0, 0, 1, 1,
-0.4985599, -2.099718, -4.512748, 0, 0, 0, 1, 1,
-0.4966992, 0.9249861, -0.4720742, 1, 1, 1, 1, 1,
-0.4958003, 0.7281572, 1.422907, 1, 1, 1, 1, 1,
-0.4939112, -1.697981, -2.898698, 1, 1, 1, 1, 1,
-0.4934019, -0.08943433, -2.107247, 1, 1, 1, 1, 1,
-0.4909091, -0.5939597, -2.277469, 1, 1, 1, 1, 1,
-0.488719, -0.8776051, -1.888659, 1, 1, 1, 1, 1,
-0.4877424, -1.434045, -2.918938, 1, 1, 1, 1, 1,
-0.4871999, 0.5678802, 0.1443996, 1, 1, 1, 1, 1,
-0.4835104, 1.033802, 0.6550285, 1, 1, 1, 1, 1,
-0.4825169, -0.8097895, -2.839738, 1, 1, 1, 1, 1,
-0.4804619, 0.7584782, 1.703818, 1, 1, 1, 1, 1,
-0.4799051, 0.09501507, -1.578074, 1, 1, 1, 1, 1,
-0.4778675, -1.28779, -3.712615, 1, 1, 1, 1, 1,
-0.4771941, 0.9333414, -0.1641711, 1, 1, 1, 1, 1,
-0.4761906, 1.889104, -0.2110361, 1, 1, 1, 1, 1,
-0.4760187, -1.64281, -4.71892, 0, 0, 1, 1, 1,
-0.4716459, -0.2562016, -3.055313, 1, 0, 0, 1, 1,
-0.4642769, -0.5040075, -1.983624, 1, 0, 0, 1, 1,
-0.461949, 1.479375, -1.603276, 1, 0, 0, 1, 1,
-0.4604863, 1.578168, -1.68136, 1, 0, 0, 1, 1,
-0.4603847, 0.2036616, 0.5162854, 1, 0, 0, 1, 1,
-0.4599108, -0.3967932, -2.012269, 0, 0, 0, 1, 1,
-0.4598002, -0.05030954, -1.318812, 0, 0, 0, 1, 1,
-0.4565082, -1.666718, -4.316683, 0, 0, 0, 1, 1,
-0.4556684, 0.5250422, 0.2394887, 0, 0, 0, 1, 1,
-0.4546925, -0.6388665, -2.867665, 0, 0, 0, 1, 1,
-0.4538113, -1.425496, -3.314991, 0, 0, 0, 1, 1,
-0.4512556, 0.3046893, 1.269149, 0, 0, 0, 1, 1,
-0.4483042, -0.2897939, -2.51911, 1, 1, 1, 1, 1,
-0.4463088, 1.524457, -0.6375821, 1, 1, 1, 1, 1,
-0.4432466, -0.187393, -1.483558, 1, 1, 1, 1, 1,
-0.4389012, -0.9960296, -1.436447, 1, 1, 1, 1, 1,
-0.4379686, 0.5624876, -1.647904, 1, 1, 1, 1, 1,
-0.43224, 0.9065979, -0.9364793, 1, 1, 1, 1, 1,
-0.4269719, 0.6866606, 0.1368131, 1, 1, 1, 1, 1,
-0.4257607, -0.5897878, -2.716537, 1, 1, 1, 1, 1,
-0.425083, 0.02802163, -1.861394, 1, 1, 1, 1, 1,
-0.4230782, -1.814961, -4.800315, 1, 1, 1, 1, 1,
-0.419482, -0.05006596, -2.671674, 1, 1, 1, 1, 1,
-0.418969, 0.4140582, -1.438967, 1, 1, 1, 1, 1,
-0.413162, 0.8442318, -0.03532137, 1, 1, 1, 1, 1,
-0.4116387, -0.1259602, -1.845498, 1, 1, 1, 1, 1,
-0.4052045, -1.440343, -4.178733, 1, 1, 1, 1, 1,
-0.4046493, 0.9347192, -1.359484, 0, 0, 1, 1, 1,
-0.4027561, 1.479775, 0.2316805, 1, 0, 0, 1, 1,
-0.401198, 1.675768, -0.04231513, 1, 0, 0, 1, 1,
-0.4008685, 0.918439, -1.064703, 1, 0, 0, 1, 1,
-0.3990051, -1.527363, -3.144972, 1, 0, 0, 1, 1,
-0.3976682, -0.162345, -2.007223, 1, 0, 0, 1, 1,
-0.3972687, -1.282661, -1.854762, 0, 0, 0, 1, 1,
-0.3939285, 0.750869, 0.4694392, 0, 0, 0, 1, 1,
-0.393914, -0.7820524, -3.410896, 0, 0, 0, 1, 1,
-0.3929989, 0.3581174, -2.284733, 0, 0, 0, 1, 1,
-0.3916836, 0.1452294, 0.6382707, 0, 0, 0, 1, 1,
-0.3838141, -1.184087, -2.698019, 0, 0, 0, 1, 1,
-0.3831663, -0.5628958, -3.135429, 0, 0, 0, 1, 1,
-0.3829223, 1.550508, -0.8675173, 1, 1, 1, 1, 1,
-0.3794351, -1.167745, -2.303368, 1, 1, 1, 1, 1,
-0.3757583, -2.391396, -2.014421, 1, 1, 1, 1, 1,
-0.3748832, -0.03784744, -2.232287, 1, 1, 1, 1, 1,
-0.37376, 2.151276, 0.6438708, 1, 1, 1, 1, 1,
-0.3676787, -0.1698851, -2.923666, 1, 1, 1, 1, 1,
-0.3662596, 0.9774906, -0.02975734, 1, 1, 1, 1, 1,
-0.3657229, 1.009421, -0.7244499, 1, 1, 1, 1, 1,
-0.3655471, -0.1936745, -1.789387, 1, 1, 1, 1, 1,
-0.3622631, -1.343456, -0.794023, 1, 1, 1, 1, 1,
-0.3596752, 0.9079673, -2.071112, 1, 1, 1, 1, 1,
-0.349678, -1.03954, -3.141897, 1, 1, 1, 1, 1,
-0.3490747, -0.410609, -3.594094, 1, 1, 1, 1, 1,
-0.3414676, 1.083318, 0.3958209, 1, 1, 1, 1, 1,
-0.3405482, -0.3765053, -4.264938, 1, 1, 1, 1, 1,
-0.3399287, -0.8887892, -3.525811, 0, 0, 1, 1, 1,
-0.3387753, -0.5493805, -3.686649, 1, 0, 0, 1, 1,
-0.3380668, -1.098925, -3.343643, 1, 0, 0, 1, 1,
-0.3343579, -0.272793, -3.42366, 1, 0, 0, 1, 1,
-0.3315161, -1.456697, -2.687268, 1, 0, 0, 1, 1,
-0.3275203, -1.432542, -2.573047, 1, 0, 0, 1, 1,
-0.3203057, 1.570234, 0.1527276, 0, 0, 0, 1, 1,
-0.3193776, -0.2126699, -1.568487, 0, 0, 0, 1, 1,
-0.318822, -1.131551, -3.651484, 0, 0, 0, 1, 1,
-0.3183114, -0.2352355, -1.256969, 0, 0, 0, 1, 1,
-0.3163254, 0.5604141, 0.2793286, 0, 0, 0, 1, 1,
-0.3122017, 0.9411415, 0.006321745, 0, 0, 0, 1, 1,
-0.3117854, -1.996661, -1.648799, 0, 0, 0, 1, 1,
-0.3081486, 1.527577, -1.102495, 1, 1, 1, 1, 1,
-0.3065241, -0.3919471, -0.5863583, 1, 1, 1, 1, 1,
-0.2983852, -0.2364498, -4.498917, 1, 1, 1, 1, 1,
-0.2921794, 0.7638919, 0.5471062, 1, 1, 1, 1, 1,
-0.2899901, 0.3004868, -0.7528248, 1, 1, 1, 1, 1,
-0.2894149, -0.8138934, -3.103863, 1, 1, 1, 1, 1,
-0.28333, -0.4236883, -1.98436, 1, 1, 1, 1, 1,
-0.2808768, -0.1893497, -2.227895, 1, 1, 1, 1, 1,
-0.276782, -0.7944043, -3.973952, 1, 1, 1, 1, 1,
-0.2763909, 0.1660259, -2.27371, 1, 1, 1, 1, 1,
-0.2746121, -0.8887662, -3.040543, 1, 1, 1, 1, 1,
-0.2740582, 0.6509296, -0.9668078, 1, 1, 1, 1, 1,
-0.27114, -0.8814368, -2.93417, 1, 1, 1, 1, 1,
-0.2684428, -0.9638055, -3.131055, 1, 1, 1, 1, 1,
-0.2679223, 0.08165392, -1.514443, 1, 1, 1, 1, 1,
-0.2644624, 0.1899893, 0.3378133, 0, 0, 1, 1, 1,
-0.2643759, -0.01118287, -2.812128, 1, 0, 0, 1, 1,
-0.2626802, 0.1542386, -2.235307, 1, 0, 0, 1, 1,
-0.2586262, 0.2745582, -2.096415, 1, 0, 0, 1, 1,
-0.2581014, 1.174971, -1.459692, 1, 0, 0, 1, 1,
-0.248518, -0.1471101, -3.226251, 1, 0, 0, 1, 1,
-0.2457352, 1.39191, -1.299429, 0, 0, 0, 1, 1,
-0.2427634, -0.580918, -1.057603, 0, 0, 0, 1, 1,
-0.2416837, -1.646773, -1.484399, 0, 0, 0, 1, 1,
-0.24006, 0.2016146, -2.292264, 0, 0, 0, 1, 1,
-0.2375849, 0.5051473, -1.520177, 0, 0, 0, 1, 1,
-0.2374146, -0.9795506, -3.258938, 0, 0, 0, 1, 1,
-0.2372893, 0.8304912, -1.097109, 0, 0, 0, 1, 1,
-0.2371053, -1.238948, -1.459479, 1, 1, 1, 1, 1,
-0.2369408, -2.048099, -4.127593, 1, 1, 1, 1, 1,
-0.2367659, -0.7880787, -1.865521, 1, 1, 1, 1, 1,
-0.2358206, -0.758657, -3.541925, 1, 1, 1, 1, 1,
-0.2333521, -1.363433, -3.115831, 1, 1, 1, 1, 1,
-0.230848, 0.1628168, -0.1701228, 1, 1, 1, 1, 1,
-0.2290309, 1.314759, -0.1185003, 1, 1, 1, 1, 1,
-0.2259363, 0.4863417, 0.1003345, 1, 1, 1, 1, 1,
-0.2242613, -0.5032772, -1.676028, 1, 1, 1, 1, 1,
-0.224065, 0.1859096, -0.9276978, 1, 1, 1, 1, 1,
-0.2227263, -0.0208488, -1.428219, 1, 1, 1, 1, 1,
-0.2222127, -0.2421138, -0.8006533, 1, 1, 1, 1, 1,
-0.2186639, -1.408441, -3.365811, 1, 1, 1, 1, 1,
-0.2155468, -0.6552173, -4.616546, 1, 1, 1, 1, 1,
-0.212336, 1.202979, -0.4842403, 1, 1, 1, 1, 1,
-0.2049677, 0.3994977, -0.9578944, 0, 0, 1, 1, 1,
-0.202044, 0.2798439, 0.1705333, 1, 0, 0, 1, 1,
-0.2012718, 0.1183302, -0.4361531, 1, 0, 0, 1, 1,
-0.1976696, -0.3834524, -3.11502, 1, 0, 0, 1, 1,
-0.195189, 0.1603856, -1.053782, 1, 0, 0, 1, 1,
-0.1935648, 1.019454, 2.52237, 1, 0, 0, 1, 1,
-0.1930283, 0.3010068, -1.957348, 0, 0, 0, 1, 1,
-0.1924573, -1.04435, -2.163667, 0, 0, 0, 1, 1,
-0.189656, -1.173644, -3.994987, 0, 0, 0, 1, 1,
-0.1880954, -0.8965986, -4.148346, 0, 0, 0, 1, 1,
-0.1822951, -2.308441, -3.469807, 0, 0, 0, 1, 1,
-0.1813129, 0.1713468, -0.181649, 0, 0, 0, 1, 1,
-0.180887, 0.2184133, 1.202695, 0, 0, 0, 1, 1,
-0.1772495, -1.395277, -2.627758, 1, 1, 1, 1, 1,
-0.1739967, -0.6478202, -2.425689, 1, 1, 1, 1, 1,
-0.1715387, 0.7676563, -0.1684457, 1, 1, 1, 1, 1,
-0.1704718, -0.3094313, -3.658104, 1, 1, 1, 1, 1,
-0.1698937, 0.2734104, -0.709757, 1, 1, 1, 1, 1,
-0.1668483, -0.8753285, -3.103431, 1, 1, 1, 1, 1,
-0.1667915, -0.3868832, -2.456083, 1, 1, 1, 1, 1,
-0.1666856, 0.8860227, -0.5289606, 1, 1, 1, 1, 1,
-0.1661654, 0.597042, -0.9065573, 1, 1, 1, 1, 1,
-0.1635838, -1.407441, -5.150448, 1, 1, 1, 1, 1,
-0.1621607, -1.19571, -2.709908, 1, 1, 1, 1, 1,
-0.1620424, -0.7503008, -2.693654, 1, 1, 1, 1, 1,
-0.157496, -1.247043, -2.955625, 1, 1, 1, 1, 1,
-0.1523234, -0.6374, -3.445992, 1, 1, 1, 1, 1,
-0.1512314, -0.9702922, -1.463225, 1, 1, 1, 1, 1,
-0.1464027, -0.5197071, -3.923133, 0, 0, 1, 1, 1,
-0.1418986, -0.2098032, -2.169132, 1, 0, 0, 1, 1,
-0.1405405, -1.344663, -2.626449, 1, 0, 0, 1, 1,
-0.1348249, -0.7981065, -2.8781, 1, 0, 0, 1, 1,
-0.1325889, -0.7277756, -2.717881, 1, 0, 0, 1, 1,
-0.1289412, 1.174861, 1.018574, 1, 0, 0, 1, 1,
-0.1284885, -1.505541, -3.28305, 0, 0, 0, 1, 1,
-0.1270837, -0.2933408, -2.069468, 0, 0, 0, 1, 1,
-0.1183098, 1.291201, -1.46899, 0, 0, 0, 1, 1,
-0.1139788, -0.1775961, -2.955477, 0, 0, 0, 1, 1,
-0.1137711, 0.9144276, -1.926915, 0, 0, 0, 1, 1,
-0.1128058, -0.5015391, -3.314983, 0, 0, 0, 1, 1,
-0.1105514, -0.9645147, -3.485779, 0, 0, 0, 1, 1,
-0.1075708, 0.3327994, 0.4511318, 1, 1, 1, 1, 1,
-0.1030849, -0.7670336, -1.645629, 1, 1, 1, 1, 1,
-0.1029322, -0.2533199, -2.84794, 1, 1, 1, 1, 1,
-0.1026246, 0.8564906, 0.508899, 1, 1, 1, 1, 1,
-0.1019028, 1.171388, 0.6604497, 1, 1, 1, 1, 1,
-0.1008351, 0.08584693, -2.173152, 1, 1, 1, 1, 1,
-0.09470842, -0.123902, -3.518497, 1, 1, 1, 1, 1,
-0.09411207, -1.280169, -2.68249, 1, 1, 1, 1, 1,
-0.09374277, 0.07259131, -0.8974923, 1, 1, 1, 1, 1,
-0.09267397, 0.4216731, 0.5172037, 1, 1, 1, 1, 1,
-0.09110054, -0.9143076, -1.970811, 1, 1, 1, 1, 1,
-0.08694065, 0.5737948, -0.9661282, 1, 1, 1, 1, 1,
-0.08237012, -0.1250407, -3.576261, 1, 1, 1, 1, 1,
-0.08154201, -0.252685, -3.503024, 1, 1, 1, 1, 1,
-0.08075101, -1.161748, -1.465756, 1, 1, 1, 1, 1,
-0.0807349, -0.2190598, -4.890116, 0, 0, 1, 1, 1,
-0.07962872, 0.5076483, -0.1318327, 1, 0, 0, 1, 1,
-0.07617167, 0.2709751, 0.7394832, 1, 0, 0, 1, 1,
-0.0708904, -1.173117, -1.843553, 1, 0, 0, 1, 1,
-0.06792077, -0.2904677, -3.79286, 1, 0, 0, 1, 1,
-0.06137675, 0.04068325, -0.5439275, 1, 0, 0, 1, 1,
-0.06127255, 0.4534707, 0.2436283, 0, 0, 0, 1, 1,
-0.05484896, 0.3869233, 0.8869958, 0, 0, 0, 1, 1,
-0.04898122, -1.421146, -3.436273, 0, 0, 0, 1, 1,
-0.0487915, 1.311483, -1.191668, 0, 0, 0, 1, 1,
-0.04817661, 0.03609664, -0.009164494, 0, 0, 0, 1, 1,
-0.04786438, 1.428765, 1.694392, 0, 0, 0, 1, 1,
-0.04604264, 0.7395198, 0.483988, 0, 0, 0, 1, 1,
-0.04000168, 0.5672554, 0.7347462, 1, 1, 1, 1, 1,
-0.03704765, -0.6071447, -2.626343, 1, 1, 1, 1, 1,
-0.03559682, 1.184529, 0.5537047, 1, 1, 1, 1, 1,
-0.03233629, -0.7458128, -2.291258, 1, 1, 1, 1, 1,
-0.03019136, 1.156713, 2.508523, 1, 1, 1, 1, 1,
-0.02856369, -0.3343246, -5.254248, 1, 1, 1, 1, 1,
-0.02187979, 0.1515789, -1.308773, 1, 1, 1, 1, 1,
-0.01940521, 0.2524543, 0.4439941, 1, 1, 1, 1, 1,
-0.01916685, 1.983313, -0.3276667, 1, 1, 1, 1, 1,
-0.01784155, -0.6569889, -2.679577, 1, 1, 1, 1, 1,
-0.01685773, -1.565044, -3.758677, 1, 1, 1, 1, 1,
-0.01606992, 0.5271597, -0.8825706, 1, 1, 1, 1, 1,
-0.01181489, 0.2914703, -0.8834551, 1, 1, 1, 1, 1,
-0.01028545, -0.6387831, -2.573108, 1, 1, 1, 1, 1,
-0.009401265, 0.3521234, -1.036546, 1, 1, 1, 1, 1,
-0.007799004, -0.4294696, -2.039595, 0, 0, 1, 1, 1,
-0.005924793, 0.7055424, 2.823761, 1, 0, 0, 1, 1,
-0.004387833, -0.289386, -0.5641309, 1, 0, 0, 1, 1,
0.002124582, 0.1664872, -0.4492677, 1, 0, 0, 1, 1,
0.006008383, -1.141831, 4.39993, 1, 0, 0, 1, 1,
0.007453474, -0.126021, 4.1414, 1, 0, 0, 1, 1,
0.008178629, -0.1906966, 3.351995, 0, 0, 0, 1, 1,
0.01032369, -0.08568045, 1.625926, 0, 0, 0, 1, 1,
0.01361747, 0.8207285, 0.4011081, 0, 0, 0, 1, 1,
0.01972156, 1.58557, 0.2750151, 0, 0, 0, 1, 1,
0.02032978, -0.1364659, 4.39078, 0, 0, 0, 1, 1,
0.02165764, 1.728438, -0.07741506, 0, 0, 0, 1, 1,
0.02391811, -0.0977513, 2.812221, 0, 0, 0, 1, 1,
0.02745011, -1.789409, 3.553635, 1, 1, 1, 1, 1,
0.03173954, -1.096446, 2.696831, 1, 1, 1, 1, 1,
0.03179456, 0.7963392, -1.240002, 1, 1, 1, 1, 1,
0.03521625, 1.994898, 0.7520316, 1, 1, 1, 1, 1,
0.04767242, 0.008125219, 1.93444, 1, 1, 1, 1, 1,
0.05277358, 1.080844, 0.4129758, 1, 1, 1, 1, 1,
0.05425894, 0.490833, 0.255239, 1, 1, 1, 1, 1,
0.05562615, 0.3052752, 0.8461085, 1, 1, 1, 1, 1,
0.05624637, 2.452965, 0.05853195, 1, 1, 1, 1, 1,
0.05739765, -1.328748, 2.90148, 1, 1, 1, 1, 1,
0.06091394, -1.058267, 3.976486, 1, 1, 1, 1, 1,
0.06101222, -1.862054, 2.648122, 1, 1, 1, 1, 1,
0.06596749, -2.587515, 3.441905, 1, 1, 1, 1, 1,
0.06879784, 2.242404, -1.149119, 1, 1, 1, 1, 1,
0.0724837, 0.09850761, 0.5902686, 1, 1, 1, 1, 1,
0.07274865, 0.1814144, 0.8669647, 0, 0, 1, 1, 1,
0.07388803, 1.198735, -2.419361, 1, 0, 0, 1, 1,
0.07434569, 1.858296, -1.10099, 1, 0, 0, 1, 1,
0.07824259, 0.9474736, 0.103077, 1, 0, 0, 1, 1,
0.0944319, -0.444669, 5.627603, 1, 0, 0, 1, 1,
0.09580972, 0.7871724, 1.547837, 1, 0, 0, 1, 1,
0.0969658, -0.9060341, 0.4714816, 0, 0, 0, 1, 1,
0.09720947, 0.05715376, 1.396101, 0, 0, 0, 1, 1,
0.09835064, -0.6906833, 2.782528, 0, 0, 0, 1, 1,
0.09919022, -0.8095683, 3.8332, 0, 0, 0, 1, 1,
0.1005263, 0.6174152, -2.590602, 0, 0, 0, 1, 1,
0.103265, 0.1692808, 0.6577814, 0, 0, 0, 1, 1,
0.1062544, -0.4252663, 2.843581, 0, 0, 0, 1, 1,
0.1066811, 0.7631688, -0.853269, 1, 1, 1, 1, 1,
0.1111029, -0.6844423, 1.641021, 1, 1, 1, 1, 1,
0.112527, -0.5017181, 2.718675, 1, 1, 1, 1, 1,
0.1139612, -1.282181, 2.508364, 1, 1, 1, 1, 1,
0.1148153, -0.3121303, 1.553316, 1, 1, 1, 1, 1,
0.1190271, -1.77905, 0.3691899, 1, 1, 1, 1, 1,
0.1195991, -1.516799, 3.14677, 1, 1, 1, 1, 1,
0.1201122, -1.351044, 2.922617, 1, 1, 1, 1, 1,
0.1214845, 0.6051853, 1.21818, 1, 1, 1, 1, 1,
0.1262005, 0.5637727, 0.1787324, 1, 1, 1, 1, 1,
0.1286307, -0.08127663, 1.575655, 1, 1, 1, 1, 1,
0.1317144, 0.2817854, 0.4519401, 1, 1, 1, 1, 1,
0.1317879, -0.7079094, 2.222492, 1, 1, 1, 1, 1,
0.1322627, 0.547901, 1.529688, 1, 1, 1, 1, 1,
0.1353293, -1.334812, 3.528867, 1, 1, 1, 1, 1,
0.1354439, 0.1412379, 0.7655169, 0, 0, 1, 1, 1,
0.1366764, -0.4572509, 4.251457, 1, 0, 0, 1, 1,
0.1373721, -1.482346, 3.228446, 1, 0, 0, 1, 1,
0.1378721, -0.3831932, 3.18382, 1, 0, 0, 1, 1,
0.1418601, 1.359523, 0.2355279, 1, 0, 0, 1, 1,
0.1457584, 0.5215189, -0.6823089, 1, 0, 0, 1, 1,
0.1467564, 1.088137, -0.126914, 0, 0, 0, 1, 1,
0.1523983, -0.2628769, 1.466037, 0, 0, 0, 1, 1,
0.1556149, 1.182828, -1.175554, 0, 0, 0, 1, 1,
0.1574933, 0.7292382, -0.8297445, 0, 0, 0, 1, 1,
0.1575132, -1.084187, 2.891989, 0, 0, 0, 1, 1,
0.1595504, -0.08375532, 1.538572, 0, 0, 0, 1, 1,
0.1598798, 0.6125679, 0.01514846, 0, 0, 0, 1, 1,
0.1625515, 0.3922533, -0.343139, 1, 1, 1, 1, 1,
0.1743448, -1.398458, 2.867729, 1, 1, 1, 1, 1,
0.1753896, -1.78317, 4.421814, 1, 1, 1, 1, 1,
0.1824213, 0.09013265, 0.6457845, 1, 1, 1, 1, 1,
0.1831142, 0.2461737, -0.6996288, 1, 1, 1, 1, 1,
0.184258, 0.9943013, -1.006564, 1, 1, 1, 1, 1,
0.1907696, -0.6984162, 2.28671, 1, 1, 1, 1, 1,
0.20294, -1.204151, 4.949497, 1, 1, 1, 1, 1,
0.2038579, 1.757308, -0.08788183, 1, 1, 1, 1, 1,
0.2057888, 0.3838954, 1.480874, 1, 1, 1, 1, 1,
0.2084865, -0.03020235, 1.500927, 1, 1, 1, 1, 1,
0.2087659, 1.103792, 0.4734027, 1, 1, 1, 1, 1,
0.2139343, -0.9897943, 2.887823, 1, 1, 1, 1, 1,
0.2149031, -2.024008, 2.735618, 1, 1, 1, 1, 1,
0.215397, -1.030387, 5.636708, 1, 1, 1, 1, 1,
0.2169652, -1.254599, 3.663527, 0, 0, 1, 1, 1,
0.2183772, -0.6084285, 3.516431, 1, 0, 0, 1, 1,
0.2200105, -1.6205, 3.215013, 1, 0, 0, 1, 1,
0.2208852, 1.584701, -0.3624329, 1, 0, 0, 1, 1,
0.2246762, 2.420147, 0.1279213, 1, 0, 0, 1, 1,
0.228571, -0.5271953, 3.260094, 1, 0, 0, 1, 1,
0.2299318, 2.016922, 1.290602, 0, 0, 0, 1, 1,
0.2336001, 0.3280241, 1.10516, 0, 0, 0, 1, 1,
0.2381566, -1.136446, 2.975852, 0, 0, 0, 1, 1,
0.2382941, -0.6164185, 2.243668, 0, 0, 0, 1, 1,
0.2413508, -0.1676991, 0.8342158, 0, 0, 0, 1, 1,
0.2420168, -0.7304566, 3.079154, 0, 0, 0, 1, 1,
0.2444685, -0.2022911, 3.940403, 0, 0, 0, 1, 1,
0.2446643, -0.4735776, 2.682777, 1, 1, 1, 1, 1,
0.2464335, -0.2733453, 0.7560185, 1, 1, 1, 1, 1,
0.2475429, 0.544963, 1.802055, 1, 1, 1, 1, 1,
0.249495, -0.3702253, 3.203385, 1, 1, 1, 1, 1,
0.249964, -0.2249659, 1.426219, 1, 1, 1, 1, 1,
0.2503611, 1.633485, 0.1972498, 1, 1, 1, 1, 1,
0.2572211, 0.9095026, 0.2313281, 1, 1, 1, 1, 1,
0.2622024, -0.2480925, 2.462671, 1, 1, 1, 1, 1,
0.2634004, -0.814616, 1.978894, 1, 1, 1, 1, 1,
0.2652137, -0.2216326, 2.678295, 1, 1, 1, 1, 1,
0.26542, 1.063376, 0.3896339, 1, 1, 1, 1, 1,
0.2759858, -0.3178312, 2.228532, 1, 1, 1, 1, 1,
0.2760862, -0.3746476, 0.7456382, 1, 1, 1, 1, 1,
0.2780946, -0.5764709, 3.223785, 1, 1, 1, 1, 1,
0.2788524, -0.8243095, 2.710565, 1, 1, 1, 1, 1,
0.2843826, -1.277751, 3.467889, 0, 0, 1, 1, 1,
0.2937548, -1.521483, 3.128714, 1, 0, 0, 1, 1,
0.2955989, 0.1474901, 0.3665251, 1, 0, 0, 1, 1,
0.2983396, -0.3537482, 0.6709795, 1, 0, 0, 1, 1,
0.2995591, 1.3641, -0.04255158, 1, 0, 0, 1, 1,
0.3023213, -0.2814361, 2.986778, 1, 0, 0, 1, 1,
0.3052359, 0.3452352, 1.966978, 0, 0, 0, 1, 1,
0.3079915, -0.3613609, 2.634905, 0, 0, 0, 1, 1,
0.3220319, -0.7153436, 2.319527, 0, 0, 0, 1, 1,
0.3243268, -0.291466, 1.525845, 0, 0, 0, 1, 1,
0.3254583, 0.2307346, 1.623529, 0, 0, 0, 1, 1,
0.3255903, -0.9572734, 1.864432, 0, 0, 0, 1, 1,
0.3257969, -1.749633, 2.746375, 0, 0, 0, 1, 1,
0.3293522, -0.6250524, 2.226201, 1, 1, 1, 1, 1,
0.3298344, -0.3345971, 1.602076, 1, 1, 1, 1, 1,
0.3338485, 0.9228317, -1.516911, 1, 1, 1, 1, 1,
0.3341242, -0.3570974, 3.251871, 1, 1, 1, 1, 1,
0.3440964, -0.3977334, 4.432076, 1, 1, 1, 1, 1,
0.3443315, -0.263002, 2.886779, 1, 1, 1, 1, 1,
0.3517761, -1.48021, 3.328579, 1, 1, 1, 1, 1,
0.3525324, -0.7257515, 5.949864, 1, 1, 1, 1, 1,
0.3566148, 1.071023, 1.291573, 1, 1, 1, 1, 1,
0.3598051, 0.1453184, 1.672779, 1, 1, 1, 1, 1,
0.3630856, -1.793779, 3.643093, 1, 1, 1, 1, 1,
0.3646918, -0.2871516, 3.445503, 1, 1, 1, 1, 1,
0.3651523, 0.6927171, 2.255986, 1, 1, 1, 1, 1,
0.3702839, -1.070703, 4.124568, 1, 1, 1, 1, 1,
0.3763843, -0.02289673, 0.4999716, 1, 1, 1, 1, 1,
0.3822381, 1.520682, 0.2561885, 0, 0, 1, 1, 1,
0.3830124, -1.311499, 3.166058, 1, 0, 0, 1, 1,
0.3833891, 0.4720063, -0.481626, 1, 0, 0, 1, 1,
0.3834612, 1.246252, 0.08646687, 1, 0, 0, 1, 1,
0.3875848, 0.1268205, 1.073877, 1, 0, 0, 1, 1,
0.3934442, 0.2043001, 0.3805328, 1, 0, 0, 1, 1,
0.3955456, -0.3186095, 2.366798, 0, 0, 0, 1, 1,
0.4027154, -1.523791, 3.070809, 0, 0, 0, 1, 1,
0.4084409, 0.548656, 1.402499, 0, 0, 0, 1, 1,
0.4103905, 0.3664429, 0.8411947, 0, 0, 0, 1, 1,
0.4115318, -0.6903543, 2.366895, 0, 0, 0, 1, 1,
0.4151029, 0.5730414, 0.3262265, 0, 0, 0, 1, 1,
0.4166308, -0.6260619, 1.727702, 0, 0, 0, 1, 1,
0.4183587, -0.9838906, 2.752727, 1, 1, 1, 1, 1,
0.4213919, 0.6700577, -0.46935, 1, 1, 1, 1, 1,
0.4215814, -0.5840985, 2.347947, 1, 1, 1, 1, 1,
0.422955, 1.141586, -1.321602, 1, 1, 1, 1, 1,
0.430491, 0.7881096, 0.6929501, 1, 1, 1, 1, 1,
0.4311725, 2.679944, 0.3474315, 1, 1, 1, 1, 1,
0.4329392, 0.2671706, 2.996036, 1, 1, 1, 1, 1,
0.4369156, -1.391953, 4.274134, 1, 1, 1, 1, 1,
0.4373126, -1.05424, 2.349129, 1, 1, 1, 1, 1,
0.4373394, 1.283139, -0.7744129, 1, 1, 1, 1, 1,
0.4384962, 0.1246418, 2.73568, 1, 1, 1, 1, 1,
0.4390315, 0.8869469, 0.8242304, 1, 1, 1, 1, 1,
0.4403098, 0.7179287, 1.277718, 1, 1, 1, 1, 1,
0.448374, -1.19805, 2.439276, 1, 1, 1, 1, 1,
0.454433, 0.6933458, 1.622045, 1, 1, 1, 1, 1,
0.4562088, 0.2707852, 1.166098, 0, 0, 1, 1, 1,
0.4563929, -0.975538, 2.266944, 1, 0, 0, 1, 1,
0.4575182, -1.165636, 1.279111, 1, 0, 0, 1, 1,
0.4635994, 0.8881811, -1.061922, 1, 0, 0, 1, 1,
0.4653479, -0.06728666, 1.178531, 1, 0, 0, 1, 1,
0.4673336, 0.3147409, -0.02183761, 1, 0, 0, 1, 1,
0.4693257, -0.4770086, 3.3979, 0, 0, 0, 1, 1,
0.4696278, -0.5904325, 2.66088, 0, 0, 0, 1, 1,
0.4718538, 0.2387663, 0.266418, 0, 0, 0, 1, 1,
0.4729534, -0.1109666, 3.173874, 0, 0, 0, 1, 1,
0.4792976, -0.4048726, 2.041075, 0, 0, 0, 1, 1,
0.4805067, -0.6891592, 4.555058, 0, 0, 0, 1, 1,
0.4818501, -1.806793, 2.542955, 0, 0, 0, 1, 1,
0.4839889, 0.2693604, 0.5868798, 1, 1, 1, 1, 1,
0.4864019, -0.599947, 2.360101, 1, 1, 1, 1, 1,
0.4867246, 0.9173017, 0.9004526, 1, 1, 1, 1, 1,
0.4879973, -1.280742, 3.199701, 1, 1, 1, 1, 1,
0.4991173, 1.059009, 1.744015, 1, 1, 1, 1, 1,
0.5009158, 1.406031, -0.07796405, 1, 1, 1, 1, 1,
0.501412, -1.100062, 4.22614, 1, 1, 1, 1, 1,
0.5082848, 0.8452252, -0.7861288, 1, 1, 1, 1, 1,
0.5092935, -0.5369254, 1.278937, 1, 1, 1, 1, 1,
0.5096235, 0.2679534, 2.067687, 1, 1, 1, 1, 1,
0.5103198, -0.15793, 2.634508, 1, 1, 1, 1, 1,
0.5143679, 2.496251, -0.420142, 1, 1, 1, 1, 1,
0.5174254, 1.700754, 1.997027, 1, 1, 1, 1, 1,
0.5189421, 0.9297001, 0.8646144, 1, 1, 1, 1, 1,
0.5223851, -0.1066114, 1.455959, 1, 1, 1, 1, 1,
0.5246701, -0.1032094, 1.195202, 0, 0, 1, 1, 1,
0.5321419, -0.9109408, 2.801324, 1, 0, 0, 1, 1,
0.5321924, 1.194741, -0.7790068, 1, 0, 0, 1, 1,
0.5327068, -0.1330884, 1.202074, 1, 0, 0, 1, 1,
0.5414039, 1.200732, -1.038431, 1, 0, 0, 1, 1,
0.5449321, 0.5917047, 1.392614, 1, 0, 0, 1, 1,
0.546257, -0.5804036, 3.883194, 0, 0, 0, 1, 1,
0.5553466, 0.6252644, 1.73441, 0, 0, 0, 1, 1,
0.5622216, -1.465535, 4.749683, 0, 0, 0, 1, 1,
0.5633858, -0.1569629, 3.462095, 0, 0, 0, 1, 1,
0.5748221, -0.3167292, 3.19097, 0, 0, 0, 1, 1,
0.5756555, -0.005583191, 1.78174, 0, 0, 0, 1, 1,
0.5810109, -0.4599172, 2.795607, 0, 0, 0, 1, 1,
0.5832825, 0.1338202, 0.4675151, 1, 1, 1, 1, 1,
0.5875064, 1.088402, 0.02191482, 1, 1, 1, 1, 1,
0.5886629, 0.6475879, 1.134747, 1, 1, 1, 1, 1,
0.5893246, -0.5413674, 1.426172, 1, 1, 1, 1, 1,
0.5898541, -0.7495552, 2.1202, 1, 1, 1, 1, 1,
0.5985122, -0.6813126, 1.869289, 1, 1, 1, 1, 1,
0.5986297, 1.004889, 0.9171421, 1, 1, 1, 1, 1,
0.6047851, -0.2995284, 2.279477, 1, 1, 1, 1, 1,
0.6092157, -1.696292, 2.641565, 1, 1, 1, 1, 1,
0.6095775, -0.2846167, -0.6242396, 1, 1, 1, 1, 1,
0.6174617, 0.5826678, 0.7178341, 1, 1, 1, 1, 1,
0.6210023, -0.5672709, 0.4424209, 1, 1, 1, 1, 1,
0.6267601, -1.096818, 1.520745, 1, 1, 1, 1, 1,
0.6270611, -0.6120309, 1.983567, 1, 1, 1, 1, 1,
0.6299301, -1.810408, 2.482638, 1, 1, 1, 1, 1,
0.6303318, -1.218788, 3.689168, 0, 0, 1, 1, 1,
0.6328709, 0.4288908, 1.631117, 1, 0, 0, 1, 1,
0.6351125, 0.2815025, 2.186509, 1, 0, 0, 1, 1,
0.6357695, -0.9312337, 2.482529, 1, 0, 0, 1, 1,
0.6460803, 1.259391, -0.5019916, 1, 0, 0, 1, 1,
0.6467562, -0.4990576, 2.725819, 1, 0, 0, 1, 1,
0.6509719, -0.4323446, 3.629537, 0, 0, 0, 1, 1,
0.6641282, 0.8872133, 0.01853115, 0, 0, 0, 1, 1,
0.6656486, -0.6472005, 5.25298, 0, 0, 0, 1, 1,
0.6704298, -1.709416, 2.086093, 0, 0, 0, 1, 1,
0.6731585, 0.2261529, 1.487722, 0, 0, 0, 1, 1,
0.6752053, 1.47318, -2.253807, 0, 0, 0, 1, 1,
0.6787018, -0.08310317, 3.95484, 0, 0, 0, 1, 1,
0.6795437, 0.3831965, 1.32597, 1, 1, 1, 1, 1,
0.6822733, 0.1491534, 2.442201, 1, 1, 1, 1, 1,
0.683094, -0.4875062, 2.714601, 1, 1, 1, 1, 1,
0.687489, -0.008648558, 1.532187, 1, 1, 1, 1, 1,
0.6960763, -2.496921, 1.537498, 1, 1, 1, 1, 1,
0.7049106, 0.3416294, 0.7251506, 1, 1, 1, 1, 1,
0.7061448, 0.01794446, 1.058619, 1, 1, 1, 1, 1,
0.7063533, -1.533873, 1.654907, 1, 1, 1, 1, 1,
0.7075472, -0.02385095, 2.816271, 1, 1, 1, 1, 1,
0.7099016, 0.8764743, 1.277791, 1, 1, 1, 1, 1,
0.7099857, -0.09475897, 0.3969074, 1, 1, 1, 1, 1,
0.7130825, 1.160703, -0.1849229, 1, 1, 1, 1, 1,
0.7150349, 0.7631041, 1.315393, 1, 1, 1, 1, 1,
0.7167381, 0.7113227, 1.884682, 1, 1, 1, 1, 1,
0.7177161, 0.2608926, 0.897674, 1, 1, 1, 1, 1,
0.7198098, -0.3299957, 0.9463031, 0, 0, 1, 1, 1,
0.720603, 0.8662959, 1.418985, 1, 0, 0, 1, 1,
0.7258189, -1.084628, 2.25251, 1, 0, 0, 1, 1,
0.7284286, -0.1946329, 0.7909163, 1, 0, 0, 1, 1,
0.7286896, 0.6121129, -0.3135351, 1, 0, 0, 1, 1,
0.730144, -0.1785087, 1.138483, 1, 0, 0, 1, 1,
0.7332922, -0.9009172, 1.952039, 0, 0, 0, 1, 1,
0.7333339, -0.7496071, 2.912374, 0, 0, 0, 1, 1,
0.7333549, 0.3184524, 2.660908, 0, 0, 0, 1, 1,
0.7335146, -0.8334936, 1.642779, 0, 0, 0, 1, 1,
0.735813, -1.430601, 3.459922, 0, 0, 0, 1, 1,
0.7359975, -0.853884, 0.03710607, 0, 0, 0, 1, 1,
0.7389452, -1.133522, 0.9902138, 0, 0, 0, 1, 1,
0.7394553, 0.7815078, 1.226276, 1, 1, 1, 1, 1,
0.7470803, 1.829191, -0.2978811, 1, 1, 1, 1, 1,
0.7471616, 0.6129707, 1.662251, 1, 1, 1, 1, 1,
0.751532, 0.1675822, 2.244124, 1, 1, 1, 1, 1,
0.7524992, -2.301286, 3.250371, 1, 1, 1, 1, 1,
0.7526883, -1.972639, 4.395236, 1, 1, 1, 1, 1,
0.7570378, -0.2161224, 0.8596503, 1, 1, 1, 1, 1,
0.7610044, -0.612505, 1.437857, 1, 1, 1, 1, 1,
0.7696577, 0.2607841, 3.199684, 1, 1, 1, 1, 1,
0.773385, -1.492812, 3.580333, 1, 1, 1, 1, 1,
0.7758375, -2.909162, 3.095442, 1, 1, 1, 1, 1,
0.7883347, 0.684817, -0.182617, 1, 1, 1, 1, 1,
0.7950215, 0.5378162, 0.9706109, 1, 1, 1, 1, 1,
0.7957443, 1.584101, 0.9430864, 1, 1, 1, 1, 1,
0.8073578, -1.172611, 2.816183, 1, 1, 1, 1, 1,
0.8128566, -1.028325, 2.337775, 0, 0, 1, 1, 1,
0.8162138, 0.3255993, 1.556926, 1, 0, 0, 1, 1,
0.8189806, 0.4391528, 0.4771465, 1, 0, 0, 1, 1,
0.8196868, 1.819142, 1.730445, 1, 0, 0, 1, 1,
0.8197199, -0.006163489, 3.022802, 1, 0, 0, 1, 1,
0.8208573, -0.7276922, 3.068969, 1, 0, 0, 1, 1,
0.8278037, 0.6987146, 1.757387, 0, 0, 0, 1, 1,
0.8310669, -0.6652077, 0.6488343, 0, 0, 0, 1, 1,
0.8383169, -0.8798688, 3.558392, 0, 0, 0, 1, 1,
0.8394094, 0.9264063, -0.2322572, 0, 0, 0, 1, 1,
0.8412608, -1.002688, 2.19436, 0, 0, 0, 1, 1,
0.8515577, 1.278264, 0.9457934, 0, 0, 0, 1, 1,
0.8552288, 0.2674659, 1.112602, 0, 0, 0, 1, 1,
0.8557087, 1.090501, 0.6350479, 1, 1, 1, 1, 1,
0.8590356, 0.2075183, 1.820797, 1, 1, 1, 1, 1,
0.8631734, 0.6752499, 0.5976327, 1, 1, 1, 1, 1,
0.8690766, -0.125355, 0.6892897, 1, 1, 1, 1, 1,
0.8715526, -0.5205162, 0.1283552, 1, 1, 1, 1, 1,
0.8730884, 2.547561, 0.6682736, 1, 1, 1, 1, 1,
0.875411, 0.9013963, -0.2568997, 1, 1, 1, 1, 1,
0.8775669, 0.3245542, -1.226326, 1, 1, 1, 1, 1,
0.8828707, -0.09647857, 1.769309, 1, 1, 1, 1, 1,
0.8934927, 1.673234, -0.3390873, 1, 1, 1, 1, 1,
0.895202, -0.7752845, 2.240369, 1, 1, 1, 1, 1,
0.8962129, -0.2084929, 2.949633, 1, 1, 1, 1, 1,
0.8985215, 1.984017, 0.8417194, 1, 1, 1, 1, 1,
0.9071367, -1.312328, 1.774191, 1, 1, 1, 1, 1,
0.9083312, 0.3691079, 2.098183, 1, 1, 1, 1, 1,
0.9085769, 2.001811, 0.6545388, 0, 0, 1, 1, 1,
0.9138058, 0.2266786, 2.243378, 1, 0, 0, 1, 1,
0.9287944, -0.4704109, 2.312572, 1, 0, 0, 1, 1,
0.9322896, 0.2399337, -0.7250945, 1, 0, 0, 1, 1,
0.9330832, -0.01259024, 1.775636, 1, 0, 0, 1, 1,
0.9356084, 1.977994, 1.198042, 1, 0, 0, 1, 1,
0.9417449, -0.2184532, 2.290296, 0, 0, 0, 1, 1,
0.9484425, -0.8803669, 3.728054, 0, 0, 0, 1, 1,
0.9501407, 2.124175, 1.508473, 0, 0, 0, 1, 1,
0.9533367, -0.1197655, 0.9973282, 0, 0, 0, 1, 1,
0.958079, -0.01180989, 1.79337, 0, 0, 0, 1, 1,
0.9666585, 0.7604914, -1.370712, 0, 0, 0, 1, 1,
0.9683378, 0.02037595, 1.634496, 0, 0, 0, 1, 1,
0.9707832, 0.2275183, 2.123016, 1, 1, 1, 1, 1,
0.9727375, -0.5179155, 4.046047, 1, 1, 1, 1, 1,
0.9745065, 0.6541706, -0.1124341, 1, 1, 1, 1, 1,
0.9795009, -1.402934, 2.88548, 1, 1, 1, 1, 1,
0.9857827, 1.201918, 1.451342, 1, 1, 1, 1, 1,
0.9876738, -1.404652, 2.351574, 1, 1, 1, 1, 1,
0.9879305, -0.02897501, 1.572194, 1, 1, 1, 1, 1,
0.9892542, 0.8491784, 1.787438, 1, 1, 1, 1, 1,
0.9931898, 0.9802524, 0.02800356, 1, 1, 1, 1, 1,
0.9943927, 0.4989862, 0.5266317, 1, 1, 1, 1, 1,
0.9969232, 0.7127889, 0.4400577, 1, 1, 1, 1, 1,
0.9978043, -0.07212337, 1.949631, 1, 1, 1, 1, 1,
1.001645, -1.745789, 2.738304, 1, 1, 1, 1, 1,
1.007086, 0.2537122, 0.01862618, 1, 1, 1, 1, 1,
1.017566, 0.8838663, 0.9493399, 1, 1, 1, 1, 1,
1.020312, 0.4426312, 1.26726, 0, 0, 1, 1, 1,
1.026936, -1.463553, 2.249328, 1, 0, 0, 1, 1,
1.027062, 0.1386814, 3.871473, 1, 0, 0, 1, 1,
1.031224, -0.8166399, 2.457376, 1, 0, 0, 1, 1,
1.03576, -0.6220561, 1.064289, 1, 0, 0, 1, 1,
1.036869, 0.655463, 1.039908, 1, 0, 0, 1, 1,
1.037894, 0.3454444, -0.5022721, 0, 0, 0, 1, 1,
1.038199, -0.4005462, 1.132489, 0, 0, 0, 1, 1,
1.046198, -0.7203911, 3.19031, 0, 0, 0, 1, 1,
1.04802, 0.009919928, 0.7325892, 0, 0, 0, 1, 1,
1.04911, 1.610453, -0.05705939, 0, 0, 0, 1, 1,
1.05183, 0.4281849, 0.2949208, 0, 0, 0, 1, 1,
1.052733, -1.294357, 4.117015, 0, 0, 0, 1, 1,
1.060893, -1.854683, 3.056002, 1, 1, 1, 1, 1,
1.061441, 1.245565, -1.131866, 1, 1, 1, 1, 1,
1.064469, 0.763229, 0.6704963, 1, 1, 1, 1, 1,
1.066567, -0.6581991, 0.9615759, 1, 1, 1, 1, 1,
1.070448, 2.541504, 0.5781541, 1, 1, 1, 1, 1,
1.070821, -0.3712887, 0.08483647, 1, 1, 1, 1, 1,
1.073065, 0.1231324, 1.749532, 1, 1, 1, 1, 1,
1.076159, -2.258881, 1.945777, 1, 1, 1, 1, 1,
1.084644, 1.842639, 2.574449, 1, 1, 1, 1, 1,
1.085324, -1.033426, 3.489911, 1, 1, 1, 1, 1,
1.085546, -0.1001672, 2.700344, 1, 1, 1, 1, 1,
1.104735, 0.4022945, -0.2964375, 1, 1, 1, 1, 1,
1.106565, -1.075548, 1.151095, 1, 1, 1, 1, 1,
1.106782, -0.5507121, 1.779091, 1, 1, 1, 1, 1,
1.108635, -0.1727155, 0.7510316, 1, 1, 1, 1, 1,
1.110552, 0.6171724, 1.972294, 0, 0, 1, 1, 1,
1.121249, 0.6922528, 1.068467, 1, 0, 0, 1, 1,
1.1231, 1.82495, 0.6568376, 1, 0, 0, 1, 1,
1.128109, 1.765202, 0.8369172, 1, 0, 0, 1, 1,
1.134237, -2.031412, 3.088447, 1, 0, 0, 1, 1,
1.139475, 0.08275935, 1.431417, 1, 0, 0, 1, 1,
1.141388, 0.2029406, 0.8376786, 0, 0, 0, 1, 1,
1.152271, -0.2837507, 3.381264, 0, 0, 0, 1, 1,
1.154104, -0.8832105, 1.173361, 0, 0, 0, 1, 1,
1.162868, 1.267624, 1.302399, 0, 0, 0, 1, 1,
1.165245, 1.18322, -0.5106568, 0, 0, 0, 1, 1,
1.169203, -0.2831939, 2.226834, 0, 0, 0, 1, 1,
1.177633, 0.5262972, -0.03820745, 0, 0, 0, 1, 1,
1.179649, -1.434338, 3.069165, 1, 1, 1, 1, 1,
1.180268, 0.3346866, 2.254181, 1, 1, 1, 1, 1,
1.182046, 0.2078776, 2.397002, 1, 1, 1, 1, 1,
1.183254, 2.099685, -1.1218, 1, 1, 1, 1, 1,
1.188882, -1.761827, 2.767147, 1, 1, 1, 1, 1,
1.202835, -0.1734602, 2.038466, 1, 1, 1, 1, 1,
1.203889, 0.7034954, 1.740226, 1, 1, 1, 1, 1,
1.210197, 0.05942751, -0.4702258, 1, 1, 1, 1, 1,
1.214154, -0.03556486, 2.234417, 1, 1, 1, 1, 1,
1.229893, 0.896367, -0.04997702, 1, 1, 1, 1, 1,
1.231227, -1.422876, 3.39217, 1, 1, 1, 1, 1,
1.232883, 0.3537531, 0.0590312, 1, 1, 1, 1, 1,
1.247309, -1.593492, 4.767694, 1, 1, 1, 1, 1,
1.25427, 0.3793612, 0.2648142, 1, 1, 1, 1, 1,
1.25933, -0.3893092, 1.870267, 1, 1, 1, 1, 1,
1.272646, -1.710226, 2.416138, 0, 0, 1, 1, 1,
1.286269, 1.453515, -0.9789224, 1, 0, 0, 1, 1,
1.287676, -0.5998843, 3.03443, 1, 0, 0, 1, 1,
1.314796, -0.2519389, 1.900864, 1, 0, 0, 1, 1,
1.31999, -1.615539, 1.054199, 1, 0, 0, 1, 1,
1.325758, 0.03930682, 2.352915, 1, 0, 0, 1, 1,
1.330817, 0.3813681, 1.406362, 0, 0, 0, 1, 1,
1.349623, -0.2889614, 1.024382, 0, 0, 0, 1, 1,
1.387058, -1.579069, 4.491617, 0, 0, 0, 1, 1,
1.395007, -2.246634, 1.370318, 0, 0, 0, 1, 1,
1.403708, 1.123662, 0.08514432, 0, 0, 0, 1, 1,
1.404536, -0.02450755, 3.370833, 0, 0, 0, 1, 1,
1.411815, -0.3049017, 2.263258, 0, 0, 0, 1, 1,
1.419018, -0.3905411, 2.269709, 1, 1, 1, 1, 1,
1.421109, 0.5461233, 0.8960843, 1, 1, 1, 1, 1,
1.42355, 0.3627681, 2.500596, 1, 1, 1, 1, 1,
1.426687, -1.931306, 1.982651, 1, 1, 1, 1, 1,
1.431211, 1.905641, -0.2656778, 1, 1, 1, 1, 1,
1.440983, 0.8513455, 1.298799, 1, 1, 1, 1, 1,
1.448242, 0.002275202, 0.2655824, 1, 1, 1, 1, 1,
1.455818, -1.364265, 3.090825, 1, 1, 1, 1, 1,
1.463192, -0.8084739, 1.702017, 1, 1, 1, 1, 1,
1.468107, 0.7193468, -1.394332, 1, 1, 1, 1, 1,
1.491203, 2.072362, -0.6850711, 1, 1, 1, 1, 1,
1.500642, -0.2825934, 2.206838, 1, 1, 1, 1, 1,
1.503746, -0.1873269, 3.890593, 1, 1, 1, 1, 1,
1.509478, 0.1599499, 1.49816, 1, 1, 1, 1, 1,
1.510834, -0.9958475, 1.854018, 1, 1, 1, 1, 1,
1.517924, 1.007485, 1.626902, 0, 0, 1, 1, 1,
1.51843, 0.1463992, 2.162764, 1, 0, 0, 1, 1,
1.518655, -1.325886, 2.871754, 1, 0, 0, 1, 1,
1.519946, -0.2397266, 0.4173999, 1, 0, 0, 1, 1,
1.521002, 0.6251224, 1.684846, 1, 0, 0, 1, 1,
1.523781, 1.427712, 0.4578867, 1, 0, 0, 1, 1,
1.529372, 0.3056875, 0.3774768, 0, 0, 0, 1, 1,
1.552931, 2.446381, 0.2209794, 0, 0, 0, 1, 1,
1.57332, 1.526493, 1.840214, 0, 0, 0, 1, 1,
1.579674, -1.455, 1.611128, 0, 0, 0, 1, 1,
1.608274, -0.7172069, 2.538396, 0, 0, 0, 1, 1,
1.663093, 0.2932402, 1.925862, 0, 0, 0, 1, 1,
1.663933, 0.5933861, 0.2394047, 0, 0, 0, 1, 1,
1.664323, -1.739962, 2.190563, 1, 1, 1, 1, 1,
1.672188, -1.215614, 1.783702, 1, 1, 1, 1, 1,
1.69715, -0.535314, 1.587546, 1, 1, 1, 1, 1,
1.697431, -0.1349034, 0.007810359, 1, 1, 1, 1, 1,
1.707026, 1.220696, 1.251873, 1, 1, 1, 1, 1,
1.738815, 0.2292075, 2.522789, 1, 1, 1, 1, 1,
1.740844, -1.118872, 2.666908, 1, 1, 1, 1, 1,
1.747455, -0.7666731, 1.73133, 1, 1, 1, 1, 1,
1.748493, -0.3926732, 1.398811, 1, 1, 1, 1, 1,
1.757188, -1.515881, 4.279655, 1, 1, 1, 1, 1,
1.759007, 0.720248, 1.361821, 1, 1, 1, 1, 1,
1.849669, -0.4292714, 2.542842, 1, 1, 1, 1, 1,
1.872757, 0.3024538, 1.151402, 1, 1, 1, 1, 1,
1.913311, 2.120048, 0.8692128, 1, 1, 1, 1, 1,
1.934822, -1.086345, 1.969115, 1, 1, 1, 1, 1,
1.983427, -2.125702, 2.327028, 0, 0, 1, 1, 1,
2.074758, 1.325685, 0.4726001, 1, 0, 0, 1, 1,
2.1857, -1.093038, 2.528524, 1, 0, 0, 1, 1,
2.190278, -0.709376, 1.173771, 1, 0, 0, 1, 1,
2.219895, -0.229696, 0.8769244, 1, 0, 0, 1, 1,
2.223735, 2.505711, -1.146456, 1, 0, 0, 1, 1,
2.227644, 0.6030707, 1.301226, 0, 0, 0, 1, 1,
2.266502, 0.5576429, -0.4592855, 0, 0, 0, 1, 1,
2.328381, 0.4041133, 1.129338, 0, 0, 0, 1, 1,
2.419142, 0.1502592, 1.797614, 0, 0, 0, 1, 1,
2.439941, 0.7927176, 2.752069, 0, 0, 0, 1, 1,
2.491154, -0.8192526, 2.158134, 0, 0, 0, 1, 1,
2.53604, 0.589063, 1.0678, 0, 0, 0, 1, 1,
2.562468, -0.007903366, 2.68801, 1, 1, 1, 1, 1,
2.58449, 0.608077, 1.515905, 1, 1, 1, 1, 1,
2.663647, -0.3378301, 2.424045, 1, 1, 1, 1, 1,
2.668401, -2.659296, 2.682492, 1, 1, 1, 1, 1,
2.709928, 1.028792, 1.966998, 1, 1, 1, 1, 1,
2.770544, 0.4468978, 1.901316, 1, 1, 1, 1, 1,
2.894233, -0.01398011, 2.481031, 1, 1, 1, 1, 1
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
var radius = 9.573441;
var distance = 33.6263;
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
mvMatrix.translate( 0.206264, 0.02218461, -0.3478081 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6263);
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
