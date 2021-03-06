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
-3.3602, 0.8936166, -1.603419, 1, 0, 0, 1,
-2.850466, -1.451061, -0.7709109, 1, 0.007843138, 0, 1,
-2.70286, -1.444743, -3.057039, 1, 0.01176471, 0, 1,
-2.532248, -2.006156, -3.698561, 1, 0.01960784, 0, 1,
-2.422832, 0.1250992, -1.428102, 1, 0.02352941, 0, 1,
-2.416176, -0.1990329, -1.618016, 1, 0.03137255, 0, 1,
-2.3698, -0.5474095, -1.628861, 1, 0.03529412, 0, 1,
-2.340576, 0.6396847, -1.5284, 1, 0.04313726, 0, 1,
-2.303968, 1.207235, -0.5775397, 1, 0.04705882, 0, 1,
-2.237241, -0.5423911, -1.450011, 1, 0.05490196, 0, 1,
-2.161539, -1.497813, -2.593854, 1, 0.05882353, 0, 1,
-2.159812, -0.3455163, 0.4243862, 1, 0.06666667, 0, 1,
-2.123705, 0.2276527, -1.355382, 1, 0.07058824, 0, 1,
-2.119068, -0.7905865, 0.3545013, 1, 0.07843138, 0, 1,
-2.117782, -0.7181053, -3.411294, 1, 0.08235294, 0, 1,
-2.104475, 0.3256013, -0.04082685, 1, 0.09019608, 0, 1,
-2.091788, 0.6524165, -1.738945, 1, 0.09411765, 0, 1,
-2.08543, -0.845291, -1.274863, 1, 0.1019608, 0, 1,
-2.073633, 0.6532974, -1.444409, 1, 0.1098039, 0, 1,
-2.056731, 0.5223312, -0.6217722, 1, 0.1137255, 0, 1,
-2.015658, -0.9307148, -0.9281037, 1, 0.1215686, 0, 1,
-1.973427, -1.336423, -1.892254, 1, 0.1254902, 0, 1,
-1.968162, -0.6391727, -2.457486, 1, 0.1333333, 0, 1,
-1.95531, -1.068166, -1.99669, 1, 0.1372549, 0, 1,
-1.950598, 1.025393, -1.995875, 1, 0.145098, 0, 1,
-1.938613, -1.61692, -1.614922, 1, 0.1490196, 0, 1,
-1.925054, -1.342518, -2.543195, 1, 0.1568628, 0, 1,
-1.919491, 0.4417199, 0.3120754, 1, 0.1607843, 0, 1,
-1.907379, 0.3263397, -1.61891, 1, 0.1686275, 0, 1,
-1.90714, -0.1970115, -0.2571487, 1, 0.172549, 0, 1,
-1.889735, -1.700706, -2.845047, 1, 0.1803922, 0, 1,
-1.88067, 0.027392, -2.471825, 1, 0.1843137, 0, 1,
-1.865093, 1.817087, -1.212127, 1, 0.1921569, 0, 1,
-1.85544, 0.6063434, -1.782327, 1, 0.1960784, 0, 1,
-1.843378, 0.0286469, -4.153776, 1, 0.2039216, 0, 1,
-1.842686, 0.6716352, -2.502956, 1, 0.2117647, 0, 1,
-1.834131, -0.5299876, -1.391518, 1, 0.2156863, 0, 1,
-1.820446, -1.143484, -1.809382, 1, 0.2235294, 0, 1,
-1.818696, -0.03877636, -2.57711, 1, 0.227451, 0, 1,
-1.800026, -0.6945034, -0.1918705, 1, 0.2352941, 0, 1,
-1.783855, 0.5353551, -0.4837976, 1, 0.2392157, 0, 1,
-1.736354, -0.3475388, -3.727723, 1, 0.2470588, 0, 1,
-1.7277, 1.157924, -2.233349, 1, 0.2509804, 0, 1,
-1.714296, -0.6867942, -0.8258517, 1, 0.2588235, 0, 1,
-1.693441, 1.032502, -1.914525, 1, 0.2627451, 0, 1,
-1.690182, -2.556854, -2.30394, 1, 0.2705882, 0, 1,
-1.635947, -1.982334, -1.377993, 1, 0.2745098, 0, 1,
-1.633899, -0.2123915, -1.809314, 1, 0.282353, 0, 1,
-1.626711, 0.5287343, -0.7501075, 1, 0.2862745, 0, 1,
-1.621346, 0.7908495, -1.988942, 1, 0.2941177, 0, 1,
-1.612351, 0.4456474, -1.723442, 1, 0.3019608, 0, 1,
-1.605269, -0.9058095, -1.493612, 1, 0.3058824, 0, 1,
-1.591039, -0.6838327, -2.979674, 1, 0.3137255, 0, 1,
-1.590286, 1.786922, -0.725713, 1, 0.3176471, 0, 1,
-1.585321, 2.689566, 0.8046218, 1, 0.3254902, 0, 1,
-1.550629, 0.3211317, -1.018673, 1, 0.3294118, 0, 1,
-1.548529, 0.9149892, -1.867336, 1, 0.3372549, 0, 1,
-1.54255, -0.9663541, -4.302267, 1, 0.3411765, 0, 1,
-1.532398, 0.6672544, -0.7814056, 1, 0.3490196, 0, 1,
-1.526338, 1.336307, -0.5884995, 1, 0.3529412, 0, 1,
-1.516181, 1.985636, -0.3166867, 1, 0.3607843, 0, 1,
-1.505974, -1.368024, -3.48683, 1, 0.3647059, 0, 1,
-1.490525, 0.9905848, -1.557524, 1, 0.372549, 0, 1,
-1.48623, -1.961019, -3.832517, 1, 0.3764706, 0, 1,
-1.480764, 0.972392, -0.426719, 1, 0.3843137, 0, 1,
-1.478907, 0.8499289, -0.4265242, 1, 0.3882353, 0, 1,
-1.476015, -1.588282, -4.310316, 1, 0.3960784, 0, 1,
-1.474447, -0.6788701, -1.665837, 1, 0.4039216, 0, 1,
-1.466474, -0.7400857, -0.9766757, 1, 0.4078431, 0, 1,
-1.455261, 0.6036084, -1.884738, 1, 0.4156863, 0, 1,
-1.451248, -0.4534374, -4.05029, 1, 0.4196078, 0, 1,
-1.450528, 0.4115576, -1.634943, 1, 0.427451, 0, 1,
-1.442957, 0.8077648, -0.7544942, 1, 0.4313726, 0, 1,
-1.417394, 1.605354, -3.264702, 1, 0.4392157, 0, 1,
-1.406952, -0.7873847, -2.084323, 1, 0.4431373, 0, 1,
-1.406247, 1.695223, -0.8597326, 1, 0.4509804, 0, 1,
-1.390588, -1.759106, -2.447287, 1, 0.454902, 0, 1,
-1.384416, -0.04394686, -1.417052, 1, 0.4627451, 0, 1,
-1.38188, -0.5455095, -2.476898, 1, 0.4666667, 0, 1,
-1.381831, 1.096765, -1.519079, 1, 0.4745098, 0, 1,
-1.37583, -0.4157496, -1.404509, 1, 0.4784314, 0, 1,
-1.358635, -0.6957646, -1.47323, 1, 0.4862745, 0, 1,
-1.351616, 1.261836, -1.233462, 1, 0.4901961, 0, 1,
-1.344007, 0.3670473, -1.12257, 1, 0.4980392, 0, 1,
-1.336508, -0.9207025, -2.138187, 1, 0.5058824, 0, 1,
-1.321566, 0.4639311, -2.866204, 1, 0.509804, 0, 1,
-1.31675, 0.1950748, 0.4015038, 1, 0.5176471, 0, 1,
-1.307682, -1.345246, -2.364371, 1, 0.5215687, 0, 1,
-1.303009, -0.9065776, -1.982444, 1, 0.5294118, 0, 1,
-1.29752, 0.2037113, -2.621884, 1, 0.5333334, 0, 1,
-1.295279, 0.355849, -0.9366132, 1, 0.5411765, 0, 1,
-1.293276, -0.518556, -2.567027, 1, 0.5450981, 0, 1,
-1.278887, 0.4132665, -0.3779496, 1, 0.5529412, 0, 1,
-1.269512, 1.220273, -0.9179518, 1, 0.5568628, 0, 1,
-1.266538, -0.9973747, -3.008598, 1, 0.5647059, 0, 1,
-1.262267, -0.3707292, -1.207054, 1, 0.5686275, 0, 1,
-1.256812, 0.09242921, -1.859208, 1, 0.5764706, 0, 1,
-1.255814, 1.799357, -0.7406673, 1, 0.5803922, 0, 1,
-1.252641, -0.6522696, -2.15663, 1, 0.5882353, 0, 1,
-1.246129, -0.6118384, -1.820024, 1, 0.5921569, 0, 1,
-1.242971, 1.421139, -0.07214477, 1, 0.6, 0, 1,
-1.237732, -0.8594697, -0.2669556, 1, 0.6078432, 0, 1,
-1.235345, 0.8836355, -0.9663075, 1, 0.6117647, 0, 1,
-1.227502, -0.8967223, -1.090772, 1, 0.6196079, 0, 1,
-1.222277, -0.022884, -2.461529, 1, 0.6235294, 0, 1,
-1.221474, -0.8050306, -1.725248, 1, 0.6313726, 0, 1,
-1.211862, 0.3499184, -1.908285, 1, 0.6352941, 0, 1,
-1.209144, 0.8989933, -1.360323, 1, 0.6431373, 0, 1,
-1.208787, 0.173097, -1.400064, 1, 0.6470588, 0, 1,
-1.205209, -0.8287765, -1.711538, 1, 0.654902, 0, 1,
-1.202739, -1.436628, -0.6420758, 1, 0.6588235, 0, 1,
-1.201786, 0.5952988, -0.4283691, 1, 0.6666667, 0, 1,
-1.196425, 0.8821892, -1.426981, 1, 0.6705883, 0, 1,
-1.192839, 0.6675067, -0.07801943, 1, 0.6784314, 0, 1,
-1.1889, -2.106319, -1.930084, 1, 0.682353, 0, 1,
-1.185027, 0.6278356, -1.329283, 1, 0.6901961, 0, 1,
-1.182568, 0.9964287, 0.1722997, 1, 0.6941177, 0, 1,
-1.180073, -3.122118, -4.575115, 1, 0.7019608, 0, 1,
-1.177338, 1.982466, -1.836028, 1, 0.7098039, 0, 1,
-1.167105, 1.030338, -0.01402797, 1, 0.7137255, 0, 1,
-1.161617, 0.3152391, -2.844408, 1, 0.7215686, 0, 1,
-1.16056, 0.6717665, -0.9359933, 1, 0.7254902, 0, 1,
-1.158121, 0.2549596, -0.9839348, 1, 0.7333333, 0, 1,
-1.157978, -0.2389953, -2.593705, 1, 0.7372549, 0, 1,
-1.152705, 0.0946881, 0.711395, 1, 0.7450981, 0, 1,
-1.140796, -0.9646451, -2.859059, 1, 0.7490196, 0, 1,
-1.130282, 0.6564763, -1.503933, 1, 0.7568628, 0, 1,
-1.126517, -0.5289575, -0.8815173, 1, 0.7607843, 0, 1,
-1.12614, 1.006912, -1.187676, 1, 0.7686275, 0, 1,
-1.125082, -0.01818699, -3.276035, 1, 0.772549, 0, 1,
-1.123559, -0.1293251, -1.870398, 1, 0.7803922, 0, 1,
-1.120057, 1.49006, -1.568064, 1, 0.7843137, 0, 1,
-1.115758, 0.4206683, -1.108038, 1, 0.7921569, 0, 1,
-1.115131, -0.1814714, -1.802297, 1, 0.7960784, 0, 1,
-1.106388, -0.399723, -3.373082, 1, 0.8039216, 0, 1,
-1.105762, 0.3178474, 0.2115377, 1, 0.8117647, 0, 1,
-1.103389, -1.17802, -4.275022, 1, 0.8156863, 0, 1,
-1.099989, -1.523615, -2.062768, 1, 0.8235294, 0, 1,
-1.098114, -1.401474, -3.521554, 1, 0.827451, 0, 1,
-1.097493, 1.433409, -0.5937272, 1, 0.8352941, 0, 1,
-1.096278, 0.00891173, -1.585276, 1, 0.8392157, 0, 1,
-1.095553, -1.093326, -2.226871, 1, 0.8470588, 0, 1,
-1.085201, -0.5218858, -0.7745098, 1, 0.8509804, 0, 1,
-1.084326, 0.6767687, -1.001744, 1, 0.8588235, 0, 1,
-1.083157, 0.2815991, 0.7878128, 1, 0.8627451, 0, 1,
-1.075962, -0.6324952, -2.608424, 1, 0.8705882, 0, 1,
-1.071924, -0.2993362, -2.077009, 1, 0.8745098, 0, 1,
-1.070908, 1.483296, -0.105283, 1, 0.8823529, 0, 1,
-1.070861, -0.1330159, -2.691798, 1, 0.8862745, 0, 1,
-1.065034, 1.191465, -2.869678, 1, 0.8941177, 0, 1,
-1.062857, 2.0949, -0.648652, 1, 0.8980392, 0, 1,
-1.048623, -1.195714, -2.739034, 1, 0.9058824, 0, 1,
-1.047718, 0.2037155, -0.3647142, 1, 0.9137255, 0, 1,
-1.045448, 2.366731, -1.679714, 1, 0.9176471, 0, 1,
-1.045065, -0.4923255, -3.624469, 1, 0.9254902, 0, 1,
-1.04406, 0.8316802, -1.815819, 1, 0.9294118, 0, 1,
-1.03914, -2.001978, -3.317758, 1, 0.9372549, 0, 1,
-1.028739, -1.00777, -3.334754, 1, 0.9411765, 0, 1,
-1.027956, 0.2483015, -1.923587, 1, 0.9490196, 0, 1,
-1.023772, 0.1565031, -1.385845, 1, 0.9529412, 0, 1,
-1.013394, -1.258891, -1.982286, 1, 0.9607843, 0, 1,
-1.010676, -0.8948511, -1.915606, 1, 0.9647059, 0, 1,
-1.009447, -0.7704543, -3.20769, 1, 0.972549, 0, 1,
-1.001516, 0.9238691, 0.8022701, 1, 0.9764706, 0, 1,
-0.9973529, 1.847314, -0.6040025, 1, 0.9843137, 0, 1,
-0.9933724, -0.7740961, -2.017004, 1, 0.9882353, 0, 1,
-0.9923872, 1.53575, -2.379469, 1, 0.9960784, 0, 1,
-0.991944, 1.210336, -0.9466027, 0.9960784, 1, 0, 1,
-0.9870622, 0.03443345, -2.586165, 0.9921569, 1, 0, 1,
-0.9818168, 0.2925948, -0.7605683, 0.9843137, 1, 0, 1,
-0.9809792, 0.4644526, -1.28022, 0.9803922, 1, 0, 1,
-0.9728039, -0.737991, -2.567635, 0.972549, 1, 0, 1,
-0.9671507, 0.5072263, -0.4839527, 0.9686275, 1, 0, 1,
-0.9612961, -0.3391107, -0.350902, 0.9607843, 1, 0, 1,
-0.961084, -0.7592222, -1.62926, 0.9568627, 1, 0, 1,
-0.9609725, 0.5348774, -0.09403662, 0.9490196, 1, 0, 1,
-0.9601822, -1.596334, -1.324304, 0.945098, 1, 0, 1,
-0.9431629, 0.682198, -2.514062, 0.9372549, 1, 0, 1,
-0.9341314, 0.03800145, -2.65035, 0.9333333, 1, 0, 1,
-0.9292896, 0.3131342, -1.346338, 0.9254902, 1, 0, 1,
-0.9282706, -0.3812301, -0.4705417, 0.9215686, 1, 0, 1,
-0.9278037, 0.4964378, -1.54829, 0.9137255, 1, 0, 1,
-0.9271452, -1.474439, -1.78284, 0.9098039, 1, 0, 1,
-0.924537, 0.1180215, -0.02764186, 0.9019608, 1, 0, 1,
-0.9220186, -0.965483, -3.225527, 0.8941177, 1, 0, 1,
-0.9195611, 1.095967, -2.200794, 0.8901961, 1, 0, 1,
-0.9161292, -2.163346, -1.040013, 0.8823529, 1, 0, 1,
-0.9126773, -0.1344493, -1.886665, 0.8784314, 1, 0, 1,
-0.9087086, -0.2524113, -2.076954, 0.8705882, 1, 0, 1,
-0.9062653, -0.420165, -2.053024, 0.8666667, 1, 0, 1,
-0.9016698, 0.8021578, -0.5978959, 0.8588235, 1, 0, 1,
-0.9015707, -1.437451, -1.911775, 0.854902, 1, 0, 1,
-0.9008046, -0.2779075, -3.857253, 0.8470588, 1, 0, 1,
-0.8993441, 0.8361263, -1.251347, 0.8431373, 1, 0, 1,
-0.8939282, -0.08328739, -2.024925, 0.8352941, 1, 0, 1,
-0.893896, -0.1182408, -2.380564, 0.8313726, 1, 0, 1,
-0.8886126, 0.09091799, -3.235915, 0.8235294, 1, 0, 1,
-0.8856847, -0.3349842, -2.975079, 0.8196079, 1, 0, 1,
-0.8843961, 1.466383, -1.328145, 0.8117647, 1, 0, 1,
-0.8762889, -0.440408, -2.798638, 0.8078431, 1, 0, 1,
-0.8750367, 1.619476, 0.4494072, 0.8, 1, 0, 1,
-0.8712981, 0.00961685, -2.362396, 0.7921569, 1, 0, 1,
-0.8653895, 0.8444099, -2.450087, 0.7882353, 1, 0, 1,
-0.8630601, 1.536328, 0.7159197, 0.7803922, 1, 0, 1,
-0.8613519, 0.7899994, -1.434354, 0.7764706, 1, 0, 1,
-0.86112, 1.179718, -0.02906462, 0.7686275, 1, 0, 1,
-0.8594037, -0.9744793, -1.577268, 0.7647059, 1, 0, 1,
-0.8521915, 1.369655, -1.645074, 0.7568628, 1, 0, 1,
-0.8450176, 0.02616671, 0.3003956, 0.7529412, 1, 0, 1,
-0.8428842, 0.1993918, -0.4404243, 0.7450981, 1, 0, 1,
-0.8413656, 0.04806102, -2.66909, 0.7411765, 1, 0, 1,
-0.8379787, -2.681134, -1.823177, 0.7333333, 1, 0, 1,
-0.8378766, 2.620565, -1.492786, 0.7294118, 1, 0, 1,
-0.8262152, 1.635611, 0.01661904, 0.7215686, 1, 0, 1,
-0.8257561, -1.109052, -2.005978, 0.7176471, 1, 0, 1,
-0.8256279, 1.405882, 0.4529278, 0.7098039, 1, 0, 1,
-0.8175355, -0.8642395, -2.270342, 0.7058824, 1, 0, 1,
-0.8058364, 0.6387106, -0.2570018, 0.6980392, 1, 0, 1,
-0.7995417, 0.08415356, -3.898311, 0.6901961, 1, 0, 1,
-0.7967424, -1.135226, -3.683434, 0.6862745, 1, 0, 1,
-0.794185, -0.3107935, -2.385504, 0.6784314, 1, 0, 1,
-0.784947, 0.5579444, -1.745955, 0.6745098, 1, 0, 1,
-0.7835881, -1.843326, -2.94887, 0.6666667, 1, 0, 1,
-0.7827238, 1.481831, 1.562289, 0.6627451, 1, 0, 1,
-0.7826952, -0.05436433, -1.973231, 0.654902, 1, 0, 1,
-0.7810248, -0.1823319, -2.324025, 0.6509804, 1, 0, 1,
-0.771705, 1.19107, -0.5351073, 0.6431373, 1, 0, 1,
-0.7711735, 0.09553891, -1.498929, 0.6392157, 1, 0, 1,
-0.7677348, 0.5564398, 1.13718, 0.6313726, 1, 0, 1,
-0.7664246, -0.4884868, -2.57389, 0.627451, 1, 0, 1,
-0.7659043, 1.910538, -0.02340903, 0.6196079, 1, 0, 1,
-0.7605876, 1.101381, -0.5497258, 0.6156863, 1, 0, 1,
-0.7581024, 0.7239386, -0.5459881, 0.6078432, 1, 0, 1,
-0.7558334, 0.6150276, -0.3798892, 0.6039216, 1, 0, 1,
-0.7557473, 0.8233725, -0.7069852, 0.5960785, 1, 0, 1,
-0.753677, 0.227002, 0.6015674, 0.5882353, 1, 0, 1,
-0.7530845, -0.05020782, -1.883102, 0.5843138, 1, 0, 1,
-0.7480069, 1.727723, -0.7121717, 0.5764706, 1, 0, 1,
-0.7447208, -0.3932653, -2.532009, 0.572549, 1, 0, 1,
-0.7383426, 0.2750795, -1.391374, 0.5647059, 1, 0, 1,
-0.7310171, -0.4685455, -3.084674, 0.5607843, 1, 0, 1,
-0.7306569, 0.02711661, -2.078868, 0.5529412, 1, 0, 1,
-0.7238603, -2.039058, -3.703523, 0.5490196, 1, 0, 1,
-0.7187367, -0.2499767, -2.548176, 0.5411765, 1, 0, 1,
-0.71846, 1.086179, 0.3962584, 0.5372549, 1, 0, 1,
-0.7156785, 0.5090333, 0.2674921, 0.5294118, 1, 0, 1,
-0.7106511, 0.8540762, -0.3776318, 0.5254902, 1, 0, 1,
-0.7045974, 1.855588, -1.967395, 0.5176471, 1, 0, 1,
-0.6925078, -0.572001, -0.8141116, 0.5137255, 1, 0, 1,
-0.6846512, -0.02657001, -0.8231855, 0.5058824, 1, 0, 1,
-0.6791514, -1.279957, -2.955202, 0.5019608, 1, 0, 1,
-0.6786607, -0.2679877, -3.442421, 0.4941176, 1, 0, 1,
-0.6698869, 1.233792, 0.2415608, 0.4862745, 1, 0, 1,
-0.6673908, -1.049543, -4.354777, 0.4823529, 1, 0, 1,
-0.6635538, -1.616816, -3.246553, 0.4745098, 1, 0, 1,
-0.6545186, 0.371292, -0.8495429, 0.4705882, 1, 0, 1,
-0.6532854, -1.130011, -2.531913, 0.4627451, 1, 0, 1,
-0.6531574, 0.717353, 0.4619688, 0.4588235, 1, 0, 1,
-0.6530904, 1.678241, 0.2142727, 0.4509804, 1, 0, 1,
-0.6520686, -0.4219938, -3.727794, 0.4470588, 1, 0, 1,
-0.6519728, 2.517066, 0.282892, 0.4392157, 1, 0, 1,
-0.6503907, -0.0683421, -2.12542, 0.4352941, 1, 0, 1,
-0.6496646, 1.324266, -1.143017, 0.427451, 1, 0, 1,
-0.6496472, -0.04238283, -2.477449, 0.4235294, 1, 0, 1,
-0.6478199, 0.9840357, 0.2386187, 0.4156863, 1, 0, 1,
-0.6437083, -0.00434242, -2.050049, 0.4117647, 1, 0, 1,
-0.6383386, 0.7168354, 0.6932559, 0.4039216, 1, 0, 1,
-0.6379728, 0.9078897, -0.2548128, 0.3960784, 1, 0, 1,
-0.6378061, -1.065377, -2.336282, 0.3921569, 1, 0, 1,
-0.6376783, -0.3309314, -2.074897, 0.3843137, 1, 0, 1,
-0.6372835, 0.7050834, -0.8057914, 0.3803922, 1, 0, 1,
-0.6352149, -0.89126, -1.893903, 0.372549, 1, 0, 1,
-0.6351166, -0.4582871, -2.458129, 0.3686275, 1, 0, 1,
-0.6344082, 0.104904, -1.214036, 0.3607843, 1, 0, 1,
-0.6342047, 1.123579, -0.1346925, 0.3568628, 1, 0, 1,
-0.6255554, -0.4160624, -0.573683, 0.3490196, 1, 0, 1,
-0.6251999, 0.2219518, -1.581646, 0.345098, 1, 0, 1,
-0.6222789, -0.6574246, -1.349949, 0.3372549, 1, 0, 1,
-0.6140562, -0.9184207, -2.63963, 0.3333333, 1, 0, 1,
-0.6046928, -0.9939466, -2.015372, 0.3254902, 1, 0, 1,
-0.6014162, 2.086467, 0.3991549, 0.3215686, 1, 0, 1,
-0.6013675, 0.6347252, -0.2984686, 0.3137255, 1, 0, 1,
-0.6009417, -0.9509971, -1.584184, 0.3098039, 1, 0, 1,
-0.5984567, -0.1801869, -1.561598, 0.3019608, 1, 0, 1,
-0.590818, -1.491915, -3.66134, 0.2941177, 1, 0, 1,
-0.5897446, -0.2059771, -3.055324, 0.2901961, 1, 0, 1,
-0.5895158, -0.2349563, -1.293593, 0.282353, 1, 0, 1,
-0.5872199, 0.1843175, -0.3908194, 0.2784314, 1, 0, 1,
-0.5858397, -0.7710094, -3.281331, 0.2705882, 1, 0, 1,
-0.5854638, -1.703779, -3.339993, 0.2666667, 1, 0, 1,
-0.5832669, -0.07636692, -1.430816, 0.2588235, 1, 0, 1,
-0.5827501, -0.4520486, -2.256691, 0.254902, 1, 0, 1,
-0.5819175, -2.099635, -1.461617, 0.2470588, 1, 0, 1,
-0.580871, 1.865363, -1.006802, 0.2431373, 1, 0, 1,
-0.5792118, 0.07787035, 0.3165534, 0.2352941, 1, 0, 1,
-0.5791473, 2.031049, -0.7994666, 0.2313726, 1, 0, 1,
-0.5783234, -0.03225225, 0.6378003, 0.2235294, 1, 0, 1,
-0.5702264, -0.4480746, -1.865714, 0.2196078, 1, 0, 1,
-0.5674313, 1.776258, 0.4369517, 0.2117647, 1, 0, 1,
-0.5641128, -0.6202052, -2.592067, 0.2078431, 1, 0, 1,
-0.5606449, 1.445594, -0.08098233, 0.2, 1, 0, 1,
-0.5578086, -0.5030171, -2.298904, 0.1921569, 1, 0, 1,
-0.5502849, 3.144496, 0.5784279, 0.1882353, 1, 0, 1,
-0.5497473, 1.210513, -0.6914135, 0.1803922, 1, 0, 1,
-0.5466984, -0.8473672, -3.16888, 0.1764706, 1, 0, 1,
-0.5452932, 1.835799, -0.2262382, 0.1686275, 1, 0, 1,
-0.5419376, -0.1488829, -3.141823, 0.1647059, 1, 0, 1,
-0.5412821, 0.3603011, -0.2700976, 0.1568628, 1, 0, 1,
-0.5410841, 0.03570544, -2.845158, 0.1529412, 1, 0, 1,
-0.5394719, 0.9361963, -0.8378807, 0.145098, 1, 0, 1,
-0.5364807, -0.28561, -1.201808, 0.1411765, 1, 0, 1,
-0.5342626, 0.4882232, -1.203494, 0.1333333, 1, 0, 1,
-0.5321884, -1.216438, -1.456956, 0.1294118, 1, 0, 1,
-0.531725, 0.0624223, -1.341518, 0.1215686, 1, 0, 1,
-0.5295706, -2.300472, -3.783808, 0.1176471, 1, 0, 1,
-0.525012, 0.2245563, -0.7051814, 0.1098039, 1, 0, 1,
-0.523019, -0.3902014, -3.274885, 0.1058824, 1, 0, 1,
-0.5207762, 0.9155434, -0.9871967, 0.09803922, 1, 0, 1,
-0.5179787, 0.3814486, -0.8753999, 0.09019608, 1, 0, 1,
-0.514936, 1.961683, -0.3522161, 0.08627451, 1, 0, 1,
-0.512265, 0.7631968, -1.834007, 0.07843138, 1, 0, 1,
-0.5097517, 0.294313, 0.08492193, 0.07450981, 1, 0, 1,
-0.5073227, -1.211496, -1.403157, 0.06666667, 1, 0, 1,
-0.505221, 1.186139, -1.077576, 0.0627451, 1, 0, 1,
-0.5050357, -2.242513, -3.745233, 0.05490196, 1, 0, 1,
-0.5045553, 0.5407333, 0.1899153, 0.05098039, 1, 0, 1,
-0.5017494, -0.4845677, -1.462043, 0.04313726, 1, 0, 1,
-0.4966003, -1.368361, -2.959209, 0.03921569, 1, 0, 1,
-0.4958988, -0.386488, -2.378487, 0.03137255, 1, 0, 1,
-0.4931566, -0.1044005, -1.898401, 0.02745098, 1, 0, 1,
-0.4886933, 0.4021229, -0.6595505, 0.01960784, 1, 0, 1,
-0.4880606, 2.313945, -1.009144, 0.01568628, 1, 0, 1,
-0.4849478, 1.61342, -1.002012, 0.007843138, 1, 0, 1,
-0.484793, 0.4319153, 0.1741509, 0.003921569, 1, 0, 1,
-0.48331, 2.739112, -0.0406683, 0, 1, 0.003921569, 1,
-0.4807006, 1.113493, -0.9031927, 0, 1, 0.01176471, 1,
-0.478337, 0.9927856, -1.433415, 0, 1, 0.01568628, 1,
-0.4753653, -2.381233, -4.14497, 0, 1, 0.02352941, 1,
-0.4742729, 0.123701, 0.04482567, 0, 1, 0.02745098, 1,
-0.4722888, -1.889972, -1.579457, 0, 1, 0.03529412, 1,
-0.4701354, -0.2923408, -2.836532, 0, 1, 0.03921569, 1,
-0.4698022, 0.594457, -2.48919, 0, 1, 0.04705882, 1,
-0.4682966, 0.4775603, -1.163317, 0, 1, 0.05098039, 1,
-0.4675316, -0.1969171, -1.169839, 0, 1, 0.05882353, 1,
-0.4668091, 0.1836668, -0.3691169, 0, 1, 0.0627451, 1,
-0.4640147, 0.4151298, -1.326826, 0, 1, 0.07058824, 1,
-0.4583392, -0.951548, -2.76026, 0, 1, 0.07450981, 1,
-0.4580927, -0.08614685, -1.161507, 0, 1, 0.08235294, 1,
-0.4580824, -1.817096, -2.975615, 0, 1, 0.08627451, 1,
-0.4580131, 0.638935, 0.3533349, 0, 1, 0.09411765, 1,
-0.4569804, 1.154728, 1.187277, 0, 1, 0.1019608, 1,
-0.4543102, 1.402407, -0.2098573, 0, 1, 0.1058824, 1,
-0.4526926, -0.03912895, -2.838799, 0, 1, 0.1137255, 1,
-0.4503928, -0.563928, -3.555739, 0, 1, 0.1176471, 1,
-0.4428354, -0.8905497, -2.374738, 0, 1, 0.1254902, 1,
-0.4311869, -0.9108425, -2.729772, 0, 1, 0.1294118, 1,
-0.4310766, -0.4790324, -3.367564, 0, 1, 0.1372549, 1,
-0.4296851, -1.387978, -4.76391, 0, 1, 0.1411765, 1,
-0.4288143, 0.9175404, -0.4300269, 0, 1, 0.1490196, 1,
-0.4259668, 0.9888544, -2.194101, 0, 1, 0.1529412, 1,
-0.4251934, 0.5036428, -0.7600317, 0, 1, 0.1607843, 1,
-0.4234328, 0.2175103, -0.1470132, 0, 1, 0.1647059, 1,
-0.4228083, -0.9583532, -2.956338, 0, 1, 0.172549, 1,
-0.4187449, -1.954805, -3.227626, 0, 1, 0.1764706, 1,
-0.418689, 1.179428, 0.794342, 0, 1, 0.1843137, 1,
-0.4175214, 0.7222447, 0.623067, 0, 1, 0.1882353, 1,
-0.4173651, 0.3818963, -0.6515437, 0, 1, 0.1960784, 1,
-0.4132992, -0.530679, -2.607922, 0, 1, 0.2039216, 1,
-0.408321, 1.866647, -0.7740626, 0, 1, 0.2078431, 1,
-0.40547, 1.352022, 1.748232, 0, 1, 0.2156863, 1,
-0.4041528, 0.1638801, -2.027257, 0, 1, 0.2196078, 1,
-0.4035324, 1.039472, -0.7437926, 0, 1, 0.227451, 1,
-0.4017209, -0.635527, -0.6663036, 0, 1, 0.2313726, 1,
-0.3950348, 1.042909, -1.222472, 0, 1, 0.2392157, 1,
-0.3922032, 2.683663, -0.6711907, 0, 1, 0.2431373, 1,
-0.3907817, 1.676645, 0.1852366, 0, 1, 0.2509804, 1,
-0.3896408, -0.352311, -1.525095, 0, 1, 0.254902, 1,
-0.3874889, -1.373654, -1.42142, 0, 1, 0.2627451, 1,
-0.3855886, -0.2397575, -1.903921, 0, 1, 0.2666667, 1,
-0.3849622, 1.129752, -0.1968273, 0, 1, 0.2745098, 1,
-0.3773226, 0.2569251, -1.497941, 0, 1, 0.2784314, 1,
-0.3710165, -0.02510634, -0.4530126, 0, 1, 0.2862745, 1,
-0.3709969, -1.296109, -3.807803, 0, 1, 0.2901961, 1,
-0.3699319, 0.7877561, -0.1200427, 0, 1, 0.2980392, 1,
-0.3685423, -0.5871671, -3.081981, 0, 1, 0.3058824, 1,
-0.366549, 1.897429, 0.5446064, 0, 1, 0.3098039, 1,
-0.3591844, -0.4183802, -2.884979, 0, 1, 0.3176471, 1,
-0.3566093, -0.2466556, -1.426456, 0, 1, 0.3215686, 1,
-0.3536143, 0.1140697, -1.26631, 0, 1, 0.3294118, 1,
-0.3524252, -0.3123426, -2.659541, 0, 1, 0.3333333, 1,
-0.3515419, -0.2273782, -1.762351, 0, 1, 0.3411765, 1,
-0.3465247, 0.003221277, -1.642239, 0, 1, 0.345098, 1,
-0.3443189, -2.251386, -0.04262663, 0, 1, 0.3529412, 1,
-0.3432999, -0.5910347, -0.6799295, 0, 1, 0.3568628, 1,
-0.3411031, 0.456035, -0.4246113, 0, 1, 0.3647059, 1,
-0.3367704, -0.4094996, -1.79463, 0, 1, 0.3686275, 1,
-0.3365321, -2.411409, -3.709591, 0, 1, 0.3764706, 1,
-0.3342665, 1.675969, -0.1590156, 0, 1, 0.3803922, 1,
-0.3295068, 0.747228, 0.06149018, 0, 1, 0.3882353, 1,
-0.3215735, -0.9709253, -2.484511, 0, 1, 0.3921569, 1,
-0.3196256, -0.5870833, -4.373291, 0, 1, 0.4, 1,
-0.3138338, -0.02970184, -2.416297, 0, 1, 0.4078431, 1,
-0.3136332, 0.9068044, -1.4783, 0, 1, 0.4117647, 1,
-0.3011479, -0.4796217, -2.212725, 0, 1, 0.4196078, 1,
-0.300788, -0.9838175, -3.158719, 0, 1, 0.4235294, 1,
-0.2961288, 0.2681646, -0.03225626, 0, 1, 0.4313726, 1,
-0.2951006, -1.204617, -1.78607, 0, 1, 0.4352941, 1,
-0.2897312, -0.6860124, -3.544897, 0, 1, 0.4431373, 1,
-0.2890775, 1.38387, -1.016713, 0, 1, 0.4470588, 1,
-0.2885341, 0.7848389, -0.1350709, 0, 1, 0.454902, 1,
-0.2881272, -1.05196, -2.038301, 0, 1, 0.4588235, 1,
-0.286227, 0.5409372, -0.9599381, 0, 1, 0.4666667, 1,
-0.2830008, 1.268267, -1.59251, 0, 1, 0.4705882, 1,
-0.2827608, 0.3053745, -0.5375288, 0, 1, 0.4784314, 1,
-0.2799368, 0.8123733, 0.7465965, 0, 1, 0.4823529, 1,
-0.2762375, 0.7096496, -0.7989297, 0, 1, 0.4901961, 1,
-0.2762167, 0.6660378, -1.072462, 0, 1, 0.4941176, 1,
-0.2724861, 0.746812, -0.5003916, 0, 1, 0.5019608, 1,
-0.2703755, 0.661713, -1.9816, 0, 1, 0.509804, 1,
-0.2682518, 1.108593, -2.157725, 0, 1, 0.5137255, 1,
-0.2650348, -0.2880442, -1.782879, 0, 1, 0.5215687, 1,
-0.2573511, -0.6295958, -3.246269, 0, 1, 0.5254902, 1,
-0.2544611, -0.8093558, -1.797809, 0, 1, 0.5333334, 1,
-0.2528878, -0.9995998, -3.751829, 0, 1, 0.5372549, 1,
-0.2526156, 1.202203, -2.301335, 0, 1, 0.5450981, 1,
-0.2503561, 1.29813, 0.4580931, 0, 1, 0.5490196, 1,
-0.245254, 0.8660622, 0.01500839, 0, 1, 0.5568628, 1,
-0.2434458, 1.11235, -0.8882092, 0, 1, 0.5607843, 1,
-0.2432338, 0.7834484, 0.181651, 0, 1, 0.5686275, 1,
-0.2431451, 0.4879833, -0.4302211, 0, 1, 0.572549, 1,
-0.2413852, -0.6383082, -2.983407, 0, 1, 0.5803922, 1,
-0.2406736, 0.6108348, -0.8393359, 0, 1, 0.5843138, 1,
-0.2397569, 0.4470922, -1.002707, 0, 1, 0.5921569, 1,
-0.2354234, -0.2945736, -1.699965, 0, 1, 0.5960785, 1,
-0.2314682, 0.3215187, -0.9694171, 0, 1, 0.6039216, 1,
-0.2310245, 1.787142, -1.655442, 0, 1, 0.6117647, 1,
-0.2309444, 0.3697291, -1.217889, 0, 1, 0.6156863, 1,
-0.2277097, 0.2437956, -1.95111, 0, 1, 0.6235294, 1,
-0.2250727, -0.06322053, -1.679246, 0, 1, 0.627451, 1,
-0.2250693, -0.3905801, -5.291102, 0, 1, 0.6352941, 1,
-0.222369, 1.55571, -2.583363, 0, 1, 0.6392157, 1,
-0.221709, 0.2736442, 1.912077, 0, 1, 0.6470588, 1,
-0.2207938, -1.703384, -3.370222, 0, 1, 0.6509804, 1,
-0.2195033, -0.101872, -1.009494, 0, 1, 0.6588235, 1,
-0.2128238, -0.2117295, -1.701657, 0, 1, 0.6627451, 1,
-0.2075001, -1.777496, -4.078282, 0, 1, 0.6705883, 1,
-0.2059186, -0.3643714, -1.525413, 0, 1, 0.6745098, 1,
-0.2042923, 0.4112341, -0.1874871, 0, 1, 0.682353, 1,
-0.203531, -0.7537301, -3.633255, 0, 1, 0.6862745, 1,
-0.2033972, -0.6595816, -2.354488, 0, 1, 0.6941177, 1,
-0.200985, 1.447563, -0.6380077, 0, 1, 0.7019608, 1,
-0.1997501, -0.307847, -3.429179, 0, 1, 0.7058824, 1,
-0.1967764, 1.614638, 0.413167, 0, 1, 0.7137255, 1,
-0.1964392, 1.867495, 0.3739248, 0, 1, 0.7176471, 1,
-0.1959202, 1.1874, 1.284457, 0, 1, 0.7254902, 1,
-0.1922488, 0.8351327, -0.3171996, 0, 1, 0.7294118, 1,
-0.1903324, 1.234933, 0.5755972, 0, 1, 0.7372549, 1,
-0.1861944, -0.04723947, -1.418758, 0, 1, 0.7411765, 1,
-0.1831444, 1.852967, 0.4456096, 0, 1, 0.7490196, 1,
-0.1810604, -1.02575, -4.777027, 0, 1, 0.7529412, 1,
-0.1794418, -0.771422, -1.668036, 0, 1, 0.7607843, 1,
-0.1793965, 0.8284165, -0.3833793, 0, 1, 0.7647059, 1,
-0.1743255, -1.428532, -4.696437, 0, 1, 0.772549, 1,
-0.1714557, -0.7404048, -3.041964, 0, 1, 0.7764706, 1,
-0.1585064, -1.241709, -0.4968392, 0, 1, 0.7843137, 1,
-0.1579606, -0.6317849, -4.616428, 0, 1, 0.7882353, 1,
-0.1576102, 0.01583257, -3.840428, 0, 1, 0.7960784, 1,
-0.1512682, -0.2746091, -3.121636, 0, 1, 0.8039216, 1,
-0.1512074, -0.9400889, -2.971234, 0, 1, 0.8078431, 1,
-0.1505966, -0.4819726, -2.80656, 0, 1, 0.8156863, 1,
-0.1497774, 1.056333, -1.961892, 0, 1, 0.8196079, 1,
-0.1471679, -2.123029, -2.875512, 0, 1, 0.827451, 1,
-0.1466868, -0.7183564, -1.90681, 0, 1, 0.8313726, 1,
-0.1458735, 0.09838975, -0.7828549, 0, 1, 0.8392157, 1,
-0.145186, -0.1967511, -3.629796, 0, 1, 0.8431373, 1,
-0.1426977, -0.4603849, -3.077626, 0, 1, 0.8509804, 1,
-0.1364541, 0.3500254, -0.7462988, 0, 1, 0.854902, 1,
-0.1341785, -0.7257241, -2.364836, 0, 1, 0.8627451, 1,
-0.1317587, 0.03842377, -3.084257, 0, 1, 0.8666667, 1,
-0.1314152, 0.7175225, -0.4190798, 0, 1, 0.8745098, 1,
-0.1280934, 0.7897141, -0.7085581, 0, 1, 0.8784314, 1,
-0.1277118, -1.382108, -2.055701, 0, 1, 0.8862745, 1,
-0.12452, 0.7461429, 0.6017076, 0, 1, 0.8901961, 1,
-0.1233957, -2.274248, -4.68266, 0, 1, 0.8980392, 1,
-0.1228533, 0.5917569, 1.52755, 0, 1, 0.9058824, 1,
-0.1207406, -0.20354, -4.090302, 0, 1, 0.9098039, 1,
-0.1194915, 0.5777029, 0.6421147, 0, 1, 0.9176471, 1,
-0.1155532, 1.012864, 0.4087051, 0, 1, 0.9215686, 1,
-0.1139003, -0.4306747, -1.216213, 0, 1, 0.9294118, 1,
-0.1137375, 1.017435, -1.373325, 0, 1, 0.9333333, 1,
-0.112777, 0.8574274, -0.2530777, 0, 1, 0.9411765, 1,
-0.1112778, 1.793947, -0.6664739, 0, 1, 0.945098, 1,
-0.1084853, -1.679582, -1.489907, 0, 1, 0.9529412, 1,
-0.1009064, 0.3567245, -0.376305, 0, 1, 0.9568627, 1,
-0.1008282, 0.9297498, 0.1146922, 0, 1, 0.9647059, 1,
-0.1007617, 0.3855065, -0.257426, 0, 1, 0.9686275, 1,
-0.09885661, 0.2445249, 0.7154281, 0, 1, 0.9764706, 1,
-0.09703764, -0.005551491, -1.048393, 0, 1, 0.9803922, 1,
-0.09349291, -0.1654615, -2.552585, 0, 1, 0.9882353, 1,
-0.09130052, 0.5680514, -0.2151124, 0, 1, 0.9921569, 1,
-0.08730322, 0.2465238, 0.9182074, 0, 1, 1, 1,
-0.08520761, -1.334874, -2.415668, 0, 0.9921569, 1, 1,
-0.08097171, -1.370836, -3.827845, 0, 0.9882353, 1, 1,
-0.07517081, 0.9476312, 0.4343316, 0, 0.9803922, 1, 1,
-0.0744136, 0.3478774, 0.5626393, 0, 0.9764706, 1, 1,
-0.07187088, -1.54054, -3.927024, 0, 0.9686275, 1, 1,
-0.06999151, 1.375038, -0.6334753, 0, 0.9647059, 1, 1,
-0.06973262, -0.3030225, -3.928687, 0, 0.9568627, 1, 1,
-0.06551083, 0.3419482, -0.9797343, 0, 0.9529412, 1, 1,
-0.06528857, -0.1181325, -2.964973, 0, 0.945098, 1, 1,
-0.06460299, 1.393387, -2.484165, 0, 0.9411765, 1, 1,
-0.06203898, 0.009722934, -0.9691864, 0, 0.9333333, 1, 1,
-0.0523853, -0.3848978, -4.257779, 0, 0.9294118, 1, 1,
-0.05167095, -0.2597333, -3.686641, 0, 0.9215686, 1, 1,
-0.05039234, -0.7216097, -2.989422, 0, 0.9176471, 1, 1,
-0.0464278, -0.6295444, -2.644141, 0, 0.9098039, 1, 1,
-0.0458259, 0.7308057, 0.3487918, 0, 0.9058824, 1, 1,
-0.04012985, -0.2258906, -3.883238, 0, 0.8980392, 1, 1,
-0.03844816, 1.658088, -0.0128224, 0, 0.8901961, 1, 1,
-0.03575594, -0.9218522, -4.777784, 0, 0.8862745, 1, 1,
-0.03488934, 0.8745395, -2.11383, 0, 0.8784314, 1, 1,
-0.03323843, 0.6911141, 1.756599, 0, 0.8745098, 1, 1,
-0.03251965, 0.09971208, -1.105341, 0, 0.8666667, 1, 1,
-0.02771566, -0.4104061, -3.140861, 0, 0.8627451, 1, 1,
-0.02103326, 1.60124, -0.2715669, 0, 0.854902, 1, 1,
-0.01523448, -0.138261, -2.23523, 0, 0.8509804, 1, 1,
-0.01270453, 0.7034835, 1.032016, 0, 0.8431373, 1, 1,
-0.001951517, -0.3563128, -2.426227, 0, 0.8392157, 1, 1,
-0.000704886, 0.3566701, 0.5330101, 0, 0.8313726, 1, 1,
0.001951398, 2.388959, -0.01486852, 0, 0.827451, 1, 1,
0.004040847, 0.7468087, -0.2326114, 0, 0.8196079, 1, 1,
0.004334497, -0.4661627, 3.78978, 0, 0.8156863, 1, 1,
0.00794574, 0.6561664, 0.3848426, 0, 0.8078431, 1, 1,
0.008184156, 0.6385615, 0.4337353, 0, 0.8039216, 1, 1,
0.01001948, 0.1366281, -0.5640268, 0, 0.7960784, 1, 1,
0.01007525, 1.280415, 1.710088, 0, 0.7882353, 1, 1,
0.01265456, -0.07362298, 2.364868, 0, 0.7843137, 1, 1,
0.01673169, -0.8725227, 2.311588, 0, 0.7764706, 1, 1,
0.02012814, -1.388207, 2.599157, 0, 0.772549, 1, 1,
0.02161646, 1.479849, 0.4568211, 0, 0.7647059, 1, 1,
0.02447991, 1.862912, 0.5997353, 0, 0.7607843, 1, 1,
0.0313357, 1.267904, -0.4818991, 0, 0.7529412, 1, 1,
0.03318149, 0.1573657, 1.560222, 0, 0.7490196, 1, 1,
0.03375645, -1.168391, 2.216616, 0, 0.7411765, 1, 1,
0.03638836, 0.1729863, -0.61616, 0, 0.7372549, 1, 1,
0.04105985, 0.4791539, -0.3283898, 0, 0.7294118, 1, 1,
0.04131585, -0.5869078, 1.899549, 0, 0.7254902, 1, 1,
0.04235609, -0.6720651, 4.581605, 0, 0.7176471, 1, 1,
0.04363548, -0.865923, 3.238114, 0, 0.7137255, 1, 1,
0.04537389, -0.4424115, 4.013342, 0, 0.7058824, 1, 1,
0.05130512, -0.6122871, 2.459815, 0, 0.6980392, 1, 1,
0.05433485, 1.125078, 0.8090783, 0, 0.6941177, 1, 1,
0.05438925, -0.2737014, 4.541729, 0, 0.6862745, 1, 1,
0.05967189, -0.4744562, 2.597707, 0, 0.682353, 1, 1,
0.0648417, -0.6039116, 2.529771, 0, 0.6745098, 1, 1,
0.06504735, -0.9221187, 2.25714, 0, 0.6705883, 1, 1,
0.06878716, 2.655555, -1.554133, 0, 0.6627451, 1, 1,
0.06949996, -0.08587708, 3.867414, 0, 0.6588235, 1, 1,
0.07168286, -0.3445518, 4.476964, 0, 0.6509804, 1, 1,
0.0739581, -0.5429305, 1.301998, 0, 0.6470588, 1, 1,
0.07717273, 1.250358, 0.1380094, 0, 0.6392157, 1, 1,
0.07756785, -1.191653, 3.158886, 0, 0.6352941, 1, 1,
0.08687887, -0.03173503, 2.374865, 0, 0.627451, 1, 1,
0.09255739, -0.2073542, 2.903179, 0, 0.6235294, 1, 1,
0.09481119, -0.2659505, 3.468117, 0, 0.6156863, 1, 1,
0.09518167, 1.363735, 0.1063437, 0, 0.6117647, 1, 1,
0.09571272, -0.3188247, 1.999225, 0, 0.6039216, 1, 1,
0.09880218, -0.9346011, 1.814821, 0, 0.5960785, 1, 1,
0.1002818, -0.9877097, 2.848703, 0, 0.5921569, 1, 1,
0.1061362, -0.1761545, 2.916415, 0, 0.5843138, 1, 1,
0.109949, -0.2524199, 1.932798, 0, 0.5803922, 1, 1,
0.1155315, 0.6339099, -0.5841557, 0, 0.572549, 1, 1,
0.1182824, 0.2006138, -0.159206, 0, 0.5686275, 1, 1,
0.1193708, 1.213676, -0.06573234, 0, 0.5607843, 1, 1,
0.1229928, -0.3510742, 4.153804, 0, 0.5568628, 1, 1,
0.1255144, 0.01349695, 1.861718, 0, 0.5490196, 1, 1,
0.125737, 0.4034603, -0.7878218, 0, 0.5450981, 1, 1,
0.1322226, -1.359542, 2.391857, 0, 0.5372549, 1, 1,
0.13389, -0.3747429, 3.774723, 0, 0.5333334, 1, 1,
0.1363141, 0.6721941, 0.669363, 0, 0.5254902, 1, 1,
0.1384405, -0.6355909, 5.243152, 0, 0.5215687, 1, 1,
0.1404876, -0.2267296, 1.634843, 0, 0.5137255, 1, 1,
0.1422353, 0.2291449, -0.526465, 0, 0.509804, 1, 1,
0.1431216, 0.9844876, 0.5773746, 0, 0.5019608, 1, 1,
0.1460518, 1.135134, 0.8830824, 0, 0.4941176, 1, 1,
0.1542566, -1.159774, 4.324284, 0, 0.4901961, 1, 1,
0.1666382, 0.2478194, -0.1995798, 0, 0.4823529, 1, 1,
0.1737331, 0.189209, 0.6454603, 0, 0.4784314, 1, 1,
0.1769669, -0.1678113, 0.9413788, 0, 0.4705882, 1, 1,
0.1791904, -0.3637352, 3.250645, 0, 0.4666667, 1, 1,
0.1902343, 0.6216415, 1.383973, 0, 0.4588235, 1, 1,
0.2060963, -0.3018961, 1.565975, 0, 0.454902, 1, 1,
0.2065681, 0.5691415, 1.235374, 0, 0.4470588, 1, 1,
0.2073898, -1.072367, 4.659209, 0, 0.4431373, 1, 1,
0.2097833, 0.0524192, 2.64457, 0, 0.4352941, 1, 1,
0.2112143, -1.883067, 2.150974, 0, 0.4313726, 1, 1,
0.2133421, 0.4437209, -1.544907, 0, 0.4235294, 1, 1,
0.2162237, 0.3664049, -0.4104897, 0, 0.4196078, 1, 1,
0.2184701, -1.225358, 3.318389, 0, 0.4117647, 1, 1,
0.2189882, -1.001266, 1.027667, 0, 0.4078431, 1, 1,
0.2246865, 0.7530667, 0.4409946, 0, 0.4, 1, 1,
0.2267891, -0.1217297, 3.141211, 0, 0.3921569, 1, 1,
0.2283928, -0.7558097, 3.306594, 0, 0.3882353, 1, 1,
0.2329883, -0.2829734, 1.627102, 0, 0.3803922, 1, 1,
0.2340435, 0.554467, -0.1552829, 0, 0.3764706, 1, 1,
0.2345715, 0.2830258, -0.9330498, 0, 0.3686275, 1, 1,
0.2359961, -2.609174, 2.487675, 0, 0.3647059, 1, 1,
0.2383504, -0.4957135, 0.02689827, 0, 0.3568628, 1, 1,
0.2431863, -0.4422719, 2.65168, 0, 0.3529412, 1, 1,
0.2472012, 1.095628, -0.1777236, 0, 0.345098, 1, 1,
0.2498786, 1.403071, -1.864719, 0, 0.3411765, 1, 1,
0.2557938, -0.9158286, 1.922786, 0, 0.3333333, 1, 1,
0.2589627, 0.02700938, 0.4172818, 0, 0.3294118, 1, 1,
0.2597503, -0.1512489, 2.753611, 0, 0.3215686, 1, 1,
0.260518, 0.6870425, 1.236137, 0, 0.3176471, 1, 1,
0.2626432, 1.78258, 0.6876776, 0, 0.3098039, 1, 1,
0.2660167, 0.09026886, 3.590437, 0, 0.3058824, 1, 1,
0.2711535, 0.2952178, 0.2250349, 0, 0.2980392, 1, 1,
0.2734211, 0.1733818, 1.504864, 0, 0.2901961, 1, 1,
0.2797701, -1.539328, 1.454377, 0, 0.2862745, 1, 1,
0.2815956, 0.3730258, -0.7877385, 0, 0.2784314, 1, 1,
0.2836281, -0.616508, 0.2916336, 0, 0.2745098, 1, 1,
0.288583, 1.069332, -0.6247903, 0, 0.2666667, 1, 1,
0.2936188, -1.898244, 3.082165, 0, 0.2627451, 1, 1,
0.2998446, -0.2096814, 2.814499, 0, 0.254902, 1, 1,
0.3121947, 0.9746619, -0.6525137, 0, 0.2509804, 1, 1,
0.3138055, -0.5040646, 4.786251, 0, 0.2431373, 1, 1,
0.3183251, 0.0410895, 1.2313, 0, 0.2392157, 1, 1,
0.3222673, -0.1413999, 1.144439, 0, 0.2313726, 1, 1,
0.3331741, -0.4251183, 3.117835, 0, 0.227451, 1, 1,
0.3371736, -0.8631279, 3.764708, 0, 0.2196078, 1, 1,
0.3403316, -1.829513, 2.253475, 0, 0.2156863, 1, 1,
0.3423431, 1.926079, -2.41708, 0, 0.2078431, 1, 1,
0.3456756, 0.7683976, -0.4004796, 0, 0.2039216, 1, 1,
0.3502997, -1.673234, 2.523474, 0, 0.1960784, 1, 1,
0.352114, -1.107566, 3.337687, 0, 0.1882353, 1, 1,
0.3541304, 1.424218, -1.681513, 0, 0.1843137, 1, 1,
0.3545992, 1.287357, 1.228745, 0, 0.1764706, 1, 1,
0.3550156, 0.5179048, 1.526693, 0, 0.172549, 1, 1,
0.3579439, -1.203302, 3.034574, 0, 0.1647059, 1, 1,
0.3596843, 0.7694148, -1.600933, 0, 0.1607843, 1, 1,
0.3599804, -0.4011469, 2.380843, 0, 0.1529412, 1, 1,
0.3648081, -2.369442, 2.747535, 0, 0.1490196, 1, 1,
0.3683167, 0.8044883, 2.778503, 0, 0.1411765, 1, 1,
0.3709927, -0.06714172, 0.7811095, 0, 0.1372549, 1, 1,
0.3731694, -0.3256615, 2.22799, 0, 0.1294118, 1, 1,
0.3753144, 0.8571473, -1.430236, 0, 0.1254902, 1, 1,
0.3759641, -0.8328148, 1.600142, 0, 0.1176471, 1, 1,
0.3788592, -0.4537489, 2.715789, 0, 0.1137255, 1, 1,
0.3790826, 0.7090713, 0.7970895, 0, 0.1058824, 1, 1,
0.3791565, 0.08148962, 0.2980776, 0, 0.09803922, 1, 1,
0.3835621, 0.3110251, 3.555798, 0, 0.09411765, 1, 1,
0.3841524, 0.3613271, 1.09593, 0, 0.08627451, 1, 1,
0.3860916, -1.143799, 2.768305, 0, 0.08235294, 1, 1,
0.3905397, 0.1517978, 0.07663842, 0, 0.07450981, 1, 1,
0.3906244, -0.3380975, 1.750219, 0, 0.07058824, 1, 1,
0.391132, -1.607064, 1.830068, 0, 0.0627451, 1, 1,
0.3911527, -0.6597275, 2.215697, 0, 0.05882353, 1, 1,
0.3916294, -0.6384954, 2.39672, 0, 0.05098039, 1, 1,
0.3924672, -0.2552007, 4.045405, 0, 0.04705882, 1, 1,
0.396468, -1.287852, 3.474789, 0, 0.03921569, 1, 1,
0.3977474, -0.3162709, 2.898469, 0, 0.03529412, 1, 1,
0.3985732, 0.3885682, 0.6057076, 0, 0.02745098, 1, 1,
0.3998366, -0.7021238, 1.924655, 0, 0.02352941, 1, 1,
0.4040378, 1.137397, -1.540398, 0, 0.01568628, 1, 1,
0.4083412, 0.3671269, 0.09198786, 0, 0.01176471, 1, 1,
0.4120581, 0.4997451, -0.4446171, 0, 0.003921569, 1, 1,
0.412405, 0.02752817, 1.736892, 0.003921569, 0, 1, 1,
0.4138849, -0.1263995, 1.646564, 0.007843138, 0, 1, 1,
0.4195419, -1.944205, 3.745588, 0.01568628, 0, 1, 1,
0.4202887, 0.3970621, -0.07702313, 0.01960784, 0, 1, 1,
0.4325851, 1.117414, 1.110411, 0.02745098, 0, 1, 1,
0.4355738, 2.19493, -1.314956, 0.03137255, 0, 1, 1,
0.4359602, 0.1207205, 0.3763582, 0.03921569, 0, 1, 1,
0.4365965, 0.2982233, 0.9017662, 0.04313726, 0, 1, 1,
0.4380094, -1.833985, 3.073954, 0.05098039, 0, 1, 1,
0.4389831, 1.28181, 0.620841, 0.05490196, 0, 1, 1,
0.4393167, 0.2985368, 2.426857, 0.0627451, 0, 1, 1,
0.4433823, -1.386591, 2.317404, 0.06666667, 0, 1, 1,
0.4442558, -0.732722, 2.028457, 0.07450981, 0, 1, 1,
0.4491439, 0.03168504, 0.7639205, 0.07843138, 0, 1, 1,
0.4502407, 0.4077122, -0.9133197, 0.08627451, 0, 1, 1,
0.4539436, -0.7434009, 4.028893, 0.09019608, 0, 1, 1,
0.4564442, -1.256938, 2.968288, 0.09803922, 0, 1, 1,
0.4580913, 1.590661, 1.426048, 0.1058824, 0, 1, 1,
0.4591116, 0.9777164, 1.457965, 0.1098039, 0, 1, 1,
0.4669747, -1.015643, 2.743967, 0.1176471, 0, 1, 1,
0.4680069, -1.037014, 2.422212, 0.1215686, 0, 1, 1,
0.4736846, -1.059144, 2.689446, 0.1294118, 0, 1, 1,
0.4739447, 0.3913217, -0.225508, 0.1333333, 0, 1, 1,
0.4753214, 1.01584, 0.055042, 0.1411765, 0, 1, 1,
0.4757268, 0.3760203, -0.2883017, 0.145098, 0, 1, 1,
0.4784856, -0.8311128, 2.591127, 0.1529412, 0, 1, 1,
0.4863257, -0.1392333, 0.3911158, 0.1568628, 0, 1, 1,
0.4924729, 0.2740148, 1.266075, 0.1647059, 0, 1, 1,
0.5035267, -1.977779, 2.804052, 0.1686275, 0, 1, 1,
0.51108, 1.224882, -0.1302987, 0.1764706, 0, 1, 1,
0.5164178, -0.06863868, 3.816795, 0.1803922, 0, 1, 1,
0.5265737, 0.2383682, 0.2981418, 0.1882353, 0, 1, 1,
0.5272807, -0.09060562, 0.5042004, 0.1921569, 0, 1, 1,
0.529853, 0.1333396, 0.3204106, 0.2, 0, 1, 1,
0.5321175, 0.9347261, 1.009153, 0.2078431, 0, 1, 1,
0.5353745, -0.4823177, 3.285838, 0.2117647, 0, 1, 1,
0.5396143, 1.249336, 1.781229, 0.2196078, 0, 1, 1,
0.5440698, -0.8075558, 3.555645, 0.2235294, 0, 1, 1,
0.5463982, 0.7904, -1.40488, 0.2313726, 0, 1, 1,
0.5565484, 0.933665, -1.124329, 0.2352941, 0, 1, 1,
0.5610192, -0.7369992, 2.523377, 0.2431373, 0, 1, 1,
0.5610378, -2.407811, 5.923488, 0.2470588, 0, 1, 1,
0.5612233, 0.3383218, -1.168572, 0.254902, 0, 1, 1,
0.5656148, 0.151538, 1.485632, 0.2588235, 0, 1, 1,
0.5675735, -0.253769, 1.52298, 0.2666667, 0, 1, 1,
0.5696283, 1.410651, 0.6920747, 0.2705882, 0, 1, 1,
0.5724234, -1.020856, 2.982504, 0.2784314, 0, 1, 1,
0.5772573, 1.007163, 1.39234, 0.282353, 0, 1, 1,
0.5800967, -0.1839781, 0.6371531, 0.2901961, 0, 1, 1,
0.5805697, 1.332772, 0.1660591, 0.2941177, 0, 1, 1,
0.5856538, 0.8196019, 0.5181088, 0.3019608, 0, 1, 1,
0.585704, -0.4652539, 1.501518, 0.3098039, 0, 1, 1,
0.5895299, -0.3980071, 3.402246, 0.3137255, 0, 1, 1,
0.592265, 0.1979248, -0.9148947, 0.3215686, 0, 1, 1,
0.5924991, -0.8964606, 2.680686, 0.3254902, 0, 1, 1,
0.5940411, 1.585573, 0.1225029, 0.3333333, 0, 1, 1,
0.5969445, 0.09815355, 1.122004, 0.3372549, 0, 1, 1,
0.5981351, 1.524992, 0.872397, 0.345098, 0, 1, 1,
0.6061112, 1.330184, -0.09340054, 0.3490196, 0, 1, 1,
0.6065934, 0.04720935, 0.9489128, 0.3568628, 0, 1, 1,
0.6088094, 0.2009145, -0.1543708, 0.3607843, 0, 1, 1,
0.6142979, 0.548366, 2.46326, 0.3686275, 0, 1, 1,
0.6151673, -1.9938, 2.893611, 0.372549, 0, 1, 1,
0.6152827, 1.30963, 1.192493, 0.3803922, 0, 1, 1,
0.617601, 1.012995, 1.170368, 0.3843137, 0, 1, 1,
0.6203759, -0.08204491, 2.789459, 0.3921569, 0, 1, 1,
0.6241677, 1.53472, 1.098635, 0.3960784, 0, 1, 1,
0.6253882, -0.7385353, 0.6761217, 0.4039216, 0, 1, 1,
0.6315528, 0.8113638, 0.2857129, 0.4117647, 0, 1, 1,
0.6336917, -0.7607092, 2.559266, 0.4156863, 0, 1, 1,
0.6379327, -1.502683, 0.2286331, 0.4235294, 0, 1, 1,
0.6411489, 0.468143, 1.291925, 0.427451, 0, 1, 1,
0.6425531, 0.09199434, 0.8961072, 0.4352941, 0, 1, 1,
0.6437624, 0.9242712, 0.6131383, 0.4392157, 0, 1, 1,
0.644597, -0.2487836, 1.434257, 0.4470588, 0, 1, 1,
0.6460052, 0.7985461, 0.3383029, 0.4509804, 0, 1, 1,
0.6501444, -0.4348988, -0.000727516, 0.4588235, 0, 1, 1,
0.6535859, -0.7227412, 1.152334, 0.4627451, 0, 1, 1,
0.6542532, 1.212741, 0.760213, 0.4705882, 0, 1, 1,
0.6570271, 1.513984, -0.2207721, 0.4745098, 0, 1, 1,
0.6577012, -0.006021032, 2.312512, 0.4823529, 0, 1, 1,
0.6587548, 0.9669931, -0.3057441, 0.4862745, 0, 1, 1,
0.6597193, 1.20471, 1.78751, 0.4941176, 0, 1, 1,
0.6602476, 0.3413381, 1.48563, 0.5019608, 0, 1, 1,
0.6627805, -0.1759894, 4.474325, 0.5058824, 0, 1, 1,
0.6651044, 1.71642, -0.1577198, 0.5137255, 0, 1, 1,
0.6717609, 0.02496278, 2.597121, 0.5176471, 0, 1, 1,
0.675428, -2.268538, 1.514425, 0.5254902, 0, 1, 1,
0.6775384, -1.814515, 3.790916, 0.5294118, 0, 1, 1,
0.6838217, 1.166649, 0.9531747, 0.5372549, 0, 1, 1,
0.6859682, -0.4924367, 3.070945, 0.5411765, 0, 1, 1,
0.6860976, -0.2618932, 2.266754, 0.5490196, 0, 1, 1,
0.6906039, 1.79025, 1.287976, 0.5529412, 0, 1, 1,
0.6909615, -0.08126385, 2.749247, 0.5607843, 0, 1, 1,
0.6934561, 0.05124098, 0.8834894, 0.5647059, 0, 1, 1,
0.6949224, 0.1587881, 1.559799, 0.572549, 0, 1, 1,
0.6981567, 1.042557, -0.6848142, 0.5764706, 0, 1, 1,
0.6996041, -0.04971985, 0.8470422, 0.5843138, 0, 1, 1,
0.7021112, 0.9509119, 0.02591449, 0.5882353, 0, 1, 1,
0.7040411, -0.4512405, 0.2595344, 0.5960785, 0, 1, 1,
0.7066519, -0.2439662, 4.943948, 0.6039216, 0, 1, 1,
0.71297, 1.066285, -1.258731, 0.6078432, 0, 1, 1,
0.7133254, -0.1068147, 0.8407168, 0.6156863, 0, 1, 1,
0.7138448, 0.8869179, 0.6505362, 0.6196079, 0, 1, 1,
0.7237898, -0.01110799, 1.370727, 0.627451, 0, 1, 1,
0.7281089, -0.1614973, 2.673801, 0.6313726, 0, 1, 1,
0.7326987, -0.4314913, 3.704901, 0.6392157, 0, 1, 1,
0.7383464, 0.8728544, 1.484115, 0.6431373, 0, 1, 1,
0.7448004, -0.3452798, 3.327697, 0.6509804, 0, 1, 1,
0.7482483, -1.189172, 2.322174, 0.654902, 0, 1, 1,
0.7551653, -1.394269, 3.931495, 0.6627451, 0, 1, 1,
0.75871, 1.056564, -0.3780708, 0.6666667, 0, 1, 1,
0.7592715, 1.064409, 1.632044, 0.6745098, 0, 1, 1,
0.7595873, 0.0645951, 0.6068718, 0.6784314, 0, 1, 1,
0.763571, 0.02102467, 1.18476, 0.6862745, 0, 1, 1,
0.7677881, 0.3967217, 2.535501, 0.6901961, 0, 1, 1,
0.7698756, -0.1859804, 0.8788956, 0.6980392, 0, 1, 1,
0.7740098, 1.534641, 0.7644293, 0.7058824, 0, 1, 1,
0.7742432, -0.3574902, 2.389886, 0.7098039, 0, 1, 1,
0.7832522, -1.556474, 4.173057, 0.7176471, 0, 1, 1,
0.7868223, -0.009048524, 1.861573, 0.7215686, 0, 1, 1,
0.7899798, 1.294808, 0.6161687, 0.7294118, 0, 1, 1,
0.7921496, -0.1469063, 1.913787, 0.7333333, 0, 1, 1,
0.7979099, -2.325851, 3.546257, 0.7411765, 0, 1, 1,
0.803349, 0.2875985, -0.1225645, 0.7450981, 0, 1, 1,
0.8072244, -0.1006981, -0.8531283, 0.7529412, 0, 1, 1,
0.8080858, 0.2664195, 2.082942, 0.7568628, 0, 1, 1,
0.8094243, -0.3629528, 0.4044691, 0.7647059, 0, 1, 1,
0.8140151, -2.510857, 2.650332, 0.7686275, 0, 1, 1,
0.8184564, -0.4460641, 1.587467, 0.7764706, 0, 1, 1,
0.81925, 0.03095571, 2.464227, 0.7803922, 0, 1, 1,
0.820717, 0.7077456, 1.045808, 0.7882353, 0, 1, 1,
0.8215988, -1.037479, 0.8206314, 0.7921569, 0, 1, 1,
0.8236965, -0.8957514, 2.07797, 0.8, 0, 1, 1,
0.8297223, 0.1029728, 2.15161, 0.8078431, 0, 1, 1,
0.8322343, 0.8213957, 1.412999, 0.8117647, 0, 1, 1,
0.8426737, 0.5561269, 1.556433, 0.8196079, 0, 1, 1,
0.8472241, 0.5398341, 1.374269, 0.8235294, 0, 1, 1,
0.8480088, -1.426535, 1.922854, 0.8313726, 0, 1, 1,
0.8627018, 0.03242278, 2.026033, 0.8352941, 0, 1, 1,
0.8758046, 0.2963217, 0.5939469, 0.8431373, 0, 1, 1,
0.8835024, -0.2128481, 2.218887, 0.8470588, 0, 1, 1,
0.8853883, 0.7292025, 0.4887883, 0.854902, 0, 1, 1,
0.8899358, -0.5689463, 3.57051, 0.8588235, 0, 1, 1,
0.8940451, -0.8698855, 1.741064, 0.8666667, 0, 1, 1,
0.8968719, -1.98792, 2.622181, 0.8705882, 0, 1, 1,
0.9054969, 0.9065986, 1.176216, 0.8784314, 0, 1, 1,
0.9063488, 0.1513354, 0.8233687, 0.8823529, 0, 1, 1,
0.9128754, -0.1054765, 0.3604355, 0.8901961, 0, 1, 1,
0.9136221, 0.9538821, 0.2142913, 0.8941177, 0, 1, 1,
0.9170793, -0.7502904, 1.904637, 0.9019608, 0, 1, 1,
0.9202772, -2.158819, 2.721637, 0.9098039, 0, 1, 1,
0.9255151, -1.594089, 2.269229, 0.9137255, 0, 1, 1,
0.9294918, 1.404199, 0.491054, 0.9215686, 0, 1, 1,
0.9403052, 1.451996, 0.1228484, 0.9254902, 0, 1, 1,
0.945316, -0.649823, 2.806271, 0.9333333, 0, 1, 1,
0.9672254, -0.3753597, 2.10466, 0.9372549, 0, 1, 1,
0.9689163, -0.06344862, 0.4769864, 0.945098, 0, 1, 1,
0.9706792, 0.4626979, 1.023935, 0.9490196, 0, 1, 1,
0.9740264, -2.039776, 3.829542, 0.9568627, 0, 1, 1,
0.9758921, -0.05701852, 1.412825, 0.9607843, 0, 1, 1,
0.9789517, -1.204898, 0.6529711, 0.9686275, 0, 1, 1,
0.9801828, -0.1405315, 3.933466, 0.972549, 0, 1, 1,
0.9811479, -0.8969462, 2.018485, 0.9803922, 0, 1, 1,
0.9995809, -0.8996477, 2.09538, 0.9843137, 0, 1, 1,
1.005026, 0.4226657, 0.09361374, 0.9921569, 0, 1, 1,
1.009248, 0.711931, 2.106224, 0.9960784, 0, 1, 1,
1.010294, 0.419049, 2.104485, 1, 0, 0.9960784, 1,
1.013281, -0.6162534, 4.127786, 1, 0, 0.9882353, 1,
1.021201, -1.055427, 1.815671, 1, 0, 0.9843137, 1,
1.028518, -1.364194, 3.274479, 1, 0, 0.9764706, 1,
1.02863, 0.02330281, 2.491052, 1, 0, 0.972549, 1,
1.030291, 0.3705477, 0.8237329, 1, 0, 0.9647059, 1,
1.031194, -1.11439, 1.320822, 1, 0, 0.9607843, 1,
1.032039, -0.07493773, 0.8717952, 1, 0, 0.9529412, 1,
1.036563, 1.773827, 0.07557402, 1, 0, 0.9490196, 1,
1.045611, 0.9125417, 2.277514, 1, 0, 0.9411765, 1,
1.04629, -1.127189, 4.274418, 1, 0, 0.9372549, 1,
1.054126, -0.7598021, 2.122991, 1, 0, 0.9294118, 1,
1.05446, 1.595795, -0.2017077, 1, 0, 0.9254902, 1,
1.058309, -0.4232465, 0.567587, 1, 0, 0.9176471, 1,
1.062223, 0.4063211, 0.2836924, 1, 0, 0.9137255, 1,
1.062963, 1.647614, 0.4288561, 1, 0, 0.9058824, 1,
1.069821, -0.4736264, 1.720811, 1, 0, 0.9019608, 1,
1.070627, -0.2055071, 3.50279, 1, 0, 0.8941177, 1,
1.07188, -0.2096159, 2.366249, 1, 0, 0.8862745, 1,
1.072573, -0.1516863, 2.133676, 1, 0, 0.8823529, 1,
1.080838, -0.03611869, 3.247948, 1, 0, 0.8745098, 1,
1.081763, -0.02910636, 0.7244113, 1, 0, 0.8705882, 1,
1.082418, 0.7072577, -0.4326388, 1, 0, 0.8627451, 1,
1.084951, 0.02263922, 1.779144, 1, 0, 0.8588235, 1,
1.087999, -0.9968212, 3.117542, 1, 0, 0.8509804, 1,
1.092673, 0.5025748, 2.796875, 1, 0, 0.8470588, 1,
1.093829, -1.07619, 4.138606, 1, 0, 0.8392157, 1,
1.095201, -1.344601, 1.339231, 1, 0, 0.8352941, 1,
1.097259, 1.413407, 1.983436, 1, 0, 0.827451, 1,
1.098545, -0.1225092, 2.946874, 1, 0, 0.8235294, 1,
1.100062, 0.9788563, 2.040205, 1, 0, 0.8156863, 1,
1.102472, 0.8485279, 0.537046, 1, 0, 0.8117647, 1,
1.106388, 0.06143928, 2.679759, 1, 0, 0.8039216, 1,
1.107486, 1.596584, 1.356098, 1, 0, 0.7960784, 1,
1.108452, -0.529118, 0.3650379, 1, 0, 0.7921569, 1,
1.11238, 0.6935886, 0.4262333, 1, 0, 0.7843137, 1,
1.114448, -0.1329879, 1.14149, 1, 0, 0.7803922, 1,
1.119751, 0.2104308, 1.042213, 1, 0, 0.772549, 1,
1.126699, -1.305646, 1.604572, 1, 0, 0.7686275, 1,
1.130178, -1.082893, 3.658719, 1, 0, 0.7607843, 1,
1.136673, -0.5739374, 2.226059, 1, 0, 0.7568628, 1,
1.148267, -0.1938117, 3.462213, 1, 0, 0.7490196, 1,
1.165403, 0.4290798, 1.882342, 1, 0, 0.7450981, 1,
1.166315, 0.1913506, 1.234892, 1, 0, 0.7372549, 1,
1.170558, -0.292907, 0.9888181, 1, 0, 0.7333333, 1,
1.172925, -0.9666354, 1.421012, 1, 0, 0.7254902, 1,
1.176873, -0.4966539, 2.719471, 1, 0, 0.7215686, 1,
1.180976, 0.627713, 2.249696, 1, 0, 0.7137255, 1,
1.189939, 1.707732, 0.4824173, 1, 0, 0.7098039, 1,
1.19073, -1.242851, 2.080711, 1, 0, 0.7019608, 1,
1.192038, -1.273466, 3.019542, 1, 0, 0.6941177, 1,
1.199216, 1.279552, 3.074627, 1, 0, 0.6901961, 1,
1.20472, -1.450885, 1.781077, 1, 0, 0.682353, 1,
1.207061, 0.1407811, 1.846939, 1, 0, 0.6784314, 1,
1.221873, -1.502665, 3.124179, 1, 0, 0.6705883, 1,
1.224092, 0.5133517, -0.5469677, 1, 0, 0.6666667, 1,
1.231285, 0.7433513, 1.418189, 1, 0, 0.6588235, 1,
1.23195, 0.4323402, 2.26508, 1, 0, 0.654902, 1,
1.242137, -0.05322738, 0.5712248, 1, 0, 0.6470588, 1,
1.249041, 0.0006359557, 1.200972, 1, 0, 0.6431373, 1,
1.255569, 2.096584, 1.817691, 1, 0, 0.6352941, 1,
1.261822, -0.3434087, 2.654223, 1, 0, 0.6313726, 1,
1.265671, -0.08419483, 1.139647, 1, 0, 0.6235294, 1,
1.27094, 1.070815, 0.8390284, 1, 0, 0.6196079, 1,
1.275843, -0.8526716, 2.685847, 1, 0, 0.6117647, 1,
1.297126, -0.4575085, 1.537163, 1, 0, 0.6078432, 1,
1.317668, 0.9579523, 0.5176515, 1, 0, 0.6, 1,
1.328211, 1.060147, 1.821421, 1, 0, 0.5921569, 1,
1.330142, 1.781553, -0.2588556, 1, 0, 0.5882353, 1,
1.341844, 0.4928195, 0.788461, 1, 0, 0.5803922, 1,
1.342453, -0.1864491, -0.3499509, 1, 0, 0.5764706, 1,
1.345837, 0.4059971, 0.9402542, 1, 0, 0.5686275, 1,
1.346301, -2.768158, 2.562695, 1, 0, 0.5647059, 1,
1.346376, -0.9106538, 2.569366, 1, 0, 0.5568628, 1,
1.353339, -1.214914, 3.820534, 1, 0, 0.5529412, 1,
1.358478, 1.509492, 0.1099183, 1, 0, 0.5450981, 1,
1.359476, 0.6903194, 1.896696, 1, 0, 0.5411765, 1,
1.36135, -0.5476934, 2.618332, 1, 0, 0.5333334, 1,
1.364427, -1.33603, 2.935365, 1, 0, 0.5294118, 1,
1.382605, 1.285349, -0.02182827, 1, 0, 0.5215687, 1,
1.394312, 0.7356634, 0.620591, 1, 0, 0.5176471, 1,
1.398848, -0.01121468, 0.4569148, 1, 0, 0.509804, 1,
1.399352, 0.5124332, 1.852135, 1, 0, 0.5058824, 1,
1.407825, 0.5858496, 0.8585159, 1, 0, 0.4980392, 1,
1.408237, 1.865616, 2.514509, 1, 0, 0.4901961, 1,
1.41529, -0.8316106, 2.374168, 1, 0, 0.4862745, 1,
1.415725, 1.041855, 1.121835, 1, 0, 0.4784314, 1,
1.416872, -0.8564163, 2.309714, 1, 0, 0.4745098, 1,
1.423103, 0.4960767, 0.6423793, 1, 0, 0.4666667, 1,
1.433114, 1.600049, 2.561171, 1, 0, 0.4627451, 1,
1.446521, 0.6038162, 0.2320326, 1, 0, 0.454902, 1,
1.451078, -1.136409, 0.2821899, 1, 0, 0.4509804, 1,
1.461778, -0.366179, 1.40625, 1, 0, 0.4431373, 1,
1.475296, -0.8358604, 2.324858, 1, 0, 0.4392157, 1,
1.478923, -0.197416, -0.1657949, 1, 0, 0.4313726, 1,
1.479206, -0.4680439, 2.077683, 1, 0, 0.427451, 1,
1.479362, 0.04154733, -0.6147435, 1, 0, 0.4196078, 1,
1.493543, -1.251503, 3.408316, 1, 0, 0.4156863, 1,
1.501297, 0.6145393, -0.1951957, 1, 0, 0.4078431, 1,
1.508623, 0.7210374, 1.740515, 1, 0, 0.4039216, 1,
1.528311, 0.8047411, 1.524073, 1, 0, 0.3960784, 1,
1.549309, 1.316148, -0.04333283, 1, 0, 0.3882353, 1,
1.553035, 0.701197, 1.159727, 1, 0, 0.3843137, 1,
1.563329, 0.3096662, 2.497307, 1, 0, 0.3764706, 1,
1.567349, 0.8500985, 2.085275, 1, 0, 0.372549, 1,
1.579552, -0.4693695, 2.022596, 1, 0, 0.3647059, 1,
1.579843, 0.04472078, 1.022252, 1, 0, 0.3607843, 1,
1.584987, -3.6396, 3.409021, 1, 0, 0.3529412, 1,
1.606604, -0.6142489, 2.493028, 1, 0, 0.3490196, 1,
1.610397, 2.240158, -0.2831034, 1, 0, 0.3411765, 1,
1.612194, -0.9060562, 1.238346, 1, 0, 0.3372549, 1,
1.621028, 1.000847, 0.01830544, 1, 0, 0.3294118, 1,
1.630641, -1.38804, 2.830796, 1, 0, 0.3254902, 1,
1.650712, 0.2526534, 1.457576, 1, 0, 0.3176471, 1,
1.659145, 0.4078636, -0.5177339, 1, 0, 0.3137255, 1,
1.66406, 0.8492569, 0.4275716, 1, 0, 0.3058824, 1,
1.68071, -1.293864, 0.3882898, 1, 0, 0.2980392, 1,
1.686645, 0.8984416, 1.455409, 1, 0, 0.2941177, 1,
1.718273, -0.4383059, 3.031115, 1, 0, 0.2862745, 1,
1.753626, 0.4526739, 0.5533672, 1, 0, 0.282353, 1,
1.769219, -1.379449, 2.226924, 1, 0, 0.2745098, 1,
1.787981, 0.5463638, -1.693319, 1, 0, 0.2705882, 1,
1.803136, 0.07891546, 3.191542, 1, 0, 0.2627451, 1,
1.807521, 1.113416, 1.050351, 1, 0, 0.2588235, 1,
1.810682, 1.489547, -0.05731406, 1, 0, 0.2509804, 1,
1.831803, 0.7509787, 0.5335969, 1, 0, 0.2470588, 1,
1.832128, -1.038279, 2.702067, 1, 0, 0.2392157, 1,
1.842188, -0.6971089, 1.708198, 1, 0, 0.2352941, 1,
1.871135, -1.256696, 2.133711, 1, 0, 0.227451, 1,
1.877562, 0.4157122, 0.2571504, 1, 0, 0.2235294, 1,
1.879296, 0.5105621, 1.590337, 1, 0, 0.2156863, 1,
1.887123, -1.313979, 2.180885, 1, 0, 0.2117647, 1,
1.888707, 0.3013388, 1.977706, 1, 0, 0.2039216, 1,
1.900823, 0.2557049, 1.065707, 1, 0, 0.1960784, 1,
1.920749, 0.01258632, 1.126585, 1, 0, 0.1921569, 1,
1.926139, 0.1324605, 0.01910909, 1, 0, 0.1843137, 1,
1.943559, -1.086212, 0.07094577, 1, 0, 0.1803922, 1,
1.951254, 0.9502596, 1.832206, 1, 0, 0.172549, 1,
2.026882, -0.5900043, 0.69669, 1, 0, 0.1686275, 1,
2.037485, 0.2333512, 2.194995, 1, 0, 0.1607843, 1,
2.056439, 1.393677, 2.925519, 1, 0, 0.1568628, 1,
2.066315, -0.2006898, 0.3016339, 1, 0, 0.1490196, 1,
2.090441, -0.2530342, 3.164226, 1, 0, 0.145098, 1,
2.103796, -1.105362, 0.3347302, 1, 0, 0.1372549, 1,
2.119391, 0.2192139, 3.117779, 1, 0, 0.1333333, 1,
2.135426, 0.1219708, 2.229433, 1, 0, 0.1254902, 1,
2.138689, -0.1624743, 1.695707, 1, 0, 0.1215686, 1,
2.163875, -0.9854047, 3.886922, 1, 0, 0.1137255, 1,
2.231314, 0.3193135, 1.948079, 1, 0, 0.1098039, 1,
2.275104, 1.436878, 2.433345, 1, 0, 0.1019608, 1,
2.279021, -0.6074252, 2.817109, 1, 0, 0.09411765, 1,
2.292194, 0.8101671, 2.436299, 1, 0, 0.09019608, 1,
2.292259, 0.7869031, 2.766121, 1, 0, 0.08235294, 1,
2.293005, 1.067836, 1.337163, 1, 0, 0.07843138, 1,
2.302716, -0.6351199, 1.578942, 1, 0, 0.07058824, 1,
2.382092, 0.04374745, 1.299124, 1, 0, 0.06666667, 1,
2.460455, -0.4087669, 2.880471, 1, 0, 0.05882353, 1,
2.485732, 1.756346, -0.8372228, 1, 0, 0.05490196, 1,
2.529546, -1.086438, 0.5696479, 1, 0, 0.04705882, 1,
2.557731, 0.5167378, 0.4611989, 1, 0, 0.04313726, 1,
2.598547, 1.279711, 0.9453473, 1, 0, 0.03529412, 1,
2.735811, -0.8944414, 2.16693, 1, 0, 0.03137255, 1,
2.762854, -0.1990463, 1.976853, 1, 0, 0.02352941, 1,
2.782874, 0.9992294, -0.2397265, 1, 0, 0.01960784, 1,
2.798919, 0.3982447, 0.4286806, 1, 0, 0.01176471, 1,
2.82899, -0.1371717, 0.6372691, 1, 0, 0.007843138, 1
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
-0.2656049, -4.789505, -7.191975, 0, -0.5, 0.5, 0.5,
-0.2656049, -4.789505, -7.191975, 1, -0.5, 0.5, 0.5,
-0.2656049, -4.789505, -7.191975, 1, 1.5, 0.5, 0.5,
-0.2656049, -4.789505, -7.191975, 0, 1.5, 0.5, 0.5
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
-4.409268, -0.247552, -7.191975, 0, -0.5, 0.5, 0.5,
-4.409268, -0.247552, -7.191975, 1, -0.5, 0.5, 0.5,
-4.409268, -0.247552, -7.191975, 1, 1.5, 0.5, 0.5,
-4.409268, -0.247552, -7.191975, 0, 1.5, 0.5, 0.5
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
-4.409268, -4.789505, 0.3161929, 0, -0.5, 0.5, 0.5,
-4.409268, -4.789505, 0.3161929, 1, -0.5, 0.5, 0.5,
-4.409268, -4.789505, 0.3161929, 1, 1.5, 0.5, 0.5,
-4.409268, -4.789505, 0.3161929, 0, 1.5, 0.5, 0.5
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
-3, -3.741362, -5.459321,
2, -3.741362, -5.459321,
-3, -3.741362, -5.459321,
-3, -3.916052, -5.748096,
-2, -3.741362, -5.459321,
-2, -3.916052, -5.748096,
-1, -3.741362, -5.459321,
-1, -3.916052, -5.748096,
0, -3.741362, -5.459321,
0, -3.916052, -5.748096,
1, -3.741362, -5.459321,
1, -3.916052, -5.748096,
2, -3.741362, -5.459321,
2, -3.916052, -5.748096
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
-3, -4.265433, -6.325648, 0, -0.5, 0.5, 0.5,
-3, -4.265433, -6.325648, 1, -0.5, 0.5, 0.5,
-3, -4.265433, -6.325648, 1, 1.5, 0.5, 0.5,
-3, -4.265433, -6.325648, 0, 1.5, 0.5, 0.5,
-2, -4.265433, -6.325648, 0, -0.5, 0.5, 0.5,
-2, -4.265433, -6.325648, 1, -0.5, 0.5, 0.5,
-2, -4.265433, -6.325648, 1, 1.5, 0.5, 0.5,
-2, -4.265433, -6.325648, 0, 1.5, 0.5, 0.5,
-1, -4.265433, -6.325648, 0, -0.5, 0.5, 0.5,
-1, -4.265433, -6.325648, 1, -0.5, 0.5, 0.5,
-1, -4.265433, -6.325648, 1, 1.5, 0.5, 0.5,
-1, -4.265433, -6.325648, 0, 1.5, 0.5, 0.5,
0, -4.265433, -6.325648, 0, -0.5, 0.5, 0.5,
0, -4.265433, -6.325648, 1, -0.5, 0.5, 0.5,
0, -4.265433, -6.325648, 1, 1.5, 0.5, 0.5,
0, -4.265433, -6.325648, 0, 1.5, 0.5, 0.5,
1, -4.265433, -6.325648, 0, -0.5, 0.5, 0.5,
1, -4.265433, -6.325648, 1, -0.5, 0.5, 0.5,
1, -4.265433, -6.325648, 1, 1.5, 0.5, 0.5,
1, -4.265433, -6.325648, 0, 1.5, 0.5, 0.5,
2, -4.265433, -6.325648, 0, -0.5, 0.5, 0.5,
2, -4.265433, -6.325648, 1, -0.5, 0.5, 0.5,
2, -4.265433, -6.325648, 1, 1.5, 0.5, 0.5,
2, -4.265433, -6.325648, 0, 1.5, 0.5, 0.5
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
-3.453038, -3, -5.459321,
-3.453038, 3, -5.459321,
-3.453038, -3, -5.459321,
-3.61241, -3, -5.748096,
-3.453038, -2, -5.459321,
-3.61241, -2, -5.748096,
-3.453038, -1, -5.459321,
-3.61241, -1, -5.748096,
-3.453038, 0, -5.459321,
-3.61241, 0, -5.748096,
-3.453038, 1, -5.459321,
-3.61241, 1, -5.748096,
-3.453038, 2, -5.459321,
-3.61241, 2, -5.748096,
-3.453038, 3, -5.459321,
-3.61241, 3, -5.748096
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
-3.931153, -3, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, -3, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, -3, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, -3, -6.325648, 0, 1.5, 0.5, 0.5,
-3.931153, -2, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, -2, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, -2, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, -2, -6.325648, 0, 1.5, 0.5, 0.5,
-3.931153, -1, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, -1, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, -1, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, -1, -6.325648, 0, 1.5, 0.5, 0.5,
-3.931153, 0, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, 0, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, 0, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, 0, -6.325648, 0, 1.5, 0.5, 0.5,
-3.931153, 1, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, 1, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, 1, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, 1, -6.325648, 0, 1.5, 0.5, 0.5,
-3.931153, 2, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, 2, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, 2, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, 2, -6.325648, 0, 1.5, 0.5, 0.5,
-3.931153, 3, -6.325648, 0, -0.5, 0.5, 0.5,
-3.931153, 3, -6.325648, 1, -0.5, 0.5, 0.5,
-3.931153, 3, -6.325648, 1, 1.5, 0.5, 0.5,
-3.931153, 3, -6.325648, 0, 1.5, 0.5, 0.5
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
-3.453038, -3.741362, -4,
-3.453038, -3.741362, 4,
-3.453038, -3.741362, -4,
-3.61241, -3.916052, -4,
-3.453038, -3.741362, -2,
-3.61241, -3.916052, -2,
-3.453038, -3.741362, 0,
-3.61241, -3.916052, 0,
-3.453038, -3.741362, 2,
-3.61241, -3.916052, 2,
-3.453038, -3.741362, 4,
-3.61241, -3.916052, 4
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
-3.931153, -4.265433, -4, 0, -0.5, 0.5, 0.5,
-3.931153, -4.265433, -4, 1, -0.5, 0.5, 0.5,
-3.931153, -4.265433, -4, 1, 1.5, 0.5, 0.5,
-3.931153, -4.265433, -4, 0, 1.5, 0.5, 0.5,
-3.931153, -4.265433, -2, 0, -0.5, 0.5, 0.5,
-3.931153, -4.265433, -2, 1, -0.5, 0.5, 0.5,
-3.931153, -4.265433, -2, 1, 1.5, 0.5, 0.5,
-3.931153, -4.265433, -2, 0, 1.5, 0.5, 0.5,
-3.931153, -4.265433, 0, 0, -0.5, 0.5, 0.5,
-3.931153, -4.265433, 0, 1, -0.5, 0.5, 0.5,
-3.931153, -4.265433, 0, 1, 1.5, 0.5, 0.5,
-3.931153, -4.265433, 0, 0, 1.5, 0.5, 0.5,
-3.931153, -4.265433, 2, 0, -0.5, 0.5, 0.5,
-3.931153, -4.265433, 2, 1, -0.5, 0.5, 0.5,
-3.931153, -4.265433, 2, 1, 1.5, 0.5, 0.5,
-3.931153, -4.265433, 2, 0, 1.5, 0.5, 0.5,
-3.931153, -4.265433, 4, 0, -0.5, 0.5, 0.5,
-3.931153, -4.265433, 4, 1, -0.5, 0.5, 0.5,
-3.931153, -4.265433, 4, 1, 1.5, 0.5, 0.5,
-3.931153, -4.265433, 4, 0, 1.5, 0.5, 0.5
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
-3.453038, -3.741362, -5.459321,
-3.453038, 3.246258, -5.459321,
-3.453038, -3.741362, 6.091706,
-3.453038, 3.246258, 6.091706,
-3.453038, -3.741362, -5.459321,
-3.453038, -3.741362, 6.091706,
-3.453038, 3.246258, -5.459321,
-3.453038, 3.246258, 6.091706,
-3.453038, -3.741362, -5.459321,
2.921828, -3.741362, -5.459321,
-3.453038, -3.741362, 6.091706,
2.921828, -3.741362, 6.091706,
-3.453038, 3.246258, -5.459321,
2.921828, 3.246258, -5.459321,
-3.453038, 3.246258, 6.091706,
2.921828, 3.246258, 6.091706,
2.921828, -3.741362, -5.459321,
2.921828, 3.246258, -5.459321,
2.921828, -3.741362, 6.091706,
2.921828, 3.246258, 6.091706,
2.921828, -3.741362, -5.459321,
2.921828, -3.741362, 6.091706,
2.921828, 3.246258, -5.459321,
2.921828, 3.246258, 6.091706
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
var radius = 7.972099;
var distance = 35.46877;
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
mvMatrix.translate( 0.2656049, 0.247552, -0.3161929 );
mvMatrix.scale( 1.352121, 1.233552, 0.7462184 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46877);
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
Sodium_arsenate<-read.table("Sodium_arsenate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sodium_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_arsenate' not found
```

```r
y<-Sodium_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_arsenate' not found
```

```r
z<-Sodium_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_arsenate' not found
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
-3.3602, 0.8936166, -1.603419, 0, 0, 1, 1, 1,
-2.850466, -1.451061, -0.7709109, 1, 0, 0, 1, 1,
-2.70286, -1.444743, -3.057039, 1, 0, 0, 1, 1,
-2.532248, -2.006156, -3.698561, 1, 0, 0, 1, 1,
-2.422832, 0.1250992, -1.428102, 1, 0, 0, 1, 1,
-2.416176, -0.1990329, -1.618016, 1, 0, 0, 1, 1,
-2.3698, -0.5474095, -1.628861, 0, 0, 0, 1, 1,
-2.340576, 0.6396847, -1.5284, 0, 0, 0, 1, 1,
-2.303968, 1.207235, -0.5775397, 0, 0, 0, 1, 1,
-2.237241, -0.5423911, -1.450011, 0, 0, 0, 1, 1,
-2.161539, -1.497813, -2.593854, 0, 0, 0, 1, 1,
-2.159812, -0.3455163, 0.4243862, 0, 0, 0, 1, 1,
-2.123705, 0.2276527, -1.355382, 0, 0, 0, 1, 1,
-2.119068, -0.7905865, 0.3545013, 1, 1, 1, 1, 1,
-2.117782, -0.7181053, -3.411294, 1, 1, 1, 1, 1,
-2.104475, 0.3256013, -0.04082685, 1, 1, 1, 1, 1,
-2.091788, 0.6524165, -1.738945, 1, 1, 1, 1, 1,
-2.08543, -0.845291, -1.274863, 1, 1, 1, 1, 1,
-2.073633, 0.6532974, -1.444409, 1, 1, 1, 1, 1,
-2.056731, 0.5223312, -0.6217722, 1, 1, 1, 1, 1,
-2.015658, -0.9307148, -0.9281037, 1, 1, 1, 1, 1,
-1.973427, -1.336423, -1.892254, 1, 1, 1, 1, 1,
-1.968162, -0.6391727, -2.457486, 1, 1, 1, 1, 1,
-1.95531, -1.068166, -1.99669, 1, 1, 1, 1, 1,
-1.950598, 1.025393, -1.995875, 1, 1, 1, 1, 1,
-1.938613, -1.61692, -1.614922, 1, 1, 1, 1, 1,
-1.925054, -1.342518, -2.543195, 1, 1, 1, 1, 1,
-1.919491, 0.4417199, 0.3120754, 1, 1, 1, 1, 1,
-1.907379, 0.3263397, -1.61891, 0, 0, 1, 1, 1,
-1.90714, -0.1970115, -0.2571487, 1, 0, 0, 1, 1,
-1.889735, -1.700706, -2.845047, 1, 0, 0, 1, 1,
-1.88067, 0.027392, -2.471825, 1, 0, 0, 1, 1,
-1.865093, 1.817087, -1.212127, 1, 0, 0, 1, 1,
-1.85544, 0.6063434, -1.782327, 1, 0, 0, 1, 1,
-1.843378, 0.0286469, -4.153776, 0, 0, 0, 1, 1,
-1.842686, 0.6716352, -2.502956, 0, 0, 0, 1, 1,
-1.834131, -0.5299876, -1.391518, 0, 0, 0, 1, 1,
-1.820446, -1.143484, -1.809382, 0, 0, 0, 1, 1,
-1.818696, -0.03877636, -2.57711, 0, 0, 0, 1, 1,
-1.800026, -0.6945034, -0.1918705, 0, 0, 0, 1, 1,
-1.783855, 0.5353551, -0.4837976, 0, 0, 0, 1, 1,
-1.736354, -0.3475388, -3.727723, 1, 1, 1, 1, 1,
-1.7277, 1.157924, -2.233349, 1, 1, 1, 1, 1,
-1.714296, -0.6867942, -0.8258517, 1, 1, 1, 1, 1,
-1.693441, 1.032502, -1.914525, 1, 1, 1, 1, 1,
-1.690182, -2.556854, -2.30394, 1, 1, 1, 1, 1,
-1.635947, -1.982334, -1.377993, 1, 1, 1, 1, 1,
-1.633899, -0.2123915, -1.809314, 1, 1, 1, 1, 1,
-1.626711, 0.5287343, -0.7501075, 1, 1, 1, 1, 1,
-1.621346, 0.7908495, -1.988942, 1, 1, 1, 1, 1,
-1.612351, 0.4456474, -1.723442, 1, 1, 1, 1, 1,
-1.605269, -0.9058095, -1.493612, 1, 1, 1, 1, 1,
-1.591039, -0.6838327, -2.979674, 1, 1, 1, 1, 1,
-1.590286, 1.786922, -0.725713, 1, 1, 1, 1, 1,
-1.585321, 2.689566, 0.8046218, 1, 1, 1, 1, 1,
-1.550629, 0.3211317, -1.018673, 1, 1, 1, 1, 1,
-1.548529, 0.9149892, -1.867336, 0, 0, 1, 1, 1,
-1.54255, -0.9663541, -4.302267, 1, 0, 0, 1, 1,
-1.532398, 0.6672544, -0.7814056, 1, 0, 0, 1, 1,
-1.526338, 1.336307, -0.5884995, 1, 0, 0, 1, 1,
-1.516181, 1.985636, -0.3166867, 1, 0, 0, 1, 1,
-1.505974, -1.368024, -3.48683, 1, 0, 0, 1, 1,
-1.490525, 0.9905848, -1.557524, 0, 0, 0, 1, 1,
-1.48623, -1.961019, -3.832517, 0, 0, 0, 1, 1,
-1.480764, 0.972392, -0.426719, 0, 0, 0, 1, 1,
-1.478907, 0.8499289, -0.4265242, 0, 0, 0, 1, 1,
-1.476015, -1.588282, -4.310316, 0, 0, 0, 1, 1,
-1.474447, -0.6788701, -1.665837, 0, 0, 0, 1, 1,
-1.466474, -0.7400857, -0.9766757, 0, 0, 0, 1, 1,
-1.455261, 0.6036084, -1.884738, 1, 1, 1, 1, 1,
-1.451248, -0.4534374, -4.05029, 1, 1, 1, 1, 1,
-1.450528, 0.4115576, -1.634943, 1, 1, 1, 1, 1,
-1.442957, 0.8077648, -0.7544942, 1, 1, 1, 1, 1,
-1.417394, 1.605354, -3.264702, 1, 1, 1, 1, 1,
-1.406952, -0.7873847, -2.084323, 1, 1, 1, 1, 1,
-1.406247, 1.695223, -0.8597326, 1, 1, 1, 1, 1,
-1.390588, -1.759106, -2.447287, 1, 1, 1, 1, 1,
-1.384416, -0.04394686, -1.417052, 1, 1, 1, 1, 1,
-1.38188, -0.5455095, -2.476898, 1, 1, 1, 1, 1,
-1.381831, 1.096765, -1.519079, 1, 1, 1, 1, 1,
-1.37583, -0.4157496, -1.404509, 1, 1, 1, 1, 1,
-1.358635, -0.6957646, -1.47323, 1, 1, 1, 1, 1,
-1.351616, 1.261836, -1.233462, 1, 1, 1, 1, 1,
-1.344007, 0.3670473, -1.12257, 1, 1, 1, 1, 1,
-1.336508, -0.9207025, -2.138187, 0, 0, 1, 1, 1,
-1.321566, 0.4639311, -2.866204, 1, 0, 0, 1, 1,
-1.31675, 0.1950748, 0.4015038, 1, 0, 0, 1, 1,
-1.307682, -1.345246, -2.364371, 1, 0, 0, 1, 1,
-1.303009, -0.9065776, -1.982444, 1, 0, 0, 1, 1,
-1.29752, 0.2037113, -2.621884, 1, 0, 0, 1, 1,
-1.295279, 0.355849, -0.9366132, 0, 0, 0, 1, 1,
-1.293276, -0.518556, -2.567027, 0, 0, 0, 1, 1,
-1.278887, 0.4132665, -0.3779496, 0, 0, 0, 1, 1,
-1.269512, 1.220273, -0.9179518, 0, 0, 0, 1, 1,
-1.266538, -0.9973747, -3.008598, 0, 0, 0, 1, 1,
-1.262267, -0.3707292, -1.207054, 0, 0, 0, 1, 1,
-1.256812, 0.09242921, -1.859208, 0, 0, 0, 1, 1,
-1.255814, 1.799357, -0.7406673, 1, 1, 1, 1, 1,
-1.252641, -0.6522696, -2.15663, 1, 1, 1, 1, 1,
-1.246129, -0.6118384, -1.820024, 1, 1, 1, 1, 1,
-1.242971, 1.421139, -0.07214477, 1, 1, 1, 1, 1,
-1.237732, -0.8594697, -0.2669556, 1, 1, 1, 1, 1,
-1.235345, 0.8836355, -0.9663075, 1, 1, 1, 1, 1,
-1.227502, -0.8967223, -1.090772, 1, 1, 1, 1, 1,
-1.222277, -0.022884, -2.461529, 1, 1, 1, 1, 1,
-1.221474, -0.8050306, -1.725248, 1, 1, 1, 1, 1,
-1.211862, 0.3499184, -1.908285, 1, 1, 1, 1, 1,
-1.209144, 0.8989933, -1.360323, 1, 1, 1, 1, 1,
-1.208787, 0.173097, -1.400064, 1, 1, 1, 1, 1,
-1.205209, -0.8287765, -1.711538, 1, 1, 1, 1, 1,
-1.202739, -1.436628, -0.6420758, 1, 1, 1, 1, 1,
-1.201786, 0.5952988, -0.4283691, 1, 1, 1, 1, 1,
-1.196425, 0.8821892, -1.426981, 0, 0, 1, 1, 1,
-1.192839, 0.6675067, -0.07801943, 1, 0, 0, 1, 1,
-1.1889, -2.106319, -1.930084, 1, 0, 0, 1, 1,
-1.185027, 0.6278356, -1.329283, 1, 0, 0, 1, 1,
-1.182568, 0.9964287, 0.1722997, 1, 0, 0, 1, 1,
-1.180073, -3.122118, -4.575115, 1, 0, 0, 1, 1,
-1.177338, 1.982466, -1.836028, 0, 0, 0, 1, 1,
-1.167105, 1.030338, -0.01402797, 0, 0, 0, 1, 1,
-1.161617, 0.3152391, -2.844408, 0, 0, 0, 1, 1,
-1.16056, 0.6717665, -0.9359933, 0, 0, 0, 1, 1,
-1.158121, 0.2549596, -0.9839348, 0, 0, 0, 1, 1,
-1.157978, -0.2389953, -2.593705, 0, 0, 0, 1, 1,
-1.152705, 0.0946881, 0.711395, 0, 0, 0, 1, 1,
-1.140796, -0.9646451, -2.859059, 1, 1, 1, 1, 1,
-1.130282, 0.6564763, -1.503933, 1, 1, 1, 1, 1,
-1.126517, -0.5289575, -0.8815173, 1, 1, 1, 1, 1,
-1.12614, 1.006912, -1.187676, 1, 1, 1, 1, 1,
-1.125082, -0.01818699, -3.276035, 1, 1, 1, 1, 1,
-1.123559, -0.1293251, -1.870398, 1, 1, 1, 1, 1,
-1.120057, 1.49006, -1.568064, 1, 1, 1, 1, 1,
-1.115758, 0.4206683, -1.108038, 1, 1, 1, 1, 1,
-1.115131, -0.1814714, -1.802297, 1, 1, 1, 1, 1,
-1.106388, -0.399723, -3.373082, 1, 1, 1, 1, 1,
-1.105762, 0.3178474, 0.2115377, 1, 1, 1, 1, 1,
-1.103389, -1.17802, -4.275022, 1, 1, 1, 1, 1,
-1.099989, -1.523615, -2.062768, 1, 1, 1, 1, 1,
-1.098114, -1.401474, -3.521554, 1, 1, 1, 1, 1,
-1.097493, 1.433409, -0.5937272, 1, 1, 1, 1, 1,
-1.096278, 0.00891173, -1.585276, 0, 0, 1, 1, 1,
-1.095553, -1.093326, -2.226871, 1, 0, 0, 1, 1,
-1.085201, -0.5218858, -0.7745098, 1, 0, 0, 1, 1,
-1.084326, 0.6767687, -1.001744, 1, 0, 0, 1, 1,
-1.083157, 0.2815991, 0.7878128, 1, 0, 0, 1, 1,
-1.075962, -0.6324952, -2.608424, 1, 0, 0, 1, 1,
-1.071924, -0.2993362, -2.077009, 0, 0, 0, 1, 1,
-1.070908, 1.483296, -0.105283, 0, 0, 0, 1, 1,
-1.070861, -0.1330159, -2.691798, 0, 0, 0, 1, 1,
-1.065034, 1.191465, -2.869678, 0, 0, 0, 1, 1,
-1.062857, 2.0949, -0.648652, 0, 0, 0, 1, 1,
-1.048623, -1.195714, -2.739034, 0, 0, 0, 1, 1,
-1.047718, 0.2037155, -0.3647142, 0, 0, 0, 1, 1,
-1.045448, 2.366731, -1.679714, 1, 1, 1, 1, 1,
-1.045065, -0.4923255, -3.624469, 1, 1, 1, 1, 1,
-1.04406, 0.8316802, -1.815819, 1, 1, 1, 1, 1,
-1.03914, -2.001978, -3.317758, 1, 1, 1, 1, 1,
-1.028739, -1.00777, -3.334754, 1, 1, 1, 1, 1,
-1.027956, 0.2483015, -1.923587, 1, 1, 1, 1, 1,
-1.023772, 0.1565031, -1.385845, 1, 1, 1, 1, 1,
-1.013394, -1.258891, -1.982286, 1, 1, 1, 1, 1,
-1.010676, -0.8948511, -1.915606, 1, 1, 1, 1, 1,
-1.009447, -0.7704543, -3.20769, 1, 1, 1, 1, 1,
-1.001516, 0.9238691, 0.8022701, 1, 1, 1, 1, 1,
-0.9973529, 1.847314, -0.6040025, 1, 1, 1, 1, 1,
-0.9933724, -0.7740961, -2.017004, 1, 1, 1, 1, 1,
-0.9923872, 1.53575, -2.379469, 1, 1, 1, 1, 1,
-0.991944, 1.210336, -0.9466027, 1, 1, 1, 1, 1,
-0.9870622, 0.03443345, -2.586165, 0, 0, 1, 1, 1,
-0.9818168, 0.2925948, -0.7605683, 1, 0, 0, 1, 1,
-0.9809792, 0.4644526, -1.28022, 1, 0, 0, 1, 1,
-0.9728039, -0.737991, -2.567635, 1, 0, 0, 1, 1,
-0.9671507, 0.5072263, -0.4839527, 1, 0, 0, 1, 1,
-0.9612961, -0.3391107, -0.350902, 1, 0, 0, 1, 1,
-0.961084, -0.7592222, -1.62926, 0, 0, 0, 1, 1,
-0.9609725, 0.5348774, -0.09403662, 0, 0, 0, 1, 1,
-0.9601822, -1.596334, -1.324304, 0, 0, 0, 1, 1,
-0.9431629, 0.682198, -2.514062, 0, 0, 0, 1, 1,
-0.9341314, 0.03800145, -2.65035, 0, 0, 0, 1, 1,
-0.9292896, 0.3131342, -1.346338, 0, 0, 0, 1, 1,
-0.9282706, -0.3812301, -0.4705417, 0, 0, 0, 1, 1,
-0.9278037, 0.4964378, -1.54829, 1, 1, 1, 1, 1,
-0.9271452, -1.474439, -1.78284, 1, 1, 1, 1, 1,
-0.924537, 0.1180215, -0.02764186, 1, 1, 1, 1, 1,
-0.9220186, -0.965483, -3.225527, 1, 1, 1, 1, 1,
-0.9195611, 1.095967, -2.200794, 1, 1, 1, 1, 1,
-0.9161292, -2.163346, -1.040013, 1, 1, 1, 1, 1,
-0.9126773, -0.1344493, -1.886665, 1, 1, 1, 1, 1,
-0.9087086, -0.2524113, -2.076954, 1, 1, 1, 1, 1,
-0.9062653, -0.420165, -2.053024, 1, 1, 1, 1, 1,
-0.9016698, 0.8021578, -0.5978959, 1, 1, 1, 1, 1,
-0.9015707, -1.437451, -1.911775, 1, 1, 1, 1, 1,
-0.9008046, -0.2779075, -3.857253, 1, 1, 1, 1, 1,
-0.8993441, 0.8361263, -1.251347, 1, 1, 1, 1, 1,
-0.8939282, -0.08328739, -2.024925, 1, 1, 1, 1, 1,
-0.893896, -0.1182408, -2.380564, 1, 1, 1, 1, 1,
-0.8886126, 0.09091799, -3.235915, 0, 0, 1, 1, 1,
-0.8856847, -0.3349842, -2.975079, 1, 0, 0, 1, 1,
-0.8843961, 1.466383, -1.328145, 1, 0, 0, 1, 1,
-0.8762889, -0.440408, -2.798638, 1, 0, 0, 1, 1,
-0.8750367, 1.619476, 0.4494072, 1, 0, 0, 1, 1,
-0.8712981, 0.00961685, -2.362396, 1, 0, 0, 1, 1,
-0.8653895, 0.8444099, -2.450087, 0, 0, 0, 1, 1,
-0.8630601, 1.536328, 0.7159197, 0, 0, 0, 1, 1,
-0.8613519, 0.7899994, -1.434354, 0, 0, 0, 1, 1,
-0.86112, 1.179718, -0.02906462, 0, 0, 0, 1, 1,
-0.8594037, -0.9744793, -1.577268, 0, 0, 0, 1, 1,
-0.8521915, 1.369655, -1.645074, 0, 0, 0, 1, 1,
-0.8450176, 0.02616671, 0.3003956, 0, 0, 0, 1, 1,
-0.8428842, 0.1993918, -0.4404243, 1, 1, 1, 1, 1,
-0.8413656, 0.04806102, -2.66909, 1, 1, 1, 1, 1,
-0.8379787, -2.681134, -1.823177, 1, 1, 1, 1, 1,
-0.8378766, 2.620565, -1.492786, 1, 1, 1, 1, 1,
-0.8262152, 1.635611, 0.01661904, 1, 1, 1, 1, 1,
-0.8257561, -1.109052, -2.005978, 1, 1, 1, 1, 1,
-0.8256279, 1.405882, 0.4529278, 1, 1, 1, 1, 1,
-0.8175355, -0.8642395, -2.270342, 1, 1, 1, 1, 1,
-0.8058364, 0.6387106, -0.2570018, 1, 1, 1, 1, 1,
-0.7995417, 0.08415356, -3.898311, 1, 1, 1, 1, 1,
-0.7967424, -1.135226, -3.683434, 1, 1, 1, 1, 1,
-0.794185, -0.3107935, -2.385504, 1, 1, 1, 1, 1,
-0.784947, 0.5579444, -1.745955, 1, 1, 1, 1, 1,
-0.7835881, -1.843326, -2.94887, 1, 1, 1, 1, 1,
-0.7827238, 1.481831, 1.562289, 1, 1, 1, 1, 1,
-0.7826952, -0.05436433, -1.973231, 0, 0, 1, 1, 1,
-0.7810248, -0.1823319, -2.324025, 1, 0, 0, 1, 1,
-0.771705, 1.19107, -0.5351073, 1, 0, 0, 1, 1,
-0.7711735, 0.09553891, -1.498929, 1, 0, 0, 1, 1,
-0.7677348, 0.5564398, 1.13718, 1, 0, 0, 1, 1,
-0.7664246, -0.4884868, -2.57389, 1, 0, 0, 1, 1,
-0.7659043, 1.910538, -0.02340903, 0, 0, 0, 1, 1,
-0.7605876, 1.101381, -0.5497258, 0, 0, 0, 1, 1,
-0.7581024, 0.7239386, -0.5459881, 0, 0, 0, 1, 1,
-0.7558334, 0.6150276, -0.3798892, 0, 0, 0, 1, 1,
-0.7557473, 0.8233725, -0.7069852, 0, 0, 0, 1, 1,
-0.753677, 0.227002, 0.6015674, 0, 0, 0, 1, 1,
-0.7530845, -0.05020782, -1.883102, 0, 0, 0, 1, 1,
-0.7480069, 1.727723, -0.7121717, 1, 1, 1, 1, 1,
-0.7447208, -0.3932653, -2.532009, 1, 1, 1, 1, 1,
-0.7383426, 0.2750795, -1.391374, 1, 1, 1, 1, 1,
-0.7310171, -0.4685455, -3.084674, 1, 1, 1, 1, 1,
-0.7306569, 0.02711661, -2.078868, 1, 1, 1, 1, 1,
-0.7238603, -2.039058, -3.703523, 1, 1, 1, 1, 1,
-0.7187367, -0.2499767, -2.548176, 1, 1, 1, 1, 1,
-0.71846, 1.086179, 0.3962584, 1, 1, 1, 1, 1,
-0.7156785, 0.5090333, 0.2674921, 1, 1, 1, 1, 1,
-0.7106511, 0.8540762, -0.3776318, 1, 1, 1, 1, 1,
-0.7045974, 1.855588, -1.967395, 1, 1, 1, 1, 1,
-0.6925078, -0.572001, -0.8141116, 1, 1, 1, 1, 1,
-0.6846512, -0.02657001, -0.8231855, 1, 1, 1, 1, 1,
-0.6791514, -1.279957, -2.955202, 1, 1, 1, 1, 1,
-0.6786607, -0.2679877, -3.442421, 1, 1, 1, 1, 1,
-0.6698869, 1.233792, 0.2415608, 0, 0, 1, 1, 1,
-0.6673908, -1.049543, -4.354777, 1, 0, 0, 1, 1,
-0.6635538, -1.616816, -3.246553, 1, 0, 0, 1, 1,
-0.6545186, 0.371292, -0.8495429, 1, 0, 0, 1, 1,
-0.6532854, -1.130011, -2.531913, 1, 0, 0, 1, 1,
-0.6531574, 0.717353, 0.4619688, 1, 0, 0, 1, 1,
-0.6530904, 1.678241, 0.2142727, 0, 0, 0, 1, 1,
-0.6520686, -0.4219938, -3.727794, 0, 0, 0, 1, 1,
-0.6519728, 2.517066, 0.282892, 0, 0, 0, 1, 1,
-0.6503907, -0.0683421, -2.12542, 0, 0, 0, 1, 1,
-0.6496646, 1.324266, -1.143017, 0, 0, 0, 1, 1,
-0.6496472, -0.04238283, -2.477449, 0, 0, 0, 1, 1,
-0.6478199, 0.9840357, 0.2386187, 0, 0, 0, 1, 1,
-0.6437083, -0.00434242, -2.050049, 1, 1, 1, 1, 1,
-0.6383386, 0.7168354, 0.6932559, 1, 1, 1, 1, 1,
-0.6379728, 0.9078897, -0.2548128, 1, 1, 1, 1, 1,
-0.6378061, -1.065377, -2.336282, 1, 1, 1, 1, 1,
-0.6376783, -0.3309314, -2.074897, 1, 1, 1, 1, 1,
-0.6372835, 0.7050834, -0.8057914, 1, 1, 1, 1, 1,
-0.6352149, -0.89126, -1.893903, 1, 1, 1, 1, 1,
-0.6351166, -0.4582871, -2.458129, 1, 1, 1, 1, 1,
-0.6344082, 0.104904, -1.214036, 1, 1, 1, 1, 1,
-0.6342047, 1.123579, -0.1346925, 1, 1, 1, 1, 1,
-0.6255554, -0.4160624, -0.573683, 1, 1, 1, 1, 1,
-0.6251999, 0.2219518, -1.581646, 1, 1, 1, 1, 1,
-0.6222789, -0.6574246, -1.349949, 1, 1, 1, 1, 1,
-0.6140562, -0.9184207, -2.63963, 1, 1, 1, 1, 1,
-0.6046928, -0.9939466, -2.015372, 1, 1, 1, 1, 1,
-0.6014162, 2.086467, 0.3991549, 0, 0, 1, 1, 1,
-0.6013675, 0.6347252, -0.2984686, 1, 0, 0, 1, 1,
-0.6009417, -0.9509971, -1.584184, 1, 0, 0, 1, 1,
-0.5984567, -0.1801869, -1.561598, 1, 0, 0, 1, 1,
-0.590818, -1.491915, -3.66134, 1, 0, 0, 1, 1,
-0.5897446, -0.2059771, -3.055324, 1, 0, 0, 1, 1,
-0.5895158, -0.2349563, -1.293593, 0, 0, 0, 1, 1,
-0.5872199, 0.1843175, -0.3908194, 0, 0, 0, 1, 1,
-0.5858397, -0.7710094, -3.281331, 0, 0, 0, 1, 1,
-0.5854638, -1.703779, -3.339993, 0, 0, 0, 1, 1,
-0.5832669, -0.07636692, -1.430816, 0, 0, 0, 1, 1,
-0.5827501, -0.4520486, -2.256691, 0, 0, 0, 1, 1,
-0.5819175, -2.099635, -1.461617, 0, 0, 0, 1, 1,
-0.580871, 1.865363, -1.006802, 1, 1, 1, 1, 1,
-0.5792118, 0.07787035, 0.3165534, 1, 1, 1, 1, 1,
-0.5791473, 2.031049, -0.7994666, 1, 1, 1, 1, 1,
-0.5783234, -0.03225225, 0.6378003, 1, 1, 1, 1, 1,
-0.5702264, -0.4480746, -1.865714, 1, 1, 1, 1, 1,
-0.5674313, 1.776258, 0.4369517, 1, 1, 1, 1, 1,
-0.5641128, -0.6202052, -2.592067, 1, 1, 1, 1, 1,
-0.5606449, 1.445594, -0.08098233, 1, 1, 1, 1, 1,
-0.5578086, -0.5030171, -2.298904, 1, 1, 1, 1, 1,
-0.5502849, 3.144496, 0.5784279, 1, 1, 1, 1, 1,
-0.5497473, 1.210513, -0.6914135, 1, 1, 1, 1, 1,
-0.5466984, -0.8473672, -3.16888, 1, 1, 1, 1, 1,
-0.5452932, 1.835799, -0.2262382, 1, 1, 1, 1, 1,
-0.5419376, -0.1488829, -3.141823, 1, 1, 1, 1, 1,
-0.5412821, 0.3603011, -0.2700976, 1, 1, 1, 1, 1,
-0.5410841, 0.03570544, -2.845158, 0, 0, 1, 1, 1,
-0.5394719, 0.9361963, -0.8378807, 1, 0, 0, 1, 1,
-0.5364807, -0.28561, -1.201808, 1, 0, 0, 1, 1,
-0.5342626, 0.4882232, -1.203494, 1, 0, 0, 1, 1,
-0.5321884, -1.216438, -1.456956, 1, 0, 0, 1, 1,
-0.531725, 0.0624223, -1.341518, 1, 0, 0, 1, 1,
-0.5295706, -2.300472, -3.783808, 0, 0, 0, 1, 1,
-0.525012, 0.2245563, -0.7051814, 0, 0, 0, 1, 1,
-0.523019, -0.3902014, -3.274885, 0, 0, 0, 1, 1,
-0.5207762, 0.9155434, -0.9871967, 0, 0, 0, 1, 1,
-0.5179787, 0.3814486, -0.8753999, 0, 0, 0, 1, 1,
-0.514936, 1.961683, -0.3522161, 0, 0, 0, 1, 1,
-0.512265, 0.7631968, -1.834007, 0, 0, 0, 1, 1,
-0.5097517, 0.294313, 0.08492193, 1, 1, 1, 1, 1,
-0.5073227, -1.211496, -1.403157, 1, 1, 1, 1, 1,
-0.505221, 1.186139, -1.077576, 1, 1, 1, 1, 1,
-0.5050357, -2.242513, -3.745233, 1, 1, 1, 1, 1,
-0.5045553, 0.5407333, 0.1899153, 1, 1, 1, 1, 1,
-0.5017494, -0.4845677, -1.462043, 1, 1, 1, 1, 1,
-0.4966003, -1.368361, -2.959209, 1, 1, 1, 1, 1,
-0.4958988, -0.386488, -2.378487, 1, 1, 1, 1, 1,
-0.4931566, -0.1044005, -1.898401, 1, 1, 1, 1, 1,
-0.4886933, 0.4021229, -0.6595505, 1, 1, 1, 1, 1,
-0.4880606, 2.313945, -1.009144, 1, 1, 1, 1, 1,
-0.4849478, 1.61342, -1.002012, 1, 1, 1, 1, 1,
-0.484793, 0.4319153, 0.1741509, 1, 1, 1, 1, 1,
-0.48331, 2.739112, -0.0406683, 1, 1, 1, 1, 1,
-0.4807006, 1.113493, -0.9031927, 1, 1, 1, 1, 1,
-0.478337, 0.9927856, -1.433415, 0, 0, 1, 1, 1,
-0.4753653, -2.381233, -4.14497, 1, 0, 0, 1, 1,
-0.4742729, 0.123701, 0.04482567, 1, 0, 0, 1, 1,
-0.4722888, -1.889972, -1.579457, 1, 0, 0, 1, 1,
-0.4701354, -0.2923408, -2.836532, 1, 0, 0, 1, 1,
-0.4698022, 0.594457, -2.48919, 1, 0, 0, 1, 1,
-0.4682966, 0.4775603, -1.163317, 0, 0, 0, 1, 1,
-0.4675316, -0.1969171, -1.169839, 0, 0, 0, 1, 1,
-0.4668091, 0.1836668, -0.3691169, 0, 0, 0, 1, 1,
-0.4640147, 0.4151298, -1.326826, 0, 0, 0, 1, 1,
-0.4583392, -0.951548, -2.76026, 0, 0, 0, 1, 1,
-0.4580927, -0.08614685, -1.161507, 0, 0, 0, 1, 1,
-0.4580824, -1.817096, -2.975615, 0, 0, 0, 1, 1,
-0.4580131, 0.638935, 0.3533349, 1, 1, 1, 1, 1,
-0.4569804, 1.154728, 1.187277, 1, 1, 1, 1, 1,
-0.4543102, 1.402407, -0.2098573, 1, 1, 1, 1, 1,
-0.4526926, -0.03912895, -2.838799, 1, 1, 1, 1, 1,
-0.4503928, -0.563928, -3.555739, 1, 1, 1, 1, 1,
-0.4428354, -0.8905497, -2.374738, 1, 1, 1, 1, 1,
-0.4311869, -0.9108425, -2.729772, 1, 1, 1, 1, 1,
-0.4310766, -0.4790324, -3.367564, 1, 1, 1, 1, 1,
-0.4296851, -1.387978, -4.76391, 1, 1, 1, 1, 1,
-0.4288143, 0.9175404, -0.4300269, 1, 1, 1, 1, 1,
-0.4259668, 0.9888544, -2.194101, 1, 1, 1, 1, 1,
-0.4251934, 0.5036428, -0.7600317, 1, 1, 1, 1, 1,
-0.4234328, 0.2175103, -0.1470132, 1, 1, 1, 1, 1,
-0.4228083, -0.9583532, -2.956338, 1, 1, 1, 1, 1,
-0.4187449, -1.954805, -3.227626, 1, 1, 1, 1, 1,
-0.418689, 1.179428, 0.794342, 0, 0, 1, 1, 1,
-0.4175214, 0.7222447, 0.623067, 1, 0, 0, 1, 1,
-0.4173651, 0.3818963, -0.6515437, 1, 0, 0, 1, 1,
-0.4132992, -0.530679, -2.607922, 1, 0, 0, 1, 1,
-0.408321, 1.866647, -0.7740626, 1, 0, 0, 1, 1,
-0.40547, 1.352022, 1.748232, 1, 0, 0, 1, 1,
-0.4041528, 0.1638801, -2.027257, 0, 0, 0, 1, 1,
-0.4035324, 1.039472, -0.7437926, 0, 0, 0, 1, 1,
-0.4017209, -0.635527, -0.6663036, 0, 0, 0, 1, 1,
-0.3950348, 1.042909, -1.222472, 0, 0, 0, 1, 1,
-0.3922032, 2.683663, -0.6711907, 0, 0, 0, 1, 1,
-0.3907817, 1.676645, 0.1852366, 0, 0, 0, 1, 1,
-0.3896408, -0.352311, -1.525095, 0, 0, 0, 1, 1,
-0.3874889, -1.373654, -1.42142, 1, 1, 1, 1, 1,
-0.3855886, -0.2397575, -1.903921, 1, 1, 1, 1, 1,
-0.3849622, 1.129752, -0.1968273, 1, 1, 1, 1, 1,
-0.3773226, 0.2569251, -1.497941, 1, 1, 1, 1, 1,
-0.3710165, -0.02510634, -0.4530126, 1, 1, 1, 1, 1,
-0.3709969, -1.296109, -3.807803, 1, 1, 1, 1, 1,
-0.3699319, 0.7877561, -0.1200427, 1, 1, 1, 1, 1,
-0.3685423, -0.5871671, -3.081981, 1, 1, 1, 1, 1,
-0.366549, 1.897429, 0.5446064, 1, 1, 1, 1, 1,
-0.3591844, -0.4183802, -2.884979, 1, 1, 1, 1, 1,
-0.3566093, -0.2466556, -1.426456, 1, 1, 1, 1, 1,
-0.3536143, 0.1140697, -1.26631, 1, 1, 1, 1, 1,
-0.3524252, -0.3123426, -2.659541, 1, 1, 1, 1, 1,
-0.3515419, -0.2273782, -1.762351, 1, 1, 1, 1, 1,
-0.3465247, 0.003221277, -1.642239, 1, 1, 1, 1, 1,
-0.3443189, -2.251386, -0.04262663, 0, 0, 1, 1, 1,
-0.3432999, -0.5910347, -0.6799295, 1, 0, 0, 1, 1,
-0.3411031, 0.456035, -0.4246113, 1, 0, 0, 1, 1,
-0.3367704, -0.4094996, -1.79463, 1, 0, 0, 1, 1,
-0.3365321, -2.411409, -3.709591, 1, 0, 0, 1, 1,
-0.3342665, 1.675969, -0.1590156, 1, 0, 0, 1, 1,
-0.3295068, 0.747228, 0.06149018, 0, 0, 0, 1, 1,
-0.3215735, -0.9709253, -2.484511, 0, 0, 0, 1, 1,
-0.3196256, -0.5870833, -4.373291, 0, 0, 0, 1, 1,
-0.3138338, -0.02970184, -2.416297, 0, 0, 0, 1, 1,
-0.3136332, 0.9068044, -1.4783, 0, 0, 0, 1, 1,
-0.3011479, -0.4796217, -2.212725, 0, 0, 0, 1, 1,
-0.300788, -0.9838175, -3.158719, 0, 0, 0, 1, 1,
-0.2961288, 0.2681646, -0.03225626, 1, 1, 1, 1, 1,
-0.2951006, -1.204617, -1.78607, 1, 1, 1, 1, 1,
-0.2897312, -0.6860124, -3.544897, 1, 1, 1, 1, 1,
-0.2890775, 1.38387, -1.016713, 1, 1, 1, 1, 1,
-0.2885341, 0.7848389, -0.1350709, 1, 1, 1, 1, 1,
-0.2881272, -1.05196, -2.038301, 1, 1, 1, 1, 1,
-0.286227, 0.5409372, -0.9599381, 1, 1, 1, 1, 1,
-0.2830008, 1.268267, -1.59251, 1, 1, 1, 1, 1,
-0.2827608, 0.3053745, -0.5375288, 1, 1, 1, 1, 1,
-0.2799368, 0.8123733, 0.7465965, 1, 1, 1, 1, 1,
-0.2762375, 0.7096496, -0.7989297, 1, 1, 1, 1, 1,
-0.2762167, 0.6660378, -1.072462, 1, 1, 1, 1, 1,
-0.2724861, 0.746812, -0.5003916, 1, 1, 1, 1, 1,
-0.2703755, 0.661713, -1.9816, 1, 1, 1, 1, 1,
-0.2682518, 1.108593, -2.157725, 1, 1, 1, 1, 1,
-0.2650348, -0.2880442, -1.782879, 0, 0, 1, 1, 1,
-0.2573511, -0.6295958, -3.246269, 1, 0, 0, 1, 1,
-0.2544611, -0.8093558, -1.797809, 1, 0, 0, 1, 1,
-0.2528878, -0.9995998, -3.751829, 1, 0, 0, 1, 1,
-0.2526156, 1.202203, -2.301335, 1, 0, 0, 1, 1,
-0.2503561, 1.29813, 0.4580931, 1, 0, 0, 1, 1,
-0.245254, 0.8660622, 0.01500839, 0, 0, 0, 1, 1,
-0.2434458, 1.11235, -0.8882092, 0, 0, 0, 1, 1,
-0.2432338, 0.7834484, 0.181651, 0, 0, 0, 1, 1,
-0.2431451, 0.4879833, -0.4302211, 0, 0, 0, 1, 1,
-0.2413852, -0.6383082, -2.983407, 0, 0, 0, 1, 1,
-0.2406736, 0.6108348, -0.8393359, 0, 0, 0, 1, 1,
-0.2397569, 0.4470922, -1.002707, 0, 0, 0, 1, 1,
-0.2354234, -0.2945736, -1.699965, 1, 1, 1, 1, 1,
-0.2314682, 0.3215187, -0.9694171, 1, 1, 1, 1, 1,
-0.2310245, 1.787142, -1.655442, 1, 1, 1, 1, 1,
-0.2309444, 0.3697291, -1.217889, 1, 1, 1, 1, 1,
-0.2277097, 0.2437956, -1.95111, 1, 1, 1, 1, 1,
-0.2250727, -0.06322053, -1.679246, 1, 1, 1, 1, 1,
-0.2250693, -0.3905801, -5.291102, 1, 1, 1, 1, 1,
-0.222369, 1.55571, -2.583363, 1, 1, 1, 1, 1,
-0.221709, 0.2736442, 1.912077, 1, 1, 1, 1, 1,
-0.2207938, -1.703384, -3.370222, 1, 1, 1, 1, 1,
-0.2195033, -0.101872, -1.009494, 1, 1, 1, 1, 1,
-0.2128238, -0.2117295, -1.701657, 1, 1, 1, 1, 1,
-0.2075001, -1.777496, -4.078282, 1, 1, 1, 1, 1,
-0.2059186, -0.3643714, -1.525413, 1, 1, 1, 1, 1,
-0.2042923, 0.4112341, -0.1874871, 1, 1, 1, 1, 1,
-0.203531, -0.7537301, -3.633255, 0, 0, 1, 1, 1,
-0.2033972, -0.6595816, -2.354488, 1, 0, 0, 1, 1,
-0.200985, 1.447563, -0.6380077, 1, 0, 0, 1, 1,
-0.1997501, -0.307847, -3.429179, 1, 0, 0, 1, 1,
-0.1967764, 1.614638, 0.413167, 1, 0, 0, 1, 1,
-0.1964392, 1.867495, 0.3739248, 1, 0, 0, 1, 1,
-0.1959202, 1.1874, 1.284457, 0, 0, 0, 1, 1,
-0.1922488, 0.8351327, -0.3171996, 0, 0, 0, 1, 1,
-0.1903324, 1.234933, 0.5755972, 0, 0, 0, 1, 1,
-0.1861944, -0.04723947, -1.418758, 0, 0, 0, 1, 1,
-0.1831444, 1.852967, 0.4456096, 0, 0, 0, 1, 1,
-0.1810604, -1.02575, -4.777027, 0, 0, 0, 1, 1,
-0.1794418, -0.771422, -1.668036, 0, 0, 0, 1, 1,
-0.1793965, 0.8284165, -0.3833793, 1, 1, 1, 1, 1,
-0.1743255, -1.428532, -4.696437, 1, 1, 1, 1, 1,
-0.1714557, -0.7404048, -3.041964, 1, 1, 1, 1, 1,
-0.1585064, -1.241709, -0.4968392, 1, 1, 1, 1, 1,
-0.1579606, -0.6317849, -4.616428, 1, 1, 1, 1, 1,
-0.1576102, 0.01583257, -3.840428, 1, 1, 1, 1, 1,
-0.1512682, -0.2746091, -3.121636, 1, 1, 1, 1, 1,
-0.1512074, -0.9400889, -2.971234, 1, 1, 1, 1, 1,
-0.1505966, -0.4819726, -2.80656, 1, 1, 1, 1, 1,
-0.1497774, 1.056333, -1.961892, 1, 1, 1, 1, 1,
-0.1471679, -2.123029, -2.875512, 1, 1, 1, 1, 1,
-0.1466868, -0.7183564, -1.90681, 1, 1, 1, 1, 1,
-0.1458735, 0.09838975, -0.7828549, 1, 1, 1, 1, 1,
-0.145186, -0.1967511, -3.629796, 1, 1, 1, 1, 1,
-0.1426977, -0.4603849, -3.077626, 1, 1, 1, 1, 1,
-0.1364541, 0.3500254, -0.7462988, 0, 0, 1, 1, 1,
-0.1341785, -0.7257241, -2.364836, 1, 0, 0, 1, 1,
-0.1317587, 0.03842377, -3.084257, 1, 0, 0, 1, 1,
-0.1314152, 0.7175225, -0.4190798, 1, 0, 0, 1, 1,
-0.1280934, 0.7897141, -0.7085581, 1, 0, 0, 1, 1,
-0.1277118, -1.382108, -2.055701, 1, 0, 0, 1, 1,
-0.12452, 0.7461429, 0.6017076, 0, 0, 0, 1, 1,
-0.1233957, -2.274248, -4.68266, 0, 0, 0, 1, 1,
-0.1228533, 0.5917569, 1.52755, 0, 0, 0, 1, 1,
-0.1207406, -0.20354, -4.090302, 0, 0, 0, 1, 1,
-0.1194915, 0.5777029, 0.6421147, 0, 0, 0, 1, 1,
-0.1155532, 1.012864, 0.4087051, 0, 0, 0, 1, 1,
-0.1139003, -0.4306747, -1.216213, 0, 0, 0, 1, 1,
-0.1137375, 1.017435, -1.373325, 1, 1, 1, 1, 1,
-0.112777, 0.8574274, -0.2530777, 1, 1, 1, 1, 1,
-0.1112778, 1.793947, -0.6664739, 1, 1, 1, 1, 1,
-0.1084853, -1.679582, -1.489907, 1, 1, 1, 1, 1,
-0.1009064, 0.3567245, -0.376305, 1, 1, 1, 1, 1,
-0.1008282, 0.9297498, 0.1146922, 1, 1, 1, 1, 1,
-0.1007617, 0.3855065, -0.257426, 1, 1, 1, 1, 1,
-0.09885661, 0.2445249, 0.7154281, 1, 1, 1, 1, 1,
-0.09703764, -0.005551491, -1.048393, 1, 1, 1, 1, 1,
-0.09349291, -0.1654615, -2.552585, 1, 1, 1, 1, 1,
-0.09130052, 0.5680514, -0.2151124, 1, 1, 1, 1, 1,
-0.08730322, 0.2465238, 0.9182074, 1, 1, 1, 1, 1,
-0.08520761, -1.334874, -2.415668, 1, 1, 1, 1, 1,
-0.08097171, -1.370836, -3.827845, 1, 1, 1, 1, 1,
-0.07517081, 0.9476312, 0.4343316, 1, 1, 1, 1, 1,
-0.0744136, 0.3478774, 0.5626393, 0, 0, 1, 1, 1,
-0.07187088, -1.54054, -3.927024, 1, 0, 0, 1, 1,
-0.06999151, 1.375038, -0.6334753, 1, 0, 0, 1, 1,
-0.06973262, -0.3030225, -3.928687, 1, 0, 0, 1, 1,
-0.06551083, 0.3419482, -0.9797343, 1, 0, 0, 1, 1,
-0.06528857, -0.1181325, -2.964973, 1, 0, 0, 1, 1,
-0.06460299, 1.393387, -2.484165, 0, 0, 0, 1, 1,
-0.06203898, 0.009722934, -0.9691864, 0, 0, 0, 1, 1,
-0.0523853, -0.3848978, -4.257779, 0, 0, 0, 1, 1,
-0.05167095, -0.2597333, -3.686641, 0, 0, 0, 1, 1,
-0.05039234, -0.7216097, -2.989422, 0, 0, 0, 1, 1,
-0.0464278, -0.6295444, -2.644141, 0, 0, 0, 1, 1,
-0.0458259, 0.7308057, 0.3487918, 0, 0, 0, 1, 1,
-0.04012985, -0.2258906, -3.883238, 1, 1, 1, 1, 1,
-0.03844816, 1.658088, -0.0128224, 1, 1, 1, 1, 1,
-0.03575594, -0.9218522, -4.777784, 1, 1, 1, 1, 1,
-0.03488934, 0.8745395, -2.11383, 1, 1, 1, 1, 1,
-0.03323843, 0.6911141, 1.756599, 1, 1, 1, 1, 1,
-0.03251965, 0.09971208, -1.105341, 1, 1, 1, 1, 1,
-0.02771566, -0.4104061, -3.140861, 1, 1, 1, 1, 1,
-0.02103326, 1.60124, -0.2715669, 1, 1, 1, 1, 1,
-0.01523448, -0.138261, -2.23523, 1, 1, 1, 1, 1,
-0.01270453, 0.7034835, 1.032016, 1, 1, 1, 1, 1,
-0.001951517, -0.3563128, -2.426227, 1, 1, 1, 1, 1,
-0.000704886, 0.3566701, 0.5330101, 1, 1, 1, 1, 1,
0.001951398, 2.388959, -0.01486852, 1, 1, 1, 1, 1,
0.004040847, 0.7468087, -0.2326114, 1, 1, 1, 1, 1,
0.004334497, -0.4661627, 3.78978, 1, 1, 1, 1, 1,
0.00794574, 0.6561664, 0.3848426, 0, 0, 1, 1, 1,
0.008184156, 0.6385615, 0.4337353, 1, 0, 0, 1, 1,
0.01001948, 0.1366281, -0.5640268, 1, 0, 0, 1, 1,
0.01007525, 1.280415, 1.710088, 1, 0, 0, 1, 1,
0.01265456, -0.07362298, 2.364868, 1, 0, 0, 1, 1,
0.01673169, -0.8725227, 2.311588, 1, 0, 0, 1, 1,
0.02012814, -1.388207, 2.599157, 0, 0, 0, 1, 1,
0.02161646, 1.479849, 0.4568211, 0, 0, 0, 1, 1,
0.02447991, 1.862912, 0.5997353, 0, 0, 0, 1, 1,
0.0313357, 1.267904, -0.4818991, 0, 0, 0, 1, 1,
0.03318149, 0.1573657, 1.560222, 0, 0, 0, 1, 1,
0.03375645, -1.168391, 2.216616, 0, 0, 0, 1, 1,
0.03638836, 0.1729863, -0.61616, 0, 0, 0, 1, 1,
0.04105985, 0.4791539, -0.3283898, 1, 1, 1, 1, 1,
0.04131585, -0.5869078, 1.899549, 1, 1, 1, 1, 1,
0.04235609, -0.6720651, 4.581605, 1, 1, 1, 1, 1,
0.04363548, -0.865923, 3.238114, 1, 1, 1, 1, 1,
0.04537389, -0.4424115, 4.013342, 1, 1, 1, 1, 1,
0.05130512, -0.6122871, 2.459815, 1, 1, 1, 1, 1,
0.05433485, 1.125078, 0.8090783, 1, 1, 1, 1, 1,
0.05438925, -0.2737014, 4.541729, 1, 1, 1, 1, 1,
0.05967189, -0.4744562, 2.597707, 1, 1, 1, 1, 1,
0.0648417, -0.6039116, 2.529771, 1, 1, 1, 1, 1,
0.06504735, -0.9221187, 2.25714, 1, 1, 1, 1, 1,
0.06878716, 2.655555, -1.554133, 1, 1, 1, 1, 1,
0.06949996, -0.08587708, 3.867414, 1, 1, 1, 1, 1,
0.07168286, -0.3445518, 4.476964, 1, 1, 1, 1, 1,
0.0739581, -0.5429305, 1.301998, 1, 1, 1, 1, 1,
0.07717273, 1.250358, 0.1380094, 0, 0, 1, 1, 1,
0.07756785, -1.191653, 3.158886, 1, 0, 0, 1, 1,
0.08687887, -0.03173503, 2.374865, 1, 0, 0, 1, 1,
0.09255739, -0.2073542, 2.903179, 1, 0, 0, 1, 1,
0.09481119, -0.2659505, 3.468117, 1, 0, 0, 1, 1,
0.09518167, 1.363735, 0.1063437, 1, 0, 0, 1, 1,
0.09571272, -0.3188247, 1.999225, 0, 0, 0, 1, 1,
0.09880218, -0.9346011, 1.814821, 0, 0, 0, 1, 1,
0.1002818, -0.9877097, 2.848703, 0, 0, 0, 1, 1,
0.1061362, -0.1761545, 2.916415, 0, 0, 0, 1, 1,
0.109949, -0.2524199, 1.932798, 0, 0, 0, 1, 1,
0.1155315, 0.6339099, -0.5841557, 0, 0, 0, 1, 1,
0.1182824, 0.2006138, -0.159206, 0, 0, 0, 1, 1,
0.1193708, 1.213676, -0.06573234, 1, 1, 1, 1, 1,
0.1229928, -0.3510742, 4.153804, 1, 1, 1, 1, 1,
0.1255144, 0.01349695, 1.861718, 1, 1, 1, 1, 1,
0.125737, 0.4034603, -0.7878218, 1, 1, 1, 1, 1,
0.1322226, -1.359542, 2.391857, 1, 1, 1, 1, 1,
0.13389, -0.3747429, 3.774723, 1, 1, 1, 1, 1,
0.1363141, 0.6721941, 0.669363, 1, 1, 1, 1, 1,
0.1384405, -0.6355909, 5.243152, 1, 1, 1, 1, 1,
0.1404876, -0.2267296, 1.634843, 1, 1, 1, 1, 1,
0.1422353, 0.2291449, -0.526465, 1, 1, 1, 1, 1,
0.1431216, 0.9844876, 0.5773746, 1, 1, 1, 1, 1,
0.1460518, 1.135134, 0.8830824, 1, 1, 1, 1, 1,
0.1542566, -1.159774, 4.324284, 1, 1, 1, 1, 1,
0.1666382, 0.2478194, -0.1995798, 1, 1, 1, 1, 1,
0.1737331, 0.189209, 0.6454603, 1, 1, 1, 1, 1,
0.1769669, -0.1678113, 0.9413788, 0, 0, 1, 1, 1,
0.1791904, -0.3637352, 3.250645, 1, 0, 0, 1, 1,
0.1902343, 0.6216415, 1.383973, 1, 0, 0, 1, 1,
0.2060963, -0.3018961, 1.565975, 1, 0, 0, 1, 1,
0.2065681, 0.5691415, 1.235374, 1, 0, 0, 1, 1,
0.2073898, -1.072367, 4.659209, 1, 0, 0, 1, 1,
0.2097833, 0.0524192, 2.64457, 0, 0, 0, 1, 1,
0.2112143, -1.883067, 2.150974, 0, 0, 0, 1, 1,
0.2133421, 0.4437209, -1.544907, 0, 0, 0, 1, 1,
0.2162237, 0.3664049, -0.4104897, 0, 0, 0, 1, 1,
0.2184701, -1.225358, 3.318389, 0, 0, 0, 1, 1,
0.2189882, -1.001266, 1.027667, 0, 0, 0, 1, 1,
0.2246865, 0.7530667, 0.4409946, 0, 0, 0, 1, 1,
0.2267891, -0.1217297, 3.141211, 1, 1, 1, 1, 1,
0.2283928, -0.7558097, 3.306594, 1, 1, 1, 1, 1,
0.2329883, -0.2829734, 1.627102, 1, 1, 1, 1, 1,
0.2340435, 0.554467, -0.1552829, 1, 1, 1, 1, 1,
0.2345715, 0.2830258, -0.9330498, 1, 1, 1, 1, 1,
0.2359961, -2.609174, 2.487675, 1, 1, 1, 1, 1,
0.2383504, -0.4957135, 0.02689827, 1, 1, 1, 1, 1,
0.2431863, -0.4422719, 2.65168, 1, 1, 1, 1, 1,
0.2472012, 1.095628, -0.1777236, 1, 1, 1, 1, 1,
0.2498786, 1.403071, -1.864719, 1, 1, 1, 1, 1,
0.2557938, -0.9158286, 1.922786, 1, 1, 1, 1, 1,
0.2589627, 0.02700938, 0.4172818, 1, 1, 1, 1, 1,
0.2597503, -0.1512489, 2.753611, 1, 1, 1, 1, 1,
0.260518, 0.6870425, 1.236137, 1, 1, 1, 1, 1,
0.2626432, 1.78258, 0.6876776, 1, 1, 1, 1, 1,
0.2660167, 0.09026886, 3.590437, 0, 0, 1, 1, 1,
0.2711535, 0.2952178, 0.2250349, 1, 0, 0, 1, 1,
0.2734211, 0.1733818, 1.504864, 1, 0, 0, 1, 1,
0.2797701, -1.539328, 1.454377, 1, 0, 0, 1, 1,
0.2815956, 0.3730258, -0.7877385, 1, 0, 0, 1, 1,
0.2836281, -0.616508, 0.2916336, 1, 0, 0, 1, 1,
0.288583, 1.069332, -0.6247903, 0, 0, 0, 1, 1,
0.2936188, -1.898244, 3.082165, 0, 0, 0, 1, 1,
0.2998446, -0.2096814, 2.814499, 0, 0, 0, 1, 1,
0.3121947, 0.9746619, -0.6525137, 0, 0, 0, 1, 1,
0.3138055, -0.5040646, 4.786251, 0, 0, 0, 1, 1,
0.3183251, 0.0410895, 1.2313, 0, 0, 0, 1, 1,
0.3222673, -0.1413999, 1.144439, 0, 0, 0, 1, 1,
0.3331741, -0.4251183, 3.117835, 1, 1, 1, 1, 1,
0.3371736, -0.8631279, 3.764708, 1, 1, 1, 1, 1,
0.3403316, -1.829513, 2.253475, 1, 1, 1, 1, 1,
0.3423431, 1.926079, -2.41708, 1, 1, 1, 1, 1,
0.3456756, 0.7683976, -0.4004796, 1, 1, 1, 1, 1,
0.3502997, -1.673234, 2.523474, 1, 1, 1, 1, 1,
0.352114, -1.107566, 3.337687, 1, 1, 1, 1, 1,
0.3541304, 1.424218, -1.681513, 1, 1, 1, 1, 1,
0.3545992, 1.287357, 1.228745, 1, 1, 1, 1, 1,
0.3550156, 0.5179048, 1.526693, 1, 1, 1, 1, 1,
0.3579439, -1.203302, 3.034574, 1, 1, 1, 1, 1,
0.3596843, 0.7694148, -1.600933, 1, 1, 1, 1, 1,
0.3599804, -0.4011469, 2.380843, 1, 1, 1, 1, 1,
0.3648081, -2.369442, 2.747535, 1, 1, 1, 1, 1,
0.3683167, 0.8044883, 2.778503, 1, 1, 1, 1, 1,
0.3709927, -0.06714172, 0.7811095, 0, 0, 1, 1, 1,
0.3731694, -0.3256615, 2.22799, 1, 0, 0, 1, 1,
0.3753144, 0.8571473, -1.430236, 1, 0, 0, 1, 1,
0.3759641, -0.8328148, 1.600142, 1, 0, 0, 1, 1,
0.3788592, -0.4537489, 2.715789, 1, 0, 0, 1, 1,
0.3790826, 0.7090713, 0.7970895, 1, 0, 0, 1, 1,
0.3791565, 0.08148962, 0.2980776, 0, 0, 0, 1, 1,
0.3835621, 0.3110251, 3.555798, 0, 0, 0, 1, 1,
0.3841524, 0.3613271, 1.09593, 0, 0, 0, 1, 1,
0.3860916, -1.143799, 2.768305, 0, 0, 0, 1, 1,
0.3905397, 0.1517978, 0.07663842, 0, 0, 0, 1, 1,
0.3906244, -0.3380975, 1.750219, 0, 0, 0, 1, 1,
0.391132, -1.607064, 1.830068, 0, 0, 0, 1, 1,
0.3911527, -0.6597275, 2.215697, 1, 1, 1, 1, 1,
0.3916294, -0.6384954, 2.39672, 1, 1, 1, 1, 1,
0.3924672, -0.2552007, 4.045405, 1, 1, 1, 1, 1,
0.396468, -1.287852, 3.474789, 1, 1, 1, 1, 1,
0.3977474, -0.3162709, 2.898469, 1, 1, 1, 1, 1,
0.3985732, 0.3885682, 0.6057076, 1, 1, 1, 1, 1,
0.3998366, -0.7021238, 1.924655, 1, 1, 1, 1, 1,
0.4040378, 1.137397, -1.540398, 1, 1, 1, 1, 1,
0.4083412, 0.3671269, 0.09198786, 1, 1, 1, 1, 1,
0.4120581, 0.4997451, -0.4446171, 1, 1, 1, 1, 1,
0.412405, 0.02752817, 1.736892, 1, 1, 1, 1, 1,
0.4138849, -0.1263995, 1.646564, 1, 1, 1, 1, 1,
0.4195419, -1.944205, 3.745588, 1, 1, 1, 1, 1,
0.4202887, 0.3970621, -0.07702313, 1, 1, 1, 1, 1,
0.4325851, 1.117414, 1.110411, 1, 1, 1, 1, 1,
0.4355738, 2.19493, -1.314956, 0, 0, 1, 1, 1,
0.4359602, 0.1207205, 0.3763582, 1, 0, 0, 1, 1,
0.4365965, 0.2982233, 0.9017662, 1, 0, 0, 1, 1,
0.4380094, -1.833985, 3.073954, 1, 0, 0, 1, 1,
0.4389831, 1.28181, 0.620841, 1, 0, 0, 1, 1,
0.4393167, 0.2985368, 2.426857, 1, 0, 0, 1, 1,
0.4433823, -1.386591, 2.317404, 0, 0, 0, 1, 1,
0.4442558, -0.732722, 2.028457, 0, 0, 0, 1, 1,
0.4491439, 0.03168504, 0.7639205, 0, 0, 0, 1, 1,
0.4502407, 0.4077122, -0.9133197, 0, 0, 0, 1, 1,
0.4539436, -0.7434009, 4.028893, 0, 0, 0, 1, 1,
0.4564442, -1.256938, 2.968288, 0, 0, 0, 1, 1,
0.4580913, 1.590661, 1.426048, 0, 0, 0, 1, 1,
0.4591116, 0.9777164, 1.457965, 1, 1, 1, 1, 1,
0.4669747, -1.015643, 2.743967, 1, 1, 1, 1, 1,
0.4680069, -1.037014, 2.422212, 1, 1, 1, 1, 1,
0.4736846, -1.059144, 2.689446, 1, 1, 1, 1, 1,
0.4739447, 0.3913217, -0.225508, 1, 1, 1, 1, 1,
0.4753214, 1.01584, 0.055042, 1, 1, 1, 1, 1,
0.4757268, 0.3760203, -0.2883017, 1, 1, 1, 1, 1,
0.4784856, -0.8311128, 2.591127, 1, 1, 1, 1, 1,
0.4863257, -0.1392333, 0.3911158, 1, 1, 1, 1, 1,
0.4924729, 0.2740148, 1.266075, 1, 1, 1, 1, 1,
0.5035267, -1.977779, 2.804052, 1, 1, 1, 1, 1,
0.51108, 1.224882, -0.1302987, 1, 1, 1, 1, 1,
0.5164178, -0.06863868, 3.816795, 1, 1, 1, 1, 1,
0.5265737, 0.2383682, 0.2981418, 1, 1, 1, 1, 1,
0.5272807, -0.09060562, 0.5042004, 1, 1, 1, 1, 1,
0.529853, 0.1333396, 0.3204106, 0, 0, 1, 1, 1,
0.5321175, 0.9347261, 1.009153, 1, 0, 0, 1, 1,
0.5353745, -0.4823177, 3.285838, 1, 0, 0, 1, 1,
0.5396143, 1.249336, 1.781229, 1, 0, 0, 1, 1,
0.5440698, -0.8075558, 3.555645, 1, 0, 0, 1, 1,
0.5463982, 0.7904, -1.40488, 1, 0, 0, 1, 1,
0.5565484, 0.933665, -1.124329, 0, 0, 0, 1, 1,
0.5610192, -0.7369992, 2.523377, 0, 0, 0, 1, 1,
0.5610378, -2.407811, 5.923488, 0, 0, 0, 1, 1,
0.5612233, 0.3383218, -1.168572, 0, 0, 0, 1, 1,
0.5656148, 0.151538, 1.485632, 0, 0, 0, 1, 1,
0.5675735, -0.253769, 1.52298, 0, 0, 0, 1, 1,
0.5696283, 1.410651, 0.6920747, 0, 0, 0, 1, 1,
0.5724234, -1.020856, 2.982504, 1, 1, 1, 1, 1,
0.5772573, 1.007163, 1.39234, 1, 1, 1, 1, 1,
0.5800967, -0.1839781, 0.6371531, 1, 1, 1, 1, 1,
0.5805697, 1.332772, 0.1660591, 1, 1, 1, 1, 1,
0.5856538, 0.8196019, 0.5181088, 1, 1, 1, 1, 1,
0.585704, -0.4652539, 1.501518, 1, 1, 1, 1, 1,
0.5895299, -0.3980071, 3.402246, 1, 1, 1, 1, 1,
0.592265, 0.1979248, -0.9148947, 1, 1, 1, 1, 1,
0.5924991, -0.8964606, 2.680686, 1, 1, 1, 1, 1,
0.5940411, 1.585573, 0.1225029, 1, 1, 1, 1, 1,
0.5969445, 0.09815355, 1.122004, 1, 1, 1, 1, 1,
0.5981351, 1.524992, 0.872397, 1, 1, 1, 1, 1,
0.6061112, 1.330184, -0.09340054, 1, 1, 1, 1, 1,
0.6065934, 0.04720935, 0.9489128, 1, 1, 1, 1, 1,
0.6088094, 0.2009145, -0.1543708, 1, 1, 1, 1, 1,
0.6142979, 0.548366, 2.46326, 0, 0, 1, 1, 1,
0.6151673, -1.9938, 2.893611, 1, 0, 0, 1, 1,
0.6152827, 1.30963, 1.192493, 1, 0, 0, 1, 1,
0.617601, 1.012995, 1.170368, 1, 0, 0, 1, 1,
0.6203759, -0.08204491, 2.789459, 1, 0, 0, 1, 1,
0.6241677, 1.53472, 1.098635, 1, 0, 0, 1, 1,
0.6253882, -0.7385353, 0.6761217, 0, 0, 0, 1, 1,
0.6315528, 0.8113638, 0.2857129, 0, 0, 0, 1, 1,
0.6336917, -0.7607092, 2.559266, 0, 0, 0, 1, 1,
0.6379327, -1.502683, 0.2286331, 0, 0, 0, 1, 1,
0.6411489, 0.468143, 1.291925, 0, 0, 0, 1, 1,
0.6425531, 0.09199434, 0.8961072, 0, 0, 0, 1, 1,
0.6437624, 0.9242712, 0.6131383, 0, 0, 0, 1, 1,
0.644597, -0.2487836, 1.434257, 1, 1, 1, 1, 1,
0.6460052, 0.7985461, 0.3383029, 1, 1, 1, 1, 1,
0.6501444, -0.4348988, -0.000727516, 1, 1, 1, 1, 1,
0.6535859, -0.7227412, 1.152334, 1, 1, 1, 1, 1,
0.6542532, 1.212741, 0.760213, 1, 1, 1, 1, 1,
0.6570271, 1.513984, -0.2207721, 1, 1, 1, 1, 1,
0.6577012, -0.006021032, 2.312512, 1, 1, 1, 1, 1,
0.6587548, 0.9669931, -0.3057441, 1, 1, 1, 1, 1,
0.6597193, 1.20471, 1.78751, 1, 1, 1, 1, 1,
0.6602476, 0.3413381, 1.48563, 1, 1, 1, 1, 1,
0.6627805, -0.1759894, 4.474325, 1, 1, 1, 1, 1,
0.6651044, 1.71642, -0.1577198, 1, 1, 1, 1, 1,
0.6717609, 0.02496278, 2.597121, 1, 1, 1, 1, 1,
0.675428, -2.268538, 1.514425, 1, 1, 1, 1, 1,
0.6775384, -1.814515, 3.790916, 1, 1, 1, 1, 1,
0.6838217, 1.166649, 0.9531747, 0, 0, 1, 1, 1,
0.6859682, -0.4924367, 3.070945, 1, 0, 0, 1, 1,
0.6860976, -0.2618932, 2.266754, 1, 0, 0, 1, 1,
0.6906039, 1.79025, 1.287976, 1, 0, 0, 1, 1,
0.6909615, -0.08126385, 2.749247, 1, 0, 0, 1, 1,
0.6934561, 0.05124098, 0.8834894, 1, 0, 0, 1, 1,
0.6949224, 0.1587881, 1.559799, 0, 0, 0, 1, 1,
0.6981567, 1.042557, -0.6848142, 0, 0, 0, 1, 1,
0.6996041, -0.04971985, 0.8470422, 0, 0, 0, 1, 1,
0.7021112, 0.9509119, 0.02591449, 0, 0, 0, 1, 1,
0.7040411, -0.4512405, 0.2595344, 0, 0, 0, 1, 1,
0.7066519, -0.2439662, 4.943948, 0, 0, 0, 1, 1,
0.71297, 1.066285, -1.258731, 0, 0, 0, 1, 1,
0.7133254, -0.1068147, 0.8407168, 1, 1, 1, 1, 1,
0.7138448, 0.8869179, 0.6505362, 1, 1, 1, 1, 1,
0.7237898, -0.01110799, 1.370727, 1, 1, 1, 1, 1,
0.7281089, -0.1614973, 2.673801, 1, 1, 1, 1, 1,
0.7326987, -0.4314913, 3.704901, 1, 1, 1, 1, 1,
0.7383464, 0.8728544, 1.484115, 1, 1, 1, 1, 1,
0.7448004, -0.3452798, 3.327697, 1, 1, 1, 1, 1,
0.7482483, -1.189172, 2.322174, 1, 1, 1, 1, 1,
0.7551653, -1.394269, 3.931495, 1, 1, 1, 1, 1,
0.75871, 1.056564, -0.3780708, 1, 1, 1, 1, 1,
0.7592715, 1.064409, 1.632044, 1, 1, 1, 1, 1,
0.7595873, 0.0645951, 0.6068718, 1, 1, 1, 1, 1,
0.763571, 0.02102467, 1.18476, 1, 1, 1, 1, 1,
0.7677881, 0.3967217, 2.535501, 1, 1, 1, 1, 1,
0.7698756, -0.1859804, 0.8788956, 1, 1, 1, 1, 1,
0.7740098, 1.534641, 0.7644293, 0, 0, 1, 1, 1,
0.7742432, -0.3574902, 2.389886, 1, 0, 0, 1, 1,
0.7832522, -1.556474, 4.173057, 1, 0, 0, 1, 1,
0.7868223, -0.009048524, 1.861573, 1, 0, 0, 1, 1,
0.7899798, 1.294808, 0.6161687, 1, 0, 0, 1, 1,
0.7921496, -0.1469063, 1.913787, 1, 0, 0, 1, 1,
0.7979099, -2.325851, 3.546257, 0, 0, 0, 1, 1,
0.803349, 0.2875985, -0.1225645, 0, 0, 0, 1, 1,
0.8072244, -0.1006981, -0.8531283, 0, 0, 0, 1, 1,
0.8080858, 0.2664195, 2.082942, 0, 0, 0, 1, 1,
0.8094243, -0.3629528, 0.4044691, 0, 0, 0, 1, 1,
0.8140151, -2.510857, 2.650332, 0, 0, 0, 1, 1,
0.8184564, -0.4460641, 1.587467, 0, 0, 0, 1, 1,
0.81925, 0.03095571, 2.464227, 1, 1, 1, 1, 1,
0.820717, 0.7077456, 1.045808, 1, 1, 1, 1, 1,
0.8215988, -1.037479, 0.8206314, 1, 1, 1, 1, 1,
0.8236965, -0.8957514, 2.07797, 1, 1, 1, 1, 1,
0.8297223, 0.1029728, 2.15161, 1, 1, 1, 1, 1,
0.8322343, 0.8213957, 1.412999, 1, 1, 1, 1, 1,
0.8426737, 0.5561269, 1.556433, 1, 1, 1, 1, 1,
0.8472241, 0.5398341, 1.374269, 1, 1, 1, 1, 1,
0.8480088, -1.426535, 1.922854, 1, 1, 1, 1, 1,
0.8627018, 0.03242278, 2.026033, 1, 1, 1, 1, 1,
0.8758046, 0.2963217, 0.5939469, 1, 1, 1, 1, 1,
0.8835024, -0.2128481, 2.218887, 1, 1, 1, 1, 1,
0.8853883, 0.7292025, 0.4887883, 1, 1, 1, 1, 1,
0.8899358, -0.5689463, 3.57051, 1, 1, 1, 1, 1,
0.8940451, -0.8698855, 1.741064, 1, 1, 1, 1, 1,
0.8968719, -1.98792, 2.622181, 0, 0, 1, 1, 1,
0.9054969, 0.9065986, 1.176216, 1, 0, 0, 1, 1,
0.9063488, 0.1513354, 0.8233687, 1, 0, 0, 1, 1,
0.9128754, -0.1054765, 0.3604355, 1, 0, 0, 1, 1,
0.9136221, 0.9538821, 0.2142913, 1, 0, 0, 1, 1,
0.9170793, -0.7502904, 1.904637, 1, 0, 0, 1, 1,
0.9202772, -2.158819, 2.721637, 0, 0, 0, 1, 1,
0.9255151, -1.594089, 2.269229, 0, 0, 0, 1, 1,
0.9294918, 1.404199, 0.491054, 0, 0, 0, 1, 1,
0.9403052, 1.451996, 0.1228484, 0, 0, 0, 1, 1,
0.945316, -0.649823, 2.806271, 0, 0, 0, 1, 1,
0.9672254, -0.3753597, 2.10466, 0, 0, 0, 1, 1,
0.9689163, -0.06344862, 0.4769864, 0, 0, 0, 1, 1,
0.9706792, 0.4626979, 1.023935, 1, 1, 1, 1, 1,
0.9740264, -2.039776, 3.829542, 1, 1, 1, 1, 1,
0.9758921, -0.05701852, 1.412825, 1, 1, 1, 1, 1,
0.9789517, -1.204898, 0.6529711, 1, 1, 1, 1, 1,
0.9801828, -0.1405315, 3.933466, 1, 1, 1, 1, 1,
0.9811479, -0.8969462, 2.018485, 1, 1, 1, 1, 1,
0.9995809, -0.8996477, 2.09538, 1, 1, 1, 1, 1,
1.005026, 0.4226657, 0.09361374, 1, 1, 1, 1, 1,
1.009248, 0.711931, 2.106224, 1, 1, 1, 1, 1,
1.010294, 0.419049, 2.104485, 1, 1, 1, 1, 1,
1.013281, -0.6162534, 4.127786, 1, 1, 1, 1, 1,
1.021201, -1.055427, 1.815671, 1, 1, 1, 1, 1,
1.028518, -1.364194, 3.274479, 1, 1, 1, 1, 1,
1.02863, 0.02330281, 2.491052, 1, 1, 1, 1, 1,
1.030291, 0.3705477, 0.8237329, 1, 1, 1, 1, 1,
1.031194, -1.11439, 1.320822, 0, 0, 1, 1, 1,
1.032039, -0.07493773, 0.8717952, 1, 0, 0, 1, 1,
1.036563, 1.773827, 0.07557402, 1, 0, 0, 1, 1,
1.045611, 0.9125417, 2.277514, 1, 0, 0, 1, 1,
1.04629, -1.127189, 4.274418, 1, 0, 0, 1, 1,
1.054126, -0.7598021, 2.122991, 1, 0, 0, 1, 1,
1.05446, 1.595795, -0.2017077, 0, 0, 0, 1, 1,
1.058309, -0.4232465, 0.567587, 0, 0, 0, 1, 1,
1.062223, 0.4063211, 0.2836924, 0, 0, 0, 1, 1,
1.062963, 1.647614, 0.4288561, 0, 0, 0, 1, 1,
1.069821, -0.4736264, 1.720811, 0, 0, 0, 1, 1,
1.070627, -0.2055071, 3.50279, 0, 0, 0, 1, 1,
1.07188, -0.2096159, 2.366249, 0, 0, 0, 1, 1,
1.072573, -0.1516863, 2.133676, 1, 1, 1, 1, 1,
1.080838, -0.03611869, 3.247948, 1, 1, 1, 1, 1,
1.081763, -0.02910636, 0.7244113, 1, 1, 1, 1, 1,
1.082418, 0.7072577, -0.4326388, 1, 1, 1, 1, 1,
1.084951, 0.02263922, 1.779144, 1, 1, 1, 1, 1,
1.087999, -0.9968212, 3.117542, 1, 1, 1, 1, 1,
1.092673, 0.5025748, 2.796875, 1, 1, 1, 1, 1,
1.093829, -1.07619, 4.138606, 1, 1, 1, 1, 1,
1.095201, -1.344601, 1.339231, 1, 1, 1, 1, 1,
1.097259, 1.413407, 1.983436, 1, 1, 1, 1, 1,
1.098545, -0.1225092, 2.946874, 1, 1, 1, 1, 1,
1.100062, 0.9788563, 2.040205, 1, 1, 1, 1, 1,
1.102472, 0.8485279, 0.537046, 1, 1, 1, 1, 1,
1.106388, 0.06143928, 2.679759, 1, 1, 1, 1, 1,
1.107486, 1.596584, 1.356098, 1, 1, 1, 1, 1,
1.108452, -0.529118, 0.3650379, 0, 0, 1, 1, 1,
1.11238, 0.6935886, 0.4262333, 1, 0, 0, 1, 1,
1.114448, -0.1329879, 1.14149, 1, 0, 0, 1, 1,
1.119751, 0.2104308, 1.042213, 1, 0, 0, 1, 1,
1.126699, -1.305646, 1.604572, 1, 0, 0, 1, 1,
1.130178, -1.082893, 3.658719, 1, 0, 0, 1, 1,
1.136673, -0.5739374, 2.226059, 0, 0, 0, 1, 1,
1.148267, -0.1938117, 3.462213, 0, 0, 0, 1, 1,
1.165403, 0.4290798, 1.882342, 0, 0, 0, 1, 1,
1.166315, 0.1913506, 1.234892, 0, 0, 0, 1, 1,
1.170558, -0.292907, 0.9888181, 0, 0, 0, 1, 1,
1.172925, -0.9666354, 1.421012, 0, 0, 0, 1, 1,
1.176873, -0.4966539, 2.719471, 0, 0, 0, 1, 1,
1.180976, 0.627713, 2.249696, 1, 1, 1, 1, 1,
1.189939, 1.707732, 0.4824173, 1, 1, 1, 1, 1,
1.19073, -1.242851, 2.080711, 1, 1, 1, 1, 1,
1.192038, -1.273466, 3.019542, 1, 1, 1, 1, 1,
1.199216, 1.279552, 3.074627, 1, 1, 1, 1, 1,
1.20472, -1.450885, 1.781077, 1, 1, 1, 1, 1,
1.207061, 0.1407811, 1.846939, 1, 1, 1, 1, 1,
1.221873, -1.502665, 3.124179, 1, 1, 1, 1, 1,
1.224092, 0.5133517, -0.5469677, 1, 1, 1, 1, 1,
1.231285, 0.7433513, 1.418189, 1, 1, 1, 1, 1,
1.23195, 0.4323402, 2.26508, 1, 1, 1, 1, 1,
1.242137, -0.05322738, 0.5712248, 1, 1, 1, 1, 1,
1.249041, 0.0006359557, 1.200972, 1, 1, 1, 1, 1,
1.255569, 2.096584, 1.817691, 1, 1, 1, 1, 1,
1.261822, -0.3434087, 2.654223, 1, 1, 1, 1, 1,
1.265671, -0.08419483, 1.139647, 0, 0, 1, 1, 1,
1.27094, 1.070815, 0.8390284, 1, 0, 0, 1, 1,
1.275843, -0.8526716, 2.685847, 1, 0, 0, 1, 1,
1.297126, -0.4575085, 1.537163, 1, 0, 0, 1, 1,
1.317668, 0.9579523, 0.5176515, 1, 0, 0, 1, 1,
1.328211, 1.060147, 1.821421, 1, 0, 0, 1, 1,
1.330142, 1.781553, -0.2588556, 0, 0, 0, 1, 1,
1.341844, 0.4928195, 0.788461, 0, 0, 0, 1, 1,
1.342453, -0.1864491, -0.3499509, 0, 0, 0, 1, 1,
1.345837, 0.4059971, 0.9402542, 0, 0, 0, 1, 1,
1.346301, -2.768158, 2.562695, 0, 0, 0, 1, 1,
1.346376, -0.9106538, 2.569366, 0, 0, 0, 1, 1,
1.353339, -1.214914, 3.820534, 0, 0, 0, 1, 1,
1.358478, 1.509492, 0.1099183, 1, 1, 1, 1, 1,
1.359476, 0.6903194, 1.896696, 1, 1, 1, 1, 1,
1.36135, -0.5476934, 2.618332, 1, 1, 1, 1, 1,
1.364427, -1.33603, 2.935365, 1, 1, 1, 1, 1,
1.382605, 1.285349, -0.02182827, 1, 1, 1, 1, 1,
1.394312, 0.7356634, 0.620591, 1, 1, 1, 1, 1,
1.398848, -0.01121468, 0.4569148, 1, 1, 1, 1, 1,
1.399352, 0.5124332, 1.852135, 1, 1, 1, 1, 1,
1.407825, 0.5858496, 0.8585159, 1, 1, 1, 1, 1,
1.408237, 1.865616, 2.514509, 1, 1, 1, 1, 1,
1.41529, -0.8316106, 2.374168, 1, 1, 1, 1, 1,
1.415725, 1.041855, 1.121835, 1, 1, 1, 1, 1,
1.416872, -0.8564163, 2.309714, 1, 1, 1, 1, 1,
1.423103, 0.4960767, 0.6423793, 1, 1, 1, 1, 1,
1.433114, 1.600049, 2.561171, 1, 1, 1, 1, 1,
1.446521, 0.6038162, 0.2320326, 0, 0, 1, 1, 1,
1.451078, -1.136409, 0.2821899, 1, 0, 0, 1, 1,
1.461778, -0.366179, 1.40625, 1, 0, 0, 1, 1,
1.475296, -0.8358604, 2.324858, 1, 0, 0, 1, 1,
1.478923, -0.197416, -0.1657949, 1, 0, 0, 1, 1,
1.479206, -0.4680439, 2.077683, 1, 0, 0, 1, 1,
1.479362, 0.04154733, -0.6147435, 0, 0, 0, 1, 1,
1.493543, -1.251503, 3.408316, 0, 0, 0, 1, 1,
1.501297, 0.6145393, -0.1951957, 0, 0, 0, 1, 1,
1.508623, 0.7210374, 1.740515, 0, 0, 0, 1, 1,
1.528311, 0.8047411, 1.524073, 0, 0, 0, 1, 1,
1.549309, 1.316148, -0.04333283, 0, 0, 0, 1, 1,
1.553035, 0.701197, 1.159727, 0, 0, 0, 1, 1,
1.563329, 0.3096662, 2.497307, 1, 1, 1, 1, 1,
1.567349, 0.8500985, 2.085275, 1, 1, 1, 1, 1,
1.579552, -0.4693695, 2.022596, 1, 1, 1, 1, 1,
1.579843, 0.04472078, 1.022252, 1, 1, 1, 1, 1,
1.584987, -3.6396, 3.409021, 1, 1, 1, 1, 1,
1.606604, -0.6142489, 2.493028, 1, 1, 1, 1, 1,
1.610397, 2.240158, -0.2831034, 1, 1, 1, 1, 1,
1.612194, -0.9060562, 1.238346, 1, 1, 1, 1, 1,
1.621028, 1.000847, 0.01830544, 1, 1, 1, 1, 1,
1.630641, -1.38804, 2.830796, 1, 1, 1, 1, 1,
1.650712, 0.2526534, 1.457576, 1, 1, 1, 1, 1,
1.659145, 0.4078636, -0.5177339, 1, 1, 1, 1, 1,
1.66406, 0.8492569, 0.4275716, 1, 1, 1, 1, 1,
1.68071, -1.293864, 0.3882898, 1, 1, 1, 1, 1,
1.686645, 0.8984416, 1.455409, 1, 1, 1, 1, 1,
1.718273, -0.4383059, 3.031115, 0, 0, 1, 1, 1,
1.753626, 0.4526739, 0.5533672, 1, 0, 0, 1, 1,
1.769219, -1.379449, 2.226924, 1, 0, 0, 1, 1,
1.787981, 0.5463638, -1.693319, 1, 0, 0, 1, 1,
1.803136, 0.07891546, 3.191542, 1, 0, 0, 1, 1,
1.807521, 1.113416, 1.050351, 1, 0, 0, 1, 1,
1.810682, 1.489547, -0.05731406, 0, 0, 0, 1, 1,
1.831803, 0.7509787, 0.5335969, 0, 0, 0, 1, 1,
1.832128, -1.038279, 2.702067, 0, 0, 0, 1, 1,
1.842188, -0.6971089, 1.708198, 0, 0, 0, 1, 1,
1.871135, -1.256696, 2.133711, 0, 0, 0, 1, 1,
1.877562, 0.4157122, 0.2571504, 0, 0, 0, 1, 1,
1.879296, 0.5105621, 1.590337, 0, 0, 0, 1, 1,
1.887123, -1.313979, 2.180885, 1, 1, 1, 1, 1,
1.888707, 0.3013388, 1.977706, 1, 1, 1, 1, 1,
1.900823, 0.2557049, 1.065707, 1, 1, 1, 1, 1,
1.920749, 0.01258632, 1.126585, 1, 1, 1, 1, 1,
1.926139, 0.1324605, 0.01910909, 1, 1, 1, 1, 1,
1.943559, -1.086212, 0.07094577, 1, 1, 1, 1, 1,
1.951254, 0.9502596, 1.832206, 1, 1, 1, 1, 1,
2.026882, -0.5900043, 0.69669, 1, 1, 1, 1, 1,
2.037485, 0.2333512, 2.194995, 1, 1, 1, 1, 1,
2.056439, 1.393677, 2.925519, 1, 1, 1, 1, 1,
2.066315, -0.2006898, 0.3016339, 1, 1, 1, 1, 1,
2.090441, -0.2530342, 3.164226, 1, 1, 1, 1, 1,
2.103796, -1.105362, 0.3347302, 1, 1, 1, 1, 1,
2.119391, 0.2192139, 3.117779, 1, 1, 1, 1, 1,
2.135426, 0.1219708, 2.229433, 1, 1, 1, 1, 1,
2.138689, -0.1624743, 1.695707, 0, 0, 1, 1, 1,
2.163875, -0.9854047, 3.886922, 1, 0, 0, 1, 1,
2.231314, 0.3193135, 1.948079, 1, 0, 0, 1, 1,
2.275104, 1.436878, 2.433345, 1, 0, 0, 1, 1,
2.279021, -0.6074252, 2.817109, 1, 0, 0, 1, 1,
2.292194, 0.8101671, 2.436299, 1, 0, 0, 1, 1,
2.292259, 0.7869031, 2.766121, 0, 0, 0, 1, 1,
2.293005, 1.067836, 1.337163, 0, 0, 0, 1, 1,
2.302716, -0.6351199, 1.578942, 0, 0, 0, 1, 1,
2.382092, 0.04374745, 1.299124, 0, 0, 0, 1, 1,
2.460455, -0.4087669, 2.880471, 0, 0, 0, 1, 1,
2.485732, 1.756346, -0.8372228, 0, 0, 0, 1, 1,
2.529546, -1.086438, 0.5696479, 0, 0, 0, 1, 1,
2.557731, 0.5167378, 0.4611989, 1, 1, 1, 1, 1,
2.598547, 1.279711, 0.9453473, 1, 1, 1, 1, 1,
2.735811, -0.8944414, 2.16693, 1, 1, 1, 1, 1,
2.762854, -0.1990463, 1.976853, 1, 1, 1, 1, 1,
2.782874, 0.9992294, -0.2397265, 1, 1, 1, 1, 1,
2.798919, 0.3982447, 0.4286806, 1, 1, 1, 1, 1,
2.82899, -0.1371717, 0.6372691, 1, 1, 1, 1, 1
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
var radius = 9.820982;
var distance = 34.49578;
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
mvMatrix.translate( 0.2656047, 0.2475522, -0.3161929 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.49578);
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
