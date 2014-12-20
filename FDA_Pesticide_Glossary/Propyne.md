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
-3.265808, -1.751213, -2.291572, 1, 0, 0, 1,
-2.741969, 0.7640031, -1.440914, 1, 0.007843138, 0, 1,
-2.719702, -1.214443, -2.989187, 1, 0.01176471, 0, 1,
-2.57916, -0.3534787, -2.377181, 1, 0.01960784, 0, 1,
-2.45559, -1.334882, -2.252328, 1, 0.02352941, 0, 1,
-2.444702, -1.17697, -0.9662572, 1, 0.03137255, 0, 1,
-2.268135, 1.269659, -1.778882, 1, 0.03529412, 0, 1,
-2.24437, 1.379469, -2.153119, 1, 0.04313726, 0, 1,
-2.201557, -1.550828, -2.129735, 1, 0.04705882, 0, 1,
-2.178265, 0.19626, -0.4622135, 1, 0.05490196, 0, 1,
-2.173079, -0.3180259, -2.213197, 1, 0.05882353, 0, 1,
-2.170604, -0.5937771, -2.217634, 1, 0.06666667, 0, 1,
-2.135345, -0.4738223, -1.909853, 1, 0.07058824, 0, 1,
-2.124526, 1.65884, 0.9370691, 1, 0.07843138, 0, 1,
-2.087326, -0.4679941, -1.227835, 1, 0.08235294, 0, 1,
-2.083139, -1.060957, -2.041391, 1, 0.09019608, 0, 1,
-2.049446, 1.093278, -2.172246, 1, 0.09411765, 0, 1,
-2.033454, -0.5800569, -0.1223234, 1, 0.1019608, 0, 1,
-2.03022, 0.03533357, -1.32369, 1, 0.1098039, 0, 1,
-2.021973, -0.9733287, -4.401575, 1, 0.1137255, 0, 1,
-1.999697, -0.523748, -3.019718, 1, 0.1215686, 0, 1,
-1.994913, -1.501185, -1.578541, 1, 0.1254902, 0, 1,
-1.9765, -0.4247999, -2.222613, 1, 0.1333333, 0, 1,
-1.918234, 2.056531, -1.937786, 1, 0.1372549, 0, 1,
-1.888649, -0.8045587, 0.00358399, 1, 0.145098, 0, 1,
-1.847388, 1.451249, -2.913481, 1, 0.1490196, 0, 1,
-1.846185, -0.3589961, -2.280349, 1, 0.1568628, 0, 1,
-1.841818, -0.7303037, -3.17725, 1, 0.1607843, 0, 1,
-1.836399, -1.707444, -4.196734, 1, 0.1686275, 0, 1,
-1.783855, 0.7465231, -1.526057, 1, 0.172549, 0, 1,
-1.782868, -1.485389, -5.177744, 1, 0.1803922, 0, 1,
-1.779572, -0.6134421, -1.670043, 1, 0.1843137, 0, 1,
-1.764059, -0.4100344, -2.12681, 1, 0.1921569, 0, 1,
-1.752411, -0.4167316, -1.167494, 1, 0.1960784, 0, 1,
-1.734046, 0.4010344, -0.8192433, 1, 0.2039216, 0, 1,
-1.717059, -0.5169354, -2.40349, 1, 0.2117647, 0, 1,
-1.714128, 1.015643, -1.416882, 1, 0.2156863, 0, 1,
-1.708692, -1.233362, 0.430458, 1, 0.2235294, 0, 1,
-1.707351, 0.1056559, -3.660075, 1, 0.227451, 0, 1,
-1.67631, -0.8670924, -2.146402, 1, 0.2352941, 0, 1,
-1.675688, 0.9881628, -0.4481349, 1, 0.2392157, 0, 1,
-1.675548, 0.6423547, -1.836237, 1, 0.2470588, 0, 1,
-1.67108, 0.2048263, -2.962383, 1, 0.2509804, 0, 1,
-1.669302, 1.67139, -0.8910754, 1, 0.2588235, 0, 1,
-1.668234, 1.755857, -0.4288066, 1, 0.2627451, 0, 1,
-1.66417, -0.4753042, -0.7034541, 1, 0.2705882, 0, 1,
-1.658304, 1.30897, -0.3414176, 1, 0.2745098, 0, 1,
-1.654147, -0.3450166, -1.220335, 1, 0.282353, 0, 1,
-1.635321, 0.626378, -2.323933, 1, 0.2862745, 0, 1,
-1.632576, -0.6156647, -2.333131, 1, 0.2941177, 0, 1,
-1.630155, 1.165765, -0.7227766, 1, 0.3019608, 0, 1,
-1.620109, -2.216774, -1.92087, 1, 0.3058824, 0, 1,
-1.601824, -0.7726923, -1.36434, 1, 0.3137255, 0, 1,
-1.598994, 1.598918, -0.9003959, 1, 0.3176471, 0, 1,
-1.582877, 0.8100948, -2.287248, 1, 0.3254902, 0, 1,
-1.582855, 2.343755, 0.5176411, 1, 0.3294118, 0, 1,
-1.57783, -2.002393, -0.2337394, 1, 0.3372549, 0, 1,
-1.571704, 2.012951, -1.277783, 1, 0.3411765, 0, 1,
-1.550587, 1.025086, 1.44335, 1, 0.3490196, 0, 1,
-1.54576, -0.4048505, -1.83848, 1, 0.3529412, 0, 1,
-1.541319, 0.971673, 0.6497551, 1, 0.3607843, 0, 1,
-1.540442, -0.2239448, -1.051068, 1, 0.3647059, 0, 1,
-1.507746, 0.4516672, -3.429551, 1, 0.372549, 0, 1,
-1.502725, 0.4352194, -0.8097589, 1, 0.3764706, 0, 1,
-1.500489, 0.006361711, -3.253944, 1, 0.3843137, 0, 1,
-1.499298, -0.3420255, -2.239134, 1, 0.3882353, 0, 1,
-1.495694, -0.6494465, -2.141385, 1, 0.3960784, 0, 1,
-1.487346, 1.031773, -2.200686, 1, 0.4039216, 0, 1,
-1.485085, 1.958512, -1.264351, 1, 0.4078431, 0, 1,
-1.483536, -0.09952116, -2.19996, 1, 0.4156863, 0, 1,
-1.472679, -0.9706214, -3.951426, 1, 0.4196078, 0, 1,
-1.470996, -0.8908035, -0.7301134, 1, 0.427451, 0, 1,
-1.458741, -1.041664, -0.6963119, 1, 0.4313726, 0, 1,
-1.456394, -0.1668661, -1.650922, 1, 0.4392157, 0, 1,
-1.455996, -1.528624, -3.611737, 1, 0.4431373, 0, 1,
-1.447563, 0.7334184, -1.005634, 1, 0.4509804, 0, 1,
-1.439124, -0.9975876, -1.73631, 1, 0.454902, 0, 1,
-1.434218, 2.01908, -0.8241122, 1, 0.4627451, 0, 1,
-1.418569, 0.1355458, -0.2525093, 1, 0.4666667, 0, 1,
-1.414066, -0.8859677, -1.243898, 1, 0.4745098, 0, 1,
-1.403973, -0.8039411, -2.238112, 1, 0.4784314, 0, 1,
-1.402788, -0.7908777, -1.81811, 1, 0.4862745, 0, 1,
-1.396973, -1.228939, -1.142295, 1, 0.4901961, 0, 1,
-1.392658, -0.1755975, -1.73459, 1, 0.4980392, 0, 1,
-1.39166, -0.1971194, -1.988908, 1, 0.5058824, 0, 1,
-1.382543, -0.2381, -3.180187, 1, 0.509804, 0, 1,
-1.381714, -0.2046864, -3.104098, 1, 0.5176471, 0, 1,
-1.372123, 1.406048, -1.137556, 1, 0.5215687, 0, 1,
-1.367808, 0.4157783, 0.3735384, 1, 0.5294118, 0, 1,
-1.354795, 0.6732086, -1.384925, 1, 0.5333334, 0, 1,
-1.342568, 1.223915, 0.5680012, 1, 0.5411765, 0, 1,
-1.340306, 0.669715, -1.115298, 1, 0.5450981, 0, 1,
-1.339148, 0.5755916, -0.08625415, 1, 0.5529412, 0, 1,
-1.338078, -0.09508203, -3.388434, 1, 0.5568628, 0, 1,
-1.329719, 2.158492, -1.640833, 1, 0.5647059, 0, 1,
-1.319348, -0.1704701, -3.113426, 1, 0.5686275, 0, 1,
-1.314856, 0.1257068, -0.7802547, 1, 0.5764706, 0, 1,
-1.310166, 1.567275, -2.030312, 1, 0.5803922, 0, 1,
-1.305093, 1.5042, 0.8038119, 1, 0.5882353, 0, 1,
-1.301801, 1.372176, -2.225297, 1, 0.5921569, 0, 1,
-1.300248, 0.2718451, -1.026001, 1, 0.6, 0, 1,
-1.297779, 2.284556, 0.1166092, 1, 0.6078432, 0, 1,
-1.297734, 0.2087076, -1.163848, 1, 0.6117647, 0, 1,
-1.296086, 0.4722109, 0.2914628, 1, 0.6196079, 0, 1,
-1.295261, 0.6986021, -2.661807, 1, 0.6235294, 0, 1,
-1.286288, 0.7161364, -3.111923, 1, 0.6313726, 0, 1,
-1.28317, 1.475934, -0.5705305, 1, 0.6352941, 0, 1,
-1.282772, -0.476703, -0.4649824, 1, 0.6431373, 0, 1,
-1.280634, 0.4466035, -2.023137, 1, 0.6470588, 0, 1,
-1.279532, 0.6050256, -0.9511505, 1, 0.654902, 0, 1,
-1.265632, 1.652376, -1.578896, 1, 0.6588235, 0, 1,
-1.263874, -2.777062, -2.386362, 1, 0.6666667, 0, 1,
-1.256507, -1.540715, -4.138491, 1, 0.6705883, 0, 1,
-1.25552, -0.07466468, -4.343657, 1, 0.6784314, 0, 1,
-1.252677, 1.442012, 0.5731468, 1, 0.682353, 0, 1,
-1.248384, -0.5302267, -1.336834, 1, 0.6901961, 0, 1,
-1.24622, 0.1220921, -2.392705, 1, 0.6941177, 0, 1,
-1.242681, -0.03991846, -2.719432, 1, 0.7019608, 0, 1,
-1.230262, -0.6382776, -2.121316, 1, 0.7098039, 0, 1,
-1.229866, 0.03176865, -0.6201605, 1, 0.7137255, 0, 1,
-1.226156, -1.412183, -0.5597619, 1, 0.7215686, 0, 1,
-1.21298, 1.352992, -1.104383, 1, 0.7254902, 0, 1,
-1.212689, -0.988135, -4.966749, 1, 0.7333333, 0, 1,
-1.180435, 1.184008, -0.343942, 1, 0.7372549, 0, 1,
-1.175984, -0.2201988, -2.421523, 1, 0.7450981, 0, 1,
-1.175818, -3.010387, -3.588226, 1, 0.7490196, 0, 1,
-1.168209, 0.404238, -2.178582, 1, 0.7568628, 0, 1,
-1.158511, -0.4519387, -2.517671, 1, 0.7607843, 0, 1,
-1.156823, 1.549119, 1.035239, 1, 0.7686275, 0, 1,
-1.156182, 0.1187119, -0.04209751, 1, 0.772549, 0, 1,
-1.15393, 0.3443802, -1.661959, 1, 0.7803922, 0, 1,
-1.150351, 0.5797884, -0.8309739, 1, 0.7843137, 0, 1,
-1.147191, 0.3336241, -0.6564907, 1, 0.7921569, 0, 1,
-1.146363, 0.274137, -2.331214, 1, 0.7960784, 0, 1,
-1.146223, -0.9137101, -1.92242, 1, 0.8039216, 0, 1,
-1.143089, 0.21912, -0.7889175, 1, 0.8117647, 0, 1,
-1.141979, 0.525511, -0.5693008, 1, 0.8156863, 0, 1,
-1.130727, -0.2055326, -3.268239, 1, 0.8235294, 0, 1,
-1.130261, 0.6327407, -1.05005, 1, 0.827451, 0, 1,
-1.11002, 0.5587459, -0.4159139, 1, 0.8352941, 0, 1,
-1.109631, 0.3093365, -2.551452, 1, 0.8392157, 0, 1,
-1.109339, -0.2596531, -2.313695, 1, 0.8470588, 0, 1,
-1.09681, -0.5380421, -2.568768, 1, 0.8509804, 0, 1,
-1.09678, -1.155341, -3.922075, 1, 0.8588235, 0, 1,
-1.095114, -1.473156, -3.746842, 1, 0.8627451, 0, 1,
-1.087665, 0.6819066, -0.5202184, 1, 0.8705882, 0, 1,
-1.081359, 1.15715, -2.464477, 1, 0.8745098, 0, 1,
-1.074019, 0.3033826, -1.75845, 1, 0.8823529, 0, 1,
-1.069268, -1.054623, -1.535242, 1, 0.8862745, 0, 1,
-1.06868, 0.5129031, -1.667175, 1, 0.8941177, 0, 1,
-1.052566, 0.9804277, -1.185194, 1, 0.8980392, 0, 1,
-1.046194, 1.315746, -0.4633646, 1, 0.9058824, 0, 1,
-1.037984, -0.02347871, -0.3323631, 1, 0.9137255, 0, 1,
-1.032885, 0.8355566, -1.715312, 1, 0.9176471, 0, 1,
-1.030772, 1.480874, -0.1086247, 1, 0.9254902, 0, 1,
-1.022514, 0.1645545, -1.813511, 1, 0.9294118, 0, 1,
-1.020729, -0.2587004, -1.702471, 1, 0.9372549, 0, 1,
-1.015678, 0.03998126, -0.6689084, 1, 0.9411765, 0, 1,
-1.012585, 0.3162812, -1.367935, 1, 0.9490196, 0, 1,
-1.012079, -1.624662, -2.845941, 1, 0.9529412, 0, 1,
-1.007858, 1.679474, 0.5862198, 1, 0.9607843, 0, 1,
-0.999007, -0.714552, -2.70937, 1, 0.9647059, 0, 1,
-0.9886098, -1.466634, -2.329827, 1, 0.972549, 0, 1,
-0.9852332, -0.4874004, -0.7509092, 1, 0.9764706, 0, 1,
-0.9807666, -1.180009, -2.921101, 1, 0.9843137, 0, 1,
-0.9802309, 0.7186294, 0.2385442, 1, 0.9882353, 0, 1,
-0.9783596, 1.866916, 0.396633, 1, 0.9960784, 0, 1,
-0.9776951, 0.4388791, -1.430979, 0.9960784, 1, 0, 1,
-0.9775067, 0.3160462, -1.273734, 0.9921569, 1, 0, 1,
-0.9756892, 0.257951, -1.110215, 0.9843137, 1, 0, 1,
-0.9747831, -0.3707751, -1.812915, 0.9803922, 1, 0, 1,
-0.9723979, -1.339638, -3.407, 0.972549, 1, 0, 1,
-0.9714751, 0.5604461, -0.2611063, 0.9686275, 1, 0, 1,
-0.9702689, -1.951685, -0.6305385, 0.9607843, 1, 0, 1,
-0.9675164, -1.300079, -3.606553, 0.9568627, 1, 0, 1,
-0.9631227, -1.193371, -2.040076, 0.9490196, 1, 0, 1,
-0.9619705, -0.5605152, -3.654112, 0.945098, 1, 0, 1,
-0.9611157, 0.1211899, 0.4230582, 0.9372549, 1, 0, 1,
-0.9605417, -0.9892, -1.69009, 0.9333333, 1, 0, 1,
-0.9570369, -0.08344205, -2.022027, 0.9254902, 1, 0, 1,
-0.9492581, 0.2200107, -1.504234, 0.9215686, 1, 0, 1,
-0.9461486, 0.6071846, -0.977361, 0.9137255, 1, 0, 1,
-0.9451442, -0.4500576, -2.45948, 0.9098039, 1, 0, 1,
-0.9427693, -0.1909045, -1.873838, 0.9019608, 1, 0, 1,
-0.942752, -1.094501, -2.281091, 0.8941177, 1, 0, 1,
-0.9346986, -0.7774808, -2.092765, 0.8901961, 1, 0, 1,
-0.9346254, -0.4021109, -1.795317, 0.8823529, 1, 0, 1,
-0.9334981, 1.227821, -0.2567004, 0.8784314, 1, 0, 1,
-0.9332992, 0.2395902, -1.677891, 0.8705882, 1, 0, 1,
-0.9327215, 0.8508332, 0.5264579, 0.8666667, 1, 0, 1,
-0.9312053, -0.3538125, -2.351404, 0.8588235, 1, 0, 1,
-0.9291932, 0.5548816, -0.7211077, 0.854902, 1, 0, 1,
-0.9236519, 0.3171751, -1.261631, 0.8470588, 1, 0, 1,
-0.9202927, 1.294427, 0.2276815, 0.8431373, 1, 0, 1,
-0.9116592, 0.542133, -0.7215664, 0.8352941, 1, 0, 1,
-0.9111627, 0.8930998, -1.567486, 0.8313726, 1, 0, 1,
-0.9061468, -0.9144792, -3.968723, 0.8235294, 1, 0, 1,
-0.9052, 0.4513051, -0.03100994, 0.8196079, 1, 0, 1,
-0.903873, 1.408612, 0.5672584, 0.8117647, 1, 0, 1,
-0.9016738, -0.7804775, -3.609574, 0.8078431, 1, 0, 1,
-0.9005349, -1.497694, -2.800984, 0.8, 1, 0, 1,
-0.8975246, 0.8497555, -1.334096, 0.7921569, 1, 0, 1,
-0.8955566, -0.5654993, -1.680514, 0.7882353, 1, 0, 1,
-0.8946947, -1.091269, -2.130126, 0.7803922, 1, 0, 1,
-0.894229, -1.286674, -1.741581, 0.7764706, 1, 0, 1,
-0.8920262, 0.5092946, -0.3543443, 0.7686275, 1, 0, 1,
-0.8884742, 0.03628968, -1.963019, 0.7647059, 1, 0, 1,
-0.8841309, -0.6306162, -1.841595, 0.7568628, 1, 0, 1,
-0.8698596, 0.2738469, -1.418993, 0.7529412, 1, 0, 1,
-0.8665336, -1.283386, -3.816887, 0.7450981, 1, 0, 1,
-0.8644274, 1.184338, -0.9730005, 0.7411765, 1, 0, 1,
-0.8643832, -0.9280301, -1.905691, 0.7333333, 1, 0, 1,
-0.8593461, 1.370604, -1.35751, 0.7294118, 1, 0, 1,
-0.8577085, -1.924734, -2.981697, 0.7215686, 1, 0, 1,
-0.8563563, 1.009252, -1.049598, 0.7176471, 1, 0, 1,
-0.8549116, 0.4798416, -1.636166, 0.7098039, 1, 0, 1,
-0.8495864, 2.045546, 1.306448, 0.7058824, 1, 0, 1,
-0.8465915, -0.4097149, -1.914495, 0.6980392, 1, 0, 1,
-0.8454975, -0.4060662, -3.417653, 0.6901961, 1, 0, 1,
-0.8434899, -2.205622, -4.221826, 0.6862745, 1, 0, 1,
-0.8400869, 0.8910785, -0.3475421, 0.6784314, 1, 0, 1,
-0.8383254, -0.1360569, -1.165896, 0.6745098, 1, 0, 1,
-0.8380507, 0.3062244, 0.3885558, 0.6666667, 1, 0, 1,
-0.8361166, 0.03569482, -2.276639, 0.6627451, 1, 0, 1,
-0.8354243, 0.8008352, 0.4310193, 0.654902, 1, 0, 1,
-0.8337809, -0.09018437, -2.421755, 0.6509804, 1, 0, 1,
-0.8278909, -0.4810175, -2.608802, 0.6431373, 1, 0, 1,
-0.8235222, 0.01031511, -0.8134494, 0.6392157, 1, 0, 1,
-0.8189958, 1.216717, -0.1209842, 0.6313726, 1, 0, 1,
-0.8117475, -1.589907, -1.368642, 0.627451, 1, 0, 1,
-0.8117221, -0.1596088, -1.737907, 0.6196079, 1, 0, 1,
-0.8036433, 0.4908219, -1.268948, 0.6156863, 1, 0, 1,
-0.7934984, 0.3905671, -0.8306926, 0.6078432, 1, 0, 1,
-0.7932321, 1.739391, 0.4506285, 0.6039216, 1, 0, 1,
-0.7905666, -1.135667, -1.910825, 0.5960785, 1, 0, 1,
-0.785718, 0.3716225, 0.7008137, 0.5882353, 1, 0, 1,
-0.7771333, -1.601151, -1.537359, 0.5843138, 1, 0, 1,
-0.776379, 0.1361383, -2.130394, 0.5764706, 1, 0, 1,
-0.7712798, -0.5218673, -4.192379, 0.572549, 1, 0, 1,
-0.7707405, 0.492752, -0.5052911, 0.5647059, 1, 0, 1,
-0.7669885, 1.047356, 0.276044, 0.5607843, 1, 0, 1,
-0.7656345, -1.786232, -2.924198, 0.5529412, 1, 0, 1,
-0.7637212, -0.07182097, -2.230553, 0.5490196, 1, 0, 1,
-0.7622848, -1.116853, -2.646456, 0.5411765, 1, 0, 1,
-0.7595111, -0.7975395, -1.761698, 0.5372549, 1, 0, 1,
-0.7550919, -1.817081, -2.183945, 0.5294118, 1, 0, 1,
-0.7526772, -1.088927, -4.361352, 0.5254902, 1, 0, 1,
-0.752277, -0.4614932, -2.25784, 0.5176471, 1, 0, 1,
-0.75222, 1.129776, -0.1119026, 0.5137255, 1, 0, 1,
-0.7483947, 1.851969, -1.469956, 0.5058824, 1, 0, 1,
-0.7477301, 0.2979676, -2.002339, 0.5019608, 1, 0, 1,
-0.7475508, -0.1225509, -2.1757, 0.4941176, 1, 0, 1,
-0.7465919, -0.7210912, -1.855015, 0.4862745, 1, 0, 1,
-0.7431769, -0.9377992, -4.018587, 0.4823529, 1, 0, 1,
-0.7417292, 0.7962018, -1.424303, 0.4745098, 1, 0, 1,
-0.7406543, 0.02057733, -0.7712045, 0.4705882, 1, 0, 1,
-0.7356514, 1.020262, -0.6441675, 0.4627451, 1, 0, 1,
-0.7342576, 0.5160175, -0.7033789, 0.4588235, 1, 0, 1,
-0.7314222, 1.543823, -0.7790378, 0.4509804, 1, 0, 1,
-0.7297921, 0.9121017, -2.293468, 0.4470588, 1, 0, 1,
-0.7220867, 2.396307, -1.41436, 0.4392157, 1, 0, 1,
-0.7217233, -1.082321, -2.733249, 0.4352941, 1, 0, 1,
-0.709397, -0.4867163, -3.450422, 0.427451, 1, 0, 1,
-0.7052073, -1.905742, -2.241384, 0.4235294, 1, 0, 1,
-0.7048425, -0.6152639, -3.14223, 0.4156863, 1, 0, 1,
-0.7019784, 1.224021, -2.111337, 0.4117647, 1, 0, 1,
-0.6945006, -1.325708, -2.996725, 0.4039216, 1, 0, 1,
-0.6918451, -1.171482, -2.352208, 0.3960784, 1, 0, 1,
-0.690768, 1.829163, -1.275458, 0.3921569, 1, 0, 1,
-0.6866592, -1.299739, -3.295686, 0.3843137, 1, 0, 1,
-0.6809379, 0.3604146, -2.170717, 0.3803922, 1, 0, 1,
-0.6782321, 0.5176728, -2.640278, 0.372549, 1, 0, 1,
-0.6694977, 0.8796533, -0.1698099, 0.3686275, 1, 0, 1,
-0.6658818, 0.1452854, -1.209161, 0.3607843, 1, 0, 1,
-0.6639732, 2.957674, -1.415018, 0.3568628, 1, 0, 1,
-0.6586992, 0.3338411, -0.972246, 0.3490196, 1, 0, 1,
-0.6579441, -0.7399334, -1.341446, 0.345098, 1, 0, 1,
-0.656123, -0.1650514, -2.47599, 0.3372549, 1, 0, 1,
-0.6541077, -2.525433, -1.324547, 0.3333333, 1, 0, 1,
-0.6533163, -0.6516212, -0.698477, 0.3254902, 1, 0, 1,
-0.6509678, 1.747867, 1.548671, 0.3215686, 1, 0, 1,
-0.6493039, 0.8337282, -1.58922, 0.3137255, 1, 0, 1,
-0.649124, -1.700612, -2.254081, 0.3098039, 1, 0, 1,
-0.6481041, 0.2643413, 0.5585262, 0.3019608, 1, 0, 1,
-0.6450797, -0.1979915, -2.337431, 0.2941177, 1, 0, 1,
-0.6409855, -0.1691756, -3.674632, 0.2901961, 1, 0, 1,
-0.6392677, -0.9171022, -4.831944, 0.282353, 1, 0, 1,
-0.6316102, 0.5897447, 0.5460296, 0.2784314, 1, 0, 1,
-0.631459, 2.090615, 0.2103783, 0.2705882, 1, 0, 1,
-0.625649, -0.01480469, -0.3464306, 0.2666667, 1, 0, 1,
-0.6239747, -0.1133331, -1.847622, 0.2588235, 1, 0, 1,
-0.6193928, -0.01614428, -0.9640254, 0.254902, 1, 0, 1,
-0.6190661, -1.244337, -2.989864, 0.2470588, 1, 0, 1,
-0.6173944, -0.8409749, -1.873208, 0.2431373, 1, 0, 1,
-0.6165488, 0.2468312, 0.2839112, 0.2352941, 1, 0, 1,
-0.6152816, -1.100599, -2.224638, 0.2313726, 1, 0, 1,
-0.6147639, 1.149969, -1.976357, 0.2235294, 1, 0, 1,
-0.6141701, 0.2384095, -1.374192, 0.2196078, 1, 0, 1,
-0.6131654, -0.9617028, -1.513631, 0.2117647, 1, 0, 1,
-0.6068394, -0.8643101, -2.021666, 0.2078431, 1, 0, 1,
-0.6042477, -0.08111823, -1.432023, 0.2, 1, 0, 1,
-0.5968773, -1.183084, -2.986733, 0.1921569, 1, 0, 1,
-0.5927302, -0.8321871, -0.7325578, 0.1882353, 1, 0, 1,
-0.5853062, 0.3169571, -1.272266, 0.1803922, 1, 0, 1,
-0.5839712, -0.6901675, -3.205346, 0.1764706, 1, 0, 1,
-0.5825095, -0.3750811, -1.62975, 0.1686275, 1, 0, 1,
-0.5824698, -0.5569376, -4.122922, 0.1647059, 1, 0, 1,
-0.5790172, 0.2464469, -1.750105, 0.1568628, 1, 0, 1,
-0.5782191, 0.1630829, -0.4967043, 0.1529412, 1, 0, 1,
-0.5719605, -0.09977563, 0.01307674, 0.145098, 1, 0, 1,
-0.5709345, -0.6848014, -3.007419, 0.1411765, 1, 0, 1,
-0.5698401, -1.507731, -2.43757, 0.1333333, 1, 0, 1,
-0.5694203, 0.07559136, 0.1416743, 0.1294118, 1, 0, 1,
-0.5688892, 1.371151, -3.575552, 0.1215686, 1, 0, 1,
-0.5649664, -1.452112, -2.535212, 0.1176471, 1, 0, 1,
-0.5597019, -0.3192169, -3.221818, 0.1098039, 1, 0, 1,
-0.5581406, -0.7888263, -2.429263, 0.1058824, 1, 0, 1,
-0.555805, 1.459977, -0.06076196, 0.09803922, 1, 0, 1,
-0.5539442, -0.4386359, -1.458293, 0.09019608, 1, 0, 1,
-0.5524638, 0.1757189, 0.1063528, 0.08627451, 1, 0, 1,
-0.5504966, -0.6625864, -3.284928, 0.07843138, 1, 0, 1,
-0.5493495, 0.698095, -0.5269199, 0.07450981, 1, 0, 1,
-0.5419781, 0.6734858, -1.168551, 0.06666667, 1, 0, 1,
-0.5414219, -0.1556738, -1.808793, 0.0627451, 1, 0, 1,
-0.5390905, 0.1122279, -1.462489, 0.05490196, 1, 0, 1,
-0.5380982, -0.4955711, -0.7539101, 0.05098039, 1, 0, 1,
-0.5375884, 0.5352039, -0.1560527, 0.04313726, 1, 0, 1,
-0.5289318, -1.043596, -2.911085, 0.03921569, 1, 0, 1,
-0.5287458, -0.1956803, -2.158658, 0.03137255, 1, 0, 1,
-0.526827, 0.9963009, -1.028382, 0.02745098, 1, 0, 1,
-0.5252064, -2.279735, -2.905962, 0.01960784, 1, 0, 1,
-0.5238338, 0.2741124, -1.957567, 0.01568628, 1, 0, 1,
-0.5213214, 0.4604637, -1.770434, 0.007843138, 1, 0, 1,
-0.5194132, -0.9218146, -0.6562189, 0.003921569, 1, 0, 1,
-0.5139184, 0.5458311, -1.465722, 0, 1, 0.003921569, 1,
-0.5112351, -0.5564684, -1.947002, 0, 1, 0.01176471, 1,
-0.5050987, -0.4506286, -0.4399698, 0, 1, 0.01568628, 1,
-0.4969787, -2.07058, -3.302644, 0, 1, 0.02352941, 1,
-0.484357, -0.9101806, -3.972076, 0, 1, 0.02745098, 1,
-0.4835318, -0.5832441, -3.368751, 0, 1, 0.03529412, 1,
-0.4833774, -0.2067751, -2.502896, 0, 1, 0.03921569, 1,
-0.4829729, -0.1905351, -1.700938, 0, 1, 0.04705882, 1,
-0.4820621, 0.3977228, -1.228618, 0, 1, 0.05098039, 1,
-0.4799947, -0.8815327, -4.159173, 0, 1, 0.05882353, 1,
-0.4703279, 0.5853356, 0.4616653, 0, 1, 0.0627451, 1,
-0.4700888, 0.3949587, -0.7806441, 0, 1, 0.07058824, 1,
-0.4697773, -1.090885, -3.993018, 0, 1, 0.07450981, 1,
-0.4666575, 0.5156842, -1.848999, 0, 1, 0.08235294, 1,
-0.4656409, -0.6941956, -4.379397, 0, 1, 0.08627451, 1,
-0.4640363, -1.265736, -2.509722, 0, 1, 0.09411765, 1,
-0.4627802, 0.5528757, -1.191291, 0, 1, 0.1019608, 1,
-0.460732, 0.01431144, -2.052734, 0, 1, 0.1058824, 1,
-0.4602917, 0.2574788, -2.322051, 0, 1, 0.1137255, 1,
-0.4508698, -2.269343, -3.812401, 0, 1, 0.1176471, 1,
-0.4496483, 0.4357655, 0.2243207, 0, 1, 0.1254902, 1,
-0.4458449, 0.5424644, -1.163453, 0, 1, 0.1294118, 1,
-0.4457696, 0.6000448, -0.1992806, 0, 1, 0.1372549, 1,
-0.4450771, -0.3540494, -2.793139, 0, 1, 0.1411765, 1,
-0.4444309, 0.09110456, -0.2220637, 0, 1, 0.1490196, 1,
-0.4436903, 0.1565363, -2.531431, 0, 1, 0.1529412, 1,
-0.4413955, 0.7168185, -0.4051629, 0, 1, 0.1607843, 1,
-0.4410608, -1.07522, -4.879605, 0, 1, 0.1647059, 1,
-0.4353373, 0.2409325, -2.005833, 0, 1, 0.172549, 1,
-0.4347274, 0.8654748, -1.396619, 0, 1, 0.1764706, 1,
-0.4331829, -0.3357745, -0.8994815, 0, 1, 0.1843137, 1,
-0.4320104, 0.02959905, -3.018033, 0, 1, 0.1882353, 1,
-0.431437, 1.511342, -0.2826357, 0, 1, 0.1960784, 1,
-0.4314199, -1.58204, -2.819311, 0, 1, 0.2039216, 1,
-0.4314009, -0.7227275, -1.199704, 0, 1, 0.2078431, 1,
-0.4275704, 0.09940426, 0.3027394, 0, 1, 0.2156863, 1,
-0.4255305, 1.044265, -1.454535, 0, 1, 0.2196078, 1,
-0.4217908, 0.7142239, 2.354288, 0, 1, 0.227451, 1,
-0.4188799, 0.4872765, -1.053906, 0, 1, 0.2313726, 1,
-0.4168682, 1.359127, -0.9608839, 0, 1, 0.2392157, 1,
-0.4159612, 1.076357, -0.4447184, 0, 1, 0.2431373, 1,
-0.4152602, -0.3848355, -3.384397, 0, 1, 0.2509804, 1,
-0.4139449, -0.1870925, -1.277719, 0, 1, 0.254902, 1,
-0.4120471, -0.4323442, -1.981276, 0, 1, 0.2627451, 1,
-0.4051646, -0.7009535, -1.531892, 0, 1, 0.2666667, 1,
-0.3969585, 0.5626568, -2.15645, 0, 1, 0.2745098, 1,
-0.3944518, 0.8139571, -0.9267762, 0, 1, 0.2784314, 1,
-0.3917392, -0.04855656, -2.515857, 0, 1, 0.2862745, 1,
-0.3890941, 1.394355, -1.655448, 0, 1, 0.2901961, 1,
-0.3858942, -1.028648, -2.268425, 0, 1, 0.2980392, 1,
-0.3802202, 0.6090894, -0.04591575, 0, 1, 0.3058824, 1,
-0.3783003, -0.6447119, -4.213498, 0, 1, 0.3098039, 1,
-0.3777085, 1.45699, -0.1451879, 0, 1, 0.3176471, 1,
-0.3775387, -1.131974, -4.248831, 0, 1, 0.3215686, 1,
-0.3759535, 0.2372945, -1.588302, 0, 1, 0.3294118, 1,
-0.3745599, 1.493869, 0.5572982, 0, 1, 0.3333333, 1,
-0.3708201, -1.279186, -4.084388, 0, 1, 0.3411765, 1,
-0.3694172, 1.945714, -0.5219089, 0, 1, 0.345098, 1,
-0.3599055, 1.962471, -0.2173876, 0, 1, 0.3529412, 1,
-0.3557668, 0.8474295, -0.8883184, 0, 1, 0.3568628, 1,
-0.3536685, -0.1173908, -2.015875, 0, 1, 0.3647059, 1,
-0.3513899, -0.5074691, -0.6542508, 0, 1, 0.3686275, 1,
-0.3472318, -0.1265773, -2.217289, 0, 1, 0.3764706, 1,
-0.345772, -0.6359948, -2.401172, 0, 1, 0.3803922, 1,
-0.3443095, 1.800781, 0.4361588, 0, 1, 0.3882353, 1,
-0.3332811, 0.8080103, -0.8213962, 0, 1, 0.3921569, 1,
-0.3330147, 0.1494631, -1.628315, 0, 1, 0.4, 1,
-0.3303374, -2.309354, -2.965917, 0, 1, 0.4078431, 1,
-0.3264169, -0.1257854, -2.149274, 0, 1, 0.4117647, 1,
-0.3258539, 1.153992, 0.7891228, 0, 1, 0.4196078, 1,
-0.3226281, -1.210312, -3.987531, 0, 1, 0.4235294, 1,
-0.3202715, 0.3223508, 1.416608, 0, 1, 0.4313726, 1,
-0.3188547, -0.9099184, -3.475857, 0, 1, 0.4352941, 1,
-0.3094487, 1.189672, 0.07301864, 0, 1, 0.4431373, 1,
-0.3077602, -0.2520843, -1.762471, 0, 1, 0.4470588, 1,
-0.307294, -0.3081645, -2.716509, 0, 1, 0.454902, 1,
-0.3031255, 0.7161028, -0.001076758, 0, 1, 0.4588235, 1,
-0.3024083, 0.3399976, -0.7826644, 0, 1, 0.4666667, 1,
-0.2998328, 0.004453728, -2.668949, 0, 1, 0.4705882, 1,
-0.2995757, 1.007387, 0.0658836, 0, 1, 0.4784314, 1,
-0.2979083, 1.308185, -0.06225009, 0, 1, 0.4823529, 1,
-0.297453, -1.338978, -3.547212, 0, 1, 0.4901961, 1,
-0.2960452, 0.3439573, -1.991508, 0, 1, 0.4941176, 1,
-0.2918008, 0.2691068, -0.2611925, 0, 1, 0.5019608, 1,
-0.2865392, -1.218093, -3.466404, 0, 1, 0.509804, 1,
-0.2851532, -0.1087978, -1.256379, 0, 1, 0.5137255, 1,
-0.2848511, 1.422632, -0.8284653, 0, 1, 0.5215687, 1,
-0.2846991, 0.9325233, 1.129124, 0, 1, 0.5254902, 1,
-0.2792746, -0.2387635, -2.436816, 0, 1, 0.5333334, 1,
-0.2766437, 1.23041, -0.8933142, 0, 1, 0.5372549, 1,
-0.2730125, 0.1638212, -0.815864, 0, 1, 0.5450981, 1,
-0.2725497, -0.2708272, -2.168203, 0, 1, 0.5490196, 1,
-0.2645699, -2.845972, -4.349371, 0, 1, 0.5568628, 1,
-0.2602808, 0.2952613, 0.5109698, 0, 1, 0.5607843, 1,
-0.2601991, -1.548363, -2.755029, 0, 1, 0.5686275, 1,
-0.2571853, -0.9610841, -2.353876, 0, 1, 0.572549, 1,
-0.2526188, -0.2427039, -1.775497, 0, 1, 0.5803922, 1,
-0.2523578, -0.2653738, -2.753606, 0, 1, 0.5843138, 1,
-0.243103, -0.04628266, -2.29661, 0, 1, 0.5921569, 1,
-0.2424489, 0.3683788, 0.622208, 0, 1, 0.5960785, 1,
-0.2404786, -0.005198185, -1.589647, 0, 1, 0.6039216, 1,
-0.2392482, 1.463551, -0.933004, 0, 1, 0.6117647, 1,
-0.2365099, 0.52452, -1.297113, 0, 1, 0.6156863, 1,
-0.2358106, -0.1059038, -3.517187, 0, 1, 0.6235294, 1,
-0.2354227, -1.410962, -3.590316, 0, 1, 0.627451, 1,
-0.2311309, -0.2306734, -0.4646774, 0, 1, 0.6352941, 1,
-0.2310325, 1.225219, -1.674545, 0, 1, 0.6392157, 1,
-0.2304951, -1.087758, -3.09528, 0, 1, 0.6470588, 1,
-0.2210734, 1.669422, -1.643309, 0, 1, 0.6509804, 1,
-0.2179748, 0.04658897, -2.174731, 0, 1, 0.6588235, 1,
-0.2123871, -2.643345, -3.833518, 0, 1, 0.6627451, 1,
-0.2107118, 0.2152931, -2.164222, 0, 1, 0.6705883, 1,
-0.2105383, -1.30097, -3.22471, 0, 1, 0.6745098, 1,
-0.2099448, -1.407842, -3.611453, 0, 1, 0.682353, 1,
-0.2098784, -0.01487344, -0.6425353, 0, 1, 0.6862745, 1,
-0.207266, 0.03834994, -1.731951, 0, 1, 0.6941177, 1,
-0.2049091, 0.3004895, -0.148956, 0, 1, 0.7019608, 1,
-0.2033609, 0.3591825, 0.9696426, 0, 1, 0.7058824, 1,
-0.2032975, -0.05187567, -0.6035249, 0, 1, 0.7137255, 1,
-0.2029959, 0.8093279, -0.3835341, 0, 1, 0.7176471, 1,
-0.2002738, -0.4446956, -2.324294, 0, 1, 0.7254902, 1,
-0.1988438, 1.247212, 0.009105363, 0, 1, 0.7294118, 1,
-0.1953681, 0.5789286, -0.6639737, 0, 1, 0.7372549, 1,
-0.1949108, -0.7012788, -1.43686, 0, 1, 0.7411765, 1,
-0.1882334, 0.5101015, -0.4369113, 0, 1, 0.7490196, 1,
-0.1810313, -0.7632843, -2.182738, 0, 1, 0.7529412, 1,
-0.1794525, -0.655959, -0.9767896, 0, 1, 0.7607843, 1,
-0.1788506, -1.148218, -2.78502, 0, 1, 0.7647059, 1,
-0.1776445, -1.232757, -4.30526, 0, 1, 0.772549, 1,
-0.177048, -1.192967, -3.415046, 0, 1, 0.7764706, 1,
-0.1756223, 1.520063, -1.012378, 0, 1, 0.7843137, 1,
-0.1706159, 1.213689, 1.095086, 0, 1, 0.7882353, 1,
-0.1701153, -0.4625998, -1.920759, 0, 1, 0.7960784, 1,
-0.1634277, -1.217162, -3.382182, 0, 1, 0.8039216, 1,
-0.1630145, 1.335418, -1.297236, 0, 1, 0.8078431, 1,
-0.1589167, -0.3253222, -2.51513, 0, 1, 0.8156863, 1,
-0.1559607, 1.10853, 0.6739427, 0, 1, 0.8196079, 1,
-0.1558162, 0.4701354, -1.859262, 0, 1, 0.827451, 1,
-0.1540409, -0.6801496, -4.258255, 0, 1, 0.8313726, 1,
-0.1526942, 0.6262555, -0.05129715, 0, 1, 0.8392157, 1,
-0.1502426, -0.5964391, -3.280556, 0, 1, 0.8431373, 1,
-0.1459295, 0.7175088, -0.0686781, 0, 1, 0.8509804, 1,
-0.1423725, 0.5348296, 0.01692208, 0, 1, 0.854902, 1,
-0.1411093, -1.320854, -4.032862, 0, 1, 0.8627451, 1,
-0.1372686, 0.6043106, -0.04086135, 0, 1, 0.8666667, 1,
-0.133545, 0.09399463, -0.4450701, 0, 1, 0.8745098, 1,
-0.1236665, -0.3522556, -3.190114, 0, 1, 0.8784314, 1,
-0.1212557, 1.777602, -0.3670737, 0, 1, 0.8862745, 1,
-0.1198006, 1.139367, -0.3082357, 0, 1, 0.8901961, 1,
-0.1143785, -1.121205, -1.977724, 0, 1, 0.8980392, 1,
-0.1102539, -0.5212665, -2.398694, 0, 1, 0.9058824, 1,
-0.1096101, -0.6920719, -2.77403, 0, 1, 0.9098039, 1,
-0.1070682, -0.4309793, -1.755792, 0, 1, 0.9176471, 1,
-0.1004323, 0.7431014, -1.09633, 0, 1, 0.9215686, 1,
-0.09924592, 1.182626, -0.8774924, 0, 1, 0.9294118, 1,
-0.09803293, -0.2214113, -3.287895, 0, 1, 0.9333333, 1,
-0.09362401, -0.5390223, -3.503098, 0, 1, 0.9411765, 1,
-0.09129515, -0.2785319, -2.812748, 0, 1, 0.945098, 1,
-0.09063456, 1.021218, -0.1016222, 0, 1, 0.9529412, 1,
-0.08533924, 1.779673, -0.227976, 0, 1, 0.9568627, 1,
-0.08278178, -0.4163842, -2.550484, 0, 1, 0.9647059, 1,
-0.07419395, -1.577718, -3.718545, 0, 1, 0.9686275, 1,
-0.07122046, -0.553508, -4.359748, 0, 1, 0.9764706, 1,
-0.07049397, 0.4249136, 1.829962, 0, 1, 0.9803922, 1,
-0.06923825, -0.6618953, -3.08105, 0, 1, 0.9882353, 1,
-0.06673632, 0.3633395, 1.110598, 0, 1, 0.9921569, 1,
-0.06509746, 1.833826, -0.07863747, 0, 1, 1, 1,
-0.06394961, 0.8451781, 1.241235, 0, 0.9921569, 1, 1,
-0.06320386, -0.9679875, -2.184809, 0, 0.9882353, 1, 1,
-0.06138573, 0.6383637, -1.264089, 0, 0.9803922, 1, 1,
-0.06011057, 0.1821887, 0.577438, 0, 0.9764706, 1, 1,
-0.05927492, 0.4370795, -2.263657, 0, 0.9686275, 1, 1,
-0.05716643, 0.5372095, 0.4052102, 0, 0.9647059, 1, 1,
-0.0552402, -2.742775, -2.569952, 0, 0.9568627, 1, 1,
-0.0547253, 0.3506076, 0.4667047, 0, 0.9529412, 1, 1,
-0.0537127, -2.444445, -3.853554, 0, 0.945098, 1, 1,
-0.04861674, -0.8096638, -2.032214, 0, 0.9411765, 1, 1,
-0.04596013, 0.06003595, 0.5742217, 0, 0.9333333, 1, 1,
-0.04289569, -1.614242, -3.389695, 0, 0.9294118, 1, 1,
-0.04261264, 0.6214248, -0.4444883, 0, 0.9215686, 1, 1,
-0.04095734, -0.5878766, -2.799662, 0, 0.9176471, 1, 1,
-0.03799937, -0.4688204, -4.254253, 0, 0.9098039, 1, 1,
-0.03234112, -1.85282, -3.942522, 0, 0.9058824, 1, 1,
-0.03026228, -0.3073629, -0.8274438, 0, 0.8980392, 1, 1,
-0.02305462, 1.534423, 0.8047951, 0, 0.8901961, 1, 1,
-0.02078667, 0.4838824, 0.237139, 0, 0.8862745, 1, 1,
-0.01480251, -0.09902021, -2.959633, 0, 0.8784314, 1, 1,
-0.01342189, -1.471352, -3.679427, 0, 0.8745098, 1, 1,
-0.009901945, 0.3408476, -0.1026657, 0, 0.8666667, 1, 1,
-0.00780628, 0.8433329, 0.347564, 0, 0.8627451, 1, 1,
-0.007168783, -0.3348938, -3.276828, 0, 0.854902, 1, 1,
-0.005582941, -0.08530369, -4.257679, 0, 0.8509804, 1, 1,
-0.002533284, -1.836627, -3.026685, 0, 0.8431373, 1, 1,
0.005192964, -1.954423, 3.285737, 0, 0.8392157, 1, 1,
0.00541115, 0.2880445, 2.090209, 0, 0.8313726, 1, 1,
0.006690891, 1.299752, -0.2559408, 0, 0.827451, 1, 1,
0.01028788, -0.4666985, 3.733799, 0, 0.8196079, 1, 1,
0.02113511, -0.5775595, 2.450668, 0, 0.8156863, 1, 1,
0.02262479, 0.3676006, -0.05855125, 0, 0.8078431, 1, 1,
0.02427952, -0.9018139, 2.395042, 0, 0.8039216, 1, 1,
0.02733665, 0.8182094, -1.090188, 0, 0.7960784, 1, 1,
0.02797361, -1.315692, 2.050595, 0, 0.7882353, 1, 1,
0.02989588, 1.760026, 1.436712, 0, 0.7843137, 1, 1,
0.02995093, -0.5269252, 2.859186, 0, 0.7764706, 1, 1,
0.03204517, 0.3228476, 0.7170429, 0, 0.772549, 1, 1,
0.03331172, -1.213782, 3.929995, 0, 0.7647059, 1, 1,
0.03602444, 1.862247, 0.8835256, 0, 0.7607843, 1, 1,
0.03929862, 0.1400596, 0.3751657, 0, 0.7529412, 1, 1,
0.03955116, -1.872018, 3.610779, 0, 0.7490196, 1, 1,
0.04057468, 0.7623051, -1.743734, 0, 0.7411765, 1, 1,
0.04263995, 0.6073244, 0.3635092, 0, 0.7372549, 1, 1,
0.0481493, -0.8453861, 4.437736, 0, 0.7294118, 1, 1,
0.05169304, -1.051232, 5.59159, 0, 0.7254902, 1, 1,
0.05231103, 1.823149, -0.3074965, 0, 0.7176471, 1, 1,
0.05303578, -0.3239276, 4.99809, 0, 0.7137255, 1, 1,
0.05415661, -0.1782833, 0.06346501, 0, 0.7058824, 1, 1,
0.05455777, 1.100833, 0.4265238, 0, 0.6980392, 1, 1,
0.06188096, -0.5064791, 2.817992, 0, 0.6941177, 1, 1,
0.06241116, -0.3672676, 2.05979, 0, 0.6862745, 1, 1,
0.06678455, 1.46688, -0.1765335, 0, 0.682353, 1, 1,
0.07206262, -0.04764555, 2.742239, 0, 0.6745098, 1, 1,
0.07370464, -1.388279, 2.840477, 0, 0.6705883, 1, 1,
0.07797116, -0.4447068, 2.59207, 0, 0.6627451, 1, 1,
0.07885011, -0.2178484, 3.581229, 0, 0.6588235, 1, 1,
0.07908793, 0.7551234, -0.9963561, 0, 0.6509804, 1, 1,
0.08387133, -0.1186781, 1.220443, 0, 0.6470588, 1, 1,
0.08744323, -0.5150727, 2.487771, 0, 0.6392157, 1, 1,
0.091255, 1.018611, 0.7049446, 0, 0.6352941, 1, 1,
0.09153809, -1.465284, 2.161144, 0, 0.627451, 1, 1,
0.09276117, -0.06805722, 2.231155, 0, 0.6235294, 1, 1,
0.09466698, 0.1172253, 1.837753, 0, 0.6156863, 1, 1,
0.09665171, -1.340795, 0.9872974, 0, 0.6117647, 1, 1,
0.09748937, 0.158805, 0.677892, 0, 0.6039216, 1, 1,
0.0996044, 0.993323, -1.098908, 0, 0.5960785, 1, 1,
0.1009127, 0.4873522, -0.005580759, 0, 0.5921569, 1, 1,
0.1083942, 0.085278, 0.3350995, 0, 0.5843138, 1, 1,
0.1097373, -0.3425518, 4.312574, 0, 0.5803922, 1, 1,
0.1099556, -0.2150058, 3.345154, 0, 0.572549, 1, 1,
0.1117705, -0.5001206, 0.2756187, 0, 0.5686275, 1, 1,
0.1182783, 0.3289057, -0.5746384, 0, 0.5607843, 1, 1,
0.1194517, -1.609391, 1.969001, 0, 0.5568628, 1, 1,
0.1206368, -0.2100991, 3.637763, 0, 0.5490196, 1, 1,
0.1210288, -0.5768629, 3.299186, 0, 0.5450981, 1, 1,
0.1230533, -1.172956, 3.241462, 0, 0.5372549, 1, 1,
0.1249683, 0.4324245, 1.38966, 0, 0.5333334, 1, 1,
0.1260036, -0.5019081, 3.354217, 0, 0.5254902, 1, 1,
0.1301999, -1.489587, 3.246782, 0, 0.5215687, 1, 1,
0.1307883, 0.006523038, 1.460445, 0, 0.5137255, 1, 1,
0.1319381, -0.5371889, 1.305934, 0, 0.509804, 1, 1,
0.1331754, -0.6339505, 2.064254, 0, 0.5019608, 1, 1,
0.1398776, 0.3489461, 0.6067839, 0, 0.4941176, 1, 1,
0.1399669, -0.4776794, 1.805426, 0, 0.4901961, 1, 1,
0.1417213, -0.1109211, 1.784177, 0, 0.4823529, 1, 1,
0.1425307, 0.5036064, 1.248389, 0, 0.4784314, 1, 1,
0.164459, 0.3075495, 2.668808, 0, 0.4705882, 1, 1,
0.1797811, -0.165131, 2.690725, 0, 0.4666667, 1, 1,
0.1815928, 0.09163304, 1.875514, 0, 0.4588235, 1, 1,
0.1880937, 0.3404157, -0.08911615, 0, 0.454902, 1, 1,
0.1897405, 0.5234513, 0.7849786, 0, 0.4470588, 1, 1,
0.1914177, 0.5829029, 0.6607377, 0, 0.4431373, 1, 1,
0.2015938, -0.567939, 3.247987, 0, 0.4352941, 1, 1,
0.2022606, -0.2337587, 0.7823254, 0, 0.4313726, 1, 1,
0.2049126, -0.2774753, 1.120998, 0, 0.4235294, 1, 1,
0.2070277, -1.014204, 3.880206, 0, 0.4196078, 1, 1,
0.2133197, -0.4321531, 2.744865, 0, 0.4117647, 1, 1,
0.2210133, 0.4596169, 0.9500994, 0, 0.4078431, 1, 1,
0.2232047, -0.5094745, 2.970935, 0, 0.4, 1, 1,
0.2280669, -0.1094297, 3.016401, 0, 0.3921569, 1, 1,
0.2406106, -0.05532705, 1.330124, 0, 0.3882353, 1, 1,
0.2430783, 0.3182032, 3.030489, 0, 0.3803922, 1, 1,
0.2446362, -0.001863263, 2.88877, 0, 0.3764706, 1, 1,
0.2460977, 0.4628908, 2.848655, 0, 0.3686275, 1, 1,
0.2489029, 0.0737419, -0.3633831, 0, 0.3647059, 1, 1,
0.256948, 0.3919206, 0.74297, 0, 0.3568628, 1, 1,
0.2626505, 1.812805, 0.7886326, 0, 0.3529412, 1, 1,
0.2645566, 0.0802179, 0.9271056, 0, 0.345098, 1, 1,
0.2648, 1.188206, -0.9542657, 0, 0.3411765, 1, 1,
0.2688105, 0.9890603, -0.08184531, 0, 0.3333333, 1, 1,
0.2700836, -0.2850827, 3.031821, 0, 0.3294118, 1, 1,
0.2716331, -1.53429, 2.513623, 0, 0.3215686, 1, 1,
0.2743304, 0.8436669, 0.1495526, 0, 0.3176471, 1, 1,
0.2750867, 1.358527, -0.5489686, 0, 0.3098039, 1, 1,
0.2768731, 0.1296584, -0.3250211, 0, 0.3058824, 1, 1,
0.2812566, -0.6340331, 3.369547, 0, 0.2980392, 1, 1,
0.2819368, -1.225134, 3.272274, 0, 0.2901961, 1, 1,
0.2823841, 1.198414, -0.2790962, 0, 0.2862745, 1, 1,
0.2832922, -0.1713198, 1.72579, 0, 0.2784314, 1, 1,
0.2837457, 1.028822, 0.9088997, 0, 0.2745098, 1, 1,
0.2847221, -0.5265267, 3.487992, 0, 0.2666667, 1, 1,
0.287659, -0.1168211, 0.9095964, 0, 0.2627451, 1, 1,
0.2915965, -0.8559789, 4.530979, 0, 0.254902, 1, 1,
0.2939054, 1.333985, -1.406812, 0, 0.2509804, 1, 1,
0.2944898, 0.3789462, 0.8049807, 0, 0.2431373, 1, 1,
0.2946476, -0.9739589, 3.513988, 0, 0.2392157, 1, 1,
0.2991651, 1.623859, 1.318097, 0, 0.2313726, 1, 1,
0.3009589, 0.7560771, -0.3812474, 0, 0.227451, 1, 1,
0.3076602, 1.692266, 0.7357752, 0, 0.2196078, 1, 1,
0.3229, 0.5692649, 0.3027071, 0, 0.2156863, 1, 1,
0.3236549, 1.784583, -0.01393879, 0, 0.2078431, 1, 1,
0.324022, 0.5999067, 1.56136, 0, 0.2039216, 1, 1,
0.3339728, -0.8023769, 0.7113278, 0, 0.1960784, 1, 1,
0.334467, 0.4932755, -1.573466, 0, 0.1882353, 1, 1,
0.3366775, 0.2463159, 1.890779, 0, 0.1843137, 1, 1,
0.358207, 1.596264, -0.9964221, 0, 0.1764706, 1, 1,
0.3622768, 1.638967, 0.6815547, 0, 0.172549, 1, 1,
0.3638914, 0.6305982, -0.6160455, 0, 0.1647059, 1, 1,
0.3653648, -0.5996072, 2.461701, 0, 0.1607843, 1, 1,
0.3668194, 0.2973807, 0.3408139, 0, 0.1529412, 1, 1,
0.3713592, -0.6763089, 1.466563, 0, 0.1490196, 1, 1,
0.376748, 0.1513376, 0.4503443, 0, 0.1411765, 1, 1,
0.3773757, -0.7222063, 2.631418, 0, 0.1372549, 1, 1,
0.3798056, 0.5321745, 0.987227, 0, 0.1294118, 1, 1,
0.3814622, -0.9146484, 1.648996, 0, 0.1254902, 1, 1,
0.3819326, 0.6380147, 0.2300423, 0, 0.1176471, 1, 1,
0.3849571, 0.1296095, 2.638054, 0, 0.1137255, 1, 1,
0.3850291, -0.8185955, 1.073761, 0, 0.1058824, 1, 1,
0.3888111, -0.1390184, 1.468975, 0, 0.09803922, 1, 1,
0.3901931, 1.927092, -0.01231297, 0, 0.09411765, 1, 1,
0.3918689, 1.18732, -0.2052459, 0, 0.08627451, 1, 1,
0.3977518, -1.15645, 2.180984, 0, 0.08235294, 1, 1,
0.4000503, -1.708385, 2.755754, 0, 0.07450981, 1, 1,
0.4020425, 0.5643132, -0.0427893, 0, 0.07058824, 1, 1,
0.4028895, -0.4717622, 0.5141846, 0, 0.0627451, 1, 1,
0.4045562, -2.391985, 3.409966, 0, 0.05882353, 1, 1,
0.4046148, -0.9047698, 0.8774378, 0, 0.05098039, 1, 1,
0.4053198, -2.561133, 2.879292, 0, 0.04705882, 1, 1,
0.4077415, -1.571316, 1.110239, 0, 0.03921569, 1, 1,
0.4203092, 0.1320403, 1.859434, 0, 0.03529412, 1, 1,
0.4207116, -0.09560221, 1.454761, 0, 0.02745098, 1, 1,
0.4239401, -1.213591, 2.328007, 0, 0.02352941, 1, 1,
0.4276627, -1.747066, 1.538756, 0, 0.01568628, 1, 1,
0.4292738, 1.035821, 2.45637, 0, 0.01176471, 1, 1,
0.4308607, 0.4393837, 2.698798, 0, 0.003921569, 1, 1,
0.432905, -0.02915315, 1.944801, 0.003921569, 0, 1, 1,
0.4336388, 0.7470985, 0.6211302, 0.007843138, 0, 1, 1,
0.4338007, 0.2271481, 1.964366, 0.01568628, 0, 1, 1,
0.4354939, -0.6694992, 3.135287, 0.01960784, 0, 1, 1,
0.4373387, 0.3873909, 0.2831104, 0.02745098, 0, 1, 1,
0.4376788, -0.4660716, 2.307639, 0.03137255, 0, 1, 1,
0.4395698, -0.7005745, 1.676287, 0.03921569, 0, 1, 1,
0.4422774, -1.357804, 2.860262, 0.04313726, 0, 1, 1,
0.4450898, -1.725479, 1.609794, 0.05098039, 0, 1, 1,
0.445385, 0.4592369, 0.4251965, 0.05490196, 0, 1, 1,
0.446406, 0.5199017, 0.6221468, 0.0627451, 0, 1, 1,
0.4466207, -0.6025759, 2.451177, 0.06666667, 0, 1, 1,
0.44734, -0.4477068, 2.658653, 0.07450981, 0, 1, 1,
0.4513023, -0.6892449, 2.721394, 0.07843138, 0, 1, 1,
0.4514008, 0.6936679, 0.8915637, 0.08627451, 0, 1, 1,
0.454862, 1.452985, -0.1148341, 0.09019608, 0, 1, 1,
0.4594778, 0.4631757, 1.413996, 0.09803922, 0, 1, 1,
0.4625633, -0.5713562, 2.155903, 0.1058824, 0, 1, 1,
0.4631684, -1.95595, 3.887965, 0.1098039, 0, 1, 1,
0.4638714, 1.136679, 1.291468, 0.1176471, 0, 1, 1,
0.4652918, 0.09519588, 1.013639, 0.1215686, 0, 1, 1,
0.4700007, -0.8503515, 2.793149, 0.1294118, 0, 1, 1,
0.4741664, 0.472215, -0.9075945, 0.1333333, 0, 1, 1,
0.4741772, 0.396634, 0.8112179, 0.1411765, 0, 1, 1,
0.4789032, 0.6076954, 0.2907489, 0.145098, 0, 1, 1,
0.4789597, -1.195219, 2.973472, 0.1529412, 0, 1, 1,
0.4815804, 0.3257433, 1.512928, 0.1568628, 0, 1, 1,
0.482356, -0.7693249, 2.748103, 0.1647059, 0, 1, 1,
0.4883972, 0.06849572, 0.3162169, 0.1686275, 0, 1, 1,
0.4911958, 1.802879, 1.245611, 0.1764706, 0, 1, 1,
0.4934029, 1.048659, 0.6375725, 0.1803922, 0, 1, 1,
0.4958134, 2.208011, 0.2459782, 0.1882353, 0, 1, 1,
0.4970664, -0.8266489, 2.832395, 0.1921569, 0, 1, 1,
0.5001712, 0.8707414, -0.3101352, 0.2, 0, 1, 1,
0.5001802, 0.3170298, 0.7994266, 0.2078431, 0, 1, 1,
0.5025495, -2.369894, 3.89935, 0.2117647, 0, 1, 1,
0.5072499, -1.316797, 2.345855, 0.2196078, 0, 1, 1,
0.5087914, 0.2257247, 3.076221, 0.2235294, 0, 1, 1,
0.5097851, 0.6251121, 0.5494861, 0.2313726, 0, 1, 1,
0.5106607, 0.6508468, -0.5037732, 0.2352941, 0, 1, 1,
0.5147848, -1.015503, 1.86607, 0.2431373, 0, 1, 1,
0.5193691, -0.5710132, 3.618903, 0.2470588, 0, 1, 1,
0.5270547, -0.7688848, 1.866467, 0.254902, 0, 1, 1,
0.5273857, 0.1536084, -0.7146394, 0.2588235, 0, 1, 1,
0.5274816, -0.4835016, 1.376825, 0.2666667, 0, 1, 1,
0.5359903, -0.6441818, 2.290611, 0.2705882, 0, 1, 1,
0.5400777, -0.576979, 1.360024, 0.2784314, 0, 1, 1,
0.5431595, 0.1431367, -0.6541154, 0.282353, 0, 1, 1,
0.5520438, -1.417861, 3.721945, 0.2901961, 0, 1, 1,
0.564772, 0.4880517, 2.403144, 0.2941177, 0, 1, 1,
0.5864316, 1.44423, 0.9057808, 0.3019608, 0, 1, 1,
0.5979149, 2.713364, -0.6457081, 0.3098039, 0, 1, 1,
0.600572, 0.3872483, 0.8637025, 0.3137255, 0, 1, 1,
0.6007823, 0.1758562, 2.049812, 0.3215686, 0, 1, 1,
0.6025183, -0.8956974, 0.6692023, 0.3254902, 0, 1, 1,
0.6047407, 0.6587403, 1.635455, 0.3333333, 0, 1, 1,
0.6071891, 1.262553, 1.842819, 0.3372549, 0, 1, 1,
0.6099574, 0.6250952, -0.5290275, 0.345098, 0, 1, 1,
0.612736, -0.1444877, 1.198109, 0.3490196, 0, 1, 1,
0.6160142, 0.9352748, 1.427303, 0.3568628, 0, 1, 1,
0.6164528, 1.759126, -0.9765005, 0.3607843, 0, 1, 1,
0.6242244, 1.670809, 1.283135, 0.3686275, 0, 1, 1,
0.626047, 1.145432, 0.3063659, 0.372549, 0, 1, 1,
0.6286789, -0.7902581, 2.845259, 0.3803922, 0, 1, 1,
0.6327257, 0.3261008, 1.832731, 0.3843137, 0, 1, 1,
0.6330532, 1.326358, 2.959641, 0.3921569, 0, 1, 1,
0.6396871, 0.09995285, 2.743119, 0.3960784, 0, 1, 1,
0.6400367, -1.047251, 3.866029, 0.4039216, 0, 1, 1,
0.6403161, -0.3210569, 2.167538, 0.4117647, 0, 1, 1,
0.6404814, 0.202108, 1.073322, 0.4156863, 0, 1, 1,
0.6419107, -1.213402, 1.369665, 0.4235294, 0, 1, 1,
0.6431127, -1.992413, 3.190351, 0.427451, 0, 1, 1,
0.6457084, 0.8242674, 0.07050047, 0.4352941, 0, 1, 1,
0.6460224, 0.9577225, -0.5551583, 0.4392157, 0, 1, 1,
0.6487332, 0.3466857, 0.4888332, 0.4470588, 0, 1, 1,
0.6521413, -0.01194798, 1.781118, 0.4509804, 0, 1, 1,
0.6538647, 1.349112, -0.3401446, 0.4588235, 0, 1, 1,
0.6538678, 0.8389863, 1.932465, 0.4627451, 0, 1, 1,
0.6546068, 0.2753369, 1.782446, 0.4705882, 0, 1, 1,
0.6560786, -0.8524247, 2.434487, 0.4745098, 0, 1, 1,
0.6573954, 1.705682, -1.164586, 0.4823529, 0, 1, 1,
0.6576095, -1.819532, 1.516342, 0.4862745, 0, 1, 1,
0.6589583, 0.2015571, 1.278292, 0.4941176, 0, 1, 1,
0.6592419, 0.001099014, 1.357, 0.5019608, 0, 1, 1,
0.6603579, -1.756622, 3.236018, 0.5058824, 0, 1, 1,
0.6644598, -0.9958251, 1.673511, 0.5137255, 0, 1, 1,
0.6691495, 0.6458712, 0.7364026, 0.5176471, 0, 1, 1,
0.6731258, 0.3633864, 0.7373402, 0.5254902, 0, 1, 1,
0.6795344, 0.7165834, 1.808792, 0.5294118, 0, 1, 1,
0.6833672, -0.6040881, 0.9403778, 0.5372549, 0, 1, 1,
0.687405, 0.4655427, -0.7547275, 0.5411765, 0, 1, 1,
0.6886094, 0.6674547, 0.4773881, 0.5490196, 0, 1, 1,
0.6902968, -0.3909373, 1.965443, 0.5529412, 0, 1, 1,
0.6936117, -0.234642, 3.819444, 0.5607843, 0, 1, 1,
0.6974696, 0.2105957, 0.7167658, 0.5647059, 0, 1, 1,
0.7038468, -0.3061267, 2.106521, 0.572549, 0, 1, 1,
0.7084917, 1.109517, 1.104584, 0.5764706, 0, 1, 1,
0.7095779, -0.03044301, 0.9915165, 0.5843138, 0, 1, 1,
0.713235, -0.8773252, 2.51296, 0.5882353, 0, 1, 1,
0.7151545, 0.00719203, 1.457464, 0.5960785, 0, 1, 1,
0.7245564, -1.190533, 1.744564, 0.6039216, 0, 1, 1,
0.7254626, -0.7710776, 2.663137, 0.6078432, 0, 1, 1,
0.7257898, -0.9531118, 0.7892519, 0.6156863, 0, 1, 1,
0.7261323, -2.191048, 3.8265, 0.6196079, 0, 1, 1,
0.726382, 0.3358454, 2.112777, 0.627451, 0, 1, 1,
0.731361, -0.8625611, -0.04586533, 0.6313726, 0, 1, 1,
0.7314149, -0.9980503, 3.797939, 0.6392157, 0, 1, 1,
0.7320743, 1.467552, -1.227058, 0.6431373, 0, 1, 1,
0.7392147, 1.887475, 2.147917, 0.6509804, 0, 1, 1,
0.7399068, -0.8521516, 1.703524, 0.654902, 0, 1, 1,
0.7403377, -0.1907542, 3.546713, 0.6627451, 0, 1, 1,
0.7406664, -0.8504161, 2.563851, 0.6666667, 0, 1, 1,
0.7417039, 0.1314007, -0.2470165, 0.6745098, 0, 1, 1,
0.7429278, 0.07874986, 1.345903, 0.6784314, 0, 1, 1,
0.747794, 2.400622, 0.6659658, 0.6862745, 0, 1, 1,
0.7484506, 1.338099, 0.7432731, 0.6901961, 0, 1, 1,
0.7486005, 0.1632646, 0.8305869, 0.6980392, 0, 1, 1,
0.7488579, -0.8010342, 2.322806, 0.7058824, 0, 1, 1,
0.7553625, 1.663568, 0.9384934, 0.7098039, 0, 1, 1,
0.7592669, 0.4498793, 1.586568, 0.7176471, 0, 1, 1,
0.763656, -0.6112927, 2.761141, 0.7215686, 0, 1, 1,
0.7737238, 0.2729845, 0.6645784, 0.7294118, 0, 1, 1,
0.7777119, 1.339769, 1.062023, 0.7333333, 0, 1, 1,
0.7798242, 0.5454, 2.639371, 0.7411765, 0, 1, 1,
0.7809249, 1.340298, 0.6730524, 0.7450981, 0, 1, 1,
0.7845147, 3.562065, -0.8212294, 0.7529412, 0, 1, 1,
0.7904617, 0.8832634, -0.2619076, 0.7568628, 0, 1, 1,
0.7915934, -1.69448, 1.414519, 0.7647059, 0, 1, 1,
0.7929501, -0.4293476, 2.721173, 0.7686275, 0, 1, 1,
0.7940187, 0.137405, 2.424644, 0.7764706, 0, 1, 1,
0.7981606, 1.302123, 0.3664402, 0.7803922, 0, 1, 1,
0.8062925, -0.4859394, 2.573802, 0.7882353, 0, 1, 1,
0.8072289, 0.7704314, 1.559231, 0.7921569, 0, 1, 1,
0.8136327, -0.5471199, 0.9057125, 0.8, 0, 1, 1,
0.8140175, -1.09684, 1.948734, 0.8078431, 0, 1, 1,
0.816775, -1.776679, 0.9747971, 0.8117647, 0, 1, 1,
0.8259422, -2.191582, 2.061698, 0.8196079, 0, 1, 1,
0.8263639, -0.1954833, 2.642942, 0.8235294, 0, 1, 1,
0.8274529, 0.9154159, 0.7415104, 0.8313726, 0, 1, 1,
0.8278675, 0.2957257, 0.482686, 0.8352941, 0, 1, 1,
0.8331351, -1.119597, 1.809747, 0.8431373, 0, 1, 1,
0.8351327, -0.4428476, 1.568909, 0.8470588, 0, 1, 1,
0.8410724, -0.7788475, 1.668775, 0.854902, 0, 1, 1,
0.8553756, 0.3672887, 0.2767093, 0.8588235, 0, 1, 1,
0.8563455, 0.1090895, -0.5277951, 0.8666667, 0, 1, 1,
0.8568286, -0.8373626, 0.7349971, 0.8705882, 0, 1, 1,
0.8614702, -2.239574, 2.453242, 0.8784314, 0, 1, 1,
0.8682516, 0.102707, 1.193419, 0.8823529, 0, 1, 1,
0.881355, 0.9051116, 2.111121, 0.8901961, 0, 1, 1,
0.8866506, -0.3795979, 0.1620592, 0.8941177, 0, 1, 1,
0.889453, -0.9736015, 2.41393, 0.9019608, 0, 1, 1,
0.893468, -0.5370515, 4.342348, 0.9098039, 0, 1, 1,
0.8977709, 1.534077, 1.013428, 0.9137255, 0, 1, 1,
0.8998344, 2.221179, -0.106978, 0.9215686, 0, 1, 1,
0.9088989, 0.3797526, -0.4591508, 0.9254902, 0, 1, 1,
0.9105135, -0.655251, 2.674291, 0.9333333, 0, 1, 1,
0.9135794, -0.425626, 0.5739518, 0.9372549, 0, 1, 1,
0.9177715, -0.2164977, 0.9146202, 0.945098, 0, 1, 1,
0.9197664, 1.009552, 2.221297, 0.9490196, 0, 1, 1,
0.9228691, 0.218162, 1.690682, 0.9568627, 0, 1, 1,
0.924137, -0.3688047, 1.43827, 0.9607843, 0, 1, 1,
0.9308692, -0.5934367, 0.5910206, 0.9686275, 0, 1, 1,
0.9325344, 1.276375, 1.688715, 0.972549, 0, 1, 1,
0.9369018, -0.8218868, 3.906024, 0.9803922, 0, 1, 1,
0.9378556, -0.4442288, 2.171086, 0.9843137, 0, 1, 1,
0.9418054, 0.9422454, 2.227109, 0.9921569, 0, 1, 1,
0.9437521, 0.2516958, -0.4506313, 0.9960784, 0, 1, 1,
0.9501398, -1.195689, 3.447786, 1, 0, 0.9960784, 1,
0.9519786, -1.743026, 2.598271, 1, 0, 0.9882353, 1,
0.9539663, 0.4187211, 2.244859, 1, 0, 0.9843137, 1,
0.9553956, -0.3148344, 0.4364536, 1, 0, 0.9764706, 1,
0.9564398, 0.346336, 0.4204997, 1, 0, 0.972549, 1,
0.9579818, -0.4795569, 0.9750199, 1, 0, 0.9647059, 1,
0.9596353, 1.174535, 0.9373482, 1, 0, 0.9607843, 1,
0.9772589, -0.04826104, 1.486603, 1, 0, 0.9529412, 1,
0.9813891, 1.006695, -0.5227854, 1, 0, 0.9490196, 1,
0.9929416, -0.968331, 1.94736, 1, 0, 0.9411765, 1,
0.9962955, 2.541606, 1.204714, 1, 0, 0.9372549, 1,
1.009131, -0.9456741, 3.094272, 1, 0, 0.9294118, 1,
1.010766, -0.3937771, 1.261302, 1, 0, 0.9254902, 1,
1.01523, 0.4637983, 0.4730117, 1, 0, 0.9176471, 1,
1.021477, -1.008098, 2.612778, 1, 0, 0.9137255, 1,
1.023678, 0.6574952, 0.6063484, 1, 0, 0.9058824, 1,
1.024431, 1.573805, 0.5264671, 1, 0, 0.9019608, 1,
1.025675, 0.1442426, 1.769859, 1, 0, 0.8941177, 1,
1.027521, 0.3887653, 2.145738, 1, 0, 0.8862745, 1,
1.032833, -1.591609, 2.72603, 1, 0, 0.8823529, 1,
1.035237, -1.669358, 2.973896, 1, 0, 0.8745098, 1,
1.040062, 2.110055, -0.6563758, 1, 0, 0.8705882, 1,
1.044096, 1.344254, 1.091872, 1, 0, 0.8627451, 1,
1.049859, -0.9423591, 3.319566, 1, 0, 0.8588235, 1,
1.050242, 0.03284828, 2.31158, 1, 0, 0.8509804, 1,
1.055972, -0.4645477, 2.458462, 1, 0, 0.8470588, 1,
1.058458, -0.1376202, 1.008813, 1, 0, 0.8392157, 1,
1.063827, -0.1074678, 2.957837, 1, 0, 0.8352941, 1,
1.079087, 0.1731829, 2.031655, 1, 0, 0.827451, 1,
1.081887, -0.247326, 1.30941, 1, 0, 0.8235294, 1,
1.08393, -0.2015878, 1.141919, 1, 0, 0.8156863, 1,
1.094006, -0.02316546, 1.431629, 1, 0, 0.8117647, 1,
1.105976, -0.3167943, 0.9646369, 1, 0, 0.8039216, 1,
1.116638, -0.106158, 2.597721, 1, 0, 0.7960784, 1,
1.117031, 0.008409233, 0.995347, 1, 0, 0.7921569, 1,
1.119515, -0.5616644, 1.717203, 1, 0, 0.7843137, 1,
1.127871, 1.473545, 0.6926185, 1, 0, 0.7803922, 1,
1.128123, -0.3482834, 2.215874, 1, 0, 0.772549, 1,
1.131068, -0.7767594, 2.130719, 1, 0, 0.7686275, 1,
1.13416, 1.082674, 1.578697, 1, 0, 0.7607843, 1,
1.134187, -0.9232645, 2.911683, 1, 0, 0.7568628, 1,
1.143197, 0.2832441, 1.096823, 1, 0, 0.7490196, 1,
1.151527, 0.4845461, -1.122679, 1, 0, 0.7450981, 1,
1.156179, -1.248175, 2.611306, 1, 0, 0.7372549, 1,
1.167125, 1.426308, 1.291241, 1, 0, 0.7333333, 1,
1.167503, 0.3983413, 2.283674, 1, 0, 0.7254902, 1,
1.17165, 0.4920628, 0.7372266, 1, 0, 0.7215686, 1,
1.171711, -0.7290248, 3.022672, 1, 0, 0.7137255, 1,
1.174332, 0.273201, 2.84516, 1, 0, 0.7098039, 1,
1.175182, -0.3429122, 1.256524, 1, 0, 0.7019608, 1,
1.175282, -0.1804831, 2.319391, 1, 0, 0.6941177, 1,
1.197112, 1.553336, -1.100009, 1, 0, 0.6901961, 1,
1.212407, -2.045992, 1.912202, 1, 0, 0.682353, 1,
1.226224, -0.2965286, 1.159705, 1, 0, 0.6784314, 1,
1.24931, -0.008451873, 2.67007, 1, 0, 0.6705883, 1,
1.251832, -0.3170786, 1.569248, 1, 0, 0.6666667, 1,
1.253904, -0.5232878, 2.028833, 1, 0, 0.6588235, 1,
1.264662, 1.09611, -0.5287423, 1, 0, 0.654902, 1,
1.270055, -1.23812, 1.891818, 1, 0, 0.6470588, 1,
1.277869, 1.898803, -1.288657, 1, 0, 0.6431373, 1,
1.29207, -0.9129785, 1.348832, 1, 0, 0.6352941, 1,
1.306943, -1.163318, 2.493577, 1, 0, 0.6313726, 1,
1.3083, 1.347612, -0.6673815, 1, 0, 0.6235294, 1,
1.318292, -0.9196563, 2.516223, 1, 0, 0.6196079, 1,
1.322723, -0.5651037, 2.097316, 1, 0, 0.6117647, 1,
1.323935, 0.1127251, 2.124313, 1, 0, 0.6078432, 1,
1.326398, 1.338171, 0.8397344, 1, 0, 0.6, 1,
1.331817, -0.2399865, 3.480963, 1, 0, 0.5921569, 1,
1.339719, -0.4967332, 1.933064, 1, 0, 0.5882353, 1,
1.347392, -0.3172194, 2.42227, 1, 0, 0.5803922, 1,
1.367049, 0.2431418, 1.614502, 1, 0, 0.5764706, 1,
1.373916, -1.062843, 1.953167, 1, 0, 0.5686275, 1,
1.373986, 1.723216, -0.260627, 1, 0, 0.5647059, 1,
1.38002, -1.70362, 3.115982, 1, 0, 0.5568628, 1,
1.381572, -0.2343393, 1.186571, 1, 0, 0.5529412, 1,
1.383702, 0.3382426, 0.8593904, 1, 0, 0.5450981, 1,
1.386333, 0.6968009, 0.7431723, 1, 0, 0.5411765, 1,
1.38876, 0.8492383, -0.4044381, 1, 0, 0.5333334, 1,
1.38962, 2.365205, 0.6890609, 1, 0, 0.5294118, 1,
1.391233, 0.2467775, 0.7462426, 1, 0, 0.5215687, 1,
1.402716, -0.2413472, 2.012824, 1, 0, 0.5176471, 1,
1.416673, 0.3978411, 2.229038, 1, 0, 0.509804, 1,
1.417054, 0.4751683, 1.021253, 1, 0, 0.5058824, 1,
1.428133, -1.058702, 3.384813, 1, 0, 0.4980392, 1,
1.432137, -0.1340852, 0.7487816, 1, 0, 0.4901961, 1,
1.452933, 0.3996337, 1.688158, 1, 0, 0.4862745, 1,
1.458434, -0.1895865, 3.74695, 1, 0, 0.4784314, 1,
1.478141, 0.3929981, 0.9828759, 1, 0, 0.4745098, 1,
1.484285, -1.416709, 3.038386, 1, 0, 0.4666667, 1,
1.485468, -0.9020266, 1.986346, 1, 0, 0.4627451, 1,
1.49747, -0.2287429, 0.6840972, 1, 0, 0.454902, 1,
1.500898, -1.078689, 2.18587, 1, 0, 0.4509804, 1,
1.505916, -0.5964451, 3.812791, 1, 0, 0.4431373, 1,
1.508434, -0.2740169, 0.2317029, 1, 0, 0.4392157, 1,
1.525661, 1.106013, 1.194956, 1, 0, 0.4313726, 1,
1.535299, -0.1443554, 2.505163, 1, 0, 0.427451, 1,
1.538784, 0.3494484, 1.426191, 1, 0, 0.4196078, 1,
1.539751, 0.6520269, 1.842053, 1, 0, 0.4156863, 1,
1.560697, 0.6301706, 1.557532, 1, 0, 0.4078431, 1,
1.568933, -1.249097, 1.096472, 1, 0, 0.4039216, 1,
1.570039, -1.278481, 3.295341, 1, 0, 0.3960784, 1,
1.577261, -0.6993217, 2.902158, 1, 0, 0.3882353, 1,
1.578232, 0.2004434, 0.6666822, 1, 0, 0.3843137, 1,
1.579849, -0.7628397, 1.281283, 1, 0, 0.3764706, 1,
1.579856, 0.810486, 2.741296, 1, 0, 0.372549, 1,
1.589134, 1.533612, 0.1291879, 1, 0, 0.3647059, 1,
1.594738, -0.1386716, 0.5907214, 1, 0, 0.3607843, 1,
1.594962, 3.276688, 0.7661255, 1, 0, 0.3529412, 1,
1.595536, 0.2132472, 2.140866, 1, 0, 0.3490196, 1,
1.610287, -0.2625216, 4.31137, 1, 0, 0.3411765, 1,
1.621966, 0.5877503, 1.123719, 1, 0, 0.3372549, 1,
1.622545, 1.119116, -0.2187422, 1, 0, 0.3294118, 1,
1.640572, -0.326723, 0.9981894, 1, 0, 0.3254902, 1,
1.642366, 0.1805674, 1.146016, 1, 0, 0.3176471, 1,
1.648541, 0.2766033, 0.41403, 1, 0, 0.3137255, 1,
1.671927, -0.5412972, 1.580379, 1, 0, 0.3058824, 1,
1.674526, 0.2767825, 2.75214, 1, 0, 0.2980392, 1,
1.679426, 1.098808, 1.753317, 1, 0, 0.2941177, 1,
1.680787, -0.1885325, 4.088531, 1, 0, 0.2862745, 1,
1.723689, 0.4850646, 1.202015, 1, 0, 0.282353, 1,
1.744001, 1.1911, 1.25202, 1, 0, 0.2745098, 1,
1.744769, -2.750139, 3.200511, 1, 0, 0.2705882, 1,
1.780171, -1.099832, 1.132553, 1, 0, 0.2627451, 1,
1.78479, -0.6737367, 3.826836, 1, 0, 0.2588235, 1,
1.785741, -0.07888824, 2.620346, 1, 0, 0.2509804, 1,
1.807484, 0.2671263, 2.04445, 1, 0, 0.2470588, 1,
1.809864, -0.6302537, 1.857243, 1, 0, 0.2392157, 1,
1.81181, 0.06343114, 2.815298, 1, 0, 0.2352941, 1,
1.811837, 0.4155911, 3.685117, 1, 0, 0.227451, 1,
1.814131, 1.084355, 2.60645, 1, 0, 0.2235294, 1,
1.829721, 0.3668362, 2.460266, 1, 0, 0.2156863, 1,
1.854607, 0.8862143, 1.344594, 1, 0, 0.2117647, 1,
1.861957, 0.994192, 1.373517, 1, 0, 0.2039216, 1,
1.86697, -0.9227377, 2.409151, 1, 0, 0.1960784, 1,
1.873552, -1.295642, 1.101813, 1, 0, 0.1921569, 1,
1.876086, 1.123736, 0.6493326, 1, 0, 0.1843137, 1,
1.920891, 0.3709102, 1.356614, 1, 0, 0.1803922, 1,
1.934242, -0.9948593, 2.212198, 1, 0, 0.172549, 1,
1.952865, -0.05100864, 2.059582, 1, 0, 0.1686275, 1,
1.9538, -0.3124912, 1.939925, 1, 0, 0.1607843, 1,
1.962791, -0.1453521, 1.868499, 1, 0, 0.1568628, 1,
1.996689, -0.03916103, 1.568359, 1, 0, 0.1490196, 1,
2.004431, -1.732712, 2.35715, 1, 0, 0.145098, 1,
2.006705, 0.6316952, 1.23113, 1, 0, 0.1372549, 1,
2.020914, 1.419447, 1.189601, 1, 0, 0.1333333, 1,
2.023583, 0.727563, 2.533726, 1, 0, 0.1254902, 1,
2.029103, 0.214173, 0.9033306, 1, 0, 0.1215686, 1,
2.033233, 0.5046806, 1.160117, 1, 0, 0.1137255, 1,
2.04609, 0.3631829, 0.7401909, 1, 0, 0.1098039, 1,
2.105201, 0.1293463, 1.248988, 1, 0, 0.1019608, 1,
2.151274, -0.8709105, 2.253183, 1, 0, 0.09411765, 1,
2.204424, 1.228559, 0.2749349, 1, 0, 0.09019608, 1,
2.207639, -1.71208, 2.053896, 1, 0, 0.08235294, 1,
2.207754, 0.4997208, 1.984547, 1, 0, 0.07843138, 1,
2.217586, -0.8121262, 3.139771, 1, 0, 0.07058824, 1,
2.221097, 0.5073504, 1.946562, 1, 0, 0.06666667, 1,
2.297088, 0.6071377, 1.884663, 1, 0, 0.05882353, 1,
2.321918, 0.6405046, 3.7565, 1, 0, 0.05490196, 1,
2.337631, -2.204163, 3.59924, 1, 0, 0.04705882, 1,
2.365456, 0.3177705, 2.67556, 1, 0, 0.04313726, 1,
2.549224, -0.5033938, 1.222108, 1, 0, 0.03529412, 1,
2.586339, -0.9844238, 1.91534, 1, 0, 0.03137255, 1,
2.603501, -0.7254635, 1.339407, 1, 0, 0.02352941, 1,
2.796309, 1.370892, -0.5519333, 1, 0, 0.01960784, 1,
2.83357, 0.4612758, 1.800355, 1, 0, 0.01176471, 1,
3.412462, 0.07526208, 0.6620197, 1, 0, 0.007843138, 1
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
0.0733273, -4.124417, -7.003147, 0, -0.5, 0.5, 0.5,
0.0733273, -4.124417, -7.003147, 1, -0.5, 0.5, 0.5,
0.0733273, -4.124417, -7.003147, 1, 1.5, 0.5, 0.5,
0.0733273, -4.124417, -7.003147, 0, 1.5, 0.5, 0.5
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
-4.397774, 0.2758389, -7.003147, 0, -0.5, 0.5, 0.5,
-4.397774, 0.2758389, -7.003147, 1, -0.5, 0.5, 0.5,
-4.397774, 0.2758389, -7.003147, 1, 1.5, 0.5, 0.5,
-4.397774, 0.2758389, -7.003147, 0, 1.5, 0.5, 0.5
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
-4.397774, -4.124417, 0.206923, 0, -0.5, 0.5, 0.5,
-4.397774, -4.124417, 0.206923, 1, -0.5, 0.5, 0.5,
-4.397774, -4.124417, 0.206923, 1, 1.5, 0.5, 0.5,
-4.397774, -4.124417, 0.206923, 0, 1.5, 0.5, 0.5
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
-3, -3.108974, -5.339284,
3, -3.108974, -5.339284,
-3, -3.108974, -5.339284,
-3, -3.278214, -5.616595,
-2, -3.108974, -5.339284,
-2, -3.278214, -5.616595,
-1, -3.108974, -5.339284,
-1, -3.278214, -5.616595,
0, -3.108974, -5.339284,
0, -3.278214, -5.616595,
1, -3.108974, -5.339284,
1, -3.278214, -5.616595,
2, -3.108974, -5.339284,
2, -3.278214, -5.616595,
3, -3.108974, -5.339284,
3, -3.278214, -5.616595
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
-3, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
-3, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
-3, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
-3, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5,
-2, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
-2, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
-2, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
-2, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5,
-1, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
-1, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
-1, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
-1, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5,
0, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
0, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
0, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
0, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5,
1, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
1, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
1, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
1, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5,
2, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
2, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
2, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
2, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5,
3, -3.616696, -6.171216, 0, -0.5, 0.5, 0.5,
3, -3.616696, -6.171216, 1, -0.5, 0.5, 0.5,
3, -3.616696, -6.171216, 1, 1.5, 0.5, 0.5,
3, -3.616696, -6.171216, 0, 1.5, 0.5, 0.5
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
-3.365982, -3, -5.339284,
-3.365982, 3, -5.339284,
-3.365982, -3, -5.339284,
-3.537947, -3, -5.616595,
-3.365982, -2, -5.339284,
-3.537947, -2, -5.616595,
-3.365982, -1, -5.339284,
-3.537947, -1, -5.616595,
-3.365982, 0, -5.339284,
-3.537947, 0, -5.616595,
-3.365982, 1, -5.339284,
-3.537947, 1, -5.616595,
-3.365982, 2, -5.339284,
-3.537947, 2, -5.616595,
-3.365982, 3, -5.339284,
-3.537947, 3, -5.616595
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
-3.881878, -3, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, -3, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, -3, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, -3, -6.171216, 0, 1.5, 0.5, 0.5,
-3.881878, -2, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, -2, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, -2, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, -2, -6.171216, 0, 1.5, 0.5, 0.5,
-3.881878, -1, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, -1, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, -1, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, -1, -6.171216, 0, 1.5, 0.5, 0.5,
-3.881878, 0, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, 0, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, 0, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, 0, -6.171216, 0, 1.5, 0.5, 0.5,
-3.881878, 1, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, 1, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, 1, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, 1, -6.171216, 0, 1.5, 0.5, 0.5,
-3.881878, 2, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, 2, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, 2, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, 2, -6.171216, 0, 1.5, 0.5, 0.5,
-3.881878, 3, -6.171216, 0, -0.5, 0.5, 0.5,
-3.881878, 3, -6.171216, 1, -0.5, 0.5, 0.5,
-3.881878, 3, -6.171216, 1, 1.5, 0.5, 0.5,
-3.881878, 3, -6.171216, 0, 1.5, 0.5, 0.5
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
-3.365982, -3.108974, -4,
-3.365982, -3.108974, 4,
-3.365982, -3.108974, -4,
-3.537947, -3.278214, -4,
-3.365982, -3.108974, -2,
-3.537947, -3.278214, -2,
-3.365982, -3.108974, 0,
-3.537947, -3.278214, 0,
-3.365982, -3.108974, 2,
-3.537947, -3.278214, 2,
-3.365982, -3.108974, 4,
-3.537947, -3.278214, 4
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
-3.881878, -3.616696, -4, 0, -0.5, 0.5, 0.5,
-3.881878, -3.616696, -4, 1, -0.5, 0.5, 0.5,
-3.881878, -3.616696, -4, 1, 1.5, 0.5, 0.5,
-3.881878, -3.616696, -4, 0, 1.5, 0.5, 0.5,
-3.881878, -3.616696, -2, 0, -0.5, 0.5, 0.5,
-3.881878, -3.616696, -2, 1, -0.5, 0.5, 0.5,
-3.881878, -3.616696, -2, 1, 1.5, 0.5, 0.5,
-3.881878, -3.616696, -2, 0, 1.5, 0.5, 0.5,
-3.881878, -3.616696, 0, 0, -0.5, 0.5, 0.5,
-3.881878, -3.616696, 0, 1, -0.5, 0.5, 0.5,
-3.881878, -3.616696, 0, 1, 1.5, 0.5, 0.5,
-3.881878, -3.616696, 0, 0, 1.5, 0.5, 0.5,
-3.881878, -3.616696, 2, 0, -0.5, 0.5, 0.5,
-3.881878, -3.616696, 2, 1, -0.5, 0.5, 0.5,
-3.881878, -3.616696, 2, 1, 1.5, 0.5, 0.5,
-3.881878, -3.616696, 2, 0, 1.5, 0.5, 0.5,
-3.881878, -3.616696, 4, 0, -0.5, 0.5, 0.5,
-3.881878, -3.616696, 4, 1, -0.5, 0.5, 0.5,
-3.881878, -3.616696, 4, 1, 1.5, 0.5, 0.5,
-3.881878, -3.616696, 4, 0, 1.5, 0.5, 0.5
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
-3.365982, -3.108974, -5.339284,
-3.365982, 3.660651, -5.339284,
-3.365982, -3.108974, 5.75313,
-3.365982, 3.660651, 5.75313,
-3.365982, -3.108974, -5.339284,
-3.365982, -3.108974, 5.75313,
-3.365982, 3.660651, -5.339284,
-3.365982, 3.660651, 5.75313,
-3.365982, -3.108974, -5.339284,
3.512636, -3.108974, -5.339284,
-3.365982, -3.108974, 5.75313,
3.512636, -3.108974, 5.75313,
-3.365982, 3.660651, -5.339284,
3.512636, 3.660651, -5.339284,
-3.365982, 3.660651, 5.75313,
3.512636, 3.660651, 5.75313,
3.512636, -3.108974, -5.339284,
3.512636, 3.660651, -5.339284,
3.512636, -3.108974, 5.75313,
3.512636, 3.660651, 5.75313,
3.512636, -3.108974, -5.339284,
3.512636, -3.108974, 5.75313,
3.512636, 3.660651, -5.339284,
3.512636, 3.660651, 5.75313
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
var radius = 7.851238;
var distance = 34.93104;
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
mvMatrix.translate( -0.0733273, -0.2758389, -0.206923 );
mvMatrix.scale( 1.234101, 1.253971, 0.7652898 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93104);
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
Propyne<-read.table("Propyne.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propyne$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
```

```r
y<-Propyne$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
```

```r
z<-Propyne$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
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
-3.265808, -1.751213, -2.291572, 0, 0, 1, 1, 1,
-2.741969, 0.7640031, -1.440914, 1, 0, 0, 1, 1,
-2.719702, -1.214443, -2.989187, 1, 0, 0, 1, 1,
-2.57916, -0.3534787, -2.377181, 1, 0, 0, 1, 1,
-2.45559, -1.334882, -2.252328, 1, 0, 0, 1, 1,
-2.444702, -1.17697, -0.9662572, 1, 0, 0, 1, 1,
-2.268135, 1.269659, -1.778882, 0, 0, 0, 1, 1,
-2.24437, 1.379469, -2.153119, 0, 0, 0, 1, 1,
-2.201557, -1.550828, -2.129735, 0, 0, 0, 1, 1,
-2.178265, 0.19626, -0.4622135, 0, 0, 0, 1, 1,
-2.173079, -0.3180259, -2.213197, 0, 0, 0, 1, 1,
-2.170604, -0.5937771, -2.217634, 0, 0, 0, 1, 1,
-2.135345, -0.4738223, -1.909853, 0, 0, 0, 1, 1,
-2.124526, 1.65884, 0.9370691, 1, 1, 1, 1, 1,
-2.087326, -0.4679941, -1.227835, 1, 1, 1, 1, 1,
-2.083139, -1.060957, -2.041391, 1, 1, 1, 1, 1,
-2.049446, 1.093278, -2.172246, 1, 1, 1, 1, 1,
-2.033454, -0.5800569, -0.1223234, 1, 1, 1, 1, 1,
-2.03022, 0.03533357, -1.32369, 1, 1, 1, 1, 1,
-2.021973, -0.9733287, -4.401575, 1, 1, 1, 1, 1,
-1.999697, -0.523748, -3.019718, 1, 1, 1, 1, 1,
-1.994913, -1.501185, -1.578541, 1, 1, 1, 1, 1,
-1.9765, -0.4247999, -2.222613, 1, 1, 1, 1, 1,
-1.918234, 2.056531, -1.937786, 1, 1, 1, 1, 1,
-1.888649, -0.8045587, 0.00358399, 1, 1, 1, 1, 1,
-1.847388, 1.451249, -2.913481, 1, 1, 1, 1, 1,
-1.846185, -0.3589961, -2.280349, 1, 1, 1, 1, 1,
-1.841818, -0.7303037, -3.17725, 1, 1, 1, 1, 1,
-1.836399, -1.707444, -4.196734, 0, 0, 1, 1, 1,
-1.783855, 0.7465231, -1.526057, 1, 0, 0, 1, 1,
-1.782868, -1.485389, -5.177744, 1, 0, 0, 1, 1,
-1.779572, -0.6134421, -1.670043, 1, 0, 0, 1, 1,
-1.764059, -0.4100344, -2.12681, 1, 0, 0, 1, 1,
-1.752411, -0.4167316, -1.167494, 1, 0, 0, 1, 1,
-1.734046, 0.4010344, -0.8192433, 0, 0, 0, 1, 1,
-1.717059, -0.5169354, -2.40349, 0, 0, 0, 1, 1,
-1.714128, 1.015643, -1.416882, 0, 0, 0, 1, 1,
-1.708692, -1.233362, 0.430458, 0, 0, 0, 1, 1,
-1.707351, 0.1056559, -3.660075, 0, 0, 0, 1, 1,
-1.67631, -0.8670924, -2.146402, 0, 0, 0, 1, 1,
-1.675688, 0.9881628, -0.4481349, 0, 0, 0, 1, 1,
-1.675548, 0.6423547, -1.836237, 1, 1, 1, 1, 1,
-1.67108, 0.2048263, -2.962383, 1, 1, 1, 1, 1,
-1.669302, 1.67139, -0.8910754, 1, 1, 1, 1, 1,
-1.668234, 1.755857, -0.4288066, 1, 1, 1, 1, 1,
-1.66417, -0.4753042, -0.7034541, 1, 1, 1, 1, 1,
-1.658304, 1.30897, -0.3414176, 1, 1, 1, 1, 1,
-1.654147, -0.3450166, -1.220335, 1, 1, 1, 1, 1,
-1.635321, 0.626378, -2.323933, 1, 1, 1, 1, 1,
-1.632576, -0.6156647, -2.333131, 1, 1, 1, 1, 1,
-1.630155, 1.165765, -0.7227766, 1, 1, 1, 1, 1,
-1.620109, -2.216774, -1.92087, 1, 1, 1, 1, 1,
-1.601824, -0.7726923, -1.36434, 1, 1, 1, 1, 1,
-1.598994, 1.598918, -0.9003959, 1, 1, 1, 1, 1,
-1.582877, 0.8100948, -2.287248, 1, 1, 1, 1, 1,
-1.582855, 2.343755, 0.5176411, 1, 1, 1, 1, 1,
-1.57783, -2.002393, -0.2337394, 0, 0, 1, 1, 1,
-1.571704, 2.012951, -1.277783, 1, 0, 0, 1, 1,
-1.550587, 1.025086, 1.44335, 1, 0, 0, 1, 1,
-1.54576, -0.4048505, -1.83848, 1, 0, 0, 1, 1,
-1.541319, 0.971673, 0.6497551, 1, 0, 0, 1, 1,
-1.540442, -0.2239448, -1.051068, 1, 0, 0, 1, 1,
-1.507746, 0.4516672, -3.429551, 0, 0, 0, 1, 1,
-1.502725, 0.4352194, -0.8097589, 0, 0, 0, 1, 1,
-1.500489, 0.006361711, -3.253944, 0, 0, 0, 1, 1,
-1.499298, -0.3420255, -2.239134, 0, 0, 0, 1, 1,
-1.495694, -0.6494465, -2.141385, 0, 0, 0, 1, 1,
-1.487346, 1.031773, -2.200686, 0, 0, 0, 1, 1,
-1.485085, 1.958512, -1.264351, 0, 0, 0, 1, 1,
-1.483536, -0.09952116, -2.19996, 1, 1, 1, 1, 1,
-1.472679, -0.9706214, -3.951426, 1, 1, 1, 1, 1,
-1.470996, -0.8908035, -0.7301134, 1, 1, 1, 1, 1,
-1.458741, -1.041664, -0.6963119, 1, 1, 1, 1, 1,
-1.456394, -0.1668661, -1.650922, 1, 1, 1, 1, 1,
-1.455996, -1.528624, -3.611737, 1, 1, 1, 1, 1,
-1.447563, 0.7334184, -1.005634, 1, 1, 1, 1, 1,
-1.439124, -0.9975876, -1.73631, 1, 1, 1, 1, 1,
-1.434218, 2.01908, -0.8241122, 1, 1, 1, 1, 1,
-1.418569, 0.1355458, -0.2525093, 1, 1, 1, 1, 1,
-1.414066, -0.8859677, -1.243898, 1, 1, 1, 1, 1,
-1.403973, -0.8039411, -2.238112, 1, 1, 1, 1, 1,
-1.402788, -0.7908777, -1.81811, 1, 1, 1, 1, 1,
-1.396973, -1.228939, -1.142295, 1, 1, 1, 1, 1,
-1.392658, -0.1755975, -1.73459, 1, 1, 1, 1, 1,
-1.39166, -0.1971194, -1.988908, 0, 0, 1, 1, 1,
-1.382543, -0.2381, -3.180187, 1, 0, 0, 1, 1,
-1.381714, -0.2046864, -3.104098, 1, 0, 0, 1, 1,
-1.372123, 1.406048, -1.137556, 1, 0, 0, 1, 1,
-1.367808, 0.4157783, 0.3735384, 1, 0, 0, 1, 1,
-1.354795, 0.6732086, -1.384925, 1, 0, 0, 1, 1,
-1.342568, 1.223915, 0.5680012, 0, 0, 0, 1, 1,
-1.340306, 0.669715, -1.115298, 0, 0, 0, 1, 1,
-1.339148, 0.5755916, -0.08625415, 0, 0, 0, 1, 1,
-1.338078, -0.09508203, -3.388434, 0, 0, 0, 1, 1,
-1.329719, 2.158492, -1.640833, 0, 0, 0, 1, 1,
-1.319348, -0.1704701, -3.113426, 0, 0, 0, 1, 1,
-1.314856, 0.1257068, -0.7802547, 0, 0, 0, 1, 1,
-1.310166, 1.567275, -2.030312, 1, 1, 1, 1, 1,
-1.305093, 1.5042, 0.8038119, 1, 1, 1, 1, 1,
-1.301801, 1.372176, -2.225297, 1, 1, 1, 1, 1,
-1.300248, 0.2718451, -1.026001, 1, 1, 1, 1, 1,
-1.297779, 2.284556, 0.1166092, 1, 1, 1, 1, 1,
-1.297734, 0.2087076, -1.163848, 1, 1, 1, 1, 1,
-1.296086, 0.4722109, 0.2914628, 1, 1, 1, 1, 1,
-1.295261, 0.6986021, -2.661807, 1, 1, 1, 1, 1,
-1.286288, 0.7161364, -3.111923, 1, 1, 1, 1, 1,
-1.28317, 1.475934, -0.5705305, 1, 1, 1, 1, 1,
-1.282772, -0.476703, -0.4649824, 1, 1, 1, 1, 1,
-1.280634, 0.4466035, -2.023137, 1, 1, 1, 1, 1,
-1.279532, 0.6050256, -0.9511505, 1, 1, 1, 1, 1,
-1.265632, 1.652376, -1.578896, 1, 1, 1, 1, 1,
-1.263874, -2.777062, -2.386362, 1, 1, 1, 1, 1,
-1.256507, -1.540715, -4.138491, 0, 0, 1, 1, 1,
-1.25552, -0.07466468, -4.343657, 1, 0, 0, 1, 1,
-1.252677, 1.442012, 0.5731468, 1, 0, 0, 1, 1,
-1.248384, -0.5302267, -1.336834, 1, 0, 0, 1, 1,
-1.24622, 0.1220921, -2.392705, 1, 0, 0, 1, 1,
-1.242681, -0.03991846, -2.719432, 1, 0, 0, 1, 1,
-1.230262, -0.6382776, -2.121316, 0, 0, 0, 1, 1,
-1.229866, 0.03176865, -0.6201605, 0, 0, 0, 1, 1,
-1.226156, -1.412183, -0.5597619, 0, 0, 0, 1, 1,
-1.21298, 1.352992, -1.104383, 0, 0, 0, 1, 1,
-1.212689, -0.988135, -4.966749, 0, 0, 0, 1, 1,
-1.180435, 1.184008, -0.343942, 0, 0, 0, 1, 1,
-1.175984, -0.2201988, -2.421523, 0, 0, 0, 1, 1,
-1.175818, -3.010387, -3.588226, 1, 1, 1, 1, 1,
-1.168209, 0.404238, -2.178582, 1, 1, 1, 1, 1,
-1.158511, -0.4519387, -2.517671, 1, 1, 1, 1, 1,
-1.156823, 1.549119, 1.035239, 1, 1, 1, 1, 1,
-1.156182, 0.1187119, -0.04209751, 1, 1, 1, 1, 1,
-1.15393, 0.3443802, -1.661959, 1, 1, 1, 1, 1,
-1.150351, 0.5797884, -0.8309739, 1, 1, 1, 1, 1,
-1.147191, 0.3336241, -0.6564907, 1, 1, 1, 1, 1,
-1.146363, 0.274137, -2.331214, 1, 1, 1, 1, 1,
-1.146223, -0.9137101, -1.92242, 1, 1, 1, 1, 1,
-1.143089, 0.21912, -0.7889175, 1, 1, 1, 1, 1,
-1.141979, 0.525511, -0.5693008, 1, 1, 1, 1, 1,
-1.130727, -0.2055326, -3.268239, 1, 1, 1, 1, 1,
-1.130261, 0.6327407, -1.05005, 1, 1, 1, 1, 1,
-1.11002, 0.5587459, -0.4159139, 1, 1, 1, 1, 1,
-1.109631, 0.3093365, -2.551452, 0, 0, 1, 1, 1,
-1.109339, -0.2596531, -2.313695, 1, 0, 0, 1, 1,
-1.09681, -0.5380421, -2.568768, 1, 0, 0, 1, 1,
-1.09678, -1.155341, -3.922075, 1, 0, 0, 1, 1,
-1.095114, -1.473156, -3.746842, 1, 0, 0, 1, 1,
-1.087665, 0.6819066, -0.5202184, 1, 0, 0, 1, 1,
-1.081359, 1.15715, -2.464477, 0, 0, 0, 1, 1,
-1.074019, 0.3033826, -1.75845, 0, 0, 0, 1, 1,
-1.069268, -1.054623, -1.535242, 0, 0, 0, 1, 1,
-1.06868, 0.5129031, -1.667175, 0, 0, 0, 1, 1,
-1.052566, 0.9804277, -1.185194, 0, 0, 0, 1, 1,
-1.046194, 1.315746, -0.4633646, 0, 0, 0, 1, 1,
-1.037984, -0.02347871, -0.3323631, 0, 0, 0, 1, 1,
-1.032885, 0.8355566, -1.715312, 1, 1, 1, 1, 1,
-1.030772, 1.480874, -0.1086247, 1, 1, 1, 1, 1,
-1.022514, 0.1645545, -1.813511, 1, 1, 1, 1, 1,
-1.020729, -0.2587004, -1.702471, 1, 1, 1, 1, 1,
-1.015678, 0.03998126, -0.6689084, 1, 1, 1, 1, 1,
-1.012585, 0.3162812, -1.367935, 1, 1, 1, 1, 1,
-1.012079, -1.624662, -2.845941, 1, 1, 1, 1, 1,
-1.007858, 1.679474, 0.5862198, 1, 1, 1, 1, 1,
-0.999007, -0.714552, -2.70937, 1, 1, 1, 1, 1,
-0.9886098, -1.466634, -2.329827, 1, 1, 1, 1, 1,
-0.9852332, -0.4874004, -0.7509092, 1, 1, 1, 1, 1,
-0.9807666, -1.180009, -2.921101, 1, 1, 1, 1, 1,
-0.9802309, 0.7186294, 0.2385442, 1, 1, 1, 1, 1,
-0.9783596, 1.866916, 0.396633, 1, 1, 1, 1, 1,
-0.9776951, 0.4388791, -1.430979, 1, 1, 1, 1, 1,
-0.9775067, 0.3160462, -1.273734, 0, 0, 1, 1, 1,
-0.9756892, 0.257951, -1.110215, 1, 0, 0, 1, 1,
-0.9747831, -0.3707751, -1.812915, 1, 0, 0, 1, 1,
-0.9723979, -1.339638, -3.407, 1, 0, 0, 1, 1,
-0.9714751, 0.5604461, -0.2611063, 1, 0, 0, 1, 1,
-0.9702689, -1.951685, -0.6305385, 1, 0, 0, 1, 1,
-0.9675164, -1.300079, -3.606553, 0, 0, 0, 1, 1,
-0.9631227, -1.193371, -2.040076, 0, 0, 0, 1, 1,
-0.9619705, -0.5605152, -3.654112, 0, 0, 0, 1, 1,
-0.9611157, 0.1211899, 0.4230582, 0, 0, 0, 1, 1,
-0.9605417, -0.9892, -1.69009, 0, 0, 0, 1, 1,
-0.9570369, -0.08344205, -2.022027, 0, 0, 0, 1, 1,
-0.9492581, 0.2200107, -1.504234, 0, 0, 0, 1, 1,
-0.9461486, 0.6071846, -0.977361, 1, 1, 1, 1, 1,
-0.9451442, -0.4500576, -2.45948, 1, 1, 1, 1, 1,
-0.9427693, -0.1909045, -1.873838, 1, 1, 1, 1, 1,
-0.942752, -1.094501, -2.281091, 1, 1, 1, 1, 1,
-0.9346986, -0.7774808, -2.092765, 1, 1, 1, 1, 1,
-0.9346254, -0.4021109, -1.795317, 1, 1, 1, 1, 1,
-0.9334981, 1.227821, -0.2567004, 1, 1, 1, 1, 1,
-0.9332992, 0.2395902, -1.677891, 1, 1, 1, 1, 1,
-0.9327215, 0.8508332, 0.5264579, 1, 1, 1, 1, 1,
-0.9312053, -0.3538125, -2.351404, 1, 1, 1, 1, 1,
-0.9291932, 0.5548816, -0.7211077, 1, 1, 1, 1, 1,
-0.9236519, 0.3171751, -1.261631, 1, 1, 1, 1, 1,
-0.9202927, 1.294427, 0.2276815, 1, 1, 1, 1, 1,
-0.9116592, 0.542133, -0.7215664, 1, 1, 1, 1, 1,
-0.9111627, 0.8930998, -1.567486, 1, 1, 1, 1, 1,
-0.9061468, -0.9144792, -3.968723, 0, 0, 1, 1, 1,
-0.9052, 0.4513051, -0.03100994, 1, 0, 0, 1, 1,
-0.903873, 1.408612, 0.5672584, 1, 0, 0, 1, 1,
-0.9016738, -0.7804775, -3.609574, 1, 0, 0, 1, 1,
-0.9005349, -1.497694, -2.800984, 1, 0, 0, 1, 1,
-0.8975246, 0.8497555, -1.334096, 1, 0, 0, 1, 1,
-0.8955566, -0.5654993, -1.680514, 0, 0, 0, 1, 1,
-0.8946947, -1.091269, -2.130126, 0, 0, 0, 1, 1,
-0.894229, -1.286674, -1.741581, 0, 0, 0, 1, 1,
-0.8920262, 0.5092946, -0.3543443, 0, 0, 0, 1, 1,
-0.8884742, 0.03628968, -1.963019, 0, 0, 0, 1, 1,
-0.8841309, -0.6306162, -1.841595, 0, 0, 0, 1, 1,
-0.8698596, 0.2738469, -1.418993, 0, 0, 0, 1, 1,
-0.8665336, -1.283386, -3.816887, 1, 1, 1, 1, 1,
-0.8644274, 1.184338, -0.9730005, 1, 1, 1, 1, 1,
-0.8643832, -0.9280301, -1.905691, 1, 1, 1, 1, 1,
-0.8593461, 1.370604, -1.35751, 1, 1, 1, 1, 1,
-0.8577085, -1.924734, -2.981697, 1, 1, 1, 1, 1,
-0.8563563, 1.009252, -1.049598, 1, 1, 1, 1, 1,
-0.8549116, 0.4798416, -1.636166, 1, 1, 1, 1, 1,
-0.8495864, 2.045546, 1.306448, 1, 1, 1, 1, 1,
-0.8465915, -0.4097149, -1.914495, 1, 1, 1, 1, 1,
-0.8454975, -0.4060662, -3.417653, 1, 1, 1, 1, 1,
-0.8434899, -2.205622, -4.221826, 1, 1, 1, 1, 1,
-0.8400869, 0.8910785, -0.3475421, 1, 1, 1, 1, 1,
-0.8383254, -0.1360569, -1.165896, 1, 1, 1, 1, 1,
-0.8380507, 0.3062244, 0.3885558, 1, 1, 1, 1, 1,
-0.8361166, 0.03569482, -2.276639, 1, 1, 1, 1, 1,
-0.8354243, 0.8008352, 0.4310193, 0, 0, 1, 1, 1,
-0.8337809, -0.09018437, -2.421755, 1, 0, 0, 1, 1,
-0.8278909, -0.4810175, -2.608802, 1, 0, 0, 1, 1,
-0.8235222, 0.01031511, -0.8134494, 1, 0, 0, 1, 1,
-0.8189958, 1.216717, -0.1209842, 1, 0, 0, 1, 1,
-0.8117475, -1.589907, -1.368642, 1, 0, 0, 1, 1,
-0.8117221, -0.1596088, -1.737907, 0, 0, 0, 1, 1,
-0.8036433, 0.4908219, -1.268948, 0, 0, 0, 1, 1,
-0.7934984, 0.3905671, -0.8306926, 0, 0, 0, 1, 1,
-0.7932321, 1.739391, 0.4506285, 0, 0, 0, 1, 1,
-0.7905666, -1.135667, -1.910825, 0, 0, 0, 1, 1,
-0.785718, 0.3716225, 0.7008137, 0, 0, 0, 1, 1,
-0.7771333, -1.601151, -1.537359, 0, 0, 0, 1, 1,
-0.776379, 0.1361383, -2.130394, 1, 1, 1, 1, 1,
-0.7712798, -0.5218673, -4.192379, 1, 1, 1, 1, 1,
-0.7707405, 0.492752, -0.5052911, 1, 1, 1, 1, 1,
-0.7669885, 1.047356, 0.276044, 1, 1, 1, 1, 1,
-0.7656345, -1.786232, -2.924198, 1, 1, 1, 1, 1,
-0.7637212, -0.07182097, -2.230553, 1, 1, 1, 1, 1,
-0.7622848, -1.116853, -2.646456, 1, 1, 1, 1, 1,
-0.7595111, -0.7975395, -1.761698, 1, 1, 1, 1, 1,
-0.7550919, -1.817081, -2.183945, 1, 1, 1, 1, 1,
-0.7526772, -1.088927, -4.361352, 1, 1, 1, 1, 1,
-0.752277, -0.4614932, -2.25784, 1, 1, 1, 1, 1,
-0.75222, 1.129776, -0.1119026, 1, 1, 1, 1, 1,
-0.7483947, 1.851969, -1.469956, 1, 1, 1, 1, 1,
-0.7477301, 0.2979676, -2.002339, 1, 1, 1, 1, 1,
-0.7475508, -0.1225509, -2.1757, 1, 1, 1, 1, 1,
-0.7465919, -0.7210912, -1.855015, 0, 0, 1, 1, 1,
-0.7431769, -0.9377992, -4.018587, 1, 0, 0, 1, 1,
-0.7417292, 0.7962018, -1.424303, 1, 0, 0, 1, 1,
-0.7406543, 0.02057733, -0.7712045, 1, 0, 0, 1, 1,
-0.7356514, 1.020262, -0.6441675, 1, 0, 0, 1, 1,
-0.7342576, 0.5160175, -0.7033789, 1, 0, 0, 1, 1,
-0.7314222, 1.543823, -0.7790378, 0, 0, 0, 1, 1,
-0.7297921, 0.9121017, -2.293468, 0, 0, 0, 1, 1,
-0.7220867, 2.396307, -1.41436, 0, 0, 0, 1, 1,
-0.7217233, -1.082321, -2.733249, 0, 0, 0, 1, 1,
-0.709397, -0.4867163, -3.450422, 0, 0, 0, 1, 1,
-0.7052073, -1.905742, -2.241384, 0, 0, 0, 1, 1,
-0.7048425, -0.6152639, -3.14223, 0, 0, 0, 1, 1,
-0.7019784, 1.224021, -2.111337, 1, 1, 1, 1, 1,
-0.6945006, -1.325708, -2.996725, 1, 1, 1, 1, 1,
-0.6918451, -1.171482, -2.352208, 1, 1, 1, 1, 1,
-0.690768, 1.829163, -1.275458, 1, 1, 1, 1, 1,
-0.6866592, -1.299739, -3.295686, 1, 1, 1, 1, 1,
-0.6809379, 0.3604146, -2.170717, 1, 1, 1, 1, 1,
-0.6782321, 0.5176728, -2.640278, 1, 1, 1, 1, 1,
-0.6694977, 0.8796533, -0.1698099, 1, 1, 1, 1, 1,
-0.6658818, 0.1452854, -1.209161, 1, 1, 1, 1, 1,
-0.6639732, 2.957674, -1.415018, 1, 1, 1, 1, 1,
-0.6586992, 0.3338411, -0.972246, 1, 1, 1, 1, 1,
-0.6579441, -0.7399334, -1.341446, 1, 1, 1, 1, 1,
-0.656123, -0.1650514, -2.47599, 1, 1, 1, 1, 1,
-0.6541077, -2.525433, -1.324547, 1, 1, 1, 1, 1,
-0.6533163, -0.6516212, -0.698477, 1, 1, 1, 1, 1,
-0.6509678, 1.747867, 1.548671, 0, 0, 1, 1, 1,
-0.6493039, 0.8337282, -1.58922, 1, 0, 0, 1, 1,
-0.649124, -1.700612, -2.254081, 1, 0, 0, 1, 1,
-0.6481041, 0.2643413, 0.5585262, 1, 0, 0, 1, 1,
-0.6450797, -0.1979915, -2.337431, 1, 0, 0, 1, 1,
-0.6409855, -0.1691756, -3.674632, 1, 0, 0, 1, 1,
-0.6392677, -0.9171022, -4.831944, 0, 0, 0, 1, 1,
-0.6316102, 0.5897447, 0.5460296, 0, 0, 0, 1, 1,
-0.631459, 2.090615, 0.2103783, 0, 0, 0, 1, 1,
-0.625649, -0.01480469, -0.3464306, 0, 0, 0, 1, 1,
-0.6239747, -0.1133331, -1.847622, 0, 0, 0, 1, 1,
-0.6193928, -0.01614428, -0.9640254, 0, 0, 0, 1, 1,
-0.6190661, -1.244337, -2.989864, 0, 0, 0, 1, 1,
-0.6173944, -0.8409749, -1.873208, 1, 1, 1, 1, 1,
-0.6165488, 0.2468312, 0.2839112, 1, 1, 1, 1, 1,
-0.6152816, -1.100599, -2.224638, 1, 1, 1, 1, 1,
-0.6147639, 1.149969, -1.976357, 1, 1, 1, 1, 1,
-0.6141701, 0.2384095, -1.374192, 1, 1, 1, 1, 1,
-0.6131654, -0.9617028, -1.513631, 1, 1, 1, 1, 1,
-0.6068394, -0.8643101, -2.021666, 1, 1, 1, 1, 1,
-0.6042477, -0.08111823, -1.432023, 1, 1, 1, 1, 1,
-0.5968773, -1.183084, -2.986733, 1, 1, 1, 1, 1,
-0.5927302, -0.8321871, -0.7325578, 1, 1, 1, 1, 1,
-0.5853062, 0.3169571, -1.272266, 1, 1, 1, 1, 1,
-0.5839712, -0.6901675, -3.205346, 1, 1, 1, 1, 1,
-0.5825095, -0.3750811, -1.62975, 1, 1, 1, 1, 1,
-0.5824698, -0.5569376, -4.122922, 1, 1, 1, 1, 1,
-0.5790172, 0.2464469, -1.750105, 1, 1, 1, 1, 1,
-0.5782191, 0.1630829, -0.4967043, 0, 0, 1, 1, 1,
-0.5719605, -0.09977563, 0.01307674, 1, 0, 0, 1, 1,
-0.5709345, -0.6848014, -3.007419, 1, 0, 0, 1, 1,
-0.5698401, -1.507731, -2.43757, 1, 0, 0, 1, 1,
-0.5694203, 0.07559136, 0.1416743, 1, 0, 0, 1, 1,
-0.5688892, 1.371151, -3.575552, 1, 0, 0, 1, 1,
-0.5649664, -1.452112, -2.535212, 0, 0, 0, 1, 1,
-0.5597019, -0.3192169, -3.221818, 0, 0, 0, 1, 1,
-0.5581406, -0.7888263, -2.429263, 0, 0, 0, 1, 1,
-0.555805, 1.459977, -0.06076196, 0, 0, 0, 1, 1,
-0.5539442, -0.4386359, -1.458293, 0, 0, 0, 1, 1,
-0.5524638, 0.1757189, 0.1063528, 0, 0, 0, 1, 1,
-0.5504966, -0.6625864, -3.284928, 0, 0, 0, 1, 1,
-0.5493495, 0.698095, -0.5269199, 1, 1, 1, 1, 1,
-0.5419781, 0.6734858, -1.168551, 1, 1, 1, 1, 1,
-0.5414219, -0.1556738, -1.808793, 1, 1, 1, 1, 1,
-0.5390905, 0.1122279, -1.462489, 1, 1, 1, 1, 1,
-0.5380982, -0.4955711, -0.7539101, 1, 1, 1, 1, 1,
-0.5375884, 0.5352039, -0.1560527, 1, 1, 1, 1, 1,
-0.5289318, -1.043596, -2.911085, 1, 1, 1, 1, 1,
-0.5287458, -0.1956803, -2.158658, 1, 1, 1, 1, 1,
-0.526827, 0.9963009, -1.028382, 1, 1, 1, 1, 1,
-0.5252064, -2.279735, -2.905962, 1, 1, 1, 1, 1,
-0.5238338, 0.2741124, -1.957567, 1, 1, 1, 1, 1,
-0.5213214, 0.4604637, -1.770434, 1, 1, 1, 1, 1,
-0.5194132, -0.9218146, -0.6562189, 1, 1, 1, 1, 1,
-0.5139184, 0.5458311, -1.465722, 1, 1, 1, 1, 1,
-0.5112351, -0.5564684, -1.947002, 1, 1, 1, 1, 1,
-0.5050987, -0.4506286, -0.4399698, 0, 0, 1, 1, 1,
-0.4969787, -2.07058, -3.302644, 1, 0, 0, 1, 1,
-0.484357, -0.9101806, -3.972076, 1, 0, 0, 1, 1,
-0.4835318, -0.5832441, -3.368751, 1, 0, 0, 1, 1,
-0.4833774, -0.2067751, -2.502896, 1, 0, 0, 1, 1,
-0.4829729, -0.1905351, -1.700938, 1, 0, 0, 1, 1,
-0.4820621, 0.3977228, -1.228618, 0, 0, 0, 1, 1,
-0.4799947, -0.8815327, -4.159173, 0, 0, 0, 1, 1,
-0.4703279, 0.5853356, 0.4616653, 0, 0, 0, 1, 1,
-0.4700888, 0.3949587, -0.7806441, 0, 0, 0, 1, 1,
-0.4697773, -1.090885, -3.993018, 0, 0, 0, 1, 1,
-0.4666575, 0.5156842, -1.848999, 0, 0, 0, 1, 1,
-0.4656409, -0.6941956, -4.379397, 0, 0, 0, 1, 1,
-0.4640363, -1.265736, -2.509722, 1, 1, 1, 1, 1,
-0.4627802, 0.5528757, -1.191291, 1, 1, 1, 1, 1,
-0.460732, 0.01431144, -2.052734, 1, 1, 1, 1, 1,
-0.4602917, 0.2574788, -2.322051, 1, 1, 1, 1, 1,
-0.4508698, -2.269343, -3.812401, 1, 1, 1, 1, 1,
-0.4496483, 0.4357655, 0.2243207, 1, 1, 1, 1, 1,
-0.4458449, 0.5424644, -1.163453, 1, 1, 1, 1, 1,
-0.4457696, 0.6000448, -0.1992806, 1, 1, 1, 1, 1,
-0.4450771, -0.3540494, -2.793139, 1, 1, 1, 1, 1,
-0.4444309, 0.09110456, -0.2220637, 1, 1, 1, 1, 1,
-0.4436903, 0.1565363, -2.531431, 1, 1, 1, 1, 1,
-0.4413955, 0.7168185, -0.4051629, 1, 1, 1, 1, 1,
-0.4410608, -1.07522, -4.879605, 1, 1, 1, 1, 1,
-0.4353373, 0.2409325, -2.005833, 1, 1, 1, 1, 1,
-0.4347274, 0.8654748, -1.396619, 1, 1, 1, 1, 1,
-0.4331829, -0.3357745, -0.8994815, 0, 0, 1, 1, 1,
-0.4320104, 0.02959905, -3.018033, 1, 0, 0, 1, 1,
-0.431437, 1.511342, -0.2826357, 1, 0, 0, 1, 1,
-0.4314199, -1.58204, -2.819311, 1, 0, 0, 1, 1,
-0.4314009, -0.7227275, -1.199704, 1, 0, 0, 1, 1,
-0.4275704, 0.09940426, 0.3027394, 1, 0, 0, 1, 1,
-0.4255305, 1.044265, -1.454535, 0, 0, 0, 1, 1,
-0.4217908, 0.7142239, 2.354288, 0, 0, 0, 1, 1,
-0.4188799, 0.4872765, -1.053906, 0, 0, 0, 1, 1,
-0.4168682, 1.359127, -0.9608839, 0, 0, 0, 1, 1,
-0.4159612, 1.076357, -0.4447184, 0, 0, 0, 1, 1,
-0.4152602, -0.3848355, -3.384397, 0, 0, 0, 1, 1,
-0.4139449, -0.1870925, -1.277719, 0, 0, 0, 1, 1,
-0.4120471, -0.4323442, -1.981276, 1, 1, 1, 1, 1,
-0.4051646, -0.7009535, -1.531892, 1, 1, 1, 1, 1,
-0.3969585, 0.5626568, -2.15645, 1, 1, 1, 1, 1,
-0.3944518, 0.8139571, -0.9267762, 1, 1, 1, 1, 1,
-0.3917392, -0.04855656, -2.515857, 1, 1, 1, 1, 1,
-0.3890941, 1.394355, -1.655448, 1, 1, 1, 1, 1,
-0.3858942, -1.028648, -2.268425, 1, 1, 1, 1, 1,
-0.3802202, 0.6090894, -0.04591575, 1, 1, 1, 1, 1,
-0.3783003, -0.6447119, -4.213498, 1, 1, 1, 1, 1,
-0.3777085, 1.45699, -0.1451879, 1, 1, 1, 1, 1,
-0.3775387, -1.131974, -4.248831, 1, 1, 1, 1, 1,
-0.3759535, 0.2372945, -1.588302, 1, 1, 1, 1, 1,
-0.3745599, 1.493869, 0.5572982, 1, 1, 1, 1, 1,
-0.3708201, -1.279186, -4.084388, 1, 1, 1, 1, 1,
-0.3694172, 1.945714, -0.5219089, 1, 1, 1, 1, 1,
-0.3599055, 1.962471, -0.2173876, 0, 0, 1, 1, 1,
-0.3557668, 0.8474295, -0.8883184, 1, 0, 0, 1, 1,
-0.3536685, -0.1173908, -2.015875, 1, 0, 0, 1, 1,
-0.3513899, -0.5074691, -0.6542508, 1, 0, 0, 1, 1,
-0.3472318, -0.1265773, -2.217289, 1, 0, 0, 1, 1,
-0.345772, -0.6359948, -2.401172, 1, 0, 0, 1, 1,
-0.3443095, 1.800781, 0.4361588, 0, 0, 0, 1, 1,
-0.3332811, 0.8080103, -0.8213962, 0, 0, 0, 1, 1,
-0.3330147, 0.1494631, -1.628315, 0, 0, 0, 1, 1,
-0.3303374, -2.309354, -2.965917, 0, 0, 0, 1, 1,
-0.3264169, -0.1257854, -2.149274, 0, 0, 0, 1, 1,
-0.3258539, 1.153992, 0.7891228, 0, 0, 0, 1, 1,
-0.3226281, -1.210312, -3.987531, 0, 0, 0, 1, 1,
-0.3202715, 0.3223508, 1.416608, 1, 1, 1, 1, 1,
-0.3188547, -0.9099184, -3.475857, 1, 1, 1, 1, 1,
-0.3094487, 1.189672, 0.07301864, 1, 1, 1, 1, 1,
-0.3077602, -0.2520843, -1.762471, 1, 1, 1, 1, 1,
-0.307294, -0.3081645, -2.716509, 1, 1, 1, 1, 1,
-0.3031255, 0.7161028, -0.001076758, 1, 1, 1, 1, 1,
-0.3024083, 0.3399976, -0.7826644, 1, 1, 1, 1, 1,
-0.2998328, 0.004453728, -2.668949, 1, 1, 1, 1, 1,
-0.2995757, 1.007387, 0.0658836, 1, 1, 1, 1, 1,
-0.2979083, 1.308185, -0.06225009, 1, 1, 1, 1, 1,
-0.297453, -1.338978, -3.547212, 1, 1, 1, 1, 1,
-0.2960452, 0.3439573, -1.991508, 1, 1, 1, 1, 1,
-0.2918008, 0.2691068, -0.2611925, 1, 1, 1, 1, 1,
-0.2865392, -1.218093, -3.466404, 1, 1, 1, 1, 1,
-0.2851532, -0.1087978, -1.256379, 1, 1, 1, 1, 1,
-0.2848511, 1.422632, -0.8284653, 0, 0, 1, 1, 1,
-0.2846991, 0.9325233, 1.129124, 1, 0, 0, 1, 1,
-0.2792746, -0.2387635, -2.436816, 1, 0, 0, 1, 1,
-0.2766437, 1.23041, -0.8933142, 1, 0, 0, 1, 1,
-0.2730125, 0.1638212, -0.815864, 1, 0, 0, 1, 1,
-0.2725497, -0.2708272, -2.168203, 1, 0, 0, 1, 1,
-0.2645699, -2.845972, -4.349371, 0, 0, 0, 1, 1,
-0.2602808, 0.2952613, 0.5109698, 0, 0, 0, 1, 1,
-0.2601991, -1.548363, -2.755029, 0, 0, 0, 1, 1,
-0.2571853, -0.9610841, -2.353876, 0, 0, 0, 1, 1,
-0.2526188, -0.2427039, -1.775497, 0, 0, 0, 1, 1,
-0.2523578, -0.2653738, -2.753606, 0, 0, 0, 1, 1,
-0.243103, -0.04628266, -2.29661, 0, 0, 0, 1, 1,
-0.2424489, 0.3683788, 0.622208, 1, 1, 1, 1, 1,
-0.2404786, -0.005198185, -1.589647, 1, 1, 1, 1, 1,
-0.2392482, 1.463551, -0.933004, 1, 1, 1, 1, 1,
-0.2365099, 0.52452, -1.297113, 1, 1, 1, 1, 1,
-0.2358106, -0.1059038, -3.517187, 1, 1, 1, 1, 1,
-0.2354227, -1.410962, -3.590316, 1, 1, 1, 1, 1,
-0.2311309, -0.2306734, -0.4646774, 1, 1, 1, 1, 1,
-0.2310325, 1.225219, -1.674545, 1, 1, 1, 1, 1,
-0.2304951, -1.087758, -3.09528, 1, 1, 1, 1, 1,
-0.2210734, 1.669422, -1.643309, 1, 1, 1, 1, 1,
-0.2179748, 0.04658897, -2.174731, 1, 1, 1, 1, 1,
-0.2123871, -2.643345, -3.833518, 1, 1, 1, 1, 1,
-0.2107118, 0.2152931, -2.164222, 1, 1, 1, 1, 1,
-0.2105383, -1.30097, -3.22471, 1, 1, 1, 1, 1,
-0.2099448, -1.407842, -3.611453, 1, 1, 1, 1, 1,
-0.2098784, -0.01487344, -0.6425353, 0, 0, 1, 1, 1,
-0.207266, 0.03834994, -1.731951, 1, 0, 0, 1, 1,
-0.2049091, 0.3004895, -0.148956, 1, 0, 0, 1, 1,
-0.2033609, 0.3591825, 0.9696426, 1, 0, 0, 1, 1,
-0.2032975, -0.05187567, -0.6035249, 1, 0, 0, 1, 1,
-0.2029959, 0.8093279, -0.3835341, 1, 0, 0, 1, 1,
-0.2002738, -0.4446956, -2.324294, 0, 0, 0, 1, 1,
-0.1988438, 1.247212, 0.009105363, 0, 0, 0, 1, 1,
-0.1953681, 0.5789286, -0.6639737, 0, 0, 0, 1, 1,
-0.1949108, -0.7012788, -1.43686, 0, 0, 0, 1, 1,
-0.1882334, 0.5101015, -0.4369113, 0, 0, 0, 1, 1,
-0.1810313, -0.7632843, -2.182738, 0, 0, 0, 1, 1,
-0.1794525, -0.655959, -0.9767896, 0, 0, 0, 1, 1,
-0.1788506, -1.148218, -2.78502, 1, 1, 1, 1, 1,
-0.1776445, -1.232757, -4.30526, 1, 1, 1, 1, 1,
-0.177048, -1.192967, -3.415046, 1, 1, 1, 1, 1,
-0.1756223, 1.520063, -1.012378, 1, 1, 1, 1, 1,
-0.1706159, 1.213689, 1.095086, 1, 1, 1, 1, 1,
-0.1701153, -0.4625998, -1.920759, 1, 1, 1, 1, 1,
-0.1634277, -1.217162, -3.382182, 1, 1, 1, 1, 1,
-0.1630145, 1.335418, -1.297236, 1, 1, 1, 1, 1,
-0.1589167, -0.3253222, -2.51513, 1, 1, 1, 1, 1,
-0.1559607, 1.10853, 0.6739427, 1, 1, 1, 1, 1,
-0.1558162, 0.4701354, -1.859262, 1, 1, 1, 1, 1,
-0.1540409, -0.6801496, -4.258255, 1, 1, 1, 1, 1,
-0.1526942, 0.6262555, -0.05129715, 1, 1, 1, 1, 1,
-0.1502426, -0.5964391, -3.280556, 1, 1, 1, 1, 1,
-0.1459295, 0.7175088, -0.0686781, 1, 1, 1, 1, 1,
-0.1423725, 0.5348296, 0.01692208, 0, 0, 1, 1, 1,
-0.1411093, -1.320854, -4.032862, 1, 0, 0, 1, 1,
-0.1372686, 0.6043106, -0.04086135, 1, 0, 0, 1, 1,
-0.133545, 0.09399463, -0.4450701, 1, 0, 0, 1, 1,
-0.1236665, -0.3522556, -3.190114, 1, 0, 0, 1, 1,
-0.1212557, 1.777602, -0.3670737, 1, 0, 0, 1, 1,
-0.1198006, 1.139367, -0.3082357, 0, 0, 0, 1, 1,
-0.1143785, -1.121205, -1.977724, 0, 0, 0, 1, 1,
-0.1102539, -0.5212665, -2.398694, 0, 0, 0, 1, 1,
-0.1096101, -0.6920719, -2.77403, 0, 0, 0, 1, 1,
-0.1070682, -0.4309793, -1.755792, 0, 0, 0, 1, 1,
-0.1004323, 0.7431014, -1.09633, 0, 0, 0, 1, 1,
-0.09924592, 1.182626, -0.8774924, 0, 0, 0, 1, 1,
-0.09803293, -0.2214113, -3.287895, 1, 1, 1, 1, 1,
-0.09362401, -0.5390223, -3.503098, 1, 1, 1, 1, 1,
-0.09129515, -0.2785319, -2.812748, 1, 1, 1, 1, 1,
-0.09063456, 1.021218, -0.1016222, 1, 1, 1, 1, 1,
-0.08533924, 1.779673, -0.227976, 1, 1, 1, 1, 1,
-0.08278178, -0.4163842, -2.550484, 1, 1, 1, 1, 1,
-0.07419395, -1.577718, -3.718545, 1, 1, 1, 1, 1,
-0.07122046, -0.553508, -4.359748, 1, 1, 1, 1, 1,
-0.07049397, 0.4249136, 1.829962, 1, 1, 1, 1, 1,
-0.06923825, -0.6618953, -3.08105, 1, 1, 1, 1, 1,
-0.06673632, 0.3633395, 1.110598, 1, 1, 1, 1, 1,
-0.06509746, 1.833826, -0.07863747, 1, 1, 1, 1, 1,
-0.06394961, 0.8451781, 1.241235, 1, 1, 1, 1, 1,
-0.06320386, -0.9679875, -2.184809, 1, 1, 1, 1, 1,
-0.06138573, 0.6383637, -1.264089, 1, 1, 1, 1, 1,
-0.06011057, 0.1821887, 0.577438, 0, 0, 1, 1, 1,
-0.05927492, 0.4370795, -2.263657, 1, 0, 0, 1, 1,
-0.05716643, 0.5372095, 0.4052102, 1, 0, 0, 1, 1,
-0.0552402, -2.742775, -2.569952, 1, 0, 0, 1, 1,
-0.0547253, 0.3506076, 0.4667047, 1, 0, 0, 1, 1,
-0.0537127, -2.444445, -3.853554, 1, 0, 0, 1, 1,
-0.04861674, -0.8096638, -2.032214, 0, 0, 0, 1, 1,
-0.04596013, 0.06003595, 0.5742217, 0, 0, 0, 1, 1,
-0.04289569, -1.614242, -3.389695, 0, 0, 0, 1, 1,
-0.04261264, 0.6214248, -0.4444883, 0, 0, 0, 1, 1,
-0.04095734, -0.5878766, -2.799662, 0, 0, 0, 1, 1,
-0.03799937, -0.4688204, -4.254253, 0, 0, 0, 1, 1,
-0.03234112, -1.85282, -3.942522, 0, 0, 0, 1, 1,
-0.03026228, -0.3073629, -0.8274438, 1, 1, 1, 1, 1,
-0.02305462, 1.534423, 0.8047951, 1, 1, 1, 1, 1,
-0.02078667, 0.4838824, 0.237139, 1, 1, 1, 1, 1,
-0.01480251, -0.09902021, -2.959633, 1, 1, 1, 1, 1,
-0.01342189, -1.471352, -3.679427, 1, 1, 1, 1, 1,
-0.009901945, 0.3408476, -0.1026657, 1, 1, 1, 1, 1,
-0.00780628, 0.8433329, 0.347564, 1, 1, 1, 1, 1,
-0.007168783, -0.3348938, -3.276828, 1, 1, 1, 1, 1,
-0.005582941, -0.08530369, -4.257679, 1, 1, 1, 1, 1,
-0.002533284, -1.836627, -3.026685, 1, 1, 1, 1, 1,
0.005192964, -1.954423, 3.285737, 1, 1, 1, 1, 1,
0.00541115, 0.2880445, 2.090209, 1, 1, 1, 1, 1,
0.006690891, 1.299752, -0.2559408, 1, 1, 1, 1, 1,
0.01028788, -0.4666985, 3.733799, 1, 1, 1, 1, 1,
0.02113511, -0.5775595, 2.450668, 1, 1, 1, 1, 1,
0.02262479, 0.3676006, -0.05855125, 0, 0, 1, 1, 1,
0.02427952, -0.9018139, 2.395042, 1, 0, 0, 1, 1,
0.02733665, 0.8182094, -1.090188, 1, 0, 0, 1, 1,
0.02797361, -1.315692, 2.050595, 1, 0, 0, 1, 1,
0.02989588, 1.760026, 1.436712, 1, 0, 0, 1, 1,
0.02995093, -0.5269252, 2.859186, 1, 0, 0, 1, 1,
0.03204517, 0.3228476, 0.7170429, 0, 0, 0, 1, 1,
0.03331172, -1.213782, 3.929995, 0, 0, 0, 1, 1,
0.03602444, 1.862247, 0.8835256, 0, 0, 0, 1, 1,
0.03929862, 0.1400596, 0.3751657, 0, 0, 0, 1, 1,
0.03955116, -1.872018, 3.610779, 0, 0, 0, 1, 1,
0.04057468, 0.7623051, -1.743734, 0, 0, 0, 1, 1,
0.04263995, 0.6073244, 0.3635092, 0, 0, 0, 1, 1,
0.0481493, -0.8453861, 4.437736, 1, 1, 1, 1, 1,
0.05169304, -1.051232, 5.59159, 1, 1, 1, 1, 1,
0.05231103, 1.823149, -0.3074965, 1, 1, 1, 1, 1,
0.05303578, -0.3239276, 4.99809, 1, 1, 1, 1, 1,
0.05415661, -0.1782833, 0.06346501, 1, 1, 1, 1, 1,
0.05455777, 1.100833, 0.4265238, 1, 1, 1, 1, 1,
0.06188096, -0.5064791, 2.817992, 1, 1, 1, 1, 1,
0.06241116, -0.3672676, 2.05979, 1, 1, 1, 1, 1,
0.06678455, 1.46688, -0.1765335, 1, 1, 1, 1, 1,
0.07206262, -0.04764555, 2.742239, 1, 1, 1, 1, 1,
0.07370464, -1.388279, 2.840477, 1, 1, 1, 1, 1,
0.07797116, -0.4447068, 2.59207, 1, 1, 1, 1, 1,
0.07885011, -0.2178484, 3.581229, 1, 1, 1, 1, 1,
0.07908793, 0.7551234, -0.9963561, 1, 1, 1, 1, 1,
0.08387133, -0.1186781, 1.220443, 1, 1, 1, 1, 1,
0.08744323, -0.5150727, 2.487771, 0, 0, 1, 1, 1,
0.091255, 1.018611, 0.7049446, 1, 0, 0, 1, 1,
0.09153809, -1.465284, 2.161144, 1, 0, 0, 1, 1,
0.09276117, -0.06805722, 2.231155, 1, 0, 0, 1, 1,
0.09466698, 0.1172253, 1.837753, 1, 0, 0, 1, 1,
0.09665171, -1.340795, 0.9872974, 1, 0, 0, 1, 1,
0.09748937, 0.158805, 0.677892, 0, 0, 0, 1, 1,
0.0996044, 0.993323, -1.098908, 0, 0, 0, 1, 1,
0.1009127, 0.4873522, -0.005580759, 0, 0, 0, 1, 1,
0.1083942, 0.085278, 0.3350995, 0, 0, 0, 1, 1,
0.1097373, -0.3425518, 4.312574, 0, 0, 0, 1, 1,
0.1099556, -0.2150058, 3.345154, 0, 0, 0, 1, 1,
0.1117705, -0.5001206, 0.2756187, 0, 0, 0, 1, 1,
0.1182783, 0.3289057, -0.5746384, 1, 1, 1, 1, 1,
0.1194517, -1.609391, 1.969001, 1, 1, 1, 1, 1,
0.1206368, -0.2100991, 3.637763, 1, 1, 1, 1, 1,
0.1210288, -0.5768629, 3.299186, 1, 1, 1, 1, 1,
0.1230533, -1.172956, 3.241462, 1, 1, 1, 1, 1,
0.1249683, 0.4324245, 1.38966, 1, 1, 1, 1, 1,
0.1260036, -0.5019081, 3.354217, 1, 1, 1, 1, 1,
0.1301999, -1.489587, 3.246782, 1, 1, 1, 1, 1,
0.1307883, 0.006523038, 1.460445, 1, 1, 1, 1, 1,
0.1319381, -0.5371889, 1.305934, 1, 1, 1, 1, 1,
0.1331754, -0.6339505, 2.064254, 1, 1, 1, 1, 1,
0.1398776, 0.3489461, 0.6067839, 1, 1, 1, 1, 1,
0.1399669, -0.4776794, 1.805426, 1, 1, 1, 1, 1,
0.1417213, -0.1109211, 1.784177, 1, 1, 1, 1, 1,
0.1425307, 0.5036064, 1.248389, 1, 1, 1, 1, 1,
0.164459, 0.3075495, 2.668808, 0, 0, 1, 1, 1,
0.1797811, -0.165131, 2.690725, 1, 0, 0, 1, 1,
0.1815928, 0.09163304, 1.875514, 1, 0, 0, 1, 1,
0.1880937, 0.3404157, -0.08911615, 1, 0, 0, 1, 1,
0.1897405, 0.5234513, 0.7849786, 1, 0, 0, 1, 1,
0.1914177, 0.5829029, 0.6607377, 1, 0, 0, 1, 1,
0.2015938, -0.567939, 3.247987, 0, 0, 0, 1, 1,
0.2022606, -0.2337587, 0.7823254, 0, 0, 0, 1, 1,
0.2049126, -0.2774753, 1.120998, 0, 0, 0, 1, 1,
0.2070277, -1.014204, 3.880206, 0, 0, 0, 1, 1,
0.2133197, -0.4321531, 2.744865, 0, 0, 0, 1, 1,
0.2210133, 0.4596169, 0.9500994, 0, 0, 0, 1, 1,
0.2232047, -0.5094745, 2.970935, 0, 0, 0, 1, 1,
0.2280669, -0.1094297, 3.016401, 1, 1, 1, 1, 1,
0.2406106, -0.05532705, 1.330124, 1, 1, 1, 1, 1,
0.2430783, 0.3182032, 3.030489, 1, 1, 1, 1, 1,
0.2446362, -0.001863263, 2.88877, 1, 1, 1, 1, 1,
0.2460977, 0.4628908, 2.848655, 1, 1, 1, 1, 1,
0.2489029, 0.0737419, -0.3633831, 1, 1, 1, 1, 1,
0.256948, 0.3919206, 0.74297, 1, 1, 1, 1, 1,
0.2626505, 1.812805, 0.7886326, 1, 1, 1, 1, 1,
0.2645566, 0.0802179, 0.9271056, 1, 1, 1, 1, 1,
0.2648, 1.188206, -0.9542657, 1, 1, 1, 1, 1,
0.2688105, 0.9890603, -0.08184531, 1, 1, 1, 1, 1,
0.2700836, -0.2850827, 3.031821, 1, 1, 1, 1, 1,
0.2716331, -1.53429, 2.513623, 1, 1, 1, 1, 1,
0.2743304, 0.8436669, 0.1495526, 1, 1, 1, 1, 1,
0.2750867, 1.358527, -0.5489686, 1, 1, 1, 1, 1,
0.2768731, 0.1296584, -0.3250211, 0, 0, 1, 1, 1,
0.2812566, -0.6340331, 3.369547, 1, 0, 0, 1, 1,
0.2819368, -1.225134, 3.272274, 1, 0, 0, 1, 1,
0.2823841, 1.198414, -0.2790962, 1, 0, 0, 1, 1,
0.2832922, -0.1713198, 1.72579, 1, 0, 0, 1, 1,
0.2837457, 1.028822, 0.9088997, 1, 0, 0, 1, 1,
0.2847221, -0.5265267, 3.487992, 0, 0, 0, 1, 1,
0.287659, -0.1168211, 0.9095964, 0, 0, 0, 1, 1,
0.2915965, -0.8559789, 4.530979, 0, 0, 0, 1, 1,
0.2939054, 1.333985, -1.406812, 0, 0, 0, 1, 1,
0.2944898, 0.3789462, 0.8049807, 0, 0, 0, 1, 1,
0.2946476, -0.9739589, 3.513988, 0, 0, 0, 1, 1,
0.2991651, 1.623859, 1.318097, 0, 0, 0, 1, 1,
0.3009589, 0.7560771, -0.3812474, 1, 1, 1, 1, 1,
0.3076602, 1.692266, 0.7357752, 1, 1, 1, 1, 1,
0.3229, 0.5692649, 0.3027071, 1, 1, 1, 1, 1,
0.3236549, 1.784583, -0.01393879, 1, 1, 1, 1, 1,
0.324022, 0.5999067, 1.56136, 1, 1, 1, 1, 1,
0.3339728, -0.8023769, 0.7113278, 1, 1, 1, 1, 1,
0.334467, 0.4932755, -1.573466, 1, 1, 1, 1, 1,
0.3366775, 0.2463159, 1.890779, 1, 1, 1, 1, 1,
0.358207, 1.596264, -0.9964221, 1, 1, 1, 1, 1,
0.3622768, 1.638967, 0.6815547, 1, 1, 1, 1, 1,
0.3638914, 0.6305982, -0.6160455, 1, 1, 1, 1, 1,
0.3653648, -0.5996072, 2.461701, 1, 1, 1, 1, 1,
0.3668194, 0.2973807, 0.3408139, 1, 1, 1, 1, 1,
0.3713592, -0.6763089, 1.466563, 1, 1, 1, 1, 1,
0.376748, 0.1513376, 0.4503443, 1, 1, 1, 1, 1,
0.3773757, -0.7222063, 2.631418, 0, 0, 1, 1, 1,
0.3798056, 0.5321745, 0.987227, 1, 0, 0, 1, 1,
0.3814622, -0.9146484, 1.648996, 1, 0, 0, 1, 1,
0.3819326, 0.6380147, 0.2300423, 1, 0, 0, 1, 1,
0.3849571, 0.1296095, 2.638054, 1, 0, 0, 1, 1,
0.3850291, -0.8185955, 1.073761, 1, 0, 0, 1, 1,
0.3888111, -0.1390184, 1.468975, 0, 0, 0, 1, 1,
0.3901931, 1.927092, -0.01231297, 0, 0, 0, 1, 1,
0.3918689, 1.18732, -0.2052459, 0, 0, 0, 1, 1,
0.3977518, -1.15645, 2.180984, 0, 0, 0, 1, 1,
0.4000503, -1.708385, 2.755754, 0, 0, 0, 1, 1,
0.4020425, 0.5643132, -0.0427893, 0, 0, 0, 1, 1,
0.4028895, -0.4717622, 0.5141846, 0, 0, 0, 1, 1,
0.4045562, -2.391985, 3.409966, 1, 1, 1, 1, 1,
0.4046148, -0.9047698, 0.8774378, 1, 1, 1, 1, 1,
0.4053198, -2.561133, 2.879292, 1, 1, 1, 1, 1,
0.4077415, -1.571316, 1.110239, 1, 1, 1, 1, 1,
0.4203092, 0.1320403, 1.859434, 1, 1, 1, 1, 1,
0.4207116, -0.09560221, 1.454761, 1, 1, 1, 1, 1,
0.4239401, -1.213591, 2.328007, 1, 1, 1, 1, 1,
0.4276627, -1.747066, 1.538756, 1, 1, 1, 1, 1,
0.4292738, 1.035821, 2.45637, 1, 1, 1, 1, 1,
0.4308607, 0.4393837, 2.698798, 1, 1, 1, 1, 1,
0.432905, -0.02915315, 1.944801, 1, 1, 1, 1, 1,
0.4336388, 0.7470985, 0.6211302, 1, 1, 1, 1, 1,
0.4338007, 0.2271481, 1.964366, 1, 1, 1, 1, 1,
0.4354939, -0.6694992, 3.135287, 1, 1, 1, 1, 1,
0.4373387, 0.3873909, 0.2831104, 1, 1, 1, 1, 1,
0.4376788, -0.4660716, 2.307639, 0, 0, 1, 1, 1,
0.4395698, -0.7005745, 1.676287, 1, 0, 0, 1, 1,
0.4422774, -1.357804, 2.860262, 1, 0, 0, 1, 1,
0.4450898, -1.725479, 1.609794, 1, 0, 0, 1, 1,
0.445385, 0.4592369, 0.4251965, 1, 0, 0, 1, 1,
0.446406, 0.5199017, 0.6221468, 1, 0, 0, 1, 1,
0.4466207, -0.6025759, 2.451177, 0, 0, 0, 1, 1,
0.44734, -0.4477068, 2.658653, 0, 0, 0, 1, 1,
0.4513023, -0.6892449, 2.721394, 0, 0, 0, 1, 1,
0.4514008, 0.6936679, 0.8915637, 0, 0, 0, 1, 1,
0.454862, 1.452985, -0.1148341, 0, 0, 0, 1, 1,
0.4594778, 0.4631757, 1.413996, 0, 0, 0, 1, 1,
0.4625633, -0.5713562, 2.155903, 0, 0, 0, 1, 1,
0.4631684, -1.95595, 3.887965, 1, 1, 1, 1, 1,
0.4638714, 1.136679, 1.291468, 1, 1, 1, 1, 1,
0.4652918, 0.09519588, 1.013639, 1, 1, 1, 1, 1,
0.4700007, -0.8503515, 2.793149, 1, 1, 1, 1, 1,
0.4741664, 0.472215, -0.9075945, 1, 1, 1, 1, 1,
0.4741772, 0.396634, 0.8112179, 1, 1, 1, 1, 1,
0.4789032, 0.6076954, 0.2907489, 1, 1, 1, 1, 1,
0.4789597, -1.195219, 2.973472, 1, 1, 1, 1, 1,
0.4815804, 0.3257433, 1.512928, 1, 1, 1, 1, 1,
0.482356, -0.7693249, 2.748103, 1, 1, 1, 1, 1,
0.4883972, 0.06849572, 0.3162169, 1, 1, 1, 1, 1,
0.4911958, 1.802879, 1.245611, 1, 1, 1, 1, 1,
0.4934029, 1.048659, 0.6375725, 1, 1, 1, 1, 1,
0.4958134, 2.208011, 0.2459782, 1, 1, 1, 1, 1,
0.4970664, -0.8266489, 2.832395, 1, 1, 1, 1, 1,
0.5001712, 0.8707414, -0.3101352, 0, 0, 1, 1, 1,
0.5001802, 0.3170298, 0.7994266, 1, 0, 0, 1, 1,
0.5025495, -2.369894, 3.89935, 1, 0, 0, 1, 1,
0.5072499, -1.316797, 2.345855, 1, 0, 0, 1, 1,
0.5087914, 0.2257247, 3.076221, 1, 0, 0, 1, 1,
0.5097851, 0.6251121, 0.5494861, 1, 0, 0, 1, 1,
0.5106607, 0.6508468, -0.5037732, 0, 0, 0, 1, 1,
0.5147848, -1.015503, 1.86607, 0, 0, 0, 1, 1,
0.5193691, -0.5710132, 3.618903, 0, 0, 0, 1, 1,
0.5270547, -0.7688848, 1.866467, 0, 0, 0, 1, 1,
0.5273857, 0.1536084, -0.7146394, 0, 0, 0, 1, 1,
0.5274816, -0.4835016, 1.376825, 0, 0, 0, 1, 1,
0.5359903, -0.6441818, 2.290611, 0, 0, 0, 1, 1,
0.5400777, -0.576979, 1.360024, 1, 1, 1, 1, 1,
0.5431595, 0.1431367, -0.6541154, 1, 1, 1, 1, 1,
0.5520438, -1.417861, 3.721945, 1, 1, 1, 1, 1,
0.564772, 0.4880517, 2.403144, 1, 1, 1, 1, 1,
0.5864316, 1.44423, 0.9057808, 1, 1, 1, 1, 1,
0.5979149, 2.713364, -0.6457081, 1, 1, 1, 1, 1,
0.600572, 0.3872483, 0.8637025, 1, 1, 1, 1, 1,
0.6007823, 0.1758562, 2.049812, 1, 1, 1, 1, 1,
0.6025183, -0.8956974, 0.6692023, 1, 1, 1, 1, 1,
0.6047407, 0.6587403, 1.635455, 1, 1, 1, 1, 1,
0.6071891, 1.262553, 1.842819, 1, 1, 1, 1, 1,
0.6099574, 0.6250952, -0.5290275, 1, 1, 1, 1, 1,
0.612736, -0.1444877, 1.198109, 1, 1, 1, 1, 1,
0.6160142, 0.9352748, 1.427303, 1, 1, 1, 1, 1,
0.6164528, 1.759126, -0.9765005, 1, 1, 1, 1, 1,
0.6242244, 1.670809, 1.283135, 0, 0, 1, 1, 1,
0.626047, 1.145432, 0.3063659, 1, 0, 0, 1, 1,
0.6286789, -0.7902581, 2.845259, 1, 0, 0, 1, 1,
0.6327257, 0.3261008, 1.832731, 1, 0, 0, 1, 1,
0.6330532, 1.326358, 2.959641, 1, 0, 0, 1, 1,
0.6396871, 0.09995285, 2.743119, 1, 0, 0, 1, 1,
0.6400367, -1.047251, 3.866029, 0, 0, 0, 1, 1,
0.6403161, -0.3210569, 2.167538, 0, 0, 0, 1, 1,
0.6404814, 0.202108, 1.073322, 0, 0, 0, 1, 1,
0.6419107, -1.213402, 1.369665, 0, 0, 0, 1, 1,
0.6431127, -1.992413, 3.190351, 0, 0, 0, 1, 1,
0.6457084, 0.8242674, 0.07050047, 0, 0, 0, 1, 1,
0.6460224, 0.9577225, -0.5551583, 0, 0, 0, 1, 1,
0.6487332, 0.3466857, 0.4888332, 1, 1, 1, 1, 1,
0.6521413, -0.01194798, 1.781118, 1, 1, 1, 1, 1,
0.6538647, 1.349112, -0.3401446, 1, 1, 1, 1, 1,
0.6538678, 0.8389863, 1.932465, 1, 1, 1, 1, 1,
0.6546068, 0.2753369, 1.782446, 1, 1, 1, 1, 1,
0.6560786, -0.8524247, 2.434487, 1, 1, 1, 1, 1,
0.6573954, 1.705682, -1.164586, 1, 1, 1, 1, 1,
0.6576095, -1.819532, 1.516342, 1, 1, 1, 1, 1,
0.6589583, 0.2015571, 1.278292, 1, 1, 1, 1, 1,
0.6592419, 0.001099014, 1.357, 1, 1, 1, 1, 1,
0.6603579, -1.756622, 3.236018, 1, 1, 1, 1, 1,
0.6644598, -0.9958251, 1.673511, 1, 1, 1, 1, 1,
0.6691495, 0.6458712, 0.7364026, 1, 1, 1, 1, 1,
0.6731258, 0.3633864, 0.7373402, 1, 1, 1, 1, 1,
0.6795344, 0.7165834, 1.808792, 1, 1, 1, 1, 1,
0.6833672, -0.6040881, 0.9403778, 0, 0, 1, 1, 1,
0.687405, 0.4655427, -0.7547275, 1, 0, 0, 1, 1,
0.6886094, 0.6674547, 0.4773881, 1, 0, 0, 1, 1,
0.6902968, -0.3909373, 1.965443, 1, 0, 0, 1, 1,
0.6936117, -0.234642, 3.819444, 1, 0, 0, 1, 1,
0.6974696, 0.2105957, 0.7167658, 1, 0, 0, 1, 1,
0.7038468, -0.3061267, 2.106521, 0, 0, 0, 1, 1,
0.7084917, 1.109517, 1.104584, 0, 0, 0, 1, 1,
0.7095779, -0.03044301, 0.9915165, 0, 0, 0, 1, 1,
0.713235, -0.8773252, 2.51296, 0, 0, 0, 1, 1,
0.7151545, 0.00719203, 1.457464, 0, 0, 0, 1, 1,
0.7245564, -1.190533, 1.744564, 0, 0, 0, 1, 1,
0.7254626, -0.7710776, 2.663137, 0, 0, 0, 1, 1,
0.7257898, -0.9531118, 0.7892519, 1, 1, 1, 1, 1,
0.7261323, -2.191048, 3.8265, 1, 1, 1, 1, 1,
0.726382, 0.3358454, 2.112777, 1, 1, 1, 1, 1,
0.731361, -0.8625611, -0.04586533, 1, 1, 1, 1, 1,
0.7314149, -0.9980503, 3.797939, 1, 1, 1, 1, 1,
0.7320743, 1.467552, -1.227058, 1, 1, 1, 1, 1,
0.7392147, 1.887475, 2.147917, 1, 1, 1, 1, 1,
0.7399068, -0.8521516, 1.703524, 1, 1, 1, 1, 1,
0.7403377, -0.1907542, 3.546713, 1, 1, 1, 1, 1,
0.7406664, -0.8504161, 2.563851, 1, 1, 1, 1, 1,
0.7417039, 0.1314007, -0.2470165, 1, 1, 1, 1, 1,
0.7429278, 0.07874986, 1.345903, 1, 1, 1, 1, 1,
0.747794, 2.400622, 0.6659658, 1, 1, 1, 1, 1,
0.7484506, 1.338099, 0.7432731, 1, 1, 1, 1, 1,
0.7486005, 0.1632646, 0.8305869, 1, 1, 1, 1, 1,
0.7488579, -0.8010342, 2.322806, 0, 0, 1, 1, 1,
0.7553625, 1.663568, 0.9384934, 1, 0, 0, 1, 1,
0.7592669, 0.4498793, 1.586568, 1, 0, 0, 1, 1,
0.763656, -0.6112927, 2.761141, 1, 0, 0, 1, 1,
0.7737238, 0.2729845, 0.6645784, 1, 0, 0, 1, 1,
0.7777119, 1.339769, 1.062023, 1, 0, 0, 1, 1,
0.7798242, 0.5454, 2.639371, 0, 0, 0, 1, 1,
0.7809249, 1.340298, 0.6730524, 0, 0, 0, 1, 1,
0.7845147, 3.562065, -0.8212294, 0, 0, 0, 1, 1,
0.7904617, 0.8832634, -0.2619076, 0, 0, 0, 1, 1,
0.7915934, -1.69448, 1.414519, 0, 0, 0, 1, 1,
0.7929501, -0.4293476, 2.721173, 0, 0, 0, 1, 1,
0.7940187, 0.137405, 2.424644, 0, 0, 0, 1, 1,
0.7981606, 1.302123, 0.3664402, 1, 1, 1, 1, 1,
0.8062925, -0.4859394, 2.573802, 1, 1, 1, 1, 1,
0.8072289, 0.7704314, 1.559231, 1, 1, 1, 1, 1,
0.8136327, -0.5471199, 0.9057125, 1, 1, 1, 1, 1,
0.8140175, -1.09684, 1.948734, 1, 1, 1, 1, 1,
0.816775, -1.776679, 0.9747971, 1, 1, 1, 1, 1,
0.8259422, -2.191582, 2.061698, 1, 1, 1, 1, 1,
0.8263639, -0.1954833, 2.642942, 1, 1, 1, 1, 1,
0.8274529, 0.9154159, 0.7415104, 1, 1, 1, 1, 1,
0.8278675, 0.2957257, 0.482686, 1, 1, 1, 1, 1,
0.8331351, -1.119597, 1.809747, 1, 1, 1, 1, 1,
0.8351327, -0.4428476, 1.568909, 1, 1, 1, 1, 1,
0.8410724, -0.7788475, 1.668775, 1, 1, 1, 1, 1,
0.8553756, 0.3672887, 0.2767093, 1, 1, 1, 1, 1,
0.8563455, 0.1090895, -0.5277951, 1, 1, 1, 1, 1,
0.8568286, -0.8373626, 0.7349971, 0, 0, 1, 1, 1,
0.8614702, -2.239574, 2.453242, 1, 0, 0, 1, 1,
0.8682516, 0.102707, 1.193419, 1, 0, 0, 1, 1,
0.881355, 0.9051116, 2.111121, 1, 0, 0, 1, 1,
0.8866506, -0.3795979, 0.1620592, 1, 0, 0, 1, 1,
0.889453, -0.9736015, 2.41393, 1, 0, 0, 1, 1,
0.893468, -0.5370515, 4.342348, 0, 0, 0, 1, 1,
0.8977709, 1.534077, 1.013428, 0, 0, 0, 1, 1,
0.8998344, 2.221179, -0.106978, 0, 0, 0, 1, 1,
0.9088989, 0.3797526, -0.4591508, 0, 0, 0, 1, 1,
0.9105135, -0.655251, 2.674291, 0, 0, 0, 1, 1,
0.9135794, -0.425626, 0.5739518, 0, 0, 0, 1, 1,
0.9177715, -0.2164977, 0.9146202, 0, 0, 0, 1, 1,
0.9197664, 1.009552, 2.221297, 1, 1, 1, 1, 1,
0.9228691, 0.218162, 1.690682, 1, 1, 1, 1, 1,
0.924137, -0.3688047, 1.43827, 1, 1, 1, 1, 1,
0.9308692, -0.5934367, 0.5910206, 1, 1, 1, 1, 1,
0.9325344, 1.276375, 1.688715, 1, 1, 1, 1, 1,
0.9369018, -0.8218868, 3.906024, 1, 1, 1, 1, 1,
0.9378556, -0.4442288, 2.171086, 1, 1, 1, 1, 1,
0.9418054, 0.9422454, 2.227109, 1, 1, 1, 1, 1,
0.9437521, 0.2516958, -0.4506313, 1, 1, 1, 1, 1,
0.9501398, -1.195689, 3.447786, 1, 1, 1, 1, 1,
0.9519786, -1.743026, 2.598271, 1, 1, 1, 1, 1,
0.9539663, 0.4187211, 2.244859, 1, 1, 1, 1, 1,
0.9553956, -0.3148344, 0.4364536, 1, 1, 1, 1, 1,
0.9564398, 0.346336, 0.4204997, 1, 1, 1, 1, 1,
0.9579818, -0.4795569, 0.9750199, 1, 1, 1, 1, 1,
0.9596353, 1.174535, 0.9373482, 0, 0, 1, 1, 1,
0.9772589, -0.04826104, 1.486603, 1, 0, 0, 1, 1,
0.9813891, 1.006695, -0.5227854, 1, 0, 0, 1, 1,
0.9929416, -0.968331, 1.94736, 1, 0, 0, 1, 1,
0.9962955, 2.541606, 1.204714, 1, 0, 0, 1, 1,
1.009131, -0.9456741, 3.094272, 1, 0, 0, 1, 1,
1.010766, -0.3937771, 1.261302, 0, 0, 0, 1, 1,
1.01523, 0.4637983, 0.4730117, 0, 0, 0, 1, 1,
1.021477, -1.008098, 2.612778, 0, 0, 0, 1, 1,
1.023678, 0.6574952, 0.6063484, 0, 0, 0, 1, 1,
1.024431, 1.573805, 0.5264671, 0, 0, 0, 1, 1,
1.025675, 0.1442426, 1.769859, 0, 0, 0, 1, 1,
1.027521, 0.3887653, 2.145738, 0, 0, 0, 1, 1,
1.032833, -1.591609, 2.72603, 1, 1, 1, 1, 1,
1.035237, -1.669358, 2.973896, 1, 1, 1, 1, 1,
1.040062, 2.110055, -0.6563758, 1, 1, 1, 1, 1,
1.044096, 1.344254, 1.091872, 1, 1, 1, 1, 1,
1.049859, -0.9423591, 3.319566, 1, 1, 1, 1, 1,
1.050242, 0.03284828, 2.31158, 1, 1, 1, 1, 1,
1.055972, -0.4645477, 2.458462, 1, 1, 1, 1, 1,
1.058458, -0.1376202, 1.008813, 1, 1, 1, 1, 1,
1.063827, -0.1074678, 2.957837, 1, 1, 1, 1, 1,
1.079087, 0.1731829, 2.031655, 1, 1, 1, 1, 1,
1.081887, -0.247326, 1.30941, 1, 1, 1, 1, 1,
1.08393, -0.2015878, 1.141919, 1, 1, 1, 1, 1,
1.094006, -0.02316546, 1.431629, 1, 1, 1, 1, 1,
1.105976, -0.3167943, 0.9646369, 1, 1, 1, 1, 1,
1.116638, -0.106158, 2.597721, 1, 1, 1, 1, 1,
1.117031, 0.008409233, 0.995347, 0, 0, 1, 1, 1,
1.119515, -0.5616644, 1.717203, 1, 0, 0, 1, 1,
1.127871, 1.473545, 0.6926185, 1, 0, 0, 1, 1,
1.128123, -0.3482834, 2.215874, 1, 0, 0, 1, 1,
1.131068, -0.7767594, 2.130719, 1, 0, 0, 1, 1,
1.13416, 1.082674, 1.578697, 1, 0, 0, 1, 1,
1.134187, -0.9232645, 2.911683, 0, 0, 0, 1, 1,
1.143197, 0.2832441, 1.096823, 0, 0, 0, 1, 1,
1.151527, 0.4845461, -1.122679, 0, 0, 0, 1, 1,
1.156179, -1.248175, 2.611306, 0, 0, 0, 1, 1,
1.167125, 1.426308, 1.291241, 0, 0, 0, 1, 1,
1.167503, 0.3983413, 2.283674, 0, 0, 0, 1, 1,
1.17165, 0.4920628, 0.7372266, 0, 0, 0, 1, 1,
1.171711, -0.7290248, 3.022672, 1, 1, 1, 1, 1,
1.174332, 0.273201, 2.84516, 1, 1, 1, 1, 1,
1.175182, -0.3429122, 1.256524, 1, 1, 1, 1, 1,
1.175282, -0.1804831, 2.319391, 1, 1, 1, 1, 1,
1.197112, 1.553336, -1.100009, 1, 1, 1, 1, 1,
1.212407, -2.045992, 1.912202, 1, 1, 1, 1, 1,
1.226224, -0.2965286, 1.159705, 1, 1, 1, 1, 1,
1.24931, -0.008451873, 2.67007, 1, 1, 1, 1, 1,
1.251832, -0.3170786, 1.569248, 1, 1, 1, 1, 1,
1.253904, -0.5232878, 2.028833, 1, 1, 1, 1, 1,
1.264662, 1.09611, -0.5287423, 1, 1, 1, 1, 1,
1.270055, -1.23812, 1.891818, 1, 1, 1, 1, 1,
1.277869, 1.898803, -1.288657, 1, 1, 1, 1, 1,
1.29207, -0.9129785, 1.348832, 1, 1, 1, 1, 1,
1.306943, -1.163318, 2.493577, 1, 1, 1, 1, 1,
1.3083, 1.347612, -0.6673815, 0, 0, 1, 1, 1,
1.318292, -0.9196563, 2.516223, 1, 0, 0, 1, 1,
1.322723, -0.5651037, 2.097316, 1, 0, 0, 1, 1,
1.323935, 0.1127251, 2.124313, 1, 0, 0, 1, 1,
1.326398, 1.338171, 0.8397344, 1, 0, 0, 1, 1,
1.331817, -0.2399865, 3.480963, 1, 0, 0, 1, 1,
1.339719, -0.4967332, 1.933064, 0, 0, 0, 1, 1,
1.347392, -0.3172194, 2.42227, 0, 0, 0, 1, 1,
1.367049, 0.2431418, 1.614502, 0, 0, 0, 1, 1,
1.373916, -1.062843, 1.953167, 0, 0, 0, 1, 1,
1.373986, 1.723216, -0.260627, 0, 0, 0, 1, 1,
1.38002, -1.70362, 3.115982, 0, 0, 0, 1, 1,
1.381572, -0.2343393, 1.186571, 0, 0, 0, 1, 1,
1.383702, 0.3382426, 0.8593904, 1, 1, 1, 1, 1,
1.386333, 0.6968009, 0.7431723, 1, 1, 1, 1, 1,
1.38876, 0.8492383, -0.4044381, 1, 1, 1, 1, 1,
1.38962, 2.365205, 0.6890609, 1, 1, 1, 1, 1,
1.391233, 0.2467775, 0.7462426, 1, 1, 1, 1, 1,
1.402716, -0.2413472, 2.012824, 1, 1, 1, 1, 1,
1.416673, 0.3978411, 2.229038, 1, 1, 1, 1, 1,
1.417054, 0.4751683, 1.021253, 1, 1, 1, 1, 1,
1.428133, -1.058702, 3.384813, 1, 1, 1, 1, 1,
1.432137, -0.1340852, 0.7487816, 1, 1, 1, 1, 1,
1.452933, 0.3996337, 1.688158, 1, 1, 1, 1, 1,
1.458434, -0.1895865, 3.74695, 1, 1, 1, 1, 1,
1.478141, 0.3929981, 0.9828759, 1, 1, 1, 1, 1,
1.484285, -1.416709, 3.038386, 1, 1, 1, 1, 1,
1.485468, -0.9020266, 1.986346, 1, 1, 1, 1, 1,
1.49747, -0.2287429, 0.6840972, 0, 0, 1, 1, 1,
1.500898, -1.078689, 2.18587, 1, 0, 0, 1, 1,
1.505916, -0.5964451, 3.812791, 1, 0, 0, 1, 1,
1.508434, -0.2740169, 0.2317029, 1, 0, 0, 1, 1,
1.525661, 1.106013, 1.194956, 1, 0, 0, 1, 1,
1.535299, -0.1443554, 2.505163, 1, 0, 0, 1, 1,
1.538784, 0.3494484, 1.426191, 0, 0, 0, 1, 1,
1.539751, 0.6520269, 1.842053, 0, 0, 0, 1, 1,
1.560697, 0.6301706, 1.557532, 0, 0, 0, 1, 1,
1.568933, -1.249097, 1.096472, 0, 0, 0, 1, 1,
1.570039, -1.278481, 3.295341, 0, 0, 0, 1, 1,
1.577261, -0.6993217, 2.902158, 0, 0, 0, 1, 1,
1.578232, 0.2004434, 0.6666822, 0, 0, 0, 1, 1,
1.579849, -0.7628397, 1.281283, 1, 1, 1, 1, 1,
1.579856, 0.810486, 2.741296, 1, 1, 1, 1, 1,
1.589134, 1.533612, 0.1291879, 1, 1, 1, 1, 1,
1.594738, -0.1386716, 0.5907214, 1, 1, 1, 1, 1,
1.594962, 3.276688, 0.7661255, 1, 1, 1, 1, 1,
1.595536, 0.2132472, 2.140866, 1, 1, 1, 1, 1,
1.610287, -0.2625216, 4.31137, 1, 1, 1, 1, 1,
1.621966, 0.5877503, 1.123719, 1, 1, 1, 1, 1,
1.622545, 1.119116, -0.2187422, 1, 1, 1, 1, 1,
1.640572, -0.326723, 0.9981894, 1, 1, 1, 1, 1,
1.642366, 0.1805674, 1.146016, 1, 1, 1, 1, 1,
1.648541, 0.2766033, 0.41403, 1, 1, 1, 1, 1,
1.671927, -0.5412972, 1.580379, 1, 1, 1, 1, 1,
1.674526, 0.2767825, 2.75214, 1, 1, 1, 1, 1,
1.679426, 1.098808, 1.753317, 1, 1, 1, 1, 1,
1.680787, -0.1885325, 4.088531, 0, 0, 1, 1, 1,
1.723689, 0.4850646, 1.202015, 1, 0, 0, 1, 1,
1.744001, 1.1911, 1.25202, 1, 0, 0, 1, 1,
1.744769, -2.750139, 3.200511, 1, 0, 0, 1, 1,
1.780171, -1.099832, 1.132553, 1, 0, 0, 1, 1,
1.78479, -0.6737367, 3.826836, 1, 0, 0, 1, 1,
1.785741, -0.07888824, 2.620346, 0, 0, 0, 1, 1,
1.807484, 0.2671263, 2.04445, 0, 0, 0, 1, 1,
1.809864, -0.6302537, 1.857243, 0, 0, 0, 1, 1,
1.81181, 0.06343114, 2.815298, 0, 0, 0, 1, 1,
1.811837, 0.4155911, 3.685117, 0, 0, 0, 1, 1,
1.814131, 1.084355, 2.60645, 0, 0, 0, 1, 1,
1.829721, 0.3668362, 2.460266, 0, 0, 0, 1, 1,
1.854607, 0.8862143, 1.344594, 1, 1, 1, 1, 1,
1.861957, 0.994192, 1.373517, 1, 1, 1, 1, 1,
1.86697, -0.9227377, 2.409151, 1, 1, 1, 1, 1,
1.873552, -1.295642, 1.101813, 1, 1, 1, 1, 1,
1.876086, 1.123736, 0.6493326, 1, 1, 1, 1, 1,
1.920891, 0.3709102, 1.356614, 1, 1, 1, 1, 1,
1.934242, -0.9948593, 2.212198, 1, 1, 1, 1, 1,
1.952865, -0.05100864, 2.059582, 1, 1, 1, 1, 1,
1.9538, -0.3124912, 1.939925, 1, 1, 1, 1, 1,
1.962791, -0.1453521, 1.868499, 1, 1, 1, 1, 1,
1.996689, -0.03916103, 1.568359, 1, 1, 1, 1, 1,
2.004431, -1.732712, 2.35715, 1, 1, 1, 1, 1,
2.006705, 0.6316952, 1.23113, 1, 1, 1, 1, 1,
2.020914, 1.419447, 1.189601, 1, 1, 1, 1, 1,
2.023583, 0.727563, 2.533726, 1, 1, 1, 1, 1,
2.029103, 0.214173, 0.9033306, 0, 0, 1, 1, 1,
2.033233, 0.5046806, 1.160117, 1, 0, 0, 1, 1,
2.04609, 0.3631829, 0.7401909, 1, 0, 0, 1, 1,
2.105201, 0.1293463, 1.248988, 1, 0, 0, 1, 1,
2.151274, -0.8709105, 2.253183, 1, 0, 0, 1, 1,
2.204424, 1.228559, 0.2749349, 1, 0, 0, 1, 1,
2.207639, -1.71208, 2.053896, 0, 0, 0, 1, 1,
2.207754, 0.4997208, 1.984547, 0, 0, 0, 1, 1,
2.217586, -0.8121262, 3.139771, 0, 0, 0, 1, 1,
2.221097, 0.5073504, 1.946562, 0, 0, 0, 1, 1,
2.297088, 0.6071377, 1.884663, 0, 0, 0, 1, 1,
2.321918, 0.6405046, 3.7565, 0, 0, 0, 1, 1,
2.337631, -2.204163, 3.59924, 0, 0, 0, 1, 1,
2.365456, 0.3177705, 2.67556, 1, 1, 1, 1, 1,
2.549224, -0.5033938, 1.222108, 1, 1, 1, 1, 1,
2.586339, -0.9844238, 1.91534, 1, 1, 1, 1, 1,
2.603501, -0.7254635, 1.339407, 1, 1, 1, 1, 1,
2.796309, 1.370892, -0.5519333, 1, 1, 1, 1, 1,
2.83357, 0.4612758, 1.800355, 1, 1, 1, 1, 1,
3.412462, 0.07526208, 0.6620197, 1, 1, 1, 1, 1
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
var radius = 9.712682;
var distance = 34.11539;
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
mvMatrix.translate( -0.0733273, -0.2758389, -0.206923 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.11539);
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
