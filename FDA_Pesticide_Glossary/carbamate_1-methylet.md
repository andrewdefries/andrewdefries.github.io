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
-2.928986, 0.815323, -2.130431, 1, 0, 0, 1,
-2.9145, 0.002085945, -0.948081, 1, 0.007843138, 0, 1,
-2.685933, 0.665803, -3.190667, 1, 0.01176471, 0, 1,
-2.628796, -0.8350584, -1.801824, 1, 0.01960784, 0, 1,
-2.560353, 0.2741419, -1.687852, 1, 0.02352941, 0, 1,
-2.491434, -1.08626, -1.93436, 1, 0.03137255, 0, 1,
-2.340381, -0.1041472, -1.540497, 1, 0.03529412, 0, 1,
-2.322628, -0.916287, 0.3973171, 1, 0.04313726, 0, 1,
-2.285808, -1.221571, -0.488094, 1, 0.04705882, 0, 1,
-2.264492, -0.2857108, -1.451518, 1, 0.05490196, 0, 1,
-2.214413, -1.269269, -2.295877, 1, 0.05882353, 0, 1,
-2.214122, 0.07299462, -2.242016, 1, 0.06666667, 0, 1,
-2.207007, 0.1273596, -1.825328, 1, 0.07058824, 0, 1,
-2.148584, -0.9721766, -2.524325, 1, 0.07843138, 0, 1,
-2.048541, -0.5790353, -1.929688, 1, 0.08235294, 0, 1,
-2.033729, 0.09226353, -2.679253, 1, 0.09019608, 0, 1,
-2.023012, 1.57315, -0.2650525, 1, 0.09411765, 0, 1,
-1.99257, -0.0412442, -2.959057, 1, 0.1019608, 0, 1,
-1.973404, -0.8242055, -2.483179, 1, 0.1098039, 0, 1,
-1.969034, -0.4307146, -2.46295, 1, 0.1137255, 0, 1,
-1.961049, -2.32547, -2.094891, 1, 0.1215686, 0, 1,
-1.952834, 1.26626, -2.682172, 1, 0.1254902, 0, 1,
-1.945458, -0.04151805, -1.417092, 1, 0.1333333, 0, 1,
-1.925057, 1.167046, 0.591307, 1, 0.1372549, 0, 1,
-1.921213, -0.3973005, -1.990826, 1, 0.145098, 0, 1,
-1.889097, -0.4007547, -1.91508, 1, 0.1490196, 0, 1,
-1.876611, 1.575724, -1.548247, 1, 0.1568628, 0, 1,
-1.862413, -1.217754, -2.629991, 1, 0.1607843, 0, 1,
-1.86049, -0.4622911, -1.914213, 1, 0.1686275, 0, 1,
-1.838083, -1.647078, -1.967368, 1, 0.172549, 0, 1,
-1.829917, 1.277094, 0.3796929, 1, 0.1803922, 0, 1,
-1.826917, -1.188214, -2.547378, 1, 0.1843137, 0, 1,
-1.813172, -0.6811009, -2.236065, 1, 0.1921569, 0, 1,
-1.792786, -0.2243799, -3.047438, 1, 0.1960784, 0, 1,
-1.77904, 0.4945109, -1.904416, 1, 0.2039216, 0, 1,
-1.771303, 1.347901, -2.068986, 1, 0.2117647, 0, 1,
-1.73602, -0.8007679, -1.833606, 1, 0.2156863, 0, 1,
-1.708302, 0.7207465, -1.596266, 1, 0.2235294, 0, 1,
-1.704256, 0.762171, -1.603164, 1, 0.227451, 0, 1,
-1.68778, 0.03283689, -2.229422, 1, 0.2352941, 0, 1,
-1.669935, -0.6155291, -2.226452, 1, 0.2392157, 0, 1,
-1.664117, -1.082249, -2.466222, 1, 0.2470588, 0, 1,
-1.649568, -0.7180958, -2.868598, 1, 0.2509804, 0, 1,
-1.645202, 1.544544, -2.328817, 1, 0.2588235, 0, 1,
-1.631125, -1.425839, -2.709116, 1, 0.2627451, 0, 1,
-1.621405, -2.061136, -3.850329, 1, 0.2705882, 0, 1,
-1.617417, 1.420915, -0.9444857, 1, 0.2745098, 0, 1,
-1.607015, 1.167384, -1.761654, 1, 0.282353, 0, 1,
-1.565404, -0.07372215, -1.20683, 1, 0.2862745, 0, 1,
-1.563393, 0.1955685, -0.6236913, 1, 0.2941177, 0, 1,
-1.54379, 0.1892599, -2.291407, 1, 0.3019608, 0, 1,
-1.543369, -0.632238, -2.081157, 1, 0.3058824, 0, 1,
-1.531834, -1.731009, -2.752757, 1, 0.3137255, 0, 1,
-1.508309, 1.302975, -0.3960553, 1, 0.3176471, 0, 1,
-1.496285, -1.003019, -3.056866, 1, 0.3254902, 0, 1,
-1.494204, 0.2557179, -1.837406, 1, 0.3294118, 0, 1,
-1.483273, -0.7371476, -1.174629, 1, 0.3372549, 0, 1,
-1.483247, 0.3600312, -0.6650772, 1, 0.3411765, 0, 1,
-1.482705, -0.2341829, -0.5074342, 1, 0.3490196, 0, 1,
-1.479983, 0.5958161, -1.28061, 1, 0.3529412, 0, 1,
-1.47834, -1.099912, -0.6015139, 1, 0.3607843, 0, 1,
-1.476552, -0.3425118, -1.740124, 1, 0.3647059, 0, 1,
-1.476419, -0.3754279, -1.748566, 1, 0.372549, 0, 1,
-1.472374, -2.277046, -3.237085, 1, 0.3764706, 0, 1,
-1.460793, 0.9655319, 0.5885231, 1, 0.3843137, 0, 1,
-1.460132, 0.5079201, -2.013249, 1, 0.3882353, 0, 1,
-1.459656, 0.2552772, -1.195028, 1, 0.3960784, 0, 1,
-1.444765, 0.05843667, -2.560093, 1, 0.4039216, 0, 1,
-1.444591, -0.5968613, -2.852768, 1, 0.4078431, 0, 1,
-1.439701, 0.07200255, -0.9951905, 1, 0.4156863, 0, 1,
-1.439631, -0.2926579, -2.828652, 1, 0.4196078, 0, 1,
-1.431801, -0.2655526, -1.720223, 1, 0.427451, 0, 1,
-1.428404, 0.04371531, -0.8573232, 1, 0.4313726, 0, 1,
-1.416, -0.1658372, -2.975709, 1, 0.4392157, 0, 1,
-1.403512, -1.924631, -2.146103, 1, 0.4431373, 0, 1,
-1.401682, 0.5384704, -2.211175, 1, 0.4509804, 0, 1,
-1.397897, -0.01733451, -1.402052, 1, 0.454902, 0, 1,
-1.390938, 0.922698, -1.726427, 1, 0.4627451, 0, 1,
-1.374749, -2.22625, -3.619803, 1, 0.4666667, 0, 1,
-1.373483, 0.3874804, -0.740503, 1, 0.4745098, 0, 1,
-1.372537, 1.007445, -1.113814, 1, 0.4784314, 0, 1,
-1.368304, 1.036969, -1.809248, 1, 0.4862745, 0, 1,
-1.367892, 1.129218, -0.2459822, 1, 0.4901961, 0, 1,
-1.365659, -0.2241847, -1.195275, 1, 0.4980392, 0, 1,
-1.360673, -0.2510389, -1.528268, 1, 0.5058824, 0, 1,
-1.358312, 0.8713062, -0.1875187, 1, 0.509804, 0, 1,
-1.350363, -1.142023, -1.974004, 1, 0.5176471, 0, 1,
-1.342597, -0.2195837, 0.2812635, 1, 0.5215687, 0, 1,
-1.331065, -0.3854706, -3.16164, 1, 0.5294118, 0, 1,
-1.330177, 1.481861, -1.007548, 1, 0.5333334, 0, 1,
-1.327948, 1.145104, -2.096581, 1, 0.5411765, 0, 1,
-1.312492, 0.7753668, -0.9859731, 1, 0.5450981, 0, 1,
-1.304028, 0.002979018, 0.1811253, 1, 0.5529412, 0, 1,
-1.302995, 1.078097, -1.136799, 1, 0.5568628, 0, 1,
-1.299386, -0.4209114, -1.109817, 1, 0.5647059, 0, 1,
-1.293638, -0.295867, -2.663364, 1, 0.5686275, 0, 1,
-1.29118, -0.1144549, -2.198962, 1, 0.5764706, 0, 1,
-1.290788, 0.07842471, -3.077787, 1, 0.5803922, 0, 1,
-1.261196, -1.228917, -3.60873, 1, 0.5882353, 0, 1,
-1.254368, 0.02120476, -1.949818, 1, 0.5921569, 0, 1,
-1.25133, 2.148434, 0.7741096, 1, 0.6, 0, 1,
-1.242214, -0.1171659, -2.417415, 1, 0.6078432, 0, 1,
-1.231789, 0.1084155, -3.174734, 1, 0.6117647, 0, 1,
-1.230813, -0.4437196, -2.208061, 1, 0.6196079, 0, 1,
-1.229259, -1.646898, -2.601179, 1, 0.6235294, 0, 1,
-1.224541, -0.02077267, -0.4949803, 1, 0.6313726, 0, 1,
-1.223911, -0.132756, 0.005792488, 1, 0.6352941, 0, 1,
-1.222271, 2.067761, -0.4266868, 1, 0.6431373, 0, 1,
-1.219118, 0.6490029, -1.666325, 1, 0.6470588, 0, 1,
-1.2173, 0.0318341, -1.81707, 1, 0.654902, 0, 1,
-1.208757, 0.4250874, -1.532933, 1, 0.6588235, 0, 1,
-1.201273, 0.7859493, -1.487006, 1, 0.6666667, 0, 1,
-1.199646, 0.4020556, -2.715623, 1, 0.6705883, 0, 1,
-1.196689, -1.517735, -1.861385, 1, 0.6784314, 0, 1,
-1.19419, 0.04780481, -0.5987286, 1, 0.682353, 0, 1,
-1.191558, -0.2000063, -1.661318, 1, 0.6901961, 0, 1,
-1.188232, -0.7141034, -2.793259, 1, 0.6941177, 0, 1,
-1.183229, -0.4550641, -0.4463916, 1, 0.7019608, 0, 1,
-1.180944, -0.2493891, -0.3588592, 1, 0.7098039, 0, 1,
-1.175156, 0.0460351, -2.29966, 1, 0.7137255, 0, 1,
-1.165321, -0.4523137, -2.773057, 1, 0.7215686, 0, 1,
-1.164161, -1.441972, -2.557992, 1, 0.7254902, 0, 1,
-1.16095, 0.1396226, -3.530726, 1, 0.7333333, 0, 1,
-1.160776, -0.9036101, -2.569717, 1, 0.7372549, 0, 1,
-1.15748, -0.06502485, -1.945222, 1, 0.7450981, 0, 1,
-1.154215, 0.4584577, -1.239764, 1, 0.7490196, 0, 1,
-1.152305, 2.257836, -0.4552549, 1, 0.7568628, 0, 1,
-1.148094, -1.115758, -1.576432, 1, 0.7607843, 0, 1,
-1.144211, 0.4300106, -0.1971603, 1, 0.7686275, 0, 1,
-1.142691, -1.806318, -1.321317, 1, 0.772549, 0, 1,
-1.139382, -0.4096884, -1.579352, 1, 0.7803922, 0, 1,
-1.138779, 0.03622759, -1.611763, 1, 0.7843137, 0, 1,
-1.138745, -0.5866938, -1.5389, 1, 0.7921569, 0, 1,
-1.138309, -0.6870568, -2.915824, 1, 0.7960784, 0, 1,
-1.135099, 0.3476738, -1.641223, 1, 0.8039216, 0, 1,
-1.122684, 0.5377569, -0.8003781, 1, 0.8117647, 0, 1,
-1.121509, 1.038181, -1.615381, 1, 0.8156863, 0, 1,
-1.1193, 2.023466, 1.087451, 1, 0.8235294, 0, 1,
-1.11066, 1.939058, -0.161837, 1, 0.827451, 0, 1,
-1.096137, -1.960837, -1.811942, 1, 0.8352941, 0, 1,
-1.09346, 0.1313303, -0.3462617, 1, 0.8392157, 0, 1,
-1.088312, 1.738905, -0.2373484, 1, 0.8470588, 0, 1,
-1.087609, -0.3771174, -2.893786, 1, 0.8509804, 0, 1,
-1.087372, -1.668612, -0.2976325, 1, 0.8588235, 0, 1,
-1.0777, 0.4031872, -0.4550359, 1, 0.8627451, 0, 1,
-1.073928, 1.757942, 0.04173238, 1, 0.8705882, 0, 1,
-1.058242, 1.533014, 0.7444174, 1, 0.8745098, 0, 1,
-1.049934, 0.5229265, -1.70784, 1, 0.8823529, 0, 1,
-1.046699, -0.4260642, -0.01894945, 1, 0.8862745, 0, 1,
-1.046121, 0.7505203, -1.928327, 1, 0.8941177, 0, 1,
-1.044579, 0.02639502, -1.328987, 1, 0.8980392, 0, 1,
-1.039142, 1.035515, 0.7402052, 1, 0.9058824, 0, 1,
-1.030287, 0.01878815, -3.082211, 1, 0.9137255, 0, 1,
-1.029612, 0.09221038, 0.5110898, 1, 0.9176471, 0, 1,
-1.027512, -1.324737, -2.824735, 1, 0.9254902, 0, 1,
-1.015561, 0.6550068, -2.746068, 1, 0.9294118, 0, 1,
-1.004818, 1.405948, -1.243097, 1, 0.9372549, 0, 1,
-0.9978908, -0.4767893, -3.857131, 1, 0.9411765, 0, 1,
-0.9963742, -0.9891146, -1.274309, 1, 0.9490196, 0, 1,
-0.9894962, -1.667418, -4.160158, 1, 0.9529412, 0, 1,
-0.9684524, 0.689502, -1.281992, 1, 0.9607843, 0, 1,
-0.9673941, 0.6891398, -0.3771069, 1, 0.9647059, 0, 1,
-0.9578204, -0.07069787, -2.802027, 1, 0.972549, 0, 1,
-0.9561622, -0.02189168, -3.237442, 1, 0.9764706, 0, 1,
-0.9482017, 0.2262042, -1.497228, 1, 0.9843137, 0, 1,
-0.9458463, 0.4102933, -1.268476, 1, 0.9882353, 0, 1,
-0.9262496, -0.8051667, -1.735922, 1, 0.9960784, 0, 1,
-0.924583, -0.686681, -2.739114, 0.9960784, 1, 0, 1,
-0.9242053, 0.2289772, -1.006858, 0.9921569, 1, 0, 1,
-0.9177231, -1.925095, -3.187377, 0.9843137, 1, 0, 1,
-0.905405, 0.4011732, -1.31368, 0.9803922, 1, 0, 1,
-0.9050544, -0.2265415, -1.434382, 0.972549, 1, 0, 1,
-0.9016783, 1.275035, -1.395152, 0.9686275, 1, 0, 1,
-0.9012265, -0.235873, -1.87555, 0.9607843, 1, 0, 1,
-0.900552, -1.090874, -3.951696, 0.9568627, 1, 0, 1,
-0.8967022, 0.234032, -2.072029, 0.9490196, 1, 0, 1,
-0.8938582, -1.465368, -1.948963, 0.945098, 1, 0, 1,
-0.8906862, -1.236554, -3.327622, 0.9372549, 1, 0, 1,
-0.8888038, -0.3717988, -1.804227, 0.9333333, 1, 0, 1,
-0.8819547, 0.09337892, -1.891679, 0.9254902, 1, 0, 1,
-0.880414, 0.415326, 1.695951, 0.9215686, 1, 0, 1,
-0.8752283, 2.059609, -1.82141, 0.9137255, 1, 0, 1,
-0.8746907, -0.5648893, -3.176615, 0.9098039, 1, 0, 1,
-0.8744016, 0.9375373, -1.015944, 0.9019608, 1, 0, 1,
-0.8693032, -1.130805, -2.436508, 0.8941177, 1, 0, 1,
-0.8688673, -0.165061, 0.7399971, 0.8901961, 1, 0, 1,
-0.8686488, -0.3744217, -1.517461, 0.8823529, 1, 0, 1,
-0.8633735, 0.4499238, -0.6101629, 0.8784314, 1, 0, 1,
-0.8554848, 2.159132, -1.462842, 0.8705882, 1, 0, 1,
-0.8505095, 1.321247, -0.676105, 0.8666667, 1, 0, 1,
-0.8419302, 0.09620672, -1.96305, 0.8588235, 1, 0, 1,
-0.8355889, 0.03197757, -1.07405, 0.854902, 1, 0, 1,
-0.8350371, -0.7334788, -2.000725, 0.8470588, 1, 0, 1,
-0.819811, 0.9540343, -2.34359, 0.8431373, 1, 0, 1,
-0.8088875, 0.8414077, -0.123367, 0.8352941, 1, 0, 1,
-0.8035471, 0.4383232, -1.266748, 0.8313726, 1, 0, 1,
-0.793816, -1.162386, -1.390013, 0.8235294, 1, 0, 1,
-0.7888182, -1.283734, -0.370484, 0.8196079, 1, 0, 1,
-0.7857941, -0.2686401, -2.368006, 0.8117647, 1, 0, 1,
-0.7825742, 2.813757, -1.252163, 0.8078431, 1, 0, 1,
-0.7789354, -0.6288808, -2.092669, 0.8, 1, 0, 1,
-0.7773107, 0.2092873, -1.367052, 0.7921569, 1, 0, 1,
-0.7706863, -1.710609, -2.273342, 0.7882353, 1, 0, 1,
-0.7705557, 1.161821, -1.188398, 0.7803922, 1, 0, 1,
-0.7704882, 0.300956, -0.5043774, 0.7764706, 1, 0, 1,
-0.7654712, -1.286878, -1.235033, 0.7686275, 1, 0, 1,
-0.758725, -0.4209655, -2.074966, 0.7647059, 1, 0, 1,
-0.7547541, 0.7141472, -0.3159486, 0.7568628, 1, 0, 1,
-0.75314, -0.8773581, -0.7770373, 0.7529412, 1, 0, 1,
-0.7524407, 0.8664766, -3.144994, 0.7450981, 1, 0, 1,
-0.749179, -0.3486493, -3.106175, 0.7411765, 1, 0, 1,
-0.7480511, -1.197218, -2.752815, 0.7333333, 1, 0, 1,
-0.7443756, 1.348645, -1.197311, 0.7294118, 1, 0, 1,
-0.7371907, 0.4820429, -2.278815, 0.7215686, 1, 0, 1,
-0.7330801, -1.368794, -4.884365, 0.7176471, 1, 0, 1,
-0.7239844, -0.9770346, -1.282326, 0.7098039, 1, 0, 1,
-0.7223874, -1.930108, -0.9288497, 0.7058824, 1, 0, 1,
-0.7220905, 1.697468, 0.08147089, 0.6980392, 1, 0, 1,
-0.7205814, 1.247104, -1.490531, 0.6901961, 1, 0, 1,
-0.7179073, -0.1713629, -1.050922, 0.6862745, 1, 0, 1,
-0.7144514, 1.170516, -0.04408992, 0.6784314, 1, 0, 1,
-0.7127421, -0.4207387, -0.505304, 0.6745098, 1, 0, 1,
-0.7119115, -0.08703456, -1.711645, 0.6666667, 1, 0, 1,
-0.7092953, 0.9026038, 0.8921617, 0.6627451, 1, 0, 1,
-0.7046713, -0.03463884, -0.8035808, 0.654902, 1, 0, 1,
-0.7031411, 0.7024069, 0.1893935, 0.6509804, 1, 0, 1,
-0.7014586, -0.1826975, -2.433419, 0.6431373, 1, 0, 1,
-0.7011706, 2.093711, 1.535017, 0.6392157, 1, 0, 1,
-0.6946763, -0.095839, -1.973551, 0.6313726, 1, 0, 1,
-0.6934747, -0.8266469, -2.533125, 0.627451, 1, 0, 1,
-0.692831, -1.513482, -3.615949, 0.6196079, 1, 0, 1,
-0.68447, -0.009280212, -3.693787, 0.6156863, 1, 0, 1,
-0.6812452, -1.125387, -4.538199, 0.6078432, 1, 0, 1,
-0.6749335, -1.276087, -3.279226, 0.6039216, 1, 0, 1,
-0.6724882, -0.2285582, -2.467949, 0.5960785, 1, 0, 1,
-0.6705477, 1.549746, 0.04854002, 0.5882353, 1, 0, 1,
-0.6691357, 2.102176, -0.01875393, 0.5843138, 1, 0, 1,
-0.6632628, -0.7986804, -1.557624, 0.5764706, 1, 0, 1,
-0.6631529, 2.210581, -0.2400288, 0.572549, 1, 0, 1,
-0.6619047, -0.993615, -2.308623, 0.5647059, 1, 0, 1,
-0.6582228, -1.156066, -2.950902, 0.5607843, 1, 0, 1,
-0.6579078, 0.6989927, -1.10315, 0.5529412, 1, 0, 1,
-0.6576185, -0.6540915, -2.555947, 0.5490196, 1, 0, 1,
-0.6564192, -0.7548188, -2.753142, 0.5411765, 1, 0, 1,
-0.6468744, 1.858826, -0.1192752, 0.5372549, 1, 0, 1,
-0.6440127, 0.8999652, -0.9497634, 0.5294118, 1, 0, 1,
-0.6400171, -0.4428458, -2.697424, 0.5254902, 1, 0, 1,
-0.6392673, -0.6409736, -1.417368, 0.5176471, 1, 0, 1,
-0.638835, -2.168748, -2.630985, 0.5137255, 1, 0, 1,
-0.6349307, 0.8869117, -0.7073881, 0.5058824, 1, 0, 1,
-0.6296694, 0.0589001, -1.484079, 0.5019608, 1, 0, 1,
-0.6274092, 0.4010553, -1.866121, 0.4941176, 1, 0, 1,
-0.6264995, 0.1225353, -0.6744269, 0.4862745, 1, 0, 1,
-0.6261615, 1.866305, -0.6019423, 0.4823529, 1, 0, 1,
-0.6257318, 0.5298054, -0.6271684, 0.4745098, 1, 0, 1,
-0.6253018, 0.2204446, -0.148512, 0.4705882, 1, 0, 1,
-0.6247104, 0.8679701, 0.02091331, 0.4627451, 1, 0, 1,
-0.6243023, -0.3888637, 0.7802086, 0.4588235, 1, 0, 1,
-0.6234769, 0.07291339, 0.7797667, 0.4509804, 1, 0, 1,
-0.6191765, -0.3865674, -1.837474, 0.4470588, 1, 0, 1,
-0.6169623, -0.8718435, -3.059036, 0.4392157, 1, 0, 1,
-0.6132559, 2.422751, -1.157634, 0.4352941, 1, 0, 1,
-0.6071541, 0.4243174, -1.513603, 0.427451, 1, 0, 1,
-0.5914825, 0.604795, -0.9016089, 0.4235294, 1, 0, 1,
-0.590341, 0.9798027, 0.2402413, 0.4156863, 1, 0, 1,
-0.584023, 0.7459704, -0.2421075, 0.4117647, 1, 0, 1,
-0.5814946, -0.6002738, -2.255387, 0.4039216, 1, 0, 1,
-0.5753344, 1.554574, 0.4051754, 0.3960784, 1, 0, 1,
-0.5736392, 1.277201, -0.4186368, 0.3921569, 1, 0, 1,
-0.5723901, -0.4331983, -2.883329, 0.3843137, 1, 0, 1,
-0.5712559, -0.4954084, -2.297488, 0.3803922, 1, 0, 1,
-0.5651202, -0.03428732, -3.080729, 0.372549, 1, 0, 1,
-0.5603201, -0.8000643, -0.6886703, 0.3686275, 1, 0, 1,
-0.5588262, -0.2967975, -2.140765, 0.3607843, 1, 0, 1,
-0.5562189, 0.2285432, -2.102894, 0.3568628, 1, 0, 1,
-0.5524938, -0.01526151, -2.29038, 0.3490196, 1, 0, 1,
-0.5507865, 0.1975458, 0.3115835, 0.345098, 1, 0, 1,
-0.5487051, -0.5439385, -4.273361, 0.3372549, 1, 0, 1,
-0.5439201, 0.0567521, -0.1192346, 0.3333333, 1, 0, 1,
-0.5400981, -0.3404238, -2.110451, 0.3254902, 1, 0, 1,
-0.5357724, -0.5529879, -1.278656, 0.3215686, 1, 0, 1,
-0.5356281, -0.5045782, -2.478676, 0.3137255, 1, 0, 1,
-0.5321892, -0.758131, -3.268601, 0.3098039, 1, 0, 1,
-0.5274664, -0.9633472, -3.394015, 0.3019608, 1, 0, 1,
-0.5236557, -0.7759777, -3.084255, 0.2941177, 1, 0, 1,
-0.5224075, 0.3183747, -1.804933, 0.2901961, 1, 0, 1,
-0.5194077, -0.6279775, -2.773134, 0.282353, 1, 0, 1,
-0.5164138, 0.70968, -1.113342, 0.2784314, 1, 0, 1,
-0.5160584, 1.046802, -0.8876786, 0.2705882, 1, 0, 1,
-0.5122629, -0.7174267, -3.462338, 0.2666667, 1, 0, 1,
-0.5034228, -0.04952072, -1.114344, 0.2588235, 1, 0, 1,
-0.5013869, -0.6213461, -3.684132, 0.254902, 1, 0, 1,
-0.4998066, -0.4084399, -1.203228, 0.2470588, 1, 0, 1,
-0.49438, -0.3809781, -0.3263609, 0.2431373, 1, 0, 1,
-0.4927568, -0.02019384, -1.079551, 0.2352941, 1, 0, 1,
-0.4898337, 0.4537166, 0.5487124, 0.2313726, 1, 0, 1,
-0.4892574, 2.377603, 0.05126224, 0.2235294, 1, 0, 1,
-0.487784, 1.366769, -0.1249901, 0.2196078, 1, 0, 1,
-0.4844013, -0.3095201, -1.167081, 0.2117647, 1, 0, 1,
-0.481232, 1.0287, -0.2778379, 0.2078431, 1, 0, 1,
-0.4673914, 0.3002451, -1.913223, 0.2, 1, 0, 1,
-0.4653733, 0.6996927, -0.2252408, 0.1921569, 1, 0, 1,
-0.4642334, -0.2741885, -2.372682, 0.1882353, 1, 0, 1,
-0.4552908, -0.05893918, -1.982978, 0.1803922, 1, 0, 1,
-0.4516648, 0.6590785, 0.4961982, 0.1764706, 1, 0, 1,
-0.4513159, -0.3742711, -3.754495, 0.1686275, 1, 0, 1,
-0.4503645, -0.4371717, -3.637605, 0.1647059, 1, 0, 1,
-0.4457569, -0.2594844, -2.413615, 0.1568628, 1, 0, 1,
-0.4447113, -0.8370248, -3.871373, 0.1529412, 1, 0, 1,
-0.4444959, -0.3248426, -3.280246, 0.145098, 1, 0, 1,
-0.4431817, 0.7522961, -0.9523749, 0.1411765, 1, 0, 1,
-0.4418963, -0.7950172, -3.426732, 0.1333333, 1, 0, 1,
-0.4384991, 1.775807, -1.154412, 0.1294118, 1, 0, 1,
-0.4383505, -0.09896904, -1.939414, 0.1215686, 1, 0, 1,
-0.4368062, 0.7082089, 0.07259916, 0.1176471, 1, 0, 1,
-0.4364582, -0.5617895, -1.149026, 0.1098039, 1, 0, 1,
-0.4363713, -0.4318231, -2.076829, 0.1058824, 1, 0, 1,
-0.4323126, 1.044673, 0.7265494, 0.09803922, 1, 0, 1,
-0.4299387, -1.797394, -2.658418, 0.09019608, 1, 0, 1,
-0.4270431, 0.27279, -1.567779, 0.08627451, 1, 0, 1,
-0.4259289, 1.455855, 0.08684232, 0.07843138, 1, 0, 1,
-0.4234885, -0.1818733, -2.21713, 0.07450981, 1, 0, 1,
-0.4214255, -0.4115464, -3.742189, 0.06666667, 1, 0, 1,
-0.4198918, 1.507827, 0.2755984, 0.0627451, 1, 0, 1,
-0.4183151, 0.5381205, -0.1995831, 0.05490196, 1, 0, 1,
-0.4154352, -1.344691, -3.948429, 0.05098039, 1, 0, 1,
-0.4148483, 0.227783, -0.8824586, 0.04313726, 1, 0, 1,
-0.4146972, 1.625564, -0.2238032, 0.03921569, 1, 0, 1,
-0.4121091, -1.810037, -3.735253, 0.03137255, 1, 0, 1,
-0.4119246, -1.094733, -1.813078, 0.02745098, 1, 0, 1,
-0.4115032, 1.642852, 0.37931, 0.01960784, 1, 0, 1,
-0.4091633, 0.7070569, -0.2783999, 0.01568628, 1, 0, 1,
-0.4086778, 1.200467, -0.1122153, 0.007843138, 1, 0, 1,
-0.4027217, -0.9120252, -3.123771, 0.003921569, 1, 0, 1,
-0.4018317, 0.374868, 1.036115, 0, 1, 0.003921569, 1,
-0.3970235, -0.2997809, -0.8104657, 0, 1, 0.01176471, 1,
-0.3969982, 0.9534227, -1.088568, 0, 1, 0.01568628, 1,
-0.3965248, -0.4028682, -0.8196359, 0, 1, 0.02352941, 1,
-0.3961161, -0.02146943, -2.393507, 0, 1, 0.02745098, 1,
-0.3878241, -0.8409173, -1.885621, 0, 1, 0.03529412, 1,
-0.3873321, -0.7590076, -3.786766, 0, 1, 0.03921569, 1,
-0.3868276, -1.590376, -4.054321, 0, 1, 0.04705882, 1,
-0.3866462, -0.2406182, -3.935525, 0, 1, 0.05098039, 1,
-0.3763319, -1.712444, -3.055638, 0, 1, 0.05882353, 1,
-0.3761305, 0.8223696, 2.694823, 0, 1, 0.0627451, 1,
-0.374193, 0.02205872, 0.2385921, 0, 1, 0.07058824, 1,
-0.37071, 1.695855, 0.6948728, 0, 1, 0.07450981, 1,
-0.3704223, -0.8478884, -4.080996, 0, 1, 0.08235294, 1,
-0.3683001, 1.201344, 0.2810485, 0, 1, 0.08627451, 1,
-0.3661271, 0.9826794, -0.1857536, 0, 1, 0.09411765, 1,
-0.3649313, 1.36154, -0.08205581, 0, 1, 0.1019608, 1,
-0.3643342, 1.423618, 2.254943, 0, 1, 0.1058824, 1,
-0.3635322, 0.001663669, -1.419283, 0, 1, 0.1137255, 1,
-0.3561617, -0.7453573, -1.399437, 0, 1, 0.1176471, 1,
-0.3526529, 0.48522, 0.2440195, 0, 1, 0.1254902, 1,
-0.3522902, -0.6587794, -3.750027, 0, 1, 0.1294118, 1,
-0.350435, -0.221663, -1.203143, 0, 1, 0.1372549, 1,
-0.3504131, 0.4474613, 0.6297364, 0, 1, 0.1411765, 1,
-0.3459482, 0.4015718, 1.379244, 0, 1, 0.1490196, 1,
-0.345035, -1.273102, -3.808437, 0, 1, 0.1529412, 1,
-0.3444459, 0.2276286, -1.79469, 0, 1, 0.1607843, 1,
-0.3400502, 2.242755, 0.7519873, 0, 1, 0.1647059, 1,
-0.3372456, -0.4588042, -1.978938, 0, 1, 0.172549, 1,
-0.3323614, -0.004104936, -0.6395363, 0, 1, 0.1764706, 1,
-0.3305713, -2.410745, -2.987906, 0, 1, 0.1843137, 1,
-0.3294045, 1.496571, 1.360015, 0, 1, 0.1882353, 1,
-0.3159689, 1.748597, -0.3128911, 0, 1, 0.1960784, 1,
-0.3131812, 0.9426398, 0.8985932, 0, 1, 0.2039216, 1,
-0.310323, -1.905909, -1.150426, 0, 1, 0.2078431, 1,
-0.3098849, 0.6629027, -0.01385384, 0, 1, 0.2156863, 1,
-0.3048621, -1.480526, -1.362427, 0, 1, 0.2196078, 1,
-0.3025904, -1.078583, -3.376838, 0, 1, 0.227451, 1,
-0.2999532, 0.06913995, -0.8944045, 0, 1, 0.2313726, 1,
-0.2970925, -0.2558927, -3.076527, 0, 1, 0.2392157, 1,
-0.292386, -0.03249479, -0.5991534, 0, 1, 0.2431373, 1,
-0.2805216, 0.3062611, -0.4248382, 0, 1, 0.2509804, 1,
-0.280338, 0.2658924, -0.7608838, 0, 1, 0.254902, 1,
-0.2797856, -0.5435154, -3.074504, 0, 1, 0.2627451, 1,
-0.2770046, -2.109812, -3.497818, 0, 1, 0.2666667, 1,
-0.2769017, 1.074178, 0.158358, 0, 1, 0.2745098, 1,
-0.276486, 0.9502378, -0.8165677, 0, 1, 0.2784314, 1,
-0.2752762, 1.049998, -1.403784, 0, 1, 0.2862745, 1,
-0.2731037, -1.486395, -3.096758, 0, 1, 0.2901961, 1,
-0.2705353, 2.849257, 1.157994, 0, 1, 0.2980392, 1,
-0.2652269, 1.673431, -1.78472, 0, 1, 0.3058824, 1,
-0.2632076, -2.420541, -3.38558, 0, 1, 0.3098039, 1,
-0.259195, -0.9075582, -2.811364, 0, 1, 0.3176471, 1,
-0.2588591, -0.0310312, -1.954404, 0, 1, 0.3215686, 1,
-0.2585397, 0.2499534, -1.850922, 0, 1, 0.3294118, 1,
-0.2550687, 1.059575, -0.2852533, 0, 1, 0.3333333, 1,
-0.2547369, -1.162273, -1.451549, 0, 1, 0.3411765, 1,
-0.2546054, 1.684906, 0.8993108, 0, 1, 0.345098, 1,
-0.2544688, -1.423423, -3.091376, 0, 1, 0.3529412, 1,
-0.2528608, 1.355355, 0.2112676, 0, 1, 0.3568628, 1,
-0.2506178, -0.8748308, -3.371612, 0, 1, 0.3647059, 1,
-0.2474259, 0.8336655, -0.4417913, 0, 1, 0.3686275, 1,
-0.2444466, -0.4403829, -2.613657, 0, 1, 0.3764706, 1,
-0.2411938, -0.8125915, -3.903669, 0, 1, 0.3803922, 1,
-0.2406031, 1.708849, 0.908578, 0, 1, 0.3882353, 1,
-0.2333014, 0.5226679, -1.973039, 0, 1, 0.3921569, 1,
-0.2319928, 1.209291, -1.257625, 0, 1, 0.4, 1,
-0.2313413, -0.1512695, -2.845745, 0, 1, 0.4078431, 1,
-0.2293106, 0.7393607, 0.1693436, 0, 1, 0.4117647, 1,
-0.2274159, -0.855408, -2.341621, 0, 1, 0.4196078, 1,
-0.2267948, -0.7808515, -2.685971, 0, 1, 0.4235294, 1,
-0.2246494, -0.5783628, -4.033043, 0, 1, 0.4313726, 1,
-0.2245001, 1.252338, -0.4181682, 0, 1, 0.4352941, 1,
-0.2235593, 0.3543132, 0.802434, 0, 1, 0.4431373, 1,
-0.2145116, -1.469541, -3.025636, 0, 1, 0.4470588, 1,
-0.2132901, -1.160549, -3.982353, 0, 1, 0.454902, 1,
-0.2108797, 1.068553, 0.6160163, 0, 1, 0.4588235, 1,
-0.2094164, 0.06819874, -1.646677, 0, 1, 0.4666667, 1,
-0.2075205, -0.1310219, -4.064888, 0, 1, 0.4705882, 1,
-0.2065234, -0.2365929, -2.01165, 0, 1, 0.4784314, 1,
-0.2064159, -0.8598917, -3.37634, 0, 1, 0.4823529, 1,
-0.2057459, 0.8215445, 1.313765, 0, 1, 0.4901961, 1,
-0.2022673, -0.9344336, -1.921922, 0, 1, 0.4941176, 1,
-0.1944281, -0.3160183, -2.738877, 0, 1, 0.5019608, 1,
-0.1899565, 1.35559, -0.1993729, 0, 1, 0.509804, 1,
-0.189611, 0.6611509, 0.3980815, 0, 1, 0.5137255, 1,
-0.1892775, 0.699356, -0.04171045, 0, 1, 0.5215687, 1,
-0.1843848, 0.433175, -1.558454, 0, 1, 0.5254902, 1,
-0.1834, -0.4014347, -3.764776, 0, 1, 0.5333334, 1,
-0.1776423, 0.7769878, -0.0675039, 0, 1, 0.5372549, 1,
-0.1774985, -0.638733, -1.108131, 0, 1, 0.5450981, 1,
-0.1731392, -1.740811, -3.204883, 0, 1, 0.5490196, 1,
-0.1727022, 1.527489, -0.7969333, 0, 1, 0.5568628, 1,
-0.1721775, -0.7567573, -2.739629, 0, 1, 0.5607843, 1,
-0.1720337, 0.2391722, -0.5290935, 0, 1, 0.5686275, 1,
-0.169788, -0.1025362, -2.257191, 0, 1, 0.572549, 1,
-0.1691693, 0.1738464, -1.387136, 0, 1, 0.5803922, 1,
-0.1606114, -0.3815987, -2.981373, 0, 1, 0.5843138, 1,
-0.1593598, -0.7195948, -3.583369, 0, 1, 0.5921569, 1,
-0.1576002, 1.565855, -0.4811721, 0, 1, 0.5960785, 1,
-0.1571968, -0.7211407, -0.4173964, 0, 1, 0.6039216, 1,
-0.1542713, -2.003416, -4.998628, 0, 1, 0.6117647, 1,
-0.1438476, 1.451131, 1.085604, 0, 1, 0.6156863, 1,
-0.1319965, -0.2467244, -1.473248, 0, 1, 0.6235294, 1,
-0.1314296, -1.267493, -3.938644, 0, 1, 0.627451, 1,
-0.1284209, -1.345368, -3.485952, 0, 1, 0.6352941, 1,
-0.1282168, -0.8270221, -4.760577, 0, 1, 0.6392157, 1,
-0.1263959, 0.875022, -0.6553826, 0, 1, 0.6470588, 1,
-0.1253724, 0.2349537, -0.1454064, 0, 1, 0.6509804, 1,
-0.1236625, -0.5029064, -4.214073, 0, 1, 0.6588235, 1,
-0.1207428, 0.3872971, -0.384642, 0, 1, 0.6627451, 1,
-0.1194777, 1.820139, -0.7494107, 0, 1, 0.6705883, 1,
-0.1188987, 0.775046, 0.4046173, 0, 1, 0.6745098, 1,
-0.1161197, -0.6405424, -2.596543, 0, 1, 0.682353, 1,
-0.1134305, -0.6573386, -3.901864, 0, 1, 0.6862745, 1,
-0.113362, 0.01516774, -2.106331, 0, 1, 0.6941177, 1,
-0.1124872, 2.345699, 0.9940685, 0, 1, 0.7019608, 1,
-0.1107707, -0.5162918, -0.9397256, 0, 1, 0.7058824, 1,
-0.1095302, 0.04186298, -0.7547913, 0, 1, 0.7137255, 1,
-0.1067558, 1.452003, -1.563541, 0, 1, 0.7176471, 1,
-0.1044316, -0.6099707, -2.73009, 0, 1, 0.7254902, 1,
-0.1000425, -2.276374, -2.332344, 0, 1, 0.7294118, 1,
-0.09930158, -1.191531, -3.450371, 0, 1, 0.7372549, 1,
-0.09579149, 0.409095, -0.3895366, 0, 1, 0.7411765, 1,
-0.09573921, -0.02140322, -2.843971, 0, 1, 0.7490196, 1,
-0.09369595, 0.5669796, -0.9297323, 0, 1, 0.7529412, 1,
-0.09137104, -0.9137648, -1.689364, 0, 1, 0.7607843, 1,
-0.09117629, 0.3336789, -2.217818, 0, 1, 0.7647059, 1,
-0.08911061, 1.384455, 0.1682343, 0, 1, 0.772549, 1,
-0.08612809, 0.7404636, -3.583523, 0, 1, 0.7764706, 1,
-0.08433566, 0.1866921, -0.4855675, 0, 1, 0.7843137, 1,
-0.08397093, 0.4292226, -1.31352, 0, 1, 0.7882353, 1,
-0.080731, -0.04465305, -0.05475562, 0, 1, 0.7960784, 1,
-0.07472949, -0.5510755, -1.548179, 0, 1, 0.8039216, 1,
-0.0741308, 0.5274851, -0.6023684, 0, 1, 0.8078431, 1,
-0.07357711, 0.06232467, -1.378423, 0, 1, 0.8156863, 1,
-0.06995908, -1.658549, -3.166587, 0, 1, 0.8196079, 1,
-0.0668386, 0.7863014, -1.064287, 0, 1, 0.827451, 1,
-0.06317822, 1.085111, 0.7035563, 0, 1, 0.8313726, 1,
-0.06122674, -1.334903, -2.673883, 0, 1, 0.8392157, 1,
-0.06105686, -0.8154743, -3.046695, 0, 1, 0.8431373, 1,
-0.05486928, -0.2343459, -4.918351, 0, 1, 0.8509804, 1,
-0.0542071, -0.07652657, -1.871523, 0, 1, 0.854902, 1,
-0.05046755, -1.533186, -4.415802, 0, 1, 0.8627451, 1,
-0.04864293, 2.25341, 0.2829693, 0, 1, 0.8666667, 1,
-0.04809578, -1.027777, -3.845893, 0, 1, 0.8745098, 1,
-0.04741467, 0.09186376, 0.778605, 0, 1, 0.8784314, 1,
-0.04733663, 1.151332, -0.6638209, 0, 1, 0.8862745, 1,
-0.04691073, 0.3493845, -0.1404643, 0, 1, 0.8901961, 1,
-0.04471048, -0.8049422, -3.234846, 0, 1, 0.8980392, 1,
-0.04089692, -0.9483208, -3.375426, 0, 1, 0.9058824, 1,
-0.03983826, 0.1474518, 0.2878629, 0, 1, 0.9098039, 1,
-0.03451732, -0.7986454, -2.254437, 0, 1, 0.9176471, 1,
-0.03352907, -0.5827664, -2.923682, 0, 1, 0.9215686, 1,
-0.03339603, 1.318291, -1.292946, 0, 1, 0.9294118, 1,
-0.02623931, -1.511046, -4.735148, 0, 1, 0.9333333, 1,
-0.02602992, 0.6166528, 0.4680468, 0, 1, 0.9411765, 1,
-0.01825716, -0.8361769, -5.235445, 0, 1, 0.945098, 1,
-0.0182542, 0.06660786, 0.8476867, 0, 1, 0.9529412, 1,
-0.01771158, -0.599248, -3.716465, 0, 1, 0.9568627, 1,
-0.01559649, -0.8486261, -4.151088, 0, 1, 0.9647059, 1,
-0.01558717, 0.1632997, 0.6252216, 0, 1, 0.9686275, 1,
-0.01441742, -0.3518917, -1.600058, 0, 1, 0.9764706, 1,
-0.01426914, -1.947769, -1.813171, 0, 1, 0.9803922, 1,
-0.01375299, -0.2846746, -5.129807, 0, 1, 0.9882353, 1,
-0.01231462, -0.5959108, -2.322159, 0, 1, 0.9921569, 1,
-0.01016359, -0.7127966, -1.999276, 0, 1, 1, 1,
-0.009274255, -0.03066456, -3.380409, 0, 0.9921569, 1, 1,
-0.008097019, 2.02299, 2.195691, 0, 0.9882353, 1, 1,
-0.006400105, -1.235078, -4.065074, 0, 0.9803922, 1, 1,
-0.004514656, 0.2432756, -0.8397271, 0, 0.9764706, 1, 1,
-0.003843549, -0.05206243, -2.050078, 0, 0.9686275, 1, 1,
-0.002349183, 1.982718, -1.646676, 0, 0.9647059, 1, 1,
-0.001886321, 0.9183292, -0.8299474, 0, 0.9568627, 1, 1,
0.001556189, -0.1759657, 2.227724, 0, 0.9529412, 1, 1,
0.001780284, -0.2878105, 2.864429, 0, 0.945098, 1, 1,
0.002340584, -0.8549221, 3.197074, 0, 0.9411765, 1, 1,
0.004692514, -0.05483434, 1.458772, 0, 0.9333333, 1, 1,
0.006889976, 0.4211125, 0.5270613, 0, 0.9294118, 1, 1,
0.007576334, -0.6484346, 1.239109, 0, 0.9215686, 1, 1,
0.01357129, -0.3264081, 2.041571, 0, 0.9176471, 1, 1,
0.0138613, 0.06732646, 1.506636, 0, 0.9098039, 1, 1,
0.0144427, -1.08579, 4.224859, 0, 0.9058824, 1, 1,
0.01828426, 2.611313, 1.593677, 0, 0.8980392, 1, 1,
0.0220162, -0.9858181, 4.620759, 0, 0.8901961, 1, 1,
0.02403416, -1.038716, 1.469661, 0, 0.8862745, 1, 1,
0.02832242, -0.8811711, 2.854496, 0, 0.8784314, 1, 1,
0.02917632, 0.5702834, 0.08317564, 0, 0.8745098, 1, 1,
0.03764001, 0.06942907, 1.088431, 0, 0.8666667, 1, 1,
0.03843581, 0.5831372, 0.2222006, 0, 0.8627451, 1, 1,
0.0391548, -1.856635, 2.626526, 0, 0.854902, 1, 1,
0.04421127, -0.8722346, 5.134229, 0, 0.8509804, 1, 1,
0.047082, 0.8501048, 1.006505, 0, 0.8431373, 1, 1,
0.04772776, 0.5193549, -0.2513167, 0, 0.8392157, 1, 1,
0.04777114, -0.02066969, 0.9685971, 0, 0.8313726, 1, 1,
0.04777408, 0.1000226, 0.4949027, 0, 0.827451, 1, 1,
0.04781848, -0.2177082, 2.16732, 0, 0.8196079, 1, 1,
0.05626789, 0.9919119, 0.2324296, 0, 0.8156863, 1, 1,
0.05901612, -0.3535188, 0.9727162, 0, 0.8078431, 1, 1,
0.05980615, -1.976961, 2.736093, 0, 0.8039216, 1, 1,
0.06112635, 0.8770881, -0.9537492, 0, 0.7960784, 1, 1,
0.06220257, 0.1211763, 0.6884241, 0, 0.7882353, 1, 1,
0.06332208, 0.8568218, 0.3479892, 0, 0.7843137, 1, 1,
0.06802519, 0.1883887, -0.2148777, 0, 0.7764706, 1, 1,
0.0682578, 0.6280249, -0.4937799, 0, 0.772549, 1, 1,
0.06933349, 0.6096944, -0.7155807, 0, 0.7647059, 1, 1,
0.07105916, 1.627977, -0.6096722, 0, 0.7607843, 1, 1,
0.07170136, 1.400674, 1.372967, 0, 0.7529412, 1, 1,
0.07616322, 0.957141, 0.3911052, 0, 0.7490196, 1, 1,
0.07726038, -1.17392, 4.135339, 0, 0.7411765, 1, 1,
0.07898287, 0.6557466, -0.3172596, 0, 0.7372549, 1, 1,
0.08181304, -0.1682754, 3.829633, 0, 0.7294118, 1, 1,
0.08463573, 0.6307269, -0.2432006, 0, 0.7254902, 1, 1,
0.09201412, 0.1754235, 0.9707593, 0, 0.7176471, 1, 1,
0.09859005, -0.1920321, 3.522102, 0, 0.7137255, 1, 1,
0.09982795, -0.3882653, 3.404672, 0, 0.7058824, 1, 1,
0.1025353, 0.4528994, 1.763683, 0, 0.6980392, 1, 1,
0.1028448, -0.3747563, 3.737831, 0, 0.6941177, 1, 1,
0.1050189, -2.645858, 3.747383, 0, 0.6862745, 1, 1,
0.108032, 2.051616, -2.331853, 0, 0.682353, 1, 1,
0.1119559, -1.992022, 5.61313, 0, 0.6745098, 1, 1,
0.1159221, -1.293388, 3.079185, 0, 0.6705883, 1, 1,
0.1199752, 0.4766694, 1.442877, 0, 0.6627451, 1, 1,
0.1256444, 0.1249246, -0.6072197, 0, 0.6588235, 1, 1,
0.1294, 1.947586, 0.9627294, 0, 0.6509804, 1, 1,
0.1330708, 0.2572974, -0.6332407, 0, 0.6470588, 1, 1,
0.1339709, -0.1238585, 0.5456107, 0, 0.6392157, 1, 1,
0.1384908, 0.207835, -0.4197732, 0, 0.6352941, 1, 1,
0.1421523, -1.014721, 4.10605, 0, 0.627451, 1, 1,
0.1432479, 0.004893779, 0.6503899, 0, 0.6235294, 1, 1,
0.1449571, 0.1776364, 1.213552, 0, 0.6156863, 1, 1,
0.1506101, 1.031015, 1.060954, 0, 0.6117647, 1, 1,
0.1526807, -2.659611, 3.917099, 0, 0.6039216, 1, 1,
0.1535545, 1.465399, 0.682998, 0, 0.5960785, 1, 1,
0.1584748, -1.184359, 2.057744, 0, 0.5921569, 1, 1,
0.1617321, 0.06695156, 1.4678, 0, 0.5843138, 1, 1,
0.1646155, 0.6903379, 0.6106305, 0, 0.5803922, 1, 1,
0.1678046, 0.9654046, 2.308137, 0, 0.572549, 1, 1,
0.181864, -0.3575667, 3.162391, 0, 0.5686275, 1, 1,
0.1825161, 0.4877042, -0.8536223, 0, 0.5607843, 1, 1,
0.1924928, -0.6846652, 2.897898, 0, 0.5568628, 1, 1,
0.1981253, 0.3653736, 1.388352, 0, 0.5490196, 1, 1,
0.2010508, -0.3904871, 3.017303, 0, 0.5450981, 1, 1,
0.2029372, -2.255326, 3.841332, 0, 0.5372549, 1, 1,
0.2040387, 0.7451308, 1.164884, 0, 0.5333334, 1, 1,
0.2126128, -0.424993, 3.376194, 0, 0.5254902, 1, 1,
0.2130938, -0.5614547, 2.197498, 0, 0.5215687, 1, 1,
0.2147421, -0.8487053, 2.675714, 0, 0.5137255, 1, 1,
0.219146, 0.2786986, 0.9145375, 0, 0.509804, 1, 1,
0.2194358, -0.5768006, 2.987752, 0, 0.5019608, 1, 1,
0.2205326, -1.418306, 2.495635, 0, 0.4941176, 1, 1,
0.2205424, 1.12624, 1.807889, 0, 0.4901961, 1, 1,
0.2234877, 0.6407746, -1.360073, 0, 0.4823529, 1, 1,
0.2313897, -2.838099, 2.703786, 0, 0.4784314, 1, 1,
0.2357733, 0.4229857, -0.2967636, 0, 0.4705882, 1, 1,
0.2381393, -1.507139, 3.32889, 0, 0.4666667, 1, 1,
0.2397137, 0.06424702, 0.3776513, 0, 0.4588235, 1, 1,
0.2397838, 0.4524847, 1.552824, 0, 0.454902, 1, 1,
0.2399484, -0.4940205, 1.255288, 0, 0.4470588, 1, 1,
0.2419637, 0.949789, -0.3735484, 0, 0.4431373, 1, 1,
0.2454064, 1.109539, -1.782785, 0, 0.4352941, 1, 1,
0.2455203, 1.552988, -0.4861177, 0, 0.4313726, 1, 1,
0.2483544, -0.359697, 1.1277, 0, 0.4235294, 1, 1,
0.2518608, 0.4924865, 1.848, 0, 0.4196078, 1, 1,
0.2547204, 0.6163566, -0.6188503, 0, 0.4117647, 1, 1,
0.2556967, 1.045805, 1.945638, 0, 0.4078431, 1, 1,
0.2557917, -0.2232504, 2.014568, 0, 0.4, 1, 1,
0.2571782, -0.1481321, 2.895735, 0, 0.3921569, 1, 1,
0.2634281, 1.830101, 1.064467, 0, 0.3882353, 1, 1,
0.2672196, 1.439098, 0.358313, 0, 0.3803922, 1, 1,
0.2698107, -0.2641644, 1.856646, 0, 0.3764706, 1, 1,
0.2737369, 1.272103, -0.2489972, 0, 0.3686275, 1, 1,
0.2747171, -0.4692067, 3.8618, 0, 0.3647059, 1, 1,
0.2749738, -1.732034, 3.632307, 0, 0.3568628, 1, 1,
0.2803803, 0.4670372, 0.2073005, 0, 0.3529412, 1, 1,
0.2803981, 0.685495, -1.017387, 0, 0.345098, 1, 1,
0.2812953, -1.874943, 1.881959, 0, 0.3411765, 1, 1,
0.281414, 1.950545, 0.7307873, 0, 0.3333333, 1, 1,
0.2862415, -0.8182678, 2.841228, 0, 0.3294118, 1, 1,
0.2908141, 1.051134, 0.5832536, 0, 0.3215686, 1, 1,
0.2909772, 0.2895707, 2.13408, 0, 0.3176471, 1, 1,
0.2915283, 1.388993, 0.6827601, 0, 0.3098039, 1, 1,
0.2924151, 1.358298, 1.358741, 0, 0.3058824, 1, 1,
0.2956058, -0.209119, 1.32783, 0, 0.2980392, 1, 1,
0.296458, -0.3260545, 2.801742, 0, 0.2901961, 1, 1,
0.3000225, -0.4471839, 2.495237, 0, 0.2862745, 1, 1,
0.300075, -0.5684151, 3.886807, 0, 0.2784314, 1, 1,
0.3017442, -1.514787, 2.144472, 0, 0.2745098, 1, 1,
0.303018, 0.6590106, -0.5179417, 0, 0.2666667, 1, 1,
0.303097, 0.3606187, -0.1299532, 0, 0.2627451, 1, 1,
0.3103513, 2.070837, 0.005788802, 0, 0.254902, 1, 1,
0.3106669, 2.720354, -0.7442454, 0, 0.2509804, 1, 1,
0.3112735, 1.736818, -0.9451192, 0, 0.2431373, 1, 1,
0.3123807, -0.1822096, 1.52586, 0, 0.2392157, 1, 1,
0.3154661, 0.5465428, 0.6437733, 0, 0.2313726, 1, 1,
0.3169183, 0.1441503, 0.8684069, 0, 0.227451, 1, 1,
0.321226, -0.5283893, 4.599008, 0, 0.2196078, 1, 1,
0.3223773, -0.7569236, 2.740489, 0, 0.2156863, 1, 1,
0.3242601, 0.531609, -0.150187, 0, 0.2078431, 1, 1,
0.3272841, 0.07878547, 1.417129, 0, 0.2039216, 1, 1,
0.3276173, -0.2904416, 3.64836, 0, 0.1960784, 1, 1,
0.3283619, 0.2887221, 0.8974839, 0, 0.1882353, 1, 1,
0.3310046, -0.770871, 3.173174, 0, 0.1843137, 1, 1,
0.331416, 0.924942, -0.1352875, 0, 0.1764706, 1, 1,
0.3338564, -0.3273266, 1.361614, 0, 0.172549, 1, 1,
0.3352202, -0.4615042, 3.18758, 0, 0.1647059, 1, 1,
0.3463849, -0.07036569, 3.09181, 0, 0.1607843, 1, 1,
0.347139, 0.9895767, 2.256233, 0, 0.1529412, 1, 1,
0.3502434, -1.917821, 3.439309, 0, 0.1490196, 1, 1,
0.3565922, 0.4455775, 0.3297186, 0, 0.1411765, 1, 1,
0.3609385, -2.037848, 2.677886, 0, 0.1372549, 1, 1,
0.3673, -0.9072505, 1.474617, 0, 0.1294118, 1, 1,
0.3680102, 1.140412, 1.096808, 0, 0.1254902, 1, 1,
0.3688725, 0.3877417, 1.745914, 0, 0.1176471, 1, 1,
0.3710137, 0.007004984, 0.3976151, 0, 0.1137255, 1, 1,
0.3744511, 1.802743, 0.4247839, 0, 0.1058824, 1, 1,
0.3752056, -0.8585314, 3.426339, 0, 0.09803922, 1, 1,
0.375317, -1.987612, 2.829309, 0, 0.09411765, 1, 1,
0.3812906, -1.744668, 2.149708, 0, 0.08627451, 1, 1,
0.3816271, 0.9169164, 1.179898, 0, 0.08235294, 1, 1,
0.3919068, 0.4207473, -0.2278002, 0, 0.07450981, 1, 1,
0.3929819, 0.4537766, 0.8301594, 0, 0.07058824, 1, 1,
0.3946049, 0.5543474, 0.2553878, 0, 0.0627451, 1, 1,
0.3948874, 2.166523, -0.7162455, 0, 0.05882353, 1, 1,
0.3968264, 0.4560455, 1.182026, 0, 0.05098039, 1, 1,
0.4027423, -0.201424, 3.181277, 0, 0.04705882, 1, 1,
0.4027541, 0.2664627, 1.590796, 0, 0.03921569, 1, 1,
0.4082242, -2.422856, 1.193725, 0, 0.03529412, 1, 1,
0.4090264, -1.011494, 1.878926, 0, 0.02745098, 1, 1,
0.4103832, -0.6678856, 2.523746, 0, 0.02352941, 1, 1,
0.4110191, -0.2244316, 3.399614, 0, 0.01568628, 1, 1,
0.4119235, -0.8022187, 3.962072, 0, 0.01176471, 1, 1,
0.4142932, 2.687533, 0.7332122, 0, 0.003921569, 1, 1,
0.4151596, 1.393817, -0.8963128, 0.003921569, 0, 1, 1,
0.4165688, -0.0812503, 1.237185, 0.007843138, 0, 1, 1,
0.4185371, 0.47825, 1.385934, 0.01568628, 0, 1, 1,
0.4194055, -0.1317448, 1.806642, 0.01960784, 0, 1, 1,
0.4255405, -0.4749348, 2.627435, 0.02745098, 0, 1, 1,
0.4274607, 1.226946, 0.5768667, 0.03137255, 0, 1, 1,
0.4310467, 0.4083546, 0.2273373, 0.03921569, 0, 1, 1,
0.4318138, 0.3723115, -0.693038, 0.04313726, 0, 1, 1,
0.4349005, -0.1275323, 3.864667, 0.05098039, 0, 1, 1,
0.4362303, 1.860947, -0.2414192, 0.05490196, 0, 1, 1,
0.4373264, 0.4956564, 1.395518, 0.0627451, 0, 1, 1,
0.4380077, -1.245481, 3.451104, 0.06666667, 0, 1, 1,
0.4493532, 1.186568, 1.60493, 0.07450981, 0, 1, 1,
0.4560713, 0.230678, 1.733674, 0.07843138, 0, 1, 1,
0.4593103, -0.200143, 2.525915, 0.08627451, 0, 1, 1,
0.4635961, 0.3350012, 1.391849, 0.09019608, 0, 1, 1,
0.4637898, -1.874884, 3.065966, 0.09803922, 0, 1, 1,
0.4648527, -0.3378941, 0.9274383, 0.1058824, 0, 1, 1,
0.4728057, 1.064389, 1.229165, 0.1098039, 0, 1, 1,
0.4790065, 1.545712, -0.6022957, 0.1176471, 0, 1, 1,
0.4790499, 1.251885, 0.6875292, 0.1215686, 0, 1, 1,
0.4802319, 0.281215, 1.808732, 0.1294118, 0, 1, 1,
0.4818542, -1.107621, 0.747373, 0.1333333, 0, 1, 1,
0.4871343, 0.6625066, -0.6333065, 0.1411765, 0, 1, 1,
0.49111, 0.3609995, 1.513976, 0.145098, 0, 1, 1,
0.491506, -1.106518, 1.214204, 0.1529412, 0, 1, 1,
0.4931878, 0.4880782, 1.848999, 0.1568628, 0, 1, 1,
0.4966305, -0.1932926, 3.963968, 0.1647059, 0, 1, 1,
0.498829, -0.009399842, 0.6468242, 0.1686275, 0, 1, 1,
0.4993877, -0.6764498, 2.399784, 0.1764706, 0, 1, 1,
0.5028434, -0.03966514, 0.8140919, 0.1803922, 0, 1, 1,
0.5109931, 0.4850068, 0.4982004, 0.1882353, 0, 1, 1,
0.5236608, 0.3905025, 1.047492, 0.1921569, 0, 1, 1,
0.5269074, 1.87633, -1.065741, 0.2, 0, 1, 1,
0.52716, 1.111536, 1.040918, 0.2078431, 0, 1, 1,
0.5283368, 0.5507265, 1.989703, 0.2117647, 0, 1, 1,
0.5296265, -1.232694, 2.594847, 0.2196078, 0, 1, 1,
0.5343555, 0.9095682, 2.038456, 0.2235294, 0, 1, 1,
0.5365725, -0.7193123, 2.258656, 0.2313726, 0, 1, 1,
0.5378901, 0.03136804, 1.815478, 0.2352941, 0, 1, 1,
0.5393405, 1.357585, 1.042181, 0.2431373, 0, 1, 1,
0.5474044, -1.781957, 2.400298, 0.2470588, 0, 1, 1,
0.5563695, -1.844523, 2.116498, 0.254902, 0, 1, 1,
0.5565227, -0.4138283, 2.459838, 0.2588235, 0, 1, 1,
0.560379, 0.4641405, 1.159424, 0.2666667, 0, 1, 1,
0.565382, 0.8125845, 0.7253355, 0.2705882, 0, 1, 1,
0.5675557, -0.1549719, 1.795715, 0.2784314, 0, 1, 1,
0.5845604, 0.5532816, -0.4901402, 0.282353, 0, 1, 1,
0.5879017, -0.2440408, 2.368491, 0.2901961, 0, 1, 1,
0.5978631, -0.9325524, 5.246682, 0.2941177, 0, 1, 1,
0.5987737, 0.03429866, 1.582521, 0.3019608, 0, 1, 1,
0.6049391, 0.02365249, 1.336051, 0.3098039, 0, 1, 1,
0.6115679, -0.3757506, 2.119117, 0.3137255, 0, 1, 1,
0.626578, -0.6766904, 3.054446, 0.3215686, 0, 1, 1,
0.627245, 1.828915, 0.9530248, 0.3254902, 0, 1, 1,
0.6294761, -2.707386, 4.3959, 0.3333333, 0, 1, 1,
0.6323632, 0.1531261, 1.145972, 0.3372549, 0, 1, 1,
0.6336687, -0.2315394, 2.352653, 0.345098, 0, 1, 1,
0.6353585, 1.690752, 0.01008318, 0.3490196, 0, 1, 1,
0.6361854, 0.5464328, 1.455592, 0.3568628, 0, 1, 1,
0.6463134, -0.6816032, 3.049418, 0.3607843, 0, 1, 1,
0.6507183, 0.5966308, 1.65385, 0.3686275, 0, 1, 1,
0.6511433, 1.137273, 1.231455, 0.372549, 0, 1, 1,
0.6548942, -1.013662, 2.968992, 0.3803922, 0, 1, 1,
0.6556776, 0.0118365, 2.458333, 0.3843137, 0, 1, 1,
0.6596431, 1.245407, 1.678283, 0.3921569, 0, 1, 1,
0.6639693, -1.145388, 2.270185, 0.3960784, 0, 1, 1,
0.6678614, 0.2679662, 0.1915866, 0.4039216, 0, 1, 1,
0.6745557, 0.2156426, 0.9341529, 0.4117647, 0, 1, 1,
0.6761549, 0.1185927, 1.95182, 0.4156863, 0, 1, 1,
0.6776507, -0.3119835, 2.161546, 0.4235294, 0, 1, 1,
0.6786389, -0.7750885, 4.399453, 0.427451, 0, 1, 1,
0.683439, -0.5223194, 2.231059, 0.4352941, 0, 1, 1,
0.6862786, -1.070282, 3.426847, 0.4392157, 0, 1, 1,
0.6936027, -1.545756, 0.9215842, 0.4470588, 0, 1, 1,
0.6938346, 0.517336, -0.01252923, 0.4509804, 0, 1, 1,
0.6940238, -0.02477984, 3.015525, 0.4588235, 0, 1, 1,
0.694056, 0.245938, 0.5832148, 0.4627451, 0, 1, 1,
0.6953313, 0.6134579, 2.020314, 0.4705882, 0, 1, 1,
0.6957416, 0.5645062, 0.5354515, 0.4745098, 0, 1, 1,
0.6981397, 0.3782101, 1.509314, 0.4823529, 0, 1, 1,
0.7018573, -0.09314466, 2.83967, 0.4862745, 0, 1, 1,
0.7030663, 0.08152188, 1.167969, 0.4941176, 0, 1, 1,
0.7040962, 0.4520974, 3.123506, 0.5019608, 0, 1, 1,
0.7043275, 1.556763, 2.805471, 0.5058824, 0, 1, 1,
0.7051482, -0.6810771, 1.29775, 0.5137255, 0, 1, 1,
0.7237601, 0.03639258, 1.658509, 0.5176471, 0, 1, 1,
0.731455, -0.09132523, 0.7986572, 0.5254902, 0, 1, 1,
0.7339564, 0.5216334, 1.375858, 0.5294118, 0, 1, 1,
0.7386224, 1.705559, -1.369207, 0.5372549, 0, 1, 1,
0.7430293, 0.004726247, 0.5769721, 0.5411765, 0, 1, 1,
0.7446247, -0.1165763, 2.325054, 0.5490196, 0, 1, 1,
0.7481549, 0.7146587, -0.1634823, 0.5529412, 0, 1, 1,
0.7560028, -0.1279144, 0.3602727, 0.5607843, 0, 1, 1,
0.7594938, -0.5153493, -0.9747882, 0.5647059, 0, 1, 1,
0.7697427, 0.8831542, -0.08165227, 0.572549, 0, 1, 1,
0.7705445, -0.2589287, 2.498004, 0.5764706, 0, 1, 1,
0.7722197, 0.2078238, 2.57633, 0.5843138, 0, 1, 1,
0.7729041, 0.5174266, 0.4334868, 0.5882353, 0, 1, 1,
0.7864041, 0.1625367, 1.027579, 0.5960785, 0, 1, 1,
0.7869949, -0.2273962, 2.300114, 0.6039216, 0, 1, 1,
0.7891998, 1.291731, -1.147967, 0.6078432, 0, 1, 1,
0.7900744, 0.2255693, 1.485995, 0.6156863, 0, 1, 1,
0.8048218, -1.475322, 1.894795, 0.6196079, 0, 1, 1,
0.8077883, -0.9766976, 4.778275, 0.627451, 0, 1, 1,
0.8080921, 0.3467756, 2.259147, 0.6313726, 0, 1, 1,
0.816745, -1.4183, 3.383711, 0.6392157, 0, 1, 1,
0.8208445, -0.3716387, 3.242188, 0.6431373, 0, 1, 1,
0.8225384, 0.8106822, -0.6349252, 0.6509804, 0, 1, 1,
0.82271, -0.1509751, 2.543355, 0.654902, 0, 1, 1,
0.8257667, -0.8286636, 1.731528, 0.6627451, 0, 1, 1,
0.829143, -1.630934, 4.076112, 0.6666667, 0, 1, 1,
0.8301123, 0.1808331, 4.326429, 0.6745098, 0, 1, 1,
0.8349491, 1.344486, 0.0058876, 0.6784314, 0, 1, 1,
0.8456631, 1.08939, 1.75181, 0.6862745, 0, 1, 1,
0.8499033, -0.3424569, 1.168195, 0.6901961, 0, 1, 1,
0.8542398, 0.3792476, -0.946429, 0.6980392, 0, 1, 1,
0.8549266, 1.822845, 1.748027, 0.7058824, 0, 1, 1,
0.8551252, -0.1075737, 2.191741, 0.7098039, 0, 1, 1,
0.8552867, -1.029479, 2.357832, 0.7176471, 0, 1, 1,
0.8575504, -0.06033934, 1.386342, 0.7215686, 0, 1, 1,
0.859664, -0.8813853, 1.846152, 0.7294118, 0, 1, 1,
0.8599, -0.454163, 3.037645, 0.7333333, 0, 1, 1,
0.8601397, 0.4009403, 1.962744, 0.7411765, 0, 1, 1,
0.8646973, -1.589641, 1.30834, 0.7450981, 0, 1, 1,
0.8655717, 0.7275336, 0.6013647, 0.7529412, 0, 1, 1,
0.8669636, 1.030799, 0.5132827, 0.7568628, 0, 1, 1,
0.8679636, 1.586847, 0.4214603, 0.7647059, 0, 1, 1,
0.8684512, -1.973574, 3.204987, 0.7686275, 0, 1, 1,
0.875138, -0.3656574, 3.986782, 0.7764706, 0, 1, 1,
0.8773603, -1.28043, 2.474874, 0.7803922, 0, 1, 1,
0.8783919, 0.1203257, 2.097178, 0.7882353, 0, 1, 1,
0.8790146, 0.03106369, 3.269075, 0.7921569, 0, 1, 1,
0.8791247, -0.1405849, 2.587322, 0.8, 0, 1, 1,
0.8814179, -1.884076, 4.190126, 0.8078431, 0, 1, 1,
0.8838315, 0.1332828, 1.82217, 0.8117647, 0, 1, 1,
0.8883048, -0.02270074, 0.8097602, 0.8196079, 0, 1, 1,
0.8893579, 2.371804, 0.4095306, 0.8235294, 0, 1, 1,
0.893119, 0.4308307, -0.1541938, 0.8313726, 0, 1, 1,
0.897966, -0.6612928, 0.656652, 0.8352941, 0, 1, 1,
0.8982005, 1.35571, 0.430575, 0.8431373, 0, 1, 1,
0.9015344, -1.044928, 2.794359, 0.8470588, 0, 1, 1,
0.9081628, 0.2940157, 0.5367451, 0.854902, 0, 1, 1,
0.9083382, -1.680233, 3.337126, 0.8588235, 0, 1, 1,
0.9106656, -0.3987491, 3.779392, 0.8666667, 0, 1, 1,
0.9126883, 1.946131, 0.9477244, 0.8705882, 0, 1, 1,
0.9175248, 0.9280121, 1.833483, 0.8784314, 0, 1, 1,
0.9184994, 1.321223, 1.271388, 0.8823529, 0, 1, 1,
0.9204581, 1.367177, 0.09435918, 0.8901961, 0, 1, 1,
0.9260163, -0.3089683, 1.309211, 0.8941177, 0, 1, 1,
0.933463, -0.2911499, 2.5652, 0.9019608, 0, 1, 1,
0.9339519, 0.4747143, 0.7018248, 0.9098039, 0, 1, 1,
0.9384995, 1.696047, -0.4355187, 0.9137255, 0, 1, 1,
0.9404048, 0.3647793, 0.6097105, 0.9215686, 0, 1, 1,
0.9497843, -0.6403123, 1.442864, 0.9254902, 0, 1, 1,
0.9517881, 0.7872997, 0.9131411, 0.9333333, 0, 1, 1,
0.953895, -1.277548, 0.1489688, 0.9372549, 0, 1, 1,
0.9595416, -0.2422915, 0.9853708, 0.945098, 0, 1, 1,
0.9600223, 0.5105648, -0.8464593, 0.9490196, 0, 1, 1,
0.9630819, 0.04420832, 2.280833, 0.9568627, 0, 1, 1,
0.9654303, 1.041629, -0.7246631, 0.9607843, 0, 1, 1,
0.9717258, -0.7996891, 3.428108, 0.9686275, 0, 1, 1,
0.9731396, 0.03225078, 1.599874, 0.972549, 0, 1, 1,
0.9736963, 0.9897604, 0.7592334, 0.9803922, 0, 1, 1,
0.9764336, -0.37979, 3.196795, 0.9843137, 0, 1, 1,
0.9784681, -0.6504266, 1.819139, 0.9921569, 0, 1, 1,
0.9938821, 0.6286818, 1.255991, 0.9960784, 0, 1, 1,
0.9998036, 0.5319051, 0.001614211, 1, 0, 0.9960784, 1,
1.007149, -0.1934021, 1.579716, 1, 0, 0.9882353, 1,
1.008078, -0.6402829, 3.94637, 1, 0, 0.9843137, 1,
1.011167, 0.9036922, 1.548589, 1, 0, 0.9764706, 1,
1.014103, -0.430544, 3.387265, 1, 0, 0.972549, 1,
1.015843, -0.5590013, 1.964055, 1, 0, 0.9647059, 1,
1.02793, -1.705558, 3.161972, 1, 0, 0.9607843, 1,
1.029591, 0.8040239, 0.2872134, 1, 0, 0.9529412, 1,
1.031358, -0.347429, 1.718142, 1, 0, 0.9490196, 1,
1.031619, -0.8492838, 2.494499, 1, 0, 0.9411765, 1,
1.032188, 1.051696, 0.6363372, 1, 0, 0.9372549, 1,
1.044363, -0.5863092, 2.58954, 1, 0, 0.9294118, 1,
1.050648, -0.8833156, 2.074054, 1, 0, 0.9254902, 1,
1.053291, 1.11957, -1.360252, 1, 0, 0.9176471, 1,
1.054611, -1.224092, 2.699547, 1, 0, 0.9137255, 1,
1.054993, -0.9126781, 2.097827, 1, 0, 0.9058824, 1,
1.061237, -0.3415941, 2.596111, 1, 0, 0.9019608, 1,
1.067422, 0.5006001, 1.450982, 1, 0, 0.8941177, 1,
1.069689, 0.04182383, 1.834161, 1, 0, 0.8862745, 1,
1.071235, 0.8054169, 1.067968, 1, 0, 0.8823529, 1,
1.072828, 1.062902, 1.680649, 1, 0, 0.8745098, 1,
1.079693, -1.557135, 2.439459, 1, 0, 0.8705882, 1,
1.081757, -1.801336, 3.032482, 1, 0, 0.8627451, 1,
1.083024, -1.355235, 2.247259, 1, 0, 0.8588235, 1,
1.083133, -0.1155409, 3.327822, 1, 0, 0.8509804, 1,
1.085607, 0.640584, 1.06512, 1, 0, 0.8470588, 1,
1.093758, 1.049051, -0.7517481, 1, 0, 0.8392157, 1,
1.098394, -1.858029, 2.468611, 1, 0, 0.8352941, 1,
1.099679, 0.4052728, 1.286693, 1, 0, 0.827451, 1,
1.103486, 1.080459, 1.825427, 1, 0, 0.8235294, 1,
1.104651, -1.677683, 1.438393, 1, 0, 0.8156863, 1,
1.106929, 0.3114929, -0.1956837, 1, 0, 0.8117647, 1,
1.108075, -0.7856106, 4.992128, 1, 0, 0.8039216, 1,
1.12026, -0.3766367, 2.107468, 1, 0, 0.7960784, 1,
1.120631, 0.1511763, -1.104739, 1, 0, 0.7921569, 1,
1.132151, 0.8527895, 0.1061749, 1, 0, 0.7843137, 1,
1.156238, 0.2045638, 1.62638, 1, 0, 0.7803922, 1,
1.156958, -0.0871201, 1.667513, 1, 0, 0.772549, 1,
1.157942, -0.262558, 2.380587, 1, 0, 0.7686275, 1,
1.160451, -0.1615392, 2.08445, 1, 0, 0.7607843, 1,
1.164273, -0.6879839, 1.584835, 1, 0, 0.7568628, 1,
1.164928, 0.173335, -0.4922528, 1, 0, 0.7490196, 1,
1.177886, 1.051379, 1.2416, 1, 0, 0.7450981, 1,
1.179448, -0.1275241, 3.16125, 1, 0, 0.7372549, 1,
1.18009, -0.07337376, 2.48088, 1, 0, 0.7333333, 1,
1.180252, 0.9300352, 1.845235, 1, 0, 0.7254902, 1,
1.185819, 1.911115, -0.3154781, 1, 0, 0.7215686, 1,
1.189739, -0.9287297, 2.856682, 1, 0, 0.7137255, 1,
1.192797, -0.399573, 0.8721041, 1, 0, 0.7098039, 1,
1.19662, -2.411959, 5.289153, 1, 0, 0.7019608, 1,
1.197002, -0.6516067, 1.510675, 1, 0, 0.6941177, 1,
1.197798, -0.08528572, 2.234714, 1, 0, 0.6901961, 1,
1.200875, -1.28628, 1.239916, 1, 0, 0.682353, 1,
1.203069, 1.012267, 0.7198036, 1, 0, 0.6784314, 1,
1.212491, -0.384613, 2.002242, 1, 0, 0.6705883, 1,
1.218382, -0.3357327, 1.814158, 1, 0, 0.6666667, 1,
1.24199, 0.06925326, 2.652053, 1, 0, 0.6588235, 1,
1.248048, -0.1346138, 1.695378, 1, 0, 0.654902, 1,
1.252126, 0.9443237, -0.9110436, 1, 0, 0.6470588, 1,
1.254638, -0.8048079, 2.887801, 1, 0, 0.6431373, 1,
1.255732, -0.4410535, 2.198221, 1, 0, 0.6352941, 1,
1.258729, -0.7344475, 3.26881, 1, 0, 0.6313726, 1,
1.263199, -0.5340861, 1.048059, 1, 0, 0.6235294, 1,
1.271107, 0.9913895, -0.4757213, 1, 0, 0.6196079, 1,
1.272593, -1.398244, 2.501585, 1, 0, 0.6117647, 1,
1.285474, 0.134056, 3.041203, 1, 0, 0.6078432, 1,
1.288409, 0.1257908, 2.603687, 1, 0, 0.6, 1,
1.289397, 0.05677762, 1.896114, 1, 0, 0.5921569, 1,
1.304729, -0.3747156, 2.263857, 1, 0, 0.5882353, 1,
1.305374, -1.074163, 2.013589, 1, 0, 0.5803922, 1,
1.310865, 1.252677, 1.591759, 1, 0, 0.5764706, 1,
1.325328, -0.6982672, 1.618776, 1, 0, 0.5686275, 1,
1.326092, -1.18202, 0.4005243, 1, 0, 0.5647059, 1,
1.364637, 0.5904848, 0.3313224, 1, 0, 0.5568628, 1,
1.367654, 0.5461782, 1.078286, 1, 0, 0.5529412, 1,
1.373598, 0.2871318, 1.903672, 1, 0, 0.5450981, 1,
1.375405, 0.6255466, -0.09272613, 1, 0, 0.5411765, 1,
1.376968, 0.7292879, -0.3826865, 1, 0, 0.5333334, 1,
1.377541, 0.4741416, 1.243915, 1, 0, 0.5294118, 1,
1.377855, -0.5170946, 1.822118, 1, 0, 0.5215687, 1,
1.379252, 0.7325913, 2.953284, 1, 0, 0.5176471, 1,
1.383799, 0.933832, 0.6887664, 1, 0, 0.509804, 1,
1.390587, 0.297934, 1.775836, 1, 0, 0.5058824, 1,
1.393064, 0.06498065, 1.171007, 1, 0, 0.4980392, 1,
1.398135, -1.207054, 1.694182, 1, 0, 0.4901961, 1,
1.408424, 0.2953181, 2.007437, 1, 0, 0.4862745, 1,
1.416274, -0.8149332, 3.174919, 1, 0, 0.4784314, 1,
1.422843, 0.4871166, 0.674519, 1, 0, 0.4745098, 1,
1.456141, -0.4853192, 3.108234, 1, 0, 0.4666667, 1,
1.45643, 0.4872857, 0.653097, 1, 0, 0.4627451, 1,
1.460658, -1.246681, 0.3068131, 1, 0, 0.454902, 1,
1.462808, -2.417124, 1.783384, 1, 0, 0.4509804, 1,
1.474699, -0.8468861, 1.511331, 1, 0, 0.4431373, 1,
1.474861, -0.4102977, 2.835805, 1, 0, 0.4392157, 1,
1.481015, -0.7953815, 2.402883, 1, 0, 0.4313726, 1,
1.494131, -0.8027171, -0.1567266, 1, 0, 0.427451, 1,
1.515787, 0.6521485, -0.281207, 1, 0, 0.4196078, 1,
1.522418, 1.488458, 0.5462481, 1, 0, 0.4156863, 1,
1.533302, 2.403972, 1.50439, 1, 0, 0.4078431, 1,
1.53824, -0.7243989, 1.87747, 1, 0, 0.4039216, 1,
1.54437, -0.5423453, 2.394069, 1, 0, 0.3960784, 1,
1.547027, 0.4711686, 0.8484963, 1, 0, 0.3882353, 1,
1.559529, -1.333384, 1.509246, 1, 0, 0.3843137, 1,
1.56046, 0.6749605, 1.725813, 1, 0, 0.3764706, 1,
1.565044, -0.9384481, 2.798006, 1, 0, 0.372549, 1,
1.568322, -0.4176979, 1.297324, 1, 0, 0.3647059, 1,
1.577684, -0.9107884, 2.893531, 1, 0, 0.3607843, 1,
1.605972, 0.2745667, 1.75211, 1, 0, 0.3529412, 1,
1.606451, -0.2054952, 1.105288, 1, 0, 0.3490196, 1,
1.618948, -1.338045, 3.943459, 1, 0, 0.3411765, 1,
1.621246, 1.772739, 0.8885363, 1, 0, 0.3372549, 1,
1.621931, -0.4155181, 1.076817, 1, 0, 0.3294118, 1,
1.625318, -1.723665, 2.596244, 1, 0, 0.3254902, 1,
1.630116, -2.723646, 1.742404, 1, 0, 0.3176471, 1,
1.636469, -0.6867056, 1.356469, 1, 0, 0.3137255, 1,
1.639229, -0.3101909, 1.234982, 1, 0, 0.3058824, 1,
1.650019, -1.38226, 0.7622641, 1, 0, 0.2980392, 1,
1.668829, 0.7423805, 0.3929674, 1, 0, 0.2941177, 1,
1.66984, -1.066592, 3.228476, 1, 0, 0.2862745, 1,
1.676781, 0.4795362, 0.5358072, 1, 0, 0.282353, 1,
1.683338, 1.087063, 1.517314, 1, 0, 0.2745098, 1,
1.685694, -0.6587899, 0.8946154, 1, 0, 0.2705882, 1,
1.700546, 0.1863673, 0.04923686, 1, 0, 0.2627451, 1,
1.701898, 1.001604, 1.167819, 1, 0, 0.2588235, 1,
1.70191, 1.315957, 3.446346, 1, 0, 0.2509804, 1,
1.709616, -0.6578429, 0.7078084, 1, 0, 0.2470588, 1,
1.753529, -1.197684, 1.660721, 1, 0, 0.2392157, 1,
1.770731, -0.7957352, 1.977934, 1, 0, 0.2352941, 1,
1.771015, -0.5830539, 4.227726, 1, 0, 0.227451, 1,
1.776396, 0.1765979, 2.396572, 1, 0, 0.2235294, 1,
1.778946, 0.1485846, 0.3855081, 1, 0, 0.2156863, 1,
1.785686, -0.7193714, 3.783352, 1, 0, 0.2117647, 1,
1.807536, 1.131393, -0.609705, 1, 0, 0.2039216, 1,
1.816041, -0.945169, 3.161518, 1, 0, 0.1960784, 1,
1.832829, -1.13469, 3.520706, 1, 0, 0.1921569, 1,
1.849595, 0.8372818, 1.373533, 1, 0, 0.1843137, 1,
1.851689, 1.678899, 1.265998, 1, 0, 0.1803922, 1,
1.867149, -2.142905, 3.119144, 1, 0, 0.172549, 1,
1.937315, -0.9307255, 2.436543, 1, 0, 0.1686275, 1,
1.941666, -1.212178, 1.198318, 1, 0, 0.1607843, 1,
1.947228, 0.03797128, 2.655676, 1, 0, 0.1568628, 1,
1.992024, 0.636055, 2.391271, 1, 0, 0.1490196, 1,
2.015461, 0.54294, 3.185938, 1, 0, 0.145098, 1,
2.017472, 0.1509964, 0.7368927, 1, 0, 0.1372549, 1,
2.018833, 1.901074, 1.037653, 1, 0, 0.1333333, 1,
2.025749, 0.5597162, 0.5594162, 1, 0, 0.1254902, 1,
2.037202, 0.5707732, 1.491366, 1, 0, 0.1215686, 1,
2.051692, 0.817478, 2.468483, 1, 0, 0.1137255, 1,
2.077776, 0.1805416, 0.4528596, 1, 0, 0.1098039, 1,
2.080403, -2.912991, 3.567741, 1, 0, 0.1019608, 1,
2.164257, -1.162551, 4.352859, 1, 0, 0.09411765, 1,
2.239187, -0.611498, 1.276252, 1, 0, 0.09019608, 1,
2.286965, 0.8461308, 1.840261, 1, 0, 0.08235294, 1,
2.303395, -0.8277224, 0.8707867, 1, 0, 0.07843138, 1,
2.314551, -0.03010989, 0.8118942, 1, 0, 0.07058824, 1,
2.341326, 0.7038707, 2.276916, 1, 0, 0.06666667, 1,
2.401769, -1.336345, 2.892809, 1, 0, 0.05882353, 1,
2.403714, -0.7462099, 3.561761, 1, 0, 0.05490196, 1,
2.518475, -0.5158198, 2.197194, 1, 0, 0.04705882, 1,
2.593792, -0.1886145, 2.155502, 1, 0, 0.04313726, 1,
2.628519, 1.050444, -0.2418567, 1, 0, 0.03529412, 1,
2.725292, -0.9931892, 1.875526, 1, 0, 0.03137255, 1,
2.831302, 2.08423, 1.163515, 1, 0, 0.02352941, 1,
2.882291, -1.154688, 2.112176, 1, 0, 0.01960784, 1,
3.024745, 1.088251, 0.5995876, 1, 0, 0.01176471, 1,
3.071588, 0.06084384, 0.4635895, 1, 0, 0.007843138, 1
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
0.07130134, -3.889692, -7.074279, 0, -0.5, 0.5, 0.5,
0.07130134, -3.889692, -7.074279, 1, -0.5, 0.5, 0.5,
0.07130134, -3.889692, -7.074279, 1, 1.5, 0.5, 0.5,
0.07130134, -3.889692, -7.074279, 0, 1.5, 0.5, 0.5
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
-3.946083, -0.03186703, -7.074279, 0, -0.5, 0.5, 0.5,
-3.946083, -0.03186703, -7.074279, 1, -0.5, 0.5, 0.5,
-3.946083, -0.03186703, -7.074279, 1, 1.5, 0.5, 0.5,
-3.946083, -0.03186703, -7.074279, 0, 1.5, 0.5, 0.5
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
-3.946083, -3.889692, 0.1888421, 0, -0.5, 0.5, 0.5,
-3.946083, -3.889692, 0.1888421, 1, -0.5, 0.5, 0.5,
-3.946083, -3.889692, 0.1888421, 1, 1.5, 0.5, 0.5,
-3.946083, -3.889692, 0.1888421, 0, 1.5, 0.5, 0.5
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
-2, -2.999424, -5.398174,
3, -2.999424, -5.398174,
-2, -2.999424, -5.398174,
-2, -3.147802, -5.677525,
-1, -2.999424, -5.398174,
-1, -3.147802, -5.677525,
0, -2.999424, -5.398174,
0, -3.147802, -5.677525,
1, -2.999424, -5.398174,
1, -3.147802, -5.677525,
2, -2.999424, -5.398174,
2, -3.147802, -5.677525,
3, -2.999424, -5.398174,
3, -3.147802, -5.677525
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
-2, -3.444558, -6.236227, 0, -0.5, 0.5, 0.5,
-2, -3.444558, -6.236227, 1, -0.5, 0.5, 0.5,
-2, -3.444558, -6.236227, 1, 1.5, 0.5, 0.5,
-2, -3.444558, -6.236227, 0, 1.5, 0.5, 0.5,
-1, -3.444558, -6.236227, 0, -0.5, 0.5, 0.5,
-1, -3.444558, -6.236227, 1, -0.5, 0.5, 0.5,
-1, -3.444558, -6.236227, 1, 1.5, 0.5, 0.5,
-1, -3.444558, -6.236227, 0, 1.5, 0.5, 0.5,
0, -3.444558, -6.236227, 0, -0.5, 0.5, 0.5,
0, -3.444558, -6.236227, 1, -0.5, 0.5, 0.5,
0, -3.444558, -6.236227, 1, 1.5, 0.5, 0.5,
0, -3.444558, -6.236227, 0, 1.5, 0.5, 0.5,
1, -3.444558, -6.236227, 0, -0.5, 0.5, 0.5,
1, -3.444558, -6.236227, 1, -0.5, 0.5, 0.5,
1, -3.444558, -6.236227, 1, 1.5, 0.5, 0.5,
1, -3.444558, -6.236227, 0, 1.5, 0.5, 0.5,
2, -3.444558, -6.236227, 0, -0.5, 0.5, 0.5,
2, -3.444558, -6.236227, 1, -0.5, 0.5, 0.5,
2, -3.444558, -6.236227, 1, 1.5, 0.5, 0.5,
2, -3.444558, -6.236227, 0, 1.5, 0.5, 0.5,
3, -3.444558, -6.236227, 0, -0.5, 0.5, 0.5,
3, -3.444558, -6.236227, 1, -0.5, 0.5, 0.5,
3, -3.444558, -6.236227, 1, 1.5, 0.5, 0.5,
3, -3.444558, -6.236227, 0, 1.5, 0.5, 0.5
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
-3.018994, -2, -5.398174,
-3.018994, 2, -5.398174,
-3.018994, -2, -5.398174,
-3.173509, -2, -5.677525,
-3.018994, -1, -5.398174,
-3.173509, -1, -5.677525,
-3.018994, 0, -5.398174,
-3.173509, 0, -5.677525,
-3.018994, 1, -5.398174,
-3.173509, 1, -5.677525,
-3.018994, 2, -5.398174,
-3.173509, 2, -5.677525
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
-3.482538, -2, -6.236227, 0, -0.5, 0.5, 0.5,
-3.482538, -2, -6.236227, 1, -0.5, 0.5, 0.5,
-3.482538, -2, -6.236227, 1, 1.5, 0.5, 0.5,
-3.482538, -2, -6.236227, 0, 1.5, 0.5, 0.5,
-3.482538, -1, -6.236227, 0, -0.5, 0.5, 0.5,
-3.482538, -1, -6.236227, 1, -0.5, 0.5, 0.5,
-3.482538, -1, -6.236227, 1, 1.5, 0.5, 0.5,
-3.482538, -1, -6.236227, 0, 1.5, 0.5, 0.5,
-3.482538, 0, -6.236227, 0, -0.5, 0.5, 0.5,
-3.482538, 0, -6.236227, 1, -0.5, 0.5, 0.5,
-3.482538, 0, -6.236227, 1, 1.5, 0.5, 0.5,
-3.482538, 0, -6.236227, 0, 1.5, 0.5, 0.5,
-3.482538, 1, -6.236227, 0, -0.5, 0.5, 0.5,
-3.482538, 1, -6.236227, 1, -0.5, 0.5, 0.5,
-3.482538, 1, -6.236227, 1, 1.5, 0.5, 0.5,
-3.482538, 1, -6.236227, 0, 1.5, 0.5, 0.5,
-3.482538, 2, -6.236227, 0, -0.5, 0.5, 0.5,
-3.482538, 2, -6.236227, 1, -0.5, 0.5, 0.5,
-3.482538, 2, -6.236227, 1, 1.5, 0.5, 0.5,
-3.482538, 2, -6.236227, 0, 1.5, 0.5, 0.5
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
-3.018994, -2.999424, -4,
-3.018994, -2.999424, 4,
-3.018994, -2.999424, -4,
-3.173509, -3.147802, -4,
-3.018994, -2.999424, -2,
-3.173509, -3.147802, -2,
-3.018994, -2.999424, 0,
-3.173509, -3.147802, 0,
-3.018994, -2.999424, 2,
-3.173509, -3.147802, 2,
-3.018994, -2.999424, 4,
-3.173509, -3.147802, 4
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
-3.482538, -3.444558, -4, 0, -0.5, 0.5, 0.5,
-3.482538, -3.444558, -4, 1, -0.5, 0.5, 0.5,
-3.482538, -3.444558, -4, 1, 1.5, 0.5, 0.5,
-3.482538, -3.444558, -4, 0, 1.5, 0.5, 0.5,
-3.482538, -3.444558, -2, 0, -0.5, 0.5, 0.5,
-3.482538, -3.444558, -2, 1, -0.5, 0.5, 0.5,
-3.482538, -3.444558, -2, 1, 1.5, 0.5, 0.5,
-3.482538, -3.444558, -2, 0, 1.5, 0.5, 0.5,
-3.482538, -3.444558, 0, 0, -0.5, 0.5, 0.5,
-3.482538, -3.444558, 0, 1, -0.5, 0.5, 0.5,
-3.482538, -3.444558, 0, 1, 1.5, 0.5, 0.5,
-3.482538, -3.444558, 0, 0, 1.5, 0.5, 0.5,
-3.482538, -3.444558, 2, 0, -0.5, 0.5, 0.5,
-3.482538, -3.444558, 2, 1, -0.5, 0.5, 0.5,
-3.482538, -3.444558, 2, 1, 1.5, 0.5, 0.5,
-3.482538, -3.444558, 2, 0, 1.5, 0.5, 0.5,
-3.482538, -3.444558, 4, 0, -0.5, 0.5, 0.5,
-3.482538, -3.444558, 4, 1, -0.5, 0.5, 0.5,
-3.482538, -3.444558, 4, 1, 1.5, 0.5, 0.5,
-3.482538, -3.444558, 4, 0, 1.5, 0.5, 0.5
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
-3.018994, -2.999424, -5.398174,
-3.018994, 2.93569, -5.398174,
-3.018994, -2.999424, 5.775858,
-3.018994, 2.93569, 5.775858,
-3.018994, -2.999424, -5.398174,
-3.018994, -2.999424, 5.775858,
-3.018994, 2.93569, -5.398174,
-3.018994, 2.93569, 5.775858,
-3.018994, -2.999424, -5.398174,
3.161597, -2.999424, -5.398174,
-3.018994, -2.999424, 5.775858,
3.161597, -2.999424, 5.775858,
-3.018994, 2.93569, -5.398174,
3.161597, 2.93569, -5.398174,
-3.018994, 2.93569, 5.775858,
3.161597, 2.93569, 5.775858,
3.161597, -2.999424, -5.398174,
3.161597, 2.93569, -5.398174,
3.161597, -2.999424, 5.775858,
3.161597, 2.93569, 5.775858,
3.161597, -2.999424, -5.398174,
3.161597, -2.999424, 5.775858,
3.161597, 2.93569, -5.398174,
3.161597, 2.93569, 5.775858
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
var radius = 7.519165;
var distance = 33.45362;
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
mvMatrix.translate( -0.07130134, 0.03186703, -0.1888421 );
mvMatrix.scale( 1.315387, 1.369791, 0.727568 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.45362);
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
carbamate_1-methylet<-read.table("carbamate_1-methylet.xyz", skip=1)
```

```
## Error in read.table("carbamate_1-methylet.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-carbamate_1-methylet$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbamate_1' not found
```

```r
y<-carbamate_1-methylet$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbamate_1' not found
```

```r
z<-carbamate_1-methylet$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbamate_1' not found
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
-2.928986, 0.815323, -2.130431, 0, 0, 1, 1, 1,
-2.9145, 0.002085945, -0.948081, 1, 0, 0, 1, 1,
-2.685933, 0.665803, -3.190667, 1, 0, 0, 1, 1,
-2.628796, -0.8350584, -1.801824, 1, 0, 0, 1, 1,
-2.560353, 0.2741419, -1.687852, 1, 0, 0, 1, 1,
-2.491434, -1.08626, -1.93436, 1, 0, 0, 1, 1,
-2.340381, -0.1041472, -1.540497, 0, 0, 0, 1, 1,
-2.322628, -0.916287, 0.3973171, 0, 0, 0, 1, 1,
-2.285808, -1.221571, -0.488094, 0, 0, 0, 1, 1,
-2.264492, -0.2857108, -1.451518, 0, 0, 0, 1, 1,
-2.214413, -1.269269, -2.295877, 0, 0, 0, 1, 1,
-2.214122, 0.07299462, -2.242016, 0, 0, 0, 1, 1,
-2.207007, 0.1273596, -1.825328, 0, 0, 0, 1, 1,
-2.148584, -0.9721766, -2.524325, 1, 1, 1, 1, 1,
-2.048541, -0.5790353, -1.929688, 1, 1, 1, 1, 1,
-2.033729, 0.09226353, -2.679253, 1, 1, 1, 1, 1,
-2.023012, 1.57315, -0.2650525, 1, 1, 1, 1, 1,
-1.99257, -0.0412442, -2.959057, 1, 1, 1, 1, 1,
-1.973404, -0.8242055, -2.483179, 1, 1, 1, 1, 1,
-1.969034, -0.4307146, -2.46295, 1, 1, 1, 1, 1,
-1.961049, -2.32547, -2.094891, 1, 1, 1, 1, 1,
-1.952834, 1.26626, -2.682172, 1, 1, 1, 1, 1,
-1.945458, -0.04151805, -1.417092, 1, 1, 1, 1, 1,
-1.925057, 1.167046, 0.591307, 1, 1, 1, 1, 1,
-1.921213, -0.3973005, -1.990826, 1, 1, 1, 1, 1,
-1.889097, -0.4007547, -1.91508, 1, 1, 1, 1, 1,
-1.876611, 1.575724, -1.548247, 1, 1, 1, 1, 1,
-1.862413, -1.217754, -2.629991, 1, 1, 1, 1, 1,
-1.86049, -0.4622911, -1.914213, 0, 0, 1, 1, 1,
-1.838083, -1.647078, -1.967368, 1, 0, 0, 1, 1,
-1.829917, 1.277094, 0.3796929, 1, 0, 0, 1, 1,
-1.826917, -1.188214, -2.547378, 1, 0, 0, 1, 1,
-1.813172, -0.6811009, -2.236065, 1, 0, 0, 1, 1,
-1.792786, -0.2243799, -3.047438, 1, 0, 0, 1, 1,
-1.77904, 0.4945109, -1.904416, 0, 0, 0, 1, 1,
-1.771303, 1.347901, -2.068986, 0, 0, 0, 1, 1,
-1.73602, -0.8007679, -1.833606, 0, 0, 0, 1, 1,
-1.708302, 0.7207465, -1.596266, 0, 0, 0, 1, 1,
-1.704256, 0.762171, -1.603164, 0, 0, 0, 1, 1,
-1.68778, 0.03283689, -2.229422, 0, 0, 0, 1, 1,
-1.669935, -0.6155291, -2.226452, 0, 0, 0, 1, 1,
-1.664117, -1.082249, -2.466222, 1, 1, 1, 1, 1,
-1.649568, -0.7180958, -2.868598, 1, 1, 1, 1, 1,
-1.645202, 1.544544, -2.328817, 1, 1, 1, 1, 1,
-1.631125, -1.425839, -2.709116, 1, 1, 1, 1, 1,
-1.621405, -2.061136, -3.850329, 1, 1, 1, 1, 1,
-1.617417, 1.420915, -0.9444857, 1, 1, 1, 1, 1,
-1.607015, 1.167384, -1.761654, 1, 1, 1, 1, 1,
-1.565404, -0.07372215, -1.20683, 1, 1, 1, 1, 1,
-1.563393, 0.1955685, -0.6236913, 1, 1, 1, 1, 1,
-1.54379, 0.1892599, -2.291407, 1, 1, 1, 1, 1,
-1.543369, -0.632238, -2.081157, 1, 1, 1, 1, 1,
-1.531834, -1.731009, -2.752757, 1, 1, 1, 1, 1,
-1.508309, 1.302975, -0.3960553, 1, 1, 1, 1, 1,
-1.496285, -1.003019, -3.056866, 1, 1, 1, 1, 1,
-1.494204, 0.2557179, -1.837406, 1, 1, 1, 1, 1,
-1.483273, -0.7371476, -1.174629, 0, 0, 1, 1, 1,
-1.483247, 0.3600312, -0.6650772, 1, 0, 0, 1, 1,
-1.482705, -0.2341829, -0.5074342, 1, 0, 0, 1, 1,
-1.479983, 0.5958161, -1.28061, 1, 0, 0, 1, 1,
-1.47834, -1.099912, -0.6015139, 1, 0, 0, 1, 1,
-1.476552, -0.3425118, -1.740124, 1, 0, 0, 1, 1,
-1.476419, -0.3754279, -1.748566, 0, 0, 0, 1, 1,
-1.472374, -2.277046, -3.237085, 0, 0, 0, 1, 1,
-1.460793, 0.9655319, 0.5885231, 0, 0, 0, 1, 1,
-1.460132, 0.5079201, -2.013249, 0, 0, 0, 1, 1,
-1.459656, 0.2552772, -1.195028, 0, 0, 0, 1, 1,
-1.444765, 0.05843667, -2.560093, 0, 0, 0, 1, 1,
-1.444591, -0.5968613, -2.852768, 0, 0, 0, 1, 1,
-1.439701, 0.07200255, -0.9951905, 1, 1, 1, 1, 1,
-1.439631, -0.2926579, -2.828652, 1, 1, 1, 1, 1,
-1.431801, -0.2655526, -1.720223, 1, 1, 1, 1, 1,
-1.428404, 0.04371531, -0.8573232, 1, 1, 1, 1, 1,
-1.416, -0.1658372, -2.975709, 1, 1, 1, 1, 1,
-1.403512, -1.924631, -2.146103, 1, 1, 1, 1, 1,
-1.401682, 0.5384704, -2.211175, 1, 1, 1, 1, 1,
-1.397897, -0.01733451, -1.402052, 1, 1, 1, 1, 1,
-1.390938, 0.922698, -1.726427, 1, 1, 1, 1, 1,
-1.374749, -2.22625, -3.619803, 1, 1, 1, 1, 1,
-1.373483, 0.3874804, -0.740503, 1, 1, 1, 1, 1,
-1.372537, 1.007445, -1.113814, 1, 1, 1, 1, 1,
-1.368304, 1.036969, -1.809248, 1, 1, 1, 1, 1,
-1.367892, 1.129218, -0.2459822, 1, 1, 1, 1, 1,
-1.365659, -0.2241847, -1.195275, 1, 1, 1, 1, 1,
-1.360673, -0.2510389, -1.528268, 0, 0, 1, 1, 1,
-1.358312, 0.8713062, -0.1875187, 1, 0, 0, 1, 1,
-1.350363, -1.142023, -1.974004, 1, 0, 0, 1, 1,
-1.342597, -0.2195837, 0.2812635, 1, 0, 0, 1, 1,
-1.331065, -0.3854706, -3.16164, 1, 0, 0, 1, 1,
-1.330177, 1.481861, -1.007548, 1, 0, 0, 1, 1,
-1.327948, 1.145104, -2.096581, 0, 0, 0, 1, 1,
-1.312492, 0.7753668, -0.9859731, 0, 0, 0, 1, 1,
-1.304028, 0.002979018, 0.1811253, 0, 0, 0, 1, 1,
-1.302995, 1.078097, -1.136799, 0, 0, 0, 1, 1,
-1.299386, -0.4209114, -1.109817, 0, 0, 0, 1, 1,
-1.293638, -0.295867, -2.663364, 0, 0, 0, 1, 1,
-1.29118, -0.1144549, -2.198962, 0, 0, 0, 1, 1,
-1.290788, 0.07842471, -3.077787, 1, 1, 1, 1, 1,
-1.261196, -1.228917, -3.60873, 1, 1, 1, 1, 1,
-1.254368, 0.02120476, -1.949818, 1, 1, 1, 1, 1,
-1.25133, 2.148434, 0.7741096, 1, 1, 1, 1, 1,
-1.242214, -0.1171659, -2.417415, 1, 1, 1, 1, 1,
-1.231789, 0.1084155, -3.174734, 1, 1, 1, 1, 1,
-1.230813, -0.4437196, -2.208061, 1, 1, 1, 1, 1,
-1.229259, -1.646898, -2.601179, 1, 1, 1, 1, 1,
-1.224541, -0.02077267, -0.4949803, 1, 1, 1, 1, 1,
-1.223911, -0.132756, 0.005792488, 1, 1, 1, 1, 1,
-1.222271, 2.067761, -0.4266868, 1, 1, 1, 1, 1,
-1.219118, 0.6490029, -1.666325, 1, 1, 1, 1, 1,
-1.2173, 0.0318341, -1.81707, 1, 1, 1, 1, 1,
-1.208757, 0.4250874, -1.532933, 1, 1, 1, 1, 1,
-1.201273, 0.7859493, -1.487006, 1, 1, 1, 1, 1,
-1.199646, 0.4020556, -2.715623, 0, 0, 1, 1, 1,
-1.196689, -1.517735, -1.861385, 1, 0, 0, 1, 1,
-1.19419, 0.04780481, -0.5987286, 1, 0, 0, 1, 1,
-1.191558, -0.2000063, -1.661318, 1, 0, 0, 1, 1,
-1.188232, -0.7141034, -2.793259, 1, 0, 0, 1, 1,
-1.183229, -0.4550641, -0.4463916, 1, 0, 0, 1, 1,
-1.180944, -0.2493891, -0.3588592, 0, 0, 0, 1, 1,
-1.175156, 0.0460351, -2.29966, 0, 0, 0, 1, 1,
-1.165321, -0.4523137, -2.773057, 0, 0, 0, 1, 1,
-1.164161, -1.441972, -2.557992, 0, 0, 0, 1, 1,
-1.16095, 0.1396226, -3.530726, 0, 0, 0, 1, 1,
-1.160776, -0.9036101, -2.569717, 0, 0, 0, 1, 1,
-1.15748, -0.06502485, -1.945222, 0, 0, 0, 1, 1,
-1.154215, 0.4584577, -1.239764, 1, 1, 1, 1, 1,
-1.152305, 2.257836, -0.4552549, 1, 1, 1, 1, 1,
-1.148094, -1.115758, -1.576432, 1, 1, 1, 1, 1,
-1.144211, 0.4300106, -0.1971603, 1, 1, 1, 1, 1,
-1.142691, -1.806318, -1.321317, 1, 1, 1, 1, 1,
-1.139382, -0.4096884, -1.579352, 1, 1, 1, 1, 1,
-1.138779, 0.03622759, -1.611763, 1, 1, 1, 1, 1,
-1.138745, -0.5866938, -1.5389, 1, 1, 1, 1, 1,
-1.138309, -0.6870568, -2.915824, 1, 1, 1, 1, 1,
-1.135099, 0.3476738, -1.641223, 1, 1, 1, 1, 1,
-1.122684, 0.5377569, -0.8003781, 1, 1, 1, 1, 1,
-1.121509, 1.038181, -1.615381, 1, 1, 1, 1, 1,
-1.1193, 2.023466, 1.087451, 1, 1, 1, 1, 1,
-1.11066, 1.939058, -0.161837, 1, 1, 1, 1, 1,
-1.096137, -1.960837, -1.811942, 1, 1, 1, 1, 1,
-1.09346, 0.1313303, -0.3462617, 0, 0, 1, 1, 1,
-1.088312, 1.738905, -0.2373484, 1, 0, 0, 1, 1,
-1.087609, -0.3771174, -2.893786, 1, 0, 0, 1, 1,
-1.087372, -1.668612, -0.2976325, 1, 0, 0, 1, 1,
-1.0777, 0.4031872, -0.4550359, 1, 0, 0, 1, 1,
-1.073928, 1.757942, 0.04173238, 1, 0, 0, 1, 1,
-1.058242, 1.533014, 0.7444174, 0, 0, 0, 1, 1,
-1.049934, 0.5229265, -1.70784, 0, 0, 0, 1, 1,
-1.046699, -0.4260642, -0.01894945, 0, 0, 0, 1, 1,
-1.046121, 0.7505203, -1.928327, 0, 0, 0, 1, 1,
-1.044579, 0.02639502, -1.328987, 0, 0, 0, 1, 1,
-1.039142, 1.035515, 0.7402052, 0, 0, 0, 1, 1,
-1.030287, 0.01878815, -3.082211, 0, 0, 0, 1, 1,
-1.029612, 0.09221038, 0.5110898, 1, 1, 1, 1, 1,
-1.027512, -1.324737, -2.824735, 1, 1, 1, 1, 1,
-1.015561, 0.6550068, -2.746068, 1, 1, 1, 1, 1,
-1.004818, 1.405948, -1.243097, 1, 1, 1, 1, 1,
-0.9978908, -0.4767893, -3.857131, 1, 1, 1, 1, 1,
-0.9963742, -0.9891146, -1.274309, 1, 1, 1, 1, 1,
-0.9894962, -1.667418, -4.160158, 1, 1, 1, 1, 1,
-0.9684524, 0.689502, -1.281992, 1, 1, 1, 1, 1,
-0.9673941, 0.6891398, -0.3771069, 1, 1, 1, 1, 1,
-0.9578204, -0.07069787, -2.802027, 1, 1, 1, 1, 1,
-0.9561622, -0.02189168, -3.237442, 1, 1, 1, 1, 1,
-0.9482017, 0.2262042, -1.497228, 1, 1, 1, 1, 1,
-0.9458463, 0.4102933, -1.268476, 1, 1, 1, 1, 1,
-0.9262496, -0.8051667, -1.735922, 1, 1, 1, 1, 1,
-0.924583, -0.686681, -2.739114, 1, 1, 1, 1, 1,
-0.9242053, 0.2289772, -1.006858, 0, 0, 1, 1, 1,
-0.9177231, -1.925095, -3.187377, 1, 0, 0, 1, 1,
-0.905405, 0.4011732, -1.31368, 1, 0, 0, 1, 1,
-0.9050544, -0.2265415, -1.434382, 1, 0, 0, 1, 1,
-0.9016783, 1.275035, -1.395152, 1, 0, 0, 1, 1,
-0.9012265, -0.235873, -1.87555, 1, 0, 0, 1, 1,
-0.900552, -1.090874, -3.951696, 0, 0, 0, 1, 1,
-0.8967022, 0.234032, -2.072029, 0, 0, 0, 1, 1,
-0.8938582, -1.465368, -1.948963, 0, 0, 0, 1, 1,
-0.8906862, -1.236554, -3.327622, 0, 0, 0, 1, 1,
-0.8888038, -0.3717988, -1.804227, 0, 0, 0, 1, 1,
-0.8819547, 0.09337892, -1.891679, 0, 0, 0, 1, 1,
-0.880414, 0.415326, 1.695951, 0, 0, 0, 1, 1,
-0.8752283, 2.059609, -1.82141, 1, 1, 1, 1, 1,
-0.8746907, -0.5648893, -3.176615, 1, 1, 1, 1, 1,
-0.8744016, 0.9375373, -1.015944, 1, 1, 1, 1, 1,
-0.8693032, -1.130805, -2.436508, 1, 1, 1, 1, 1,
-0.8688673, -0.165061, 0.7399971, 1, 1, 1, 1, 1,
-0.8686488, -0.3744217, -1.517461, 1, 1, 1, 1, 1,
-0.8633735, 0.4499238, -0.6101629, 1, 1, 1, 1, 1,
-0.8554848, 2.159132, -1.462842, 1, 1, 1, 1, 1,
-0.8505095, 1.321247, -0.676105, 1, 1, 1, 1, 1,
-0.8419302, 0.09620672, -1.96305, 1, 1, 1, 1, 1,
-0.8355889, 0.03197757, -1.07405, 1, 1, 1, 1, 1,
-0.8350371, -0.7334788, -2.000725, 1, 1, 1, 1, 1,
-0.819811, 0.9540343, -2.34359, 1, 1, 1, 1, 1,
-0.8088875, 0.8414077, -0.123367, 1, 1, 1, 1, 1,
-0.8035471, 0.4383232, -1.266748, 1, 1, 1, 1, 1,
-0.793816, -1.162386, -1.390013, 0, 0, 1, 1, 1,
-0.7888182, -1.283734, -0.370484, 1, 0, 0, 1, 1,
-0.7857941, -0.2686401, -2.368006, 1, 0, 0, 1, 1,
-0.7825742, 2.813757, -1.252163, 1, 0, 0, 1, 1,
-0.7789354, -0.6288808, -2.092669, 1, 0, 0, 1, 1,
-0.7773107, 0.2092873, -1.367052, 1, 0, 0, 1, 1,
-0.7706863, -1.710609, -2.273342, 0, 0, 0, 1, 1,
-0.7705557, 1.161821, -1.188398, 0, 0, 0, 1, 1,
-0.7704882, 0.300956, -0.5043774, 0, 0, 0, 1, 1,
-0.7654712, -1.286878, -1.235033, 0, 0, 0, 1, 1,
-0.758725, -0.4209655, -2.074966, 0, 0, 0, 1, 1,
-0.7547541, 0.7141472, -0.3159486, 0, 0, 0, 1, 1,
-0.75314, -0.8773581, -0.7770373, 0, 0, 0, 1, 1,
-0.7524407, 0.8664766, -3.144994, 1, 1, 1, 1, 1,
-0.749179, -0.3486493, -3.106175, 1, 1, 1, 1, 1,
-0.7480511, -1.197218, -2.752815, 1, 1, 1, 1, 1,
-0.7443756, 1.348645, -1.197311, 1, 1, 1, 1, 1,
-0.7371907, 0.4820429, -2.278815, 1, 1, 1, 1, 1,
-0.7330801, -1.368794, -4.884365, 1, 1, 1, 1, 1,
-0.7239844, -0.9770346, -1.282326, 1, 1, 1, 1, 1,
-0.7223874, -1.930108, -0.9288497, 1, 1, 1, 1, 1,
-0.7220905, 1.697468, 0.08147089, 1, 1, 1, 1, 1,
-0.7205814, 1.247104, -1.490531, 1, 1, 1, 1, 1,
-0.7179073, -0.1713629, -1.050922, 1, 1, 1, 1, 1,
-0.7144514, 1.170516, -0.04408992, 1, 1, 1, 1, 1,
-0.7127421, -0.4207387, -0.505304, 1, 1, 1, 1, 1,
-0.7119115, -0.08703456, -1.711645, 1, 1, 1, 1, 1,
-0.7092953, 0.9026038, 0.8921617, 1, 1, 1, 1, 1,
-0.7046713, -0.03463884, -0.8035808, 0, 0, 1, 1, 1,
-0.7031411, 0.7024069, 0.1893935, 1, 0, 0, 1, 1,
-0.7014586, -0.1826975, -2.433419, 1, 0, 0, 1, 1,
-0.7011706, 2.093711, 1.535017, 1, 0, 0, 1, 1,
-0.6946763, -0.095839, -1.973551, 1, 0, 0, 1, 1,
-0.6934747, -0.8266469, -2.533125, 1, 0, 0, 1, 1,
-0.692831, -1.513482, -3.615949, 0, 0, 0, 1, 1,
-0.68447, -0.009280212, -3.693787, 0, 0, 0, 1, 1,
-0.6812452, -1.125387, -4.538199, 0, 0, 0, 1, 1,
-0.6749335, -1.276087, -3.279226, 0, 0, 0, 1, 1,
-0.6724882, -0.2285582, -2.467949, 0, 0, 0, 1, 1,
-0.6705477, 1.549746, 0.04854002, 0, 0, 0, 1, 1,
-0.6691357, 2.102176, -0.01875393, 0, 0, 0, 1, 1,
-0.6632628, -0.7986804, -1.557624, 1, 1, 1, 1, 1,
-0.6631529, 2.210581, -0.2400288, 1, 1, 1, 1, 1,
-0.6619047, -0.993615, -2.308623, 1, 1, 1, 1, 1,
-0.6582228, -1.156066, -2.950902, 1, 1, 1, 1, 1,
-0.6579078, 0.6989927, -1.10315, 1, 1, 1, 1, 1,
-0.6576185, -0.6540915, -2.555947, 1, 1, 1, 1, 1,
-0.6564192, -0.7548188, -2.753142, 1, 1, 1, 1, 1,
-0.6468744, 1.858826, -0.1192752, 1, 1, 1, 1, 1,
-0.6440127, 0.8999652, -0.9497634, 1, 1, 1, 1, 1,
-0.6400171, -0.4428458, -2.697424, 1, 1, 1, 1, 1,
-0.6392673, -0.6409736, -1.417368, 1, 1, 1, 1, 1,
-0.638835, -2.168748, -2.630985, 1, 1, 1, 1, 1,
-0.6349307, 0.8869117, -0.7073881, 1, 1, 1, 1, 1,
-0.6296694, 0.0589001, -1.484079, 1, 1, 1, 1, 1,
-0.6274092, 0.4010553, -1.866121, 1, 1, 1, 1, 1,
-0.6264995, 0.1225353, -0.6744269, 0, 0, 1, 1, 1,
-0.6261615, 1.866305, -0.6019423, 1, 0, 0, 1, 1,
-0.6257318, 0.5298054, -0.6271684, 1, 0, 0, 1, 1,
-0.6253018, 0.2204446, -0.148512, 1, 0, 0, 1, 1,
-0.6247104, 0.8679701, 0.02091331, 1, 0, 0, 1, 1,
-0.6243023, -0.3888637, 0.7802086, 1, 0, 0, 1, 1,
-0.6234769, 0.07291339, 0.7797667, 0, 0, 0, 1, 1,
-0.6191765, -0.3865674, -1.837474, 0, 0, 0, 1, 1,
-0.6169623, -0.8718435, -3.059036, 0, 0, 0, 1, 1,
-0.6132559, 2.422751, -1.157634, 0, 0, 0, 1, 1,
-0.6071541, 0.4243174, -1.513603, 0, 0, 0, 1, 1,
-0.5914825, 0.604795, -0.9016089, 0, 0, 0, 1, 1,
-0.590341, 0.9798027, 0.2402413, 0, 0, 0, 1, 1,
-0.584023, 0.7459704, -0.2421075, 1, 1, 1, 1, 1,
-0.5814946, -0.6002738, -2.255387, 1, 1, 1, 1, 1,
-0.5753344, 1.554574, 0.4051754, 1, 1, 1, 1, 1,
-0.5736392, 1.277201, -0.4186368, 1, 1, 1, 1, 1,
-0.5723901, -0.4331983, -2.883329, 1, 1, 1, 1, 1,
-0.5712559, -0.4954084, -2.297488, 1, 1, 1, 1, 1,
-0.5651202, -0.03428732, -3.080729, 1, 1, 1, 1, 1,
-0.5603201, -0.8000643, -0.6886703, 1, 1, 1, 1, 1,
-0.5588262, -0.2967975, -2.140765, 1, 1, 1, 1, 1,
-0.5562189, 0.2285432, -2.102894, 1, 1, 1, 1, 1,
-0.5524938, -0.01526151, -2.29038, 1, 1, 1, 1, 1,
-0.5507865, 0.1975458, 0.3115835, 1, 1, 1, 1, 1,
-0.5487051, -0.5439385, -4.273361, 1, 1, 1, 1, 1,
-0.5439201, 0.0567521, -0.1192346, 1, 1, 1, 1, 1,
-0.5400981, -0.3404238, -2.110451, 1, 1, 1, 1, 1,
-0.5357724, -0.5529879, -1.278656, 0, 0, 1, 1, 1,
-0.5356281, -0.5045782, -2.478676, 1, 0, 0, 1, 1,
-0.5321892, -0.758131, -3.268601, 1, 0, 0, 1, 1,
-0.5274664, -0.9633472, -3.394015, 1, 0, 0, 1, 1,
-0.5236557, -0.7759777, -3.084255, 1, 0, 0, 1, 1,
-0.5224075, 0.3183747, -1.804933, 1, 0, 0, 1, 1,
-0.5194077, -0.6279775, -2.773134, 0, 0, 0, 1, 1,
-0.5164138, 0.70968, -1.113342, 0, 0, 0, 1, 1,
-0.5160584, 1.046802, -0.8876786, 0, 0, 0, 1, 1,
-0.5122629, -0.7174267, -3.462338, 0, 0, 0, 1, 1,
-0.5034228, -0.04952072, -1.114344, 0, 0, 0, 1, 1,
-0.5013869, -0.6213461, -3.684132, 0, 0, 0, 1, 1,
-0.4998066, -0.4084399, -1.203228, 0, 0, 0, 1, 1,
-0.49438, -0.3809781, -0.3263609, 1, 1, 1, 1, 1,
-0.4927568, -0.02019384, -1.079551, 1, 1, 1, 1, 1,
-0.4898337, 0.4537166, 0.5487124, 1, 1, 1, 1, 1,
-0.4892574, 2.377603, 0.05126224, 1, 1, 1, 1, 1,
-0.487784, 1.366769, -0.1249901, 1, 1, 1, 1, 1,
-0.4844013, -0.3095201, -1.167081, 1, 1, 1, 1, 1,
-0.481232, 1.0287, -0.2778379, 1, 1, 1, 1, 1,
-0.4673914, 0.3002451, -1.913223, 1, 1, 1, 1, 1,
-0.4653733, 0.6996927, -0.2252408, 1, 1, 1, 1, 1,
-0.4642334, -0.2741885, -2.372682, 1, 1, 1, 1, 1,
-0.4552908, -0.05893918, -1.982978, 1, 1, 1, 1, 1,
-0.4516648, 0.6590785, 0.4961982, 1, 1, 1, 1, 1,
-0.4513159, -0.3742711, -3.754495, 1, 1, 1, 1, 1,
-0.4503645, -0.4371717, -3.637605, 1, 1, 1, 1, 1,
-0.4457569, -0.2594844, -2.413615, 1, 1, 1, 1, 1,
-0.4447113, -0.8370248, -3.871373, 0, 0, 1, 1, 1,
-0.4444959, -0.3248426, -3.280246, 1, 0, 0, 1, 1,
-0.4431817, 0.7522961, -0.9523749, 1, 0, 0, 1, 1,
-0.4418963, -0.7950172, -3.426732, 1, 0, 0, 1, 1,
-0.4384991, 1.775807, -1.154412, 1, 0, 0, 1, 1,
-0.4383505, -0.09896904, -1.939414, 1, 0, 0, 1, 1,
-0.4368062, 0.7082089, 0.07259916, 0, 0, 0, 1, 1,
-0.4364582, -0.5617895, -1.149026, 0, 0, 0, 1, 1,
-0.4363713, -0.4318231, -2.076829, 0, 0, 0, 1, 1,
-0.4323126, 1.044673, 0.7265494, 0, 0, 0, 1, 1,
-0.4299387, -1.797394, -2.658418, 0, 0, 0, 1, 1,
-0.4270431, 0.27279, -1.567779, 0, 0, 0, 1, 1,
-0.4259289, 1.455855, 0.08684232, 0, 0, 0, 1, 1,
-0.4234885, -0.1818733, -2.21713, 1, 1, 1, 1, 1,
-0.4214255, -0.4115464, -3.742189, 1, 1, 1, 1, 1,
-0.4198918, 1.507827, 0.2755984, 1, 1, 1, 1, 1,
-0.4183151, 0.5381205, -0.1995831, 1, 1, 1, 1, 1,
-0.4154352, -1.344691, -3.948429, 1, 1, 1, 1, 1,
-0.4148483, 0.227783, -0.8824586, 1, 1, 1, 1, 1,
-0.4146972, 1.625564, -0.2238032, 1, 1, 1, 1, 1,
-0.4121091, -1.810037, -3.735253, 1, 1, 1, 1, 1,
-0.4119246, -1.094733, -1.813078, 1, 1, 1, 1, 1,
-0.4115032, 1.642852, 0.37931, 1, 1, 1, 1, 1,
-0.4091633, 0.7070569, -0.2783999, 1, 1, 1, 1, 1,
-0.4086778, 1.200467, -0.1122153, 1, 1, 1, 1, 1,
-0.4027217, -0.9120252, -3.123771, 1, 1, 1, 1, 1,
-0.4018317, 0.374868, 1.036115, 1, 1, 1, 1, 1,
-0.3970235, -0.2997809, -0.8104657, 1, 1, 1, 1, 1,
-0.3969982, 0.9534227, -1.088568, 0, 0, 1, 1, 1,
-0.3965248, -0.4028682, -0.8196359, 1, 0, 0, 1, 1,
-0.3961161, -0.02146943, -2.393507, 1, 0, 0, 1, 1,
-0.3878241, -0.8409173, -1.885621, 1, 0, 0, 1, 1,
-0.3873321, -0.7590076, -3.786766, 1, 0, 0, 1, 1,
-0.3868276, -1.590376, -4.054321, 1, 0, 0, 1, 1,
-0.3866462, -0.2406182, -3.935525, 0, 0, 0, 1, 1,
-0.3763319, -1.712444, -3.055638, 0, 0, 0, 1, 1,
-0.3761305, 0.8223696, 2.694823, 0, 0, 0, 1, 1,
-0.374193, 0.02205872, 0.2385921, 0, 0, 0, 1, 1,
-0.37071, 1.695855, 0.6948728, 0, 0, 0, 1, 1,
-0.3704223, -0.8478884, -4.080996, 0, 0, 0, 1, 1,
-0.3683001, 1.201344, 0.2810485, 0, 0, 0, 1, 1,
-0.3661271, 0.9826794, -0.1857536, 1, 1, 1, 1, 1,
-0.3649313, 1.36154, -0.08205581, 1, 1, 1, 1, 1,
-0.3643342, 1.423618, 2.254943, 1, 1, 1, 1, 1,
-0.3635322, 0.001663669, -1.419283, 1, 1, 1, 1, 1,
-0.3561617, -0.7453573, -1.399437, 1, 1, 1, 1, 1,
-0.3526529, 0.48522, 0.2440195, 1, 1, 1, 1, 1,
-0.3522902, -0.6587794, -3.750027, 1, 1, 1, 1, 1,
-0.350435, -0.221663, -1.203143, 1, 1, 1, 1, 1,
-0.3504131, 0.4474613, 0.6297364, 1, 1, 1, 1, 1,
-0.3459482, 0.4015718, 1.379244, 1, 1, 1, 1, 1,
-0.345035, -1.273102, -3.808437, 1, 1, 1, 1, 1,
-0.3444459, 0.2276286, -1.79469, 1, 1, 1, 1, 1,
-0.3400502, 2.242755, 0.7519873, 1, 1, 1, 1, 1,
-0.3372456, -0.4588042, -1.978938, 1, 1, 1, 1, 1,
-0.3323614, -0.004104936, -0.6395363, 1, 1, 1, 1, 1,
-0.3305713, -2.410745, -2.987906, 0, 0, 1, 1, 1,
-0.3294045, 1.496571, 1.360015, 1, 0, 0, 1, 1,
-0.3159689, 1.748597, -0.3128911, 1, 0, 0, 1, 1,
-0.3131812, 0.9426398, 0.8985932, 1, 0, 0, 1, 1,
-0.310323, -1.905909, -1.150426, 1, 0, 0, 1, 1,
-0.3098849, 0.6629027, -0.01385384, 1, 0, 0, 1, 1,
-0.3048621, -1.480526, -1.362427, 0, 0, 0, 1, 1,
-0.3025904, -1.078583, -3.376838, 0, 0, 0, 1, 1,
-0.2999532, 0.06913995, -0.8944045, 0, 0, 0, 1, 1,
-0.2970925, -0.2558927, -3.076527, 0, 0, 0, 1, 1,
-0.292386, -0.03249479, -0.5991534, 0, 0, 0, 1, 1,
-0.2805216, 0.3062611, -0.4248382, 0, 0, 0, 1, 1,
-0.280338, 0.2658924, -0.7608838, 0, 0, 0, 1, 1,
-0.2797856, -0.5435154, -3.074504, 1, 1, 1, 1, 1,
-0.2770046, -2.109812, -3.497818, 1, 1, 1, 1, 1,
-0.2769017, 1.074178, 0.158358, 1, 1, 1, 1, 1,
-0.276486, 0.9502378, -0.8165677, 1, 1, 1, 1, 1,
-0.2752762, 1.049998, -1.403784, 1, 1, 1, 1, 1,
-0.2731037, -1.486395, -3.096758, 1, 1, 1, 1, 1,
-0.2705353, 2.849257, 1.157994, 1, 1, 1, 1, 1,
-0.2652269, 1.673431, -1.78472, 1, 1, 1, 1, 1,
-0.2632076, -2.420541, -3.38558, 1, 1, 1, 1, 1,
-0.259195, -0.9075582, -2.811364, 1, 1, 1, 1, 1,
-0.2588591, -0.0310312, -1.954404, 1, 1, 1, 1, 1,
-0.2585397, 0.2499534, -1.850922, 1, 1, 1, 1, 1,
-0.2550687, 1.059575, -0.2852533, 1, 1, 1, 1, 1,
-0.2547369, -1.162273, -1.451549, 1, 1, 1, 1, 1,
-0.2546054, 1.684906, 0.8993108, 1, 1, 1, 1, 1,
-0.2544688, -1.423423, -3.091376, 0, 0, 1, 1, 1,
-0.2528608, 1.355355, 0.2112676, 1, 0, 0, 1, 1,
-0.2506178, -0.8748308, -3.371612, 1, 0, 0, 1, 1,
-0.2474259, 0.8336655, -0.4417913, 1, 0, 0, 1, 1,
-0.2444466, -0.4403829, -2.613657, 1, 0, 0, 1, 1,
-0.2411938, -0.8125915, -3.903669, 1, 0, 0, 1, 1,
-0.2406031, 1.708849, 0.908578, 0, 0, 0, 1, 1,
-0.2333014, 0.5226679, -1.973039, 0, 0, 0, 1, 1,
-0.2319928, 1.209291, -1.257625, 0, 0, 0, 1, 1,
-0.2313413, -0.1512695, -2.845745, 0, 0, 0, 1, 1,
-0.2293106, 0.7393607, 0.1693436, 0, 0, 0, 1, 1,
-0.2274159, -0.855408, -2.341621, 0, 0, 0, 1, 1,
-0.2267948, -0.7808515, -2.685971, 0, 0, 0, 1, 1,
-0.2246494, -0.5783628, -4.033043, 1, 1, 1, 1, 1,
-0.2245001, 1.252338, -0.4181682, 1, 1, 1, 1, 1,
-0.2235593, 0.3543132, 0.802434, 1, 1, 1, 1, 1,
-0.2145116, -1.469541, -3.025636, 1, 1, 1, 1, 1,
-0.2132901, -1.160549, -3.982353, 1, 1, 1, 1, 1,
-0.2108797, 1.068553, 0.6160163, 1, 1, 1, 1, 1,
-0.2094164, 0.06819874, -1.646677, 1, 1, 1, 1, 1,
-0.2075205, -0.1310219, -4.064888, 1, 1, 1, 1, 1,
-0.2065234, -0.2365929, -2.01165, 1, 1, 1, 1, 1,
-0.2064159, -0.8598917, -3.37634, 1, 1, 1, 1, 1,
-0.2057459, 0.8215445, 1.313765, 1, 1, 1, 1, 1,
-0.2022673, -0.9344336, -1.921922, 1, 1, 1, 1, 1,
-0.1944281, -0.3160183, -2.738877, 1, 1, 1, 1, 1,
-0.1899565, 1.35559, -0.1993729, 1, 1, 1, 1, 1,
-0.189611, 0.6611509, 0.3980815, 1, 1, 1, 1, 1,
-0.1892775, 0.699356, -0.04171045, 0, 0, 1, 1, 1,
-0.1843848, 0.433175, -1.558454, 1, 0, 0, 1, 1,
-0.1834, -0.4014347, -3.764776, 1, 0, 0, 1, 1,
-0.1776423, 0.7769878, -0.0675039, 1, 0, 0, 1, 1,
-0.1774985, -0.638733, -1.108131, 1, 0, 0, 1, 1,
-0.1731392, -1.740811, -3.204883, 1, 0, 0, 1, 1,
-0.1727022, 1.527489, -0.7969333, 0, 0, 0, 1, 1,
-0.1721775, -0.7567573, -2.739629, 0, 0, 0, 1, 1,
-0.1720337, 0.2391722, -0.5290935, 0, 0, 0, 1, 1,
-0.169788, -0.1025362, -2.257191, 0, 0, 0, 1, 1,
-0.1691693, 0.1738464, -1.387136, 0, 0, 0, 1, 1,
-0.1606114, -0.3815987, -2.981373, 0, 0, 0, 1, 1,
-0.1593598, -0.7195948, -3.583369, 0, 0, 0, 1, 1,
-0.1576002, 1.565855, -0.4811721, 1, 1, 1, 1, 1,
-0.1571968, -0.7211407, -0.4173964, 1, 1, 1, 1, 1,
-0.1542713, -2.003416, -4.998628, 1, 1, 1, 1, 1,
-0.1438476, 1.451131, 1.085604, 1, 1, 1, 1, 1,
-0.1319965, -0.2467244, -1.473248, 1, 1, 1, 1, 1,
-0.1314296, -1.267493, -3.938644, 1, 1, 1, 1, 1,
-0.1284209, -1.345368, -3.485952, 1, 1, 1, 1, 1,
-0.1282168, -0.8270221, -4.760577, 1, 1, 1, 1, 1,
-0.1263959, 0.875022, -0.6553826, 1, 1, 1, 1, 1,
-0.1253724, 0.2349537, -0.1454064, 1, 1, 1, 1, 1,
-0.1236625, -0.5029064, -4.214073, 1, 1, 1, 1, 1,
-0.1207428, 0.3872971, -0.384642, 1, 1, 1, 1, 1,
-0.1194777, 1.820139, -0.7494107, 1, 1, 1, 1, 1,
-0.1188987, 0.775046, 0.4046173, 1, 1, 1, 1, 1,
-0.1161197, -0.6405424, -2.596543, 1, 1, 1, 1, 1,
-0.1134305, -0.6573386, -3.901864, 0, 0, 1, 1, 1,
-0.113362, 0.01516774, -2.106331, 1, 0, 0, 1, 1,
-0.1124872, 2.345699, 0.9940685, 1, 0, 0, 1, 1,
-0.1107707, -0.5162918, -0.9397256, 1, 0, 0, 1, 1,
-0.1095302, 0.04186298, -0.7547913, 1, 0, 0, 1, 1,
-0.1067558, 1.452003, -1.563541, 1, 0, 0, 1, 1,
-0.1044316, -0.6099707, -2.73009, 0, 0, 0, 1, 1,
-0.1000425, -2.276374, -2.332344, 0, 0, 0, 1, 1,
-0.09930158, -1.191531, -3.450371, 0, 0, 0, 1, 1,
-0.09579149, 0.409095, -0.3895366, 0, 0, 0, 1, 1,
-0.09573921, -0.02140322, -2.843971, 0, 0, 0, 1, 1,
-0.09369595, 0.5669796, -0.9297323, 0, 0, 0, 1, 1,
-0.09137104, -0.9137648, -1.689364, 0, 0, 0, 1, 1,
-0.09117629, 0.3336789, -2.217818, 1, 1, 1, 1, 1,
-0.08911061, 1.384455, 0.1682343, 1, 1, 1, 1, 1,
-0.08612809, 0.7404636, -3.583523, 1, 1, 1, 1, 1,
-0.08433566, 0.1866921, -0.4855675, 1, 1, 1, 1, 1,
-0.08397093, 0.4292226, -1.31352, 1, 1, 1, 1, 1,
-0.080731, -0.04465305, -0.05475562, 1, 1, 1, 1, 1,
-0.07472949, -0.5510755, -1.548179, 1, 1, 1, 1, 1,
-0.0741308, 0.5274851, -0.6023684, 1, 1, 1, 1, 1,
-0.07357711, 0.06232467, -1.378423, 1, 1, 1, 1, 1,
-0.06995908, -1.658549, -3.166587, 1, 1, 1, 1, 1,
-0.0668386, 0.7863014, -1.064287, 1, 1, 1, 1, 1,
-0.06317822, 1.085111, 0.7035563, 1, 1, 1, 1, 1,
-0.06122674, -1.334903, -2.673883, 1, 1, 1, 1, 1,
-0.06105686, -0.8154743, -3.046695, 1, 1, 1, 1, 1,
-0.05486928, -0.2343459, -4.918351, 1, 1, 1, 1, 1,
-0.0542071, -0.07652657, -1.871523, 0, 0, 1, 1, 1,
-0.05046755, -1.533186, -4.415802, 1, 0, 0, 1, 1,
-0.04864293, 2.25341, 0.2829693, 1, 0, 0, 1, 1,
-0.04809578, -1.027777, -3.845893, 1, 0, 0, 1, 1,
-0.04741467, 0.09186376, 0.778605, 1, 0, 0, 1, 1,
-0.04733663, 1.151332, -0.6638209, 1, 0, 0, 1, 1,
-0.04691073, 0.3493845, -0.1404643, 0, 0, 0, 1, 1,
-0.04471048, -0.8049422, -3.234846, 0, 0, 0, 1, 1,
-0.04089692, -0.9483208, -3.375426, 0, 0, 0, 1, 1,
-0.03983826, 0.1474518, 0.2878629, 0, 0, 0, 1, 1,
-0.03451732, -0.7986454, -2.254437, 0, 0, 0, 1, 1,
-0.03352907, -0.5827664, -2.923682, 0, 0, 0, 1, 1,
-0.03339603, 1.318291, -1.292946, 0, 0, 0, 1, 1,
-0.02623931, -1.511046, -4.735148, 1, 1, 1, 1, 1,
-0.02602992, 0.6166528, 0.4680468, 1, 1, 1, 1, 1,
-0.01825716, -0.8361769, -5.235445, 1, 1, 1, 1, 1,
-0.0182542, 0.06660786, 0.8476867, 1, 1, 1, 1, 1,
-0.01771158, -0.599248, -3.716465, 1, 1, 1, 1, 1,
-0.01559649, -0.8486261, -4.151088, 1, 1, 1, 1, 1,
-0.01558717, 0.1632997, 0.6252216, 1, 1, 1, 1, 1,
-0.01441742, -0.3518917, -1.600058, 1, 1, 1, 1, 1,
-0.01426914, -1.947769, -1.813171, 1, 1, 1, 1, 1,
-0.01375299, -0.2846746, -5.129807, 1, 1, 1, 1, 1,
-0.01231462, -0.5959108, -2.322159, 1, 1, 1, 1, 1,
-0.01016359, -0.7127966, -1.999276, 1, 1, 1, 1, 1,
-0.009274255, -0.03066456, -3.380409, 1, 1, 1, 1, 1,
-0.008097019, 2.02299, 2.195691, 1, 1, 1, 1, 1,
-0.006400105, -1.235078, -4.065074, 1, 1, 1, 1, 1,
-0.004514656, 0.2432756, -0.8397271, 0, 0, 1, 1, 1,
-0.003843549, -0.05206243, -2.050078, 1, 0, 0, 1, 1,
-0.002349183, 1.982718, -1.646676, 1, 0, 0, 1, 1,
-0.001886321, 0.9183292, -0.8299474, 1, 0, 0, 1, 1,
0.001556189, -0.1759657, 2.227724, 1, 0, 0, 1, 1,
0.001780284, -0.2878105, 2.864429, 1, 0, 0, 1, 1,
0.002340584, -0.8549221, 3.197074, 0, 0, 0, 1, 1,
0.004692514, -0.05483434, 1.458772, 0, 0, 0, 1, 1,
0.006889976, 0.4211125, 0.5270613, 0, 0, 0, 1, 1,
0.007576334, -0.6484346, 1.239109, 0, 0, 0, 1, 1,
0.01357129, -0.3264081, 2.041571, 0, 0, 0, 1, 1,
0.0138613, 0.06732646, 1.506636, 0, 0, 0, 1, 1,
0.0144427, -1.08579, 4.224859, 0, 0, 0, 1, 1,
0.01828426, 2.611313, 1.593677, 1, 1, 1, 1, 1,
0.0220162, -0.9858181, 4.620759, 1, 1, 1, 1, 1,
0.02403416, -1.038716, 1.469661, 1, 1, 1, 1, 1,
0.02832242, -0.8811711, 2.854496, 1, 1, 1, 1, 1,
0.02917632, 0.5702834, 0.08317564, 1, 1, 1, 1, 1,
0.03764001, 0.06942907, 1.088431, 1, 1, 1, 1, 1,
0.03843581, 0.5831372, 0.2222006, 1, 1, 1, 1, 1,
0.0391548, -1.856635, 2.626526, 1, 1, 1, 1, 1,
0.04421127, -0.8722346, 5.134229, 1, 1, 1, 1, 1,
0.047082, 0.8501048, 1.006505, 1, 1, 1, 1, 1,
0.04772776, 0.5193549, -0.2513167, 1, 1, 1, 1, 1,
0.04777114, -0.02066969, 0.9685971, 1, 1, 1, 1, 1,
0.04777408, 0.1000226, 0.4949027, 1, 1, 1, 1, 1,
0.04781848, -0.2177082, 2.16732, 1, 1, 1, 1, 1,
0.05626789, 0.9919119, 0.2324296, 1, 1, 1, 1, 1,
0.05901612, -0.3535188, 0.9727162, 0, 0, 1, 1, 1,
0.05980615, -1.976961, 2.736093, 1, 0, 0, 1, 1,
0.06112635, 0.8770881, -0.9537492, 1, 0, 0, 1, 1,
0.06220257, 0.1211763, 0.6884241, 1, 0, 0, 1, 1,
0.06332208, 0.8568218, 0.3479892, 1, 0, 0, 1, 1,
0.06802519, 0.1883887, -0.2148777, 1, 0, 0, 1, 1,
0.0682578, 0.6280249, -0.4937799, 0, 0, 0, 1, 1,
0.06933349, 0.6096944, -0.7155807, 0, 0, 0, 1, 1,
0.07105916, 1.627977, -0.6096722, 0, 0, 0, 1, 1,
0.07170136, 1.400674, 1.372967, 0, 0, 0, 1, 1,
0.07616322, 0.957141, 0.3911052, 0, 0, 0, 1, 1,
0.07726038, -1.17392, 4.135339, 0, 0, 0, 1, 1,
0.07898287, 0.6557466, -0.3172596, 0, 0, 0, 1, 1,
0.08181304, -0.1682754, 3.829633, 1, 1, 1, 1, 1,
0.08463573, 0.6307269, -0.2432006, 1, 1, 1, 1, 1,
0.09201412, 0.1754235, 0.9707593, 1, 1, 1, 1, 1,
0.09859005, -0.1920321, 3.522102, 1, 1, 1, 1, 1,
0.09982795, -0.3882653, 3.404672, 1, 1, 1, 1, 1,
0.1025353, 0.4528994, 1.763683, 1, 1, 1, 1, 1,
0.1028448, -0.3747563, 3.737831, 1, 1, 1, 1, 1,
0.1050189, -2.645858, 3.747383, 1, 1, 1, 1, 1,
0.108032, 2.051616, -2.331853, 1, 1, 1, 1, 1,
0.1119559, -1.992022, 5.61313, 1, 1, 1, 1, 1,
0.1159221, -1.293388, 3.079185, 1, 1, 1, 1, 1,
0.1199752, 0.4766694, 1.442877, 1, 1, 1, 1, 1,
0.1256444, 0.1249246, -0.6072197, 1, 1, 1, 1, 1,
0.1294, 1.947586, 0.9627294, 1, 1, 1, 1, 1,
0.1330708, 0.2572974, -0.6332407, 1, 1, 1, 1, 1,
0.1339709, -0.1238585, 0.5456107, 0, 0, 1, 1, 1,
0.1384908, 0.207835, -0.4197732, 1, 0, 0, 1, 1,
0.1421523, -1.014721, 4.10605, 1, 0, 0, 1, 1,
0.1432479, 0.004893779, 0.6503899, 1, 0, 0, 1, 1,
0.1449571, 0.1776364, 1.213552, 1, 0, 0, 1, 1,
0.1506101, 1.031015, 1.060954, 1, 0, 0, 1, 1,
0.1526807, -2.659611, 3.917099, 0, 0, 0, 1, 1,
0.1535545, 1.465399, 0.682998, 0, 0, 0, 1, 1,
0.1584748, -1.184359, 2.057744, 0, 0, 0, 1, 1,
0.1617321, 0.06695156, 1.4678, 0, 0, 0, 1, 1,
0.1646155, 0.6903379, 0.6106305, 0, 0, 0, 1, 1,
0.1678046, 0.9654046, 2.308137, 0, 0, 0, 1, 1,
0.181864, -0.3575667, 3.162391, 0, 0, 0, 1, 1,
0.1825161, 0.4877042, -0.8536223, 1, 1, 1, 1, 1,
0.1924928, -0.6846652, 2.897898, 1, 1, 1, 1, 1,
0.1981253, 0.3653736, 1.388352, 1, 1, 1, 1, 1,
0.2010508, -0.3904871, 3.017303, 1, 1, 1, 1, 1,
0.2029372, -2.255326, 3.841332, 1, 1, 1, 1, 1,
0.2040387, 0.7451308, 1.164884, 1, 1, 1, 1, 1,
0.2126128, -0.424993, 3.376194, 1, 1, 1, 1, 1,
0.2130938, -0.5614547, 2.197498, 1, 1, 1, 1, 1,
0.2147421, -0.8487053, 2.675714, 1, 1, 1, 1, 1,
0.219146, 0.2786986, 0.9145375, 1, 1, 1, 1, 1,
0.2194358, -0.5768006, 2.987752, 1, 1, 1, 1, 1,
0.2205326, -1.418306, 2.495635, 1, 1, 1, 1, 1,
0.2205424, 1.12624, 1.807889, 1, 1, 1, 1, 1,
0.2234877, 0.6407746, -1.360073, 1, 1, 1, 1, 1,
0.2313897, -2.838099, 2.703786, 1, 1, 1, 1, 1,
0.2357733, 0.4229857, -0.2967636, 0, 0, 1, 1, 1,
0.2381393, -1.507139, 3.32889, 1, 0, 0, 1, 1,
0.2397137, 0.06424702, 0.3776513, 1, 0, 0, 1, 1,
0.2397838, 0.4524847, 1.552824, 1, 0, 0, 1, 1,
0.2399484, -0.4940205, 1.255288, 1, 0, 0, 1, 1,
0.2419637, 0.949789, -0.3735484, 1, 0, 0, 1, 1,
0.2454064, 1.109539, -1.782785, 0, 0, 0, 1, 1,
0.2455203, 1.552988, -0.4861177, 0, 0, 0, 1, 1,
0.2483544, -0.359697, 1.1277, 0, 0, 0, 1, 1,
0.2518608, 0.4924865, 1.848, 0, 0, 0, 1, 1,
0.2547204, 0.6163566, -0.6188503, 0, 0, 0, 1, 1,
0.2556967, 1.045805, 1.945638, 0, 0, 0, 1, 1,
0.2557917, -0.2232504, 2.014568, 0, 0, 0, 1, 1,
0.2571782, -0.1481321, 2.895735, 1, 1, 1, 1, 1,
0.2634281, 1.830101, 1.064467, 1, 1, 1, 1, 1,
0.2672196, 1.439098, 0.358313, 1, 1, 1, 1, 1,
0.2698107, -0.2641644, 1.856646, 1, 1, 1, 1, 1,
0.2737369, 1.272103, -0.2489972, 1, 1, 1, 1, 1,
0.2747171, -0.4692067, 3.8618, 1, 1, 1, 1, 1,
0.2749738, -1.732034, 3.632307, 1, 1, 1, 1, 1,
0.2803803, 0.4670372, 0.2073005, 1, 1, 1, 1, 1,
0.2803981, 0.685495, -1.017387, 1, 1, 1, 1, 1,
0.2812953, -1.874943, 1.881959, 1, 1, 1, 1, 1,
0.281414, 1.950545, 0.7307873, 1, 1, 1, 1, 1,
0.2862415, -0.8182678, 2.841228, 1, 1, 1, 1, 1,
0.2908141, 1.051134, 0.5832536, 1, 1, 1, 1, 1,
0.2909772, 0.2895707, 2.13408, 1, 1, 1, 1, 1,
0.2915283, 1.388993, 0.6827601, 1, 1, 1, 1, 1,
0.2924151, 1.358298, 1.358741, 0, 0, 1, 1, 1,
0.2956058, -0.209119, 1.32783, 1, 0, 0, 1, 1,
0.296458, -0.3260545, 2.801742, 1, 0, 0, 1, 1,
0.3000225, -0.4471839, 2.495237, 1, 0, 0, 1, 1,
0.300075, -0.5684151, 3.886807, 1, 0, 0, 1, 1,
0.3017442, -1.514787, 2.144472, 1, 0, 0, 1, 1,
0.303018, 0.6590106, -0.5179417, 0, 0, 0, 1, 1,
0.303097, 0.3606187, -0.1299532, 0, 0, 0, 1, 1,
0.3103513, 2.070837, 0.005788802, 0, 0, 0, 1, 1,
0.3106669, 2.720354, -0.7442454, 0, 0, 0, 1, 1,
0.3112735, 1.736818, -0.9451192, 0, 0, 0, 1, 1,
0.3123807, -0.1822096, 1.52586, 0, 0, 0, 1, 1,
0.3154661, 0.5465428, 0.6437733, 0, 0, 0, 1, 1,
0.3169183, 0.1441503, 0.8684069, 1, 1, 1, 1, 1,
0.321226, -0.5283893, 4.599008, 1, 1, 1, 1, 1,
0.3223773, -0.7569236, 2.740489, 1, 1, 1, 1, 1,
0.3242601, 0.531609, -0.150187, 1, 1, 1, 1, 1,
0.3272841, 0.07878547, 1.417129, 1, 1, 1, 1, 1,
0.3276173, -0.2904416, 3.64836, 1, 1, 1, 1, 1,
0.3283619, 0.2887221, 0.8974839, 1, 1, 1, 1, 1,
0.3310046, -0.770871, 3.173174, 1, 1, 1, 1, 1,
0.331416, 0.924942, -0.1352875, 1, 1, 1, 1, 1,
0.3338564, -0.3273266, 1.361614, 1, 1, 1, 1, 1,
0.3352202, -0.4615042, 3.18758, 1, 1, 1, 1, 1,
0.3463849, -0.07036569, 3.09181, 1, 1, 1, 1, 1,
0.347139, 0.9895767, 2.256233, 1, 1, 1, 1, 1,
0.3502434, -1.917821, 3.439309, 1, 1, 1, 1, 1,
0.3565922, 0.4455775, 0.3297186, 1, 1, 1, 1, 1,
0.3609385, -2.037848, 2.677886, 0, 0, 1, 1, 1,
0.3673, -0.9072505, 1.474617, 1, 0, 0, 1, 1,
0.3680102, 1.140412, 1.096808, 1, 0, 0, 1, 1,
0.3688725, 0.3877417, 1.745914, 1, 0, 0, 1, 1,
0.3710137, 0.007004984, 0.3976151, 1, 0, 0, 1, 1,
0.3744511, 1.802743, 0.4247839, 1, 0, 0, 1, 1,
0.3752056, -0.8585314, 3.426339, 0, 0, 0, 1, 1,
0.375317, -1.987612, 2.829309, 0, 0, 0, 1, 1,
0.3812906, -1.744668, 2.149708, 0, 0, 0, 1, 1,
0.3816271, 0.9169164, 1.179898, 0, 0, 0, 1, 1,
0.3919068, 0.4207473, -0.2278002, 0, 0, 0, 1, 1,
0.3929819, 0.4537766, 0.8301594, 0, 0, 0, 1, 1,
0.3946049, 0.5543474, 0.2553878, 0, 0, 0, 1, 1,
0.3948874, 2.166523, -0.7162455, 1, 1, 1, 1, 1,
0.3968264, 0.4560455, 1.182026, 1, 1, 1, 1, 1,
0.4027423, -0.201424, 3.181277, 1, 1, 1, 1, 1,
0.4027541, 0.2664627, 1.590796, 1, 1, 1, 1, 1,
0.4082242, -2.422856, 1.193725, 1, 1, 1, 1, 1,
0.4090264, -1.011494, 1.878926, 1, 1, 1, 1, 1,
0.4103832, -0.6678856, 2.523746, 1, 1, 1, 1, 1,
0.4110191, -0.2244316, 3.399614, 1, 1, 1, 1, 1,
0.4119235, -0.8022187, 3.962072, 1, 1, 1, 1, 1,
0.4142932, 2.687533, 0.7332122, 1, 1, 1, 1, 1,
0.4151596, 1.393817, -0.8963128, 1, 1, 1, 1, 1,
0.4165688, -0.0812503, 1.237185, 1, 1, 1, 1, 1,
0.4185371, 0.47825, 1.385934, 1, 1, 1, 1, 1,
0.4194055, -0.1317448, 1.806642, 1, 1, 1, 1, 1,
0.4255405, -0.4749348, 2.627435, 1, 1, 1, 1, 1,
0.4274607, 1.226946, 0.5768667, 0, 0, 1, 1, 1,
0.4310467, 0.4083546, 0.2273373, 1, 0, 0, 1, 1,
0.4318138, 0.3723115, -0.693038, 1, 0, 0, 1, 1,
0.4349005, -0.1275323, 3.864667, 1, 0, 0, 1, 1,
0.4362303, 1.860947, -0.2414192, 1, 0, 0, 1, 1,
0.4373264, 0.4956564, 1.395518, 1, 0, 0, 1, 1,
0.4380077, -1.245481, 3.451104, 0, 0, 0, 1, 1,
0.4493532, 1.186568, 1.60493, 0, 0, 0, 1, 1,
0.4560713, 0.230678, 1.733674, 0, 0, 0, 1, 1,
0.4593103, -0.200143, 2.525915, 0, 0, 0, 1, 1,
0.4635961, 0.3350012, 1.391849, 0, 0, 0, 1, 1,
0.4637898, -1.874884, 3.065966, 0, 0, 0, 1, 1,
0.4648527, -0.3378941, 0.9274383, 0, 0, 0, 1, 1,
0.4728057, 1.064389, 1.229165, 1, 1, 1, 1, 1,
0.4790065, 1.545712, -0.6022957, 1, 1, 1, 1, 1,
0.4790499, 1.251885, 0.6875292, 1, 1, 1, 1, 1,
0.4802319, 0.281215, 1.808732, 1, 1, 1, 1, 1,
0.4818542, -1.107621, 0.747373, 1, 1, 1, 1, 1,
0.4871343, 0.6625066, -0.6333065, 1, 1, 1, 1, 1,
0.49111, 0.3609995, 1.513976, 1, 1, 1, 1, 1,
0.491506, -1.106518, 1.214204, 1, 1, 1, 1, 1,
0.4931878, 0.4880782, 1.848999, 1, 1, 1, 1, 1,
0.4966305, -0.1932926, 3.963968, 1, 1, 1, 1, 1,
0.498829, -0.009399842, 0.6468242, 1, 1, 1, 1, 1,
0.4993877, -0.6764498, 2.399784, 1, 1, 1, 1, 1,
0.5028434, -0.03966514, 0.8140919, 1, 1, 1, 1, 1,
0.5109931, 0.4850068, 0.4982004, 1, 1, 1, 1, 1,
0.5236608, 0.3905025, 1.047492, 1, 1, 1, 1, 1,
0.5269074, 1.87633, -1.065741, 0, 0, 1, 1, 1,
0.52716, 1.111536, 1.040918, 1, 0, 0, 1, 1,
0.5283368, 0.5507265, 1.989703, 1, 0, 0, 1, 1,
0.5296265, -1.232694, 2.594847, 1, 0, 0, 1, 1,
0.5343555, 0.9095682, 2.038456, 1, 0, 0, 1, 1,
0.5365725, -0.7193123, 2.258656, 1, 0, 0, 1, 1,
0.5378901, 0.03136804, 1.815478, 0, 0, 0, 1, 1,
0.5393405, 1.357585, 1.042181, 0, 0, 0, 1, 1,
0.5474044, -1.781957, 2.400298, 0, 0, 0, 1, 1,
0.5563695, -1.844523, 2.116498, 0, 0, 0, 1, 1,
0.5565227, -0.4138283, 2.459838, 0, 0, 0, 1, 1,
0.560379, 0.4641405, 1.159424, 0, 0, 0, 1, 1,
0.565382, 0.8125845, 0.7253355, 0, 0, 0, 1, 1,
0.5675557, -0.1549719, 1.795715, 1, 1, 1, 1, 1,
0.5845604, 0.5532816, -0.4901402, 1, 1, 1, 1, 1,
0.5879017, -0.2440408, 2.368491, 1, 1, 1, 1, 1,
0.5978631, -0.9325524, 5.246682, 1, 1, 1, 1, 1,
0.5987737, 0.03429866, 1.582521, 1, 1, 1, 1, 1,
0.6049391, 0.02365249, 1.336051, 1, 1, 1, 1, 1,
0.6115679, -0.3757506, 2.119117, 1, 1, 1, 1, 1,
0.626578, -0.6766904, 3.054446, 1, 1, 1, 1, 1,
0.627245, 1.828915, 0.9530248, 1, 1, 1, 1, 1,
0.6294761, -2.707386, 4.3959, 1, 1, 1, 1, 1,
0.6323632, 0.1531261, 1.145972, 1, 1, 1, 1, 1,
0.6336687, -0.2315394, 2.352653, 1, 1, 1, 1, 1,
0.6353585, 1.690752, 0.01008318, 1, 1, 1, 1, 1,
0.6361854, 0.5464328, 1.455592, 1, 1, 1, 1, 1,
0.6463134, -0.6816032, 3.049418, 1, 1, 1, 1, 1,
0.6507183, 0.5966308, 1.65385, 0, 0, 1, 1, 1,
0.6511433, 1.137273, 1.231455, 1, 0, 0, 1, 1,
0.6548942, -1.013662, 2.968992, 1, 0, 0, 1, 1,
0.6556776, 0.0118365, 2.458333, 1, 0, 0, 1, 1,
0.6596431, 1.245407, 1.678283, 1, 0, 0, 1, 1,
0.6639693, -1.145388, 2.270185, 1, 0, 0, 1, 1,
0.6678614, 0.2679662, 0.1915866, 0, 0, 0, 1, 1,
0.6745557, 0.2156426, 0.9341529, 0, 0, 0, 1, 1,
0.6761549, 0.1185927, 1.95182, 0, 0, 0, 1, 1,
0.6776507, -0.3119835, 2.161546, 0, 0, 0, 1, 1,
0.6786389, -0.7750885, 4.399453, 0, 0, 0, 1, 1,
0.683439, -0.5223194, 2.231059, 0, 0, 0, 1, 1,
0.6862786, -1.070282, 3.426847, 0, 0, 0, 1, 1,
0.6936027, -1.545756, 0.9215842, 1, 1, 1, 1, 1,
0.6938346, 0.517336, -0.01252923, 1, 1, 1, 1, 1,
0.6940238, -0.02477984, 3.015525, 1, 1, 1, 1, 1,
0.694056, 0.245938, 0.5832148, 1, 1, 1, 1, 1,
0.6953313, 0.6134579, 2.020314, 1, 1, 1, 1, 1,
0.6957416, 0.5645062, 0.5354515, 1, 1, 1, 1, 1,
0.6981397, 0.3782101, 1.509314, 1, 1, 1, 1, 1,
0.7018573, -0.09314466, 2.83967, 1, 1, 1, 1, 1,
0.7030663, 0.08152188, 1.167969, 1, 1, 1, 1, 1,
0.7040962, 0.4520974, 3.123506, 1, 1, 1, 1, 1,
0.7043275, 1.556763, 2.805471, 1, 1, 1, 1, 1,
0.7051482, -0.6810771, 1.29775, 1, 1, 1, 1, 1,
0.7237601, 0.03639258, 1.658509, 1, 1, 1, 1, 1,
0.731455, -0.09132523, 0.7986572, 1, 1, 1, 1, 1,
0.7339564, 0.5216334, 1.375858, 1, 1, 1, 1, 1,
0.7386224, 1.705559, -1.369207, 0, 0, 1, 1, 1,
0.7430293, 0.004726247, 0.5769721, 1, 0, 0, 1, 1,
0.7446247, -0.1165763, 2.325054, 1, 0, 0, 1, 1,
0.7481549, 0.7146587, -0.1634823, 1, 0, 0, 1, 1,
0.7560028, -0.1279144, 0.3602727, 1, 0, 0, 1, 1,
0.7594938, -0.5153493, -0.9747882, 1, 0, 0, 1, 1,
0.7697427, 0.8831542, -0.08165227, 0, 0, 0, 1, 1,
0.7705445, -0.2589287, 2.498004, 0, 0, 0, 1, 1,
0.7722197, 0.2078238, 2.57633, 0, 0, 0, 1, 1,
0.7729041, 0.5174266, 0.4334868, 0, 0, 0, 1, 1,
0.7864041, 0.1625367, 1.027579, 0, 0, 0, 1, 1,
0.7869949, -0.2273962, 2.300114, 0, 0, 0, 1, 1,
0.7891998, 1.291731, -1.147967, 0, 0, 0, 1, 1,
0.7900744, 0.2255693, 1.485995, 1, 1, 1, 1, 1,
0.8048218, -1.475322, 1.894795, 1, 1, 1, 1, 1,
0.8077883, -0.9766976, 4.778275, 1, 1, 1, 1, 1,
0.8080921, 0.3467756, 2.259147, 1, 1, 1, 1, 1,
0.816745, -1.4183, 3.383711, 1, 1, 1, 1, 1,
0.8208445, -0.3716387, 3.242188, 1, 1, 1, 1, 1,
0.8225384, 0.8106822, -0.6349252, 1, 1, 1, 1, 1,
0.82271, -0.1509751, 2.543355, 1, 1, 1, 1, 1,
0.8257667, -0.8286636, 1.731528, 1, 1, 1, 1, 1,
0.829143, -1.630934, 4.076112, 1, 1, 1, 1, 1,
0.8301123, 0.1808331, 4.326429, 1, 1, 1, 1, 1,
0.8349491, 1.344486, 0.0058876, 1, 1, 1, 1, 1,
0.8456631, 1.08939, 1.75181, 1, 1, 1, 1, 1,
0.8499033, -0.3424569, 1.168195, 1, 1, 1, 1, 1,
0.8542398, 0.3792476, -0.946429, 1, 1, 1, 1, 1,
0.8549266, 1.822845, 1.748027, 0, 0, 1, 1, 1,
0.8551252, -0.1075737, 2.191741, 1, 0, 0, 1, 1,
0.8552867, -1.029479, 2.357832, 1, 0, 0, 1, 1,
0.8575504, -0.06033934, 1.386342, 1, 0, 0, 1, 1,
0.859664, -0.8813853, 1.846152, 1, 0, 0, 1, 1,
0.8599, -0.454163, 3.037645, 1, 0, 0, 1, 1,
0.8601397, 0.4009403, 1.962744, 0, 0, 0, 1, 1,
0.8646973, -1.589641, 1.30834, 0, 0, 0, 1, 1,
0.8655717, 0.7275336, 0.6013647, 0, 0, 0, 1, 1,
0.8669636, 1.030799, 0.5132827, 0, 0, 0, 1, 1,
0.8679636, 1.586847, 0.4214603, 0, 0, 0, 1, 1,
0.8684512, -1.973574, 3.204987, 0, 0, 0, 1, 1,
0.875138, -0.3656574, 3.986782, 0, 0, 0, 1, 1,
0.8773603, -1.28043, 2.474874, 1, 1, 1, 1, 1,
0.8783919, 0.1203257, 2.097178, 1, 1, 1, 1, 1,
0.8790146, 0.03106369, 3.269075, 1, 1, 1, 1, 1,
0.8791247, -0.1405849, 2.587322, 1, 1, 1, 1, 1,
0.8814179, -1.884076, 4.190126, 1, 1, 1, 1, 1,
0.8838315, 0.1332828, 1.82217, 1, 1, 1, 1, 1,
0.8883048, -0.02270074, 0.8097602, 1, 1, 1, 1, 1,
0.8893579, 2.371804, 0.4095306, 1, 1, 1, 1, 1,
0.893119, 0.4308307, -0.1541938, 1, 1, 1, 1, 1,
0.897966, -0.6612928, 0.656652, 1, 1, 1, 1, 1,
0.8982005, 1.35571, 0.430575, 1, 1, 1, 1, 1,
0.9015344, -1.044928, 2.794359, 1, 1, 1, 1, 1,
0.9081628, 0.2940157, 0.5367451, 1, 1, 1, 1, 1,
0.9083382, -1.680233, 3.337126, 1, 1, 1, 1, 1,
0.9106656, -0.3987491, 3.779392, 1, 1, 1, 1, 1,
0.9126883, 1.946131, 0.9477244, 0, 0, 1, 1, 1,
0.9175248, 0.9280121, 1.833483, 1, 0, 0, 1, 1,
0.9184994, 1.321223, 1.271388, 1, 0, 0, 1, 1,
0.9204581, 1.367177, 0.09435918, 1, 0, 0, 1, 1,
0.9260163, -0.3089683, 1.309211, 1, 0, 0, 1, 1,
0.933463, -0.2911499, 2.5652, 1, 0, 0, 1, 1,
0.9339519, 0.4747143, 0.7018248, 0, 0, 0, 1, 1,
0.9384995, 1.696047, -0.4355187, 0, 0, 0, 1, 1,
0.9404048, 0.3647793, 0.6097105, 0, 0, 0, 1, 1,
0.9497843, -0.6403123, 1.442864, 0, 0, 0, 1, 1,
0.9517881, 0.7872997, 0.9131411, 0, 0, 0, 1, 1,
0.953895, -1.277548, 0.1489688, 0, 0, 0, 1, 1,
0.9595416, -0.2422915, 0.9853708, 0, 0, 0, 1, 1,
0.9600223, 0.5105648, -0.8464593, 1, 1, 1, 1, 1,
0.9630819, 0.04420832, 2.280833, 1, 1, 1, 1, 1,
0.9654303, 1.041629, -0.7246631, 1, 1, 1, 1, 1,
0.9717258, -0.7996891, 3.428108, 1, 1, 1, 1, 1,
0.9731396, 0.03225078, 1.599874, 1, 1, 1, 1, 1,
0.9736963, 0.9897604, 0.7592334, 1, 1, 1, 1, 1,
0.9764336, -0.37979, 3.196795, 1, 1, 1, 1, 1,
0.9784681, -0.6504266, 1.819139, 1, 1, 1, 1, 1,
0.9938821, 0.6286818, 1.255991, 1, 1, 1, 1, 1,
0.9998036, 0.5319051, 0.001614211, 1, 1, 1, 1, 1,
1.007149, -0.1934021, 1.579716, 1, 1, 1, 1, 1,
1.008078, -0.6402829, 3.94637, 1, 1, 1, 1, 1,
1.011167, 0.9036922, 1.548589, 1, 1, 1, 1, 1,
1.014103, -0.430544, 3.387265, 1, 1, 1, 1, 1,
1.015843, -0.5590013, 1.964055, 1, 1, 1, 1, 1,
1.02793, -1.705558, 3.161972, 0, 0, 1, 1, 1,
1.029591, 0.8040239, 0.2872134, 1, 0, 0, 1, 1,
1.031358, -0.347429, 1.718142, 1, 0, 0, 1, 1,
1.031619, -0.8492838, 2.494499, 1, 0, 0, 1, 1,
1.032188, 1.051696, 0.6363372, 1, 0, 0, 1, 1,
1.044363, -0.5863092, 2.58954, 1, 0, 0, 1, 1,
1.050648, -0.8833156, 2.074054, 0, 0, 0, 1, 1,
1.053291, 1.11957, -1.360252, 0, 0, 0, 1, 1,
1.054611, -1.224092, 2.699547, 0, 0, 0, 1, 1,
1.054993, -0.9126781, 2.097827, 0, 0, 0, 1, 1,
1.061237, -0.3415941, 2.596111, 0, 0, 0, 1, 1,
1.067422, 0.5006001, 1.450982, 0, 0, 0, 1, 1,
1.069689, 0.04182383, 1.834161, 0, 0, 0, 1, 1,
1.071235, 0.8054169, 1.067968, 1, 1, 1, 1, 1,
1.072828, 1.062902, 1.680649, 1, 1, 1, 1, 1,
1.079693, -1.557135, 2.439459, 1, 1, 1, 1, 1,
1.081757, -1.801336, 3.032482, 1, 1, 1, 1, 1,
1.083024, -1.355235, 2.247259, 1, 1, 1, 1, 1,
1.083133, -0.1155409, 3.327822, 1, 1, 1, 1, 1,
1.085607, 0.640584, 1.06512, 1, 1, 1, 1, 1,
1.093758, 1.049051, -0.7517481, 1, 1, 1, 1, 1,
1.098394, -1.858029, 2.468611, 1, 1, 1, 1, 1,
1.099679, 0.4052728, 1.286693, 1, 1, 1, 1, 1,
1.103486, 1.080459, 1.825427, 1, 1, 1, 1, 1,
1.104651, -1.677683, 1.438393, 1, 1, 1, 1, 1,
1.106929, 0.3114929, -0.1956837, 1, 1, 1, 1, 1,
1.108075, -0.7856106, 4.992128, 1, 1, 1, 1, 1,
1.12026, -0.3766367, 2.107468, 1, 1, 1, 1, 1,
1.120631, 0.1511763, -1.104739, 0, 0, 1, 1, 1,
1.132151, 0.8527895, 0.1061749, 1, 0, 0, 1, 1,
1.156238, 0.2045638, 1.62638, 1, 0, 0, 1, 1,
1.156958, -0.0871201, 1.667513, 1, 0, 0, 1, 1,
1.157942, -0.262558, 2.380587, 1, 0, 0, 1, 1,
1.160451, -0.1615392, 2.08445, 1, 0, 0, 1, 1,
1.164273, -0.6879839, 1.584835, 0, 0, 0, 1, 1,
1.164928, 0.173335, -0.4922528, 0, 0, 0, 1, 1,
1.177886, 1.051379, 1.2416, 0, 0, 0, 1, 1,
1.179448, -0.1275241, 3.16125, 0, 0, 0, 1, 1,
1.18009, -0.07337376, 2.48088, 0, 0, 0, 1, 1,
1.180252, 0.9300352, 1.845235, 0, 0, 0, 1, 1,
1.185819, 1.911115, -0.3154781, 0, 0, 0, 1, 1,
1.189739, -0.9287297, 2.856682, 1, 1, 1, 1, 1,
1.192797, -0.399573, 0.8721041, 1, 1, 1, 1, 1,
1.19662, -2.411959, 5.289153, 1, 1, 1, 1, 1,
1.197002, -0.6516067, 1.510675, 1, 1, 1, 1, 1,
1.197798, -0.08528572, 2.234714, 1, 1, 1, 1, 1,
1.200875, -1.28628, 1.239916, 1, 1, 1, 1, 1,
1.203069, 1.012267, 0.7198036, 1, 1, 1, 1, 1,
1.212491, -0.384613, 2.002242, 1, 1, 1, 1, 1,
1.218382, -0.3357327, 1.814158, 1, 1, 1, 1, 1,
1.24199, 0.06925326, 2.652053, 1, 1, 1, 1, 1,
1.248048, -0.1346138, 1.695378, 1, 1, 1, 1, 1,
1.252126, 0.9443237, -0.9110436, 1, 1, 1, 1, 1,
1.254638, -0.8048079, 2.887801, 1, 1, 1, 1, 1,
1.255732, -0.4410535, 2.198221, 1, 1, 1, 1, 1,
1.258729, -0.7344475, 3.26881, 1, 1, 1, 1, 1,
1.263199, -0.5340861, 1.048059, 0, 0, 1, 1, 1,
1.271107, 0.9913895, -0.4757213, 1, 0, 0, 1, 1,
1.272593, -1.398244, 2.501585, 1, 0, 0, 1, 1,
1.285474, 0.134056, 3.041203, 1, 0, 0, 1, 1,
1.288409, 0.1257908, 2.603687, 1, 0, 0, 1, 1,
1.289397, 0.05677762, 1.896114, 1, 0, 0, 1, 1,
1.304729, -0.3747156, 2.263857, 0, 0, 0, 1, 1,
1.305374, -1.074163, 2.013589, 0, 0, 0, 1, 1,
1.310865, 1.252677, 1.591759, 0, 0, 0, 1, 1,
1.325328, -0.6982672, 1.618776, 0, 0, 0, 1, 1,
1.326092, -1.18202, 0.4005243, 0, 0, 0, 1, 1,
1.364637, 0.5904848, 0.3313224, 0, 0, 0, 1, 1,
1.367654, 0.5461782, 1.078286, 0, 0, 0, 1, 1,
1.373598, 0.2871318, 1.903672, 1, 1, 1, 1, 1,
1.375405, 0.6255466, -0.09272613, 1, 1, 1, 1, 1,
1.376968, 0.7292879, -0.3826865, 1, 1, 1, 1, 1,
1.377541, 0.4741416, 1.243915, 1, 1, 1, 1, 1,
1.377855, -0.5170946, 1.822118, 1, 1, 1, 1, 1,
1.379252, 0.7325913, 2.953284, 1, 1, 1, 1, 1,
1.383799, 0.933832, 0.6887664, 1, 1, 1, 1, 1,
1.390587, 0.297934, 1.775836, 1, 1, 1, 1, 1,
1.393064, 0.06498065, 1.171007, 1, 1, 1, 1, 1,
1.398135, -1.207054, 1.694182, 1, 1, 1, 1, 1,
1.408424, 0.2953181, 2.007437, 1, 1, 1, 1, 1,
1.416274, -0.8149332, 3.174919, 1, 1, 1, 1, 1,
1.422843, 0.4871166, 0.674519, 1, 1, 1, 1, 1,
1.456141, -0.4853192, 3.108234, 1, 1, 1, 1, 1,
1.45643, 0.4872857, 0.653097, 1, 1, 1, 1, 1,
1.460658, -1.246681, 0.3068131, 0, 0, 1, 1, 1,
1.462808, -2.417124, 1.783384, 1, 0, 0, 1, 1,
1.474699, -0.8468861, 1.511331, 1, 0, 0, 1, 1,
1.474861, -0.4102977, 2.835805, 1, 0, 0, 1, 1,
1.481015, -0.7953815, 2.402883, 1, 0, 0, 1, 1,
1.494131, -0.8027171, -0.1567266, 1, 0, 0, 1, 1,
1.515787, 0.6521485, -0.281207, 0, 0, 0, 1, 1,
1.522418, 1.488458, 0.5462481, 0, 0, 0, 1, 1,
1.533302, 2.403972, 1.50439, 0, 0, 0, 1, 1,
1.53824, -0.7243989, 1.87747, 0, 0, 0, 1, 1,
1.54437, -0.5423453, 2.394069, 0, 0, 0, 1, 1,
1.547027, 0.4711686, 0.8484963, 0, 0, 0, 1, 1,
1.559529, -1.333384, 1.509246, 0, 0, 0, 1, 1,
1.56046, 0.6749605, 1.725813, 1, 1, 1, 1, 1,
1.565044, -0.9384481, 2.798006, 1, 1, 1, 1, 1,
1.568322, -0.4176979, 1.297324, 1, 1, 1, 1, 1,
1.577684, -0.9107884, 2.893531, 1, 1, 1, 1, 1,
1.605972, 0.2745667, 1.75211, 1, 1, 1, 1, 1,
1.606451, -0.2054952, 1.105288, 1, 1, 1, 1, 1,
1.618948, -1.338045, 3.943459, 1, 1, 1, 1, 1,
1.621246, 1.772739, 0.8885363, 1, 1, 1, 1, 1,
1.621931, -0.4155181, 1.076817, 1, 1, 1, 1, 1,
1.625318, -1.723665, 2.596244, 1, 1, 1, 1, 1,
1.630116, -2.723646, 1.742404, 1, 1, 1, 1, 1,
1.636469, -0.6867056, 1.356469, 1, 1, 1, 1, 1,
1.639229, -0.3101909, 1.234982, 1, 1, 1, 1, 1,
1.650019, -1.38226, 0.7622641, 1, 1, 1, 1, 1,
1.668829, 0.7423805, 0.3929674, 1, 1, 1, 1, 1,
1.66984, -1.066592, 3.228476, 0, 0, 1, 1, 1,
1.676781, 0.4795362, 0.5358072, 1, 0, 0, 1, 1,
1.683338, 1.087063, 1.517314, 1, 0, 0, 1, 1,
1.685694, -0.6587899, 0.8946154, 1, 0, 0, 1, 1,
1.700546, 0.1863673, 0.04923686, 1, 0, 0, 1, 1,
1.701898, 1.001604, 1.167819, 1, 0, 0, 1, 1,
1.70191, 1.315957, 3.446346, 0, 0, 0, 1, 1,
1.709616, -0.6578429, 0.7078084, 0, 0, 0, 1, 1,
1.753529, -1.197684, 1.660721, 0, 0, 0, 1, 1,
1.770731, -0.7957352, 1.977934, 0, 0, 0, 1, 1,
1.771015, -0.5830539, 4.227726, 0, 0, 0, 1, 1,
1.776396, 0.1765979, 2.396572, 0, 0, 0, 1, 1,
1.778946, 0.1485846, 0.3855081, 0, 0, 0, 1, 1,
1.785686, -0.7193714, 3.783352, 1, 1, 1, 1, 1,
1.807536, 1.131393, -0.609705, 1, 1, 1, 1, 1,
1.816041, -0.945169, 3.161518, 1, 1, 1, 1, 1,
1.832829, -1.13469, 3.520706, 1, 1, 1, 1, 1,
1.849595, 0.8372818, 1.373533, 1, 1, 1, 1, 1,
1.851689, 1.678899, 1.265998, 1, 1, 1, 1, 1,
1.867149, -2.142905, 3.119144, 1, 1, 1, 1, 1,
1.937315, -0.9307255, 2.436543, 1, 1, 1, 1, 1,
1.941666, -1.212178, 1.198318, 1, 1, 1, 1, 1,
1.947228, 0.03797128, 2.655676, 1, 1, 1, 1, 1,
1.992024, 0.636055, 2.391271, 1, 1, 1, 1, 1,
2.015461, 0.54294, 3.185938, 1, 1, 1, 1, 1,
2.017472, 0.1509964, 0.7368927, 1, 1, 1, 1, 1,
2.018833, 1.901074, 1.037653, 1, 1, 1, 1, 1,
2.025749, 0.5597162, 0.5594162, 1, 1, 1, 1, 1,
2.037202, 0.5707732, 1.491366, 0, 0, 1, 1, 1,
2.051692, 0.817478, 2.468483, 1, 0, 0, 1, 1,
2.077776, 0.1805416, 0.4528596, 1, 0, 0, 1, 1,
2.080403, -2.912991, 3.567741, 1, 0, 0, 1, 1,
2.164257, -1.162551, 4.352859, 1, 0, 0, 1, 1,
2.239187, -0.611498, 1.276252, 1, 0, 0, 1, 1,
2.286965, 0.8461308, 1.840261, 0, 0, 0, 1, 1,
2.303395, -0.8277224, 0.8707867, 0, 0, 0, 1, 1,
2.314551, -0.03010989, 0.8118942, 0, 0, 0, 1, 1,
2.341326, 0.7038707, 2.276916, 0, 0, 0, 1, 1,
2.401769, -1.336345, 2.892809, 0, 0, 0, 1, 1,
2.403714, -0.7462099, 3.561761, 0, 0, 0, 1, 1,
2.518475, -0.5158198, 2.197194, 0, 0, 0, 1, 1,
2.593792, -0.1886145, 2.155502, 1, 1, 1, 1, 1,
2.628519, 1.050444, -0.2418567, 1, 1, 1, 1, 1,
2.725292, -0.9931892, 1.875526, 1, 1, 1, 1, 1,
2.831302, 2.08423, 1.163515, 1, 1, 1, 1, 1,
2.882291, -1.154688, 2.112176, 1, 1, 1, 1, 1,
3.024745, 1.088251, 0.5995876, 1, 1, 1, 1, 1,
3.071588, 0.06084384, 0.4635895, 1, 1, 1, 1, 1
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
var radius = 9.355621;
var distance = 32.86122;
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
mvMatrix.translate( -0.07130146, 0.03186703, -0.1888421 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.86122);
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
