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
-3.276456, 0.1458737, -1.116168, 1, 0, 0, 1,
-2.92119, -0.9487422, -2.175946, 1, 0.007843138, 0, 1,
-2.877023, 1.009572, -0.05377851, 1, 0.01176471, 0, 1,
-2.763388, 0.8841271, -0.6603535, 1, 0.01960784, 0, 1,
-2.680988, 0.2481412, -0.9949515, 1, 0.02352941, 0, 1,
-2.650651, 0.4745661, -0.1595667, 1, 0.03137255, 0, 1,
-2.554148, -1.586423, -2.993816, 1, 0.03529412, 0, 1,
-2.526205, -0.6755023, -2.377834, 1, 0.04313726, 0, 1,
-2.477904, 0.4221706, -0.703299, 1, 0.04705882, 0, 1,
-2.456233, 1.185503, -1.930181, 1, 0.05490196, 0, 1,
-2.408867, 0.833068, -1.859518, 1, 0.05882353, 0, 1,
-2.297605, 1.538289, -1.735436, 1, 0.06666667, 0, 1,
-2.281953, 1.407727, -2.908955, 1, 0.07058824, 0, 1,
-2.26277, 0.9702271, -0.08578913, 1, 0.07843138, 0, 1,
-2.218083, 1.808987, 0.153499, 1, 0.08235294, 0, 1,
-2.198631, -0.7135621, -1.868065, 1, 0.09019608, 0, 1,
-2.188976, 1.570235, 0.1108791, 1, 0.09411765, 0, 1,
-2.186385, 1.979169, -0.09388078, 1, 0.1019608, 0, 1,
-2.159439, 0.7647927, -2.099833, 1, 0.1098039, 0, 1,
-2.125356, 0.2621871, -1.675831, 1, 0.1137255, 0, 1,
-2.124782, -1.007885, -2.320752, 1, 0.1215686, 0, 1,
-2.086097, -1.300777, -2.184023, 1, 0.1254902, 0, 1,
-2.077361, -0.2390777, -2.714528, 1, 0.1333333, 0, 1,
-2.044832, 0.6816764, -1.663636, 1, 0.1372549, 0, 1,
-2.026569, -0.7390627, -1.376618, 1, 0.145098, 0, 1,
-2.007451, 0.8720999, -0.5571873, 1, 0.1490196, 0, 1,
-1.967766, 0.5216929, -0.4322191, 1, 0.1568628, 0, 1,
-1.933973, 0.5415128, -0.1543037, 1, 0.1607843, 0, 1,
-1.923846, -0.8697463, -1.432876, 1, 0.1686275, 0, 1,
-1.920513, 0.9358202, -0.3261228, 1, 0.172549, 0, 1,
-1.91668, -1.670291, -1.177648, 1, 0.1803922, 0, 1,
-1.915154, 1.57915, -1.4674, 1, 0.1843137, 0, 1,
-1.910255, -0.9466273, -1.640983, 1, 0.1921569, 0, 1,
-1.905478, -2.161564, -2.208833, 1, 0.1960784, 0, 1,
-1.890113, -0.05663884, -2.349344, 1, 0.2039216, 0, 1,
-1.872519, -1.231254, -0.9273288, 1, 0.2117647, 0, 1,
-1.871735, 1.43701, -0.2879164, 1, 0.2156863, 0, 1,
-1.869184, 0.7795054, -1.200879, 1, 0.2235294, 0, 1,
-1.849416, 0.2415244, -2.56214, 1, 0.227451, 0, 1,
-1.837487, -1.616059, -2.827162, 1, 0.2352941, 0, 1,
-1.835782, 0.2608516, -1.029247, 1, 0.2392157, 0, 1,
-1.834049, 1.641676, -1.352782, 1, 0.2470588, 0, 1,
-1.824802, 2.2931, -0.1731325, 1, 0.2509804, 0, 1,
-1.81955, -0.2754475, -2.115322, 1, 0.2588235, 0, 1,
-1.810702, 0.8388029, -1.573655, 1, 0.2627451, 0, 1,
-1.799231, -0.8372165, -3.202117, 1, 0.2705882, 0, 1,
-1.77853, 0.4303955, -0.6819499, 1, 0.2745098, 0, 1,
-1.775898, 1.331288, 0.0471622, 1, 0.282353, 0, 1,
-1.767768, 0.3943145, -0.8325992, 1, 0.2862745, 0, 1,
-1.765178, 0.3470078, -3.120241, 1, 0.2941177, 0, 1,
-1.753758, -0.9106139, -3.68634, 1, 0.3019608, 0, 1,
-1.746198, -0.9174759, -3.272729, 1, 0.3058824, 0, 1,
-1.709439, -1.340958, -2.757412, 1, 0.3137255, 0, 1,
-1.709084, -0.04737241, -2.147015, 1, 0.3176471, 0, 1,
-1.682193, -0.5785377, -1.32255, 1, 0.3254902, 0, 1,
-1.675235, 0.9359631, -0.9355824, 1, 0.3294118, 0, 1,
-1.670009, -1.810146, -2.406809, 1, 0.3372549, 0, 1,
-1.645486, 1.469181, -0.5449371, 1, 0.3411765, 0, 1,
-1.617077, -1.777717, -2.333005, 1, 0.3490196, 0, 1,
-1.615033, 0.217913, -3.178271, 1, 0.3529412, 0, 1,
-1.604919, -0.5417665, -2.444545, 1, 0.3607843, 0, 1,
-1.596863, -0.2686002, -1.661959, 1, 0.3647059, 0, 1,
-1.594752, -0.1825574, -3.015333, 1, 0.372549, 0, 1,
-1.588839, -1.669792, -2.25669, 1, 0.3764706, 0, 1,
-1.587776, -0.1663719, -2.984292, 1, 0.3843137, 0, 1,
-1.583841, 1.83092, -0.6220453, 1, 0.3882353, 0, 1,
-1.582058, 1.804577, -0.8108351, 1, 0.3960784, 0, 1,
-1.5766, 0.4449924, -2.412886, 1, 0.4039216, 0, 1,
-1.548865, -0.05976136, -3.055987, 1, 0.4078431, 0, 1,
-1.546344, -1.030977, -2.406549, 1, 0.4156863, 0, 1,
-1.536966, 1.262773, 0.1305593, 1, 0.4196078, 0, 1,
-1.534704, -0.509427, -2.1311, 1, 0.427451, 0, 1,
-1.532457, -1.531688, -2.021075, 1, 0.4313726, 0, 1,
-1.528133, 0.7388203, -0.7276935, 1, 0.4392157, 0, 1,
-1.516906, -0.4698148, -1.885607, 1, 0.4431373, 0, 1,
-1.507039, -0.4192703, -1.766135, 1, 0.4509804, 0, 1,
-1.500554, -0.320687, -1.683143, 1, 0.454902, 0, 1,
-1.499264, 0.6749089, 0.610859, 1, 0.4627451, 0, 1,
-1.497488, -0.1670586, -1.228784, 1, 0.4666667, 0, 1,
-1.488462, -1.427428, -2.547355, 1, 0.4745098, 0, 1,
-1.474756, -1.118004, -1.554073, 1, 0.4784314, 0, 1,
-1.467324, 1.148616, 0.320955, 1, 0.4862745, 0, 1,
-1.462865, -2.111508, -2.03165, 1, 0.4901961, 0, 1,
-1.461096, -0.09945985, -2.882358, 1, 0.4980392, 0, 1,
-1.45829, -0.728688, -2.964233, 1, 0.5058824, 0, 1,
-1.450498, -1.316624, -2.111931, 1, 0.509804, 0, 1,
-1.450239, -0.2005059, -3.018851, 1, 0.5176471, 0, 1,
-1.447899, 1.327839, -2.256032, 1, 0.5215687, 0, 1,
-1.416643, 0.80124, -1.998563, 1, 0.5294118, 0, 1,
-1.416102, 1.758397, -1.042512, 1, 0.5333334, 0, 1,
-1.402358, -0.9161785, -0.06176115, 1, 0.5411765, 0, 1,
-1.387887, -1.728629, -3.86302, 1, 0.5450981, 0, 1,
-1.383497, -0.7539344, -2.190378, 1, 0.5529412, 0, 1,
-1.370437, 1.67048, -1.246258, 1, 0.5568628, 0, 1,
-1.369457, 0.06317282, -1.016309, 1, 0.5647059, 0, 1,
-1.364717, 1.13372, 0.7082149, 1, 0.5686275, 0, 1,
-1.358355, 1.917775, -0.321872, 1, 0.5764706, 0, 1,
-1.345933, 0.5245185, -0.9291084, 1, 0.5803922, 0, 1,
-1.345802, 1.103373, 0.5383239, 1, 0.5882353, 0, 1,
-1.338524, -0.5573666, -1.441162, 1, 0.5921569, 0, 1,
-1.335162, 1.686462, -0.6259874, 1, 0.6, 0, 1,
-1.334944, 1.217594, -2.359075, 1, 0.6078432, 0, 1,
-1.331699, 0.8349983, -1.769564, 1, 0.6117647, 0, 1,
-1.326034, 0.821168, -1.410679, 1, 0.6196079, 0, 1,
-1.321673, 3.054412, -1.637068, 1, 0.6235294, 0, 1,
-1.314056, -0.6926588, -2.658796, 1, 0.6313726, 0, 1,
-1.298967, 0.1396861, -2.642199, 1, 0.6352941, 0, 1,
-1.287276, -0.8327987, -2.374313, 1, 0.6431373, 0, 1,
-1.284489, -0.1840235, -1.024876, 1, 0.6470588, 0, 1,
-1.276675, -0.1786739, 0.5760712, 1, 0.654902, 0, 1,
-1.274698, 0.3682831, -2.790494, 1, 0.6588235, 0, 1,
-1.273068, -1.886569, -3.716269, 1, 0.6666667, 0, 1,
-1.269101, 0.08091082, 0.3214916, 1, 0.6705883, 0, 1,
-1.265122, 1.869066, -0.8436996, 1, 0.6784314, 0, 1,
-1.261681, 1.770858, -0.8008547, 1, 0.682353, 0, 1,
-1.256954, -0.01577949, -1.17907, 1, 0.6901961, 0, 1,
-1.256399, 0.3930871, -1.125359, 1, 0.6941177, 0, 1,
-1.250918, -0.7557628, -3.214461, 1, 0.7019608, 0, 1,
-1.246661, 0.6705949, -1.115033, 1, 0.7098039, 0, 1,
-1.239029, 1.571646, -0.5288991, 1, 0.7137255, 0, 1,
-1.234739, 1.840827, -0.02482448, 1, 0.7215686, 0, 1,
-1.23451, -0.5458677, -3.78996, 1, 0.7254902, 0, 1,
-1.225018, 0.2498744, 0.6814225, 1, 0.7333333, 0, 1,
-1.21136, 2.131533, -1.65427, 1, 0.7372549, 0, 1,
-1.207373, 0.144376, -0.4989201, 1, 0.7450981, 0, 1,
-1.20735, 1.431729, -0.6602473, 1, 0.7490196, 0, 1,
-1.207103, 0.5558318, -0.2644105, 1, 0.7568628, 0, 1,
-1.207069, -1.465041, -2.598874, 1, 0.7607843, 0, 1,
-1.204422, 2.4175, -0.07878302, 1, 0.7686275, 0, 1,
-1.194779, -1.550109, -2.544531, 1, 0.772549, 0, 1,
-1.191886, -0.4551466, -1.853799, 1, 0.7803922, 0, 1,
-1.184179, 1.421002, -0.4047396, 1, 0.7843137, 0, 1,
-1.181004, 1.003894, -1.351342, 1, 0.7921569, 0, 1,
-1.178953, -1.826614, -1.182607, 1, 0.7960784, 0, 1,
-1.174811, -1.032826, -1.826178, 1, 0.8039216, 0, 1,
-1.172857, 0.8363778, -1.104628, 1, 0.8117647, 0, 1,
-1.17265, 1.460432, -0.05878912, 1, 0.8156863, 0, 1,
-1.158631, -0.4532376, -1.636727, 1, 0.8235294, 0, 1,
-1.158113, 0.7506399, -1.223077, 1, 0.827451, 0, 1,
-1.140492, -0.4224235, -1.670136, 1, 0.8352941, 0, 1,
-1.139176, 1.427506, -0.5432017, 1, 0.8392157, 0, 1,
-1.137333, -1.577787, -4.153098, 1, 0.8470588, 0, 1,
-1.131396, 0.4355098, -1.207119, 1, 0.8509804, 0, 1,
-1.121356, -0.9971077, -2.299236, 1, 0.8588235, 0, 1,
-1.121193, -0.7516978, -1.841034, 1, 0.8627451, 0, 1,
-1.118425, -1.51189, -2.66743, 1, 0.8705882, 0, 1,
-1.118075, -0.4057114, -1.738823, 1, 0.8745098, 0, 1,
-1.113192, 2.596469, 1.138638, 1, 0.8823529, 0, 1,
-1.107755, -0.178938, -2.590527, 1, 0.8862745, 0, 1,
-1.096252, -0.5670087, -1.448858, 1, 0.8941177, 0, 1,
-1.09282, -1.249518, -2.142203, 1, 0.8980392, 0, 1,
-1.088146, -0.6504072, -1.615353, 1, 0.9058824, 0, 1,
-1.074563, 0.4500918, 0.551001, 1, 0.9137255, 0, 1,
-1.072821, -1.023803, -3.231812, 1, 0.9176471, 0, 1,
-1.072203, -1.688544, -1.630252, 1, 0.9254902, 0, 1,
-1.067751, -1.195969, -1.005024, 1, 0.9294118, 0, 1,
-1.064262, -1.244335, -1.20239, 1, 0.9372549, 0, 1,
-1.060912, 0.03595353, -0.9586911, 1, 0.9411765, 0, 1,
-1.060824, -1.204688, -4.143709, 1, 0.9490196, 0, 1,
-1.049739, -0.4850836, -1.800411, 1, 0.9529412, 0, 1,
-1.045357, -2.113555, -2.865259, 1, 0.9607843, 0, 1,
-1.044377, 0.3132539, -3.392608, 1, 0.9647059, 0, 1,
-1.036462, 0.4811929, -0.7924311, 1, 0.972549, 0, 1,
-1.031987, -0.4362931, 0.03726909, 1, 0.9764706, 0, 1,
-1.027141, 0.7850885, 2.335716, 1, 0.9843137, 0, 1,
-1.023477, 0.6339946, -1.997064, 1, 0.9882353, 0, 1,
-1.02111, -0.7872648, -3.638988, 1, 0.9960784, 0, 1,
-1.007808, -2.010031, -2.194841, 0.9960784, 1, 0, 1,
-1.00669, -0.9084377, -4.055197, 0.9921569, 1, 0, 1,
-1.006383, -0.9977195, -0.9448287, 0.9843137, 1, 0, 1,
-0.9949575, 1.405976, 0.221939, 0.9803922, 1, 0, 1,
-0.986846, 1.542031, -1.782712, 0.972549, 1, 0, 1,
-0.9806018, -1.013975, -2.637801, 0.9686275, 1, 0, 1,
-0.9779695, -0.6741193, -2.513329, 0.9607843, 1, 0, 1,
-0.9718792, 0.6001337, -2.806185, 0.9568627, 1, 0, 1,
-0.9689944, 0.02652545, -1.161127, 0.9490196, 1, 0, 1,
-0.9682754, -0.3598692, -0.9756184, 0.945098, 1, 0, 1,
-0.9664848, -0.7396109, -0.797801, 0.9372549, 1, 0, 1,
-0.9586525, -0.4183274, -2.468527, 0.9333333, 1, 0, 1,
-0.957375, -0.2986746, -2.63248, 0.9254902, 1, 0, 1,
-0.9539562, -1.214803, -2.701016, 0.9215686, 1, 0, 1,
-0.9522026, -0.5948335, -2.450817, 0.9137255, 1, 0, 1,
-0.9487271, 0.3658783, -0.1442907, 0.9098039, 1, 0, 1,
-0.9423791, 0.2648027, -1.78433, 0.9019608, 1, 0, 1,
-0.9421274, 0.2082706, -0.6819803, 0.8941177, 1, 0, 1,
-0.9288048, 0.2309782, -2.053163, 0.8901961, 1, 0, 1,
-0.9206007, 0.3825082, -1.644298, 0.8823529, 1, 0, 1,
-0.9195997, -0.1012378, 0.3473934, 0.8784314, 1, 0, 1,
-0.9192912, 3.054152, -0.2158569, 0.8705882, 1, 0, 1,
-0.9178728, -0.1216225, -0.8610309, 0.8666667, 1, 0, 1,
-0.9162514, -0.4583483, -0.1788874, 0.8588235, 1, 0, 1,
-0.914472, 1.225301, 0.3841522, 0.854902, 1, 0, 1,
-0.9140447, 0.4837568, -1.408565, 0.8470588, 1, 0, 1,
-0.9091479, -0.09037232, -1.432579, 0.8431373, 1, 0, 1,
-0.9068571, -0.5776038, -3.490299, 0.8352941, 1, 0, 1,
-0.8951771, -2.185389, -3.444428, 0.8313726, 1, 0, 1,
-0.8857943, -0.03184889, -0.175228, 0.8235294, 1, 0, 1,
-0.8830324, -1.694568, -1.638337, 0.8196079, 1, 0, 1,
-0.877808, 0.8793463, -0.8053434, 0.8117647, 1, 0, 1,
-0.8722484, -0.2265921, -1.898737, 0.8078431, 1, 0, 1,
-0.872053, 1.334287, 0.7760103, 0.8, 1, 0, 1,
-0.8715999, -2.698921, -3.155457, 0.7921569, 1, 0, 1,
-0.86857, -1.274345, -3.26584, 0.7882353, 1, 0, 1,
-0.8622336, -0.7091914, -3.477813, 0.7803922, 1, 0, 1,
-0.8621958, -2.296008, -3.718704, 0.7764706, 1, 0, 1,
-0.8545399, -0.4042902, -2.351789, 0.7686275, 1, 0, 1,
-0.8471139, -0.4790097, -3.696628, 0.7647059, 1, 0, 1,
-0.8438718, -0.05709837, -2.632985, 0.7568628, 1, 0, 1,
-0.8371732, 1.983232, -1.432007, 0.7529412, 1, 0, 1,
-0.8289403, -1.262014, -0.4826684, 0.7450981, 1, 0, 1,
-0.8257818, -0.2327495, -1.72323, 0.7411765, 1, 0, 1,
-0.8217742, -0.1131934, -0.6763216, 0.7333333, 1, 0, 1,
-0.8166348, -0.7614983, -2.337049, 0.7294118, 1, 0, 1,
-0.8134369, -0.2057199, -1.391729, 0.7215686, 1, 0, 1,
-0.812112, -0.8381197, -3.031155, 0.7176471, 1, 0, 1,
-0.8107519, 0.04826026, -1.203313, 0.7098039, 1, 0, 1,
-0.8049632, 2.191478, -1.058029, 0.7058824, 1, 0, 1,
-0.7884297, 0.5060377, 0.10479, 0.6980392, 1, 0, 1,
-0.7875213, -1.039445, 0.03635079, 0.6901961, 1, 0, 1,
-0.7875105, -1.671216, -2.59364, 0.6862745, 1, 0, 1,
-0.7871388, 0.6234569, -0.2626641, 0.6784314, 1, 0, 1,
-0.783637, -2.096933, -5.519613, 0.6745098, 1, 0, 1,
-0.7827163, -1.491564, -1.786947, 0.6666667, 1, 0, 1,
-0.780096, -0.0512977, -0.866857, 0.6627451, 1, 0, 1,
-0.7766295, 0.3355139, -1.218795, 0.654902, 1, 0, 1,
-0.7692027, 0.003112345, 0.2760821, 0.6509804, 1, 0, 1,
-0.7681964, -1.34395, -1.355535, 0.6431373, 1, 0, 1,
-0.7638037, -0.6293905, -1.083802, 0.6392157, 1, 0, 1,
-0.7611074, 0.6344525, -1.467089, 0.6313726, 1, 0, 1,
-0.7579062, -0.06771679, -2.012502, 0.627451, 1, 0, 1,
-0.7574142, -0.1218386, -2.401684, 0.6196079, 1, 0, 1,
-0.7546613, 2.244642, -0.4878624, 0.6156863, 1, 0, 1,
-0.7515621, 0.1180056, -1.638974, 0.6078432, 1, 0, 1,
-0.7508861, -1.052952, -3.512141, 0.6039216, 1, 0, 1,
-0.7501776, -1.056256, -3.409202, 0.5960785, 1, 0, 1,
-0.7456841, 0.5586457, -0.6889698, 0.5882353, 1, 0, 1,
-0.7381394, 0.9868, 1.189796, 0.5843138, 1, 0, 1,
-0.7341548, -0.7328455, -1.404499, 0.5764706, 1, 0, 1,
-0.7297625, -0.6598828, -2.745668, 0.572549, 1, 0, 1,
-0.7271131, -0.2071832, -2.01744, 0.5647059, 1, 0, 1,
-0.7231423, 0.8116876, -2.102222, 0.5607843, 1, 0, 1,
-0.7213891, -0.1170869, -2.781271, 0.5529412, 1, 0, 1,
-0.7205225, -0.118437, -1.025231, 0.5490196, 1, 0, 1,
-0.7160142, -0.6683016, -1.27203, 0.5411765, 1, 0, 1,
-0.7155561, 0.2493338, -2.092703, 0.5372549, 1, 0, 1,
-0.714687, -0.3057354, -0.06843936, 0.5294118, 1, 0, 1,
-0.7140097, -1.206022, -2.074728, 0.5254902, 1, 0, 1,
-0.7109578, 0.9564025, 0.1379364, 0.5176471, 1, 0, 1,
-0.7029529, 0.1843159, -2.402685, 0.5137255, 1, 0, 1,
-0.6977208, -0.5108553, -1.485216, 0.5058824, 1, 0, 1,
-0.6970433, -1.217732, -3.039307, 0.5019608, 1, 0, 1,
-0.6954544, 1.901344, -0.1077502, 0.4941176, 1, 0, 1,
-0.694255, 0.5933964, -3.845648, 0.4862745, 1, 0, 1,
-0.6934047, 0.4491202, -0.7669765, 0.4823529, 1, 0, 1,
-0.6893876, 0.9661319, -0.7637203, 0.4745098, 1, 0, 1,
-0.6892765, -0.8310935, -4.395848, 0.4705882, 1, 0, 1,
-0.6882766, 0.04260226, -0.9833868, 0.4627451, 1, 0, 1,
-0.6830324, -0.7037942, -2.223776, 0.4588235, 1, 0, 1,
-0.6703629, -0.5420896, -2.70927, 0.4509804, 1, 0, 1,
-0.6647052, 0.7310085, -0.87103, 0.4470588, 1, 0, 1,
-0.6624622, -1.373419, -3.307211, 0.4392157, 1, 0, 1,
-0.6604514, 0.1745314, -2.087097, 0.4352941, 1, 0, 1,
-0.6530926, -2.420603, -2.331526, 0.427451, 1, 0, 1,
-0.6447204, -2.364619, -4.635204, 0.4235294, 1, 0, 1,
-0.640241, -1.085821, -1.876082, 0.4156863, 1, 0, 1,
-0.6378065, 0.4312126, -0.4785776, 0.4117647, 1, 0, 1,
-0.6366129, 0.461969, -0.3994814, 0.4039216, 1, 0, 1,
-0.6353837, 0.4602859, 0.5211068, 0.3960784, 1, 0, 1,
-0.6318222, -0.3164128, -2.023612, 0.3921569, 1, 0, 1,
-0.6309974, 0.6159312, -0.5084952, 0.3843137, 1, 0, 1,
-0.626126, 1.665647, -0.3610619, 0.3803922, 1, 0, 1,
-0.6218917, 0.5090742, 2.261538, 0.372549, 1, 0, 1,
-0.6161548, 0.1222738, -1.089257, 0.3686275, 1, 0, 1,
-0.6139525, -0.5209544, -1.414897, 0.3607843, 1, 0, 1,
-0.6112186, -0.8076822, -2.409993, 0.3568628, 1, 0, 1,
-0.6112111, 0.04982555, -2.576893, 0.3490196, 1, 0, 1,
-0.6053213, 1.151116, 0.4670366, 0.345098, 1, 0, 1,
-0.6052517, 0.009546815, -1.615672, 0.3372549, 1, 0, 1,
-0.6031475, -0.3436353, -3.93752, 0.3333333, 1, 0, 1,
-0.6022802, 0.9095145, -0.9958524, 0.3254902, 1, 0, 1,
-0.592678, 0.8191744, 0.6229485, 0.3215686, 1, 0, 1,
-0.5894794, -0.9419309, -2.08502, 0.3137255, 1, 0, 1,
-0.588643, -0.6446212, -2.763112, 0.3098039, 1, 0, 1,
-0.5869325, -1.10038, -3.327131, 0.3019608, 1, 0, 1,
-0.5862253, -1.826188, -3.084084, 0.2941177, 1, 0, 1,
-0.5848079, -0.8116814, -1.577088, 0.2901961, 1, 0, 1,
-0.5798903, -0.1723794, -1.54725, 0.282353, 1, 0, 1,
-0.5776658, -0.6531842, -2.007014, 0.2784314, 1, 0, 1,
-0.5757623, 1.18191, -1.123246, 0.2705882, 1, 0, 1,
-0.5755698, -0.1276542, -0.7289477, 0.2666667, 1, 0, 1,
-0.5745912, -0.3178682, -1.75142, 0.2588235, 1, 0, 1,
-0.5745741, 1.230883, 0.5638662, 0.254902, 1, 0, 1,
-0.5725977, -0.5478274, -2.52487, 0.2470588, 1, 0, 1,
-0.5692543, 0.2635911, 1.203523, 0.2431373, 1, 0, 1,
-0.5647312, 0.1284743, -1.804996, 0.2352941, 1, 0, 1,
-0.5619175, -0.0695164, -1.427298, 0.2313726, 1, 0, 1,
-0.5614998, -1.32951, -1.206668, 0.2235294, 1, 0, 1,
-0.5602894, -0.1357182, -1.121505, 0.2196078, 1, 0, 1,
-0.5590905, -1.797451, -2.124866, 0.2117647, 1, 0, 1,
-0.5568597, -1.484524, -3.529282, 0.2078431, 1, 0, 1,
-0.5566455, 0.7404999, -1.946194, 0.2, 1, 0, 1,
-0.5551115, 1.046803, -1.892355, 0.1921569, 1, 0, 1,
-0.5550672, -0.5955932, -4.304775, 0.1882353, 1, 0, 1,
-0.5550173, 0.2104107, -0.3767842, 0.1803922, 1, 0, 1,
-0.5490809, 0.100684, -0.3291217, 0.1764706, 1, 0, 1,
-0.5482172, -1.188944, -3.98288, 0.1686275, 1, 0, 1,
-0.5453066, -1.149894, -3.400012, 0.1647059, 1, 0, 1,
-0.5425057, 0.780313, -3.558815, 0.1568628, 1, 0, 1,
-0.541727, -0.9991572, -0.6486092, 0.1529412, 1, 0, 1,
-0.5401745, -0.3995148, -1.5735, 0.145098, 1, 0, 1,
-0.5394648, -2.285015, -3.2654, 0.1411765, 1, 0, 1,
-0.5392249, 1.659437, -1.108173, 0.1333333, 1, 0, 1,
-0.5382309, 1.609979, -0.6044298, 0.1294118, 1, 0, 1,
-0.5303373, 0.02765609, -0.9501243, 0.1215686, 1, 0, 1,
-0.5295147, 1.058716, -1.324047, 0.1176471, 1, 0, 1,
-0.5269721, 0.1627899, -0.597195, 0.1098039, 1, 0, 1,
-0.5242615, -0.4877326, -2.142307, 0.1058824, 1, 0, 1,
-0.5219367, -0.5856198, -3.004108, 0.09803922, 1, 0, 1,
-0.5188479, -1.972773, -3.20301, 0.09019608, 1, 0, 1,
-0.5178465, -0.9309015, -3.172777, 0.08627451, 1, 0, 1,
-0.5152637, -0.1437786, -1.897963, 0.07843138, 1, 0, 1,
-0.5108854, 1.89192, -0.325024, 0.07450981, 1, 0, 1,
-0.500858, -0.9326012, -2.292654, 0.06666667, 1, 0, 1,
-0.4967215, 1.606952, -1.496933, 0.0627451, 1, 0, 1,
-0.4925215, 0.6442235, -2.179234, 0.05490196, 1, 0, 1,
-0.491818, -0.146818, -4.156047, 0.05098039, 1, 0, 1,
-0.4909637, 0.09453465, -1.812715, 0.04313726, 1, 0, 1,
-0.4894991, -1.553777, -2.122174, 0.03921569, 1, 0, 1,
-0.4854321, 0.3398708, -1.085427, 0.03137255, 1, 0, 1,
-0.4832733, 0.9595157, -0.9162064, 0.02745098, 1, 0, 1,
-0.4804138, 0.6700143, -0.547651, 0.01960784, 1, 0, 1,
-0.4757038, 0.8861739, -1.56286, 0.01568628, 1, 0, 1,
-0.4747552, -1.348395, -2.277763, 0.007843138, 1, 0, 1,
-0.4707138, 0.02906317, -0.03155683, 0.003921569, 1, 0, 1,
-0.4703459, 0.2904964, -0.9250609, 0, 1, 0.003921569, 1,
-0.4694621, -0.02487646, -1.697307, 0, 1, 0.01176471, 1,
-0.4645277, -2.116482, -3.363008, 0, 1, 0.01568628, 1,
-0.464153, -0.1263673, -1.574286, 0, 1, 0.02352941, 1,
-0.4594482, -0.4129955, -2.263194, 0, 1, 0.02745098, 1,
-0.4593639, -0.04506696, -1.737753, 0, 1, 0.03529412, 1,
-0.4575149, 1.633942, -0.5844033, 0, 1, 0.03921569, 1,
-0.4550854, 0.9692361, -0.7824724, 0, 1, 0.04705882, 1,
-0.4496286, 0.2998128, 0.5446221, 0, 1, 0.05098039, 1,
-0.4494204, 1.170325, 2.271663, 0, 1, 0.05882353, 1,
-0.4475622, -0.1171166, -2.312823, 0, 1, 0.0627451, 1,
-0.4474834, 1.136446, 0.6421394, 0, 1, 0.07058824, 1,
-0.445673, 0.4948634, -1.65032, 0, 1, 0.07450981, 1,
-0.4436549, -0.3319382, -3.252254, 0, 1, 0.08235294, 1,
-0.4312799, -0.9090587, -1.685418, 0, 1, 0.08627451, 1,
-0.4280967, 0.6270843, 0.2811305, 0, 1, 0.09411765, 1,
-0.4257419, 0.7515264, -0.2091051, 0, 1, 0.1019608, 1,
-0.4243907, 0.9318616, -0.4384815, 0, 1, 0.1058824, 1,
-0.4238835, -0.08116682, -0.6819904, 0, 1, 0.1137255, 1,
-0.4235374, -2.023989, -3.120745, 0, 1, 0.1176471, 1,
-0.4213379, -0.482816, -0.8109208, 0, 1, 0.1254902, 1,
-0.4206053, -2.333701, -3.072425, 0, 1, 0.1294118, 1,
-0.4193923, -0.4284975, -2.668063, 0, 1, 0.1372549, 1,
-0.4151653, -0.2237396, -1.444576, 0, 1, 0.1411765, 1,
-0.4147899, 0.1929926, 0.1729293, 0, 1, 0.1490196, 1,
-0.4133196, -0.596427, -3.215242, 0, 1, 0.1529412, 1,
-0.4124244, -0.7669837, -2.877931, 0, 1, 0.1607843, 1,
-0.4113404, -0.01604393, -2.785618, 0, 1, 0.1647059, 1,
-0.4111608, -1.054967, -2.783358, 0, 1, 0.172549, 1,
-0.4108753, 0.5582365, -1.738077, 0, 1, 0.1764706, 1,
-0.4100362, -0.3603352, -3.850968, 0, 1, 0.1843137, 1,
-0.4050869, 0.6881179, -1.279372, 0, 1, 0.1882353, 1,
-0.4036436, 1.054463, -0.3879595, 0, 1, 0.1960784, 1,
-0.4033498, 0.1186154, -0.867875, 0, 1, 0.2039216, 1,
-0.3999574, 0.4850987, 0.3594846, 0, 1, 0.2078431, 1,
-0.3979641, 0.08063155, -1.891884, 0, 1, 0.2156863, 1,
-0.3961795, -0.476087, -1.764125, 0, 1, 0.2196078, 1,
-0.3960242, -0.6468813, -1.859771, 0, 1, 0.227451, 1,
-0.3876184, -0.3166349, -2.26497, 0, 1, 0.2313726, 1,
-0.3835781, -0.9590428, -1.168167, 0, 1, 0.2392157, 1,
-0.3835366, -0.2158596, -3.116662, 0, 1, 0.2431373, 1,
-0.3762276, 0.6896647, -1.069506, 0, 1, 0.2509804, 1,
-0.376022, -0.1734883, -0.2598235, 0, 1, 0.254902, 1,
-0.3743492, -0.3244748, -3.323704, 0, 1, 0.2627451, 1,
-0.3687318, -1.977494, -4.096848, 0, 1, 0.2666667, 1,
-0.3657559, 0.4909389, -1.322153, 0, 1, 0.2745098, 1,
-0.3619176, -0.3546017, -1.949659, 0, 1, 0.2784314, 1,
-0.361882, 0.2584041, 1.561865, 0, 1, 0.2862745, 1,
-0.3613243, -0.7791462, -4.183253, 0, 1, 0.2901961, 1,
-0.3535642, -0.1378345, -1.479499, 0, 1, 0.2980392, 1,
-0.3515225, 0.7769631, 1.245566, 0, 1, 0.3058824, 1,
-0.3500259, 1.513362, 0.9379383, 0, 1, 0.3098039, 1,
-0.3498471, -0.5521509, -3.714648, 0, 1, 0.3176471, 1,
-0.348264, -0.6925994, -3.134668, 0, 1, 0.3215686, 1,
-0.3476814, -0.3265195, -2.096279, 0, 1, 0.3294118, 1,
-0.3474259, 0.7907535, -1.17728, 0, 1, 0.3333333, 1,
-0.3454932, -1.270972, -3.550578, 0, 1, 0.3411765, 1,
-0.3416071, -0.6684011, -3.156999, 0, 1, 0.345098, 1,
-0.3407804, 1.416167, 1.011527, 0, 1, 0.3529412, 1,
-0.340374, 0.3701295, 1.538214, 0, 1, 0.3568628, 1,
-0.3374539, -0.2156099, -1.898184, 0, 1, 0.3647059, 1,
-0.3330386, -0.5269186, -1.506083, 0, 1, 0.3686275, 1,
-0.3311068, -1.042803, -2.080424, 0, 1, 0.3764706, 1,
-0.3248506, -0.8250203, -2.782835, 0, 1, 0.3803922, 1,
-0.3241606, 0.07793003, -0.9421187, 0, 1, 0.3882353, 1,
-0.3215443, 1.152638, 0.9057252, 0, 1, 0.3921569, 1,
-0.3111877, -0.02083072, -0.5248044, 0, 1, 0.4, 1,
-0.3095645, 0.8822917, 0.2715892, 0, 1, 0.4078431, 1,
-0.3091938, 0.5730234, 0.5671242, 0, 1, 0.4117647, 1,
-0.3075153, 1.124057, -0.7406565, 0, 1, 0.4196078, 1,
-0.3057278, -1.261589, -2.463941, 0, 1, 0.4235294, 1,
-0.3043113, -0.8171381, -2.531582, 0, 1, 0.4313726, 1,
-0.3029449, -1.098224, -0.785156, 0, 1, 0.4352941, 1,
-0.3023291, 1.446295, -0.08599745, 0, 1, 0.4431373, 1,
-0.3004808, 1.35829, -0.862363, 0, 1, 0.4470588, 1,
-0.2971716, 0.4321266, -0.5608625, 0, 1, 0.454902, 1,
-0.2925477, 0.4681584, -1.519533, 0, 1, 0.4588235, 1,
-0.2901652, -1.769024, -2.793837, 0, 1, 0.4666667, 1,
-0.289105, -1.013442, -3.651584, 0, 1, 0.4705882, 1,
-0.284341, 0.3120312, 0.5718634, 0, 1, 0.4784314, 1,
-0.2823108, 0.2837312, 0.3676513, 0, 1, 0.4823529, 1,
-0.2820154, -0.9897984, -3.397774, 0, 1, 0.4901961, 1,
-0.2728756, -0.7514498, -2.510836, 0, 1, 0.4941176, 1,
-0.2725587, -0.7505133, -2.216688, 0, 1, 0.5019608, 1,
-0.2673417, -0.4109861, -2.117452, 0, 1, 0.509804, 1,
-0.2665389, -1.206253, -2.701132, 0, 1, 0.5137255, 1,
-0.2647789, 1.225523, -1.958359, 0, 1, 0.5215687, 1,
-0.2620454, 0.7050711, 0.6054649, 0, 1, 0.5254902, 1,
-0.2585688, -0.5248094, -3.67905, 0, 1, 0.5333334, 1,
-0.2581579, 0.6441084, 0.1029449, 0, 1, 0.5372549, 1,
-0.2546001, -0.01240976, -1.405449, 0, 1, 0.5450981, 1,
-0.2518843, 0.4756413, -0.8105578, 0, 1, 0.5490196, 1,
-0.250132, -0.6332037, -3.828299, 0, 1, 0.5568628, 1,
-0.2462915, -0.6341578, -3.58809, 0, 1, 0.5607843, 1,
-0.2462842, 0.457706, -0.7400464, 0, 1, 0.5686275, 1,
-0.2442969, 0.9953753, 0.9586051, 0, 1, 0.572549, 1,
-0.2429744, 1.084628, 1.108582, 0, 1, 0.5803922, 1,
-0.2428471, 0.7092979, -0.558681, 0, 1, 0.5843138, 1,
-0.2428374, 1.415964, 0.1564471, 0, 1, 0.5921569, 1,
-0.2426865, 1.550054, -0.6506177, 0, 1, 0.5960785, 1,
-0.2411869, -0.6944561, -1.92531, 0, 1, 0.6039216, 1,
-0.2366676, 0.8504601, -0.379244, 0, 1, 0.6117647, 1,
-0.2362573, -0.7304985, -4.187455, 0, 1, 0.6156863, 1,
-0.2346426, -0.418419, -4.131576, 0, 1, 0.6235294, 1,
-0.2319095, -1.223228, -2.278237, 0, 1, 0.627451, 1,
-0.2284264, -1.052382, -1.280249, 0, 1, 0.6352941, 1,
-0.2269048, 0.6089175, 0.688574, 0, 1, 0.6392157, 1,
-0.2224267, -0.6819698, -2.960129, 0, 1, 0.6470588, 1,
-0.2194519, -0.3517127, -3.041409, 0, 1, 0.6509804, 1,
-0.2146177, 0.8884338, 0.0892368, 0, 1, 0.6588235, 1,
-0.2127146, -0.2444988, -1.064366, 0, 1, 0.6627451, 1,
-0.211368, -1.126443, -4.18174, 0, 1, 0.6705883, 1,
-0.2108358, 0.4211044, -3.088281, 0, 1, 0.6745098, 1,
-0.2095041, 1.416087, -0.04810396, 0, 1, 0.682353, 1,
-0.2064722, 0.8460969, -0.932999, 0, 1, 0.6862745, 1,
-0.205623, -0.1483952, -3.157186, 0, 1, 0.6941177, 1,
-0.2046784, -0.2806333, -0.4552667, 0, 1, 0.7019608, 1,
-0.2030528, 0.5364305, -1.429689, 0, 1, 0.7058824, 1,
-0.1993393, -0.5658452, -1.286831, 0, 1, 0.7137255, 1,
-0.1991331, -0.08484451, -1.754427, 0, 1, 0.7176471, 1,
-0.1969239, 0.0900582, -0.5173732, 0, 1, 0.7254902, 1,
-0.1861311, 0.9814531, 0.4062692, 0, 1, 0.7294118, 1,
-0.1832553, 1.205152, 0.4964402, 0, 1, 0.7372549, 1,
-0.1811554, 0.4004243, 1.25534, 0, 1, 0.7411765, 1,
-0.1792876, -0.09390479, -2.231515, 0, 1, 0.7490196, 1,
-0.1792071, 0.02160027, -0.3057171, 0, 1, 0.7529412, 1,
-0.170678, 0.8632631, -1.475846, 0, 1, 0.7607843, 1,
-0.170119, -1.436841, -5.244964, 0, 1, 0.7647059, 1,
-0.1693122, 0.6142439, -0.7392291, 0, 1, 0.772549, 1,
-0.1688648, 0.2256411, 0.2278572, 0, 1, 0.7764706, 1,
-0.165829, 0.2754886, -0.5135603, 0, 1, 0.7843137, 1,
-0.1622266, -0.9917264, -3.160009, 0, 1, 0.7882353, 1,
-0.1606564, 1.659606, 1.253606, 0, 1, 0.7960784, 1,
-0.1605508, 0.8275557, 0.4806529, 0, 1, 0.8039216, 1,
-0.1566949, -0.534094, -3.003013, 0, 1, 0.8078431, 1,
-0.1511816, 1.242543, -1.983825, 0, 1, 0.8156863, 1,
-0.1504457, 1.980857, 0.8403388, 0, 1, 0.8196079, 1,
-0.1464197, -0.1375385, -0.4019012, 0, 1, 0.827451, 1,
-0.145102, 0.9865361, -1.881375, 0, 1, 0.8313726, 1,
-0.1445288, -0.3600841, -1.929495, 0, 1, 0.8392157, 1,
-0.1424515, 1.282892, 1.513656, 0, 1, 0.8431373, 1,
-0.1396352, -0.8467614, -1.735203, 0, 1, 0.8509804, 1,
-0.1376568, -0.9635503, -3.776265, 0, 1, 0.854902, 1,
-0.1359858, -0.3397763, -2.261884, 0, 1, 0.8627451, 1,
-0.1346814, -0.7713786, -2.758372, 0, 1, 0.8666667, 1,
-0.1269514, -1.804355, -2.44379, 0, 1, 0.8745098, 1,
-0.12494, 0.561612, -1.135938, 0, 1, 0.8784314, 1,
-0.1246374, 0.5362042, 1.028898, 0, 1, 0.8862745, 1,
-0.1232126, 1.741191, -0.04493052, 0, 1, 0.8901961, 1,
-0.1213521, -1.184165, -4.228667, 0, 1, 0.8980392, 1,
-0.1173619, -0.4720576, -4.295723, 0, 1, 0.9058824, 1,
-0.1126948, 1.749538, 0.002379255, 0, 1, 0.9098039, 1,
-0.1034981, 0.4316428, -0.2077812, 0, 1, 0.9176471, 1,
-0.1012782, 1.016649, -0.850115, 0, 1, 0.9215686, 1,
-0.09532284, 0.05427089, -1.101772, 0, 1, 0.9294118, 1,
-0.0935368, 2.194559, 0.2776293, 0, 1, 0.9333333, 1,
-0.09100661, -0.8776621, -3.059376, 0, 1, 0.9411765, 1,
-0.09089829, 0.5049015, -0.3761451, 0, 1, 0.945098, 1,
-0.08504727, 0.1454879, 0.9217816, 0, 1, 0.9529412, 1,
-0.08473095, -0.3754187, -4.299506, 0, 1, 0.9568627, 1,
-0.07898824, -0.1233262, -2.452169, 0, 1, 0.9647059, 1,
-0.07427249, 0.7831411, -1.745897, 0, 1, 0.9686275, 1,
-0.06296389, -1.27907, -2.164297, 0, 1, 0.9764706, 1,
-0.06170052, 0.09488412, 0.1022699, 0, 1, 0.9803922, 1,
-0.06124802, 1.419799, 0.497665, 0, 1, 0.9882353, 1,
-0.06086161, -0.6473567, -1.955772, 0, 1, 0.9921569, 1,
-0.05069662, 0.2146854, 0.920522, 0, 1, 1, 1,
-0.05037469, -0.2852079, -2.491515, 0, 0.9921569, 1, 1,
-0.04895845, -1.561156, -2.712045, 0, 0.9882353, 1, 1,
-0.04837653, 1.945332, 0.4526499, 0, 0.9803922, 1, 1,
-0.04628061, -0.1307784, -2.798576, 0, 0.9764706, 1, 1,
-0.04426728, 1.251777, 2.397835, 0, 0.9686275, 1, 1,
-0.03899792, 1.401043, 0.5159682, 0, 0.9647059, 1, 1,
-0.03793087, 0.4840987, 0.87181, 0, 0.9568627, 1, 1,
-0.02947362, -0.3672088, -2.404096, 0, 0.9529412, 1, 1,
-0.02928928, -0.2845966, -2.940774, 0, 0.945098, 1, 1,
-0.02850099, -0.07620759, -3.113419, 0, 0.9411765, 1, 1,
-0.02798739, 1.754255, 0.8931711, 0, 0.9333333, 1, 1,
-0.02717524, -1.277263, -4.650561, 0, 0.9294118, 1, 1,
-0.02351018, 0.599129, -1.82161, 0, 0.9215686, 1, 1,
-0.02304949, -2.752877, -3.659105, 0, 0.9176471, 1, 1,
-0.02155882, -0.09583367, -2.508243, 0, 0.9098039, 1, 1,
-0.02096116, 0.5191296, 1.68766, 0, 0.9058824, 1, 1,
-0.01684563, -1.123262, -4.257687, 0, 0.8980392, 1, 1,
-0.01468876, 0.61636, -0.2989657, 0, 0.8901961, 1, 1,
-0.01416769, 1.749329, 1.287355, 0, 0.8862745, 1, 1,
-0.01174943, -1.496671, -2.684783, 0, 0.8784314, 1, 1,
-0.01107695, -1.162491, -3.352927, 0, 0.8745098, 1, 1,
-0.01084485, -0.9799458, -4.860372, 0, 0.8666667, 1, 1,
-0.008375857, 1.079476, -0.01508717, 0, 0.8627451, 1, 1,
-0.006574644, 2.076247, 1.931401, 0, 0.854902, 1, 1,
0.0006539011, -0.2865937, 3.276556, 0, 0.8509804, 1, 1,
0.003511548, 0.7143945, -0.5071611, 0, 0.8431373, 1, 1,
0.006457102, -0.3817686, 1.695502, 0, 0.8392157, 1, 1,
0.007106989, 0.922857, -2.204026, 0, 0.8313726, 1, 1,
0.01411123, -0.178284, 2.113199, 0, 0.827451, 1, 1,
0.01560192, -1.635805, 1.372954, 0, 0.8196079, 1, 1,
0.02334733, 0.3306962, 0.9720311, 0, 0.8156863, 1, 1,
0.03567291, 1.082184, 0.1247589, 0, 0.8078431, 1, 1,
0.03683138, 0.4341967, -0.05610036, 0, 0.8039216, 1, 1,
0.03788611, 0.7304288, 0.4040301, 0, 0.7960784, 1, 1,
0.03819607, 1.3135, -1.336995, 0, 0.7882353, 1, 1,
0.03959487, -1.76998, 3.224047, 0, 0.7843137, 1, 1,
0.04591935, 0.2062371, -0.8715709, 0, 0.7764706, 1, 1,
0.0462754, 0.5088919, -1.11098, 0, 0.772549, 1, 1,
0.04775624, -0.6598873, 2.335647, 0, 0.7647059, 1, 1,
0.04841536, -0.4299622, 2.666632, 0, 0.7607843, 1, 1,
0.04879756, -1.997488, 2.726466, 0, 0.7529412, 1, 1,
0.05146842, -1.096263, 4.055492, 0, 0.7490196, 1, 1,
0.05351089, -1.13716, 3.767623, 0, 0.7411765, 1, 1,
0.05639467, -0.2550468, 3.511349, 0, 0.7372549, 1, 1,
0.0570695, 1.579328, -1.155501, 0, 0.7294118, 1, 1,
0.0642798, 0.9821281, 0.2392896, 0, 0.7254902, 1, 1,
0.06637131, 0.2506682, 1.192606, 0, 0.7176471, 1, 1,
0.06942051, 0.1827053, -0.4275083, 0, 0.7137255, 1, 1,
0.07174733, -1.807316, 2.242563, 0, 0.7058824, 1, 1,
0.07285083, -0.673179, 0.7745684, 0, 0.6980392, 1, 1,
0.07963091, -0.3800012, 4.229676, 0, 0.6941177, 1, 1,
0.08183284, -1.335822, 4.271485, 0, 0.6862745, 1, 1,
0.08384412, 1.324856, 0.8700306, 0, 0.682353, 1, 1,
0.08477001, -1.217146, 2.241592, 0, 0.6745098, 1, 1,
0.08610178, 1.0442, -0.197363, 0, 0.6705883, 1, 1,
0.08683565, -0.007475925, 1.600441, 0, 0.6627451, 1, 1,
0.08703462, -3.119756, 2.403733, 0, 0.6588235, 1, 1,
0.08890309, 0.4520882, -0.4672371, 0, 0.6509804, 1, 1,
0.09112149, 0.6783999, 2.10321, 0, 0.6470588, 1, 1,
0.09646111, -0.6378596, 1.545597, 0, 0.6392157, 1, 1,
0.09779275, 0.8049728, 0.1810425, 0, 0.6352941, 1, 1,
0.09817757, 0.5978867, -0.4538163, 0, 0.627451, 1, 1,
0.1002053, 0.8432064, 1.113467, 0, 0.6235294, 1, 1,
0.1005833, 0.3852475, 1.850338, 0, 0.6156863, 1, 1,
0.1054055, -0.4647788, 3.727054, 0, 0.6117647, 1, 1,
0.1274618, -1.661918, 4.438905, 0, 0.6039216, 1, 1,
0.1321204, 0.8644076, -0.9571624, 0, 0.5960785, 1, 1,
0.1333564, -0.4067868, 4.982039, 0, 0.5921569, 1, 1,
0.1427455, 0.3817315, -1.224698, 0, 0.5843138, 1, 1,
0.1476652, 1.01046, -0.5395487, 0, 0.5803922, 1, 1,
0.1490248, 0.002365941, 2.98839, 0, 0.572549, 1, 1,
0.1496988, -0.2289332, 3.912918, 0, 0.5686275, 1, 1,
0.1519231, -0.4539981, 1.343232, 0, 0.5607843, 1, 1,
0.1535463, 0.3927523, 0.3186842, 0, 0.5568628, 1, 1,
0.1559869, 1.002154, -0.05683346, 0, 0.5490196, 1, 1,
0.158249, -1.456982, 3.030602, 0, 0.5450981, 1, 1,
0.1599439, 0.6059985, -0.4036722, 0, 0.5372549, 1, 1,
0.1614511, -0.3400278, 2.341947, 0, 0.5333334, 1, 1,
0.1649524, -0.8111221, 2.14951, 0, 0.5254902, 1, 1,
0.1673203, 0.2943897, -0.6612381, 0, 0.5215687, 1, 1,
0.1705424, 0.4025295, 1.58787, 0, 0.5137255, 1, 1,
0.1729346, -0.07258635, 2.294673, 0, 0.509804, 1, 1,
0.1777288, 0.2681631, 1.470138, 0, 0.5019608, 1, 1,
0.1782073, 0.1799829, 0.4765783, 0, 0.4941176, 1, 1,
0.1786849, -2.08259, 2.293257, 0, 0.4901961, 1, 1,
0.1786872, 0.4503585, -0.05499056, 0, 0.4823529, 1, 1,
0.1813424, -0.4243128, 1.9157, 0, 0.4784314, 1, 1,
0.1813526, -0.5242922, 2.87175, 0, 0.4705882, 1, 1,
0.1828814, -0.3367179, 3.206879, 0, 0.4666667, 1, 1,
0.1859173, -0.5831772, 2.140136, 0, 0.4588235, 1, 1,
0.1860353, -1.626934, 2.849903, 0, 0.454902, 1, 1,
0.1887609, 0.3961701, -0.4178999, 0, 0.4470588, 1, 1,
0.1896073, 1.137141, -0.7019772, 0, 0.4431373, 1, 1,
0.200005, 0.7331523, 1.770265, 0, 0.4352941, 1, 1,
0.2043923, 0.9551474, -0.5100571, 0, 0.4313726, 1, 1,
0.2059653, 0.9703699, 0.839179, 0, 0.4235294, 1, 1,
0.2077929, -0.9638768, 3.674559, 0, 0.4196078, 1, 1,
0.209605, -0.2649666, 2.103257, 0, 0.4117647, 1, 1,
0.2100301, 1.677048, -0.1644279, 0, 0.4078431, 1, 1,
0.2105906, 0.3624131, 0.5574921, 0, 0.4, 1, 1,
0.2130886, -0.4502319, 2.559931, 0, 0.3921569, 1, 1,
0.2139099, -1.311036, 2.499938, 0, 0.3882353, 1, 1,
0.2162753, 0.5659876, 1.014786, 0, 0.3803922, 1, 1,
0.2176596, 0.5032631, 0.6646423, 0, 0.3764706, 1, 1,
0.2203284, -0.9407166, 0.8793043, 0, 0.3686275, 1, 1,
0.2214387, -1.173249, 3.583602, 0, 0.3647059, 1, 1,
0.2244451, 0.8078162, -1.311178, 0, 0.3568628, 1, 1,
0.2280934, -0.9126582, 3.491304, 0, 0.3529412, 1, 1,
0.2318922, -0.06713329, 2.46855, 0, 0.345098, 1, 1,
0.2329157, -0.6659217, 2.5195, 0, 0.3411765, 1, 1,
0.2348707, 0.3836023, 1.825971, 0, 0.3333333, 1, 1,
0.2387937, -0.592136, 2.288273, 0, 0.3294118, 1, 1,
0.2412183, 0.5721751, 1.60731, 0, 0.3215686, 1, 1,
0.2444619, -0.8622763, 1.79665, 0, 0.3176471, 1, 1,
0.2453349, 0.2610086, 0.463108, 0, 0.3098039, 1, 1,
0.2453844, 0.6998031, -0.9257023, 0, 0.3058824, 1, 1,
0.2456004, -0.7935678, 1.1702, 0, 0.2980392, 1, 1,
0.2510721, 0.5059408, 0.3599024, 0, 0.2901961, 1, 1,
0.2539226, 0.003377341, 0.1498415, 0, 0.2862745, 1, 1,
0.2593814, -0.8978716, 3.119939, 0, 0.2784314, 1, 1,
0.2603247, 1.396837, -0.08660687, 0, 0.2745098, 1, 1,
0.2657402, 0.8459897, 0.8624579, 0, 0.2666667, 1, 1,
0.2660694, 0.4071495, 1.221907, 0, 0.2627451, 1, 1,
0.2705022, 0.4172717, 2.170166, 0, 0.254902, 1, 1,
0.2716494, -1.456956, 4.537888, 0, 0.2509804, 1, 1,
0.2728269, -0.4263466, 2.432059, 0, 0.2431373, 1, 1,
0.2738709, 0.4858784, -1.476436, 0, 0.2392157, 1, 1,
0.2796431, 0.1686269, 2.039953, 0, 0.2313726, 1, 1,
0.2816335, -0.9848743, 1.151468, 0, 0.227451, 1, 1,
0.2872153, 1.393132, -1.131833, 0, 0.2196078, 1, 1,
0.2920595, 0.992711, 0.4290518, 0, 0.2156863, 1, 1,
0.2924328, 0.4181054, -0.2608316, 0, 0.2078431, 1, 1,
0.2924479, -2.238605, 1.569046, 0, 0.2039216, 1, 1,
0.2926573, 0.2235725, 1.090559, 0, 0.1960784, 1, 1,
0.2968439, -2.858134, 4.414697, 0, 0.1882353, 1, 1,
0.2990733, -0.4896115, 1.08214, 0, 0.1843137, 1, 1,
0.2998129, -0.1952573, 1.279646, 0, 0.1764706, 1, 1,
0.3009758, -0.6700053, 2.966532, 0, 0.172549, 1, 1,
0.3074386, -0.3413722, 2.451612, 0, 0.1647059, 1, 1,
0.3097599, -1.449998, 3.337562, 0, 0.1607843, 1, 1,
0.311381, 0.326904, 0.5266401, 0, 0.1529412, 1, 1,
0.3144097, 1.107517, 2.911896, 0, 0.1490196, 1, 1,
0.3189903, 0.9919844, 0.9558542, 0, 0.1411765, 1, 1,
0.3312253, 1.566771, 0.9249157, 0, 0.1372549, 1, 1,
0.3316189, 0.547442, -0.3335847, 0, 0.1294118, 1, 1,
0.3405536, -0.5821658, 3.306769, 0, 0.1254902, 1, 1,
0.3406312, -0.8643247, 2.488385, 0, 0.1176471, 1, 1,
0.340894, -1.030863, 3.167171, 0, 0.1137255, 1, 1,
0.3412431, -0.432579, 3.670263, 0, 0.1058824, 1, 1,
0.3441324, 0.2949552, 1.110145, 0, 0.09803922, 1, 1,
0.3462132, -0.2041603, 1.094864, 0, 0.09411765, 1, 1,
0.350459, -0.01827038, 2.041498, 0, 0.08627451, 1, 1,
0.3522013, -0.9003943, 3.110388, 0, 0.08235294, 1, 1,
0.3562181, -0.4001738, 2.375524, 0, 0.07450981, 1, 1,
0.3586764, -1.09056, 4.105247, 0, 0.07058824, 1, 1,
0.3627896, -1.89978, 2.133515, 0, 0.0627451, 1, 1,
0.3641946, 0.4801211, 0.03261574, 0, 0.05882353, 1, 1,
0.3687893, 0.4932611, 0.3779787, 0, 0.05098039, 1, 1,
0.3721559, 2.414474, 0.2444375, 0, 0.04705882, 1, 1,
0.3742808, 0.5158734, 2.466075, 0, 0.03921569, 1, 1,
0.3789697, -0.2650193, 2.973458, 0, 0.03529412, 1, 1,
0.3873022, 0.08950655, 0.923435, 0, 0.02745098, 1, 1,
0.3897729, 0.5458547, 1.409972, 0, 0.02352941, 1, 1,
0.3962494, 0.5951154, 1.518106, 0, 0.01568628, 1, 1,
0.4078869, 0.1244968, 2.10139, 0, 0.01176471, 1, 1,
0.4114868, -0.2811047, 1.630929, 0, 0.003921569, 1, 1,
0.4128095, 1.062719, -0.1807664, 0.003921569, 0, 1, 1,
0.4157737, -0.2098444, 2.116412, 0.007843138, 0, 1, 1,
0.4188185, -0.3279312, 2.919483, 0.01568628, 0, 1, 1,
0.419013, 0.6780557, 1.268088, 0.01960784, 0, 1, 1,
0.420503, -0.7576017, 3.351494, 0.02745098, 0, 1, 1,
0.4261092, 0.7546782, -0.1688221, 0.03137255, 0, 1, 1,
0.4320019, 0.6691422, 1.864594, 0.03921569, 0, 1, 1,
0.4357619, -1.26739, 3.929891, 0.04313726, 0, 1, 1,
0.4382896, 1.628348, -2.529822, 0.05098039, 0, 1, 1,
0.4416173, -0.566025, 4.717451, 0.05490196, 0, 1, 1,
0.4461398, -0.009352734, 1.063926, 0.0627451, 0, 1, 1,
0.4474889, -0.5696214, 1.934955, 0.06666667, 0, 1, 1,
0.4532056, -1.223426, 4.256565, 0.07450981, 0, 1, 1,
0.4579949, 1.4728, 0.09868658, 0.07843138, 0, 1, 1,
0.4597088, -0.08362795, 1.239263, 0.08627451, 0, 1, 1,
0.4620365, 0.9661166, 1.742689, 0.09019608, 0, 1, 1,
0.4638806, 0.4543557, 0.1558494, 0.09803922, 0, 1, 1,
0.4649684, 0.5944145, 1.613893, 0.1058824, 0, 1, 1,
0.4650007, -0.6717582, 2.159152, 0.1098039, 0, 1, 1,
0.4671138, 0.3587334, 1.363356, 0.1176471, 0, 1, 1,
0.4684861, 0.5587184, -0.1666106, 0.1215686, 0, 1, 1,
0.4724253, -0.5755491, 2.308875, 0.1294118, 0, 1, 1,
0.4749098, 0.528268, 2.209951, 0.1333333, 0, 1, 1,
0.4750051, -0.1350269, 2.091548, 0.1411765, 0, 1, 1,
0.4767951, -0.9095951, 1.767747, 0.145098, 0, 1, 1,
0.4789697, 0.4717778, -0.9106722, 0.1529412, 0, 1, 1,
0.4797072, 1.323027, 0.2937452, 0.1568628, 0, 1, 1,
0.4847672, 1.651516, 0.565012, 0.1647059, 0, 1, 1,
0.4870031, -0.3385277, 2.332431, 0.1686275, 0, 1, 1,
0.4894168, -1.595411, 2.706978, 0.1764706, 0, 1, 1,
0.4909655, -0.1095287, 1.729831, 0.1803922, 0, 1, 1,
0.496032, -0.5078035, 1.394167, 0.1882353, 0, 1, 1,
0.4973813, 0.2039644, 1.599567, 0.1921569, 0, 1, 1,
0.5006542, -0.7211049, 1.158019, 0.2, 0, 1, 1,
0.5047383, -1.812216, 3.75837, 0.2078431, 0, 1, 1,
0.5049263, -0.1817752, 1.760546, 0.2117647, 0, 1, 1,
0.5069078, -0.8059971, 1.840976, 0.2196078, 0, 1, 1,
0.5098163, -0.5312723, 3.119791, 0.2235294, 0, 1, 1,
0.5099236, 0.2802447, 0.7858251, 0.2313726, 0, 1, 1,
0.5134477, -0.2576748, 2.044884, 0.2352941, 0, 1, 1,
0.5135555, 2.806179, 0.4575251, 0.2431373, 0, 1, 1,
0.5148979, 1.438624, -0.225409, 0.2470588, 0, 1, 1,
0.5160341, 1.297552, -0.2606806, 0.254902, 0, 1, 1,
0.5176192, 0.6751622, 2.259801, 0.2588235, 0, 1, 1,
0.5180196, 0.3144601, 2.010621, 0.2666667, 0, 1, 1,
0.5254158, -0.1138781, 0.9884728, 0.2705882, 0, 1, 1,
0.5264508, -1.830173, 3.698123, 0.2784314, 0, 1, 1,
0.5277393, -0.6925579, 2.524926, 0.282353, 0, 1, 1,
0.5285168, 0.4898799, -0.4253017, 0.2901961, 0, 1, 1,
0.5288912, -0.7201329, 1.819051, 0.2941177, 0, 1, 1,
0.5374213, 0.1988869, -0.4984457, 0.3019608, 0, 1, 1,
0.5432853, -0.1865457, 3.328035, 0.3098039, 0, 1, 1,
0.5474724, 0.5138214, 1.923283, 0.3137255, 0, 1, 1,
0.5495702, -0.8216951, 3.259049, 0.3215686, 0, 1, 1,
0.5522915, -1.881596, 3.990048, 0.3254902, 0, 1, 1,
0.5542865, 0.3942717, 0.2983736, 0.3333333, 0, 1, 1,
0.5608128, -0.380909, 1.335938, 0.3372549, 0, 1, 1,
0.5633968, -1.730042, 1.469569, 0.345098, 0, 1, 1,
0.5673818, -0.2077021, 1.701014, 0.3490196, 0, 1, 1,
0.5676193, 0.5840638, 1.580518, 0.3568628, 0, 1, 1,
0.569353, -1.10419, 3.193253, 0.3607843, 0, 1, 1,
0.5707292, -1.354723, 2.694492, 0.3686275, 0, 1, 1,
0.5708696, -0.5895774, 2.425835, 0.372549, 0, 1, 1,
0.5712595, 0.7927634, -0.6592748, 0.3803922, 0, 1, 1,
0.5734719, -1.489319, 4.359198, 0.3843137, 0, 1, 1,
0.5748752, -0.345188, 1.928575, 0.3921569, 0, 1, 1,
0.5792192, 0.1729565, 1.613973, 0.3960784, 0, 1, 1,
0.579929, 1.278273, 1.646766, 0.4039216, 0, 1, 1,
0.585837, 0.3384474, -0.2989747, 0.4117647, 0, 1, 1,
0.5884315, -0.1077926, 3.63273, 0.4156863, 0, 1, 1,
0.5910312, 0.4537724, -0.2995855, 0.4235294, 0, 1, 1,
0.5918711, -2.062375, 3.754979, 0.427451, 0, 1, 1,
0.5975903, 0.5589986, 1.095344, 0.4352941, 0, 1, 1,
0.5999405, -0.8975531, 5.133336, 0.4392157, 0, 1, 1,
0.601091, 0.1691366, 0.7878032, 0.4470588, 0, 1, 1,
0.6066018, -0.459505, 1.975334, 0.4509804, 0, 1, 1,
0.6090619, -0.682715, 2.577138, 0.4588235, 0, 1, 1,
0.6110345, 0.7820473, -1.256774, 0.4627451, 0, 1, 1,
0.6239053, 1.614192, -1.191748, 0.4705882, 0, 1, 1,
0.6273643, -0.6180758, 2.90038, 0.4745098, 0, 1, 1,
0.6283077, -0.9912075, 2.501675, 0.4823529, 0, 1, 1,
0.6308982, -0.1895285, 1.2701, 0.4862745, 0, 1, 1,
0.632705, -0.7384917, 3.356053, 0.4941176, 0, 1, 1,
0.6362947, 0.255944, 2.196446, 0.5019608, 0, 1, 1,
0.6410906, 1.601973, -0.8435465, 0.5058824, 0, 1, 1,
0.6505686, 0.4283407, 2.000731, 0.5137255, 0, 1, 1,
0.6522992, -0.7466137, 2.674933, 0.5176471, 0, 1, 1,
0.6621022, 1.662488, 0.5857213, 0.5254902, 0, 1, 1,
0.6683802, 0.278425, 1.488739, 0.5294118, 0, 1, 1,
0.676537, -0.6801867, 2.345732, 0.5372549, 0, 1, 1,
0.6787362, 0.515269, 1.621139, 0.5411765, 0, 1, 1,
0.6787865, -1.567253, 4.266811, 0.5490196, 0, 1, 1,
0.6819203, -0.4958256, 3.538819, 0.5529412, 0, 1, 1,
0.6835296, -0.4812434, 2.300189, 0.5607843, 0, 1, 1,
0.6837206, -0.2316854, 1.924903, 0.5647059, 0, 1, 1,
0.6839496, -0.3866453, 3.21893, 0.572549, 0, 1, 1,
0.687445, -0.01315359, 1.122499, 0.5764706, 0, 1, 1,
0.6903498, 0.7342919, 1.319468, 0.5843138, 0, 1, 1,
0.6919611, 0.9986072, 0.8032736, 0.5882353, 0, 1, 1,
0.6976701, 0.05396983, 1.430642, 0.5960785, 0, 1, 1,
0.7046303, -0.2542138, 0.4249409, 0.6039216, 0, 1, 1,
0.7188494, -0.6845469, 2.983516, 0.6078432, 0, 1, 1,
0.7218822, -0.5981057, 3.421224, 0.6156863, 0, 1, 1,
0.722676, 0.5876991, -0.3500271, 0.6196079, 0, 1, 1,
0.7248622, 0.7107729, 0.9804846, 0.627451, 0, 1, 1,
0.7290996, -0.1231965, 0.1779274, 0.6313726, 0, 1, 1,
0.7314302, 0.03110344, 0.4595898, 0.6392157, 0, 1, 1,
0.7319238, -0.6750559, 2.339938, 0.6431373, 0, 1, 1,
0.7408671, -0.461987, 2.522324, 0.6509804, 0, 1, 1,
0.7439933, -0.614104, 1.694197, 0.654902, 0, 1, 1,
0.745097, -0.9974172, 4.063015, 0.6627451, 0, 1, 1,
0.7488101, 0.731461, -1.995231, 0.6666667, 0, 1, 1,
0.7492709, -0.8626885, 3.674772, 0.6745098, 0, 1, 1,
0.752184, 1.049969, 0.9171817, 0.6784314, 0, 1, 1,
0.755936, 0.2861058, 0.3366315, 0.6862745, 0, 1, 1,
0.7578913, 1.788547, 0.536715, 0.6901961, 0, 1, 1,
0.7592455, -0.3515789, 1.495627, 0.6980392, 0, 1, 1,
0.7673702, 1.145692, 0.40825, 0.7058824, 0, 1, 1,
0.7790047, 0.385156, 1.914178, 0.7098039, 0, 1, 1,
0.783434, 0.2243068, 3.282905, 0.7176471, 0, 1, 1,
0.7856521, 1.243672, 1.883757, 0.7215686, 0, 1, 1,
0.7924907, 1.121854, 1.025347, 0.7294118, 0, 1, 1,
0.7934206, -0.6992279, 2.518289, 0.7333333, 0, 1, 1,
0.7964271, 0.1465044, 0.8534009, 0.7411765, 0, 1, 1,
0.7970803, -0.1553962, 2.216596, 0.7450981, 0, 1, 1,
0.81444, 0.09137795, 0.3465346, 0.7529412, 0, 1, 1,
0.8307886, -0.9138136, 1.192297, 0.7568628, 0, 1, 1,
0.8320549, -0.1938262, 1.187969, 0.7647059, 0, 1, 1,
0.836842, 0.357956, 0.5931836, 0.7686275, 0, 1, 1,
0.8380578, -1.806237, 3.146048, 0.7764706, 0, 1, 1,
0.8486486, -0.8455054, 2.922812, 0.7803922, 0, 1, 1,
0.8496737, 0.3557873, 1.341294, 0.7882353, 0, 1, 1,
0.8505855, 0.330746, -0.6048938, 0.7921569, 0, 1, 1,
0.8518113, 1.579287, 0.9196422, 0.8, 0, 1, 1,
0.8541223, 1.122713, 1.710202, 0.8078431, 0, 1, 1,
0.8546801, -0.1766859, -0.6445527, 0.8117647, 0, 1, 1,
0.8567364, 1.287996, 0.6268606, 0.8196079, 0, 1, 1,
0.8578941, 0.7054176, 1.480115, 0.8235294, 0, 1, 1,
0.8714945, 0.02872105, 1.410648, 0.8313726, 0, 1, 1,
0.8759364, 2.041701, 0.3454036, 0.8352941, 0, 1, 1,
0.8814785, 0.5273811, 2.937593, 0.8431373, 0, 1, 1,
0.8820373, -0.3153038, 1.042975, 0.8470588, 0, 1, 1,
0.8836839, 0.07296049, 0.3479398, 0.854902, 0, 1, 1,
0.8902506, 0.5996863, 1.774993, 0.8588235, 0, 1, 1,
0.8912677, -0.9255539, 4.597232, 0.8666667, 0, 1, 1,
0.8952521, -0.424968, 0.7559955, 0.8705882, 0, 1, 1,
0.8973682, 0.3513472, 1.09933, 0.8784314, 0, 1, 1,
0.8983178, 1.336364, 0.3161843, 0.8823529, 0, 1, 1,
0.904896, 0.2644957, 1.19776, 0.8901961, 0, 1, 1,
0.9058335, 0.6124864, 0.6954489, 0.8941177, 0, 1, 1,
0.9096609, -1.282053, 2.432422, 0.9019608, 0, 1, 1,
0.9114746, 0.6414647, -0.5257083, 0.9098039, 0, 1, 1,
0.9123181, -0.9423687, 2.125644, 0.9137255, 0, 1, 1,
0.9153621, 1.813375, -1.083858, 0.9215686, 0, 1, 1,
0.9172998, -1.703705, 2.561996, 0.9254902, 0, 1, 1,
0.9255476, 1.395372, -0.1798731, 0.9333333, 0, 1, 1,
0.9294941, 1.260621, 0.089261, 0.9372549, 0, 1, 1,
0.9354135, -0.9119141, 4.09784, 0.945098, 0, 1, 1,
0.9360223, 1.119059, 0.1951347, 0.9490196, 0, 1, 1,
0.941008, 0.6914519, 1.822205, 0.9568627, 0, 1, 1,
0.941492, 0.7681732, -0.2224647, 0.9607843, 0, 1, 1,
0.9571412, 1.50199, 2.426607, 0.9686275, 0, 1, 1,
0.9622944, 0.5583002, 1.49366, 0.972549, 0, 1, 1,
0.9661413, -0.4436276, 3.377621, 0.9803922, 0, 1, 1,
0.9675886, -0.9391028, 1.938052, 0.9843137, 0, 1, 1,
0.9734589, 0.7815889, -0.5210602, 0.9921569, 0, 1, 1,
0.9755412, 1.728513, 2.776271, 0.9960784, 0, 1, 1,
0.9837323, -0.7272464, 1.523914, 1, 0, 0.9960784, 1,
0.9894489, -0.2285331, 1.157564, 1, 0, 0.9882353, 1,
1.007598, -1.7407, 2.170866, 1, 0, 0.9843137, 1,
1.011578, 0.343403, -0.02796021, 1, 0, 0.9764706, 1,
1.012143, -1.127143, 1.782782, 1, 0, 0.972549, 1,
1.019066, -0.6788577, 0.970964, 1, 0, 0.9647059, 1,
1.02005, -1.508482, 1.068656, 1, 0, 0.9607843, 1,
1.027014, -0.4485705, 3.467382, 1, 0, 0.9529412, 1,
1.030676, -0.6080834, 2.089908, 1, 0, 0.9490196, 1,
1.033594, 0.2667118, 1.602484, 1, 0, 0.9411765, 1,
1.055386, -0.3479277, 3.299648, 1, 0, 0.9372549, 1,
1.058726, 0.3550144, 1.301757, 1, 0, 0.9294118, 1,
1.05963, 1.008416, -0.2750686, 1, 0, 0.9254902, 1,
1.067197, -1.364975, 1.078722, 1, 0, 0.9176471, 1,
1.067928, -1.532501, 2.227911, 1, 0, 0.9137255, 1,
1.072749, -0.05163985, 1.840854, 1, 0, 0.9058824, 1,
1.082437, -0.5696378, 2.518646, 1, 0, 0.9019608, 1,
1.086186, 0.4447908, 0.8891016, 1, 0, 0.8941177, 1,
1.088177, -0.04196364, 1.762849, 1, 0, 0.8862745, 1,
1.097083, -0.555185, 2.155821, 1, 0, 0.8823529, 1,
1.106494, 0.0257, 1.621478, 1, 0, 0.8745098, 1,
1.113065, -0.09997164, 0.1553846, 1, 0, 0.8705882, 1,
1.114419, 0.3641422, 1.576208, 1, 0, 0.8627451, 1,
1.121181, -0.09289972, 0.8686646, 1, 0, 0.8588235, 1,
1.122912, 0.4091348, 0.2728013, 1, 0, 0.8509804, 1,
1.130159, 2.0635, -1.150545, 1, 0, 0.8470588, 1,
1.132705, 1.055474, -0.9873019, 1, 0, 0.8392157, 1,
1.144398, 1.044595, 2.620124, 1, 0, 0.8352941, 1,
1.152116, 0.08751529, 1.249032, 1, 0, 0.827451, 1,
1.153989, 0.8187384, 2.1368, 1, 0, 0.8235294, 1,
1.157565, -1.83018, 2.55478, 1, 0, 0.8156863, 1,
1.16087, -1.207046, 2.14806, 1, 0, 0.8117647, 1,
1.163777, 0.7581108, 1.774033, 1, 0, 0.8039216, 1,
1.171941, 1.574836, 1.641968, 1, 0, 0.7960784, 1,
1.174218, -0.22292, 1.510076, 1, 0, 0.7921569, 1,
1.178463, -1.39638, 2.08291, 1, 0, 0.7843137, 1,
1.188186, 1.165126, 1.315409, 1, 0, 0.7803922, 1,
1.200698, -1.812126, 0.5713817, 1, 0, 0.772549, 1,
1.209454, 0.656661, 2.376848, 1, 0, 0.7686275, 1,
1.213441, 0.1646389, 0.2617914, 1, 0, 0.7607843, 1,
1.21803, 2.021997, 0.0261106, 1, 0, 0.7568628, 1,
1.219145, 1.434712, 1.42755, 1, 0, 0.7490196, 1,
1.220639, -0.9126364, 2.134669, 1, 0, 0.7450981, 1,
1.232071, 0.4057499, 0.5282922, 1, 0, 0.7372549, 1,
1.233125, 0.1027031, 1.488017, 1, 0, 0.7333333, 1,
1.237916, -0.2804787, 3.01327, 1, 0, 0.7254902, 1,
1.239052, 0.8978839, 0.4538675, 1, 0, 0.7215686, 1,
1.241694, -0.3090172, 1.41424, 1, 0, 0.7137255, 1,
1.243686, 0.3463196, -0.02224093, 1, 0, 0.7098039, 1,
1.247837, 0.1540331, -1.503319, 1, 0, 0.7019608, 1,
1.25319, -0.2722028, 1.359862, 1, 0, 0.6941177, 1,
1.260632, -1.306529, 1.542515, 1, 0, 0.6901961, 1,
1.268772, -0.1443175, 4.114278, 1, 0, 0.682353, 1,
1.278669, 0.1638549, -0.223978, 1, 0, 0.6784314, 1,
1.286478, 1.89025, 2.837484, 1, 0, 0.6705883, 1,
1.290975, -1.24885, 3.577115, 1, 0, 0.6666667, 1,
1.292937, 0.8930477, 1.099924, 1, 0, 0.6588235, 1,
1.307472, -0.3810923, 2.427657, 1, 0, 0.654902, 1,
1.31505, -0.4221083, 1.719116, 1, 0, 0.6470588, 1,
1.324402, -0.8904978, 3.016028, 1, 0, 0.6431373, 1,
1.325326, -0.1763301, 2.85338, 1, 0, 0.6352941, 1,
1.325884, -0.4610435, 1.589145, 1, 0, 0.6313726, 1,
1.329427, 1.683316, 0.9192083, 1, 0, 0.6235294, 1,
1.335955, 2.016151, 1.54284, 1, 0, 0.6196079, 1,
1.33826, -2.772199, 4.346539, 1, 0, 0.6117647, 1,
1.345053, 1.509821, 0.2373157, 1, 0, 0.6078432, 1,
1.346992, -1.13067, 0.2084107, 1, 0, 0.6, 1,
1.352335, 0.8544289, -0.2235953, 1, 0, 0.5921569, 1,
1.370561, -1.163287, 2.660198, 1, 0, 0.5882353, 1,
1.381778, -0.3403134, 2.228644, 1, 0, 0.5803922, 1,
1.39953, 0.6082735, -0.298411, 1, 0, 0.5764706, 1,
1.404723, 0.263575, 2.089557, 1, 0, 0.5686275, 1,
1.406824, 0.07112879, 1.401057, 1, 0, 0.5647059, 1,
1.408606, -0.2469314, 0.9804204, 1, 0, 0.5568628, 1,
1.409423, -0.4845623, 0.8714087, 1, 0, 0.5529412, 1,
1.410449, -1.588074, 2.511239, 1, 0, 0.5450981, 1,
1.419818, 0.3018688, 1.425277, 1, 0, 0.5411765, 1,
1.420129, -0.8133815, 1.158382, 1, 0, 0.5333334, 1,
1.421319, 0.7506065, 1.095614, 1, 0, 0.5294118, 1,
1.427793, 0.2101752, 0.2257029, 1, 0, 0.5215687, 1,
1.436861, -1.028144, 2.729241, 1, 0, 0.5176471, 1,
1.441355, 2.418434, 1.712974, 1, 0, 0.509804, 1,
1.442147, -0.4902579, 1.801691, 1, 0, 0.5058824, 1,
1.452097, -1.072517, 2.83609, 1, 0, 0.4980392, 1,
1.464137, -0.117834, 2.132406, 1, 0, 0.4901961, 1,
1.478642, -1.751831, 2.381814, 1, 0, 0.4862745, 1,
1.478971, 1.118673, 0.8923904, 1, 0, 0.4784314, 1,
1.484124, 0.9889128, 0.9454016, 1, 0, 0.4745098, 1,
1.489788, 1.533737, 1.261595, 1, 0, 0.4666667, 1,
1.491041, 0.5531389, 0.7181024, 1, 0, 0.4627451, 1,
1.491605, -0.1537073, 0.8710938, 1, 0, 0.454902, 1,
1.494109, 0.9425905, 0.6127267, 1, 0, 0.4509804, 1,
1.495611, -0.3460695, 1.195808, 1, 0, 0.4431373, 1,
1.517063, 0.8015966, 2.607045, 1, 0, 0.4392157, 1,
1.520419, 0.1636032, -0.841522, 1, 0, 0.4313726, 1,
1.523235, -0.1418558, 2.247759, 1, 0, 0.427451, 1,
1.540155, -0.4461699, 0.6038481, 1, 0, 0.4196078, 1,
1.544741, -0.1820389, 2.872781, 1, 0, 0.4156863, 1,
1.551505, 0.5560597, 3.023105, 1, 0, 0.4078431, 1,
1.561144, 0.9422581, 1.861375, 1, 0, 0.4039216, 1,
1.566719, 0.07306176, 1.629234, 1, 0, 0.3960784, 1,
1.58091, -0.8851182, 0.819763, 1, 0, 0.3882353, 1,
1.582173, -0.4121357, 2.878268, 1, 0, 0.3843137, 1,
1.606122, 0.2099212, 1.140162, 1, 0, 0.3764706, 1,
1.612266, 0.5382341, 2.106323, 1, 0, 0.372549, 1,
1.614139, 0.9248515, 0.7949654, 1, 0, 0.3647059, 1,
1.623394, 0.128284, 1.252239, 1, 0, 0.3607843, 1,
1.629925, -1.148765, 0.5390433, 1, 0, 0.3529412, 1,
1.641693, 0.04308258, 0.5292143, 1, 0, 0.3490196, 1,
1.644888, -0.8483298, 1.256468, 1, 0, 0.3411765, 1,
1.647137, 1.071082, -0.1257415, 1, 0, 0.3372549, 1,
1.658425, 2.189254, -0.6943363, 1, 0, 0.3294118, 1,
1.67398, 0.07198216, 3.11223, 1, 0, 0.3254902, 1,
1.677259, -0.5313461, 1.365849, 1, 0, 0.3176471, 1,
1.681871, 1.300389, 2.882947, 1, 0, 0.3137255, 1,
1.695139, 0.1202898, 1.346687, 1, 0, 0.3058824, 1,
1.698631, 0.06448735, 2.214209, 1, 0, 0.2980392, 1,
1.712822, 0.4832743, 1.485456, 1, 0, 0.2941177, 1,
1.715078, -1.29569, 1.743854, 1, 0, 0.2862745, 1,
1.733294, 1.160451, -1.334967, 1, 0, 0.282353, 1,
1.740977, -0.7512825, 2.758944, 1, 0, 0.2745098, 1,
1.759391, -0.5598139, 2.61213, 1, 0, 0.2705882, 1,
1.761845, 0.2192722, 2.027512, 1, 0, 0.2627451, 1,
1.777849, 0.9284474, 0.7543997, 1, 0, 0.2588235, 1,
1.792698, 1.27653, 1.203377, 1, 0, 0.2509804, 1,
1.808506, 1.500963, -0.589721, 1, 0, 0.2470588, 1,
1.818604, 0.3270075, 2.28039, 1, 0, 0.2392157, 1,
1.82448, 0.7124596, 1.508151, 1, 0, 0.2352941, 1,
1.827868, 1.009367, -0.4839732, 1, 0, 0.227451, 1,
1.828008, 0.1354156, 2.607783, 1, 0, 0.2235294, 1,
1.83361, 0.4222826, 0.8681075, 1, 0, 0.2156863, 1,
1.835408, 0.118621, 0.5013216, 1, 0, 0.2117647, 1,
1.839602, 0.02301161, 1.418545, 1, 0, 0.2039216, 1,
1.852633, 1.984418, -0.004313517, 1, 0, 0.1960784, 1,
1.853376, 1.979492, 0.5612574, 1, 0, 0.1921569, 1,
1.877164, -0.9017028, 1.137773, 1, 0, 0.1843137, 1,
1.958887, 0.292529, 1.938885, 1, 0, 0.1803922, 1,
2.043838, -0.5764353, 2.700397, 1, 0, 0.172549, 1,
2.055825, 0.6021953, 1.603351, 1, 0, 0.1686275, 1,
2.068412, -1.506337, 0.7503205, 1, 0, 0.1607843, 1,
2.104934, 0.9993507, -0.0417496, 1, 0, 0.1568628, 1,
2.110046, 0.9864562, 0.08353755, 1, 0, 0.1490196, 1,
2.13319, 1.389421, 0.1378337, 1, 0, 0.145098, 1,
2.140112, -1.265172, 2.732466, 1, 0, 0.1372549, 1,
2.143109, 0.6169832, 1.685098, 1, 0, 0.1333333, 1,
2.192443, -0.240352, 1.848644, 1, 0, 0.1254902, 1,
2.214233, -0.7282853, 1.326257, 1, 0, 0.1215686, 1,
2.242343, 0.5508261, 2.06244, 1, 0, 0.1137255, 1,
2.244527, -0.899919, 2.631388, 1, 0, 0.1098039, 1,
2.284176, -0.2381826, 3.381735, 1, 0, 0.1019608, 1,
2.317107, 0.8155648, 3.105826, 1, 0, 0.09411765, 1,
2.333474, 0.2524246, 2.90933, 1, 0, 0.09019608, 1,
2.353338, 1.367086, 1.579575, 1, 0, 0.08235294, 1,
2.422515, 0.02988037, 1.523712, 1, 0, 0.07843138, 1,
2.422774, -0.1144707, 1.73137, 1, 0, 0.07058824, 1,
2.423456, -0.09146994, 0.3081686, 1, 0, 0.06666667, 1,
2.423918, -1.012176, 2.244033, 1, 0, 0.05882353, 1,
2.478901, -0.3012069, 2.277562, 1, 0, 0.05490196, 1,
2.55651, -0.3424306, 1.80288, 1, 0, 0.04705882, 1,
2.841337, -0.3355593, 1.074435, 1, 0, 0.04313726, 1,
2.958195, -0.486613, 1.910428, 1, 0, 0.03529412, 1,
3.100883, 0.1023898, 1.14072, 1, 0, 0.03137255, 1,
3.332595, -0.2198837, 2.82484, 1, 0, 0.02352941, 1,
3.447529, 0.8535603, 0.6881453, 1, 0, 0.01960784, 1,
3.46169, 1.822886, 0.8807423, 1, 0, 0.01176471, 1,
3.831051, 0.59199, -0.1520418, 1, 0, 0.007843138, 1
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
0.2772973, -4.166277, -7.325287, 0, -0.5, 0.5, 0.5,
0.2772973, -4.166277, -7.325287, 1, -0.5, 0.5, 0.5,
0.2772973, -4.166277, -7.325287, 1, 1.5, 0.5, 0.5,
0.2772973, -4.166277, -7.325287, 0, 1.5, 0.5, 0.5
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
-4.481179, -0.03267193, -7.325287, 0, -0.5, 0.5, 0.5,
-4.481179, -0.03267193, -7.325287, 1, -0.5, 0.5, 0.5,
-4.481179, -0.03267193, -7.325287, 1, 1.5, 0.5, 0.5,
-4.481179, -0.03267193, -7.325287, 0, 1.5, 0.5, 0.5
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
-4.481179, -4.166277, -0.1931386, 0, -0.5, 0.5, 0.5,
-4.481179, -4.166277, -0.1931386, 1, -0.5, 0.5, 0.5,
-4.481179, -4.166277, -0.1931386, 1, 1.5, 0.5, 0.5,
-4.481179, -4.166277, -0.1931386, 0, 1.5, 0.5, 0.5
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
-2, -3.212368, -5.679407,
2, -3.212368, -5.679407,
-2, -3.212368, -5.679407,
-2, -3.371353, -5.953721,
0, -3.212368, -5.679407,
0, -3.371353, -5.953721,
2, -3.212368, -5.679407,
2, -3.371353, -5.953721
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
-2, -3.689323, -6.502347, 0, -0.5, 0.5, 0.5,
-2, -3.689323, -6.502347, 1, -0.5, 0.5, 0.5,
-2, -3.689323, -6.502347, 1, 1.5, 0.5, 0.5,
-2, -3.689323, -6.502347, 0, 1.5, 0.5, 0.5,
0, -3.689323, -6.502347, 0, -0.5, 0.5, 0.5,
0, -3.689323, -6.502347, 1, -0.5, 0.5, 0.5,
0, -3.689323, -6.502347, 1, 1.5, 0.5, 0.5,
0, -3.689323, -6.502347, 0, 1.5, 0.5, 0.5,
2, -3.689323, -6.502347, 0, -0.5, 0.5, 0.5,
2, -3.689323, -6.502347, 1, -0.5, 0.5, 0.5,
2, -3.689323, -6.502347, 1, 1.5, 0.5, 0.5,
2, -3.689323, -6.502347, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.383069, -3, -5.679407,
-3.383069, 3, -5.679407,
-3.383069, -3, -5.679407,
-3.566087, -3, -5.953721,
-3.383069, -2, -5.679407,
-3.566087, -2, -5.953721,
-3.383069, -1, -5.679407,
-3.566087, -1, -5.953721,
-3.383069, 0, -5.679407,
-3.566087, 0, -5.953721,
-3.383069, 1, -5.679407,
-3.566087, 1, -5.953721,
-3.383069, 2, -5.679407,
-3.566087, 2, -5.953721,
-3.383069, 3, -5.679407,
-3.566087, 3, -5.953721
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
-3.932124, -3, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, -3, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, -3, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, -3, -6.502347, 0, 1.5, 0.5, 0.5,
-3.932124, -2, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, -2, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, -2, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, -2, -6.502347, 0, 1.5, 0.5, 0.5,
-3.932124, -1, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, -1, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, -1, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, -1, -6.502347, 0, 1.5, 0.5, 0.5,
-3.932124, 0, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, 0, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, 0, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, 0, -6.502347, 0, 1.5, 0.5, 0.5,
-3.932124, 1, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, 1, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, 1, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, 1, -6.502347, 0, 1.5, 0.5, 0.5,
-3.932124, 2, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, 2, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, 2, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, 2, -6.502347, 0, 1.5, 0.5, 0.5,
-3.932124, 3, -6.502347, 0, -0.5, 0.5, 0.5,
-3.932124, 3, -6.502347, 1, -0.5, 0.5, 0.5,
-3.932124, 3, -6.502347, 1, 1.5, 0.5, 0.5,
-3.932124, 3, -6.502347, 0, 1.5, 0.5, 0.5
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
-3.383069, -3.212368, -4,
-3.383069, -3.212368, 4,
-3.383069, -3.212368, -4,
-3.566087, -3.371353, -4,
-3.383069, -3.212368, -2,
-3.566087, -3.371353, -2,
-3.383069, -3.212368, 0,
-3.566087, -3.371353, 0,
-3.383069, -3.212368, 2,
-3.566087, -3.371353, 2,
-3.383069, -3.212368, 4,
-3.566087, -3.371353, 4
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
-3.932124, -3.689323, -4, 0, -0.5, 0.5, 0.5,
-3.932124, -3.689323, -4, 1, -0.5, 0.5, 0.5,
-3.932124, -3.689323, -4, 1, 1.5, 0.5, 0.5,
-3.932124, -3.689323, -4, 0, 1.5, 0.5, 0.5,
-3.932124, -3.689323, -2, 0, -0.5, 0.5, 0.5,
-3.932124, -3.689323, -2, 1, -0.5, 0.5, 0.5,
-3.932124, -3.689323, -2, 1, 1.5, 0.5, 0.5,
-3.932124, -3.689323, -2, 0, 1.5, 0.5, 0.5,
-3.932124, -3.689323, 0, 0, -0.5, 0.5, 0.5,
-3.932124, -3.689323, 0, 1, -0.5, 0.5, 0.5,
-3.932124, -3.689323, 0, 1, 1.5, 0.5, 0.5,
-3.932124, -3.689323, 0, 0, 1.5, 0.5, 0.5,
-3.932124, -3.689323, 2, 0, -0.5, 0.5, 0.5,
-3.932124, -3.689323, 2, 1, -0.5, 0.5, 0.5,
-3.932124, -3.689323, 2, 1, 1.5, 0.5, 0.5,
-3.932124, -3.689323, 2, 0, 1.5, 0.5, 0.5,
-3.932124, -3.689323, 4, 0, -0.5, 0.5, 0.5,
-3.932124, -3.689323, 4, 1, -0.5, 0.5, 0.5,
-3.932124, -3.689323, 4, 1, 1.5, 0.5, 0.5,
-3.932124, -3.689323, 4, 0, 1.5, 0.5, 0.5
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
-3.383069, -3.212368, -5.679407,
-3.383069, 3.147024, -5.679407,
-3.383069, -3.212368, 5.29313,
-3.383069, 3.147024, 5.29313,
-3.383069, -3.212368, -5.679407,
-3.383069, -3.212368, 5.29313,
-3.383069, 3.147024, -5.679407,
-3.383069, 3.147024, 5.29313,
-3.383069, -3.212368, -5.679407,
3.937664, -3.212368, -5.679407,
-3.383069, -3.212368, 5.29313,
3.937664, -3.212368, 5.29313,
-3.383069, 3.147024, -5.679407,
3.937664, 3.147024, -5.679407,
-3.383069, 3.147024, 5.29313,
3.937664, 3.147024, 5.29313,
3.937664, -3.212368, -5.679407,
3.937664, 3.147024, -5.679407,
3.937664, -3.212368, 5.29313,
3.937664, 3.147024, 5.29313,
3.937664, -3.212368, -5.679407,
3.937664, -3.212368, 5.29313,
3.937664, 3.147024, -5.679407,
3.937664, 3.147024, 5.29313
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
var radius = 7.819335;
var distance = 34.7891;
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
mvMatrix.translate( -0.2772973, 0.03267193, 0.1931386 );
mvMatrix.scale( 1.15486, 1.329438, 0.7705072 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.7891);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Tebufenpyrad<-read.table("Tebufenpyrad.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tebufenpyrad$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tebufenpyrad' not found
```

```r
y<-Tebufenpyrad$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tebufenpyrad' not found
```

```r
z<-Tebufenpyrad$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tebufenpyrad' not found
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
-3.276456, 0.1458737, -1.116168, 0, 0, 1, 1, 1,
-2.92119, -0.9487422, -2.175946, 1, 0, 0, 1, 1,
-2.877023, 1.009572, -0.05377851, 1, 0, 0, 1, 1,
-2.763388, 0.8841271, -0.6603535, 1, 0, 0, 1, 1,
-2.680988, 0.2481412, -0.9949515, 1, 0, 0, 1, 1,
-2.650651, 0.4745661, -0.1595667, 1, 0, 0, 1, 1,
-2.554148, -1.586423, -2.993816, 0, 0, 0, 1, 1,
-2.526205, -0.6755023, -2.377834, 0, 0, 0, 1, 1,
-2.477904, 0.4221706, -0.703299, 0, 0, 0, 1, 1,
-2.456233, 1.185503, -1.930181, 0, 0, 0, 1, 1,
-2.408867, 0.833068, -1.859518, 0, 0, 0, 1, 1,
-2.297605, 1.538289, -1.735436, 0, 0, 0, 1, 1,
-2.281953, 1.407727, -2.908955, 0, 0, 0, 1, 1,
-2.26277, 0.9702271, -0.08578913, 1, 1, 1, 1, 1,
-2.218083, 1.808987, 0.153499, 1, 1, 1, 1, 1,
-2.198631, -0.7135621, -1.868065, 1, 1, 1, 1, 1,
-2.188976, 1.570235, 0.1108791, 1, 1, 1, 1, 1,
-2.186385, 1.979169, -0.09388078, 1, 1, 1, 1, 1,
-2.159439, 0.7647927, -2.099833, 1, 1, 1, 1, 1,
-2.125356, 0.2621871, -1.675831, 1, 1, 1, 1, 1,
-2.124782, -1.007885, -2.320752, 1, 1, 1, 1, 1,
-2.086097, -1.300777, -2.184023, 1, 1, 1, 1, 1,
-2.077361, -0.2390777, -2.714528, 1, 1, 1, 1, 1,
-2.044832, 0.6816764, -1.663636, 1, 1, 1, 1, 1,
-2.026569, -0.7390627, -1.376618, 1, 1, 1, 1, 1,
-2.007451, 0.8720999, -0.5571873, 1, 1, 1, 1, 1,
-1.967766, 0.5216929, -0.4322191, 1, 1, 1, 1, 1,
-1.933973, 0.5415128, -0.1543037, 1, 1, 1, 1, 1,
-1.923846, -0.8697463, -1.432876, 0, 0, 1, 1, 1,
-1.920513, 0.9358202, -0.3261228, 1, 0, 0, 1, 1,
-1.91668, -1.670291, -1.177648, 1, 0, 0, 1, 1,
-1.915154, 1.57915, -1.4674, 1, 0, 0, 1, 1,
-1.910255, -0.9466273, -1.640983, 1, 0, 0, 1, 1,
-1.905478, -2.161564, -2.208833, 1, 0, 0, 1, 1,
-1.890113, -0.05663884, -2.349344, 0, 0, 0, 1, 1,
-1.872519, -1.231254, -0.9273288, 0, 0, 0, 1, 1,
-1.871735, 1.43701, -0.2879164, 0, 0, 0, 1, 1,
-1.869184, 0.7795054, -1.200879, 0, 0, 0, 1, 1,
-1.849416, 0.2415244, -2.56214, 0, 0, 0, 1, 1,
-1.837487, -1.616059, -2.827162, 0, 0, 0, 1, 1,
-1.835782, 0.2608516, -1.029247, 0, 0, 0, 1, 1,
-1.834049, 1.641676, -1.352782, 1, 1, 1, 1, 1,
-1.824802, 2.2931, -0.1731325, 1, 1, 1, 1, 1,
-1.81955, -0.2754475, -2.115322, 1, 1, 1, 1, 1,
-1.810702, 0.8388029, -1.573655, 1, 1, 1, 1, 1,
-1.799231, -0.8372165, -3.202117, 1, 1, 1, 1, 1,
-1.77853, 0.4303955, -0.6819499, 1, 1, 1, 1, 1,
-1.775898, 1.331288, 0.0471622, 1, 1, 1, 1, 1,
-1.767768, 0.3943145, -0.8325992, 1, 1, 1, 1, 1,
-1.765178, 0.3470078, -3.120241, 1, 1, 1, 1, 1,
-1.753758, -0.9106139, -3.68634, 1, 1, 1, 1, 1,
-1.746198, -0.9174759, -3.272729, 1, 1, 1, 1, 1,
-1.709439, -1.340958, -2.757412, 1, 1, 1, 1, 1,
-1.709084, -0.04737241, -2.147015, 1, 1, 1, 1, 1,
-1.682193, -0.5785377, -1.32255, 1, 1, 1, 1, 1,
-1.675235, 0.9359631, -0.9355824, 1, 1, 1, 1, 1,
-1.670009, -1.810146, -2.406809, 0, 0, 1, 1, 1,
-1.645486, 1.469181, -0.5449371, 1, 0, 0, 1, 1,
-1.617077, -1.777717, -2.333005, 1, 0, 0, 1, 1,
-1.615033, 0.217913, -3.178271, 1, 0, 0, 1, 1,
-1.604919, -0.5417665, -2.444545, 1, 0, 0, 1, 1,
-1.596863, -0.2686002, -1.661959, 1, 0, 0, 1, 1,
-1.594752, -0.1825574, -3.015333, 0, 0, 0, 1, 1,
-1.588839, -1.669792, -2.25669, 0, 0, 0, 1, 1,
-1.587776, -0.1663719, -2.984292, 0, 0, 0, 1, 1,
-1.583841, 1.83092, -0.6220453, 0, 0, 0, 1, 1,
-1.582058, 1.804577, -0.8108351, 0, 0, 0, 1, 1,
-1.5766, 0.4449924, -2.412886, 0, 0, 0, 1, 1,
-1.548865, -0.05976136, -3.055987, 0, 0, 0, 1, 1,
-1.546344, -1.030977, -2.406549, 1, 1, 1, 1, 1,
-1.536966, 1.262773, 0.1305593, 1, 1, 1, 1, 1,
-1.534704, -0.509427, -2.1311, 1, 1, 1, 1, 1,
-1.532457, -1.531688, -2.021075, 1, 1, 1, 1, 1,
-1.528133, 0.7388203, -0.7276935, 1, 1, 1, 1, 1,
-1.516906, -0.4698148, -1.885607, 1, 1, 1, 1, 1,
-1.507039, -0.4192703, -1.766135, 1, 1, 1, 1, 1,
-1.500554, -0.320687, -1.683143, 1, 1, 1, 1, 1,
-1.499264, 0.6749089, 0.610859, 1, 1, 1, 1, 1,
-1.497488, -0.1670586, -1.228784, 1, 1, 1, 1, 1,
-1.488462, -1.427428, -2.547355, 1, 1, 1, 1, 1,
-1.474756, -1.118004, -1.554073, 1, 1, 1, 1, 1,
-1.467324, 1.148616, 0.320955, 1, 1, 1, 1, 1,
-1.462865, -2.111508, -2.03165, 1, 1, 1, 1, 1,
-1.461096, -0.09945985, -2.882358, 1, 1, 1, 1, 1,
-1.45829, -0.728688, -2.964233, 0, 0, 1, 1, 1,
-1.450498, -1.316624, -2.111931, 1, 0, 0, 1, 1,
-1.450239, -0.2005059, -3.018851, 1, 0, 0, 1, 1,
-1.447899, 1.327839, -2.256032, 1, 0, 0, 1, 1,
-1.416643, 0.80124, -1.998563, 1, 0, 0, 1, 1,
-1.416102, 1.758397, -1.042512, 1, 0, 0, 1, 1,
-1.402358, -0.9161785, -0.06176115, 0, 0, 0, 1, 1,
-1.387887, -1.728629, -3.86302, 0, 0, 0, 1, 1,
-1.383497, -0.7539344, -2.190378, 0, 0, 0, 1, 1,
-1.370437, 1.67048, -1.246258, 0, 0, 0, 1, 1,
-1.369457, 0.06317282, -1.016309, 0, 0, 0, 1, 1,
-1.364717, 1.13372, 0.7082149, 0, 0, 0, 1, 1,
-1.358355, 1.917775, -0.321872, 0, 0, 0, 1, 1,
-1.345933, 0.5245185, -0.9291084, 1, 1, 1, 1, 1,
-1.345802, 1.103373, 0.5383239, 1, 1, 1, 1, 1,
-1.338524, -0.5573666, -1.441162, 1, 1, 1, 1, 1,
-1.335162, 1.686462, -0.6259874, 1, 1, 1, 1, 1,
-1.334944, 1.217594, -2.359075, 1, 1, 1, 1, 1,
-1.331699, 0.8349983, -1.769564, 1, 1, 1, 1, 1,
-1.326034, 0.821168, -1.410679, 1, 1, 1, 1, 1,
-1.321673, 3.054412, -1.637068, 1, 1, 1, 1, 1,
-1.314056, -0.6926588, -2.658796, 1, 1, 1, 1, 1,
-1.298967, 0.1396861, -2.642199, 1, 1, 1, 1, 1,
-1.287276, -0.8327987, -2.374313, 1, 1, 1, 1, 1,
-1.284489, -0.1840235, -1.024876, 1, 1, 1, 1, 1,
-1.276675, -0.1786739, 0.5760712, 1, 1, 1, 1, 1,
-1.274698, 0.3682831, -2.790494, 1, 1, 1, 1, 1,
-1.273068, -1.886569, -3.716269, 1, 1, 1, 1, 1,
-1.269101, 0.08091082, 0.3214916, 0, 0, 1, 1, 1,
-1.265122, 1.869066, -0.8436996, 1, 0, 0, 1, 1,
-1.261681, 1.770858, -0.8008547, 1, 0, 0, 1, 1,
-1.256954, -0.01577949, -1.17907, 1, 0, 0, 1, 1,
-1.256399, 0.3930871, -1.125359, 1, 0, 0, 1, 1,
-1.250918, -0.7557628, -3.214461, 1, 0, 0, 1, 1,
-1.246661, 0.6705949, -1.115033, 0, 0, 0, 1, 1,
-1.239029, 1.571646, -0.5288991, 0, 0, 0, 1, 1,
-1.234739, 1.840827, -0.02482448, 0, 0, 0, 1, 1,
-1.23451, -0.5458677, -3.78996, 0, 0, 0, 1, 1,
-1.225018, 0.2498744, 0.6814225, 0, 0, 0, 1, 1,
-1.21136, 2.131533, -1.65427, 0, 0, 0, 1, 1,
-1.207373, 0.144376, -0.4989201, 0, 0, 0, 1, 1,
-1.20735, 1.431729, -0.6602473, 1, 1, 1, 1, 1,
-1.207103, 0.5558318, -0.2644105, 1, 1, 1, 1, 1,
-1.207069, -1.465041, -2.598874, 1, 1, 1, 1, 1,
-1.204422, 2.4175, -0.07878302, 1, 1, 1, 1, 1,
-1.194779, -1.550109, -2.544531, 1, 1, 1, 1, 1,
-1.191886, -0.4551466, -1.853799, 1, 1, 1, 1, 1,
-1.184179, 1.421002, -0.4047396, 1, 1, 1, 1, 1,
-1.181004, 1.003894, -1.351342, 1, 1, 1, 1, 1,
-1.178953, -1.826614, -1.182607, 1, 1, 1, 1, 1,
-1.174811, -1.032826, -1.826178, 1, 1, 1, 1, 1,
-1.172857, 0.8363778, -1.104628, 1, 1, 1, 1, 1,
-1.17265, 1.460432, -0.05878912, 1, 1, 1, 1, 1,
-1.158631, -0.4532376, -1.636727, 1, 1, 1, 1, 1,
-1.158113, 0.7506399, -1.223077, 1, 1, 1, 1, 1,
-1.140492, -0.4224235, -1.670136, 1, 1, 1, 1, 1,
-1.139176, 1.427506, -0.5432017, 0, 0, 1, 1, 1,
-1.137333, -1.577787, -4.153098, 1, 0, 0, 1, 1,
-1.131396, 0.4355098, -1.207119, 1, 0, 0, 1, 1,
-1.121356, -0.9971077, -2.299236, 1, 0, 0, 1, 1,
-1.121193, -0.7516978, -1.841034, 1, 0, 0, 1, 1,
-1.118425, -1.51189, -2.66743, 1, 0, 0, 1, 1,
-1.118075, -0.4057114, -1.738823, 0, 0, 0, 1, 1,
-1.113192, 2.596469, 1.138638, 0, 0, 0, 1, 1,
-1.107755, -0.178938, -2.590527, 0, 0, 0, 1, 1,
-1.096252, -0.5670087, -1.448858, 0, 0, 0, 1, 1,
-1.09282, -1.249518, -2.142203, 0, 0, 0, 1, 1,
-1.088146, -0.6504072, -1.615353, 0, 0, 0, 1, 1,
-1.074563, 0.4500918, 0.551001, 0, 0, 0, 1, 1,
-1.072821, -1.023803, -3.231812, 1, 1, 1, 1, 1,
-1.072203, -1.688544, -1.630252, 1, 1, 1, 1, 1,
-1.067751, -1.195969, -1.005024, 1, 1, 1, 1, 1,
-1.064262, -1.244335, -1.20239, 1, 1, 1, 1, 1,
-1.060912, 0.03595353, -0.9586911, 1, 1, 1, 1, 1,
-1.060824, -1.204688, -4.143709, 1, 1, 1, 1, 1,
-1.049739, -0.4850836, -1.800411, 1, 1, 1, 1, 1,
-1.045357, -2.113555, -2.865259, 1, 1, 1, 1, 1,
-1.044377, 0.3132539, -3.392608, 1, 1, 1, 1, 1,
-1.036462, 0.4811929, -0.7924311, 1, 1, 1, 1, 1,
-1.031987, -0.4362931, 0.03726909, 1, 1, 1, 1, 1,
-1.027141, 0.7850885, 2.335716, 1, 1, 1, 1, 1,
-1.023477, 0.6339946, -1.997064, 1, 1, 1, 1, 1,
-1.02111, -0.7872648, -3.638988, 1, 1, 1, 1, 1,
-1.007808, -2.010031, -2.194841, 1, 1, 1, 1, 1,
-1.00669, -0.9084377, -4.055197, 0, 0, 1, 1, 1,
-1.006383, -0.9977195, -0.9448287, 1, 0, 0, 1, 1,
-0.9949575, 1.405976, 0.221939, 1, 0, 0, 1, 1,
-0.986846, 1.542031, -1.782712, 1, 0, 0, 1, 1,
-0.9806018, -1.013975, -2.637801, 1, 0, 0, 1, 1,
-0.9779695, -0.6741193, -2.513329, 1, 0, 0, 1, 1,
-0.9718792, 0.6001337, -2.806185, 0, 0, 0, 1, 1,
-0.9689944, 0.02652545, -1.161127, 0, 0, 0, 1, 1,
-0.9682754, -0.3598692, -0.9756184, 0, 0, 0, 1, 1,
-0.9664848, -0.7396109, -0.797801, 0, 0, 0, 1, 1,
-0.9586525, -0.4183274, -2.468527, 0, 0, 0, 1, 1,
-0.957375, -0.2986746, -2.63248, 0, 0, 0, 1, 1,
-0.9539562, -1.214803, -2.701016, 0, 0, 0, 1, 1,
-0.9522026, -0.5948335, -2.450817, 1, 1, 1, 1, 1,
-0.9487271, 0.3658783, -0.1442907, 1, 1, 1, 1, 1,
-0.9423791, 0.2648027, -1.78433, 1, 1, 1, 1, 1,
-0.9421274, 0.2082706, -0.6819803, 1, 1, 1, 1, 1,
-0.9288048, 0.2309782, -2.053163, 1, 1, 1, 1, 1,
-0.9206007, 0.3825082, -1.644298, 1, 1, 1, 1, 1,
-0.9195997, -0.1012378, 0.3473934, 1, 1, 1, 1, 1,
-0.9192912, 3.054152, -0.2158569, 1, 1, 1, 1, 1,
-0.9178728, -0.1216225, -0.8610309, 1, 1, 1, 1, 1,
-0.9162514, -0.4583483, -0.1788874, 1, 1, 1, 1, 1,
-0.914472, 1.225301, 0.3841522, 1, 1, 1, 1, 1,
-0.9140447, 0.4837568, -1.408565, 1, 1, 1, 1, 1,
-0.9091479, -0.09037232, -1.432579, 1, 1, 1, 1, 1,
-0.9068571, -0.5776038, -3.490299, 1, 1, 1, 1, 1,
-0.8951771, -2.185389, -3.444428, 1, 1, 1, 1, 1,
-0.8857943, -0.03184889, -0.175228, 0, 0, 1, 1, 1,
-0.8830324, -1.694568, -1.638337, 1, 0, 0, 1, 1,
-0.877808, 0.8793463, -0.8053434, 1, 0, 0, 1, 1,
-0.8722484, -0.2265921, -1.898737, 1, 0, 0, 1, 1,
-0.872053, 1.334287, 0.7760103, 1, 0, 0, 1, 1,
-0.8715999, -2.698921, -3.155457, 1, 0, 0, 1, 1,
-0.86857, -1.274345, -3.26584, 0, 0, 0, 1, 1,
-0.8622336, -0.7091914, -3.477813, 0, 0, 0, 1, 1,
-0.8621958, -2.296008, -3.718704, 0, 0, 0, 1, 1,
-0.8545399, -0.4042902, -2.351789, 0, 0, 0, 1, 1,
-0.8471139, -0.4790097, -3.696628, 0, 0, 0, 1, 1,
-0.8438718, -0.05709837, -2.632985, 0, 0, 0, 1, 1,
-0.8371732, 1.983232, -1.432007, 0, 0, 0, 1, 1,
-0.8289403, -1.262014, -0.4826684, 1, 1, 1, 1, 1,
-0.8257818, -0.2327495, -1.72323, 1, 1, 1, 1, 1,
-0.8217742, -0.1131934, -0.6763216, 1, 1, 1, 1, 1,
-0.8166348, -0.7614983, -2.337049, 1, 1, 1, 1, 1,
-0.8134369, -0.2057199, -1.391729, 1, 1, 1, 1, 1,
-0.812112, -0.8381197, -3.031155, 1, 1, 1, 1, 1,
-0.8107519, 0.04826026, -1.203313, 1, 1, 1, 1, 1,
-0.8049632, 2.191478, -1.058029, 1, 1, 1, 1, 1,
-0.7884297, 0.5060377, 0.10479, 1, 1, 1, 1, 1,
-0.7875213, -1.039445, 0.03635079, 1, 1, 1, 1, 1,
-0.7875105, -1.671216, -2.59364, 1, 1, 1, 1, 1,
-0.7871388, 0.6234569, -0.2626641, 1, 1, 1, 1, 1,
-0.783637, -2.096933, -5.519613, 1, 1, 1, 1, 1,
-0.7827163, -1.491564, -1.786947, 1, 1, 1, 1, 1,
-0.780096, -0.0512977, -0.866857, 1, 1, 1, 1, 1,
-0.7766295, 0.3355139, -1.218795, 0, 0, 1, 1, 1,
-0.7692027, 0.003112345, 0.2760821, 1, 0, 0, 1, 1,
-0.7681964, -1.34395, -1.355535, 1, 0, 0, 1, 1,
-0.7638037, -0.6293905, -1.083802, 1, 0, 0, 1, 1,
-0.7611074, 0.6344525, -1.467089, 1, 0, 0, 1, 1,
-0.7579062, -0.06771679, -2.012502, 1, 0, 0, 1, 1,
-0.7574142, -0.1218386, -2.401684, 0, 0, 0, 1, 1,
-0.7546613, 2.244642, -0.4878624, 0, 0, 0, 1, 1,
-0.7515621, 0.1180056, -1.638974, 0, 0, 0, 1, 1,
-0.7508861, -1.052952, -3.512141, 0, 0, 0, 1, 1,
-0.7501776, -1.056256, -3.409202, 0, 0, 0, 1, 1,
-0.7456841, 0.5586457, -0.6889698, 0, 0, 0, 1, 1,
-0.7381394, 0.9868, 1.189796, 0, 0, 0, 1, 1,
-0.7341548, -0.7328455, -1.404499, 1, 1, 1, 1, 1,
-0.7297625, -0.6598828, -2.745668, 1, 1, 1, 1, 1,
-0.7271131, -0.2071832, -2.01744, 1, 1, 1, 1, 1,
-0.7231423, 0.8116876, -2.102222, 1, 1, 1, 1, 1,
-0.7213891, -0.1170869, -2.781271, 1, 1, 1, 1, 1,
-0.7205225, -0.118437, -1.025231, 1, 1, 1, 1, 1,
-0.7160142, -0.6683016, -1.27203, 1, 1, 1, 1, 1,
-0.7155561, 0.2493338, -2.092703, 1, 1, 1, 1, 1,
-0.714687, -0.3057354, -0.06843936, 1, 1, 1, 1, 1,
-0.7140097, -1.206022, -2.074728, 1, 1, 1, 1, 1,
-0.7109578, 0.9564025, 0.1379364, 1, 1, 1, 1, 1,
-0.7029529, 0.1843159, -2.402685, 1, 1, 1, 1, 1,
-0.6977208, -0.5108553, -1.485216, 1, 1, 1, 1, 1,
-0.6970433, -1.217732, -3.039307, 1, 1, 1, 1, 1,
-0.6954544, 1.901344, -0.1077502, 1, 1, 1, 1, 1,
-0.694255, 0.5933964, -3.845648, 0, 0, 1, 1, 1,
-0.6934047, 0.4491202, -0.7669765, 1, 0, 0, 1, 1,
-0.6893876, 0.9661319, -0.7637203, 1, 0, 0, 1, 1,
-0.6892765, -0.8310935, -4.395848, 1, 0, 0, 1, 1,
-0.6882766, 0.04260226, -0.9833868, 1, 0, 0, 1, 1,
-0.6830324, -0.7037942, -2.223776, 1, 0, 0, 1, 1,
-0.6703629, -0.5420896, -2.70927, 0, 0, 0, 1, 1,
-0.6647052, 0.7310085, -0.87103, 0, 0, 0, 1, 1,
-0.6624622, -1.373419, -3.307211, 0, 0, 0, 1, 1,
-0.6604514, 0.1745314, -2.087097, 0, 0, 0, 1, 1,
-0.6530926, -2.420603, -2.331526, 0, 0, 0, 1, 1,
-0.6447204, -2.364619, -4.635204, 0, 0, 0, 1, 1,
-0.640241, -1.085821, -1.876082, 0, 0, 0, 1, 1,
-0.6378065, 0.4312126, -0.4785776, 1, 1, 1, 1, 1,
-0.6366129, 0.461969, -0.3994814, 1, 1, 1, 1, 1,
-0.6353837, 0.4602859, 0.5211068, 1, 1, 1, 1, 1,
-0.6318222, -0.3164128, -2.023612, 1, 1, 1, 1, 1,
-0.6309974, 0.6159312, -0.5084952, 1, 1, 1, 1, 1,
-0.626126, 1.665647, -0.3610619, 1, 1, 1, 1, 1,
-0.6218917, 0.5090742, 2.261538, 1, 1, 1, 1, 1,
-0.6161548, 0.1222738, -1.089257, 1, 1, 1, 1, 1,
-0.6139525, -0.5209544, -1.414897, 1, 1, 1, 1, 1,
-0.6112186, -0.8076822, -2.409993, 1, 1, 1, 1, 1,
-0.6112111, 0.04982555, -2.576893, 1, 1, 1, 1, 1,
-0.6053213, 1.151116, 0.4670366, 1, 1, 1, 1, 1,
-0.6052517, 0.009546815, -1.615672, 1, 1, 1, 1, 1,
-0.6031475, -0.3436353, -3.93752, 1, 1, 1, 1, 1,
-0.6022802, 0.9095145, -0.9958524, 1, 1, 1, 1, 1,
-0.592678, 0.8191744, 0.6229485, 0, 0, 1, 1, 1,
-0.5894794, -0.9419309, -2.08502, 1, 0, 0, 1, 1,
-0.588643, -0.6446212, -2.763112, 1, 0, 0, 1, 1,
-0.5869325, -1.10038, -3.327131, 1, 0, 0, 1, 1,
-0.5862253, -1.826188, -3.084084, 1, 0, 0, 1, 1,
-0.5848079, -0.8116814, -1.577088, 1, 0, 0, 1, 1,
-0.5798903, -0.1723794, -1.54725, 0, 0, 0, 1, 1,
-0.5776658, -0.6531842, -2.007014, 0, 0, 0, 1, 1,
-0.5757623, 1.18191, -1.123246, 0, 0, 0, 1, 1,
-0.5755698, -0.1276542, -0.7289477, 0, 0, 0, 1, 1,
-0.5745912, -0.3178682, -1.75142, 0, 0, 0, 1, 1,
-0.5745741, 1.230883, 0.5638662, 0, 0, 0, 1, 1,
-0.5725977, -0.5478274, -2.52487, 0, 0, 0, 1, 1,
-0.5692543, 0.2635911, 1.203523, 1, 1, 1, 1, 1,
-0.5647312, 0.1284743, -1.804996, 1, 1, 1, 1, 1,
-0.5619175, -0.0695164, -1.427298, 1, 1, 1, 1, 1,
-0.5614998, -1.32951, -1.206668, 1, 1, 1, 1, 1,
-0.5602894, -0.1357182, -1.121505, 1, 1, 1, 1, 1,
-0.5590905, -1.797451, -2.124866, 1, 1, 1, 1, 1,
-0.5568597, -1.484524, -3.529282, 1, 1, 1, 1, 1,
-0.5566455, 0.7404999, -1.946194, 1, 1, 1, 1, 1,
-0.5551115, 1.046803, -1.892355, 1, 1, 1, 1, 1,
-0.5550672, -0.5955932, -4.304775, 1, 1, 1, 1, 1,
-0.5550173, 0.2104107, -0.3767842, 1, 1, 1, 1, 1,
-0.5490809, 0.100684, -0.3291217, 1, 1, 1, 1, 1,
-0.5482172, -1.188944, -3.98288, 1, 1, 1, 1, 1,
-0.5453066, -1.149894, -3.400012, 1, 1, 1, 1, 1,
-0.5425057, 0.780313, -3.558815, 1, 1, 1, 1, 1,
-0.541727, -0.9991572, -0.6486092, 0, 0, 1, 1, 1,
-0.5401745, -0.3995148, -1.5735, 1, 0, 0, 1, 1,
-0.5394648, -2.285015, -3.2654, 1, 0, 0, 1, 1,
-0.5392249, 1.659437, -1.108173, 1, 0, 0, 1, 1,
-0.5382309, 1.609979, -0.6044298, 1, 0, 0, 1, 1,
-0.5303373, 0.02765609, -0.9501243, 1, 0, 0, 1, 1,
-0.5295147, 1.058716, -1.324047, 0, 0, 0, 1, 1,
-0.5269721, 0.1627899, -0.597195, 0, 0, 0, 1, 1,
-0.5242615, -0.4877326, -2.142307, 0, 0, 0, 1, 1,
-0.5219367, -0.5856198, -3.004108, 0, 0, 0, 1, 1,
-0.5188479, -1.972773, -3.20301, 0, 0, 0, 1, 1,
-0.5178465, -0.9309015, -3.172777, 0, 0, 0, 1, 1,
-0.5152637, -0.1437786, -1.897963, 0, 0, 0, 1, 1,
-0.5108854, 1.89192, -0.325024, 1, 1, 1, 1, 1,
-0.500858, -0.9326012, -2.292654, 1, 1, 1, 1, 1,
-0.4967215, 1.606952, -1.496933, 1, 1, 1, 1, 1,
-0.4925215, 0.6442235, -2.179234, 1, 1, 1, 1, 1,
-0.491818, -0.146818, -4.156047, 1, 1, 1, 1, 1,
-0.4909637, 0.09453465, -1.812715, 1, 1, 1, 1, 1,
-0.4894991, -1.553777, -2.122174, 1, 1, 1, 1, 1,
-0.4854321, 0.3398708, -1.085427, 1, 1, 1, 1, 1,
-0.4832733, 0.9595157, -0.9162064, 1, 1, 1, 1, 1,
-0.4804138, 0.6700143, -0.547651, 1, 1, 1, 1, 1,
-0.4757038, 0.8861739, -1.56286, 1, 1, 1, 1, 1,
-0.4747552, -1.348395, -2.277763, 1, 1, 1, 1, 1,
-0.4707138, 0.02906317, -0.03155683, 1, 1, 1, 1, 1,
-0.4703459, 0.2904964, -0.9250609, 1, 1, 1, 1, 1,
-0.4694621, -0.02487646, -1.697307, 1, 1, 1, 1, 1,
-0.4645277, -2.116482, -3.363008, 0, 0, 1, 1, 1,
-0.464153, -0.1263673, -1.574286, 1, 0, 0, 1, 1,
-0.4594482, -0.4129955, -2.263194, 1, 0, 0, 1, 1,
-0.4593639, -0.04506696, -1.737753, 1, 0, 0, 1, 1,
-0.4575149, 1.633942, -0.5844033, 1, 0, 0, 1, 1,
-0.4550854, 0.9692361, -0.7824724, 1, 0, 0, 1, 1,
-0.4496286, 0.2998128, 0.5446221, 0, 0, 0, 1, 1,
-0.4494204, 1.170325, 2.271663, 0, 0, 0, 1, 1,
-0.4475622, -0.1171166, -2.312823, 0, 0, 0, 1, 1,
-0.4474834, 1.136446, 0.6421394, 0, 0, 0, 1, 1,
-0.445673, 0.4948634, -1.65032, 0, 0, 0, 1, 1,
-0.4436549, -0.3319382, -3.252254, 0, 0, 0, 1, 1,
-0.4312799, -0.9090587, -1.685418, 0, 0, 0, 1, 1,
-0.4280967, 0.6270843, 0.2811305, 1, 1, 1, 1, 1,
-0.4257419, 0.7515264, -0.2091051, 1, 1, 1, 1, 1,
-0.4243907, 0.9318616, -0.4384815, 1, 1, 1, 1, 1,
-0.4238835, -0.08116682, -0.6819904, 1, 1, 1, 1, 1,
-0.4235374, -2.023989, -3.120745, 1, 1, 1, 1, 1,
-0.4213379, -0.482816, -0.8109208, 1, 1, 1, 1, 1,
-0.4206053, -2.333701, -3.072425, 1, 1, 1, 1, 1,
-0.4193923, -0.4284975, -2.668063, 1, 1, 1, 1, 1,
-0.4151653, -0.2237396, -1.444576, 1, 1, 1, 1, 1,
-0.4147899, 0.1929926, 0.1729293, 1, 1, 1, 1, 1,
-0.4133196, -0.596427, -3.215242, 1, 1, 1, 1, 1,
-0.4124244, -0.7669837, -2.877931, 1, 1, 1, 1, 1,
-0.4113404, -0.01604393, -2.785618, 1, 1, 1, 1, 1,
-0.4111608, -1.054967, -2.783358, 1, 1, 1, 1, 1,
-0.4108753, 0.5582365, -1.738077, 1, 1, 1, 1, 1,
-0.4100362, -0.3603352, -3.850968, 0, 0, 1, 1, 1,
-0.4050869, 0.6881179, -1.279372, 1, 0, 0, 1, 1,
-0.4036436, 1.054463, -0.3879595, 1, 0, 0, 1, 1,
-0.4033498, 0.1186154, -0.867875, 1, 0, 0, 1, 1,
-0.3999574, 0.4850987, 0.3594846, 1, 0, 0, 1, 1,
-0.3979641, 0.08063155, -1.891884, 1, 0, 0, 1, 1,
-0.3961795, -0.476087, -1.764125, 0, 0, 0, 1, 1,
-0.3960242, -0.6468813, -1.859771, 0, 0, 0, 1, 1,
-0.3876184, -0.3166349, -2.26497, 0, 0, 0, 1, 1,
-0.3835781, -0.9590428, -1.168167, 0, 0, 0, 1, 1,
-0.3835366, -0.2158596, -3.116662, 0, 0, 0, 1, 1,
-0.3762276, 0.6896647, -1.069506, 0, 0, 0, 1, 1,
-0.376022, -0.1734883, -0.2598235, 0, 0, 0, 1, 1,
-0.3743492, -0.3244748, -3.323704, 1, 1, 1, 1, 1,
-0.3687318, -1.977494, -4.096848, 1, 1, 1, 1, 1,
-0.3657559, 0.4909389, -1.322153, 1, 1, 1, 1, 1,
-0.3619176, -0.3546017, -1.949659, 1, 1, 1, 1, 1,
-0.361882, 0.2584041, 1.561865, 1, 1, 1, 1, 1,
-0.3613243, -0.7791462, -4.183253, 1, 1, 1, 1, 1,
-0.3535642, -0.1378345, -1.479499, 1, 1, 1, 1, 1,
-0.3515225, 0.7769631, 1.245566, 1, 1, 1, 1, 1,
-0.3500259, 1.513362, 0.9379383, 1, 1, 1, 1, 1,
-0.3498471, -0.5521509, -3.714648, 1, 1, 1, 1, 1,
-0.348264, -0.6925994, -3.134668, 1, 1, 1, 1, 1,
-0.3476814, -0.3265195, -2.096279, 1, 1, 1, 1, 1,
-0.3474259, 0.7907535, -1.17728, 1, 1, 1, 1, 1,
-0.3454932, -1.270972, -3.550578, 1, 1, 1, 1, 1,
-0.3416071, -0.6684011, -3.156999, 1, 1, 1, 1, 1,
-0.3407804, 1.416167, 1.011527, 0, 0, 1, 1, 1,
-0.340374, 0.3701295, 1.538214, 1, 0, 0, 1, 1,
-0.3374539, -0.2156099, -1.898184, 1, 0, 0, 1, 1,
-0.3330386, -0.5269186, -1.506083, 1, 0, 0, 1, 1,
-0.3311068, -1.042803, -2.080424, 1, 0, 0, 1, 1,
-0.3248506, -0.8250203, -2.782835, 1, 0, 0, 1, 1,
-0.3241606, 0.07793003, -0.9421187, 0, 0, 0, 1, 1,
-0.3215443, 1.152638, 0.9057252, 0, 0, 0, 1, 1,
-0.3111877, -0.02083072, -0.5248044, 0, 0, 0, 1, 1,
-0.3095645, 0.8822917, 0.2715892, 0, 0, 0, 1, 1,
-0.3091938, 0.5730234, 0.5671242, 0, 0, 0, 1, 1,
-0.3075153, 1.124057, -0.7406565, 0, 0, 0, 1, 1,
-0.3057278, -1.261589, -2.463941, 0, 0, 0, 1, 1,
-0.3043113, -0.8171381, -2.531582, 1, 1, 1, 1, 1,
-0.3029449, -1.098224, -0.785156, 1, 1, 1, 1, 1,
-0.3023291, 1.446295, -0.08599745, 1, 1, 1, 1, 1,
-0.3004808, 1.35829, -0.862363, 1, 1, 1, 1, 1,
-0.2971716, 0.4321266, -0.5608625, 1, 1, 1, 1, 1,
-0.2925477, 0.4681584, -1.519533, 1, 1, 1, 1, 1,
-0.2901652, -1.769024, -2.793837, 1, 1, 1, 1, 1,
-0.289105, -1.013442, -3.651584, 1, 1, 1, 1, 1,
-0.284341, 0.3120312, 0.5718634, 1, 1, 1, 1, 1,
-0.2823108, 0.2837312, 0.3676513, 1, 1, 1, 1, 1,
-0.2820154, -0.9897984, -3.397774, 1, 1, 1, 1, 1,
-0.2728756, -0.7514498, -2.510836, 1, 1, 1, 1, 1,
-0.2725587, -0.7505133, -2.216688, 1, 1, 1, 1, 1,
-0.2673417, -0.4109861, -2.117452, 1, 1, 1, 1, 1,
-0.2665389, -1.206253, -2.701132, 1, 1, 1, 1, 1,
-0.2647789, 1.225523, -1.958359, 0, 0, 1, 1, 1,
-0.2620454, 0.7050711, 0.6054649, 1, 0, 0, 1, 1,
-0.2585688, -0.5248094, -3.67905, 1, 0, 0, 1, 1,
-0.2581579, 0.6441084, 0.1029449, 1, 0, 0, 1, 1,
-0.2546001, -0.01240976, -1.405449, 1, 0, 0, 1, 1,
-0.2518843, 0.4756413, -0.8105578, 1, 0, 0, 1, 1,
-0.250132, -0.6332037, -3.828299, 0, 0, 0, 1, 1,
-0.2462915, -0.6341578, -3.58809, 0, 0, 0, 1, 1,
-0.2462842, 0.457706, -0.7400464, 0, 0, 0, 1, 1,
-0.2442969, 0.9953753, 0.9586051, 0, 0, 0, 1, 1,
-0.2429744, 1.084628, 1.108582, 0, 0, 0, 1, 1,
-0.2428471, 0.7092979, -0.558681, 0, 0, 0, 1, 1,
-0.2428374, 1.415964, 0.1564471, 0, 0, 0, 1, 1,
-0.2426865, 1.550054, -0.6506177, 1, 1, 1, 1, 1,
-0.2411869, -0.6944561, -1.92531, 1, 1, 1, 1, 1,
-0.2366676, 0.8504601, -0.379244, 1, 1, 1, 1, 1,
-0.2362573, -0.7304985, -4.187455, 1, 1, 1, 1, 1,
-0.2346426, -0.418419, -4.131576, 1, 1, 1, 1, 1,
-0.2319095, -1.223228, -2.278237, 1, 1, 1, 1, 1,
-0.2284264, -1.052382, -1.280249, 1, 1, 1, 1, 1,
-0.2269048, 0.6089175, 0.688574, 1, 1, 1, 1, 1,
-0.2224267, -0.6819698, -2.960129, 1, 1, 1, 1, 1,
-0.2194519, -0.3517127, -3.041409, 1, 1, 1, 1, 1,
-0.2146177, 0.8884338, 0.0892368, 1, 1, 1, 1, 1,
-0.2127146, -0.2444988, -1.064366, 1, 1, 1, 1, 1,
-0.211368, -1.126443, -4.18174, 1, 1, 1, 1, 1,
-0.2108358, 0.4211044, -3.088281, 1, 1, 1, 1, 1,
-0.2095041, 1.416087, -0.04810396, 1, 1, 1, 1, 1,
-0.2064722, 0.8460969, -0.932999, 0, 0, 1, 1, 1,
-0.205623, -0.1483952, -3.157186, 1, 0, 0, 1, 1,
-0.2046784, -0.2806333, -0.4552667, 1, 0, 0, 1, 1,
-0.2030528, 0.5364305, -1.429689, 1, 0, 0, 1, 1,
-0.1993393, -0.5658452, -1.286831, 1, 0, 0, 1, 1,
-0.1991331, -0.08484451, -1.754427, 1, 0, 0, 1, 1,
-0.1969239, 0.0900582, -0.5173732, 0, 0, 0, 1, 1,
-0.1861311, 0.9814531, 0.4062692, 0, 0, 0, 1, 1,
-0.1832553, 1.205152, 0.4964402, 0, 0, 0, 1, 1,
-0.1811554, 0.4004243, 1.25534, 0, 0, 0, 1, 1,
-0.1792876, -0.09390479, -2.231515, 0, 0, 0, 1, 1,
-0.1792071, 0.02160027, -0.3057171, 0, 0, 0, 1, 1,
-0.170678, 0.8632631, -1.475846, 0, 0, 0, 1, 1,
-0.170119, -1.436841, -5.244964, 1, 1, 1, 1, 1,
-0.1693122, 0.6142439, -0.7392291, 1, 1, 1, 1, 1,
-0.1688648, 0.2256411, 0.2278572, 1, 1, 1, 1, 1,
-0.165829, 0.2754886, -0.5135603, 1, 1, 1, 1, 1,
-0.1622266, -0.9917264, -3.160009, 1, 1, 1, 1, 1,
-0.1606564, 1.659606, 1.253606, 1, 1, 1, 1, 1,
-0.1605508, 0.8275557, 0.4806529, 1, 1, 1, 1, 1,
-0.1566949, -0.534094, -3.003013, 1, 1, 1, 1, 1,
-0.1511816, 1.242543, -1.983825, 1, 1, 1, 1, 1,
-0.1504457, 1.980857, 0.8403388, 1, 1, 1, 1, 1,
-0.1464197, -0.1375385, -0.4019012, 1, 1, 1, 1, 1,
-0.145102, 0.9865361, -1.881375, 1, 1, 1, 1, 1,
-0.1445288, -0.3600841, -1.929495, 1, 1, 1, 1, 1,
-0.1424515, 1.282892, 1.513656, 1, 1, 1, 1, 1,
-0.1396352, -0.8467614, -1.735203, 1, 1, 1, 1, 1,
-0.1376568, -0.9635503, -3.776265, 0, 0, 1, 1, 1,
-0.1359858, -0.3397763, -2.261884, 1, 0, 0, 1, 1,
-0.1346814, -0.7713786, -2.758372, 1, 0, 0, 1, 1,
-0.1269514, -1.804355, -2.44379, 1, 0, 0, 1, 1,
-0.12494, 0.561612, -1.135938, 1, 0, 0, 1, 1,
-0.1246374, 0.5362042, 1.028898, 1, 0, 0, 1, 1,
-0.1232126, 1.741191, -0.04493052, 0, 0, 0, 1, 1,
-0.1213521, -1.184165, -4.228667, 0, 0, 0, 1, 1,
-0.1173619, -0.4720576, -4.295723, 0, 0, 0, 1, 1,
-0.1126948, 1.749538, 0.002379255, 0, 0, 0, 1, 1,
-0.1034981, 0.4316428, -0.2077812, 0, 0, 0, 1, 1,
-0.1012782, 1.016649, -0.850115, 0, 0, 0, 1, 1,
-0.09532284, 0.05427089, -1.101772, 0, 0, 0, 1, 1,
-0.0935368, 2.194559, 0.2776293, 1, 1, 1, 1, 1,
-0.09100661, -0.8776621, -3.059376, 1, 1, 1, 1, 1,
-0.09089829, 0.5049015, -0.3761451, 1, 1, 1, 1, 1,
-0.08504727, 0.1454879, 0.9217816, 1, 1, 1, 1, 1,
-0.08473095, -0.3754187, -4.299506, 1, 1, 1, 1, 1,
-0.07898824, -0.1233262, -2.452169, 1, 1, 1, 1, 1,
-0.07427249, 0.7831411, -1.745897, 1, 1, 1, 1, 1,
-0.06296389, -1.27907, -2.164297, 1, 1, 1, 1, 1,
-0.06170052, 0.09488412, 0.1022699, 1, 1, 1, 1, 1,
-0.06124802, 1.419799, 0.497665, 1, 1, 1, 1, 1,
-0.06086161, -0.6473567, -1.955772, 1, 1, 1, 1, 1,
-0.05069662, 0.2146854, 0.920522, 1, 1, 1, 1, 1,
-0.05037469, -0.2852079, -2.491515, 1, 1, 1, 1, 1,
-0.04895845, -1.561156, -2.712045, 1, 1, 1, 1, 1,
-0.04837653, 1.945332, 0.4526499, 1, 1, 1, 1, 1,
-0.04628061, -0.1307784, -2.798576, 0, 0, 1, 1, 1,
-0.04426728, 1.251777, 2.397835, 1, 0, 0, 1, 1,
-0.03899792, 1.401043, 0.5159682, 1, 0, 0, 1, 1,
-0.03793087, 0.4840987, 0.87181, 1, 0, 0, 1, 1,
-0.02947362, -0.3672088, -2.404096, 1, 0, 0, 1, 1,
-0.02928928, -0.2845966, -2.940774, 1, 0, 0, 1, 1,
-0.02850099, -0.07620759, -3.113419, 0, 0, 0, 1, 1,
-0.02798739, 1.754255, 0.8931711, 0, 0, 0, 1, 1,
-0.02717524, -1.277263, -4.650561, 0, 0, 0, 1, 1,
-0.02351018, 0.599129, -1.82161, 0, 0, 0, 1, 1,
-0.02304949, -2.752877, -3.659105, 0, 0, 0, 1, 1,
-0.02155882, -0.09583367, -2.508243, 0, 0, 0, 1, 1,
-0.02096116, 0.5191296, 1.68766, 0, 0, 0, 1, 1,
-0.01684563, -1.123262, -4.257687, 1, 1, 1, 1, 1,
-0.01468876, 0.61636, -0.2989657, 1, 1, 1, 1, 1,
-0.01416769, 1.749329, 1.287355, 1, 1, 1, 1, 1,
-0.01174943, -1.496671, -2.684783, 1, 1, 1, 1, 1,
-0.01107695, -1.162491, -3.352927, 1, 1, 1, 1, 1,
-0.01084485, -0.9799458, -4.860372, 1, 1, 1, 1, 1,
-0.008375857, 1.079476, -0.01508717, 1, 1, 1, 1, 1,
-0.006574644, 2.076247, 1.931401, 1, 1, 1, 1, 1,
0.0006539011, -0.2865937, 3.276556, 1, 1, 1, 1, 1,
0.003511548, 0.7143945, -0.5071611, 1, 1, 1, 1, 1,
0.006457102, -0.3817686, 1.695502, 1, 1, 1, 1, 1,
0.007106989, 0.922857, -2.204026, 1, 1, 1, 1, 1,
0.01411123, -0.178284, 2.113199, 1, 1, 1, 1, 1,
0.01560192, -1.635805, 1.372954, 1, 1, 1, 1, 1,
0.02334733, 0.3306962, 0.9720311, 1, 1, 1, 1, 1,
0.03567291, 1.082184, 0.1247589, 0, 0, 1, 1, 1,
0.03683138, 0.4341967, -0.05610036, 1, 0, 0, 1, 1,
0.03788611, 0.7304288, 0.4040301, 1, 0, 0, 1, 1,
0.03819607, 1.3135, -1.336995, 1, 0, 0, 1, 1,
0.03959487, -1.76998, 3.224047, 1, 0, 0, 1, 1,
0.04591935, 0.2062371, -0.8715709, 1, 0, 0, 1, 1,
0.0462754, 0.5088919, -1.11098, 0, 0, 0, 1, 1,
0.04775624, -0.6598873, 2.335647, 0, 0, 0, 1, 1,
0.04841536, -0.4299622, 2.666632, 0, 0, 0, 1, 1,
0.04879756, -1.997488, 2.726466, 0, 0, 0, 1, 1,
0.05146842, -1.096263, 4.055492, 0, 0, 0, 1, 1,
0.05351089, -1.13716, 3.767623, 0, 0, 0, 1, 1,
0.05639467, -0.2550468, 3.511349, 0, 0, 0, 1, 1,
0.0570695, 1.579328, -1.155501, 1, 1, 1, 1, 1,
0.0642798, 0.9821281, 0.2392896, 1, 1, 1, 1, 1,
0.06637131, 0.2506682, 1.192606, 1, 1, 1, 1, 1,
0.06942051, 0.1827053, -0.4275083, 1, 1, 1, 1, 1,
0.07174733, -1.807316, 2.242563, 1, 1, 1, 1, 1,
0.07285083, -0.673179, 0.7745684, 1, 1, 1, 1, 1,
0.07963091, -0.3800012, 4.229676, 1, 1, 1, 1, 1,
0.08183284, -1.335822, 4.271485, 1, 1, 1, 1, 1,
0.08384412, 1.324856, 0.8700306, 1, 1, 1, 1, 1,
0.08477001, -1.217146, 2.241592, 1, 1, 1, 1, 1,
0.08610178, 1.0442, -0.197363, 1, 1, 1, 1, 1,
0.08683565, -0.007475925, 1.600441, 1, 1, 1, 1, 1,
0.08703462, -3.119756, 2.403733, 1, 1, 1, 1, 1,
0.08890309, 0.4520882, -0.4672371, 1, 1, 1, 1, 1,
0.09112149, 0.6783999, 2.10321, 1, 1, 1, 1, 1,
0.09646111, -0.6378596, 1.545597, 0, 0, 1, 1, 1,
0.09779275, 0.8049728, 0.1810425, 1, 0, 0, 1, 1,
0.09817757, 0.5978867, -0.4538163, 1, 0, 0, 1, 1,
0.1002053, 0.8432064, 1.113467, 1, 0, 0, 1, 1,
0.1005833, 0.3852475, 1.850338, 1, 0, 0, 1, 1,
0.1054055, -0.4647788, 3.727054, 1, 0, 0, 1, 1,
0.1274618, -1.661918, 4.438905, 0, 0, 0, 1, 1,
0.1321204, 0.8644076, -0.9571624, 0, 0, 0, 1, 1,
0.1333564, -0.4067868, 4.982039, 0, 0, 0, 1, 1,
0.1427455, 0.3817315, -1.224698, 0, 0, 0, 1, 1,
0.1476652, 1.01046, -0.5395487, 0, 0, 0, 1, 1,
0.1490248, 0.002365941, 2.98839, 0, 0, 0, 1, 1,
0.1496988, -0.2289332, 3.912918, 0, 0, 0, 1, 1,
0.1519231, -0.4539981, 1.343232, 1, 1, 1, 1, 1,
0.1535463, 0.3927523, 0.3186842, 1, 1, 1, 1, 1,
0.1559869, 1.002154, -0.05683346, 1, 1, 1, 1, 1,
0.158249, -1.456982, 3.030602, 1, 1, 1, 1, 1,
0.1599439, 0.6059985, -0.4036722, 1, 1, 1, 1, 1,
0.1614511, -0.3400278, 2.341947, 1, 1, 1, 1, 1,
0.1649524, -0.8111221, 2.14951, 1, 1, 1, 1, 1,
0.1673203, 0.2943897, -0.6612381, 1, 1, 1, 1, 1,
0.1705424, 0.4025295, 1.58787, 1, 1, 1, 1, 1,
0.1729346, -0.07258635, 2.294673, 1, 1, 1, 1, 1,
0.1777288, 0.2681631, 1.470138, 1, 1, 1, 1, 1,
0.1782073, 0.1799829, 0.4765783, 1, 1, 1, 1, 1,
0.1786849, -2.08259, 2.293257, 1, 1, 1, 1, 1,
0.1786872, 0.4503585, -0.05499056, 1, 1, 1, 1, 1,
0.1813424, -0.4243128, 1.9157, 1, 1, 1, 1, 1,
0.1813526, -0.5242922, 2.87175, 0, 0, 1, 1, 1,
0.1828814, -0.3367179, 3.206879, 1, 0, 0, 1, 1,
0.1859173, -0.5831772, 2.140136, 1, 0, 0, 1, 1,
0.1860353, -1.626934, 2.849903, 1, 0, 0, 1, 1,
0.1887609, 0.3961701, -0.4178999, 1, 0, 0, 1, 1,
0.1896073, 1.137141, -0.7019772, 1, 0, 0, 1, 1,
0.200005, 0.7331523, 1.770265, 0, 0, 0, 1, 1,
0.2043923, 0.9551474, -0.5100571, 0, 0, 0, 1, 1,
0.2059653, 0.9703699, 0.839179, 0, 0, 0, 1, 1,
0.2077929, -0.9638768, 3.674559, 0, 0, 0, 1, 1,
0.209605, -0.2649666, 2.103257, 0, 0, 0, 1, 1,
0.2100301, 1.677048, -0.1644279, 0, 0, 0, 1, 1,
0.2105906, 0.3624131, 0.5574921, 0, 0, 0, 1, 1,
0.2130886, -0.4502319, 2.559931, 1, 1, 1, 1, 1,
0.2139099, -1.311036, 2.499938, 1, 1, 1, 1, 1,
0.2162753, 0.5659876, 1.014786, 1, 1, 1, 1, 1,
0.2176596, 0.5032631, 0.6646423, 1, 1, 1, 1, 1,
0.2203284, -0.9407166, 0.8793043, 1, 1, 1, 1, 1,
0.2214387, -1.173249, 3.583602, 1, 1, 1, 1, 1,
0.2244451, 0.8078162, -1.311178, 1, 1, 1, 1, 1,
0.2280934, -0.9126582, 3.491304, 1, 1, 1, 1, 1,
0.2318922, -0.06713329, 2.46855, 1, 1, 1, 1, 1,
0.2329157, -0.6659217, 2.5195, 1, 1, 1, 1, 1,
0.2348707, 0.3836023, 1.825971, 1, 1, 1, 1, 1,
0.2387937, -0.592136, 2.288273, 1, 1, 1, 1, 1,
0.2412183, 0.5721751, 1.60731, 1, 1, 1, 1, 1,
0.2444619, -0.8622763, 1.79665, 1, 1, 1, 1, 1,
0.2453349, 0.2610086, 0.463108, 1, 1, 1, 1, 1,
0.2453844, 0.6998031, -0.9257023, 0, 0, 1, 1, 1,
0.2456004, -0.7935678, 1.1702, 1, 0, 0, 1, 1,
0.2510721, 0.5059408, 0.3599024, 1, 0, 0, 1, 1,
0.2539226, 0.003377341, 0.1498415, 1, 0, 0, 1, 1,
0.2593814, -0.8978716, 3.119939, 1, 0, 0, 1, 1,
0.2603247, 1.396837, -0.08660687, 1, 0, 0, 1, 1,
0.2657402, 0.8459897, 0.8624579, 0, 0, 0, 1, 1,
0.2660694, 0.4071495, 1.221907, 0, 0, 0, 1, 1,
0.2705022, 0.4172717, 2.170166, 0, 0, 0, 1, 1,
0.2716494, -1.456956, 4.537888, 0, 0, 0, 1, 1,
0.2728269, -0.4263466, 2.432059, 0, 0, 0, 1, 1,
0.2738709, 0.4858784, -1.476436, 0, 0, 0, 1, 1,
0.2796431, 0.1686269, 2.039953, 0, 0, 0, 1, 1,
0.2816335, -0.9848743, 1.151468, 1, 1, 1, 1, 1,
0.2872153, 1.393132, -1.131833, 1, 1, 1, 1, 1,
0.2920595, 0.992711, 0.4290518, 1, 1, 1, 1, 1,
0.2924328, 0.4181054, -0.2608316, 1, 1, 1, 1, 1,
0.2924479, -2.238605, 1.569046, 1, 1, 1, 1, 1,
0.2926573, 0.2235725, 1.090559, 1, 1, 1, 1, 1,
0.2968439, -2.858134, 4.414697, 1, 1, 1, 1, 1,
0.2990733, -0.4896115, 1.08214, 1, 1, 1, 1, 1,
0.2998129, -0.1952573, 1.279646, 1, 1, 1, 1, 1,
0.3009758, -0.6700053, 2.966532, 1, 1, 1, 1, 1,
0.3074386, -0.3413722, 2.451612, 1, 1, 1, 1, 1,
0.3097599, -1.449998, 3.337562, 1, 1, 1, 1, 1,
0.311381, 0.326904, 0.5266401, 1, 1, 1, 1, 1,
0.3144097, 1.107517, 2.911896, 1, 1, 1, 1, 1,
0.3189903, 0.9919844, 0.9558542, 1, 1, 1, 1, 1,
0.3312253, 1.566771, 0.9249157, 0, 0, 1, 1, 1,
0.3316189, 0.547442, -0.3335847, 1, 0, 0, 1, 1,
0.3405536, -0.5821658, 3.306769, 1, 0, 0, 1, 1,
0.3406312, -0.8643247, 2.488385, 1, 0, 0, 1, 1,
0.340894, -1.030863, 3.167171, 1, 0, 0, 1, 1,
0.3412431, -0.432579, 3.670263, 1, 0, 0, 1, 1,
0.3441324, 0.2949552, 1.110145, 0, 0, 0, 1, 1,
0.3462132, -0.2041603, 1.094864, 0, 0, 0, 1, 1,
0.350459, -0.01827038, 2.041498, 0, 0, 0, 1, 1,
0.3522013, -0.9003943, 3.110388, 0, 0, 0, 1, 1,
0.3562181, -0.4001738, 2.375524, 0, 0, 0, 1, 1,
0.3586764, -1.09056, 4.105247, 0, 0, 0, 1, 1,
0.3627896, -1.89978, 2.133515, 0, 0, 0, 1, 1,
0.3641946, 0.4801211, 0.03261574, 1, 1, 1, 1, 1,
0.3687893, 0.4932611, 0.3779787, 1, 1, 1, 1, 1,
0.3721559, 2.414474, 0.2444375, 1, 1, 1, 1, 1,
0.3742808, 0.5158734, 2.466075, 1, 1, 1, 1, 1,
0.3789697, -0.2650193, 2.973458, 1, 1, 1, 1, 1,
0.3873022, 0.08950655, 0.923435, 1, 1, 1, 1, 1,
0.3897729, 0.5458547, 1.409972, 1, 1, 1, 1, 1,
0.3962494, 0.5951154, 1.518106, 1, 1, 1, 1, 1,
0.4078869, 0.1244968, 2.10139, 1, 1, 1, 1, 1,
0.4114868, -0.2811047, 1.630929, 1, 1, 1, 1, 1,
0.4128095, 1.062719, -0.1807664, 1, 1, 1, 1, 1,
0.4157737, -0.2098444, 2.116412, 1, 1, 1, 1, 1,
0.4188185, -0.3279312, 2.919483, 1, 1, 1, 1, 1,
0.419013, 0.6780557, 1.268088, 1, 1, 1, 1, 1,
0.420503, -0.7576017, 3.351494, 1, 1, 1, 1, 1,
0.4261092, 0.7546782, -0.1688221, 0, 0, 1, 1, 1,
0.4320019, 0.6691422, 1.864594, 1, 0, 0, 1, 1,
0.4357619, -1.26739, 3.929891, 1, 0, 0, 1, 1,
0.4382896, 1.628348, -2.529822, 1, 0, 0, 1, 1,
0.4416173, -0.566025, 4.717451, 1, 0, 0, 1, 1,
0.4461398, -0.009352734, 1.063926, 1, 0, 0, 1, 1,
0.4474889, -0.5696214, 1.934955, 0, 0, 0, 1, 1,
0.4532056, -1.223426, 4.256565, 0, 0, 0, 1, 1,
0.4579949, 1.4728, 0.09868658, 0, 0, 0, 1, 1,
0.4597088, -0.08362795, 1.239263, 0, 0, 0, 1, 1,
0.4620365, 0.9661166, 1.742689, 0, 0, 0, 1, 1,
0.4638806, 0.4543557, 0.1558494, 0, 0, 0, 1, 1,
0.4649684, 0.5944145, 1.613893, 0, 0, 0, 1, 1,
0.4650007, -0.6717582, 2.159152, 1, 1, 1, 1, 1,
0.4671138, 0.3587334, 1.363356, 1, 1, 1, 1, 1,
0.4684861, 0.5587184, -0.1666106, 1, 1, 1, 1, 1,
0.4724253, -0.5755491, 2.308875, 1, 1, 1, 1, 1,
0.4749098, 0.528268, 2.209951, 1, 1, 1, 1, 1,
0.4750051, -0.1350269, 2.091548, 1, 1, 1, 1, 1,
0.4767951, -0.9095951, 1.767747, 1, 1, 1, 1, 1,
0.4789697, 0.4717778, -0.9106722, 1, 1, 1, 1, 1,
0.4797072, 1.323027, 0.2937452, 1, 1, 1, 1, 1,
0.4847672, 1.651516, 0.565012, 1, 1, 1, 1, 1,
0.4870031, -0.3385277, 2.332431, 1, 1, 1, 1, 1,
0.4894168, -1.595411, 2.706978, 1, 1, 1, 1, 1,
0.4909655, -0.1095287, 1.729831, 1, 1, 1, 1, 1,
0.496032, -0.5078035, 1.394167, 1, 1, 1, 1, 1,
0.4973813, 0.2039644, 1.599567, 1, 1, 1, 1, 1,
0.5006542, -0.7211049, 1.158019, 0, 0, 1, 1, 1,
0.5047383, -1.812216, 3.75837, 1, 0, 0, 1, 1,
0.5049263, -0.1817752, 1.760546, 1, 0, 0, 1, 1,
0.5069078, -0.8059971, 1.840976, 1, 0, 0, 1, 1,
0.5098163, -0.5312723, 3.119791, 1, 0, 0, 1, 1,
0.5099236, 0.2802447, 0.7858251, 1, 0, 0, 1, 1,
0.5134477, -0.2576748, 2.044884, 0, 0, 0, 1, 1,
0.5135555, 2.806179, 0.4575251, 0, 0, 0, 1, 1,
0.5148979, 1.438624, -0.225409, 0, 0, 0, 1, 1,
0.5160341, 1.297552, -0.2606806, 0, 0, 0, 1, 1,
0.5176192, 0.6751622, 2.259801, 0, 0, 0, 1, 1,
0.5180196, 0.3144601, 2.010621, 0, 0, 0, 1, 1,
0.5254158, -0.1138781, 0.9884728, 0, 0, 0, 1, 1,
0.5264508, -1.830173, 3.698123, 1, 1, 1, 1, 1,
0.5277393, -0.6925579, 2.524926, 1, 1, 1, 1, 1,
0.5285168, 0.4898799, -0.4253017, 1, 1, 1, 1, 1,
0.5288912, -0.7201329, 1.819051, 1, 1, 1, 1, 1,
0.5374213, 0.1988869, -0.4984457, 1, 1, 1, 1, 1,
0.5432853, -0.1865457, 3.328035, 1, 1, 1, 1, 1,
0.5474724, 0.5138214, 1.923283, 1, 1, 1, 1, 1,
0.5495702, -0.8216951, 3.259049, 1, 1, 1, 1, 1,
0.5522915, -1.881596, 3.990048, 1, 1, 1, 1, 1,
0.5542865, 0.3942717, 0.2983736, 1, 1, 1, 1, 1,
0.5608128, -0.380909, 1.335938, 1, 1, 1, 1, 1,
0.5633968, -1.730042, 1.469569, 1, 1, 1, 1, 1,
0.5673818, -0.2077021, 1.701014, 1, 1, 1, 1, 1,
0.5676193, 0.5840638, 1.580518, 1, 1, 1, 1, 1,
0.569353, -1.10419, 3.193253, 1, 1, 1, 1, 1,
0.5707292, -1.354723, 2.694492, 0, 0, 1, 1, 1,
0.5708696, -0.5895774, 2.425835, 1, 0, 0, 1, 1,
0.5712595, 0.7927634, -0.6592748, 1, 0, 0, 1, 1,
0.5734719, -1.489319, 4.359198, 1, 0, 0, 1, 1,
0.5748752, -0.345188, 1.928575, 1, 0, 0, 1, 1,
0.5792192, 0.1729565, 1.613973, 1, 0, 0, 1, 1,
0.579929, 1.278273, 1.646766, 0, 0, 0, 1, 1,
0.585837, 0.3384474, -0.2989747, 0, 0, 0, 1, 1,
0.5884315, -0.1077926, 3.63273, 0, 0, 0, 1, 1,
0.5910312, 0.4537724, -0.2995855, 0, 0, 0, 1, 1,
0.5918711, -2.062375, 3.754979, 0, 0, 0, 1, 1,
0.5975903, 0.5589986, 1.095344, 0, 0, 0, 1, 1,
0.5999405, -0.8975531, 5.133336, 0, 0, 0, 1, 1,
0.601091, 0.1691366, 0.7878032, 1, 1, 1, 1, 1,
0.6066018, -0.459505, 1.975334, 1, 1, 1, 1, 1,
0.6090619, -0.682715, 2.577138, 1, 1, 1, 1, 1,
0.6110345, 0.7820473, -1.256774, 1, 1, 1, 1, 1,
0.6239053, 1.614192, -1.191748, 1, 1, 1, 1, 1,
0.6273643, -0.6180758, 2.90038, 1, 1, 1, 1, 1,
0.6283077, -0.9912075, 2.501675, 1, 1, 1, 1, 1,
0.6308982, -0.1895285, 1.2701, 1, 1, 1, 1, 1,
0.632705, -0.7384917, 3.356053, 1, 1, 1, 1, 1,
0.6362947, 0.255944, 2.196446, 1, 1, 1, 1, 1,
0.6410906, 1.601973, -0.8435465, 1, 1, 1, 1, 1,
0.6505686, 0.4283407, 2.000731, 1, 1, 1, 1, 1,
0.6522992, -0.7466137, 2.674933, 1, 1, 1, 1, 1,
0.6621022, 1.662488, 0.5857213, 1, 1, 1, 1, 1,
0.6683802, 0.278425, 1.488739, 1, 1, 1, 1, 1,
0.676537, -0.6801867, 2.345732, 0, 0, 1, 1, 1,
0.6787362, 0.515269, 1.621139, 1, 0, 0, 1, 1,
0.6787865, -1.567253, 4.266811, 1, 0, 0, 1, 1,
0.6819203, -0.4958256, 3.538819, 1, 0, 0, 1, 1,
0.6835296, -0.4812434, 2.300189, 1, 0, 0, 1, 1,
0.6837206, -0.2316854, 1.924903, 1, 0, 0, 1, 1,
0.6839496, -0.3866453, 3.21893, 0, 0, 0, 1, 1,
0.687445, -0.01315359, 1.122499, 0, 0, 0, 1, 1,
0.6903498, 0.7342919, 1.319468, 0, 0, 0, 1, 1,
0.6919611, 0.9986072, 0.8032736, 0, 0, 0, 1, 1,
0.6976701, 0.05396983, 1.430642, 0, 0, 0, 1, 1,
0.7046303, -0.2542138, 0.4249409, 0, 0, 0, 1, 1,
0.7188494, -0.6845469, 2.983516, 0, 0, 0, 1, 1,
0.7218822, -0.5981057, 3.421224, 1, 1, 1, 1, 1,
0.722676, 0.5876991, -0.3500271, 1, 1, 1, 1, 1,
0.7248622, 0.7107729, 0.9804846, 1, 1, 1, 1, 1,
0.7290996, -0.1231965, 0.1779274, 1, 1, 1, 1, 1,
0.7314302, 0.03110344, 0.4595898, 1, 1, 1, 1, 1,
0.7319238, -0.6750559, 2.339938, 1, 1, 1, 1, 1,
0.7408671, -0.461987, 2.522324, 1, 1, 1, 1, 1,
0.7439933, -0.614104, 1.694197, 1, 1, 1, 1, 1,
0.745097, -0.9974172, 4.063015, 1, 1, 1, 1, 1,
0.7488101, 0.731461, -1.995231, 1, 1, 1, 1, 1,
0.7492709, -0.8626885, 3.674772, 1, 1, 1, 1, 1,
0.752184, 1.049969, 0.9171817, 1, 1, 1, 1, 1,
0.755936, 0.2861058, 0.3366315, 1, 1, 1, 1, 1,
0.7578913, 1.788547, 0.536715, 1, 1, 1, 1, 1,
0.7592455, -0.3515789, 1.495627, 1, 1, 1, 1, 1,
0.7673702, 1.145692, 0.40825, 0, 0, 1, 1, 1,
0.7790047, 0.385156, 1.914178, 1, 0, 0, 1, 1,
0.783434, 0.2243068, 3.282905, 1, 0, 0, 1, 1,
0.7856521, 1.243672, 1.883757, 1, 0, 0, 1, 1,
0.7924907, 1.121854, 1.025347, 1, 0, 0, 1, 1,
0.7934206, -0.6992279, 2.518289, 1, 0, 0, 1, 1,
0.7964271, 0.1465044, 0.8534009, 0, 0, 0, 1, 1,
0.7970803, -0.1553962, 2.216596, 0, 0, 0, 1, 1,
0.81444, 0.09137795, 0.3465346, 0, 0, 0, 1, 1,
0.8307886, -0.9138136, 1.192297, 0, 0, 0, 1, 1,
0.8320549, -0.1938262, 1.187969, 0, 0, 0, 1, 1,
0.836842, 0.357956, 0.5931836, 0, 0, 0, 1, 1,
0.8380578, -1.806237, 3.146048, 0, 0, 0, 1, 1,
0.8486486, -0.8455054, 2.922812, 1, 1, 1, 1, 1,
0.8496737, 0.3557873, 1.341294, 1, 1, 1, 1, 1,
0.8505855, 0.330746, -0.6048938, 1, 1, 1, 1, 1,
0.8518113, 1.579287, 0.9196422, 1, 1, 1, 1, 1,
0.8541223, 1.122713, 1.710202, 1, 1, 1, 1, 1,
0.8546801, -0.1766859, -0.6445527, 1, 1, 1, 1, 1,
0.8567364, 1.287996, 0.6268606, 1, 1, 1, 1, 1,
0.8578941, 0.7054176, 1.480115, 1, 1, 1, 1, 1,
0.8714945, 0.02872105, 1.410648, 1, 1, 1, 1, 1,
0.8759364, 2.041701, 0.3454036, 1, 1, 1, 1, 1,
0.8814785, 0.5273811, 2.937593, 1, 1, 1, 1, 1,
0.8820373, -0.3153038, 1.042975, 1, 1, 1, 1, 1,
0.8836839, 0.07296049, 0.3479398, 1, 1, 1, 1, 1,
0.8902506, 0.5996863, 1.774993, 1, 1, 1, 1, 1,
0.8912677, -0.9255539, 4.597232, 1, 1, 1, 1, 1,
0.8952521, -0.424968, 0.7559955, 0, 0, 1, 1, 1,
0.8973682, 0.3513472, 1.09933, 1, 0, 0, 1, 1,
0.8983178, 1.336364, 0.3161843, 1, 0, 0, 1, 1,
0.904896, 0.2644957, 1.19776, 1, 0, 0, 1, 1,
0.9058335, 0.6124864, 0.6954489, 1, 0, 0, 1, 1,
0.9096609, -1.282053, 2.432422, 1, 0, 0, 1, 1,
0.9114746, 0.6414647, -0.5257083, 0, 0, 0, 1, 1,
0.9123181, -0.9423687, 2.125644, 0, 0, 0, 1, 1,
0.9153621, 1.813375, -1.083858, 0, 0, 0, 1, 1,
0.9172998, -1.703705, 2.561996, 0, 0, 0, 1, 1,
0.9255476, 1.395372, -0.1798731, 0, 0, 0, 1, 1,
0.9294941, 1.260621, 0.089261, 0, 0, 0, 1, 1,
0.9354135, -0.9119141, 4.09784, 0, 0, 0, 1, 1,
0.9360223, 1.119059, 0.1951347, 1, 1, 1, 1, 1,
0.941008, 0.6914519, 1.822205, 1, 1, 1, 1, 1,
0.941492, 0.7681732, -0.2224647, 1, 1, 1, 1, 1,
0.9571412, 1.50199, 2.426607, 1, 1, 1, 1, 1,
0.9622944, 0.5583002, 1.49366, 1, 1, 1, 1, 1,
0.9661413, -0.4436276, 3.377621, 1, 1, 1, 1, 1,
0.9675886, -0.9391028, 1.938052, 1, 1, 1, 1, 1,
0.9734589, 0.7815889, -0.5210602, 1, 1, 1, 1, 1,
0.9755412, 1.728513, 2.776271, 1, 1, 1, 1, 1,
0.9837323, -0.7272464, 1.523914, 1, 1, 1, 1, 1,
0.9894489, -0.2285331, 1.157564, 1, 1, 1, 1, 1,
1.007598, -1.7407, 2.170866, 1, 1, 1, 1, 1,
1.011578, 0.343403, -0.02796021, 1, 1, 1, 1, 1,
1.012143, -1.127143, 1.782782, 1, 1, 1, 1, 1,
1.019066, -0.6788577, 0.970964, 1, 1, 1, 1, 1,
1.02005, -1.508482, 1.068656, 0, 0, 1, 1, 1,
1.027014, -0.4485705, 3.467382, 1, 0, 0, 1, 1,
1.030676, -0.6080834, 2.089908, 1, 0, 0, 1, 1,
1.033594, 0.2667118, 1.602484, 1, 0, 0, 1, 1,
1.055386, -0.3479277, 3.299648, 1, 0, 0, 1, 1,
1.058726, 0.3550144, 1.301757, 1, 0, 0, 1, 1,
1.05963, 1.008416, -0.2750686, 0, 0, 0, 1, 1,
1.067197, -1.364975, 1.078722, 0, 0, 0, 1, 1,
1.067928, -1.532501, 2.227911, 0, 0, 0, 1, 1,
1.072749, -0.05163985, 1.840854, 0, 0, 0, 1, 1,
1.082437, -0.5696378, 2.518646, 0, 0, 0, 1, 1,
1.086186, 0.4447908, 0.8891016, 0, 0, 0, 1, 1,
1.088177, -0.04196364, 1.762849, 0, 0, 0, 1, 1,
1.097083, -0.555185, 2.155821, 1, 1, 1, 1, 1,
1.106494, 0.0257, 1.621478, 1, 1, 1, 1, 1,
1.113065, -0.09997164, 0.1553846, 1, 1, 1, 1, 1,
1.114419, 0.3641422, 1.576208, 1, 1, 1, 1, 1,
1.121181, -0.09289972, 0.8686646, 1, 1, 1, 1, 1,
1.122912, 0.4091348, 0.2728013, 1, 1, 1, 1, 1,
1.130159, 2.0635, -1.150545, 1, 1, 1, 1, 1,
1.132705, 1.055474, -0.9873019, 1, 1, 1, 1, 1,
1.144398, 1.044595, 2.620124, 1, 1, 1, 1, 1,
1.152116, 0.08751529, 1.249032, 1, 1, 1, 1, 1,
1.153989, 0.8187384, 2.1368, 1, 1, 1, 1, 1,
1.157565, -1.83018, 2.55478, 1, 1, 1, 1, 1,
1.16087, -1.207046, 2.14806, 1, 1, 1, 1, 1,
1.163777, 0.7581108, 1.774033, 1, 1, 1, 1, 1,
1.171941, 1.574836, 1.641968, 1, 1, 1, 1, 1,
1.174218, -0.22292, 1.510076, 0, 0, 1, 1, 1,
1.178463, -1.39638, 2.08291, 1, 0, 0, 1, 1,
1.188186, 1.165126, 1.315409, 1, 0, 0, 1, 1,
1.200698, -1.812126, 0.5713817, 1, 0, 0, 1, 1,
1.209454, 0.656661, 2.376848, 1, 0, 0, 1, 1,
1.213441, 0.1646389, 0.2617914, 1, 0, 0, 1, 1,
1.21803, 2.021997, 0.0261106, 0, 0, 0, 1, 1,
1.219145, 1.434712, 1.42755, 0, 0, 0, 1, 1,
1.220639, -0.9126364, 2.134669, 0, 0, 0, 1, 1,
1.232071, 0.4057499, 0.5282922, 0, 0, 0, 1, 1,
1.233125, 0.1027031, 1.488017, 0, 0, 0, 1, 1,
1.237916, -0.2804787, 3.01327, 0, 0, 0, 1, 1,
1.239052, 0.8978839, 0.4538675, 0, 0, 0, 1, 1,
1.241694, -0.3090172, 1.41424, 1, 1, 1, 1, 1,
1.243686, 0.3463196, -0.02224093, 1, 1, 1, 1, 1,
1.247837, 0.1540331, -1.503319, 1, 1, 1, 1, 1,
1.25319, -0.2722028, 1.359862, 1, 1, 1, 1, 1,
1.260632, -1.306529, 1.542515, 1, 1, 1, 1, 1,
1.268772, -0.1443175, 4.114278, 1, 1, 1, 1, 1,
1.278669, 0.1638549, -0.223978, 1, 1, 1, 1, 1,
1.286478, 1.89025, 2.837484, 1, 1, 1, 1, 1,
1.290975, -1.24885, 3.577115, 1, 1, 1, 1, 1,
1.292937, 0.8930477, 1.099924, 1, 1, 1, 1, 1,
1.307472, -0.3810923, 2.427657, 1, 1, 1, 1, 1,
1.31505, -0.4221083, 1.719116, 1, 1, 1, 1, 1,
1.324402, -0.8904978, 3.016028, 1, 1, 1, 1, 1,
1.325326, -0.1763301, 2.85338, 1, 1, 1, 1, 1,
1.325884, -0.4610435, 1.589145, 1, 1, 1, 1, 1,
1.329427, 1.683316, 0.9192083, 0, 0, 1, 1, 1,
1.335955, 2.016151, 1.54284, 1, 0, 0, 1, 1,
1.33826, -2.772199, 4.346539, 1, 0, 0, 1, 1,
1.345053, 1.509821, 0.2373157, 1, 0, 0, 1, 1,
1.346992, -1.13067, 0.2084107, 1, 0, 0, 1, 1,
1.352335, 0.8544289, -0.2235953, 1, 0, 0, 1, 1,
1.370561, -1.163287, 2.660198, 0, 0, 0, 1, 1,
1.381778, -0.3403134, 2.228644, 0, 0, 0, 1, 1,
1.39953, 0.6082735, -0.298411, 0, 0, 0, 1, 1,
1.404723, 0.263575, 2.089557, 0, 0, 0, 1, 1,
1.406824, 0.07112879, 1.401057, 0, 0, 0, 1, 1,
1.408606, -0.2469314, 0.9804204, 0, 0, 0, 1, 1,
1.409423, -0.4845623, 0.8714087, 0, 0, 0, 1, 1,
1.410449, -1.588074, 2.511239, 1, 1, 1, 1, 1,
1.419818, 0.3018688, 1.425277, 1, 1, 1, 1, 1,
1.420129, -0.8133815, 1.158382, 1, 1, 1, 1, 1,
1.421319, 0.7506065, 1.095614, 1, 1, 1, 1, 1,
1.427793, 0.2101752, 0.2257029, 1, 1, 1, 1, 1,
1.436861, -1.028144, 2.729241, 1, 1, 1, 1, 1,
1.441355, 2.418434, 1.712974, 1, 1, 1, 1, 1,
1.442147, -0.4902579, 1.801691, 1, 1, 1, 1, 1,
1.452097, -1.072517, 2.83609, 1, 1, 1, 1, 1,
1.464137, -0.117834, 2.132406, 1, 1, 1, 1, 1,
1.478642, -1.751831, 2.381814, 1, 1, 1, 1, 1,
1.478971, 1.118673, 0.8923904, 1, 1, 1, 1, 1,
1.484124, 0.9889128, 0.9454016, 1, 1, 1, 1, 1,
1.489788, 1.533737, 1.261595, 1, 1, 1, 1, 1,
1.491041, 0.5531389, 0.7181024, 1, 1, 1, 1, 1,
1.491605, -0.1537073, 0.8710938, 0, 0, 1, 1, 1,
1.494109, 0.9425905, 0.6127267, 1, 0, 0, 1, 1,
1.495611, -0.3460695, 1.195808, 1, 0, 0, 1, 1,
1.517063, 0.8015966, 2.607045, 1, 0, 0, 1, 1,
1.520419, 0.1636032, -0.841522, 1, 0, 0, 1, 1,
1.523235, -0.1418558, 2.247759, 1, 0, 0, 1, 1,
1.540155, -0.4461699, 0.6038481, 0, 0, 0, 1, 1,
1.544741, -0.1820389, 2.872781, 0, 0, 0, 1, 1,
1.551505, 0.5560597, 3.023105, 0, 0, 0, 1, 1,
1.561144, 0.9422581, 1.861375, 0, 0, 0, 1, 1,
1.566719, 0.07306176, 1.629234, 0, 0, 0, 1, 1,
1.58091, -0.8851182, 0.819763, 0, 0, 0, 1, 1,
1.582173, -0.4121357, 2.878268, 0, 0, 0, 1, 1,
1.606122, 0.2099212, 1.140162, 1, 1, 1, 1, 1,
1.612266, 0.5382341, 2.106323, 1, 1, 1, 1, 1,
1.614139, 0.9248515, 0.7949654, 1, 1, 1, 1, 1,
1.623394, 0.128284, 1.252239, 1, 1, 1, 1, 1,
1.629925, -1.148765, 0.5390433, 1, 1, 1, 1, 1,
1.641693, 0.04308258, 0.5292143, 1, 1, 1, 1, 1,
1.644888, -0.8483298, 1.256468, 1, 1, 1, 1, 1,
1.647137, 1.071082, -0.1257415, 1, 1, 1, 1, 1,
1.658425, 2.189254, -0.6943363, 1, 1, 1, 1, 1,
1.67398, 0.07198216, 3.11223, 1, 1, 1, 1, 1,
1.677259, -0.5313461, 1.365849, 1, 1, 1, 1, 1,
1.681871, 1.300389, 2.882947, 1, 1, 1, 1, 1,
1.695139, 0.1202898, 1.346687, 1, 1, 1, 1, 1,
1.698631, 0.06448735, 2.214209, 1, 1, 1, 1, 1,
1.712822, 0.4832743, 1.485456, 1, 1, 1, 1, 1,
1.715078, -1.29569, 1.743854, 0, 0, 1, 1, 1,
1.733294, 1.160451, -1.334967, 1, 0, 0, 1, 1,
1.740977, -0.7512825, 2.758944, 1, 0, 0, 1, 1,
1.759391, -0.5598139, 2.61213, 1, 0, 0, 1, 1,
1.761845, 0.2192722, 2.027512, 1, 0, 0, 1, 1,
1.777849, 0.9284474, 0.7543997, 1, 0, 0, 1, 1,
1.792698, 1.27653, 1.203377, 0, 0, 0, 1, 1,
1.808506, 1.500963, -0.589721, 0, 0, 0, 1, 1,
1.818604, 0.3270075, 2.28039, 0, 0, 0, 1, 1,
1.82448, 0.7124596, 1.508151, 0, 0, 0, 1, 1,
1.827868, 1.009367, -0.4839732, 0, 0, 0, 1, 1,
1.828008, 0.1354156, 2.607783, 0, 0, 0, 1, 1,
1.83361, 0.4222826, 0.8681075, 0, 0, 0, 1, 1,
1.835408, 0.118621, 0.5013216, 1, 1, 1, 1, 1,
1.839602, 0.02301161, 1.418545, 1, 1, 1, 1, 1,
1.852633, 1.984418, -0.004313517, 1, 1, 1, 1, 1,
1.853376, 1.979492, 0.5612574, 1, 1, 1, 1, 1,
1.877164, -0.9017028, 1.137773, 1, 1, 1, 1, 1,
1.958887, 0.292529, 1.938885, 1, 1, 1, 1, 1,
2.043838, -0.5764353, 2.700397, 1, 1, 1, 1, 1,
2.055825, 0.6021953, 1.603351, 1, 1, 1, 1, 1,
2.068412, -1.506337, 0.7503205, 1, 1, 1, 1, 1,
2.104934, 0.9993507, -0.0417496, 1, 1, 1, 1, 1,
2.110046, 0.9864562, 0.08353755, 1, 1, 1, 1, 1,
2.13319, 1.389421, 0.1378337, 1, 1, 1, 1, 1,
2.140112, -1.265172, 2.732466, 1, 1, 1, 1, 1,
2.143109, 0.6169832, 1.685098, 1, 1, 1, 1, 1,
2.192443, -0.240352, 1.848644, 1, 1, 1, 1, 1,
2.214233, -0.7282853, 1.326257, 0, 0, 1, 1, 1,
2.242343, 0.5508261, 2.06244, 1, 0, 0, 1, 1,
2.244527, -0.899919, 2.631388, 1, 0, 0, 1, 1,
2.284176, -0.2381826, 3.381735, 1, 0, 0, 1, 1,
2.317107, 0.8155648, 3.105826, 1, 0, 0, 1, 1,
2.333474, 0.2524246, 2.90933, 1, 0, 0, 1, 1,
2.353338, 1.367086, 1.579575, 0, 0, 0, 1, 1,
2.422515, 0.02988037, 1.523712, 0, 0, 0, 1, 1,
2.422774, -0.1144707, 1.73137, 0, 0, 0, 1, 1,
2.423456, -0.09146994, 0.3081686, 0, 0, 0, 1, 1,
2.423918, -1.012176, 2.244033, 0, 0, 0, 1, 1,
2.478901, -0.3012069, 2.277562, 0, 0, 0, 1, 1,
2.55651, -0.3424306, 1.80288, 0, 0, 0, 1, 1,
2.841337, -0.3355593, 1.074435, 1, 1, 1, 1, 1,
2.958195, -0.486613, 1.910428, 1, 1, 1, 1, 1,
3.100883, 0.1023898, 1.14072, 1, 1, 1, 1, 1,
3.332595, -0.2198837, 2.82484, 1, 1, 1, 1, 1,
3.447529, 0.8535603, 0.6881453, 1, 1, 1, 1, 1,
3.46169, 1.822886, 0.8807423, 1, 1, 1, 1, 1,
3.831051, 0.59199, -0.1520418, 1, 1, 1, 1, 1
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
var radius = 9.681575;
var distance = 34.00612;
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
mvMatrix.translate( -0.2772973, 0.03267193, 0.1931386 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00612);
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
