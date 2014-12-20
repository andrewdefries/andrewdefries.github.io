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
-2.913843, -0.6312765, -1.917596, 1, 0, 0, 1,
-2.835361, 0.4997577, -1.846883, 1, 0.007843138, 0, 1,
-2.70808, 0.4347051, -2.608088, 1, 0.01176471, 0, 1,
-2.655297, -0.4924088, -3.073754, 1, 0.01960784, 0, 1,
-2.59817, 0.7250832, -2.670456, 1, 0.02352941, 0, 1,
-2.470325, 1.091638, -0.7312898, 1, 0.03137255, 0, 1,
-2.445471, -0.4802448, -1.363691, 1, 0.03529412, 0, 1,
-2.319791, -0.2853091, -2.149817, 1, 0.04313726, 0, 1,
-2.264802, 1.051724, -1.716961, 1, 0.04705882, 0, 1,
-2.250516, 0.7604324, -0.7191243, 1, 0.05490196, 0, 1,
-2.186693, 0.6598938, -0.7064729, 1, 0.05882353, 0, 1,
-2.157379, -0.5011867, -2.439365, 1, 0.06666667, 0, 1,
-2.155617, 0.3807243, -3.094636, 1, 0.07058824, 0, 1,
-2.154978, -0.4921705, -1.19063, 1, 0.07843138, 0, 1,
-2.110995, 1.004479, -2.20624, 1, 0.08235294, 0, 1,
-2.095257, -1.771186, -2.973082, 1, 0.09019608, 0, 1,
-2.091497, -0.4170371, -1.446072, 1, 0.09411765, 0, 1,
-2.08689, -1.383061, -1.756652, 1, 0.1019608, 0, 1,
-2.059298, 0.6393844, -0.8971122, 1, 0.1098039, 0, 1,
-2.054711, -0.1421769, -3.300252, 1, 0.1137255, 0, 1,
-2.020226, 0.1515119, -0.1374584, 1, 0.1215686, 0, 1,
-1.999162, 0.4517935, -2.250284, 1, 0.1254902, 0, 1,
-1.977758, -1.0626, -1.172903, 1, 0.1333333, 0, 1,
-1.965294, -1.725585, -1.065839, 1, 0.1372549, 0, 1,
-1.946678, -0.6491339, -3.389615, 1, 0.145098, 0, 1,
-1.915598, 0.7479472, -1.551504, 1, 0.1490196, 0, 1,
-1.899275, 0.1456092, -1.6454, 1, 0.1568628, 0, 1,
-1.893667, 1.394091, -1.141998, 1, 0.1607843, 0, 1,
-1.87745, 0.6453778, 0.3178296, 1, 0.1686275, 0, 1,
-1.862526, -1.157154, -0.6696146, 1, 0.172549, 0, 1,
-1.854486, 1.464285, -0.2332553, 1, 0.1803922, 0, 1,
-1.823366, -0.883078, -2.567215, 1, 0.1843137, 0, 1,
-1.82196, -1.21837, -3.062493, 1, 0.1921569, 0, 1,
-1.817123, -1.011118, -2.791756, 1, 0.1960784, 0, 1,
-1.80163, 0.2013281, -1.471273, 1, 0.2039216, 0, 1,
-1.784208, -0.1696914, -2.7858, 1, 0.2117647, 0, 1,
-1.779499, 0.8772481, -1.648921, 1, 0.2156863, 0, 1,
-1.774122, -0.8986499, -2.270796, 1, 0.2235294, 0, 1,
-1.755466, 1.610453, -0.4617774, 1, 0.227451, 0, 1,
-1.740833, -0.5300106, -1.421772, 1, 0.2352941, 0, 1,
-1.711565, 1.241372, 0.6813628, 1, 0.2392157, 0, 1,
-1.688591, -0.4957256, -3.596334, 1, 0.2470588, 0, 1,
-1.677953, 0.5824297, -2.382744, 1, 0.2509804, 0, 1,
-1.67462, 0.2025234, -2.043361, 1, 0.2588235, 0, 1,
-1.649367, 0.4824387, -1.887875, 1, 0.2627451, 0, 1,
-1.641373, 0.2333321, -0.5151331, 1, 0.2705882, 0, 1,
-1.639072, 0.2083014, -2.041364, 1, 0.2745098, 0, 1,
-1.633576, -0.3919935, -2.192255, 1, 0.282353, 0, 1,
-1.62627, -0.5281609, -1.767108, 1, 0.2862745, 0, 1,
-1.610633, -0.6070736, 0.4204677, 1, 0.2941177, 0, 1,
-1.603664, -1.032066, -2.736943, 1, 0.3019608, 0, 1,
-1.60255, -0.3051673, -0.4404789, 1, 0.3058824, 0, 1,
-1.564141, 0.04582895, -1.563682, 1, 0.3137255, 0, 1,
-1.560868, -3.121618, -2.353695, 1, 0.3176471, 0, 1,
-1.56067, -0.2683187, -2.60359, 1, 0.3254902, 0, 1,
-1.544682, -0.4402452, -0.2608131, 1, 0.3294118, 0, 1,
-1.537725, 0.09116155, -2.581021, 1, 0.3372549, 0, 1,
-1.528372, -0.5617552, -2.189399, 1, 0.3411765, 0, 1,
-1.514671, 0.180267, -0.9225017, 1, 0.3490196, 0, 1,
-1.504541, -0.1878605, -2.151373, 1, 0.3529412, 0, 1,
-1.49314, 0.379586, -0.6911247, 1, 0.3607843, 0, 1,
-1.489962, -0.7607893, -1.681695, 1, 0.3647059, 0, 1,
-1.487559, -0.2816751, -2.01906, 1, 0.372549, 0, 1,
-1.482038, -1.458605, -1.397755, 1, 0.3764706, 0, 1,
-1.459549, 0.1850825, -0.1063463, 1, 0.3843137, 0, 1,
-1.454256, 0.5932582, -0.2161267, 1, 0.3882353, 0, 1,
-1.448212, -0.958988, -2.961797, 1, 0.3960784, 0, 1,
-1.44051, -0.1897491, -2.627791, 1, 0.4039216, 0, 1,
-1.434562, -0.8885792, -3.261973, 1, 0.4078431, 0, 1,
-1.433558, 0.1155876, -1.052009, 1, 0.4156863, 0, 1,
-1.432934, 0.7027935, 1.169957, 1, 0.4196078, 0, 1,
-1.431801, 0.2392185, -1.492538, 1, 0.427451, 0, 1,
-1.420316, 0.05585221, -1.886194, 1, 0.4313726, 0, 1,
-1.409358, -0.1626944, -0.9198507, 1, 0.4392157, 0, 1,
-1.387862, 1.535274, -1.536758, 1, 0.4431373, 0, 1,
-1.384489, -0.4847257, -0.8062405, 1, 0.4509804, 0, 1,
-1.378784, -0.4376184, -3.300886, 1, 0.454902, 0, 1,
-1.368899, -0.7157876, -2.695612, 1, 0.4627451, 0, 1,
-1.352897, -0.2017919, -0.05765997, 1, 0.4666667, 0, 1,
-1.347409, 0.08159568, -1.254339, 1, 0.4745098, 0, 1,
-1.345613, -0.5343211, 1.319807, 1, 0.4784314, 0, 1,
-1.345358, 1.588893, -1.854749, 1, 0.4862745, 0, 1,
-1.343136, 0.3537794, -1.803965, 1, 0.4901961, 0, 1,
-1.324333, 1.414976, 0.2966079, 1, 0.4980392, 0, 1,
-1.324225, -0.2360849, -1.223608, 1, 0.5058824, 0, 1,
-1.323768, 0.9201839, -1.007473, 1, 0.509804, 0, 1,
-1.314678, -0.02399049, -0.8114573, 1, 0.5176471, 0, 1,
-1.314128, -0.1921893, -3.138827, 1, 0.5215687, 0, 1,
-1.313195, 1.372286, -0.4434023, 1, 0.5294118, 0, 1,
-1.308121, 0.01549883, 0.5453651, 1, 0.5333334, 0, 1,
-1.303252, -0.4773184, -1.194993, 1, 0.5411765, 0, 1,
-1.298822, 0.4121922, -1.758684, 1, 0.5450981, 0, 1,
-1.294901, -0.1657938, -0.7220287, 1, 0.5529412, 0, 1,
-1.283556, -1.129913, -1.505379, 1, 0.5568628, 0, 1,
-1.282648, 0.9181082, -0.9501792, 1, 0.5647059, 0, 1,
-1.277589, -0.2372543, -1.345606, 1, 0.5686275, 0, 1,
-1.271444, 0.8447212, -2.010784, 1, 0.5764706, 0, 1,
-1.269792, 0.462368, -0.3546813, 1, 0.5803922, 0, 1,
-1.23287, -0.1923615, -1.336004, 1, 0.5882353, 0, 1,
-1.230117, 1.713959, -2.19699, 1, 0.5921569, 0, 1,
-1.21284, -1.001625, -3.005713, 1, 0.6, 0, 1,
-1.209561, 0.02760965, -2.230992, 1, 0.6078432, 0, 1,
-1.20559, -0.5388741, -3.149661, 1, 0.6117647, 0, 1,
-1.195215, 2.800247, -0.6750348, 1, 0.6196079, 0, 1,
-1.191784, 1.060424, 0.1577746, 1, 0.6235294, 0, 1,
-1.175631, 0.07639594, -2.24466, 1, 0.6313726, 0, 1,
-1.166212, -1.1499, -3.901303, 1, 0.6352941, 0, 1,
-1.159098, -0.5934407, -1.904181, 1, 0.6431373, 0, 1,
-1.156122, -1.18397, -2.452502, 1, 0.6470588, 0, 1,
-1.15499, 0.4509779, 0.9554275, 1, 0.654902, 0, 1,
-1.151477, -1.013051, -2.233028, 1, 0.6588235, 0, 1,
-1.149686, -1.14308, -3.732015, 1, 0.6666667, 0, 1,
-1.141775, 0.3018555, -1.225963, 1, 0.6705883, 0, 1,
-1.136455, -0.3906339, -3.418052, 1, 0.6784314, 0, 1,
-1.121446, 0.332567, -0.5913885, 1, 0.682353, 0, 1,
-1.120428, 0.2266096, -0.6685965, 1, 0.6901961, 0, 1,
-1.112297, 1.224445, -1.147977, 1, 0.6941177, 0, 1,
-1.111072, -2.15561, -2.71766, 1, 0.7019608, 0, 1,
-1.106637, 0.09340794, -2.451272, 1, 0.7098039, 0, 1,
-1.105346, -1.898042, -3.990005, 1, 0.7137255, 0, 1,
-1.103348, 0.734147, 0.5629455, 1, 0.7215686, 0, 1,
-1.102704, -0.03738289, -1.444435, 1, 0.7254902, 0, 1,
-1.090205, -0.1548262, 0.04515908, 1, 0.7333333, 0, 1,
-1.087901, -0.7043191, -1.189796, 1, 0.7372549, 0, 1,
-1.085933, 1.11496, -1.284497, 1, 0.7450981, 0, 1,
-1.076463, -0.3560618, -1.457557, 1, 0.7490196, 0, 1,
-1.072166, -2.940596, -1.903921, 1, 0.7568628, 0, 1,
-1.069615, 0.6862554, -0.4884638, 1, 0.7607843, 0, 1,
-1.063859, 0.08798058, -2.536041, 1, 0.7686275, 0, 1,
-1.063069, -1.58328, -3.27191, 1, 0.772549, 0, 1,
-1.05951, -0.9810113, -1.889262, 1, 0.7803922, 0, 1,
-1.053637, 0.336331, -0.634597, 1, 0.7843137, 0, 1,
-1.053312, 0.5139902, -3.049301, 1, 0.7921569, 0, 1,
-1.053197, 2.634966, -0.8946811, 1, 0.7960784, 0, 1,
-1.052395, -1.188292, -3.069096, 1, 0.8039216, 0, 1,
-1.048676, -0.7975808, -2.857963, 1, 0.8117647, 0, 1,
-1.046931, 0.6313637, -0.9503223, 1, 0.8156863, 0, 1,
-1.042787, -1.157633, -2.340363, 1, 0.8235294, 0, 1,
-1.040766, -0.3435409, -0.9465008, 1, 0.827451, 0, 1,
-1.036496, 0.5189435, -0.6727924, 1, 0.8352941, 0, 1,
-1.03647, -1.881206, -4.524045, 1, 0.8392157, 0, 1,
-1.033545, 0.3715683, -1.316093, 1, 0.8470588, 0, 1,
-1.031474, 0.380106, -1.047378, 1, 0.8509804, 0, 1,
-1.026786, 0.6014478, 1.041771, 1, 0.8588235, 0, 1,
-1.024269, 0.4907354, -0.8846865, 1, 0.8627451, 0, 1,
-1.013646, 0.5058917, -0.2766787, 1, 0.8705882, 0, 1,
-1.012483, -0.4886005, -3.544795, 1, 0.8745098, 0, 1,
-1.012138, -1.715023, -1.853756, 1, 0.8823529, 0, 1,
-1.010725, -0.7971573, -1.563622, 1, 0.8862745, 0, 1,
-1.009577, 0.4003068, -2.617111, 1, 0.8941177, 0, 1,
-1.007134, 0.6492143, -0.4640331, 1, 0.8980392, 0, 1,
-1.006119, -0.6413596, -2.628174, 1, 0.9058824, 0, 1,
-1.005373, 0.5157712, -2.023498, 1, 0.9137255, 0, 1,
-1.005005, -0.8406965, -0.8763084, 1, 0.9176471, 0, 1,
-0.9948052, 1.006239, -1.322312, 1, 0.9254902, 0, 1,
-0.9907513, -0.9682598, -1.456105, 1, 0.9294118, 0, 1,
-0.9847935, 2.073245, -0.2166131, 1, 0.9372549, 0, 1,
-0.9777794, -1.875736, -3.548744, 1, 0.9411765, 0, 1,
-0.9747753, 0.8702522, -1.066664, 1, 0.9490196, 0, 1,
-0.9690819, 0.8262789, -0.4975519, 1, 0.9529412, 0, 1,
-0.9652729, -1.436406, -1.29343, 1, 0.9607843, 0, 1,
-0.9634656, 1.101054, -0.757782, 1, 0.9647059, 0, 1,
-0.9625278, 0.5747977, -1.486831, 1, 0.972549, 0, 1,
-0.9604455, -0.03995048, -1.638246, 1, 0.9764706, 0, 1,
-0.9580649, 1.271847, -1.347269, 1, 0.9843137, 0, 1,
-0.9508312, 0.3156706, -1.059111, 1, 0.9882353, 0, 1,
-0.9494216, -0.2386516, -2.343614, 1, 0.9960784, 0, 1,
-0.945271, 0.7834416, -0.9604272, 0.9960784, 1, 0, 1,
-0.9419568, -0.4687769, -3.203813, 0.9921569, 1, 0, 1,
-0.940051, 1.183918, -0.310369, 0.9843137, 1, 0, 1,
-0.9380536, -0.9296806, -0.5788282, 0.9803922, 1, 0, 1,
-0.93688, -1.319666, -1.359044, 0.972549, 1, 0, 1,
-0.9309428, -0.3216086, -3.167675, 0.9686275, 1, 0, 1,
-0.9190993, 0.6821784, -0.9875538, 0.9607843, 1, 0, 1,
-0.9106581, 1.566882, -1.076432, 0.9568627, 1, 0, 1,
-0.8985559, 0.591876, -1.232826, 0.9490196, 1, 0, 1,
-0.8971525, -2.316584, -2.829844, 0.945098, 1, 0, 1,
-0.8856575, 0.7701701, -0.204498, 0.9372549, 1, 0, 1,
-0.883346, -0.03918439, -1.821407, 0.9333333, 1, 0, 1,
-0.8818056, 0.1434839, -1.03955, 0.9254902, 1, 0, 1,
-0.8811979, -0.0829306, -3.243083, 0.9215686, 1, 0, 1,
-0.8782283, 1.46108, 0.0334273, 0.9137255, 1, 0, 1,
-0.8746252, 0.1422431, -0.8905725, 0.9098039, 1, 0, 1,
-0.8691552, -0.02567875, -0.8987922, 0.9019608, 1, 0, 1,
-0.8663288, 1.162935, -0.4521699, 0.8941177, 1, 0, 1,
-0.8660681, 0.1019628, -1.680193, 0.8901961, 1, 0, 1,
-0.8620667, 0.2283208, -0.7829971, 0.8823529, 1, 0, 1,
-0.8588189, -1.78359, -4.372563, 0.8784314, 1, 0, 1,
-0.8489344, -0.0468967, -2.014066, 0.8705882, 1, 0, 1,
-0.8473769, -0.3539923, -2.643423, 0.8666667, 1, 0, 1,
-0.8437961, 0.180056, -1.45032, 0.8588235, 1, 0, 1,
-0.8417701, 0.860868, -1.209474, 0.854902, 1, 0, 1,
-0.8407331, 0.8298228, -0.8666411, 0.8470588, 1, 0, 1,
-0.8384984, 0.622247, 0.8314665, 0.8431373, 1, 0, 1,
-0.8353552, -1.157989, -2.679352, 0.8352941, 1, 0, 1,
-0.8345438, -0.3709593, -1.368208, 0.8313726, 1, 0, 1,
-0.8325351, 1.483469, 0.6378322, 0.8235294, 1, 0, 1,
-0.830216, -0.3121488, -3.655797, 0.8196079, 1, 0, 1,
-0.8279514, 0.1930702, -1.139349, 0.8117647, 1, 0, 1,
-0.8271256, 0.1299117, -1.789419, 0.8078431, 1, 0, 1,
-0.8234807, -0.9755944, -3.617703, 0.8, 1, 0, 1,
-0.8140177, -1.555817, -3.512381, 0.7921569, 1, 0, 1,
-0.8118907, -0.5983663, -1.730158, 0.7882353, 1, 0, 1,
-0.8084325, -0.7104036, -1.219875, 0.7803922, 1, 0, 1,
-0.8010565, -0.1095613, -2.046048, 0.7764706, 1, 0, 1,
-0.8004823, -1.522534, -3.481973, 0.7686275, 1, 0, 1,
-0.7779923, -1.099054, -3.643978, 0.7647059, 1, 0, 1,
-0.7733892, -1.160271, -3.132969, 0.7568628, 1, 0, 1,
-0.7676314, -0.3452986, -1.723092, 0.7529412, 1, 0, 1,
-0.7652428, 0.8460345, -1.477388, 0.7450981, 1, 0, 1,
-0.7616588, 0.843114, 0.7524068, 0.7411765, 1, 0, 1,
-0.7544785, -1.651877, -2.137655, 0.7333333, 1, 0, 1,
-0.7524776, -0.634946, -1.070352, 0.7294118, 1, 0, 1,
-0.7488854, 1.13089, -0.4252025, 0.7215686, 1, 0, 1,
-0.748118, -0.474462, -3.24042, 0.7176471, 1, 0, 1,
-0.7478181, -0.4066354, -2.032429, 0.7098039, 1, 0, 1,
-0.7419587, -0.111558, -3.754997, 0.7058824, 1, 0, 1,
-0.7397068, -0.233247, -1.2426, 0.6980392, 1, 0, 1,
-0.7342957, 0.6173587, -1.77628, 0.6901961, 1, 0, 1,
-0.7310714, 0.8726282, -0.03077521, 0.6862745, 1, 0, 1,
-0.7168916, 0.2840907, -0.1920869, 0.6784314, 1, 0, 1,
-0.7160838, 0.375344, -1.380597, 0.6745098, 1, 0, 1,
-0.7128097, 0.3651744, -0.2458869, 0.6666667, 1, 0, 1,
-0.7094687, 0.2474719, -2.445204, 0.6627451, 1, 0, 1,
-0.7084813, -0.3207473, -0.1360831, 0.654902, 1, 0, 1,
-0.705619, 1.466641, -2.645626, 0.6509804, 1, 0, 1,
-0.7034788, 0.2733429, -2.553522, 0.6431373, 1, 0, 1,
-0.6970577, 0.5990478, -1.347455, 0.6392157, 1, 0, 1,
-0.6934313, -0.08000032, -2.928666, 0.6313726, 1, 0, 1,
-0.6922131, 0.07995788, -2.234598, 0.627451, 1, 0, 1,
-0.6920751, -0.5919285, -1.276364, 0.6196079, 1, 0, 1,
-0.6657529, 1.106578, 0.8011041, 0.6156863, 1, 0, 1,
-0.6635199, 0.8815413, -1.102331, 0.6078432, 1, 0, 1,
-0.6633639, -0.03338917, -1.246512, 0.6039216, 1, 0, 1,
-0.6514359, 0.1340564, 0.18464, 0.5960785, 1, 0, 1,
-0.642144, 2.028958, -0.3197119, 0.5882353, 1, 0, 1,
-0.6380898, 0.4602365, -0.1751513, 0.5843138, 1, 0, 1,
-0.6365675, -0.1658783, -3.092688, 0.5764706, 1, 0, 1,
-0.6334505, -0.8478758, -3.282483, 0.572549, 1, 0, 1,
-0.6325324, -0.5954831, -2.932349, 0.5647059, 1, 0, 1,
-0.6292195, 0.5648996, -0.2984588, 0.5607843, 1, 0, 1,
-0.6235727, -1.214968, -3.800328, 0.5529412, 1, 0, 1,
-0.6231025, -0.127193, -3.087681, 0.5490196, 1, 0, 1,
-0.6212325, -1.290615, -4.466125, 0.5411765, 1, 0, 1,
-0.6194215, -0.832709, -1.361629, 0.5372549, 1, 0, 1,
-0.6152053, -1.283871, -2.333446, 0.5294118, 1, 0, 1,
-0.6112534, 0.5465727, -1.013219, 0.5254902, 1, 0, 1,
-0.6111243, -0.3378499, -1.803968, 0.5176471, 1, 0, 1,
-0.6081148, -0.4856856, -1.736175, 0.5137255, 1, 0, 1,
-0.6049848, 0.7495981, -0.7397149, 0.5058824, 1, 0, 1,
-0.6002073, -2.396966, -2.730728, 0.5019608, 1, 0, 1,
-0.595615, -0.2031281, -1.673261, 0.4941176, 1, 0, 1,
-0.5786034, 1.114465, -0.408552, 0.4862745, 1, 0, 1,
-0.5703344, -0.08230848, -1.85414, 0.4823529, 1, 0, 1,
-0.5656176, -1.339877, -2.380878, 0.4745098, 1, 0, 1,
-0.565378, 1.23259, -1.133571, 0.4705882, 1, 0, 1,
-0.5622149, 1.629445, -0.9548404, 0.4627451, 1, 0, 1,
-0.5599381, 0.5656129, -0.1235137, 0.4588235, 1, 0, 1,
-0.5591438, -0.7581807, -3.853829, 0.4509804, 1, 0, 1,
-0.5557267, 0.7412604, -1.684745, 0.4470588, 1, 0, 1,
-0.5513777, -0.8392745, -3.473053, 0.4392157, 1, 0, 1,
-0.5491349, 1.063434, -1.110631, 0.4352941, 1, 0, 1,
-0.5469416, -0.420146, -1.968574, 0.427451, 1, 0, 1,
-0.545288, 0.1776193, -1.281654, 0.4235294, 1, 0, 1,
-0.5396746, -1.387323, -3.69179, 0.4156863, 1, 0, 1,
-0.5375095, 1.080992, 0.05713803, 0.4117647, 1, 0, 1,
-0.5372084, -0.3378929, -3.311691, 0.4039216, 1, 0, 1,
-0.5336135, 1.279076, 0.7035034, 0.3960784, 1, 0, 1,
-0.5328165, -1.225867, -2.336746, 0.3921569, 1, 0, 1,
-0.5326115, -0.2944154, -1.485286, 0.3843137, 1, 0, 1,
-0.5316751, -0.6025436, -3.824274, 0.3803922, 1, 0, 1,
-0.5282583, 0.4462525, -1.885918, 0.372549, 1, 0, 1,
-0.5239735, 0.4788784, -0.8691943, 0.3686275, 1, 0, 1,
-0.5198164, -0.6763413, -5.487745, 0.3607843, 1, 0, 1,
-0.5166594, -0.6460083, -1.139605, 0.3568628, 1, 0, 1,
-0.5099197, -0.7720759, -2.368216, 0.3490196, 1, 0, 1,
-0.5093342, 0.2459612, -1.488536, 0.345098, 1, 0, 1,
-0.5044972, -1.17757, -1.456943, 0.3372549, 1, 0, 1,
-0.5027763, -2.179458, -3.781847, 0.3333333, 1, 0, 1,
-0.4996729, -1.355106, -3.531612, 0.3254902, 1, 0, 1,
-0.4892287, -0.4379264, -3.331858, 0.3215686, 1, 0, 1,
-0.4840017, -1.180729, -3.190513, 0.3137255, 1, 0, 1,
-0.4817768, 0.1090326, 0.1891342, 0.3098039, 1, 0, 1,
-0.4782018, -0.9026531, -3.434339, 0.3019608, 1, 0, 1,
-0.477709, -0.2783687, -1.577534, 0.2941177, 1, 0, 1,
-0.4688993, -0.8371704, -2.640341, 0.2901961, 1, 0, 1,
-0.4650323, 0.175551, -1.367117, 0.282353, 1, 0, 1,
-0.4610362, 1.176624, 2.138119, 0.2784314, 1, 0, 1,
-0.4597486, -0.1239292, -3.418666, 0.2705882, 1, 0, 1,
-0.4593481, -0.6172759, -2.245792, 0.2666667, 1, 0, 1,
-0.4593371, 0.88089, -0.1646878, 0.2588235, 1, 0, 1,
-0.4524302, -0.8838445, -4.135124, 0.254902, 1, 0, 1,
-0.4518288, 1.266157, 0.8458272, 0.2470588, 1, 0, 1,
-0.4511127, 0.01075957, -1.168727, 0.2431373, 1, 0, 1,
-0.450812, -1.100863, -2.298799, 0.2352941, 1, 0, 1,
-0.4500445, 0.5147964, -0.1469027, 0.2313726, 1, 0, 1,
-0.4467061, 0.6053401, -0.1067176, 0.2235294, 1, 0, 1,
-0.4452816, -0.8010845, -3.602751, 0.2196078, 1, 0, 1,
-0.4447311, -0.5819248, -3.45077, 0.2117647, 1, 0, 1,
-0.44109, 1.35687, -0.3847689, 0.2078431, 1, 0, 1,
-0.4407748, 0.4627476, -0.9482796, 0.2, 1, 0, 1,
-0.4381008, -1.483897, -4.030549, 0.1921569, 1, 0, 1,
-0.4370853, 0.0204175, -2.426068, 0.1882353, 1, 0, 1,
-0.4340402, -1.971316, -2.870803, 0.1803922, 1, 0, 1,
-0.4332652, 1.73239, -0.4638601, 0.1764706, 1, 0, 1,
-0.4306904, -1.608254, -2.537699, 0.1686275, 1, 0, 1,
-0.4286158, -0.4177902, -2.156464, 0.1647059, 1, 0, 1,
-0.4245927, 1.743212, 1.139497, 0.1568628, 1, 0, 1,
-0.4231164, -1.569455, -2.927384, 0.1529412, 1, 0, 1,
-0.4201324, 0.01822663, -1.413432, 0.145098, 1, 0, 1,
-0.4199856, 0.8678449, -0.8815607, 0.1411765, 1, 0, 1,
-0.4105359, -0.7637293, -2.891842, 0.1333333, 1, 0, 1,
-0.4099287, 0.1899459, -1.409356, 0.1294118, 1, 0, 1,
-0.405077, 0.7561955, -0.5096195, 0.1215686, 1, 0, 1,
-0.4042242, -0.1801691, -1.602857, 0.1176471, 1, 0, 1,
-0.4015299, 0.8243454, -0.6004171, 0.1098039, 1, 0, 1,
-0.3978899, -0.03388461, -2.63658, 0.1058824, 1, 0, 1,
-0.3971099, 1.324508, 0.9513302, 0.09803922, 1, 0, 1,
-0.39585, 1.413758, 1.256578, 0.09019608, 1, 0, 1,
-0.3957936, -1.213853, -3.396875, 0.08627451, 1, 0, 1,
-0.3955478, 1.408567, 0.9456143, 0.07843138, 1, 0, 1,
-0.3917929, 1.012481, -0.6452608, 0.07450981, 1, 0, 1,
-0.3845284, -0.6466135, -3.406887, 0.06666667, 1, 0, 1,
-0.3815896, 2.267804, -0.7496857, 0.0627451, 1, 0, 1,
-0.3813972, 0.6818059, -2.441697, 0.05490196, 1, 0, 1,
-0.3759294, -1.0811, -0.6596482, 0.05098039, 1, 0, 1,
-0.3731575, 0.1218747, -1.819311, 0.04313726, 1, 0, 1,
-0.3716273, -1.649319, -3.717138, 0.03921569, 1, 0, 1,
-0.3595823, -0.8118195, -3.029413, 0.03137255, 1, 0, 1,
-0.3551693, 0.137125, -1.356846, 0.02745098, 1, 0, 1,
-0.3529391, 0.3191854, -0.1416765, 0.01960784, 1, 0, 1,
-0.3477222, 0.9950207, -1.418337, 0.01568628, 1, 0, 1,
-0.3467779, -0.9760423, -1.886569, 0.007843138, 1, 0, 1,
-0.3467169, 0.8244521, 0.8901086, 0.003921569, 1, 0, 1,
-0.3453929, -1.645193, -3.68445, 0, 1, 0.003921569, 1,
-0.344547, 0.7698745, -1.146268, 0, 1, 0.01176471, 1,
-0.3440831, 0.6998648, 0.04280916, 0, 1, 0.01568628, 1,
-0.3398917, 0.1107825, -0.7568226, 0, 1, 0.02352941, 1,
-0.338611, -0.1907995, -0.4554493, 0, 1, 0.02745098, 1,
-0.3355141, 1.376853, -0.4328826, 0, 1, 0.03529412, 1,
-0.3350942, 1.734776, 1.711155, 0, 1, 0.03921569, 1,
-0.3343469, -0.7932798, -1.668327, 0, 1, 0.04705882, 1,
-0.3312978, -0.7037948, -2.274572, 0, 1, 0.05098039, 1,
-0.3304456, 1.292056, -1.062921, 0, 1, 0.05882353, 1,
-0.3253488, -1.462216, -2.058848, 0, 1, 0.0627451, 1,
-0.3237762, -0.6990272, -1.858854, 0, 1, 0.07058824, 1,
-0.3204201, -0.004806949, -2.401992, 0, 1, 0.07450981, 1,
-0.3200664, 0.3827882, -1.107499, 0, 1, 0.08235294, 1,
-0.3190021, 1.154162, -0.9563633, 0, 1, 0.08627451, 1,
-0.3178309, 0.08488354, -1.340557, 0, 1, 0.09411765, 1,
-0.3138653, 0.1213409, -2.717242, 0, 1, 0.1019608, 1,
-0.3019139, 0.02645415, -1.990989, 0, 1, 0.1058824, 1,
-0.2988695, 0.007711425, -1.606029, 0, 1, 0.1137255, 1,
-0.2975775, 0.90685, -2.302078, 0, 1, 0.1176471, 1,
-0.2956625, -0.2659634, -2.695847, 0, 1, 0.1254902, 1,
-0.2947071, -0.2363061, -2.613695, 0, 1, 0.1294118, 1,
-0.294699, -0.3534727, -3.8066, 0, 1, 0.1372549, 1,
-0.2891891, 1.542346, -0.00717222, 0, 1, 0.1411765, 1,
-0.2891359, 0.83337, -0.9634405, 0, 1, 0.1490196, 1,
-0.2888957, -2.51227, -2.909979, 0, 1, 0.1529412, 1,
-0.2871275, -0.6896726, -2.827408, 0, 1, 0.1607843, 1,
-0.2822931, -0.629391, -3.056175, 0, 1, 0.1647059, 1,
-0.2797468, 1.143881, 0.130359, 0, 1, 0.172549, 1,
-0.279473, 0.691959, 1.600108, 0, 1, 0.1764706, 1,
-0.2794026, -1.901136, -1.415425, 0, 1, 0.1843137, 1,
-0.2751615, 1.045615, -0.0309065, 0, 1, 0.1882353, 1,
-0.2651741, 1.072481, -0.9932404, 0, 1, 0.1960784, 1,
-0.2636268, 1.677711, -1.273025, 0, 1, 0.2039216, 1,
-0.2568699, -0.04233576, -3.268859, 0, 1, 0.2078431, 1,
-0.2544441, -0.06128594, -2.280822, 0, 1, 0.2156863, 1,
-0.2445777, 1.070115, 0.2679184, 0, 1, 0.2196078, 1,
-0.2425981, -1.82033, -2.996545, 0, 1, 0.227451, 1,
-0.2412432, 0.09192911, -0.757776, 0, 1, 0.2313726, 1,
-0.2386314, -1.254468, -5.879491, 0, 1, 0.2392157, 1,
-0.2367597, -0.5277445, -3.51142, 0, 1, 0.2431373, 1,
-0.235288, 1.181212, 0.4680344, 0, 1, 0.2509804, 1,
-0.2346302, -0.2668466, -3.991472, 0, 1, 0.254902, 1,
-0.2320231, 0.6361418, -0.3061204, 0, 1, 0.2627451, 1,
-0.2281598, 2.323042, 0.8519411, 0, 1, 0.2666667, 1,
-0.222276, -1.684723, -2.754436, 0, 1, 0.2745098, 1,
-0.2197737, -1.212267, -2.726257, 0, 1, 0.2784314, 1,
-0.2196716, 0.4696242, -0.319739, 0, 1, 0.2862745, 1,
-0.2178872, 2.38556, 1.841344, 0, 1, 0.2901961, 1,
-0.2149696, -0.5505725, -2.377276, 0, 1, 0.2980392, 1,
-0.2148345, -1.520873, -1.819667, 0, 1, 0.3058824, 1,
-0.213626, -1.067023, -3.268272, 0, 1, 0.3098039, 1,
-0.2132739, -0.2480697, -2.567885, 0, 1, 0.3176471, 1,
-0.2123479, -0.4521736, -2.313626, 0, 1, 0.3215686, 1,
-0.2112031, 0.4426396, -0.4469351, 0, 1, 0.3294118, 1,
-0.2011879, 0.4789926, -0.8197898, 0, 1, 0.3333333, 1,
-0.2008143, -0.2796507, -4.176579, 0, 1, 0.3411765, 1,
-0.2003959, 0.8898593, -0.008639965, 0, 1, 0.345098, 1,
-0.1986381, -1.380915, -2.084803, 0, 1, 0.3529412, 1,
-0.1967655, -0.2737865, -1.983858, 0, 1, 0.3568628, 1,
-0.1957152, 0.7235731, 2.089536, 0, 1, 0.3647059, 1,
-0.19481, -0.776413, -2.803209, 0, 1, 0.3686275, 1,
-0.194595, -0.4795584, -1.423312, 0, 1, 0.3764706, 1,
-0.1889671, -0.2363841, -1.563515, 0, 1, 0.3803922, 1,
-0.1840436, -0.8552144, -3.543623, 0, 1, 0.3882353, 1,
-0.1782253, -0.07450096, -2.2186, 0, 1, 0.3921569, 1,
-0.1766112, 0.2525268, -0.2660163, 0, 1, 0.4, 1,
-0.1759902, 0.9441087, 0.5177438, 0, 1, 0.4078431, 1,
-0.1705069, -0.2111879, -1.443887, 0, 1, 0.4117647, 1,
-0.1704933, -1.163941, -1.805283, 0, 1, 0.4196078, 1,
-0.1641983, -1.051745, -3.798089, 0, 1, 0.4235294, 1,
-0.1605851, 0.4555965, -0.3228297, 0, 1, 0.4313726, 1,
-0.1581671, 1.312732, -0.03249467, 0, 1, 0.4352941, 1,
-0.1550373, -0.08361084, -1.798051, 0, 1, 0.4431373, 1,
-0.1539809, -0.6820051, -2.939078, 0, 1, 0.4470588, 1,
-0.1511441, 1.115659, -0.7580715, 0, 1, 0.454902, 1,
-0.1477709, -0.1941124, -2.336944, 0, 1, 0.4588235, 1,
-0.1424517, 1.382037, -0.4406423, 0, 1, 0.4666667, 1,
-0.1418675, 1.729001, -0.1815203, 0, 1, 0.4705882, 1,
-0.140829, -0.4384756, -1.508316, 0, 1, 0.4784314, 1,
-0.1401653, 0.4662258, -1.47133, 0, 1, 0.4823529, 1,
-0.1396747, 1.189295, 0.1220866, 0, 1, 0.4901961, 1,
-0.1371195, 0.8875163, -0.3829958, 0, 1, 0.4941176, 1,
-0.1352865, -0.1683862, -2.809537, 0, 1, 0.5019608, 1,
-0.1347862, 1.438937, 0.3794364, 0, 1, 0.509804, 1,
-0.1335407, 0.03607539, -3.345279, 0, 1, 0.5137255, 1,
-0.1326153, 0.3659015, 0.2940232, 0, 1, 0.5215687, 1,
-0.1188137, -1.219132, -2.235574, 0, 1, 0.5254902, 1,
-0.1123103, 1.064224, -1.069243, 0, 1, 0.5333334, 1,
-0.1066299, -0.115735, -1.826766, 0, 1, 0.5372549, 1,
-0.1058553, -1.631705, -2.669533, 0, 1, 0.5450981, 1,
-0.1049027, 0.0832369, 0.2427654, 0, 1, 0.5490196, 1,
-0.1039829, -1.010041, -0.6559547, 0, 1, 0.5568628, 1,
-0.1008393, 0.3296769, 0.3963124, 0, 1, 0.5607843, 1,
-0.09761166, -0.03790761, -1.473464, 0, 1, 0.5686275, 1,
-0.09133553, -0.6484469, -3.113189, 0, 1, 0.572549, 1,
-0.08716996, 1.06643, -0.8109642, 0, 1, 0.5803922, 1,
-0.08645354, 1.085096, -0.04260423, 0, 1, 0.5843138, 1,
-0.07429428, -0.3408244, -1.958895, 0, 1, 0.5921569, 1,
-0.07302248, 0.7370765, 0.2851921, 0, 1, 0.5960785, 1,
-0.07213195, 0.7318119, -2.026366, 0, 1, 0.6039216, 1,
-0.06737308, 0.6763577, -0.3008771, 0, 1, 0.6117647, 1,
-0.06576124, -0.9578895, -3.801023, 0, 1, 0.6156863, 1,
-0.06566698, -0.6697713, -2.640153, 0, 1, 0.6235294, 1,
-0.06420152, 0.04699521, 0.1291037, 0, 1, 0.627451, 1,
-0.0590417, -0.1660183, -4.545223, 0, 1, 0.6352941, 1,
-0.05690651, -0.7164001, -3.339906, 0, 1, 0.6392157, 1,
-0.05512945, -0.396766, -2.960949, 0, 1, 0.6470588, 1,
-0.05019771, -1.173463, -1.148891, 0, 1, 0.6509804, 1,
-0.04890558, -0.7178331, -3.492704, 0, 1, 0.6588235, 1,
-0.04832903, -1.397824, -2.153185, 0, 1, 0.6627451, 1,
-0.04573417, -2.062588, -2.586091, 0, 1, 0.6705883, 1,
-0.04164284, -0.144675, -3.193151, 0, 1, 0.6745098, 1,
-0.0340029, -2.185394, -2.495899, 0, 1, 0.682353, 1,
-0.03383594, -0.6016021, -4.310906, 0, 1, 0.6862745, 1,
-0.02790189, -0.2406472, -4.500906, 0, 1, 0.6941177, 1,
-0.02074659, 0.1688665, 0.09020458, 0, 1, 0.7019608, 1,
-0.02072912, 0.1730146, -1.545605, 0, 1, 0.7058824, 1,
-0.0158775, -0.259411, -1.515664, 0, 1, 0.7137255, 1,
-0.01553011, -0.3892877, -4.18603, 0, 1, 0.7176471, 1,
-0.01427225, -0.1128488, -3.171028, 0, 1, 0.7254902, 1,
-0.01293025, -0.3697951, -3.345126, 0, 1, 0.7294118, 1,
-0.01050282, -0.4248164, -0.8668656, 0, 1, 0.7372549, 1,
-0.008486234, -0.1801773, -2.584584, 0, 1, 0.7411765, 1,
-0.007501995, 0.7662876, -0.6549472, 0, 1, 0.7490196, 1,
0.001645963, -0.01324784, 2.960326, 0, 1, 0.7529412, 1,
0.003141643, 1.362549, -1.648528, 0, 1, 0.7607843, 1,
0.005432352, 0.3039482, 0.07186761, 0, 1, 0.7647059, 1,
0.006066793, -1.982315, 4.69624, 0, 1, 0.772549, 1,
0.00629185, -0.9711792, 3.342938, 0, 1, 0.7764706, 1,
0.008209855, -0.2202937, 0.9261236, 0, 1, 0.7843137, 1,
0.00899777, 0.2268713, 0.8172455, 0, 1, 0.7882353, 1,
0.009501444, -0.4059594, 1.357415, 0, 1, 0.7960784, 1,
0.01241586, -0.3439477, 3.27164, 0, 1, 0.8039216, 1,
0.01352385, -1.221086, 2.152788, 0, 1, 0.8078431, 1,
0.01361141, -0.5756994, 3.48344, 0, 1, 0.8156863, 1,
0.01416645, 0.1749476, 0.8241588, 0, 1, 0.8196079, 1,
0.02341058, -0.3018746, 3.349336, 0, 1, 0.827451, 1,
0.02418546, -0.7148905, 3.4407, 0, 1, 0.8313726, 1,
0.02524475, 0.1567509, -0.3761416, 0, 1, 0.8392157, 1,
0.02791227, -1.182896, 4.763948, 0, 1, 0.8431373, 1,
0.03060561, -0.6541451, 2.693355, 0, 1, 0.8509804, 1,
0.03468268, -0.7536, 4.758678, 0, 1, 0.854902, 1,
0.03596714, -0.8856883, 2.242975, 0, 1, 0.8627451, 1,
0.03599182, 0.7604163, 0.2135534, 0, 1, 0.8666667, 1,
0.03741841, 0.6400431, -0.9893568, 0, 1, 0.8745098, 1,
0.04066829, 0.07802519, 0.1482002, 0, 1, 0.8784314, 1,
0.04134209, -0.03120305, 2.674824, 0, 1, 0.8862745, 1,
0.04247881, 0.00291134, 2.693453, 0, 1, 0.8901961, 1,
0.04898078, 3.199694, 0.9083587, 0, 1, 0.8980392, 1,
0.05319041, -0.1505425, 2.805852, 0, 1, 0.9058824, 1,
0.05906422, -0.7561359, 1.478046, 0, 1, 0.9098039, 1,
0.06035463, 0.9719222, -0.5890866, 0, 1, 0.9176471, 1,
0.06153736, 0.2131054, 1.2623, 0, 1, 0.9215686, 1,
0.06675011, 0.9915949, 1.595556, 0, 1, 0.9294118, 1,
0.06733322, 1.390286, -1.064717, 0, 1, 0.9333333, 1,
0.06985689, 0.4005415, -0.9016473, 0, 1, 0.9411765, 1,
0.07007378, 0.3841208, -0.1624179, 0, 1, 0.945098, 1,
0.07269778, 0.1782997, 0.7033952, 0, 1, 0.9529412, 1,
0.07674304, -0.1169217, 2.517254, 0, 1, 0.9568627, 1,
0.07708987, -0.7159976, 3.175005, 0, 1, 0.9647059, 1,
0.08112825, 0.1176507, 1.055505, 0, 1, 0.9686275, 1,
0.08202937, 1.878963, 0.406587, 0, 1, 0.9764706, 1,
0.08421712, 0.7566403, -0.2871293, 0, 1, 0.9803922, 1,
0.08675016, 0.4164456, -0.4892009, 0, 1, 0.9882353, 1,
0.08867937, -2.055623, 4.805168, 0, 1, 0.9921569, 1,
0.09235357, -0.009951864, 2.69305, 0, 1, 1, 1,
0.09237471, 0.1601164, 0.4990056, 0, 0.9921569, 1, 1,
0.09563468, 1.179086, -1.799147, 0, 0.9882353, 1, 1,
0.09927103, 0.08149043, 1.958066, 0, 0.9803922, 1, 1,
0.1030396, -0.4975942, 2.964339, 0, 0.9764706, 1, 1,
0.1050367, -0.7367036, 3.659125, 0, 0.9686275, 1, 1,
0.1051877, 0.3839516, 0.980247, 0, 0.9647059, 1, 1,
0.1066316, -1.159258, 1.96006, 0, 0.9568627, 1, 1,
0.106851, -1.139958, 4.192645, 0, 0.9529412, 1, 1,
0.1085712, -2.359845, 3.430075, 0, 0.945098, 1, 1,
0.1098912, 0.4697567, 0.6455532, 0, 0.9411765, 1, 1,
0.1121839, -0.6341717, 3.359128, 0, 0.9333333, 1, 1,
0.113971, -1.06903, 2.590342, 0, 0.9294118, 1, 1,
0.1159635, 0.9817497, -1.006264, 0, 0.9215686, 1, 1,
0.1163276, -3.2684, 3.857754, 0, 0.9176471, 1, 1,
0.1182645, -3.783897, 3.73793, 0, 0.9098039, 1, 1,
0.1196247, -0.5951191, 3.359085, 0, 0.9058824, 1, 1,
0.1270328, 1.092987, -1.229252, 0, 0.8980392, 1, 1,
0.1273518, -0.006882261, 1.567992, 0, 0.8901961, 1, 1,
0.1299058, -0.1221812, 3.863794, 0, 0.8862745, 1, 1,
0.1353323, 0.675144, -1.13587, 0, 0.8784314, 1, 1,
0.1367626, 0.4381106, 0.534767, 0, 0.8745098, 1, 1,
0.1396114, -0.5827948, 2.100893, 0, 0.8666667, 1, 1,
0.1421882, -1.289446, 3.041716, 0, 0.8627451, 1, 1,
0.1485972, -0.371027, 2.933988, 0, 0.854902, 1, 1,
0.1491867, -1.12557, 2.441824, 0, 0.8509804, 1, 1,
0.1493376, 0.8511274, 0.251482, 0, 0.8431373, 1, 1,
0.149634, -2.374307, 2.373096, 0, 0.8392157, 1, 1,
0.1499969, 0.2222244, 0.6850813, 0, 0.8313726, 1, 1,
0.15317, 0.1036664, -0.5219723, 0, 0.827451, 1, 1,
0.153733, 0.587832, 0.1632582, 0, 0.8196079, 1, 1,
0.1619594, -0.7112194, 4.081573, 0, 0.8156863, 1, 1,
0.164915, 1.064406, -0.1777155, 0, 0.8078431, 1, 1,
0.1654944, -0.7360634, 2.047534, 0, 0.8039216, 1, 1,
0.1670544, 0.3747215, 0.8094687, 0, 0.7960784, 1, 1,
0.1704703, 0.004267341, 2.733468, 0, 0.7882353, 1, 1,
0.1727297, -0.1808618, 1.398762, 0, 0.7843137, 1, 1,
0.1774614, -0.6044571, 2.875756, 0, 0.7764706, 1, 1,
0.1819992, -1.186278, 3.551288, 0, 0.772549, 1, 1,
0.1846923, -1.178215, 1.658367, 0, 0.7647059, 1, 1,
0.1910415, 0.5678379, -1.154478, 0, 0.7607843, 1, 1,
0.1977769, 2.171181, -0.3132752, 0, 0.7529412, 1, 1,
0.2012696, 0.3500851, 1.351112, 0, 0.7490196, 1, 1,
0.201717, 0.0571976, 1.043633, 0, 0.7411765, 1, 1,
0.2018607, 0.05398505, 0.882603, 0, 0.7372549, 1, 1,
0.2029306, 0.9493558, 0.4058135, 0, 0.7294118, 1, 1,
0.204782, 0.8722469, 1.82198, 0, 0.7254902, 1, 1,
0.2050475, 1.26848, -0.5053216, 0, 0.7176471, 1, 1,
0.2084639, 1.436654, 0.4438595, 0, 0.7137255, 1, 1,
0.2121353, -1.296469, 3.560591, 0, 0.7058824, 1, 1,
0.2141657, -1.421432, 3.309257, 0, 0.6980392, 1, 1,
0.2195672, 1.35348, 0.6504791, 0, 0.6941177, 1, 1,
0.2196476, 1.915156, -1.46964, 0, 0.6862745, 1, 1,
0.2215214, 0.3759089, 0.4832629, 0, 0.682353, 1, 1,
0.2236813, 1.39778, 0.5603496, 0, 0.6745098, 1, 1,
0.2251007, 0.2485106, 1.89368, 0, 0.6705883, 1, 1,
0.2261921, -0.1356368, 3.871056, 0, 0.6627451, 1, 1,
0.2267075, -0.5973688, 2.092728, 0, 0.6588235, 1, 1,
0.2268669, -0.8988732, 4.181169, 0, 0.6509804, 1, 1,
0.2286123, -0.6584951, 4.128315, 0, 0.6470588, 1, 1,
0.229185, 0.7192249, 0.132765, 0, 0.6392157, 1, 1,
0.2302245, 0.3791531, 1.496047, 0, 0.6352941, 1, 1,
0.2318584, 0.3424945, -0.1218619, 0, 0.627451, 1, 1,
0.2323011, -0.1455024, 1.747719, 0, 0.6235294, 1, 1,
0.2360902, 1.103701, -1.344647, 0, 0.6156863, 1, 1,
0.2365602, -0.6930911, 3.914953, 0, 0.6117647, 1, 1,
0.2392648, -0.5496144, 2.852334, 0, 0.6039216, 1, 1,
0.2428836, 0.4744821, -0.1255392, 0, 0.5960785, 1, 1,
0.2446714, 1.574265, 0.5052258, 0, 0.5921569, 1, 1,
0.2479081, -0.7246655, 1.68097, 0, 0.5843138, 1, 1,
0.2491432, 0.4626293, 0.4052332, 0, 0.5803922, 1, 1,
0.2560684, -0.8984153, 3.274359, 0, 0.572549, 1, 1,
0.2564886, 1.009415, 0.5323182, 0, 0.5686275, 1, 1,
0.2604357, 1.835778, 1.300612, 0, 0.5607843, 1, 1,
0.2634756, -1.154231, 1.359836, 0, 0.5568628, 1, 1,
0.2639613, -0.8828788, 1.074662, 0, 0.5490196, 1, 1,
0.2682068, 2.85982, 0.2258151, 0, 0.5450981, 1, 1,
0.2695127, 2.192746, -0.3223861, 0, 0.5372549, 1, 1,
0.2702209, 0.09261552, 1.289452, 0, 0.5333334, 1, 1,
0.2721809, 0.059437, 1.021617, 0, 0.5254902, 1, 1,
0.2789258, -0.6787637, 3.700541, 0, 0.5215687, 1, 1,
0.2817651, 0.6038617, -2.449285, 0, 0.5137255, 1, 1,
0.2828445, -1.280656, 1.132092, 0, 0.509804, 1, 1,
0.2830356, -0.353041, 1.172529, 0, 0.5019608, 1, 1,
0.2845492, -0.03475976, 1.903891, 0, 0.4941176, 1, 1,
0.2871102, -0.5637496, 2.345345, 0, 0.4901961, 1, 1,
0.2871346, -2.076973, 2.531206, 0, 0.4823529, 1, 1,
0.2915808, -0.384502, 4.089759, 0, 0.4784314, 1, 1,
0.291988, 0.9180128, 0.0299204, 0, 0.4705882, 1, 1,
0.2925507, -0.6971378, 2.624247, 0, 0.4666667, 1, 1,
0.2937004, 0.03182667, 0.2151227, 0, 0.4588235, 1, 1,
0.2947147, -0.8358034, 3.571938, 0, 0.454902, 1, 1,
0.2959068, 0.6675532, 0.533517, 0, 0.4470588, 1, 1,
0.2973712, -2.02939, 3.123806, 0, 0.4431373, 1, 1,
0.2985943, 0.607798, 2.332749, 0, 0.4352941, 1, 1,
0.2993909, 0.7447763, -0.5075729, 0, 0.4313726, 1, 1,
0.3100073, -0.9614768, 4.0872, 0, 0.4235294, 1, 1,
0.3101972, 1.817527, -0.2293553, 0, 0.4196078, 1, 1,
0.3131288, -0.8233529, 4.19865, 0, 0.4117647, 1, 1,
0.3145173, 0.6294115, 2.472493, 0, 0.4078431, 1, 1,
0.3172252, -0.3551068, 1.309409, 0, 0.4, 1, 1,
0.3198348, -1.280749, 2.775616, 0, 0.3921569, 1, 1,
0.3323171, -0.9017766, 2.356516, 0, 0.3882353, 1, 1,
0.3345081, 0.7318573, 1.041984, 0, 0.3803922, 1, 1,
0.3367387, -0.1004958, 3.550806, 0, 0.3764706, 1, 1,
0.3416154, 1.167343, 0.4360117, 0, 0.3686275, 1, 1,
0.343335, 0.2502741, 2.897428, 0, 0.3647059, 1, 1,
0.3445358, 0.2228877, 1.333125, 0, 0.3568628, 1, 1,
0.3482974, 0.4051181, -1.048711, 0, 0.3529412, 1, 1,
0.3505721, 0.7591448, 0.7638688, 0, 0.345098, 1, 1,
0.3534793, 0.1558121, 0.8256991, 0, 0.3411765, 1, 1,
0.3541268, 0.3902331, 0.1307639, 0, 0.3333333, 1, 1,
0.3685817, 0.2339516, 0.7681846, 0, 0.3294118, 1, 1,
0.3695958, -0.3794704, 2.658754, 0, 0.3215686, 1, 1,
0.3709573, 0.05314957, 1.931017, 0, 0.3176471, 1, 1,
0.3783181, 2.15561, -1.056719, 0, 0.3098039, 1, 1,
0.3811044, -1.900497, 4.235567, 0, 0.3058824, 1, 1,
0.391161, -1.614583, 2.210817, 0, 0.2980392, 1, 1,
0.391195, -2.624721, 2.695792, 0, 0.2901961, 1, 1,
0.3919784, 1.518528, -0.4880173, 0, 0.2862745, 1, 1,
0.3933549, -0.3059599, 2.325398, 0, 0.2784314, 1, 1,
0.3970331, -0.7491955, 3.49307, 0, 0.2745098, 1, 1,
0.3998987, -0.4268997, 2.780628, 0, 0.2666667, 1, 1,
0.4055572, 1.087188, -0.3917383, 0, 0.2627451, 1, 1,
0.4143336, 0.388506, 1.028812, 0, 0.254902, 1, 1,
0.4155794, -0.3004561, 3.498775, 0, 0.2509804, 1, 1,
0.4164619, -1.067032, 2.030543, 0, 0.2431373, 1, 1,
0.417453, -0.2945081, 1.525946, 0, 0.2392157, 1, 1,
0.4226875, -1.051865, 4.133935, 0, 0.2313726, 1, 1,
0.4252349, 0.1224835, 0.7625299, 0, 0.227451, 1, 1,
0.4300977, 0.8579485, 1.208322, 0, 0.2196078, 1, 1,
0.4323177, -0.4028159, 3.323469, 0, 0.2156863, 1, 1,
0.4367101, 0.1898006, 0.9391884, 0, 0.2078431, 1, 1,
0.4397868, -0.1304129, 3.532426, 0, 0.2039216, 1, 1,
0.4429962, -0.2230758, 1.668838, 0, 0.1960784, 1, 1,
0.4433891, 0.8064753, 1.247961, 0, 0.1882353, 1, 1,
0.4504982, 0.4213232, 0.3805737, 0, 0.1843137, 1, 1,
0.4505762, -1.431457, 3.803144, 0, 0.1764706, 1, 1,
0.4508427, -0.5791876, 2.347949, 0, 0.172549, 1, 1,
0.4521256, 2.700469, 0.9549606, 0, 0.1647059, 1, 1,
0.4568066, 3.154707, 0.7610404, 0, 0.1607843, 1, 1,
0.4572257, -0.5910304, 2.070354, 0, 0.1529412, 1, 1,
0.4591309, 0.9543217, -1.174899, 0, 0.1490196, 1, 1,
0.460216, -0.6634184, 2.43319, 0, 0.1411765, 1, 1,
0.4616743, -3.626143, 3.863705, 0, 0.1372549, 1, 1,
0.4669885, 0.05284438, 1.490564, 0, 0.1294118, 1, 1,
0.4679483, 0.440591, 0.3366446, 0, 0.1254902, 1, 1,
0.4709745, 0.9584723, 0.6525729, 0, 0.1176471, 1, 1,
0.4713805, 0.9581375, 2.026319, 0, 0.1137255, 1, 1,
0.4762206, 0.9488659, 0.7807862, 0, 0.1058824, 1, 1,
0.4771038, 0.001269329, -0.560266, 0, 0.09803922, 1, 1,
0.4787463, -1.867453, 3.502006, 0, 0.09411765, 1, 1,
0.4795296, 0.8564835, -0.8444001, 0, 0.08627451, 1, 1,
0.4837867, -0.03107506, 3.202707, 0, 0.08235294, 1, 1,
0.4854915, -1.170554, 4.058059, 0, 0.07450981, 1, 1,
0.486686, 1.839895, 1.467479, 0, 0.07058824, 1, 1,
0.4880446, -0.9675314, 3.454876, 0, 0.0627451, 1, 1,
0.490434, 0.5735381, 0.1121885, 0, 0.05882353, 1, 1,
0.4938318, -0.6977234, 3.941024, 0, 0.05098039, 1, 1,
0.4939228, 0.2698344, 2.826291, 0, 0.04705882, 1, 1,
0.4997498, 0.6904538, 0.9043168, 0, 0.03921569, 1, 1,
0.5017722, -0.05879617, 2.290147, 0, 0.03529412, 1, 1,
0.5031517, -0.9984583, 1.740763, 0, 0.02745098, 1, 1,
0.5073077, -0.8108674, 3.901054, 0, 0.02352941, 1, 1,
0.5084489, -0.8670343, 3.445729, 0, 0.01568628, 1, 1,
0.5099887, -0.9676053, 2.107939, 0, 0.01176471, 1, 1,
0.5159085, -0.4787862, 1.896767, 0, 0.003921569, 1, 1,
0.5159464, 0.3747856, 3.068849, 0.003921569, 0, 1, 1,
0.5180936, -0.1376361, 1.642394, 0.007843138, 0, 1, 1,
0.5238473, -0.3613342, 2.241071, 0.01568628, 0, 1, 1,
0.5256978, 1.678587, 0.9439539, 0.01960784, 0, 1, 1,
0.528565, 0.7859779, 1.431796, 0.02745098, 0, 1, 1,
0.5305181, 0.9230704, -0.3314521, 0.03137255, 0, 1, 1,
0.5307685, -0.2981594, 3.610982, 0.03921569, 0, 1, 1,
0.5327612, 1.657105, 1.272632, 0.04313726, 0, 1, 1,
0.534788, 0.1233078, 0.9461883, 0.05098039, 0, 1, 1,
0.5360555, 0.1962115, 1.288652, 0.05490196, 0, 1, 1,
0.5361909, -0.2453204, 1.298188, 0.0627451, 0, 1, 1,
0.5364596, -1.640501, 3.378425, 0.06666667, 0, 1, 1,
0.5415241, 1.065701, -1.366229, 0.07450981, 0, 1, 1,
0.5478958, -0.1762842, 3.920709, 0.07843138, 0, 1, 1,
0.5585807, -0.8055707, 4.309002, 0.08627451, 0, 1, 1,
0.5591807, -1.72737, 2.731233, 0.09019608, 0, 1, 1,
0.5598322, 1.379392, -0.2742896, 0.09803922, 0, 1, 1,
0.5602986, -1.635416, 1.513856, 0.1058824, 0, 1, 1,
0.5606974, -0.243266, 0.8427857, 0.1098039, 0, 1, 1,
0.5692406, 0.07317457, 0.04260416, 0.1176471, 0, 1, 1,
0.5720574, -0.03707645, 3.554715, 0.1215686, 0, 1, 1,
0.5731774, -1.204059, 2.212818, 0.1294118, 0, 1, 1,
0.5786461, 0.1509452, 2.151141, 0.1333333, 0, 1, 1,
0.5792254, -0.9076292, 2.359732, 0.1411765, 0, 1, 1,
0.5887922, 0.008573174, 2.618642, 0.145098, 0, 1, 1,
0.5939026, -0.4509992, 2.347963, 0.1529412, 0, 1, 1,
0.5943767, 0.9664587, 1.738422, 0.1568628, 0, 1, 1,
0.597055, -0.07217398, 3.028187, 0.1647059, 0, 1, 1,
0.5972534, -0.8638164, 1.080229, 0.1686275, 0, 1, 1,
0.6026621, -1.450423, 2.895051, 0.1764706, 0, 1, 1,
0.603226, -1.088971, 2.440983, 0.1803922, 0, 1, 1,
0.6117818, 0.5297318, 1.663142, 0.1882353, 0, 1, 1,
0.613113, 1.962952, -0.5482951, 0.1921569, 0, 1, 1,
0.6133999, -2.671907, 3.792686, 0.2, 0, 1, 1,
0.6162328, -0.7479905, 2.216018, 0.2078431, 0, 1, 1,
0.6203093, -0.7377587, 1.523822, 0.2117647, 0, 1, 1,
0.620358, 1.100907, 2.016505, 0.2196078, 0, 1, 1,
0.6206551, -0.4288474, 1.648472, 0.2235294, 0, 1, 1,
0.6231223, 0.7641119, 1.439705, 0.2313726, 0, 1, 1,
0.6254718, -2.186576, 4.762279, 0.2352941, 0, 1, 1,
0.6258713, 0.8969214, 3.213156, 0.2431373, 0, 1, 1,
0.6306648, -1.868324, 3.007196, 0.2470588, 0, 1, 1,
0.6325689, 0.4227895, 1.980719, 0.254902, 0, 1, 1,
0.6349238, 0.6371323, -1.008449, 0.2588235, 0, 1, 1,
0.6389972, -0.2615919, 0.4984736, 0.2666667, 0, 1, 1,
0.6424216, -0.1790759, 4.342238, 0.2705882, 0, 1, 1,
0.6433605, 0.07346987, 0.3796023, 0.2784314, 0, 1, 1,
0.6471065, -1.620509, 3.898167, 0.282353, 0, 1, 1,
0.6491661, -1.162519, 4.314351, 0.2901961, 0, 1, 1,
0.6524398, 0.5484736, 2.515005, 0.2941177, 0, 1, 1,
0.6561198, 0.2044122, 0.7990768, 0.3019608, 0, 1, 1,
0.6565132, 0.4089958, 0.198662, 0.3098039, 0, 1, 1,
0.6621723, -1.271384, 2.817482, 0.3137255, 0, 1, 1,
0.6696641, 0.6697533, 1.029157, 0.3215686, 0, 1, 1,
0.6699088, 1.406707, 1.078081, 0.3254902, 0, 1, 1,
0.671386, 0.2475963, -0.4067543, 0.3333333, 0, 1, 1,
0.6731866, -0.9283215, 2.543373, 0.3372549, 0, 1, 1,
0.6748816, -0.5822021, 1.250548, 0.345098, 0, 1, 1,
0.675, -0.766704, 2.162037, 0.3490196, 0, 1, 1,
0.6752536, -0.4408047, 1.397428, 0.3568628, 0, 1, 1,
0.6773996, -0.4890929, 1.58138, 0.3607843, 0, 1, 1,
0.6809611, -1.427523, 2.881551, 0.3686275, 0, 1, 1,
0.6829706, 2.090479, 1.633999, 0.372549, 0, 1, 1,
0.6840267, -1.797834, 1.879673, 0.3803922, 0, 1, 1,
0.6925924, -0.3605951, 3.654733, 0.3843137, 0, 1, 1,
0.695112, 2.083897, 0.01862503, 0.3921569, 0, 1, 1,
0.7053543, 0.01953558, 2.296066, 0.3960784, 0, 1, 1,
0.7079235, -1.140277, 3.536811, 0.4039216, 0, 1, 1,
0.7080494, -0.799093, 1.656537, 0.4117647, 0, 1, 1,
0.7083834, -0.6429181, 1.6031, 0.4156863, 0, 1, 1,
0.7116163, 0.845943, -1.247839, 0.4235294, 0, 1, 1,
0.7167465, -1.244462, 1.402993, 0.427451, 0, 1, 1,
0.7180464, -0.5679192, 1.38904, 0.4352941, 0, 1, 1,
0.7187725, 1.382074, 1.242035, 0.4392157, 0, 1, 1,
0.7204283, 0.2102071, 3.010792, 0.4470588, 0, 1, 1,
0.7242349, -1.426485, 2.922449, 0.4509804, 0, 1, 1,
0.7267222, 0.2797529, 2.916237, 0.4588235, 0, 1, 1,
0.7371139, -0.9847549, 2.585024, 0.4627451, 0, 1, 1,
0.7381381, 0.9242637, 0.05329262, 0.4705882, 0, 1, 1,
0.7385687, 0.7303698, 1.514336, 0.4745098, 0, 1, 1,
0.7407499, -0.1052106, 1.792059, 0.4823529, 0, 1, 1,
0.7427729, 0.2200311, 1.067314, 0.4862745, 0, 1, 1,
0.7464085, -0.2287509, 1.697558, 0.4941176, 0, 1, 1,
0.7489011, -0.1048729, 2.522279, 0.5019608, 0, 1, 1,
0.7552842, -1.251949, 3.121597, 0.5058824, 0, 1, 1,
0.7622322, -0.4660177, 2.987703, 0.5137255, 0, 1, 1,
0.763853, -0.4632019, 2.511114, 0.5176471, 0, 1, 1,
0.7651616, -0.5205767, 0.1600168, 0.5254902, 0, 1, 1,
0.7704868, -2.26962, 0.9714835, 0.5294118, 0, 1, 1,
0.7758676, 0.2370757, -0.3918729, 0.5372549, 0, 1, 1,
0.7786947, -1.677749, 4.332863, 0.5411765, 0, 1, 1,
0.7858191, 0.1282756, 0.5396914, 0.5490196, 0, 1, 1,
0.7888097, 0.02194524, 1.601669, 0.5529412, 0, 1, 1,
0.7948644, -0.1422381, 0.7310113, 0.5607843, 0, 1, 1,
0.8001735, 0.6331831, 0.4546309, 0.5647059, 0, 1, 1,
0.807668, 0.7324277, 0.6663471, 0.572549, 0, 1, 1,
0.8077196, 1.595817, 1.282964, 0.5764706, 0, 1, 1,
0.808561, 0.5932074, 1.614833, 0.5843138, 0, 1, 1,
0.8091851, 1.844111, 0.6847948, 0.5882353, 0, 1, 1,
0.8160441, -0.6093306, 0.9274234, 0.5960785, 0, 1, 1,
0.8168812, -0.3584734, 1.388296, 0.6039216, 0, 1, 1,
0.8185147, -0.3776892, 1.597845, 0.6078432, 0, 1, 1,
0.8226871, 2.489413, 1.338124, 0.6156863, 0, 1, 1,
0.8271723, 3.015159, -0.7205937, 0.6196079, 0, 1, 1,
0.8287477, 0.8960848, 0.9433683, 0.627451, 0, 1, 1,
0.8306956, 0.3508162, 0.7267039, 0.6313726, 0, 1, 1,
0.8325268, -0.2108238, 2.602926, 0.6392157, 0, 1, 1,
0.8346853, -1.015716, 2.508526, 0.6431373, 0, 1, 1,
0.8376428, -1.306049, 2.176485, 0.6509804, 0, 1, 1,
0.8397957, -0.8718901, 2.320887, 0.654902, 0, 1, 1,
0.84421, 1.591244, -0.8282239, 0.6627451, 0, 1, 1,
0.8468758, 0.3136635, 0.6264331, 0.6666667, 0, 1, 1,
0.8516174, 1.3266, 1.382097, 0.6745098, 0, 1, 1,
0.8523521, 1.583648, -0.1518638, 0.6784314, 0, 1, 1,
0.8593495, -1.101762, 3.309442, 0.6862745, 0, 1, 1,
0.8665503, 1.00034, 0.7211443, 0.6901961, 0, 1, 1,
0.8712423, -1.255857, 2.081041, 0.6980392, 0, 1, 1,
0.8751668, -0.7925247, 2.682867, 0.7058824, 0, 1, 1,
0.8762947, 0.7333081, -0.6554832, 0.7098039, 0, 1, 1,
0.8777266, 0.2305353, 1.66459, 0.7176471, 0, 1, 1,
0.8848052, 1.63881, 1.200829, 0.7215686, 0, 1, 1,
0.8860203, 0.2270164, 0.6160671, 0.7294118, 0, 1, 1,
0.8921098, 0.8243771, 1.394119, 0.7333333, 0, 1, 1,
0.8946461, 1.190875, 0.6965319, 0.7411765, 0, 1, 1,
0.8953525, 0.7789659, 0.1710285, 0.7450981, 0, 1, 1,
0.8964116, 0.3223318, 1.377531, 0.7529412, 0, 1, 1,
0.9002975, 0.6399472, 0.5196905, 0.7568628, 0, 1, 1,
0.9045426, 1.455338, 0.7638201, 0.7647059, 0, 1, 1,
0.9062094, -0.7001833, 0.9326829, 0.7686275, 0, 1, 1,
0.9117525, -0.6662037, 1.647137, 0.7764706, 0, 1, 1,
0.9141178, 0.5885563, 0.01539479, 0.7803922, 0, 1, 1,
0.9155454, 1.623025, 0.9166774, 0.7882353, 0, 1, 1,
0.9275634, -0.6148569, 2.037074, 0.7921569, 0, 1, 1,
0.9283034, -0.6825527, 0.7778502, 0.8, 0, 1, 1,
0.9363421, 0.581761, -0.6337397, 0.8078431, 0, 1, 1,
0.9366699, 0.07115867, 0.4708936, 0.8117647, 0, 1, 1,
0.9377961, -1.256304, 2.231617, 0.8196079, 0, 1, 1,
0.9389925, 1.13974, 0.6723322, 0.8235294, 0, 1, 1,
0.9460966, -0.3464165, 2.8199, 0.8313726, 0, 1, 1,
0.9481905, -2.803766, 2.689434, 0.8352941, 0, 1, 1,
0.9631207, -0.7556159, 2.578321, 0.8431373, 0, 1, 1,
0.9634723, -1.623685, 3.678578, 0.8470588, 0, 1, 1,
0.9665249, 0.1392153, 1.53467, 0.854902, 0, 1, 1,
0.9716876, -0.2502299, 1.381082, 0.8588235, 0, 1, 1,
0.9743955, 0.6234516, 3.058961, 0.8666667, 0, 1, 1,
0.9869774, 0.695103, 0.4027117, 0.8705882, 0, 1, 1,
1.000596, -1.063031, 2.569821, 0.8784314, 0, 1, 1,
1.005348, -0.04476599, 0.4025223, 0.8823529, 0, 1, 1,
1.01251, -1.300339, 3.893452, 0.8901961, 0, 1, 1,
1.017689, 1.310617, -0.3354268, 0.8941177, 0, 1, 1,
1.018816, -0.7112094, 1.563434, 0.9019608, 0, 1, 1,
1.018886, -0.5529589, 1.504584, 0.9098039, 0, 1, 1,
1.026633, 0.5182484, 2.184232, 0.9137255, 0, 1, 1,
1.026924, 0.4525011, 1.036142, 0.9215686, 0, 1, 1,
1.033391, -1.559203, 3.710098, 0.9254902, 0, 1, 1,
1.039216, -0.4211904, 1.886654, 0.9333333, 0, 1, 1,
1.040044, -2.408589, 2.852674, 0.9372549, 0, 1, 1,
1.04386, -0.7263241, 1.80948, 0.945098, 0, 1, 1,
1.045659, -1.902751, 1.409721, 0.9490196, 0, 1, 1,
1.047909, 0.2523303, 1.425318, 0.9568627, 0, 1, 1,
1.050487, 0.04603251, 1.375043, 0.9607843, 0, 1, 1,
1.053916, -0.7434019, 1.336816, 0.9686275, 0, 1, 1,
1.057247, -0.3547606, 2.90331, 0.972549, 0, 1, 1,
1.058596, -1.056245, -0.3532335, 0.9803922, 0, 1, 1,
1.059501, -2.48092, 2.493959, 0.9843137, 0, 1, 1,
1.059721, 1.647119, 0.8825118, 0.9921569, 0, 1, 1,
1.06414, 2.075945, 1.489349, 0.9960784, 0, 1, 1,
1.06754, 0.1526558, -0.6872573, 1, 0, 0.9960784, 1,
1.069327, 0.6444101, 0.739355, 1, 0, 0.9882353, 1,
1.071538, -1.799314, 2.632396, 1, 0, 0.9843137, 1,
1.076023, -1.006437, 2.732551, 1, 0, 0.9764706, 1,
1.084568, 1.612341, 1.841282, 1, 0, 0.972549, 1,
1.084821, 0.06842598, 1.965741, 1, 0, 0.9647059, 1,
1.090332, -1.155239, 3.47542, 1, 0, 0.9607843, 1,
1.091406, 1.61778, -0.2861268, 1, 0, 0.9529412, 1,
1.103779, 1.029442, 0.6146088, 1, 0, 0.9490196, 1,
1.104131, 0.6297566, 0.8870411, 1, 0, 0.9411765, 1,
1.107355, -1.613552, 3.172678, 1, 0, 0.9372549, 1,
1.113414, -0.8443909, 1.501195, 1, 0, 0.9294118, 1,
1.11768, -0.5826268, 0.8614316, 1, 0, 0.9254902, 1,
1.123314, 0.2909321, -0.3501312, 1, 0, 0.9176471, 1,
1.127228, -0.5796909, 2.381415, 1, 0, 0.9137255, 1,
1.130236, -0.9890038, 2.039069, 1, 0, 0.9058824, 1,
1.136933, 0.04211924, 1.0072, 1, 0, 0.9019608, 1,
1.14289, -2.162743, 3.855611, 1, 0, 0.8941177, 1,
1.146999, -1.25173, 0.7238957, 1, 0, 0.8862745, 1,
1.147893, 1.226943, 1.951867, 1, 0, 0.8823529, 1,
1.158093, 0.3598705, 0.1838033, 1, 0, 0.8745098, 1,
1.163083, -2.0148, 2.469704, 1, 0, 0.8705882, 1,
1.163322, 0.3362987, 1.200789, 1, 0, 0.8627451, 1,
1.165106, -0.5453551, 1.246243, 1, 0, 0.8588235, 1,
1.166219, 1.013124, 2.455985, 1, 0, 0.8509804, 1,
1.169198, 0.06075597, 2.39902, 1, 0, 0.8470588, 1,
1.171613, 0.6932482, 1.72964, 1, 0, 0.8392157, 1,
1.175184, -0.7862824, 2.794694, 1, 0, 0.8352941, 1,
1.175501, 0.9150428, 0.9704441, 1, 0, 0.827451, 1,
1.185334, 0.4623477, 0.1847169, 1, 0, 0.8235294, 1,
1.188455, 0.009729747, 1.798262, 1, 0, 0.8156863, 1,
1.19664, 2.161916, 0.9942157, 1, 0, 0.8117647, 1,
1.200398, 0.2235595, 1.40062, 1, 0, 0.8039216, 1,
1.20219, -0.5647529, 0.8727651, 1, 0, 0.7960784, 1,
1.20382, -0.2503342, 2.506568, 1, 0, 0.7921569, 1,
1.210361, 1.966238, -0.6431679, 1, 0, 0.7843137, 1,
1.213953, -0.9072986, 3.275534, 1, 0, 0.7803922, 1,
1.220397, 0.864827, 1.534376, 1, 0, 0.772549, 1,
1.231128, 0.04696899, 0.6747143, 1, 0, 0.7686275, 1,
1.234895, 0.102619, 1.575639, 1, 0, 0.7607843, 1,
1.236156, 0.02317984, 1.26115, 1, 0, 0.7568628, 1,
1.24824, 0.2910338, 1.378152, 1, 0, 0.7490196, 1,
1.251476, -0.9441094, 1.960631, 1, 0, 0.7450981, 1,
1.257073, -0.5737708, 2.677457, 1, 0, 0.7372549, 1,
1.258635, 0.09841702, 1.365699, 1, 0, 0.7333333, 1,
1.263645, 0.6217628, 1.578268, 1, 0, 0.7254902, 1,
1.265654, 2.720097, 0.07987205, 1, 0, 0.7215686, 1,
1.279589, -0.0595385, 0.7681581, 1, 0, 0.7137255, 1,
1.30288, -2.423498, 1.605577, 1, 0, 0.7098039, 1,
1.30424, -1.359904, 3.764906, 1, 0, 0.7019608, 1,
1.304884, -0.821237, 1.447339, 1, 0, 0.6941177, 1,
1.305343, -0.6569487, 2.343064, 1, 0, 0.6901961, 1,
1.305657, 1.328758, 0.245936, 1, 0, 0.682353, 1,
1.30872, 0.09155129, 1.153834, 1, 0, 0.6784314, 1,
1.309943, -0.1700333, 2.503938, 1, 0, 0.6705883, 1,
1.316696, -0.2927752, 3.497072, 1, 0, 0.6666667, 1,
1.323099, -0.3610584, 0.4156381, 1, 0, 0.6588235, 1,
1.323786, 0.5241227, 1.96543, 1, 0, 0.654902, 1,
1.327098, -1.642246, 2.208762, 1, 0, 0.6470588, 1,
1.327918, -0.05414964, 0.8837513, 1, 0, 0.6431373, 1,
1.330666, 1.604664, 0.002499972, 1, 0, 0.6352941, 1,
1.3341, -1.149831, 2.483186, 1, 0, 0.6313726, 1,
1.339368, 1.235181, 2.745962, 1, 0, 0.6235294, 1,
1.343567, -0.3428591, 3.714358, 1, 0, 0.6196079, 1,
1.346966, -1.618013, 4.300034, 1, 0, 0.6117647, 1,
1.353892, -2.061072, 1.428946, 1, 0, 0.6078432, 1,
1.356348, 0.5163358, -0.1566247, 1, 0, 0.6, 1,
1.366628, -0.06500025, 0.7476332, 1, 0, 0.5921569, 1,
1.36681, 0.4428627, 0.7024693, 1, 0, 0.5882353, 1,
1.367026, 0.3239713, 0.4217263, 1, 0, 0.5803922, 1,
1.372968, 1.118522, 1.293441, 1, 0, 0.5764706, 1,
1.376711, -0.8624672, 1.239056, 1, 0, 0.5686275, 1,
1.380475, 1.124965, 0.8349482, 1, 0, 0.5647059, 1,
1.390525, 2.895753, 2.307202, 1, 0, 0.5568628, 1,
1.39136, 0.648267, 0.8990975, 1, 0, 0.5529412, 1,
1.394048, 0.4766023, 1.086781, 1, 0, 0.5450981, 1,
1.39639, -0.5538797, 3.074649, 1, 0, 0.5411765, 1,
1.447154, 2.346275, -0.208701, 1, 0, 0.5333334, 1,
1.447737, -0.6139339, 1.813477, 1, 0, 0.5294118, 1,
1.455972, -0.5148119, 1.708246, 1, 0, 0.5215687, 1,
1.472073, -0.2426712, 2.336578, 1, 0, 0.5176471, 1,
1.473552, -0.4679406, 1.8027, 1, 0, 0.509804, 1,
1.476557, -0.8631576, 2.356553, 1, 0, 0.5058824, 1,
1.496832, 2.208511, 0.3873792, 1, 0, 0.4980392, 1,
1.4978, -0.5192761, 0.9801967, 1, 0, 0.4901961, 1,
1.510665, -0.2826415, 2.504631, 1, 0, 0.4862745, 1,
1.51234, 1.047412, 1.110092, 1, 0, 0.4784314, 1,
1.518674, 0.07802886, 2.046191, 1, 0, 0.4745098, 1,
1.520254, 0.2559296, 3.348539, 1, 0, 0.4666667, 1,
1.525025, 1.342617, 1.597054, 1, 0, 0.4627451, 1,
1.525688, 0.8902054, -0.941956, 1, 0, 0.454902, 1,
1.528382, 0.439599, 0.6866797, 1, 0, 0.4509804, 1,
1.530445, 0.140598, 0.8050939, 1, 0, 0.4431373, 1,
1.538287, -0.6259215, 0.8954932, 1, 0, 0.4392157, 1,
1.554694, 0.0681399, 1.532841, 1, 0, 0.4313726, 1,
1.560379, 1.180486, 0.8068999, 1, 0, 0.427451, 1,
1.562227, -0.9773718, 3.041222, 1, 0, 0.4196078, 1,
1.563015, 0.9966524, -0.466895, 1, 0, 0.4156863, 1,
1.571707, 2.713293, 1.704586, 1, 0, 0.4078431, 1,
1.582686, -0.1469535, 1.611245, 1, 0, 0.4039216, 1,
1.583289, -0.5371431, 2.551441, 1, 0, 0.3960784, 1,
1.584691, -0.8425406, 2.081374, 1, 0, 0.3882353, 1,
1.592349, 0.276592, 1.229744, 1, 0, 0.3843137, 1,
1.600302, 1.072177, 1.394047, 1, 0, 0.3764706, 1,
1.60489, -1.221874, 2.655768, 1, 0, 0.372549, 1,
1.617444, 1.265471, 2.327106, 1, 0, 0.3647059, 1,
1.626318, -0.02337496, 0.1257925, 1, 0, 0.3607843, 1,
1.627164, -0.5712461, 1.991503, 1, 0, 0.3529412, 1,
1.637758, -0.7586221, 1.992003, 1, 0, 0.3490196, 1,
1.641654, 0.1826702, 1.609028, 1, 0, 0.3411765, 1,
1.663249, 0.7008101, 2.136246, 1, 0, 0.3372549, 1,
1.678226, -1.770836, 2.305989, 1, 0, 0.3294118, 1,
1.681378, -0.5137735, 0.618196, 1, 0, 0.3254902, 1,
1.68292, 0.6631449, 2.054105, 1, 0, 0.3176471, 1,
1.710853, 0.9988551, 0.2392428, 1, 0, 0.3137255, 1,
1.720473, 0.823934, 0.8052271, 1, 0, 0.3058824, 1,
1.722244, -0.1297518, 0.2188398, 1, 0, 0.2980392, 1,
1.731831, 1.165789, -0.3410975, 1, 0, 0.2941177, 1,
1.74582, -1.264637, 1.657989, 1, 0, 0.2862745, 1,
1.753985, 0.1513197, -1.075269, 1, 0, 0.282353, 1,
1.756462, 1.344603, 1.636198, 1, 0, 0.2745098, 1,
1.759894, -0.3769024, 1.048582, 1, 0, 0.2705882, 1,
1.764003, -0.01839365, 1.318997, 1, 0, 0.2627451, 1,
1.767626, 0.2393855, 1.355076, 1, 0, 0.2588235, 1,
1.780386, -0.3760378, 2.619201, 1, 0, 0.2509804, 1,
1.789238, -1.920605, 4.350181, 1, 0, 0.2470588, 1,
1.812114, -1.296796, 1.654127, 1, 0, 0.2392157, 1,
1.822198, -1.205605, 1.648942, 1, 0, 0.2352941, 1,
1.834964, -0.903045, 1.267116, 1, 0, 0.227451, 1,
1.836857, 0.5691138, 1.841692, 1, 0, 0.2235294, 1,
1.841002, 0.7481756, 2.370796, 1, 0, 0.2156863, 1,
1.845721, 0.8898273, 2.468063, 1, 0, 0.2117647, 1,
1.850358, 0.5670011, 2.095616, 1, 0, 0.2039216, 1,
1.85718, -0.02041374, 1.982477, 1, 0, 0.1960784, 1,
1.88204, 1.908003, -0.3409691, 1, 0, 0.1921569, 1,
1.890368, 0.7998701, 0.6289863, 1, 0, 0.1843137, 1,
1.93895, -0.2115387, -0.727726, 1, 0, 0.1803922, 1,
1.949925, -0.6311215, 0.9018367, 1, 0, 0.172549, 1,
1.957863, 0.9878366, 1.215841, 1, 0, 0.1686275, 1,
1.978421, 0.3530456, 0.9885338, 1, 0, 0.1607843, 1,
1.989292, -0.232564, 3.151006, 1, 0, 0.1568628, 1,
2.000038, 0.1382599, 1.202957, 1, 0, 0.1490196, 1,
2.014855, -0.8303548, 3.065952, 1, 0, 0.145098, 1,
2.064388, 1.777446, 2.097236, 1, 0, 0.1372549, 1,
2.080438, -0.2536801, 0.6680962, 1, 0, 0.1333333, 1,
2.087942, -0.02889251, 1.253193, 1, 0, 0.1254902, 1,
2.111178, 0.473042, 0.2325, 1, 0, 0.1215686, 1,
2.117053, -0.4277548, 3.205346, 1, 0, 0.1137255, 1,
2.119242, -1.864545, 3.768922, 1, 0, 0.1098039, 1,
2.145116, -1.129168, 1.009965, 1, 0, 0.1019608, 1,
2.150167, -0.7974596, 3.189594, 1, 0, 0.09411765, 1,
2.161742, -1.952948, 3.775058, 1, 0, 0.09019608, 1,
2.182194, 0.1428853, 2.232177, 1, 0, 0.08235294, 1,
2.188367, -0.887266, 2.406089, 1, 0, 0.07843138, 1,
2.20469, 1.218149, 1.022454, 1, 0, 0.07058824, 1,
2.220011, -0.02887094, 1.723784, 1, 0, 0.06666667, 1,
2.239756, 0.317056, 0.2891054, 1, 0, 0.05882353, 1,
2.241998, 0.1654939, 1.620152, 1, 0, 0.05490196, 1,
2.256299, -1.233957, 2.481206, 1, 0, 0.04705882, 1,
2.342153, 1.417299, 2.043207, 1, 0, 0.04313726, 1,
2.362562, -1.389115, 2.422351, 1, 0, 0.03529412, 1,
2.432066, -1.038664, 2.144653, 1, 0, 0.03137255, 1,
2.564632, -0.09299545, 2.257636, 1, 0, 0.02352941, 1,
2.611999, 0.09600301, 1.078065, 1, 0, 0.01960784, 1,
2.638368, -0.6022419, 0.09816471, 1, 0, 0.01176471, 1,
3.058391, -0.5043806, 0.3935486, 1, 0, 0.007843138, 1
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
0.07227385, -4.967616, -7.69054, 0, -0.5, 0.5, 0.5,
0.07227385, -4.967616, -7.69054, 1, -0.5, 0.5, 0.5,
0.07227385, -4.967616, -7.69054, 1, 1.5, 0.5, 0.5,
0.07227385, -4.967616, -7.69054, 0, 1.5, 0.5, 0.5
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
-3.926137, -0.2921013, -7.69054, 0, -0.5, 0.5, 0.5,
-3.926137, -0.2921013, -7.69054, 1, -0.5, 0.5, 0.5,
-3.926137, -0.2921013, -7.69054, 1, 1.5, 0.5, 0.5,
-3.926137, -0.2921013, -7.69054, 0, 1.5, 0.5, 0.5
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
-3.926137, -4.967616, -0.5371616, 0, -0.5, 0.5, 0.5,
-3.926137, -4.967616, -0.5371616, 1, -0.5, 0.5, 0.5,
-3.926137, -4.967616, -0.5371616, 1, 1.5, 0.5, 0.5,
-3.926137, -4.967616, -0.5371616, 0, 1.5, 0.5, 0.5
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
-2, -3.888651, -6.039761,
3, -3.888651, -6.039761,
-2, -3.888651, -6.039761,
-2, -4.068478, -6.314891,
-1, -3.888651, -6.039761,
-1, -4.068478, -6.314891,
0, -3.888651, -6.039761,
0, -4.068478, -6.314891,
1, -3.888651, -6.039761,
1, -4.068478, -6.314891,
2, -3.888651, -6.039761,
2, -4.068478, -6.314891,
3, -3.888651, -6.039761,
3, -4.068478, -6.314891
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
-2, -4.428133, -6.86515, 0, -0.5, 0.5, 0.5,
-2, -4.428133, -6.86515, 1, -0.5, 0.5, 0.5,
-2, -4.428133, -6.86515, 1, 1.5, 0.5, 0.5,
-2, -4.428133, -6.86515, 0, 1.5, 0.5, 0.5,
-1, -4.428133, -6.86515, 0, -0.5, 0.5, 0.5,
-1, -4.428133, -6.86515, 1, -0.5, 0.5, 0.5,
-1, -4.428133, -6.86515, 1, 1.5, 0.5, 0.5,
-1, -4.428133, -6.86515, 0, 1.5, 0.5, 0.5,
0, -4.428133, -6.86515, 0, -0.5, 0.5, 0.5,
0, -4.428133, -6.86515, 1, -0.5, 0.5, 0.5,
0, -4.428133, -6.86515, 1, 1.5, 0.5, 0.5,
0, -4.428133, -6.86515, 0, 1.5, 0.5, 0.5,
1, -4.428133, -6.86515, 0, -0.5, 0.5, 0.5,
1, -4.428133, -6.86515, 1, -0.5, 0.5, 0.5,
1, -4.428133, -6.86515, 1, 1.5, 0.5, 0.5,
1, -4.428133, -6.86515, 0, 1.5, 0.5, 0.5,
2, -4.428133, -6.86515, 0, -0.5, 0.5, 0.5,
2, -4.428133, -6.86515, 1, -0.5, 0.5, 0.5,
2, -4.428133, -6.86515, 1, 1.5, 0.5, 0.5,
2, -4.428133, -6.86515, 0, 1.5, 0.5, 0.5,
3, -4.428133, -6.86515, 0, -0.5, 0.5, 0.5,
3, -4.428133, -6.86515, 1, -0.5, 0.5, 0.5,
3, -4.428133, -6.86515, 1, 1.5, 0.5, 0.5,
3, -4.428133, -6.86515, 0, 1.5, 0.5, 0.5
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
-3.003427, -3, -6.039761,
-3.003427, 3, -6.039761,
-3.003427, -3, -6.039761,
-3.157212, -3, -6.314891,
-3.003427, -2, -6.039761,
-3.157212, -2, -6.314891,
-3.003427, -1, -6.039761,
-3.157212, -1, -6.314891,
-3.003427, 0, -6.039761,
-3.157212, 0, -6.314891,
-3.003427, 1, -6.039761,
-3.157212, 1, -6.314891,
-3.003427, 2, -6.039761,
-3.157212, 2, -6.314891,
-3.003427, 3, -6.039761,
-3.157212, 3, -6.314891
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
-3.464782, -3, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, -3, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, -3, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, -3, -6.86515, 0, 1.5, 0.5, 0.5,
-3.464782, -2, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, -2, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, -2, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, -2, -6.86515, 0, 1.5, 0.5, 0.5,
-3.464782, -1, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, -1, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, -1, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, -1, -6.86515, 0, 1.5, 0.5, 0.5,
-3.464782, 0, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, 0, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, 0, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, 0, -6.86515, 0, 1.5, 0.5, 0.5,
-3.464782, 1, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, 1, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, 1, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, 1, -6.86515, 0, 1.5, 0.5, 0.5,
-3.464782, 2, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, 2, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, 2, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, 2, -6.86515, 0, 1.5, 0.5, 0.5,
-3.464782, 3, -6.86515, 0, -0.5, 0.5, 0.5,
-3.464782, 3, -6.86515, 1, -0.5, 0.5, 0.5,
-3.464782, 3, -6.86515, 1, 1.5, 0.5, 0.5,
-3.464782, 3, -6.86515, 0, 1.5, 0.5, 0.5
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
-3.003427, -3.888651, -4,
-3.003427, -3.888651, 4,
-3.003427, -3.888651, -4,
-3.157212, -4.068478, -4,
-3.003427, -3.888651, -2,
-3.157212, -4.068478, -2,
-3.003427, -3.888651, 0,
-3.157212, -4.068478, 0,
-3.003427, -3.888651, 2,
-3.157212, -4.068478, 2,
-3.003427, -3.888651, 4,
-3.157212, -4.068478, 4
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
-3.464782, -4.428133, -4, 0, -0.5, 0.5, 0.5,
-3.464782, -4.428133, -4, 1, -0.5, 0.5, 0.5,
-3.464782, -4.428133, -4, 1, 1.5, 0.5, 0.5,
-3.464782, -4.428133, -4, 0, 1.5, 0.5, 0.5,
-3.464782, -4.428133, -2, 0, -0.5, 0.5, 0.5,
-3.464782, -4.428133, -2, 1, -0.5, 0.5, 0.5,
-3.464782, -4.428133, -2, 1, 1.5, 0.5, 0.5,
-3.464782, -4.428133, -2, 0, 1.5, 0.5, 0.5,
-3.464782, -4.428133, 0, 0, -0.5, 0.5, 0.5,
-3.464782, -4.428133, 0, 1, -0.5, 0.5, 0.5,
-3.464782, -4.428133, 0, 1, 1.5, 0.5, 0.5,
-3.464782, -4.428133, 0, 0, 1.5, 0.5, 0.5,
-3.464782, -4.428133, 2, 0, -0.5, 0.5, 0.5,
-3.464782, -4.428133, 2, 1, -0.5, 0.5, 0.5,
-3.464782, -4.428133, 2, 1, 1.5, 0.5, 0.5,
-3.464782, -4.428133, 2, 0, 1.5, 0.5, 0.5,
-3.464782, -4.428133, 4, 0, -0.5, 0.5, 0.5,
-3.464782, -4.428133, 4, 1, -0.5, 0.5, 0.5,
-3.464782, -4.428133, 4, 1, 1.5, 0.5, 0.5,
-3.464782, -4.428133, 4, 0, 1.5, 0.5, 0.5
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
-3.003427, -3.888651, -6.039761,
-3.003427, 3.304448, -6.039761,
-3.003427, -3.888651, 4.965437,
-3.003427, 3.304448, 4.965437,
-3.003427, -3.888651, -6.039761,
-3.003427, -3.888651, 4.965437,
-3.003427, 3.304448, -6.039761,
-3.003427, 3.304448, 4.965437,
-3.003427, -3.888651, -6.039761,
3.147975, -3.888651, -6.039761,
-3.003427, -3.888651, 4.965437,
3.147975, -3.888651, 4.965437,
-3.003427, 3.304448, -6.039761,
3.147975, 3.304448, -6.039761,
-3.003427, 3.304448, 4.965437,
3.147975, 3.304448, 4.965437,
3.147975, -3.888651, -6.039761,
3.147975, 3.304448, -6.039761,
3.147975, -3.888651, 4.965437,
3.147975, 3.304448, 4.965437,
3.147975, -3.888651, -6.039761,
3.147975, -3.888651, 4.965437,
3.147975, 3.304448, -6.039761,
3.147975, 3.304448, 4.965437
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
var radius = 7.750905;
var distance = 34.48465;
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
mvMatrix.translate( -0.07227385, 0.2921013, 0.5371616 );
mvMatrix.scale( 1.362361, 1.165065, 0.7614974 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48465);
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
benzylaminopurine<-read.table("benzylaminopurine.xyz")
```

```
## Error in read.table("benzylaminopurine.xyz"): no lines available in input
```

```r
x<-benzylaminopurine$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
```

```r
y<-benzylaminopurine$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
```

```r
z<-benzylaminopurine$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
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
-2.913843, -0.6312765, -1.917596, 0, 0, 1, 1, 1,
-2.835361, 0.4997577, -1.846883, 1, 0, 0, 1, 1,
-2.70808, 0.4347051, -2.608088, 1, 0, 0, 1, 1,
-2.655297, -0.4924088, -3.073754, 1, 0, 0, 1, 1,
-2.59817, 0.7250832, -2.670456, 1, 0, 0, 1, 1,
-2.470325, 1.091638, -0.7312898, 1, 0, 0, 1, 1,
-2.445471, -0.4802448, -1.363691, 0, 0, 0, 1, 1,
-2.319791, -0.2853091, -2.149817, 0, 0, 0, 1, 1,
-2.264802, 1.051724, -1.716961, 0, 0, 0, 1, 1,
-2.250516, 0.7604324, -0.7191243, 0, 0, 0, 1, 1,
-2.186693, 0.6598938, -0.7064729, 0, 0, 0, 1, 1,
-2.157379, -0.5011867, -2.439365, 0, 0, 0, 1, 1,
-2.155617, 0.3807243, -3.094636, 0, 0, 0, 1, 1,
-2.154978, -0.4921705, -1.19063, 1, 1, 1, 1, 1,
-2.110995, 1.004479, -2.20624, 1, 1, 1, 1, 1,
-2.095257, -1.771186, -2.973082, 1, 1, 1, 1, 1,
-2.091497, -0.4170371, -1.446072, 1, 1, 1, 1, 1,
-2.08689, -1.383061, -1.756652, 1, 1, 1, 1, 1,
-2.059298, 0.6393844, -0.8971122, 1, 1, 1, 1, 1,
-2.054711, -0.1421769, -3.300252, 1, 1, 1, 1, 1,
-2.020226, 0.1515119, -0.1374584, 1, 1, 1, 1, 1,
-1.999162, 0.4517935, -2.250284, 1, 1, 1, 1, 1,
-1.977758, -1.0626, -1.172903, 1, 1, 1, 1, 1,
-1.965294, -1.725585, -1.065839, 1, 1, 1, 1, 1,
-1.946678, -0.6491339, -3.389615, 1, 1, 1, 1, 1,
-1.915598, 0.7479472, -1.551504, 1, 1, 1, 1, 1,
-1.899275, 0.1456092, -1.6454, 1, 1, 1, 1, 1,
-1.893667, 1.394091, -1.141998, 1, 1, 1, 1, 1,
-1.87745, 0.6453778, 0.3178296, 0, 0, 1, 1, 1,
-1.862526, -1.157154, -0.6696146, 1, 0, 0, 1, 1,
-1.854486, 1.464285, -0.2332553, 1, 0, 0, 1, 1,
-1.823366, -0.883078, -2.567215, 1, 0, 0, 1, 1,
-1.82196, -1.21837, -3.062493, 1, 0, 0, 1, 1,
-1.817123, -1.011118, -2.791756, 1, 0, 0, 1, 1,
-1.80163, 0.2013281, -1.471273, 0, 0, 0, 1, 1,
-1.784208, -0.1696914, -2.7858, 0, 0, 0, 1, 1,
-1.779499, 0.8772481, -1.648921, 0, 0, 0, 1, 1,
-1.774122, -0.8986499, -2.270796, 0, 0, 0, 1, 1,
-1.755466, 1.610453, -0.4617774, 0, 0, 0, 1, 1,
-1.740833, -0.5300106, -1.421772, 0, 0, 0, 1, 1,
-1.711565, 1.241372, 0.6813628, 0, 0, 0, 1, 1,
-1.688591, -0.4957256, -3.596334, 1, 1, 1, 1, 1,
-1.677953, 0.5824297, -2.382744, 1, 1, 1, 1, 1,
-1.67462, 0.2025234, -2.043361, 1, 1, 1, 1, 1,
-1.649367, 0.4824387, -1.887875, 1, 1, 1, 1, 1,
-1.641373, 0.2333321, -0.5151331, 1, 1, 1, 1, 1,
-1.639072, 0.2083014, -2.041364, 1, 1, 1, 1, 1,
-1.633576, -0.3919935, -2.192255, 1, 1, 1, 1, 1,
-1.62627, -0.5281609, -1.767108, 1, 1, 1, 1, 1,
-1.610633, -0.6070736, 0.4204677, 1, 1, 1, 1, 1,
-1.603664, -1.032066, -2.736943, 1, 1, 1, 1, 1,
-1.60255, -0.3051673, -0.4404789, 1, 1, 1, 1, 1,
-1.564141, 0.04582895, -1.563682, 1, 1, 1, 1, 1,
-1.560868, -3.121618, -2.353695, 1, 1, 1, 1, 1,
-1.56067, -0.2683187, -2.60359, 1, 1, 1, 1, 1,
-1.544682, -0.4402452, -0.2608131, 1, 1, 1, 1, 1,
-1.537725, 0.09116155, -2.581021, 0, 0, 1, 1, 1,
-1.528372, -0.5617552, -2.189399, 1, 0, 0, 1, 1,
-1.514671, 0.180267, -0.9225017, 1, 0, 0, 1, 1,
-1.504541, -0.1878605, -2.151373, 1, 0, 0, 1, 1,
-1.49314, 0.379586, -0.6911247, 1, 0, 0, 1, 1,
-1.489962, -0.7607893, -1.681695, 1, 0, 0, 1, 1,
-1.487559, -0.2816751, -2.01906, 0, 0, 0, 1, 1,
-1.482038, -1.458605, -1.397755, 0, 0, 0, 1, 1,
-1.459549, 0.1850825, -0.1063463, 0, 0, 0, 1, 1,
-1.454256, 0.5932582, -0.2161267, 0, 0, 0, 1, 1,
-1.448212, -0.958988, -2.961797, 0, 0, 0, 1, 1,
-1.44051, -0.1897491, -2.627791, 0, 0, 0, 1, 1,
-1.434562, -0.8885792, -3.261973, 0, 0, 0, 1, 1,
-1.433558, 0.1155876, -1.052009, 1, 1, 1, 1, 1,
-1.432934, 0.7027935, 1.169957, 1, 1, 1, 1, 1,
-1.431801, 0.2392185, -1.492538, 1, 1, 1, 1, 1,
-1.420316, 0.05585221, -1.886194, 1, 1, 1, 1, 1,
-1.409358, -0.1626944, -0.9198507, 1, 1, 1, 1, 1,
-1.387862, 1.535274, -1.536758, 1, 1, 1, 1, 1,
-1.384489, -0.4847257, -0.8062405, 1, 1, 1, 1, 1,
-1.378784, -0.4376184, -3.300886, 1, 1, 1, 1, 1,
-1.368899, -0.7157876, -2.695612, 1, 1, 1, 1, 1,
-1.352897, -0.2017919, -0.05765997, 1, 1, 1, 1, 1,
-1.347409, 0.08159568, -1.254339, 1, 1, 1, 1, 1,
-1.345613, -0.5343211, 1.319807, 1, 1, 1, 1, 1,
-1.345358, 1.588893, -1.854749, 1, 1, 1, 1, 1,
-1.343136, 0.3537794, -1.803965, 1, 1, 1, 1, 1,
-1.324333, 1.414976, 0.2966079, 1, 1, 1, 1, 1,
-1.324225, -0.2360849, -1.223608, 0, 0, 1, 1, 1,
-1.323768, 0.9201839, -1.007473, 1, 0, 0, 1, 1,
-1.314678, -0.02399049, -0.8114573, 1, 0, 0, 1, 1,
-1.314128, -0.1921893, -3.138827, 1, 0, 0, 1, 1,
-1.313195, 1.372286, -0.4434023, 1, 0, 0, 1, 1,
-1.308121, 0.01549883, 0.5453651, 1, 0, 0, 1, 1,
-1.303252, -0.4773184, -1.194993, 0, 0, 0, 1, 1,
-1.298822, 0.4121922, -1.758684, 0, 0, 0, 1, 1,
-1.294901, -0.1657938, -0.7220287, 0, 0, 0, 1, 1,
-1.283556, -1.129913, -1.505379, 0, 0, 0, 1, 1,
-1.282648, 0.9181082, -0.9501792, 0, 0, 0, 1, 1,
-1.277589, -0.2372543, -1.345606, 0, 0, 0, 1, 1,
-1.271444, 0.8447212, -2.010784, 0, 0, 0, 1, 1,
-1.269792, 0.462368, -0.3546813, 1, 1, 1, 1, 1,
-1.23287, -0.1923615, -1.336004, 1, 1, 1, 1, 1,
-1.230117, 1.713959, -2.19699, 1, 1, 1, 1, 1,
-1.21284, -1.001625, -3.005713, 1, 1, 1, 1, 1,
-1.209561, 0.02760965, -2.230992, 1, 1, 1, 1, 1,
-1.20559, -0.5388741, -3.149661, 1, 1, 1, 1, 1,
-1.195215, 2.800247, -0.6750348, 1, 1, 1, 1, 1,
-1.191784, 1.060424, 0.1577746, 1, 1, 1, 1, 1,
-1.175631, 0.07639594, -2.24466, 1, 1, 1, 1, 1,
-1.166212, -1.1499, -3.901303, 1, 1, 1, 1, 1,
-1.159098, -0.5934407, -1.904181, 1, 1, 1, 1, 1,
-1.156122, -1.18397, -2.452502, 1, 1, 1, 1, 1,
-1.15499, 0.4509779, 0.9554275, 1, 1, 1, 1, 1,
-1.151477, -1.013051, -2.233028, 1, 1, 1, 1, 1,
-1.149686, -1.14308, -3.732015, 1, 1, 1, 1, 1,
-1.141775, 0.3018555, -1.225963, 0, 0, 1, 1, 1,
-1.136455, -0.3906339, -3.418052, 1, 0, 0, 1, 1,
-1.121446, 0.332567, -0.5913885, 1, 0, 0, 1, 1,
-1.120428, 0.2266096, -0.6685965, 1, 0, 0, 1, 1,
-1.112297, 1.224445, -1.147977, 1, 0, 0, 1, 1,
-1.111072, -2.15561, -2.71766, 1, 0, 0, 1, 1,
-1.106637, 0.09340794, -2.451272, 0, 0, 0, 1, 1,
-1.105346, -1.898042, -3.990005, 0, 0, 0, 1, 1,
-1.103348, 0.734147, 0.5629455, 0, 0, 0, 1, 1,
-1.102704, -0.03738289, -1.444435, 0, 0, 0, 1, 1,
-1.090205, -0.1548262, 0.04515908, 0, 0, 0, 1, 1,
-1.087901, -0.7043191, -1.189796, 0, 0, 0, 1, 1,
-1.085933, 1.11496, -1.284497, 0, 0, 0, 1, 1,
-1.076463, -0.3560618, -1.457557, 1, 1, 1, 1, 1,
-1.072166, -2.940596, -1.903921, 1, 1, 1, 1, 1,
-1.069615, 0.6862554, -0.4884638, 1, 1, 1, 1, 1,
-1.063859, 0.08798058, -2.536041, 1, 1, 1, 1, 1,
-1.063069, -1.58328, -3.27191, 1, 1, 1, 1, 1,
-1.05951, -0.9810113, -1.889262, 1, 1, 1, 1, 1,
-1.053637, 0.336331, -0.634597, 1, 1, 1, 1, 1,
-1.053312, 0.5139902, -3.049301, 1, 1, 1, 1, 1,
-1.053197, 2.634966, -0.8946811, 1, 1, 1, 1, 1,
-1.052395, -1.188292, -3.069096, 1, 1, 1, 1, 1,
-1.048676, -0.7975808, -2.857963, 1, 1, 1, 1, 1,
-1.046931, 0.6313637, -0.9503223, 1, 1, 1, 1, 1,
-1.042787, -1.157633, -2.340363, 1, 1, 1, 1, 1,
-1.040766, -0.3435409, -0.9465008, 1, 1, 1, 1, 1,
-1.036496, 0.5189435, -0.6727924, 1, 1, 1, 1, 1,
-1.03647, -1.881206, -4.524045, 0, 0, 1, 1, 1,
-1.033545, 0.3715683, -1.316093, 1, 0, 0, 1, 1,
-1.031474, 0.380106, -1.047378, 1, 0, 0, 1, 1,
-1.026786, 0.6014478, 1.041771, 1, 0, 0, 1, 1,
-1.024269, 0.4907354, -0.8846865, 1, 0, 0, 1, 1,
-1.013646, 0.5058917, -0.2766787, 1, 0, 0, 1, 1,
-1.012483, -0.4886005, -3.544795, 0, 0, 0, 1, 1,
-1.012138, -1.715023, -1.853756, 0, 0, 0, 1, 1,
-1.010725, -0.7971573, -1.563622, 0, 0, 0, 1, 1,
-1.009577, 0.4003068, -2.617111, 0, 0, 0, 1, 1,
-1.007134, 0.6492143, -0.4640331, 0, 0, 0, 1, 1,
-1.006119, -0.6413596, -2.628174, 0, 0, 0, 1, 1,
-1.005373, 0.5157712, -2.023498, 0, 0, 0, 1, 1,
-1.005005, -0.8406965, -0.8763084, 1, 1, 1, 1, 1,
-0.9948052, 1.006239, -1.322312, 1, 1, 1, 1, 1,
-0.9907513, -0.9682598, -1.456105, 1, 1, 1, 1, 1,
-0.9847935, 2.073245, -0.2166131, 1, 1, 1, 1, 1,
-0.9777794, -1.875736, -3.548744, 1, 1, 1, 1, 1,
-0.9747753, 0.8702522, -1.066664, 1, 1, 1, 1, 1,
-0.9690819, 0.8262789, -0.4975519, 1, 1, 1, 1, 1,
-0.9652729, -1.436406, -1.29343, 1, 1, 1, 1, 1,
-0.9634656, 1.101054, -0.757782, 1, 1, 1, 1, 1,
-0.9625278, 0.5747977, -1.486831, 1, 1, 1, 1, 1,
-0.9604455, -0.03995048, -1.638246, 1, 1, 1, 1, 1,
-0.9580649, 1.271847, -1.347269, 1, 1, 1, 1, 1,
-0.9508312, 0.3156706, -1.059111, 1, 1, 1, 1, 1,
-0.9494216, -0.2386516, -2.343614, 1, 1, 1, 1, 1,
-0.945271, 0.7834416, -0.9604272, 1, 1, 1, 1, 1,
-0.9419568, -0.4687769, -3.203813, 0, 0, 1, 1, 1,
-0.940051, 1.183918, -0.310369, 1, 0, 0, 1, 1,
-0.9380536, -0.9296806, -0.5788282, 1, 0, 0, 1, 1,
-0.93688, -1.319666, -1.359044, 1, 0, 0, 1, 1,
-0.9309428, -0.3216086, -3.167675, 1, 0, 0, 1, 1,
-0.9190993, 0.6821784, -0.9875538, 1, 0, 0, 1, 1,
-0.9106581, 1.566882, -1.076432, 0, 0, 0, 1, 1,
-0.8985559, 0.591876, -1.232826, 0, 0, 0, 1, 1,
-0.8971525, -2.316584, -2.829844, 0, 0, 0, 1, 1,
-0.8856575, 0.7701701, -0.204498, 0, 0, 0, 1, 1,
-0.883346, -0.03918439, -1.821407, 0, 0, 0, 1, 1,
-0.8818056, 0.1434839, -1.03955, 0, 0, 0, 1, 1,
-0.8811979, -0.0829306, -3.243083, 0, 0, 0, 1, 1,
-0.8782283, 1.46108, 0.0334273, 1, 1, 1, 1, 1,
-0.8746252, 0.1422431, -0.8905725, 1, 1, 1, 1, 1,
-0.8691552, -0.02567875, -0.8987922, 1, 1, 1, 1, 1,
-0.8663288, 1.162935, -0.4521699, 1, 1, 1, 1, 1,
-0.8660681, 0.1019628, -1.680193, 1, 1, 1, 1, 1,
-0.8620667, 0.2283208, -0.7829971, 1, 1, 1, 1, 1,
-0.8588189, -1.78359, -4.372563, 1, 1, 1, 1, 1,
-0.8489344, -0.0468967, -2.014066, 1, 1, 1, 1, 1,
-0.8473769, -0.3539923, -2.643423, 1, 1, 1, 1, 1,
-0.8437961, 0.180056, -1.45032, 1, 1, 1, 1, 1,
-0.8417701, 0.860868, -1.209474, 1, 1, 1, 1, 1,
-0.8407331, 0.8298228, -0.8666411, 1, 1, 1, 1, 1,
-0.8384984, 0.622247, 0.8314665, 1, 1, 1, 1, 1,
-0.8353552, -1.157989, -2.679352, 1, 1, 1, 1, 1,
-0.8345438, -0.3709593, -1.368208, 1, 1, 1, 1, 1,
-0.8325351, 1.483469, 0.6378322, 0, 0, 1, 1, 1,
-0.830216, -0.3121488, -3.655797, 1, 0, 0, 1, 1,
-0.8279514, 0.1930702, -1.139349, 1, 0, 0, 1, 1,
-0.8271256, 0.1299117, -1.789419, 1, 0, 0, 1, 1,
-0.8234807, -0.9755944, -3.617703, 1, 0, 0, 1, 1,
-0.8140177, -1.555817, -3.512381, 1, 0, 0, 1, 1,
-0.8118907, -0.5983663, -1.730158, 0, 0, 0, 1, 1,
-0.8084325, -0.7104036, -1.219875, 0, 0, 0, 1, 1,
-0.8010565, -0.1095613, -2.046048, 0, 0, 0, 1, 1,
-0.8004823, -1.522534, -3.481973, 0, 0, 0, 1, 1,
-0.7779923, -1.099054, -3.643978, 0, 0, 0, 1, 1,
-0.7733892, -1.160271, -3.132969, 0, 0, 0, 1, 1,
-0.7676314, -0.3452986, -1.723092, 0, 0, 0, 1, 1,
-0.7652428, 0.8460345, -1.477388, 1, 1, 1, 1, 1,
-0.7616588, 0.843114, 0.7524068, 1, 1, 1, 1, 1,
-0.7544785, -1.651877, -2.137655, 1, 1, 1, 1, 1,
-0.7524776, -0.634946, -1.070352, 1, 1, 1, 1, 1,
-0.7488854, 1.13089, -0.4252025, 1, 1, 1, 1, 1,
-0.748118, -0.474462, -3.24042, 1, 1, 1, 1, 1,
-0.7478181, -0.4066354, -2.032429, 1, 1, 1, 1, 1,
-0.7419587, -0.111558, -3.754997, 1, 1, 1, 1, 1,
-0.7397068, -0.233247, -1.2426, 1, 1, 1, 1, 1,
-0.7342957, 0.6173587, -1.77628, 1, 1, 1, 1, 1,
-0.7310714, 0.8726282, -0.03077521, 1, 1, 1, 1, 1,
-0.7168916, 0.2840907, -0.1920869, 1, 1, 1, 1, 1,
-0.7160838, 0.375344, -1.380597, 1, 1, 1, 1, 1,
-0.7128097, 0.3651744, -0.2458869, 1, 1, 1, 1, 1,
-0.7094687, 0.2474719, -2.445204, 1, 1, 1, 1, 1,
-0.7084813, -0.3207473, -0.1360831, 0, 0, 1, 1, 1,
-0.705619, 1.466641, -2.645626, 1, 0, 0, 1, 1,
-0.7034788, 0.2733429, -2.553522, 1, 0, 0, 1, 1,
-0.6970577, 0.5990478, -1.347455, 1, 0, 0, 1, 1,
-0.6934313, -0.08000032, -2.928666, 1, 0, 0, 1, 1,
-0.6922131, 0.07995788, -2.234598, 1, 0, 0, 1, 1,
-0.6920751, -0.5919285, -1.276364, 0, 0, 0, 1, 1,
-0.6657529, 1.106578, 0.8011041, 0, 0, 0, 1, 1,
-0.6635199, 0.8815413, -1.102331, 0, 0, 0, 1, 1,
-0.6633639, -0.03338917, -1.246512, 0, 0, 0, 1, 1,
-0.6514359, 0.1340564, 0.18464, 0, 0, 0, 1, 1,
-0.642144, 2.028958, -0.3197119, 0, 0, 0, 1, 1,
-0.6380898, 0.4602365, -0.1751513, 0, 0, 0, 1, 1,
-0.6365675, -0.1658783, -3.092688, 1, 1, 1, 1, 1,
-0.6334505, -0.8478758, -3.282483, 1, 1, 1, 1, 1,
-0.6325324, -0.5954831, -2.932349, 1, 1, 1, 1, 1,
-0.6292195, 0.5648996, -0.2984588, 1, 1, 1, 1, 1,
-0.6235727, -1.214968, -3.800328, 1, 1, 1, 1, 1,
-0.6231025, -0.127193, -3.087681, 1, 1, 1, 1, 1,
-0.6212325, -1.290615, -4.466125, 1, 1, 1, 1, 1,
-0.6194215, -0.832709, -1.361629, 1, 1, 1, 1, 1,
-0.6152053, -1.283871, -2.333446, 1, 1, 1, 1, 1,
-0.6112534, 0.5465727, -1.013219, 1, 1, 1, 1, 1,
-0.6111243, -0.3378499, -1.803968, 1, 1, 1, 1, 1,
-0.6081148, -0.4856856, -1.736175, 1, 1, 1, 1, 1,
-0.6049848, 0.7495981, -0.7397149, 1, 1, 1, 1, 1,
-0.6002073, -2.396966, -2.730728, 1, 1, 1, 1, 1,
-0.595615, -0.2031281, -1.673261, 1, 1, 1, 1, 1,
-0.5786034, 1.114465, -0.408552, 0, 0, 1, 1, 1,
-0.5703344, -0.08230848, -1.85414, 1, 0, 0, 1, 1,
-0.5656176, -1.339877, -2.380878, 1, 0, 0, 1, 1,
-0.565378, 1.23259, -1.133571, 1, 0, 0, 1, 1,
-0.5622149, 1.629445, -0.9548404, 1, 0, 0, 1, 1,
-0.5599381, 0.5656129, -0.1235137, 1, 0, 0, 1, 1,
-0.5591438, -0.7581807, -3.853829, 0, 0, 0, 1, 1,
-0.5557267, 0.7412604, -1.684745, 0, 0, 0, 1, 1,
-0.5513777, -0.8392745, -3.473053, 0, 0, 0, 1, 1,
-0.5491349, 1.063434, -1.110631, 0, 0, 0, 1, 1,
-0.5469416, -0.420146, -1.968574, 0, 0, 0, 1, 1,
-0.545288, 0.1776193, -1.281654, 0, 0, 0, 1, 1,
-0.5396746, -1.387323, -3.69179, 0, 0, 0, 1, 1,
-0.5375095, 1.080992, 0.05713803, 1, 1, 1, 1, 1,
-0.5372084, -0.3378929, -3.311691, 1, 1, 1, 1, 1,
-0.5336135, 1.279076, 0.7035034, 1, 1, 1, 1, 1,
-0.5328165, -1.225867, -2.336746, 1, 1, 1, 1, 1,
-0.5326115, -0.2944154, -1.485286, 1, 1, 1, 1, 1,
-0.5316751, -0.6025436, -3.824274, 1, 1, 1, 1, 1,
-0.5282583, 0.4462525, -1.885918, 1, 1, 1, 1, 1,
-0.5239735, 0.4788784, -0.8691943, 1, 1, 1, 1, 1,
-0.5198164, -0.6763413, -5.487745, 1, 1, 1, 1, 1,
-0.5166594, -0.6460083, -1.139605, 1, 1, 1, 1, 1,
-0.5099197, -0.7720759, -2.368216, 1, 1, 1, 1, 1,
-0.5093342, 0.2459612, -1.488536, 1, 1, 1, 1, 1,
-0.5044972, -1.17757, -1.456943, 1, 1, 1, 1, 1,
-0.5027763, -2.179458, -3.781847, 1, 1, 1, 1, 1,
-0.4996729, -1.355106, -3.531612, 1, 1, 1, 1, 1,
-0.4892287, -0.4379264, -3.331858, 0, 0, 1, 1, 1,
-0.4840017, -1.180729, -3.190513, 1, 0, 0, 1, 1,
-0.4817768, 0.1090326, 0.1891342, 1, 0, 0, 1, 1,
-0.4782018, -0.9026531, -3.434339, 1, 0, 0, 1, 1,
-0.477709, -0.2783687, -1.577534, 1, 0, 0, 1, 1,
-0.4688993, -0.8371704, -2.640341, 1, 0, 0, 1, 1,
-0.4650323, 0.175551, -1.367117, 0, 0, 0, 1, 1,
-0.4610362, 1.176624, 2.138119, 0, 0, 0, 1, 1,
-0.4597486, -0.1239292, -3.418666, 0, 0, 0, 1, 1,
-0.4593481, -0.6172759, -2.245792, 0, 0, 0, 1, 1,
-0.4593371, 0.88089, -0.1646878, 0, 0, 0, 1, 1,
-0.4524302, -0.8838445, -4.135124, 0, 0, 0, 1, 1,
-0.4518288, 1.266157, 0.8458272, 0, 0, 0, 1, 1,
-0.4511127, 0.01075957, -1.168727, 1, 1, 1, 1, 1,
-0.450812, -1.100863, -2.298799, 1, 1, 1, 1, 1,
-0.4500445, 0.5147964, -0.1469027, 1, 1, 1, 1, 1,
-0.4467061, 0.6053401, -0.1067176, 1, 1, 1, 1, 1,
-0.4452816, -0.8010845, -3.602751, 1, 1, 1, 1, 1,
-0.4447311, -0.5819248, -3.45077, 1, 1, 1, 1, 1,
-0.44109, 1.35687, -0.3847689, 1, 1, 1, 1, 1,
-0.4407748, 0.4627476, -0.9482796, 1, 1, 1, 1, 1,
-0.4381008, -1.483897, -4.030549, 1, 1, 1, 1, 1,
-0.4370853, 0.0204175, -2.426068, 1, 1, 1, 1, 1,
-0.4340402, -1.971316, -2.870803, 1, 1, 1, 1, 1,
-0.4332652, 1.73239, -0.4638601, 1, 1, 1, 1, 1,
-0.4306904, -1.608254, -2.537699, 1, 1, 1, 1, 1,
-0.4286158, -0.4177902, -2.156464, 1, 1, 1, 1, 1,
-0.4245927, 1.743212, 1.139497, 1, 1, 1, 1, 1,
-0.4231164, -1.569455, -2.927384, 0, 0, 1, 1, 1,
-0.4201324, 0.01822663, -1.413432, 1, 0, 0, 1, 1,
-0.4199856, 0.8678449, -0.8815607, 1, 0, 0, 1, 1,
-0.4105359, -0.7637293, -2.891842, 1, 0, 0, 1, 1,
-0.4099287, 0.1899459, -1.409356, 1, 0, 0, 1, 1,
-0.405077, 0.7561955, -0.5096195, 1, 0, 0, 1, 1,
-0.4042242, -0.1801691, -1.602857, 0, 0, 0, 1, 1,
-0.4015299, 0.8243454, -0.6004171, 0, 0, 0, 1, 1,
-0.3978899, -0.03388461, -2.63658, 0, 0, 0, 1, 1,
-0.3971099, 1.324508, 0.9513302, 0, 0, 0, 1, 1,
-0.39585, 1.413758, 1.256578, 0, 0, 0, 1, 1,
-0.3957936, -1.213853, -3.396875, 0, 0, 0, 1, 1,
-0.3955478, 1.408567, 0.9456143, 0, 0, 0, 1, 1,
-0.3917929, 1.012481, -0.6452608, 1, 1, 1, 1, 1,
-0.3845284, -0.6466135, -3.406887, 1, 1, 1, 1, 1,
-0.3815896, 2.267804, -0.7496857, 1, 1, 1, 1, 1,
-0.3813972, 0.6818059, -2.441697, 1, 1, 1, 1, 1,
-0.3759294, -1.0811, -0.6596482, 1, 1, 1, 1, 1,
-0.3731575, 0.1218747, -1.819311, 1, 1, 1, 1, 1,
-0.3716273, -1.649319, -3.717138, 1, 1, 1, 1, 1,
-0.3595823, -0.8118195, -3.029413, 1, 1, 1, 1, 1,
-0.3551693, 0.137125, -1.356846, 1, 1, 1, 1, 1,
-0.3529391, 0.3191854, -0.1416765, 1, 1, 1, 1, 1,
-0.3477222, 0.9950207, -1.418337, 1, 1, 1, 1, 1,
-0.3467779, -0.9760423, -1.886569, 1, 1, 1, 1, 1,
-0.3467169, 0.8244521, 0.8901086, 1, 1, 1, 1, 1,
-0.3453929, -1.645193, -3.68445, 1, 1, 1, 1, 1,
-0.344547, 0.7698745, -1.146268, 1, 1, 1, 1, 1,
-0.3440831, 0.6998648, 0.04280916, 0, 0, 1, 1, 1,
-0.3398917, 0.1107825, -0.7568226, 1, 0, 0, 1, 1,
-0.338611, -0.1907995, -0.4554493, 1, 0, 0, 1, 1,
-0.3355141, 1.376853, -0.4328826, 1, 0, 0, 1, 1,
-0.3350942, 1.734776, 1.711155, 1, 0, 0, 1, 1,
-0.3343469, -0.7932798, -1.668327, 1, 0, 0, 1, 1,
-0.3312978, -0.7037948, -2.274572, 0, 0, 0, 1, 1,
-0.3304456, 1.292056, -1.062921, 0, 0, 0, 1, 1,
-0.3253488, -1.462216, -2.058848, 0, 0, 0, 1, 1,
-0.3237762, -0.6990272, -1.858854, 0, 0, 0, 1, 1,
-0.3204201, -0.004806949, -2.401992, 0, 0, 0, 1, 1,
-0.3200664, 0.3827882, -1.107499, 0, 0, 0, 1, 1,
-0.3190021, 1.154162, -0.9563633, 0, 0, 0, 1, 1,
-0.3178309, 0.08488354, -1.340557, 1, 1, 1, 1, 1,
-0.3138653, 0.1213409, -2.717242, 1, 1, 1, 1, 1,
-0.3019139, 0.02645415, -1.990989, 1, 1, 1, 1, 1,
-0.2988695, 0.007711425, -1.606029, 1, 1, 1, 1, 1,
-0.2975775, 0.90685, -2.302078, 1, 1, 1, 1, 1,
-0.2956625, -0.2659634, -2.695847, 1, 1, 1, 1, 1,
-0.2947071, -0.2363061, -2.613695, 1, 1, 1, 1, 1,
-0.294699, -0.3534727, -3.8066, 1, 1, 1, 1, 1,
-0.2891891, 1.542346, -0.00717222, 1, 1, 1, 1, 1,
-0.2891359, 0.83337, -0.9634405, 1, 1, 1, 1, 1,
-0.2888957, -2.51227, -2.909979, 1, 1, 1, 1, 1,
-0.2871275, -0.6896726, -2.827408, 1, 1, 1, 1, 1,
-0.2822931, -0.629391, -3.056175, 1, 1, 1, 1, 1,
-0.2797468, 1.143881, 0.130359, 1, 1, 1, 1, 1,
-0.279473, 0.691959, 1.600108, 1, 1, 1, 1, 1,
-0.2794026, -1.901136, -1.415425, 0, 0, 1, 1, 1,
-0.2751615, 1.045615, -0.0309065, 1, 0, 0, 1, 1,
-0.2651741, 1.072481, -0.9932404, 1, 0, 0, 1, 1,
-0.2636268, 1.677711, -1.273025, 1, 0, 0, 1, 1,
-0.2568699, -0.04233576, -3.268859, 1, 0, 0, 1, 1,
-0.2544441, -0.06128594, -2.280822, 1, 0, 0, 1, 1,
-0.2445777, 1.070115, 0.2679184, 0, 0, 0, 1, 1,
-0.2425981, -1.82033, -2.996545, 0, 0, 0, 1, 1,
-0.2412432, 0.09192911, -0.757776, 0, 0, 0, 1, 1,
-0.2386314, -1.254468, -5.879491, 0, 0, 0, 1, 1,
-0.2367597, -0.5277445, -3.51142, 0, 0, 0, 1, 1,
-0.235288, 1.181212, 0.4680344, 0, 0, 0, 1, 1,
-0.2346302, -0.2668466, -3.991472, 0, 0, 0, 1, 1,
-0.2320231, 0.6361418, -0.3061204, 1, 1, 1, 1, 1,
-0.2281598, 2.323042, 0.8519411, 1, 1, 1, 1, 1,
-0.222276, -1.684723, -2.754436, 1, 1, 1, 1, 1,
-0.2197737, -1.212267, -2.726257, 1, 1, 1, 1, 1,
-0.2196716, 0.4696242, -0.319739, 1, 1, 1, 1, 1,
-0.2178872, 2.38556, 1.841344, 1, 1, 1, 1, 1,
-0.2149696, -0.5505725, -2.377276, 1, 1, 1, 1, 1,
-0.2148345, -1.520873, -1.819667, 1, 1, 1, 1, 1,
-0.213626, -1.067023, -3.268272, 1, 1, 1, 1, 1,
-0.2132739, -0.2480697, -2.567885, 1, 1, 1, 1, 1,
-0.2123479, -0.4521736, -2.313626, 1, 1, 1, 1, 1,
-0.2112031, 0.4426396, -0.4469351, 1, 1, 1, 1, 1,
-0.2011879, 0.4789926, -0.8197898, 1, 1, 1, 1, 1,
-0.2008143, -0.2796507, -4.176579, 1, 1, 1, 1, 1,
-0.2003959, 0.8898593, -0.008639965, 1, 1, 1, 1, 1,
-0.1986381, -1.380915, -2.084803, 0, 0, 1, 1, 1,
-0.1967655, -0.2737865, -1.983858, 1, 0, 0, 1, 1,
-0.1957152, 0.7235731, 2.089536, 1, 0, 0, 1, 1,
-0.19481, -0.776413, -2.803209, 1, 0, 0, 1, 1,
-0.194595, -0.4795584, -1.423312, 1, 0, 0, 1, 1,
-0.1889671, -0.2363841, -1.563515, 1, 0, 0, 1, 1,
-0.1840436, -0.8552144, -3.543623, 0, 0, 0, 1, 1,
-0.1782253, -0.07450096, -2.2186, 0, 0, 0, 1, 1,
-0.1766112, 0.2525268, -0.2660163, 0, 0, 0, 1, 1,
-0.1759902, 0.9441087, 0.5177438, 0, 0, 0, 1, 1,
-0.1705069, -0.2111879, -1.443887, 0, 0, 0, 1, 1,
-0.1704933, -1.163941, -1.805283, 0, 0, 0, 1, 1,
-0.1641983, -1.051745, -3.798089, 0, 0, 0, 1, 1,
-0.1605851, 0.4555965, -0.3228297, 1, 1, 1, 1, 1,
-0.1581671, 1.312732, -0.03249467, 1, 1, 1, 1, 1,
-0.1550373, -0.08361084, -1.798051, 1, 1, 1, 1, 1,
-0.1539809, -0.6820051, -2.939078, 1, 1, 1, 1, 1,
-0.1511441, 1.115659, -0.7580715, 1, 1, 1, 1, 1,
-0.1477709, -0.1941124, -2.336944, 1, 1, 1, 1, 1,
-0.1424517, 1.382037, -0.4406423, 1, 1, 1, 1, 1,
-0.1418675, 1.729001, -0.1815203, 1, 1, 1, 1, 1,
-0.140829, -0.4384756, -1.508316, 1, 1, 1, 1, 1,
-0.1401653, 0.4662258, -1.47133, 1, 1, 1, 1, 1,
-0.1396747, 1.189295, 0.1220866, 1, 1, 1, 1, 1,
-0.1371195, 0.8875163, -0.3829958, 1, 1, 1, 1, 1,
-0.1352865, -0.1683862, -2.809537, 1, 1, 1, 1, 1,
-0.1347862, 1.438937, 0.3794364, 1, 1, 1, 1, 1,
-0.1335407, 0.03607539, -3.345279, 1, 1, 1, 1, 1,
-0.1326153, 0.3659015, 0.2940232, 0, 0, 1, 1, 1,
-0.1188137, -1.219132, -2.235574, 1, 0, 0, 1, 1,
-0.1123103, 1.064224, -1.069243, 1, 0, 0, 1, 1,
-0.1066299, -0.115735, -1.826766, 1, 0, 0, 1, 1,
-0.1058553, -1.631705, -2.669533, 1, 0, 0, 1, 1,
-0.1049027, 0.0832369, 0.2427654, 1, 0, 0, 1, 1,
-0.1039829, -1.010041, -0.6559547, 0, 0, 0, 1, 1,
-0.1008393, 0.3296769, 0.3963124, 0, 0, 0, 1, 1,
-0.09761166, -0.03790761, -1.473464, 0, 0, 0, 1, 1,
-0.09133553, -0.6484469, -3.113189, 0, 0, 0, 1, 1,
-0.08716996, 1.06643, -0.8109642, 0, 0, 0, 1, 1,
-0.08645354, 1.085096, -0.04260423, 0, 0, 0, 1, 1,
-0.07429428, -0.3408244, -1.958895, 0, 0, 0, 1, 1,
-0.07302248, 0.7370765, 0.2851921, 1, 1, 1, 1, 1,
-0.07213195, 0.7318119, -2.026366, 1, 1, 1, 1, 1,
-0.06737308, 0.6763577, -0.3008771, 1, 1, 1, 1, 1,
-0.06576124, -0.9578895, -3.801023, 1, 1, 1, 1, 1,
-0.06566698, -0.6697713, -2.640153, 1, 1, 1, 1, 1,
-0.06420152, 0.04699521, 0.1291037, 1, 1, 1, 1, 1,
-0.0590417, -0.1660183, -4.545223, 1, 1, 1, 1, 1,
-0.05690651, -0.7164001, -3.339906, 1, 1, 1, 1, 1,
-0.05512945, -0.396766, -2.960949, 1, 1, 1, 1, 1,
-0.05019771, -1.173463, -1.148891, 1, 1, 1, 1, 1,
-0.04890558, -0.7178331, -3.492704, 1, 1, 1, 1, 1,
-0.04832903, -1.397824, -2.153185, 1, 1, 1, 1, 1,
-0.04573417, -2.062588, -2.586091, 1, 1, 1, 1, 1,
-0.04164284, -0.144675, -3.193151, 1, 1, 1, 1, 1,
-0.0340029, -2.185394, -2.495899, 1, 1, 1, 1, 1,
-0.03383594, -0.6016021, -4.310906, 0, 0, 1, 1, 1,
-0.02790189, -0.2406472, -4.500906, 1, 0, 0, 1, 1,
-0.02074659, 0.1688665, 0.09020458, 1, 0, 0, 1, 1,
-0.02072912, 0.1730146, -1.545605, 1, 0, 0, 1, 1,
-0.0158775, -0.259411, -1.515664, 1, 0, 0, 1, 1,
-0.01553011, -0.3892877, -4.18603, 1, 0, 0, 1, 1,
-0.01427225, -0.1128488, -3.171028, 0, 0, 0, 1, 1,
-0.01293025, -0.3697951, -3.345126, 0, 0, 0, 1, 1,
-0.01050282, -0.4248164, -0.8668656, 0, 0, 0, 1, 1,
-0.008486234, -0.1801773, -2.584584, 0, 0, 0, 1, 1,
-0.007501995, 0.7662876, -0.6549472, 0, 0, 0, 1, 1,
0.001645963, -0.01324784, 2.960326, 0, 0, 0, 1, 1,
0.003141643, 1.362549, -1.648528, 0, 0, 0, 1, 1,
0.005432352, 0.3039482, 0.07186761, 1, 1, 1, 1, 1,
0.006066793, -1.982315, 4.69624, 1, 1, 1, 1, 1,
0.00629185, -0.9711792, 3.342938, 1, 1, 1, 1, 1,
0.008209855, -0.2202937, 0.9261236, 1, 1, 1, 1, 1,
0.00899777, 0.2268713, 0.8172455, 1, 1, 1, 1, 1,
0.009501444, -0.4059594, 1.357415, 1, 1, 1, 1, 1,
0.01241586, -0.3439477, 3.27164, 1, 1, 1, 1, 1,
0.01352385, -1.221086, 2.152788, 1, 1, 1, 1, 1,
0.01361141, -0.5756994, 3.48344, 1, 1, 1, 1, 1,
0.01416645, 0.1749476, 0.8241588, 1, 1, 1, 1, 1,
0.02341058, -0.3018746, 3.349336, 1, 1, 1, 1, 1,
0.02418546, -0.7148905, 3.4407, 1, 1, 1, 1, 1,
0.02524475, 0.1567509, -0.3761416, 1, 1, 1, 1, 1,
0.02791227, -1.182896, 4.763948, 1, 1, 1, 1, 1,
0.03060561, -0.6541451, 2.693355, 1, 1, 1, 1, 1,
0.03468268, -0.7536, 4.758678, 0, 0, 1, 1, 1,
0.03596714, -0.8856883, 2.242975, 1, 0, 0, 1, 1,
0.03599182, 0.7604163, 0.2135534, 1, 0, 0, 1, 1,
0.03741841, 0.6400431, -0.9893568, 1, 0, 0, 1, 1,
0.04066829, 0.07802519, 0.1482002, 1, 0, 0, 1, 1,
0.04134209, -0.03120305, 2.674824, 1, 0, 0, 1, 1,
0.04247881, 0.00291134, 2.693453, 0, 0, 0, 1, 1,
0.04898078, 3.199694, 0.9083587, 0, 0, 0, 1, 1,
0.05319041, -0.1505425, 2.805852, 0, 0, 0, 1, 1,
0.05906422, -0.7561359, 1.478046, 0, 0, 0, 1, 1,
0.06035463, 0.9719222, -0.5890866, 0, 0, 0, 1, 1,
0.06153736, 0.2131054, 1.2623, 0, 0, 0, 1, 1,
0.06675011, 0.9915949, 1.595556, 0, 0, 0, 1, 1,
0.06733322, 1.390286, -1.064717, 1, 1, 1, 1, 1,
0.06985689, 0.4005415, -0.9016473, 1, 1, 1, 1, 1,
0.07007378, 0.3841208, -0.1624179, 1, 1, 1, 1, 1,
0.07269778, 0.1782997, 0.7033952, 1, 1, 1, 1, 1,
0.07674304, -0.1169217, 2.517254, 1, 1, 1, 1, 1,
0.07708987, -0.7159976, 3.175005, 1, 1, 1, 1, 1,
0.08112825, 0.1176507, 1.055505, 1, 1, 1, 1, 1,
0.08202937, 1.878963, 0.406587, 1, 1, 1, 1, 1,
0.08421712, 0.7566403, -0.2871293, 1, 1, 1, 1, 1,
0.08675016, 0.4164456, -0.4892009, 1, 1, 1, 1, 1,
0.08867937, -2.055623, 4.805168, 1, 1, 1, 1, 1,
0.09235357, -0.009951864, 2.69305, 1, 1, 1, 1, 1,
0.09237471, 0.1601164, 0.4990056, 1, 1, 1, 1, 1,
0.09563468, 1.179086, -1.799147, 1, 1, 1, 1, 1,
0.09927103, 0.08149043, 1.958066, 1, 1, 1, 1, 1,
0.1030396, -0.4975942, 2.964339, 0, 0, 1, 1, 1,
0.1050367, -0.7367036, 3.659125, 1, 0, 0, 1, 1,
0.1051877, 0.3839516, 0.980247, 1, 0, 0, 1, 1,
0.1066316, -1.159258, 1.96006, 1, 0, 0, 1, 1,
0.106851, -1.139958, 4.192645, 1, 0, 0, 1, 1,
0.1085712, -2.359845, 3.430075, 1, 0, 0, 1, 1,
0.1098912, 0.4697567, 0.6455532, 0, 0, 0, 1, 1,
0.1121839, -0.6341717, 3.359128, 0, 0, 0, 1, 1,
0.113971, -1.06903, 2.590342, 0, 0, 0, 1, 1,
0.1159635, 0.9817497, -1.006264, 0, 0, 0, 1, 1,
0.1163276, -3.2684, 3.857754, 0, 0, 0, 1, 1,
0.1182645, -3.783897, 3.73793, 0, 0, 0, 1, 1,
0.1196247, -0.5951191, 3.359085, 0, 0, 0, 1, 1,
0.1270328, 1.092987, -1.229252, 1, 1, 1, 1, 1,
0.1273518, -0.006882261, 1.567992, 1, 1, 1, 1, 1,
0.1299058, -0.1221812, 3.863794, 1, 1, 1, 1, 1,
0.1353323, 0.675144, -1.13587, 1, 1, 1, 1, 1,
0.1367626, 0.4381106, 0.534767, 1, 1, 1, 1, 1,
0.1396114, -0.5827948, 2.100893, 1, 1, 1, 1, 1,
0.1421882, -1.289446, 3.041716, 1, 1, 1, 1, 1,
0.1485972, -0.371027, 2.933988, 1, 1, 1, 1, 1,
0.1491867, -1.12557, 2.441824, 1, 1, 1, 1, 1,
0.1493376, 0.8511274, 0.251482, 1, 1, 1, 1, 1,
0.149634, -2.374307, 2.373096, 1, 1, 1, 1, 1,
0.1499969, 0.2222244, 0.6850813, 1, 1, 1, 1, 1,
0.15317, 0.1036664, -0.5219723, 1, 1, 1, 1, 1,
0.153733, 0.587832, 0.1632582, 1, 1, 1, 1, 1,
0.1619594, -0.7112194, 4.081573, 1, 1, 1, 1, 1,
0.164915, 1.064406, -0.1777155, 0, 0, 1, 1, 1,
0.1654944, -0.7360634, 2.047534, 1, 0, 0, 1, 1,
0.1670544, 0.3747215, 0.8094687, 1, 0, 0, 1, 1,
0.1704703, 0.004267341, 2.733468, 1, 0, 0, 1, 1,
0.1727297, -0.1808618, 1.398762, 1, 0, 0, 1, 1,
0.1774614, -0.6044571, 2.875756, 1, 0, 0, 1, 1,
0.1819992, -1.186278, 3.551288, 0, 0, 0, 1, 1,
0.1846923, -1.178215, 1.658367, 0, 0, 0, 1, 1,
0.1910415, 0.5678379, -1.154478, 0, 0, 0, 1, 1,
0.1977769, 2.171181, -0.3132752, 0, 0, 0, 1, 1,
0.2012696, 0.3500851, 1.351112, 0, 0, 0, 1, 1,
0.201717, 0.0571976, 1.043633, 0, 0, 0, 1, 1,
0.2018607, 0.05398505, 0.882603, 0, 0, 0, 1, 1,
0.2029306, 0.9493558, 0.4058135, 1, 1, 1, 1, 1,
0.204782, 0.8722469, 1.82198, 1, 1, 1, 1, 1,
0.2050475, 1.26848, -0.5053216, 1, 1, 1, 1, 1,
0.2084639, 1.436654, 0.4438595, 1, 1, 1, 1, 1,
0.2121353, -1.296469, 3.560591, 1, 1, 1, 1, 1,
0.2141657, -1.421432, 3.309257, 1, 1, 1, 1, 1,
0.2195672, 1.35348, 0.6504791, 1, 1, 1, 1, 1,
0.2196476, 1.915156, -1.46964, 1, 1, 1, 1, 1,
0.2215214, 0.3759089, 0.4832629, 1, 1, 1, 1, 1,
0.2236813, 1.39778, 0.5603496, 1, 1, 1, 1, 1,
0.2251007, 0.2485106, 1.89368, 1, 1, 1, 1, 1,
0.2261921, -0.1356368, 3.871056, 1, 1, 1, 1, 1,
0.2267075, -0.5973688, 2.092728, 1, 1, 1, 1, 1,
0.2268669, -0.8988732, 4.181169, 1, 1, 1, 1, 1,
0.2286123, -0.6584951, 4.128315, 1, 1, 1, 1, 1,
0.229185, 0.7192249, 0.132765, 0, 0, 1, 1, 1,
0.2302245, 0.3791531, 1.496047, 1, 0, 0, 1, 1,
0.2318584, 0.3424945, -0.1218619, 1, 0, 0, 1, 1,
0.2323011, -0.1455024, 1.747719, 1, 0, 0, 1, 1,
0.2360902, 1.103701, -1.344647, 1, 0, 0, 1, 1,
0.2365602, -0.6930911, 3.914953, 1, 0, 0, 1, 1,
0.2392648, -0.5496144, 2.852334, 0, 0, 0, 1, 1,
0.2428836, 0.4744821, -0.1255392, 0, 0, 0, 1, 1,
0.2446714, 1.574265, 0.5052258, 0, 0, 0, 1, 1,
0.2479081, -0.7246655, 1.68097, 0, 0, 0, 1, 1,
0.2491432, 0.4626293, 0.4052332, 0, 0, 0, 1, 1,
0.2560684, -0.8984153, 3.274359, 0, 0, 0, 1, 1,
0.2564886, 1.009415, 0.5323182, 0, 0, 0, 1, 1,
0.2604357, 1.835778, 1.300612, 1, 1, 1, 1, 1,
0.2634756, -1.154231, 1.359836, 1, 1, 1, 1, 1,
0.2639613, -0.8828788, 1.074662, 1, 1, 1, 1, 1,
0.2682068, 2.85982, 0.2258151, 1, 1, 1, 1, 1,
0.2695127, 2.192746, -0.3223861, 1, 1, 1, 1, 1,
0.2702209, 0.09261552, 1.289452, 1, 1, 1, 1, 1,
0.2721809, 0.059437, 1.021617, 1, 1, 1, 1, 1,
0.2789258, -0.6787637, 3.700541, 1, 1, 1, 1, 1,
0.2817651, 0.6038617, -2.449285, 1, 1, 1, 1, 1,
0.2828445, -1.280656, 1.132092, 1, 1, 1, 1, 1,
0.2830356, -0.353041, 1.172529, 1, 1, 1, 1, 1,
0.2845492, -0.03475976, 1.903891, 1, 1, 1, 1, 1,
0.2871102, -0.5637496, 2.345345, 1, 1, 1, 1, 1,
0.2871346, -2.076973, 2.531206, 1, 1, 1, 1, 1,
0.2915808, -0.384502, 4.089759, 1, 1, 1, 1, 1,
0.291988, 0.9180128, 0.0299204, 0, 0, 1, 1, 1,
0.2925507, -0.6971378, 2.624247, 1, 0, 0, 1, 1,
0.2937004, 0.03182667, 0.2151227, 1, 0, 0, 1, 1,
0.2947147, -0.8358034, 3.571938, 1, 0, 0, 1, 1,
0.2959068, 0.6675532, 0.533517, 1, 0, 0, 1, 1,
0.2973712, -2.02939, 3.123806, 1, 0, 0, 1, 1,
0.2985943, 0.607798, 2.332749, 0, 0, 0, 1, 1,
0.2993909, 0.7447763, -0.5075729, 0, 0, 0, 1, 1,
0.3100073, -0.9614768, 4.0872, 0, 0, 0, 1, 1,
0.3101972, 1.817527, -0.2293553, 0, 0, 0, 1, 1,
0.3131288, -0.8233529, 4.19865, 0, 0, 0, 1, 1,
0.3145173, 0.6294115, 2.472493, 0, 0, 0, 1, 1,
0.3172252, -0.3551068, 1.309409, 0, 0, 0, 1, 1,
0.3198348, -1.280749, 2.775616, 1, 1, 1, 1, 1,
0.3323171, -0.9017766, 2.356516, 1, 1, 1, 1, 1,
0.3345081, 0.7318573, 1.041984, 1, 1, 1, 1, 1,
0.3367387, -0.1004958, 3.550806, 1, 1, 1, 1, 1,
0.3416154, 1.167343, 0.4360117, 1, 1, 1, 1, 1,
0.343335, 0.2502741, 2.897428, 1, 1, 1, 1, 1,
0.3445358, 0.2228877, 1.333125, 1, 1, 1, 1, 1,
0.3482974, 0.4051181, -1.048711, 1, 1, 1, 1, 1,
0.3505721, 0.7591448, 0.7638688, 1, 1, 1, 1, 1,
0.3534793, 0.1558121, 0.8256991, 1, 1, 1, 1, 1,
0.3541268, 0.3902331, 0.1307639, 1, 1, 1, 1, 1,
0.3685817, 0.2339516, 0.7681846, 1, 1, 1, 1, 1,
0.3695958, -0.3794704, 2.658754, 1, 1, 1, 1, 1,
0.3709573, 0.05314957, 1.931017, 1, 1, 1, 1, 1,
0.3783181, 2.15561, -1.056719, 1, 1, 1, 1, 1,
0.3811044, -1.900497, 4.235567, 0, 0, 1, 1, 1,
0.391161, -1.614583, 2.210817, 1, 0, 0, 1, 1,
0.391195, -2.624721, 2.695792, 1, 0, 0, 1, 1,
0.3919784, 1.518528, -0.4880173, 1, 0, 0, 1, 1,
0.3933549, -0.3059599, 2.325398, 1, 0, 0, 1, 1,
0.3970331, -0.7491955, 3.49307, 1, 0, 0, 1, 1,
0.3998987, -0.4268997, 2.780628, 0, 0, 0, 1, 1,
0.4055572, 1.087188, -0.3917383, 0, 0, 0, 1, 1,
0.4143336, 0.388506, 1.028812, 0, 0, 0, 1, 1,
0.4155794, -0.3004561, 3.498775, 0, 0, 0, 1, 1,
0.4164619, -1.067032, 2.030543, 0, 0, 0, 1, 1,
0.417453, -0.2945081, 1.525946, 0, 0, 0, 1, 1,
0.4226875, -1.051865, 4.133935, 0, 0, 0, 1, 1,
0.4252349, 0.1224835, 0.7625299, 1, 1, 1, 1, 1,
0.4300977, 0.8579485, 1.208322, 1, 1, 1, 1, 1,
0.4323177, -0.4028159, 3.323469, 1, 1, 1, 1, 1,
0.4367101, 0.1898006, 0.9391884, 1, 1, 1, 1, 1,
0.4397868, -0.1304129, 3.532426, 1, 1, 1, 1, 1,
0.4429962, -0.2230758, 1.668838, 1, 1, 1, 1, 1,
0.4433891, 0.8064753, 1.247961, 1, 1, 1, 1, 1,
0.4504982, 0.4213232, 0.3805737, 1, 1, 1, 1, 1,
0.4505762, -1.431457, 3.803144, 1, 1, 1, 1, 1,
0.4508427, -0.5791876, 2.347949, 1, 1, 1, 1, 1,
0.4521256, 2.700469, 0.9549606, 1, 1, 1, 1, 1,
0.4568066, 3.154707, 0.7610404, 1, 1, 1, 1, 1,
0.4572257, -0.5910304, 2.070354, 1, 1, 1, 1, 1,
0.4591309, 0.9543217, -1.174899, 1, 1, 1, 1, 1,
0.460216, -0.6634184, 2.43319, 1, 1, 1, 1, 1,
0.4616743, -3.626143, 3.863705, 0, 0, 1, 1, 1,
0.4669885, 0.05284438, 1.490564, 1, 0, 0, 1, 1,
0.4679483, 0.440591, 0.3366446, 1, 0, 0, 1, 1,
0.4709745, 0.9584723, 0.6525729, 1, 0, 0, 1, 1,
0.4713805, 0.9581375, 2.026319, 1, 0, 0, 1, 1,
0.4762206, 0.9488659, 0.7807862, 1, 0, 0, 1, 1,
0.4771038, 0.001269329, -0.560266, 0, 0, 0, 1, 1,
0.4787463, -1.867453, 3.502006, 0, 0, 0, 1, 1,
0.4795296, 0.8564835, -0.8444001, 0, 0, 0, 1, 1,
0.4837867, -0.03107506, 3.202707, 0, 0, 0, 1, 1,
0.4854915, -1.170554, 4.058059, 0, 0, 0, 1, 1,
0.486686, 1.839895, 1.467479, 0, 0, 0, 1, 1,
0.4880446, -0.9675314, 3.454876, 0, 0, 0, 1, 1,
0.490434, 0.5735381, 0.1121885, 1, 1, 1, 1, 1,
0.4938318, -0.6977234, 3.941024, 1, 1, 1, 1, 1,
0.4939228, 0.2698344, 2.826291, 1, 1, 1, 1, 1,
0.4997498, 0.6904538, 0.9043168, 1, 1, 1, 1, 1,
0.5017722, -0.05879617, 2.290147, 1, 1, 1, 1, 1,
0.5031517, -0.9984583, 1.740763, 1, 1, 1, 1, 1,
0.5073077, -0.8108674, 3.901054, 1, 1, 1, 1, 1,
0.5084489, -0.8670343, 3.445729, 1, 1, 1, 1, 1,
0.5099887, -0.9676053, 2.107939, 1, 1, 1, 1, 1,
0.5159085, -0.4787862, 1.896767, 1, 1, 1, 1, 1,
0.5159464, 0.3747856, 3.068849, 1, 1, 1, 1, 1,
0.5180936, -0.1376361, 1.642394, 1, 1, 1, 1, 1,
0.5238473, -0.3613342, 2.241071, 1, 1, 1, 1, 1,
0.5256978, 1.678587, 0.9439539, 1, 1, 1, 1, 1,
0.528565, 0.7859779, 1.431796, 1, 1, 1, 1, 1,
0.5305181, 0.9230704, -0.3314521, 0, 0, 1, 1, 1,
0.5307685, -0.2981594, 3.610982, 1, 0, 0, 1, 1,
0.5327612, 1.657105, 1.272632, 1, 0, 0, 1, 1,
0.534788, 0.1233078, 0.9461883, 1, 0, 0, 1, 1,
0.5360555, 0.1962115, 1.288652, 1, 0, 0, 1, 1,
0.5361909, -0.2453204, 1.298188, 1, 0, 0, 1, 1,
0.5364596, -1.640501, 3.378425, 0, 0, 0, 1, 1,
0.5415241, 1.065701, -1.366229, 0, 0, 0, 1, 1,
0.5478958, -0.1762842, 3.920709, 0, 0, 0, 1, 1,
0.5585807, -0.8055707, 4.309002, 0, 0, 0, 1, 1,
0.5591807, -1.72737, 2.731233, 0, 0, 0, 1, 1,
0.5598322, 1.379392, -0.2742896, 0, 0, 0, 1, 1,
0.5602986, -1.635416, 1.513856, 0, 0, 0, 1, 1,
0.5606974, -0.243266, 0.8427857, 1, 1, 1, 1, 1,
0.5692406, 0.07317457, 0.04260416, 1, 1, 1, 1, 1,
0.5720574, -0.03707645, 3.554715, 1, 1, 1, 1, 1,
0.5731774, -1.204059, 2.212818, 1, 1, 1, 1, 1,
0.5786461, 0.1509452, 2.151141, 1, 1, 1, 1, 1,
0.5792254, -0.9076292, 2.359732, 1, 1, 1, 1, 1,
0.5887922, 0.008573174, 2.618642, 1, 1, 1, 1, 1,
0.5939026, -0.4509992, 2.347963, 1, 1, 1, 1, 1,
0.5943767, 0.9664587, 1.738422, 1, 1, 1, 1, 1,
0.597055, -0.07217398, 3.028187, 1, 1, 1, 1, 1,
0.5972534, -0.8638164, 1.080229, 1, 1, 1, 1, 1,
0.6026621, -1.450423, 2.895051, 1, 1, 1, 1, 1,
0.603226, -1.088971, 2.440983, 1, 1, 1, 1, 1,
0.6117818, 0.5297318, 1.663142, 1, 1, 1, 1, 1,
0.613113, 1.962952, -0.5482951, 1, 1, 1, 1, 1,
0.6133999, -2.671907, 3.792686, 0, 0, 1, 1, 1,
0.6162328, -0.7479905, 2.216018, 1, 0, 0, 1, 1,
0.6203093, -0.7377587, 1.523822, 1, 0, 0, 1, 1,
0.620358, 1.100907, 2.016505, 1, 0, 0, 1, 1,
0.6206551, -0.4288474, 1.648472, 1, 0, 0, 1, 1,
0.6231223, 0.7641119, 1.439705, 1, 0, 0, 1, 1,
0.6254718, -2.186576, 4.762279, 0, 0, 0, 1, 1,
0.6258713, 0.8969214, 3.213156, 0, 0, 0, 1, 1,
0.6306648, -1.868324, 3.007196, 0, 0, 0, 1, 1,
0.6325689, 0.4227895, 1.980719, 0, 0, 0, 1, 1,
0.6349238, 0.6371323, -1.008449, 0, 0, 0, 1, 1,
0.6389972, -0.2615919, 0.4984736, 0, 0, 0, 1, 1,
0.6424216, -0.1790759, 4.342238, 0, 0, 0, 1, 1,
0.6433605, 0.07346987, 0.3796023, 1, 1, 1, 1, 1,
0.6471065, -1.620509, 3.898167, 1, 1, 1, 1, 1,
0.6491661, -1.162519, 4.314351, 1, 1, 1, 1, 1,
0.6524398, 0.5484736, 2.515005, 1, 1, 1, 1, 1,
0.6561198, 0.2044122, 0.7990768, 1, 1, 1, 1, 1,
0.6565132, 0.4089958, 0.198662, 1, 1, 1, 1, 1,
0.6621723, -1.271384, 2.817482, 1, 1, 1, 1, 1,
0.6696641, 0.6697533, 1.029157, 1, 1, 1, 1, 1,
0.6699088, 1.406707, 1.078081, 1, 1, 1, 1, 1,
0.671386, 0.2475963, -0.4067543, 1, 1, 1, 1, 1,
0.6731866, -0.9283215, 2.543373, 1, 1, 1, 1, 1,
0.6748816, -0.5822021, 1.250548, 1, 1, 1, 1, 1,
0.675, -0.766704, 2.162037, 1, 1, 1, 1, 1,
0.6752536, -0.4408047, 1.397428, 1, 1, 1, 1, 1,
0.6773996, -0.4890929, 1.58138, 1, 1, 1, 1, 1,
0.6809611, -1.427523, 2.881551, 0, 0, 1, 1, 1,
0.6829706, 2.090479, 1.633999, 1, 0, 0, 1, 1,
0.6840267, -1.797834, 1.879673, 1, 0, 0, 1, 1,
0.6925924, -0.3605951, 3.654733, 1, 0, 0, 1, 1,
0.695112, 2.083897, 0.01862503, 1, 0, 0, 1, 1,
0.7053543, 0.01953558, 2.296066, 1, 0, 0, 1, 1,
0.7079235, -1.140277, 3.536811, 0, 0, 0, 1, 1,
0.7080494, -0.799093, 1.656537, 0, 0, 0, 1, 1,
0.7083834, -0.6429181, 1.6031, 0, 0, 0, 1, 1,
0.7116163, 0.845943, -1.247839, 0, 0, 0, 1, 1,
0.7167465, -1.244462, 1.402993, 0, 0, 0, 1, 1,
0.7180464, -0.5679192, 1.38904, 0, 0, 0, 1, 1,
0.7187725, 1.382074, 1.242035, 0, 0, 0, 1, 1,
0.7204283, 0.2102071, 3.010792, 1, 1, 1, 1, 1,
0.7242349, -1.426485, 2.922449, 1, 1, 1, 1, 1,
0.7267222, 0.2797529, 2.916237, 1, 1, 1, 1, 1,
0.7371139, -0.9847549, 2.585024, 1, 1, 1, 1, 1,
0.7381381, 0.9242637, 0.05329262, 1, 1, 1, 1, 1,
0.7385687, 0.7303698, 1.514336, 1, 1, 1, 1, 1,
0.7407499, -0.1052106, 1.792059, 1, 1, 1, 1, 1,
0.7427729, 0.2200311, 1.067314, 1, 1, 1, 1, 1,
0.7464085, -0.2287509, 1.697558, 1, 1, 1, 1, 1,
0.7489011, -0.1048729, 2.522279, 1, 1, 1, 1, 1,
0.7552842, -1.251949, 3.121597, 1, 1, 1, 1, 1,
0.7622322, -0.4660177, 2.987703, 1, 1, 1, 1, 1,
0.763853, -0.4632019, 2.511114, 1, 1, 1, 1, 1,
0.7651616, -0.5205767, 0.1600168, 1, 1, 1, 1, 1,
0.7704868, -2.26962, 0.9714835, 1, 1, 1, 1, 1,
0.7758676, 0.2370757, -0.3918729, 0, 0, 1, 1, 1,
0.7786947, -1.677749, 4.332863, 1, 0, 0, 1, 1,
0.7858191, 0.1282756, 0.5396914, 1, 0, 0, 1, 1,
0.7888097, 0.02194524, 1.601669, 1, 0, 0, 1, 1,
0.7948644, -0.1422381, 0.7310113, 1, 0, 0, 1, 1,
0.8001735, 0.6331831, 0.4546309, 1, 0, 0, 1, 1,
0.807668, 0.7324277, 0.6663471, 0, 0, 0, 1, 1,
0.8077196, 1.595817, 1.282964, 0, 0, 0, 1, 1,
0.808561, 0.5932074, 1.614833, 0, 0, 0, 1, 1,
0.8091851, 1.844111, 0.6847948, 0, 0, 0, 1, 1,
0.8160441, -0.6093306, 0.9274234, 0, 0, 0, 1, 1,
0.8168812, -0.3584734, 1.388296, 0, 0, 0, 1, 1,
0.8185147, -0.3776892, 1.597845, 0, 0, 0, 1, 1,
0.8226871, 2.489413, 1.338124, 1, 1, 1, 1, 1,
0.8271723, 3.015159, -0.7205937, 1, 1, 1, 1, 1,
0.8287477, 0.8960848, 0.9433683, 1, 1, 1, 1, 1,
0.8306956, 0.3508162, 0.7267039, 1, 1, 1, 1, 1,
0.8325268, -0.2108238, 2.602926, 1, 1, 1, 1, 1,
0.8346853, -1.015716, 2.508526, 1, 1, 1, 1, 1,
0.8376428, -1.306049, 2.176485, 1, 1, 1, 1, 1,
0.8397957, -0.8718901, 2.320887, 1, 1, 1, 1, 1,
0.84421, 1.591244, -0.8282239, 1, 1, 1, 1, 1,
0.8468758, 0.3136635, 0.6264331, 1, 1, 1, 1, 1,
0.8516174, 1.3266, 1.382097, 1, 1, 1, 1, 1,
0.8523521, 1.583648, -0.1518638, 1, 1, 1, 1, 1,
0.8593495, -1.101762, 3.309442, 1, 1, 1, 1, 1,
0.8665503, 1.00034, 0.7211443, 1, 1, 1, 1, 1,
0.8712423, -1.255857, 2.081041, 1, 1, 1, 1, 1,
0.8751668, -0.7925247, 2.682867, 0, 0, 1, 1, 1,
0.8762947, 0.7333081, -0.6554832, 1, 0, 0, 1, 1,
0.8777266, 0.2305353, 1.66459, 1, 0, 0, 1, 1,
0.8848052, 1.63881, 1.200829, 1, 0, 0, 1, 1,
0.8860203, 0.2270164, 0.6160671, 1, 0, 0, 1, 1,
0.8921098, 0.8243771, 1.394119, 1, 0, 0, 1, 1,
0.8946461, 1.190875, 0.6965319, 0, 0, 0, 1, 1,
0.8953525, 0.7789659, 0.1710285, 0, 0, 0, 1, 1,
0.8964116, 0.3223318, 1.377531, 0, 0, 0, 1, 1,
0.9002975, 0.6399472, 0.5196905, 0, 0, 0, 1, 1,
0.9045426, 1.455338, 0.7638201, 0, 0, 0, 1, 1,
0.9062094, -0.7001833, 0.9326829, 0, 0, 0, 1, 1,
0.9117525, -0.6662037, 1.647137, 0, 0, 0, 1, 1,
0.9141178, 0.5885563, 0.01539479, 1, 1, 1, 1, 1,
0.9155454, 1.623025, 0.9166774, 1, 1, 1, 1, 1,
0.9275634, -0.6148569, 2.037074, 1, 1, 1, 1, 1,
0.9283034, -0.6825527, 0.7778502, 1, 1, 1, 1, 1,
0.9363421, 0.581761, -0.6337397, 1, 1, 1, 1, 1,
0.9366699, 0.07115867, 0.4708936, 1, 1, 1, 1, 1,
0.9377961, -1.256304, 2.231617, 1, 1, 1, 1, 1,
0.9389925, 1.13974, 0.6723322, 1, 1, 1, 1, 1,
0.9460966, -0.3464165, 2.8199, 1, 1, 1, 1, 1,
0.9481905, -2.803766, 2.689434, 1, 1, 1, 1, 1,
0.9631207, -0.7556159, 2.578321, 1, 1, 1, 1, 1,
0.9634723, -1.623685, 3.678578, 1, 1, 1, 1, 1,
0.9665249, 0.1392153, 1.53467, 1, 1, 1, 1, 1,
0.9716876, -0.2502299, 1.381082, 1, 1, 1, 1, 1,
0.9743955, 0.6234516, 3.058961, 1, 1, 1, 1, 1,
0.9869774, 0.695103, 0.4027117, 0, 0, 1, 1, 1,
1.000596, -1.063031, 2.569821, 1, 0, 0, 1, 1,
1.005348, -0.04476599, 0.4025223, 1, 0, 0, 1, 1,
1.01251, -1.300339, 3.893452, 1, 0, 0, 1, 1,
1.017689, 1.310617, -0.3354268, 1, 0, 0, 1, 1,
1.018816, -0.7112094, 1.563434, 1, 0, 0, 1, 1,
1.018886, -0.5529589, 1.504584, 0, 0, 0, 1, 1,
1.026633, 0.5182484, 2.184232, 0, 0, 0, 1, 1,
1.026924, 0.4525011, 1.036142, 0, 0, 0, 1, 1,
1.033391, -1.559203, 3.710098, 0, 0, 0, 1, 1,
1.039216, -0.4211904, 1.886654, 0, 0, 0, 1, 1,
1.040044, -2.408589, 2.852674, 0, 0, 0, 1, 1,
1.04386, -0.7263241, 1.80948, 0, 0, 0, 1, 1,
1.045659, -1.902751, 1.409721, 1, 1, 1, 1, 1,
1.047909, 0.2523303, 1.425318, 1, 1, 1, 1, 1,
1.050487, 0.04603251, 1.375043, 1, 1, 1, 1, 1,
1.053916, -0.7434019, 1.336816, 1, 1, 1, 1, 1,
1.057247, -0.3547606, 2.90331, 1, 1, 1, 1, 1,
1.058596, -1.056245, -0.3532335, 1, 1, 1, 1, 1,
1.059501, -2.48092, 2.493959, 1, 1, 1, 1, 1,
1.059721, 1.647119, 0.8825118, 1, 1, 1, 1, 1,
1.06414, 2.075945, 1.489349, 1, 1, 1, 1, 1,
1.06754, 0.1526558, -0.6872573, 1, 1, 1, 1, 1,
1.069327, 0.6444101, 0.739355, 1, 1, 1, 1, 1,
1.071538, -1.799314, 2.632396, 1, 1, 1, 1, 1,
1.076023, -1.006437, 2.732551, 1, 1, 1, 1, 1,
1.084568, 1.612341, 1.841282, 1, 1, 1, 1, 1,
1.084821, 0.06842598, 1.965741, 1, 1, 1, 1, 1,
1.090332, -1.155239, 3.47542, 0, 0, 1, 1, 1,
1.091406, 1.61778, -0.2861268, 1, 0, 0, 1, 1,
1.103779, 1.029442, 0.6146088, 1, 0, 0, 1, 1,
1.104131, 0.6297566, 0.8870411, 1, 0, 0, 1, 1,
1.107355, -1.613552, 3.172678, 1, 0, 0, 1, 1,
1.113414, -0.8443909, 1.501195, 1, 0, 0, 1, 1,
1.11768, -0.5826268, 0.8614316, 0, 0, 0, 1, 1,
1.123314, 0.2909321, -0.3501312, 0, 0, 0, 1, 1,
1.127228, -0.5796909, 2.381415, 0, 0, 0, 1, 1,
1.130236, -0.9890038, 2.039069, 0, 0, 0, 1, 1,
1.136933, 0.04211924, 1.0072, 0, 0, 0, 1, 1,
1.14289, -2.162743, 3.855611, 0, 0, 0, 1, 1,
1.146999, -1.25173, 0.7238957, 0, 0, 0, 1, 1,
1.147893, 1.226943, 1.951867, 1, 1, 1, 1, 1,
1.158093, 0.3598705, 0.1838033, 1, 1, 1, 1, 1,
1.163083, -2.0148, 2.469704, 1, 1, 1, 1, 1,
1.163322, 0.3362987, 1.200789, 1, 1, 1, 1, 1,
1.165106, -0.5453551, 1.246243, 1, 1, 1, 1, 1,
1.166219, 1.013124, 2.455985, 1, 1, 1, 1, 1,
1.169198, 0.06075597, 2.39902, 1, 1, 1, 1, 1,
1.171613, 0.6932482, 1.72964, 1, 1, 1, 1, 1,
1.175184, -0.7862824, 2.794694, 1, 1, 1, 1, 1,
1.175501, 0.9150428, 0.9704441, 1, 1, 1, 1, 1,
1.185334, 0.4623477, 0.1847169, 1, 1, 1, 1, 1,
1.188455, 0.009729747, 1.798262, 1, 1, 1, 1, 1,
1.19664, 2.161916, 0.9942157, 1, 1, 1, 1, 1,
1.200398, 0.2235595, 1.40062, 1, 1, 1, 1, 1,
1.20219, -0.5647529, 0.8727651, 1, 1, 1, 1, 1,
1.20382, -0.2503342, 2.506568, 0, 0, 1, 1, 1,
1.210361, 1.966238, -0.6431679, 1, 0, 0, 1, 1,
1.213953, -0.9072986, 3.275534, 1, 0, 0, 1, 1,
1.220397, 0.864827, 1.534376, 1, 0, 0, 1, 1,
1.231128, 0.04696899, 0.6747143, 1, 0, 0, 1, 1,
1.234895, 0.102619, 1.575639, 1, 0, 0, 1, 1,
1.236156, 0.02317984, 1.26115, 0, 0, 0, 1, 1,
1.24824, 0.2910338, 1.378152, 0, 0, 0, 1, 1,
1.251476, -0.9441094, 1.960631, 0, 0, 0, 1, 1,
1.257073, -0.5737708, 2.677457, 0, 0, 0, 1, 1,
1.258635, 0.09841702, 1.365699, 0, 0, 0, 1, 1,
1.263645, 0.6217628, 1.578268, 0, 0, 0, 1, 1,
1.265654, 2.720097, 0.07987205, 0, 0, 0, 1, 1,
1.279589, -0.0595385, 0.7681581, 1, 1, 1, 1, 1,
1.30288, -2.423498, 1.605577, 1, 1, 1, 1, 1,
1.30424, -1.359904, 3.764906, 1, 1, 1, 1, 1,
1.304884, -0.821237, 1.447339, 1, 1, 1, 1, 1,
1.305343, -0.6569487, 2.343064, 1, 1, 1, 1, 1,
1.305657, 1.328758, 0.245936, 1, 1, 1, 1, 1,
1.30872, 0.09155129, 1.153834, 1, 1, 1, 1, 1,
1.309943, -0.1700333, 2.503938, 1, 1, 1, 1, 1,
1.316696, -0.2927752, 3.497072, 1, 1, 1, 1, 1,
1.323099, -0.3610584, 0.4156381, 1, 1, 1, 1, 1,
1.323786, 0.5241227, 1.96543, 1, 1, 1, 1, 1,
1.327098, -1.642246, 2.208762, 1, 1, 1, 1, 1,
1.327918, -0.05414964, 0.8837513, 1, 1, 1, 1, 1,
1.330666, 1.604664, 0.002499972, 1, 1, 1, 1, 1,
1.3341, -1.149831, 2.483186, 1, 1, 1, 1, 1,
1.339368, 1.235181, 2.745962, 0, 0, 1, 1, 1,
1.343567, -0.3428591, 3.714358, 1, 0, 0, 1, 1,
1.346966, -1.618013, 4.300034, 1, 0, 0, 1, 1,
1.353892, -2.061072, 1.428946, 1, 0, 0, 1, 1,
1.356348, 0.5163358, -0.1566247, 1, 0, 0, 1, 1,
1.366628, -0.06500025, 0.7476332, 1, 0, 0, 1, 1,
1.36681, 0.4428627, 0.7024693, 0, 0, 0, 1, 1,
1.367026, 0.3239713, 0.4217263, 0, 0, 0, 1, 1,
1.372968, 1.118522, 1.293441, 0, 0, 0, 1, 1,
1.376711, -0.8624672, 1.239056, 0, 0, 0, 1, 1,
1.380475, 1.124965, 0.8349482, 0, 0, 0, 1, 1,
1.390525, 2.895753, 2.307202, 0, 0, 0, 1, 1,
1.39136, 0.648267, 0.8990975, 0, 0, 0, 1, 1,
1.394048, 0.4766023, 1.086781, 1, 1, 1, 1, 1,
1.39639, -0.5538797, 3.074649, 1, 1, 1, 1, 1,
1.447154, 2.346275, -0.208701, 1, 1, 1, 1, 1,
1.447737, -0.6139339, 1.813477, 1, 1, 1, 1, 1,
1.455972, -0.5148119, 1.708246, 1, 1, 1, 1, 1,
1.472073, -0.2426712, 2.336578, 1, 1, 1, 1, 1,
1.473552, -0.4679406, 1.8027, 1, 1, 1, 1, 1,
1.476557, -0.8631576, 2.356553, 1, 1, 1, 1, 1,
1.496832, 2.208511, 0.3873792, 1, 1, 1, 1, 1,
1.4978, -0.5192761, 0.9801967, 1, 1, 1, 1, 1,
1.510665, -0.2826415, 2.504631, 1, 1, 1, 1, 1,
1.51234, 1.047412, 1.110092, 1, 1, 1, 1, 1,
1.518674, 0.07802886, 2.046191, 1, 1, 1, 1, 1,
1.520254, 0.2559296, 3.348539, 1, 1, 1, 1, 1,
1.525025, 1.342617, 1.597054, 1, 1, 1, 1, 1,
1.525688, 0.8902054, -0.941956, 0, 0, 1, 1, 1,
1.528382, 0.439599, 0.6866797, 1, 0, 0, 1, 1,
1.530445, 0.140598, 0.8050939, 1, 0, 0, 1, 1,
1.538287, -0.6259215, 0.8954932, 1, 0, 0, 1, 1,
1.554694, 0.0681399, 1.532841, 1, 0, 0, 1, 1,
1.560379, 1.180486, 0.8068999, 1, 0, 0, 1, 1,
1.562227, -0.9773718, 3.041222, 0, 0, 0, 1, 1,
1.563015, 0.9966524, -0.466895, 0, 0, 0, 1, 1,
1.571707, 2.713293, 1.704586, 0, 0, 0, 1, 1,
1.582686, -0.1469535, 1.611245, 0, 0, 0, 1, 1,
1.583289, -0.5371431, 2.551441, 0, 0, 0, 1, 1,
1.584691, -0.8425406, 2.081374, 0, 0, 0, 1, 1,
1.592349, 0.276592, 1.229744, 0, 0, 0, 1, 1,
1.600302, 1.072177, 1.394047, 1, 1, 1, 1, 1,
1.60489, -1.221874, 2.655768, 1, 1, 1, 1, 1,
1.617444, 1.265471, 2.327106, 1, 1, 1, 1, 1,
1.626318, -0.02337496, 0.1257925, 1, 1, 1, 1, 1,
1.627164, -0.5712461, 1.991503, 1, 1, 1, 1, 1,
1.637758, -0.7586221, 1.992003, 1, 1, 1, 1, 1,
1.641654, 0.1826702, 1.609028, 1, 1, 1, 1, 1,
1.663249, 0.7008101, 2.136246, 1, 1, 1, 1, 1,
1.678226, -1.770836, 2.305989, 1, 1, 1, 1, 1,
1.681378, -0.5137735, 0.618196, 1, 1, 1, 1, 1,
1.68292, 0.6631449, 2.054105, 1, 1, 1, 1, 1,
1.710853, 0.9988551, 0.2392428, 1, 1, 1, 1, 1,
1.720473, 0.823934, 0.8052271, 1, 1, 1, 1, 1,
1.722244, -0.1297518, 0.2188398, 1, 1, 1, 1, 1,
1.731831, 1.165789, -0.3410975, 1, 1, 1, 1, 1,
1.74582, -1.264637, 1.657989, 0, 0, 1, 1, 1,
1.753985, 0.1513197, -1.075269, 1, 0, 0, 1, 1,
1.756462, 1.344603, 1.636198, 1, 0, 0, 1, 1,
1.759894, -0.3769024, 1.048582, 1, 0, 0, 1, 1,
1.764003, -0.01839365, 1.318997, 1, 0, 0, 1, 1,
1.767626, 0.2393855, 1.355076, 1, 0, 0, 1, 1,
1.780386, -0.3760378, 2.619201, 0, 0, 0, 1, 1,
1.789238, -1.920605, 4.350181, 0, 0, 0, 1, 1,
1.812114, -1.296796, 1.654127, 0, 0, 0, 1, 1,
1.822198, -1.205605, 1.648942, 0, 0, 0, 1, 1,
1.834964, -0.903045, 1.267116, 0, 0, 0, 1, 1,
1.836857, 0.5691138, 1.841692, 0, 0, 0, 1, 1,
1.841002, 0.7481756, 2.370796, 0, 0, 0, 1, 1,
1.845721, 0.8898273, 2.468063, 1, 1, 1, 1, 1,
1.850358, 0.5670011, 2.095616, 1, 1, 1, 1, 1,
1.85718, -0.02041374, 1.982477, 1, 1, 1, 1, 1,
1.88204, 1.908003, -0.3409691, 1, 1, 1, 1, 1,
1.890368, 0.7998701, 0.6289863, 1, 1, 1, 1, 1,
1.93895, -0.2115387, -0.727726, 1, 1, 1, 1, 1,
1.949925, -0.6311215, 0.9018367, 1, 1, 1, 1, 1,
1.957863, 0.9878366, 1.215841, 1, 1, 1, 1, 1,
1.978421, 0.3530456, 0.9885338, 1, 1, 1, 1, 1,
1.989292, -0.232564, 3.151006, 1, 1, 1, 1, 1,
2.000038, 0.1382599, 1.202957, 1, 1, 1, 1, 1,
2.014855, -0.8303548, 3.065952, 1, 1, 1, 1, 1,
2.064388, 1.777446, 2.097236, 1, 1, 1, 1, 1,
2.080438, -0.2536801, 0.6680962, 1, 1, 1, 1, 1,
2.087942, -0.02889251, 1.253193, 1, 1, 1, 1, 1,
2.111178, 0.473042, 0.2325, 0, 0, 1, 1, 1,
2.117053, -0.4277548, 3.205346, 1, 0, 0, 1, 1,
2.119242, -1.864545, 3.768922, 1, 0, 0, 1, 1,
2.145116, -1.129168, 1.009965, 1, 0, 0, 1, 1,
2.150167, -0.7974596, 3.189594, 1, 0, 0, 1, 1,
2.161742, -1.952948, 3.775058, 1, 0, 0, 1, 1,
2.182194, 0.1428853, 2.232177, 0, 0, 0, 1, 1,
2.188367, -0.887266, 2.406089, 0, 0, 0, 1, 1,
2.20469, 1.218149, 1.022454, 0, 0, 0, 1, 1,
2.220011, -0.02887094, 1.723784, 0, 0, 0, 1, 1,
2.239756, 0.317056, 0.2891054, 0, 0, 0, 1, 1,
2.241998, 0.1654939, 1.620152, 0, 0, 0, 1, 1,
2.256299, -1.233957, 2.481206, 0, 0, 0, 1, 1,
2.342153, 1.417299, 2.043207, 1, 1, 1, 1, 1,
2.362562, -1.389115, 2.422351, 1, 1, 1, 1, 1,
2.432066, -1.038664, 2.144653, 1, 1, 1, 1, 1,
2.564632, -0.09299545, 2.257636, 1, 1, 1, 1, 1,
2.611999, 0.09600301, 1.078065, 1, 1, 1, 1, 1,
2.638368, -0.6022419, 0.09816471, 1, 1, 1, 1, 1,
3.058391, -0.5043806, 0.3935486, 1, 1, 1, 1, 1
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
var radius = 9.607888;
var distance = 33.7473;
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
mvMatrix.translate( -0.07227385, 0.2921011, 0.5371616 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7473);
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
