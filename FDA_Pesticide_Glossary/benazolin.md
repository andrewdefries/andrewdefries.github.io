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
-2.797022, -0.4539631, -1.78162, 1, 0, 0, 1,
-2.703662, 0.4232919, -1.763489, 1, 0.007843138, 0, 1,
-2.675811, 0.987301, -2.007425, 1, 0.01176471, 0, 1,
-2.640024, 0.507503, -1.610333, 1, 0.01960784, 0, 1,
-2.606471, -0.3294214, -0.9989469, 1, 0.02352941, 0, 1,
-2.603907, 0.734866, -0.191149, 1, 0.03137255, 0, 1,
-2.551847, -0.9366848, -1.873646, 1, 0.03529412, 0, 1,
-2.546474, 0.09026217, -1.66225, 1, 0.04313726, 0, 1,
-2.376138, 0.2882053, -2.252893, 1, 0.04705882, 0, 1,
-2.373897, -0.3640864, -2.257297, 1, 0.05490196, 0, 1,
-2.360663, 0.5193386, -1.065653, 1, 0.05882353, 0, 1,
-2.280175, -0.4128973, -2.299453, 1, 0.06666667, 0, 1,
-2.273883, 1.296481, -1.03661, 1, 0.07058824, 0, 1,
-2.259792, -0.4112312, -1.312221, 1, 0.07843138, 0, 1,
-2.259391, 0.5911425, -2.418495, 1, 0.08235294, 0, 1,
-2.242011, -0.6992138, -2.662799, 1, 0.09019608, 0, 1,
-2.238666, -0.5827416, -3.267796, 1, 0.09411765, 0, 1,
-2.187254, 2.077026, 0.4578526, 1, 0.1019608, 0, 1,
-2.175285, 0.6155142, -3.019147, 1, 0.1098039, 0, 1,
-2.1747, -0.3425243, -1.054584, 1, 0.1137255, 0, 1,
-2.137685, 0.03036531, -2.067095, 1, 0.1215686, 0, 1,
-2.124848, -0.4054647, -1.856224, 1, 0.1254902, 0, 1,
-2.12393, 2.542015, -0.5634837, 1, 0.1333333, 0, 1,
-2.118284, -1.419472, -2.02287, 1, 0.1372549, 0, 1,
-2.111997, 0.3451992, 0.1881629, 1, 0.145098, 0, 1,
-2.071705, -1.083531, -1.505211, 1, 0.1490196, 0, 1,
-2.045515, 1.028435, 0.7115716, 1, 0.1568628, 0, 1,
-1.984168, -0.1561464, -1.169293, 1, 0.1607843, 0, 1,
-1.969012, -1.19521, -2.675958, 1, 0.1686275, 0, 1,
-1.966396, -2.124347, -2.659643, 1, 0.172549, 0, 1,
-1.950428, 0.3416525, -0.6703584, 1, 0.1803922, 0, 1,
-1.933531, -0.5155659, -2.415021, 1, 0.1843137, 0, 1,
-1.926087, -0.5792886, -1.904652, 1, 0.1921569, 0, 1,
-1.912979, 0.329576, -3.387831, 1, 0.1960784, 0, 1,
-1.895724, -0.7536741, -2.68874, 1, 0.2039216, 0, 1,
-1.879993, -0.6323097, -2.646944, 1, 0.2117647, 0, 1,
-1.836661, -1.778435, -3.180389, 1, 0.2156863, 0, 1,
-1.830311, -0.5496933, -2.758989, 1, 0.2235294, 0, 1,
-1.82315, 0.188924, -2.914816, 1, 0.227451, 0, 1,
-1.810313, 0.7607528, -1.125713, 1, 0.2352941, 0, 1,
-1.749694, 0.5234079, -1.39154, 1, 0.2392157, 0, 1,
-1.697524, -0.4341528, -1.204203, 1, 0.2470588, 0, 1,
-1.697519, 0.01889514, -1.686398, 1, 0.2509804, 0, 1,
-1.691092, 0.06345329, -1.758973, 1, 0.2588235, 0, 1,
-1.678701, 0.7354392, -3.801521, 1, 0.2627451, 0, 1,
-1.669452, -0.7327619, -3.968262, 1, 0.2705882, 0, 1,
-1.64781, -0.4068529, -2.026258, 1, 0.2745098, 0, 1,
-1.644812, -1.523094, -1.471655, 1, 0.282353, 0, 1,
-1.642545, 0.06387062, -1.068216, 1, 0.2862745, 0, 1,
-1.621178, -0.9305079, -2.197712, 1, 0.2941177, 0, 1,
-1.611421, -0.7564253, -1.469361, 1, 0.3019608, 0, 1,
-1.594348, 0.6729962, 0.2721755, 1, 0.3058824, 0, 1,
-1.593954, 1.488141, -0.9472674, 1, 0.3137255, 0, 1,
-1.569863, 0.5346733, -1.4796, 1, 0.3176471, 0, 1,
-1.559813, 0.7037567, 0.02569423, 1, 0.3254902, 0, 1,
-1.55776, -1.278096, -4.086021, 1, 0.3294118, 0, 1,
-1.554972, -0.4390917, -2.317266, 1, 0.3372549, 0, 1,
-1.547847, -0.8078074, -1.877885, 1, 0.3411765, 0, 1,
-1.53501, -0.1652948, -0.8484907, 1, 0.3490196, 0, 1,
-1.532507, -1.435821, -2.011692, 1, 0.3529412, 0, 1,
-1.52862, 0.04015507, -2.233085, 1, 0.3607843, 0, 1,
-1.52525, 0.608525, -2.201536, 1, 0.3647059, 0, 1,
-1.52517, 1.546992, -0.4115316, 1, 0.372549, 0, 1,
-1.498125, -1.623458, -2.966644, 1, 0.3764706, 0, 1,
-1.493807, 0.9641191, 0.1675419, 1, 0.3843137, 0, 1,
-1.493504, 0.9515291, -0.3359357, 1, 0.3882353, 0, 1,
-1.490277, 0.5132896, -1.322045, 1, 0.3960784, 0, 1,
-1.482048, -0.6930336, -1.580032, 1, 0.4039216, 0, 1,
-1.473648, -0.2307487, -1.467888, 1, 0.4078431, 0, 1,
-1.472884, 1.414694, 0.03180579, 1, 0.4156863, 0, 1,
-1.448963, -0.3005356, -1.84708, 1, 0.4196078, 0, 1,
-1.439658, 0.1444809, -1.659526, 1, 0.427451, 0, 1,
-1.420418, -1.310065, -2.275636, 1, 0.4313726, 0, 1,
-1.393325, -0.1448545, -2.029006, 1, 0.4392157, 0, 1,
-1.383651, 0.8522151, -1.461735, 1, 0.4431373, 0, 1,
-1.381568, 0.6047694, -1.069469, 1, 0.4509804, 0, 1,
-1.380875, -0.5564503, -1.572486, 1, 0.454902, 0, 1,
-1.366314, -0.6213143, -1.922624, 1, 0.4627451, 0, 1,
-1.366171, -0.1778156, -1.635117, 1, 0.4666667, 0, 1,
-1.362486, 2.6183, -2.473485, 1, 0.4745098, 0, 1,
-1.361991, -0.5678819, -2.612332, 1, 0.4784314, 0, 1,
-1.35803, -0.9596475, -3.046678, 1, 0.4862745, 0, 1,
-1.345801, 1.538888, -1.826838, 1, 0.4901961, 0, 1,
-1.336419, -1.043328, -3.444951, 1, 0.4980392, 0, 1,
-1.334324, -0.6104367, -1.528447, 1, 0.5058824, 0, 1,
-1.316831, -0.5806297, -1.589841, 1, 0.509804, 0, 1,
-1.316115, 0.1539263, -0.5995944, 1, 0.5176471, 0, 1,
-1.311387, 0.586805, -0.2087095, 1, 0.5215687, 0, 1,
-1.29343, -0.2706189, -0.5951064, 1, 0.5294118, 0, 1,
-1.287778, 0.3066396, -1.349921, 1, 0.5333334, 0, 1,
-1.278473, 1.083961, -0.1061545, 1, 0.5411765, 0, 1,
-1.275696, 2.400771, -1.605629, 1, 0.5450981, 0, 1,
-1.272976, 0.304183, -0.9335892, 1, 0.5529412, 0, 1,
-1.269454, 0.6478807, -1.767907, 1, 0.5568628, 0, 1,
-1.260578, 1.343959, -0.9240177, 1, 0.5647059, 0, 1,
-1.260044, 0.3426445, -1.494286, 1, 0.5686275, 0, 1,
-1.248038, 0.0427869, -2.797488, 1, 0.5764706, 0, 1,
-1.247684, -0.8209625, -1.650902, 1, 0.5803922, 0, 1,
-1.244417, 0.4845006, -2.844709, 1, 0.5882353, 0, 1,
-1.236454, -0.1887314, -2.223093, 1, 0.5921569, 0, 1,
-1.232749, -0.1205347, -0.6719293, 1, 0.6, 0, 1,
-1.230751, -0.2512895, -3.067326, 1, 0.6078432, 0, 1,
-1.227215, 0.8257006, -0.3866512, 1, 0.6117647, 0, 1,
-1.216716, 1.488089, -2.169478, 1, 0.6196079, 0, 1,
-1.212924, -0.6200275, -3.875227, 1, 0.6235294, 0, 1,
-1.211538, -1.091772, -1.072859, 1, 0.6313726, 0, 1,
-1.207206, -0.07256953, -3.33931, 1, 0.6352941, 0, 1,
-1.202569, -0.6474149, -1.165531, 1, 0.6431373, 0, 1,
-1.197694, -0.4055325, 0.2149959, 1, 0.6470588, 0, 1,
-1.195212, -0.3323307, -1.571434, 1, 0.654902, 0, 1,
-1.194566, -0.1183561, -1.319424, 1, 0.6588235, 0, 1,
-1.193243, -1.306123, -2.229211, 1, 0.6666667, 0, 1,
-1.189311, 1.700828, -1.973807, 1, 0.6705883, 0, 1,
-1.178421, -0.5073547, -0.3231747, 1, 0.6784314, 0, 1,
-1.168332, 0.5865968, -3.025896, 1, 0.682353, 0, 1,
-1.158717, 0.8216975, -1.120094, 1, 0.6901961, 0, 1,
-1.153343, 0.08382136, -2.321772, 1, 0.6941177, 0, 1,
-1.149236, 0.7791848, -2.538844, 1, 0.7019608, 0, 1,
-1.149232, 0.8897375, -2.174493, 1, 0.7098039, 0, 1,
-1.14723, 1.026558, -0.2207313, 1, 0.7137255, 0, 1,
-1.139276, -1.408037, -2.343086, 1, 0.7215686, 0, 1,
-1.136061, 0.5563314, -2.318031, 1, 0.7254902, 0, 1,
-1.135815, -1.747223, -2.360271, 1, 0.7333333, 0, 1,
-1.127561, -0.7374219, -2.533669, 1, 0.7372549, 0, 1,
-1.12035, -0.1162582, -0.4803407, 1, 0.7450981, 0, 1,
-1.095268, -1.16748, -3.167832, 1, 0.7490196, 0, 1,
-1.095105, -0.2177003, -2.170396, 1, 0.7568628, 0, 1,
-1.094356, -0.04124, -0.9640079, 1, 0.7607843, 0, 1,
-1.093915, -0.5713803, -0.9679574, 1, 0.7686275, 0, 1,
-1.091236, -1.562966, -2.896686, 1, 0.772549, 0, 1,
-1.08509, -1.712041, -2.4328, 1, 0.7803922, 0, 1,
-1.077904, -0.5710018, -3.551808, 1, 0.7843137, 0, 1,
-1.07608, 0.1723578, -3.10258, 1, 0.7921569, 0, 1,
-1.073665, 0.6519839, -1.575118, 1, 0.7960784, 0, 1,
-1.073505, -1.418625, -1.790445, 1, 0.8039216, 0, 1,
-1.07101, 0.465046, -0.6018323, 1, 0.8117647, 0, 1,
-1.065109, -0.4750557, -1.784528, 1, 0.8156863, 0, 1,
-1.064617, 1.570713, -0.7355576, 1, 0.8235294, 0, 1,
-1.054792, -0.2309833, -4.384045, 1, 0.827451, 0, 1,
-1.050489, -0.4355465, -2.177001, 1, 0.8352941, 0, 1,
-1.045363, -0.5368581, -2.579515, 1, 0.8392157, 0, 1,
-1.044513, 0.4680706, 1.416129, 1, 0.8470588, 0, 1,
-1.039724, -0.09448981, -1.711367, 1, 0.8509804, 0, 1,
-1.038552, 1.48403, -0.1621025, 1, 0.8588235, 0, 1,
-1.03845, -1.033912, -2.686514, 1, 0.8627451, 0, 1,
-1.037865, 0.3659005, -2.800382, 1, 0.8705882, 0, 1,
-1.029741, 0.2582249, -0.3616355, 1, 0.8745098, 0, 1,
-1.029668, 0.9004738, -0.4043832, 1, 0.8823529, 0, 1,
-1.023752, -0.6616797, -1.643054, 1, 0.8862745, 0, 1,
-1.020937, 0.245009, -1.775936, 1, 0.8941177, 0, 1,
-1.00826, 0.4012022, -1.113797, 1, 0.8980392, 0, 1,
-1.00826, 1.008196, -2.105696, 1, 0.9058824, 0, 1,
-1.001673, 0.5632472, -0.4133436, 1, 0.9137255, 0, 1,
-0.9973763, 0.9750311, 0.6194485, 1, 0.9176471, 0, 1,
-0.993134, 0.9601891, -0.5166258, 1, 0.9254902, 0, 1,
-0.9881636, 0.861369, -0.3608725, 1, 0.9294118, 0, 1,
-0.9861414, 0.3203328, -2.300089, 1, 0.9372549, 0, 1,
-0.979933, -1.109709, -3.094173, 1, 0.9411765, 0, 1,
-0.9759151, 0.4020095, 0.1328112, 1, 0.9490196, 0, 1,
-0.9735427, -1.058992, -2.877317, 1, 0.9529412, 0, 1,
-0.9703232, 0.7186343, -1.193212, 1, 0.9607843, 0, 1,
-0.9677336, -0.1971817, -2.352207, 1, 0.9647059, 0, 1,
-0.9649099, 1.149094, 0.6740751, 1, 0.972549, 0, 1,
-0.9612736, -0.3940086, -2.578212, 1, 0.9764706, 0, 1,
-0.9597486, -0.5277193, -1.664036, 1, 0.9843137, 0, 1,
-0.9578098, 0.2272977, -1.748775, 1, 0.9882353, 0, 1,
-0.9568561, -0.2032751, -1.45785, 1, 0.9960784, 0, 1,
-0.9440262, 0.9297153, 0.06644664, 0.9960784, 1, 0, 1,
-0.9416373, -0.2285685, -1.206897, 0.9921569, 1, 0, 1,
-0.9409057, 1.744461, -2.786487, 0.9843137, 1, 0, 1,
-0.9381315, -0.2236618, -0.2886843, 0.9803922, 1, 0, 1,
-0.9343446, 0.3205473, -1.489282, 0.972549, 1, 0, 1,
-0.9301743, 0.01672849, -2.45397, 0.9686275, 1, 0, 1,
-0.9290043, -0.4121765, -0.4457863, 0.9607843, 1, 0, 1,
-0.9267037, 0.4709727, -2.618001, 0.9568627, 1, 0, 1,
-0.9265753, -0.6082727, -2.123808, 0.9490196, 1, 0, 1,
-0.9252097, -1.557358, -3.066231, 0.945098, 1, 0, 1,
-0.9143987, 1.604997, 0.3497713, 0.9372549, 1, 0, 1,
-0.9072601, 0.808046, -1.684023, 0.9333333, 1, 0, 1,
-0.9060991, 2.056148, -0.8015966, 0.9254902, 1, 0, 1,
-0.9059875, 1.032729, 1.056675, 0.9215686, 1, 0, 1,
-0.9010199, -0.8741482, -2.690097, 0.9137255, 1, 0, 1,
-0.9004293, 0.3510771, -2.826298, 0.9098039, 1, 0, 1,
-0.8958206, 1.353179, -0.7578301, 0.9019608, 1, 0, 1,
-0.8948758, 0.6056947, -0.317816, 0.8941177, 1, 0, 1,
-0.89191, -1.689562, -3.803017, 0.8901961, 1, 0, 1,
-0.8886864, 1.541433, -1.212806, 0.8823529, 1, 0, 1,
-0.8880023, -0.01890396, -2.09931, 0.8784314, 1, 0, 1,
-0.8799342, 0.04600859, -0.8982034, 0.8705882, 1, 0, 1,
-0.8797576, -1.749849, -1.667548, 0.8666667, 1, 0, 1,
-0.8754017, -0.2438579, -1.669761, 0.8588235, 1, 0, 1,
-0.8745868, 0.08876447, -2.281031, 0.854902, 1, 0, 1,
-0.8670607, -0.4892896, -3.246282, 0.8470588, 1, 0, 1,
-0.865887, 1.572494, 0.1901578, 0.8431373, 1, 0, 1,
-0.8639871, -0.4198643, -1.849815, 0.8352941, 1, 0, 1,
-0.8631102, -0.8564581, -3.119015, 0.8313726, 1, 0, 1,
-0.8600994, 0.6376789, 0.09062053, 0.8235294, 1, 0, 1,
-0.8509721, 0.0936638, -1.084421, 0.8196079, 1, 0, 1,
-0.8452955, -0.06068559, -1.887309, 0.8117647, 1, 0, 1,
-0.8392869, 1.424977, -2.219873, 0.8078431, 1, 0, 1,
-0.8377138, 1.252586, -0.8975037, 0.8, 1, 0, 1,
-0.8360967, -1.544185, -2.591423, 0.7921569, 1, 0, 1,
-0.8345309, -1.372089, -3.74963, 0.7882353, 1, 0, 1,
-0.8292814, -0.9467362, -3.112685, 0.7803922, 1, 0, 1,
-0.8273519, 0.433946, -1.669646, 0.7764706, 1, 0, 1,
-0.8262815, -1.289067, -1.269523, 0.7686275, 1, 0, 1,
-0.8261985, -0.1813031, -1.822587, 0.7647059, 1, 0, 1,
-0.8175251, -0.9881843, -4.173565, 0.7568628, 1, 0, 1,
-0.809592, 0.6254042, -2.217878, 0.7529412, 1, 0, 1,
-0.8069856, -0.6259373, -2.952907, 0.7450981, 1, 0, 1,
-0.8062865, 0.04121821, 0.1144912, 0.7411765, 1, 0, 1,
-0.8036342, -0.4875077, -1.988882, 0.7333333, 1, 0, 1,
-0.8034976, -1.713818, -3.525942, 0.7294118, 1, 0, 1,
-0.8002194, -0.512725, -2.61076, 0.7215686, 1, 0, 1,
-0.7964106, -1.260315, -2.835958, 0.7176471, 1, 0, 1,
-0.7937803, 0.6324891, 0.1541942, 0.7098039, 1, 0, 1,
-0.7883188, -0.2900172, -3.898478, 0.7058824, 1, 0, 1,
-0.7861463, 0.07371892, -1.542992, 0.6980392, 1, 0, 1,
-0.7833305, 0.5494215, -0.9468517, 0.6901961, 1, 0, 1,
-0.7783538, -1.140051, -2.913348, 0.6862745, 1, 0, 1,
-0.7773652, 0.3153465, -1.50127, 0.6784314, 1, 0, 1,
-0.7740852, -0.414102, -1.859735, 0.6745098, 1, 0, 1,
-0.7732728, -0.02099952, -1.045674, 0.6666667, 1, 0, 1,
-0.7685235, 0.2610747, -1.07447, 0.6627451, 1, 0, 1,
-0.7681434, 1.778411, 0.7963456, 0.654902, 1, 0, 1,
-0.7661239, 0.04107508, -2.11544, 0.6509804, 1, 0, 1,
-0.765276, -1.470874, -2.870731, 0.6431373, 1, 0, 1,
-0.7648158, 0.5611882, 0.4625748, 0.6392157, 1, 0, 1,
-0.7511843, -1.85192, -2.194487, 0.6313726, 1, 0, 1,
-0.7377444, -0.330287, -0.2996942, 0.627451, 1, 0, 1,
-0.7375608, -0.3161998, -2.914787, 0.6196079, 1, 0, 1,
-0.7350038, -0.2530408, -0.4217662, 0.6156863, 1, 0, 1,
-0.7349481, -0.1138232, -1.056011, 0.6078432, 1, 0, 1,
-0.7318975, -0.08751281, -2.162878, 0.6039216, 1, 0, 1,
-0.7231988, 1.364045, -1.105361, 0.5960785, 1, 0, 1,
-0.723139, -0.3255085, -2.691379, 0.5882353, 1, 0, 1,
-0.7228732, 1.626477, 0.3835815, 0.5843138, 1, 0, 1,
-0.7225848, -2.399718, -3.572432, 0.5764706, 1, 0, 1,
-0.7190366, 0.349271, -0.1247651, 0.572549, 1, 0, 1,
-0.7136771, -0.2767546, -0.8320712, 0.5647059, 1, 0, 1,
-0.7087058, -1.426084, -2.887616, 0.5607843, 1, 0, 1,
-0.7024216, 0.2087689, -2.368652, 0.5529412, 1, 0, 1,
-0.6985929, 0.1538646, -2.772598, 0.5490196, 1, 0, 1,
-0.6968712, -1.543868, -2.3241, 0.5411765, 1, 0, 1,
-0.6944881, 1.729662, 0.9364279, 0.5372549, 1, 0, 1,
-0.687592, -1.190587, -2.425234, 0.5294118, 1, 0, 1,
-0.6805511, -1.930908, -3.293756, 0.5254902, 1, 0, 1,
-0.6787648, -1.218405, -0.9507179, 0.5176471, 1, 0, 1,
-0.6737182, 0.2611728, 1.274562, 0.5137255, 1, 0, 1,
-0.6720001, 2.551077, 0.3152604, 0.5058824, 1, 0, 1,
-0.6674252, -1.424035, -2.947005, 0.5019608, 1, 0, 1,
-0.6671901, -0.2177047, -1.185992, 0.4941176, 1, 0, 1,
-0.6658023, -0.869961, -4.228921, 0.4862745, 1, 0, 1,
-0.6605052, 1.001666, 1.134677, 0.4823529, 1, 0, 1,
-0.6580843, -0.6366626, -2.657329, 0.4745098, 1, 0, 1,
-0.6478143, -0.3110531, -2.509536, 0.4705882, 1, 0, 1,
-0.645338, 1.826232, 1.985835, 0.4627451, 1, 0, 1,
-0.6439971, -0.252989, -0.8034828, 0.4588235, 1, 0, 1,
-0.6419226, -0.2967646, -2.045165, 0.4509804, 1, 0, 1,
-0.6414042, 0.7886401, -1.019972, 0.4470588, 1, 0, 1,
-0.6409106, 0.4685767, -1.219232, 0.4392157, 1, 0, 1,
-0.6362908, 0.7129816, 0.5808625, 0.4352941, 1, 0, 1,
-0.6304799, 0.9849638, -0.1327086, 0.427451, 1, 0, 1,
-0.6278176, -1.015242, -2.814756, 0.4235294, 1, 0, 1,
-0.6246444, 2.162388, -1.696455, 0.4156863, 1, 0, 1,
-0.6221645, 0.1034494, -1.641001, 0.4117647, 1, 0, 1,
-0.6203107, 0.46989, -2.002287, 0.4039216, 1, 0, 1,
-0.6193123, -0.3013264, -1.0713, 0.3960784, 1, 0, 1,
-0.6183905, -1.076788, -1.306106, 0.3921569, 1, 0, 1,
-0.614306, -0.07290744, -2.820168, 0.3843137, 1, 0, 1,
-0.604627, 0.7012979, -1.508274, 0.3803922, 1, 0, 1,
-0.6018254, 0.5436906, -3.200797, 0.372549, 1, 0, 1,
-0.5999769, 2.192862, -0.510376, 0.3686275, 1, 0, 1,
-0.5986527, 0.07582925, -1.796962, 0.3607843, 1, 0, 1,
-0.5968971, 1.362635, -0.5411708, 0.3568628, 1, 0, 1,
-0.5920795, 1.506337, -1.330026, 0.3490196, 1, 0, 1,
-0.5920619, -0.7699671, -3.562089, 0.345098, 1, 0, 1,
-0.5909415, -0.3045906, -0.5459888, 0.3372549, 1, 0, 1,
-0.5908462, 0.2066702, -2.568741, 0.3333333, 1, 0, 1,
-0.5884196, 0.8048627, 0.8467254, 0.3254902, 1, 0, 1,
-0.5858297, 1.334156, -0.02081217, 0.3215686, 1, 0, 1,
-0.5802163, -0.1045919, -0.0430567, 0.3137255, 1, 0, 1,
-0.5799106, 0.1232643, -0.7908424, 0.3098039, 1, 0, 1,
-0.5765237, -0.042384, -2.626715, 0.3019608, 1, 0, 1,
-0.5737939, -0.01245803, -2.098685, 0.2941177, 1, 0, 1,
-0.5723952, 0.7852686, -1.23472, 0.2901961, 1, 0, 1,
-0.5717615, 0.05919107, -1.445988, 0.282353, 1, 0, 1,
-0.5716814, -0.3443518, -3.403488, 0.2784314, 1, 0, 1,
-0.5680946, -0.1469064, -2.700412, 0.2705882, 1, 0, 1,
-0.5666183, 0.1377992, -2.625748, 0.2666667, 1, 0, 1,
-0.5654608, -1.03509, -1.346389, 0.2588235, 1, 0, 1,
-0.5644516, 0.1226203, -1.503642, 0.254902, 1, 0, 1,
-0.5642393, -0.5651348, -2.74082, 0.2470588, 1, 0, 1,
-0.5613263, -0.08375654, -2.775388, 0.2431373, 1, 0, 1,
-0.5607135, 0.0163199, -1.47229, 0.2352941, 1, 0, 1,
-0.5584805, -0.2422934, -3.904151, 0.2313726, 1, 0, 1,
-0.5539241, 0.3199734, -1.477317, 0.2235294, 1, 0, 1,
-0.5530939, 0.8708925, -2.373812, 0.2196078, 1, 0, 1,
-0.5506616, 0.8932899, -0.5575849, 0.2117647, 1, 0, 1,
-0.5499988, -1.113101, -3.62849, 0.2078431, 1, 0, 1,
-0.543861, -0.4113154, -1.860473, 0.2, 1, 0, 1,
-0.536398, 0.1718252, -1.070529, 0.1921569, 1, 0, 1,
-0.5353741, -1.085153, -3.662167, 0.1882353, 1, 0, 1,
-0.5286173, 2.13627, -0.1856225, 0.1803922, 1, 0, 1,
-0.5205761, -1.058339, -4.175866, 0.1764706, 1, 0, 1,
-0.5196424, 1.055161, 1.578332, 0.1686275, 1, 0, 1,
-0.5182331, -0.2641415, -1.339238, 0.1647059, 1, 0, 1,
-0.5174904, 0.4171487, -0.788726, 0.1568628, 1, 0, 1,
-0.5173324, 0.485114, -1.903002, 0.1529412, 1, 0, 1,
-0.5135767, 1.2263, -1.119129, 0.145098, 1, 0, 1,
-0.509433, -0.5477757, -2.151728, 0.1411765, 1, 0, 1,
-0.5056835, -2.007193, -3.458419, 0.1333333, 1, 0, 1,
-0.5035257, -0.2129267, -2.262654, 0.1294118, 1, 0, 1,
-0.5023276, -0.01632411, -0.5738422, 0.1215686, 1, 0, 1,
-0.4997319, 0.09288058, -1.46629, 0.1176471, 1, 0, 1,
-0.4976739, -0.1713999, -3.148014, 0.1098039, 1, 0, 1,
-0.4917744, -0.0509341, -1.237741, 0.1058824, 1, 0, 1,
-0.4893061, 1.414042, -0.8781294, 0.09803922, 1, 0, 1,
-0.4874443, -1.526903, -0.613373, 0.09019608, 1, 0, 1,
-0.4870251, 1.798561, 0.8537807, 0.08627451, 1, 0, 1,
-0.486044, 0.2415815, -2.324107, 0.07843138, 1, 0, 1,
-0.4837131, 0.1309041, -0.7901294, 0.07450981, 1, 0, 1,
-0.4798855, 1.842019, -0.7690803, 0.06666667, 1, 0, 1,
-0.4756463, -1.571504, -3.557438, 0.0627451, 1, 0, 1,
-0.4751199, -1.09435, -2.658043, 0.05490196, 1, 0, 1,
-0.4746568, -0.497979, -2.124012, 0.05098039, 1, 0, 1,
-0.4712605, -0.6740276, -1.904513, 0.04313726, 1, 0, 1,
-0.4701206, -0.610697, -0.8425094, 0.03921569, 1, 0, 1,
-0.4654895, 0.1197424, -0.5235343, 0.03137255, 1, 0, 1,
-0.4650502, -0.9842065, -1.169094, 0.02745098, 1, 0, 1,
-0.4603561, 1.582303, -0.3715191, 0.01960784, 1, 0, 1,
-0.4548758, 0.6736199, -2.742673, 0.01568628, 1, 0, 1,
-0.454664, -0.05217944, -1.5302, 0.007843138, 1, 0, 1,
-0.4525039, -0.9479135, -4.964985, 0.003921569, 1, 0, 1,
-0.45191, 1.26197, -0.371849, 0, 1, 0.003921569, 1,
-0.4493695, -1.39415, -3.101976, 0, 1, 0.01176471, 1,
-0.4487497, -1.424792, -1.433211, 0, 1, 0.01568628, 1,
-0.4440235, -0.6908193, -0.8331333, 0, 1, 0.02352941, 1,
-0.4435381, 1.070029, -3.086272, 0, 1, 0.02745098, 1,
-0.4421325, 0.1179844, -2.724929, 0, 1, 0.03529412, 1,
-0.4370661, 0.2788876, -0.6594073, 0, 1, 0.03921569, 1,
-0.4317986, 0.2165823, -3.184409, 0, 1, 0.04705882, 1,
-0.4285097, 3.035078, -0.7130691, 0, 1, 0.05098039, 1,
-0.4188764, 0.756711, -0.5016487, 0, 1, 0.05882353, 1,
-0.4144258, -0.3883635, -2.469717, 0, 1, 0.0627451, 1,
-0.4143679, 0.722966, 1.710238, 0, 1, 0.07058824, 1,
-0.4131499, 0.5593555, 0.6013805, 0, 1, 0.07450981, 1,
-0.4032442, 0.6663049, 0.9148396, 0, 1, 0.08235294, 1,
-0.3965763, 0.5192783, -0.8402556, 0, 1, 0.08627451, 1,
-0.3932779, -0.7604967, -3.225804, 0, 1, 0.09411765, 1,
-0.3899621, -0.5889034, -3.184495, 0, 1, 0.1019608, 1,
-0.3849297, -0.3471296, -2.497711, 0, 1, 0.1058824, 1,
-0.3831058, 1.844171, 1.25435, 0, 1, 0.1137255, 1,
-0.3808868, -0.5572507, -2.605442, 0, 1, 0.1176471, 1,
-0.3804094, -1.189719, -2.008473, 0, 1, 0.1254902, 1,
-0.3680737, 0.01952502, -1.589741, 0, 1, 0.1294118, 1,
-0.3678046, -0.4459794, -3.883399, 0, 1, 0.1372549, 1,
-0.3649546, 1.318523, 0.5094204, 0, 1, 0.1411765, 1,
-0.3630419, 0.07174873, -2.015115, 0, 1, 0.1490196, 1,
-0.3591469, -0.258901, -1.766237, 0, 1, 0.1529412, 1,
-0.3561737, -0.2116276, -1.624203, 0, 1, 0.1607843, 1,
-0.3560562, -0.66235, -5.358334, 0, 1, 0.1647059, 1,
-0.3530883, -1.93267, -3.155084, 0, 1, 0.172549, 1,
-0.3527847, 1.455802, 0.5175788, 0, 1, 0.1764706, 1,
-0.3509418, -0.5713052, -2.123036, 0, 1, 0.1843137, 1,
-0.346437, 0.1375782, -2.604569, 0, 1, 0.1882353, 1,
-0.3436752, -0.3401455, -1.91731, 0, 1, 0.1960784, 1,
-0.3422656, 0.2426945, -1.680687, 0, 1, 0.2039216, 1,
-0.3396285, -1.203433, -1.853884, 0, 1, 0.2078431, 1,
-0.3368936, -0.7392421, -3.216676, 0, 1, 0.2156863, 1,
-0.3368546, 0.304959, -1.002897, 0, 1, 0.2196078, 1,
-0.3362642, 0.9830722, -1.286628, 0, 1, 0.227451, 1,
-0.3317133, 1.903115, -0.8639247, 0, 1, 0.2313726, 1,
-0.3291818, -0.2666379, -1.809177, 0, 1, 0.2392157, 1,
-0.3227115, 2.017904, 1.077837, 0, 1, 0.2431373, 1,
-0.3204167, -0.2909045, -1.796237, 0, 1, 0.2509804, 1,
-0.3202208, 1.873476, -0.4525252, 0, 1, 0.254902, 1,
-0.3170983, 1.545614, -1.736355, 0, 1, 0.2627451, 1,
-0.317096, 1.364482, -0.4898592, 0, 1, 0.2666667, 1,
-0.3164174, -1.997237, -2.709481, 0, 1, 0.2745098, 1,
-0.314939, -0.2636105, -2.437009, 0, 1, 0.2784314, 1,
-0.3142214, 0.6933318, 1.142223, 0, 1, 0.2862745, 1,
-0.3131413, 0.5686827, -0.5469061, 0, 1, 0.2901961, 1,
-0.3120455, -0.9615951, -3.442183, 0, 1, 0.2980392, 1,
-0.3078848, 0.8131355, 0.9293049, 0, 1, 0.3058824, 1,
-0.3029694, -0.3103865, -2.554854, 0, 1, 0.3098039, 1,
-0.3028741, -1.116089, -2.963742, 0, 1, 0.3176471, 1,
-0.3024822, 0.7917588, -0.8246991, 0, 1, 0.3215686, 1,
-0.3019577, 0.7563105, -0.711449, 0, 1, 0.3294118, 1,
-0.2972004, -0.1763718, -2.180433, 0, 1, 0.3333333, 1,
-0.2961243, 1.113807, 2.648729, 0, 1, 0.3411765, 1,
-0.2768634, -0.3888082, -1.746124, 0, 1, 0.345098, 1,
-0.2758723, 1.772267, -2.037231, 0, 1, 0.3529412, 1,
-0.2745777, -1.091499, -1.808419, 0, 1, 0.3568628, 1,
-0.2730947, -0.03669605, -1.128428, 0, 1, 0.3647059, 1,
-0.2726214, 0.4913396, 0.4554917, 0, 1, 0.3686275, 1,
-0.2622349, 0.2107894, -1.489341, 0, 1, 0.3764706, 1,
-0.261646, -0.1944278, -2.49176, 0, 1, 0.3803922, 1,
-0.2602642, 1.966526, 0.7509665, 0, 1, 0.3882353, 1,
-0.2563838, 0.2164155, 0.4206128, 0, 1, 0.3921569, 1,
-0.2468063, 0.5374137, 0.3210873, 0, 1, 0.4, 1,
-0.2432166, -2.53552, -2.456938, 0, 1, 0.4078431, 1,
-0.2354461, -1.376693, -2.481094, 0, 1, 0.4117647, 1,
-0.232785, 0.4278503, -0.4681603, 0, 1, 0.4196078, 1,
-0.2298468, -1.463956, -4.169866, 0, 1, 0.4235294, 1,
-0.2286844, -0.2688388, -2.530191, 0, 1, 0.4313726, 1,
-0.2259942, 0.4346489, 0.6659602, 0, 1, 0.4352941, 1,
-0.2249669, -0.3810365, -1.831656, 0, 1, 0.4431373, 1,
-0.2116811, 0.3393806, -0.8518605, 0, 1, 0.4470588, 1,
-0.2114344, 1.285233, -0.3489015, 0, 1, 0.454902, 1,
-0.2085508, 0.3417062, 0.6740196, 0, 1, 0.4588235, 1,
-0.205955, -0.4013239, -2.854951, 0, 1, 0.4666667, 1,
-0.2007626, -1.016005, -3.19824, 0, 1, 0.4705882, 1,
-0.1987049, 0.9168438, -0.606204, 0, 1, 0.4784314, 1,
-0.1984479, -0.1160852, -3.129428, 0, 1, 0.4823529, 1,
-0.1979607, 1.210578, 1.533468, 0, 1, 0.4901961, 1,
-0.1970025, 0.08057249, -0.3972818, 0, 1, 0.4941176, 1,
-0.1946404, -1.803804, -3.629106, 0, 1, 0.5019608, 1,
-0.1905059, -0.1332635, -3.098011, 0, 1, 0.509804, 1,
-0.1899238, 0.5056935, 0.02868942, 0, 1, 0.5137255, 1,
-0.1847226, -0.8780438, -3.597592, 0, 1, 0.5215687, 1,
-0.1836953, 1.614261, -0.0136945, 0, 1, 0.5254902, 1,
-0.1833549, -0.4448766, -2.711224, 0, 1, 0.5333334, 1,
-0.1830366, -0.3389569, -4.329004, 0, 1, 0.5372549, 1,
-0.1817126, -0.3622204, -2.097651, 0, 1, 0.5450981, 1,
-0.1814906, 1.371023, 0.6948093, 0, 1, 0.5490196, 1,
-0.1810199, -1.722435, -2.780508, 0, 1, 0.5568628, 1,
-0.1731371, -0.298813, -3.853698, 0, 1, 0.5607843, 1,
-0.1696721, -0.02647159, -0.7545508, 0, 1, 0.5686275, 1,
-0.1660599, -1.072908, -2.898225, 0, 1, 0.572549, 1,
-0.1647055, -0.552676, -3.513148, 0, 1, 0.5803922, 1,
-0.1639624, -0.8266918, -3.538055, 0, 1, 0.5843138, 1,
-0.1575188, 1.333489, -1.053512, 0, 1, 0.5921569, 1,
-0.1539648, -0.4883807, -3.098719, 0, 1, 0.5960785, 1,
-0.1515139, 0.2983078, -0.2080394, 0, 1, 0.6039216, 1,
-0.1514093, -0.1230189, -1.054435, 0, 1, 0.6117647, 1,
-0.1493562, -0.8125433, -2.156153, 0, 1, 0.6156863, 1,
-0.1472577, 0.1217098, -0.6567062, 0, 1, 0.6235294, 1,
-0.1437045, -0.1586931, -0.9812351, 0, 1, 0.627451, 1,
-0.142992, 0.01347213, 0.507683, 0, 1, 0.6352941, 1,
-0.1424675, -0.3309392, -4.077838, 0, 1, 0.6392157, 1,
-0.1417783, 0.1876691, 0.5745647, 0, 1, 0.6470588, 1,
-0.1361718, 0.8095996, -0.1438866, 0, 1, 0.6509804, 1,
-0.1352203, -1.267935, -3.430917, 0, 1, 0.6588235, 1,
-0.1325749, -0.2490395, -2.291702, 0, 1, 0.6627451, 1,
-0.1295159, 0.5902045, -0.2011524, 0, 1, 0.6705883, 1,
-0.1261469, 0.04459531, -0.8743398, 0, 1, 0.6745098, 1,
-0.1251728, 0.7816172, 1.170696, 0, 1, 0.682353, 1,
-0.119576, -1.150489, -3.307899, 0, 1, 0.6862745, 1,
-0.1166102, -0.7018598, -2.754104, 0, 1, 0.6941177, 1,
-0.1151055, 2.128047, -0.772743, 0, 1, 0.7019608, 1,
-0.1122931, 0.3034485, 1.503242, 0, 1, 0.7058824, 1,
-0.107731, 1.175972, 0.9554612, 0, 1, 0.7137255, 1,
-0.1070887, -1.333281, -2.545557, 0, 1, 0.7176471, 1,
-0.1065561, 0.9222162, 0.2340351, 0, 1, 0.7254902, 1,
-0.1052524, 0.9593096, 0.4365238, 0, 1, 0.7294118, 1,
-0.104918, -0.3716295, -4.14831, 0, 1, 0.7372549, 1,
-0.09787033, -1.974772, -1.840365, 0, 1, 0.7411765, 1,
-0.09729487, -0.2297475, -2.146244, 0, 1, 0.7490196, 1,
-0.09609725, 2.264375, -0.6224097, 0, 1, 0.7529412, 1,
-0.09117951, -0.5436077, -5.11578, 0, 1, 0.7607843, 1,
-0.09070524, 0.4637806, 0.6073687, 0, 1, 0.7647059, 1,
-0.08970855, -0.03010558, -2.801691, 0, 1, 0.772549, 1,
-0.08800282, -1.467714, -3.791677, 0, 1, 0.7764706, 1,
-0.08637659, -0.5785155, -2.361086, 0, 1, 0.7843137, 1,
-0.08385275, 0.2945979, -0.02244347, 0, 1, 0.7882353, 1,
-0.08212756, 0.3726031, -1.458174, 0, 1, 0.7960784, 1,
-0.07885433, -0.4431176, -2.755426, 0, 1, 0.8039216, 1,
-0.07445667, -0.462686, -3.68896, 0, 1, 0.8078431, 1,
-0.07072939, -0.403594, -1.632581, 0, 1, 0.8156863, 1,
-0.06948989, -0.778626, -1.417156, 0, 1, 0.8196079, 1,
-0.0690404, 1.575223, -0.7406942, 0, 1, 0.827451, 1,
-0.06888361, 0.001245426, -1.241117, 0, 1, 0.8313726, 1,
-0.06820629, 0.1694658, 0.6080977, 0, 1, 0.8392157, 1,
-0.06576274, -0.4293168, -2.59098, 0, 1, 0.8431373, 1,
-0.06352051, 0.4661753, 0.4701641, 0, 1, 0.8509804, 1,
-0.06167466, -0.07948182, -3.002065, 0, 1, 0.854902, 1,
-0.06146752, 0.1108676, 0.5445655, 0, 1, 0.8627451, 1,
-0.05793623, 0.6985942, 1.054729, 0, 1, 0.8666667, 1,
-0.05257001, 1.525468, -0.1770874, 0, 1, 0.8745098, 1,
-0.05242393, 1.00609, -0.03992269, 0, 1, 0.8784314, 1,
-0.05206442, 0.08267297, -1.29576, 0, 1, 0.8862745, 1,
-0.04893347, -0.6814404, -3.204921, 0, 1, 0.8901961, 1,
-0.04829919, -0.1515866, -2.078042, 0, 1, 0.8980392, 1,
-0.03868947, -1.286717, -2.306959, 0, 1, 0.9058824, 1,
-0.03686943, 0.3219116, 0.1062683, 0, 1, 0.9098039, 1,
-0.03049796, 0.2209848, 1.219074, 0, 1, 0.9176471, 1,
-0.02745052, -0.3513061, -3.398618, 0, 1, 0.9215686, 1,
-0.02534913, -0.2173763, -3.78554, 0, 1, 0.9294118, 1,
-0.02095608, -0.8676587, -3.738715, 0, 1, 0.9333333, 1,
-0.01982466, 0.5141088, -0.8898991, 0, 1, 0.9411765, 1,
-0.01787125, -1.118049, -2.705159, 0, 1, 0.945098, 1,
-0.01670355, -0.8252419, -4.208506, 0, 1, 0.9529412, 1,
-0.01646367, -0.4296747, -4.201702, 0, 1, 0.9568627, 1,
-0.01128844, 0.8963407, -0.1532661, 0, 1, 0.9647059, 1,
-0.008146411, -0.5358073, -2.340431, 0, 1, 0.9686275, 1,
-0.006680137, -0.0683834, -1.983363, 0, 1, 0.9764706, 1,
-0.006564633, 2.115672, 0.344828, 0, 1, 0.9803922, 1,
-0.004973584, -1.573402, -3.862741, 0, 1, 0.9882353, 1,
-0.0009933376, 1.141524, -0.4426483, 0, 1, 0.9921569, 1,
0.002802039, 1.307454, 0.798894, 0, 1, 1, 1,
0.005952074, -1.742442, 3.570755, 0, 0.9921569, 1, 1,
0.00769182, 0.2810538, -1.208194, 0, 0.9882353, 1, 1,
0.008301511, 0.7341806, 0.2552094, 0, 0.9803922, 1, 1,
0.01176927, 0.5415666, -1.029734, 0, 0.9764706, 1, 1,
0.01247754, -0.7793401, 4.407037, 0, 0.9686275, 1, 1,
0.01421613, -0.8076209, 4.548525, 0, 0.9647059, 1, 1,
0.01746125, -2.296531, 0.8988276, 0, 0.9568627, 1, 1,
0.02093722, -0.2553311, 3.638729, 0, 0.9529412, 1, 1,
0.02339695, 0.6760418, -0.5052739, 0, 0.945098, 1, 1,
0.02504142, 0.5933126, -1.856047, 0, 0.9411765, 1, 1,
0.03392158, -0.6252942, 4.025227, 0, 0.9333333, 1, 1,
0.0408181, -1.08188, 1.509058, 0, 0.9294118, 1, 1,
0.04125731, -1.071671, 2.207661, 0, 0.9215686, 1, 1,
0.04639532, -1.091866, 2.636954, 0, 0.9176471, 1, 1,
0.04755977, -0.8607273, 5.147729, 0, 0.9098039, 1, 1,
0.05363845, -0.5577796, 4.324049, 0, 0.9058824, 1, 1,
0.05991534, -1.278847, 3.94394, 0, 0.8980392, 1, 1,
0.06212775, 0.6424744, 0.5416555, 0, 0.8901961, 1, 1,
0.06439957, 0.3564366, 1.038791, 0, 0.8862745, 1, 1,
0.06537407, 1.607247, 0.5113468, 0, 0.8784314, 1, 1,
0.06566681, -0.8033467, 3.750809, 0, 0.8745098, 1, 1,
0.06725431, -0.1468029, 3.322496, 0, 0.8666667, 1, 1,
0.07079878, 0.2836185, -1.821221, 0, 0.8627451, 1, 1,
0.07434479, 0.5160376, -0.0980416, 0, 0.854902, 1, 1,
0.08174413, 0.7337634, -0.2068726, 0, 0.8509804, 1, 1,
0.08201171, -0.07025541, 2.146543, 0, 0.8431373, 1, 1,
0.08478318, 2.106868, 1.423085, 0, 0.8392157, 1, 1,
0.090113, 1.712988, -0.01566396, 0, 0.8313726, 1, 1,
0.09607752, 0.1306311, 1.072724, 0, 0.827451, 1, 1,
0.09676646, 1.871422, -0.1336453, 0, 0.8196079, 1, 1,
0.0968595, -0.856877, 1.248909, 0, 0.8156863, 1, 1,
0.09701166, -0.5379189, 4.26737, 0, 0.8078431, 1, 1,
0.09843496, -0.8530046, 2.064498, 0, 0.8039216, 1, 1,
0.1030154, 1.070922, 0.9348958, 0, 0.7960784, 1, 1,
0.1080071, 1.22332, -0.5065719, 0, 0.7882353, 1, 1,
0.1100833, 1.599608, 0.1049781, 0, 0.7843137, 1, 1,
0.1117665, -0.7494684, 2.931057, 0, 0.7764706, 1, 1,
0.1144686, 0.9658712, 0.5877189, 0, 0.772549, 1, 1,
0.1156301, 1.501283, 0.7259188, 0, 0.7647059, 1, 1,
0.118577, -3.422917, 4.239036, 0, 0.7607843, 1, 1,
0.118843, 1.672018, -0.4944793, 0, 0.7529412, 1, 1,
0.1224299, -1.5855, 3.248636, 0, 0.7490196, 1, 1,
0.1304321, -0.9758183, 3.497964, 0, 0.7411765, 1, 1,
0.1330891, 1.426201, -0.5002853, 0, 0.7372549, 1, 1,
0.1351596, -0.2213697, 1.824316, 0, 0.7294118, 1, 1,
0.1390916, -0.3163357, 1.551767, 0, 0.7254902, 1, 1,
0.1392676, 0.3671771, 0.1332938, 0, 0.7176471, 1, 1,
0.1401381, 0.06630763, 1.737291, 0, 0.7137255, 1, 1,
0.1410332, -1.48381, 2.110241, 0, 0.7058824, 1, 1,
0.1415831, -1.21149, 1.98371, 0, 0.6980392, 1, 1,
0.1432237, -0.5407685, 1.497554, 0, 0.6941177, 1, 1,
0.1564558, -0.344381, 4.359113, 0, 0.6862745, 1, 1,
0.1581682, -2.004097, 1.694234, 0, 0.682353, 1, 1,
0.1581698, 0.4960183, 0.6742792, 0, 0.6745098, 1, 1,
0.1601321, -0.2316573, 1.585159, 0, 0.6705883, 1, 1,
0.1619917, 0.9115264, 1.504651, 0, 0.6627451, 1, 1,
0.1715772, 0.7414957, -1.352549, 0, 0.6588235, 1, 1,
0.1719843, -0.9732096, 1.812614, 0, 0.6509804, 1, 1,
0.1725573, 1.005312, -1.198047, 0, 0.6470588, 1, 1,
0.1727615, -1.052757, 3.500153, 0, 0.6392157, 1, 1,
0.1744801, -0.6583689, 2.569137, 0, 0.6352941, 1, 1,
0.1811987, -1.137054, 2.64375, 0, 0.627451, 1, 1,
0.1825907, 1.43005, 0.6751593, 0, 0.6235294, 1, 1,
0.1829257, 1.138168, 0.7350931, 0, 0.6156863, 1, 1,
0.1834594, 0.588423, 0.1643625, 0, 0.6117647, 1, 1,
0.18487, 1.066797, 1.990785, 0, 0.6039216, 1, 1,
0.1878503, -1.288254, 3.788073, 0, 0.5960785, 1, 1,
0.1888741, -1.105386, 1.520322, 0, 0.5921569, 1, 1,
0.1891426, 0.513558, 0.6433938, 0, 0.5843138, 1, 1,
0.1900972, 0.9658488, -0.2141224, 0, 0.5803922, 1, 1,
0.1902156, -1.865474, 4.298132, 0, 0.572549, 1, 1,
0.1931561, -0.6338876, 1.393476, 0, 0.5686275, 1, 1,
0.1992103, -1.590603, 3.283856, 0, 0.5607843, 1, 1,
0.2001356, -1.906457, 1.958896, 0, 0.5568628, 1, 1,
0.2062657, -0.236057, 1.93626, 0, 0.5490196, 1, 1,
0.2067791, -0.08597302, 3.344493, 0, 0.5450981, 1, 1,
0.2076775, -0.7180795, 2.830699, 0, 0.5372549, 1, 1,
0.2092467, 1.173174, -0.4700495, 0, 0.5333334, 1, 1,
0.2095403, -1.12099, 3.937167, 0, 0.5254902, 1, 1,
0.2153301, -0.08872852, 2.305969, 0, 0.5215687, 1, 1,
0.221511, 1.191981, 1.251255, 0, 0.5137255, 1, 1,
0.2220474, -0.935141, 2.805439, 0, 0.509804, 1, 1,
0.2287719, -0.2493918, 5.741672, 0, 0.5019608, 1, 1,
0.2319293, -0.2539808, 1.240281, 0, 0.4941176, 1, 1,
0.2341996, -0.01921561, 2.170592, 0, 0.4901961, 1, 1,
0.2385441, 0.9035683, 0.8347266, 0, 0.4823529, 1, 1,
0.2396241, -0.1767515, 1.991123, 0, 0.4784314, 1, 1,
0.2405608, -0.7216535, 3.137429, 0, 0.4705882, 1, 1,
0.2436116, 2.057977, 1.429041, 0, 0.4666667, 1, 1,
0.2440618, 0.949811, 0.09014792, 0, 0.4588235, 1, 1,
0.2456795, -1.216119, 4.12335, 0, 0.454902, 1, 1,
0.2552133, 0.8226255, -0.02592485, 0, 0.4470588, 1, 1,
0.2555167, 0.2647773, 1.391104, 0, 0.4431373, 1, 1,
0.2568034, 0.7774739, 0.4993641, 0, 0.4352941, 1, 1,
0.2571976, 1.132763, -0.1002666, 0, 0.4313726, 1, 1,
0.2586553, -1.014882, 2.888817, 0, 0.4235294, 1, 1,
0.261544, -0.3127172, 0.7835047, 0, 0.4196078, 1, 1,
0.2668166, 1.041958, -1.19603, 0, 0.4117647, 1, 1,
0.2735061, 0.2469563, 0.5758761, 0, 0.4078431, 1, 1,
0.2740787, -0.2964697, 1.85914, 0, 0.4, 1, 1,
0.2744543, -0.8531228, 2.375498, 0, 0.3921569, 1, 1,
0.2846517, 0.4177026, 1.489159, 0, 0.3882353, 1, 1,
0.2858297, -0.2884996, 2.100158, 0, 0.3803922, 1, 1,
0.2865858, 0.5164803, 0.5302491, 0, 0.3764706, 1, 1,
0.2870122, 0.02050964, 1.416389, 0, 0.3686275, 1, 1,
0.2919809, 0.3787785, 0.8993399, 0, 0.3647059, 1, 1,
0.2972012, -1.451037, 2.343036, 0, 0.3568628, 1, 1,
0.2998094, -0.8200993, 3.502146, 0, 0.3529412, 1, 1,
0.3040852, 0.07660744, 2.290289, 0, 0.345098, 1, 1,
0.3051657, 0.6211031, -1.183339, 0, 0.3411765, 1, 1,
0.3070806, 0.7178618, 0.8347055, 0, 0.3333333, 1, 1,
0.3085507, 0.3297778, 0.7009363, 0, 0.3294118, 1, 1,
0.3127683, -1.708401, 1.338716, 0, 0.3215686, 1, 1,
0.3163134, 0.6873804, 1.181855, 0, 0.3176471, 1, 1,
0.3189971, -0.6445542, 3.777193, 0, 0.3098039, 1, 1,
0.3238013, 1.233987, 0.7466852, 0, 0.3058824, 1, 1,
0.3304342, -1.124242, 5.099551, 0, 0.2980392, 1, 1,
0.3321842, -1.003331, 3.595859, 0, 0.2901961, 1, 1,
0.3329667, 0.3629567, -0.961069, 0, 0.2862745, 1, 1,
0.3337802, -0.8758729, 3.820886, 0, 0.2784314, 1, 1,
0.336022, 1.027968, 0.9399112, 0, 0.2745098, 1, 1,
0.3361492, -1.552161, 0.5815845, 0, 0.2666667, 1, 1,
0.3380468, 1.485668, 1.287526, 0, 0.2627451, 1, 1,
0.3431502, -0.8366764, 2.995241, 0, 0.254902, 1, 1,
0.3455195, 0.08897612, 1.405388, 0, 0.2509804, 1, 1,
0.346724, -0.7967646, 4.610593, 0, 0.2431373, 1, 1,
0.3572442, 0.4223983, 2.07274, 0, 0.2392157, 1, 1,
0.3612608, 0.4733825, -0.1744219, 0, 0.2313726, 1, 1,
0.362085, 1.400997, 1.586578, 0, 0.227451, 1, 1,
0.3625787, -0.6642369, 4.538063, 0, 0.2196078, 1, 1,
0.3627921, 1.49209, 0.2236623, 0, 0.2156863, 1, 1,
0.3657287, -0.3060023, 2.31364, 0, 0.2078431, 1, 1,
0.3691759, 0.4075518, 1.826553, 0, 0.2039216, 1, 1,
0.3698771, 0.1046268, 2.036907, 0, 0.1960784, 1, 1,
0.3715121, 0.1703615, 4.654371, 0, 0.1882353, 1, 1,
0.3719531, -0.6704898, 1.684206, 0, 0.1843137, 1, 1,
0.3726153, -1.09933, 3.321974, 0, 0.1764706, 1, 1,
0.3727965, 0.9613808, 0.5766423, 0, 0.172549, 1, 1,
0.3753227, 0.4355159, 0.6270109, 0, 0.1647059, 1, 1,
0.3769944, 1.484944, -0.09247307, 0, 0.1607843, 1, 1,
0.381013, -0.03498404, 3.347924, 0, 0.1529412, 1, 1,
0.3822891, 0.2168021, 0.6710785, 0, 0.1490196, 1, 1,
0.3844484, -1.346715, 2.102539, 0, 0.1411765, 1, 1,
0.3879898, 1.596997, 1.263474, 0, 0.1372549, 1, 1,
0.3898428, -0.2293548, 0.1280555, 0, 0.1294118, 1, 1,
0.392558, -0.03608243, 0.6622855, 0, 0.1254902, 1, 1,
0.3950069, 0.1416692, 1.078883, 0, 0.1176471, 1, 1,
0.398067, -0.6365051, 2.697416, 0, 0.1137255, 1, 1,
0.3984174, -1.479112, 4.364534, 0, 0.1058824, 1, 1,
0.4025007, 1.222678, 0.5376202, 0, 0.09803922, 1, 1,
0.4082862, 0.02186652, 1.04878, 0, 0.09411765, 1, 1,
0.4083682, 0.5738207, 1.801977, 0, 0.08627451, 1, 1,
0.4109069, -1.806146, -0.3841223, 0, 0.08235294, 1, 1,
0.4170997, 0.9987301, -0.1787826, 0, 0.07450981, 1, 1,
0.4226531, 0.9292908, 0.08868137, 0, 0.07058824, 1, 1,
0.4244441, 1.636731, 0.7129495, 0, 0.0627451, 1, 1,
0.4260862, -0.5579486, 2.898232, 0, 0.05882353, 1, 1,
0.4262281, -0.1261348, 1.468957, 0, 0.05098039, 1, 1,
0.4275483, -0.2440855, 1.47169, 0, 0.04705882, 1, 1,
0.4325629, -1.13553, 2.535647, 0, 0.03921569, 1, 1,
0.4357314, -0.0732695, 2.512235, 0, 0.03529412, 1, 1,
0.4374804, 1.863759, 1.597893, 0, 0.02745098, 1, 1,
0.4380509, -0.2353694, 0.9137609, 0, 0.02352941, 1, 1,
0.4391106, 0.9084746, 2.337785, 0, 0.01568628, 1, 1,
0.4396968, 0.765265, -1.179272, 0, 0.01176471, 1, 1,
0.4444594, 0.1383562, 1.048453, 0, 0.003921569, 1, 1,
0.4446585, -0.02911089, 1.057327, 0.003921569, 0, 1, 1,
0.444922, 0.4668731, 0.7976236, 0.007843138, 0, 1, 1,
0.4483106, 0.03105176, 1.900335, 0.01568628, 0, 1, 1,
0.4506279, -0.1946146, 2.549796, 0.01960784, 0, 1, 1,
0.4617924, -0.5584763, 1.621819, 0.02745098, 0, 1, 1,
0.4655734, -1.076141, 4.193037, 0.03137255, 0, 1, 1,
0.4680597, -0.8608489, 4.92762, 0.03921569, 0, 1, 1,
0.470818, -0.5843372, -0.7030898, 0.04313726, 0, 1, 1,
0.4718135, 0.8330473, -1.239318, 0.05098039, 0, 1, 1,
0.4721519, 0.8871624, -0.7466539, 0.05490196, 0, 1, 1,
0.4723579, -0.2014682, 0.5938841, 0.0627451, 0, 1, 1,
0.4725118, 0.7318991, 0.6423263, 0.06666667, 0, 1, 1,
0.4769654, 1.076291, 0.81161, 0.07450981, 0, 1, 1,
0.4786435, 1.663352, 0.3168679, 0.07843138, 0, 1, 1,
0.4821749, -2.257033, 3.860055, 0.08627451, 0, 1, 1,
0.484501, -0.9612086, 2.653976, 0.09019608, 0, 1, 1,
0.4877595, 0.1326534, 2.79117, 0.09803922, 0, 1, 1,
0.4908129, -1.456942, 3.672217, 0.1058824, 0, 1, 1,
0.4921774, 0.6352564, 1.609632, 0.1098039, 0, 1, 1,
0.4922303, -0.2481415, 4.543862, 0.1176471, 0, 1, 1,
0.493707, -0.8280419, 4.053535, 0.1215686, 0, 1, 1,
0.5025126, 0.393281, 1.227128, 0.1294118, 0, 1, 1,
0.503677, -1.024069, 3.157948, 0.1333333, 0, 1, 1,
0.5043182, -1.019957, 3.012825, 0.1411765, 0, 1, 1,
0.5057265, -1.601292, 2.477219, 0.145098, 0, 1, 1,
0.5086476, 2.573178, -0.1228922, 0.1529412, 0, 1, 1,
0.5122682, 0.8131354, 1.093684, 0.1568628, 0, 1, 1,
0.517332, 0.526798, 0.9681038, 0.1647059, 0, 1, 1,
0.5199698, -1.702532, 4.28739, 0.1686275, 0, 1, 1,
0.5213777, 0.6841989, 0.8785992, 0.1764706, 0, 1, 1,
0.5233825, 0.3455499, 1.165365, 0.1803922, 0, 1, 1,
0.5239115, 0.7112519, 0.4125114, 0.1882353, 0, 1, 1,
0.5246587, 2.218283, 0.3185661, 0.1921569, 0, 1, 1,
0.5320467, -0.4606053, 1.572495, 0.2, 0, 1, 1,
0.5347598, -1.232541, 1.519726, 0.2078431, 0, 1, 1,
0.535309, 0.06448572, 1.450089, 0.2117647, 0, 1, 1,
0.5442427, -0.907539, 2.108697, 0.2196078, 0, 1, 1,
0.5450819, -0.6554236, 4.214527, 0.2235294, 0, 1, 1,
0.5472646, -0.8494079, 3.156306, 0.2313726, 0, 1, 1,
0.5528665, 0.6149503, 2.137754, 0.2352941, 0, 1, 1,
0.5529761, 1.182056, 0.6296754, 0.2431373, 0, 1, 1,
0.5531639, -0.5655465, 1.618321, 0.2470588, 0, 1, 1,
0.5541853, -0.5630972, 3.044031, 0.254902, 0, 1, 1,
0.560815, 0.5749211, 2.129116, 0.2588235, 0, 1, 1,
0.5630844, -0.5597837, 2.421611, 0.2666667, 0, 1, 1,
0.5653864, -1.826285, 1.534479, 0.2705882, 0, 1, 1,
0.5706283, 0.5264817, 1.909492, 0.2784314, 0, 1, 1,
0.5707836, -0.9141296, 2.065351, 0.282353, 0, 1, 1,
0.5721512, -0.8213316, 3.13755, 0.2901961, 0, 1, 1,
0.5726824, 0.7858498, -0.4960935, 0.2941177, 0, 1, 1,
0.573415, 1.30625, 1.848407, 0.3019608, 0, 1, 1,
0.5747494, -0.2174388, 2.579799, 0.3098039, 0, 1, 1,
0.5761957, -1.1168, 2.527715, 0.3137255, 0, 1, 1,
0.5764073, 0.9653361, 1.479547, 0.3215686, 0, 1, 1,
0.5775196, 0.808964, 1.834579, 0.3254902, 0, 1, 1,
0.5782183, 0.05399385, 0.980561, 0.3333333, 0, 1, 1,
0.5793523, -0.1436928, 1.349716, 0.3372549, 0, 1, 1,
0.584277, -0.8449792, 1.580721, 0.345098, 0, 1, 1,
0.5862187, 1.382069, 1.851984, 0.3490196, 0, 1, 1,
0.595118, -0.01765721, 1.566121, 0.3568628, 0, 1, 1,
0.5968451, 0.2838481, -1.371801, 0.3607843, 0, 1, 1,
0.5975058, 0.08042397, 1.140043, 0.3686275, 0, 1, 1,
0.5979455, 1.357312, 1.022738, 0.372549, 0, 1, 1,
0.601153, 0.374903, 1.44491, 0.3803922, 0, 1, 1,
0.6051386, -0.4506434, 1.344633, 0.3843137, 0, 1, 1,
0.6058141, -1.228358, 1.200167, 0.3921569, 0, 1, 1,
0.6091614, -0.2317855, 2.035998, 0.3960784, 0, 1, 1,
0.611675, -1.032535, 2.349788, 0.4039216, 0, 1, 1,
0.6129309, -1.233026, 3.612903, 0.4117647, 0, 1, 1,
0.6184243, -2.127921, 3.175982, 0.4156863, 0, 1, 1,
0.6219783, -1.075491, 2.255226, 0.4235294, 0, 1, 1,
0.6361445, 1.082392, 0.2587225, 0.427451, 0, 1, 1,
0.6363664, 1.202693, 1.455191, 0.4352941, 0, 1, 1,
0.6376085, -0.9593995, 1.743015, 0.4392157, 0, 1, 1,
0.640177, 0.1162835, 2.325385, 0.4470588, 0, 1, 1,
0.6463839, -1.699804, 3.640829, 0.4509804, 0, 1, 1,
0.662277, 0.3485878, 0.290396, 0.4588235, 0, 1, 1,
0.67591, 1.940369, -0.7824703, 0.4627451, 0, 1, 1,
0.6773223, -1.292997, 1.743209, 0.4705882, 0, 1, 1,
0.6798041, -1.093414, 3.954492, 0.4745098, 0, 1, 1,
0.6821927, -1.441661, 2.330843, 0.4823529, 0, 1, 1,
0.6825723, -0.1940011, 2.058854, 0.4862745, 0, 1, 1,
0.6853475, -0.2140068, 2.925347, 0.4941176, 0, 1, 1,
0.6869564, -2.290237, 0.7813253, 0.5019608, 0, 1, 1,
0.690227, 1.071198, 1.560128, 0.5058824, 0, 1, 1,
0.6972574, 1.191455, 1.954113, 0.5137255, 0, 1, 1,
0.6975875, 0.6744825, 2.160489, 0.5176471, 0, 1, 1,
0.7006104, 2.142507, 1.555302, 0.5254902, 0, 1, 1,
0.7033418, 0.4141217, 1.265557, 0.5294118, 0, 1, 1,
0.7073863, -0.3282222, 0.7908757, 0.5372549, 0, 1, 1,
0.7113023, 0.4452178, 0.2597942, 0.5411765, 0, 1, 1,
0.7174744, 0.6106651, 0.5581533, 0.5490196, 0, 1, 1,
0.7184943, 1.205151, 1.212865, 0.5529412, 0, 1, 1,
0.7205803, 0.2514108, -1.064249, 0.5607843, 0, 1, 1,
0.7223169, 0.1828911, 1.80707, 0.5647059, 0, 1, 1,
0.7239534, 0.409833, 1.358979, 0.572549, 0, 1, 1,
0.7276794, 0.6644589, 2.38491, 0.5764706, 0, 1, 1,
0.7278507, -1.993908, 2.075335, 0.5843138, 0, 1, 1,
0.7299529, 0.7456729, 0.9732617, 0.5882353, 0, 1, 1,
0.7328005, -0.754335, 3.84285, 0.5960785, 0, 1, 1,
0.7372484, 0.3588685, 1.250625, 0.6039216, 0, 1, 1,
0.7456981, 0.1818981, 2.294897, 0.6078432, 0, 1, 1,
0.7463293, 0.9727759, -2.065249, 0.6156863, 0, 1, 1,
0.7463818, -1.463904, 1.951066, 0.6196079, 0, 1, 1,
0.7507564, 0.5036618, 1.929723, 0.627451, 0, 1, 1,
0.7520439, -1.087972, 2.188912, 0.6313726, 0, 1, 1,
0.7543228, 2.353668, 0.2521595, 0.6392157, 0, 1, 1,
0.7546372, -0.5619764, 2.192935, 0.6431373, 0, 1, 1,
0.7595058, -0.4715255, 1.429977, 0.6509804, 0, 1, 1,
0.7641533, 1.337847, -0.5827002, 0.654902, 0, 1, 1,
0.7711305, 0.6321377, -0.4487084, 0.6627451, 0, 1, 1,
0.7738154, 0.9093081, 4.438598, 0.6666667, 0, 1, 1,
0.7782928, -1.593281, 2.753049, 0.6745098, 0, 1, 1,
0.7822803, -0.2270048, 2.159242, 0.6784314, 0, 1, 1,
0.7845654, 0.8641925, 1.377079, 0.6862745, 0, 1, 1,
0.7846, -0.2211262, 1.288382, 0.6901961, 0, 1, 1,
0.78689, -0.6033589, 2.223908, 0.6980392, 0, 1, 1,
0.7903597, 0.03807612, 1.374305, 0.7058824, 0, 1, 1,
0.7915336, -1.714913, 1.254898, 0.7098039, 0, 1, 1,
0.7937636, -0.3701132, 2.123597, 0.7176471, 0, 1, 1,
0.7957113, 0.04573148, 1.922616, 0.7215686, 0, 1, 1,
0.8004499, -0.7498882, 1.755778, 0.7294118, 0, 1, 1,
0.8043705, 1.135953, 0.1991411, 0.7333333, 0, 1, 1,
0.805765, 0.2432561, 0.1896348, 0.7411765, 0, 1, 1,
0.8070995, -0.1291059, 2.403664, 0.7450981, 0, 1, 1,
0.809981, -0.3399311, 0.6532592, 0.7529412, 0, 1, 1,
0.8117723, -0.3147751, 1.981776, 0.7568628, 0, 1, 1,
0.8142924, -0.5058175, 2.31458, 0.7647059, 0, 1, 1,
0.8211315, 1.11005, -0.6057386, 0.7686275, 0, 1, 1,
0.8261974, -1.04355, 2.812554, 0.7764706, 0, 1, 1,
0.8291826, -1.567965, 3.128656, 0.7803922, 0, 1, 1,
0.8304363, -0.399206, 2.760664, 0.7882353, 0, 1, 1,
0.8345423, 0.7496071, 2.442243, 0.7921569, 0, 1, 1,
0.836686, -2.188067, 1.214744, 0.8, 0, 1, 1,
0.8397445, 0.8745885, 1.019686, 0.8078431, 0, 1, 1,
0.8430726, -0.9085982, 2.802409, 0.8117647, 0, 1, 1,
0.8455334, -0.01811055, 3.135055, 0.8196079, 0, 1, 1,
0.8456709, -0.9172522, 1.991216, 0.8235294, 0, 1, 1,
0.847067, 1.247382, 3.860825, 0.8313726, 0, 1, 1,
0.8490855, -0.5368655, 0.4832113, 0.8352941, 0, 1, 1,
0.8541793, -0.7777357, 3.35222, 0.8431373, 0, 1, 1,
0.8550759, -0.03716126, 3.097726, 0.8470588, 0, 1, 1,
0.8640867, -2.863997, 3.536035, 0.854902, 0, 1, 1,
0.8643126, -0.0134181, 4.348276, 0.8588235, 0, 1, 1,
0.8649549, 0.1059432, 2.402264, 0.8666667, 0, 1, 1,
0.8651327, -1.050393, 3.170473, 0.8705882, 0, 1, 1,
0.869315, -0.5778311, 2.190708, 0.8784314, 0, 1, 1,
0.8732262, -1.23129, 2.065574, 0.8823529, 0, 1, 1,
0.8738889, 0.9947339, -0.3884764, 0.8901961, 0, 1, 1,
0.8744953, 0.3719968, 1.454123, 0.8941177, 0, 1, 1,
0.8756042, -2.525504, 2.505152, 0.9019608, 0, 1, 1,
0.876514, -1.262836, 3.607428, 0.9098039, 0, 1, 1,
0.8832133, 0.797397, 2.320787, 0.9137255, 0, 1, 1,
0.890518, -0.889447, 1.936156, 0.9215686, 0, 1, 1,
0.8916346, -0.08020946, 2.523649, 0.9254902, 0, 1, 1,
0.8953611, -1.431387, 2.977847, 0.9333333, 0, 1, 1,
0.8954439, 0.3040774, 1.053537, 0.9372549, 0, 1, 1,
0.8970931, 0.8015796, -0.282811, 0.945098, 0, 1, 1,
0.9012585, 0.00957763, 2.324602, 0.9490196, 0, 1, 1,
0.9179609, -0.03050923, -1.132473, 0.9568627, 0, 1, 1,
0.9202061, 0.3161526, 0.9926721, 0.9607843, 0, 1, 1,
0.9212564, 0.3229748, -0.5525619, 0.9686275, 0, 1, 1,
0.9253146, -0.2640938, 1.821261, 0.972549, 0, 1, 1,
0.9309127, -0.6856149, 2.529456, 0.9803922, 0, 1, 1,
0.9353701, 1.57669, 2.0189, 0.9843137, 0, 1, 1,
0.9376746, 0.05459388, 2.911936, 0.9921569, 0, 1, 1,
0.9418843, 0.07480433, 3.494135, 0.9960784, 0, 1, 1,
0.9481212, -0.0360727, 2.636719, 1, 0, 0.9960784, 1,
0.9494015, 0.08408451, 1.914593, 1, 0, 0.9882353, 1,
0.9517196, -0.01408053, 3.124481, 1, 0, 0.9843137, 1,
0.9532241, 0.178664, 1.586625, 1, 0, 0.9764706, 1,
0.9547206, -1.966092, 2.351705, 1, 0, 0.972549, 1,
0.9548578, -0.5368688, 3.312617, 1, 0, 0.9647059, 1,
0.9558164, 0.2657247, 0.3217309, 1, 0, 0.9607843, 1,
0.9607882, 0.3692243, 1.480253, 1, 0, 0.9529412, 1,
0.9624965, 1.133337, 1.203919, 1, 0, 0.9490196, 1,
0.9854591, -0.8239184, 0.7841975, 1, 0, 0.9411765, 1,
0.987393, -1.177303, 2.952309, 1, 0, 0.9372549, 1,
0.992462, -3.07405, 2.659347, 1, 0, 0.9294118, 1,
1.001406, 0.6665279, -0.07661887, 1, 0, 0.9254902, 1,
1.001845, 1.35085, 0.9266561, 1, 0, 0.9176471, 1,
1.012228, -1.119081, 3.424417, 1, 0, 0.9137255, 1,
1.021893, -1.397405, 1.285605, 1, 0, 0.9058824, 1,
1.02337, -0.6888494, 1.854618, 1, 0, 0.9019608, 1,
1.026744, -1.411135, 3.432935, 1, 0, 0.8941177, 1,
1.037425, 0.7057772, 2.392422, 1, 0, 0.8862745, 1,
1.038864, 0.02262182, 1.067686, 1, 0, 0.8823529, 1,
1.043731, 1.207842, 1.836444, 1, 0, 0.8745098, 1,
1.046192, -1.023217, 4.067521, 1, 0, 0.8705882, 1,
1.046514, -0.8469132, 2.211085, 1, 0, 0.8627451, 1,
1.06044, -0.03343509, 0.8320469, 1, 0, 0.8588235, 1,
1.070043, -0.5300381, 3.801944, 1, 0, 0.8509804, 1,
1.071476, -0.02612993, 1.31365, 1, 0, 0.8470588, 1,
1.072936, 0.4417679, 3.376211, 1, 0, 0.8392157, 1,
1.084162, -0.6889981, 1.484697, 1, 0, 0.8352941, 1,
1.085506, -1.251918, 2.729167, 1, 0, 0.827451, 1,
1.095834, -1.742903, 4.735328, 1, 0, 0.8235294, 1,
1.100012, -0.07925049, 2.476758, 1, 0, 0.8156863, 1,
1.101377, 0.1634142, 2.890265, 1, 0, 0.8117647, 1,
1.102858, 0.01876103, 1.39201, 1, 0, 0.8039216, 1,
1.104077, 1.388279, -0.2481786, 1, 0, 0.7960784, 1,
1.104593, 2.100718, 0.6709729, 1, 0, 0.7921569, 1,
1.118008, 0.4209664, -0.06507654, 1, 0, 0.7843137, 1,
1.11882, 0.1984079, -0.0884117, 1, 0, 0.7803922, 1,
1.119392, 0.576472, 0.4079687, 1, 0, 0.772549, 1,
1.120337, 0.6600865, 1.731171, 1, 0, 0.7686275, 1,
1.130025, 1.501628, -0.9678646, 1, 0, 0.7607843, 1,
1.136433, -0.563559, 2.669511, 1, 0, 0.7568628, 1,
1.148868, 0.52427, 3.308676, 1, 0, 0.7490196, 1,
1.158728, 0.1371286, 1.865325, 1, 0, 0.7450981, 1,
1.176922, 0.2847254, -0.2015867, 1, 0, 0.7372549, 1,
1.190585, -0.5045927, 2.756485, 1, 0, 0.7333333, 1,
1.191226, -0.7770054, 0.5858045, 1, 0, 0.7254902, 1,
1.212497, 0.7756669, -1.20564, 1, 0, 0.7215686, 1,
1.216292, -0.1389217, 1.93415, 1, 0, 0.7137255, 1,
1.224506, -1.314657, 2.006411, 1, 0, 0.7098039, 1,
1.228397, -0.5649404, 1.26422, 1, 0, 0.7019608, 1,
1.230801, -0.6889349, 3.402622, 1, 0, 0.6941177, 1,
1.241448, 0.7156829, 1.030908, 1, 0, 0.6901961, 1,
1.241547, 0.4242527, -0.1049498, 1, 0, 0.682353, 1,
1.248668, 0.8087537, 2.000645, 1, 0, 0.6784314, 1,
1.255247, 1.658932, -0.1019244, 1, 0, 0.6705883, 1,
1.260467, 0.3789481, 0.5991945, 1, 0, 0.6666667, 1,
1.280971, 0.1763491, 1.564861, 1, 0, 0.6588235, 1,
1.294706, 0.7751828, -1.666335, 1, 0, 0.654902, 1,
1.297416, 0.348339, 1.365128, 1, 0, 0.6470588, 1,
1.297678, -0.5000361, 1.738762, 1, 0, 0.6431373, 1,
1.307065, 1.004009, 0.8585967, 1, 0, 0.6352941, 1,
1.307609, 0.2469206, 2.928166, 1, 0, 0.6313726, 1,
1.314956, -0.6211303, 1.872476, 1, 0, 0.6235294, 1,
1.318503, -0.2740795, -0.1901738, 1, 0, 0.6196079, 1,
1.32188, -1.961056, 1.994771, 1, 0, 0.6117647, 1,
1.326336, -0.3447937, 0.7332092, 1, 0, 0.6078432, 1,
1.327847, 1.036318, 1.347496, 1, 0, 0.6, 1,
1.329049, 0.08155739, 0.9888082, 1, 0, 0.5921569, 1,
1.330275, 0.3363504, 1.038054, 1, 0, 0.5882353, 1,
1.334289, -2.729022, 1.862859, 1, 0, 0.5803922, 1,
1.34289, -0.8032209, 1.447911, 1, 0, 0.5764706, 1,
1.345594, -1.168854, 2.819422, 1, 0, 0.5686275, 1,
1.348947, 0.1648197, 0.8762364, 1, 0, 0.5647059, 1,
1.354883, 0.8748584, 1.79445, 1, 0, 0.5568628, 1,
1.357856, -0.513348, 2.419727, 1, 0, 0.5529412, 1,
1.361219, 1.39037, -0.6076726, 1, 0, 0.5450981, 1,
1.368895, -0.8409489, 2.53463, 1, 0, 0.5411765, 1,
1.370369, 0.06534217, 0.5963316, 1, 0, 0.5333334, 1,
1.370944, -0.5327319, 2.545454, 1, 0, 0.5294118, 1,
1.379395, -1.658861, 2.048421, 1, 0, 0.5215687, 1,
1.379674, -0.494355, 1.825976, 1, 0, 0.5176471, 1,
1.386946, -1.074373, 0.9784418, 1, 0, 0.509804, 1,
1.38965, 1.041167, 2.927559, 1, 0, 0.5058824, 1,
1.392388, 0.1434758, 1.417722, 1, 0, 0.4980392, 1,
1.392918, -0.1194163, 1.835934, 1, 0, 0.4901961, 1,
1.416768, -2.324318, 4.223612, 1, 0, 0.4862745, 1,
1.418192, 0.4122643, 1.53453, 1, 0, 0.4784314, 1,
1.42202, 0.8653954, 0.8402986, 1, 0, 0.4745098, 1,
1.442256, 0.4321351, 2.330647, 1, 0, 0.4666667, 1,
1.450267, 0.5492293, -0.8894157, 1, 0, 0.4627451, 1,
1.461549, 0.5776095, 2.651317, 1, 0, 0.454902, 1,
1.471325, -0.4640393, 2.495178, 1, 0, 0.4509804, 1,
1.475094, -0.1437246, 2.62724, 1, 0, 0.4431373, 1,
1.47513, 0.2509736, 2.26568, 1, 0, 0.4392157, 1,
1.480887, 2.687228, 0.8069763, 1, 0, 0.4313726, 1,
1.4859, -0.9786392, 1.929885, 1, 0, 0.427451, 1,
1.506691, 0.9873739, 0.7175196, 1, 0, 0.4196078, 1,
1.507027, -0.4427756, 2.36105, 1, 0, 0.4156863, 1,
1.51238, -0.3249634, 0.6326959, 1, 0, 0.4078431, 1,
1.528704, 0.4511587, 2.179167, 1, 0, 0.4039216, 1,
1.535492, 1.172849, 0.3703077, 1, 0, 0.3960784, 1,
1.539233, 0.6712089, 1.106039, 1, 0, 0.3882353, 1,
1.54329, -0.8798036, 3.863964, 1, 0, 0.3843137, 1,
1.543537, -0.1761857, 1.891217, 1, 0, 0.3764706, 1,
1.545679, 0.4234816, 0.558463, 1, 0, 0.372549, 1,
1.558882, -0.4181954, 0.6888922, 1, 0, 0.3647059, 1,
1.564872, -0.6013127, 0.180982, 1, 0, 0.3607843, 1,
1.575611, -0.481903, -0.2169897, 1, 0, 0.3529412, 1,
1.597598, 1.396225, 2.595723, 1, 0, 0.3490196, 1,
1.600187, 0.3382881, -0.02489039, 1, 0, 0.3411765, 1,
1.610895, -0.5640118, 0.9869317, 1, 0, 0.3372549, 1,
1.615257, -0.9085582, 3.061055, 1, 0, 0.3294118, 1,
1.615615, 0.1837464, 1.103742, 1, 0, 0.3254902, 1,
1.616031, -1.301425, 0.8410771, 1, 0, 0.3176471, 1,
1.626363, -0.2448422, 2.579725, 1, 0, 0.3137255, 1,
1.630861, -0.09175277, 1.059415, 1, 0, 0.3058824, 1,
1.633749, 0.1297954, 1.357741, 1, 0, 0.2980392, 1,
1.648982, 0.3334935, 0.7642087, 1, 0, 0.2941177, 1,
1.650546, 0.3563699, 0.9218222, 1, 0, 0.2862745, 1,
1.66803, -0.533375, 1.086717, 1, 0, 0.282353, 1,
1.679971, 0.7835744, 3.806276, 1, 0, 0.2745098, 1,
1.68907, -0.8239908, 1.294066, 1, 0, 0.2705882, 1,
1.695606, 0.4956886, 1.365679, 1, 0, 0.2627451, 1,
1.698865, 0.1791074, 0.03199032, 1, 0, 0.2588235, 1,
1.725111, -1.21616, 3.861181, 1, 0, 0.2509804, 1,
1.731437, 0.9298586, 0.8777072, 1, 0, 0.2470588, 1,
1.734406, 1.057701, 1.976898, 1, 0, 0.2392157, 1,
1.736973, -0.03702306, 2.178082, 1, 0, 0.2352941, 1,
1.758632, -0.04068586, 0.6726468, 1, 0, 0.227451, 1,
1.772943, 0.5935984, 0.9179725, 1, 0, 0.2235294, 1,
1.772964, -0.589736, 2.408957, 1, 0, 0.2156863, 1,
1.793722, 0.8265691, 0.6086797, 1, 0, 0.2117647, 1,
1.817347, -1.714302, 2.541862, 1, 0, 0.2039216, 1,
1.8383, 0.9969424, 2.159621, 1, 0, 0.1960784, 1,
1.880891, -0.7455148, 2.9611, 1, 0, 0.1921569, 1,
1.893786, -0.9804229, 2.307954, 1, 0, 0.1843137, 1,
1.951562, 1.67845, 0.8450153, 1, 0, 0.1803922, 1,
1.951993, 1.353716, 1.957531, 1, 0, 0.172549, 1,
1.954948, 0.1529323, 3.328159, 1, 0, 0.1686275, 1,
1.960715, -0.2731306, 1.564794, 1, 0, 0.1607843, 1,
1.963513, 0.8313377, 1.106374, 1, 0, 0.1568628, 1,
1.99668, 2.128478, 1.39214, 1, 0, 0.1490196, 1,
2.008352, 1.020262, 1.115689, 1, 0, 0.145098, 1,
2.029891, 0.3821391, -0.01218975, 1, 0, 0.1372549, 1,
2.037606, -0.4389845, 0.07475704, 1, 0, 0.1333333, 1,
2.040956, 1.739014, 0.9587138, 1, 0, 0.1254902, 1,
2.061541, -0.1400485, 1.692141, 1, 0, 0.1215686, 1,
2.110388, 0.6989732, 0.6083491, 1, 0, 0.1137255, 1,
2.135927, 1.275317, 1.05594, 1, 0, 0.1098039, 1,
2.136069, 0.4201524, 0.720486, 1, 0, 0.1019608, 1,
2.143745, -0.2017899, 3.278581, 1, 0, 0.09411765, 1,
2.157475, -0.3601321, 3.59482, 1, 0, 0.09019608, 1,
2.166989, -0.8750297, 2.647949, 1, 0, 0.08235294, 1,
2.167881, 0.9160514, 0.4408468, 1, 0, 0.07843138, 1,
2.17792, -1.659207, 1.733111, 1, 0, 0.07058824, 1,
2.182356, 0.2037173, 1.541768, 1, 0, 0.06666667, 1,
2.237057, -1.87998, 1.577739, 1, 0, 0.05882353, 1,
2.266978, 0.07229061, 2.61734, 1, 0, 0.05490196, 1,
2.329463, 0.03002749, 1.837838, 1, 0, 0.04705882, 1,
2.497854, -0.3149575, 3.245771, 1, 0, 0.04313726, 1,
2.507435, 1.214896, -0.9520401, 1, 0, 0.03529412, 1,
2.59035, 0.0199082, 1.794508, 1, 0, 0.03137255, 1,
2.607147, -0.6113834, 2.807174, 1, 0, 0.02352941, 1,
2.613552, 0.8852609, -0.5141698, 1, 0, 0.01960784, 1,
2.699316, 1.509032, 1.161325, 1, 0, 0.01176471, 1,
2.937563, 1.467272, 1.778445, 1, 0, 0.007843138, 1
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
0.07027078, -4.517548, -7.239785, 0, -0.5, 0.5, 0.5,
0.07027078, -4.517548, -7.239785, 1, -0.5, 0.5, 0.5,
0.07027078, -4.517548, -7.239785, 1, 1.5, 0.5, 0.5,
0.07027078, -4.517548, -7.239785, 0, 1.5, 0.5, 0.5
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
-3.769034, -0.1939197, -7.239785, 0, -0.5, 0.5, 0.5,
-3.769034, -0.1939197, -7.239785, 1, -0.5, 0.5, 0.5,
-3.769034, -0.1939197, -7.239785, 1, 1.5, 0.5, 0.5,
-3.769034, -0.1939197, -7.239785, 0, 1.5, 0.5, 0.5
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
-3.769034, -4.517548, 0.191669, 0, -0.5, 0.5, 0.5,
-3.769034, -4.517548, 0.191669, 1, -0.5, 0.5, 0.5,
-3.769034, -4.517548, 0.191669, 1, 1.5, 0.5, 0.5,
-3.769034, -4.517548, 0.191669, 0, 1.5, 0.5, 0.5
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
-2, -3.519787, -5.524834,
2, -3.519787, -5.524834,
-2, -3.519787, -5.524834,
-2, -3.686081, -5.810659,
-1, -3.519787, -5.524834,
-1, -3.686081, -5.810659,
0, -3.519787, -5.524834,
0, -3.686081, -5.810659,
1, -3.519787, -5.524834,
1, -3.686081, -5.810659,
2, -3.519787, -5.524834,
2, -3.686081, -5.810659
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
-2, -4.018667, -6.382309, 0, -0.5, 0.5, 0.5,
-2, -4.018667, -6.382309, 1, -0.5, 0.5, 0.5,
-2, -4.018667, -6.382309, 1, 1.5, 0.5, 0.5,
-2, -4.018667, -6.382309, 0, 1.5, 0.5, 0.5,
-1, -4.018667, -6.382309, 0, -0.5, 0.5, 0.5,
-1, -4.018667, -6.382309, 1, -0.5, 0.5, 0.5,
-1, -4.018667, -6.382309, 1, 1.5, 0.5, 0.5,
-1, -4.018667, -6.382309, 0, 1.5, 0.5, 0.5,
0, -4.018667, -6.382309, 0, -0.5, 0.5, 0.5,
0, -4.018667, -6.382309, 1, -0.5, 0.5, 0.5,
0, -4.018667, -6.382309, 1, 1.5, 0.5, 0.5,
0, -4.018667, -6.382309, 0, 1.5, 0.5, 0.5,
1, -4.018667, -6.382309, 0, -0.5, 0.5, 0.5,
1, -4.018667, -6.382309, 1, -0.5, 0.5, 0.5,
1, -4.018667, -6.382309, 1, 1.5, 0.5, 0.5,
1, -4.018667, -6.382309, 0, 1.5, 0.5, 0.5,
2, -4.018667, -6.382309, 0, -0.5, 0.5, 0.5,
2, -4.018667, -6.382309, 1, -0.5, 0.5, 0.5,
2, -4.018667, -6.382309, 1, 1.5, 0.5, 0.5,
2, -4.018667, -6.382309, 0, 1.5, 0.5, 0.5
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
-2.88304, -3, -5.524834,
-2.88304, 3, -5.524834,
-2.88304, -3, -5.524834,
-3.030706, -3, -5.810659,
-2.88304, -2, -5.524834,
-3.030706, -2, -5.810659,
-2.88304, -1, -5.524834,
-3.030706, -1, -5.810659,
-2.88304, 0, -5.524834,
-3.030706, 0, -5.810659,
-2.88304, 1, -5.524834,
-3.030706, 1, -5.810659,
-2.88304, 2, -5.524834,
-3.030706, 2, -5.810659,
-2.88304, 3, -5.524834,
-3.030706, 3, -5.810659
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
-3.326037, -3, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, -3, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, -3, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, -3, -6.382309, 0, 1.5, 0.5, 0.5,
-3.326037, -2, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, -2, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, -2, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, -2, -6.382309, 0, 1.5, 0.5, 0.5,
-3.326037, -1, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, -1, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, -1, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, -1, -6.382309, 0, 1.5, 0.5, 0.5,
-3.326037, 0, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, 0, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, 0, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, 0, -6.382309, 0, 1.5, 0.5, 0.5,
-3.326037, 1, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, 1, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, 1, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, 1, -6.382309, 0, 1.5, 0.5, 0.5,
-3.326037, 2, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, 2, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, 2, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, 2, -6.382309, 0, 1.5, 0.5, 0.5,
-3.326037, 3, -6.382309, 0, -0.5, 0.5, 0.5,
-3.326037, 3, -6.382309, 1, -0.5, 0.5, 0.5,
-3.326037, 3, -6.382309, 1, 1.5, 0.5, 0.5,
-3.326037, 3, -6.382309, 0, 1.5, 0.5, 0.5
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
-2.88304, -3.519787, -4,
-2.88304, -3.519787, 4,
-2.88304, -3.519787, -4,
-3.030706, -3.686081, -4,
-2.88304, -3.519787, -2,
-3.030706, -3.686081, -2,
-2.88304, -3.519787, 0,
-3.030706, -3.686081, 0,
-2.88304, -3.519787, 2,
-3.030706, -3.686081, 2,
-2.88304, -3.519787, 4,
-3.030706, -3.686081, 4
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
-3.326037, -4.018667, -4, 0, -0.5, 0.5, 0.5,
-3.326037, -4.018667, -4, 1, -0.5, 0.5, 0.5,
-3.326037, -4.018667, -4, 1, 1.5, 0.5, 0.5,
-3.326037, -4.018667, -4, 0, 1.5, 0.5, 0.5,
-3.326037, -4.018667, -2, 0, -0.5, 0.5, 0.5,
-3.326037, -4.018667, -2, 1, -0.5, 0.5, 0.5,
-3.326037, -4.018667, -2, 1, 1.5, 0.5, 0.5,
-3.326037, -4.018667, -2, 0, 1.5, 0.5, 0.5,
-3.326037, -4.018667, 0, 0, -0.5, 0.5, 0.5,
-3.326037, -4.018667, 0, 1, -0.5, 0.5, 0.5,
-3.326037, -4.018667, 0, 1, 1.5, 0.5, 0.5,
-3.326037, -4.018667, 0, 0, 1.5, 0.5, 0.5,
-3.326037, -4.018667, 2, 0, -0.5, 0.5, 0.5,
-3.326037, -4.018667, 2, 1, -0.5, 0.5, 0.5,
-3.326037, -4.018667, 2, 1, 1.5, 0.5, 0.5,
-3.326037, -4.018667, 2, 0, 1.5, 0.5, 0.5,
-3.326037, -4.018667, 4, 0, -0.5, 0.5, 0.5,
-3.326037, -4.018667, 4, 1, -0.5, 0.5, 0.5,
-3.326037, -4.018667, 4, 1, 1.5, 0.5, 0.5,
-3.326037, -4.018667, 4, 0, 1.5, 0.5, 0.5
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
-2.88304, -3.519787, -5.524834,
-2.88304, 3.131948, -5.524834,
-2.88304, -3.519787, 5.908172,
-2.88304, 3.131948, 5.908172,
-2.88304, -3.519787, -5.524834,
-2.88304, -3.519787, 5.908172,
-2.88304, 3.131948, -5.524834,
-2.88304, 3.131948, 5.908172,
-2.88304, -3.519787, -5.524834,
3.023582, -3.519787, -5.524834,
-2.88304, -3.519787, 5.908172,
3.023582, -3.519787, 5.908172,
-2.88304, 3.131948, -5.524834,
3.023582, 3.131948, -5.524834,
-2.88304, 3.131948, 5.908172,
3.023582, 3.131948, 5.908172,
3.023582, -3.519787, -5.524834,
3.023582, 3.131948, -5.524834,
3.023582, -3.519787, 5.908172,
3.023582, 3.131948, 5.908172,
3.023582, -3.519787, -5.524834,
3.023582, -3.519787, 5.908172,
3.023582, 3.131948, -5.524834,
3.023582, 3.131948, 5.908172
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
var radius = 7.735302;
var distance = 34.41523;
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
mvMatrix.translate( -0.07027078, 0.1939197, -0.191669 );
mvMatrix.scale( 1.415963, 1.25735, 0.7315276 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.41523);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
benazolin<-read.table("benazolin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benazolin$V2
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
y<-benazolin$V3
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
z<-benazolin$V4
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
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
-2.797022, -0.4539631, -1.78162, 0, 0, 1, 1, 1,
-2.703662, 0.4232919, -1.763489, 1, 0, 0, 1, 1,
-2.675811, 0.987301, -2.007425, 1, 0, 0, 1, 1,
-2.640024, 0.507503, -1.610333, 1, 0, 0, 1, 1,
-2.606471, -0.3294214, -0.9989469, 1, 0, 0, 1, 1,
-2.603907, 0.734866, -0.191149, 1, 0, 0, 1, 1,
-2.551847, -0.9366848, -1.873646, 0, 0, 0, 1, 1,
-2.546474, 0.09026217, -1.66225, 0, 0, 0, 1, 1,
-2.376138, 0.2882053, -2.252893, 0, 0, 0, 1, 1,
-2.373897, -0.3640864, -2.257297, 0, 0, 0, 1, 1,
-2.360663, 0.5193386, -1.065653, 0, 0, 0, 1, 1,
-2.280175, -0.4128973, -2.299453, 0, 0, 0, 1, 1,
-2.273883, 1.296481, -1.03661, 0, 0, 0, 1, 1,
-2.259792, -0.4112312, -1.312221, 1, 1, 1, 1, 1,
-2.259391, 0.5911425, -2.418495, 1, 1, 1, 1, 1,
-2.242011, -0.6992138, -2.662799, 1, 1, 1, 1, 1,
-2.238666, -0.5827416, -3.267796, 1, 1, 1, 1, 1,
-2.187254, 2.077026, 0.4578526, 1, 1, 1, 1, 1,
-2.175285, 0.6155142, -3.019147, 1, 1, 1, 1, 1,
-2.1747, -0.3425243, -1.054584, 1, 1, 1, 1, 1,
-2.137685, 0.03036531, -2.067095, 1, 1, 1, 1, 1,
-2.124848, -0.4054647, -1.856224, 1, 1, 1, 1, 1,
-2.12393, 2.542015, -0.5634837, 1, 1, 1, 1, 1,
-2.118284, -1.419472, -2.02287, 1, 1, 1, 1, 1,
-2.111997, 0.3451992, 0.1881629, 1, 1, 1, 1, 1,
-2.071705, -1.083531, -1.505211, 1, 1, 1, 1, 1,
-2.045515, 1.028435, 0.7115716, 1, 1, 1, 1, 1,
-1.984168, -0.1561464, -1.169293, 1, 1, 1, 1, 1,
-1.969012, -1.19521, -2.675958, 0, 0, 1, 1, 1,
-1.966396, -2.124347, -2.659643, 1, 0, 0, 1, 1,
-1.950428, 0.3416525, -0.6703584, 1, 0, 0, 1, 1,
-1.933531, -0.5155659, -2.415021, 1, 0, 0, 1, 1,
-1.926087, -0.5792886, -1.904652, 1, 0, 0, 1, 1,
-1.912979, 0.329576, -3.387831, 1, 0, 0, 1, 1,
-1.895724, -0.7536741, -2.68874, 0, 0, 0, 1, 1,
-1.879993, -0.6323097, -2.646944, 0, 0, 0, 1, 1,
-1.836661, -1.778435, -3.180389, 0, 0, 0, 1, 1,
-1.830311, -0.5496933, -2.758989, 0, 0, 0, 1, 1,
-1.82315, 0.188924, -2.914816, 0, 0, 0, 1, 1,
-1.810313, 0.7607528, -1.125713, 0, 0, 0, 1, 1,
-1.749694, 0.5234079, -1.39154, 0, 0, 0, 1, 1,
-1.697524, -0.4341528, -1.204203, 1, 1, 1, 1, 1,
-1.697519, 0.01889514, -1.686398, 1, 1, 1, 1, 1,
-1.691092, 0.06345329, -1.758973, 1, 1, 1, 1, 1,
-1.678701, 0.7354392, -3.801521, 1, 1, 1, 1, 1,
-1.669452, -0.7327619, -3.968262, 1, 1, 1, 1, 1,
-1.64781, -0.4068529, -2.026258, 1, 1, 1, 1, 1,
-1.644812, -1.523094, -1.471655, 1, 1, 1, 1, 1,
-1.642545, 0.06387062, -1.068216, 1, 1, 1, 1, 1,
-1.621178, -0.9305079, -2.197712, 1, 1, 1, 1, 1,
-1.611421, -0.7564253, -1.469361, 1, 1, 1, 1, 1,
-1.594348, 0.6729962, 0.2721755, 1, 1, 1, 1, 1,
-1.593954, 1.488141, -0.9472674, 1, 1, 1, 1, 1,
-1.569863, 0.5346733, -1.4796, 1, 1, 1, 1, 1,
-1.559813, 0.7037567, 0.02569423, 1, 1, 1, 1, 1,
-1.55776, -1.278096, -4.086021, 1, 1, 1, 1, 1,
-1.554972, -0.4390917, -2.317266, 0, 0, 1, 1, 1,
-1.547847, -0.8078074, -1.877885, 1, 0, 0, 1, 1,
-1.53501, -0.1652948, -0.8484907, 1, 0, 0, 1, 1,
-1.532507, -1.435821, -2.011692, 1, 0, 0, 1, 1,
-1.52862, 0.04015507, -2.233085, 1, 0, 0, 1, 1,
-1.52525, 0.608525, -2.201536, 1, 0, 0, 1, 1,
-1.52517, 1.546992, -0.4115316, 0, 0, 0, 1, 1,
-1.498125, -1.623458, -2.966644, 0, 0, 0, 1, 1,
-1.493807, 0.9641191, 0.1675419, 0, 0, 0, 1, 1,
-1.493504, 0.9515291, -0.3359357, 0, 0, 0, 1, 1,
-1.490277, 0.5132896, -1.322045, 0, 0, 0, 1, 1,
-1.482048, -0.6930336, -1.580032, 0, 0, 0, 1, 1,
-1.473648, -0.2307487, -1.467888, 0, 0, 0, 1, 1,
-1.472884, 1.414694, 0.03180579, 1, 1, 1, 1, 1,
-1.448963, -0.3005356, -1.84708, 1, 1, 1, 1, 1,
-1.439658, 0.1444809, -1.659526, 1, 1, 1, 1, 1,
-1.420418, -1.310065, -2.275636, 1, 1, 1, 1, 1,
-1.393325, -0.1448545, -2.029006, 1, 1, 1, 1, 1,
-1.383651, 0.8522151, -1.461735, 1, 1, 1, 1, 1,
-1.381568, 0.6047694, -1.069469, 1, 1, 1, 1, 1,
-1.380875, -0.5564503, -1.572486, 1, 1, 1, 1, 1,
-1.366314, -0.6213143, -1.922624, 1, 1, 1, 1, 1,
-1.366171, -0.1778156, -1.635117, 1, 1, 1, 1, 1,
-1.362486, 2.6183, -2.473485, 1, 1, 1, 1, 1,
-1.361991, -0.5678819, -2.612332, 1, 1, 1, 1, 1,
-1.35803, -0.9596475, -3.046678, 1, 1, 1, 1, 1,
-1.345801, 1.538888, -1.826838, 1, 1, 1, 1, 1,
-1.336419, -1.043328, -3.444951, 1, 1, 1, 1, 1,
-1.334324, -0.6104367, -1.528447, 0, 0, 1, 1, 1,
-1.316831, -0.5806297, -1.589841, 1, 0, 0, 1, 1,
-1.316115, 0.1539263, -0.5995944, 1, 0, 0, 1, 1,
-1.311387, 0.586805, -0.2087095, 1, 0, 0, 1, 1,
-1.29343, -0.2706189, -0.5951064, 1, 0, 0, 1, 1,
-1.287778, 0.3066396, -1.349921, 1, 0, 0, 1, 1,
-1.278473, 1.083961, -0.1061545, 0, 0, 0, 1, 1,
-1.275696, 2.400771, -1.605629, 0, 0, 0, 1, 1,
-1.272976, 0.304183, -0.9335892, 0, 0, 0, 1, 1,
-1.269454, 0.6478807, -1.767907, 0, 0, 0, 1, 1,
-1.260578, 1.343959, -0.9240177, 0, 0, 0, 1, 1,
-1.260044, 0.3426445, -1.494286, 0, 0, 0, 1, 1,
-1.248038, 0.0427869, -2.797488, 0, 0, 0, 1, 1,
-1.247684, -0.8209625, -1.650902, 1, 1, 1, 1, 1,
-1.244417, 0.4845006, -2.844709, 1, 1, 1, 1, 1,
-1.236454, -0.1887314, -2.223093, 1, 1, 1, 1, 1,
-1.232749, -0.1205347, -0.6719293, 1, 1, 1, 1, 1,
-1.230751, -0.2512895, -3.067326, 1, 1, 1, 1, 1,
-1.227215, 0.8257006, -0.3866512, 1, 1, 1, 1, 1,
-1.216716, 1.488089, -2.169478, 1, 1, 1, 1, 1,
-1.212924, -0.6200275, -3.875227, 1, 1, 1, 1, 1,
-1.211538, -1.091772, -1.072859, 1, 1, 1, 1, 1,
-1.207206, -0.07256953, -3.33931, 1, 1, 1, 1, 1,
-1.202569, -0.6474149, -1.165531, 1, 1, 1, 1, 1,
-1.197694, -0.4055325, 0.2149959, 1, 1, 1, 1, 1,
-1.195212, -0.3323307, -1.571434, 1, 1, 1, 1, 1,
-1.194566, -0.1183561, -1.319424, 1, 1, 1, 1, 1,
-1.193243, -1.306123, -2.229211, 1, 1, 1, 1, 1,
-1.189311, 1.700828, -1.973807, 0, 0, 1, 1, 1,
-1.178421, -0.5073547, -0.3231747, 1, 0, 0, 1, 1,
-1.168332, 0.5865968, -3.025896, 1, 0, 0, 1, 1,
-1.158717, 0.8216975, -1.120094, 1, 0, 0, 1, 1,
-1.153343, 0.08382136, -2.321772, 1, 0, 0, 1, 1,
-1.149236, 0.7791848, -2.538844, 1, 0, 0, 1, 1,
-1.149232, 0.8897375, -2.174493, 0, 0, 0, 1, 1,
-1.14723, 1.026558, -0.2207313, 0, 0, 0, 1, 1,
-1.139276, -1.408037, -2.343086, 0, 0, 0, 1, 1,
-1.136061, 0.5563314, -2.318031, 0, 0, 0, 1, 1,
-1.135815, -1.747223, -2.360271, 0, 0, 0, 1, 1,
-1.127561, -0.7374219, -2.533669, 0, 0, 0, 1, 1,
-1.12035, -0.1162582, -0.4803407, 0, 0, 0, 1, 1,
-1.095268, -1.16748, -3.167832, 1, 1, 1, 1, 1,
-1.095105, -0.2177003, -2.170396, 1, 1, 1, 1, 1,
-1.094356, -0.04124, -0.9640079, 1, 1, 1, 1, 1,
-1.093915, -0.5713803, -0.9679574, 1, 1, 1, 1, 1,
-1.091236, -1.562966, -2.896686, 1, 1, 1, 1, 1,
-1.08509, -1.712041, -2.4328, 1, 1, 1, 1, 1,
-1.077904, -0.5710018, -3.551808, 1, 1, 1, 1, 1,
-1.07608, 0.1723578, -3.10258, 1, 1, 1, 1, 1,
-1.073665, 0.6519839, -1.575118, 1, 1, 1, 1, 1,
-1.073505, -1.418625, -1.790445, 1, 1, 1, 1, 1,
-1.07101, 0.465046, -0.6018323, 1, 1, 1, 1, 1,
-1.065109, -0.4750557, -1.784528, 1, 1, 1, 1, 1,
-1.064617, 1.570713, -0.7355576, 1, 1, 1, 1, 1,
-1.054792, -0.2309833, -4.384045, 1, 1, 1, 1, 1,
-1.050489, -0.4355465, -2.177001, 1, 1, 1, 1, 1,
-1.045363, -0.5368581, -2.579515, 0, 0, 1, 1, 1,
-1.044513, 0.4680706, 1.416129, 1, 0, 0, 1, 1,
-1.039724, -0.09448981, -1.711367, 1, 0, 0, 1, 1,
-1.038552, 1.48403, -0.1621025, 1, 0, 0, 1, 1,
-1.03845, -1.033912, -2.686514, 1, 0, 0, 1, 1,
-1.037865, 0.3659005, -2.800382, 1, 0, 0, 1, 1,
-1.029741, 0.2582249, -0.3616355, 0, 0, 0, 1, 1,
-1.029668, 0.9004738, -0.4043832, 0, 0, 0, 1, 1,
-1.023752, -0.6616797, -1.643054, 0, 0, 0, 1, 1,
-1.020937, 0.245009, -1.775936, 0, 0, 0, 1, 1,
-1.00826, 0.4012022, -1.113797, 0, 0, 0, 1, 1,
-1.00826, 1.008196, -2.105696, 0, 0, 0, 1, 1,
-1.001673, 0.5632472, -0.4133436, 0, 0, 0, 1, 1,
-0.9973763, 0.9750311, 0.6194485, 1, 1, 1, 1, 1,
-0.993134, 0.9601891, -0.5166258, 1, 1, 1, 1, 1,
-0.9881636, 0.861369, -0.3608725, 1, 1, 1, 1, 1,
-0.9861414, 0.3203328, -2.300089, 1, 1, 1, 1, 1,
-0.979933, -1.109709, -3.094173, 1, 1, 1, 1, 1,
-0.9759151, 0.4020095, 0.1328112, 1, 1, 1, 1, 1,
-0.9735427, -1.058992, -2.877317, 1, 1, 1, 1, 1,
-0.9703232, 0.7186343, -1.193212, 1, 1, 1, 1, 1,
-0.9677336, -0.1971817, -2.352207, 1, 1, 1, 1, 1,
-0.9649099, 1.149094, 0.6740751, 1, 1, 1, 1, 1,
-0.9612736, -0.3940086, -2.578212, 1, 1, 1, 1, 1,
-0.9597486, -0.5277193, -1.664036, 1, 1, 1, 1, 1,
-0.9578098, 0.2272977, -1.748775, 1, 1, 1, 1, 1,
-0.9568561, -0.2032751, -1.45785, 1, 1, 1, 1, 1,
-0.9440262, 0.9297153, 0.06644664, 1, 1, 1, 1, 1,
-0.9416373, -0.2285685, -1.206897, 0, 0, 1, 1, 1,
-0.9409057, 1.744461, -2.786487, 1, 0, 0, 1, 1,
-0.9381315, -0.2236618, -0.2886843, 1, 0, 0, 1, 1,
-0.9343446, 0.3205473, -1.489282, 1, 0, 0, 1, 1,
-0.9301743, 0.01672849, -2.45397, 1, 0, 0, 1, 1,
-0.9290043, -0.4121765, -0.4457863, 1, 0, 0, 1, 1,
-0.9267037, 0.4709727, -2.618001, 0, 0, 0, 1, 1,
-0.9265753, -0.6082727, -2.123808, 0, 0, 0, 1, 1,
-0.9252097, -1.557358, -3.066231, 0, 0, 0, 1, 1,
-0.9143987, 1.604997, 0.3497713, 0, 0, 0, 1, 1,
-0.9072601, 0.808046, -1.684023, 0, 0, 0, 1, 1,
-0.9060991, 2.056148, -0.8015966, 0, 0, 0, 1, 1,
-0.9059875, 1.032729, 1.056675, 0, 0, 0, 1, 1,
-0.9010199, -0.8741482, -2.690097, 1, 1, 1, 1, 1,
-0.9004293, 0.3510771, -2.826298, 1, 1, 1, 1, 1,
-0.8958206, 1.353179, -0.7578301, 1, 1, 1, 1, 1,
-0.8948758, 0.6056947, -0.317816, 1, 1, 1, 1, 1,
-0.89191, -1.689562, -3.803017, 1, 1, 1, 1, 1,
-0.8886864, 1.541433, -1.212806, 1, 1, 1, 1, 1,
-0.8880023, -0.01890396, -2.09931, 1, 1, 1, 1, 1,
-0.8799342, 0.04600859, -0.8982034, 1, 1, 1, 1, 1,
-0.8797576, -1.749849, -1.667548, 1, 1, 1, 1, 1,
-0.8754017, -0.2438579, -1.669761, 1, 1, 1, 1, 1,
-0.8745868, 0.08876447, -2.281031, 1, 1, 1, 1, 1,
-0.8670607, -0.4892896, -3.246282, 1, 1, 1, 1, 1,
-0.865887, 1.572494, 0.1901578, 1, 1, 1, 1, 1,
-0.8639871, -0.4198643, -1.849815, 1, 1, 1, 1, 1,
-0.8631102, -0.8564581, -3.119015, 1, 1, 1, 1, 1,
-0.8600994, 0.6376789, 0.09062053, 0, 0, 1, 1, 1,
-0.8509721, 0.0936638, -1.084421, 1, 0, 0, 1, 1,
-0.8452955, -0.06068559, -1.887309, 1, 0, 0, 1, 1,
-0.8392869, 1.424977, -2.219873, 1, 0, 0, 1, 1,
-0.8377138, 1.252586, -0.8975037, 1, 0, 0, 1, 1,
-0.8360967, -1.544185, -2.591423, 1, 0, 0, 1, 1,
-0.8345309, -1.372089, -3.74963, 0, 0, 0, 1, 1,
-0.8292814, -0.9467362, -3.112685, 0, 0, 0, 1, 1,
-0.8273519, 0.433946, -1.669646, 0, 0, 0, 1, 1,
-0.8262815, -1.289067, -1.269523, 0, 0, 0, 1, 1,
-0.8261985, -0.1813031, -1.822587, 0, 0, 0, 1, 1,
-0.8175251, -0.9881843, -4.173565, 0, 0, 0, 1, 1,
-0.809592, 0.6254042, -2.217878, 0, 0, 0, 1, 1,
-0.8069856, -0.6259373, -2.952907, 1, 1, 1, 1, 1,
-0.8062865, 0.04121821, 0.1144912, 1, 1, 1, 1, 1,
-0.8036342, -0.4875077, -1.988882, 1, 1, 1, 1, 1,
-0.8034976, -1.713818, -3.525942, 1, 1, 1, 1, 1,
-0.8002194, -0.512725, -2.61076, 1, 1, 1, 1, 1,
-0.7964106, -1.260315, -2.835958, 1, 1, 1, 1, 1,
-0.7937803, 0.6324891, 0.1541942, 1, 1, 1, 1, 1,
-0.7883188, -0.2900172, -3.898478, 1, 1, 1, 1, 1,
-0.7861463, 0.07371892, -1.542992, 1, 1, 1, 1, 1,
-0.7833305, 0.5494215, -0.9468517, 1, 1, 1, 1, 1,
-0.7783538, -1.140051, -2.913348, 1, 1, 1, 1, 1,
-0.7773652, 0.3153465, -1.50127, 1, 1, 1, 1, 1,
-0.7740852, -0.414102, -1.859735, 1, 1, 1, 1, 1,
-0.7732728, -0.02099952, -1.045674, 1, 1, 1, 1, 1,
-0.7685235, 0.2610747, -1.07447, 1, 1, 1, 1, 1,
-0.7681434, 1.778411, 0.7963456, 0, 0, 1, 1, 1,
-0.7661239, 0.04107508, -2.11544, 1, 0, 0, 1, 1,
-0.765276, -1.470874, -2.870731, 1, 0, 0, 1, 1,
-0.7648158, 0.5611882, 0.4625748, 1, 0, 0, 1, 1,
-0.7511843, -1.85192, -2.194487, 1, 0, 0, 1, 1,
-0.7377444, -0.330287, -0.2996942, 1, 0, 0, 1, 1,
-0.7375608, -0.3161998, -2.914787, 0, 0, 0, 1, 1,
-0.7350038, -0.2530408, -0.4217662, 0, 0, 0, 1, 1,
-0.7349481, -0.1138232, -1.056011, 0, 0, 0, 1, 1,
-0.7318975, -0.08751281, -2.162878, 0, 0, 0, 1, 1,
-0.7231988, 1.364045, -1.105361, 0, 0, 0, 1, 1,
-0.723139, -0.3255085, -2.691379, 0, 0, 0, 1, 1,
-0.7228732, 1.626477, 0.3835815, 0, 0, 0, 1, 1,
-0.7225848, -2.399718, -3.572432, 1, 1, 1, 1, 1,
-0.7190366, 0.349271, -0.1247651, 1, 1, 1, 1, 1,
-0.7136771, -0.2767546, -0.8320712, 1, 1, 1, 1, 1,
-0.7087058, -1.426084, -2.887616, 1, 1, 1, 1, 1,
-0.7024216, 0.2087689, -2.368652, 1, 1, 1, 1, 1,
-0.6985929, 0.1538646, -2.772598, 1, 1, 1, 1, 1,
-0.6968712, -1.543868, -2.3241, 1, 1, 1, 1, 1,
-0.6944881, 1.729662, 0.9364279, 1, 1, 1, 1, 1,
-0.687592, -1.190587, -2.425234, 1, 1, 1, 1, 1,
-0.6805511, -1.930908, -3.293756, 1, 1, 1, 1, 1,
-0.6787648, -1.218405, -0.9507179, 1, 1, 1, 1, 1,
-0.6737182, 0.2611728, 1.274562, 1, 1, 1, 1, 1,
-0.6720001, 2.551077, 0.3152604, 1, 1, 1, 1, 1,
-0.6674252, -1.424035, -2.947005, 1, 1, 1, 1, 1,
-0.6671901, -0.2177047, -1.185992, 1, 1, 1, 1, 1,
-0.6658023, -0.869961, -4.228921, 0, 0, 1, 1, 1,
-0.6605052, 1.001666, 1.134677, 1, 0, 0, 1, 1,
-0.6580843, -0.6366626, -2.657329, 1, 0, 0, 1, 1,
-0.6478143, -0.3110531, -2.509536, 1, 0, 0, 1, 1,
-0.645338, 1.826232, 1.985835, 1, 0, 0, 1, 1,
-0.6439971, -0.252989, -0.8034828, 1, 0, 0, 1, 1,
-0.6419226, -0.2967646, -2.045165, 0, 0, 0, 1, 1,
-0.6414042, 0.7886401, -1.019972, 0, 0, 0, 1, 1,
-0.6409106, 0.4685767, -1.219232, 0, 0, 0, 1, 1,
-0.6362908, 0.7129816, 0.5808625, 0, 0, 0, 1, 1,
-0.6304799, 0.9849638, -0.1327086, 0, 0, 0, 1, 1,
-0.6278176, -1.015242, -2.814756, 0, 0, 0, 1, 1,
-0.6246444, 2.162388, -1.696455, 0, 0, 0, 1, 1,
-0.6221645, 0.1034494, -1.641001, 1, 1, 1, 1, 1,
-0.6203107, 0.46989, -2.002287, 1, 1, 1, 1, 1,
-0.6193123, -0.3013264, -1.0713, 1, 1, 1, 1, 1,
-0.6183905, -1.076788, -1.306106, 1, 1, 1, 1, 1,
-0.614306, -0.07290744, -2.820168, 1, 1, 1, 1, 1,
-0.604627, 0.7012979, -1.508274, 1, 1, 1, 1, 1,
-0.6018254, 0.5436906, -3.200797, 1, 1, 1, 1, 1,
-0.5999769, 2.192862, -0.510376, 1, 1, 1, 1, 1,
-0.5986527, 0.07582925, -1.796962, 1, 1, 1, 1, 1,
-0.5968971, 1.362635, -0.5411708, 1, 1, 1, 1, 1,
-0.5920795, 1.506337, -1.330026, 1, 1, 1, 1, 1,
-0.5920619, -0.7699671, -3.562089, 1, 1, 1, 1, 1,
-0.5909415, -0.3045906, -0.5459888, 1, 1, 1, 1, 1,
-0.5908462, 0.2066702, -2.568741, 1, 1, 1, 1, 1,
-0.5884196, 0.8048627, 0.8467254, 1, 1, 1, 1, 1,
-0.5858297, 1.334156, -0.02081217, 0, 0, 1, 1, 1,
-0.5802163, -0.1045919, -0.0430567, 1, 0, 0, 1, 1,
-0.5799106, 0.1232643, -0.7908424, 1, 0, 0, 1, 1,
-0.5765237, -0.042384, -2.626715, 1, 0, 0, 1, 1,
-0.5737939, -0.01245803, -2.098685, 1, 0, 0, 1, 1,
-0.5723952, 0.7852686, -1.23472, 1, 0, 0, 1, 1,
-0.5717615, 0.05919107, -1.445988, 0, 0, 0, 1, 1,
-0.5716814, -0.3443518, -3.403488, 0, 0, 0, 1, 1,
-0.5680946, -0.1469064, -2.700412, 0, 0, 0, 1, 1,
-0.5666183, 0.1377992, -2.625748, 0, 0, 0, 1, 1,
-0.5654608, -1.03509, -1.346389, 0, 0, 0, 1, 1,
-0.5644516, 0.1226203, -1.503642, 0, 0, 0, 1, 1,
-0.5642393, -0.5651348, -2.74082, 0, 0, 0, 1, 1,
-0.5613263, -0.08375654, -2.775388, 1, 1, 1, 1, 1,
-0.5607135, 0.0163199, -1.47229, 1, 1, 1, 1, 1,
-0.5584805, -0.2422934, -3.904151, 1, 1, 1, 1, 1,
-0.5539241, 0.3199734, -1.477317, 1, 1, 1, 1, 1,
-0.5530939, 0.8708925, -2.373812, 1, 1, 1, 1, 1,
-0.5506616, 0.8932899, -0.5575849, 1, 1, 1, 1, 1,
-0.5499988, -1.113101, -3.62849, 1, 1, 1, 1, 1,
-0.543861, -0.4113154, -1.860473, 1, 1, 1, 1, 1,
-0.536398, 0.1718252, -1.070529, 1, 1, 1, 1, 1,
-0.5353741, -1.085153, -3.662167, 1, 1, 1, 1, 1,
-0.5286173, 2.13627, -0.1856225, 1, 1, 1, 1, 1,
-0.5205761, -1.058339, -4.175866, 1, 1, 1, 1, 1,
-0.5196424, 1.055161, 1.578332, 1, 1, 1, 1, 1,
-0.5182331, -0.2641415, -1.339238, 1, 1, 1, 1, 1,
-0.5174904, 0.4171487, -0.788726, 1, 1, 1, 1, 1,
-0.5173324, 0.485114, -1.903002, 0, 0, 1, 1, 1,
-0.5135767, 1.2263, -1.119129, 1, 0, 0, 1, 1,
-0.509433, -0.5477757, -2.151728, 1, 0, 0, 1, 1,
-0.5056835, -2.007193, -3.458419, 1, 0, 0, 1, 1,
-0.5035257, -0.2129267, -2.262654, 1, 0, 0, 1, 1,
-0.5023276, -0.01632411, -0.5738422, 1, 0, 0, 1, 1,
-0.4997319, 0.09288058, -1.46629, 0, 0, 0, 1, 1,
-0.4976739, -0.1713999, -3.148014, 0, 0, 0, 1, 1,
-0.4917744, -0.0509341, -1.237741, 0, 0, 0, 1, 1,
-0.4893061, 1.414042, -0.8781294, 0, 0, 0, 1, 1,
-0.4874443, -1.526903, -0.613373, 0, 0, 0, 1, 1,
-0.4870251, 1.798561, 0.8537807, 0, 0, 0, 1, 1,
-0.486044, 0.2415815, -2.324107, 0, 0, 0, 1, 1,
-0.4837131, 0.1309041, -0.7901294, 1, 1, 1, 1, 1,
-0.4798855, 1.842019, -0.7690803, 1, 1, 1, 1, 1,
-0.4756463, -1.571504, -3.557438, 1, 1, 1, 1, 1,
-0.4751199, -1.09435, -2.658043, 1, 1, 1, 1, 1,
-0.4746568, -0.497979, -2.124012, 1, 1, 1, 1, 1,
-0.4712605, -0.6740276, -1.904513, 1, 1, 1, 1, 1,
-0.4701206, -0.610697, -0.8425094, 1, 1, 1, 1, 1,
-0.4654895, 0.1197424, -0.5235343, 1, 1, 1, 1, 1,
-0.4650502, -0.9842065, -1.169094, 1, 1, 1, 1, 1,
-0.4603561, 1.582303, -0.3715191, 1, 1, 1, 1, 1,
-0.4548758, 0.6736199, -2.742673, 1, 1, 1, 1, 1,
-0.454664, -0.05217944, -1.5302, 1, 1, 1, 1, 1,
-0.4525039, -0.9479135, -4.964985, 1, 1, 1, 1, 1,
-0.45191, 1.26197, -0.371849, 1, 1, 1, 1, 1,
-0.4493695, -1.39415, -3.101976, 1, 1, 1, 1, 1,
-0.4487497, -1.424792, -1.433211, 0, 0, 1, 1, 1,
-0.4440235, -0.6908193, -0.8331333, 1, 0, 0, 1, 1,
-0.4435381, 1.070029, -3.086272, 1, 0, 0, 1, 1,
-0.4421325, 0.1179844, -2.724929, 1, 0, 0, 1, 1,
-0.4370661, 0.2788876, -0.6594073, 1, 0, 0, 1, 1,
-0.4317986, 0.2165823, -3.184409, 1, 0, 0, 1, 1,
-0.4285097, 3.035078, -0.7130691, 0, 0, 0, 1, 1,
-0.4188764, 0.756711, -0.5016487, 0, 0, 0, 1, 1,
-0.4144258, -0.3883635, -2.469717, 0, 0, 0, 1, 1,
-0.4143679, 0.722966, 1.710238, 0, 0, 0, 1, 1,
-0.4131499, 0.5593555, 0.6013805, 0, 0, 0, 1, 1,
-0.4032442, 0.6663049, 0.9148396, 0, 0, 0, 1, 1,
-0.3965763, 0.5192783, -0.8402556, 0, 0, 0, 1, 1,
-0.3932779, -0.7604967, -3.225804, 1, 1, 1, 1, 1,
-0.3899621, -0.5889034, -3.184495, 1, 1, 1, 1, 1,
-0.3849297, -0.3471296, -2.497711, 1, 1, 1, 1, 1,
-0.3831058, 1.844171, 1.25435, 1, 1, 1, 1, 1,
-0.3808868, -0.5572507, -2.605442, 1, 1, 1, 1, 1,
-0.3804094, -1.189719, -2.008473, 1, 1, 1, 1, 1,
-0.3680737, 0.01952502, -1.589741, 1, 1, 1, 1, 1,
-0.3678046, -0.4459794, -3.883399, 1, 1, 1, 1, 1,
-0.3649546, 1.318523, 0.5094204, 1, 1, 1, 1, 1,
-0.3630419, 0.07174873, -2.015115, 1, 1, 1, 1, 1,
-0.3591469, -0.258901, -1.766237, 1, 1, 1, 1, 1,
-0.3561737, -0.2116276, -1.624203, 1, 1, 1, 1, 1,
-0.3560562, -0.66235, -5.358334, 1, 1, 1, 1, 1,
-0.3530883, -1.93267, -3.155084, 1, 1, 1, 1, 1,
-0.3527847, 1.455802, 0.5175788, 1, 1, 1, 1, 1,
-0.3509418, -0.5713052, -2.123036, 0, 0, 1, 1, 1,
-0.346437, 0.1375782, -2.604569, 1, 0, 0, 1, 1,
-0.3436752, -0.3401455, -1.91731, 1, 0, 0, 1, 1,
-0.3422656, 0.2426945, -1.680687, 1, 0, 0, 1, 1,
-0.3396285, -1.203433, -1.853884, 1, 0, 0, 1, 1,
-0.3368936, -0.7392421, -3.216676, 1, 0, 0, 1, 1,
-0.3368546, 0.304959, -1.002897, 0, 0, 0, 1, 1,
-0.3362642, 0.9830722, -1.286628, 0, 0, 0, 1, 1,
-0.3317133, 1.903115, -0.8639247, 0, 0, 0, 1, 1,
-0.3291818, -0.2666379, -1.809177, 0, 0, 0, 1, 1,
-0.3227115, 2.017904, 1.077837, 0, 0, 0, 1, 1,
-0.3204167, -0.2909045, -1.796237, 0, 0, 0, 1, 1,
-0.3202208, 1.873476, -0.4525252, 0, 0, 0, 1, 1,
-0.3170983, 1.545614, -1.736355, 1, 1, 1, 1, 1,
-0.317096, 1.364482, -0.4898592, 1, 1, 1, 1, 1,
-0.3164174, -1.997237, -2.709481, 1, 1, 1, 1, 1,
-0.314939, -0.2636105, -2.437009, 1, 1, 1, 1, 1,
-0.3142214, 0.6933318, 1.142223, 1, 1, 1, 1, 1,
-0.3131413, 0.5686827, -0.5469061, 1, 1, 1, 1, 1,
-0.3120455, -0.9615951, -3.442183, 1, 1, 1, 1, 1,
-0.3078848, 0.8131355, 0.9293049, 1, 1, 1, 1, 1,
-0.3029694, -0.3103865, -2.554854, 1, 1, 1, 1, 1,
-0.3028741, -1.116089, -2.963742, 1, 1, 1, 1, 1,
-0.3024822, 0.7917588, -0.8246991, 1, 1, 1, 1, 1,
-0.3019577, 0.7563105, -0.711449, 1, 1, 1, 1, 1,
-0.2972004, -0.1763718, -2.180433, 1, 1, 1, 1, 1,
-0.2961243, 1.113807, 2.648729, 1, 1, 1, 1, 1,
-0.2768634, -0.3888082, -1.746124, 1, 1, 1, 1, 1,
-0.2758723, 1.772267, -2.037231, 0, 0, 1, 1, 1,
-0.2745777, -1.091499, -1.808419, 1, 0, 0, 1, 1,
-0.2730947, -0.03669605, -1.128428, 1, 0, 0, 1, 1,
-0.2726214, 0.4913396, 0.4554917, 1, 0, 0, 1, 1,
-0.2622349, 0.2107894, -1.489341, 1, 0, 0, 1, 1,
-0.261646, -0.1944278, -2.49176, 1, 0, 0, 1, 1,
-0.2602642, 1.966526, 0.7509665, 0, 0, 0, 1, 1,
-0.2563838, 0.2164155, 0.4206128, 0, 0, 0, 1, 1,
-0.2468063, 0.5374137, 0.3210873, 0, 0, 0, 1, 1,
-0.2432166, -2.53552, -2.456938, 0, 0, 0, 1, 1,
-0.2354461, -1.376693, -2.481094, 0, 0, 0, 1, 1,
-0.232785, 0.4278503, -0.4681603, 0, 0, 0, 1, 1,
-0.2298468, -1.463956, -4.169866, 0, 0, 0, 1, 1,
-0.2286844, -0.2688388, -2.530191, 1, 1, 1, 1, 1,
-0.2259942, 0.4346489, 0.6659602, 1, 1, 1, 1, 1,
-0.2249669, -0.3810365, -1.831656, 1, 1, 1, 1, 1,
-0.2116811, 0.3393806, -0.8518605, 1, 1, 1, 1, 1,
-0.2114344, 1.285233, -0.3489015, 1, 1, 1, 1, 1,
-0.2085508, 0.3417062, 0.6740196, 1, 1, 1, 1, 1,
-0.205955, -0.4013239, -2.854951, 1, 1, 1, 1, 1,
-0.2007626, -1.016005, -3.19824, 1, 1, 1, 1, 1,
-0.1987049, 0.9168438, -0.606204, 1, 1, 1, 1, 1,
-0.1984479, -0.1160852, -3.129428, 1, 1, 1, 1, 1,
-0.1979607, 1.210578, 1.533468, 1, 1, 1, 1, 1,
-0.1970025, 0.08057249, -0.3972818, 1, 1, 1, 1, 1,
-0.1946404, -1.803804, -3.629106, 1, 1, 1, 1, 1,
-0.1905059, -0.1332635, -3.098011, 1, 1, 1, 1, 1,
-0.1899238, 0.5056935, 0.02868942, 1, 1, 1, 1, 1,
-0.1847226, -0.8780438, -3.597592, 0, 0, 1, 1, 1,
-0.1836953, 1.614261, -0.0136945, 1, 0, 0, 1, 1,
-0.1833549, -0.4448766, -2.711224, 1, 0, 0, 1, 1,
-0.1830366, -0.3389569, -4.329004, 1, 0, 0, 1, 1,
-0.1817126, -0.3622204, -2.097651, 1, 0, 0, 1, 1,
-0.1814906, 1.371023, 0.6948093, 1, 0, 0, 1, 1,
-0.1810199, -1.722435, -2.780508, 0, 0, 0, 1, 1,
-0.1731371, -0.298813, -3.853698, 0, 0, 0, 1, 1,
-0.1696721, -0.02647159, -0.7545508, 0, 0, 0, 1, 1,
-0.1660599, -1.072908, -2.898225, 0, 0, 0, 1, 1,
-0.1647055, -0.552676, -3.513148, 0, 0, 0, 1, 1,
-0.1639624, -0.8266918, -3.538055, 0, 0, 0, 1, 1,
-0.1575188, 1.333489, -1.053512, 0, 0, 0, 1, 1,
-0.1539648, -0.4883807, -3.098719, 1, 1, 1, 1, 1,
-0.1515139, 0.2983078, -0.2080394, 1, 1, 1, 1, 1,
-0.1514093, -0.1230189, -1.054435, 1, 1, 1, 1, 1,
-0.1493562, -0.8125433, -2.156153, 1, 1, 1, 1, 1,
-0.1472577, 0.1217098, -0.6567062, 1, 1, 1, 1, 1,
-0.1437045, -0.1586931, -0.9812351, 1, 1, 1, 1, 1,
-0.142992, 0.01347213, 0.507683, 1, 1, 1, 1, 1,
-0.1424675, -0.3309392, -4.077838, 1, 1, 1, 1, 1,
-0.1417783, 0.1876691, 0.5745647, 1, 1, 1, 1, 1,
-0.1361718, 0.8095996, -0.1438866, 1, 1, 1, 1, 1,
-0.1352203, -1.267935, -3.430917, 1, 1, 1, 1, 1,
-0.1325749, -0.2490395, -2.291702, 1, 1, 1, 1, 1,
-0.1295159, 0.5902045, -0.2011524, 1, 1, 1, 1, 1,
-0.1261469, 0.04459531, -0.8743398, 1, 1, 1, 1, 1,
-0.1251728, 0.7816172, 1.170696, 1, 1, 1, 1, 1,
-0.119576, -1.150489, -3.307899, 0, 0, 1, 1, 1,
-0.1166102, -0.7018598, -2.754104, 1, 0, 0, 1, 1,
-0.1151055, 2.128047, -0.772743, 1, 0, 0, 1, 1,
-0.1122931, 0.3034485, 1.503242, 1, 0, 0, 1, 1,
-0.107731, 1.175972, 0.9554612, 1, 0, 0, 1, 1,
-0.1070887, -1.333281, -2.545557, 1, 0, 0, 1, 1,
-0.1065561, 0.9222162, 0.2340351, 0, 0, 0, 1, 1,
-0.1052524, 0.9593096, 0.4365238, 0, 0, 0, 1, 1,
-0.104918, -0.3716295, -4.14831, 0, 0, 0, 1, 1,
-0.09787033, -1.974772, -1.840365, 0, 0, 0, 1, 1,
-0.09729487, -0.2297475, -2.146244, 0, 0, 0, 1, 1,
-0.09609725, 2.264375, -0.6224097, 0, 0, 0, 1, 1,
-0.09117951, -0.5436077, -5.11578, 0, 0, 0, 1, 1,
-0.09070524, 0.4637806, 0.6073687, 1, 1, 1, 1, 1,
-0.08970855, -0.03010558, -2.801691, 1, 1, 1, 1, 1,
-0.08800282, -1.467714, -3.791677, 1, 1, 1, 1, 1,
-0.08637659, -0.5785155, -2.361086, 1, 1, 1, 1, 1,
-0.08385275, 0.2945979, -0.02244347, 1, 1, 1, 1, 1,
-0.08212756, 0.3726031, -1.458174, 1, 1, 1, 1, 1,
-0.07885433, -0.4431176, -2.755426, 1, 1, 1, 1, 1,
-0.07445667, -0.462686, -3.68896, 1, 1, 1, 1, 1,
-0.07072939, -0.403594, -1.632581, 1, 1, 1, 1, 1,
-0.06948989, -0.778626, -1.417156, 1, 1, 1, 1, 1,
-0.0690404, 1.575223, -0.7406942, 1, 1, 1, 1, 1,
-0.06888361, 0.001245426, -1.241117, 1, 1, 1, 1, 1,
-0.06820629, 0.1694658, 0.6080977, 1, 1, 1, 1, 1,
-0.06576274, -0.4293168, -2.59098, 1, 1, 1, 1, 1,
-0.06352051, 0.4661753, 0.4701641, 1, 1, 1, 1, 1,
-0.06167466, -0.07948182, -3.002065, 0, 0, 1, 1, 1,
-0.06146752, 0.1108676, 0.5445655, 1, 0, 0, 1, 1,
-0.05793623, 0.6985942, 1.054729, 1, 0, 0, 1, 1,
-0.05257001, 1.525468, -0.1770874, 1, 0, 0, 1, 1,
-0.05242393, 1.00609, -0.03992269, 1, 0, 0, 1, 1,
-0.05206442, 0.08267297, -1.29576, 1, 0, 0, 1, 1,
-0.04893347, -0.6814404, -3.204921, 0, 0, 0, 1, 1,
-0.04829919, -0.1515866, -2.078042, 0, 0, 0, 1, 1,
-0.03868947, -1.286717, -2.306959, 0, 0, 0, 1, 1,
-0.03686943, 0.3219116, 0.1062683, 0, 0, 0, 1, 1,
-0.03049796, 0.2209848, 1.219074, 0, 0, 0, 1, 1,
-0.02745052, -0.3513061, -3.398618, 0, 0, 0, 1, 1,
-0.02534913, -0.2173763, -3.78554, 0, 0, 0, 1, 1,
-0.02095608, -0.8676587, -3.738715, 1, 1, 1, 1, 1,
-0.01982466, 0.5141088, -0.8898991, 1, 1, 1, 1, 1,
-0.01787125, -1.118049, -2.705159, 1, 1, 1, 1, 1,
-0.01670355, -0.8252419, -4.208506, 1, 1, 1, 1, 1,
-0.01646367, -0.4296747, -4.201702, 1, 1, 1, 1, 1,
-0.01128844, 0.8963407, -0.1532661, 1, 1, 1, 1, 1,
-0.008146411, -0.5358073, -2.340431, 1, 1, 1, 1, 1,
-0.006680137, -0.0683834, -1.983363, 1, 1, 1, 1, 1,
-0.006564633, 2.115672, 0.344828, 1, 1, 1, 1, 1,
-0.004973584, -1.573402, -3.862741, 1, 1, 1, 1, 1,
-0.0009933376, 1.141524, -0.4426483, 1, 1, 1, 1, 1,
0.002802039, 1.307454, 0.798894, 1, 1, 1, 1, 1,
0.005952074, -1.742442, 3.570755, 1, 1, 1, 1, 1,
0.00769182, 0.2810538, -1.208194, 1, 1, 1, 1, 1,
0.008301511, 0.7341806, 0.2552094, 1, 1, 1, 1, 1,
0.01176927, 0.5415666, -1.029734, 0, 0, 1, 1, 1,
0.01247754, -0.7793401, 4.407037, 1, 0, 0, 1, 1,
0.01421613, -0.8076209, 4.548525, 1, 0, 0, 1, 1,
0.01746125, -2.296531, 0.8988276, 1, 0, 0, 1, 1,
0.02093722, -0.2553311, 3.638729, 1, 0, 0, 1, 1,
0.02339695, 0.6760418, -0.5052739, 1, 0, 0, 1, 1,
0.02504142, 0.5933126, -1.856047, 0, 0, 0, 1, 1,
0.03392158, -0.6252942, 4.025227, 0, 0, 0, 1, 1,
0.0408181, -1.08188, 1.509058, 0, 0, 0, 1, 1,
0.04125731, -1.071671, 2.207661, 0, 0, 0, 1, 1,
0.04639532, -1.091866, 2.636954, 0, 0, 0, 1, 1,
0.04755977, -0.8607273, 5.147729, 0, 0, 0, 1, 1,
0.05363845, -0.5577796, 4.324049, 0, 0, 0, 1, 1,
0.05991534, -1.278847, 3.94394, 1, 1, 1, 1, 1,
0.06212775, 0.6424744, 0.5416555, 1, 1, 1, 1, 1,
0.06439957, 0.3564366, 1.038791, 1, 1, 1, 1, 1,
0.06537407, 1.607247, 0.5113468, 1, 1, 1, 1, 1,
0.06566681, -0.8033467, 3.750809, 1, 1, 1, 1, 1,
0.06725431, -0.1468029, 3.322496, 1, 1, 1, 1, 1,
0.07079878, 0.2836185, -1.821221, 1, 1, 1, 1, 1,
0.07434479, 0.5160376, -0.0980416, 1, 1, 1, 1, 1,
0.08174413, 0.7337634, -0.2068726, 1, 1, 1, 1, 1,
0.08201171, -0.07025541, 2.146543, 1, 1, 1, 1, 1,
0.08478318, 2.106868, 1.423085, 1, 1, 1, 1, 1,
0.090113, 1.712988, -0.01566396, 1, 1, 1, 1, 1,
0.09607752, 0.1306311, 1.072724, 1, 1, 1, 1, 1,
0.09676646, 1.871422, -0.1336453, 1, 1, 1, 1, 1,
0.0968595, -0.856877, 1.248909, 1, 1, 1, 1, 1,
0.09701166, -0.5379189, 4.26737, 0, 0, 1, 1, 1,
0.09843496, -0.8530046, 2.064498, 1, 0, 0, 1, 1,
0.1030154, 1.070922, 0.9348958, 1, 0, 0, 1, 1,
0.1080071, 1.22332, -0.5065719, 1, 0, 0, 1, 1,
0.1100833, 1.599608, 0.1049781, 1, 0, 0, 1, 1,
0.1117665, -0.7494684, 2.931057, 1, 0, 0, 1, 1,
0.1144686, 0.9658712, 0.5877189, 0, 0, 0, 1, 1,
0.1156301, 1.501283, 0.7259188, 0, 0, 0, 1, 1,
0.118577, -3.422917, 4.239036, 0, 0, 0, 1, 1,
0.118843, 1.672018, -0.4944793, 0, 0, 0, 1, 1,
0.1224299, -1.5855, 3.248636, 0, 0, 0, 1, 1,
0.1304321, -0.9758183, 3.497964, 0, 0, 0, 1, 1,
0.1330891, 1.426201, -0.5002853, 0, 0, 0, 1, 1,
0.1351596, -0.2213697, 1.824316, 1, 1, 1, 1, 1,
0.1390916, -0.3163357, 1.551767, 1, 1, 1, 1, 1,
0.1392676, 0.3671771, 0.1332938, 1, 1, 1, 1, 1,
0.1401381, 0.06630763, 1.737291, 1, 1, 1, 1, 1,
0.1410332, -1.48381, 2.110241, 1, 1, 1, 1, 1,
0.1415831, -1.21149, 1.98371, 1, 1, 1, 1, 1,
0.1432237, -0.5407685, 1.497554, 1, 1, 1, 1, 1,
0.1564558, -0.344381, 4.359113, 1, 1, 1, 1, 1,
0.1581682, -2.004097, 1.694234, 1, 1, 1, 1, 1,
0.1581698, 0.4960183, 0.6742792, 1, 1, 1, 1, 1,
0.1601321, -0.2316573, 1.585159, 1, 1, 1, 1, 1,
0.1619917, 0.9115264, 1.504651, 1, 1, 1, 1, 1,
0.1715772, 0.7414957, -1.352549, 1, 1, 1, 1, 1,
0.1719843, -0.9732096, 1.812614, 1, 1, 1, 1, 1,
0.1725573, 1.005312, -1.198047, 1, 1, 1, 1, 1,
0.1727615, -1.052757, 3.500153, 0, 0, 1, 1, 1,
0.1744801, -0.6583689, 2.569137, 1, 0, 0, 1, 1,
0.1811987, -1.137054, 2.64375, 1, 0, 0, 1, 1,
0.1825907, 1.43005, 0.6751593, 1, 0, 0, 1, 1,
0.1829257, 1.138168, 0.7350931, 1, 0, 0, 1, 1,
0.1834594, 0.588423, 0.1643625, 1, 0, 0, 1, 1,
0.18487, 1.066797, 1.990785, 0, 0, 0, 1, 1,
0.1878503, -1.288254, 3.788073, 0, 0, 0, 1, 1,
0.1888741, -1.105386, 1.520322, 0, 0, 0, 1, 1,
0.1891426, 0.513558, 0.6433938, 0, 0, 0, 1, 1,
0.1900972, 0.9658488, -0.2141224, 0, 0, 0, 1, 1,
0.1902156, -1.865474, 4.298132, 0, 0, 0, 1, 1,
0.1931561, -0.6338876, 1.393476, 0, 0, 0, 1, 1,
0.1992103, -1.590603, 3.283856, 1, 1, 1, 1, 1,
0.2001356, -1.906457, 1.958896, 1, 1, 1, 1, 1,
0.2062657, -0.236057, 1.93626, 1, 1, 1, 1, 1,
0.2067791, -0.08597302, 3.344493, 1, 1, 1, 1, 1,
0.2076775, -0.7180795, 2.830699, 1, 1, 1, 1, 1,
0.2092467, 1.173174, -0.4700495, 1, 1, 1, 1, 1,
0.2095403, -1.12099, 3.937167, 1, 1, 1, 1, 1,
0.2153301, -0.08872852, 2.305969, 1, 1, 1, 1, 1,
0.221511, 1.191981, 1.251255, 1, 1, 1, 1, 1,
0.2220474, -0.935141, 2.805439, 1, 1, 1, 1, 1,
0.2287719, -0.2493918, 5.741672, 1, 1, 1, 1, 1,
0.2319293, -0.2539808, 1.240281, 1, 1, 1, 1, 1,
0.2341996, -0.01921561, 2.170592, 1, 1, 1, 1, 1,
0.2385441, 0.9035683, 0.8347266, 1, 1, 1, 1, 1,
0.2396241, -0.1767515, 1.991123, 1, 1, 1, 1, 1,
0.2405608, -0.7216535, 3.137429, 0, 0, 1, 1, 1,
0.2436116, 2.057977, 1.429041, 1, 0, 0, 1, 1,
0.2440618, 0.949811, 0.09014792, 1, 0, 0, 1, 1,
0.2456795, -1.216119, 4.12335, 1, 0, 0, 1, 1,
0.2552133, 0.8226255, -0.02592485, 1, 0, 0, 1, 1,
0.2555167, 0.2647773, 1.391104, 1, 0, 0, 1, 1,
0.2568034, 0.7774739, 0.4993641, 0, 0, 0, 1, 1,
0.2571976, 1.132763, -0.1002666, 0, 0, 0, 1, 1,
0.2586553, -1.014882, 2.888817, 0, 0, 0, 1, 1,
0.261544, -0.3127172, 0.7835047, 0, 0, 0, 1, 1,
0.2668166, 1.041958, -1.19603, 0, 0, 0, 1, 1,
0.2735061, 0.2469563, 0.5758761, 0, 0, 0, 1, 1,
0.2740787, -0.2964697, 1.85914, 0, 0, 0, 1, 1,
0.2744543, -0.8531228, 2.375498, 1, 1, 1, 1, 1,
0.2846517, 0.4177026, 1.489159, 1, 1, 1, 1, 1,
0.2858297, -0.2884996, 2.100158, 1, 1, 1, 1, 1,
0.2865858, 0.5164803, 0.5302491, 1, 1, 1, 1, 1,
0.2870122, 0.02050964, 1.416389, 1, 1, 1, 1, 1,
0.2919809, 0.3787785, 0.8993399, 1, 1, 1, 1, 1,
0.2972012, -1.451037, 2.343036, 1, 1, 1, 1, 1,
0.2998094, -0.8200993, 3.502146, 1, 1, 1, 1, 1,
0.3040852, 0.07660744, 2.290289, 1, 1, 1, 1, 1,
0.3051657, 0.6211031, -1.183339, 1, 1, 1, 1, 1,
0.3070806, 0.7178618, 0.8347055, 1, 1, 1, 1, 1,
0.3085507, 0.3297778, 0.7009363, 1, 1, 1, 1, 1,
0.3127683, -1.708401, 1.338716, 1, 1, 1, 1, 1,
0.3163134, 0.6873804, 1.181855, 1, 1, 1, 1, 1,
0.3189971, -0.6445542, 3.777193, 1, 1, 1, 1, 1,
0.3238013, 1.233987, 0.7466852, 0, 0, 1, 1, 1,
0.3304342, -1.124242, 5.099551, 1, 0, 0, 1, 1,
0.3321842, -1.003331, 3.595859, 1, 0, 0, 1, 1,
0.3329667, 0.3629567, -0.961069, 1, 0, 0, 1, 1,
0.3337802, -0.8758729, 3.820886, 1, 0, 0, 1, 1,
0.336022, 1.027968, 0.9399112, 1, 0, 0, 1, 1,
0.3361492, -1.552161, 0.5815845, 0, 0, 0, 1, 1,
0.3380468, 1.485668, 1.287526, 0, 0, 0, 1, 1,
0.3431502, -0.8366764, 2.995241, 0, 0, 0, 1, 1,
0.3455195, 0.08897612, 1.405388, 0, 0, 0, 1, 1,
0.346724, -0.7967646, 4.610593, 0, 0, 0, 1, 1,
0.3572442, 0.4223983, 2.07274, 0, 0, 0, 1, 1,
0.3612608, 0.4733825, -0.1744219, 0, 0, 0, 1, 1,
0.362085, 1.400997, 1.586578, 1, 1, 1, 1, 1,
0.3625787, -0.6642369, 4.538063, 1, 1, 1, 1, 1,
0.3627921, 1.49209, 0.2236623, 1, 1, 1, 1, 1,
0.3657287, -0.3060023, 2.31364, 1, 1, 1, 1, 1,
0.3691759, 0.4075518, 1.826553, 1, 1, 1, 1, 1,
0.3698771, 0.1046268, 2.036907, 1, 1, 1, 1, 1,
0.3715121, 0.1703615, 4.654371, 1, 1, 1, 1, 1,
0.3719531, -0.6704898, 1.684206, 1, 1, 1, 1, 1,
0.3726153, -1.09933, 3.321974, 1, 1, 1, 1, 1,
0.3727965, 0.9613808, 0.5766423, 1, 1, 1, 1, 1,
0.3753227, 0.4355159, 0.6270109, 1, 1, 1, 1, 1,
0.3769944, 1.484944, -0.09247307, 1, 1, 1, 1, 1,
0.381013, -0.03498404, 3.347924, 1, 1, 1, 1, 1,
0.3822891, 0.2168021, 0.6710785, 1, 1, 1, 1, 1,
0.3844484, -1.346715, 2.102539, 1, 1, 1, 1, 1,
0.3879898, 1.596997, 1.263474, 0, 0, 1, 1, 1,
0.3898428, -0.2293548, 0.1280555, 1, 0, 0, 1, 1,
0.392558, -0.03608243, 0.6622855, 1, 0, 0, 1, 1,
0.3950069, 0.1416692, 1.078883, 1, 0, 0, 1, 1,
0.398067, -0.6365051, 2.697416, 1, 0, 0, 1, 1,
0.3984174, -1.479112, 4.364534, 1, 0, 0, 1, 1,
0.4025007, 1.222678, 0.5376202, 0, 0, 0, 1, 1,
0.4082862, 0.02186652, 1.04878, 0, 0, 0, 1, 1,
0.4083682, 0.5738207, 1.801977, 0, 0, 0, 1, 1,
0.4109069, -1.806146, -0.3841223, 0, 0, 0, 1, 1,
0.4170997, 0.9987301, -0.1787826, 0, 0, 0, 1, 1,
0.4226531, 0.9292908, 0.08868137, 0, 0, 0, 1, 1,
0.4244441, 1.636731, 0.7129495, 0, 0, 0, 1, 1,
0.4260862, -0.5579486, 2.898232, 1, 1, 1, 1, 1,
0.4262281, -0.1261348, 1.468957, 1, 1, 1, 1, 1,
0.4275483, -0.2440855, 1.47169, 1, 1, 1, 1, 1,
0.4325629, -1.13553, 2.535647, 1, 1, 1, 1, 1,
0.4357314, -0.0732695, 2.512235, 1, 1, 1, 1, 1,
0.4374804, 1.863759, 1.597893, 1, 1, 1, 1, 1,
0.4380509, -0.2353694, 0.9137609, 1, 1, 1, 1, 1,
0.4391106, 0.9084746, 2.337785, 1, 1, 1, 1, 1,
0.4396968, 0.765265, -1.179272, 1, 1, 1, 1, 1,
0.4444594, 0.1383562, 1.048453, 1, 1, 1, 1, 1,
0.4446585, -0.02911089, 1.057327, 1, 1, 1, 1, 1,
0.444922, 0.4668731, 0.7976236, 1, 1, 1, 1, 1,
0.4483106, 0.03105176, 1.900335, 1, 1, 1, 1, 1,
0.4506279, -0.1946146, 2.549796, 1, 1, 1, 1, 1,
0.4617924, -0.5584763, 1.621819, 1, 1, 1, 1, 1,
0.4655734, -1.076141, 4.193037, 0, 0, 1, 1, 1,
0.4680597, -0.8608489, 4.92762, 1, 0, 0, 1, 1,
0.470818, -0.5843372, -0.7030898, 1, 0, 0, 1, 1,
0.4718135, 0.8330473, -1.239318, 1, 0, 0, 1, 1,
0.4721519, 0.8871624, -0.7466539, 1, 0, 0, 1, 1,
0.4723579, -0.2014682, 0.5938841, 1, 0, 0, 1, 1,
0.4725118, 0.7318991, 0.6423263, 0, 0, 0, 1, 1,
0.4769654, 1.076291, 0.81161, 0, 0, 0, 1, 1,
0.4786435, 1.663352, 0.3168679, 0, 0, 0, 1, 1,
0.4821749, -2.257033, 3.860055, 0, 0, 0, 1, 1,
0.484501, -0.9612086, 2.653976, 0, 0, 0, 1, 1,
0.4877595, 0.1326534, 2.79117, 0, 0, 0, 1, 1,
0.4908129, -1.456942, 3.672217, 0, 0, 0, 1, 1,
0.4921774, 0.6352564, 1.609632, 1, 1, 1, 1, 1,
0.4922303, -0.2481415, 4.543862, 1, 1, 1, 1, 1,
0.493707, -0.8280419, 4.053535, 1, 1, 1, 1, 1,
0.5025126, 0.393281, 1.227128, 1, 1, 1, 1, 1,
0.503677, -1.024069, 3.157948, 1, 1, 1, 1, 1,
0.5043182, -1.019957, 3.012825, 1, 1, 1, 1, 1,
0.5057265, -1.601292, 2.477219, 1, 1, 1, 1, 1,
0.5086476, 2.573178, -0.1228922, 1, 1, 1, 1, 1,
0.5122682, 0.8131354, 1.093684, 1, 1, 1, 1, 1,
0.517332, 0.526798, 0.9681038, 1, 1, 1, 1, 1,
0.5199698, -1.702532, 4.28739, 1, 1, 1, 1, 1,
0.5213777, 0.6841989, 0.8785992, 1, 1, 1, 1, 1,
0.5233825, 0.3455499, 1.165365, 1, 1, 1, 1, 1,
0.5239115, 0.7112519, 0.4125114, 1, 1, 1, 1, 1,
0.5246587, 2.218283, 0.3185661, 1, 1, 1, 1, 1,
0.5320467, -0.4606053, 1.572495, 0, 0, 1, 1, 1,
0.5347598, -1.232541, 1.519726, 1, 0, 0, 1, 1,
0.535309, 0.06448572, 1.450089, 1, 0, 0, 1, 1,
0.5442427, -0.907539, 2.108697, 1, 0, 0, 1, 1,
0.5450819, -0.6554236, 4.214527, 1, 0, 0, 1, 1,
0.5472646, -0.8494079, 3.156306, 1, 0, 0, 1, 1,
0.5528665, 0.6149503, 2.137754, 0, 0, 0, 1, 1,
0.5529761, 1.182056, 0.6296754, 0, 0, 0, 1, 1,
0.5531639, -0.5655465, 1.618321, 0, 0, 0, 1, 1,
0.5541853, -0.5630972, 3.044031, 0, 0, 0, 1, 1,
0.560815, 0.5749211, 2.129116, 0, 0, 0, 1, 1,
0.5630844, -0.5597837, 2.421611, 0, 0, 0, 1, 1,
0.5653864, -1.826285, 1.534479, 0, 0, 0, 1, 1,
0.5706283, 0.5264817, 1.909492, 1, 1, 1, 1, 1,
0.5707836, -0.9141296, 2.065351, 1, 1, 1, 1, 1,
0.5721512, -0.8213316, 3.13755, 1, 1, 1, 1, 1,
0.5726824, 0.7858498, -0.4960935, 1, 1, 1, 1, 1,
0.573415, 1.30625, 1.848407, 1, 1, 1, 1, 1,
0.5747494, -0.2174388, 2.579799, 1, 1, 1, 1, 1,
0.5761957, -1.1168, 2.527715, 1, 1, 1, 1, 1,
0.5764073, 0.9653361, 1.479547, 1, 1, 1, 1, 1,
0.5775196, 0.808964, 1.834579, 1, 1, 1, 1, 1,
0.5782183, 0.05399385, 0.980561, 1, 1, 1, 1, 1,
0.5793523, -0.1436928, 1.349716, 1, 1, 1, 1, 1,
0.584277, -0.8449792, 1.580721, 1, 1, 1, 1, 1,
0.5862187, 1.382069, 1.851984, 1, 1, 1, 1, 1,
0.595118, -0.01765721, 1.566121, 1, 1, 1, 1, 1,
0.5968451, 0.2838481, -1.371801, 1, 1, 1, 1, 1,
0.5975058, 0.08042397, 1.140043, 0, 0, 1, 1, 1,
0.5979455, 1.357312, 1.022738, 1, 0, 0, 1, 1,
0.601153, 0.374903, 1.44491, 1, 0, 0, 1, 1,
0.6051386, -0.4506434, 1.344633, 1, 0, 0, 1, 1,
0.6058141, -1.228358, 1.200167, 1, 0, 0, 1, 1,
0.6091614, -0.2317855, 2.035998, 1, 0, 0, 1, 1,
0.611675, -1.032535, 2.349788, 0, 0, 0, 1, 1,
0.6129309, -1.233026, 3.612903, 0, 0, 0, 1, 1,
0.6184243, -2.127921, 3.175982, 0, 0, 0, 1, 1,
0.6219783, -1.075491, 2.255226, 0, 0, 0, 1, 1,
0.6361445, 1.082392, 0.2587225, 0, 0, 0, 1, 1,
0.6363664, 1.202693, 1.455191, 0, 0, 0, 1, 1,
0.6376085, -0.9593995, 1.743015, 0, 0, 0, 1, 1,
0.640177, 0.1162835, 2.325385, 1, 1, 1, 1, 1,
0.6463839, -1.699804, 3.640829, 1, 1, 1, 1, 1,
0.662277, 0.3485878, 0.290396, 1, 1, 1, 1, 1,
0.67591, 1.940369, -0.7824703, 1, 1, 1, 1, 1,
0.6773223, -1.292997, 1.743209, 1, 1, 1, 1, 1,
0.6798041, -1.093414, 3.954492, 1, 1, 1, 1, 1,
0.6821927, -1.441661, 2.330843, 1, 1, 1, 1, 1,
0.6825723, -0.1940011, 2.058854, 1, 1, 1, 1, 1,
0.6853475, -0.2140068, 2.925347, 1, 1, 1, 1, 1,
0.6869564, -2.290237, 0.7813253, 1, 1, 1, 1, 1,
0.690227, 1.071198, 1.560128, 1, 1, 1, 1, 1,
0.6972574, 1.191455, 1.954113, 1, 1, 1, 1, 1,
0.6975875, 0.6744825, 2.160489, 1, 1, 1, 1, 1,
0.7006104, 2.142507, 1.555302, 1, 1, 1, 1, 1,
0.7033418, 0.4141217, 1.265557, 1, 1, 1, 1, 1,
0.7073863, -0.3282222, 0.7908757, 0, 0, 1, 1, 1,
0.7113023, 0.4452178, 0.2597942, 1, 0, 0, 1, 1,
0.7174744, 0.6106651, 0.5581533, 1, 0, 0, 1, 1,
0.7184943, 1.205151, 1.212865, 1, 0, 0, 1, 1,
0.7205803, 0.2514108, -1.064249, 1, 0, 0, 1, 1,
0.7223169, 0.1828911, 1.80707, 1, 0, 0, 1, 1,
0.7239534, 0.409833, 1.358979, 0, 0, 0, 1, 1,
0.7276794, 0.6644589, 2.38491, 0, 0, 0, 1, 1,
0.7278507, -1.993908, 2.075335, 0, 0, 0, 1, 1,
0.7299529, 0.7456729, 0.9732617, 0, 0, 0, 1, 1,
0.7328005, -0.754335, 3.84285, 0, 0, 0, 1, 1,
0.7372484, 0.3588685, 1.250625, 0, 0, 0, 1, 1,
0.7456981, 0.1818981, 2.294897, 0, 0, 0, 1, 1,
0.7463293, 0.9727759, -2.065249, 1, 1, 1, 1, 1,
0.7463818, -1.463904, 1.951066, 1, 1, 1, 1, 1,
0.7507564, 0.5036618, 1.929723, 1, 1, 1, 1, 1,
0.7520439, -1.087972, 2.188912, 1, 1, 1, 1, 1,
0.7543228, 2.353668, 0.2521595, 1, 1, 1, 1, 1,
0.7546372, -0.5619764, 2.192935, 1, 1, 1, 1, 1,
0.7595058, -0.4715255, 1.429977, 1, 1, 1, 1, 1,
0.7641533, 1.337847, -0.5827002, 1, 1, 1, 1, 1,
0.7711305, 0.6321377, -0.4487084, 1, 1, 1, 1, 1,
0.7738154, 0.9093081, 4.438598, 1, 1, 1, 1, 1,
0.7782928, -1.593281, 2.753049, 1, 1, 1, 1, 1,
0.7822803, -0.2270048, 2.159242, 1, 1, 1, 1, 1,
0.7845654, 0.8641925, 1.377079, 1, 1, 1, 1, 1,
0.7846, -0.2211262, 1.288382, 1, 1, 1, 1, 1,
0.78689, -0.6033589, 2.223908, 1, 1, 1, 1, 1,
0.7903597, 0.03807612, 1.374305, 0, 0, 1, 1, 1,
0.7915336, -1.714913, 1.254898, 1, 0, 0, 1, 1,
0.7937636, -0.3701132, 2.123597, 1, 0, 0, 1, 1,
0.7957113, 0.04573148, 1.922616, 1, 0, 0, 1, 1,
0.8004499, -0.7498882, 1.755778, 1, 0, 0, 1, 1,
0.8043705, 1.135953, 0.1991411, 1, 0, 0, 1, 1,
0.805765, 0.2432561, 0.1896348, 0, 0, 0, 1, 1,
0.8070995, -0.1291059, 2.403664, 0, 0, 0, 1, 1,
0.809981, -0.3399311, 0.6532592, 0, 0, 0, 1, 1,
0.8117723, -0.3147751, 1.981776, 0, 0, 0, 1, 1,
0.8142924, -0.5058175, 2.31458, 0, 0, 0, 1, 1,
0.8211315, 1.11005, -0.6057386, 0, 0, 0, 1, 1,
0.8261974, -1.04355, 2.812554, 0, 0, 0, 1, 1,
0.8291826, -1.567965, 3.128656, 1, 1, 1, 1, 1,
0.8304363, -0.399206, 2.760664, 1, 1, 1, 1, 1,
0.8345423, 0.7496071, 2.442243, 1, 1, 1, 1, 1,
0.836686, -2.188067, 1.214744, 1, 1, 1, 1, 1,
0.8397445, 0.8745885, 1.019686, 1, 1, 1, 1, 1,
0.8430726, -0.9085982, 2.802409, 1, 1, 1, 1, 1,
0.8455334, -0.01811055, 3.135055, 1, 1, 1, 1, 1,
0.8456709, -0.9172522, 1.991216, 1, 1, 1, 1, 1,
0.847067, 1.247382, 3.860825, 1, 1, 1, 1, 1,
0.8490855, -0.5368655, 0.4832113, 1, 1, 1, 1, 1,
0.8541793, -0.7777357, 3.35222, 1, 1, 1, 1, 1,
0.8550759, -0.03716126, 3.097726, 1, 1, 1, 1, 1,
0.8640867, -2.863997, 3.536035, 1, 1, 1, 1, 1,
0.8643126, -0.0134181, 4.348276, 1, 1, 1, 1, 1,
0.8649549, 0.1059432, 2.402264, 1, 1, 1, 1, 1,
0.8651327, -1.050393, 3.170473, 0, 0, 1, 1, 1,
0.869315, -0.5778311, 2.190708, 1, 0, 0, 1, 1,
0.8732262, -1.23129, 2.065574, 1, 0, 0, 1, 1,
0.8738889, 0.9947339, -0.3884764, 1, 0, 0, 1, 1,
0.8744953, 0.3719968, 1.454123, 1, 0, 0, 1, 1,
0.8756042, -2.525504, 2.505152, 1, 0, 0, 1, 1,
0.876514, -1.262836, 3.607428, 0, 0, 0, 1, 1,
0.8832133, 0.797397, 2.320787, 0, 0, 0, 1, 1,
0.890518, -0.889447, 1.936156, 0, 0, 0, 1, 1,
0.8916346, -0.08020946, 2.523649, 0, 0, 0, 1, 1,
0.8953611, -1.431387, 2.977847, 0, 0, 0, 1, 1,
0.8954439, 0.3040774, 1.053537, 0, 0, 0, 1, 1,
0.8970931, 0.8015796, -0.282811, 0, 0, 0, 1, 1,
0.9012585, 0.00957763, 2.324602, 1, 1, 1, 1, 1,
0.9179609, -0.03050923, -1.132473, 1, 1, 1, 1, 1,
0.9202061, 0.3161526, 0.9926721, 1, 1, 1, 1, 1,
0.9212564, 0.3229748, -0.5525619, 1, 1, 1, 1, 1,
0.9253146, -0.2640938, 1.821261, 1, 1, 1, 1, 1,
0.9309127, -0.6856149, 2.529456, 1, 1, 1, 1, 1,
0.9353701, 1.57669, 2.0189, 1, 1, 1, 1, 1,
0.9376746, 0.05459388, 2.911936, 1, 1, 1, 1, 1,
0.9418843, 0.07480433, 3.494135, 1, 1, 1, 1, 1,
0.9481212, -0.0360727, 2.636719, 1, 1, 1, 1, 1,
0.9494015, 0.08408451, 1.914593, 1, 1, 1, 1, 1,
0.9517196, -0.01408053, 3.124481, 1, 1, 1, 1, 1,
0.9532241, 0.178664, 1.586625, 1, 1, 1, 1, 1,
0.9547206, -1.966092, 2.351705, 1, 1, 1, 1, 1,
0.9548578, -0.5368688, 3.312617, 1, 1, 1, 1, 1,
0.9558164, 0.2657247, 0.3217309, 0, 0, 1, 1, 1,
0.9607882, 0.3692243, 1.480253, 1, 0, 0, 1, 1,
0.9624965, 1.133337, 1.203919, 1, 0, 0, 1, 1,
0.9854591, -0.8239184, 0.7841975, 1, 0, 0, 1, 1,
0.987393, -1.177303, 2.952309, 1, 0, 0, 1, 1,
0.992462, -3.07405, 2.659347, 1, 0, 0, 1, 1,
1.001406, 0.6665279, -0.07661887, 0, 0, 0, 1, 1,
1.001845, 1.35085, 0.9266561, 0, 0, 0, 1, 1,
1.012228, -1.119081, 3.424417, 0, 0, 0, 1, 1,
1.021893, -1.397405, 1.285605, 0, 0, 0, 1, 1,
1.02337, -0.6888494, 1.854618, 0, 0, 0, 1, 1,
1.026744, -1.411135, 3.432935, 0, 0, 0, 1, 1,
1.037425, 0.7057772, 2.392422, 0, 0, 0, 1, 1,
1.038864, 0.02262182, 1.067686, 1, 1, 1, 1, 1,
1.043731, 1.207842, 1.836444, 1, 1, 1, 1, 1,
1.046192, -1.023217, 4.067521, 1, 1, 1, 1, 1,
1.046514, -0.8469132, 2.211085, 1, 1, 1, 1, 1,
1.06044, -0.03343509, 0.8320469, 1, 1, 1, 1, 1,
1.070043, -0.5300381, 3.801944, 1, 1, 1, 1, 1,
1.071476, -0.02612993, 1.31365, 1, 1, 1, 1, 1,
1.072936, 0.4417679, 3.376211, 1, 1, 1, 1, 1,
1.084162, -0.6889981, 1.484697, 1, 1, 1, 1, 1,
1.085506, -1.251918, 2.729167, 1, 1, 1, 1, 1,
1.095834, -1.742903, 4.735328, 1, 1, 1, 1, 1,
1.100012, -0.07925049, 2.476758, 1, 1, 1, 1, 1,
1.101377, 0.1634142, 2.890265, 1, 1, 1, 1, 1,
1.102858, 0.01876103, 1.39201, 1, 1, 1, 1, 1,
1.104077, 1.388279, -0.2481786, 1, 1, 1, 1, 1,
1.104593, 2.100718, 0.6709729, 0, 0, 1, 1, 1,
1.118008, 0.4209664, -0.06507654, 1, 0, 0, 1, 1,
1.11882, 0.1984079, -0.0884117, 1, 0, 0, 1, 1,
1.119392, 0.576472, 0.4079687, 1, 0, 0, 1, 1,
1.120337, 0.6600865, 1.731171, 1, 0, 0, 1, 1,
1.130025, 1.501628, -0.9678646, 1, 0, 0, 1, 1,
1.136433, -0.563559, 2.669511, 0, 0, 0, 1, 1,
1.148868, 0.52427, 3.308676, 0, 0, 0, 1, 1,
1.158728, 0.1371286, 1.865325, 0, 0, 0, 1, 1,
1.176922, 0.2847254, -0.2015867, 0, 0, 0, 1, 1,
1.190585, -0.5045927, 2.756485, 0, 0, 0, 1, 1,
1.191226, -0.7770054, 0.5858045, 0, 0, 0, 1, 1,
1.212497, 0.7756669, -1.20564, 0, 0, 0, 1, 1,
1.216292, -0.1389217, 1.93415, 1, 1, 1, 1, 1,
1.224506, -1.314657, 2.006411, 1, 1, 1, 1, 1,
1.228397, -0.5649404, 1.26422, 1, 1, 1, 1, 1,
1.230801, -0.6889349, 3.402622, 1, 1, 1, 1, 1,
1.241448, 0.7156829, 1.030908, 1, 1, 1, 1, 1,
1.241547, 0.4242527, -0.1049498, 1, 1, 1, 1, 1,
1.248668, 0.8087537, 2.000645, 1, 1, 1, 1, 1,
1.255247, 1.658932, -0.1019244, 1, 1, 1, 1, 1,
1.260467, 0.3789481, 0.5991945, 1, 1, 1, 1, 1,
1.280971, 0.1763491, 1.564861, 1, 1, 1, 1, 1,
1.294706, 0.7751828, -1.666335, 1, 1, 1, 1, 1,
1.297416, 0.348339, 1.365128, 1, 1, 1, 1, 1,
1.297678, -0.5000361, 1.738762, 1, 1, 1, 1, 1,
1.307065, 1.004009, 0.8585967, 1, 1, 1, 1, 1,
1.307609, 0.2469206, 2.928166, 1, 1, 1, 1, 1,
1.314956, -0.6211303, 1.872476, 0, 0, 1, 1, 1,
1.318503, -0.2740795, -0.1901738, 1, 0, 0, 1, 1,
1.32188, -1.961056, 1.994771, 1, 0, 0, 1, 1,
1.326336, -0.3447937, 0.7332092, 1, 0, 0, 1, 1,
1.327847, 1.036318, 1.347496, 1, 0, 0, 1, 1,
1.329049, 0.08155739, 0.9888082, 1, 0, 0, 1, 1,
1.330275, 0.3363504, 1.038054, 0, 0, 0, 1, 1,
1.334289, -2.729022, 1.862859, 0, 0, 0, 1, 1,
1.34289, -0.8032209, 1.447911, 0, 0, 0, 1, 1,
1.345594, -1.168854, 2.819422, 0, 0, 0, 1, 1,
1.348947, 0.1648197, 0.8762364, 0, 0, 0, 1, 1,
1.354883, 0.8748584, 1.79445, 0, 0, 0, 1, 1,
1.357856, -0.513348, 2.419727, 0, 0, 0, 1, 1,
1.361219, 1.39037, -0.6076726, 1, 1, 1, 1, 1,
1.368895, -0.8409489, 2.53463, 1, 1, 1, 1, 1,
1.370369, 0.06534217, 0.5963316, 1, 1, 1, 1, 1,
1.370944, -0.5327319, 2.545454, 1, 1, 1, 1, 1,
1.379395, -1.658861, 2.048421, 1, 1, 1, 1, 1,
1.379674, -0.494355, 1.825976, 1, 1, 1, 1, 1,
1.386946, -1.074373, 0.9784418, 1, 1, 1, 1, 1,
1.38965, 1.041167, 2.927559, 1, 1, 1, 1, 1,
1.392388, 0.1434758, 1.417722, 1, 1, 1, 1, 1,
1.392918, -0.1194163, 1.835934, 1, 1, 1, 1, 1,
1.416768, -2.324318, 4.223612, 1, 1, 1, 1, 1,
1.418192, 0.4122643, 1.53453, 1, 1, 1, 1, 1,
1.42202, 0.8653954, 0.8402986, 1, 1, 1, 1, 1,
1.442256, 0.4321351, 2.330647, 1, 1, 1, 1, 1,
1.450267, 0.5492293, -0.8894157, 1, 1, 1, 1, 1,
1.461549, 0.5776095, 2.651317, 0, 0, 1, 1, 1,
1.471325, -0.4640393, 2.495178, 1, 0, 0, 1, 1,
1.475094, -0.1437246, 2.62724, 1, 0, 0, 1, 1,
1.47513, 0.2509736, 2.26568, 1, 0, 0, 1, 1,
1.480887, 2.687228, 0.8069763, 1, 0, 0, 1, 1,
1.4859, -0.9786392, 1.929885, 1, 0, 0, 1, 1,
1.506691, 0.9873739, 0.7175196, 0, 0, 0, 1, 1,
1.507027, -0.4427756, 2.36105, 0, 0, 0, 1, 1,
1.51238, -0.3249634, 0.6326959, 0, 0, 0, 1, 1,
1.528704, 0.4511587, 2.179167, 0, 0, 0, 1, 1,
1.535492, 1.172849, 0.3703077, 0, 0, 0, 1, 1,
1.539233, 0.6712089, 1.106039, 0, 0, 0, 1, 1,
1.54329, -0.8798036, 3.863964, 0, 0, 0, 1, 1,
1.543537, -0.1761857, 1.891217, 1, 1, 1, 1, 1,
1.545679, 0.4234816, 0.558463, 1, 1, 1, 1, 1,
1.558882, -0.4181954, 0.6888922, 1, 1, 1, 1, 1,
1.564872, -0.6013127, 0.180982, 1, 1, 1, 1, 1,
1.575611, -0.481903, -0.2169897, 1, 1, 1, 1, 1,
1.597598, 1.396225, 2.595723, 1, 1, 1, 1, 1,
1.600187, 0.3382881, -0.02489039, 1, 1, 1, 1, 1,
1.610895, -0.5640118, 0.9869317, 1, 1, 1, 1, 1,
1.615257, -0.9085582, 3.061055, 1, 1, 1, 1, 1,
1.615615, 0.1837464, 1.103742, 1, 1, 1, 1, 1,
1.616031, -1.301425, 0.8410771, 1, 1, 1, 1, 1,
1.626363, -0.2448422, 2.579725, 1, 1, 1, 1, 1,
1.630861, -0.09175277, 1.059415, 1, 1, 1, 1, 1,
1.633749, 0.1297954, 1.357741, 1, 1, 1, 1, 1,
1.648982, 0.3334935, 0.7642087, 1, 1, 1, 1, 1,
1.650546, 0.3563699, 0.9218222, 0, 0, 1, 1, 1,
1.66803, -0.533375, 1.086717, 1, 0, 0, 1, 1,
1.679971, 0.7835744, 3.806276, 1, 0, 0, 1, 1,
1.68907, -0.8239908, 1.294066, 1, 0, 0, 1, 1,
1.695606, 0.4956886, 1.365679, 1, 0, 0, 1, 1,
1.698865, 0.1791074, 0.03199032, 1, 0, 0, 1, 1,
1.725111, -1.21616, 3.861181, 0, 0, 0, 1, 1,
1.731437, 0.9298586, 0.8777072, 0, 0, 0, 1, 1,
1.734406, 1.057701, 1.976898, 0, 0, 0, 1, 1,
1.736973, -0.03702306, 2.178082, 0, 0, 0, 1, 1,
1.758632, -0.04068586, 0.6726468, 0, 0, 0, 1, 1,
1.772943, 0.5935984, 0.9179725, 0, 0, 0, 1, 1,
1.772964, -0.589736, 2.408957, 0, 0, 0, 1, 1,
1.793722, 0.8265691, 0.6086797, 1, 1, 1, 1, 1,
1.817347, -1.714302, 2.541862, 1, 1, 1, 1, 1,
1.8383, 0.9969424, 2.159621, 1, 1, 1, 1, 1,
1.880891, -0.7455148, 2.9611, 1, 1, 1, 1, 1,
1.893786, -0.9804229, 2.307954, 1, 1, 1, 1, 1,
1.951562, 1.67845, 0.8450153, 1, 1, 1, 1, 1,
1.951993, 1.353716, 1.957531, 1, 1, 1, 1, 1,
1.954948, 0.1529323, 3.328159, 1, 1, 1, 1, 1,
1.960715, -0.2731306, 1.564794, 1, 1, 1, 1, 1,
1.963513, 0.8313377, 1.106374, 1, 1, 1, 1, 1,
1.99668, 2.128478, 1.39214, 1, 1, 1, 1, 1,
2.008352, 1.020262, 1.115689, 1, 1, 1, 1, 1,
2.029891, 0.3821391, -0.01218975, 1, 1, 1, 1, 1,
2.037606, -0.4389845, 0.07475704, 1, 1, 1, 1, 1,
2.040956, 1.739014, 0.9587138, 1, 1, 1, 1, 1,
2.061541, -0.1400485, 1.692141, 0, 0, 1, 1, 1,
2.110388, 0.6989732, 0.6083491, 1, 0, 0, 1, 1,
2.135927, 1.275317, 1.05594, 1, 0, 0, 1, 1,
2.136069, 0.4201524, 0.720486, 1, 0, 0, 1, 1,
2.143745, -0.2017899, 3.278581, 1, 0, 0, 1, 1,
2.157475, -0.3601321, 3.59482, 1, 0, 0, 1, 1,
2.166989, -0.8750297, 2.647949, 0, 0, 0, 1, 1,
2.167881, 0.9160514, 0.4408468, 0, 0, 0, 1, 1,
2.17792, -1.659207, 1.733111, 0, 0, 0, 1, 1,
2.182356, 0.2037173, 1.541768, 0, 0, 0, 1, 1,
2.237057, -1.87998, 1.577739, 0, 0, 0, 1, 1,
2.266978, 0.07229061, 2.61734, 0, 0, 0, 1, 1,
2.329463, 0.03002749, 1.837838, 0, 0, 0, 1, 1,
2.497854, -0.3149575, 3.245771, 1, 1, 1, 1, 1,
2.507435, 1.214896, -0.9520401, 1, 1, 1, 1, 1,
2.59035, 0.0199082, 1.794508, 1, 1, 1, 1, 1,
2.607147, -0.6113834, 2.807174, 1, 1, 1, 1, 1,
2.613552, 0.8852609, -0.5141698, 1, 1, 1, 1, 1,
2.699316, 1.509032, 1.161325, 1, 1, 1, 1, 1,
2.937563, 1.467272, 1.778445, 1, 1, 1, 1, 1
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
var radius = 9.573344;
var distance = 33.62597;
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
mvMatrix.translate( -0.07027078, 0.1939197, -0.191669 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62597);
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
