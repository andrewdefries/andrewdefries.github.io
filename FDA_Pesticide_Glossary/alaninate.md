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
-3.343768, -0.08466352, -1.401792, 1, 0, 0, 1,
-2.987786, 0.1313611, -0.3595916, 1, 0.007843138, 0, 1,
-2.776618, -0.01902668, -2.279894, 1, 0.01176471, 0, 1,
-2.702597, -1.756673, -1.045912, 1, 0.01960784, 0, 1,
-2.635091, 0.09655485, -0.8945638, 1, 0.02352941, 0, 1,
-2.609437, -0.1313664, -1.146549, 1, 0.03137255, 0, 1,
-2.553184, 0.6490773, -1.878911, 1, 0.03529412, 0, 1,
-2.383323, 0.1892329, -0.1363944, 1, 0.04313726, 0, 1,
-2.377387, -0.4688798, -3.047581, 1, 0.04705882, 0, 1,
-2.368335, 0.2476989, -1.513576, 1, 0.05490196, 0, 1,
-2.339331, 0.476398, -4.384367, 1, 0.05882353, 0, 1,
-2.285401, 0.5030754, -1.526061, 1, 0.06666667, 0, 1,
-2.276498, -0.6061317, -3.955805, 1, 0.07058824, 0, 1,
-2.270706, -0.3952238, -2.260121, 1, 0.07843138, 0, 1,
-2.253186, -0.8567678, -2.03713, 1, 0.08235294, 0, 1,
-2.198443, -1.793603, -3.424288, 1, 0.09019608, 0, 1,
-2.1897, 0.6726895, -1.749336, 1, 0.09411765, 0, 1,
-2.124207, 0.06440217, -0.8056126, 1, 0.1019608, 0, 1,
-2.105071, 1.79519, -1.391377, 1, 0.1098039, 0, 1,
-2.097696, 0.109744, -0.2360369, 1, 0.1137255, 0, 1,
-2.035822, -1.32057, -2.428735, 1, 0.1215686, 0, 1,
-2.013829, 0.1347175, -1.678548, 1, 0.1254902, 0, 1,
-2.004111, -1.458148, 0.156951, 1, 0.1333333, 0, 1,
-1.992401, -0.6707148, -3.441121, 1, 0.1372549, 0, 1,
-1.975024, -0.1349353, -1.375526, 1, 0.145098, 0, 1,
-1.96151, -0.09950027, -1.255268, 1, 0.1490196, 0, 1,
-1.96132, -0.8843125, -2.063033, 1, 0.1568628, 0, 1,
-1.948215, -0.686774, -1.48214, 1, 0.1607843, 0, 1,
-1.94204, -0.2168467, -1.817964, 1, 0.1686275, 0, 1,
-1.939936, -0.01397219, 0.4494613, 1, 0.172549, 0, 1,
-1.928206, 0.672186, -0.3536813, 1, 0.1803922, 0, 1,
-1.921319, -1.570189, -2.300521, 1, 0.1843137, 0, 1,
-1.911205, 0.1356059, -0.7315204, 1, 0.1921569, 0, 1,
-1.871558, 0.6234512, -0.8730093, 1, 0.1960784, 0, 1,
-1.858821, 1.775043, -2.838175, 1, 0.2039216, 0, 1,
-1.844319, 0.12921, -0.9953023, 1, 0.2117647, 0, 1,
-1.839563, 0.7078391, 0.4418271, 1, 0.2156863, 0, 1,
-1.823157, 0.0235659, -1.352631, 1, 0.2235294, 0, 1,
-1.816831, -2.037779, -2.109804, 1, 0.227451, 0, 1,
-1.815373, -1.373836, -2.449918, 1, 0.2352941, 0, 1,
-1.812593, -0.9843075, -0.4576454, 1, 0.2392157, 0, 1,
-1.810587, -0.2726769, -0.6286278, 1, 0.2470588, 0, 1,
-1.809295, 0.2553485, -0.9508369, 1, 0.2509804, 0, 1,
-1.808621, 1.682128, -0.09462558, 1, 0.2588235, 0, 1,
-1.801184, -1.1626, -3.659733, 1, 0.2627451, 0, 1,
-1.794516, -0.8985084, -2.254127, 1, 0.2705882, 0, 1,
-1.776666, 0.009790665, -1.545812, 1, 0.2745098, 0, 1,
-1.776658, 0.217289, -2.812926, 1, 0.282353, 0, 1,
-1.770971, -1.829416, -2.270965, 1, 0.2862745, 0, 1,
-1.758078, -0.2686155, -1.303614, 1, 0.2941177, 0, 1,
-1.753554, -0.4512071, -0.2083845, 1, 0.3019608, 0, 1,
-1.736908, 0.04411769, -1.514533, 1, 0.3058824, 0, 1,
-1.733254, -0.3868923, -2.117417, 1, 0.3137255, 0, 1,
-1.725324, -0.6989989, -2.605246, 1, 0.3176471, 0, 1,
-1.713944, -0.8767581, -0.8839667, 1, 0.3254902, 0, 1,
-1.71158, -0.3017677, 0.2845611, 1, 0.3294118, 0, 1,
-1.701684, -2.010426, -2.05125, 1, 0.3372549, 0, 1,
-1.673967, 1.385782, -0.7800612, 1, 0.3411765, 0, 1,
-1.666261, -0.6131041, -4.518819, 1, 0.3490196, 0, 1,
-1.633249, -1.302362, -1.879053, 1, 0.3529412, 0, 1,
-1.630447, -0.06605185, -2.843136, 1, 0.3607843, 0, 1,
-1.616696, 0.2323935, -0.3829566, 1, 0.3647059, 0, 1,
-1.609511, 0.8249459, -1.197924, 1, 0.372549, 0, 1,
-1.593964, 1.220567, 0.5687164, 1, 0.3764706, 0, 1,
-1.588884, 1.513598, 0.5394996, 1, 0.3843137, 0, 1,
-1.580714, 0.8328738, -1.057485, 1, 0.3882353, 0, 1,
-1.578203, -0.3128919, -3.400692, 1, 0.3960784, 0, 1,
-1.566434, 0.288132, -1.476804, 1, 0.4039216, 0, 1,
-1.563428, 0.2899064, -2.076606, 1, 0.4078431, 0, 1,
-1.544147, 1.862511, -2.350532, 1, 0.4156863, 0, 1,
-1.542546, 0.03652261, -2.744153, 1, 0.4196078, 0, 1,
-1.529113, -1.102478, -2.532415, 1, 0.427451, 0, 1,
-1.525781, 0.8320097, -1.576998, 1, 0.4313726, 0, 1,
-1.521566, 0.4277641, -1.432099, 1, 0.4392157, 0, 1,
-1.492914, 0.9176545, -0.7187598, 1, 0.4431373, 0, 1,
-1.474227, 0.4047147, -0.7090559, 1, 0.4509804, 0, 1,
-1.469327, -1.563241, -1.942207, 1, 0.454902, 0, 1,
-1.466468, -0.2639143, -1.69088, 1, 0.4627451, 0, 1,
-1.453087, 2.026441, -1.343836, 1, 0.4666667, 0, 1,
-1.439665, -1.434092, -2.228585, 1, 0.4745098, 0, 1,
-1.425887, -0.3517469, -3.060773, 1, 0.4784314, 0, 1,
-1.407389, -0.008109739, -1.59723, 1, 0.4862745, 0, 1,
-1.404375, -0.06505956, -1.228799, 1, 0.4901961, 0, 1,
-1.403175, 0.7450405, 0.5294414, 1, 0.4980392, 0, 1,
-1.402083, 0.5319774, -2.461732, 1, 0.5058824, 0, 1,
-1.397992, -0.04060867, -2.464764, 1, 0.509804, 0, 1,
-1.397937, 0.3135006, -2.126667, 1, 0.5176471, 0, 1,
-1.376978, 0.1577789, -1.150987, 1, 0.5215687, 0, 1,
-1.374405, 0.5129347, -1.984212, 1, 0.5294118, 0, 1,
-1.371908, 0.9610733, -1.33095, 1, 0.5333334, 0, 1,
-1.371885, -1.187469, -1.267817, 1, 0.5411765, 0, 1,
-1.368431, -1.006378, -3.119052, 1, 0.5450981, 0, 1,
-1.366702, -0.5958436, -0.966448, 1, 0.5529412, 0, 1,
-1.362118, 0.7144948, -0.6091735, 1, 0.5568628, 0, 1,
-1.355877, 0.9589119, -0.1671449, 1, 0.5647059, 0, 1,
-1.347773, -0.2777297, -2.208779, 1, 0.5686275, 0, 1,
-1.345193, -0.501151, -1.02998, 1, 0.5764706, 0, 1,
-1.343986, 0.2133152, -1.711607, 1, 0.5803922, 0, 1,
-1.336049, 2.12648, -0.6643497, 1, 0.5882353, 0, 1,
-1.330497, 0.7341446, -1.887551, 1, 0.5921569, 0, 1,
-1.329715, -1.042588, -1.920273, 1, 0.6, 0, 1,
-1.328689, -0.0165978, 0.6277466, 1, 0.6078432, 0, 1,
-1.32746, -0.5718408, -1.607108, 1, 0.6117647, 0, 1,
-1.317686, 0.4094454, -0.4865497, 1, 0.6196079, 0, 1,
-1.31253, -0.3138709, -2.860527, 1, 0.6235294, 0, 1,
-1.31194, -0.2081339, -3.495553, 1, 0.6313726, 0, 1,
-1.287107, 0.6791938, -0.9357457, 1, 0.6352941, 0, 1,
-1.284216, -0.364171, -1.705451, 1, 0.6431373, 0, 1,
-1.278949, -0.1620727, -1.292817, 1, 0.6470588, 0, 1,
-1.278791, 0.3257706, -2.984163, 1, 0.654902, 0, 1,
-1.27374, 1.590742, -0.6084986, 1, 0.6588235, 0, 1,
-1.262378, 1.353673, -1.492322, 1, 0.6666667, 0, 1,
-1.262099, 0.4612726, -0.5891461, 1, 0.6705883, 0, 1,
-1.251686, 0.5591037, 0.4603078, 1, 0.6784314, 0, 1,
-1.247373, 0.219276, -1.033266, 1, 0.682353, 0, 1,
-1.24465, 2.193474, -0.4415036, 1, 0.6901961, 0, 1,
-1.240776, -0.5231664, -1.501722, 1, 0.6941177, 0, 1,
-1.238943, -1.496799, -2.696969, 1, 0.7019608, 0, 1,
-1.230331, 1.093383, -0.682179, 1, 0.7098039, 0, 1,
-1.229209, -0.1875673, -0.917331, 1, 0.7137255, 0, 1,
-1.223256, 0.4513759, -0.634009, 1, 0.7215686, 0, 1,
-1.221068, -0.2400217, -0.4325388, 1, 0.7254902, 0, 1,
-1.202076, -0.5288305, -2.813149, 1, 0.7333333, 0, 1,
-1.18452, -1.554107, -3.005901, 1, 0.7372549, 0, 1,
-1.179691, -1.204752, -2.316918, 1, 0.7450981, 0, 1,
-1.177398, -0.8569214, -1.69244, 1, 0.7490196, 0, 1,
-1.177262, -0.6757301, -3.439206, 1, 0.7568628, 0, 1,
-1.173668, 1.463196, -0.5976887, 1, 0.7607843, 0, 1,
-1.165882, 0.9232514, -1.360154, 1, 0.7686275, 0, 1,
-1.150329, 0.921254, 1.176931, 1, 0.772549, 0, 1,
-1.150094, -0.6558477, -0.644881, 1, 0.7803922, 0, 1,
-1.148271, -0.6777564, 0.1935641, 1, 0.7843137, 0, 1,
-1.147978, -1.596126, -2.418609, 1, 0.7921569, 0, 1,
-1.140223, -1.277886, -2.459204, 1, 0.7960784, 0, 1,
-1.121365, -1.052754, -2.118912, 1, 0.8039216, 0, 1,
-1.120472, -0.4668455, -3.269696, 1, 0.8117647, 0, 1,
-1.119423, 0.5455233, -1.781931, 1, 0.8156863, 0, 1,
-1.106623, -1.728682, -1.199507, 1, 0.8235294, 0, 1,
-1.102982, -0.9877299, -0.9388626, 1, 0.827451, 0, 1,
-1.100388, 0.6719304, -0.992375, 1, 0.8352941, 0, 1,
-1.095374, -0.4009362, -2.853612, 1, 0.8392157, 0, 1,
-1.080271, -0.2438487, -3.856505, 1, 0.8470588, 0, 1,
-1.07559, 0.08961688, -1.617487, 1, 0.8509804, 0, 1,
-1.068082, -0.5210798, -3.398376, 1, 0.8588235, 0, 1,
-1.066909, -0.7403659, -2.667639, 1, 0.8627451, 0, 1,
-1.061503, -1.774192, -3.338061, 1, 0.8705882, 0, 1,
-1.061283, -0.06864186, -2.354914, 1, 0.8745098, 0, 1,
-1.056883, 1.742436, -2.277033, 1, 0.8823529, 0, 1,
-1.051798, 0.01539873, -1.383412, 1, 0.8862745, 0, 1,
-1.044165, -0.32595, -0.4403026, 1, 0.8941177, 0, 1,
-1.041964, -0.1828624, -2.39079, 1, 0.8980392, 0, 1,
-1.040437, -1.359899, -3.334076, 1, 0.9058824, 0, 1,
-1.035903, 0.3014457, -1.454761, 1, 0.9137255, 0, 1,
-1.020048, -1.307722, -3.405117, 1, 0.9176471, 0, 1,
-1.017243, 0.03793041, -1.90461, 1, 0.9254902, 0, 1,
-1.014405, 0.4555504, -1.547789, 1, 0.9294118, 0, 1,
-1.01308, -0.9323878, -1.370543, 1, 0.9372549, 0, 1,
-1.002972, -0.5965078, -1.562371, 1, 0.9411765, 0, 1,
-0.991295, 0.4816563, -0.1850225, 1, 0.9490196, 0, 1,
-0.9912406, 1.638373, -0.5443484, 1, 0.9529412, 0, 1,
-0.9823661, -0.3298519, 1.199216, 1, 0.9607843, 0, 1,
-0.9789825, -1.222774, -1.449183, 1, 0.9647059, 0, 1,
-0.9785433, 0.8797284, -1.628799, 1, 0.972549, 0, 1,
-0.9784209, -0.4841053, -3.933621, 1, 0.9764706, 0, 1,
-0.9773434, 0.3998096, -0.02148747, 1, 0.9843137, 0, 1,
-0.9737685, -0.8288329, -0.1230349, 1, 0.9882353, 0, 1,
-0.9722719, 0.2285911, -2.506053, 1, 0.9960784, 0, 1,
-0.9712232, -1.173775, -3.911839, 0.9960784, 1, 0, 1,
-0.9701962, 1.332637, -1.924496, 0.9921569, 1, 0, 1,
-0.9644781, -0.3848529, -1.571796, 0.9843137, 1, 0, 1,
-0.9630346, 0.3894641, -2.132138, 0.9803922, 1, 0, 1,
-0.9592107, -0.3277795, 0.5361679, 0.972549, 1, 0, 1,
-0.9565398, -0.8162974, -2.718791, 0.9686275, 1, 0, 1,
-0.9562854, 1.003492, -0.7150862, 0.9607843, 1, 0, 1,
-0.9542068, -0.318874, -1.699402, 0.9568627, 1, 0, 1,
-0.9531255, -1.822508, -3.252728, 0.9490196, 1, 0, 1,
-0.9313087, -0.1484643, -0.9446354, 0.945098, 1, 0, 1,
-0.9311949, -0.1592007, -1.704763, 0.9372549, 1, 0, 1,
-0.928775, -1.697662, -1.726959, 0.9333333, 1, 0, 1,
-0.9257961, 1.148179, 0.6256645, 0.9254902, 1, 0, 1,
-0.9247121, 0.6698263, -1.225248, 0.9215686, 1, 0, 1,
-0.923652, -1.388859, -2.418202, 0.9137255, 1, 0, 1,
-0.9224386, 1.215758, -0.8429915, 0.9098039, 1, 0, 1,
-0.9166325, -0.3317219, -2.375736, 0.9019608, 1, 0, 1,
-0.9127686, -0.810752, -1.732485, 0.8941177, 1, 0, 1,
-0.9096101, 1.766093, -0.9859366, 0.8901961, 1, 0, 1,
-0.9072118, -0.4749855, -3.495261, 0.8823529, 1, 0, 1,
-0.9051853, -0.7750382, -3.283743, 0.8784314, 1, 0, 1,
-0.8977396, 0.245097, -4.360319, 0.8705882, 1, 0, 1,
-0.8799323, -0.08274794, -2.69569, 0.8666667, 1, 0, 1,
-0.87986, 0.5351758, -2.316534, 0.8588235, 1, 0, 1,
-0.8772881, -0.8381111, -2.268351, 0.854902, 1, 0, 1,
-0.876946, 1.901585, -0.04360117, 0.8470588, 1, 0, 1,
-0.8766944, -0.02792018, -1.836962, 0.8431373, 1, 0, 1,
-0.8758017, 1.15444, -0.01937581, 0.8352941, 1, 0, 1,
-0.8731862, -1.347301, -2.448328, 0.8313726, 1, 0, 1,
-0.8704486, 0.165865, 1.05591, 0.8235294, 1, 0, 1,
-0.8682029, 0.8970742, 2.355399, 0.8196079, 1, 0, 1,
-0.8649659, -0.02274904, -2.0972, 0.8117647, 1, 0, 1,
-0.850132, -1.217652, -3.035112, 0.8078431, 1, 0, 1,
-0.8496677, 0.4329583, -1.112976, 0.8, 1, 0, 1,
-0.8489439, -0.2768388, -0.2405167, 0.7921569, 1, 0, 1,
-0.8427301, 0.6934112, -2.858172, 0.7882353, 1, 0, 1,
-0.841523, -0.3260535, -2.424926, 0.7803922, 1, 0, 1,
-0.8361399, -0.2770974, -1.053016, 0.7764706, 1, 0, 1,
-0.8356572, 1.624013, -0.9899613, 0.7686275, 1, 0, 1,
-0.8320417, 1.231071, 1.720044, 0.7647059, 1, 0, 1,
-0.8304152, -2.102045, -4.179807, 0.7568628, 1, 0, 1,
-0.8298971, 0.2767796, -1.509215, 0.7529412, 1, 0, 1,
-0.8257467, 1.38343, -2.811498, 0.7450981, 1, 0, 1,
-0.8185204, 1.002593, -1.02852, 0.7411765, 1, 0, 1,
-0.8176994, 1.888732, 0.3633449, 0.7333333, 1, 0, 1,
-0.8163728, -0.2199759, -0.2741083, 0.7294118, 1, 0, 1,
-0.8161689, -1.34021, -2.471965, 0.7215686, 1, 0, 1,
-0.8117425, 0.0881699, -1.215024, 0.7176471, 1, 0, 1,
-0.8086544, -0.7831551, -3.271232, 0.7098039, 1, 0, 1,
-0.8066817, -0.8099926, -2.634579, 0.7058824, 1, 0, 1,
-0.7940425, 2.143831, -1.289678, 0.6980392, 1, 0, 1,
-0.7925874, -0.744165, -2.161359, 0.6901961, 1, 0, 1,
-0.7887713, -0.07342808, -1.558541, 0.6862745, 1, 0, 1,
-0.7860596, 0.4227388, -2.219722, 0.6784314, 1, 0, 1,
-0.7826828, -1.731632, -3.155243, 0.6745098, 1, 0, 1,
-0.7805928, -1.142278, -3.42066, 0.6666667, 1, 0, 1,
-0.7782339, -0.8027714, -2.751371, 0.6627451, 1, 0, 1,
-0.7707194, -0.5724443, -2.603222, 0.654902, 1, 0, 1,
-0.7688272, -1.999088, -2.006013, 0.6509804, 1, 0, 1,
-0.7611477, -0.5132304, -2.722361, 0.6431373, 1, 0, 1,
-0.7530431, 0.3252276, -2.004325, 0.6392157, 1, 0, 1,
-0.7515975, 0.2127503, -1.428585, 0.6313726, 1, 0, 1,
-0.7398753, 0.5031432, -0.2143764, 0.627451, 1, 0, 1,
-0.7354655, 0.00186557, -1.689491, 0.6196079, 1, 0, 1,
-0.7333453, 0.4052284, 0.1537116, 0.6156863, 1, 0, 1,
-0.7293032, -0.8997887, -2.946558, 0.6078432, 1, 0, 1,
-0.728744, 1.644523, 0.5655079, 0.6039216, 1, 0, 1,
-0.7270889, -0.2312305, 0.3022457, 0.5960785, 1, 0, 1,
-0.7245322, 1.481298, -0.6757505, 0.5882353, 1, 0, 1,
-0.7229145, -0.9816206, -2.313549, 0.5843138, 1, 0, 1,
-0.7168146, 0.4526911, 0.6567632, 0.5764706, 1, 0, 1,
-0.7152959, 1.298705, 0.02820244, 0.572549, 1, 0, 1,
-0.7112495, 0.4022996, -1.682036, 0.5647059, 1, 0, 1,
-0.710427, 0.3562738, -0.05196054, 0.5607843, 1, 0, 1,
-0.6980423, -0.2449088, -2.36399, 0.5529412, 1, 0, 1,
-0.6946815, -0.510928, -2.085371, 0.5490196, 1, 0, 1,
-0.6887204, -0.6916746, -2.366186, 0.5411765, 1, 0, 1,
-0.6794118, -0.4278281, -1.703711, 0.5372549, 1, 0, 1,
-0.6765914, -0.883249, -1.133107, 0.5294118, 1, 0, 1,
-0.6757692, 1.282444, 0.7791129, 0.5254902, 1, 0, 1,
-0.6752334, -0.1285404, -1.671894, 0.5176471, 1, 0, 1,
-0.6703567, -0.3710107, -2.777838, 0.5137255, 1, 0, 1,
-0.6644641, -0.5461995, -2.225185, 0.5058824, 1, 0, 1,
-0.6618388, -0.06288734, -0.01393936, 0.5019608, 1, 0, 1,
-0.6608576, 2.103548, -1.956815, 0.4941176, 1, 0, 1,
-0.6545789, 0.6700473, -0.4825118, 0.4862745, 1, 0, 1,
-0.6508882, 0.8346161, -1.121099, 0.4823529, 1, 0, 1,
-0.6479483, 1.000763, 0.05300904, 0.4745098, 1, 0, 1,
-0.6438804, -1.442079, -2.913247, 0.4705882, 1, 0, 1,
-0.6432685, -0.4593005, -2.385342, 0.4627451, 1, 0, 1,
-0.6415213, 0.2365576, -0.662341, 0.4588235, 1, 0, 1,
-0.6398512, -1.124617, -1.810137, 0.4509804, 1, 0, 1,
-0.6348568, -0.6269341, -2.994465, 0.4470588, 1, 0, 1,
-0.6293778, -0.2886139, -2.674968, 0.4392157, 1, 0, 1,
-0.6281736, -0.215974, -0.8552376, 0.4352941, 1, 0, 1,
-0.6275318, -1.695682, -1.933755, 0.427451, 1, 0, 1,
-0.6259406, 1.218891, 0.395847, 0.4235294, 1, 0, 1,
-0.6256384, -1.16777, -1.986557, 0.4156863, 1, 0, 1,
-0.6245441, 0.7963218, -1.527562, 0.4117647, 1, 0, 1,
-0.6228477, 0.4931694, -0.4620013, 0.4039216, 1, 0, 1,
-0.6175139, -0.1954425, -1.543729, 0.3960784, 1, 0, 1,
-0.6152161, 0.4421199, -0.2231953, 0.3921569, 1, 0, 1,
-0.6134526, -0.5413213, -3.115592, 0.3843137, 1, 0, 1,
-0.6122298, -0.2119119, -0.8829806, 0.3803922, 1, 0, 1,
-0.5887893, 0.7583614, -1.038317, 0.372549, 1, 0, 1,
-0.5849703, -0.1366965, -0.2382063, 0.3686275, 1, 0, 1,
-0.5836229, -0.2951932, -2.223513, 0.3607843, 1, 0, 1,
-0.5807926, -0.3595778, -2.362252, 0.3568628, 1, 0, 1,
-0.5801103, 0.6169097, -1.383331, 0.3490196, 1, 0, 1,
-0.57955, -0.7902347, -0.9254065, 0.345098, 1, 0, 1,
-0.5761427, 0.5892971, -1.803841, 0.3372549, 1, 0, 1,
-0.5732131, 0.01980639, -0.6840551, 0.3333333, 1, 0, 1,
-0.5730911, -1.833233, -4.791972, 0.3254902, 1, 0, 1,
-0.5708197, 1.082613, -1.020422, 0.3215686, 1, 0, 1,
-0.566083, 1.095242, -1.431883, 0.3137255, 1, 0, 1,
-0.5657936, -0.7948202, -2.124509, 0.3098039, 1, 0, 1,
-0.5652505, 1.452425, 0.9594004, 0.3019608, 1, 0, 1,
-0.5619659, -1.381889, -1.866556, 0.2941177, 1, 0, 1,
-0.5603525, 0.3063501, -2.058962, 0.2901961, 1, 0, 1,
-0.5538518, 1.124676, 0.001075354, 0.282353, 1, 0, 1,
-0.5522335, -0.951398, -2.816225, 0.2784314, 1, 0, 1,
-0.5420293, -0.08704539, -1.992043, 0.2705882, 1, 0, 1,
-0.54153, 0.1238332, -2.688427, 0.2666667, 1, 0, 1,
-0.5407683, -0.1684726, -1.748505, 0.2588235, 1, 0, 1,
-0.5400832, 0.9527407, -0.4202627, 0.254902, 1, 0, 1,
-0.5393685, 0.7341226, -0.006826031, 0.2470588, 1, 0, 1,
-0.5377097, -0.7663139, -2.874389, 0.2431373, 1, 0, 1,
-0.5339777, -0.1560591, -2.673843, 0.2352941, 1, 0, 1,
-0.5242595, -0.4794742, -0.07937914, 0.2313726, 1, 0, 1,
-0.523665, 0.4484741, -2.289802, 0.2235294, 1, 0, 1,
-0.5228026, 1.003841, -0.365227, 0.2196078, 1, 0, 1,
-0.5190865, 0.274162, -0.8342647, 0.2117647, 1, 0, 1,
-0.506438, -0.7668872, -1.229687, 0.2078431, 1, 0, 1,
-0.5047377, 0.2508227, -1.925018, 0.2, 1, 0, 1,
-0.4953944, -1.022139, -3.889722, 0.1921569, 1, 0, 1,
-0.4938183, 0.01317954, -2.065447, 0.1882353, 1, 0, 1,
-0.4914752, -0.4092988, -1.161765, 0.1803922, 1, 0, 1,
-0.4869503, 1.4723, -1.144114, 0.1764706, 1, 0, 1,
-0.4860444, 2.703549, 2.399306, 0.1686275, 1, 0, 1,
-0.4851817, 0.6474255, -0.2582265, 0.1647059, 1, 0, 1,
-0.4837724, 0.4363359, -1.27793, 0.1568628, 1, 0, 1,
-0.4798279, -1.328128, -3.171564, 0.1529412, 1, 0, 1,
-0.4787468, 0.5358287, 0.5041475, 0.145098, 1, 0, 1,
-0.4764962, -0.3150909, -1.008575, 0.1411765, 1, 0, 1,
-0.4742534, 0.0588943, -1.046388, 0.1333333, 1, 0, 1,
-0.4737951, 0.29449, -0.06152696, 0.1294118, 1, 0, 1,
-0.4720133, 0.1381645, -0.8718764, 0.1215686, 1, 0, 1,
-0.4715849, -0.3310848, -3.103216, 0.1176471, 1, 0, 1,
-0.465115, 0.256562, -1.011351, 0.1098039, 1, 0, 1,
-0.4649412, 0.6100961, -1.996288, 0.1058824, 1, 0, 1,
-0.4630898, -1.610375, -3.90573, 0.09803922, 1, 0, 1,
-0.4615484, 1.633686, 0.767893, 0.09019608, 1, 0, 1,
-0.4613436, 0.468484, 0.01104466, 0.08627451, 1, 0, 1,
-0.4572721, 0.7248248, -1.342178, 0.07843138, 1, 0, 1,
-0.4528303, 0.3304548, -1.006372, 0.07450981, 1, 0, 1,
-0.4515325, -1.01885, -1.403307, 0.06666667, 1, 0, 1,
-0.4507453, -1.69092, -5.274346, 0.0627451, 1, 0, 1,
-0.4436974, 1.973527, -0.3792335, 0.05490196, 1, 0, 1,
-0.4425159, -1.405955, -2.348168, 0.05098039, 1, 0, 1,
-0.4417825, 0.946892, 0.7675855, 0.04313726, 1, 0, 1,
-0.4397255, -0.625988, -3.69253, 0.03921569, 1, 0, 1,
-0.4373584, -0.2555789, -1.938157, 0.03137255, 1, 0, 1,
-0.4370445, 0.6674387, 0.5076097, 0.02745098, 1, 0, 1,
-0.4330305, 0.1646296, -1.653773, 0.01960784, 1, 0, 1,
-0.4286543, 0.7701056, -0.5728808, 0.01568628, 1, 0, 1,
-0.4283181, 0.9557464, -0.1142413, 0.007843138, 1, 0, 1,
-0.4244625, -0.2468737, -1.875983, 0.003921569, 1, 0, 1,
-0.4218779, 1.188573, 0.4459043, 0, 1, 0.003921569, 1,
-0.4066274, -0.5659983, -3.247689, 0, 1, 0.01176471, 1,
-0.4044635, 0.03716906, -2.858677, 0, 1, 0.01568628, 1,
-0.403926, -1.646249, -4.073273, 0, 1, 0.02352941, 1,
-0.4020976, 0.2188822, -1.476989, 0, 1, 0.02745098, 1,
-0.401635, 0.3389174, -0.2900916, 0, 1, 0.03529412, 1,
-0.4011403, -1.015839, -3.310017, 0, 1, 0.03921569, 1,
-0.4011359, 1.576155, -1.365673, 0, 1, 0.04705882, 1,
-0.3966904, 1.322192, -1.117607, 0, 1, 0.05098039, 1,
-0.395612, -1.250012, -2.550979, 0, 1, 0.05882353, 1,
-0.3945024, -1.248683, -1.147566, 0, 1, 0.0627451, 1,
-0.394135, 0.6697097, -0.1524152, 0, 1, 0.07058824, 1,
-0.393193, 1.234457, 2.370313, 0, 1, 0.07450981, 1,
-0.390982, 1.253577, 0.1728007, 0, 1, 0.08235294, 1,
-0.3891976, 0.07848778, -2.241122, 0, 1, 0.08627451, 1,
-0.3867609, -0.2524674, -1.208464, 0, 1, 0.09411765, 1,
-0.3858779, -0.4029726, -2.379655, 0, 1, 0.1019608, 1,
-0.3842168, -2.181039, -3.843083, 0, 1, 0.1058824, 1,
-0.3810308, 0.3568873, -0.1373352, 0, 1, 0.1137255, 1,
-0.380744, 2.382067, -1.063184, 0, 1, 0.1176471, 1,
-0.3770885, -0.01728738, -0.673621, 0, 1, 0.1254902, 1,
-0.3748592, 0.9577844, -0.302492, 0, 1, 0.1294118, 1,
-0.3694992, -0.9534529, -3.336232, 0, 1, 0.1372549, 1,
-0.3679025, 0.7614443, -0.2061951, 0, 1, 0.1411765, 1,
-0.3669173, 0.2414714, 0.79619, 0, 1, 0.1490196, 1,
-0.366669, -0.1987782, -3.034001, 0, 1, 0.1529412, 1,
-0.3622755, 0.5439636, -0.9993221, 0, 1, 0.1607843, 1,
-0.3621583, -1.047132, -3.434848, 0, 1, 0.1647059, 1,
-0.3613857, -1.916835, -2.15828, 0, 1, 0.172549, 1,
-0.3557786, -0.3268949, -1.124724, 0, 1, 0.1764706, 1,
-0.354818, 0.5660768, -0.6371266, 0, 1, 0.1843137, 1,
-0.3471751, 0.7552977, -0.6820064, 0, 1, 0.1882353, 1,
-0.3431278, 0.867357, 0.4132726, 0, 1, 0.1960784, 1,
-0.3424797, -0.4540344, -0.9163092, 0, 1, 0.2039216, 1,
-0.3422458, -1.365877, -1.744352, 0, 1, 0.2078431, 1,
-0.3414397, 0.8367907, -1.161157, 0, 1, 0.2156863, 1,
-0.3404107, -0.6063267, -2.333694, 0, 1, 0.2196078, 1,
-0.3402577, 0.2358919, -2.699867, 0, 1, 0.227451, 1,
-0.3327981, 1.654225, 0.02712557, 0, 1, 0.2313726, 1,
-0.3320616, 0.4560144, -0.5374513, 0, 1, 0.2392157, 1,
-0.3316097, -2.635644, -3.383353, 0, 1, 0.2431373, 1,
-0.3272522, -2.236861, -4.057373, 0, 1, 0.2509804, 1,
-0.3237041, -0.7111741, -3.503689, 0, 1, 0.254902, 1,
-0.321017, 1.712195, -1.719117, 0, 1, 0.2627451, 1,
-0.3168828, 0.1450774, -0.04401936, 0, 1, 0.2666667, 1,
-0.315425, 0.4273925, 0.08570145, 0, 1, 0.2745098, 1,
-0.3141759, 1.516705, -0.176269, 0, 1, 0.2784314, 1,
-0.3131499, 0.8634703, -0.4022851, 0, 1, 0.2862745, 1,
-0.3113167, 0.8673412, -0.1287235, 0, 1, 0.2901961, 1,
-0.3097687, -1.232476, -1.74176, 0, 1, 0.2980392, 1,
-0.305975, 0.4820029, 1.344648, 0, 1, 0.3058824, 1,
-0.3055448, -0.8479989, -3.892989, 0, 1, 0.3098039, 1,
-0.3002575, -0.7505456, -1.92586, 0, 1, 0.3176471, 1,
-0.2986673, 1.544613, -0.3312024, 0, 1, 0.3215686, 1,
-0.297935, -0.104117, -1.682272, 0, 1, 0.3294118, 1,
-0.2971793, -1.11854, -2.681154, 0, 1, 0.3333333, 1,
-0.2952383, 0.24646, -0.07213897, 0, 1, 0.3411765, 1,
-0.2949386, -0.8173385, -5.246185, 0, 1, 0.345098, 1,
-0.2920491, -0.713788, -2.889311, 0, 1, 0.3529412, 1,
-0.2882461, 0.4046921, -0.5151414, 0, 1, 0.3568628, 1,
-0.2827335, 0.3899347, 1.499316, 0, 1, 0.3647059, 1,
-0.2825172, -0.8938124, -2.805612, 0, 1, 0.3686275, 1,
-0.2820939, -0.5211194, -2.030948, 0, 1, 0.3764706, 1,
-0.2806733, 1.078404, 0.1981131, 0, 1, 0.3803922, 1,
-0.2799422, -0.3779513, -4.989823, 0, 1, 0.3882353, 1,
-0.2776954, -0.115614, -1.580385, 0, 1, 0.3921569, 1,
-0.2769796, -1.104178, -2.874728, 0, 1, 0.4, 1,
-0.2731962, 1.92178, 1.14781, 0, 1, 0.4078431, 1,
-0.2728444, -1.200159, -2.063829, 0, 1, 0.4117647, 1,
-0.2717229, -2.208661, -1.44898, 0, 1, 0.4196078, 1,
-0.2717175, 0.09448386, -1.621588, 0, 1, 0.4235294, 1,
-0.2677331, 0.02640506, -2.053816, 0, 1, 0.4313726, 1,
-0.267398, -0.3014927, -2.331524, 0, 1, 0.4352941, 1,
-0.262904, -0.3087641, -2.200077, 0, 1, 0.4431373, 1,
-0.2552032, -0.8126056, -1.553334, 0, 1, 0.4470588, 1,
-0.2516043, 1.132649, -0.6429959, 0, 1, 0.454902, 1,
-0.249526, 0.9714913, 0.2258018, 0, 1, 0.4588235, 1,
-0.2492447, -0.9331813, -3.625584, 0, 1, 0.4666667, 1,
-0.2478907, -1.221709, -2.118385, 0, 1, 0.4705882, 1,
-0.2467884, 1.447524, 0.8642653, 0, 1, 0.4784314, 1,
-0.2447742, 0.3636043, 0.1931103, 0, 1, 0.4823529, 1,
-0.2409373, -1.41453, -3.516538, 0, 1, 0.4901961, 1,
-0.2401842, 0.3726997, -1.859368, 0, 1, 0.4941176, 1,
-0.2355991, 0.3724208, -2.639775, 0, 1, 0.5019608, 1,
-0.2351076, 0.6304327, 0.08324084, 0, 1, 0.509804, 1,
-0.2332872, -0.164907, -1.061169, 0, 1, 0.5137255, 1,
-0.2328262, -0.1082559, -0.9771498, 0, 1, 0.5215687, 1,
-0.2315802, -0.1898887, -1.082852, 0, 1, 0.5254902, 1,
-0.2313798, 0.4801928, -0.5148486, 0, 1, 0.5333334, 1,
-0.2190718, -0.7677965, -3.19561, 0, 1, 0.5372549, 1,
-0.2173289, -0.5859844, -2.120473, 0, 1, 0.5450981, 1,
-0.2139431, 2.334576, -0.1753868, 0, 1, 0.5490196, 1,
-0.2093986, 0.8213758, -0.03163668, 0, 1, 0.5568628, 1,
-0.2090689, 1.342306, -0.2399587, 0, 1, 0.5607843, 1,
-0.2073154, 0.4249596, -0.1284221, 0, 1, 0.5686275, 1,
-0.2069861, 0.2196961, 1.581335, 0, 1, 0.572549, 1,
-0.2046198, 0.008942404, 0.9886512, 0, 1, 0.5803922, 1,
-0.2017031, 0.1312535, -0.2578506, 0, 1, 0.5843138, 1,
-0.200567, -0.1184976, -2.461904, 0, 1, 0.5921569, 1,
-0.198814, 0.3385967, -1.874001, 0, 1, 0.5960785, 1,
-0.1978377, 1.169649, -0.03607471, 0, 1, 0.6039216, 1,
-0.1975722, 0.1243994, -1.843326, 0, 1, 0.6117647, 1,
-0.197253, -0.04042715, -0.7515738, 0, 1, 0.6156863, 1,
-0.1900468, -0.007973821, -2.018005, 0, 1, 0.6235294, 1,
-0.1890244, -0.6009544, -3.664344, 0, 1, 0.627451, 1,
-0.188649, 0.06454641, -0.5663205, 0, 1, 0.6352941, 1,
-0.1878022, 0.37317, 0.1533252, 0, 1, 0.6392157, 1,
-0.1830447, -0.1457967, -2.789377, 0, 1, 0.6470588, 1,
-0.1798547, 1.381862, -1.164672, 0, 1, 0.6509804, 1,
-0.1749328, -0.533042, -3.11477, 0, 1, 0.6588235, 1,
-0.1720245, 0.8872669, -0.6267741, 0, 1, 0.6627451, 1,
-0.1719419, 0.06108635, -1.813368, 0, 1, 0.6705883, 1,
-0.1707149, -1.623821, -3.660107, 0, 1, 0.6745098, 1,
-0.1697128, 0.1133968, -1.729854, 0, 1, 0.682353, 1,
-0.1695627, 1.301478, 1.288386, 0, 1, 0.6862745, 1,
-0.1672956, 0.3601417, -2.134418, 0, 1, 0.6941177, 1,
-0.1669747, 0.4892186, -0.4876404, 0, 1, 0.7019608, 1,
-0.16671, -1.620707, -4.111155, 0, 1, 0.7058824, 1,
-0.1642744, 0.3271473, 0.5831441, 0, 1, 0.7137255, 1,
-0.1609801, -0.05686356, -0.07079657, 0, 1, 0.7176471, 1,
-0.1544846, 1.076583, -1.344186, 0, 1, 0.7254902, 1,
-0.1531546, -1.01026, -4.805651, 0, 1, 0.7294118, 1,
-0.151657, 0.1729677, -2.561636, 0, 1, 0.7372549, 1,
-0.1503386, -1.391638, -4.398949, 0, 1, 0.7411765, 1,
-0.1484187, 1.479903, 1.243653, 0, 1, 0.7490196, 1,
-0.1474799, -0.9572619, -3.714067, 0, 1, 0.7529412, 1,
-0.146881, -1.567933, -3.984858, 0, 1, 0.7607843, 1,
-0.1463781, -0.7489184, -4.392349, 0, 1, 0.7647059, 1,
-0.1452971, -1.335927, -2.196196, 0, 1, 0.772549, 1,
-0.1382988, -1.068, -2.671753, 0, 1, 0.7764706, 1,
-0.1337866, -1.486546, -3.798217, 0, 1, 0.7843137, 1,
-0.1331469, 2.270232, 0.9900198, 0, 1, 0.7882353, 1,
-0.1308595, -0.07666686, -1.211039, 0, 1, 0.7960784, 1,
-0.1291475, 0.4895085, -0.07090969, 0, 1, 0.8039216, 1,
-0.1159884, -1.507582, -4.185958, 0, 1, 0.8078431, 1,
-0.1159668, -0.02281211, -2.197345, 0, 1, 0.8156863, 1,
-0.113886, 1.778383, -0.6563761, 0, 1, 0.8196079, 1,
-0.11258, -0.06321982, -3.164908, 0, 1, 0.827451, 1,
-0.1078087, 0.06438573, -1.176841, 0, 1, 0.8313726, 1,
-0.1075845, 1.748724, 0.5499299, 0, 1, 0.8392157, 1,
-0.1045987, -0.7370312, -4.60216, 0, 1, 0.8431373, 1,
-0.102832, 1.270788, -1.715686, 0, 1, 0.8509804, 1,
-0.1001428, 0.4234259, -0.5786073, 0, 1, 0.854902, 1,
-0.09823833, 1.183071, -0.7245916, 0, 1, 0.8627451, 1,
-0.09733292, -0.5134888, -3.56179, 0, 1, 0.8666667, 1,
-0.09388093, 1.268044, -0.472189, 0, 1, 0.8745098, 1,
-0.09303786, -0.06817763, -2.271771, 0, 1, 0.8784314, 1,
-0.0914226, 0.6970696, 0.1701876, 0, 1, 0.8862745, 1,
-0.08974907, 0.8904508, 2.379104, 0, 1, 0.8901961, 1,
-0.08872118, -0.9112116, -4.459121, 0, 1, 0.8980392, 1,
-0.08809461, 0.3138461, -2.923163, 0, 1, 0.9058824, 1,
-0.08382642, -0.06396987, -2.915367, 0, 1, 0.9098039, 1,
-0.08078729, 1.485641, 2.103023, 0, 1, 0.9176471, 1,
-0.07954591, 0.971975, 0.3654737, 0, 1, 0.9215686, 1,
-0.07549147, -0.8371733, -3.054915, 0, 1, 0.9294118, 1,
-0.07530304, 2.021848, 0.7154858, 0, 1, 0.9333333, 1,
-0.0697516, 0.5142553, -0.3740743, 0, 1, 0.9411765, 1,
-0.06605157, 0.6315326, -1.966454, 0, 1, 0.945098, 1,
-0.06597914, -0.02959695, -3.611893, 0, 1, 0.9529412, 1,
-0.06273057, 0.7789988, -0.478879, 0, 1, 0.9568627, 1,
-0.06240314, 0.02901769, 0.6945587, 0, 1, 0.9647059, 1,
-0.06028024, 1.043283, 1.857262, 0, 1, 0.9686275, 1,
-0.05421979, 0.4369536, -0.2212787, 0, 1, 0.9764706, 1,
-0.04932377, 0.5409507, 0.3391538, 0, 1, 0.9803922, 1,
-0.04911102, -1.021296, -5.172904, 0, 1, 0.9882353, 1,
-0.04677372, -0.7584013, -1.871555, 0, 1, 0.9921569, 1,
-0.04653271, 2.552161, -0.7388652, 0, 1, 1, 1,
-0.04554724, 0.6965704, 1.183836, 0, 0.9921569, 1, 1,
-0.04440305, 1.018352, 0.8413908, 0, 0.9882353, 1, 1,
-0.04246582, 0.3599062, -0.002561142, 0, 0.9803922, 1, 1,
-0.037763, -0.3728962, -2.293259, 0, 0.9764706, 1, 1,
-0.03742177, 0.9931993, 0.02754032, 0, 0.9686275, 1, 1,
-0.03290941, 0.8400136, 1.299609, 0, 0.9647059, 1, 1,
-0.03204465, -0.756419, -3.368631, 0, 0.9568627, 1, 1,
-0.03159908, 0.5409379, 0.1817511, 0, 0.9529412, 1, 1,
-0.02571701, 0.6158091, -1.037613, 0, 0.945098, 1, 1,
-0.02502586, 1.768607, 0.9497574, 0, 0.9411765, 1, 1,
-0.02314055, -0.4405039, -4.796126, 0, 0.9333333, 1, 1,
-0.02260169, 0.7241341, -0.6128564, 0, 0.9294118, 1, 1,
-0.01257355, -0.7249194, -3.088821, 0, 0.9215686, 1, 1,
-0.01121786, 0.1491634, 0.9172696, 0, 0.9176471, 1, 1,
-0.009172041, 0.9943431, -0.2738989, 0, 0.9098039, 1, 1,
-0.002790347, 2.099546, 1.75801, 0, 0.9058824, 1, 1,
1.087569e-05, -0.3522736, 1.655771, 0, 0.8980392, 1, 1,
0.00551985, -1.541489, 3.45665, 0, 0.8901961, 1, 1,
0.007754176, 0.9021447, -0.4387526, 0, 0.8862745, 1, 1,
0.009774354, 0.2253505, -0.1370098, 0, 0.8784314, 1, 1,
0.01102818, -0.9439831, 3.735651, 0, 0.8745098, 1, 1,
0.01138266, -0.2780097, 4.322586, 0, 0.8666667, 1, 1,
0.01324768, 0.9621952, 0.3229057, 0, 0.8627451, 1, 1,
0.01735886, 0.1088693, 0.9306282, 0, 0.854902, 1, 1,
0.01952088, 0.1941472, 0.4234842, 0, 0.8509804, 1, 1,
0.02456501, 0.1157303, 0.6890374, 0, 0.8431373, 1, 1,
0.02612425, -0.8519636, 3.456016, 0, 0.8392157, 1, 1,
0.02665351, -1.66601, 4.078326, 0, 0.8313726, 1, 1,
0.0273605, 2.15598, -0.2856234, 0, 0.827451, 1, 1,
0.02883907, 1.808739, 0.4047395, 0, 0.8196079, 1, 1,
0.03012494, 0.5933954, -1.164931, 0, 0.8156863, 1, 1,
0.0338276, -0.4883, 2.37431, 0, 0.8078431, 1, 1,
0.03596121, 0.705986, 0.8050573, 0, 0.8039216, 1, 1,
0.03724325, 1.336101, -0.1555486, 0, 0.7960784, 1, 1,
0.0394313, 0.8710505, 0.1818592, 0, 0.7882353, 1, 1,
0.04260391, -0.1920824, 3.439235, 0, 0.7843137, 1, 1,
0.04318511, -0.9092903, 2.350013, 0, 0.7764706, 1, 1,
0.04434574, -1.952266, 3.317698, 0, 0.772549, 1, 1,
0.045649, 1.8564, 1.439975, 0, 0.7647059, 1, 1,
0.04572756, 1.514508, -0.6931027, 0, 0.7607843, 1, 1,
0.04665866, -0.3800516, 2.70094, 0, 0.7529412, 1, 1,
0.04870909, 0.2338071, 0.6524044, 0, 0.7490196, 1, 1,
0.04900509, 0.2381146, 1.077151, 0, 0.7411765, 1, 1,
0.05102383, 1.406723, -0.2691272, 0, 0.7372549, 1, 1,
0.05586881, 0.4495367, -0.1018099, 0, 0.7294118, 1, 1,
0.05927322, -0.02776937, 1.349527, 0, 0.7254902, 1, 1,
0.06202019, -0.4435188, 2.160398, 0, 0.7176471, 1, 1,
0.062577, 0.6434752, 1.242222, 0, 0.7137255, 1, 1,
0.06848671, -0.03640602, 0.6272838, 0, 0.7058824, 1, 1,
0.07207666, 0.3572302, 2.343761, 0, 0.6980392, 1, 1,
0.07736699, 0.5560783, 0.6112382, 0, 0.6941177, 1, 1,
0.08478595, 0.8872391, 0.4074059, 0, 0.6862745, 1, 1,
0.08517471, 0.6184272, 0.1678836, 0, 0.682353, 1, 1,
0.0867104, 0.7392544, -0.1253797, 0, 0.6745098, 1, 1,
0.09129763, 1.811822, 0.8777443, 0, 0.6705883, 1, 1,
0.09671217, -0.1052481, 3.147202, 0, 0.6627451, 1, 1,
0.09815189, 0.6466492, 0.9222108, 0, 0.6588235, 1, 1,
0.102387, 1.816171, -0.6097164, 0, 0.6509804, 1, 1,
0.102875, -0.09044272, 1.088603, 0, 0.6470588, 1, 1,
0.1052969, -0.9077275, 1.90583, 0, 0.6392157, 1, 1,
0.1099863, 2.180765, -2.075515, 0, 0.6352941, 1, 1,
0.1132993, 2.277141, -2.412352, 0, 0.627451, 1, 1,
0.1264563, 0.5133117, 0.7857449, 0, 0.6235294, 1, 1,
0.1305695, -1.328475, 1.780814, 0, 0.6156863, 1, 1,
0.1362611, 0.1633115, 1.269191, 0, 0.6117647, 1, 1,
0.1369558, 0.6598423, -0.3775496, 0, 0.6039216, 1, 1,
0.136977, 0.4911988, -0.9187821, 0, 0.5960785, 1, 1,
0.142127, 1.348156, 0.2113894, 0, 0.5921569, 1, 1,
0.1461123, 0.5421546, 2.257762, 0, 0.5843138, 1, 1,
0.1477136, -0.611568, 2.688659, 0, 0.5803922, 1, 1,
0.1513582, -0.8640952, 2.759788, 0, 0.572549, 1, 1,
0.1515228, 1.585989, 0.01100638, 0, 0.5686275, 1, 1,
0.1545909, -1.700238, 2.378157, 0, 0.5607843, 1, 1,
0.1566741, 0.2672882, 1.06835, 0, 0.5568628, 1, 1,
0.1574856, -0.4634368, 4.962393, 0, 0.5490196, 1, 1,
0.1622478, 0.7649486, -0.8758406, 0, 0.5450981, 1, 1,
0.1653852, 0.3492912, 0.9121211, 0, 0.5372549, 1, 1,
0.1754494, -0.4654649, 3.875117, 0, 0.5333334, 1, 1,
0.1779382, -0.1839075, 1.429168, 0, 0.5254902, 1, 1,
0.1779439, -0.8316664, 2.376755, 0, 0.5215687, 1, 1,
0.1805258, 0.2676568, 1.961363, 0, 0.5137255, 1, 1,
0.1837111, 1.734762, -0.9331981, 0, 0.509804, 1, 1,
0.1879777, -1.808595, 2.690378, 0, 0.5019608, 1, 1,
0.1900417, 0.4627366, -0.7426801, 0, 0.4941176, 1, 1,
0.1901409, 0.4163188, 0.6394334, 0, 0.4901961, 1, 1,
0.1914225, 1.245915, -0.519711, 0, 0.4823529, 1, 1,
0.1931384, -0.2130068, 2.424911, 0, 0.4784314, 1, 1,
0.1946435, 0.6234792, -0.7371934, 0, 0.4705882, 1, 1,
0.1949996, 0.03157978, 0.8837006, 0, 0.4666667, 1, 1,
0.1953494, -0.04846804, 2.566967, 0, 0.4588235, 1, 1,
0.1978786, -2.059567, 2.61283, 0, 0.454902, 1, 1,
0.2003621, -1.074542, 1.575308, 0, 0.4470588, 1, 1,
0.2038759, 0.2956097, 0.2737758, 0, 0.4431373, 1, 1,
0.2066471, -1.533658, 4.219614, 0, 0.4352941, 1, 1,
0.2072403, 0.86425, -1.119664, 0, 0.4313726, 1, 1,
0.2074077, 0.1479394, 1.60821, 0, 0.4235294, 1, 1,
0.2082854, 0.8321537, 0.8275462, 0, 0.4196078, 1, 1,
0.2096142, 0.6743063, -0.1458508, 0, 0.4117647, 1, 1,
0.2178618, 0.7978821, 0.04977451, 0, 0.4078431, 1, 1,
0.2209286, -0.1788822, 1.722442, 0, 0.4, 1, 1,
0.2233943, -0.2839506, 2.295861, 0, 0.3921569, 1, 1,
0.2292459, 0.6844745, 1.537203, 0, 0.3882353, 1, 1,
0.2305734, 0.5244117, -1.369709, 0, 0.3803922, 1, 1,
0.231009, -1.250335, 3.119011, 0, 0.3764706, 1, 1,
0.2333748, -1.218997, 1.739315, 0, 0.3686275, 1, 1,
0.2359874, 1.122141, 0.2382122, 0, 0.3647059, 1, 1,
0.2389657, -1.742047, 4.193441, 0, 0.3568628, 1, 1,
0.2411408, -0.2861293, 2.483656, 0, 0.3529412, 1, 1,
0.2422086, -0.1308604, 2.961517, 0, 0.345098, 1, 1,
0.242313, -0.6829326, 2.701687, 0, 0.3411765, 1, 1,
0.2487676, -1.797513, 2.101022, 0, 0.3333333, 1, 1,
0.2570681, -0.1854514, 1.010142, 0, 0.3294118, 1, 1,
0.2576777, -0.9273014, 3.719877, 0, 0.3215686, 1, 1,
0.2607786, -0.5174065, 5.26972, 0, 0.3176471, 1, 1,
0.2610495, -0.6235331, 2.67365, 0, 0.3098039, 1, 1,
0.2625864, 0.983795, -0.1272765, 0, 0.3058824, 1, 1,
0.2651042, 0.3584377, 0.427977, 0, 0.2980392, 1, 1,
0.266268, 0.8720711, 0.4641027, 0, 0.2901961, 1, 1,
0.2668357, 0.8086883, 0.4499641, 0, 0.2862745, 1, 1,
0.2675243, -0.2613753, 4.191091, 0, 0.2784314, 1, 1,
0.2691984, 0.6574885, -0.8249114, 0, 0.2745098, 1, 1,
0.2729101, 1.171925, -0.3634678, 0, 0.2666667, 1, 1,
0.2735248, -0.4052213, 1.253185, 0, 0.2627451, 1, 1,
0.2772879, 0.3754094, 0.7356645, 0, 0.254902, 1, 1,
0.2851875, 2.191113, -1.470172, 0, 0.2509804, 1, 1,
0.2857481, 1.566221, -0.6030921, 0, 0.2431373, 1, 1,
0.2885257, 1.694842, -0.2607283, 0, 0.2392157, 1, 1,
0.2938508, 0.7267203, 1.713176, 0, 0.2313726, 1, 1,
0.2980321, -0.08337495, 2.539805, 0, 0.227451, 1, 1,
0.2998209, -0.2108187, 2.101704, 0, 0.2196078, 1, 1,
0.3098711, -0.08114158, 1.266218, 0, 0.2156863, 1, 1,
0.315366, -0.977874, 3.55694, 0, 0.2078431, 1, 1,
0.3156851, -1.415797, 2.037243, 0, 0.2039216, 1, 1,
0.3211541, 0.7122988, 1.872383, 0, 0.1960784, 1, 1,
0.3239976, 1.180314, -0.8464866, 0, 0.1882353, 1, 1,
0.3250364, 1.549834, 0.297236, 0, 0.1843137, 1, 1,
0.3280593, -1.785695, 1.758796, 0, 0.1764706, 1, 1,
0.33102, 0.6943939, 0.7623229, 0, 0.172549, 1, 1,
0.3347374, -0.9022976, 2.855058, 0, 0.1647059, 1, 1,
0.3348859, -1.138562, 3.375711, 0, 0.1607843, 1, 1,
0.3413277, 0.4485885, 2.006124, 0, 0.1529412, 1, 1,
0.3441783, 0.8645286, 0.7217746, 0, 0.1490196, 1, 1,
0.3501069, -0.4317977, 3.499883, 0, 0.1411765, 1, 1,
0.3505023, 1.150783, 0.2013766, 0, 0.1372549, 1, 1,
0.3505211, -1.791439, 3.188069, 0, 0.1294118, 1, 1,
0.3513995, 1.830415, -0.816188, 0, 0.1254902, 1, 1,
0.3530974, 1.125897, -0.8572887, 0, 0.1176471, 1, 1,
0.3552067, 0.8449091, -0.1832306, 0, 0.1137255, 1, 1,
0.3595732, 1.096031, 0.8932705, 0, 0.1058824, 1, 1,
0.3613335, 0.8798748, -0.9684864, 0, 0.09803922, 1, 1,
0.3626565, 0.8219718, 0.03650605, 0, 0.09411765, 1, 1,
0.3642794, 0.9182416, 0.9908776, 0, 0.08627451, 1, 1,
0.364934, -1.557074, 1.600617, 0, 0.08235294, 1, 1,
0.3680751, -0.9832987, 2.727558, 0, 0.07450981, 1, 1,
0.3686481, -0.04025337, 1.637869, 0, 0.07058824, 1, 1,
0.3773125, -0.2058044, 1.814123, 0, 0.0627451, 1, 1,
0.3862104, -1.730769, 2.819566, 0, 0.05882353, 1, 1,
0.3886842, 0.5863026, 0.3302773, 0, 0.05098039, 1, 1,
0.393758, -0.5157117, 1.013095, 0, 0.04705882, 1, 1,
0.3990183, -0.8181858, 5.614411, 0, 0.03921569, 1, 1,
0.4057474, 0.5337825, 1.383843, 0, 0.03529412, 1, 1,
0.4079511, 0.4415472, 0.5398436, 0, 0.02745098, 1, 1,
0.4088939, 0.815466, 0.351829, 0, 0.02352941, 1, 1,
0.4114406, 0.9342337, 0.6611018, 0, 0.01568628, 1, 1,
0.4193306, 0.1110473, 2.871994, 0, 0.01176471, 1, 1,
0.4224371, 0.2472101, 0.2420297, 0, 0.003921569, 1, 1,
0.4295806, -1.247505, 2.623744, 0.003921569, 0, 1, 1,
0.430096, 0.5136525, 0.0223308, 0.007843138, 0, 1, 1,
0.436377, -0.868766, 1.205395, 0.01568628, 0, 1, 1,
0.4401461, 0.6897461, 1.123305, 0.01960784, 0, 1, 1,
0.4448411, 1.583639, 1.520253, 0.02745098, 0, 1, 1,
0.4479913, -0.6226433, 1.945687, 0.03137255, 0, 1, 1,
0.4532028, 0.7316008, -0.639548, 0.03921569, 0, 1, 1,
0.4533824, 0.8980061, 0.4710721, 0.04313726, 0, 1, 1,
0.4644824, 0.9783074, -1.353522, 0.05098039, 0, 1, 1,
0.4656631, 0.482392, -0.6583793, 0.05490196, 0, 1, 1,
0.4689179, -1.612882, 3.660531, 0.0627451, 0, 1, 1,
0.4730944, 2.924477, -0.7615387, 0.06666667, 0, 1, 1,
0.4741293, -1.088719, 2.471743, 0.07450981, 0, 1, 1,
0.4752921, -1.344782, 0.8945656, 0.07843138, 0, 1, 1,
0.4781616, -0.3382213, 1.782599, 0.08627451, 0, 1, 1,
0.4782413, 0.22056, 0.9939168, 0.09019608, 0, 1, 1,
0.4788061, -0.4378071, 3.116381, 0.09803922, 0, 1, 1,
0.4850886, 1.324865, 0.5747414, 0.1058824, 0, 1, 1,
0.4851467, -1.465605, 2.266006, 0.1098039, 0, 1, 1,
0.4857473, -1.684211, 2.464743, 0.1176471, 0, 1, 1,
0.4889257, -0.9814638, 1.421991, 0.1215686, 0, 1, 1,
0.4897701, -0.6391484, 1.878538, 0.1294118, 0, 1, 1,
0.4907134, -0.5751601, 2.173183, 0.1333333, 0, 1, 1,
0.4908889, 2.435236, 1.168803, 0.1411765, 0, 1, 1,
0.5040811, 0.779241, -0.08895288, 0.145098, 0, 1, 1,
0.5065597, 0.7700446, -0.1379123, 0.1529412, 0, 1, 1,
0.5066845, 1.186537, 1.450921, 0.1568628, 0, 1, 1,
0.506906, -2.058917, 4.416553, 0.1647059, 0, 1, 1,
0.5072163, 0.8771324, -0.1981537, 0.1686275, 0, 1, 1,
0.5080994, 2.001271, 1.19326, 0.1764706, 0, 1, 1,
0.5103664, -0.4532408, 2.035383, 0.1803922, 0, 1, 1,
0.5135968, -1.217294, 0.2549812, 0.1882353, 0, 1, 1,
0.5184925, -0.5304315, 1.80162, 0.1921569, 0, 1, 1,
0.5196115, 1.543325, 1.248619, 0.2, 0, 1, 1,
0.5217102, 0.02342245, 2.370503, 0.2078431, 0, 1, 1,
0.5235755, 0.3318357, 2.687746, 0.2117647, 0, 1, 1,
0.5294384, 0.07360004, 1.034107, 0.2196078, 0, 1, 1,
0.5295982, -0.6695198, 1.072393, 0.2235294, 0, 1, 1,
0.5331676, 0.3446141, 0.02106053, 0.2313726, 0, 1, 1,
0.5333136, -0.5142173, 4.742599, 0.2352941, 0, 1, 1,
0.5346131, 0.2378911, 2.4661, 0.2431373, 0, 1, 1,
0.5388702, -1.624999, 4.59883, 0.2470588, 0, 1, 1,
0.5409752, -0.4416572, 0.1803692, 0.254902, 0, 1, 1,
0.5420623, -0.6932757, 2.748288, 0.2588235, 0, 1, 1,
0.5444102, 0.2432301, 1.334978, 0.2666667, 0, 1, 1,
0.5460135, 0.9283844, 1.076243, 0.2705882, 0, 1, 1,
0.5488305, -0.07849862, 2.512709, 0.2784314, 0, 1, 1,
0.5493071, -1.995099, 1.669463, 0.282353, 0, 1, 1,
0.55388, 1.949752, -0.5053475, 0.2901961, 0, 1, 1,
0.5598549, -1.780025, 3.404707, 0.2941177, 0, 1, 1,
0.5625749, -0.7991464, 3.727508, 0.3019608, 0, 1, 1,
0.5641935, 0.7365448, 0.2780671, 0.3098039, 0, 1, 1,
0.5700591, 0.08281733, 3.208467, 0.3137255, 0, 1, 1,
0.5706165, -0.876236, 2.861649, 0.3215686, 0, 1, 1,
0.5756496, -0.4490408, 1.457241, 0.3254902, 0, 1, 1,
0.5839521, -0.4255017, 2.541525, 0.3333333, 0, 1, 1,
0.5864128, -0.3809059, 2.004833, 0.3372549, 0, 1, 1,
0.5883294, 0.3507979, 2.324362, 0.345098, 0, 1, 1,
0.5946767, -0.2889381, 3.472692, 0.3490196, 0, 1, 1,
0.5961084, -1.188297, 2.559965, 0.3568628, 0, 1, 1,
0.5971881, -1.381049, 2.551155, 0.3607843, 0, 1, 1,
0.5995072, -0.2706201, 3.292846, 0.3686275, 0, 1, 1,
0.6000572, 1.232187, -0.6729172, 0.372549, 0, 1, 1,
0.6023163, 0.3340821, 1.966214, 0.3803922, 0, 1, 1,
0.6041616, -0.2631149, 1.05255, 0.3843137, 0, 1, 1,
0.6044271, -0.4746873, 4.006054, 0.3921569, 0, 1, 1,
0.604758, -0.2222458, 2.540444, 0.3960784, 0, 1, 1,
0.6052801, -0.3003917, 2.482877, 0.4039216, 0, 1, 1,
0.6075309, 1.339469, -0.5294487, 0.4117647, 0, 1, 1,
0.6082339, 1.300754, 1.592041, 0.4156863, 0, 1, 1,
0.6163605, 0.2327083, 2.2585, 0.4235294, 0, 1, 1,
0.6223278, -0.4345885, 2.505616, 0.427451, 0, 1, 1,
0.6246619, 1.803223, -2.028036, 0.4352941, 0, 1, 1,
0.624765, 0.2125092, 0.3934643, 0.4392157, 0, 1, 1,
0.6257952, -0.7497327, 2.439692, 0.4470588, 0, 1, 1,
0.6284288, -0.8819319, 2.132979, 0.4509804, 0, 1, 1,
0.6330709, 0.9473147, -1.709968, 0.4588235, 0, 1, 1,
0.635639, -0.2322167, 2.44758, 0.4627451, 0, 1, 1,
0.6363689, 0.05109938, 3.081628, 0.4705882, 0, 1, 1,
0.644017, 0.07122277, 1.875975, 0.4745098, 0, 1, 1,
0.6485844, 0.5147166, 1.876981, 0.4823529, 0, 1, 1,
0.6495022, -0.4846176, 3.239412, 0.4862745, 0, 1, 1,
0.6525576, 0.8265931, 0.1296331, 0.4941176, 0, 1, 1,
0.6531925, 0.1651633, 1.447802, 0.5019608, 0, 1, 1,
0.6542786, -0.8596871, 1.243688, 0.5058824, 0, 1, 1,
0.6586388, -0.1708965, 3.502086, 0.5137255, 0, 1, 1,
0.6635761, 0.7695597, 0.3173833, 0.5176471, 0, 1, 1,
0.6644055, 1.567815, 0.6224087, 0.5254902, 0, 1, 1,
0.6648775, -0.9101022, 3.506764, 0.5294118, 0, 1, 1,
0.6763827, 2.005475, 1.113075, 0.5372549, 0, 1, 1,
0.6802167, 0.5154873, -0.1043372, 0.5411765, 0, 1, 1,
0.6948384, -0.5962802, 3.28698, 0.5490196, 0, 1, 1,
0.6951385, 2.058174, 0.9516023, 0.5529412, 0, 1, 1,
0.697573, 2.260122, -0.4923872, 0.5607843, 0, 1, 1,
0.7069987, -0.640684, 1.904665, 0.5647059, 0, 1, 1,
0.7118307, -0.6226801, 2.251855, 0.572549, 0, 1, 1,
0.7223846, -0.5685317, 0.1212877, 0.5764706, 0, 1, 1,
0.7234297, -1.148191, 3.754626, 0.5843138, 0, 1, 1,
0.7240494, 0.8830322, -0.4021059, 0.5882353, 0, 1, 1,
0.724808, 0.7568178, -0.7112249, 0.5960785, 0, 1, 1,
0.7316429, 0.2269086, 0.9904462, 0.6039216, 0, 1, 1,
0.7371898, 0.3367314, 1.633424, 0.6078432, 0, 1, 1,
0.7388597, 0.104435, 2.428518, 0.6156863, 0, 1, 1,
0.7423693, 1.727044, 0.5894138, 0.6196079, 0, 1, 1,
0.7425632, 0.9585418, 0.1777395, 0.627451, 0, 1, 1,
0.7427917, 0.716466, 1.520597, 0.6313726, 0, 1, 1,
0.7533949, -0.6981248, 3.325084, 0.6392157, 0, 1, 1,
0.7571203, 0.171265, 3.328752, 0.6431373, 0, 1, 1,
0.757263, 0.7441391, -0.05209248, 0.6509804, 0, 1, 1,
0.7612898, 0.2973971, 0.9512197, 0.654902, 0, 1, 1,
0.764547, 0.5897932, -0.1892278, 0.6627451, 0, 1, 1,
0.7663148, 0.3786736, -1.23947, 0.6666667, 0, 1, 1,
0.7666634, -0.6595461, 0.7331762, 0.6745098, 0, 1, 1,
0.7674103, -0.03449919, 0.1670172, 0.6784314, 0, 1, 1,
0.7747399, 1.44948, 1.753368, 0.6862745, 0, 1, 1,
0.7748132, -0.1392748, 3.120741, 0.6901961, 0, 1, 1,
0.7754964, 0.9377941, 0.2444232, 0.6980392, 0, 1, 1,
0.7757093, 0.1407103, 2.054414, 0.7058824, 0, 1, 1,
0.7757538, -0.9873726, 1.310169, 0.7098039, 0, 1, 1,
0.7771887, 0.8435529, 2.570582, 0.7176471, 0, 1, 1,
0.7864881, 0.6193762, -0.002512567, 0.7215686, 0, 1, 1,
0.7870307, 1.03454, 1.476036, 0.7294118, 0, 1, 1,
0.787262, -0.7283701, 4.15362, 0.7333333, 0, 1, 1,
0.7938388, -0.6069507, 1.202738, 0.7411765, 0, 1, 1,
0.7946283, -0.637143, 1.443756, 0.7450981, 0, 1, 1,
0.796482, -0.6593629, 4.601364, 0.7529412, 0, 1, 1,
0.8000139, -0.2674395, 3.42811, 0.7568628, 0, 1, 1,
0.8043046, -0.9388016, 1.278073, 0.7647059, 0, 1, 1,
0.804562, 1.812181, -0.09194394, 0.7686275, 0, 1, 1,
0.8057886, -2.205344, 3.063603, 0.7764706, 0, 1, 1,
0.8065439, 0.2751515, 1.183209, 0.7803922, 0, 1, 1,
0.8071172, -0.06952424, 3.090994, 0.7882353, 0, 1, 1,
0.808032, -0.6022904, -0.03410317, 0.7921569, 0, 1, 1,
0.8088896, 0.9845837, 0.8078718, 0.8, 0, 1, 1,
0.8112086, 0.2250031, 1.985541, 0.8078431, 0, 1, 1,
0.8118206, 0.109892, 1.445457, 0.8117647, 0, 1, 1,
0.8142802, -0.1294078, 3.36111, 0.8196079, 0, 1, 1,
0.8198223, 0.6146985, 1.049344, 0.8235294, 0, 1, 1,
0.8201196, -0.9667967, 3.615755, 0.8313726, 0, 1, 1,
0.8231246, -0.8564088, 0.02853744, 0.8352941, 0, 1, 1,
0.8254166, 0.8673698, 1.367443, 0.8431373, 0, 1, 1,
0.8307766, 1.180096, -0.8931874, 0.8470588, 0, 1, 1,
0.8315831, -1.745228, 4.276282, 0.854902, 0, 1, 1,
0.8327976, -0.9631547, 2.824044, 0.8588235, 0, 1, 1,
0.8330635, 0.6736031, 0.7885715, 0.8666667, 0, 1, 1,
0.8332068, 0.05464717, 1.489594, 0.8705882, 0, 1, 1,
0.8349658, -0.2855649, 3.551447, 0.8784314, 0, 1, 1,
0.838424, -0.5934939, 2.183981, 0.8823529, 0, 1, 1,
0.8397276, -0.1226283, 1.508259, 0.8901961, 0, 1, 1,
0.8421831, 0.3131834, 0.7760272, 0.8941177, 0, 1, 1,
0.8470799, 0.2432349, -0.6120182, 0.9019608, 0, 1, 1,
0.8543901, -0.4871215, 2.986496, 0.9098039, 0, 1, 1,
0.8586437, -2.295408, 2.493526, 0.9137255, 0, 1, 1,
0.8602546, 0.8086889, 0.280046, 0.9215686, 0, 1, 1,
0.8624544, 1.198511, 0.8859513, 0.9254902, 0, 1, 1,
0.8654885, -0.5984018, 1.953668, 0.9333333, 0, 1, 1,
0.8696475, -0.004099853, 1.166282, 0.9372549, 0, 1, 1,
0.8707342, 0.5164605, 0.763239, 0.945098, 0, 1, 1,
0.87144, 1.254584, -0.5007769, 0.9490196, 0, 1, 1,
0.8854952, 0.2199258, 0.397715, 0.9568627, 0, 1, 1,
0.8870537, 0.3259101, 0.4475018, 0.9607843, 0, 1, 1,
0.888707, 0.04614139, -0.1135333, 0.9686275, 0, 1, 1,
0.8918459, 0.9408306, 0.02723171, 0.972549, 0, 1, 1,
0.9007486, 0.9255196, -1.532729, 0.9803922, 0, 1, 1,
0.9041476, 0.7001948, 1.243166, 0.9843137, 0, 1, 1,
0.905283, 1.197878, 0.4801025, 0.9921569, 0, 1, 1,
0.9091153, -0.6153217, 2.790008, 0.9960784, 0, 1, 1,
0.9093318, 1.103542, -0.001697416, 1, 0, 0.9960784, 1,
0.9153753, -0.6252792, 3.019418, 1, 0, 0.9882353, 1,
0.9155518, 0.8965276, 0.2133765, 1, 0, 0.9843137, 1,
0.9177746, -0.05445862, 2.474116, 1, 0, 0.9764706, 1,
0.9227796, -0.08254796, 3.133251, 1, 0, 0.972549, 1,
0.9277818, -0.005467879, 2.245983, 1, 0, 0.9647059, 1,
0.92972, -0.2659529, 2.713915, 1, 0, 0.9607843, 1,
0.9320274, 0.8060512, -0.05670634, 1, 0, 0.9529412, 1,
0.9390463, -0.9847306, 1.827933, 1, 0, 0.9490196, 1,
0.9404533, -1.468995, 1.437354, 1, 0, 0.9411765, 1,
0.9452781, 0.08618932, 1.053697, 1, 0, 0.9372549, 1,
0.9713832, 0.5063677, 2.407771, 1, 0, 0.9294118, 1,
0.9713916, -0.006265375, 3.06758, 1, 0, 0.9254902, 1,
0.9743012, 0.4215139, -1.064747, 1, 0, 0.9176471, 1,
0.9778439, 0.1753019, 1.041258, 1, 0, 0.9137255, 1,
0.979148, 1.522801, 0.9536667, 1, 0, 0.9058824, 1,
0.9805011, -0.4882764, 2.825178, 1, 0, 0.9019608, 1,
0.9935926, -0.1607159, 2.727212, 1, 0, 0.8941177, 1,
0.9999196, -0.6296352, 2.457363, 1, 0, 0.8862745, 1,
1.016408, -0.4877657, 2.522711, 1, 0, 0.8823529, 1,
1.017807, 0.6420727, 1.043606, 1, 0, 0.8745098, 1,
1.028824, 0.5541871, 2.378814, 1, 0, 0.8705882, 1,
1.036272, 0.9764929, 0.364813, 1, 0, 0.8627451, 1,
1.041241, -0.5964707, 0.6616907, 1, 0, 0.8588235, 1,
1.044243, -1.092017, 4.913593, 1, 0, 0.8509804, 1,
1.044574, 0.4164405, 2.193258, 1, 0, 0.8470588, 1,
1.048148, 0.8690221, -0.1583215, 1, 0, 0.8392157, 1,
1.050029, -0.4755706, 3.560235, 1, 0, 0.8352941, 1,
1.0519, -1.725868, 1.928992, 1, 0, 0.827451, 1,
1.054753, 0.7790729, 0.2757984, 1, 0, 0.8235294, 1,
1.055965, 1.047669, 0.4271813, 1, 0, 0.8156863, 1,
1.056003, -0.7255361, 0.1647668, 1, 0, 0.8117647, 1,
1.061065, 1.005122, 0.7103687, 1, 0, 0.8039216, 1,
1.08154, -0.5480738, 1.619033, 1, 0, 0.7960784, 1,
1.085575, 0.4443531, 4.194257, 1, 0, 0.7921569, 1,
1.093308, -0.9457164, 3.280318, 1, 0, 0.7843137, 1,
1.10769, 0.1251531, 1.701025, 1, 0, 0.7803922, 1,
1.112524, 0.6404324, 0.8702353, 1, 0, 0.772549, 1,
1.113917, -0.4445194, 0.7252479, 1, 0, 0.7686275, 1,
1.134402, -0.6172988, 3.053371, 1, 0, 0.7607843, 1,
1.13838, -0.18155, 1.380745, 1, 0, 0.7568628, 1,
1.143722, -0.8298551, 2.226159, 1, 0, 0.7490196, 1,
1.147848, -1.556501, 2.607565, 1, 0, 0.7450981, 1,
1.153008, -0.3684207, 1.793303, 1, 0, 0.7372549, 1,
1.155763, -0.9676533, 2.260495, 1, 0, 0.7333333, 1,
1.158482, 1.069692, 1.051235, 1, 0, 0.7254902, 1,
1.158705, 0.5995254, 1.558672, 1, 0, 0.7215686, 1,
1.168841, 0.1237832, 0.2885458, 1, 0, 0.7137255, 1,
1.171318, -0.05353947, 1.916647, 1, 0, 0.7098039, 1,
1.171459, -1.238474, 1.950249, 1, 0, 0.7019608, 1,
1.174245, 0.3372823, 3.235621, 1, 0, 0.6941177, 1,
1.18095, -0.0257911, 3.200527, 1, 0, 0.6901961, 1,
1.184098, 0.0925227, 1.669021, 1, 0, 0.682353, 1,
1.188027, 1.034147, 1.585922, 1, 0, 0.6784314, 1,
1.191027, 0.4541208, 0.9431608, 1, 0, 0.6705883, 1,
1.199689, -0.6526718, 1.892455, 1, 0, 0.6666667, 1,
1.215759, -0.6209528, 3.030846, 1, 0, 0.6588235, 1,
1.253635, -0.0608707, 1.857821, 1, 0, 0.654902, 1,
1.25414, 0.1750923, 1.031529, 1, 0, 0.6470588, 1,
1.257993, 0.2805395, 2.172688, 1, 0, 0.6431373, 1,
1.265089, 0.9214259, 0.6932995, 1, 0, 0.6352941, 1,
1.273528, 0.9278421, 1.233197, 1, 0, 0.6313726, 1,
1.277406, -1.134723, 3.877255, 1, 0, 0.6235294, 1,
1.294258, 1.909003, 1.127463, 1, 0, 0.6196079, 1,
1.2983, -1.74186, 1.434447, 1, 0, 0.6117647, 1,
1.30308, 1.561579, 0.343652, 1, 0, 0.6078432, 1,
1.306714, -1.902178, 0.2983165, 1, 0, 0.6, 1,
1.30793, 1.3632, -0.451739, 1, 0, 0.5921569, 1,
1.310741, 0.5595901, -1.560616, 1, 0, 0.5882353, 1,
1.314711, 2.505359, 0.5791897, 1, 0, 0.5803922, 1,
1.324185, -0.1314902, -1.601597, 1, 0, 0.5764706, 1,
1.32646, 0.04216211, 1.468828, 1, 0, 0.5686275, 1,
1.328699, 0.6019416, 1.2964, 1, 0, 0.5647059, 1,
1.331198, -0.6975164, 2.616058, 1, 0, 0.5568628, 1,
1.333167, 0.5917805, 0.851297, 1, 0, 0.5529412, 1,
1.337222, 0.2956359, 2.030569, 1, 0, 0.5450981, 1,
1.345462, -0.7797911, 1.031875, 1, 0, 0.5411765, 1,
1.351169, -0.5214438, 1.017821, 1, 0, 0.5333334, 1,
1.357688, 0.1408216, 1.814387, 1, 0, 0.5294118, 1,
1.379345, 0.444997, 1.493934, 1, 0, 0.5215687, 1,
1.384694, -0.9052196, 1.582096, 1, 0, 0.5176471, 1,
1.392247, 0.6063465, -1.436267, 1, 0, 0.509804, 1,
1.416746, 0.6461658, 2.105784, 1, 0, 0.5058824, 1,
1.420397, 0.1756947, 0.6140636, 1, 0, 0.4980392, 1,
1.425062, 0.7249961, -0.01315827, 1, 0, 0.4901961, 1,
1.429152, -0.9120188, 2.164824, 1, 0, 0.4862745, 1,
1.430845, 1.186153, 1.097299, 1, 0, 0.4784314, 1,
1.43387, 1.304644, 3.300237, 1, 0, 0.4745098, 1,
1.454656, 0.1577584, 1.331966, 1, 0, 0.4666667, 1,
1.464166, -2.06005, 1.079493, 1, 0, 0.4627451, 1,
1.470157, -0.6319304, 2.022036, 1, 0, 0.454902, 1,
1.473612, 3.201215, 1.19177, 1, 0, 0.4509804, 1,
1.500579, 1.035686, 1.77738, 1, 0, 0.4431373, 1,
1.502978, 0.5880786, 2.575168, 1, 0, 0.4392157, 1,
1.505575, -0.9216354, 0.5135717, 1, 0, 0.4313726, 1,
1.511685, -1.922611, 2.363421, 1, 0, 0.427451, 1,
1.521331, 1.372609, -2.112492, 1, 0, 0.4196078, 1,
1.53322, 1.068292, 2.331346, 1, 0, 0.4156863, 1,
1.535411, -0.2984202, 1.253866, 1, 0, 0.4078431, 1,
1.543165, -0.2105549, 0.3453842, 1, 0, 0.4039216, 1,
1.567701, -0.5033072, 1.095527, 1, 0, 0.3960784, 1,
1.570537, -0.2430342, 2.033077, 1, 0, 0.3882353, 1,
1.57782, 0.9579851, 2.916126, 1, 0, 0.3843137, 1,
1.582378, -0.6214488, 1.952883, 1, 0, 0.3764706, 1,
1.593242, 1.276052, 0.1745779, 1, 0, 0.372549, 1,
1.594862, 0.3911962, 1.395834, 1, 0, 0.3647059, 1,
1.613596, 0.1097094, 2.840952, 1, 0, 0.3607843, 1,
1.616148, -1.15215, 1.7502, 1, 0, 0.3529412, 1,
1.616308, -0.4054627, 0.2120449, 1, 0, 0.3490196, 1,
1.620716, 0.9548059, -0.8400609, 1, 0, 0.3411765, 1,
1.628162, 0.08857167, 2.075293, 1, 0, 0.3372549, 1,
1.637529, -0.7012601, 2.641592, 1, 0, 0.3294118, 1,
1.676714, -0.1435886, 3.237411, 1, 0, 0.3254902, 1,
1.680085, -0.8346082, 3.010592, 1, 0, 0.3176471, 1,
1.682113, 0.268692, 1.670803, 1, 0, 0.3137255, 1,
1.683859, -0.1500709, 2.98713, 1, 0, 0.3058824, 1,
1.699285, -0.2246111, 0.9694135, 1, 0, 0.2980392, 1,
1.70596, 0.6572818, 1.708256, 1, 0, 0.2941177, 1,
1.706923, -0.7054001, 3.589965, 1, 0, 0.2862745, 1,
1.720789, -2.192996, 2.51492, 1, 0, 0.282353, 1,
1.724476, 0.5165581, 2.333795, 1, 0, 0.2745098, 1,
1.726731, -1.062378, 1.242476, 1, 0, 0.2705882, 1,
1.754689, 0.2058761, 0.9485886, 1, 0, 0.2627451, 1,
1.76075, -1.427164, 2.13343, 1, 0, 0.2588235, 1,
1.772671, -0.5000696, 2.111414, 1, 0, 0.2509804, 1,
1.774924, -0.9024156, 2.088164, 1, 0, 0.2470588, 1,
1.784362, -0.7316644, 3.229023, 1, 0, 0.2392157, 1,
1.792615, -0.4640398, 2.625482, 1, 0, 0.2352941, 1,
1.799463, 0.5762624, 2.234103, 1, 0, 0.227451, 1,
1.823293, 1.291147, -1.191234, 1, 0, 0.2235294, 1,
1.840466, -0.9407356, 2.722318, 1, 0, 0.2156863, 1,
1.846376, 0.790953, 1.628058, 1, 0, 0.2117647, 1,
1.84847, 0.5487785, 2.014574, 1, 0, 0.2039216, 1,
1.904877, -0.05039096, -0.5699196, 1, 0, 0.1960784, 1,
1.917683, -0.09555285, 3.27579, 1, 0, 0.1921569, 1,
1.924938, 0.2442119, 0.7806231, 1, 0, 0.1843137, 1,
1.927335, -1.303497, 2.519029, 1, 0, 0.1803922, 1,
2.011102, -1.006627, 2.181592, 1, 0, 0.172549, 1,
2.023113, 0.1225099, 2.086101, 1, 0, 0.1686275, 1,
2.025387, -0.5846651, 0.4726011, 1, 0, 0.1607843, 1,
2.027565, 0.564186, 1.10336, 1, 0, 0.1568628, 1,
2.036257, 1.071852, 0.5340526, 1, 0, 0.1490196, 1,
2.075123, -0.4783169, 2.576832, 1, 0, 0.145098, 1,
2.076918, -1.963465, 3.938803, 1, 0, 0.1372549, 1,
2.083456, 0.5251939, 3.138622, 1, 0, 0.1333333, 1,
2.115833, -1.319776, -0.559438, 1, 0, 0.1254902, 1,
2.118047, 1.661136, 1.457049, 1, 0, 0.1215686, 1,
2.154335, -1.222578, 0.4047608, 1, 0, 0.1137255, 1,
2.163273, 0.06766995, 2.393069, 1, 0, 0.1098039, 1,
2.190163, 0.8127626, 0.7095958, 1, 0, 0.1019608, 1,
2.275584, -1.426022, 2.125064, 1, 0, 0.09411765, 1,
2.317916, -0.7199616, 1.558429, 1, 0, 0.09019608, 1,
2.32799, -0.2501455, -0.793315, 1, 0, 0.08235294, 1,
2.359122, -0.4753804, 1.21623, 1, 0, 0.07843138, 1,
2.372604, -0.7219325, 3.547711, 1, 0, 0.07058824, 1,
2.400917, 0.4152257, 0.7520688, 1, 0, 0.06666667, 1,
2.413957, -0.3936541, 1.671594, 1, 0, 0.05882353, 1,
2.432602, 0.7676145, 0.839783, 1, 0, 0.05490196, 1,
2.440907, -1.528252, 0.9575446, 1, 0, 0.04705882, 1,
2.552568, 1.776274, 0.8745306, 1, 0, 0.04313726, 1,
2.559992, 1.064568, 0.4610615, 1, 0, 0.03529412, 1,
2.606854, 1.234505, 0.9529684, 1, 0, 0.03137255, 1,
2.630776, 0.1600885, 2.039775, 1, 0, 0.02352941, 1,
2.660507, 0.4875855, 2.727189, 1, 0, 0.01960784, 1,
2.782538, 2.043215, 0.4623777, 1, 0, 0.01176471, 1,
3.119212, 1.597301, 1.20074, 1, 0, 0.007843138, 1
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
-0.1122782, -3.624992, -7.119991, 0, -0.5, 0.5, 0.5,
-0.1122782, -3.624992, -7.119991, 1, -0.5, 0.5, 0.5,
-0.1122782, -3.624992, -7.119991, 1, 1.5, 0.5, 0.5,
-0.1122782, -3.624992, -7.119991, 0, 1.5, 0.5, 0.5
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
-4.439243, 0.2827857, -7.119991, 0, -0.5, 0.5, 0.5,
-4.439243, 0.2827857, -7.119991, 1, -0.5, 0.5, 0.5,
-4.439243, 0.2827857, -7.119991, 1, 1.5, 0.5, 0.5,
-4.439243, 0.2827857, -7.119991, 0, 1.5, 0.5, 0.5
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
-4.439243, -3.624992, 0.1700325, 0, -0.5, 0.5, 0.5,
-4.439243, -3.624992, 0.1700325, 1, -0.5, 0.5, 0.5,
-4.439243, -3.624992, 0.1700325, 1, 1.5, 0.5, 0.5,
-4.439243, -3.624992, 0.1700325, 0, 1.5, 0.5, 0.5
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
-3, -2.723197, -5.437678,
3, -2.723197, -5.437678,
-3, -2.723197, -5.437678,
-3, -2.873496, -5.718063,
-2, -2.723197, -5.437678,
-2, -2.873496, -5.718063,
-1, -2.723197, -5.437678,
-1, -2.873496, -5.718063,
0, -2.723197, -5.437678,
0, -2.873496, -5.718063,
1, -2.723197, -5.437678,
1, -2.873496, -5.718063,
2, -2.723197, -5.437678,
2, -2.873496, -5.718063,
3, -2.723197, -5.437678,
3, -2.873496, -5.718063
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
-3, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
-3, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
-3, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
-3, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5,
-2, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
-2, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
-2, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
-2, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5,
-1, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
-1, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
-1, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
-1, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5,
0, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
0, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
0, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
0, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5,
1, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
1, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
1, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
1, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5,
2, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
2, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
2, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
2, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5,
3, -3.174094, -6.278834, 0, -0.5, 0.5, 0.5,
3, -3.174094, -6.278834, 1, -0.5, 0.5, 0.5,
3, -3.174094, -6.278834, 1, 1.5, 0.5, 0.5,
3, -3.174094, -6.278834, 0, 1.5, 0.5, 0.5
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
-3.440713, -2, -5.437678,
-3.440713, 3, -5.437678,
-3.440713, -2, -5.437678,
-3.607135, -2, -5.718063,
-3.440713, -1, -5.437678,
-3.607135, -1, -5.718063,
-3.440713, 0, -5.437678,
-3.607135, 0, -5.718063,
-3.440713, 1, -5.437678,
-3.607135, 1, -5.718063,
-3.440713, 2, -5.437678,
-3.607135, 2, -5.718063,
-3.440713, 3, -5.437678,
-3.607135, 3, -5.718063
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
-3.939978, -2, -6.278834, 0, -0.5, 0.5, 0.5,
-3.939978, -2, -6.278834, 1, -0.5, 0.5, 0.5,
-3.939978, -2, -6.278834, 1, 1.5, 0.5, 0.5,
-3.939978, -2, -6.278834, 0, 1.5, 0.5, 0.5,
-3.939978, -1, -6.278834, 0, -0.5, 0.5, 0.5,
-3.939978, -1, -6.278834, 1, -0.5, 0.5, 0.5,
-3.939978, -1, -6.278834, 1, 1.5, 0.5, 0.5,
-3.939978, -1, -6.278834, 0, 1.5, 0.5, 0.5,
-3.939978, 0, -6.278834, 0, -0.5, 0.5, 0.5,
-3.939978, 0, -6.278834, 1, -0.5, 0.5, 0.5,
-3.939978, 0, -6.278834, 1, 1.5, 0.5, 0.5,
-3.939978, 0, -6.278834, 0, 1.5, 0.5, 0.5,
-3.939978, 1, -6.278834, 0, -0.5, 0.5, 0.5,
-3.939978, 1, -6.278834, 1, -0.5, 0.5, 0.5,
-3.939978, 1, -6.278834, 1, 1.5, 0.5, 0.5,
-3.939978, 1, -6.278834, 0, 1.5, 0.5, 0.5,
-3.939978, 2, -6.278834, 0, -0.5, 0.5, 0.5,
-3.939978, 2, -6.278834, 1, -0.5, 0.5, 0.5,
-3.939978, 2, -6.278834, 1, 1.5, 0.5, 0.5,
-3.939978, 2, -6.278834, 0, 1.5, 0.5, 0.5,
-3.939978, 3, -6.278834, 0, -0.5, 0.5, 0.5,
-3.939978, 3, -6.278834, 1, -0.5, 0.5, 0.5,
-3.939978, 3, -6.278834, 1, 1.5, 0.5, 0.5,
-3.939978, 3, -6.278834, 0, 1.5, 0.5, 0.5
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
-3.440713, -2.723197, -4,
-3.440713, -2.723197, 4,
-3.440713, -2.723197, -4,
-3.607135, -2.873496, -4,
-3.440713, -2.723197, -2,
-3.607135, -2.873496, -2,
-3.440713, -2.723197, 0,
-3.607135, -2.873496, 0,
-3.440713, -2.723197, 2,
-3.607135, -2.873496, 2,
-3.440713, -2.723197, 4,
-3.607135, -2.873496, 4
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
-3.939978, -3.174094, -4, 0, -0.5, 0.5, 0.5,
-3.939978, -3.174094, -4, 1, -0.5, 0.5, 0.5,
-3.939978, -3.174094, -4, 1, 1.5, 0.5, 0.5,
-3.939978, -3.174094, -4, 0, 1.5, 0.5, 0.5,
-3.939978, -3.174094, -2, 0, -0.5, 0.5, 0.5,
-3.939978, -3.174094, -2, 1, -0.5, 0.5, 0.5,
-3.939978, -3.174094, -2, 1, 1.5, 0.5, 0.5,
-3.939978, -3.174094, -2, 0, 1.5, 0.5, 0.5,
-3.939978, -3.174094, 0, 0, -0.5, 0.5, 0.5,
-3.939978, -3.174094, 0, 1, -0.5, 0.5, 0.5,
-3.939978, -3.174094, 0, 1, 1.5, 0.5, 0.5,
-3.939978, -3.174094, 0, 0, 1.5, 0.5, 0.5,
-3.939978, -3.174094, 2, 0, -0.5, 0.5, 0.5,
-3.939978, -3.174094, 2, 1, -0.5, 0.5, 0.5,
-3.939978, -3.174094, 2, 1, 1.5, 0.5, 0.5,
-3.939978, -3.174094, 2, 0, 1.5, 0.5, 0.5,
-3.939978, -3.174094, 4, 0, -0.5, 0.5, 0.5,
-3.939978, -3.174094, 4, 1, -0.5, 0.5, 0.5,
-3.939978, -3.174094, 4, 1, 1.5, 0.5, 0.5,
-3.939978, -3.174094, 4, 0, 1.5, 0.5, 0.5
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
-3.440713, -2.723197, -5.437678,
-3.440713, 3.288768, -5.437678,
-3.440713, -2.723197, 5.777743,
-3.440713, 3.288768, 5.777743,
-3.440713, -2.723197, -5.437678,
-3.440713, -2.723197, 5.777743,
-3.440713, 3.288768, -5.437678,
-3.440713, 3.288768, 5.777743,
-3.440713, -2.723197, -5.437678,
3.216157, -2.723197, -5.437678,
-3.440713, -2.723197, 5.777743,
3.216157, -2.723197, 5.777743,
-3.440713, 3.288768, -5.437678,
3.216157, 3.288768, -5.437678,
-3.440713, 3.288768, 5.777743,
3.216157, 3.288768, 5.777743,
3.216157, -2.723197, -5.437678,
3.216157, 3.288768, -5.437678,
3.216157, -2.723197, 5.777743,
3.216157, 3.288768, 5.777743,
3.216157, -2.723197, -5.437678,
3.216157, -2.723197, 5.777743,
3.216157, 3.288768, -5.437678,
3.216157, 3.288768, 5.777743
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
var radius = 7.668588;
var distance = 34.11841;
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
mvMatrix.translate( 0.1122782, -0.2827857, -0.1700325 );
mvMatrix.scale( 1.245544, 1.379154, 0.7392882 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.11841);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
alaninate<-read.table("alaninate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-alaninate$V2
```

```
## Error in eval(expr, envir, enclos): object 'alaninate' not found
```

```r
y<-alaninate$V3
```

```
## Error in eval(expr, envir, enclos): object 'alaninate' not found
```

```r
z<-alaninate$V4
```

```
## Error in eval(expr, envir, enclos): object 'alaninate' not found
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
-3.343768, -0.08466352, -1.401792, 0, 0, 1, 1, 1,
-2.987786, 0.1313611, -0.3595916, 1, 0, 0, 1, 1,
-2.776618, -0.01902668, -2.279894, 1, 0, 0, 1, 1,
-2.702597, -1.756673, -1.045912, 1, 0, 0, 1, 1,
-2.635091, 0.09655485, -0.8945638, 1, 0, 0, 1, 1,
-2.609437, -0.1313664, -1.146549, 1, 0, 0, 1, 1,
-2.553184, 0.6490773, -1.878911, 0, 0, 0, 1, 1,
-2.383323, 0.1892329, -0.1363944, 0, 0, 0, 1, 1,
-2.377387, -0.4688798, -3.047581, 0, 0, 0, 1, 1,
-2.368335, 0.2476989, -1.513576, 0, 0, 0, 1, 1,
-2.339331, 0.476398, -4.384367, 0, 0, 0, 1, 1,
-2.285401, 0.5030754, -1.526061, 0, 0, 0, 1, 1,
-2.276498, -0.6061317, -3.955805, 0, 0, 0, 1, 1,
-2.270706, -0.3952238, -2.260121, 1, 1, 1, 1, 1,
-2.253186, -0.8567678, -2.03713, 1, 1, 1, 1, 1,
-2.198443, -1.793603, -3.424288, 1, 1, 1, 1, 1,
-2.1897, 0.6726895, -1.749336, 1, 1, 1, 1, 1,
-2.124207, 0.06440217, -0.8056126, 1, 1, 1, 1, 1,
-2.105071, 1.79519, -1.391377, 1, 1, 1, 1, 1,
-2.097696, 0.109744, -0.2360369, 1, 1, 1, 1, 1,
-2.035822, -1.32057, -2.428735, 1, 1, 1, 1, 1,
-2.013829, 0.1347175, -1.678548, 1, 1, 1, 1, 1,
-2.004111, -1.458148, 0.156951, 1, 1, 1, 1, 1,
-1.992401, -0.6707148, -3.441121, 1, 1, 1, 1, 1,
-1.975024, -0.1349353, -1.375526, 1, 1, 1, 1, 1,
-1.96151, -0.09950027, -1.255268, 1, 1, 1, 1, 1,
-1.96132, -0.8843125, -2.063033, 1, 1, 1, 1, 1,
-1.948215, -0.686774, -1.48214, 1, 1, 1, 1, 1,
-1.94204, -0.2168467, -1.817964, 0, 0, 1, 1, 1,
-1.939936, -0.01397219, 0.4494613, 1, 0, 0, 1, 1,
-1.928206, 0.672186, -0.3536813, 1, 0, 0, 1, 1,
-1.921319, -1.570189, -2.300521, 1, 0, 0, 1, 1,
-1.911205, 0.1356059, -0.7315204, 1, 0, 0, 1, 1,
-1.871558, 0.6234512, -0.8730093, 1, 0, 0, 1, 1,
-1.858821, 1.775043, -2.838175, 0, 0, 0, 1, 1,
-1.844319, 0.12921, -0.9953023, 0, 0, 0, 1, 1,
-1.839563, 0.7078391, 0.4418271, 0, 0, 0, 1, 1,
-1.823157, 0.0235659, -1.352631, 0, 0, 0, 1, 1,
-1.816831, -2.037779, -2.109804, 0, 0, 0, 1, 1,
-1.815373, -1.373836, -2.449918, 0, 0, 0, 1, 1,
-1.812593, -0.9843075, -0.4576454, 0, 0, 0, 1, 1,
-1.810587, -0.2726769, -0.6286278, 1, 1, 1, 1, 1,
-1.809295, 0.2553485, -0.9508369, 1, 1, 1, 1, 1,
-1.808621, 1.682128, -0.09462558, 1, 1, 1, 1, 1,
-1.801184, -1.1626, -3.659733, 1, 1, 1, 1, 1,
-1.794516, -0.8985084, -2.254127, 1, 1, 1, 1, 1,
-1.776666, 0.009790665, -1.545812, 1, 1, 1, 1, 1,
-1.776658, 0.217289, -2.812926, 1, 1, 1, 1, 1,
-1.770971, -1.829416, -2.270965, 1, 1, 1, 1, 1,
-1.758078, -0.2686155, -1.303614, 1, 1, 1, 1, 1,
-1.753554, -0.4512071, -0.2083845, 1, 1, 1, 1, 1,
-1.736908, 0.04411769, -1.514533, 1, 1, 1, 1, 1,
-1.733254, -0.3868923, -2.117417, 1, 1, 1, 1, 1,
-1.725324, -0.6989989, -2.605246, 1, 1, 1, 1, 1,
-1.713944, -0.8767581, -0.8839667, 1, 1, 1, 1, 1,
-1.71158, -0.3017677, 0.2845611, 1, 1, 1, 1, 1,
-1.701684, -2.010426, -2.05125, 0, 0, 1, 1, 1,
-1.673967, 1.385782, -0.7800612, 1, 0, 0, 1, 1,
-1.666261, -0.6131041, -4.518819, 1, 0, 0, 1, 1,
-1.633249, -1.302362, -1.879053, 1, 0, 0, 1, 1,
-1.630447, -0.06605185, -2.843136, 1, 0, 0, 1, 1,
-1.616696, 0.2323935, -0.3829566, 1, 0, 0, 1, 1,
-1.609511, 0.8249459, -1.197924, 0, 0, 0, 1, 1,
-1.593964, 1.220567, 0.5687164, 0, 0, 0, 1, 1,
-1.588884, 1.513598, 0.5394996, 0, 0, 0, 1, 1,
-1.580714, 0.8328738, -1.057485, 0, 0, 0, 1, 1,
-1.578203, -0.3128919, -3.400692, 0, 0, 0, 1, 1,
-1.566434, 0.288132, -1.476804, 0, 0, 0, 1, 1,
-1.563428, 0.2899064, -2.076606, 0, 0, 0, 1, 1,
-1.544147, 1.862511, -2.350532, 1, 1, 1, 1, 1,
-1.542546, 0.03652261, -2.744153, 1, 1, 1, 1, 1,
-1.529113, -1.102478, -2.532415, 1, 1, 1, 1, 1,
-1.525781, 0.8320097, -1.576998, 1, 1, 1, 1, 1,
-1.521566, 0.4277641, -1.432099, 1, 1, 1, 1, 1,
-1.492914, 0.9176545, -0.7187598, 1, 1, 1, 1, 1,
-1.474227, 0.4047147, -0.7090559, 1, 1, 1, 1, 1,
-1.469327, -1.563241, -1.942207, 1, 1, 1, 1, 1,
-1.466468, -0.2639143, -1.69088, 1, 1, 1, 1, 1,
-1.453087, 2.026441, -1.343836, 1, 1, 1, 1, 1,
-1.439665, -1.434092, -2.228585, 1, 1, 1, 1, 1,
-1.425887, -0.3517469, -3.060773, 1, 1, 1, 1, 1,
-1.407389, -0.008109739, -1.59723, 1, 1, 1, 1, 1,
-1.404375, -0.06505956, -1.228799, 1, 1, 1, 1, 1,
-1.403175, 0.7450405, 0.5294414, 1, 1, 1, 1, 1,
-1.402083, 0.5319774, -2.461732, 0, 0, 1, 1, 1,
-1.397992, -0.04060867, -2.464764, 1, 0, 0, 1, 1,
-1.397937, 0.3135006, -2.126667, 1, 0, 0, 1, 1,
-1.376978, 0.1577789, -1.150987, 1, 0, 0, 1, 1,
-1.374405, 0.5129347, -1.984212, 1, 0, 0, 1, 1,
-1.371908, 0.9610733, -1.33095, 1, 0, 0, 1, 1,
-1.371885, -1.187469, -1.267817, 0, 0, 0, 1, 1,
-1.368431, -1.006378, -3.119052, 0, 0, 0, 1, 1,
-1.366702, -0.5958436, -0.966448, 0, 0, 0, 1, 1,
-1.362118, 0.7144948, -0.6091735, 0, 0, 0, 1, 1,
-1.355877, 0.9589119, -0.1671449, 0, 0, 0, 1, 1,
-1.347773, -0.2777297, -2.208779, 0, 0, 0, 1, 1,
-1.345193, -0.501151, -1.02998, 0, 0, 0, 1, 1,
-1.343986, 0.2133152, -1.711607, 1, 1, 1, 1, 1,
-1.336049, 2.12648, -0.6643497, 1, 1, 1, 1, 1,
-1.330497, 0.7341446, -1.887551, 1, 1, 1, 1, 1,
-1.329715, -1.042588, -1.920273, 1, 1, 1, 1, 1,
-1.328689, -0.0165978, 0.6277466, 1, 1, 1, 1, 1,
-1.32746, -0.5718408, -1.607108, 1, 1, 1, 1, 1,
-1.317686, 0.4094454, -0.4865497, 1, 1, 1, 1, 1,
-1.31253, -0.3138709, -2.860527, 1, 1, 1, 1, 1,
-1.31194, -0.2081339, -3.495553, 1, 1, 1, 1, 1,
-1.287107, 0.6791938, -0.9357457, 1, 1, 1, 1, 1,
-1.284216, -0.364171, -1.705451, 1, 1, 1, 1, 1,
-1.278949, -0.1620727, -1.292817, 1, 1, 1, 1, 1,
-1.278791, 0.3257706, -2.984163, 1, 1, 1, 1, 1,
-1.27374, 1.590742, -0.6084986, 1, 1, 1, 1, 1,
-1.262378, 1.353673, -1.492322, 1, 1, 1, 1, 1,
-1.262099, 0.4612726, -0.5891461, 0, 0, 1, 1, 1,
-1.251686, 0.5591037, 0.4603078, 1, 0, 0, 1, 1,
-1.247373, 0.219276, -1.033266, 1, 0, 0, 1, 1,
-1.24465, 2.193474, -0.4415036, 1, 0, 0, 1, 1,
-1.240776, -0.5231664, -1.501722, 1, 0, 0, 1, 1,
-1.238943, -1.496799, -2.696969, 1, 0, 0, 1, 1,
-1.230331, 1.093383, -0.682179, 0, 0, 0, 1, 1,
-1.229209, -0.1875673, -0.917331, 0, 0, 0, 1, 1,
-1.223256, 0.4513759, -0.634009, 0, 0, 0, 1, 1,
-1.221068, -0.2400217, -0.4325388, 0, 0, 0, 1, 1,
-1.202076, -0.5288305, -2.813149, 0, 0, 0, 1, 1,
-1.18452, -1.554107, -3.005901, 0, 0, 0, 1, 1,
-1.179691, -1.204752, -2.316918, 0, 0, 0, 1, 1,
-1.177398, -0.8569214, -1.69244, 1, 1, 1, 1, 1,
-1.177262, -0.6757301, -3.439206, 1, 1, 1, 1, 1,
-1.173668, 1.463196, -0.5976887, 1, 1, 1, 1, 1,
-1.165882, 0.9232514, -1.360154, 1, 1, 1, 1, 1,
-1.150329, 0.921254, 1.176931, 1, 1, 1, 1, 1,
-1.150094, -0.6558477, -0.644881, 1, 1, 1, 1, 1,
-1.148271, -0.6777564, 0.1935641, 1, 1, 1, 1, 1,
-1.147978, -1.596126, -2.418609, 1, 1, 1, 1, 1,
-1.140223, -1.277886, -2.459204, 1, 1, 1, 1, 1,
-1.121365, -1.052754, -2.118912, 1, 1, 1, 1, 1,
-1.120472, -0.4668455, -3.269696, 1, 1, 1, 1, 1,
-1.119423, 0.5455233, -1.781931, 1, 1, 1, 1, 1,
-1.106623, -1.728682, -1.199507, 1, 1, 1, 1, 1,
-1.102982, -0.9877299, -0.9388626, 1, 1, 1, 1, 1,
-1.100388, 0.6719304, -0.992375, 1, 1, 1, 1, 1,
-1.095374, -0.4009362, -2.853612, 0, 0, 1, 1, 1,
-1.080271, -0.2438487, -3.856505, 1, 0, 0, 1, 1,
-1.07559, 0.08961688, -1.617487, 1, 0, 0, 1, 1,
-1.068082, -0.5210798, -3.398376, 1, 0, 0, 1, 1,
-1.066909, -0.7403659, -2.667639, 1, 0, 0, 1, 1,
-1.061503, -1.774192, -3.338061, 1, 0, 0, 1, 1,
-1.061283, -0.06864186, -2.354914, 0, 0, 0, 1, 1,
-1.056883, 1.742436, -2.277033, 0, 0, 0, 1, 1,
-1.051798, 0.01539873, -1.383412, 0, 0, 0, 1, 1,
-1.044165, -0.32595, -0.4403026, 0, 0, 0, 1, 1,
-1.041964, -0.1828624, -2.39079, 0, 0, 0, 1, 1,
-1.040437, -1.359899, -3.334076, 0, 0, 0, 1, 1,
-1.035903, 0.3014457, -1.454761, 0, 0, 0, 1, 1,
-1.020048, -1.307722, -3.405117, 1, 1, 1, 1, 1,
-1.017243, 0.03793041, -1.90461, 1, 1, 1, 1, 1,
-1.014405, 0.4555504, -1.547789, 1, 1, 1, 1, 1,
-1.01308, -0.9323878, -1.370543, 1, 1, 1, 1, 1,
-1.002972, -0.5965078, -1.562371, 1, 1, 1, 1, 1,
-0.991295, 0.4816563, -0.1850225, 1, 1, 1, 1, 1,
-0.9912406, 1.638373, -0.5443484, 1, 1, 1, 1, 1,
-0.9823661, -0.3298519, 1.199216, 1, 1, 1, 1, 1,
-0.9789825, -1.222774, -1.449183, 1, 1, 1, 1, 1,
-0.9785433, 0.8797284, -1.628799, 1, 1, 1, 1, 1,
-0.9784209, -0.4841053, -3.933621, 1, 1, 1, 1, 1,
-0.9773434, 0.3998096, -0.02148747, 1, 1, 1, 1, 1,
-0.9737685, -0.8288329, -0.1230349, 1, 1, 1, 1, 1,
-0.9722719, 0.2285911, -2.506053, 1, 1, 1, 1, 1,
-0.9712232, -1.173775, -3.911839, 1, 1, 1, 1, 1,
-0.9701962, 1.332637, -1.924496, 0, 0, 1, 1, 1,
-0.9644781, -0.3848529, -1.571796, 1, 0, 0, 1, 1,
-0.9630346, 0.3894641, -2.132138, 1, 0, 0, 1, 1,
-0.9592107, -0.3277795, 0.5361679, 1, 0, 0, 1, 1,
-0.9565398, -0.8162974, -2.718791, 1, 0, 0, 1, 1,
-0.9562854, 1.003492, -0.7150862, 1, 0, 0, 1, 1,
-0.9542068, -0.318874, -1.699402, 0, 0, 0, 1, 1,
-0.9531255, -1.822508, -3.252728, 0, 0, 0, 1, 1,
-0.9313087, -0.1484643, -0.9446354, 0, 0, 0, 1, 1,
-0.9311949, -0.1592007, -1.704763, 0, 0, 0, 1, 1,
-0.928775, -1.697662, -1.726959, 0, 0, 0, 1, 1,
-0.9257961, 1.148179, 0.6256645, 0, 0, 0, 1, 1,
-0.9247121, 0.6698263, -1.225248, 0, 0, 0, 1, 1,
-0.923652, -1.388859, -2.418202, 1, 1, 1, 1, 1,
-0.9224386, 1.215758, -0.8429915, 1, 1, 1, 1, 1,
-0.9166325, -0.3317219, -2.375736, 1, 1, 1, 1, 1,
-0.9127686, -0.810752, -1.732485, 1, 1, 1, 1, 1,
-0.9096101, 1.766093, -0.9859366, 1, 1, 1, 1, 1,
-0.9072118, -0.4749855, -3.495261, 1, 1, 1, 1, 1,
-0.9051853, -0.7750382, -3.283743, 1, 1, 1, 1, 1,
-0.8977396, 0.245097, -4.360319, 1, 1, 1, 1, 1,
-0.8799323, -0.08274794, -2.69569, 1, 1, 1, 1, 1,
-0.87986, 0.5351758, -2.316534, 1, 1, 1, 1, 1,
-0.8772881, -0.8381111, -2.268351, 1, 1, 1, 1, 1,
-0.876946, 1.901585, -0.04360117, 1, 1, 1, 1, 1,
-0.8766944, -0.02792018, -1.836962, 1, 1, 1, 1, 1,
-0.8758017, 1.15444, -0.01937581, 1, 1, 1, 1, 1,
-0.8731862, -1.347301, -2.448328, 1, 1, 1, 1, 1,
-0.8704486, 0.165865, 1.05591, 0, 0, 1, 1, 1,
-0.8682029, 0.8970742, 2.355399, 1, 0, 0, 1, 1,
-0.8649659, -0.02274904, -2.0972, 1, 0, 0, 1, 1,
-0.850132, -1.217652, -3.035112, 1, 0, 0, 1, 1,
-0.8496677, 0.4329583, -1.112976, 1, 0, 0, 1, 1,
-0.8489439, -0.2768388, -0.2405167, 1, 0, 0, 1, 1,
-0.8427301, 0.6934112, -2.858172, 0, 0, 0, 1, 1,
-0.841523, -0.3260535, -2.424926, 0, 0, 0, 1, 1,
-0.8361399, -0.2770974, -1.053016, 0, 0, 0, 1, 1,
-0.8356572, 1.624013, -0.9899613, 0, 0, 0, 1, 1,
-0.8320417, 1.231071, 1.720044, 0, 0, 0, 1, 1,
-0.8304152, -2.102045, -4.179807, 0, 0, 0, 1, 1,
-0.8298971, 0.2767796, -1.509215, 0, 0, 0, 1, 1,
-0.8257467, 1.38343, -2.811498, 1, 1, 1, 1, 1,
-0.8185204, 1.002593, -1.02852, 1, 1, 1, 1, 1,
-0.8176994, 1.888732, 0.3633449, 1, 1, 1, 1, 1,
-0.8163728, -0.2199759, -0.2741083, 1, 1, 1, 1, 1,
-0.8161689, -1.34021, -2.471965, 1, 1, 1, 1, 1,
-0.8117425, 0.0881699, -1.215024, 1, 1, 1, 1, 1,
-0.8086544, -0.7831551, -3.271232, 1, 1, 1, 1, 1,
-0.8066817, -0.8099926, -2.634579, 1, 1, 1, 1, 1,
-0.7940425, 2.143831, -1.289678, 1, 1, 1, 1, 1,
-0.7925874, -0.744165, -2.161359, 1, 1, 1, 1, 1,
-0.7887713, -0.07342808, -1.558541, 1, 1, 1, 1, 1,
-0.7860596, 0.4227388, -2.219722, 1, 1, 1, 1, 1,
-0.7826828, -1.731632, -3.155243, 1, 1, 1, 1, 1,
-0.7805928, -1.142278, -3.42066, 1, 1, 1, 1, 1,
-0.7782339, -0.8027714, -2.751371, 1, 1, 1, 1, 1,
-0.7707194, -0.5724443, -2.603222, 0, 0, 1, 1, 1,
-0.7688272, -1.999088, -2.006013, 1, 0, 0, 1, 1,
-0.7611477, -0.5132304, -2.722361, 1, 0, 0, 1, 1,
-0.7530431, 0.3252276, -2.004325, 1, 0, 0, 1, 1,
-0.7515975, 0.2127503, -1.428585, 1, 0, 0, 1, 1,
-0.7398753, 0.5031432, -0.2143764, 1, 0, 0, 1, 1,
-0.7354655, 0.00186557, -1.689491, 0, 0, 0, 1, 1,
-0.7333453, 0.4052284, 0.1537116, 0, 0, 0, 1, 1,
-0.7293032, -0.8997887, -2.946558, 0, 0, 0, 1, 1,
-0.728744, 1.644523, 0.5655079, 0, 0, 0, 1, 1,
-0.7270889, -0.2312305, 0.3022457, 0, 0, 0, 1, 1,
-0.7245322, 1.481298, -0.6757505, 0, 0, 0, 1, 1,
-0.7229145, -0.9816206, -2.313549, 0, 0, 0, 1, 1,
-0.7168146, 0.4526911, 0.6567632, 1, 1, 1, 1, 1,
-0.7152959, 1.298705, 0.02820244, 1, 1, 1, 1, 1,
-0.7112495, 0.4022996, -1.682036, 1, 1, 1, 1, 1,
-0.710427, 0.3562738, -0.05196054, 1, 1, 1, 1, 1,
-0.6980423, -0.2449088, -2.36399, 1, 1, 1, 1, 1,
-0.6946815, -0.510928, -2.085371, 1, 1, 1, 1, 1,
-0.6887204, -0.6916746, -2.366186, 1, 1, 1, 1, 1,
-0.6794118, -0.4278281, -1.703711, 1, 1, 1, 1, 1,
-0.6765914, -0.883249, -1.133107, 1, 1, 1, 1, 1,
-0.6757692, 1.282444, 0.7791129, 1, 1, 1, 1, 1,
-0.6752334, -0.1285404, -1.671894, 1, 1, 1, 1, 1,
-0.6703567, -0.3710107, -2.777838, 1, 1, 1, 1, 1,
-0.6644641, -0.5461995, -2.225185, 1, 1, 1, 1, 1,
-0.6618388, -0.06288734, -0.01393936, 1, 1, 1, 1, 1,
-0.6608576, 2.103548, -1.956815, 1, 1, 1, 1, 1,
-0.6545789, 0.6700473, -0.4825118, 0, 0, 1, 1, 1,
-0.6508882, 0.8346161, -1.121099, 1, 0, 0, 1, 1,
-0.6479483, 1.000763, 0.05300904, 1, 0, 0, 1, 1,
-0.6438804, -1.442079, -2.913247, 1, 0, 0, 1, 1,
-0.6432685, -0.4593005, -2.385342, 1, 0, 0, 1, 1,
-0.6415213, 0.2365576, -0.662341, 1, 0, 0, 1, 1,
-0.6398512, -1.124617, -1.810137, 0, 0, 0, 1, 1,
-0.6348568, -0.6269341, -2.994465, 0, 0, 0, 1, 1,
-0.6293778, -0.2886139, -2.674968, 0, 0, 0, 1, 1,
-0.6281736, -0.215974, -0.8552376, 0, 0, 0, 1, 1,
-0.6275318, -1.695682, -1.933755, 0, 0, 0, 1, 1,
-0.6259406, 1.218891, 0.395847, 0, 0, 0, 1, 1,
-0.6256384, -1.16777, -1.986557, 0, 0, 0, 1, 1,
-0.6245441, 0.7963218, -1.527562, 1, 1, 1, 1, 1,
-0.6228477, 0.4931694, -0.4620013, 1, 1, 1, 1, 1,
-0.6175139, -0.1954425, -1.543729, 1, 1, 1, 1, 1,
-0.6152161, 0.4421199, -0.2231953, 1, 1, 1, 1, 1,
-0.6134526, -0.5413213, -3.115592, 1, 1, 1, 1, 1,
-0.6122298, -0.2119119, -0.8829806, 1, 1, 1, 1, 1,
-0.5887893, 0.7583614, -1.038317, 1, 1, 1, 1, 1,
-0.5849703, -0.1366965, -0.2382063, 1, 1, 1, 1, 1,
-0.5836229, -0.2951932, -2.223513, 1, 1, 1, 1, 1,
-0.5807926, -0.3595778, -2.362252, 1, 1, 1, 1, 1,
-0.5801103, 0.6169097, -1.383331, 1, 1, 1, 1, 1,
-0.57955, -0.7902347, -0.9254065, 1, 1, 1, 1, 1,
-0.5761427, 0.5892971, -1.803841, 1, 1, 1, 1, 1,
-0.5732131, 0.01980639, -0.6840551, 1, 1, 1, 1, 1,
-0.5730911, -1.833233, -4.791972, 1, 1, 1, 1, 1,
-0.5708197, 1.082613, -1.020422, 0, 0, 1, 1, 1,
-0.566083, 1.095242, -1.431883, 1, 0, 0, 1, 1,
-0.5657936, -0.7948202, -2.124509, 1, 0, 0, 1, 1,
-0.5652505, 1.452425, 0.9594004, 1, 0, 0, 1, 1,
-0.5619659, -1.381889, -1.866556, 1, 0, 0, 1, 1,
-0.5603525, 0.3063501, -2.058962, 1, 0, 0, 1, 1,
-0.5538518, 1.124676, 0.001075354, 0, 0, 0, 1, 1,
-0.5522335, -0.951398, -2.816225, 0, 0, 0, 1, 1,
-0.5420293, -0.08704539, -1.992043, 0, 0, 0, 1, 1,
-0.54153, 0.1238332, -2.688427, 0, 0, 0, 1, 1,
-0.5407683, -0.1684726, -1.748505, 0, 0, 0, 1, 1,
-0.5400832, 0.9527407, -0.4202627, 0, 0, 0, 1, 1,
-0.5393685, 0.7341226, -0.006826031, 0, 0, 0, 1, 1,
-0.5377097, -0.7663139, -2.874389, 1, 1, 1, 1, 1,
-0.5339777, -0.1560591, -2.673843, 1, 1, 1, 1, 1,
-0.5242595, -0.4794742, -0.07937914, 1, 1, 1, 1, 1,
-0.523665, 0.4484741, -2.289802, 1, 1, 1, 1, 1,
-0.5228026, 1.003841, -0.365227, 1, 1, 1, 1, 1,
-0.5190865, 0.274162, -0.8342647, 1, 1, 1, 1, 1,
-0.506438, -0.7668872, -1.229687, 1, 1, 1, 1, 1,
-0.5047377, 0.2508227, -1.925018, 1, 1, 1, 1, 1,
-0.4953944, -1.022139, -3.889722, 1, 1, 1, 1, 1,
-0.4938183, 0.01317954, -2.065447, 1, 1, 1, 1, 1,
-0.4914752, -0.4092988, -1.161765, 1, 1, 1, 1, 1,
-0.4869503, 1.4723, -1.144114, 1, 1, 1, 1, 1,
-0.4860444, 2.703549, 2.399306, 1, 1, 1, 1, 1,
-0.4851817, 0.6474255, -0.2582265, 1, 1, 1, 1, 1,
-0.4837724, 0.4363359, -1.27793, 1, 1, 1, 1, 1,
-0.4798279, -1.328128, -3.171564, 0, 0, 1, 1, 1,
-0.4787468, 0.5358287, 0.5041475, 1, 0, 0, 1, 1,
-0.4764962, -0.3150909, -1.008575, 1, 0, 0, 1, 1,
-0.4742534, 0.0588943, -1.046388, 1, 0, 0, 1, 1,
-0.4737951, 0.29449, -0.06152696, 1, 0, 0, 1, 1,
-0.4720133, 0.1381645, -0.8718764, 1, 0, 0, 1, 1,
-0.4715849, -0.3310848, -3.103216, 0, 0, 0, 1, 1,
-0.465115, 0.256562, -1.011351, 0, 0, 0, 1, 1,
-0.4649412, 0.6100961, -1.996288, 0, 0, 0, 1, 1,
-0.4630898, -1.610375, -3.90573, 0, 0, 0, 1, 1,
-0.4615484, 1.633686, 0.767893, 0, 0, 0, 1, 1,
-0.4613436, 0.468484, 0.01104466, 0, 0, 0, 1, 1,
-0.4572721, 0.7248248, -1.342178, 0, 0, 0, 1, 1,
-0.4528303, 0.3304548, -1.006372, 1, 1, 1, 1, 1,
-0.4515325, -1.01885, -1.403307, 1, 1, 1, 1, 1,
-0.4507453, -1.69092, -5.274346, 1, 1, 1, 1, 1,
-0.4436974, 1.973527, -0.3792335, 1, 1, 1, 1, 1,
-0.4425159, -1.405955, -2.348168, 1, 1, 1, 1, 1,
-0.4417825, 0.946892, 0.7675855, 1, 1, 1, 1, 1,
-0.4397255, -0.625988, -3.69253, 1, 1, 1, 1, 1,
-0.4373584, -0.2555789, -1.938157, 1, 1, 1, 1, 1,
-0.4370445, 0.6674387, 0.5076097, 1, 1, 1, 1, 1,
-0.4330305, 0.1646296, -1.653773, 1, 1, 1, 1, 1,
-0.4286543, 0.7701056, -0.5728808, 1, 1, 1, 1, 1,
-0.4283181, 0.9557464, -0.1142413, 1, 1, 1, 1, 1,
-0.4244625, -0.2468737, -1.875983, 1, 1, 1, 1, 1,
-0.4218779, 1.188573, 0.4459043, 1, 1, 1, 1, 1,
-0.4066274, -0.5659983, -3.247689, 1, 1, 1, 1, 1,
-0.4044635, 0.03716906, -2.858677, 0, 0, 1, 1, 1,
-0.403926, -1.646249, -4.073273, 1, 0, 0, 1, 1,
-0.4020976, 0.2188822, -1.476989, 1, 0, 0, 1, 1,
-0.401635, 0.3389174, -0.2900916, 1, 0, 0, 1, 1,
-0.4011403, -1.015839, -3.310017, 1, 0, 0, 1, 1,
-0.4011359, 1.576155, -1.365673, 1, 0, 0, 1, 1,
-0.3966904, 1.322192, -1.117607, 0, 0, 0, 1, 1,
-0.395612, -1.250012, -2.550979, 0, 0, 0, 1, 1,
-0.3945024, -1.248683, -1.147566, 0, 0, 0, 1, 1,
-0.394135, 0.6697097, -0.1524152, 0, 0, 0, 1, 1,
-0.393193, 1.234457, 2.370313, 0, 0, 0, 1, 1,
-0.390982, 1.253577, 0.1728007, 0, 0, 0, 1, 1,
-0.3891976, 0.07848778, -2.241122, 0, 0, 0, 1, 1,
-0.3867609, -0.2524674, -1.208464, 1, 1, 1, 1, 1,
-0.3858779, -0.4029726, -2.379655, 1, 1, 1, 1, 1,
-0.3842168, -2.181039, -3.843083, 1, 1, 1, 1, 1,
-0.3810308, 0.3568873, -0.1373352, 1, 1, 1, 1, 1,
-0.380744, 2.382067, -1.063184, 1, 1, 1, 1, 1,
-0.3770885, -0.01728738, -0.673621, 1, 1, 1, 1, 1,
-0.3748592, 0.9577844, -0.302492, 1, 1, 1, 1, 1,
-0.3694992, -0.9534529, -3.336232, 1, 1, 1, 1, 1,
-0.3679025, 0.7614443, -0.2061951, 1, 1, 1, 1, 1,
-0.3669173, 0.2414714, 0.79619, 1, 1, 1, 1, 1,
-0.366669, -0.1987782, -3.034001, 1, 1, 1, 1, 1,
-0.3622755, 0.5439636, -0.9993221, 1, 1, 1, 1, 1,
-0.3621583, -1.047132, -3.434848, 1, 1, 1, 1, 1,
-0.3613857, -1.916835, -2.15828, 1, 1, 1, 1, 1,
-0.3557786, -0.3268949, -1.124724, 1, 1, 1, 1, 1,
-0.354818, 0.5660768, -0.6371266, 0, 0, 1, 1, 1,
-0.3471751, 0.7552977, -0.6820064, 1, 0, 0, 1, 1,
-0.3431278, 0.867357, 0.4132726, 1, 0, 0, 1, 1,
-0.3424797, -0.4540344, -0.9163092, 1, 0, 0, 1, 1,
-0.3422458, -1.365877, -1.744352, 1, 0, 0, 1, 1,
-0.3414397, 0.8367907, -1.161157, 1, 0, 0, 1, 1,
-0.3404107, -0.6063267, -2.333694, 0, 0, 0, 1, 1,
-0.3402577, 0.2358919, -2.699867, 0, 0, 0, 1, 1,
-0.3327981, 1.654225, 0.02712557, 0, 0, 0, 1, 1,
-0.3320616, 0.4560144, -0.5374513, 0, 0, 0, 1, 1,
-0.3316097, -2.635644, -3.383353, 0, 0, 0, 1, 1,
-0.3272522, -2.236861, -4.057373, 0, 0, 0, 1, 1,
-0.3237041, -0.7111741, -3.503689, 0, 0, 0, 1, 1,
-0.321017, 1.712195, -1.719117, 1, 1, 1, 1, 1,
-0.3168828, 0.1450774, -0.04401936, 1, 1, 1, 1, 1,
-0.315425, 0.4273925, 0.08570145, 1, 1, 1, 1, 1,
-0.3141759, 1.516705, -0.176269, 1, 1, 1, 1, 1,
-0.3131499, 0.8634703, -0.4022851, 1, 1, 1, 1, 1,
-0.3113167, 0.8673412, -0.1287235, 1, 1, 1, 1, 1,
-0.3097687, -1.232476, -1.74176, 1, 1, 1, 1, 1,
-0.305975, 0.4820029, 1.344648, 1, 1, 1, 1, 1,
-0.3055448, -0.8479989, -3.892989, 1, 1, 1, 1, 1,
-0.3002575, -0.7505456, -1.92586, 1, 1, 1, 1, 1,
-0.2986673, 1.544613, -0.3312024, 1, 1, 1, 1, 1,
-0.297935, -0.104117, -1.682272, 1, 1, 1, 1, 1,
-0.2971793, -1.11854, -2.681154, 1, 1, 1, 1, 1,
-0.2952383, 0.24646, -0.07213897, 1, 1, 1, 1, 1,
-0.2949386, -0.8173385, -5.246185, 1, 1, 1, 1, 1,
-0.2920491, -0.713788, -2.889311, 0, 0, 1, 1, 1,
-0.2882461, 0.4046921, -0.5151414, 1, 0, 0, 1, 1,
-0.2827335, 0.3899347, 1.499316, 1, 0, 0, 1, 1,
-0.2825172, -0.8938124, -2.805612, 1, 0, 0, 1, 1,
-0.2820939, -0.5211194, -2.030948, 1, 0, 0, 1, 1,
-0.2806733, 1.078404, 0.1981131, 1, 0, 0, 1, 1,
-0.2799422, -0.3779513, -4.989823, 0, 0, 0, 1, 1,
-0.2776954, -0.115614, -1.580385, 0, 0, 0, 1, 1,
-0.2769796, -1.104178, -2.874728, 0, 0, 0, 1, 1,
-0.2731962, 1.92178, 1.14781, 0, 0, 0, 1, 1,
-0.2728444, -1.200159, -2.063829, 0, 0, 0, 1, 1,
-0.2717229, -2.208661, -1.44898, 0, 0, 0, 1, 1,
-0.2717175, 0.09448386, -1.621588, 0, 0, 0, 1, 1,
-0.2677331, 0.02640506, -2.053816, 1, 1, 1, 1, 1,
-0.267398, -0.3014927, -2.331524, 1, 1, 1, 1, 1,
-0.262904, -0.3087641, -2.200077, 1, 1, 1, 1, 1,
-0.2552032, -0.8126056, -1.553334, 1, 1, 1, 1, 1,
-0.2516043, 1.132649, -0.6429959, 1, 1, 1, 1, 1,
-0.249526, 0.9714913, 0.2258018, 1, 1, 1, 1, 1,
-0.2492447, -0.9331813, -3.625584, 1, 1, 1, 1, 1,
-0.2478907, -1.221709, -2.118385, 1, 1, 1, 1, 1,
-0.2467884, 1.447524, 0.8642653, 1, 1, 1, 1, 1,
-0.2447742, 0.3636043, 0.1931103, 1, 1, 1, 1, 1,
-0.2409373, -1.41453, -3.516538, 1, 1, 1, 1, 1,
-0.2401842, 0.3726997, -1.859368, 1, 1, 1, 1, 1,
-0.2355991, 0.3724208, -2.639775, 1, 1, 1, 1, 1,
-0.2351076, 0.6304327, 0.08324084, 1, 1, 1, 1, 1,
-0.2332872, -0.164907, -1.061169, 1, 1, 1, 1, 1,
-0.2328262, -0.1082559, -0.9771498, 0, 0, 1, 1, 1,
-0.2315802, -0.1898887, -1.082852, 1, 0, 0, 1, 1,
-0.2313798, 0.4801928, -0.5148486, 1, 0, 0, 1, 1,
-0.2190718, -0.7677965, -3.19561, 1, 0, 0, 1, 1,
-0.2173289, -0.5859844, -2.120473, 1, 0, 0, 1, 1,
-0.2139431, 2.334576, -0.1753868, 1, 0, 0, 1, 1,
-0.2093986, 0.8213758, -0.03163668, 0, 0, 0, 1, 1,
-0.2090689, 1.342306, -0.2399587, 0, 0, 0, 1, 1,
-0.2073154, 0.4249596, -0.1284221, 0, 0, 0, 1, 1,
-0.2069861, 0.2196961, 1.581335, 0, 0, 0, 1, 1,
-0.2046198, 0.008942404, 0.9886512, 0, 0, 0, 1, 1,
-0.2017031, 0.1312535, -0.2578506, 0, 0, 0, 1, 1,
-0.200567, -0.1184976, -2.461904, 0, 0, 0, 1, 1,
-0.198814, 0.3385967, -1.874001, 1, 1, 1, 1, 1,
-0.1978377, 1.169649, -0.03607471, 1, 1, 1, 1, 1,
-0.1975722, 0.1243994, -1.843326, 1, 1, 1, 1, 1,
-0.197253, -0.04042715, -0.7515738, 1, 1, 1, 1, 1,
-0.1900468, -0.007973821, -2.018005, 1, 1, 1, 1, 1,
-0.1890244, -0.6009544, -3.664344, 1, 1, 1, 1, 1,
-0.188649, 0.06454641, -0.5663205, 1, 1, 1, 1, 1,
-0.1878022, 0.37317, 0.1533252, 1, 1, 1, 1, 1,
-0.1830447, -0.1457967, -2.789377, 1, 1, 1, 1, 1,
-0.1798547, 1.381862, -1.164672, 1, 1, 1, 1, 1,
-0.1749328, -0.533042, -3.11477, 1, 1, 1, 1, 1,
-0.1720245, 0.8872669, -0.6267741, 1, 1, 1, 1, 1,
-0.1719419, 0.06108635, -1.813368, 1, 1, 1, 1, 1,
-0.1707149, -1.623821, -3.660107, 1, 1, 1, 1, 1,
-0.1697128, 0.1133968, -1.729854, 1, 1, 1, 1, 1,
-0.1695627, 1.301478, 1.288386, 0, 0, 1, 1, 1,
-0.1672956, 0.3601417, -2.134418, 1, 0, 0, 1, 1,
-0.1669747, 0.4892186, -0.4876404, 1, 0, 0, 1, 1,
-0.16671, -1.620707, -4.111155, 1, 0, 0, 1, 1,
-0.1642744, 0.3271473, 0.5831441, 1, 0, 0, 1, 1,
-0.1609801, -0.05686356, -0.07079657, 1, 0, 0, 1, 1,
-0.1544846, 1.076583, -1.344186, 0, 0, 0, 1, 1,
-0.1531546, -1.01026, -4.805651, 0, 0, 0, 1, 1,
-0.151657, 0.1729677, -2.561636, 0, 0, 0, 1, 1,
-0.1503386, -1.391638, -4.398949, 0, 0, 0, 1, 1,
-0.1484187, 1.479903, 1.243653, 0, 0, 0, 1, 1,
-0.1474799, -0.9572619, -3.714067, 0, 0, 0, 1, 1,
-0.146881, -1.567933, -3.984858, 0, 0, 0, 1, 1,
-0.1463781, -0.7489184, -4.392349, 1, 1, 1, 1, 1,
-0.1452971, -1.335927, -2.196196, 1, 1, 1, 1, 1,
-0.1382988, -1.068, -2.671753, 1, 1, 1, 1, 1,
-0.1337866, -1.486546, -3.798217, 1, 1, 1, 1, 1,
-0.1331469, 2.270232, 0.9900198, 1, 1, 1, 1, 1,
-0.1308595, -0.07666686, -1.211039, 1, 1, 1, 1, 1,
-0.1291475, 0.4895085, -0.07090969, 1, 1, 1, 1, 1,
-0.1159884, -1.507582, -4.185958, 1, 1, 1, 1, 1,
-0.1159668, -0.02281211, -2.197345, 1, 1, 1, 1, 1,
-0.113886, 1.778383, -0.6563761, 1, 1, 1, 1, 1,
-0.11258, -0.06321982, -3.164908, 1, 1, 1, 1, 1,
-0.1078087, 0.06438573, -1.176841, 1, 1, 1, 1, 1,
-0.1075845, 1.748724, 0.5499299, 1, 1, 1, 1, 1,
-0.1045987, -0.7370312, -4.60216, 1, 1, 1, 1, 1,
-0.102832, 1.270788, -1.715686, 1, 1, 1, 1, 1,
-0.1001428, 0.4234259, -0.5786073, 0, 0, 1, 1, 1,
-0.09823833, 1.183071, -0.7245916, 1, 0, 0, 1, 1,
-0.09733292, -0.5134888, -3.56179, 1, 0, 0, 1, 1,
-0.09388093, 1.268044, -0.472189, 1, 0, 0, 1, 1,
-0.09303786, -0.06817763, -2.271771, 1, 0, 0, 1, 1,
-0.0914226, 0.6970696, 0.1701876, 1, 0, 0, 1, 1,
-0.08974907, 0.8904508, 2.379104, 0, 0, 0, 1, 1,
-0.08872118, -0.9112116, -4.459121, 0, 0, 0, 1, 1,
-0.08809461, 0.3138461, -2.923163, 0, 0, 0, 1, 1,
-0.08382642, -0.06396987, -2.915367, 0, 0, 0, 1, 1,
-0.08078729, 1.485641, 2.103023, 0, 0, 0, 1, 1,
-0.07954591, 0.971975, 0.3654737, 0, 0, 0, 1, 1,
-0.07549147, -0.8371733, -3.054915, 0, 0, 0, 1, 1,
-0.07530304, 2.021848, 0.7154858, 1, 1, 1, 1, 1,
-0.0697516, 0.5142553, -0.3740743, 1, 1, 1, 1, 1,
-0.06605157, 0.6315326, -1.966454, 1, 1, 1, 1, 1,
-0.06597914, -0.02959695, -3.611893, 1, 1, 1, 1, 1,
-0.06273057, 0.7789988, -0.478879, 1, 1, 1, 1, 1,
-0.06240314, 0.02901769, 0.6945587, 1, 1, 1, 1, 1,
-0.06028024, 1.043283, 1.857262, 1, 1, 1, 1, 1,
-0.05421979, 0.4369536, -0.2212787, 1, 1, 1, 1, 1,
-0.04932377, 0.5409507, 0.3391538, 1, 1, 1, 1, 1,
-0.04911102, -1.021296, -5.172904, 1, 1, 1, 1, 1,
-0.04677372, -0.7584013, -1.871555, 1, 1, 1, 1, 1,
-0.04653271, 2.552161, -0.7388652, 1, 1, 1, 1, 1,
-0.04554724, 0.6965704, 1.183836, 1, 1, 1, 1, 1,
-0.04440305, 1.018352, 0.8413908, 1, 1, 1, 1, 1,
-0.04246582, 0.3599062, -0.002561142, 1, 1, 1, 1, 1,
-0.037763, -0.3728962, -2.293259, 0, 0, 1, 1, 1,
-0.03742177, 0.9931993, 0.02754032, 1, 0, 0, 1, 1,
-0.03290941, 0.8400136, 1.299609, 1, 0, 0, 1, 1,
-0.03204465, -0.756419, -3.368631, 1, 0, 0, 1, 1,
-0.03159908, 0.5409379, 0.1817511, 1, 0, 0, 1, 1,
-0.02571701, 0.6158091, -1.037613, 1, 0, 0, 1, 1,
-0.02502586, 1.768607, 0.9497574, 0, 0, 0, 1, 1,
-0.02314055, -0.4405039, -4.796126, 0, 0, 0, 1, 1,
-0.02260169, 0.7241341, -0.6128564, 0, 0, 0, 1, 1,
-0.01257355, -0.7249194, -3.088821, 0, 0, 0, 1, 1,
-0.01121786, 0.1491634, 0.9172696, 0, 0, 0, 1, 1,
-0.009172041, 0.9943431, -0.2738989, 0, 0, 0, 1, 1,
-0.002790347, 2.099546, 1.75801, 0, 0, 0, 1, 1,
1.087569e-05, -0.3522736, 1.655771, 1, 1, 1, 1, 1,
0.00551985, -1.541489, 3.45665, 1, 1, 1, 1, 1,
0.007754176, 0.9021447, -0.4387526, 1, 1, 1, 1, 1,
0.009774354, 0.2253505, -0.1370098, 1, 1, 1, 1, 1,
0.01102818, -0.9439831, 3.735651, 1, 1, 1, 1, 1,
0.01138266, -0.2780097, 4.322586, 1, 1, 1, 1, 1,
0.01324768, 0.9621952, 0.3229057, 1, 1, 1, 1, 1,
0.01735886, 0.1088693, 0.9306282, 1, 1, 1, 1, 1,
0.01952088, 0.1941472, 0.4234842, 1, 1, 1, 1, 1,
0.02456501, 0.1157303, 0.6890374, 1, 1, 1, 1, 1,
0.02612425, -0.8519636, 3.456016, 1, 1, 1, 1, 1,
0.02665351, -1.66601, 4.078326, 1, 1, 1, 1, 1,
0.0273605, 2.15598, -0.2856234, 1, 1, 1, 1, 1,
0.02883907, 1.808739, 0.4047395, 1, 1, 1, 1, 1,
0.03012494, 0.5933954, -1.164931, 1, 1, 1, 1, 1,
0.0338276, -0.4883, 2.37431, 0, 0, 1, 1, 1,
0.03596121, 0.705986, 0.8050573, 1, 0, 0, 1, 1,
0.03724325, 1.336101, -0.1555486, 1, 0, 0, 1, 1,
0.0394313, 0.8710505, 0.1818592, 1, 0, 0, 1, 1,
0.04260391, -0.1920824, 3.439235, 1, 0, 0, 1, 1,
0.04318511, -0.9092903, 2.350013, 1, 0, 0, 1, 1,
0.04434574, -1.952266, 3.317698, 0, 0, 0, 1, 1,
0.045649, 1.8564, 1.439975, 0, 0, 0, 1, 1,
0.04572756, 1.514508, -0.6931027, 0, 0, 0, 1, 1,
0.04665866, -0.3800516, 2.70094, 0, 0, 0, 1, 1,
0.04870909, 0.2338071, 0.6524044, 0, 0, 0, 1, 1,
0.04900509, 0.2381146, 1.077151, 0, 0, 0, 1, 1,
0.05102383, 1.406723, -0.2691272, 0, 0, 0, 1, 1,
0.05586881, 0.4495367, -0.1018099, 1, 1, 1, 1, 1,
0.05927322, -0.02776937, 1.349527, 1, 1, 1, 1, 1,
0.06202019, -0.4435188, 2.160398, 1, 1, 1, 1, 1,
0.062577, 0.6434752, 1.242222, 1, 1, 1, 1, 1,
0.06848671, -0.03640602, 0.6272838, 1, 1, 1, 1, 1,
0.07207666, 0.3572302, 2.343761, 1, 1, 1, 1, 1,
0.07736699, 0.5560783, 0.6112382, 1, 1, 1, 1, 1,
0.08478595, 0.8872391, 0.4074059, 1, 1, 1, 1, 1,
0.08517471, 0.6184272, 0.1678836, 1, 1, 1, 1, 1,
0.0867104, 0.7392544, -0.1253797, 1, 1, 1, 1, 1,
0.09129763, 1.811822, 0.8777443, 1, 1, 1, 1, 1,
0.09671217, -0.1052481, 3.147202, 1, 1, 1, 1, 1,
0.09815189, 0.6466492, 0.9222108, 1, 1, 1, 1, 1,
0.102387, 1.816171, -0.6097164, 1, 1, 1, 1, 1,
0.102875, -0.09044272, 1.088603, 1, 1, 1, 1, 1,
0.1052969, -0.9077275, 1.90583, 0, 0, 1, 1, 1,
0.1099863, 2.180765, -2.075515, 1, 0, 0, 1, 1,
0.1132993, 2.277141, -2.412352, 1, 0, 0, 1, 1,
0.1264563, 0.5133117, 0.7857449, 1, 0, 0, 1, 1,
0.1305695, -1.328475, 1.780814, 1, 0, 0, 1, 1,
0.1362611, 0.1633115, 1.269191, 1, 0, 0, 1, 1,
0.1369558, 0.6598423, -0.3775496, 0, 0, 0, 1, 1,
0.136977, 0.4911988, -0.9187821, 0, 0, 0, 1, 1,
0.142127, 1.348156, 0.2113894, 0, 0, 0, 1, 1,
0.1461123, 0.5421546, 2.257762, 0, 0, 0, 1, 1,
0.1477136, -0.611568, 2.688659, 0, 0, 0, 1, 1,
0.1513582, -0.8640952, 2.759788, 0, 0, 0, 1, 1,
0.1515228, 1.585989, 0.01100638, 0, 0, 0, 1, 1,
0.1545909, -1.700238, 2.378157, 1, 1, 1, 1, 1,
0.1566741, 0.2672882, 1.06835, 1, 1, 1, 1, 1,
0.1574856, -0.4634368, 4.962393, 1, 1, 1, 1, 1,
0.1622478, 0.7649486, -0.8758406, 1, 1, 1, 1, 1,
0.1653852, 0.3492912, 0.9121211, 1, 1, 1, 1, 1,
0.1754494, -0.4654649, 3.875117, 1, 1, 1, 1, 1,
0.1779382, -0.1839075, 1.429168, 1, 1, 1, 1, 1,
0.1779439, -0.8316664, 2.376755, 1, 1, 1, 1, 1,
0.1805258, 0.2676568, 1.961363, 1, 1, 1, 1, 1,
0.1837111, 1.734762, -0.9331981, 1, 1, 1, 1, 1,
0.1879777, -1.808595, 2.690378, 1, 1, 1, 1, 1,
0.1900417, 0.4627366, -0.7426801, 1, 1, 1, 1, 1,
0.1901409, 0.4163188, 0.6394334, 1, 1, 1, 1, 1,
0.1914225, 1.245915, -0.519711, 1, 1, 1, 1, 1,
0.1931384, -0.2130068, 2.424911, 1, 1, 1, 1, 1,
0.1946435, 0.6234792, -0.7371934, 0, 0, 1, 1, 1,
0.1949996, 0.03157978, 0.8837006, 1, 0, 0, 1, 1,
0.1953494, -0.04846804, 2.566967, 1, 0, 0, 1, 1,
0.1978786, -2.059567, 2.61283, 1, 0, 0, 1, 1,
0.2003621, -1.074542, 1.575308, 1, 0, 0, 1, 1,
0.2038759, 0.2956097, 0.2737758, 1, 0, 0, 1, 1,
0.2066471, -1.533658, 4.219614, 0, 0, 0, 1, 1,
0.2072403, 0.86425, -1.119664, 0, 0, 0, 1, 1,
0.2074077, 0.1479394, 1.60821, 0, 0, 0, 1, 1,
0.2082854, 0.8321537, 0.8275462, 0, 0, 0, 1, 1,
0.2096142, 0.6743063, -0.1458508, 0, 0, 0, 1, 1,
0.2178618, 0.7978821, 0.04977451, 0, 0, 0, 1, 1,
0.2209286, -0.1788822, 1.722442, 0, 0, 0, 1, 1,
0.2233943, -0.2839506, 2.295861, 1, 1, 1, 1, 1,
0.2292459, 0.6844745, 1.537203, 1, 1, 1, 1, 1,
0.2305734, 0.5244117, -1.369709, 1, 1, 1, 1, 1,
0.231009, -1.250335, 3.119011, 1, 1, 1, 1, 1,
0.2333748, -1.218997, 1.739315, 1, 1, 1, 1, 1,
0.2359874, 1.122141, 0.2382122, 1, 1, 1, 1, 1,
0.2389657, -1.742047, 4.193441, 1, 1, 1, 1, 1,
0.2411408, -0.2861293, 2.483656, 1, 1, 1, 1, 1,
0.2422086, -0.1308604, 2.961517, 1, 1, 1, 1, 1,
0.242313, -0.6829326, 2.701687, 1, 1, 1, 1, 1,
0.2487676, -1.797513, 2.101022, 1, 1, 1, 1, 1,
0.2570681, -0.1854514, 1.010142, 1, 1, 1, 1, 1,
0.2576777, -0.9273014, 3.719877, 1, 1, 1, 1, 1,
0.2607786, -0.5174065, 5.26972, 1, 1, 1, 1, 1,
0.2610495, -0.6235331, 2.67365, 1, 1, 1, 1, 1,
0.2625864, 0.983795, -0.1272765, 0, 0, 1, 1, 1,
0.2651042, 0.3584377, 0.427977, 1, 0, 0, 1, 1,
0.266268, 0.8720711, 0.4641027, 1, 0, 0, 1, 1,
0.2668357, 0.8086883, 0.4499641, 1, 0, 0, 1, 1,
0.2675243, -0.2613753, 4.191091, 1, 0, 0, 1, 1,
0.2691984, 0.6574885, -0.8249114, 1, 0, 0, 1, 1,
0.2729101, 1.171925, -0.3634678, 0, 0, 0, 1, 1,
0.2735248, -0.4052213, 1.253185, 0, 0, 0, 1, 1,
0.2772879, 0.3754094, 0.7356645, 0, 0, 0, 1, 1,
0.2851875, 2.191113, -1.470172, 0, 0, 0, 1, 1,
0.2857481, 1.566221, -0.6030921, 0, 0, 0, 1, 1,
0.2885257, 1.694842, -0.2607283, 0, 0, 0, 1, 1,
0.2938508, 0.7267203, 1.713176, 0, 0, 0, 1, 1,
0.2980321, -0.08337495, 2.539805, 1, 1, 1, 1, 1,
0.2998209, -0.2108187, 2.101704, 1, 1, 1, 1, 1,
0.3098711, -0.08114158, 1.266218, 1, 1, 1, 1, 1,
0.315366, -0.977874, 3.55694, 1, 1, 1, 1, 1,
0.3156851, -1.415797, 2.037243, 1, 1, 1, 1, 1,
0.3211541, 0.7122988, 1.872383, 1, 1, 1, 1, 1,
0.3239976, 1.180314, -0.8464866, 1, 1, 1, 1, 1,
0.3250364, 1.549834, 0.297236, 1, 1, 1, 1, 1,
0.3280593, -1.785695, 1.758796, 1, 1, 1, 1, 1,
0.33102, 0.6943939, 0.7623229, 1, 1, 1, 1, 1,
0.3347374, -0.9022976, 2.855058, 1, 1, 1, 1, 1,
0.3348859, -1.138562, 3.375711, 1, 1, 1, 1, 1,
0.3413277, 0.4485885, 2.006124, 1, 1, 1, 1, 1,
0.3441783, 0.8645286, 0.7217746, 1, 1, 1, 1, 1,
0.3501069, -0.4317977, 3.499883, 1, 1, 1, 1, 1,
0.3505023, 1.150783, 0.2013766, 0, 0, 1, 1, 1,
0.3505211, -1.791439, 3.188069, 1, 0, 0, 1, 1,
0.3513995, 1.830415, -0.816188, 1, 0, 0, 1, 1,
0.3530974, 1.125897, -0.8572887, 1, 0, 0, 1, 1,
0.3552067, 0.8449091, -0.1832306, 1, 0, 0, 1, 1,
0.3595732, 1.096031, 0.8932705, 1, 0, 0, 1, 1,
0.3613335, 0.8798748, -0.9684864, 0, 0, 0, 1, 1,
0.3626565, 0.8219718, 0.03650605, 0, 0, 0, 1, 1,
0.3642794, 0.9182416, 0.9908776, 0, 0, 0, 1, 1,
0.364934, -1.557074, 1.600617, 0, 0, 0, 1, 1,
0.3680751, -0.9832987, 2.727558, 0, 0, 0, 1, 1,
0.3686481, -0.04025337, 1.637869, 0, 0, 0, 1, 1,
0.3773125, -0.2058044, 1.814123, 0, 0, 0, 1, 1,
0.3862104, -1.730769, 2.819566, 1, 1, 1, 1, 1,
0.3886842, 0.5863026, 0.3302773, 1, 1, 1, 1, 1,
0.393758, -0.5157117, 1.013095, 1, 1, 1, 1, 1,
0.3990183, -0.8181858, 5.614411, 1, 1, 1, 1, 1,
0.4057474, 0.5337825, 1.383843, 1, 1, 1, 1, 1,
0.4079511, 0.4415472, 0.5398436, 1, 1, 1, 1, 1,
0.4088939, 0.815466, 0.351829, 1, 1, 1, 1, 1,
0.4114406, 0.9342337, 0.6611018, 1, 1, 1, 1, 1,
0.4193306, 0.1110473, 2.871994, 1, 1, 1, 1, 1,
0.4224371, 0.2472101, 0.2420297, 1, 1, 1, 1, 1,
0.4295806, -1.247505, 2.623744, 1, 1, 1, 1, 1,
0.430096, 0.5136525, 0.0223308, 1, 1, 1, 1, 1,
0.436377, -0.868766, 1.205395, 1, 1, 1, 1, 1,
0.4401461, 0.6897461, 1.123305, 1, 1, 1, 1, 1,
0.4448411, 1.583639, 1.520253, 1, 1, 1, 1, 1,
0.4479913, -0.6226433, 1.945687, 0, 0, 1, 1, 1,
0.4532028, 0.7316008, -0.639548, 1, 0, 0, 1, 1,
0.4533824, 0.8980061, 0.4710721, 1, 0, 0, 1, 1,
0.4644824, 0.9783074, -1.353522, 1, 0, 0, 1, 1,
0.4656631, 0.482392, -0.6583793, 1, 0, 0, 1, 1,
0.4689179, -1.612882, 3.660531, 1, 0, 0, 1, 1,
0.4730944, 2.924477, -0.7615387, 0, 0, 0, 1, 1,
0.4741293, -1.088719, 2.471743, 0, 0, 0, 1, 1,
0.4752921, -1.344782, 0.8945656, 0, 0, 0, 1, 1,
0.4781616, -0.3382213, 1.782599, 0, 0, 0, 1, 1,
0.4782413, 0.22056, 0.9939168, 0, 0, 0, 1, 1,
0.4788061, -0.4378071, 3.116381, 0, 0, 0, 1, 1,
0.4850886, 1.324865, 0.5747414, 0, 0, 0, 1, 1,
0.4851467, -1.465605, 2.266006, 1, 1, 1, 1, 1,
0.4857473, -1.684211, 2.464743, 1, 1, 1, 1, 1,
0.4889257, -0.9814638, 1.421991, 1, 1, 1, 1, 1,
0.4897701, -0.6391484, 1.878538, 1, 1, 1, 1, 1,
0.4907134, -0.5751601, 2.173183, 1, 1, 1, 1, 1,
0.4908889, 2.435236, 1.168803, 1, 1, 1, 1, 1,
0.5040811, 0.779241, -0.08895288, 1, 1, 1, 1, 1,
0.5065597, 0.7700446, -0.1379123, 1, 1, 1, 1, 1,
0.5066845, 1.186537, 1.450921, 1, 1, 1, 1, 1,
0.506906, -2.058917, 4.416553, 1, 1, 1, 1, 1,
0.5072163, 0.8771324, -0.1981537, 1, 1, 1, 1, 1,
0.5080994, 2.001271, 1.19326, 1, 1, 1, 1, 1,
0.5103664, -0.4532408, 2.035383, 1, 1, 1, 1, 1,
0.5135968, -1.217294, 0.2549812, 1, 1, 1, 1, 1,
0.5184925, -0.5304315, 1.80162, 1, 1, 1, 1, 1,
0.5196115, 1.543325, 1.248619, 0, 0, 1, 1, 1,
0.5217102, 0.02342245, 2.370503, 1, 0, 0, 1, 1,
0.5235755, 0.3318357, 2.687746, 1, 0, 0, 1, 1,
0.5294384, 0.07360004, 1.034107, 1, 0, 0, 1, 1,
0.5295982, -0.6695198, 1.072393, 1, 0, 0, 1, 1,
0.5331676, 0.3446141, 0.02106053, 1, 0, 0, 1, 1,
0.5333136, -0.5142173, 4.742599, 0, 0, 0, 1, 1,
0.5346131, 0.2378911, 2.4661, 0, 0, 0, 1, 1,
0.5388702, -1.624999, 4.59883, 0, 0, 0, 1, 1,
0.5409752, -0.4416572, 0.1803692, 0, 0, 0, 1, 1,
0.5420623, -0.6932757, 2.748288, 0, 0, 0, 1, 1,
0.5444102, 0.2432301, 1.334978, 0, 0, 0, 1, 1,
0.5460135, 0.9283844, 1.076243, 0, 0, 0, 1, 1,
0.5488305, -0.07849862, 2.512709, 1, 1, 1, 1, 1,
0.5493071, -1.995099, 1.669463, 1, 1, 1, 1, 1,
0.55388, 1.949752, -0.5053475, 1, 1, 1, 1, 1,
0.5598549, -1.780025, 3.404707, 1, 1, 1, 1, 1,
0.5625749, -0.7991464, 3.727508, 1, 1, 1, 1, 1,
0.5641935, 0.7365448, 0.2780671, 1, 1, 1, 1, 1,
0.5700591, 0.08281733, 3.208467, 1, 1, 1, 1, 1,
0.5706165, -0.876236, 2.861649, 1, 1, 1, 1, 1,
0.5756496, -0.4490408, 1.457241, 1, 1, 1, 1, 1,
0.5839521, -0.4255017, 2.541525, 1, 1, 1, 1, 1,
0.5864128, -0.3809059, 2.004833, 1, 1, 1, 1, 1,
0.5883294, 0.3507979, 2.324362, 1, 1, 1, 1, 1,
0.5946767, -0.2889381, 3.472692, 1, 1, 1, 1, 1,
0.5961084, -1.188297, 2.559965, 1, 1, 1, 1, 1,
0.5971881, -1.381049, 2.551155, 1, 1, 1, 1, 1,
0.5995072, -0.2706201, 3.292846, 0, 0, 1, 1, 1,
0.6000572, 1.232187, -0.6729172, 1, 0, 0, 1, 1,
0.6023163, 0.3340821, 1.966214, 1, 0, 0, 1, 1,
0.6041616, -0.2631149, 1.05255, 1, 0, 0, 1, 1,
0.6044271, -0.4746873, 4.006054, 1, 0, 0, 1, 1,
0.604758, -0.2222458, 2.540444, 1, 0, 0, 1, 1,
0.6052801, -0.3003917, 2.482877, 0, 0, 0, 1, 1,
0.6075309, 1.339469, -0.5294487, 0, 0, 0, 1, 1,
0.6082339, 1.300754, 1.592041, 0, 0, 0, 1, 1,
0.6163605, 0.2327083, 2.2585, 0, 0, 0, 1, 1,
0.6223278, -0.4345885, 2.505616, 0, 0, 0, 1, 1,
0.6246619, 1.803223, -2.028036, 0, 0, 0, 1, 1,
0.624765, 0.2125092, 0.3934643, 0, 0, 0, 1, 1,
0.6257952, -0.7497327, 2.439692, 1, 1, 1, 1, 1,
0.6284288, -0.8819319, 2.132979, 1, 1, 1, 1, 1,
0.6330709, 0.9473147, -1.709968, 1, 1, 1, 1, 1,
0.635639, -0.2322167, 2.44758, 1, 1, 1, 1, 1,
0.6363689, 0.05109938, 3.081628, 1, 1, 1, 1, 1,
0.644017, 0.07122277, 1.875975, 1, 1, 1, 1, 1,
0.6485844, 0.5147166, 1.876981, 1, 1, 1, 1, 1,
0.6495022, -0.4846176, 3.239412, 1, 1, 1, 1, 1,
0.6525576, 0.8265931, 0.1296331, 1, 1, 1, 1, 1,
0.6531925, 0.1651633, 1.447802, 1, 1, 1, 1, 1,
0.6542786, -0.8596871, 1.243688, 1, 1, 1, 1, 1,
0.6586388, -0.1708965, 3.502086, 1, 1, 1, 1, 1,
0.6635761, 0.7695597, 0.3173833, 1, 1, 1, 1, 1,
0.6644055, 1.567815, 0.6224087, 1, 1, 1, 1, 1,
0.6648775, -0.9101022, 3.506764, 1, 1, 1, 1, 1,
0.6763827, 2.005475, 1.113075, 0, 0, 1, 1, 1,
0.6802167, 0.5154873, -0.1043372, 1, 0, 0, 1, 1,
0.6948384, -0.5962802, 3.28698, 1, 0, 0, 1, 1,
0.6951385, 2.058174, 0.9516023, 1, 0, 0, 1, 1,
0.697573, 2.260122, -0.4923872, 1, 0, 0, 1, 1,
0.7069987, -0.640684, 1.904665, 1, 0, 0, 1, 1,
0.7118307, -0.6226801, 2.251855, 0, 0, 0, 1, 1,
0.7223846, -0.5685317, 0.1212877, 0, 0, 0, 1, 1,
0.7234297, -1.148191, 3.754626, 0, 0, 0, 1, 1,
0.7240494, 0.8830322, -0.4021059, 0, 0, 0, 1, 1,
0.724808, 0.7568178, -0.7112249, 0, 0, 0, 1, 1,
0.7316429, 0.2269086, 0.9904462, 0, 0, 0, 1, 1,
0.7371898, 0.3367314, 1.633424, 0, 0, 0, 1, 1,
0.7388597, 0.104435, 2.428518, 1, 1, 1, 1, 1,
0.7423693, 1.727044, 0.5894138, 1, 1, 1, 1, 1,
0.7425632, 0.9585418, 0.1777395, 1, 1, 1, 1, 1,
0.7427917, 0.716466, 1.520597, 1, 1, 1, 1, 1,
0.7533949, -0.6981248, 3.325084, 1, 1, 1, 1, 1,
0.7571203, 0.171265, 3.328752, 1, 1, 1, 1, 1,
0.757263, 0.7441391, -0.05209248, 1, 1, 1, 1, 1,
0.7612898, 0.2973971, 0.9512197, 1, 1, 1, 1, 1,
0.764547, 0.5897932, -0.1892278, 1, 1, 1, 1, 1,
0.7663148, 0.3786736, -1.23947, 1, 1, 1, 1, 1,
0.7666634, -0.6595461, 0.7331762, 1, 1, 1, 1, 1,
0.7674103, -0.03449919, 0.1670172, 1, 1, 1, 1, 1,
0.7747399, 1.44948, 1.753368, 1, 1, 1, 1, 1,
0.7748132, -0.1392748, 3.120741, 1, 1, 1, 1, 1,
0.7754964, 0.9377941, 0.2444232, 1, 1, 1, 1, 1,
0.7757093, 0.1407103, 2.054414, 0, 0, 1, 1, 1,
0.7757538, -0.9873726, 1.310169, 1, 0, 0, 1, 1,
0.7771887, 0.8435529, 2.570582, 1, 0, 0, 1, 1,
0.7864881, 0.6193762, -0.002512567, 1, 0, 0, 1, 1,
0.7870307, 1.03454, 1.476036, 1, 0, 0, 1, 1,
0.787262, -0.7283701, 4.15362, 1, 0, 0, 1, 1,
0.7938388, -0.6069507, 1.202738, 0, 0, 0, 1, 1,
0.7946283, -0.637143, 1.443756, 0, 0, 0, 1, 1,
0.796482, -0.6593629, 4.601364, 0, 0, 0, 1, 1,
0.8000139, -0.2674395, 3.42811, 0, 0, 0, 1, 1,
0.8043046, -0.9388016, 1.278073, 0, 0, 0, 1, 1,
0.804562, 1.812181, -0.09194394, 0, 0, 0, 1, 1,
0.8057886, -2.205344, 3.063603, 0, 0, 0, 1, 1,
0.8065439, 0.2751515, 1.183209, 1, 1, 1, 1, 1,
0.8071172, -0.06952424, 3.090994, 1, 1, 1, 1, 1,
0.808032, -0.6022904, -0.03410317, 1, 1, 1, 1, 1,
0.8088896, 0.9845837, 0.8078718, 1, 1, 1, 1, 1,
0.8112086, 0.2250031, 1.985541, 1, 1, 1, 1, 1,
0.8118206, 0.109892, 1.445457, 1, 1, 1, 1, 1,
0.8142802, -0.1294078, 3.36111, 1, 1, 1, 1, 1,
0.8198223, 0.6146985, 1.049344, 1, 1, 1, 1, 1,
0.8201196, -0.9667967, 3.615755, 1, 1, 1, 1, 1,
0.8231246, -0.8564088, 0.02853744, 1, 1, 1, 1, 1,
0.8254166, 0.8673698, 1.367443, 1, 1, 1, 1, 1,
0.8307766, 1.180096, -0.8931874, 1, 1, 1, 1, 1,
0.8315831, -1.745228, 4.276282, 1, 1, 1, 1, 1,
0.8327976, -0.9631547, 2.824044, 1, 1, 1, 1, 1,
0.8330635, 0.6736031, 0.7885715, 1, 1, 1, 1, 1,
0.8332068, 0.05464717, 1.489594, 0, 0, 1, 1, 1,
0.8349658, -0.2855649, 3.551447, 1, 0, 0, 1, 1,
0.838424, -0.5934939, 2.183981, 1, 0, 0, 1, 1,
0.8397276, -0.1226283, 1.508259, 1, 0, 0, 1, 1,
0.8421831, 0.3131834, 0.7760272, 1, 0, 0, 1, 1,
0.8470799, 0.2432349, -0.6120182, 1, 0, 0, 1, 1,
0.8543901, -0.4871215, 2.986496, 0, 0, 0, 1, 1,
0.8586437, -2.295408, 2.493526, 0, 0, 0, 1, 1,
0.8602546, 0.8086889, 0.280046, 0, 0, 0, 1, 1,
0.8624544, 1.198511, 0.8859513, 0, 0, 0, 1, 1,
0.8654885, -0.5984018, 1.953668, 0, 0, 0, 1, 1,
0.8696475, -0.004099853, 1.166282, 0, 0, 0, 1, 1,
0.8707342, 0.5164605, 0.763239, 0, 0, 0, 1, 1,
0.87144, 1.254584, -0.5007769, 1, 1, 1, 1, 1,
0.8854952, 0.2199258, 0.397715, 1, 1, 1, 1, 1,
0.8870537, 0.3259101, 0.4475018, 1, 1, 1, 1, 1,
0.888707, 0.04614139, -0.1135333, 1, 1, 1, 1, 1,
0.8918459, 0.9408306, 0.02723171, 1, 1, 1, 1, 1,
0.9007486, 0.9255196, -1.532729, 1, 1, 1, 1, 1,
0.9041476, 0.7001948, 1.243166, 1, 1, 1, 1, 1,
0.905283, 1.197878, 0.4801025, 1, 1, 1, 1, 1,
0.9091153, -0.6153217, 2.790008, 1, 1, 1, 1, 1,
0.9093318, 1.103542, -0.001697416, 1, 1, 1, 1, 1,
0.9153753, -0.6252792, 3.019418, 1, 1, 1, 1, 1,
0.9155518, 0.8965276, 0.2133765, 1, 1, 1, 1, 1,
0.9177746, -0.05445862, 2.474116, 1, 1, 1, 1, 1,
0.9227796, -0.08254796, 3.133251, 1, 1, 1, 1, 1,
0.9277818, -0.005467879, 2.245983, 1, 1, 1, 1, 1,
0.92972, -0.2659529, 2.713915, 0, 0, 1, 1, 1,
0.9320274, 0.8060512, -0.05670634, 1, 0, 0, 1, 1,
0.9390463, -0.9847306, 1.827933, 1, 0, 0, 1, 1,
0.9404533, -1.468995, 1.437354, 1, 0, 0, 1, 1,
0.9452781, 0.08618932, 1.053697, 1, 0, 0, 1, 1,
0.9713832, 0.5063677, 2.407771, 1, 0, 0, 1, 1,
0.9713916, -0.006265375, 3.06758, 0, 0, 0, 1, 1,
0.9743012, 0.4215139, -1.064747, 0, 0, 0, 1, 1,
0.9778439, 0.1753019, 1.041258, 0, 0, 0, 1, 1,
0.979148, 1.522801, 0.9536667, 0, 0, 0, 1, 1,
0.9805011, -0.4882764, 2.825178, 0, 0, 0, 1, 1,
0.9935926, -0.1607159, 2.727212, 0, 0, 0, 1, 1,
0.9999196, -0.6296352, 2.457363, 0, 0, 0, 1, 1,
1.016408, -0.4877657, 2.522711, 1, 1, 1, 1, 1,
1.017807, 0.6420727, 1.043606, 1, 1, 1, 1, 1,
1.028824, 0.5541871, 2.378814, 1, 1, 1, 1, 1,
1.036272, 0.9764929, 0.364813, 1, 1, 1, 1, 1,
1.041241, -0.5964707, 0.6616907, 1, 1, 1, 1, 1,
1.044243, -1.092017, 4.913593, 1, 1, 1, 1, 1,
1.044574, 0.4164405, 2.193258, 1, 1, 1, 1, 1,
1.048148, 0.8690221, -0.1583215, 1, 1, 1, 1, 1,
1.050029, -0.4755706, 3.560235, 1, 1, 1, 1, 1,
1.0519, -1.725868, 1.928992, 1, 1, 1, 1, 1,
1.054753, 0.7790729, 0.2757984, 1, 1, 1, 1, 1,
1.055965, 1.047669, 0.4271813, 1, 1, 1, 1, 1,
1.056003, -0.7255361, 0.1647668, 1, 1, 1, 1, 1,
1.061065, 1.005122, 0.7103687, 1, 1, 1, 1, 1,
1.08154, -0.5480738, 1.619033, 1, 1, 1, 1, 1,
1.085575, 0.4443531, 4.194257, 0, 0, 1, 1, 1,
1.093308, -0.9457164, 3.280318, 1, 0, 0, 1, 1,
1.10769, 0.1251531, 1.701025, 1, 0, 0, 1, 1,
1.112524, 0.6404324, 0.8702353, 1, 0, 0, 1, 1,
1.113917, -0.4445194, 0.7252479, 1, 0, 0, 1, 1,
1.134402, -0.6172988, 3.053371, 1, 0, 0, 1, 1,
1.13838, -0.18155, 1.380745, 0, 0, 0, 1, 1,
1.143722, -0.8298551, 2.226159, 0, 0, 0, 1, 1,
1.147848, -1.556501, 2.607565, 0, 0, 0, 1, 1,
1.153008, -0.3684207, 1.793303, 0, 0, 0, 1, 1,
1.155763, -0.9676533, 2.260495, 0, 0, 0, 1, 1,
1.158482, 1.069692, 1.051235, 0, 0, 0, 1, 1,
1.158705, 0.5995254, 1.558672, 0, 0, 0, 1, 1,
1.168841, 0.1237832, 0.2885458, 1, 1, 1, 1, 1,
1.171318, -0.05353947, 1.916647, 1, 1, 1, 1, 1,
1.171459, -1.238474, 1.950249, 1, 1, 1, 1, 1,
1.174245, 0.3372823, 3.235621, 1, 1, 1, 1, 1,
1.18095, -0.0257911, 3.200527, 1, 1, 1, 1, 1,
1.184098, 0.0925227, 1.669021, 1, 1, 1, 1, 1,
1.188027, 1.034147, 1.585922, 1, 1, 1, 1, 1,
1.191027, 0.4541208, 0.9431608, 1, 1, 1, 1, 1,
1.199689, -0.6526718, 1.892455, 1, 1, 1, 1, 1,
1.215759, -0.6209528, 3.030846, 1, 1, 1, 1, 1,
1.253635, -0.0608707, 1.857821, 1, 1, 1, 1, 1,
1.25414, 0.1750923, 1.031529, 1, 1, 1, 1, 1,
1.257993, 0.2805395, 2.172688, 1, 1, 1, 1, 1,
1.265089, 0.9214259, 0.6932995, 1, 1, 1, 1, 1,
1.273528, 0.9278421, 1.233197, 1, 1, 1, 1, 1,
1.277406, -1.134723, 3.877255, 0, 0, 1, 1, 1,
1.294258, 1.909003, 1.127463, 1, 0, 0, 1, 1,
1.2983, -1.74186, 1.434447, 1, 0, 0, 1, 1,
1.30308, 1.561579, 0.343652, 1, 0, 0, 1, 1,
1.306714, -1.902178, 0.2983165, 1, 0, 0, 1, 1,
1.30793, 1.3632, -0.451739, 1, 0, 0, 1, 1,
1.310741, 0.5595901, -1.560616, 0, 0, 0, 1, 1,
1.314711, 2.505359, 0.5791897, 0, 0, 0, 1, 1,
1.324185, -0.1314902, -1.601597, 0, 0, 0, 1, 1,
1.32646, 0.04216211, 1.468828, 0, 0, 0, 1, 1,
1.328699, 0.6019416, 1.2964, 0, 0, 0, 1, 1,
1.331198, -0.6975164, 2.616058, 0, 0, 0, 1, 1,
1.333167, 0.5917805, 0.851297, 0, 0, 0, 1, 1,
1.337222, 0.2956359, 2.030569, 1, 1, 1, 1, 1,
1.345462, -0.7797911, 1.031875, 1, 1, 1, 1, 1,
1.351169, -0.5214438, 1.017821, 1, 1, 1, 1, 1,
1.357688, 0.1408216, 1.814387, 1, 1, 1, 1, 1,
1.379345, 0.444997, 1.493934, 1, 1, 1, 1, 1,
1.384694, -0.9052196, 1.582096, 1, 1, 1, 1, 1,
1.392247, 0.6063465, -1.436267, 1, 1, 1, 1, 1,
1.416746, 0.6461658, 2.105784, 1, 1, 1, 1, 1,
1.420397, 0.1756947, 0.6140636, 1, 1, 1, 1, 1,
1.425062, 0.7249961, -0.01315827, 1, 1, 1, 1, 1,
1.429152, -0.9120188, 2.164824, 1, 1, 1, 1, 1,
1.430845, 1.186153, 1.097299, 1, 1, 1, 1, 1,
1.43387, 1.304644, 3.300237, 1, 1, 1, 1, 1,
1.454656, 0.1577584, 1.331966, 1, 1, 1, 1, 1,
1.464166, -2.06005, 1.079493, 1, 1, 1, 1, 1,
1.470157, -0.6319304, 2.022036, 0, 0, 1, 1, 1,
1.473612, 3.201215, 1.19177, 1, 0, 0, 1, 1,
1.500579, 1.035686, 1.77738, 1, 0, 0, 1, 1,
1.502978, 0.5880786, 2.575168, 1, 0, 0, 1, 1,
1.505575, -0.9216354, 0.5135717, 1, 0, 0, 1, 1,
1.511685, -1.922611, 2.363421, 1, 0, 0, 1, 1,
1.521331, 1.372609, -2.112492, 0, 0, 0, 1, 1,
1.53322, 1.068292, 2.331346, 0, 0, 0, 1, 1,
1.535411, -0.2984202, 1.253866, 0, 0, 0, 1, 1,
1.543165, -0.2105549, 0.3453842, 0, 0, 0, 1, 1,
1.567701, -0.5033072, 1.095527, 0, 0, 0, 1, 1,
1.570537, -0.2430342, 2.033077, 0, 0, 0, 1, 1,
1.57782, 0.9579851, 2.916126, 0, 0, 0, 1, 1,
1.582378, -0.6214488, 1.952883, 1, 1, 1, 1, 1,
1.593242, 1.276052, 0.1745779, 1, 1, 1, 1, 1,
1.594862, 0.3911962, 1.395834, 1, 1, 1, 1, 1,
1.613596, 0.1097094, 2.840952, 1, 1, 1, 1, 1,
1.616148, -1.15215, 1.7502, 1, 1, 1, 1, 1,
1.616308, -0.4054627, 0.2120449, 1, 1, 1, 1, 1,
1.620716, 0.9548059, -0.8400609, 1, 1, 1, 1, 1,
1.628162, 0.08857167, 2.075293, 1, 1, 1, 1, 1,
1.637529, -0.7012601, 2.641592, 1, 1, 1, 1, 1,
1.676714, -0.1435886, 3.237411, 1, 1, 1, 1, 1,
1.680085, -0.8346082, 3.010592, 1, 1, 1, 1, 1,
1.682113, 0.268692, 1.670803, 1, 1, 1, 1, 1,
1.683859, -0.1500709, 2.98713, 1, 1, 1, 1, 1,
1.699285, -0.2246111, 0.9694135, 1, 1, 1, 1, 1,
1.70596, 0.6572818, 1.708256, 1, 1, 1, 1, 1,
1.706923, -0.7054001, 3.589965, 0, 0, 1, 1, 1,
1.720789, -2.192996, 2.51492, 1, 0, 0, 1, 1,
1.724476, 0.5165581, 2.333795, 1, 0, 0, 1, 1,
1.726731, -1.062378, 1.242476, 1, 0, 0, 1, 1,
1.754689, 0.2058761, 0.9485886, 1, 0, 0, 1, 1,
1.76075, -1.427164, 2.13343, 1, 0, 0, 1, 1,
1.772671, -0.5000696, 2.111414, 0, 0, 0, 1, 1,
1.774924, -0.9024156, 2.088164, 0, 0, 0, 1, 1,
1.784362, -0.7316644, 3.229023, 0, 0, 0, 1, 1,
1.792615, -0.4640398, 2.625482, 0, 0, 0, 1, 1,
1.799463, 0.5762624, 2.234103, 0, 0, 0, 1, 1,
1.823293, 1.291147, -1.191234, 0, 0, 0, 1, 1,
1.840466, -0.9407356, 2.722318, 0, 0, 0, 1, 1,
1.846376, 0.790953, 1.628058, 1, 1, 1, 1, 1,
1.84847, 0.5487785, 2.014574, 1, 1, 1, 1, 1,
1.904877, -0.05039096, -0.5699196, 1, 1, 1, 1, 1,
1.917683, -0.09555285, 3.27579, 1, 1, 1, 1, 1,
1.924938, 0.2442119, 0.7806231, 1, 1, 1, 1, 1,
1.927335, -1.303497, 2.519029, 1, 1, 1, 1, 1,
2.011102, -1.006627, 2.181592, 1, 1, 1, 1, 1,
2.023113, 0.1225099, 2.086101, 1, 1, 1, 1, 1,
2.025387, -0.5846651, 0.4726011, 1, 1, 1, 1, 1,
2.027565, 0.564186, 1.10336, 1, 1, 1, 1, 1,
2.036257, 1.071852, 0.5340526, 1, 1, 1, 1, 1,
2.075123, -0.4783169, 2.576832, 1, 1, 1, 1, 1,
2.076918, -1.963465, 3.938803, 1, 1, 1, 1, 1,
2.083456, 0.5251939, 3.138622, 1, 1, 1, 1, 1,
2.115833, -1.319776, -0.559438, 1, 1, 1, 1, 1,
2.118047, 1.661136, 1.457049, 0, 0, 1, 1, 1,
2.154335, -1.222578, 0.4047608, 1, 0, 0, 1, 1,
2.163273, 0.06766995, 2.393069, 1, 0, 0, 1, 1,
2.190163, 0.8127626, 0.7095958, 1, 0, 0, 1, 1,
2.275584, -1.426022, 2.125064, 1, 0, 0, 1, 1,
2.317916, -0.7199616, 1.558429, 1, 0, 0, 1, 1,
2.32799, -0.2501455, -0.793315, 0, 0, 0, 1, 1,
2.359122, -0.4753804, 1.21623, 0, 0, 0, 1, 1,
2.372604, -0.7219325, 3.547711, 0, 0, 0, 1, 1,
2.400917, 0.4152257, 0.7520688, 0, 0, 0, 1, 1,
2.413957, -0.3936541, 1.671594, 0, 0, 0, 1, 1,
2.432602, 0.7676145, 0.839783, 0, 0, 0, 1, 1,
2.440907, -1.528252, 0.9575446, 0, 0, 0, 1, 1,
2.552568, 1.776274, 0.8745306, 1, 1, 1, 1, 1,
2.559992, 1.064568, 0.4610615, 1, 1, 1, 1, 1,
2.606854, 1.234505, 0.9529684, 1, 1, 1, 1, 1,
2.630776, 0.1600885, 2.039775, 1, 1, 1, 1, 1,
2.660507, 0.4875855, 2.727189, 1, 1, 1, 1, 1,
2.782538, 2.043215, 0.4623777, 1, 1, 1, 1, 1,
3.119212, 1.597301, 1.20074, 1, 1, 1, 1, 1
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
var radius = 9.512909;
var distance = 33.41369;
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
mvMatrix.translate( 0.112278, -0.2827857, -0.1700325 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41369);
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
