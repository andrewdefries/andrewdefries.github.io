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
-3.12672, -0.2741136, -1.45719, 1, 0, 0, 1,
-2.868874, -1.762849, -2.036132, 1, 0.007843138, 0, 1,
-2.756822, 1.013862, 0.1312104, 1, 0.01176471, 0, 1,
-2.717951, -0.3618373, -0.8222832, 1, 0.01960784, 0, 1,
-2.698198, 0.7805962, -0.4571424, 1, 0.02352941, 0, 1,
-2.624438, -2.967826, -2.158215, 1, 0.03137255, 0, 1,
-2.477328, 0.9769433, -0.6356429, 1, 0.03529412, 0, 1,
-2.445934, 0.4513243, -0.8368989, 1, 0.04313726, 0, 1,
-2.409667, 0.5916385, -0.8335494, 1, 0.04705882, 0, 1,
-2.305298, 0.2868154, -2.124268, 1, 0.05490196, 0, 1,
-2.266938, -0.2254878, -1.400651, 1, 0.05882353, 0, 1,
-2.204041, -1.195162, -1.384438, 1, 0.06666667, 0, 1,
-2.181963, 0.8135653, -1.929778, 1, 0.07058824, 0, 1,
-2.165468, -1.335773, -2.025723, 1, 0.07843138, 0, 1,
-2.153699, -0.6967968, -2.484785, 1, 0.08235294, 0, 1,
-2.137923, 0.002350785, -1.40063, 1, 0.09019608, 0, 1,
-2.13373, 0.2210106, -3.745006, 1, 0.09411765, 0, 1,
-2.122859, -0.1758236, 0.518575, 1, 0.1019608, 0, 1,
-2.118178, 0.8748668, -0.4563138, 1, 0.1098039, 0, 1,
-2.116855, 0.2305605, -2.376266, 1, 0.1137255, 0, 1,
-2.09847, 1.583842, -0.155735, 1, 0.1215686, 0, 1,
-2.089073, 1.056497, -1.395996, 1, 0.1254902, 0, 1,
-2.017698, 0.6905991, 1.656907, 1, 0.1333333, 0, 1,
-2.013253, -0.6901974, -1.269616, 1, 0.1372549, 0, 1,
-2.006695, -0.848325, -1.660268, 1, 0.145098, 0, 1,
-2.006334, 0.1136359, -1.072118, 1, 0.1490196, 0, 1,
-1.97613, 0.06134633, -1.93235, 1, 0.1568628, 0, 1,
-1.948671, -0.770593, -2.173458, 1, 0.1607843, 0, 1,
-1.946864, -0.8799989, -1.448559, 1, 0.1686275, 0, 1,
-1.936761, 0.8737669, -2.282326, 1, 0.172549, 0, 1,
-1.931931, 1.60165, 0.8906184, 1, 0.1803922, 0, 1,
-1.927001, -0.2971226, -1.677428, 1, 0.1843137, 0, 1,
-1.890197, -1.243, -1.261211, 1, 0.1921569, 0, 1,
-1.883207, 0.523209, -2.173699, 1, 0.1960784, 0, 1,
-1.881023, 1.502877, 1.491036, 1, 0.2039216, 0, 1,
-1.854512, 2.178268, -0.1690756, 1, 0.2117647, 0, 1,
-1.850276, 0.5315963, -1.584981, 1, 0.2156863, 0, 1,
-1.827175, -0.1015057, -1.517373, 1, 0.2235294, 0, 1,
-1.816273, 2.089221, 0.10643, 1, 0.227451, 0, 1,
-1.785859, 0.7440157, -0.9618937, 1, 0.2352941, 0, 1,
-1.767117, 1.260099, -2.583112, 1, 0.2392157, 0, 1,
-1.755035, -1.127392, 0.2582625, 1, 0.2470588, 0, 1,
-1.734203, -0.8427508, -0.05642422, 1, 0.2509804, 0, 1,
-1.696158, -0.04867636, -0.5439137, 1, 0.2588235, 0, 1,
-1.691406, -0.714968, -4.097408, 1, 0.2627451, 0, 1,
-1.68288, -0.7736881, -1.841858, 1, 0.2705882, 0, 1,
-1.672704, -0.2442798, -1.34379, 1, 0.2745098, 0, 1,
-1.672108, 0.0192705, -0.7743197, 1, 0.282353, 0, 1,
-1.669201, 1.380338, -1.02025, 1, 0.2862745, 0, 1,
-1.647007, -2.001061, -2.954222, 1, 0.2941177, 0, 1,
-1.642655, -0.354832, 0.1741548, 1, 0.3019608, 0, 1,
-1.637061, 0.4289008, -3.063321, 1, 0.3058824, 0, 1,
-1.633899, 0.4094189, -0.1838797, 1, 0.3137255, 0, 1,
-1.630646, 0.2109546, -1.909069, 1, 0.3176471, 0, 1,
-1.630371, 0.5805311, -3.150062, 1, 0.3254902, 0, 1,
-1.621534, 0.6446961, -1.062915, 1, 0.3294118, 0, 1,
-1.619878, 0.609581, 1.210362, 1, 0.3372549, 0, 1,
-1.604063, 0.6311532, -2.276436, 1, 0.3411765, 0, 1,
-1.604013, -1.907203, -2.031056, 1, 0.3490196, 0, 1,
-1.594251, -0.156175, -1.832502, 1, 0.3529412, 0, 1,
-1.588376, 0.8821672, -0.1311945, 1, 0.3607843, 0, 1,
-1.586613, -0.5119488, -2.932473, 1, 0.3647059, 0, 1,
-1.562603, 1.679052, -1.953582, 1, 0.372549, 0, 1,
-1.557944, 0.590625, 0.545467, 1, 0.3764706, 0, 1,
-1.552776, 1.448896, -0.2081463, 1, 0.3843137, 0, 1,
-1.552339, -0.556273, -1.797698, 1, 0.3882353, 0, 1,
-1.54549, -0.9951783, -2.32656, 1, 0.3960784, 0, 1,
-1.543932, -1.188651, -2.046168, 1, 0.4039216, 0, 1,
-1.542031, -0.4856232, -1.080309, 1, 0.4078431, 0, 1,
-1.536131, -0.2924918, -3.558078, 1, 0.4156863, 0, 1,
-1.529041, 1.003878, 1.030023, 1, 0.4196078, 0, 1,
-1.508777, -1.236683, -1.87839, 1, 0.427451, 0, 1,
-1.498957, 0.07747282, -2.326951, 1, 0.4313726, 0, 1,
-1.498371, -0.8096959, -3.327006, 1, 0.4392157, 0, 1,
-1.49673, -1.401018, -2.211732, 1, 0.4431373, 0, 1,
-1.487459, 0.6985226, -2.615712, 1, 0.4509804, 0, 1,
-1.486987, 0.2991645, -1.949549, 1, 0.454902, 0, 1,
-1.47629, -0.8948597, -2.198403, 1, 0.4627451, 0, 1,
-1.474283, 0.08522592, -0.6360853, 1, 0.4666667, 0, 1,
-1.473172, 0.4171654, -0.7950645, 1, 0.4745098, 0, 1,
-1.473048, 0.5382146, -0.7874253, 1, 0.4784314, 0, 1,
-1.472554, -0.6481857, -1.663099, 1, 0.4862745, 0, 1,
-1.470515, -0.7875035, -0.662586, 1, 0.4901961, 0, 1,
-1.466833, -0.7565252, -2.682316, 1, 0.4980392, 0, 1,
-1.435119, 1.210009, -0.1014156, 1, 0.5058824, 0, 1,
-1.431822, 0.4435702, 0.5081665, 1, 0.509804, 0, 1,
-1.43098, -0.315628, -3.765031, 1, 0.5176471, 0, 1,
-1.424136, -0.6377068, -3.283575, 1, 0.5215687, 0, 1,
-1.422793, -0.6086234, -1.606129, 1, 0.5294118, 0, 1,
-1.422096, -0.2330211, -0.660616, 1, 0.5333334, 0, 1,
-1.41954, -0.1767371, -1.399402, 1, 0.5411765, 0, 1,
-1.404424, 1.262749, -1.87765, 1, 0.5450981, 0, 1,
-1.38686, -0.6006138, -2.840181, 1, 0.5529412, 0, 1,
-1.380855, 0.580187, -1.891523, 1, 0.5568628, 0, 1,
-1.377168, -1.199161, -1.608028, 1, 0.5647059, 0, 1,
-1.37606, -0.3412867, -1.816342, 1, 0.5686275, 0, 1,
-1.369944, -1.986038, -2.927569, 1, 0.5764706, 0, 1,
-1.366347, 1.721921, 1.180033, 1, 0.5803922, 0, 1,
-1.364662, 1.317338, -1.276638, 1, 0.5882353, 0, 1,
-1.358026, -0.922748, -0.9652404, 1, 0.5921569, 0, 1,
-1.357848, 0.0271847, -1.918725, 1, 0.6, 0, 1,
-1.34658, 2.113003, 1.77032, 1, 0.6078432, 0, 1,
-1.343871, -2.075427, -2.309808, 1, 0.6117647, 0, 1,
-1.33966, 0.8267377, 0.7009098, 1, 0.6196079, 0, 1,
-1.334131, -1.048155, -2.591634, 1, 0.6235294, 0, 1,
-1.323469, -1.019664, -1.587904, 1, 0.6313726, 0, 1,
-1.311183, -0.5676555, -0.9683533, 1, 0.6352941, 0, 1,
-1.304551, -0.5313302, -0.7805753, 1, 0.6431373, 0, 1,
-1.283173, -1.915976, -2.454788, 1, 0.6470588, 0, 1,
-1.270076, 1.310695, -0.7073306, 1, 0.654902, 0, 1,
-1.265188, -1.504745, -1.854879, 1, 0.6588235, 0, 1,
-1.258269, -0.1627966, -1.649787, 1, 0.6666667, 0, 1,
-1.257383, -0.7974843, -0.459701, 1, 0.6705883, 0, 1,
-1.254604, 0.7417809, -2.40998, 1, 0.6784314, 0, 1,
-1.241659, 0.4207279, -0.9163486, 1, 0.682353, 0, 1,
-1.238369, -1.492922, -1.83193, 1, 0.6901961, 0, 1,
-1.237246, -0.05020804, -2.615756, 1, 0.6941177, 0, 1,
-1.229467, 0.9414971, -0.8872465, 1, 0.7019608, 0, 1,
-1.208627, -0.4909184, -0.365949, 1, 0.7098039, 0, 1,
-1.205917, 1.092339, 0.1915652, 1, 0.7137255, 0, 1,
-1.200935, 0.3561036, -3.895039, 1, 0.7215686, 0, 1,
-1.200062, -1.066152, -4.105444, 1, 0.7254902, 0, 1,
-1.194172, 0.5602903, -1.893021, 1, 0.7333333, 0, 1,
-1.187458, 0.1922088, 0.9993598, 1, 0.7372549, 0, 1,
-1.180192, 0.9398043, -0.8802069, 1, 0.7450981, 0, 1,
-1.177715, 0.5242718, -0.9896619, 1, 0.7490196, 0, 1,
-1.174217, -0.1063793, 0.06205983, 1, 0.7568628, 0, 1,
-1.173314, -1.122315, -0.9905733, 1, 0.7607843, 0, 1,
-1.173283, 0.3947909, -0.8141341, 1, 0.7686275, 0, 1,
-1.167502, 0.5813271, -1.797879, 1, 0.772549, 0, 1,
-1.166289, 1.876245, -0.0003840009, 1, 0.7803922, 0, 1,
-1.165934, 0.1312473, -1.358534, 1, 0.7843137, 0, 1,
-1.165836, -1.080394, -2.287375, 1, 0.7921569, 0, 1,
-1.162598, -0.712303, -1.773887, 1, 0.7960784, 0, 1,
-1.154295, 0.9733516, 0.6861954, 1, 0.8039216, 0, 1,
-1.15187, 0.3269007, -0.2096637, 1, 0.8117647, 0, 1,
-1.142825, 0.7826806, -0.9515449, 1, 0.8156863, 0, 1,
-1.122586, -0.3787956, -1.620579, 1, 0.8235294, 0, 1,
-1.113452, -0.6596285, -3.016791, 1, 0.827451, 0, 1,
-1.112248, -0.3176425, -1.13961, 1, 0.8352941, 0, 1,
-1.111307, -0.2582044, -0.8220495, 1, 0.8392157, 0, 1,
-1.099531, 0.3429768, 0.5207218, 1, 0.8470588, 0, 1,
-1.092961, -0.2063723, -1.465275, 1, 0.8509804, 0, 1,
-1.089023, 1.192298, -2.31821, 1, 0.8588235, 0, 1,
-1.076112, 0.4678759, -1.712824, 1, 0.8627451, 0, 1,
-1.07223, 0.923444, -0.06028596, 1, 0.8705882, 0, 1,
-1.066898, 0.1484377, -1.588871, 1, 0.8745098, 0, 1,
-1.065019, 0.3500494, -1.400153, 1, 0.8823529, 0, 1,
-1.060868, -0.8522218, -0.2851652, 1, 0.8862745, 0, 1,
-1.052291, -0.1488896, -3.359188, 1, 0.8941177, 0, 1,
-1.045031, 0.7126826, -2.272641, 1, 0.8980392, 0, 1,
-1.037368, 0.8941953, -0.2881005, 1, 0.9058824, 0, 1,
-1.026905, -0.8560183, -2.710864, 1, 0.9137255, 0, 1,
-1.026343, -0.7567711, -3.652512, 1, 0.9176471, 0, 1,
-1.015838, -0.3586301, -0.9273943, 1, 0.9254902, 0, 1,
-1.010628, -0.4468721, -1.179884, 1, 0.9294118, 0, 1,
-1.006475, -0.5086873, -1.921069, 1, 0.9372549, 0, 1,
-1.000874, -0.9076355, -1.216289, 1, 0.9411765, 0, 1,
-0.9971331, -0.6329088, -4.149899, 1, 0.9490196, 0, 1,
-0.9713381, 0.09866365, -1.639904, 1, 0.9529412, 0, 1,
-0.9638376, 0.3182593, -3.051265, 1, 0.9607843, 0, 1,
-0.9627255, -0.718178, -3.334614, 1, 0.9647059, 0, 1,
-0.9543161, -1.510922, -2.096728, 1, 0.972549, 0, 1,
-0.9542431, -0.2645914, -0.6881341, 1, 0.9764706, 0, 1,
-0.9541089, 0.543625, -0.1766821, 1, 0.9843137, 0, 1,
-0.9539828, -1.350694, -3.455698, 1, 0.9882353, 0, 1,
-0.9539666, 1.068743, -1.535864, 1, 0.9960784, 0, 1,
-0.9494904, -1.290783, -2.3873, 0.9960784, 1, 0, 1,
-0.9491783, -0.8878484, -2.255414, 0.9921569, 1, 0, 1,
-0.948727, -0.5256335, -4.921362, 0.9843137, 1, 0, 1,
-0.9468234, 0.1523325, -2.521722, 0.9803922, 1, 0, 1,
-0.9438494, -0.5241896, -2.26974, 0.972549, 1, 0, 1,
-0.9411924, -0.9458417, -1.557138, 0.9686275, 1, 0, 1,
-0.9407802, 1.704896, 0.6830238, 0.9607843, 1, 0, 1,
-0.9403691, -0.8390996, -2.034723, 0.9568627, 1, 0, 1,
-0.9382235, -1.09258, -2.045398, 0.9490196, 1, 0, 1,
-0.9372917, -0.1421698, -2.072887, 0.945098, 1, 0, 1,
-0.9362122, 1.959994, -1.285493, 0.9372549, 1, 0, 1,
-0.9267286, -0.7280399, -2.882974, 0.9333333, 1, 0, 1,
-0.9244534, 1.347662, -0.7907338, 0.9254902, 1, 0, 1,
-0.9224257, -0.9345219, -1.918406, 0.9215686, 1, 0, 1,
-0.920657, -0.5377162, 0.2149541, 0.9137255, 1, 0, 1,
-0.920637, 1.925597, 0.495504, 0.9098039, 1, 0, 1,
-0.8923647, 0.9950259, -0.8757328, 0.9019608, 1, 0, 1,
-0.8890458, 0.9051679, -2.887407, 0.8941177, 1, 0, 1,
-0.8843665, -0.712169, -1.925319, 0.8901961, 1, 0, 1,
-0.8786086, 0.8332541, -2.144137, 0.8823529, 1, 0, 1,
-0.8773676, 0.8246733, -0.3604284, 0.8784314, 1, 0, 1,
-0.8767643, -0.730537, -3.208057, 0.8705882, 1, 0, 1,
-0.8766775, -1.625711, -2.161119, 0.8666667, 1, 0, 1,
-0.8765408, 0.4867178, 1.034129, 0.8588235, 1, 0, 1,
-0.8745412, 0.1436791, -0.4570681, 0.854902, 1, 0, 1,
-0.8714705, 0.4289832, -1.280257, 0.8470588, 1, 0, 1,
-0.8706827, 1.247621, -1.887134, 0.8431373, 1, 0, 1,
-0.8660432, 1.643886, -1.696405, 0.8352941, 1, 0, 1,
-0.8582141, -1.114264, -2.011074, 0.8313726, 1, 0, 1,
-0.853012, -0.7572179, -1.760294, 0.8235294, 1, 0, 1,
-0.8435945, -0.0826822, -2.054247, 0.8196079, 1, 0, 1,
-0.8404518, 0.6305929, -0.9165423, 0.8117647, 1, 0, 1,
-0.8390559, -1.621468, -3.821126, 0.8078431, 1, 0, 1,
-0.8351821, 0.6494547, -0.2667635, 0.8, 1, 0, 1,
-0.8343866, 0.498841, -0.8218179, 0.7921569, 1, 0, 1,
-0.8329546, -0.2127658, -1.494619, 0.7882353, 1, 0, 1,
-0.8270044, 0.09939772, -1.825895, 0.7803922, 1, 0, 1,
-0.8231496, -0.671699, -2.071492, 0.7764706, 1, 0, 1,
-0.8221788, -0.7674202, -2.487329, 0.7686275, 1, 0, 1,
-0.8216416, -0.3249501, -1.731506, 0.7647059, 1, 0, 1,
-0.8188403, 0.4691637, -2.440249, 0.7568628, 1, 0, 1,
-0.8176018, -0.4068685, -0.7166884, 0.7529412, 1, 0, 1,
-0.8135169, -1.244373, -3.93752, 0.7450981, 1, 0, 1,
-0.811106, -0.09330148, -1.909862, 0.7411765, 1, 0, 1,
-0.8093155, 0.8943799, -0.8852062, 0.7333333, 1, 0, 1,
-0.8086565, 1.94008, -1.196667, 0.7294118, 1, 0, 1,
-0.8082141, 0.3199573, -2.73307, 0.7215686, 1, 0, 1,
-0.8068563, -0.2561578, -2.217492, 0.7176471, 1, 0, 1,
-0.8055942, -0.8425464, -2.829111, 0.7098039, 1, 0, 1,
-0.8037322, -0.2568537, -3.354841, 0.7058824, 1, 0, 1,
-0.7994776, 0.2480647, -1.675899, 0.6980392, 1, 0, 1,
-0.7994255, 0.02676194, -2.521644, 0.6901961, 1, 0, 1,
-0.7956583, 0.3159633, -0.1949821, 0.6862745, 1, 0, 1,
-0.7941277, 1.172707, -1.111537, 0.6784314, 1, 0, 1,
-0.7881716, 0.6154497, -0.2086792, 0.6745098, 1, 0, 1,
-0.7867004, 0.2977579, -1.071223, 0.6666667, 1, 0, 1,
-0.7793714, 1.021272, -1.753017, 0.6627451, 1, 0, 1,
-0.7749935, -0.2847169, -1.725786, 0.654902, 1, 0, 1,
-0.7716869, -0.6804134, -3.909867, 0.6509804, 1, 0, 1,
-0.768137, 1.040763, -0.8106794, 0.6431373, 1, 0, 1,
-0.7580185, -1.206658, -2.482867, 0.6392157, 1, 0, 1,
-0.7575469, -1.130363, -1.506189, 0.6313726, 1, 0, 1,
-0.7571167, -0.4932632, -0.8866723, 0.627451, 1, 0, 1,
-0.7566822, -0.583275, -1.115852, 0.6196079, 1, 0, 1,
-0.7563697, -0.4330545, -3.011313, 0.6156863, 1, 0, 1,
-0.7562369, 0.3179216, -2.249289, 0.6078432, 1, 0, 1,
-0.7541066, 0.9717342, -1.751844, 0.6039216, 1, 0, 1,
-0.7519482, 0.7794915, -0.3704596, 0.5960785, 1, 0, 1,
-0.7496384, -0.493378, -2.183269, 0.5882353, 1, 0, 1,
-0.7465827, -1.2856, -2.543252, 0.5843138, 1, 0, 1,
-0.7464757, 1.129588, -0.01682539, 0.5764706, 1, 0, 1,
-0.7432147, -0.2409437, -1.688035, 0.572549, 1, 0, 1,
-0.7399788, 1.435831, -0.07111312, 0.5647059, 1, 0, 1,
-0.7313586, 2.007806, -0.1757614, 0.5607843, 1, 0, 1,
-0.7305011, 1.574472, 1.807278, 0.5529412, 1, 0, 1,
-0.7273653, 0.7292463, -3.190593, 0.5490196, 1, 0, 1,
-0.7235044, -0.1244849, -1.580249, 0.5411765, 1, 0, 1,
-0.7223774, 1.430338, -0.3208864, 0.5372549, 1, 0, 1,
-0.7135618, 0.6240809, -1.353192, 0.5294118, 1, 0, 1,
-0.7116399, 0.1816453, -1.872609, 0.5254902, 1, 0, 1,
-0.7074119, 2.023143, -0.5393744, 0.5176471, 1, 0, 1,
-0.7061047, 0.4799643, -0.5461937, 0.5137255, 1, 0, 1,
-0.6999387, -0.06060455, -2.189471, 0.5058824, 1, 0, 1,
-0.6986302, -0.5832315, -3.105704, 0.5019608, 1, 0, 1,
-0.6926941, -0.0149163, -1.12464, 0.4941176, 1, 0, 1,
-0.6914212, -0.6310288, -2.456549, 0.4862745, 1, 0, 1,
-0.6903589, 0.458772, -2.280802, 0.4823529, 1, 0, 1,
-0.6885131, -1.1889, -2.605895, 0.4745098, 1, 0, 1,
-0.6814941, 0.5076714, -0.9241485, 0.4705882, 1, 0, 1,
-0.678645, 1.245908, 0.8107345, 0.4627451, 1, 0, 1,
-0.6764038, 0.4523074, -1.339702, 0.4588235, 1, 0, 1,
-0.6735944, -0.05975764, 0.08612613, 0.4509804, 1, 0, 1,
-0.672617, 0.3243042, -1.626121, 0.4470588, 1, 0, 1,
-0.6688954, 0.6212745, 0.07325999, 0.4392157, 1, 0, 1,
-0.6667538, 0.2010602, -1.121105, 0.4352941, 1, 0, 1,
-0.6665739, -1.281391, -4.014498, 0.427451, 1, 0, 1,
-0.6633995, -2.8977, -1.161132, 0.4235294, 1, 0, 1,
-0.6633446, 1.047021, -0.5758005, 0.4156863, 1, 0, 1,
-0.661153, -2.644863, -4.162992, 0.4117647, 1, 0, 1,
-0.6603081, -1.564356, -2.970549, 0.4039216, 1, 0, 1,
-0.6589838, -0.4563025, -1.483106, 0.3960784, 1, 0, 1,
-0.6583483, -2.291589, -1.347273, 0.3921569, 1, 0, 1,
-0.6574975, 0.1652161, -1.615946, 0.3843137, 1, 0, 1,
-0.6556333, -0.001763247, -0.2415062, 0.3803922, 1, 0, 1,
-0.6541719, -0.9354694, -1.757287, 0.372549, 1, 0, 1,
-0.653988, -1.394626, -3.581694, 0.3686275, 1, 0, 1,
-0.6539051, -0.1880867, -1.295668, 0.3607843, 1, 0, 1,
-0.6493251, -1.182617, -2.756745, 0.3568628, 1, 0, 1,
-0.6420252, -0.2737068, -2.860385, 0.3490196, 1, 0, 1,
-0.6390415, -0.2679617, -1.951985, 0.345098, 1, 0, 1,
-0.6181866, 0.621126, 0.1890904, 0.3372549, 1, 0, 1,
-0.616188, -0.3064221, -0.5699784, 0.3333333, 1, 0, 1,
-0.6131895, -0.2507512, -1.516318, 0.3254902, 1, 0, 1,
-0.6074551, 0.6575028, -0.0321864, 0.3215686, 1, 0, 1,
-0.6047513, -1.276079, -4.228622, 0.3137255, 1, 0, 1,
-0.6038852, 0.8487881, 0.5635829, 0.3098039, 1, 0, 1,
-0.6019628, 0.4487933, -1.967407, 0.3019608, 1, 0, 1,
-0.5975474, -0.7024035, -4.269169, 0.2941177, 1, 0, 1,
-0.5946187, 1.42154, 0.5193725, 0.2901961, 1, 0, 1,
-0.5929558, 1.944837, -1.086624, 0.282353, 1, 0, 1,
-0.5921466, 0.7312317, -1.777868, 0.2784314, 1, 0, 1,
-0.5837711, -1.789341, -3.966625, 0.2705882, 1, 0, 1,
-0.5833519, -0.1857653, -1.938443, 0.2666667, 1, 0, 1,
-0.5818769, 0.5299338, -0.6995843, 0.2588235, 1, 0, 1,
-0.5797886, 1.357459, -1.00176, 0.254902, 1, 0, 1,
-0.5778194, 0.8754112, 0.1510441, 0.2470588, 1, 0, 1,
-0.5770007, -1.140014, -3.060449, 0.2431373, 1, 0, 1,
-0.5761153, 0.06817663, -0.739952, 0.2352941, 1, 0, 1,
-0.5717456, 0.5683513, -1.242622, 0.2313726, 1, 0, 1,
-0.5707246, 0.233433, -1.784783, 0.2235294, 1, 0, 1,
-0.5659596, -0.3373725, -2.919538, 0.2196078, 1, 0, 1,
-0.5599392, -0.0661932, -1.61128, 0.2117647, 1, 0, 1,
-0.5566826, 1.1271, -0.8722197, 0.2078431, 1, 0, 1,
-0.555796, -0.8335536, -2.411449, 0.2, 1, 0, 1,
-0.5554264, -2.603765, -3.199836, 0.1921569, 1, 0, 1,
-0.5539341, -1.0132, -1.107821, 0.1882353, 1, 0, 1,
-0.5506662, 1.47415, 0.2791249, 0.1803922, 1, 0, 1,
-0.5499468, 0.7645998, -0.6765186, 0.1764706, 1, 0, 1,
-0.5499263, 0.8444816, 0.8587333, 0.1686275, 1, 0, 1,
-0.546979, -0.09794372, -2.506139, 0.1647059, 1, 0, 1,
-0.5455664, 0.1795965, -2.096276, 0.1568628, 1, 0, 1,
-0.5374376, -1.074278, -2.667668, 0.1529412, 1, 0, 1,
-0.5336673, 0.4876775, -0.7005694, 0.145098, 1, 0, 1,
-0.5320156, -0.732809, -3.623612, 0.1411765, 1, 0, 1,
-0.5289459, -0.5904058, -2.398227, 0.1333333, 1, 0, 1,
-0.5247432, -0.2591284, -0.7410833, 0.1294118, 1, 0, 1,
-0.5231531, -0.8924646, -2.906541, 0.1215686, 1, 0, 1,
-0.5225075, 1.084594, -0.3099097, 0.1176471, 1, 0, 1,
-0.5218546, -1.814528, -2.890798, 0.1098039, 1, 0, 1,
-0.5197548, 0.417841, -0.8503748, 0.1058824, 1, 0, 1,
-0.5195495, -2.682401, -3.361117, 0.09803922, 1, 0, 1,
-0.5096341, -0.8057569, -2.96173, 0.09019608, 1, 0, 1,
-0.5090077, -0.8373018, -2.631497, 0.08627451, 1, 0, 1,
-0.5085737, -1.079075, -2.839019, 0.07843138, 1, 0, 1,
-0.5059518, 0.06265412, -0.9842505, 0.07450981, 1, 0, 1,
-0.5024182, -0.9415724, -2.94354, 0.06666667, 1, 0, 1,
-0.4959943, -0.9149823, -2.132256, 0.0627451, 1, 0, 1,
-0.4937023, -0.1954806, -1.495779, 0.05490196, 1, 0, 1,
-0.4777874, -0.9118685, -1.383447, 0.05098039, 1, 0, 1,
-0.471478, -1.283358, -3.936531, 0.04313726, 1, 0, 1,
-0.4680569, -0.6259958, -2.224052, 0.03921569, 1, 0, 1,
-0.4673176, 0.09009955, -0.8276035, 0.03137255, 1, 0, 1,
-0.464612, 0.2444923, -0.8486863, 0.02745098, 1, 0, 1,
-0.463685, 0.1613913, -1.017377, 0.01960784, 1, 0, 1,
-0.4625385, -1.320157, -3.978288, 0.01568628, 1, 0, 1,
-0.4596165, 0.2306856, -2.146506, 0.007843138, 1, 0, 1,
-0.4564416, 0.7363414, -1.254661, 0.003921569, 1, 0, 1,
-0.4562873, -1.907172, -3.706821, 0, 1, 0.003921569, 1,
-0.4557712, -0.3053548, -4.202535, 0, 1, 0.01176471, 1,
-0.4427652, 0.08850534, -4.264718, 0, 1, 0.01568628, 1,
-0.4402188, 0.8274856, -0.3166373, 0, 1, 0.02352941, 1,
-0.4396358, -0.6865852, -2.61487, 0, 1, 0.02745098, 1,
-0.4385977, -0.8226933, -1.686456, 0, 1, 0.03529412, 1,
-0.4352965, -1.080697, -2.502888, 0, 1, 0.03921569, 1,
-0.4335208, 0.8575212, -2.319163, 0, 1, 0.04705882, 1,
-0.4334213, 1.381405, 0.4136583, 0, 1, 0.05098039, 1,
-0.4322956, -1.742079, -1.263809, 0, 1, 0.05882353, 1,
-0.4312226, 1.183044, -0.3501976, 0, 1, 0.0627451, 1,
-0.4299531, 0.02967684, -0.5698602, 0, 1, 0.07058824, 1,
-0.427604, 0.5740122, 0.5626369, 0, 1, 0.07450981, 1,
-0.4271568, -0.9779521, -3.264286, 0, 1, 0.08235294, 1,
-0.421024, -0.4925654, -3.195533, 0, 1, 0.08627451, 1,
-0.4109415, -1.177741, -3.490294, 0, 1, 0.09411765, 1,
-0.4105111, 2.14923, -0.419915, 0, 1, 0.1019608, 1,
-0.408729, 1.923423, -0.6669026, 0, 1, 0.1058824, 1,
-0.4070733, -0.9235164, -1.148623, 0, 1, 0.1137255, 1,
-0.4059703, -0.3226939, -1.972376, 0, 1, 0.1176471, 1,
-0.4048246, -0.06038487, -1.903868, 0, 1, 0.1254902, 1,
-0.4010843, -1.419769, -2.729128, 0, 1, 0.1294118, 1,
-0.3952195, -0.649375, -2.787694, 0, 1, 0.1372549, 1,
-0.3940573, 0.9439821, -0.4556493, 0, 1, 0.1411765, 1,
-0.3939941, -0.9434359, -2.176384, 0, 1, 0.1490196, 1,
-0.3889535, 1.318753, 0.5111866, 0, 1, 0.1529412, 1,
-0.384085, 0.06028304, -1.909505, 0, 1, 0.1607843, 1,
-0.3836707, 0.7976422, -0.7508712, 0, 1, 0.1647059, 1,
-0.3772914, -2.195339, -5.442966, 0, 1, 0.172549, 1,
-0.3762394, 0.5833166, -1.230885, 0, 1, 0.1764706, 1,
-0.3747465, -1.059047, -2.317691, 0, 1, 0.1843137, 1,
-0.3729709, 2.937567, 0.2025821, 0, 1, 0.1882353, 1,
-0.3689131, 0.725487, -1.785843, 0, 1, 0.1960784, 1,
-0.3651794, 0.8901771, 0.002566092, 0, 1, 0.2039216, 1,
-0.3640573, 0.7927334, -0.5449026, 0, 1, 0.2078431, 1,
-0.3621042, 1.405238, -0.4380251, 0, 1, 0.2156863, 1,
-0.3530869, -2.039476, -3.926645, 0, 1, 0.2196078, 1,
-0.3524078, -0.3180183, -2.12532, 0, 1, 0.227451, 1,
-0.3510637, 0.7654904, -1.173807, 0, 1, 0.2313726, 1,
-0.3402139, 0.5772604, -0.06257688, 0, 1, 0.2392157, 1,
-0.339948, -0.3591342, -3.131601, 0, 1, 0.2431373, 1,
-0.339682, 0.9645892, -1.683891, 0, 1, 0.2509804, 1,
-0.339422, 0.8783914, 0.1160704, 0, 1, 0.254902, 1,
-0.336421, -0.3855788, -2.776469, 0, 1, 0.2627451, 1,
-0.3323657, 0.873515, -0.3530165, 0, 1, 0.2666667, 1,
-0.3306345, 0.4344068, 0.5729205, 0, 1, 0.2745098, 1,
-0.3298216, 0.2343946, -2.381168, 0, 1, 0.2784314, 1,
-0.3239586, -0.9922256, -2.848847, 0, 1, 0.2862745, 1,
-0.3217429, -1.16818, -1.573505, 0, 1, 0.2901961, 1,
-0.3196753, 0.3672287, -0.8847363, 0, 1, 0.2980392, 1,
-0.3152317, 0.6491087, -1.127706, 0, 1, 0.3058824, 1,
-0.3140541, 0.2240528, -0.6520734, 0, 1, 0.3098039, 1,
-0.3122533, -0.9879987, -3.168071, 0, 1, 0.3176471, 1,
-0.3094723, 0.2937169, 0.4949707, 0, 1, 0.3215686, 1,
-0.3084531, 1.687552, -1.037228, 0, 1, 0.3294118, 1,
-0.3054158, -0.5737204, -2.730529, 0, 1, 0.3333333, 1,
-0.3052496, -1.61779, -1.824125, 0, 1, 0.3411765, 1,
-0.3030626, 2.032331, 0.4254539, 0, 1, 0.345098, 1,
-0.2998883, -2.381343, -2.729198, 0, 1, 0.3529412, 1,
-0.2956374, 0.4916719, -0.9742283, 0, 1, 0.3568628, 1,
-0.293406, 1.222203, 1.035887, 0, 1, 0.3647059, 1,
-0.2916724, -0.7144892, -2.572095, 0, 1, 0.3686275, 1,
-0.286404, -0.08975327, -1.085884, 0, 1, 0.3764706, 1,
-0.2858102, -0.9045113, -2.423079, 0, 1, 0.3803922, 1,
-0.2857073, 0.7573203, 0.729787, 0, 1, 0.3882353, 1,
-0.284044, 0.03412493, -3.014963, 0, 1, 0.3921569, 1,
-0.2824142, -1.455173, -4.02912, 0, 1, 0.4, 1,
-0.270411, 1.659852, -0.007184238, 0, 1, 0.4078431, 1,
-0.2698186, 0.6346186, 1.111025, 0, 1, 0.4117647, 1,
-0.2653252, 1.082084, -1.197191, 0, 1, 0.4196078, 1,
-0.2597141, 0.06585047, -2.504492, 0, 1, 0.4235294, 1,
-0.2544506, 0.856191, -1.552441, 0, 1, 0.4313726, 1,
-0.2509147, 1.443274, 0.5238711, 0, 1, 0.4352941, 1,
-0.250286, 0.7190298, -1.56535, 0, 1, 0.4431373, 1,
-0.2480204, 0.1615542, -1.67471, 0, 1, 0.4470588, 1,
-0.2477062, -1.028391, -3.731635, 0, 1, 0.454902, 1,
-0.246357, 0.5609125, -0.4607031, 0, 1, 0.4588235, 1,
-0.2461258, -0.2056634, -1.302621, 0, 1, 0.4666667, 1,
-0.2457594, -2.19217, -4.969591, 0, 1, 0.4705882, 1,
-0.2418127, -1.539623, -2.932794, 0, 1, 0.4784314, 1,
-0.2332725, 0.6615568, -0.5518634, 0, 1, 0.4823529, 1,
-0.2329932, -0.9848983, -4.014362, 0, 1, 0.4901961, 1,
-0.2326071, 1.284912, 0.3949926, 0, 1, 0.4941176, 1,
-0.2300891, -0.01392739, -1.422284, 0, 1, 0.5019608, 1,
-0.2298497, 0.9464329, 0.6359222, 0, 1, 0.509804, 1,
-0.2285601, -0.02465356, -2.933665, 0, 1, 0.5137255, 1,
-0.2273567, -1.542266, -2.178906, 0, 1, 0.5215687, 1,
-0.2268496, 0.8546653, -0.378571, 0, 1, 0.5254902, 1,
-0.2228929, 1.333364, -1.146077, 0, 1, 0.5333334, 1,
-0.2193038, 0.01713637, -3.619882, 0, 1, 0.5372549, 1,
-0.2148984, -0.5093697, -0.8741986, 0, 1, 0.5450981, 1,
-0.214294, 0.2473064, -1.239039, 0, 1, 0.5490196, 1,
-0.2132647, 0.8697551, -0.4114387, 0, 1, 0.5568628, 1,
-0.2094923, 1.026256, -0.0908924, 0, 1, 0.5607843, 1,
-0.2094117, 0.07243938, -2.288463, 0, 1, 0.5686275, 1,
-0.2066349, 0.942793, -1.44606, 0, 1, 0.572549, 1,
-0.2009712, 0.8429472, 0.1484227, 0, 1, 0.5803922, 1,
-0.1996773, 1.136244, -0.890275, 0, 1, 0.5843138, 1,
-0.1989632, -0.5668855, -1.477059, 0, 1, 0.5921569, 1,
-0.1935995, -0.1466352, -3.134709, 0, 1, 0.5960785, 1,
-0.1889335, -0.1468779, -1.822049, 0, 1, 0.6039216, 1,
-0.1888814, -0.07352467, -1.1299, 0, 1, 0.6117647, 1,
-0.1880592, -0.06240629, -0.4822369, 0, 1, 0.6156863, 1,
-0.1871361, 1.103374, 0.6457871, 0, 1, 0.6235294, 1,
-0.1869884, 0.2032245, -0.7060455, 0, 1, 0.627451, 1,
-0.1836457, 0.3963304, 1.054687, 0, 1, 0.6352941, 1,
-0.1804251, -1.58626, -3.464637, 0, 1, 0.6392157, 1,
-0.1785879, -0.2822393, -0.666913, 0, 1, 0.6470588, 1,
-0.1777893, 0.1560819, -0.5327995, 0, 1, 0.6509804, 1,
-0.1765199, -0.01349412, -1.946155, 0, 1, 0.6588235, 1,
-0.1757498, -0.4683831, -1.939786, 0, 1, 0.6627451, 1,
-0.1744804, -1.614852, -3.221619, 0, 1, 0.6705883, 1,
-0.1672909, -0.147541, -2.451035, 0, 1, 0.6745098, 1,
-0.1497593, -1.81104, -2.91641, 0, 1, 0.682353, 1,
-0.1483482, -0.2102673, -2.924007, 0, 1, 0.6862745, 1,
-0.136144, 0.4989773, -0.32668, 0, 1, 0.6941177, 1,
-0.1309952, 0.1744851, 1.47004, 0, 1, 0.7019608, 1,
-0.1249759, -1.337139, -1.690133, 0, 1, 0.7058824, 1,
-0.12495, 0.8537449, 0.7091616, 0, 1, 0.7137255, 1,
-0.1211121, 0.7198805, 0.8270792, 0, 1, 0.7176471, 1,
-0.1178389, -0.680387, -4.444884, 0, 1, 0.7254902, 1,
-0.111896, -1.934299, -4.823699, 0, 1, 0.7294118, 1,
-0.1057212, 0.3635217, 0.1271561, 0, 1, 0.7372549, 1,
-0.09879164, -0.4418086, -3.728206, 0, 1, 0.7411765, 1,
-0.09667321, 0.381909, -0.506516, 0, 1, 0.7490196, 1,
-0.09363183, -0.2117776, -3.23633, 0, 1, 0.7529412, 1,
-0.09189783, -0.7775708, -3.236609, 0, 1, 0.7607843, 1,
-0.08832216, 0.9257419, 0.5647941, 0, 1, 0.7647059, 1,
-0.0843852, 1.540572, 0.1544516, 0, 1, 0.772549, 1,
-0.08281305, 1.002983, 0.6323016, 0, 1, 0.7764706, 1,
-0.08117295, -0.1261456, -1.894241, 0, 1, 0.7843137, 1,
-0.07288799, 1.625293, -0.1328588, 0, 1, 0.7882353, 1,
-0.07288351, 0.5527317, -0.2164572, 0, 1, 0.7960784, 1,
-0.06633477, 0.3662176, 1.348615, 0, 1, 0.8039216, 1,
-0.05564844, -0.2185272, -2.691593, 0, 1, 0.8078431, 1,
-0.05521851, -1.890111, -5.714187, 0, 1, 0.8156863, 1,
-0.0541602, -0.8169663, -3.669557, 0, 1, 0.8196079, 1,
-0.04915194, 0.08972154, -0.8670512, 0, 1, 0.827451, 1,
-0.04787874, 0.909973, -1.414128, 0, 1, 0.8313726, 1,
-0.04324082, 0.9876142, -0.6308548, 0, 1, 0.8392157, 1,
-0.03701187, 1.040463, -0.7118871, 0, 1, 0.8431373, 1,
-0.03645664, -0.1317034, -3.119862, 0, 1, 0.8509804, 1,
-0.03344144, 0.1563011, -1.034054, 0, 1, 0.854902, 1,
-0.02679004, 0.003133151, -0.4886473, 0, 1, 0.8627451, 1,
-0.02675253, -0.1279201, -2.828068, 0, 1, 0.8666667, 1,
-0.02469782, 0.2802665, -0.2439181, 0, 1, 0.8745098, 1,
-0.02449186, 0.111369, -0.8689253, 0, 1, 0.8784314, 1,
-0.02350296, 0.1974192, -1.58737, 0, 1, 0.8862745, 1,
-0.01998902, 1.263712, -0.4149957, 0, 1, 0.8901961, 1,
-0.01702071, -0.5360577, -3.390164, 0, 1, 0.8980392, 1,
-0.01640332, 2.165016, -0.510334, 0, 1, 0.9058824, 1,
-0.01337821, -0.3523049, -2.186458, 0, 1, 0.9098039, 1,
-0.01308494, 0.8121803, -0.2118186, 0, 1, 0.9176471, 1,
-0.01300636, 0.5532677, 0.7592812, 0, 1, 0.9215686, 1,
-0.01111036, -1.024084, -3.241503, 0, 1, 0.9294118, 1,
-0.008637262, -1.4538, -4.495052, 0, 1, 0.9333333, 1,
-0.007960037, -0.1639473, -3.644068, 0, 1, 0.9411765, 1,
-0.007777003, 0.1029012, -1.30488, 0, 1, 0.945098, 1,
-0.006280698, 0.8130436, 1.367798, 0, 1, 0.9529412, 1,
-0.00137759, 1.064348, 1.662711, 0, 1, 0.9568627, 1,
0.0011357, 1.70869, -0.6072982, 0, 1, 0.9647059, 1,
0.007012601, 1.136162, 2.069071, 0, 1, 0.9686275, 1,
0.009787762, 0.1821395, -0.9629638, 0, 1, 0.9764706, 1,
0.02350785, -0.03707903, 1.414916, 0, 1, 0.9803922, 1,
0.02352365, -1.160157, 3.27656, 0, 1, 0.9882353, 1,
0.02508461, -0.516922, 4.036931, 0, 1, 0.9921569, 1,
0.02835385, -0.2532346, 4.591311, 0, 1, 1, 1,
0.03286757, -0.9960935, 4.828055, 0, 0.9921569, 1, 1,
0.03897716, -1.114143, 3.905874, 0, 0.9882353, 1, 1,
0.044703, -0.8214586, 1.035273, 0, 0.9803922, 1, 1,
0.04759486, -0.6403668, 3.260489, 0, 0.9764706, 1, 1,
0.04820255, 1.163373, -1.62808, 0, 0.9686275, 1, 1,
0.05320898, 0.5010689, -0.0122831, 0, 0.9647059, 1, 1,
0.05653912, -1.268859, 3.896309, 0, 0.9568627, 1, 1,
0.05840747, 0.9022757, -0.5245324, 0, 0.9529412, 1, 1,
0.0592804, -1.22185, 3.250614, 0, 0.945098, 1, 1,
0.05936418, -2.114468, 3.078121, 0, 0.9411765, 1, 1,
0.06806824, -0.26544, 4.103898, 0, 0.9333333, 1, 1,
0.06888984, 0.4608116, 1.844198, 0, 0.9294118, 1, 1,
0.07685833, 0.9022605, 0.2272988, 0, 0.9215686, 1, 1,
0.07836571, 0.1940018, 1.22325, 0, 0.9176471, 1, 1,
0.07920469, -0.5425215, 3.78125, 0, 0.9098039, 1, 1,
0.08042479, 1.364409, 0.5108488, 0, 0.9058824, 1, 1,
0.08132873, -0.6425574, 2.431218, 0, 0.8980392, 1, 1,
0.08432171, 1.329998, -0.4617447, 0, 0.8901961, 1, 1,
0.08535338, -0.6408237, 2.770912, 0, 0.8862745, 1, 1,
0.08543475, -0.3610852, 3.593313, 0, 0.8784314, 1, 1,
0.08546034, -0.0006476949, 1.561575, 0, 0.8745098, 1, 1,
0.08558571, -1.027139, 2.138603, 0, 0.8666667, 1, 1,
0.09050652, -0.4999928, 3.371054, 0, 0.8627451, 1, 1,
0.09498253, -1.099877, 2.204698, 0, 0.854902, 1, 1,
0.09794897, -1.1449, 3.44648, 0, 0.8509804, 1, 1,
0.09891123, 0.2628483, 1.404111, 0, 0.8431373, 1, 1,
0.09985588, 0.5036472, 0.8815852, 0, 0.8392157, 1, 1,
0.101765, -0.5173767, 1.275885, 0, 0.8313726, 1, 1,
0.102769, 0.3379312, -0.2671165, 0, 0.827451, 1, 1,
0.1031655, 1.046838, 0.2255524, 0, 0.8196079, 1, 1,
0.1032652, 0.9227115, -0.7708659, 0, 0.8156863, 1, 1,
0.1112255, 0.5050896, -1.683286, 0, 0.8078431, 1, 1,
0.1118752, 0.5114319, -0.892989, 0, 0.8039216, 1, 1,
0.1154741, 1.717349, 1.025539, 0, 0.7960784, 1, 1,
0.1157045, 0.125716, 2.548202, 0, 0.7882353, 1, 1,
0.1193592, -1.172952, 4.500215, 0, 0.7843137, 1, 1,
0.1224006, 1.354308, -0.6625732, 0, 0.7764706, 1, 1,
0.1253983, 0.3004554, 0.1821888, 0, 0.772549, 1, 1,
0.1276943, 0.9855131, -0.1133916, 0, 0.7647059, 1, 1,
0.1317476, 1.564409, -0.6446707, 0, 0.7607843, 1, 1,
0.1339561, -1.133285, 4.692443, 0, 0.7529412, 1, 1,
0.1349903, 0.3660081, 0.4024045, 0, 0.7490196, 1, 1,
0.1400111, -0.3466286, 4.089776, 0, 0.7411765, 1, 1,
0.1414249, 0.2989202, 0.5479783, 0, 0.7372549, 1, 1,
0.1495111, -0.8132911, 2.86075, 0, 0.7294118, 1, 1,
0.1509081, 1.106138, 0.2438653, 0, 0.7254902, 1, 1,
0.1511203, -0.2496519, 1.784803, 0, 0.7176471, 1, 1,
0.1522631, 2.059019, -0.8849679, 0, 0.7137255, 1, 1,
0.1551348, -0.359816, 1.731599, 0, 0.7058824, 1, 1,
0.1552578, -0.2003154, 4.007638, 0, 0.6980392, 1, 1,
0.1565012, -0.5193808, 3.892015, 0, 0.6941177, 1, 1,
0.1569938, 0.875289, -0.5557752, 0, 0.6862745, 1, 1,
0.1607702, 1.627933, -0.9206315, 0, 0.682353, 1, 1,
0.1705381, -0.5302491, 3.425294, 0, 0.6745098, 1, 1,
0.1741734, -0.5183295, 2.219649, 0, 0.6705883, 1, 1,
0.1807252, 0.41472, 1.067276, 0, 0.6627451, 1, 1,
0.1816316, 0.406628, -0.9435893, 0, 0.6588235, 1, 1,
0.181988, 1.216725, 0.0423325, 0, 0.6509804, 1, 1,
0.1835891, -0.808267, 2.650747, 0, 0.6470588, 1, 1,
0.1839041, -0.1978326, 2.305795, 0, 0.6392157, 1, 1,
0.1841194, -1.066511, 0.932705, 0, 0.6352941, 1, 1,
0.1860823, -1.186483, 0.2519927, 0, 0.627451, 1, 1,
0.1908577, 1.254816, -0.6131657, 0, 0.6235294, 1, 1,
0.1946091, -1.028691, 1.599401, 0, 0.6156863, 1, 1,
0.1952246, 0.8655574, 0.0498745, 0, 0.6117647, 1, 1,
0.2002317, -1.660028, 2.922026, 0, 0.6039216, 1, 1,
0.2008665, 1.782472, 1.998796, 0, 0.5960785, 1, 1,
0.2015726, -0.1787928, 0.7423534, 0, 0.5921569, 1, 1,
0.2021245, 0.6127846, 0.4911717, 0, 0.5843138, 1, 1,
0.2029506, 0.75741, 1.731676, 0, 0.5803922, 1, 1,
0.2046618, 0.1431013, 0.1861046, 0, 0.572549, 1, 1,
0.2057265, 0.2365234, 2.649901, 0, 0.5686275, 1, 1,
0.2096223, -0.9072658, 3.283891, 0, 0.5607843, 1, 1,
0.2104224, 0.7351059, 0.3007704, 0, 0.5568628, 1, 1,
0.2105365, 1.077027, 0.4485914, 0, 0.5490196, 1, 1,
0.2136297, 0.3689775, 2.663459, 0, 0.5450981, 1, 1,
0.2269445, 0.2615288, 2.318121, 0, 0.5372549, 1, 1,
0.2288051, 1.08127, 0.06805439, 0, 0.5333334, 1, 1,
0.2294819, -1.609419, 3.086984, 0, 0.5254902, 1, 1,
0.2304904, 0.6881698, 0.007472259, 0, 0.5215687, 1, 1,
0.2342778, 1.128981, 1.823923, 0, 0.5137255, 1, 1,
0.2363889, -0.8028809, 3.287526, 0, 0.509804, 1, 1,
0.238942, 0.5193371, -0.2333469, 0, 0.5019608, 1, 1,
0.2412149, 0.5150988, 0.8078541, 0, 0.4941176, 1, 1,
0.2415729, -0.4500959, 2.971973, 0, 0.4901961, 1, 1,
0.2421112, 1.388686, -0.2384998, 0, 0.4823529, 1, 1,
0.2460785, 0.5442761, -0.1515147, 0, 0.4784314, 1, 1,
0.2479862, 0.1909515, 0.06229622, 0, 0.4705882, 1, 1,
0.2602309, -2.2255, 2.983422, 0, 0.4666667, 1, 1,
0.2625773, -0.3270324, 3.279619, 0, 0.4588235, 1, 1,
0.2629635, 0.8436075, 0.3732191, 0, 0.454902, 1, 1,
0.2631828, -0.8189517, 0.9579411, 0, 0.4470588, 1, 1,
0.2645857, 3.204769, 0.1187766, 0, 0.4431373, 1, 1,
0.2663324, 1.260216, 0.1232254, 0, 0.4352941, 1, 1,
0.2726054, -0.3617512, 2.029113, 0, 0.4313726, 1, 1,
0.274908, -0.04108836, 0.8134463, 0, 0.4235294, 1, 1,
0.2793004, 0.3790191, 1.035405, 0, 0.4196078, 1, 1,
0.2828203, 0.6546308, 0.6070161, 0, 0.4117647, 1, 1,
0.2884626, -0.8307772, 1.45758, 0, 0.4078431, 1, 1,
0.2886921, -0.21732, 2.822912, 0, 0.4, 1, 1,
0.2890523, -0.7640084, 2.255065, 0, 0.3921569, 1, 1,
0.2894487, -0.0258112, 0.0114847, 0, 0.3882353, 1, 1,
0.2904084, -0.2106769, 1.657979, 0, 0.3803922, 1, 1,
0.2906693, -2.820982, 3.147133, 0, 0.3764706, 1, 1,
0.2938868, 0.9997718, 1.285815, 0, 0.3686275, 1, 1,
0.3046046, -1.14756, 4.574977, 0, 0.3647059, 1, 1,
0.3050486, -0.8018648, 2.085766, 0, 0.3568628, 1, 1,
0.3085111, -1.932637, 3.551826, 0, 0.3529412, 1, 1,
0.3096935, -0.4706793, 3.775005, 0, 0.345098, 1, 1,
0.3109437, 0.1182119, 0.8166837, 0, 0.3411765, 1, 1,
0.3141962, -0.02795979, 1.377069, 0, 0.3333333, 1, 1,
0.3191915, -2.330781, 3.405237, 0, 0.3294118, 1, 1,
0.3240316, 0.1378586, -0.1006669, 0, 0.3215686, 1, 1,
0.3258861, 0.6945674, -0.3203595, 0, 0.3176471, 1, 1,
0.3260761, 1.814375, 1.82869, 0, 0.3098039, 1, 1,
0.3272338, -0.02678799, 1.685068, 0, 0.3058824, 1, 1,
0.3313819, -0.4012644, 3.153238, 0, 0.2980392, 1, 1,
0.331386, -2.088782, 2.021872, 0, 0.2901961, 1, 1,
0.3345213, -0.4674852, 2.076098, 0, 0.2862745, 1, 1,
0.3347299, 0.5879102, 0.370817, 0, 0.2784314, 1, 1,
0.3386658, -1.699213, 2.424693, 0, 0.2745098, 1, 1,
0.3400461, -1.3253, 3.605866, 0, 0.2666667, 1, 1,
0.3404756, 0.1113113, 0.5484385, 0, 0.2627451, 1, 1,
0.3420604, -0.1283348, 1.187338, 0, 0.254902, 1, 1,
0.3465614, -1.349687, 2.048529, 0, 0.2509804, 1, 1,
0.3543439, 0.4401191, 0.1909924, 0, 0.2431373, 1, 1,
0.3576424, 1.315663, -0.4833467, 0, 0.2392157, 1, 1,
0.3612914, -1.772711, 3.360923, 0, 0.2313726, 1, 1,
0.3652976, 1.059303, 1.39332, 0, 0.227451, 1, 1,
0.3666121, -0.5153146, 4.300948, 0, 0.2196078, 1, 1,
0.3686496, 1.607643, 0.4765645, 0, 0.2156863, 1, 1,
0.3717305, -2.061514, 4.450221, 0, 0.2078431, 1, 1,
0.3772819, -1.265296, 4.12659, 0, 0.2039216, 1, 1,
0.3791257, -0.09247501, 1.502985, 0, 0.1960784, 1, 1,
0.3859098, 1.30409, 0.3800337, 0, 0.1882353, 1, 1,
0.3869576, -0.4047139, 2.236682, 0, 0.1843137, 1, 1,
0.3895979, 0.5019865, -0.7434986, 0, 0.1764706, 1, 1,
0.3950803, 0.9194204, 0.3214506, 0, 0.172549, 1, 1,
0.396054, 0.6343247, -0.5646229, 0, 0.1647059, 1, 1,
0.3962428, 1.659584, -0.2153387, 0, 0.1607843, 1, 1,
0.3968678, 0.1350212, 1.276644, 0, 0.1529412, 1, 1,
0.402842, 0.7559473, -0.8817722, 0, 0.1490196, 1, 1,
0.4050364, -2.064435, 4.646714, 0, 0.1411765, 1, 1,
0.4056865, -0.06278469, 1.344118, 0, 0.1372549, 1, 1,
0.4064983, -1.561815, 2.779785, 0, 0.1294118, 1, 1,
0.4104377, -1.731601, 3.578494, 0, 0.1254902, 1, 1,
0.420308, 0.73855, 1.039673, 0, 0.1176471, 1, 1,
0.4313446, 0.5394349, 0.637535, 0, 0.1137255, 1, 1,
0.4317753, 1.425602, -0.7003519, 0, 0.1058824, 1, 1,
0.4400552, -0.5613641, 3.940423, 0, 0.09803922, 1, 1,
0.4433869, -0.02839586, 2.092272, 0, 0.09411765, 1, 1,
0.4438609, -0.9274628, 3.587248, 0, 0.08627451, 1, 1,
0.4547627, 1.767559, 0.305404, 0, 0.08235294, 1, 1,
0.4586586, -0.3377413, 3.584388, 0, 0.07450981, 1, 1,
0.4631347, 0.5280721, 2.671951, 0, 0.07058824, 1, 1,
0.4648104, -1.965927, 1.249519, 0, 0.0627451, 1, 1,
0.471891, -0.7858801, 1.663887, 0, 0.05882353, 1, 1,
0.4720936, 0.9527093, 0.1952751, 0, 0.05098039, 1, 1,
0.4735578, -0.8041101, 2.28277, 0, 0.04705882, 1, 1,
0.4755332, -0.5453077, 1.595552, 0, 0.03921569, 1, 1,
0.4761149, 0.7243484, 0.08720829, 0, 0.03529412, 1, 1,
0.4780191, -1.378613, 1.02901, 0, 0.02745098, 1, 1,
0.4807577, -1.652466, 2.154856, 0, 0.02352941, 1, 1,
0.4812277, 0.4093483, -1.054755, 0, 0.01568628, 1, 1,
0.4824027, -0.1337394, 1.67021, 0, 0.01176471, 1, 1,
0.4852854, 0.4097469, 1.172956, 0, 0.003921569, 1, 1,
0.485915, -0.7777202, 3.150334, 0.003921569, 0, 1, 1,
0.4974429, -1.727279, 1.409792, 0.007843138, 0, 1, 1,
0.4978123, 0.1822259, 1.947913, 0.01568628, 0, 1, 1,
0.5014383, 1.414044, -1.389019, 0.01960784, 0, 1, 1,
0.504814, 0.2361489, 1.364704, 0.02745098, 0, 1, 1,
0.5070438, 0.38302, 0.07109675, 0.03137255, 0, 1, 1,
0.5070948, 0.3162448, 0.6922252, 0.03921569, 0, 1, 1,
0.508958, -1.462822, 2.191981, 0.04313726, 0, 1, 1,
0.5146757, 0.5667768, 1.053754, 0.05098039, 0, 1, 1,
0.520694, 1.950406, -0.4754883, 0.05490196, 0, 1, 1,
0.5220974, -0.2580487, 1.525653, 0.0627451, 0, 1, 1,
0.5224919, -0.4327133, 2.359524, 0.06666667, 0, 1, 1,
0.5263703, 0.176453, 0.8952271, 0.07450981, 0, 1, 1,
0.5290809, -0.6113878, 2.60044, 0.07843138, 0, 1, 1,
0.5320593, 0.4067796, 2.189324, 0.08627451, 0, 1, 1,
0.5339077, 0.9750042, 1.304588, 0.09019608, 0, 1, 1,
0.5342576, 0.2565002, 0.9220821, 0.09803922, 0, 1, 1,
0.5396475, -0.6156646, 3.881001, 0.1058824, 0, 1, 1,
0.5475507, -0.1547827, 5.13795, 0.1098039, 0, 1, 1,
0.5484238, 1.03385, 0.3132439, 0.1176471, 0, 1, 1,
0.5558208, -0.1541635, 2.919916, 0.1215686, 0, 1, 1,
0.5647387, -1.198188, 2.246341, 0.1294118, 0, 1, 1,
0.5666581, -0.4830487, 3.375283, 0.1333333, 0, 1, 1,
0.5699359, 0.180735, 2.474598, 0.1411765, 0, 1, 1,
0.5704779, 0.02348843, 1.309254, 0.145098, 0, 1, 1,
0.5737838, 0.9308594, -0.7456846, 0.1529412, 0, 1, 1,
0.5742981, 0.9673013, -0.5738031, 0.1568628, 0, 1, 1,
0.5783545, 1.470865, 1.115942, 0.1647059, 0, 1, 1,
0.5804744, -0.7619942, 3.239559, 0.1686275, 0, 1, 1,
0.5832887, -1.820368, 1.795064, 0.1764706, 0, 1, 1,
0.5835487, -1.12979, 2.189327, 0.1803922, 0, 1, 1,
0.5840928, 0.3729712, 1.240806, 0.1882353, 0, 1, 1,
0.5908551, -1.494481, 1.974103, 0.1921569, 0, 1, 1,
0.5926945, -0.7665436, 4.270886, 0.2, 0, 1, 1,
0.5933384, -0.7812752, 2.962951, 0.2078431, 0, 1, 1,
0.6038269, -0.5166419, 1.224156, 0.2117647, 0, 1, 1,
0.6047293, 0.8387367, -0.494107, 0.2196078, 0, 1, 1,
0.6095515, -2.1077, 3.343082, 0.2235294, 0, 1, 1,
0.6117507, -1.443809, 2.487985, 0.2313726, 0, 1, 1,
0.6132051, 0.5379419, -0.177812, 0.2352941, 0, 1, 1,
0.6139002, -1.802978, 4.060367, 0.2431373, 0, 1, 1,
0.6157577, -2.225408, 3.389035, 0.2470588, 0, 1, 1,
0.6163687, 0.211049, 1.924634, 0.254902, 0, 1, 1,
0.6208308, -0.6626316, 3.34076, 0.2588235, 0, 1, 1,
0.6234523, -0.7961804, 3.096063, 0.2666667, 0, 1, 1,
0.6250952, -1.252246, 3.042868, 0.2705882, 0, 1, 1,
0.6304119, -0.5847021, 4.066788, 0.2784314, 0, 1, 1,
0.631761, 1.04643, 0.4698852, 0.282353, 0, 1, 1,
0.6344097, 0.007771287, 0.04121614, 0.2901961, 0, 1, 1,
0.6422448, 0.6603728, 1.441645, 0.2941177, 0, 1, 1,
0.6434909, 0.5071434, 1.009499, 0.3019608, 0, 1, 1,
0.6446558, -0.522178, 2.275031, 0.3098039, 0, 1, 1,
0.6456791, -0.3734955, 2.572869, 0.3137255, 0, 1, 1,
0.6469888, -1.600469, 2.916387, 0.3215686, 0, 1, 1,
0.6477842, -1.507396, 4.146713, 0.3254902, 0, 1, 1,
0.6479242, 1.727211, 1.634228, 0.3333333, 0, 1, 1,
0.6486713, 0.01780217, 2.855355, 0.3372549, 0, 1, 1,
0.6487403, -0.3099761, 1.082322, 0.345098, 0, 1, 1,
0.6513814, -1.509622, 3.323888, 0.3490196, 0, 1, 1,
0.6529449, 1.259587, 0.5014333, 0.3568628, 0, 1, 1,
0.6616536, -1.716786, 4.763978, 0.3607843, 0, 1, 1,
0.6626983, 0.7451897, 1.67671, 0.3686275, 0, 1, 1,
0.6655883, 0.3834366, 3.007168, 0.372549, 0, 1, 1,
0.6714338, 0.9626881, 1.169027, 0.3803922, 0, 1, 1,
0.6860015, 0.007692368, 2.991552, 0.3843137, 0, 1, 1,
0.6913974, -0.9889971, 2.823613, 0.3921569, 0, 1, 1,
0.7021372, -0.7069154, 2.917314, 0.3960784, 0, 1, 1,
0.7036157, -1.036405, 2.317962, 0.4039216, 0, 1, 1,
0.7042383, 0.1656315, -0.3663177, 0.4117647, 0, 1, 1,
0.704364, -1.863961, 2.31532, 0.4156863, 0, 1, 1,
0.7051483, -0.1511228, 3.071412, 0.4235294, 0, 1, 1,
0.7104445, 0.009455394, 1.397368, 0.427451, 0, 1, 1,
0.7141154, 0.09706077, 1.488527, 0.4352941, 0, 1, 1,
0.7149048, 0.4813092, 1.01051, 0.4392157, 0, 1, 1,
0.7167994, -1.766251, 2.24458, 0.4470588, 0, 1, 1,
0.7204603, 0.3343409, 1.228907, 0.4509804, 0, 1, 1,
0.7205428, 0.1639865, 1.362441, 0.4588235, 0, 1, 1,
0.7211944, 0.4322089, 1.546746, 0.4627451, 0, 1, 1,
0.7274573, 0.9474825, -1.512654, 0.4705882, 0, 1, 1,
0.734996, 1.013618, 0.5822508, 0.4745098, 0, 1, 1,
0.7364943, -0.9088092, 3.99026, 0.4823529, 0, 1, 1,
0.7379102, -0.7538132, 0.6169471, 0.4862745, 0, 1, 1,
0.7391893, -1.349362, 5.285239, 0.4941176, 0, 1, 1,
0.739976, -0.426685, 1.718419, 0.5019608, 0, 1, 1,
0.7517716, -1.008277, 1.678968, 0.5058824, 0, 1, 1,
0.7522168, 0.06358603, -0.2433819, 0.5137255, 0, 1, 1,
0.7561836, -0.0226346, 1.074146, 0.5176471, 0, 1, 1,
0.7615216, 0.103578, 1.561812, 0.5254902, 0, 1, 1,
0.7679198, 0.06396372, 1.586403, 0.5294118, 0, 1, 1,
0.7779809, -0.5072024, 1.760926, 0.5372549, 0, 1, 1,
0.778146, -0.4885018, 3.075658, 0.5411765, 0, 1, 1,
0.7801127, -0.1793996, 1.967397, 0.5490196, 0, 1, 1,
0.7855775, 0.2388552, 0.8544991, 0.5529412, 0, 1, 1,
0.7864547, -0.9339364, 2.08618, 0.5607843, 0, 1, 1,
0.7871003, -0.4408772, 2.225638, 0.5647059, 0, 1, 1,
0.7950408, 0.8213853, 2.462688, 0.572549, 0, 1, 1,
0.8010544, 0.1450034, 2.261213, 0.5764706, 0, 1, 1,
0.8070805, 0.1764581, 1.021073, 0.5843138, 0, 1, 1,
0.8087265, 0.4457551, 0.7496751, 0.5882353, 0, 1, 1,
0.8115364, -0.9612498, 1.338537, 0.5960785, 0, 1, 1,
0.8121738, -0.5586087, 1.238854, 0.6039216, 0, 1, 1,
0.8154782, 0.6980933, 1.545536, 0.6078432, 0, 1, 1,
0.8162664, 0.1722777, 1.800426, 0.6156863, 0, 1, 1,
0.8163647, 1.248571, -0.7914698, 0.6196079, 0, 1, 1,
0.8316393, 1.766886, 0.8334355, 0.627451, 0, 1, 1,
0.8360598, -0.8993683, 3.839819, 0.6313726, 0, 1, 1,
0.8373092, 0.2012285, 0.4353606, 0.6392157, 0, 1, 1,
0.8481874, 0.000375315, 0.7300423, 0.6431373, 0, 1, 1,
0.8495806, -1.018967, 2.104182, 0.6509804, 0, 1, 1,
0.8521243, 0.4930784, 0.9782112, 0.654902, 0, 1, 1,
0.852931, 0.8151042, -1.340525, 0.6627451, 0, 1, 1,
0.8535644, -1.434481, 3.279925, 0.6666667, 0, 1, 1,
0.8557707, 0.2910697, 1.667552, 0.6745098, 0, 1, 1,
0.8562472, 0.1813514, 0.07306065, 0.6784314, 0, 1, 1,
0.8659987, -0.07780667, 2.621155, 0.6862745, 0, 1, 1,
0.8708916, -0.6543612, 2.533156, 0.6901961, 0, 1, 1,
0.8714502, -0.6614743, 2.059564, 0.6980392, 0, 1, 1,
0.8717732, 0.3330519, 1.722473, 0.7058824, 0, 1, 1,
0.8870217, 0.003540032, 1.714493, 0.7098039, 0, 1, 1,
0.8904558, -0.5964226, 0.8182073, 0.7176471, 0, 1, 1,
0.8939299, -1.246933, 2.561561, 0.7215686, 0, 1, 1,
0.8948072, -0.2581268, 4.657292, 0.7294118, 0, 1, 1,
0.9118757, 0.08504672, 0.5565584, 0.7333333, 0, 1, 1,
0.9128771, 0.7956215, -0.5261021, 0.7411765, 0, 1, 1,
0.9172925, -0.2495397, 2.24682, 0.7450981, 0, 1, 1,
0.9202669, -0.3317806, 1.249524, 0.7529412, 0, 1, 1,
0.9216621, 0.4456867, 1.282946, 0.7568628, 0, 1, 1,
0.9269255, -1.748442, 1.572542, 0.7647059, 0, 1, 1,
0.929599, -0.534821, 1.025907, 0.7686275, 0, 1, 1,
0.9339812, 0.2000903, 2.536405, 0.7764706, 0, 1, 1,
0.9340893, -0.2846691, 1.534397, 0.7803922, 0, 1, 1,
0.9358303, -0.5332506, 1.476626, 0.7882353, 0, 1, 1,
0.9363025, -0.7511908, 1.978615, 0.7921569, 0, 1, 1,
0.9426049, -0.4012478, 1.128633, 0.8, 0, 1, 1,
0.9436492, 2.738867, 1.780753, 0.8078431, 0, 1, 1,
0.9445876, 2.107872, -1.028527, 0.8117647, 0, 1, 1,
0.9509628, -0.08434226, 3.140381, 0.8196079, 0, 1, 1,
0.961495, 0.6834136, 2.397156, 0.8235294, 0, 1, 1,
0.9623467, 0.1691354, 1.635632, 0.8313726, 0, 1, 1,
0.9715724, 2.622514, 0.4539393, 0.8352941, 0, 1, 1,
0.9721804, 0.9897683, 0.05968857, 0.8431373, 0, 1, 1,
0.9776654, -0.2994276, 1.112984, 0.8470588, 0, 1, 1,
0.982105, -0.3998393, 2.285953, 0.854902, 0, 1, 1,
0.9833926, -0.1251913, 1.865573, 0.8588235, 0, 1, 1,
0.9882126, -1.52898, 2.801992, 0.8666667, 0, 1, 1,
0.9932383, -1.031998, 3.73056, 0.8705882, 0, 1, 1,
0.9944405, 2.386034, 0.6028118, 0.8784314, 0, 1, 1,
0.9963464, -0.4185951, 0.794193, 0.8823529, 0, 1, 1,
0.9981941, 0.5499018, 2.560418, 0.8901961, 0, 1, 1,
0.9983358, 0.9155966, -1.484781, 0.8941177, 0, 1, 1,
1.028964, 2.162089, 2.485137, 0.9019608, 0, 1, 1,
1.031564, -0.2638365, 2.039411, 0.9098039, 0, 1, 1,
1.033435, -0.9548171, -0.1726809, 0.9137255, 0, 1, 1,
1.033982, -0.2884111, 2.934646, 0.9215686, 0, 1, 1,
1.034603, -0.219172, 3.030186, 0.9254902, 0, 1, 1,
1.035974, 0.1725098, 1.301891, 0.9333333, 0, 1, 1,
1.03799, 1.356531, 0.872135, 0.9372549, 0, 1, 1,
1.039921, 0.2044226, 1.517236, 0.945098, 0, 1, 1,
1.043316, -0.4252216, 0.7456397, 0.9490196, 0, 1, 1,
1.044384, 1.604342, 1.774464, 0.9568627, 0, 1, 1,
1.04453, -0.4609757, 1.458174, 0.9607843, 0, 1, 1,
1.044842, -0.4290691, 1.474801, 0.9686275, 0, 1, 1,
1.048868, 0.1897953, 0.6349036, 0.972549, 0, 1, 1,
1.049857, 1.94344, -0.508413, 0.9803922, 0, 1, 1,
1.051115, 1.280296, 2.132411, 0.9843137, 0, 1, 1,
1.051141, -1.784526, 2.3203, 0.9921569, 0, 1, 1,
1.060269, 1.970254, 1.011192, 0.9960784, 0, 1, 1,
1.061049, -2.781045, 3.050876, 1, 0, 0.9960784, 1,
1.061082, 0.1723827, 1.020476, 1, 0, 0.9882353, 1,
1.061221, -0.3705825, 3.059808, 1, 0, 0.9843137, 1,
1.063941, -1.575184, 5.350022, 1, 0, 0.9764706, 1,
1.064341, 1.602688, 0.9413839, 1, 0, 0.972549, 1,
1.065782, 0.1753415, 0.5674458, 1, 0, 0.9647059, 1,
1.065923, -0.3885949, 0.1068278, 1, 0, 0.9607843, 1,
1.069528, 0.1629532, 2.369884, 1, 0, 0.9529412, 1,
1.070555, 0.7243999, 1.777878, 1, 0, 0.9490196, 1,
1.087117, -0.3736593, 2.84394, 1, 0, 0.9411765, 1,
1.087462, 0.5808619, -0.1214587, 1, 0, 0.9372549, 1,
1.091633, 0.84127, -0.1560101, 1, 0, 0.9294118, 1,
1.099799, 0.02524383, 2.199386, 1, 0, 0.9254902, 1,
1.100479, 1.072132, 2.065536, 1, 0, 0.9176471, 1,
1.101934, 0.5993989, 3.380353, 1, 0, 0.9137255, 1,
1.102968, -0.8031933, 3.043545, 1, 0, 0.9058824, 1,
1.108442, -1.476113, 1.657461, 1, 0, 0.9019608, 1,
1.114454, 0.3521543, -0.09684642, 1, 0, 0.8941177, 1,
1.117112, 1.647936, 0.01419111, 1, 0, 0.8862745, 1,
1.118235, -0.4965879, 1.095266, 1, 0, 0.8823529, 1,
1.130059, 0.1472607, 0.1984355, 1, 0, 0.8745098, 1,
1.136604, -0.579182, 1.882807, 1, 0, 0.8705882, 1,
1.141283, -1.763274, 1.164109, 1, 0, 0.8627451, 1,
1.143343, 0.4219015, 3.053911, 1, 0, 0.8588235, 1,
1.149349, 1.648077, 1.236505, 1, 0, 0.8509804, 1,
1.15034, -0.7619583, 1.911136, 1, 0, 0.8470588, 1,
1.150466, 0.3230499, 1.172167, 1, 0, 0.8392157, 1,
1.154276, -0.04052254, 1.567385, 1, 0, 0.8352941, 1,
1.163487, 0.9275385, 1.357141, 1, 0, 0.827451, 1,
1.163667, 0.5022451, 4.197958, 1, 0, 0.8235294, 1,
1.166504, 1.26032, 1.087086, 1, 0, 0.8156863, 1,
1.166976, -0.3062937, 2.385308, 1, 0, 0.8117647, 1,
1.167646, -1.452772, 0.7438059, 1, 0, 0.8039216, 1,
1.171181, 0.4585766, 0.6488836, 1, 0, 0.7960784, 1,
1.182247, 1.227056, 1.509904, 1, 0, 0.7921569, 1,
1.183306, -0.1059461, 2.642658, 1, 0, 0.7843137, 1,
1.188661, -2.331628, 1.799369, 1, 0, 0.7803922, 1,
1.199023, 0.1475569, 1.717681, 1, 0, 0.772549, 1,
1.20021, 0.3252902, 1.051245, 1, 0, 0.7686275, 1,
1.20576, -0.2331312, 1.097568, 1, 0, 0.7607843, 1,
1.205811, 1.236077, 0.3218656, 1, 0, 0.7568628, 1,
1.206919, 0.1177012, 1.240283, 1, 0, 0.7490196, 1,
1.208788, 1.16039, 0.3748605, 1, 0, 0.7450981, 1,
1.216278, 0.3883834, 2.607352, 1, 0, 0.7372549, 1,
1.218268, -0.355626, 0.8049442, 1, 0, 0.7333333, 1,
1.223859, 0.1800511, 0.0177404, 1, 0, 0.7254902, 1,
1.228538, 0.5123011, 1.697501, 1, 0, 0.7215686, 1,
1.241228, 1.400354, 0.1628435, 1, 0, 0.7137255, 1,
1.242343, -0.2780766, 1.186068, 1, 0, 0.7098039, 1,
1.244713, -0.4520968, 2.753628, 1, 0, 0.7019608, 1,
1.25098, 0.02622101, 2.725859, 1, 0, 0.6941177, 1,
1.253832, 0.3132793, 1.203451, 1, 0, 0.6901961, 1,
1.255748, 1.09446, 1.947974, 1, 0, 0.682353, 1,
1.261504, 1.105996, 1.309576, 1, 0, 0.6784314, 1,
1.265802, -0.598676, 2.109634, 1, 0, 0.6705883, 1,
1.270663, -0.1998662, 1.711924, 1, 0, 0.6666667, 1,
1.277653, 0.07768407, 2.005444, 1, 0, 0.6588235, 1,
1.287493, 2.096058, 1.01378, 1, 0, 0.654902, 1,
1.28985, 0.286173, 1.532976, 1, 0, 0.6470588, 1,
1.291508, -0.7332972, 2.88853, 1, 0, 0.6431373, 1,
1.299451, 0.2094279, 2.197687, 1, 0, 0.6352941, 1,
1.301052, 1.453151, 1.1541, 1, 0, 0.6313726, 1,
1.303528, -0.5569431, 0.9143158, 1, 0, 0.6235294, 1,
1.310417, -0.1652467, 1.693059, 1, 0, 0.6196079, 1,
1.318362, -0.6638768, 2.842948, 1, 0, 0.6117647, 1,
1.319738, 1.280543, 1.136216, 1, 0, 0.6078432, 1,
1.32969, -0.4229735, 1.992923, 1, 0, 0.6, 1,
1.35283, 0.8868387, 0.1218312, 1, 0, 0.5921569, 1,
1.354842, 0.05479047, 0.9881863, 1, 0, 0.5882353, 1,
1.358532, -0.40917, 1.644944, 1, 0, 0.5803922, 1,
1.359249, 1.147622, -0.2910964, 1, 0, 0.5764706, 1,
1.366801, 0.8513109, 0.4857824, 1, 0, 0.5686275, 1,
1.374968, 0.975404, 0.3372123, 1, 0, 0.5647059, 1,
1.37913, 2.875642, -0.8628975, 1, 0, 0.5568628, 1,
1.383291, -0.1925054, 0.9434527, 1, 0, 0.5529412, 1,
1.384045, 0.1223786, -0.6013128, 1, 0, 0.5450981, 1,
1.387363, -0.2027983, 2.029761, 1, 0, 0.5411765, 1,
1.393819, -0.2352985, 0.621469, 1, 0, 0.5333334, 1,
1.406716, -0.6011588, 1.043446, 1, 0, 0.5294118, 1,
1.406929, -1.075625, 0.3073182, 1, 0, 0.5215687, 1,
1.40925, -0.02257147, 0.7664412, 1, 0, 0.5176471, 1,
1.41388, 1.945851, -1.002204, 1, 0, 0.509804, 1,
1.424982, 0.1995336, 2.051263, 1, 0, 0.5058824, 1,
1.426466, -0.06557222, 1.286912, 1, 0, 0.4980392, 1,
1.432489, -0.2203047, 2.805783, 1, 0, 0.4901961, 1,
1.455148, 1.600363, 0.1404588, 1, 0, 0.4862745, 1,
1.456684, -1.216414, 1.426099, 1, 0, 0.4784314, 1,
1.459949, -0.5312174, 1.710993, 1, 0, 0.4745098, 1,
1.461072, 0.1399817, 1.122789, 1, 0, 0.4666667, 1,
1.470577, 0.9059411, 2.657713, 1, 0, 0.4627451, 1,
1.473301, 0.2377965, 3.101996, 1, 0, 0.454902, 1,
1.492543, -0.1927053, -0.3005331, 1, 0, 0.4509804, 1,
1.497639, -0.4333721, 2.529757, 1, 0, 0.4431373, 1,
1.509578, 0.005266308, -1.054962, 1, 0, 0.4392157, 1,
1.514349, 1.447683, 0.9998261, 1, 0, 0.4313726, 1,
1.518225, 0.8679667, 0.3316881, 1, 0, 0.427451, 1,
1.524182, -0.7704038, 0.9074181, 1, 0, 0.4196078, 1,
1.52489, -0.1640439, 0.994181, 1, 0, 0.4156863, 1,
1.538821, -0.09486779, 1.945869, 1, 0, 0.4078431, 1,
1.543729, -1.277228, 2.636108, 1, 0, 0.4039216, 1,
1.546556, -0.7240341, 2.79608, 1, 0, 0.3960784, 1,
1.554597, 0.6530034, 2.010186, 1, 0, 0.3882353, 1,
1.566115, -1.392013, 2.992738, 1, 0, 0.3843137, 1,
1.573163, 0.2452768, 1.980515, 1, 0, 0.3764706, 1,
1.589834, 0.08286639, 1.46959, 1, 0, 0.372549, 1,
1.605288, 1.009963, 1.845805, 1, 0, 0.3647059, 1,
1.607654, 0.7390044, 0.5852602, 1, 0, 0.3607843, 1,
1.615526, -0.8444197, 0.8104388, 1, 0, 0.3529412, 1,
1.647467, 0.04159873, 1.988265, 1, 0, 0.3490196, 1,
1.675988, 0.8326385, 1.450677, 1, 0, 0.3411765, 1,
1.709977, -0.09510358, 2.337714, 1, 0, 0.3372549, 1,
1.710959, -0.1619128, 1.720166, 1, 0, 0.3294118, 1,
1.749952, 0.5515655, 0.5834241, 1, 0, 0.3254902, 1,
1.762224, 1.603008, 0.2530042, 1, 0, 0.3176471, 1,
1.762804, -0.4736323, 2.359094, 1, 0, 0.3137255, 1,
1.767895, -0.4226609, 3.491936, 1, 0, 0.3058824, 1,
1.775292, -2.036827, 2.436666, 1, 0, 0.2980392, 1,
1.779124, -1.166127, 1.709572, 1, 0, 0.2941177, 1,
1.795, -0.8631531, 2.751497, 1, 0, 0.2862745, 1,
1.800487, -0.3948886, -0.5567282, 1, 0, 0.282353, 1,
1.807105, -0.7446164, 2.787396, 1, 0, 0.2745098, 1,
1.8142, 0.2425114, 1.950897, 1, 0, 0.2705882, 1,
1.815109, -1.495875, 3.008403, 1, 0, 0.2627451, 1,
1.839084, -1.648896, 1.931101, 1, 0, 0.2588235, 1,
1.851839, 0.1633719, 1.376116, 1, 0, 0.2509804, 1,
1.86575, -0.2701463, 3.749804, 1, 0, 0.2470588, 1,
1.872108, 0.4211998, 2.828693, 1, 0, 0.2392157, 1,
1.890386, -1.674721, 3.873718, 1, 0, 0.2352941, 1,
1.911827, -1.230953, 2.321944, 1, 0, 0.227451, 1,
1.92763, 0.9746022, 1.811836, 1, 0, 0.2235294, 1,
1.932972, -0.04846178, 1.911676, 1, 0, 0.2156863, 1,
1.935842, 0.3542528, 0.7325091, 1, 0, 0.2117647, 1,
1.942791, 1.176327, 1.890921, 1, 0, 0.2039216, 1,
1.943293, 0.464175, 0.4167294, 1, 0, 0.1960784, 1,
1.947663, -0.8730993, 2.196936, 1, 0, 0.1921569, 1,
1.956578, 1.064587, 1.694777, 1, 0, 0.1843137, 1,
1.960678, 0.6341037, 2.213588, 1, 0, 0.1803922, 1,
1.970247, 0.5094625, 2.328763, 1, 0, 0.172549, 1,
1.981363, 0.5045866, 0.5739783, 1, 0, 0.1686275, 1,
2.057551, -0.9693735, 0.5838783, 1, 0, 0.1607843, 1,
2.063397, -0.2075949, 3.115317, 1, 0, 0.1568628, 1,
2.104049, 0.737034, 1.534491, 1, 0, 0.1490196, 1,
2.117808, 1.095008, -0.131486, 1, 0, 0.145098, 1,
2.119962, 0.3602958, 1.646953, 1, 0, 0.1372549, 1,
2.148931, -1.47631, 0.7271211, 1, 0, 0.1333333, 1,
2.155914, 1.367035, 0.2460972, 1, 0, 0.1254902, 1,
2.194337, 1.11504, 0.8302163, 1, 0, 0.1215686, 1,
2.195619, 0.2710425, 0.2413708, 1, 0, 0.1137255, 1,
2.22538, -0.9559637, 0.8793906, 1, 0, 0.1098039, 1,
2.253531, -0.01474635, 0.6425435, 1, 0, 0.1019608, 1,
2.256481, -1.542232, 2.973155, 1, 0, 0.09411765, 1,
2.280029, -0.3595585, 1.540409, 1, 0, 0.09019608, 1,
2.28446, -0.2382556, 1.640647, 1, 0, 0.08235294, 1,
2.325471, 0.350539, 1.559264, 1, 0, 0.07843138, 1,
2.472175, 0.3901701, 1.101356, 1, 0, 0.07058824, 1,
2.482147, 0.09654338, 0.1210666, 1, 0, 0.06666667, 1,
2.49661, 0.1440369, 1.864792, 1, 0, 0.05882353, 1,
2.561257, 0.009934435, 1.161677, 1, 0, 0.05490196, 1,
2.67227, -0.7792921, 0.7415865, 1, 0, 0.04705882, 1,
2.756299, 0.2259404, 1.447284, 1, 0, 0.04313726, 1,
2.806756, -0.05160199, 1.681549, 1, 0, 0.03529412, 1,
2.816564, -0.4205359, 2.682597, 1, 0, 0.03137255, 1,
2.948727, -0.6431947, 3.098968, 1, 0, 0.02352941, 1,
3.18841, 0.4679455, 0.06257972, 1, 0, 0.01960784, 1,
3.312209, -0.5838422, 0.9899381, 1, 0, 0.01176471, 1,
4.064847, -0.9698659, -0.04951226, 1, 0, 0.007843138, 1
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
0.4690633, -4.014081, -7.58957, 0, -0.5, 0.5, 0.5,
0.4690633, -4.014081, -7.58957, 1, -0.5, 0.5, 0.5,
0.4690633, -4.014081, -7.58957, 1, 1.5, 0.5, 0.5,
0.4690633, -4.014081, -7.58957, 0, 1.5, 0.5, 0.5
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
-4.345691, 0.1184715, -7.58957, 0, -0.5, 0.5, 0.5,
-4.345691, 0.1184715, -7.58957, 1, -0.5, 0.5, 0.5,
-4.345691, 0.1184715, -7.58957, 1, 1.5, 0.5, 0.5,
-4.345691, 0.1184715, -7.58957, 0, 1.5, 0.5, 0.5
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
-4.345691, -4.014081, -0.1820822, 0, -0.5, 0.5, 0.5,
-4.345691, -4.014081, -0.1820822, 1, -0.5, 0.5, 0.5,
-4.345691, -4.014081, -0.1820822, 1, 1.5, 0.5, 0.5,
-4.345691, -4.014081, -0.1820822, 0, 1.5, 0.5, 0.5
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
-2, -3.060415, -5.88015,
4, -3.060415, -5.88015,
-2, -3.060415, -5.88015,
-2, -3.219359, -6.165053,
0, -3.060415, -5.88015,
0, -3.219359, -6.165053,
2, -3.060415, -5.88015,
2, -3.219359, -6.165053,
4, -3.060415, -5.88015,
4, -3.219359, -6.165053
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
"0",
"2",
"4"
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
-2, -3.537248, -6.73486, 0, -0.5, 0.5, 0.5,
-2, -3.537248, -6.73486, 1, -0.5, 0.5, 0.5,
-2, -3.537248, -6.73486, 1, 1.5, 0.5, 0.5,
-2, -3.537248, -6.73486, 0, 1.5, 0.5, 0.5,
0, -3.537248, -6.73486, 0, -0.5, 0.5, 0.5,
0, -3.537248, -6.73486, 1, -0.5, 0.5, 0.5,
0, -3.537248, -6.73486, 1, 1.5, 0.5, 0.5,
0, -3.537248, -6.73486, 0, 1.5, 0.5, 0.5,
2, -3.537248, -6.73486, 0, -0.5, 0.5, 0.5,
2, -3.537248, -6.73486, 1, -0.5, 0.5, 0.5,
2, -3.537248, -6.73486, 1, 1.5, 0.5, 0.5,
2, -3.537248, -6.73486, 0, 1.5, 0.5, 0.5,
4, -3.537248, -6.73486, 0, -0.5, 0.5, 0.5,
4, -3.537248, -6.73486, 1, -0.5, 0.5, 0.5,
4, -3.537248, -6.73486, 1, 1.5, 0.5, 0.5,
4, -3.537248, -6.73486, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.234594, -2, -5.88015,
-3.234594, 3, -5.88015,
-3.234594, -2, -5.88015,
-3.419777, -2, -6.165053,
-3.234594, -1, -5.88015,
-3.419777, -1, -6.165053,
-3.234594, 0, -5.88015,
-3.419777, 0, -6.165053,
-3.234594, 1, -5.88015,
-3.419777, 1, -6.165053,
-3.234594, 2, -5.88015,
-3.419777, 2, -6.165053,
-3.234594, 3, -5.88015,
-3.419777, 3, -6.165053
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
-3.790143, -2, -6.73486, 0, -0.5, 0.5, 0.5,
-3.790143, -2, -6.73486, 1, -0.5, 0.5, 0.5,
-3.790143, -2, -6.73486, 1, 1.5, 0.5, 0.5,
-3.790143, -2, -6.73486, 0, 1.5, 0.5, 0.5,
-3.790143, -1, -6.73486, 0, -0.5, 0.5, 0.5,
-3.790143, -1, -6.73486, 1, -0.5, 0.5, 0.5,
-3.790143, -1, -6.73486, 1, 1.5, 0.5, 0.5,
-3.790143, -1, -6.73486, 0, 1.5, 0.5, 0.5,
-3.790143, 0, -6.73486, 0, -0.5, 0.5, 0.5,
-3.790143, 0, -6.73486, 1, -0.5, 0.5, 0.5,
-3.790143, 0, -6.73486, 1, 1.5, 0.5, 0.5,
-3.790143, 0, -6.73486, 0, 1.5, 0.5, 0.5,
-3.790143, 1, -6.73486, 0, -0.5, 0.5, 0.5,
-3.790143, 1, -6.73486, 1, -0.5, 0.5, 0.5,
-3.790143, 1, -6.73486, 1, 1.5, 0.5, 0.5,
-3.790143, 1, -6.73486, 0, 1.5, 0.5, 0.5,
-3.790143, 2, -6.73486, 0, -0.5, 0.5, 0.5,
-3.790143, 2, -6.73486, 1, -0.5, 0.5, 0.5,
-3.790143, 2, -6.73486, 1, 1.5, 0.5, 0.5,
-3.790143, 2, -6.73486, 0, 1.5, 0.5, 0.5,
-3.790143, 3, -6.73486, 0, -0.5, 0.5, 0.5,
-3.790143, 3, -6.73486, 1, -0.5, 0.5, 0.5,
-3.790143, 3, -6.73486, 1, 1.5, 0.5, 0.5,
-3.790143, 3, -6.73486, 0, 1.5, 0.5, 0.5
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
-3.234594, -3.060415, -4,
-3.234594, -3.060415, 4,
-3.234594, -3.060415, -4,
-3.419777, -3.219359, -4,
-3.234594, -3.060415, -2,
-3.419777, -3.219359, -2,
-3.234594, -3.060415, 0,
-3.419777, -3.219359, 0,
-3.234594, -3.060415, 2,
-3.419777, -3.219359, 2,
-3.234594, -3.060415, 4,
-3.419777, -3.219359, 4
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
-3.790143, -3.537248, -4, 0, -0.5, 0.5, 0.5,
-3.790143, -3.537248, -4, 1, -0.5, 0.5, 0.5,
-3.790143, -3.537248, -4, 1, 1.5, 0.5, 0.5,
-3.790143, -3.537248, -4, 0, 1.5, 0.5, 0.5,
-3.790143, -3.537248, -2, 0, -0.5, 0.5, 0.5,
-3.790143, -3.537248, -2, 1, -0.5, 0.5, 0.5,
-3.790143, -3.537248, -2, 1, 1.5, 0.5, 0.5,
-3.790143, -3.537248, -2, 0, 1.5, 0.5, 0.5,
-3.790143, -3.537248, 0, 0, -0.5, 0.5, 0.5,
-3.790143, -3.537248, 0, 1, -0.5, 0.5, 0.5,
-3.790143, -3.537248, 0, 1, 1.5, 0.5, 0.5,
-3.790143, -3.537248, 0, 0, 1.5, 0.5, 0.5,
-3.790143, -3.537248, 2, 0, -0.5, 0.5, 0.5,
-3.790143, -3.537248, 2, 1, -0.5, 0.5, 0.5,
-3.790143, -3.537248, 2, 1, 1.5, 0.5, 0.5,
-3.790143, -3.537248, 2, 0, 1.5, 0.5, 0.5,
-3.790143, -3.537248, 4, 0, -0.5, 0.5, 0.5,
-3.790143, -3.537248, 4, 1, -0.5, 0.5, 0.5,
-3.790143, -3.537248, 4, 1, 1.5, 0.5, 0.5,
-3.790143, -3.537248, 4, 0, 1.5, 0.5, 0.5
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
-3.234594, -3.060415, -5.88015,
-3.234594, 3.297358, -5.88015,
-3.234594, -3.060415, 5.515985,
-3.234594, 3.297358, 5.515985,
-3.234594, -3.060415, -5.88015,
-3.234594, -3.060415, 5.515985,
-3.234594, 3.297358, -5.88015,
-3.234594, 3.297358, 5.515985,
-3.234594, -3.060415, -5.88015,
4.17272, -3.060415, -5.88015,
-3.234594, -3.060415, 5.515985,
4.17272, -3.060415, 5.515985,
-3.234594, 3.297358, -5.88015,
4.17272, 3.297358, -5.88015,
-3.234594, 3.297358, 5.515985,
4.17272, 3.297358, 5.515985,
4.17272, -3.060415, -5.88015,
4.17272, 3.297358, -5.88015,
4.17272, -3.060415, 5.515985,
4.17272, 3.297358, 5.515985,
4.17272, -3.060415, -5.88015,
4.17272, -3.060415, 5.515985,
4.17272, 3.297358, -5.88015,
4.17272, 3.297358, 5.515985
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
var radius = 8.012583;
var distance = 35.64888;
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
mvMatrix.translate( -0.4690633, -0.1184715, 0.1820822 );
mvMatrix.scale( 1.169568, 1.362641, 0.7602017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.64888);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
copper_sulfate_penta<-read.table("copper_sulfate_penta.xyz", skip=1)
```

```
## Error in read.table("copper_sulfate_penta.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-copper_sulfate_penta$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_sulfate_penta' not found
```

```r
y<-copper_sulfate_penta$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_sulfate_penta' not found
```

```r
z<-copper_sulfate_penta$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_sulfate_penta' not found
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
-3.12672, -0.2741136, -1.45719, 0, 0, 1, 1, 1,
-2.868874, -1.762849, -2.036132, 1, 0, 0, 1, 1,
-2.756822, 1.013862, 0.1312104, 1, 0, 0, 1, 1,
-2.717951, -0.3618373, -0.8222832, 1, 0, 0, 1, 1,
-2.698198, 0.7805962, -0.4571424, 1, 0, 0, 1, 1,
-2.624438, -2.967826, -2.158215, 1, 0, 0, 1, 1,
-2.477328, 0.9769433, -0.6356429, 0, 0, 0, 1, 1,
-2.445934, 0.4513243, -0.8368989, 0, 0, 0, 1, 1,
-2.409667, 0.5916385, -0.8335494, 0, 0, 0, 1, 1,
-2.305298, 0.2868154, -2.124268, 0, 0, 0, 1, 1,
-2.266938, -0.2254878, -1.400651, 0, 0, 0, 1, 1,
-2.204041, -1.195162, -1.384438, 0, 0, 0, 1, 1,
-2.181963, 0.8135653, -1.929778, 0, 0, 0, 1, 1,
-2.165468, -1.335773, -2.025723, 1, 1, 1, 1, 1,
-2.153699, -0.6967968, -2.484785, 1, 1, 1, 1, 1,
-2.137923, 0.002350785, -1.40063, 1, 1, 1, 1, 1,
-2.13373, 0.2210106, -3.745006, 1, 1, 1, 1, 1,
-2.122859, -0.1758236, 0.518575, 1, 1, 1, 1, 1,
-2.118178, 0.8748668, -0.4563138, 1, 1, 1, 1, 1,
-2.116855, 0.2305605, -2.376266, 1, 1, 1, 1, 1,
-2.09847, 1.583842, -0.155735, 1, 1, 1, 1, 1,
-2.089073, 1.056497, -1.395996, 1, 1, 1, 1, 1,
-2.017698, 0.6905991, 1.656907, 1, 1, 1, 1, 1,
-2.013253, -0.6901974, -1.269616, 1, 1, 1, 1, 1,
-2.006695, -0.848325, -1.660268, 1, 1, 1, 1, 1,
-2.006334, 0.1136359, -1.072118, 1, 1, 1, 1, 1,
-1.97613, 0.06134633, -1.93235, 1, 1, 1, 1, 1,
-1.948671, -0.770593, -2.173458, 1, 1, 1, 1, 1,
-1.946864, -0.8799989, -1.448559, 0, 0, 1, 1, 1,
-1.936761, 0.8737669, -2.282326, 1, 0, 0, 1, 1,
-1.931931, 1.60165, 0.8906184, 1, 0, 0, 1, 1,
-1.927001, -0.2971226, -1.677428, 1, 0, 0, 1, 1,
-1.890197, -1.243, -1.261211, 1, 0, 0, 1, 1,
-1.883207, 0.523209, -2.173699, 1, 0, 0, 1, 1,
-1.881023, 1.502877, 1.491036, 0, 0, 0, 1, 1,
-1.854512, 2.178268, -0.1690756, 0, 0, 0, 1, 1,
-1.850276, 0.5315963, -1.584981, 0, 0, 0, 1, 1,
-1.827175, -0.1015057, -1.517373, 0, 0, 0, 1, 1,
-1.816273, 2.089221, 0.10643, 0, 0, 0, 1, 1,
-1.785859, 0.7440157, -0.9618937, 0, 0, 0, 1, 1,
-1.767117, 1.260099, -2.583112, 0, 0, 0, 1, 1,
-1.755035, -1.127392, 0.2582625, 1, 1, 1, 1, 1,
-1.734203, -0.8427508, -0.05642422, 1, 1, 1, 1, 1,
-1.696158, -0.04867636, -0.5439137, 1, 1, 1, 1, 1,
-1.691406, -0.714968, -4.097408, 1, 1, 1, 1, 1,
-1.68288, -0.7736881, -1.841858, 1, 1, 1, 1, 1,
-1.672704, -0.2442798, -1.34379, 1, 1, 1, 1, 1,
-1.672108, 0.0192705, -0.7743197, 1, 1, 1, 1, 1,
-1.669201, 1.380338, -1.02025, 1, 1, 1, 1, 1,
-1.647007, -2.001061, -2.954222, 1, 1, 1, 1, 1,
-1.642655, -0.354832, 0.1741548, 1, 1, 1, 1, 1,
-1.637061, 0.4289008, -3.063321, 1, 1, 1, 1, 1,
-1.633899, 0.4094189, -0.1838797, 1, 1, 1, 1, 1,
-1.630646, 0.2109546, -1.909069, 1, 1, 1, 1, 1,
-1.630371, 0.5805311, -3.150062, 1, 1, 1, 1, 1,
-1.621534, 0.6446961, -1.062915, 1, 1, 1, 1, 1,
-1.619878, 0.609581, 1.210362, 0, 0, 1, 1, 1,
-1.604063, 0.6311532, -2.276436, 1, 0, 0, 1, 1,
-1.604013, -1.907203, -2.031056, 1, 0, 0, 1, 1,
-1.594251, -0.156175, -1.832502, 1, 0, 0, 1, 1,
-1.588376, 0.8821672, -0.1311945, 1, 0, 0, 1, 1,
-1.586613, -0.5119488, -2.932473, 1, 0, 0, 1, 1,
-1.562603, 1.679052, -1.953582, 0, 0, 0, 1, 1,
-1.557944, 0.590625, 0.545467, 0, 0, 0, 1, 1,
-1.552776, 1.448896, -0.2081463, 0, 0, 0, 1, 1,
-1.552339, -0.556273, -1.797698, 0, 0, 0, 1, 1,
-1.54549, -0.9951783, -2.32656, 0, 0, 0, 1, 1,
-1.543932, -1.188651, -2.046168, 0, 0, 0, 1, 1,
-1.542031, -0.4856232, -1.080309, 0, 0, 0, 1, 1,
-1.536131, -0.2924918, -3.558078, 1, 1, 1, 1, 1,
-1.529041, 1.003878, 1.030023, 1, 1, 1, 1, 1,
-1.508777, -1.236683, -1.87839, 1, 1, 1, 1, 1,
-1.498957, 0.07747282, -2.326951, 1, 1, 1, 1, 1,
-1.498371, -0.8096959, -3.327006, 1, 1, 1, 1, 1,
-1.49673, -1.401018, -2.211732, 1, 1, 1, 1, 1,
-1.487459, 0.6985226, -2.615712, 1, 1, 1, 1, 1,
-1.486987, 0.2991645, -1.949549, 1, 1, 1, 1, 1,
-1.47629, -0.8948597, -2.198403, 1, 1, 1, 1, 1,
-1.474283, 0.08522592, -0.6360853, 1, 1, 1, 1, 1,
-1.473172, 0.4171654, -0.7950645, 1, 1, 1, 1, 1,
-1.473048, 0.5382146, -0.7874253, 1, 1, 1, 1, 1,
-1.472554, -0.6481857, -1.663099, 1, 1, 1, 1, 1,
-1.470515, -0.7875035, -0.662586, 1, 1, 1, 1, 1,
-1.466833, -0.7565252, -2.682316, 1, 1, 1, 1, 1,
-1.435119, 1.210009, -0.1014156, 0, 0, 1, 1, 1,
-1.431822, 0.4435702, 0.5081665, 1, 0, 0, 1, 1,
-1.43098, -0.315628, -3.765031, 1, 0, 0, 1, 1,
-1.424136, -0.6377068, -3.283575, 1, 0, 0, 1, 1,
-1.422793, -0.6086234, -1.606129, 1, 0, 0, 1, 1,
-1.422096, -0.2330211, -0.660616, 1, 0, 0, 1, 1,
-1.41954, -0.1767371, -1.399402, 0, 0, 0, 1, 1,
-1.404424, 1.262749, -1.87765, 0, 0, 0, 1, 1,
-1.38686, -0.6006138, -2.840181, 0, 0, 0, 1, 1,
-1.380855, 0.580187, -1.891523, 0, 0, 0, 1, 1,
-1.377168, -1.199161, -1.608028, 0, 0, 0, 1, 1,
-1.37606, -0.3412867, -1.816342, 0, 0, 0, 1, 1,
-1.369944, -1.986038, -2.927569, 0, 0, 0, 1, 1,
-1.366347, 1.721921, 1.180033, 1, 1, 1, 1, 1,
-1.364662, 1.317338, -1.276638, 1, 1, 1, 1, 1,
-1.358026, -0.922748, -0.9652404, 1, 1, 1, 1, 1,
-1.357848, 0.0271847, -1.918725, 1, 1, 1, 1, 1,
-1.34658, 2.113003, 1.77032, 1, 1, 1, 1, 1,
-1.343871, -2.075427, -2.309808, 1, 1, 1, 1, 1,
-1.33966, 0.8267377, 0.7009098, 1, 1, 1, 1, 1,
-1.334131, -1.048155, -2.591634, 1, 1, 1, 1, 1,
-1.323469, -1.019664, -1.587904, 1, 1, 1, 1, 1,
-1.311183, -0.5676555, -0.9683533, 1, 1, 1, 1, 1,
-1.304551, -0.5313302, -0.7805753, 1, 1, 1, 1, 1,
-1.283173, -1.915976, -2.454788, 1, 1, 1, 1, 1,
-1.270076, 1.310695, -0.7073306, 1, 1, 1, 1, 1,
-1.265188, -1.504745, -1.854879, 1, 1, 1, 1, 1,
-1.258269, -0.1627966, -1.649787, 1, 1, 1, 1, 1,
-1.257383, -0.7974843, -0.459701, 0, 0, 1, 1, 1,
-1.254604, 0.7417809, -2.40998, 1, 0, 0, 1, 1,
-1.241659, 0.4207279, -0.9163486, 1, 0, 0, 1, 1,
-1.238369, -1.492922, -1.83193, 1, 0, 0, 1, 1,
-1.237246, -0.05020804, -2.615756, 1, 0, 0, 1, 1,
-1.229467, 0.9414971, -0.8872465, 1, 0, 0, 1, 1,
-1.208627, -0.4909184, -0.365949, 0, 0, 0, 1, 1,
-1.205917, 1.092339, 0.1915652, 0, 0, 0, 1, 1,
-1.200935, 0.3561036, -3.895039, 0, 0, 0, 1, 1,
-1.200062, -1.066152, -4.105444, 0, 0, 0, 1, 1,
-1.194172, 0.5602903, -1.893021, 0, 0, 0, 1, 1,
-1.187458, 0.1922088, 0.9993598, 0, 0, 0, 1, 1,
-1.180192, 0.9398043, -0.8802069, 0, 0, 0, 1, 1,
-1.177715, 0.5242718, -0.9896619, 1, 1, 1, 1, 1,
-1.174217, -0.1063793, 0.06205983, 1, 1, 1, 1, 1,
-1.173314, -1.122315, -0.9905733, 1, 1, 1, 1, 1,
-1.173283, 0.3947909, -0.8141341, 1, 1, 1, 1, 1,
-1.167502, 0.5813271, -1.797879, 1, 1, 1, 1, 1,
-1.166289, 1.876245, -0.0003840009, 1, 1, 1, 1, 1,
-1.165934, 0.1312473, -1.358534, 1, 1, 1, 1, 1,
-1.165836, -1.080394, -2.287375, 1, 1, 1, 1, 1,
-1.162598, -0.712303, -1.773887, 1, 1, 1, 1, 1,
-1.154295, 0.9733516, 0.6861954, 1, 1, 1, 1, 1,
-1.15187, 0.3269007, -0.2096637, 1, 1, 1, 1, 1,
-1.142825, 0.7826806, -0.9515449, 1, 1, 1, 1, 1,
-1.122586, -0.3787956, -1.620579, 1, 1, 1, 1, 1,
-1.113452, -0.6596285, -3.016791, 1, 1, 1, 1, 1,
-1.112248, -0.3176425, -1.13961, 1, 1, 1, 1, 1,
-1.111307, -0.2582044, -0.8220495, 0, 0, 1, 1, 1,
-1.099531, 0.3429768, 0.5207218, 1, 0, 0, 1, 1,
-1.092961, -0.2063723, -1.465275, 1, 0, 0, 1, 1,
-1.089023, 1.192298, -2.31821, 1, 0, 0, 1, 1,
-1.076112, 0.4678759, -1.712824, 1, 0, 0, 1, 1,
-1.07223, 0.923444, -0.06028596, 1, 0, 0, 1, 1,
-1.066898, 0.1484377, -1.588871, 0, 0, 0, 1, 1,
-1.065019, 0.3500494, -1.400153, 0, 0, 0, 1, 1,
-1.060868, -0.8522218, -0.2851652, 0, 0, 0, 1, 1,
-1.052291, -0.1488896, -3.359188, 0, 0, 0, 1, 1,
-1.045031, 0.7126826, -2.272641, 0, 0, 0, 1, 1,
-1.037368, 0.8941953, -0.2881005, 0, 0, 0, 1, 1,
-1.026905, -0.8560183, -2.710864, 0, 0, 0, 1, 1,
-1.026343, -0.7567711, -3.652512, 1, 1, 1, 1, 1,
-1.015838, -0.3586301, -0.9273943, 1, 1, 1, 1, 1,
-1.010628, -0.4468721, -1.179884, 1, 1, 1, 1, 1,
-1.006475, -0.5086873, -1.921069, 1, 1, 1, 1, 1,
-1.000874, -0.9076355, -1.216289, 1, 1, 1, 1, 1,
-0.9971331, -0.6329088, -4.149899, 1, 1, 1, 1, 1,
-0.9713381, 0.09866365, -1.639904, 1, 1, 1, 1, 1,
-0.9638376, 0.3182593, -3.051265, 1, 1, 1, 1, 1,
-0.9627255, -0.718178, -3.334614, 1, 1, 1, 1, 1,
-0.9543161, -1.510922, -2.096728, 1, 1, 1, 1, 1,
-0.9542431, -0.2645914, -0.6881341, 1, 1, 1, 1, 1,
-0.9541089, 0.543625, -0.1766821, 1, 1, 1, 1, 1,
-0.9539828, -1.350694, -3.455698, 1, 1, 1, 1, 1,
-0.9539666, 1.068743, -1.535864, 1, 1, 1, 1, 1,
-0.9494904, -1.290783, -2.3873, 1, 1, 1, 1, 1,
-0.9491783, -0.8878484, -2.255414, 0, 0, 1, 1, 1,
-0.948727, -0.5256335, -4.921362, 1, 0, 0, 1, 1,
-0.9468234, 0.1523325, -2.521722, 1, 0, 0, 1, 1,
-0.9438494, -0.5241896, -2.26974, 1, 0, 0, 1, 1,
-0.9411924, -0.9458417, -1.557138, 1, 0, 0, 1, 1,
-0.9407802, 1.704896, 0.6830238, 1, 0, 0, 1, 1,
-0.9403691, -0.8390996, -2.034723, 0, 0, 0, 1, 1,
-0.9382235, -1.09258, -2.045398, 0, 0, 0, 1, 1,
-0.9372917, -0.1421698, -2.072887, 0, 0, 0, 1, 1,
-0.9362122, 1.959994, -1.285493, 0, 0, 0, 1, 1,
-0.9267286, -0.7280399, -2.882974, 0, 0, 0, 1, 1,
-0.9244534, 1.347662, -0.7907338, 0, 0, 0, 1, 1,
-0.9224257, -0.9345219, -1.918406, 0, 0, 0, 1, 1,
-0.920657, -0.5377162, 0.2149541, 1, 1, 1, 1, 1,
-0.920637, 1.925597, 0.495504, 1, 1, 1, 1, 1,
-0.8923647, 0.9950259, -0.8757328, 1, 1, 1, 1, 1,
-0.8890458, 0.9051679, -2.887407, 1, 1, 1, 1, 1,
-0.8843665, -0.712169, -1.925319, 1, 1, 1, 1, 1,
-0.8786086, 0.8332541, -2.144137, 1, 1, 1, 1, 1,
-0.8773676, 0.8246733, -0.3604284, 1, 1, 1, 1, 1,
-0.8767643, -0.730537, -3.208057, 1, 1, 1, 1, 1,
-0.8766775, -1.625711, -2.161119, 1, 1, 1, 1, 1,
-0.8765408, 0.4867178, 1.034129, 1, 1, 1, 1, 1,
-0.8745412, 0.1436791, -0.4570681, 1, 1, 1, 1, 1,
-0.8714705, 0.4289832, -1.280257, 1, 1, 1, 1, 1,
-0.8706827, 1.247621, -1.887134, 1, 1, 1, 1, 1,
-0.8660432, 1.643886, -1.696405, 1, 1, 1, 1, 1,
-0.8582141, -1.114264, -2.011074, 1, 1, 1, 1, 1,
-0.853012, -0.7572179, -1.760294, 0, 0, 1, 1, 1,
-0.8435945, -0.0826822, -2.054247, 1, 0, 0, 1, 1,
-0.8404518, 0.6305929, -0.9165423, 1, 0, 0, 1, 1,
-0.8390559, -1.621468, -3.821126, 1, 0, 0, 1, 1,
-0.8351821, 0.6494547, -0.2667635, 1, 0, 0, 1, 1,
-0.8343866, 0.498841, -0.8218179, 1, 0, 0, 1, 1,
-0.8329546, -0.2127658, -1.494619, 0, 0, 0, 1, 1,
-0.8270044, 0.09939772, -1.825895, 0, 0, 0, 1, 1,
-0.8231496, -0.671699, -2.071492, 0, 0, 0, 1, 1,
-0.8221788, -0.7674202, -2.487329, 0, 0, 0, 1, 1,
-0.8216416, -0.3249501, -1.731506, 0, 0, 0, 1, 1,
-0.8188403, 0.4691637, -2.440249, 0, 0, 0, 1, 1,
-0.8176018, -0.4068685, -0.7166884, 0, 0, 0, 1, 1,
-0.8135169, -1.244373, -3.93752, 1, 1, 1, 1, 1,
-0.811106, -0.09330148, -1.909862, 1, 1, 1, 1, 1,
-0.8093155, 0.8943799, -0.8852062, 1, 1, 1, 1, 1,
-0.8086565, 1.94008, -1.196667, 1, 1, 1, 1, 1,
-0.8082141, 0.3199573, -2.73307, 1, 1, 1, 1, 1,
-0.8068563, -0.2561578, -2.217492, 1, 1, 1, 1, 1,
-0.8055942, -0.8425464, -2.829111, 1, 1, 1, 1, 1,
-0.8037322, -0.2568537, -3.354841, 1, 1, 1, 1, 1,
-0.7994776, 0.2480647, -1.675899, 1, 1, 1, 1, 1,
-0.7994255, 0.02676194, -2.521644, 1, 1, 1, 1, 1,
-0.7956583, 0.3159633, -0.1949821, 1, 1, 1, 1, 1,
-0.7941277, 1.172707, -1.111537, 1, 1, 1, 1, 1,
-0.7881716, 0.6154497, -0.2086792, 1, 1, 1, 1, 1,
-0.7867004, 0.2977579, -1.071223, 1, 1, 1, 1, 1,
-0.7793714, 1.021272, -1.753017, 1, 1, 1, 1, 1,
-0.7749935, -0.2847169, -1.725786, 0, 0, 1, 1, 1,
-0.7716869, -0.6804134, -3.909867, 1, 0, 0, 1, 1,
-0.768137, 1.040763, -0.8106794, 1, 0, 0, 1, 1,
-0.7580185, -1.206658, -2.482867, 1, 0, 0, 1, 1,
-0.7575469, -1.130363, -1.506189, 1, 0, 0, 1, 1,
-0.7571167, -0.4932632, -0.8866723, 1, 0, 0, 1, 1,
-0.7566822, -0.583275, -1.115852, 0, 0, 0, 1, 1,
-0.7563697, -0.4330545, -3.011313, 0, 0, 0, 1, 1,
-0.7562369, 0.3179216, -2.249289, 0, 0, 0, 1, 1,
-0.7541066, 0.9717342, -1.751844, 0, 0, 0, 1, 1,
-0.7519482, 0.7794915, -0.3704596, 0, 0, 0, 1, 1,
-0.7496384, -0.493378, -2.183269, 0, 0, 0, 1, 1,
-0.7465827, -1.2856, -2.543252, 0, 0, 0, 1, 1,
-0.7464757, 1.129588, -0.01682539, 1, 1, 1, 1, 1,
-0.7432147, -0.2409437, -1.688035, 1, 1, 1, 1, 1,
-0.7399788, 1.435831, -0.07111312, 1, 1, 1, 1, 1,
-0.7313586, 2.007806, -0.1757614, 1, 1, 1, 1, 1,
-0.7305011, 1.574472, 1.807278, 1, 1, 1, 1, 1,
-0.7273653, 0.7292463, -3.190593, 1, 1, 1, 1, 1,
-0.7235044, -0.1244849, -1.580249, 1, 1, 1, 1, 1,
-0.7223774, 1.430338, -0.3208864, 1, 1, 1, 1, 1,
-0.7135618, 0.6240809, -1.353192, 1, 1, 1, 1, 1,
-0.7116399, 0.1816453, -1.872609, 1, 1, 1, 1, 1,
-0.7074119, 2.023143, -0.5393744, 1, 1, 1, 1, 1,
-0.7061047, 0.4799643, -0.5461937, 1, 1, 1, 1, 1,
-0.6999387, -0.06060455, -2.189471, 1, 1, 1, 1, 1,
-0.6986302, -0.5832315, -3.105704, 1, 1, 1, 1, 1,
-0.6926941, -0.0149163, -1.12464, 1, 1, 1, 1, 1,
-0.6914212, -0.6310288, -2.456549, 0, 0, 1, 1, 1,
-0.6903589, 0.458772, -2.280802, 1, 0, 0, 1, 1,
-0.6885131, -1.1889, -2.605895, 1, 0, 0, 1, 1,
-0.6814941, 0.5076714, -0.9241485, 1, 0, 0, 1, 1,
-0.678645, 1.245908, 0.8107345, 1, 0, 0, 1, 1,
-0.6764038, 0.4523074, -1.339702, 1, 0, 0, 1, 1,
-0.6735944, -0.05975764, 0.08612613, 0, 0, 0, 1, 1,
-0.672617, 0.3243042, -1.626121, 0, 0, 0, 1, 1,
-0.6688954, 0.6212745, 0.07325999, 0, 0, 0, 1, 1,
-0.6667538, 0.2010602, -1.121105, 0, 0, 0, 1, 1,
-0.6665739, -1.281391, -4.014498, 0, 0, 0, 1, 1,
-0.6633995, -2.8977, -1.161132, 0, 0, 0, 1, 1,
-0.6633446, 1.047021, -0.5758005, 0, 0, 0, 1, 1,
-0.661153, -2.644863, -4.162992, 1, 1, 1, 1, 1,
-0.6603081, -1.564356, -2.970549, 1, 1, 1, 1, 1,
-0.6589838, -0.4563025, -1.483106, 1, 1, 1, 1, 1,
-0.6583483, -2.291589, -1.347273, 1, 1, 1, 1, 1,
-0.6574975, 0.1652161, -1.615946, 1, 1, 1, 1, 1,
-0.6556333, -0.001763247, -0.2415062, 1, 1, 1, 1, 1,
-0.6541719, -0.9354694, -1.757287, 1, 1, 1, 1, 1,
-0.653988, -1.394626, -3.581694, 1, 1, 1, 1, 1,
-0.6539051, -0.1880867, -1.295668, 1, 1, 1, 1, 1,
-0.6493251, -1.182617, -2.756745, 1, 1, 1, 1, 1,
-0.6420252, -0.2737068, -2.860385, 1, 1, 1, 1, 1,
-0.6390415, -0.2679617, -1.951985, 1, 1, 1, 1, 1,
-0.6181866, 0.621126, 0.1890904, 1, 1, 1, 1, 1,
-0.616188, -0.3064221, -0.5699784, 1, 1, 1, 1, 1,
-0.6131895, -0.2507512, -1.516318, 1, 1, 1, 1, 1,
-0.6074551, 0.6575028, -0.0321864, 0, 0, 1, 1, 1,
-0.6047513, -1.276079, -4.228622, 1, 0, 0, 1, 1,
-0.6038852, 0.8487881, 0.5635829, 1, 0, 0, 1, 1,
-0.6019628, 0.4487933, -1.967407, 1, 0, 0, 1, 1,
-0.5975474, -0.7024035, -4.269169, 1, 0, 0, 1, 1,
-0.5946187, 1.42154, 0.5193725, 1, 0, 0, 1, 1,
-0.5929558, 1.944837, -1.086624, 0, 0, 0, 1, 1,
-0.5921466, 0.7312317, -1.777868, 0, 0, 0, 1, 1,
-0.5837711, -1.789341, -3.966625, 0, 0, 0, 1, 1,
-0.5833519, -0.1857653, -1.938443, 0, 0, 0, 1, 1,
-0.5818769, 0.5299338, -0.6995843, 0, 0, 0, 1, 1,
-0.5797886, 1.357459, -1.00176, 0, 0, 0, 1, 1,
-0.5778194, 0.8754112, 0.1510441, 0, 0, 0, 1, 1,
-0.5770007, -1.140014, -3.060449, 1, 1, 1, 1, 1,
-0.5761153, 0.06817663, -0.739952, 1, 1, 1, 1, 1,
-0.5717456, 0.5683513, -1.242622, 1, 1, 1, 1, 1,
-0.5707246, 0.233433, -1.784783, 1, 1, 1, 1, 1,
-0.5659596, -0.3373725, -2.919538, 1, 1, 1, 1, 1,
-0.5599392, -0.0661932, -1.61128, 1, 1, 1, 1, 1,
-0.5566826, 1.1271, -0.8722197, 1, 1, 1, 1, 1,
-0.555796, -0.8335536, -2.411449, 1, 1, 1, 1, 1,
-0.5554264, -2.603765, -3.199836, 1, 1, 1, 1, 1,
-0.5539341, -1.0132, -1.107821, 1, 1, 1, 1, 1,
-0.5506662, 1.47415, 0.2791249, 1, 1, 1, 1, 1,
-0.5499468, 0.7645998, -0.6765186, 1, 1, 1, 1, 1,
-0.5499263, 0.8444816, 0.8587333, 1, 1, 1, 1, 1,
-0.546979, -0.09794372, -2.506139, 1, 1, 1, 1, 1,
-0.5455664, 0.1795965, -2.096276, 1, 1, 1, 1, 1,
-0.5374376, -1.074278, -2.667668, 0, 0, 1, 1, 1,
-0.5336673, 0.4876775, -0.7005694, 1, 0, 0, 1, 1,
-0.5320156, -0.732809, -3.623612, 1, 0, 0, 1, 1,
-0.5289459, -0.5904058, -2.398227, 1, 0, 0, 1, 1,
-0.5247432, -0.2591284, -0.7410833, 1, 0, 0, 1, 1,
-0.5231531, -0.8924646, -2.906541, 1, 0, 0, 1, 1,
-0.5225075, 1.084594, -0.3099097, 0, 0, 0, 1, 1,
-0.5218546, -1.814528, -2.890798, 0, 0, 0, 1, 1,
-0.5197548, 0.417841, -0.8503748, 0, 0, 0, 1, 1,
-0.5195495, -2.682401, -3.361117, 0, 0, 0, 1, 1,
-0.5096341, -0.8057569, -2.96173, 0, 0, 0, 1, 1,
-0.5090077, -0.8373018, -2.631497, 0, 0, 0, 1, 1,
-0.5085737, -1.079075, -2.839019, 0, 0, 0, 1, 1,
-0.5059518, 0.06265412, -0.9842505, 1, 1, 1, 1, 1,
-0.5024182, -0.9415724, -2.94354, 1, 1, 1, 1, 1,
-0.4959943, -0.9149823, -2.132256, 1, 1, 1, 1, 1,
-0.4937023, -0.1954806, -1.495779, 1, 1, 1, 1, 1,
-0.4777874, -0.9118685, -1.383447, 1, 1, 1, 1, 1,
-0.471478, -1.283358, -3.936531, 1, 1, 1, 1, 1,
-0.4680569, -0.6259958, -2.224052, 1, 1, 1, 1, 1,
-0.4673176, 0.09009955, -0.8276035, 1, 1, 1, 1, 1,
-0.464612, 0.2444923, -0.8486863, 1, 1, 1, 1, 1,
-0.463685, 0.1613913, -1.017377, 1, 1, 1, 1, 1,
-0.4625385, -1.320157, -3.978288, 1, 1, 1, 1, 1,
-0.4596165, 0.2306856, -2.146506, 1, 1, 1, 1, 1,
-0.4564416, 0.7363414, -1.254661, 1, 1, 1, 1, 1,
-0.4562873, -1.907172, -3.706821, 1, 1, 1, 1, 1,
-0.4557712, -0.3053548, -4.202535, 1, 1, 1, 1, 1,
-0.4427652, 0.08850534, -4.264718, 0, 0, 1, 1, 1,
-0.4402188, 0.8274856, -0.3166373, 1, 0, 0, 1, 1,
-0.4396358, -0.6865852, -2.61487, 1, 0, 0, 1, 1,
-0.4385977, -0.8226933, -1.686456, 1, 0, 0, 1, 1,
-0.4352965, -1.080697, -2.502888, 1, 0, 0, 1, 1,
-0.4335208, 0.8575212, -2.319163, 1, 0, 0, 1, 1,
-0.4334213, 1.381405, 0.4136583, 0, 0, 0, 1, 1,
-0.4322956, -1.742079, -1.263809, 0, 0, 0, 1, 1,
-0.4312226, 1.183044, -0.3501976, 0, 0, 0, 1, 1,
-0.4299531, 0.02967684, -0.5698602, 0, 0, 0, 1, 1,
-0.427604, 0.5740122, 0.5626369, 0, 0, 0, 1, 1,
-0.4271568, -0.9779521, -3.264286, 0, 0, 0, 1, 1,
-0.421024, -0.4925654, -3.195533, 0, 0, 0, 1, 1,
-0.4109415, -1.177741, -3.490294, 1, 1, 1, 1, 1,
-0.4105111, 2.14923, -0.419915, 1, 1, 1, 1, 1,
-0.408729, 1.923423, -0.6669026, 1, 1, 1, 1, 1,
-0.4070733, -0.9235164, -1.148623, 1, 1, 1, 1, 1,
-0.4059703, -0.3226939, -1.972376, 1, 1, 1, 1, 1,
-0.4048246, -0.06038487, -1.903868, 1, 1, 1, 1, 1,
-0.4010843, -1.419769, -2.729128, 1, 1, 1, 1, 1,
-0.3952195, -0.649375, -2.787694, 1, 1, 1, 1, 1,
-0.3940573, 0.9439821, -0.4556493, 1, 1, 1, 1, 1,
-0.3939941, -0.9434359, -2.176384, 1, 1, 1, 1, 1,
-0.3889535, 1.318753, 0.5111866, 1, 1, 1, 1, 1,
-0.384085, 0.06028304, -1.909505, 1, 1, 1, 1, 1,
-0.3836707, 0.7976422, -0.7508712, 1, 1, 1, 1, 1,
-0.3772914, -2.195339, -5.442966, 1, 1, 1, 1, 1,
-0.3762394, 0.5833166, -1.230885, 1, 1, 1, 1, 1,
-0.3747465, -1.059047, -2.317691, 0, 0, 1, 1, 1,
-0.3729709, 2.937567, 0.2025821, 1, 0, 0, 1, 1,
-0.3689131, 0.725487, -1.785843, 1, 0, 0, 1, 1,
-0.3651794, 0.8901771, 0.002566092, 1, 0, 0, 1, 1,
-0.3640573, 0.7927334, -0.5449026, 1, 0, 0, 1, 1,
-0.3621042, 1.405238, -0.4380251, 1, 0, 0, 1, 1,
-0.3530869, -2.039476, -3.926645, 0, 0, 0, 1, 1,
-0.3524078, -0.3180183, -2.12532, 0, 0, 0, 1, 1,
-0.3510637, 0.7654904, -1.173807, 0, 0, 0, 1, 1,
-0.3402139, 0.5772604, -0.06257688, 0, 0, 0, 1, 1,
-0.339948, -0.3591342, -3.131601, 0, 0, 0, 1, 1,
-0.339682, 0.9645892, -1.683891, 0, 0, 0, 1, 1,
-0.339422, 0.8783914, 0.1160704, 0, 0, 0, 1, 1,
-0.336421, -0.3855788, -2.776469, 1, 1, 1, 1, 1,
-0.3323657, 0.873515, -0.3530165, 1, 1, 1, 1, 1,
-0.3306345, 0.4344068, 0.5729205, 1, 1, 1, 1, 1,
-0.3298216, 0.2343946, -2.381168, 1, 1, 1, 1, 1,
-0.3239586, -0.9922256, -2.848847, 1, 1, 1, 1, 1,
-0.3217429, -1.16818, -1.573505, 1, 1, 1, 1, 1,
-0.3196753, 0.3672287, -0.8847363, 1, 1, 1, 1, 1,
-0.3152317, 0.6491087, -1.127706, 1, 1, 1, 1, 1,
-0.3140541, 0.2240528, -0.6520734, 1, 1, 1, 1, 1,
-0.3122533, -0.9879987, -3.168071, 1, 1, 1, 1, 1,
-0.3094723, 0.2937169, 0.4949707, 1, 1, 1, 1, 1,
-0.3084531, 1.687552, -1.037228, 1, 1, 1, 1, 1,
-0.3054158, -0.5737204, -2.730529, 1, 1, 1, 1, 1,
-0.3052496, -1.61779, -1.824125, 1, 1, 1, 1, 1,
-0.3030626, 2.032331, 0.4254539, 1, 1, 1, 1, 1,
-0.2998883, -2.381343, -2.729198, 0, 0, 1, 1, 1,
-0.2956374, 0.4916719, -0.9742283, 1, 0, 0, 1, 1,
-0.293406, 1.222203, 1.035887, 1, 0, 0, 1, 1,
-0.2916724, -0.7144892, -2.572095, 1, 0, 0, 1, 1,
-0.286404, -0.08975327, -1.085884, 1, 0, 0, 1, 1,
-0.2858102, -0.9045113, -2.423079, 1, 0, 0, 1, 1,
-0.2857073, 0.7573203, 0.729787, 0, 0, 0, 1, 1,
-0.284044, 0.03412493, -3.014963, 0, 0, 0, 1, 1,
-0.2824142, -1.455173, -4.02912, 0, 0, 0, 1, 1,
-0.270411, 1.659852, -0.007184238, 0, 0, 0, 1, 1,
-0.2698186, 0.6346186, 1.111025, 0, 0, 0, 1, 1,
-0.2653252, 1.082084, -1.197191, 0, 0, 0, 1, 1,
-0.2597141, 0.06585047, -2.504492, 0, 0, 0, 1, 1,
-0.2544506, 0.856191, -1.552441, 1, 1, 1, 1, 1,
-0.2509147, 1.443274, 0.5238711, 1, 1, 1, 1, 1,
-0.250286, 0.7190298, -1.56535, 1, 1, 1, 1, 1,
-0.2480204, 0.1615542, -1.67471, 1, 1, 1, 1, 1,
-0.2477062, -1.028391, -3.731635, 1, 1, 1, 1, 1,
-0.246357, 0.5609125, -0.4607031, 1, 1, 1, 1, 1,
-0.2461258, -0.2056634, -1.302621, 1, 1, 1, 1, 1,
-0.2457594, -2.19217, -4.969591, 1, 1, 1, 1, 1,
-0.2418127, -1.539623, -2.932794, 1, 1, 1, 1, 1,
-0.2332725, 0.6615568, -0.5518634, 1, 1, 1, 1, 1,
-0.2329932, -0.9848983, -4.014362, 1, 1, 1, 1, 1,
-0.2326071, 1.284912, 0.3949926, 1, 1, 1, 1, 1,
-0.2300891, -0.01392739, -1.422284, 1, 1, 1, 1, 1,
-0.2298497, 0.9464329, 0.6359222, 1, 1, 1, 1, 1,
-0.2285601, -0.02465356, -2.933665, 1, 1, 1, 1, 1,
-0.2273567, -1.542266, -2.178906, 0, 0, 1, 1, 1,
-0.2268496, 0.8546653, -0.378571, 1, 0, 0, 1, 1,
-0.2228929, 1.333364, -1.146077, 1, 0, 0, 1, 1,
-0.2193038, 0.01713637, -3.619882, 1, 0, 0, 1, 1,
-0.2148984, -0.5093697, -0.8741986, 1, 0, 0, 1, 1,
-0.214294, 0.2473064, -1.239039, 1, 0, 0, 1, 1,
-0.2132647, 0.8697551, -0.4114387, 0, 0, 0, 1, 1,
-0.2094923, 1.026256, -0.0908924, 0, 0, 0, 1, 1,
-0.2094117, 0.07243938, -2.288463, 0, 0, 0, 1, 1,
-0.2066349, 0.942793, -1.44606, 0, 0, 0, 1, 1,
-0.2009712, 0.8429472, 0.1484227, 0, 0, 0, 1, 1,
-0.1996773, 1.136244, -0.890275, 0, 0, 0, 1, 1,
-0.1989632, -0.5668855, -1.477059, 0, 0, 0, 1, 1,
-0.1935995, -0.1466352, -3.134709, 1, 1, 1, 1, 1,
-0.1889335, -0.1468779, -1.822049, 1, 1, 1, 1, 1,
-0.1888814, -0.07352467, -1.1299, 1, 1, 1, 1, 1,
-0.1880592, -0.06240629, -0.4822369, 1, 1, 1, 1, 1,
-0.1871361, 1.103374, 0.6457871, 1, 1, 1, 1, 1,
-0.1869884, 0.2032245, -0.7060455, 1, 1, 1, 1, 1,
-0.1836457, 0.3963304, 1.054687, 1, 1, 1, 1, 1,
-0.1804251, -1.58626, -3.464637, 1, 1, 1, 1, 1,
-0.1785879, -0.2822393, -0.666913, 1, 1, 1, 1, 1,
-0.1777893, 0.1560819, -0.5327995, 1, 1, 1, 1, 1,
-0.1765199, -0.01349412, -1.946155, 1, 1, 1, 1, 1,
-0.1757498, -0.4683831, -1.939786, 1, 1, 1, 1, 1,
-0.1744804, -1.614852, -3.221619, 1, 1, 1, 1, 1,
-0.1672909, -0.147541, -2.451035, 1, 1, 1, 1, 1,
-0.1497593, -1.81104, -2.91641, 1, 1, 1, 1, 1,
-0.1483482, -0.2102673, -2.924007, 0, 0, 1, 1, 1,
-0.136144, 0.4989773, -0.32668, 1, 0, 0, 1, 1,
-0.1309952, 0.1744851, 1.47004, 1, 0, 0, 1, 1,
-0.1249759, -1.337139, -1.690133, 1, 0, 0, 1, 1,
-0.12495, 0.8537449, 0.7091616, 1, 0, 0, 1, 1,
-0.1211121, 0.7198805, 0.8270792, 1, 0, 0, 1, 1,
-0.1178389, -0.680387, -4.444884, 0, 0, 0, 1, 1,
-0.111896, -1.934299, -4.823699, 0, 0, 0, 1, 1,
-0.1057212, 0.3635217, 0.1271561, 0, 0, 0, 1, 1,
-0.09879164, -0.4418086, -3.728206, 0, 0, 0, 1, 1,
-0.09667321, 0.381909, -0.506516, 0, 0, 0, 1, 1,
-0.09363183, -0.2117776, -3.23633, 0, 0, 0, 1, 1,
-0.09189783, -0.7775708, -3.236609, 0, 0, 0, 1, 1,
-0.08832216, 0.9257419, 0.5647941, 1, 1, 1, 1, 1,
-0.0843852, 1.540572, 0.1544516, 1, 1, 1, 1, 1,
-0.08281305, 1.002983, 0.6323016, 1, 1, 1, 1, 1,
-0.08117295, -0.1261456, -1.894241, 1, 1, 1, 1, 1,
-0.07288799, 1.625293, -0.1328588, 1, 1, 1, 1, 1,
-0.07288351, 0.5527317, -0.2164572, 1, 1, 1, 1, 1,
-0.06633477, 0.3662176, 1.348615, 1, 1, 1, 1, 1,
-0.05564844, -0.2185272, -2.691593, 1, 1, 1, 1, 1,
-0.05521851, -1.890111, -5.714187, 1, 1, 1, 1, 1,
-0.0541602, -0.8169663, -3.669557, 1, 1, 1, 1, 1,
-0.04915194, 0.08972154, -0.8670512, 1, 1, 1, 1, 1,
-0.04787874, 0.909973, -1.414128, 1, 1, 1, 1, 1,
-0.04324082, 0.9876142, -0.6308548, 1, 1, 1, 1, 1,
-0.03701187, 1.040463, -0.7118871, 1, 1, 1, 1, 1,
-0.03645664, -0.1317034, -3.119862, 1, 1, 1, 1, 1,
-0.03344144, 0.1563011, -1.034054, 0, 0, 1, 1, 1,
-0.02679004, 0.003133151, -0.4886473, 1, 0, 0, 1, 1,
-0.02675253, -0.1279201, -2.828068, 1, 0, 0, 1, 1,
-0.02469782, 0.2802665, -0.2439181, 1, 0, 0, 1, 1,
-0.02449186, 0.111369, -0.8689253, 1, 0, 0, 1, 1,
-0.02350296, 0.1974192, -1.58737, 1, 0, 0, 1, 1,
-0.01998902, 1.263712, -0.4149957, 0, 0, 0, 1, 1,
-0.01702071, -0.5360577, -3.390164, 0, 0, 0, 1, 1,
-0.01640332, 2.165016, -0.510334, 0, 0, 0, 1, 1,
-0.01337821, -0.3523049, -2.186458, 0, 0, 0, 1, 1,
-0.01308494, 0.8121803, -0.2118186, 0, 0, 0, 1, 1,
-0.01300636, 0.5532677, 0.7592812, 0, 0, 0, 1, 1,
-0.01111036, -1.024084, -3.241503, 0, 0, 0, 1, 1,
-0.008637262, -1.4538, -4.495052, 1, 1, 1, 1, 1,
-0.007960037, -0.1639473, -3.644068, 1, 1, 1, 1, 1,
-0.007777003, 0.1029012, -1.30488, 1, 1, 1, 1, 1,
-0.006280698, 0.8130436, 1.367798, 1, 1, 1, 1, 1,
-0.00137759, 1.064348, 1.662711, 1, 1, 1, 1, 1,
0.0011357, 1.70869, -0.6072982, 1, 1, 1, 1, 1,
0.007012601, 1.136162, 2.069071, 1, 1, 1, 1, 1,
0.009787762, 0.1821395, -0.9629638, 1, 1, 1, 1, 1,
0.02350785, -0.03707903, 1.414916, 1, 1, 1, 1, 1,
0.02352365, -1.160157, 3.27656, 1, 1, 1, 1, 1,
0.02508461, -0.516922, 4.036931, 1, 1, 1, 1, 1,
0.02835385, -0.2532346, 4.591311, 1, 1, 1, 1, 1,
0.03286757, -0.9960935, 4.828055, 1, 1, 1, 1, 1,
0.03897716, -1.114143, 3.905874, 1, 1, 1, 1, 1,
0.044703, -0.8214586, 1.035273, 1, 1, 1, 1, 1,
0.04759486, -0.6403668, 3.260489, 0, 0, 1, 1, 1,
0.04820255, 1.163373, -1.62808, 1, 0, 0, 1, 1,
0.05320898, 0.5010689, -0.0122831, 1, 0, 0, 1, 1,
0.05653912, -1.268859, 3.896309, 1, 0, 0, 1, 1,
0.05840747, 0.9022757, -0.5245324, 1, 0, 0, 1, 1,
0.0592804, -1.22185, 3.250614, 1, 0, 0, 1, 1,
0.05936418, -2.114468, 3.078121, 0, 0, 0, 1, 1,
0.06806824, -0.26544, 4.103898, 0, 0, 0, 1, 1,
0.06888984, 0.4608116, 1.844198, 0, 0, 0, 1, 1,
0.07685833, 0.9022605, 0.2272988, 0, 0, 0, 1, 1,
0.07836571, 0.1940018, 1.22325, 0, 0, 0, 1, 1,
0.07920469, -0.5425215, 3.78125, 0, 0, 0, 1, 1,
0.08042479, 1.364409, 0.5108488, 0, 0, 0, 1, 1,
0.08132873, -0.6425574, 2.431218, 1, 1, 1, 1, 1,
0.08432171, 1.329998, -0.4617447, 1, 1, 1, 1, 1,
0.08535338, -0.6408237, 2.770912, 1, 1, 1, 1, 1,
0.08543475, -0.3610852, 3.593313, 1, 1, 1, 1, 1,
0.08546034, -0.0006476949, 1.561575, 1, 1, 1, 1, 1,
0.08558571, -1.027139, 2.138603, 1, 1, 1, 1, 1,
0.09050652, -0.4999928, 3.371054, 1, 1, 1, 1, 1,
0.09498253, -1.099877, 2.204698, 1, 1, 1, 1, 1,
0.09794897, -1.1449, 3.44648, 1, 1, 1, 1, 1,
0.09891123, 0.2628483, 1.404111, 1, 1, 1, 1, 1,
0.09985588, 0.5036472, 0.8815852, 1, 1, 1, 1, 1,
0.101765, -0.5173767, 1.275885, 1, 1, 1, 1, 1,
0.102769, 0.3379312, -0.2671165, 1, 1, 1, 1, 1,
0.1031655, 1.046838, 0.2255524, 1, 1, 1, 1, 1,
0.1032652, 0.9227115, -0.7708659, 1, 1, 1, 1, 1,
0.1112255, 0.5050896, -1.683286, 0, 0, 1, 1, 1,
0.1118752, 0.5114319, -0.892989, 1, 0, 0, 1, 1,
0.1154741, 1.717349, 1.025539, 1, 0, 0, 1, 1,
0.1157045, 0.125716, 2.548202, 1, 0, 0, 1, 1,
0.1193592, -1.172952, 4.500215, 1, 0, 0, 1, 1,
0.1224006, 1.354308, -0.6625732, 1, 0, 0, 1, 1,
0.1253983, 0.3004554, 0.1821888, 0, 0, 0, 1, 1,
0.1276943, 0.9855131, -0.1133916, 0, 0, 0, 1, 1,
0.1317476, 1.564409, -0.6446707, 0, 0, 0, 1, 1,
0.1339561, -1.133285, 4.692443, 0, 0, 0, 1, 1,
0.1349903, 0.3660081, 0.4024045, 0, 0, 0, 1, 1,
0.1400111, -0.3466286, 4.089776, 0, 0, 0, 1, 1,
0.1414249, 0.2989202, 0.5479783, 0, 0, 0, 1, 1,
0.1495111, -0.8132911, 2.86075, 1, 1, 1, 1, 1,
0.1509081, 1.106138, 0.2438653, 1, 1, 1, 1, 1,
0.1511203, -0.2496519, 1.784803, 1, 1, 1, 1, 1,
0.1522631, 2.059019, -0.8849679, 1, 1, 1, 1, 1,
0.1551348, -0.359816, 1.731599, 1, 1, 1, 1, 1,
0.1552578, -0.2003154, 4.007638, 1, 1, 1, 1, 1,
0.1565012, -0.5193808, 3.892015, 1, 1, 1, 1, 1,
0.1569938, 0.875289, -0.5557752, 1, 1, 1, 1, 1,
0.1607702, 1.627933, -0.9206315, 1, 1, 1, 1, 1,
0.1705381, -0.5302491, 3.425294, 1, 1, 1, 1, 1,
0.1741734, -0.5183295, 2.219649, 1, 1, 1, 1, 1,
0.1807252, 0.41472, 1.067276, 1, 1, 1, 1, 1,
0.1816316, 0.406628, -0.9435893, 1, 1, 1, 1, 1,
0.181988, 1.216725, 0.0423325, 1, 1, 1, 1, 1,
0.1835891, -0.808267, 2.650747, 1, 1, 1, 1, 1,
0.1839041, -0.1978326, 2.305795, 0, 0, 1, 1, 1,
0.1841194, -1.066511, 0.932705, 1, 0, 0, 1, 1,
0.1860823, -1.186483, 0.2519927, 1, 0, 0, 1, 1,
0.1908577, 1.254816, -0.6131657, 1, 0, 0, 1, 1,
0.1946091, -1.028691, 1.599401, 1, 0, 0, 1, 1,
0.1952246, 0.8655574, 0.0498745, 1, 0, 0, 1, 1,
0.2002317, -1.660028, 2.922026, 0, 0, 0, 1, 1,
0.2008665, 1.782472, 1.998796, 0, 0, 0, 1, 1,
0.2015726, -0.1787928, 0.7423534, 0, 0, 0, 1, 1,
0.2021245, 0.6127846, 0.4911717, 0, 0, 0, 1, 1,
0.2029506, 0.75741, 1.731676, 0, 0, 0, 1, 1,
0.2046618, 0.1431013, 0.1861046, 0, 0, 0, 1, 1,
0.2057265, 0.2365234, 2.649901, 0, 0, 0, 1, 1,
0.2096223, -0.9072658, 3.283891, 1, 1, 1, 1, 1,
0.2104224, 0.7351059, 0.3007704, 1, 1, 1, 1, 1,
0.2105365, 1.077027, 0.4485914, 1, 1, 1, 1, 1,
0.2136297, 0.3689775, 2.663459, 1, 1, 1, 1, 1,
0.2269445, 0.2615288, 2.318121, 1, 1, 1, 1, 1,
0.2288051, 1.08127, 0.06805439, 1, 1, 1, 1, 1,
0.2294819, -1.609419, 3.086984, 1, 1, 1, 1, 1,
0.2304904, 0.6881698, 0.007472259, 1, 1, 1, 1, 1,
0.2342778, 1.128981, 1.823923, 1, 1, 1, 1, 1,
0.2363889, -0.8028809, 3.287526, 1, 1, 1, 1, 1,
0.238942, 0.5193371, -0.2333469, 1, 1, 1, 1, 1,
0.2412149, 0.5150988, 0.8078541, 1, 1, 1, 1, 1,
0.2415729, -0.4500959, 2.971973, 1, 1, 1, 1, 1,
0.2421112, 1.388686, -0.2384998, 1, 1, 1, 1, 1,
0.2460785, 0.5442761, -0.1515147, 1, 1, 1, 1, 1,
0.2479862, 0.1909515, 0.06229622, 0, 0, 1, 1, 1,
0.2602309, -2.2255, 2.983422, 1, 0, 0, 1, 1,
0.2625773, -0.3270324, 3.279619, 1, 0, 0, 1, 1,
0.2629635, 0.8436075, 0.3732191, 1, 0, 0, 1, 1,
0.2631828, -0.8189517, 0.9579411, 1, 0, 0, 1, 1,
0.2645857, 3.204769, 0.1187766, 1, 0, 0, 1, 1,
0.2663324, 1.260216, 0.1232254, 0, 0, 0, 1, 1,
0.2726054, -0.3617512, 2.029113, 0, 0, 0, 1, 1,
0.274908, -0.04108836, 0.8134463, 0, 0, 0, 1, 1,
0.2793004, 0.3790191, 1.035405, 0, 0, 0, 1, 1,
0.2828203, 0.6546308, 0.6070161, 0, 0, 0, 1, 1,
0.2884626, -0.8307772, 1.45758, 0, 0, 0, 1, 1,
0.2886921, -0.21732, 2.822912, 0, 0, 0, 1, 1,
0.2890523, -0.7640084, 2.255065, 1, 1, 1, 1, 1,
0.2894487, -0.0258112, 0.0114847, 1, 1, 1, 1, 1,
0.2904084, -0.2106769, 1.657979, 1, 1, 1, 1, 1,
0.2906693, -2.820982, 3.147133, 1, 1, 1, 1, 1,
0.2938868, 0.9997718, 1.285815, 1, 1, 1, 1, 1,
0.3046046, -1.14756, 4.574977, 1, 1, 1, 1, 1,
0.3050486, -0.8018648, 2.085766, 1, 1, 1, 1, 1,
0.3085111, -1.932637, 3.551826, 1, 1, 1, 1, 1,
0.3096935, -0.4706793, 3.775005, 1, 1, 1, 1, 1,
0.3109437, 0.1182119, 0.8166837, 1, 1, 1, 1, 1,
0.3141962, -0.02795979, 1.377069, 1, 1, 1, 1, 1,
0.3191915, -2.330781, 3.405237, 1, 1, 1, 1, 1,
0.3240316, 0.1378586, -0.1006669, 1, 1, 1, 1, 1,
0.3258861, 0.6945674, -0.3203595, 1, 1, 1, 1, 1,
0.3260761, 1.814375, 1.82869, 1, 1, 1, 1, 1,
0.3272338, -0.02678799, 1.685068, 0, 0, 1, 1, 1,
0.3313819, -0.4012644, 3.153238, 1, 0, 0, 1, 1,
0.331386, -2.088782, 2.021872, 1, 0, 0, 1, 1,
0.3345213, -0.4674852, 2.076098, 1, 0, 0, 1, 1,
0.3347299, 0.5879102, 0.370817, 1, 0, 0, 1, 1,
0.3386658, -1.699213, 2.424693, 1, 0, 0, 1, 1,
0.3400461, -1.3253, 3.605866, 0, 0, 0, 1, 1,
0.3404756, 0.1113113, 0.5484385, 0, 0, 0, 1, 1,
0.3420604, -0.1283348, 1.187338, 0, 0, 0, 1, 1,
0.3465614, -1.349687, 2.048529, 0, 0, 0, 1, 1,
0.3543439, 0.4401191, 0.1909924, 0, 0, 0, 1, 1,
0.3576424, 1.315663, -0.4833467, 0, 0, 0, 1, 1,
0.3612914, -1.772711, 3.360923, 0, 0, 0, 1, 1,
0.3652976, 1.059303, 1.39332, 1, 1, 1, 1, 1,
0.3666121, -0.5153146, 4.300948, 1, 1, 1, 1, 1,
0.3686496, 1.607643, 0.4765645, 1, 1, 1, 1, 1,
0.3717305, -2.061514, 4.450221, 1, 1, 1, 1, 1,
0.3772819, -1.265296, 4.12659, 1, 1, 1, 1, 1,
0.3791257, -0.09247501, 1.502985, 1, 1, 1, 1, 1,
0.3859098, 1.30409, 0.3800337, 1, 1, 1, 1, 1,
0.3869576, -0.4047139, 2.236682, 1, 1, 1, 1, 1,
0.3895979, 0.5019865, -0.7434986, 1, 1, 1, 1, 1,
0.3950803, 0.9194204, 0.3214506, 1, 1, 1, 1, 1,
0.396054, 0.6343247, -0.5646229, 1, 1, 1, 1, 1,
0.3962428, 1.659584, -0.2153387, 1, 1, 1, 1, 1,
0.3968678, 0.1350212, 1.276644, 1, 1, 1, 1, 1,
0.402842, 0.7559473, -0.8817722, 1, 1, 1, 1, 1,
0.4050364, -2.064435, 4.646714, 1, 1, 1, 1, 1,
0.4056865, -0.06278469, 1.344118, 0, 0, 1, 1, 1,
0.4064983, -1.561815, 2.779785, 1, 0, 0, 1, 1,
0.4104377, -1.731601, 3.578494, 1, 0, 0, 1, 1,
0.420308, 0.73855, 1.039673, 1, 0, 0, 1, 1,
0.4313446, 0.5394349, 0.637535, 1, 0, 0, 1, 1,
0.4317753, 1.425602, -0.7003519, 1, 0, 0, 1, 1,
0.4400552, -0.5613641, 3.940423, 0, 0, 0, 1, 1,
0.4433869, -0.02839586, 2.092272, 0, 0, 0, 1, 1,
0.4438609, -0.9274628, 3.587248, 0, 0, 0, 1, 1,
0.4547627, 1.767559, 0.305404, 0, 0, 0, 1, 1,
0.4586586, -0.3377413, 3.584388, 0, 0, 0, 1, 1,
0.4631347, 0.5280721, 2.671951, 0, 0, 0, 1, 1,
0.4648104, -1.965927, 1.249519, 0, 0, 0, 1, 1,
0.471891, -0.7858801, 1.663887, 1, 1, 1, 1, 1,
0.4720936, 0.9527093, 0.1952751, 1, 1, 1, 1, 1,
0.4735578, -0.8041101, 2.28277, 1, 1, 1, 1, 1,
0.4755332, -0.5453077, 1.595552, 1, 1, 1, 1, 1,
0.4761149, 0.7243484, 0.08720829, 1, 1, 1, 1, 1,
0.4780191, -1.378613, 1.02901, 1, 1, 1, 1, 1,
0.4807577, -1.652466, 2.154856, 1, 1, 1, 1, 1,
0.4812277, 0.4093483, -1.054755, 1, 1, 1, 1, 1,
0.4824027, -0.1337394, 1.67021, 1, 1, 1, 1, 1,
0.4852854, 0.4097469, 1.172956, 1, 1, 1, 1, 1,
0.485915, -0.7777202, 3.150334, 1, 1, 1, 1, 1,
0.4974429, -1.727279, 1.409792, 1, 1, 1, 1, 1,
0.4978123, 0.1822259, 1.947913, 1, 1, 1, 1, 1,
0.5014383, 1.414044, -1.389019, 1, 1, 1, 1, 1,
0.504814, 0.2361489, 1.364704, 1, 1, 1, 1, 1,
0.5070438, 0.38302, 0.07109675, 0, 0, 1, 1, 1,
0.5070948, 0.3162448, 0.6922252, 1, 0, 0, 1, 1,
0.508958, -1.462822, 2.191981, 1, 0, 0, 1, 1,
0.5146757, 0.5667768, 1.053754, 1, 0, 0, 1, 1,
0.520694, 1.950406, -0.4754883, 1, 0, 0, 1, 1,
0.5220974, -0.2580487, 1.525653, 1, 0, 0, 1, 1,
0.5224919, -0.4327133, 2.359524, 0, 0, 0, 1, 1,
0.5263703, 0.176453, 0.8952271, 0, 0, 0, 1, 1,
0.5290809, -0.6113878, 2.60044, 0, 0, 0, 1, 1,
0.5320593, 0.4067796, 2.189324, 0, 0, 0, 1, 1,
0.5339077, 0.9750042, 1.304588, 0, 0, 0, 1, 1,
0.5342576, 0.2565002, 0.9220821, 0, 0, 0, 1, 1,
0.5396475, -0.6156646, 3.881001, 0, 0, 0, 1, 1,
0.5475507, -0.1547827, 5.13795, 1, 1, 1, 1, 1,
0.5484238, 1.03385, 0.3132439, 1, 1, 1, 1, 1,
0.5558208, -0.1541635, 2.919916, 1, 1, 1, 1, 1,
0.5647387, -1.198188, 2.246341, 1, 1, 1, 1, 1,
0.5666581, -0.4830487, 3.375283, 1, 1, 1, 1, 1,
0.5699359, 0.180735, 2.474598, 1, 1, 1, 1, 1,
0.5704779, 0.02348843, 1.309254, 1, 1, 1, 1, 1,
0.5737838, 0.9308594, -0.7456846, 1, 1, 1, 1, 1,
0.5742981, 0.9673013, -0.5738031, 1, 1, 1, 1, 1,
0.5783545, 1.470865, 1.115942, 1, 1, 1, 1, 1,
0.5804744, -0.7619942, 3.239559, 1, 1, 1, 1, 1,
0.5832887, -1.820368, 1.795064, 1, 1, 1, 1, 1,
0.5835487, -1.12979, 2.189327, 1, 1, 1, 1, 1,
0.5840928, 0.3729712, 1.240806, 1, 1, 1, 1, 1,
0.5908551, -1.494481, 1.974103, 1, 1, 1, 1, 1,
0.5926945, -0.7665436, 4.270886, 0, 0, 1, 1, 1,
0.5933384, -0.7812752, 2.962951, 1, 0, 0, 1, 1,
0.6038269, -0.5166419, 1.224156, 1, 0, 0, 1, 1,
0.6047293, 0.8387367, -0.494107, 1, 0, 0, 1, 1,
0.6095515, -2.1077, 3.343082, 1, 0, 0, 1, 1,
0.6117507, -1.443809, 2.487985, 1, 0, 0, 1, 1,
0.6132051, 0.5379419, -0.177812, 0, 0, 0, 1, 1,
0.6139002, -1.802978, 4.060367, 0, 0, 0, 1, 1,
0.6157577, -2.225408, 3.389035, 0, 0, 0, 1, 1,
0.6163687, 0.211049, 1.924634, 0, 0, 0, 1, 1,
0.6208308, -0.6626316, 3.34076, 0, 0, 0, 1, 1,
0.6234523, -0.7961804, 3.096063, 0, 0, 0, 1, 1,
0.6250952, -1.252246, 3.042868, 0, 0, 0, 1, 1,
0.6304119, -0.5847021, 4.066788, 1, 1, 1, 1, 1,
0.631761, 1.04643, 0.4698852, 1, 1, 1, 1, 1,
0.6344097, 0.007771287, 0.04121614, 1, 1, 1, 1, 1,
0.6422448, 0.6603728, 1.441645, 1, 1, 1, 1, 1,
0.6434909, 0.5071434, 1.009499, 1, 1, 1, 1, 1,
0.6446558, -0.522178, 2.275031, 1, 1, 1, 1, 1,
0.6456791, -0.3734955, 2.572869, 1, 1, 1, 1, 1,
0.6469888, -1.600469, 2.916387, 1, 1, 1, 1, 1,
0.6477842, -1.507396, 4.146713, 1, 1, 1, 1, 1,
0.6479242, 1.727211, 1.634228, 1, 1, 1, 1, 1,
0.6486713, 0.01780217, 2.855355, 1, 1, 1, 1, 1,
0.6487403, -0.3099761, 1.082322, 1, 1, 1, 1, 1,
0.6513814, -1.509622, 3.323888, 1, 1, 1, 1, 1,
0.6529449, 1.259587, 0.5014333, 1, 1, 1, 1, 1,
0.6616536, -1.716786, 4.763978, 1, 1, 1, 1, 1,
0.6626983, 0.7451897, 1.67671, 0, 0, 1, 1, 1,
0.6655883, 0.3834366, 3.007168, 1, 0, 0, 1, 1,
0.6714338, 0.9626881, 1.169027, 1, 0, 0, 1, 1,
0.6860015, 0.007692368, 2.991552, 1, 0, 0, 1, 1,
0.6913974, -0.9889971, 2.823613, 1, 0, 0, 1, 1,
0.7021372, -0.7069154, 2.917314, 1, 0, 0, 1, 1,
0.7036157, -1.036405, 2.317962, 0, 0, 0, 1, 1,
0.7042383, 0.1656315, -0.3663177, 0, 0, 0, 1, 1,
0.704364, -1.863961, 2.31532, 0, 0, 0, 1, 1,
0.7051483, -0.1511228, 3.071412, 0, 0, 0, 1, 1,
0.7104445, 0.009455394, 1.397368, 0, 0, 0, 1, 1,
0.7141154, 0.09706077, 1.488527, 0, 0, 0, 1, 1,
0.7149048, 0.4813092, 1.01051, 0, 0, 0, 1, 1,
0.7167994, -1.766251, 2.24458, 1, 1, 1, 1, 1,
0.7204603, 0.3343409, 1.228907, 1, 1, 1, 1, 1,
0.7205428, 0.1639865, 1.362441, 1, 1, 1, 1, 1,
0.7211944, 0.4322089, 1.546746, 1, 1, 1, 1, 1,
0.7274573, 0.9474825, -1.512654, 1, 1, 1, 1, 1,
0.734996, 1.013618, 0.5822508, 1, 1, 1, 1, 1,
0.7364943, -0.9088092, 3.99026, 1, 1, 1, 1, 1,
0.7379102, -0.7538132, 0.6169471, 1, 1, 1, 1, 1,
0.7391893, -1.349362, 5.285239, 1, 1, 1, 1, 1,
0.739976, -0.426685, 1.718419, 1, 1, 1, 1, 1,
0.7517716, -1.008277, 1.678968, 1, 1, 1, 1, 1,
0.7522168, 0.06358603, -0.2433819, 1, 1, 1, 1, 1,
0.7561836, -0.0226346, 1.074146, 1, 1, 1, 1, 1,
0.7615216, 0.103578, 1.561812, 1, 1, 1, 1, 1,
0.7679198, 0.06396372, 1.586403, 1, 1, 1, 1, 1,
0.7779809, -0.5072024, 1.760926, 0, 0, 1, 1, 1,
0.778146, -0.4885018, 3.075658, 1, 0, 0, 1, 1,
0.7801127, -0.1793996, 1.967397, 1, 0, 0, 1, 1,
0.7855775, 0.2388552, 0.8544991, 1, 0, 0, 1, 1,
0.7864547, -0.9339364, 2.08618, 1, 0, 0, 1, 1,
0.7871003, -0.4408772, 2.225638, 1, 0, 0, 1, 1,
0.7950408, 0.8213853, 2.462688, 0, 0, 0, 1, 1,
0.8010544, 0.1450034, 2.261213, 0, 0, 0, 1, 1,
0.8070805, 0.1764581, 1.021073, 0, 0, 0, 1, 1,
0.8087265, 0.4457551, 0.7496751, 0, 0, 0, 1, 1,
0.8115364, -0.9612498, 1.338537, 0, 0, 0, 1, 1,
0.8121738, -0.5586087, 1.238854, 0, 0, 0, 1, 1,
0.8154782, 0.6980933, 1.545536, 0, 0, 0, 1, 1,
0.8162664, 0.1722777, 1.800426, 1, 1, 1, 1, 1,
0.8163647, 1.248571, -0.7914698, 1, 1, 1, 1, 1,
0.8316393, 1.766886, 0.8334355, 1, 1, 1, 1, 1,
0.8360598, -0.8993683, 3.839819, 1, 1, 1, 1, 1,
0.8373092, 0.2012285, 0.4353606, 1, 1, 1, 1, 1,
0.8481874, 0.000375315, 0.7300423, 1, 1, 1, 1, 1,
0.8495806, -1.018967, 2.104182, 1, 1, 1, 1, 1,
0.8521243, 0.4930784, 0.9782112, 1, 1, 1, 1, 1,
0.852931, 0.8151042, -1.340525, 1, 1, 1, 1, 1,
0.8535644, -1.434481, 3.279925, 1, 1, 1, 1, 1,
0.8557707, 0.2910697, 1.667552, 1, 1, 1, 1, 1,
0.8562472, 0.1813514, 0.07306065, 1, 1, 1, 1, 1,
0.8659987, -0.07780667, 2.621155, 1, 1, 1, 1, 1,
0.8708916, -0.6543612, 2.533156, 1, 1, 1, 1, 1,
0.8714502, -0.6614743, 2.059564, 1, 1, 1, 1, 1,
0.8717732, 0.3330519, 1.722473, 0, 0, 1, 1, 1,
0.8870217, 0.003540032, 1.714493, 1, 0, 0, 1, 1,
0.8904558, -0.5964226, 0.8182073, 1, 0, 0, 1, 1,
0.8939299, -1.246933, 2.561561, 1, 0, 0, 1, 1,
0.8948072, -0.2581268, 4.657292, 1, 0, 0, 1, 1,
0.9118757, 0.08504672, 0.5565584, 1, 0, 0, 1, 1,
0.9128771, 0.7956215, -0.5261021, 0, 0, 0, 1, 1,
0.9172925, -0.2495397, 2.24682, 0, 0, 0, 1, 1,
0.9202669, -0.3317806, 1.249524, 0, 0, 0, 1, 1,
0.9216621, 0.4456867, 1.282946, 0, 0, 0, 1, 1,
0.9269255, -1.748442, 1.572542, 0, 0, 0, 1, 1,
0.929599, -0.534821, 1.025907, 0, 0, 0, 1, 1,
0.9339812, 0.2000903, 2.536405, 0, 0, 0, 1, 1,
0.9340893, -0.2846691, 1.534397, 1, 1, 1, 1, 1,
0.9358303, -0.5332506, 1.476626, 1, 1, 1, 1, 1,
0.9363025, -0.7511908, 1.978615, 1, 1, 1, 1, 1,
0.9426049, -0.4012478, 1.128633, 1, 1, 1, 1, 1,
0.9436492, 2.738867, 1.780753, 1, 1, 1, 1, 1,
0.9445876, 2.107872, -1.028527, 1, 1, 1, 1, 1,
0.9509628, -0.08434226, 3.140381, 1, 1, 1, 1, 1,
0.961495, 0.6834136, 2.397156, 1, 1, 1, 1, 1,
0.9623467, 0.1691354, 1.635632, 1, 1, 1, 1, 1,
0.9715724, 2.622514, 0.4539393, 1, 1, 1, 1, 1,
0.9721804, 0.9897683, 0.05968857, 1, 1, 1, 1, 1,
0.9776654, -0.2994276, 1.112984, 1, 1, 1, 1, 1,
0.982105, -0.3998393, 2.285953, 1, 1, 1, 1, 1,
0.9833926, -0.1251913, 1.865573, 1, 1, 1, 1, 1,
0.9882126, -1.52898, 2.801992, 1, 1, 1, 1, 1,
0.9932383, -1.031998, 3.73056, 0, 0, 1, 1, 1,
0.9944405, 2.386034, 0.6028118, 1, 0, 0, 1, 1,
0.9963464, -0.4185951, 0.794193, 1, 0, 0, 1, 1,
0.9981941, 0.5499018, 2.560418, 1, 0, 0, 1, 1,
0.9983358, 0.9155966, -1.484781, 1, 0, 0, 1, 1,
1.028964, 2.162089, 2.485137, 1, 0, 0, 1, 1,
1.031564, -0.2638365, 2.039411, 0, 0, 0, 1, 1,
1.033435, -0.9548171, -0.1726809, 0, 0, 0, 1, 1,
1.033982, -0.2884111, 2.934646, 0, 0, 0, 1, 1,
1.034603, -0.219172, 3.030186, 0, 0, 0, 1, 1,
1.035974, 0.1725098, 1.301891, 0, 0, 0, 1, 1,
1.03799, 1.356531, 0.872135, 0, 0, 0, 1, 1,
1.039921, 0.2044226, 1.517236, 0, 0, 0, 1, 1,
1.043316, -0.4252216, 0.7456397, 1, 1, 1, 1, 1,
1.044384, 1.604342, 1.774464, 1, 1, 1, 1, 1,
1.04453, -0.4609757, 1.458174, 1, 1, 1, 1, 1,
1.044842, -0.4290691, 1.474801, 1, 1, 1, 1, 1,
1.048868, 0.1897953, 0.6349036, 1, 1, 1, 1, 1,
1.049857, 1.94344, -0.508413, 1, 1, 1, 1, 1,
1.051115, 1.280296, 2.132411, 1, 1, 1, 1, 1,
1.051141, -1.784526, 2.3203, 1, 1, 1, 1, 1,
1.060269, 1.970254, 1.011192, 1, 1, 1, 1, 1,
1.061049, -2.781045, 3.050876, 1, 1, 1, 1, 1,
1.061082, 0.1723827, 1.020476, 1, 1, 1, 1, 1,
1.061221, -0.3705825, 3.059808, 1, 1, 1, 1, 1,
1.063941, -1.575184, 5.350022, 1, 1, 1, 1, 1,
1.064341, 1.602688, 0.9413839, 1, 1, 1, 1, 1,
1.065782, 0.1753415, 0.5674458, 1, 1, 1, 1, 1,
1.065923, -0.3885949, 0.1068278, 0, 0, 1, 1, 1,
1.069528, 0.1629532, 2.369884, 1, 0, 0, 1, 1,
1.070555, 0.7243999, 1.777878, 1, 0, 0, 1, 1,
1.087117, -0.3736593, 2.84394, 1, 0, 0, 1, 1,
1.087462, 0.5808619, -0.1214587, 1, 0, 0, 1, 1,
1.091633, 0.84127, -0.1560101, 1, 0, 0, 1, 1,
1.099799, 0.02524383, 2.199386, 0, 0, 0, 1, 1,
1.100479, 1.072132, 2.065536, 0, 0, 0, 1, 1,
1.101934, 0.5993989, 3.380353, 0, 0, 0, 1, 1,
1.102968, -0.8031933, 3.043545, 0, 0, 0, 1, 1,
1.108442, -1.476113, 1.657461, 0, 0, 0, 1, 1,
1.114454, 0.3521543, -0.09684642, 0, 0, 0, 1, 1,
1.117112, 1.647936, 0.01419111, 0, 0, 0, 1, 1,
1.118235, -0.4965879, 1.095266, 1, 1, 1, 1, 1,
1.130059, 0.1472607, 0.1984355, 1, 1, 1, 1, 1,
1.136604, -0.579182, 1.882807, 1, 1, 1, 1, 1,
1.141283, -1.763274, 1.164109, 1, 1, 1, 1, 1,
1.143343, 0.4219015, 3.053911, 1, 1, 1, 1, 1,
1.149349, 1.648077, 1.236505, 1, 1, 1, 1, 1,
1.15034, -0.7619583, 1.911136, 1, 1, 1, 1, 1,
1.150466, 0.3230499, 1.172167, 1, 1, 1, 1, 1,
1.154276, -0.04052254, 1.567385, 1, 1, 1, 1, 1,
1.163487, 0.9275385, 1.357141, 1, 1, 1, 1, 1,
1.163667, 0.5022451, 4.197958, 1, 1, 1, 1, 1,
1.166504, 1.26032, 1.087086, 1, 1, 1, 1, 1,
1.166976, -0.3062937, 2.385308, 1, 1, 1, 1, 1,
1.167646, -1.452772, 0.7438059, 1, 1, 1, 1, 1,
1.171181, 0.4585766, 0.6488836, 1, 1, 1, 1, 1,
1.182247, 1.227056, 1.509904, 0, 0, 1, 1, 1,
1.183306, -0.1059461, 2.642658, 1, 0, 0, 1, 1,
1.188661, -2.331628, 1.799369, 1, 0, 0, 1, 1,
1.199023, 0.1475569, 1.717681, 1, 0, 0, 1, 1,
1.20021, 0.3252902, 1.051245, 1, 0, 0, 1, 1,
1.20576, -0.2331312, 1.097568, 1, 0, 0, 1, 1,
1.205811, 1.236077, 0.3218656, 0, 0, 0, 1, 1,
1.206919, 0.1177012, 1.240283, 0, 0, 0, 1, 1,
1.208788, 1.16039, 0.3748605, 0, 0, 0, 1, 1,
1.216278, 0.3883834, 2.607352, 0, 0, 0, 1, 1,
1.218268, -0.355626, 0.8049442, 0, 0, 0, 1, 1,
1.223859, 0.1800511, 0.0177404, 0, 0, 0, 1, 1,
1.228538, 0.5123011, 1.697501, 0, 0, 0, 1, 1,
1.241228, 1.400354, 0.1628435, 1, 1, 1, 1, 1,
1.242343, -0.2780766, 1.186068, 1, 1, 1, 1, 1,
1.244713, -0.4520968, 2.753628, 1, 1, 1, 1, 1,
1.25098, 0.02622101, 2.725859, 1, 1, 1, 1, 1,
1.253832, 0.3132793, 1.203451, 1, 1, 1, 1, 1,
1.255748, 1.09446, 1.947974, 1, 1, 1, 1, 1,
1.261504, 1.105996, 1.309576, 1, 1, 1, 1, 1,
1.265802, -0.598676, 2.109634, 1, 1, 1, 1, 1,
1.270663, -0.1998662, 1.711924, 1, 1, 1, 1, 1,
1.277653, 0.07768407, 2.005444, 1, 1, 1, 1, 1,
1.287493, 2.096058, 1.01378, 1, 1, 1, 1, 1,
1.28985, 0.286173, 1.532976, 1, 1, 1, 1, 1,
1.291508, -0.7332972, 2.88853, 1, 1, 1, 1, 1,
1.299451, 0.2094279, 2.197687, 1, 1, 1, 1, 1,
1.301052, 1.453151, 1.1541, 1, 1, 1, 1, 1,
1.303528, -0.5569431, 0.9143158, 0, 0, 1, 1, 1,
1.310417, -0.1652467, 1.693059, 1, 0, 0, 1, 1,
1.318362, -0.6638768, 2.842948, 1, 0, 0, 1, 1,
1.319738, 1.280543, 1.136216, 1, 0, 0, 1, 1,
1.32969, -0.4229735, 1.992923, 1, 0, 0, 1, 1,
1.35283, 0.8868387, 0.1218312, 1, 0, 0, 1, 1,
1.354842, 0.05479047, 0.9881863, 0, 0, 0, 1, 1,
1.358532, -0.40917, 1.644944, 0, 0, 0, 1, 1,
1.359249, 1.147622, -0.2910964, 0, 0, 0, 1, 1,
1.366801, 0.8513109, 0.4857824, 0, 0, 0, 1, 1,
1.374968, 0.975404, 0.3372123, 0, 0, 0, 1, 1,
1.37913, 2.875642, -0.8628975, 0, 0, 0, 1, 1,
1.383291, -0.1925054, 0.9434527, 0, 0, 0, 1, 1,
1.384045, 0.1223786, -0.6013128, 1, 1, 1, 1, 1,
1.387363, -0.2027983, 2.029761, 1, 1, 1, 1, 1,
1.393819, -0.2352985, 0.621469, 1, 1, 1, 1, 1,
1.406716, -0.6011588, 1.043446, 1, 1, 1, 1, 1,
1.406929, -1.075625, 0.3073182, 1, 1, 1, 1, 1,
1.40925, -0.02257147, 0.7664412, 1, 1, 1, 1, 1,
1.41388, 1.945851, -1.002204, 1, 1, 1, 1, 1,
1.424982, 0.1995336, 2.051263, 1, 1, 1, 1, 1,
1.426466, -0.06557222, 1.286912, 1, 1, 1, 1, 1,
1.432489, -0.2203047, 2.805783, 1, 1, 1, 1, 1,
1.455148, 1.600363, 0.1404588, 1, 1, 1, 1, 1,
1.456684, -1.216414, 1.426099, 1, 1, 1, 1, 1,
1.459949, -0.5312174, 1.710993, 1, 1, 1, 1, 1,
1.461072, 0.1399817, 1.122789, 1, 1, 1, 1, 1,
1.470577, 0.9059411, 2.657713, 1, 1, 1, 1, 1,
1.473301, 0.2377965, 3.101996, 0, 0, 1, 1, 1,
1.492543, -0.1927053, -0.3005331, 1, 0, 0, 1, 1,
1.497639, -0.4333721, 2.529757, 1, 0, 0, 1, 1,
1.509578, 0.005266308, -1.054962, 1, 0, 0, 1, 1,
1.514349, 1.447683, 0.9998261, 1, 0, 0, 1, 1,
1.518225, 0.8679667, 0.3316881, 1, 0, 0, 1, 1,
1.524182, -0.7704038, 0.9074181, 0, 0, 0, 1, 1,
1.52489, -0.1640439, 0.994181, 0, 0, 0, 1, 1,
1.538821, -0.09486779, 1.945869, 0, 0, 0, 1, 1,
1.543729, -1.277228, 2.636108, 0, 0, 0, 1, 1,
1.546556, -0.7240341, 2.79608, 0, 0, 0, 1, 1,
1.554597, 0.6530034, 2.010186, 0, 0, 0, 1, 1,
1.566115, -1.392013, 2.992738, 0, 0, 0, 1, 1,
1.573163, 0.2452768, 1.980515, 1, 1, 1, 1, 1,
1.589834, 0.08286639, 1.46959, 1, 1, 1, 1, 1,
1.605288, 1.009963, 1.845805, 1, 1, 1, 1, 1,
1.607654, 0.7390044, 0.5852602, 1, 1, 1, 1, 1,
1.615526, -0.8444197, 0.8104388, 1, 1, 1, 1, 1,
1.647467, 0.04159873, 1.988265, 1, 1, 1, 1, 1,
1.675988, 0.8326385, 1.450677, 1, 1, 1, 1, 1,
1.709977, -0.09510358, 2.337714, 1, 1, 1, 1, 1,
1.710959, -0.1619128, 1.720166, 1, 1, 1, 1, 1,
1.749952, 0.5515655, 0.5834241, 1, 1, 1, 1, 1,
1.762224, 1.603008, 0.2530042, 1, 1, 1, 1, 1,
1.762804, -0.4736323, 2.359094, 1, 1, 1, 1, 1,
1.767895, -0.4226609, 3.491936, 1, 1, 1, 1, 1,
1.775292, -2.036827, 2.436666, 1, 1, 1, 1, 1,
1.779124, -1.166127, 1.709572, 1, 1, 1, 1, 1,
1.795, -0.8631531, 2.751497, 0, 0, 1, 1, 1,
1.800487, -0.3948886, -0.5567282, 1, 0, 0, 1, 1,
1.807105, -0.7446164, 2.787396, 1, 0, 0, 1, 1,
1.8142, 0.2425114, 1.950897, 1, 0, 0, 1, 1,
1.815109, -1.495875, 3.008403, 1, 0, 0, 1, 1,
1.839084, -1.648896, 1.931101, 1, 0, 0, 1, 1,
1.851839, 0.1633719, 1.376116, 0, 0, 0, 1, 1,
1.86575, -0.2701463, 3.749804, 0, 0, 0, 1, 1,
1.872108, 0.4211998, 2.828693, 0, 0, 0, 1, 1,
1.890386, -1.674721, 3.873718, 0, 0, 0, 1, 1,
1.911827, -1.230953, 2.321944, 0, 0, 0, 1, 1,
1.92763, 0.9746022, 1.811836, 0, 0, 0, 1, 1,
1.932972, -0.04846178, 1.911676, 0, 0, 0, 1, 1,
1.935842, 0.3542528, 0.7325091, 1, 1, 1, 1, 1,
1.942791, 1.176327, 1.890921, 1, 1, 1, 1, 1,
1.943293, 0.464175, 0.4167294, 1, 1, 1, 1, 1,
1.947663, -0.8730993, 2.196936, 1, 1, 1, 1, 1,
1.956578, 1.064587, 1.694777, 1, 1, 1, 1, 1,
1.960678, 0.6341037, 2.213588, 1, 1, 1, 1, 1,
1.970247, 0.5094625, 2.328763, 1, 1, 1, 1, 1,
1.981363, 0.5045866, 0.5739783, 1, 1, 1, 1, 1,
2.057551, -0.9693735, 0.5838783, 1, 1, 1, 1, 1,
2.063397, -0.2075949, 3.115317, 1, 1, 1, 1, 1,
2.104049, 0.737034, 1.534491, 1, 1, 1, 1, 1,
2.117808, 1.095008, -0.131486, 1, 1, 1, 1, 1,
2.119962, 0.3602958, 1.646953, 1, 1, 1, 1, 1,
2.148931, -1.47631, 0.7271211, 1, 1, 1, 1, 1,
2.155914, 1.367035, 0.2460972, 1, 1, 1, 1, 1,
2.194337, 1.11504, 0.8302163, 0, 0, 1, 1, 1,
2.195619, 0.2710425, 0.2413708, 1, 0, 0, 1, 1,
2.22538, -0.9559637, 0.8793906, 1, 0, 0, 1, 1,
2.253531, -0.01474635, 0.6425435, 1, 0, 0, 1, 1,
2.256481, -1.542232, 2.973155, 1, 0, 0, 1, 1,
2.280029, -0.3595585, 1.540409, 1, 0, 0, 1, 1,
2.28446, -0.2382556, 1.640647, 0, 0, 0, 1, 1,
2.325471, 0.350539, 1.559264, 0, 0, 0, 1, 1,
2.472175, 0.3901701, 1.101356, 0, 0, 0, 1, 1,
2.482147, 0.09654338, 0.1210666, 0, 0, 0, 1, 1,
2.49661, 0.1440369, 1.864792, 0, 0, 0, 1, 1,
2.561257, 0.009934435, 1.161677, 0, 0, 0, 1, 1,
2.67227, -0.7792921, 0.7415865, 0, 0, 0, 1, 1,
2.756299, 0.2259404, 1.447284, 1, 1, 1, 1, 1,
2.806756, -0.05160199, 1.681549, 1, 1, 1, 1, 1,
2.816564, -0.4205359, 2.682597, 1, 1, 1, 1, 1,
2.948727, -0.6431947, 3.098968, 1, 1, 1, 1, 1,
3.18841, 0.4679455, 0.06257972, 1, 1, 1, 1, 1,
3.312209, -0.5838422, 0.9899381, 1, 1, 1, 1, 1,
4.064847, -0.9698659, -0.04951226, 1, 1, 1, 1, 1
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
var radius = 9.868627;
var distance = 34.66314;
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
mvMatrix.translate( -0.4690633, -0.1184716, 0.1820822 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66314);
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
