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
-3.066631, 0.3093853, -2.544239, 1, 0, 0, 1,
-2.819269, 0.6748998, -0.3059949, 1, 0.007843138, 0, 1,
-2.711314, 0.3762088, 0.1274583, 1, 0.01176471, 0, 1,
-2.636781, -0.9824748, -0.5810323, 1, 0.01960784, 0, 1,
-2.427899, 0.7571555, -0.8674708, 1, 0.02352941, 0, 1,
-2.406433, 1.647941, -0.5866291, 1, 0.03137255, 0, 1,
-2.340827, 1.18385, -1.346072, 1, 0.03529412, 0, 1,
-2.31345, 0.2598162, -2.440842, 1, 0.04313726, 0, 1,
-2.262725, 0.4899827, -1.333831, 1, 0.04705882, 0, 1,
-2.224442, -2.086482, -0.4569301, 1, 0.05490196, 0, 1,
-2.213442, 0.9011458, -2.774713, 1, 0.05882353, 0, 1,
-2.193082, -0.3977447, -1.025304, 1, 0.06666667, 0, 1,
-2.192537, -0.6400021, -2.322124, 1, 0.07058824, 0, 1,
-2.153198, -1.091533, -1.90809, 1, 0.07843138, 0, 1,
-2.128711, 0.4993999, -1.663876, 1, 0.08235294, 0, 1,
-2.10716, -1.877847, -4.475421, 1, 0.09019608, 0, 1,
-2.051956, -0.5603898, -2.664656, 1, 0.09411765, 0, 1,
-2.046858, 0.1608363, -0.2501598, 1, 0.1019608, 0, 1,
-2.046773, 0.8150476, -1.538135, 1, 0.1098039, 0, 1,
-2.027499, 0.5275908, -1.125727, 1, 0.1137255, 0, 1,
-1.991461, -0.8379302, -2.52738, 1, 0.1215686, 0, 1,
-1.949335, -2.331892, -3.274468, 1, 0.1254902, 0, 1,
-1.933108, 0.2535146, -0.9769379, 1, 0.1333333, 0, 1,
-1.923803, -0.3811836, -1.677376, 1, 0.1372549, 0, 1,
-1.914877, 0.07332767, -0.6012978, 1, 0.145098, 0, 1,
-1.904148, 0.2848598, -0.9222656, 1, 0.1490196, 0, 1,
-1.900358, 0.3101796, -0.8235841, 1, 0.1568628, 0, 1,
-1.89388, 0.9844176, -1.736616, 1, 0.1607843, 0, 1,
-1.869258, 0.1335269, -0.3605312, 1, 0.1686275, 0, 1,
-1.866209, -1.851168, -1.157597, 1, 0.172549, 0, 1,
-1.851821, 0.3149463, -0.9653176, 1, 0.1803922, 0, 1,
-1.847949, 0.9770559, -2.566624, 1, 0.1843137, 0, 1,
-1.84057, -0.1568203, -2.132741, 1, 0.1921569, 0, 1,
-1.835061, 0.8301442, -0.08043607, 1, 0.1960784, 0, 1,
-1.831833, -0.3181879, -1.777429, 1, 0.2039216, 0, 1,
-1.823532, 1.236123, -0.507722, 1, 0.2117647, 0, 1,
-1.807934, 0.784471, -0.9745744, 1, 0.2156863, 0, 1,
-1.787402, 1.217105, 0.5938902, 1, 0.2235294, 0, 1,
-1.786595, 1.39783, 0.01604125, 1, 0.227451, 0, 1,
-1.737058, 1.473123, -1.820916, 1, 0.2352941, 0, 1,
-1.714365, 1.711998, -0.7978832, 1, 0.2392157, 0, 1,
-1.697912, -0.9423198, -1.628807, 1, 0.2470588, 0, 1,
-1.66247, -0.1341485, -1.727587, 1, 0.2509804, 0, 1,
-1.641513, -0.363367, -1.683079, 1, 0.2588235, 0, 1,
-1.641261, 1.004882, 0.4579836, 1, 0.2627451, 0, 1,
-1.637095, -0.5849697, -3.019658, 1, 0.2705882, 0, 1,
-1.635912, -0.2171211, -0.3916959, 1, 0.2745098, 0, 1,
-1.616894, 0.6679125, -1.004264, 1, 0.282353, 0, 1,
-1.611384, 0.1696767, -1.335434, 1, 0.2862745, 0, 1,
-1.609986, 0.005736235, -1.425023, 1, 0.2941177, 0, 1,
-1.594785, -0.6276815, -2.144274, 1, 0.3019608, 0, 1,
-1.58898, -1.34868, -1.848876, 1, 0.3058824, 0, 1,
-1.588556, 2.275775, 0.1497056, 1, 0.3137255, 0, 1,
-1.572659, -0.6025212, -2.987865, 1, 0.3176471, 0, 1,
-1.559687, -1.580899, -1.976268, 1, 0.3254902, 0, 1,
-1.552209, -0.6137782, -0.4119885, 1, 0.3294118, 0, 1,
-1.546075, 0.8906052, 0.1301455, 1, 0.3372549, 0, 1,
-1.521756, 0.04998616, -2.529061, 1, 0.3411765, 0, 1,
-1.519, 1.560599, 1.103194, 1, 0.3490196, 0, 1,
-1.513054, -1.240741, -1.363405, 1, 0.3529412, 0, 1,
-1.511208, 0.6850948, -2.613662, 1, 0.3607843, 0, 1,
-1.507304, 0.3683235, -1.005885, 1, 0.3647059, 0, 1,
-1.499902, 0.7088652, 0.2439918, 1, 0.372549, 0, 1,
-1.498934, -1.813572, 0.5858772, 1, 0.3764706, 0, 1,
-1.497509, 0.2617596, -3.831991, 1, 0.3843137, 0, 1,
-1.47992, 0.9169462, -0.3620712, 1, 0.3882353, 0, 1,
-1.47175, -0.247201, -3.015754, 1, 0.3960784, 0, 1,
-1.465203, 1.802655, -0.9082596, 1, 0.4039216, 0, 1,
-1.45645, 1.598614, -0.1131451, 1, 0.4078431, 0, 1,
-1.449317, 0.5882432, -1.611933, 1, 0.4156863, 0, 1,
-1.438262, 1.714093, 1.42662, 1, 0.4196078, 0, 1,
-1.429171, 1.349606, -1.282483, 1, 0.427451, 0, 1,
-1.422672, -0.3023314, -2.351801, 1, 0.4313726, 0, 1,
-1.419605, -0.4918992, -0.4210927, 1, 0.4392157, 0, 1,
-1.406992, 1.411428, 0.6108567, 1, 0.4431373, 0, 1,
-1.404399, -0.6501423, -2.461669, 1, 0.4509804, 0, 1,
-1.397624, 0.2071697, -0.794719, 1, 0.454902, 0, 1,
-1.390122, 0.8103951, 0.5462753, 1, 0.4627451, 0, 1,
-1.370482, -1.062449, -2.972715, 1, 0.4666667, 0, 1,
-1.365645, 0.5647328, -1.055258, 1, 0.4745098, 0, 1,
-1.361297, -2.019895, -1.883944, 1, 0.4784314, 0, 1,
-1.360445, 0.8945984, -2.932932, 1, 0.4862745, 0, 1,
-1.348291, 1.046147, -1.924685, 1, 0.4901961, 0, 1,
-1.33388, -1.859675, -3.340131, 1, 0.4980392, 0, 1,
-1.31831, 1.287817, -1.43081, 1, 0.5058824, 0, 1,
-1.317836, 0.1668933, -2.197217, 1, 0.509804, 0, 1,
-1.31504, -0.4555431, -1.161939, 1, 0.5176471, 0, 1,
-1.299024, -0.8888798, -1.341195, 1, 0.5215687, 0, 1,
-1.296734, 0.8785136, -0.9476658, 1, 0.5294118, 0, 1,
-1.294689, -0.6633474, -2.472608, 1, 0.5333334, 0, 1,
-1.289999, 1.035254, -0.9921457, 1, 0.5411765, 0, 1,
-1.288263, -0.2420871, -1.457793, 1, 0.5450981, 0, 1,
-1.281225, -0.4289368, -2.475498, 1, 0.5529412, 0, 1,
-1.275652, 0.0551214, -1.467309, 1, 0.5568628, 0, 1,
-1.26978, 1.818827, -2.835578, 1, 0.5647059, 0, 1,
-1.265967, -0.2132681, -1.422854, 1, 0.5686275, 0, 1,
-1.263204, 0.9050021, -0.1663868, 1, 0.5764706, 0, 1,
-1.258094, -0.05266609, -1.820813, 1, 0.5803922, 0, 1,
-1.257047, 0.2269721, 0.8258693, 1, 0.5882353, 0, 1,
-1.253939, -0.03719333, -0.9811344, 1, 0.5921569, 0, 1,
-1.247651, -0.2194422, -1.456384, 1, 0.6, 0, 1,
-1.234639, 0.6450276, 0.9901347, 1, 0.6078432, 0, 1,
-1.234158, -1.072755, -2.930438, 1, 0.6117647, 0, 1,
-1.222105, 2.11386, -2.548303, 1, 0.6196079, 0, 1,
-1.21672, -0.8456745, -2.755549, 1, 0.6235294, 0, 1,
-1.216294, -0.656714, -0.7352218, 1, 0.6313726, 0, 1,
-1.215558, -0.5852489, -3.757916, 1, 0.6352941, 0, 1,
-1.212845, 0.2758766, -0.3754501, 1, 0.6431373, 0, 1,
-1.209942, -0.1759325, -3.622541, 1, 0.6470588, 0, 1,
-1.209223, -1.086551, -3.105532, 1, 0.654902, 0, 1,
-1.204268, 0.003586236, -3.39283, 1, 0.6588235, 0, 1,
-1.200875, 0.03672154, -1.646929, 1, 0.6666667, 0, 1,
-1.171615, -0.6285495, -0.6781109, 1, 0.6705883, 0, 1,
-1.164746, 0.8045132, 0.4782693, 1, 0.6784314, 0, 1,
-1.153227, -1.034608, -3.241628, 1, 0.682353, 0, 1,
-1.152723, -1.296897, -3.225742, 1, 0.6901961, 0, 1,
-1.144819, -0.4701943, -3.407093, 1, 0.6941177, 0, 1,
-1.122586, 0.0306053, -1.806703, 1, 0.7019608, 0, 1,
-1.119769, 1.396226, -1.868039, 1, 0.7098039, 0, 1,
-1.113308, 0.980683, -0.341395, 1, 0.7137255, 0, 1,
-1.110372, -0.3570784, -3.123194, 1, 0.7215686, 0, 1,
-1.103718, 0.6957976, -0.5887271, 1, 0.7254902, 0, 1,
-1.0998, -0.6594837, -4.192948, 1, 0.7333333, 0, 1,
-1.097975, 0.4414585, -0.7936119, 1, 0.7372549, 0, 1,
-1.097156, -0.2641674, -0.3498299, 1, 0.7450981, 0, 1,
-1.091165, -1.250062, -0.6615803, 1, 0.7490196, 0, 1,
-1.087815, -0.3983216, 0.2939088, 1, 0.7568628, 0, 1,
-1.084824, 3.056247, 3.942892, 1, 0.7607843, 0, 1,
-1.082473, 0.309277, -1.312396, 1, 0.7686275, 0, 1,
-1.078482, 0.9346164, -0.4082909, 1, 0.772549, 0, 1,
-1.07471, -1.555842, -3.292886, 1, 0.7803922, 0, 1,
-1.073974, -0.8209522, -1.034057, 1, 0.7843137, 0, 1,
-1.072767, 1.747659, -0.6108908, 1, 0.7921569, 0, 1,
-1.07218, -0.9556162, -2.24099, 1, 0.7960784, 0, 1,
-1.071235, 1.081856, -2.029321, 1, 0.8039216, 0, 1,
-1.064461, 0.3688769, -1.121837, 1, 0.8117647, 0, 1,
-1.061248, -0.7022143, -3.21021, 1, 0.8156863, 0, 1,
-1.055235, -0.3748515, -2.609662, 1, 0.8235294, 0, 1,
-1.05505, -0.4659975, -3.742754, 1, 0.827451, 0, 1,
-1.052531, 1.352565, -2.135609, 1, 0.8352941, 0, 1,
-1.050463, 0.59986, -2.193307, 1, 0.8392157, 0, 1,
-1.045991, 0.0416867, -1.67819, 1, 0.8470588, 0, 1,
-1.041673, 0.8176755, -1.191466, 1, 0.8509804, 0, 1,
-1.038869, -0.5132898, -4.227287, 1, 0.8588235, 0, 1,
-1.038224, 1.456648, 0.8356957, 1, 0.8627451, 0, 1,
-1.032227, -2.413502, -0.8434488, 1, 0.8705882, 0, 1,
-1.027922, 0.5556287, -0.7247804, 1, 0.8745098, 0, 1,
-1.024422, -0.5705488, -1.424193, 1, 0.8823529, 0, 1,
-1.023498, -1.884099, -2.544157, 1, 0.8862745, 0, 1,
-1.01289, 1.093306, -0.2115077, 1, 0.8941177, 0, 1,
-0.9942033, -0.6487719, -2.673268, 1, 0.8980392, 0, 1,
-0.9940326, -0.3324989, -1.90244, 1, 0.9058824, 0, 1,
-0.9908501, 0.1019291, -2.311814, 1, 0.9137255, 0, 1,
-0.9901458, -0.9999382, -1.320303, 1, 0.9176471, 0, 1,
-0.9873856, -0.8911511, -1.766251, 1, 0.9254902, 0, 1,
-0.9865425, -0.7801064, -0.8360712, 1, 0.9294118, 0, 1,
-0.9839363, 0.4659933, -1.245843, 1, 0.9372549, 0, 1,
-0.9817165, 0.3240741, -2.830847, 1, 0.9411765, 0, 1,
-0.9809645, 0.3303572, -2.377372, 1, 0.9490196, 0, 1,
-0.9779066, -0.337248, -1.363091, 1, 0.9529412, 0, 1,
-0.9751223, -0.5068276, -1.86281, 1, 0.9607843, 0, 1,
-0.971602, 0.0409212, 0.2015186, 1, 0.9647059, 0, 1,
-0.9688613, 0.1914031, -0.6695296, 1, 0.972549, 0, 1,
-0.9663009, 1.066239, -0.9571651, 1, 0.9764706, 0, 1,
-0.9660431, -0.3659014, -1.456323, 1, 0.9843137, 0, 1,
-0.9622849, -0.6056288, -1.157861, 1, 0.9882353, 0, 1,
-0.9605219, -0.4202298, -2.551679, 1, 0.9960784, 0, 1,
-0.9600412, 0.1406052, -3.287122, 0.9960784, 1, 0, 1,
-0.9578678, -1.324407, -1.4428, 0.9921569, 1, 0, 1,
-0.9378523, -1.525555, -2.654505, 0.9843137, 1, 0, 1,
-0.9356595, 1.026156, -0.6644472, 0.9803922, 1, 0, 1,
-0.9332348, 0.5902197, 0.2278692, 0.972549, 1, 0, 1,
-0.9298489, 0.06947397, -2.489104, 0.9686275, 1, 0, 1,
-0.9248019, -1.292525, -1.526942, 0.9607843, 1, 0, 1,
-0.9228711, 1.151197, -1.511423, 0.9568627, 1, 0, 1,
-0.921829, 1.602787, -2.750931, 0.9490196, 1, 0, 1,
-0.9173361, -0.6351698, -0.7675323, 0.945098, 1, 0, 1,
-0.9148677, -0.2359648, -1.454773, 0.9372549, 1, 0, 1,
-0.9118204, -0.2056315, -1.19307, 0.9333333, 1, 0, 1,
-0.9012294, 0.5303347, -1.414108, 0.9254902, 1, 0, 1,
-0.8939225, -1.881109, -2.947891, 0.9215686, 1, 0, 1,
-0.8916112, 0.6342447, -0.9850938, 0.9137255, 1, 0, 1,
-0.8905451, 1.128764, -0.3391186, 0.9098039, 1, 0, 1,
-0.8904471, 0.1968619, -0.5292087, 0.9019608, 1, 0, 1,
-0.8888346, 1.252239, -1.3326, 0.8941177, 1, 0, 1,
-0.8844835, -1.808656, -3.820278, 0.8901961, 1, 0, 1,
-0.8832431, -0.5489707, -2.472224, 0.8823529, 1, 0, 1,
-0.8803036, 0.7088927, -0.325214, 0.8784314, 1, 0, 1,
-0.87815, 0.5843595, -1.118001, 0.8705882, 1, 0, 1,
-0.872184, -0.9616145, -2.016802, 0.8666667, 1, 0, 1,
-0.8502266, 0.2312699, -2.286363, 0.8588235, 1, 0, 1,
-0.8485613, 0.4285906, -0.3857862, 0.854902, 1, 0, 1,
-0.8436613, -0.6532151, -1.933838, 0.8470588, 1, 0, 1,
-0.8429274, 0.9466802, -1.132919, 0.8431373, 1, 0, 1,
-0.8429269, 0.3838432, -0.4870152, 0.8352941, 1, 0, 1,
-0.8355331, -0.999521, -3.470742, 0.8313726, 1, 0, 1,
-0.8329764, -0.3972924, -2.042459, 0.8235294, 1, 0, 1,
-0.8312461, -1.140106, -3.22228, 0.8196079, 1, 0, 1,
-0.8293875, -0.2903647, -0.5013104, 0.8117647, 1, 0, 1,
-0.8283213, 0.3173341, -1.09113, 0.8078431, 1, 0, 1,
-0.8282716, 0.9484984, -3.109223, 0.8, 1, 0, 1,
-0.8252267, -1.703419, -2.715221, 0.7921569, 1, 0, 1,
-0.8214627, -0.8285303, -3.423684, 0.7882353, 1, 0, 1,
-0.8207147, -1.981967, -3.762902, 0.7803922, 1, 0, 1,
-0.8072689, 0.8188817, 0.7811024, 0.7764706, 1, 0, 1,
-0.8066097, 1.206991, -0.1920167, 0.7686275, 1, 0, 1,
-0.8005582, 1.14117, -0.2111255, 0.7647059, 1, 0, 1,
-0.7979448, -0.1600185, -2.437753, 0.7568628, 1, 0, 1,
-0.7979082, -0.6555712, -1.529573, 0.7529412, 1, 0, 1,
-0.7962468, -1.585307, -1.722068, 0.7450981, 1, 0, 1,
-0.7947178, -0.4454375, -2.871387, 0.7411765, 1, 0, 1,
-0.7852094, -0.3663707, -2.545922, 0.7333333, 1, 0, 1,
-0.7802263, -0.1402876, -3.155252, 0.7294118, 1, 0, 1,
-0.768939, -0.1496484, -3.089086, 0.7215686, 1, 0, 1,
-0.7673719, -0.9292579, -0.968326, 0.7176471, 1, 0, 1,
-0.7560751, 0.598209, -2.29769, 0.7098039, 1, 0, 1,
-0.7457051, 0.4104174, -0.9535564, 0.7058824, 1, 0, 1,
-0.7437153, -1.245212, -3.501926, 0.6980392, 1, 0, 1,
-0.7375766, -1.210718, -1.485985, 0.6901961, 1, 0, 1,
-0.7311466, 0.2259558, -2.5256, 0.6862745, 1, 0, 1,
-0.7197827, -0.3586201, -1.554954, 0.6784314, 1, 0, 1,
-0.7095806, 0.1242724, -1.717288, 0.6745098, 1, 0, 1,
-0.7067661, 1.277834, -1.01543, 0.6666667, 1, 0, 1,
-0.7026911, 0.06791355, -1.166716, 0.6627451, 1, 0, 1,
-0.6994588, -1.983902, -2.86507, 0.654902, 1, 0, 1,
-0.6986166, -0.553342, -1.669748, 0.6509804, 1, 0, 1,
-0.6980949, 0.8937966, 0.341776, 0.6431373, 1, 0, 1,
-0.6970835, -1.242967, -2.507012, 0.6392157, 1, 0, 1,
-0.6942741, -1.541197, -3.572572, 0.6313726, 1, 0, 1,
-0.6926988, 1.68201, 1.019775, 0.627451, 1, 0, 1,
-0.6921408, -0.5440708, -0.9774951, 0.6196079, 1, 0, 1,
-0.6849645, -0.42201, -0.2622694, 0.6156863, 1, 0, 1,
-0.6848637, 1.253032, -1.710734, 0.6078432, 1, 0, 1,
-0.6835195, 0.7178454, -1.343181, 0.6039216, 1, 0, 1,
-0.6834462, -0.1870335, -1.19875, 0.5960785, 1, 0, 1,
-0.6833071, -0.3602544, -0.8877485, 0.5882353, 1, 0, 1,
-0.6760271, 0.8244705, -1.893876, 0.5843138, 1, 0, 1,
-0.6754577, -0.502203, -2.181074, 0.5764706, 1, 0, 1,
-0.6739764, 1.488978, -2.278565, 0.572549, 1, 0, 1,
-0.6730678, 0.9458595, -0.4674657, 0.5647059, 1, 0, 1,
-0.6730545, -0.7863634, -1.604979, 0.5607843, 1, 0, 1,
-0.6675906, 1.738762, 0.1627517, 0.5529412, 1, 0, 1,
-0.6662695, 1.798826, -0.6634066, 0.5490196, 1, 0, 1,
-0.6651543, 2.114805, 0.03578402, 0.5411765, 1, 0, 1,
-0.6633819, -0.3216245, -0.588025, 0.5372549, 1, 0, 1,
-0.6627241, -1.183591, -2.821801, 0.5294118, 1, 0, 1,
-0.6590014, -0.04534823, -0.7299004, 0.5254902, 1, 0, 1,
-0.6589134, -1.622739, -2.221283, 0.5176471, 1, 0, 1,
-0.6576697, 0.03043792, -1.983958, 0.5137255, 1, 0, 1,
-0.6571553, -1.057686, -1.917251, 0.5058824, 1, 0, 1,
-0.655476, -0.2488741, -2.038093, 0.5019608, 1, 0, 1,
-0.6532806, 0.02376311, -2.322226, 0.4941176, 1, 0, 1,
-0.6480899, 0.7827702, -1.987636, 0.4862745, 1, 0, 1,
-0.6463887, -0.6985081, -3.33621, 0.4823529, 1, 0, 1,
-0.6458429, -0.7495799, -3.99228, 0.4745098, 1, 0, 1,
-0.6438795, -1.031649, -4.29443, 0.4705882, 1, 0, 1,
-0.6396192, 1.155458, -0.1206107, 0.4627451, 1, 0, 1,
-0.6382952, -1.507492, -2.256605, 0.4588235, 1, 0, 1,
-0.6378467, 0.3574914, -0.06818213, 0.4509804, 1, 0, 1,
-0.6375464, -0.03291612, -0.8750489, 0.4470588, 1, 0, 1,
-0.6354462, -1.606133, -2.540078, 0.4392157, 1, 0, 1,
-0.6249256, -0.3576137, -1.416189, 0.4352941, 1, 0, 1,
-0.6162106, -1.092843, -1.470522, 0.427451, 1, 0, 1,
-0.6112879, 0.8404078, -0.2793775, 0.4235294, 1, 0, 1,
-0.606059, 1.050719, -0.04042065, 0.4156863, 1, 0, 1,
-0.6039197, 0.2430574, 0.2427514, 0.4117647, 1, 0, 1,
-0.5976035, 1.659833, -0.5817019, 0.4039216, 1, 0, 1,
-0.597308, -0.7981114, -3.077807, 0.3960784, 1, 0, 1,
-0.5932674, 0.3035511, -0.932342, 0.3921569, 1, 0, 1,
-0.5923446, -0.9901152, -1.988697, 0.3843137, 1, 0, 1,
-0.5921344, -1.090344, -3.585709, 0.3803922, 1, 0, 1,
-0.5908151, 0.5829914, -1.086827, 0.372549, 1, 0, 1,
-0.5887257, 0.7640439, -0.4603549, 0.3686275, 1, 0, 1,
-0.5836029, -0.1581519, -1.443222, 0.3607843, 1, 0, 1,
-0.5774974, 1.369239, -0.6711189, 0.3568628, 1, 0, 1,
-0.5753589, -1.076325, -2.783914, 0.3490196, 1, 0, 1,
-0.5736916, 0.2892959, -2.081716, 0.345098, 1, 0, 1,
-0.5726705, 0.2683007, -2.44521, 0.3372549, 1, 0, 1,
-0.5716527, 1.460032, 1.654399, 0.3333333, 1, 0, 1,
-0.569522, 0.8847875, -0.8063374, 0.3254902, 1, 0, 1,
-0.5694354, -0.0544402, -2.219669, 0.3215686, 1, 0, 1,
-0.5607363, 2.600549, -0.7840238, 0.3137255, 1, 0, 1,
-0.556917, -0.255143, -1.743457, 0.3098039, 1, 0, 1,
-0.5544947, -0.1523195, 0.4991345, 0.3019608, 1, 0, 1,
-0.5530919, 2.010483, 1.041853, 0.2941177, 1, 0, 1,
-0.5518365, -1.484673, -3.815367, 0.2901961, 1, 0, 1,
-0.5503513, 0.823991, -0.1892219, 0.282353, 1, 0, 1,
-0.5493186, -1.6077, -2.960947, 0.2784314, 1, 0, 1,
-0.5436323, -0.7575586, -2.159727, 0.2705882, 1, 0, 1,
-0.5388686, 0.1824117, -1.566904, 0.2666667, 1, 0, 1,
-0.5347149, -0.7701305, -3.264373, 0.2588235, 1, 0, 1,
-0.527413, -0.7539136, -3.344171, 0.254902, 1, 0, 1,
-0.5233995, -0.7319711, -2.512919, 0.2470588, 1, 0, 1,
-0.5232091, -0.1297294, -1.191584, 0.2431373, 1, 0, 1,
-0.5216759, -0.2543479, -1.085238, 0.2352941, 1, 0, 1,
-0.5212871, -0.02410946, -1.707429, 0.2313726, 1, 0, 1,
-0.5209635, 0.1854624, -1.735979, 0.2235294, 1, 0, 1,
-0.5148756, -1.79044, -3.995276, 0.2196078, 1, 0, 1,
-0.5146727, 0.3869631, -0.1422865, 0.2117647, 1, 0, 1,
-0.5106138, -1.920498, -2.188286, 0.2078431, 1, 0, 1,
-0.50998, 0.536426, -2.223835, 0.2, 1, 0, 1,
-0.5013429, -0.6865041, -1.411893, 0.1921569, 1, 0, 1,
-0.500847, 0.05637148, -2.511555, 0.1882353, 1, 0, 1,
-0.4986061, -1.790264, -1.756116, 0.1803922, 1, 0, 1,
-0.4942924, -2.072456, -3.089925, 0.1764706, 1, 0, 1,
-0.4938805, -0.5160886, -2.693249, 0.1686275, 1, 0, 1,
-0.4893005, -1.545925, -3.773557, 0.1647059, 1, 0, 1,
-0.487227, -1.0852, -1.972783, 0.1568628, 1, 0, 1,
-0.4864456, 0.8375801, -0.5831363, 0.1529412, 1, 0, 1,
-0.4862956, -0.649677, -3.301219, 0.145098, 1, 0, 1,
-0.4861, -1.596557, -2.406101, 0.1411765, 1, 0, 1,
-0.4847761, -0.4672092, -0.9936384, 0.1333333, 1, 0, 1,
-0.4822858, 2.273788, -1.913613, 0.1294118, 1, 0, 1,
-0.4797692, -0.7631302, -3.059227, 0.1215686, 1, 0, 1,
-0.4788414, 0.7974699, -0.6675676, 0.1176471, 1, 0, 1,
-0.4787618, -1.132839, -1.537138, 0.1098039, 1, 0, 1,
-0.4736635, -0.8382147, -3.6031, 0.1058824, 1, 0, 1,
-0.4694246, 0.09937957, -1.373524, 0.09803922, 1, 0, 1,
-0.468097, 0.8465809, -0.5956864, 0.09019608, 1, 0, 1,
-0.4679255, 0.4043035, -0.9800782, 0.08627451, 1, 0, 1,
-0.4647566, -0.3798243, -3.247823, 0.07843138, 1, 0, 1,
-0.460051, -0.5100341, -4.153245, 0.07450981, 1, 0, 1,
-0.4594048, -1.942784, -1.460357, 0.06666667, 1, 0, 1,
-0.4533769, 0.8670459, -1.540049, 0.0627451, 1, 0, 1,
-0.451306, 0.9730749, -1.421207, 0.05490196, 1, 0, 1,
-0.4489695, 0.943007, 0.4303027, 0.05098039, 1, 0, 1,
-0.4459969, 0.5828005, -0.8564356, 0.04313726, 1, 0, 1,
-0.4457105, 0.1152871, -0.4428609, 0.03921569, 1, 0, 1,
-0.4415397, 0.747063, 1.097075, 0.03137255, 1, 0, 1,
-0.4402413, -0.07409537, -1.144748, 0.02745098, 1, 0, 1,
-0.4390802, 0.3480235, -0.1793855, 0.01960784, 1, 0, 1,
-0.4350183, 1.026608, -0.3225278, 0.01568628, 1, 0, 1,
-0.4308354, 0.7770452, -1.153472, 0.007843138, 1, 0, 1,
-0.430235, -0.3517114, -2.650867, 0.003921569, 1, 0, 1,
-0.4261222, -2.456766, -1.639166, 0, 1, 0.003921569, 1,
-0.4204369, -0.07614796, -1.350515, 0, 1, 0.01176471, 1,
-0.4133134, -0.4955172, -3.319084, 0, 1, 0.01568628, 1,
-0.4124827, -1.874052, -2.943647, 0, 1, 0.02352941, 1,
-0.4106189, -0.02138258, -0.8843273, 0, 1, 0.02745098, 1,
-0.4100277, -1.273517, -2.955667, 0, 1, 0.03529412, 1,
-0.4073694, -0.4490592, -2.794287, 0, 1, 0.03921569, 1,
-0.4020915, -1.46874, -3.637842, 0, 1, 0.04705882, 1,
-0.39947, 1.075725, -2.072992, 0, 1, 0.05098039, 1,
-0.3960952, -1.603068, -2.05218, 0, 1, 0.05882353, 1,
-0.3948284, -1.017986, -4.162518, 0, 1, 0.0627451, 1,
-0.3913219, -1.063165, -3.113805, 0, 1, 0.07058824, 1,
-0.3868486, 0.1998602, -1.561896, 0, 1, 0.07450981, 1,
-0.3867267, -0.343913, -2.264078, 0, 1, 0.08235294, 1,
-0.3796693, 0.1376394, -0.7888572, 0, 1, 0.08627451, 1,
-0.3737269, 0.928197, -0.9801942, 0, 1, 0.09411765, 1,
-0.3699699, -0.2182533, -2.537707, 0, 1, 0.1019608, 1,
-0.3680879, 0.595665, 0.06394178, 0, 1, 0.1058824, 1,
-0.3674721, -0.9718862, -3.919021, 0, 1, 0.1137255, 1,
-0.3663899, 1.331109, 0.03958673, 0, 1, 0.1176471, 1,
-0.3662924, 1.321912, -0.591159, 0, 1, 0.1254902, 1,
-0.3647214, 0.275791, -2.49377, 0, 1, 0.1294118, 1,
-0.3641309, 1.290207, -0.1540147, 0, 1, 0.1372549, 1,
-0.3631695, 0.1992375, -0.3970691, 0, 1, 0.1411765, 1,
-0.3618446, 0.6179268, 0.04439969, 0, 1, 0.1490196, 1,
-0.3599086, 0.8776081, 0.1548188, 0, 1, 0.1529412, 1,
-0.3598994, -1.355889, -3.315613, 0, 1, 0.1607843, 1,
-0.3534223, 0.5170462, 2.459244, 0, 1, 0.1647059, 1,
-0.3501632, 0.1886963, -1.099513, 0, 1, 0.172549, 1,
-0.3485764, 0.1149783, -1.999235, 0, 1, 0.1764706, 1,
-0.3470173, 0.3361937, -0.6945175, 0, 1, 0.1843137, 1,
-0.3460436, -0.01829774, -0.2600895, 0, 1, 0.1882353, 1,
-0.3362376, 0.07505408, -0.7472905, 0, 1, 0.1960784, 1,
-0.3317558, -0.5060984, -2.099328, 0, 1, 0.2039216, 1,
-0.3233098, 1.240303, 0.1853781, 0, 1, 0.2078431, 1,
-0.3186147, -1.938556, -4.044044, 0, 1, 0.2156863, 1,
-0.3171438, 1.109752, -0.3602196, 0, 1, 0.2196078, 1,
-0.3157192, -1.199535, -2.731654, 0, 1, 0.227451, 1,
-0.3133203, 1.029859, -1.821311, 0, 1, 0.2313726, 1,
-0.3130141, -0.5480754, -2.117506, 0, 1, 0.2392157, 1,
-0.3115248, 0.6234526, -0.6639808, 0, 1, 0.2431373, 1,
-0.3087464, 0.3530392, -1.291353, 0, 1, 0.2509804, 1,
-0.3066017, -1.528158, -2.788033, 0, 1, 0.254902, 1,
-0.3044018, -2.546554, -3.117006, 0, 1, 0.2627451, 1,
-0.3036754, -0.9352241, -3.910545, 0, 1, 0.2666667, 1,
-0.2965662, 2.139005, -0.7522199, 0, 1, 0.2745098, 1,
-0.2962578, -0.310222, -2.114253, 0, 1, 0.2784314, 1,
-0.2935204, 2.678669, 1.519186, 0, 1, 0.2862745, 1,
-0.2925033, -0.514367, -3.547872, 0, 1, 0.2901961, 1,
-0.2846892, -0.8878409, -3.819499, 0, 1, 0.2980392, 1,
-0.2831757, -0.3645987, -2.24109, 0, 1, 0.3058824, 1,
-0.2814329, -1.221476, -2.947363, 0, 1, 0.3098039, 1,
-0.2793713, 0.2334572, -0.5737914, 0, 1, 0.3176471, 1,
-0.2792087, 0.08111574, -1.496654, 0, 1, 0.3215686, 1,
-0.27539, 1.557782, -0.4890571, 0, 1, 0.3294118, 1,
-0.275067, 0.8914747, 1.35446, 0, 1, 0.3333333, 1,
-0.2670736, 0.331969, 1.223551, 0, 1, 0.3411765, 1,
-0.2666874, 0.4899042, -1.241946, 0, 1, 0.345098, 1,
-0.2623467, 0.2798453, -1.840978, 0, 1, 0.3529412, 1,
-0.2608354, -1.214381, -3.977831, 0, 1, 0.3568628, 1,
-0.2591408, 1.535514, -0.442718, 0, 1, 0.3647059, 1,
-0.2530625, 0.2121877, -1.853507, 0, 1, 0.3686275, 1,
-0.2450859, 1.789188, -0.3293814, 0, 1, 0.3764706, 1,
-0.241292, -0.4238665, -3.429459, 0, 1, 0.3803922, 1,
-0.2406841, -2.117447, -3.272213, 0, 1, 0.3882353, 1,
-0.2405037, -2.355719, -2.046491, 0, 1, 0.3921569, 1,
-0.2401229, 0.7821238, -1.818042, 0, 1, 0.4, 1,
-0.2358582, 1.21072, 0.5055116, 0, 1, 0.4078431, 1,
-0.2338072, -0.3875359, -3.379888, 0, 1, 0.4117647, 1,
-0.2287347, -0.128061, -1.479113, 0, 1, 0.4196078, 1,
-0.2244014, 1.978096, -1.565732, 0, 1, 0.4235294, 1,
-0.2226006, 1.139356, 0.8966963, 0, 1, 0.4313726, 1,
-0.2214788, 0.82952, 0.493568, 0, 1, 0.4352941, 1,
-0.2170924, 1.0611, 0.8839882, 0, 1, 0.4431373, 1,
-0.2153843, 0.2828422, -0.4115101, 0, 1, 0.4470588, 1,
-0.2150243, 0.1954997, -1.744911, 0, 1, 0.454902, 1,
-0.2141444, -2.179535, -2.939728, 0, 1, 0.4588235, 1,
-0.2141088, 0.9009193, -0.1078969, 0, 1, 0.4666667, 1,
-0.2138519, 0.3632967, -0.2741225, 0, 1, 0.4705882, 1,
-0.2012712, 0.8248048, 0.4191776, 0, 1, 0.4784314, 1,
-0.1990642, 0.6324338, 0.3733935, 0, 1, 0.4823529, 1,
-0.1976187, 1.254052, -1.979226, 0, 1, 0.4901961, 1,
-0.1933202, -0.0725574, -1.355302, 0, 1, 0.4941176, 1,
-0.190382, 0.8305854, -0.963078, 0, 1, 0.5019608, 1,
-0.1892309, 1.37699, -1.352985, 0, 1, 0.509804, 1,
-0.1889921, -0.7184567, -1.519314, 0, 1, 0.5137255, 1,
-0.1855727, -0.7047517, -2.266966, 0, 1, 0.5215687, 1,
-0.1830049, -1.152421, -2.341892, 0, 1, 0.5254902, 1,
-0.1824871, -0.6083155, -4.074186, 0, 1, 0.5333334, 1,
-0.1782139, 0.1609261, -0.1787941, 0, 1, 0.5372549, 1,
-0.1728725, -1.270662, -2.198811, 0, 1, 0.5450981, 1,
-0.1696656, -2.032498, -2.452015, 0, 1, 0.5490196, 1,
-0.168936, -0.01502236, -2.276731, 0, 1, 0.5568628, 1,
-0.1650527, 0.9953539, -1.085197, 0, 1, 0.5607843, 1,
-0.1646021, -0.7272478, -4.94079, 0, 1, 0.5686275, 1,
-0.1641227, -0.4602121, -3.41445, 0, 1, 0.572549, 1,
-0.1631568, -0.7369095, -2.668183, 0, 1, 0.5803922, 1,
-0.1628033, -0.7312533, -3.756904, 0, 1, 0.5843138, 1,
-0.1606199, -2.462991, -3.73045, 0, 1, 0.5921569, 1,
-0.1593149, -0.2671573, -2.669188, 0, 1, 0.5960785, 1,
-0.1588875, 2.198921, -0.3421168, 0, 1, 0.6039216, 1,
-0.1553004, -1.426833, -3.305215, 0, 1, 0.6117647, 1,
-0.1515781, 0.5697336, -0.7662152, 0, 1, 0.6156863, 1,
-0.151337, -0.9431091, -3.636276, 0, 1, 0.6235294, 1,
-0.1509951, 0.6507627, -2.731532, 0, 1, 0.627451, 1,
-0.1506491, 0.3625875, -0.8034723, 0, 1, 0.6352941, 1,
-0.1466307, -0.2320408, -4.093598, 0, 1, 0.6392157, 1,
-0.1379711, -1.287336, -4.234583, 0, 1, 0.6470588, 1,
-0.13787, -1.164302, -4.062738, 0, 1, 0.6509804, 1,
-0.1367097, 0.6011641, 0.7178195, 0, 1, 0.6588235, 1,
-0.1356142, -1.539152, -1.34883, 0, 1, 0.6627451, 1,
-0.1354919, 0.3176013, -0.6288803, 0, 1, 0.6705883, 1,
-0.1352528, 0.132494, -1.714461, 0, 1, 0.6745098, 1,
-0.133535, 0.3951685, -0.9822634, 0, 1, 0.682353, 1,
-0.1311687, 0.7738082, -0.1946932, 0, 1, 0.6862745, 1,
-0.1297149, -1.117071, -2.345405, 0, 1, 0.6941177, 1,
-0.1275607, -0.2459513, -1.969234, 0, 1, 0.7019608, 1,
-0.1271172, -0.3710243, -2.902742, 0, 1, 0.7058824, 1,
-0.1243741, -0.8356188, -2.628862, 0, 1, 0.7137255, 1,
-0.1173524, 0.2295226, -0.2245994, 0, 1, 0.7176471, 1,
-0.1172349, -0.7420442, -0.0785372, 0, 1, 0.7254902, 1,
-0.1159616, 1.581912, -1.240528, 0, 1, 0.7294118, 1,
-0.1077544, 0.803226, -1.399553, 0, 1, 0.7372549, 1,
-0.1067885, 0.9783154, 0.41217, 0, 1, 0.7411765, 1,
-0.1017082, -0.2400467, -4.093039, 0, 1, 0.7490196, 1,
-0.1014459, 1.521569, 0.3776352, 0, 1, 0.7529412, 1,
-0.1014066, -0.2725683, -2.900738, 0, 1, 0.7607843, 1,
-0.1002926, -0.7230307, -2.616992, 0, 1, 0.7647059, 1,
-0.09888277, -0.7557679, -4.615826, 0, 1, 0.772549, 1,
-0.09551306, 1.814376, 0.5180063, 0, 1, 0.7764706, 1,
-0.09073267, 1.558795, 0.1180242, 0, 1, 0.7843137, 1,
-0.08473696, 1.983703, 0.4159405, 0, 1, 0.7882353, 1,
-0.08271623, 0.4450455, 0.05225657, 0, 1, 0.7960784, 1,
-0.07982321, -0.2605518, -3.089813, 0, 1, 0.8039216, 1,
-0.07646706, 0.509207, -1.479577, 0, 1, 0.8078431, 1,
-0.07056443, -2.726628, -3.109585, 0, 1, 0.8156863, 1,
-0.06908516, 0.6355333, 0.7388099, 0, 1, 0.8196079, 1,
-0.06108109, -0.9527311, -1.794636, 0, 1, 0.827451, 1,
-0.0593512, -1.619009, -1.232091, 0, 1, 0.8313726, 1,
-0.05900026, -0.3651183, -2.634206, 0, 1, 0.8392157, 1,
-0.05693775, 0.9666158, 0.6739975, 0, 1, 0.8431373, 1,
-0.05643754, 0.4532371, 0.6615889, 0, 1, 0.8509804, 1,
-0.05315766, -0.790432, -2.857045, 0, 1, 0.854902, 1,
-0.05180293, 0.1974705, -1.267654, 0, 1, 0.8627451, 1,
-0.04720779, -0.3956338, -4.078129, 0, 1, 0.8666667, 1,
-0.04719569, -1.472947, -5.718814, 0, 1, 0.8745098, 1,
-0.04274684, -1.681199, -4.323987, 0, 1, 0.8784314, 1,
-0.03866447, -0.859001, -3.668125, 0, 1, 0.8862745, 1,
-0.03781731, 0.2441406, 0.5605962, 0, 1, 0.8901961, 1,
-0.03423833, 0.8016233, 0.9724352, 0, 1, 0.8980392, 1,
-0.0301223, -0.06542169, -0.9903902, 0, 1, 0.9058824, 1,
-0.02872705, 0.6318236, -1.349291, 0, 1, 0.9098039, 1,
-0.0260144, 0.6322758, 0.4971731, 0, 1, 0.9176471, 1,
-0.02586239, 0.4714966, -0.6185784, 0, 1, 0.9215686, 1,
-0.02392023, 0.4993483, -0.4787497, 0, 1, 0.9294118, 1,
-0.02221387, -0.4524436, -2.564784, 0, 1, 0.9333333, 1,
-0.01669632, 1.036106, -1.22991, 0, 1, 0.9411765, 1,
-0.01048906, -1.078091, -2.187375, 0, 1, 0.945098, 1,
-0.007691643, -0.9073752, -2.074182, 0, 1, 0.9529412, 1,
-0.003804901, -0.001959333, -1.855628, 0, 1, 0.9568627, 1,
-0.002407873, -1.493995, -2.789241, 0, 1, 0.9647059, 1,
0.002861365, -0.203437, 2.069127, 0, 1, 0.9686275, 1,
0.00853189, -0.2023364, 1.891745, 0, 1, 0.9764706, 1,
0.009801003, 0.2050259, -0.6959626, 0, 1, 0.9803922, 1,
0.01509985, -0.02305035, 3.853919, 0, 1, 0.9882353, 1,
0.01600898, 0.1280438, -0.1431569, 0, 1, 0.9921569, 1,
0.01647433, 1.172344, 1.106742, 0, 1, 1, 1,
0.02641189, 0.1850251, -1.5134, 0, 0.9921569, 1, 1,
0.02701968, -1.004777, 2.515876, 0, 0.9882353, 1, 1,
0.03094616, 2.706204, 1.523623, 0, 0.9803922, 1, 1,
0.03548979, -0.4655792, 1.170815, 0, 0.9764706, 1, 1,
0.04013665, -1.636545, 2.649614, 0, 0.9686275, 1, 1,
0.04044852, 0.1667824, 0.3008685, 0, 0.9647059, 1, 1,
0.04286561, -0.1886316, 3.947981, 0, 0.9568627, 1, 1,
0.05527062, -0.2095481, 4.454309, 0, 0.9529412, 1, 1,
0.06016119, -0.8873896, 2.781034, 0, 0.945098, 1, 1,
0.06442299, 2.01758, -0.372818, 0, 0.9411765, 1, 1,
0.07164557, -0.3417788, 1.128516, 0, 0.9333333, 1, 1,
0.07198876, 0.3508538, 0.5892804, 0, 0.9294118, 1, 1,
0.07409672, -0.2001906, 4.002035, 0, 0.9215686, 1, 1,
0.07633498, -0.5294065, 4.336358, 0, 0.9176471, 1, 1,
0.08454635, 0.009994939, 1.990417, 0, 0.9098039, 1, 1,
0.08573633, -0.3685777, 3.198609, 0, 0.9058824, 1, 1,
0.0909851, 0.2772175, -1.027775, 0, 0.8980392, 1, 1,
0.09171101, -0.6868054, 2.171476, 0, 0.8901961, 1, 1,
0.09231083, 1.179739, 0.2015807, 0, 0.8862745, 1, 1,
0.09426347, 0.62695, 2.383173, 0, 0.8784314, 1, 1,
0.09427396, -0.6886172, 3.321893, 0, 0.8745098, 1, 1,
0.09728874, -0.04603926, 1.516036, 0, 0.8666667, 1, 1,
0.09822269, 0.07156171, 0.5469376, 0, 0.8627451, 1, 1,
0.09913886, 0.884441, 3.044482, 0, 0.854902, 1, 1,
0.1026407, 0.04412951, -0.3338742, 0, 0.8509804, 1, 1,
0.1032253, 0.6303412, 0.3623498, 0, 0.8431373, 1, 1,
0.107687, -0.1519652, 1.302053, 0, 0.8392157, 1, 1,
0.1104595, -0.7526085, 3.560703, 0, 0.8313726, 1, 1,
0.1116292, 0.6640086, -0.6374308, 0, 0.827451, 1, 1,
0.1148638, 0.9360028, 1.913602, 0, 0.8196079, 1, 1,
0.1158053, -0.3621404, 2.417006, 0, 0.8156863, 1, 1,
0.1205077, 2.054259, 1.975334, 0, 0.8078431, 1, 1,
0.1206811, -2.014904, 3.854153, 0, 0.8039216, 1, 1,
0.1228912, -0.2389143, 2.6886, 0, 0.7960784, 1, 1,
0.1259754, -2.632547, 3.484909, 0, 0.7882353, 1, 1,
0.1263801, -1.006978, 2.11764, 0, 0.7843137, 1, 1,
0.1267387, -0.4868949, 2.592625, 0, 0.7764706, 1, 1,
0.1278019, -1.021052, 1.88574, 0, 0.772549, 1, 1,
0.1317179, -0.4540357, 4.725867, 0, 0.7647059, 1, 1,
0.1344976, -1.021579, 4.573096, 0, 0.7607843, 1, 1,
0.138578, 0.351606, 0.8300281, 0, 0.7529412, 1, 1,
0.1413166, 1.260785, 0.07349464, 0, 0.7490196, 1, 1,
0.1441514, 0.6968984, 0.2283966, 0, 0.7411765, 1, 1,
0.1458992, 0.1684169, 1.055483, 0, 0.7372549, 1, 1,
0.1483987, -0.5295554, 1.850672, 0, 0.7294118, 1, 1,
0.1506999, 0.6849974, 1.950886, 0, 0.7254902, 1, 1,
0.1560318, 0.5545586, 1.147639, 0, 0.7176471, 1, 1,
0.1672083, -0.3523019, 4.01912, 0, 0.7137255, 1, 1,
0.1762536, -0.784644, 4.842539, 0, 0.7058824, 1, 1,
0.1810926, 0.5209804, 0.01640725, 0, 0.6980392, 1, 1,
0.1869757, -0.5561883, 2.621247, 0, 0.6941177, 1, 1,
0.1880273, -0.3210815, 5.998769, 0, 0.6862745, 1, 1,
0.1898048, 0.5714329, -0.1861347, 0, 0.682353, 1, 1,
0.1909575, -0.03297759, 2.066852, 0, 0.6745098, 1, 1,
0.1917735, 0.178833, 0.1586496, 0, 0.6705883, 1, 1,
0.1927644, -1.280378, 3.615633, 0, 0.6627451, 1, 1,
0.1982905, -0.325999, 3.641269, 0, 0.6588235, 1, 1,
0.1992463, 0.01068085, 1.856515, 0, 0.6509804, 1, 1,
0.1994343, -0.291534, 2.468189, 0, 0.6470588, 1, 1,
0.1999711, 0.6479787, -0.111443, 0, 0.6392157, 1, 1,
0.2070575, -0.314565, 1.546022, 0, 0.6352941, 1, 1,
0.2185368, -0.02025553, 3.64779, 0, 0.627451, 1, 1,
0.2195304, -1.035879, 2.43377, 0, 0.6235294, 1, 1,
0.2222283, -0.2051995, 2.52688, 0, 0.6156863, 1, 1,
0.2228504, -0.3394511, 5.617648, 0, 0.6117647, 1, 1,
0.2297691, 1.240305, 0.5757211, 0, 0.6039216, 1, 1,
0.2325077, 0.4350485, -0.03706758, 0, 0.5960785, 1, 1,
0.233202, 0.1508384, -0.2558337, 0, 0.5921569, 1, 1,
0.2358418, 0.06369113, 0.3940385, 0, 0.5843138, 1, 1,
0.2360309, 0.7576668, -0.2622477, 0, 0.5803922, 1, 1,
0.2361664, -0.6410682, 2.802919, 0, 0.572549, 1, 1,
0.2386246, -1.888368, 2.553324, 0, 0.5686275, 1, 1,
0.2429864, -0.6746119, 2.387067, 0, 0.5607843, 1, 1,
0.2450906, 0.9322036, -0.8811011, 0, 0.5568628, 1, 1,
0.2471449, -0.5483431, 2.787647, 0, 0.5490196, 1, 1,
0.2494285, -0.2909039, 1.531837, 0, 0.5450981, 1, 1,
0.2515837, -0.5095827, 2.506453, 0, 0.5372549, 1, 1,
0.2521253, -1.321368, 3.903812, 0, 0.5333334, 1, 1,
0.2586911, 0.2196016, 0.6997277, 0, 0.5254902, 1, 1,
0.2587235, 0.7610949, 1.103319, 0, 0.5215687, 1, 1,
0.2587391, -0.5917205, 1.375646, 0, 0.5137255, 1, 1,
0.2601998, 0.3139506, 1.882676, 0, 0.509804, 1, 1,
0.2624799, -1.855682, 1.019847, 0, 0.5019608, 1, 1,
0.2680069, -0.9804104, 2.971757, 0, 0.4941176, 1, 1,
0.2698605, 0.4069194, 1.654234, 0, 0.4901961, 1, 1,
0.2743966, -1.608894, 2.95389, 0, 0.4823529, 1, 1,
0.275937, -0.6094371, 2.770958, 0, 0.4784314, 1, 1,
0.277134, 0.221923, 0.2705691, 0, 0.4705882, 1, 1,
0.2773135, 0.2259068, 0.03106943, 0, 0.4666667, 1, 1,
0.278408, 0.8882204, 0.1857718, 0, 0.4588235, 1, 1,
0.2825816, 0.7695255, 0.002934292, 0, 0.454902, 1, 1,
0.2865963, -0.7206518, 4.859965, 0, 0.4470588, 1, 1,
0.2870706, 0.5569187, -0.1596066, 0, 0.4431373, 1, 1,
0.288768, 0.03821684, 1.355673, 0, 0.4352941, 1, 1,
0.2889971, 1.297472, -0.8334295, 0, 0.4313726, 1, 1,
0.2913224, -0.1661182, 3.108751, 0, 0.4235294, 1, 1,
0.2924196, 0.3257675, 2.324964, 0, 0.4196078, 1, 1,
0.2983668, -0.4600932, 2.231329, 0, 0.4117647, 1, 1,
0.3013666, -0.4064612, 3.499094, 0, 0.4078431, 1, 1,
0.3014482, -1.503712, 1.690597, 0, 0.4, 1, 1,
0.3015063, 0.7760819, -0.185309, 0, 0.3921569, 1, 1,
0.3024198, -1.427308, 3.605698, 0, 0.3882353, 1, 1,
0.3196469, 0.1120848, 1.017077, 0, 0.3803922, 1, 1,
0.3232232, 0.5144258, 1.395667, 0, 0.3764706, 1, 1,
0.3325483, 0.2657482, 1.229902, 0, 0.3686275, 1, 1,
0.3404939, 0.2155541, 1.002288, 0, 0.3647059, 1, 1,
0.3405989, -1.432818, 3.528203, 0, 0.3568628, 1, 1,
0.3444229, -0.09807416, 3.680527, 0, 0.3529412, 1, 1,
0.3461597, -0.195201, 1.147613, 0, 0.345098, 1, 1,
0.3468147, -0.5107848, 1.826168, 0, 0.3411765, 1, 1,
0.3478275, 0.2166765, 2.102409, 0, 0.3333333, 1, 1,
0.3488207, 0.1913922, -0.8490028, 0, 0.3294118, 1, 1,
0.3499228, 0.09989442, 2.210648, 0, 0.3215686, 1, 1,
0.3501415, 0.8776753, -0.7671988, 0, 0.3176471, 1, 1,
0.3502126, 0.464534, -1.264279, 0, 0.3098039, 1, 1,
0.353239, -1.056785, 2.393286, 0, 0.3058824, 1, 1,
0.3546013, -0.2880794, 2.886674, 0, 0.2980392, 1, 1,
0.3553974, -1.056722, 3.363219, 0, 0.2901961, 1, 1,
0.3590843, 0.5389268, 1.812487, 0, 0.2862745, 1, 1,
0.3597544, 0.2261497, -0.5248077, 0, 0.2784314, 1, 1,
0.3616485, -0.8094979, 3.174667, 0, 0.2745098, 1, 1,
0.3616537, 0.5306387, 0.1746666, 0, 0.2666667, 1, 1,
0.3620607, 0.4714777, 1.073922, 0, 0.2627451, 1, 1,
0.3640188, 0.9442003, 1.445997, 0, 0.254902, 1, 1,
0.3660975, -0.1904302, 1.232427, 0, 0.2509804, 1, 1,
0.3835334, 0.5410584, 0.8279133, 0, 0.2431373, 1, 1,
0.3857762, -0.05843791, 2.107681, 0, 0.2392157, 1, 1,
0.3858708, -0.682268, 2.016572, 0, 0.2313726, 1, 1,
0.3877681, 0.183612, 1.112932, 0, 0.227451, 1, 1,
0.3884538, -1.05195, 2.866249, 0, 0.2196078, 1, 1,
0.3924081, -0.8296009, 2.831207, 0, 0.2156863, 1, 1,
0.3950803, -1.549107, 3.262129, 0, 0.2078431, 1, 1,
0.3950939, 1.29451, 1.448806, 0, 0.2039216, 1, 1,
0.3955621, 0.4428517, -1.050718, 0, 0.1960784, 1, 1,
0.3993291, 0.1280293, -0.6590719, 0, 0.1882353, 1, 1,
0.4022182, 0.6633022, 2.057605, 0, 0.1843137, 1, 1,
0.4033132, 1.186923, 0.07955603, 0, 0.1764706, 1, 1,
0.4085017, 0.03426526, 3.258691, 0, 0.172549, 1, 1,
0.4154181, -0.765514, 2.958904, 0, 0.1647059, 1, 1,
0.4168409, -1.403095, 2.055851, 0, 0.1607843, 1, 1,
0.4168682, -1.689116, 2.923071, 0, 0.1529412, 1, 1,
0.4169581, -1.40252, 1.624938, 0, 0.1490196, 1, 1,
0.419292, 0.3097233, 1.611775, 0, 0.1411765, 1, 1,
0.4196233, -0.561707, 3.296798, 0, 0.1372549, 1, 1,
0.4202088, 0.6516713, -0.2868097, 0, 0.1294118, 1, 1,
0.4216349, -1.852402, 2.623772, 0, 0.1254902, 1, 1,
0.4222809, -0.03718435, 3.822908, 0, 0.1176471, 1, 1,
0.4249451, 0.6639507, 0.4684395, 0, 0.1137255, 1, 1,
0.4269646, 0.2737047, 0.133949, 0, 0.1058824, 1, 1,
0.4484754, -0.007306316, 0.4309883, 0, 0.09803922, 1, 1,
0.4535608, 0.9928096, -1.540554, 0, 0.09411765, 1, 1,
0.4587754, -0.7570462, 3.634459, 0, 0.08627451, 1, 1,
0.4591514, -0.661662, 2.218935, 0, 0.08235294, 1, 1,
0.4599773, 0.9175785, -0.3128102, 0, 0.07450981, 1, 1,
0.4639389, 1.856711, 0.7447836, 0, 0.07058824, 1, 1,
0.4674818, 1.94761, 0.6012473, 0, 0.0627451, 1, 1,
0.4698622, 0.2889755, 1.44355, 0, 0.05882353, 1, 1,
0.4705763, 0.400918, -0.2386296, 0, 0.05098039, 1, 1,
0.4714625, 1.055697, 0.4953321, 0, 0.04705882, 1, 1,
0.4730224, -1.386033, 4.391804, 0, 0.03921569, 1, 1,
0.4748484, 0.4664243, -0.7278039, 0, 0.03529412, 1, 1,
0.4756314, -1.582192, 2.570205, 0, 0.02745098, 1, 1,
0.477008, -0.114307, 0.9674228, 0, 0.02352941, 1, 1,
0.4789384, 1.073899, 0.2098244, 0, 0.01568628, 1, 1,
0.481453, 0.8181227, -0.02282777, 0, 0.01176471, 1, 1,
0.4843455, -0.01919686, -0.1771398, 0, 0.003921569, 1, 1,
0.4860238, -0.4835903, 3.823344, 0.003921569, 0, 1, 1,
0.4861281, -1.792785, 1.953282, 0.007843138, 0, 1, 1,
0.4887596, 0.3130724, -0.5973937, 0.01568628, 0, 1, 1,
0.4922122, 1.513459, 0.9268249, 0.01960784, 0, 1, 1,
0.4926877, 1.334291, 0.04232835, 0.02745098, 0, 1, 1,
0.4980694, -0.4617993, 1.515228, 0.03137255, 0, 1, 1,
0.5037171, -0.9286565, 3.70956, 0.03921569, 0, 1, 1,
0.5048566, -1.373925, 2.348703, 0.04313726, 0, 1, 1,
0.5085905, 0.1230398, 0.7802553, 0.05098039, 0, 1, 1,
0.5093735, 0.5085221, 1.069764, 0.05490196, 0, 1, 1,
0.5151659, -0.2508447, 1.8316, 0.0627451, 0, 1, 1,
0.524357, 0.734124, 0.5251527, 0.06666667, 0, 1, 1,
0.5277103, 1.550648, 0.9270504, 0.07450981, 0, 1, 1,
0.5299026, 1.731009, 0.3656255, 0.07843138, 0, 1, 1,
0.5301571, 0.2378517, 2.079689, 0.08627451, 0, 1, 1,
0.5353872, -0.8255187, 0.8313793, 0.09019608, 0, 1, 1,
0.5411135, 0.4879734, 0.3695431, 0.09803922, 0, 1, 1,
0.5413294, 1.274293, 1.217034, 0.1058824, 0, 1, 1,
0.545531, 1.587435, -2.324802, 0.1098039, 0, 1, 1,
0.5474451, 1.978423, 0.8545032, 0.1176471, 0, 1, 1,
0.5477191, -1.730422, 1.957909, 0.1215686, 0, 1, 1,
0.5487996, 0.5933828, 1.075221, 0.1294118, 0, 1, 1,
0.553096, -0.1157108, 2.672456, 0.1333333, 0, 1, 1,
0.5544801, 1.140023, 1.854468, 0.1411765, 0, 1, 1,
0.5556872, -0.7037286, 4.090689, 0.145098, 0, 1, 1,
0.5559291, -1.144238, 2.851853, 0.1529412, 0, 1, 1,
0.5561728, -1.051688, 4.118727, 0.1568628, 0, 1, 1,
0.5585533, 0.7846043, 1.207523, 0.1647059, 0, 1, 1,
0.5597318, -2.127468, 3.497133, 0.1686275, 0, 1, 1,
0.5625065, -0.08719763, 2.150891, 0.1764706, 0, 1, 1,
0.5675255, -0.5751905, 1.86641, 0.1803922, 0, 1, 1,
0.5697576, 1.615274, 1.279522, 0.1882353, 0, 1, 1,
0.5712254, -2.248256, 2.601651, 0.1921569, 0, 1, 1,
0.5733914, -0.2104375, 2.925848, 0.2, 0, 1, 1,
0.5735376, 0.8921399, 0.2230715, 0.2078431, 0, 1, 1,
0.57506, -0.9111071, 2.439316, 0.2117647, 0, 1, 1,
0.5753859, -0.6073373, 3.858096, 0.2196078, 0, 1, 1,
0.5772738, -1.977229, 2.731283, 0.2235294, 0, 1, 1,
0.5794767, 1.267719, -1.133485, 0.2313726, 0, 1, 1,
0.5805798, 0.9395276, -0.6355651, 0.2352941, 0, 1, 1,
0.5824105, -1.324329, 4.232469, 0.2431373, 0, 1, 1,
0.5843027, 0.2933811, 1.63643, 0.2470588, 0, 1, 1,
0.5900311, -0.6482004, 2.533694, 0.254902, 0, 1, 1,
0.5908569, -0.2222881, 2.089272, 0.2588235, 0, 1, 1,
0.5928201, -0.5168793, 2.75048, 0.2666667, 0, 1, 1,
0.5944631, -1.581365, 4.449364, 0.2705882, 0, 1, 1,
0.5969833, 0.1220669, 2.99051, 0.2784314, 0, 1, 1,
0.5987693, 0.01608537, -0.4574855, 0.282353, 0, 1, 1,
0.6001468, 0.2514457, 1.153694, 0.2901961, 0, 1, 1,
0.6052397, 2.121625, 1.127829, 0.2941177, 0, 1, 1,
0.6129986, -2.036643, 3.457813, 0.3019608, 0, 1, 1,
0.613344, 0.7421795, -0.4189855, 0.3098039, 0, 1, 1,
0.6139277, 1.644243, 0.2198244, 0.3137255, 0, 1, 1,
0.618789, -0.7329, 1.162111, 0.3215686, 0, 1, 1,
0.6218498, -1.487765, 2.482022, 0.3254902, 0, 1, 1,
0.6220336, -0.0204948, 1.70517, 0.3333333, 0, 1, 1,
0.6258903, 0.9160018, 0.6070826, 0.3372549, 0, 1, 1,
0.6260183, -0.4631514, 1.346107, 0.345098, 0, 1, 1,
0.6295203, 0.3552334, 1.58073, 0.3490196, 0, 1, 1,
0.6315167, 0.7154133, 0.4361284, 0.3568628, 0, 1, 1,
0.6363208, -1.40274, 3.371522, 0.3607843, 0, 1, 1,
0.6386954, 0.2420276, -0.7171137, 0.3686275, 0, 1, 1,
0.6462213, 0.4504024, 1.203856, 0.372549, 0, 1, 1,
0.6507975, 0.1906637, 1.620869, 0.3803922, 0, 1, 1,
0.6513017, 1.160109, 0.6023141, 0.3843137, 0, 1, 1,
0.6523261, 0.3593743, 0.8076191, 0.3921569, 0, 1, 1,
0.6531067, -1.118797, 3.214044, 0.3960784, 0, 1, 1,
0.6551285, -0.7941149, 2.39347, 0.4039216, 0, 1, 1,
0.655917, -0.1657037, 1.402773, 0.4117647, 0, 1, 1,
0.663576, -0.4366034, 2.583236, 0.4156863, 0, 1, 1,
0.6709703, -0.002921591, -0.6778772, 0.4235294, 0, 1, 1,
0.6710256, 0.7053727, 1.7339, 0.427451, 0, 1, 1,
0.6746354, -0.5529741, 3.695528, 0.4352941, 0, 1, 1,
0.6747817, 1.140894, 0.9646166, 0.4392157, 0, 1, 1,
0.6752701, -0.3389997, 1.90008, 0.4470588, 0, 1, 1,
0.6753813, -0.1599848, 0.9821113, 0.4509804, 0, 1, 1,
0.6759269, -0.2902983, 0.5086325, 0.4588235, 0, 1, 1,
0.6830941, -1.647748, 4.086372, 0.4627451, 0, 1, 1,
0.6891809, 0.05245163, 2.147259, 0.4705882, 0, 1, 1,
0.6919091, -0.8141224, 2.147577, 0.4745098, 0, 1, 1,
0.6977273, 0.3638325, 1.143565, 0.4823529, 0, 1, 1,
0.6981748, -0.1649457, -0.08510633, 0.4862745, 0, 1, 1,
0.6986583, -1.097988, 1.984725, 0.4941176, 0, 1, 1,
0.7006768, -0.4701248, 3.185204, 0.5019608, 0, 1, 1,
0.702071, -1.194953, 2.92673, 0.5058824, 0, 1, 1,
0.7110116, -1.5984, 2.194351, 0.5137255, 0, 1, 1,
0.7153569, 1.79848, -0.6337652, 0.5176471, 0, 1, 1,
0.7193558, -2.007776, 2.859719, 0.5254902, 0, 1, 1,
0.719537, 0.4519664, 0.6595101, 0.5294118, 0, 1, 1,
0.7204623, 1.114751, 0.6018383, 0.5372549, 0, 1, 1,
0.7230147, -0.4218218, 1.934039, 0.5411765, 0, 1, 1,
0.7253492, -0.1165316, 0.261812, 0.5490196, 0, 1, 1,
0.7303627, -0.8563798, 2.529397, 0.5529412, 0, 1, 1,
0.7305117, 0.004564476, -0.2673195, 0.5607843, 0, 1, 1,
0.7325103, 1.018873, -0.3259718, 0.5647059, 0, 1, 1,
0.7334814, -0.5663149, 2.706128, 0.572549, 0, 1, 1,
0.7379731, 0.1576285, 2.430373, 0.5764706, 0, 1, 1,
0.7469455, -1.281795, 2.845397, 0.5843138, 0, 1, 1,
0.7548209, 0.6084445, 0.8756038, 0.5882353, 0, 1, 1,
0.7561186, 0.8251228, 0.2319631, 0.5960785, 0, 1, 1,
0.757659, 1.303036, 0.4762953, 0.6039216, 0, 1, 1,
0.7582158, 0.2708375, 2.661602, 0.6078432, 0, 1, 1,
0.7582671, -0.4056506, 1.5461, 0.6156863, 0, 1, 1,
0.760749, 1.128797, 0.05751947, 0.6196079, 0, 1, 1,
0.7619074, -1.531039, 3.068727, 0.627451, 0, 1, 1,
0.7669979, -0.375029, 2.572852, 0.6313726, 0, 1, 1,
0.7715586, 1.570521, -0.3089657, 0.6392157, 0, 1, 1,
0.7802504, 1.171959, -0.1521614, 0.6431373, 0, 1, 1,
0.7868986, 0.1844259, 0.9441355, 0.6509804, 0, 1, 1,
0.7881557, 0.01657157, 2.140563, 0.654902, 0, 1, 1,
0.7927769, 0.728655, -0.03521861, 0.6627451, 0, 1, 1,
0.7963592, 0.7465766, 0.8562409, 0.6666667, 0, 1, 1,
0.7966316, -1.290168, 4.097506, 0.6745098, 0, 1, 1,
0.7971695, -0.9587237, 1.953491, 0.6784314, 0, 1, 1,
0.800046, -0.005392966, 0.8039373, 0.6862745, 0, 1, 1,
0.8037726, 0.4364826, 1.526765, 0.6901961, 0, 1, 1,
0.8084324, -2.106638, 3.557255, 0.6980392, 0, 1, 1,
0.8103963, -0.999272, 2.225482, 0.7058824, 0, 1, 1,
0.8114732, 1.303279, -0.1706573, 0.7098039, 0, 1, 1,
0.8193078, -1.584134, 2.748273, 0.7176471, 0, 1, 1,
0.8235183, 1.289784, 0.1238223, 0.7215686, 0, 1, 1,
0.8273075, 0.389574, -0.8449451, 0.7294118, 0, 1, 1,
0.8277394, -1.029142, 1.44079, 0.7333333, 0, 1, 1,
0.8331134, 0.6569733, 0.02565763, 0.7411765, 0, 1, 1,
0.8341982, -0.6469, 1.814716, 0.7450981, 0, 1, 1,
0.8376352, 0.3214457, 0.8460659, 0.7529412, 0, 1, 1,
0.8421192, 0.6045188, 1.076153, 0.7568628, 0, 1, 1,
0.8462752, 1.348313, 2.234332, 0.7647059, 0, 1, 1,
0.8487901, 0.4800973, 0.4614519, 0.7686275, 0, 1, 1,
0.8571566, -1.125872, 2.066163, 0.7764706, 0, 1, 1,
0.8575754, 2.164624, -0.9191884, 0.7803922, 0, 1, 1,
0.8598192, 0.6152259, 1.411219, 0.7882353, 0, 1, 1,
0.8728756, 1.377585, -0.7540595, 0.7921569, 0, 1, 1,
0.8747546, 1.552881, 1.631196, 0.8, 0, 1, 1,
0.8770817, 0.9769488, 0.6467304, 0.8078431, 0, 1, 1,
0.8829433, 0.1122754, 1.088351, 0.8117647, 0, 1, 1,
0.8839573, -0.1269969, 1.744601, 0.8196079, 0, 1, 1,
0.8858964, 0.9796405, -0.4235329, 0.8235294, 0, 1, 1,
0.8867489, -1.948232, 1.105814, 0.8313726, 0, 1, 1,
0.8913542, -0.2541845, 1.250211, 0.8352941, 0, 1, 1,
0.9071287, -0.5408281, 2.399858, 0.8431373, 0, 1, 1,
0.908025, 0.5649238, -0.7126168, 0.8470588, 0, 1, 1,
0.9162199, 0.8569824, 1.560769, 0.854902, 0, 1, 1,
0.9216095, 0.6568896, 0.1960408, 0.8588235, 0, 1, 1,
0.9230473, -0.04979059, 0.9088988, 0.8666667, 0, 1, 1,
0.9332032, 2.425034, 0.05066667, 0.8705882, 0, 1, 1,
0.9337845, -0.5658628, 2.083861, 0.8784314, 0, 1, 1,
0.9425086, 0.4281572, 1.741173, 0.8823529, 0, 1, 1,
0.9582177, -1.893339, 2.219627, 0.8901961, 0, 1, 1,
0.9585524, 0.1975038, 2.295588, 0.8941177, 0, 1, 1,
0.9613127, -1.14924, 2.531497, 0.9019608, 0, 1, 1,
0.9673874, 0.1420629, 2.182784, 0.9098039, 0, 1, 1,
0.9725186, -1.367476, 1.665294, 0.9137255, 0, 1, 1,
0.9803663, -0.1048904, 2.3518, 0.9215686, 0, 1, 1,
0.9819697, 0.5909674, 1.145456, 0.9254902, 0, 1, 1,
0.9875175, -0.1205661, 1.35832, 0.9333333, 0, 1, 1,
0.9887172, -0.380313, -0.6373961, 0.9372549, 0, 1, 1,
0.9901585, 0.9440932, -0.8643075, 0.945098, 0, 1, 1,
1.004174, -1.50519, 3.709378, 0.9490196, 0, 1, 1,
1.004486, 0.5632054, 2.447801, 0.9568627, 0, 1, 1,
1.014395, 0.3220529, 1.271205, 0.9607843, 0, 1, 1,
1.016284, 1.086093, 0.3276303, 0.9686275, 0, 1, 1,
1.024144, 0.5886853, 0.3041931, 0.972549, 0, 1, 1,
1.027837, -0.5635332, 3.413078, 0.9803922, 0, 1, 1,
1.031997, 0.4474565, 0.8096483, 0.9843137, 0, 1, 1,
1.032059, 0.1640529, 1.405361, 0.9921569, 0, 1, 1,
1.033783, -0.839571, 2.838528, 0.9960784, 0, 1, 1,
1.034765, 0.009414401, 1.116899, 1, 0, 0.9960784, 1,
1.040476, -1.27041, 2.862285, 1, 0, 0.9882353, 1,
1.044006, 0.3741799, 2.050866, 1, 0, 0.9843137, 1,
1.050815, 0.01248031, 1.034503, 1, 0, 0.9764706, 1,
1.070041, 0.8547189, 1.764561, 1, 0, 0.972549, 1,
1.071117, -0.04126947, 1.801537, 1, 0, 0.9647059, 1,
1.073243, -0.3542666, 0.7287982, 1, 0, 0.9607843, 1,
1.073329, -0.2061766, 1.989961, 1, 0, 0.9529412, 1,
1.08011, 0.4833599, 0.5509384, 1, 0, 0.9490196, 1,
1.089622, -1.80301, 2.108024, 1, 0, 0.9411765, 1,
1.089952, -0.4018812, 1.389313, 1, 0, 0.9372549, 1,
1.090925, 2.691101, -0.3546526, 1, 0, 0.9294118, 1,
1.107374, 1.814967, -0.4323659, 1, 0, 0.9254902, 1,
1.110717, -0.2621031, 1.742719, 1, 0, 0.9176471, 1,
1.110868, 1.702816, 0.2295289, 1, 0, 0.9137255, 1,
1.113497, -0.5580778, 1.30247, 1, 0, 0.9058824, 1,
1.114011, 0.7304181, 0.09773588, 1, 0, 0.9019608, 1,
1.114069, 0.5459541, 0.1287265, 1, 0, 0.8941177, 1,
1.115273, 1.175228, 0.6824083, 1, 0, 0.8862745, 1,
1.122489, 0.5749152, 2.86883, 1, 0, 0.8823529, 1,
1.124957, -0.1500134, 2.740977, 1, 0, 0.8745098, 1,
1.12532, -1.860896, 2.613502, 1, 0, 0.8705882, 1,
1.128849, -0.6710509, 1.900229, 1, 0, 0.8627451, 1,
1.130536, 0.9114943, 2.034413, 1, 0, 0.8588235, 1,
1.131571, 0.8918535, 1.548482, 1, 0, 0.8509804, 1,
1.13875, 0.1180043, 0.1037043, 1, 0, 0.8470588, 1,
1.141633, 1.51535, 1.858852, 1, 0, 0.8392157, 1,
1.14347, 1.072443, 1.592597, 1, 0, 0.8352941, 1,
1.146142, -0.2140771, 0.003932646, 1, 0, 0.827451, 1,
1.149531, -0.3768165, 1.345685, 1, 0, 0.8235294, 1,
1.15186, 0.02436272, 2.193729, 1, 0, 0.8156863, 1,
1.16437, 1.251388, 0.0843766, 1, 0, 0.8117647, 1,
1.164722, 2.00825, -0.4656765, 1, 0, 0.8039216, 1,
1.17032, -1.26459, 2.601323, 1, 0, 0.7960784, 1,
1.175362, -0.2528087, 0.1955943, 1, 0, 0.7921569, 1,
1.179879, 0.6244414, 0.4625165, 1, 0, 0.7843137, 1,
1.185915, 1.229598, -1.100032, 1, 0, 0.7803922, 1,
1.189179, 0.9496838, 1.259242, 1, 0, 0.772549, 1,
1.193248, 0.1911932, 2.390867, 1, 0, 0.7686275, 1,
1.195544, -2.565863, 4.35126, 1, 0, 0.7607843, 1,
1.195551, -0.2135399, 2.347541, 1, 0, 0.7568628, 1,
1.196501, -1.115909, 0.4926242, 1, 0, 0.7490196, 1,
1.196956, -0.769255, 2.95373, 1, 0, 0.7450981, 1,
1.197842, -2.804036, 3.322668, 1, 0, 0.7372549, 1,
1.202423, -0.2884909, 1.530009, 1, 0, 0.7333333, 1,
1.203327, 0.2932723, 1.395541, 1, 0, 0.7254902, 1,
1.203586, 1.419885, 0.9914198, 1, 0, 0.7215686, 1,
1.208767, 1.454988, -0.4190906, 1, 0, 0.7137255, 1,
1.210285, 0.05338761, 1.930131, 1, 0, 0.7098039, 1,
1.213187, -0.223252, 2.108199, 1, 0, 0.7019608, 1,
1.213265, -1.228116, 2.490721, 1, 0, 0.6941177, 1,
1.214435, -0.6210428, 1.357319, 1, 0, 0.6901961, 1,
1.227294, -1.657335, 0.4292173, 1, 0, 0.682353, 1,
1.229688, -0.03014351, 1.047501, 1, 0, 0.6784314, 1,
1.238459, 0.1249534, 2.153726, 1, 0, 0.6705883, 1,
1.243855, 1.147778, 0.7576433, 1, 0, 0.6666667, 1,
1.254471, 0.892637, 1.506132, 1, 0, 0.6588235, 1,
1.27168, -0.3197242, -0.04131448, 1, 0, 0.654902, 1,
1.273124, 0.5835667, 0.7801759, 1, 0, 0.6470588, 1,
1.273149, -0.2112524, 2.632819, 1, 0, 0.6431373, 1,
1.275591, 1.343582, 0.6228491, 1, 0, 0.6352941, 1,
1.277502, 0.1260926, 4.594126, 1, 0, 0.6313726, 1,
1.285566, -1.22631, 2.802396, 1, 0, 0.6235294, 1,
1.286535, -0.2268299, 0.9348612, 1, 0, 0.6196079, 1,
1.292734, -0.166929, 1.823998, 1, 0, 0.6117647, 1,
1.296846, -0.9933828, 3.124437, 1, 0, 0.6078432, 1,
1.340976, 2.51111, -1.780566, 1, 0, 0.6, 1,
1.342187, 0.2260538, 0.4065803, 1, 0, 0.5921569, 1,
1.356237, 2.064735, -0.3525397, 1, 0, 0.5882353, 1,
1.356565, 0.9010057, -0.9933351, 1, 0, 0.5803922, 1,
1.361587, -0.1292354, 2.028403, 1, 0, 0.5764706, 1,
1.373061, -1.152529, 0.4327167, 1, 0, 0.5686275, 1,
1.375089, -0.0471664, 0.01301459, 1, 0, 0.5647059, 1,
1.378533, 1.568669, 0.2303302, 1, 0, 0.5568628, 1,
1.38406, 0.1434003, 1.837837, 1, 0, 0.5529412, 1,
1.40415, -0.3857881, 1.678282, 1, 0, 0.5450981, 1,
1.416834, -1.173787, 1.256325, 1, 0, 0.5411765, 1,
1.417529, 1.402926, 0.9644039, 1, 0, 0.5333334, 1,
1.417951, -2.36416, 2.586194, 1, 0, 0.5294118, 1,
1.424864, -1.664815, 2.324099, 1, 0, 0.5215687, 1,
1.425948, 0.2227926, 2.944209, 1, 0, 0.5176471, 1,
1.426945, 0.195249, 1.196052, 1, 0, 0.509804, 1,
1.428672, 1.67131, -0.3265326, 1, 0, 0.5058824, 1,
1.446516, -0.1829851, 1.774479, 1, 0, 0.4980392, 1,
1.465964, -0.479122, 0.8821989, 1, 0, 0.4901961, 1,
1.468857, 0.1290529, 1.915706, 1, 0, 0.4862745, 1,
1.469469, -0.5672506, 3.482529, 1, 0, 0.4784314, 1,
1.472069, -0.7350263, 0.9676219, 1, 0, 0.4745098, 1,
1.475139, -0.4150686, 1.561815, 1, 0, 0.4666667, 1,
1.480641, 0.4088072, -0.04078923, 1, 0, 0.4627451, 1,
1.489169, 1.276957, -1.638065, 1, 0, 0.454902, 1,
1.491091, -1.454459, 2.674099, 1, 0, 0.4509804, 1,
1.496318, -0.5778583, 2.232132, 1, 0, 0.4431373, 1,
1.500965, -0.9837801, 0.7501134, 1, 0, 0.4392157, 1,
1.503182, -0.9952148, 2.386581, 1, 0, 0.4313726, 1,
1.514947, 0.1211741, 1.989658, 1, 0, 0.427451, 1,
1.52105, -0.1640966, 1.923537, 1, 0, 0.4196078, 1,
1.523932, 1.040196, 0.9048052, 1, 0, 0.4156863, 1,
1.526043, 1.876379, 2.229127, 1, 0, 0.4078431, 1,
1.530584, 0.05203066, 0.4773522, 1, 0, 0.4039216, 1,
1.535367, -2.758332, 1.8076, 1, 0, 0.3960784, 1,
1.541871, -1.322699, 3.118317, 1, 0, 0.3882353, 1,
1.54362, -1.429354, 1.957853, 1, 0, 0.3843137, 1,
1.545952, -0.8127431, 0.4174856, 1, 0, 0.3764706, 1,
1.556374, 0.4506823, 0.4600478, 1, 0, 0.372549, 1,
1.560119, 1.569863, 1.118474, 1, 0, 0.3647059, 1,
1.563378, -1.296488, 1.868514, 1, 0, 0.3607843, 1,
1.564407, 0.4774694, 2.084609, 1, 0, 0.3529412, 1,
1.576481, 1.729596, 1.128537, 1, 0, 0.3490196, 1,
1.577044, 1.036977, -0.2469236, 1, 0, 0.3411765, 1,
1.591882, 0.2241912, 1.904806, 1, 0, 0.3372549, 1,
1.596246, 1.50127, 1.117592, 1, 0, 0.3294118, 1,
1.59698, 1.017684, 0.8455159, 1, 0, 0.3254902, 1,
1.602046, -0.7025703, 3.278786, 1, 0, 0.3176471, 1,
1.602297, 2.510326, 0.920935, 1, 0, 0.3137255, 1,
1.629398, 1.246406, 1.221068, 1, 0, 0.3058824, 1,
1.638668, 0.8141034, 0.6880321, 1, 0, 0.2980392, 1,
1.659696, -0.4360663, 1.524077, 1, 0, 0.2941177, 1,
1.671956, 0.4426931, 1.345755, 1, 0, 0.2862745, 1,
1.67222, 1.772857, 1.164343, 1, 0, 0.282353, 1,
1.682923, 0.9673547, 1.377378, 1, 0, 0.2745098, 1,
1.718306, -0.1175799, -0.2809139, 1, 0, 0.2705882, 1,
1.720837, -2.462672, 0.858621, 1, 0, 0.2627451, 1,
1.746444, 0.371426, 0.9503192, 1, 0, 0.2588235, 1,
1.750078, -1.009807, 2.265642, 1, 0, 0.2509804, 1,
1.750643, 1.042357, 1.530797, 1, 0, 0.2470588, 1,
1.751725, 1.500239, 2.021616, 1, 0, 0.2392157, 1,
1.79304, 0.9814761, 0.03278928, 1, 0, 0.2352941, 1,
1.815321, 0.4452365, -0.3017316, 1, 0, 0.227451, 1,
1.829736, 0.720386, 0.2436379, 1, 0, 0.2235294, 1,
1.866704, -3.185041, 2.772518, 1, 0, 0.2156863, 1,
1.875161, 1.604713, 1.148814, 1, 0, 0.2117647, 1,
1.892078, 1.39624, 0.6204265, 1, 0, 0.2039216, 1,
1.898591, -0.1128901, 2.714488, 1, 0, 0.1960784, 1,
1.908968, -1.013204, 2.019012, 1, 0, 0.1921569, 1,
1.91158, 0.02589393, 2.144864, 1, 0, 0.1843137, 1,
1.914342, 1.509999, 2.151069, 1, 0, 0.1803922, 1,
1.938422, 0.02601788, 1.257897, 1, 0, 0.172549, 1,
1.956138, -0.7999591, 1.857598, 1, 0, 0.1686275, 1,
1.972856, 1.513098, 1.10817, 1, 0, 0.1607843, 1,
1.978926, 0.7665864, 1.449767, 1, 0, 0.1568628, 1,
1.992064, -1.600858, 2.488738, 1, 0, 0.1490196, 1,
2.010279, -0.9784024, 2.750307, 1, 0, 0.145098, 1,
2.020518, -0.5237939, 2.916359, 1, 0, 0.1372549, 1,
2.035134, -2.049121, 2.030807, 1, 0, 0.1333333, 1,
2.071276, 0.6700552, 1.389436, 1, 0, 0.1254902, 1,
2.109802, -0.5548213, 1.609351, 1, 0, 0.1215686, 1,
2.124291, 0.1198875, 1.929654, 1, 0, 0.1137255, 1,
2.125202, -0.7954187, 1.548633, 1, 0, 0.1098039, 1,
2.125602, -0.06298178, 0.06413175, 1, 0, 0.1019608, 1,
2.125634, 0.06734002, 2.87867, 1, 0, 0.09411765, 1,
2.131846, 0.7013365, 2.894674, 1, 0, 0.09019608, 1,
2.14344, -2.191171, 0.6833746, 1, 0, 0.08235294, 1,
2.211127, -1.158008, 2.373259, 1, 0, 0.07843138, 1,
2.294857, 1.131013, 1.675749, 1, 0, 0.07058824, 1,
2.308676, 0.001370552, 0.9491193, 1, 0, 0.06666667, 1,
2.341841, -1.482858, 2.441301, 1, 0, 0.05882353, 1,
2.488114, -0.9369287, 3.036186, 1, 0, 0.05490196, 1,
2.519086, 0.4780568, 2.29058, 1, 0, 0.04705882, 1,
2.519719, 0.6931146, 0.9774925, 1, 0, 0.04313726, 1,
2.529095, 0.697101, 1.542624, 1, 0, 0.03529412, 1,
2.564226, 0.78755, 0.9713604, 1, 0, 0.03137255, 1,
2.683549, -0.3450636, 1.276929, 1, 0, 0.02352941, 1,
2.745239, 0.395292, 1.993496, 1, 0, 0.01960784, 1,
2.948884, 0.7392044, 1.959421, 1, 0, 0.01176471, 1,
3.854512, 0.8405758, 1.9308, 1, 0, 0.007843138, 1
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
0.3939407, -4.24294, -7.704944, 0, -0.5, 0.5, 0.5,
0.3939407, -4.24294, -7.704944, 1, -0.5, 0.5, 0.5,
0.3939407, -4.24294, -7.704944, 1, 1.5, 0.5, 0.5,
0.3939407, -4.24294, -7.704944, 0, 1.5, 0.5, 0.5
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
-4.239764, -0.0643971, -7.704944, 0, -0.5, 0.5, 0.5,
-4.239764, -0.0643971, -7.704944, 1, -0.5, 0.5, 0.5,
-4.239764, -0.0643971, -7.704944, 1, 1.5, 0.5, 0.5,
-4.239764, -0.0643971, -7.704944, 0, 1.5, 0.5, 0.5
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
-4.239764, -4.24294, 0.1399775, 0, -0.5, 0.5, 0.5,
-4.239764, -4.24294, 0.1399775, 1, -0.5, 0.5, 0.5,
-4.239764, -4.24294, 0.1399775, 1, 1.5, 0.5, 0.5,
-4.239764, -4.24294, 0.1399775, 0, 1.5, 0.5, 0.5
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
-3, -3.278661, -5.894578,
3, -3.278661, -5.894578,
-3, -3.278661, -5.894578,
-3, -3.439374, -6.196305,
-2, -3.278661, -5.894578,
-2, -3.439374, -6.196305,
-1, -3.278661, -5.894578,
-1, -3.439374, -6.196305,
0, -3.278661, -5.894578,
0, -3.439374, -6.196305,
1, -3.278661, -5.894578,
1, -3.439374, -6.196305,
2, -3.278661, -5.894578,
2, -3.439374, -6.196305,
3, -3.278661, -5.894578,
3, -3.439374, -6.196305
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
-3, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
-3, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
-3, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
-3, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5,
-2, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
-2, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
-2, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
-2, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5,
-1, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
-1, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
-1, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
-1, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5,
0, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
0, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
0, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
0, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5,
1, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
1, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
1, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
1, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5,
2, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
2, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
2, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
2, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5,
3, -3.7608, -6.799761, 0, -0.5, 0.5, 0.5,
3, -3.7608, -6.799761, 1, -0.5, 0.5, 0.5,
3, -3.7608, -6.799761, 1, 1.5, 0.5, 0.5,
3, -3.7608, -6.799761, 0, 1.5, 0.5, 0.5
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
-3.170448, -3, -5.894578,
-3.170448, 3, -5.894578,
-3.170448, -3, -5.894578,
-3.348667, -3, -6.196305,
-3.170448, -2, -5.894578,
-3.348667, -2, -6.196305,
-3.170448, -1, -5.894578,
-3.348667, -1, -6.196305,
-3.170448, 0, -5.894578,
-3.348667, 0, -6.196305,
-3.170448, 1, -5.894578,
-3.348667, 1, -6.196305,
-3.170448, 2, -5.894578,
-3.348667, 2, -6.196305,
-3.170448, 3, -5.894578,
-3.348667, 3, -6.196305
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
-3.705106, -3, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, -3, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, -3, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, -3, -6.799761, 0, 1.5, 0.5, 0.5,
-3.705106, -2, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, -2, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, -2, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, -2, -6.799761, 0, 1.5, 0.5, 0.5,
-3.705106, -1, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, -1, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, -1, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, -1, -6.799761, 0, 1.5, 0.5, 0.5,
-3.705106, 0, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, 0, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, 0, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, 0, -6.799761, 0, 1.5, 0.5, 0.5,
-3.705106, 1, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, 1, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, 1, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, 1, -6.799761, 0, 1.5, 0.5, 0.5,
-3.705106, 2, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, 2, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, 2, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, 2, -6.799761, 0, 1.5, 0.5, 0.5,
-3.705106, 3, -6.799761, 0, -0.5, 0.5, 0.5,
-3.705106, 3, -6.799761, 1, -0.5, 0.5, 0.5,
-3.705106, 3, -6.799761, 1, 1.5, 0.5, 0.5,
-3.705106, 3, -6.799761, 0, 1.5, 0.5, 0.5
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
-3.170448, -3.278661, -4,
-3.170448, -3.278661, 4,
-3.170448, -3.278661, -4,
-3.348667, -3.439374, -4,
-3.170448, -3.278661, -2,
-3.348667, -3.439374, -2,
-3.170448, -3.278661, 0,
-3.348667, -3.439374, 0,
-3.170448, -3.278661, 2,
-3.348667, -3.439374, 2,
-3.170448, -3.278661, 4,
-3.348667, -3.439374, 4
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
-3.705106, -3.7608, -4, 0, -0.5, 0.5, 0.5,
-3.705106, -3.7608, -4, 1, -0.5, 0.5, 0.5,
-3.705106, -3.7608, -4, 1, 1.5, 0.5, 0.5,
-3.705106, -3.7608, -4, 0, 1.5, 0.5, 0.5,
-3.705106, -3.7608, -2, 0, -0.5, 0.5, 0.5,
-3.705106, -3.7608, -2, 1, -0.5, 0.5, 0.5,
-3.705106, -3.7608, -2, 1, 1.5, 0.5, 0.5,
-3.705106, -3.7608, -2, 0, 1.5, 0.5, 0.5,
-3.705106, -3.7608, 0, 0, -0.5, 0.5, 0.5,
-3.705106, -3.7608, 0, 1, -0.5, 0.5, 0.5,
-3.705106, -3.7608, 0, 1, 1.5, 0.5, 0.5,
-3.705106, -3.7608, 0, 0, 1.5, 0.5, 0.5,
-3.705106, -3.7608, 2, 0, -0.5, 0.5, 0.5,
-3.705106, -3.7608, 2, 1, -0.5, 0.5, 0.5,
-3.705106, -3.7608, 2, 1, 1.5, 0.5, 0.5,
-3.705106, -3.7608, 2, 0, 1.5, 0.5, 0.5,
-3.705106, -3.7608, 4, 0, -0.5, 0.5, 0.5,
-3.705106, -3.7608, 4, 1, -0.5, 0.5, 0.5,
-3.705106, -3.7608, 4, 1, 1.5, 0.5, 0.5,
-3.705106, -3.7608, 4, 0, 1.5, 0.5, 0.5
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
-3.170448, -3.278661, -5.894578,
-3.170448, 3.149867, -5.894578,
-3.170448, -3.278661, 6.174532,
-3.170448, 3.149867, 6.174532,
-3.170448, -3.278661, -5.894578,
-3.170448, -3.278661, 6.174532,
-3.170448, 3.149867, -5.894578,
-3.170448, 3.149867, 6.174532,
-3.170448, -3.278661, -5.894578,
3.958329, -3.278661, -5.894578,
-3.170448, -3.278661, 6.174532,
3.958329, -3.278661, 6.174532,
-3.170448, 3.149867, -5.894578,
3.958329, 3.149867, -5.894578,
-3.170448, 3.149867, 6.174532,
3.958329, 3.149867, 6.174532,
3.958329, -3.278661, -5.894578,
3.958329, 3.149867, -5.894578,
3.958329, -3.278661, 6.174532,
3.958329, 3.149867, 6.174532,
3.958329, -3.278661, -5.894578,
3.958329, -3.278661, 6.174532,
3.958329, 3.149867, -5.894578,
3.958329, 3.149867, 6.174532
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
var radius = 8.234542;
var distance = 36.63641;
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
mvMatrix.translate( -0.3939407, 0.0643971, -0.1399775 );
mvMatrix.scale( 1.248931, 1.384975, 0.7376972 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.63641);
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
cyhalofop-butyl<-read.table("cyhalofop-butyl.xyz")
```

```
## Error in read.table("cyhalofop-butyl.xyz"): no lines available in input
```

```r
x<-cyhalofop-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
```

```r
y<-cyhalofop-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
```

```r
z<-cyhalofop-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
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
-3.066631, 0.3093853, -2.544239, 0, 0, 1, 1, 1,
-2.819269, 0.6748998, -0.3059949, 1, 0, 0, 1, 1,
-2.711314, 0.3762088, 0.1274583, 1, 0, 0, 1, 1,
-2.636781, -0.9824748, -0.5810323, 1, 0, 0, 1, 1,
-2.427899, 0.7571555, -0.8674708, 1, 0, 0, 1, 1,
-2.406433, 1.647941, -0.5866291, 1, 0, 0, 1, 1,
-2.340827, 1.18385, -1.346072, 0, 0, 0, 1, 1,
-2.31345, 0.2598162, -2.440842, 0, 0, 0, 1, 1,
-2.262725, 0.4899827, -1.333831, 0, 0, 0, 1, 1,
-2.224442, -2.086482, -0.4569301, 0, 0, 0, 1, 1,
-2.213442, 0.9011458, -2.774713, 0, 0, 0, 1, 1,
-2.193082, -0.3977447, -1.025304, 0, 0, 0, 1, 1,
-2.192537, -0.6400021, -2.322124, 0, 0, 0, 1, 1,
-2.153198, -1.091533, -1.90809, 1, 1, 1, 1, 1,
-2.128711, 0.4993999, -1.663876, 1, 1, 1, 1, 1,
-2.10716, -1.877847, -4.475421, 1, 1, 1, 1, 1,
-2.051956, -0.5603898, -2.664656, 1, 1, 1, 1, 1,
-2.046858, 0.1608363, -0.2501598, 1, 1, 1, 1, 1,
-2.046773, 0.8150476, -1.538135, 1, 1, 1, 1, 1,
-2.027499, 0.5275908, -1.125727, 1, 1, 1, 1, 1,
-1.991461, -0.8379302, -2.52738, 1, 1, 1, 1, 1,
-1.949335, -2.331892, -3.274468, 1, 1, 1, 1, 1,
-1.933108, 0.2535146, -0.9769379, 1, 1, 1, 1, 1,
-1.923803, -0.3811836, -1.677376, 1, 1, 1, 1, 1,
-1.914877, 0.07332767, -0.6012978, 1, 1, 1, 1, 1,
-1.904148, 0.2848598, -0.9222656, 1, 1, 1, 1, 1,
-1.900358, 0.3101796, -0.8235841, 1, 1, 1, 1, 1,
-1.89388, 0.9844176, -1.736616, 1, 1, 1, 1, 1,
-1.869258, 0.1335269, -0.3605312, 0, 0, 1, 1, 1,
-1.866209, -1.851168, -1.157597, 1, 0, 0, 1, 1,
-1.851821, 0.3149463, -0.9653176, 1, 0, 0, 1, 1,
-1.847949, 0.9770559, -2.566624, 1, 0, 0, 1, 1,
-1.84057, -0.1568203, -2.132741, 1, 0, 0, 1, 1,
-1.835061, 0.8301442, -0.08043607, 1, 0, 0, 1, 1,
-1.831833, -0.3181879, -1.777429, 0, 0, 0, 1, 1,
-1.823532, 1.236123, -0.507722, 0, 0, 0, 1, 1,
-1.807934, 0.784471, -0.9745744, 0, 0, 0, 1, 1,
-1.787402, 1.217105, 0.5938902, 0, 0, 0, 1, 1,
-1.786595, 1.39783, 0.01604125, 0, 0, 0, 1, 1,
-1.737058, 1.473123, -1.820916, 0, 0, 0, 1, 1,
-1.714365, 1.711998, -0.7978832, 0, 0, 0, 1, 1,
-1.697912, -0.9423198, -1.628807, 1, 1, 1, 1, 1,
-1.66247, -0.1341485, -1.727587, 1, 1, 1, 1, 1,
-1.641513, -0.363367, -1.683079, 1, 1, 1, 1, 1,
-1.641261, 1.004882, 0.4579836, 1, 1, 1, 1, 1,
-1.637095, -0.5849697, -3.019658, 1, 1, 1, 1, 1,
-1.635912, -0.2171211, -0.3916959, 1, 1, 1, 1, 1,
-1.616894, 0.6679125, -1.004264, 1, 1, 1, 1, 1,
-1.611384, 0.1696767, -1.335434, 1, 1, 1, 1, 1,
-1.609986, 0.005736235, -1.425023, 1, 1, 1, 1, 1,
-1.594785, -0.6276815, -2.144274, 1, 1, 1, 1, 1,
-1.58898, -1.34868, -1.848876, 1, 1, 1, 1, 1,
-1.588556, 2.275775, 0.1497056, 1, 1, 1, 1, 1,
-1.572659, -0.6025212, -2.987865, 1, 1, 1, 1, 1,
-1.559687, -1.580899, -1.976268, 1, 1, 1, 1, 1,
-1.552209, -0.6137782, -0.4119885, 1, 1, 1, 1, 1,
-1.546075, 0.8906052, 0.1301455, 0, 0, 1, 1, 1,
-1.521756, 0.04998616, -2.529061, 1, 0, 0, 1, 1,
-1.519, 1.560599, 1.103194, 1, 0, 0, 1, 1,
-1.513054, -1.240741, -1.363405, 1, 0, 0, 1, 1,
-1.511208, 0.6850948, -2.613662, 1, 0, 0, 1, 1,
-1.507304, 0.3683235, -1.005885, 1, 0, 0, 1, 1,
-1.499902, 0.7088652, 0.2439918, 0, 0, 0, 1, 1,
-1.498934, -1.813572, 0.5858772, 0, 0, 0, 1, 1,
-1.497509, 0.2617596, -3.831991, 0, 0, 0, 1, 1,
-1.47992, 0.9169462, -0.3620712, 0, 0, 0, 1, 1,
-1.47175, -0.247201, -3.015754, 0, 0, 0, 1, 1,
-1.465203, 1.802655, -0.9082596, 0, 0, 0, 1, 1,
-1.45645, 1.598614, -0.1131451, 0, 0, 0, 1, 1,
-1.449317, 0.5882432, -1.611933, 1, 1, 1, 1, 1,
-1.438262, 1.714093, 1.42662, 1, 1, 1, 1, 1,
-1.429171, 1.349606, -1.282483, 1, 1, 1, 1, 1,
-1.422672, -0.3023314, -2.351801, 1, 1, 1, 1, 1,
-1.419605, -0.4918992, -0.4210927, 1, 1, 1, 1, 1,
-1.406992, 1.411428, 0.6108567, 1, 1, 1, 1, 1,
-1.404399, -0.6501423, -2.461669, 1, 1, 1, 1, 1,
-1.397624, 0.2071697, -0.794719, 1, 1, 1, 1, 1,
-1.390122, 0.8103951, 0.5462753, 1, 1, 1, 1, 1,
-1.370482, -1.062449, -2.972715, 1, 1, 1, 1, 1,
-1.365645, 0.5647328, -1.055258, 1, 1, 1, 1, 1,
-1.361297, -2.019895, -1.883944, 1, 1, 1, 1, 1,
-1.360445, 0.8945984, -2.932932, 1, 1, 1, 1, 1,
-1.348291, 1.046147, -1.924685, 1, 1, 1, 1, 1,
-1.33388, -1.859675, -3.340131, 1, 1, 1, 1, 1,
-1.31831, 1.287817, -1.43081, 0, 0, 1, 1, 1,
-1.317836, 0.1668933, -2.197217, 1, 0, 0, 1, 1,
-1.31504, -0.4555431, -1.161939, 1, 0, 0, 1, 1,
-1.299024, -0.8888798, -1.341195, 1, 0, 0, 1, 1,
-1.296734, 0.8785136, -0.9476658, 1, 0, 0, 1, 1,
-1.294689, -0.6633474, -2.472608, 1, 0, 0, 1, 1,
-1.289999, 1.035254, -0.9921457, 0, 0, 0, 1, 1,
-1.288263, -0.2420871, -1.457793, 0, 0, 0, 1, 1,
-1.281225, -0.4289368, -2.475498, 0, 0, 0, 1, 1,
-1.275652, 0.0551214, -1.467309, 0, 0, 0, 1, 1,
-1.26978, 1.818827, -2.835578, 0, 0, 0, 1, 1,
-1.265967, -0.2132681, -1.422854, 0, 0, 0, 1, 1,
-1.263204, 0.9050021, -0.1663868, 0, 0, 0, 1, 1,
-1.258094, -0.05266609, -1.820813, 1, 1, 1, 1, 1,
-1.257047, 0.2269721, 0.8258693, 1, 1, 1, 1, 1,
-1.253939, -0.03719333, -0.9811344, 1, 1, 1, 1, 1,
-1.247651, -0.2194422, -1.456384, 1, 1, 1, 1, 1,
-1.234639, 0.6450276, 0.9901347, 1, 1, 1, 1, 1,
-1.234158, -1.072755, -2.930438, 1, 1, 1, 1, 1,
-1.222105, 2.11386, -2.548303, 1, 1, 1, 1, 1,
-1.21672, -0.8456745, -2.755549, 1, 1, 1, 1, 1,
-1.216294, -0.656714, -0.7352218, 1, 1, 1, 1, 1,
-1.215558, -0.5852489, -3.757916, 1, 1, 1, 1, 1,
-1.212845, 0.2758766, -0.3754501, 1, 1, 1, 1, 1,
-1.209942, -0.1759325, -3.622541, 1, 1, 1, 1, 1,
-1.209223, -1.086551, -3.105532, 1, 1, 1, 1, 1,
-1.204268, 0.003586236, -3.39283, 1, 1, 1, 1, 1,
-1.200875, 0.03672154, -1.646929, 1, 1, 1, 1, 1,
-1.171615, -0.6285495, -0.6781109, 0, 0, 1, 1, 1,
-1.164746, 0.8045132, 0.4782693, 1, 0, 0, 1, 1,
-1.153227, -1.034608, -3.241628, 1, 0, 0, 1, 1,
-1.152723, -1.296897, -3.225742, 1, 0, 0, 1, 1,
-1.144819, -0.4701943, -3.407093, 1, 0, 0, 1, 1,
-1.122586, 0.0306053, -1.806703, 1, 0, 0, 1, 1,
-1.119769, 1.396226, -1.868039, 0, 0, 0, 1, 1,
-1.113308, 0.980683, -0.341395, 0, 0, 0, 1, 1,
-1.110372, -0.3570784, -3.123194, 0, 0, 0, 1, 1,
-1.103718, 0.6957976, -0.5887271, 0, 0, 0, 1, 1,
-1.0998, -0.6594837, -4.192948, 0, 0, 0, 1, 1,
-1.097975, 0.4414585, -0.7936119, 0, 0, 0, 1, 1,
-1.097156, -0.2641674, -0.3498299, 0, 0, 0, 1, 1,
-1.091165, -1.250062, -0.6615803, 1, 1, 1, 1, 1,
-1.087815, -0.3983216, 0.2939088, 1, 1, 1, 1, 1,
-1.084824, 3.056247, 3.942892, 1, 1, 1, 1, 1,
-1.082473, 0.309277, -1.312396, 1, 1, 1, 1, 1,
-1.078482, 0.9346164, -0.4082909, 1, 1, 1, 1, 1,
-1.07471, -1.555842, -3.292886, 1, 1, 1, 1, 1,
-1.073974, -0.8209522, -1.034057, 1, 1, 1, 1, 1,
-1.072767, 1.747659, -0.6108908, 1, 1, 1, 1, 1,
-1.07218, -0.9556162, -2.24099, 1, 1, 1, 1, 1,
-1.071235, 1.081856, -2.029321, 1, 1, 1, 1, 1,
-1.064461, 0.3688769, -1.121837, 1, 1, 1, 1, 1,
-1.061248, -0.7022143, -3.21021, 1, 1, 1, 1, 1,
-1.055235, -0.3748515, -2.609662, 1, 1, 1, 1, 1,
-1.05505, -0.4659975, -3.742754, 1, 1, 1, 1, 1,
-1.052531, 1.352565, -2.135609, 1, 1, 1, 1, 1,
-1.050463, 0.59986, -2.193307, 0, 0, 1, 1, 1,
-1.045991, 0.0416867, -1.67819, 1, 0, 0, 1, 1,
-1.041673, 0.8176755, -1.191466, 1, 0, 0, 1, 1,
-1.038869, -0.5132898, -4.227287, 1, 0, 0, 1, 1,
-1.038224, 1.456648, 0.8356957, 1, 0, 0, 1, 1,
-1.032227, -2.413502, -0.8434488, 1, 0, 0, 1, 1,
-1.027922, 0.5556287, -0.7247804, 0, 0, 0, 1, 1,
-1.024422, -0.5705488, -1.424193, 0, 0, 0, 1, 1,
-1.023498, -1.884099, -2.544157, 0, 0, 0, 1, 1,
-1.01289, 1.093306, -0.2115077, 0, 0, 0, 1, 1,
-0.9942033, -0.6487719, -2.673268, 0, 0, 0, 1, 1,
-0.9940326, -0.3324989, -1.90244, 0, 0, 0, 1, 1,
-0.9908501, 0.1019291, -2.311814, 0, 0, 0, 1, 1,
-0.9901458, -0.9999382, -1.320303, 1, 1, 1, 1, 1,
-0.9873856, -0.8911511, -1.766251, 1, 1, 1, 1, 1,
-0.9865425, -0.7801064, -0.8360712, 1, 1, 1, 1, 1,
-0.9839363, 0.4659933, -1.245843, 1, 1, 1, 1, 1,
-0.9817165, 0.3240741, -2.830847, 1, 1, 1, 1, 1,
-0.9809645, 0.3303572, -2.377372, 1, 1, 1, 1, 1,
-0.9779066, -0.337248, -1.363091, 1, 1, 1, 1, 1,
-0.9751223, -0.5068276, -1.86281, 1, 1, 1, 1, 1,
-0.971602, 0.0409212, 0.2015186, 1, 1, 1, 1, 1,
-0.9688613, 0.1914031, -0.6695296, 1, 1, 1, 1, 1,
-0.9663009, 1.066239, -0.9571651, 1, 1, 1, 1, 1,
-0.9660431, -0.3659014, -1.456323, 1, 1, 1, 1, 1,
-0.9622849, -0.6056288, -1.157861, 1, 1, 1, 1, 1,
-0.9605219, -0.4202298, -2.551679, 1, 1, 1, 1, 1,
-0.9600412, 0.1406052, -3.287122, 1, 1, 1, 1, 1,
-0.9578678, -1.324407, -1.4428, 0, 0, 1, 1, 1,
-0.9378523, -1.525555, -2.654505, 1, 0, 0, 1, 1,
-0.9356595, 1.026156, -0.6644472, 1, 0, 0, 1, 1,
-0.9332348, 0.5902197, 0.2278692, 1, 0, 0, 1, 1,
-0.9298489, 0.06947397, -2.489104, 1, 0, 0, 1, 1,
-0.9248019, -1.292525, -1.526942, 1, 0, 0, 1, 1,
-0.9228711, 1.151197, -1.511423, 0, 0, 0, 1, 1,
-0.921829, 1.602787, -2.750931, 0, 0, 0, 1, 1,
-0.9173361, -0.6351698, -0.7675323, 0, 0, 0, 1, 1,
-0.9148677, -0.2359648, -1.454773, 0, 0, 0, 1, 1,
-0.9118204, -0.2056315, -1.19307, 0, 0, 0, 1, 1,
-0.9012294, 0.5303347, -1.414108, 0, 0, 0, 1, 1,
-0.8939225, -1.881109, -2.947891, 0, 0, 0, 1, 1,
-0.8916112, 0.6342447, -0.9850938, 1, 1, 1, 1, 1,
-0.8905451, 1.128764, -0.3391186, 1, 1, 1, 1, 1,
-0.8904471, 0.1968619, -0.5292087, 1, 1, 1, 1, 1,
-0.8888346, 1.252239, -1.3326, 1, 1, 1, 1, 1,
-0.8844835, -1.808656, -3.820278, 1, 1, 1, 1, 1,
-0.8832431, -0.5489707, -2.472224, 1, 1, 1, 1, 1,
-0.8803036, 0.7088927, -0.325214, 1, 1, 1, 1, 1,
-0.87815, 0.5843595, -1.118001, 1, 1, 1, 1, 1,
-0.872184, -0.9616145, -2.016802, 1, 1, 1, 1, 1,
-0.8502266, 0.2312699, -2.286363, 1, 1, 1, 1, 1,
-0.8485613, 0.4285906, -0.3857862, 1, 1, 1, 1, 1,
-0.8436613, -0.6532151, -1.933838, 1, 1, 1, 1, 1,
-0.8429274, 0.9466802, -1.132919, 1, 1, 1, 1, 1,
-0.8429269, 0.3838432, -0.4870152, 1, 1, 1, 1, 1,
-0.8355331, -0.999521, -3.470742, 1, 1, 1, 1, 1,
-0.8329764, -0.3972924, -2.042459, 0, 0, 1, 1, 1,
-0.8312461, -1.140106, -3.22228, 1, 0, 0, 1, 1,
-0.8293875, -0.2903647, -0.5013104, 1, 0, 0, 1, 1,
-0.8283213, 0.3173341, -1.09113, 1, 0, 0, 1, 1,
-0.8282716, 0.9484984, -3.109223, 1, 0, 0, 1, 1,
-0.8252267, -1.703419, -2.715221, 1, 0, 0, 1, 1,
-0.8214627, -0.8285303, -3.423684, 0, 0, 0, 1, 1,
-0.8207147, -1.981967, -3.762902, 0, 0, 0, 1, 1,
-0.8072689, 0.8188817, 0.7811024, 0, 0, 0, 1, 1,
-0.8066097, 1.206991, -0.1920167, 0, 0, 0, 1, 1,
-0.8005582, 1.14117, -0.2111255, 0, 0, 0, 1, 1,
-0.7979448, -0.1600185, -2.437753, 0, 0, 0, 1, 1,
-0.7979082, -0.6555712, -1.529573, 0, 0, 0, 1, 1,
-0.7962468, -1.585307, -1.722068, 1, 1, 1, 1, 1,
-0.7947178, -0.4454375, -2.871387, 1, 1, 1, 1, 1,
-0.7852094, -0.3663707, -2.545922, 1, 1, 1, 1, 1,
-0.7802263, -0.1402876, -3.155252, 1, 1, 1, 1, 1,
-0.768939, -0.1496484, -3.089086, 1, 1, 1, 1, 1,
-0.7673719, -0.9292579, -0.968326, 1, 1, 1, 1, 1,
-0.7560751, 0.598209, -2.29769, 1, 1, 1, 1, 1,
-0.7457051, 0.4104174, -0.9535564, 1, 1, 1, 1, 1,
-0.7437153, -1.245212, -3.501926, 1, 1, 1, 1, 1,
-0.7375766, -1.210718, -1.485985, 1, 1, 1, 1, 1,
-0.7311466, 0.2259558, -2.5256, 1, 1, 1, 1, 1,
-0.7197827, -0.3586201, -1.554954, 1, 1, 1, 1, 1,
-0.7095806, 0.1242724, -1.717288, 1, 1, 1, 1, 1,
-0.7067661, 1.277834, -1.01543, 1, 1, 1, 1, 1,
-0.7026911, 0.06791355, -1.166716, 1, 1, 1, 1, 1,
-0.6994588, -1.983902, -2.86507, 0, 0, 1, 1, 1,
-0.6986166, -0.553342, -1.669748, 1, 0, 0, 1, 1,
-0.6980949, 0.8937966, 0.341776, 1, 0, 0, 1, 1,
-0.6970835, -1.242967, -2.507012, 1, 0, 0, 1, 1,
-0.6942741, -1.541197, -3.572572, 1, 0, 0, 1, 1,
-0.6926988, 1.68201, 1.019775, 1, 0, 0, 1, 1,
-0.6921408, -0.5440708, -0.9774951, 0, 0, 0, 1, 1,
-0.6849645, -0.42201, -0.2622694, 0, 0, 0, 1, 1,
-0.6848637, 1.253032, -1.710734, 0, 0, 0, 1, 1,
-0.6835195, 0.7178454, -1.343181, 0, 0, 0, 1, 1,
-0.6834462, -0.1870335, -1.19875, 0, 0, 0, 1, 1,
-0.6833071, -0.3602544, -0.8877485, 0, 0, 0, 1, 1,
-0.6760271, 0.8244705, -1.893876, 0, 0, 0, 1, 1,
-0.6754577, -0.502203, -2.181074, 1, 1, 1, 1, 1,
-0.6739764, 1.488978, -2.278565, 1, 1, 1, 1, 1,
-0.6730678, 0.9458595, -0.4674657, 1, 1, 1, 1, 1,
-0.6730545, -0.7863634, -1.604979, 1, 1, 1, 1, 1,
-0.6675906, 1.738762, 0.1627517, 1, 1, 1, 1, 1,
-0.6662695, 1.798826, -0.6634066, 1, 1, 1, 1, 1,
-0.6651543, 2.114805, 0.03578402, 1, 1, 1, 1, 1,
-0.6633819, -0.3216245, -0.588025, 1, 1, 1, 1, 1,
-0.6627241, -1.183591, -2.821801, 1, 1, 1, 1, 1,
-0.6590014, -0.04534823, -0.7299004, 1, 1, 1, 1, 1,
-0.6589134, -1.622739, -2.221283, 1, 1, 1, 1, 1,
-0.6576697, 0.03043792, -1.983958, 1, 1, 1, 1, 1,
-0.6571553, -1.057686, -1.917251, 1, 1, 1, 1, 1,
-0.655476, -0.2488741, -2.038093, 1, 1, 1, 1, 1,
-0.6532806, 0.02376311, -2.322226, 1, 1, 1, 1, 1,
-0.6480899, 0.7827702, -1.987636, 0, 0, 1, 1, 1,
-0.6463887, -0.6985081, -3.33621, 1, 0, 0, 1, 1,
-0.6458429, -0.7495799, -3.99228, 1, 0, 0, 1, 1,
-0.6438795, -1.031649, -4.29443, 1, 0, 0, 1, 1,
-0.6396192, 1.155458, -0.1206107, 1, 0, 0, 1, 1,
-0.6382952, -1.507492, -2.256605, 1, 0, 0, 1, 1,
-0.6378467, 0.3574914, -0.06818213, 0, 0, 0, 1, 1,
-0.6375464, -0.03291612, -0.8750489, 0, 0, 0, 1, 1,
-0.6354462, -1.606133, -2.540078, 0, 0, 0, 1, 1,
-0.6249256, -0.3576137, -1.416189, 0, 0, 0, 1, 1,
-0.6162106, -1.092843, -1.470522, 0, 0, 0, 1, 1,
-0.6112879, 0.8404078, -0.2793775, 0, 0, 0, 1, 1,
-0.606059, 1.050719, -0.04042065, 0, 0, 0, 1, 1,
-0.6039197, 0.2430574, 0.2427514, 1, 1, 1, 1, 1,
-0.5976035, 1.659833, -0.5817019, 1, 1, 1, 1, 1,
-0.597308, -0.7981114, -3.077807, 1, 1, 1, 1, 1,
-0.5932674, 0.3035511, -0.932342, 1, 1, 1, 1, 1,
-0.5923446, -0.9901152, -1.988697, 1, 1, 1, 1, 1,
-0.5921344, -1.090344, -3.585709, 1, 1, 1, 1, 1,
-0.5908151, 0.5829914, -1.086827, 1, 1, 1, 1, 1,
-0.5887257, 0.7640439, -0.4603549, 1, 1, 1, 1, 1,
-0.5836029, -0.1581519, -1.443222, 1, 1, 1, 1, 1,
-0.5774974, 1.369239, -0.6711189, 1, 1, 1, 1, 1,
-0.5753589, -1.076325, -2.783914, 1, 1, 1, 1, 1,
-0.5736916, 0.2892959, -2.081716, 1, 1, 1, 1, 1,
-0.5726705, 0.2683007, -2.44521, 1, 1, 1, 1, 1,
-0.5716527, 1.460032, 1.654399, 1, 1, 1, 1, 1,
-0.569522, 0.8847875, -0.8063374, 1, 1, 1, 1, 1,
-0.5694354, -0.0544402, -2.219669, 0, 0, 1, 1, 1,
-0.5607363, 2.600549, -0.7840238, 1, 0, 0, 1, 1,
-0.556917, -0.255143, -1.743457, 1, 0, 0, 1, 1,
-0.5544947, -0.1523195, 0.4991345, 1, 0, 0, 1, 1,
-0.5530919, 2.010483, 1.041853, 1, 0, 0, 1, 1,
-0.5518365, -1.484673, -3.815367, 1, 0, 0, 1, 1,
-0.5503513, 0.823991, -0.1892219, 0, 0, 0, 1, 1,
-0.5493186, -1.6077, -2.960947, 0, 0, 0, 1, 1,
-0.5436323, -0.7575586, -2.159727, 0, 0, 0, 1, 1,
-0.5388686, 0.1824117, -1.566904, 0, 0, 0, 1, 1,
-0.5347149, -0.7701305, -3.264373, 0, 0, 0, 1, 1,
-0.527413, -0.7539136, -3.344171, 0, 0, 0, 1, 1,
-0.5233995, -0.7319711, -2.512919, 0, 0, 0, 1, 1,
-0.5232091, -0.1297294, -1.191584, 1, 1, 1, 1, 1,
-0.5216759, -0.2543479, -1.085238, 1, 1, 1, 1, 1,
-0.5212871, -0.02410946, -1.707429, 1, 1, 1, 1, 1,
-0.5209635, 0.1854624, -1.735979, 1, 1, 1, 1, 1,
-0.5148756, -1.79044, -3.995276, 1, 1, 1, 1, 1,
-0.5146727, 0.3869631, -0.1422865, 1, 1, 1, 1, 1,
-0.5106138, -1.920498, -2.188286, 1, 1, 1, 1, 1,
-0.50998, 0.536426, -2.223835, 1, 1, 1, 1, 1,
-0.5013429, -0.6865041, -1.411893, 1, 1, 1, 1, 1,
-0.500847, 0.05637148, -2.511555, 1, 1, 1, 1, 1,
-0.4986061, -1.790264, -1.756116, 1, 1, 1, 1, 1,
-0.4942924, -2.072456, -3.089925, 1, 1, 1, 1, 1,
-0.4938805, -0.5160886, -2.693249, 1, 1, 1, 1, 1,
-0.4893005, -1.545925, -3.773557, 1, 1, 1, 1, 1,
-0.487227, -1.0852, -1.972783, 1, 1, 1, 1, 1,
-0.4864456, 0.8375801, -0.5831363, 0, 0, 1, 1, 1,
-0.4862956, -0.649677, -3.301219, 1, 0, 0, 1, 1,
-0.4861, -1.596557, -2.406101, 1, 0, 0, 1, 1,
-0.4847761, -0.4672092, -0.9936384, 1, 0, 0, 1, 1,
-0.4822858, 2.273788, -1.913613, 1, 0, 0, 1, 1,
-0.4797692, -0.7631302, -3.059227, 1, 0, 0, 1, 1,
-0.4788414, 0.7974699, -0.6675676, 0, 0, 0, 1, 1,
-0.4787618, -1.132839, -1.537138, 0, 0, 0, 1, 1,
-0.4736635, -0.8382147, -3.6031, 0, 0, 0, 1, 1,
-0.4694246, 0.09937957, -1.373524, 0, 0, 0, 1, 1,
-0.468097, 0.8465809, -0.5956864, 0, 0, 0, 1, 1,
-0.4679255, 0.4043035, -0.9800782, 0, 0, 0, 1, 1,
-0.4647566, -0.3798243, -3.247823, 0, 0, 0, 1, 1,
-0.460051, -0.5100341, -4.153245, 1, 1, 1, 1, 1,
-0.4594048, -1.942784, -1.460357, 1, 1, 1, 1, 1,
-0.4533769, 0.8670459, -1.540049, 1, 1, 1, 1, 1,
-0.451306, 0.9730749, -1.421207, 1, 1, 1, 1, 1,
-0.4489695, 0.943007, 0.4303027, 1, 1, 1, 1, 1,
-0.4459969, 0.5828005, -0.8564356, 1, 1, 1, 1, 1,
-0.4457105, 0.1152871, -0.4428609, 1, 1, 1, 1, 1,
-0.4415397, 0.747063, 1.097075, 1, 1, 1, 1, 1,
-0.4402413, -0.07409537, -1.144748, 1, 1, 1, 1, 1,
-0.4390802, 0.3480235, -0.1793855, 1, 1, 1, 1, 1,
-0.4350183, 1.026608, -0.3225278, 1, 1, 1, 1, 1,
-0.4308354, 0.7770452, -1.153472, 1, 1, 1, 1, 1,
-0.430235, -0.3517114, -2.650867, 1, 1, 1, 1, 1,
-0.4261222, -2.456766, -1.639166, 1, 1, 1, 1, 1,
-0.4204369, -0.07614796, -1.350515, 1, 1, 1, 1, 1,
-0.4133134, -0.4955172, -3.319084, 0, 0, 1, 1, 1,
-0.4124827, -1.874052, -2.943647, 1, 0, 0, 1, 1,
-0.4106189, -0.02138258, -0.8843273, 1, 0, 0, 1, 1,
-0.4100277, -1.273517, -2.955667, 1, 0, 0, 1, 1,
-0.4073694, -0.4490592, -2.794287, 1, 0, 0, 1, 1,
-0.4020915, -1.46874, -3.637842, 1, 0, 0, 1, 1,
-0.39947, 1.075725, -2.072992, 0, 0, 0, 1, 1,
-0.3960952, -1.603068, -2.05218, 0, 0, 0, 1, 1,
-0.3948284, -1.017986, -4.162518, 0, 0, 0, 1, 1,
-0.3913219, -1.063165, -3.113805, 0, 0, 0, 1, 1,
-0.3868486, 0.1998602, -1.561896, 0, 0, 0, 1, 1,
-0.3867267, -0.343913, -2.264078, 0, 0, 0, 1, 1,
-0.3796693, 0.1376394, -0.7888572, 0, 0, 0, 1, 1,
-0.3737269, 0.928197, -0.9801942, 1, 1, 1, 1, 1,
-0.3699699, -0.2182533, -2.537707, 1, 1, 1, 1, 1,
-0.3680879, 0.595665, 0.06394178, 1, 1, 1, 1, 1,
-0.3674721, -0.9718862, -3.919021, 1, 1, 1, 1, 1,
-0.3663899, 1.331109, 0.03958673, 1, 1, 1, 1, 1,
-0.3662924, 1.321912, -0.591159, 1, 1, 1, 1, 1,
-0.3647214, 0.275791, -2.49377, 1, 1, 1, 1, 1,
-0.3641309, 1.290207, -0.1540147, 1, 1, 1, 1, 1,
-0.3631695, 0.1992375, -0.3970691, 1, 1, 1, 1, 1,
-0.3618446, 0.6179268, 0.04439969, 1, 1, 1, 1, 1,
-0.3599086, 0.8776081, 0.1548188, 1, 1, 1, 1, 1,
-0.3598994, -1.355889, -3.315613, 1, 1, 1, 1, 1,
-0.3534223, 0.5170462, 2.459244, 1, 1, 1, 1, 1,
-0.3501632, 0.1886963, -1.099513, 1, 1, 1, 1, 1,
-0.3485764, 0.1149783, -1.999235, 1, 1, 1, 1, 1,
-0.3470173, 0.3361937, -0.6945175, 0, 0, 1, 1, 1,
-0.3460436, -0.01829774, -0.2600895, 1, 0, 0, 1, 1,
-0.3362376, 0.07505408, -0.7472905, 1, 0, 0, 1, 1,
-0.3317558, -0.5060984, -2.099328, 1, 0, 0, 1, 1,
-0.3233098, 1.240303, 0.1853781, 1, 0, 0, 1, 1,
-0.3186147, -1.938556, -4.044044, 1, 0, 0, 1, 1,
-0.3171438, 1.109752, -0.3602196, 0, 0, 0, 1, 1,
-0.3157192, -1.199535, -2.731654, 0, 0, 0, 1, 1,
-0.3133203, 1.029859, -1.821311, 0, 0, 0, 1, 1,
-0.3130141, -0.5480754, -2.117506, 0, 0, 0, 1, 1,
-0.3115248, 0.6234526, -0.6639808, 0, 0, 0, 1, 1,
-0.3087464, 0.3530392, -1.291353, 0, 0, 0, 1, 1,
-0.3066017, -1.528158, -2.788033, 0, 0, 0, 1, 1,
-0.3044018, -2.546554, -3.117006, 1, 1, 1, 1, 1,
-0.3036754, -0.9352241, -3.910545, 1, 1, 1, 1, 1,
-0.2965662, 2.139005, -0.7522199, 1, 1, 1, 1, 1,
-0.2962578, -0.310222, -2.114253, 1, 1, 1, 1, 1,
-0.2935204, 2.678669, 1.519186, 1, 1, 1, 1, 1,
-0.2925033, -0.514367, -3.547872, 1, 1, 1, 1, 1,
-0.2846892, -0.8878409, -3.819499, 1, 1, 1, 1, 1,
-0.2831757, -0.3645987, -2.24109, 1, 1, 1, 1, 1,
-0.2814329, -1.221476, -2.947363, 1, 1, 1, 1, 1,
-0.2793713, 0.2334572, -0.5737914, 1, 1, 1, 1, 1,
-0.2792087, 0.08111574, -1.496654, 1, 1, 1, 1, 1,
-0.27539, 1.557782, -0.4890571, 1, 1, 1, 1, 1,
-0.275067, 0.8914747, 1.35446, 1, 1, 1, 1, 1,
-0.2670736, 0.331969, 1.223551, 1, 1, 1, 1, 1,
-0.2666874, 0.4899042, -1.241946, 1, 1, 1, 1, 1,
-0.2623467, 0.2798453, -1.840978, 0, 0, 1, 1, 1,
-0.2608354, -1.214381, -3.977831, 1, 0, 0, 1, 1,
-0.2591408, 1.535514, -0.442718, 1, 0, 0, 1, 1,
-0.2530625, 0.2121877, -1.853507, 1, 0, 0, 1, 1,
-0.2450859, 1.789188, -0.3293814, 1, 0, 0, 1, 1,
-0.241292, -0.4238665, -3.429459, 1, 0, 0, 1, 1,
-0.2406841, -2.117447, -3.272213, 0, 0, 0, 1, 1,
-0.2405037, -2.355719, -2.046491, 0, 0, 0, 1, 1,
-0.2401229, 0.7821238, -1.818042, 0, 0, 0, 1, 1,
-0.2358582, 1.21072, 0.5055116, 0, 0, 0, 1, 1,
-0.2338072, -0.3875359, -3.379888, 0, 0, 0, 1, 1,
-0.2287347, -0.128061, -1.479113, 0, 0, 0, 1, 1,
-0.2244014, 1.978096, -1.565732, 0, 0, 0, 1, 1,
-0.2226006, 1.139356, 0.8966963, 1, 1, 1, 1, 1,
-0.2214788, 0.82952, 0.493568, 1, 1, 1, 1, 1,
-0.2170924, 1.0611, 0.8839882, 1, 1, 1, 1, 1,
-0.2153843, 0.2828422, -0.4115101, 1, 1, 1, 1, 1,
-0.2150243, 0.1954997, -1.744911, 1, 1, 1, 1, 1,
-0.2141444, -2.179535, -2.939728, 1, 1, 1, 1, 1,
-0.2141088, 0.9009193, -0.1078969, 1, 1, 1, 1, 1,
-0.2138519, 0.3632967, -0.2741225, 1, 1, 1, 1, 1,
-0.2012712, 0.8248048, 0.4191776, 1, 1, 1, 1, 1,
-0.1990642, 0.6324338, 0.3733935, 1, 1, 1, 1, 1,
-0.1976187, 1.254052, -1.979226, 1, 1, 1, 1, 1,
-0.1933202, -0.0725574, -1.355302, 1, 1, 1, 1, 1,
-0.190382, 0.8305854, -0.963078, 1, 1, 1, 1, 1,
-0.1892309, 1.37699, -1.352985, 1, 1, 1, 1, 1,
-0.1889921, -0.7184567, -1.519314, 1, 1, 1, 1, 1,
-0.1855727, -0.7047517, -2.266966, 0, 0, 1, 1, 1,
-0.1830049, -1.152421, -2.341892, 1, 0, 0, 1, 1,
-0.1824871, -0.6083155, -4.074186, 1, 0, 0, 1, 1,
-0.1782139, 0.1609261, -0.1787941, 1, 0, 0, 1, 1,
-0.1728725, -1.270662, -2.198811, 1, 0, 0, 1, 1,
-0.1696656, -2.032498, -2.452015, 1, 0, 0, 1, 1,
-0.168936, -0.01502236, -2.276731, 0, 0, 0, 1, 1,
-0.1650527, 0.9953539, -1.085197, 0, 0, 0, 1, 1,
-0.1646021, -0.7272478, -4.94079, 0, 0, 0, 1, 1,
-0.1641227, -0.4602121, -3.41445, 0, 0, 0, 1, 1,
-0.1631568, -0.7369095, -2.668183, 0, 0, 0, 1, 1,
-0.1628033, -0.7312533, -3.756904, 0, 0, 0, 1, 1,
-0.1606199, -2.462991, -3.73045, 0, 0, 0, 1, 1,
-0.1593149, -0.2671573, -2.669188, 1, 1, 1, 1, 1,
-0.1588875, 2.198921, -0.3421168, 1, 1, 1, 1, 1,
-0.1553004, -1.426833, -3.305215, 1, 1, 1, 1, 1,
-0.1515781, 0.5697336, -0.7662152, 1, 1, 1, 1, 1,
-0.151337, -0.9431091, -3.636276, 1, 1, 1, 1, 1,
-0.1509951, 0.6507627, -2.731532, 1, 1, 1, 1, 1,
-0.1506491, 0.3625875, -0.8034723, 1, 1, 1, 1, 1,
-0.1466307, -0.2320408, -4.093598, 1, 1, 1, 1, 1,
-0.1379711, -1.287336, -4.234583, 1, 1, 1, 1, 1,
-0.13787, -1.164302, -4.062738, 1, 1, 1, 1, 1,
-0.1367097, 0.6011641, 0.7178195, 1, 1, 1, 1, 1,
-0.1356142, -1.539152, -1.34883, 1, 1, 1, 1, 1,
-0.1354919, 0.3176013, -0.6288803, 1, 1, 1, 1, 1,
-0.1352528, 0.132494, -1.714461, 1, 1, 1, 1, 1,
-0.133535, 0.3951685, -0.9822634, 1, 1, 1, 1, 1,
-0.1311687, 0.7738082, -0.1946932, 0, 0, 1, 1, 1,
-0.1297149, -1.117071, -2.345405, 1, 0, 0, 1, 1,
-0.1275607, -0.2459513, -1.969234, 1, 0, 0, 1, 1,
-0.1271172, -0.3710243, -2.902742, 1, 0, 0, 1, 1,
-0.1243741, -0.8356188, -2.628862, 1, 0, 0, 1, 1,
-0.1173524, 0.2295226, -0.2245994, 1, 0, 0, 1, 1,
-0.1172349, -0.7420442, -0.0785372, 0, 0, 0, 1, 1,
-0.1159616, 1.581912, -1.240528, 0, 0, 0, 1, 1,
-0.1077544, 0.803226, -1.399553, 0, 0, 0, 1, 1,
-0.1067885, 0.9783154, 0.41217, 0, 0, 0, 1, 1,
-0.1017082, -0.2400467, -4.093039, 0, 0, 0, 1, 1,
-0.1014459, 1.521569, 0.3776352, 0, 0, 0, 1, 1,
-0.1014066, -0.2725683, -2.900738, 0, 0, 0, 1, 1,
-0.1002926, -0.7230307, -2.616992, 1, 1, 1, 1, 1,
-0.09888277, -0.7557679, -4.615826, 1, 1, 1, 1, 1,
-0.09551306, 1.814376, 0.5180063, 1, 1, 1, 1, 1,
-0.09073267, 1.558795, 0.1180242, 1, 1, 1, 1, 1,
-0.08473696, 1.983703, 0.4159405, 1, 1, 1, 1, 1,
-0.08271623, 0.4450455, 0.05225657, 1, 1, 1, 1, 1,
-0.07982321, -0.2605518, -3.089813, 1, 1, 1, 1, 1,
-0.07646706, 0.509207, -1.479577, 1, 1, 1, 1, 1,
-0.07056443, -2.726628, -3.109585, 1, 1, 1, 1, 1,
-0.06908516, 0.6355333, 0.7388099, 1, 1, 1, 1, 1,
-0.06108109, -0.9527311, -1.794636, 1, 1, 1, 1, 1,
-0.0593512, -1.619009, -1.232091, 1, 1, 1, 1, 1,
-0.05900026, -0.3651183, -2.634206, 1, 1, 1, 1, 1,
-0.05693775, 0.9666158, 0.6739975, 1, 1, 1, 1, 1,
-0.05643754, 0.4532371, 0.6615889, 1, 1, 1, 1, 1,
-0.05315766, -0.790432, -2.857045, 0, 0, 1, 1, 1,
-0.05180293, 0.1974705, -1.267654, 1, 0, 0, 1, 1,
-0.04720779, -0.3956338, -4.078129, 1, 0, 0, 1, 1,
-0.04719569, -1.472947, -5.718814, 1, 0, 0, 1, 1,
-0.04274684, -1.681199, -4.323987, 1, 0, 0, 1, 1,
-0.03866447, -0.859001, -3.668125, 1, 0, 0, 1, 1,
-0.03781731, 0.2441406, 0.5605962, 0, 0, 0, 1, 1,
-0.03423833, 0.8016233, 0.9724352, 0, 0, 0, 1, 1,
-0.0301223, -0.06542169, -0.9903902, 0, 0, 0, 1, 1,
-0.02872705, 0.6318236, -1.349291, 0, 0, 0, 1, 1,
-0.0260144, 0.6322758, 0.4971731, 0, 0, 0, 1, 1,
-0.02586239, 0.4714966, -0.6185784, 0, 0, 0, 1, 1,
-0.02392023, 0.4993483, -0.4787497, 0, 0, 0, 1, 1,
-0.02221387, -0.4524436, -2.564784, 1, 1, 1, 1, 1,
-0.01669632, 1.036106, -1.22991, 1, 1, 1, 1, 1,
-0.01048906, -1.078091, -2.187375, 1, 1, 1, 1, 1,
-0.007691643, -0.9073752, -2.074182, 1, 1, 1, 1, 1,
-0.003804901, -0.001959333, -1.855628, 1, 1, 1, 1, 1,
-0.002407873, -1.493995, -2.789241, 1, 1, 1, 1, 1,
0.002861365, -0.203437, 2.069127, 1, 1, 1, 1, 1,
0.00853189, -0.2023364, 1.891745, 1, 1, 1, 1, 1,
0.009801003, 0.2050259, -0.6959626, 1, 1, 1, 1, 1,
0.01509985, -0.02305035, 3.853919, 1, 1, 1, 1, 1,
0.01600898, 0.1280438, -0.1431569, 1, 1, 1, 1, 1,
0.01647433, 1.172344, 1.106742, 1, 1, 1, 1, 1,
0.02641189, 0.1850251, -1.5134, 1, 1, 1, 1, 1,
0.02701968, -1.004777, 2.515876, 1, 1, 1, 1, 1,
0.03094616, 2.706204, 1.523623, 1, 1, 1, 1, 1,
0.03548979, -0.4655792, 1.170815, 0, 0, 1, 1, 1,
0.04013665, -1.636545, 2.649614, 1, 0, 0, 1, 1,
0.04044852, 0.1667824, 0.3008685, 1, 0, 0, 1, 1,
0.04286561, -0.1886316, 3.947981, 1, 0, 0, 1, 1,
0.05527062, -0.2095481, 4.454309, 1, 0, 0, 1, 1,
0.06016119, -0.8873896, 2.781034, 1, 0, 0, 1, 1,
0.06442299, 2.01758, -0.372818, 0, 0, 0, 1, 1,
0.07164557, -0.3417788, 1.128516, 0, 0, 0, 1, 1,
0.07198876, 0.3508538, 0.5892804, 0, 0, 0, 1, 1,
0.07409672, -0.2001906, 4.002035, 0, 0, 0, 1, 1,
0.07633498, -0.5294065, 4.336358, 0, 0, 0, 1, 1,
0.08454635, 0.009994939, 1.990417, 0, 0, 0, 1, 1,
0.08573633, -0.3685777, 3.198609, 0, 0, 0, 1, 1,
0.0909851, 0.2772175, -1.027775, 1, 1, 1, 1, 1,
0.09171101, -0.6868054, 2.171476, 1, 1, 1, 1, 1,
0.09231083, 1.179739, 0.2015807, 1, 1, 1, 1, 1,
0.09426347, 0.62695, 2.383173, 1, 1, 1, 1, 1,
0.09427396, -0.6886172, 3.321893, 1, 1, 1, 1, 1,
0.09728874, -0.04603926, 1.516036, 1, 1, 1, 1, 1,
0.09822269, 0.07156171, 0.5469376, 1, 1, 1, 1, 1,
0.09913886, 0.884441, 3.044482, 1, 1, 1, 1, 1,
0.1026407, 0.04412951, -0.3338742, 1, 1, 1, 1, 1,
0.1032253, 0.6303412, 0.3623498, 1, 1, 1, 1, 1,
0.107687, -0.1519652, 1.302053, 1, 1, 1, 1, 1,
0.1104595, -0.7526085, 3.560703, 1, 1, 1, 1, 1,
0.1116292, 0.6640086, -0.6374308, 1, 1, 1, 1, 1,
0.1148638, 0.9360028, 1.913602, 1, 1, 1, 1, 1,
0.1158053, -0.3621404, 2.417006, 1, 1, 1, 1, 1,
0.1205077, 2.054259, 1.975334, 0, 0, 1, 1, 1,
0.1206811, -2.014904, 3.854153, 1, 0, 0, 1, 1,
0.1228912, -0.2389143, 2.6886, 1, 0, 0, 1, 1,
0.1259754, -2.632547, 3.484909, 1, 0, 0, 1, 1,
0.1263801, -1.006978, 2.11764, 1, 0, 0, 1, 1,
0.1267387, -0.4868949, 2.592625, 1, 0, 0, 1, 1,
0.1278019, -1.021052, 1.88574, 0, 0, 0, 1, 1,
0.1317179, -0.4540357, 4.725867, 0, 0, 0, 1, 1,
0.1344976, -1.021579, 4.573096, 0, 0, 0, 1, 1,
0.138578, 0.351606, 0.8300281, 0, 0, 0, 1, 1,
0.1413166, 1.260785, 0.07349464, 0, 0, 0, 1, 1,
0.1441514, 0.6968984, 0.2283966, 0, 0, 0, 1, 1,
0.1458992, 0.1684169, 1.055483, 0, 0, 0, 1, 1,
0.1483987, -0.5295554, 1.850672, 1, 1, 1, 1, 1,
0.1506999, 0.6849974, 1.950886, 1, 1, 1, 1, 1,
0.1560318, 0.5545586, 1.147639, 1, 1, 1, 1, 1,
0.1672083, -0.3523019, 4.01912, 1, 1, 1, 1, 1,
0.1762536, -0.784644, 4.842539, 1, 1, 1, 1, 1,
0.1810926, 0.5209804, 0.01640725, 1, 1, 1, 1, 1,
0.1869757, -0.5561883, 2.621247, 1, 1, 1, 1, 1,
0.1880273, -0.3210815, 5.998769, 1, 1, 1, 1, 1,
0.1898048, 0.5714329, -0.1861347, 1, 1, 1, 1, 1,
0.1909575, -0.03297759, 2.066852, 1, 1, 1, 1, 1,
0.1917735, 0.178833, 0.1586496, 1, 1, 1, 1, 1,
0.1927644, -1.280378, 3.615633, 1, 1, 1, 1, 1,
0.1982905, -0.325999, 3.641269, 1, 1, 1, 1, 1,
0.1992463, 0.01068085, 1.856515, 1, 1, 1, 1, 1,
0.1994343, -0.291534, 2.468189, 1, 1, 1, 1, 1,
0.1999711, 0.6479787, -0.111443, 0, 0, 1, 1, 1,
0.2070575, -0.314565, 1.546022, 1, 0, 0, 1, 1,
0.2185368, -0.02025553, 3.64779, 1, 0, 0, 1, 1,
0.2195304, -1.035879, 2.43377, 1, 0, 0, 1, 1,
0.2222283, -0.2051995, 2.52688, 1, 0, 0, 1, 1,
0.2228504, -0.3394511, 5.617648, 1, 0, 0, 1, 1,
0.2297691, 1.240305, 0.5757211, 0, 0, 0, 1, 1,
0.2325077, 0.4350485, -0.03706758, 0, 0, 0, 1, 1,
0.233202, 0.1508384, -0.2558337, 0, 0, 0, 1, 1,
0.2358418, 0.06369113, 0.3940385, 0, 0, 0, 1, 1,
0.2360309, 0.7576668, -0.2622477, 0, 0, 0, 1, 1,
0.2361664, -0.6410682, 2.802919, 0, 0, 0, 1, 1,
0.2386246, -1.888368, 2.553324, 0, 0, 0, 1, 1,
0.2429864, -0.6746119, 2.387067, 1, 1, 1, 1, 1,
0.2450906, 0.9322036, -0.8811011, 1, 1, 1, 1, 1,
0.2471449, -0.5483431, 2.787647, 1, 1, 1, 1, 1,
0.2494285, -0.2909039, 1.531837, 1, 1, 1, 1, 1,
0.2515837, -0.5095827, 2.506453, 1, 1, 1, 1, 1,
0.2521253, -1.321368, 3.903812, 1, 1, 1, 1, 1,
0.2586911, 0.2196016, 0.6997277, 1, 1, 1, 1, 1,
0.2587235, 0.7610949, 1.103319, 1, 1, 1, 1, 1,
0.2587391, -0.5917205, 1.375646, 1, 1, 1, 1, 1,
0.2601998, 0.3139506, 1.882676, 1, 1, 1, 1, 1,
0.2624799, -1.855682, 1.019847, 1, 1, 1, 1, 1,
0.2680069, -0.9804104, 2.971757, 1, 1, 1, 1, 1,
0.2698605, 0.4069194, 1.654234, 1, 1, 1, 1, 1,
0.2743966, -1.608894, 2.95389, 1, 1, 1, 1, 1,
0.275937, -0.6094371, 2.770958, 1, 1, 1, 1, 1,
0.277134, 0.221923, 0.2705691, 0, 0, 1, 1, 1,
0.2773135, 0.2259068, 0.03106943, 1, 0, 0, 1, 1,
0.278408, 0.8882204, 0.1857718, 1, 0, 0, 1, 1,
0.2825816, 0.7695255, 0.002934292, 1, 0, 0, 1, 1,
0.2865963, -0.7206518, 4.859965, 1, 0, 0, 1, 1,
0.2870706, 0.5569187, -0.1596066, 1, 0, 0, 1, 1,
0.288768, 0.03821684, 1.355673, 0, 0, 0, 1, 1,
0.2889971, 1.297472, -0.8334295, 0, 0, 0, 1, 1,
0.2913224, -0.1661182, 3.108751, 0, 0, 0, 1, 1,
0.2924196, 0.3257675, 2.324964, 0, 0, 0, 1, 1,
0.2983668, -0.4600932, 2.231329, 0, 0, 0, 1, 1,
0.3013666, -0.4064612, 3.499094, 0, 0, 0, 1, 1,
0.3014482, -1.503712, 1.690597, 0, 0, 0, 1, 1,
0.3015063, 0.7760819, -0.185309, 1, 1, 1, 1, 1,
0.3024198, -1.427308, 3.605698, 1, 1, 1, 1, 1,
0.3196469, 0.1120848, 1.017077, 1, 1, 1, 1, 1,
0.3232232, 0.5144258, 1.395667, 1, 1, 1, 1, 1,
0.3325483, 0.2657482, 1.229902, 1, 1, 1, 1, 1,
0.3404939, 0.2155541, 1.002288, 1, 1, 1, 1, 1,
0.3405989, -1.432818, 3.528203, 1, 1, 1, 1, 1,
0.3444229, -0.09807416, 3.680527, 1, 1, 1, 1, 1,
0.3461597, -0.195201, 1.147613, 1, 1, 1, 1, 1,
0.3468147, -0.5107848, 1.826168, 1, 1, 1, 1, 1,
0.3478275, 0.2166765, 2.102409, 1, 1, 1, 1, 1,
0.3488207, 0.1913922, -0.8490028, 1, 1, 1, 1, 1,
0.3499228, 0.09989442, 2.210648, 1, 1, 1, 1, 1,
0.3501415, 0.8776753, -0.7671988, 1, 1, 1, 1, 1,
0.3502126, 0.464534, -1.264279, 1, 1, 1, 1, 1,
0.353239, -1.056785, 2.393286, 0, 0, 1, 1, 1,
0.3546013, -0.2880794, 2.886674, 1, 0, 0, 1, 1,
0.3553974, -1.056722, 3.363219, 1, 0, 0, 1, 1,
0.3590843, 0.5389268, 1.812487, 1, 0, 0, 1, 1,
0.3597544, 0.2261497, -0.5248077, 1, 0, 0, 1, 1,
0.3616485, -0.8094979, 3.174667, 1, 0, 0, 1, 1,
0.3616537, 0.5306387, 0.1746666, 0, 0, 0, 1, 1,
0.3620607, 0.4714777, 1.073922, 0, 0, 0, 1, 1,
0.3640188, 0.9442003, 1.445997, 0, 0, 0, 1, 1,
0.3660975, -0.1904302, 1.232427, 0, 0, 0, 1, 1,
0.3835334, 0.5410584, 0.8279133, 0, 0, 0, 1, 1,
0.3857762, -0.05843791, 2.107681, 0, 0, 0, 1, 1,
0.3858708, -0.682268, 2.016572, 0, 0, 0, 1, 1,
0.3877681, 0.183612, 1.112932, 1, 1, 1, 1, 1,
0.3884538, -1.05195, 2.866249, 1, 1, 1, 1, 1,
0.3924081, -0.8296009, 2.831207, 1, 1, 1, 1, 1,
0.3950803, -1.549107, 3.262129, 1, 1, 1, 1, 1,
0.3950939, 1.29451, 1.448806, 1, 1, 1, 1, 1,
0.3955621, 0.4428517, -1.050718, 1, 1, 1, 1, 1,
0.3993291, 0.1280293, -0.6590719, 1, 1, 1, 1, 1,
0.4022182, 0.6633022, 2.057605, 1, 1, 1, 1, 1,
0.4033132, 1.186923, 0.07955603, 1, 1, 1, 1, 1,
0.4085017, 0.03426526, 3.258691, 1, 1, 1, 1, 1,
0.4154181, -0.765514, 2.958904, 1, 1, 1, 1, 1,
0.4168409, -1.403095, 2.055851, 1, 1, 1, 1, 1,
0.4168682, -1.689116, 2.923071, 1, 1, 1, 1, 1,
0.4169581, -1.40252, 1.624938, 1, 1, 1, 1, 1,
0.419292, 0.3097233, 1.611775, 1, 1, 1, 1, 1,
0.4196233, -0.561707, 3.296798, 0, 0, 1, 1, 1,
0.4202088, 0.6516713, -0.2868097, 1, 0, 0, 1, 1,
0.4216349, -1.852402, 2.623772, 1, 0, 0, 1, 1,
0.4222809, -0.03718435, 3.822908, 1, 0, 0, 1, 1,
0.4249451, 0.6639507, 0.4684395, 1, 0, 0, 1, 1,
0.4269646, 0.2737047, 0.133949, 1, 0, 0, 1, 1,
0.4484754, -0.007306316, 0.4309883, 0, 0, 0, 1, 1,
0.4535608, 0.9928096, -1.540554, 0, 0, 0, 1, 1,
0.4587754, -0.7570462, 3.634459, 0, 0, 0, 1, 1,
0.4591514, -0.661662, 2.218935, 0, 0, 0, 1, 1,
0.4599773, 0.9175785, -0.3128102, 0, 0, 0, 1, 1,
0.4639389, 1.856711, 0.7447836, 0, 0, 0, 1, 1,
0.4674818, 1.94761, 0.6012473, 0, 0, 0, 1, 1,
0.4698622, 0.2889755, 1.44355, 1, 1, 1, 1, 1,
0.4705763, 0.400918, -0.2386296, 1, 1, 1, 1, 1,
0.4714625, 1.055697, 0.4953321, 1, 1, 1, 1, 1,
0.4730224, -1.386033, 4.391804, 1, 1, 1, 1, 1,
0.4748484, 0.4664243, -0.7278039, 1, 1, 1, 1, 1,
0.4756314, -1.582192, 2.570205, 1, 1, 1, 1, 1,
0.477008, -0.114307, 0.9674228, 1, 1, 1, 1, 1,
0.4789384, 1.073899, 0.2098244, 1, 1, 1, 1, 1,
0.481453, 0.8181227, -0.02282777, 1, 1, 1, 1, 1,
0.4843455, -0.01919686, -0.1771398, 1, 1, 1, 1, 1,
0.4860238, -0.4835903, 3.823344, 1, 1, 1, 1, 1,
0.4861281, -1.792785, 1.953282, 1, 1, 1, 1, 1,
0.4887596, 0.3130724, -0.5973937, 1, 1, 1, 1, 1,
0.4922122, 1.513459, 0.9268249, 1, 1, 1, 1, 1,
0.4926877, 1.334291, 0.04232835, 1, 1, 1, 1, 1,
0.4980694, -0.4617993, 1.515228, 0, 0, 1, 1, 1,
0.5037171, -0.9286565, 3.70956, 1, 0, 0, 1, 1,
0.5048566, -1.373925, 2.348703, 1, 0, 0, 1, 1,
0.5085905, 0.1230398, 0.7802553, 1, 0, 0, 1, 1,
0.5093735, 0.5085221, 1.069764, 1, 0, 0, 1, 1,
0.5151659, -0.2508447, 1.8316, 1, 0, 0, 1, 1,
0.524357, 0.734124, 0.5251527, 0, 0, 0, 1, 1,
0.5277103, 1.550648, 0.9270504, 0, 0, 0, 1, 1,
0.5299026, 1.731009, 0.3656255, 0, 0, 0, 1, 1,
0.5301571, 0.2378517, 2.079689, 0, 0, 0, 1, 1,
0.5353872, -0.8255187, 0.8313793, 0, 0, 0, 1, 1,
0.5411135, 0.4879734, 0.3695431, 0, 0, 0, 1, 1,
0.5413294, 1.274293, 1.217034, 0, 0, 0, 1, 1,
0.545531, 1.587435, -2.324802, 1, 1, 1, 1, 1,
0.5474451, 1.978423, 0.8545032, 1, 1, 1, 1, 1,
0.5477191, -1.730422, 1.957909, 1, 1, 1, 1, 1,
0.5487996, 0.5933828, 1.075221, 1, 1, 1, 1, 1,
0.553096, -0.1157108, 2.672456, 1, 1, 1, 1, 1,
0.5544801, 1.140023, 1.854468, 1, 1, 1, 1, 1,
0.5556872, -0.7037286, 4.090689, 1, 1, 1, 1, 1,
0.5559291, -1.144238, 2.851853, 1, 1, 1, 1, 1,
0.5561728, -1.051688, 4.118727, 1, 1, 1, 1, 1,
0.5585533, 0.7846043, 1.207523, 1, 1, 1, 1, 1,
0.5597318, -2.127468, 3.497133, 1, 1, 1, 1, 1,
0.5625065, -0.08719763, 2.150891, 1, 1, 1, 1, 1,
0.5675255, -0.5751905, 1.86641, 1, 1, 1, 1, 1,
0.5697576, 1.615274, 1.279522, 1, 1, 1, 1, 1,
0.5712254, -2.248256, 2.601651, 1, 1, 1, 1, 1,
0.5733914, -0.2104375, 2.925848, 0, 0, 1, 1, 1,
0.5735376, 0.8921399, 0.2230715, 1, 0, 0, 1, 1,
0.57506, -0.9111071, 2.439316, 1, 0, 0, 1, 1,
0.5753859, -0.6073373, 3.858096, 1, 0, 0, 1, 1,
0.5772738, -1.977229, 2.731283, 1, 0, 0, 1, 1,
0.5794767, 1.267719, -1.133485, 1, 0, 0, 1, 1,
0.5805798, 0.9395276, -0.6355651, 0, 0, 0, 1, 1,
0.5824105, -1.324329, 4.232469, 0, 0, 0, 1, 1,
0.5843027, 0.2933811, 1.63643, 0, 0, 0, 1, 1,
0.5900311, -0.6482004, 2.533694, 0, 0, 0, 1, 1,
0.5908569, -0.2222881, 2.089272, 0, 0, 0, 1, 1,
0.5928201, -0.5168793, 2.75048, 0, 0, 0, 1, 1,
0.5944631, -1.581365, 4.449364, 0, 0, 0, 1, 1,
0.5969833, 0.1220669, 2.99051, 1, 1, 1, 1, 1,
0.5987693, 0.01608537, -0.4574855, 1, 1, 1, 1, 1,
0.6001468, 0.2514457, 1.153694, 1, 1, 1, 1, 1,
0.6052397, 2.121625, 1.127829, 1, 1, 1, 1, 1,
0.6129986, -2.036643, 3.457813, 1, 1, 1, 1, 1,
0.613344, 0.7421795, -0.4189855, 1, 1, 1, 1, 1,
0.6139277, 1.644243, 0.2198244, 1, 1, 1, 1, 1,
0.618789, -0.7329, 1.162111, 1, 1, 1, 1, 1,
0.6218498, -1.487765, 2.482022, 1, 1, 1, 1, 1,
0.6220336, -0.0204948, 1.70517, 1, 1, 1, 1, 1,
0.6258903, 0.9160018, 0.6070826, 1, 1, 1, 1, 1,
0.6260183, -0.4631514, 1.346107, 1, 1, 1, 1, 1,
0.6295203, 0.3552334, 1.58073, 1, 1, 1, 1, 1,
0.6315167, 0.7154133, 0.4361284, 1, 1, 1, 1, 1,
0.6363208, -1.40274, 3.371522, 1, 1, 1, 1, 1,
0.6386954, 0.2420276, -0.7171137, 0, 0, 1, 1, 1,
0.6462213, 0.4504024, 1.203856, 1, 0, 0, 1, 1,
0.6507975, 0.1906637, 1.620869, 1, 0, 0, 1, 1,
0.6513017, 1.160109, 0.6023141, 1, 0, 0, 1, 1,
0.6523261, 0.3593743, 0.8076191, 1, 0, 0, 1, 1,
0.6531067, -1.118797, 3.214044, 1, 0, 0, 1, 1,
0.6551285, -0.7941149, 2.39347, 0, 0, 0, 1, 1,
0.655917, -0.1657037, 1.402773, 0, 0, 0, 1, 1,
0.663576, -0.4366034, 2.583236, 0, 0, 0, 1, 1,
0.6709703, -0.002921591, -0.6778772, 0, 0, 0, 1, 1,
0.6710256, 0.7053727, 1.7339, 0, 0, 0, 1, 1,
0.6746354, -0.5529741, 3.695528, 0, 0, 0, 1, 1,
0.6747817, 1.140894, 0.9646166, 0, 0, 0, 1, 1,
0.6752701, -0.3389997, 1.90008, 1, 1, 1, 1, 1,
0.6753813, -0.1599848, 0.9821113, 1, 1, 1, 1, 1,
0.6759269, -0.2902983, 0.5086325, 1, 1, 1, 1, 1,
0.6830941, -1.647748, 4.086372, 1, 1, 1, 1, 1,
0.6891809, 0.05245163, 2.147259, 1, 1, 1, 1, 1,
0.6919091, -0.8141224, 2.147577, 1, 1, 1, 1, 1,
0.6977273, 0.3638325, 1.143565, 1, 1, 1, 1, 1,
0.6981748, -0.1649457, -0.08510633, 1, 1, 1, 1, 1,
0.6986583, -1.097988, 1.984725, 1, 1, 1, 1, 1,
0.7006768, -0.4701248, 3.185204, 1, 1, 1, 1, 1,
0.702071, -1.194953, 2.92673, 1, 1, 1, 1, 1,
0.7110116, -1.5984, 2.194351, 1, 1, 1, 1, 1,
0.7153569, 1.79848, -0.6337652, 1, 1, 1, 1, 1,
0.7193558, -2.007776, 2.859719, 1, 1, 1, 1, 1,
0.719537, 0.4519664, 0.6595101, 1, 1, 1, 1, 1,
0.7204623, 1.114751, 0.6018383, 0, 0, 1, 1, 1,
0.7230147, -0.4218218, 1.934039, 1, 0, 0, 1, 1,
0.7253492, -0.1165316, 0.261812, 1, 0, 0, 1, 1,
0.7303627, -0.8563798, 2.529397, 1, 0, 0, 1, 1,
0.7305117, 0.004564476, -0.2673195, 1, 0, 0, 1, 1,
0.7325103, 1.018873, -0.3259718, 1, 0, 0, 1, 1,
0.7334814, -0.5663149, 2.706128, 0, 0, 0, 1, 1,
0.7379731, 0.1576285, 2.430373, 0, 0, 0, 1, 1,
0.7469455, -1.281795, 2.845397, 0, 0, 0, 1, 1,
0.7548209, 0.6084445, 0.8756038, 0, 0, 0, 1, 1,
0.7561186, 0.8251228, 0.2319631, 0, 0, 0, 1, 1,
0.757659, 1.303036, 0.4762953, 0, 0, 0, 1, 1,
0.7582158, 0.2708375, 2.661602, 0, 0, 0, 1, 1,
0.7582671, -0.4056506, 1.5461, 1, 1, 1, 1, 1,
0.760749, 1.128797, 0.05751947, 1, 1, 1, 1, 1,
0.7619074, -1.531039, 3.068727, 1, 1, 1, 1, 1,
0.7669979, -0.375029, 2.572852, 1, 1, 1, 1, 1,
0.7715586, 1.570521, -0.3089657, 1, 1, 1, 1, 1,
0.7802504, 1.171959, -0.1521614, 1, 1, 1, 1, 1,
0.7868986, 0.1844259, 0.9441355, 1, 1, 1, 1, 1,
0.7881557, 0.01657157, 2.140563, 1, 1, 1, 1, 1,
0.7927769, 0.728655, -0.03521861, 1, 1, 1, 1, 1,
0.7963592, 0.7465766, 0.8562409, 1, 1, 1, 1, 1,
0.7966316, -1.290168, 4.097506, 1, 1, 1, 1, 1,
0.7971695, -0.9587237, 1.953491, 1, 1, 1, 1, 1,
0.800046, -0.005392966, 0.8039373, 1, 1, 1, 1, 1,
0.8037726, 0.4364826, 1.526765, 1, 1, 1, 1, 1,
0.8084324, -2.106638, 3.557255, 1, 1, 1, 1, 1,
0.8103963, -0.999272, 2.225482, 0, 0, 1, 1, 1,
0.8114732, 1.303279, -0.1706573, 1, 0, 0, 1, 1,
0.8193078, -1.584134, 2.748273, 1, 0, 0, 1, 1,
0.8235183, 1.289784, 0.1238223, 1, 0, 0, 1, 1,
0.8273075, 0.389574, -0.8449451, 1, 0, 0, 1, 1,
0.8277394, -1.029142, 1.44079, 1, 0, 0, 1, 1,
0.8331134, 0.6569733, 0.02565763, 0, 0, 0, 1, 1,
0.8341982, -0.6469, 1.814716, 0, 0, 0, 1, 1,
0.8376352, 0.3214457, 0.8460659, 0, 0, 0, 1, 1,
0.8421192, 0.6045188, 1.076153, 0, 0, 0, 1, 1,
0.8462752, 1.348313, 2.234332, 0, 0, 0, 1, 1,
0.8487901, 0.4800973, 0.4614519, 0, 0, 0, 1, 1,
0.8571566, -1.125872, 2.066163, 0, 0, 0, 1, 1,
0.8575754, 2.164624, -0.9191884, 1, 1, 1, 1, 1,
0.8598192, 0.6152259, 1.411219, 1, 1, 1, 1, 1,
0.8728756, 1.377585, -0.7540595, 1, 1, 1, 1, 1,
0.8747546, 1.552881, 1.631196, 1, 1, 1, 1, 1,
0.8770817, 0.9769488, 0.6467304, 1, 1, 1, 1, 1,
0.8829433, 0.1122754, 1.088351, 1, 1, 1, 1, 1,
0.8839573, -0.1269969, 1.744601, 1, 1, 1, 1, 1,
0.8858964, 0.9796405, -0.4235329, 1, 1, 1, 1, 1,
0.8867489, -1.948232, 1.105814, 1, 1, 1, 1, 1,
0.8913542, -0.2541845, 1.250211, 1, 1, 1, 1, 1,
0.9071287, -0.5408281, 2.399858, 1, 1, 1, 1, 1,
0.908025, 0.5649238, -0.7126168, 1, 1, 1, 1, 1,
0.9162199, 0.8569824, 1.560769, 1, 1, 1, 1, 1,
0.9216095, 0.6568896, 0.1960408, 1, 1, 1, 1, 1,
0.9230473, -0.04979059, 0.9088988, 1, 1, 1, 1, 1,
0.9332032, 2.425034, 0.05066667, 0, 0, 1, 1, 1,
0.9337845, -0.5658628, 2.083861, 1, 0, 0, 1, 1,
0.9425086, 0.4281572, 1.741173, 1, 0, 0, 1, 1,
0.9582177, -1.893339, 2.219627, 1, 0, 0, 1, 1,
0.9585524, 0.1975038, 2.295588, 1, 0, 0, 1, 1,
0.9613127, -1.14924, 2.531497, 1, 0, 0, 1, 1,
0.9673874, 0.1420629, 2.182784, 0, 0, 0, 1, 1,
0.9725186, -1.367476, 1.665294, 0, 0, 0, 1, 1,
0.9803663, -0.1048904, 2.3518, 0, 0, 0, 1, 1,
0.9819697, 0.5909674, 1.145456, 0, 0, 0, 1, 1,
0.9875175, -0.1205661, 1.35832, 0, 0, 0, 1, 1,
0.9887172, -0.380313, -0.6373961, 0, 0, 0, 1, 1,
0.9901585, 0.9440932, -0.8643075, 0, 0, 0, 1, 1,
1.004174, -1.50519, 3.709378, 1, 1, 1, 1, 1,
1.004486, 0.5632054, 2.447801, 1, 1, 1, 1, 1,
1.014395, 0.3220529, 1.271205, 1, 1, 1, 1, 1,
1.016284, 1.086093, 0.3276303, 1, 1, 1, 1, 1,
1.024144, 0.5886853, 0.3041931, 1, 1, 1, 1, 1,
1.027837, -0.5635332, 3.413078, 1, 1, 1, 1, 1,
1.031997, 0.4474565, 0.8096483, 1, 1, 1, 1, 1,
1.032059, 0.1640529, 1.405361, 1, 1, 1, 1, 1,
1.033783, -0.839571, 2.838528, 1, 1, 1, 1, 1,
1.034765, 0.009414401, 1.116899, 1, 1, 1, 1, 1,
1.040476, -1.27041, 2.862285, 1, 1, 1, 1, 1,
1.044006, 0.3741799, 2.050866, 1, 1, 1, 1, 1,
1.050815, 0.01248031, 1.034503, 1, 1, 1, 1, 1,
1.070041, 0.8547189, 1.764561, 1, 1, 1, 1, 1,
1.071117, -0.04126947, 1.801537, 1, 1, 1, 1, 1,
1.073243, -0.3542666, 0.7287982, 0, 0, 1, 1, 1,
1.073329, -0.2061766, 1.989961, 1, 0, 0, 1, 1,
1.08011, 0.4833599, 0.5509384, 1, 0, 0, 1, 1,
1.089622, -1.80301, 2.108024, 1, 0, 0, 1, 1,
1.089952, -0.4018812, 1.389313, 1, 0, 0, 1, 1,
1.090925, 2.691101, -0.3546526, 1, 0, 0, 1, 1,
1.107374, 1.814967, -0.4323659, 0, 0, 0, 1, 1,
1.110717, -0.2621031, 1.742719, 0, 0, 0, 1, 1,
1.110868, 1.702816, 0.2295289, 0, 0, 0, 1, 1,
1.113497, -0.5580778, 1.30247, 0, 0, 0, 1, 1,
1.114011, 0.7304181, 0.09773588, 0, 0, 0, 1, 1,
1.114069, 0.5459541, 0.1287265, 0, 0, 0, 1, 1,
1.115273, 1.175228, 0.6824083, 0, 0, 0, 1, 1,
1.122489, 0.5749152, 2.86883, 1, 1, 1, 1, 1,
1.124957, -0.1500134, 2.740977, 1, 1, 1, 1, 1,
1.12532, -1.860896, 2.613502, 1, 1, 1, 1, 1,
1.128849, -0.6710509, 1.900229, 1, 1, 1, 1, 1,
1.130536, 0.9114943, 2.034413, 1, 1, 1, 1, 1,
1.131571, 0.8918535, 1.548482, 1, 1, 1, 1, 1,
1.13875, 0.1180043, 0.1037043, 1, 1, 1, 1, 1,
1.141633, 1.51535, 1.858852, 1, 1, 1, 1, 1,
1.14347, 1.072443, 1.592597, 1, 1, 1, 1, 1,
1.146142, -0.2140771, 0.003932646, 1, 1, 1, 1, 1,
1.149531, -0.3768165, 1.345685, 1, 1, 1, 1, 1,
1.15186, 0.02436272, 2.193729, 1, 1, 1, 1, 1,
1.16437, 1.251388, 0.0843766, 1, 1, 1, 1, 1,
1.164722, 2.00825, -0.4656765, 1, 1, 1, 1, 1,
1.17032, -1.26459, 2.601323, 1, 1, 1, 1, 1,
1.175362, -0.2528087, 0.1955943, 0, 0, 1, 1, 1,
1.179879, 0.6244414, 0.4625165, 1, 0, 0, 1, 1,
1.185915, 1.229598, -1.100032, 1, 0, 0, 1, 1,
1.189179, 0.9496838, 1.259242, 1, 0, 0, 1, 1,
1.193248, 0.1911932, 2.390867, 1, 0, 0, 1, 1,
1.195544, -2.565863, 4.35126, 1, 0, 0, 1, 1,
1.195551, -0.2135399, 2.347541, 0, 0, 0, 1, 1,
1.196501, -1.115909, 0.4926242, 0, 0, 0, 1, 1,
1.196956, -0.769255, 2.95373, 0, 0, 0, 1, 1,
1.197842, -2.804036, 3.322668, 0, 0, 0, 1, 1,
1.202423, -0.2884909, 1.530009, 0, 0, 0, 1, 1,
1.203327, 0.2932723, 1.395541, 0, 0, 0, 1, 1,
1.203586, 1.419885, 0.9914198, 0, 0, 0, 1, 1,
1.208767, 1.454988, -0.4190906, 1, 1, 1, 1, 1,
1.210285, 0.05338761, 1.930131, 1, 1, 1, 1, 1,
1.213187, -0.223252, 2.108199, 1, 1, 1, 1, 1,
1.213265, -1.228116, 2.490721, 1, 1, 1, 1, 1,
1.214435, -0.6210428, 1.357319, 1, 1, 1, 1, 1,
1.227294, -1.657335, 0.4292173, 1, 1, 1, 1, 1,
1.229688, -0.03014351, 1.047501, 1, 1, 1, 1, 1,
1.238459, 0.1249534, 2.153726, 1, 1, 1, 1, 1,
1.243855, 1.147778, 0.7576433, 1, 1, 1, 1, 1,
1.254471, 0.892637, 1.506132, 1, 1, 1, 1, 1,
1.27168, -0.3197242, -0.04131448, 1, 1, 1, 1, 1,
1.273124, 0.5835667, 0.7801759, 1, 1, 1, 1, 1,
1.273149, -0.2112524, 2.632819, 1, 1, 1, 1, 1,
1.275591, 1.343582, 0.6228491, 1, 1, 1, 1, 1,
1.277502, 0.1260926, 4.594126, 1, 1, 1, 1, 1,
1.285566, -1.22631, 2.802396, 0, 0, 1, 1, 1,
1.286535, -0.2268299, 0.9348612, 1, 0, 0, 1, 1,
1.292734, -0.166929, 1.823998, 1, 0, 0, 1, 1,
1.296846, -0.9933828, 3.124437, 1, 0, 0, 1, 1,
1.340976, 2.51111, -1.780566, 1, 0, 0, 1, 1,
1.342187, 0.2260538, 0.4065803, 1, 0, 0, 1, 1,
1.356237, 2.064735, -0.3525397, 0, 0, 0, 1, 1,
1.356565, 0.9010057, -0.9933351, 0, 0, 0, 1, 1,
1.361587, -0.1292354, 2.028403, 0, 0, 0, 1, 1,
1.373061, -1.152529, 0.4327167, 0, 0, 0, 1, 1,
1.375089, -0.0471664, 0.01301459, 0, 0, 0, 1, 1,
1.378533, 1.568669, 0.2303302, 0, 0, 0, 1, 1,
1.38406, 0.1434003, 1.837837, 0, 0, 0, 1, 1,
1.40415, -0.3857881, 1.678282, 1, 1, 1, 1, 1,
1.416834, -1.173787, 1.256325, 1, 1, 1, 1, 1,
1.417529, 1.402926, 0.9644039, 1, 1, 1, 1, 1,
1.417951, -2.36416, 2.586194, 1, 1, 1, 1, 1,
1.424864, -1.664815, 2.324099, 1, 1, 1, 1, 1,
1.425948, 0.2227926, 2.944209, 1, 1, 1, 1, 1,
1.426945, 0.195249, 1.196052, 1, 1, 1, 1, 1,
1.428672, 1.67131, -0.3265326, 1, 1, 1, 1, 1,
1.446516, -0.1829851, 1.774479, 1, 1, 1, 1, 1,
1.465964, -0.479122, 0.8821989, 1, 1, 1, 1, 1,
1.468857, 0.1290529, 1.915706, 1, 1, 1, 1, 1,
1.469469, -0.5672506, 3.482529, 1, 1, 1, 1, 1,
1.472069, -0.7350263, 0.9676219, 1, 1, 1, 1, 1,
1.475139, -0.4150686, 1.561815, 1, 1, 1, 1, 1,
1.480641, 0.4088072, -0.04078923, 1, 1, 1, 1, 1,
1.489169, 1.276957, -1.638065, 0, 0, 1, 1, 1,
1.491091, -1.454459, 2.674099, 1, 0, 0, 1, 1,
1.496318, -0.5778583, 2.232132, 1, 0, 0, 1, 1,
1.500965, -0.9837801, 0.7501134, 1, 0, 0, 1, 1,
1.503182, -0.9952148, 2.386581, 1, 0, 0, 1, 1,
1.514947, 0.1211741, 1.989658, 1, 0, 0, 1, 1,
1.52105, -0.1640966, 1.923537, 0, 0, 0, 1, 1,
1.523932, 1.040196, 0.9048052, 0, 0, 0, 1, 1,
1.526043, 1.876379, 2.229127, 0, 0, 0, 1, 1,
1.530584, 0.05203066, 0.4773522, 0, 0, 0, 1, 1,
1.535367, -2.758332, 1.8076, 0, 0, 0, 1, 1,
1.541871, -1.322699, 3.118317, 0, 0, 0, 1, 1,
1.54362, -1.429354, 1.957853, 0, 0, 0, 1, 1,
1.545952, -0.8127431, 0.4174856, 1, 1, 1, 1, 1,
1.556374, 0.4506823, 0.4600478, 1, 1, 1, 1, 1,
1.560119, 1.569863, 1.118474, 1, 1, 1, 1, 1,
1.563378, -1.296488, 1.868514, 1, 1, 1, 1, 1,
1.564407, 0.4774694, 2.084609, 1, 1, 1, 1, 1,
1.576481, 1.729596, 1.128537, 1, 1, 1, 1, 1,
1.577044, 1.036977, -0.2469236, 1, 1, 1, 1, 1,
1.591882, 0.2241912, 1.904806, 1, 1, 1, 1, 1,
1.596246, 1.50127, 1.117592, 1, 1, 1, 1, 1,
1.59698, 1.017684, 0.8455159, 1, 1, 1, 1, 1,
1.602046, -0.7025703, 3.278786, 1, 1, 1, 1, 1,
1.602297, 2.510326, 0.920935, 1, 1, 1, 1, 1,
1.629398, 1.246406, 1.221068, 1, 1, 1, 1, 1,
1.638668, 0.8141034, 0.6880321, 1, 1, 1, 1, 1,
1.659696, -0.4360663, 1.524077, 1, 1, 1, 1, 1,
1.671956, 0.4426931, 1.345755, 0, 0, 1, 1, 1,
1.67222, 1.772857, 1.164343, 1, 0, 0, 1, 1,
1.682923, 0.9673547, 1.377378, 1, 0, 0, 1, 1,
1.718306, -0.1175799, -0.2809139, 1, 0, 0, 1, 1,
1.720837, -2.462672, 0.858621, 1, 0, 0, 1, 1,
1.746444, 0.371426, 0.9503192, 1, 0, 0, 1, 1,
1.750078, -1.009807, 2.265642, 0, 0, 0, 1, 1,
1.750643, 1.042357, 1.530797, 0, 0, 0, 1, 1,
1.751725, 1.500239, 2.021616, 0, 0, 0, 1, 1,
1.79304, 0.9814761, 0.03278928, 0, 0, 0, 1, 1,
1.815321, 0.4452365, -0.3017316, 0, 0, 0, 1, 1,
1.829736, 0.720386, 0.2436379, 0, 0, 0, 1, 1,
1.866704, -3.185041, 2.772518, 0, 0, 0, 1, 1,
1.875161, 1.604713, 1.148814, 1, 1, 1, 1, 1,
1.892078, 1.39624, 0.6204265, 1, 1, 1, 1, 1,
1.898591, -0.1128901, 2.714488, 1, 1, 1, 1, 1,
1.908968, -1.013204, 2.019012, 1, 1, 1, 1, 1,
1.91158, 0.02589393, 2.144864, 1, 1, 1, 1, 1,
1.914342, 1.509999, 2.151069, 1, 1, 1, 1, 1,
1.938422, 0.02601788, 1.257897, 1, 1, 1, 1, 1,
1.956138, -0.7999591, 1.857598, 1, 1, 1, 1, 1,
1.972856, 1.513098, 1.10817, 1, 1, 1, 1, 1,
1.978926, 0.7665864, 1.449767, 1, 1, 1, 1, 1,
1.992064, -1.600858, 2.488738, 1, 1, 1, 1, 1,
2.010279, -0.9784024, 2.750307, 1, 1, 1, 1, 1,
2.020518, -0.5237939, 2.916359, 1, 1, 1, 1, 1,
2.035134, -2.049121, 2.030807, 1, 1, 1, 1, 1,
2.071276, 0.6700552, 1.389436, 1, 1, 1, 1, 1,
2.109802, -0.5548213, 1.609351, 0, 0, 1, 1, 1,
2.124291, 0.1198875, 1.929654, 1, 0, 0, 1, 1,
2.125202, -0.7954187, 1.548633, 1, 0, 0, 1, 1,
2.125602, -0.06298178, 0.06413175, 1, 0, 0, 1, 1,
2.125634, 0.06734002, 2.87867, 1, 0, 0, 1, 1,
2.131846, 0.7013365, 2.894674, 1, 0, 0, 1, 1,
2.14344, -2.191171, 0.6833746, 0, 0, 0, 1, 1,
2.211127, -1.158008, 2.373259, 0, 0, 0, 1, 1,
2.294857, 1.131013, 1.675749, 0, 0, 0, 1, 1,
2.308676, 0.001370552, 0.9491193, 0, 0, 0, 1, 1,
2.341841, -1.482858, 2.441301, 0, 0, 0, 1, 1,
2.488114, -0.9369287, 3.036186, 0, 0, 0, 1, 1,
2.519086, 0.4780568, 2.29058, 0, 0, 0, 1, 1,
2.519719, 0.6931146, 0.9774925, 1, 1, 1, 1, 1,
2.529095, 0.697101, 1.542624, 1, 1, 1, 1, 1,
2.564226, 0.78755, 0.9713604, 1, 1, 1, 1, 1,
2.683549, -0.3450636, 1.276929, 1, 1, 1, 1, 1,
2.745239, 0.395292, 1.993496, 1, 1, 1, 1, 1,
2.948884, 0.7392044, 1.959421, 1, 1, 1, 1, 1,
3.854512, 0.8405758, 1.9308, 1, 1, 1, 1, 1
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
var radius = 10.07683;
var distance = 35.39444;
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
mvMatrix.translate( -0.3939409, 0.0643971, -0.1399775 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.39444);
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
