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
-3.444199, -0.3284748, -0.09425783, 1, 0, 0, 1,
-2.64067, -0.1741035, -1.901254, 1, 0.007843138, 0, 1,
-2.596425, 0.04738294, -1.408879, 1, 0.01176471, 0, 1,
-2.582669, 0.8932089, -1.525947, 1, 0.01960784, 0, 1,
-2.559381, 0.2069513, -3.071543, 1, 0.02352941, 0, 1,
-2.5185, 0.2898893, -2.302811, 1, 0.03137255, 0, 1,
-2.492638, 0.5285756, -1.614382, 1, 0.03529412, 0, 1,
-2.441208, 0.1928565, -2.713724, 1, 0.04313726, 0, 1,
-2.422482, -0.938198, -1.825907, 1, 0.04705882, 0, 1,
-2.289631, 0.8800457, -0.3592575, 1, 0.05490196, 0, 1,
-2.225569, -0.5282589, 0.1502321, 1, 0.05882353, 0, 1,
-2.200175, -0.2731898, -2.987292, 1, 0.06666667, 0, 1,
-2.168536, -0.7385489, -1.838551, 1, 0.07058824, 0, 1,
-2.164258, 0.4764354, 0.3259823, 1, 0.07843138, 0, 1,
-2.125948, -0.7239866, -2.637119, 1, 0.08235294, 0, 1,
-2.086249, 2.040019, -1.524561, 1, 0.09019608, 0, 1,
-2.030714, -0.8874654, -2.3973, 1, 0.09411765, 0, 1,
-2.02997, -0.8596549, -0.7519161, 1, 0.1019608, 0, 1,
-2.016099, 0.1400785, -1.407681, 1, 0.1098039, 0, 1,
-1.998148, -0.1294478, -2.956907, 1, 0.1137255, 0, 1,
-1.997112, 2.166651, -0.8249221, 1, 0.1215686, 0, 1,
-1.994625, -0.6081842, -2.899605, 1, 0.1254902, 0, 1,
-1.994403, -0.8854781, -2.403855, 1, 0.1333333, 0, 1,
-1.989854, -0.7127759, -1.583785, 1, 0.1372549, 0, 1,
-1.978393, -0.2569889, -0.5586069, 1, 0.145098, 0, 1,
-1.947672, 1.185032, -1.901245, 1, 0.1490196, 0, 1,
-1.945072, -1.29516, -3.998682, 1, 0.1568628, 0, 1,
-1.93033, -0.7854646, -2.372334, 1, 0.1607843, 0, 1,
-1.919457, -0.749926, -4.294834, 1, 0.1686275, 0, 1,
-1.901618, 0.3543743, -1.405148, 1, 0.172549, 0, 1,
-1.897047, 0.03250923, -0.8240907, 1, 0.1803922, 0, 1,
-1.854972, 0.3138247, -3.018472, 1, 0.1843137, 0, 1,
-1.849476, -0.9058225, -1.515916, 1, 0.1921569, 0, 1,
-1.83399, -2.582359, -2.821531, 1, 0.1960784, 0, 1,
-1.833272, -1.339611, -1.857945, 1, 0.2039216, 0, 1,
-1.810037, 0.6376945, -1.230077, 1, 0.2117647, 0, 1,
-1.799976, -0.3360378, -3.161991, 1, 0.2156863, 0, 1,
-1.768959, -0.06300732, -2.27461, 1, 0.2235294, 0, 1,
-1.765388, 0.4459487, -0.8031875, 1, 0.227451, 0, 1,
-1.757176, 0.7046678, -0.6999988, 1, 0.2352941, 0, 1,
-1.749381, -1.53186, -2.140965, 1, 0.2392157, 0, 1,
-1.749174, -0.5489771, -1.788494, 1, 0.2470588, 0, 1,
-1.747329, -0.473762, -2.20861, 1, 0.2509804, 0, 1,
-1.725289, -0.632586, -1.860486, 1, 0.2588235, 0, 1,
-1.711076, 0.469705, -1.06799, 1, 0.2627451, 0, 1,
-1.70993, 1.152834, -1.359724, 1, 0.2705882, 0, 1,
-1.708478, 1.124136, -0.2751981, 1, 0.2745098, 0, 1,
-1.687947, -0.2036408, -2.673997, 1, 0.282353, 0, 1,
-1.67055, 1.563311, -1.52158, 1, 0.2862745, 0, 1,
-1.655441, 1.566231, -0.9685427, 1, 0.2941177, 0, 1,
-1.655115, -0.6760525, -0.5828345, 1, 0.3019608, 0, 1,
-1.649559, 0.5962914, -1.204004, 1, 0.3058824, 0, 1,
-1.647186, -0.2601303, -1.263505, 1, 0.3137255, 0, 1,
-1.643922, -0.3495248, -1.408809, 1, 0.3176471, 0, 1,
-1.643662, 1.298666, -1.850265, 1, 0.3254902, 0, 1,
-1.616368, 1.18915, -0.9162071, 1, 0.3294118, 0, 1,
-1.600302, -0.5556117, -2.344697, 1, 0.3372549, 0, 1,
-1.596613, 1.483384, -0.1888167, 1, 0.3411765, 0, 1,
-1.583203, 1.924268, -1.01212, 1, 0.3490196, 0, 1,
-1.581522, 0.474407, -0.4091416, 1, 0.3529412, 0, 1,
-1.558982, 0.3856604, -0.6032032, 1, 0.3607843, 0, 1,
-1.556433, 1.355993, -2.809632, 1, 0.3647059, 0, 1,
-1.540974, 1.204642, -0.1357805, 1, 0.372549, 0, 1,
-1.532957, 0.5974006, -0.8812608, 1, 0.3764706, 0, 1,
-1.527178, -0.1031895, -2.52269, 1, 0.3843137, 0, 1,
-1.525135, -0.6646894, -1.680255, 1, 0.3882353, 0, 1,
-1.512849, -1.450991, -2.356527, 1, 0.3960784, 0, 1,
-1.510227, 2.423797, -0.5024644, 1, 0.4039216, 0, 1,
-1.49967, 0.834075, -1.654283, 1, 0.4078431, 0, 1,
-1.495397, 0.6441217, -2.115491, 1, 0.4156863, 0, 1,
-1.482999, -0.8960887, -3.394434, 1, 0.4196078, 0, 1,
-1.47651, -0.5626184, -1.776788, 1, 0.427451, 0, 1,
-1.466621, 0.3400493, -0.6134452, 1, 0.4313726, 0, 1,
-1.448354, 1.299392, -0.06183441, 1, 0.4392157, 0, 1,
-1.442674, 0.364236, -1.089096, 1, 0.4431373, 0, 1,
-1.43979, 1.16601, -0.03601969, 1, 0.4509804, 0, 1,
-1.423042, -0.1061956, 0.3674819, 1, 0.454902, 0, 1,
-1.415847, -1.019927, -2.484551, 1, 0.4627451, 0, 1,
-1.414675, -0.7384968, -1.856243, 1, 0.4666667, 0, 1,
-1.413611, 0.9028205, -0.6309153, 1, 0.4745098, 0, 1,
-1.40475, 0.09095894, -0.783805, 1, 0.4784314, 0, 1,
-1.398904, -0.2576062, -1.119598, 1, 0.4862745, 0, 1,
-1.387641, 0.188836, -2.737231, 1, 0.4901961, 0, 1,
-1.387107, 0.4264042, -1.320299, 1, 0.4980392, 0, 1,
-1.386371, 0.7796485, -0.9080278, 1, 0.5058824, 0, 1,
-1.384224, 0.2736274, -2.018169, 1, 0.509804, 0, 1,
-1.377016, -0.9870667, -2.008982, 1, 0.5176471, 0, 1,
-1.372398, -0.5735282, -1.025931, 1, 0.5215687, 0, 1,
-1.365313, 0.7264684, -1.111462, 1, 0.5294118, 0, 1,
-1.359203, 1.612479, -0.6848341, 1, 0.5333334, 0, 1,
-1.331556, -0.659118, -1.777466, 1, 0.5411765, 0, 1,
-1.331025, -2.619968, -2.625525, 1, 0.5450981, 0, 1,
-1.33086, 1.787097, -0.8198938, 1, 0.5529412, 0, 1,
-1.326128, 0.09771411, -1.349417, 1, 0.5568628, 0, 1,
-1.324798, 0.6548576, 0.7732983, 1, 0.5647059, 0, 1,
-1.323772, -2.349907, -2.110489, 1, 0.5686275, 0, 1,
-1.319738, 2.034324, -1.231213, 1, 0.5764706, 0, 1,
-1.318353, -1.356877, -2.681188, 1, 0.5803922, 0, 1,
-1.300578, -0.8711922, -0.8659218, 1, 0.5882353, 0, 1,
-1.295725, -2.025606, -2.067718, 1, 0.5921569, 0, 1,
-1.292851, 0.3455671, -0.9240478, 1, 0.6, 0, 1,
-1.287475, -1.226298, -1.790058, 1, 0.6078432, 0, 1,
-1.283377, 0.009459785, 0.1863239, 1, 0.6117647, 0, 1,
-1.283088, -0.6973928, -1.815597, 1, 0.6196079, 0, 1,
-1.281827, -0.3900633, -1.023727, 1, 0.6235294, 0, 1,
-1.261403, -0.5950405, -0.9334769, 1, 0.6313726, 0, 1,
-1.257739, -2.552114, -3.974169, 1, 0.6352941, 0, 1,
-1.253527, 0.4588738, -1.62553, 1, 0.6431373, 0, 1,
-1.251675, 0.9158779, -1.209698, 1, 0.6470588, 0, 1,
-1.2497, 1.255702, -1.129037, 1, 0.654902, 0, 1,
-1.239874, -0.03675795, -2.168454, 1, 0.6588235, 0, 1,
-1.232492, -1.509483, -2.470162, 1, 0.6666667, 0, 1,
-1.229216, 1.061528, -1.169014, 1, 0.6705883, 0, 1,
-1.227066, 0.8161347, -1.852959, 1, 0.6784314, 0, 1,
-1.218108, -0.7726748, -3.02229, 1, 0.682353, 0, 1,
-1.214763, 0.228584, -2.21699, 1, 0.6901961, 0, 1,
-1.21364, -0.1800477, -2.898994, 1, 0.6941177, 0, 1,
-1.204202, 1.703818, -1.590084, 1, 0.7019608, 0, 1,
-1.202466, 0.1725733, -1.599098, 1, 0.7098039, 0, 1,
-1.189195, 0.2402391, -1.038905, 1, 0.7137255, 0, 1,
-1.184549, -0.2496132, -0.5915524, 1, 0.7215686, 0, 1,
-1.184425, 0.01464249, -2.309777, 1, 0.7254902, 0, 1,
-1.183015, -1.628435, -3.199165, 1, 0.7333333, 0, 1,
-1.178706, -1.416029, -2.927717, 1, 0.7372549, 0, 1,
-1.172689, -1.025508, -3.11314, 1, 0.7450981, 0, 1,
-1.169901, -1.464219, -2.497544, 1, 0.7490196, 0, 1,
-1.167869, 0.7673982, -0.647653, 1, 0.7568628, 0, 1,
-1.167341, -1.085818, -1.252182, 1, 0.7607843, 0, 1,
-1.164342, -0.5350704, -2.578982, 1, 0.7686275, 0, 1,
-1.156565, 0.06341726, -2.07947, 1, 0.772549, 0, 1,
-1.1426, -0.1285204, -2.414394, 1, 0.7803922, 0, 1,
-1.138923, -0.7572989, -2.0244, 1, 0.7843137, 0, 1,
-1.137294, 2.103097, 0.00371059, 1, 0.7921569, 0, 1,
-1.126519, -2.346028, -4.329911, 1, 0.7960784, 0, 1,
-1.116979, -0.3634605, -2.486876, 1, 0.8039216, 0, 1,
-1.114559, -0.8540128, 0.06862854, 1, 0.8117647, 0, 1,
-1.11235, 1.207503, -2.187879, 1, 0.8156863, 0, 1,
-1.107261, -1.426155, -1.575912, 1, 0.8235294, 0, 1,
-1.104569, -0.4260674, -1.255195, 1, 0.827451, 0, 1,
-1.095947, -1.155029, -1.212718, 1, 0.8352941, 0, 1,
-1.075617, 1.008793, -1.358726, 1, 0.8392157, 0, 1,
-1.075085, -0.2431027, -1.51076, 1, 0.8470588, 0, 1,
-1.071434, -0.434031, -2.066391, 1, 0.8509804, 0, 1,
-1.058303, 0.4529002, -1.797846, 1, 0.8588235, 0, 1,
-1.05374, 0.0439897, -0.494069, 1, 0.8627451, 0, 1,
-1.050506, -0.7749889, -2.206422, 1, 0.8705882, 0, 1,
-1.038388, -1.208004, -2.009966, 1, 0.8745098, 0, 1,
-1.03553, 0.7643136, -0.5921127, 1, 0.8823529, 0, 1,
-1.034819, 1.187723, -0.8887931, 1, 0.8862745, 0, 1,
-1.032786, 0.453277, -1.308521, 1, 0.8941177, 0, 1,
-1.025681, -0.3220481, -2.445503, 1, 0.8980392, 0, 1,
-1.023055, 1.615143, 0.5872768, 1, 0.9058824, 0, 1,
-1.022725, 0.3110622, 0.08169744, 1, 0.9137255, 0, 1,
-1.021055, -0.3078839, -1.992492, 1, 0.9176471, 0, 1,
-1.01829, 0.001667091, -1.441271, 1, 0.9254902, 0, 1,
-1.014061, -1.333681, -3.014177, 1, 0.9294118, 0, 1,
-1.008116, 1.107298, -1.159648, 1, 0.9372549, 0, 1,
-1.004746, -0.4488854, -3.339228, 1, 0.9411765, 0, 1,
-1.003921, -0.806196, -1.39922, 1, 0.9490196, 0, 1,
-1.002195, 1.146137, -1.920908, 1, 0.9529412, 0, 1,
-0.9990534, 0.7503405, -1.396288, 1, 0.9607843, 0, 1,
-0.998489, -0.1109349, -0.6538095, 1, 0.9647059, 0, 1,
-0.9842427, -0.2519971, -2.612903, 1, 0.972549, 0, 1,
-0.9831057, -0.3937265, -2.552601, 1, 0.9764706, 0, 1,
-0.9696704, -0.4039732, -0.4274732, 1, 0.9843137, 0, 1,
-0.9686496, 0.8103881, 0.685092, 1, 0.9882353, 0, 1,
-0.9646676, -1.399719, -0.9404162, 1, 0.9960784, 0, 1,
-0.9600482, 1.221522, -1.636813, 0.9960784, 1, 0, 1,
-0.9577988, -1.406972, -3.287904, 0.9921569, 1, 0, 1,
-0.9448009, 0.5402969, -1.982909, 0.9843137, 1, 0, 1,
-0.9387155, 0.3970647, -2.330663, 0.9803922, 1, 0, 1,
-0.932013, 0.612324, -2.390473, 0.972549, 1, 0, 1,
-0.9284639, -0.2725604, -2.52432, 0.9686275, 1, 0, 1,
-0.927819, 1.280408, -1.615476, 0.9607843, 1, 0, 1,
-0.9262192, 0.2330368, -0.408867, 0.9568627, 1, 0, 1,
-0.9190271, 0.3972676, -0.59253, 0.9490196, 1, 0, 1,
-0.9067872, -0.8568212, -2.543878, 0.945098, 1, 0, 1,
-0.9058347, 1.465474, -0.6957479, 0.9372549, 1, 0, 1,
-0.9044309, -0.1169292, -2.503605, 0.9333333, 1, 0, 1,
-0.8988095, 0.755855, -1.370865, 0.9254902, 1, 0, 1,
-0.8979284, -0.3160394, -3.954175, 0.9215686, 1, 0, 1,
-0.8945073, 0.2977239, -0.8884656, 0.9137255, 1, 0, 1,
-0.8911177, -0.6712289, -2.664587, 0.9098039, 1, 0, 1,
-0.8893211, -0.001221009, -2.455434, 0.9019608, 1, 0, 1,
-0.886135, -1.394965, -4.227396, 0.8941177, 1, 0, 1,
-0.8825278, 0.428652, -0.8013992, 0.8901961, 1, 0, 1,
-0.8805671, 0.07010108, -1.976603, 0.8823529, 1, 0, 1,
-0.8754789, 1.706444, 0.9921595, 0.8784314, 1, 0, 1,
-0.8691233, 1.201117, -1.427083, 0.8705882, 1, 0, 1,
-0.8682593, -0.2751547, -2.313951, 0.8666667, 1, 0, 1,
-0.8673193, 0.6054307, -1.438437, 0.8588235, 1, 0, 1,
-0.8670844, -0.6843702, -2.539446, 0.854902, 1, 0, 1,
-0.8659009, 0.6034495, -1.147051, 0.8470588, 1, 0, 1,
-0.8599439, -1.021123, -2.405942, 0.8431373, 1, 0, 1,
-0.8595116, 0.1105691, -0.1994517, 0.8352941, 1, 0, 1,
-0.8577432, -0.2591555, -1.472634, 0.8313726, 1, 0, 1,
-0.8568671, 1.2564, 0.06391165, 0.8235294, 1, 0, 1,
-0.8522736, 1.778283, -0.3634, 0.8196079, 1, 0, 1,
-0.8489965, 0.3486304, 0.4491914, 0.8117647, 1, 0, 1,
-0.8420882, 2.527038, -1.119441, 0.8078431, 1, 0, 1,
-0.8401335, 0.5535161, -2.733432, 0.8, 1, 0, 1,
-0.8342772, 0.7506059, -0.6730003, 0.7921569, 1, 0, 1,
-0.8338087, 0.3180939, -2.376891, 0.7882353, 1, 0, 1,
-0.8269315, -0.5107098, -0.8807851, 0.7803922, 1, 0, 1,
-0.8260986, -0.4985141, -2.552139, 0.7764706, 1, 0, 1,
-0.8227851, -0.208357, -2.39329, 0.7686275, 1, 0, 1,
-0.8220903, -0.005324174, -1.866847, 0.7647059, 1, 0, 1,
-0.8212972, 1.295626, -0.4154718, 0.7568628, 1, 0, 1,
-0.8171965, 0.03049425, -1.907022, 0.7529412, 1, 0, 1,
-0.8068455, 0.5941522, 0.6571619, 0.7450981, 1, 0, 1,
-0.8049585, 0.8350435, 0.2113088, 0.7411765, 1, 0, 1,
-0.8046365, -0.07605592, -1.411301, 0.7333333, 1, 0, 1,
-0.8037077, 0.260284, -0.2839125, 0.7294118, 1, 0, 1,
-0.803256, 1.39544, -1.212568, 0.7215686, 1, 0, 1,
-0.8030538, -0.6817169, -3.642926, 0.7176471, 1, 0, 1,
-0.7862448, 0.6860327, -0.09771012, 0.7098039, 1, 0, 1,
-0.7847972, -0.7176897, -2.384434, 0.7058824, 1, 0, 1,
-0.7847446, 0.7271553, -1.071012, 0.6980392, 1, 0, 1,
-0.7834065, -0.02303349, -0.8262282, 0.6901961, 1, 0, 1,
-0.7799678, -0.4150367, -1.760949, 0.6862745, 1, 0, 1,
-0.7671286, 1.020265, 0.5349107, 0.6784314, 1, 0, 1,
-0.7625656, 0.6170727, -0.4920146, 0.6745098, 1, 0, 1,
-0.7508767, 0.9579393, -0.4891743, 0.6666667, 1, 0, 1,
-0.7491966, 1.236645, 0.6194935, 0.6627451, 1, 0, 1,
-0.7451292, -0.2621048, -0.7115749, 0.654902, 1, 0, 1,
-0.7373034, 0.6081027, -1.518939, 0.6509804, 1, 0, 1,
-0.7298089, 2.078036, 1.118197, 0.6431373, 1, 0, 1,
-0.7292663, -0.01410174, -0.2640556, 0.6392157, 1, 0, 1,
-0.7183129, 0.4650348, -0.1806055, 0.6313726, 1, 0, 1,
-0.7163821, 0.3332426, -0.5850016, 0.627451, 1, 0, 1,
-0.7137485, 0.6774244, -0.02082992, 0.6196079, 1, 0, 1,
-0.7101126, -0.9960131, -0.8162286, 0.6156863, 1, 0, 1,
-0.7071261, -0.06342531, -0.1667162, 0.6078432, 1, 0, 1,
-0.7059953, 0.5115772, -1.704785, 0.6039216, 1, 0, 1,
-0.70295, -0.1607876, -1.794255, 0.5960785, 1, 0, 1,
-0.7026364, -0.1861665, -1.09223, 0.5882353, 1, 0, 1,
-0.6982708, 0.5659574, -1.420795, 0.5843138, 1, 0, 1,
-0.6980206, 1.135595, -1.125811, 0.5764706, 1, 0, 1,
-0.6949741, -0.8352951, -3.398218, 0.572549, 1, 0, 1,
-0.6852566, -1.695696, -1.477613, 0.5647059, 1, 0, 1,
-0.6829078, 1.481529, -1.777601, 0.5607843, 1, 0, 1,
-0.6814701, -0.1040043, -1.888817, 0.5529412, 1, 0, 1,
-0.6806071, 0.7370434, -0.7753826, 0.5490196, 1, 0, 1,
-0.6805871, -1.64686, -1.968249, 0.5411765, 1, 0, 1,
-0.6726468, 0.4037876, -0.5837233, 0.5372549, 1, 0, 1,
-0.6668263, -2.596273, -1.781313, 0.5294118, 1, 0, 1,
-0.6652374, 1.429725, -0.5275717, 0.5254902, 1, 0, 1,
-0.65614, -0.9626449, -3.917173, 0.5176471, 1, 0, 1,
-0.6511983, 0.4999014, 0.06494591, 0.5137255, 1, 0, 1,
-0.6505003, -0.2774819, -2.225278, 0.5058824, 1, 0, 1,
-0.6478628, 0.2621724, -0.4587715, 0.5019608, 1, 0, 1,
-0.647387, 1.36805, -1.010445, 0.4941176, 1, 0, 1,
-0.6469269, -0.777567, -3.256326, 0.4862745, 1, 0, 1,
-0.6429341, 0.6288329, -0.7893248, 0.4823529, 1, 0, 1,
-0.6418293, 0.6847948, 0.7713505, 0.4745098, 1, 0, 1,
-0.6389239, -0.9469716, -1.578598, 0.4705882, 1, 0, 1,
-0.6371717, 0.5637943, -0.4607422, 0.4627451, 1, 0, 1,
-0.6370695, 0.08422849, -1.002701, 0.4588235, 1, 0, 1,
-0.6354208, 0.6488363, -1.554596, 0.4509804, 1, 0, 1,
-0.6299866, -1.122261, -3.597691, 0.4470588, 1, 0, 1,
-0.6289982, -0.2109322, -0.9029014, 0.4392157, 1, 0, 1,
-0.6279635, -1.190343, -2.013597, 0.4352941, 1, 0, 1,
-0.6237239, 0.06458019, -0.8142017, 0.427451, 1, 0, 1,
-0.6203533, -0.7259268, -2.262191, 0.4235294, 1, 0, 1,
-0.6164508, -1.652964, -2.630217, 0.4156863, 1, 0, 1,
-0.6147695, -0.6996341, -1.948358, 0.4117647, 1, 0, 1,
-0.6112412, -0.6313663, -3.183686, 0.4039216, 1, 0, 1,
-0.6099285, 0.4036817, -0.7179462, 0.3960784, 1, 0, 1,
-0.6070465, 0.9395334, 0.4501446, 0.3921569, 1, 0, 1,
-0.6019588, 0.5271471, -0.4405316, 0.3843137, 1, 0, 1,
-0.6014453, 0.8204973, -2.079859, 0.3803922, 1, 0, 1,
-0.6005815, 0.3922814, 0.2684422, 0.372549, 1, 0, 1,
-0.5998802, -0.9299538, -1.493741, 0.3686275, 1, 0, 1,
-0.5988676, 0.2315507, -2.976295, 0.3607843, 1, 0, 1,
-0.594775, -2.516562, -2.033979, 0.3568628, 1, 0, 1,
-0.5870197, -0.8355172, -1.97336, 0.3490196, 1, 0, 1,
-0.5792752, 0.04091614, -0.5897262, 0.345098, 1, 0, 1,
-0.5772413, 0.6744146, -0.5047987, 0.3372549, 1, 0, 1,
-0.5743791, -1.576843, -2.943819, 0.3333333, 1, 0, 1,
-0.5737059, 1.064384, -1.174849, 0.3254902, 1, 0, 1,
-0.5717806, -1.430196, -1.882056, 0.3215686, 1, 0, 1,
-0.5681297, -0.6505693, -3.789244, 0.3137255, 1, 0, 1,
-0.5649275, -1.437166, -3.839327, 0.3098039, 1, 0, 1,
-0.556513, 1.612808, -0.4226047, 0.3019608, 1, 0, 1,
-0.553599, -1.418303, -2.1363, 0.2941177, 1, 0, 1,
-0.5502893, 0.2602089, -1.274499, 0.2901961, 1, 0, 1,
-0.5410644, 0.8518167, -0.7908238, 0.282353, 1, 0, 1,
-0.5379149, 0.4297038, 1.15149, 0.2784314, 1, 0, 1,
-0.537676, -1.253903, -3.419691, 0.2705882, 1, 0, 1,
-0.532888, 0.6569601, -1.017209, 0.2666667, 1, 0, 1,
-0.5276176, 1.045431, -1.3767, 0.2588235, 1, 0, 1,
-0.5269678, -1.38666, -2.69762, 0.254902, 1, 0, 1,
-0.5251035, 0.5966361, 0.9969842, 0.2470588, 1, 0, 1,
-0.5243032, 0.4948168, -2.723037, 0.2431373, 1, 0, 1,
-0.5216722, -0.4868493, -2.186338, 0.2352941, 1, 0, 1,
-0.519929, 0.7725056, -1.134665, 0.2313726, 1, 0, 1,
-0.5082233, 1.245072, -0.476909, 0.2235294, 1, 0, 1,
-0.5079192, 0.4567671, -2.536943, 0.2196078, 1, 0, 1,
-0.4997158, -0.9286263, -3.006496, 0.2117647, 1, 0, 1,
-0.4995732, 0.372233, -0.2330899, 0.2078431, 1, 0, 1,
-0.4983581, 0.1699689, -1.351215, 0.2, 1, 0, 1,
-0.4976676, 0.1131357, -1.871605, 0.1921569, 1, 0, 1,
-0.4975922, 1.465781, 0.8094103, 0.1882353, 1, 0, 1,
-0.4949757, -1.344963, -1.846207, 0.1803922, 1, 0, 1,
-0.4897874, -0.203398, -1.48748, 0.1764706, 1, 0, 1,
-0.486147, -0.4619743, -2.301996, 0.1686275, 1, 0, 1,
-0.4853005, -0.4618966, -2.221232, 0.1647059, 1, 0, 1,
-0.4847505, 2.276767, 1.751557, 0.1568628, 1, 0, 1,
-0.4844768, 0.5120158, -1.695727, 0.1529412, 1, 0, 1,
-0.4839423, 1.320779, 1.427196, 0.145098, 1, 0, 1,
-0.4797716, 0.05197999, 0.6258354, 0.1411765, 1, 0, 1,
-0.4788375, -0.035422, -1.767469, 0.1333333, 1, 0, 1,
-0.4781526, 0.903352, 0.3465465, 0.1294118, 1, 0, 1,
-0.4779937, -0.7347259, -3.144222, 0.1215686, 1, 0, 1,
-0.4709339, -0.07458414, -2.23202, 0.1176471, 1, 0, 1,
-0.4705051, -0.03061908, -1.862403, 0.1098039, 1, 0, 1,
-0.4661465, 1.02151, -0.9202216, 0.1058824, 1, 0, 1,
-0.4660708, 0.6117427, -0.6281475, 0.09803922, 1, 0, 1,
-0.4637491, -0.6742076, -2.995744, 0.09019608, 1, 0, 1,
-0.462846, -0.1246286, -0.9301219, 0.08627451, 1, 0, 1,
-0.457137, -0.3142423, -2.2559, 0.07843138, 1, 0, 1,
-0.4567013, -0.2932073, -2.918825, 0.07450981, 1, 0, 1,
-0.4560246, -0.5622913, -3.512687, 0.06666667, 1, 0, 1,
-0.4541568, -2.252485, -3.099036, 0.0627451, 1, 0, 1,
-0.4522098, -0.4750497, -4.031961, 0.05490196, 1, 0, 1,
-0.4473101, -0.1659635, -3.317888, 0.05098039, 1, 0, 1,
-0.4407445, 0.3332946, 0.8015846, 0.04313726, 1, 0, 1,
-0.4397101, 0.8903383, -0.3263722, 0.03921569, 1, 0, 1,
-0.4336058, -0.9711627, -2.61094, 0.03137255, 1, 0, 1,
-0.4272632, -1.480798, -1.843503, 0.02745098, 1, 0, 1,
-0.4257656, -1.93118, -4.481147, 0.01960784, 1, 0, 1,
-0.4184245, -0.0296859, -2.467291, 0.01568628, 1, 0, 1,
-0.4160954, -0.06733977, -3.654317, 0.007843138, 1, 0, 1,
-0.4144311, 0.7816582, -1.469386, 0.003921569, 1, 0, 1,
-0.4140936, 0.6964052, -1.585102, 0, 1, 0.003921569, 1,
-0.4139195, -0.03997266, -2.073775, 0, 1, 0.01176471, 1,
-0.4097153, 0.9040617, -0.2870731, 0, 1, 0.01568628, 1,
-0.4043053, 0.905841, -0.435609, 0, 1, 0.02352941, 1,
-0.4040725, -0.1049109, -1.672808, 0, 1, 0.02745098, 1,
-0.4038977, 0.4520907, 0.4517515, 0, 1, 0.03529412, 1,
-0.4036438, -0.1896745, -1.508972, 0, 1, 0.03921569, 1,
-0.4015128, 0.8319573, -1.51216, 0, 1, 0.04705882, 1,
-0.3940611, 0.7533346, -1.66255, 0, 1, 0.05098039, 1,
-0.3936162, 1.533557, 0.8888, 0, 1, 0.05882353, 1,
-0.3897758, 2.294847, -1.393043, 0, 1, 0.0627451, 1,
-0.3856834, -1.382864, -3.633078, 0, 1, 0.07058824, 1,
-0.3831067, -0.2192207, -4.015866, 0, 1, 0.07450981, 1,
-0.3824572, -0.2068609, -0.6483105, 0, 1, 0.08235294, 1,
-0.3808151, 0.334543, -0.6402223, 0, 1, 0.08627451, 1,
-0.3803968, -0.01435746, -2.101126, 0, 1, 0.09411765, 1,
-0.3788313, -0.03285944, -1.831381, 0, 1, 0.1019608, 1,
-0.3777117, 1.310752, 1.487103, 0, 1, 0.1058824, 1,
-0.3774923, -0.04998899, -2.103847, 0, 1, 0.1137255, 1,
-0.3665871, 1.833919, 1.114409, 0, 1, 0.1176471, 1,
-0.3651704, 1.718068, -0.3905269, 0, 1, 0.1254902, 1,
-0.3646899, -0.3315834, -1.358105, 0, 1, 0.1294118, 1,
-0.363997, 0.8757242, 0.8138088, 0, 1, 0.1372549, 1,
-0.3633385, -0.6092117, -3.844649, 0, 1, 0.1411765, 1,
-0.3614606, -0.5368367, -1.077386, 0, 1, 0.1490196, 1,
-0.358521, 0.8968992, 0.2536664, 0, 1, 0.1529412, 1,
-0.3559695, 1.097797, -0.1008168, 0, 1, 0.1607843, 1,
-0.3548846, -0.3549128, -3.328974, 0, 1, 0.1647059, 1,
-0.3511292, -0.7889791, -1.632027, 0, 1, 0.172549, 1,
-0.3507337, -0.850755, -2.610987, 0, 1, 0.1764706, 1,
-0.3459684, -0.445748, -1.43989, 0, 1, 0.1843137, 1,
-0.341664, 0.10617, -0.2481829, 0, 1, 0.1882353, 1,
-0.3395066, 0.214346, -0.1359291, 0, 1, 0.1960784, 1,
-0.338169, 1.55041, 0.1124887, 0, 1, 0.2039216, 1,
-0.3316103, -1.015681, -2.583027, 0, 1, 0.2078431, 1,
-0.3305221, 0.4434988, -2.94135, 0, 1, 0.2156863, 1,
-0.33027, 1.772319, -0.9371533, 0, 1, 0.2196078, 1,
-0.328949, 0.7663687, -0.8461368, 0, 1, 0.227451, 1,
-0.3278642, -0.03302445, -2.629154, 0, 1, 0.2313726, 1,
-0.3278486, -0.4014618, -1.777673, 0, 1, 0.2392157, 1,
-0.3260609, -0.7461528, -3.207471, 0, 1, 0.2431373, 1,
-0.3218071, -0.8937559, 0.4787252, 0, 1, 0.2509804, 1,
-0.3194951, -0.8748882, -3.061196, 0, 1, 0.254902, 1,
-0.3190174, 1.788206, -0.3740789, 0, 1, 0.2627451, 1,
-0.3083814, -0.9247598, -2.101557, 0, 1, 0.2666667, 1,
-0.3068155, -0.6755428, -2.301699, 0, 1, 0.2745098, 1,
-0.304637, -1.714041, -1.874247, 0, 1, 0.2784314, 1,
-0.2958075, 1.021651, -0.7397251, 0, 1, 0.2862745, 1,
-0.2811005, 0.204162, -0.1188628, 0, 1, 0.2901961, 1,
-0.2769825, -0.9953277, -2.809976, 0, 1, 0.2980392, 1,
-0.2763284, 0.5182397, 0.799647, 0, 1, 0.3058824, 1,
-0.264009, -1.180438, -3.293189, 0, 1, 0.3098039, 1,
-0.2609854, 1.632472, 1.117014, 0, 1, 0.3176471, 1,
-0.2609719, 0.01321676, -0.3039554, 0, 1, 0.3215686, 1,
-0.2608932, 0.4562443, -0.2305355, 0, 1, 0.3294118, 1,
-0.2602516, 0.8824047, 0.4425288, 0, 1, 0.3333333, 1,
-0.258959, -0.08322795, -0.7029281, 0, 1, 0.3411765, 1,
-0.2579286, 0.2338294, 0.876073, 0, 1, 0.345098, 1,
-0.2578116, -0.05434513, -1.134393, 0, 1, 0.3529412, 1,
-0.2563036, 0.8021659, -1.559122, 0, 1, 0.3568628, 1,
-0.2548433, -0.6571175, -2.277087, 0, 1, 0.3647059, 1,
-0.2546473, 0.4052839, -3.305805, 0, 1, 0.3686275, 1,
-0.2535773, -0.5956795, -2.133805, 0, 1, 0.3764706, 1,
-0.249847, -0.8319497, -3.018854, 0, 1, 0.3803922, 1,
-0.2453932, -0.5281447, -1.223463, 0, 1, 0.3882353, 1,
-0.2453273, 0.5493192, -0.5168064, 0, 1, 0.3921569, 1,
-0.2387918, 1.039199, 0.2916835, 0, 1, 0.4, 1,
-0.23744, -0.7318522, -4.204611, 0, 1, 0.4078431, 1,
-0.2364062, -1.350627, -1.528386, 0, 1, 0.4117647, 1,
-0.2315484, 1.527311, 1.107872, 0, 1, 0.4196078, 1,
-0.2218775, -0.04016828, -2.485904, 0, 1, 0.4235294, 1,
-0.2213456, 0.9812483, -0.07646911, 0, 1, 0.4313726, 1,
-0.218385, 1.546673, 0.967911, 0, 1, 0.4352941, 1,
-0.2152763, 1.204513, -1.903489, 0, 1, 0.4431373, 1,
-0.2131022, 0.7548228, -0.3850764, 0, 1, 0.4470588, 1,
-0.2129589, -0.1456892, -2.573821, 0, 1, 0.454902, 1,
-0.2103277, -1.033148, -3.701631, 0, 1, 0.4588235, 1,
-0.2049093, 0.5447491, 0.03400123, 0, 1, 0.4666667, 1,
-0.1995651, -0.5690075, -3.783742, 0, 1, 0.4705882, 1,
-0.1963587, -1.477171, -4.336952, 0, 1, 0.4784314, 1,
-0.1947576, 1.223702, -0.0603065, 0, 1, 0.4823529, 1,
-0.1945953, 0.7506317, 1.465009, 0, 1, 0.4901961, 1,
-0.1893807, 1.195758, -0.3686354, 0, 1, 0.4941176, 1,
-0.1875162, 0.0451229, -1.008381, 0, 1, 0.5019608, 1,
-0.1856741, -0.5081274, -3.336426, 0, 1, 0.509804, 1,
-0.1822646, -0.514735, -1.854546, 0, 1, 0.5137255, 1,
-0.1773428, -1.925311, -5.208683, 0, 1, 0.5215687, 1,
-0.1733345, -0.004537166, -0.3729102, 0, 1, 0.5254902, 1,
-0.169461, -1.15291, -1.107383, 0, 1, 0.5333334, 1,
-0.1680468, 0.7543046, -0.9927655, 0, 1, 0.5372549, 1,
-0.1674644, 0.4327876, 0.5099599, 0, 1, 0.5450981, 1,
-0.1625054, 0.1496709, -1.792345, 0, 1, 0.5490196, 1,
-0.1617903, 0.3078632, -0.9145228, 0, 1, 0.5568628, 1,
-0.1606752, 1.79404, 0.1389558, 0, 1, 0.5607843, 1,
-0.1581478, 0.9029708, -2.403831, 0, 1, 0.5686275, 1,
-0.1564284, 1.219937, 0.7321813, 0, 1, 0.572549, 1,
-0.151794, -0.5994992, -3.021949, 0, 1, 0.5803922, 1,
-0.1501331, -2.276049, -3.443259, 0, 1, 0.5843138, 1,
-0.1472895, -0.1252581, -1.651576, 0, 1, 0.5921569, 1,
-0.146412, 0.2229028, -1.694162, 0, 1, 0.5960785, 1,
-0.1462434, -0.2747122, -0.6934206, 0, 1, 0.6039216, 1,
-0.1461863, 0.2484549, -2.56283, 0, 1, 0.6117647, 1,
-0.1412627, 0.5096182, 0.4130103, 0, 1, 0.6156863, 1,
-0.1402539, -1.52319, -2.19801, 0, 1, 0.6235294, 1,
-0.1387303, -0.6343179, -3.785411, 0, 1, 0.627451, 1,
-0.13756, 0.3611491, -2.340391, 0, 1, 0.6352941, 1,
-0.1374201, -0.5863999, -3.424862, 0, 1, 0.6392157, 1,
-0.1369459, 0.2424144, -0.2061604, 0, 1, 0.6470588, 1,
-0.1361605, 0.313818, -2.044424, 0, 1, 0.6509804, 1,
-0.1352521, -0.7171245, -3.412496, 0, 1, 0.6588235, 1,
-0.1349698, -0.8119527, -3.731238, 0, 1, 0.6627451, 1,
-0.1342542, -0.3164687, -3.26842, 0, 1, 0.6705883, 1,
-0.1330382, -1.22153, -3.56118, 0, 1, 0.6745098, 1,
-0.1324497, 2.412879, -0.8965204, 0, 1, 0.682353, 1,
-0.1312299, 2.282649, -0.471829, 0, 1, 0.6862745, 1,
-0.1301126, -0.3631582, -2.940847, 0, 1, 0.6941177, 1,
-0.1257472, -1.415104, -3.77592, 0, 1, 0.7019608, 1,
-0.1223971, -1.170429, -1.990201, 0, 1, 0.7058824, 1,
-0.1220306, -2.080667, -1.953301, 0, 1, 0.7137255, 1,
-0.1174489, 0.7821248, 0.4755867, 0, 1, 0.7176471, 1,
-0.1169209, -0.7993386, -3.655073, 0, 1, 0.7254902, 1,
-0.1127524, -0.1672851, -1.699276, 0, 1, 0.7294118, 1,
-0.1119659, 0.8166243, 0.7079077, 0, 1, 0.7372549, 1,
-0.110151, 0.3804729, -1.20345, 0, 1, 0.7411765, 1,
-0.1041361, 0.1487179, -1.940769, 0, 1, 0.7490196, 1,
-0.102065, -1.803993, -3.945127, 0, 1, 0.7529412, 1,
-0.1005125, -0.7794049, -2.068963, 0, 1, 0.7607843, 1,
-0.09777223, 1.406032, 0.4761041, 0, 1, 0.7647059, 1,
-0.09687588, 0.4961938, -1.834017, 0, 1, 0.772549, 1,
-0.09146157, 0.09464625, 0.3122216, 0, 1, 0.7764706, 1,
-0.08762728, 1.212066, 0.05270521, 0, 1, 0.7843137, 1,
-0.08235803, 0.2605756, 2.102217, 0, 1, 0.7882353, 1,
-0.07846713, -0.8607373, -3.025941, 0, 1, 0.7960784, 1,
-0.07794351, 0.9606587, -1.136856, 0, 1, 0.8039216, 1,
-0.07708184, -1.371904, -6.005591, 0, 1, 0.8078431, 1,
-0.07592902, 1.52415, -1.265608, 0, 1, 0.8156863, 1,
-0.07045718, 0.4629015, 0.1439331, 0, 1, 0.8196079, 1,
-0.06362412, -1.285145, -1.987581, 0, 1, 0.827451, 1,
-0.06264225, -0.01705099, -1.46345, 0, 1, 0.8313726, 1,
-0.05977226, 0.1095138, -1.316272, 0, 1, 0.8392157, 1,
-0.05595702, -0.1397635, -2.175337, 0, 1, 0.8431373, 1,
-0.05164258, -1.196236, -2.599379, 0, 1, 0.8509804, 1,
-0.05102327, 0.2622988, 1.415772, 0, 1, 0.854902, 1,
-0.04887614, 1.019551, -0.1453953, 0, 1, 0.8627451, 1,
-0.04753878, -0.1346019, -2.428864, 0, 1, 0.8666667, 1,
-0.04708806, -1.814614, -1.851035, 0, 1, 0.8745098, 1,
-0.04616734, -0.9054227, -2.58079, 0, 1, 0.8784314, 1,
-0.04611537, -0.5470841, -4.050141, 0, 1, 0.8862745, 1,
-0.04541679, -0.2202243, -2.576795, 0, 1, 0.8901961, 1,
-0.04503395, -0.5689495, -1.972192, 0, 1, 0.8980392, 1,
-0.0408323, 0.1338161, 1.066952, 0, 1, 0.9058824, 1,
-0.03849863, -1.162573, -2.298155, 0, 1, 0.9098039, 1,
-0.03773255, -0.02202786, -2.643732, 0, 1, 0.9176471, 1,
-0.03767079, -1.037735, -2.026385, 0, 1, 0.9215686, 1,
-0.03380762, -0.07334158, -2.336071, 0, 1, 0.9294118, 1,
-0.03337181, 0.379938, 0.4724148, 0, 1, 0.9333333, 1,
-0.0316172, -0.555952, -3.996941, 0, 1, 0.9411765, 1,
-0.03078458, 0.6254998, 1.44308, 0, 1, 0.945098, 1,
-0.02791819, -0.3823998, -2.377105, 0, 1, 0.9529412, 1,
-0.02142071, -0.2104281, -2.481415, 0, 1, 0.9568627, 1,
-0.02013625, 2.113709, 0.1698376, 0, 1, 0.9647059, 1,
-0.01998938, 0.0317294, 1.024701, 0, 1, 0.9686275, 1,
-0.0172477, 0.8339455, -0.2701797, 0, 1, 0.9764706, 1,
-0.01698981, 0.3681462, 1.792682, 0, 1, 0.9803922, 1,
-0.01629067, -0.5892677, -4.658768, 0, 1, 0.9882353, 1,
-0.01243439, 0.4097224, 0.4413489, 0, 1, 0.9921569, 1,
-0.008372353, 0.4999955, -0.009730549, 0, 1, 1, 1,
-0.0002080879, 0.6747442, 1.62035, 0, 0.9921569, 1, 1,
0.0009198649, -1.485976, 3.045711, 0, 0.9882353, 1, 1,
0.01045674, -1.074081, 3.019023, 0, 0.9803922, 1, 1,
0.01114999, -0.8018876, 3.478163, 0, 0.9764706, 1, 1,
0.01625605, -1.158178, 4.567598, 0, 0.9686275, 1, 1,
0.01702047, -1.191101, 2.529951, 0, 0.9647059, 1, 1,
0.01760485, 0.1629739, -0.6515241, 0, 0.9568627, 1, 1,
0.0181982, 0.8146278, 0.5700962, 0, 0.9529412, 1, 1,
0.02097261, -2.023135, 1.199125, 0, 0.945098, 1, 1,
0.02117858, -1.290836, 4.672624, 0, 0.9411765, 1, 1,
0.02131536, 1.51682, 1.981507, 0, 0.9333333, 1, 1,
0.02180734, 2.279485, 1.658464, 0, 0.9294118, 1, 1,
0.02213193, -1.046506, 3.165035, 0, 0.9215686, 1, 1,
0.02551701, 0.8993428, 0.4436215, 0, 0.9176471, 1, 1,
0.03110197, 0.3138362, -1.216845, 0, 0.9098039, 1, 1,
0.03323033, 0.5940963, 0.07611909, 0, 0.9058824, 1, 1,
0.03728238, -0.6092724, 3.253756, 0, 0.8980392, 1, 1,
0.04094786, -0.7120748, 3.395628, 0, 0.8901961, 1, 1,
0.04358707, 1.283931, -0.0680919, 0, 0.8862745, 1, 1,
0.04464296, 0.4830576, -0.02829953, 0, 0.8784314, 1, 1,
0.04683058, -0.04559347, 1.519775, 0, 0.8745098, 1, 1,
0.05099771, -0.4740927, 3.585124, 0, 0.8666667, 1, 1,
0.05565241, 0.05963457, 0.7742512, 0, 0.8627451, 1, 1,
0.06674225, 0.01218839, 2.870084, 0, 0.854902, 1, 1,
0.06795495, 0.06796252, 0.616358, 0, 0.8509804, 1, 1,
0.07002962, -0.2460248, 1.635533, 0, 0.8431373, 1, 1,
0.07015052, 0.7866225, -0.1861912, 0, 0.8392157, 1, 1,
0.07157903, -0.1322169, 1.888, 0, 0.8313726, 1, 1,
0.07347187, 0.4236121, -0.3011231, 0, 0.827451, 1, 1,
0.07910062, -0.3437134, 0.5244904, 0, 0.8196079, 1, 1,
0.08222778, 0.7767342, -1.167701, 0, 0.8156863, 1, 1,
0.08427124, -0.1302203, 2.946394, 0, 0.8078431, 1, 1,
0.08473293, -0.5763698, 3.546517, 0, 0.8039216, 1, 1,
0.08476952, 0.07463469, -0.2289924, 0, 0.7960784, 1, 1,
0.09058037, 1.268559, 0.5948681, 0, 0.7882353, 1, 1,
0.09124444, 2.02414, 0.733144, 0, 0.7843137, 1, 1,
0.09347357, 0.574995, -0.4238743, 0, 0.7764706, 1, 1,
0.09426451, -0.5073434, 2.406171, 0, 0.772549, 1, 1,
0.09671233, 0.02467512, 1.465785, 0, 0.7647059, 1, 1,
0.09702531, -0.5719832, 3.230608, 0, 0.7607843, 1, 1,
0.09982584, 1.158687, 0.8275228, 0, 0.7529412, 1, 1,
0.1009322, 0.2374728, -0.3407527, 0, 0.7490196, 1, 1,
0.101399, -0.9412472, 1.774079, 0, 0.7411765, 1, 1,
0.1024118, 0.7747787, 2.293088, 0, 0.7372549, 1, 1,
0.1077693, 1.552528, 0.06677291, 0, 0.7294118, 1, 1,
0.1081997, 1.32227, -1.717912, 0, 0.7254902, 1, 1,
0.111594, 0.6179789, 1.823092, 0, 0.7176471, 1, 1,
0.1129531, 0.4618691, -1.151461, 0, 0.7137255, 1, 1,
0.1175302, -1.58929, 1.49093, 0, 0.7058824, 1, 1,
0.1181847, 0.06508346, -0.4956465, 0, 0.6980392, 1, 1,
0.1192744, -0.7529636, 3.063289, 0, 0.6941177, 1, 1,
0.1244691, 1.202501, -0.6281894, 0, 0.6862745, 1, 1,
0.130413, -1.483632, 2.266744, 0, 0.682353, 1, 1,
0.1333495, 0.5208869, -0.1164554, 0, 0.6745098, 1, 1,
0.1353754, -0.06532678, 0.1887995, 0, 0.6705883, 1, 1,
0.135721, -0.2478895, 3.862966, 0, 0.6627451, 1, 1,
0.1470766, 0.04433697, 1.92343, 0, 0.6588235, 1, 1,
0.1514575, -0.3533501, 3.037601, 0, 0.6509804, 1, 1,
0.1595445, -0.6589568, 3.118705, 0, 0.6470588, 1, 1,
0.1612228, 0.4958954, 0.421749, 0, 0.6392157, 1, 1,
0.1615, 0.313895, 1.989129, 0, 0.6352941, 1, 1,
0.1637999, -0.3725907, 3.322155, 0, 0.627451, 1, 1,
0.1659307, 0.2338088, 2.133563, 0, 0.6235294, 1, 1,
0.1679173, 0.2672893, 0.4266106, 0, 0.6156863, 1, 1,
0.1737169, 0.09413812, 3.052032, 0, 0.6117647, 1, 1,
0.174431, 1.084341, 1.111197, 0, 0.6039216, 1, 1,
0.1771857, -1.513034, 3.379158, 0, 0.5960785, 1, 1,
0.1781811, -0.3837458, 2.121518, 0, 0.5921569, 1, 1,
0.1789417, -0.6108046, 2.949429, 0, 0.5843138, 1, 1,
0.1832583, -0.5766494, -0.3161902, 0, 0.5803922, 1, 1,
0.1833981, -1.426561, 2.821458, 0, 0.572549, 1, 1,
0.1838492, -1.511007, 4.938392, 0, 0.5686275, 1, 1,
0.1841335, 0.5828575, 1.475909, 0, 0.5607843, 1, 1,
0.1853944, 0.299587, -0.8636597, 0, 0.5568628, 1, 1,
0.185403, 1.311621, -1.020773, 0, 0.5490196, 1, 1,
0.1859342, -0.08053663, 1.134216, 0, 0.5450981, 1, 1,
0.1924787, -1.057652, 4.070494, 0, 0.5372549, 1, 1,
0.1989139, 0.3154765, 0.9140921, 0, 0.5333334, 1, 1,
0.2037476, -0.2235723, 2.027847, 0, 0.5254902, 1, 1,
0.2107418, -1.746878, 1.780821, 0, 0.5215687, 1, 1,
0.2125812, 0.01227762, 1.303446, 0, 0.5137255, 1, 1,
0.2127482, -1.329014, 2.835063, 0, 0.509804, 1, 1,
0.2130699, 1.284243, 0.8253241, 0, 0.5019608, 1, 1,
0.2153251, 0.1251015, 0.8706473, 0, 0.4941176, 1, 1,
0.2157675, 0.8685457, 0.7960726, 0, 0.4901961, 1, 1,
0.2170794, 1.831725, -1.305348, 0, 0.4823529, 1, 1,
0.2186361, 1.34572, -0.7752266, 0, 0.4784314, 1, 1,
0.2282979, -0.8284452, 2.269466, 0, 0.4705882, 1, 1,
0.2304245, 0.7064667, -1.741481, 0, 0.4666667, 1, 1,
0.2380402, 0.5805936, 0.2300194, 0, 0.4588235, 1, 1,
0.2393645, 0.7507201, -0.09007925, 0, 0.454902, 1, 1,
0.245281, 1.803151, 0.6098703, 0, 0.4470588, 1, 1,
0.2469465, -1.324293, 2.507405, 0, 0.4431373, 1, 1,
0.2478347, 0.3977811, -0.8379256, 0, 0.4352941, 1, 1,
0.2481325, 1.389661, -2.813076, 0, 0.4313726, 1, 1,
0.249958, 0.4209426, 0.4344489, 0, 0.4235294, 1, 1,
0.2521431, -1.959976, 3.955179, 0, 0.4196078, 1, 1,
0.253017, -0.3889686, 2.018646, 0, 0.4117647, 1, 1,
0.2543729, -0.2919515, 1.197262, 0, 0.4078431, 1, 1,
0.2554081, -1.302427, 3.530464, 0, 0.4, 1, 1,
0.2593249, 1.651425, 0.4055608, 0, 0.3921569, 1, 1,
0.2688457, -1.468791, 4.252658, 0, 0.3882353, 1, 1,
0.2727843, -0.4339342, 2.868075, 0, 0.3803922, 1, 1,
0.2773602, -1.463316, 2.147745, 0, 0.3764706, 1, 1,
0.278437, 1.300876, -0.8505395, 0, 0.3686275, 1, 1,
0.2828331, 0.5421681, 0.235082, 0, 0.3647059, 1, 1,
0.2842285, 1.454498, 0.5480423, 0, 0.3568628, 1, 1,
0.2866023, 0.5852666, 1.569908, 0, 0.3529412, 1, 1,
0.2884467, 0.2888193, 0.003956363, 0, 0.345098, 1, 1,
0.2904261, 0.3096027, 0.803804, 0, 0.3411765, 1, 1,
0.2946227, -1.017686, 3.098726, 0, 0.3333333, 1, 1,
0.2953099, 0.4625045, 0.1869689, 0, 0.3294118, 1, 1,
0.2966314, 2.051243, 0.5209256, 0, 0.3215686, 1, 1,
0.301612, 0.9479153, -0.5561053, 0, 0.3176471, 1, 1,
0.3020365, 0.5994953, 0.6399165, 0, 0.3098039, 1, 1,
0.3023871, 0.3918127, 1.621994, 0, 0.3058824, 1, 1,
0.3026309, 0.05016569, 1.733223, 0, 0.2980392, 1, 1,
0.305911, 1.072337, 3.214608, 0, 0.2901961, 1, 1,
0.3194907, 0.05246206, 0.522515, 0, 0.2862745, 1, 1,
0.3198109, -0.3188154, 4.316034, 0, 0.2784314, 1, 1,
0.3200223, -0.1510463, 2.300626, 0, 0.2745098, 1, 1,
0.3204979, 0.2450645, 1.634344, 0, 0.2666667, 1, 1,
0.3221775, 0.9326105, 0.9308376, 0, 0.2627451, 1, 1,
0.3226988, 0.7239456, 1.185096, 0, 0.254902, 1, 1,
0.3240433, -0.6333953, 4.427249, 0, 0.2509804, 1, 1,
0.3263825, -0.7155666, 2.562456, 0, 0.2431373, 1, 1,
0.3276105, -0.4807355, 2.668711, 0, 0.2392157, 1, 1,
0.3303422, 0.7870508, -0.1761856, 0, 0.2313726, 1, 1,
0.3320679, 0.1279919, 3.475796, 0, 0.227451, 1, 1,
0.3389898, 0.294379, 0.3142317, 0, 0.2196078, 1, 1,
0.3425156, 0.08686876, 0.7733179, 0, 0.2156863, 1, 1,
0.3425689, -0.2880607, 1.602467, 0, 0.2078431, 1, 1,
0.3485378, 0.2224075, 2.188885, 0, 0.2039216, 1, 1,
0.353211, 0.06732231, 1.856674, 0, 0.1960784, 1, 1,
0.3592002, -2.683485, 3.458821, 0, 0.1882353, 1, 1,
0.3686193, -0.4424477, 1.854244, 0, 0.1843137, 1, 1,
0.3737698, -0.9746268, 3.41432, 0, 0.1764706, 1, 1,
0.3810677, 0.5686521, 0.7890631, 0, 0.172549, 1, 1,
0.381974, -2.488409, 1.142421, 0, 0.1647059, 1, 1,
0.38232, 1.063805, 1.164955, 0, 0.1607843, 1, 1,
0.3827369, -1.649382, 2.989926, 0, 0.1529412, 1, 1,
0.3876843, -0.4752723, 2.998075, 0, 0.1490196, 1, 1,
0.3879663, -1.326368, 2.317492, 0, 0.1411765, 1, 1,
0.3896481, 0.4674806, -0.001695308, 0, 0.1372549, 1, 1,
0.3896683, -0.3462393, 1.069439, 0, 0.1294118, 1, 1,
0.3919285, 0.3934621, 0.7098563, 0, 0.1254902, 1, 1,
0.3921102, 0.2498513, 1.882285, 0, 0.1176471, 1, 1,
0.3926737, -0.03315653, 1.385498, 0, 0.1137255, 1, 1,
0.4007681, 1.72428, -1.755592, 0, 0.1058824, 1, 1,
0.4009669, -0.5578513, 3.060844, 0, 0.09803922, 1, 1,
0.4023786, -0.03658305, 3.091314, 0, 0.09411765, 1, 1,
0.4051523, 1.557038, 0.3781615, 0, 0.08627451, 1, 1,
0.4093258, -0.6888822, 2.88105, 0, 0.08235294, 1, 1,
0.4120263, -0.599381, 1.896523, 0, 0.07450981, 1, 1,
0.4166178, 0.4376936, 1.031064, 0, 0.07058824, 1, 1,
0.4183472, -0.1177147, 1.700073, 0, 0.0627451, 1, 1,
0.4237004, 0.5126026, 0.03394413, 0, 0.05882353, 1, 1,
0.4247886, 0.3836244, -1.343209, 0, 0.05098039, 1, 1,
0.4318797, -1.148331, 4.283968, 0, 0.04705882, 1, 1,
0.4425033, 0.4568517, 0.7941836, 0, 0.03921569, 1, 1,
0.4438921, 0.1120473, 1.953036, 0, 0.03529412, 1, 1,
0.445728, -1.262574, 0.6306832, 0, 0.02745098, 1, 1,
0.4498262, 0.9605556, -0.3601764, 0, 0.02352941, 1, 1,
0.4537451, -1.035634, 2.736682, 0, 0.01568628, 1, 1,
0.4568005, 1.025806, 0.6920194, 0, 0.01176471, 1, 1,
0.4588621, -2.301393, 5.376282, 0, 0.003921569, 1, 1,
0.4617625, 0.6272282, -1.381573, 0.003921569, 0, 1, 1,
0.4653174, -0.1747018, 3.04971, 0.007843138, 0, 1, 1,
0.4721297, 0.3050275, 1.552902, 0.01568628, 0, 1, 1,
0.4789233, -0.7006355, 2.591284, 0.01960784, 0, 1, 1,
0.4789477, 0.1510305, 1.58375, 0.02745098, 0, 1, 1,
0.4800512, -0.09278049, 0.4668088, 0.03137255, 0, 1, 1,
0.4805466, 1.030492, 0.9710858, 0.03921569, 0, 1, 1,
0.4853583, 0.3600965, 1.066712, 0.04313726, 0, 1, 1,
0.4870205, -0.4998695, 1.307729, 0.05098039, 0, 1, 1,
0.4902301, 0.5905522, 0.05167268, 0.05490196, 0, 1, 1,
0.4908106, 1.000197, 0.5071276, 0.0627451, 0, 1, 1,
0.4958888, 0.7870609, 1.255758, 0.06666667, 0, 1, 1,
0.5013705, -0.6527404, 0.5455295, 0.07450981, 0, 1, 1,
0.5087827, 0.5433796, 0.9334494, 0.07843138, 0, 1, 1,
0.5102379, -0.4864124, 2.765249, 0.08627451, 0, 1, 1,
0.5125819, 0.397776, -0.7524027, 0.09019608, 0, 1, 1,
0.5132901, -0.8974401, 2.605589, 0.09803922, 0, 1, 1,
0.5139543, -0.8061209, 1.860874, 0.1058824, 0, 1, 1,
0.5179356, -0.3347722, 4.126548, 0.1098039, 0, 1, 1,
0.5197793, -0.7971407, 1.32865, 0.1176471, 0, 1, 1,
0.5201247, -1.939185, 1.764121, 0.1215686, 0, 1, 1,
0.5218063, -1.630513, 3.574863, 0.1294118, 0, 1, 1,
0.5224063, 0.8182159, 0.7522034, 0.1333333, 0, 1, 1,
0.5293443, 0.3932959, 1.762935, 0.1411765, 0, 1, 1,
0.5295798, 0.6707882, -0.7649758, 0.145098, 0, 1, 1,
0.5299534, 2.834052, -0.1930822, 0.1529412, 0, 1, 1,
0.5323014, -0.01602743, 1.911679, 0.1568628, 0, 1, 1,
0.5339158, 1.652229, -0.632111, 0.1647059, 0, 1, 1,
0.5356746, 1.175941, -0.4002513, 0.1686275, 0, 1, 1,
0.536499, 0.8127279, -0.560436, 0.1764706, 0, 1, 1,
0.5379829, -0.1950746, 2.631151, 0.1803922, 0, 1, 1,
0.538087, -0.8658302, 2.872553, 0.1882353, 0, 1, 1,
0.5391568, -0.7345909, 2.804648, 0.1921569, 0, 1, 1,
0.5473525, 1.383547, 0.9266491, 0.2, 0, 1, 1,
0.5490745, -0.6756913, 2.204223, 0.2078431, 0, 1, 1,
0.5491087, -0.2331199, -0.4251581, 0.2117647, 0, 1, 1,
0.5591489, -0.1872615, 1.577669, 0.2196078, 0, 1, 1,
0.5602044, 0.1783575, 1.847943, 0.2235294, 0, 1, 1,
0.5609294, -1.498759, 3.599899, 0.2313726, 0, 1, 1,
0.5660548, -0.129827, 2.175793, 0.2352941, 0, 1, 1,
0.5711107, 0.4849763, 0.9416213, 0.2431373, 0, 1, 1,
0.571309, 1.325157, -0.903411, 0.2470588, 0, 1, 1,
0.5767759, 1.014239, 1.425689, 0.254902, 0, 1, 1,
0.5788627, -1.49623, 1.938544, 0.2588235, 0, 1, 1,
0.5810921, 0.1302869, 0.02392373, 0.2666667, 0, 1, 1,
0.5834631, 0.01442266, -0.8771661, 0.2705882, 0, 1, 1,
0.5852103, 0.09948416, 0.31991, 0.2784314, 0, 1, 1,
0.5856125, 0.3310675, 1.257409, 0.282353, 0, 1, 1,
0.5886896, 1.194493, 1.076823, 0.2901961, 0, 1, 1,
0.5918893, 0.398569, 0.7394384, 0.2941177, 0, 1, 1,
0.593293, 0.5296776, -0.1820192, 0.3019608, 0, 1, 1,
0.5951476, 0.05560452, 1.529209, 0.3098039, 0, 1, 1,
0.6046046, 0.6589407, -0.02446485, 0.3137255, 0, 1, 1,
0.6052131, -0.7969519, 2.395272, 0.3215686, 0, 1, 1,
0.6069818, -0.6581917, 4.977206, 0.3254902, 0, 1, 1,
0.6072302, 1.578411, -0.2188798, 0.3333333, 0, 1, 1,
0.6098276, 1.674279, 2.092846, 0.3372549, 0, 1, 1,
0.6115046, 0.6585292, 1.558868, 0.345098, 0, 1, 1,
0.61193, 1.406643, -0.4250185, 0.3490196, 0, 1, 1,
0.6172252, 1.845992, -0.4229695, 0.3568628, 0, 1, 1,
0.6195631, 1.017678, 1.303177, 0.3607843, 0, 1, 1,
0.6213545, -0.8043962, 2.584141, 0.3686275, 0, 1, 1,
0.6278262, 1.608649, 2.32292, 0.372549, 0, 1, 1,
0.6289304, 1.074955, 0.3108263, 0.3803922, 0, 1, 1,
0.6327434, 0.2919965, -0.03667617, 0.3843137, 0, 1, 1,
0.6363305, 1.12248, 1.018525, 0.3921569, 0, 1, 1,
0.6371629, 0.6792595, -0.627925, 0.3960784, 0, 1, 1,
0.6373256, -1.419361, 4.418628, 0.4039216, 0, 1, 1,
0.6383331, 0.3485432, 1.554301, 0.4117647, 0, 1, 1,
0.6390458, 0.1850083, 0.5351529, 0.4156863, 0, 1, 1,
0.6393585, 0.9395849, 2.543637, 0.4235294, 0, 1, 1,
0.6438187, -0.1036465, 2.975066, 0.427451, 0, 1, 1,
0.6460343, 1.285439, 0.5941864, 0.4352941, 0, 1, 1,
0.6496457, -0.5700569, 0.3770245, 0.4392157, 0, 1, 1,
0.649702, -0.1808345, 0.9959354, 0.4470588, 0, 1, 1,
0.6533275, -0.4723136, 2.031107, 0.4509804, 0, 1, 1,
0.6575721, 1.520901, 0.6207861, 0.4588235, 0, 1, 1,
0.6587266, 0.8436401, 3.01544, 0.4627451, 0, 1, 1,
0.6600904, -1.233692, 2.006589, 0.4705882, 0, 1, 1,
0.6651343, -0.4381838, 3.051073, 0.4745098, 0, 1, 1,
0.6674563, 2.075078, -0.8196393, 0.4823529, 0, 1, 1,
0.6689098, -0.9342749, 1.781782, 0.4862745, 0, 1, 1,
0.6741725, 1.594529, 1.229593, 0.4941176, 0, 1, 1,
0.6759026, 0.794108, 0.4267794, 0.5019608, 0, 1, 1,
0.6774794, 0.7989259, 2.164653, 0.5058824, 0, 1, 1,
0.6814499, 0.6604586, 1.823103, 0.5137255, 0, 1, 1,
0.6825588, -1.11676, 5.101109, 0.5176471, 0, 1, 1,
0.6884584, -0.45679, 3.567091, 0.5254902, 0, 1, 1,
0.6891133, 1.02858, 0.5948035, 0.5294118, 0, 1, 1,
0.6917966, 1.41544, -0.4506989, 0.5372549, 0, 1, 1,
0.6947913, 0.4061833, 1.13835, 0.5411765, 0, 1, 1,
0.6992003, -0.6450258, 1.505943, 0.5490196, 0, 1, 1,
0.703474, -0.08191953, 1.847606, 0.5529412, 0, 1, 1,
0.70587, 2.050263, -0.9589328, 0.5607843, 0, 1, 1,
0.7089165, 1.255588, 1.499125, 0.5647059, 0, 1, 1,
0.7154398, 0.03222823, 1.135854, 0.572549, 0, 1, 1,
0.7340249, -0.616192, 3.735817, 0.5764706, 0, 1, 1,
0.7392538, 0.1091808, 1.798169, 0.5843138, 0, 1, 1,
0.7447308, -0.5695549, 2.870548, 0.5882353, 0, 1, 1,
0.7464381, 0.3404078, 0.01831361, 0.5960785, 0, 1, 1,
0.7472163, 1.191745, 0.5763106, 0.6039216, 0, 1, 1,
0.7499778, -1.695106, 2.293748, 0.6078432, 0, 1, 1,
0.7552924, 2.08854, 1.227219, 0.6156863, 0, 1, 1,
0.7559671, -0.6794167, 2.330752, 0.6196079, 0, 1, 1,
0.7561713, 0.9309125, 2.746571, 0.627451, 0, 1, 1,
0.7657953, 0.9862165, 1.00287, 0.6313726, 0, 1, 1,
0.7671351, -1.549385, 3.294517, 0.6392157, 0, 1, 1,
0.7705562, -0.3284875, 4.01517, 0.6431373, 0, 1, 1,
0.7736904, 1.112002, 0.766163, 0.6509804, 0, 1, 1,
0.7794029, 0.0672255, 2.566831, 0.654902, 0, 1, 1,
0.7837449, 1.84362, -0.3011235, 0.6627451, 0, 1, 1,
0.7849364, -0.8033973, 1.595508, 0.6666667, 0, 1, 1,
0.7853717, -0.2134231, 1.948553, 0.6745098, 0, 1, 1,
0.7949842, -0.7471331, 2.044874, 0.6784314, 0, 1, 1,
0.7953082, -0.4809668, 3.05624, 0.6862745, 0, 1, 1,
0.798269, 0.4221572, 1.401499, 0.6901961, 0, 1, 1,
0.8019554, 1.344975, -0.7779397, 0.6980392, 0, 1, 1,
0.8046495, -0.6442903, 3.964944, 0.7058824, 0, 1, 1,
0.8055474, 2.228992, 0.8876457, 0.7098039, 0, 1, 1,
0.8073032, 0.5493065, 1.15947, 0.7176471, 0, 1, 1,
0.81126, 1.396914, -0.06931678, 0.7215686, 0, 1, 1,
0.8151459, -0.2439958, 3.427166, 0.7294118, 0, 1, 1,
0.8193954, -0.1821032, 0.4842862, 0.7333333, 0, 1, 1,
0.821874, 0.1641473, 0.9424653, 0.7411765, 0, 1, 1,
0.8225912, -1.225426, 1.737793, 0.7450981, 0, 1, 1,
0.8225913, 1.120704, 2.270371, 0.7529412, 0, 1, 1,
0.8291324, 0.2418286, 0.3876612, 0.7568628, 0, 1, 1,
0.8305755, 0.199347, 0.4755779, 0.7647059, 0, 1, 1,
0.8324191, 0.9467199, 1.806438, 0.7686275, 0, 1, 1,
0.8366374, 0.6382981, 0.676712, 0.7764706, 0, 1, 1,
0.8382327, -0.1747454, 2.527661, 0.7803922, 0, 1, 1,
0.8521883, 0.493832, 1.063872, 0.7882353, 0, 1, 1,
0.8533209, -0.006269011, 0.1082794, 0.7921569, 0, 1, 1,
0.8572211, 1.29099, -0.3246292, 0.8, 0, 1, 1,
0.8684426, 1.262633, 1.584364, 0.8078431, 0, 1, 1,
0.8841674, -1.06513, 2.815136, 0.8117647, 0, 1, 1,
0.8841688, 0.3506931, 2.439008, 0.8196079, 0, 1, 1,
0.8906105, -0.7622792, 4.168661, 0.8235294, 0, 1, 1,
0.8908842, -1.658582, 3.607567, 0.8313726, 0, 1, 1,
0.8913736, 0.1680744, 1.016625, 0.8352941, 0, 1, 1,
0.8921635, -1.202369, 2.531839, 0.8431373, 0, 1, 1,
0.8949791, 0.06118558, 2.059194, 0.8470588, 0, 1, 1,
0.8957641, 0.4679705, 0.5744287, 0.854902, 0, 1, 1,
0.8963099, -1.035719, 2.528592, 0.8588235, 0, 1, 1,
0.8990789, -0.4089459, 3.29217, 0.8666667, 0, 1, 1,
0.8997917, -1.497426, 3.5799, 0.8705882, 0, 1, 1,
0.9032519, -0.07417297, 3.324818, 0.8784314, 0, 1, 1,
0.9042928, -0.718306, 2.055054, 0.8823529, 0, 1, 1,
0.9043689, 0.1379315, 3.529841, 0.8901961, 0, 1, 1,
0.9075016, -0.0580354, 2.712788, 0.8941177, 0, 1, 1,
0.9115375, 1.164202, 1.852656, 0.9019608, 0, 1, 1,
0.9120165, 0.001079989, 1.930422, 0.9098039, 0, 1, 1,
0.9137787, -0.2468243, -0.4713099, 0.9137255, 0, 1, 1,
0.9143047, 0.4312242, 2.891205, 0.9215686, 0, 1, 1,
0.9157315, -0.642509, 3.165114, 0.9254902, 0, 1, 1,
0.9172778, 0.5363789, -0.215508, 0.9333333, 0, 1, 1,
0.9214702, -0.3815243, 2.943563, 0.9372549, 0, 1, 1,
0.9250637, 0.5297793, -0.5133339, 0.945098, 0, 1, 1,
0.9284759, 1.656053, 0.5223625, 0.9490196, 0, 1, 1,
0.9364276, 0.3964805, -0.3218543, 0.9568627, 0, 1, 1,
0.939195, -0.8311013, 1.162935, 0.9607843, 0, 1, 1,
0.940114, -0.4717163, 2.104631, 0.9686275, 0, 1, 1,
0.9450666, 0.3404446, 1.561947, 0.972549, 0, 1, 1,
0.9455537, -1.370612, 1.646505, 0.9803922, 0, 1, 1,
0.9573767, -1.591164, 1.766203, 0.9843137, 0, 1, 1,
0.9602243, 0.4699627, -0.0233151, 0.9921569, 0, 1, 1,
0.9651434, -0.9134673, 1.46328, 0.9960784, 0, 1, 1,
0.9676679, -0.3114643, 0.8208466, 1, 0, 0.9960784, 1,
0.9709401, -1.833859, 1.260698, 1, 0, 0.9882353, 1,
0.9712909, 1.309074, 0.4906598, 1, 0, 0.9843137, 1,
0.976877, -2.677179, 2.677794, 1, 0, 0.9764706, 1,
0.9784516, 1.426793, -0.3628284, 1, 0, 0.972549, 1,
0.9836395, 2.905737, 1.183651, 1, 0, 0.9647059, 1,
0.9907726, 1.393586, 0.790953, 1, 0, 0.9607843, 1,
1.00624, 0.4716443, 1.386545, 1, 0, 0.9529412, 1,
1.017913, 1.227318, -0.3745069, 1, 0, 0.9490196, 1,
1.020494, 0.5936111, 0.6389582, 1, 0, 0.9411765, 1,
1.02273, 0.8370249, 1.586825, 1, 0, 0.9372549, 1,
1.022998, 0.6008729, 1.603507, 1, 0, 0.9294118, 1,
1.023472, 0.3785583, 2.341014, 1, 0, 0.9254902, 1,
1.026822, 1.181077, 0.8315033, 1, 0, 0.9176471, 1,
1.032742, 1.392183, 0.0001931226, 1, 0, 0.9137255, 1,
1.034286, 1.109982, 0.4767076, 1, 0, 0.9058824, 1,
1.034301, -0.04953001, 1.844726, 1, 0, 0.9019608, 1,
1.038804, -1.191748, 3.661511, 1, 0, 0.8941177, 1,
1.046665, 0.5811767, 0.7444142, 1, 0, 0.8862745, 1,
1.05095, -1.406209, 1.159935, 1, 0, 0.8823529, 1,
1.051669, 1.157513, -0.3389866, 1, 0, 0.8745098, 1,
1.06574, 1.403122, 1.392951, 1, 0, 0.8705882, 1,
1.073839, 0.3368816, 1.237344, 1, 0, 0.8627451, 1,
1.076632, -0.249702, 0.6221535, 1, 0, 0.8588235, 1,
1.088309, 0.1244503, 1.430813, 1, 0, 0.8509804, 1,
1.092604, -0.5410451, 1.661519, 1, 0, 0.8470588, 1,
1.094188, -1.220729, 3.705541, 1, 0, 0.8392157, 1,
1.097536, -0.7299072, 3.187912, 1, 0, 0.8352941, 1,
1.105362, 1.205087, 1.899707, 1, 0, 0.827451, 1,
1.111146, 1.101722, 0.1688886, 1, 0, 0.8235294, 1,
1.11168, 0.3483329, 3.240432, 1, 0, 0.8156863, 1,
1.11501, -1.732289, 0.4698059, 1, 0, 0.8117647, 1,
1.115231, 0.9467843, -0.2577632, 1, 0, 0.8039216, 1,
1.118295, -0.1007409, 1.290497, 1, 0, 0.7960784, 1,
1.125604, 1.488443, 1.03396, 1, 0, 0.7921569, 1,
1.132214, -0.8524167, 4.358535, 1, 0, 0.7843137, 1,
1.134683, -0.08957006, 1.156164, 1, 0, 0.7803922, 1,
1.138814, -1.089939, 2.491748, 1, 0, 0.772549, 1,
1.139333, -0.2503823, 0.2556988, 1, 0, 0.7686275, 1,
1.157205, 0.9247677, 2.883318, 1, 0, 0.7607843, 1,
1.160777, 0.7204623, 1.63762, 1, 0, 0.7568628, 1,
1.165166, 0.7644452, 2.468526, 1, 0, 0.7490196, 1,
1.165371, 0.1666632, 0.103319, 1, 0, 0.7450981, 1,
1.172152, -0.05182286, 0.3090445, 1, 0, 0.7372549, 1,
1.173707, -1.529321, 1.167402, 1, 0, 0.7333333, 1,
1.175574, 0.4202834, 1.617505, 1, 0, 0.7254902, 1,
1.180479, 1.406933, -0.004367534, 1, 0, 0.7215686, 1,
1.186006, -1.937803, 0.83013, 1, 0, 0.7137255, 1,
1.187112, 1.48953, 1.796734, 1, 0, 0.7098039, 1,
1.190537, -1.14818, 3.068872, 1, 0, 0.7019608, 1,
1.194622, -0.4730153, -0.1543127, 1, 0, 0.6941177, 1,
1.196613, -1.608804, 3.313572, 1, 0, 0.6901961, 1,
1.200845, -0.2784288, 3.388645, 1, 0, 0.682353, 1,
1.204896, -0.3645251, 2.168532, 1, 0, 0.6784314, 1,
1.204908, 0.8131075, 2.468561, 1, 0, 0.6705883, 1,
1.215924, 2.797158, 1.42748, 1, 0, 0.6666667, 1,
1.224708, 1.1071, 1.110084, 1, 0, 0.6588235, 1,
1.227205, 0.3546799, 0.5844527, 1, 0, 0.654902, 1,
1.238959, -0.8365039, 1.856835, 1, 0, 0.6470588, 1,
1.24637, 1.255934, 1.330752, 1, 0, 0.6431373, 1,
1.258255, -0.2414439, 2.414496, 1, 0, 0.6352941, 1,
1.264479, -1.030778, 2.882242, 1, 0, 0.6313726, 1,
1.26564, 0.6132045, 1.364441, 1, 0, 0.6235294, 1,
1.275114, -1.650723, 2.370229, 1, 0, 0.6196079, 1,
1.281945, 1.540877, 0.2777609, 1, 0, 0.6117647, 1,
1.288408, 0.2197435, 1.857982, 1, 0, 0.6078432, 1,
1.289602, -0.3810675, 1.361689, 1, 0, 0.6, 1,
1.306325, 0.9421073, 0.2960212, 1, 0, 0.5921569, 1,
1.323492, -1.140477, 1.850141, 1, 0, 0.5882353, 1,
1.32539, -0.4799115, 1.426864, 1, 0, 0.5803922, 1,
1.331614, 0.7778796, 2.384807, 1, 0, 0.5764706, 1,
1.347586, -0.9950624, 0.9979092, 1, 0, 0.5686275, 1,
1.353919, -1.438698, 2.383991, 1, 0, 0.5647059, 1,
1.354309, 0.3538908, 1.76582, 1, 0, 0.5568628, 1,
1.355819, -0.2566142, 1.350066, 1, 0, 0.5529412, 1,
1.371402, 0.617924, 1.116154, 1, 0, 0.5450981, 1,
1.376863, 0.7185913, 2.217538, 1, 0, 0.5411765, 1,
1.382933, -0.07124029, -0.5389262, 1, 0, 0.5333334, 1,
1.385548, -1.401882, 2.04835, 1, 0, 0.5294118, 1,
1.403041, -1.16881, 1.277969, 1, 0, 0.5215687, 1,
1.410757, -0.3743331, 2.200054, 1, 0, 0.5176471, 1,
1.410856, -0.3580109, -0.004457426, 1, 0, 0.509804, 1,
1.418737, -0.5954389, 1.019023, 1, 0, 0.5058824, 1,
1.433844, -0.05193717, 1.806117, 1, 0, 0.4980392, 1,
1.435788, 2.940269, 0.2969574, 1, 0, 0.4901961, 1,
1.451243, -0.192561, 1.430206, 1, 0, 0.4862745, 1,
1.451938, -0.3431114, 0.7345624, 1, 0, 0.4784314, 1,
1.452437, -0.9877027, 2.882254, 1, 0, 0.4745098, 1,
1.460354, -1.634777, 0.7424619, 1, 0, 0.4666667, 1,
1.463222, -1.555134, 1.727645, 1, 0, 0.4627451, 1,
1.472311, 1.513117, 1.284561, 1, 0, 0.454902, 1,
1.496627, 0.001358244, 1.517397, 1, 0, 0.4509804, 1,
1.503168, 1.440475, 0.7892108, 1, 0, 0.4431373, 1,
1.504349, 1.352196, 0.09084462, 1, 0, 0.4392157, 1,
1.505496, -0.3572918, 1.083264, 1, 0, 0.4313726, 1,
1.519047, 0.4497196, 0.4963105, 1, 0, 0.427451, 1,
1.519929, -0.03157695, 2.747504, 1, 0, 0.4196078, 1,
1.526789, 0.1590353, 1.461682, 1, 0, 0.4156863, 1,
1.538879, 1.537599, 0.06830911, 1, 0, 0.4078431, 1,
1.572836, 0.06426647, 2.243709, 1, 0, 0.4039216, 1,
1.607941, 2.291809, -0.04164181, 1, 0, 0.3960784, 1,
1.612396, 0.2706175, 2.280335, 1, 0, 0.3882353, 1,
1.616043, 0.513925, 3.316729, 1, 0, 0.3843137, 1,
1.616064, -0.5709331, 1.834223, 1, 0, 0.3764706, 1,
1.632769, 0.9921482, 2.442765, 1, 0, 0.372549, 1,
1.633234, 1.213914, 1.167028, 1, 0, 0.3647059, 1,
1.642974, 0.5057319, 2.245652, 1, 0, 0.3607843, 1,
1.649205, -0.5713629, 0.6314046, 1, 0, 0.3529412, 1,
1.649246, 0.8568974, -0.3856578, 1, 0, 0.3490196, 1,
1.651416, -0.3845381, 3.36384, 1, 0, 0.3411765, 1,
1.653949, -1.093038, 0.990722, 1, 0, 0.3372549, 1,
1.660319, -1.341228, 3.059026, 1, 0, 0.3294118, 1,
1.663121, -0.9650882, 0.7775622, 1, 0, 0.3254902, 1,
1.671992, 1.582656, 1.238956, 1, 0, 0.3176471, 1,
1.672366, 0.2382174, 2.67615, 1, 0, 0.3137255, 1,
1.674798, 0.730948, 1.034035, 1, 0, 0.3058824, 1,
1.680026, -1.43473, 1.288573, 1, 0, 0.2980392, 1,
1.707482, 0.1109824, 0.9342214, 1, 0, 0.2941177, 1,
1.720756, -0.03559962, 0.5930483, 1, 0, 0.2862745, 1,
1.732875, 0.4898936, 0.6003502, 1, 0, 0.282353, 1,
1.765436, -0.2183436, 1.806454, 1, 0, 0.2745098, 1,
1.776783, -0.5811058, 2.257556, 1, 0, 0.2705882, 1,
1.77794, 1.05044, 0.1176614, 1, 0, 0.2627451, 1,
1.778455, -0.9511443, 1.827569, 1, 0, 0.2588235, 1,
1.782377, -0.3342288, 1.412321, 1, 0, 0.2509804, 1,
1.783076, 1.104823, 0.1577224, 1, 0, 0.2470588, 1,
1.839806, 0.3864443, 1.277911, 1, 0, 0.2392157, 1,
1.857469, -1.818194, 3.662562, 1, 0, 0.2352941, 1,
1.860519, -0.431796, 0.488474, 1, 0, 0.227451, 1,
1.865036, -0.8155463, 2.40325, 1, 0, 0.2235294, 1,
1.893656, -0.2176072, 1.96388, 1, 0, 0.2156863, 1,
1.896017, -1.185356, 1.619029, 1, 0, 0.2117647, 1,
1.896307, 0.265669, 1.882846, 1, 0, 0.2039216, 1,
1.959914, -0.4086832, 3.051302, 1, 0, 0.1960784, 1,
1.962079, 1.380195, -0.3952364, 1, 0, 0.1921569, 1,
1.962509, -2.213758, 2.003114, 1, 0, 0.1843137, 1,
1.97246, 0.9949057, 1.376612, 1, 0, 0.1803922, 1,
1.996078, -1.760332, 1.435234, 1, 0, 0.172549, 1,
1.997633, 1.586541, -0.4199519, 1, 0, 0.1686275, 1,
2.005134, -0.7711653, 1.409562, 1, 0, 0.1607843, 1,
2.040316, -1.022207, 0.5379631, 1, 0, 0.1568628, 1,
2.097842, 0.1010727, -0.8172491, 1, 0, 0.1490196, 1,
2.099448, 0.5002396, 0.925799, 1, 0, 0.145098, 1,
2.129912, -0.8807568, 2.604238, 1, 0, 0.1372549, 1,
2.161042, -0.07697393, 3.187549, 1, 0, 0.1333333, 1,
2.170377, -0.7245387, 2.279208, 1, 0, 0.1254902, 1,
2.17856, 0.3079129, -0.7059433, 1, 0, 0.1215686, 1,
2.188918, -0.4031164, 1.956895, 1, 0, 0.1137255, 1,
2.242946, -0.6970044, 2.050607, 1, 0, 0.1098039, 1,
2.244783, 0.09075592, 1.649507, 1, 0, 0.1019608, 1,
2.24674, 1.517113, 2.871266, 1, 0, 0.09411765, 1,
2.286155, -0.1121398, 1.135129, 1, 0, 0.09019608, 1,
2.287183, 0.5316198, 0.4165858, 1, 0, 0.08235294, 1,
2.301282, -0.3974031, 1.556586, 1, 0, 0.07843138, 1,
2.307892, 2.25497, 1.178023, 1, 0, 0.07058824, 1,
2.361356, -0.8668306, 1.199708, 1, 0, 0.06666667, 1,
2.512316, -2.125211, 2.03475, 1, 0, 0.05882353, 1,
2.517532, 0.6919934, 2.387215, 1, 0, 0.05490196, 1,
2.522604, 2.493438, 0.3070477, 1, 0, 0.04705882, 1,
2.54048, 1.112457, 1.599314, 1, 0, 0.04313726, 1,
2.593905, 0.4070694, 2.00236, 1, 0, 0.03529412, 1,
2.654811, -0.8582017, 1.222358, 1, 0, 0.03137255, 1,
2.657938, -1.196574, 1.943669, 1, 0, 0.02352941, 1,
2.714834, 0.3508302, 1.136432, 1, 0, 0.01960784, 1,
2.797371, -0.3460774, 1.461612, 1, 0, 0.01176471, 1,
2.805299, 0.3848103, 1.284867, 1, 0, 0.007843138, 1
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
-0.3194501, -3.636711, -7.934819, 0, -0.5, 0.5, 0.5,
-0.3194501, -3.636711, -7.934819, 1, -0.5, 0.5, 0.5,
-0.3194501, -3.636711, -7.934819, 1, 1.5, 0.5, 0.5,
-0.3194501, -3.636711, -7.934819, 0, 1.5, 0.5, 0.5
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
-4.503489, 0.1283921, -7.934819, 0, -0.5, 0.5, 0.5,
-4.503489, 0.1283921, -7.934819, 1, -0.5, 0.5, 0.5,
-4.503489, 0.1283921, -7.934819, 1, 1.5, 0.5, 0.5,
-4.503489, 0.1283921, -7.934819, 0, 1.5, 0.5, 0.5
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
-4.503489, -3.636711, -0.3146546, 0, -0.5, 0.5, 0.5,
-4.503489, -3.636711, -0.3146546, 1, -0.5, 0.5, 0.5,
-4.503489, -3.636711, -0.3146546, 1, 1.5, 0.5, 0.5,
-4.503489, -3.636711, -0.3146546, 0, 1.5, 0.5, 0.5
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
-3, -2.767841, -6.17632,
2, -2.767841, -6.17632,
-3, -2.767841, -6.17632,
-3, -2.912653, -6.469403,
-2, -2.767841, -6.17632,
-2, -2.912653, -6.469403,
-1, -2.767841, -6.17632,
-1, -2.912653, -6.469403,
0, -2.767841, -6.17632,
0, -2.912653, -6.469403,
1, -2.767841, -6.17632,
1, -2.912653, -6.469403,
2, -2.767841, -6.17632,
2, -2.912653, -6.469403
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
-3, -3.202276, -7.055569, 0, -0.5, 0.5, 0.5,
-3, -3.202276, -7.055569, 1, -0.5, 0.5, 0.5,
-3, -3.202276, -7.055569, 1, 1.5, 0.5, 0.5,
-3, -3.202276, -7.055569, 0, 1.5, 0.5, 0.5,
-2, -3.202276, -7.055569, 0, -0.5, 0.5, 0.5,
-2, -3.202276, -7.055569, 1, -0.5, 0.5, 0.5,
-2, -3.202276, -7.055569, 1, 1.5, 0.5, 0.5,
-2, -3.202276, -7.055569, 0, 1.5, 0.5, 0.5,
-1, -3.202276, -7.055569, 0, -0.5, 0.5, 0.5,
-1, -3.202276, -7.055569, 1, -0.5, 0.5, 0.5,
-1, -3.202276, -7.055569, 1, 1.5, 0.5, 0.5,
-1, -3.202276, -7.055569, 0, 1.5, 0.5, 0.5,
0, -3.202276, -7.055569, 0, -0.5, 0.5, 0.5,
0, -3.202276, -7.055569, 1, -0.5, 0.5, 0.5,
0, -3.202276, -7.055569, 1, 1.5, 0.5, 0.5,
0, -3.202276, -7.055569, 0, 1.5, 0.5, 0.5,
1, -3.202276, -7.055569, 0, -0.5, 0.5, 0.5,
1, -3.202276, -7.055569, 1, -0.5, 0.5, 0.5,
1, -3.202276, -7.055569, 1, 1.5, 0.5, 0.5,
1, -3.202276, -7.055569, 0, 1.5, 0.5, 0.5,
2, -3.202276, -7.055569, 0, -0.5, 0.5, 0.5,
2, -3.202276, -7.055569, 1, -0.5, 0.5, 0.5,
2, -3.202276, -7.055569, 1, 1.5, 0.5, 0.5,
2, -3.202276, -7.055569, 0, 1.5, 0.5, 0.5
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
-3.537941, -2, -6.17632,
-3.537941, 2, -6.17632,
-3.537941, -2, -6.17632,
-3.698866, -2, -6.469403,
-3.537941, -1, -6.17632,
-3.698866, -1, -6.469403,
-3.537941, 0, -6.17632,
-3.698866, 0, -6.469403,
-3.537941, 1, -6.17632,
-3.698866, 1, -6.469403,
-3.537941, 2, -6.17632,
-3.698866, 2, -6.469403
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
-4.020715, -2, -7.055569, 0, -0.5, 0.5, 0.5,
-4.020715, -2, -7.055569, 1, -0.5, 0.5, 0.5,
-4.020715, -2, -7.055569, 1, 1.5, 0.5, 0.5,
-4.020715, -2, -7.055569, 0, 1.5, 0.5, 0.5,
-4.020715, -1, -7.055569, 0, -0.5, 0.5, 0.5,
-4.020715, -1, -7.055569, 1, -0.5, 0.5, 0.5,
-4.020715, -1, -7.055569, 1, 1.5, 0.5, 0.5,
-4.020715, -1, -7.055569, 0, 1.5, 0.5, 0.5,
-4.020715, 0, -7.055569, 0, -0.5, 0.5, 0.5,
-4.020715, 0, -7.055569, 1, -0.5, 0.5, 0.5,
-4.020715, 0, -7.055569, 1, 1.5, 0.5, 0.5,
-4.020715, 0, -7.055569, 0, 1.5, 0.5, 0.5,
-4.020715, 1, -7.055569, 0, -0.5, 0.5, 0.5,
-4.020715, 1, -7.055569, 1, -0.5, 0.5, 0.5,
-4.020715, 1, -7.055569, 1, 1.5, 0.5, 0.5,
-4.020715, 1, -7.055569, 0, 1.5, 0.5, 0.5,
-4.020715, 2, -7.055569, 0, -0.5, 0.5, 0.5,
-4.020715, 2, -7.055569, 1, -0.5, 0.5, 0.5,
-4.020715, 2, -7.055569, 1, 1.5, 0.5, 0.5,
-4.020715, 2, -7.055569, 0, 1.5, 0.5, 0.5
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
-3.537941, -2.767841, -6,
-3.537941, -2.767841, 4,
-3.537941, -2.767841, -6,
-3.698866, -2.912653, -6,
-3.537941, -2.767841, -4,
-3.698866, -2.912653, -4,
-3.537941, -2.767841, -2,
-3.698866, -2.912653, -2,
-3.537941, -2.767841, 0,
-3.698866, -2.912653, 0,
-3.537941, -2.767841, 2,
-3.698866, -2.912653, 2,
-3.537941, -2.767841, 4,
-3.698866, -2.912653, 4
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
-4.020715, -3.202276, -6, 0, -0.5, 0.5, 0.5,
-4.020715, -3.202276, -6, 1, -0.5, 0.5, 0.5,
-4.020715, -3.202276, -6, 1, 1.5, 0.5, 0.5,
-4.020715, -3.202276, -6, 0, 1.5, 0.5, 0.5,
-4.020715, -3.202276, -4, 0, -0.5, 0.5, 0.5,
-4.020715, -3.202276, -4, 1, -0.5, 0.5, 0.5,
-4.020715, -3.202276, -4, 1, 1.5, 0.5, 0.5,
-4.020715, -3.202276, -4, 0, 1.5, 0.5, 0.5,
-4.020715, -3.202276, -2, 0, -0.5, 0.5, 0.5,
-4.020715, -3.202276, -2, 1, -0.5, 0.5, 0.5,
-4.020715, -3.202276, -2, 1, 1.5, 0.5, 0.5,
-4.020715, -3.202276, -2, 0, 1.5, 0.5, 0.5,
-4.020715, -3.202276, 0, 0, -0.5, 0.5, 0.5,
-4.020715, -3.202276, 0, 1, -0.5, 0.5, 0.5,
-4.020715, -3.202276, 0, 1, 1.5, 0.5, 0.5,
-4.020715, -3.202276, 0, 0, 1.5, 0.5, 0.5,
-4.020715, -3.202276, 2, 0, -0.5, 0.5, 0.5,
-4.020715, -3.202276, 2, 1, -0.5, 0.5, 0.5,
-4.020715, -3.202276, 2, 1, 1.5, 0.5, 0.5,
-4.020715, -3.202276, 2, 0, 1.5, 0.5, 0.5,
-4.020715, -3.202276, 4, 0, -0.5, 0.5, 0.5,
-4.020715, -3.202276, 4, 1, -0.5, 0.5, 0.5,
-4.020715, -3.202276, 4, 1, 1.5, 0.5, 0.5,
-4.020715, -3.202276, 4, 0, 1.5, 0.5, 0.5
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
-3.537941, -2.767841, -6.17632,
-3.537941, 3.024626, -6.17632,
-3.537941, -2.767841, 5.54701,
-3.537941, 3.024626, 5.54701,
-3.537941, -2.767841, -6.17632,
-3.537941, -2.767841, 5.54701,
-3.537941, 3.024626, -6.17632,
-3.537941, 3.024626, 5.54701,
-3.537941, -2.767841, -6.17632,
2.899041, -2.767841, -6.17632,
-3.537941, -2.767841, 5.54701,
2.899041, -2.767841, 5.54701,
-3.537941, 3.024626, -6.17632,
2.899041, 3.024626, -6.17632,
-3.537941, 3.024626, 5.54701,
2.899041, 3.024626, 5.54701,
2.899041, -2.767841, -6.17632,
2.899041, 3.024626, -6.17632,
2.899041, -2.767841, 5.54701,
2.899041, 3.024626, 5.54701,
2.899041, -2.767841, -6.17632,
2.899041, -2.767841, 5.54701,
2.899041, 3.024626, -6.17632,
2.899041, 3.024626, 5.54701
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
var radius = 7.782643;
var distance = 34.62586;
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
mvMatrix.translate( 0.3194501, -0.1283921, 0.3146546 );
mvMatrix.scale( 1.30725, 1.452705, 0.7177778 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62586);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
aniline<-read.table("aniline.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aniline$V2
```

```
## Error in eval(expr, envir, enclos): object 'aniline' not found
```

```r
y<-aniline$V3
```

```
## Error in eval(expr, envir, enclos): object 'aniline' not found
```

```r
z<-aniline$V4
```

```
## Error in eval(expr, envir, enclos): object 'aniline' not found
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
-3.444199, -0.3284748, -0.09425783, 0, 0, 1, 1, 1,
-2.64067, -0.1741035, -1.901254, 1, 0, 0, 1, 1,
-2.596425, 0.04738294, -1.408879, 1, 0, 0, 1, 1,
-2.582669, 0.8932089, -1.525947, 1, 0, 0, 1, 1,
-2.559381, 0.2069513, -3.071543, 1, 0, 0, 1, 1,
-2.5185, 0.2898893, -2.302811, 1, 0, 0, 1, 1,
-2.492638, 0.5285756, -1.614382, 0, 0, 0, 1, 1,
-2.441208, 0.1928565, -2.713724, 0, 0, 0, 1, 1,
-2.422482, -0.938198, -1.825907, 0, 0, 0, 1, 1,
-2.289631, 0.8800457, -0.3592575, 0, 0, 0, 1, 1,
-2.225569, -0.5282589, 0.1502321, 0, 0, 0, 1, 1,
-2.200175, -0.2731898, -2.987292, 0, 0, 0, 1, 1,
-2.168536, -0.7385489, -1.838551, 0, 0, 0, 1, 1,
-2.164258, 0.4764354, 0.3259823, 1, 1, 1, 1, 1,
-2.125948, -0.7239866, -2.637119, 1, 1, 1, 1, 1,
-2.086249, 2.040019, -1.524561, 1, 1, 1, 1, 1,
-2.030714, -0.8874654, -2.3973, 1, 1, 1, 1, 1,
-2.02997, -0.8596549, -0.7519161, 1, 1, 1, 1, 1,
-2.016099, 0.1400785, -1.407681, 1, 1, 1, 1, 1,
-1.998148, -0.1294478, -2.956907, 1, 1, 1, 1, 1,
-1.997112, 2.166651, -0.8249221, 1, 1, 1, 1, 1,
-1.994625, -0.6081842, -2.899605, 1, 1, 1, 1, 1,
-1.994403, -0.8854781, -2.403855, 1, 1, 1, 1, 1,
-1.989854, -0.7127759, -1.583785, 1, 1, 1, 1, 1,
-1.978393, -0.2569889, -0.5586069, 1, 1, 1, 1, 1,
-1.947672, 1.185032, -1.901245, 1, 1, 1, 1, 1,
-1.945072, -1.29516, -3.998682, 1, 1, 1, 1, 1,
-1.93033, -0.7854646, -2.372334, 1, 1, 1, 1, 1,
-1.919457, -0.749926, -4.294834, 0, 0, 1, 1, 1,
-1.901618, 0.3543743, -1.405148, 1, 0, 0, 1, 1,
-1.897047, 0.03250923, -0.8240907, 1, 0, 0, 1, 1,
-1.854972, 0.3138247, -3.018472, 1, 0, 0, 1, 1,
-1.849476, -0.9058225, -1.515916, 1, 0, 0, 1, 1,
-1.83399, -2.582359, -2.821531, 1, 0, 0, 1, 1,
-1.833272, -1.339611, -1.857945, 0, 0, 0, 1, 1,
-1.810037, 0.6376945, -1.230077, 0, 0, 0, 1, 1,
-1.799976, -0.3360378, -3.161991, 0, 0, 0, 1, 1,
-1.768959, -0.06300732, -2.27461, 0, 0, 0, 1, 1,
-1.765388, 0.4459487, -0.8031875, 0, 0, 0, 1, 1,
-1.757176, 0.7046678, -0.6999988, 0, 0, 0, 1, 1,
-1.749381, -1.53186, -2.140965, 0, 0, 0, 1, 1,
-1.749174, -0.5489771, -1.788494, 1, 1, 1, 1, 1,
-1.747329, -0.473762, -2.20861, 1, 1, 1, 1, 1,
-1.725289, -0.632586, -1.860486, 1, 1, 1, 1, 1,
-1.711076, 0.469705, -1.06799, 1, 1, 1, 1, 1,
-1.70993, 1.152834, -1.359724, 1, 1, 1, 1, 1,
-1.708478, 1.124136, -0.2751981, 1, 1, 1, 1, 1,
-1.687947, -0.2036408, -2.673997, 1, 1, 1, 1, 1,
-1.67055, 1.563311, -1.52158, 1, 1, 1, 1, 1,
-1.655441, 1.566231, -0.9685427, 1, 1, 1, 1, 1,
-1.655115, -0.6760525, -0.5828345, 1, 1, 1, 1, 1,
-1.649559, 0.5962914, -1.204004, 1, 1, 1, 1, 1,
-1.647186, -0.2601303, -1.263505, 1, 1, 1, 1, 1,
-1.643922, -0.3495248, -1.408809, 1, 1, 1, 1, 1,
-1.643662, 1.298666, -1.850265, 1, 1, 1, 1, 1,
-1.616368, 1.18915, -0.9162071, 1, 1, 1, 1, 1,
-1.600302, -0.5556117, -2.344697, 0, 0, 1, 1, 1,
-1.596613, 1.483384, -0.1888167, 1, 0, 0, 1, 1,
-1.583203, 1.924268, -1.01212, 1, 0, 0, 1, 1,
-1.581522, 0.474407, -0.4091416, 1, 0, 0, 1, 1,
-1.558982, 0.3856604, -0.6032032, 1, 0, 0, 1, 1,
-1.556433, 1.355993, -2.809632, 1, 0, 0, 1, 1,
-1.540974, 1.204642, -0.1357805, 0, 0, 0, 1, 1,
-1.532957, 0.5974006, -0.8812608, 0, 0, 0, 1, 1,
-1.527178, -0.1031895, -2.52269, 0, 0, 0, 1, 1,
-1.525135, -0.6646894, -1.680255, 0, 0, 0, 1, 1,
-1.512849, -1.450991, -2.356527, 0, 0, 0, 1, 1,
-1.510227, 2.423797, -0.5024644, 0, 0, 0, 1, 1,
-1.49967, 0.834075, -1.654283, 0, 0, 0, 1, 1,
-1.495397, 0.6441217, -2.115491, 1, 1, 1, 1, 1,
-1.482999, -0.8960887, -3.394434, 1, 1, 1, 1, 1,
-1.47651, -0.5626184, -1.776788, 1, 1, 1, 1, 1,
-1.466621, 0.3400493, -0.6134452, 1, 1, 1, 1, 1,
-1.448354, 1.299392, -0.06183441, 1, 1, 1, 1, 1,
-1.442674, 0.364236, -1.089096, 1, 1, 1, 1, 1,
-1.43979, 1.16601, -0.03601969, 1, 1, 1, 1, 1,
-1.423042, -0.1061956, 0.3674819, 1, 1, 1, 1, 1,
-1.415847, -1.019927, -2.484551, 1, 1, 1, 1, 1,
-1.414675, -0.7384968, -1.856243, 1, 1, 1, 1, 1,
-1.413611, 0.9028205, -0.6309153, 1, 1, 1, 1, 1,
-1.40475, 0.09095894, -0.783805, 1, 1, 1, 1, 1,
-1.398904, -0.2576062, -1.119598, 1, 1, 1, 1, 1,
-1.387641, 0.188836, -2.737231, 1, 1, 1, 1, 1,
-1.387107, 0.4264042, -1.320299, 1, 1, 1, 1, 1,
-1.386371, 0.7796485, -0.9080278, 0, 0, 1, 1, 1,
-1.384224, 0.2736274, -2.018169, 1, 0, 0, 1, 1,
-1.377016, -0.9870667, -2.008982, 1, 0, 0, 1, 1,
-1.372398, -0.5735282, -1.025931, 1, 0, 0, 1, 1,
-1.365313, 0.7264684, -1.111462, 1, 0, 0, 1, 1,
-1.359203, 1.612479, -0.6848341, 1, 0, 0, 1, 1,
-1.331556, -0.659118, -1.777466, 0, 0, 0, 1, 1,
-1.331025, -2.619968, -2.625525, 0, 0, 0, 1, 1,
-1.33086, 1.787097, -0.8198938, 0, 0, 0, 1, 1,
-1.326128, 0.09771411, -1.349417, 0, 0, 0, 1, 1,
-1.324798, 0.6548576, 0.7732983, 0, 0, 0, 1, 1,
-1.323772, -2.349907, -2.110489, 0, 0, 0, 1, 1,
-1.319738, 2.034324, -1.231213, 0, 0, 0, 1, 1,
-1.318353, -1.356877, -2.681188, 1, 1, 1, 1, 1,
-1.300578, -0.8711922, -0.8659218, 1, 1, 1, 1, 1,
-1.295725, -2.025606, -2.067718, 1, 1, 1, 1, 1,
-1.292851, 0.3455671, -0.9240478, 1, 1, 1, 1, 1,
-1.287475, -1.226298, -1.790058, 1, 1, 1, 1, 1,
-1.283377, 0.009459785, 0.1863239, 1, 1, 1, 1, 1,
-1.283088, -0.6973928, -1.815597, 1, 1, 1, 1, 1,
-1.281827, -0.3900633, -1.023727, 1, 1, 1, 1, 1,
-1.261403, -0.5950405, -0.9334769, 1, 1, 1, 1, 1,
-1.257739, -2.552114, -3.974169, 1, 1, 1, 1, 1,
-1.253527, 0.4588738, -1.62553, 1, 1, 1, 1, 1,
-1.251675, 0.9158779, -1.209698, 1, 1, 1, 1, 1,
-1.2497, 1.255702, -1.129037, 1, 1, 1, 1, 1,
-1.239874, -0.03675795, -2.168454, 1, 1, 1, 1, 1,
-1.232492, -1.509483, -2.470162, 1, 1, 1, 1, 1,
-1.229216, 1.061528, -1.169014, 0, 0, 1, 1, 1,
-1.227066, 0.8161347, -1.852959, 1, 0, 0, 1, 1,
-1.218108, -0.7726748, -3.02229, 1, 0, 0, 1, 1,
-1.214763, 0.228584, -2.21699, 1, 0, 0, 1, 1,
-1.21364, -0.1800477, -2.898994, 1, 0, 0, 1, 1,
-1.204202, 1.703818, -1.590084, 1, 0, 0, 1, 1,
-1.202466, 0.1725733, -1.599098, 0, 0, 0, 1, 1,
-1.189195, 0.2402391, -1.038905, 0, 0, 0, 1, 1,
-1.184549, -0.2496132, -0.5915524, 0, 0, 0, 1, 1,
-1.184425, 0.01464249, -2.309777, 0, 0, 0, 1, 1,
-1.183015, -1.628435, -3.199165, 0, 0, 0, 1, 1,
-1.178706, -1.416029, -2.927717, 0, 0, 0, 1, 1,
-1.172689, -1.025508, -3.11314, 0, 0, 0, 1, 1,
-1.169901, -1.464219, -2.497544, 1, 1, 1, 1, 1,
-1.167869, 0.7673982, -0.647653, 1, 1, 1, 1, 1,
-1.167341, -1.085818, -1.252182, 1, 1, 1, 1, 1,
-1.164342, -0.5350704, -2.578982, 1, 1, 1, 1, 1,
-1.156565, 0.06341726, -2.07947, 1, 1, 1, 1, 1,
-1.1426, -0.1285204, -2.414394, 1, 1, 1, 1, 1,
-1.138923, -0.7572989, -2.0244, 1, 1, 1, 1, 1,
-1.137294, 2.103097, 0.00371059, 1, 1, 1, 1, 1,
-1.126519, -2.346028, -4.329911, 1, 1, 1, 1, 1,
-1.116979, -0.3634605, -2.486876, 1, 1, 1, 1, 1,
-1.114559, -0.8540128, 0.06862854, 1, 1, 1, 1, 1,
-1.11235, 1.207503, -2.187879, 1, 1, 1, 1, 1,
-1.107261, -1.426155, -1.575912, 1, 1, 1, 1, 1,
-1.104569, -0.4260674, -1.255195, 1, 1, 1, 1, 1,
-1.095947, -1.155029, -1.212718, 1, 1, 1, 1, 1,
-1.075617, 1.008793, -1.358726, 0, 0, 1, 1, 1,
-1.075085, -0.2431027, -1.51076, 1, 0, 0, 1, 1,
-1.071434, -0.434031, -2.066391, 1, 0, 0, 1, 1,
-1.058303, 0.4529002, -1.797846, 1, 0, 0, 1, 1,
-1.05374, 0.0439897, -0.494069, 1, 0, 0, 1, 1,
-1.050506, -0.7749889, -2.206422, 1, 0, 0, 1, 1,
-1.038388, -1.208004, -2.009966, 0, 0, 0, 1, 1,
-1.03553, 0.7643136, -0.5921127, 0, 0, 0, 1, 1,
-1.034819, 1.187723, -0.8887931, 0, 0, 0, 1, 1,
-1.032786, 0.453277, -1.308521, 0, 0, 0, 1, 1,
-1.025681, -0.3220481, -2.445503, 0, 0, 0, 1, 1,
-1.023055, 1.615143, 0.5872768, 0, 0, 0, 1, 1,
-1.022725, 0.3110622, 0.08169744, 0, 0, 0, 1, 1,
-1.021055, -0.3078839, -1.992492, 1, 1, 1, 1, 1,
-1.01829, 0.001667091, -1.441271, 1, 1, 1, 1, 1,
-1.014061, -1.333681, -3.014177, 1, 1, 1, 1, 1,
-1.008116, 1.107298, -1.159648, 1, 1, 1, 1, 1,
-1.004746, -0.4488854, -3.339228, 1, 1, 1, 1, 1,
-1.003921, -0.806196, -1.39922, 1, 1, 1, 1, 1,
-1.002195, 1.146137, -1.920908, 1, 1, 1, 1, 1,
-0.9990534, 0.7503405, -1.396288, 1, 1, 1, 1, 1,
-0.998489, -0.1109349, -0.6538095, 1, 1, 1, 1, 1,
-0.9842427, -0.2519971, -2.612903, 1, 1, 1, 1, 1,
-0.9831057, -0.3937265, -2.552601, 1, 1, 1, 1, 1,
-0.9696704, -0.4039732, -0.4274732, 1, 1, 1, 1, 1,
-0.9686496, 0.8103881, 0.685092, 1, 1, 1, 1, 1,
-0.9646676, -1.399719, -0.9404162, 1, 1, 1, 1, 1,
-0.9600482, 1.221522, -1.636813, 1, 1, 1, 1, 1,
-0.9577988, -1.406972, -3.287904, 0, 0, 1, 1, 1,
-0.9448009, 0.5402969, -1.982909, 1, 0, 0, 1, 1,
-0.9387155, 0.3970647, -2.330663, 1, 0, 0, 1, 1,
-0.932013, 0.612324, -2.390473, 1, 0, 0, 1, 1,
-0.9284639, -0.2725604, -2.52432, 1, 0, 0, 1, 1,
-0.927819, 1.280408, -1.615476, 1, 0, 0, 1, 1,
-0.9262192, 0.2330368, -0.408867, 0, 0, 0, 1, 1,
-0.9190271, 0.3972676, -0.59253, 0, 0, 0, 1, 1,
-0.9067872, -0.8568212, -2.543878, 0, 0, 0, 1, 1,
-0.9058347, 1.465474, -0.6957479, 0, 0, 0, 1, 1,
-0.9044309, -0.1169292, -2.503605, 0, 0, 0, 1, 1,
-0.8988095, 0.755855, -1.370865, 0, 0, 0, 1, 1,
-0.8979284, -0.3160394, -3.954175, 0, 0, 0, 1, 1,
-0.8945073, 0.2977239, -0.8884656, 1, 1, 1, 1, 1,
-0.8911177, -0.6712289, -2.664587, 1, 1, 1, 1, 1,
-0.8893211, -0.001221009, -2.455434, 1, 1, 1, 1, 1,
-0.886135, -1.394965, -4.227396, 1, 1, 1, 1, 1,
-0.8825278, 0.428652, -0.8013992, 1, 1, 1, 1, 1,
-0.8805671, 0.07010108, -1.976603, 1, 1, 1, 1, 1,
-0.8754789, 1.706444, 0.9921595, 1, 1, 1, 1, 1,
-0.8691233, 1.201117, -1.427083, 1, 1, 1, 1, 1,
-0.8682593, -0.2751547, -2.313951, 1, 1, 1, 1, 1,
-0.8673193, 0.6054307, -1.438437, 1, 1, 1, 1, 1,
-0.8670844, -0.6843702, -2.539446, 1, 1, 1, 1, 1,
-0.8659009, 0.6034495, -1.147051, 1, 1, 1, 1, 1,
-0.8599439, -1.021123, -2.405942, 1, 1, 1, 1, 1,
-0.8595116, 0.1105691, -0.1994517, 1, 1, 1, 1, 1,
-0.8577432, -0.2591555, -1.472634, 1, 1, 1, 1, 1,
-0.8568671, 1.2564, 0.06391165, 0, 0, 1, 1, 1,
-0.8522736, 1.778283, -0.3634, 1, 0, 0, 1, 1,
-0.8489965, 0.3486304, 0.4491914, 1, 0, 0, 1, 1,
-0.8420882, 2.527038, -1.119441, 1, 0, 0, 1, 1,
-0.8401335, 0.5535161, -2.733432, 1, 0, 0, 1, 1,
-0.8342772, 0.7506059, -0.6730003, 1, 0, 0, 1, 1,
-0.8338087, 0.3180939, -2.376891, 0, 0, 0, 1, 1,
-0.8269315, -0.5107098, -0.8807851, 0, 0, 0, 1, 1,
-0.8260986, -0.4985141, -2.552139, 0, 0, 0, 1, 1,
-0.8227851, -0.208357, -2.39329, 0, 0, 0, 1, 1,
-0.8220903, -0.005324174, -1.866847, 0, 0, 0, 1, 1,
-0.8212972, 1.295626, -0.4154718, 0, 0, 0, 1, 1,
-0.8171965, 0.03049425, -1.907022, 0, 0, 0, 1, 1,
-0.8068455, 0.5941522, 0.6571619, 1, 1, 1, 1, 1,
-0.8049585, 0.8350435, 0.2113088, 1, 1, 1, 1, 1,
-0.8046365, -0.07605592, -1.411301, 1, 1, 1, 1, 1,
-0.8037077, 0.260284, -0.2839125, 1, 1, 1, 1, 1,
-0.803256, 1.39544, -1.212568, 1, 1, 1, 1, 1,
-0.8030538, -0.6817169, -3.642926, 1, 1, 1, 1, 1,
-0.7862448, 0.6860327, -0.09771012, 1, 1, 1, 1, 1,
-0.7847972, -0.7176897, -2.384434, 1, 1, 1, 1, 1,
-0.7847446, 0.7271553, -1.071012, 1, 1, 1, 1, 1,
-0.7834065, -0.02303349, -0.8262282, 1, 1, 1, 1, 1,
-0.7799678, -0.4150367, -1.760949, 1, 1, 1, 1, 1,
-0.7671286, 1.020265, 0.5349107, 1, 1, 1, 1, 1,
-0.7625656, 0.6170727, -0.4920146, 1, 1, 1, 1, 1,
-0.7508767, 0.9579393, -0.4891743, 1, 1, 1, 1, 1,
-0.7491966, 1.236645, 0.6194935, 1, 1, 1, 1, 1,
-0.7451292, -0.2621048, -0.7115749, 0, 0, 1, 1, 1,
-0.7373034, 0.6081027, -1.518939, 1, 0, 0, 1, 1,
-0.7298089, 2.078036, 1.118197, 1, 0, 0, 1, 1,
-0.7292663, -0.01410174, -0.2640556, 1, 0, 0, 1, 1,
-0.7183129, 0.4650348, -0.1806055, 1, 0, 0, 1, 1,
-0.7163821, 0.3332426, -0.5850016, 1, 0, 0, 1, 1,
-0.7137485, 0.6774244, -0.02082992, 0, 0, 0, 1, 1,
-0.7101126, -0.9960131, -0.8162286, 0, 0, 0, 1, 1,
-0.7071261, -0.06342531, -0.1667162, 0, 0, 0, 1, 1,
-0.7059953, 0.5115772, -1.704785, 0, 0, 0, 1, 1,
-0.70295, -0.1607876, -1.794255, 0, 0, 0, 1, 1,
-0.7026364, -0.1861665, -1.09223, 0, 0, 0, 1, 1,
-0.6982708, 0.5659574, -1.420795, 0, 0, 0, 1, 1,
-0.6980206, 1.135595, -1.125811, 1, 1, 1, 1, 1,
-0.6949741, -0.8352951, -3.398218, 1, 1, 1, 1, 1,
-0.6852566, -1.695696, -1.477613, 1, 1, 1, 1, 1,
-0.6829078, 1.481529, -1.777601, 1, 1, 1, 1, 1,
-0.6814701, -0.1040043, -1.888817, 1, 1, 1, 1, 1,
-0.6806071, 0.7370434, -0.7753826, 1, 1, 1, 1, 1,
-0.6805871, -1.64686, -1.968249, 1, 1, 1, 1, 1,
-0.6726468, 0.4037876, -0.5837233, 1, 1, 1, 1, 1,
-0.6668263, -2.596273, -1.781313, 1, 1, 1, 1, 1,
-0.6652374, 1.429725, -0.5275717, 1, 1, 1, 1, 1,
-0.65614, -0.9626449, -3.917173, 1, 1, 1, 1, 1,
-0.6511983, 0.4999014, 0.06494591, 1, 1, 1, 1, 1,
-0.6505003, -0.2774819, -2.225278, 1, 1, 1, 1, 1,
-0.6478628, 0.2621724, -0.4587715, 1, 1, 1, 1, 1,
-0.647387, 1.36805, -1.010445, 1, 1, 1, 1, 1,
-0.6469269, -0.777567, -3.256326, 0, 0, 1, 1, 1,
-0.6429341, 0.6288329, -0.7893248, 1, 0, 0, 1, 1,
-0.6418293, 0.6847948, 0.7713505, 1, 0, 0, 1, 1,
-0.6389239, -0.9469716, -1.578598, 1, 0, 0, 1, 1,
-0.6371717, 0.5637943, -0.4607422, 1, 0, 0, 1, 1,
-0.6370695, 0.08422849, -1.002701, 1, 0, 0, 1, 1,
-0.6354208, 0.6488363, -1.554596, 0, 0, 0, 1, 1,
-0.6299866, -1.122261, -3.597691, 0, 0, 0, 1, 1,
-0.6289982, -0.2109322, -0.9029014, 0, 0, 0, 1, 1,
-0.6279635, -1.190343, -2.013597, 0, 0, 0, 1, 1,
-0.6237239, 0.06458019, -0.8142017, 0, 0, 0, 1, 1,
-0.6203533, -0.7259268, -2.262191, 0, 0, 0, 1, 1,
-0.6164508, -1.652964, -2.630217, 0, 0, 0, 1, 1,
-0.6147695, -0.6996341, -1.948358, 1, 1, 1, 1, 1,
-0.6112412, -0.6313663, -3.183686, 1, 1, 1, 1, 1,
-0.6099285, 0.4036817, -0.7179462, 1, 1, 1, 1, 1,
-0.6070465, 0.9395334, 0.4501446, 1, 1, 1, 1, 1,
-0.6019588, 0.5271471, -0.4405316, 1, 1, 1, 1, 1,
-0.6014453, 0.8204973, -2.079859, 1, 1, 1, 1, 1,
-0.6005815, 0.3922814, 0.2684422, 1, 1, 1, 1, 1,
-0.5998802, -0.9299538, -1.493741, 1, 1, 1, 1, 1,
-0.5988676, 0.2315507, -2.976295, 1, 1, 1, 1, 1,
-0.594775, -2.516562, -2.033979, 1, 1, 1, 1, 1,
-0.5870197, -0.8355172, -1.97336, 1, 1, 1, 1, 1,
-0.5792752, 0.04091614, -0.5897262, 1, 1, 1, 1, 1,
-0.5772413, 0.6744146, -0.5047987, 1, 1, 1, 1, 1,
-0.5743791, -1.576843, -2.943819, 1, 1, 1, 1, 1,
-0.5737059, 1.064384, -1.174849, 1, 1, 1, 1, 1,
-0.5717806, -1.430196, -1.882056, 0, 0, 1, 1, 1,
-0.5681297, -0.6505693, -3.789244, 1, 0, 0, 1, 1,
-0.5649275, -1.437166, -3.839327, 1, 0, 0, 1, 1,
-0.556513, 1.612808, -0.4226047, 1, 0, 0, 1, 1,
-0.553599, -1.418303, -2.1363, 1, 0, 0, 1, 1,
-0.5502893, 0.2602089, -1.274499, 1, 0, 0, 1, 1,
-0.5410644, 0.8518167, -0.7908238, 0, 0, 0, 1, 1,
-0.5379149, 0.4297038, 1.15149, 0, 0, 0, 1, 1,
-0.537676, -1.253903, -3.419691, 0, 0, 0, 1, 1,
-0.532888, 0.6569601, -1.017209, 0, 0, 0, 1, 1,
-0.5276176, 1.045431, -1.3767, 0, 0, 0, 1, 1,
-0.5269678, -1.38666, -2.69762, 0, 0, 0, 1, 1,
-0.5251035, 0.5966361, 0.9969842, 0, 0, 0, 1, 1,
-0.5243032, 0.4948168, -2.723037, 1, 1, 1, 1, 1,
-0.5216722, -0.4868493, -2.186338, 1, 1, 1, 1, 1,
-0.519929, 0.7725056, -1.134665, 1, 1, 1, 1, 1,
-0.5082233, 1.245072, -0.476909, 1, 1, 1, 1, 1,
-0.5079192, 0.4567671, -2.536943, 1, 1, 1, 1, 1,
-0.4997158, -0.9286263, -3.006496, 1, 1, 1, 1, 1,
-0.4995732, 0.372233, -0.2330899, 1, 1, 1, 1, 1,
-0.4983581, 0.1699689, -1.351215, 1, 1, 1, 1, 1,
-0.4976676, 0.1131357, -1.871605, 1, 1, 1, 1, 1,
-0.4975922, 1.465781, 0.8094103, 1, 1, 1, 1, 1,
-0.4949757, -1.344963, -1.846207, 1, 1, 1, 1, 1,
-0.4897874, -0.203398, -1.48748, 1, 1, 1, 1, 1,
-0.486147, -0.4619743, -2.301996, 1, 1, 1, 1, 1,
-0.4853005, -0.4618966, -2.221232, 1, 1, 1, 1, 1,
-0.4847505, 2.276767, 1.751557, 1, 1, 1, 1, 1,
-0.4844768, 0.5120158, -1.695727, 0, 0, 1, 1, 1,
-0.4839423, 1.320779, 1.427196, 1, 0, 0, 1, 1,
-0.4797716, 0.05197999, 0.6258354, 1, 0, 0, 1, 1,
-0.4788375, -0.035422, -1.767469, 1, 0, 0, 1, 1,
-0.4781526, 0.903352, 0.3465465, 1, 0, 0, 1, 1,
-0.4779937, -0.7347259, -3.144222, 1, 0, 0, 1, 1,
-0.4709339, -0.07458414, -2.23202, 0, 0, 0, 1, 1,
-0.4705051, -0.03061908, -1.862403, 0, 0, 0, 1, 1,
-0.4661465, 1.02151, -0.9202216, 0, 0, 0, 1, 1,
-0.4660708, 0.6117427, -0.6281475, 0, 0, 0, 1, 1,
-0.4637491, -0.6742076, -2.995744, 0, 0, 0, 1, 1,
-0.462846, -0.1246286, -0.9301219, 0, 0, 0, 1, 1,
-0.457137, -0.3142423, -2.2559, 0, 0, 0, 1, 1,
-0.4567013, -0.2932073, -2.918825, 1, 1, 1, 1, 1,
-0.4560246, -0.5622913, -3.512687, 1, 1, 1, 1, 1,
-0.4541568, -2.252485, -3.099036, 1, 1, 1, 1, 1,
-0.4522098, -0.4750497, -4.031961, 1, 1, 1, 1, 1,
-0.4473101, -0.1659635, -3.317888, 1, 1, 1, 1, 1,
-0.4407445, 0.3332946, 0.8015846, 1, 1, 1, 1, 1,
-0.4397101, 0.8903383, -0.3263722, 1, 1, 1, 1, 1,
-0.4336058, -0.9711627, -2.61094, 1, 1, 1, 1, 1,
-0.4272632, -1.480798, -1.843503, 1, 1, 1, 1, 1,
-0.4257656, -1.93118, -4.481147, 1, 1, 1, 1, 1,
-0.4184245, -0.0296859, -2.467291, 1, 1, 1, 1, 1,
-0.4160954, -0.06733977, -3.654317, 1, 1, 1, 1, 1,
-0.4144311, 0.7816582, -1.469386, 1, 1, 1, 1, 1,
-0.4140936, 0.6964052, -1.585102, 1, 1, 1, 1, 1,
-0.4139195, -0.03997266, -2.073775, 1, 1, 1, 1, 1,
-0.4097153, 0.9040617, -0.2870731, 0, 0, 1, 1, 1,
-0.4043053, 0.905841, -0.435609, 1, 0, 0, 1, 1,
-0.4040725, -0.1049109, -1.672808, 1, 0, 0, 1, 1,
-0.4038977, 0.4520907, 0.4517515, 1, 0, 0, 1, 1,
-0.4036438, -0.1896745, -1.508972, 1, 0, 0, 1, 1,
-0.4015128, 0.8319573, -1.51216, 1, 0, 0, 1, 1,
-0.3940611, 0.7533346, -1.66255, 0, 0, 0, 1, 1,
-0.3936162, 1.533557, 0.8888, 0, 0, 0, 1, 1,
-0.3897758, 2.294847, -1.393043, 0, 0, 0, 1, 1,
-0.3856834, -1.382864, -3.633078, 0, 0, 0, 1, 1,
-0.3831067, -0.2192207, -4.015866, 0, 0, 0, 1, 1,
-0.3824572, -0.2068609, -0.6483105, 0, 0, 0, 1, 1,
-0.3808151, 0.334543, -0.6402223, 0, 0, 0, 1, 1,
-0.3803968, -0.01435746, -2.101126, 1, 1, 1, 1, 1,
-0.3788313, -0.03285944, -1.831381, 1, 1, 1, 1, 1,
-0.3777117, 1.310752, 1.487103, 1, 1, 1, 1, 1,
-0.3774923, -0.04998899, -2.103847, 1, 1, 1, 1, 1,
-0.3665871, 1.833919, 1.114409, 1, 1, 1, 1, 1,
-0.3651704, 1.718068, -0.3905269, 1, 1, 1, 1, 1,
-0.3646899, -0.3315834, -1.358105, 1, 1, 1, 1, 1,
-0.363997, 0.8757242, 0.8138088, 1, 1, 1, 1, 1,
-0.3633385, -0.6092117, -3.844649, 1, 1, 1, 1, 1,
-0.3614606, -0.5368367, -1.077386, 1, 1, 1, 1, 1,
-0.358521, 0.8968992, 0.2536664, 1, 1, 1, 1, 1,
-0.3559695, 1.097797, -0.1008168, 1, 1, 1, 1, 1,
-0.3548846, -0.3549128, -3.328974, 1, 1, 1, 1, 1,
-0.3511292, -0.7889791, -1.632027, 1, 1, 1, 1, 1,
-0.3507337, -0.850755, -2.610987, 1, 1, 1, 1, 1,
-0.3459684, -0.445748, -1.43989, 0, 0, 1, 1, 1,
-0.341664, 0.10617, -0.2481829, 1, 0, 0, 1, 1,
-0.3395066, 0.214346, -0.1359291, 1, 0, 0, 1, 1,
-0.338169, 1.55041, 0.1124887, 1, 0, 0, 1, 1,
-0.3316103, -1.015681, -2.583027, 1, 0, 0, 1, 1,
-0.3305221, 0.4434988, -2.94135, 1, 0, 0, 1, 1,
-0.33027, 1.772319, -0.9371533, 0, 0, 0, 1, 1,
-0.328949, 0.7663687, -0.8461368, 0, 0, 0, 1, 1,
-0.3278642, -0.03302445, -2.629154, 0, 0, 0, 1, 1,
-0.3278486, -0.4014618, -1.777673, 0, 0, 0, 1, 1,
-0.3260609, -0.7461528, -3.207471, 0, 0, 0, 1, 1,
-0.3218071, -0.8937559, 0.4787252, 0, 0, 0, 1, 1,
-0.3194951, -0.8748882, -3.061196, 0, 0, 0, 1, 1,
-0.3190174, 1.788206, -0.3740789, 1, 1, 1, 1, 1,
-0.3083814, -0.9247598, -2.101557, 1, 1, 1, 1, 1,
-0.3068155, -0.6755428, -2.301699, 1, 1, 1, 1, 1,
-0.304637, -1.714041, -1.874247, 1, 1, 1, 1, 1,
-0.2958075, 1.021651, -0.7397251, 1, 1, 1, 1, 1,
-0.2811005, 0.204162, -0.1188628, 1, 1, 1, 1, 1,
-0.2769825, -0.9953277, -2.809976, 1, 1, 1, 1, 1,
-0.2763284, 0.5182397, 0.799647, 1, 1, 1, 1, 1,
-0.264009, -1.180438, -3.293189, 1, 1, 1, 1, 1,
-0.2609854, 1.632472, 1.117014, 1, 1, 1, 1, 1,
-0.2609719, 0.01321676, -0.3039554, 1, 1, 1, 1, 1,
-0.2608932, 0.4562443, -0.2305355, 1, 1, 1, 1, 1,
-0.2602516, 0.8824047, 0.4425288, 1, 1, 1, 1, 1,
-0.258959, -0.08322795, -0.7029281, 1, 1, 1, 1, 1,
-0.2579286, 0.2338294, 0.876073, 1, 1, 1, 1, 1,
-0.2578116, -0.05434513, -1.134393, 0, 0, 1, 1, 1,
-0.2563036, 0.8021659, -1.559122, 1, 0, 0, 1, 1,
-0.2548433, -0.6571175, -2.277087, 1, 0, 0, 1, 1,
-0.2546473, 0.4052839, -3.305805, 1, 0, 0, 1, 1,
-0.2535773, -0.5956795, -2.133805, 1, 0, 0, 1, 1,
-0.249847, -0.8319497, -3.018854, 1, 0, 0, 1, 1,
-0.2453932, -0.5281447, -1.223463, 0, 0, 0, 1, 1,
-0.2453273, 0.5493192, -0.5168064, 0, 0, 0, 1, 1,
-0.2387918, 1.039199, 0.2916835, 0, 0, 0, 1, 1,
-0.23744, -0.7318522, -4.204611, 0, 0, 0, 1, 1,
-0.2364062, -1.350627, -1.528386, 0, 0, 0, 1, 1,
-0.2315484, 1.527311, 1.107872, 0, 0, 0, 1, 1,
-0.2218775, -0.04016828, -2.485904, 0, 0, 0, 1, 1,
-0.2213456, 0.9812483, -0.07646911, 1, 1, 1, 1, 1,
-0.218385, 1.546673, 0.967911, 1, 1, 1, 1, 1,
-0.2152763, 1.204513, -1.903489, 1, 1, 1, 1, 1,
-0.2131022, 0.7548228, -0.3850764, 1, 1, 1, 1, 1,
-0.2129589, -0.1456892, -2.573821, 1, 1, 1, 1, 1,
-0.2103277, -1.033148, -3.701631, 1, 1, 1, 1, 1,
-0.2049093, 0.5447491, 0.03400123, 1, 1, 1, 1, 1,
-0.1995651, -0.5690075, -3.783742, 1, 1, 1, 1, 1,
-0.1963587, -1.477171, -4.336952, 1, 1, 1, 1, 1,
-0.1947576, 1.223702, -0.0603065, 1, 1, 1, 1, 1,
-0.1945953, 0.7506317, 1.465009, 1, 1, 1, 1, 1,
-0.1893807, 1.195758, -0.3686354, 1, 1, 1, 1, 1,
-0.1875162, 0.0451229, -1.008381, 1, 1, 1, 1, 1,
-0.1856741, -0.5081274, -3.336426, 1, 1, 1, 1, 1,
-0.1822646, -0.514735, -1.854546, 1, 1, 1, 1, 1,
-0.1773428, -1.925311, -5.208683, 0, 0, 1, 1, 1,
-0.1733345, -0.004537166, -0.3729102, 1, 0, 0, 1, 1,
-0.169461, -1.15291, -1.107383, 1, 0, 0, 1, 1,
-0.1680468, 0.7543046, -0.9927655, 1, 0, 0, 1, 1,
-0.1674644, 0.4327876, 0.5099599, 1, 0, 0, 1, 1,
-0.1625054, 0.1496709, -1.792345, 1, 0, 0, 1, 1,
-0.1617903, 0.3078632, -0.9145228, 0, 0, 0, 1, 1,
-0.1606752, 1.79404, 0.1389558, 0, 0, 0, 1, 1,
-0.1581478, 0.9029708, -2.403831, 0, 0, 0, 1, 1,
-0.1564284, 1.219937, 0.7321813, 0, 0, 0, 1, 1,
-0.151794, -0.5994992, -3.021949, 0, 0, 0, 1, 1,
-0.1501331, -2.276049, -3.443259, 0, 0, 0, 1, 1,
-0.1472895, -0.1252581, -1.651576, 0, 0, 0, 1, 1,
-0.146412, 0.2229028, -1.694162, 1, 1, 1, 1, 1,
-0.1462434, -0.2747122, -0.6934206, 1, 1, 1, 1, 1,
-0.1461863, 0.2484549, -2.56283, 1, 1, 1, 1, 1,
-0.1412627, 0.5096182, 0.4130103, 1, 1, 1, 1, 1,
-0.1402539, -1.52319, -2.19801, 1, 1, 1, 1, 1,
-0.1387303, -0.6343179, -3.785411, 1, 1, 1, 1, 1,
-0.13756, 0.3611491, -2.340391, 1, 1, 1, 1, 1,
-0.1374201, -0.5863999, -3.424862, 1, 1, 1, 1, 1,
-0.1369459, 0.2424144, -0.2061604, 1, 1, 1, 1, 1,
-0.1361605, 0.313818, -2.044424, 1, 1, 1, 1, 1,
-0.1352521, -0.7171245, -3.412496, 1, 1, 1, 1, 1,
-0.1349698, -0.8119527, -3.731238, 1, 1, 1, 1, 1,
-0.1342542, -0.3164687, -3.26842, 1, 1, 1, 1, 1,
-0.1330382, -1.22153, -3.56118, 1, 1, 1, 1, 1,
-0.1324497, 2.412879, -0.8965204, 1, 1, 1, 1, 1,
-0.1312299, 2.282649, -0.471829, 0, 0, 1, 1, 1,
-0.1301126, -0.3631582, -2.940847, 1, 0, 0, 1, 1,
-0.1257472, -1.415104, -3.77592, 1, 0, 0, 1, 1,
-0.1223971, -1.170429, -1.990201, 1, 0, 0, 1, 1,
-0.1220306, -2.080667, -1.953301, 1, 0, 0, 1, 1,
-0.1174489, 0.7821248, 0.4755867, 1, 0, 0, 1, 1,
-0.1169209, -0.7993386, -3.655073, 0, 0, 0, 1, 1,
-0.1127524, -0.1672851, -1.699276, 0, 0, 0, 1, 1,
-0.1119659, 0.8166243, 0.7079077, 0, 0, 0, 1, 1,
-0.110151, 0.3804729, -1.20345, 0, 0, 0, 1, 1,
-0.1041361, 0.1487179, -1.940769, 0, 0, 0, 1, 1,
-0.102065, -1.803993, -3.945127, 0, 0, 0, 1, 1,
-0.1005125, -0.7794049, -2.068963, 0, 0, 0, 1, 1,
-0.09777223, 1.406032, 0.4761041, 1, 1, 1, 1, 1,
-0.09687588, 0.4961938, -1.834017, 1, 1, 1, 1, 1,
-0.09146157, 0.09464625, 0.3122216, 1, 1, 1, 1, 1,
-0.08762728, 1.212066, 0.05270521, 1, 1, 1, 1, 1,
-0.08235803, 0.2605756, 2.102217, 1, 1, 1, 1, 1,
-0.07846713, -0.8607373, -3.025941, 1, 1, 1, 1, 1,
-0.07794351, 0.9606587, -1.136856, 1, 1, 1, 1, 1,
-0.07708184, -1.371904, -6.005591, 1, 1, 1, 1, 1,
-0.07592902, 1.52415, -1.265608, 1, 1, 1, 1, 1,
-0.07045718, 0.4629015, 0.1439331, 1, 1, 1, 1, 1,
-0.06362412, -1.285145, -1.987581, 1, 1, 1, 1, 1,
-0.06264225, -0.01705099, -1.46345, 1, 1, 1, 1, 1,
-0.05977226, 0.1095138, -1.316272, 1, 1, 1, 1, 1,
-0.05595702, -0.1397635, -2.175337, 1, 1, 1, 1, 1,
-0.05164258, -1.196236, -2.599379, 1, 1, 1, 1, 1,
-0.05102327, 0.2622988, 1.415772, 0, 0, 1, 1, 1,
-0.04887614, 1.019551, -0.1453953, 1, 0, 0, 1, 1,
-0.04753878, -0.1346019, -2.428864, 1, 0, 0, 1, 1,
-0.04708806, -1.814614, -1.851035, 1, 0, 0, 1, 1,
-0.04616734, -0.9054227, -2.58079, 1, 0, 0, 1, 1,
-0.04611537, -0.5470841, -4.050141, 1, 0, 0, 1, 1,
-0.04541679, -0.2202243, -2.576795, 0, 0, 0, 1, 1,
-0.04503395, -0.5689495, -1.972192, 0, 0, 0, 1, 1,
-0.0408323, 0.1338161, 1.066952, 0, 0, 0, 1, 1,
-0.03849863, -1.162573, -2.298155, 0, 0, 0, 1, 1,
-0.03773255, -0.02202786, -2.643732, 0, 0, 0, 1, 1,
-0.03767079, -1.037735, -2.026385, 0, 0, 0, 1, 1,
-0.03380762, -0.07334158, -2.336071, 0, 0, 0, 1, 1,
-0.03337181, 0.379938, 0.4724148, 1, 1, 1, 1, 1,
-0.0316172, -0.555952, -3.996941, 1, 1, 1, 1, 1,
-0.03078458, 0.6254998, 1.44308, 1, 1, 1, 1, 1,
-0.02791819, -0.3823998, -2.377105, 1, 1, 1, 1, 1,
-0.02142071, -0.2104281, -2.481415, 1, 1, 1, 1, 1,
-0.02013625, 2.113709, 0.1698376, 1, 1, 1, 1, 1,
-0.01998938, 0.0317294, 1.024701, 1, 1, 1, 1, 1,
-0.0172477, 0.8339455, -0.2701797, 1, 1, 1, 1, 1,
-0.01698981, 0.3681462, 1.792682, 1, 1, 1, 1, 1,
-0.01629067, -0.5892677, -4.658768, 1, 1, 1, 1, 1,
-0.01243439, 0.4097224, 0.4413489, 1, 1, 1, 1, 1,
-0.008372353, 0.4999955, -0.009730549, 1, 1, 1, 1, 1,
-0.0002080879, 0.6747442, 1.62035, 1, 1, 1, 1, 1,
0.0009198649, -1.485976, 3.045711, 1, 1, 1, 1, 1,
0.01045674, -1.074081, 3.019023, 1, 1, 1, 1, 1,
0.01114999, -0.8018876, 3.478163, 0, 0, 1, 1, 1,
0.01625605, -1.158178, 4.567598, 1, 0, 0, 1, 1,
0.01702047, -1.191101, 2.529951, 1, 0, 0, 1, 1,
0.01760485, 0.1629739, -0.6515241, 1, 0, 0, 1, 1,
0.0181982, 0.8146278, 0.5700962, 1, 0, 0, 1, 1,
0.02097261, -2.023135, 1.199125, 1, 0, 0, 1, 1,
0.02117858, -1.290836, 4.672624, 0, 0, 0, 1, 1,
0.02131536, 1.51682, 1.981507, 0, 0, 0, 1, 1,
0.02180734, 2.279485, 1.658464, 0, 0, 0, 1, 1,
0.02213193, -1.046506, 3.165035, 0, 0, 0, 1, 1,
0.02551701, 0.8993428, 0.4436215, 0, 0, 0, 1, 1,
0.03110197, 0.3138362, -1.216845, 0, 0, 0, 1, 1,
0.03323033, 0.5940963, 0.07611909, 0, 0, 0, 1, 1,
0.03728238, -0.6092724, 3.253756, 1, 1, 1, 1, 1,
0.04094786, -0.7120748, 3.395628, 1, 1, 1, 1, 1,
0.04358707, 1.283931, -0.0680919, 1, 1, 1, 1, 1,
0.04464296, 0.4830576, -0.02829953, 1, 1, 1, 1, 1,
0.04683058, -0.04559347, 1.519775, 1, 1, 1, 1, 1,
0.05099771, -0.4740927, 3.585124, 1, 1, 1, 1, 1,
0.05565241, 0.05963457, 0.7742512, 1, 1, 1, 1, 1,
0.06674225, 0.01218839, 2.870084, 1, 1, 1, 1, 1,
0.06795495, 0.06796252, 0.616358, 1, 1, 1, 1, 1,
0.07002962, -0.2460248, 1.635533, 1, 1, 1, 1, 1,
0.07015052, 0.7866225, -0.1861912, 1, 1, 1, 1, 1,
0.07157903, -0.1322169, 1.888, 1, 1, 1, 1, 1,
0.07347187, 0.4236121, -0.3011231, 1, 1, 1, 1, 1,
0.07910062, -0.3437134, 0.5244904, 1, 1, 1, 1, 1,
0.08222778, 0.7767342, -1.167701, 1, 1, 1, 1, 1,
0.08427124, -0.1302203, 2.946394, 0, 0, 1, 1, 1,
0.08473293, -0.5763698, 3.546517, 1, 0, 0, 1, 1,
0.08476952, 0.07463469, -0.2289924, 1, 0, 0, 1, 1,
0.09058037, 1.268559, 0.5948681, 1, 0, 0, 1, 1,
0.09124444, 2.02414, 0.733144, 1, 0, 0, 1, 1,
0.09347357, 0.574995, -0.4238743, 1, 0, 0, 1, 1,
0.09426451, -0.5073434, 2.406171, 0, 0, 0, 1, 1,
0.09671233, 0.02467512, 1.465785, 0, 0, 0, 1, 1,
0.09702531, -0.5719832, 3.230608, 0, 0, 0, 1, 1,
0.09982584, 1.158687, 0.8275228, 0, 0, 0, 1, 1,
0.1009322, 0.2374728, -0.3407527, 0, 0, 0, 1, 1,
0.101399, -0.9412472, 1.774079, 0, 0, 0, 1, 1,
0.1024118, 0.7747787, 2.293088, 0, 0, 0, 1, 1,
0.1077693, 1.552528, 0.06677291, 1, 1, 1, 1, 1,
0.1081997, 1.32227, -1.717912, 1, 1, 1, 1, 1,
0.111594, 0.6179789, 1.823092, 1, 1, 1, 1, 1,
0.1129531, 0.4618691, -1.151461, 1, 1, 1, 1, 1,
0.1175302, -1.58929, 1.49093, 1, 1, 1, 1, 1,
0.1181847, 0.06508346, -0.4956465, 1, 1, 1, 1, 1,
0.1192744, -0.7529636, 3.063289, 1, 1, 1, 1, 1,
0.1244691, 1.202501, -0.6281894, 1, 1, 1, 1, 1,
0.130413, -1.483632, 2.266744, 1, 1, 1, 1, 1,
0.1333495, 0.5208869, -0.1164554, 1, 1, 1, 1, 1,
0.1353754, -0.06532678, 0.1887995, 1, 1, 1, 1, 1,
0.135721, -0.2478895, 3.862966, 1, 1, 1, 1, 1,
0.1470766, 0.04433697, 1.92343, 1, 1, 1, 1, 1,
0.1514575, -0.3533501, 3.037601, 1, 1, 1, 1, 1,
0.1595445, -0.6589568, 3.118705, 1, 1, 1, 1, 1,
0.1612228, 0.4958954, 0.421749, 0, 0, 1, 1, 1,
0.1615, 0.313895, 1.989129, 1, 0, 0, 1, 1,
0.1637999, -0.3725907, 3.322155, 1, 0, 0, 1, 1,
0.1659307, 0.2338088, 2.133563, 1, 0, 0, 1, 1,
0.1679173, 0.2672893, 0.4266106, 1, 0, 0, 1, 1,
0.1737169, 0.09413812, 3.052032, 1, 0, 0, 1, 1,
0.174431, 1.084341, 1.111197, 0, 0, 0, 1, 1,
0.1771857, -1.513034, 3.379158, 0, 0, 0, 1, 1,
0.1781811, -0.3837458, 2.121518, 0, 0, 0, 1, 1,
0.1789417, -0.6108046, 2.949429, 0, 0, 0, 1, 1,
0.1832583, -0.5766494, -0.3161902, 0, 0, 0, 1, 1,
0.1833981, -1.426561, 2.821458, 0, 0, 0, 1, 1,
0.1838492, -1.511007, 4.938392, 0, 0, 0, 1, 1,
0.1841335, 0.5828575, 1.475909, 1, 1, 1, 1, 1,
0.1853944, 0.299587, -0.8636597, 1, 1, 1, 1, 1,
0.185403, 1.311621, -1.020773, 1, 1, 1, 1, 1,
0.1859342, -0.08053663, 1.134216, 1, 1, 1, 1, 1,
0.1924787, -1.057652, 4.070494, 1, 1, 1, 1, 1,
0.1989139, 0.3154765, 0.9140921, 1, 1, 1, 1, 1,
0.2037476, -0.2235723, 2.027847, 1, 1, 1, 1, 1,
0.2107418, -1.746878, 1.780821, 1, 1, 1, 1, 1,
0.2125812, 0.01227762, 1.303446, 1, 1, 1, 1, 1,
0.2127482, -1.329014, 2.835063, 1, 1, 1, 1, 1,
0.2130699, 1.284243, 0.8253241, 1, 1, 1, 1, 1,
0.2153251, 0.1251015, 0.8706473, 1, 1, 1, 1, 1,
0.2157675, 0.8685457, 0.7960726, 1, 1, 1, 1, 1,
0.2170794, 1.831725, -1.305348, 1, 1, 1, 1, 1,
0.2186361, 1.34572, -0.7752266, 1, 1, 1, 1, 1,
0.2282979, -0.8284452, 2.269466, 0, 0, 1, 1, 1,
0.2304245, 0.7064667, -1.741481, 1, 0, 0, 1, 1,
0.2380402, 0.5805936, 0.2300194, 1, 0, 0, 1, 1,
0.2393645, 0.7507201, -0.09007925, 1, 0, 0, 1, 1,
0.245281, 1.803151, 0.6098703, 1, 0, 0, 1, 1,
0.2469465, -1.324293, 2.507405, 1, 0, 0, 1, 1,
0.2478347, 0.3977811, -0.8379256, 0, 0, 0, 1, 1,
0.2481325, 1.389661, -2.813076, 0, 0, 0, 1, 1,
0.249958, 0.4209426, 0.4344489, 0, 0, 0, 1, 1,
0.2521431, -1.959976, 3.955179, 0, 0, 0, 1, 1,
0.253017, -0.3889686, 2.018646, 0, 0, 0, 1, 1,
0.2543729, -0.2919515, 1.197262, 0, 0, 0, 1, 1,
0.2554081, -1.302427, 3.530464, 0, 0, 0, 1, 1,
0.2593249, 1.651425, 0.4055608, 1, 1, 1, 1, 1,
0.2688457, -1.468791, 4.252658, 1, 1, 1, 1, 1,
0.2727843, -0.4339342, 2.868075, 1, 1, 1, 1, 1,
0.2773602, -1.463316, 2.147745, 1, 1, 1, 1, 1,
0.278437, 1.300876, -0.8505395, 1, 1, 1, 1, 1,
0.2828331, 0.5421681, 0.235082, 1, 1, 1, 1, 1,
0.2842285, 1.454498, 0.5480423, 1, 1, 1, 1, 1,
0.2866023, 0.5852666, 1.569908, 1, 1, 1, 1, 1,
0.2884467, 0.2888193, 0.003956363, 1, 1, 1, 1, 1,
0.2904261, 0.3096027, 0.803804, 1, 1, 1, 1, 1,
0.2946227, -1.017686, 3.098726, 1, 1, 1, 1, 1,
0.2953099, 0.4625045, 0.1869689, 1, 1, 1, 1, 1,
0.2966314, 2.051243, 0.5209256, 1, 1, 1, 1, 1,
0.301612, 0.9479153, -0.5561053, 1, 1, 1, 1, 1,
0.3020365, 0.5994953, 0.6399165, 1, 1, 1, 1, 1,
0.3023871, 0.3918127, 1.621994, 0, 0, 1, 1, 1,
0.3026309, 0.05016569, 1.733223, 1, 0, 0, 1, 1,
0.305911, 1.072337, 3.214608, 1, 0, 0, 1, 1,
0.3194907, 0.05246206, 0.522515, 1, 0, 0, 1, 1,
0.3198109, -0.3188154, 4.316034, 1, 0, 0, 1, 1,
0.3200223, -0.1510463, 2.300626, 1, 0, 0, 1, 1,
0.3204979, 0.2450645, 1.634344, 0, 0, 0, 1, 1,
0.3221775, 0.9326105, 0.9308376, 0, 0, 0, 1, 1,
0.3226988, 0.7239456, 1.185096, 0, 0, 0, 1, 1,
0.3240433, -0.6333953, 4.427249, 0, 0, 0, 1, 1,
0.3263825, -0.7155666, 2.562456, 0, 0, 0, 1, 1,
0.3276105, -0.4807355, 2.668711, 0, 0, 0, 1, 1,
0.3303422, 0.7870508, -0.1761856, 0, 0, 0, 1, 1,
0.3320679, 0.1279919, 3.475796, 1, 1, 1, 1, 1,
0.3389898, 0.294379, 0.3142317, 1, 1, 1, 1, 1,
0.3425156, 0.08686876, 0.7733179, 1, 1, 1, 1, 1,
0.3425689, -0.2880607, 1.602467, 1, 1, 1, 1, 1,
0.3485378, 0.2224075, 2.188885, 1, 1, 1, 1, 1,
0.353211, 0.06732231, 1.856674, 1, 1, 1, 1, 1,
0.3592002, -2.683485, 3.458821, 1, 1, 1, 1, 1,
0.3686193, -0.4424477, 1.854244, 1, 1, 1, 1, 1,
0.3737698, -0.9746268, 3.41432, 1, 1, 1, 1, 1,
0.3810677, 0.5686521, 0.7890631, 1, 1, 1, 1, 1,
0.381974, -2.488409, 1.142421, 1, 1, 1, 1, 1,
0.38232, 1.063805, 1.164955, 1, 1, 1, 1, 1,
0.3827369, -1.649382, 2.989926, 1, 1, 1, 1, 1,
0.3876843, -0.4752723, 2.998075, 1, 1, 1, 1, 1,
0.3879663, -1.326368, 2.317492, 1, 1, 1, 1, 1,
0.3896481, 0.4674806, -0.001695308, 0, 0, 1, 1, 1,
0.3896683, -0.3462393, 1.069439, 1, 0, 0, 1, 1,
0.3919285, 0.3934621, 0.7098563, 1, 0, 0, 1, 1,
0.3921102, 0.2498513, 1.882285, 1, 0, 0, 1, 1,
0.3926737, -0.03315653, 1.385498, 1, 0, 0, 1, 1,
0.4007681, 1.72428, -1.755592, 1, 0, 0, 1, 1,
0.4009669, -0.5578513, 3.060844, 0, 0, 0, 1, 1,
0.4023786, -0.03658305, 3.091314, 0, 0, 0, 1, 1,
0.4051523, 1.557038, 0.3781615, 0, 0, 0, 1, 1,
0.4093258, -0.6888822, 2.88105, 0, 0, 0, 1, 1,
0.4120263, -0.599381, 1.896523, 0, 0, 0, 1, 1,
0.4166178, 0.4376936, 1.031064, 0, 0, 0, 1, 1,
0.4183472, -0.1177147, 1.700073, 0, 0, 0, 1, 1,
0.4237004, 0.5126026, 0.03394413, 1, 1, 1, 1, 1,
0.4247886, 0.3836244, -1.343209, 1, 1, 1, 1, 1,
0.4318797, -1.148331, 4.283968, 1, 1, 1, 1, 1,
0.4425033, 0.4568517, 0.7941836, 1, 1, 1, 1, 1,
0.4438921, 0.1120473, 1.953036, 1, 1, 1, 1, 1,
0.445728, -1.262574, 0.6306832, 1, 1, 1, 1, 1,
0.4498262, 0.9605556, -0.3601764, 1, 1, 1, 1, 1,
0.4537451, -1.035634, 2.736682, 1, 1, 1, 1, 1,
0.4568005, 1.025806, 0.6920194, 1, 1, 1, 1, 1,
0.4588621, -2.301393, 5.376282, 1, 1, 1, 1, 1,
0.4617625, 0.6272282, -1.381573, 1, 1, 1, 1, 1,
0.4653174, -0.1747018, 3.04971, 1, 1, 1, 1, 1,
0.4721297, 0.3050275, 1.552902, 1, 1, 1, 1, 1,
0.4789233, -0.7006355, 2.591284, 1, 1, 1, 1, 1,
0.4789477, 0.1510305, 1.58375, 1, 1, 1, 1, 1,
0.4800512, -0.09278049, 0.4668088, 0, 0, 1, 1, 1,
0.4805466, 1.030492, 0.9710858, 1, 0, 0, 1, 1,
0.4853583, 0.3600965, 1.066712, 1, 0, 0, 1, 1,
0.4870205, -0.4998695, 1.307729, 1, 0, 0, 1, 1,
0.4902301, 0.5905522, 0.05167268, 1, 0, 0, 1, 1,
0.4908106, 1.000197, 0.5071276, 1, 0, 0, 1, 1,
0.4958888, 0.7870609, 1.255758, 0, 0, 0, 1, 1,
0.5013705, -0.6527404, 0.5455295, 0, 0, 0, 1, 1,
0.5087827, 0.5433796, 0.9334494, 0, 0, 0, 1, 1,
0.5102379, -0.4864124, 2.765249, 0, 0, 0, 1, 1,
0.5125819, 0.397776, -0.7524027, 0, 0, 0, 1, 1,
0.5132901, -0.8974401, 2.605589, 0, 0, 0, 1, 1,
0.5139543, -0.8061209, 1.860874, 0, 0, 0, 1, 1,
0.5179356, -0.3347722, 4.126548, 1, 1, 1, 1, 1,
0.5197793, -0.7971407, 1.32865, 1, 1, 1, 1, 1,
0.5201247, -1.939185, 1.764121, 1, 1, 1, 1, 1,
0.5218063, -1.630513, 3.574863, 1, 1, 1, 1, 1,
0.5224063, 0.8182159, 0.7522034, 1, 1, 1, 1, 1,
0.5293443, 0.3932959, 1.762935, 1, 1, 1, 1, 1,
0.5295798, 0.6707882, -0.7649758, 1, 1, 1, 1, 1,
0.5299534, 2.834052, -0.1930822, 1, 1, 1, 1, 1,
0.5323014, -0.01602743, 1.911679, 1, 1, 1, 1, 1,
0.5339158, 1.652229, -0.632111, 1, 1, 1, 1, 1,
0.5356746, 1.175941, -0.4002513, 1, 1, 1, 1, 1,
0.536499, 0.8127279, -0.560436, 1, 1, 1, 1, 1,
0.5379829, -0.1950746, 2.631151, 1, 1, 1, 1, 1,
0.538087, -0.8658302, 2.872553, 1, 1, 1, 1, 1,
0.5391568, -0.7345909, 2.804648, 1, 1, 1, 1, 1,
0.5473525, 1.383547, 0.9266491, 0, 0, 1, 1, 1,
0.5490745, -0.6756913, 2.204223, 1, 0, 0, 1, 1,
0.5491087, -0.2331199, -0.4251581, 1, 0, 0, 1, 1,
0.5591489, -0.1872615, 1.577669, 1, 0, 0, 1, 1,
0.5602044, 0.1783575, 1.847943, 1, 0, 0, 1, 1,
0.5609294, -1.498759, 3.599899, 1, 0, 0, 1, 1,
0.5660548, -0.129827, 2.175793, 0, 0, 0, 1, 1,
0.5711107, 0.4849763, 0.9416213, 0, 0, 0, 1, 1,
0.571309, 1.325157, -0.903411, 0, 0, 0, 1, 1,
0.5767759, 1.014239, 1.425689, 0, 0, 0, 1, 1,
0.5788627, -1.49623, 1.938544, 0, 0, 0, 1, 1,
0.5810921, 0.1302869, 0.02392373, 0, 0, 0, 1, 1,
0.5834631, 0.01442266, -0.8771661, 0, 0, 0, 1, 1,
0.5852103, 0.09948416, 0.31991, 1, 1, 1, 1, 1,
0.5856125, 0.3310675, 1.257409, 1, 1, 1, 1, 1,
0.5886896, 1.194493, 1.076823, 1, 1, 1, 1, 1,
0.5918893, 0.398569, 0.7394384, 1, 1, 1, 1, 1,
0.593293, 0.5296776, -0.1820192, 1, 1, 1, 1, 1,
0.5951476, 0.05560452, 1.529209, 1, 1, 1, 1, 1,
0.6046046, 0.6589407, -0.02446485, 1, 1, 1, 1, 1,
0.6052131, -0.7969519, 2.395272, 1, 1, 1, 1, 1,
0.6069818, -0.6581917, 4.977206, 1, 1, 1, 1, 1,
0.6072302, 1.578411, -0.2188798, 1, 1, 1, 1, 1,
0.6098276, 1.674279, 2.092846, 1, 1, 1, 1, 1,
0.6115046, 0.6585292, 1.558868, 1, 1, 1, 1, 1,
0.61193, 1.406643, -0.4250185, 1, 1, 1, 1, 1,
0.6172252, 1.845992, -0.4229695, 1, 1, 1, 1, 1,
0.6195631, 1.017678, 1.303177, 1, 1, 1, 1, 1,
0.6213545, -0.8043962, 2.584141, 0, 0, 1, 1, 1,
0.6278262, 1.608649, 2.32292, 1, 0, 0, 1, 1,
0.6289304, 1.074955, 0.3108263, 1, 0, 0, 1, 1,
0.6327434, 0.2919965, -0.03667617, 1, 0, 0, 1, 1,
0.6363305, 1.12248, 1.018525, 1, 0, 0, 1, 1,
0.6371629, 0.6792595, -0.627925, 1, 0, 0, 1, 1,
0.6373256, -1.419361, 4.418628, 0, 0, 0, 1, 1,
0.6383331, 0.3485432, 1.554301, 0, 0, 0, 1, 1,
0.6390458, 0.1850083, 0.5351529, 0, 0, 0, 1, 1,
0.6393585, 0.9395849, 2.543637, 0, 0, 0, 1, 1,
0.6438187, -0.1036465, 2.975066, 0, 0, 0, 1, 1,
0.6460343, 1.285439, 0.5941864, 0, 0, 0, 1, 1,
0.6496457, -0.5700569, 0.3770245, 0, 0, 0, 1, 1,
0.649702, -0.1808345, 0.9959354, 1, 1, 1, 1, 1,
0.6533275, -0.4723136, 2.031107, 1, 1, 1, 1, 1,
0.6575721, 1.520901, 0.6207861, 1, 1, 1, 1, 1,
0.6587266, 0.8436401, 3.01544, 1, 1, 1, 1, 1,
0.6600904, -1.233692, 2.006589, 1, 1, 1, 1, 1,
0.6651343, -0.4381838, 3.051073, 1, 1, 1, 1, 1,
0.6674563, 2.075078, -0.8196393, 1, 1, 1, 1, 1,
0.6689098, -0.9342749, 1.781782, 1, 1, 1, 1, 1,
0.6741725, 1.594529, 1.229593, 1, 1, 1, 1, 1,
0.6759026, 0.794108, 0.4267794, 1, 1, 1, 1, 1,
0.6774794, 0.7989259, 2.164653, 1, 1, 1, 1, 1,
0.6814499, 0.6604586, 1.823103, 1, 1, 1, 1, 1,
0.6825588, -1.11676, 5.101109, 1, 1, 1, 1, 1,
0.6884584, -0.45679, 3.567091, 1, 1, 1, 1, 1,
0.6891133, 1.02858, 0.5948035, 1, 1, 1, 1, 1,
0.6917966, 1.41544, -0.4506989, 0, 0, 1, 1, 1,
0.6947913, 0.4061833, 1.13835, 1, 0, 0, 1, 1,
0.6992003, -0.6450258, 1.505943, 1, 0, 0, 1, 1,
0.703474, -0.08191953, 1.847606, 1, 0, 0, 1, 1,
0.70587, 2.050263, -0.9589328, 1, 0, 0, 1, 1,
0.7089165, 1.255588, 1.499125, 1, 0, 0, 1, 1,
0.7154398, 0.03222823, 1.135854, 0, 0, 0, 1, 1,
0.7340249, -0.616192, 3.735817, 0, 0, 0, 1, 1,
0.7392538, 0.1091808, 1.798169, 0, 0, 0, 1, 1,
0.7447308, -0.5695549, 2.870548, 0, 0, 0, 1, 1,
0.7464381, 0.3404078, 0.01831361, 0, 0, 0, 1, 1,
0.7472163, 1.191745, 0.5763106, 0, 0, 0, 1, 1,
0.7499778, -1.695106, 2.293748, 0, 0, 0, 1, 1,
0.7552924, 2.08854, 1.227219, 1, 1, 1, 1, 1,
0.7559671, -0.6794167, 2.330752, 1, 1, 1, 1, 1,
0.7561713, 0.9309125, 2.746571, 1, 1, 1, 1, 1,
0.7657953, 0.9862165, 1.00287, 1, 1, 1, 1, 1,
0.7671351, -1.549385, 3.294517, 1, 1, 1, 1, 1,
0.7705562, -0.3284875, 4.01517, 1, 1, 1, 1, 1,
0.7736904, 1.112002, 0.766163, 1, 1, 1, 1, 1,
0.7794029, 0.0672255, 2.566831, 1, 1, 1, 1, 1,
0.7837449, 1.84362, -0.3011235, 1, 1, 1, 1, 1,
0.7849364, -0.8033973, 1.595508, 1, 1, 1, 1, 1,
0.7853717, -0.2134231, 1.948553, 1, 1, 1, 1, 1,
0.7949842, -0.7471331, 2.044874, 1, 1, 1, 1, 1,
0.7953082, -0.4809668, 3.05624, 1, 1, 1, 1, 1,
0.798269, 0.4221572, 1.401499, 1, 1, 1, 1, 1,
0.8019554, 1.344975, -0.7779397, 1, 1, 1, 1, 1,
0.8046495, -0.6442903, 3.964944, 0, 0, 1, 1, 1,
0.8055474, 2.228992, 0.8876457, 1, 0, 0, 1, 1,
0.8073032, 0.5493065, 1.15947, 1, 0, 0, 1, 1,
0.81126, 1.396914, -0.06931678, 1, 0, 0, 1, 1,
0.8151459, -0.2439958, 3.427166, 1, 0, 0, 1, 1,
0.8193954, -0.1821032, 0.4842862, 1, 0, 0, 1, 1,
0.821874, 0.1641473, 0.9424653, 0, 0, 0, 1, 1,
0.8225912, -1.225426, 1.737793, 0, 0, 0, 1, 1,
0.8225913, 1.120704, 2.270371, 0, 0, 0, 1, 1,
0.8291324, 0.2418286, 0.3876612, 0, 0, 0, 1, 1,
0.8305755, 0.199347, 0.4755779, 0, 0, 0, 1, 1,
0.8324191, 0.9467199, 1.806438, 0, 0, 0, 1, 1,
0.8366374, 0.6382981, 0.676712, 0, 0, 0, 1, 1,
0.8382327, -0.1747454, 2.527661, 1, 1, 1, 1, 1,
0.8521883, 0.493832, 1.063872, 1, 1, 1, 1, 1,
0.8533209, -0.006269011, 0.1082794, 1, 1, 1, 1, 1,
0.8572211, 1.29099, -0.3246292, 1, 1, 1, 1, 1,
0.8684426, 1.262633, 1.584364, 1, 1, 1, 1, 1,
0.8841674, -1.06513, 2.815136, 1, 1, 1, 1, 1,
0.8841688, 0.3506931, 2.439008, 1, 1, 1, 1, 1,
0.8906105, -0.7622792, 4.168661, 1, 1, 1, 1, 1,
0.8908842, -1.658582, 3.607567, 1, 1, 1, 1, 1,
0.8913736, 0.1680744, 1.016625, 1, 1, 1, 1, 1,
0.8921635, -1.202369, 2.531839, 1, 1, 1, 1, 1,
0.8949791, 0.06118558, 2.059194, 1, 1, 1, 1, 1,
0.8957641, 0.4679705, 0.5744287, 1, 1, 1, 1, 1,
0.8963099, -1.035719, 2.528592, 1, 1, 1, 1, 1,
0.8990789, -0.4089459, 3.29217, 1, 1, 1, 1, 1,
0.8997917, -1.497426, 3.5799, 0, 0, 1, 1, 1,
0.9032519, -0.07417297, 3.324818, 1, 0, 0, 1, 1,
0.9042928, -0.718306, 2.055054, 1, 0, 0, 1, 1,
0.9043689, 0.1379315, 3.529841, 1, 0, 0, 1, 1,
0.9075016, -0.0580354, 2.712788, 1, 0, 0, 1, 1,
0.9115375, 1.164202, 1.852656, 1, 0, 0, 1, 1,
0.9120165, 0.001079989, 1.930422, 0, 0, 0, 1, 1,
0.9137787, -0.2468243, -0.4713099, 0, 0, 0, 1, 1,
0.9143047, 0.4312242, 2.891205, 0, 0, 0, 1, 1,
0.9157315, -0.642509, 3.165114, 0, 0, 0, 1, 1,
0.9172778, 0.5363789, -0.215508, 0, 0, 0, 1, 1,
0.9214702, -0.3815243, 2.943563, 0, 0, 0, 1, 1,
0.9250637, 0.5297793, -0.5133339, 0, 0, 0, 1, 1,
0.9284759, 1.656053, 0.5223625, 1, 1, 1, 1, 1,
0.9364276, 0.3964805, -0.3218543, 1, 1, 1, 1, 1,
0.939195, -0.8311013, 1.162935, 1, 1, 1, 1, 1,
0.940114, -0.4717163, 2.104631, 1, 1, 1, 1, 1,
0.9450666, 0.3404446, 1.561947, 1, 1, 1, 1, 1,
0.9455537, -1.370612, 1.646505, 1, 1, 1, 1, 1,
0.9573767, -1.591164, 1.766203, 1, 1, 1, 1, 1,
0.9602243, 0.4699627, -0.0233151, 1, 1, 1, 1, 1,
0.9651434, -0.9134673, 1.46328, 1, 1, 1, 1, 1,
0.9676679, -0.3114643, 0.8208466, 1, 1, 1, 1, 1,
0.9709401, -1.833859, 1.260698, 1, 1, 1, 1, 1,
0.9712909, 1.309074, 0.4906598, 1, 1, 1, 1, 1,
0.976877, -2.677179, 2.677794, 1, 1, 1, 1, 1,
0.9784516, 1.426793, -0.3628284, 1, 1, 1, 1, 1,
0.9836395, 2.905737, 1.183651, 1, 1, 1, 1, 1,
0.9907726, 1.393586, 0.790953, 0, 0, 1, 1, 1,
1.00624, 0.4716443, 1.386545, 1, 0, 0, 1, 1,
1.017913, 1.227318, -0.3745069, 1, 0, 0, 1, 1,
1.020494, 0.5936111, 0.6389582, 1, 0, 0, 1, 1,
1.02273, 0.8370249, 1.586825, 1, 0, 0, 1, 1,
1.022998, 0.6008729, 1.603507, 1, 0, 0, 1, 1,
1.023472, 0.3785583, 2.341014, 0, 0, 0, 1, 1,
1.026822, 1.181077, 0.8315033, 0, 0, 0, 1, 1,
1.032742, 1.392183, 0.0001931226, 0, 0, 0, 1, 1,
1.034286, 1.109982, 0.4767076, 0, 0, 0, 1, 1,
1.034301, -0.04953001, 1.844726, 0, 0, 0, 1, 1,
1.038804, -1.191748, 3.661511, 0, 0, 0, 1, 1,
1.046665, 0.5811767, 0.7444142, 0, 0, 0, 1, 1,
1.05095, -1.406209, 1.159935, 1, 1, 1, 1, 1,
1.051669, 1.157513, -0.3389866, 1, 1, 1, 1, 1,
1.06574, 1.403122, 1.392951, 1, 1, 1, 1, 1,
1.073839, 0.3368816, 1.237344, 1, 1, 1, 1, 1,
1.076632, -0.249702, 0.6221535, 1, 1, 1, 1, 1,
1.088309, 0.1244503, 1.430813, 1, 1, 1, 1, 1,
1.092604, -0.5410451, 1.661519, 1, 1, 1, 1, 1,
1.094188, -1.220729, 3.705541, 1, 1, 1, 1, 1,
1.097536, -0.7299072, 3.187912, 1, 1, 1, 1, 1,
1.105362, 1.205087, 1.899707, 1, 1, 1, 1, 1,
1.111146, 1.101722, 0.1688886, 1, 1, 1, 1, 1,
1.11168, 0.3483329, 3.240432, 1, 1, 1, 1, 1,
1.11501, -1.732289, 0.4698059, 1, 1, 1, 1, 1,
1.115231, 0.9467843, -0.2577632, 1, 1, 1, 1, 1,
1.118295, -0.1007409, 1.290497, 1, 1, 1, 1, 1,
1.125604, 1.488443, 1.03396, 0, 0, 1, 1, 1,
1.132214, -0.8524167, 4.358535, 1, 0, 0, 1, 1,
1.134683, -0.08957006, 1.156164, 1, 0, 0, 1, 1,
1.138814, -1.089939, 2.491748, 1, 0, 0, 1, 1,
1.139333, -0.2503823, 0.2556988, 1, 0, 0, 1, 1,
1.157205, 0.9247677, 2.883318, 1, 0, 0, 1, 1,
1.160777, 0.7204623, 1.63762, 0, 0, 0, 1, 1,
1.165166, 0.7644452, 2.468526, 0, 0, 0, 1, 1,
1.165371, 0.1666632, 0.103319, 0, 0, 0, 1, 1,
1.172152, -0.05182286, 0.3090445, 0, 0, 0, 1, 1,
1.173707, -1.529321, 1.167402, 0, 0, 0, 1, 1,
1.175574, 0.4202834, 1.617505, 0, 0, 0, 1, 1,
1.180479, 1.406933, -0.004367534, 0, 0, 0, 1, 1,
1.186006, -1.937803, 0.83013, 1, 1, 1, 1, 1,
1.187112, 1.48953, 1.796734, 1, 1, 1, 1, 1,
1.190537, -1.14818, 3.068872, 1, 1, 1, 1, 1,
1.194622, -0.4730153, -0.1543127, 1, 1, 1, 1, 1,
1.196613, -1.608804, 3.313572, 1, 1, 1, 1, 1,
1.200845, -0.2784288, 3.388645, 1, 1, 1, 1, 1,
1.204896, -0.3645251, 2.168532, 1, 1, 1, 1, 1,
1.204908, 0.8131075, 2.468561, 1, 1, 1, 1, 1,
1.215924, 2.797158, 1.42748, 1, 1, 1, 1, 1,
1.224708, 1.1071, 1.110084, 1, 1, 1, 1, 1,
1.227205, 0.3546799, 0.5844527, 1, 1, 1, 1, 1,
1.238959, -0.8365039, 1.856835, 1, 1, 1, 1, 1,
1.24637, 1.255934, 1.330752, 1, 1, 1, 1, 1,
1.258255, -0.2414439, 2.414496, 1, 1, 1, 1, 1,
1.264479, -1.030778, 2.882242, 1, 1, 1, 1, 1,
1.26564, 0.6132045, 1.364441, 0, 0, 1, 1, 1,
1.275114, -1.650723, 2.370229, 1, 0, 0, 1, 1,
1.281945, 1.540877, 0.2777609, 1, 0, 0, 1, 1,
1.288408, 0.2197435, 1.857982, 1, 0, 0, 1, 1,
1.289602, -0.3810675, 1.361689, 1, 0, 0, 1, 1,
1.306325, 0.9421073, 0.2960212, 1, 0, 0, 1, 1,
1.323492, -1.140477, 1.850141, 0, 0, 0, 1, 1,
1.32539, -0.4799115, 1.426864, 0, 0, 0, 1, 1,
1.331614, 0.7778796, 2.384807, 0, 0, 0, 1, 1,
1.347586, -0.9950624, 0.9979092, 0, 0, 0, 1, 1,
1.353919, -1.438698, 2.383991, 0, 0, 0, 1, 1,
1.354309, 0.3538908, 1.76582, 0, 0, 0, 1, 1,
1.355819, -0.2566142, 1.350066, 0, 0, 0, 1, 1,
1.371402, 0.617924, 1.116154, 1, 1, 1, 1, 1,
1.376863, 0.7185913, 2.217538, 1, 1, 1, 1, 1,
1.382933, -0.07124029, -0.5389262, 1, 1, 1, 1, 1,
1.385548, -1.401882, 2.04835, 1, 1, 1, 1, 1,
1.403041, -1.16881, 1.277969, 1, 1, 1, 1, 1,
1.410757, -0.3743331, 2.200054, 1, 1, 1, 1, 1,
1.410856, -0.3580109, -0.004457426, 1, 1, 1, 1, 1,
1.418737, -0.5954389, 1.019023, 1, 1, 1, 1, 1,
1.433844, -0.05193717, 1.806117, 1, 1, 1, 1, 1,
1.435788, 2.940269, 0.2969574, 1, 1, 1, 1, 1,
1.451243, -0.192561, 1.430206, 1, 1, 1, 1, 1,
1.451938, -0.3431114, 0.7345624, 1, 1, 1, 1, 1,
1.452437, -0.9877027, 2.882254, 1, 1, 1, 1, 1,
1.460354, -1.634777, 0.7424619, 1, 1, 1, 1, 1,
1.463222, -1.555134, 1.727645, 1, 1, 1, 1, 1,
1.472311, 1.513117, 1.284561, 0, 0, 1, 1, 1,
1.496627, 0.001358244, 1.517397, 1, 0, 0, 1, 1,
1.503168, 1.440475, 0.7892108, 1, 0, 0, 1, 1,
1.504349, 1.352196, 0.09084462, 1, 0, 0, 1, 1,
1.505496, -0.3572918, 1.083264, 1, 0, 0, 1, 1,
1.519047, 0.4497196, 0.4963105, 1, 0, 0, 1, 1,
1.519929, -0.03157695, 2.747504, 0, 0, 0, 1, 1,
1.526789, 0.1590353, 1.461682, 0, 0, 0, 1, 1,
1.538879, 1.537599, 0.06830911, 0, 0, 0, 1, 1,
1.572836, 0.06426647, 2.243709, 0, 0, 0, 1, 1,
1.607941, 2.291809, -0.04164181, 0, 0, 0, 1, 1,
1.612396, 0.2706175, 2.280335, 0, 0, 0, 1, 1,
1.616043, 0.513925, 3.316729, 0, 0, 0, 1, 1,
1.616064, -0.5709331, 1.834223, 1, 1, 1, 1, 1,
1.632769, 0.9921482, 2.442765, 1, 1, 1, 1, 1,
1.633234, 1.213914, 1.167028, 1, 1, 1, 1, 1,
1.642974, 0.5057319, 2.245652, 1, 1, 1, 1, 1,
1.649205, -0.5713629, 0.6314046, 1, 1, 1, 1, 1,
1.649246, 0.8568974, -0.3856578, 1, 1, 1, 1, 1,
1.651416, -0.3845381, 3.36384, 1, 1, 1, 1, 1,
1.653949, -1.093038, 0.990722, 1, 1, 1, 1, 1,
1.660319, -1.341228, 3.059026, 1, 1, 1, 1, 1,
1.663121, -0.9650882, 0.7775622, 1, 1, 1, 1, 1,
1.671992, 1.582656, 1.238956, 1, 1, 1, 1, 1,
1.672366, 0.2382174, 2.67615, 1, 1, 1, 1, 1,
1.674798, 0.730948, 1.034035, 1, 1, 1, 1, 1,
1.680026, -1.43473, 1.288573, 1, 1, 1, 1, 1,
1.707482, 0.1109824, 0.9342214, 1, 1, 1, 1, 1,
1.720756, -0.03559962, 0.5930483, 0, 0, 1, 1, 1,
1.732875, 0.4898936, 0.6003502, 1, 0, 0, 1, 1,
1.765436, -0.2183436, 1.806454, 1, 0, 0, 1, 1,
1.776783, -0.5811058, 2.257556, 1, 0, 0, 1, 1,
1.77794, 1.05044, 0.1176614, 1, 0, 0, 1, 1,
1.778455, -0.9511443, 1.827569, 1, 0, 0, 1, 1,
1.782377, -0.3342288, 1.412321, 0, 0, 0, 1, 1,
1.783076, 1.104823, 0.1577224, 0, 0, 0, 1, 1,
1.839806, 0.3864443, 1.277911, 0, 0, 0, 1, 1,
1.857469, -1.818194, 3.662562, 0, 0, 0, 1, 1,
1.860519, -0.431796, 0.488474, 0, 0, 0, 1, 1,
1.865036, -0.8155463, 2.40325, 0, 0, 0, 1, 1,
1.893656, -0.2176072, 1.96388, 0, 0, 0, 1, 1,
1.896017, -1.185356, 1.619029, 1, 1, 1, 1, 1,
1.896307, 0.265669, 1.882846, 1, 1, 1, 1, 1,
1.959914, -0.4086832, 3.051302, 1, 1, 1, 1, 1,
1.962079, 1.380195, -0.3952364, 1, 1, 1, 1, 1,
1.962509, -2.213758, 2.003114, 1, 1, 1, 1, 1,
1.97246, 0.9949057, 1.376612, 1, 1, 1, 1, 1,
1.996078, -1.760332, 1.435234, 1, 1, 1, 1, 1,
1.997633, 1.586541, -0.4199519, 1, 1, 1, 1, 1,
2.005134, -0.7711653, 1.409562, 1, 1, 1, 1, 1,
2.040316, -1.022207, 0.5379631, 1, 1, 1, 1, 1,
2.097842, 0.1010727, -0.8172491, 1, 1, 1, 1, 1,
2.099448, 0.5002396, 0.925799, 1, 1, 1, 1, 1,
2.129912, -0.8807568, 2.604238, 1, 1, 1, 1, 1,
2.161042, -0.07697393, 3.187549, 1, 1, 1, 1, 1,
2.170377, -0.7245387, 2.279208, 1, 1, 1, 1, 1,
2.17856, 0.3079129, -0.7059433, 0, 0, 1, 1, 1,
2.188918, -0.4031164, 1.956895, 1, 0, 0, 1, 1,
2.242946, -0.6970044, 2.050607, 1, 0, 0, 1, 1,
2.244783, 0.09075592, 1.649507, 1, 0, 0, 1, 1,
2.24674, 1.517113, 2.871266, 1, 0, 0, 1, 1,
2.286155, -0.1121398, 1.135129, 1, 0, 0, 1, 1,
2.287183, 0.5316198, 0.4165858, 0, 0, 0, 1, 1,
2.301282, -0.3974031, 1.556586, 0, 0, 0, 1, 1,
2.307892, 2.25497, 1.178023, 0, 0, 0, 1, 1,
2.361356, -0.8668306, 1.199708, 0, 0, 0, 1, 1,
2.512316, -2.125211, 2.03475, 0, 0, 0, 1, 1,
2.517532, 0.6919934, 2.387215, 0, 0, 0, 1, 1,
2.522604, 2.493438, 0.3070477, 0, 0, 0, 1, 1,
2.54048, 1.112457, 1.599314, 1, 1, 1, 1, 1,
2.593905, 0.4070694, 2.00236, 1, 1, 1, 1, 1,
2.654811, -0.8582017, 1.222358, 1, 1, 1, 1, 1,
2.657938, -1.196574, 1.943669, 1, 1, 1, 1, 1,
2.714834, 0.3508302, 1.136432, 1, 1, 1, 1, 1,
2.797371, -0.3460774, 1.461612, 1, 1, 1, 1, 1,
2.805299, 0.3848103, 1.284867, 1, 1, 1, 1, 1
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
var radius = 9.609279;
var distance = 33.75219;
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
mvMatrix.translate( 0.3194501, -0.1283921, 0.3146546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75219);
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
