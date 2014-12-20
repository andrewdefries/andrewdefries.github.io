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
-3.104499, -0.6458202, -2.582918, 1, 0, 0, 1,
-2.989655, 0.4847108, -0.6264567, 1, 0.007843138, 0, 1,
-2.835682, -0.9443592, -3.239449, 1, 0.01176471, 0, 1,
-2.813978, 1.543786, -2.855326, 1, 0.01960784, 0, 1,
-2.804218, 0.9814972, -1.163928, 1, 0.02352941, 0, 1,
-2.707621, -0.7656764, -1.146525, 1, 0.03137255, 0, 1,
-2.618374, -0.4736324, -0.6680378, 1, 0.03529412, 0, 1,
-2.612261, -0.8323969, -1.806316, 1, 0.04313726, 0, 1,
-2.489881, 0.1812385, -1.720081, 1, 0.04705882, 0, 1,
-2.455922, -0.1268611, 0.3982472, 1, 0.05490196, 0, 1,
-2.423075, -0.04636609, -1.49697, 1, 0.05882353, 0, 1,
-2.353029, 0.282179, -1.279518, 1, 0.06666667, 0, 1,
-2.343945, -0.9990493, -2.265144, 1, 0.07058824, 0, 1,
-2.315069, -0.03969055, -3.293604, 1, 0.07843138, 0, 1,
-2.262458, -2.35283, 0.208451, 1, 0.08235294, 0, 1,
-2.260365, -0.2340962, -1.467495, 1, 0.09019608, 0, 1,
-2.21685, -0.3489061, -2.235008, 1, 0.09411765, 0, 1,
-2.195282, -0.2278186, -1.840888, 1, 0.1019608, 0, 1,
-2.155008, 0.4900969, -0.3437864, 1, 0.1098039, 0, 1,
-2.148074, -1.024787, -2.088961, 1, 0.1137255, 0, 1,
-2.146607, 0.3325001, -1.89356, 1, 0.1215686, 0, 1,
-2.084301, -1.040249, -1.70035, 1, 0.1254902, 0, 1,
-2.081924, 1.219357, -1.51399, 1, 0.1333333, 0, 1,
-2.045188, -0.6042646, -1.15717, 1, 0.1372549, 0, 1,
-2.039236, -0.457536, -1.323326, 1, 0.145098, 0, 1,
-2.038805, 0.4151082, -1.5236, 1, 0.1490196, 0, 1,
-2.004738, 0.9072998, -1.12121, 1, 0.1568628, 0, 1,
-2.000984, 1.811703, -0.2151063, 1, 0.1607843, 0, 1,
-1.977399, 0.3310083, -1.209575, 1, 0.1686275, 0, 1,
-1.96619, 0.102358, -1.434277, 1, 0.172549, 0, 1,
-1.957934, 0.4830775, -3.232046, 1, 0.1803922, 0, 1,
-1.948138, 0.7179736, -3.207834, 1, 0.1843137, 0, 1,
-1.947158, -0.9826598, -1.969702, 1, 0.1921569, 0, 1,
-1.875016, 0.0335981, -0.6070717, 1, 0.1960784, 0, 1,
-1.859006, -0.1496127, -0.6976729, 1, 0.2039216, 0, 1,
-1.843467, 0.4478388, -1.609347, 1, 0.2117647, 0, 1,
-1.83608, 0.6233045, -1.206157, 1, 0.2156863, 0, 1,
-1.825663, -1.71591, -3.623383, 1, 0.2235294, 0, 1,
-1.819194, -1.146862, -2.508818, 1, 0.227451, 0, 1,
-1.818849, -0.1695489, -0.7294033, 1, 0.2352941, 0, 1,
-1.817523, 0.4921008, -1.902855, 1, 0.2392157, 0, 1,
-1.812019, 1.600418, 0.2433138, 1, 0.2470588, 0, 1,
-1.798171, -0.65144, -2.377788, 1, 0.2509804, 0, 1,
-1.793272, 1.381196, -0.5905046, 1, 0.2588235, 0, 1,
-1.773945, -0.3486128, -1.747021, 1, 0.2627451, 0, 1,
-1.770297, 1.082862, -1.8829, 1, 0.2705882, 0, 1,
-1.754979, 0.111202, -0.2944195, 1, 0.2745098, 0, 1,
-1.749815, -0.005513222, -0.5423636, 1, 0.282353, 0, 1,
-1.749272, 0.2278625, -1.613819, 1, 0.2862745, 0, 1,
-1.729389, -0.451201, -2.717603, 1, 0.2941177, 0, 1,
-1.70513, 1.141503, -1.5158, 1, 0.3019608, 0, 1,
-1.697862, -0.233222, -1.158187, 1, 0.3058824, 0, 1,
-1.695146, 0.08593347, -0.7123911, 1, 0.3137255, 0, 1,
-1.663571, 3.458856, -1.691076, 1, 0.3176471, 0, 1,
-1.658137, 1.246173, -1.81092, 1, 0.3254902, 0, 1,
-1.619922, -0.4867881, -1.595304, 1, 0.3294118, 0, 1,
-1.618842, 1.223657, 1.562798, 1, 0.3372549, 0, 1,
-1.602675, -0.437027, -3.58616, 1, 0.3411765, 0, 1,
-1.592683, -0.3857436, -3.178159, 1, 0.3490196, 0, 1,
-1.584407, -0.9140446, -0.03006724, 1, 0.3529412, 0, 1,
-1.569478, 0.7168387, -1.312548, 1, 0.3607843, 0, 1,
-1.55814, -0.1792059, -2.229104, 1, 0.3647059, 0, 1,
-1.55513, 0.6730768, -1.147462, 1, 0.372549, 0, 1,
-1.550201, -0.6932927, -2.521073, 1, 0.3764706, 0, 1,
-1.550186, 0.3130588, -2.263449, 1, 0.3843137, 0, 1,
-1.541535, 0.02267162, -1.960141, 1, 0.3882353, 0, 1,
-1.535955, -0.4713333, -2.726993, 1, 0.3960784, 0, 1,
-1.523656, -1.046752, -2.512327, 1, 0.4039216, 0, 1,
-1.515703, -0.3099106, 1.051058, 1, 0.4078431, 0, 1,
-1.510771, -0.8650977, -2.837619, 1, 0.4156863, 0, 1,
-1.50627, -1.430129, -1.213556, 1, 0.4196078, 0, 1,
-1.501918, -1.134784, -3.756313, 1, 0.427451, 0, 1,
-1.500656, -1.573603, -2.766776, 1, 0.4313726, 0, 1,
-1.497306, 0.3443337, -0.96087, 1, 0.4392157, 0, 1,
-1.486162, 0.5374742, -1.759125, 1, 0.4431373, 0, 1,
-1.482323, -0.1634987, -1.4421, 1, 0.4509804, 0, 1,
-1.467833, 0.9744708, -2.274205, 1, 0.454902, 0, 1,
-1.445615, -0.9544709, -1.923584, 1, 0.4627451, 0, 1,
-1.419915, 0.08689464, -2.887951, 1, 0.4666667, 0, 1,
-1.418256, -2.103889, -3.302886, 1, 0.4745098, 0, 1,
-1.407519, -0.01744678, -1.387145, 1, 0.4784314, 0, 1,
-1.406547, -0.1234187, -2.266382, 1, 0.4862745, 0, 1,
-1.405345, 1.975281, -1.84312, 1, 0.4901961, 0, 1,
-1.395408, 1.191703, -3.597636, 1, 0.4980392, 0, 1,
-1.384986, -0.08056847, -2.052867, 1, 0.5058824, 0, 1,
-1.371079, -0.6940169, -2.049132, 1, 0.509804, 0, 1,
-1.36303, 2.069863, -0.1594312, 1, 0.5176471, 0, 1,
-1.362647, -0.7737368, -1.050236, 1, 0.5215687, 0, 1,
-1.362512, 0.5022874, -2.713094, 1, 0.5294118, 0, 1,
-1.361729, -0.8411396, -2.791358, 1, 0.5333334, 0, 1,
-1.359211, -0.7757754, -2.40976, 1, 0.5411765, 0, 1,
-1.35446, 0.02178803, 1.704882, 1, 0.5450981, 0, 1,
-1.349991, -1.791123, -2.91504, 1, 0.5529412, 0, 1,
-1.349359, 0.425211, -1.205046, 1, 0.5568628, 0, 1,
-1.3361, -0.1794027, -0.2507269, 1, 0.5647059, 0, 1,
-1.329016, -1.261245, -1.628155, 1, 0.5686275, 0, 1,
-1.319664, -0.4045409, -1.209984, 1, 0.5764706, 0, 1,
-1.316092, -1.075026, -1.295561, 1, 0.5803922, 0, 1,
-1.313344, -2.059344, -2.437873, 1, 0.5882353, 0, 1,
-1.306345, -1.609512, -1.207039, 1, 0.5921569, 0, 1,
-1.30508, 0.4623744, -1.706389, 1, 0.6, 0, 1,
-1.291469, -0.2299069, -1.226291, 1, 0.6078432, 0, 1,
-1.289248, -0.3741761, -2.973646, 1, 0.6117647, 0, 1,
-1.289131, 0.02576298, -2.691053, 1, 0.6196079, 0, 1,
-1.286195, -0.0235156, -1.978701, 1, 0.6235294, 0, 1,
-1.278864, 0.02152362, -2.179118, 1, 0.6313726, 0, 1,
-1.271309, -0.2598393, -2.55915, 1, 0.6352941, 0, 1,
-1.261363, -0.857085, -1.482954, 1, 0.6431373, 0, 1,
-1.261355, 1.108546, -0.2182143, 1, 0.6470588, 0, 1,
-1.258443, -2.416883, -2.334925, 1, 0.654902, 0, 1,
-1.252714, -0.8190358, -4.309963, 1, 0.6588235, 0, 1,
-1.249556, 0.002970492, -3.403569, 1, 0.6666667, 0, 1,
-1.249419, -0.7494435, -2.286955, 1, 0.6705883, 0, 1,
-1.249247, -0.05142553, -2.070967, 1, 0.6784314, 0, 1,
-1.241321, 0.6192771, -0.2529735, 1, 0.682353, 0, 1,
-1.231056, 0.5198426, -2.582852, 1, 0.6901961, 0, 1,
-1.227666, 0.728394, -0.7914862, 1, 0.6941177, 0, 1,
-1.223999, -2.333208, -2.142098, 1, 0.7019608, 0, 1,
-1.221156, -2.042367, -2.82956, 1, 0.7098039, 0, 1,
-1.214009, 1.480963, 0.05154598, 1, 0.7137255, 0, 1,
-1.204446, 1.338004, -1.854452, 1, 0.7215686, 0, 1,
-1.202351, -2.013269, -2.596337, 1, 0.7254902, 0, 1,
-1.192787, -0.5972993, -1.996822, 1, 0.7333333, 0, 1,
-1.1802, -0.5991889, -2.165896, 1, 0.7372549, 0, 1,
-1.178406, -0.2583132, -0.1301029, 1, 0.7450981, 0, 1,
-1.175335, 0.5210173, -0.6829587, 1, 0.7490196, 0, 1,
-1.171543, -1.29354, -1.352117, 1, 0.7568628, 0, 1,
-1.171072, -0.6883122, -4.812924, 1, 0.7607843, 0, 1,
-1.168968, 0.2942092, -1.663393, 1, 0.7686275, 0, 1,
-1.16165, -1.380712, -3.501355, 1, 0.772549, 0, 1,
-1.157288, -1.978996, -2.618609, 1, 0.7803922, 0, 1,
-1.150753, -0.1834695, -2.905808, 1, 0.7843137, 0, 1,
-1.148313, 1.318607, 1.021216, 1, 0.7921569, 0, 1,
-1.144495, 0.4448637, -0.2044155, 1, 0.7960784, 0, 1,
-1.140356, -1.2554, -2.739177, 1, 0.8039216, 0, 1,
-1.136996, 0.385913, -1.03011, 1, 0.8117647, 0, 1,
-1.131505, 1.379403, -1.382112, 1, 0.8156863, 0, 1,
-1.130772, -1.244295, -1.165399, 1, 0.8235294, 0, 1,
-1.12814, 0.6159471, -1.52599, 1, 0.827451, 0, 1,
-1.12803, 0.3202117, -0.04914382, 1, 0.8352941, 0, 1,
-1.123865, 0.4455157, -2.004562, 1, 0.8392157, 0, 1,
-1.11159, -2.298325, -3.206985, 1, 0.8470588, 0, 1,
-1.109928, 1.567615, -0.2367954, 1, 0.8509804, 0, 1,
-1.103565, 0.3844547, -3.057603, 1, 0.8588235, 0, 1,
-1.098905, -0.433338, -2.812677, 1, 0.8627451, 0, 1,
-1.09709, -1.775349, -2.215754, 1, 0.8705882, 0, 1,
-1.095682, -1.181506, -2.151716, 1, 0.8745098, 0, 1,
-1.090676, 1.080091, -1.64229, 1, 0.8823529, 0, 1,
-1.085248, 1.379504, -1.78215, 1, 0.8862745, 0, 1,
-1.085098, -0.06142175, -3.65274, 1, 0.8941177, 0, 1,
-1.082534, -0.08233313, -1.721993, 1, 0.8980392, 0, 1,
-1.08007, 1.122479, -1.23242, 1, 0.9058824, 0, 1,
-1.074469, -1.30394, -1.414593, 1, 0.9137255, 0, 1,
-1.073781, -1.643412, -2.57736, 1, 0.9176471, 0, 1,
-1.072083, 0.4513387, 0.6145762, 1, 0.9254902, 0, 1,
-1.062294, -0.002502756, -0.9699963, 1, 0.9294118, 0, 1,
-1.055971, -0.502726, -2.761102, 1, 0.9372549, 0, 1,
-1.055601, -0.8292709, -1.481985, 1, 0.9411765, 0, 1,
-1.041197, -1.239633, -1.887183, 1, 0.9490196, 0, 1,
-1.040058, 1.384038, -1.897371, 1, 0.9529412, 0, 1,
-1.035235, 0.6125132, -2.195647, 1, 0.9607843, 0, 1,
-1.032863, -0.9210132, -1.897973, 1, 0.9647059, 0, 1,
-1.028758, 0.85732, 1.038841, 1, 0.972549, 0, 1,
-1.02485, 0.5812986, -1.122927, 1, 0.9764706, 0, 1,
-1.022251, 0.0919879, -0.187802, 1, 0.9843137, 0, 1,
-1.020818, -0.8779628, -2.96915, 1, 0.9882353, 0, 1,
-1.014377, 0.1598482, -2.088844, 1, 0.9960784, 0, 1,
-1.012041, -1.443608, -3.037224, 0.9960784, 1, 0, 1,
-1.009744, -0.2806654, -0.2690858, 0.9921569, 1, 0, 1,
-1.001607, 0.419456, -1.926631, 0.9843137, 1, 0, 1,
-0.9979646, -0.9895668, -3.736145, 0.9803922, 1, 0, 1,
-0.9835334, -0.8584077, -2.529784, 0.972549, 1, 0, 1,
-0.9810823, 1.134344, 0.8858481, 0.9686275, 1, 0, 1,
-0.9740468, 0.384074, -2.235919, 0.9607843, 1, 0, 1,
-0.973314, 0.5336164, -0.6870389, 0.9568627, 1, 0, 1,
-0.9727475, -0.02612984, -2.355276, 0.9490196, 1, 0, 1,
-0.9680514, 0.4984222, -1.318415, 0.945098, 1, 0, 1,
-0.9526648, -0.5910124, -0.7973724, 0.9372549, 1, 0, 1,
-0.951517, 0.4874971, 0.1601486, 0.9333333, 1, 0, 1,
-0.9472505, 0.004494334, -0.1961011, 0.9254902, 1, 0, 1,
-0.9468722, 1.397308, -0.8913314, 0.9215686, 1, 0, 1,
-0.9437187, 0.3153497, -1.329969, 0.9137255, 1, 0, 1,
-0.9380238, 0.002695589, -1.666822, 0.9098039, 1, 0, 1,
-0.9313317, 1.119252, -0.7850469, 0.9019608, 1, 0, 1,
-0.9312142, -1.306167, -3.541497, 0.8941177, 1, 0, 1,
-0.9262087, 0.3195071, 1.952608, 0.8901961, 1, 0, 1,
-0.9184041, 1.577668, -0.2687202, 0.8823529, 1, 0, 1,
-0.9173169, 0.1586211, -1.494134, 0.8784314, 1, 0, 1,
-0.9129676, 1.443458, 0.215881, 0.8705882, 1, 0, 1,
-0.9055268, -1.049431, -1.937077, 0.8666667, 1, 0, 1,
-0.899608, 0.9800178, -1.409655, 0.8588235, 1, 0, 1,
-0.8986185, 0.3639734, -0.09644544, 0.854902, 1, 0, 1,
-0.8941991, -0.4999801, -2.85652, 0.8470588, 1, 0, 1,
-0.893077, 0.5392582, -1.852946, 0.8431373, 1, 0, 1,
-0.889828, 0.6211782, -0.8606821, 0.8352941, 1, 0, 1,
-0.8844249, 1.418636, -2.010225, 0.8313726, 1, 0, 1,
-0.881698, -1.121078, -2.305444, 0.8235294, 1, 0, 1,
-0.8795782, 2.152178, 0.0904738, 0.8196079, 1, 0, 1,
-0.8727004, -0.5876902, -1.394918, 0.8117647, 1, 0, 1,
-0.8657503, -1.810777, -1.909708, 0.8078431, 1, 0, 1,
-0.8622201, 0.6162713, -0.9028602, 0.8, 1, 0, 1,
-0.8596929, -1.610196, -2.175014, 0.7921569, 1, 0, 1,
-0.8589237, -0.7818418, -1.35393, 0.7882353, 1, 0, 1,
-0.8566356, -0.3129413, -2.689551, 0.7803922, 1, 0, 1,
-0.8549054, -0.005067948, -1.730009, 0.7764706, 1, 0, 1,
-0.8384274, -1.229111, -3.811546, 0.7686275, 1, 0, 1,
-0.8379969, -1.370795, -2.452211, 0.7647059, 1, 0, 1,
-0.8340212, 1.015399, -2.306235, 0.7568628, 1, 0, 1,
-0.8317945, 0.2438197, -1.738354, 0.7529412, 1, 0, 1,
-0.8315331, 1.49135, -0.8283185, 0.7450981, 1, 0, 1,
-0.8283754, -0.5701549, -2.060417, 0.7411765, 1, 0, 1,
-0.8274016, -0.7527423, -3.588003, 0.7333333, 1, 0, 1,
-0.8241971, -0.9093652, -4.291551, 0.7294118, 1, 0, 1,
-0.8231343, 1.860327, -0.5618171, 0.7215686, 1, 0, 1,
-0.8206994, 1.906151, -0.579621, 0.7176471, 1, 0, 1,
-0.8195269, 1.373985, -0.4731786, 0.7098039, 1, 0, 1,
-0.818116, 0.8646415, -0.06305792, 0.7058824, 1, 0, 1,
-0.8173001, -0.4526607, -2.215275, 0.6980392, 1, 0, 1,
-0.8163416, -1.267157, -2.7995, 0.6901961, 1, 0, 1,
-0.8139102, 0.2829998, -1.386039, 0.6862745, 1, 0, 1,
-0.8114421, 0.4173582, 0.3304628, 0.6784314, 1, 0, 1,
-0.8114002, -0.3450006, -2.557343, 0.6745098, 1, 0, 1,
-0.8069924, -0.2438187, -1.888757, 0.6666667, 1, 0, 1,
-0.8011993, -0.7598855, -1.065937, 0.6627451, 1, 0, 1,
-0.7986633, 0.2027214, -2.737116, 0.654902, 1, 0, 1,
-0.7965748, -1.112853, -1.514913, 0.6509804, 1, 0, 1,
-0.7933461, 0.580728, -1.73124, 0.6431373, 1, 0, 1,
-0.7925788, 0.1276837, -1.015266, 0.6392157, 1, 0, 1,
-0.7884341, -0.03646119, -2.226466, 0.6313726, 1, 0, 1,
-0.7855293, 0.4864275, -0.6343544, 0.627451, 1, 0, 1,
-0.7828234, 0.5304526, -0.7853116, 0.6196079, 1, 0, 1,
-0.7773277, -0.5002215, -0.6601365, 0.6156863, 1, 0, 1,
-0.7769522, -0.3895158, -2.751273, 0.6078432, 1, 0, 1,
-0.7751012, 2.370684, 1.393098, 0.6039216, 1, 0, 1,
-0.7676765, 0.5102293, 0.3686606, 0.5960785, 1, 0, 1,
-0.7667688, 0.4503561, -1.315731, 0.5882353, 1, 0, 1,
-0.7617112, -0.2306825, -2.381047, 0.5843138, 1, 0, 1,
-0.7611325, -0.7318516, -0.7209992, 0.5764706, 1, 0, 1,
-0.7505563, -0.4443146, -2.527064, 0.572549, 1, 0, 1,
-0.749193, -1.699431, -1.78415, 0.5647059, 1, 0, 1,
-0.7473873, -1.793162, -1.621817, 0.5607843, 1, 0, 1,
-0.7430294, -0.8055851, -2.50622, 0.5529412, 1, 0, 1,
-0.7415708, 0.2458369, -0.2846418, 0.5490196, 1, 0, 1,
-0.7399663, -0.5010598, -2.970512, 0.5411765, 1, 0, 1,
-0.7373143, 2.042968, -1.27347, 0.5372549, 1, 0, 1,
-0.7290536, 0.1612172, -1.899459, 0.5294118, 1, 0, 1,
-0.7264389, -0.02263969, -1.607299, 0.5254902, 1, 0, 1,
-0.7248194, 0.1826994, -4.106531, 0.5176471, 1, 0, 1,
-0.7225254, -0.595388, -1.672071, 0.5137255, 1, 0, 1,
-0.710723, 0.5790704, -0.7061097, 0.5058824, 1, 0, 1,
-0.7097461, -0.2434814, -1.762141, 0.5019608, 1, 0, 1,
-0.7097155, -0.3644004, -2.944743, 0.4941176, 1, 0, 1,
-0.708397, 0.4799361, -1.685268, 0.4862745, 1, 0, 1,
-0.7020277, -0.2289555, -2.801795, 0.4823529, 1, 0, 1,
-0.6969718, -2.009158, -3.329348, 0.4745098, 1, 0, 1,
-0.6960064, 0.9577069, -1.398958, 0.4705882, 1, 0, 1,
-0.6954724, -1.724872, -3.912647, 0.4627451, 1, 0, 1,
-0.6944388, 0.3554182, -0.9437915, 0.4588235, 1, 0, 1,
-0.693042, 0.06480121, -2.741184, 0.4509804, 1, 0, 1,
-0.6915848, 0.2129459, -0.9235262, 0.4470588, 1, 0, 1,
-0.68846, -0.3898218, -1.946006, 0.4392157, 1, 0, 1,
-0.6865992, 0.03526167, -2.478608, 0.4352941, 1, 0, 1,
-0.6846604, 0.1062871, -0.418851, 0.427451, 1, 0, 1,
-0.6846317, 0.1108908, -2.245044, 0.4235294, 1, 0, 1,
-0.6805781, -0.2718909, -2.793858, 0.4156863, 1, 0, 1,
-0.6731882, 1.842184, 1.344635, 0.4117647, 1, 0, 1,
-0.6702806, 0.4859761, -1.225256, 0.4039216, 1, 0, 1,
-0.6616765, 1.339153, -0.682411, 0.3960784, 1, 0, 1,
-0.6533014, -0.5441615, -4.031473, 0.3921569, 1, 0, 1,
-0.6496815, -0.2185601, -3.602885, 0.3843137, 1, 0, 1,
-0.6491171, 1.771725, -0.8919542, 0.3803922, 1, 0, 1,
-0.6478926, -1.973767, -3.171268, 0.372549, 1, 0, 1,
-0.6467015, 0.249156, 0.05169076, 0.3686275, 1, 0, 1,
-0.6374936, -0.9087881, -1.839197, 0.3607843, 1, 0, 1,
-0.637359, 0.7530735, -0.209397, 0.3568628, 1, 0, 1,
-0.6327329, -1.698372, -3.389847, 0.3490196, 1, 0, 1,
-0.6321677, -1.069692, -3.148144, 0.345098, 1, 0, 1,
-0.6271372, 0.5137322, -0.6633813, 0.3372549, 1, 0, 1,
-0.6246932, -0.02716832, -0.6690406, 0.3333333, 1, 0, 1,
-0.6236582, 0.2564759, -1.843612, 0.3254902, 1, 0, 1,
-0.6218913, 1.086856, -1.989602, 0.3215686, 1, 0, 1,
-0.6185994, -0.004995235, -2.045715, 0.3137255, 1, 0, 1,
-0.615706, 1.221181, 0.7728832, 0.3098039, 1, 0, 1,
-0.6111042, 1.067656, 0.0408175, 0.3019608, 1, 0, 1,
-0.6074512, -0.6970702, -2.52093, 0.2941177, 1, 0, 1,
-0.6057599, -1.866444, -1.050951, 0.2901961, 1, 0, 1,
-0.6050555, 0.1435287, -1.260871, 0.282353, 1, 0, 1,
-0.6041501, -0.6855509, -2.184193, 0.2784314, 1, 0, 1,
-0.6004764, -1.308725, -4.317096, 0.2705882, 1, 0, 1,
-0.6001074, -1.764878, -2.395118, 0.2666667, 1, 0, 1,
-0.5961893, -0.3373777, -1.578204, 0.2588235, 1, 0, 1,
-0.5940556, -0.9722778, -2.001758, 0.254902, 1, 0, 1,
-0.5914806, 0.06457958, -0.3458449, 0.2470588, 1, 0, 1,
-0.5890946, -0.8024887, -3.19372, 0.2431373, 1, 0, 1,
-0.5864872, -1.424518, -1.27227, 0.2352941, 1, 0, 1,
-0.5795904, 1.010324, -1.882146, 0.2313726, 1, 0, 1,
-0.5792722, 0.5893587, 0.7737123, 0.2235294, 1, 0, 1,
-0.5778815, -0.4656555, -1.994827, 0.2196078, 1, 0, 1,
-0.5742598, -1.203023, -2.078286, 0.2117647, 1, 0, 1,
-0.5731149, 1.256685, 0.8557118, 0.2078431, 1, 0, 1,
-0.5726004, -1.478081, -3.997995, 0.2, 1, 0, 1,
-0.5682089, -0.2467541, -1.52791, 0.1921569, 1, 0, 1,
-0.5612426, 0.3258191, -0.458101, 0.1882353, 1, 0, 1,
-0.557594, 0.7332665, -0.8781369, 0.1803922, 1, 0, 1,
-0.5556867, -0.1309299, -0.4706748, 0.1764706, 1, 0, 1,
-0.5531554, 0.2221099, -1.916545, 0.1686275, 1, 0, 1,
-0.5464439, 0.01572656, -0.09093517, 0.1647059, 1, 0, 1,
-0.5450916, -0.3151816, -3.262827, 0.1568628, 1, 0, 1,
-0.5434486, -1.373732, -1.813743, 0.1529412, 1, 0, 1,
-0.5417187, 1.945055, -1.919122, 0.145098, 1, 0, 1,
-0.5412567, 0.2810037, 0.6606345, 0.1411765, 1, 0, 1,
-0.5391475, -0.743313, -3.354668, 0.1333333, 1, 0, 1,
-0.5377846, -2.400656, -2.808979, 0.1294118, 1, 0, 1,
-0.5367671, 0.7033848, -1.229365, 0.1215686, 1, 0, 1,
-0.5336031, -0.2965623, -0.7601108, 0.1176471, 1, 0, 1,
-0.5318065, 1.231007, 1.013425, 0.1098039, 1, 0, 1,
-0.5288165, 0.470532, -0.1395971, 0.1058824, 1, 0, 1,
-0.521117, 0.4819021, 0.1738426, 0.09803922, 1, 0, 1,
-0.5189618, -0.2023607, -2.757113, 0.09019608, 1, 0, 1,
-0.5169913, 2.133059, -1.139596, 0.08627451, 1, 0, 1,
-0.5163878, -0.3136706, -2.849151, 0.07843138, 1, 0, 1,
-0.5157936, 1.33088, -1.123191, 0.07450981, 1, 0, 1,
-0.5100459, 0.2910673, -0.05655455, 0.06666667, 1, 0, 1,
-0.5012798, 0.1720372, -0.6108578, 0.0627451, 1, 0, 1,
-0.4978152, 0.2245083, -0.7004502, 0.05490196, 1, 0, 1,
-0.491518, -1.766824, -3.84474, 0.05098039, 1, 0, 1,
-0.4894276, -1.156737, -2.510501, 0.04313726, 1, 0, 1,
-0.4887238, -1.24968, -2.09113, 0.03921569, 1, 0, 1,
-0.4744698, -1.386219, -1.50725, 0.03137255, 1, 0, 1,
-0.474373, 0.846026, -0.970497, 0.02745098, 1, 0, 1,
-0.4727284, -0.009755954, -2.193984, 0.01960784, 1, 0, 1,
-0.4725261, -0.368491, -3.64325, 0.01568628, 1, 0, 1,
-0.4691024, 0.6259181, -1.488092, 0.007843138, 1, 0, 1,
-0.4543083, -0.191409, -3.323613, 0.003921569, 1, 0, 1,
-0.4521146, 1.145559, -0.8441703, 0, 1, 0.003921569, 1,
-0.450675, 1.132158, -0.1980606, 0, 1, 0.01176471, 1,
-0.4468065, 1.655895, -0.365813, 0, 1, 0.01568628, 1,
-0.4450975, 0.6458955, -0.8873541, 0, 1, 0.02352941, 1,
-0.4415751, 1.381239, -0.3483873, 0, 1, 0.02745098, 1,
-0.4402212, -0.007577895, -1.311206, 0, 1, 0.03529412, 1,
-0.4380956, 0.2905228, -2.623886, 0, 1, 0.03921569, 1,
-0.4356693, 0.1579904, -1.662442, 0, 1, 0.04705882, 1,
-0.4355751, -1.559995, -1.537901, 0, 1, 0.05098039, 1,
-0.433338, 1.763439, 1.129206, 0, 1, 0.05882353, 1,
-0.430079, -0.241273, -1.930475, 0, 1, 0.0627451, 1,
-0.4233123, -0.4358698, -1.281079, 0, 1, 0.07058824, 1,
-0.4227827, -0.7193323, -2.615634, 0, 1, 0.07450981, 1,
-0.4159466, -0.6351411, -3.907503, 0, 1, 0.08235294, 1,
-0.4134099, 0.2191641, -0.8998412, 0, 1, 0.08627451, 1,
-0.4123792, -1.838977, -3.995522, 0, 1, 0.09411765, 1,
-0.4084001, -0.1960946, -1.463884, 0, 1, 0.1019608, 1,
-0.4076404, -0.4285837, -2.574338, 0, 1, 0.1058824, 1,
-0.4000451, -1.176955, -3.242376, 0, 1, 0.1137255, 1,
-0.397248, 1.151033, -1.197777, 0, 1, 0.1176471, 1,
-0.3959989, 0.7604076, 1.080671, 0, 1, 0.1254902, 1,
-0.3929362, 0.8889722, -0.807441, 0, 1, 0.1294118, 1,
-0.3888613, -0.5695841, -2.109897, 0, 1, 0.1372549, 1,
-0.3880575, 0.07539968, -0.4526142, 0, 1, 0.1411765, 1,
-0.3861645, -0.01568405, -1.743949, 0, 1, 0.1490196, 1,
-0.383643, 0.9240408, 0.3084619, 0, 1, 0.1529412, 1,
-0.3761141, -1.377451, -2.231637, 0, 1, 0.1607843, 1,
-0.3730808, -0.2864492, -0.01264258, 0, 1, 0.1647059, 1,
-0.3718955, 1.451592, 0.1538309, 0, 1, 0.172549, 1,
-0.3605361, 0.04761627, -1.253618, 0, 1, 0.1764706, 1,
-0.3592812, -0.2597662, -2.004199, 0, 1, 0.1843137, 1,
-0.3569145, -0.8550115, -2.728575, 0, 1, 0.1882353, 1,
-0.3527807, -1.416728, -1.264849, 0, 1, 0.1960784, 1,
-0.3522231, -0.006899774, -1.595986, 0, 1, 0.2039216, 1,
-0.3489046, 0.8392813, 0.340375, 0, 1, 0.2078431, 1,
-0.3471354, -0.4670583, -3.667906, 0, 1, 0.2156863, 1,
-0.3470969, -0.03681285, -0.6833453, 0, 1, 0.2196078, 1,
-0.3460107, -2.487042, -1.47378, 0, 1, 0.227451, 1,
-0.3431356, 0.6972641, 0.7234772, 0, 1, 0.2313726, 1,
-0.3392155, 0.3053181, 1.088041, 0, 1, 0.2392157, 1,
-0.3390655, -0.3043898, -3.035637, 0, 1, 0.2431373, 1,
-0.3371155, 1.202563, -0.2674082, 0, 1, 0.2509804, 1,
-0.336129, 0.6474452, -1.140606, 0, 1, 0.254902, 1,
-0.3344604, -0.5484997, -2.95787, 0, 1, 0.2627451, 1,
-0.3335481, 0.1640796, -1.580155, 0, 1, 0.2666667, 1,
-0.3318385, -0.7428107, -3.437264, 0, 1, 0.2745098, 1,
-0.330777, 1.578115, -0.3942093, 0, 1, 0.2784314, 1,
-0.3305458, -0.4293367, -3.320761, 0, 1, 0.2862745, 1,
-0.3223196, -1.111373, -2.95974, 0, 1, 0.2901961, 1,
-0.3216326, 0.8373829, -1.134927, 0, 1, 0.2980392, 1,
-0.3133572, -0.3050212, -1.307906, 0, 1, 0.3058824, 1,
-0.311158, -0.8873129, -1.914259, 0, 1, 0.3098039, 1,
-0.3083548, -1.596996, -4.800686, 0, 1, 0.3176471, 1,
-0.3066821, 1.102164, -0.117347, 0, 1, 0.3215686, 1,
-0.3049102, -1.70611, -4.133846, 0, 1, 0.3294118, 1,
-0.3027142, 1.210359, -0.5543928, 0, 1, 0.3333333, 1,
-0.3008001, -0.7965205, -2.947732, 0, 1, 0.3411765, 1,
-0.2983562, -0.2629833, -1.67831, 0, 1, 0.345098, 1,
-0.2973728, 0.9723725, -0.2368148, 0, 1, 0.3529412, 1,
-0.2960411, -0.2370228, -1.824958, 0, 1, 0.3568628, 1,
-0.292612, 1.890729, -1.909444, 0, 1, 0.3647059, 1,
-0.2923053, -0.4204463, -1.537711, 0, 1, 0.3686275, 1,
-0.2918351, 0.7954971, -0.2760102, 0, 1, 0.3764706, 1,
-0.2916454, -0.8080878, -2.281775, 0, 1, 0.3803922, 1,
-0.2882402, 2.455569, -1.138898, 0, 1, 0.3882353, 1,
-0.2849975, 0.1528104, -2.537105, 0, 1, 0.3921569, 1,
-0.2831875, 0.8225651, -2.509265, 0, 1, 0.4, 1,
-0.283117, -0.5619748, -3.927248, 0, 1, 0.4078431, 1,
-0.2813581, 1.239636, -0.1554087, 0, 1, 0.4117647, 1,
-0.2811016, -1.046557, -2.614595, 0, 1, 0.4196078, 1,
-0.279627, 0.462356, 0.2753452, 0, 1, 0.4235294, 1,
-0.2793719, -0.7922857, -2.286899, 0, 1, 0.4313726, 1,
-0.272367, 0.9503166, 0.1768123, 0, 1, 0.4352941, 1,
-0.2636245, -0.3810031, -2.198278, 0, 1, 0.4431373, 1,
-0.2589877, -0.5426899, -1.686946, 0, 1, 0.4470588, 1,
-0.2550831, 1.101789, -1.319288, 0, 1, 0.454902, 1,
-0.2535422, -0.09373192, -1.385853, 0, 1, 0.4588235, 1,
-0.2535003, 1.242542, -0.8828853, 0, 1, 0.4666667, 1,
-0.2517216, -1.626786, -3.323311, 0, 1, 0.4705882, 1,
-0.2488284, 2.330279, 1.612167, 0, 1, 0.4784314, 1,
-0.2465533, -2.03263, -3.479732, 0, 1, 0.4823529, 1,
-0.2453011, 0.6221933, 0.4297926, 0, 1, 0.4901961, 1,
-0.2385544, 0.7492198, -1.188718, 0, 1, 0.4941176, 1,
-0.2383623, -2.520853, -3.158408, 0, 1, 0.5019608, 1,
-0.2381729, 0.566273, -1.009388, 0, 1, 0.509804, 1,
-0.2371026, -0.7879213, -1.851824, 0, 1, 0.5137255, 1,
-0.2361817, -0.68985, -2.555184, 0, 1, 0.5215687, 1,
-0.235925, 2.591172, -0.09254311, 0, 1, 0.5254902, 1,
-0.2325383, 1.678835, -0.6168715, 0, 1, 0.5333334, 1,
-0.2294813, 0.7205501, 0.3124422, 0, 1, 0.5372549, 1,
-0.2293175, -0.6976703, -2.549054, 0, 1, 0.5450981, 1,
-0.228864, 0.2646431, -1.25988, 0, 1, 0.5490196, 1,
-0.2272474, 0.3453789, -0.9433099, 0, 1, 0.5568628, 1,
-0.2246972, -0.12013, -2.913734, 0, 1, 0.5607843, 1,
-0.2233675, 0.1465023, -1.459656, 0, 1, 0.5686275, 1,
-0.2200518, -0.3737386, -2.302993, 0, 1, 0.572549, 1,
-0.2162641, -0.2471744, -1.465782, 0, 1, 0.5803922, 1,
-0.2156775, 0.5202978, 0.03299725, 0, 1, 0.5843138, 1,
-0.2130342, 0.6722196, 0.5342516, 0, 1, 0.5921569, 1,
-0.2125409, -1.489976, -3.089396, 0, 1, 0.5960785, 1,
-0.2075028, 0.4147335, 0.4224745, 0, 1, 0.6039216, 1,
-0.2067873, 1.568793, -0.6210061, 0, 1, 0.6117647, 1,
-0.2052225, -0.330383, -3.680302, 0, 1, 0.6156863, 1,
-0.2037381, -0.2116404, -2.779616, 0, 1, 0.6235294, 1,
-0.1997799, 0.07333239, -1.21855, 0, 1, 0.627451, 1,
-0.1887973, 0.345869, -0.3785388, 0, 1, 0.6352941, 1,
-0.1863278, 0.09239983, -1.163689, 0, 1, 0.6392157, 1,
-0.177412, 0.3184314, 1.069795, 0, 1, 0.6470588, 1,
-0.1747244, -0.6246888, -3.970647, 0, 1, 0.6509804, 1,
-0.1736504, 0.3809063, -1.03698, 0, 1, 0.6588235, 1,
-0.1714266, -0.8151541, -2.272911, 0, 1, 0.6627451, 1,
-0.1713426, 0.6200119, 2.443358, 0, 1, 0.6705883, 1,
-0.1675041, 1.262424, -1.052101, 0, 1, 0.6745098, 1,
-0.1634157, 1.703662, -1.422948, 0, 1, 0.682353, 1,
-0.1613762, 0.7757281, -0.3070126, 0, 1, 0.6862745, 1,
-0.1607294, -0.529844, -4.12298, 0, 1, 0.6941177, 1,
-0.1531491, 1.384169, 0.6314697, 0, 1, 0.7019608, 1,
-0.1526455, 0.002274574, -0.8573684, 0, 1, 0.7058824, 1,
-0.1511809, -1.706308, -0.8240157, 0, 1, 0.7137255, 1,
-0.1506769, -1.017867, -3.515467, 0, 1, 0.7176471, 1,
-0.1503448, 0.7620718, 0.3786105, 0, 1, 0.7254902, 1,
-0.1486452, 0.6814045, 0.6650231, 0, 1, 0.7294118, 1,
-0.1481607, 0.6182344, -0.4287573, 0, 1, 0.7372549, 1,
-0.1478343, 0.5705882, -0.1431388, 0, 1, 0.7411765, 1,
-0.1469987, 1.587334, 0.1120004, 0, 1, 0.7490196, 1,
-0.1420077, -0.1370298, -2.686273, 0, 1, 0.7529412, 1,
-0.1410282, 0.2221603, -0.04635683, 0, 1, 0.7607843, 1,
-0.1376284, -0.1682494, -2.764635, 0, 1, 0.7647059, 1,
-0.1352558, -2.414141, -4.817991, 0, 1, 0.772549, 1,
-0.1338685, -0.06786686, -2.720656, 0, 1, 0.7764706, 1,
-0.1336776, 1.069212, 0.5333483, 0, 1, 0.7843137, 1,
-0.129682, 3.315701, 0.3558729, 0, 1, 0.7882353, 1,
-0.1292831, 2.346256, -0.730076, 0, 1, 0.7960784, 1,
-0.1292316, 0.597532, -0.5700748, 0, 1, 0.8039216, 1,
-0.1252513, -1.440836, -2.265277, 0, 1, 0.8078431, 1,
-0.1236019, -0.5987915, -3.949053, 0, 1, 0.8156863, 1,
-0.1226859, -0.2511741, -3.085147, 0, 1, 0.8196079, 1,
-0.121167, -1.074156, -2.05823, 0, 1, 0.827451, 1,
-0.1204261, 0.220731, -0.6989156, 0, 1, 0.8313726, 1,
-0.1190637, 0.1331445, 0.170409, 0, 1, 0.8392157, 1,
-0.1174662, 0.1023426, -2.825159, 0, 1, 0.8431373, 1,
-0.1113884, 0.7273724, -1.52358, 0, 1, 0.8509804, 1,
-0.1100233, -0.7917453, -3.714355, 0, 1, 0.854902, 1,
-0.1092154, -1.10893, -3.471505, 0, 1, 0.8627451, 1,
-0.1034086, -1.163067, -2.420805, 0, 1, 0.8666667, 1,
-0.09904931, 1.149372, 1.46918, 0, 1, 0.8745098, 1,
-0.09582444, -1.370817, -3.253012, 0, 1, 0.8784314, 1,
-0.09570504, 0.3051533, -0.04174285, 0, 1, 0.8862745, 1,
-0.09398764, 1.328343, -0.1759253, 0, 1, 0.8901961, 1,
-0.091745, -0.95705, -4.596955, 0, 1, 0.8980392, 1,
-0.08789054, 0.9535685, 0.2092703, 0, 1, 0.9058824, 1,
-0.08666773, -0.6570227, -2.878413, 0, 1, 0.9098039, 1,
-0.08655433, -1.80989, -2.555264, 0, 1, 0.9176471, 1,
-0.08589841, 1.582325, -0.07665787, 0, 1, 0.9215686, 1,
-0.08536973, 0.1344793, 1.130159, 0, 1, 0.9294118, 1,
-0.08324789, -0.8281348, -2.360287, 0, 1, 0.9333333, 1,
-0.08310797, 0.2107307, -1.504117, 0, 1, 0.9411765, 1,
-0.08231431, -0.7999303, -3.147543, 0, 1, 0.945098, 1,
-0.08113535, -2.091204, -2.709529, 0, 1, 0.9529412, 1,
-0.07470918, -2.531923, -3.932164, 0, 1, 0.9568627, 1,
-0.07420721, -0.01214777, -1.46373, 0, 1, 0.9647059, 1,
-0.07091934, -0.6845526, -2.984312, 0, 1, 0.9686275, 1,
-0.06929383, -0.1809696, -2.044842, 0, 1, 0.9764706, 1,
-0.06578575, -1.660405, -4.193552, 0, 1, 0.9803922, 1,
-0.06431723, 0.1631432, -0.1058385, 0, 1, 0.9882353, 1,
-0.06027286, -0.3688532, -2.684555, 0, 1, 0.9921569, 1,
-0.05459764, -0.08962995, -2.318789, 0, 1, 1, 1,
-0.05316557, 0.7101276, -0.96466, 0, 0.9921569, 1, 1,
-0.05227344, 1.256161, 0.6128348, 0, 0.9882353, 1, 1,
-0.04708453, 1.170925, 1.44983, 0, 0.9803922, 1, 1,
-0.04612045, -0.5225641, -4.532155, 0, 0.9764706, 1, 1,
-0.04572519, -0.1997388, -4.45014, 0, 0.9686275, 1, 1,
-0.0445326, 1.763747, -0.2962915, 0, 0.9647059, 1, 1,
-0.03303002, 0.3263794, 1.146683, 0, 0.9568627, 1, 1,
-0.03233214, 0.7820501, 0.3541824, 0, 0.9529412, 1, 1,
-0.02595196, 0.6245292, -0.7419311, 0, 0.945098, 1, 1,
-0.02469091, 1.691165, -0.6118512, 0, 0.9411765, 1, 1,
-0.02369641, -0.5983211, -2.385412, 0, 0.9333333, 1, 1,
-0.01862928, -1.347694, -3.639564, 0, 0.9294118, 1, 1,
-0.0002354672, 1.21683, 1.29468, 0, 0.9215686, 1, 1,
0.0002706029, 1.840443, -1.730386, 0, 0.9176471, 1, 1,
0.005581066, -1.325587, 3.152217, 0, 0.9098039, 1, 1,
0.007465791, 0.5199281, -0.7106455, 0, 0.9058824, 1, 1,
0.009120084, 0.5360851, 1.253592, 0, 0.8980392, 1, 1,
0.01495166, 0.2532259, -0.8368496, 0, 0.8901961, 1, 1,
0.01665354, 0.02019486, 0.5399323, 0, 0.8862745, 1, 1,
0.01742946, 1.035492, -1.938893, 0, 0.8784314, 1, 1,
0.01766591, -0.3702954, 1.396292, 0, 0.8745098, 1, 1,
0.01862265, -0.3528785, 4.643673, 0, 0.8666667, 1, 1,
0.01940658, -0.2999753, 2.917, 0, 0.8627451, 1, 1,
0.02182617, 0.3319329, -0.6277413, 0, 0.854902, 1, 1,
0.02445746, -1.22532, 3.508982, 0, 0.8509804, 1, 1,
0.02466757, 0.7010252, 1.784147, 0, 0.8431373, 1, 1,
0.02648992, -0.1824422, 3.276531, 0, 0.8392157, 1, 1,
0.03642005, 0.5046185, 0.7530019, 0, 0.8313726, 1, 1,
0.04095475, -0.5329738, 3.527364, 0, 0.827451, 1, 1,
0.0436073, 0.03466538, 0.9230942, 0, 0.8196079, 1, 1,
0.04618825, -0.206272, 4.716822, 0, 0.8156863, 1, 1,
0.04708239, -1.5136, 4.735097, 0, 0.8078431, 1, 1,
0.04764394, 0.6104876, -0.1201344, 0, 0.8039216, 1, 1,
0.04832128, 0.09387467, 1.869656, 0, 0.7960784, 1, 1,
0.04888571, -0.2031514, 3.476638, 0, 0.7882353, 1, 1,
0.05044961, 0.407483, 0.5676856, 0, 0.7843137, 1, 1,
0.05092307, -1.316358, 2.095399, 0, 0.7764706, 1, 1,
0.05113895, -0.7494416, 3.716058, 0, 0.772549, 1, 1,
0.05190865, -1.99966, 2.551263, 0, 0.7647059, 1, 1,
0.05248225, 0.2814674, -1.260204, 0, 0.7607843, 1, 1,
0.05277391, 0.2218519, -0.4143834, 0, 0.7529412, 1, 1,
0.05378138, -0.6284311, 3.303388, 0, 0.7490196, 1, 1,
0.06686418, -1.232053, 2.950114, 0, 0.7411765, 1, 1,
0.06706366, 2.673919, -1.172775, 0, 0.7372549, 1, 1,
0.0730124, 0.9470724, 0.1469486, 0, 0.7294118, 1, 1,
0.07314865, -1.011667, 3.632144, 0, 0.7254902, 1, 1,
0.07339697, -1.415979, 4.050111, 0, 0.7176471, 1, 1,
0.08261807, 0.9463809, -0.1246273, 0, 0.7137255, 1, 1,
0.08323912, -1.161772, 3.101049, 0, 0.7058824, 1, 1,
0.08332465, 0.09579525, 1.179448, 0, 0.6980392, 1, 1,
0.08440805, -1.063834, 4.167956, 0, 0.6941177, 1, 1,
0.08708761, 0.7008836, 0.6447257, 0, 0.6862745, 1, 1,
0.09535961, -1.481175, 3.926623, 0, 0.682353, 1, 1,
0.09540573, -0.7411067, 4.180255, 0, 0.6745098, 1, 1,
0.09682401, 0.6945505, 0.7244925, 0, 0.6705883, 1, 1,
0.09941349, 0.1744309, 1.123243, 0, 0.6627451, 1, 1,
0.1051462, 1.174428, 0.7363368, 0, 0.6588235, 1, 1,
0.1104951, -0.5587589, 3.528637, 0, 0.6509804, 1, 1,
0.1120624, -0.5957171, 2.958724, 0, 0.6470588, 1, 1,
0.1192216, 0.6906953, -0.8044187, 0, 0.6392157, 1, 1,
0.1194228, 0.6791264, -0.169644, 0, 0.6352941, 1, 1,
0.1208083, 0.1197772, 2.4755, 0, 0.627451, 1, 1,
0.1236667, 1.358659, 0.759097, 0, 0.6235294, 1, 1,
0.1243179, -0.05685619, 1.386136, 0, 0.6156863, 1, 1,
0.1250354, 0.3057125, -0.8727878, 0, 0.6117647, 1, 1,
0.1257474, -1.636633, 2.442376, 0, 0.6039216, 1, 1,
0.1260698, 0.9113589, 1.365532, 0, 0.5960785, 1, 1,
0.1273701, -0.5266594, 3.284475, 0, 0.5921569, 1, 1,
0.1318019, 1.329941, 2.62719, 0, 0.5843138, 1, 1,
0.1379366, -0.3440728, 2.897459, 0, 0.5803922, 1, 1,
0.1385355, -0.1391956, 2.575337, 0, 0.572549, 1, 1,
0.1391905, 0.8580787, 0.4378893, 0, 0.5686275, 1, 1,
0.1396836, 1.570154, 0.6783785, 0, 0.5607843, 1, 1,
0.1435768, 0.290702, 2.014065, 0, 0.5568628, 1, 1,
0.1481078, -0.7842053, 2.53121, 0, 0.5490196, 1, 1,
0.1595961, 0.2069302, 2.514859, 0, 0.5450981, 1, 1,
0.1613107, -1.583284, 3.91756, 0, 0.5372549, 1, 1,
0.161769, -1.957176, 4.545923, 0, 0.5333334, 1, 1,
0.1625921, -2.099131, 2.348367, 0, 0.5254902, 1, 1,
0.1635151, 2.185486, 0.4933551, 0, 0.5215687, 1, 1,
0.164009, 0.2274868, 0.549252, 0, 0.5137255, 1, 1,
0.1715545, 1.485854, 0.7530282, 0, 0.509804, 1, 1,
0.1760077, 0.7989866, -0.6369281, 0, 0.5019608, 1, 1,
0.1789705, -0.1501782, 0.9498078, 0, 0.4941176, 1, 1,
0.179171, -0.5970969, 3.431468, 0, 0.4901961, 1, 1,
0.1872848, 0.7540867, -0.4735161, 0, 0.4823529, 1, 1,
0.1877708, 1.917937, 1.478502, 0, 0.4784314, 1, 1,
0.190289, -0.2630817, 2.208081, 0, 0.4705882, 1, 1,
0.1909237, 0.3345067, 2.118651, 0, 0.4666667, 1, 1,
0.193084, -0.64472, 2.881635, 0, 0.4588235, 1, 1,
0.1943259, -0.9409772, 3.282696, 0, 0.454902, 1, 1,
0.19613, -0.1871456, 1.991282, 0, 0.4470588, 1, 1,
0.20496, -0.3197738, 2.421947, 0, 0.4431373, 1, 1,
0.2067151, 1.021677, 1.619297, 0, 0.4352941, 1, 1,
0.2069262, -1.201163, 3.301262, 0, 0.4313726, 1, 1,
0.2070239, -2.539179, 3.351173, 0, 0.4235294, 1, 1,
0.2074721, -0.4013658, 2.990257, 0, 0.4196078, 1, 1,
0.207652, 0.01191566, 1.870513, 0, 0.4117647, 1, 1,
0.2083994, -0.901355, 5.034297, 0, 0.4078431, 1, 1,
0.2103223, 0.6253965, -0.1669865, 0, 0.4, 1, 1,
0.2140678, 0.3870484, 1.763886, 0, 0.3921569, 1, 1,
0.2165724, 0.2924187, -0.1578575, 0, 0.3882353, 1, 1,
0.2181158, 0.06661217, 1.64888, 0, 0.3803922, 1, 1,
0.2193987, 1.279482, -2.039966, 0, 0.3764706, 1, 1,
0.2226989, 0.3633618, 1.789038, 0, 0.3686275, 1, 1,
0.2243948, 0.6223245, 0.01943052, 0, 0.3647059, 1, 1,
0.2254287, 0.2803679, 0.7372048, 0, 0.3568628, 1, 1,
0.2258294, -0.7313527, 2.419916, 0, 0.3529412, 1, 1,
0.2278613, 0.2599262, 0.9811788, 0, 0.345098, 1, 1,
0.2290227, -0.4786371, 0.8782592, 0, 0.3411765, 1, 1,
0.2297795, 1.177858, -1.005629, 0, 0.3333333, 1, 1,
0.2349216, -0.09729046, 0.5987424, 0, 0.3294118, 1, 1,
0.2364806, -1.143512, 1.84098, 0, 0.3215686, 1, 1,
0.2423431, -1.272809, 1.556533, 0, 0.3176471, 1, 1,
0.2448511, -1.11695, 3.050806, 0, 0.3098039, 1, 1,
0.2500239, 0.4919723, 0.9366608, 0, 0.3058824, 1, 1,
0.2540527, 0.9828401, 0.6703858, 0, 0.2980392, 1, 1,
0.25555, -1.166112, 3.682287, 0, 0.2901961, 1, 1,
0.2578182, -0.364285, 2.309986, 0, 0.2862745, 1, 1,
0.2601127, 0.4012333, 0.4849426, 0, 0.2784314, 1, 1,
0.2624855, -0.6135318, 1.430135, 0, 0.2745098, 1, 1,
0.2629941, -0.009794147, 0.8942826, 0, 0.2666667, 1, 1,
0.2658513, 1.266641, 1.398813, 0, 0.2627451, 1, 1,
0.2662805, -1.939184, 4.609804, 0, 0.254902, 1, 1,
0.2679708, 0.319373, 2.257416, 0, 0.2509804, 1, 1,
0.2713619, 0.04914634, 1.220403, 0, 0.2431373, 1, 1,
0.2728129, -0.7707403, 2.518709, 0, 0.2392157, 1, 1,
0.2788796, -0.7831317, 4.392494, 0, 0.2313726, 1, 1,
0.2804372, -0.6115078, 3.929554, 0, 0.227451, 1, 1,
0.2818233, 1.878066, 0.6102731, 0, 0.2196078, 1, 1,
0.2833179, -0.8251892, 1.732122, 0, 0.2156863, 1, 1,
0.2913169, -0.8037631, 2.315703, 0, 0.2078431, 1, 1,
0.2941362, -0.9728655, 3.244604, 0, 0.2039216, 1, 1,
0.2965824, 0.562673, 1.355783, 0, 0.1960784, 1, 1,
0.3005136, 0.2312374, 0.4901569, 0, 0.1882353, 1, 1,
0.3010999, -0.9732688, 3.915216, 0, 0.1843137, 1, 1,
0.3025892, 1.441631, -0.8336964, 0, 0.1764706, 1, 1,
0.3045324, -0.4487675, 4.432671, 0, 0.172549, 1, 1,
0.3074165, 1.520302, 0.9571368, 0, 0.1647059, 1, 1,
0.3096578, 0.9424512, 1.50071, 0, 0.1607843, 1, 1,
0.3115843, 1.626127, 0.6131543, 0, 0.1529412, 1, 1,
0.3118666, 1.097079, -0.5760167, 0, 0.1490196, 1, 1,
0.312138, -1.061167, 2.128494, 0, 0.1411765, 1, 1,
0.3121957, 1.096324, -0.1954171, 0, 0.1372549, 1, 1,
0.3203454, -0.2654452, 2.36679, 0, 0.1294118, 1, 1,
0.3287375, 0.01243008, 2.395696, 0, 0.1254902, 1, 1,
0.3304187, 0.1906755, 1.455817, 0, 0.1176471, 1, 1,
0.3322925, 0.8210628, -1.12776, 0, 0.1137255, 1, 1,
0.3333835, -0.1452702, 1.327915, 0, 0.1058824, 1, 1,
0.3334323, -0.03444642, 2.185213, 0, 0.09803922, 1, 1,
0.3391693, 1.151155, -0.1701112, 0, 0.09411765, 1, 1,
0.3416331, 0.7312019, 0.613085, 0, 0.08627451, 1, 1,
0.3421235, -0.9248398, 3.580747, 0, 0.08235294, 1, 1,
0.3435784, -1.88211, 2.268228, 0, 0.07450981, 1, 1,
0.3468192, 0.7455797, 1.512547, 0, 0.07058824, 1, 1,
0.3528591, 1.852256, -0.6553644, 0, 0.0627451, 1, 1,
0.3531801, -0.5689091, 2.36473, 0, 0.05882353, 1, 1,
0.3542501, 2.083113, 2.001472, 0, 0.05098039, 1, 1,
0.3558642, -0.2245068, 4.05802, 0, 0.04705882, 1, 1,
0.3573005, -2.13085, 5.074688, 0, 0.03921569, 1, 1,
0.36487, -1.475777, 1.773052, 0, 0.03529412, 1, 1,
0.3664904, 0.2558127, 0.2974745, 0, 0.02745098, 1, 1,
0.3711194, 0.9126391, 2.736239, 0, 0.02352941, 1, 1,
0.3733455, -1.286592, 2.506303, 0, 0.01568628, 1, 1,
0.3753367, 0.8516016, 0.1043315, 0, 0.01176471, 1, 1,
0.3753884, -1.023029, 3.357352, 0, 0.003921569, 1, 1,
0.3755135, 0.6341452, 1.640856, 0.003921569, 0, 1, 1,
0.3762282, -0.661817, 2.969651, 0.007843138, 0, 1, 1,
0.3792011, 0.152478, 1.20801, 0.01568628, 0, 1, 1,
0.3801244, 0.209673, -0.2260861, 0.01960784, 0, 1, 1,
0.3802097, -0.9754537, 1.513032, 0.02745098, 0, 1, 1,
0.3809312, 0.07760897, 1.445959, 0.03137255, 0, 1, 1,
0.3810283, 1.926392, -0.06620608, 0.03921569, 0, 1, 1,
0.3850941, 1.092994, 1.609305, 0.04313726, 0, 1, 1,
0.3862956, -1.544676, 2.544379, 0.05098039, 0, 1, 1,
0.3868991, -0.7599494, 2.172038, 0.05490196, 0, 1, 1,
0.3972751, 0.4629341, 0.4358456, 0.0627451, 0, 1, 1,
0.4044292, 0.3009187, -0.1002714, 0.06666667, 0, 1, 1,
0.4122607, -1.986864, 3.795991, 0.07450981, 0, 1, 1,
0.4160662, 1.497999, 1.20087, 0.07843138, 0, 1, 1,
0.4170884, -0.3014798, 3.364985, 0.08627451, 0, 1, 1,
0.4189015, -0.06093707, 1.334309, 0.09019608, 0, 1, 1,
0.4212194, 0.375057, 1.575694, 0.09803922, 0, 1, 1,
0.4213566, 0.695857, 0.5518205, 0.1058824, 0, 1, 1,
0.4218943, -0.4058126, 2.091492, 0.1098039, 0, 1, 1,
0.4237412, -0.4591315, 2.118351, 0.1176471, 0, 1, 1,
0.4249619, 0.7618693, 0.4692227, 0.1215686, 0, 1, 1,
0.4252503, 1.784706, -0.2130462, 0.1294118, 0, 1, 1,
0.4298499, -0.7167156, 1.423646, 0.1333333, 0, 1, 1,
0.4316216, -1.645142, 2.590757, 0.1411765, 0, 1, 1,
0.4364747, 0.9356847, -0.2223607, 0.145098, 0, 1, 1,
0.4368666, -0.2658717, 1.033706, 0.1529412, 0, 1, 1,
0.4409781, -0.2520314, 2.574163, 0.1568628, 0, 1, 1,
0.441586, 0.007206272, 1.350308, 0.1647059, 0, 1, 1,
0.4455367, 0.8408404, 0.09940878, 0.1686275, 0, 1, 1,
0.4464414, 0.06810591, 2.446089, 0.1764706, 0, 1, 1,
0.4466087, 1.17689, -0.5684252, 0.1803922, 0, 1, 1,
0.4482499, -0.3931583, 3.028951, 0.1882353, 0, 1, 1,
0.4538744, 0.728686, 0.4612992, 0.1921569, 0, 1, 1,
0.4553778, -0.469153, 2.397382, 0.2, 0, 1, 1,
0.4572507, -1.991393, 1.735306, 0.2078431, 0, 1, 1,
0.4624413, -1.271327, 3.570951, 0.2117647, 0, 1, 1,
0.4695717, -0.386724, 2.642796, 0.2196078, 0, 1, 1,
0.4725728, 0.2558463, 1.579736, 0.2235294, 0, 1, 1,
0.4730884, 1.508185, -0.5308191, 0.2313726, 0, 1, 1,
0.4755578, 1.512477, 0.09221095, 0.2352941, 0, 1, 1,
0.4835117, 0.5369164, -0.1270947, 0.2431373, 0, 1, 1,
0.4843839, -0.5820507, 1.671042, 0.2470588, 0, 1, 1,
0.4857008, -2.533443, 2.623638, 0.254902, 0, 1, 1,
0.4899072, -1.489524, 1.379699, 0.2588235, 0, 1, 1,
0.491288, 0.04079968, 0.8329808, 0.2666667, 0, 1, 1,
0.4977899, -0.06120053, 1.146876, 0.2705882, 0, 1, 1,
0.5031417, 1.18994, -0.1999999, 0.2784314, 0, 1, 1,
0.5057414, 0.3994314, 0.9955049, 0.282353, 0, 1, 1,
0.5080384, 0.8332209, 0.510003, 0.2901961, 0, 1, 1,
0.513445, 0.2208551, 1.842823, 0.2941177, 0, 1, 1,
0.5148102, 1.256741, 0.3719559, 0.3019608, 0, 1, 1,
0.5153335, -0.04738169, 2.826692, 0.3098039, 0, 1, 1,
0.5170902, 1.533235, 0.2401878, 0.3137255, 0, 1, 1,
0.5226026, -2.325986, 3.143321, 0.3215686, 0, 1, 1,
0.5238897, -1.249956, 1.885499, 0.3254902, 0, 1, 1,
0.5245546, 2.034256, -1.02451, 0.3333333, 0, 1, 1,
0.5250862, -0.7741101, 3.768414, 0.3372549, 0, 1, 1,
0.5264543, 1.52038, -1.658858, 0.345098, 0, 1, 1,
0.5290823, 0.6668362, -0.5713592, 0.3490196, 0, 1, 1,
0.5380297, 0.9789796, 0.6281582, 0.3568628, 0, 1, 1,
0.5477947, 0.05655612, 1.809248, 0.3607843, 0, 1, 1,
0.5553159, -0.9196948, 1.66134, 0.3686275, 0, 1, 1,
0.5556969, 0.03553443, 2.371523, 0.372549, 0, 1, 1,
0.5619785, 0.2686491, 1.610449, 0.3803922, 0, 1, 1,
0.5650222, 0.8705352, 1.699384, 0.3843137, 0, 1, 1,
0.5666731, 0.2110158, 2.467623, 0.3921569, 0, 1, 1,
0.5682742, -0.3509663, 4.385295, 0.3960784, 0, 1, 1,
0.5708842, 0.002655866, 0.3800286, 0.4039216, 0, 1, 1,
0.5726587, -0.4390286, 1.985365, 0.4117647, 0, 1, 1,
0.5825664, -0.3273822, 0.4427749, 0.4156863, 0, 1, 1,
0.5841464, 1.339507, 3.178361, 0.4235294, 0, 1, 1,
0.5843112, -0.3472445, 4.256436, 0.427451, 0, 1, 1,
0.5860338, -0.3921384, 2.565451, 0.4352941, 0, 1, 1,
0.5870714, 1.36682, -1.021122, 0.4392157, 0, 1, 1,
0.5871804, -2.284872, 2.43771, 0.4470588, 0, 1, 1,
0.5920836, 0.4133064, -0.8203412, 0.4509804, 0, 1, 1,
0.5946133, 1.201484, 0.5983579, 0.4588235, 0, 1, 1,
0.5946638, 0.4546512, -0.5070139, 0.4627451, 0, 1, 1,
0.5955883, 0.575194, 0.7627475, 0.4705882, 0, 1, 1,
0.6000605, 0.4636455, 0.7753499, 0.4745098, 0, 1, 1,
0.606741, -2.431164, 1.968772, 0.4823529, 0, 1, 1,
0.6086122, 1.28132, -0.06045114, 0.4862745, 0, 1, 1,
0.625013, 0.6738755, 0.1083059, 0.4941176, 0, 1, 1,
0.625754, 0.9802306, -0.4360892, 0.5019608, 0, 1, 1,
0.6268927, -0.8198964, 0.9458044, 0.5058824, 0, 1, 1,
0.627695, 0.2671468, 1.802857, 0.5137255, 0, 1, 1,
0.6379312, -0.9152532, 2.56367, 0.5176471, 0, 1, 1,
0.6387823, 1.441779, -1.468574, 0.5254902, 0, 1, 1,
0.6431783, -0.5047518, 0.783426, 0.5294118, 0, 1, 1,
0.6433186, -1.5627, 3.239567, 0.5372549, 0, 1, 1,
0.6442018, 1.365585, -0.1238714, 0.5411765, 0, 1, 1,
0.6452515, -0.613058, 2.379417, 0.5490196, 0, 1, 1,
0.6455357, -0.01824285, 2.285789, 0.5529412, 0, 1, 1,
0.646936, -0.5243719, 2.828638, 0.5607843, 0, 1, 1,
0.6491442, -1.317039, 1.393708, 0.5647059, 0, 1, 1,
0.6504874, 0.7009621, 0.7849824, 0.572549, 0, 1, 1,
0.6658148, -0.0349327, 1.414146, 0.5764706, 0, 1, 1,
0.666549, 0.2522036, 1.176399, 0.5843138, 0, 1, 1,
0.667046, 0.3579754, -0.64568, 0.5882353, 0, 1, 1,
0.6685238, -0.1160181, 1.489845, 0.5960785, 0, 1, 1,
0.6714403, 0.09806015, 2.868196, 0.6039216, 0, 1, 1,
0.6724998, -1.035233, 4.091847, 0.6078432, 0, 1, 1,
0.6746849, 0.808151, 1.623772, 0.6156863, 0, 1, 1,
0.6769785, 1.185786, 0.9151134, 0.6196079, 0, 1, 1,
0.6794653, -0.1360626, 1.166827, 0.627451, 0, 1, 1,
0.6798939, -2.721463, 2.706982, 0.6313726, 0, 1, 1,
0.6817954, 0.4495029, 2.160294, 0.6392157, 0, 1, 1,
0.6836186, 1.650133, 0.5912156, 0.6431373, 0, 1, 1,
0.689229, -0.1881069, 1.114496, 0.6509804, 0, 1, 1,
0.6909574, -0.7614841, 2.985835, 0.654902, 0, 1, 1,
0.694119, 0.6904948, 0.2951817, 0.6627451, 0, 1, 1,
0.6983073, -0.1903646, 1.97491, 0.6666667, 0, 1, 1,
0.7014203, 0.6048651, 0.9996742, 0.6745098, 0, 1, 1,
0.7018514, -0.1615164, 1.388656, 0.6784314, 0, 1, 1,
0.7019816, 0.5709542, 0.927406, 0.6862745, 0, 1, 1,
0.7045839, 1.000276, 1.767404, 0.6901961, 0, 1, 1,
0.7076494, -2.249625, 1.580294, 0.6980392, 0, 1, 1,
0.7110012, -0.02682451, 0.7159263, 0.7058824, 0, 1, 1,
0.7122226, -1.132723, 1.824898, 0.7098039, 0, 1, 1,
0.7137054, 0.5932619, 0.5950442, 0.7176471, 0, 1, 1,
0.7213536, 0.09305854, 1.326174, 0.7215686, 0, 1, 1,
0.7328788, 1.796145, -0.39744, 0.7294118, 0, 1, 1,
0.7373503, -0.236009, 1.690315, 0.7333333, 0, 1, 1,
0.7397142, -1.712497, 3.970064, 0.7411765, 0, 1, 1,
0.7398387, -0.5789602, 3.039922, 0.7450981, 0, 1, 1,
0.7476703, 0.001084455, 2.125806, 0.7529412, 0, 1, 1,
0.7508248, 0.9661888, 0.1504925, 0.7568628, 0, 1, 1,
0.7535302, -0.6866798, 4.596544, 0.7647059, 0, 1, 1,
0.7565392, 2.190684, -1.674984, 0.7686275, 0, 1, 1,
0.7583577, 0.03338161, 0.7171825, 0.7764706, 0, 1, 1,
0.7651355, 0.2337929, 0.9834888, 0.7803922, 0, 1, 1,
0.7683944, -0.09992409, 1.707956, 0.7882353, 0, 1, 1,
0.7735302, -0.3194206, 2.363187, 0.7921569, 0, 1, 1,
0.7735347, -0.4753058, 2.49158, 0.8, 0, 1, 1,
0.7763743, 2.013223, -0.2496475, 0.8078431, 0, 1, 1,
0.7768536, -0.3961611, 1.850074, 0.8117647, 0, 1, 1,
0.7777888, -0.1910235, 1.052256, 0.8196079, 0, 1, 1,
0.7840429, 0.08130454, 1.048735, 0.8235294, 0, 1, 1,
0.7850692, -0.5271457, 0.9223933, 0.8313726, 0, 1, 1,
0.7931548, 0.9810371, 1.948347, 0.8352941, 0, 1, 1,
0.7975972, -2.977401, 2.835322, 0.8431373, 0, 1, 1,
0.8014628, 1.106724, 2.264521, 0.8470588, 0, 1, 1,
0.8083422, -0.4489132, 1.263593, 0.854902, 0, 1, 1,
0.8083972, 0.3334529, 3.070293, 0.8588235, 0, 1, 1,
0.8089254, -0.08553687, 3.19647, 0.8666667, 0, 1, 1,
0.8160415, 2.393131, 1.617678, 0.8705882, 0, 1, 1,
0.8198109, -0.06792403, -0.05868938, 0.8784314, 0, 1, 1,
0.8231142, 1.163533, 1.746831, 0.8823529, 0, 1, 1,
0.8242068, 1.009478, 0.7811916, 0.8901961, 0, 1, 1,
0.8257861, 1.240013, -0.1280099, 0.8941177, 0, 1, 1,
0.8305403, 0.6591223, 0.4671305, 0.9019608, 0, 1, 1,
0.8310307, 1.112167, 1.119287, 0.9098039, 0, 1, 1,
0.8317765, -0.9259096, 2.610293, 0.9137255, 0, 1, 1,
0.8335995, 1.045176, -0.4663026, 0.9215686, 0, 1, 1,
0.8365021, -1.138307, 2.825133, 0.9254902, 0, 1, 1,
0.8420573, -0.8255476, 3.434193, 0.9333333, 0, 1, 1,
0.8439778, -1.134919, 1.83646, 0.9372549, 0, 1, 1,
0.8459859, 0.2595696, 2.091003, 0.945098, 0, 1, 1,
0.8461928, 1.170488, 0.6379958, 0.9490196, 0, 1, 1,
0.847114, -0.3620068, 2.245493, 0.9568627, 0, 1, 1,
0.8475312, -0.4439959, 3.167805, 0.9607843, 0, 1, 1,
0.8500954, 0.003626007, 1.604363, 0.9686275, 0, 1, 1,
0.854532, 1.896304, 0.921428, 0.972549, 0, 1, 1,
0.8554065, 0.8720197, 1.246877, 0.9803922, 0, 1, 1,
0.8580707, 0.7359784, 1.270945, 0.9843137, 0, 1, 1,
0.8639743, 1.053767, 1.143214, 0.9921569, 0, 1, 1,
0.8640525, 0.452316, 0.0291023, 0.9960784, 0, 1, 1,
0.8649306, -1.646794, 2.290398, 1, 0, 0.9960784, 1,
0.8721199, -0.6504162, 1.487909, 1, 0, 0.9882353, 1,
0.8745774, -0.07751958, 1.414619, 1, 0, 0.9843137, 1,
0.8827065, -0.2181239, 2.658217, 1, 0, 0.9764706, 1,
0.8888521, 0.4674639, 1.225993, 1, 0, 0.972549, 1,
0.8893539, -0.9159241, 2.282688, 1, 0, 0.9647059, 1,
0.8959462, -0.9697024, 2.634509, 1, 0, 0.9607843, 1,
0.8963256, -1.050581, 1.293296, 1, 0, 0.9529412, 1,
0.9059926, -0.8130542, 0.6895197, 1, 0, 0.9490196, 1,
0.9071831, -0.967865, 1.197554, 1, 0, 0.9411765, 1,
0.9084744, -0.4474422, 2.797665, 1, 0, 0.9372549, 1,
0.9099362, 0.4072449, 0.2473465, 1, 0, 0.9294118, 1,
0.9154391, -0.2780888, 0.9706854, 1, 0, 0.9254902, 1,
0.9177395, 0.4035226, -0.9266043, 1, 0, 0.9176471, 1,
0.9178128, 0.2367381, 2.218682, 1, 0, 0.9137255, 1,
0.9236283, 1.60344, 0.07298006, 1, 0, 0.9058824, 1,
0.9293455, 0.0006906453, 0.8900063, 1, 0, 0.9019608, 1,
0.9304262, -0.482889, 2.436698, 1, 0, 0.8941177, 1,
0.9312535, -1.081739, 2.750539, 1, 0, 0.8862745, 1,
0.9433728, -1.504416, 4.517388, 1, 0, 0.8823529, 1,
0.9448222, 0.3178266, 1.782378, 1, 0, 0.8745098, 1,
0.9465825, 0.1634745, 1.828752, 1, 0, 0.8705882, 1,
0.9472904, 1.478982, 1.043942, 1, 0, 0.8627451, 1,
0.9475915, -0.2864359, 0.2773383, 1, 0, 0.8588235, 1,
0.9497855, -0.7762118, 2.978557, 1, 0, 0.8509804, 1,
0.9617347, 0.7153338, 0.04049752, 1, 0, 0.8470588, 1,
0.9628329, 1.808288, 0.6941107, 1, 0, 0.8392157, 1,
0.9745412, -1.425258, 2.513103, 1, 0, 0.8352941, 1,
0.990092, -1.000662, 4.218876, 1, 0, 0.827451, 1,
0.99312, -0.2344406, 2.539891, 1, 0, 0.8235294, 1,
0.9932314, 1.852196, 0.268911, 1, 0, 0.8156863, 1,
1.001141, -0.1738716, 0.6013934, 1, 0, 0.8117647, 1,
1.002116, 0.05336645, 1.871468, 1, 0, 0.8039216, 1,
1.003005, 1.284537, 2.139982, 1, 0, 0.7960784, 1,
1.007306, 0.3084171, 1.203142, 1, 0, 0.7921569, 1,
1.008454, -0.0067785, 0.1825994, 1, 0, 0.7843137, 1,
1.009325, 0.6305912, 1.647468, 1, 0, 0.7803922, 1,
1.012094, -0.9395995, 2.540334, 1, 0, 0.772549, 1,
1.012971, 0.4136318, 3.927269, 1, 0, 0.7686275, 1,
1.013227, -1.552887, 0.9888102, 1, 0, 0.7607843, 1,
1.013954, 0.6493098, 1.046346, 1, 0, 0.7568628, 1,
1.015075, 0.4266256, 4.124434, 1, 0, 0.7490196, 1,
1.016352, 0.2662377, 0.3126759, 1, 0, 0.7450981, 1,
1.017725, 0.4702526, 0.675872, 1, 0, 0.7372549, 1,
1.022246, 0.6513283, -0.5267673, 1, 0, 0.7333333, 1,
1.023101, 1.136204, 0.2444376, 1, 0, 0.7254902, 1,
1.026081, -0.8382566, 3.474406, 1, 0, 0.7215686, 1,
1.03673, 0.5709319, 0.819523, 1, 0, 0.7137255, 1,
1.036879, 0.2096971, 3.045929, 1, 0, 0.7098039, 1,
1.048126, -0.1749709, 0.7379739, 1, 0, 0.7019608, 1,
1.048749, 0.03749678, 0.8456839, 1, 0, 0.6941177, 1,
1.053641, 0.1648129, 1.981151, 1, 0, 0.6901961, 1,
1.057696, -0.4506895, 2.624479, 1, 0, 0.682353, 1,
1.068056, -0.2297977, 1.044674, 1, 0, 0.6784314, 1,
1.069441, -0.1513308, 2.021546, 1, 0, 0.6705883, 1,
1.069916, -0.4118976, 1.721014, 1, 0, 0.6666667, 1,
1.073171, -2.179463, 3.021677, 1, 0, 0.6588235, 1,
1.076336, -1.518256, 2.583028, 1, 0, 0.654902, 1,
1.076694, 0.2381399, 0.3752098, 1, 0, 0.6470588, 1,
1.080767, 1.943959, -0.2437368, 1, 0, 0.6431373, 1,
1.08176, -0.6579078, 1.759516, 1, 0, 0.6352941, 1,
1.090416, -0.4048904, 1.490193, 1, 0, 0.6313726, 1,
1.095217, -0.2848363, 3.632953, 1, 0, 0.6235294, 1,
1.097515, 0.3864098, 0.5727831, 1, 0, 0.6196079, 1,
1.102951, 0.4822783, 0.8227837, 1, 0, 0.6117647, 1,
1.106804, -1.0398, 3.373535, 1, 0, 0.6078432, 1,
1.119437, -2.496203, 2.348148, 1, 0, 0.6, 1,
1.123082, 0.2326899, 1.594061, 1, 0, 0.5921569, 1,
1.126297, -1.010231, 1.264385, 1, 0, 0.5882353, 1,
1.133705, -2.502735, 2.05628, 1, 0, 0.5803922, 1,
1.13916, -1.15352, 2.079939, 1, 0, 0.5764706, 1,
1.149713, -2.454782, 3.974408, 1, 0, 0.5686275, 1,
1.153519, -0.7521211, 1.635589, 1, 0, 0.5647059, 1,
1.155142, 0.9479455, 1.916973, 1, 0, 0.5568628, 1,
1.162555, 1.728459, 1.89175, 1, 0, 0.5529412, 1,
1.170346, -1.090943, 2.763667, 1, 0, 0.5450981, 1,
1.17349, -0.1008468, 1.006369, 1, 0, 0.5411765, 1,
1.179009, -1.548428, 2.346078, 1, 0, 0.5333334, 1,
1.184779, -0.3169628, 2.517776, 1, 0, 0.5294118, 1,
1.185443, -0.469566, 1.89349, 1, 0, 0.5215687, 1,
1.191517, -0.15845, 1.666729, 1, 0, 0.5176471, 1,
1.198606, -1.147981, 2.322393, 1, 0, 0.509804, 1,
1.2109, -0.7598852, 2.201002, 1, 0, 0.5058824, 1,
1.216555, 0.4684821, -0.4509223, 1, 0, 0.4980392, 1,
1.218077, -0.001516808, 2.739265, 1, 0, 0.4901961, 1,
1.23196, -0.9793265, 2.595926, 1, 0, 0.4862745, 1,
1.241401, -0.343701, -0.4225536, 1, 0, 0.4784314, 1,
1.24331, -0.6059155, 2.72578, 1, 0, 0.4745098, 1,
1.246228, -2.628908, 3.165939, 1, 0, 0.4666667, 1,
1.248876, 1.587159, -0.2437624, 1, 0, 0.4627451, 1,
1.251938, -0.7194921, 1.550396, 1, 0, 0.454902, 1,
1.255805, 0.01084448, -0.4790971, 1, 0, 0.4509804, 1,
1.262797, -1.12315, 3.510709, 1, 0, 0.4431373, 1,
1.268906, -0.1629447, 1.73229, 1, 0, 0.4392157, 1,
1.277816, 0.5627516, 0.05411534, 1, 0, 0.4313726, 1,
1.28199, 0.102042, 3.469424, 1, 0, 0.427451, 1,
1.289856, -0.2152966, 2.202567, 1, 0, 0.4196078, 1,
1.292162, 0.3256288, 0.0290681, 1, 0, 0.4156863, 1,
1.295822, 0.2197177, 0.7535526, 1, 0, 0.4078431, 1,
1.300253, -1.907658, 2.092575, 1, 0, 0.4039216, 1,
1.300558, -1.025336, 2.881551, 1, 0, 0.3960784, 1,
1.308799, 0.6354519, 1.026673, 1, 0, 0.3882353, 1,
1.314092, 1.087221, -1.174043, 1, 0, 0.3843137, 1,
1.316273, 0.06050524, 1.085852, 1, 0, 0.3764706, 1,
1.327161, -0.2936247, 2.092725, 1, 0, 0.372549, 1,
1.333439, -0.4870391, 3.25548, 1, 0, 0.3647059, 1,
1.334966, -0.1867494, 0.9963775, 1, 0, 0.3607843, 1,
1.352897, -1.437657, 1.005837, 1, 0, 0.3529412, 1,
1.36676, -0.673516, 0.9155324, 1, 0, 0.3490196, 1,
1.367178, -0.3040794, 2.468149, 1, 0, 0.3411765, 1,
1.368273, -2.155254, 2.701843, 1, 0, 0.3372549, 1,
1.373978, 0.2511075, 0.3825361, 1, 0, 0.3294118, 1,
1.387792, -0.1976921, -0.2628211, 1, 0, 0.3254902, 1,
1.39784, -0.1651634, 1.004746, 1, 0, 0.3176471, 1,
1.423648, 1.026885, 2.221675, 1, 0, 0.3137255, 1,
1.435026, -1.622597, 2.540165, 1, 0, 0.3058824, 1,
1.445723, -0.8203136, 1.482099, 1, 0, 0.2980392, 1,
1.468185, 1.819071, 1.827696, 1, 0, 0.2941177, 1,
1.472551, -0.1596896, 1.658146, 1, 0, 0.2862745, 1,
1.491348, 0.8127117, 0.7822281, 1, 0, 0.282353, 1,
1.508278, -0.7944708, 2.643668, 1, 0, 0.2745098, 1,
1.515877, -0.07597875, 0.2003283, 1, 0, 0.2705882, 1,
1.520659, -1.077631, 1.135547, 1, 0, 0.2627451, 1,
1.525102, 1.400456, -0.4081859, 1, 0, 0.2588235, 1,
1.538116, -1.904495, 2.882854, 1, 0, 0.2509804, 1,
1.554441, -0.4213415, 1.687143, 1, 0, 0.2470588, 1,
1.567191, -1.101364, 2.360398, 1, 0, 0.2392157, 1,
1.567747, 0.3954466, 2.154073, 1, 0, 0.2352941, 1,
1.588147, 0.2194033, 1.35739, 1, 0, 0.227451, 1,
1.604637, 1.750172, -0.5858898, 1, 0, 0.2235294, 1,
1.604838, -0.4729364, 3.026333, 1, 0, 0.2156863, 1,
1.611353, 0.7754337, 2.318114, 1, 0, 0.2117647, 1,
1.612996, -0.1621738, 2.088658, 1, 0, 0.2039216, 1,
1.626586, -0.1112412, 0.2357368, 1, 0, 0.1960784, 1,
1.641977, -0.5303568, 3.31931, 1, 0, 0.1921569, 1,
1.64382, -0.2038929, 2.697445, 1, 0, 0.1843137, 1,
1.648174, 0.9127481, 1.39396, 1, 0, 0.1803922, 1,
1.6499, 0.4199807, -0.2307654, 1, 0, 0.172549, 1,
1.65338, 0.9110983, 2.242399, 1, 0, 0.1686275, 1,
1.795259, -0.2487671, 0.6821624, 1, 0, 0.1607843, 1,
1.818864, -0.5310633, 2.38485, 1, 0, 0.1568628, 1,
1.822785, 1.977951, 0.2611641, 1, 0, 0.1490196, 1,
1.829834, 1.134042, 2.018883, 1, 0, 0.145098, 1,
1.87961, 2.188442, 1.38854, 1, 0, 0.1372549, 1,
1.891729, -0.1506255, 1.592231, 1, 0, 0.1333333, 1,
1.931225, 0.1263195, 2.139074, 1, 0, 0.1254902, 1,
2.07267, -0.1185905, 0.9314792, 1, 0, 0.1215686, 1,
2.081239, 0.2707754, 2.806748, 1, 0, 0.1137255, 1,
2.089315, -0.2081751, 1.822891, 1, 0, 0.1098039, 1,
2.089651, 0.5725669, 1.283077, 1, 0, 0.1019608, 1,
2.095846, 0.4007785, -0.8325983, 1, 0, 0.09411765, 1,
2.098824, -1.167562, 2.67787, 1, 0, 0.09019608, 1,
2.184608, 0.4546472, 1.380028, 1, 0, 0.08235294, 1,
2.275544, -0.5740412, 2.038928, 1, 0, 0.07843138, 1,
2.326959, 0.1410749, 2.694842, 1, 0, 0.07058824, 1,
2.329681, -0.07131932, 3.090497, 1, 0, 0.06666667, 1,
2.376256, -1.671098, 2.476206, 1, 0, 0.05882353, 1,
2.38011, 0.475781, -0.2178074, 1, 0, 0.05490196, 1,
2.454555, -0.0724967, 2.435994, 1, 0, 0.04705882, 1,
2.551125, 0.8322521, 2.808386, 1, 0, 0.04313726, 1,
2.569389, 0.2635856, 2.463075, 1, 0, 0.03529412, 1,
2.688985, -1.77292, 2.799143, 1, 0, 0.03137255, 1,
3.096637, 0.7963713, 2.665152, 1, 0, 0.02352941, 1,
3.21187, -0.2758082, 2.674307, 1, 0, 0.01960784, 1,
3.264273, -0.9621871, 2.477773, 1, 0, 0.01176471, 1,
3.372698, -0.5978664, 0.1654333, 1, 0, 0.007843138, 1
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
0.1340996, -4.068347, -6.4948, 0, -0.5, 0.5, 0.5,
0.1340996, -4.068347, -6.4948, 1, -0.5, 0.5, 0.5,
0.1340996, -4.068347, -6.4948, 1, 1.5, 0.5, 0.5,
0.1340996, -4.068347, -6.4948, 0, 1.5, 0.5, 0.5
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
-4.202384, 0.2407273, -6.4948, 0, -0.5, 0.5, 0.5,
-4.202384, 0.2407273, -6.4948, 1, -0.5, 0.5, 0.5,
-4.202384, 0.2407273, -6.4948, 1, 1.5, 0.5, 0.5,
-4.202384, 0.2407273, -6.4948, 0, 1.5, 0.5, 0.5
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
-4.202384, -4.068347, 0.1283486, 0, -0.5, 0.5, 0.5,
-4.202384, -4.068347, 0.1283486, 1, -0.5, 0.5, 0.5,
-4.202384, -4.068347, 0.1283486, 1, 1.5, 0.5, 0.5,
-4.202384, -4.068347, 0.1283486, 0, 1.5, 0.5, 0.5
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
-3, -3.073945, -4.966381,
3, -3.073945, -4.966381,
-3, -3.073945, -4.966381,
-3, -3.239678, -5.221117,
-2, -3.073945, -4.966381,
-2, -3.239678, -5.221117,
-1, -3.073945, -4.966381,
-1, -3.239678, -5.221117,
0, -3.073945, -4.966381,
0, -3.239678, -5.221117,
1, -3.073945, -4.966381,
1, -3.239678, -5.221117,
2, -3.073945, -4.966381,
2, -3.239678, -5.221117,
3, -3.073945, -4.966381,
3, -3.239678, -5.221117
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
-3, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
-3, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
-3, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
-3, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5,
-2, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
-2, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
-2, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
-2, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5,
-1, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
-1, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
-1, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
-1, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5,
0, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
0, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
0, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
0, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5,
1, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
1, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
1, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
1, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5,
2, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
2, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
2, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
2, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5,
3, -3.571146, -5.73059, 0, -0.5, 0.5, 0.5,
3, -3.571146, -5.73059, 1, -0.5, 0.5, 0.5,
3, -3.571146, -5.73059, 1, 1.5, 0.5, 0.5,
3, -3.571146, -5.73059, 0, 1.5, 0.5, 0.5
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
-3.201657, -2, -4.966381,
-3.201657, 3, -4.966381,
-3.201657, -2, -4.966381,
-3.368444, -2, -5.221117,
-3.201657, -1, -4.966381,
-3.368444, -1, -5.221117,
-3.201657, 0, -4.966381,
-3.368444, 0, -5.221117,
-3.201657, 1, -4.966381,
-3.368444, 1, -5.221117,
-3.201657, 2, -4.966381,
-3.368444, 2, -5.221117,
-3.201657, 3, -4.966381,
-3.368444, 3, -5.221117
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
-3.70202, -2, -5.73059, 0, -0.5, 0.5, 0.5,
-3.70202, -2, -5.73059, 1, -0.5, 0.5, 0.5,
-3.70202, -2, -5.73059, 1, 1.5, 0.5, 0.5,
-3.70202, -2, -5.73059, 0, 1.5, 0.5, 0.5,
-3.70202, -1, -5.73059, 0, -0.5, 0.5, 0.5,
-3.70202, -1, -5.73059, 1, -0.5, 0.5, 0.5,
-3.70202, -1, -5.73059, 1, 1.5, 0.5, 0.5,
-3.70202, -1, -5.73059, 0, 1.5, 0.5, 0.5,
-3.70202, 0, -5.73059, 0, -0.5, 0.5, 0.5,
-3.70202, 0, -5.73059, 1, -0.5, 0.5, 0.5,
-3.70202, 0, -5.73059, 1, 1.5, 0.5, 0.5,
-3.70202, 0, -5.73059, 0, 1.5, 0.5, 0.5,
-3.70202, 1, -5.73059, 0, -0.5, 0.5, 0.5,
-3.70202, 1, -5.73059, 1, -0.5, 0.5, 0.5,
-3.70202, 1, -5.73059, 1, 1.5, 0.5, 0.5,
-3.70202, 1, -5.73059, 0, 1.5, 0.5, 0.5,
-3.70202, 2, -5.73059, 0, -0.5, 0.5, 0.5,
-3.70202, 2, -5.73059, 1, -0.5, 0.5, 0.5,
-3.70202, 2, -5.73059, 1, 1.5, 0.5, 0.5,
-3.70202, 2, -5.73059, 0, 1.5, 0.5, 0.5,
-3.70202, 3, -5.73059, 0, -0.5, 0.5, 0.5,
-3.70202, 3, -5.73059, 1, -0.5, 0.5, 0.5,
-3.70202, 3, -5.73059, 1, 1.5, 0.5, 0.5,
-3.70202, 3, -5.73059, 0, 1.5, 0.5, 0.5
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
-3.201657, -3.073945, -4,
-3.201657, -3.073945, 4,
-3.201657, -3.073945, -4,
-3.368444, -3.239678, -4,
-3.201657, -3.073945, -2,
-3.368444, -3.239678, -2,
-3.201657, -3.073945, 0,
-3.368444, -3.239678, 0,
-3.201657, -3.073945, 2,
-3.368444, -3.239678, 2,
-3.201657, -3.073945, 4,
-3.368444, -3.239678, 4
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
-3.70202, -3.571146, -4, 0, -0.5, 0.5, 0.5,
-3.70202, -3.571146, -4, 1, -0.5, 0.5, 0.5,
-3.70202, -3.571146, -4, 1, 1.5, 0.5, 0.5,
-3.70202, -3.571146, -4, 0, 1.5, 0.5, 0.5,
-3.70202, -3.571146, -2, 0, -0.5, 0.5, 0.5,
-3.70202, -3.571146, -2, 1, -0.5, 0.5, 0.5,
-3.70202, -3.571146, -2, 1, 1.5, 0.5, 0.5,
-3.70202, -3.571146, -2, 0, 1.5, 0.5, 0.5,
-3.70202, -3.571146, 0, 0, -0.5, 0.5, 0.5,
-3.70202, -3.571146, 0, 1, -0.5, 0.5, 0.5,
-3.70202, -3.571146, 0, 1, 1.5, 0.5, 0.5,
-3.70202, -3.571146, 0, 0, 1.5, 0.5, 0.5,
-3.70202, -3.571146, 2, 0, -0.5, 0.5, 0.5,
-3.70202, -3.571146, 2, 1, -0.5, 0.5, 0.5,
-3.70202, -3.571146, 2, 1, 1.5, 0.5, 0.5,
-3.70202, -3.571146, 2, 0, 1.5, 0.5, 0.5,
-3.70202, -3.571146, 4, 0, -0.5, 0.5, 0.5,
-3.70202, -3.571146, 4, 1, -0.5, 0.5, 0.5,
-3.70202, -3.571146, 4, 1, 1.5, 0.5, 0.5,
-3.70202, -3.571146, 4, 0, 1.5, 0.5, 0.5
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
-3.201657, -3.073945, -4.966381,
-3.201657, 3.555399, -4.966381,
-3.201657, -3.073945, 5.223078,
-3.201657, 3.555399, 5.223078,
-3.201657, -3.073945, -4.966381,
-3.201657, -3.073945, 5.223078,
-3.201657, 3.555399, -4.966381,
-3.201657, 3.555399, 5.223078,
-3.201657, -3.073945, -4.966381,
3.469856, -3.073945, -4.966381,
-3.201657, -3.073945, 5.223078,
3.469856, -3.073945, 5.223078,
-3.201657, 3.555399, -4.966381,
3.469856, 3.555399, -4.966381,
-3.201657, 3.555399, 5.223078,
3.469856, 3.555399, 5.223078,
3.469856, -3.073945, -4.966381,
3.469856, 3.555399, -4.966381,
3.469856, -3.073945, 5.223078,
3.469856, 3.555399, 5.223078,
3.469856, -3.073945, -4.966381,
3.469856, -3.073945, 5.223078,
3.469856, 3.555399, -4.966381,
3.469856, 3.555399, 5.223078
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
var radius = 7.404491;
var distance = 32.94342;
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
mvMatrix.translate( -0.1340996, -0.2407273, -0.1283486 );
mvMatrix.scale( 1.20001, 1.207643, 0.7857022 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.94342);
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


