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
-4.079134, 0.6262805, -0.4719234, 1, 0, 0, 1,
-3.257224, 0.6272563, -1.413488, 1, 0.007843138, 0, 1,
-3.181071, -0.4024056, -2.421897, 1, 0.01176471, 0, 1,
-2.851616, 1.304128, -1.362249, 1, 0.01960784, 0, 1,
-2.776937, -0.5349439, -3.555668, 1, 0.02352941, 0, 1,
-2.677246, -1.387437, -2.221886, 1, 0.03137255, 0, 1,
-2.539174, 0.3035939, -2.909797, 1, 0.03529412, 0, 1,
-2.531416, -0.1479669, -0.141918, 1, 0.04313726, 0, 1,
-2.497359, -0.4913521, -1.028171, 1, 0.04705882, 0, 1,
-2.467161, 0.1936931, -0.2630717, 1, 0.05490196, 0, 1,
-2.281859, -0.3453661, -0.5260752, 1, 0.05882353, 0, 1,
-2.248085, -2.411477, -1.665687, 1, 0.06666667, 0, 1,
-2.228009, -0.493513, -2.665166, 1, 0.07058824, 0, 1,
-2.109642, -0.05477843, -3.656005, 1, 0.07843138, 0, 1,
-2.070344, -0.3906856, 0.28231, 1, 0.08235294, 0, 1,
-2.066087, 0.2488729, -2.217227, 1, 0.09019608, 0, 1,
-2.052526, -1.263953, -1.982259, 1, 0.09411765, 0, 1,
-2.044009, -1.839297, -2.608172, 1, 0.1019608, 0, 1,
-2.034051, -0.6044942, -2.647648, 1, 0.1098039, 0, 1,
-1.994568, -2.331535, -4.946851, 1, 0.1137255, 0, 1,
-1.967818, -0.005403302, -2.437283, 1, 0.1215686, 0, 1,
-1.934676, 2.834947, 0.3707691, 1, 0.1254902, 0, 1,
-1.928511, 1.531403, -1.41904, 1, 0.1333333, 0, 1,
-1.917522, 0.210996, -2.956051, 1, 0.1372549, 0, 1,
-1.896886, -1.183208, -0.2356901, 1, 0.145098, 0, 1,
-1.871177, 0.9089857, -2.294353, 1, 0.1490196, 0, 1,
-1.853026, -0.2989058, -2.106478, 1, 0.1568628, 0, 1,
-1.830675, -0.3608375, -0.8308983, 1, 0.1607843, 0, 1,
-1.824927, 2.316809, -1.671802, 1, 0.1686275, 0, 1,
-1.817392, 0.6768786, -2.779115, 1, 0.172549, 0, 1,
-1.816478, 0.6994051, 0.3404681, 1, 0.1803922, 0, 1,
-1.808404, -0.8907188, -3.085039, 1, 0.1843137, 0, 1,
-1.77484, -0.7746553, -1.326662, 1, 0.1921569, 0, 1,
-1.764467, 0.07055238, -0.3630054, 1, 0.1960784, 0, 1,
-1.762428, -1.424255, -3.324119, 1, 0.2039216, 0, 1,
-1.758477, -0.1934026, -3.890115, 1, 0.2117647, 0, 1,
-1.745636, -1.465926, -1.691681, 1, 0.2156863, 0, 1,
-1.733944, 0.8175814, 0.1503511, 1, 0.2235294, 0, 1,
-1.6747, -2.905895, -1.44402, 1, 0.227451, 0, 1,
-1.674693, 1.127138, -1.695603, 1, 0.2352941, 0, 1,
-1.661547, 0.2852061, -2.548534, 1, 0.2392157, 0, 1,
-1.65272, -1.241196, -2.374417, 1, 0.2470588, 0, 1,
-1.644348, -0.3588759, -0.7803906, 1, 0.2509804, 0, 1,
-1.613953, 2.085919, -1.145944, 1, 0.2588235, 0, 1,
-1.611332, 0.702837, 0.2357061, 1, 0.2627451, 0, 1,
-1.587705, -1.197333, -3.626761, 1, 0.2705882, 0, 1,
-1.58502, 1.30384, -1.112823, 1, 0.2745098, 0, 1,
-1.583604, 0.4145395, -1.755623, 1, 0.282353, 0, 1,
-1.579667, 0.04633478, -1.809117, 1, 0.2862745, 0, 1,
-1.568293, 1.165743, -0.6180959, 1, 0.2941177, 0, 1,
-1.505261, -0.5614287, -3.089461, 1, 0.3019608, 0, 1,
-1.501641, 0.124778, 0.7517788, 1, 0.3058824, 0, 1,
-1.49503, 1.137568, -1.629175, 1, 0.3137255, 0, 1,
-1.467798, -1.6875, -4.466288, 1, 0.3176471, 0, 1,
-1.465921, -2.08336, -3.36385, 1, 0.3254902, 0, 1,
-1.464863, -0.1792549, -1.401532, 1, 0.3294118, 0, 1,
-1.464261, 0.8263157, 0.4131713, 1, 0.3372549, 0, 1,
-1.463335, -0.9820012, -1.433646, 1, 0.3411765, 0, 1,
-1.46209, 0.8051242, 0.4202225, 1, 0.3490196, 0, 1,
-1.460571, -0.8060861, -3.750178, 1, 0.3529412, 0, 1,
-1.458374, -2.083266, -1.313899, 1, 0.3607843, 0, 1,
-1.452029, -0.6684452, -4.371079, 1, 0.3647059, 0, 1,
-1.45064, 1.106305, -1.097684, 1, 0.372549, 0, 1,
-1.440462, -1.108707, -1.093011, 1, 0.3764706, 0, 1,
-1.429679, -0.6498953, -3.266449, 1, 0.3843137, 0, 1,
-1.420709, -0.536118, -2.285913, 1, 0.3882353, 0, 1,
-1.414768, 1.173299, -0.1572981, 1, 0.3960784, 0, 1,
-1.410139, -1.200817, -1.792131, 1, 0.4039216, 0, 1,
-1.400962, -0.5240347, -0.7758415, 1, 0.4078431, 0, 1,
-1.387728, 0.2868469, -1.084702, 1, 0.4156863, 0, 1,
-1.383962, -1.322259, -0.4551331, 1, 0.4196078, 0, 1,
-1.380833, -1.025722, -2.800356, 1, 0.427451, 0, 1,
-1.366117, 0.9097204, -0.9528601, 1, 0.4313726, 0, 1,
-1.361292, -0.07795701, -2.43857, 1, 0.4392157, 0, 1,
-1.358956, 0.5842867, -0.8442097, 1, 0.4431373, 0, 1,
-1.353461, -2.860912, -3.892375, 1, 0.4509804, 0, 1,
-1.349111, 2.093935, 0.1814209, 1, 0.454902, 0, 1,
-1.338869, 0.9653599, -0.1584247, 1, 0.4627451, 0, 1,
-1.332375, 0.1836094, -1.650887, 1, 0.4666667, 0, 1,
-1.32598, -0.4268986, -1.47982, 1, 0.4745098, 0, 1,
-1.324344, -0.1367006, -2.009135, 1, 0.4784314, 0, 1,
-1.316612, 0.03100263, -2.390453, 1, 0.4862745, 0, 1,
-1.312446, 0.3626266, -1.797963, 1, 0.4901961, 0, 1,
-1.299337, 0.9999192, 0.7177627, 1, 0.4980392, 0, 1,
-1.293218, -0.1803604, -2.524907, 1, 0.5058824, 0, 1,
-1.291471, 0.6343783, -0.8361296, 1, 0.509804, 0, 1,
-1.284032, -1.015838, -2.28053, 1, 0.5176471, 0, 1,
-1.279009, -0.7666656, -0.4952654, 1, 0.5215687, 0, 1,
-1.278828, -0.4647506, -1.45893, 1, 0.5294118, 0, 1,
-1.27771, -0.04697537, -2.749798, 1, 0.5333334, 0, 1,
-1.276767, 1.007324, -1.891453, 1, 0.5411765, 0, 1,
-1.275733, 0.3148975, -1.147913, 1, 0.5450981, 0, 1,
-1.266909, 0.6939779, -0.6404185, 1, 0.5529412, 0, 1,
-1.266606, 0.6531127, -1.915486, 1, 0.5568628, 0, 1,
-1.265967, -0.5108039, -1.090085, 1, 0.5647059, 0, 1,
-1.263173, -0.5009739, -1.976369, 1, 0.5686275, 0, 1,
-1.260453, -0.9070141, -2.083088, 1, 0.5764706, 0, 1,
-1.259855, 0.6012344, -0.7707649, 1, 0.5803922, 0, 1,
-1.258872, 0.5273876, -0.8122675, 1, 0.5882353, 0, 1,
-1.257865, -0.1687831, -1.413592, 1, 0.5921569, 0, 1,
-1.255856, -0.7760329, -1.134377, 1, 0.6, 0, 1,
-1.24432, -2.408123, -3.222599, 1, 0.6078432, 0, 1,
-1.240468, 0.679171, 0.875409, 1, 0.6117647, 0, 1,
-1.239355, 0.8733046, 0.2121514, 1, 0.6196079, 0, 1,
-1.232801, -0.5301185, -0.9843661, 1, 0.6235294, 0, 1,
-1.21795, 0.4289011, -2.210153, 1, 0.6313726, 0, 1,
-1.214608, 0.1190021, -0.8018546, 1, 0.6352941, 0, 1,
-1.213763, -0.8591678, -1.868684, 1, 0.6431373, 0, 1,
-1.208635, 1.04955, 0.2770651, 1, 0.6470588, 0, 1,
-1.206436, 1.47049, 0.5505411, 1, 0.654902, 0, 1,
-1.199938, 0.2444161, -1.927961, 1, 0.6588235, 0, 1,
-1.19905, -2.17589, -3.719674, 1, 0.6666667, 0, 1,
-1.197825, 0.9655775, -0.4987762, 1, 0.6705883, 0, 1,
-1.195158, 0.8620924, -2.190226, 1, 0.6784314, 0, 1,
-1.190394, -0.7815453, -1.02277, 1, 0.682353, 0, 1,
-1.184134, -0.6694427, -3.100467, 1, 0.6901961, 0, 1,
-1.18309, 0.3076865, -2.123247, 1, 0.6941177, 0, 1,
-1.182225, -0.04436187, -2.343586, 1, 0.7019608, 0, 1,
-1.179684, -0.6263961, -1.626579, 1, 0.7098039, 0, 1,
-1.176052, 1.090817, -0.9347716, 1, 0.7137255, 0, 1,
-1.173664, -0.1347609, -2.858647, 1, 0.7215686, 0, 1,
-1.172926, 0.9814601, -1.760238, 1, 0.7254902, 0, 1,
-1.170048, 0.4298713, -0.9159451, 1, 0.7333333, 0, 1,
-1.163203, -1.199415, -1.4285, 1, 0.7372549, 0, 1,
-1.157767, 0.3405164, -1.995985, 1, 0.7450981, 0, 1,
-1.155052, 2.707848, -2.050243, 1, 0.7490196, 0, 1,
-1.154076, -0.2791581, -3.073283, 1, 0.7568628, 0, 1,
-1.143569, -0.4514878, -2.477751, 1, 0.7607843, 0, 1,
-1.143036, -0.09075604, -0.6848634, 1, 0.7686275, 0, 1,
-1.136958, -0.2081695, -0.7395562, 1, 0.772549, 0, 1,
-1.135119, 2.64185, -1.166633, 1, 0.7803922, 0, 1,
-1.134353, 0.2664237, -2.07619, 1, 0.7843137, 0, 1,
-1.131941, 0.3044816, -2.495471, 1, 0.7921569, 0, 1,
-1.130235, -0.1139912, -2.043615, 1, 0.7960784, 0, 1,
-1.128224, -1.12808, -2.255607, 1, 0.8039216, 0, 1,
-1.126401, -0.3562146, -2.522363, 1, 0.8117647, 0, 1,
-1.125031, -1.673553, -1.051481, 1, 0.8156863, 0, 1,
-1.122174, -1.51022, -2.90185, 1, 0.8235294, 0, 1,
-1.112417, 0.01914406, -1.373285, 1, 0.827451, 0, 1,
-1.111923, -0.8233538, -0.8489441, 1, 0.8352941, 0, 1,
-1.109616, -1.796032, -1.634489, 1, 0.8392157, 0, 1,
-1.103568, 0.6301287, -0.6972327, 1, 0.8470588, 0, 1,
-1.092462, -0.6956713, -2.333239, 1, 0.8509804, 0, 1,
-1.088576, -0.5050285, -2.229999, 1, 0.8588235, 0, 1,
-1.079901, -0.2541969, -2.411525, 1, 0.8627451, 0, 1,
-1.072594, 1.080615, -2.675992, 1, 0.8705882, 0, 1,
-1.069666, 0.3927078, -0.100848, 1, 0.8745098, 0, 1,
-1.065796, 0.1082959, 0.6435426, 1, 0.8823529, 0, 1,
-1.058604, 0.1088339, -3.185572, 1, 0.8862745, 0, 1,
-1.056594, 0.4121833, 0.7719966, 1, 0.8941177, 0, 1,
-1.045786, 0.1919981, -1.439251, 1, 0.8980392, 0, 1,
-1.039589, -0.04226975, -2.06563, 1, 0.9058824, 0, 1,
-1.034906, -1.078554, -3.089174, 1, 0.9137255, 0, 1,
-1.032185, 1.479998, 1.386619, 1, 0.9176471, 0, 1,
-1.022803, -1.755237, -3.976158, 1, 0.9254902, 0, 1,
-1.021721, 0.04841924, -2.476591, 1, 0.9294118, 0, 1,
-1.020453, -0.3576763, -2.701824, 1, 0.9372549, 0, 1,
-1.015316, -0.671568, -0.8281461, 1, 0.9411765, 0, 1,
-1.01528, 0.05750509, -2.755622, 1, 0.9490196, 0, 1,
-1.011832, 1.350307, 0.72017, 1, 0.9529412, 0, 1,
-1.0081, -0.16472, -5.54668, 1, 0.9607843, 0, 1,
-1.000901, -1.293564, -1.425015, 1, 0.9647059, 0, 1,
-0.9943383, 0.4635623, 1.095997, 1, 0.972549, 0, 1,
-0.9909447, 0.9371057, -1.55034, 1, 0.9764706, 0, 1,
-0.990745, -1.015818, -4.223872, 1, 0.9843137, 0, 1,
-0.9893637, -1.885582, -3.627324, 1, 0.9882353, 0, 1,
-0.985944, 0.8356266, -0.7667766, 1, 0.9960784, 0, 1,
-0.9740976, -0.3346033, -3.413701, 0.9960784, 1, 0, 1,
-0.9723355, 1.117068, 0.11907, 0.9921569, 1, 0, 1,
-0.9615763, 1.362061, -1.498947, 0.9843137, 1, 0, 1,
-0.9570591, -0.7853972, -2.011733, 0.9803922, 1, 0, 1,
-0.9560063, 0.6901591, 0.7254922, 0.972549, 1, 0, 1,
-0.9443817, -1.022078, -2.187511, 0.9686275, 1, 0, 1,
-0.9442958, -1.140465, -2.269085, 0.9607843, 1, 0, 1,
-0.9315853, -0.4786673, -0.9375517, 0.9568627, 1, 0, 1,
-0.9278139, 0.8591877, 0.1603252, 0.9490196, 1, 0, 1,
-0.9227893, -0.03033756, -1.304485, 0.945098, 1, 0, 1,
-0.900703, -0.6323341, -1.983952, 0.9372549, 1, 0, 1,
-0.8948939, -1.034971, -2.072027, 0.9333333, 1, 0, 1,
-0.8931845, 0.1132834, -2.294728, 0.9254902, 1, 0, 1,
-0.8930037, 1.230629, 0.5345528, 0.9215686, 1, 0, 1,
-0.8911809, 1.169675, -0.4619044, 0.9137255, 1, 0, 1,
-0.8834122, -1.565011, -2.726104, 0.9098039, 1, 0, 1,
-0.8698133, -1.114762, -2.857779, 0.9019608, 1, 0, 1,
-0.8685017, -1.734504, -2.419066, 0.8941177, 1, 0, 1,
-0.8666636, -0.2391818, -1.862946, 0.8901961, 1, 0, 1,
-0.861584, -0.2285483, -1.632902, 0.8823529, 1, 0, 1,
-0.860694, -0.5723447, -4.039108, 0.8784314, 1, 0, 1,
-0.8562158, 0.1321221, -2.20352, 0.8705882, 1, 0, 1,
-0.8529904, -1.897165, -3.358684, 0.8666667, 1, 0, 1,
-0.8482922, -0.634019, -1.516967, 0.8588235, 1, 0, 1,
-0.8404209, -0.02692351, 0.338091, 0.854902, 1, 0, 1,
-0.8383222, -1.278711, -3.023254, 0.8470588, 1, 0, 1,
-0.8325328, 0.1807405, -3.237016, 0.8431373, 1, 0, 1,
-0.8294452, -1.385038, -1.423717, 0.8352941, 1, 0, 1,
-0.8257973, 1.118172, 0.2156398, 0.8313726, 1, 0, 1,
-0.8237228, -0.4594785, -2.725595, 0.8235294, 1, 0, 1,
-0.8213636, 0.7317734, -0.04598975, 0.8196079, 1, 0, 1,
-0.8130144, 0.131516, -1.551024, 0.8117647, 1, 0, 1,
-0.8121049, -0.6338904, -0.4970078, 0.8078431, 1, 0, 1,
-0.8040908, -0.2015167, -3.088747, 0.8, 1, 0, 1,
-0.8012607, -0.6940203, -2.240237, 0.7921569, 1, 0, 1,
-0.8007752, -0.4847405, -4.156828, 0.7882353, 1, 0, 1,
-0.7928787, 0.1098468, -0.01084687, 0.7803922, 1, 0, 1,
-0.7878667, 0.1998225, -2.304561, 0.7764706, 1, 0, 1,
-0.7855622, -0.5250004, -0.5748831, 0.7686275, 1, 0, 1,
-0.7833705, 0.09281421, -4.15133, 0.7647059, 1, 0, 1,
-0.7648515, -0.9902096, -1.841187, 0.7568628, 1, 0, 1,
-0.7637547, 1.245642, -0.711324, 0.7529412, 1, 0, 1,
-0.7637162, -0.1086368, -0.5102996, 0.7450981, 1, 0, 1,
-0.7630677, -1.276575, -1.258024, 0.7411765, 1, 0, 1,
-0.7546026, 1.171374, 0.843259, 0.7333333, 1, 0, 1,
-0.7520426, -1.022103, -2.008425, 0.7294118, 1, 0, 1,
-0.7519264, -1.453911, -4.379057, 0.7215686, 1, 0, 1,
-0.7502595, 0.4242426, -2.463048, 0.7176471, 1, 0, 1,
-0.7453073, -1.027771, -2.837314, 0.7098039, 1, 0, 1,
-0.74013, -0.07071581, -1.087284, 0.7058824, 1, 0, 1,
-0.735736, 1.269038, -0.2559958, 0.6980392, 1, 0, 1,
-0.7341942, 1.497206, -1.727838, 0.6901961, 1, 0, 1,
-0.7331842, 0.6256375, -0.676306, 0.6862745, 1, 0, 1,
-0.7306547, -0.2455963, 0.4405307, 0.6784314, 1, 0, 1,
-0.7197849, -0.1990729, -1.384484, 0.6745098, 1, 0, 1,
-0.7142804, 1.249307, -0.5801281, 0.6666667, 1, 0, 1,
-0.7069536, -0.7129142, -2.297103, 0.6627451, 1, 0, 1,
-0.7048576, 1.937752, -1.355448, 0.654902, 1, 0, 1,
-0.7032765, 1.536455, 0.4526529, 0.6509804, 1, 0, 1,
-0.7032626, 0.2875723, -2.333523, 0.6431373, 1, 0, 1,
-0.7026047, 0.2279537, -0.3796777, 0.6392157, 1, 0, 1,
-0.702585, -1.173683, -2.499331, 0.6313726, 1, 0, 1,
-0.7001341, -0.4601622, -4.094417, 0.627451, 1, 0, 1,
-0.69963, -0.1712575, -3.312992, 0.6196079, 1, 0, 1,
-0.6927508, 1.261256, -0.3958504, 0.6156863, 1, 0, 1,
-0.6887863, -0.8962883, -1.444575, 0.6078432, 1, 0, 1,
-0.6868545, 0.1004552, -0.5902638, 0.6039216, 1, 0, 1,
-0.6818738, 1.378275, -0.1600156, 0.5960785, 1, 0, 1,
-0.6818168, -0.8308449, -2.69759, 0.5882353, 1, 0, 1,
-0.6812996, -1.498173, -2.705227, 0.5843138, 1, 0, 1,
-0.6811564, -0.8142015, -0.8875381, 0.5764706, 1, 0, 1,
-0.6807575, 0.1176993, -1.472569, 0.572549, 1, 0, 1,
-0.6775498, 0.9249989, -0.2992646, 0.5647059, 1, 0, 1,
-0.6772985, 0.2849437, -2.367405, 0.5607843, 1, 0, 1,
-0.6715276, -1.102754, -1.509466, 0.5529412, 1, 0, 1,
-0.6712161, 0.8980407, -2.255228, 0.5490196, 1, 0, 1,
-0.6661202, 1.51464, 0.5150166, 0.5411765, 1, 0, 1,
-0.6497658, -0.4339535, -2.246855, 0.5372549, 1, 0, 1,
-0.6489262, 0.4307005, -0.1427592, 0.5294118, 1, 0, 1,
-0.6436557, -1.624321, -2.554321, 0.5254902, 1, 0, 1,
-0.6431912, -0.6312976, -2.898083, 0.5176471, 1, 0, 1,
-0.6409907, -0.3128183, -3.027905, 0.5137255, 1, 0, 1,
-0.6315218, -0.197507, -0.377314, 0.5058824, 1, 0, 1,
-0.6300059, -0.04332011, -0.7741067, 0.5019608, 1, 0, 1,
-0.6289964, -2.575965, -2.49081, 0.4941176, 1, 0, 1,
-0.6285738, -0.4953734, -3.198979, 0.4862745, 1, 0, 1,
-0.6205984, 1.99506, 0.8887523, 0.4823529, 1, 0, 1,
-0.6202764, -0.05242668, -1.977779, 0.4745098, 1, 0, 1,
-0.6183386, -0.6961293, -2.951591, 0.4705882, 1, 0, 1,
-0.6157655, 0.7986174, 0.3277551, 0.4627451, 1, 0, 1,
-0.6144978, 1.416458, 1.684023, 0.4588235, 1, 0, 1,
-0.6120905, 1.72524, 1.128957, 0.4509804, 1, 0, 1,
-0.6090957, 0.5798441, -2.328124, 0.4470588, 1, 0, 1,
-0.6053481, 0.1671985, -2.612854, 0.4392157, 1, 0, 1,
-0.6007129, -1.800413, -1.706316, 0.4352941, 1, 0, 1,
-0.5997366, 1.602481, 0.3217001, 0.427451, 1, 0, 1,
-0.5926204, -0.9496416, -3.656391, 0.4235294, 1, 0, 1,
-0.5921138, 0.6156989, 0.2866338, 0.4156863, 1, 0, 1,
-0.5914037, 0.5468962, -0.423737, 0.4117647, 1, 0, 1,
-0.5900185, -1.497359, -3.704934, 0.4039216, 1, 0, 1,
-0.5800154, 0.9059042, -1.813668, 0.3960784, 1, 0, 1,
-0.5797366, 0.3097172, -1.853751, 0.3921569, 1, 0, 1,
-0.5739347, 0.2116897, -2.866844, 0.3843137, 1, 0, 1,
-0.571642, 0.5621945, 0.2561749, 0.3803922, 1, 0, 1,
-0.566964, -0.2432615, -2.77645, 0.372549, 1, 0, 1,
-0.565544, 0.2498731, -1.725741, 0.3686275, 1, 0, 1,
-0.5641846, 1.22147, -0.2958706, 0.3607843, 1, 0, 1,
-0.5632988, -0.6480844, -0.7455624, 0.3568628, 1, 0, 1,
-0.5535219, 0.5388796, -2.174808, 0.3490196, 1, 0, 1,
-0.5490209, -0.96325, -3.377419, 0.345098, 1, 0, 1,
-0.5476803, 0.7418365, -0.4582275, 0.3372549, 1, 0, 1,
-0.5458507, 0.3444078, -1.549881, 0.3333333, 1, 0, 1,
-0.5447462, -0.2733674, -1.856294, 0.3254902, 1, 0, 1,
-0.5298504, -0.5368883, -0.5388735, 0.3215686, 1, 0, 1,
-0.5275331, -0.2059138, -4.03725, 0.3137255, 1, 0, 1,
-0.5227116, 1.321377, -1.456984, 0.3098039, 1, 0, 1,
-0.5221791, -1.201499, -2.08343, 0.3019608, 1, 0, 1,
-0.5165607, -1.56362, -4.637106, 0.2941177, 1, 0, 1,
-0.5094646, -1.97565, -3.622441, 0.2901961, 1, 0, 1,
-0.5054069, 0.8526523, -1.519151, 0.282353, 1, 0, 1,
-0.5008146, 1.449783, -2.116724, 0.2784314, 1, 0, 1,
-0.497822, -0.1562063, -0.4338047, 0.2705882, 1, 0, 1,
-0.4962186, -0.9694319, -2.167474, 0.2666667, 1, 0, 1,
-0.4944582, -1.233242, -2.801676, 0.2588235, 1, 0, 1,
-0.4933453, 0.614934, -1.055242, 0.254902, 1, 0, 1,
-0.4836041, -0.4967092, -0.3440317, 0.2470588, 1, 0, 1,
-0.477479, -0.2200761, -1.951879, 0.2431373, 1, 0, 1,
-0.4768659, 1.737353, -0.1971662, 0.2352941, 1, 0, 1,
-0.4761264, 0.3065376, -0.9996167, 0.2313726, 1, 0, 1,
-0.4760217, 0.7793302, 0.3920438, 0.2235294, 1, 0, 1,
-0.4745452, -0.8199771, -4.752609, 0.2196078, 1, 0, 1,
-0.4742907, -1.734843, -4.160691, 0.2117647, 1, 0, 1,
-0.4661724, -0.3651017, -1.351723, 0.2078431, 1, 0, 1,
-0.4649215, -1.232429, -1.448353, 0.2, 1, 0, 1,
-0.4641066, -1.329834, -3.054322, 0.1921569, 1, 0, 1,
-0.4617134, -0.3590309, -1.584366, 0.1882353, 1, 0, 1,
-0.4595659, -1.040015, -3.820343, 0.1803922, 1, 0, 1,
-0.4574526, -0.9838933, -2.615795, 0.1764706, 1, 0, 1,
-0.4570273, 0.5171717, -0.1641332, 0.1686275, 1, 0, 1,
-0.4532507, 0.7622918, -0.3908121, 0.1647059, 1, 0, 1,
-0.4523432, -0.4577912, -0.2463183, 0.1568628, 1, 0, 1,
-0.4482499, -0.2602378, -1.508119, 0.1529412, 1, 0, 1,
-0.4476674, -0.009024648, -1.581391, 0.145098, 1, 0, 1,
-0.4465933, -0.5106395, -1.603035, 0.1411765, 1, 0, 1,
-0.4461283, -0.01233334, -2.856972, 0.1333333, 1, 0, 1,
-0.4457474, 0.4075194, -2.77227, 0.1294118, 1, 0, 1,
-0.44476, -0.3460993, -2.476306, 0.1215686, 1, 0, 1,
-0.4371742, 0.06362499, -0.4129143, 0.1176471, 1, 0, 1,
-0.4330422, -0.5487817, -1.12723, 0.1098039, 1, 0, 1,
-0.4284801, 1.27409, -0.04374254, 0.1058824, 1, 0, 1,
-0.4242916, -1.297741, -3.080096, 0.09803922, 1, 0, 1,
-0.4241574, 1.388848, 0.5115975, 0.09019608, 1, 0, 1,
-0.4237068, -0.1817951, -0.2052088, 0.08627451, 1, 0, 1,
-0.4224016, -1.119153, -2.305943, 0.07843138, 1, 0, 1,
-0.422272, -1.448315, -2.459337, 0.07450981, 1, 0, 1,
-0.4195472, -1.920511, -5.07312, 0.06666667, 1, 0, 1,
-0.4158908, 1.194284, -0.008317797, 0.0627451, 1, 0, 1,
-0.4133277, -0.7857238, -1.115903, 0.05490196, 1, 0, 1,
-0.4132929, 0.7038084, -1.74523, 0.05098039, 1, 0, 1,
-0.4123327, 0.514276, -0.1738435, 0.04313726, 1, 0, 1,
-0.4109201, 0.7112978, 0.03814872, 0.03921569, 1, 0, 1,
-0.4094242, -0.1245721, -2.870361, 0.03137255, 1, 0, 1,
-0.4092928, 0.329338, -2.250406, 0.02745098, 1, 0, 1,
-0.4088495, -1.260468, -2.298756, 0.01960784, 1, 0, 1,
-0.4079878, 0.7162796, -1.135346, 0.01568628, 1, 0, 1,
-0.4078469, 0.5586078, -1.951177, 0.007843138, 1, 0, 1,
-0.4068091, 0.2981352, 0.2697622, 0.003921569, 1, 0, 1,
-0.4062493, 0.4191575, -1.685418, 0, 1, 0.003921569, 1,
-0.4060613, -0.9833714, -2.605199, 0, 1, 0.01176471, 1,
-0.4040428, -1.706858, -2.552351, 0, 1, 0.01568628, 1,
-0.3954617, -1.319881, -2.618226, 0, 1, 0.02352941, 1,
-0.3939066, 0.225492, -0.9469138, 0, 1, 0.02745098, 1,
-0.3918636, 0.7257853, 0.5775592, 0, 1, 0.03529412, 1,
-0.3898974, -0.3817546, -4.062051, 0, 1, 0.03921569, 1,
-0.3889783, 1.162116, -1.273362, 0, 1, 0.04705882, 1,
-0.3874035, 0.3253998, -1.558777, 0, 1, 0.05098039, 1,
-0.3852983, 0.2891546, -0.9462474, 0, 1, 0.05882353, 1,
-0.381686, 0.3865154, 0.1971495, 0, 1, 0.0627451, 1,
-0.3739674, 0.108296, -0.8068644, 0, 1, 0.07058824, 1,
-0.3704218, 0.09041283, -1.69615, 0, 1, 0.07450981, 1,
-0.3625469, -0.4818316, -2.012616, 0, 1, 0.08235294, 1,
-0.3606616, -0.973814, -1.955533, 0, 1, 0.08627451, 1,
-0.3532414, -0.3931524, -2.316532, 0, 1, 0.09411765, 1,
-0.3514789, 1.450157, -0.7920422, 0, 1, 0.1019608, 1,
-0.350906, -1.216451, -3.582239, 0, 1, 0.1058824, 1,
-0.3500029, -0.5400482, -2.270031, 0, 1, 0.1137255, 1,
-0.3489816, -0.5348679, -2.9964, 0, 1, 0.1176471, 1,
-0.3474225, 0.396385, -2.763716, 0, 1, 0.1254902, 1,
-0.3371752, -0.4664326, -1.665201, 0, 1, 0.1294118, 1,
-0.3344809, 0.3793377, -0.9152905, 0, 1, 0.1372549, 1,
-0.3333059, -1.583053, -3.216632, 0, 1, 0.1411765, 1,
-0.3306255, -0.4710398, -2.448432, 0, 1, 0.1490196, 1,
-0.3248287, -0.2747338, -3.922078, 0, 1, 0.1529412, 1,
-0.3233113, -0.5943365, -2.288619, 0, 1, 0.1607843, 1,
-0.3192053, -1.046933, -2.737977, 0, 1, 0.1647059, 1,
-0.319149, 0.255577, -1.25836, 0, 1, 0.172549, 1,
-0.3163828, 0.904191, -2.616409, 0, 1, 0.1764706, 1,
-0.3115664, 1.773956, -1.377987, 0, 1, 0.1843137, 1,
-0.3108058, 0.8613193, 0.05366353, 0, 1, 0.1882353, 1,
-0.3083831, 0.2484942, -1.771162, 0, 1, 0.1960784, 1,
-0.3083471, 2.155332, -0.0862933, 0, 1, 0.2039216, 1,
-0.3031813, 1.176269, -1.649578, 0, 1, 0.2078431, 1,
-0.3011349, 0.3105389, -1.22893, 0, 1, 0.2156863, 1,
-0.3005713, -0.734974, -4.899201, 0, 1, 0.2196078, 1,
-0.296787, -0.9796914, -3.228862, 0, 1, 0.227451, 1,
-0.2956762, 2.437668, 1.138941, 0, 1, 0.2313726, 1,
-0.2918228, 0.6065934, -1.687967, 0, 1, 0.2392157, 1,
-0.2903022, -0.6698159, -4.717748, 0, 1, 0.2431373, 1,
-0.2846999, 0.1367162, -2.41338, 0, 1, 0.2509804, 1,
-0.2828135, 1.205904, 0.08953364, 0, 1, 0.254902, 1,
-0.2818545, -0.2771704, -1.731558, 0, 1, 0.2627451, 1,
-0.2810226, 1.688775, 1.495687, 0, 1, 0.2666667, 1,
-0.2809201, 0.718091, -2.467001, 0, 1, 0.2745098, 1,
-0.2768005, -1.454231, -4.402924, 0, 1, 0.2784314, 1,
-0.2764596, 1.38892, 0.86417, 0, 1, 0.2862745, 1,
-0.2695847, 0.6855415, -1.14643, 0, 1, 0.2901961, 1,
-0.2644022, -0.5991598, -3.26908, 0, 1, 0.2980392, 1,
-0.2635441, 0.803772, 0.352654, 0, 1, 0.3058824, 1,
-0.2630735, 0.8493687, -0.5071226, 0, 1, 0.3098039, 1,
-0.2606074, 1.720729, -0.6059569, 0, 1, 0.3176471, 1,
-0.2577475, 0.262627, -0.03914464, 0, 1, 0.3215686, 1,
-0.2564202, -1.382467, -2.842654, 0, 1, 0.3294118, 1,
-0.2505666, 0.9449093, 1.31401, 0, 1, 0.3333333, 1,
-0.2485539, 1.515053, -1.165835, 0, 1, 0.3411765, 1,
-0.2485236, -0.9025337, -2.155865, 0, 1, 0.345098, 1,
-0.2459983, 0.2073803, 0.1097761, 0, 1, 0.3529412, 1,
-0.245907, 1.236197, -0.9014944, 0, 1, 0.3568628, 1,
-0.2458525, -1.090359, -3.586221, 0, 1, 0.3647059, 1,
-0.2431692, -0.7053149, -3.451044, 0, 1, 0.3686275, 1,
-0.2423303, -0.9757238, -3.245157, 0, 1, 0.3764706, 1,
-0.2408458, -0.3518776, -1.87492, 0, 1, 0.3803922, 1,
-0.2375489, 0.9722492, -0.2596847, 0, 1, 0.3882353, 1,
-0.2337432, -1.042105, -3.079143, 0, 1, 0.3921569, 1,
-0.2323825, -0.9444429, -4.115475, 0, 1, 0.4, 1,
-0.2307139, -2.060238, -2.645173, 0, 1, 0.4078431, 1,
-0.2277644, -0.9847007, -4.092673, 0, 1, 0.4117647, 1,
-0.2271378, -1.426809, -3.636837, 0, 1, 0.4196078, 1,
-0.2270207, -0.3453249, -2.427243, 0, 1, 0.4235294, 1,
-0.2222259, 0.1196683, -0.787501, 0, 1, 0.4313726, 1,
-0.2214962, 0.1020368, -1.35646, 0, 1, 0.4352941, 1,
-0.2212997, -0.1533698, -1.392475, 0, 1, 0.4431373, 1,
-0.2122802, 0.616446, 0.03308389, 0, 1, 0.4470588, 1,
-0.2103359, 0.7961527, -1.178552, 0, 1, 0.454902, 1,
-0.2073985, -0.5952696, -2.92359, 0, 1, 0.4588235, 1,
-0.2049568, 0.2237405, -0.4566019, 0, 1, 0.4666667, 1,
-0.2043886, 0.873753, 1.37192, 0, 1, 0.4705882, 1,
-0.2014927, 1.344887, 0.0337991, 0, 1, 0.4784314, 1,
-0.1955844, -1.018453, -3.520487, 0, 1, 0.4823529, 1,
-0.1945183, 0.465566, -0.6402408, 0, 1, 0.4901961, 1,
-0.190412, -2.295092, -3.186109, 0, 1, 0.4941176, 1,
-0.1855385, -0.3519114, -3.612206, 0, 1, 0.5019608, 1,
-0.1844394, 0.4844039, -1.318919, 0, 1, 0.509804, 1,
-0.1821146, 0.1472368, -2.783976, 0, 1, 0.5137255, 1,
-0.1755149, -0.4963293, -2.845192, 0, 1, 0.5215687, 1,
-0.1720342, 0.2258425, -1.047548, 0, 1, 0.5254902, 1,
-0.1706076, -0.4551499, -1.824278, 0, 1, 0.5333334, 1,
-0.1683432, -1.774073, -4.337441, 0, 1, 0.5372549, 1,
-0.1675171, -0.1827209, -1.151525, 0, 1, 0.5450981, 1,
-0.1664331, 1.219626, -0.1171123, 0, 1, 0.5490196, 1,
-0.1623836, 0.8678067, -0.4538923, 0, 1, 0.5568628, 1,
-0.160274, 0.7424592, 0.291278, 0, 1, 0.5607843, 1,
-0.1541279, 0.7141539, -2.434938, 0, 1, 0.5686275, 1,
-0.1501498, 0.705777, -2.05639, 0, 1, 0.572549, 1,
-0.1448141, -1.405777, -2.992218, 0, 1, 0.5803922, 1,
-0.1442074, -2.606503, -4.594907, 0, 1, 0.5843138, 1,
-0.1431012, -0.1769594, -3.032765, 0, 1, 0.5921569, 1,
-0.1386011, -0.9341381, -2.806495, 0, 1, 0.5960785, 1,
-0.1365848, -0.5733687, -2.305641, 0, 1, 0.6039216, 1,
-0.1352379, -0.2789332, -3.604135, 0, 1, 0.6117647, 1,
-0.1333437, -0.5743898, -2.85966, 0, 1, 0.6156863, 1,
-0.1264988, -0.6628097, -5.539982, 0, 1, 0.6235294, 1,
-0.1263952, -0.3787491, -4.044991, 0, 1, 0.627451, 1,
-0.1261231, 0.3729063, -1.339947, 0, 1, 0.6352941, 1,
-0.1252706, -1.121939, -4.641519, 0, 1, 0.6392157, 1,
-0.1243333, 0.4848018, -1.434754, 0, 1, 0.6470588, 1,
-0.1193736, 0.4706402, -1.371137, 0, 1, 0.6509804, 1,
-0.1190549, -0.7623017, -1.821965, 0, 1, 0.6588235, 1,
-0.1178336, -0.1709594, -2.596117, 0, 1, 0.6627451, 1,
-0.1156823, -0.2512998, -2.231472, 0, 1, 0.6705883, 1,
-0.1138605, -0.9871451, -2.695605, 0, 1, 0.6745098, 1,
-0.1117406, -1.447889, -3.516824, 0, 1, 0.682353, 1,
-0.110328, -1.099766, -3.02906, 0, 1, 0.6862745, 1,
-0.1071632, -2.208038, -3.158378, 0, 1, 0.6941177, 1,
-0.1005416, -0.2071405, -0.9904935, 0, 1, 0.7019608, 1,
-0.09875096, 0.4250901, 0.8213714, 0, 1, 0.7058824, 1,
-0.0985074, -3.136307, -3.707587, 0, 1, 0.7137255, 1,
-0.09638629, 1.007715, 1.161792, 0, 1, 0.7176471, 1,
-0.09501643, 0.7047206, 0.5197088, 0, 1, 0.7254902, 1,
-0.09355051, -0.005437244, 0.08733471, 0, 1, 0.7294118, 1,
-0.09054484, 0.6587349, 1.31915, 0, 1, 0.7372549, 1,
-0.09007705, 0.883967, -0.7867405, 0, 1, 0.7411765, 1,
-0.08801303, -1.11813, -2.670818, 0, 1, 0.7490196, 1,
-0.08779594, -1.524155, -1.83916, 0, 1, 0.7529412, 1,
-0.08611836, -0.3103727, -2.399565, 0, 1, 0.7607843, 1,
-0.08455267, 1.729707, 1.195757, 0, 1, 0.7647059, 1,
-0.08401292, -0.1770944, -3.652208, 0, 1, 0.772549, 1,
-0.08272124, 0.199693, 0.3840035, 0, 1, 0.7764706, 1,
-0.07934246, 0.8175003, -2.168035, 0, 1, 0.7843137, 1,
-0.07852713, 1.883056, -0.187163, 0, 1, 0.7882353, 1,
-0.07495623, -0.204089, -4.772793, 0, 1, 0.7960784, 1,
-0.06328212, -0.1050589, -2.267035, 0, 1, 0.8039216, 1,
-0.06232162, -0.1652143, -1.004359, 0, 1, 0.8078431, 1,
-0.05579685, 0.4117768, -2.273601, 0, 1, 0.8156863, 1,
-0.05418703, -1.343481, -1.171579, 0, 1, 0.8196079, 1,
-0.04545463, -2.069439, -1.552253, 0, 1, 0.827451, 1,
-0.04530561, 1.611113, 0.2473087, 0, 1, 0.8313726, 1,
-0.04444291, 0.5985355, 0.1251952, 0, 1, 0.8392157, 1,
-0.03755916, -1.357928, -4.954667, 0, 1, 0.8431373, 1,
-0.03552289, 0.4116927, -0.1601496, 0, 1, 0.8509804, 1,
-0.03508599, 1.518504, -1.283356, 0, 1, 0.854902, 1,
-0.03208089, 2.51912, 0.5312945, 0, 1, 0.8627451, 1,
-0.02963884, -0.573299, -2.142569, 0, 1, 0.8666667, 1,
-0.02211202, 0.2297105, -2.072171, 0, 1, 0.8745098, 1,
-0.02203371, -0.5103095, -2.840655, 0, 1, 0.8784314, 1,
-0.02132266, 0.4972324, 0.9738039, 0, 1, 0.8862745, 1,
-0.01837993, 0.173134, -0.2119767, 0, 1, 0.8901961, 1,
-0.01752421, -1.613607, -3.256085, 0, 1, 0.8980392, 1,
-0.01750215, -0.6335217, -1.821316, 0, 1, 0.9058824, 1,
-0.01636585, -0.4034968, -3.282895, 0, 1, 0.9098039, 1,
-0.01504374, 1.563557, 0.8930869, 0, 1, 0.9176471, 1,
0.001407394, 1.091046, 1.565508, 0, 1, 0.9215686, 1,
0.004374892, 0.5613406, 0.7908859, 0, 1, 0.9294118, 1,
0.005685296, -1.8777, 2.707605, 0, 1, 0.9333333, 1,
0.008384307, 0.1837788, -0.3549633, 0, 1, 0.9411765, 1,
0.01041479, 0.5198595, -1.110716, 0, 1, 0.945098, 1,
0.01177573, -0.8388142, 5.206333, 0, 1, 0.9529412, 1,
0.01199676, -0.2610875, 2.119265, 0, 1, 0.9568627, 1,
0.01408512, 0.878403, 0.2979954, 0, 1, 0.9647059, 1,
0.02326798, -0.9128562, 1.25814, 0, 1, 0.9686275, 1,
0.02395332, 0.6312878, 0.06588329, 0, 1, 0.9764706, 1,
0.02560891, 0.05713183, 1.797046, 0, 1, 0.9803922, 1,
0.02649042, 0.06081844, -0.6167129, 0, 1, 0.9882353, 1,
0.02958025, -0.06649994, 3.25999, 0, 1, 0.9921569, 1,
0.03158692, 1.135848, 1.263978, 0, 1, 1, 1,
0.03312466, 0.8920993, 0.5396606, 0, 0.9921569, 1, 1,
0.03626591, 0.5134694, -1.977621, 0, 0.9882353, 1, 1,
0.03755249, -0.1622435, 4.359808, 0, 0.9803922, 1, 1,
0.04011215, -0.1046529, 0.8035492, 0, 0.9764706, 1, 1,
0.04484999, -0.4130036, 2.404245, 0, 0.9686275, 1, 1,
0.05004295, -0.6823118, 3.14825, 0, 0.9647059, 1, 1,
0.05389361, -0.4549212, 3.377589, 0, 0.9568627, 1, 1,
0.05429473, 2.026114, -1.086396, 0, 0.9529412, 1, 1,
0.05631697, -0.7966258, 3.042985, 0, 0.945098, 1, 1,
0.05741294, 2.158086, 2.083822, 0, 0.9411765, 1, 1,
0.05773863, 1.029406, 0.9195811, 0, 0.9333333, 1, 1,
0.05800761, -0.4588103, 2.621569, 0, 0.9294118, 1, 1,
0.0651466, -1.043035, 2.005821, 0, 0.9215686, 1, 1,
0.06731008, 0.152358, 0.4358066, 0, 0.9176471, 1, 1,
0.07018968, 1.570238, 0.0674888, 0, 0.9098039, 1, 1,
0.07127576, -1.607825, 4.614573, 0, 0.9058824, 1, 1,
0.07417839, -0.7488378, 2.922163, 0, 0.8980392, 1, 1,
0.07724851, -0.5007259, 2.312408, 0, 0.8901961, 1, 1,
0.07756863, -0.2684949, 2.783199, 0, 0.8862745, 1, 1,
0.07765809, 1.3729, 0.6375273, 0, 0.8784314, 1, 1,
0.08336648, 1.48197, -1.404294, 0, 0.8745098, 1, 1,
0.08458989, -1.770219, 0.784417, 0, 0.8666667, 1, 1,
0.08868455, 1.173637, 0.155025, 0, 0.8627451, 1, 1,
0.09098756, 0.6912913, 1.183434, 0, 0.854902, 1, 1,
0.09617903, 0.120732, 0.7138626, 0, 0.8509804, 1, 1,
0.09644099, -0.8592114, 2.9796, 0, 0.8431373, 1, 1,
0.09824254, 0.5548968, 3.405264, 0, 0.8392157, 1, 1,
0.09927807, -0.2043074, 2.644742, 0, 0.8313726, 1, 1,
0.1026795, 0.7151698, -1.198789, 0, 0.827451, 1, 1,
0.1046462, 0.7698793, 0.3056681, 0, 0.8196079, 1, 1,
0.1074261, -1.789796, 2.423166, 0, 0.8156863, 1, 1,
0.1097922, 0.3049479, 2.329511, 0, 0.8078431, 1, 1,
0.1139186, -0.5385977, 2.266397, 0, 0.8039216, 1, 1,
0.1160142, -0.8388515, 1.373529, 0, 0.7960784, 1, 1,
0.1234407, -0.1661007, 2.592999, 0, 0.7882353, 1, 1,
0.1250082, 0.8004391, -1.716152, 0, 0.7843137, 1, 1,
0.1263501, -0.6150241, 3.087584, 0, 0.7764706, 1, 1,
0.1331447, -0.5368057, 3.627402, 0, 0.772549, 1, 1,
0.1340392, -0.4067636, 0.2487767, 0, 0.7647059, 1, 1,
0.1368272, -0.04927281, -0.003848968, 0, 0.7607843, 1, 1,
0.1422825, -0.1316584, 2.866921, 0, 0.7529412, 1, 1,
0.1446668, 0.9450611, 0.821668, 0, 0.7490196, 1, 1,
0.1459768, 0.5598376, -0.2421604, 0, 0.7411765, 1, 1,
0.1481009, 0.6371188, 1.291853, 0, 0.7372549, 1, 1,
0.1494233, -0.4919056, 3.898901, 0, 0.7294118, 1, 1,
0.1494378, -0.09775807, 0.9467915, 0, 0.7254902, 1, 1,
0.1525009, 0.0501088, 0.8768712, 0, 0.7176471, 1, 1,
0.152795, -0.5575386, 2.739887, 0, 0.7137255, 1, 1,
0.1539575, -0.9025396, 5.838547, 0, 0.7058824, 1, 1,
0.1547983, 0.7996417, 0.4619348, 0, 0.6980392, 1, 1,
0.1598603, 0.03004581, 0.2745344, 0, 0.6941177, 1, 1,
0.1611468, 0.3183427, 0.2700408, 0, 0.6862745, 1, 1,
0.1616445, 0.2789082, 1.578949, 0, 0.682353, 1, 1,
0.17022, -1.669353, 1.612996, 0, 0.6745098, 1, 1,
0.1734096, 0.01097261, 2.082489, 0, 0.6705883, 1, 1,
0.177041, -0.1940922, 2.261327, 0, 0.6627451, 1, 1,
0.1778095, 0.4121288, -0.9977158, 0, 0.6588235, 1, 1,
0.1790061, -0.7042467, 1.92566, 0, 0.6509804, 1, 1,
0.1805745, -1.727431, 4.008523, 0, 0.6470588, 1, 1,
0.1821453, -0.03090749, 0.5704239, 0, 0.6392157, 1, 1,
0.1866077, -0.9660332, 3.466931, 0, 0.6352941, 1, 1,
0.1873345, -0.08561201, 0.4996339, 0, 0.627451, 1, 1,
0.1878319, -0.4099503, 3.255102, 0, 0.6235294, 1, 1,
0.1902749, 0.7339448, 0.6626823, 0, 0.6156863, 1, 1,
0.1930944, 0.5706599, -0.6579771, 0, 0.6117647, 1, 1,
0.1931791, 0.2994718, 1.393533, 0, 0.6039216, 1, 1,
0.1993554, -1.351454, 1.99052, 0, 0.5960785, 1, 1,
0.2003313, -0.4244752, 5.258435, 0, 0.5921569, 1, 1,
0.2004806, 0.3916776, -0.2811197, 0, 0.5843138, 1, 1,
0.2019011, -0.5301259, 2.919344, 0, 0.5803922, 1, 1,
0.2041982, -0.06539451, 1.528394, 0, 0.572549, 1, 1,
0.2143731, 0.02829255, 3.474337, 0, 0.5686275, 1, 1,
0.2145431, 0.8482276, -0.3152376, 0, 0.5607843, 1, 1,
0.2287507, 1.655828, 0.4216095, 0, 0.5568628, 1, 1,
0.2291878, -1.171875, 3.928455, 0, 0.5490196, 1, 1,
0.2301155, -0.8320777, 3.61617, 0, 0.5450981, 1, 1,
0.2303216, 0.7786038, 0.4782671, 0, 0.5372549, 1, 1,
0.2400373, 0.7651461, 0.8706461, 0, 0.5333334, 1, 1,
0.2433736, 0.2894723, 0.9755405, 0, 0.5254902, 1, 1,
0.2435169, 1.115475, 0.1515317, 0, 0.5215687, 1, 1,
0.2470289, -0.5534346, 2.204015, 0, 0.5137255, 1, 1,
0.2501522, -0.3689908, 2.188541, 0, 0.509804, 1, 1,
0.2520598, -0.2148259, 1.377512, 0, 0.5019608, 1, 1,
0.2563153, 0.3585292, 1.579254, 0, 0.4941176, 1, 1,
0.2610384, 0.907576, 1.715952, 0, 0.4901961, 1, 1,
0.2618494, -1.752272, 3.284023, 0, 0.4823529, 1, 1,
0.2619206, 0.7757346, 1.466827, 0, 0.4784314, 1, 1,
0.2619329, 0.4133827, -0.2348244, 0, 0.4705882, 1, 1,
0.2659433, -0.196621, 1.040603, 0, 0.4666667, 1, 1,
0.2761721, 0.991747, 0.5258549, 0, 0.4588235, 1, 1,
0.2783997, -0.5609717, 2.721619, 0, 0.454902, 1, 1,
0.2817225, -0.3955034, 1.55304, 0, 0.4470588, 1, 1,
0.2823537, 0.201541, 1.151269, 0, 0.4431373, 1, 1,
0.2836602, 1.75783, -0.859979, 0, 0.4352941, 1, 1,
0.2841065, 1.41305, -0.2550089, 0, 0.4313726, 1, 1,
0.2901936, 0.1393718, 0.8240781, 0, 0.4235294, 1, 1,
0.2941656, 0.3580426, -0.4719855, 0, 0.4196078, 1, 1,
0.294604, 0.513922, -0.8941193, 0, 0.4117647, 1, 1,
0.2948368, -1.055156, 3.911594, 0, 0.4078431, 1, 1,
0.3063787, 1.296348, -0.967025, 0, 0.4, 1, 1,
0.3068726, -0.1073867, 2.072162, 0, 0.3921569, 1, 1,
0.3132184, 0.7689106, 1.911789, 0, 0.3882353, 1, 1,
0.3194401, -1.87262, 2.835579, 0, 0.3803922, 1, 1,
0.3245592, 1.836248, 0.4371351, 0, 0.3764706, 1, 1,
0.3249079, -0.7573968, 2.947665, 0, 0.3686275, 1, 1,
0.3259316, -0.4760128, 1.313296, 0, 0.3647059, 1, 1,
0.3289172, -0.145215, 3.771983, 0, 0.3568628, 1, 1,
0.3298999, -1.096591, 4.447618, 0, 0.3529412, 1, 1,
0.3386402, -0.5985948, 2.65595, 0, 0.345098, 1, 1,
0.342845, 0.2985709, 2.905773, 0, 0.3411765, 1, 1,
0.3436699, -0.2919872, 1.744048, 0, 0.3333333, 1, 1,
0.3446693, -1.041933, 2.944197, 0, 0.3294118, 1, 1,
0.3477522, 0.09050965, 0.2251137, 0, 0.3215686, 1, 1,
0.3490979, 2.545059, -2.282134, 0, 0.3176471, 1, 1,
0.3501616, 0.04813551, 1.768792, 0, 0.3098039, 1, 1,
0.3509988, 0.5142363, -0.2701903, 0, 0.3058824, 1, 1,
0.3512243, -1.454096, 3.142285, 0, 0.2980392, 1, 1,
0.3561971, 0.4380031, 0.6824521, 0, 0.2901961, 1, 1,
0.3570479, 1.118349, 0.8521981, 0, 0.2862745, 1, 1,
0.358294, 0.3031074, 0.518374, 0, 0.2784314, 1, 1,
0.3607433, -0.6383349, 1.794063, 0, 0.2745098, 1, 1,
0.3614039, -1.927846, 3.106464, 0, 0.2666667, 1, 1,
0.365142, -0.5604517, 3.37767, 0, 0.2627451, 1, 1,
0.3673052, -0.7722026, 2.5611, 0, 0.254902, 1, 1,
0.369045, -0.364394, 1.812533, 0, 0.2509804, 1, 1,
0.3733054, 0.5512909, 1.83609, 0, 0.2431373, 1, 1,
0.3738232, -1.231343, 4.027226, 0, 0.2392157, 1, 1,
0.3754254, -0.239573, 2.829263, 0, 0.2313726, 1, 1,
0.3814459, -0.1371647, 0.817758, 0, 0.227451, 1, 1,
0.3847121, 0.6432507, 1.668597, 0, 0.2196078, 1, 1,
0.3861095, 1.157314, 0.8721685, 0, 0.2156863, 1, 1,
0.3863815, -2.105222, 3.113281, 0, 0.2078431, 1, 1,
0.3978471, -0.7742915, 2.425878, 0, 0.2039216, 1, 1,
0.3991114, -0.6529895, 2.085601, 0, 0.1960784, 1, 1,
0.3996477, -0.4470994, 2.724301, 0, 0.1882353, 1, 1,
0.4012351, -0.3353878, 2.604757, 0, 0.1843137, 1, 1,
0.4087322, 1.296811, 1.602525, 0, 0.1764706, 1, 1,
0.4161496, -0.4745818, 2.772285, 0, 0.172549, 1, 1,
0.4209766, -0.7030872, 2.328647, 0, 0.1647059, 1, 1,
0.4259616, -0.246271, 2.563843, 0, 0.1607843, 1, 1,
0.4261352, -0.5403908, 2.901181, 0, 0.1529412, 1, 1,
0.427133, -0.2511796, 2.211245, 0, 0.1490196, 1, 1,
0.4291002, 0.4709722, 0.540826, 0, 0.1411765, 1, 1,
0.4318485, 0.7649387, 2.379637, 0, 0.1372549, 1, 1,
0.4341076, 0.3977508, 0.1373488, 0, 0.1294118, 1, 1,
0.4346257, 0.8064266, -0.8664677, 0, 0.1254902, 1, 1,
0.4352118, 1.017242, -0.4852491, 0, 0.1176471, 1, 1,
0.4379206, 0.2628645, -0.02390575, 0, 0.1137255, 1, 1,
0.4387572, 0.1483596, -0.2138044, 0, 0.1058824, 1, 1,
0.4388637, -0.3891732, 1.842251, 0, 0.09803922, 1, 1,
0.4430103, -0.8973796, 4.97717, 0, 0.09411765, 1, 1,
0.445783, 0.7606903, 1.414932, 0, 0.08627451, 1, 1,
0.4459125, 1.134264, 0.4251459, 0, 0.08235294, 1, 1,
0.446911, -0.1491843, 0.3423527, 0, 0.07450981, 1, 1,
0.4473506, -0.05211132, 2.34091, 0, 0.07058824, 1, 1,
0.4482305, 2.511847, -0.01696526, 0, 0.0627451, 1, 1,
0.4494817, -0.3309227, 5.533077, 0, 0.05882353, 1, 1,
0.4535802, 0.1829289, 1.643697, 0, 0.05098039, 1, 1,
0.4583952, -0.6276107, 2.607753, 0, 0.04705882, 1, 1,
0.4584807, -1.101601, 2.191863, 0, 0.03921569, 1, 1,
0.4585801, 1.926155, 1.471344, 0, 0.03529412, 1, 1,
0.4596619, -0.66796, 1.925224, 0, 0.02745098, 1, 1,
0.4610644, 2.158747, 2.5025, 0, 0.02352941, 1, 1,
0.4621257, -0.6820329, 2.578371, 0, 0.01568628, 1, 1,
0.463857, -0.5167633, 1.145393, 0, 0.01176471, 1, 1,
0.4662848, 1.419474, 0.1524117, 0, 0.003921569, 1, 1,
0.4744245, -0.149671, 2.284511, 0.003921569, 0, 1, 1,
0.4746705, -0.1818142, 2.967661, 0.007843138, 0, 1, 1,
0.4812422, 0.230775, -0.3701983, 0.01568628, 0, 1, 1,
0.4818022, -0.7966588, 2.881679, 0.01960784, 0, 1, 1,
0.4835598, -0.6998533, 1.46315, 0.02745098, 0, 1, 1,
0.4837326, -0.9133543, 1.939362, 0.03137255, 0, 1, 1,
0.4841458, 1.346074, 0.0116093, 0.03921569, 0, 1, 1,
0.4865012, 1.21011, -1.423314, 0.04313726, 0, 1, 1,
0.4870766, -0.2428291, 2.082211, 0.05098039, 0, 1, 1,
0.4904143, -0.1425118, 0.9160841, 0.05490196, 0, 1, 1,
0.4904985, -0.7296726, 3.322026, 0.0627451, 0, 1, 1,
0.4938927, -1.217443, 2.282466, 0.06666667, 0, 1, 1,
0.494817, -0.7272118, 2.067214, 0.07450981, 0, 1, 1,
0.5086532, -1.831211, 3.779994, 0.07843138, 0, 1, 1,
0.5102146, 0.7872964, -0.1230004, 0.08627451, 0, 1, 1,
0.5137792, 1.4323, 0.9326217, 0.09019608, 0, 1, 1,
0.5144699, 0.6332589, 1.159374, 0.09803922, 0, 1, 1,
0.5153812, -1.777382, 2.879665, 0.1058824, 0, 1, 1,
0.5157428, 0.5191731, 0.7652502, 0.1098039, 0, 1, 1,
0.5180426, -1.54799, 3.719935, 0.1176471, 0, 1, 1,
0.518619, -0.001667938, 1.980255, 0.1215686, 0, 1, 1,
0.5284492, -2.277752, 4.769181, 0.1294118, 0, 1, 1,
0.531609, 1.480062, 1.001368, 0.1333333, 0, 1, 1,
0.5334538, -1.42648, 3.007727, 0.1411765, 0, 1, 1,
0.5371515, 0.04234619, 2.76141, 0.145098, 0, 1, 1,
0.5407108, -0.877293, 2.556529, 0.1529412, 0, 1, 1,
0.5484073, -0.884169, 2.519136, 0.1568628, 0, 1, 1,
0.5544127, -0.5178671, 2.644314, 0.1647059, 0, 1, 1,
0.5581866, -0.2624067, 2.043199, 0.1686275, 0, 1, 1,
0.5592795, 0.905825, 2.176121, 0.1764706, 0, 1, 1,
0.56043, -0.03246309, 1.047273, 0.1803922, 0, 1, 1,
0.56443, 1.270004, 0.6481438, 0.1882353, 0, 1, 1,
0.5645943, -0.5331244, 1.288147, 0.1921569, 0, 1, 1,
0.5670976, -0.5983948, 2.423207, 0.2, 0, 1, 1,
0.5674756, 0.8191717, -0.1209652, 0.2078431, 0, 1, 1,
0.57296, -0.115438, 1.790008, 0.2117647, 0, 1, 1,
0.5810991, 0.9840617, -1.615399, 0.2196078, 0, 1, 1,
0.5840722, -0.4679752, 2.213905, 0.2235294, 0, 1, 1,
0.5861704, 0.007459886, 3.075879, 0.2313726, 0, 1, 1,
0.5869097, -2.092768, 3.447999, 0.2352941, 0, 1, 1,
0.594146, -2.259591, 2.341905, 0.2431373, 0, 1, 1,
0.5957226, -0.9128109, 1.917718, 0.2470588, 0, 1, 1,
0.6005454, -1.427345, 0.7283658, 0.254902, 0, 1, 1,
0.604588, 1.162744, 2.421872, 0.2588235, 0, 1, 1,
0.6055732, 0.5994857, 0.1198688, 0.2666667, 0, 1, 1,
0.6099686, -1.59635, 1.618701, 0.2705882, 0, 1, 1,
0.6115551, -0.2647232, 1.233263, 0.2784314, 0, 1, 1,
0.6125749, -0.487903, 1.56818, 0.282353, 0, 1, 1,
0.6187039, -1.226968, 3.676589, 0.2901961, 0, 1, 1,
0.6238075, 0.008641087, 1.433647, 0.2941177, 0, 1, 1,
0.6277361, -0.7638879, 1.170233, 0.3019608, 0, 1, 1,
0.6285222, 1.319607, 0.7022844, 0.3098039, 0, 1, 1,
0.6294423, -0.1979399, 2.647843, 0.3137255, 0, 1, 1,
0.6327376, -0.3712622, -0.0218173, 0.3215686, 0, 1, 1,
0.6346502, 0.6121727, 2.555463, 0.3254902, 0, 1, 1,
0.6368295, -0.2105766, 1.215193, 0.3333333, 0, 1, 1,
0.6372602, -0.3344919, 1.334509, 0.3372549, 0, 1, 1,
0.6376479, -1.311602, 1.912989, 0.345098, 0, 1, 1,
0.6410306, -0.6521783, 2.780928, 0.3490196, 0, 1, 1,
0.6426728, -0.4487137, 2.611149, 0.3568628, 0, 1, 1,
0.6491705, 0.3217113, 2.716828, 0.3607843, 0, 1, 1,
0.6492139, -0.0272836, 2.875132, 0.3686275, 0, 1, 1,
0.6501637, 0.8586508, 0.5406407, 0.372549, 0, 1, 1,
0.6611257, -1.177644, 2.914685, 0.3803922, 0, 1, 1,
0.6614441, 0.3245942, 1.617072, 0.3843137, 0, 1, 1,
0.6657286, -3.554246, 2.037725, 0.3921569, 0, 1, 1,
0.6664349, -0.2099731, 2.38247, 0.3960784, 0, 1, 1,
0.6686023, 0.4050409, -0.473535, 0.4039216, 0, 1, 1,
0.6719036, -0.256359, 2.068373, 0.4117647, 0, 1, 1,
0.6723821, 0.3705344, 0.9050585, 0.4156863, 0, 1, 1,
0.6728817, 0.3398927, 0.5327926, 0.4235294, 0, 1, 1,
0.6731639, 0.675584, 0.8001491, 0.427451, 0, 1, 1,
0.6771151, 0.8487872, 1.467799, 0.4352941, 0, 1, 1,
0.6802484, 0.04035813, -0.2797834, 0.4392157, 0, 1, 1,
0.6908196, 0.0009165395, 0.6016175, 0.4470588, 0, 1, 1,
0.6915681, -0.3032628, 4.132922, 0.4509804, 0, 1, 1,
0.6954138, -0.7157854, 2.505184, 0.4588235, 0, 1, 1,
0.6976554, -0.617026, 2.476322, 0.4627451, 0, 1, 1,
0.6986058, -0.3044641, 0.03905746, 0.4705882, 0, 1, 1,
0.7007459, 1.031824, 1.19464, 0.4745098, 0, 1, 1,
0.7031448, 0.5721, 2.633193, 0.4823529, 0, 1, 1,
0.7076628, 0.2098307, 1.718208, 0.4862745, 0, 1, 1,
0.7120166, 0.6367962, -0.4723489, 0.4941176, 0, 1, 1,
0.712302, 0.05968411, 1.966292, 0.5019608, 0, 1, 1,
0.7147039, -0.5522095, 1.380448, 0.5058824, 0, 1, 1,
0.7237425, 0.3231182, 1.198584, 0.5137255, 0, 1, 1,
0.7241473, 1.085444, 2.396017, 0.5176471, 0, 1, 1,
0.7336829, -1.243228, 4.753732, 0.5254902, 0, 1, 1,
0.7351133, 1.203617, 1.439954, 0.5294118, 0, 1, 1,
0.7368618, -0.656611, 3.831608, 0.5372549, 0, 1, 1,
0.7378304, 1.443269, -0.6643882, 0.5411765, 0, 1, 1,
0.7394722, 0.6716687, -0.03708922, 0.5490196, 0, 1, 1,
0.7421946, 0.00816844, 1.857067, 0.5529412, 0, 1, 1,
0.7474517, 0.1969128, 3.137606, 0.5607843, 0, 1, 1,
0.7510985, 1.350681, 0.5342186, 0.5647059, 0, 1, 1,
0.7518488, 1.241979, 0.9710187, 0.572549, 0, 1, 1,
0.7522088, -0.1790632, 0.7986328, 0.5764706, 0, 1, 1,
0.7573171, -0.01787793, -0.2764342, 0.5843138, 0, 1, 1,
0.758791, -0.520433, -0.8028995, 0.5882353, 0, 1, 1,
0.7627782, -0.1352116, 1.143384, 0.5960785, 0, 1, 1,
0.7643481, 0.9427402, 1.402975, 0.6039216, 0, 1, 1,
0.7694091, 0.6580763, 0.8372324, 0.6078432, 0, 1, 1,
0.772082, -2.285054, 2.464629, 0.6156863, 0, 1, 1,
0.7759162, 0.2127703, 0.4170919, 0.6196079, 0, 1, 1,
0.7788973, 0.5442777, 0.7048304, 0.627451, 0, 1, 1,
0.7792536, 0.4437589, 1.548, 0.6313726, 0, 1, 1,
0.7900678, -0.473397, 1.898363, 0.6392157, 0, 1, 1,
0.7900851, 1.746146, -0.6540663, 0.6431373, 0, 1, 1,
0.7926291, 0.1394058, -0.7087597, 0.6509804, 0, 1, 1,
0.7947624, 0.7095965, 1.463844, 0.654902, 0, 1, 1,
0.7973588, -0.4759806, 2.652498, 0.6627451, 0, 1, 1,
0.8003622, 0.5287414, 1.546703, 0.6666667, 0, 1, 1,
0.8107183, -0.2886858, 2.338342, 0.6745098, 0, 1, 1,
0.8120372, 1.067866, -0.6194581, 0.6784314, 0, 1, 1,
0.8157448, -0.9522778, 2.565569, 0.6862745, 0, 1, 1,
0.8174817, -1.092147, 2.973074, 0.6901961, 0, 1, 1,
0.8204339, -0.06031464, -0.3945976, 0.6980392, 0, 1, 1,
0.8220152, 1.870333, 1.525432, 0.7058824, 0, 1, 1,
0.8287005, -1.282448, 2.421657, 0.7098039, 0, 1, 1,
0.8291376, -0.6594375, 1.900187, 0.7176471, 0, 1, 1,
0.8325823, -1.151803, 2.401042, 0.7215686, 0, 1, 1,
0.8341999, 1.056593, 1.570578, 0.7294118, 0, 1, 1,
0.8381935, 1.18776, 0.6482852, 0.7333333, 0, 1, 1,
0.8391163, 0.8479018, 0.2087788, 0.7411765, 0, 1, 1,
0.8401913, -0.2577055, 2.169344, 0.7450981, 0, 1, 1,
0.840408, -0.415879, 2.908476, 0.7529412, 0, 1, 1,
0.8505009, 1.179752, 1.090473, 0.7568628, 0, 1, 1,
0.8662605, -0.3699918, 2.034137, 0.7647059, 0, 1, 1,
0.870877, 1.622062, 0.5194263, 0.7686275, 0, 1, 1,
0.8728467, -0.3968577, 1.45557, 0.7764706, 0, 1, 1,
0.8728917, 0.8397506, 1.154264, 0.7803922, 0, 1, 1,
0.8746296, -1.346412, 3.11889, 0.7882353, 0, 1, 1,
0.8807943, -0.7180009, 1.325124, 0.7921569, 0, 1, 1,
0.8809618, -0.1969322, 1.039275, 0.8, 0, 1, 1,
0.8824303, -1.344317, 2.064872, 0.8078431, 0, 1, 1,
0.8883595, -0.1644333, 2.271143, 0.8117647, 0, 1, 1,
0.8893754, -1.97872, 2.14915, 0.8196079, 0, 1, 1,
0.8932232, -0.4499104, 1.852006, 0.8235294, 0, 1, 1,
0.8976699, -0.6902905, 1.786028, 0.8313726, 0, 1, 1,
0.9050641, 3.289322, -0.9691018, 0.8352941, 0, 1, 1,
0.9054209, 1.305875, -0.3695656, 0.8431373, 0, 1, 1,
0.9066425, 1.924999, 0.2711353, 0.8470588, 0, 1, 1,
0.9075227, -0.5848216, 0.7571538, 0.854902, 0, 1, 1,
0.9082786, -0.01634984, 1.041627, 0.8588235, 0, 1, 1,
0.9107749, 0.6012492, 0.7068412, 0.8666667, 0, 1, 1,
0.917553, -0.9663182, 2.343105, 0.8705882, 0, 1, 1,
0.9208664, -1.149684, 2.198503, 0.8784314, 0, 1, 1,
0.9252812, -0.514248, 2.935976, 0.8823529, 0, 1, 1,
0.9274799, 0.3700587, 1.359795, 0.8901961, 0, 1, 1,
0.9289954, 0.1681952, 2.285296, 0.8941177, 0, 1, 1,
0.9326544, -0.04365685, 2.59519, 0.9019608, 0, 1, 1,
0.9418106, 1.535395, 1.845436, 0.9098039, 0, 1, 1,
0.9429975, -0.9535652, 1.015692, 0.9137255, 0, 1, 1,
0.9466153, -0.8157202, 2.742288, 0.9215686, 0, 1, 1,
0.9625672, -0.2697897, 3.461746, 0.9254902, 0, 1, 1,
0.9767341, -0.1395245, 3.623752, 0.9333333, 0, 1, 1,
0.9796023, -1.313655, 3.278767, 0.9372549, 0, 1, 1,
0.9897294, 0.2328256, 2.622248, 0.945098, 0, 1, 1,
0.9907106, 0.4461597, 1.222095, 0.9490196, 0, 1, 1,
0.9913193, -0.7823422, 1.358559, 0.9568627, 0, 1, 1,
0.9966081, -1.301042, 1.849953, 0.9607843, 0, 1, 1,
1.000917, -0.2735573, 1.656658, 0.9686275, 0, 1, 1,
1.001478, 0.5778013, 0.4065462, 0.972549, 0, 1, 1,
1.016627, -1.858325, 2.869274, 0.9803922, 0, 1, 1,
1.017223, 0.5587696, 2.686796, 0.9843137, 0, 1, 1,
1.021754, 0.6607763, 0.5030687, 0.9921569, 0, 1, 1,
1.023838, -0.09875011, 0.8356386, 0.9960784, 0, 1, 1,
1.029602, -0.1764129, 2.931827, 1, 0, 0.9960784, 1,
1.031405, -0.6533101, 1.396788, 1, 0, 0.9882353, 1,
1.03737, 0.09595025, 0.3418502, 1, 0, 0.9843137, 1,
1.050737, -0.215886, 1.038654, 1, 0, 0.9764706, 1,
1.052931, -0.3751057, -0.190773, 1, 0, 0.972549, 1,
1.058711, 2.800038, 0.9209262, 1, 0, 0.9647059, 1,
1.068962, -0.4723934, 2.188504, 1, 0, 0.9607843, 1,
1.072002, 1.389813, -0.6596401, 1, 0, 0.9529412, 1,
1.077586, 0.7207195, -0.3652426, 1, 0, 0.9490196, 1,
1.083297, 0.05329655, 1.507474, 1, 0, 0.9411765, 1,
1.087181, -0.2601264, 2.397634, 1, 0, 0.9372549, 1,
1.093788, 0.04371136, 1.684868, 1, 0, 0.9294118, 1,
1.097143, -0.09787419, -0.3491785, 1, 0, 0.9254902, 1,
1.100574, -1.80207, 2.402536, 1, 0, 0.9176471, 1,
1.102762, -0.03968595, 1.290897, 1, 0, 0.9137255, 1,
1.111383, 0.3864963, 2.38521, 1, 0, 0.9058824, 1,
1.11361, 1.539406, -0.07914269, 1, 0, 0.9019608, 1,
1.118924, -0.5482683, 3.029356, 1, 0, 0.8941177, 1,
1.124239, 1.603008, -0.0542122, 1, 0, 0.8862745, 1,
1.124666, -0.7268073, 3.96911, 1, 0, 0.8823529, 1,
1.126686, -0.232626, 2.400092, 1, 0, 0.8745098, 1,
1.129546, 0.7565678, 1.624565, 1, 0, 0.8705882, 1,
1.13435, -0.6737864, 2.057993, 1, 0, 0.8627451, 1,
1.137239, -0.2060936, 1.926651, 1, 0, 0.8588235, 1,
1.140087, 1.284207, -2.205322, 1, 0, 0.8509804, 1,
1.143364, -0.5763662, 2.587029, 1, 0, 0.8470588, 1,
1.157708, 1.225576, -1.658336, 1, 0, 0.8392157, 1,
1.165717, -0.3644826, 3.713141, 1, 0, 0.8352941, 1,
1.175677, 0.7432881, 0.6041089, 1, 0, 0.827451, 1,
1.180984, 1.190512, 1.766822, 1, 0, 0.8235294, 1,
1.188131, -0.9688224, 1.474521, 1, 0, 0.8156863, 1,
1.189675, -0.3408525, 0.3308573, 1, 0, 0.8117647, 1,
1.196064, -0.4939334, 2.362143, 1, 0, 0.8039216, 1,
1.199238, 0.4658964, 1.120981, 1, 0, 0.7960784, 1,
1.203264, 1.662468, -0.5137181, 1, 0, 0.7921569, 1,
1.208496, -0.5092818, 2.212903, 1, 0, 0.7843137, 1,
1.219531, -0.9857571, 3.230443, 1, 0, 0.7803922, 1,
1.221463, -0.1021587, 1.553057, 1, 0, 0.772549, 1,
1.222523, -0.3722696, 1.935814, 1, 0, 0.7686275, 1,
1.22512, 0.09969278, 1.094475, 1, 0, 0.7607843, 1,
1.2267, 0.1174736, 2.833737, 1, 0, 0.7568628, 1,
1.228896, -0.9679248, 0.814708, 1, 0, 0.7490196, 1,
1.229269, 0.8990368, 0.6131412, 1, 0, 0.7450981, 1,
1.230158, 0.4227147, 1.263078, 1, 0, 0.7372549, 1,
1.231582, -0.4789948, 2.231938, 1, 0, 0.7333333, 1,
1.233497, -1.296138, 2.191979, 1, 0, 0.7254902, 1,
1.235373, -0.08045351, -0.0008995431, 1, 0, 0.7215686, 1,
1.245931, -0.2636043, 1.786275, 1, 0, 0.7137255, 1,
1.249473, -1.140813, 3.392541, 1, 0, 0.7098039, 1,
1.251952, -1.319757, 1.749737, 1, 0, 0.7019608, 1,
1.257648, 1.048099, 0.3384429, 1, 0, 0.6941177, 1,
1.258929, 0.9668739, 2.132014, 1, 0, 0.6901961, 1,
1.26128, 0.2799743, 2.243685, 1, 0, 0.682353, 1,
1.261512, -0.3176703, 1.333362, 1, 0, 0.6784314, 1,
1.26355, 0.5358705, 2.489466, 1, 0, 0.6705883, 1,
1.268544, 0.3894693, 1.424498, 1, 0, 0.6666667, 1,
1.275654, -0.9231675, 0.989468, 1, 0, 0.6588235, 1,
1.276666, 1.415199, 0.9693496, 1, 0, 0.654902, 1,
1.276972, 1.835964, 0.4476933, 1, 0, 0.6470588, 1,
1.287528, 0.5359339, 1.600795, 1, 0, 0.6431373, 1,
1.289047, -0.4077561, 1.520757, 1, 0, 0.6352941, 1,
1.290456, 0.7836568, 0.6431385, 1, 0, 0.6313726, 1,
1.294514, 0.7896864, 3.606914, 1, 0, 0.6235294, 1,
1.295952, 0.3744592, 0.3860372, 1, 0, 0.6196079, 1,
1.298769, -0.632665, 1.901251, 1, 0, 0.6117647, 1,
1.299919, 0.4833954, 0.7827542, 1, 0, 0.6078432, 1,
1.301612, -0.240209, 1.34826, 1, 0, 0.6, 1,
1.304035, -0.3076758, 0.09000416, 1, 0, 0.5921569, 1,
1.306788, 0.266908, 3.468785, 1, 0, 0.5882353, 1,
1.318781, -1.237611, 2.085941, 1, 0, 0.5803922, 1,
1.323114, 0.8531926, 2.223637, 1, 0, 0.5764706, 1,
1.327774, 0.8151256, 1.120219, 1, 0, 0.5686275, 1,
1.344184, 1.186022, 0.9788673, 1, 0, 0.5647059, 1,
1.368978, -1.087824, 4.227737, 1, 0, 0.5568628, 1,
1.371289, 0.175973, 2.440794, 1, 0, 0.5529412, 1,
1.384111, 0.03125716, 1.204491, 1, 0, 0.5450981, 1,
1.386455, 0.8655861, 1.172855, 1, 0, 0.5411765, 1,
1.387082, -0.7874637, 3.358279, 1, 0, 0.5333334, 1,
1.391565, 0.8315104, 1.275487, 1, 0, 0.5294118, 1,
1.398319, 0.8776716, -0.1624962, 1, 0, 0.5215687, 1,
1.400848, 0.2654298, 2.034078, 1, 0, 0.5176471, 1,
1.409225, -0.4055806, 2.593862, 1, 0, 0.509804, 1,
1.423801, 0.7051519, 1.947321, 1, 0, 0.5058824, 1,
1.43015, -0.6267667, 3.206782, 1, 0, 0.4980392, 1,
1.43124, 0.6894695, 0.8941042, 1, 0, 0.4901961, 1,
1.432367, 0.2687756, 1.924165, 1, 0, 0.4862745, 1,
1.43491, -0.8489509, 2.259215, 1, 0, 0.4784314, 1,
1.442925, 0.7225423, 2.044855, 1, 0, 0.4745098, 1,
1.460156, -0.1164103, 0.1972277, 1, 0, 0.4666667, 1,
1.463386, 0.03560035, 0.7321783, 1, 0, 0.4627451, 1,
1.468153, 0.8066771, 0.5366989, 1, 0, 0.454902, 1,
1.486809, 0.6064209, 2.186666, 1, 0, 0.4509804, 1,
1.489278, -0.1946777, 3.056684, 1, 0, 0.4431373, 1,
1.496865, -0.4461898, 1.669918, 1, 0, 0.4392157, 1,
1.507772, 1.197255, 2.482157, 1, 0, 0.4313726, 1,
1.517439, -0.7289437, 3.170222, 1, 0, 0.427451, 1,
1.519347, -0.250878, 1.418208, 1, 0, 0.4196078, 1,
1.523718, 0.1121385, 2.753004, 1, 0, 0.4156863, 1,
1.527215, 1.090982, 0.7869542, 1, 0, 0.4078431, 1,
1.535603, -0.7187812, 3.129093, 1, 0, 0.4039216, 1,
1.548978, 0.08716832, 1.948296, 1, 0, 0.3960784, 1,
1.552001, -0.7840396, 0.1853079, 1, 0, 0.3882353, 1,
1.560804, 0.4748973, 2.876974, 1, 0, 0.3843137, 1,
1.561956, 0.1051082, 0.2568684, 1, 0, 0.3764706, 1,
1.571381, -1.829619, 3.219215, 1, 0, 0.372549, 1,
1.584364, -1.132927, 2.869599, 1, 0, 0.3647059, 1,
1.608593, 1.283881, -0.01669983, 1, 0, 0.3607843, 1,
1.615365, 1.538224, -0.7368528, 1, 0, 0.3529412, 1,
1.618467, 0.1674152, 0.8454426, 1, 0, 0.3490196, 1,
1.619585, -0.8020601, 2.845496, 1, 0, 0.3411765, 1,
1.628033, -0.1103161, 2.669031, 1, 0, 0.3372549, 1,
1.639651, -1.298004, 3.482315, 1, 0, 0.3294118, 1,
1.656131, 1.6243, 1.247723, 1, 0, 0.3254902, 1,
1.666509, -2.43818, 2.42923, 1, 0, 0.3176471, 1,
1.666519, -0.5421114, 3.169591, 1, 0, 0.3137255, 1,
1.675086, -1.551564, 0.8429782, 1, 0, 0.3058824, 1,
1.678867, -2.346041, 1.706038, 1, 0, 0.2980392, 1,
1.684192, 0.07910296, 2.075887, 1, 0, 0.2941177, 1,
1.6855, -0.1521046, 2.265026, 1, 0, 0.2862745, 1,
1.703006, -0.5297122, 2.860374, 1, 0, 0.282353, 1,
1.743687, 0.1736695, 0.9307579, 1, 0, 0.2745098, 1,
1.765938, -0.5034847, 1.218641, 1, 0, 0.2705882, 1,
1.777287, -0.7677082, 0.8097842, 1, 0, 0.2627451, 1,
1.785459, 0.3766946, 0.8220465, 1, 0, 0.2588235, 1,
1.78558, -0.5768335, 2.916029, 1, 0, 0.2509804, 1,
1.786472, 0.8130578, 0.9169161, 1, 0, 0.2470588, 1,
1.810123, 0.6576751, 1.891097, 1, 0, 0.2392157, 1,
1.832093, 0.04380569, 2.140781, 1, 0, 0.2352941, 1,
1.888618, 0.9252449, 0.6316473, 1, 0, 0.227451, 1,
1.899588, 0.2029588, 2.180726, 1, 0, 0.2235294, 1,
1.901028, 0.05356232, 1.860829, 1, 0, 0.2156863, 1,
1.91342, -0.4167636, 1.24604, 1, 0, 0.2117647, 1,
1.927282, -0.1845092, 0.0743844, 1, 0, 0.2039216, 1,
1.92856, -2.43548, 3.673602, 1, 0, 0.1960784, 1,
1.964031, -1.134255, 3.747835, 1, 0, 0.1921569, 1,
1.964114, -0.8204955, 2.191694, 1, 0, 0.1843137, 1,
1.997258, 0.8718383, -0.4281156, 1, 0, 0.1803922, 1,
2.016042, 0.4620498, 0.899551, 1, 0, 0.172549, 1,
2.018776, 0.6254832, 0.295913, 1, 0, 0.1686275, 1,
2.020959, 1.186469, 1.132283, 1, 0, 0.1607843, 1,
2.021563, 0.7219122, 1.384095, 1, 0, 0.1568628, 1,
2.047048, -0.9242615, 2.77174, 1, 0, 0.1490196, 1,
2.05541, -1.294455, 0.9851294, 1, 0, 0.145098, 1,
2.063022, 0.1687087, 0.6623994, 1, 0, 0.1372549, 1,
2.070564, -0.8564765, 2.474956, 1, 0, 0.1333333, 1,
2.083471, 0.8358958, 0.6678668, 1, 0, 0.1254902, 1,
2.100557, -0.2287064, 1.749595, 1, 0, 0.1215686, 1,
2.108206, -0.7438295, 1.709724, 1, 0, 0.1137255, 1,
2.12352, -0.2418951, 1.321411, 1, 0, 0.1098039, 1,
2.128851, 0.06686616, 2.203867, 1, 0, 0.1019608, 1,
2.192848, 1.207595, 2.285929, 1, 0, 0.09411765, 1,
2.197405, -0.1779464, 2.165359, 1, 0, 0.09019608, 1,
2.212765, -0.1363391, 0.8301764, 1, 0, 0.08235294, 1,
2.247585, 0.4918278, 4.603308, 1, 0, 0.07843138, 1,
2.248726, 1.087991, 1.946999, 1, 0, 0.07058824, 1,
2.291448, -2.118795, 1.658224, 1, 0, 0.06666667, 1,
2.300592, 0.643728, 0.9120619, 1, 0, 0.05882353, 1,
2.374959, -0.3447111, 1.910774, 1, 0, 0.05490196, 1,
2.381617, -0.8857003, 1.063773, 1, 0, 0.04705882, 1,
2.391639, 0.5239528, 1.784314, 1, 0, 0.04313726, 1,
2.407627, -0.3789642, 3.114121, 1, 0, 0.03529412, 1,
2.679057, 0.07036466, 0.5687907, 1, 0, 0.03137255, 1,
2.690322, 1.758007, 1.72035, 1, 0, 0.02352941, 1,
2.705995, -1.111946, 2.878211, 1, 0, 0.01960784, 1,
2.928154, -0.6645097, 1.971437, 1, 0, 0.01176471, 1,
3.476945, 0.01374677, 1.172637, 1, 0, 0.007843138, 1
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
-0.3010943, -4.714231, -7.476477, 0, -0.5, 0.5, 0.5,
-0.3010943, -4.714231, -7.476477, 1, -0.5, 0.5, 0.5,
-0.3010943, -4.714231, -7.476477, 1, 1.5, 0.5, 0.5,
-0.3010943, -4.714231, -7.476477, 0, 1.5, 0.5, 0.5
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
-5.359889, -0.132462, -7.476477, 0, -0.5, 0.5, 0.5,
-5.359889, -0.132462, -7.476477, 1, -0.5, 0.5, 0.5,
-5.359889, -0.132462, -7.476477, 1, 1.5, 0.5, 0.5,
-5.359889, -0.132462, -7.476477, 0, 1.5, 0.5, 0.5
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
-5.359889, -4.714231, 0.1459334, 0, -0.5, 0.5, 0.5,
-5.359889, -4.714231, 0.1459334, 1, -0.5, 0.5, 0.5,
-5.359889, -4.714231, 0.1459334, 1, 1.5, 0.5, 0.5,
-5.359889, -4.714231, 0.1459334, 0, 1.5, 0.5, 0.5
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
-4, -3.656899, -5.717459,
2, -3.656899, -5.717459,
-4, -3.656899, -5.717459,
-4, -3.833121, -6.010629,
-2, -3.656899, -5.717459,
-2, -3.833121, -6.010629,
0, -3.656899, -5.717459,
0, -3.833121, -6.010629,
2, -3.656899, -5.717459,
2, -3.833121, -6.010629
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
"-4",
"-2",
"0",
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
-4, -4.185565, -6.596968, 0, -0.5, 0.5, 0.5,
-4, -4.185565, -6.596968, 1, -0.5, 0.5, 0.5,
-4, -4.185565, -6.596968, 1, 1.5, 0.5, 0.5,
-4, -4.185565, -6.596968, 0, 1.5, 0.5, 0.5,
-2, -4.185565, -6.596968, 0, -0.5, 0.5, 0.5,
-2, -4.185565, -6.596968, 1, -0.5, 0.5, 0.5,
-2, -4.185565, -6.596968, 1, 1.5, 0.5, 0.5,
-2, -4.185565, -6.596968, 0, 1.5, 0.5, 0.5,
0, -4.185565, -6.596968, 0, -0.5, 0.5, 0.5,
0, -4.185565, -6.596968, 1, -0.5, 0.5, 0.5,
0, -4.185565, -6.596968, 1, 1.5, 0.5, 0.5,
0, -4.185565, -6.596968, 0, 1.5, 0.5, 0.5,
2, -4.185565, -6.596968, 0, -0.5, 0.5, 0.5,
2, -4.185565, -6.596968, 1, -0.5, 0.5, 0.5,
2, -4.185565, -6.596968, 1, 1.5, 0.5, 0.5,
2, -4.185565, -6.596968, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.192475, -3, -5.717459,
-4.192475, 3, -5.717459,
-4.192475, -3, -5.717459,
-4.387043, -3, -6.010629,
-4.192475, -2, -5.717459,
-4.387043, -2, -6.010629,
-4.192475, -1, -5.717459,
-4.387043, -1, -6.010629,
-4.192475, 0, -5.717459,
-4.387043, 0, -6.010629,
-4.192475, 1, -5.717459,
-4.387043, 1, -6.010629,
-4.192475, 2, -5.717459,
-4.387043, 2, -6.010629,
-4.192475, 3, -5.717459,
-4.387043, 3, -6.010629
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
-4.776182, -3, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, -3, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, -3, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, -3, -6.596968, 0, 1.5, 0.5, 0.5,
-4.776182, -2, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, -2, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, -2, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, -2, -6.596968, 0, 1.5, 0.5, 0.5,
-4.776182, -1, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, -1, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, -1, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, -1, -6.596968, 0, 1.5, 0.5, 0.5,
-4.776182, 0, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, 0, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, 0, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, 0, -6.596968, 0, 1.5, 0.5, 0.5,
-4.776182, 1, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, 1, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, 1, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, 1, -6.596968, 0, 1.5, 0.5, 0.5,
-4.776182, 2, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, 2, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, 2, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, 2, -6.596968, 0, 1.5, 0.5, 0.5,
-4.776182, 3, -6.596968, 0, -0.5, 0.5, 0.5,
-4.776182, 3, -6.596968, 1, -0.5, 0.5, 0.5,
-4.776182, 3, -6.596968, 1, 1.5, 0.5, 0.5,
-4.776182, 3, -6.596968, 0, 1.5, 0.5, 0.5
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
-4.192475, -3.656899, -4,
-4.192475, -3.656899, 4,
-4.192475, -3.656899, -4,
-4.387043, -3.833121, -4,
-4.192475, -3.656899, -2,
-4.387043, -3.833121, -2,
-4.192475, -3.656899, 0,
-4.387043, -3.833121, 0,
-4.192475, -3.656899, 2,
-4.387043, -3.833121, 2,
-4.192475, -3.656899, 4,
-4.387043, -3.833121, 4
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
-4.776182, -4.185565, -4, 0, -0.5, 0.5, 0.5,
-4.776182, -4.185565, -4, 1, -0.5, 0.5, 0.5,
-4.776182, -4.185565, -4, 1, 1.5, 0.5, 0.5,
-4.776182, -4.185565, -4, 0, 1.5, 0.5, 0.5,
-4.776182, -4.185565, -2, 0, -0.5, 0.5, 0.5,
-4.776182, -4.185565, -2, 1, -0.5, 0.5, 0.5,
-4.776182, -4.185565, -2, 1, 1.5, 0.5, 0.5,
-4.776182, -4.185565, -2, 0, 1.5, 0.5, 0.5,
-4.776182, -4.185565, 0, 0, -0.5, 0.5, 0.5,
-4.776182, -4.185565, 0, 1, -0.5, 0.5, 0.5,
-4.776182, -4.185565, 0, 1, 1.5, 0.5, 0.5,
-4.776182, -4.185565, 0, 0, 1.5, 0.5, 0.5,
-4.776182, -4.185565, 2, 0, -0.5, 0.5, 0.5,
-4.776182, -4.185565, 2, 1, -0.5, 0.5, 0.5,
-4.776182, -4.185565, 2, 1, 1.5, 0.5, 0.5,
-4.776182, -4.185565, 2, 0, 1.5, 0.5, 0.5,
-4.776182, -4.185565, 4, 0, -0.5, 0.5, 0.5,
-4.776182, -4.185565, 4, 1, -0.5, 0.5, 0.5,
-4.776182, -4.185565, 4, 1, 1.5, 0.5, 0.5,
-4.776182, -4.185565, 4, 0, 1.5, 0.5, 0.5
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
-4.192475, -3.656899, -5.717459,
-4.192475, 3.391975, -5.717459,
-4.192475, -3.656899, 6.009326,
-4.192475, 3.391975, 6.009326,
-4.192475, -3.656899, -5.717459,
-4.192475, -3.656899, 6.009326,
-4.192475, 3.391975, -5.717459,
-4.192475, 3.391975, 6.009326,
-4.192475, -3.656899, -5.717459,
3.590286, -3.656899, -5.717459,
-4.192475, -3.656899, 6.009326,
3.590286, -3.656899, 6.009326,
-4.192475, 3.391975, -5.717459,
3.590286, 3.391975, -5.717459,
-4.192475, 3.391975, 6.009326,
3.590286, 3.391975, 6.009326,
3.590286, -3.656899, -5.717459,
3.590286, 3.391975, -5.717459,
3.590286, -3.656899, 6.009326,
3.590286, 3.391975, 6.009326,
3.590286, -3.656899, -5.717459,
3.590286, -3.656899, 6.009326,
3.590286, 3.391975, -5.717459,
3.590286, 3.391975, 6.009326
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
var radius = 8.405327;
var distance = 37.39625;
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
mvMatrix.translate( 0.3010943, 0.132462, -0.1459334 );
mvMatrix.scale( 1.16771, 1.289284, 0.7749784 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.39625);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Piperidine<-read.table("Piperidine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Piperidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Piperidine' not found
```

```r
y<-Piperidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Piperidine' not found
```

```r
z<-Piperidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Piperidine' not found
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
-4.079134, 0.6262805, -0.4719234, 0, 0, 1, 1, 1,
-3.257224, 0.6272563, -1.413488, 1, 0, 0, 1, 1,
-3.181071, -0.4024056, -2.421897, 1, 0, 0, 1, 1,
-2.851616, 1.304128, -1.362249, 1, 0, 0, 1, 1,
-2.776937, -0.5349439, -3.555668, 1, 0, 0, 1, 1,
-2.677246, -1.387437, -2.221886, 1, 0, 0, 1, 1,
-2.539174, 0.3035939, -2.909797, 0, 0, 0, 1, 1,
-2.531416, -0.1479669, -0.141918, 0, 0, 0, 1, 1,
-2.497359, -0.4913521, -1.028171, 0, 0, 0, 1, 1,
-2.467161, 0.1936931, -0.2630717, 0, 0, 0, 1, 1,
-2.281859, -0.3453661, -0.5260752, 0, 0, 0, 1, 1,
-2.248085, -2.411477, -1.665687, 0, 0, 0, 1, 1,
-2.228009, -0.493513, -2.665166, 0, 0, 0, 1, 1,
-2.109642, -0.05477843, -3.656005, 1, 1, 1, 1, 1,
-2.070344, -0.3906856, 0.28231, 1, 1, 1, 1, 1,
-2.066087, 0.2488729, -2.217227, 1, 1, 1, 1, 1,
-2.052526, -1.263953, -1.982259, 1, 1, 1, 1, 1,
-2.044009, -1.839297, -2.608172, 1, 1, 1, 1, 1,
-2.034051, -0.6044942, -2.647648, 1, 1, 1, 1, 1,
-1.994568, -2.331535, -4.946851, 1, 1, 1, 1, 1,
-1.967818, -0.005403302, -2.437283, 1, 1, 1, 1, 1,
-1.934676, 2.834947, 0.3707691, 1, 1, 1, 1, 1,
-1.928511, 1.531403, -1.41904, 1, 1, 1, 1, 1,
-1.917522, 0.210996, -2.956051, 1, 1, 1, 1, 1,
-1.896886, -1.183208, -0.2356901, 1, 1, 1, 1, 1,
-1.871177, 0.9089857, -2.294353, 1, 1, 1, 1, 1,
-1.853026, -0.2989058, -2.106478, 1, 1, 1, 1, 1,
-1.830675, -0.3608375, -0.8308983, 1, 1, 1, 1, 1,
-1.824927, 2.316809, -1.671802, 0, 0, 1, 1, 1,
-1.817392, 0.6768786, -2.779115, 1, 0, 0, 1, 1,
-1.816478, 0.6994051, 0.3404681, 1, 0, 0, 1, 1,
-1.808404, -0.8907188, -3.085039, 1, 0, 0, 1, 1,
-1.77484, -0.7746553, -1.326662, 1, 0, 0, 1, 1,
-1.764467, 0.07055238, -0.3630054, 1, 0, 0, 1, 1,
-1.762428, -1.424255, -3.324119, 0, 0, 0, 1, 1,
-1.758477, -0.1934026, -3.890115, 0, 0, 0, 1, 1,
-1.745636, -1.465926, -1.691681, 0, 0, 0, 1, 1,
-1.733944, 0.8175814, 0.1503511, 0, 0, 0, 1, 1,
-1.6747, -2.905895, -1.44402, 0, 0, 0, 1, 1,
-1.674693, 1.127138, -1.695603, 0, 0, 0, 1, 1,
-1.661547, 0.2852061, -2.548534, 0, 0, 0, 1, 1,
-1.65272, -1.241196, -2.374417, 1, 1, 1, 1, 1,
-1.644348, -0.3588759, -0.7803906, 1, 1, 1, 1, 1,
-1.613953, 2.085919, -1.145944, 1, 1, 1, 1, 1,
-1.611332, 0.702837, 0.2357061, 1, 1, 1, 1, 1,
-1.587705, -1.197333, -3.626761, 1, 1, 1, 1, 1,
-1.58502, 1.30384, -1.112823, 1, 1, 1, 1, 1,
-1.583604, 0.4145395, -1.755623, 1, 1, 1, 1, 1,
-1.579667, 0.04633478, -1.809117, 1, 1, 1, 1, 1,
-1.568293, 1.165743, -0.6180959, 1, 1, 1, 1, 1,
-1.505261, -0.5614287, -3.089461, 1, 1, 1, 1, 1,
-1.501641, 0.124778, 0.7517788, 1, 1, 1, 1, 1,
-1.49503, 1.137568, -1.629175, 1, 1, 1, 1, 1,
-1.467798, -1.6875, -4.466288, 1, 1, 1, 1, 1,
-1.465921, -2.08336, -3.36385, 1, 1, 1, 1, 1,
-1.464863, -0.1792549, -1.401532, 1, 1, 1, 1, 1,
-1.464261, 0.8263157, 0.4131713, 0, 0, 1, 1, 1,
-1.463335, -0.9820012, -1.433646, 1, 0, 0, 1, 1,
-1.46209, 0.8051242, 0.4202225, 1, 0, 0, 1, 1,
-1.460571, -0.8060861, -3.750178, 1, 0, 0, 1, 1,
-1.458374, -2.083266, -1.313899, 1, 0, 0, 1, 1,
-1.452029, -0.6684452, -4.371079, 1, 0, 0, 1, 1,
-1.45064, 1.106305, -1.097684, 0, 0, 0, 1, 1,
-1.440462, -1.108707, -1.093011, 0, 0, 0, 1, 1,
-1.429679, -0.6498953, -3.266449, 0, 0, 0, 1, 1,
-1.420709, -0.536118, -2.285913, 0, 0, 0, 1, 1,
-1.414768, 1.173299, -0.1572981, 0, 0, 0, 1, 1,
-1.410139, -1.200817, -1.792131, 0, 0, 0, 1, 1,
-1.400962, -0.5240347, -0.7758415, 0, 0, 0, 1, 1,
-1.387728, 0.2868469, -1.084702, 1, 1, 1, 1, 1,
-1.383962, -1.322259, -0.4551331, 1, 1, 1, 1, 1,
-1.380833, -1.025722, -2.800356, 1, 1, 1, 1, 1,
-1.366117, 0.9097204, -0.9528601, 1, 1, 1, 1, 1,
-1.361292, -0.07795701, -2.43857, 1, 1, 1, 1, 1,
-1.358956, 0.5842867, -0.8442097, 1, 1, 1, 1, 1,
-1.353461, -2.860912, -3.892375, 1, 1, 1, 1, 1,
-1.349111, 2.093935, 0.1814209, 1, 1, 1, 1, 1,
-1.338869, 0.9653599, -0.1584247, 1, 1, 1, 1, 1,
-1.332375, 0.1836094, -1.650887, 1, 1, 1, 1, 1,
-1.32598, -0.4268986, -1.47982, 1, 1, 1, 1, 1,
-1.324344, -0.1367006, -2.009135, 1, 1, 1, 1, 1,
-1.316612, 0.03100263, -2.390453, 1, 1, 1, 1, 1,
-1.312446, 0.3626266, -1.797963, 1, 1, 1, 1, 1,
-1.299337, 0.9999192, 0.7177627, 1, 1, 1, 1, 1,
-1.293218, -0.1803604, -2.524907, 0, 0, 1, 1, 1,
-1.291471, 0.6343783, -0.8361296, 1, 0, 0, 1, 1,
-1.284032, -1.015838, -2.28053, 1, 0, 0, 1, 1,
-1.279009, -0.7666656, -0.4952654, 1, 0, 0, 1, 1,
-1.278828, -0.4647506, -1.45893, 1, 0, 0, 1, 1,
-1.27771, -0.04697537, -2.749798, 1, 0, 0, 1, 1,
-1.276767, 1.007324, -1.891453, 0, 0, 0, 1, 1,
-1.275733, 0.3148975, -1.147913, 0, 0, 0, 1, 1,
-1.266909, 0.6939779, -0.6404185, 0, 0, 0, 1, 1,
-1.266606, 0.6531127, -1.915486, 0, 0, 0, 1, 1,
-1.265967, -0.5108039, -1.090085, 0, 0, 0, 1, 1,
-1.263173, -0.5009739, -1.976369, 0, 0, 0, 1, 1,
-1.260453, -0.9070141, -2.083088, 0, 0, 0, 1, 1,
-1.259855, 0.6012344, -0.7707649, 1, 1, 1, 1, 1,
-1.258872, 0.5273876, -0.8122675, 1, 1, 1, 1, 1,
-1.257865, -0.1687831, -1.413592, 1, 1, 1, 1, 1,
-1.255856, -0.7760329, -1.134377, 1, 1, 1, 1, 1,
-1.24432, -2.408123, -3.222599, 1, 1, 1, 1, 1,
-1.240468, 0.679171, 0.875409, 1, 1, 1, 1, 1,
-1.239355, 0.8733046, 0.2121514, 1, 1, 1, 1, 1,
-1.232801, -0.5301185, -0.9843661, 1, 1, 1, 1, 1,
-1.21795, 0.4289011, -2.210153, 1, 1, 1, 1, 1,
-1.214608, 0.1190021, -0.8018546, 1, 1, 1, 1, 1,
-1.213763, -0.8591678, -1.868684, 1, 1, 1, 1, 1,
-1.208635, 1.04955, 0.2770651, 1, 1, 1, 1, 1,
-1.206436, 1.47049, 0.5505411, 1, 1, 1, 1, 1,
-1.199938, 0.2444161, -1.927961, 1, 1, 1, 1, 1,
-1.19905, -2.17589, -3.719674, 1, 1, 1, 1, 1,
-1.197825, 0.9655775, -0.4987762, 0, 0, 1, 1, 1,
-1.195158, 0.8620924, -2.190226, 1, 0, 0, 1, 1,
-1.190394, -0.7815453, -1.02277, 1, 0, 0, 1, 1,
-1.184134, -0.6694427, -3.100467, 1, 0, 0, 1, 1,
-1.18309, 0.3076865, -2.123247, 1, 0, 0, 1, 1,
-1.182225, -0.04436187, -2.343586, 1, 0, 0, 1, 1,
-1.179684, -0.6263961, -1.626579, 0, 0, 0, 1, 1,
-1.176052, 1.090817, -0.9347716, 0, 0, 0, 1, 1,
-1.173664, -0.1347609, -2.858647, 0, 0, 0, 1, 1,
-1.172926, 0.9814601, -1.760238, 0, 0, 0, 1, 1,
-1.170048, 0.4298713, -0.9159451, 0, 0, 0, 1, 1,
-1.163203, -1.199415, -1.4285, 0, 0, 0, 1, 1,
-1.157767, 0.3405164, -1.995985, 0, 0, 0, 1, 1,
-1.155052, 2.707848, -2.050243, 1, 1, 1, 1, 1,
-1.154076, -0.2791581, -3.073283, 1, 1, 1, 1, 1,
-1.143569, -0.4514878, -2.477751, 1, 1, 1, 1, 1,
-1.143036, -0.09075604, -0.6848634, 1, 1, 1, 1, 1,
-1.136958, -0.2081695, -0.7395562, 1, 1, 1, 1, 1,
-1.135119, 2.64185, -1.166633, 1, 1, 1, 1, 1,
-1.134353, 0.2664237, -2.07619, 1, 1, 1, 1, 1,
-1.131941, 0.3044816, -2.495471, 1, 1, 1, 1, 1,
-1.130235, -0.1139912, -2.043615, 1, 1, 1, 1, 1,
-1.128224, -1.12808, -2.255607, 1, 1, 1, 1, 1,
-1.126401, -0.3562146, -2.522363, 1, 1, 1, 1, 1,
-1.125031, -1.673553, -1.051481, 1, 1, 1, 1, 1,
-1.122174, -1.51022, -2.90185, 1, 1, 1, 1, 1,
-1.112417, 0.01914406, -1.373285, 1, 1, 1, 1, 1,
-1.111923, -0.8233538, -0.8489441, 1, 1, 1, 1, 1,
-1.109616, -1.796032, -1.634489, 0, 0, 1, 1, 1,
-1.103568, 0.6301287, -0.6972327, 1, 0, 0, 1, 1,
-1.092462, -0.6956713, -2.333239, 1, 0, 0, 1, 1,
-1.088576, -0.5050285, -2.229999, 1, 0, 0, 1, 1,
-1.079901, -0.2541969, -2.411525, 1, 0, 0, 1, 1,
-1.072594, 1.080615, -2.675992, 1, 0, 0, 1, 1,
-1.069666, 0.3927078, -0.100848, 0, 0, 0, 1, 1,
-1.065796, 0.1082959, 0.6435426, 0, 0, 0, 1, 1,
-1.058604, 0.1088339, -3.185572, 0, 0, 0, 1, 1,
-1.056594, 0.4121833, 0.7719966, 0, 0, 0, 1, 1,
-1.045786, 0.1919981, -1.439251, 0, 0, 0, 1, 1,
-1.039589, -0.04226975, -2.06563, 0, 0, 0, 1, 1,
-1.034906, -1.078554, -3.089174, 0, 0, 0, 1, 1,
-1.032185, 1.479998, 1.386619, 1, 1, 1, 1, 1,
-1.022803, -1.755237, -3.976158, 1, 1, 1, 1, 1,
-1.021721, 0.04841924, -2.476591, 1, 1, 1, 1, 1,
-1.020453, -0.3576763, -2.701824, 1, 1, 1, 1, 1,
-1.015316, -0.671568, -0.8281461, 1, 1, 1, 1, 1,
-1.01528, 0.05750509, -2.755622, 1, 1, 1, 1, 1,
-1.011832, 1.350307, 0.72017, 1, 1, 1, 1, 1,
-1.0081, -0.16472, -5.54668, 1, 1, 1, 1, 1,
-1.000901, -1.293564, -1.425015, 1, 1, 1, 1, 1,
-0.9943383, 0.4635623, 1.095997, 1, 1, 1, 1, 1,
-0.9909447, 0.9371057, -1.55034, 1, 1, 1, 1, 1,
-0.990745, -1.015818, -4.223872, 1, 1, 1, 1, 1,
-0.9893637, -1.885582, -3.627324, 1, 1, 1, 1, 1,
-0.985944, 0.8356266, -0.7667766, 1, 1, 1, 1, 1,
-0.9740976, -0.3346033, -3.413701, 1, 1, 1, 1, 1,
-0.9723355, 1.117068, 0.11907, 0, 0, 1, 1, 1,
-0.9615763, 1.362061, -1.498947, 1, 0, 0, 1, 1,
-0.9570591, -0.7853972, -2.011733, 1, 0, 0, 1, 1,
-0.9560063, 0.6901591, 0.7254922, 1, 0, 0, 1, 1,
-0.9443817, -1.022078, -2.187511, 1, 0, 0, 1, 1,
-0.9442958, -1.140465, -2.269085, 1, 0, 0, 1, 1,
-0.9315853, -0.4786673, -0.9375517, 0, 0, 0, 1, 1,
-0.9278139, 0.8591877, 0.1603252, 0, 0, 0, 1, 1,
-0.9227893, -0.03033756, -1.304485, 0, 0, 0, 1, 1,
-0.900703, -0.6323341, -1.983952, 0, 0, 0, 1, 1,
-0.8948939, -1.034971, -2.072027, 0, 0, 0, 1, 1,
-0.8931845, 0.1132834, -2.294728, 0, 0, 0, 1, 1,
-0.8930037, 1.230629, 0.5345528, 0, 0, 0, 1, 1,
-0.8911809, 1.169675, -0.4619044, 1, 1, 1, 1, 1,
-0.8834122, -1.565011, -2.726104, 1, 1, 1, 1, 1,
-0.8698133, -1.114762, -2.857779, 1, 1, 1, 1, 1,
-0.8685017, -1.734504, -2.419066, 1, 1, 1, 1, 1,
-0.8666636, -0.2391818, -1.862946, 1, 1, 1, 1, 1,
-0.861584, -0.2285483, -1.632902, 1, 1, 1, 1, 1,
-0.860694, -0.5723447, -4.039108, 1, 1, 1, 1, 1,
-0.8562158, 0.1321221, -2.20352, 1, 1, 1, 1, 1,
-0.8529904, -1.897165, -3.358684, 1, 1, 1, 1, 1,
-0.8482922, -0.634019, -1.516967, 1, 1, 1, 1, 1,
-0.8404209, -0.02692351, 0.338091, 1, 1, 1, 1, 1,
-0.8383222, -1.278711, -3.023254, 1, 1, 1, 1, 1,
-0.8325328, 0.1807405, -3.237016, 1, 1, 1, 1, 1,
-0.8294452, -1.385038, -1.423717, 1, 1, 1, 1, 1,
-0.8257973, 1.118172, 0.2156398, 1, 1, 1, 1, 1,
-0.8237228, -0.4594785, -2.725595, 0, 0, 1, 1, 1,
-0.8213636, 0.7317734, -0.04598975, 1, 0, 0, 1, 1,
-0.8130144, 0.131516, -1.551024, 1, 0, 0, 1, 1,
-0.8121049, -0.6338904, -0.4970078, 1, 0, 0, 1, 1,
-0.8040908, -0.2015167, -3.088747, 1, 0, 0, 1, 1,
-0.8012607, -0.6940203, -2.240237, 1, 0, 0, 1, 1,
-0.8007752, -0.4847405, -4.156828, 0, 0, 0, 1, 1,
-0.7928787, 0.1098468, -0.01084687, 0, 0, 0, 1, 1,
-0.7878667, 0.1998225, -2.304561, 0, 0, 0, 1, 1,
-0.7855622, -0.5250004, -0.5748831, 0, 0, 0, 1, 1,
-0.7833705, 0.09281421, -4.15133, 0, 0, 0, 1, 1,
-0.7648515, -0.9902096, -1.841187, 0, 0, 0, 1, 1,
-0.7637547, 1.245642, -0.711324, 0, 0, 0, 1, 1,
-0.7637162, -0.1086368, -0.5102996, 1, 1, 1, 1, 1,
-0.7630677, -1.276575, -1.258024, 1, 1, 1, 1, 1,
-0.7546026, 1.171374, 0.843259, 1, 1, 1, 1, 1,
-0.7520426, -1.022103, -2.008425, 1, 1, 1, 1, 1,
-0.7519264, -1.453911, -4.379057, 1, 1, 1, 1, 1,
-0.7502595, 0.4242426, -2.463048, 1, 1, 1, 1, 1,
-0.7453073, -1.027771, -2.837314, 1, 1, 1, 1, 1,
-0.74013, -0.07071581, -1.087284, 1, 1, 1, 1, 1,
-0.735736, 1.269038, -0.2559958, 1, 1, 1, 1, 1,
-0.7341942, 1.497206, -1.727838, 1, 1, 1, 1, 1,
-0.7331842, 0.6256375, -0.676306, 1, 1, 1, 1, 1,
-0.7306547, -0.2455963, 0.4405307, 1, 1, 1, 1, 1,
-0.7197849, -0.1990729, -1.384484, 1, 1, 1, 1, 1,
-0.7142804, 1.249307, -0.5801281, 1, 1, 1, 1, 1,
-0.7069536, -0.7129142, -2.297103, 1, 1, 1, 1, 1,
-0.7048576, 1.937752, -1.355448, 0, 0, 1, 1, 1,
-0.7032765, 1.536455, 0.4526529, 1, 0, 0, 1, 1,
-0.7032626, 0.2875723, -2.333523, 1, 0, 0, 1, 1,
-0.7026047, 0.2279537, -0.3796777, 1, 0, 0, 1, 1,
-0.702585, -1.173683, -2.499331, 1, 0, 0, 1, 1,
-0.7001341, -0.4601622, -4.094417, 1, 0, 0, 1, 1,
-0.69963, -0.1712575, -3.312992, 0, 0, 0, 1, 1,
-0.6927508, 1.261256, -0.3958504, 0, 0, 0, 1, 1,
-0.6887863, -0.8962883, -1.444575, 0, 0, 0, 1, 1,
-0.6868545, 0.1004552, -0.5902638, 0, 0, 0, 1, 1,
-0.6818738, 1.378275, -0.1600156, 0, 0, 0, 1, 1,
-0.6818168, -0.8308449, -2.69759, 0, 0, 0, 1, 1,
-0.6812996, -1.498173, -2.705227, 0, 0, 0, 1, 1,
-0.6811564, -0.8142015, -0.8875381, 1, 1, 1, 1, 1,
-0.6807575, 0.1176993, -1.472569, 1, 1, 1, 1, 1,
-0.6775498, 0.9249989, -0.2992646, 1, 1, 1, 1, 1,
-0.6772985, 0.2849437, -2.367405, 1, 1, 1, 1, 1,
-0.6715276, -1.102754, -1.509466, 1, 1, 1, 1, 1,
-0.6712161, 0.8980407, -2.255228, 1, 1, 1, 1, 1,
-0.6661202, 1.51464, 0.5150166, 1, 1, 1, 1, 1,
-0.6497658, -0.4339535, -2.246855, 1, 1, 1, 1, 1,
-0.6489262, 0.4307005, -0.1427592, 1, 1, 1, 1, 1,
-0.6436557, -1.624321, -2.554321, 1, 1, 1, 1, 1,
-0.6431912, -0.6312976, -2.898083, 1, 1, 1, 1, 1,
-0.6409907, -0.3128183, -3.027905, 1, 1, 1, 1, 1,
-0.6315218, -0.197507, -0.377314, 1, 1, 1, 1, 1,
-0.6300059, -0.04332011, -0.7741067, 1, 1, 1, 1, 1,
-0.6289964, -2.575965, -2.49081, 1, 1, 1, 1, 1,
-0.6285738, -0.4953734, -3.198979, 0, 0, 1, 1, 1,
-0.6205984, 1.99506, 0.8887523, 1, 0, 0, 1, 1,
-0.6202764, -0.05242668, -1.977779, 1, 0, 0, 1, 1,
-0.6183386, -0.6961293, -2.951591, 1, 0, 0, 1, 1,
-0.6157655, 0.7986174, 0.3277551, 1, 0, 0, 1, 1,
-0.6144978, 1.416458, 1.684023, 1, 0, 0, 1, 1,
-0.6120905, 1.72524, 1.128957, 0, 0, 0, 1, 1,
-0.6090957, 0.5798441, -2.328124, 0, 0, 0, 1, 1,
-0.6053481, 0.1671985, -2.612854, 0, 0, 0, 1, 1,
-0.6007129, -1.800413, -1.706316, 0, 0, 0, 1, 1,
-0.5997366, 1.602481, 0.3217001, 0, 0, 0, 1, 1,
-0.5926204, -0.9496416, -3.656391, 0, 0, 0, 1, 1,
-0.5921138, 0.6156989, 0.2866338, 0, 0, 0, 1, 1,
-0.5914037, 0.5468962, -0.423737, 1, 1, 1, 1, 1,
-0.5900185, -1.497359, -3.704934, 1, 1, 1, 1, 1,
-0.5800154, 0.9059042, -1.813668, 1, 1, 1, 1, 1,
-0.5797366, 0.3097172, -1.853751, 1, 1, 1, 1, 1,
-0.5739347, 0.2116897, -2.866844, 1, 1, 1, 1, 1,
-0.571642, 0.5621945, 0.2561749, 1, 1, 1, 1, 1,
-0.566964, -0.2432615, -2.77645, 1, 1, 1, 1, 1,
-0.565544, 0.2498731, -1.725741, 1, 1, 1, 1, 1,
-0.5641846, 1.22147, -0.2958706, 1, 1, 1, 1, 1,
-0.5632988, -0.6480844, -0.7455624, 1, 1, 1, 1, 1,
-0.5535219, 0.5388796, -2.174808, 1, 1, 1, 1, 1,
-0.5490209, -0.96325, -3.377419, 1, 1, 1, 1, 1,
-0.5476803, 0.7418365, -0.4582275, 1, 1, 1, 1, 1,
-0.5458507, 0.3444078, -1.549881, 1, 1, 1, 1, 1,
-0.5447462, -0.2733674, -1.856294, 1, 1, 1, 1, 1,
-0.5298504, -0.5368883, -0.5388735, 0, 0, 1, 1, 1,
-0.5275331, -0.2059138, -4.03725, 1, 0, 0, 1, 1,
-0.5227116, 1.321377, -1.456984, 1, 0, 0, 1, 1,
-0.5221791, -1.201499, -2.08343, 1, 0, 0, 1, 1,
-0.5165607, -1.56362, -4.637106, 1, 0, 0, 1, 1,
-0.5094646, -1.97565, -3.622441, 1, 0, 0, 1, 1,
-0.5054069, 0.8526523, -1.519151, 0, 0, 0, 1, 1,
-0.5008146, 1.449783, -2.116724, 0, 0, 0, 1, 1,
-0.497822, -0.1562063, -0.4338047, 0, 0, 0, 1, 1,
-0.4962186, -0.9694319, -2.167474, 0, 0, 0, 1, 1,
-0.4944582, -1.233242, -2.801676, 0, 0, 0, 1, 1,
-0.4933453, 0.614934, -1.055242, 0, 0, 0, 1, 1,
-0.4836041, -0.4967092, -0.3440317, 0, 0, 0, 1, 1,
-0.477479, -0.2200761, -1.951879, 1, 1, 1, 1, 1,
-0.4768659, 1.737353, -0.1971662, 1, 1, 1, 1, 1,
-0.4761264, 0.3065376, -0.9996167, 1, 1, 1, 1, 1,
-0.4760217, 0.7793302, 0.3920438, 1, 1, 1, 1, 1,
-0.4745452, -0.8199771, -4.752609, 1, 1, 1, 1, 1,
-0.4742907, -1.734843, -4.160691, 1, 1, 1, 1, 1,
-0.4661724, -0.3651017, -1.351723, 1, 1, 1, 1, 1,
-0.4649215, -1.232429, -1.448353, 1, 1, 1, 1, 1,
-0.4641066, -1.329834, -3.054322, 1, 1, 1, 1, 1,
-0.4617134, -0.3590309, -1.584366, 1, 1, 1, 1, 1,
-0.4595659, -1.040015, -3.820343, 1, 1, 1, 1, 1,
-0.4574526, -0.9838933, -2.615795, 1, 1, 1, 1, 1,
-0.4570273, 0.5171717, -0.1641332, 1, 1, 1, 1, 1,
-0.4532507, 0.7622918, -0.3908121, 1, 1, 1, 1, 1,
-0.4523432, -0.4577912, -0.2463183, 1, 1, 1, 1, 1,
-0.4482499, -0.2602378, -1.508119, 0, 0, 1, 1, 1,
-0.4476674, -0.009024648, -1.581391, 1, 0, 0, 1, 1,
-0.4465933, -0.5106395, -1.603035, 1, 0, 0, 1, 1,
-0.4461283, -0.01233334, -2.856972, 1, 0, 0, 1, 1,
-0.4457474, 0.4075194, -2.77227, 1, 0, 0, 1, 1,
-0.44476, -0.3460993, -2.476306, 1, 0, 0, 1, 1,
-0.4371742, 0.06362499, -0.4129143, 0, 0, 0, 1, 1,
-0.4330422, -0.5487817, -1.12723, 0, 0, 0, 1, 1,
-0.4284801, 1.27409, -0.04374254, 0, 0, 0, 1, 1,
-0.4242916, -1.297741, -3.080096, 0, 0, 0, 1, 1,
-0.4241574, 1.388848, 0.5115975, 0, 0, 0, 1, 1,
-0.4237068, -0.1817951, -0.2052088, 0, 0, 0, 1, 1,
-0.4224016, -1.119153, -2.305943, 0, 0, 0, 1, 1,
-0.422272, -1.448315, -2.459337, 1, 1, 1, 1, 1,
-0.4195472, -1.920511, -5.07312, 1, 1, 1, 1, 1,
-0.4158908, 1.194284, -0.008317797, 1, 1, 1, 1, 1,
-0.4133277, -0.7857238, -1.115903, 1, 1, 1, 1, 1,
-0.4132929, 0.7038084, -1.74523, 1, 1, 1, 1, 1,
-0.4123327, 0.514276, -0.1738435, 1, 1, 1, 1, 1,
-0.4109201, 0.7112978, 0.03814872, 1, 1, 1, 1, 1,
-0.4094242, -0.1245721, -2.870361, 1, 1, 1, 1, 1,
-0.4092928, 0.329338, -2.250406, 1, 1, 1, 1, 1,
-0.4088495, -1.260468, -2.298756, 1, 1, 1, 1, 1,
-0.4079878, 0.7162796, -1.135346, 1, 1, 1, 1, 1,
-0.4078469, 0.5586078, -1.951177, 1, 1, 1, 1, 1,
-0.4068091, 0.2981352, 0.2697622, 1, 1, 1, 1, 1,
-0.4062493, 0.4191575, -1.685418, 1, 1, 1, 1, 1,
-0.4060613, -0.9833714, -2.605199, 1, 1, 1, 1, 1,
-0.4040428, -1.706858, -2.552351, 0, 0, 1, 1, 1,
-0.3954617, -1.319881, -2.618226, 1, 0, 0, 1, 1,
-0.3939066, 0.225492, -0.9469138, 1, 0, 0, 1, 1,
-0.3918636, 0.7257853, 0.5775592, 1, 0, 0, 1, 1,
-0.3898974, -0.3817546, -4.062051, 1, 0, 0, 1, 1,
-0.3889783, 1.162116, -1.273362, 1, 0, 0, 1, 1,
-0.3874035, 0.3253998, -1.558777, 0, 0, 0, 1, 1,
-0.3852983, 0.2891546, -0.9462474, 0, 0, 0, 1, 1,
-0.381686, 0.3865154, 0.1971495, 0, 0, 0, 1, 1,
-0.3739674, 0.108296, -0.8068644, 0, 0, 0, 1, 1,
-0.3704218, 0.09041283, -1.69615, 0, 0, 0, 1, 1,
-0.3625469, -0.4818316, -2.012616, 0, 0, 0, 1, 1,
-0.3606616, -0.973814, -1.955533, 0, 0, 0, 1, 1,
-0.3532414, -0.3931524, -2.316532, 1, 1, 1, 1, 1,
-0.3514789, 1.450157, -0.7920422, 1, 1, 1, 1, 1,
-0.350906, -1.216451, -3.582239, 1, 1, 1, 1, 1,
-0.3500029, -0.5400482, -2.270031, 1, 1, 1, 1, 1,
-0.3489816, -0.5348679, -2.9964, 1, 1, 1, 1, 1,
-0.3474225, 0.396385, -2.763716, 1, 1, 1, 1, 1,
-0.3371752, -0.4664326, -1.665201, 1, 1, 1, 1, 1,
-0.3344809, 0.3793377, -0.9152905, 1, 1, 1, 1, 1,
-0.3333059, -1.583053, -3.216632, 1, 1, 1, 1, 1,
-0.3306255, -0.4710398, -2.448432, 1, 1, 1, 1, 1,
-0.3248287, -0.2747338, -3.922078, 1, 1, 1, 1, 1,
-0.3233113, -0.5943365, -2.288619, 1, 1, 1, 1, 1,
-0.3192053, -1.046933, -2.737977, 1, 1, 1, 1, 1,
-0.319149, 0.255577, -1.25836, 1, 1, 1, 1, 1,
-0.3163828, 0.904191, -2.616409, 1, 1, 1, 1, 1,
-0.3115664, 1.773956, -1.377987, 0, 0, 1, 1, 1,
-0.3108058, 0.8613193, 0.05366353, 1, 0, 0, 1, 1,
-0.3083831, 0.2484942, -1.771162, 1, 0, 0, 1, 1,
-0.3083471, 2.155332, -0.0862933, 1, 0, 0, 1, 1,
-0.3031813, 1.176269, -1.649578, 1, 0, 0, 1, 1,
-0.3011349, 0.3105389, -1.22893, 1, 0, 0, 1, 1,
-0.3005713, -0.734974, -4.899201, 0, 0, 0, 1, 1,
-0.296787, -0.9796914, -3.228862, 0, 0, 0, 1, 1,
-0.2956762, 2.437668, 1.138941, 0, 0, 0, 1, 1,
-0.2918228, 0.6065934, -1.687967, 0, 0, 0, 1, 1,
-0.2903022, -0.6698159, -4.717748, 0, 0, 0, 1, 1,
-0.2846999, 0.1367162, -2.41338, 0, 0, 0, 1, 1,
-0.2828135, 1.205904, 0.08953364, 0, 0, 0, 1, 1,
-0.2818545, -0.2771704, -1.731558, 1, 1, 1, 1, 1,
-0.2810226, 1.688775, 1.495687, 1, 1, 1, 1, 1,
-0.2809201, 0.718091, -2.467001, 1, 1, 1, 1, 1,
-0.2768005, -1.454231, -4.402924, 1, 1, 1, 1, 1,
-0.2764596, 1.38892, 0.86417, 1, 1, 1, 1, 1,
-0.2695847, 0.6855415, -1.14643, 1, 1, 1, 1, 1,
-0.2644022, -0.5991598, -3.26908, 1, 1, 1, 1, 1,
-0.2635441, 0.803772, 0.352654, 1, 1, 1, 1, 1,
-0.2630735, 0.8493687, -0.5071226, 1, 1, 1, 1, 1,
-0.2606074, 1.720729, -0.6059569, 1, 1, 1, 1, 1,
-0.2577475, 0.262627, -0.03914464, 1, 1, 1, 1, 1,
-0.2564202, -1.382467, -2.842654, 1, 1, 1, 1, 1,
-0.2505666, 0.9449093, 1.31401, 1, 1, 1, 1, 1,
-0.2485539, 1.515053, -1.165835, 1, 1, 1, 1, 1,
-0.2485236, -0.9025337, -2.155865, 1, 1, 1, 1, 1,
-0.2459983, 0.2073803, 0.1097761, 0, 0, 1, 1, 1,
-0.245907, 1.236197, -0.9014944, 1, 0, 0, 1, 1,
-0.2458525, -1.090359, -3.586221, 1, 0, 0, 1, 1,
-0.2431692, -0.7053149, -3.451044, 1, 0, 0, 1, 1,
-0.2423303, -0.9757238, -3.245157, 1, 0, 0, 1, 1,
-0.2408458, -0.3518776, -1.87492, 1, 0, 0, 1, 1,
-0.2375489, 0.9722492, -0.2596847, 0, 0, 0, 1, 1,
-0.2337432, -1.042105, -3.079143, 0, 0, 0, 1, 1,
-0.2323825, -0.9444429, -4.115475, 0, 0, 0, 1, 1,
-0.2307139, -2.060238, -2.645173, 0, 0, 0, 1, 1,
-0.2277644, -0.9847007, -4.092673, 0, 0, 0, 1, 1,
-0.2271378, -1.426809, -3.636837, 0, 0, 0, 1, 1,
-0.2270207, -0.3453249, -2.427243, 0, 0, 0, 1, 1,
-0.2222259, 0.1196683, -0.787501, 1, 1, 1, 1, 1,
-0.2214962, 0.1020368, -1.35646, 1, 1, 1, 1, 1,
-0.2212997, -0.1533698, -1.392475, 1, 1, 1, 1, 1,
-0.2122802, 0.616446, 0.03308389, 1, 1, 1, 1, 1,
-0.2103359, 0.7961527, -1.178552, 1, 1, 1, 1, 1,
-0.2073985, -0.5952696, -2.92359, 1, 1, 1, 1, 1,
-0.2049568, 0.2237405, -0.4566019, 1, 1, 1, 1, 1,
-0.2043886, 0.873753, 1.37192, 1, 1, 1, 1, 1,
-0.2014927, 1.344887, 0.0337991, 1, 1, 1, 1, 1,
-0.1955844, -1.018453, -3.520487, 1, 1, 1, 1, 1,
-0.1945183, 0.465566, -0.6402408, 1, 1, 1, 1, 1,
-0.190412, -2.295092, -3.186109, 1, 1, 1, 1, 1,
-0.1855385, -0.3519114, -3.612206, 1, 1, 1, 1, 1,
-0.1844394, 0.4844039, -1.318919, 1, 1, 1, 1, 1,
-0.1821146, 0.1472368, -2.783976, 1, 1, 1, 1, 1,
-0.1755149, -0.4963293, -2.845192, 0, 0, 1, 1, 1,
-0.1720342, 0.2258425, -1.047548, 1, 0, 0, 1, 1,
-0.1706076, -0.4551499, -1.824278, 1, 0, 0, 1, 1,
-0.1683432, -1.774073, -4.337441, 1, 0, 0, 1, 1,
-0.1675171, -0.1827209, -1.151525, 1, 0, 0, 1, 1,
-0.1664331, 1.219626, -0.1171123, 1, 0, 0, 1, 1,
-0.1623836, 0.8678067, -0.4538923, 0, 0, 0, 1, 1,
-0.160274, 0.7424592, 0.291278, 0, 0, 0, 1, 1,
-0.1541279, 0.7141539, -2.434938, 0, 0, 0, 1, 1,
-0.1501498, 0.705777, -2.05639, 0, 0, 0, 1, 1,
-0.1448141, -1.405777, -2.992218, 0, 0, 0, 1, 1,
-0.1442074, -2.606503, -4.594907, 0, 0, 0, 1, 1,
-0.1431012, -0.1769594, -3.032765, 0, 0, 0, 1, 1,
-0.1386011, -0.9341381, -2.806495, 1, 1, 1, 1, 1,
-0.1365848, -0.5733687, -2.305641, 1, 1, 1, 1, 1,
-0.1352379, -0.2789332, -3.604135, 1, 1, 1, 1, 1,
-0.1333437, -0.5743898, -2.85966, 1, 1, 1, 1, 1,
-0.1264988, -0.6628097, -5.539982, 1, 1, 1, 1, 1,
-0.1263952, -0.3787491, -4.044991, 1, 1, 1, 1, 1,
-0.1261231, 0.3729063, -1.339947, 1, 1, 1, 1, 1,
-0.1252706, -1.121939, -4.641519, 1, 1, 1, 1, 1,
-0.1243333, 0.4848018, -1.434754, 1, 1, 1, 1, 1,
-0.1193736, 0.4706402, -1.371137, 1, 1, 1, 1, 1,
-0.1190549, -0.7623017, -1.821965, 1, 1, 1, 1, 1,
-0.1178336, -0.1709594, -2.596117, 1, 1, 1, 1, 1,
-0.1156823, -0.2512998, -2.231472, 1, 1, 1, 1, 1,
-0.1138605, -0.9871451, -2.695605, 1, 1, 1, 1, 1,
-0.1117406, -1.447889, -3.516824, 1, 1, 1, 1, 1,
-0.110328, -1.099766, -3.02906, 0, 0, 1, 1, 1,
-0.1071632, -2.208038, -3.158378, 1, 0, 0, 1, 1,
-0.1005416, -0.2071405, -0.9904935, 1, 0, 0, 1, 1,
-0.09875096, 0.4250901, 0.8213714, 1, 0, 0, 1, 1,
-0.0985074, -3.136307, -3.707587, 1, 0, 0, 1, 1,
-0.09638629, 1.007715, 1.161792, 1, 0, 0, 1, 1,
-0.09501643, 0.7047206, 0.5197088, 0, 0, 0, 1, 1,
-0.09355051, -0.005437244, 0.08733471, 0, 0, 0, 1, 1,
-0.09054484, 0.6587349, 1.31915, 0, 0, 0, 1, 1,
-0.09007705, 0.883967, -0.7867405, 0, 0, 0, 1, 1,
-0.08801303, -1.11813, -2.670818, 0, 0, 0, 1, 1,
-0.08779594, -1.524155, -1.83916, 0, 0, 0, 1, 1,
-0.08611836, -0.3103727, -2.399565, 0, 0, 0, 1, 1,
-0.08455267, 1.729707, 1.195757, 1, 1, 1, 1, 1,
-0.08401292, -0.1770944, -3.652208, 1, 1, 1, 1, 1,
-0.08272124, 0.199693, 0.3840035, 1, 1, 1, 1, 1,
-0.07934246, 0.8175003, -2.168035, 1, 1, 1, 1, 1,
-0.07852713, 1.883056, -0.187163, 1, 1, 1, 1, 1,
-0.07495623, -0.204089, -4.772793, 1, 1, 1, 1, 1,
-0.06328212, -0.1050589, -2.267035, 1, 1, 1, 1, 1,
-0.06232162, -0.1652143, -1.004359, 1, 1, 1, 1, 1,
-0.05579685, 0.4117768, -2.273601, 1, 1, 1, 1, 1,
-0.05418703, -1.343481, -1.171579, 1, 1, 1, 1, 1,
-0.04545463, -2.069439, -1.552253, 1, 1, 1, 1, 1,
-0.04530561, 1.611113, 0.2473087, 1, 1, 1, 1, 1,
-0.04444291, 0.5985355, 0.1251952, 1, 1, 1, 1, 1,
-0.03755916, -1.357928, -4.954667, 1, 1, 1, 1, 1,
-0.03552289, 0.4116927, -0.1601496, 1, 1, 1, 1, 1,
-0.03508599, 1.518504, -1.283356, 0, 0, 1, 1, 1,
-0.03208089, 2.51912, 0.5312945, 1, 0, 0, 1, 1,
-0.02963884, -0.573299, -2.142569, 1, 0, 0, 1, 1,
-0.02211202, 0.2297105, -2.072171, 1, 0, 0, 1, 1,
-0.02203371, -0.5103095, -2.840655, 1, 0, 0, 1, 1,
-0.02132266, 0.4972324, 0.9738039, 1, 0, 0, 1, 1,
-0.01837993, 0.173134, -0.2119767, 0, 0, 0, 1, 1,
-0.01752421, -1.613607, -3.256085, 0, 0, 0, 1, 1,
-0.01750215, -0.6335217, -1.821316, 0, 0, 0, 1, 1,
-0.01636585, -0.4034968, -3.282895, 0, 0, 0, 1, 1,
-0.01504374, 1.563557, 0.8930869, 0, 0, 0, 1, 1,
0.001407394, 1.091046, 1.565508, 0, 0, 0, 1, 1,
0.004374892, 0.5613406, 0.7908859, 0, 0, 0, 1, 1,
0.005685296, -1.8777, 2.707605, 1, 1, 1, 1, 1,
0.008384307, 0.1837788, -0.3549633, 1, 1, 1, 1, 1,
0.01041479, 0.5198595, -1.110716, 1, 1, 1, 1, 1,
0.01177573, -0.8388142, 5.206333, 1, 1, 1, 1, 1,
0.01199676, -0.2610875, 2.119265, 1, 1, 1, 1, 1,
0.01408512, 0.878403, 0.2979954, 1, 1, 1, 1, 1,
0.02326798, -0.9128562, 1.25814, 1, 1, 1, 1, 1,
0.02395332, 0.6312878, 0.06588329, 1, 1, 1, 1, 1,
0.02560891, 0.05713183, 1.797046, 1, 1, 1, 1, 1,
0.02649042, 0.06081844, -0.6167129, 1, 1, 1, 1, 1,
0.02958025, -0.06649994, 3.25999, 1, 1, 1, 1, 1,
0.03158692, 1.135848, 1.263978, 1, 1, 1, 1, 1,
0.03312466, 0.8920993, 0.5396606, 1, 1, 1, 1, 1,
0.03626591, 0.5134694, -1.977621, 1, 1, 1, 1, 1,
0.03755249, -0.1622435, 4.359808, 1, 1, 1, 1, 1,
0.04011215, -0.1046529, 0.8035492, 0, 0, 1, 1, 1,
0.04484999, -0.4130036, 2.404245, 1, 0, 0, 1, 1,
0.05004295, -0.6823118, 3.14825, 1, 0, 0, 1, 1,
0.05389361, -0.4549212, 3.377589, 1, 0, 0, 1, 1,
0.05429473, 2.026114, -1.086396, 1, 0, 0, 1, 1,
0.05631697, -0.7966258, 3.042985, 1, 0, 0, 1, 1,
0.05741294, 2.158086, 2.083822, 0, 0, 0, 1, 1,
0.05773863, 1.029406, 0.9195811, 0, 0, 0, 1, 1,
0.05800761, -0.4588103, 2.621569, 0, 0, 0, 1, 1,
0.0651466, -1.043035, 2.005821, 0, 0, 0, 1, 1,
0.06731008, 0.152358, 0.4358066, 0, 0, 0, 1, 1,
0.07018968, 1.570238, 0.0674888, 0, 0, 0, 1, 1,
0.07127576, -1.607825, 4.614573, 0, 0, 0, 1, 1,
0.07417839, -0.7488378, 2.922163, 1, 1, 1, 1, 1,
0.07724851, -0.5007259, 2.312408, 1, 1, 1, 1, 1,
0.07756863, -0.2684949, 2.783199, 1, 1, 1, 1, 1,
0.07765809, 1.3729, 0.6375273, 1, 1, 1, 1, 1,
0.08336648, 1.48197, -1.404294, 1, 1, 1, 1, 1,
0.08458989, -1.770219, 0.784417, 1, 1, 1, 1, 1,
0.08868455, 1.173637, 0.155025, 1, 1, 1, 1, 1,
0.09098756, 0.6912913, 1.183434, 1, 1, 1, 1, 1,
0.09617903, 0.120732, 0.7138626, 1, 1, 1, 1, 1,
0.09644099, -0.8592114, 2.9796, 1, 1, 1, 1, 1,
0.09824254, 0.5548968, 3.405264, 1, 1, 1, 1, 1,
0.09927807, -0.2043074, 2.644742, 1, 1, 1, 1, 1,
0.1026795, 0.7151698, -1.198789, 1, 1, 1, 1, 1,
0.1046462, 0.7698793, 0.3056681, 1, 1, 1, 1, 1,
0.1074261, -1.789796, 2.423166, 1, 1, 1, 1, 1,
0.1097922, 0.3049479, 2.329511, 0, 0, 1, 1, 1,
0.1139186, -0.5385977, 2.266397, 1, 0, 0, 1, 1,
0.1160142, -0.8388515, 1.373529, 1, 0, 0, 1, 1,
0.1234407, -0.1661007, 2.592999, 1, 0, 0, 1, 1,
0.1250082, 0.8004391, -1.716152, 1, 0, 0, 1, 1,
0.1263501, -0.6150241, 3.087584, 1, 0, 0, 1, 1,
0.1331447, -0.5368057, 3.627402, 0, 0, 0, 1, 1,
0.1340392, -0.4067636, 0.2487767, 0, 0, 0, 1, 1,
0.1368272, -0.04927281, -0.003848968, 0, 0, 0, 1, 1,
0.1422825, -0.1316584, 2.866921, 0, 0, 0, 1, 1,
0.1446668, 0.9450611, 0.821668, 0, 0, 0, 1, 1,
0.1459768, 0.5598376, -0.2421604, 0, 0, 0, 1, 1,
0.1481009, 0.6371188, 1.291853, 0, 0, 0, 1, 1,
0.1494233, -0.4919056, 3.898901, 1, 1, 1, 1, 1,
0.1494378, -0.09775807, 0.9467915, 1, 1, 1, 1, 1,
0.1525009, 0.0501088, 0.8768712, 1, 1, 1, 1, 1,
0.152795, -0.5575386, 2.739887, 1, 1, 1, 1, 1,
0.1539575, -0.9025396, 5.838547, 1, 1, 1, 1, 1,
0.1547983, 0.7996417, 0.4619348, 1, 1, 1, 1, 1,
0.1598603, 0.03004581, 0.2745344, 1, 1, 1, 1, 1,
0.1611468, 0.3183427, 0.2700408, 1, 1, 1, 1, 1,
0.1616445, 0.2789082, 1.578949, 1, 1, 1, 1, 1,
0.17022, -1.669353, 1.612996, 1, 1, 1, 1, 1,
0.1734096, 0.01097261, 2.082489, 1, 1, 1, 1, 1,
0.177041, -0.1940922, 2.261327, 1, 1, 1, 1, 1,
0.1778095, 0.4121288, -0.9977158, 1, 1, 1, 1, 1,
0.1790061, -0.7042467, 1.92566, 1, 1, 1, 1, 1,
0.1805745, -1.727431, 4.008523, 1, 1, 1, 1, 1,
0.1821453, -0.03090749, 0.5704239, 0, 0, 1, 1, 1,
0.1866077, -0.9660332, 3.466931, 1, 0, 0, 1, 1,
0.1873345, -0.08561201, 0.4996339, 1, 0, 0, 1, 1,
0.1878319, -0.4099503, 3.255102, 1, 0, 0, 1, 1,
0.1902749, 0.7339448, 0.6626823, 1, 0, 0, 1, 1,
0.1930944, 0.5706599, -0.6579771, 1, 0, 0, 1, 1,
0.1931791, 0.2994718, 1.393533, 0, 0, 0, 1, 1,
0.1993554, -1.351454, 1.99052, 0, 0, 0, 1, 1,
0.2003313, -0.4244752, 5.258435, 0, 0, 0, 1, 1,
0.2004806, 0.3916776, -0.2811197, 0, 0, 0, 1, 1,
0.2019011, -0.5301259, 2.919344, 0, 0, 0, 1, 1,
0.2041982, -0.06539451, 1.528394, 0, 0, 0, 1, 1,
0.2143731, 0.02829255, 3.474337, 0, 0, 0, 1, 1,
0.2145431, 0.8482276, -0.3152376, 1, 1, 1, 1, 1,
0.2287507, 1.655828, 0.4216095, 1, 1, 1, 1, 1,
0.2291878, -1.171875, 3.928455, 1, 1, 1, 1, 1,
0.2301155, -0.8320777, 3.61617, 1, 1, 1, 1, 1,
0.2303216, 0.7786038, 0.4782671, 1, 1, 1, 1, 1,
0.2400373, 0.7651461, 0.8706461, 1, 1, 1, 1, 1,
0.2433736, 0.2894723, 0.9755405, 1, 1, 1, 1, 1,
0.2435169, 1.115475, 0.1515317, 1, 1, 1, 1, 1,
0.2470289, -0.5534346, 2.204015, 1, 1, 1, 1, 1,
0.2501522, -0.3689908, 2.188541, 1, 1, 1, 1, 1,
0.2520598, -0.2148259, 1.377512, 1, 1, 1, 1, 1,
0.2563153, 0.3585292, 1.579254, 1, 1, 1, 1, 1,
0.2610384, 0.907576, 1.715952, 1, 1, 1, 1, 1,
0.2618494, -1.752272, 3.284023, 1, 1, 1, 1, 1,
0.2619206, 0.7757346, 1.466827, 1, 1, 1, 1, 1,
0.2619329, 0.4133827, -0.2348244, 0, 0, 1, 1, 1,
0.2659433, -0.196621, 1.040603, 1, 0, 0, 1, 1,
0.2761721, 0.991747, 0.5258549, 1, 0, 0, 1, 1,
0.2783997, -0.5609717, 2.721619, 1, 0, 0, 1, 1,
0.2817225, -0.3955034, 1.55304, 1, 0, 0, 1, 1,
0.2823537, 0.201541, 1.151269, 1, 0, 0, 1, 1,
0.2836602, 1.75783, -0.859979, 0, 0, 0, 1, 1,
0.2841065, 1.41305, -0.2550089, 0, 0, 0, 1, 1,
0.2901936, 0.1393718, 0.8240781, 0, 0, 0, 1, 1,
0.2941656, 0.3580426, -0.4719855, 0, 0, 0, 1, 1,
0.294604, 0.513922, -0.8941193, 0, 0, 0, 1, 1,
0.2948368, -1.055156, 3.911594, 0, 0, 0, 1, 1,
0.3063787, 1.296348, -0.967025, 0, 0, 0, 1, 1,
0.3068726, -0.1073867, 2.072162, 1, 1, 1, 1, 1,
0.3132184, 0.7689106, 1.911789, 1, 1, 1, 1, 1,
0.3194401, -1.87262, 2.835579, 1, 1, 1, 1, 1,
0.3245592, 1.836248, 0.4371351, 1, 1, 1, 1, 1,
0.3249079, -0.7573968, 2.947665, 1, 1, 1, 1, 1,
0.3259316, -0.4760128, 1.313296, 1, 1, 1, 1, 1,
0.3289172, -0.145215, 3.771983, 1, 1, 1, 1, 1,
0.3298999, -1.096591, 4.447618, 1, 1, 1, 1, 1,
0.3386402, -0.5985948, 2.65595, 1, 1, 1, 1, 1,
0.342845, 0.2985709, 2.905773, 1, 1, 1, 1, 1,
0.3436699, -0.2919872, 1.744048, 1, 1, 1, 1, 1,
0.3446693, -1.041933, 2.944197, 1, 1, 1, 1, 1,
0.3477522, 0.09050965, 0.2251137, 1, 1, 1, 1, 1,
0.3490979, 2.545059, -2.282134, 1, 1, 1, 1, 1,
0.3501616, 0.04813551, 1.768792, 1, 1, 1, 1, 1,
0.3509988, 0.5142363, -0.2701903, 0, 0, 1, 1, 1,
0.3512243, -1.454096, 3.142285, 1, 0, 0, 1, 1,
0.3561971, 0.4380031, 0.6824521, 1, 0, 0, 1, 1,
0.3570479, 1.118349, 0.8521981, 1, 0, 0, 1, 1,
0.358294, 0.3031074, 0.518374, 1, 0, 0, 1, 1,
0.3607433, -0.6383349, 1.794063, 1, 0, 0, 1, 1,
0.3614039, -1.927846, 3.106464, 0, 0, 0, 1, 1,
0.365142, -0.5604517, 3.37767, 0, 0, 0, 1, 1,
0.3673052, -0.7722026, 2.5611, 0, 0, 0, 1, 1,
0.369045, -0.364394, 1.812533, 0, 0, 0, 1, 1,
0.3733054, 0.5512909, 1.83609, 0, 0, 0, 1, 1,
0.3738232, -1.231343, 4.027226, 0, 0, 0, 1, 1,
0.3754254, -0.239573, 2.829263, 0, 0, 0, 1, 1,
0.3814459, -0.1371647, 0.817758, 1, 1, 1, 1, 1,
0.3847121, 0.6432507, 1.668597, 1, 1, 1, 1, 1,
0.3861095, 1.157314, 0.8721685, 1, 1, 1, 1, 1,
0.3863815, -2.105222, 3.113281, 1, 1, 1, 1, 1,
0.3978471, -0.7742915, 2.425878, 1, 1, 1, 1, 1,
0.3991114, -0.6529895, 2.085601, 1, 1, 1, 1, 1,
0.3996477, -0.4470994, 2.724301, 1, 1, 1, 1, 1,
0.4012351, -0.3353878, 2.604757, 1, 1, 1, 1, 1,
0.4087322, 1.296811, 1.602525, 1, 1, 1, 1, 1,
0.4161496, -0.4745818, 2.772285, 1, 1, 1, 1, 1,
0.4209766, -0.7030872, 2.328647, 1, 1, 1, 1, 1,
0.4259616, -0.246271, 2.563843, 1, 1, 1, 1, 1,
0.4261352, -0.5403908, 2.901181, 1, 1, 1, 1, 1,
0.427133, -0.2511796, 2.211245, 1, 1, 1, 1, 1,
0.4291002, 0.4709722, 0.540826, 1, 1, 1, 1, 1,
0.4318485, 0.7649387, 2.379637, 0, 0, 1, 1, 1,
0.4341076, 0.3977508, 0.1373488, 1, 0, 0, 1, 1,
0.4346257, 0.8064266, -0.8664677, 1, 0, 0, 1, 1,
0.4352118, 1.017242, -0.4852491, 1, 0, 0, 1, 1,
0.4379206, 0.2628645, -0.02390575, 1, 0, 0, 1, 1,
0.4387572, 0.1483596, -0.2138044, 1, 0, 0, 1, 1,
0.4388637, -0.3891732, 1.842251, 0, 0, 0, 1, 1,
0.4430103, -0.8973796, 4.97717, 0, 0, 0, 1, 1,
0.445783, 0.7606903, 1.414932, 0, 0, 0, 1, 1,
0.4459125, 1.134264, 0.4251459, 0, 0, 0, 1, 1,
0.446911, -0.1491843, 0.3423527, 0, 0, 0, 1, 1,
0.4473506, -0.05211132, 2.34091, 0, 0, 0, 1, 1,
0.4482305, 2.511847, -0.01696526, 0, 0, 0, 1, 1,
0.4494817, -0.3309227, 5.533077, 1, 1, 1, 1, 1,
0.4535802, 0.1829289, 1.643697, 1, 1, 1, 1, 1,
0.4583952, -0.6276107, 2.607753, 1, 1, 1, 1, 1,
0.4584807, -1.101601, 2.191863, 1, 1, 1, 1, 1,
0.4585801, 1.926155, 1.471344, 1, 1, 1, 1, 1,
0.4596619, -0.66796, 1.925224, 1, 1, 1, 1, 1,
0.4610644, 2.158747, 2.5025, 1, 1, 1, 1, 1,
0.4621257, -0.6820329, 2.578371, 1, 1, 1, 1, 1,
0.463857, -0.5167633, 1.145393, 1, 1, 1, 1, 1,
0.4662848, 1.419474, 0.1524117, 1, 1, 1, 1, 1,
0.4744245, -0.149671, 2.284511, 1, 1, 1, 1, 1,
0.4746705, -0.1818142, 2.967661, 1, 1, 1, 1, 1,
0.4812422, 0.230775, -0.3701983, 1, 1, 1, 1, 1,
0.4818022, -0.7966588, 2.881679, 1, 1, 1, 1, 1,
0.4835598, -0.6998533, 1.46315, 1, 1, 1, 1, 1,
0.4837326, -0.9133543, 1.939362, 0, 0, 1, 1, 1,
0.4841458, 1.346074, 0.0116093, 1, 0, 0, 1, 1,
0.4865012, 1.21011, -1.423314, 1, 0, 0, 1, 1,
0.4870766, -0.2428291, 2.082211, 1, 0, 0, 1, 1,
0.4904143, -0.1425118, 0.9160841, 1, 0, 0, 1, 1,
0.4904985, -0.7296726, 3.322026, 1, 0, 0, 1, 1,
0.4938927, -1.217443, 2.282466, 0, 0, 0, 1, 1,
0.494817, -0.7272118, 2.067214, 0, 0, 0, 1, 1,
0.5086532, -1.831211, 3.779994, 0, 0, 0, 1, 1,
0.5102146, 0.7872964, -0.1230004, 0, 0, 0, 1, 1,
0.5137792, 1.4323, 0.9326217, 0, 0, 0, 1, 1,
0.5144699, 0.6332589, 1.159374, 0, 0, 0, 1, 1,
0.5153812, -1.777382, 2.879665, 0, 0, 0, 1, 1,
0.5157428, 0.5191731, 0.7652502, 1, 1, 1, 1, 1,
0.5180426, -1.54799, 3.719935, 1, 1, 1, 1, 1,
0.518619, -0.001667938, 1.980255, 1, 1, 1, 1, 1,
0.5284492, -2.277752, 4.769181, 1, 1, 1, 1, 1,
0.531609, 1.480062, 1.001368, 1, 1, 1, 1, 1,
0.5334538, -1.42648, 3.007727, 1, 1, 1, 1, 1,
0.5371515, 0.04234619, 2.76141, 1, 1, 1, 1, 1,
0.5407108, -0.877293, 2.556529, 1, 1, 1, 1, 1,
0.5484073, -0.884169, 2.519136, 1, 1, 1, 1, 1,
0.5544127, -0.5178671, 2.644314, 1, 1, 1, 1, 1,
0.5581866, -0.2624067, 2.043199, 1, 1, 1, 1, 1,
0.5592795, 0.905825, 2.176121, 1, 1, 1, 1, 1,
0.56043, -0.03246309, 1.047273, 1, 1, 1, 1, 1,
0.56443, 1.270004, 0.6481438, 1, 1, 1, 1, 1,
0.5645943, -0.5331244, 1.288147, 1, 1, 1, 1, 1,
0.5670976, -0.5983948, 2.423207, 0, 0, 1, 1, 1,
0.5674756, 0.8191717, -0.1209652, 1, 0, 0, 1, 1,
0.57296, -0.115438, 1.790008, 1, 0, 0, 1, 1,
0.5810991, 0.9840617, -1.615399, 1, 0, 0, 1, 1,
0.5840722, -0.4679752, 2.213905, 1, 0, 0, 1, 1,
0.5861704, 0.007459886, 3.075879, 1, 0, 0, 1, 1,
0.5869097, -2.092768, 3.447999, 0, 0, 0, 1, 1,
0.594146, -2.259591, 2.341905, 0, 0, 0, 1, 1,
0.5957226, -0.9128109, 1.917718, 0, 0, 0, 1, 1,
0.6005454, -1.427345, 0.7283658, 0, 0, 0, 1, 1,
0.604588, 1.162744, 2.421872, 0, 0, 0, 1, 1,
0.6055732, 0.5994857, 0.1198688, 0, 0, 0, 1, 1,
0.6099686, -1.59635, 1.618701, 0, 0, 0, 1, 1,
0.6115551, -0.2647232, 1.233263, 1, 1, 1, 1, 1,
0.6125749, -0.487903, 1.56818, 1, 1, 1, 1, 1,
0.6187039, -1.226968, 3.676589, 1, 1, 1, 1, 1,
0.6238075, 0.008641087, 1.433647, 1, 1, 1, 1, 1,
0.6277361, -0.7638879, 1.170233, 1, 1, 1, 1, 1,
0.6285222, 1.319607, 0.7022844, 1, 1, 1, 1, 1,
0.6294423, -0.1979399, 2.647843, 1, 1, 1, 1, 1,
0.6327376, -0.3712622, -0.0218173, 1, 1, 1, 1, 1,
0.6346502, 0.6121727, 2.555463, 1, 1, 1, 1, 1,
0.6368295, -0.2105766, 1.215193, 1, 1, 1, 1, 1,
0.6372602, -0.3344919, 1.334509, 1, 1, 1, 1, 1,
0.6376479, -1.311602, 1.912989, 1, 1, 1, 1, 1,
0.6410306, -0.6521783, 2.780928, 1, 1, 1, 1, 1,
0.6426728, -0.4487137, 2.611149, 1, 1, 1, 1, 1,
0.6491705, 0.3217113, 2.716828, 1, 1, 1, 1, 1,
0.6492139, -0.0272836, 2.875132, 0, 0, 1, 1, 1,
0.6501637, 0.8586508, 0.5406407, 1, 0, 0, 1, 1,
0.6611257, -1.177644, 2.914685, 1, 0, 0, 1, 1,
0.6614441, 0.3245942, 1.617072, 1, 0, 0, 1, 1,
0.6657286, -3.554246, 2.037725, 1, 0, 0, 1, 1,
0.6664349, -0.2099731, 2.38247, 1, 0, 0, 1, 1,
0.6686023, 0.4050409, -0.473535, 0, 0, 0, 1, 1,
0.6719036, -0.256359, 2.068373, 0, 0, 0, 1, 1,
0.6723821, 0.3705344, 0.9050585, 0, 0, 0, 1, 1,
0.6728817, 0.3398927, 0.5327926, 0, 0, 0, 1, 1,
0.6731639, 0.675584, 0.8001491, 0, 0, 0, 1, 1,
0.6771151, 0.8487872, 1.467799, 0, 0, 0, 1, 1,
0.6802484, 0.04035813, -0.2797834, 0, 0, 0, 1, 1,
0.6908196, 0.0009165395, 0.6016175, 1, 1, 1, 1, 1,
0.6915681, -0.3032628, 4.132922, 1, 1, 1, 1, 1,
0.6954138, -0.7157854, 2.505184, 1, 1, 1, 1, 1,
0.6976554, -0.617026, 2.476322, 1, 1, 1, 1, 1,
0.6986058, -0.3044641, 0.03905746, 1, 1, 1, 1, 1,
0.7007459, 1.031824, 1.19464, 1, 1, 1, 1, 1,
0.7031448, 0.5721, 2.633193, 1, 1, 1, 1, 1,
0.7076628, 0.2098307, 1.718208, 1, 1, 1, 1, 1,
0.7120166, 0.6367962, -0.4723489, 1, 1, 1, 1, 1,
0.712302, 0.05968411, 1.966292, 1, 1, 1, 1, 1,
0.7147039, -0.5522095, 1.380448, 1, 1, 1, 1, 1,
0.7237425, 0.3231182, 1.198584, 1, 1, 1, 1, 1,
0.7241473, 1.085444, 2.396017, 1, 1, 1, 1, 1,
0.7336829, -1.243228, 4.753732, 1, 1, 1, 1, 1,
0.7351133, 1.203617, 1.439954, 1, 1, 1, 1, 1,
0.7368618, -0.656611, 3.831608, 0, 0, 1, 1, 1,
0.7378304, 1.443269, -0.6643882, 1, 0, 0, 1, 1,
0.7394722, 0.6716687, -0.03708922, 1, 0, 0, 1, 1,
0.7421946, 0.00816844, 1.857067, 1, 0, 0, 1, 1,
0.7474517, 0.1969128, 3.137606, 1, 0, 0, 1, 1,
0.7510985, 1.350681, 0.5342186, 1, 0, 0, 1, 1,
0.7518488, 1.241979, 0.9710187, 0, 0, 0, 1, 1,
0.7522088, -0.1790632, 0.7986328, 0, 0, 0, 1, 1,
0.7573171, -0.01787793, -0.2764342, 0, 0, 0, 1, 1,
0.758791, -0.520433, -0.8028995, 0, 0, 0, 1, 1,
0.7627782, -0.1352116, 1.143384, 0, 0, 0, 1, 1,
0.7643481, 0.9427402, 1.402975, 0, 0, 0, 1, 1,
0.7694091, 0.6580763, 0.8372324, 0, 0, 0, 1, 1,
0.772082, -2.285054, 2.464629, 1, 1, 1, 1, 1,
0.7759162, 0.2127703, 0.4170919, 1, 1, 1, 1, 1,
0.7788973, 0.5442777, 0.7048304, 1, 1, 1, 1, 1,
0.7792536, 0.4437589, 1.548, 1, 1, 1, 1, 1,
0.7900678, -0.473397, 1.898363, 1, 1, 1, 1, 1,
0.7900851, 1.746146, -0.6540663, 1, 1, 1, 1, 1,
0.7926291, 0.1394058, -0.7087597, 1, 1, 1, 1, 1,
0.7947624, 0.7095965, 1.463844, 1, 1, 1, 1, 1,
0.7973588, -0.4759806, 2.652498, 1, 1, 1, 1, 1,
0.8003622, 0.5287414, 1.546703, 1, 1, 1, 1, 1,
0.8107183, -0.2886858, 2.338342, 1, 1, 1, 1, 1,
0.8120372, 1.067866, -0.6194581, 1, 1, 1, 1, 1,
0.8157448, -0.9522778, 2.565569, 1, 1, 1, 1, 1,
0.8174817, -1.092147, 2.973074, 1, 1, 1, 1, 1,
0.8204339, -0.06031464, -0.3945976, 1, 1, 1, 1, 1,
0.8220152, 1.870333, 1.525432, 0, 0, 1, 1, 1,
0.8287005, -1.282448, 2.421657, 1, 0, 0, 1, 1,
0.8291376, -0.6594375, 1.900187, 1, 0, 0, 1, 1,
0.8325823, -1.151803, 2.401042, 1, 0, 0, 1, 1,
0.8341999, 1.056593, 1.570578, 1, 0, 0, 1, 1,
0.8381935, 1.18776, 0.6482852, 1, 0, 0, 1, 1,
0.8391163, 0.8479018, 0.2087788, 0, 0, 0, 1, 1,
0.8401913, -0.2577055, 2.169344, 0, 0, 0, 1, 1,
0.840408, -0.415879, 2.908476, 0, 0, 0, 1, 1,
0.8505009, 1.179752, 1.090473, 0, 0, 0, 1, 1,
0.8662605, -0.3699918, 2.034137, 0, 0, 0, 1, 1,
0.870877, 1.622062, 0.5194263, 0, 0, 0, 1, 1,
0.8728467, -0.3968577, 1.45557, 0, 0, 0, 1, 1,
0.8728917, 0.8397506, 1.154264, 1, 1, 1, 1, 1,
0.8746296, -1.346412, 3.11889, 1, 1, 1, 1, 1,
0.8807943, -0.7180009, 1.325124, 1, 1, 1, 1, 1,
0.8809618, -0.1969322, 1.039275, 1, 1, 1, 1, 1,
0.8824303, -1.344317, 2.064872, 1, 1, 1, 1, 1,
0.8883595, -0.1644333, 2.271143, 1, 1, 1, 1, 1,
0.8893754, -1.97872, 2.14915, 1, 1, 1, 1, 1,
0.8932232, -0.4499104, 1.852006, 1, 1, 1, 1, 1,
0.8976699, -0.6902905, 1.786028, 1, 1, 1, 1, 1,
0.9050641, 3.289322, -0.9691018, 1, 1, 1, 1, 1,
0.9054209, 1.305875, -0.3695656, 1, 1, 1, 1, 1,
0.9066425, 1.924999, 0.2711353, 1, 1, 1, 1, 1,
0.9075227, -0.5848216, 0.7571538, 1, 1, 1, 1, 1,
0.9082786, -0.01634984, 1.041627, 1, 1, 1, 1, 1,
0.9107749, 0.6012492, 0.7068412, 1, 1, 1, 1, 1,
0.917553, -0.9663182, 2.343105, 0, 0, 1, 1, 1,
0.9208664, -1.149684, 2.198503, 1, 0, 0, 1, 1,
0.9252812, -0.514248, 2.935976, 1, 0, 0, 1, 1,
0.9274799, 0.3700587, 1.359795, 1, 0, 0, 1, 1,
0.9289954, 0.1681952, 2.285296, 1, 0, 0, 1, 1,
0.9326544, -0.04365685, 2.59519, 1, 0, 0, 1, 1,
0.9418106, 1.535395, 1.845436, 0, 0, 0, 1, 1,
0.9429975, -0.9535652, 1.015692, 0, 0, 0, 1, 1,
0.9466153, -0.8157202, 2.742288, 0, 0, 0, 1, 1,
0.9625672, -0.2697897, 3.461746, 0, 0, 0, 1, 1,
0.9767341, -0.1395245, 3.623752, 0, 0, 0, 1, 1,
0.9796023, -1.313655, 3.278767, 0, 0, 0, 1, 1,
0.9897294, 0.2328256, 2.622248, 0, 0, 0, 1, 1,
0.9907106, 0.4461597, 1.222095, 1, 1, 1, 1, 1,
0.9913193, -0.7823422, 1.358559, 1, 1, 1, 1, 1,
0.9966081, -1.301042, 1.849953, 1, 1, 1, 1, 1,
1.000917, -0.2735573, 1.656658, 1, 1, 1, 1, 1,
1.001478, 0.5778013, 0.4065462, 1, 1, 1, 1, 1,
1.016627, -1.858325, 2.869274, 1, 1, 1, 1, 1,
1.017223, 0.5587696, 2.686796, 1, 1, 1, 1, 1,
1.021754, 0.6607763, 0.5030687, 1, 1, 1, 1, 1,
1.023838, -0.09875011, 0.8356386, 1, 1, 1, 1, 1,
1.029602, -0.1764129, 2.931827, 1, 1, 1, 1, 1,
1.031405, -0.6533101, 1.396788, 1, 1, 1, 1, 1,
1.03737, 0.09595025, 0.3418502, 1, 1, 1, 1, 1,
1.050737, -0.215886, 1.038654, 1, 1, 1, 1, 1,
1.052931, -0.3751057, -0.190773, 1, 1, 1, 1, 1,
1.058711, 2.800038, 0.9209262, 1, 1, 1, 1, 1,
1.068962, -0.4723934, 2.188504, 0, 0, 1, 1, 1,
1.072002, 1.389813, -0.6596401, 1, 0, 0, 1, 1,
1.077586, 0.7207195, -0.3652426, 1, 0, 0, 1, 1,
1.083297, 0.05329655, 1.507474, 1, 0, 0, 1, 1,
1.087181, -0.2601264, 2.397634, 1, 0, 0, 1, 1,
1.093788, 0.04371136, 1.684868, 1, 0, 0, 1, 1,
1.097143, -0.09787419, -0.3491785, 0, 0, 0, 1, 1,
1.100574, -1.80207, 2.402536, 0, 0, 0, 1, 1,
1.102762, -0.03968595, 1.290897, 0, 0, 0, 1, 1,
1.111383, 0.3864963, 2.38521, 0, 0, 0, 1, 1,
1.11361, 1.539406, -0.07914269, 0, 0, 0, 1, 1,
1.118924, -0.5482683, 3.029356, 0, 0, 0, 1, 1,
1.124239, 1.603008, -0.0542122, 0, 0, 0, 1, 1,
1.124666, -0.7268073, 3.96911, 1, 1, 1, 1, 1,
1.126686, -0.232626, 2.400092, 1, 1, 1, 1, 1,
1.129546, 0.7565678, 1.624565, 1, 1, 1, 1, 1,
1.13435, -0.6737864, 2.057993, 1, 1, 1, 1, 1,
1.137239, -0.2060936, 1.926651, 1, 1, 1, 1, 1,
1.140087, 1.284207, -2.205322, 1, 1, 1, 1, 1,
1.143364, -0.5763662, 2.587029, 1, 1, 1, 1, 1,
1.157708, 1.225576, -1.658336, 1, 1, 1, 1, 1,
1.165717, -0.3644826, 3.713141, 1, 1, 1, 1, 1,
1.175677, 0.7432881, 0.6041089, 1, 1, 1, 1, 1,
1.180984, 1.190512, 1.766822, 1, 1, 1, 1, 1,
1.188131, -0.9688224, 1.474521, 1, 1, 1, 1, 1,
1.189675, -0.3408525, 0.3308573, 1, 1, 1, 1, 1,
1.196064, -0.4939334, 2.362143, 1, 1, 1, 1, 1,
1.199238, 0.4658964, 1.120981, 1, 1, 1, 1, 1,
1.203264, 1.662468, -0.5137181, 0, 0, 1, 1, 1,
1.208496, -0.5092818, 2.212903, 1, 0, 0, 1, 1,
1.219531, -0.9857571, 3.230443, 1, 0, 0, 1, 1,
1.221463, -0.1021587, 1.553057, 1, 0, 0, 1, 1,
1.222523, -0.3722696, 1.935814, 1, 0, 0, 1, 1,
1.22512, 0.09969278, 1.094475, 1, 0, 0, 1, 1,
1.2267, 0.1174736, 2.833737, 0, 0, 0, 1, 1,
1.228896, -0.9679248, 0.814708, 0, 0, 0, 1, 1,
1.229269, 0.8990368, 0.6131412, 0, 0, 0, 1, 1,
1.230158, 0.4227147, 1.263078, 0, 0, 0, 1, 1,
1.231582, -0.4789948, 2.231938, 0, 0, 0, 1, 1,
1.233497, -1.296138, 2.191979, 0, 0, 0, 1, 1,
1.235373, -0.08045351, -0.0008995431, 0, 0, 0, 1, 1,
1.245931, -0.2636043, 1.786275, 1, 1, 1, 1, 1,
1.249473, -1.140813, 3.392541, 1, 1, 1, 1, 1,
1.251952, -1.319757, 1.749737, 1, 1, 1, 1, 1,
1.257648, 1.048099, 0.3384429, 1, 1, 1, 1, 1,
1.258929, 0.9668739, 2.132014, 1, 1, 1, 1, 1,
1.26128, 0.2799743, 2.243685, 1, 1, 1, 1, 1,
1.261512, -0.3176703, 1.333362, 1, 1, 1, 1, 1,
1.26355, 0.5358705, 2.489466, 1, 1, 1, 1, 1,
1.268544, 0.3894693, 1.424498, 1, 1, 1, 1, 1,
1.275654, -0.9231675, 0.989468, 1, 1, 1, 1, 1,
1.276666, 1.415199, 0.9693496, 1, 1, 1, 1, 1,
1.276972, 1.835964, 0.4476933, 1, 1, 1, 1, 1,
1.287528, 0.5359339, 1.600795, 1, 1, 1, 1, 1,
1.289047, -0.4077561, 1.520757, 1, 1, 1, 1, 1,
1.290456, 0.7836568, 0.6431385, 1, 1, 1, 1, 1,
1.294514, 0.7896864, 3.606914, 0, 0, 1, 1, 1,
1.295952, 0.3744592, 0.3860372, 1, 0, 0, 1, 1,
1.298769, -0.632665, 1.901251, 1, 0, 0, 1, 1,
1.299919, 0.4833954, 0.7827542, 1, 0, 0, 1, 1,
1.301612, -0.240209, 1.34826, 1, 0, 0, 1, 1,
1.304035, -0.3076758, 0.09000416, 1, 0, 0, 1, 1,
1.306788, 0.266908, 3.468785, 0, 0, 0, 1, 1,
1.318781, -1.237611, 2.085941, 0, 0, 0, 1, 1,
1.323114, 0.8531926, 2.223637, 0, 0, 0, 1, 1,
1.327774, 0.8151256, 1.120219, 0, 0, 0, 1, 1,
1.344184, 1.186022, 0.9788673, 0, 0, 0, 1, 1,
1.368978, -1.087824, 4.227737, 0, 0, 0, 1, 1,
1.371289, 0.175973, 2.440794, 0, 0, 0, 1, 1,
1.384111, 0.03125716, 1.204491, 1, 1, 1, 1, 1,
1.386455, 0.8655861, 1.172855, 1, 1, 1, 1, 1,
1.387082, -0.7874637, 3.358279, 1, 1, 1, 1, 1,
1.391565, 0.8315104, 1.275487, 1, 1, 1, 1, 1,
1.398319, 0.8776716, -0.1624962, 1, 1, 1, 1, 1,
1.400848, 0.2654298, 2.034078, 1, 1, 1, 1, 1,
1.409225, -0.4055806, 2.593862, 1, 1, 1, 1, 1,
1.423801, 0.7051519, 1.947321, 1, 1, 1, 1, 1,
1.43015, -0.6267667, 3.206782, 1, 1, 1, 1, 1,
1.43124, 0.6894695, 0.8941042, 1, 1, 1, 1, 1,
1.432367, 0.2687756, 1.924165, 1, 1, 1, 1, 1,
1.43491, -0.8489509, 2.259215, 1, 1, 1, 1, 1,
1.442925, 0.7225423, 2.044855, 1, 1, 1, 1, 1,
1.460156, -0.1164103, 0.1972277, 1, 1, 1, 1, 1,
1.463386, 0.03560035, 0.7321783, 1, 1, 1, 1, 1,
1.468153, 0.8066771, 0.5366989, 0, 0, 1, 1, 1,
1.486809, 0.6064209, 2.186666, 1, 0, 0, 1, 1,
1.489278, -0.1946777, 3.056684, 1, 0, 0, 1, 1,
1.496865, -0.4461898, 1.669918, 1, 0, 0, 1, 1,
1.507772, 1.197255, 2.482157, 1, 0, 0, 1, 1,
1.517439, -0.7289437, 3.170222, 1, 0, 0, 1, 1,
1.519347, -0.250878, 1.418208, 0, 0, 0, 1, 1,
1.523718, 0.1121385, 2.753004, 0, 0, 0, 1, 1,
1.527215, 1.090982, 0.7869542, 0, 0, 0, 1, 1,
1.535603, -0.7187812, 3.129093, 0, 0, 0, 1, 1,
1.548978, 0.08716832, 1.948296, 0, 0, 0, 1, 1,
1.552001, -0.7840396, 0.1853079, 0, 0, 0, 1, 1,
1.560804, 0.4748973, 2.876974, 0, 0, 0, 1, 1,
1.561956, 0.1051082, 0.2568684, 1, 1, 1, 1, 1,
1.571381, -1.829619, 3.219215, 1, 1, 1, 1, 1,
1.584364, -1.132927, 2.869599, 1, 1, 1, 1, 1,
1.608593, 1.283881, -0.01669983, 1, 1, 1, 1, 1,
1.615365, 1.538224, -0.7368528, 1, 1, 1, 1, 1,
1.618467, 0.1674152, 0.8454426, 1, 1, 1, 1, 1,
1.619585, -0.8020601, 2.845496, 1, 1, 1, 1, 1,
1.628033, -0.1103161, 2.669031, 1, 1, 1, 1, 1,
1.639651, -1.298004, 3.482315, 1, 1, 1, 1, 1,
1.656131, 1.6243, 1.247723, 1, 1, 1, 1, 1,
1.666509, -2.43818, 2.42923, 1, 1, 1, 1, 1,
1.666519, -0.5421114, 3.169591, 1, 1, 1, 1, 1,
1.675086, -1.551564, 0.8429782, 1, 1, 1, 1, 1,
1.678867, -2.346041, 1.706038, 1, 1, 1, 1, 1,
1.684192, 0.07910296, 2.075887, 1, 1, 1, 1, 1,
1.6855, -0.1521046, 2.265026, 0, 0, 1, 1, 1,
1.703006, -0.5297122, 2.860374, 1, 0, 0, 1, 1,
1.743687, 0.1736695, 0.9307579, 1, 0, 0, 1, 1,
1.765938, -0.5034847, 1.218641, 1, 0, 0, 1, 1,
1.777287, -0.7677082, 0.8097842, 1, 0, 0, 1, 1,
1.785459, 0.3766946, 0.8220465, 1, 0, 0, 1, 1,
1.78558, -0.5768335, 2.916029, 0, 0, 0, 1, 1,
1.786472, 0.8130578, 0.9169161, 0, 0, 0, 1, 1,
1.810123, 0.6576751, 1.891097, 0, 0, 0, 1, 1,
1.832093, 0.04380569, 2.140781, 0, 0, 0, 1, 1,
1.888618, 0.9252449, 0.6316473, 0, 0, 0, 1, 1,
1.899588, 0.2029588, 2.180726, 0, 0, 0, 1, 1,
1.901028, 0.05356232, 1.860829, 0, 0, 0, 1, 1,
1.91342, -0.4167636, 1.24604, 1, 1, 1, 1, 1,
1.927282, -0.1845092, 0.0743844, 1, 1, 1, 1, 1,
1.92856, -2.43548, 3.673602, 1, 1, 1, 1, 1,
1.964031, -1.134255, 3.747835, 1, 1, 1, 1, 1,
1.964114, -0.8204955, 2.191694, 1, 1, 1, 1, 1,
1.997258, 0.8718383, -0.4281156, 1, 1, 1, 1, 1,
2.016042, 0.4620498, 0.899551, 1, 1, 1, 1, 1,
2.018776, 0.6254832, 0.295913, 1, 1, 1, 1, 1,
2.020959, 1.186469, 1.132283, 1, 1, 1, 1, 1,
2.021563, 0.7219122, 1.384095, 1, 1, 1, 1, 1,
2.047048, -0.9242615, 2.77174, 1, 1, 1, 1, 1,
2.05541, -1.294455, 0.9851294, 1, 1, 1, 1, 1,
2.063022, 0.1687087, 0.6623994, 1, 1, 1, 1, 1,
2.070564, -0.8564765, 2.474956, 1, 1, 1, 1, 1,
2.083471, 0.8358958, 0.6678668, 1, 1, 1, 1, 1,
2.100557, -0.2287064, 1.749595, 0, 0, 1, 1, 1,
2.108206, -0.7438295, 1.709724, 1, 0, 0, 1, 1,
2.12352, -0.2418951, 1.321411, 1, 0, 0, 1, 1,
2.128851, 0.06686616, 2.203867, 1, 0, 0, 1, 1,
2.192848, 1.207595, 2.285929, 1, 0, 0, 1, 1,
2.197405, -0.1779464, 2.165359, 1, 0, 0, 1, 1,
2.212765, -0.1363391, 0.8301764, 0, 0, 0, 1, 1,
2.247585, 0.4918278, 4.603308, 0, 0, 0, 1, 1,
2.248726, 1.087991, 1.946999, 0, 0, 0, 1, 1,
2.291448, -2.118795, 1.658224, 0, 0, 0, 1, 1,
2.300592, 0.643728, 0.9120619, 0, 0, 0, 1, 1,
2.374959, -0.3447111, 1.910774, 0, 0, 0, 1, 1,
2.381617, -0.8857003, 1.063773, 0, 0, 0, 1, 1,
2.391639, 0.5239528, 1.784314, 1, 1, 1, 1, 1,
2.407627, -0.3789642, 3.114121, 1, 1, 1, 1, 1,
2.679057, 0.07036466, 0.5687907, 1, 1, 1, 1, 1,
2.690322, 1.758007, 1.72035, 1, 1, 1, 1, 1,
2.705995, -1.111946, 2.878211, 1, 1, 1, 1, 1,
2.928154, -0.6645097, 1.971437, 1, 1, 1, 1, 1,
3.476945, 0.01374677, 1.172637, 1, 1, 1, 1, 1
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
var radius = 10.27031;
var distance = 36.07402;
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
mvMatrix.translate( 0.3010943, 0.132462, -0.1459334 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.07402);
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
