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
-2.916218, 0.1046759, -0.8332222, 1, 0, 0, 1,
-2.662789, 0.5050222, -2.078237, 1, 0.007843138, 0, 1,
-2.606858, 0.0533651, -1.834001, 1, 0.01176471, 0, 1,
-2.601997, 1.083952, -0.8147481, 1, 0.01960784, 0, 1,
-2.570564, -1.115784, -1.974756, 1, 0.02352941, 0, 1,
-2.412952, 0.6104553, -1.969769, 1, 0.03137255, 0, 1,
-2.366679, -0.6891744, -1.403858, 1, 0.03529412, 0, 1,
-2.352364, 0.7848095, -0.7197241, 1, 0.04313726, 0, 1,
-2.300317, -1.334243, -0.8260064, 1, 0.04705882, 0, 1,
-2.289728, 0.2283965, -2.755033, 1, 0.05490196, 0, 1,
-2.282357, 1.945518, 1.348828, 1, 0.05882353, 0, 1,
-2.268543, 0.4425166, -2.105881, 1, 0.06666667, 0, 1,
-2.183952, 0.6391917, -0.9636886, 1, 0.07058824, 0, 1,
-2.176114, 0.3277334, -2.231337, 1, 0.07843138, 0, 1,
-2.158547, -0.7031827, -1.31748, 1, 0.08235294, 0, 1,
-2.146861, -1.373983, -0.8849034, 1, 0.09019608, 0, 1,
-2.140668, -0.2242372, -2.91292, 1, 0.09411765, 0, 1,
-2.116813, 0.2147249, -0.7716137, 1, 0.1019608, 0, 1,
-2.098639, -0.9175043, -2.032687, 1, 0.1098039, 0, 1,
-2.030455, 0.6487324, -3.215658, 1, 0.1137255, 0, 1,
-1.993581, -0.6627027, -1.389497, 1, 0.1215686, 0, 1,
-1.98728, -0.2175785, -1.686212, 1, 0.1254902, 0, 1,
-1.948726, 1.173016, -1.66804, 1, 0.1333333, 0, 1,
-1.873982, -1.142985, -2.959933, 1, 0.1372549, 0, 1,
-1.870719, -2.208922, -2.144511, 1, 0.145098, 0, 1,
-1.860653, 1.055675, -0.9084576, 1, 0.1490196, 0, 1,
-1.832046, -1.598547, -1.740743, 1, 0.1568628, 0, 1,
-1.831901, 0.1157938, -1.490838, 1, 0.1607843, 0, 1,
-1.812261, -0.2204231, 0.238289, 1, 0.1686275, 0, 1,
-1.808449, 0.2623029, -2.64443, 1, 0.172549, 0, 1,
-1.802947, -1.857984, -1.68815, 1, 0.1803922, 0, 1,
-1.769969, -1.963917, -1.645531, 1, 0.1843137, 0, 1,
-1.751372, -1.147152, -2.196548, 1, 0.1921569, 0, 1,
-1.749903, 0.09976501, -2.131902, 1, 0.1960784, 0, 1,
-1.742664, -2.095234, -2.368356, 1, 0.2039216, 0, 1,
-1.73429, -0.5909669, -4.134358, 1, 0.2117647, 0, 1,
-1.7132, 2.174485, -0.8670457, 1, 0.2156863, 0, 1,
-1.683062, -0.09799621, -1.790118, 1, 0.2235294, 0, 1,
-1.680033, -0.2921978, -0.8131489, 1, 0.227451, 0, 1,
-1.671383, 1.824269, -0.3511184, 1, 0.2352941, 0, 1,
-1.663162, 0.3425235, -1.209209, 1, 0.2392157, 0, 1,
-1.655753, 0.6053488, -0.9876685, 1, 0.2470588, 0, 1,
-1.652185, -0.2238763, -1.978594, 1, 0.2509804, 0, 1,
-1.626553, 0.1577589, -0.7829834, 1, 0.2588235, 0, 1,
-1.59864, 1.077365, 0.8455275, 1, 0.2627451, 0, 1,
-1.59529, 1.120029, -0.7352345, 1, 0.2705882, 0, 1,
-1.590575, -0.374563, -0.2166678, 1, 0.2745098, 0, 1,
-1.558075, -1.54349, -1.551186, 1, 0.282353, 0, 1,
-1.555512, 0.6252761, 0.2553295, 1, 0.2862745, 0, 1,
-1.55488, -2.201355, -2.678631, 1, 0.2941177, 0, 1,
-1.547642, 0.1326229, -0.4473022, 1, 0.3019608, 0, 1,
-1.533626, 0.7877214, -1.909653, 1, 0.3058824, 0, 1,
-1.533123, -0.05866083, -1.186375, 1, 0.3137255, 0, 1,
-1.525379, -0.1907632, -1.98722, 1, 0.3176471, 0, 1,
-1.513087, 0.3849772, -0.8115404, 1, 0.3254902, 0, 1,
-1.4924, 1.471065, -0.7679171, 1, 0.3294118, 0, 1,
-1.487442, -0.9611088, -1.043545, 1, 0.3372549, 0, 1,
-1.481392, 1.080793, -1.145947, 1, 0.3411765, 0, 1,
-1.473086, 1.135609, -2.039021, 1, 0.3490196, 0, 1,
-1.468787, 0.3815586, -0.7759254, 1, 0.3529412, 0, 1,
-1.464197, -0.6098339, -1.84702, 1, 0.3607843, 0, 1,
-1.463622, -0.9051027, -3.84529, 1, 0.3647059, 0, 1,
-1.456852, 0.5367082, 0.1750233, 1, 0.372549, 0, 1,
-1.449628, 0.6475445, -0.5776445, 1, 0.3764706, 0, 1,
-1.447823, -1.324549, -1.133984, 1, 0.3843137, 0, 1,
-1.444863, 2.446675, 0.4863177, 1, 0.3882353, 0, 1,
-1.442376, -0.4962477, -2.253205, 1, 0.3960784, 0, 1,
-1.438662, 1.292104, -1.693117, 1, 0.4039216, 0, 1,
-1.43564, -0.8419837, -1.324243, 1, 0.4078431, 0, 1,
-1.431171, -0.2742831, -1.612465, 1, 0.4156863, 0, 1,
-1.430585, 1.832758, 1.681694, 1, 0.4196078, 0, 1,
-1.409163, -1.079446, -3.90823, 1, 0.427451, 0, 1,
-1.408974, -1.044324, -1.947106, 1, 0.4313726, 0, 1,
-1.401519, -1.844082, -3.467435, 1, 0.4392157, 0, 1,
-1.398225, 0.7338104, 0.2806941, 1, 0.4431373, 0, 1,
-1.388141, 0.1879468, -1.243818, 1, 0.4509804, 0, 1,
-1.387743, -1.430575, -1.587478, 1, 0.454902, 0, 1,
-1.377672, -1.479888, -4.000504, 1, 0.4627451, 0, 1,
-1.36615, -0.2759527, -1.789723, 1, 0.4666667, 0, 1,
-1.365204, -1.496987, -2.017127, 1, 0.4745098, 0, 1,
-1.36442, -1.60389, -1.746328, 1, 0.4784314, 0, 1,
-1.361586, 0.9757124, -0.1369388, 1, 0.4862745, 0, 1,
-1.361007, 2.442386, -0.6205124, 1, 0.4901961, 0, 1,
-1.350598, -2.036799, -2.432569, 1, 0.4980392, 0, 1,
-1.336732, -0.7537074, -2.253626, 1, 0.5058824, 0, 1,
-1.302955, -0.2385409, -0.2112105, 1, 0.509804, 0, 1,
-1.300401, 0.5453347, -2.315414, 1, 0.5176471, 0, 1,
-1.299309, 0.1757728, -1.151632, 1, 0.5215687, 0, 1,
-1.297929, 0.7052298, -0.9160323, 1, 0.5294118, 0, 1,
-1.294946, -0.169684, -1.975426, 1, 0.5333334, 0, 1,
-1.293856, -0.5824834, -2.886814, 1, 0.5411765, 0, 1,
-1.291802, -0.4488555, 0.9162051, 1, 0.5450981, 0, 1,
-1.28994, 0.8170015, -1.70531, 1, 0.5529412, 0, 1,
-1.287219, -0.5586149, -2.714903, 1, 0.5568628, 0, 1,
-1.285393, -0.4344846, -1.645236, 1, 0.5647059, 0, 1,
-1.281112, 1.286699, -2.762278, 1, 0.5686275, 0, 1,
-1.274048, 0.5198385, -0.3695574, 1, 0.5764706, 0, 1,
-1.269529, -2.774199, -1.861311, 1, 0.5803922, 0, 1,
-1.257074, -0.3639202, -1.695048, 1, 0.5882353, 0, 1,
-1.253862, -0.2553057, -2.354751, 1, 0.5921569, 0, 1,
-1.25112, 0.433367, -1.398536, 1, 0.6, 0, 1,
-1.249509, -1.384084, -3.178146, 1, 0.6078432, 0, 1,
-1.247277, -0.2464297, -0.9231231, 1, 0.6117647, 0, 1,
-1.234905, 0.4088058, -1.864228, 1, 0.6196079, 0, 1,
-1.226981, -0.9655137, -3.111301, 1, 0.6235294, 0, 1,
-1.224651, 0.81445, 1.034702, 1, 0.6313726, 0, 1,
-1.22414, -0.004587336, -1.409103, 1, 0.6352941, 0, 1,
-1.221522, -0.08994818, -2.596022, 1, 0.6431373, 0, 1,
-1.20861, -0.5635354, -1.221531, 1, 0.6470588, 0, 1,
-1.206696, -0.4892056, -3.148036, 1, 0.654902, 0, 1,
-1.206477, 0.01333131, -1.946998, 1, 0.6588235, 0, 1,
-1.196144, -2.508284, -3.883587, 1, 0.6666667, 0, 1,
-1.189069, 0.8203644, -2.988563, 1, 0.6705883, 0, 1,
-1.187189, -1.271515, -1.633806, 1, 0.6784314, 0, 1,
-1.186225, -0.3805816, -2.892473, 1, 0.682353, 0, 1,
-1.184811, 0.01452578, -2.247568, 1, 0.6901961, 0, 1,
-1.184676, 0.3895835, -2.291392, 1, 0.6941177, 0, 1,
-1.178703, 1.075278, -1.038549, 1, 0.7019608, 0, 1,
-1.174063, -1.282218, -2.38371, 1, 0.7098039, 0, 1,
-1.173528, 0.5518058, -0.7973156, 1, 0.7137255, 0, 1,
-1.168857, 3.764776, 0.6183575, 1, 0.7215686, 0, 1,
-1.167587, 1.740011, -0.7030638, 1, 0.7254902, 0, 1,
-1.160031, 0.6948629, -1.40477, 1, 0.7333333, 0, 1,
-1.152485, -0.3804956, -2.036027, 1, 0.7372549, 0, 1,
-1.135676, 0.7474615, -1.476185, 1, 0.7450981, 0, 1,
-1.132271, -0.2720091, -1.287015, 1, 0.7490196, 0, 1,
-1.129738, 1.767602, -0.41479, 1, 0.7568628, 0, 1,
-1.12913, -1.192138, -2.636603, 1, 0.7607843, 0, 1,
-1.126729, 1.343115, -3.185794, 1, 0.7686275, 0, 1,
-1.114878, -0.7105872, -1.223016, 1, 0.772549, 0, 1,
-1.114758, -0.2697281, -2.110604, 1, 0.7803922, 0, 1,
-1.110825, -0.1124716, -3.714249, 1, 0.7843137, 0, 1,
-1.110263, -1.897684, -2.600057, 1, 0.7921569, 0, 1,
-1.11003, -0.06511138, -1.805185, 1, 0.7960784, 0, 1,
-1.104577, -0.9850379, -3.374973, 1, 0.8039216, 0, 1,
-1.101226, 0.2967494, -1.491969, 1, 0.8117647, 0, 1,
-1.097762, 0.9802226, -1.603714, 1, 0.8156863, 0, 1,
-1.09682, -0.08579449, -2.56208, 1, 0.8235294, 0, 1,
-1.09512, -0.5189405, 0.1465818, 1, 0.827451, 0, 1,
-1.092901, 3.075043, -1.046305, 1, 0.8352941, 0, 1,
-1.092878, 1.154532, -2.340262, 1, 0.8392157, 0, 1,
-1.09099, -1.175434, -0.6827469, 1, 0.8470588, 0, 1,
-1.088085, 0.5189512, -1.569158, 1, 0.8509804, 0, 1,
-1.080651, 0.942422, -0.05783859, 1, 0.8588235, 0, 1,
-1.076903, 0.2530654, -1.466132, 1, 0.8627451, 0, 1,
-1.076507, -0.5957976, -1.407611, 1, 0.8705882, 0, 1,
-1.071758, 1.555464, -1.594488, 1, 0.8745098, 0, 1,
-1.069054, 1.440768, -3.127056, 1, 0.8823529, 0, 1,
-1.066491, 0.1877148, -1.318294, 1, 0.8862745, 0, 1,
-1.046958, 2.692853, 0.4743189, 1, 0.8941177, 0, 1,
-1.045639, 0.9792531, -1.15974, 1, 0.8980392, 0, 1,
-1.034072, 0.7485511, -0.4859745, 1, 0.9058824, 0, 1,
-1.033613, 0.02238415, -1.801116, 1, 0.9137255, 0, 1,
-1.031254, 0.4178971, 0.8526098, 1, 0.9176471, 0, 1,
-1.029575, -1.995574, -3.350713, 1, 0.9254902, 0, 1,
-1.029063, -0.4185812, -2.052401, 1, 0.9294118, 0, 1,
-1.028412, -0.691045, -0.9971249, 1, 0.9372549, 0, 1,
-1.027773, 0.8233709, -2.510418, 1, 0.9411765, 0, 1,
-1.027327, 2.188758, -0.9668071, 1, 0.9490196, 0, 1,
-1.027141, 1.093934, -1.109439, 1, 0.9529412, 0, 1,
-1.024405, -1.0323, -2.033157, 1, 0.9607843, 0, 1,
-1.015769, -0.1353171, -2.947639, 1, 0.9647059, 0, 1,
-1.006998, -0.6881732, -1.802817, 1, 0.972549, 0, 1,
-0.9993317, -0.9034072, -2.617108, 1, 0.9764706, 0, 1,
-0.9983777, -0.3099491, -2.617095, 1, 0.9843137, 0, 1,
-0.9913567, -0.2964336, -3.469317, 1, 0.9882353, 0, 1,
-0.9906386, 1.007063, 0.1489642, 1, 0.9960784, 0, 1,
-0.9742584, -1.140449, -3.540034, 0.9960784, 1, 0, 1,
-0.9710196, 1.526231, -1.68573, 0.9921569, 1, 0, 1,
-0.9677056, -0.7939684, -1.991437, 0.9843137, 1, 0, 1,
-0.9669288, 2.277667, -1.188728, 0.9803922, 1, 0, 1,
-0.9629668, 0.8655142, -0.1500284, 0.972549, 1, 0, 1,
-0.9580945, 0.8543664, -1.030305, 0.9686275, 1, 0, 1,
-0.9554595, 0.6929442, -1.263721, 0.9607843, 1, 0, 1,
-0.9502351, 1.87936, -0.1344199, 0.9568627, 1, 0, 1,
-0.9474666, -1.203001, -3.066171, 0.9490196, 1, 0, 1,
-0.9414509, -0.9313341, -2.800278, 0.945098, 1, 0, 1,
-0.9412189, 0.5007046, -0.7187864, 0.9372549, 1, 0, 1,
-0.9406151, 0.9866924, -0.4456044, 0.9333333, 1, 0, 1,
-0.9311934, 1.109372, -1.168413, 0.9254902, 1, 0, 1,
-0.9291335, 1.148332, -0.9645483, 0.9215686, 1, 0, 1,
-0.9240065, -0.9433394, -1.331212, 0.9137255, 1, 0, 1,
-0.9220147, 1.230365, -1.842389, 0.9098039, 1, 0, 1,
-0.9120913, -0.5297117, -0.5852038, 0.9019608, 1, 0, 1,
-0.9116552, -0.07548197, -3.260763, 0.8941177, 1, 0, 1,
-0.9077461, -0.1440229, -2.627571, 0.8901961, 1, 0, 1,
-0.8994383, 0.05538986, -4.005037, 0.8823529, 1, 0, 1,
-0.8937046, -3.854648, -4.687187, 0.8784314, 1, 0, 1,
-0.8923026, 0.3290139, -0.6228335, 0.8705882, 1, 0, 1,
-0.887264, 1.517888, -0.8871582, 0.8666667, 1, 0, 1,
-0.8695043, -0.4336278, -3.199536, 0.8588235, 1, 0, 1,
-0.8677382, 0.1027061, -0.3834245, 0.854902, 1, 0, 1,
-0.860267, -0.1416999, -2.165041, 0.8470588, 1, 0, 1,
-0.8586208, 0.8909, -0.7920404, 0.8431373, 1, 0, 1,
-0.8573185, -1.346639, -4.825319, 0.8352941, 1, 0, 1,
-0.8560495, 2.277345, 0.6612929, 0.8313726, 1, 0, 1,
-0.8305004, 0.04421006, 0.1909885, 0.8235294, 1, 0, 1,
-0.8294262, -0.9653984, -2.315353, 0.8196079, 1, 0, 1,
-0.8193056, 1.540327, -0.1320429, 0.8117647, 1, 0, 1,
-0.8162714, 0.1806081, -0.8147674, 0.8078431, 1, 0, 1,
-0.8146455, 0.491871, -1.707251, 0.8, 1, 0, 1,
-0.8141955, -0.009598016, -0.5364586, 0.7921569, 1, 0, 1,
-0.8111655, -0.4296348, -3.041804, 0.7882353, 1, 0, 1,
-0.8076733, -0.2095704, -0.5927076, 0.7803922, 1, 0, 1,
-0.804471, -0.4574834, -2.105578, 0.7764706, 1, 0, 1,
-0.8024174, -1.63175, -1.822792, 0.7686275, 1, 0, 1,
-0.8013979, -0.1975262, -1.805238, 0.7647059, 1, 0, 1,
-0.7986383, -0.6174828, -2.095862, 0.7568628, 1, 0, 1,
-0.7981335, -0.7511907, -4.021599, 0.7529412, 1, 0, 1,
-0.797973, 0.0480984, -1.950811, 0.7450981, 1, 0, 1,
-0.7909089, 0.4938207, -1.362838, 0.7411765, 1, 0, 1,
-0.786052, -1.140586, -2.852792, 0.7333333, 1, 0, 1,
-0.7729048, -0.9362086, -2.722629, 0.7294118, 1, 0, 1,
-0.7711134, -1.066877, -1.450558, 0.7215686, 1, 0, 1,
-0.7691811, 1.248485, 0.4688915, 0.7176471, 1, 0, 1,
-0.7602016, -0.4079391, -2.372393, 0.7098039, 1, 0, 1,
-0.7529958, 1.597554, 0.2825854, 0.7058824, 1, 0, 1,
-0.7496315, -0.6675305, -2.34515, 0.6980392, 1, 0, 1,
-0.7496099, 0.5310112, -1.003843, 0.6901961, 1, 0, 1,
-0.7468105, -0.4962928, -3.335126, 0.6862745, 1, 0, 1,
-0.7455449, -1.359088, -3.75872, 0.6784314, 1, 0, 1,
-0.7441695, 0.3323678, 0.1173433, 0.6745098, 1, 0, 1,
-0.7424067, -1.118011, -2.446704, 0.6666667, 1, 0, 1,
-0.7418137, 0.9198122, -1.219077, 0.6627451, 1, 0, 1,
-0.7407736, -0.2672975, -2.307339, 0.654902, 1, 0, 1,
-0.7355654, 1.564249, 0.2096903, 0.6509804, 1, 0, 1,
-0.7308605, -0.9670405, -3.476629, 0.6431373, 1, 0, 1,
-0.7292089, -0.9322219, -4.139979, 0.6392157, 1, 0, 1,
-0.7284119, 0.04681231, -2.162961, 0.6313726, 1, 0, 1,
-0.7235015, -0.7363552, -2.930524, 0.627451, 1, 0, 1,
-0.722369, -0.06159775, -3.613474, 0.6196079, 1, 0, 1,
-0.7211633, 0.9246081, -1.285605, 0.6156863, 1, 0, 1,
-0.7209158, 1.54739, 0.08808037, 0.6078432, 1, 0, 1,
-0.7204747, -1.510306, -3.704138, 0.6039216, 1, 0, 1,
-0.7157153, -0.01082601, -2.298727, 0.5960785, 1, 0, 1,
-0.7136657, 1.012015, 0.4793628, 0.5882353, 1, 0, 1,
-0.7063111, -2.466921, -3.455465, 0.5843138, 1, 0, 1,
-0.7019953, 0.2891146, -1.700028, 0.5764706, 1, 0, 1,
-0.7016475, 0.7538903, -0.7835301, 0.572549, 1, 0, 1,
-0.7013668, -0.9460598, -2.44067, 0.5647059, 1, 0, 1,
-0.698124, 0.3515855, -1.069239, 0.5607843, 1, 0, 1,
-0.6981044, 0.2205049, -1.438006, 0.5529412, 1, 0, 1,
-0.6772377, -0.5013979, -1.789354, 0.5490196, 1, 0, 1,
-0.6759138, -1.030494, -1.606533, 0.5411765, 1, 0, 1,
-0.6578487, -0.6214718, -1.967891, 0.5372549, 1, 0, 1,
-0.6559531, 0.04273771, -3.184169, 0.5294118, 1, 0, 1,
-0.6555305, -1.544904, -3.450474, 0.5254902, 1, 0, 1,
-0.6502285, -2.183771, -3.693796, 0.5176471, 1, 0, 1,
-0.6492026, -0.8062, -3.986006, 0.5137255, 1, 0, 1,
-0.6427327, -0.2979116, -1.50771, 0.5058824, 1, 0, 1,
-0.6426355, -0.2595344, -1.937229, 0.5019608, 1, 0, 1,
-0.6396076, -0.2530392, -1.972838, 0.4941176, 1, 0, 1,
-0.6373434, 0.6521745, -0.9789017, 0.4862745, 1, 0, 1,
-0.6338693, 0.06815938, -2.815269, 0.4823529, 1, 0, 1,
-0.6330702, 0.05967296, -0.1265065, 0.4745098, 1, 0, 1,
-0.6315463, 2.559767, -0.3906248, 0.4705882, 1, 0, 1,
-0.6283697, 1.226527, 1.643481, 0.4627451, 1, 0, 1,
-0.6283334, 0.8021455, -1.469776, 0.4588235, 1, 0, 1,
-0.6237073, 0.1949894, -1.117155, 0.4509804, 1, 0, 1,
-0.6134538, -0.003302389, -0.8192209, 0.4470588, 1, 0, 1,
-0.6133847, 0.5275667, -2.728702, 0.4392157, 1, 0, 1,
-0.6078724, 2.031683, -1.443898, 0.4352941, 1, 0, 1,
-0.6031256, 0.01586874, -1.83138, 0.427451, 1, 0, 1,
-0.6020424, -0.4837979, -2.668916, 0.4235294, 1, 0, 1,
-0.5995114, -0.3543253, -0.3702203, 0.4156863, 1, 0, 1,
-0.5994047, 2.068885, -2.304488, 0.4117647, 1, 0, 1,
-0.5978974, 0.6965936, -1.53898, 0.4039216, 1, 0, 1,
-0.5923577, 1.141139, 1.325543, 0.3960784, 1, 0, 1,
-0.589635, -1.005143, -0.9793268, 0.3921569, 1, 0, 1,
-0.5841368, 0.7879592, -1.217168, 0.3843137, 1, 0, 1,
-0.5809728, 1.141084, -2.36288, 0.3803922, 1, 0, 1,
-0.5781751, -1.534042, -3.337534, 0.372549, 1, 0, 1,
-0.5776525, 0.7240204, -1.825879, 0.3686275, 1, 0, 1,
-0.5713784, 0.9931823, -0.9677262, 0.3607843, 1, 0, 1,
-0.5704794, -0.398205, -0.741003, 0.3568628, 1, 0, 1,
-0.5652508, 0.8828326, -1.200101, 0.3490196, 1, 0, 1,
-0.565193, -2.349236, -3.092326, 0.345098, 1, 0, 1,
-0.5623153, 2.090952, -0.05901841, 0.3372549, 1, 0, 1,
-0.5611656, -0.1864163, -1.542745, 0.3333333, 1, 0, 1,
-0.5607163, 0.8419916, 0.2619127, 0.3254902, 1, 0, 1,
-0.5601497, -0.6972641, -2.098224, 0.3215686, 1, 0, 1,
-0.5597086, -0.2829264, -2.061962, 0.3137255, 1, 0, 1,
-0.5594312, 3.343876, -1.22148, 0.3098039, 1, 0, 1,
-0.5549086, -1.004538, -3.419972, 0.3019608, 1, 0, 1,
-0.5532859, -0.4832679, -1.277002, 0.2941177, 1, 0, 1,
-0.5507158, -1.551623, -3.268591, 0.2901961, 1, 0, 1,
-0.5503442, 0.09232362, -0.9114254, 0.282353, 1, 0, 1,
-0.5465017, -0.3651486, -2.701493, 0.2784314, 1, 0, 1,
-0.5453578, -2.398046, -3.159164, 0.2705882, 1, 0, 1,
-0.5402219, 0.4432943, -0.4738874, 0.2666667, 1, 0, 1,
-0.5388522, 1.277577, 1.206587, 0.2588235, 1, 0, 1,
-0.538605, 1.408838, -0.4286524, 0.254902, 1, 0, 1,
-0.5377243, 0.04500777, -0.4462211, 0.2470588, 1, 0, 1,
-0.5351643, -0.6539306, -0.5723666, 0.2431373, 1, 0, 1,
-0.5322063, 1.722662, -0.3751424, 0.2352941, 1, 0, 1,
-0.5321489, -2.337794, -3.392496, 0.2313726, 1, 0, 1,
-0.5227695, 0.9527444, -2.058494, 0.2235294, 1, 0, 1,
-0.5178449, -0.7167615, -3.95338, 0.2196078, 1, 0, 1,
-0.5161069, 1.885805, 1.609643, 0.2117647, 1, 0, 1,
-0.5159922, -0.6352559, -3.374093, 0.2078431, 1, 0, 1,
-0.5151311, 0.7728431, -1.29782, 0.2, 1, 0, 1,
-0.505187, -1.068555, -2.162851, 0.1921569, 1, 0, 1,
-0.5014312, -0.08247031, -3.209878, 0.1882353, 1, 0, 1,
-0.4984204, 0.6570068, 0.6308407, 0.1803922, 1, 0, 1,
-0.4982482, 0.197688, 1.01394, 0.1764706, 1, 0, 1,
-0.4955893, 0.8265475, 0.01867444, 0.1686275, 1, 0, 1,
-0.495581, 0.2960059, -1.011535, 0.1647059, 1, 0, 1,
-0.4916889, 0.7731779, 2.138763, 0.1568628, 1, 0, 1,
-0.4873674, -1.149407, -4.352249, 0.1529412, 1, 0, 1,
-0.4818442, -0.2733854, -0.3823318, 0.145098, 1, 0, 1,
-0.4798623, -0.3955297, -3.072453, 0.1411765, 1, 0, 1,
-0.4794772, 0.2257531, -0.7042442, 0.1333333, 1, 0, 1,
-0.4778373, 0.169075, -1.753544, 0.1294118, 1, 0, 1,
-0.4763722, 1.959191, -1.191973, 0.1215686, 1, 0, 1,
-0.4653519, -1.979572, -3.50553, 0.1176471, 1, 0, 1,
-0.4650506, -1.135825, -2.861242, 0.1098039, 1, 0, 1,
-0.4642476, 0.8629422, -2.133158, 0.1058824, 1, 0, 1,
-0.4639207, 0.919668, -0.5895276, 0.09803922, 1, 0, 1,
-0.4620501, 0.0006810891, -2.16609, 0.09019608, 1, 0, 1,
-0.4545875, 0.1314239, -1.762071, 0.08627451, 1, 0, 1,
-0.4542542, -1.265395, -2.752453, 0.07843138, 1, 0, 1,
-0.4535733, 0.06175701, -2.072191, 0.07450981, 1, 0, 1,
-0.4480565, 0.967301, -1.433634, 0.06666667, 1, 0, 1,
-0.4464595, 1.950575, -1.056672, 0.0627451, 1, 0, 1,
-0.445998, 0.4639279, 0.3603694, 0.05490196, 1, 0, 1,
-0.4457875, -2.472205, -1.005051, 0.05098039, 1, 0, 1,
-0.4444472, -0.8127399, -3.827167, 0.04313726, 1, 0, 1,
-0.4438227, -0.2272378, -1.060451, 0.03921569, 1, 0, 1,
-0.4393384, 0.270874, -0.4549092, 0.03137255, 1, 0, 1,
-0.4389443, -0.3763325, -0.7014642, 0.02745098, 1, 0, 1,
-0.4388666, 1.07726, -1.205415, 0.01960784, 1, 0, 1,
-0.4318374, 0.6539457, -1.061155, 0.01568628, 1, 0, 1,
-0.4301668, 2.267554, 0.8725243, 0.007843138, 1, 0, 1,
-0.4214967, -0.8606991, -3.518978, 0.003921569, 1, 0, 1,
-0.4180934, -0.4069887, -1.932514, 0, 1, 0.003921569, 1,
-0.4177811, 2.507627, 0.9410997, 0, 1, 0.01176471, 1,
-0.4147191, 0.00938572, -1.742716, 0, 1, 0.01568628, 1,
-0.408368, 1.338084, 0.6220782, 0, 1, 0.02352941, 1,
-0.4080036, 1.118602, 0.2056318, 0, 1, 0.02745098, 1,
-0.3990001, 1.311181, -1.536753, 0, 1, 0.03529412, 1,
-0.3968119, 0.3047383, 1.87619, 0, 1, 0.03921569, 1,
-0.3958203, 0.9954453, -1.104985, 0, 1, 0.04705882, 1,
-0.3912207, -0.6364775, -3.751314, 0, 1, 0.05098039, 1,
-0.3887839, 0.003857197, 1.529307, 0, 1, 0.05882353, 1,
-0.3840749, 1.496705, 0.6598319, 0, 1, 0.0627451, 1,
-0.3795251, 0.08006452, -0.7091267, 0, 1, 0.07058824, 1,
-0.3792126, -0.05751873, -1.298034, 0, 1, 0.07450981, 1,
-0.3734363, 1.111499, 0.8339304, 0, 1, 0.08235294, 1,
-0.3692304, -0.3449671, -1.163069, 0, 1, 0.08627451, 1,
-0.3689249, 0.002720376, -2.088411, 0, 1, 0.09411765, 1,
-0.3653799, 0.4857033, -0.2307713, 0, 1, 0.1019608, 1,
-0.3564884, -0.8205875, -0.9936248, 0, 1, 0.1058824, 1,
-0.3564439, -0.7333177, -2.482216, 0, 1, 0.1137255, 1,
-0.3534252, -0.01513025, -2.075397, 0, 1, 0.1176471, 1,
-0.3471882, 0.2598198, 0.8623771, 0, 1, 0.1254902, 1,
-0.3428366, 0.5948054, 0.4579987, 0, 1, 0.1294118, 1,
-0.3419361, -0.254251, -1.524661, 0, 1, 0.1372549, 1,
-0.3398639, -0.08079421, -0.5424299, 0, 1, 0.1411765, 1,
-0.3376827, 3.026645, 0.7490136, 0, 1, 0.1490196, 1,
-0.3370047, 0.3549333, -1.72357, 0, 1, 0.1529412, 1,
-0.332735, -0.4335106, -1.813601, 0, 1, 0.1607843, 1,
-0.3313352, -1.150449, -4.458686, 0, 1, 0.1647059, 1,
-0.3312846, -0.6138051, -2.66472, 0, 1, 0.172549, 1,
-0.3211386, -0.06151627, -1.69831, 0, 1, 0.1764706, 1,
-0.3123025, -0.3481283, -2.275729, 0, 1, 0.1843137, 1,
-0.308318, -0.5043992, -2.978523, 0, 1, 0.1882353, 1,
-0.3082056, -0.4305371, -1.277367, 0, 1, 0.1960784, 1,
-0.3079996, -0.8542736, -2.247617, 0, 1, 0.2039216, 1,
-0.3073244, -1.103521, -3.082804, 0, 1, 0.2078431, 1,
-0.3066711, -1.208123, -2.872703, 0, 1, 0.2156863, 1,
-0.3062068, -1.341728, -2.285118, 0, 1, 0.2196078, 1,
-0.3053541, -0.7104863, -4.096462, 0, 1, 0.227451, 1,
-0.3053088, 0.3662696, -1.791989, 0, 1, 0.2313726, 1,
-0.3039648, -1.596651, -2.731792, 0, 1, 0.2392157, 1,
-0.3027514, 0.6957157, -0.317342, 0, 1, 0.2431373, 1,
-0.3010095, 0.156978, -2.27566, 0, 1, 0.2509804, 1,
-0.2993042, 1.381794, -0.4001569, 0, 1, 0.254902, 1,
-0.290704, -0.6484468, -3.453807, 0, 1, 0.2627451, 1,
-0.2862539, 0.03753386, -2.049124, 0, 1, 0.2666667, 1,
-0.2856714, 1.118465, -0.913781, 0, 1, 0.2745098, 1,
-0.2837519, 0.9449174, 0.1916395, 0, 1, 0.2784314, 1,
-0.283535, 1.211963, -1.645406, 0, 1, 0.2862745, 1,
-0.2829855, -0.4425053, -2.519192, 0, 1, 0.2901961, 1,
-0.2801661, -1.305268, 0.102397, 0, 1, 0.2980392, 1,
-0.276221, -0.523348, -2.117903, 0, 1, 0.3058824, 1,
-0.2752855, 0.08640419, -1.946702, 0, 1, 0.3098039, 1,
-0.2725786, -0.7941083, -2.48938, 0, 1, 0.3176471, 1,
-0.2711318, -0.8550866, -2.190005, 0, 1, 0.3215686, 1,
-0.2690687, 0.2962303, -1.362544, 0, 1, 0.3294118, 1,
-0.2662834, 0.3090477, -0.4985511, 0, 1, 0.3333333, 1,
-0.2645122, -0.9856429, -3.116962, 0, 1, 0.3411765, 1,
-0.2635756, 2.219354, -1.811131, 0, 1, 0.345098, 1,
-0.2623559, -0.7262551, -3.968247, 0, 1, 0.3529412, 1,
-0.2612232, -0.008624045, -1.32445, 0, 1, 0.3568628, 1,
-0.2567956, 0.03524015, -3.252638, 0, 1, 0.3647059, 1,
-0.2496645, 0.7020406, -1.944587, 0, 1, 0.3686275, 1,
-0.2380803, -0.4250099, -1.844123, 0, 1, 0.3764706, 1,
-0.2301628, -2.173702, -3.35406, 0, 1, 0.3803922, 1,
-0.2244466, -1.135687, -4.265698, 0, 1, 0.3882353, 1,
-0.2232989, 0.02303808, -1.269718, 0, 1, 0.3921569, 1,
-0.2127939, 0.850531, 1.326637, 0, 1, 0.4, 1,
-0.212414, -0.1150468, -1.572031, 0, 1, 0.4078431, 1,
-0.2104635, -2.935058, -2.984926, 0, 1, 0.4117647, 1,
-0.2091206, -2.082324, -2.83589, 0, 1, 0.4196078, 1,
-0.2088818, 1.322678, 0.2401706, 0, 1, 0.4235294, 1,
-0.2076274, 0.5122284, 0.316778, 0, 1, 0.4313726, 1,
-0.2059975, 2.188479, -1.889738, 0, 1, 0.4352941, 1,
-0.2052045, -0.1365675, -0.1430524, 0, 1, 0.4431373, 1,
-0.2040215, 0.7534877, -0.7150792, 0, 1, 0.4470588, 1,
-0.1988021, 1.27128, -0.6862583, 0, 1, 0.454902, 1,
-0.1960769, 1.913378, 0.7787154, 0, 1, 0.4588235, 1,
-0.194354, -1.549047, -3.152919, 0, 1, 0.4666667, 1,
-0.1913418, -0.5742661, -2.867916, 0, 1, 0.4705882, 1,
-0.1897213, -1.01757, -2.772918, 0, 1, 0.4784314, 1,
-0.1891988, 0.3682161, -1.514133, 0, 1, 0.4823529, 1,
-0.1860017, 1.353407, 0.3599936, 0, 1, 0.4901961, 1,
-0.1859034, -0.4810582, -1.355413, 0, 1, 0.4941176, 1,
-0.1839807, -0.3513361, -2.847156, 0, 1, 0.5019608, 1,
-0.1821422, 0.1077916, -0.309285, 0, 1, 0.509804, 1,
-0.1821278, 0.3600479, 0.03644064, 0, 1, 0.5137255, 1,
-0.1757842, -1.07382, -1.96474, 0, 1, 0.5215687, 1,
-0.1740316, -1.833784, -3.735321, 0, 1, 0.5254902, 1,
-0.1717964, 1.253718, -1.262197, 0, 1, 0.5333334, 1,
-0.1702762, -1.041943, -2.180659, 0, 1, 0.5372549, 1,
-0.1682974, 0.5118474, -0.3877974, 0, 1, 0.5450981, 1,
-0.1681245, -1.996282, -3.442162, 0, 1, 0.5490196, 1,
-0.1668131, 0.4287404, 0.7335798, 0, 1, 0.5568628, 1,
-0.1648466, -0.6685389, -2.685661, 0, 1, 0.5607843, 1,
-0.1628436, -1.241271, -2.577809, 0, 1, 0.5686275, 1,
-0.1622851, -1.017391, -2.558194, 0, 1, 0.572549, 1,
-0.1607159, 1.08183, -0.02823478, 0, 1, 0.5803922, 1,
-0.1603276, -0.9130581, -2.288907, 0, 1, 0.5843138, 1,
-0.1594969, 0.4541249, -0.4202034, 0, 1, 0.5921569, 1,
-0.1569221, 0.5815758, -0.4200838, 0, 1, 0.5960785, 1,
-0.153196, 0.03209116, 0.478582, 0, 1, 0.6039216, 1,
-0.1432427, -0.6622642, -2.061769, 0, 1, 0.6117647, 1,
-0.1432063, 0.8570687, 0.2089075, 0, 1, 0.6156863, 1,
-0.1394129, -0.179044, -1.881982, 0, 1, 0.6235294, 1,
-0.1389334, -1.482411, -3.053864, 0, 1, 0.627451, 1,
-0.1376805, 0.671068, -0.5508835, 0, 1, 0.6352941, 1,
-0.1366392, -1.712292, -4.268474, 0, 1, 0.6392157, 1,
-0.1334992, 0.9573395, 0.07136246, 0, 1, 0.6470588, 1,
-0.1330571, 1.066364, -0.8379009, 0, 1, 0.6509804, 1,
-0.1326897, 0.68804, 0.9174436, 0, 1, 0.6588235, 1,
-0.1315017, -1.545159, -4.738327, 0, 1, 0.6627451, 1,
-0.1294898, -0.1338116, -2.887012, 0, 1, 0.6705883, 1,
-0.1283056, 0.01821151, -1.547002, 0, 1, 0.6745098, 1,
-0.1254495, -1.216271, -1.422253, 0, 1, 0.682353, 1,
-0.1216559, -0.6510831, -2.991787, 0, 1, 0.6862745, 1,
-0.1191079, 0.9217613, 1.299217, 0, 1, 0.6941177, 1,
-0.1129443, 1.019565, 0.6732718, 0, 1, 0.7019608, 1,
-0.1099984, 1.315609, 0.9949713, 0, 1, 0.7058824, 1,
-0.1089423, -1.150512, -1.540482, 0, 1, 0.7137255, 1,
-0.1073985, 0.7652594, -0.3986889, 0, 1, 0.7176471, 1,
-0.1018562, 0.6044948, -0.9200886, 0, 1, 0.7254902, 1,
-0.1014675, -0.9658993, -4.100774, 0, 1, 0.7294118, 1,
-0.1014646, -0.1891451, -1.893939, 0, 1, 0.7372549, 1,
-0.09877583, 0.7627161, -1.343292, 0, 1, 0.7411765, 1,
-0.09491677, -0.7451812, -3.023185, 0, 1, 0.7490196, 1,
-0.08750797, -0.9153603, -3.957568, 0, 1, 0.7529412, 1,
-0.08727769, 1.179775, -0.9126235, 0, 1, 0.7607843, 1,
-0.08670968, -1.303493, -3.604995, 0, 1, 0.7647059, 1,
-0.08269288, 2.701697, -0.6326572, 0, 1, 0.772549, 1,
-0.08243503, 0.7369117, -2.078781, 0, 1, 0.7764706, 1,
-0.08065855, -0.7311158, -2.786514, 0, 1, 0.7843137, 1,
-0.07775474, -1.381046, -3.446189, 0, 1, 0.7882353, 1,
-0.07744063, 0.3635881, 0.8968916, 0, 1, 0.7960784, 1,
-0.07541353, -0.6711625, -1.940805, 0, 1, 0.8039216, 1,
-0.07429256, 0.1940062, -1.405974, 0, 1, 0.8078431, 1,
-0.07309612, -1.650361, -2.181828, 0, 1, 0.8156863, 1,
-0.07187224, 0.638064, -0.04655617, 0, 1, 0.8196079, 1,
-0.06712308, -0.8597232, -4.61983, 0, 1, 0.827451, 1,
-0.06260546, 0.712526, 0.2179798, 0, 1, 0.8313726, 1,
-0.06130321, 0.1227109, -0.6493052, 0, 1, 0.8392157, 1,
-0.0598809, 2.289522, 0.3726156, 0, 1, 0.8431373, 1,
-0.05868861, -0.4442328, -2.375243, 0, 1, 0.8509804, 1,
-0.05615457, -1.409865, -2.474806, 0, 1, 0.854902, 1,
-0.05059981, -0.7490149, -4.172452, 0, 1, 0.8627451, 1,
-0.05027363, -6.115373e-05, -1.200306, 0, 1, 0.8666667, 1,
-0.04798887, -0.2745985, -2.744652, 0, 1, 0.8745098, 1,
-0.04783141, -0.3094514, -3.535163, 0, 1, 0.8784314, 1,
-0.04694008, 0.4270562, -0.008553988, 0, 1, 0.8862745, 1,
-0.04506235, -0.5543439, -2.219425, 0, 1, 0.8901961, 1,
-0.04436023, -0.592369, -1.767871, 0, 1, 0.8980392, 1,
-0.04217002, 1.171364, -0.323281, 0, 1, 0.9058824, 1,
-0.04202725, -0.2379754, -2.221518, 0, 1, 0.9098039, 1,
-0.03853128, 0.9860715, -1.615196, 0, 1, 0.9176471, 1,
-0.0346415, -0.5612306, -4.376728, 0, 1, 0.9215686, 1,
-0.03443978, -0.05157563, 0.009507813, 0, 1, 0.9294118, 1,
-0.03366949, 0.129797, -0.3888705, 0, 1, 0.9333333, 1,
-0.03190294, -0.3801489, -1.551009, 0, 1, 0.9411765, 1,
-0.02967718, 1.178051, 1.380997, 0, 1, 0.945098, 1,
-0.02913076, 0.1801925, 1.91341, 0, 1, 0.9529412, 1,
-0.02886691, 0.2311225, 1.505871, 0, 1, 0.9568627, 1,
-0.02826961, -0.6336432, -3.712002, 0, 1, 0.9647059, 1,
-0.0280158, -0.002643962, -2.067049, 0, 1, 0.9686275, 1,
-0.02380054, 0.639284, -0.1547747, 0, 1, 0.9764706, 1,
-0.02222544, 1.27881, -0.2420726, 0, 1, 0.9803922, 1,
-0.0145427, -0.1404911, -4.863167, 0, 1, 0.9882353, 1,
-0.01393709, -2.645186, -2.877111, 0, 1, 0.9921569, 1,
-0.01074518, 0.3838863, -0.6298126, 0, 1, 1, 1,
-0.009254367, -0.4919258, -3.325009, 0, 0.9921569, 1, 1,
-0.007958855, -0.5561873, -3.216053, 0, 0.9882353, 1, 1,
-0.001689618, 0.117265, 0.07480926, 0, 0.9803922, 1, 1,
-0.0006292406, 0.2674631, 1.040829, 0, 0.9764706, 1, 1,
0.002735334, 0.01620328, -0.8200768, 0, 0.9686275, 1, 1,
0.006841988, 0.3639279, -0.4791691, 0, 0.9647059, 1, 1,
0.006948899, -1.801941, 2.059061, 0, 0.9568627, 1, 1,
0.009674218, -1.636278, 3.731739, 0, 0.9529412, 1, 1,
0.0105816, -0.87308, 2.884306, 0, 0.945098, 1, 1,
0.01408627, -0.2246875, 2.297891, 0, 0.9411765, 1, 1,
0.01685786, 0.3858954, 0.1519669, 0, 0.9333333, 1, 1,
0.02053113, -1.278674, 3.168188, 0, 0.9294118, 1, 1,
0.0216915, 0.154715, 1.064436, 0, 0.9215686, 1, 1,
0.02323965, 0.5580401, 0.6242214, 0, 0.9176471, 1, 1,
0.02873977, 1.553545, 1.085753, 0, 0.9098039, 1, 1,
0.03218506, -0.6066578, 2.26288, 0, 0.9058824, 1, 1,
0.03299505, -0.7147051, 1.239611, 0, 0.8980392, 1, 1,
0.03371538, -1.772265, 3.924484, 0, 0.8901961, 1, 1,
0.03518817, 0.3170435, 0.8680027, 0, 0.8862745, 1, 1,
0.03547456, 0.2251499, 0.2512477, 0, 0.8784314, 1, 1,
0.03548099, 1.223163, -1.178232, 0, 0.8745098, 1, 1,
0.03630535, 1.098696, -0.7260608, 0, 0.8666667, 1, 1,
0.03722604, 0.3059933, -0.2035761, 0, 0.8627451, 1, 1,
0.03810336, 0.4708475, 0.7350443, 0, 0.854902, 1, 1,
0.03888584, 1.689625, -0.4515888, 0, 0.8509804, 1, 1,
0.03969773, -0.8599167, 2.654282, 0, 0.8431373, 1, 1,
0.04119834, 1.02436, -1.510079, 0, 0.8392157, 1, 1,
0.04158701, 0.7820514, 0.3354458, 0, 0.8313726, 1, 1,
0.042996, 0.582334, 1.757264, 0, 0.827451, 1, 1,
0.04312161, 0.185696, -0.5674962, 0, 0.8196079, 1, 1,
0.04472928, -0.763656, 4.085028, 0, 0.8156863, 1, 1,
0.04524737, -0.3789865, 0.3393406, 0, 0.8078431, 1, 1,
0.0478885, -1.062983, 2.855377, 0, 0.8039216, 1, 1,
0.04899548, -0.6118599, 3.241706, 0, 0.7960784, 1, 1,
0.05082997, 1.185962, -0.1014018, 0, 0.7882353, 1, 1,
0.05566316, 0.01910341, 2.080465, 0, 0.7843137, 1, 1,
0.06246772, -0.5279326, 2.633582, 0, 0.7764706, 1, 1,
0.0628398, -0.6281382, 3.486864, 0, 0.772549, 1, 1,
0.0684178, -1.203015, 3.404564, 0, 0.7647059, 1, 1,
0.07139625, 0.2574127, 1.020462, 0, 0.7607843, 1, 1,
0.07377187, -1.778085, 1.523969, 0, 0.7529412, 1, 1,
0.0750834, -0.2631696, 2.054985, 0, 0.7490196, 1, 1,
0.07872681, 1.612247, 0.3991177, 0, 0.7411765, 1, 1,
0.08570673, -2.872488, 1.354999, 0, 0.7372549, 1, 1,
0.0875746, -0.04189031, 1.948069, 0, 0.7294118, 1, 1,
0.09170046, 1.840017, 0.782657, 0, 0.7254902, 1, 1,
0.09325007, -0.5377478, 3.890958, 0, 0.7176471, 1, 1,
0.09474982, -0.5435486, 3.97675, 0, 0.7137255, 1, 1,
0.09517429, -0.674535, 2.528094, 0, 0.7058824, 1, 1,
0.0988543, -0.4151353, 3.664022, 0, 0.6980392, 1, 1,
0.1003471, -0.4193183, 3.160682, 0, 0.6941177, 1, 1,
0.1070479, -1.020374, 2.649858, 0, 0.6862745, 1, 1,
0.1142823, 1.280612, 0.2234973, 0, 0.682353, 1, 1,
0.1157138, 1.146625, -0.4433535, 0, 0.6745098, 1, 1,
0.1188672, -2.02106, 2.795225, 0, 0.6705883, 1, 1,
0.1191843, -0.03676541, 2.221622, 0, 0.6627451, 1, 1,
0.1212912, 0.001211251, 0.7953079, 0, 0.6588235, 1, 1,
0.1214101, -1.026203, 2.147637, 0, 0.6509804, 1, 1,
0.1262473, -0.1501696, 3.712126, 0, 0.6470588, 1, 1,
0.1274449, -0.9225551, 2.346894, 0, 0.6392157, 1, 1,
0.1282074, -0.02515372, 2.575989, 0, 0.6352941, 1, 1,
0.1307573, -0.6010237, 2.110002, 0, 0.627451, 1, 1,
0.1326507, 2.075421, -1.829157, 0, 0.6235294, 1, 1,
0.1350821, 0.8999857, -1.227347, 0, 0.6156863, 1, 1,
0.1365013, 0.3536695, 1.158218, 0, 0.6117647, 1, 1,
0.1367423, 0.5030063, -0.04325091, 0, 0.6039216, 1, 1,
0.1389445, -0.6735787, 4.030825, 0, 0.5960785, 1, 1,
0.1406404, 0.4831274, -1.59786, 0, 0.5921569, 1, 1,
0.1411502, 1.886708, -0.3075694, 0, 0.5843138, 1, 1,
0.1434588, -0.2815846, 2.624785, 0, 0.5803922, 1, 1,
0.1454259, 0.1879723, 1.553058, 0, 0.572549, 1, 1,
0.1493213, 1.812588, 1.653623, 0, 0.5686275, 1, 1,
0.1515173, 0.5884602, 0.5160685, 0, 0.5607843, 1, 1,
0.1528535, -0.01471585, 2.611182, 0, 0.5568628, 1, 1,
0.1551255, -1.595213, 3.215478, 0, 0.5490196, 1, 1,
0.1570384, 1.372176, -1.209421, 0, 0.5450981, 1, 1,
0.1587098, 0.3484427, 0.7104018, 0, 0.5372549, 1, 1,
0.164969, -0.4351875, 3.387973, 0, 0.5333334, 1, 1,
0.166583, 0.7680801, -0.8433785, 0, 0.5254902, 1, 1,
0.1676617, -0.6985102, 0.04551644, 0, 0.5215687, 1, 1,
0.1691283, -0.2909266, 1.3051, 0, 0.5137255, 1, 1,
0.171697, 0.2120754, -1.502881, 0, 0.509804, 1, 1,
0.1742593, 0.2705215, 1.569042, 0, 0.5019608, 1, 1,
0.1749536, 0.3972982, -0.4050488, 0, 0.4941176, 1, 1,
0.1803463, 1.285294, -1.160952, 0, 0.4901961, 1, 1,
0.1810108, -0.02632737, 1.111736, 0, 0.4823529, 1, 1,
0.1856568, 0.1063658, -0.1700421, 0, 0.4784314, 1, 1,
0.1879219, 0.07326598, -0.480359, 0, 0.4705882, 1, 1,
0.1894144, -1.206823, 4.163602, 0, 0.4666667, 1, 1,
0.1901711, 0.9661378, 0.3917668, 0, 0.4588235, 1, 1,
0.1920586, 1.546981, 0.4605991, 0, 0.454902, 1, 1,
0.1936265, 0.6142922, 1.268213, 0, 0.4470588, 1, 1,
0.2050629, 0.8345456, -0.2314033, 0, 0.4431373, 1, 1,
0.2090863, -0.3162313, 2.362003, 0, 0.4352941, 1, 1,
0.2117646, -0.68489, 2.354201, 0, 0.4313726, 1, 1,
0.2129581, -1.74194, 2.048705, 0, 0.4235294, 1, 1,
0.213779, -0.6488439, 2.021917, 0, 0.4196078, 1, 1,
0.2140688, 0.2222851, 0.9468898, 0, 0.4117647, 1, 1,
0.2158051, 0.1835893, -0.1125259, 0, 0.4078431, 1, 1,
0.216765, -0.4952071, 3.40887, 0, 0.4, 1, 1,
0.2172655, 0.453788, 1.063088, 0, 0.3921569, 1, 1,
0.219742, -0.09411365, 1.404411, 0, 0.3882353, 1, 1,
0.2218183, 0.1914872, 1.838035, 0, 0.3803922, 1, 1,
0.2235514, 2.1611, 0.6015668, 0, 0.3764706, 1, 1,
0.2249607, -0.7251482, 2.724144, 0, 0.3686275, 1, 1,
0.2288645, 0.4447219, 1.070539, 0, 0.3647059, 1, 1,
0.2288821, -0.9410862, 3.65486, 0, 0.3568628, 1, 1,
0.2314289, 0.05235932, 1.723541, 0, 0.3529412, 1, 1,
0.2343447, 0.6965775, 0.2013728, 0, 0.345098, 1, 1,
0.2461919, -0.9894851, 2.945895, 0, 0.3411765, 1, 1,
0.2482226, -0.3513408, 4.394194, 0, 0.3333333, 1, 1,
0.2545452, 2.592261, 0.6445953, 0, 0.3294118, 1, 1,
0.2553722, -1.713879, 3.484934, 0, 0.3215686, 1, 1,
0.2592178, -1.33408, 2.406944, 0, 0.3176471, 1, 1,
0.260864, 0.5826414, 0.7267684, 0, 0.3098039, 1, 1,
0.2610159, 0.624809, 0.01281149, 0, 0.3058824, 1, 1,
0.2690518, -0.5877599, 3.931756, 0, 0.2980392, 1, 1,
0.2774494, 1.350219, -0.8187633, 0, 0.2901961, 1, 1,
0.2779616, -0.3884129, 1.771761, 0, 0.2862745, 1, 1,
0.2787574, -0.4436232, 0.7146049, 0, 0.2784314, 1, 1,
0.2805544, 0.4696109, -1.285816, 0, 0.2745098, 1, 1,
0.2845608, 2.301136, -0.6109635, 0, 0.2666667, 1, 1,
0.2849476, -1.690755, 4.113696, 0, 0.2627451, 1, 1,
0.2875936, -0.363905, 2.537866, 0, 0.254902, 1, 1,
0.2937815, -0.06627187, 2.150477, 0, 0.2509804, 1, 1,
0.2963144, 0.1120423, 0.7965887, 0, 0.2431373, 1, 1,
0.2988957, -0.8425634, 1.822652, 0, 0.2392157, 1, 1,
0.3000314, -0.3341205, 2.174407, 0, 0.2313726, 1, 1,
0.300217, -0.1683399, 2.740963, 0, 0.227451, 1, 1,
0.3005819, -0.6018414, 2.503177, 0, 0.2196078, 1, 1,
0.3040114, 1.440028, 1.615611, 0, 0.2156863, 1, 1,
0.3078925, 0.80884, 0.7835253, 0, 0.2078431, 1, 1,
0.3090427, -1.157307, 4.482686, 0, 0.2039216, 1, 1,
0.3111047, -1.365712, 2.866076, 0, 0.1960784, 1, 1,
0.3133648, -0.151127, 1.922688, 0, 0.1882353, 1, 1,
0.3151127, -0.6534292, 1.747605, 0, 0.1843137, 1, 1,
0.3206645, -1.467557, 3.439556, 0, 0.1764706, 1, 1,
0.3227333, 1.095312, 0.1099101, 0, 0.172549, 1, 1,
0.3268725, -0.2645567, 1.191371, 0, 0.1647059, 1, 1,
0.329223, -0.1738587, 0.5562196, 0, 0.1607843, 1, 1,
0.3299334, -1.271367, 2.110323, 0, 0.1529412, 1, 1,
0.3311478, 0.3007002, 1.073624, 0, 0.1490196, 1, 1,
0.3322022, 0.7319191, 0.7395896, 0, 0.1411765, 1, 1,
0.337798, 0.4685858, -0.05309217, 0, 0.1372549, 1, 1,
0.3381271, -0.1597017, 2.786696, 0, 0.1294118, 1, 1,
0.342427, 1.083214, 1.040586, 0, 0.1254902, 1, 1,
0.3459501, 0.004512641, 3.102133, 0, 0.1176471, 1, 1,
0.3465269, -1.360244, 3.224738, 0, 0.1137255, 1, 1,
0.3481302, 0.3527108, 1.570421, 0, 0.1058824, 1, 1,
0.351619, 0.5795718, 0.05386077, 0, 0.09803922, 1, 1,
0.3524159, -0.4205296, 2.885257, 0, 0.09411765, 1, 1,
0.3608325, 2.574761, 1.232296, 0, 0.08627451, 1, 1,
0.362661, -0.1612385, 2.048812, 0, 0.08235294, 1, 1,
0.3628717, 0.7228792, 3.64042, 0, 0.07450981, 1, 1,
0.3674483, 0.7886873, -1.099838, 0, 0.07058824, 1, 1,
0.3700734, -0.0739288, 1.841005, 0, 0.0627451, 1, 1,
0.3714841, -1.516502, 4.10458, 0, 0.05882353, 1, 1,
0.3759773, 1.927949, -0.07534819, 0, 0.05098039, 1, 1,
0.3772829, 0.7117785, 1.382375, 0, 0.04705882, 1, 1,
0.3774813, 0.5078247, 0.8884945, 0, 0.03921569, 1, 1,
0.3791749, 0.5148525, 0.2345303, 0, 0.03529412, 1, 1,
0.381946, 1.337897, 0.4833103, 0, 0.02745098, 1, 1,
0.3828727, -0.6425597, 1.803824, 0, 0.02352941, 1, 1,
0.385061, 0.3738227, -0.9286304, 0, 0.01568628, 1, 1,
0.3853704, -2.048558, 2.20147, 0, 0.01176471, 1, 1,
0.3952042, -0.2482157, 2.823112, 0, 0.003921569, 1, 1,
0.3963386, 1.393803, -0.7489516, 0.003921569, 0, 1, 1,
0.4056199, -0.7541527, 3.935532, 0.007843138, 0, 1, 1,
0.4068546, -1.135184, 2.843855, 0.01568628, 0, 1, 1,
0.4075631, 0.1795268, 1.584794, 0.01960784, 0, 1, 1,
0.4089728, 0.6600205, 0.02325174, 0.02745098, 0, 1, 1,
0.4102088, -0.1465382, 2.05423, 0.03137255, 0, 1, 1,
0.4112614, 0.9753932, -0.7902611, 0.03921569, 0, 1, 1,
0.4114228, -0.187085, 0.5888194, 0.04313726, 0, 1, 1,
0.4141819, 0.4293105, 0.03303597, 0.05098039, 0, 1, 1,
0.4226887, -1.457857, 3.47687, 0.05490196, 0, 1, 1,
0.4228317, -0.5272392, 1.857956, 0.0627451, 0, 1, 1,
0.4257596, -0.07085206, 2.680316, 0.06666667, 0, 1, 1,
0.432147, 0.8860393, 2.351474, 0.07450981, 0, 1, 1,
0.4324417, -0.2785577, 1.728995, 0.07843138, 0, 1, 1,
0.43446, -1.778159, 3.934531, 0.08627451, 0, 1, 1,
0.436864, 2.140694, 0.404366, 0.09019608, 0, 1, 1,
0.437051, 0.8378594, -0.7930157, 0.09803922, 0, 1, 1,
0.442325, 0.6635286, 0.4670551, 0.1058824, 0, 1, 1,
0.4444115, 1.447876, -0.9331467, 0.1098039, 0, 1, 1,
0.4455582, 0.2388685, -0.1376211, 0.1176471, 0, 1, 1,
0.453662, 1.219956, -0.411758, 0.1215686, 0, 1, 1,
0.4541142, -0.4933113, 2.517302, 0.1294118, 0, 1, 1,
0.4542418, 2.457326, 1.662835, 0.1333333, 0, 1, 1,
0.4545094, 2.329875, 0.1006459, 0.1411765, 0, 1, 1,
0.4571668, -0.3414639, 4.064775, 0.145098, 0, 1, 1,
0.4574363, -1.052423, 2.140628, 0.1529412, 0, 1, 1,
0.4598373, 1.729138, 0.2201546, 0.1568628, 0, 1, 1,
0.4663084, 0.8500332, -0.3090214, 0.1647059, 0, 1, 1,
0.4668584, -0.5060223, 4.466688, 0.1686275, 0, 1, 1,
0.4673032, 1.118605, -0.281436, 0.1764706, 0, 1, 1,
0.4716531, -0.3765935, 1.648375, 0.1803922, 0, 1, 1,
0.4727082, 0.215108, 1.965145, 0.1882353, 0, 1, 1,
0.4854686, -0.2012991, 3.421413, 0.1921569, 0, 1, 1,
0.4913318, -0.1094062, 2.047106, 0.2, 0, 1, 1,
0.5020719, -0.3458117, 1.034688, 0.2078431, 0, 1, 1,
0.5029449, 0.0923843, 2.422155, 0.2117647, 0, 1, 1,
0.5043139, -0.8564773, 3.554365, 0.2196078, 0, 1, 1,
0.5057846, -0.7377036, 0.6795276, 0.2235294, 0, 1, 1,
0.5063071, -0.105616, 2.189053, 0.2313726, 0, 1, 1,
0.5088798, 0.09272096, 3.30864, 0.2352941, 0, 1, 1,
0.5111524, 0.09593353, 2.122842, 0.2431373, 0, 1, 1,
0.5150334, -1.727962, 2.033672, 0.2470588, 0, 1, 1,
0.5151592, -0.02731797, 0.5242727, 0.254902, 0, 1, 1,
0.5157121, 0.7241179, -0.2217259, 0.2588235, 0, 1, 1,
0.5172074, -0.7242706, 2.095561, 0.2666667, 0, 1, 1,
0.5238823, -0.4756732, 1.671876, 0.2705882, 0, 1, 1,
0.5249153, -1.008005, 1.982411, 0.2784314, 0, 1, 1,
0.5260522, -0.6547853, 3.803314, 0.282353, 0, 1, 1,
0.5270265, -1.967703, 3.116014, 0.2901961, 0, 1, 1,
0.5289182, -1.223071, 4.22841, 0.2941177, 0, 1, 1,
0.5299016, -0.09162866, 0.2937167, 0.3019608, 0, 1, 1,
0.534467, -0.3274777, 0.4053646, 0.3098039, 0, 1, 1,
0.5364142, -1.36151, 2.88027, 0.3137255, 0, 1, 1,
0.5369598, 0.1826608, 2.337345, 0.3215686, 0, 1, 1,
0.5405831, 1.000931, -0.8200072, 0.3254902, 0, 1, 1,
0.5454315, 1.361289, 0.9943359, 0.3333333, 0, 1, 1,
0.5456172, 1.459661, 1.239554, 0.3372549, 0, 1, 1,
0.5495108, 1.490625, 0.9442456, 0.345098, 0, 1, 1,
0.5530182, -0.5979266, 3.016684, 0.3490196, 0, 1, 1,
0.5572048, -0.5716519, 1.113245, 0.3568628, 0, 1, 1,
0.5650886, -0.7729838, 0.7387734, 0.3607843, 0, 1, 1,
0.5709097, -2.350091, 3.61121, 0.3686275, 0, 1, 1,
0.5752513, -0.2666818, 2.137774, 0.372549, 0, 1, 1,
0.5843016, -0.5853397, 1.035065, 0.3803922, 0, 1, 1,
0.5850346, -0.9662939, 2.910878, 0.3843137, 0, 1, 1,
0.5852269, -1.114854, 3.170028, 0.3921569, 0, 1, 1,
0.5858832, -2.397203, 3.432308, 0.3960784, 0, 1, 1,
0.5882975, -1.477806, 1.246012, 0.4039216, 0, 1, 1,
0.588419, 0.1478619, 2.568781, 0.4117647, 0, 1, 1,
0.5907392, 0.8923429, 0.973662, 0.4156863, 0, 1, 1,
0.5922772, 0.1661012, 1.793006, 0.4235294, 0, 1, 1,
0.5986173, 0.3649042, -0.2145661, 0.427451, 0, 1, 1,
0.5988689, -0.3686664, 0.570632, 0.4352941, 0, 1, 1,
0.6053241, 0.1189495, -0.02364639, 0.4392157, 0, 1, 1,
0.6064882, 0.2694884, 0.8415331, 0.4470588, 0, 1, 1,
0.6093476, 1.919416, -0.0008652754, 0.4509804, 0, 1, 1,
0.6111699, -1.726034, 2.528104, 0.4588235, 0, 1, 1,
0.6113791, 0.3802484, -0.2738028, 0.4627451, 0, 1, 1,
0.6115806, 0.03416079, 0.7889342, 0.4705882, 0, 1, 1,
0.6125866, 1.282035, -0.05673575, 0.4745098, 0, 1, 1,
0.6131344, 0.5719932, 1.882834, 0.4823529, 0, 1, 1,
0.6158621, 0.5699829, 0.5690489, 0.4862745, 0, 1, 1,
0.6158964, 0.5329322, 0.4746759, 0.4941176, 0, 1, 1,
0.6182836, -0.5024918, 0.2316076, 0.5019608, 0, 1, 1,
0.6196788, -0.3677144, 2.45741, 0.5058824, 0, 1, 1,
0.6218771, 0.3172531, 1.227819, 0.5137255, 0, 1, 1,
0.6241491, -1.766123, 1.332473, 0.5176471, 0, 1, 1,
0.6244462, 0.09583381, 3.480099, 0.5254902, 0, 1, 1,
0.6313717, -0.2461357, 1.081342, 0.5294118, 0, 1, 1,
0.6323998, -0.3553933, 2.936881, 0.5372549, 0, 1, 1,
0.6328787, 1.149179, 0.235555, 0.5411765, 0, 1, 1,
0.6331974, -0.986635, 3.23036, 0.5490196, 0, 1, 1,
0.6362357, -0.2126006, 1.986976, 0.5529412, 0, 1, 1,
0.647984, 0.06905802, 2.233286, 0.5607843, 0, 1, 1,
0.6529173, 0.8067171, 1.915474, 0.5647059, 0, 1, 1,
0.6557342, 0.4285564, -1.187501, 0.572549, 0, 1, 1,
0.6562808, -0.3214667, 0.9922107, 0.5764706, 0, 1, 1,
0.6585623, -0.02983189, 1.188923, 0.5843138, 0, 1, 1,
0.6632866, -0.4178815, 1.204626, 0.5882353, 0, 1, 1,
0.6657138, 0.5402243, 0.06495293, 0.5960785, 0, 1, 1,
0.6694654, -1.334225, 4.309476, 0.6039216, 0, 1, 1,
0.6723704, -1.112048, 3.260404, 0.6078432, 0, 1, 1,
0.6724551, -1.424618, 3.084833, 0.6156863, 0, 1, 1,
0.6816638, 0.3917949, 1.996662, 0.6196079, 0, 1, 1,
0.6857371, -1.687701, 3.826579, 0.627451, 0, 1, 1,
0.6915414, 0.9580611, -0.4195791, 0.6313726, 0, 1, 1,
0.6956095, -0.6675614, 3.066716, 0.6392157, 0, 1, 1,
0.6985672, -0.8495247, 3.65665, 0.6431373, 0, 1, 1,
0.705718, 0.4529236, 0.5939924, 0.6509804, 0, 1, 1,
0.7109659, -0.969708, 1.589254, 0.654902, 0, 1, 1,
0.7116083, 0.03824238, 0.6642567, 0.6627451, 0, 1, 1,
0.7230284, -0.4071089, 2.528563, 0.6666667, 0, 1, 1,
0.7315379, -1.05546, 2.320895, 0.6745098, 0, 1, 1,
0.7346151, 1.06734, 0.49613, 0.6784314, 0, 1, 1,
0.7352295, -0.8166817, 0.691222, 0.6862745, 0, 1, 1,
0.7429906, 1.315127, 1.469118, 0.6901961, 0, 1, 1,
0.7461814, -0.3198946, 2.783176, 0.6980392, 0, 1, 1,
0.7465444, -0.6289676, 2.602486, 0.7058824, 0, 1, 1,
0.7530214, 0.8806135, 1.557947, 0.7098039, 0, 1, 1,
0.7533892, 0.06254541, 1.661972, 0.7176471, 0, 1, 1,
0.7543457, -0.1047926, 2.08687, 0.7215686, 0, 1, 1,
0.7545274, -1.540034, 2.620857, 0.7294118, 0, 1, 1,
0.7550331, -1.091479, 1.614503, 0.7333333, 0, 1, 1,
0.7715901, 0.01758729, 1.235092, 0.7411765, 0, 1, 1,
0.7718489, -0.01811853, 2.400609, 0.7450981, 0, 1, 1,
0.7748125, -0.2803412, 2.547215, 0.7529412, 0, 1, 1,
0.781725, -0.6911408, 3.369935, 0.7568628, 0, 1, 1,
0.7851396, 0.8586046, 0.9117028, 0.7647059, 0, 1, 1,
0.7862346, -0.507169, 2.154522, 0.7686275, 0, 1, 1,
0.788959, -0.7453101, 0.8783293, 0.7764706, 0, 1, 1,
0.7934929, -0.2687285, 1.102279, 0.7803922, 0, 1, 1,
0.7943813, 0.9575602, 0.3860543, 0.7882353, 0, 1, 1,
0.7959929, 0.5868096, 2.22034, 0.7921569, 0, 1, 1,
0.7974295, -1.025664, 2.893608, 0.8, 0, 1, 1,
0.8022567, 0.9707094, 0.4828943, 0.8078431, 0, 1, 1,
0.8040819, -0.0497966, 1.551501, 0.8117647, 0, 1, 1,
0.8064882, -0.8739914, 2.399935, 0.8196079, 0, 1, 1,
0.8112754, 0.6700188, -0.6941773, 0.8235294, 0, 1, 1,
0.8142668, -1.216149, 1.389317, 0.8313726, 0, 1, 1,
0.8144031, 0.418523, 0.7394912, 0.8352941, 0, 1, 1,
0.8200059, 0.826636, 0.838122, 0.8431373, 0, 1, 1,
0.8215514, -0.0690207, 1.484132, 0.8470588, 0, 1, 1,
0.8223622, -0.2921583, 1.723062, 0.854902, 0, 1, 1,
0.8288286, -0.4304909, 1.560605, 0.8588235, 0, 1, 1,
0.8300881, -0.7500862, 2.007171, 0.8666667, 0, 1, 1,
0.8302472, -0.2276694, 2.199817, 0.8705882, 0, 1, 1,
0.8355815, 0.08231723, 1.152415, 0.8784314, 0, 1, 1,
0.845517, 1.096768, 0.5095579, 0.8823529, 0, 1, 1,
0.8471025, -0.184952, 1.752061, 0.8901961, 0, 1, 1,
0.8589032, -0.4905588, 1.079563, 0.8941177, 0, 1, 1,
0.8609258, -0.5335057, 1.854473, 0.9019608, 0, 1, 1,
0.8711247, 0.3977515, 2.156533, 0.9098039, 0, 1, 1,
0.8748977, 0.07824265, 2.273576, 0.9137255, 0, 1, 1,
0.875102, -0.673875, 2.094275, 0.9215686, 0, 1, 1,
0.8752894, 1.053151, 0.6380612, 0.9254902, 0, 1, 1,
0.8911358, 0.9894881, 0.8690228, 0.9333333, 0, 1, 1,
0.8915948, -0.6525828, 0.1715951, 0.9372549, 0, 1, 1,
0.9034817, -0.0528563, 1.136075, 0.945098, 0, 1, 1,
0.9043897, -0.9081622, 2.507593, 0.9490196, 0, 1, 1,
0.9098921, 0.8090486, 1.258414, 0.9568627, 0, 1, 1,
0.9108956, 0.7097497, -1.567263, 0.9607843, 0, 1, 1,
0.9225364, -1.401806, 1.24371, 0.9686275, 0, 1, 1,
0.9235535, 1.336507, -0.6362808, 0.972549, 0, 1, 1,
0.9239398, 1.229612, 0.3029943, 0.9803922, 0, 1, 1,
0.9268214, 1.386255, 1.955492, 0.9843137, 0, 1, 1,
0.9301419, -0.2939818, 3.279486, 0.9921569, 0, 1, 1,
0.9335636, 2.009563, 0.6369891, 0.9960784, 0, 1, 1,
0.941655, 0.1758505, 1.536431, 1, 0, 0.9960784, 1,
0.9456118, 0.6884743, 0.6567817, 1, 0, 0.9882353, 1,
0.9456259, -2.400828, 2.132138, 1, 0, 0.9843137, 1,
0.9460899, 1.270316, 1.095829, 1, 0, 0.9764706, 1,
0.9575555, 1.786936, 0.8310773, 1, 0, 0.972549, 1,
0.9586326, -0.8583957, 4.27778, 1, 0, 0.9647059, 1,
0.9622837, 1.217919, 0.1208043, 1, 0, 0.9607843, 1,
0.9693965, -0.04313153, 1.926966, 1, 0, 0.9529412, 1,
0.9728695, -2.142415, 3.074857, 1, 0, 0.9490196, 1,
0.9766369, 1.199028, 1.551427, 1, 0, 0.9411765, 1,
0.9827896, -1.45325, 1.517009, 1, 0, 0.9372549, 1,
0.9848526, -0.01449847, 0.7658711, 1, 0, 0.9294118, 1,
0.9876243, -1.120063, 1.547102, 1, 0, 0.9254902, 1,
0.9959604, -0.1355525, 2.526436, 1, 0, 0.9176471, 1,
1.002275, 1.647543, -0.1132555, 1, 0, 0.9137255, 1,
1.005587, -0.6409851, 1.204575, 1, 0, 0.9058824, 1,
1.008229, -0.9413245, 1.733933, 1, 0, 0.9019608, 1,
1.014905, -1.056612, 0.9524072, 1, 0, 0.8941177, 1,
1.021526, 0.6084599, 1.288306, 1, 0, 0.8862745, 1,
1.033002, -1.446825, 2.77203, 1, 0, 0.8823529, 1,
1.035821, -0.1949429, -0.9262121, 1, 0, 0.8745098, 1,
1.039762, -1.331825, 2.62226, 1, 0, 0.8705882, 1,
1.042029, -2.054219, 2.317864, 1, 0, 0.8627451, 1,
1.0434, 0.06216558, -0.1772959, 1, 0, 0.8588235, 1,
1.046579, 0.3472882, 1.775931, 1, 0, 0.8509804, 1,
1.052185, -1.449069, 1.440233, 1, 0, 0.8470588, 1,
1.053047, -1.721469, 4.964576, 1, 0, 0.8392157, 1,
1.056607, 1.620921, 0.1601852, 1, 0, 0.8352941, 1,
1.062381, -0.838459, 1.366601, 1, 0, 0.827451, 1,
1.07323, 1.140555, -0.4166749, 1, 0, 0.8235294, 1,
1.081908, -1.115999, 2.622435, 1, 0, 0.8156863, 1,
1.083211, 2.917097, -0.06069377, 1, 0, 0.8117647, 1,
1.08592, 0.2440931, 0.9235703, 1, 0, 0.8039216, 1,
1.087207, 2.869156, 0.2935587, 1, 0, 0.7960784, 1,
1.09618, -1.075772, 2.872251, 1, 0, 0.7921569, 1,
1.103571, 1.091639, 2.778043, 1, 0, 0.7843137, 1,
1.105109, -1.632413, 3.008687, 1, 0, 0.7803922, 1,
1.106904, -0.5958663, 0.1133245, 1, 0, 0.772549, 1,
1.108464, -0.3694134, 3.854041, 1, 0, 0.7686275, 1,
1.115669, -0.7981523, 1.632149, 1, 0, 0.7607843, 1,
1.122261, 0.4597983, 2.269539, 1, 0, 0.7568628, 1,
1.125244, 0.2419401, 2.718621, 1, 0, 0.7490196, 1,
1.129799, -0.6546266, 2.11135, 1, 0, 0.7450981, 1,
1.135151, 1.376833, -0.06897983, 1, 0, 0.7372549, 1,
1.136162, 1.43897, 0.3856137, 1, 0, 0.7333333, 1,
1.136783, -1.405035, 0.3698901, 1, 0, 0.7254902, 1,
1.144091, -1.120026, 2.632921, 1, 0, 0.7215686, 1,
1.144598, 2.285555, 1.794455, 1, 0, 0.7137255, 1,
1.148867, 2.386859, 2.146339, 1, 0, 0.7098039, 1,
1.151575, -0.06351707, 1.786915, 1, 0, 0.7019608, 1,
1.161467, -0.002265492, 1.656632, 1, 0, 0.6941177, 1,
1.163253, -0.1576079, 2.466108, 1, 0, 0.6901961, 1,
1.166216, -0.1803406, -0.2784131, 1, 0, 0.682353, 1,
1.177844, -1.007102, 0.2306549, 1, 0, 0.6784314, 1,
1.18783, 2.218462, 0.2866096, 1, 0, 0.6705883, 1,
1.188514, -0.04186191, 0.8086026, 1, 0, 0.6666667, 1,
1.213429, 1.157977, 1.731479, 1, 0, 0.6588235, 1,
1.214894, 0.03635069, 1.41917, 1, 0, 0.654902, 1,
1.220561, 0.08792052, 1.800777, 1, 0, 0.6470588, 1,
1.231651, 1.451217, 2.577316, 1, 0, 0.6431373, 1,
1.234949, 0.7357664, 1.490596, 1, 0, 0.6352941, 1,
1.237693, -1.319977, 0.9158133, 1, 0, 0.6313726, 1,
1.244954, -0.08810345, 2.053553, 1, 0, 0.6235294, 1,
1.276946, 0.6276625, 2.170814, 1, 0, 0.6196079, 1,
1.284803, 1.653896, 0.9029177, 1, 0, 0.6117647, 1,
1.288414, 0.211885, 1.356125, 1, 0, 0.6078432, 1,
1.295411, -0.5820138, 2.414858, 1, 0, 0.6, 1,
1.308073, -0.3761498, 0.5461237, 1, 0, 0.5921569, 1,
1.318068, 1.029435, 0.6989374, 1, 0, 0.5882353, 1,
1.318864, 0.9271169, -0.01646702, 1, 0, 0.5803922, 1,
1.330426, 1.158584, 1.286325, 1, 0, 0.5764706, 1,
1.334512, 1.525408, 0.20303, 1, 0, 0.5686275, 1,
1.334891, 1.335536, -0.170383, 1, 0, 0.5647059, 1,
1.346928, 0.5228326, 1.042725, 1, 0, 0.5568628, 1,
1.361175, -1.076131, 2.670906, 1, 0, 0.5529412, 1,
1.381547, 1.36875, -0.1610439, 1, 0, 0.5450981, 1,
1.381786, 0.5091877, -0.1953204, 1, 0, 0.5411765, 1,
1.384279, -0.1784895, 3.20345, 1, 0, 0.5333334, 1,
1.386894, 0.6473922, 2.513733, 1, 0, 0.5294118, 1,
1.387341, -0.7245339, 2.101672, 1, 0, 0.5215687, 1,
1.388545, 0.2906544, 0.5378303, 1, 0, 0.5176471, 1,
1.394056, -0.113488, 3.328867, 1, 0, 0.509804, 1,
1.396206, 1.335184, 1.89955, 1, 0, 0.5058824, 1,
1.418222, -0.06094833, 2.305356, 1, 0, 0.4980392, 1,
1.431533, 0.1315873, 1.626904, 1, 0, 0.4901961, 1,
1.443109, 0.7274009, -0.01494433, 1, 0, 0.4862745, 1,
1.454564, 0.28568, 0.1645629, 1, 0, 0.4784314, 1,
1.466185, 0.2151911, 2.981025, 1, 0, 0.4745098, 1,
1.469871, -0.1025333, 1.986092, 1, 0, 0.4666667, 1,
1.490168, -0.8784642, 3.016547, 1, 0, 0.4627451, 1,
1.493816, 0.9984561, -0.2091205, 1, 0, 0.454902, 1,
1.495228, 0.6759974, 1.006547, 1, 0, 0.4509804, 1,
1.495511, 1.127728, -1.130296, 1, 0, 0.4431373, 1,
1.511989, -0.02153183, 0.7334576, 1, 0, 0.4392157, 1,
1.512509, 1.251389, -0.0562763, 1, 0, 0.4313726, 1,
1.531259, -0.975266, 3.356579, 1, 0, 0.427451, 1,
1.534647, 0.6464814, 1.651742, 1, 0, 0.4196078, 1,
1.535466, 0.604095, 0.4447228, 1, 0, 0.4156863, 1,
1.541431, -0.3435356, 2.364693, 1, 0, 0.4078431, 1,
1.542455, 1.374292, 2.075036, 1, 0, 0.4039216, 1,
1.547029, 0.6119452, 1.620496, 1, 0, 0.3960784, 1,
1.547762, 0.07686122, 1.183859, 1, 0, 0.3882353, 1,
1.550445, 1.581692, 0.9995572, 1, 0, 0.3843137, 1,
1.550667, -0.7935409, 0.7123639, 1, 0, 0.3764706, 1,
1.557337, 0.9585369, -0.05858528, 1, 0, 0.372549, 1,
1.561881, -0.2004087, 2.53532, 1, 0, 0.3647059, 1,
1.570105, 1.074619, -0.7700217, 1, 0, 0.3607843, 1,
1.598709, 0.258782, 2.072329, 1, 0, 0.3529412, 1,
1.599276, 1.383731, 1.025246, 1, 0, 0.3490196, 1,
1.600893, -0.8317274, 2.304789, 1, 0, 0.3411765, 1,
1.603571, 0.1014223, 0.515022, 1, 0, 0.3372549, 1,
1.604635, 0.9271228, 0.7938221, 1, 0, 0.3294118, 1,
1.616885, 0.4364772, 0.4250923, 1, 0, 0.3254902, 1,
1.619251, -0.5159659, 3.99696, 1, 0, 0.3176471, 1,
1.639667, -0.6521382, 1.40474, 1, 0, 0.3137255, 1,
1.653865, 1.880802, 1.806177, 1, 0, 0.3058824, 1,
1.657586, -0.2407408, 1.410219, 1, 0, 0.2980392, 1,
1.666324, -0.03568459, 2.09399, 1, 0, 0.2941177, 1,
1.670349, -1.910736, 1.436059, 1, 0, 0.2862745, 1,
1.689807, 0.01564664, 0.7774252, 1, 0, 0.282353, 1,
1.708217, -0.186258, 3.072277, 1, 0, 0.2745098, 1,
1.714927, 0.7612089, 1.437507, 1, 0, 0.2705882, 1,
1.715079, -0.6226304, 1.300943, 1, 0, 0.2627451, 1,
1.71537, 0.483924, 1.105875, 1, 0, 0.2588235, 1,
1.717102, 2.47195, 0.9761788, 1, 0, 0.2509804, 1,
1.720855, 0.9526684, 0.6094717, 1, 0, 0.2470588, 1,
1.724354, 0.2558308, 0.6283323, 1, 0, 0.2392157, 1,
1.727845, -1.031287, 2.702732, 1, 0, 0.2352941, 1,
1.72977, -0.07488942, 2.122898, 1, 0, 0.227451, 1,
1.74826, 0.435692, 0.5891752, 1, 0, 0.2235294, 1,
1.749664, -0.1459731, 3.210258, 1, 0, 0.2156863, 1,
1.762108, -0.2833926, -0.4230536, 1, 0, 0.2117647, 1,
1.764908, -0.8050586, 2.400623, 1, 0, 0.2039216, 1,
1.770237, 0.1707067, 2.81854, 1, 0, 0.1960784, 1,
1.778034, 0.08662461, 1.893137, 1, 0, 0.1921569, 1,
1.802735, -1.760006, 3.128955, 1, 0, 0.1843137, 1,
1.811118, 0.7181528, 2.673558, 1, 0, 0.1803922, 1,
1.834343, -0.8867969, 3.789162, 1, 0, 0.172549, 1,
1.843233, -0.5585814, 2.028437, 1, 0, 0.1686275, 1,
1.8743, -0.4277456, 1.301838, 1, 0, 0.1607843, 1,
1.903069, -0.3176698, 2.502818, 1, 0, 0.1568628, 1,
1.925645, -1.175301, 2.530574, 1, 0, 0.1490196, 1,
1.944265, -1.81155, 1.382859, 1, 0, 0.145098, 1,
1.965107, 1.331251, -0.7136175, 1, 0, 0.1372549, 1,
1.976332, -1.692158, 2.907815, 1, 0, 0.1333333, 1,
1.976936, 0.3901133, 0.2446934, 1, 0, 0.1254902, 1,
2.007852, -0.4513006, 1.437598, 1, 0, 0.1215686, 1,
2.063337, 1.57198, 0.9544467, 1, 0, 0.1137255, 1,
2.091159, 1.114805, 0.5947414, 1, 0, 0.1098039, 1,
2.105395, -0.08517683, 0.1987947, 1, 0, 0.1019608, 1,
2.12081, -0.1949943, 0.6715934, 1, 0, 0.09411765, 1,
2.126482, -1.340452, 2.300523, 1, 0, 0.09019608, 1,
2.139882, -0.6657503, 2.733531, 1, 0, 0.08235294, 1,
2.25477, -1.66252, 1.589242, 1, 0, 0.07843138, 1,
2.257952, 0.1341642, 0.8971697, 1, 0, 0.07058824, 1,
2.303997, 1.170563, 0.04459748, 1, 0, 0.06666667, 1,
2.316614, 1.471424, -0.2166284, 1, 0, 0.05882353, 1,
2.334403, -1.158819, 1.259149, 1, 0, 0.05490196, 1,
2.491811, 0.6859365, 0.7797563, 1, 0, 0.04705882, 1,
2.661281, 0.9524962, 2.179863, 1, 0, 0.04313726, 1,
2.669554, 0.1676013, 3.943665, 1, 0, 0.03529412, 1,
2.688766, 1.092371, 2.404529, 1, 0, 0.03137255, 1,
2.713038, 2.025806, -0.8501839, 1, 0, 0.02352941, 1,
2.864152, -1.79226, 2.313921, 1, 0, 0.01960784, 1,
2.95011, 1.110679, 1.208963, 1, 0, 0.01176471, 1,
3.086715, -0.7445387, 1.540624, 1, 0, 0.007843138, 1
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
0.08524835, -5.146141, -6.52897, 0, -0.5, 0.5, 0.5,
0.08524835, -5.146141, -6.52897, 1, -0.5, 0.5, 0.5,
0.08524835, -5.146141, -6.52897, 1, 1.5, 0.5, 0.5,
0.08524835, -5.146141, -6.52897, 0, 1.5, 0.5, 0.5
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
-3.933716, -0.04493642, -6.52897, 0, -0.5, 0.5, 0.5,
-3.933716, -0.04493642, -6.52897, 1, -0.5, 0.5, 0.5,
-3.933716, -0.04493642, -6.52897, 1, 1.5, 0.5, 0.5,
-3.933716, -0.04493642, -6.52897, 0, 1.5, 0.5, 0.5
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
-3.933716, -5.146141, 0.05070424, 0, -0.5, 0.5, 0.5,
-3.933716, -5.146141, 0.05070424, 1, -0.5, 0.5, 0.5,
-3.933716, -5.146141, 0.05070424, 1, 1.5, 0.5, 0.5,
-3.933716, -5.146141, 0.05070424, 0, 1.5, 0.5, 0.5
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
-2, -3.96894, -5.010583,
3, -3.96894, -5.010583,
-2, -3.96894, -5.010583,
-2, -4.16514, -5.263648,
-1, -3.96894, -5.010583,
-1, -4.16514, -5.263648,
0, -3.96894, -5.010583,
0, -4.16514, -5.263648,
1, -3.96894, -5.010583,
1, -4.16514, -5.263648,
2, -3.96894, -5.010583,
2, -4.16514, -5.263648,
3, -3.96894, -5.010583,
3, -4.16514, -5.263648
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
-2, -4.55754, -5.769776, 0, -0.5, 0.5, 0.5,
-2, -4.55754, -5.769776, 1, -0.5, 0.5, 0.5,
-2, -4.55754, -5.769776, 1, 1.5, 0.5, 0.5,
-2, -4.55754, -5.769776, 0, 1.5, 0.5, 0.5,
-1, -4.55754, -5.769776, 0, -0.5, 0.5, 0.5,
-1, -4.55754, -5.769776, 1, -0.5, 0.5, 0.5,
-1, -4.55754, -5.769776, 1, 1.5, 0.5, 0.5,
-1, -4.55754, -5.769776, 0, 1.5, 0.5, 0.5,
0, -4.55754, -5.769776, 0, -0.5, 0.5, 0.5,
0, -4.55754, -5.769776, 1, -0.5, 0.5, 0.5,
0, -4.55754, -5.769776, 1, 1.5, 0.5, 0.5,
0, -4.55754, -5.769776, 0, 1.5, 0.5, 0.5,
1, -4.55754, -5.769776, 0, -0.5, 0.5, 0.5,
1, -4.55754, -5.769776, 1, -0.5, 0.5, 0.5,
1, -4.55754, -5.769776, 1, 1.5, 0.5, 0.5,
1, -4.55754, -5.769776, 0, 1.5, 0.5, 0.5,
2, -4.55754, -5.769776, 0, -0.5, 0.5, 0.5,
2, -4.55754, -5.769776, 1, -0.5, 0.5, 0.5,
2, -4.55754, -5.769776, 1, 1.5, 0.5, 0.5,
2, -4.55754, -5.769776, 0, 1.5, 0.5, 0.5,
3, -4.55754, -5.769776, 0, -0.5, 0.5, 0.5,
3, -4.55754, -5.769776, 1, -0.5, 0.5, 0.5,
3, -4.55754, -5.769776, 1, 1.5, 0.5, 0.5,
3, -4.55754, -5.769776, 0, 1.5, 0.5, 0.5
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
-3.006262, -2, -5.010583,
-3.006262, 2, -5.010583,
-3.006262, -2, -5.010583,
-3.160838, -2, -5.263648,
-3.006262, 0, -5.010583,
-3.160838, 0, -5.263648,
-3.006262, 2, -5.010583,
-3.160838, 2, -5.263648
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
"0",
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
-3.469989, -2, -5.769776, 0, -0.5, 0.5, 0.5,
-3.469989, -2, -5.769776, 1, -0.5, 0.5, 0.5,
-3.469989, -2, -5.769776, 1, 1.5, 0.5, 0.5,
-3.469989, -2, -5.769776, 0, 1.5, 0.5, 0.5,
-3.469989, 0, -5.769776, 0, -0.5, 0.5, 0.5,
-3.469989, 0, -5.769776, 1, -0.5, 0.5, 0.5,
-3.469989, 0, -5.769776, 1, 1.5, 0.5, 0.5,
-3.469989, 0, -5.769776, 0, 1.5, 0.5, 0.5,
-3.469989, 2, -5.769776, 0, -0.5, 0.5, 0.5,
-3.469989, 2, -5.769776, 1, -0.5, 0.5, 0.5,
-3.469989, 2, -5.769776, 1, 1.5, 0.5, 0.5,
-3.469989, 2, -5.769776, 0, 1.5, 0.5, 0.5
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
-3.006262, -3.96894, -4,
-3.006262, -3.96894, 4,
-3.006262, -3.96894, -4,
-3.160838, -4.16514, -4,
-3.006262, -3.96894, -2,
-3.160838, -4.16514, -2,
-3.006262, -3.96894, 0,
-3.160838, -4.16514, 0,
-3.006262, -3.96894, 2,
-3.160838, -4.16514, 2,
-3.006262, -3.96894, 4,
-3.160838, -4.16514, 4
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
-3.469989, -4.55754, -4, 0, -0.5, 0.5, 0.5,
-3.469989, -4.55754, -4, 1, -0.5, 0.5, 0.5,
-3.469989, -4.55754, -4, 1, 1.5, 0.5, 0.5,
-3.469989, -4.55754, -4, 0, 1.5, 0.5, 0.5,
-3.469989, -4.55754, -2, 0, -0.5, 0.5, 0.5,
-3.469989, -4.55754, -2, 1, -0.5, 0.5, 0.5,
-3.469989, -4.55754, -2, 1, 1.5, 0.5, 0.5,
-3.469989, -4.55754, -2, 0, 1.5, 0.5, 0.5,
-3.469989, -4.55754, 0, 0, -0.5, 0.5, 0.5,
-3.469989, -4.55754, 0, 1, -0.5, 0.5, 0.5,
-3.469989, -4.55754, 0, 1, 1.5, 0.5, 0.5,
-3.469989, -4.55754, 0, 0, 1.5, 0.5, 0.5,
-3.469989, -4.55754, 2, 0, -0.5, 0.5, 0.5,
-3.469989, -4.55754, 2, 1, -0.5, 0.5, 0.5,
-3.469989, -4.55754, 2, 1, 1.5, 0.5, 0.5,
-3.469989, -4.55754, 2, 0, 1.5, 0.5, 0.5,
-3.469989, -4.55754, 4, 0, -0.5, 0.5, 0.5,
-3.469989, -4.55754, 4, 1, -0.5, 0.5, 0.5,
-3.469989, -4.55754, 4, 1, 1.5, 0.5, 0.5,
-3.469989, -4.55754, 4, 0, 1.5, 0.5, 0.5
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
-3.006262, -3.96894, -5.010583,
-3.006262, 3.879067, -5.010583,
-3.006262, -3.96894, 5.111992,
-3.006262, 3.879067, 5.111992,
-3.006262, -3.96894, -5.010583,
-3.006262, -3.96894, 5.111992,
-3.006262, 3.879067, -5.010583,
-3.006262, 3.879067, 5.111992,
-3.006262, -3.96894, -5.010583,
3.176759, -3.96894, -5.010583,
-3.006262, -3.96894, 5.111992,
3.176759, -3.96894, 5.111992,
-3.006262, 3.879067, -5.010583,
3.176759, 3.879067, -5.010583,
-3.006262, 3.879067, 5.111992,
3.176759, 3.879067, 5.111992,
3.176759, -3.96894, -5.010583,
3.176759, 3.879067, -5.010583,
3.176759, -3.96894, 5.111992,
3.176759, 3.879067, 5.111992,
3.176759, -3.96894, -5.010583,
3.176759, -3.96894, 5.111992,
3.176759, 3.879067, -5.010583,
3.176759, 3.879067, 5.111992
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
var radius = 7.594689;
var distance = 33.78963;
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
mvMatrix.translate( -0.08524835, 0.04493642, -0.05070424 );
mvMatrix.scale( 1.328077, 1.04632, 0.8112092 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78963);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
bromuconazole<-read.table("bromuconazole.xyz")
```

```
## Error in read.table("bromuconazole.xyz"): no lines available in input
```

```r
x<-bromuconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromuconazole' not found
```

```r
y<-bromuconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromuconazole' not found
```

```r
z<-bromuconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromuconazole' not found
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
-2.916218, 0.1046759, -0.8332222, 0, 0, 1, 1, 1,
-2.662789, 0.5050222, -2.078237, 1, 0, 0, 1, 1,
-2.606858, 0.0533651, -1.834001, 1, 0, 0, 1, 1,
-2.601997, 1.083952, -0.8147481, 1, 0, 0, 1, 1,
-2.570564, -1.115784, -1.974756, 1, 0, 0, 1, 1,
-2.412952, 0.6104553, -1.969769, 1, 0, 0, 1, 1,
-2.366679, -0.6891744, -1.403858, 0, 0, 0, 1, 1,
-2.352364, 0.7848095, -0.7197241, 0, 0, 0, 1, 1,
-2.300317, -1.334243, -0.8260064, 0, 0, 0, 1, 1,
-2.289728, 0.2283965, -2.755033, 0, 0, 0, 1, 1,
-2.282357, 1.945518, 1.348828, 0, 0, 0, 1, 1,
-2.268543, 0.4425166, -2.105881, 0, 0, 0, 1, 1,
-2.183952, 0.6391917, -0.9636886, 0, 0, 0, 1, 1,
-2.176114, 0.3277334, -2.231337, 1, 1, 1, 1, 1,
-2.158547, -0.7031827, -1.31748, 1, 1, 1, 1, 1,
-2.146861, -1.373983, -0.8849034, 1, 1, 1, 1, 1,
-2.140668, -0.2242372, -2.91292, 1, 1, 1, 1, 1,
-2.116813, 0.2147249, -0.7716137, 1, 1, 1, 1, 1,
-2.098639, -0.9175043, -2.032687, 1, 1, 1, 1, 1,
-2.030455, 0.6487324, -3.215658, 1, 1, 1, 1, 1,
-1.993581, -0.6627027, -1.389497, 1, 1, 1, 1, 1,
-1.98728, -0.2175785, -1.686212, 1, 1, 1, 1, 1,
-1.948726, 1.173016, -1.66804, 1, 1, 1, 1, 1,
-1.873982, -1.142985, -2.959933, 1, 1, 1, 1, 1,
-1.870719, -2.208922, -2.144511, 1, 1, 1, 1, 1,
-1.860653, 1.055675, -0.9084576, 1, 1, 1, 1, 1,
-1.832046, -1.598547, -1.740743, 1, 1, 1, 1, 1,
-1.831901, 0.1157938, -1.490838, 1, 1, 1, 1, 1,
-1.812261, -0.2204231, 0.238289, 0, 0, 1, 1, 1,
-1.808449, 0.2623029, -2.64443, 1, 0, 0, 1, 1,
-1.802947, -1.857984, -1.68815, 1, 0, 0, 1, 1,
-1.769969, -1.963917, -1.645531, 1, 0, 0, 1, 1,
-1.751372, -1.147152, -2.196548, 1, 0, 0, 1, 1,
-1.749903, 0.09976501, -2.131902, 1, 0, 0, 1, 1,
-1.742664, -2.095234, -2.368356, 0, 0, 0, 1, 1,
-1.73429, -0.5909669, -4.134358, 0, 0, 0, 1, 1,
-1.7132, 2.174485, -0.8670457, 0, 0, 0, 1, 1,
-1.683062, -0.09799621, -1.790118, 0, 0, 0, 1, 1,
-1.680033, -0.2921978, -0.8131489, 0, 0, 0, 1, 1,
-1.671383, 1.824269, -0.3511184, 0, 0, 0, 1, 1,
-1.663162, 0.3425235, -1.209209, 0, 0, 0, 1, 1,
-1.655753, 0.6053488, -0.9876685, 1, 1, 1, 1, 1,
-1.652185, -0.2238763, -1.978594, 1, 1, 1, 1, 1,
-1.626553, 0.1577589, -0.7829834, 1, 1, 1, 1, 1,
-1.59864, 1.077365, 0.8455275, 1, 1, 1, 1, 1,
-1.59529, 1.120029, -0.7352345, 1, 1, 1, 1, 1,
-1.590575, -0.374563, -0.2166678, 1, 1, 1, 1, 1,
-1.558075, -1.54349, -1.551186, 1, 1, 1, 1, 1,
-1.555512, 0.6252761, 0.2553295, 1, 1, 1, 1, 1,
-1.55488, -2.201355, -2.678631, 1, 1, 1, 1, 1,
-1.547642, 0.1326229, -0.4473022, 1, 1, 1, 1, 1,
-1.533626, 0.7877214, -1.909653, 1, 1, 1, 1, 1,
-1.533123, -0.05866083, -1.186375, 1, 1, 1, 1, 1,
-1.525379, -0.1907632, -1.98722, 1, 1, 1, 1, 1,
-1.513087, 0.3849772, -0.8115404, 1, 1, 1, 1, 1,
-1.4924, 1.471065, -0.7679171, 1, 1, 1, 1, 1,
-1.487442, -0.9611088, -1.043545, 0, 0, 1, 1, 1,
-1.481392, 1.080793, -1.145947, 1, 0, 0, 1, 1,
-1.473086, 1.135609, -2.039021, 1, 0, 0, 1, 1,
-1.468787, 0.3815586, -0.7759254, 1, 0, 0, 1, 1,
-1.464197, -0.6098339, -1.84702, 1, 0, 0, 1, 1,
-1.463622, -0.9051027, -3.84529, 1, 0, 0, 1, 1,
-1.456852, 0.5367082, 0.1750233, 0, 0, 0, 1, 1,
-1.449628, 0.6475445, -0.5776445, 0, 0, 0, 1, 1,
-1.447823, -1.324549, -1.133984, 0, 0, 0, 1, 1,
-1.444863, 2.446675, 0.4863177, 0, 0, 0, 1, 1,
-1.442376, -0.4962477, -2.253205, 0, 0, 0, 1, 1,
-1.438662, 1.292104, -1.693117, 0, 0, 0, 1, 1,
-1.43564, -0.8419837, -1.324243, 0, 0, 0, 1, 1,
-1.431171, -0.2742831, -1.612465, 1, 1, 1, 1, 1,
-1.430585, 1.832758, 1.681694, 1, 1, 1, 1, 1,
-1.409163, -1.079446, -3.90823, 1, 1, 1, 1, 1,
-1.408974, -1.044324, -1.947106, 1, 1, 1, 1, 1,
-1.401519, -1.844082, -3.467435, 1, 1, 1, 1, 1,
-1.398225, 0.7338104, 0.2806941, 1, 1, 1, 1, 1,
-1.388141, 0.1879468, -1.243818, 1, 1, 1, 1, 1,
-1.387743, -1.430575, -1.587478, 1, 1, 1, 1, 1,
-1.377672, -1.479888, -4.000504, 1, 1, 1, 1, 1,
-1.36615, -0.2759527, -1.789723, 1, 1, 1, 1, 1,
-1.365204, -1.496987, -2.017127, 1, 1, 1, 1, 1,
-1.36442, -1.60389, -1.746328, 1, 1, 1, 1, 1,
-1.361586, 0.9757124, -0.1369388, 1, 1, 1, 1, 1,
-1.361007, 2.442386, -0.6205124, 1, 1, 1, 1, 1,
-1.350598, -2.036799, -2.432569, 1, 1, 1, 1, 1,
-1.336732, -0.7537074, -2.253626, 0, 0, 1, 1, 1,
-1.302955, -0.2385409, -0.2112105, 1, 0, 0, 1, 1,
-1.300401, 0.5453347, -2.315414, 1, 0, 0, 1, 1,
-1.299309, 0.1757728, -1.151632, 1, 0, 0, 1, 1,
-1.297929, 0.7052298, -0.9160323, 1, 0, 0, 1, 1,
-1.294946, -0.169684, -1.975426, 1, 0, 0, 1, 1,
-1.293856, -0.5824834, -2.886814, 0, 0, 0, 1, 1,
-1.291802, -0.4488555, 0.9162051, 0, 0, 0, 1, 1,
-1.28994, 0.8170015, -1.70531, 0, 0, 0, 1, 1,
-1.287219, -0.5586149, -2.714903, 0, 0, 0, 1, 1,
-1.285393, -0.4344846, -1.645236, 0, 0, 0, 1, 1,
-1.281112, 1.286699, -2.762278, 0, 0, 0, 1, 1,
-1.274048, 0.5198385, -0.3695574, 0, 0, 0, 1, 1,
-1.269529, -2.774199, -1.861311, 1, 1, 1, 1, 1,
-1.257074, -0.3639202, -1.695048, 1, 1, 1, 1, 1,
-1.253862, -0.2553057, -2.354751, 1, 1, 1, 1, 1,
-1.25112, 0.433367, -1.398536, 1, 1, 1, 1, 1,
-1.249509, -1.384084, -3.178146, 1, 1, 1, 1, 1,
-1.247277, -0.2464297, -0.9231231, 1, 1, 1, 1, 1,
-1.234905, 0.4088058, -1.864228, 1, 1, 1, 1, 1,
-1.226981, -0.9655137, -3.111301, 1, 1, 1, 1, 1,
-1.224651, 0.81445, 1.034702, 1, 1, 1, 1, 1,
-1.22414, -0.004587336, -1.409103, 1, 1, 1, 1, 1,
-1.221522, -0.08994818, -2.596022, 1, 1, 1, 1, 1,
-1.20861, -0.5635354, -1.221531, 1, 1, 1, 1, 1,
-1.206696, -0.4892056, -3.148036, 1, 1, 1, 1, 1,
-1.206477, 0.01333131, -1.946998, 1, 1, 1, 1, 1,
-1.196144, -2.508284, -3.883587, 1, 1, 1, 1, 1,
-1.189069, 0.8203644, -2.988563, 0, 0, 1, 1, 1,
-1.187189, -1.271515, -1.633806, 1, 0, 0, 1, 1,
-1.186225, -0.3805816, -2.892473, 1, 0, 0, 1, 1,
-1.184811, 0.01452578, -2.247568, 1, 0, 0, 1, 1,
-1.184676, 0.3895835, -2.291392, 1, 0, 0, 1, 1,
-1.178703, 1.075278, -1.038549, 1, 0, 0, 1, 1,
-1.174063, -1.282218, -2.38371, 0, 0, 0, 1, 1,
-1.173528, 0.5518058, -0.7973156, 0, 0, 0, 1, 1,
-1.168857, 3.764776, 0.6183575, 0, 0, 0, 1, 1,
-1.167587, 1.740011, -0.7030638, 0, 0, 0, 1, 1,
-1.160031, 0.6948629, -1.40477, 0, 0, 0, 1, 1,
-1.152485, -0.3804956, -2.036027, 0, 0, 0, 1, 1,
-1.135676, 0.7474615, -1.476185, 0, 0, 0, 1, 1,
-1.132271, -0.2720091, -1.287015, 1, 1, 1, 1, 1,
-1.129738, 1.767602, -0.41479, 1, 1, 1, 1, 1,
-1.12913, -1.192138, -2.636603, 1, 1, 1, 1, 1,
-1.126729, 1.343115, -3.185794, 1, 1, 1, 1, 1,
-1.114878, -0.7105872, -1.223016, 1, 1, 1, 1, 1,
-1.114758, -0.2697281, -2.110604, 1, 1, 1, 1, 1,
-1.110825, -0.1124716, -3.714249, 1, 1, 1, 1, 1,
-1.110263, -1.897684, -2.600057, 1, 1, 1, 1, 1,
-1.11003, -0.06511138, -1.805185, 1, 1, 1, 1, 1,
-1.104577, -0.9850379, -3.374973, 1, 1, 1, 1, 1,
-1.101226, 0.2967494, -1.491969, 1, 1, 1, 1, 1,
-1.097762, 0.9802226, -1.603714, 1, 1, 1, 1, 1,
-1.09682, -0.08579449, -2.56208, 1, 1, 1, 1, 1,
-1.09512, -0.5189405, 0.1465818, 1, 1, 1, 1, 1,
-1.092901, 3.075043, -1.046305, 1, 1, 1, 1, 1,
-1.092878, 1.154532, -2.340262, 0, 0, 1, 1, 1,
-1.09099, -1.175434, -0.6827469, 1, 0, 0, 1, 1,
-1.088085, 0.5189512, -1.569158, 1, 0, 0, 1, 1,
-1.080651, 0.942422, -0.05783859, 1, 0, 0, 1, 1,
-1.076903, 0.2530654, -1.466132, 1, 0, 0, 1, 1,
-1.076507, -0.5957976, -1.407611, 1, 0, 0, 1, 1,
-1.071758, 1.555464, -1.594488, 0, 0, 0, 1, 1,
-1.069054, 1.440768, -3.127056, 0, 0, 0, 1, 1,
-1.066491, 0.1877148, -1.318294, 0, 0, 0, 1, 1,
-1.046958, 2.692853, 0.4743189, 0, 0, 0, 1, 1,
-1.045639, 0.9792531, -1.15974, 0, 0, 0, 1, 1,
-1.034072, 0.7485511, -0.4859745, 0, 0, 0, 1, 1,
-1.033613, 0.02238415, -1.801116, 0, 0, 0, 1, 1,
-1.031254, 0.4178971, 0.8526098, 1, 1, 1, 1, 1,
-1.029575, -1.995574, -3.350713, 1, 1, 1, 1, 1,
-1.029063, -0.4185812, -2.052401, 1, 1, 1, 1, 1,
-1.028412, -0.691045, -0.9971249, 1, 1, 1, 1, 1,
-1.027773, 0.8233709, -2.510418, 1, 1, 1, 1, 1,
-1.027327, 2.188758, -0.9668071, 1, 1, 1, 1, 1,
-1.027141, 1.093934, -1.109439, 1, 1, 1, 1, 1,
-1.024405, -1.0323, -2.033157, 1, 1, 1, 1, 1,
-1.015769, -0.1353171, -2.947639, 1, 1, 1, 1, 1,
-1.006998, -0.6881732, -1.802817, 1, 1, 1, 1, 1,
-0.9993317, -0.9034072, -2.617108, 1, 1, 1, 1, 1,
-0.9983777, -0.3099491, -2.617095, 1, 1, 1, 1, 1,
-0.9913567, -0.2964336, -3.469317, 1, 1, 1, 1, 1,
-0.9906386, 1.007063, 0.1489642, 1, 1, 1, 1, 1,
-0.9742584, -1.140449, -3.540034, 1, 1, 1, 1, 1,
-0.9710196, 1.526231, -1.68573, 0, 0, 1, 1, 1,
-0.9677056, -0.7939684, -1.991437, 1, 0, 0, 1, 1,
-0.9669288, 2.277667, -1.188728, 1, 0, 0, 1, 1,
-0.9629668, 0.8655142, -0.1500284, 1, 0, 0, 1, 1,
-0.9580945, 0.8543664, -1.030305, 1, 0, 0, 1, 1,
-0.9554595, 0.6929442, -1.263721, 1, 0, 0, 1, 1,
-0.9502351, 1.87936, -0.1344199, 0, 0, 0, 1, 1,
-0.9474666, -1.203001, -3.066171, 0, 0, 0, 1, 1,
-0.9414509, -0.9313341, -2.800278, 0, 0, 0, 1, 1,
-0.9412189, 0.5007046, -0.7187864, 0, 0, 0, 1, 1,
-0.9406151, 0.9866924, -0.4456044, 0, 0, 0, 1, 1,
-0.9311934, 1.109372, -1.168413, 0, 0, 0, 1, 1,
-0.9291335, 1.148332, -0.9645483, 0, 0, 0, 1, 1,
-0.9240065, -0.9433394, -1.331212, 1, 1, 1, 1, 1,
-0.9220147, 1.230365, -1.842389, 1, 1, 1, 1, 1,
-0.9120913, -0.5297117, -0.5852038, 1, 1, 1, 1, 1,
-0.9116552, -0.07548197, -3.260763, 1, 1, 1, 1, 1,
-0.9077461, -0.1440229, -2.627571, 1, 1, 1, 1, 1,
-0.8994383, 0.05538986, -4.005037, 1, 1, 1, 1, 1,
-0.8937046, -3.854648, -4.687187, 1, 1, 1, 1, 1,
-0.8923026, 0.3290139, -0.6228335, 1, 1, 1, 1, 1,
-0.887264, 1.517888, -0.8871582, 1, 1, 1, 1, 1,
-0.8695043, -0.4336278, -3.199536, 1, 1, 1, 1, 1,
-0.8677382, 0.1027061, -0.3834245, 1, 1, 1, 1, 1,
-0.860267, -0.1416999, -2.165041, 1, 1, 1, 1, 1,
-0.8586208, 0.8909, -0.7920404, 1, 1, 1, 1, 1,
-0.8573185, -1.346639, -4.825319, 1, 1, 1, 1, 1,
-0.8560495, 2.277345, 0.6612929, 1, 1, 1, 1, 1,
-0.8305004, 0.04421006, 0.1909885, 0, 0, 1, 1, 1,
-0.8294262, -0.9653984, -2.315353, 1, 0, 0, 1, 1,
-0.8193056, 1.540327, -0.1320429, 1, 0, 0, 1, 1,
-0.8162714, 0.1806081, -0.8147674, 1, 0, 0, 1, 1,
-0.8146455, 0.491871, -1.707251, 1, 0, 0, 1, 1,
-0.8141955, -0.009598016, -0.5364586, 1, 0, 0, 1, 1,
-0.8111655, -0.4296348, -3.041804, 0, 0, 0, 1, 1,
-0.8076733, -0.2095704, -0.5927076, 0, 0, 0, 1, 1,
-0.804471, -0.4574834, -2.105578, 0, 0, 0, 1, 1,
-0.8024174, -1.63175, -1.822792, 0, 0, 0, 1, 1,
-0.8013979, -0.1975262, -1.805238, 0, 0, 0, 1, 1,
-0.7986383, -0.6174828, -2.095862, 0, 0, 0, 1, 1,
-0.7981335, -0.7511907, -4.021599, 0, 0, 0, 1, 1,
-0.797973, 0.0480984, -1.950811, 1, 1, 1, 1, 1,
-0.7909089, 0.4938207, -1.362838, 1, 1, 1, 1, 1,
-0.786052, -1.140586, -2.852792, 1, 1, 1, 1, 1,
-0.7729048, -0.9362086, -2.722629, 1, 1, 1, 1, 1,
-0.7711134, -1.066877, -1.450558, 1, 1, 1, 1, 1,
-0.7691811, 1.248485, 0.4688915, 1, 1, 1, 1, 1,
-0.7602016, -0.4079391, -2.372393, 1, 1, 1, 1, 1,
-0.7529958, 1.597554, 0.2825854, 1, 1, 1, 1, 1,
-0.7496315, -0.6675305, -2.34515, 1, 1, 1, 1, 1,
-0.7496099, 0.5310112, -1.003843, 1, 1, 1, 1, 1,
-0.7468105, -0.4962928, -3.335126, 1, 1, 1, 1, 1,
-0.7455449, -1.359088, -3.75872, 1, 1, 1, 1, 1,
-0.7441695, 0.3323678, 0.1173433, 1, 1, 1, 1, 1,
-0.7424067, -1.118011, -2.446704, 1, 1, 1, 1, 1,
-0.7418137, 0.9198122, -1.219077, 1, 1, 1, 1, 1,
-0.7407736, -0.2672975, -2.307339, 0, 0, 1, 1, 1,
-0.7355654, 1.564249, 0.2096903, 1, 0, 0, 1, 1,
-0.7308605, -0.9670405, -3.476629, 1, 0, 0, 1, 1,
-0.7292089, -0.9322219, -4.139979, 1, 0, 0, 1, 1,
-0.7284119, 0.04681231, -2.162961, 1, 0, 0, 1, 1,
-0.7235015, -0.7363552, -2.930524, 1, 0, 0, 1, 1,
-0.722369, -0.06159775, -3.613474, 0, 0, 0, 1, 1,
-0.7211633, 0.9246081, -1.285605, 0, 0, 0, 1, 1,
-0.7209158, 1.54739, 0.08808037, 0, 0, 0, 1, 1,
-0.7204747, -1.510306, -3.704138, 0, 0, 0, 1, 1,
-0.7157153, -0.01082601, -2.298727, 0, 0, 0, 1, 1,
-0.7136657, 1.012015, 0.4793628, 0, 0, 0, 1, 1,
-0.7063111, -2.466921, -3.455465, 0, 0, 0, 1, 1,
-0.7019953, 0.2891146, -1.700028, 1, 1, 1, 1, 1,
-0.7016475, 0.7538903, -0.7835301, 1, 1, 1, 1, 1,
-0.7013668, -0.9460598, -2.44067, 1, 1, 1, 1, 1,
-0.698124, 0.3515855, -1.069239, 1, 1, 1, 1, 1,
-0.6981044, 0.2205049, -1.438006, 1, 1, 1, 1, 1,
-0.6772377, -0.5013979, -1.789354, 1, 1, 1, 1, 1,
-0.6759138, -1.030494, -1.606533, 1, 1, 1, 1, 1,
-0.6578487, -0.6214718, -1.967891, 1, 1, 1, 1, 1,
-0.6559531, 0.04273771, -3.184169, 1, 1, 1, 1, 1,
-0.6555305, -1.544904, -3.450474, 1, 1, 1, 1, 1,
-0.6502285, -2.183771, -3.693796, 1, 1, 1, 1, 1,
-0.6492026, -0.8062, -3.986006, 1, 1, 1, 1, 1,
-0.6427327, -0.2979116, -1.50771, 1, 1, 1, 1, 1,
-0.6426355, -0.2595344, -1.937229, 1, 1, 1, 1, 1,
-0.6396076, -0.2530392, -1.972838, 1, 1, 1, 1, 1,
-0.6373434, 0.6521745, -0.9789017, 0, 0, 1, 1, 1,
-0.6338693, 0.06815938, -2.815269, 1, 0, 0, 1, 1,
-0.6330702, 0.05967296, -0.1265065, 1, 0, 0, 1, 1,
-0.6315463, 2.559767, -0.3906248, 1, 0, 0, 1, 1,
-0.6283697, 1.226527, 1.643481, 1, 0, 0, 1, 1,
-0.6283334, 0.8021455, -1.469776, 1, 0, 0, 1, 1,
-0.6237073, 0.1949894, -1.117155, 0, 0, 0, 1, 1,
-0.6134538, -0.003302389, -0.8192209, 0, 0, 0, 1, 1,
-0.6133847, 0.5275667, -2.728702, 0, 0, 0, 1, 1,
-0.6078724, 2.031683, -1.443898, 0, 0, 0, 1, 1,
-0.6031256, 0.01586874, -1.83138, 0, 0, 0, 1, 1,
-0.6020424, -0.4837979, -2.668916, 0, 0, 0, 1, 1,
-0.5995114, -0.3543253, -0.3702203, 0, 0, 0, 1, 1,
-0.5994047, 2.068885, -2.304488, 1, 1, 1, 1, 1,
-0.5978974, 0.6965936, -1.53898, 1, 1, 1, 1, 1,
-0.5923577, 1.141139, 1.325543, 1, 1, 1, 1, 1,
-0.589635, -1.005143, -0.9793268, 1, 1, 1, 1, 1,
-0.5841368, 0.7879592, -1.217168, 1, 1, 1, 1, 1,
-0.5809728, 1.141084, -2.36288, 1, 1, 1, 1, 1,
-0.5781751, -1.534042, -3.337534, 1, 1, 1, 1, 1,
-0.5776525, 0.7240204, -1.825879, 1, 1, 1, 1, 1,
-0.5713784, 0.9931823, -0.9677262, 1, 1, 1, 1, 1,
-0.5704794, -0.398205, -0.741003, 1, 1, 1, 1, 1,
-0.5652508, 0.8828326, -1.200101, 1, 1, 1, 1, 1,
-0.565193, -2.349236, -3.092326, 1, 1, 1, 1, 1,
-0.5623153, 2.090952, -0.05901841, 1, 1, 1, 1, 1,
-0.5611656, -0.1864163, -1.542745, 1, 1, 1, 1, 1,
-0.5607163, 0.8419916, 0.2619127, 1, 1, 1, 1, 1,
-0.5601497, -0.6972641, -2.098224, 0, 0, 1, 1, 1,
-0.5597086, -0.2829264, -2.061962, 1, 0, 0, 1, 1,
-0.5594312, 3.343876, -1.22148, 1, 0, 0, 1, 1,
-0.5549086, -1.004538, -3.419972, 1, 0, 0, 1, 1,
-0.5532859, -0.4832679, -1.277002, 1, 0, 0, 1, 1,
-0.5507158, -1.551623, -3.268591, 1, 0, 0, 1, 1,
-0.5503442, 0.09232362, -0.9114254, 0, 0, 0, 1, 1,
-0.5465017, -0.3651486, -2.701493, 0, 0, 0, 1, 1,
-0.5453578, -2.398046, -3.159164, 0, 0, 0, 1, 1,
-0.5402219, 0.4432943, -0.4738874, 0, 0, 0, 1, 1,
-0.5388522, 1.277577, 1.206587, 0, 0, 0, 1, 1,
-0.538605, 1.408838, -0.4286524, 0, 0, 0, 1, 1,
-0.5377243, 0.04500777, -0.4462211, 0, 0, 0, 1, 1,
-0.5351643, -0.6539306, -0.5723666, 1, 1, 1, 1, 1,
-0.5322063, 1.722662, -0.3751424, 1, 1, 1, 1, 1,
-0.5321489, -2.337794, -3.392496, 1, 1, 1, 1, 1,
-0.5227695, 0.9527444, -2.058494, 1, 1, 1, 1, 1,
-0.5178449, -0.7167615, -3.95338, 1, 1, 1, 1, 1,
-0.5161069, 1.885805, 1.609643, 1, 1, 1, 1, 1,
-0.5159922, -0.6352559, -3.374093, 1, 1, 1, 1, 1,
-0.5151311, 0.7728431, -1.29782, 1, 1, 1, 1, 1,
-0.505187, -1.068555, -2.162851, 1, 1, 1, 1, 1,
-0.5014312, -0.08247031, -3.209878, 1, 1, 1, 1, 1,
-0.4984204, 0.6570068, 0.6308407, 1, 1, 1, 1, 1,
-0.4982482, 0.197688, 1.01394, 1, 1, 1, 1, 1,
-0.4955893, 0.8265475, 0.01867444, 1, 1, 1, 1, 1,
-0.495581, 0.2960059, -1.011535, 1, 1, 1, 1, 1,
-0.4916889, 0.7731779, 2.138763, 1, 1, 1, 1, 1,
-0.4873674, -1.149407, -4.352249, 0, 0, 1, 1, 1,
-0.4818442, -0.2733854, -0.3823318, 1, 0, 0, 1, 1,
-0.4798623, -0.3955297, -3.072453, 1, 0, 0, 1, 1,
-0.4794772, 0.2257531, -0.7042442, 1, 0, 0, 1, 1,
-0.4778373, 0.169075, -1.753544, 1, 0, 0, 1, 1,
-0.4763722, 1.959191, -1.191973, 1, 0, 0, 1, 1,
-0.4653519, -1.979572, -3.50553, 0, 0, 0, 1, 1,
-0.4650506, -1.135825, -2.861242, 0, 0, 0, 1, 1,
-0.4642476, 0.8629422, -2.133158, 0, 0, 0, 1, 1,
-0.4639207, 0.919668, -0.5895276, 0, 0, 0, 1, 1,
-0.4620501, 0.0006810891, -2.16609, 0, 0, 0, 1, 1,
-0.4545875, 0.1314239, -1.762071, 0, 0, 0, 1, 1,
-0.4542542, -1.265395, -2.752453, 0, 0, 0, 1, 1,
-0.4535733, 0.06175701, -2.072191, 1, 1, 1, 1, 1,
-0.4480565, 0.967301, -1.433634, 1, 1, 1, 1, 1,
-0.4464595, 1.950575, -1.056672, 1, 1, 1, 1, 1,
-0.445998, 0.4639279, 0.3603694, 1, 1, 1, 1, 1,
-0.4457875, -2.472205, -1.005051, 1, 1, 1, 1, 1,
-0.4444472, -0.8127399, -3.827167, 1, 1, 1, 1, 1,
-0.4438227, -0.2272378, -1.060451, 1, 1, 1, 1, 1,
-0.4393384, 0.270874, -0.4549092, 1, 1, 1, 1, 1,
-0.4389443, -0.3763325, -0.7014642, 1, 1, 1, 1, 1,
-0.4388666, 1.07726, -1.205415, 1, 1, 1, 1, 1,
-0.4318374, 0.6539457, -1.061155, 1, 1, 1, 1, 1,
-0.4301668, 2.267554, 0.8725243, 1, 1, 1, 1, 1,
-0.4214967, -0.8606991, -3.518978, 1, 1, 1, 1, 1,
-0.4180934, -0.4069887, -1.932514, 1, 1, 1, 1, 1,
-0.4177811, 2.507627, 0.9410997, 1, 1, 1, 1, 1,
-0.4147191, 0.00938572, -1.742716, 0, 0, 1, 1, 1,
-0.408368, 1.338084, 0.6220782, 1, 0, 0, 1, 1,
-0.4080036, 1.118602, 0.2056318, 1, 0, 0, 1, 1,
-0.3990001, 1.311181, -1.536753, 1, 0, 0, 1, 1,
-0.3968119, 0.3047383, 1.87619, 1, 0, 0, 1, 1,
-0.3958203, 0.9954453, -1.104985, 1, 0, 0, 1, 1,
-0.3912207, -0.6364775, -3.751314, 0, 0, 0, 1, 1,
-0.3887839, 0.003857197, 1.529307, 0, 0, 0, 1, 1,
-0.3840749, 1.496705, 0.6598319, 0, 0, 0, 1, 1,
-0.3795251, 0.08006452, -0.7091267, 0, 0, 0, 1, 1,
-0.3792126, -0.05751873, -1.298034, 0, 0, 0, 1, 1,
-0.3734363, 1.111499, 0.8339304, 0, 0, 0, 1, 1,
-0.3692304, -0.3449671, -1.163069, 0, 0, 0, 1, 1,
-0.3689249, 0.002720376, -2.088411, 1, 1, 1, 1, 1,
-0.3653799, 0.4857033, -0.2307713, 1, 1, 1, 1, 1,
-0.3564884, -0.8205875, -0.9936248, 1, 1, 1, 1, 1,
-0.3564439, -0.7333177, -2.482216, 1, 1, 1, 1, 1,
-0.3534252, -0.01513025, -2.075397, 1, 1, 1, 1, 1,
-0.3471882, 0.2598198, 0.8623771, 1, 1, 1, 1, 1,
-0.3428366, 0.5948054, 0.4579987, 1, 1, 1, 1, 1,
-0.3419361, -0.254251, -1.524661, 1, 1, 1, 1, 1,
-0.3398639, -0.08079421, -0.5424299, 1, 1, 1, 1, 1,
-0.3376827, 3.026645, 0.7490136, 1, 1, 1, 1, 1,
-0.3370047, 0.3549333, -1.72357, 1, 1, 1, 1, 1,
-0.332735, -0.4335106, -1.813601, 1, 1, 1, 1, 1,
-0.3313352, -1.150449, -4.458686, 1, 1, 1, 1, 1,
-0.3312846, -0.6138051, -2.66472, 1, 1, 1, 1, 1,
-0.3211386, -0.06151627, -1.69831, 1, 1, 1, 1, 1,
-0.3123025, -0.3481283, -2.275729, 0, 0, 1, 1, 1,
-0.308318, -0.5043992, -2.978523, 1, 0, 0, 1, 1,
-0.3082056, -0.4305371, -1.277367, 1, 0, 0, 1, 1,
-0.3079996, -0.8542736, -2.247617, 1, 0, 0, 1, 1,
-0.3073244, -1.103521, -3.082804, 1, 0, 0, 1, 1,
-0.3066711, -1.208123, -2.872703, 1, 0, 0, 1, 1,
-0.3062068, -1.341728, -2.285118, 0, 0, 0, 1, 1,
-0.3053541, -0.7104863, -4.096462, 0, 0, 0, 1, 1,
-0.3053088, 0.3662696, -1.791989, 0, 0, 0, 1, 1,
-0.3039648, -1.596651, -2.731792, 0, 0, 0, 1, 1,
-0.3027514, 0.6957157, -0.317342, 0, 0, 0, 1, 1,
-0.3010095, 0.156978, -2.27566, 0, 0, 0, 1, 1,
-0.2993042, 1.381794, -0.4001569, 0, 0, 0, 1, 1,
-0.290704, -0.6484468, -3.453807, 1, 1, 1, 1, 1,
-0.2862539, 0.03753386, -2.049124, 1, 1, 1, 1, 1,
-0.2856714, 1.118465, -0.913781, 1, 1, 1, 1, 1,
-0.2837519, 0.9449174, 0.1916395, 1, 1, 1, 1, 1,
-0.283535, 1.211963, -1.645406, 1, 1, 1, 1, 1,
-0.2829855, -0.4425053, -2.519192, 1, 1, 1, 1, 1,
-0.2801661, -1.305268, 0.102397, 1, 1, 1, 1, 1,
-0.276221, -0.523348, -2.117903, 1, 1, 1, 1, 1,
-0.2752855, 0.08640419, -1.946702, 1, 1, 1, 1, 1,
-0.2725786, -0.7941083, -2.48938, 1, 1, 1, 1, 1,
-0.2711318, -0.8550866, -2.190005, 1, 1, 1, 1, 1,
-0.2690687, 0.2962303, -1.362544, 1, 1, 1, 1, 1,
-0.2662834, 0.3090477, -0.4985511, 1, 1, 1, 1, 1,
-0.2645122, -0.9856429, -3.116962, 1, 1, 1, 1, 1,
-0.2635756, 2.219354, -1.811131, 1, 1, 1, 1, 1,
-0.2623559, -0.7262551, -3.968247, 0, 0, 1, 1, 1,
-0.2612232, -0.008624045, -1.32445, 1, 0, 0, 1, 1,
-0.2567956, 0.03524015, -3.252638, 1, 0, 0, 1, 1,
-0.2496645, 0.7020406, -1.944587, 1, 0, 0, 1, 1,
-0.2380803, -0.4250099, -1.844123, 1, 0, 0, 1, 1,
-0.2301628, -2.173702, -3.35406, 1, 0, 0, 1, 1,
-0.2244466, -1.135687, -4.265698, 0, 0, 0, 1, 1,
-0.2232989, 0.02303808, -1.269718, 0, 0, 0, 1, 1,
-0.2127939, 0.850531, 1.326637, 0, 0, 0, 1, 1,
-0.212414, -0.1150468, -1.572031, 0, 0, 0, 1, 1,
-0.2104635, -2.935058, -2.984926, 0, 0, 0, 1, 1,
-0.2091206, -2.082324, -2.83589, 0, 0, 0, 1, 1,
-0.2088818, 1.322678, 0.2401706, 0, 0, 0, 1, 1,
-0.2076274, 0.5122284, 0.316778, 1, 1, 1, 1, 1,
-0.2059975, 2.188479, -1.889738, 1, 1, 1, 1, 1,
-0.2052045, -0.1365675, -0.1430524, 1, 1, 1, 1, 1,
-0.2040215, 0.7534877, -0.7150792, 1, 1, 1, 1, 1,
-0.1988021, 1.27128, -0.6862583, 1, 1, 1, 1, 1,
-0.1960769, 1.913378, 0.7787154, 1, 1, 1, 1, 1,
-0.194354, -1.549047, -3.152919, 1, 1, 1, 1, 1,
-0.1913418, -0.5742661, -2.867916, 1, 1, 1, 1, 1,
-0.1897213, -1.01757, -2.772918, 1, 1, 1, 1, 1,
-0.1891988, 0.3682161, -1.514133, 1, 1, 1, 1, 1,
-0.1860017, 1.353407, 0.3599936, 1, 1, 1, 1, 1,
-0.1859034, -0.4810582, -1.355413, 1, 1, 1, 1, 1,
-0.1839807, -0.3513361, -2.847156, 1, 1, 1, 1, 1,
-0.1821422, 0.1077916, -0.309285, 1, 1, 1, 1, 1,
-0.1821278, 0.3600479, 0.03644064, 1, 1, 1, 1, 1,
-0.1757842, -1.07382, -1.96474, 0, 0, 1, 1, 1,
-0.1740316, -1.833784, -3.735321, 1, 0, 0, 1, 1,
-0.1717964, 1.253718, -1.262197, 1, 0, 0, 1, 1,
-0.1702762, -1.041943, -2.180659, 1, 0, 0, 1, 1,
-0.1682974, 0.5118474, -0.3877974, 1, 0, 0, 1, 1,
-0.1681245, -1.996282, -3.442162, 1, 0, 0, 1, 1,
-0.1668131, 0.4287404, 0.7335798, 0, 0, 0, 1, 1,
-0.1648466, -0.6685389, -2.685661, 0, 0, 0, 1, 1,
-0.1628436, -1.241271, -2.577809, 0, 0, 0, 1, 1,
-0.1622851, -1.017391, -2.558194, 0, 0, 0, 1, 1,
-0.1607159, 1.08183, -0.02823478, 0, 0, 0, 1, 1,
-0.1603276, -0.9130581, -2.288907, 0, 0, 0, 1, 1,
-0.1594969, 0.4541249, -0.4202034, 0, 0, 0, 1, 1,
-0.1569221, 0.5815758, -0.4200838, 1, 1, 1, 1, 1,
-0.153196, 0.03209116, 0.478582, 1, 1, 1, 1, 1,
-0.1432427, -0.6622642, -2.061769, 1, 1, 1, 1, 1,
-0.1432063, 0.8570687, 0.2089075, 1, 1, 1, 1, 1,
-0.1394129, -0.179044, -1.881982, 1, 1, 1, 1, 1,
-0.1389334, -1.482411, -3.053864, 1, 1, 1, 1, 1,
-0.1376805, 0.671068, -0.5508835, 1, 1, 1, 1, 1,
-0.1366392, -1.712292, -4.268474, 1, 1, 1, 1, 1,
-0.1334992, 0.9573395, 0.07136246, 1, 1, 1, 1, 1,
-0.1330571, 1.066364, -0.8379009, 1, 1, 1, 1, 1,
-0.1326897, 0.68804, 0.9174436, 1, 1, 1, 1, 1,
-0.1315017, -1.545159, -4.738327, 1, 1, 1, 1, 1,
-0.1294898, -0.1338116, -2.887012, 1, 1, 1, 1, 1,
-0.1283056, 0.01821151, -1.547002, 1, 1, 1, 1, 1,
-0.1254495, -1.216271, -1.422253, 1, 1, 1, 1, 1,
-0.1216559, -0.6510831, -2.991787, 0, 0, 1, 1, 1,
-0.1191079, 0.9217613, 1.299217, 1, 0, 0, 1, 1,
-0.1129443, 1.019565, 0.6732718, 1, 0, 0, 1, 1,
-0.1099984, 1.315609, 0.9949713, 1, 0, 0, 1, 1,
-0.1089423, -1.150512, -1.540482, 1, 0, 0, 1, 1,
-0.1073985, 0.7652594, -0.3986889, 1, 0, 0, 1, 1,
-0.1018562, 0.6044948, -0.9200886, 0, 0, 0, 1, 1,
-0.1014675, -0.9658993, -4.100774, 0, 0, 0, 1, 1,
-0.1014646, -0.1891451, -1.893939, 0, 0, 0, 1, 1,
-0.09877583, 0.7627161, -1.343292, 0, 0, 0, 1, 1,
-0.09491677, -0.7451812, -3.023185, 0, 0, 0, 1, 1,
-0.08750797, -0.9153603, -3.957568, 0, 0, 0, 1, 1,
-0.08727769, 1.179775, -0.9126235, 0, 0, 0, 1, 1,
-0.08670968, -1.303493, -3.604995, 1, 1, 1, 1, 1,
-0.08269288, 2.701697, -0.6326572, 1, 1, 1, 1, 1,
-0.08243503, 0.7369117, -2.078781, 1, 1, 1, 1, 1,
-0.08065855, -0.7311158, -2.786514, 1, 1, 1, 1, 1,
-0.07775474, -1.381046, -3.446189, 1, 1, 1, 1, 1,
-0.07744063, 0.3635881, 0.8968916, 1, 1, 1, 1, 1,
-0.07541353, -0.6711625, -1.940805, 1, 1, 1, 1, 1,
-0.07429256, 0.1940062, -1.405974, 1, 1, 1, 1, 1,
-0.07309612, -1.650361, -2.181828, 1, 1, 1, 1, 1,
-0.07187224, 0.638064, -0.04655617, 1, 1, 1, 1, 1,
-0.06712308, -0.8597232, -4.61983, 1, 1, 1, 1, 1,
-0.06260546, 0.712526, 0.2179798, 1, 1, 1, 1, 1,
-0.06130321, 0.1227109, -0.6493052, 1, 1, 1, 1, 1,
-0.0598809, 2.289522, 0.3726156, 1, 1, 1, 1, 1,
-0.05868861, -0.4442328, -2.375243, 1, 1, 1, 1, 1,
-0.05615457, -1.409865, -2.474806, 0, 0, 1, 1, 1,
-0.05059981, -0.7490149, -4.172452, 1, 0, 0, 1, 1,
-0.05027363, -6.115373e-05, -1.200306, 1, 0, 0, 1, 1,
-0.04798887, -0.2745985, -2.744652, 1, 0, 0, 1, 1,
-0.04783141, -0.3094514, -3.535163, 1, 0, 0, 1, 1,
-0.04694008, 0.4270562, -0.008553988, 1, 0, 0, 1, 1,
-0.04506235, -0.5543439, -2.219425, 0, 0, 0, 1, 1,
-0.04436023, -0.592369, -1.767871, 0, 0, 0, 1, 1,
-0.04217002, 1.171364, -0.323281, 0, 0, 0, 1, 1,
-0.04202725, -0.2379754, -2.221518, 0, 0, 0, 1, 1,
-0.03853128, 0.9860715, -1.615196, 0, 0, 0, 1, 1,
-0.0346415, -0.5612306, -4.376728, 0, 0, 0, 1, 1,
-0.03443978, -0.05157563, 0.009507813, 0, 0, 0, 1, 1,
-0.03366949, 0.129797, -0.3888705, 1, 1, 1, 1, 1,
-0.03190294, -0.3801489, -1.551009, 1, 1, 1, 1, 1,
-0.02967718, 1.178051, 1.380997, 1, 1, 1, 1, 1,
-0.02913076, 0.1801925, 1.91341, 1, 1, 1, 1, 1,
-0.02886691, 0.2311225, 1.505871, 1, 1, 1, 1, 1,
-0.02826961, -0.6336432, -3.712002, 1, 1, 1, 1, 1,
-0.0280158, -0.002643962, -2.067049, 1, 1, 1, 1, 1,
-0.02380054, 0.639284, -0.1547747, 1, 1, 1, 1, 1,
-0.02222544, 1.27881, -0.2420726, 1, 1, 1, 1, 1,
-0.0145427, -0.1404911, -4.863167, 1, 1, 1, 1, 1,
-0.01393709, -2.645186, -2.877111, 1, 1, 1, 1, 1,
-0.01074518, 0.3838863, -0.6298126, 1, 1, 1, 1, 1,
-0.009254367, -0.4919258, -3.325009, 1, 1, 1, 1, 1,
-0.007958855, -0.5561873, -3.216053, 1, 1, 1, 1, 1,
-0.001689618, 0.117265, 0.07480926, 1, 1, 1, 1, 1,
-0.0006292406, 0.2674631, 1.040829, 0, 0, 1, 1, 1,
0.002735334, 0.01620328, -0.8200768, 1, 0, 0, 1, 1,
0.006841988, 0.3639279, -0.4791691, 1, 0, 0, 1, 1,
0.006948899, -1.801941, 2.059061, 1, 0, 0, 1, 1,
0.009674218, -1.636278, 3.731739, 1, 0, 0, 1, 1,
0.0105816, -0.87308, 2.884306, 1, 0, 0, 1, 1,
0.01408627, -0.2246875, 2.297891, 0, 0, 0, 1, 1,
0.01685786, 0.3858954, 0.1519669, 0, 0, 0, 1, 1,
0.02053113, -1.278674, 3.168188, 0, 0, 0, 1, 1,
0.0216915, 0.154715, 1.064436, 0, 0, 0, 1, 1,
0.02323965, 0.5580401, 0.6242214, 0, 0, 0, 1, 1,
0.02873977, 1.553545, 1.085753, 0, 0, 0, 1, 1,
0.03218506, -0.6066578, 2.26288, 0, 0, 0, 1, 1,
0.03299505, -0.7147051, 1.239611, 1, 1, 1, 1, 1,
0.03371538, -1.772265, 3.924484, 1, 1, 1, 1, 1,
0.03518817, 0.3170435, 0.8680027, 1, 1, 1, 1, 1,
0.03547456, 0.2251499, 0.2512477, 1, 1, 1, 1, 1,
0.03548099, 1.223163, -1.178232, 1, 1, 1, 1, 1,
0.03630535, 1.098696, -0.7260608, 1, 1, 1, 1, 1,
0.03722604, 0.3059933, -0.2035761, 1, 1, 1, 1, 1,
0.03810336, 0.4708475, 0.7350443, 1, 1, 1, 1, 1,
0.03888584, 1.689625, -0.4515888, 1, 1, 1, 1, 1,
0.03969773, -0.8599167, 2.654282, 1, 1, 1, 1, 1,
0.04119834, 1.02436, -1.510079, 1, 1, 1, 1, 1,
0.04158701, 0.7820514, 0.3354458, 1, 1, 1, 1, 1,
0.042996, 0.582334, 1.757264, 1, 1, 1, 1, 1,
0.04312161, 0.185696, -0.5674962, 1, 1, 1, 1, 1,
0.04472928, -0.763656, 4.085028, 1, 1, 1, 1, 1,
0.04524737, -0.3789865, 0.3393406, 0, 0, 1, 1, 1,
0.0478885, -1.062983, 2.855377, 1, 0, 0, 1, 1,
0.04899548, -0.6118599, 3.241706, 1, 0, 0, 1, 1,
0.05082997, 1.185962, -0.1014018, 1, 0, 0, 1, 1,
0.05566316, 0.01910341, 2.080465, 1, 0, 0, 1, 1,
0.06246772, -0.5279326, 2.633582, 1, 0, 0, 1, 1,
0.0628398, -0.6281382, 3.486864, 0, 0, 0, 1, 1,
0.0684178, -1.203015, 3.404564, 0, 0, 0, 1, 1,
0.07139625, 0.2574127, 1.020462, 0, 0, 0, 1, 1,
0.07377187, -1.778085, 1.523969, 0, 0, 0, 1, 1,
0.0750834, -0.2631696, 2.054985, 0, 0, 0, 1, 1,
0.07872681, 1.612247, 0.3991177, 0, 0, 0, 1, 1,
0.08570673, -2.872488, 1.354999, 0, 0, 0, 1, 1,
0.0875746, -0.04189031, 1.948069, 1, 1, 1, 1, 1,
0.09170046, 1.840017, 0.782657, 1, 1, 1, 1, 1,
0.09325007, -0.5377478, 3.890958, 1, 1, 1, 1, 1,
0.09474982, -0.5435486, 3.97675, 1, 1, 1, 1, 1,
0.09517429, -0.674535, 2.528094, 1, 1, 1, 1, 1,
0.0988543, -0.4151353, 3.664022, 1, 1, 1, 1, 1,
0.1003471, -0.4193183, 3.160682, 1, 1, 1, 1, 1,
0.1070479, -1.020374, 2.649858, 1, 1, 1, 1, 1,
0.1142823, 1.280612, 0.2234973, 1, 1, 1, 1, 1,
0.1157138, 1.146625, -0.4433535, 1, 1, 1, 1, 1,
0.1188672, -2.02106, 2.795225, 1, 1, 1, 1, 1,
0.1191843, -0.03676541, 2.221622, 1, 1, 1, 1, 1,
0.1212912, 0.001211251, 0.7953079, 1, 1, 1, 1, 1,
0.1214101, -1.026203, 2.147637, 1, 1, 1, 1, 1,
0.1262473, -0.1501696, 3.712126, 1, 1, 1, 1, 1,
0.1274449, -0.9225551, 2.346894, 0, 0, 1, 1, 1,
0.1282074, -0.02515372, 2.575989, 1, 0, 0, 1, 1,
0.1307573, -0.6010237, 2.110002, 1, 0, 0, 1, 1,
0.1326507, 2.075421, -1.829157, 1, 0, 0, 1, 1,
0.1350821, 0.8999857, -1.227347, 1, 0, 0, 1, 1,
0.1365013, 0.3536695, 1.158218, 1, 0, 0, 1, 1,
0.1367423, 0.5030063, -0.04325091, 0, 0, 0, 1, 1,
0.1389445, -0.6735787, 4.030825, 0, 0, 0, 1, 1,
0.1406404, 0.4831274, -1.59786, 0, 0, 0, 1, 1,
0.1411502, 1.886708, -0.3075694, 0, 0, 0, 1, 1,
0.1434588, -0.2815846, 2.624785, 0, 0, 0, 1, 1,
0.1454259, 0.1879723, 1.553058, 0, 0, 0, 1, 1,
0.1493213, 1.812588, 1.653623, 0, 0, 0, 1, 1,
0.1515173, 0.5884602, 0.5160685, 1, 1, 1, 1, 1,
0.1528535, -0.01471585, 2.611182, 1, 1, 1, 1, 1,
0.1551255, -1.595213, 3.215478, 1, 1, 1, 1, 1,
0.1570384, 1.372176, -1.209421, 1, 1, 1, 1, 1,
0.1587098, 0.3484427, 0.7104018, 1, 1, 1, 1, 1,
0.164969, -0.4351875, 3.387973, 1, 1, 1, 1, 1,
0.166583, 0.7680801, -0.8433785, 1, 1, 1, 1, 1,
0.1676617, -0.6985102, 0.04551644, 1, 1, 1, 1, 1,
0.1691283, -0.2909266, 1.3051, 1, 1, 1, 1, 1,
0.171697, 0.2120754, -1.502881, 1, 1, 1, 1, 1,
0.1742593, 0.2705215, 1.569042, 1, 1, 1, 1, 1,
0.1749536, 0.3972982, -0.4050488, 1, 1, 1, 1, 1,
0.1803463, 1.285294, -1.160952, 1, 1, 1, 1, 1,
0.1810108, -0.02632737, 1.111736, 1, 1, 1, 1, 1,
0.1856568, 0.1063658, -0.1700421, 1, 1, 1, 1, 1,
0.1879219, 0.07326598, -0.480359, 0, 0, 1, 1, 1,
0.1894144, -1.206823, 4.163602, 1, 0, 0, 1, 1,
0.1901711, 0.9661378, 0.3917668, 1, 0, 0, 1, 1,
0.1920586, 1.546981, 0.4605991, 1, 0, 0, 1, 1,
0.1936265, 0.6142922, 1.268213, 1, 0, 0, 1, 1,
0.2050629, 0.8345456, -0.2314033, 1, 0, 0, 1, 1,
0.2090863, -0.3162313, 2.362003, 0, 0, 0, 1, 1,
0.2117646, -0.68489, 2.354201, 0, 0, 0, 1, 1,
0.2129581, -1.74194, 2.048705, 0, 0, 0, 1, 1,
0.213779, -0.6488439, 2.021917, 0, 0, 0, 1, 1,
0.2140688, 0.2222851, 0.9468898, 0, 0, 0, 1, 1,
0.2158051, 0.1835893, -0.1125259, 0, 0, 0, 1, 1,
0.216765, -0.4952071, 3.40887, 0, 0, 0, 1, 1,
0.2172655, 0.453788, 1.063088, 1, 1, 1, 1, 1,
0.219742, -0.09411365, 1.404411, 1, 1, 1, 1, 1,
0.2218183, 0.1914872, 1.838035, 1, 1, 1, 1, 1,
0.2235514, 2.1611, 0.6015668, 1, 1, 1, 1, 1,
0.2249607, -0.7251482, 2.724144, 1, 1, 1, 1, 1,
0.2288645, 0.4447219, 1.070539, 1, 1, 1, 1, 1,
0.2288821, -0.9410862, 3.65486, 1, 1, 1, 1, 1,
0.2314289, 0.05235932, 1.723541, 1, 1, 1, 1, 1,
0.2343447, 0.6965775, 0.2013728, 1, 1, 1, 1, 1,
0.2461919, -0.9894851, 2.945895, 1, 1, 1, 1, 1,
0.2482226, -0.3513408, 4.394194, 1, 1, 1, 1, 1,
0.2545452, 2.592261, 0.6445953, 1, 1, 1, 1, 1,
0.2553722, -1.713879, 3.484934, 1, 1, 1, 1, 1,
0.2592178, -1.33408, 2.406944, 1, 1, 1, 1, 1,
0.260864, 0.5826414, 0.7267684, 1, 1, 1, 1, 1,
0.2610159, 0.624809, 0.01281149, 0, 0, 1, 1, 1,
0.2690518, -0.5877599, 3.931756, 1, 0, 0, 1, 1,
0.2774494, 1.350219, -0.8187633, 1, 0, 0, 1, 1,
0.2779616, -0.3884129, 1.771761, 1, 0, 0, 1, 1,
0.2787574, -0.4436232, 0.7146049, 1, 0, 0, 1, 1,
0.2805544, 0.4696109, -1.285816, 1, 0, 0, 1, 1,
0.2845608, 2.301136, -0.6109635, 0, 0, 0, 1, 1,
0.2849476, -1.690755, 4.113696, 0, 0, 0, 1, 1,
0.2875936, -0.363905, 2.537866, 0, 0, 0, 1, 1,
0.2937815, -0.06627187, 2.150477, 0, 0, 0, 1, 1,
0.2963144, 0.1120423, 0.7965887, 0, 0, 0, 1, 1,
0.2988957, -0.8425634, 1.822652, 0, 0, 0, 1, 1,
0.3000314, -0.3341205, 2.174407, 0, 0, 0, 1, 1,
0.300217, -0.1683399, 2.740963, 1, 1, 1, 1, 1,
0.3005819, -0.6018414, 2.503177, 1, 1, 1, 1, 1,
0.3040114, 1.440028, 1.615611, 1, 1, 1, 1, 1,
0.3078925, 0.80884, 0.7835253, 1, 1, 1, 1, 1,
0.3090427, -1.157307, 4.482686, 1, 1, 1, 1, 1,
0.3111047, -1.365712, 2.866076, 1, 1, 1, 1, 1,
0.3133648, -0.151127, 1.922688, 1, 1, 1, 1, 1,
0.3151127, -0.6534292, 1.747605, 1, 1, 1, 1, 1,
0.3206645, -1.467557, 3.439556, 1, 1, 1, 1, 1,
0.3227333, 1.095312, 0.1099101, 1, 1, 1, 1, 1,
0.3268725, -0.2645567, 1.191371, 1, 1, 1, 1, 1,
0.329223, -0.1738587, 0.5562196, 1, 1, 1, 1, 1,
0.3299334, -1.271367, 2.110323, 1, 1, 1, 1, 1,
0.3311478, 0.3007002, 1.073624, 1, 1, 1, 1, 1,
0.3322022, 0.7319191, 0.7395896, 1, 1, 1, 1, 1,
0.337798, 0.4685858, -0.05309217, 0, 0, 1, 1, 1,
0.3381271, -0.1597017, 2.786696, 1, 0, 0, 1, 1,
0.342427, 1.083214, 1.040586, 1, 0, 0, 1, 1,
0.3459501, 0.004512641, 3.102133, 1, 0, 0, 1, 1,
0.3465269, -1.360244, 3.224738, 1, 0, 0, 1, 1,
0.3481302, 0.3527108, 1.570421, 1, 0, 0, 1, 1,
0.351619, 0.5795718, 0.05386077, 0, 0, 0, 1, 1,
0.3524159, -0.4205296, 2.885257, 0, 0, 0, 1, 1,
0.3608325, 2.574761, 1.232296, 0, 0, 0, 1, 1,
0.362661, -0.1612385, 2.048812, 0, 0, 0, 1, 1,
0.3628717, 0.7228792, 3.64042, 0, 0, 0, 1, 1,
0.3674483, 0.7886873, -1.099838, 0, 0, 0, 1, 1,
0.3700734, -0.0739288, 1.841005, 0, 0, 0, 1, 1,
0.3714841, -1.516502, 4.10458, 1, 1, 1, 1, 1,
0.3759773, 1.927949, -0.07534819, 1, 1, 1, 1, 1,
0.3772829, 0.7117785, 1.382375, 1, 1, 1, 1, 1,
0.3774813, 0.5078247, 0.8884945, 1, 1, 1, 1, 1,
0.3791749, 0.5148525, 0.2345303, 1, 1, 1, 1, 1,
0.381946, 1.337897, 0.4833103, 1, 1, 1, 1, 1,
0.3828727, -0.6425597, 1.803824, 1, 1, 1, 1, 1,
0.385061, 0.3738227, -0.9286304, 1, 1, 1, 1, 1,
0.3853704, -2.048558, 2.20147, 1, 1, 1, 1, 1,
0.3952042, -0.2482157, 2.823112, 1, 1, 1, 1, 1,
0.3963386, 1.393803, -0.7489516, 1, 1, 1, 1, 1,
0.4056199, -0.7541527, 3.935532, 1, 1, 1, 1, 1,
0.4068546, -1.135184, 2.843855, 1, 1, 1, 1, 1,
0.4075631, 0.1795268, 1.584794, 1, 1, 1, 1, 1,
0.4089728, 0.6600205, 0.02325174, 1, 1, 1, 1, 1,
0.4102088, -0.1465382, 2.05423, 0, 0, 1, 1, 1,
0.4112614, 0.9753932, -0.7902611, 1, 0, 0, 1, 1,
0.4114228, -0.187085, 0.5888194, 1, 0, 0, 1, 1,
0.4141819, 0.4293105, 0.03303597, 1, 0, 0, 1, 1,
0.4226887, -1.457857, 3.47687, 1, 0, 0, 1, 1,
0.4228317, -0.5272392, 1.857956, 1, 0, 0, 1, 1,
0.4257596, -0.07085206, 2.680316, 0, 0, 0, 1, 1,
0.432147, 0.8860393, 2.351474, 0, 0, 0, 1, 1,
0.4324417, -0.2785577, 1.728995, 0, 0, 0, 1, 1,
0.43446, -1.778159, 3.934531, 0, 0, 0, 1, 1,
0.436864, 2.140694, 0.404366, 0, 0, 0, 1, 1,
0.437051, 0.8378594, -0.7930157, 0, 0, 0, 1, 1,
0.442325, 0.6635286, 0.4670551, 0, 0, 0, 1, 1,
0.4444115, 1.447876, -0.9331467, 1, 1, 1, 1, 1,
0.4455582, 0.2388685, -0.1376211, 1, 1, 1, 1, 1,
0.453662, 1.219956, -0.411758, 1, 1, 1, 1, 1,
0.4541142, -0.4933113, 2.517302, 1, 1, 1, 1, 1,
0.4542418, 2.457326, 1.662835, 1, 1, 1, 1, 1,
0.4545094, 2.329875, 0.1006459, 1, 1, 1, 1, 1,
0.4571668, -0.3414639, 4.064775, 1, 1, 1, 1, 1,
0.4574363, -1.052423, 2.140628, 1, 1, 1, 1, 1,
0.4598373, 1.729138, 0.2201546, 1, 1, 1, 1, 1,
0.4663084, 0.8500332, -0.3090214, 1, 1, 1, 1, 1,
0.4668584, -0.5060223, 4.466688, 1, 1, 1, 1, 1,
0.4673032, 1.118605, -0.281436, 1, 1, 1, 1, 1,
0.4716531, -0.3765935, 1.648375, 1, 1, 1, 1, 1,
0.4727082, 0.215108, 1.965145, 1, 1, 1, 1, 1,
0.4854686, -0.2012991, 3.421413, 1, 1, 1, 1, 1,
0.4913318, -0.1094062, 2.047106, 0, 0, 1, 1, 1,
0.5020719, -0.3458117, 1.034688, 1, 0, 0, 1, 1,
0.5029449, 0.0923843, 2.422155, 1, 0, 0, 1, 1,
0.5043139, -0.8564773, 3.554365, 1, 0, 0, 1, 1,
0.5057846, -0.7377036, 0.6795276, 1, 0, 0, 1, 1,
0.5063071, -0.105616, 2.189053, 1, 0, 0, 1, 1,
0.5088798, 0.09272096, 3.30864, 0, 0, 0, 1, 1,
0.5111524, 0.09593353, 2.122842, 0, 0, 0, 1, 1,
0.5150334, -1.727962, 2.033672, 0, 0, 0, 1, 1,
0.5151592, -0.02731797, 0.5242727, 0, 0, 0, 1, 1,
0.5157121, 0.7241179, -0.2217259, 0, 0, 0, 1, 1,
0.5172074, -0.7242706, 2.095561, 0, 0, 0, 1, 1,
0.5238823, -0.4756732, 1.671876, 0, 0, 0, 1, 1,
0.5249153, -1.008005, 1.982411, 1, 1, 1, 1, 1,
0.5260522, -0.6547853, 3.803314, 1, 1, 1, 1, 1,
0.5270265, -1.967703, 3.116014, 1, 1, 1, 1, 1,
0.5289182, -1.223071, 4.22841, 1, 1, 1, 1, 1,
0.5299016, -0.09162866, 0.2937167, 1, 1, 1, 1, 1,
0.534467, -0.3274777, 0.4053646, 1, 1, 1, 1, 1,
0.5364142, -1.36151, 2.88027, 1, 1, 1, 1, 1,
0.5369598, 0.1826608, 2.337345, 1, 1, 1, 1, 1,
0.5405831, 1.000931, -0.8200072, 1, 1, 1, 1, 1,
0.5454315, 1.361289, 0.9943359, 1, 1, 1, 1, 1,
0.5456172, 1.459661, 1.239554, 1, 1, 1, 1, 1,
0.5495108, 1.490625, 0.9442456, 1, 1, 1, 1, 1,
0.5530182, -0.5979266, 3.016684, 1, 1, 1, 1, 1,
0.5572048, -0.5716519, 1.113245, 1, 1, 1, 1, 1,
0.5650886, -0.7729838, 0.7387734, 1, 1, 1, 1, 1,
0.5709097, -2.350091, 3.61121, 0, 0, 1, 1, 1,
0.5752513, -0.2666818, 2.137774, 1, 0, 0, 1, 1,
0.5843016, -0.5853397, 1.035065, 1, 0, 0, 1, 1,
0.5850346, -0.9662939, 2.910878, 1, 0, 0, 1, 1,
0.5852269, -1.114854, 3.170028, 1, 0, 0, 1, 1,
0.5858832, -2.397203, 3.432308, 1, 0, 0, 1, 1,
0.5882975, -1.477806, 1.246012, 0, 0, 0, 1, 1,
0.588419, 0.1478619, 2.568781, 0, 0, 0, 1, 1,
0.5907392, 0.8923429, 0.973662, 0, 0, 0, 1, 1,
0.5922772, 0.1661012, 1.793006, 0, 0, 0, 1, 1,
0.5986173, 0.3649042, -0.2145661, 0, 0, 0, 1, 1,
0.5988689, -0.3686664, 0.570632, 0, 0, 0, 1, 1,
0.6053241, 0.1189495, -0.02364639, 0, 0, 0, 1, 1,
0.6064882, 0.2694884, 0.8415331, 1, 1, 1, 1, 1,
0.6093476, 1.919416, -0.0008652754, 1, 1, 1, 1, 1,
0.6111699, -1.726034, 2.528104, 1, 1, 1, 1, 1,
0.6113791, 0.3802484, -0.2738028, 1, 1, 1, 1, 1,
0.6115806, 0.03416079, 0.7889342, 1, 1, 1, 1, 1,
0.6125866, 1.282035, -0.05673575, 1, 1, 1, 1, 1,
0.6131344, 0.5719932, 1.882834, 1, 1, 1, 1, 1,
0.6158621, 0.5699829, 0.5690489, 1, 1, 1, 1, 1,
0.6158964, 0.5329322, 0.4746759, 1, 1, 1, 1, 1,
0.6182836, -0.5024918, 0.2316076, 1, 1, 1, 1, 1,
0.6196788, -0.3677144, 2.45741, 1, 1, 1, 1, 1,
0.6218771, 0.3172531, 1.227819, 1, 1, 1, 1, 1,
0.6241491, -1.766123, 1.332473, 1, 1, 1, 1, 1,
0.6244462, 0.09583381, 3.480099, 1, 1, 1, 1, 1,
0.6313717, -0.2461357, 1.081342, 1, 1, 1, 1, 1,
0.6323998, -0.3553933, 2.936881, 0, 0, 1, 1, 1,
0.6328787, 1.149179, 0.235555, 1, 0, 0, 1, 1,
0.6331974, -0.986635, 3.23036, 1, 0, 0, 1, 1,
0.6362357, -0.2126006, 1.986976, 1, 0, 0, 1, 1,
0.647984, 0.06905802, 2.233286, 1, 0, 0, 1, 1,
0.6529173, 0.8067171, 1.915474, 1, 0, 0, 1, 1,
0.6557342, 0.4285564, -1.187501, 0, 0, 0, 1, 1,
0.6562808, -0.3214667, 0.9922107, 0, 0, 0, 1, 1,
0.6585623, -0.02983189, 1.188923, 0, 0, 0, 1, 1,
0.6632866, -0.4178815, 1.204626, 0, 0, 0, 1, 1,
0.6657138, 0.5402243, 0.06495293, 0, 0, 0, 1, 1,
0.6694654, -1.334225, 4.309476, 0, 0, 0, 1, 1,
0.6723704, -1.112048, 3.260404, 0, 0, 0, 1, 1,
0.6724551, -1.424618, 3.084833, 1, 1, 1, 1, 1,
0.6816638, 0.3917949, 1.996662, 1, 1, 1, 1, 1,
0.6857371, -1.687701, 3.826579, 1, 1, 1, 1, 1,
0.6915414, 0.9580611, -0.4195791, 1, 1, 1, 1, 1,
0.6956095, -0.6675614, 3.066716, 1, 1, 1, 1, 1,
0.6985672, -0.8495247, 3.65665, 1, 1, 1, 1, 1,
0.705718, 0.4529236, 0.5939924, 1, 1, 1, 1, 1,
0.7109659, -0.969708, 1.589254, 1, 1, 1, 1, 1,
0.7116083, 0.03824238, 0.6642567, 1, 1, 1, 1, 1,
0.7230284, -0.4071089, 2.528563, 1, 1, 1, 1, 1,
0.7315379, -1.05546, 2.320895, 1, 1, 1, 1, 1,
0.7346151, 1.06734, 0.49613, 1, 1, 1, 1, 1,
0.7352295, -0.8166817, 0.691222, 1, 1, 1, 1, 1,
0.7429906, 1.315127, 1.469118, 1, 1, 1, 1, 1,
0.7461814, -0.3198946, 2.783176, 1, 1, 1, 1, 1,
0.7465444, -0.6289676, 2.602486, 0, 0, 1, 1, 1,
0.7530214, 0.8806135, 1.557947, 1, 0, 0, 1, 1,
0.7533892, 0.06254541, 1.661972, 1, 0, 0, 1, 1,
0.7543457, -0.1047926, 2.08687, 1, 0, 0, 1, 1,
0.7545274, -1.540034, 2.620857, 1, 0, 0, 1, 1,
0.7550331, -1.091479, 1.614503, 1, 0, 0, 1, 1,
0.7715901, 0.01758729, 1.235092, 0, 0, 0, 1, 1,
0.7718489, -0.01811853, 2.400609, 0, 0, 0, 1, 1,
0.7748125, -0.2803412, 2.547215, 0, 0, 0, 1, 1,
0.781725, -0.6911408, 3.369935, 0, 0, 0, 1, 1,
0.7851396, 0.8586046, 0.9117028, 0, 0, 0, 1, 1,
0.7862346, -0.507169, 2.154522, 0, 0, 0, 1, 1,
0.788959, -0.7453101, 0.8783293, 0, 0, 0, 1, 1,
0.7934929, -0.2687285, 1.102279, 1, 1, 1, 1, 1,
0.7943813, 0.9575602, 0.3860543, 1, 1, 1, 1, 1,
0.7959929, 0.5868096, 2.22034, 1, 1, 1, 1, 1,
0.7974295, -1.025664, 2.893608, 1, 1, 1, 1, 1,
0.8022567, 0.9707094, 0.4828943, 1, 1, 1, 1, 1,
0.8040819, -0.0497966, 1.551501, 1, 1, 1, 1, 1,
0.8064882, -0.8739914, 2.399935, 1, 1, 1, 1, 1,
0.8112754, 0.6700188, -0.6941773, 1, 1, 1, 1, 1,
0.8142668, -1.216149, 1.389317, 1, 1, 1, 1, 1,
0.8144031, 0.418523, 0.7394912, 1, 1, 1, 1, 1,
0.8200059, 0.826636, 0.838122, 1, 1, 1, 1, 1,
0.8215514, -0.0690207, 1.484132, 1, 1, 1, 1, 1,
0.8223622, -0.2921583, 1.723062, 1, 1, 1, 1, 1,
0.8288286, -0.4304909, 1.560605, 1, 1, 1, 1, 1,
0.8300881, -0.7500862, 2.007171, 1, 1, 1, 1, 1,
0.8302472, -0.2276694, 2.199817, 0, 0, 1, 1, 1,
0.8355815, 0.08231723, 1.152415, 1, 0, 0, 1, 1,
0.845517, 1.096768, 0.5095579, 1, 0, 0, 1, 1,
0.8471025, -0.184952, 1.752061, 1, 0, 0, 1, 1,
0.8589032, -0.4905588, 1.079563, 1, 0, 0, 1, 1,
0.8609258, -0.5335057, 1.854473, 1, 0, 0, 1, 1,
0.8711247, 0.3977515, 2.156533, 0, 0, 0, 1, 1,
0.8748977, 0.07824265, 2.273576, 0, 0, 0, 1, 1,
0.875102, -0.673875, 2.094275, 0, 0, 0, 1, 1,
0.8752894, 1.053151, 0.6380612, 0, 0, 0, 1, 1,
0.8911358, 0.9894881, 0.8690228, 0, 0, 0, 1, 1,
0.8915948, -0.6525828, 0.1715951, 0, 0, 0, 1, 1,
0.9034817, -0.0528563, 1.136075, 0, 0, 0, 1, 1,
0.9043897, -0.9081622, 2.507593, 1, 1, 1, 1, 1,
0.9098921, 0.8090486, 1.258414, 1, 1, 1, 1, 1,
0.9108956, 0.7097497, -1.567263, 1, 1, 1, 1, 1,
0.9225364, -1.401806, 1.24371, 1, 1, 1, 1, 1,
0.9235535, 1.336507, -0.6362808, 1, 1, 1, 1, 1,
0.9239398, 1.229612, 0.3029943, 1, 1, 1, 1, 1,
0.9268214, 1.386255, 1.955492, 1, 1, 1, 1, 1,
0.9301419, -0.2939818, 3.279486, 1, 1, 1, 1, 1,
0.9335636, 2.009563, 0.6369891, 1, 1, 1, 1, 1,
0.941655, 0.1758505, 1.536431, 1, 1, 1, 1, 1,
0.9456118, 0.6884743, 0.6567817, 1, 1, 1, 1, 1,
0.9456259, -2.400828, 2.132138, 1, 1, 1, 1, 1,
0.9460899, 1.270316, 1.095829, 1, 1, 1, 1, 1,
0.9575555, 1.786936, 0.8310773, 1, 1, 1, 1, 1,
0.9586326, -0.8583957, 4.27778, 1, 1, 1, 1, 1,
0.9622837, 1.217919, 0.1208043, 0, 0, 1, 1, 1,
0.9693965, -0.04313153, 1.926966, 1, 0, 0, 1, 1,
0.9728695, -2.142415, 3.074857, 1, 0, 0, 1, 1,
0.9766369, 1.199028, 1.551427, 1, 0, 0, 1, 1,
0.9827896, -1.45325, 1.517009, 1, 0, 0, 1, 1,
0.9848526, -0.01449847, 0.7658711, 1, 0, 0, 1, 1,
0.9876243, -1.120063, 1.547102, 0, 0, 0, 1, 1,
0.9959604, -0.1355525, 2.526436, 0, 0, 0, 1, 1,
1.002275, 1.647543, -0.1132555, 0, 0, 0, 1, 1,
1.005587, -0.6409851, 1.204575, 0, 0, 0, 1, 1,
1.008229, -0.9413245, 1.733933, 0, 0, 0, 1, 1,
1.014905, -1.056612, 0.9524072, 0, 0, 0, 1, 1,
1.021526, 0.6084599, 1.288306, 0, 0, 0, 1, 1,
1.033002, -1.446825, 2.77203, 1, 1, 1, 1, 1,
1.035821, -0.1949429, -0.9262121, 1, 1, 1, 1, 1,
1.039762, -1.331825, 2.62226, 1, 1, 1, 1, 1,
1.042029, -2.054219, 2.317864, 1, 1, 1, 1, 1,
1.0434, 0.06216558, -0.1772959, 1, 1, 1, 1, 1,
1.046579, 0.3472882, 1.775931, 1, 1, 1, 1, 1,
1.052185, -1.449069, 1.440233, 1, 1, 1, 1, 1,
1.053047, -1.721469, 4.964576, 1, 1, 1, 1, 1,
1.056607, 1.620921, 0.1601852, 1, 1, 1, 1, 1,
1.062381, -0.838459, 1.366601, 1, 1, 1, 1, 1,
1.07323, 1.140555, -0.4166749, 1, 1, 1, 1, 1,
1.081908, -1.115999, 2.622435, 1, 1, 1, 1, 1,
1.083211, 2.917097, -0.06069377, 1, 1, 1, 1, 1,
1.08592, 0.2440931, 0.9235703, 1, 1, 1, 1, 1,
1.087207, 2.869156, 0.2935587, 1, 1, 1, 1, 1,
1.09618, -1.075772, 2.872251, 0, 0, 1, 1, 1,
1.103571, 1.091639, 2.778043, 1, 0, 0, 1, 1,
1.105109, -1.632413, 3.008687, 1, 0, 0, 1, 1,
1.106904, -0.5958663, 0.1133245, 1, 0, 0, 1, 1,
1.108464, -0.3694134, 3.854041, 1, 0, 0, 1, 1,
1.115669, -0.7981523, 1.632149, 1, 0, 0, 1, 1,
1.122261, 0.4597983, 2.269539, 0, 0, 0, 1, 1,
1.125244, 0.2419401, 2.718621, 0, 0, 0, 1, 1,
1.129799, -0.6546266, 2.11135, 0, 0, 0, 1, 1,
1.135151, 1.376833, -0.06897983, 0, 0, 0, 1, 1,
1.136162, 1.43897, 0.3856137, 0, 0, 0, 1, 1,
1.136783, -1.405035, 0.3698901, 0, 0, 0, 1, 1,
1.144091, -1.120026, 2.632921, 0, 0, 0, 1, 1,
1.144598, 2.285555, 1.794455, 1, 1, 1, 1, 1,
1.148867, 2.386859, 2.146339, 1, 1, 1, 1, 1,
1.151575, -0.06351707, 1.786915, 1, 1, 1, 1, 1,
1.161467, -0.002265492, 1.656632, 1, 1, 1, 1, 1,
1.163253, -0.1576079, 2.466108, 1, 1, 1, 1, 1,
1.166216, -0.1803406, -0.2784131, 1, 1, 1, 1, 1,
1.177844, -1.007102, 0.2306549, 1, 1, 1, 1, 1,
1.18783, 2.218462, 0.2866096, 1, 1, 1, 1, 1,
1.188514, -0.04186191, 0.8086026, 1, 1, 1, 1, 1,
1.213429, 1.157977, 1.731479, 1, 1, 1, 1, 1,
1.214894, 0.03635069, 1.41917, 1, 1, 1, 1, 1,
1.220561, 0.08792052, 1.800777, 1, 1, 1, 1, 1,
1.231651, 1.451217, 2.577316, 1, 1, 1, 1, 1,
1.234949, 0.7357664, 1.490596, 1, 1, 1, 1, 1,
1.237693, -1.319977, 0.9158133, 1, 1, 1, 1, 1,
1.244954, -0.08810345, 2.053553, 0, 0, 1, 1, 1,
1.276946, 0.6276625, 2.170814, 1, 0, 0, 1, 1,
1.284803, 1.653896, 0.9029177, 1, 0, 0, 1, 1,
1.288414, 0.211885, 1.356125, 1, 0, 0, 1, 1,
1.295411, -0.5820138, 2.414858, 1, 0, 0, 1, 1,
1.308073, -0.3761498, 0.5461237, 1, 0, 0, 1, 1,
1.318068, 1.029435, 0.6989374, 0, 0, 0, 1, 1,
1.318864, 0.9271169, -0.01646702, 0, 0, 0, 1, 1,
1.330426, 1.158584, 1.286325, 0, 0, 0, 1, 1,
1.334512, 1.525408, 0.20303, 0, 0, 0, 1, 1,
1.334891, 1.335536, -0.170383, 0, 0, 0, 1, 1,
1.346928, 0.5228326, 1.042725, 0, 0, 0, 1, 1,
1.361175, -1.076131, 2.670906, 0, 0, 0, 1, 1,
1.381547, 1.36875, -0.1610439, 1, 1, 1, 1, 1,
1.381786, 0.5091877, -0.1953204, 1, 1, 1, 1, 1,
1.384279, -0.1784895, 3.20345, 1, 1, 1, 1, 1,
1.386894, 0.6473922, 2.513733, 1, 1, 1, 1, 1,
1.387341, -0.7245339, 2.101672, 1, 1, 1, 1, 1,
1.388545, 0.2906544, 0.5378303, 1, 1, 1, 1, 1,
1.394056, -0.113488, 3.328867, 1, 1, 1, 1, 1,
1.396206, 1.335184, 1.89955, 1, 1, 1, 1, 1,
1.418222, -0.06094833, 2.305356, 1, 1, 1, 1, 1,
1.431533, 0.1315873, 1.626904, 1, 1, 1, 1, 1,
1.443109, 0.7274009, -0.01494433, 1, 1, 1, 1, 1,
1.454564, 0.28568, 0.1645629, 1, 1, 1, 1, 1,
1.466185, 0.2151911, 2.981025, 1, 1, 1, 1, 1,
1.469871, -0.1025333, 1.986092, 1, 1, 1, 1, 1,
1.490168, -0.8784642, 3.016547, 1, 1, 1, 1, 1,
1.493816, 0.9984561, -0.2091205, 0, 0, 1, 1, 1,
1.495228, 0.6759974, 1.006547, 1, 0, 0, 1, 1,
1.495511, 1.127728, -1.130296, 1, 0, 0, 1, 1,
1.511989, -0.02153183, 0.7334576, 1, 0, 0, 1, 1,
1.512509, 1.251389, -0.0562763, 1, 0, 0, 1, 1,
1.531259, -0.975266, 3.356579, 1, 0, 0, 1, 1,
1.534647, 0.6464814, 1.651742, 0, 0, 0, 1, 1,
1.535466, 0.604095, 0.4447228, 0, 0, 0, 1, 1,
1.541431, -0.3435356, 2.364693, 0, 0, 0, 1, 1,
1.542455, 1.374292, 2.075036, 0, 0, 0, 1, 1,
1.547029, 0.6119452, 1.620496, 0, 0, 0, 1, 1,
1.547762, 0.07686122, 1.183859, 0, 0, 0, 1, 1,
1.550445, 1.581692, 0.9995572, 0, 0, 0, 1, 1,
1.550667, -0.7935409, 0.7123639, 1, 1, 1, 1, 1,
1.557337, 0.9585369, -0.05858528, 1, 1, 1, 1, 1,
1.561881, -0.2004087, 2.53532, 1, 1, 1, 1, 1,
1.570105, 1.074619, -0.7700217, 1, 1, 1, 1, 1,
1.598709, 0.258782, 2.072329, 1, 1, 1, 1, 1,
1.599276, 1.383731, 1.025246, 1, 1, 1, 1, 1,
1.600893, -0.8317274, 2.304789, 1, 1, 1, 1, 1,
1.603571, 0.1014223, 0.515022, 1, 1, 1, 1, 1,
1.604635, 0.9271228, 0.7938221, 1, 1, 1, 1, 1,
1.616885, 0.4364772, 0.4250923, 1, 1, 1, 1, 1,
1.619251, -0.5159659, 3.99696, 1, 1, 1, 1, 1,
1.639667, -0.6521382, 1.40474, 1, 1, 1, 1, 1,
1.653865, 1.880802, 1.806177, 1, 1, 1, 1, 1,
1.657586, -0.2407408, 1.410219, 1, 1, 1, 1, 1,
1.666324, -0.03568459, 2.09399, 1, 1, 1, 1, 1,
1.670349, -1.910736, 1.436059, 0, 0, 1, 1, 1,
1.689807, 0.01564664, 0.7774252, 1, 0, 0, 1, 1,
1.708217, -0.186258, 3.072277, 1, 0, 0, 1, 1,
1.714927, 0.7612089, 1.437507, 1, 0, 0, 1, 1,
1.715079, -0.6226304, 1.300943, 1, 0, 0, 1, 1,
1.71537, 0.483924, 1.105875, 1, 0, 0, 1, 1,
1.717102, 2.47195, 0.9761788, 0, 0, 0, 1, 1,
1.720855, 0.9526684, 0.6094717, 0, 0, 0, 1, 1,
1.724354, 0.2558308, 0.6283323, 0, 0, 0, 1, 1,
1.727845, -1.031287, 2.702732, 0, 0, 0, 1, 1,
1.72977, -0.07488942, 2.122898, 0, 0, 0, 1, 1,
1.74826, 0.435692, 0.5891752, 0, 0, 0, 1, 1,
1.749664, -0.1459731, 3.210258, 0, 0, 0, 1, 1,
1.762108, -0.2833926, -0.4230536, 1, 1, 1, 1, 1,
1.764908, -0.8050586, 2.400623, 1, 1, 1, 1, 1,
1.770237, 0.1707067, 2.81854, 1, 1, 1, 1, 1,
1.778034, 0.08662461, 1.893137, 1, 1, 1, 1, 1,
1.802735, -1.760006, 3.128955, 1, 1, 1, 1, 1,
1.811118, 0.7181528, 2.673558, 1, 1, 1, 1, 1,
1.834343, -0.8867969, 3.789162, 1, 1, 1, 1, 1,
1.843233, -0.5585814, 2.028437, 1, 1, 1, 1, 1,
1.8743, -0.4277456, 1.301838, 1, 1, 1, 1, 1,
1.903069, -0.3176698, 2.502818, 1, 1, 1, 1, 1,
1.925645, -1.175301, 2.530574, 1, 1, 1, 1, 1,
1.944265, -1.81155, 1.382859, 1, 1, 1, 1, 1,
1.965107, 1.331251, -0.7136175, 1, 1, 1, 1, 1,
1.976332, -1.692158, 2.907815, 1, 1, 1, 1, 1,
1.976936, 0.3901133, 0.2446934, 1, 1, 1, 1, 1,
2.007852, -0.4513006, 1.437598, 0, 0, 1, 1, 1,
2.063337, 1.57198, 0.9544467, 1, 0, 0, 1, 1,
2.091159, 1.114805, 0.5947414, 1, 0, 0, 1, 1,
2.105395, -0.08517683, 0.1987947, 1, 0, 0, 1, 1,
2.12081, -0.1949943, 0.6715934, 1, 0, 0, 1, 1,
2.126482, -1.340452, 2.300523, 1, 0, 0, 1, 1,
2.139882, -0.6657503, 2.733531, 0, 0, 0, 1, 1,
2.25477, -1.66252, 1.589242, 0, 0, 0, 1, 1,
2.257952, 0.1341642, 0.8971697, 0, 0, 0, 1, 1,
2.303997, 1.170563, 0.04459748, 0, 0, 0, 1, 1,
2.316614, 1.471424, -0.2166284, 0, 0, 0, 1, 1,
2.334403, -1.158819, 1.259149, 0, 0, 0, 1, 1,
2.491811, 0.6859365, 0.7797563, 0, 0, 0, 1, 1,
2.661281, 0.9524962, 2.179863, 1, 1, 1, 1, 1,
2.669554, 0.1676013, 3.943665, 1, 1, 1, 1, 1,
2.688766, 1.092371, 2.404529, 1, 1, 1, 1, 1,
2.713038, 2.025806, -0.8501839, 1, 1, 1, 1, 1,
2.864152, -1.79226, 2.313921, 1, 1, 1, 1, 1,
2.95011, 1.110679, 1.208963, 1, 1, 1, 1, 1,
3.086715, -0.7445387, 1.540624, 1, 1, 1, 1, 1
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
var radius = 9.470159;
var distance = 33.26353;
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
mvMatrix.translate( -0.08524823, 0.04493666, -0.05070424 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.26353);
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
