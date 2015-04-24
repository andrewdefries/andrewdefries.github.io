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
-2.756948, 0.3214619, 0.4833429, 1, 0, 0, 1,
-2.689342, -0.04220644, -0.7349371, 1, 0.007843138, 0, 1,
-2.647705, -0.4250503, -2.526727, 1, 0.01176471, 0, 1,
-2.643492, -0.8937121, -1.276592, 1, 0.01960784, 0, 1,
-2.62253, 1.483981, 0.450548, 1, 0.02352941, 0, 1,
-2.572873, -0.2238104, -3.093758, 1, 0.03137255, 0, 1,
-2.536731, -0.5995587, -2.374362, 1, 0.03529412, 0, 1,
-2.528645, 1.378686, -0.3838397, 1, 0.04313726, 0, 1,
-2.461628, -1.920134, -4.59828, 1, 0.04705882, 0, 1,
-2.449466, 0.6566365, -1.719452, 1, 0.05490196, 0, 1,
-2.405195, -0.9396059, -2.224419, 1, 0.05882353, 0, 1,
-2.349406, -0.1936026, -0.5498602, 1, 0.06666667, 0, 1,
-2.342052, -0.3731169, 0.1368236, 1, 0.07058824, 0, 1,
-2.303638, -1.108801, -2.35744, 1, 0.07843138, 0, 1,
-2.301997, -1.464136, -1.068413, 1, 0.08235294, 0, 1,
-2.239299, 0.05103884, -0.3661631, 1, 0.09019608, 0, 1,
-2.162818, -0.2018882, -0.3538993, 1, 0.09411765, 0, 1,
-2.116491, -0.859047, -0.9231577, 1, 0.1019608, 0, 1,
-2.08312, -0.9061598, -3.409557, 1, 0.1098039, 0, 1,
-2.073913, 1.13389, -2.285922, 1, 0.1137255, 0, 1,
-2.060233, -0.731645, -2.629922, 1, 0.1215686, 0, 1,
-2.048929, 0.3084952, -1.675344, 1, 0.1254902, 0, 1,
-2.039617, -0.4316887, -1.053537, 1, 0.1333333, 0, 1,
-2.03141, 0.4853165, -0.4415649, 1, 0.1372549, 0, 1,
-1.992704, 0.4469865, -1.311815, 1, 0.145098, 0, 1,
-1.962641, 0.735344, -2.035387, 1, 0.1490196, 0, 1,
-1.956525, -0.8048515, -3.219041, 1, 0.1568628, 0, 1,
-1.936332, -0.1244367, -2.204933, 1, 0.1607843, 0, 1,
-1.930841, -1.0031, -2.488302, 1, 0.1686275, 0, 1,
-1.920281, -0.5039078, -2.184467, 1, 0.172549, 0, 1,
-1.918058, 0.1328949, -3.062436, 1, 0.1803922, 0, 1,
-1.896025, -1.53974, -3.083688, 1, 0.1843137, 0, 1,
-1.891897, 1.085409, 0.5560001, 1, 0.1921569, 0, 1,
-1.888196, 2.251974, 0.1707634, 1, 0.1960784, 0, 1,
-1.863811, -0.8043137, -1.118647, 1, 0.2039216, 0, 1,
-1.839614, -0.1051332, -1.856152, 1, 0.2117647, 0, 1,
-1.837853, -0.3254924, -1.67226, 1, 0.2156863, 0, 1,
-1.816124, 0.2877361, -2.043406, 1, 0.2235294, 0, 1,
-1.810994, -0.7630638, -4.366136, 1, 0.227451, 0, 1,
-1.789038, -1.00849, -0.8836364, 1, 0.2352941, 0, 1,
-1.779888, 0.01025806, -0.7286664, 1, 0.2392157, 0, 1,
-1.776779, 0.9913424, -0.003668471, 1, 0.2470588, 0, 1,
-1.755325, 0.1485295, -2.006502, 1, 0.2509804, 0, 1,
-1.751771, 0.3485701, -1.890817, 1, 0.2588235, 0, 1,
-1.748587, 1.790497, -1.860871, 1, 0.2627451, 0, 1,
-1.732721, -0.4979398, -2.341448, 1, 0.2705882, 0, 1,
-1.714363, -0.8878683, -2.069708, 1, 0.2745098, 0, 1,
-1.705793, 0.2778957, -0.998813, 1, 0.282353, 0, 1,
-1.699583, 1.309778, -1.165294, 1, 0.2862745, 0, 1,
-1.670871, 0.9586508, -1.451493, 1, 0.2941177, 0, 1,
-1.662029, -0.6415136, -3.681948, 1, 0.3019608, 0, 1,
-1.660621, 0.6926176, -1.340821, 1, 0.3058824, 0, 1,
-1.65464, -1.230946, -1.388894, 1, 0.3137255, 0, 1,
-1.6381, -1.557523, -1.955175, 1, 0.3176471, 0, 1,
-1.615252, 0.7380698, 0.1174889, 1, 0.3254902, 0, 1,
-1.59226, -1.286948, -1.73916, 1, 0.3294118, 0, 1,
-1.592093, -0.2799589, -1.335216, 1, 0.3372549, 0, 1,
-1.582645, -0.1506399, -1.127169, 1, 0.3411765, 0, 1,
-1.578261, -1.599586, -0.3859844, 1, 0.3490196, 0, 1,
-1.576761, 2.180855, 0.7853279, 1, 0.3529412, 0, 1,
-1.553571, 1.376223, -1.805726, 1, 0.3607843, 0, 1,
-1.541283, 0.03930128, -1.545811, 1, 0.3647059, 0, 1,
-1.540577, 1.255488, -3.099062, 1, 0.372549, 0, 1,
-1.538656, 0.03277745, -1.411569, 1, 0.3764706, 0, 1,
-1.528896, 1.569227, 0.04660331, 1, 0.3843137, 0, 1,
-1.527631, 0.482536, -1.658091, 1, 0.3882353, 0, 1,
-1.51801, -0.1549579, -1.432456, 1, 0.3960784, 0, 1,
-1.480399, -1.510308, -1.95804, 1, 0.4039216, 0, 1,
-1.476686, -0.7202442, -0.7850574, 1, 0.4078431, 0, 1,
-1.475136, -0.1123994, -3.227287, 1, 0.4156863, 0, 1,
-1.470084, 0.2107092, -1.304859, 1, 0.4196078, 0, 1,
-1.469693, 0.9076073, -1.761996, 1, 0.427451, 0, 1,
-1.461121, 1.031374, 0.01506499, 1, 0.4313726, 0, 1,
-1.449773, 0.3949104, -2.049569, 1, 0.4392157, 0, 1,
-1.440483, 2.757243, 0.06163208, 1, 0.4431373, 0, 1,
-1.42936, 1.197817, -1.103671, 1, 0.4509804, 0, 1,
-1.385113, 1.16497, -0.8564275, 1, 0.454902, 0, 1,
-1.37966, 1.162061, -0.4702755, 1, 0.4627451, 0, 1,
-1.373128, -1.020444, -2.390851, 1, 0.4666667, 0, 1,
-1.369275, -0.5472131, -2.489879, 1, 0.4745098, 0, 1,
-1.365004, -0.3438341, -2.484802, 1, 0.4784314, 0, 1,
-1.360903, 1.016436, -1.284599, 1, 0.4862745, 0, 1,
-1.359796, -0.6364719, -2.24543, 1, 0.4901961, 0, 1,
-1.354198, 0.3758712, -0.666342, 1, 0.4980392, 0, 1,
-1.351007, -1.660197, -2.211243, 1, 0.5058824, 0, 1,
-1.349741, 0.1638052, 0.06802386, 1, 0.509804, 0, 1,
-1.341032, -1.03021, -2.457892, 1, 0.5176471, 0, 1,
-1.324973, -1.290805, -3.546575, 1, 0.5215687, 0, 1,
-1.323053, 0.3025227, -1.253503, 1, 0.5294118, 0, 1,
-1.320582, -1.341425, -3.521251, 1, 0.5333334, 0, 1,
-1.316432, -0.7768205, -3.954539, 1, 0.5411765, 0, 1,
-1.315383, 1.910026, -1.550172, 1, 0.5450981, 0, 1,
-1.315036, 0.03670384, -0.1772459, 1, 0.5529412, 0, 1,
-1.309126, -1.704328, -2.34554, 1, 0.5568628, 0, 1,
-1.298535, 2.95829, 0.4457608, 1, 0.5647059, 0, 1,
-1.29588, 0.4986599, -0.4505226, 1, 0.5686275, 0, 1,
-1.282348, 1.367694, -2.277744, 1, 0.5764706, 0, 1,
-1.277134, -0.2170384, -0.5190223, 1, 0.5803922, 0, 1,
-1.273947, 0.8151057, -1.393826, 1, 0.5882353, 0, 1,
-1.266694, 0.402977, -1.794942, 1, 0.5921569, 0, 1,
-1.26133, -0.03507122, -1.058142, 1, 0.6, 0, 1,
-1.254716, 0.6134197, -1.226949, 1, 0.6078432, 0, 1,
-1.250137, 1.303074, 0.1681546, 1, 0.6117647, 0, 1,
-1.24938, 0.1578723, -1.550776, 1, 0.6196079, 0, 1,
-1.246739, -0.6325198, -1.535632, 1, 0.6235294, 0, 1,
-1.241238, 0.1551743, -0.6135306, 1, 0.6313726, 0, 1,
-1.241191, 1.812098, -0.4090264, 1, 0.6352941, 0, 1,
-1.234873, 0.729682, -2.068106, 1, 0.6431373, 0, 1,
-1.230187, 1.236028, -0.3734224, 1, 0.6470588, 0, 1,
-1.226845, -1.077618, -2.370347, 1, 0.654902, 0, 1,
-1.203967, -0.4143034, -2.029058, 1, 0.6588235, 0, 1,
-1.201835, 0.0214794, -0.1373988, 1, 0.6666667, 0, 1,
-1.200776, 0.1824502, -1.510202, 1, 0.6705883, 0, 1,
-1.199396, -0.814113, -1.594479, 1, 0.6784314, 0, 1,
-1.193887, -0.0463161, -2.825624, 1, 0.682353, 0, 1,
-1.188545, 1.341458, -1.445822, 1, 0.6901961, 0, 1,
-1.177263, -1.971756, -2.301452, 1, 0.6941177, 0, 1,
-1.174124, -0.8218547, -3.289754, 1, 0.7019608, 0, 1,
-1.165804, -0.9865234, -2.447538, 1, 0.7098039, 0, 1,
-1.16568, -0.7924169, -3.380903, 1, 0.7137255, 0, 1,
-1.162433, 0.1981938, -0.1354291, 1, 0.7215686, 0, 1,
-1.160581, -1.056762, -2.332168, 1, 0.7254902, 0, 1,
-1.151643, -1.812695, -1.622662, 1, 0.7333333, 0, 1,
-1.14219, 1.47131, -2.858167, 1, 0.7372549, 0, 1,
-1.138378, 0.4919556, -1.926994, 1, 0.7450981, 0, 1,
-1.136026, -1.00562, -2.858855, 1, 0.7490196, 0, 1,
-1.13595, 0.4234487, -1.02142, 1, 0.7568628, 0, 1,
-1.135918, -0.4649844, -2.665555, 1, 0.7607843, 0, 1,
-1.132605, -1.951443, -3.426257, 1, 0.7686275, 0, 1,
-1.127784, -2.40692, -3.500117, 1, 0.772549, 0, 1,
-1.119588, -0.1200613, -1.386668, 1, 0.7803922, 0, 1,
-1.117105, 1.353406, -2.282933, 1, 0.7843137, 0, 1,
-1.114264, -0.6770768, -2.01932, 1, 0.7921569, 0, 1,
-1.10855, 0.04971635, -2.003335, 1, 0.7960784, 0, 1,
-1.106586, 0.7893129, -0.7352269, 1, 0.8039216, 0, 1,
-1.10325, 0.2211061, -2.056391, 1, 0.8117647, 0, 1,
-1.101663, 1.016097, -0.8361968, 1, 0.8156863, 0, 1,
-1.094971, -0.9314943, -1.942748, 1, 0.8235294, 0, 1,
-1.090598, 0.2583377, -2.232696, 1, 0.827451, 0, 1,
-1.084183, 0.3679305, -2.191355, 1, 0.8352941, 0, 1,
-1.079381, -0.906616, -1.115614, 1, 0.8392157, 0, 1,
-1.074803, 1.131096, -2.882041, 1, 0.8470588, 0, 1,
-1.066705, 0.2838321, 0.208582, 1, 0.8509804, 0, 1,
-1.05736, 0.8288645, -1.126534, 1, 0.8588235, 0, 1,
-1.050885, -2.539958, -2.151584, 1, 0.8627451, 0, 1,
-1.050723, -0.4438352, -2.173775, 1, 0.8705882, 0, 1,
-1.04459, 0.4644184, -0.7217911, 1, 0.8745098, 0, 1,
-1.043302, -0.5427805, -2.139351, 1, 0.8823529, 0, 1,
-1.032037, 0.540223, -1.708972, 1, 0.8862745, 0, 1,
-1.028944, 0.6909597, -0.7279895, 1, 0.8941177, 0, 1,
-1.018992, 0.880606, -0.6277391, 1, 0.8980392, 0, 1,
-1.015671, -0.8905625, -2.26444, 1, 0.9058824, 0, 1,
-1.013333, -0.6068425, -1.461883, 1, 0.9137255, 0, 1,
-1.012777, 0.6894768, -1.627348, 1, 0.9176471, 0, 1,
-1.011928, -0.4594994, -3.543988, 1, 0.9254902, 0, 1,
-1.009237, 1.824021, 0.2456081, 1, 0.9294118, 0, 1,
-1.008168, 0.4353887, -1.978982, 1, 0.9372549, 0, 1,
-1.00056, 0.4229808, -0.5839288, 1, 0.9411765, 0, 1,
-1.000066, 1.224279, 0.7054669, 1, 0.9490196, 0, 1,
-0.9991203, -0.8650739, -1.857804, 1, 0.9529412, 0, 1,
-0.9951884, -1.290436, -4.049289, 1, 0.9607843, 0, 1,
-0.9840407, 1.311646, -0.4675416, 1, 0.9647059, 0, 1,
-0.9777273, -0.950253, -1.102473, 1, 0.972549, 0, 1,
-0.9761603, -1.163872, -1.484466, 1, 0.9764706, 0, 1,
-0.9649535, 0.3498548, -1.588386, 1, 0.9843137, 0, 1,
-0.9564991, -0.04034068, -2.117851, 1, 0.9882353, 0, 1,
-0.9474123, 1.466215, 0.2145274, 1, 0.9960784, 0, 1,
-0.9458627, -1.135202, -2.268041, 0.9960784, 1, 0, 1,
-0.9456883, -0.9065862, -1.862925, 0.9921569, 1, 0, 1,
-0.9388134, -0.403054, -2.970762, 0.9843137, 1, 0, 1,
-0.937297, -0.06283542, -1.480325, 0.9803922, 1, 0, 1,
-0.9314339, 0.9901413, -1.544922, 0.972549, 1, 0, 1,
-0.9308881, -1.227217, -1.966242, 0.9686275, 1, 0, 1,
-0.9307709, -1.325681, -3.113586, 0.9607843, 1, 0, 1,
-0.9294235, -0.05823004, -2.788662, 0.9568627, 1, 0, 1,
-0.9184481, 0.02582601, -0.1540567, 0.9490196, 1, 0, 1,
-0.914562, 1.134265, -1.217816, 0.945098, 1, 0, 1,
-0.9113914, -0.3510662, -2.297987, 0.9372549, 1, 0, 1,
-0.9060805, 0.283945, -0.2195363, 0.9333333, 1, 0, 1,
-0.9026504, -1.094702, -2.438176, 0.9254902, 1, 0, 1,
-0.9026289, -0.2845358, -1.159656, 0.9215686, 1, 0, 1,
-0.900292, -1.691386, -2.741131, 0.9137255, 1, 0, 1,
-0.8957968, -0.1767219, -2.665961, 0.9098039, 1, 0, 1,
-0.8956046, -1.105868, -2.883775, 0.9019608, 1, 0, 1,
-0.8938584, -0.01649201, -2.899084, 0.8941177, 1, 0, 1,
-0.8928778, 1.950017, 1.279068, 0.8901961, 1, 0, 1,
-0.8917549, -1.425431, -4.360144, 0.8823529, 1, 0, 1,
-0.8894611, -0.4371068, -3.4851, 0.8784314, 1, 0, 1,
-0.8748791, 0.04218559, -2.81653, 0.8705882, 1, 0, 1,
-0.8705506, 0.2309543, -2.240262, 0.8666667, 1, 0, 1,
-0.8699049, 0.1382101, -1.497255, 0.8588235, 1, 0, 1,
-0.8691607, 1.368413, -4.481313, 0.854902, 1, 0, 1,
-0.8687286, -1.025286, -2.307167, 0.8470588, 1, 0, 1,
-0.8652088, 0.5843945, 0.2023485, 0.8431373, 1, 0, 1,
-0.8558376, 0.04375274, 0.8385648, 0.8352941, 1, 0, 1,
-0.8549392, -1.351918, -3.344667, 0.8313726, 1, 0, 1,
-0.8542523, -0.4258306, -1.57023, 0.8235294, 1, 0, 1,
-0.8524423, -0.8816695, -3.433369, 0.8196079, 1, 0, 1,
-0.8418956, 1.407711, 0.7022048, 0.8117647, 1, 0, 1,
-0.835084, 1.31252, -2.394122, 0.8078431, 1, 0, 1,
-0.8241814, 0.03518154, -3.041603, 0.8, 1, 0, 1,
-0.8236462, -0.07515544, -2.342004, 0.7921569, 1, 0, 1,
-0.8214819, -2.240473, -2.91141, 0.7882353, 1, 0, 1,
-0.8194627, 0.275651, -0.8169773, 0.7803922, 1, 0, 1,
-0.8190833, -0.01481394, -1.281987, 0.7764706, 1, 0, 1,
-0.8172935, -0.9641351, -1.863002, 0.7686275, 1, 0, 1,
-0.8032328, 0.2441457, -0.4624058, 0.7647059, 1, 0, 1,
-0.8017496, -0.1351694, -1.102636, 0.7568628, 1, 0, 1,
-0.7970046, 0.6355094, -2.266599, 0.7529412, 1, 0, 1,
-0.7911471, -0.5922799, -3.143797, 0.7450981, 1, 0, 1,
-0.7906549, -0.5288461, -2.73079, 0.7411765, 1, 0, 1,
-0.7899343, 0.3828027, -1.084568, 0.7333333, 1, 0, 1,
-0.7850715, 1.311874, -1.128285, 0.7294118, 1, 0, 1,
-0.7794793, -1.338984, -3.272841, 0.7215686, 1, 0, 1,
-0.7734687, -1.022985, -2.979524, 0.7176471, 1, 0, 1,
-0.7717526, -0.3900337, -2.854409, 0.7098039, 1, 0, 1,
-0.7701684, 2.262133, 0.8143006, 0.7058824, 1, 0, 1,
-0.7696024, -2.566363, -4.24205, 0.6980392, 1, 0, 1,
-0.7691109, 0.3615864, -2.034605, 0.6901961, 1, 0, 1,
-0.7679105, 0.1274438, -2.015807, 0.6862745, 1, 0, 1,
-0.7654512, -0.03587593, -3.432945, 0.6784314, 1, 0, 1,
-0.7651713, 0.2045642, -2.012365, 0.6745098, 1, 0, 1,
-0.7619163, -0.6210875, -1.653294, 0.6666667, 1, 0, 1,
-0.7612617, -1.217628, 0.2076818, 0.6627451, 1, 0, 1,
-0.7460267, 1.405082, -0.1520603, 0.654902, 1, 0, 1,
-0.7442163, -0.2032981, -2.943233, 0.6509804, 1, 0, 1,
-0.7436002, -1.02782, -3.59311, 0.6431373, 1, 0, 1,
-0.7364512, 0.2725312, -0.1504724, 0.6392157, 1, 0, 1,
-0.7344606, 0.05322099, -2.541766, 0.6313726, 1, 0, 1,
-0.7243956, -0.9069118, -3.088675, 0.627451, 1, 0, 1,
-0.7225695, 0.262105, -1.492009, 0.6196079, 1, 0, 1,
-0.7199712, 0.7807577, -0.01688714, 0.6156863, 1, 0, 1,
-0.7159432, 0.4504445, -1.965294, 0.6078432, 1, 0, 1,
-0.7146077, 2.287629, 0.1535181, 0.6039216, 1, 0, 1,
-0.704879, -1.783568, -1.03065, 0.5960785, 1, 0, 1,
-0.702114, -0.7913766, -2.10718, 0.5882353, 1, 0, 1,
-0.6992232, -1.027221, -3.847661, 0.5843138, 1, 0, 1,
-0.6990229, -1.700172, -2.646259, 0.5764706, 1, 0, 1,
-0.698272, 0.622196, -0.08698519, 0.572549, 1, 0, 1,
-0.6951459, 1.48718, 0.3107474, 0.5647059, 1, 0, 1,
-0.6920963, -0.7639989, -2.466811, 0.5607843, 1, 0, 1,
-0.6907519, 0.3639136, -2.387307, 0.5529412, 1, 0, 1,
-0.6877834, -0.3690202, -2.527933, 0.5490196, 1, 0, 1,
-0.6874911, 1.700323, 0.3063022, 0.5411765, 1, 0, 1,
-0.6841146, 0.716135, 0.3321523, 0.5372549, 1, 0, 1,
-0.684093, 0.02189316, -1.014797, 0.5294118, 1, 0, 1,
-0.6835188, 0.5269285, -1.917238, 0.5254902, 1, 0, 1,
-0.6811318, 0.7904676, -1.176414, 0.5176471, 1, 0, 1,
-0.6730459, -0.2694076, -0.7311804, 0.5137255, 1, 0, 1,
-0.6702652, 0.7531893, 0.5814317, 0.5058824, 1, 0, 1,
-0.668564, 0.07839103, -2.20435, 0.5019608, 1, 0, 1,
-0.6685079, 0.334151, -2.953726, 0.4941176, 1, 0, 1,
-0.6645642, -1.236233, -0.9449646, 0.4862745, 1, 0, 1,
-0.6626676, -0.4077877, -2.419252, 0.4823529, 1, 0, 1,
-0.6568912, -0.2451853, -2.412851, 0.4745098, 1, 0, 1,
-0.644054, 0.2492011, -0.1454503, 0.4705882, 1, 0, 1,
-0.6413743, -0.6757911, -3.476648, 0.4627451, 1, 0, 1,
-0.6400688, -0.5647845, -1.699434, 0.4588235, 1, 0, 1,
-0.6393741, 1.401667, 1.273564, 0.4509804, 1, 0, 1,
-0.6377356, 0.4323014, -0.5266066, 0.4470588, 1, 0, 1,
-0.6327153, -1.105129, -2.165143, 0.4392157, 1, 0, 1,
-0.6320199, -1.251162, -2.165285, 0.4352941, 1, 0, 1,
-0.6296612, -1.698646, -4.491582, 0.427451, 1, 0, 1,
-0.6288092, -1.756068, -2.84931, 0.4235294, 1, 0, 1,
-0.6276156, -2.048159, -1.401397, 0.4156863, 1, 0, 1,
-0.6247036, 1.002255, 1.108415, 0.4117647, 1, 0, 1,
-0.6242238, -0.7544035, -2.323493, 0.4039216, 1, 0, 1,
-0.6208778, -0.4682894, -2.010238, 0.3960784, 1, 0, 1,
-0.6198339, -1.285848, -3.486828, 0.3921569, 1, 0, 1,
-0.6188492, 0.8856076, -2.513373, 0.3843137, 1, 0, 1,
-0.6181353, -0.605876, -1.419048, 0.3803922, 1, 0, 1,
-0.6089259, 2.590664, -2.716825, 0.372549, 1, 0, 1,
-0.6078525, -1.016302, -2.678858, 0.3686275, 1, 0, 1,
-0.607067, 0.1261307, -1.960769, 0.3607843, 1, 0, 1,
-0.6055877, 0.2732874, -1.875295, 0.3568628, 1, 0, 1,
-0.6039966, -0.6915391, -0.7965544, 0.3490196, 1, 0, 1,
-0.6027458, -0.9596117, -5.039178, 0.345098, 1, 0, 1,
-0.6008867, -1.084634, -1.459977, 0.3372549, 1, 0, 1,
-0.5994172, -0.8552918, -2.103267, 0.3333333, 1, 0, 1,
-0.5957745, 0.7394553, -1.003339, 0.3254902, 1, 0, 1,
-0.589214, 1.111389, -0.02836858, 0.3215686, 1, 0, 1,
-0.5875784, -1.994726, -3.934101, 0.3137255, 1, 0, 1,
-0.5867098, -0.03582942, -1.825029, 0.3098039, 1, 0, 1,
-0.5780972, -0.3262952, -2.828957, 0.3019608, 1, 0, 1,
-0.5679802, 0.7448984, -0.2771299, 0.2941177, 1, 0, 1,
-0.5653536, -0.3519703, -0.006998356, 0.2901961, 1, 0, 1,
-0.5630552, 0.7121459, -1.039777, 0.282353, 1, 0, 1,
-0.5583316, 1.359492, -0.6869117, 0.2784314, 1, 0, 1,
-0.5517172, 0.04737829, -3.552979, 0.2705882, 1, 0, 1,
-0.5416471, -0.3676713, -2.570502, 0.2666667, 1, 0, 1,
-0.530995, -0.5057525, -3.216148, 0.2588235, 1, 0, 1,
-0.5299889, -1.101269, -0.3778248, 0.254902, 1, 0, 1,
-0.5286603, -0.5981565, -1.061421, 0.2470588, 1, 0, 1,
-0.5265545, 0.5955349, -2.359417, 0.2431373, 1, 0, 1,
-0.5155953, -0.36549, -1.912062, 0.2352941, 1, 0, 1,
-0.5117781, 1.765904, 1.34672, 0.2313726, 1, 0, 1,
-0.5098172, -0.5614617, -3.266246, 0.2235294, 1, 0, 1,
-0.5083268, 1.469518, 0.6802331, 0.2196078, 1, 0, 1,
-0.5074396, 0.1091485, -1.331322, 0.2117647, 1, 0, 1,
-0.5052551, 0.1704003, -0.6110455, 0.2078431, 1, 0, 1,
-0.5033899, -0.2436907, -1.189941, 0.2, 1, 0, 1,
-0.5007787, -1.279111, -1.36561, 0.1921569, 1, 0, 1,
-0.4991981, -1.53299, -4.638773, 0.1882353, 1, 0, 1,
-0.4982161, 0.1780892, -1.686872, 0.1803922, 1, 0, 1,
-0.4956058, -0.4471335, -2.79527, 0.1764706, 1, 0, 1,
-0.494575, -1.113163, -0.8134287, 0.1686275, 1, 0, 1,
-0.4944803, 0.5893989, -1.424694, 0.1647059, 1, 0, 1,
-0.4911956, 0.3706677, 1.936658, 0.1568628, 1, 0, 1,
-0.4885893, 0.7389849, 0.1738795, 0.1529412, 1, 0, 1,
-0.4879851, 0.754346, -1.177378, 0.145098, 1, 0, 1,
-0.4859431, -0.2480478, -4.139833, 0.1411765, 1, 0, 1,
-0.4780856, 0.9531589, 1.436373, 0.1333333, 1, 0, 1,
-0.4744846, -1.186926, -2.467063, 0.1294118, 1, 0, 1,
-0.4676071, 0.554775, -1.140537, 0.1215686, 1, 0, 1,
-0.4665534, -1.215816, -2.589652, 0.1176471, 1, 0, 1,
-0.4658953, -0.2729713, -1.400781, 0.1098039, 1, 0, 1,
-0.4638352, -1.576642, -4.223886, 0.1058824, 1, 0, 1,
-0.4637918, -0.08317497, -0.02595055, 0.09803922, 1, 0, 1,
-0.4629521, 1.00577, 1.567088, 0.09019608, 1, 0, 1,
-0.4625821, 2.020396, -0.3637047, 0.08627451, 1, 0, 1,
-0.4594013, 0.02439974, -3.373022, 0.07843138, 1, 0, 1,
-0.4543398, -0.2194245, -3.315166, 0.07450981, 1, 0, 1,
-0.4525222, -0.2915797, -2.35656, 0.06666667, 1, 0, 1,
-0.4496365, 1.153486, -0.6988186, 0.0627451, 1, 0, 1,
-0.4456961, 0.5353864, -1.402691, 0.05490196, 1, 0, 1,
-0.4451323, -0.5429184, -3.918792, 0.05098039, 1, 0, 1,
-0.4442698, -0.253639, -0.9845852, 0.04313726, 1, 0, 1,
-0.4429178, -2.024095, -4.180045, 0.03921569, 1, 0, 1,
-0.4425035, -0.980142, -0.950712, 0.03137255, 1, 0, 1,
-0.4418516, -0.6307235, -2.232138, 0.02745098, 1, 0, 1,
-0.4409297, -0.6530653, -1.268177, 0.01960784, 1, 0, 1,
-0.4386523, 0.6939642, -0.5744995, 0.01568628, 1, 0, 1,
-0.4383477, -0.2746595, -0.5202469, 0.007843138, 1, 0, 1,
-0.434819, -0.9102361, 0.9263677, 0.003921569, 1, 0, 1,
-0.4312875, -0.4961756, -4.336027, 0, 1, 0.003921569, 1,
-0.4300982, 2.498941, 1.176364, 0, 1, 0.01176471, 1,
-0.4265215, 0.1720617, -1.761588, 0, 1, 0.01568628, 1,
-0.424138, -0.2429094, -2.692033, 0, 1, 0.02352941, 1,
-0.4238901, 0.171302, 0.553916, 0, 1, 0.02745098, 1,
-0.4214724, -0.5156101, -1.56987, 0, 1, 0.03529412, 1,
-0.4099613, -0.7827612, -2.086908, 0, 1, 0.03921569, 1,
-0.405927, -3.283985, -3.771754, 0, 1, 0.04705882, 1,
-0.40034, 1.528685, 0.6599708, 0, 1, 0.05098039, 1,
-0.3990662, -0.608831, -1.563637, 0, 1, 0.05882353, 1,
-0.3967755, -0.1541974, -1.481275, 0, 1, 0.0627451, 1,
-0.3902969, -0.0552977, -2.413998, 0, 1, 0.07058824, 1,
-0.3890051, 0.3756412, -0.3778831, 0, 1, 0.07450981, 1,
-0.3872409, -1.173595, -2.863472, 0, 1, 0.08235294, 1,
-0.387003, -0.7661548, -1.788731, 0, 1, 0.08627451, 1,
-0.3731088, -0.3179026, -1.64413, 0, 1, 0.09411765, 1,
-0.3728655, 0.129172, -1.846308, 0, 1, 0.1019608, 1,
-0.3701318, 0.003188472, -0.7245205, 0, 1, 0.1058824, 1,
-0.3701272, 0.6578016, -2.593734, 0, 1, 0.1137255, 1,
-0.3690873, 0.6647061, -1.06854, 0, 1, 0.1176471, 1,
-0.3680011, 1.118613, 0.804689, 0, 1, 0.1254902, 1,
-0.3677602, 0.4867209, 0.1491232, 0, 1, 0.1294118, 1,
-0.3613098, 2.017633, 0.8452485, 0, 1, 0.1372549, 1,
-0.3608086, 1.769088, 0.04675026, 0, 1, 0.1411765, 1,
-0.3604737, 0.2811185, -1.542031, 0, 1, 0.1490196, 1,
-0.3604335, -0.1086414, -1.468317, 0, 1, 0.1529412, 1,
-0.3587861, 0.1587807, -1.817656, 0, 1, 0.1607843, 1,
-0.3576252, 0.4230899, -1.088831, 0, 1, 0.1647059, 1,
-0.3534932, 0.7427071, -0.9311785, 0, 1, 0.172549, 1,
-0.3480296, 0.8956382, -0.4266259, 0, 1, 0.1764706, 1,
-0.3446183, 0.5889637, -0.8727135, 0, 1, 0.1843137, 1,
-0.3399961, -0.5424435, -2.353253, 0, 1, 0.1882353, 1,
-0.3373417, 1.389703, -0.7732287, 0, 1, 0.1960784, 1,
-0.3362132, -0.04342291, -1.803716, 0, 1, 0.2039216, 1,
-0.3314918, -0.6969841, -2.565341, 0, 1, 0.2078431, 1,
-0.3288415, 0.4188547, -0.699637, 0, 1, 0.2156863, 1,
-0.3248909, 1.266316, 0.04218299, 0, 1, 0.2196078, 1,
-0.3166645, -2.500935, -4.004265, 0, 1, 0.227451, 1,
-0.31497, 1.007411, 0.2125939, 0, 1, 0.2313726, 1,
-0.3127565, 0.2371727, -1.066748, 0, 1, 0.2392157, 1,
-0.312082, 0.9477372, -1.06429, 0, 1, 0.2431373, 1,
-0.3117348, 1.17116, -0.7683334, 0, 1, 0.2509804, 1,
-0.3108452, 1.133871, -2.896595, 0, 1, 0.254902, 1,
-0.3082613, -0.5906707, 0.4224487, 0, 1, 0.2627451, 1,
-0.3047362, 0.6454025, -2.473036, 0, 1, 0.2666667, 1,
-0.3018341, -0.3290435, -1.120986, 0, 1, 0.2745098, 1,
-0.2946449, 1.803278, 0.03601343, 0, 1, 0.2784314, 1,
-0.2930553, 0.3800138, -1.577748, 0, 1, 0.2862745, 1,
-0.2851851, 0.6205496, -1.467014, 0, 1, 0.2901961, 1,
-0.2805464, 0.1443554, -1.890677, 0, 1, 0.2980392, 1,
-0.2798414, -0.3674517, -3.48201, 0, 1, 0.3058824, 1,
-0.2787558, -0.08394721, -1.686502, 0, 1, 0.3098039, 1,
-0.2768109, 0.7708591, 0.3222235, 0, 1, 0.3176471, 1,
-0.2741648, -0.4796476, -3.795309, 0, 1, 0.3215686, 1,
-0.2738063, 0.326961, -0.6216434, 0, 1, 0.3294118, 1,
-0.2716665, -0.8788803, -2.525203, 0, 1, 0.3333333, 1,
-0.2706305, -2.099531, -3.120707, 0, 1, 0.3411765, 1,
-0.2624882, -0.03089913, -1.346454, 0, 1, 0.345098, 1,
-0.2611989, -0.2768002, -1.640958, 0, 1, 0.3529412, 1,
-0.2547121, -0.6966496, -4.821331, 0, 1, 0.3568628, 1,
-0.2520838, 0.3481844, -1.484536, 0, 1, 0.3647059, 1,
-0.2490627, 0.7411686, -2.655445, 0, 1, 0.3686275, 1,
-0.2481508, -1.187491, -3.124547, 0, 1, 0.3764706, 1,
-0.2412345, -2.192135, -3.316412, 0, 1, 0.3803922, 1,
-0.2410756, -1.089651, -3.797236, 0, 1, 0.3882353, 1,
-0.2397961, -0.3014725, -2.972127, 0, 1, 0.3921569, 1,
-0.2360366, 0.1327501, -1.254241, 0, 1, 0.4, 1,
-0.2301152, -0.8522131, -3.598652, 0, 1, 0.4078431, 1,
-0.2272422, 0.4978003, 1.288599, 0, 1, 0.4117647, 1,
-0.2259656, -0.6395019, -1.909308, 0, 1, 0.4196078, 1,
-0.2228383, 0.6947626, -1.292704, 0, 1, 0.4235294, 1,
-0.2203268, -0.3674384, -4.907536, 0, 1, 0.4313726, 1,
-0.2193571, -0.03053506, -1.9279, 0, 1, 0.4352941, 1,
-0.2148213, -0.5952643, -2.949147, 0, 1, 0.4431373, 1,
-0.2134495, -0.4545374, -1.13811, 0, 1, 0.4470588, 1,
-0.211054, -0.7728848, -2.054786, 0, 1, 0.454902, 1,
-0.2104658, 1.382654, -0.6851946, 0, 1, 0.4588235, 1,
-0.2084763, -1.812702, -4.60425, 0, 1, 0.4666667, 1,
-0.2067361, 0.2889346, 0.3001241, 0, 1, 0.4705882, 1,
-0.2019461, 0.5939909, 0.4027056, 0, 1, 0.4784314, 1,
-0.1969565, 2.280153, -1.73837, 0, 1, 0.4823529, 1,
-0.1947392, -1.479673, -3.849241, 0, 1, 0.4901961, 1,
-0.1865929, -0.2973119, -1.185843, 0, 1, 0.4941176, 1,
-0.179861, 0.6744344, -0.8237288, 0, 1, 0.5019608, 1,
-0.1796921, -1.091773, -1.642049, 0, 1, 0.509804, 1,
-0.1789661, -0.4556487, -2.015, 0, 1, 0.5137255, 1,
-0.1789219, -1.36809, -3.048699, 0, 1, 0.5215687, 1,
-0.1785423, 0.5849182, -1.713559, 0, 1, 0.5254902, 1,
-0.177913, -0.1468801, -1.875401, 0, 1, 0.5333334, 1,
-0.176139, 0.05085761, -1.533046, 0, 1, 0.5372549, 1,
-0.1758238, -0.4881092, -1.955307, 0, 1, 0.5450981, 1,
-0.1743721, -0.9561355, -2.221669, 0, 1, 0.5490196, 1,
-0.167038, -0.5818675, -3.61789, 0, 1, 0.5568628, 1,
-0.1649448, -1.830322, -2.88461, 0, 1, 0.5607843, 1,
-0.1626566, -1.084881, -3.73054, 0, 1, 0.5686275, 1,
-0.1593145, -0.7532399, -5.587057, 0, 1, 0.572549, 1,
-0.1561545, -0.06360786, -1.36927, 0, 1, 0.5803922, 1,
-0.1555459, -0.04436544, -1.863797, 0, 1, 0.5843138, 1,
-0.1503112, 0.9586549, -0.6130051, 0, 1, 0.5921569, 1,
-0.1487394, 0.5206373, -0.9515578, 0, 1, 0.5960785, 1,
-0.1377316, -1.613576, -3.13359, 0, 1, 0.6039216, 1,
-0.1366284, -0.8880744, -5.321683, 0, 1, 0.6117647, 1,
-0.1312199, -0.5127863, -3.994644, 0, 1, 0.6156863, 1,
-0.1296389, 0.9679624, -0.9870467, 0, 1, 0.6235294, 1,
-0.1292979, -1.513629, -0.9013727, 0, 1, 0.627451, 1,
-0.1284218, 1.064696, -1.756877, 0, 1, 0.6352941, 1,
-0.124473, -0.002071955, -2.410145, 0, 1, 0.6392157, 1,
-0.123165, 1.603638, 1.156286, 0, 1, 0.6470588, 1,
-0.122582, 0.1520733, -0.1906816, 0, 1, 0.6509804, 1,
-0.1209053, 0.3583829, 0.06751536, 0, 1, 0.6588235, 1,
-0.1162295, 1.695309, 0.2433331, 0, 1, 0.6627451, 1,
-0.1110121, 1.250692, -1.360662, 0, 1, 0.6705883, 1,
-0.1092777, -1.401343, -1.602377, 0, 1, 0.6745098, 1,
-0.1076551, 0.9369342, -0.6461458, 0, 1, 0.682353, 1,
-0.0976613, 2.283971, -0.7726148, 0, 1, 0.6862745, 1,
-0.09072685, -0.95412, -3.392625, 0, 1, 0.6941177, 1,
-0.08781188, 0.7690976, -0.3988125, 0, 1, 0.7019608, 1,
-0.08050294, 0.8497152, 0.1928204, 0, 1, 0.7058824, 1,
-0.07815462, -0.6165261, -2.406553, 0, 1, 0.7137255, 1,
-0.07582281, -0.8247033, -2.432549, 0, 1, 0.7176471, 1,
-0.0756776, 0.01522936, -1.744074, 0, 1, 0.7254902, 1,
-0.07374439, -0.1835863, -2.450422, 0, 1, 0.7294118, 1,
-0.07310233, 0.3056343, 0.008404128, 0, 1, 0.7372549, 1,
-0.06974303, 0.09935486, -1.300946, 0, 1, 0.7411765, 1,
-0.0647986, -1.510324, -3.615082, 0, 1, 0.7490196, 1,
-0.06390901, -2.013237, -4.111326, 0, 1, 0.7529412, 1,
-0.05976624, 1.79698, 0.03279699, 0, 1, 0.7607843, 1,
-0.05860233, 1.426472, -0.6549941, 0, 1, 0.7647059, 1,
-0.05565204, 0.407024, -0.513079, 0, 1, 0.772549, 1,
-0.05276613, 0.7453232, 0.03710749, 0, 1, 0.7764706, 1,
-0.04551318, -0.7279328, -3.929365, 0, 1, 0.7843137, 1,
-0.04323433, -0.4831787, -3.352453, 0, 1, 0.7882353, 1,
-0.03902612, 0.08627626, -1.034381, 0, 1, 0.7960784, 1,
-0.03850324, 0.3663863, -0.8198539, 0, 1, 0.8039216, 1,
-0.03523844, 0.7146215, -1.062107, 0, 1, 0.8078431, 1,
-0.03059372, 0.9855759, 1.118223, 0, 1, 0.8156863, 1,
-0.0283624, 0.1635126, 0.2670022, 0, 1, 0.8196079, 1,
-0.02386924, 0.290723, 0.3409009, 0, 1, 0.827451, 1,
-0.01808287, 0.9559752, 2.388463, 0, 1, 0.8313726, 1,
-0.01805018, 0.530797, 1.031128, 0, 1, 0.8392157, 1,
-0.0112043, -2.270175, -2.637492, 0, 1, 0.8431373, 1,
-0.0101856, 0.4203105, 0.8816396, 0, 1, 0.8509804, 1,
-0.009092507, -0.7707658, -2.617084, 0, 1, 0.854902, 1,
-0.008062307, 0.08775423, 0.08591826, 0, 1, 0.8627451, 1,
-0.005963076, -0.919867, -3.704887, 0, 1, 0.8666667, 1,
0.005997833, -0.8290846, 1.354813, 0, 1, 0.8745098, 1,
0.006656635, -1.741189, 3.396976, 0, 1, 0.8784314, 1,
0.008016349, 0.4507258, 0.9154174, 0, 1, 0.8862745, 1,
0.008838994, 0.3138735, 1.262734, 0, 1, 0.8901961, 1,
0.009768337, -0.8924762, 2.787188, 0, 1, 0.8980392, 1,
0.01219036, -0.0716382, 3.652144, 0, 1, 0.9058824, 1,
0.01709579, -0.05830833, 3.875912, 0, 1, 0.9098039, 1,
0.01736961, -0.06871188, 2.365342, 0, 1, 0.9176471, 1,
0.01984605, 0.2938053, -0.1395047, 0, 1, 0.9215686, 1,
0.0212693, -0.1601021, 4.487528, 0, 1, 0.9294118, 1,
0.02344728, 0.6135026, -0.168124, 0, 1, 0.9333333, 1,
0.02471221, -1.056244, 3.924088, 0, 1, 0.9411765, 1,
0.02697032, 0.3132332, 1.379969, 0, 1, 0.945098, 1,
0.02831784, 0.3878835, 0.6133896, 0, 1, 0.9529412, 1,
0.03130988, 0.3993892, 0.4128395, 0, 1, 0.9568627, 1,
0.03136693, -0.3698084, 3.279217, 0, 1, 0.9647059, 1,
0.03614011, 0.9995422, -0.2308575, 0, 1, 0.9686275, 1,
0.0380144, 0.04278893, 0.3408897, 0, 1, 0.9764706, 1,
0.04023787, 0.4466399, 0.1016295, 0, 1, 0.9803922, 1,
0.04458384, 1.053184, 1.197628, 0, 1, 0.9882353, 1,
0.04761048, 0.1698178, -0.4073545, 0, 1, 0.9921569, 1,
0.04805923, 0.7640792, -1.05622, 0, 1, 1, 1,
0.05025499, -1.773601, 0.5521511, 0, 0.9921569, 1, 1,
0.05282428, 1.839126, 1.583829, 0, 0.9882353, 1, 1,
0.05387315, -0.3301004, 3.722586, 0, 0.9803922, 1, 1,
0.05822017, -1.472524, 2.461085, 0, 0.9764706, 1, 1,
0.05860758, 0.3423687, 0.7950392, 0, 0.9686275, 1, 1,
0.06041772, -0.3259426, 4.101685, 0, 0.9647059, 1, 1,
0.06256061, 0.2775659, 0.4716118, 0, 0.9568627, 1, 1,
0.06257743, 0.5393058, 0.3036366, 0, 0.9529412, 1, 1,
0.06502554, -0.6170265, 2.799946, 0, 0.945098, 1, 1,
0.0725566, -0.08171264, 1.074319, 0, 0.9411765, 1, 1,
0.07357825, -1.003059, 3.912789, 0, 0.9333333, 1, 1,
0.07358425, 0.346065, 0.3025923, 0, 0.9294118, 1, 1,
0.07482348, 1.002841, -0.1692739, 0, 0.9215686, 1, 1,
0.07527304, 0.05446734, 1.031405, 0, 0.9176471, 1, 1,
0.0779095, -1.037564, 2.464897, 0, 0.9098039, 1, 1,
0.08109734, -0.7772762, 3.197551, 0, 0.9058824, 1, 1,
0.08292739, -1.489501, 2.467187, 0, 0.8980392, 1, 1,
0.08310693, -1.516493, 3.280731, 0, 0.8901961, 1, 1,
0.08345906, 0.1081554, 0.3791483, 0, 0.8862745, 1, 1,
0.08461405, -0.71565, 4.205245, 0, 0.8784314, 1, 1,
0.0863774, -0.7610265, 4.146927, 0, 0.8745098, 1, 1,
0.08650987, -0.3087176, 2.789166, 0, 0.8666667, 1, 1,
0.08926189, -1.324541, 3.965593, 0, 0.8627451, 1, 1,
0.08983119, -0.8843529, 3.085304, 0, 0.854902, 1, 1,
0.09023853, -0.3908467, 3.842949, 0, 0.8509804, 1, 1,
0.09033523, 0.1876232, 1.707301, 0, 0.8431373, 1, 1,
0.09067061, 0.3081831, 0.5535835, 0, 0.8392157, 1, 1,
0.09097221, -0.191341, 1.666196, 0, 0.8313726, 1, 1,
0.0976899, -2.672476, 2.161956, 0, 0.827451, 1, 1,
0.1042582, -0.6538755, 3.445654, 0, 0.8196079, 1, 1,
0.1093927, -0.2727828, 3.051348, 0, 0.8156863, 1, 1,
0.1095386, 0.3496491, -0.06433598, 0, 0.8078431, 1, 1,
0.110506, -2.022141, 2.682045, 0, 0.8039216, 1, 1,
0.1146744, -0.2117883, 3.358777, 0, 0.7960784, 1, 1,
0.1237316, 0.2783876, -0.07149363, 0, 0.7882353, 1, 1,
0.1242883, 1.002656, -0.5686815, 0, 0.7843137, 1, 1,
0.129773, -1.82148, 2.562604, 0, 0.7764706, 1, 1,
0.1348109, -1.327182, 2.170146, 0, 0.772549, 1, 1,
0.1374429, -0.5157362, 1.391374, 0, 0.7647059, 1, 1,
0.1400696, 0.6180915, 0.3824091, 0, 0.7607843, 1, 1,
0.1448449, 0.6339411, -1.363623, 0, 0.7529412, 1, 1,
0.1456153, -1.564868, 3.586591, 0, 0.7490196, 1, 1,
0.1509715, 0.8567815, -0.4567283, 0, 0.7411765, 1, 1,
0.1512723, -1.788413, 2.338591, 0, 0.7372549, 1, 1,
0.1520264, -0.06674809, 1.637217, 0, 0.7294118, 1, 1,
0.1549669, -0.1141067, 3.062573, 0, 0.7254902, 1, 1,
0.1567079, -1.369863, 2.714737, 0, 0.7176471, 1, 1,
0.157271, -1.877536, 2.489579, 0, 0.7137255, 1, 1,
0.1580052, -1.717321, 3.150431, 0, 0.7058824, 1, 1,
0.1599542, 1.61418, -0.6553208, 0, 0.6980392, 1, 1,
0.1603552, 0.5912942, -0.5783139, 0, 0.6941177, 1, 1,
0.1606015, -0.8826896, 3.372807, 0, 0.6862745, 1, 1,
0.1639276, 1.372158, 0.01029787, 0, 0.682353, 1, 1,
0.1661521, 0.3486936, 0.4979778, 0, 0.6745098, 1, 1,
0.1679166, -0.3331124, 2.644358, 0, 0.6705883, 1, 1,
0.1683157, -0.0003268392, 1.850416, 0, 0.6627451, 1, 1,
0.1702445, -0.8299156, 2.409233, 0, 0.6588235, 1, 1,
0.1707805, 0.1280839, 0.2769603, 0, 0.6509804, 1, 1,
0.1752558, 1.27055, -0.04839388, 0, 0.6470588, 1, 1,
0.1754367, 1.940611, -0.2419315, 0, 0.6392157, 1, 1,
0.1754811, 0.4872148, 0.9685424, 0, 0.6352941, 1, 1,
0.1768717, -0.4287503, 1.755036, 0, 0.627451, 1, 1,
0.1790809, 0.8483436, -0.8561677, 0, 0.6235294, 1, 1,
0.1803133, 0.8061647, -1.450961, 0, 0.6156863, 1, 1,
0.1817272, -1.000384, 3.292849, 0, 0.6117647, 1, 1,
0.1818999, 1.497519, 0.04276151, 0, 0.6039216, 1, 1,
0.1826331, -0.6649474, 3.36223, 0, 0.5960785, 1, 1,
0.1839986, 1.359807, -0.0604064, 0, 0.5921569, 1, 1,
0.1840696, 1.027843, 0.9349677, 0, 0.5843138, 1, 1,
0.1844717, -0.006133055, 1.433491, 0, 0.5803922, 1, 1,
0.1857044, -0.7022129, 2.227464, 0, 0.572549, 1, 1,
0.1865069, -0.3363095, 3.141332, 0, 0.5686275, 1, 1,
0.1882579, -0.426629, 2.72109, 0, 0.5607843, 1, 1,
0.1902793, 0.4143024, 0.4733929, 0, 0.5568628, 1, 1,
0.1924208, -0.0006792248, 0.9057426, 0, 0.5490196, 1, 1,
0.1925548, -0.783025, 3.133427, 0, 0.5450981, 1, 1,
0.193432, -1.354884, 1.747509, 0, 0.5372549, 1, 1,
0.1938092, -1.691579, 2.569721, 0, 0.5333334, 1, 1,
0.1954271, 0.649684, 2.475914, 0, 0.5254902, 1, 1,
0.1957609, 0.004416937, 3.373305, 0, 0.5215687, 1, 1,
0.198085, 0.6316192, 0.2767389, 0, 0.5137255, 1, 1,
0.2030119, -1.19117, 4.704985, 0, 0.509804, 1, 1,
0.203957, 0.3307028, 0.8158403, 0, 0.5019608, 1, 1,
0.2065256, -0.09695858, 2.288574, 0, 0.4941176, 1, 1,
0.2065318, -0.941943, 3.137061, 0, 0.4901961, 1, 1,
0.2066755, 0.8793671, 0.6889464, 0, 0.4823529, 1, 1,
0.2100298, 0.1845985, 1.428885, 0, 0.4784314, 1, 1,
0.2113944, -0.31205, 2.633098, 0, 0.4705882, 1, 1,
0.2136509, 0.4083191, 0.06220161, 0, 0.4666667, 1, 1,
0.2170692, 0.8511576, 0.3325567, 0, 0.4588235, 1, 1,
0.2193342, -0.2132863, 2.860665, 0, 0.454902, 1, 1,
0.220455, 0.9471198, -1.155659, 0, 0.4470588, 1, 1,
0.2204812, -2.491509, 4.445976, 0, 0.4431373, 1, 1,
0.2206408, 1.411302, -0.5284191, 0, 0.4352941, 1, 1,
0.2208432, 1.198224, 0.394362, 0, 0.4313726, 1, 1,
0.2208579, -2.038262, 3.674361, 0, 0.4235294, 1, 1,
0.2209039, -0.4512835, 2.628551, 0, 0.4196078, 1, 1,
0.2239558, -0.4878479, 0.7772234, 0, 0.4117647, 1, 1,
0.2247622, -1.1512, 5.475654, 0, 0.4078431, 1, 1,
0.2268701, 0.7962553, 0.5852061, 0, 0.4, 1, 1,
0.2288738, -1.104871, 0.736119, 0, 0.3921569, 1, 1,
0.2308223, 1.914878, 0.7058774, 0, 0.3882353, 1, 1,
0.2364183, 0.5975407, 1.641514, 0, 0.3803922, 1, 1,
0.2382432, -0.7591389, 2.526552, 0, 0.3764706, 1, 1,
0.238737, 0.7501141, 0.119788, 0, 0.3686275, 1, 1,
0.2441514, 2.13205, -0.6424291, 0, 0.3647059, 1, 1,
0.2450259, 0.09712586, 1.806125, 0, 0.3568628, 1, 1,
0.2461638, 0.893196, 0.6362691, 0, 0.3529412, 1, 1,
0.2523843, -0.4204237, 2.686944, 0, 0.345098, 1, 1,
0.2562142, -0.378161, 3.064792, 0, 0.3411765, 1, 1,
0.2614432, 0.3883086, 0.7591957, 0, 0.3333333, 1, 1,
0.2652141, -0.1715859, 2.210909, 0, 0.3294118, 1, 1,
0.2670149, -0.1309078, 2.580671, 0, 0.3215686, 1, 1,
0.2688345, -2.449492, 3.516664, 0, 0.3176471, 1, 1,
0.2701996, -0.1136703, 0.7815081, 0, 0.3098039, 1, 1,
0.2776394, -0.4214262, 2.440655, 0, 0.3058824, 1, 1,
0.2826856, 0.248994, 1.579651, 0, 0.2980392, 1, 1,
0.2827803, 1.238194, 1.053016, 0, 0.2901961, 1, 1,
0.2858978, 1.789676, -1.703235, 0, 0.2862745, 1, 1,
0.2863538, 0.1611985, 0.8805127, 0, 0.2784314, 1, 1,
0.2877247, 0.5693114, 0.8780473, 0, 0.2745098, 1, 1,
0.2883473, -0.7026569, 2.59674, 0, 0.2666667, 1, 1,
0.2898258, -0.3085336, 2.731317, 0, 0.2627451, 1, 1,
0.2932857, -0.7964853, 1.993203, 0, 0.254902, 1, 1,
0.3055611, -0.1321417, 2.610308, 0, 0.2509804, 1, 1,
0.3056043, -1.456423, 2.661515, 0, 0.2431373, 1, 1,
0.3070218, -1.267803, 3.324353, 0, 0.2392157, 1, 1,
0.3086074, -0.9060922, 3.268346, 0, 0.2313726, 1, 1,
0.309574, 0.8189816, 0.09984861, 0, 0.227451, 1, 1,
0.3109234, -0.3163387, 2.260867, 0, 0.2196078, 1, 1,
0.3125939, 0.8477426, -0.2446723, 0, 0.2156863, 1, 1,
0.3153437, -0.6212049, 3.304159, 0, 0.2078431, 1, 1,
0.3171666, -0.9222587, 2.922096, 0, 0.2039216, 1, 1,
0.3184269, 0.2222043, 1.924735, 0, 0.1960784, 1, 1,
0.322497, 1.4648, 1.298698, 0, 0.1882353, 1, 1,
0.3248267, -0.2519338, 0.4480109, 0, 0.1843137, 1, 1,
0.3311099, -0.1942282, 3.115514, 0, 0.1764706, 1, 1,
0.3332686, -0.4489449, 2.204779, 0, 0.172549, 1, 1,
0.3386887, -0.479369, 2.392454, 0, 0.1647059, 1, 1,
0.3408073, -2.095168, 0.9985591, 0, 0.1607843, 1, 1,
0.3413855, 0.2896948, 2.555609, 0, 0.1529412, 1, 1,
0.3490151, 0.1834922, -0.7892594, 0, 0.1490196, 1, 1,
0.3501033, 0.06149768, 2.271036, 0, 0.1411765, 1, 1,
0.3536923, -2.550956, 2.678355, 0, 0.1372549, 1, 1,
0.3538441, -0.06820431, 1.419711, 0, 0.1294118, 1, 1,
0.3570667, 2.143541, 0.3465645, 0, 0.1254902, 1, 1,
0.3609367, 1.022634, -0.6331185, 0, 0.1176471, 1, 1,
0.3611937, 0.4518545, 1.362376, 0, 0.1137255, 1, 1,
0.3656947, 0.104557, 2.186816, 0, 0.1058824, 1, 1,
0.3667549, 0.9495623, -0.6826116, 0, 0.09803922, 1, 1,
0.368168, -0.0304077, 3.769988, 0, 0.09411765, 1, 1,
0.3718352, -0.3676194, 0.9062241, 0, 0.08627451, 1, 1,
0.3782383, 0.1698463, 2.538779, 0, 0.08235294, 1, 1,
0.3855729, -1.282067, 1.718995, 0, 0.07450981, 1, 1,
0.3889247, -0.5136017, 1.632554, 0, 0.07058824, 1, 1,
0.3901181, -1.223157, 2.489273, 0, 0.0627451, 1, 1,
0.3909071, 1.098723, 0.2521164, 0, 0.05882353, 1, 1,
0.3927537, -1.622963, 3.752882, 0, 0.05098039, 1, 1,
0.3928785, -1.072833, 0.6786513, 0, 0.04705882, 1, 1,
0.3950177, -1.839628, 2.078325, 0, 0.03921569, 1, 1,
0.4036265, -0.6635804, 3.580906, 0, 0.03529412, 1, 1,
0.4096271, -0.01226678, 0.6235691, 0, 0.02745098, 1, 1,
0.4135271, 0.5819398, -0.332881, 0, 0.02352941, 1, 1,
0.416038, -0.3545412, 2.012458, 0, 0.01568628, 1, 1,
0.4165565, -0.1974362, 1.885687, 0, 0.01176471, 1, 1,
0.4231868, 0.4043854, 2.01109, 0, 0.003921569, 1, 1,
0.4244011, 0.06660122, 3.003754, 0.003921569, 0, 1, 1,
0.4248852, -0.08004248, 1.029248, 0.007843138, 0, 1, 1,
0.4265747, -0.37529, 1.916262, 0.01568628, 0, 1, 1,
0.4283027, 0.9383668, 0.1479945, 0.01960784, 0, 1, 1,
0.4381201, -0.5678207, 1.640892, 0.02745098, 0, 1, 1,
0.4402517, 0.6563641, 1.611387, 0.03137255, 0, 1, 1,
0.4424285, 0.9407643, -2.768168, 0.03921569, 0, 1, 1,
0.442951, -0.4021716, 1.107785, 0.04313726, 0, 1, 1,
0.4429523, -0.002176295, 2.704613, 0.05098039, 0, 1, 1,
0.4435375, -0.1920232, 2.791202, 0.05490196, 0, 1, 1,
0.4437744, 0.4995795, 0.5725236, 0.0627451, 0, 1, 1,
0.4443284, -1.595793, 3.644084, 0.06666667, 0, 1, 1,
0.4515599, -0.2577911, 3.144927, 0.07450981, 0, 1, 1,
0.4542086, 0.07433262, 2.998265, 0.07843138, 0, 1, 1,
0.4581562, 1.880861, -0.4424558, 0.08627451, 0, 1, 1,
0.4610085, 0.1867196, 0.3053218, 0.09019608, 0, 1, 1,
0.4613875, 0.6716823, 2.058911, 0.09803922, 0, 1, 1,
0.4627782, 0.4991482, -0.3395394, 0.1058824, 0, 1, 1,
0.4643059, -0.7798282, 2.752548, 0.1098039, 0, 1, 1,
0.4682417, 2.112617, 0.3927594, 0.1176471, 0, 1, 1,
0.4720667, -1.257545, 2.139657, 0.1215686, 0, 1, 1,
0.4743523, 1.277783, -0.09067062, 0.1294118, 0, 1, 1,
0.4808553, -0.5048481, 2.65002, 0.1333333, 0, 1, 1,
0.4894178, -0.4629797, 2.321679, 0.1411765, 0, 1, 1,
0.4902888, 1.045694, 0.8548211, 0.145098, 0, 1, 1,
0.4908791, -0.1745557, 1.376104, 0.1529412, 0, 1, 1,
0.4924131, -0.2765623, 0.70382, 0.1568628, 0, 1, 1,
0.4944282, 0.354811, -0.2061956, 0.1647059, 0, 1, 1,
0.5025486, 0.60853, 1.188693, 0.1686275, 0, 1, 1,
0.5052767, 1.021737, -2.369942, 0.1764706, 0, 1, 1,
0.5059888, -0.1179488, 2.069831, 0.1803922, 0, 1, 1,
0.5097057, -0.950835, 2.579087, 0.1882353, 0, 1, 1,
0.5102387, -0.9457918, 2.179171, 0.1921569, 0, 1, 1,
0.5123069, 0.342933, 1.34648, 0.2, 0, 1, 1,
0.5138422, -0.1676006, 4.086083, 0.2078431, 0, 1, 1,
0.5193757, -0.1350314, 1.049761, 0.2117647, 0, 1, 1,
0.519856, 0.4969176, 0.3302853, 0.2196078, 0, 1, 1,
0.5260109, 0.4448997, 2.276394, 0.2235294, 0, 1, 1,
0.5307519, 0.02920347, 1.217917, 0.2313726, 0, 1, 1,
0.5323915, 0.8655228, 0.1315194, 0.2352941, 0, 1, 1,
0.5328544, -0.7424401, 3.367638, 0.2431373, 0, 1, 1,
0.5446709, -0.8290973, 4.747818, 0.2470588, 0, 1, 1,
0.5457962, 0.4790638, 0.9802657, 0.254902, 0, 1, 1,
0.5459898, -0.1944069, 1.173295, 0.2588235, 0, 1, 1,
0.5465087, 3.069179, 0.1627849, 0.2666667, 0, 1, 1,
0.5487866, 0.6820609, 1.031263, 0.2705882, 0, 1, 1,
0.5506242, -1.382635, 4.226949, 0.2784314, 0, 1, 1,
0.5507795, -1.330593, 3.751331, 0.282353, 0, 1, 1,
0.551967, 0.6272779, 1.039777, 0.2901961, 0, 1, 1,
0.5530846, -1.502239, 3.741844, 0.2941177, 0, 1, 1,
0.5558549, 2.188123, -0.1625603, 0.3019608, 0, 1, 1,
0.5647179, 0.9372226, 1.831531, 0.3098039, 0, 1, 1,
0.5734317, 1.087175, -0.3780718, 0.3137255, 0, 1, 1,
0.5807583, 0.3725475, -0.06192077, 0.3215686, 0, 1, 1,
0.5842255, -1.132889, 2.834119, 0.3254902, 0, 1, 1,
0.5869873, -1.030517, 0.94068, 0.3333333, 0, 1, 1,
0.5899086, 2.103911, -1.04845, 0.3372549, 0, 1, 1,
0.5922191, 1.349342, 0.4094576, 0.345098, 0, 1, 1,
0.5928602, -0.05265267, 0.7097882, 0.3490196, 0, 1, 1,
0.5937961, -0.9788406, 3.441424, 0.3568628, 0, 1, 1,
0.5950955, 0.2655832, 1.874989, 0.3607843, 0, 1, 1,
0.5967801, 1.143192, -0.4733434, 0.3686275, 0, 1, 1,
0.5970652, -2.115428, 2.441675, 0.372549, 0, 1, 1,
0.6011925, -1.05678, 2.594187, 0.3803922, 0, 1, 1,
0.6063902, -0.1378491, 1.861313, 0.3843137, 0, 1, 1,
0.6145396, 2.016959, 1.018083, 0.3921569, 0, 1, 1,
0.6175981, -2.182783, 3.199166, 0.3960784, 0, 1, 1,
0.6179435, -0.2518318, 2.424462, 0.4039216, 0, 1, 1,
0.6221762, -0.6918141, 1.657098, 0.4117647, 0, 1, 1,
0.6231444, -0.8414291, 4.920247, 0.4156863, 0, 1, 1,
0.6232879, -0.6657189, 3.118853, 0.4235294, 0, 1, 1,
0.6248615, 1.411069, -0.07512431, 0.427451, 0, 1, 1,
0.6301133, -0.2724711, 2.851318, 0.4352941, 0, 1, 1,
0.6369061, -2.034472, 3.363453, 0.4392157, 0, 1, 1,
0.6383289, -1.344758, 2.221656, 0.4470588, 0, 1, 1,
0.6410596, -0.4610911, 3.770638, 0.4509804, 0, 1, 1,
0.6428751, 0.2162597, 1.295956, 0.4588235, 0, 1, 1,
0.6471546, -0.9983475, 2.944002, 0.4627451, 0, 1, 1,
0.6473871, 1.364411, 1.351166, 0.4705882, 0, 1, 1,
0.6482064, 1.04668, 0.6798344, 0.4745098, 0, 1, 1,
0.6490532, -1.34304, 1.225534, 0.4823529, 0, 1, 1,
0.653304, 0.1040141, 0.2148419, 0.4862745, 0, 1, 1,
0.6534865, -0.8026832, 0.2660496, 0.4941176, 0, 1, 1,
0.6539466, -0.7384887, 2.89229, 0.5019608, 0, 1, 1,
0.658202, -0.6233047, 2.510475, 0.5058824, 0, 1, 1,
0.6593993, 0.6092268, -0.08930799, 0.5137255, 0, 1, 1,
0.6620134, -1.173293, 3.880784, 0.5176471, 0, 1, 1,
0.6665207, 3.004178, 0.7936848, 0.5254902, 0, 1, 1,
0.6713921, 0.3033179, 0.6289608, 0.5294118, 0, 1, 1,
0.674118, 0.9775185, 1.637543, 0.5372549, 0, 1, 1,
0.6777596, 0.6417007, 1.368083, 0.5411765, 0, 1, 1,
0.6824121, -0.5063838, 0.02559008, 0.5490196, 0, 1, 1,
0.6835656, 0.1994636, 1.723434, 0.5529412, 0, 1, 1,
0.6861722, 0.8717418, -0.9048378, 0.5607843, 0, 1, 1,
0.6912345, 0.727522, 1.377282, 0.5647059, 0, 1, 1,
0.6999148, 1.771627, 0.1128276, 0.572549, 0, 1, 1,
0.7009367, 0.2542031, -0.2738619, 0.5764706, 0, 1, 1,
0.7010397, 1.485351, 1.699107, 0.5843138, 0, 1, 1,
0.7017993, 1.33385, 0.8872033, 0.5882353, 0, 1, 1,
0.704952, 0.2325651, 0.3182496, 0.5960785, 0, 1, 1,
0.7053784, 0.2877688, 2.807166, 0.6039216, 0, 1, 1,
0.7095316, 1.574652, 0.8986285, 0.6078432, 0, 1, 1,
0.7097952, 1.192039, -0.1584012, 0.6156863, 0, 1, 1,
0.7137376, -0.9028004, 1.780802, 0.6196079, 0, 1, 1,
0.7138424, -0.451566, 0.3544324, 0.627451, 0, 1, 1,
0.7141967, -0.5862271, 1.00705, 0.6313726, 0, 1, 1,
0.7147866, 1.091357, -0.2948958, 0.6392157, 0, 1, 1,
0.7227975, 1.335599, 2.159008, 0.6431373, 0, 1, 1,
0.7233123, 0.7055424, 1.673635, 0.6509804, 0, 1, 1,
0.7301021, -0.7266364, 2.875399, 0.654902, 0, 1, 1,
0.7312942, -1.63068, 0.9675829, 0.6627451, 0, 1, 1,
0.733615, 2.10519, -0.4257883, 0.6666667, 0, 1, 1,
0.7352905, -0.3494177, 2.991957, 0.6745098, 0, 1, 1,
0.7407489, -1.176813, 2.349058, 0.6784314, 0, 1, 1,
0.7425345, 1.665581, -0.1324891, 0.6862745, 0, 1, 1,
0.7433608, 0.2792053, 1.704589, 0.6901961, 0, 1, 1,
0.743929, 0.1570371, 0.6200352, 0.6980392, 0, 1, 1,
0.7467167, -0.6505425, 1.229022, 0.7058824, 0, 1, 1,
0.7564873, -0.1976249, 2.214066, 0.7098039, 0, 1, 1,
0.7608696, 0.617182, 1.81622, 0.7176471, 0, 1, 1,
0.7687842, 1.941279, 0.9677594, 0.7215686, 0, 1, 1,
0.77051, 1.0764, 0.4612898, 0.7294118, 0, 1, 1,
0.7710365, 0.2003845, 3.060803, 0.7333333, 0, 1, 1,
0.7742286, -1.568238, 2.364063, 0.7411765, 0, 1, 1,
0.774325, -1.747939, 2.175857, 0.7450981, 0, 1, 1,
0.7744493, -0.08199242, 2.152525, 0.7529412, 0, 1, 1,
0.7821977, -0.3995678, 2.546652, 0.7568628, 0, 1, 1,
0.7851995, -1.0921, 3.217266, 0.7647059, 0, 1, 1,
0.7853006, -0.211284, 1.573695, 0.7686275, 0, 1, 1,
0.7860621, 0.3541785, 0.6466853, 0.7764706, 0, 1, 1,
0.8035917, 1.467926, 1.555195, 0.7803922, 0, 1, 1,
0.8045706, 0.6357803, 0.9459185, 0.7882353, 0, 1, 1,
0.8087814, 0.003126224, 1.718985, 0.7921569, 0, 1, 1,
0.8088109, 1.748506, 0.8403417, 0.8, 0, 1, 1,
0.8111423, 1.321726, 3.800311, 0.8078431, 0, 1, 1,
0.8156645, -0.6646278, 1.108474, 0.8117647, 0, 1, 1,
0.8166183, -1.077774, 3.121409, 0.8196079, 0, 1, 1,
0.8181126, 1.415179, 3.04525, 0.8235294, 0, 1, 1,
0.8188714, 1.668929, -1.00577, 0.8313726, 0, 1, 1,
0.8231899, 1.050149, 2.070225, 0.8352941, 0, 1, 1,
0.8245149, -0.6708742, 1.743798, 0.8431373, 0, 1, 1,
0.8266093, 0.05226672, 1.652612, 0.8470588, 0, 1, 1,
0.8277732, 0.5063895, 0.9608164, 0.854902, 0, 1, 1,
0.836963, 0.3528271, 1.439298, 0.8588235, 0, 1, 1,
0.8464926, -0.3791784, 0.7615158, 0.8666667, 0, 1, 1,
0.8516113, 0.8791127, 1.242044, 0.8705882, 0, 1, 1,
0.8555074, -0.3422624, 1.543745, 0.8784314, 0, 1, 1,
0.8625923, 0.1624974, -0.6337222, 0.8823529, 0, 1, 1,
0.8681328, 0.1908529, 2.444399, 0.8901961, 0, 1, 1,
0.8714764, -0.09352609, 0.305979, 0.8941177, 0, 1, 1,
0.876063, 0.0527937, 0.1213854, 0.9019608, 0, 1, 1,
0.8819906, 1.93149, -0.04422753, 0.9098039, 0, 1, 1,
0.893079, -0.4959002, 2.070655, 0.9137255, 0, 1, 1,
0.8950454, -0.007116618, 1.505, 0.9215686, 0, 1, 1,
0.9134376, -0.7844989, 4.65198, 0.9254902, 0, 1, 1,
0.9139584, 0.9570414, 2.083172, 0.9333333, 0, 1, 1,
0.9191946, 0.1654465, 0.7864093, 0.9372549, 0, 1, 1,
0.9219121, -0.3532513, 1.944929, 0.945098, 0, 1, 1,
0.924104, -1.34785, 3.838394, 0.9490196, 0, 1, 1,
0.9297683, 0.3996646, 2.074337, 0.9568627, 0, 1, 1,
0.9384843, -0.5687292, 0.8915049, 0.9607843, 0, 1, 1,
0.9399304, -2.152695, 3.37893, 0.9686275, 0, 1, 1,
0.9435858, -0.8104176, 3.244885, 0.972549, 0, 1, 1,
0.9454616, -0.5957785, 0.4478346, 0.9803922, 0, 1, 1,
0.9485464, 2.058023, 1.091194, 0.9843137, 0, 1, 1,
0.9520712, -0.9690577, 2.886252, 0.9921569, 0, 1, 1,
0.9562958, 0.05341839, 1.506819, 0.9960784, 0, 1, 1,
0.9599888, -0.2021389, 1.116224, 1, 0, 0.9960784, 1,
0.9611389, -0.1781372, 1.817334, 1, 0, 0.9882353, 1,
0.9678749, -0.6171023, 1.015016, 1, 0, 0.9843137, 1,
0.9752307, -1.889134, 1.743223, 1, 0, 0.9764706, 1,
0.9780379, 0.03703926, 2.067002, 1, 0, 0.972549, 1,
0.9925337, -0.2522602, 1.178586, 1, 0, 0.9647059, 1,
0.9940584, -1.994847, 2.615726, 1, 0, 0.9607843, 1,
0.9988842, 0.4843204, 2.552057, 1, 0, 0.9529412, 1,
1.000176, 3.043113, -0.1786485, 1, 0, 0.9490196, 1,
1.023244, 1.186763, -0.6688097, 1, 0, 0.9411765, 1,
1.02377, 0.7728653, 1.07932, 1, 0, 0.9372549, 1,
1.0279, -0.3171085, 3.278877, 1, 0, 0.9294118, 1,
1.030064, 1.561362, 0.01076854, 1, 0, 0.9254902, 1,
1.031671, 0.641071, 0.4875755, 1, 0, 0.9176471, 1,
1.03324, 1.470193, 0.5727291, 1, 0, 0.9137255, 1,
1.034289, -1.435883, 2.004502, 1, 0, 0.9058824, 1,
1.042479, 0.984955, 0.6168792, 1, 0, 0.9019608, 1,
1.045769, -0.9778596, 2.653133, 1, 0, 0.8941177, 1,
1.047274, 0.02022965, 0.7351035, 1, 0, 0.8862745, 1,
1.051581, 1.766073, -2.443478, 1, 0, 0.8823529, 1,
1.053582, -2.029969, 1.867021, 1, 0, 0.8745098, 1,
1.055017, -0.6531727, 2.446632, 1, 0, 0.8705882, 1,
1.056137, -0.5605094, 3.679761, 1, 0, 0.8627451, 1,
1.056881, -0.2332739, 1.450182, 1, 0, 0.8588235, 1,
1.063089, -0.3430835, 1.777959, 1, 0, 0.8509804, 1,
1.064207, -2.427634, 3.012629, 1, 0, 0.8470588, 1,
1.081335, 0.1622723, 3.46529, 1, 0, 0.8392157, 1,
1.088106, 0.7039221, 1.855808, 1, 0, 0.8352941, 1,
1.088992, -0.4552032, 2.437758, 1, 0, 0.827451, 1,
1.091308, -0.5272149, 3.223425, 1, 0, 0.8235294, 1,
1.09221, 1.101149, 0.123613, 1, 0, 0.8156863, 1,
1.109563, 1.995742, 0.7218368, 1, 0, 0.8117647, 1,
1.109703, -0.2559179, 1.981572, 1, 0, 0.8039216, 1,
1.127802, -1.170623, 1.127496, 1, 0, 0.7960784, 1,
1.131573, 0.1877669, 0.09761714, 1, 0, 0.7921569, 1,
1.133404, -0.1780472, 0.1086691, 1, 0, 0.7843137, 1,
1.135753, 0.4376977, 0.1909343, 1, 0, 0.7803922, 1,
1.14165, -1.039037, 2.891726, 1, 0, 0.772549, 1,
1.144242, 0.3059386, 1.75316, 1, 0, 0.7686275, 1,
1.145328, -1.360307, 2.011262, 1, 0, 0.7607843, 1,
1.150174, 0.0005843151, 1.707664, 1, 0, 0.7568628, 1,
1.159014, 0.1649384, 1.142166, 1, 0, 0.7490196, 1,
1.162746, 0.7596152, 0.8039303, 1, 0, 0.7450981, 1,
1.164463, 0.9049309, 1.344434, 1, 0, 0.7372549, 1,
1.173321, -0.1192532, 1.662907, 1, 0, 0.7333333, 1,
1.175875, -0.7811176, 2.957251, 1, 0, 0.7254902, 1,
1.179375, 0.1559682, 1.382273, 1, 0, 0.7215686, 1,
1.179532, -0.9699016, 3.816881, 1, 0, 0.7137255, 1,
1.189914, -0.4488786, 1.452722, 1, 0, 0.7098039, 1,
1.192843, 1.239787, -0.5038076, 1, 0, 0.7019608, 1,
1.193438, 0.7585689, 0.8346344, 1, 0, 0.6941177, 1,
1.195545, 1.699159, -1.327309, 1, 0, 0.6901961, 1,
1.196392, 0.3041661, 0.6442546, 1, 0, 0.682353, 1,
1.197631, -2.12236, 1.467928, 1, 0, 0.6784314, 1,
1.200389, 0.8648731, 2.242848, 1, 0, 0.6705883, 1,
1.208511, -0.8156164, 0.988493, 1, 0, 0.6666667, 1,
1.219727, -0.7456472, 1.957108, 1, 0, 0.6588235, 1,
1.22013, 1.389066, 1.113997, 1, 0, 0.654902, 1,
1.221681, 0.4368602, 1.617401, 1, 0, 0.6470588, 1,
1.224378, 0.06380112, 1.86283, 1, 0, 0.6431373, 1,
1.23095, 0.1500293, 0.8144793, 1, 0, 0.6352941, 1,
1.234301, 0.2800349, 1.085106, 1, 0, 0.6313726, 1,
1.237103, -0.04737082, 0.4389871, 1, 0, 0.6235294, 1,
1.239179, 0.7257315, 1.549985, 1, 0, 0.6196079, 1,
1.240454, -0.3677604, 3.135567, 1, 0, 0.6117647, 1,
1.245323, -1.267782, 1.304885, 1, 0, 0.6078432, 1,
1.246428, 1.019381, 1.127864, 1, 0, 0.6, 1,
1.249298, -0.144328, 1.163881, 1, 0, 0.5921569, 1,
1.257846, 0.6640726, 2.51866, 1, 0, 0.5882353, 1,
1.265729, -0.0007999302, 0.03544158, 1, 0, 0.5803922, 1,
1.267938, -1.670414, 2.265127, 1, 0, 0.5764706, 1,
1.275079, -0.4193301, 3.140008, 1, 0, 0.5686275, 1,
1.277793, 0.9447025, 2.222519, 1, 0, 0.5647059, 1,
1.280271, -1.312119, 3.105267, 1, 0, 0.5568628, 1,
1.287595, -0.4164397, 1.073017, 1, 0, 0.5529412, 1,
1.28903, 1.449352, 1.35481, 1, 0, 0.5450981, 1,
1.292366, 1.487288, 2.443849, 1, 0, 0.5411765, 1,
1.294062, -0.4145401, 1.386633, 1, 0, 0.5333334, 1,
1.294636, 0.9390038, -0.4337284, 1, 0, 0.5294118, 1,
1.294709, 0.1350377, 1.969617, 1, 0, 0.5215687, 1,
1.32001, -1.436191, 1.84325, 1, 0, 0.5176471, 1,
1.323195, -0.07861507, 2.673371, 1, 0, 0.509804, 1,
1.3333, 1.881662, 0.8876746, 1, 0, 0.5058824, 1,
1.346699, 0.718148, 2.429211, 1, 0, 0.4980392, 1,
1.351763, -1.117358, 1.668746, 1, 0, 0.4901961, 1,
1.379205, -0.5065477, 1.873152, 1, 0, 0.4862745, 1,
1.398479, 1.72307, 1.623421, 1, 0, 0.4784314, 1,
1.401583, -0.1781628, 3.670468, 1, 0, 0.4745098, 1,
1.40377, -1.012044, 3.279055, 1, 0, 0.4666667, 1,
1.40551, 1.320958, 0.8306677, 1, 0, 0.4627451, 1,
1.406118, 0.4466421, 1.088608, 1, 0, 0.454902, 1,
1.41491, 0.6937196, 0.916234, 1, 0, 0.4509804, 1,
1.43011, 1.387154, 1.087084, 1, 0, 0.4431373, 1,
1.446696, -0.06209692, 1.356816, 1, 0, 0.4392157, 1,
1.466885, 0.2218187, 0.5848206, 1, 0, 0.4313726, 1,
1.490963, 2.72011, 1.053075, 1, 0, 0.427451, 1,
1.517994, -0.07127493, 2.556066, 1, 0, 0.4196078, 1,
1.520591, 1.419525, 0.3183266, 1, 0, 0.4156863, 1,
1.529028, 0.1340774, 2.721552, 1, 0, 0.4078431, 1,
1.531065, 1.297157, 1.87125, 1, 0, 0.4039216, 1,
1.544048, 0.4477657, 1.08385, 1, 0, 0.3960784, 1,
1.544597, 0.1526525, 0.6493858, 1, 0, 0.3882353, 1,
1.554009, -0.0006388314, 1.783885, 1, 0, 0.3843137, 1,
1.55995, -0.5701209, 2.629023, 1, 0, 0.3764706, 1,
1.568643, -0.6686832, 2.704238, 1, 0, 0.372549, 1,
1.569246, -0.2854533, 0.2992432, 1, 0, 0.3647059, 1,
1.571139, 2.082626, -0.9601826, 1, 0, 0.3607843, 1,
1.574558, 2.199179, 1.712292, 1, 0, 0.3529412, 1,
1.575703, 1.569978, 2.081904, 1, 0, 0.3490196, 1,
1.614079, 0.4918855, 1.118297, 1, 0, 0.3411765, 1,
1.623011, -2.118485, 1.837856, 1, 0, 0.3372549, 1,
1.623232, 1.175501, 1.844717, 1, 0, 0.3294118, 1,
1.624927, -0.5212917, 1.581065, 1, 0, 0.3254902, 1,
1.64081, 0.1757412, 2.097105, 1, 0, 0.3176471, 1,
1.65497, 0.3316497, 2.053775, 1, 0, 0.3137255, 1,
1.657048, -1.180689, 2.722201, 1, 0, 0.3058824, 1,
1.662102, -0.9396828, 1.13494, 1, 0, 0.2980392, 1,
1.664806, 0.7098576, -0.02345801, 1, 0, 0.2941177, 1,
1.673858, -1.111107, 2.376919, 1, 0, 0.2862745, 1,
1.694971, -1.3616, 4.558387, 1, 0, 0.282353, 1,
1.699638, -0.2617058, 2.012542, 1, 0, 0.2745098, 1,
1.70954, 0.108004, 2.477898, 1, 0, 0.2705882, 1,
1.716532, 0.3612061, 2.600284, 1, 0, 0.2627451, 1,
1.744186, -0.2053361, 1.927973, 1, 0, 0.2588235, 1,
1.744695, -0.01883011, 1.790234, 1, 0, 0.2509804, 1,
1.75152, -0.1023238, 2.142226, 1, 0, 0.2470588, 1,
1.755714, 0.3317454, 1.483966, 1, 0, 0.2392157, 1,
1.765357, -1.281286, 1.799443, 1, 0, 0.2352941, 1,
1.765369, -1.011175, 2.607974, 1, 0, 0.227451, 1,
1.770084, -0.200206, 1.501571, 1, 0, 0.2235294, 1,
1.787796, -0.8329966, 0.9507607, 1, 0, 0.2156863, 1,
1.812214, 1.644605, 0.5008638, 1, 0, 0.2117647, 1,
1.813611, 0.4859143, 0.4759074, 1, 0, 0.2039216, 1,
1.831124, -0.2233942, 1.06153, 1, 0, 0.1960784, 1,
1.844844, 0.8914217, 0.4300917, 1, 0, 0.1921569, 1,
1.846025, 0.2410847, 1.122956, 1, 0, 0.1843137, 1,
1.848027, -0.09429317, 1.265541, 1, 0, 0.1803922, 1,
1.851733, -1.878825, 3.112125, 1, 0, 0.172549, 1,
1.854355, 0.216443, 1.333912, 1, 0, 0.1686275, 1,
1.875561, -1.087841, 1.969622, 1, 0, 0.1607843, 1,
1.889892, -0.1551649, 1.117356, 1, 0, 0.1568628, 1,
1.914612, 0.2436875, 0.8814199, 1, 0, 0.1490196, 1,
1.940264, 0.4241551, 1.633264, 1, 0, 0.145098, 1,
1.968382, -0.03659384, 1.510871, 1, 0, 0.1372549, 1,
1.97717, 0.5819342, 3.078498, 1, 0, 0.1333333, 1,
2.00636, 0.8134707, 1.705678, 1, 0, 0.1254902, 1,
2.054739, -0.9167772, 1.856555, 1, 0, 0.1215686, 1,
2.069845, 0.5822554, 0.322218, 1, 0, 0.1137255, 1,
2.072774, 1.163103, 0.803637, 1, 0, 0.1098039, 1,
2.10839, 0.4606034, 1.78975, 1, 0, 0.1019608, 1,
2.118971, 0.3280796, 1.243404, 1, 0, 0.09411765, 1,
2.134022, 2.904511, 1.76359, 1, 0, 0.09019608, 1,
2.143796, -0.7082552, 2.073144, 1, 0, 0.08235294, 1,
2.219059, -1.32365, 2.768794, 1, 0, 0.07843138, 1,
2.247522, -0.5747281, 0.2075187, 1, 0, 0.07058824, 1,
2.283359, 1.121893, 1.057634, 1, 0, 0.06666667, 1,
2.287171, -2.039331, 2.304042, 1, 0, 0.05882353, 1,
2.303805, 0.8081864, 2.010569, 1, 0, 0.05490196, 1,
2.325666, 0.473338, 2.178055, 1, 0, 0.04705882, 1,
2.376047, -0.05626552, 2.49855, 1, 0, 0.04313726, 1,
2.417836, 0.05178671, 0.2278642, 1, 0, 0.03529412, 1,
2.436495, 1.247589, 1.558315, 1, 0, 0.03137255, 1,
2.455781, 2.743285, 1.660401, 1, 0, 0.02352941, 1,
2.50398, 0.0822984, 0.6932529, 1, 0, 0.01960784, 1,
2.617862, 0.6755208, 2.199141, 1, 0, 0.01176471, 1,
3.156639, 2.535838, 2.65747, 1, 0, 0.007843138, 1
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
0.1998457, -4.360847, -7.462187, 0, -0.5, 0.5, 0.5,
0.1998457, -4.360847, -7.462187, 1, -0.5, 0.5, 0.5,
0.1998457, -4.360847, -7.462187, 1, 1.5, 0.5, 0.5,
0.1998457, -4.360847, -7.462187, 0, 1.5, 0.5, 0.5
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
-3.759301, -0.1074029, -7.462187, 0, -0.5, 0.5, 0.5,
-3.759301, -0.1074029, -7.462187, 1, -0.5, 0.5, 0.5,
-3.759301, -0.1074029, -7.462187, 1, 1.5, 0.5, 0.5,
-3.759301, -0.1074029, -7.462187, 0, 1.5, 0.5, 0.5
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
-3.759301, -4.360847, -0.05570173, 0, -0.5, 0.5, 0.5,
-3.759301, -4.360847, -0.05570173, 1, -0.5, 0.5, 0.5,
-3.759301, -4.360847, -0.05570173, 1, 1.5, 0.5, 0.5,
-3.759301, -4.360847, -0.05570173, 0, 1.5, 0.5, 0.5
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
-2, -3.379283, -5.752998,
3, -3.379283, -5.752998,
-2, -3.379283, -5.752998,
-2, -3.542876, -6.037863,
-1, -3.379283, -5.752998,
-1, -3.542876, -6.037863,
0, -3.379283, -5.752998,
0, -3.542876, -6.037863,
1, -3.379283, -5.752998,
1, -3.542876, -6.037863,
2, -3.379283, -5.752998,
2, -3.542876, -6.037863,
3, -3.379283, -5.752998,
3, -3.542876, -6.037863
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
-2, -3.870064, -6.607592, 0, -0.5, 0.5, 0.5,
-2, -3.870064, -6.607592, 1, -0.5, 0.5, 0.5,
-2, -3.870064, -6.607592, 1, 1.5, 0.5, 0.5,
-2, -3.870064, -6.607592, 0, 1.5, 0.5, 0.5,
-1, -3.870064, -6.607592, 0, -0.5, 0.5, 0.5,
-1, -3.870064, -6.607592, 1, -0.5, 0.5, 0.5,
-1, -3.870064, -6.607592, 1, 1.5, 0.5, 0.5,
-1, -3.870064, -6.607592, 0, 1.5, 0.5, 0.5,
0, -3.870064, -6.607592, 0, -0.5, 0.5, 0.5,
0, -3.870064, -6.607592, 1, -0.5, 0.5, 0.5,
0, -3.870064, -6.607592, 1, 1.5, 0.5, 0.5,
0, -3.870064, -6.607592, 0, 1.5, 0.5, 0.5,
1, -3.870064, -6.607592, 0, -0.5, 0.5, 0.5,
1, -3.870064, -6.607592, 1, -0.5, 0.5, 0.5,
1, -3.870064, -6.607592, 1, 1.5, 0.5, 0.5,
1, -3.870064, -6.607592, 0, 1.5, 0.5, 0.5,
2, -3.870064, -6.607592, 0, -0.5, 0.5, 0.5,
2, -3.870064, -6.607592, 1, -0.5, 0.5, 0.5,
2, -3.870064, -6.607592, 1, 1.5, 0.5, 0.5,
2, -3.870064, -6.607592, 0, 1.5, 0.5, 0.5,
3, -3.870064, -6.607592, 0, -0.5, 0.5, 0.5,
3, -3.870064, -6.607592, 1, -0.5, 0.5, 0.5,
3, -3.870064, -6.607592, 1, 1.5, 0.5, 0.5,
3, -3.870064, -6.607592, 0, 1.5, 0.5, 0.5
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
-2.845652, -3, -5.752998,
-2.845652, 3, -5.752998,
-2.845652, -3, -5.752998,
-2.997927, -3, -6.037863,
-2.845652, -2, -5.752998,
-2.997927, -2, -6.037863,
-2.845652, -1, -5.752998,
-2.997927, -1, -6.037863,
-2.845652, 0, -5.752998,
-2.997927, 0, -6.037863,
-2.845652, 1, -5.752998,
-2.997927, 1, -6.037863,
-2.845652, 2, -5.752998,
-2.997927, 2, -6.037863,
-2.845652, 3, -5.752998,
-2.997927, 3, -6.037863
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
-3.302476, -3, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, -3, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, -3, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, -3, -6.607592, 0, 1.5, 0.5, 0.5,
-3.302476, -2, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, -2, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, -2, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, -2, -6.607592, 0, 1.5, 0.5, 0.5,
-3.302476, -1, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, -1, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, -1, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, -1, -6.607592, 0, 1.5, 0.5, 0.5,
-3.302476, 0, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, 0, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, 0, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, 0, -6.607592, 0, 1.5, 0.5, 0.5,
-3.302476, 1, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, 1, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, 1, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, 1, -6.607592, 0, 1.5, 0.5, 0.5,
-3.302476, 2, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, 2, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, 2, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, 2, -6.607592, 0, 1.5, 0.5, 0.5,
-3.302476, 3, -6.607592, 0, -0.5, 0.5, 0.5,
-3.302476, 3, -6.607592, 1, -0.5, 0.5, 0.5,
-3.302476, 3, -6.607592, 1, 1.5, 0.5, 0.5,
-3.302476, 3, -6.607592, 0, 1.5, 0.5, 0.5
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
-2.845652, -3.379283, -4,
-2.845652, -3.379283, 4,
-2.845652, -3.379283, -4,
-2.997927, -3.542876, -4,
-2.845652, -3.379283, -2,
-2.997927, -3.542876, -2,
-2.845652, -3.379283, 0,
-2.997927, -3.542876, 0,
-2.845652, -3.379283, 2,
-2.997927, -3.542876, 2,
-2.845652, -3.379283, 4,
-2.997927, -3.542876, 4
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
-3.302476, -3.870064, -4, 0, -0.5, 0.5, 0.5,
-3.302476, -3.870064, -4, 1, -0.5, 0.5, 0.5,
-3.302476, -3.870064, -4, 1, 1.5, 0.5, 0.5,
-3.302476, -3.870064, -4, 0, 1.5, 0.5, 0.5,
-3.302476, -3.870064, -2, 0, -0.5, 0.5, 0.5,
-3.302476, -3.870064, -2, 1, -0.5, 0.5, 0.5,
-3.302476, -3.870064, -2, 1, 1.5, 0.5, 0.5,
-3.302476, -3.870064, -2, 0, 1.5, 0.5, 0.5,
-3.302476, -3.870064, 0, 0, -0.5, 0.5, 0.5,
-3.302476, -3.870064, 0, 1, -0.5, 0.5, 0.5,
-3.302476, -3.870064, 0, 1, 1.5, 0.5, 0.5,
-3.302476, -3.870064, 0, 0, 1.5, 0.5, 0.5,
-3.302476, -3.870064, 2, 0, -0.5, 0.5, 0.5,
-3.302476, -3.870064, 2, 1, -0.5, 0.5, 0.5,
-3.302476, -3.870064, 2, 1, 1.5, 0.5, 0.5,
-3.302476, -3.870064, 2, 0, 1.5, 0.5, 0.5,
-3.302476, -3.870064, 4, 0, -0.5, 0.5, 0.5,
-3.302476, -3.870064, 4, 1, -0.5, 0.5, 0.5,
-3.302476, -3.870064, 4, 1, 1.5, 0.5, 0.5,
-3.302476, -3.870064, 4, 0, 1.5, 0.5, 0.5
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
-2.845652, -3.379283, -5.752998,
-2.845652, 3.164477, -5.752998,
-2.845652, -3.379283, 5.641594,
-2.845652, 3.164477, 5.641594,
-2.845652, -3.379283, -5.752998,
-2.845652, -3.379283, 5.641594,
-2.845652, 3.164477, -5.752998,
-2.845652, 3.164477, 5.641594,
-2.845652, -3.379283, -5.752998,
3.245343, -3.379283, -5.752998,
-2.845652, -3.379283, 5.641594,
3.245343, -3.379283, 5.641594,
-2.845652, 3.164477, -5.752998,
3.245343, 3.164477, -5.752998,
-2.845652, 3.164477, 5.641594,
3.245343, 3.164477, 5.641594,
3.245343, -3.379283, -5.752998,
3.245343, 3.164477, -5.752998,
3.245343, -3.379283, 5.641594,
3.245343, 3.164477, 5.641594,
3.245343, -3.379283, -5.752998,
3.245343, -3.379283, 5.641594,
3.245343, 3.164477, -5.752998,
3.245343, 3.164477, 5.641594
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
var radius = 7.733649;
var distance = 34.40788;
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
mvMatrix.translate( -0.1998457, 0.1074029, 0.05570173 );
mvMatrix.scale( 1.372809, 1.277824, 0.7338369 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40788);
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
Triphenyltin_hydroxi<-read.table("Triphenyltin_hydroxi.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Triphenyltin_hydroxi$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triphenyltin_hydroxi' not found
```

```r
y<-Triphenyltin_hydroxi$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triphenyltin_hydroxi' not found
```

```r
z<-Triphenyltin_hydroxi$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triphenyltin_hydroxi' not found
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
-2.756948, 0.3214619, 0.4833429, 0, 0, 1, 1, 1,
-2.689342, -0.04220644, -0.7349371, 1, 0, 0, 1, 1,
-2.647705, -0.4250503, -2.526727, 1, 0, 0, 1, 1,
-2.643492, -0.8937121, -1.276592, 1, 0, 0, 1, 1,
-2.62253, 1.483981, 0.450548, 1, 0, 0, 1, 1,
-2.572873, -0.2238104, -3.093758, 1, 0, 0, 1, 1,
-2.536731, -0.5995587, -2.374362, 0, 0, 0, 1, 1,
-2.528645, 1.378686, -0.3838397, 0, 0, 0, 1, 1,
-2.461628, -1.920134, -4.59828, 0, 0, 0, 1, 1,
-2.449466, 0.6566365, -1.719452, 0, 0, 0, 1, 1,
-2.405195, -0.9396059, -2.224419, 0, 0, 0, 1, 1,
-2.349406, -0.1936026, -0.5498602, 0, 0, 0, 1, 1,
-2.342052, -0.3731169, 0.1368236, 0, 0, 0, 1, 1,
-2.303638, -1.108801, -2.35744, 1, 1, 1, 1, 1,
-2.301997, -1.464136, -1.068413, 1, 1, 1, 1, 1,
-2.239299, 0.05103884, -0.3661631, 1, 1, 1, 1, 1,
-2.162818, -0.2018882, -0.3538993, 1, 1, 1, 1, 1,
-2.116491, -0.859047, -0.9231577, 1, 1, 1, 1, 1,
-2.08312, -0.9061598, -3.409557, 1, 1, 1, 1, 1,
-2.073913, 1.13389, -2.285922, 1, 1, 1, 1, 1,
-2.060233, -0.731645, -2.629922, 1, 1, 1, 1, 1,
-2.048929, 0.3084952, -1.675344, 1, 1, 1, 1, 1,
-2.039617, -0.4316887, -1.053537, 1, 1, 1, 1, 1,
-2.03141, 0.4853165, -0.4415649, 1, 1, 1, 1, 1,
-1.992704, 0.4469865, -1.311815, 1, 1, 1, 1, 1,
-1.962641, 0.735344, -2.035387, 1, 1, 1, 1, 1,
-1.956525, -0.8048515, -3.219041, 1, 1, 1, 1, 1,
-1.936332, -0.1244367, -2.204933, 1, 1, 1, 1, 1,
-1.930841, -1.0031, -2.488302, 0, 0, 1, 1, 1,
-1.920281, -0.5039078, -2.184467, 1, 0, 0, 1, 1,
-1.918058, 0.1328949, -3.062436, 1, 0, 0, 1, 1,
-1.896025, -1.53974, -3.083688, 1, 0, 0, 1, 1,
-1.891897, 1.085409, 0.5560001, 1, 0, 0, 1, 1,
-1.888196, 2.251974, 0.1707634, 1, 0, 0, 1, 1,
-1.863811, -0.8043137, -1.118647, 0, 0, 0, 1, 1,
-1.839614, -0.1051332, -1.856152, 0, 0, 0, 1, 1,
-1.837853, -0.3254924, -1.67226, 0, 0, 0, 1, 1,
-1.816124, 0.2877361, -2.043406, 0, 0, 0, 1, 1,
-1.810994, -0.7630638, -4.366136, 0, 0, 0, 1, 1,
-1.789038, -1.00849, -0.8836364, 0, 0, 0, 1, 1,
-1.779888, 0.01025806, -0.7286664, 0, 0, 0, 1, 1,
-1.776779, 0.9913424, -0.003668471, 1, 1, 1, 1, 1,
-1.755325, 0.1485295, -2.006502, 1, 1, 1, 1, 1,
-1.751771, 0.3485701, -1.890817, 1, 1, 1, 1, 1,
-1.748587, 1.790497, -1.860871, 1, 1, 1, 1, 1,
-1.732721, -0.4979398, -2.341448, 1, 1, 1, 1, 1,
-1.714363, -0.8878683, -2.069708, 1, 1, 1, 1, 1,
-1.705793, 0.2778957, -0.998813, 1, 1, 1, 1, 1,
-1.699583, 1.309778, -1.165294, 1, 1, 1, 1, 1,
-1.670871, 0.9586508, -1.451493, 1, 1, 1, 1, 1,
-1.662029, -0.6415136, -3.681948, 1, 1, 1, 1, 1,
-1.660621, 0.6926176, -1.340821, 1, 1, 1, 1, 1,
-1.65464, -1.230946, -1.388894, 1, 1, 1, 1, 1,
-1.6381, -1.557523, -1.955175, 1, 1, 1, 1, 1,
-1.615252, 0.7380698, 0.1174889, 1, 1, 1, 1, 1,
-1.59226, -1.286948, -1.73916, 1, 1, 1, 1, 1,
-1.592093, -0.2799589, -1.335216, 0, 0, 1, 1, 1,
-1.582645, -0.1506399, -1.127169, 1, 0, 0, 1, 1,
-1.578261, -1.599586, -0.3859844, 1, 0, 0, 1, 1,
-1.576761, 2.180855, 0.7853279, 1, 0, 0, 1, 1,
-1.553571, 1.376223, -1.805726, 1, 0, 0, 1, 1,
-1.541283, 0.03930128, -1.545811, 1, 0, 0, 1, 1,
-1.540577, 1.255488, -3.099062, 0, 0, 0, 1, 1,
-1.538656, 0.03277745, -1.411569, 0, 0, 0, 1, 1,
-1.528896, 1.569227, 0.04660331, 0, 0, 0, 1, 1,
-1.527631, 0.482536, -1.658091, 0, 0, 0, 1, 1,
-1.51801, -0.1549579, -1.432456, 0, 0, 0, 1, 1,
-1.480399, -1.510308, -1.95804, 0, 0, 0, 1, 1,
-1.476686, -0.7202442, -0.7850574, 0, 0, 0, 1, 1,
-1.475136, -0.1123994, -3.227287, 1, 1, 1, 1, 1,
-1.470084, 0.2107092, -1.304859, 1, 1, 1, 1, 1,
-1.469693, 0.9076073, -1.761996, 1, 1, 1, 1, 1,
-1.461121, 1.031374, 0.01506499, 1, 1, 1, 1, 1,
-1.449773, 0.3949104, -2.049569, 1, 1, 1, 1, 1,
-1.440483, 2.757243, 0.06163208, 1, 1, 1, 1, 1,
-1.42936, 1.197817, -1.103671, 1, 1, 1, 1, 1,
-1.385113, 1.16497, -0.8564275, 1, 1, 1, 1, 1,
-1.37966, 1.162061, -0.4702755, 1, 1, 1, 1, 1,
-1.373128, -1.020444, -2.390851, 1, 1, 1, 1, 1,
-1.369275, -0.5472131, -2.489879, 1, 1, 1, 1, 1,
-1.365004, -0.3438341, -2.484802, 1, 1, 1, 1, 1,
-1.360903, 1.016436, -1.284599, 1, 1, 1, 1, 1,
-1.359796, -0.6364719, -2.24543, 1, 1, 1, 1, 1,
-1.354198, 0.3758712, -0.666342, 1, 1, 1, 1, 1,
-1.351007, -1.660197, -2.211243, 0, 0, 1, 1, 1,
-1.349741, 0.1638052, 0.06802386, 1, 0, 0, 1, 1,
-1.341032, -1.03021, -2.457892, 1, 0, 0, 1, 1,
-1.324973, -1.290805, -3.546575, 1, 0, 0, 1, 1,
-1.323053, 0.3025227, -1.253503, 1, 0, 0, 1, 1,
-1.320582, -1.341425, -3.521251, 1, 0, 0, 1, 1,
-1.316432, -0.7768205, -3.954539, 0, 0, 0, 1, 1,
-1.315383, 1.910026, -1.550172, 0, 0, 0, 1, 1,
-1.315036, 0.03670384, -0.1772459, 0, 0, 0, 1, 1,
-1.309126, -1.704328, -2.34554, 0, 0, 0, 1, 1,
-1.298535, 2.95829, 0.4457608, 0, 0, 0, 1, 1,
-1.29588, 0.4986599, -0.4505226, 0, 0, 0, 1, 1,
-1.282348, 1.367694, -2.277744, 0, 0, 0, 1, 1,
-1.277134, -0.2170384, -0.5190223, 1, 1, 1, 1, 1,
-1.273947, 0.8151057, -1.393826, 1, 1, 1, 1, 1,
-1.266694, 0.402977, -1.794942, 1, 1, 1, 1, 1,
-1.26133, -0.03507122, -1.058142, 1, 1, 1, 1, 1,
-1.254716, 0.6134197, -1.226949, 1, 1, 1, 1, 1,
-1.250137, 1.303074, 0.1681546, 1, 1, 1, 1, 1,
-1.24938, 0.1578723, -1.550776, 1, 1, 1, 1, 1,
-1.246739, -0.6325198, -1.535632, 1, 1, 1, 1, 1,
-1.241238, 0.1551743, -0.6135306, 1, 1, 1, 1, 1,
-1.241191, 1.812098, -0.4090264, 1, 1, 1, 1, 1,
-1.234873, 0.729682, -2.068106, 1, 1, 1, 1, 1,
-1.230187, 1.236028, -0.3734224, 1, 1, 1, 1, 1,
-1.226845, -1.077618, -2.370347, 1, 1, 1, 1, 1,
-1.203967, -0.4143034, -2.029058, 1, 1, 1, 1, 1,
-1.201835, 0.0214794, -0.1373988, 1, 1, 1, 1, 1,
-1.200776, 0.1824502, -1.510202, 0, 0, 1, 1, 1,
-1.199396, -0.814113, -1.594479, 1, 0, 0, 1, 1,
-1.193887, -0.0463161, -2.825624, 1, 0, 0, 1, 1,
-1.188545, 1.341458, -1.445822, 1, 0, 0, 1, 1,
-1.177263, -1.971756, -2.301452, 1, 0, 0, 1, 1,
-1.174124, -0.8218547, -3.289754, 1, 0, 0, 1, 1,
-1.165804, -0.9865234, -2.447538, 0, 0, 0, 1, 1,
-1.16568, -0.7924169, -3.380903, 0, 0, 0, 1, 1,
-1.162433, 0.1981938, -0.1354291, 0, 0, 0, 1, 1,
-1.160581, -1.056762, -2.332168, 0, 0, 0, 1, 1,
-1.151643, -1.812695, -1.622662, 0, 0, 0, 1, 1,
-1.14219, 1.47131, -2.858167, 0, 0, 0, 1, 1,
-1.138378, 0.4919556, -1.926994, 0, 0, 0, 1, 1,
-1.136026, -1.00562, -2.858855, 1, 1, 1, 1, 1,
-1.13595, 0.4234487, -1.02142, 1, 1, 1, 1, 1,
-1.135918, -0.4649844, -2.665555, 1, 1, 1, 1, 1,
-1.132605, -1.951443, -3.426257, 1, 1, 1, 1, 1,
-1.127784, -2.40692, -3.500117, 1, 1, 1, 1, 1,
-1.119588, -0.1200613, -1.386668, 1, 1, 1, 1, 1,
-1.117105, 1.353406, -2.282933, 1, 1, 1, 1, 1,
-1.114264, -0.6770768, -2.01932, 1, 1, 1, 1, 1,
-1.10855, 0.04971635, -2.003335, 1, 1, 1, 1, 1,
-1.106586, 0.7893129, -0.7352269, 1, 1, 1, 1, 1,
-1.10325, 0.2211061, -2.056391, 1, 1, 1, 1, 1,
-1.101663, 1.016097, -0.8361968, 1, 1, 1, 1, 1,
-1.094971, -0.9314943, -1.942748, 1, 1, 1, 1, 1,
-1.090598, 0.2583377, -2.232696, 1, 1, 1, 1, 1,
-1.084183, 0.3679305, -2.191355, 1, 1, 1, 1, 1,
-1.079381, -0.906616, -1.115614, 0, 0, 1, 1, 1,
-1.074803, 1.131096, -2.882041, 1, 0, 0, 1, 1,
-1.066705, 0.2838321, 0.208582, 1, 0, 0, 1, 1,
-1.05736, 0.8288645, -1.126534, 1, 0, 0, 1, 1,
-1.050885, -2.539958, -2.151584, 1, 0, 0, 1, 1,
-1.050723, -0.4438352, -2.173775, 1, 0, 0, 1, 1,
-1.04459, 0.4644184, -0.7217911, 0, 0, 0, 1, 1,
-1.043302, -0.5427805, -2.139351, 0, 0, 0, 1, 1,
-1.032037, 0.540223, -1.708972, 0, 0, 0, 1, 1,
-1.028944, 0.6909597, -0.7279895, 0, 0, 0, 1, 1,
-1.018992, 0.880606, -0.6277391, 0, 0, 0, 1, 1,
-1.015671, -0.8905625, -2.26444, 0, 0, 0, 1, 1,
-1.013333, -0.6068425, -1.461883, 0, 0, 0, 1, 1,
-1.012777, 0.6894768, -1.627348, 1, 1, 1, 1, 1,
-1.011928, -0.4594994, -3.543988, 1, 1, 1, 1, 1,
-1.009237, 1.824021, 0.2456081, 1, 1, 1, 1, 1,
-1.008168, 0.4353887, -1.978982, 1, 1, 1, 1, 1,
-1.00056, 0.4229808, -0.5839288, 1, 1, 1, 1, 1,
-1.000066, 1.224279, 0.7054669, 1, 1, 1, 1, 1,
-0.9991203, -0.8650739, -1.857804, 1, 1, 1, 1, 1,
-0.9951884, -1.290436, -4.049289, 1, 1, 1, 1, 1,
-0.9840407, 1.311646, -0.4675416, 1, 1, 1, 1, 1,
-0.9777273, -0.950253, -1.102473, 1, 1, 1, 1, 1,
-0.9761603, -1.163872, -1.484466, 1, 1, 1, 1, 1,
-0.9649535, 0.3498548, -1.588386, 1, 1, 1, 1, 1,
-0.9564991, -0.04034068, -2.117851, 1, 1, 1, 1, 1,
-0.9474123, 1.466215, 0.2145274, 1, 1, 1, 1, 1,
-0.9458627, -1.135202, -2.268041, 1, 1, 1, 1, 1,
-0.9456883, -0.9065862, -1.862925, 0, 0, 1, 1, 1,
-0.9388134, -0.403054, -2.970762, 1, 0, 0, 1, 1,
-0.937297, -0.06283542, -1.480325, 1, 0, 0, 1, 1,
-0.9314339, 0.9901413, -1.544922, 1, 0, 0, 1, 1,
-0.9308881, -1.227217, -1.966242, 1, 0, 0, 1, 1,
-0.9307709, -1.325681, -3.113586, 1, 0, 0, 1, 1,
-0.9294235, -0.05823004, -2.788662, 0, 0, 0, 1, 1,
-0.9184481, 0.02582601, -0.1540567, 0, 0, 0, 1, 1,
-0.914562, 1.134265, -1.217816, 0, 0, 0, 1, 1,
-0.9113914, -0.3510662, -2.297987, 0, 0, 0, 1, 1,
-0.9060805, 0.283945, -0.2195363, 0, 0, 0, 1, 1,
-0.9026504, -1.094702, -2.438176, 0, 0, 0, 1, 1,
-0.9026289, -0.2845358, -1.159656, 0, 0, 0, 1, 1,
-0.900292, -1.691386, -2.741131, 1, 1, 1, 1, 1,
-0.8957968, -0.1767219, -2.665961, 1, 1, 1, 1, 1,
-0.8956046, -1.105868, -2.883775, 1, 1, 1, 1, 1,
-0.8938584, -0.01649201, -2.899084, 1, 1, 1, 1, 1,
-0.8928778, 1.950017, 1.279068, 1, 1, 1, 1, 1,
-0.8917549, -1.425431, -4.360144, 1, 1, 1, 1, 1,
-0.8894611, -0.4371068, -3.4851, 1, 1, 1, 1, 1,
-0.8748791, 0.04218559, -2.81653, 1, 1, 1, 1, 1,
-0.8705506, 0.2309543, -2.240262, 1, 1, 1, 1, 1,
-0.8699049, 0.1382101, -1.497255, 1, 1, 1, 1, 1,
-0.8691607, 1.368413, -4.481313, 1, 1, 1, 1, 1,
-0.8687286, -1.025286, -2.307167, 1, 1, 1, 1, 1,
-0.8652088, 0.5843945, 0.2023485, 1, 1, 1, 1, 1,
-0.8558376, 0.04375274, 0.8385648, 1, 1, 1, 1, 1,
-0.8549392, -1.351918, -3.344667, 1, 1, 1, 1, 1,
-0.8542523, -0.4258306, -1.57023, 0, 0, 1, 1, 1,
-0.8524423, -0.8816695, -3.433369, 1, 0, 0, 1, 1,
-0.8418956, 1.407711, 0.7022048, 1, 0, 0, 1, 1,
-0.835084, 1.31252, -2.394122, 1, 0, 0, 1, 1,
-0.8241814, 0.03518154, -3.041603, 1, 0, 0, 1, 1,
-0.8236462, -0.07515544, -2.342004, 1, 0, 0, 1, 1,
-0.8214819, -2.240473, -2.91141, 0, 0, 0, 1, 1,
-0.8194627, 0.275651, -0.8169773, 0, 0, 0, 1, 1,
-0.8190833, -0.01481394, -1.281987, 0, 0, 0, 1, 1,
-0.8172935, -0.9641351, -1.863002, 0, 0, 0, 1, 1,
-0.8032328, 0.2441457, -0.4624058, 0, 0, 0, 1, 1,
-0.8017496, -0.1351694, -1.102636, 0, 0, 0, 1, 1,
-0.7970046, 0.6355094, -2.266599, 0, 0, 0, 1, 1,
-0.7911471, -0.5922799, -3.143797, 1, 1, 1, 1, 1,
-0.7906549, -0.5288461, -2.73079, 1, 1, 1, 1, 1,
-0.7899343, 0.3828027, -1.084568, 1, 1, 1, 1, 1,
-0.7850715, 1.311874, -1.128285, 1, 1, 1, 1, 1,
-0.7794793, -1.338984, -3.272841, 1, 1, 1, 1, 1,
-0.7734687, -1.022985, -2.979524, 1, 1, 1, 1, 1,
-0.7717526, -0.3900337, -2.854409, 1, 1, 1, 1, 1,
-0.7701684, 2.262133, 0.8143006, 1, 1, 1, 1, 1,
-0.7696024, -2.566363, -4.24205, 1, 1, 1, 1, 1,
-0.7691109, 0.3615864, -2.034605, 1, 1, 1, 1, 1,
-0.7679105, 0.1274438, -2.015807, 1, 1, 1, 1, 1,
-0.7654512, -0.03587593, -3.432945, 1, 1, 1, 1, 1,
-0.7651713, 0.2045642, -2.012365, 1, 1, 1, 1, 1,
-0.7619163, -0.6210875, -1.653294, 1, 1, 1, 1, 1,
-0.7612617, -1.217628, 0.2076818, 1, 1, 1, 1, 1,
-0.7460267, 1.405082, -0.1520603, 0, 0, 1, 1, 1,
-0.7442163, -0.2032981, -2.943233, 1, 0, 0, 1, 1,
-0.7436002, -1.02782, -3.59311, 1, 0, 0, 1, 1,
-0.7364512, 0.2725312, -0.1504724, 1, 0, 0, 1, 1,
-0.7344606, 0.05322099, -2.541766, 1, 0, 0, 1, 1,
-0.7243956, -0.9069118, -3.088675, 1, 0, 0, 1, 1,
-0.7225695, 0.262105, -1.492009, 0, 0, 0, 1, 1,
-0.7199712, 0.7807577, -0.01688714, 0, 0, 0, 1, 1,
-0.7159432, 0.4504445, -1.965294, 0, 0, 0, 1, 1,
-0.7146077, 2.287629, 0.1535181, 0, 0, 0, 1, 1,
-0.704879, -1.783568, -1.03065, 0, 0, 0, 1, 1,
-0.702114, -0.7913766, -2.10718, 0, 0, 0, 1, 1,
-0.6992232, -1.027221, -3.847661, 0, 0, 0, 1, 1,
-0.6990229, -1.700172, -2.646259, 1, 1, 1, 1, 1,
-0.698272, 0.622196, -0.08698519, 1, 1, 1, 1, 1,
-0.6951459, 1.48718, 0.3107474, 1, 1, 1, 1, 1,
-0.6920963, -0.7639989, -2.466811, 1, 1, 1, 1, 1,
-0.6907519, 0.3639136, -2.387307, 1, 1, 1, 1, 1,
-0.6877834, -0.3690202, -2.527933, 1, 1, 1, 1, 1,
-0.6874911, 1.700323, 0.3063022, 1, 1, 1, 1, 1,
-0.6841146, 0.716135, 0.3321523, 1, 1, 1, 1, 1,
-0.684093, 0.02189316, -1.014797, 1, 1, 1, 1, 1,
-0.6835188, 0.5269285, -1.917238, 1, 1, 1, 1, 1,
-0.6811318, 0.7904676, -1.176414, 1, 1, 1, 1, 1,
-0.6730459, -0.2694076, -0.7311804, 1, 1, 1, 1, 1,
-0.6702652, 0.7531893, 0.5814317, 1, 1, 1, 1, 1,
-0.668564, 0.07839103, -2.20435, 1, 1, 1, 1, 1,
-0.6685079, 0.334151, -2.953726, 1, 1, 1, 1, 1,
-0.6645642, -1.236233, -0.9449646, 0, 0, 1, 1, 1,
-0.6626676, -0.4077877, -2.419252, 1, 0, 0, 1, 1,
-0.6568912, -0.2451853, -2.412851, 1, 0, 0, 1, 1,
-0.644054, 0.2492011, -0.1454503, 1, 0, 0, 1, 1,
-0.6413743, -0.6757911, -3.476648, 1, 0, 0, 1, 1,
-0.6400688, -0.5647845, -1.699434, 1, 0, 0, 1, 1,
-0.6393741, 1.401667, 1.273564, 0, 0, 0, 1, 1,
-0.6377356, 0.4323014, -0.5266066, 0, 0, 0, 1, 1,
-0.6327153, -1.105129, -2.165143, 0, 0, 0, 1, 1,
-0.6320199, -1.251162, -2.165285, 0, 0, 0, 1, 1,
-0.6296612, -1.698646, -4.491582, 0, 0, 0, 1, 1,
-0.6288092, -1.756068, -2.84931, 0, 0, 0, 1, 1,
-0.6276156, -2.048159, -1.401397, 0, 0, 0, 1, 1,
-0.6247036, 1.002255, 1.108415, 1, 1, 1, 1, 1,
-0.6242238, -0.7544035, -2.323493, 1, 1, 1, 1, 1,
-0.6208778, -0.4682894, -2.010238, 1, 1, 1, 1, 1,
-0.6198339, -1.285848, -3.486828, 1, 1, 1, 1, 1,
-0.6188492, 0.8856076, -2.513373, 1, 1, 1, 1, 1,
-0.6181353, -0.605876, -1.419048, 1, 1, 1, 1, 1,
-0.6089259, 2.590664, -2.716825, 1, 1, 1, 1, 1,
-0.6078525, -1.016302, -2.678858, 1, 1, 1, 1, 1,
-0.607067, 0.1261307, -1.960769, 1, 1, 1, 1, 1,
-0.6055877, 0.2732874, -1.875295, 1, 1, 1, 1, 1,
-0.6039966, -0.6915391, -0.7965544, 1, 1, 1, 1, 1,
-0.6027458, -0.9596117, -5.039178, 1, 1, 1, 1, 1,
-0.6008867, -1.084634, -1.459977, 1, 1, 1, 1, 1,
-0.5994172, -0.8552918, -2.103267, 1, 1, 1, 1, 1,
-0.5957745, 0.7394553, -1.003339, 1, 1, 1, 1, 1,
-0.589214, 1.111389, -0.02836858, 0, 0, 1, 1, 1,
-0.5875784, -1.994726, -3.934101, 1, 0, 0, 1, 1,
-0.5867098, -0.03582942, -1.825029, 1, 0, 0, 1, 1,
-0.5780972, -0.3262952, -2.828957, 1, 0, 0, 1, 1,
-0.5679802, 0.7448984, -0.2771299, 1, 0, 0, 1, 1,
-0.5653536, -0.3519703, -0.006998356, 1, 0, 0, 1, 1,
-0.5630552, 0.7121459, -1.039777, 0, 0, 0, 1, 1,
-0.5583316, 1.359492, -0.6869117, 0, 0, 0, 1, 1,
-0.5517172, 0.04737829, -3.552979, 0, 0, 0, 1, 1,
-0.5416471, -0.3676713, -2.570502, 0, 0, 0, 1, 1,
-0.530995, -0.5057525, -3.216148, 0, 0, 0, 1, 1,
-0.5299889, -1.101269, -0.3778248, 0, 0, 0, 1, 1,
-0.5286603, -0.5981565, -1.061421, 0, 0, 0, 1, 1,
-0.5265545, 0.5955349, -2.359417, 1, 1, 1, 1, 1,
-0.5155953, -0.36549, -1.912062, 1, 1, 1, 1, 1,
-0.5117781, 1.765904, 1.34672, 1, 1, 1, 1, 1,
-0.5098172, -0.5614617, -3.266246, 1, 1, 1, 1, 1,
-0.5083268, 1.469518, 0.6802331, 1, 1, 1, 1, 1,
-0.5074396, 0.1091485, -1.331322, 1, 1, 1, 1, 1,
-0.5052551, 0.1704003, -0.6110455, 1, 1, 1, 1, 1,
-0.5033899, -0.2436907, -1.189941, 1, 1, 1, 1, 1,
-0.5007787, -1.279111, -1.36561, 1, 1, 1, 1, 1,
-0.4991981, -1.53299, -4.638773, 1, 1, 1, 1, 1,
-0.4982161, 0.1780892, -1.686872, 1, 1, 1, 1, 1,
-0.4956058, -0.4471335, -2.79527, 1, 1, 1, 1, 1,
-0.494575, -1.113163, -0.8134287, 1, 1, 1, 1, 1,
-0.4944803, 0.5893989, -1.424694, 1, 1, 1, 1, 1,
-0.4911956, 0.3706677, 1.936658, 1, 1, 1, 1, 1,
-0.4885893, 0.7389849, 0.1738795, 0, 0, 1, 1, 1,
-0.4879851, 0.754346, -1.177378, 1, 0, 0, 1, 1,
-0.4859431, -0.2480478, -4.139833, 1, 0, 0, 1, 1,
-0.4780856, 0.9531589, 1.436373, 1, 0, 0, 1, 1,
-0.4744846, -1.186926, -2.467063, 1, 0, 0, 1, 1,
-0.4676071, 0.554775, -1.140537, 1, 0, 0, 1, 1,
-0.4665534, -1.215816, -2.589652, 0, 0, 0, 1, 1,
-0.4658953, -0.2729713, -1.400781, 0, 0, 0, 1, 1,
-0.4638352, -1.576642, -4.223886, 0, 0, 0, 1, 1,
-0.4637918, -0.08317497, -0.02595055, 0, 0, 0, 1, 1,
-0.4629521, 1.00577, 1.567088, 0, 0, 0, 1, 1,
-0.4625821, 2.020396, -0.3637047, 0, 0, 0, 1, 1,
-0.4594013, 0.02439974, -3.373022, 0, 0, 0, 1, 1,
-0.4543398, -0.2194245, -3.315166, 1, 1, 1, 1, 1,
-0.4525222, -0.2915797, -2.35656, 1, 1, 1, 1, 1,
-0.4496365, 1.153486, -0.6988186, 1, 1, 1, 1, 1,
-0.4456961, 0.5353864, -1.402691, 1, 1, 1, 1, 1,
-0.4451323, -0.5429184, -3.918792, 1, 1, 1, 1, 1,
-0.4442698, -0.253639, -0.9845852, 1, 1, 1, 1, 1,
-0.4429178, -2.024095, -4.180045, 1, 1, 1, 1, 1,
-0.4425035, -0.980142, -0.950712, 1, 1, 1, 1, 1,
-0.4418516, -0.6307235, -2.232138, 1, 1, 1, 1, 1,
-0.4409297, -0.6530653, -1.268177, 1, 1, 1, 1, 1,
-0.4386523, 0.6939642, -0.5744995, 1, 1, 1, 1, 1,
-0.4383477, -0.2746595, -0.5202469, 1, 1, 1, 1, 1,
-0.434819, -0.9102361, 0.9263677, 1, 1, 1, 1, 1,
-0.4312875, -0.4961756, -4.336027, 1, 1, 1, 1, 1,
-0.4300982, 2.498941, 1.176364, 1, 1, 1, 1, 1,
-0.4265215, 0.1720617, -1.761588, 0, 0, 1, 1, 1,
-0.424138, -0.2429094, -2.692033, 1, 0, 0, 1, 1,
-0.4238901, 0.171302, 0.553916, 1, 0, 0, 1, 1,
-0.4214724, -0.5156101, -1.56987, 1, 0, 0, 1, 1,
-0.4099613, -0.7827612, -2.086908, 1, 0, 0, 1, 1,
-0.405927, -3.283985, -3.771754, 1, 0, 0, 1, 1,
-0.40034, 1.528685, 0.6599708, 0, 0, 0, 1, 1,
-0.3990662, -0.608831, -1.563637, 0, 0, 0, 1, 1,
-0.3967755, -0.1541974, -1.481275, 0, 0, 0, 1, 1,
-0.3902969, -0.0552977, -2.413998, 0, 0, 0, 1, 1,
-0.3890051, 0.3756412, -0.3778831, 0, 0, 0, 1, 1,
-0.3872409, -1.173595, -2.863472, 0, 0, 0, 1, 1,
-0.387003, -0.7661548, -1.788731, 0, 0, 0, 1, 1,
-0.3731088, -0.3179026, -1.64413, 1, 1, 1, 1, 1,
-0.3728655, 0.129172, -1.846308, 1, 1, 1, 1, 1,
-0.3701318, 0.003188472, -0.7245205, 1, 1, 1, 1, 1,
-0.3701272, 0.6578016, -2.593734, 1, 1, 1, 1, 1,
-0.3690873, 0.6647061, -1.06854, 1, 1, 1, 1, 1,
-0.3680011, 1.118613, 0.804689, 1, 1, 1, 1, 1,
-0.3677602, 0.4867209, 0.1491232, 1, 1, 1, 1, 1,
-0.3613098, 2.017633, 0.8452485, 1, 1, 1, 1, 1,
-0.3608086, 1.769088, 0.04675026, 1, 1, 1, 1, 1,
-0.3604737, 0.2811185, -1.542031, 1, 1, 1, 1, 1,
-0.3604335, -0.1086414, -1.468317, 1, 1, 1, 1, 1,
-0.3587861, 0.1587807, -1.817656, 1, 1, 1, 1, 1,
-0.3576252, 0.4230899, -1.088831, 1, 1, 1, 1, 1,
-0.3534932, 0.7427071, -0.9311785, 1, 1, 1, 1, 1,
-0.3480296, 0.8956382, -0.4266259, 1, 1, 1, 1, 1,
-0.3446183, 0.5889637, -0.8727135, 0, 0, 1, 1, 1,
-0.3399961, -0.5424435, -2.353253, 1, 0, 0, 1, 1,
-0.3373417, 1.389703, -0.7732287, 1, 0, 0, 1, 1,
-0.3362132, -0.04342291, -1.803716, 1, 0, 0, 1, 1,
-0.3314918, -0.6969841, -2.565341, 1, 0, 0, 1, 1,
-0.3288415, 0.4188547, -0.699637, 1, 0, 0, 1, 1,
-0.3248909, 1.266316, 0.04218299, 0, 0, 0, 1, 1,
-0.3166645, -2.500935, -4.004265, 0, 0, 0, 1, 1,
-0.31497, 1.007411, 0.2125939, 0, 0, 0, 1, 1,
-0.3127565, 0.2371727, -1.066748, 0, 0, 0, 1, 1,
-0.312082, 0.9477372, -1.06429, 0, 0, 0, 1, 1,
-0.3117348, 1.17116, -0.7683334, 0, 0, 0, 1, 1,
-0.3108452, 1.133871, -2.896595, 0, 0, 0, 1, 1,
-0.3082613, -0.5906707, 0.4224487, 1, 1, 1, 1, 1,
-0.3047362, 0.6454025, -2.473036, 1, 1, 1, 1, 1,
-0.3018341, -0.3290435, -1.120986, 1, 1, 1, 1, 1,
-0.2946449, 1.803278, 0.03601343, 1, 1, 1, 1, 1,
-0.2930553, 0.3800138, -1.577748, 1, 1, 1, 1, 1,
-0.2851851, 0.6205496, -1.467014, 1, 1, 1, 1, 1,
-0.2805464, 0.1443554, -1.890677, 1, 1, 1, 1, 1,
-0.2798414, -0.3674517, -3.48201, 1, 1, 1, 1, 1,
-0.2787558, -0.08394721, -1.686502, 1, 1, 1, 1, 1,
-0.2768109, 0.7708591, 0.3222235, 1, 1, 1, 1, 1,
-0.2741648, -0.4796476, -3.795309, 1, 1, 1, 1, 1,
-0.2738063, 0.326961, -0.6216434, 1, 1, 1, 1, 1,
-0.2716665, -0.8788803, -2.525203, 1, 1, 1, 1, 1,
-0.2706305, -2.099531, -3.120707, 1, 1, 1, 1, 1,
-0.2624882, -0.03089913, -1.346454, 1, 1, 1, 1, 1,
-0.2611989, -0.2768002, -1.640958, 0, 0, 1, 1, 1,
-0.2547121, -0.6966496, -4.821331, 1, 0, 0, 1, 1,
-0.2520838, 0.3481844, -1.484536, 1, 0, 0, 1, 1,
-0.2490627, 0.7411686, -2.655445, 1, 0, 0, 1, 1,
-0.2481508, -1.187491, -3.124547, 1, 0, 0, 1, 1,
-0.2412345, -2.192135, -3.316412, 1, 0, 0, 1, 1,
-0.2410756, -1.089651, -3.797236, 0, 0, 0, 1, 1,
-0.2397961, -0.3014725, -2.972127, 0, 0, 0, 1, 1,
-0.2360366, 0.1327501, -1.254241, 0, 0, 0, 1, 1,
-0.2301152, -0.8522131, -3.598652, 0, 0, 0, 1, 1,
-0.2272422, 0.4978003, 1.288599, 0, 0, 0, 1, 1,
-0.2259656, -0.6395019, -1.909308, 0, 0, 0, 1, 1,
-0.2228383, 0.6947626, -1.292704, 0, 0, 0, 1, 1,
-0.2203268, -0.3674384, -4.907536, 1, 1, 1, 1, 1,
-0.2193571, -0.03053506, -1.9279, 1, 1, 1, 1, 1,
-0.2148213, -0.5952643, -2.949147, 1, 1, 1, 1, 1,
-0.2134495, -0.4545374, -1.13811, 1, 1, 1, 1, 1,
-0.211054, -0.7728848, -2.054786, 1, 1, 1, 1, 1,
-0.2104658, 1.382654, -0.6851946, 1, 1, 1, 1, 1,
-0.2084763, -1.812702, -4.60425, 1, 1, 1, 1, 1,
-0.2067361, 0.2889346, 0.3001241, 1, 1, 1, 1, 1,
-0.2019461, 0.5939909, 0.4027056, 1, 1, 1, 1, 1,
-0.1969565, 2.280153, -1.73837, 1, 1, 1, 1, 1,
-0.1947392, -1.479673, -3.849241, 1, 1, 1, 1, 1,
-0.1865929, -0.2973119, -1.185843, 1, 1, 1, 1, 1,
-0.179861, 0.6744344, -0.8237288, 1, 1, 1, 1, 1,
-0.1796921, -1.091773, -1.642049, 1, 1, 1, 1, 1,
-0.1789661, -0.4556487, -2.015, 1, 1, 1, 1, 1,
-0.1789219, -1.36809, -3.048699, 0, 0, 1, 1, 1,
-0.1785423, 0.5849182, -1.713559, 1, 0, 0, 1, 1,
-0.177913, -0.1468801, -1.875401, 1, 0, 0, 1, 1,
-0.176139, 0.05085761, -1.533046, 1, 0, 0, 1, 1,
-0.1758238, -0.4881092, -1.955307, 1, 0, 0, 1, 1,
-0.1743721, -0.9561355, -2.221669, 1, 0, 0, 1, 1,
-0.167038, -0.5818675, -3.61789, 0, 0, 0, 1, 1,
-0.1649448, -1.830322, -2.88461, 0, 0, 0, 1, 1,
-0.1626566, -1.084881, -3.73054, 0, 0, 0, 1, 1,
-0.1593145, -0.7532399, -5.587057, 0, 0, 0, 1, 1,
-0.1561545, -0.06360786, -1.36927, 0, 0, 0, 1, 1,
-0.1555459, -0.04436544, -1.863797, 0, 0, 0, 1, 1,
-0.1503112, 0.9586549, -0.6130051, 0, 0, 0, 1, 1,
-0.1487394, 0.5206373, -0.9515578, 1, 1, 1, 1, 1,
-0.1377316, -1.613576, -3.13359, 1, 1, 1, 1, 1,
-0.1366284, -0.8880744, -5.321683, 1, 1, 1, 1, 1,
-0.1312199, -0.5127863, -3.994644, 1, 1, 1, 1, 1,
-0.1296389, 0.9679624, -0.9870467, 1, 1, 1, 1, 1,
-0.1292979, -1.513629, -0.9013727, 1, 1, 1, 1, 1,
-0.1284218, 1.064696, -1.756877, 1, 1, 1, 1, 1,
-0.124473, -0.002071955, -2.410145, 1, 1, 1, 1, 1,
-0.123165, 1.603638, 1.156286, 1, 1, 1, 1, 1,
-0.122582, 0.1520733, -0.1906816, 1, 1, 1, 1, 1,
-0.1209053, 0.3583829, 0.06751536, 1, 1, 1, 1, 1,
-0.1162295, 1.695309, 0.2433331, 1, 1, 1, 1, 1,
-0.1110121, 1.250692, -1.360662, 1, 1, 1, 1, 1,
-0.1092777, -1.401343, -1.602377, 1, 1, 1, 1, 1,
-0.1076551, 0.9369342, -0.6461458, 1, 1, 1, 1, 1,
-0.0976613, 2.283971, -0.7726148, 0, 0, 1, 1, 1,
-0.09072685, -0.95412, -3.392625, 1, 0, 0, 1, 1,
-0.08781188, 0.7690976, -0.3988125, 1, 0, 0, 1, 1,
-0.08050294, 0.8497152, 0.1928204, 1, 0, 0, 1, 1,
-0.07815462, -0.6165261, -2.406553, 1, 0, 0, 1, 1,
-0.07582281, -0.8247033, -2.432549, 1, 0, 0, 1, 1,
-0.0756776, 0.01522936, -1.744074, 0, 0, 0, 1, 1,
-0.07374439, -0.1835863, -2.450422, 0, 0, 0, 1, 1,
-0.07310233, 0.3056343, 0.008404128, 0, 0, 0, 1, 1,
-0.06974303, 0.09935486, -1.300946, 0, 0, 0, 1, 1,
-0.0647986, -1.510324, -3.615082, 0, 0, 0, 1, 1,
-0.06390901, -2.013237, -4.111326, 0, 0, 0, 1, 1,
-0.05976624, 1.79698, 0.03279699, 0, 0, 0, 1, 1,
-0.05860233, 1.426472, -0.6549941, 1, 1, 1, 1, 1,
-0.05565204, 0.407024, -0.513079, 1, 1, 1, 1, 1,
-0.05276613, 0.7453232, 0.03710749, 1, 1, 1, 1, 1,
-0.04551318, -0.7279328, -3.929365, 1, 1, 1, 1, 1,
-0.04323433, -0.4831787, -3.352453, 1, 1, 1, 1, 1,
-0.03902612, 0.08627626, -1.034381, 1, 1, 1, 1, 1,
-0.03850324, 0.3663863, -0.8198539, 1, 1, 1, 1, 1,
-0.03523844, 0.7146215, -1.062107, 1, 1, 1, 1, 1,
-0.03059372, 0.9855759, 1.118223, 1, 1, 1, 1, 1,
-0.0283624, 0.1635126, 0.2670022, 1, 1, 1, 1, 1,
-0.02386924, 0.290723, 0.3409009, 1, 1, 1, 1, 1,
-0.01808287, 0.9559752, 2.388463, 1, 1, 1, 1, 1,
-0.01805018, 0.530797, 1.031128, 1, 1, 1, 1, 1,
-0.0112043, -2.270175, -2.637492, 1, 1, 1, 1, 1,
-0.0101856, 0.4203105, 0.8816396, 1, 1, 1, 1, 1,
-0.009092507, -0.7707658, -2.617084, 0, 0, 1, 1, 1,
-0.008062307, 0.08775423, 0.08591826, 1, 0, 0, 1, 1,
-0.005963076, -0.919867, -3.704887, 1, 0, 0, 1, 1,
0.005997833, -0.8290846, 1.354813, 1, 0, 0, 1, 1,
0.006656635, -1.741189, 3.396976, 1, 0, 0, 1, 1,
0.008016349, 0.4507258, 0.9154174, 1, 0, 0, 1, 1,
0.008838994, 0.3138735, 1.262734, 0, 0, 0, 1, 1,
0.009768337, -0.8924762, 2.787188, 0, 0, 0, 1, 1,
0.01219036, -0.0716382, 3.652144, 0, 0, 0, 1, 1,
0.01709579, -0.05830833, 3.875912, 0, 0, 0, 1, 1,
0.01736961, -0.06871188, 2.365342, 0, 0, 0, 1, 1,
0.01984605, 0.2938053, -0.1395047, 0, 0, 0, 1, 1,
0.0212693, -0.1601021, 4.487528, 0, 0, 0, 1, 1,
0.02344728, 0.6135026, -0.168124, 1, 1, 1, 1, 1,
0.02471221, -1.056244, 3.924088, 1, 1, 1, 1, 1,
0.02697032, 0.3132332, 1.379969, 1, 1, 1, 1, 1,
0.02831784, 0.3878835, 0.6133896, 1, 1, 1, 1, 1,
0.03130988, 0.3993892, 0.4128395, 1, 1, 1, 1, 1,
0.03136693, -0.3698084, 3.279217, 1, 1, 1, 1, 1,
0.03614011, 0.9995422, -0.2308575, 1, 1, 1, 1, 1,
0.0380144, 0.04278893, 0.3408897, 1, 1, 1, 1, 1,
0.04023787, 0.4466399, 0.1016295, 1, 1, 1, 1, 1,
0.04458384, 1.053184, 1.197628, 1, 1, 1, 1, 1,
0.04761048, 0.1698178, -0.4073545, 1, 1, 1, 1, 1,
0.04805923, 0.7640792, -1.05622, 1, 1, 1, 1, 1,
0.05025499, -1.773601, 0.5521511, 1, 1, 1, 1, 1,
0.05282428, 1.839126, 1.583829, 1, 1, 1, 1, 1,
0.05387315, -0.3301004, 3.722586, 1, 1, 1, 1, 1,
0.05822017, -1.472524, 2.461085, 0, 0, 1, 1, 1,
0.05860758, 0.3423687, 0.7950392, 1, 0, 0, 1, 1,
0.06041772, -0.3259426, 4.101685, 1, 0, 0, 1, 1,
0.06256061, 0.2775659, 0.4716118, 1, 0, 0, 1, 1,
0.06257743, 0.5393058, 0.3036366, 1, 0, 0, 1, 1,
0.06502554, -0.6170265, 2.799946, 1, 0, 0, 1, 1,
0.0725566, -0.08171264, 1.074319, 0, 0, 0, 1, 1,
0.07357825, -1.003059, 3.912789, 0, 0, 0, 1, 1,
0.07358425, 0.346065, 0.3025923, 0, 0, 0, 1, 1,
0.07482348, 1.002841, -0.1692739, 0, 0, 0, 1, 1,
0.07527304, 0.05446734, 1.031405, 0, 0, 0, 1, 1,
0.0779095, -1.037564, 2.464897, 0, 0, 0, 1, 1,
0.08109734, -0.7772762, 3.197551, 0, 0, 0, 1, 1,
0.08292739, -1.489501, 2.467187, 1, 1, 1, 1, 1,
0.08310693, -1.516493, 3.280731, 1, 1, 1, 1, 1,
0.08345906, 0.1081554, 0.3791483, 1, 1, 1, 1, 1,
0.08461405, -0.71565, 4.205245, 1, 1, 1, 1, 1,
0.0863774, -0.7610265, 4.146927, 1, 1, 1, 1, 1,
0.08650987, -0.3087176, 2.789166, 1, 1, 1, 1, 1,
0.08926189, -1.324541, 3.965593, 1, 1, 1, 1, 1,
0.08983119, -0.8843529, 3.085304, 1, 1, 1, 1, 1,
0.09023853, -0.3908467, 3.842949, 1, 1, 1, 1, 1,
0.09033523, 0.1876232, 1.707301, 1, 1, 1, 1, 1,
0.09067061, 0.3081831, 0.5535835, 1, 1, 1, 1, 1,
0.09097221, -0.191341, 1.666196, 1, 1, 1, 1, 1,
0.0976899, -2.672476, 2.161956, 1, 1, 1, 1, 1,
0.1042582, -0.6538755, 3.445654, 1, 1, 1, 1, 1,
0.1093927, -0.2727828, 3.051348, 1, 1, 1, 1, 1,
0.1095386, 0.3496491, -0.06433598, 0, 0, 1, 1, 1,
0.110506, -2.022141, 2.682045, 1, 0, 0, 1, 1,
0.1146744, -0.2117883, 3.358777, 1, 0, 0, 1, 1,
0.1237316, 0.2783876, -0.07149363, 1, 0, 0, 1, 1,
0.1242883, 1.002656, -0.5686815, 1, 0, 0, 1, 1,
0.129773, -1.82148, 2.562604, 1, 0, 0, 1, 1,
0.1348109, -1.327182, 2.170146, 0, 0, 0, 1, 1,
0.1374429, -0.5157362, 1.391374, 0, 0, 0, 1, 1,
0.1400696, 0.6180915, 0.3824091, 0, 0, 0, 1, 1,
0.1448449, 0.6339411, -1.363623, 0, 0, 0, 1, 1,
0.1456153, -1.564868, 3.586591, 0, 0, 0, 1, 1,
0.1509715, 0.8567815, -0.4567283, 0, 0, 0, 1, 1,
0.1512723, -1.788413, 2.338591, 0, 0, 0, 1, 1,
0.1520264, -0.06674809, 1.637217, 1, 1, 1, 1, 1,
0.1549669, -0.1141067, 3.062573, 1, 1, 1, 1, 1,
0.1567079, -1.369863, 2.714737, 1, 1, 1, 1, 1,
0.157271, -1.877536, 2.489579, 1, 1, 1, 1, 1,
0.1580052, -1.717321, 3.150431, 1, 1, 1, 1, 1,
0.1599542, 1.61418, -0.6553208, 1, 1, 1, 1, 1,
0.1603552, 0.5912942, -0.5783139, 1, 1, 1, 1, 1,
0.1606015, -0.8826896, 3.372807, 1, 1, 1, 1, 1,
0.1639276, 1.372158, 0.01029787, 1, 1, 1, 1, 1,
0.1661521, 0.3486936, 0.4979778, 1, 1, 1, 1, 1,
0.1679166, -0.3331124, 2.644358, 1, 1, 1, 1, 1,
0.1683157, -0.0003268392, 1.850416, 1, 1, 1, 1, 1,
0.1702445, -0.8299156, 2.409233, 1, 1, 1, 1, 1,
0.1707805, 0.1280839, 0.2769603, 1, 1, 1, 1, 1,
0.1752558, 1.27055, -0.04839388, 1, 1, 1, 1, 1,
0.1754367, 1.940611, -0.2419315, 0, 0, 1, 1, 1,
0.1754811, 0.4872148, 0.9685424, 1, 0, 0, 1, 1,
0.1768717, -0.4287503, 1.755036, 1, 0, 0, 1, 1,
0.1790809, 0.8483436, -0.8561677, 1, 0, 0, 1, 1,
0.1803133, 0.8061647, -1.450961, 1, 0, 0, 1, 1,
0.1817272, -1.000384, 3.292849, 1, 0, 0, 1, 1,
0.1818999, 1.497519, 0.04276151, 0, 0, 0, 1, 1,
0.1826331, -0.6649474, 3.36223, 0, 0, 0, 1, 1,
0.1839986, 1.359807, -0.0604064, 0, 0, 0, 1, 1,
0.1840696, 1.027843, 0.9349677, 0, 0, 0, 1, 1,
0.1844717, -0.006133055, 1.433491, 0, 0, 0, 1, 1,
0.1857044, -0.7022129, 2.227464, 0, 0, 0, 1, 1,
0.1865069, -0.3363095, 3.141332, 0, 0, 0, 1, 1,
0.1882579, -0.426629, 2.72109, 1, 1, 1, 1, 1,
0.1902793, 0.4143024, 0.4733929, 1, 1, 1, 1, 1,
0.1924208, -0.0006792248, 0.9057426, 1, 1, 1, 1, 1,
0.1925548, -0.783025, 3.133427, 1, 1, 1, 1, 1,
0.193432, -1.354884, 1.747509, 1, 1, 1, 1, 1,
0.1938092, -1.691579, 2.569721, 1, 1, 1, 1, 1,
0.1954271, 0.649684, 2.475914, 1, 1, 1, 1, 1,
0.1957609, 0.004416937, 3.373305, 1, 1, 1, 1, 1,
0.198085, 0.6316192, 0.2767389, 1, 1, 1, 1, 1,
0.2030119, -1.19117, 4.704985, 1, 1, 1, 1, 1,
0.203957, 0.3307028, 0.8158403, 1, 1, 1, 1, 1,
0.2065256, -0.09695858, 2.288574, 1, 1, 1, 1, 1,
0.2065318, -0.941943, 3.137061, 1, 1, 1, 1, 1,
0.2066755, 0.8793671, 0.6889464, 1, 1, 1, 1, 1,
0.2100298, 0.1845985, 1.428885, 1, 1, 1, 1, 1,
0.2113944, -0.31205, 2.633098, 0, 0, 1, 1, 1,
0.2136509, 0.4083191, 0.06220161, 1, 0, 0, 1, 1,
0.2170692, 0.8511576, 0.3325567, 1, 0, 0, 1, 1,
0.2193342, -0.2132863, 2.860665, 1, 0, 0, 1, 1,
0.220455, 0.9471198, -1.155659, 1, 0, 0, 1, 1,
0.2204812, -2.491509, 4.445976, 1, 0, 0, 1, 1,
0.2206408, 1.411302, -0.5284191, 0, 0, 0, 1, 1,
0.2208432, 1.198224, 0.394362, 0, 0, 0, 1, 1,
0.2208579, -2.038262, 3.674361, 0, 0, 0, 1, 1,
0.2209039, -0.4512835, 2.628551, 0, 0, 0, 1, 1,
0.2239558, -0.4878479, 0.7772234, 0, 0, 0, 1, 1,
0.2247622, -1.1512, 5.475654, 0, 0, 0, 1, 1,
0.2268701, 0.7962553, 0.5852061, 0, 0, 0, 1, 1,
0.2288738, -1.104871, 0.736119, 1, 1, 1, 1, 1,
0.2308223, 1.914878, 0.7058774, 1, 1, 1, 1, 1,
0.2364183, 0.5975407, 1.641514, 1, 1, 1, 1, 1,
0.2382432, -0.7591389, 2.526552, 1, 1, 1, 1, 1,
0.238737, 0.7501141, 0.119788, 1, 1, 1, 1, 1,
0.2441514, 2.13205, -0.6424291, 1, 1, 1, 1, 1,
0.2450259, 0.09712586, 1.806125, 1, 1, 1, 1, 1,
0.2461638, 0.893196, 0.6362691, 1, 1, 1, 1, 1,
0.2523843, -0.4204237, 2.686944, 1, 1, 1, 1, 1,
0.2562142, -0.378161, 3.064792, 1, 1, 1, 1, 1,
0.2614432, 0.3883086, 0.7591957, 1, 1, 1, 1, 1,
0.2652141, -0.1715859, 2.210909, 1, 1, 1, 1, 1,
0.2670149, -0.1309078, 2.580671, 1, 1, 1, 1, 1,
0.2688345, -2.449492, 3.516664, 1, 1, 1, 1, 1,
0.2701996, -0.1136703, 0.7815081, 1, 1, 1, 1, 1,
0.2776394, -0.4214262, 2.440655, 0, 0, 1, 1, 1,
0.2826856, 0.248994, 1.579651, 1, 0, 0, 1, 1,
0.2827803, 1.238194, 1.053016, 1, 0, 0, 1, 1,
0.2858978, 1.789676, -1.703235, 1, 0, 0, 1, 1,
0.2863538, 0.1611985, 0.8805127, 1, 0, 0, 1, 1,
0.2877247, 0.5693114, 0.8780473, 1, 0, 0, 1, 1,
0.2883473, -0.7026569, 2.59674, 0, 0, 0, 1, 1,
0.2898258, -0.3085336, 2.731317, 0, 0, 0, 1, 1,
0.2932857, -0.7964853, 1.993203, 0, 0, 0, 1, 1,
0.3055611, -0.1321417, 2.610308, 0, 0, 0, 1, 1,
0.3056043, -1.456423, 2.661515, 0, 0, 0, 1, 1,
0.3070218, -1.267803, 3.324353, 0, 0, 0, 1, 1,
0.3086074, -0.9060922, 3.268346, 0, 0, 0, 1, 1,
0.309574, 0.8189816, 0.09984861, 1, 1, 1, 1, 1,
0.3109234, -0.3163387, 2.260867, 1, 1, 1, 1, 1,
0.3125939, 0.8477426, -0.2446723, 1, 1, 1, 1, 1,
0.3153437, -0.6212049, 3.304159, 1, 1, 1, 1, 1,
0.3171666, -0.9222587, 2.922096, 1, 1, 1, 1, 1,
0.3184269, 0.2222043, 1.924735, 1, 1, 1, 1, 1,
0.322497, 1.4648, 1.298698, 1, 1, 1, 1, 1,
0.3248267, -0.2519338, 0.4480109, 1, 1, 1, 1, 1,
0.3311099, -0.1942282, 3.115514, 1, 1, 1, 1, 1,
0.3332686, -0.4489449, 2.204779, 1, 1, 1, 1, 1,
0.3386887, -0.479369, 2.392454, 1, 1, 1, 1, 1,
0.3408073, -2.095168, 0.9985591, 1, 1, 1, 1, 1,
0.3413855, 0.2896948, 2.555609, 1, 1, 1, 1, 1,
0.3490151, 0.1834922, -0.7892594, 1, 1, 1, 1, 1,
0.3501033, 0.06149768, 2.271036, 1, 1, 1, 1, 1,
0.3536923, -2.550956, 2.678355, 0, 0, 1, 1, 1,
0.3538441, -0.06820431, 1.419711, 1, 0, 0, 1, 1,
0.3570667, 2.143541, 0.3465645, 1, 0, 0, 1, 1,
0.3609367, 1.022634, -0.6331185, 1, 0, 0, 1, 1,
0.3611937, 0.4518545, 1.362376, 1, 0, 0, 1, 1,
0.3656947, 0.104557, 2.186816, 1, 0, 0, 1, 1,
0.3667549, 0.9495623, -0.6826116, 0, 0, 0, 1, 1,
0.368168, -0.0304077, 3.769988, 0, 0, 0, 1, 1,
0.3718352, -0.3676194, 0.9062241, 0, 0, 0, 1, 1,
0.3782383, 0.1698463, 2.538779, 0, 0, 0, 1, 1,
0.3855729, -1.282067, 1.718995, 0, 0, 0, 1, 1,
0.3889247, -0.5136017, 1.632554, 0, 0, 0, 1, 1,
0.3901181, -1.223157, 2.489273, 0, 0, 0, 1, 1,
0.3909071, 1.098723, 0.2521164, 1, 1, 1, 1, 1,
0.3927537, -1.622963, 3.752882, 1, 1, 1, 1, 1,
0.3928785, -1.072833, 0.6786513, 1, 1, 1, 1, 1,
0.3950177, -1.839628, 2.078325, 1, 1, 1, 1, 1,
0.4036265, -0.6635804, 3.580906, 1, 1, 1, 1, 1,
0.4096271, -0.01226678, 0.6235691, 1, 1, 1, 1, 1,
0.4135271, 0.5819398, -0.332881, 1, 1, 1, 1, 1,
0.416038, -0.3545412, 2.012458, 1, 1, 1, 1, 1,
0.4165565, -0.1974362, 1.885687, 1, 1, 1, 1, 1,
0.4231868, 0.4043854, 2.01109, 1, 1, 1, 1, 1,
0.4244011, 0.06660122, 3.003754, 1, 1, 1, 1, 1,
0.4248852, -0.08004248, 1.029248, 1, 1, 1, 1, 1,
0.4265747, -0.37529, 1.916262, 1, 1, 1, 1, 1,
0.4283027, 0.9383668, 0.1479945, 1, 1, 1, 1, 1,
0.4381201, -0.5678207, 1.640892, 1, 1, 1, 1, 1,
0.4402517, 0.6563641, 1.611387, 0, 0, 1, 1, 1,
0.4424285, 0.9407643, -2.768168, 1, 0, 0, 1, 1,
0.442951, -0.4021716, 1.107785, 1, 0, 0, 1, 1,
0.4429523, -0.002176295, 2.704613, 1, 0, 0, 1, 1,
0.4435375, -0.1920232, 2.791202, 1, 0, 0, 1, 1,
0.4437744, 0.4995795, 0.5725236, 1, 0, 0, 1, 1,
0.4443284, -1.595793, 3.644084, 0, 0, 0, 1, 1,
0.4515599, -0.2577911, 3.144927, 0, 0, 0, 1, 1,
0.4542086, 0.07433262, 2.998265, 0, 0, 0, 1, 1,
0.4581562, 1.880861, -0.4424558, 0, 0, 0, 1, 1,
0.4610085, 0.1867196, 0.3053218, 0, 0, 0, 1, 1,
0.4613875, 0.6716823, 2.058911, 0, 0, 0, 1, 1,
0.4627782, 0.4991482, -0.3395394, 0, 0, 0, 1, 1,
0.4643059, -0.7798282, 2.752548, 1, 1, 1, 1, 1,
0.4682417, 2.112617, 0.3927594, 1, 1, 1, 1, 1,
0.4720667, -1.257545, 2.139657, 1, 1, 1, 1, 1,
0.4743523, 1.277783, -0.09067062, 1, 1, 1, 1, 1,
0.4808553, -0.5048481, 2.65002, 1, 1, 1, 1, 1,
0.4894178, -0.4629797, 2.321679, 1, 1, 1, 1, 1,
0.4902888, 1.045694, 0.8548211, 1, 1, 1, 1, 1,
0.4908791, -0.1745557, 1.376104, 1, 1, 1, 1, 1,
0.4924131, -0.2765623, 0.70382, 1, 1, 1, 1, 1,
0.4944282, 0.354811, -0.2061956, 1, 1, 1, 1, 1,
0.5025486, 0.60853, 1.188693, 1, 1, 1, 1, 1,
0.5052767, 1.021737, -2.369942, 1, 1, 1, 1, 1,
0.5059888, -0.1179488, 2.069831, 1, 1, 1, 1, 1,
0.5097057, -0.950835, 2.579087, 1, 1, 1, 1, 1,
0.5102387, -0.9457918, 2.179171, 1, 1, 1, 1, 1,
0.5123069, 0.342933, 1.34648, 0, 0, 1, 1, 1,
0.5138422, -0.1676006, 4.086083, 1, 0, 0, 1, 1,
0.5193757, -0.1350314, 1.049761, 1, 0, 0, 1, 1,
0.519856, 0.4969176, 0.3302853, 1, 0, 0, 1, 1,
0.5260109, 0.4448997, 2.276394, 1, 0, 0, 1, 1,
0.5307519, 0.02920347, 1.217917, 1, 0, 0, 1, 1,
0.5323915, 0.8655228, 0.1315194, 0, 0, 0, 1, 1,
0.5328544, -0.7424401, 3.367638, 0, 0, 0, 1, 1,
0.5446709, -0.8290973, 4.747818, 0, 0, 0, 1, 1,
0.5457962, 0.4790638, 0.9802657, 0, 0, 0, 1, 1,
0.5459898, -0.1944069, 1.173295, 0, 0, 0, 1, 1,
0.5465087, 3.069179, 0.1627849, 0, 0, 0, 1, 1,
0.5487866, 0.6820609, 1.031263, 0, 0, 0, 1, 1,
0.5506242, -1.382635, 4.226949, 1, 1, 1, 1, 1,
0.5507795, -1.330593, 3.751331, 1, 1, 1, 1, 1,
0.551967, 0.6272779, 1.039777, 1, 1, 1, 1, 1,
0.5530846, -1.502239, 3.741844, 1, 1, 1, 1, 1,
0.5558549, 2.188123, -0.1625603, 1, 1, 1, 1, 1,
0.5647179, 0.9372226, 1.831531, 1, 1, 1, 1, 1,
0.5734317, 1.087175, -0.3780718, 1, 1, 1, 1, 1,
0.5807583, 0.3725475, -0.06192077, 1, 1, 1, 1, 1,
0.5842255, -1.132889, 2.834119, 1, 1, 1, 1, 1,
0.5869873, -1.030517, 0.94068, 1, 1, 1, 1, 1,
0.5899086, 2.103911, -1.04845, 1, 1, 1, 1, 1,
0.5922191, 1.349342, 0.4094576, 1, 1, 1, 1, 1,
0.5928602, -0.05265267, 0.7097882, 1, 1, 1, 1, 1,
0.5937961, -0.9788406, 3.441424, 1, 1, 1, 1, 1,
0.5950955, 0.2655832, 1.874989, 1, 1, 1, 1, 1,
0.5967801, 1.143192, -0.4733434, 0, 0, 1, 1, 1,
0.5970652, -2.115428, 2.441675, 1, 0, 0, 1, 1,
0.6011925, -1.05678, 2.594187, 1, 0, 0, 1, 1,
0.6063902, -0.1378491, 1.861313, 1, 0, 0, 1, 1,
0.6145396, 2.016959, 1.018083, 1, 0, 0, 1, 1,
0.6175981, -2.182783, 3.199166, 1, 0, 0, 1, 1,
0.6179435, -0.2518318, 2.424462, 0, 0, 0, 1, 1,
0.6221762, -0.6918141, 1.657098, 0, 0, 0, 1, 1,
0.6231444, -0.8414291, 4.920247, 0, 0, 0, 1, 1,
0.6232879, -0.6657189, 3.118853, 0, 0, 0, 1, 1,
0.6248615, 1.411069, -0.07512431, 0, 0, 0, 1, 1,
0.6301133, -0.2724711, 2.851318, 0, 0, 0, 1, 1,
0.6369061, -2.034472, 3.363453, 0, 0, 0, 1, 1,
0.6383289, -1.344758, 2.221656, 1, 1, 1, 1, 1,
0.6410596, -0.4610911, 3.770638, 1, 1, 1, 1, 1,
0.6428751, 0.2162597, 1.295956, 1, 1, 1, 1, 1,
0.6471546, -0.9983475, 2.944002, 1, 1, 1, 1, 1,
0.6473871, 1.364411, 1.351166, 1, 1, 1, 1, 1,
0.6482064, 1.04668, 0.6798344, 1, 1, 1, 1, 1,
0.6490532, -1.34304, 1.225534, 1, 1, 1, 1, 1,
0.653304, 0.1040141, 0.2148419, 1, 1, 1, 1, 1,
0.6534865, -0.8026832, 0.2660496, 1, 1, 1, 1, 1,
0.6539466, -0.7384887, 2.89229, 1, 1, 1, 1, 1,
0.658202, -0.6233047, 2.510475, 1, 1, 1, 1, 1,
0.6593993, 0.6092268, -0.08930799, 1, 1, 1, 1, 1,
0.6620134, -1.173293, 3.880784, 1, 1, 1, 1, 1,
0.6665207, 3.004178, 0.7936848, 1, 1, 1, 1, 1,
0.6713921, 0.3033179, 0.6289608, 1, 1, 1, 1, 1,
0.674118, 0.9775185, 1.637543, 0, 0, 1, 1, 1,
0.6777596, 0.6417007, 1.368083, 1, 0, 0, 1, 1,
0.6824121, -0.5063838, 0.02559008, 1, 0, 0, 1, 1,
0.6835656, 0.1994636, 1.723434, 1, 0, 0, 1, 1,
0.6861722, 0.8717418, -0.9048378, 1, 0, 0, 1, 1,
0.6912345, 0.727522, 1.377282, 1, 0, 0, 1, 1,
0.6999148, 1.771627, 0.1128276, 0, 0, 0, 1, 1,
0.7009367, 0.2542031, -0.2738619, 0, 0, 0, 1, 1,
0.7010397, 1.485351, 1.699107, 0, 0, 0, 1, 1,
0.7017993, 1.33385, 0.8872033, 0, 0, 0, 1, 1,
0.704952, 0.2325651, 0.3182496, 0, 0, 0, 1, 1,
0.7053784, 0.2877688, 2.807166, 0, 0, 0, 1, 1,
0.7095316, 1.574652, 0.8986285, 0, 0, 0, 1, 1,
0.7097952, 1.192039, -0.1584012, 1, 1, 1, 1, 1,
0.7137376, -0.9028004, 1.780802, 1, 1, 1, 1, 1,
0.7138424, -0.451566, 0.3544324, 1, 1, 1, 1, 1,
0.7141967, -0.5862271, 1.00705, 1, 1, 1, 1, 1,
0.7147866, 1.091357, -0.2948958, 1, 1, 1, 1, 1,
0.7227975, 1.335599, 2.159008, 1, 1, 1, 1, 1,
0.7233123, 0.7055424, 1.673635, 1, 1, 1, 1, 1,
0.7301021, -0.7266364, 2.875399, 1, 1, 1, 1, 1,
0.7312942, -1.63068, 0.9675829, 1, 1, 1, 1, 1,
0.733615, 2.10519, -0.4257883, 1, 1, 1, 1, 1,
0.7352905, -0.3494177, 2.991957, 1, 1, 1, 1, 1,
0.7407489, -1.176813, 2.349058, 1, 1, 1, 1, 1,
0.7425345, 1.665581, -0.1324891, 1, 1, 1, 1, 1,
0.7433608, 0.2792053, 1.704589, 1, 1, 1, 1, 1,
0.743929, 0.1570371, 0.6200352, 1, 1, 1, 1, 1,
0.7467167, -0.6505425, 1.229022, 0, 0, 1, 1, 1,
0.7564873, -0.1976249, 2.214066, 1, 0, 0, 1, 1,
0.7608696, 0.617182, 1.81622, 1, 0, 0, 1, 1,
0.7687842, 1.941279, 0.9677594, 1, 0, 0, 1, 1,
0.77051, 1.0764, 0.4612898, 1, 0, 0, 1, 1,
0.7710365, 0.2003845, 3.060803, 1, 0, 0, 1, 1,
0.7742286, -1.568238, 2.364063, 0, 0, 0, 1, 1,
0.774325, -1.747939, 2.175857, 0, 0, 0, 1, 1,
0.7744493, -0.08199242, 2.152525, 0, 0, 0, 1, 1,
0.7821977, -0.3995678, 2.546652, 0, 0, 0, 1, 1,
0.7851995, -1.0921, 3.217266, 0, 0, 0, 1, 1,
0.7853006, -0.211284, 1.573695, 0, 0, 0, 1, 1,
0.7860621, 0.3541785, 0.6466853, 0, 0, 0, 1, 1,
0.8035917, 1.467926, 1.555195, 1, 1, 1, 1, 1,
0.8045706, 0.6357803, 0.9459185, 1, 1, 1, 1, 1,
0.8087814, 0.003126224, 1.718985, 1, 1, 1, 1, 1,
0.8088109, 1.748506, 0.8403417, 1, 1, 1, 1, 1,
0.8111423, 1.321726, 3.800311, 1, 1, 1, 1, 1,
0.8156645, -0.6646278, 1.108474, 1, 1, 1, 1, 1,
0.8166183, -1.077774, 3.121409, 1, 1, 1, 1, 1,
0.8181126, 1.415179, 3.04525, 1, 1, 1, 1, 1,
0.8188714, 1.668929, -1.00577, 1, 1, 1, 1, 1,
0.8231899, 1.050149, 2.070225, 1, 1, 1, 1, 1,
0.8245149, -0.6708742, 1.743798, 1, 1, 1, 1, 1,
0.8266093, 0.05226672, 1.652612, 1, 1, 1, 1, 1,
0.8277732, 0.5063895, 0.9608164, 1, 1, 1, 1, 1,
0.836963, 0.3528271, 1.439298, 1, 1, 1, 1, 1,
0.8464926, -0.3791784, 0.7615158, 1, 1, 1, 1, 1,
0.8516113, 0.8791127, 1.242044, 0, 0, 1, 1, 1,
0.8555074, -0.3422624, 1.543745, 1, 0, 0, 1, 1,
0.8625923, 0.1624974, -0.6337222, 1, 0, 0, 1, 1,
0.8681328, 0.1908529, 2.444399, 1, 0, 0, 1, 1,
0.8714764, -0.09352609, 0.305979, 1, 0, 0, 1, 1,
0.876063, 0.0527937, 0.1213854, 1, 0, 0, 1, 1,
0.8819906, 1.93149, -0.04422753, 0, 0, 0, 1, 1,
0.893079, -0.4959002, 2.070655, 0, 0, 0, 1, 1,
0.8950454, -0.007116618, 1.505, 0, 0, 0, 1, 1,
0.9134376, -0.7844989, 4.65198, 0, 0, 0, 1, 1,
0.9139584, 0.9570414, 2.083172, 0, 0, 0, 1, 1,
0.9191946, 0.1654465, 0.7864093, 0, 0, 0, 1, 1,
0.9219121, -0.3532513, 1.944929, 0, 0, 0, 1, 1,
0.924104, -1.34785, 3.838394, 1, 1, 1, 1, 1,
0.9297683, 0.3996646, 2.074337, 1, 1, 1, 1, 1,
0.9384843, -0.5687292, 0.8915049, 1, 1, 1, 1, 1,
0.9399304, -2.152695, 3.37893, 1, 1, 1, 1, 1,
0.9435858, -0.8104176, 3.244885, 1, 1, 1, 1, 1,
0.9454616, -0.5957785, 0.4478346, 1, 1, 1, 1, 1,
0.9485464, 2.058023, 1.091194, 1, 1, 1, 1, 1,
0.9520712, -0.9690577, 2.886252, 1, 1, 1, 1, 1,
0.9562958, 0.05341839, 1.506819, 1, 1, 1, 1, 1,
0.9599888, -0.2021389, 1.116224, 1, 1, 1, 1, 1,
0.9611389, -0.1781372, 1.817334, 1, 1, 1, 1, 1,
0.9678749, -0.6171023, 1.015016, 1, 1, 1, 1, 1,
0.9752307, -1.889134, 1.743223, 1, 1, 1, 1, 1,
0.9780379, 0.03703926, 2.067002, 1, 1, 1, 1, 1,
0.9925337, -0.2522602, 1.178586, 1, 1, 1, 1, 1,
0.9940584, -1.994847, 2.615726, 0, 0, 1, 1, 1,
0.9988842, 0.4843204, 2.552057, 1, 0, 0, 1, 1,
1.000176, 3.043113, -0.1786485, 1, 0, 0, 1, 1,
1.023244, 1.186763, -0.6688097, 1, 0, 0, 1, 1,
1.02377, 0.7728653, 1.07932, 1, 0, 0, 1, 1,
1.0279, -0.3171085, 3.278877, 1, 0, 0, 1, 1,
1.030064, 1.561362, 0.01076854, 0, 0, 0, 1, 1,
1.031671, 0.641071, 0.4875755, 0, 0, 0, 1, 1,
1.03324, 1.470193, 0.5727291, 0, 0, 0, 1, 1,
1.034289, -1.435883, 2.004502, 0, 0, 0, 1, 1,
1.042479, 0.984955, 0.6168792, 0, 0, 0, 1, 1,
1.045769, -0.9778596, 2.653133, 0, 0, 0, 1, 1,
1.047274, 0.02022965, 0.7351035, 0, 0, 0, 1, 1,
1.051581, 1.766073, -2.443478, 1, 1, 1, 1, 1,
1.053582, -2.029969, 1.867021, 1, 1, 1, 1, 1,
1.055017, -0.6531727, 2.446632, 1, 1, 1, 1, 1,
1.056137, -0.5605094, 3.679761, 1, 1, 1, 1, 1,
1.056881, -0.2332739, 1.450182, 1, 1, 1, 1, 1,
1.063089, -0.3430835, 1.777959, 1, 1, 1, 1, 1,
1.064207, -2.427634, 3.012629, 1, 1, 1, 1, 1,
1.081335, 0.1622723, 3.46529, 1, 1, 1, 1, 1,
1.088106, 0.7039221, 1.855808, 1, 1, 1, 1, 1,
1.088992, -0.4552032, 2.437758, 1, 1, 1, 1, 1,
1.091308, -0.5272149, 3.223425, 1, 1, 1, 1, 1,
1.09221, 1.101149, 0.123613, 1, 1, 1, 1, 1,
1.109563, 1.995742, 0.7218368, 1, 1, 1, 1, 1,
1.109703, -0.2559179, 1.981572, 1, 1, 1, 1, 1,
1.127802, -1.170623, 1.127496, 1, 1, 1, 1, 1,
1.131573, 0.1877669, 0.09761714, 0, 0, 1, 1, 1,
1.133404, -0.1780472, 0.1086691, 1, 0, 0, 1, 1,
1.135753, 0.4376977, 0.1909343, 1, 0, 0, 1, 1,
1.14165, -1.039037, 2.891726, 1, 0, 0, 1, 1,
1.144242, 0.3059386, 1.75316, 1, 0, 0, 1, 1,
1.145328, -1.360307, 2.011262, 1, 0, 0, 1, 1,
1.150174, 0.0005843151, 1.707664, 0, 0, 0, 1, 1,
1.159014, 0.1649384, 1.142166, 0, 0, 0, 1, 1,
1.162746, 0.7596152, 0.8039303, 0, 0, 0, 1, 1,
1.164463, 0.9049309, 1.344434, 0, 0, 0, 1, 1,
1.173321, -0.1192532, 1.662907, 0, 0, 0, 1, 1,
1.175875, -0.7811176, 2.957251, 0, 0, 0, 1, 1,
1.179375, 0.1559682, 1.382273, 0, 0, 0, 1, 1,
1.179532, -0.9699016, 3.816881, 1, 1, 1, 1, 1,
1.189914, -0.4488786, 1.452722, 1, 1, 1, 1, 1,
1.192843, 1.239787, -0.5038076, 1, 1, 1, 1, 1,
1.193438, 0.7585689, 0.8346344, 1, 1, 1, 1, 1,
1.195545, 1.699159, -1.327309, 1, 1, 1, 1, 1,
1.196392, 0.3041661, 0.6442546, 1, 1, 1, 1, 1,
1.197631, -2.12236, 1.467928, 1, 1, 1, 1, 1,
1.200389, 0.8648731, 2.242848, 1, 1, 1, 1, 1,
1.208511, -0.8156164, 0.988493, 1, 1, 1, 1, 1,
1.219727, -0.7456472, 1.957108, 1, 1, 1, 1, 1,
1.22013, 1.389066, 1.113997, 1, 1, 1, 1, 1,
1.221681, 0.4368602, 1.617401, 1, 1, 1, 1, 1,
1.224378, 0.06380112, 1.86283, 1, 1, 1, 1, 1,
1.23095, 0.1500293, 0.8144793, 1, 1, 1, 1, 1,
1.234301, 0.2800349, 1.085106, 1, 1, 1, 1, 1,
1.237103, -0.04737082, 0.4389871, 0, 0, 1, 1, 1,
1.239179, 0.7257315, 1.549985, 1, 0, 0, 1, 1,
1.240454, -0.3677604, 3.135567, 1, 0, 0, 1, 1,
1.245323, -1.267782, 1.304885, 1, 0, 0, 1, 1,
1.246428, 1.019381, 1.127864, 1, 0, 0, 1, 1,
1.249298, -0.144328, 1.163881, 1, 0, 0, 1, 1,
1.257846, 0.6640726, 2.51866, 0, 0, 0, 1, 1,
1.265729, -0.0007999302, 0.03544158, 0, 0, 0, 1, 1,
1.267938, -1.670414, 2.265127, 0, 0, 0, 1, 1,
1.275079, -0.4193301, 3.140008, 0, 0, 0, 1, 1,
1.277793, 0.9447025, 2.222519, 0, 0, 0, 1, 1,
1.280271, -1.312119, 3.105267, 0, 0, 0, 1, 1,
1.287595, -0.4164397, 1.073017, 0, 0, 0, 1, 1,
1.28903, 1.449352, 1.35481, 1, 1, 1, 1, 1,
1.292366, 1.487288, 2.443849, 1, 1, 1, 1, 1,
1.294062, -0.4145401, 1.386633, 1, 1, 1, 1, 1,
1.294636, 0.9390038, -0.4337284, 1, 1, 1, 1, 1,
1.294709, 0.1350377, 1.969617, 1, 1, 1, 1, 1,
1.32001, -1.436191, 1.84325, 1, 1, 1, 1, 1,
1.323195, -0.07861507, 2.673371, 1, 1, 1, 1, 1,
1.3333, 1.881662, 0.8876746, 1, 1, 1, 1, 1,
1.346699, 0.718148, 2.429211, 1, 1, 1, 1, 1,
1.351763, -1.117358, 1.668746, 1, 1, 1, 1, 1,
1.379205, -0.5065477, 1.873152, 1, 1, 1, 1, 1,
1.398479, 1.72307, 1.623421, 1, 1, 1, 1, 1,
1.401583, -0.1781628, 3.670468, 1, 1, 1, 1, 1,
1.40377, -1.012044, 3.279055, 1, 1, 1, 1, 1,
1.40551, 1.320958, 0.8306677, 1, 1, 1, 1, 1,
1.406118, 0.4466421, 1.088608, 0, 0, 1, 1, 1,
1.41491, 0.6937196, 0.916234, 1, 0, 0, 1, 1,
1.43011, 1.387154, 1.087084, 1, 0, 0, 1, 1,
1.446696, -0.06209692, 1.356816, 1, 0, 0, 1, 1,
1.466885, 0.2218187, 0.5848206, 1, 0, 0, 1, 1,
1.490963, 2.72011, 1.053075, 1, 0, 0, 1, 1,
1.517994, -0.07127493, 2.556066, 0, 0, 0, 1, 1,
1.520591, 1.419525, 0.3183266, 0, 0, 0, 1, 1,
1.529028, 0.1340774, 2.721552, 0, 0, 0, 1, 1,
1.531065, 1.297157, 1.87125, 0, 0, 0, 1, 1,
1.544048, 0.4477657, 1.08385, 0, 0, 0, 1, 1,
1.544597, 0.1526525, 0.6493858, 0, 0, 0, 1, 1,
1.554009, -0.0006388314, 1.783885, 0, 0, 0, 1, 1,
1.55995, -0.5701209, 2.629023, 1, 1, 1, 1, 1,
1.568643, -0.6686832, 2.704238, 1, 1, 1, 1, 1,
1.569246, -0.2854533, 0.2992432, 1, 1, 1, 1, 1,
1.571139, 2.082626, -0.9601826, 1, 1, 1, 1, 1,
1.574558, 2.199179, 1.712292, 1, 1, 1, 1, 1,
1.575703, 1.569978, 2.081904, 1, 1, 1, 1, 1,
1.614079, 0.4918855, 1.118297, 1, 1, 1, 1, 1,
1.623011, -2.118485, 1.837856, 1, 1, 1, 1, 1,
1.623232, 1.175501, 1.844717, 1, 1, 1, 1, 1,
1.624927, -0.5212917, 1.581065, 1, 1, 1, 1, 1,
1.64081, 0.1757412, 2.097105, 1, 1, 1, 1, 1,
1.65497, 0.3316497, 2.053775, 1, 1, 1, 1, 1,
1.657048, -1.180689, 2.722201, 1, 1, 1, 1, 1,
1.662102, -0.9396828, 1.13494, 1, 1, 1, 1, 1,
1.664806, 0.7098576, -0.02345801, 1, 1, 1, 1, 1,
1.673858, -1.111107, 2.376919, 0, 0, 1, 1, 1,
1.694971, -1.3616, 4.558387, 1, 0, 0, 1, 1,
1.699638, -0.2617058, 2.012542, 1, 0, 0, 1, 1,
1.70954, 0.108004, 2.477898, 1, 0, 0, 1, 1,
1.716532, 0.3612061, 2.600284, 1, 0, 0, 1, 1,
1.744186, -0.2053361, 1.927973, 1, 0, 0, 1, 1,
1.744695, -0.01883011, 1.790234, 0, 0, 0, 1, 1,
1.75152, -0.1023238, 2.142226, 0, 0, 0, 1, 1,
1.755714, 0.3317454, 1.483966, 0, 0, 0, 1, 1,
1.765357, -1.281286, 1.799443, 0, 0, 0, 1, 1,
1.765369, -1.011175, 2.607974, 0, 0, 0, 1, 1,
1.770084, -0.200206, 1.501571, 0, 0, 0, 1, 1,
1.787796, -0.8329966, 0.9507607, 0, 0, 0, 1, 1,
1.812214, 1.644605, 0.5008638, 1, 1, 1, 1, 1,
1.813611, 0.4859143, 0.4759074, 1, 1, 1, 1, 1,
1.831124, -0.2233942, 1.06153, 1, 1, 1, 1, 1,
1.844844, 0.8914217, 0.4300917, 1, 1, 1, 1, 1,
1.846025, 0.2410847, 1.122956, 1, 1, 1, 1, 1,
1.848027, -0.09429317, 1.265541, 1, 1, 1, 1, 1,
1.851733, -1.878825, 3.112125, 1, 1, 1, 1, 1,
1.854355, 0.216443, 1.333912, 1, 1, 1, 1, 1,
1.875561, -1.087841, 1.969622, 1, 1, 1, 1, 1,
1.889892, -0.1551649, 1.117356, 1, 1, 1, 1, 1,
1.914612, 0.2436875, 0.8814199, 1, 1, 1, 1, 1,
1.940264, 0.4241551, 1.633264, 1, 1, 1, 1, 1,
1.968382, -0.03659384, 1.510871, 1, 1, 1, 1, 1,
1.97717, 0.5819342, 3.078498, 1, 1, 1, 1, 1,
2.00636, 0.8134707, 1.705678, 1, 1, 1, 1, 1,
2.054739, -0.9167772, 1.856555, 0, 0, 1, 1, 1,
2.069845, 0.5822554, 0.322218, 1, 0, 0, 1, 1,
2.072774, 1.163103, 0.803637, 1, 0, 0, 1, 1,
2.10839, 0.4606034, 1.78975, 1, 0, 0, 1, 1,
2.118971, 0.3280796, 1.243404, 1, 0, 0, 1, 1,
2.134022, 2.904511, 1.76359, 1, 0, 0, 1, 1,
2.143796, -0.7082552, 2.073144, 0, 0, 0, 1, 1,
2.219059, -1.32365, 2.768794, 0, 0, 0, 1, 1,
2.247522, -0.5747281, 0.2075187, 0, 0, 0, 1, 1,
2.283359, 1.121893, 1.057634, 0, 0, 0, 1, 1,
2.287171, -2.039331, 2.304042, 0, 0, 0, 1, 1,
2.303805, 0.8081864, 2.010569, 0, 0, 0, 1, 1,
2.325666, 0.473338, 2.178055, 0, 0, 0, 1, 1,
2.376047, -0.05626552, 2.49855, 1, 1, 1, 1, 1,
2.417836, 0.05178671, 0.2278642, 1, 1, 1, 1, 1,
2.436495, 1.247589, 1.558315, 1, 1, 1, 1, 1,
2.455781, 2.743285, 1.660401, 1, 1, 1, 1, 1,
2.50398, 0.0822984, 0.6932529, 1, 1, 1, 1, 1,
2.617862, 0.6755208, 2.199141, 1, 1, 1, 1, 1,
3.156639, 2.535838, 2.65747, 1, 1, 1, 1, 1
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
var radius = 9.574339;
var distance = 33.62946;
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
mvMatrix.translate( -0.1998456, 0.1074028, 0.05570173 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62946);
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