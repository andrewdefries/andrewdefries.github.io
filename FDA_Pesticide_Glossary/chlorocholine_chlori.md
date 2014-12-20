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
-3.116467, -1.127782, -2.664488, 1, 0, 0, 1,
-2.783097, -0.2549862, -1.835361, 1, 0.007843138, 0, 1,
-2.682882, 0.8886985, -2.862876, 1, 0.01176471, 0, 1,
-2.631573, 1.172046, 1.583487, 1, 0.01960784, 0, 1,
-2.52069, 0.2717661, -1.695228, 1, 0.02352941, 0, 1,
-2.511209, 0.9167657, -2.505471, 1, 0.03137255, 0, 1,
-2.492047, 0.4676065, -3.739765, 1, 0.03529412, 0, 1,
-2.450352, 0.9771265, 0.01852955, 1, 0.04313726, 0, 1,
-2.416029, -0.4128674, -2.077065, 1, 0.04705882, 0, 1,
-2.349732, -0.8057524, -1.152335, 1, 0.05490196, 0, 1,
-2.306885, 0.9015931, -2.295773, 1, 0.05882353, 0, 1,
-2.299883, -1.430707, -2.322365, 1, 0.06666667, 0, 1,
-2.238538, 0.7029402, 0.2163088, 1, 0.07058824, 0, 1,
-2.216355, 2.623638, -0.9847161, 1, 0.07843138, 0, 1,
-2.195027, -0.001552382, -0.6152715, 1, 0.08235294, 0, 1,
-2.156904, 0.1695866, -1.10692, 1, 0.09019608, 0, 1,
-2.151186, -0.3261656, -2.160411, 1, 0.09411765, 0, 1,
-2.139195, -1.042815, -2.049489, 1, 0.1019608, 0, 1,
-2.127547, -1.471097, -2.352708, 1, 0.1098039, 0, 1,
-2.126516, -0.8521205, -0.4872648, 1, 0.1137255, 0, 1,
-2.121645, 0.1466072, -0.5887292, 1, 0.1215686, 0, 1,
-2.107265, 0.2900005, 0.7865847, 1, 0.1254902, 0, 1,
-2.095511, -0.1342435, -1.69654, 1, 0.1333333, 0, 1,
-2.063619, 0.2234679, -2.35752, 1, 0.1372549, 0, 1,
-2.028442, 0.5172638, -0.1675001, 1, 0.145098, 0, 1,
-2.002102, -1.938045, -2.513498, 1, 0.1490196, 0, 1,
-1.962674, -0.07601187, -2.939803, 1, 0.1568628, 0, 1,
-1.957672, 1.14866, -1.957286, 1, 0.1607843, 0, 1,
-1.94494, -0.384978, -2.061424, 1, 0.1686275, 0, 1,
-1.941502, -0.8355347, -2.437199, 1, 0.172549, 0, 1,
-1.934591, -0.2188931, -2.112137, 1, 0.1803922, 0, 1,
-1.877479, 0.8021077, -0.09651363, 1, 0.1843137, 0, 1,
-1.876277, -0.1884296, -1.616215, 1, 0.1921569, 0, 1,
-1.876228, 0.9100128, -0.07836346, 1, 0.1960784, 0, 1,
-1.875315, -0.05618817, -0.2261623, 1, 0.2039216, 0, 1,
-1.855084, -0.2809197, -1.375674, 1, 0.2117647, 0, 1,
-1.826629, -0.2177651, -2.141641, 1, 0.2156863, 0, 1,
-1.817137, 0.3993007, -1.969158, 1, 0.2235294, 0, 1,
-1.805774, 0.2605059, -2.205486, 1, 0.227451, 0, 1,
-1.802132, -0.03052338, -1.463311, 1, 0.2352941, 0, 1,
-1.775838, 2.346212, -0.4483405, 1, 0.2392157, 0, 1,
-1.763049, 0.6807581, -2.404269, 1, 0.2470588, 0, 1,
-1.760401, -1.819101, -2.546643, 1, 0.2509804, 0, 1,
-1.756245, -1.334398, -1.249491, 1, 0.2588235, 0, 1,
-1.756169, 0.5001112, -1.347873, 1, 0.2627451, 0, 1,
-1.741833, -1.147693, -1.900303, 1, 0.2705882, 0, 1,
-1.727342, -1.361417, -1.282806, 1, 0.2745098, 0, 1,
-1.718691, -1.465365, -2.317922, 1, 0.282353, 0, 1,
-1.714808, -0.4626804, -1.20578, 1, 0.2862745, 0, 1,
-1.699061, -1.730082, -2.930294, 1, 0.2941177, 0, 1,
-1.695564, 0.6925042, -2.739257, 1, 0.3019608, 0, 1,
-1.694767, 1.39113, 0.4615779, 1, 0.3058824, 0, 1,
-1.690177, -0.4672578, -0.6354655, 1, 0.3137255, 0, 1,
-1.687951, 0.5083605, 0.1218021, 1, 0.3176471, 0, 1,
-1.654452, 0.48101, -2.462126, 1, 0.3254902, 0, 1,
-1.646783, -0.4734502, -3.19408, 1, 0.3294118, 0, 1,
-1.644019, 0.519269, -0.8170907, 1, 0.3372549, 0, 1,
-1.633816, -1.250895, -3.828738, 1, 0.3411765, 0, 1,
-1.620717, 0.9484703, -1.065896, 1, 0.3490196, 0, 1,
-1.62013, -1.891563, -3.852987, 1, 0.3529412, 0, 1,
-1.616884, 1.221021, -0.5493307, 1, 0.3607843, 0, 1,
-1.614501, -0.6264501, -0.3541366, 1, 0.3647059, 0, 1,
-1.614415, -0.8951549, -2.716626, 1, 0.372549, 0, 1,
-1.60814, 0.8477021, -1.951324, 1, 0.3764706, 0, 1,
-1.597409, 0.8372394, -2.243811, 1, 0.3843137, 0, 1,
-1.592036, -0.1788233, -1.005972, 1, 0.3882353, 0, 1,
-1.580958, 0.01604132, -1.507185, 1, 0.3960784, 0, 1,
-1.578232, 0.1867769, -2.611248, 1, 0.4039216, 0, 1,
-1.565649, 1.273385, -0.6836037, 1, 0.4078431, 0, 1,
-1.56203, 0.2888504, -1.434461, 1, 0.4156863, 0, 1,
-1.559049, 0.01824266, -1.854733, 1, 0.4196078, 0, 1,
-1.557884, 2.401505, -1.070613, 1, 0.427451, 0, 1,
-1.549511, -1.186152, -2.572095, 1, 0.4313726, 0, 1,
-1.54337, 1.453275, -2.336661, 1, 0.4392157, 0, 1,
-1.541008, 0.4374739, -1.295269, 1, 0.4431373, 0, 1,
-1.517803, -0.2910399, -0.2269629, 1, 0.4509804, 0, 1,
-1.506492, -1.585536, -1.025398, 1, 0.454902, 0, 1,
-1.502145, -1.71615, -0.8455727, 1, 0.4627451, 0, 1,
-1.500819, -1.289889, -3.77526, 1, 0.4666667, 0, 1,
-1.491241, -0.3428304, -1.436631, 1, 0.4745098, 0, 1,
-1.483278, 0.9185097, -2.52407, 1, 0.4784314, 0, 1,
-1.467061, 1.057175, 0.6106953, 1, 0.4862745, 0, 1,
-1.464657, -0.5113728, -2.640096, 1, 0.4901961, 0, 1,
-1.458002, -0.1658868, -2.311238, 1, 0.4980392, 0, 1,
-1.452139, -0.1002435, -0.685607, 1, 0.5058824, 0, 1,
-1.451737, -0.8012447, -1.164387, 1, 0.509804, 0, 1,
-1.444074, -0.3173553, 0.4451631, 1, 0.5176471, 0, 1,
-1.440361, 0.1404961, -1.141775, 1, 0.5215687, 0, 1,
-1.431529, 1.506536, -1.82307, 1, 0.5294118, 0, 1,
-1.430956, 0.2252604, -1.804347, 1, 0.5333334, 0, 1,
-1.429276, -1.17837, -3.474827, 1, 0.5411765, 0, 1,
-1.424672, -0.4566871, -2.129004, 1, 0.5450981, 0, 1,
-1.423869, -0.9722819, -2.625622, 1, 0.5529412, 0, 1,
-1.417279, 1.748332, -1.715696, 1, 0.5568628, 0, 1,
-1.410721, 0.6848361, -1.632061, 1, 0.5647059, 0, 1,
-1.409924, 1.156864, -0.1395541, 1, 0.5686275, 0, 1,
-1.406607, 0.3301567, -1.714921, 1, 0.5764706, 0, 1,
-1.404, -0.3464414, -1.423628, 1, 0.5803922, 0, 1,
-1.401029, -0.4547242, -2.943171, 1, 0.5882353, 0, 1,
-1.393394, -0.5530243, -3.001858, 1, 0.5921569, 0, 1,
-1.379752, 0.510361, -2.113486, 1, 0.6, 0, 1,
-1.376789, 1.412469, 0.2788351, 1, 0.6078432, 0, 1,
-1.373824, -1.133285, -2.747625, 1, 0.6117647, 0, 1,
-1.372628, 0.1391748, -1.084746, 1, 0.6196079, 0, 1,
-1.367103, 0.3831882, -2.792494, 1, 0.6235294, 0, 1,
-1.359346, -0.4221328, -1.802441, 1, 0.6313726, 0, 1,
-1.357674, 0.2516192, -0.3063455, 1, 0.6352941, 0, 1,
-1.350341, 0.9386013, -0.2229205, 1, 0.6431373, 0, 1,
-1.346205, 0.9556017, 0.8065637, 1, 0.6470588, 0, 1,
-1.345595, 0.02044418, -1.422168, 1, 0.654902, 0, 1,
-1.331684, -1.037337, -2.116609, 1, 0.6588235, 0, 1,
-1.330849, -0.2201505, -3.086972, 1, 0.6666667, 0, 1,
-1.329765, -1.545528, -3.309121, 1, 0.6705883, 0, 1,
-1.329728, 0.9967883, -1.044333, 1, 0.6784314, 0, 1,
-1.321004, 0.7857938, -1.758573, 1, 0.682353, 0, 1,
-1.308726, -0.6527282, -2.742476, 1, 0.6901961, 0, 1,
-1.306045, 0.1790504, -0.03913785, 1, 0.6941177, 0, 1,
-1.297701, -0.5214808, -1.275639, 1, 0.7019608, 0, 1,
-1.283078, 0.4021637, -1.19503, 1, 0.7098039, 0, 1,
-1.278249, 0.06891823, -2.037598, 1, 0.7137255, 0, 1,
-1.278234, 0.4808616, -1.976907, 1, 0.7215686, 0, 1,
-1.271868, -0.7810126, -2.563957, 1, 0.7254902, 0, 1,
-1.259457, -1.039052, -3.513249, 1, 0.7333333, 0, 1,
-1.256405, 0.7022268, -2.502941, 1, 0.7372549, 0, 1,
-1.251969, 0.4758882, 1.048, 1, 0.7450981, 0, 1,
-1.242842, 0.7840194, -1.916246, 1, 0.7490196, 0, 1,
-1.242202, -0.3856844, -4.174552, 1, 0.7568628, 0, 1,
-1.234333, 0.02500904, -4.401785, 1, 0.7607843, 0, 1,
-1.228726, 1.537003, -0.2643372, 1, 0.7686275, 0, 1,
-1.227231, -0.5109408, -3.20933, 1, 0.772549, 0, 1,
-1.225158, 0.4779717, -1.962332, 1, 0.7803922, 0, 1,
-1.218364, 0.1480094, 0.8834644, 1, 0.7843137, 0, 1,
-1.215279, 0.2018814, -1.808143, 1, 0.7921569, 0, 1,
-1.214949, 0.2400063, -1.850528, 1, 0.7960784, 0, 1,
-1.212485, 1.281009, -1.245719, 1, 0.8039216, 0, 1,
-1.21209, -0.1632252, -3.705725, 1, 0.8117647, 0, 1,
-1.20787, -0.6547239, -3.145711, 1, 0.8156863, 0, 1,
-1.207021, -0.444235, -1.037963, 1, 0.8235294, 0, 1,
-1.197457, -0.7166299, -3.184744, 1, 0.827451, 0, 1,
-1.192961, -0.6540602, -1.863761, 1, 0.8352941, 0, 1,
-1.189942, -1.466485, 0.1165664, 1, 0.8392157, 0, 1,
-1.172503, -0.2083486, -1.386241, 1, 0.8470588, 0, 1,
-1.171002, -1.268211, -1.897008, 1, 0.8509804, 0, 1,
-1.168146, -1.180416, -1.9834, 1, 0.8588235, 0, 1,
-1.16596, 1.170148, 0.3457085, 1, 0.8627451, 0, 1,
-1.161766, -0.317407, -3.05424, 1, 0.8705882, 0, 1,
-1.155622, -1.314123, -3.375073, 1, 0.8745098, 0, 1,
-1.148851, -0.1672372, -0.559752, 1, 0.8823529, 0, 1,
-1.14872, 0.3106001, -1.448786, 1, 0.8862745, 0, 1,
-1.14687, -0.2221147, -0.6129424, 1, 0.8941177, 0, 1,
-1.146811, -1.38605, -1.719538, 1, 0.8980392, 0, 1,
-1.145149, 1.160097, 0.8194862, 1, 0.9058824, 0, 1,
-1.138714, -1.732038, -3.283767, 1, 0.9137255, 0, 1,
-1.137119, 1.776395, -0.660992, 1, 0.9176471, 0, 1,
-1.136893, 0.5041205, -2.136605, 1, 0.9254902, 0, 1,
-1.13242, -1.005736, -2.889337, 1, 0.9294118, 0, 1,
-1.130612, -1.29592, -2.235398, 1, 0.9372549, 0, 1,
-1.130148, -0.4977605, -2.08642, 1, 0.9411765, 0, 1,
-1.129153, 1.15776, 0.5590354, 1, 0.9490196, 0, 1,
-1.128955, 1.558222, -0.9741738, 1, 0.9529412, 0, 1,
-1.125597, -1.834902, -3.729031, 1, 0.9607843, 0, 1,
-1.110876, 0.8940812, -0.2105557, 1, 0.9647059, 0, 1,
-1.10961, -0.5006847, -1.678174, 1, 0.972549, 0, 1,
-1.106178, -1.609276, -2.769049, 1, 0.9764706, 0, 1,
-1.105131, 2.478015, -0.02327346, 1, 0.9843137, 0, 1,
-1.103285, 0.994853, -1.818185, 1, 0.9882353, 0, 1,
-1.098024, 1.265659, 0.2087206, 1, 0.9960784, 0, 1,
-1.096723, 0.8353121, -1.122821, 0.9960784, 1, 0, 1,
-1.09104, -1.182006, -3.244682, 0.9921569, 1, 0, 1,
-1.08373, 1.409326, -1.11524, 0.9843137, 1, 0, 1,
-1.082975, 0.5091811, -1.332387, 0.9803922, 1, 0, 1,
-1.081616, -0.003112779, -2.040397, 0.972549, 1, 0, 1,
-1.068713, 1.031719, -0.8481989, 0.9686275, 1, 0, 1,
-1.065521, 0.05281729, -1.988924, 0.9607843, 1, 0, 1,
-1.06204, 0.6298612, -1.04879, 0.9568627, 1, 0, 1,
-1.051975, 0.378701, -0.7080317, 0.9490196, 1, 0, 1,
-1.050959, 0.04704229, -1.631732, 0.945098, 1, 0, 1,
-1.047605, 1.22394, -0.8359079, 0.9372549, 1, 0, 1,
-1.045537, 1.866684, -0.4288145, 0.9333333, 1, 0, 1,
-1.040755, 0.1637261, -2.726057, 0.9254902, 1, 0, 1,
-1.036602, -1.364569, -4.424596, 0.9215686, 1, 0, 1,
-1.029794, 0.4394591, -0.3997911, 0.9137255, 1, 0, 1,
-1.028543, 0.635215, -0.8855785, 0.9098039, 1, 0, 1,
-1.024063, -0.2302638, -2.500236, 0.9019608, 1, 0, 1,
-1.022824, 0.05941856, -0.9825869, 0.8941177, 1, 0, 1,
-1.015171, 0.8564887, -0.4353116, 0.8901961, 1, 0, 1,
-1.004665, -1.29874, -1.889088, 0.8823529, 1, 0, 1,
-0.9938509, -1.400415, -3.686372, 0.8784314, 1, 0, 1,
-0.9930134, 0.7067544, -1.303796, 0.8705882, 1, 0, 1,
-0.9912857, 1.095845, -0.3640295, 0.8666667, 1, 0, 1,
-0.9879288, -0.1314296, -2.555661, 0.8588235, 1, 0, 1,
-0.9833149, 1.133122, -1.287469, 0.854902, 1, 0, 1,
-0.9745444, -2.043693, -3.742803, 0.8470588, 1, 0, 1,
-0.9668509, -1.357223, -2.256527, 0.8431373, 1, 0, 1,
-0.9667202, -0.9491996, -1.509845, 0.8352941, 1, 0, 1,
-0.9649678, -0.9864175, -3.573084, 0.8313726, 1, 0, 1,
-0.961245, -1.375634, -3.171827, 0.8235294, 1, 0, 1,
-0.958584, -0.06644516, -0.3025603, 0.8196079, 1, 0, 1,
-0.9576142, -0.03535647, -1.411704, 0.8117647, 1, 0, 1,
-0.9559356, 0.8223739, -2.456301, 0.8078431, 1, 0, 1,
-0.9556121, -1.746298, -2.495337, 0.8, 1, 0, 1,
-0.9537026, -0.808685, -0.2831193, 0.7921569, 1, 0, 1,
-0.9529111, 0.4534098, -0.3800435, 0.7882353, 1, 0, 1,
-0.9490846, 0.7359728, 0.134409, 0.7803922, 1, 0, 1,
-0.9361662, 0.9899052, 0.4211158, 0.7764706, 1, 0, 1,
-0.9358146, -0.5424953, -0.7102303, 0.7686275, 1, 0, 1,
-0.9301431, 0.942553, 0.5377395, 0.7647059, 1, 0, 1,
-0.9280242, 2.648426, -1.241114, 0.7568628, 1, 0, 1,
-0.9106469, -0.1744951, -2.186927, 0.7529412, 1, 0, 1,
-0.9070863, 0.1461843, -2.471493, 0.7450981, 1, 0, 1,
-0.9064618, 0.7276158, -1.75296, 0.7411765, 1, 0, 1,
-0.8981549, -1.20758, -2.530851, 0.7333333, 1, 0, 1,
-0.8964671, -0.9041757, -2.114428, 0.7294118, 1, 0, 1,
-0.8872998, -0.7353891, -3.049536, 0.7215686, 1, 0, 1,
-0.8815704, -1.60119, -2.168529, 0.7176471, 1, 0, 1,
-0.8811724, 0.2016589, -2.252978, 0.7098039, 1, 0, 1,
-0.8776258, 0.7362654, -0.6892584, 0.7058824, 1, 0, 1,
-0.8754057, -0.3129999, -1.24089, 0.6980392, 1, 0, 1,
-0.8742574, -0.2448145, -2.48285, 0.6901961, 1, 0, 1,
-0.8733413, 0.5669222, -0.7304854, 0.6862745, 1, 0, 1,
-0.8722314, -0.8895802, -0.5065499, 0.6784314, 1, 0, 1,
-0.8678465, 0.1057509, -1.635531, 0.6745098, 1, 0, 1,
-0.8643959, -0.03613251, -1.442654, 0.6666667, 1, 0, 1,
-0.8579569, 0.6132617, -3.427439, 0.6627451, 1, 0, 1,
-0.8518379, -0.02995972, -2.534858, 0.654902, 1, 0, 1,
-0.8518164, 0.7334538, -3.095416, 0.6509804, 1, 0, 1,
-0.8501451, -0.8798259, -1.175308, 0.6431373, 1, 0, 1,
-0.8492199, 0.6553366, -0.6672179, 0.6392157, 1, 0, 1,
-0.8472056, 0.5316798, -1.25704, 0.6313726, 1, 0, 1,
-0.8445626, 1.465569, -3.429646, 0.627451, 1, 0, 1,
-0.8439771, -0.4690404, -0.2846838, 0.6196079, 1, 0, 1,
-0.837205, 0.1959109, -1.818951, 0.6156863, 1, 0, 1,
-0.8360519, 0.2840889, -1.302794, 0.6078432, 1, 0, 1,
-0.8338231, -0.641605, -1.811058, 0.6039216, 1, 0, 1,
-0.8323184, -0.9860236, -3.382148, 0.5960785, 1, 0, 1,
-0.8277933, 0.06218653, -1.395294, 0.5882353, 1, 0, 1,
-0.8220973, -0.103374, -0.7949753, 0.5843138, 1, 0, 1,
-0.8203918, 1.285869, -2.77676, 0.5764706, 1, 0, 1,
-0.8195135, 1.571204, -2.80569, 0.572549, 1, 0, 1,
-0.819269, -0.5049576, -3.275563, 0.5647059, 1, 0, 1,
-0.8122945, -0.230223, -0.938727, 0.5607843, 1, 0, 1,
-0.8115482, -1.29476, -3.527745, 0.5529412, 1, 0, 1,
-0.8089913, 0.2735521, -0.1903292, 0.5490196, 1, 0, 1,
-0.8072753, -0.6213311, -1.062827, 0.5411765, 1, 0, 1,
-0.8060759, 1.491817, -0.291626, 0.5372549, 1, 0, 1,
-0.8060362, 1.214166, -0.8309671, 0.5294118, 1, 0, 1,
-0.8024755, -0.1228354, -2.92301, 0.5254902, 1, 0, 1,
-0.791133, -0.5606158, -1.381441, 0.5176471, 1, 0, 1,
-0.7845997, 0.5963364, 0.09691954, 0.5137255, 1, 0, 1,
-0.7734939, -0.8301675, -2.775832, 0.5058824, 1, 0, 1,
-0.7725432, 0.4281404, -1.727284, 0.5019608, 1, 0, 1,
-0.7716969, -0.7529131, -2.00368, 0.4941176, 1, 0, 1,
-0.7715279, -0.9139739, -2.797813, 0.4862745, 1, 0, 1,
-0.7662957, 0.5683151, -1.862269, 0.4823529, 1, 0, 1,
-0.7541069, 0.8266942, -0.4949081, 0.4745098, 1, 0, 1,
-0.7434883, -2.810445, -4.572013, 0.4705882, 1, 0, 1,
-0.7387591, 1.038267, 0.4137219, 0.4627451, 1, 0, 1,
-0.7367876, -0.4489601, -1.987922, 0.4588235, 1, 0, 1,
-0.7282659, -0.8607097, -3.141298, 0.4509804, 1, 0, 1,
-0.7183633, -0.002658311, -1.667472, 0.4470588, 1, 0, 1,
-0.7181515, 0.5240903, -2.183177, 0.4392157, 1, 0, 1,
-0.702518, 0.6634929, -1.530598, 0.4352941, 1, 0, 1,
-0.7001117, 1.927141, 1.240044, 0.427451, 1, 0, 1,
-0.695657, 0.5966305, -0.6016755, 0.4235294, 1, 0, 1,
-0.6952391, -0.5824535, -2.574498, 0.4156863, 1, 0, 1,
-0.6940246, 0.1081861, -1.521453, 0.4117647, 1, 0, 1,
-0.693484, -1.438437, -2.042664, 0.4039216, 1, 0, 1,
-0.6918344, -2.069758, -1.149982, 0.3960784, 1, 0, 1,
-0.6900631, 0.1428063, -1.043475, 0.3921569, 1, 0, 1,
-0.6899022, 0.8208105, -1.786949, 0.3843137, 1, 0, 1,
-0.6861585, 0.3129846, -0.319197, 0.3803922, 1, 0, 1,
-0.6826727, -1.24766, -3.272167, 0.372549, 1, 0, 1,
-0.6788604, -2.314823, -3.476526, 0.3686275, 1, 0, 1,
-0.677647, 0.154787, -0.4347332, 0.3607843, 1, 0, 1,
-0.6770414, -1.369179, -2.090927, 0.3568628, 1, 0, 1,
-0.6752291, 0.7947272, -3.260051, 0.3490196, 1, 0, 1,
-0.6747798, -0.007771094, -3.013702, 0.345098, 1, 0, 1,
-0.6741609, 0.9650124, 0.03139653, 0.3372549, 1, 0, 1,
-0.6732211, -0.2883581, -2.03082, 0.3333333, 1, 0, 1,
-0.6677589, 0.7350841, -3.159337, 0.3254902, 1, 0, 1,
-0.6650428, 0.3559448, -0.07628924, 0.3215686, 1, 0, 1,
-0.6617959, -0.7672197, -1.959857, 0.3137255, 1, 0, 1,
-0.6588413, 0.1465635, -1.475382, 0.3098039, 1, 0, 1,
-0.6572624, -0.3726992, -2.404071, 0.3019608, 1, 0, 1,
-0.6547818, -0.8614457, -1.680324, 0.2941177, 1, 0, 1,
-0.650587, -0.3043667, -2.644735, 0.2901961, 1, 0, 1,
-0.6494699, -0.1691069, -2.23196, 0.282353, 1, 0, 1,
-0.6450527, -1.041344, -2.038136, 0.2784314, 1, 0, 1,
-0.6382728, 1.786718, -0.2455055, 0.2705882, 1, 0, 1,
-0.6379594, 1.426376, -0.4267938, 0.2666667, 1, 0, 1,
-0.6359841, 0.3446082, -0.1154026, 0.2588235, 1, 0, 1,
-0.6317001, 0.4556491, -3.769831, 0.254902, 1, 0, 1,
-0.630024, -0.02614464, -2.540853, 0.2470588, 1, 0, 1,
-0.6296653, 2.76655, 0.5153983, 0.2431373, 1, 0, 1,
-0.6169153, -1.009289, -2.489289, 0.2352941, 1, 0, 1,
-0.6120722, 0.8538007, -0.6663532, 0.2313726, 1, 0, 1,
-0.6119122, -1.402484, -3.586087, 0.2235294, 1, 0, 1,
-0.6064846, 1.404611, -0.6861054, 0.2196078, 1, 0, 1,
-0.6031635, -0.1340725, -1.86808, 0.2117647, 1, 0, 1,
-0.6003196, -0.3492903, -2.179889, 0.2078431, 1, 0, 1,
-0.598088, 0.9141486, -0.8179084, 0.2, 1, 0, 1,
-0.5933842, 0.1710727, -2.896547, 0.1921569, 1, 0, 1,
-0.5843427, 1.164889, -0.3146034, 0.1882353, 1, 0, 1,
-0.5795835, -0.1921626, -2.427851, 0.1803922, 1, 0, 1,
-0.5777658, 2.008314, 0.3327267, 0.1764706, 1, 0, 1,
-0.5668731, -0.5893383, -2.7052, 0.1686275, 1, 0, 1,
-0.5664705, 1.246457, 0.4104464, 0.1647059, 1, 0, 1,
-0.5660316, 1.479378, 0.6323475, 0.1568628, 1, 0, 1,
-0.5582561, 1.146852, 0.1907101, 0.1529412, 1, 0, 1,
-0.5531998, -1.084824, -2.174641, 0.145098, 1, 0, 1,
-0.5488079, -0.4538746, -1.228675, 0.1411765, 1, 0, 1,
-0.5481512, 1.403947, -1.194483, 0.1333333, 1, 0, 1,
-0.5384866, -1.906546, -1.71495, 0.1294118, 1, 0, 1,
-0.5366558, 3.077667, -0.9578829, 0.1215686, 1, 0, 1,
-0.5267524, 0.5484543, 0.06072341, 0.1176471, 1, 0, 1,
-0.5238037, -1.231864, -3.342928, 0.1098039, 1, 0, 1,
-0.5228679, -0.985984, -2.867124, 0.1058824, 1, 0, 1,
-0.5156894, -0.7104253, -2.404381, 0.09803922, 1, 0, 1,
-0.5153347, -0.2020179, -2.71639, 0.09019608, 1, 0, 1,
-0.5145353, -1.442106, -2.684871, 0.08627451, 1, 0, 1,
-0.5112136, -0.07739535, -1.764483, 0.07843138, 1, 0, 1,
-0.5082, 2.326835, -2.004556, 0.07450981, 1, 0, 1,
-0.505504, 0.1932871, -2.048267, 0.06666667, 1, 0, 1,
-0.5034471, 0.9708377, -0.3774205, 0.0627451, 1, 0, 1,
-0.5024126, -0.6674549, -2.298316, 0.05490196, 1, 0, 1,
-0.5016409, 0.428175, -0.3186262, 0.05098039, 1, 0, 1,
-0.5004094, -1.440207, -2.806697, 0.04313726, 1, 0, 1,
-0.4999224, 0.1943232, -1.660163, 0.03921569, 1, 0, 1,
-0.499697, -0.3195058, -1.471304, 0.03137255, 1, 0, 1,
-0.4975971, 0.349715, -0.8840363, 0.02745098, 1, 0, 1,
-0.4974833, 0.5057489, -2.407779, 0.01960784, 1, 0, 1,
-0.4945697, 0.1034184, -0.3592594, 0.01568628, 1, 0, 1,
-0.4909068, 0.1117168, -2.690004, 0.007843138, 1, 0, 1,
-0.4807727, -0.08762176, -0.7769674, 0.003921569, 1, 0, 1,
-0.4790933, -0.4113378, -3.721525, 0, 1, 0.003921569, 1,
-0.4790695, 1.048711, -0.36949, 0, 1, 0.01176471, 1,
-0.4771459, 0.4538289, 0.6113973, 0, 1, 0.01568628, 1,
-0.4768729, -0.3651581, -2.434876, 0, 1, 0.02352941, 1,
-0.4744628, -1.487403, -2.778708, 0, 1, 0.02745098, 1,
-0.4704489, 0.02007298, -1.874994, 0, 1, 0.03529412, 1,
-0.4678987, 0.1243757, -1.933512, 0, 1, 0.03921569, 1,
-0.4614528, -0.1994893, -1.934632, 0, 1, 0.04705882, 1,
-0.4609798, 0.2933302, -0.8046381, 0, 1, 0.05098039, 1,
-0.4528131, -0.7837588, -3.424557, 0, 1, 0.05882353, 1,
-0.4435493, 0.7244946, -3.230924, 0, 1, 0.0627451, 1,
-0.4394957, 1.753105, -1.646572, 0, 1, 0.07058824, 1,
-0.4355381, 1.559033, -0.05489558, 0, 1, 0.07450981, 1,
-0.4345355, -1.786209, -3.952197, 0, 1, 0.08235294, 1,
-0.4302439, -0.9019594, -3.768013, 0, 1, 0.08627451, 1,
-0.4301008, 1.627275, 0.9305233, 0, 1, 0.09411765, 1,
-0.427907, -2.038884, -4.001456, 0, 1, 0.1019608, 1,
-0.4273596, -0.5774973, -1.640387, 0, 1, 0.1058824, 1,
-0.4271574, -0.6554822, -4.294621, 0, 1, 0.1137255, 1,
-0.4261315, -1.431915, -3.348033, 0, 1, 0.1176471, 1,
-0.4250746, 0.595803, -1.314506, 0, 1, 0.1254902, 1,
-0.4205006, 1.893506, -0.404109, 0, 1, 0.1294118, 1,
-0.4181173, -0.4708542, -2.419464, 0, 1, 0.1372549, 1,
-0.4132153, 0.4791605, -1.354581, 0, 1, 0.1411765, 1,
-0.4128701, 0.9837101, 0.3402105, 0, 1, 0.1490196, 1,
-0.4100083, 0.479051, -0.8238242, 0, 1, 0.1529412, 1,
-0.4068804, 1.159904, -2.284327, 0, 1, 0.1607843, 1,
-0.4036633, 1.383997, -0.3766664, 0, 1, 0.1647059, 1,
-0.4018959, 0.1712269, -0.169109, 0, 1, 0.172549, 1,
-0.3972436, 0.6562501, -0.9427435, 0, 1, 0.1764706, 1,
-0.3962104, -0.5764244, -2.010651, 0, 1, 0.1843137, 1,
-0.3960382, 0.3070489, -0.658242, 0, 1, 0.1882353, 1,
-0.3946752, -1.356233, -2.949057, 0, 1, 0.1960784, 1,
-0.3929302, -0.2550724, -2.743702, 0, 1, 0.2039216, 1,
-0.3928986, 0.2015221, -3.856135, 0, 1, 0.2078431, 1,
-0.3920009, 2.104995, 0.7069827, 0, 1, 0.2156863, 1,
-0.3909583, -0.1592248, -1.669973, 0, 1, 0.2196078, 1,
-0.3900761, -1.796676, -3.728196, 0, 1, 0.227451, 1,
-0.3876466, -0.4275212, -2.071248, 0, 1, 0.2313726, 1,
-0.3857737, 0.9068546, 2.096278, 0, 1, 0.2392157, 1,
-0.3815718, -1.629316, -2.489332, 0, 1, 0.2431373, 1,
-0.3794193, 0.9030631, -1.280202, 0, 1, 0.2509804, 1,
-0.3785492, 2.325883, -0.2623158, 0, 1, 0.254902, 1,
-0.3784362, -2.935136, -3.740736, 0, 1, 0.2627451, 1,
-0.3680619, 0.8108056, -0.796928, 0, 1, 0.2666667, 1,
-0.3657053, -1.131067, -4.88518, 0, 1, 0.2745098, 1,
-0.3619153, -0.3142725, -1.619316, 0, 1, 0.2784314, 1,
-0.3585342, 0.1403286, 0.05818039, 0, 1, 0.2862745, 1,
-0.3555439, -1.153938, -0.7231781, 0, 1, 0.2901961, 1,
-0.3546083, 0.1440643, -0.2055001, 0, 1, 0.2980392, 1,
-0.3502545, 0.9678302, -0.8903834, 0, 1, 0.3058824, 1,
-0.3494968, -0.451082, -1.100996, 0, 1, 0.3098039, 1,
-0.3493666, 1.319856, -0.3125603, 0, 1, 0.3176471, 1,
-0.3403743, 0.2972104, -1.361538, 0, 1, 0.3215686, 1,
-0.3389597, -0.3081824, -2.286009, 0, 1, 0.3294118, 1,
-0.3387678, -1.34433, -3.674892, 0, 1, 0.3333333, 1,
-0.3382149, 0.07540582, -0.4216009, 0, 1, 0.3411765, 1,
-0.3328848, -0.001714826, -0.4079226, 0, 1, 0.345098, 1,
-0.3325094, -1.655865, -3.5189, 0, 1, 0.3529412, 1,
-0.3284319, -1.250514, -3.987103, 0, 1, 0.3568628, 1,
-0.3261858, 1.480249, -0.845818, 0, 1, 0.3647059, 1,
-0.3240567, 1.255983, 0.270197, 0, 1, 0.3686275, 1,
-0.3221379, 1.051442, -1.07221, 0, 1, 0.3764706, 1,
-0.3219208, -0.03529578, -3.115121, 0, 1, 0.3803922, 1,
-0.3207029, 1.583108, 0.2865493, 0, 1, 0.3882353, 1,
-0.3178901, 0.329188, -1.833391, 0, 1, 0.3921569, 1,
-0.3171217, -0.7955391, -2.978086, 0, 1, 0.4, 1,
-0.3157925, -0.5517563, -3.877634, 0, 1, 0.4078431, 1,
-0.3110014, -1.49768, -3.417309, 0, 1, 0.4117647, 1,
-0.3076443, -0.988777, -2.54337, 0, 1, 0.4196078, 1,
-0.3052092, 0.2030574, -0.5223933, 0, 1, 0.4235294, 1,
-0.3052002, 0.06640516, -1.407954, 0, 1, 0.4313726, 1,
-0.3045899, 0.4650418, -2.427762, 0, 1, 0.4352941, 1,
-0.3043882, 0.7872178, 0.7403365, 0, 1, 0.4431373, 1,
-0.3038475, 1.956678, 0.629731, 0, 1, 0.4470588, 1,
-0.2996539, -0.8172592, -3.467708, 0, 1, 0.454902, 1,
-0.2970544, 0.4218368, 0.342435, 0, 1, 0.4588235, 1,
-0.2961839, -0.1572538, -3.840509, 0, 1, 0.4666667, 1,
-0.2911504, -0.9929329, -2.988093, 0, 1, 0.4705882, 1,
-0.2907215, 0.6560416, -0.01000989, 0, 1, 0.4784314, 1,
-0.285593, -0.7648547, -2.700708, 0, 1, 0.4823529, 1,
-0.2845967, -1.773713, -2.899347, 0, 1, 0.4901961, 1,
-0.2840524, 0.6203994, -0.7308119, 0, 1, 0.4941176, 1,
-0.2778631, -0.3732794, -2.775249, 0, 1, 0.5019608, 1,
-0.2756685, -0.5769247, -2.088825, 0, 1, 0.509804, 1,
-0.271259, 0.1365121, -2.198888, 0, 1, 0.5137255, 1,
-0.2669246, 0.2046593, 0.307067, 0, 1, 0.5215687, 1,
-0.2641518, 1.261778, -1.064277, 0, 1, 0.5254902, 1,
-0.2633762, 1.04143, 0.5449735, 0, 1, 0.5333334, 1,
-0.2590175, 0.6364, -0.3936688, 0, 1, 0.5372549, 1,
-0.2562118, 0.178954, -1.784333, 0, 1, 0.5450981, 1,
-0.2561681, -1.112698, -2.121948, 0, 1, 0.5490196, 1,
-0.2501377, -0.9133745, -2.833793, 0, 1, 0.5568628, 1,
-0.2494299, 0.5654345, -0.901231, 0, 1, 0.5607843, 1,
-0.2478803, 0.5236394, -0.5823442, 0, 1, 0.5686275, 1,
-0.2433971, 0.2523469, 0.09868518, 0, 1, 0.572549, 1,
-0.2430686, 1.050139, -0.8979097, 0, 1, 0.5803922, 1,
-0.239974, -0.8048809, -2.736258, 0, 1, 0.5843138, 1,
-0.2392976, -0.9026262, -4.727888, 0, 1, 0.5921569, 1,
-0.2316322, 2.097581, 1.79519, 0, 1, 0.5960785, 1,
-0.229189, -0.7659385, -3.658418, 0, 1, 0.6039216, 1,
-0.2280053, -1.150351, -1.674462, 0, 1, 0.6117647, 1,
-0.2225127, 1.379663, -0.4651413, 0, 1, 0.6156863, 1,
-0.2134831, 0.8584257, 0.2180949, 0, 1, 0.6235294, 1,
-0.2068444, 0.6207377, -1.227769, 0, 1, 0.627451, 1,
-0.2050246, -0.904067, -3.680587, 0, 1, 0.6352941, 1,
-0.201673, 1.020342, -1.632368, 0, 1, 0.6392157, 1,
-0.2012731, 0.1521519, -1.989008, 0, 1, 0.6470588, 1,
-0.1971072, 0.1411344, 0.7136776, 0, 1, 0.6509804, 1,
-0.1963096, -1.385274, -2.144422, 0, 1, 0.6588235, 1,
-0.1952214, 1.690146, 1.295923, 0, 1, 0.6627451, 1,
-0.1941123, -1.203959, -3.844747, 0, 1, 0.6705883, 1,
-0.1917193, -0.8502822, -4.189145, 0, 1, 0.6745098, 1,
-0.1913416, -0.2553502, -2.3594, 0, 1, 0.682353, 1,
-0.1833496, -1.041847, -3.161998, 0, 1, 0.6862745, 1,
-0.1829327, -0.5170738, -1.52356, 0, 1, 0.6941177, 1,
-0.1814891, 0.1814216, -0.7581617, 0, 1, 0.7019608, 1,
-0.1814686, -0.1996925, -3.112101, 0, 1, 0.7058824, 1,
-0.1693677, 1.118173, 0.9578119, 0, 1, 0.7137255, 1,
-0.1692173, 0.6262535, 0.588388, 0, 1, 0.7176471, 1,
-0.1653462, -0.4158833, -4.128072, 0, 1, 0.7254902, 1,
-0.1643851, 0.4994728, -0.3885998, 0, 1, 0.7294118, 1,
-0.1621237, -0.5424107, -1.942057, 0, 1, 0.7372549, 1,
-0.1558257, -0.3580763, -3.431742, 0, 1, 0.7411765, 1,
-0.1557411, 1.081203, -0.1508213, 0, 1, 0.7490196, 1,
-0.1556759, -1.239621, -3.619142, 0, 1, 0.7529412, 1,
-0.1491065, -0.8256642, -3.347467, 0, 1, 0.7607843, 1,
-0.1456635, -0.6314205, -3.900239, 0, 1, 0.7647059, 1,
-0.1439384, 0.7825817, 0.7810243, 0, 1, 0.772549, 1,
-0.1384866, 0.2879527, -0.2594967, 0, 1, 0.7764706, 1,
-0.1372704, -1.043936, -2.980366, 0, 1, 0.7843137, 1,
-0.1369237, -1.107218, -3.213211, 0, 1, 0.7882353, 1,
-0.1308402, -0.3434789, -3.199697, 0, 1, 0.7960784, 1,
-0.1275424, 1.455595, -0.09337074, 0, 1, 0.8039216, 1,
-0.1270928, 1.298025, -0.6966749, 0, 1, 0.8078431, 1,
-0.1260692, 1.085213, 0.1242625, 0, 1, 0.8156863, 1,
-0.120918, 2.947292, 1.000154, 0, 1, 0.8196079, 1,
-0.1201816, -0.1737821, -1.977006, 0, 1, 0.827451, 1,
-0.1166549, 0.9768807, 1.218324, 0, 1, 0.8313726, 1,
-0.1145612, 0.3124832, -1.132184, 0, 1, 0.8392157, 1,
-0.1144775, -0.8548561, -3.224669, 0, 1, 0.8431373, 1,
-0.1109732, -3.180953, -2.493796, 0, 1, 0.8509804, 1,
-0.110264, 0.156104, -3.022078, 0, 1, 0.854902, 1,
-0.107407, 0.2757329, 0.9374793, 0, 1, 0.8627451, 1,
-0.1074016, -2.165333, -0.4618326, 0, 1, 0.8666667, 1,
-0.104886, -0.2439896, -3.490263, 0, 1, 0.8745098, 1,
-0.1043271, 0.6920888, -0.881282, 0, 1, 0.8784314, 1,
-0.1025991, 0.1478319, -0.7287686, 0, 1, 0.8862745, 1,
-0.09430917, 1.729213, -0.6525302, 0, 1, 0.8901961, 1,
-0.07990252, -0.2199277, -3.547621, 0, 1, 0.8980392, 1,
-0.07687321, -1.46726, -0.8157642, 0, 1, 0.9058824, 1,
-0.0765852, 0.08445672, -0.9779136, 0, 1, 0.9098039, 1,
-0.07140374, 0.2257846, 0.3220181, 0, 1, 0.9176471, 1,
-0.07118651, -0.3821332, -2.38388, 0, 1, 0.9215686, 1,
-0.07044505, 0.7737328, -0.08371048, 0, 1, 0.9294118, 1,
-0.06999514, 0.6425495, 0.9087238, 0, 1, 0.9333333, 1,
-0.06687417, 0.4536707, 0.141831, 0, 1, 0.9411765, 1,
-0.06596849, 0.5474865, -0.6424578, 0, 1, 0.945098, 1,
-0.05989135, -0.09355613, -2.712602, 0, 1, 0.9529412, 1,
-0.05482994, 0.2492131, 0.3124423, 0, 1, 0.9568627, 1,
-0.0531924, -0.1788344, -1.496852, 0, 1, 0.9647059, 1,
-0.05123907, -0.8409972, -3.053077, 0, 1, 0.9686275, 1,
-0.0473166, 0.1832432, -0.5642121, 0, 1, 0.9764706, 1,
-0.0471113, -0.8783313, -3.136321, 0, 1, 0.9803922, 1,
-0.04646777, 0.5411609, 0.9723005, 0, 1, 0.9882353, 1,
-0.04608815, -0.54838, -3.027743, 0, 1, 0.9921569, 1,
-0.04462741, -0.2857123, -4.52325, 0, 1, 1, 1,
-0.04429743, -0.5553234, -1.12981, 0, 0.9921569, 1, 1,
-0.04065525, 0.2393368, 2.206154, 0, 0.9882353, 1, 1,
-0.03603903, -1.123732, -1.890579, 0, 0.9803922, 1, 1,
-0.03592497, 0.3409648, -0.08904514, 0, 0.9764706, 1, 1,
-0.03347027, -0.2069304, -0.8441443, 0, 0.9686275, 1, 1,
-0.03320903, -1.101467, -3.224661, 0, 0.9647059, 1, 1,
-0.02784319, 0.1481786, -0.1685828, 0, 0.9568627, 1, 1,
-0.02400275, 0.9842259, 0.008884718, 0, 0.9529412, 1, 1,
-0.02168584, -0.2814286, -3.880602, 0, 0.945098, 1, 1,
-0.01671242, 0.9474207, -0.4370703, 0, 0.9411765, 1, 1,
-0.0134341, 0.6125433, 0.386966, 0, 0.9333333, 1, 1,
-0.00305517, 0.2305314, 0.6362337, 0, 0.9294118, 1, 1,
-0.002579747, -0.9047093, -2.712614, 0, 0.9215686, 1, 1,
-0.001266303, -0.1155895, -3.76849, 0, 0.9176471, 1, 1,
-0.0009237526, 0.547838, -0.6623381, 0, 0.9098039, 1, 1,
-0.0007044304, -1.285502, -4.774957, 0, 0.9058824, 1, 1,
0.002010252, 0.08382533, 0.1911245, 0, 0.8980392, 1, 1,
0.003450252, 0.113426, 0.9804713, 0, 0.8901961, 1, 1,
0.00479381, 0.05435071, -0.8566444, 0, 0.8862745, 1, 1,
0.008765593, 0.1328411, -1.008653, 0, 0.8784314, 1, 1,
0.01044669, -0.9542181, 3.171108, 0, 0.8745098, 1, 1,
0.01119933, -1.108929, 3.281301, 0, 0.8666667, 1, 1,
0.01363787, 0.5973376, -1.146121, 0, 0.8627451, 1, 1,
0.02188414, 2.490534, 1.401376, 0, 0.854902, 1, 1,
0.02306696, -0.8545818, 4.097193, 0, 0.8509804, 1, 1,
0.02508078, -0.2311395, 2.133052, 0, 0.8431373, 1, 1,
0.02599452, -1.293283, 2.323991, 0, 0.8392157, 1, 1,
0.03091394, 1.15357, -1.017412, 0, 0.8313726, 1, 1,
0.03292753, -0.9246297, 2.809736, 0, 0.827451, 1, 1,
0.03628522, 1.441151, -0.8401645, 0, 0.8196079, 1, 1,
0.03803886, -0.1457332, 2.923989, 0, 0.8156863, 1, 1,
0.04023048, -0.2411675, 2.645832, 0, 0.8078431, 1, 1,
0.04116804, 0.2027919, -1.174584, 0, 0.8039216, 1, 1,
0.0419994, 0.4155486, -0.7882221, 0, 0.7960784, 1, 1,
0.04312073, 1.531481, -0.3339728, 0, 0.7882353, 1, 1,
0.04520081, -0.8272835, 3.24091, 0, 0.7843137, 1, 1,
0.04900716, 0.02419687, 0.4295102, 0, 0.7764706, 1, 1,
0.05006247, -0.4074697, 4.375132, 0, 0.772549, 1, 1,
0.05452213, 1.768301, -0.5306173, 0, 0.7647059, 1, 1,
0.05761347, 0.1139551, 0.6920635, 0, 0.7607843, 1, 1,
0.06026446, 0.5734758, 0.7783338, 0, 0.7529412, 1, 1,
0.06511921, 1.537101, -0.2980058, 0, 0.7490196, 1, 1,
0.06616233, -0.3817928, 2.680883, 0, 0.7411765, 1, 1,
0.08201329, -0.288623, 3.7273, 0, 0.7372549, 1, 1,
0.08208224, -0.9329396, 4.069636, 0, 0.7294118, 1, 1,
0.08369941, 1.921586, 1.674549, 0, 0.7254902, 1, 1,
0.09092412, -0.5016489, 1.983278, 0, 0.7176471, 1, 1,
0.0941457, 1.118199, -1.059404, 0, 0.7137255, 1, 1,
0.09417918, -0.1159731, 2.318537, 0, 0.7058824, 1, 1,
0.09469319, 0.8721646, -0.06917537, 0, 0.6980392, 1, 1,
0.09787154, 0.332622, -0.7534382, 0, 0.6941177, 1, 1,
0.09886956, -0.9066113, 2.864828, 0, 0.6862745, 1, 1,
0.1001866, 0.7012072, 1.508091, 0, 0.682353, 1, 1,
0.1014795, 0.3687402, -0.2534278, 0, 0.6745098, 1, 1,
0.1016867, 0.07128979, -0.5628437, 0, 0.6705883, 1, 1,
0.1033799, -0.6957285, 2.696863, 0, 0.6627451, 1, 1,
0.1091387, 1.288104, -0.1332182, 0, 0.6588235, 1, 1,
0.115111, 0.6303419, 0.04784938, 0, 0.6509804, 1, 1,
0.116706, -1.213311, 3.174539, 0, 0.6470588, 1, 1,
0.1177101, -1.43256, 3.3428, 0, 0.6392157, 1, 1,
0.1183373, 0.3987104, 0.60843, 0, 0.6352941, 1, 1,
0.119535, -0.08147326, 2.222142, 0, 0.627451, 1, 1,
0.1212486, 0.6095267, -2.214105, 0, 0.6235294, 1, 1,
0.123205, 0.05895887, 0.971779, 0, 0.6156863, 1, 1,
0.1233295, 1.578993, 1.655779, 0, 0.6117647, 1, 1,
0.1243061, 0.4975682, 0.01844155, 0, 0.6039216, 1, 1,
0.1246657, 0.1002284, 1.655095, 0, 0.5960785, 1, 1,
0.1271469, 0.1315611, -0.4227667, 0, 0.5921569, 1, 1,
0.1339349, 0.6668791, -0.6274735, 0, 0.5843138, 1, 1,
0.1371256, 0.1548879, -0.393446, 0, 0.5803922, 1, 1,
0.1381209, 2.240284, -0.9550093, 0, 0.572549, 1, 1,
0.143668, -1.880477, 1.785473, 0, 0.5686275, 1, 1,
0.1466044, -1.612871, 2.885248, 0, 0.5607843, 1, 1,
0.1466592, -1.186019, 3.249543, 0, 0.5568628, 1, 1,
0.1474788, 0.5235435, -0.686491, 0, 0.5490196, 1, 1,
0.1475358, -0.5666903, 1.010699, 0, 0.5450981, 1, 1,
0.1493616, -1.059298, 2.0961, 0, 0.5372549, 1, 1,
0.156085, 0.3366605, 1.156333, 0, 0.5333334, 1, 1,
0.1562478, -0.5993444, 3.425779, 0, 0.5254902, 1, 1,
0.1579619, -0.4130468, 2.276247, 0, 0.5215687, 1, 1,
0.1598476, 0.1486251, 1.447447, 0, 0.5137255, 1, 1,
0.1610222, 0.5422001, 0.5548422, 0, 0.509804, 1, 1,
0.1659471, -0.4595797, 1.46102, 0, 0.5019608, 1, 1,
0.1706568, 0.2074947, 0.1178541, 0, 0.4941176, 1, 1,
0.1747489, 0.4394795, -0.5111774, 0, 0.4901961, 1, 1,
0.1774422, 0.8092354, -1.468527, 0, 0.4823529, 1, 1,
0.1778962, 1.038442, -0.223844, 0, 0.4784314, 1, 1,
0.1818449, -0.5723991, 2.599525, 0, 0.4705882, 1, 1,
0.1825374, -1.176116, 2.514515, 0, 0.4666667, 1, 1,
0.1865197, 1.548426, 0.353647, 0, 0.4588235, 1, 1,
0.1919683, -0.4304442, 3.176219, 0, 0.454902, 1, 1,
0.1932451, -1.473371, 3.077672, 0, 0.4470588, 1, 1,
0.1940313, -0.3018003, 4.21927, 0, 0.4431373, 1, 1,
0.1964662, -1.025855, 3.046646, 0, 0.4352941, 1, 1,
0.1977975, 0.09460188, 2.477005, 0, 0.4313726, 1, 1,
0.2043049, -0.02664923, 2.06519, 0, 0.4235294, 1, 1,
0.2050629, -1.806996, 3.292984, 0, 0.4196078, 1, 1,
0.2071352, -0.1564531, 2.934403, 0, 0.4117647, 1, 1,
0.2075757, -0.8653204, 2.916605, 0, 0.4078431, 1, 1,
0.2098268, -1.443423, 2.613901, 0, 0.4, 1, 1,
0.2140337, 0.6490445, 0.313314, 0, 0.3921569, 1, 1,
0.2140611, 2.255714, -0.008321443, 0, 0.3882353, 1, 1,
0.216058, -0.3302288, 0.821756, 0, 0.3803922, 1, 1,
0.2164039, 0.931316, 2.285984, 0, 0.3764706, 1, 1,
0.2170975, 0.5613211, 2.447458, 0, 0.3686275, 1, 1,
0.2177674, 1.614632, -0.06167267, 0, 0.3647059, 1, 1,
0.2193139, 1.046696, 0.6867381, 0, 0.3568628, 1, 1,
0.2198847, 1.021554, -0.5292647, 0, 0.3529412, 1, 1,
0.2232284, 0.4801379, -0.1495203, 0, 0.345098, 1, 1,
0.2233788, -1.190306, 2.027889, 0, 0.3411765, 1, 1,
0.2243602, -0.3231206, 3.655318, 0, 0.3333333, 1, 1,
0.2293408, -0.4511224, 2.19668, 0, 0.3294118, 1, 1,
0.2310885, 0.4459753, 1.179689, 0, 0.3215686, 1, 1,
0.2324587, -1.686553, 2.910061, 0, 0.3176471, 1, 1,
0.2328814, 0.4120133, 0.4945356, 0, 0.3098039, 1, 1,
0.2334081, 0.3993902, -0.1610767, 0, 0.3058824, 1, 1,
0.2374631, -0.5637785, 3.100752, 0, 0.2980392, 1, 1,
0.2460555, 0.1221161, 1.580989, 0, 0.2901961, 1, 1,
0.2465222, -0.0129811, 0.562694, 0, 0.2862745, 1, 1,
0.257662, 1.236634, -0.5529033, 0, 0.2784314, 1, 1,
0.2606271, -0.09877975, 0.6902933, 0, 0.2745098, 1, 1,
0.2608398, -1.371768, 2.750582, 0, 0.2666667, 1, 1,
0.261345, 0.2477765, 0.6090366, 0, 0.2627451, 1, 1,
0.2641658, 0.1569319, 0.3940126, 0, 0.254902, 1, 1,
0.2642196, 0.9971834, 0.7637295, 0, 0.2509804, 1, 1,
0.2697445, -0.3490879, 3.440673, 0, 0.2431373, 1, 1,
0.273336, 0.6149687, 0.1880471, 0, 0.2392157, 1, 1,
0.2743045, -0.1294185, 1.72597, 0, 0.2313726, 1, 1,
0.2776497, 0.5319608, 0.997704, 0, 0.227451, 1, 1,
0.28031, 1.021811, -0.3662462, 0, 0.2196078, 1, 1,
0.2817906, 1.129861, -0.2299663, 0, 0.2156863, 1, 1,
0.281893, 0.5997419, 0.6842467, 0, 0.2078431, 1, 1,
0.2869319, 0.7202275, -0.2244849, 0, 0.2039216, 1, 1,
0.2899164, 0.3795048, 0.986706, 0, 0.1960784, 1, 1,
0.2906142, 0.4239118, 0.164117, 0, 0.1882353, 1, 1,
0.2919004, 0.6199035, 0.9038383, 0, 0.1843137, 1, 1,
0.2958701, -0.9249981, 2.911007, 0, 0.1764706, 1, 1,
0.3014836, 1.129195, 0.2058868, 0, 0.172549, 1, 1,
0.3037196, -0.03509859, 2.329979, 0, 0.1647059, 1, 1,
0.3043979, 0.09575621, 2.644973, 0, 0.1607843, 1, 1,
0.3052925, 1.062559, -0.8040106, 0, 0.1529412, 1, 1,
0.3053055, 0.7050118, -0.5929974, 0, 0.1490196, 1, 1,
0.3076504, 0.5035193, 0.6262113, 0, 0.1411765, 1, 1,
0.3097526, -0.3748171, 4.581941, 0, 0.1372549, 1, 1,
0.3117229, 1.497013, -0.7079836, 0, 0.1294118, 1, 1,
0.3178983, 1.048086, -0.09154154, 0, 0.1254902, 1, 1,
0.31885, 0.1629527, 1.490149, 0, 0.1176471, 1, 1,
0.3199739, 1.064084, -0.04979271, 0, 0.1137255, 1, 1,
0.3220863, -0.01522253, 2.999825, 0, 0.1058824, 1, 1,
0.3230152, -0.8967059, 3.08832, 0, 0.09803922, 1, 1,
0.3230989, -0.3948998, 3.406257, 0, 0.09411765, 1, 1,
0.3264401, 0.3323116, 2.010597, 0, 0.08627451, 1, 1,
0.3280201, -0.09453963, 3.882654, 0, 0.08235294, 1, 1,
0.3298592, -0.2035492, 1.067787, 0, 0.07450981, 1, 1,
0.3301858, 1.248133, -0.8438287, 0, 0.07058824, 1, 1,
0.3380185, 0.473793, 0.8238641, 0, 0.0627451, 1, 1,
0.3386599, -0.8650631, 4.202379, 0, 0.05882353, 1, 1,
0.3408079, 0.8127908, 1.467548, 0, 0.05098039, 1, 1,
0.3451133, -1.379646, 3.792786, 0, 0.04705882, 1, 1,
0.3499856, -1.131419, 3.667814, 0, 0.03921569, 1, 1,
0.352428, -0.2550124, 1.622861, 0, 0.03529412, 1, 1,
0.3568325, -0.5175284, 2.516151, 0, 0.02745098, 1, 1,
0.3612626, 0.517164, 2.553398, 0, 0.02352941, 1, 1,
0.3737809, -0.2271921, 3.422822, 0, 0.01568628, 1, 1,
0.3813865, 1.376528, 1.156058, 0, 0.01176471, 1, 1,
0.383272, 0.1814893, 0.08128332, 0, 0.003921569, 1, 1,
0.3845418, -0.1075982, 3.492772, 0.003921569, 0, 1, 1,
0.3889585, -0.3109647, 2.204831, 0.007843138, 0, 1, 1,
0.3940063, -1.271071, 2.474286, 0.01568628, 0, 1, 1,
0.3998413, 0.4279396, -0.1043659, 0.01960784, 0, 1, 1,
0.402481, -1.587652, 3.246444, 0.02745098, 0, 1, 1,
0.4030735, -0.2820752, 1.336035, 0.03137255, 0, 1, 1,
0.4037515, -0.3035569, 2.734517, 0.03921569, 0, 1, 1,
0.404335, 0.4649915, 1.288196, 0.04313726, 0, 1, 1,
0.404936, -1.422163, 2.596318, 0.05098039, 0, 1, 1,
0.4061145, -2.357223, 1.880555, 0.05490196, 0, 1, 1,
0.4070995, 0.5718403, -0.40935, 0.0627451, 0, 1, 1,
0.4076734, 0.505906, 0.8701891, 0.06666667, 0, 1, 1,
0.4082651, 0.3436503, 1.92753, 0.07450981, 0, 1, 1,
0.4099599, -0.4996281, 2.331359, 0.07843138, 0, 1, 1,
0.4122925, -0.07848179, 2.223459, 0.08627451, 0, 1, 1,
0.4169805, -1.247167, 3.516596, 0.09019608, 0, 1, 1,
0.4190217, -1.541148, 1.779785, 0.09803922, 0, 1, 1,
0.4208243, -1.454396, 1.056177, 0.1058824, 0, 1, 1,
0.4213334, 1.325225, 0.9228038, 0.1098039, 0, 1, 1,
0.4224102, -0.5037802, 2.6501, 0.1176471, 0, 1, 1,
0.4261652, -1.125452, 2.069649, 0.1215686, 0, 1, 1,
0.4270088, 0.7016389, 0.002373811, 0.1294118, 0, 1, 1,
0.4273462, -0.03093839, 2.269092, 0.1333333, 0, 1, 1,
0.4384248, 2.63108, -0.2349551, 0.1411765, 0, 1, 1,
0.4395201, 0.4763434, 0.7318024, 0.145098, 0, 1, 1,
0.4396212, -0.767736, 3.485945, 0.1529412, 0, 1, 1,
0.448171, 0.8897808, 1.936894, 0.1568628, 0, 1, 1,
0.4501435, -0.2432434, 1.64659, 0.1647059, 0, 1, 1,
0.4525604, -0.3280953, 3.885873, 0.1686275, 0, 1, 1,
0.4571655, 0.1479537, 1.225058, 0.1764706, 0, 1, 1,
0.4573597, -1.726958, 0.931142, 0.1803922, 0, 1, 1,
0.4593163, 0.003154184, 1.158774, 0.1882353, 0, 1, 1,
0.4599035, 1.167643, -0.9068555, 0.1921569, 0, 1, 1,
0.4603553, 1.253243, -0.7328666, 0.2, 0, 1, 1,
0.4635162, 0.4299664, 0.3877758, 0.2078431, 0, 1, 1,
0.4694678, -1.195451, 3.074123, 0.2117647, 0, 1, 1,
0.4707299, -0.5318841, 2.949767, 0.2196078, 0, 1, 1,
0.4716982, -1.091559, 2.727261, 0.2235294, 0, 1, 1,
0.4742596, -0.2211014, 2.565166, 0.2313726, 0, 1, 1,
0.4819692, -0.1375074, 2.806554, 0.2352941, 0, 1, 1,
0.4821118, -1.211049, 3.727592, 0.2431373, 0, 1, 1,
0.4935589, 0.3293601, 2.859935, 0.2470588, 0, 1, 1,
0.4974083, -1.329796, 5.037375, 0.254902, 0, 1, 1,
0.4978505, -1.719869, 2.80953, 0.2588235, 0, 1, 1,
0.4981346, 2.517997, 0.2604574, 0.2666667, 0, 1, 1,
0.4998898, -0.74089, 1.869225, 0.2705882, 0, 1, 1,
0.5008057, -0.109528, 0.9874105, 0.2784314, 0, 1, 1,
0.5016504, -0.12158, 0.9017571, 0.282353, 0, 1, 1,
0.5029516, -1.041183, 4.006114, 0.2901961, 0, 1, 1,
0.5050551, 1.520337, 1.343229, 0.2941177, 0, 1, 1,
0.5069548, -0.1008402, 1.437526, 0.3019608, 0, 1, 1,
0.507048, -0.9413258, 2.934859, 0.3098039, 0, 1, 1,
0.5240799, 0.3961412, -1.244951, 0.3137255, 0, 1, 1,
0.5250175, 0.1900608, 2.861933, 0.3215686, 0, 1, 1,
0.5284404, 0.04042494, 2.41084, 0.3254902, 0, 1, 1,
0.5329177, 2.207428, 0.5348729, 0.3333333, 0, 1, 1,
0.5339913, -0.9299401, 1.095142, 0.3372549, 0, 1, 1,
0.5344053, 0.3562772, 0.451734, 0.345098, 0, 1, 1,
0.5399203, -0.5259582, 2.244341, 0.3490196, 0, 1, 1,
0.5419409, 0.1351355, 0.1761759, 0.3568628, 0, 1, 1,
0.5503069, 1.11689, 1.156666, 0.3607843, 0, 1, 1,
0.5529889, -1.75833, 2.957463, 0.3686275, 0, 1, 1,
0.5571687, -0.8334195, 2.827962, 0.372549, 0, 1, 1,
0.5579212, 0.6741229, 1.827675, 0.3803922, 0, 1, 1,
0.5593036, 0.7061443, 0.5101292, 0.3843137, 0, 1, 1,
0.5602603, 1.25871, 1.183939, 0.3921569, 0, 1, 1,
0.568472, -1.239208, 1.4361, 0.3960784, 0, 1, 1,
0.5690638, -0.03299553, 1.100532, 0.4039216, 0, 1, 1,
0.5695425, 0.7717252, -0.2282491, 0.4117647, 0, 1, 1,
0.5702636, 2.575388, -1.535575, 0.4156863, 0, 1, 1,
0.5761719, -0.1039079, 2.631348, 0.4235294, 0, 1, 1,
0.5799209, 1.287199, -1.697622, 0.427451, 0, 1, 1,
0.5823607, 1.319457, 0.1046068, 0.4352941, 0, 1, 1,
0.58288, 0.5855556, 0.7733122, 0.4392157, 0, 1, 1,
0.5859091, -2.291001, 2.681042, 0.4470588, 0, 1, 1,
0.5885388, 0.01262983, 1.993829, 0.4509804, 0, 1, 1,
0.5895876, 0.1196473, 0.2248542, 0.4588235, 0, 1, 1,
0.5913303, -0.1710652, -0.1951132, 0.4627451, 0, 1, 1,
0.5923937, 0.3320976, 0.9316765, 0.4705882, 0, 1, 1,
0.5967357, -1.165816, 2.095527, 0.4745098, 0, 1, 1,
0.6032462, -0.7488467, 4.418703, 0.4823529, 0, 1, 1,
0.6076902, 0.7083086, 0.434967, 0.4862745, 0, 1, 1,
0.6176321, 0.08513626, 0.2385074, 0.4941176, 0, 1, 1,
0.6190054, 0.5755033, 0.6248759, 0.5019608, 0, 1, 1,
0.6264836, -1.586571, 3.164342, 0.5058824, 0, 1, 1,
0.6355758, 0.6693602, -0.3806434, 0.5137255, 0, 1, 1,
0.6372787, 0.2006065, 2.655363, 0.5176471, 0, 1, 1,
0.6408318, -1.243702, 1.758987, 0.5254902, 0, 1, 1,
0.6450843, -0.4095799, 1.884828, 0.5294118, 0, 1, 1,
0.6479205, -0.3432128, 1.634431, 0.5372549, 0, 1, 1,
0.648152, -0.3348098, 1.368082, 0.5411765, 0, 1, 1,
0.6499258, 0.09000549, 0.4672703, 0.5490196, 0, 1, 1,
0.6508537, 1.120103, -0.7245264, 0.5529412, 0, 1, 1,
0.653074, -0.09819497, 0.8439927, 0.5607843, 0, 1, 1,
0.6535069, -0.386173, 1.97072, 0.5647059, 0, 1, 1,
0.6569308, -1.492465, 4.037883, 0.572549, 0, 1, 1,
0.6587312, -0.1416314, 2.326502, 0.5764706, 0, 1, 1,
0.6615278, 0.1077515, 1.907509, 0.5843138, 0, 1, 1,
0.663037, 1.431137, 0.8670806, 0.5882353, 0, 1, 1,
0.6649317, -0.4035198, 0.286998, 0.5960785, 0, 1, 1,
0.6700795, -1.536635, 1.908693, 0.6039216, 0, 1, 1,
0.6710035, -1.626118, 3.954364, 0.6078432, 0, 1, 1,
0.6724971, -0.9027648, 2.446058, 0.6156863, 0, 1, 1,
0.6730425, 0.08910501, 2.079227, 0.6196079, 0, 1, 1,
0.6746736, 1.207649, 2.429302, 0.627451, 0, 1, 1,
0.6754876, -0.1859423, 1.360344, 0.6313726, 0, 1, 1,
0.6817754, 0.8659225, 1.468916, 0.6392157, 0, 1, 1,
0.6820524, -0.1666506, 2.868309, 0.6431373, 0, 1, 1,
0.6866574, -0.8258584, 2.640343, 0.6509804, 0, 1, 1,
0.6946828, 0.09001133, 1.212487, 0.654902, 0, 1, 1,
0.6949151, 1.151545, 0.8974465, 0.6627451, 0, 1, 1,
0.6972638, -1.735305, 3.163156, 0.6666667, 0, 1, 1,
0.7008404, -0.6075409, 1.452132, 0.6745098, 0, 1, 1,
0.7081826, 1.54296, 1.608895, 0.6784314, 0, 1, 1,
0.7093189, -1.126246, 1.096931, 0.6862745, 0, 1, 1,
0.7111329, 1.18165, -0.08275742, 0.6901961, 0, 1, 1,
0.712719, -1.299394, 1.981336, 0.6980392, 0, 1, 1,
0.721197, 0.04474065, 2.268198, 0.7058824, 0, 1, 1,
0.7296437, 0.2915488, 0.1973318, 0.7098039, 0, 1, 1,
0.7319471, -0.6958826, 1.947398, 0.7176471, 0, 1, 1,
0.7327101, -0.511044, 2.561223, 0.7215686, 0, 1, 1,
0.7363261, 0.346317, 1.94267, 0.7294118, 0, 1, 1,
0.7499777, -1.785537, 2.568667, 0.7333333, 0, 1, 1,
0.7532371, -1.094353, 3.813564, 0.7411765, 0, 1, 1,
0.7534817, 0.6999532, -1.238867, 0.7450981, 0, 1, 1,
0.7610185, 0.03920049, 0.663872, 0.7529412, 0, 1, 1,
0.7618648, 0.3559916, 0.7138444, 0.7568628, 0, 1, 1,
0.7669991, 0.1733633, 1.792331, 0.7647059, 0, 1, 1,
0.7701332, 0.9312425, -1.049963, 0.7686275, 0, 1, 1,
0.7710794, -0.9253123, 0.3706425, 0.7764706, 0, 1, 1,
0.7713597, -0.9604083, 2.599805, 0.7803922, 0, 1, 1,
0.773689, -1.207713, 3.303243, 0.7882353, 0, 1, 1,
0.7767192, 0.6344748, 1.132947, 0.7921569, 0, 1, 1,
0.7767442, 0.9683834, 0.2511501, 0.8, 0, 1, 1,
0.7783034, -0.6061677, 1.783613, 0.8078431, 0, 1, 1,
0.7791143, 0.3415308, 2.401717, 0.8117647, 0, 1, 1,
0.7808878, -0.03194682, 0.753354, 0.8196079, 0, 1, 1,
0.7835525, 0.4979359, 0.9415987, 0.8235294, 0, 1, 1,
0.7841718, 0.00990929, 1.477242, 0.8313726, 0, 1, 1,
0.7890844, -1.299358, 3.654903, 0.8352941, 0, 1, 1,
0.789662, -1.557286, 2.63609, 0.8431373, 0, 1, 1,
0.7900389, 0.7922848, 1.536758, 0.8470588, 0, 1, 1,
0.7948425, -1.017947, 3.633047, 0.854902, 0, 1, 1,
0.7992556, -0.6539416, 2.083303, 0.8588235, 0, 1, 1,
0.8023755, -0.4789609, 1.366007, 0.8666667, 0, 1, 1,
0.8099135, -0.6288685, 2.332987, 0.8705882, 0, 1, 1,
0.8099518, 1.820952, -0.3353858, 0.8784314, 0, 1, 1,
0.8187739, 0.3081041, -0.4657854, 0.8823529, 0, 1, 1,
0.8236774, 0.8509868, 0.4677261, 0.8901961, 0, 1, 1,
0.8276045, 0.66249, 0.5143678, 0.8941177, 0, 1, 1,
0.8277124, 0.4719551, 1.767879, 0.9019608, 0, 1, 1,
0.8278169, -0.5165716, 2.500912, 0.9098039, 0, 1, 1,
0.8305443, 1.410675, 1.026706, 0.9137255, 0, 1, 1,
0.8306587, -0.6309184, 3.015229, 0.9215686, 0, 1, 1,
0.8322825, -1.043481, 3.888053, 0.9254902, 0, 1, 1,
0.844277, -1.80118, 0.253558, 0.9333333, 0, 1, 1,
0.8568076, 0.4687548, 0.5728732, 0.9372549, 0, 1, 1,
0.8577682, 0.2395187, 2.100372, 0.945098, 0, 1, 1,
0.8579361, 0.7485981, 0.7136049, 0.9490196, 0, 1, 1,
0.8597411, -0.1760658, 2.390212, 0.9568627, 0, 1, 1,
0.8617128, 1.370994, -0.4562862, 0.9607843, 0, 1, 1,
0.8723899, 0.7038575, 1.766714, 0.9686275, 0, 1, 1,
0.8799816, 0.4277278, 3.846824, 0.972549, 0, 1, 1,
0.8837753, -0.5706673, 3.402235, 0.9803922, 0, 1, 1,
0.8851799, -0.8133262, 2.232979, 0.9843137, 0, 1, 1,
0.8873508, -0.06118528, 1.32232, 0.9921569, 0, 1, 1,
0.8908601, 0.911099, 0.1837469, 0.9960784, 0, 1, 1,
0.8913761, -0.03841166, 0.2381561, 1, 0, 0.9960784, 1,
0.897571, 0.3366906, 1.728533, 1, 0, 0.9882353, 1,
0.9018104, -1.210824, 2.723529, 1, 0, 0.9843137, 1,
0.909557, -2.649061, 2.864581, 1, 0, 0.9764706, 1,
0.9167751, 0.6482348, 0.7161798, 1, 0, 0.972549, 1,
0.920535, 0.2503025, 3.876647, 1, 0, 0.9647059, 1,
0.9243095, 0.4997221, 0.1575491, 1, 0, 0.9607843, 1,
0.9321134, -1.173726, 3.316988, 1, 0, 0.9529412, 1,
0.9380421, -0.1275453, 1.817273, 1, 0, 0.9490196, 1,
0.9509175, -0.8115937, 2.324592, 1, 0, 0.9411765, 1,
0.9526535, -0.6349835, 0.9401612, 1, 0, 0.9372549, 1,
0.9561352, -0.9390371, 1.426211, 1, 0, 0.9294118, 1,
0.9571649, 0.8383464, 1.309301, 1, 0, 0.9254902, 1,
0.9586322, 0.1134924, 0.5361534, 1, 0, 0.9176471, 1,
0.9602152, -0.4664306, 0.1236555, 1, 0, 0.9137255, 1,
0.9627184, 0.9852363, -0.06454338, 1, 0, 0.9058824, 1,
0.9642473, -0.3227681, 1.457632, 1, 0, 0.9019608, 1,
0.9661701, -1.264028, 4.164781, 1, 0, 0.8941177, 1,
0.9733765, 0.3199897, 2.331212, 1, 0, 0.8862745, 1,
0.9854286, -1.536408, 2.832888, 1, 0, 0.8823529, 1,
0.9875753, 0.8167841, -0.9506264, 1, 0, 0.8745098, 1,
1.00329, -1.38028, 1.716937, 1, 0, 0.8705882, 1,
1.009378, -0.4442258, 2.395939, 1, 0, 0.8627451, 1,
1.012805, 0.6046068, 1.389006, 1, 0, 0.8588235, 1,
1.020694, 1.790068, 1.214477, 1, 0, 0.8509804, 1,
1.021182, 0.5905185, 1.413038, 1, 0, 0.8470588, 1,
1.023459, 1.260929, 2.275371, 1, 0, 0.8392157, 1,
1.024906, -1.356905, 3.748944, 1, 0, 0.8352941, 1,
1.029723, -1.211255, 1.816936, 1, 0, 0.827451, 1,
1.038379, -0.6925921, 1.589583, 1, 0, 0.8235294, 1,
1.045071, 1.688825, 0.5099451, 1, 0, 0.8156863, 1,
1.045422, -0.1432929, 2.14276, 1, 0, 0.8117647, 1,
1.046001, 0.8101512, -0.2234781, 1, 0, 0.8039216, 1,
1.05514, -0.612595, 1.671854, 1, 0, 0.7960784, 1,
1.058941, 1.179341, 1.802712, 1, 0, 0.7921569, 1,
1.061134, 1.648, 3.236136, 1, 0, 0.7843137, 1,
1.064093, 1.232123, 1.47965, 1, 0, 0.7803922, 1,
1.067405, 0.6074738, -0.903922, 1, 0, 0.772549, 1,
1.068565, -1.344248, 2.989535, 1, 0, 0.7686275, 1,
1.075296, 0.5479577, 0.6309545, 1, 0, 0.7607843, 1,
1.087494, 1.451609, 0.3964306, 1, 0, 0.7568628, 1,
1.089736, -1.109443, 2.929455, 1, 0, 0.7490196, 1,
1.10269, 1.058182, 0.7245694, 1, 0, 0.7450981, 1,
1.106405, -0.178635, 1.380733, 1, 0, 0.7372549, 1,
1.113443, 0.04554388, 2.326719, 1, 0, 0.7333333, 1,
1.119401, 0.2476159, 0.9643335, 1, 0, 0.7254902, 1,
1.124808, 0.7920895, 0.6430194, 1, 0, 0.7215686, 1,
1.129807, 0.6221256, 1.899887, 1, 0, 0.7137255, 1,
1.13401, 0.8012748, 0.6605853, 1, 0, 0.7098039, 1,
1.13699, -1.61038, 2.196791, 1, 0, 0.7019608, 1,
1.154626, -0.9175401, 2.450141, 1, 0, 0.6941177, 1,
1.158257, -0.7354515, 2.506739, 1, 0, 0.6901961, 1,
1.161905, 0.06287736, 1.468516, 1, 0, 0.682353, 1,
1.164562, -0.08280386, 1.910785, 1, 0, 0.6784314, 1,
1.181435, -1.153915, 3.634755, 1, 0, 0.6705883, 1,
1.185267, 0.04002876, 1.598288, 1, 0, 0.6666667, 1,
1.189743, 0.5577593, 0.584058, 1, 0, 0.6588235, 1,
1.195006, -0.01595623, 2.940636, 1, 0, 0.654902, 1,
1.197023, 1.020834, 0.3536422, 1, 0, 0.6470588, 1,
1.197312, -0.5466489, 0.4648804, 1, 0, 0.6431373, 1,
1.203671, -0.9565749, 2.585316, 1, 0, 0.6352941, 1,
1.206293, 0.683336, 2.628846, 1, 0, 0.6313726, 1,
1.213962, 0.5016034, 1.118643, 1, 0, 0.6235294, 1,
1.222808, 1.11643, 0.7402835, 1, 0, 0.6196079, 1,
1.242972, -0.5569375, 1.139847, 1, 0, 0.6117647, 1,
1.251302, -0.5917242, 2.654723, 1, 0, 0.6078432, 1,
1.251499, 1.260601, -0.8029896, 1, 0, 0.6, 1,
1.253686, 0.4657253, 1.517535, 1, 0, 0.5921569, 1,
1.253894, 0.4994644, 0.1605071, 1, 0, 0.5882353, 1,
1.259757, -0.9785451, 1.978024, 1, 0, 0.5803922, 1,
1.261358, 1.487209, 0.8863832, 1, 0, 0.5764706, 1,
1.267654, -0.1610422, 1.092319, 1, 0, 0.5686275, 1,
1.270328, -0.1575203, 0.9097136, 1, 0, 0.5647059, 1,
1.272082, 1.079135, -0.0006739972, 1, 0, 0.5568628, 1,
1.274174, -2.062251, 2.387399, 1, 0, 0.5529412, 1,
1.274353, -0.334697, 0.3786816, 1, 0, 0.5450981, 1,
1.278685, 0.7507072, -0.1058084, 1, 0, 0.5411765, 1,
1.283062, -1.255846, 3.180925, 1, 0, 0.5333334, 1,
1.284501, 0.3423998, 2.185142, 1, 0, 0.5294118, 1,
1.295963, -0.5170183, 2.28096, 1, 0, 0.5215687, 1,
1.298923, 2.218669, -0.3485978, 1, 0, 0.5176471, 1,
1.300607, -0.9205587, 3.041169, 1, 0, 0.509804, 1,
1.31267, -0.8551599, 1.392797, 1, 0, 0.5058824, 1,
1.317594, -0.831443, 3.560798, 1, 0, 0.4980392, 1,
1.320561, 0.03108156, 1.693046, 1, 0, 0.4901961, 1,
1.3258, 1.336443, 1.24618, 1, 0, 0.4862745, 1,
1.328945, 0.4129052, 1.918005, 1, 0, 0.4784314, 1,
1.329571, -1.507663, 1.995687, 1, 0, 0.4745098, 1,
1.333488, 0.986147, 1.48716, 1, 0, 0.4666667, 1,
1.336067, 0.3521027, 2.435175, 1, 0, 0.4627451, 1,
1.348915, 1.315062, -0.6085471, 1, 0, 0.454902, 1,
1.350393, 1.12452, 0.4443762, 1, 0, 0.4509804, 1,
1.36262, -0.1695546, 0.4533506, 1, 0, 0.4431373, 1,
1.368106, 0.3776637, 2.182882, 1, 0, 0.4392157, 1,
1.371503, -1.461854, 1.43843, 1, 0, 0.4313726, 1,
1.375335, 0.9898195, 2.337457, 1, 0, 0.427451, 1,
1.37763, -1.535621, 4.20213, 1, 0, 0.4196078, 1,
1.38288, -1.658788, 4.975101, 1, 0, 0.4156863, 1,
1.387647, -0.002052947, 0.2048547, 1, 0, 0.4078431, 1,
1.390651, -0.38556, 1.31948, 1, 0, 0.4039216, 1,
1.391957, -0.4666919, 1.297135, 1, 0, 0.3960784, 1,
1.396604, 0.8828061, 1.741581, 1, 0, 0.3882353, 1,
1.412514, 1.296438, 0.900744, 1, 0, 0.3843137, 1,
1.412813, 1.373945, 0.1573506, 1, 0, 0.3764706, 1,
1.41653, 2.437088, 2.227924, 1, 0, 0.372549, 1,
1.423953, 0.2488542, 1.556846, 1, 0, 0.3647059, 1,
1.426788, -0.7640347, 1.417941, 1, 0, 0.3607843, 1,
1.429263, -0.5726016, 0.4373639, 1, 0, 0.3529412, 1,
1.436669, -0.7164059, 1.898118, 1, 0, 0.3490196, 1,
1.438002, 1.69262, 3.773938, 1, 0, 0.3411765, 1,
1.456715, -1.046857, 2.807401, 1, 0, 0.3372549, 1,
1.459061, -0.2419922, 0.1521567, 1, 0, 0.3294118, 1,
1.464387, 0.1724804, 1.801585, 1, 0, 0.3254902, 1,
1.468358, -2.740256, 1.836664, 1, 0, 0.3176471, 1,
1.48355, -1.346202, 3.453094, 1, 0, 0.3137255, 1,
1.51586, 0.3272071, 0.6981855, 1, 0, 0.3058824, 1,
1.522574, -0.9683093, 3.544938, 1, 0, 0.2980392, 1,
1.541123, 0.8708827, 2.038067, 1, 0, 0.2941177, 1,
1.551844, -0.06499099, 1.241547, 1, 0, 0.2862745, 1,
1.556241, 0.5916818, 0.9234326, 1, 0, 0.282353, 1,
1.56164, 0.04938453, 2.83328, 1, 0, 0.2745098, 1,
1.569769, -0.6651681, 2.446668, 1, 0, 0.2705882, 1,
1.592868, 0.06459186, -0.272961, 1, 0, 0.2627451, 1,
1.592941, -0.3985558, 2.177194, 1, 0, 0.2588235, 1,
1.595475, 0.1480682, 2.672395, 1, 0, 0.2509804, 1,
1.604769, 1.67276, -0.3314063, 1, 0, 0.2470588, 1,
1.610396, 0.6382542, 1.344491, 1, 0, 0.2392157, 1,
1.6156, 1.109082, 2.35426, 1, 0, 0.2352941, 1,
1.623584, -2.45552, 4.557997, 1, 0, 0.227451, 1,
1.625942, 1.414034, 1.233116, 1, 0, 0.2235294, 1,
1.627723, -0.05720811, 1.218295, 1, 0, 0.2156863, 1,
1.649664, 1.830944, 0.2906139, 1, 0, 0.2117647, 1,
1.651685, 0.6433323, 1.431609, 1, 0, 0.2039216, 1,
1.663719, -0.5272071, 1.574942, 1, 0, 0.1960784, 1,
1.68438, -0.1793386, 1.209243, 1, 0, 0.1921569, 1,
1.710778, 0.131689, 1.001922, 1, 0, 0.1843137, 1,
1.714866, 0.08308849, 1.37428, 1, 0, 0.1803922, 1,
1.719755, -0.1270107, 0.6856084, 1, 0, 0.172549, 1,
1.740973, -1.452809, 2.104635, 1, 0, 0.1686275, 1,
1.744454, 0.7090968, 3.003428, 1, 0, 0.1607843, 1,
1.749918, 0.2509927, 0.7292675, 1, 0, 0.1568628, 1,
1.754139, 1.637058, 0.3501404, 1, 0, 0.1490196, 1,
1.796903, 0.9934059, 1.573193, 1, 0, 0.145098, 1,
1.81496, 0.1879255, -0.5366787, 1, 0, 0.1372549, 1,
1.819963, 0.1752649, 2.300851, 1, 0, 0.1333333, 1,
1.828942, -0.8386931, 2.341204, 1, 0, 0.1254902, 1,
1.838384, -0.2395582, 2.360286, 1, 0, 0.1215686, 1,
1.904912, -0.5961945, 2.203962, 1, 0, 0.1137255, 1,
1.932726, 2.076745, -1.710768, 1, 0, 0.1098039, 1,
1.940853, 0.1146277, 0.9825549, 1, 0, 0.1019608, 1,
1.943075, 0.7410225, 1.665129, 1, 0, 0.09411765, 1,
1.950638, -0.2512198, 1.456601, 1, 0, 0.09019608, 1,
1.957059, -0.8910218, 0.7368817, 1, 0, 0.08235294, 1,
1.96271, -0.9996362, 1.355253, 1, 0, 0.07843138, 1,
2.011051, 1.024903, 1.469337, 1, 0, 0.07058824, 1,
2.030165, -1.215776, 3.025423, 1, 0, 0.06666667, 1,
2.031216, -0.6760826, 2.075975, 1, 0, 0.05882353, 1,
2.045082, -0.01139603, -0.3303562, 1, 0, 0.05490196, 1,
2.241696, 1.916194, 0.2471524, 1, 0, 0.04705882, 1,
2.287153, -0.7610362, 0.6867976, 1, 0, 0.04313726, 1,
2.405967, 0.8136126, 1.289666, 1, 0, 0.03529412, 1,
2.626103, -1.154708, 1.719301, 1, 0, 0.03137255, 1,
2.626298, 1.321158, 0.810357, 1, 0, 0.02352941, 1,
2.674525, -1.824345, 1.105917, 1, 0, 0.01960784, 1,
2.699861, -0.08044968, 1.49576, 1, 0, 0.01176471, 1,
2.841048, -0.2541522, 1.623899, 1, 0, 0.007843138, 1
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
-0.1377095, -4.241789, -6.567054, 0, -0.5, 0.5, 0.5,
-0.1377095, -4.241789, -6.567054, 1, -0.5, 0.5, 0.5,
-0.1377095, -4.241789, -6.567054, 1, 1.5, 0.5, 0.5,
-0.1377095, -4.241789, -6.567054, 0, 1.5, 0.5, 0.5
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
-4.126266, -0.05164313, -6.567054, 0, -0.5, 0.5, 0.5,
-4.126266, -0.05164313, -6.567054, 1, -0.5, 0.5, 0.5,
-4.126266, -0.05164313, -6.567054, 1, 1.5, 0.5, 0.5,
-4.126266, -0.05164313, -6.567054, 0, 1.5, 0.5, 0.5
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
-4.126266, -4.241789, 0.07609749, 0, -0.5, 0.5, 0.5,
-4.126266, -4.241789, 0.07609749, 1, -0.5, 0.5, 0.5,
-4.126266, -4.241789, 0.07609749, 1, 1.5, 0.5, 0.5,
-4.126266, -4.241789, 0.07609749, 0, 1.5, 0.5, 0.5
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
-3, -3.274832, -5.034019,
2, -3.274832, -5.034019,
-3, -3.274832, -5.034019,
-3, -3.435992, -5.289525,
-2, -3.274832, -5.034019,
-2, -3.435992, -5.289525,
-1, -3.274832, -5.034019,
-1, -3.435992, -5.289525,
0, -3.274832, -5.034019,
0, -3.435992, -5.289525,
1, -3.274832, -5.034019,
1, -3.435992, -5.289525,
2, -3.274832, -5.034019,
2, -3.435992, -5.289525
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
-3, -3.758311, -5.800536, 0, -0.5, 0.5, 0.5,
-3, -3.758311, -5.800536, 1, -0.5, 0.5, 0.5,
-3, -3.758311, -5.800536, 1, 1.5, 0.5, 0.5,
-3, -3.758311, -5.800536, 0, 1.5, 0.5, 0.5,
-2, -3.758311, -5.800536, 0, -0.5, 0.5, 0.5,
-2, -3.758311, -5.800536, 1, -0.5, 0.5, 0.5,
-2, -3.758311, -5.800536, 1, 1.5, 0.5, 0.5,
-2, -3.758311, -5.800536, 0, 1.5, 0.5, 0.5,
-1, -3.758311, -5.800536, 0, -0.5, 0.5, 0.5,
-1, -3.758311, -5.800536, 1, -0.5, 0.5, 0.5,
-1, -3.758311, -5.800536, 1, 1.5, 0.5, 0.5,
-1, -3.758311, -5.800536, 0, 1.5, 0.5, 0.5,
0, -3.758311, -5.800536, 0, -0.5, 0.5, 0.5,
0, -3.758311, -5.800536, 1, -0.5, 0.5, 0.5,
0, -3.758311, -5.800536, 1, 1.5, 0.5, 0.5,
0, -3.758311, -5.800536, 0, 1.5, 0.5, 0.5,
1, -3.758311, -5.800536, 0, -0.5, 0.5, 0.5,
1, -3.758311, -5.800536, 1, -0.5, 0.5, 0.5,
1, -3.758311, -5.800536, 1, 1.5, 0.5, 0.5,
1, -3.758311, -5.800536, 0, 1.5, 0.5, 0.5,
2, -3.758311, -5.800536, 0, -0.5, 0.5, 0.5,
2, -3.758311, -5.800536, 1, -0.5, 0.5, 0.5,
2, -3.758311, -5.800536, 1, 1.5, 0.5, 0.5,
2, -3.758311, -5.800536, 0, 1.5, 0.5, 0.5
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
-3.20583, -3, -5.034019,
-3.20583, 3, -5.034019,
-3.20583, -3, -5.034019,
-3.359236, -3, -5.289525,
-3.20583, -2, -5.034019,
-3.359236, -2, -5.289525,
-3.20583, -1, -5.034019,
-3.359236, -1, -5.289525,
-3.20583, 0, -5.034019,
-3.359236, 0, -5.289525,
-3.20583, 1, -5.034019,
-3.359236, 1, -5.289525,
-3.20583, 2, -5.034019,
-3.359236, 2, -5.289525,
-3.20583, 3, -5.034019,
-3.359236, 3, -5.289525
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
-3.666048, -3, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, -3, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, -3, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, -3, -5.800536, 0, 1.5, 0.5, 0.5,
-3.666048, -2, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, -2, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, -2, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, -2, -5.800536, 0, 1.5, 0.5, 0.5,
-3.666048, -1, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, -1, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, -1, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, -1, -5.800536, 0, 1.5, 0.5, 0.5,
-3.666048, 0, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, 0, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, 0, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, 0, -5.800536, 0, 1.5, 0.5, 0.5,
-3.666048, 1, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, 1, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, 1, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, 1, -5.800536, 0, 1.5, 0.5, 0.5,
-3.666048, 2, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, 2, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, 2, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, 2, -5.800536, 0, 1.5, 0.5, 0.5,
-3.666048, 3, -5.800536, 0, -0.5, 0.5, 0.5,
-3.666048, 3, -5.800536, 1, -0.5, 0.5, 0.5,
-3.666048, 3, -5.800536, 1, 1.5, 0.5, 0.5,
-3.666048, 3, -5.800536, 0, 1.5, 0.5, 0.5
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
-3.20583, -3.274832, -4,
-3.20583, -3.274832, 4,
-3.20583, -3.274832, -4,
-3.359236, -3.435992, -4,
-3.20583, -3.274832, -2,
-3.359236, -3.435992, -2,
-3.20583, -3.274832, 0,
-3.359236, -3.435992, 0,
-3.20583, -3.274832, 2,
-3.359236, -3.435992, 2,
-3.20583, -3.274832, 4,
-3.359236, -3.435992, 4
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
-3.666048, -3.758311, -4, 0, -0.5, 0.5, 0.5,
-3.666048, -3.758311, -4, 1, -0.5, 0.5, 0.5,
-3.666048, -3.758311, -4, 1, 1.5, 0.5, 0.5,
-3.666048, -3.758311, -4, 0, 1.5, 0.5, 0.5,
-3.666048, -3.758311, -2, 0, -0.5, 0.5, 0.5,
-3.666048, -3.758311, -2, 1, -0.5, 0.5, 0.5,
-3.666048, -3.758311, -2, 1, 1.5, 0.5, 0.5,
-3.666048, -3.758311, -2, 0, 1.5, 0.5, 0.5,
-3.666048, -3.758311, 0, 0, -0.5, 0.5, 0.5,
-3.666048, -3.758311, 0, 1, -0.5, 0.5, 0.5,
-3.666048, -3.758311, 0, 1, 1.5, 0.5, 0.5,
-3.666048, -3.758311, 0, 0, 1.5, 0.5, 0.5,
-3.666048, -3.758311, 2, 0, -0.5, 0.5, 0.5,
-3.666048, -3.758311, 2, 1, -0.5, 0.5, 0.5,
-3.666048, -3.758311, 2, 1, 1.5, 0.5, 0.5,
-3.666048, -3.758311, 2, 0, 1.5, 0.5, 0.5,
-3.666048, -3.758311, 4, 0, -0.5, 0.5, 0.5,
-3.666048, -3.758311, 4, 1, -0.5, 0.5, 0.5,
-3.666048, -3.758311, 4, 1, 1.5, 0.5, 0.5,
-3.666048, -3.758311, 4, 0, 1.5, 0.5, 0.5
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
-3.20583, -3.274832, -5.034019,
-3.20583, 3.171546, -5.034019,
-3.20583, -3.274832, 5.186214,
-3.20583, 3.171546, 5.186214,
-3.20583, -3.274832, -5.034019,
-3.20583, -3.274832, 5.186214,
-3.20583, 3.171546, -5.034019,
-3.20583, 3.171546, 5.186214,
-3.20583, -3.274832, -5.034019,
2.930411, -3.274832, -5.034019,
-3.20583, -3.274832, 5.186214,
2.930411, -3.274832, 5.186214,
-3.20583, 3.171546, -5.034019,
2.930411, 3.171546, -5.034019,
-3.20583, 3.171546, 5.186214,
2.930411, 3.171546, 5.186214,
2.930411, -3.274832, -5.034019,
2.930411, 3.171546, -5.034019,
2.930411, -3.274832, 5.186214,
2.930411, 3.171546, 5.186214,
2.930411, -3.274832, -5.034019,
2.930411, -3.274832, 5.186214,
2.930411, 3.171546, -5.034019,
2.930411, 3.171546, 5.186214
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
var radius = 7.236617;
var distance = 32.19653;
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
mvMatrix.translate( 0.1377095, 0.05164313, -0.07609749 );
mvMatrix.scale( 1.275108, 1.213763, 0.7655767 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.19653);
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
chlorocholine_chlori<-read.table("chlorocholine_chlori.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorocholine_chlori$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorocholine_chlori' not found
```

```r
y<-chlorocholine_chlori$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorocholine_chlori' not found
```

```r
z<-chlorocholine_chlori$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorocholine_chlori' not found
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
-3.116467, -1.127782, -2.664488, 0, 0, 1, 1, 1,
-2.783097, -0.2549862, -1.835361, 1, 0, 0, 1, 1,
-2.682882, 0.8886985, -2.862876, 1, 0, 0, 1, 1,
-2.631573, 1.172046, 1.583487, 1, 0, 0, 1, 1,
-2.52069, 0.2717661, -1.695228, 1, 0, 0, 1, 1,
-2.511209, 0.9167657, -2.505471, 1, 0, 0, 1, 1,
-2.492047, 0.4676065, -3.739765, 0, 0, 0, 1, 1,
-2.450352, 0.9771265, 0.01852955, 0, 0, 0, 1, 1,
-2.416029, -0.4128674, -2.077065, 0, 0, 0, 1, 1,
-2.349732, -0.8057524, -1.152335, 0, 0, 0, 1, 1,
-2.306885, 0.9015931, -2.295773, 0, 0, 0, 1, 1,
-2.299883, -1.430707, -2.322365, 0, 0, 0, 1, 1,
-2.238538, 0.7029402, 0.2163088, 0, 0, 0, 1, 1,
-2.216355, 2.623638, -0.9847161, 1, 1, 1, 1, 1,
-2.195027, -0.001552382, -0.6152715, 1, 1, 1, 1, 1,
-2.156904, 0.1695866, -1.10692, 1, 1, 1, 1, 1,
-2.151186, -0.3261656, -2.160411, 1, 1, 1, 1, 1,
-2.139195, -1.042815, -2.049489, 1, 1, 1, 1, 1,
-2.127547, -1.471097, -2.352708, 1, 1, 1, 1, 1,
-2.126516, -0.8521205, -0.4872648, 1, 1, 1, 1, 1,
-2.121645, 0.1466072, -0.5887292, 1, 1, 1, 1, 1,
-2.107265, 0.2900005, 0.7865847, 1, 1, 1, 1, 1,
-2.095511, -0.1342435, -1.69654, 1, 1, 1, 1, 1,
-2.063619, 0.2234679, -2.35752, 1, 1, 1, 1, 1,
-2.028442, 0.5172638, -0.1675001, 1, 1, 1, 1, 1,
-2.002102, -1.938045, -2.513498, 1, 1, 1, 1, 1,
-1.962674, -0.07601187, -2.939803, 1, 1, 1, 1, 1,
-1.957672, 1.14866, -1.957286, 1, 1, 1, 1, 1,
-1.94494, -0.384978, -2.061424, 0, 0, 1, 1, 1,
-1.941502, -0.8355347, -2.437199, 1, 0, 0, 1, 1,
-1.934591, -0.2188931, -2.112137, 1, 0, 0, 1, 1,
-1.877479, 0.8021077, -0.09651363, 1, 0, 0, 1, 1,
-1.876277, -0.1884296, -1.616215, 1, 0, 0, 1, 1,
-1.876228, 0.9100128, -0.07836346, 1, 0, 0, 1, 1,
-1.875315, -0.05618817, -0.2261623, 0, 0, 0, 1, 1,
-1.855084, -0.2809197, -1.375674, 0, 0, 0, 1, 1,
-1.826629, -0.2177651, -2.141641, 0, 0, 0, 1, 1,
-1.817137, 0.3993007, -1.969158, 0, 0, 0, 1, 1,
-1.805774, 0.2605059, -2.205486, 0, 0, 0, 1, 1,
-1.802132, -0.03052338, -1.463311, 0, 0, 0, 1, 1,
-1.775838, 2.346212, -0.4483405, 0, 0, 0, 1, 1,
-1.763049, 0.6807581, -2.404269, 1, 1, 1, 1, 1,
-1.760401, -1.819101, -2.546643, 1, 1, 1, 1, 1,
-1.756245, -1.334398, -1.249491, 1, 1, 1, 1, 1,
-1.756169, 0.5001112, -1.347873, 1, 1, 1, 1, 1,
-1.741833, -1.147693, -1.900303, 1, 1, 1, 1, 1,
-1.727342, -1.361417, -1.282806, 1, 1, 1, 1, 1,
-1.718691, -1.465365, -2.317922, 1, 1, 1, 1, 1,
-1.714808, -0.4626804, -1.20578, 1, 1, 1, 1, 1,
-1.699061, -1.730082, -2.930294, 1, 1, 1, 1, 1,
-1.695564, 0.6925042, -2.739257, 1, 1, 1, 1, 1,
-1.694767, 1.39113, 0.4615779, 1, 1, 1, 1, 1,
-1.690177, -0.4672578, -0.6354655, 1, 1, 1, 1, 1,
-1.687951, 0.5083605, 0.1218021, 1, 1, 1, 1, 1,
-1.654452, 0.48101, -2.462126, 1, 1, 1, 1, 1,
-1.646783, -0.4734502, -3.19408, 1, 1, 1, 1, 1,
-1.644019, 0.519269, -0.8170907, 0, 0, 1, 1, 1,
-1.633816, -1.250895, -3.828738, 1, 0, 0, 1, 1,
-1.620717, 0.9484703, -1.065896, 1, 0, 0, 1, 1,
-1.62013, -1.891563, -3.852987, 1, 0, 0, 1, 1,
-1.616884, 1.221021, -0.5493307, 1, 0, 0, 1, 1,
-1.614501, -0.6264501, -0.3541366, 1, 0, 0, 1, 1,
-1.614415, -0.8951549, -2.716626, 0, 0, 0, 1, 1,
-1.60814, 0.8477021, -1.951324, 0, 0, 0, 1, 1,
-1.597409, 0.8372394, -2.243811, 0, 0, 0, 1, 1,
-1.592036, -0.1788233, -1.005972, 0, 0, 0, 1, 1,
-1.580958, 0.01604132, -1.507185, 0, 0, 0, 1, 1,
-1.578232, 0.1867769, -2.611248, 0, 0, 0, 1, 1,
-1.565649, 1.273385, -0.6836037, 0, 0, 0, 1, 1,
-1.56203, 0.2888504, -1.434461, 1, 1, 1, 1, 1,
-1.559049, 0.01824266, -1.854733, 1, 1, 1, 1, 1,
-1.557884, 2.401505, -1.070613, 1, 1, 1, 1, 1,
-1.549511, -1.186152, -2.572095, 1, 1, 1, 1, 1,
-1.54337, 1.453275, -2.336661, 1, 1, 1, 1, 1,
-1.541008, 0.4374739, -1.295269, 1, 1, 1, 1, 1,
-1.517803, -0.2910399, -0.2269629, 1, 1, 1, 1, 1,
-1.506492, -1.585536, -1.025398, 1, 1, 1, 1, 1,
-1.502145, -1.71615, -0.8455727, 1, 1, 1, 1, 1,
-1.500819, -1.289889, -3.77526, 1, 1, 1, 1, 1,
-1.491241, -0.3428304, -1.436631, 1, 1, 1, 1, 1,
-1.483278, 0.9185097, -2.52407, 1, 1, 1, 1, 1,
-1.467061, 1.057175, 0.6106953, 1, 1, 1, 1, 1,
-1.464657, -0.5113728, -2.640096, 1, 1, 1, 1, 1,
-1.458002, -0.1658868, -2.311238, 1, 1, 1, 1, 1,
-1.452139, -0.1002435, -0.685607, 0, 0, 1, 1, 1,
-1.451737, -0.8012447, -1.164387, 1, 0, 0, 1, 1,
-1.444074, -0.3173553, 0.4451631, 1, 0, 0, 1, 1,
-1.440361, 0.1404961, -1.141775, 1, 0, 0, 1, 1,
-1.431529, 1.506536, -1.82307, 1, 0, 0, 1, 1,
-1.430956, 0.2252604, -1.804347, 1, 0, 0, 1, 1,
-1.429276, -1.17837, -3.474827, 0, 0, 0, 1, 1,
-1.424672, -0.4566871, -2.129004, 0, 0, 0, 1, 1,
-1.423869, -0.9722819, -2.625622, 0, 0, 0, 1, 1,
-1.417279, 1.748332, -1.715696, 0, 0, 0, 1, 1,
-1.410721, 0.6848361, -1.632061, 0, 0, 0, 1, 1,
-1.409924, 1.156864, -0.1395541, 0, 0, 0, 1, 1,
-1.406607, 0.3301567, -1.714921, 0, 0, 0, 1, 1,
-1.404, -0.3464414, -1.423628, 1, 1, 1, 1, 1,
-1.401029, -0.4547242, -2.943171, 1, 1, 1, 1, 1,
-1.393394, -0.5530243, -3.001858, 1, 1, 1, 1, 1,
-1.379752, 0.510361, -2.113486, 1, 1, 1, 1, 1,
-1.376789, 1.412469, 0.2788351, 1, 1, 1, 1, 1,
-1.373824, -1.133285, -2.747625, 1, 1, 1, 1, 1,
-1.372628, 0.1391748, -1.084746, 1, 1, 1, 1, 1,
-1.367103, 0.3831882, -2.792494, 1, 1, 1, 1, 1,
-1.359346, -0.4221328, -1.802441, 1, 1, 1, 1, 1,
-1.357674, 0.2516192, -0.3063455, 1, 1, 1, 1, 1,
-1.350341, 0.9386013, -0.2229205, 1, 1, 1, 1, 1,
-1.346205, 0.9556017, 0.8065637, 1, 1, 1, 1, 1,
-1.345595, 0.02044418, -1.422168, 1, 1, 1, 1, 1,
-1.331684, -1.037337, -2.116609, 1, 1, 1, 1, 1,
-1.330849, -0.2201505, -3.086972, 1, 1, 1, 1, 1,
-1.329765, -1.545528, -3.309121, 0, 0, 1, 1, 1,
-1.329728, 0.9967883, -1.044333, 1, 0, 0, 1, 1,
-1.321004, 0.7857938, -1.758573, 1, 0, 0, 1, 1,
-1.308726, -0.6527282, -2.742476, 1, 0, 0, 1, 1,
-1.306045, 0.1790504, -0.03913785, 1, 0, 0, 1, 1,
-1.297701, -0.5214808, -1.275639, 1, 0, 0, 1, 1,
-1.283078, 0.4021637, -1.19503, 0, 0, 0, 1, 1,
-1.278249, 0.06891823, -2.037598, 0, 0, 0, 1, 1,
-1.278234, 0.4808616, -1.976907, 0, 0, 0, 1, 1,
-1.271868, -0.7810126, -2.563957, 0, 0, 0, 1, 1,
-1.259457, -1.039052, -3.513249, 0, 0, 0, 1, 1,
-1.256405, 0.7022268, -2.502941, 0, 0, 0, 1, 1,
-1.251969, 0.4758882, 1.048, 0, 0, 0, 1, 1,
-1.242842, 0.7840194, -1.916246, 1, 1, 1, 1, 1,
-1.242202, -0.3856844, -4.174552, 1, 1, 1, 1, 1,
-1.234333, 0.02500904, -4.401785, 1, 1, 1, 1, 1,
-1.228726, 1.537003, -0.2643372, 1, 1, 1, 1, 1,
-1.227231, -0.5109408, -3.20933, 1, 1, 1, 1, 1,
-1.225158, 0.4779717, -1.962332, 1, 1, 1, 1, 1,
-1.218364, 0.1480094, 0.8834644, 1, 1, 1, 1, 1,
-1.215279, 0.2018814, -1.808143, 1, 1, 1, 1, 1,
-1.214949, 0.2400063, -1.850528, 1, 1, 1, 1, 1,
-1.212485, 1.281009, -1.245719, 1, 1, 1, 1, 1,
-1.21209, -0.1632252, -3.705725, 1, 1, 1, 1, 1,
-1.20787, -0.6547239, -3.145711, 1, 1, 1, 1, 1,
-1.207021, -0.444235, -1.037963, 1, 1, 1, 1, 1,
-1.197457, -0.7166299, -3.184744, 1, 1, 1, 1, 1,
-1.192961, -0.6540602, -1.863761, 1, 1, 1, 1, 1,
-1.189942, -1.466485, 0.1165664, 0, 0, 1, 1, 1,
-1.172503, -0.2083486, -1.386241, 1, 0, 0, 1, 1,
-1.171002, -1.268211, -1.897008, 1, 0, 0, 1, 1,
-1.168146, -1.180416, -1.9834, 1, 0, 0, 1, 1,
-1.16596, 1.170148, 0.3457085, 1, 0, 0, 1, 1,
-1.161766, -0.317407, -3.05424, 1, 0, 0, 1, 1,
-1.155622, -1.314123, -3.375073, 0, 0, 0, 1, 1,
-1.148851, -0.1672372, -0.559752, 0, 0, 0, 1, 1,
-1.14872, 0.3106001, -1.448786, 0, 0, 0, 1, 1,
-1.14687, -0.2221147, -0.6129424, 0, 0, 0, 1, 1,
-1.146811, -1.38605, -1.719538, 0, 0, 0, 1, 1,
-1.145149, 1.160097, 0.8194862, 0, 0, 0, 1, 1,
-1.138714, -1.732038, -3.283767, 0, 0, 0, 1, 1,
-1.137119, 1.776395, -0.660992, 1, 1, 1, 1, 1,
-1.136893, 0.5041205, -2.136605, 1, 1, 1, 1, 1,
-1.13242, -1.005736, -2.889337, 1, 1, 1, 1, 1,
-1.130612, -1.29592, -2.235398, 1, 1, 1, 1, 1,
-1.130148, -0.4977605, -2.08642, 1, 1, 1, 1, 1,
-1.129153, 1.15776, 0.5590354, 1, 1, 1, 1, 1,
-1.128955, 1.558222, -0.9741738, 1, 1, 1, 1, 1,
-1.125597, -1.834902, -3.729031, 1, 1, 1, 1, 1,
-1.110876, 0.8940812, -0.2105557, 1, 1, 1, 1, 1,
-1.10961, -0.5006847, -1.678174, 1, 1, 1, 1, 1,
-1.106178, -1.609276, -2.769049, 1, 1, 1, 1, 1,
-1.105131, 2.478015, -0.02327346, 1, 1, 1, 1, 1,
-1.103285, 0.994853, -1.818185, 1, 1, 1, 1, 1,
-1.098024, 1.265659, 0.2087206, 1, 1, 1, 1, 1,
-1.096723, 0.8353121, -1.122821, 1, 1, 1, 1, 1,
-1.09104, -1.182006, -3.244682, 0, 0, 1, 1, 1,
-1.08373, 1.409326, -1.11524, 1, 0, 0, 1, 1,
-1.082975, 0.5091811, -1.332387, 1, 0, 0, 1, 1,
-1.081616, -0.003112779, -2.040397, 1, 0, 0, 1, 1,
-1.068713, 1.031719, -0.8481989, 1, 0, 0, 1, 1,
-1.065521, 0.05281729, -1.988924, 1, 0, 0, 1, 1,
-1.06204, 0.6298612, -1.04879, 0, 0, 0, 1, 1,
-1.051975, 0.378701, -0.7080317, 0, 0, 0, 1, 1,
-1.050959, 0.04704229, -1.631732, 0, 0, 0, 1, 1,
-1.047605, 1.22394, -0.8359079, 0, 0, 0, 1, 1,
-1.045537, 1.866684, -0.4288145, 0, 0, 0, 1, 1,
-1.040755, 0.1637261, -2.726057, 0, 0, 0, 1, 1,
-1.036602, -1.364569, -4.424596, 0, 0, 0, 1, 1,
-1.029794, 0.4394591, -0.3997911, 1, 1, 1, 1, 1,
-1.028543, 0.635215, -0.8855785, 1, 1, 1, 1, 1,
-1.024063, -0.2302638, -2.500236, 1, 1, 1, 1, 1,
-1.022824, 0.05941856, -0.9825869, 1, 1, 1, 1, 1,
-1.015171, 0.8564887, -0.4353116, 1, 1, 1, 1, 1,
-1.004665, -1.29874, -1.889088, 1, 1, 1, 1, 1,
-0.9938509, -1.400415, -3.686372, 1, 1, 1, 1, 1,
-0.9930134, 0.7067544, -1.303796, 1, 1, 1, 1, 1,
-0.9912857, 1.095845, -0.3640295, 1, 1, 1, 1, 1,
-0.9879288, -0.1314296, -2.555661, 1, 1, 1, 1, 1,
-0.9833149, 1.133122, -1.287469, 1, 1, 1, 1, 1,
-0.9745444, -2.043693, -3.742803, 1, 1, 1, 1, 1,
-0.9668509, -1.357223, -2.256527, 1, 1, 1, 1, 1,
-0.9667202, -0.9491996, -1.509845, 1, 1, 1, 1, 1,
-0.9649678, -0.9864175, -3.573084, 1, 1, 1, 1, 1,
-0.961245, -1.375634, -3.171827, 0, 0, 1, 1, 1,
-0.958584, -0.06644516, -0.3025603, 1, 0, 0, 1, 1,
-0.9576142, -0.03535647, -1.411704, 1, 0, 0, 1, 1,
-0.9559356, 0.8223739, -2.456301, 1, 0, 0, 1, 1,
-0.9556121, -1.746298, -2.495337, 1, 0, 0, 1, 1,
-0.9537026, -0.808685, -0.2831193, 1, 0, 0, 1, 1,
-0.9529111, 0.4534098, -0.3800435, 0, 0, 0, 1, 1,
-0.9490846, 0.7359728, 0.134409, 0, 0, 0, 1, 1,
-0.9361662, 0.9899052, 0.4211158, 0, 0, 0, 1, 1,
-0.9358146, -0.5424953, -0.7102303, 0, 0, 0, 1, 1,
-0.9301431, 0.942553, 0.5377395, 0, 0, 0, 1, 1,
-0.9280242, 2.648426, -1.241114, 0, 0, 0, 1, 1,
-0.9106469, -0.1744951, -2.186927, 0, 0, 0, 1, 1,
-0.9070863, 0.1461843, -2.471493, 1, 1, 1, 1, 1,
-0.9064618, 0.7276158, -1.75296, 1, 1, 1, 1, 1,
-0.8981549, -1.20758, -2.530851, 1, 1, 1, 1, 1,
-0.8964671, -0.9041757, -2.114428, 1, 1, 1, 1, 1,
-0.8872998, -0.7353891, -3.049536, 1, 1, 1, 1, 1,
-0.8815704, -1.60119, -2.168529, 1, 1, 1, 1, 1,
-0.8811724, 0.2016589, -2.252978, 1, 1, 1, 1, 1,
-0.8776258, 0.7362654, -0.6892584, 1, 1, 1, 1, 1,
-0.8754057, -0.3129999, -1.24089, 1, 1, 1, 1, 1,
-0.8742574, -0.2448145, -2.48285, 1, 1, 1, 1, 1,
-0.8733413, 0.5669222, -0.7304854, 1, 1, 1, 1, 1,
-0.8722314, -0.8895802, -0.5065499, 1, 1, 1, 1, 1,
-0.8678465, 0.1057509, -1.635531, 1, 1, 1, 1, 1,
-0.8643959, -0.03613251, -1.442654, 1, 1, 1, 1, 1,
-0.8579569, 0.6132617, -3.427439, 1, 1, 1, 1, 1,
-0.8518379, -0.02995972, -2.534858, 0, 0, 1, 1, 1,
-0.8518164, 0.7334538, -3.095416, 1, 0, 0, 1, 1,
-0.8501451, -0.8798259, -1.175308, 1, 0, 0, 1, 1,
-0.8492199, 0.6553366, -0.6672179, 1, 0, 0, 1, 1,
-0.8472056, 0.5316798, -1.25704, 1, 0, 0, 1, 1,
-0.8445626, 1.465569, -3.429646, 1, 0, 0, 1, 1,
-0.8439771, -0.4690404, -0.2846838, 0, 0, 0, 1, 1,
-0.837205, 0.1959109, -1.818951, 0, 0, 0, 1, 1,
-0.8360519, 0.2840889, -1.302794, 0, 0, 0, 1, 1,
-0.8338231, -0.641605, -1.811058, 0, 0, 0, 1, 1,
-0.8323184, -0.9860236, -3.382148, 0, 0, 0, 1, 1,
-0.8277933, 0.06218653, -1.395294, 0, 0, 0, 1, 1,
-0.8220973, -0.103374, -0.7949753, 0, 0, 0, 1, 1,
-0.8203918, 1.285869, -2.77676, 1, 1, 1, 1, 1,
-0.8195135, 1.571204, -2.80569, 1, 1, 1, 1, 1,
-0.819269, -0.5049576, -3.275563, 1, 1, 1, 1, 1,
-0.8122945, -0.230223, -0.938727, 1, 1, 1, 1, 1,
-0.8115482, -1.29476, -3.527745, 1, 1, 1, 1, 1,
-0.8089913, 0.2735521, -0.1903292, 1, 1, 1, 1, 1,
-0.8072753, -0.6213311, -1.062827, 1, 1, 1, 1, 1,
-0.8060759, 1.491817, -0.291626, 1, 1, 1, 1, 1,
-0.8060362, 1.214166, -0.8309671, 1, 1, 1, 1, 1,
-0.8024755, -0.1228354, -2.92301, 1, 1, 1, 1, 1,
-0.791133, -0.5606158, -1.381441, 1, 1, 1, 1, 1,
-0.7845997, 0.5963364, 0.09691954, 1, 1, 1, 1, 1,
-0.7734939, -0.8301675, -2.775832, 1, 1, 1, 1, 1,
-0.7725432, 0.4281404, -1.727284, 1, 1, 1, 1, 1,
-0.7716969, -0.7529131, -2.00368, 1, 1, 1, 1, 1,
-0.7715279, -0.9139739, -2.797813, 0, 0, 1, 1, 1,
-0.7662957, 0.5683151, -1.862269, 1, 0, 0, 1, 1,
-0.7541069, 0.8266942, -0.4949081, 1, 0, 0, 1, 1,
-0.7434883, -2.810445, -4.572013, 1, 0, 0, 1, 1,
-0.7387591, 1.038267, 0.4137219, 1, 0, 0, 1, 1,
-0.7367876, -0.4489601, -1.987922, 1, 0, 0, 1, 1,
-0.7282659, -0.8607097, -3.141298, 0, 0, 0, 1, 1,
-0.7183633, -0.002658311, -1.667472, 0, 0, 0, 1, 1,
-0.7181515, 0.5240903, -2.183177, 0, 0, 0, 1, 1,
-0.702518, 0.6634929, -1.530598, 0, 0, 0, 1, 1,
-0.7001117, 1.927141, 1.240044, 0, 0, 0, 1, 1,
-0.695657, 0.5966305, -0.6016755, 0, 0, 0, 1, 1,
-0.6952391, -0.5824535, -2.574498, 0, 0, 0, 1, 1,
-0.6940246, 0.1081861, -1.521453, 1, 1, 1, 1, 1,
-0.693484, -1.438437, -2.042664, 1, 1, 1, 1, 1,
-0.6918344, -2.069758, -1.149982, 1, 1, 1, 1, 1,
-0.6900631, 0.1428063, -1.043475, 1, 1, 1, 1, 1,
-0.6899022, 0.8208105, -1.786949, 1, 1, 1, 1, 1,
-0.6861585, 0.3129846, -0.319197, 1, 1, 1, 1, 1,
-0.6826727, -1.24766, -3.272167, 1, 1, 1, 1, 1,
-0.6788604, -2.314823, -3.476526, 1, 1, 1, 1, 1,
-0.677647, 0.154787, -0.4347332, 1, 1, 1, 1, 1,
-0.6770414, -1.369179, -2.090927, 1, 1, 1, 1, 1,
-0.6752291, 0.7947272, -3.260051, 1, 1, 1, 1, 1,
-0.6747798, -0.007771094, -3.013702, 1, 1, 1, 1, 1,
-0.6741609, 0.9650124, 0.03139653, 1, 1, 1, 1, 1,
-0.6732211, -0.2883581, -2.03082, 1, 1, 1, 1, 1,
-0.6677589, 0.7350841, -3.159337, 1, 1, 1, 1, 1,
-0.6650428, 0.3559448, -0.07628924, 0, 0, 1, 1, 1,
-0.6617959, -0.7672197, -1.959857, 1, 0, 0, 1, 1,
-0.6588413, 0.1465635, -1.475382, 1, 0, 0, 1, 1,
-0.6572624, -0.3726992, -2.404071, 1, 0, 0, 1, 1,
-0.6547818, -0.8614457, -1.680324, 1, 0, 0, 1, 1,
-0.650587, -0.3043667, -2.644735, 1, 0, 0, 1, 1,
-0.6494699, -0.1691069, -2.23196, 0, 0, 0, 1, 1,
-0.6450527, -1.041344, -2.038136, 0, 0, 0, 1, 1,
-0.6382728, 1.786718, -0.2455055, 0, 0, 0, 1, 1,
-0.6379594, 1.426376, -0.4267938, 0, 0, 0, 1, 1,
-0.6359841, 0.3446082, -0.1154026, 0, 0, 0, 1, 1,
-0.6317001, 0.4556491, -3.769831, 0, 0, 0, 1, 1,
-0.630024, -0.02614464, -2.540853, 0, 0, 0, 1, 1,
-0.6296653, 2.76655, 0.5153983, 1, 1, 1, 1, 1,
-0.6169153, -1.009289, -2.489289, 1, 1, 1, 1, 1,
-0.6120722, 0.8538007, -0.6663532, 1, 1, 1, 1, 1,
-0.6119122, -1.402484, -3.586087, 1, 1, 1, 1, 1,
-0.6064846, 1.404611, -0.6861054, 1, 1, 1, 1, 1,
-0.6031635, -0.1340725, -1.86808, 1, 1, 1, 1, 1,
-0.6003196, -0.3492903, -2.179889, 1, 1, 1, 1, 1,
-0.598088, 0.9141486, -0.8179084, 1, 1, 1, 1, 1,
-0.5933842, 0.1710727, -2.896547, 1, 1, 1, 1, 1,
-0.5843427, 1.164889, -0.3146034, 1, 1, 1, 1, 1,
-0.5795835, -0.1921626, -2.427851, 1, 1, 1, 1, 1,
-0.5777658, 2.008314, 0.3327267, 1, 1, 1, 1, 1,
-0.5668731, -0.5893383, -2.7052, 1, 1, 1, 1, 1,
-0.5664705, 1.246457, 0.4104464, 1, 1, 1, 1, 1,
-0.5660316, 1.479378, 0.6323475, 1, 1, 1, 1, 1,
-0.5582561, 1.146852, 0.1907101, 0, 0, 1, 1, 1,
-0.5531998, -1.084824, -2.174641, 1, 0, 0, 1, 1,
-0.5488079, -0.4538746, -1.228675, 1, 0, 0, 1, 1,
-0.5481512, 1.403947, -1.194483, 1, 0, 0, 1, 1,
-0.5384866, -1.906546, -1.71495, 1, 0, 0, 1, 1,
-0.5366558, 3.077667, -0.9578829, 1, 0, 0, 1, 1,
-0.5267524, 0.5484543, 0.06072341, 0, 0, 0, 1, 1,
-0.5238037, -1.231864, -3.342928, 0, 0, 0, 1, 1,
-0.5228679, -0.985984, -2.867124, 0, 0, 0, 1, 1,
-0.5156894, -0.7104253, -2.404381, 0, 0, 0, 1, 1,
-0.5153347, -0.2020179, -2.71639, 0, 0, 0, 1, 1,
-0.5145353, -1.442106, -2.684871, 0, 0, 0, 1, 1,
-0.5112136, -0.07739535, -1.764483, 0, 0, 0, 1, 1,
-0.5082, 2.326835, -2.004556, 1, 1, 1, 1, 1,
-0.505504, 0.1932871, -2.048267, 1, 1, 1, 1, 1,
-0.5034471, 0.9708377, -0.3774205, 1, 1, 1, 1, 1,
-0.5024126, -0.6674549, -2.298316, 1, 1, 1, 1, 1,
-0.5016409, 0.428175, -0.3186262, 1, 1, 1, 1, 1,
-0.5004094, -1.440207, -2.806697, 1, 1, 1, 1, 1,
-0.4999224, 0.1943232, -1.660163, 1, 1, 1, 1, 1,
-0.499697, -0.3195058, -1.471304, 1, 1, 1, 1, 1,
-0.4975971, 0.349715, -0.8840363, 1, 1, 1, 1, 1,
-0.4974833, 0.5057489, -2.407779, 1, 1, 1, 1, 1,
-0.4945697, 0.1034184, -0.3592594, 1, 1, 1, 1, 1,
-0.4909068, 0.1117168, -2.690004, 1, 1, 1, 1, 1,
-0.4807727, -0.08762176, -0.7769674, 1, 1, 1, 1, 1,
-0.4790933, -0.4113378, -3.721525, 1, 1, 1, 1, 1,
-0.4790695, 1.048711, -0.36949, 1, 1, 1, 1, 1,
-0.4771459, 0.4538289, 0.6113973, 0, 0, 1, 1, 1,
-0.4768729, -0.3651581, -2.434876, 1, 0, 0, 1, 1,
-0.4744628, -1.487403, -2.778708, 1, 0, 0, 1, 1,
-0.4704489, 0.02007298, -1.874994, 1, 0, 0, 1, 1,
-0.4678987, 0.1243757, -1.933512, 1, 0, 0, 1, 1,
-0.4614528, -0.1994893, -1.934632, 1, 0, 0, 1, 1,
-0.4609798, 0.2933302, -0.8046381, 0, 0, 0, 1, 1,
-0.4528131, -0.7837588, -3.424557, 0, 0, 0, 1, 1,
-0.4435493, 0.7244946, -3.230924, 0, 0, 0, 1, 1,
-0.4394957, 1.753105, -1.646572, 0, 0, 0, 1, 1,
-0.4355381, 1.559033, -0.05489558, 0, 0, 0, 1, 1,
-0.4345355, -1.786209, -3.952197, 0, 0, 0, 1, 1,
-0.4302439, -0.9019594, -3.768013, 0, 0, 0, 1, 1,
-0.4301008, 1.627275, 0.9305233, 1, 1, 1, 1, 1,
-0.427907, -2.038884, -4.001456, 1, 1, 1, 1, 1,
-0.4273596, -0.5774973, -1.640387, 1, 1, 1, 1, 1,
-0.4271574, -0.6554822, -4.294621, 1, 1, 1, 1, 1,
-0.4261315, -1.431915, -3.348033, 1, 1, 1, 1, 1,
-0.4250746, 0.595803, -1.314506, 1, 1, 1, 1, 1,
-0.4205006, 1.893506, -0.404109, 1, 1, 1, 1, 1,
-0.4181173, -0.4708542, -2.419464, 1, 1, 1, 1, 1,
-0.4132153, 0.4791605, -1.354581, 1, 1, 1, 1, 1,
-0.4128701, 0.9837101, 0.3402105, 1, 1, 1, 1, 1,
-0.4100083, 0.479051, -0.8238242, 1, 1, 1, 1, 1,
-0.4068804, 1.159904, -2.284327, 1, 1, 1, 1, 1,
-0.4036633, 1.383997, -0.3766664, 1, 1, 1, 1, 1,
-0.4018959, 0.1712269, -0.169109, 1, 1, 1, 1, 1,
-0.3972436, 0.6562501, -0.9427435, 1, 1, 1, 1, 1,
-0.3962104, -0.5764244, -2.010651, 0, 0, 1, 1, 1,
-0.3960382, 0.3070489, -0.658242, 1, 0, 0, 1, 1,
-0.3946752, -1.356233, -2.949057, 1, 0, 0, 1, 1,
-0.3929302, -0.2550724, -2.743702, 1, 0, 0, 1, 1,
-0.3928986, 0.2015221, -3.856135, 1, 0, 0, 1, 1,
-0.3920009, 2.104995, 0.7069827, 1, 0, 0, 1, 1,
-0.3909583, -0.1592248, -1.669973, 0, 0, 0, 1, 1,
-0.3900761, -1.796676, -3.728196, 0, 0, 0, 1, 1,
-0.3876466, -0.4275212, -2.071248, 0, 0, 0, 1, 1,
-0.3857737, 0.9068546, 2.096278, 0, 0, 0, 1, 1,
-0.3815718, -1.629316, -2.489332, 0, 0, 0, 1, 1,
-0.3794193, 0.9030631, -1.280202, 0, 0, 0, 1, 1,
-0.3785492, 2.325883, -0.2623158, 0, 0, 0, 1, 1,
-0.3784362, -2.935136, -3.740736, 1, 1, 1, 1, 1,
-0.3680619, 0.8108056, -0.796928, 1, 1, 1, 1, 1,
-0.3657053, -1.131067, -4.88518, 1, 1, 1, 1, 1,
-0.3619153, -0.3142725, -1.619316, 1, 1, 1, 1, 1,
-0.3585342, 0.1403286, 0.05818039, 1, 1, 1, 1, 1,
-0.3555439, -1.153938, -0.7231781, 1, 1, 1, 1, 1,
-0.3546083, 0.1440643, -0.2055001, 1, 1, 1, 1, 1,
-0.3502545, 0.9678302, -0.8903834, 1, 1, 1, 1, 1,
-0.3494968, -0.451082, -1.100996, 1, 1, 1, 1, 1,
-0.3493666, 1.319856, -0.3125603, 1, 1, 1, 1, 1,
-0.3403743, 0.2972104, -1.361538, 1, 1, 1, 1, 1,
-0.3389597, -0.3081824, -2.286009, 1, 1, 1, 1, 1,
-0.3387678, -1.34433, -3.674892, 1, 1, 1, 1, 1,
-0.3382149, 0.07540582, -0.4216009, 1, 1, 1, 1, 1,
-0.3328848, -0.001714826, -0.4079226, 1, 1, 1, 1, 1,
-0.3325094, -1.655865, -3.5189, 0, 0, 1, 1, 1,
-0.3284319, -1.250514, -3.987103, 1, 0, 0, 1, 1,
-0.3261858, 1.480249, -0.845818, 1, 0, 0, 1, 1,
-0.3240567, 1.255983, 0.270197, 1, 0, 0, 1, 1,
-0.3221379, 1.051442, -1.07221, 1, 0, 0, 1, 1,
-0.3219208, -0.03529578, -3.115121, 1, 0, 0, 1, 1,
-0.3207029, 1.583108, 0.2865493, 0, 0, 0, 1, 1,
-0.3178901, 0.329188, -1.833391, 0, 0, 0, 1, 1,
-0.3171217, -0.7955391, -2.978086, 0, 0, 0, 1, 1,
-0.3157925, -0.5517563, -3.877634, 0, 0, 0, 1, 1,
-0.3110014, -1.49768, -3.417309, 0, 0, 0, 1, 1,
-0.3076443, -0.988777, -2.54337, 0, 0, 0, 1, 1,
-0.3052092, 0.2030574, -0.5223933, 0, 0, 0, 1, 1,
-0.3052002, 0.06640516, -1.407954, 1, 1, 1, 1, 1,
-0.3045899, 0.4650418, -2.427762, 1, 1, 1, 1, 1,
-0.3043882, 0.7872178, 0.7403365, 1, 1, 1, 1, 1,
-0.3038475, 1.956678, 0.629731, 1, 1, 1, 1, 1,
-0.2996539, -0.8172592, -3.467708, 1, 1, 1, 1, 1,
-0.2970544, 0.4218368, 0.342435, 1, 1, 1, 1, 1,
-0.2961839, -0.1572538, -3.840509, 1, 1, 1, 1, 1,
-0.2911504, -0.9929329, -2.988093, 1, 1, 1, 1, 1,
-0.2907215, 0.6560416, -0.01000989, 1, 1, 1, 1, 1,
-0.285593, -0.7648547, -2.700708, 1, 1, 1, 1, 1,
-0.2845967, -1.773713, -2.899347, 1, 1, 1, 1, 1,
-0.2840524, 0.6203994, -0.7308119, 1, 1, 1, 1, 1,
-0.2778631, -0.3732794, -2.775249, 1, 1, 1, 1, 1,
-0.2756685, -0.5769247, -2.088825, 1, 1, 1, 1, 1,
-0.271259, 0.1365121, -2.198888, 1, 1, 1, 1, 1,
-0.2669246, 0.2046593, 0.307067, 0, 0, 1, 1, 1,
-0.2641518, 1.261778, -1.064277, 1, 0, 0, 1, 1,
-0.2633762, 1.04143, 0.5449735, 1, 0, 0, 1, 1,
-0.2590175, 0.6364, -0.3936688, 1, 0, 0, 1, 1,
-0.2562118, 0.178954, -1.784333, 1, 0, 0, 1, 1,
-0.2561681, -1.112698, -2.121948, 1, 0, 0, 1, 1,
-0.2501377, -0.9133745, -2.833793, 0, 0, 0, 1, 1,
-0.2494299, 0.5654345, -0.901231, 0, 0, 0, 1, 1,
-0.2478803, 0.5236394, -0.5823442, 0, 0, 0, 1, 1,
-0.2433971, 0.2523469, 0.09868518, 0, 0, 0, 1, 1,
-0.2430686, 1.050139, -0.8979097, 0, 0, 0, 1, 1,
-0.239974, -0.8048809, -2.736258, 0, 0, 0, 1, 1,
-0.2392976, -0.9026262, -4.727888, 0, 0, 0, 1, 1,
-0.2316322, 2.097581, 1.79519, 1, 1, 1, 1, 1,
-0.229189, -0.7659385, -3.658418, 1, 1, 1, 1, 1,
-0.2280053, -1.150351, -1.674462, 1, 1, 1, 1, 1,
-0.2225127, 1.379663, -0.4651413, 1, 1, 1, 1, 1,
-0.2134831, 0.8584257, 0.2180949, 1, 1, 1, 1, 1,
-0.2068444, 0.6207377, -1.227769, 1, 1, 1, 1, 1,
-0.2050246, -0.904067, -3.680587, 1, 1, 1, 1, 1,
-0.201673, 1.020342, -1.632368, 1, 1, 1, 1, 1,
-0.2012731, 0.1521519, -1.989008, 1, 1, 1, 1, 1,
-0.1971072, 0.1411344, 0.7136776, 1, 1, 1, 1, 1,
-0.1963096, -1.385274, -2.144422, 1, 1, 1, 1, 1,
-0.1952214, 1.690146, 1.295923, 1, 1, 1, 1, 1,
-0.1941123, -1.203959, -3.844747, 1, 1, 1, 1, 1,
-0.1917193, -0.8502822, -4.189145, 1, 1, 1, 1, 1,
-0.1913416, -0.2553502, -2.3594, 1, 1, 1, 1, 1,
-0.1833496, -1.041847, -3.161998, 0, 0, 1, 1, 1,
-0.1829327, -0.5170738, -1.52356, 1, 0, 0, 1, 1,
-0.1814891, 0.1814216, -0.7581617, 1, 0, 0, 1, 1,
-0.1814686, -0.1996925, -3.112101, 1, 0, 0, 1, 1,
-0.1693677, 1.118173, 0.9578119, 1, 0, 0, 1, 1,
-0.1692173, 0.6262535, 0.588388, 1, 0, 0, 1, 1,
-0.1653462, -0.4158833, -4.128072, 0, 0, 0, 1, 1,
-0.1643851, 0.4994728, -0.3885998, 0, 0, 0, 1, 1,
-0.1621237, -0.5424107, -1.942057, 0, 0, 0, 1, 1,
-0.1558257, -0.3580763, -3.431742, 0, 0, 0, 1, 1,
-0.1557411, 1.081203, -0.1508213, 0, 0, 0, 1, 1,
-0.1556759, -1.239621, -3.619142, 0, 0, 0, 1, 1,
-0.1491065, -0.8256642, -3.347467, 0, 0, 0, 1, 1,
-0.1456635, -0.6314205, -3.900239, 1, 1, 1, 1, 1,
-0.1439384, 0.7825817, 0.7810243, 1, 1, 1, 1, 1,
-0.1384866, 0.2879527, -0.2594967, 1, 1, 1, 1, 1,
-0.1372704, -1.043936, -2.980366, 1, 1, 1, 1, 1,
-0.1369237, -1.107218, -3.213211, 1, 1, 1, 1, 1,
-0.1308402, -0.3434789, -3.199697, 1, 1, 1, 1, 1,
-0.1275424, 1.455595, -0.09337074, 1, 1, 1, 1, 1,
-0.1270928, 1.298025, -0.6966749, 1, 1, 1, 1, 1,
-0.1260692, 1.085213, 0.1242625, 1, 1, 1, 1, 1,
-0.120918, 2.947292, 1.000154, 1, 1, 1, 1, 1,
-0.1201816, -0.1737821, -1.977006, 1, 1, 1, 1, 1,
-0.1166549, 0.9768807, 1.218324, 1, 1, 1, 1, 1,
-0.1145612, 0.3124832, -1.132184, 1, 1, 1, 1, 1,
-0.1144775, -0.8548561, -3.224669, 1, 1, 1, 1, 1,
-0.1109732, -3.180953, -2.493796, 1, 1, 1, 1, 1,
-0.110264, 0.156104, -3.022078, 0, 0, 1, 1, 1,
-0.107407, 0.2757329, 0.9374793, 1, 0, 0, 1, 1,
-0.1074016, -2.165333, -0.4618326, 1, 0, 0, 1, 1,
-0.104886, -0.2439896, -3.490263, 1, 0, 0, 1, 1,
-0.1043271, 0.6920888, -0.881282, 1, 0, 0, 1, 1,
-0.1025991, 0.1478319, -0.7287686, 1, 0, 0, 1, 1,
-0.09430917, 1.729213, -0.6525302, 0, 0, 0, 1, 1,
-0.07990252, -0.2199277, -3.547621, 0, 0, 0, 1, 1,
-0.07687321, -1.46726, -0.8157642, 0, 0, 0, 1, 1,
-0.0765852, 0.08445672, -0.9779136, 0, 0, 0, 1, 1,
-0.07140374, 0.2257846, 0.3220181, 0, 0, 0, 1, 1,
-0.07118651, -0.3821332, -2.38388, 0, 0, 0, 1, 1,
-0.07044505, 0.7737328, -0.08371048, 0, 0, 0, 1, 1,
-0.06999514, 0.6425495, 0.9087238, 1, 1, 1, 1, 1,
-0.06687417, 0.4536707, 0.141831, 1, 1, 1, 1, 1,
-0.06596849, 0.5474865, -0.6424578, 1, 1, 1, 1, 1,
-0.05989135, -0.09355613, -2.712602, 1, 1, 1, 1, 1,
-0.05482994, 0.2492131, 0.3124423, 1, 1, 1, 1, 1,
-0.0531924, -0.1788344, -1.496852, 1, 1, 1, 1, 1,
-0.05123907, -0.8409972, -3.053077, 1, 1, 1, 1, 1,
-0.0473166, 0.1832432, -0.5642121, 1, 1, 1, 1, 1,
-0.0471113, -0.8783313, -3.136321, 1, 1, 1, 1, 1,
-0.04646777, 0.5411609, 0.9723005, 1, 1, 1, 1, 1,
-0.04608815, -0.54838, -3.027743, 1, 1, 1, 1, 1,
-0.04462741, -0.2857123, -4.52325, 1, 1, 1, 1, 1,
-0.04429743, -0.5553234, -1.12981, 1, 1, 1, 1, 1,
-0.04065525, 0.2393368, 2.206154, 1, 1, 1, 1, 1,
-0.03603903, -1.123732, -1.890579, 1, 1, 1, 1, 1,
-0.03592497, 0.3409648, -0.08904514, 0, 0, 1, 1, 1,
-0.03347027, -0.2069304, -0.8441443, 1, 0, 0, 1, 1,
-0.03320903, -1.101467, -3.224661, 1, 0, 0, 1, 1,
-0.02784319, 0.1481786, -0.1685828, 1, 0, 0, 1, 1,
-0.02400275, 0.9842259, 0.008884718, 1, 0, 0, 1, 1,
-0.02168584, -0.2814286, -3.880602, 1, 0, 0, 1, 1,
-0.01671242, 0.9474207, -0.4370703, 0, 0, 0, 1, 1,
-0.0134341, 0.6125433, 0.386966, 0, 0, 0, 1, 1,
-0.00305517, 0.2305314, 0.6362337, 0, 0, 0, 1, 1,
-0.002579747, -0.9047093, -2.712614, 0, 0, 0, 1, 1,
-0.001266303, -0.1155895, -3.76849, 0, 0, 0, 1, 1,
-0.0009237526, 0.547838, -0.6623381, 0, 0, 0, 1, 1,
-0.0007044304, -1.285502, -4.774957, 0, 0, 0, 1, 1,
0.002010252, 0.08382533, 0.1911245, 1, 1, 1, 1, 1,
0.003450252, 0.113426, 0.9804713, 1, 1, 1, 1, 1,
0.00479381, 0.05435071, -0.8566444, 1, 1, 1, 1, 1,
0.008765593, 0.1328411, -1.008653, 1, 1, 1, 1, 1,
0.01044669, -0.9542181, 3.171108, 1, 1, 1, 1, 1,
0.01119933, -1.108929, 3.281301, 1, 1, 1, 1, 1,
0.01363787, 0.5973376, -1.146121, 1, 1, 1, 1, 1,
0.02188414, 2.490534, 1.401376, 1, 1, 1, 1, 1,
0.02306696, -0.8545818, 4.097193, 1, 1, 1, 1, 1,
0.02508078, -0.2311395, 2.133052, 1, 1, 1, 1, 1,
0.02599452, -1.293283, 2.323991, 1, 1, 1, 1, 1,
0.03091394, 1.15357, -1.017412, 1, 1, 1, 1, 1,
0.03292753, -0.9246297, 2.809736, 1, 1, 1, 1, 1,
0.03628522, 1.441151, -0.8401645, 1, 1, 1, 1, 1,
0.03803886, -0.1457332, 2.923989, 1, 1, 1, 1, 1,
0.04023048, -0.2411675, 2.645832, 0, 0, 1, 1, 1,
0.04116804, 0.2027919, -1.174584, 1, 0, 0, 1, 1,
0.0419994, 0.4155486, -0.7882221, 1, 0, 0, 1, 1,
0.04312073, 1.531481, -0.3339728, 1, 0, 0, 1, 1,
0.04520081, -0.8272835, 3.24091, 1, 0, 0, 1, 1,
0.04900716, 0.02419687, 0.4295102, 1, 0, 0, 1, 1,
0.05006247, -0.4074697, 4.375132, 0, 0, 0, 1, 1,
0.05452213, 1.768301, -0.5306173, 0, 0, 0, 1, 1,
0.05761347, 0.1139551, 0.6920635, 0, 0, 0, 1, 1,
0.06026446, 0.5734758, 0.7783338, 0, 0, 0, 1, 1,
0.06511921, 1.537101, -0.2980058, 0, 0, 0, 1, 1,
0.06616233, -0.3817928, 2.680883, 0, 0, 0, 1, 1,
0.08201329, -0.288623, 3.7273, 0, 0, 0, 1, 1,
0.08208224, -0.9329396, 4.069636, 1, 1, 1, 1, 1,
0.08369941, 1.921586, 1.674549, 1, 1, 1, 1, 1,
0.09092412, -0.5016489, 1.983278, 1, 1, 1, 1, 1,
0.0941457, 1.118199, -1.059404, 1, 1, 1, 1, 1,
0.09417918, -0.1159731, 2.318537, 1, 1, 1, 1, 1,
0.09469319, 0.8721646, -0.06917537, 1, 1, 1, 1, 1,
0.09787154, 0.332622, -0.7534382, 1, 1, 1, 1, 1,
0.09886956, -0.9066113, 2.864828, 1, 1, 1, 1, 1,
0.1001866, 0.7012072, 1.508091, 1, 1, 1, 1, 1,
0.1014795, 0.3687402, -0.2534278, 1, 1, 1, 1, 1,
0.1016867, 0.07128979, -0.5628437, 1, 1, 1, 1, 1,
0.1033799, -0.6957285, 2.696863, 1, 1, 1, 1, 1,
0.1091387, 1.288104, -0.1332182, 1, 1, 1, 1, 1,
0.115111, 0.6303419, 0.04784938, 1, 1, 1, 1, 1,
0.116706, -1.213311, 3.174539, 1, 1, 1, 1, 1,
0.1177101, -1.43256, 3.3428, 0, 0, 1, 1, 1,
0.1183373, 0.3987104, 0.60843, 1, 0, 0, 1, 1,
0.119535, -0.08147326, 2.222142, 1, 0, 0, 1, 1,
0.1212486, 0.6095267, -2.214105, 1, 0, 0, 1, 1,
0.123205, 0.05895887, 0.971779, 1, 0, 0, 1, 1,
0.1233295, 1.578993, 1.655779, 1, 0, 0, 1, 1,
0.1243061, 0.4975682, 0.01844155, 0, 0, 0, 1, 1,
0.1246657, 0.1002284, 1.655095, 0, 0, 0, 1, 1,
0.1271469, 0.1315611, -0.4227667, 0, 0, 0, 1, 1,
0.1339349, 0.6668791, -0.6274735, 0, 0, 0, 1, 1,
0.1371256, 0.1548879, -0.393446, 0, 0, 0, 1, 1,
0.1381209, 2.240284, -0.9550093, 0, 0, 0, 1, 1,
0.143668, -1.880477, 1.785473, 0, 0, 0, 1, 1,
0.1466044, -1.612871, 2.885248, 1, 1, 1, 1, 1,
0.1466592, -1.186019, 3.249543, 1, 1, 1, 1, 1,
0.1474788, 0.5235435, -0.686491, 1, 1, 1, 1, 1,
0.1475358, -0.5666903, 1.010699, 1, 1, 1, 1, 1,
0.1493616, -1.059298, 2.0961, 1, 1, 1, 1, 1,
0.156085, 0.3366605, 1.156333, 1, 1, 1, 1, 1,
0.1562478, -0.5993444, 3.425779, 1, 1, 1, 1, 1,
0.1579619, -0.4130468, 2.276247, 1, 1, 1, 1, 1,
0.1598476, 0.1486251, 1.447447, 1, 1, 1, 1, 1,
0.1610222, 0.5422001, 0.5548422, 1, 1, 1, 1, 1,
0.1659471, -0.4595797, 1.46102, 1, 1, 1, 1, 1,
0.1706568, 0.2074947, 0.1178541, 1, 1, 1, 1, 1,
0.1747489, 0.4394795, -0.5111774, 1, 1, 1, 1, 1,
0.1774422, 0.8092354, -1.468527, 1, 1, 1, 1, 1,
0.1778962, 1.038442, -0.223844, 1, 1, 1, 1, 1,
0.1818449, -0.5723991, 2.599525, 0, 0, 1, 1, 1,
0.1825374, -1.176116, 2.514515, 1, 0, 0, 1, 1,
0.1865197, 1.548426, 0.353647, 1, 0, 0, 1, 1,
0.1919683, -0.4304442, 3.176219, 1, 0, 0, 1, 1,
0.1932451, -1.473371, 3.077672, 1, 0, 0, 1, 1,
0.1940313, -0.3018003, 4.21927, 1, 0, 0, 1, 1,
0.1964662, -1.025855, 3.046646, 0, 0, 0, 1, 1,
0.1977975, 0.09460188, 2.477005, 0, 0, 0, 1, 1,
0.2043049, -0.02664923, 2.06519, 0, 0, 0, 1, 1,
0.2050629, -1.806996, 3.292984, 0, 0, 0, 1, 1,
0.2071352, -0.1564531, 2.934403, 0, 0, 0, 1, 1,
0.2075757, -0.8653204, 2.916605, 0, 0, 0, 1, 1,
0.2098268, -1.443423, 2.613901, 0, 0, 0, 1, 1,
0.2140337, 0.6490445, 0.313314, 1, 1, 1, 1, 1,
0.2140611, 2.255714, -0.008321443, 1, 1, 1, 1, 1,
0.216058, -0.3302288, 0.821756, 1, 1, 1, 1, 1,
0.2164039, 0.931316, 2.285984, 1, 1, 1, 1, 1,
0.2170975, 0.5613211, 2.447458, 1, 1, 1, 1, 1,
0.2177674, 1.614632, -0.06167267, 1, 1, 1, 1, 1,
0.2193139, 1.046696, 0.6867381, 1, 1, 1, 1, 1,
0.2198847, 1.021554, -0.5292647, 1, 1, 1, 1, 1,
0.2232284, 0.4801379, -0.1495203, 1, 1, 1, 1, 1,
0.2233788, -1.190306, 2.027889, 1, 1, 1, 1, 1,
0.2243602, -0.3231206, 3.655318, 1, 1, 1, 1, 1,
0.2293408, -0.4511224, 2.19668, 1, 1, 1, 1, 1,
0.2310885, 0.4459753, 1.179689, 1, 1, 1, 1, 1,
0.2324587, -1.686553, 2.910061, 1, 1, 1, 1, 1,
0.2328814, 0.4120133, 0.4945356, 1, 1, 1, 1, 1,
0.2334081, 0.3993902, -0.1610767, 0, 0, 1, 1, 1,
0.2374631, -0.5637785, 3.100752, 1, 0, 0, 1, 1,
0.2460555, 0.1221161, 1.580989, 1, 0, 0, 1, 1,
0.2465222, -0.0129811, 0.562694, 1, 0, 0, 1, 1,
0.257662, 1.236634, -0.5529033, 1, 0, 0, 1, 1,
0.2606271, -0.09877975, 0.6902933, 1, 0, 0, 1, 1,
0.2608398, -1.371768, 2.750582, 0, 0, 0, 1, 1,
0.261345, 0.2477765, 0.6090366, 0, 0, 0, 1, 1,
0.2641658, 0.1569319, 0.3940126, 0, 0, 0, 1, 1,
0.2642196, 0.9971834, 0.7637295, 0, 0, 0, 1, 1,
0.2697445, -0.3490879, 3.440673, 0, 0, 0, 1, 1,
0.273336, 0.6149687, 0.1880471, 0, 0, 0, 1, 1,
0.2743045, -0.1294185, 1.72597, 0, 0, 0, 1, 1,
0.2776497, 0.5319608, 0.997704, 1, 1, 1, 1, 1,
0.28031, 1.021811, -0.3662462, 1, 1, 1, 1, 1,
0.2817906, 1.129861, -0.2299663, 1, 1, 1, 1, 1,
0.281893, 0.5997419, 0.6842467, 1, 1, 1, 1, 1,
0.2869319, 0.7202275, -0.2244849, 1, 1, 1, 1, 1,
0.2899164, 0.3795048, 0.986706, 1, 1, 1, 1, 1,
0.2906142, 0.4239118, 0.164117, 1, 1, 1, 1, 1,
0.2919004, 0.6199035, 0.9038383, 1, 1, 1, 1, 1,
0.2958701, -0.9249981, 2.911007, 1, 1, 1, 1, 1,
0.3014836, 1.129195, 0.2058868, 1, 1, 1, 1, 1,
0.3037196, -0.03509859, 2.329979, 1, 1, 1, 1, 1,
0.3043979, 0.09575621, 2.644973, 1, 1, 1, 1, 1,
0.3052925, 1.062559, -0.8040106, 1, 1, 1, 1, 1,
0.3053055, 0.7050118, -0.5929974, 1, 1, 1, 1, 1,
0.3076504, 0.5035193, 0.6262113, 1, 1, 1, 1, 1,
0.3097526, -0.3748171, 4.581941, 0, 0, 1, 1, 1,
0.3117229, 1.497013, -0.7079836, 1, 0, 0, 1, 1,
0.3178983, 1.048086, -0.09154154, 1, 0, 0, 1, 1,
0.31885, 0.1629527, 1.490149, 1, 0, 0, 1, 1,
0.3199739, 1.064084, -0.04979271, 1, 0, 0, 1, 1,
0.3220863, -0.01522253, 2.999825, 1, 0, 0, 1, 1,
0.3230152, -0.8967059, 3.08832, 0, 0, 0, 1, 1,
0.3230989, -0.3948998, 3.406257, 0, 0, 0, 1, 1,
0.3264401, 0.3323116, 2.010597, 0, 0, 0, 1, 1,
0.3280201, -0.09453963, 3.882654, 0, 0, 0, 1, 1,
0.3298592, -0.2035492, 1.067787, 0, 0, 0, 1, 1,
0.3301858, 1.248133, -0.8438287, 0, 0, 0, 1, 1,
0.3380185, 0.473793, 0.8238641, 0, 0, 0, 1, 1,
0.3386599, -0.8650631, 4.202379, 1, 1, 1, 1, 1,
0.3408079, 0.8127908, 1.467548, 1, 1, 1, 1, 1,
0.3451133, -1.379646, 3.792786, 1, 1, 1, 1, 1,
0.3499856, -1.131419, 3.667814, 1, 1, 1, 1, 1,
0.352428, -0.2550124, 1.622861, 1, 1, 1, 1, 1,
0.3568325, -0.5175284, 2.516151, 1, 1, 1, 1, 1,
0.3612626, 0.517164, 2.553398, 1, 1, 1, 1, 1,
0.3737809, -0.2271921, 3.422822, 1, 1, 1, 1, 1,
0.3813865, 1.376528, 1.156058, 1, 1, 1, 1, 1,
0.383272, 0.1814893, 0.08128332, 1, 1, 1, 1, 1,
0.3845418, -0.1075982, 3.492772, 1, 1, 1, 1, 1,
0.3889585, -0.3109647, 2.204831, 1, 1, 1, 1, 1,
0.3940063, -1.271071, 2.474286, 1, 1, 1, 1, 1,
0.3998413, 0.4279396, -0.1043659, 1, 1, 1, 1, 1,
0.402481, -1.587652, 3.246444, 1, 1, 1, 1, 1,
0.4030735, -0.2820752, 1.336035, 0, 0, 1, 1, 1,
0.4037515, -0.3035569, 2.734517, 1, 0, 0, 1, 1,
0.404335, 0.4649915, 1.288196, 1, 0, 0, 1, 1,
0.404936, -1.422163, 2.596318, 1, 0, 0, 1, 1,
0.4061145, -2.357223, 1.880555, 1, 0, 0, 1, 1,
0.4070995, 0.5718403, -0.40935, 1, 0, 0, 1, 1,
0.4076734, 0.505906, 0.8701891, 0, 0, 0, 1, 1,
0.4082651, 0.3436503, 1.92753, 0, 0, 0, 1, 1,
0.4099599, -0.4996281, 2.331359, 0, 0, 0, 1, 1,
0.4122925, -0.07848179, 2.223459, 0, 0, 0, 1, 1,
0.4169805, -1.247167, 3.516596, 0, 0, 0, 1, 1,
0.4190217, -1.541148, 1.779785, 0, 0, 0, 1, 1,
0.4208243, -1.454396, 1.056177, 0, 0, 0, 1, 1,
0.4213334, 1.325225, 0.9228038, 1, 1, 1, 1, 1,
0.4224102, -0.5037802, 2.6501, 1, 1, 1, 1, 1,
0.4261652, -1.125452, 2.069649, 1, 1, 1, 1, 1,
0.4270088, 0.7016389, 0.002373811, 1, 1, 1, 1, 1,
0.4273462, -0.03093839, 2.269092, 1, 1, 1, 1, 1,
0.4384248, 2.63108, -0.2349551, 1, 1, 1, 1, 1,
0.4395201, 0.4763434, 0.7318024, 1, 1, 1, 1, 1,
0.4396212, -0.767736, 3.485945, 1, 1, 1, 1, 1,
0.448171, 0.8897808, 1.936894, 1, 1, 1, 1, 1,
0.4501435, -0.2432434, 1.64659, 1, 1, 1, 1, 1,
0.4525604, -0.3280953, 3.885873, 1, 1, 1, 1, 1,
0.4571655, 0.1479537, 1.225058, 1, 1, 1, 1, 1,
0.4573597, -1.726958, 0.931142, 1, 1, 1, 1, 1,
0.4593163, 0.003154184, 1.158774, 1, 1, 1, 1, 1,
0.4599035, 1.167643, -0.9068555, 1, 1, 1, 1, 1,
0.4603553, 1.253243, -0.7328666, 0, 0, 1, 1, 1,
0.4635162, 0.4299664, 0.3877758, 1, 0, 0, 1, 1,
0.4694678, -1.195451, 3.074123, 1, 0, 0, 1, 1,
0.4707299, -0.5318841, 2.949767, 1, 0, 0, 1, 1,
0.4716982, -1.091559, 2.727261, 1, 0, 0, 1, 1,
0.4742596, -0.2211014, 2.565166, 1, 0, 0, 1, 1,
0.4819692, -0.1375074, 2.806554, 0, 0, 0, 1, 1,
0.4821118, -1.211049, 3.727592, 0, 0, 0, 1, 1,
0.4935589, 0.3293601, 2.859935, 0, 0, 0, 1, 1,
0.4974083, -1.329796, 5.037375, 0, 0, 0, 1, 1,
0.4978505, -1.719869, 2.80953, 0, 0, 0, 1, 1,
0.4981346, 2.517997, 0.2604574, 0, 0, 0, 1, 1,
0.4998898, -0.74089, 1.869225, 0, 0, 0, 1, 1,
0.5008057, -0.109528, 0.9874105, 1, 1, 1, 1, 1,
0.5016504, -0.12158, 0.9017571, 1, 1, 1, 1, 1,
0.5029516, -1.041183, 4.006114, 1, 1, 1, 1, 1,
0.5050551, 1.520337, 1.343229, 1, 1, 1, 1, 1,
0.5069548, -0.1008402, 1.437526, 1, 1, 1, 1, 1,
0.507048, -0.9413258, 2.934859, 1, 1, 1, 1, 1,
0.5240799, 0.3961412, -1.244951, 1, 1, 1, 1, 1,
0.5250175, 0.1900608, 2.861933, 1, 1, 1, 1, 1,
0.5284404, 0.04042494, 2.41084, 1, 1, 1, 1, 1,
0.5329177, 2.207428, 0.5348729, 1, 1, 1, 1, 1,
0.5339913, -0.9299401, 1.095142, 1, 1, 1, 1, 1,
0.5344053, 0.3562772, 0.451734, 1, 1, 1, 1, 1,
0.5399203, -0.5259582, 2.244341, 1, 1, 1, 1, 1,
0.5419409, 0.1351355, 0.1761759, 1, 1, 1, 1, 1,
0.5503069, 1.11689, 1.156666, 1, 1, 1, 1, 1,
0.5529889, -1.75833, 2.957463, 0, 0, 1, 1, 1,
0.5571687, -0.8334195, 2.827962, 1, 0, 0, 1, 1,
0.5579212, 0.6741229, 1.827675, 1, 0, 0, 1, 1,
0.5593036, 0.7061443, 0.5101292, 1, 0, 0, 1, 1,
0.5602603, 1.25871, 1.183939, 1, 0, 0, 1, 1,
0.568472, -1.239208, 1.4361, 1, 0, 0, 1, 1,
0.5690638, -0.03299553, 1.100532, 0, 0, 0, 1, 1,
0.5695425, 0.7717252, -0.2282491, 0, 0, 0, 1, 1,
0.5702636, 2.575388, -1.535575, 0, 0, 0, 1, 1,
0.5761719, -0.1039079, 2.631348, 0, 0, 0, 1, 1,
0.5799209, 1.287199, -1.697622, 0, 0, 0, 1, 1,
0.5823607, 1.319457, 0.1046068, 0, 0, 0, 1, 1,
0.58288, 0.5855556, 0.7733122, 0, 0, 0, 1, 1,
0.5859091, -2.291001, 2.681042, 1, 1, 1, 1, 1,
0.5885388, 0.01262983, 1.993829, 1, 1, 1, 1, 1,
0.5895876, 0.1196473, 0.2248542, 1, 1, 1, 1, 1,
0.5913303, -0.1710652, -0.1951132, 1, 1, 1, 1, 1,
0.5923937, 0.3320976, 0.9316765, 1, 1, 1, 1, 1,
0.5967357, -1.165816, 2.095527, 1, 1, 1, 1, 1,
0.6032462, -0.7488467, 4.418703, 1, 1, 1, 1, 1,
0.6076902, 0.7083086, 0.434967, 1, 1, 1, 1, 1,
0.6176321, 0.08513626, 0.2385074, 1, 1, 1, 1, 1,
0.6190054, 0.5755033, 0.6248759, 1, 1, 1, 1, 1,
0.6264836, -1.586571, 3.164342, 1, 1, 1, 1, 1,
0.6355758, 0.6693602, -0.3806434, 1, 1, 1, 1, 1,
0.6372787, 0.2006065, 2.655363, 1, 1, 1, 1, 1,
0.6408318, -1.243702, 1.758987, 1, 1, 1, 1, 1,
0.6450843, -0.4095799, 1.884828, 1, 1, 1, 1, 1,
0.6479205, -0.3432128, 1.634431, 0, 0, 1, 1, 1,
0.648152, -0.3348098, 1.368082, 1, 0, 0, 1, 1,
0.6499258, 0.09000549, 0.4672703, 1, 0, 0, 1, 1,
0.6508537, 1.120103, -0.7245264, 1, 0, 0, 1, 1,
0.653074, -0.09819497, 0.8439927, 1, 0, 0, 1, 1,
0.6535069, -0.386173, 1.97072, 1, 0, 0, 1, 1,
0.6569308, -1.492465, 4.037883, 0, 0, 0, 1, 1,
0.6587312, -0.1416314, 2.326502, 0, 0, 0, 1, 1,
0.6615278, 0.1077515, 1.907509, 0, 0, 0, 1, 1,
0.663037, 1.431137, 0.8670806, 0, 0, 0, 1, 1,
0.6649317, -0.4035198, 0.286998, 0, 0, 0, 1, 1,
0.6700795, -1.536635, 1.908693, 0, 0, 0, 1, 1,
0.6710035, -1.626118, 3.954364, 0, 0, 0, 1, 1,
0.6724971, -0.9027648, 2.446058, 1, 1, 1, 1, 1,
0.6730425, 0.08910501, 2.079227, 1, 1, 1, 1, 1,
0.6746736, 1.207649, 2.429302, 1, 1, 1, 1, 1,
0.6754876, -0.1859423, 1.360344, 1, 1, 1, 1, 1,
0.6817754, 0.8659225, 1.468916, 1, 1, 1, 1, 1,
0.6820524, -0.1666506, 2.868309, 1, 1, 1, 1, 1,
0.6866574, -0.8258584, 2.640343, 1, 1, 1, 1, 1,
0.6946828, 0.09001133, 1.212487, 1, 1, 1, 1, 1,
0.6949151, 1.151545, 0.8974465, 1, 1, 1, 1, 1,
0.6972638, -1.735305, 3.163156, 1, 1, 1, 1, 1,
0.7008404, -0.6075409, 1.452132, 1, 1, 1, 1, 1,
0.7081826, 1.54296, 1.608895, 1, 1, 1, 1, 1,
0.7093189, -1.126246, 1.096931, 1, 1, 1, 1, 1,
0.7111329, 1.18165, -0.08275742, 1, 1, 1, 1, 1,
0.712719, -1.299394, 1.981336, 1, 1, 1, 1, 1,
0.721197, 0.04474065, 2.268198, 0, 0, 1, 1, 1,
0.7296437, 0.2915488, 0.1973318, 1, 0, 0, 1, 1,
0.7319471, -0.6958826, 1.947398, 1, 0, 0, 1, 1,
0.7327101, -0.511044, 2.561223, 1, 0, 0, 1, 1,
0.7363261, 0.346317, 1.94267, 1, 0, 0, 1, 1,
0.7499777, -1.785537, 2.568667, 1, 0, 0, 1, 1,
0.7532371, -1.094353, 3.813564, 0, 0, 0, 1, 1,
0.7534817, 0.6999532, -1.238867, 0, 0, 0, 1, 1,
0.7610185, 0.03920049, 0.663872, 0, 0, 0, 1, 1,
0.7618648, 0.3559916, 0.7138444, 0, 0, 0, 1, 1,
0.7669991, 0.1733633, 1.792331, 0, 0, 0, 1, 1,
0.7701332, 0.9312425, -1.049963, 0, 0, 0, 1, 1,
0.7710794, -0.9253123, 0.3706425, 0, 0, 0, 1, 1,
0.7713597, -0.9604083, 2.599805, 1, 1, 1, 1, 1,
0.773689, -1.207713, 3.303243, 1, 1, 1, 1, 1,
0.7767192, 0.6344748, 1.132947, 1, 1, 1, 1, 1,
0.7767442, 0.9683834, 0.2511501, 1, 1, 1, 1, 1,
0.7783034, -0.6061677, 1.783613, 1, 1, 1, 1, 1,
0.7791143, 0.3415308, 2.401717, 1, 1, 1, 1, 1,
0.7808878, -0.03194682, 0.753354, 1, 1, 1, 1, 1,
0.7835525, 0.4979359, 0.9415987, 1, 1, 1, 1, 1,
0.7841718, 0.00990929, 1.477242, 1, 1, 1, 1, 1,
0.7890844, -1.299358, 3.654903, 1, 1, 1, 1, 1,
0.789662, -1.557286, 2.63609, 1, 1, 1, 1, 1,
0.7900389, 0.7922848, 1.536758, 1, 1, 1, 1, 1,
0.7948425, -1.017947, 3.633047, 1, 1, 1, 1, 1,
0.7992556, -0.6539416, 2.083303, 1, 1, 1, 1, 1,
0.8023755, -0.4789609, 1.366007, 1, 1, 1, 1, 1,
0.8099135, -0.6288685, 2.332987, 0, 0, 1, 1, 1,
0.8099518, 1.820952, -0.3353858, 1, 0, 0, 1, 1,
0.8187739, 0.3081041, -0.4657854, 1, 0, 0, 1, 1,
0.8236774, 0.8509868, 0.4677261, 1, 0, 0, 1, 1,
0.8276045, 0.66249, 0.5143678, 1, 0, 0, 1, 1,
0.8277124, 0.4719551, 1.767879, 1, 0, 0, 1, 1,
0.8278169, -0.5165716, 2.500912, 0, 0, 0, 1, 1,
0.8305443, 1.410675, 1.026706, 0, 0, 0, 1, 1,
0.8306587, -0.6309184, 3.015229, 0, 0, 0, 1, 1,
0.8322825, -1.043481, 3.888053, 0, 0, 0, 1, 1,
0.844277, -1.80118, 0.253558, 0, 0, 0, 1, 1,
0.8568076, 0.4687548, 0.5728732, 0, 0, 0, 1, 1,
0.8577682, 0.2395187, 2.100372, 0, 0, 0, 1, 1,
0.8579361, 0.7485981, 0.7136049, 1, 1, 1, 1, 1,
0.8597411, -0.1760658, 2.390212, 1, 1, 1, 1, 1,
0.8617128, 1.370994, -0.4562862, 1, 1, 1, 1, 1,
0.8723899, 0.7038575, 1.766714, 1, 1, 1, 1, 1,
0.8799816, 0.4277278, 3.846824, 1, 1, 1, 1, 1,
0.8837753, -0.5706673, 3.402235, 1, 1, 1, 1, 1,
0.8851799, -0.8133262, 2.232979, 1, 1, 1, 1, 1,
0.8873508, -0.06118528, 1.32232, 1, 1, 1, 1, 1,
0.8908601, 0.911099, 0.1837469, 1, 1, 1, 1, 1,
0.8913761, -0.03841166, 0.2381561, 1, 1, 1, 1, 1,
0.897571, 0.3366906, 1.728533, 1, 1, 1, 1, 1,
0.9018104, -1.210824, 2.723529, 1, 1, 1, 1, 1,
0.909557, -2.649061, 2.864581, 1, 1, 1, 1, 1,
0.9167751, 0.6482348, 0.7161798, 1, 1, 1, 1, 1,
0.920535, 0.2503025, 3.876647, 1, 1, 1, 1, 1,
0.9243095, 0.4997221, 0.1575491, 0, 0, 1, 1, 1,
0.9321134, -1.173726, 3.316988, 1, 0, 0, 1, 1,
0.9380421, -0.1275453, 1.817273, 1, 0, 0, 1, 1,
0.9509175, -0.8115937, 2.324592, 1, 0, 0, 1, 1,
0.9526535, -0.6349835, 0.9401612, 1, 0, 0, 1, 1,
0.9561352, -0.9390371, 1.426211, 1, 0, 0, 1, 1,
0.9571649, 0.8383464, 1.309301, 0, 0, 0, 1, 1,
0.9586322, 0.1134924, 0.5361534, 0, 0, 0, 1, 1,
0.9602152, -0.4664306, 0.1236555, 0, 0, 0, 1, 1,
0.9627184, 0.9852363, -0.06454338, 0, 0, 0, 1, 1,
0.9642473, -0.3227681, 1.457632, 0, 0, 0, 1, 1,
0.9661701, -1.264028, 4.164781, 0, 0, 0, 1, 1,
0.9733765, 0.3199897, 2.331212, 0, 0, 0, 1, 1,
0.9854286, -1.536408, 2.832888, 1, 1, 1, 1, 1,
0.9875753, 0.8167841, -0.9506264, 1, 1, 1, 1, 1,
1.00329, -1.38028, 1.716937, 1, 1, 1, 1, 1,
1.009378, -0.4442258, 2.395939, 1, 1, 1, 1, 1,
1.012805, 0.6046068, 1.389006, 1, 1, 1, 1, 1,
1.020694, 1.790068, 1.214477, 1, 1, 1, 1, 1,
1.021182, 0.5905185, 1.413038, 1, 1, 1, 1, 1,
1.023459, 1.260929, 2.275371, 1, 1, 1, 1, 1,
1.024906, -1.356905, 3.748944, 1, 1, 1, 1, 1,
1.029723, -1.211255, 1.816936, 1, 1, 1, 1, 1,
1.038379, -0.6925921, 1.589583, 1, 1, 1, 1, 1,
1.045071, 1.688825, 0.5099451, 1, 1, 1, 1, 1,
1.045422, -0.1432929, 2.14276, 1, 1, 1, 1, 1,
1.046001, 0.8101512, -0.2234781, 1, 1, 1, 1, 1,
1.05514, -0.612595, 1.671854, 1, 1, 1, 1, 1,
1.058941, 1.179341, 1.802712, 0, 0, 1, 1, 1,
1.061134, 1.648, 3.236136, 1, 0, 0, 1, 1,
1.064093, 1.232123, 1.47965, 1, 0, 0, 1, 1,
1.067405, 0.6074738, -0.903922, 1, 0, 0, 1, 1,
1.068565, -1.344248, 2.989535, 1, 0, 0, 1, 1,
1.075296, 0.5479577, 0.6309545, 1, 0, 0, 1, 1,
1.087494, 1.451609, 0.3964306, 0, 0, 0, 1, 1,
1.089736, -1.109443, 2.929455, 0, 0, 0, 1, 1,
1.10269, 1.058182, 0.7245694, 0, 0, 0, 1, 1,
1.106405, -0.178635, 1.380733, 0, 0, 0, 1, 1,
1.113443, 0.04554388, 2.326719, 0, 0, 0, 1, 1,
1.119401, 0.2476159, 0.9643335, 0, 0, 0, 1, 1,
1.124808, 0.7920895, 0.6430194, 0, 0, 0, 1, 1,
1.129807, 0.6221256, 1.899887, 1, 1, 1, 1, 1,
1.13401, 0.8012748, 0.6605853, 1, 1, 1, 1, 1,
1.13699, -1.61038, 2.196791, 1, 1, 1, 1, 1,
1.154626, -0.9175401, 2.450141, 1, 1, 1, 1, 1,
1.158257, -0.7354515, 2.506739, 1, 1, 1, 1, 1,
1.161905, 0.06287736, 1.468516, 1, 1, 1, 1, 1,
1.164562, -0.08280386, 1.910785, 1, 1, 1, 1, 1,
1.181435, -1.153915, 3.634755, 1, 1, 1, 1, 1,
1.185267, 0.04002876, 1.598288, 1, 1, 1, 1, 1,
1.189743, 0.5577593, 0.584058, 1, 1, 1, 1, 1,
1.195006, -0.01595623, 2.940636, 1, 1, 1, 1, 1,
1.197023, 1.020834, 0.3536422, 1, 1, 1, 1, 1,
1.197312, -0.5466489, 0.4648804, 1, 1, 1, 1, 1,
1.203671, -0.9565749, 2.585316, 1, 1, 1, 1, 1,
1.206293, 0.683336, 2.628846, 1, 1, 1, 1, 1,
1.213962, 0.5016034, 1.118643, 0, 0, 1, 1, 1,
1.222808, 1.11643, 0.7402835, 1, 0, 0, 1, 1,
1.242972, -0.5569375, 1.139847, 1, 0, 0, 1, 1,
1.251302, -0.5917242, 2.654723, 1, 0, 0, 1, 1,
1.251499, 1.260601, -0.8029896, 1, 0, 0, 1, 1,
1.253686, 0.4657253, 1.517535, 1, 0, 0, 1, 1,
1.253894, 0.4994644, 0.1605071, 0, 0, 0, 1, 1,
1.259757, -0.9785451, 1.978024, 0, 0, 0, 1, 1,
1.261358, 1.487209, 0.8863832, 0, 0, 0, 1, 1,
1.267654, -0.1610422, 1.092319, 0, 0, 0, 1, 1,
1.270328, -0.1575203, 0.9097136, 0, 0, 0, 1, 1,
1.272082, 1.079135, -0.0006739972, 0, 0, 0, 1, 1,
1.274174, -2.062251, 2.387399, 0, 0, 0, 1, 1,
1.274353, -0.334697, 0.3786816, 1, 1, 1, 1, 1,
1.278685, 0.7507072, -0.1058084, 1, 1, 1, 1, 1,
1.283062, -1.255846, 3.180925, 1, 1, 1, 1, 1,
1.284501, 0.3423998, 2.185142, 1, 1, 1, 1, 1,
1.295963, -0.5170183, 2.28096, 1, 1, 1, 1, 1,
1.298923, 2.218669, -0.3485978, 1, 1, 1, 1, 1,
1.300607, -0.9205587, 3.041169, 1, 1, 1, 1, 1,
1.31267, -0.8551599, 1.392797, 1, 1, 1, 1, 1,
1.317594, -0.831443, 3.560798, 1, 1, 1, 1, 1,
1.320561, 0.03108156, 1.693046, 1, 1, 1, 1, 1,
1.3258, 1.336443, 1.24618, 1, 1, 1, 1, 1,
1.328945, 0.4129052, 1.918005, 1, 1, 1, 1, 1,
1.329571, -1.507663, 1.995687, 1, 1, 1, 1, 1,
1.333488, 0.986147, 1.48716, 1, 1, 1, 1, 1,
1.336067, 0.3521027, 2.435175, 1, 1, 1, 1, 1,
1.348915, 1.315062, -0.6085471, 0, 0, 1, 1, 1,
1.350393, 1.12452, 0.4443762, 1, 0, 0, 1, 1,
1.36262, -0.1695546, 0.4533506, 1, 0, 0, 1, 1,
1.368106, 0.3776637, 2.182882, 1, 0, 0, 1, 1,
1.371503, -1.461854, 1.43843, 1, 0, 0, 1, 1,
1.375335, 0.9898195, 2.337457, 1, 0, 0, 1, 1,
1.37763, -1.535621, 4.20213, 0, 0, 0, 1, 1,
1.38288, -1.658788, 4.975101, 0, 0, 0, 1, 1,
1.387647, -0.002052947, 0.2048547, 0, 0, 0, 1, 1,
1.390651, -0.38556, 1.31948, 0, 0, 0, 1, 1,
1.391957, -0.4666919, 1.297135, 0, 0, 0, 1, 1,
1.396604, 0.8828061, 1.741581, 0, 0, 0, 1, 1,
1.412514, 1.296438, 0.900744, 0, 0, 0, 1, 1,
1.412813, 1.373945, 0.1573506, 1, 1, 1, 1, 1,
1.41653, 2.437088, 2.227924, 1, 1, 1, 1, 1,
1.423953, 0.2488542, 1.556846, 1, 1, 1, 1, 1,
1.426788, -0.7640347, 1.417941, 1, 1, 1, 1, 1,
1.429263, -0.5726016, 0.4373639, 1, 1, 1, 1, 1,
1.436669, -0.7164059, 1.898118, 1, 1, 1, 1, 1,
1.438002, 1.69262, 3.773938, 1, 1, 1, 1, 1,
1.456715, -1.046857, 2.807401, 1, 1, 1, 1, 1,
1.459061, -0.2419922, 0.1521567, 1, 1, 1, 1, 1,
1.464387, 0.1724804, 1.801585, 1, 1, 1, 1, 1,
1.468358, -2.740256, 1.836664, 1, 1, 1, 1, 1,
1.48355, -1.346202, 3.453094, 1, 1, 1, 1, 1,
1.51586, 0.3272071, 0.6981855, 1, 1, 1, 1, 1,
1.522574, -0.9683093, 3.544938, 1, 1, 1, 1, 1,
1.541123, 0.8708827, 2.038067, 1, 1, 1, 1, 1,
1.551844, -0.06499099, 1.241547, 0, 0, 1, 1, 1,
1.556241, 0.5916818, 0.9234326, 1, 0, 0, 1, 1,
1.56164, 0.04938453, 2.83328, 1, 0, 0, 1, 1,
1.569769, -0.6651681, 2.446668, 1, 0, 0, 1, 1,
1.592868, 0.06459186, -0.272961, 1, 0, 0, 1, 1,
1.592941, -0.3985558, 2.177194, 1, 0, 0, 1, 1,
1.595475, 0.1480682, 2.672395, 0, 0, 0, 1, 1,
1.604769, 1.67276, -0.3314063, 0, 0, 0, 1, 1,
1.610396, 0.6382542, 1.344491, 0, 0, 0, 1, 1,
1.6156, 1.109082, 2.35426, 0, 0, 0, 1, 1,
1.623584, -2.45552, 4.557997, 0, 0, 0, 1, 1,
1.625942, 1.414034, 1.233116, 0, 0, 0, 1, 1,
1.627723, -0.05720811, 1.218295, 0, 0, 0, 1, 1,
1.649664, 1.830944, 0.2906139, 1, 1, 1, 1, 1,
1.651685, 0.6433323, 1.431609, 1, 1, 1, 1, 1,
1.663719, -0.5272071, 1.574942, 1, 1, 1, 1, 1,
1.68438, -0.1793386, 1.209243, 1, 1, 1, 1, 1,
1.710778, 0.131689, 1.001922, 1, 1, 1, 1, 1,
1.714866, 0.08308849, 1.37428, 1, 1, 1, 1, 1,
1.719755, -0.1270107, 0.6856084, 1, 1, 1, 1, 1,
1.740973, -1.452809, 2.104635, 1, 1, 1, 1, 1,
1.744454, 0.7090968, 3.003428, 1, 1, 1, 1, 1,
1.749918, 0.2509927, 0.7292675, 1, 1, 1, 1, 1,
1.754139, 1.637058, 0.3501404, 1, 1, 1, 1, 1,
1.796903, 0.9934059, 1.573193, 1, 1, 1, 1, 1,
1.81496, 0.1879255, -0.5366787, 1, 1, 1, 1, 1,
1.819963, 0.1752649, 2.300851, 1, 1, 1, 1, 1,
1.828942, -0.8386931, 2.341204, 1, 1, 1, 1, 1,
1.838384, -0.2395582, 2.360286, 0, 0, 1, 1, 1,
1.904912, -0.5961945, 2.203962, 1, 0, 0, 1, 1,
1.932726, 2.076745, -1.710768, 1, 0, 0, 1, 1,
1.940853, 0.1146277, 0.9825549, 1, 0, 0, 1, 1,
1.943075, 0.7410225, 1.665129, 1, 0, 0, 1, 1,
1.950638, -0.2512198, 1.456601, 1, 0, 0, 1, 1,
1.957059, -0.8910218, 0.7368817, 0, 0, 0, 1, 1,
1.96271, -0.9996362, 1.355253, 0, 0, 0, 1, 1,
2.011051, 1.024903, 1.469337, 0, 0, 0, 1, 1,
2.030165, -1.215776, 3.025423, 0, 0, 0, 1, 1,
2.031216, -0.6760826, 2.075975, 0, 0, 0, 1, 1,
2.045082, -0.01139603, -0.3303562, 0, 0, 0, 1, 1,
2.241696, 1.916194, 0.2471524, 0, 0, 0, 1, 1,
2.287153, -0.7610362, 0.6867976, 1, 1, 1, 1, 1,
2.405967, 0.8136126, 1.289666, 1, 1, 1, 1, 1,
2.626103, -1.154708, 1.719301, 1, 1, 1, 1, 1,
2.626298, 1.321158, 0.810357, 1, 1, 1, 1, 1,
2.674525, -1.824345, 1.105917, 1, 1, 1, 1, 1,
2.699861, -0.08044968, 1.49576, 1, 1, 1, 1, 1,
2.841048, -0.2541522, 1.623899, 1, 1, 1, 1, 1
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
var radius = 9.098706;
var distance = 31.95882;
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
mvMatrix.translate( 0.1377096, 0.05164313, -0.07609749 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.95882);
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
