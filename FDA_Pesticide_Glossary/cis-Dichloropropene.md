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
-3.633901, 0.7438715, -1.575477, 1, 0, 0, 1,
-3.420331, 0.571323, -1.931755, 1, 0.007843138, 0, 1,
-2.64697, 0.6546165, -1.186548, 1, 0.01176471, 0, 1,
-2.592862, 0.8625522, -0.4554575, 1, 0.01960784, 0, 1,
-2.491758, -2.030385, -3.166656, 1, 0.02352941, 0, 1,
-2.365285, 0.344724, -1.414158, 1, 0.03137255, 0, 1,
-2.321036, 0.1890144, -1.298527, 1, 0.03529412, 0, 1,
-2.312362, 0.03552066, -0.92731, 1, 0.04313726, 0, 1,
-2.311749, 0.04547014, -2.362185, 1, 0.04705882, 0, 1,
-2.251041, 0.8161522, -1.296269, 1, 0.05490196, 0, 1,
-2.249086, 0.8429245, -2.677266, 1, 0.05882353, 0, 1,
-2.238892, -0.8312636, -3.228153, 1, 0.06666667, 0, 1,
-2.17187, 0.4752334, -1.197427, 1, 0.07058824, 0, 1,
-2.146548, -1.800309, -2.264935, 1, 0.07843138, 0, 1,
-2.124434, -0.3946767, -3.14378, 1, 0.08235294, 0, 1,
-2.11532, -0.1537295, -2.280978, 1, 0.09019608, 0, 1,
-2.087604, -1.270698, -0.9680824, 1, 0.09411765, 0, 1,
-2.075933, -0.2191461, -0.4282041, 1, 0.1019608, 0, 1,
-2.066154, 1.684778, 0.6746652, 1, 0.1098039, 0, 1,
-2.055696, 2.499692, 0.6519832, 1, 0.1137255, 0, 1,
-2.050956, 0.5048323, -0.798352, 1, 0.1215686, 0, 1,
-2.044195, 0.2588318, -1.88817, 1, 0.1254902, 0, 1,
-2.016329, 1.303273, -1.326281, 1, 0.1333333, 0, 1,
-1.97217, 0.5466287, 0.3867687, 1, 0.1372549, 0, 1,
-1.95684, 0.2691586, -0.7626813, 1, 0.145098, 0, 1,
-1.95082, -1.869182, -1.692925, 1, 0.1490196, 0, 1,
-1.925648, -0.2462632, -2.652591, 1, 0.1568628, 0, 1,
-1.895607, 1.180227, -2.058045, 1, 0.1607843, 0, 1,
-1.877683, 0.7837373, -0.6059985, 1, 0.1686275, 0, 1,
-1.869172, -0.8491916, -1.734404, 1, 0.172549, 0, 1,
-1.8666, 0.8121682, -1.531505, 1, 0.1803922, 0, 1,
-1.850433, -0.1866934, -2.411395, 1, 0.1843137, 0, 1,
-1.84964, -0.1443312, -1.299008, 1, 0.1921569, 0, 1,
-1.819815, 0.1855469, -2.726062, 1, 0.1960784, 0, 1,
-1.816051, 1.429847, -1.572295, 1, 0.2039216, 0, 1,
-1.799828, -0.8081911, -0.6291103, 1, 0.2117647, 0, 1,
-1.798512, 0.6289453, -0.08864416, 1, 0.2156863, 0, 1,
-1.794987, 0.02800032, -0.5512707, 1, 0.2235294, 0, 1,
-1.770809, 0.04326496, -4.192961, 1, 0.227451, 0, 1,
-1.732536, 0.7506976, -1.173795, 1, 0.2352941, 0, 1,
-1.721095, -0.9295266, -0.6826931, 1, 0.2392157, 0, 1,
-1.709679, 1.298355, -0.3652962, 1, 0.2470588, 0, 1,
-1.693007, 0.3064072, -2.787002, 1, 0.2509804, 0, 1,
-1.666069, -0.4323989, -2.022187, 1, 0.2588235, 0, 1,
-1.645466, -0.4314134, -1.260496, 1, 0.2627451, 0, 1,
-1.634021, 0.9296867, -1.021342, 1, 0.2705882, 0, 1,
-1.614104, 0.2885543, 0.2631833, 1, 0.2745098, 0, 1,
-1.614088, 0.846898, 0.87831, 1, 0.282353, 0, 1,
-1.608909, -1.009327, -1.480819, 1, 0.2862745, 0, 1,
-1.605062, 0.4589351, -1.391124, 1, 0.2941177, 0, 1,
-1.545075, -1.05921, -3.165527, 1, 0.3019608, 0, 1,
-1.542649, 0.6436091, -0.266762, 1, 0.3058824, 0, 1,
-1.531207, -0.2817566, -0.5765767, 1, 0.3137255, 0, 1,
-1.517601, 1.156782, -1.294306, 1, 0.3176471, 0, 1,
-1.49843, -1.259511, -1.187994, 1, 0.3254902, 0, 1,
-1.492429, -0.0824735, -0.4935165, 1, 0.3294118, 0, 1,
-1.491511, -0.2140986, -1.774612, 1, 0.3372549, 0, 1,
-1.490967, 0.5280302, -3.184042, 1, 0.3411765, 0, 1,
-1.483375, 0.6521333, -0.7720919, 1, 0.3490196, 0, 1,
-1.483331, 0.7284756, -1.883451, 1, 0.3529412, 0, 1,
-1.479189, -0.3181943, 0.05387437, 1, 0.3607843, 0, 1,
-1.467743, 0.2621994, -1.608535, 1, 0.3647059, 0, 1,
-1.460383, -1.053467, -1.208819, 1, 0.372549, 0, 1,
-1.456026, 0.5759888, -1.214892, 1, 0.3764706, 0, 1,
-1.44431, 1.492217, -0.4020422, 1, 0.3843137, 0, 1,
-1.432702, -0.03457024, -2.316797, 1, 0.3882353, 0, 1,
-1.426192, -1.165853, -3.026119, 1, 0.3960784, 0, 1,
-1.415796, -0.254535, -0.9798088, 1, 0.4039216, 0, 1,
-1.409447, -1.194811, -1.744676, 1, 0.4078431, 0, 1,
-1.408831, 0.3777595, -1.579559, 1, 0.4156863, 0, 1,
-1.396255, 2.135924, -1.081693, 1, 0.4196078, 0, 1,
-1.396152, -0.4140066, -2.136083, 1, 0.427451, 0, 1,
-1.3932, -0.6476288, -2.633716, 1, 0.4313726, 0, 1,
-1.376186, -0.28401, -2.171806, 1, 0.4392157, 0, 1,
-1.374262, -0.03868744, -2.721233, 1, 0.4431373, 0, 1,
-1.373145, 0.532473, -1.710294, 1, 0.4509804, 0, 1,
-1.370086, 0.353626, -2.299036, 1, 0.454902, 0, 1,
-1.351848, 0.3797196, -0.2347183, 1, 0.4627451, 0, 1,
-1.34776, 0.3296825, -2.08642, 1, 0.4666667, 0, 1,
-1.347655, -1.258854, -2.507103, 1, 0.4745098, 0, 1,
-1.343024, -0.3029872, -2.035087, 1, 0.4784314, 0, 1,
-1.340391, -0.8658696, -0.875393, 1, 0.4862745, 0, 1,
-1.319729, -0.220171, -0.7653269, 1, 0.4901961, 0, 1,
-1.313004, -0.5661949, -1.231001, 1, 0.4980392, 0, 1,
-1.307865, -0.550145, -2.448863, 1, 0.5058824, 0, 1,
-1.305893, 1.565895, -2.224387, 1, 0.509804, 0, 1,
-1.297385, -1.325244, -2.427585, 1, 0.5176471, 0, 1,
-1.295473, 0.4218891, -2.304194, 1, 0.5215687, 0, 1,
-1.294845, -0.4169973, -3.571658, 1, 0.5294118, 0, 1,
-1.281331, -1.249508, -0.7277479, 1, 0.5333334, 0, 1,
-1.278027, 0.8700657, -1.989831, 1, 0.5411765, 0, 1,
-1.277328, 0.3731028, -2.459272, 1, 0.5450981, 0, 1,
-1.276623, 0.5299404, -0.8350278, 1, 0.5529412, 0, 1,
-1.275752, 0.1508985, -2.601902, 1, 0.5568628, 0, 1,
-1.271579, 0.3848601, 0.4297619, 1, 0.5647059, 0, 1,
-1.270116, 0.6613047, -1.874683, 1, 0.5686275, 0, 1,
-1.26956, 0.7046127, 0.8548263, 1, 0.5764706, 0, 1,
-1.263094, 1.366042, -1.507987, 1, 0.5803922, 0, 1,
-1.260208, 1.758197, 0.9496262, 1, 0.5882353, 0, 1,
-1.259449, -0.4171286, -1.957418, 1, 0.5921569, 0, 1,
-1.257694, -1.424088, -1.416955, 1, 0.6, 0, 1,
-1.249591, -0.1566449, -1.025635, 1, 0.6078432, 0, 1,
-1.243915, 0.5229778, -0.3889221, 1, 0.6117647, 0, 1,
-1.227721, -0.3068845, -3.395593, 1, 0.6196079, 0, 1,
-1.226926, -0.4385303, -1.595221, 1, 0.6235294, 0, 1,
-1.201776, -0.2966277, -2.1593, 1, 0.6313726, 0, 1,
-1.201384, 0.137976, -1.727058, 1, 0.6352941, 0, 1,
-1.200699, 0.5317261, -2.696828, 1, 0.6431373, 0, 1,
-1.195573, 0.9337382, -1.348128, 1, 0.6470588, 0, 1,
-1.194893, -0.2063855, -0.4015143, 1, 0.654902, 0, 1,
-1.192503, -1.151671, -3.884415, 1, 0.6588235, 0, 1,
-1.186543, -0.4287258, -1.267009, 1, 0.6666667, 0, 1,
-1.18508, -1.360121, -1.116443, 1, 0.6705883, 0, 1,
-1.173105, 0.92072, 0.5260363, 1, 0.6784314, 0, 1,
-1.159774, 2.16106, -1.488072, 1, 0.682353, 0, 1,
-1.155881, 0.7553368, -0.6143954, 1, 0.6901961, 0, 1,
-1.154687, 2.065024, -0.5240375, 1, 0.6941177, 0, 1,
-1.151327, 0.900548, -3.052595, 1, 0.7019608, 0, 1,
-1.149002, 0.1727145, -1.050629, 1, 0.7098039, 0, 1,
-1.142202, 0.3085412, -1.169613, 1, 0.7137255, 0, 1,
-1.142169, 0.2154067, 0.8270782, 1, 0.7215686, 0, 1,
-1.141455, 1.011679, 0.07511652, 1, 0.7254902, 0, 1,
-1.139274, 0.02331731, -1.020938, 1, 0.7333333, 0, 1,
-1.131846, 0.5267099, -0.5876445, 1, 0.7372549, 0, 1,
-1.130445, -0.5502656, -1.86954, 1, 0.7450981, 0, 1,
-1.120724, 0.7070007, -1.896401, 1, 0.7490196, 0, 1,
-1.119574, 1.482362, 0.5468209, 1, 0.7568628, 0, 1,
-1.118518, -0.8420523, -0.8043448, 1, 0.7607843, 0, 1,
-1.099828, -1.007831, -3.248531, 1, 0.7686275, 0, 1,
-1.099638, -0.3681524, -2.677006, 1, 0.772549, 0, 1,
-1.097549, -0.2226298, -1.166277, 1, 0.7803922, 0, 1,
-1.096442, 1.803832, -2.248593, 1, 0.7843137, 0, 1,
-1.094708, 1.014935, -2.177708, 1, 0.7921569, 0, 1,
-1.091625, 1.076923, -0.4571406, 1, 0.7960784, 0, 1,
-1.086786, 0.1195839, -1.780267, 1, 0.8039216, 0, 1,
-1.074532, -0.6301766, -3.584784, 1, 0.8117647, 0, 1,
-1.073183, -1.340985, -2.068551, 1, 0.8156863, 0, 1,
-1.070563, -0.2425388, -0.9262095, 1, 0.8235294, 0, 1,
-1.058391, -1.128789, -4.201613, 1, 0.827451, 0, 1,
-1.057208, -0.5765725, -3.829282, 1, 0.8352941, 0, 1,
-1.054803, 0.8904436, -0.05465163, 1, 0.8392157, 0, 1,
-1.047509, -1.10458, -2.842386, 1, 0.8470588, 0, 1,
-1.043833, -0.7808601, -2.605521, 1, 0.8509804, 0, 1,
-1.040317, 0.3448257, -0.36184, 1, 0.8588235, 0, 1,
-1.030773, 0.4252543, -0.3897716, 1, 0.8627451, 0, 1,
-1.024655, 0.8370153, -0.06061706, 1, 0.8705882, 0, 1,
-1.021832, 0.9509527, -2.41883, 1, 0.8745098, 0, 1,
-1.019709, -0.7881474, -2.329879, 1, 0.8823529, 0, 1,
-1.015848, 1.762257, -1.886012, 1, 0.8862745, 0, 1,
-1.014094, -1.298446, -0.7686766, 1, 0.8941177, 0, 1,
-1.013932, 0.5050379, -0.9651541, 1, 0.8980392, 0, 1,
-1.005528, 0.1649723, -1.73508, 1, 0.9058824, 0, 1,
-0.9803293, 0.1865975, -1.754324, 1, 0.9137255, 0, 1,
-0.9631404, -1.330581, -2.121621, 1, 0.9176471, 0, 1,
-0.9629645, -0.3146761, -3.019664, 1, 0.9254902, 0, 1,
-0.9577997, 1.470384, -1.034712, 1, 0.9294118, 0, 1,
-0.9555729, 0.5715356, -1.969516, 1, 0.9372549, 0, 1,
-0.9546596, 1.014112, -1.439343, 1, 0.9411765, 0, 1,
-0.9516248, -1.124645, -3.698114, 1, 0.9490196, 0, 1,
-0.9515663, -0.2579027, -3.492764, 1, 0.9529412, 0, 1,
-0.9466119, 0.9381591, -0.03771647, 1, 0.9607843, 0, 1,
-0.9387012, -0.354575, -1.739278, 1, 0.9647059, 0, 1,
-0.9344237, 0.5463157, 1.318221, 1, 0.972549, 0, 1,
-0.9320431, 0.4512404, -2.404737, 1, 0.9764706, 0, 1,
-0.9311443, -0.1106064, -1.377554, 1, 0.9843137, 0, 1,
-0.9288055, -0.0886225, -3.289918, 1, 0.9882353, 0, 1,
-0.9279276, -0.0378573, -2.274843, 1, 0.9960784, 0, 1,
-0.9275691, -0.8558327, -3.829406, 0.9960784, 1, 0, 1,
-0.9216097, -0.9364349, -1.483135, 0.9921569, 1, 0, 1,
-0.9210573, 0.3050971, -1.475415, 0.9843137, 1, 0, 1,
-0.9203129, -1.202418, -2.345978, 0.9803922, 1, 0, 1,
-0.911439, 0.2298364, -1.104884, 0.972549, 1, 0, 1,
-0.9111695, -1.077269, -3.106555, 0.9686275, 1, 0, 1,
-0.9079883, 0.0818096, -1.527986, 0.9607843, 1, 0, 1,
-0.9051682, -0.1567246, -2.794452, 0.9568627, 1, 0, 1,
-0.9051672, -1.165493, -1.834808, 0.9490196, 1, 0, 1,
-0.9045586, -0.4772398, -1.766214, 0.945098, 1, 0, 1,
-0.9037904, -1.816275, -2.057997, 0.9372549, 1, 0, 1,
-0.9033106, 2.09146, -1.017855, 0.9333333, 1, 0, 1,
-0.90236, 0.9429747, -1.561325, 0.9254902, 1, 0, 1,
-0.8998808, -0.5079073, -3.006034, 0.9215686, 1, 0, 1,
-0.8908001, 1.215863, -0.7799454, 0.9137255, 1, 0, 1,
-0.8818833, 1.638414, -0.06965537, 0.9098039, 1, 0, 1,
-0.8774332, 0.3344333, -1.21285, 0.9019608, 1, 0, 1,
-0.8747313, -0.1726569, -0.6287273, 0.8941177, 1, 0, 1,
-0.8741327, 0.01536703, -2.054236, 0.8901961, 1, 0, 1,
-0.8681103, 0.2603548, -1.229243, 0.8823529, 1, 0, 1,
-0.8585737, 0.3897289, -1.864867, 0.8784314, 1, 0, 1,
-0.8563352, 1.886621, 1.913544, 0.8705882, 1, 0, 1,
-0.8512556, 0.6546118, 0.2222517, 0.8666667, 1, 0, 1,
-0.8492938, 1.094294, -0.3633235, 0.8588235, 1, 0, 1,
-0.8482354, -1.20722, -3.474188, 0.854902, 1, 0, 1,
-0.8478826, -0.8569986, -0.8205006, 0.8470588, 1, 0, 1,
-0.8475643, 0.9557652, -0.9470544, 0.8431373, 1, 0, 1,
-0.8418496, -0.07307856, -1.165042, 0.8352941, 1, 0, 1,
-0.8396654, -0.8279574, -0.7198986, 0.8313726, 1, 0, 1,
-0.831363, -0.3001853, -3.140773, 0.8235294, 1, 0, 1,
-0.8300895, 0.8202359, 0.5997853, 0.8196079, 1, 0, 1,
-0.8280832, -0.2473802, -0.9545667, 0.8117647, 1, 0, 1,
-0.8227525, -0.3305632, -2.922107, 0.8078431, 1, 0, 1,
-0.8219388, 1.205463, -2.127763, 0.8, 1, 0, 1,
-0.8190975, -0.9032428, -0.4099288, 0.7921569, 1, 0, 1,
-0.8188911, -0.3423818, -0.7885517, 0.7882353, 1, 0, 1,
-0.8173655, 0.2780314, -3.638807, 0.7803922, 1, 0, 1,
-0.8162662, -1.377047, -1.734475, 0.7764706, 1, 0, 1,
-0.8083119, -0.5133966, -1.184976, 0.7686275, 1, 0, 1,
-0.8064058, 0.8033855, -2.008878, 0.7647059, 1, 0, 1,
-0.7981226, 1.584058, -2.240556, 0.7568628, 1, 0, 1,
-0.7958526, -0.1940555, -1.116243, 0.7529412, 1, 0, 1,
-0.7956864, 1.111374, 0.2302942, 0.7450981, 1, 0, 1,
-0.7953424, -0.9470911, -1.732333, 0.7411765, 1, 0, 1,
-0.7924783, -0.6263484, -0.4802856, 0.7333333, 1, 0, 1,
-0.7875182, -0.5014613, -0.2633667, 0.7294118, 1, 0, 1,
-0.7820395, 0.954728, -2.763873, 0.7215686, 1, 0, 1,
-0.7746764, -2.3263, -2.157954, 0.7176471, 1, 0, 1,
-0.7660117, 0.4433617, -2.307149, 0.7098039, 1, 0, 1,
-0.7608566, 0.4163503, -0.171562, 0.7058824, 1, 0, 1,
-0.7596173, -0.9942671, -4.272557, 0.6980392, 1, 0, 1,
-0.7572669, -0.7312007, -1.500342, 0.6901961, 1, 0, 1,
-0.751576, 0.6620126, -1.955398, 0.6862745, 1, 0, 1,
-0.7421479, 1.902749, -0.4919029, 0.6784314, 1, 0, 1,
-0.7403079, -0.08835396, -3.403766, 0.6745098, 1, 0, 1,
-0.7386203, 1.61506, -1.335631, 0.6666667, 1, 0, 1,
-0.7363854, -1.909664, -1.519841, 0.6627451, 1, 0, 1,
-0.7350776, 0.2311854, -1.571999, 0.654902, 1, 0, 1,
-0.7298902, -0.04815718, -1.3364, 0.6509804, 1, 0, 1,
-0.718958, 0.8127923, -0.07180011, 0.6431373, 1, 0, 1,
-0.7163488, -1.788725, -4.409225, 0.6392157, 1, 0, 1,
-0.7157735, -1.781341, -2.268832, 0.6313726, 1, 0, 1,
-0.7148648, -0.7249625, -1.124205, 0.627451, 1, 0, 1,
-0.711943, 0.5654976, -1.097167, 0.6196079, 1, 0, 1,
-0.7076154, 0.2971871, 0.3555628, 0.6156863, 1, 0, 1,
-0.7073961, 0.7475686, -0.6067102, 0.6078432, 1, 0, 1,
-0.7024333, -1.153954, -1.693997, 0.6039216, 1, 0, 1,
-0.6951225, 0.3751991, -0.7497194, 0.5960785, 1, 0, 1,
-0.6892164, -0.5771965, -2.507303, 0.5882353, 1, 0, 1,
-0.6853994, 1.085985, 0.5203552, 0.5843138, 1, 0, 1,
-0.677771, -0.4577328, -2.505621, 0.5764706, 1, 0, 1,
-0.6750286, 1.215496, 1.451043, 0.572549, 1, 0, 1,
-0.6740334, 0.8501572, -0.4161599, 0.5647059, 1, 0, 1,
-0.6734084, -1.041791, -3.855884, 0.5607843, 1, 0, 1,
-0.6666156, 0.3268585, -0.8523552, 0.5529412, 1, 0, 1,
-0.658466, -0.994347, -3.245282, 0.5490196, 1, 0, 1,
-0.6558095, -0.1360444, -2.453992, 0.5411765, 1, 0, 1,
-0.6555379, -0.8658916, -2.222501, 0.5372549, 1, 0, 1,
-0.6520575, -0.6124033, -2.794021, 0.5294118, 1, 0, 1,
-0.6415881, -0.3678903, -1.154896, 0.5254902, 1, 0, 1,
-0.6397417, -0.08987555, -1.923103, 0.5176471, 1, 0, 1,
-0.6369975, -0.5131201, -2.696434, 0.5137255, 1, 0, 1,
-0.6369375, 0.8131765, -1.622824, 0.5058824, 1, 0, 1,
-0.6358078, -0.7361966, -3.576221, 0.5019608, 1, 0, 1,
-0.6289951, -0.4244068, -2.322755, 0.4941176, 1, 0, 1,
-0.6204592, -0.3390856, -1.909165, 0.4862745, 1, 0, 1,
-0.6171352, -1.300299, -4.268055, 0.4823529, 1, 0, 1,
-0.6073285, 1.039891, -0.5704237, 0.4745098, 1, 0, 1,
-0.6036443, -0.2988153, -2.867177, 0.4705882, 1, 0, 1,
-0.6033742, 2.07587, 0.3194117, 0.4627451, 1, 0, 1,
-0.599825, -0.1164676, -2.055086, 0.4588235, 1, 0, 1,
-0.5992659, 1.182062, 0.7307807, 0.4509804, 1, 0, 1,
-0.599041, -2.112986, -2.013117, 0.4470588, 1, 0, 1,
-0.5987635, -0.4444902, -1.631959, 0.4392157, 1, 0, 1,
-0.598735, -0.212716, 0.1857417, 0.4352941, 1, 0, 1,
-0.5977216, 1.207871, -1.129503, 0.427451, 1, 0, 1,
-0.5973462, -0.745884, -1.636066, 0.4235294, 1, 0, 1,
-0.5941108, -0.3182282, -1.767, 0.4156863, 1, 0, 1,
-0.5892032, -0.08802643, -2.274585, 0.4117647, 1, 0, 1,
-0.587609, 0.3528887, -1.399438, 0.4039216, 1, 0, 1,
-0.5842644, -0.7157012, -1.856096, 0.3960784, 1, 0, 1,
-0.5840533, 1.390656, 0.2693744, 0.3921569, 1, 0, 1,
-0.583881, 1.076431, -1.218238, 0.3843137, 1, 0, 1,
-0.583203, -0.5520511, -1.805786, 0.3803922, 1, 0, 1,
-0.5819278, -0.01211933, -3.257399, 0.372549, 1, 0, 1,
-0.5751911, -0.09186401, -0.9756939, 0.3686275, 1, 0, 1,
-0.5737765, 0.4337966, -0.263144, 0.3607843, 1, 0, 1,
-0.571453, -0.8262254, -2.338323, 0.3568628, 1, 0, 1,
-0.5674444, 3.346471, -1.8255, 0.3490196, 1, 0, 1,
-0.5630174, 0.04580364, -0.2570803, 0.345098, 1, 0, 1,
-0.56227, -0.8706322, -3.262298, 0.3372549, 1, 0, 1,
-0.5581218, -0.6089868, -1.146763, 0.3333333, 1, 0, 1,
-0.5574308, 1.790301, -1.007057, 0.3254902, 1, 0, 1,
-0.5532259, -0.02207637, -2.703871, 0.3215686, 1, 0, 1,
-0.5508748, 1.65691, -1.207833, 0.3137255, 1, 0, 1,
-0.5488905, -0.6239803, -3.16102, 0.3098039, 1, 0, 1,
-0.5473489, -1.401996, -2.926316, 0.3019608, 1, 0, 1,
-0.5464959, -0.1144972, -2.130058, 0.2941177, 1, 0, 1,
-0.5455844, -1.332619, -2.551727, 0.2901961, 1, 0, 1,
-0.5444349, 2.395849, -0.2037942, 0.282353, 1, 0, 1,
-0.5431331, 1.571302, 0.8277838, 0.2784314, 1, 0, 1,
-0.5425717, -0.2295531, -1.277935, 0.2705882, 1, 0, 1,
-0.5415521, -0.8373671, -2.399938, 0.2666667, 1, 0, 1,
-0.539261, -1.081146, -2.386667, 0.2588235, 1, 0, 1,
-0.538833, -1.802962, -3.855417, 0.254902, 1, 0, 1,
-0.537798, 0.03591186, -1.592021, 0.2470588, 1, 0, 1,
-0.5357791, 0.6818196, -0.8348901, 0.2431373, 1, 0, 1,
-0.5319025, 0.2030324, -0.08497448, 0.2352941, 1, 0, 1,
-0.529517, -0.6926522, -2.550118, 0.2313726, 1, 0, 1,
-0.5282852, 0.5897842, -1.319039, 0.2235294, 1, 0, 1,
-0.5269546, 1.556286, -0.5231245, 0.2196078, 1, 0, 1,
-0.5263455, -1.044454, -0.150614, 0.2117647, 1, 0, 1,
-0.5241455, 0.1166714, -0.392197, 0.2078431, 1, 0, 1,
-0.5233731, -1.30642, -2.724726, 0.2, 1, 0, 1,
-0.5195232, -0.1930437, -1.915309, 0.1921569, 1, 0, 1,
-0.518769, -0.4717506, -1.876484, 0.1882353, 1, 0, 1,
-0.5181912, 0.8348594, 0.7514573, 0.1803922, 1, 0, 1,
-0.508553, 0.818743, 1.350484, 0.1764706, 1, 0, 1,
-0.5056087, -0.9278083, -4.252039, 0.1686275, 1, 0, 1,
-0.5049614, 1.316109, -0.03903029, 0.1647059, 1, 0, 1,
-0.5047957, 0.6685002, 0.9505135, 0.1568628, 1, 0, 1,
-0.4950442, 1.690682, 0.3922718, 0.1529412, 1, 0, 1,
-0.4932429, -0.4106769, -0.7929934, 0.145098, 1, 0, 1,
-0.4911135, 1.162757, 0.2492272, 0.1411765, 1, 0, 1,
-0.4903115, -0.1182688, -3.14163, 0.1333333, 1, 0, 1,
-0.4895362, -1.917072, -2.697117, 0.1294118, 1, 0, 1,
-0.4875645, 1.350815, -0.2617227, 0.1215686, 1, 0, 1,
-0.4830234, 0.522175, -0.8434502, 0.1176471, 1, 0, 1,
-0.4824054, -1.182138, -2.500405, 0.1098039, 1, 0, 1,
-0.4787596, -1.184351, -2.319086, 0.1058824, 1, 0, 1,
-0.4758036, -0.9898204, -1.726886, 0.09803922, 1, 0, 1,
-0.4750972, -0.2008009, -0.7293217, 0.09019608, 1, 0, 1,
-0.4750747, -0.3084422, -1.009089, 0.08627451, 1, 0, 1,
-0.4712133, 1.775771, 0.3006415, 0.07843138, 1, 0, 1,
-0.4711033, 0.8363419, -2.345715, 0.07450981, 1, 0, 1,
-0.460949, 0.6706326, -0.4993696, 0.06666667, 1, 0, 1,
-0.4606326, -1.102611, -2.015087, 0.0627451, 1, 0, 1,
-0.4592772, -0.2110486, -0.7775525, 0.05490196, 1, 0, 1,
-0.4555122, -0.3389496, -2.330295, 0.05098039, 1, 0, 1,
-0.4544927, 0.3223167, -0.3423326, 0.04313726, 1, 0, 1,
-0.4542705, 0.1117651, -2.699916, 0.03921569, 1, 0, 1,
-0.4532688, -1.942311, -3.288819, 0.03137255, 1, 0, 1,
-0.4525585, 1.85608, -0.02948149, 0.02745098, 1, 0, 1,
-0.4507173, -0.7822898, -1.704064, 0.01960784, 1, 0, 1,
-0.4482625, 0.5772912, 0.5760612, 0.01568628, 1, 0, 1,
-0.4467746, 0.06645838, -1.280116, 0.007843138, 1, 0, 1,
-0.4441461, -0.9131156, -2.412912, 0.003921569, 1, 0, 1,
-0.4439427, 0.855066, 0.3984834, 0, 1, 0.003921569, 1,
-0.4412628, -0.6259193, -3.20557, 0, 1, 0.01176471, 1,
-0.4359784, -0.2609092, -2.362897, 0, 1, 0.01568628, 1,
-0.4339208, 0.7395427, -2.594573, 0, 1, 0.02352941, 1,
-0.4250885, 0.3296825, -2.63774, 0, 1, 0.02745098, 1,
-0.423098, -1.48034, -4.097494, 0, 1, 0.03529412, 1,
-0.4165598, 1.846563, -1.089246, 0, 1, 0.03921569, 1,
-0.4161293, 0.1642721, -2.253947, 0, 1, 0.04705882, 1,
-0.415406, -1.398236, -3.449074, 0, 1, 0.05098039, 1,
-0.414454, -0.008892138, -2.93229, 0, 1, 0.05882353, 1,
-0.4116862, -1.586253, -2.170568, 0, 1, 0.0627451, 1,
-0.4110892, 0.3729673, -1.842588, 0, 1, 0.07058824, 1,
-0.4076464, 0.7326176, -1.924279, 0, 1, 0.07450981, 1,
-0.4052784, -0.4414896, -1.270957, 0, 1, 0.08235294, 1,
-0.4022487, -0.06365956, -0.6038325, 0, 1, 0.08627451, 1,
-0.4011351, -1.455175, -1.645522, 0, 1, 0.09411765, 1,
-0.3999263, -1.363046, -2.835601, 0, 1, 0.1019608, 1,
-0.3987515, -1.177656, -3.346519, 0, 1, 0.1058824, 1,
-0.3945474, 0.4794957, 0.3649168, 0, 1, 0.1137255, 1,
-0.3935341, -0.4961485, -2.690251, 0, 1, 0.1176471, 1,
-0.3934596, -1.118614, -4.433017, 0, 1, 0.1254902, 1,
-0.3878334, 0.903869, 0.3204218, 0, 1, 0.1294118, 1,
-0.386296, 0.7621849, -0.2975042, 0, 1, 0.1372549, 1,
-0.3790788, 0.1940372, -4.314034, 0, 1, 0.1411765, 1,
-0.3777953, -0.3534465, -2.885418, 0, 1, 0.1490196, 1,
-0.3695003, -0.4570302, -1.156308, 0, 1, 0.1529412, 1,
-0.3658772, 0.2302867, 1.492308, 0, 1, 0.1607843, 1,
-0.3642105, 0.07895324, -2.481031, 0, 1, 0.1647059, 1,
-0.3639051, -0.4166441, -4.899918, 0, 1, 0.172549, 1,
-0.3618559, -1.400626, -1.998323, 0, 1, 0.1764706, 1,
-0.3616521, 0.3150586, -1.87977, 0, 1, 0.1843137, 1,
-0.3606806, -0.4296303, -1.143753, 0, 1, 0.1882353, 1,
-0.3598982, -0.1320707, -1.373384, 0, 1, 0.1960784, 1,
-0.3590055, 1.267827, -1.245333, 0, 1, 0.2039216, 1,
-0.357749, -0.4302695, -1.153405, 0, 1, 0.2078431, 1,
-0.3560218, -0.6497038, -3.696037, 0, 1, 0.2156863, 1,
-0.3553343, -1.15993, -2.344846, 0, 1, 0.2196078, 1,
-0.3548026, -1.415842, -1.457224, 0, 1, 0.227451, 1,
-0.3535987, 0.1903937, -0.3976207, 0, 1, 0.2313726, 1,
-0.3527493, 0.5365045, -2.239395, 0, 1, 0.2392157, 1,
-0.3508391, -0.3653393, -2.058468, 0, 1, 0.2431373, 1,
-0.3499723, -1.363945, -2.875767, 0, 1, 0.2509804, 1,
-0.3496695, -0.4806722, -2.618841, 0, 1, 0.254902, 1,
-0.3491519, 0.6916913, -1.709787, 0, 1, 0.2627451, 1,
-0.3464642, -2.355222, -3.877222, 0, 1, 0.2666667, 1,
-0.3461187, 0.5704486, 0.3233187, 0, 1, 0.2745098, 1,
-0.3432158, -0.268986, -2.616853, 0, 1, 0.2784314, 1,
-0.3411901, 0.924673, -0.3076727, 0, 1, 0.2862745, 1,
-0.3407739, 1.077406, -0.7252467, 0, 1, 0.2901961, 1,
-0.3343599, 1.348052, -0.3839526, 0, 1, 0.2980392, 1,
-0.3341524, 0.6885219, -1.936237, 0, 1, 0.3058824, 1,
-0.331997, 0.104321, 0.1565532, 0, 1, 0.3098039, 1,
-0.3317094, -1.401674, -2.891972, 0, 1, 0.3176471, 1,
-0.3289973, 0.1103835, -1.941539, 0, 1, 0.3215686, 1,
-0.3264289, -1.16655, -4.823075, 0, 1, 0.3294118, 1,
-0.3243749, 0.5365598, -0.4638638, 0, 1, 0.3333333, 1,
-0.3236379, -0.2892414, -0.7155893, 0, 1, 0.3411765, 1,
-0.3235597, -0.5076741, -2.392354, 0, 1, 0.345098, 1,
-0.3172371, -0.1285129, -2.96081, 0, 1, 0.3529412, 1,
-0.3108321, -1.157095, -2.657521, 0, 1, 0.3568628, 1,
-0.3044391, -0.6231117, -1.746432, 0, 1, 0.3647059, 1,
-0.3027541, 0.183562, -0.9824775, 0, 1, 0.3686275, 1,
-0.3024326, 0.4897236, -1.407506, 0, 1, 0.3764706, 1,
-0.3017297, -0.3534129, -2.999943, 0, 1, 0.3803922, 1,
-0.2997375, 0.1664315, -0.2401144, 0, 1, 0.3882353, 1,
-0.2965339, 1.219278, -1.368222, 0, 1, 0.3921569, 1,
-0.2942818, 1.162369, -0.03488095, 0, 1, 0.4, 1,
-0.292949, -0.09453613, -1.889478, 0, 1, 0.4078431, 1,
-0.2913814, -0.0203063, -0.8067862, 0, 1, 0.4117647, 1,
-0.2852973, 0.4912308, 0.07759798, 0, 1, 0.4196078, 1,
-0.2843261, -2.773352, -1.349829, 0, 1, 0.4235294, 1,
-0.2827973, 0.8861092, -0.7179165, 0, 1, 0.4313726, 1,
-0.2806234, 0.04111905, -2.249721, 0, 1, 0.4352941, 1,
-0.2722491, -1.769767, -3.168412, 0, 1, 0.4431373, 1,
-0.2703869, -1.779819, -2.506044, 0, 1, 0.4470588, 1,
-0.2676347, -2.28604, -1.985284, 0, 1, 0.454902, 1,
-0.2675423, 0.7717307, -1.762378, 0, 1, 0.4588235, 1,
-0.2671295, -0.1636532, -2.50446, 0, 1, 0.4666667, 1,
-0.2670939, 0.6205384, -0.4681769, 0, 1, 0.4705882, 1,
-0.2669834, 0.558349, -1.158915, 0, 1, 0.4784314, 1,
-0.2669562, 1.043279, 0.1430125, 0, 1, 0.4823529, 1,
-0.2660884, 0.1896159, -2.727965, 0, 1, 0.4901961, 1,
-0.2657387, 1.321929, 1.35529, 0, 1, 0.4941176, 1,
-0.2602042, -2.139397, -3.182358, 0, 1, 0.5019608, 1,
-0.2586554, 0.4202579, -1.465314, 0, 1, 0.509804, 1,
-0.2567427, 0.7053583, -1.126658, 0, 1, 0.5137255, 1,
-0.2534357, -0.7217224, -3.808175, 0, 1, 0.5215687, 1,
-0.2492321, -1.909085, -0.4505244, 0, 1, 0.5254902, 1,
-0.2488247, 0.8800088, -0.3278141, 0, 1, 0.5333334, 1,
-0.2434307, 0.3765649, -2.729644, 0, 1, 0.5372549, 1,
-0.2401091, -0.1182041, -1.546289, 0, 1, 0.5450981, 1,
-0.2350576, -0.04564642, -1.842772, 0, 1, 0.5490196, 1,
-0.234372, 0.6342252, -0.2250879, 0, 1, 0.5568628, 1,
-0.2318877, 0.2872511, -2.04819, 0, 1, 0.5607843, 1,
-0.2317945, -0.6119753, -3.08809, 0, 1, 0.5686275, 1,
-0.231326, -0.74823, -1.21337, 0, 1, 0.572549, 1,
-0.2294325, 0.3412953, -1.541967, 0, 1, 0.5803922, 1,
-0.2285615, -1.016119, -4.343898, 0, 1, 0.5843138, 1,
-0.2276334, 0.1205547, -0.2374835, 0, 1, 0.5921569, 1,
-0.2257084, 1.861393, -0.6198372, 0, 1, 0.5960785, 1,
-0.2250569, 0.2794652, 0.6197135, 0, 1, 0.6039216, 1,
-0.2214584, 0.8260245, -0.6806613, 0, 1, 0.6117647, 1,
-0.2179015, -0.01079558, -0.892117, 0, 1, 0.6156863, 1,
-0.2176938, -0.3198198, -3.224387, 0, 1, 0.6235294, 1,
-0.215568, -0.9047927, -1.102684, 0, 1, 0.627451, 1,
-0.2138437, 1.319283, 2.090388, 0, 1, 0.6352941, 1,
-0.2108188, 0.1427027, 0.3132735, 0, 1, 0.6392157, 1,
-0.2045169, -0.7330159, -2.649397, 0, 1, 0.6470588, 1,
-0.1957032, -0.6915838, -4.484587, 0, 1, 0.6509804, 1,
-0.1956658, 0.6248139, -1.245173, 0, 1, 0.6588235, 1,
-0.1941628, 0.6860775, 0.07376398, 0, 1, 0.6627451, 1,
-0.1893055, -0.3446535, -3.073124, 0, 1, 0.6705883, 1,
-0.1872669, -1.38582, -3.851778, 0, 1, 0.6745098, 1,
-0.1851221, -1.577736, -4.54532, 0, 1, 0.682353, 1,
-0.1826974, -1.657713, -2.946927, 0, 1, 0.6862745, 1,
-0.1808203, -1.279471, -1.141759, 0, 1, 0.6941177, 1,
-0.1705357, 2.557872, 0.8118108, 0, 1, 0.7019608, 1,
-0.1691623, 1.643925, 0.3651085, 0, 1, 0.7058824, 1,
-0.1672138, -1.453361, -3.737811, 0, 1, 0.7137255, 1,
-0.1668473, -1.053993, -1.003181, 0, 1, 0.7176471, 1,
-0.1602985, 0.5732206, 1.26016, 0, 1, 0.7254902, 1,
-0.1598836, -0.5520304, -2.641962, 0, 1, 0.7294118, 1,
-0.1594041, -1.351646, -1.80395, 0, 1, 0.7372549, 1,
-0.1587688, 1.389525, 1.119682, 0, 1, 0.7411765, 1,
-0.1566143, -0.8201559, -1.716032, 0, 1, 0.7490196, 1,
-0.1523024, -0.4847853, -2.907342, 0, 1, 0.7529412, 1,
-0.1516914, -0.3886235, -3.596205, 0, 1, 0.7607843, 1,
-0.1495517, -1.205823, -1.496123, 0, 1, 0.7647059, 1,
-0.1456174, 1.83407, 0.1559418, 0, 1, 0.772549, 1,
-0.1438713, 0.001353851, -0.3791861, 0, 1, 0.7764706, 1,
-0.1435541, 1.047983, -1.120093, 0, 1, 0.7843137, 1,
-0.1381394, 1.448259, -0.04930765, 0, 1, 0.7882353, 1,
-0.1309737, -0.9555722, -4.472356, 0, 1, 0.7960784, 1,
-0.1303585, -0.2644393, -1.21009, 0, 1, 0.8039216, 1,
-0.1276766, 0.4123469, 0.1413704, 0, 1, 0.8078431, 1,
-0.127665, 0.1073708, 1.40079, 0, 1, 0.8156863, 1,
-0.1275014, -0.9388731, -4.505752, 0, 1, 0.8196079, 1,
-0.1261054, -0.04414426, 0.4916078, 0, 1, 0.827451, 1,
-0.1208614, 1.037566, -1.76883, 0, 1, 0.8313726, 1,
-0.1200334, -0.3514086, -1.697876, 0, 1, 0.8392157, 1,
-0.1192759, -0.8753875, -3.359197, 0, 1, 0.8431373, 1,
-0.1157467, -0.5733013, -0.8699377, 0, 1, 0.8509804, 1,
-0.1152879, 0.2826119, -1.726795, 0, 1, 0.854902, 1,
-0.1139173, 0.9139428, -0.8504972, 0, 1, 0.8627451, 1,
-0.1107641, 1.045799, -0.002650678, 0, 1, 0.8666667, 1,
-0.1086186, -0.4664901, -1.771384, 0, 1, 0.8745098, 1,
-0.1049007, 0.2765252, -0.7461894, 0, 1, 0.8784314, 1,
-0.103861, -3.19448, -2.677938, 0, 1, 0.8862745, 1,
-0.1025109, -0.8135063, -4.690656, 0, 1, 0.8901961, 1,
-0.1011233, 0.3915192, 0.5682513, 0, 1, 0.8980392, 1,
-0.09475688, 0.2136728, -0.7998053, 0, 1, 0.9058824, 1,
-0.09361016, -0.3588448, -2.580121, 0, 1, 0.9098039, 1,
-0.09202157, -0.3643743, -2.538695, 0, 1, 0.9176471, 1,
-0.09013245, 0.2037521, 0.6171445, 0, 1, 0.9215686, 1,
-0.08299485, 0.2262592, -1.152098, 0, 1, 0.9294118, 1,
-0.08217271, 0.3208393, -0.9191312, 0, 1, 0.9333333, 1,
-0.08049462, 0.04452649, -1.262793, 0, 1, 0.9411765, 1,
-0.0770438, 0.4641455, 1.216684, 0, 1, 0.945098, 1,
-0.07700202, -0.4231113, -1.275742, 0, 1, 0.9529412, 1,
-0.07521126, -0.744429, -1.785248, 0, 1, 0.9568627, 1,
-0.07021872, -0.3248391, -4.073668, 0, 1, 0.9647059, 1,
-0.07021688, -0.3059217, -3.470294, 0, 1, 0.9686275, 1,
-0.07018133, 1.853306, 0.01873606, 0, 1, 0.9764706, 1,
-0.06747817, 1.064659, -0.5609775, 0, 1, 0.9803922, 1,
-0.06687958, -0.6143309, -4.849315, 0, 1, 0.9882353, 1,
-0.06537887, -0.001293035, -3.203321, 0, 1, 0.9921569, 1,
-0.0653055, 0.6141424, 2.016012, 0, 1, 1, 1,
-0.06375412, -0.3681892, -4.643644, 0, 0.9921569, 1, 1,
-0.05687665, -0.5654785, -3.71735, 0, 0.9882353, 1, 1,
-0.05403172, 0.9976577, 0.9448276, 0, 0.9803922, 1, 1,
-0.05217953, -0.5031466, -4.561158, 0, 0.9764706, 1, 1,
-0.05147212, -0.664375, -2.408552, 0, 0.9686275, 1, 1,
-0.04332086, -0.3122874, -3.522961, 0, 0.9647059, 1, 1,
-0.04317616, -0.7330167, -2.73825, 0, 0.9568627, 1, 1,
-0.040459, -0.5186701, -3.592459, 0, 0.9529412, 1, 1,
-0.03824874, -1.776965, -2.096195, 0, 0.945098, 1, 1,
-0.03716923, -0.09219385, -2.180179, 0, 0.9411765, 1, 1,
-0.03646474, -0.1777939, -1.218835, 0, 0.9333333, 1, 1,
-0.03171811, -1.824249, -2.307171, 0, 0.9294118, 1, 1,
-0.02512432, 0.7525476, -0.5283826, 0, 0.9215686, 1, 1,
-0.01931882, -1.74852, -2.315475, 0, 0.9176471, 1, 1,
-0.01725811, 0.5611672, -0.1720076, 0, 0.9098039, 1, 1,
-0.01230967, -0.1819194, -3.014219, 0, 0.9058824, 1, 1,
-0.009790699, -1.09678, -2.89338, 0, 0.8980392, 1, 1,
-0.00207264, -0.5671092, -3.27362, 0, 0.8901961, 1, 1,
0.001607942, 1.514202, 0.9641773, 0, 0.8862745, 1, 1,
0.003935244, -0.4045516, 2.363297, 0, 0.8784314, 1, 1,
0.01093246, 0.2570903, 1.744041, 0, 0.8745098, 1, 1,
0.01167784, -1.503544, 2.647691, 0, 0.8666667, 1, 1,
0.01433535, -2.781221, 3.682359, 0, 0.8627451, 1, 1,
0.01706485, -1.786175, 2.460085, 0, 0.854902, 1, 1,
0.01731218, 2.716591, 0.06531572, 0, 0.8509804, 1, 1,
0.01836496, 1.265539, 0.09291594, 0, 0.8431373, 1, 1,
0.0225854, 0.5906461, -0.676816, 0, 0.8392157, 1, 1,
0.02425611, -1.062793, 2.770747, 0, 0.8313726, 1, 1,
0.02628755, 1.100747, 1.973495, 0, 0.827451, 1, 1,
0.02642787, -2.221535, 1.998376, 0, 0.8196079, 1, 1,
0.02820251, 0.4096493, -2.019018, 0, 0.8156863, 1, 1,
0.03313607, -1.213731, 2.361319, 0, 0.8078431, 1, 1,
0.03463389, 0.02768363, 0.00120361, 0, 0.8039216, 1, 1,
0.03471771, 0.2496488, 0.8855169, 0, 0.7960784, 1, 1,
0.03662487, -1.414871, 3.694539, 0, 0.7882353, 1, 1,
0.03792803, -0.5070297, 3.266005, 0, 0.7843137, 1, 1,
0.0443534, 1.426645, 0.6416473, 0, 0.7764706, 1, 1,
0.04603646, -0.4466032, 2.625034, 0, 0.772549, 1, 1,
0.04690517, 0.08302891, 0.02436155, 0, 0.7647059, 1, 1,
0.04743405, 0.901315, -1.020406, 0, 0.7607843, 1, 1,
0.05099475, 0.1433017, 1.718299, 0, 0.7529412, 1, 1,
0.05894997, -0.5417818, 2.947984, 0, 0.7490196, 1, 1,
0.0618838, -1.162586, 3.075953, 0, 0.7411765, 1, 1,
0.06322698, -1.019413, 4.199445, 0, 0.7372549, 1, 1,
0.06477104, -0.4697099, 4.433028, 0, 0.7294118, 1, 1,
0.06657373, 0.5264395, 0.7431269, 0, 0.7254902, 1, 1,
0.06912652, 0.1911788, -1.086735, 0, 0.7176471, 1, 1,
0.0697978, -0.1234419, 0.5751061, 0, 0.7137255, 1, 1,
0.07044608, 0.04112918, 2.324942, 0, 0.7058824, 1, 1,
0.07077467, -0.2012103, 3.974242, 0, 0.6980392, 1, 1,
0.07244129, -0.2962965, 1.274037, 0, 0.6941177, 1, 1,
0.07438134, -0.3840462, 3.738456, 0, 0.6862745, 1, 1,
0.07486329, -0.490991, 3.11096, 0, 0.682353, 1, 1,
0.07492051, 0.7302381, 0.535215, 0, 0.6745098, 1, 1,
0.07603672, -0.04682206, 3.526651, 0, 0.6705883, 1, 1,
0.07637759, -0.7857453, 3.655132, 0, 0.6627451, 1, 1,
0.07678409, -0.823194, 3.799937, 0, 0.6588235, 1, 1,
0.07913134, -0.5981317, 3.561198, 0, 0.6509804, 1, 1,
0.08627409, 0.196086, -0.1177582, 0, 0.6470588, 1, 1,
0.09063086, -1.66254, 2.516296, 0, 0.6392157, 1, 1,
0.09242381, 0.3281707, -0.8473746, 0, 0.6352941, 1, 1,
0.09363367, 1.645449, 1.488294, 0, 0.627451, 1, 1,
0.0974328, 0.7457353, -0.6287514, 0, 0.6235294, 1, 1,
0.1017031, -0.6949331, 3.816671, 0, 0.6156863, 1, 1,
0.1025481, -0.5162493, 3.583505, 0, 0.6117647, 1, 1,
0.1074195, -0.08894711, 2.261438, 0, 0.6039216, 1, 1,
0.1174351, 0.1344954, -1.326645, 0, 0.5960785, 1, 1,
0.1188563, 0.8194555, -0.4650637, 0, 0.5921569, 1, 1,
0.1193098, -0.3313458, 1.054939, 0, 0.5843138, 1, 1,
0.1234117, -0.2968956, 3.866493, 0, 0.5803922, 1, 1,
0.1238488, 0.4697551, -0.02459313, 0, 0.572549, 1, 1,
0.1277041, 0.1180662, 0.07829866, 0, 0.5686275, 1, 1,
0.133031, 0.7291447, 0.1455462, 0, 0.5607843, 1, 1,
0.1342108, -0.6769087, 3.428909, 0, 0.5568628, 1, 1,
0.1346157, -0.3665596, 1.974605, 0, 0.5490196, 1, 1,
0.1348742, -0.6682191, 1.769877, 0, 0.5450981, 1, 1,
0.1411794, 1.306712, 0.7335825, 0, 0.5372549, 1, 1,
0.1421178, -2.41282, 1.084028, 0, 0.5333334, 1, 1,
0.1444819, -1.327767, 2.483358, 0, 0.5254902, 1, 1,
0.1460602, -0.2191007, 3.085075, 0, 0.5215687, 1, 1,
0.1543989, -0.1518392, 3.271255, 0, 0.5137255, 1, 1,
0.1556801, 0.1909692, -0.4097764, 0, 0.509804, 1, 1,
0.1597536, -2.273638, 3.495033, 0, 0.5019608, 1, 1,
0.1652067, -1.007911, 2.099825, 0, 0.4941176, 1, 1,
0.1658049, -1.043489, 1.83488, 0, 0.4901961, 1, 1,
0.1675293, 0.6814701, 0.1740293, 0, 0.4823529, 1, 1,
0.1708997, 0.3498714, 1.015487, 0, 0.4784314, 1, 1,
0.1740746, -0.4087465, 3.311363, 0, 0.4705882, 1, 1,
0.1802747, -0.52309, 2.38904, 0, 0.4666667, 1, 1,
0.1860968, -0.4187476, 2.925817, 0, 0.4588235, 1, 1,
0.1862596, -2.047701, 1.983431, 0, 0.454902, 1, 1,
0.1895083, -0.5607851, 3.443009, 0, 0.4470588, 1, 1,
0.1917598, 0.1106564, 0.7451459, 0, 0.4431373, 1, 1,
0.1921219, -0.4520001, 4.532631, 0, 0.4352941, 1, 1,
0.1959049, -0.7317932, 2.02768, 0, 0.4313726, 1, 1,
0.1974441, -0.9924862, 4.020146, 0, 0.4235294, 1, 1,
0.1976928, 0.3503259, 1.528618, 0, 0.4196078, 1, 1,
0.1993397, -1.468378, 3.041707, 0, 0.4117647, 1, 1,
0.2033975, -0.8450913, 2.546238, 0, 0.4078431, 1, 1,
0.2132194, 0.864516, -1.829519, 0, 0.4, 1, 1,
0.2186186, 0.8138081, 0.9922431, 0, 0.3921569, 1, 1,
0.2241167, -1.07633, 2.20366, 0, 0.3882353, 1, 1,
0.2270504, -1.046845, 3.860455, 0, 0.3803922, 1, 1,
0.2275568, 0.378952, 2.027517, 0, 0.3764706, 1, 1,
0.2319024, 0.08886499, 1.500445, 0, 0.3686275, 1, 1,
0.2370824, 1.72046, -0.2032073, 0, 0.3647059, 1, 1,
0.2552369, -0.3408895, 3.476795, 0, 0.3568628, 1, 1,
0.2596805, -0.8864491, 4.762006, 0, 0.3529412, 1, 1,
0.2600153, 1.530699, -0.142843, 0, 0.345098, 1, 1,
0.2605089, 0.9736363, 1.148471, 0, 0.3411765, 1, 1,
0.2651995, -0.6682167, 2.290673, 0, 0.3333333, 1, 1,
0.2671588, -1.830757, 2.349496, 0, 0.3294118, 1, 1,
0.2671734, -0.2166429, 4.25048, 0, 0.3215686, 1, 1,
0.2709749, 0.8514726, 0.6223435, 0, 0.3176471, 1, 1,
0.2743748, -0.3195067, 2.267049, 0, 0.3098039, 1, 1,
0.2749316, 0.8991348, 0.1815179, 0, 0.3058824, 1, 1,
0.276113, 1.167128, 1.01795, 0, 0.2980392, 1, 1,
0.2777234, 0.922466, 0.8473418, 0, 0.2901961, 1, 1,
0.2800092, -0.4564102, 2.77168, 0, 0.2862745, 1, 1,
0.286762, 1.70024, 1.109105, 0, 0.2784314, 1, 1,
0.2932588, -0.1321399, 3.283952, 0, 0.2745098, 1, 1,
0.2950175, 0.5122656, 1.317938, 0, 0.2666667, 1, 1,
0.2965486, -0.8856047, 1.943498, 0, 0.2627451, 1, 1,
0.3018905, 1.423422, -0.1281101, 0, 0.254902, 1, 1,
0.3034327, 0.8257336, 0.4827705, 0, 0.2509804, 1, 1,
0.3070213, -1.73842, 2.721493, 0, 0.2431373, 1, 1,
0.3071837, 0.1336036, 1.613169, 0, 0.2392157, 1, 1,
0.3139461, -0.3344094, 2.201829, 0, 0.2313726, 1, 1,
0.321114, 0.4806849, 0.8216589, 0, 0.227451, 1, 1,
0.3275824, -0.2637826, 0.3254251, 0, 0.2196078, 1, 1,
0.3293632, -0.1107016, 2.349297, 0, 0.2156863, 1, 1,
0.3322622, -1.833257, 4.315564, 0, 0.2078431, 1, 1,
0.3323786, -1.124648, 3.678454, 0, 0.2039216, 1, 1,
0.3348698, 0.9327661, 1.351647, 0, 0.1960784, 1, 1,
0.3455101, 1.258331, 1.560013, 0, 0.1882353, 1, 1,
0.3567483, -0.3250586, 2.129296, 0, 0.1843137, 1, 1,
0.3589675, 1.196951, -1.29654, 0, 0.1764706, 1, 1,
0.3625516, 0.7711094, -0.6504449, 0, 0.172549, 1, 1,
0.3646083, -1.463722, 1.959794, 0, 0.1647059, 1, 1,
0.3710485, -1.059376, 3.548736, 0, 0.1607843, 1, 1,
0.3716938, 0.4168633, 1.589032, 0, 0.1529412, 1, 1,
0.3752097, 0.6255814, 0.3717396, 0, 0.1490196, 1, 1,
0.3760642, 1.251566, -0.5525155, 0, 0.1411765, 1, 1,
0.3784694, -0.7329882, 4.103439, 0, 0.1372549, 1, 1,
0.3813215, -1.257951, 2.127398, 0, 0.1294118, 1, 1,
0.381543, -1.824472, 4.667733, 0, 0.1254902, 1, 1,
0.3869157, -0.2226365, 1.593296, 0, 0.1176471, 1, 1,
0.3900866, -0.9308855, 3.294152, 0, 0.1137255, 1, 1,
0.3929318, -1.45813, 3.149593, 0, 0.1058824, 1, 1,
0.3944875, 0.860133, 1.066498, 0, 0.09803922, 1, 1,
0.3967111, -0.6907286, 1.949018, 0, 0.09411765, 1, 1,
0.3975484, -0.1279221, 1.831215, 0, 0.08627451, 1, 1,
0.4018712, -0.3260656, 3.225714, 0, 0.08235294, 1, 1,
0.4030063, -0.4699165, 2.266994, 0, 0.07450981, 1, 1,
0.4032255, -0.321707, 2.017769, 0, 0.07058824, 1, 1,
0.4080314, -0.4252932, 2.705961, 0, 0.0627451, 1, 1,
0.4084306, 1.209895, 0.03382517, 0, 0.05882353, 1, 1,
0.409003, -1.382977, 3.644565, 0, 0.05098039, 1, 1,
0.418992, 0.5124205, 2.840814, 0, 0.04705882, 1, 1,
0.4208044, 0.9409288, -0.8681877, 0, 0.03921569, 1, 1,
0.4255925, 0.4908703, 1.981017, 0, 0.03529412, 1, 1,
0.4262478, -0.1439706, 2.519616, 0, 0.02745098, 1, 1,
0.4312918, -0.2657191, 2.787044, 0, 0.02352941, 1, 1,
0.4343347, -1.610854, 2.676773, 0, 0.01568628, 1, 1,
0.4344043, 0.5940834, -0.1833811, 0, 0.01176471, 1, 1,
0.4347729, -0.2423891, 2.594722, 0, 0.003921569, 1, 1,
0.442844, 0.05743904, 3.687466, 0.003921569, 0, 1, 1,
0.4448043, -2.072196, 2.372041, 0.007843138, 0, 1, 1,
0.4481262, -1.647867, 3.86827, 0.01568628, 0, 1, 1,
0.4524725, -1.531091, 2.874482, 0.01960784, 0, 1, 1,
0.4627368, -0.9078242, 3.331727, 0.02745098, 0, 1, 1,
0.4638756, -1.018179, 0.7567381, 0.03137255, 0, 1, 1,
0.4649915, -1.791385, 3.367743, 0.03921569, 0, 1, 1,
0.4674921, 0.5738807, 0.3101046, 0.04313726, 0, 1, 1,
0.4684991, 0.8855074, 0.5694371, 0.05098039, 0, 1, 1,
0.4700687, -0.6132153, 2.046503, 0.05490196, 0, 1, 1,
0.4716304, 0.1083985, 0.7402942, 0.0627451, 0, 1, 1,
0.4719187, -2.763988, 1.901848, 0.06666667, 0, 1, 1,
0.472842, 0.949265, 0.114153, 0.07450981, 0, 1, 1,
0.4732526, -2.137191, 4.690233, 0.07843138, 0, 1, 1,
0.476202, 0.563527, 1.537671, 0.08627451, 0, 1, 1,
0.4775798, 1.209661, -0.04655169, 0.09019608, 0, 1, 1,
0.4788498, 0.6259056, -0.5092185, 0.09803922, 0, 1, 1,
0.4799987, -0.07692525, 2.056754, 0.1058824, 0, 1, 1,
0.4813581, -1.291261, 2.424956, 0.1098039, 0, 1, 1,
0.4931586, -1.18964, 1.889583, 0.1176471, 0, 1, 1,
0.4949464, -1.76914, 1.719741, 0.1215686, 0, 1, 1,
0.4962173, -0.1448304, 0.3354294, 0.1294118, 0, 1, 1,
0.4981274, -0.7478233, 2.602686, 0.1333333, 0, 1, 1,
0.5004849, -0.4729005, 2.024773, 0.1411765, 0, 1, 1,
0.5027228, -1.599883, 2.547532, 0.145098, 0, 1, 1,
0.5168972, 0.8088177, 1.839999, 0.1529412, 0, 1, 1,
0.5169688, 1.935935, 0.2218931, 0.1568628, 0, 1, 1,
0.5173182, 1.686273, 0.1314778, 0.1647059, 0, 1, 1,
0.5292403, -1.331946, 3.823835, 0.1686275, 0, 1, 1,
0.5331713, 0.1865911, 0.4122052, 0.1764706, 0, 1, 1,
0.5365863, 0.2200575, 0.1612561, 0.1803922, 0, 1, 1,
0.5367551, 0.650503, 1.613574, 0.1882353, 0, 1, 1,
0.5414501, -1.457479, 4.249402, 0.1921569, 0, 1, 1,
0.5421689, 0.5400202, 0.330393, 0.2, 0, 1, 1,
0.5442697, 0.5768305, 1.072034, 0.2078431, 0, 1, 1,
0.5443176, -0.4028316, 3.069039, 0.2117647, 0, 1, 1,
0.5461131, -0.4833341, 1.50253, 0.2196078, 0, 1, 1,
0.5518425, 0.07260899, 1.449442, 0.2235294, 0, 1, 1,
0.5524815, 1.026038, 0.5270438, 0.2313726, 0, 1, 1,
0.5545071, 0.518191, 1.018748, 0.2352941, 0, 1, 1,
0.5551628, -0.6132011, 2.170416, 0.2431373, 0, 1, 1,
0.5603893, 0.8261437, 1.101521, 0.2470588, 0, 1, 1,
0.5614374, 0.9054042, 0.2928275, 0.254902, 0, 1, 1,
0.5645068, 0.6007922, 2.01642, 0.2588235, 0, 1, 1,
0.5653263, 0.153298, 2.321079, 0.2666667, 0, 1, 1,
0.5675932, 1.076557, 1.325786, 0.2705882, 0, 1, 1,
0.5683176, -0.8213212, 2.604405, 0.2784314, 0, 1, 1,
0.5692199, 0.8470071, -1.087904, 0.282353, 0, 1, 1,
0.5743361, 0.253764, 2.100033, 0.2901961, 0, 1, 1,
0.5745161, 0.6930274, 2.267657, 0.2941177, 0, 1, 1,
0.5770287, 0.1379621, 1.554174, 0.3019608, 0, 1, 1,
0.5776194, -0.838679, 4.013732, 0.3098039, 0, 1, 1,
0.5893285, 0.2967968, -0.05805194, 0.3137255, 0, 1, 1,
0.5898061, -0.6147212, 2.559486, 0.3215686, 0, 1, 1,
0.596001, -0.8077285, 5.491918, 0.3254902, 0, 1, 1,
0.5973159, -0.5330799, 2.822163, 0.3333333, 0, 1, 1,
0.5978381, 0.03859152, 1.5774, 0.3372549, 0, 1, 1,
0.6033967, 0.7504058, -0.1182995, 0.345098, 0, 1, 1,
0.603563, 0.01033149, 1.653581, 0.3490196, 0, 1, 1,
0.6061637, -1.067329, 1.242074, 0.3568628, 0, 1, 1,
0.6070882, -0.04823887, -1.051504, 0.3607843, 0, 1, 1,
0.6101287, 1.373571, -0.2400258, 0.3686275, 0, 1, 1,
0.6122947, 1.321631, 0.824317, 0.372549, 0, 1, 1,
0.6171773, -1.165743, 2.494058, 0.3803922, 0, 1, 1,
0.6176371, 0.4693012, -1.573941, 0.3843137, 0, 1, 1,
0.6203554, 1.996325, -0.03999648, 0.3921569, 0, 1, 1,
0.6241248, 1.116534, 0.09501696, 0.3960784, 0, 1, 1,
0.6284325, 1.567141, -0.8930522, 0.4039216, 0, 1, 1,
0.6316215, 0.9653158, 0.3859616, 0.4117647, 0, 1, 1,
0.6319511, 0.3085082, 1.232185, 0.4156863, 0, 1, 1,
0.6358976, 1.043143, 0.7579316, 0.4235294, 0, 1, 1,
0.6368563, -1.481865, 3.012053, 0.427451, 0, 1, 1,
0.6406626, 0.5770844, 2.088645, 0.4352941, 0, 1, 1,
0.6411244, 0.8869928, 0.677232, 0.4392157, 0, 1, 1,
0.6412491, 1.814601, 1.504552, 0.4470588, 0, 1, 1,
0.6424357, -0.5358007, 1.020883, 0.4509804, 0, 1, 1,
0.644352, 1.272532, -0.2742116, 0.4588235, 0, 1, 1,
0.6463543, 1.273553, -0.7868836, 0.4627451, 0, 1, 1,
0.6467941, -1.136755, 0.7704307, 0.4705882, 0, 1, 1,
0.6489733, -0.8479334, 3.426603, 0.4745098, 0, 1, 1,
0.6496091, -1.486498, 1.850336, 0.4823529, 0, 1, 1,
0.6569263, 0.9062222, 2.499511, 0.4862745, 0, 1, 1,
0.6573044, -0.4987669, 1.362049, 0.4941176, 0, 1, 1,
0.6573868, 0.7823973, 0.2918518, 0.5019608, 0, 1, 1,
0.6669777, -2.375788, 2.924578, 0.5058824, 0, 1, 1,
0.6677482, -0.6847957, 1.984216, 0.5137255, 0, 1, 1,
0.6713154, 0.5257325, 1.359479, 0.5176471, 0, 1, 1,
0.6735321, 0.4723746, 2.060158, 0.5254902, 0, 1, 1,
0.6743561, 0.7435372, 2.715605, 0.5294118, 0, 1, 1,
0.6770267, -0.7070525, 2.573318, 0.5372549, 0, 1, 1,
0.6791206, -1.690241, 2.344326, 0.5411765, 0, 1, 1,
0.6793873, 0.2686146, 0.7727441, 0.5490196, 0, 1, 1,
0.6862399, 1.618577, 0.2440807, 0.5529412, 0, 1, 1,
0.6883452, 0.2139341, 3.106052, 0.5607843, 0, 1, 1,
0.6911132, 0.1094126, 1.143833, 0.5647059, 0, 1, 1,
0.6960238, 1.518651, 1.270838, 0.572549, 0, 1, 1,
0.6981073, 0.8726006, 3.449164, 0.5764706, 0, 1, 1,
0.6987209, -0.7451001, 2.90784, 0.5843138, 0, 1, 1,
0.7016869, -0.2327974, 3.25648, 0.5882353, 0, 1, 1,
0.7035376, -1.93732, 4.156604, 0.5960785, 0, 1, 1,
0.7096252, 0.2839395, 0.8351573, 0.6039216, 0, 1, 1,
0.7098402, 0.8437465, 0.3381014, 0.6078432, 0, 1, 1,
0.7107496, 0.4251291, -0.3398338, 0.6156863, 0, 1, 1,
0.7116671, -0.1892425, 1.635178, 0.6196079, 0, 1, 1,
0.7142215, -0.7133679, 0.02161474, 0.627451, 0, 1, 1,
0.7161728, 0.2414372, 1.218342, 0.6313726, 0, 1, 1,
0.7181208, -0.783072, 4.109775, 0.6392157, 0, 1, 1,
0.7208685, 0.1309028, 1.303524, 0.6431373, 0, 1, 1,
0.7235246, 1.498647, 0.2526216, 0.6509804, 0, 1, 1,
0.7240083, 0.9776848, 0.5638123, 0.654902, 0, 1, 1,
0.7257802, -0.0583368, 0.925721, 0.6627451, 0, 1, 1,
0.7262436, 1.565443, 0.1307925, 0.6666667, 0, 1, 1,
0.7297673, 1.035339, 0.6707343, 0.6745098, 0, 1, 1,
0.7303847, 1.120412, 1.27405, 0.6784314, 0, 1, 1,
0.7327418, -0.4651261, 1.998343, 0.6862745, 0, 1, 1,
0.7332633, 0.9083319, 0.7637021, 0.6901961, 0, 1, 1,
0.7394696, -0.06510197, 1.894487, 0.6980392, 0, 1, 1,
0.7402406, -0.6108307, 2.578499, 0.7058824, 0, 1, 1,
0.7422342, -0.4083585, 2.381907, 0.7098039, 0, 1, 1,
0.7445722, 0.6924388, 1.161344, 0.7176471, 0, 1, 1,
0.7453697, -0.2728668, 3.560858, 0.7215686, 0, 1, 1,
0.7454771, 0.3928858, 0.7702395, 0.7294118, 0, 1, 1,
0.7456868, -0.06628058, 2.00653, 0.7333333, 0, 1, 1,
0.7505675, 0.0755498, 0.9549353, 0.7411765, 0, 1, 1,
0.7519674, -0.629439, 2.830732, 0.7450981, 0, 1, 1,
0.7578201, 0.7306396, 0.1382747, 0.7529412, 0, 1, 1,
0.762858, -0.3092465, 2.062715, 0.7568628, 0, 1, 1,
0.7691223, 1.341247, 0.3198226, 0.7647059, 0, 1, 1,
0.7751169, -0.3858043, 1.024063, 0.7686275, 0, 1, 1,
0.7864755, -0.7965068, 2.292993, 0.7764706, 0, 1, 1,
0.7874582, 1.358617, -0.4433587, 0.7803922, 0, 1, 1,
0.7905418, 0.8907349, 0.08134495, 0.7882353, 0, 1, 1,
0.7935467, -1.117878, 2.677914, 0.7921569, 0, 1, 1,
0.7953469, 0.3127803, 0.6512331, 0.8, 0, 1, 1,
0.797226, -1.0531, 1.604508, 0.8078431, 0, 1, 1,
0.8011454, 0.2514123, -0.09718756, 0.8117647, 0, 1, 1,
0.8030975, 0.01595626, 1.574999, 0.8196079, 0, 1, 1,
0.8110006, 0.9292942, 1.477146, 0.8235294, 0, 1, 1,
0.8211952, 0.5908244, 2.076022, 0.8313726, 0, 1, 1,
0.8228066, 1.547067, 0.1595813, 0.8352941, 0, 1, 1,
0.823292, 0.1159594, 1.276888, 0.8431373, 0, 1, 1,
0.8268405, 0.1123074, 0.1219673, 0.8470588, 0, 1, 1,
0.8276017, 0.2272429, 2.321271, 0.854902, 0, 1, 1,
0.8303836, -0.5749622, 1.954138, 0.8588235, 0, 1, 1,
0.831505, 0.6438787, 0.2048745, 0.8666667, 0, 1, 1,
0.834296, -0.2470102, 1.954452, 0.8705882, 0, 1, 1,
0.8344216, 1.294936, 0.2321941, 0.8784314, 0, 1, 1,
0.8357691, -0.758657, 1.533822, 0.8823529, 0, 1, 1,
0.8387067, 2.593092, 0.2766019, 0.8901961, 0, 1, 1,
0.8404273, -0.1338482, 2.302912, 0.8941177, 0, 1, 1,
0.8416511, -3.698975, 3.165421, 0.9019608, 0, 1, 1,
0.8471013, -0.5523766, 1.86222, 0.9098039, 0, 1, 1,
0.8531347, -0.5770425, 2.253525, 0.9137255, 0, 1, 1,
0.8557478, -1.260691, 1.896698, 0.9215686, 0, 1, 1,
0.8688112, 0.08401782, 1.865155, 0.9254902, 0, 1, 1,
0.8730172, 0.9733717, 0.444141, 0.9333333, 0, 1, 1,
0.8733937, -0.5810805, 0.6357381, 0.9372549, 0, 1, 1,
0.8774371, 0.7575732, 0.9380584, 0.945098, 0, 1, 1,
0.9041467, 1.1948, 0.02956752, 0.9490196, 0, 1, 1,
0.9049273, 0.1969993, 2.991343, 0.9568627, 0, 1, 1,
0.9173053, 1.321715, 2.086085, 0.9607843, 0, 1, 1,
0.9204929, -0.2007573, 1.7264, 0.9686275, 0, 1, 1,
0.9212321, 1.144106, 0.4691665, 0.972549, 0, 1, 1,
0.9299394, -0.2306573, 1.420618, 0.9803922, 0, 1, 1,
0.9331398, 0.802277, -0.06352735, 0.9843137, 0, 1, 1,
0.9402127, -2.345634, 3.664993, 0.9921569, 0, 1, 1,
0.9408818, -1.229957, 1.915889, 0.9960784, 0, 1, 1,
0.9419228, 0.8780982, 1.32591, 1, 0, 0.9960784, 1,
0.9428021, 0.4906777, 1.578928, 1, 0, 0.9882353, 1,
0.9447402, -0.3989913, 4.329637, 1, 0, 0.9843137, 1,
0.9450873, 0.2039914, 2.47631, 1, 0, 0.9764706, 1,
0.947316, 0.6476325, -0.05092363, 1, 0, 0.972549, 1,
0.947493, -0.6009831, 2.677598, 1, 0, 0.9647059, 1,
0.9568778, 0.2671338, 1.004084, 1, 0, 0.9607843, 1,
0.9603916, -1.603001, 1.64862, 1, 0, 0.9529412, 1,
0.9624877, -0.5111961, 2.034881, 1, 0, 0.9490196, 1,
0.9665445, 0.08576697, 3.723215, 1, 0, 0.9411765, 1,
0.9667255, 0.2679065, -0.1294991, 1, 0, 0.9372549, 1,
0.973366, 1.086932, 0.5147951, 1, 0, 0.9294118, 1,
0.9745009, 1.689071, -0.01169737, 1, 0, 0.9254902, 1,
0.9766902, -0.2415103, 2.027014, 1, 0, 0.9176471, 1,
0.983054, -1.127776, 2.774691, 1, 0, 0.9137255, 1,
0.985593, 0.08379848, 0.8835999, 1, 0, 0.9058824, 1,
0.9863912, -1.001614, 2.916514, 1, 0, 0.9019608, 1,
1.001359, 0.236119, 2.07109, 1, 0, 0.8941177, 1,
1.010753, -1.800477, 1.872727, 1, 0, 0.8862745, 1,
1.012316, -1.142459, 2.960427, 1, 0, 0.8823529, 1,
1.0152, 0.9858993, 1.701677, 1, 0, 0.8745098, 1,
1.017766, -0.2987634, 2.036514, 1, 0, 0.8705882, 1,
1.020968, 0.1805501, 2.989183, 1, 0, 0.8627451, 1,
1.023202, -0.5031533, 3.432209, 1, 0, 0.8588235, 1,
1.041883, 0.9633382, 1.566458, 1, 0, 0.8509804, 1,
1.04396, 0.6671853, 0.9095473, 1, 0, 0.8470588, 1,
1.044866, -1.073424, 1.919129, 1, 0, 0.8392157, 1,
1.053263, 1.647351, 2.184371, 1, 0, 0.8352941, 1,
1.062425, -0.7647203, 3.150388, 1, 0, 0.827451, 1,
1.065576, -0.1214373, 0.8291736, 1, 0, 0.8235294, 1,
1.067646, -1.999009, 3.134447, 1, 0, 0.8156863, 1,
1.078302, 0.09019405, 0.5842763, 1, 0, 0.8117647, 1,
1.080519, -0.4800383, 3.167186, 1, 0, 0.8039216, 1,
1.086028, -1.855568, 1.603426, 1, 0, 0.7960784, 1,
1.094478, 0.559219, 3.087646, 1, 0, 0.7921569, 1,
1.103601, 0.8367375, 1.001362, 1, 0, 0.7843137, 1,
1.105196, -0.9718457, 1.704043, 1, 0, 0.7803922, 1,
1.109727, -0.5834039, 3.434831, 1, 0, 0.772549, 1,
1.110865, 0.9554944, 1.354664, 1, 0, 0.7686275, 1,
1.126587, 1.421399, 1.256175, 1, 0, 0.7607843, 1,
1.129681, 1.606444, -0.7817321, 1, 0, 0.7568628, 1,
1.138706, 0.2068633, 1.63026, 1, 0, 0.7490196, 1,
1.145802, -0.04184592, 0.1708324, 1, 0, 0.7450981, 1,
1.146442, 2.787717, 0.683268, 1, 0, 0.7372549, 1,
1.14739, -1.353079, 1.303297, 1, 0, 0.7333333, 1,
1.150875, -1.13093, 3.308208, 1, 0, 0.7254902, 1,
1.151699, 0.4150127, 2.392936, 1, 0, 0.7215686, 1,
1.160206, -0.349914, 4.478846, 1, 0, 0.7137255, 1,
1.160508, 2.465625, 0.8883994, 1, 0, 0.7098039, 1,
1.163309, -0.5356098, 1.337775, 1, 0, 0.7019608, 1,
1.165938, 0.3248907, 0.8946128, 1, 0, 0.6941177, 1,
1.170887, -0.03675378, 2.671753, 1, 0, 0.6901961, 1,
1.180026, -2.095909, 2.621588, 1, 0, 0.682353, 1,
1.18521, 0.949074, 1.605341, 1, 0, 0.6784314, 1,
1.18596, -0.1963575, 2.791092, 1, 0, 0.6705883, 1,
1.202556, 0.6094443, 1.358751, 1, 0, 0.6666667, 1,
1.204589, 0.6118629, -1.195244, 1, 0, 0.6588235, 1,
1.219993, -0.1783448, 1.239123, 1, 0, 0.654902, 1,
1.223784, -0.8787628, 2.657765, 1, 0, 0.6470588, 1,
1.227269, 1.236475, -0.9618154, 1, 0, 0.6431373, 1,
1.22986, -0.2519273, 2.894242, 1, 0, 0.6352941, 1,
1.238585, -0.4143098, 0.5892488, 1, 0, 0.6313726, 1,
1.244108, -1.932098, 2.449061, 1, 0, 0.6235294, 1,
1.262258, -1.912984, 1.512766, 1, 0, 0.6196079, 1,
1.266253, 0.4798273, 0.2537387, 1, 0, 0.6117647, 1,
1.269914, 0.1193024, 0.9886089, 1, 0, 0.6078432, 1,
1.271799, 2.891292, 0.3730312, 1, 0, 0.6, 1,
1.277958, 0.08780671, 1.338849, 1, 0, 0.5921569, 1,
1.287436, 0.4355083, 1.046402, 1, 0, 0.5882353, 1,
1.287918, 0.1422869, 0.5359131, 1, 0, 0.5803922, 1,
1.290935, 0.9488784, 2.134726, 1, 0, 0.5764706, 1,
1.298223, 0.4805655, -0.5869789, 1, 0, 0.5686275, 1,
1.319152, -0.1445363, 3.460963, 1, 0, 0.5647059, 1,
1.327663, -0.6478137, 1.411951, 1, 0, 0.5568628, 1,
1.330755, -2.011923, 3.83729, 1, 0, 0.5529412, 1,
1.336493, -0.419956, 2.037019, 1, 0, 0.5450981, 1,
1.341607, 0.5952576, 1.842223, 1, 0, 0.5411765, 1,
1.356352, 0.9763889, -0.04031372, 1, 0, 0.5333334, 1,
1.360182, 0.7927704, 2.150409, 1, 0, 0.5294118, 1,
1.380165, 1.74196, 2.036923, 1, 0, 0.5215687, 1,
1.387218, 2.618113, 0.2646374, 1, 0, 0.5176471, 1,
1.393712, 0.5696172, 0.676896, 1, 0, 0.509804, 1,
1.39417, -0.3199202, 2.218426, 1, 0, 0.5058824, 1,
1.397462, -0.1009334, 1.780067, 1, 0, 0.4980392, 1,
1.404725, 0.7376229, -0.933257, 1, 0, 0.4901961, 1,
1.406783, -1.11235, 0.9726514, 1, 0, 0.4862745, 1,
1.409052, 2.156793, -0.01438844, 1, 0, 0.4784314, 1,
1.412798, -0.6113251, 1.233908, 1, 0, 0.4745098, 1,
1.414904, 0.3333393, 1.011111, 1, 0, 0.4666667, 1,
1.415581, -0.1655969, 2.150578, 1, 0, 0.4627451, 1,
1.415637, -0.2718254, 1.475875, 1, 0, 0.454902, 1,
1.420724, -0.2511241, 0.4835505, 1, 0, 0.4509804, 1,
1.423446, 1.230628, 1.306877, 1, 0, 0.4431373, 1,
1.424996, -0.5483257, -0.2208696, 1, 0, 0.4392157, 1,
1.430359, 0.0782574, 3.366436, 1, 0, 0.4313726, 1,
1.436048, -0.7230611, 3.723463, 1, 0, 0.427451, 1,
1.440421, -0.3241571, 1.825913, 1, 0, 0.4196078, 1,
1.444318, -1.17818, 3.046807, 1, 0, 0.4156863, 1,
1.457706, 0.966287, 1.507171, 1, 0, 0.4078431, 1,
1.473352, -0.9772792, 0.5138708, 1, 0, 0.4039216, 1,
1.484439, 0.4544384, 1.648131, 1, 0, 0.3960784, 1,
1.488496, 1.396167, 1.881395, 1, 0, 0.3882353, 1,
1.498573, -0.1772922, 2.188841, 1, 0, 0.3843137, 1,
1.507444, 0.05624486, 1.983258, 1, 0, 0.3764706, 1,
1.515013, 0.7980021, 2.173024, 1, 0, 0.372549, 1,
1.522753, 0.4011182, 2.547309, 1, 0, 0.3647059, 1,
1.523253, 0.6563818, 1.887707, 1, 0, 0.3607843, 1,
1.546467, 1.062103, 1.099898, 1, 0, 0.3529412, 1,
1.54975, 0.3253598, 1.397195, 1, 0, 0.3490196, 1,
1.550748, -0.5995142, 2.439077, 1, 0, 0.3411765, 1,
1.554447, 0.7066884, 1.583104, 1, 0, 0.3372549, 1,
1.55699, -0.4997215, 1.264136, 1, 0, 0.3294118, 1,
1.561243, 1.125354, 1.483914, 1, 0, 0.3254902, 1,
1.576178, 0.02332118, 0.4696553, 1, 0, 0.3176471, 1,
1.584582, 0.8488309, 0.8117777, 1, 0, 0.3137255, 1,
1.590104, -0.7519792, 2.224039, 1, 0, 0.3058824, 1,
1.598498, -0.9068585, 1.531507, 1, 0, 0.2980392, 1,
1.609914, -0.7826439, 1.429226, 1, 0, 0.2941177, 1,
1.620403, 0.0265974, 2.924686, 1, 0, 0.2862745, 1,
1.639226, -0.3082985, 0.9429899, 1, 0, 0.282353, 1,
1.645766, 1.188186, -1.177075, 1, 0, 0.2745098, 1,
1.665031, 0.8886988, 0.6094341, 1, 0, 0.2705882, 1,
1.67952, 1.309852, 0.5189095, 1, 0, 0.2627451, 1,
1.69098, -0.4500224, 3.316651, 1, 0, 0.2588235, 1,
1.692393, 0.5407771, 3.219804, 1, 0, 0.2509804, 1,
1.707555, 0.001031413, 0.1366763, 1, 0, 0.2470588, 1,
1.714615, -0.4683512, 3.045915, 1, 0, 0.2392157, 1,
1.71858, -0.5220572, 0.9349675, 1, 0, 0.2352941, 1,
1.740758, 1.158832, 1.341348, 1, 0, 0.227451, 1,
1.741488, 0.8811857, -0.9209544, 1, 0, 0.2235294, 1,
1.768768, -0.8745137, 2.000065, 1, 0, 0.2156863, 1,
1.771767, -1.206588, 2.01289, 1, 0, 0.2117647, 1,
1.80777, 0.5919352, 2.130378, 1, 0, 0.2039216, 1,
1.835785, -0.01477753, 2.884098, 1, 0, 0.1960784, 1,
1.851519, 1.818016, 2.71892, 1, 0, 0.1921569, 1,
1.856146, -0.165396, 0.1479023, 1, 0, 0.1843137, 1,
1.861915, 0.4686077, 1.687383, 1, 0, 0.1803922, 1,
1.864762, -0.8464711, 0.9329897, 1, 0, 0.172549, 1,
1.872945, 0.6028193, 1.525405, 1, 0, 0.1686275, 1,
1.874877, -1.654624, 2.696187, 1, 0, 0.1607843, 1,
1.888881, 0.1572485, -0.07623878, 1, 0, 0.1568628, 1,
1.890913, -0.4895521, 3.679018, 1, 0, 0.1490196, 1,
1.892077, -0.4717031, 1.152134, 1, 0, 0.145098, 1,
1.905613, 0.7534345, 2.163, 1, 0, 0.1372549, 1,
1.910845, 1.321996, 0.8259247, 1, 0, 0.1333333, 1,
1.93722, 1.1666, 0.4967934, 1, 0, 0.1254902, 1,
1.954924, 1.148556, 1.767645, 1, 0, 0.1215686, 1,
1.992923, -0.9894109, 2.17372, 1, 0, 0.1137255, 1,
2.014614, -0.6970941, 1.826198, 1, 0, 0.1098039, 1,
2.022209, 2.590514, -2.382843, 1, 0, 0.1019608, 1,
2.045404, 1.171521, 2.069765, 1, 0, 0.09411765, 1,
2.063561, -1.529088, 3.006946, 1, 0, 0.09019608, 1,
2.102951, 1.154287, 2.222347, 1, 0, 0.08235294, 1,
2.16178, 0.03804695, 1.258385, 1, 0, 0.07843138, 1,
2.225399, -0.4292576, 3.228798, 1, 0, 0.07058824, 1,
2.246166, -0.8319079, 1.49305, 1, 0, 0.06666667, 1,
2.381925, 0.6027176, 0.3462316, 1, 0, 0.05882353, 1,
2.440896, -0.2345904, 1.378527, 1, 0, 0.05490196, 1,
2.460306, 0.365683, 0.0807806, 1, 0, 0.04705882, 1,
2.496631, 1.185584, 1.514447, 1, 0, 0.04313726, 1,
2.626219, 0.8637995, 0.558531, 1, 0, 0.03529412, 1,
2.848295, -1.116997, 1.749167, 1, 0, 0.03137255, 1,
2.885499, 0.7492052, 1.207948, 1, 0, 0.02352941, 1,
2.920723, -0.634013, 2.276844, 1, 0, 0.01960784, 1,
3.208981, 1.164183, 1.867632, 1, 0, 0.01176471, 1,
3.311133, 0.6504844, -0.6301389, 1, 0, 0.007843138, 1
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
-0.1613837, -4.893178, -6.661334, 0, -0.5, 0.5, 0.5,
-0.1613837, -4.893178, -6.661334, 1, -0.5, 0.5, 0.5,
-0.1613837, -4.893178, -6.661334, 1, 1.5, 0.5, 0.5,
-0.1613837, -4.893178, -6.661334, 0, 1.5, 0.5, 0.5
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
-4.811084, -0.176252, -6.661334, 0, -0.5, 0.5, 0.5,
-4.811084, -0.176252, -6.661334, 1, -0.5, 0.5, 0.5,
-4.811084, -0.176252, -6.661334, 1, 1.5, 0.5, 0.5,
-4.811084, -0.176252, -6.661334, 0, 1.5, 0.5, 0.5
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
-4.811084, -4.893178, 0.2959998, 0, -0.5, 0.5, 0.5,
-4.811084, -4.893178, 0.2959998, 1, -0.5, 0.5, 0.5,
-4.811084, -4.893178, 0.2959998, 1, 1.5, 0.5, 0.5,
-4.811084, -4.893178, 0.2959998, 0, 1.5, 0.5, 0.5
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
-3, -3.804657, -5.055796,
3, -3.804657, -5.055796,
-3, -3.804657, -5.055796,
-3, -3.986077, -5.323385,
-2, -3.804657, -5.055796,
-2, -3.986077, -5.323385,
-1, -3.804657, -5.055796,
-1, -3.986077, -5.323385,
0, -3.804657, -5.055796,
0, -3.986077, -5.323385,
1, -3.804657, -5.055796,
1, -3.986077, -5.323385,
2, -3.804657, -5.055796,
2, -3.986077, -5.323385,
3, -3.804657, -5.055796,
3, -3.986077, -5.323385
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
-3, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
-3, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
-3, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
-3, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5,
-2, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
-2, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
-2, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
-2, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5,
-1, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
-1, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
-1, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
-1, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5,
0, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
0, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
0, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
0, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5,
1, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
1, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
1, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
1, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5,
2, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
2, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
2, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
2, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5,
3, -4.348917, -5.858565, 0, -0.5, 0.5, 0.5,
3, -4.348917, -5.858565, 1, -0.5, 0.5, 0.5,
3, -4.348917, -5.858565, 1, 1.5, 0.5, 0.5,
3, -4.348917, -5.858565, 0, 1.5, 0.5, 0.5
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
-3.738076, -2, -5.055796,
-3.738076, 2, -5.055796,
-3.738076, -2, -5.055796,
-3.916911, -2, -5.323385,
-3.738076, 0, -5.055796,
-3.916911, 0, -5.323385,
-3.738076, 2, -5.055796,
-3.916911, 2, -5.323385
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
-4.27458, -2, -5.858565, 0, -0.5, 0.5, 0.5,
-4.27458, -2, -5.858565, 1, -0.5, 0.5, 0.5,
-4.27458, -2, -5.858565, 1, 1.5, 0.5, 0.5,
-4.27458, -2, -5.858565, 0, 1.5, 0.5, 0.5,
-4.27458, 0, -5.858565, 0, -0.5, 0.5, 0.5,
-4.27458, 0, -5.858565, 1, -0.5, 0.5, 0.5,
-4.27458, 0, -5.858565, 1, 1.5, 0.5, 0.5,
-4.27458, 0, -5.858565, 0, 1.5, 0.5, 0.5,
-4.27458, 2, -5.858565, 0, -0.5, 0.5, 0.5,
-4.27458, 2, -5.858565, 1, -0.5, 0.5, 0.5,
-4.27458, 2, -5.858565, 1, 1.5, 0.5, 0.5,
-4.27458, 2, -5.858565, 0, 1.5, 0.5, 0.5
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
-3.738076, -3.804657, -4,
-3.738076, -3.804657, 4,
-3.738076, -3.804657, -4,
-3.916911, -3.986077, -4,
-3.738076, -3.804657, -2,
-3.916911, -3.986077, -2,
-3.738076, -3.804657, 0,
-3.916911, -3.986077, 0,
-3.738076, -3.804657, 2,
-3.916911, -3.986077, 2,
-3.738076, -3.804657, 4,
-3.916911, -3.986077, 4
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
-4.27458, -4.348917, -4, 0, -0.5, 0.5, 0.5,
-4.27458, -4.348917, -4, 1, -0.5, 0.5, 0.5,
-4.27458, -4.348917, -4, 1, 1.5, 0.5, 0.5,
-4.27458, -4.348917, -4, 0, 1.5, 0.5, 0.5,
-4.27458, -4.348917, -2, 0, -0.5, 0.5, 0.5,
-4.27458, -4.348917, -2, 1, -0.5, 0.5, 0.5,
-4.27458, -4.348917, -2, 1, 1.5, 0.5, 0.5,
-4.27458, -4.348917, -2, 0, 1.5, 0.5, 0.5,
-4.27458, -4.348917, 0, 0, -0.5, 0.5, 0.5,
-4.27458, -4.348917, 0, 1, -0.5, 0.5, 0.5,
-4.27458, -4.348917, 0, 1, 1.5, 0.5, 0.5,
-4.27458, -4.348917, 0, 0, 1.5, 0.5, 0.5,
-4.27458, -4.348917, 2, 0, -0.5, 0.5, 0.5,
-4.27458, -4.348917, 2, 1, -0.5, 0.5, 0.5,
-4.27458, -4.348917, 2, 1, 1.5, 0.5, 0.5,
-4.27458, -4.348917, 2, 0, 1.5, 0.5, 0.5,
-4.27458, -4.348917, 4, 0, -0.5, 0.5, 0.5,
-4.27458, -4.348917, 4, 1, -0.5, 0.5, 0.5,
-4.27458, -4.348917, 4, 1, 1.5, 0.5, 0.5,
-4.27458, -4.348917, 4, 0, 1.5, 0.5, 0.5
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
-3.738076, -3.804657, -5.055796,
-3.738076, 3.452153, -5.055796,
-3.738076, -3.804657, 5.647795,
-3.738076, 3.452153, 5.647795,
-3.738076, -3.804657, -5.055796,
-3.738076, -3.804657, 5.647795,
-3.738076, 3.452153, -5.055796,
-3.738076, 3.452153, 5.647795,
-3.738076, -3.804657, -5.055796,
3.415309, -3.804657, -5.055796,
-3.738076, -3.804657, 5.647795,
3.415309, -3.804657, 5.647795,
-3.738076, 3.452153, -5.055796,
3.415309, 3.452153, -5.055796,
-3.738076, 3.452153, 5.647795,
3.415309, 3.452153, 5.647795,
3.415309, -3.804657, -5.055796,
3.415309, 3.452153, -5.055796,
3.415309, -3.804657, 5.647795,
3.415309, 3.452153, 5.647795,
3.415309, -3.804657, -5.055796,
3.415309, -3.804657, 5.647795,
3.415309, 3.452153, -5.055796,
3.415309, 3.452153, 5.647795
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
var radius = 7.891342;
var distance = 35.10947;
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
mvMatrix.translate( 0.1613837, 0.176252, -0.2959998 );
mvMatrix.scale( 1.19276, 1.175761, 0.7971412 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.10947);
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
cis-Dichloropropene<-read.table("cis-Dichloropropene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cis-Dichloropropene$V2
```

```
## Error in eval(expr, envir, enclos): object 'cis' not found
```

```r
y<-cis-Dichloropropene$V3
```

```
## Error in eval(expr, envir, enclos): object 'cis' not found
```

```r
z<-cis-Dichloropropene$V4
```

```
## Error in eval(expr, envir, enclos): object 'cis' not found
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
-3.633901, 0.7438715, -1.575477, 0, 0, 1, 1, 1,
-3.420331, 0.571323, -1.931755, 1, 0, 0, 1, 1,
-2.64697, 0.6546165, -1.186548, 1, 0, 0, 1, 1,
-2.592862, 0.8625522, -0.4554575, 1, 0, 0, 1, 1,
-2.491758, -2.030385, -3.166656, 1, 0, 0, 1, 1,
-2.365285, 0.344724, -1.414158, 1, 0, 0, 1, 1,
-2.321036, 0.1890144, -1.298527, 0, 0, 0, 1, 1,
-2.312362, 0.03552066, -0.92731, 0, 0, 0, 1, 1,
-2.311749, 0.04547014, -2.362185, 0, 0, 0, 1, 1,
-2.251041, 0.8161522, -1.296269, 0, 0, 0, 1, 1,
-2.249086, 0.8429245, -2.677266, 0, 0, 0, 1, 1,
-2.238892, -0.8312636, -3.228153, 0, 0, 0, 1, 1,
-2.17187, 0.4752334, -1.197427, 0, 0, 0, 1, 1,
-2.146548, -1.800309, -2.264935, 1, 1, 1, 1, 1,
-2.124434, -0.3946767, -3.14378, 1, 1, 1, 1, 1,
-2.11532, -0.1537295, -2.280978, 1, 1, 1, 1, 1,
-2.087604, -1.270698, -0.9680824, 1, 1, 1, 1, 1,
-2.075933, -0.2191461, -0.4282041, 1, 1, 1, 1, 1,
-2.066154, 1.684778, 0.6746652, 1, 1, 1, 1, 1,
-2.055696, 2.499692, 0.6519832, 1, 1, 1, 1, 1,
-2.050956, 0.5048323, -0.798352, 1, 1, 1, 1, 1,
-2.044195, 0.2588318, -1.88817, 1, 1, 1, 1, 1,
-2.016329, 1.303273, -1.326281, 1, 1, 1, 1, 1,
-1.97217, 0.5466287, 0.3867687, 1, 1, 1, 1, 1,
-1.95684, 0.2691586, -0.7626813, 1, 1, 1, 1, 1,
-1.95082, -1.869182, -1.692925, 1, 1, 1, 1, 1,
-1.925648, -0.2462632, -2.652591, 1, 1, 1, 1, 1,
-1.895607, 1.180227, -2.058045, 1, 1, 1, 1, 1,
-1.877683, 0.7837373, -0.6059985, 0, 0, 1, 1, 1,
-1.869172, -0.8491916, -1.734404, 1, 0, 0, 1, 1,
-1.8666, 0.8121682, -1.531505, 1, 0, 0, 1, 1,
-1.850433, -0.1866934, -2.411395, 1, 0, 0, 1, 1,
-1.84964, -0.1443312, -1.299008, 1, 0, 0, 1, 1,
-1.819815, 0.1855469, -2.726062, 1, 0, 0, 1, 1,
-1.816051, 1.429847, -1.572295, 0, 0, 0, 1, 1,
-1.799828, -0.8081911, -0.6291103, 0, 0, 0, 1, 1,
-1.798512, 0.6289453, -0.08864416, 0, 0, 0, 1, 1,
-1.794987, 0.02800032, -0.5512707, 0, 0, 0, 1, 1,
-1.770809, 0.04326496, -4.192961, 0, 0, 0, 1, 1,
-1.732536, 0.7506976, -1.173795, 0, 0, 0, 1, 1,
-1.721095, -0.9295266, -0.6826931, 0, 0, 0, 1, 1,
-1.709679, 1.298355, -0.3652962, 1, 1, 1, 1, 1,
-1.693007, 0.3064072, -2.787002, 1, 1, 1, 1, 1,
-1.666069, -0.4323989, -2.022187, 1, 1, 1, 1, 1,
-1.645466, -0.4314134, -1.260496, 1, 1, 1, 1, 1,
-1.634021, 0.9296867, -1.021342, 1, 1, 1, 1, 1,
-1.614104, 0.2885543, 0.2631833, 1, 1, 1, 1, 1,
-1.614088, 0.846898, 0.87831, 1, 1, 1, 1, 1,
-1.608909, -1.009327, -1.480819, 1, 1, 1, 1, 1,
-1.605062, 0.4589351, -1.391124, 1, 1, 1, 1, 1,
-1.545075, -1.05921, -3.165527, 1, 1, 1, 1, 1,
-1.542649, 0.6436091, -0.266762, 1, 1, 1, 1, 1,
-1.531207, -0.2817566, -0.5765767, 1, 1, 1, 1, 1,
-1.517601, 1.156782, -1.294306, 1, 1, 1, 1, 1,
-1.49843, -1.259511, -1.187994, 1, 1, 1, 1, 1,
-1.492429, -0.0824735, -0.4935165, 1, 1, 1, 1, 1,
-1.491511, -0.2140986, -1.774612, 0, 0, 1, 1, 1,
-1.490967, 0.5280302, -3.184042, 1, 0, 0, 1, 1,
-1.483375, 0.6521333, -0.7720919, 1, 0, 0, 1, 1,
-1.483331, 0.7284756, -1.883451, 1, 0, 0, 1, 1,
-1.479189, -0.3181943, 0.05387437, 1, 0, 0, 1, 1,
-1.467743, 0.2621994, -1.608535, 1, 0, 0, 1, 1,
-1.460383, -1.053467, -1.208819, 0, 0, 0, 1, 1,
-1.456026, 0.5759888, -1.214892, 0, 0, 0, 1, 1,
-1.44431, 1.492217, -0.4020422, 0, 0, 0, 1, 1,
-1.432702, -0.03457024, -2.316797, 0, 0, 0, 1, 1,
-1.426192, -1.165853, -3.026119, 0, 0, 0, 1, 1,
-1.415796, -0.254535, -0.9798088, 0, 0, 0, 1, 1,
-1.409447, -1.194811, -1.744676, 0, 0, 0, 1, 1,
-1.408831, 0.3777595, -1.579559, 1, 1, 1, 1, 1,
-1.396255, 2.135924, -1.081693, 1, 1, 1, 1, 1,
-1.396152, -0.4140066, -2.136083, 1, 1, 1, 1, 1,
-1.3932, -0.6476288, -2.633716, 1, 1, 1, 1, 1,
-1.376186, -0.28401, -2.171806, 1, 1, 1, 1, 1,
-1.374262, -0.03868744, -2.721233, 1, 1, 1, 1, 1,
-1.373145, 0.532473, -1.710294, 1, 1, 1, 1, 1,
-1.370086, 0.353626, -2.299036, 1, 1, 1, 1, 1,
-1.351848, 0.3797196, -0.2347183, 1, 1, 1, 1, 1,
-1.34776, 0.3296825, -2.08642, 1, 1, 1, 1, 1,
-1.347655, -1.258854, -2.507103, 1, 1, 1, 1, 1,
-1.343024, -0.3029872, -2.035087, 1, 1, 1, 1, 1,
-1.340391, -0.8658696, -0.875393, 1, 1, 1, 1, 1,
-1.319729, -0.220171, -0.7653269, 1, 1, 1, 1, 1,
-1.313004, -0.5661949, -1.231001, 1, 1, 1, 1, 1,
-1.307865, -0.550145, -2.448863, 0, 0, 1, 1, 1,
-1.305893, 1.565895, -2.224387, 1, 0, 0, 1, 1,
-1.297385, -1.325244, -2.427585, 1, 0, 0, 1, 1,
-1.295473, 0.4218891, -2.304194, 1, 0, 0, 1, 1,
-1.294845, -0.4169973, -3.571658, 1, 0, 0, 1, 1,
-1.281331, -1.249508, -0.7277479, 1, 0, 0, 1, 1,
-1.278027, 0.8700657, -1.989831, 0, 0, 0, 1, 1,
-1.277328, 0.3731028, -2.459272, 0, 0, 0, 1, 1,
-1.276623, 0.5299404, -0.8350278, 0, 0, 0, 1, 1,
-1.275752, 0.1508985, -2.601902, 0, 0, 0, 1, 1,
-1.271579, 0.3848601, 0.4297619, 0, 0, 0, 1, 1,
-1.270116, 0.6613047, -1.874683, 0, 0, 0, 1, 1,
-1.26956, 0.7046127, 0.8548263, 0, 0, 0, 1, 1,
-1.263094, 1.366042, -1.507987, 1, 1, 1, 1, 1,
-1.260208, 1.758197, 0.9496262, 1, 1, 1, 1, 1,
-1.259449, -0.4171286, -1.957418, 1, 1, 1, 1, 1,
-1.257694, -1.424088, -1.416955, 1, 1, 1, 1, 1,
-1.249591, -0.1566449, -1.025635, 1, 1, 1, 1, 1,
-1.243915, 0.5229778, -0.3889221, 1, 1, 1, 1, 1,
-1.227721, -0.3068845, -3.395593, 1, 1, 1, 1, 1,
-1.226926, -0.4385303, -1.595221, 1, 1, 1, 1, 1,
-1.201776, -0.2966277, -2.1593, 1, 1, 1, 1, 1,
-1.201384, 0.137976, -1.727058, 1, 1, 1, 1, 1,
-1.200699, 0.5317261, -2.696828, 1, 1, 1, 1, 1,
-1.195573, 0.9337382, -1.348128, 1, 1, 1, 1, 1,
-1.194893, -0.2063855, -0.4015143, 1, 1, 1, 1, 1,
-1.192503, -1.151671, -3.884415, 1, 1, 1, 1, 1,
-1.186543, -0.4287258, -1.267009, 1, 1, 1, 1, 1,
-1.18508, -1.360121, -1.116443, 0, 0, 1, 1, 1,
-1.173105, 0.92072, 0.5260363, 1, 0, 0, 1, 1,
-1.159774, 2.16106, -1.488072, 1, 0, 0, 1, 1,
-1.155881, 0.7553368, -0.6143954, 1, 0, 0, 1, 1,
-1.154687, 2.065024, -0.5240375, 1, 0, 0, 1, 1,
-1.151327, 0.900548, -3.052595, 1, 0, 0, 1, 1,
-1.149002, 0.1727145, -1.050629, 0, 0, 0, 1, 1,
-1.142202, 0.3085412, -1.169613, 0, 0, 0, 1, 1,
-1.142169, 0.2154067, 0.8270782, 0, 0, 0, 1, 1,
-1.141455, 1.011679, 0.07511652, 0, 0, 0, 1, 1,
-1.139274, 0.02331731, -1.020938, 0, 0, 0, 1, 1,
-1.131846, 0.5267099, -0.5876445, 0, 0, 0, 1, 1,
-1.130445, -0.5502656, -1.86954, 0, 0, 0, 1, 1,
-1.120724, 0.7070007, -1.896401, 1, 1, 1, 1, 1,
-1.119574, 1.482362, 0.5468209, 1, 1, 1, 1, 1,
-1.118518, -0.8420523, -0.8043448, 1, 1, 1, 1, 1,
-1.099828, -1.007831, -3.248531, 1, 1, 1, 1, 1,
-1.099638, -0.3681524, -2.677006, 1, 1, 1, 1, 1,
-1.097549, -0.2226298, -1.166277, 1, 1, 1, 1, 1,
-1.096442, 1.803832, -2.248593, 1, 1, 1, 1, 1,
-1.094708, 1.014935, -2.177708, 1, 1, 1, 1, 1,
-1.091625, 1.076923, -0.4571406, 1, 1, 1, 1, 1,
-1.086786, 0.1195839, -1.780267, 1, 1, 1, 1, 1,
-1.074532, -0.6301766, -3.584784, 1, 1, 1, 1, 1,
-1.073183, -1.340985, -2.068551, 1, 1, 1, 1, 1,
-1.070563, -0.2425388, -0.9262095, 1, 1, 1, 1, 1,
-1.058391, -1.128789, -4.201613, 1, 1, 1, 1, 1,
-1.057208, -0.5765725, -3.829282, 1, 1, 1, 1, 1,
-1.054803, 0.8904436, -0.05465163, 0, 0, 1, 1, 1,
-1.047509, -1.10458, -2.842386, 1, 0, 0, 1, 1,
-1.043833, -0.7808601, -2.605521, 1, 0, 0, 1, 1,
-1.040317, 0.3448257, -0.36184, 1, 0, 0, 1, 1,
-1.030773, 0.4252543, -0.3897716, 1, 0, 0, 1, 1,
-1.024655, 0.8370153, -0.06061706, 1, 0, 0, 1, 1,
-1.021832, 0.9509527, -2.41883, 0, 0, 0, 1, 1,
-1.019709, -0.7881474, -2.329879, 0, 0, 0, 1, 1,
-1.015848, 1.762257, -1.886012, 0, 0, 0, 1, 1,
-1.014094, -1.298446, -0.7686766, 0, 0, 0, 1, 1,
-1.013932, 0.5050379, -0.9651541, 0, 0, 0, 1, 1,
-1.005528, 0.1649723, -1.73508, 0, 0, 0, 1, 1,
-0.9803293, 0.1865975, -1.754324, 0, 0, 0, 1, 1,
-0.9631404, -1.330581, -2.121621, 1, 1, 1, 1, 1,
-0.9629645, -0.3146761, -3.019664, 1, 1, 1, 1, 1,
-0.9577997, 1.470384, -1.034712, 1, 1, 1, 1, 1,
-0.9555729, 0.5715356, -1.969516, 1, 1, 1, 1, 1,
-0.9546596, 1.014112, -1.439343, 1, 1, 1, 1, 1,
-0.9516248, -1.124645, -3.698114, 1, 1, 1, 1, 1,
-0.9515663, -0.2579027, -3.492764, 1, 1, 1, 1, 1,
-0.9466119, 0.9381591, -0.03771647, 1, 1, 1, 1, 1,
-0.9387012, -0.354575, -1.739278, 1, 1, 1, 1, 1,
-0.9344237, 0.5463157, 1.318221, 1, 1, 1, 1, 1,
-0.9320431, 0.4512404, -2.404737, 1, 1, 1, 1, 1,
-0.9311443, -0.1106064, -1.377554, 1, 1, 1, 1, 1,
-0.9288055, -0.0886225, -3.289918, 1, 1, 1, 1, 1,
-0.9279276, -0.0378573, -2.274843, 1, 1, 1, 1, 1,
-0.9275691, -0.8558327, -3.829406, 1, 1, 1, 1, 1,
-0.9216097, -0.9364349, -1.483135, 0, 0, 1, 1, 1,
-0.9210573, 0.3050971, -1.475415, 1, 0, 0, 1, 1,
-0.9203129, -1.202418, -2.345978, 1, 0, 0, 1, 1,
-0.911439, 0.2298364, -1.104884, 1, 0, 0, 1, 1,
-0.9111695, -1.077269, -3.106555, 1, 0, 0, 1, 1,
-0.9079883, 0.0818096, -1.527986, 1, 0, 0, 1, 1,
-0.9051682, -0.1567246, -2.794452, 0, 0, 0, 1, 1,
-0.9051672, -1.165493, -1.834808, 0, 0, 0, 1, 1,
-0.9045586, -0.4772398, -1.766214, 0, 0, 0, 1, 1,
-0.9037904, -1.816275, -2.057997, 0, 0, 0, 1, 1,
-0.9033106, 2.09146, -1.017855, 0, 0, 0, 1, 1,
-0.90236, 0.9429747, -1.561325, 0, 0, 0, 1, 1,
-0.8998808, -0.5079073, -3.006034, 0, 0, 0, 1, 1,
-0.8908001, 1.215863, -0.7799454, 1, 1, 1, 1, 1,
-0.8818833, 1.638414, -0.06965537, 1, 1, 1, 1, 1,
-0.8774332, 0.3344333, -1.21285, 1, 1, 1, 1, 1,
-0.8747313, -0.1726569, -0.6287273, 1, 1, 1, 1, 1,
-0.8741327, 0.01536703, -2.054236, 1, 1, 1, 1, 1,
-0.8681103, 0.2603548, -1.229243, 1, 1, 1, 1, 1,
-0.8585737, 0.3897289, -1.864867, 1, 1, 1, 1, 1,
-0.8563352, 1.886621, 1.913544, 1, 1, 1, 1, 1,
-0.8512556, 0.6546118, 0.2222517, 1, 1, 1, 1, 1,
-0.8492938, 1.094294, -0.3633235, 1, 1, 1, 1, 1,
-0.8482354, -1.20722, -3.474188, 1, 1, 1, 1, 1,
-0.8478826, -0.8569986, -0.8205006, 1, 1, 1, 1, 1,
-0.8475643, 0.9557652, -0.9470544, 1, 1, 1, 1, 1,
-0.8418496, -0.07307856, -1.165042, 1, 1, 1, 1, 1,
-0.8396654, -0.8279574, -0.7198986, 1, 1, 1, 1, 1,
-0.831363, -0.3001853, -3.140773, 0, 0, 1, 1, 1,
-0.8300895, 0.8202359, 0.5997853, 1, 0, 0, 1, 1,
-0.8280832, -0.2473802, -0.9545667, 1, 0, 0, 1, 1,
-0.8227525, -0.3305632, -2.922107, 1, 0, 0, 1, 1,
-0.8219388, 1.205463, -2.127763, 1, 0, 0, 1, 1,
-0.8190975, -0.9032428, -0.4099288, 1, 0, 0, 1, 1,
-0.8188911, -0.3423818, -0.7885517, 0, 0, 0, 1, 1,
-0.8173655, 0.2780314, -3.638807, 0, 0, 0, 1, 1,
-0.8162662, -1.377047, -1.734475, 0, 0, 0, 1, 1,
-0.8083119, -0.5133966, -1.184976, 0, 0, 0, 1, 1,
-0.8064058, 0.8033855, -2.008878, 0, 0, 0, 1, 1,
-0.7981226, 1.584058, -2.240556, 0, 0, 0, 1, 1,
-0.7958526, -0.1940555, -1.116243, 0, 0, 0, 1, 1,
-0.7956864, 1.111374, 0.2302942, 1, 1, 1, 1, 1,
-0.7953424, -0.9470911, -1.732333, 1, 1, 1, 1, 1,
-0.7924783, -0.6263484, -0.4802856, 1, 1, 1, 1, 1,
-0.7875182, -0.5014613, -0.2633667, 1, 1, 1, 1, 1,
-0.7820395, 0.954728, -2.763873, 1, 1, 1, 1, 1,
-0.7746764, -2.3263, -2.157954, 1, 1, 1, 1, 1,
-0.7660117, 0.4433617, -2.307149, 1, 1, 1, 1, 1,
-0.7608566, 0.4163503, -0.171562, 1, 1, 1, 1, 1,
-0.7596173, -0.9942671, -4.272557, 1, 1, 1, 1, 1,
-0.7572669, -0.7312007, -1.500342, 1, 1, 1, 1, 1,
-0.751576, 0.6620126, -1.955398, 1, 1, 1, 1, 1,
-0.7421479, 1.902749, -0.4919029, 1, 1, 1, 1, 1,
-0.7403079, -0.08835396, -3.403766, 1, 1, 1, 1, 1,
-0.7386203, 1.61506, -1.335631, 1, 1, 1, 1, 1,
-0.7363854, -1.909664, -1.519841, 1, 1, 1, 1, 1,
-0.7350776, 0.2311854, -1.571999, 0, 0, 1, 1, 1,
-0.7298902, -0.04815718, -1.3364, 1, 0, 0, 1, 1,
-0.718958, 0.8127923, -0.07180011, 1, 0, 0, 1, 1,
-0.7163488, -1.788725, -4.409225, 1, 0, 0, 1, 1,
-0.7157735, -1.781341, -2.268832, 1, 0, 0, 1, 1,
-0.7148648, -0.7249625, -1.124205, 1, 0, 0, 1, 1,
-0.711943, 0.5654976, -1.097167, 0, 0, 0, 1, 1,
-0.7076154, 0.2971871, 0.3555628, 0, 0, 0, 1, 1,
-0.7073961, 0.7475686, -0.6067102, 0, 0, 0, 1, 1,
-0.7024333, -1.153954, -1.693997, 0, 0, 0, 1, 1,
-0.6951225, 0.3751991, -0.7497194, 0, 0, 0, 1, 1,
-0.6892164, -0.5771965, -2.507303, 0, 0, 0, 1, 1,
-0.6853994, 1.085985, 0.5203552, 0, 0, 0, 1, 1,
-0.677771, -0.4577328, -2.505621, 1, 1, 1, 1, 1,
-0.6750286, 1.215496, 1.451043, 1, 1, 1, 1, 1,
-0.6740334, 0.8501572, -0.4161599, 1, 1, 1, 1, 1,
-0.6734084, -1.041791, -3.855884, 1, 1, 1, 1, 1,
-0.6666156, 0.3268585, -0.8523552, 1, 1, 1, 1, 1,
-0.658466, -0.994347, -3.245282, 1, 1, 1, 1, 1,
-0.6558095, -0.1360444, -2.453992, 1, 1, 1, 1, 1,
-0.6555379, -0.8658916, -2.222501, 1, 1, 1, 1, 1,
-0.6520575, -0.6124033, -2.794021, 1, 1, 1, 1, 1,
-0.6415881, -0.3678903, -1.154896, 1, 1, 1, 1, 1,
-0.6397417, -0.08987555, -1.923103, 1, 1, 1, 1, 1,
-0.6369975, -0.5131201, -2.696434, 1, 1, 1, 1, 1,
-0.6369375, 0.8131765, -1.622824, 1, 1, 1, 1, 1,
-0.6358078, -0.7361966, -3.576221, 1, 1, 1, 1, 1,
-0.6289951, -0.4244068, -2.322755, 1, 1, 1, 1, 1,
-0.6204592, -0.3390856, -1.909165, 0, 0, 1, 1, 1,
-0.6171352, -1.300299, -4.268055, 1, 0, 0, 1, 1,
-0.6073285, 1.039891, -0.5704237, 1, 0, 0, 1, 1,
-0.6036443, -0.2988153, -2.867177, 1, 0, 0, 1, 1,
-0.6033742, 2.07587, 0.3194117, 1, 0, 0, 1, 1,
-0.599825, -0.1164676, -2.055086, 1, 0, 0, 1, 1,
-0.5992659, 1.182062, 0.7307807, 0, 0, 0, 1, 1,
-0.599041, -2.112986, -2.013117, 0, 0, 0, 1, 1,
-0.5987635, -0.4444902, -1.631959, 0, 0, 0, 1, 1,
-0.598735, -0.212716, 0.1857417, 0, 0, 0, 1, 1,
-0.5977216, 1.207871, -1.129503, 0, 0, 0, 1, 1,
-0.5973462, -0.745884, -1.636066, 0, 0, 0, 1, 1,
-0.5941108, -0.3182282, -1.767, 0, 0, 0, 1, 1,
-0.5892032, -0.08802643, -2.274585, 1, 1, 1, 1, 1,
-0.587609, 0.3528887, -1.399438, 1, 1, 1, 1, 1,
-0.5842644, -0.7157012, -1.856096, 1, 1, 1, 1, 1,
-0.5840533, 1.390656, 0.2693744, 1, 1, 1, 1, 1,
-0.583881, 1.076431, -1.218238, 1, 1, 1, 1, 1,
-0.583203, -0.5520511, -1.805786, 1, 1, 1, 1, 1,
-0.5819278, -0.01211933, -3.257399, 1, 1, 1, 1, 1,
-0.5751911, -0.09186401, -0.9756939, 1, 1, 1, 1, 1,
-0.5737765, 0.4337966, -0.263144, 1, 1, 1, 1, 1,
-0.571453, -0.8262254, -2.338323, 1, 1, 1, 1, 1,
-0.5674444, 3.346471, -1.8255, 1, 1, 1, 1, 1,
-0.5630174, 0.04580364, -0.2570803, 1, 1, 1, 1, 1,
-0.56227, -0.8706322, -3.262298, 1, 1, 1, 1, 1,
-0.5581218, -0.6089868, -1.146763, 1, 1, 1, 1, 1,
-0.5574308, 1.790301, -1.007057, 1, 1, 1, 1, 1,
-0.5532259, -0.02207637, -2.703871, 0, 0, 1, 1, 1,
-0.5508748, 1.65691, -1.207833, 1, 0, 0, 1, 1,
-0.5488905, -0.6239803, -3.16102, 1, 0, 0, 1, 1,
-0.5473489, -1.401996, -2.926316, 1, 0, 0, 1, 1,
-0.5464959, -0.1144972, -2.130058, 1, 0, 0, 1, 1,
-0.5455844, -1.332619, -2.551727, 1, 0, 0, 1, 1,
-0.5444349, 2.395849, -0.2037942, 0, 0, 0, 1, 1,
-0.5431331, 1.571302, 0.8277838, 0, 0, 0, 1, 1,
-0.5425717, -0.2295531, -1.277935, 0, 0, 0, 1, 1,
-0.5415521, -0.8373671, -2.399938, 0, 0, 0, 1, 1,
-0.539261, -1.081146, -2.386667, 0, 0, 0, 1, 1,
-0.538833, -1.802962, -3.855417, 0, 0, 0, 1, 1,
-0.537798, 0.03591186, -1.592021, 0, 0, 0, 1, 1,
-0.5357791, 0.6818196, -0.8348901, 1, 1, 1, 1, 1,
-0.5319025, 0.2030324, -0.08497448, 1, 1, 1, 1, 1,
-0.529517, -0.6926522, -2.550118, 1, 1, 1, 1, 1,
-0.5282852, 0.5897842, -1.319039, 1, 1, 1, 1, 1,
-0.5269546, 1.556286, -0.5231245, 1, 1, 1, 1, 1,
-0.5263455, -1.044454, -0.150614, 1, 1, 1, 1, 1,
-0.5241455, 0.1166714, -0.392197, 1, 1, 1, 1, 1,
-0.5233731, -1.30642, -2.724726, 1, 1, 1, 1, 1,
-0.5195232, -0.1930437, -1.915309, 1, 1, 1, 1, 1,
-0.518769, -0.4717506, -1.876484, 1, 1, 1, 1, 1,
-0.5181912, 0.8348594, 0.7514573, 1, 1, 1, 1, 1,
-0.508553, 0.818743, 1.350484, 1, 1, 1, 1, 1,
-0.5056087, -0.9278083, -4.252039, 1, 1, 1, 1, 1,
-0.5049614, 1.316109, -0.03903029, 1, 1, 1, 1, 1,
-0.5047957, 0.6685002, 0.9505135, 1, 1, 1, 1, 1,
-0.4950442, 1.690682, 0.3922718, 0, 0, 1, 1, 1,
-0.4932429, -0.4106769, -0.7929934, 1, 0, 0, 1, 1,
-0.4911135, 1.162757, 0.2492272, 1, 0, 0, 1, 1,
-0.4903115, -0.1182688, -3.14163, 1, 0, 0, 1, 1,
-0.4895362, -1.917072, -2.697117, 1, 0, 0, 1, 1,
-0.4875645, 1.350815, -0.2617227, 1, 0, 0, 1, 1,
-0.4830234, 0.522175, -0.8434502, 0, 0, 0, 1, 1,
-0.4824054, -1.182138, -2.500405, 0, 0, 0, 1, 1,
-0.4787596, -1.184351, -2.319086, 0, 0, 0, 1, 1,
-0.4758036, -0.9898204, -1.726886, 0, 0, 0, 1, 1,
-0.4750972, -0.2008009, -0.7293217, 0, 0, 0, 1, 1,
-0.4750747, -0.3084422, -1.009089, 0, 0, 0, 1, 1,
-0.4712133, 1.775771, 0.3006415, 0, 0, 0, 1, 1,
-0.4711033, 0.8363419, -2.345715, 1, 1, 1, 1, 1,
-0.460949, 0.6706326, -0.4993696, 1, 1, 1, 1, 1,
-0.4606326, -1.102611, -2.015087, 1, 1, 1, 1, 1,
-0.4592772, -0.2110486, -0.7775525, 1, 1, 1, 1, 1,
-0.4555122, -0.3389496, -2.330295, 1, 1, 1, 1, 1,
-0.4544927, 0.3223167, -0.3423326, 1, 1, 1, 1, 1,
-0.4542705, 0.1117651, -2.699916, 1, 1, 1, 1, 1,
-0.4532688, -1.942311, -3.288819, 1, 1, 1, 1, 1,
-0.4525585, 1.85608, -0.02948149, 1, 1, 1, 1, 1,
-0.4507173, -0.7822898, -1.704064, 1, 1, 1, 1, 1,
-0.4482625, 0.5772912, 0.5760612, 1, 1, 1, 1, 1,
-0.4467746, 0.06645838, -1.280116, 1, 1, 1, 1, 1,
-0.4441461, -0.9131156, -2.412912, 1, 1, 1, 1, 1,
-0.4439427, 0.855066, 0.3984834, 1, 1, 1, 1, 1,
-0.4412628, -0.6259193, -3.20557, 1, 1, 1, 1, 1,
-0.4359784, -0.2609092, -2.362897, 0, 0, 1, 1, 1,
-0.4339208, 0.7395427, -2.594573, 1, 0, 0, 1, 1,
-0.4250885, 0.3296825, -2.63774, 1, 0, 0, 1, 1,
-0.423098, -1.48034, -4.097494, 1, 0, 0, 1, 1,
-0.4165598, 1.846563, -1.089246, 1, 0, 0, 1, 1,
-0.4161293, 0.1642721, -2.253947, 1, 0, 0, 1, 1,
-0.415406, -1.398236, -3.449074, 0, 0, 0, 1, 1,
-0.414454, -0.008892138, -2.93229, 0, 0, 0, 1, 1,
-0.4116862, -1.586253, -2.170568, 0, 0, 0, 1, 1,
-0.4110892, 0.3729673, -1.842588, 0, 0, 0, 1, 1,
-0.4076464, 0.7326176, -1.924279, 0, 0, 0, 1, 1,
-0.4052784, -0.4414896, -1.270957, 0, 0, 0, 1, 1,
-0.4022487, -0.06365956, -0.6038325, 0, 0, 0, 1, 1,
-0.4011351, -1.455175, -1.645522, 1, 1, 1, 1, 1,
-0.3999263, -1.363046, -2.835601, 1, 1, 1, 1, 1,
-0.3987515, -1.177656, -3.346519, 1, 1, 1, 1, 1,
-0.3945474, 0.4794957, 0.3649168, 1, 1, 1, 1, 1,
-0.3935341, -0.4961485, -2.690251, 1, 1, 1, 1, 1,
-0.3934596, -1.118614, -4.433017, 1, 1, 1, 1, 1,
-0.3878334, 0.903869, 0.3204218, 1, 1, 1, 1, 1,
-0.386296, 0.7621849, -0.2975042, 1, 1, 1, 1, 1,
-0.3790788, 0.1940372, -4.314034, 1, 1, 1, 1, 1,
-0.3777953, -0.3534465, -2.885418, 1, 1, 1, 1, 1,
-0.3695003, -0.4570302, -1.156308, 1, 1, 1, 1, 1,
-0.3658772, 0.2302867, 1.492308, 1, 1, 1, 1, 1,
-0.3642105, 0.07895324, -2.481031, 1, 1, 1, 1, 1,
-0.3639051, -0.4166441, -4.899918, 1, 1, 1, 1, 1,
-0.3618559, -1.400626, -1.998323, 1, 1, 1, 1, 1,
-0.3616521, 0.3150586, -1.87977, 0, 0, 1, 1, 1,
-0.3606806, -0.4296303, -1.143753, 1, 0, 0, 1, 1,
-0.3598982, -0.1320707, -1.373384, 1, 0, 0, 1, 1,
-0.3590055, 1.267827, -1.245333, 1, 0, 0, 1, 1,
-0.357749, -0.4302695, -1.153405, 1, 0, 0, 1, 1,
-0.3560218, -0.6497038, -3.696037, 1, 0, 0, 1, 1,
-0.3553343, -1.15993, -2.344846, 0, 0, 0, 1, 1,
-0.3548026, -1.415842, -1.457224, 0, 0, 0, 1, 1,
-0.3535987, 0.1903937, -0.3976207, 0, 0, 0, 1, 1,
-0.3527493, 0.5365045, -2.239395, 0, 0, 0, 1, 1,
-0.3508391, -0.3653393, -2.058468, 0, 0, 0, 1, 1,
-0.3499723, -1.363945, -2.875767, 0, 0, 0, 1, 1,
-0.3496695, -0.4806722, -2.618841, 0, 0, 0, 1, 1,
-0.3491519, 0.6916913, -1.709787, 1, 1, 1, 1, 1,
-0.3464642, -2.355222, -3.877222, 1, 1, 1, 1, 1,
-0.3461187, 0.5704486, 0.3233187, 1, 1, 1, 1, 1,
-0.3432158, -0.268986, -2.616853, 1, 1, 1, 1, 1,
-0.3411901, 0.924673, -0.3076727, 1, 1, 1, 1, 1,
-0.3407739, 1.077406, -0.7252467, 1, 1, 1, 1, 1,
-0.3343599, 1.348052, -0.3839526, 1, 1, 1, 1, 1,
-0.3341524, 0.6885219, -1.936237, 1, 1, 1, 1, 1,
-0.331997, 0.104321, 0.1565532, 1, 1, 1, 1, 1,
-0.3317094, -1.401674, -2.891972, 1, 1, 1, 1, 1,
-0.3289973, 0.1103835, -1.941539, 1, 1, 1, 1, 1,
-0.3264289, -1.16655, -4.823075, 1, 1, 1, 1, 1,
-0.3243749, 0.5365598, -0.4638638, 1, 1, 1, 1, 1,
-0.3236379, -0.2892414, -0.7155893, 1, 1, 1, 1, 1,
-0.3235597, -0.5076741, -2.392354, 1, 1, 1, 1, 1,
-0.3172371, -0.1285129, -2.96081, 0, 0, 1, 1, 1,
-0.3108321, -1.157095, -2.657521, 1, 0, 0, 1, 1,
-0.3044391, -0.6231117, -1.746432, 1, 0, 0, 1, 1,
-0.3027541, 0.183562, -0.9824775, 1, 0, 0, 1, 1,
-0.3024326, 0.4897236, -1.407506, 1, 0, 0, 1, 1,
-0.3017297, -0.3534129, -2.999943, 1, 0, 0, 1, 1,
-0.2997375, 0.1664315, -0.2401144, 0, 0, 0, 1, 1,
-0.2965339, 1.219278, -1.368222, 0, 0, 0, 1, 1,
-0.2942818, 1.162369, -0.03488095, 0, 0, 0, 1, 1,
-0.292949, -0.09453613, -1.889478, 0, 0, 0, 1, 1,
-0.2913814, -0.0203063, -0.8067862, 0, 0, 0, 1, 1,
-0.2852973, 0.4912308, 0.07759798, 0, 0, 0, 1, 1,
-0.2843261, -2.773352, -1.349829, 0, 0, 0, 1, 1,
-0.2827973, 0.8861092, -0.7179165, 1, 1, 1, 1, 1,
-0.2806234, 0.04111905, -2.249721, 1, 1, 1, 1, 1,
-0.2722491, -1.769767, -3.168412, 1, 1, 1, 1, 1,
-0.2703869, -1.779819, -2.506044, 1, 1, 1, 1, 1,
-0.2676347, -2.28604, -1.985284, 1, 1, 1, 1, 1,
-0.2675423, 0.7717307, -1.762378, 1, 1, 1, 1, 1,
-0.2671295, -0.1636532, -2.50446, 1, 1, 1, 1, 1,
-0.2670939, 0.6205384, -0.4681769, 1, 1, 1, 1, 1,
-0.2669834, 0.558349, -1.158915, 1, 1, 1, 1, 1,
-0.2669562, 1.043279, 0.1430125, 1, 1, 1, 1, 1,
-0.2660884, 0.1896159, -2.727965, 1, 1, 1, 1, 1,
-0.2657387, 1.321929, 1.35529, 1, 1, 1, 1, 1,
-0.2602042, -2.139397, -3.182358, 1, 1, 1, 1, 1,
-0.2586554, 0.4202579, -1.465314, 1, 1, 1, 1, 1,
-0.2567427, 0.7053583, -1.126658, 1, 1, 1, 1, 1,
-0.2534357, -0.7217224, -3.808175, 0, 0, 1, 1, 1,
-0.2492321, -1.909085, -0.4505244, 1, 0, 0, 1, 1,
-0.2488247, 0.8800088, -0.3278141, 1, 0, 0, 1, 1,
-0.2434307, 0.3765649, -2.729644, 1, 0, 0, 1, 1,
-0.2401091, -0.1182041, -1.546289, 1, 0, 0, 1, 1,
-0.2350576, -0.04564642, -1.842772, 1, 0, 0, 1, 1,
-0.234372, 0.6342252, -0.2250879, 0, 0, 0, 1, 1,
-0.2318877, 0.2872511, -2.04819, 0, 0, 0, 1, 1,
-0.2317945, -0.6119753, -3.08809, 0, 0, 0, 1, 1,
-0.231326, -0.74823, -1.21337, 0, 0, 0, 1, 1,
-0.2294325, 0.3412953, -1.541967, 0, 0, 0, 1, 1,
-0.2285615, -1.016119, -4.343898, 0, 0, 0, 1, 1,
-0.2276334, 0.1205547, -0.2374835, 0, 0, 0, 1, 1,
-0.2257084, 1.861393, -0.6198372, 1, 1, 1, 1, 1,
-0.2250569, 0.2794652, 0.6197135, 1, 1, 1, 1, 1,
-0.2214584, 0.8260245, -0.6806613, 1, 1, 1, 1, 1,
-0.2179015, -0.01079558, -0.892117, 1, 1, 1, 1, 1,
-0.2176938, -0.3198198, -3.224387, 1, 1, 1, 1, 1,
-0.215568, -0.9047927, -1.102684, 1, 1, 1, 1, 1,
-0.2138437, 1.319283, 2.090388, 1, 1, 1, 1, 1,
-0.2108188, 0.1427027, 0.3132735, 1, 1, 1, 1, 1,
-0.2045169, -0.7330159, -2.649397, 1, 1, 1, 1, 1,
-0.1957032, -0.6915838, -4.484587, 1, 1, 1, 1, 1,
-0.1956658, 0.6248139, -1.245173, 1, 1, 1, 1, 1,
-0.1941628, 0.6860775, 0.07376398, 1, 1, 1, 1, 1,
-0.1893055, -0.3446535, -3.073124, 1, 1, 1, 1, 1,
-0.1872669, -1.38582, -3.851778, 1, 1, 1, 1, 1,
-0.1851221, -1.577736, -4.54532, 1, 1, 1, 1, 1,
-0.1826974, -1.657713, -2.946927, 0, 0, 1, 1, 1,
-0.1808203, -1.279471, -1.141759, 1, 0, 0, 1, 1,
-0.1705357, 2.557872, 0.8118108, 1, 0, 0, 1, 1,
-0.1691623, 1.643925, 0.3651085, 1, 0, 0, 1, 1,
-0.1672138, -1.453361, -3.737811, 1, 0, 0, 1, 1,
-0.1668473, -1.053993, -1.003181, 1, 0, 0, 1, 1,
-0.1602985, 0.5732206, 1.26016, 0, 0, 0, 1, 1,
-0.1598836, -0.5520304, -2.641962, 0, 0, 0, 1, 1,
-0.1594041, -1.351646, -1.80395, 0, 0, 0, 1, 1,
-0.1587688, 1.389525, 1.119682, 0, 0, 0, 1, 1,
-0.1566143, -0.8201559, -1.716032, 0, 0, 0, 1, 1,
-0.1523024, -0.4847853, -2.907342, 0, 0, 0, 1, 1,
-0.1516914, -0.3886235, -3.596205, 0, 0, 0, 1, 1,
-0.1495517, -1.205823, -1.496123, 1, 1, 1, 1, 1,
-0.1456174, 1.83407, 0.1559418, 1, 1, 1, 1, 1,
-0.1438713, 0.001353851, -0.3791861, 1, 1, 1, 1, 1,
-0.1435541, 1.047983, -1.120093, 1, 1, 1, 1, 1,
-0.1381394, 1.448259, -0.04930765, 1, 1, 1, 1, 1,
-0.1309737, -0.9555722, -4.472356, 1, 1, 1, 1, 1,
-0.1303585, -0.2644393, -1.21009, 1, 1, 1, 1, 1,
-0.1276766, 0.4123469, 0.1413704, 1, 1, 1, 1, 1,
-0.127665, 0.1073708, 1.40079, 1, 1, 1, 1, 1,
-0.1275014, -0.9388731, -4.505752, 1, 1, 1, 1, 1,
-0.1261054, -0.04414426, 0.4916078, 1, 1, 1, 1, 1,
-0.1208614, 1.037566, -1.76883, 1, 1, 1, 1, 1,
-0.1200334, -0.3514086, -1.697876, 1, 1, 1, 1, 1,
-0.1192759, -0.8753875, -3.359197, 1, 1, 1, 1, 1,
-0.1157467, -0.5733013, -0.8699377, 1, 1, 1, 1, 1,
-0.1152879, 0.2826119, -1.726795, 0, 0, 1, 1, 1,
-0.1139173, 0.9139428, -0.8504972, 1, 0, 0, 1, 1,
-0.1107641, 1.045799, -0.002650678, 1, 0, 0, 1, 1,
-0.1086186, -0.4664901, -1.771384, 1, 0, 0, 1, 1,
-0.1049007, 0.2765252, -0.7461894, 1, 0, 0, 1, 1,
-0.103861, -3.19448, -2.677938, 1, 0, 0, 1, 1,
-0.1025109, -0.8135063, -4.690656, 0, 0, 0, 1, 1,
-0.1011233, 0.3915192, 0.5682513, 0, 0, 0, 1, 1,
-0.09475688, 0.2136728, -0.7998053, 0, 0, 0, 1, 1,
-0.09361016, -0.3588448, -2.580121, 0, 0, 0, 1, 1,
-0.09202157, -0.3643743, -2.538695, 0, 0, 0, 1, 1,
-0.09013245, 0.2037521, 0.6171445, 0, 0, 0, 1, 1,
-0.08299485, 0.2262592, -1.152098, 0, 0, 0, 1, 1,
-0.08217271, 0.3208393, -0.9191312, 1, 1, 1, 1, 1,
-0.08049462, 0.04452649, -1.262793, 1, 1, 1, 1, 1,
-0.0770438, 0.4641455, 1.216684, 1, 1, 1, 1, 1,
-0.07700202, -0.4231113, -1.275742, 1, 1, 1, 1, 1,
-0.07521126, -0.744429, -1.785248, 1, 1, 1, 1, 1,
-0.07021872, -0.3248391, -4.073668, 1, 1, 1, 1, 1,
-0.07021688, -0.3059217, -3.470294, 1, 1, 1, 1, 1,
-0.07018133, 1.853306, 0.01873606, 1, 1, 1, 1, 1,
-0.06747817, 1.064659, -0.5609775, 1, 1, 1, 1, 1,
-0.06687958, -0.6143309, -4.849315, 1, 1, 1, 1, 1,
-0.06537887, -0.001293035, -3.203321, 1, 1, 1, 1, 1,
-0.0653055, 0.6141424, 2.016012, 1, 1, 1, 1, 1,
-0.06375412, -0.3681892, -4.643644, 1, 1, 1, 1, 1,
-0.05687665, -0.5654785, -3.71735, 1, 1, 1, 1, 1,
-0.05403172, 0.9976577, 0.9448276, 1, 1, 1, 1, 1,
-0.05217953, -0.5031466, -4.561158, 0, 0, 1, 1, 1,
-0.05147212, -0.664375, -2.408552, 1, 0, 0, 1, 1,
-0.04332086, -0.3122874, -3.522961, 1, 0, 0, 1, 1,
-0.04317616, -0.7330167, -2.73825, 1, 0, 0, 1, 1,
-0.040459, -0.5186701, -3.592459, 1, 0, 0, 1, 1,
-0.03824874, -1.776965, -2.096195, 1, 0, 0, 1, 1,
-0.03716923, -0.09219385, -2.180179, 0, 0, 0, 1, 1,
-0.03646474, -0.1777939, -1.218835, 0, 0, 0, 1, 1,
-0.03171811, -1.824249, -2.307171, 0, 0, 0, 1, 1,
-0.02512432, 0.7525476, -0.5283826, 0, 0, 0, 1, 1,
-0.01931882, -1.74852, -2.315475, 0, 0, 0, 1, 1,
-0.01725811, 0.5611672, -0.1720076, 0, 0, 0, 1, 1,
-0.01230967, -0.1819194, -3.014219, 0, 0, 0, 1, 1,
-0.009790699, -1.09678, -2.89338, 1, 1, 1, 1, 1,
-0.00207264, -0.5671092, -3.27362, 1, 1, 1, 1, 1,
0.001607942, 1.514202, 0.9641773, 1, 1, 1, 1, 1,
0.003935244, -0.4045516, 2.363297, 1, 1, 1, 1, 1,
0.01093246, 0.2570903, 1.744041, 1, 1, 1, 1, 1,
0.01167784, -1.503544, 2.647691, 1, 1, 1, 1, 1,
0.01433535, -2.781221, 3.682359, 1, 1, 1, 1, 1,
0.01706485, -1.786175, 2.460085, 1, 1, 1, 1, 1,
0.01731218, 2.716591, 0.06531572, 1, 1, 1, 1, 1,
0.01836496, 1.265539, 0.09291594, 1, 1, 1, 1, 1,
0.0225854, 0.5906461, -0.676816, 1, 1, 1, 1, 1,
0.02425611, -1.062793, 2.770747, 1, 1, 1, 1, 1,
0.02628755, 1.100747, 1.973495, 1, 1, 1, 1, 1,
0.02642787, -2.221535, 1.998376, 1, 1, 1, 1, 1,
0.02820251, 0.4096493, -2.019018, 1, 1, 1, 1, 1,
0.03313607, -1.213731, 2.361319, 0, 0, 1, 1, 1,
0.03463389, 0.02768363, 0.00120361, 1, 0, 0, 1, 1,
0.03471771, 0.2496488, 0.8855169, 1, 0, 0, 1, 1,
0.03662487, -1.414871, 3.694539, 1, 0, 0, 1, 1,
0.03792803, -0.5070297, 3.266005, 1, 0, 0, 1, 1,
0.0443534, 1.426645, 0.6416473, 1, 0, 0, 1, 1,
0.04603646, -0.4466032, 2.625034, 0, 0, 0, 1, 1,
0.04690517, 0.08302891, 0.02436155, 0, 0, 0, 1, 1,
0.04743405, 0.901315, -1.020406, 0, 0, 0, 1, 1,
0.05099475, 0.1433017, 1.718299, 0, 0, 0, 1, 1,
0.05894997, -0.5417818, 2.947984, 0, 0, 0, 1, 1,
0.0618838, -1.162586, 3.075953, 0, 0, 0, 1, 1,
0.06322698, -1.019413, 4.199445, 0, 0, 0, 1, 1,
0.06477104, -0.4697099, 4.433028, 1, 1, 1, 1, 1,
0.06657373, 0.5264395, 0.7431269, 1, 1, 1, 1, 1,
0.06912652, 0.1911788, -1.086735, 1, 1, 1, 1, 1,
0.0697978, -0.1234419, 0.5751061, 1, 1, 1, 1, 1,
0.07044608, 0.04112918, 2.324942, 1, 1, 1, 1, 1,
0.07077467, -0.2012103, 3.974242, 1, 1, 1, 1, 1,
0.07244129, -0.2962965, 1.274037, 1, 1, 1, 1, 1,
0.07438134, -0.3840462, 3.738456, 1, 1, 1, 1, 1,
0.07486329, -0.490991, 3.11096, 1, 1, 1, 1, 1,
0.07492051, 0.7302381, 0.535215, 1, 1, 1, 1, 1,
0.07603672, -0.04682206, 3.526651, 1, 1, 1, 1, 1,
0.07637759, -0.7857453, 3.655132, 1, 1, 1, 1, 1,
0.07678409, -0.823194, 3.799937, 1, 1, 1, 1, 1,
0.07913134, -0.5981317, 3.561198, 1, 1, 1, 1, 1,
0.08627409, 0.196086, -0.1177582, 1, 1, 1, 1, 1,
0.09063086, -1.66254, 2.516296, 0, 0, 1, 1, 1,
0.09242381, 0.3281707, -0.8473746, 1, 0, 0, 1, 1,
0.09363367, 1.645449, 1.488294, 1, 0, 0, 1, 1,
0.0974328, 0.7457353, -0.6287514, 1, 0, 0, 1, 1,
0.1017031, -0.6949331, 3.816671, 1, 0, 0, 1, 1,
0.1025481, -0.5162493, 3.583505, 1, 0, 0, 1, 1,
0.1074195, -0.08894711, 2.261438, 0, 0, 0, 1, 1,
0.1174351, 0.1344954, -1.326645, 0, 0, 0, 1, 1,
0.1188563, 0.8194555, -0.4650637, 0, 0, 0, 1, 1,
0.1193098, -0.3313458, 1.054939, 0, 0, 0, 1, 1,
0.1234117, -0.2968956, 3.866493, 0, 0, 0, 1, 1,
0.1238488, 0.4697551, -0.02459313, 0, 0, 0, 1, 1,
0.1277041, 0.1180662, 0.07829866, 0, 0, 0, 1, 1,
0.133031, 0.7291447, 0.1455462, 1, 1, 1, 1, 1,
0.1342108, -0.6769087, 3.428909, 1, 1, 1, 1, 1,
0.1346157, -0.3665596, 1.974605, 1, 1, 1, 1, 1,
0.1348742, -0.6682191, 1.769877, 1, 1, 1, 1, 1,
0.1411794, 1.306712, 0.7335825, 1, 1, 1, 1, 1,
0.1421178, -2.41282, 1.084028, 1, 1, 1, 1, 1,
0.1444819, -1.327767, 2.483358, 1, 1, 1, 1, 1,
0.1460602, -0.2191007, 3.085075, 1, 1, 1, 1, 1,
0.1543989, -0.1518392, 3.271255, 1, 1, 1, 1, 1,
0.1556801, 0.1909692, -0.4097764, 1, 1, 1, 1, 1,
0.1597536, -2.273638, 3.495033, 1, 1, 1, 1, 1,
0.1652067, -1.007911, 2.099825, 1, 1, 1, 1, 1,
0.1658049, -1.043489, 1.83488, 1, 1, 1, 1, 1,
0.1675293, 0.6814701, 0.1740293, 1, 1, 1, 1, 1,
0.1708997, 0.3498714, 1.015487, 1, 1, 1, 1, 1,
0.1740746, -0.4087465, 3.311363, 0, 0, 1, 1, 1,
0.1802747, -0.52309, 2.38904, 1, 0, 0, 1, 1,
0.1860968, -0.4187476, 2.925817, 1, 0, 0, 1, 1,
0.1862596, -2.047701, 1.983431, 1, 0, 0, 1, 1,
0.1895083, -0.5607851, 3.443009, 1, 0, 0, 1, 1,
0.1917598, 0.1106564, 0.7451459, 1, 0, 0, 1, 1,
0.1921219, -0.4520001, 4.532631, 0, 0, 0, 1, 1,
0.1959049, -0.7317932, 2.02768, 0, 0, 0, 1, 1,
0.1974441, -0.9924862, 4.020146, 0, 0, 0, 1, 1,
0.1976928, 0.3503259, 1.528618, 0, 0, 0, 1, 1,
0.1993397, -1.468378, 3.041707, 0, 0, 0, 1, 1,
0.2033975, -0.8450913, 2.546238, 0, 0, 0, 1, 1,
0.2132194, 0.864516, -1.829519, 0, 0, 0, 1, 1,
0.2186186, 0.8138081, 0.9922431, 1, 1, 1, 1, 1,
0.2241167, -1.07633, 2.20366, 1, 1, 1, 1, 1,
0.2270504, -1.046845, 3.860455, 1, 1, 1, 1, 1,
0.2275568, 0.378952, 2.027517, 1, 1, 1, 1, 1,
0.2319024, 0.08886499, 1.500445, 1, 1, 1, 1, 1,
0.2370824, 1.72046, -0.2032073, 1, 1, 1, 1, 1,
0.2552369, -0.3408895, 3.476795, 1, 1, 1, 1, 1,
0.2596805, -0.8864491, 4.762006, 1, 1, 1, 1, 1,
0.2600153, 1.530699, -0.142843, 1, 1, 1, 1, 1,
0.2605089, 0.9736363, 1.148471, 1, 1, 1, 1, 1,
0.2651995, -0.6682167, 2.290673, 1, 1, 1, 1, 1,
0.2671588, -1.830757, 2.349496, 1, 1, 1, 1, 1,
0.2671734, -0.2166429, 4.25048, 1, 1, 1, 1, 1,
0.2709749, 0.8514726, 0.6223435, 1, 1, 1, 1, 1,
0.2743748, -0.3195067, 2.267049, 1, 1, 1, 1, 1,
0.2749316, 0.8991348, 0.1815179, 0, 0, 1, 1, 1,
0.276113, 1.167128, 1.01795, 1, 0, 0, 1, 1,
0.2777234, 0.922466, 0.8473418, 1, 0, 0, 1, 1,
0.2800092, -0.4564102, 2.77168, 1, 0, 0, 1, 1,
0.286762, 1.70024, 1.109105, 1, 0, 0, 1, 1,
0.2932588, -0.1321399, 3.283952, 1, 0, 0, 1, 1,
0.2950175, 0.5122656, 1.317938, 0, 0, 0, 1, 1,
0.2965486, -0.8856047, 1.943498, 0, 0, 0, 1, 1,
0.3018905, 1.423422, -0.1281101, 0, 0, 0, 1, 1,
0.3034327, 0.8257336, 0.4827705, 0, 0, 0, 1, 1,
0.3070213, -1.73842, 2.721493, 0, 0, 0, 1, 1,
0.3071837, 0.1336036, 1.613169, 0, 0, 0, 1, 1,
0.3139461, -0.3344094, 2.201829, 0, 0, 0, 1, 1,
0.321114, 0.4806849, 0.8216589, 1, 1, 1, 1, 1,
0.3275824, -0.2637826, 0.3254251, 1, 1, 1, 1, 1,
0.3293632, -0.1107016, 2.349297, 1, 1, 1, 1, 1,
0.3322622, -1.833257, 4.315564, 1, 1, 1, 1, 1,
0.3323786, -1.124648, 3.678454, 1, 1, 1, 1, 1,
0.3348698, 0.9327661, 1.351647, 1, 1, 1, 1, 1,
0.3455101, 1.258331, 1.560013, 1, 1, 1, 1, 1,
0.3567483, -0.3250586, 2.129296, 1, 1, 1, 1, 1,
0.3589675, 1.196951, -1.29654, 1, 1, 1, 1, 1,
0.3625516, 0.7711094, -0.6504449, 1, 1, 1, 1, 1,
0.3646083, -1.463722, 1.959794, 1, 1, 1, 1, 1,
0.3710485, -1.059376, 3.548736, 1, 1, 1, 1, 1,
0.3716938, 0.4168633, 1.589032, 1, 1, 1, 1, 1,
0.3752097, 0.6255814, 0.3717396, 1, 1, 1, 1, 1,
0.3760642, 1.251566, -0.5525155, 1, 1, 1, 1, 1,
0.3784694, -0.7329882, 4.103439, 0, 0, 1, 1, 1,
0.3813215, -1.257951, 2.127398, 1, 0, 0, 1, 1,
0.381543, -1.824472, 4.667733, 1, 0, 0, 1, 1,
0.3869157, -0.2226365, 1.593296, 1, 0, 0, 1, 1,
0.3900866, -0.9308855, 3.294152, 1, 0, 0, 1, 1,
0.3929318, -1.45813, 3.149593, 1, 0, 0, 1, 1,
0.3944875, 0.860133, 1.066498, 0, 0, 0, 1, 1,
0.3967111, -0.6907286, 1.949018, 0, 0, 0, 1, 1,
0.3975484, -0.1279221, 1.831215, 0, 0, 0, 1, 1,
0.4018712, -0.3260656, 3.225714, 0, 0, 0, 1, 1,
0.4030063, -0.4699165, 2.266994, 0, 0, 0, 1, 1,
0.4032255, -0.321707, 2.017769, 0, 0, 0, 1, 1,
0.4080314, -0.4252932, 2.705961, 0, 0, 0, 1, 1,
0.4084306, 1.209895, 0.03382517, 1, 1, 1, 1, 1,
0.409003, -1.382977, 3.644565, 1, 1, 1, 1, 1,
0.418992, 0.5124205, 2.840814, 1, 1, 1, 1, 1,
0.4208044, 0.9409288, -0.8681877, 1, 1, 1, 1, 1,
0.4255925, 0.4908703, 1.981017, 1, 1, 1, 1, 1,
0.4262478, -0.1439706, 2.519616, 1, 1, 1, 1, 1,
0.4312918, -0.2657191, 2.787044, 1, 1, 1, 1, 1,
0.4343347, -1.610854, 2.676773, 1, 1, 1, 1, 1,
0.4344043, 0.5940834, -0.1833811, 1, 1, 1, 1, 1,
0.4347729, -0.2423891, 2.594722, 1, 1, 1, 1, 1,
0.442844, 0.05743904, 3.687466, 1, 1, 1, 1, 1,
0.4448043, -2.072196, 2.372041, 1, 1, 1, 1, 1,
0.4481262, -1.647867, 3.86827, 1, 1, 1, 1, 1,
0.4524725, -1.531091, 2.874482, 1, 1, 1, 1, 1,
0.4627368, -0.9078242, 3.331727, 1, 1, 1, 1, 1,
0.4638756, -1.018179, 0.7567381, 0, 0, 1, 1, 1,
0.4649915, -1.791385, 3.367743, 1, 0, 0, 1, 1,
0.4674921, 0.5738807, 0.3101046, 1, 0, 0, 1, 1,
0.4684991, 0.8855074, 0.5694371, 1, 0, 0, 1, 1,
0.4700687, -0.6132153, 2.046503, 1, 0, 0, 1, 1,
0.4716304, 0.1083985, 0.7402942, 1, 0, 0, 1, 1,
0.4719187, -2.763988, 1.901848, 0, 0, 0, 1, 1,
0.472842, 0.949265, 0.114153, 0, 0, 0, 1, 1,
0.4732526, -2.137191, 4.690233, 0, 0, 0, 1, 1,
0.476202, 0.563527, 1.537671, 0, 0, 0, 1, 1,
0.4775798, 1.209661, -0.04655169, 0, 0, 0, 1, 1,
0.4788498, 0.6259056, -0.5092185, 0, 0, 0, 1, 1,
0.4799987, -0.07692525, 2.056754, 0, 0, 0, 1, 1,
0.4813581, -1.291261, 2.424956, 1, 1, 1, 1, 1,
0.4931586, -1.18964, 1.889583, 1, 1, 1, 1, 1,
0.4949464, -1.76914, 1.719741, 1, 1, 1, 1, 1,
0.4962173, -0.1448304, 0.3354294, 1, 1, 1, 1, 1,
0.4981274, -0.7478233, 2.602686, 1, 1, 1, 1, 1,
0.5004849, -0.4729005, 2.024773, 1, 1, 1, 1, 1,
0.5027228, -1.599883, 2.547532, 1, 1, 1, 1, 1,
0.5168972, 0.8088177, 1.839999, 1, 1, 1, 1, 1,
0.5169688, 1.935935, 0.2218931, 1, 1, 1, 1, 1,
0.5173182, 1.686273, 0.1314778, 1, 1, 1, 1, 1,
0.5292403, -1.331946, 3.823835, 1, 1, 1, 1, 1,
0.5331713, 0.1865911, 0.4122052, 1, 1, 1, 1, 1,
0.5365863, 0.2200575, 0.1612561, 1, 1, 1, 1, 1,
0.5367551, 0.650503, 1.613574, 1, 1, 1, 1, 1,
0.5414501, -1.457479, 4.249402, 1, 1, 1, 1, 1,
0.5421689, 0.5400202, 0.330393, 0, 0, 1, 1, 1,
0.5442697, 0.5768305, 1.072034, 1, 0, 0, 1, 1,
0.5443176, -0.4028316, 3.069039, 1, 0, 0, 1, 1,
0.5461131, -0.4833341, 1.50253, 1, 0, 0, 1, 1,
0.5518425, 0.07260899, 1.449442, 1, 0, 0, 1, 1,
0.5524815, 1.026038, 0.5270438, 1, 0, 0, 1, 1,
0.5545071, 0.518191, 1.018748, 0, 0, 0, 1, 1,
0.5551628, -0.6132011, 2.170416, 0, 0, 0, 1, 1,
0.5603893, 0.8261437, 1.101521, 0, 0, 0, 1, 1,
0.5614374, 0.9054042, 0.2928275, 0, 0, 0, 1, 1,
0.5645068, 0.6007922, 2.01642, 0, 0, 0, 1, 1,
0.5653263, 0.153298, 2.321079, 0, 0, 0, 1, 1,
0.5675932, 1.076557, 1.325786, 0, 0, 0, 1, 1,
0.5683176, -0.8213212, 2.604405, 1, 1, 1, 1, 1,
0.5692199, 0.8470071, -1.087904, 1, 1, 1, 1, 1,
0.5743361, 0.253764, 2.100033, 1, 1, 1, 1, 1,
0.5745161, 0.6930274, 2.267657, 1, 1, 1, 1, 1,
0.5770287, 0.1379621, 1.554174, 1, 1, 1, 1, 1,
0.5776194, -0.838679, 4.013732, 1, 1, 1, 1, 1,
0.5893285, 0.2967968, -0.05805194, 1, 1, 1, 1, 1,
0.5898061, -0.6147212, 2.559486, 1, 1, 1, 1, 1,
0.596001, -0.8077285, 5.491918, 1, 1, 1, 1, 1,
0.5973159, -0.5330799, 2.822163, 1, 1, 1, 1, 1,
0.5978381, 0.03859152, 1.5774, 1, 1, 1, 1, 1,
0.6033967, 0.7504058, -0.1182995, 1, 1, 1, 1, 1,
0.603563, 0.01033149, 1.653581, 1, 1, 1, 1, 1,
0.6061637, -1.067329, 1.242074, 1, 1, 1, 1, 1,
0.6070882, -0.04823887, -1.051504, 1, 1, 1, 1, 1,
0.6101287, 1.373571, -0.2400258, 0, 0, 1, 1, 1,
0.6122947, 1.321631, 0.824317, 1, 0, 0, 1, 1,
0.6171773, -1.165743, 2.494058, 1, 0, 0, 1, 1,
0.6176371, 0.4693012, -1.573941, 1, 0, 0, 1, 1,
0.6203554, 1.996325, -0.03999648, 1, 0, 0, 1, 1,
0.6241248, 1.116534, 0.09501696, 1, 0, 0, 1, 1,
0.6284325, 1.567141, -0.8930522, 0, 0, 0, 1, 1,
0.6316215, 0.9653158, 0.3859616, 0, 0, 0, 1, 1,
0.6319511, 0.3085082, 1.232185, 0, 0, 0, 1, 1,
0.6358976, 1.043143, 0.7579316, 0, 0, 0, 1, 1,
0.6368563, -1.481865, 3.012053, 0, 0, 0, 1, 1,
0.6406626, 0.5770844, 2.088645, 0, 0, 0, 1, 1,
0.6411244, 0.8869928, 0.677232, 0, 0, 0, 1, 1,
0.6412491, 1.814601, 1.504552, 1, 1, 1, 1, 1,
0.6424357, -0.5358007, 1.020883, 1, 1, 1, 1, 1,
0.644352, 1.272532, -0.2742116, 1, 1, 1, 1, 1,
0.6463543, 1.273553, -0.7868836, 1, 1, 1, 1, 1,
0.6467941, -1.136755, 0.7704307, 1, 1, 1, 1, 1,
0.6489733, -0.8479334, 3.426603, 1, 1, 1, 1, 1,
0.6496091, -1.486498, 1.850336, 1, 1, 1, 1, 1,
0.6569263, 0.9062222, 2.499511, 1, 1, 1, 1, 1,
0.6573044, -0.4987669, 1.362049, 1, 1, 1, 1, 1,
0.6573868, 0.7823973, 0.2918518, 1, 1, 1, 1, 1,
0.6669777, -2.375788, 2.924578, 1, 1, 1, 1, 1,
0.6677482, -0.6847957, 1.984216, 1, 1, 1, 1, 1,
0.6713154, 0.5257325, 1.359479, 1, 1, 1, 1, 1,
0.6735321, 0.4723746, 2.060158, 1, 1, 1, 1, 1,
0.6743561, 0.7435372, 2.715605, 1, 1, 1, 1, 1,
0.6770267, -0.7070525, 2.573318, 0, 0, 1, 1, 1,
0.6791206, -1.690241, 2.344326, 1, 0, 0, 1, 1,
0.6793873, 0.2686146, 0.7727441, 1, 0, 0, 1, 1,
0.6862399, 1.618577, 0.2440807, 1, 0, 0, 1, 1,
0.6883452, 0.2139341, 3.106052, 1, 0, 0, 1, 1,
0.6911132, 0.1094126, 1.143833, 1, 0, 0, 1, 1,
0.6960238, 1.518651, 1.270838, 0, 0, 0, 1, 1,
0.6981073, 0.8726006, 3.449164, 0, 0, 0, 1, 1,
0.6987209, -0.7451001, 2.90784, 0, 0, 0, 1, 1,
0.7016869, -0.2327974, 3.25648, 0, 0, 0, 1, 1,
0.7035376, -1.93732, 4.156604, 0, 0, 0, 1, 1,
0.7096252, 0.2839395, 0.8351573, 0, 0, 0, 1, 1,
0.7098402, 0.8437465, 0.3381014, 0, 0, 0, 1, 1,
0.7107496, 0.4251291, -0.3398338, 1, 1, 1, 1, 1,
0.7116671, -0.1892425, 1.635178, 1, 1, 1, 1, 1,
0.7142215, -0.7133679, 0.02161474, 1, 1, 1, 1, 1,
0.7161728, 0.2414372, 1.218342, 1, 1, 1, 1, 1,
0.7181208, -0.783072, 4.109775, 1, 1, 1, 1, 1,
0.7208685, 0.1309028, 1.303524, 1, 1, 1, 1, 1,
0.7235246, 1.498647, 0.2526216, 1, 1, 1, 1, 1,
0.7240083, 0.9776848, 0.5638123, 1, 1, 1, 1, 1,
0.7257802, -0.0583368, 0.925721, 1, 1, 1, 1, 1,
0.7262436, 1.565443, 0.1307925, 1, 1, 1, 1, 1,
0.7297673, 1.035339, 0.6707343, 1, 1, 1, 1, 1,
0.7303847, 1.120412, 1.27405, 1, 1, 1, 1, 1,
0.7327418, -0.4651261, 1.998343, 1, 1, 1, 1, 1,
0.7332633, 0.9083319, 0.7637021, 1, 1, 1, 1, 1,
0.7394696, -0.06510197, 1.894487, 1, 1, 1, 1, 1,
0.7402406, -0.6108307, 2.578499, 0, 0, 1, 1, 1,
0.7422342, -0.4083585, 2.381907, 1, 0, 0, 1, 1,
0.7445722, 0.6924388, 1.161344, 1, 0, 0, 1, 1,
0.7453697, -0.2728668, 3.560858, 1, 0, 0, 1, 1,
0.7454771, 0.3928858, 0.7702395, 1, 0, 0, 1, 1,
0.7456868, -0.06628058, 2.00653, 1, 0, 0, 1, 1,
0.7505675, 0.0755498, 0.9549353, 0, 0, 0, 1, 1,
0.7519674, -0.629439, 2.830732, 0, 0, 0, 1, 1,
0.7578201, 0.7306396, 0.1382747, 0, 0, 0, 1, 1,
0.762858, -0.3092465, 2.062715, 0, 0, 0, 1, 1,
0.7691223, 1.341247, 0.3198226, 0, 0, 0, 1, 1,
0.7751169, -0.3858043, 1.024063, 0, 0, 0, 1, 1,
0.7864755, -0.7965068, 2.292993, 0, 0, 0, 1, 1,
0.7874582, 1.358617, -0.4433587, 1, 1, 1, 1, 1,
0.7905418, 0.8907349, 0.08134495, 1, 1, 1, 1, 1,
0.7935467, -1.117878, 2.677914, 1, 1, 1, 1, 1,
0.7953469, 0.3127803, 0.6512331, 1, 1, 1, 1, 1,
0.797226, -1.0531, 1.604508, 1, 1, 1, 1, 1,
0.8011454, 0.2514123, -0.09718756, 1, 1, 1, 1, 1,
0.8030975, 0.01595626, 1.574999, 1, 1, 1, 1, 1,
0.8110006, 0.9292942, 1.477146, 1, 1, 1, 1, 1,
0.8211952, 0.5908244, 2.076022, 1, 1, 1, 1, 1,
0.8228066, 1.547067, 0.1595813, 1, 1, 1, 1, 1,
0.823292, 0.1159594, 1.276888, 1, 1, 1, 1, 1,
0.8268405, 0.1123074, 0.1219673, 1, 1, 1, 1, 1,
0.8276017, 0.2272429, 2.321271, 1, 1, 1, 1, 1,
0.8303836, -0.5749622, 1.954138, 1, 1, 1, 1, 1,
0.831505, 0.6438787, 0.2048745, 1, 1, 1, 1, 1,
0.834296, -0.2470102, 1.954452, 0, 0, 1, 1, 1,
0.8344216, 1.294936, 0.2321941, 1, 0, 0, 1, 1,
0.8357691, -0.758657, 1.533822, 1, 0, 0, 1, 1,
0.8387067, 2.593092, 0.2766019, 1, 0, 0, 1, 1,
0.8404273, -0.1338482, 2.302912, 1, 0, 0, 1, 1,
0.8416511, -3.698975, 3.165421, 1, 0, 0, 1, 1,
0.8471013, -0.5523766, 1.86222, 0, 0, 0, 1, 1,
0.8531347, -0.5770425, 2.253525, 0, 0, 0, 1, 1,
0.8557478, -1.260691, 1.896698, 0, 0, 0, 1, 1,
0.8688112, 0.08401782, 1.865155, 0, 0, 0, 1, 1,
0.8730172, 0.9733717, 0.444141, 0, 0, 0, 1, 1,
0.8733937, -0.5810805, 0.6357381, 0, 0, 0, 1, 1,
0.8774371, 0.7575732, 0.9380584, 0, 0, 0, 1, 1,
0.9041467, 1.1948, 0.02956752, 1, 1, 1, 1, 1,
0.9049273, 0.1969993, 2.991343, 1, 1, 1, 1, 1,
0.9173053, 1.321715, 2.086085, 1, 1, 1, 1, 1,
0.9204929, -0.2007573, 1.7264, 1, 1, 1, 1, 1,
0.9212321, 1.144106, 0.4691665, 1, 1, 1, 1, 1,
0.9299394, -0.2306573, 1.420618, 1, 1, 1, 1, 1,
0.9331398, 0.802277, -0.06352735, 1, 1, 1, 1, 1,
0.9402127, -2.345634, 3.664993, 1, 1, 1, 1, 1,
0.9408818, -1.229957, 1.915889, 1, 1, 1, 1, 1,
0.9419228, 0.8780982, 1.32591, 1, 1, 1, 1, 1,
0.9428021, 0.4906777, 1.578928, 1, 1, 1, 1, 1,
0.9447402, -0.3989913, 4.329637, 1, 1, 1, 1, 1,
0.9450873, 0.2039914, 2.47631, 1, 1, 1, 1, 1,
0.947316, 0.6476325, -0.05092363, 1, 1, 1, 1, 1,
0.947493, -0.6009831, 2.677598, 1, 1, 1, 1, 1,
0.9568778, 0.2671338, 1.004084, 0, 0, 1, 1, 1,
0.9603916, -1.603001, 1.64862, 1, 0, 0, 1, 1,
0.9624877, -0.5111961, 2.034881, 1, 0, 0, 1, 1,
0.9665445, 0.08576697, 3.723215, 1, 0, 0, 1, 1,
0.9667255, 0.2679065, -0.1294991, 1, 0, 0, 1, 1,
0.973366, 1.086932, 0.5147951, 1, 0, 0, 1, 1,
0.9745009, 1.689071, -0.01169737, 0, 0, 0, 1, 1,
0.9766902, -0.2415103, 2.027014, 0, 0, 0, 1, 1,
0.983054, -1.127776, 2.774691, 0, 0, 0, 1, 1,
0.985593, 0.08379848, 0.8835999, 0, 0, 0, 1, 1,
0.9863912, -1.001614, 2.916514, 0, 0, 0, 1, 1,
1.001359, 0.236119, 2.07109, 0, 0, 0, 1, 1,
1.010753, -1.800477, 1.872727, 0, 0, 0, 1, 1,
1.012316, -1.142459, 2.960427, 1, 1, 1, 1, 1,
1.0152, 0.9858993, 1.701677, 1, 1, 1, 1, 1,
1.017766, -0.2987634, 2.036514, 1, 1, 1, 1, 1,
1.020968, 0.1805501, 2.989183, 1, 1, 1, 1, 1,
1.023202, -0.5031533, 3.432209, 1, 1, 1, 1, 1,
1.041883, 0.9633382, 1.566458, 1, 1, 1, 1, 1,
1.04396, 0.6671853, 0.9095473, 1, 1, 1, 1, 1,
1.044866, -1.073424, 1.919129, 1, 1, 1, 1, 1,
1.053263, 1.647351, 2.184371, 1, 1, 1, 1, 1,
1.062425, -0.7647203, 3.150388, 1, 1, 1, 1, 1,
1.065576, -0.1214373, 0.8291736, 1, 1, 1, 1, 1,
1.067646, -1.999009, 3.134447, 1, 1, 1, 1, 1,
1.078302, 0.09019405, 0.5842763, 1, 1, 1, 1, 1,
1.080519, -0.4800383, 3.167186, 1, 1, 1, 1, 1,
1.086028, -1.855568, 1.603426, 1, 1, 1, 1, 1,
1.094478, 0.559219, 3.087646, 0, 0, 1, 1, 1,
1.103601, 0.8367375, 1.001362, 1, 0, 0, 1, 1,
1.105196, -0.9718457, 1.704043, 1, 0, 0, 1, 1,
1.109727, -0.5834039, 3.434831, 1, 0, 0, 1, 1,
1.110865, 0.9554944, 1.354664, 1, 0, 0, 1, 1,
1.126587, 1.421399, 1.256175, 1, 0, 0, 1, 1,
1.129681, 1.606444, -0.7817321, 0, 0, 0, 1, 1,
1.138706, 0.2068633, 1.63026, 0, 0, 0, 1, 1,
1.145802, -0.04184592, 0.1708324, 0, 0, 0, 1, 1,
1.146442, 2.787717, 0.683268, 0, 0, 0, 1, 1,
1.14739, -1.353079, 1.303297, 0, 0, 0, 1, 1,
1.150875, -1.13093, 3.308208, 0, 0, 0, 1, 1,
1.151699, 0.4150127, 2.392936, 0, 0, 0, 1, 1,
1.160206, -0.349914, 4.478846, 1, 1, 1, 1, 1,
1.160508, 2.465625, 0.8883994, 1, 1, 1, 1, 1,
1.163309, -0.5356098, 1.337775, 1, 1, 1, 1, 1,
1.165938, 0.3248907, 0.8946128, 1, 1, 1, 1, 1,
1.170887, -0.03675378, 2.671753, 1, 1, 1, 1, 1,
1.180026, -2.095909, 2.621588, 1, 1, 1, 1, 1,
1.18521, 0.949074, 1.605341, 1, 1, 1, 1, 1,
1.18596, -0.1963575, 2.791092, 1, 1, 1, 1, 1,
1.202556, 0.6094443, 1.358751, 1, 1, 1, 1, 1,
1.204589, 0.6118629, -1.195244, 1, 1, 1, 1, 1,
1.219993, -0.1783448, 1.239123, 1, 1, 1, 1, 1,
1.223784, -0.8787628, 2.657765, 1, 1, 1, 1, 1,
1.227269, 1.236475, -0.9618154, 1, 1, 1, 1, 1,
1.22986, -0.2519273, 2.894242, 1, 1, 1, 1, 1,
1.238585, -0.4143098, 0.5892488, 1, 1, 1, 1, 1,
1.244108, -1.932098, 2.449061, 0, 0, 1, 1, 1,
1.262258, -1.912984, 1.512766, 1, 0, 0, 1, 1,
1.266253, 0.4798273, 0.2537387, 1, 0, 0, 1, 1,
1.269914, 0.1193024, 0.9886089, 1, 0, 0, 1, 1,
1.271799, 2.891292, 0.3730312, 1, 0, 0, 1, 1,
1.277958, 0.08780671, 1.338849, 1, 0, 0, 1, 1,
1.287436, 0.4355083, 1.046402, 0, 0, 0, 1, 1,
1.287918, 0.1422869, 0.5359131, 0, 0, 0, 1, 1,
1.290935, 0.9488784, 2.134726, 0, 0, 0, 1, 1,
1.298223, 0.4805655, -0.5869789, 0, 0, 0, 1, 1,
1.319152, -0.1445363, 3.460963, 0, 0, 0, 1, 1,
1.327663, -0.6478137, 1.411951, 0, 0, 0, 1, 1,
1.330755, -2.011923, 3.83729, 0, 0, 0, 1, 1,
1.336493, -0.419956, 2.037019, 1, 1, 1, 1, 1,
1.341607, 0.5952576, 1.842223, 1, 1, 1, 1, 1,
1.356352, 0.9763889, -0.04031372, 1, 1, 1, 1, 1,
1.360182, 0.7927704, 2.150409, 1, 1, 1, 1, 1,
1.380165, 1.74196, 2.036923, 1, 1, 1, 1, 1,
1.387218, 2.618113, 0.2646374, 1, 1, 1, 1, 1,
1.393712, 0.5696172, 0.676896, 1, 1, 1, 1, 1,
1.39417, -0.3199202, 2.218426, 1, 1, 1, 1, 1,
1.397462, -0.1009334, 1.780067, 1, 1, 1, 1, 1,
1.404725, 0.7376229, -0.933257, 1, 1, 1, 1, 1,
1.406783, -1.11235, 0.9726514, 1, 1, 1, 1, 1,
1.409052, 2.156793, -0.01438844, 1, 1, 1, 1, 1,
1.412798, -0.6113251, 1.233908, 1, 1, 1, 1, 1,
1.414904, 0.3333393, 1.011111, 1, 1, 1, 1, 1,
1.415581, -0.1655969, 2.150578, 1, 1, 1, 1, 1,
1.415637, -0.2718254, 1.475875, 0, 0, 1, 1, 1,
1.420724, -0.2511241, 0.4835505, 1, 0, 0, 1, 1,
1.423446, 1.230628, 1.306877, 1, 0, 0, 1, 1,
1.424996, -0.5483257, -0.2208696, 1, 0, 0, 1, 1,
1.430359, 0.0782574, 3.366436, 1, 0, 0, 1, 1,
1.436048, -0.7230611, 3.723463, 1, 0, 0, 1, 1,
1.440421, -0.3241571, 1.825913, 0, 0, 0, 1, 1,
1.444318, -1.17818, 3.046807, 0, 0, 0, 1, 1,
1.457706, 0.966287, 1.507171, 0, 0, 0, 1, 1,
1.473352, -0.9772792, 0.5138708, 0, 0, 0, 1, 1,
1.484439, 0.4544384, 1.648131, 0, 0, 0, 1, 1,
1.488496, 1.396167, 1.881395, 0, 0, 0, 1, 1,
1.498573, -0.1772922, 2.188841, 0, 0, 0, 1, 1,
1.507444, 0.05624486, 1.983258, 1, 1, 1, 1, 1,
1.515013, 0.7980021, 2.173024, 1, 1, 1, 1, 1,
1.522753, 0.4011182, 2.547309, 1, 1, 1, 1, 1,
1.523253, 0.6563818, 1.887707, 1, 1, 1, 1, 1,
1.546467, 1.062103, 1.099898, 1, 1, 1, 1, 1,
1.54975, 0.3253598, 1.397195, 1, 1, 1, 1, 1,
1.550748, -0.5995142, 2.439077, 1, 1, 1, 1, 1,
1.554447, 0.7066884, 1.583104, 1, 1, 1, 1, 1,
1.55699, -0.4997215, 1.264136, 1, 1, 1, 1, 1,
1.561243, 1.125354, 1.483914, 1, 1, 1, 1, 1,
1.576178, 0.02332118, 0.4696553, 1, 1, 1, 1, 1,
1.584582, 0.8488309, 0.8117777, 1, 1, 1, 1, 1,
1.590104, -0.7519792, 2.224039, 1, 1, 1, 1, 1,
1.598498, -0.9068585, 1.531507, 1, 1, 1, 1, 1,
1.609914, -0.7826439, 1.429226, 1, 1, 1, 1, 1,
1.620403, 0.0265974, 2.924686, 0, 0, 1, 1, 1,
1.639226, -0.3082985, 0.9429899, 1, 0, 0, 1, 1,
1.645766, 1.188186, -1.177075, 1, 0, 0, 1, 1,
1.665031, 0.8886988, 0.6094341, 1, 0, 0, 1, 1,
1.67952, 1.309852, 0.5189095, 1, 0, 0, 1, 1,
1.69098, -0.4500224, 3.316651, 1, 0, 0, 1, 1,
1.692393, 0.5407771, 3.219804, 0, 0, 0, 1, 1,
1.707555, 0.001031413, 0.1366763, 0, 0, 0, 1, 1,
1.714615, -0.4683512, 3.045915, 0, 0, 0, 1, 1,
1.71858, -0.5220572, 0.9349675, 0, 0, 0, 1, 1,
1.740758, 1.158832, 1.341348, 0, 0, 0, 1, 1,
1.741488, 0.8811857, -0.9209544, 0, 0, 0, 1, 1,
1.768768, -0.8745137, 2.000065, 0, 0, 0, 1, 1,
1.771767, -1.206588, 2.01289, 1, 1, 1, 1, 1,
1.80777, 0.5919352, 2.130378, 1, 1, 1, 1, 1,
1.835785, -0.01477753, 2.884098, 1, 1, 1, 1, 1,
1.851519, 1.818016, 2.71892, 1, 1, 1, 1, 1,
1.856146, -0.165396, 0.1479023, 1, 1, 1, 1, 1,
1.861915, 0.4686077, 1.687383, 1, 1, 1, 1, 1,
1.864762, -0.8464711, 0.9329897, 1, 1, 1, 1, 1,
1.872945, 0.6028193, 1.525405, 1, 1, 1, 1, 1,
1.874877, -1.654624, 2.696187, 1, 1, 1, 1, 1,
1.888881, 0.1572485, -0.07623878, 1, 1, 1, 1, 1,
1.890913, -0.4895521, 3.679018, 1, 1, 1, 1, 1,
1.892077, -0.4717031, 1.152134, 1, 1, 1, 1, 1,
1.905613, 0.7534345, 2.163, 1, 1, 1, 1, 1,
1.910845, 1.321996, 0.8259247, 1, 1, 1, 1, 1,
1.93722, 1.1666, 0.4967934, 1, 1, 1, 1, 1,
1.954924, 1.148556, 1.767645, 0, 0, 1, 1, 1,
1.992923, -0.9894109, 2.17372, 1, 0, 0, 1, 1,
2.014614, -0.6970941, 1.826198, 1, 0, 0, 1, 1,
2.022209, 2.590514, -2.382843, 1, 0, 0, 1, 1,
2.045404, 1.171521, 2.069765, 1, 0, 0, 1, 1,
2.063561, -1.529088, 3.006946, 1, 0, 0, 1, 1,
2.102951, 1.154287, 2.222347, 0, 0, 0, 1, 1,
2.16178, 0.03804695, 1.258385, 0, 0, 0, 1, 1,
2.225399, -0.4292576, 3.228798, 0, 0, 0, 1, 1,
2.246166, -0.8319079, 1.49305, 0, 0, 0, 1, 1,
2.381925, 0.6027176, 0.3462316, 0, 0, 0, 1, 1,
2.440896, -0.2345904, 1.378527, 0, 0, 0, 1, 1,
2.460306, 0.365683, 0.0807806, 0, 0, 0, 1, 1,
2.496631, 1.185584, 1.514447, 1, 1, 1, 1, 1,
2.626219, 0.8637995, 0.558531, 1, 1, 1, 1, 1,
2.848295, -1.116997, 1.749167, 1, 1, 1, 1, 1,
2.885499, 0.7492052, 1.207948, 1, 1, 1, 1, 1,
2.920723, -0.634013, 2.276844, 1, 1, 1, 1, 1,
3.208981, 1.164183, 1.867632, 1, 1, 1, 1, 1,
3.311133, 0.6504844, -0.6301389, 1, 1, 1, 1, 1
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
var radius = 9.767593;
var distance = 34.30826;
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
mvMatrix.translate( 0.1613836, 0.1762521, -0.2959998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.30826);
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
