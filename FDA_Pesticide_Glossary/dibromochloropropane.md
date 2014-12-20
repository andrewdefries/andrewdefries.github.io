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
-3.224887, -0.8861201, -2.42277, 1, 0, 0, 1,
-2.908172, -0.6566964, -1.384729, 1, 0.007843138, 0, 1,
-2.750621, 2.005482, 0.2521099, 1, 0.01176471, 0, 1,
-2.727516, -1.2254, -0.3187453, 1, 0.01960784, 0, 1,
-2.713528, 1.772185, -1.974245, 1, 0.02352941, 0, 1,
-2.673596, -0.4646994, -1.326477, 1, 0.03137255, 0, 1,
-2.57177, 0.6187707, -1.018319, 1, 0.03529412, 0, 1,
-2.561835, -0.1486558, -1.607228, 1, 0.04313726, 0, 1,
-2.515049, -0.5007114, -1.108077, 1, 0.04705882, 0, 1,
-2.479735, 0.7876404, -2.010134, 1, 0.05490196, 0, 1,
-2.454351, 0.5575812, -0.2568388, 1, 0.05882353, 0, 1,
-2.32668, -0.5581815, -1.002262, 1, 0.06666667, 0, 1,
-2.309219, 2.053786, -0.8294691, 1, 0.07058824, 0, 1,
-2.301846, 0.4720759, -1.489265, 1, 0.07843138, 0, 1,
-2.238163, -0.04174187, -0.4396689, 1, 0.08235294, 0, 1,
-2.234862, 0.9640797, -1.675282, 1, 0.09019608, 0, 1,
-2.189275, -1.448747, -0.8261868, 1, 0.09411765, 0, 1,
-2.15809, -0.6150654, -1.795003, 1, 0.1019608, 0, 1,
-2.130992, -0.9443026, -1.87157, 1, 0.1098039, 0, 1,
-2.129834, -0.8293954, -1.037498, 1, 0.1137255, 0, 1,
-2.119907, 1.343277, -1.498194, 1, 0.1215686, 0, 1,
-2.094826, 0.2205668, -0.6596235, 1, 0.1254902, 0, 1,
-2.093593, 0.5828193, -1.923672, 1, 0.1333333, 0, 1,
-2.051093, -1.686944, -2.582355, 1, 0.1372549, 0, 1,
-1.990299, -0.8556624, -1.144923, 1, 0.145098, 0, 1,
-1.967429, 0.3986495, -1.940206, 1, 0.1490196, 0, 1,
-1.965957, 0.4428456, -0.6783944, 1, 0.1568628, 0, 1,
-1.961483, -0.6738792, -0.5997965, 1, 0.1607843, 0, 1,
-1.95543, -0.3025538, 0.2555406, 1, 0.1686275, 0, 1,
-1.944887, 0.5477456, -1.267537, 1, 0.172549, 0, 1,
-1.936342, 0.6220682, -0.6307805, 1, 0.1803922, 0, 1,
-1.922069, 0.2665101, -0.2184874, 1, 0.1843137, 0, 1,
-1.918071, 0.1024347, -1.371072, 1, 0.1921569, 0, 1,
-1.90131, -1.488742, -2.678096, 1, 0.1960784, 0, 1,
-1.895718, 1.00011, -2.975379, 1, 0.2039216, 0, 1,
-1.894743, 0.6934222, -0.7411492, 1, 0.2117647, 0, 1,
-1.882025, 1.395631, -0.7469172, 1, 0.2156863, 0, 1,
-1.879222, 1.738799, -2.139009, 1, 0.2235294, 0, 1,
-1.87584, 0.5937129, -0.2154278, 1, 0.227451, 0, 1,
-1.85867, 0.8821028, 1.858397, 1, 0.2352941, 0, 1,
-1.858466, 0.03849664, -1.369705, 1, 0.2392157, 0, 1,
-1.843601, 0.5240082, -0.6741009, 1, 0.2470588, 0, 1,
-1.83185, -0.2575959, -0.6950453, 1, 0.2509804, 0, 1,
-1.801016, -0.3172139, -2.118994, 1, 0.2588235, 0, 1,
-1.791738, -0.4875162, -1.321193, 1, 0.2627451, 0, 1,
-1.79022, -0.2014993, -0.2891138, 1, 0.2705882, 0, 1,
-1.770578, -0.2397007, -1.108701, 1, 0.2745098, 0, 1,
-1.756804, -0.08669624, -1.41432, 1, 0.282353, 0, 1,
-1.756287, -0.5298728, -2.837685, 1, 0.2862745, 0, 1,
-1.732005, 0.4400921, -3.793426, 1, 0.2941177, 0, 1,
-1.729951, 0.0737206, -2.158344, 1, 0.3019608, 0, 1,
-1.727351, 1.257483, 0.06906901, 1, 0.3058824, 0, 1,
-1.725466, -1.603656, -2.292108, 1, 0.3137255, 0, 1,
-1.697877, -1.628728, -1.108369, 1, 0.3176471, 0, 1,
-1.687463, -1.532183, -2.569777, 1, 0.3254902, 0, 1,
-1.685004, 0.5286143, -1.448397, 1, 0.3294118, 0, 1,
-1.67915, -2.341472, -4.300103, 1, 0.3372549, 0, 1,
-1.664605, -0.3411404, -1.735772, 1, 0.3411765, 0, 1,
-1.644727, 0.7814602, -1.894103, 1, 0.3490196, 0, 1,
-1.644342, 0.3348322, -2.062873, 1, 0.3529412, 0, 1,
-1.640381, -0.2388148, -1.387045, 1, 0.3607843, 0, 1,
-1.638809, 0.03955518, -1.904764, 1, 0.3647059, 0, 1,
-1.617984, 2.397647, -1.415363, 1, 0.372549, 0, 1,
-1.615321, 0.5615156, 0.2032303, 1, 0.3764706, 0, 1,
-1.601997, -0.1569396, -1.498842, 1, 0.3843137, 0, 1,
-1.601296, -0.07309488, -1.248344, 1, 0.3882353, 0, 1,
-1.600834, 0.05292583, -2.324655, 1, 0.3960784, 0, 1,
-1.592443, 0.5977512, -2.510151, 1, 0.4039216, 0, 1,
-1.57919, 0.03055853, 0.1778894, 1, 0.4078431, 0, 1,
-1.577805, 0.7334223, -0.6206538, 1, 0.4156863, 0, 1,
-1.543003, 1.128472, -2.277146, 1, 0.4196078, 0, 1,
-1.540304, -0.2194864, -1.823011, 1, 0.427451, 0, 1,
-1.539406, 0.5437438, 0.1277407, 1, 0.4313726, 0, 1,
-1.531123, -0.1740171, 0.3422413, 1, 0.4392157, 0, 1,
-1.519017, -0.9594135, -0.9971772, 1, 0.4431373, 0, 1,
-1.509498, 0.1225748, -1.079589, 1, 0.4509804, 0, 1,
-1.499209, 1.752285, -1.091686, 1, 0.454902, 0, 1,
-1.493673, -1.048479, -2.078462, 1, 0.4627451, 0, 1,
-1.479669, 2.291359, 0.4641982, 1, 0.4666667, 0, 1,
-1.478069, -0.03816966, -1.658943, 1, 0.4745098, 0, 1,
-1.477996, 0.7737604, -1.580754, 1, 0.4784314, 0, 1,
-1.476194, -0.6338354, -1.25271, 1, 0.4862745, 0, 1,
-1.449784, -1.028677, -0.7786901, 1, 0.4901961, 0, 1,
-1.447086, 1.226631, -0.4134162, 1, 0.4980392, 0, 1,
-1.444151, -1.440106, -2.653209, 1, 0.5058824, 0, 1,
-1.440399, 0.02993256, -1.924123, 1, 0.509804, 0, 1,
-1.431216, -2.693322, -2.309189, 1, 0.5176471, 0, 1,
-1.417652, -1.195017, -0.6056634, 1, 0.5215687, 0, 1,
-1.405346, -0.3063667, -1.855148, 1, 0.5294118, 0, 1,
-1.392672, -1.41456, -1.247767, 1, 0.5333334, 0, 1,
-1.391513, 0.02216546, -1.048982, 1, 0.5411765, 0, 1,
-1.384166, -0.1172409, -0.2028547, 1, 0.5450981, 0, 1,
-1.380749, -0.3020907, -2.600448, 1, 0.5529412, 0, 1,
-1.376132, 0.5303099, -1.125018, 1, 0.5568628, 0, 1,
-1.371834, 0.3587791, -0.8812851, 1, 0.5647059, 0, 1,
-1.366638, -1.809375, -2.148295, 1, 0.5686275, 0, 1,
-1.365634, 0.5642164, -0.04455752, 1, 0.5764706, 0, 1,
-1.354523, -1.09249, -2.156661, 1, 0.5803922, 0, 1,
-1.334777, -0.62079, -0.9294805, 1, 0.5882353, 0, 1,
-1.309289, 0.09675835, -3.566921, 1, 0.5921569, 0, 1,
-1.305748, 1.144822, 1.57672, 1, 0.6, 0, 1,
-1.304693, 0.1441034, -0.6878452, 1, 0.6078432, 0, 1,
-1.302562, -0.04238548, -1.228043, 1, 0.6117647, 0, 1,
-1.299317, 0.4346085, -2.957371, 1, 0.6196079, 0, 1,
-1.296719, -0.1176521, -1.585794, 1, 0.6235294, 0, 1,
-1.29112, -0.9281414, -1.48303, 1, 0.6313726, 0, 1,
-1.286723, -1.29612, -2.862159, 1, 0.6352941, 0, 1,
-1.279689, -0.129395, -3.042033, 1, 0.6431373, 0, 1,
-1.270824, -1.375156, -2.345683, 1, 0.6470588, 0, 1,
-1.267794, 0.79017, -0.8886682, 1, 0.654902, 0, 1,
-1.259802, -0.6315663, -0.8160394, 1, 0.6588235, 0, 1,
-1.252713, -0.1655544, -1.865247, 1, 0.6666667, 0, 1,
-1.245884, 0.2008554, -0.8414829, 1, 0.6705883, 0, 1,
-1.240673, -0.8629173, -1.957945, 1, 0.6784314, 0, 1,
-1.239508, 1.879025, -2.257571, 1, 0.682353, 0, 1,
-1.223697, -0.5538675, -2.774543, 1, 0.6901961, 0, 1,
-1.209186, -0.5895407, -3.622895, 1, 0.6941177, 0, 1,
-1.208791, -0.7598124, -2.361334, 1, 0.7019608, 0, 1,
-1.201633, -0.1903932, -1.012633, 1, 0.7098039, 0, 1,
-1.199169, -0.1047454, -3.106565, 1, 0.7137255, 0, 1,
-1.192501, -0.009888812, -1.041329, 1, 0.7215686, 0, 1,
-1.179698, 0.2974541, 0.214658, 1, 0.7254902, 0, 1,
-1.177655, -0.1123772, -2.77917, 1, 0.7333333, 0, 1,
-1.172819, 0.2952147, -2.399345, 1, 0.7372549, 0, 1,
-1.16371, -2.056461, -3.202581, 1, 0.7450981, 0, 1,
-1.162397, -1.675208, -1.938801, 1, 0.7490196, 0, 1,
-1.137929, 1.030775, -0.5823877, 1, 0.7568628, 0, 1,
-1.125771, 0.3435082, -2.50517, 1, 0.7607843, 0, 1,
-1.113976, 1.409388, -1.838262, 1, 0.7686275, 0, 1,
-1.113545, 2.001995, -0.6186465, 1, 0.772549, 0, 1,
-1.109722, -1.364957, -1.882632, 1, 0.7803922, 0, 1,
-1.101997, -0.6023623, -0.7897222, 1, 0.7843137, 0, 1,
-1.096532, 0.2352097, -1.468022, 1, 0.7921569, 0, 1,
-1.096528, 1.620246, 0.6178071, 1, 0.7960784, 0, 1,
-1.096178, 0.6133842, -2.180629, 1, 0.8039216, 0, 1,
-1.095764, -1.223098, -2.028736, 1, 0.8117647, 0, 1,
-1.09437, 0.9295354, -0.945031, 1, 0.8156863, 0, 1,
-1.089703, -0.2127565, -0.1170978, 1, 0.8235294, 0, 1,
-1.087631, 0.6750885, -0.6929778, 1, 0.827451, 0, 1,
-1.072983, 0.4079341, 1.287194, 1, 0.8352941, 0, 1,
-1.072324, 1.105955, -0.2152169, 1, 0.8392157, 0, 1,
-1.071755, 1.42989, -0.5113456, 1, 0.8470588, 0, 1,
-1.065386, -2.451694, -2.825605, 1, 0.8509804, 0, 1,
-1.053144, -0.1345234, -1.309045, 1, 0.8588235, 0, 1,
-1.048474, 0.8382572, -0.3181278, 1, 0.8627451, 0, 1,
-1.04099, -1.503911, -1.097447, 1, 0.8705882, 0, 1,
-1.033682, -1.20946, -2.771747, 1, 0.8745098, 0, 1,
-1.032259, -0.9074888, -1.445473, 1, 0.8823529, 0, 1,
-1.029058, 0.0624902, -2.122895, 1, 0.8862745, 0, 1,
-1.02405, -0.8902336, -2.93648, 1, 0.8941177, 0, 1,
-1.02198, 0.7249081, -0.4345352, 1, 0.8980392, 0, 1,
-1.020977, -1.292814, -2.36195, 1, 0.9058824, 0, 1,
-1.014149, -0.8082103, -2.033612, 1, 0.9137255, 0, 1,
-1.013849, 1.296048, -1.672289, 1, 0.9176471, 0, 1,
-1.005018, 0.2497115, -0.6032584, 1, 0.9254902, 0, 1,
-1.004629, -0.6781398, 0.3667286, 1, 0.9294118, 0, 1,
-1.002872, -0.5452115, -1.258118, 1, 0.9372549, 0, 1,
-1.001825, -1.627437, -4.294144, 1, 0.9411765, 0, 1,
-0.9919379, 0.7515081, -2.330218, 1, 0.9490196, 0, 1,
-0.9878847, -0.9259735, -3.221417, 1, 0.9529412, 0, 1,
-0.987108, -0.2994461, -1.062322, 1, 0.9607843, 0, 1,
-0.983444, -1.155777, -3.739588, 1, 0.9647059, 0, 1,
-0.983186, 0.1897232, -2.277264, 1, 0.972549, 0, 1,
-0.9775866, -0.433183, -1.918405, 1, 0.9764706, 0, 1,
-0.9733949, -1.701908, -2.247592, 1, 0.9843137, 0, 1,
-0.9723904, 0.8101655, -1.778202, 1, 0.9882353, 0, 1,
-0.971612, -1.218738, -3.969128, 1, 0.9960784, 0, 1,
-0.9679875, 1.530318, 0.9290781, 0.9960784, 1, 0, 1,
-0.966149, 0.08763051, -2.167123, 0.9921569, 1, 0, 1,
-0.9632798, -0.3716128, -0.5365272, 0.9843137, 1, 0, 1,
-0.9609135, -0.8940355, -1.438827, 0.9803922, 1, 0, 1,
-0.9604264, -0.183757, -2.24469, 0.972549, 1, 0, 1,
-0.9603591, -0.6467603, -3.360258, 0.9686275, 1, 0, 1,
-0.9563173, 0.5890695, -1.17294, 0.9607843, 1, 0, 1,
-0.9531084, 0.4717941, -2.455929, 0.9568627, 1, 0, 1,
-0.9518426, 0.4792747, -1.633031, 0.9490196, 1, 0, 1,
-0.9470801, 0.7682461, -1.257945, 0.945098, 1, 0, 1,
-0.9454795, -0.201223, -2.855033, 0.9372549, 1, 0, 1,
-0.9414113, 0.2806868, 1.137235, 0.9333333, 1, 0, 1,
-0.9344243, -0.6619602, -4.693973, 0.9254902, 1, 0, 1,
-0.9326356, -0.9391307, -2.680867, 0.9215686, 1, 0, 1,
-0.9314237, -0.2035135, -2.395911, 0.9137255, 1, 0, 1,
-0.9116052, -0.05099478, -3.098916, 0.9098039, 1, 0, 1,
-0.9049713, 1.107438, -0.7967818, 0.9019608, 1, 0, 1,
-0.9036672, -0.3053731, -1.888973, 0.8941177, 1, 0, 1,
-0.8964991, 1.69307, -0.4564803, 0.8901961, 1, 0, 1,
-0.8931396, -0.0922377, -0.6789787, 0.8823529, 1, 0, 1,
-0.8916466, -0.6877202, -2.516535, 0.8784314, 1, 0, 1,
-0.8876868, 1.120429, -0.6177503, 0.8705882, 1, 0, 1,
-0.8843542, 0.1588744, -1.291955, 0.8666667, 1, 0, 1,
-0.883509, 1.677139, -2.272877, 0.8588235, 1, 0, 1,
-0.8694757, -1.807503, -0.8500938, 0.854902, 1, 0, 1,
-0.863298, 0.8138521, 0.3192292, 0.8470588, 1, 0, 1,
-0.8470231, 1.433512, 0.6002097, 0.8431373, 1, 0, 1,
-0.840307, 0.02460509, -2.446116, 0.8352941, 1, 0, 1,
-0.8319236, -1.50245, -0.6423697, 0.8313726, 1, 0, 1,
-0.8264892, -1.766326, -2.007415, 0.8235294, 1, 0, 1,
-0.8225895, 1.106859, -2.65231, 0.8196079, 1, 0, 1,
-0.8190023, -0.3252835, -1.563877, 0.8117647, 1, 0, 1,
-0.8179346, 0.65456, -0.9497192, 0.8078431, 1, 0, 1,
-0.8137114, -0.2415162, -1.521049, 0.8, 1, 0, 1,
-0.8117263, 0.6695436, -1.119457, 0.7921569, 1, 0, 1,
-0.8077722, -0.5500009, -3.048635, 0.7882353, 1, 0, 1,
-0.8055711, 0.05472111, -2.767289, 0.7803922, 1, 0, 1,
-0.8008135, 0.0269732, -1.723897, 0.7764706, 1, 0, 1,
-0.8003947, 0.1659749, -1.005696, 0.7686275, 1, 0, 1,
-0.7900071, 1.486435, -0.4139178, 0.7647059, 1, 0, 1,
-0.7805912, -0.4054945, -1.547685, 0.7568628, 1, 0, 1,
-0.7710242, -0.9891073, -2.658094, 0.7529412, 1, 0, 1,
-0.7709299, 0.4900314, -2.29372, 0.7450981, 1, 0, 1,
-0.766416, -0.8737641, -2.806786, 0.7411765, 1, 0, 1,
-0.7647973, -0.5849903, 0.1389394, 0.7333333, 1, 0, 1,
-0.7612172, 0.4471955, -1.984033, 0.7294118, 1, 0, 1,
-0.7611344, 1.044773, -0.01856024, 0.7215686, 1, 0, 1,
-0.7599932, -0.2694879, -2.752175, 0.7176471, 1, 0, 1,
-0.7584972, 0.3311661, -0.03625096, 0.7098039, 1, 0, 1,
-0.7572443, 2.222228, 1.463182, 0.7058824, 1, 0, 1,
-0.7439837, 0.06085185, -1.252195, 0.6980392, 1, 0, 1,
-0.7434207, 0.9614041, -0.3687792, 0.6901961, 1, 0, 1,
-0.7417955, -0.7977048, -2.369262, 0.6862745, 1, 0, 1,
-0.7408653, 0.6951618, -0.2228247, 0.6784314, 1, 0, 1,
-0.7291515, -0.2725486, -3.77582, 0.6745098, 1, 0, 1,
-0.7286224, 0.02792505, -2.359705, 0.6666667, 1, 0, 1,
-0.7229705, 0.5801141, -1.637203, 0.6627451, 1, 0, 1,
-0.7223887, -1.056206, -2.130236, 0.654902, 1, 0, 1,
-0.7074444, 0.8948208, -2.379414, 0.6509804, 1, 0, 1,
-0.7035871, -0.04732489, -0.9434968, 0.6431373, 1, 0, 1,
-0.694045, 2.026202, 0.4146865, 0.6392157, 1, 0, 1,
-0.6886531, 0.9768431, -1.79584, 0.6313726, 1, 0, 1,
-0.6844127, 1.35596, -1.351859, 0.627451, 1, 0, 1,
-0.6816896, -1.481185, -0.8048635, 0.6196079, 1, 0, 1,
-0.6747374, 0.2785791, -3.16885, 0.6156863, 1, 0, 1,
-0.6679624, -1.21628, -1.658188, 0.6078432, 1, 0, 1,
-0.6670512, -0.3536324, -2.304676, 0.6039216, 1, 0, 1,
-0.6647227, 0.1656737, -0.9453768, 0.5960785, 1, 0, 1,
-0.6623793, -0.3659652, -2.391502, 0.5882353, 1, 0, 1,
-0.6623132, -0.5070759, -3.825763, 0.5843138, 1, 0, 1,
-0.6591328, 1.215122, 1.231259, 0.5764706, 1, 0, 1,
-0.6584393, 0.8743815, 0.4274085, 0.572549, 1, 0, 1,
-0.6579288, -0.6669444, -1.478268, 0.5647059, 1, 0, 1,
-0.6573355, -1.157542, -3.015434, 0.5607843, 1, 0, 1,
-0.6569132, -1.089595, -3.378915, 0.5529412, 1, 0, 1,
-0.651862, 1.56239, -0.07604908, 0.5490196, 1, 0, 1,
-0.6477047, 0.3781671, -0.2287381, 0.5411765, 1, 0, 1,
-0.6474503, 0.448961, 0.1456756, 0.5372549, 1, 0, 1,
-0.6471231, -0.5512419, -2.50694, 0.5294118, 1, 0, 1,
-0.6465836, 0.333849, -0.2712626, 0.5254902, 1, 0, 1,
-0.646518, 0.9348949, 0.011798, 0.5176471, 1, 0, 1,
-0.643078, -0.1364062, 1.46852, 0.5137255, 1, 0, 1,
-0.6429476, 0.291939, -1.913246, 0.5058824, 1, 0, 1,
-0.6413118, -1.472164, -0.1444548, 0.5019608, 1, 0, 1,
-0.6412748, 0.344452, -0.5150804, 0.4941176, 1, 0, 1,
-0.630951, 0.1136386, -0.9391215, 0.4862745, 1, 0, 1,
-0.6293844, 0.4114976, -1.227949, 0.4823529, 1, 0, 1,
-0.6237364, 0.5912182, -1.620614, 0.4745098, 1, 0, 1,
-0.6230409, 0.860372, -1.693934, 0.4705882, 1, 0, 1,
-0.6229753, 0.08194319, -2.355909, 0.4627451, 1, 0, 1,
-0.6225121, -0.3212721, -1.877411, 0.4588235, 1, 0, 1,
-0.6224803, 0.4958901, -0.7711736, 0.4509804, 1, 0, 1,
-0.6221517, 1.214086, 1.023513, 0.4470588, 1, 0, 1,
-0.6219346, -0.7824206, -2.056042, 0.4392157, 1, 0, 1,
-0.6216131, 1.752643, -0.4818192, 0.4352941, 1, 0, 1,
-0.6195067, -1.971604, -4.874267, 0.427451, 1, 0, 1,
-0.6182032, -0.2455601, -0.3632499, 0.4235294, 1, 0, 1,
-0.6180032, 1.212967, -0.628903, 0.4156863, 1, 0, 1,
-0.6173024, 0.1979722, -1.866504, 0.4117647, 1, 0, 1,
-0.6095596, 0.6035796, -1.407737, 0.4039216, 1, 0, 1,
-0.6092665, 1.064059, -0.6086537, 0.3960784, 1, 0, 1,
-0.6078488, 1.53405, -1.947178, 0.3921569, 1, 0, 1,
-0.6019319, 0.2469491, -1.42003, 0.3843137, 1, 0, 1,
-0.6005031, -0.5896382, -1.611471, 0.3803922, 1, 0, 1,
-0.5885996, 0.5566543, -0.8016396, 0.372549, 1, 0, 1,
-0.5881221, 0.3462108, -2.067833, 0.3686275, 1, 0, 1,
-0.5869164, 0.4243352, -1.252463, 0.3607843, 1, 0, 1,
-0.5867686, -0.3383622, -2.349065, 0.3568628, 1, 0, 1,
-0.5779599, 1.213983, -0.8863933, 0.3490196, 1, 0, 1,
-0.57688, 2.127757, -0.5455703, 0.345098, 1, 0, 1,
-0.5732945, 1.139526, -1.029128, 0.3372549, 1, 0, 1,
-0.5675601, 1.636661, -0.8354031, 0.3333333, 1, 0, 1,
-0.5640385, 1.878784, -0.9190089, 0.3254902, 1, 0, 1,
-0.5630983, 0.143474, -1.591152, 0.3215686, 1, 0, 1,
-0.5589699, -0.2483828, -2.325757, 0.3137255, 1, 0, 1,
-0.555137, -0.2537958, -0.7019849, 0.3098039, 1, 0, 1,
-0.5478602, 0.1466422, -1.290577, 0.3019608, 1, 0, 1,
-0.5473083, -0.2097079, -0.8879049, 0.2941177, 1, 0, 1,
-0.5332037, 0.01252725, -2.138387, 0.2901961, 1, 0, 1,
-0.5300996, -0.5531339, -4.254495, 0.282353, 1, 0, 1,
-0.5234091, -2.30764, -2.722988, 0.2784314, 1, 0, 1,
-0.5098811, 1.335514, -1.216081, 0.2705882, 1, 0, 1,
-0.5092461, -0.02566262, -2.059294, 0.2666667, 1, 0, 1,
-0.5019451, 0.6990497, -0.6120313, 0.2588235, 1, 0, 1,
-0.4846319, -0.09439471, -1.647913, 0.254902, 1, 0, 1,
-0.4840049, 0.3691834, 1.511352, 0.2470588, 1, 0, 1,
-0.4833316, -0.4875285, -1.806278, 0.2431373, 1, 0, 1,
-0.4783105, 2.80792, -1.112141, 0.2352941, 1, 0, 1,
-0.4781313, 1.32021, -0.1654059, 0.2313726, 1, 0, 1,
-0.4737185, 1.574686, -0.009164845, 0.2235294, 1, 0, 1,
-0.472187, -0.3190665, -1.75299, 0.2196078, 1, 0, 1,
-0.4719068, 0.2247696, -0.4622579, 0.2117647, 1, 0, 1,
-0.4671594, -0.9748583, -1.036236, 0.2078431, 1, 0, 1,
-0.4662511, -1.132801, -4.255064, 0.2, 1, 0, 1,
-0.4618964, 1.402492, 0.6061488, 0.1921569, 1, 0, 1,
-0.4606161, -0.7871016, -3.517447, 0.1882353, 1, 0, 1,
-0.4532953, -1.066006, -1.799399, 0.1803922, 1, 0, 1,
-0.4515702, 0.8648071, 0.04122887, 0.1764706, 1, 0, 1,
-0.449568, 0.4990067, -0.2765181, 0.1686275, 1, 0, 1,
-0.4475114, -0.3876443, -2.950614, 0.1647059, 1, 0, 1,
-0.4432287, 0.857349, -1.668619, 0.1568628, 1, 0, 1,
-0.4420181, 1.042559, -0.5465711, 0.1529412, 1, 0, 1,
-0.442009, 0.4558768, -0.0568004, 0.145098, 1, 0, 1,
-0.44155, 0.3220707, -1.452478, 0.1411765, 1, 0, 1,
-0.4410281, -0.3467905, -3.130261, 0.1333333, 1, 0, 1,
-0.4362399, 2.062989, 0.3760702, 0.1294118, 1, 0, 1,
-0.4356967, -1.506157, -3.020272, 0.1215686, 1, 0, 1,
-0.4344002, -0.4411334, -3.534726, 0.1176471, 1, 0, 1,
-0.4326462, -0.06872109, -1.573865, 0.1098039, 1, 0, 1,
-0.4264741, 0.0290715, -1.896842, 0.1058824, 1, 0, 1,
-0.4258856, 0.9944015, -1.459905, 0.09803922, 1, 0, 1,
-0.4248866, 1.175621, -1.495763, 0.09019608, 1, 0, 1,
-0.4232377, -2.271007, -4.946443, 0.08627451, 1, 0, 1,
-0.4127497, 0.4351991, -0.2788451, 0.07843138, 1, 0, 1,
-0.409551, -0.3487635, -1.903636, 0.07450981, 1, 0, 1,
-0.4052047, 0.787577, -0.428794, 0.06666667, 1, 0, 1,
-0.4025163, -1.356803, -3.288128, 0.0627451, 1, 0, 1,
-0.393149, -1.127587, -3.071453, 0.05490196, 1, 0, 1,
-0.3765976, -1.182569, -4.371477, 0.05098039, 1, 0, 1,
-0.3643201, -0.2601552, -1.900466, 0.04313726, 1, 0, 1,
-0.3642101, -1.431709, -2.97755, 0.03921569, 1, 0, 1,
-0.3552439, -1.099143, -1.173766, 0.03137255, 1, 0, 1,
-0.3547112, 1.500924, -0.8609893, 0.02745098, 1, 0, 1,
-0.353876, 0.5683523, 0.5592465, 0.01960784, 1, 0, 1,
-0.3522226, 1.755246, -0.5937274, 0.01568628, 1, 0, 1,
-0.3511599, 1.154753, 0.2350728, 0.007843138, 1, 0, 1,
-0.3485333, -0.732897, -2.931916, 0.003921569, 1, 0, 1,
-0.3465207, -0.3369305, -3.10061, 0, 1, 0.003921569, 1,
-0.3459525, 0.01169057, -2.306166, 0, 1, 0.01176471, 1,
-0.3457603, 0.4106083, -2.157305, 0, 1, 0.01568628, 1,
-0.3432231, 0.1049011, -2.183894, 0, 1, 0.02352941, 1,
-0.3390199, 0.5376441, 0.1702563, 0, 1, 0.02745098, 1,
-0.3357784, 0.8186767, 0.7900044, 0, 1, 0.03529412, 1,
-0.3326952, 2.625129, 0.5877081, 0, 1, 0.03921569, 1,
-0.3290721, -0.5855179, -2.814663, 0, 1, 0.04705882, 1,
-0.3212669, -1.058456, -2.68659, 0, 1, 0.05098039, 1,
-0.3187328, 0.07684334, -2.039196, 0, 1, 0.05882353, 1,
-0.3166784, 0.8950291, -0.7722878, 0, 1, 0.0627451, 1,
-0.3124682, 1.37767, 0.2571285, 0, 1, 0.07058824, 1,
-0.3062856, 0.1273696, -2.137716, 0, 1, 0.07450981, 1,
-0.3050671, 1.183812, 1.248532, 0, 1, 0.08235294, 1,
-0.3019174, 1.50201, 0.1810436, 0, 1, 0.08627451, 1,
-0.3015893, 1.494914, 1.894201, 0, 1, 0.09411765, 1,
-0.2972473, 1.104228, -0.4055854, 0, 1, 0.1019608, 1,
-0.2940024, 0.5691367, -0.1571919, 0, 1, 0.1058824, 1,
-0.2887294, -1.378746, -2.171497, 0, 1, 0.1137255, 1,
-0.286341, 1.166436, -0.5751369, 0, 1, 0.1176471, 1,
-0.2861398, -0.94767, -2.84345, 0, 1, 0.1254902, 1,
-0.283974, -1.472056, -3.779962, 0, 1, 0.1294118, 1,
-0.2827895, 0.9040822, -0.2012086, 0, 1, 0.1372549, 1,
-0.2824855, 0.2294189, -2.258475, 0, 1, 0.1411765, 1,
-0.2824519, 1.485933, 1.331009, 0, 1, 0.1490196, 1,
-0.2791256, 1.115449, 0.4700963, 0, 1, 0.1529412, 1,
-0.2789719, -1.003358, -3.539223, 0, 1, 0.1607843, 1,
-0.2766812, 0.3045756, 0.05185071, 0, 1, 0.1647059, 1,
-0.2755566, -1.566729, -4.685082, 0, 1, 0.172549, 1,
-0.2750604, -0.6273651, -1.542025, 0, 1, 0.1764706, 1,
-0.2692478, -1.224258, -2.295681, 0, 1, 0.1843137, 1,
-0.2685825, 2.709765, -1.381608, 0, 1, 0.1882353, 1,
-0.2602122, 0.9313666, 1.085958, 0, 1, 0.1960784, 1,
-0.2600938, -0.2655527, -2.704902, 0, 1, 0.2039216, 1,
-0.257636, -0.9054154, -1.226285, 0, 1, 0.2078431, 1,
-0.2510318, -1.224297, -4.903405, 0, 1, 0.2156863, 1,
-0.2493565, -0.6162804, -2.532984, 0, 1, 0.2196078, 1,
-0.2479472, -0.2200078, -1.624291, 0, 1, 0.227451, 1,
-0.2448202, 1.422223, 0.786741, 0, 1, 0.2313726, 1,
-0.2421762, -0.3651228, -2.958331, 0, 1, 0.2392157, 1,
-0.2403063, 0.4525236, 0.6731421, 0, 1, 0.2431373, 1,
-0.2376074, 0.4615898, -0.5651078, 0, 1, 0.2509804, 1,
-0.2363718, 0.1814666, -1.613218, 0, 1, 0.254902, 1,
-0.2345532, 1.977204, -0.3500471, 0, 1, 0.2627451, 1,
-0.2343784, 0.4592262, -2.157395, 0, 1, 0.2666667, 1,
-0.2259896, 0.2014617, -1.033358, 0, 1, 0.2745098, 1,
-0.2243235, -0.4962292, -2.385884, 0, 1, 0.2784314, 1,
-0.222893, -2.315522, -3.663332, 0, 1, 0.2862745, 1,
-0.2163735, -0.05297567, -2.332297, 0, 1, 0.2901961, 1,
-0.2155904, 0.218337, -1.479978, 0, 1, 0.2980392, 1,
-0.2138305, 0.81064, -1.404777, 0, 1, 0.3058824, 1,
-0.2085556, -0.1500646, -0.6887619, 0, 1, 0.3098039, 1,
-0.2079935, 1.824079, 0.4813378, 0, 1, 0.3176471, 1,
-0.2038217, 0.4167305, 0.7279326, 0, 1, 0.3215686, 1,
-0.1970708, 1.250499, -0.676606, 0, 1, 0.3294118, 1,
-0.1953495, -0.672069, -4.221025, 0, 1, 0.3333333, 1,
-0.1913697, -0.1209007, -1.152268, 0, 1, 0.3411765, 1,
-0.1881774, -0.7277828, -3.28282, 0, 1, 0.345098, 1,
-0.1859734, -1.976815, -2.12869, 0, 1, 0.3529412, 1,
-0.1846308, -1.212547, -4.833251, 0, 1, 0.3568628, 1,
-0.1842229, 0.8084148, -2.612816, 0, 1, 0.3647059, 1,
-0.1833662, -0.0026976, -2.645681, 0, 1, 0.3686275, 1,
-0.1751539, 0.8422329, -0.3946356, 0, 1, 0.3764706, 1,
-0.1656986, -0.2131237, -2.858444, 0, 1, 0.3803922, 1,
-0.1650579, -1.689462, -2.620987, 0, 1, 0.3882353, 1,
-0.1649365, -0.7672098, -1.927718, 0, 1, 0.3921569, 1,
-0.157654, 0.008919956, -0.2838912, 0, 1, 0.4, 1,
-0.1576368, 1.648965, -2.09478, 0, 1, 0.4078431, 1,
-0.1539246, -0.3886953, -2.464519, 0, 1, 0.4117647, 1,
-0.1523965, -0.07700934, -3.114361, 0, 1, 0.4196078, 1,
-0.1503754, 0.9709466, -1.229667, 0, 1, 0.4235294, 1,
-0.149108, -0.222155, -1.709212, 0, 1, 0.4313726, 1,
-0.1443381, 1.242229, 0.04155533, 0, 1, 0.4352941, 1,
-0.1441058, -0.2287587, -3.345819, 0, 1, 0.4431373, 1,
-0.1404071, -0.1062305, -2.287893, 0, 1, 0.4470588, 1,
-0.1317125, 1.43557, 0.2895022, 0, 1, 0.454902, 1,
-0.1294754, -0.154196, -4.053529, 0, 1, 0.4588235, 1,
-0.122208, 1.131735, -0.988833, 0, 1, 0.4666667, 1,
-0.1212261, 0.1056512, -0.8368779, 0, 1, 0.4705882, 1,
-0.118413, 1.312429, -0.9283469, 0, 1, 0.4784314, 1,
-0.1168798, -1.147009, -3.575051, 0, 1, 0.4823529, 1,
-0.1126707, 0.5781913, -1.420541, 0, 1, 0.4901961, 1,
-0.1124689, 2.321259, 0.2186242, 0, 1, 0.4941176, 1,
-0.1119895, -0.5628719, -1.610711, 0, 1, 0.5019608, 1,
-0.1112772, 0.5194882, 1.163888, 0, 1, 0.509804, 1,
-0.1111815, -0.1788728, -2.820547, 0, 1, 0.5137255, 1,
-0.1108456, 0.114425, 0.2512373, 0, 1, 0.5215687, 1,
-0.1097082, 1.458848, -0.3343583, 0, 1, 0.5254902, 1,
-0.1092123, -1.123314, -3.926828, 0, 1, 0.5333334, 1,
-0.1084335, 0.1264195, -2.493259, 0, 1, 0.5372549, 1,
-0.1066846, -0.4843679, -2.800461, 0, 1, 0.5450981, 1,
-0.1049771, -0.7589525, -3.388355, 0, 1, 0.5490196, 1,
-0.09383519, -1.113413, -0.9879019, 0, 1, 0.5568628, 1,
-0.09203169, 0.4839617, 0.2144198, 0, 1, 0.5607843, 1,
-0.09103877, -2.290873, -1.507264, 0, 1, 0.5686275, 1,
-0.09060126, 1.066117, -0.2450408, 0, 1, 0.572549, 1,
-0.08827861, 0.8697532, -0.9616444, 0, 1, 0.5803922, 1,
-0.08598892, 0.5578895, 0.8671691, 0, 1, 0.5843138, 1,
-0.08597974, 1.096173, 0.3677291, 0, 1, 0.5921569, 1,
-0.08352128, 0.6437735, -0.1777811, 0, 1, 0.5960785, 1,
-0.08019743, 0.5787078, -0.1459255, 0, 1, 0.6039216, 1,
-0.08013726, 1.007548, -1.011814, 0, 1, 0.6117647, 1,
-0.08008585, -1.628297, -3.114133, 0, 1, 0.6156863, 1,
-0.07694419, -1.348526, -1.691417, 0, 1, 0.6235294, 1,
-0.07669286, -1.18273, -4.487387, 0, 1, 0.627451, 1,
-0.07625823, 0.7109969, 0.2673853, 0, 1, 0.6352941, 1,
-0.07519837, 0.3310129, 0.3647051, 0, 1, 0.6392157, 1,
-0.07181606, -0.05736902, -1.567881, 0, 1, 0.6470588, 1,
-0.0705042, 2.745633, -1.079321, 0, 1, 0.6509804, 1,
-0.06675779, 0.1146481, -0.1593364, 0, 1, 0.6588235, 1,
-0.06589548, -0.08169389, -2.591927, 0, 1, 0.6627451, 1,
-0.05830307, -2.376868, -2.785056, 0, 1, 0.6705883, 1,
-0.05586559, -0.101828, -4.356171, 0, 1, 0.6745098, 1,
-0.05513572, -0.8330336, -0.9431519, 0, 1, 0.682353, 1,
-0.0514099, -3.606008, -3.103774, 0, 1, 0.6862745, 1,
-0.05140758, 0.03584644, -1.706007, 0, 1, 0.6941177, 1,
-0.05127306, 1.165323, 0.9678978, 0, 1, 0.7019608, 1,
-0.04905812, -0.829994, -2.671793, 0, 1, 0.7058824, 1,
-0.04603323, -0.5407267, -1.348507, 0, 1, 0.7137255, 1,
-0.03782491, 1.063869, -0.6635631, 0, 1, 0.7176471, 1,
-0.02546431, 2.083872, -0.6827523, 0, 1, 0.7254902, 1,
-0.0240744, -1.193051, -4.492453, 0, 1, 0.7294118, 1,
-0.02349361, -1.88941, -2.913959, 0, 1, 0.7372549, 1,
-0.02043733, -0.9878964, -4.786614, 0, 1, 0.7411765, 1,
-0.01956973, -0.1355474, -3.185328, 0, 1, 0.7490196, 1,
-0.01745601, 1.36399, -0.8972228, 0, 1, 0.7529412, 1,
-0.01621329, -0.3824906, -3.800448, 0, 1, 0.7607843, 1,
-0.01267052, -0.06314645, -1.804161, 0, 1, 0.7647059, 1,
-0.01220817, 0.6187777, 0.0423575, 0, 1, 0.772549, 1,
-0.01028462, -1.127655, -4.034194, 0, 1, 0.7764706, 1,
-0.00980927, 0.1158306, -0.7948853, 0, 1, 0.7843137, 1,
-0.008282016, 0.606377, 0.2044041, 0, 1, 0.7882353, 1,
-0.00638233, -0.4893227, -3.970447, 0, 1, 0.7960784, 1,
-0.004767622, -1.227643, -4.69992, 0, 1, 0.8039216, 1,
-0.003662977, -0.3867341, -0.6588749, 0, 1, 0.8078431, 1,
-0.002701816, 1.083148, -0.3042389, 0, 1, 0.8156863, 1,
0.0003243575, -0.7875211, 4.696373, 0, 1, 0.8196079, 1,
0.005131163, 1.743252, 1.686973, 0, 1, 0.827451, 1,
0.006309866, -0.9437674, 4.036806, 0, 1, 0.8313726, 1,
0.01228714, 0.5209518, -2.726128, 0, 1, 0.8392157, 1,
0.01264804, 0.7479609, 0.4892831, 0, 1, 0.8431373, 1,
0.01291406, 0.9453856, -0.3754325, 0, 1, 0.8509804, 1,
0.01397006, -0.06505432, 1.208068, 0, 1, 0.854902, 1,
0.01719591, 2.281766, 0.1238554, 0, 1, 0.8627451, 1,
0.01988177, 0.22583, 1.573956, 0, 1, 0.8666667, 1,
0.0224968, 0.9740564, 1.418902, 0, 1, 0.8745098, 1,
0.02482277, -0.6418509, 4.685274, 0, 1, 0.8784314, 1,
0.02652504, 0.4913057, 1.514349, 0, 1, 0.8862745, 1,
0.02735897, -0.1906646, 3.539772, 0, 1, 0.8901961, 1,
0.03176001, 0.9021953, 0.5774167, 0, 1, 0.8980392, 1,
0.03306773, 0.6000889, -0.6509016, 0, 1, 0.9058824, 1,
0.03634013, 0.08393636, 0.189708, 0, 1, 0.9098039, 1,
0.03683972, 1.486318, -0.05364445, 0, 1, 0.9176471, 1,
0.03877147, 0.2610446, -1.995198, 0, 1, 0.9215686, 1,
0.04172257, -0.9399881, 2.774717, 0, 1, 0.9294118, 1,
0.04259631, -0.3796166, 2.603674, 0, 1, 0.9333333, 1,
0.04644442, 0.8330818, 0.9234024, 0, 1, 0.9411765, 1,
0.05113367, 0.6545498, 0.05763946, 0, 1, 0.945098, 1,
0.05501194, -0.3151957, 1.60384, 0, 1, 0.9529412, 1,
0.05577592, 0.007029984, 1.37884, 0, 1, 0.9568627, 1,
0.05633641, -0.9696265, 3.742817, 0, 1, 0.9647059, 1,
0.06092104, 0.4806742, -0.4966674, 0, 1, 0.9686275, 1,
0.06126479, 1.032701, -0.2179133, 0, 1, 0.9764706, 1,
0.06161619, -0.2408124, 3.129212, 0, 1, 0.9803922, 1,
0.06627016, -1.697947, 2.624723, 0, 1, 0.9882353, 1,
0.06738601, 0.8247193, 1.407071, 0, 1, 0.9921569, 1,
0.07037221, -0.6475548, 3.398715, 0, 1, 1, 1,
0.07161578, 1.250436, -0.4905498, 0, 0.9921569, 1, 1,
0.07438894, -0.8629056, 3.017744, 0, 0.9882353, 1, 1,
0.07827404, 0.2681521, 0.280491, 0, 0.9803922, 1, 1,
0.07913578, 1.263591, -0.06966457, 0, 0.9764706, 1, 1,
0.07939474, -1.517037, 3.0713, 0, 0.9686275, 1, 1,
0.07971773, -1.02272, 2.24893, 0, 0.9647059, 1, 1,
0.08150354, -0.3211381, 4.218079, 0, 0.9568627, 1, 1,
0.08160929, 0.3311909, -0.509681, 0, 0.9529412, 1, 1,
0.08309384, 1.714588, 0.4319502, 0, 0.945098, 1, 1,
0.08352385, -1.395853, 3.184228, 0, 0.9411765, 1, 1,
0.08356877, -0.2244615, 2.946671, 0, 0.9333333, 1, 1,
0.08426227, -0.7284644, 2.765232, 0, 0.9294118, 1, 1,
0.08478571, -0.07252187, 2.342789, 0, 0.9215686, 1, 1,
0.08614591, -0.4367372, 1.470493, 0, 0.9176471, 1, 1,
0.09607383, 1.132868, 0.2334649, 0, 0.9098039, 1, 1,
0.09793416, -1.681913, 4.57645, 0, 0.9058824, 1, 1,
0.1061248, 1.069965, -0.6639786, 0, 0.8980392, 1, 1,
0.1085373, -0.3113991, 4.528807, 0, 0.8901961, 1, 1,
0.111054, 0.6235839, -0.1350684, 0, 0.8862745, 1, 1,
0.1111484, 0.9573495, -0.1709591, 0, 0.8784314, 1, 1,
0.1117474, 1.322639, -0.007218003, 0, 0.8745098, 1, 1,
0.1155598, -0.7824916, 3.213685, 0, 0.8666667, 1, 1,
0.1160946, 0.5852081, -0.005920088, 0, 0.8627451, 1, 1,
0.1234495, -0.8793495, 1.797627, 0, 0.854902, 1, 1,
0.1302866, 0.3353154, -0.01732355, 0, 0.8509804, 1, 1,
0.1344118, 0.2615288, 1.261849, 0, 0.8431373, 1, 1,
0.1384492, -0.8488067, 3.80682, 0, 0.8392157, 1, 1,
0.1400224, 0.8760769, 0.01330165, 0, 0.8313726, 1, 1,
0.1408072, 0.2472948, 0.3441934, 0, 0.827451, 1, 1,
0.1410248, -1.345774, 3.96198, 0, 0.8196079, 1, 1,
0.1434387, -0.5193527, 3.519419, 0, 0.8156863, 1, 1,
0.1463174, 0.9027758, -0.3849579, 0, 0.8078431, 1, 1,
0.150869, 1.116249, 0.4040283, 0, 0.8039216, 1, 1,
0.1531412, -0.7509387, 4.211258, 0, 0.7960784, 1, 1,
0.1546058, 0.762237, -0.2536655, 0, 0.7882353, 1, 1,
0.1549776, -1.218085, 4.056692, 0, 0.7843137, 1, 1,
0.155022, 0.149773, 1.386235, 0, 0.7764706, 1, 1,
0.1571456, 1.93001, 1.208423, 0, 0.772549, 1, 1,
0.158365, -0.5852464, 4.738254, 0, 0.7647059, 1, 1,
0.1586147, -1.736207, 4.209548, 0, 0.7607843, 1, 1,
0.1596775, 0.492222, -0.5006832, 0, 0.7529412, 1, 1,
0.1619496, 2.319581, 0.4634149, 0, 0.7490196, 1, 1,
0.1650478, -0.446375, 1.24847, 0, 0.7411765, 1, 1,
0.165609, -0.9261765, 4.739074, 0, 0.7372549, 1, 1,
0.1677263, 0.4361187, 0.8825913, 0, 0.7294118, 1, 1,
0.1679882, -2.139751, 2.525993, 0, 0.7254902, 1, 1,
0.1706388, -0.08811549, 1.888053, 0, 0.7176471, 1, 1,
0.1767368, -1.115002, 1.653481, 0, 0.7137255, 1, 1,
0.178691, 0.847315, 1.099139, 0, 0.7058824, 1, 1,
0.1793367, 1.063592, 0.4951158, 0, 0.6980392, 1, 1,
0.180747, 1.098608, -2.059264, 0, 0.6941177, 1, 1,
0.1807887, -1.428086, 3.182374, 0, 0.6862745, 1, 1,
0.1808038, 0.4482349, -0.2376225, 0, 0.682353, 1, 1,
0.1835194, -0.05907807, 2.465037, 0, 0.6745098, 1, 1,
0.1851868, 0.03755437, 1.340203, 0, 0.6705883, 1, 1,
0.1871726, 0.1349422, -1.438181, 0, 0.6627451, 1, 1,
0.1884456, 1.717547, 0.7455634, 0, 0.6588235, 1, 1,
0.188998, 0.8377191, -0.3385227, 0, 0.6509804, 1, 1,
0.1935488, -0.02326006, 1.673673, 0, 0.6470588, 1, 1,
0.1944896, -0.1266512, 1.713708, 0, 0.6392157, 1, 1,
0.1951002, 1.061226, -1.141489, 0, 0.6352941, 1, 1,
0.2043845, 0.1999163, 1.984535, 0, 0.627451, 1, 1,
0.2069869, 0.5639553, -0.02537275, 0, 0.6235294, 1, 1,
0.2080781, 0.4590012, -0.06606338, 0, 0.6156863, 1, 1,
0.2084761, -1.33303, 1.735827, 0, 0.6117647, 1, 1,
0.2098777, -0.4597009, 3.355105, 0, 0.6039216, 1, 1,
0.216926, 0.5023508, 1.599554, 0, 0.5960785, 1, 1,
0.2179677, 0.1769392, 0.6094597, 0, 0.5921569, 1, 1,
0.2234729, -0.2849165, 5.154678, 0, 0.5843138, 1, 1,
0.2268897, -0.5241746, 0.8805721, 0, 0.5803922, 1, 1,
0.2280392, 0.7431126, 1.435887, 0, 0.572549, 1, 1,
0.2287033, 0.9478786, 1.063556, 0, 0.5686275, 1, 1,
0.2309005, 2.04694, 1.378262, 0, 0.5607843, 1, 1,
0.2334008, -0.3919694, 3.397468, 0, 0.5568628, 1, 1,
0.2337576, -1.760637, 2.415815, 0, 0.5490196, 1, 1,
0.2352741, 0.7019767, 0.7553901, 0, 0.5450981, 1, 1,
0.2378857, -0.7541003, 2.271537, 0, 0.5372549, 1, 1,
0.2417769, 2.814723, -0.3763876, 0, 0.5333334, 1, 1,
0.2430159, 2.2038, -0.8977194, 0, 0.5254902, 1, 1,
0.250037, -2.8452, 3.796731, 0, 0.5215687, 1, 1,
0.2518809, -1.931343, 2.349781, 0, 0.5137255, 1, 1,
0.2558478, -0.1375954, 2.996629, 0, 0.509804, 1, 1,
0.256501, -0.8323637, 1.608529, 0, 0.5019608, 1, 1,
0.2667665, -1.421278, 3.161946, 0, 0.4941176, 1, 1,
0.2763592, -0.006158683, 0.8505672, 0, 0.4901961, 1, 1,
0.2845334, 1.184863, 0.7750426, 0, 0.4823529, 1, 1,
0.28709, 1.171558, -0.4061546, 0, 0.4784314, 1, 1,
0.2885846, 1.71552, 2.001401, 0, 0.4705882, 1, 1,
0.2907494, -0.08099346, 2.266941, 0, 0.4666667, 1, 1,
0.2996197, -0.8397226, 2.623295, 0, 0.4588235, 1, 1,
0.3000687, -0.5489577, 1.298346, 0, 0.454902, 1, 1,
0.3076419, 0.2280536, 0.2933058, 0, 0.4470588, 1, 1,
0.3169733, -0.9660368, 2.638294, 0, 0.4431373, 1, 1,
0.3255353, -0.428304, 3.605704, 0, 0.4352941, 1, 1,
0.3280062, -0.007016538, 2.272094, 0, 0.4313726, 1, 1,
0.3290794, 0.1875786, 1.389864, 0, 0.4235294, 1, 1,
0.3294466, -0.9299489, 1.940155, 0, 0.4196078, 1, 1,
0.3321519, 0.6782201, 0.4579066, 0, 0.4117647, 1, 1,
0.332883, 0.1315453, 0.5537344, 0, 0.4078431, 1, 1,
0.3347631, -1.057677, 2.404055, 0, 0.4, 1, 1,
0.3355852, 0.9480363, 1.00573, 0, 0.3921569, 1, 1,
0.3446833, 0.2916683, 0.1981886, 0, 0.3882353, 1, 1,
0.3516419, 2.728729, 0.2327613, 0, 0.3803922, 1, 1,
0.3553669, 1.088643, 0.6363248, 0, 0.3764706, 1, 1,
0.3571704, -0.0002935664, 1.04217, 0, 0.3686275, 1, 1,
0.3624401, 0.191149, -0.4269779, 0, 0.3647059, 1, 1,
0.3661747, -0.187612, 0.6404611, 0, 0.3568628, 1, 1,
0.3663262, 0.6220875, 1.636437, 0, 0.3529412, 1, 1,
0.3680223, 1.62451, -0.2804967, 0, 0.345098, 1, 1,
0.3727678, -0.5517199, 4.473855, 0, 0.3411765, 1, 1,
0.3829815, 1.984895, 1.068378, 0, 0.3333333, 1, 1,
0.3834677, 1.611867, 0.09963186, 0, 0.3294118, 1, 1,
0.3884187, 0.5966612, 1.539095, 0, 0.3215686, 1, 1,
0.3924968, -0.4735884, 1.547758, 0, 0.3176471, 1, 1,
0.3938043, 0.654673, -0.6282807, 0, 0.3098039, 1, 1,
0.3948095, 1.219074, 2.589835, 0, 0.3058824, 1, 1,
0.3978926, 0.7700184, 1.597148, 0, 0.2980392, 1, 1,
0.399339, -1.044401, 2.885253, 0, 0.2901961, 1, 1,
0.4003952, -0.7450769, 2.09968, 0, 0.2862745, 1, 1,
0.4059177, 0.4681963, -0.06580478, 0, 0.2784314, 1, 1,
0.4065948, 0.3880976, 1.317753, 0, 0.2745098, 1, 1,
0.4090951, 0.3966619, 0.6453506, 0, 0.2666667, 1, 1,
0.4109126, -1.007736, 2.960204, 0, 0.2627451, 1, 1,
0.4116848, 1.012829, 0.7499518, 0, 0.254902, 1, 1,
0.4124531, -0.5903105, 3.251323, 0, 0.2509804, 1, 1,
0.4153088, 0.01236629, 1.006312, 0, 0.2431373, 1, 1,
0.4182751, -1.486111, 2.854325, 0, 0.2392157, 1, 1,
0.4182771, -0.2099988, 2.810029, 0, 0.2313726, 1, 1,
0.4213585, -0.1299325, 2.981098, 0, 0.227451, 1, 1,
0.4219298, 0.952953, -0.08425198, 0, 0.2196078, 1, 1,
0.4273737, 1.406371, -0.3797747, 0, 0.2156863, 1, 1,
0.4275761, -1.377783, 3.767114, 0, 0.2078431, 1, 1,
0.4336428, 0.4356146, 2.16351, 0, 0.2039216, 1, 1,
0.4339747, 1.326291, 0.8688517, 0, 0.1960784, 1, 1,
0.434257, -0.813818, 2.378476, 0, 0.1882353, 1, 1,
0.4359442, -1.484202, 3.693207, 0, 0.1843137, 1, 1,
0.4371141, -0.1211651, 2.331744, 0, 0.1764706, 1, 1,
0.4456013, 0.1866102, 0.4604855, 0, 0.172549, 1, 1,
0.4456737, -0.3033019, 0.9529496, 0, 0.1647059, 1, 1,
0.4558505, 0.4718063, 1.674023, 0, 0.1607843, 1, 1,
0.4655292, -0.04720879, 4.31205, 0, 0.1529412, 1, 1,
0.4661964, -0.1670972, 3.617446, 0, 0.1490196, 1, 1,
0.4672039, 0.7429014, 1.975678, 0, 0.1411765, 1, 1,
0.4701773, -0.53985, 2.441092, 0, 0.1372549, 1, 1,
0.4731, -0.2078205, 1.489859, 0, 0.1294118, 1, 1,
0.4733574, -0.7843975, 2.256389, 0, 0.1254902, 1, 1,
0.4776623, -0.9361721, 3.931509, 0, 0.1176471, 1, 1,
0.4844841, 1.500017, 2.124856, 0, 0.1137255, 1, 1,
0.4899635, 0.4830927, 1.366515, 0, 0.1058824, 1, 1,
0.4924882, -1.385457, 0.6973088, 0, 0.09803922, 1, 1,
0.4941102, -0.4308138, 1.165964, 0, 0.09411765, 1, 1,
0.4948477, 1.971663, 0.6433646, 0, 0.08627451, 1, 1,
0.4976966, -1.958729, 3.316645, 0, 0.08235294, 1, 1,
0.5009334, 2.205652, -0.4458881, 0, 0.07450981, 1, 1,
0.5049024, 1.529857, 0.5118446, 0, 0.07058824, 1, 1,
0.5051671, 0.835631, -0.7935411, 0, 0.0627451, 1, 1,
0.5055711, 2.270283, 1.614804, 0, 0.05882353, 1, 1,
0.5103665, 1.535874, 1.650881, 0, 0.05098039, 1, 1,
0.5108012, -0.6142242, 1.710183, 0, 0.04705882, 1, 1,
0.5131813, -1.590293, 1.093083, 0, 0.03921569, 1, 1,
0.5158336, 0.9552556, -0.5467458, 0, 0.03529412, 1, 1,
0.5163969, -0.1583265, 2.455041, 0, 0.02745098, 1, 1,
0.5166162, -1.169771, 2.849653, 0, 0.02352941, 1, 1,
0.5211202, 0.9205527, 0.6063873, 0, 0.01568628, 1, 1,
0.5272346, -1.453388, 2.702275, 0, 0.01176471, 1, 1,
0.5307044, 0.08579231, 2.061002, 0, 0.003921569, 1, 1,
0.5321486, -0.5821279, 1.797446, 0.003921569, 0, 1, 1,
0.5350113, 2.001261, 0.5398567, 0.007843138, 0, 1, 1,
0.5354456, 0.02287944, 3.34323, 0.01568628, 0, 1, 1,
0.5374727, -0.5116513, 2.269688, 0.01960784, 0, 1, 1,
0.5384695, 0.1086194, 1.49399, 0.02745098, 0, 1, 1,
0.5431764, 0.459973, 1.502856, 0.03137255, 0, 1, 1,
0.5455526, -0.5370663, 0.8401039, 0.03921569, 0, 1, 1,
0.5479399, -1.135769, 3.16487, 0.04313726, 0, 1, 1,
0.5484697, 0.7407027, 0.7961451, 0.05098039, 0, 1, 1,
0.5488392, 0.947444, 0.7158586, 0.05490196, 0, 1, 1,
0.5490071, -1.934139, 1.607118, 0.0627451, 0, 1, 1,
0.5512503, 1.478035, -0.2526542, 0.06666667, 0, 1, 1,
0.5643989, 0.6345836, 1.983682, 0.07450981, 0, 1, 1,
0.5644739, -0.1578181, 0.5580431, 0.07843138, 0, 1, 1,
0.5673459, -0.3105091, 2.140231, 0.08627451, 0, 1, 1,
0.5710029, 0.5989095, 2.451518, 0.09019608, 0, 1, 1,
0.5712106, -0.4565215, 1.902482, 0.09803922, 0, 1, 1,
0.5720225, -1.28391, 4.068594, 0.1058824, 0, 1, 1,
0.5780334, 0.915486, 1.304053, 0.1098039, 0, 1, 1,
0.5820498, 0.8472056, -1.559809, 0.1176471, 0, 1, 1,
0.5826522, 2.077994, 0.7453906, 0.1215686, 0, 1, 1,
0.6003745, -0.9467902, 2.625487, 0.1294118, 0, 1, 1,
0.6019994, 1.694293, -0.3111248, 0.1333333, 0, 1, 1,
0.6091514, 0.5724424, 1.789563, 0.1411765, 0, 1, 1,
0.6106167, 0.0244269, 4.311973, 0.145098, 0, 1, 1,
0.611374, 1.520813, -0.02479898, 0.1529412, 0, 1, 1,
0.6163499, 0.7262298, 0.4438453, 0.1568628, 0, 1, 1,
0.6171483, -1.711132, 4.096778, 0.1647059, 0, 1, 1,
0.6256614, 1.109742, 1.870069, 0.1686275, 0, 1, 1,
0.6273188, -0.2779772, 1.192898, 0.1764706, 0, 1, 1,
0.63118, 0.3312571, 0.7661856, 0.1803922, 0, 1, 1,
0.6328599, -0.249934, 3.381614, 0.1882353, 0, 1, 1,
0.6392626, -1.091628, 2.78305, 0.1921569, 0, 1, 1,
0.6422072, 1.007783, 0.2500609, 0.2, 0, 1, 1,
0.6469764, 0.5739612, 1.608306, 0.2078431, 0, 1, 1,
0.6497141, 0.2077815, -0.1057511, 0.2117647, 0, 1, 1,
0.6524454, 0.3829019, 0.1279442, 0.2196078, 0, 1, 1,
0.654711, -0.6712665, 2.699401, 0.2235294, 0, 1, 1,
0.6563132, 0.1333863, 2.440742, 0.2313726, 0, 1, 1,
0.6627558, 1.486205, 0.1395018, 0.2352941, 0, 1, 1,
0.6629105, -2.951699, 3.8082, 0.2431373, 0, 1, 1,
0.6636354, 0.5107455, 1.196826, 0.2470588, 0, 1, 1,
0.663942, 1.185958, -0.1339198, 0.254902, 0, 1, 1,
0.6644385, 1.149559, 1.243132, 0.2588235, 0, 1, 1,
0.6656232, 1.495462, 1.541991, 0.2666667, 0, 1, 1,
0.6670481, -1.227072, 1.434203, 0.2705882, 0, 1, 1,
0.6725996, 0.887398, -0.07030532, 0.2784314, 0, 1, 1,
0.6742994, -0.02162001, 1.056139, 0.282353, 0, 1, 1,
0.675707, 1.800999, 1.044181, 0.2901961, 0, 1, 1,
0.685898, -0.2213539, 2.032454, 0.2941177, 0, 1, 1,
0.6874844, 1.393576, 0.5892962, 0.3019608, 0, 1, 1,
0.695788, -0.7060764, 1.791537, 0.3098039, 0, 1, 1,
0.7028522, 1.524696, 0.4920302, 0.3137255, 0, 1, 1,
0.7075722, -0.7280237, 1.909529, 0.3215686, 0, 1, 1,
0.7119442, -0.3820396, 2.386862, 0.3254902, 0, 1, 1,
0.7205788, 0.2957642, 2.182022, 0.3333333, 0, 1, 1,
0.7224675, 0.4591902, 0.01335301, 0.3372549, 0, 1, 1,
0.7249988, -0.1674456, 1.356054, 0.345098, 0, 1, 1,
0.7256804, -0.01799433, 0.950552, 0.3490196, 0, 1, 1,
0.734133, 1.302907, 0.869635, 0.3568628, 0, 1, 1,
0.7381438, 1.184791, 1.397291, 0.3607843, 0, 1, 1,
0.7385966, 0.7640096, -0.806776, 0.3686275, 0, 1, 1,
0.7389182, -2.168362, 3.44674, 0.372549, 0, 1, 1,
0.7403662, -0.09048428, 0.5398677, 0.3803922, 0, 1, 1,
0.7405953, 0.0214596, 1.421808, 0.3843137, 0, 1, 1,
0.742148, 0.05905934, 2.02896, 0.3921569, 0, 1, 1,
0.7473053, 1.392437, 0.2351634, 0.3960784, 0, 1, 1,
0.7536149, -0.3044877, -0.857003, 0.4039216, 0, 1, 1,
0.7555947, -0.8693622, 1.730878, 0.4117647, 0, 1, 1,
0.7605457, -0.7008476, 3.8306, 0.4156863, 0, 1, 1,
0.7638382, -0.7406936, 1.371988, 0.4235294, 0, 1, 1,
0.7680624, -1.46736, 2.722504, 0.427451, 0, 1, 1,
0.7714547, -1.066015, 2.182354, 0.4352941, 0, 1, 1,
0.7720879, 0.1328319, 2.068372, 0.4392157, 0, 1, 1,
0.7755517, 1.093275, 1.759258, 0.4470588, 0, 1, 1,
0.7777236, -0.5980875, 3.337812, 0.4509804, 0, 1, 1,
0.7794205, -0.5075772, 1.084591, 0.4588235, 0, 1, 1,
0.7814494, -0.5692509, 2.439615, 0.4627451, 0, 1, 1,
0.7850868, -0.2723122, 2.148127, 0.4705882, 0, 1, 1,
0.7885807, -0.9679064, 3.450625, 0.4745098, 0, 1, 1,
0.8010426, -2.517836, 3.696529, 0.4823529, 0, 1, 1,
0.8024693, 0.2966132, 0.8531543, 0.4862745, 0, 1, 1,
0.8056592, 1.686296, 1.360693, 0.4941176, 0, 1, 1,
0.8092028, -0.738958, 2.12021, 0.5019608, 0, 1, 1,
0.8107687, 0.09317172, 1.2951, 0.5058824, 0, 1, 1,
0.8151867, 0.4044604, -0.887535, 0.5137255, 0, 1, 1,
0.8164785, -0.2933673, 2.624862, 0.5176471, 0, 1, 1,
0.8178719, -1.2866, 2.875308, 0.5254902, 0, 1, 1,
0.8190694, -0.7459778, 4.404953, 0.5294118, 0, 1, 1,
0.820583, 0.503132, 1.35242, 0.5372549, 0, 1, 1,
0.8240116, -0.03464529, 1.142887, 0.5411765, 0, 1, 1,
0.8254009, 0.2835985, 1.971163, 0.5490196, 0, 1, 1,
0.8275844, -0.1464744, 0.2734041, 0.5529412, 0, 1, 1,
0.8325907, 1.713303, -1.412588, 0.5607843, 0, 1, 1,
0.841283, -0.8598846, 1.006902, 0.5647059, 0, 1, 1,
0.8431597, -0.4020557, 1.927599, 0.572549, 0, 1, 1,
0.8443109, -0.02579498, 2.631359, 0.5764706, 0, 1, 1,
0.8487401, -1.600817, 1.662754, 0.5843138, 0, 1, 1,
0.8540987, -1.684222, 3.50742, 0.5882353, 0, 1, 1,
0.8545913, 0.7423781, -0.4881002, 0.5960785, 0, 1, 1,
0.8560556, 0.4422503, 2.213695, 0.6039216, 0, 1, 1,
0.8563992, 0.02228714, 2.356469, 0.6078432, 0, 1, 1,
0.8572767, 0.2191013, -0.7779446, 0.6156863, 0, 1, 1,
0.8622239, 0.5089204, 2.912915, 0.6196079, 0, 1, 1,
0.8655406, -0.2126644, 1.439177, 0.627451, 0, 1, 1,
0.8684813, 0.3575316, 0.8301719, 0.6313726, 0, 1, 1,
0.8745307, -0.3837498, 1.152708, 0.6392157, 0, 1, 1,
0.8746953, -0.3328917, 2.374468, 0.6431373, 0, 1, 1,
0.8770696, 1.827032, -2.312653, 0.6509804, 0, 1, 1,
0.8772864, 0.6987187, 1.591182, 0.654902, 0, 1, 1,
0.8773013, -3.682361, 0.6415334, 0.6627451, 0, 1, 1,
0.8792972, 1.016789, -0.8456513, 0.6666667, 0, 1, 1,
0.8821649, -0.615789, 0.9868433, 0.6745098, 0, 1, 1,
0.8854264, -1.314561, 1.732755, 0.6784314, 0, 1, 1,
0.8876938, -0.676504, 0.7074526, 0.6862745, 0, 1, 1,
0.8906863, 1.072783, 1.512383, 0.6901961, 0, 1, 1,
0.8914877, -1.939151, 1.373555, 0.6980392, 0, 1, 1,
0.8968141, 0.9644977, 0.3152574, 0.7058824, 0, 1, 1,
0.9006886, -0.4616807, 3.032265, 0.7098039, 0, 1, 1,
0.9010268, -0.6751225, 2.011953, 0.7176471, 0, 1, 1,
0.9039864, 1.425265, -0.5065649, 0.7215686, 0, 1, 1,
0.9147764, 0.3060231, 0.9025509, 0.7294118, 0, 1, 1,
0.9236144, 0.9062381, -0.3793814, 0.7333333, 0, 1, 1,
0.9269843, -0.5188321, 2.011154, 0.7411765, 0, 1, 1,
0.9294562, -0.5319176, 2.503911, 0.7450981, 0, 1, 1,
0.9350227, 0.3452254, 2.490154, 0.7529412, 0, 1, 1,
0.9357608, -0.8568035, 2.445193, 0.7568628, 0, 1, 1,
0.9377401, 0.9585687, 1.364651, 0.7647059, 0, 1, 1,
0.9580804, -1.970537, 3.921253, 0.7686275, 0, 1, 1,
0.9638572, -1.062536, 2.349437, 0.7764706, 0, 1, 1,
0.9711249, -0.1754239, 1.533761, 0.7803922, 0, 1, 1,
0.9716293, -0.9469272, 3.38767, 0.7882353, 0, 1, 1,
0.9726477, 1.22657, 0.6062719, 0.7921569, 0, 1, 1,
0.9766811, -1.015628, 1.383049, 0.8, 0, 1, 1,
0.9846677, -0.9607233, 3.181626, 0.8078431, 0, 1, 1,
0.9859198, 0.4687488, 0.827256, 0.8117647, 0, 1, 1,
0.988421, -0.1974798, 2.505052, 0.8196079, 0, 1, 1,
0.9916406, 0.4901121, 1.04362, 0.8235294, 0, 1, 1,
0.9955168, 1.942626, 0.6499607, 0.8313726, 0, 1, 1,
1.004958, -0.2992395, 2.110738, 0.8352941, 0, 1, 1,
1.007471, 0.8874041, 2.722744, 0.8431373, 0, 1, 1,
1.013218, 0.5466875, 1.358159, 0.8470588, 0, 1, 1,
1.028847, 0.9318274, 2.078595, 0.854902, 0, 1, 1,
1.041145, -1.240602, 1.729784, 0.8588235, 0, 1, 1,
1.042623, 0.2489977, 0.6853274, 0.8666667, 0, 1, 1,
1.043357, 0.2696017, 2.383854, 0.8705882, 0, 1, 1,
1.043897, -0.4589708, 1.944517, 0.8784314, 0, 1, 1,
1.044733, 0.2332377, 2.409905, 0.8823529, 0, 1, 1,
1.045868, -0.01904341, 1.361986, 0.8901961, 0, 1, 1,
1.046034, 0.05786123, 2.685681, 0.8941177, 0, 1, 1,
1.051638, 0.6323059, -0.1155316, 0.9019608, 0, 1, 1,
1.052326, -0.7465393, 2.1892, 0.9098039, 0, 1, 1,
1.05469, -0.05996027, 1.39057, 0.9137255, 0, 1, 1,
1.069441, 0.3198503, 3.118835, 0.9215686, 0, 1, 1,
1.081954, 0.2352214, 1.144458, 0.9254902, 0, 1, 1,
1.084991, 0.3187573, 0.9482176, 0.9333333, 0, 1, 1,
1.090124, -0.4160354, 1.681474, 0.9372549, 0, 1, 1,
1.093638, 1.107298, 0.8920022, 0.945098, 0, 1, 1,
1.096505, 0.513912, 0.6568599, 0.9490196, 0, 1, 1,
1.101094, 1.383345, 1.05483, 0.9568627, 0, 1, 1,
1.102344, -0.51853, 3.411785, 0.9607843, 0, 1, 1,
1.102591, -0.7413759, 4.163968, 0.9686275, 0, 1, 1,
1.112456, 0.5798199, 1.760676, 0.972549, 0, 1, 1,
1.122446, 0.0007022257, 1.034832, 0.9803922, 0, 1, 1,
1.122846, 0.05440683, 2.633134, 0.9843137, 0, 1, 1,
1.125035, 1.001152, 1.656625, 0.9921569, 0, 1, 1,
1.151068, -0.771071, 1.525895, 0.9960784, 0, 1, 1,
1.15206, -0.1835449, 3.950003, 1, 0, 0.9960784, 1,
1.165319, -0.5411667, 3.043578, 1, 0, 0.9882353, 1,
1.168605, 0.9147638, 0.6736438, 1, 0, 0.9843137, 1,
1.172641, 0.5422103, 0.9877788, 1, 0, 0.9764706, 1,
1.172767, 1.20135, -0.1719729, 1, 0, 0.972549, 1,
1.175452, 1.914635, 0.008572201, 1, 0, 0.9647059, 1,
1.176912, 0.6593202, 2.233948, 1, 0, 0.9607843, 1,
1.193853, 0.7108077, 0.5237167, 1, 0, 0.9529412, 1,
1.195553, -0.04307762, 2.832648, 1, 0, 0.9490196, 1,
1.19916, -2.288627, 3.807292, 1, 0, 0.9411765, 1,
1.199415, 0.8237556, 2.14737, 1, 0, 0.9372549, 1,
1.204936, -1.628129, 1.781935, 1, 0, 0.9294118, 1,
1.213468, -0.3216117, 2.512533, 1, 0, 0.9254902, 1,
1.21873, -0.2457844, 2.08782, 1, 0, 0.9176471, 1,
1.229179, 0.6616373, 2.879899, 1, 0, 0.9137255, 1,
1.232268, 1.40689, 2.500692, 1, 0, 0.9058824, 1,
1.232428, -1.735492, 2.554511, 1, 0, 0.9019608, 1,
1.233138, -0.8745836, 1.698027, 1, 0, 0.8941177, 1,
1.237619, -1.577871, 2.539373, 1, 0, 0.8862745, 1,
1.248797, 0.577812, 1.022433, 1, 0, 0.8823529, 1,
1.249933, 1.2532, 0.9131501, 1, 0, 0.8745098, 1,
1.251055, -1.514488, 2.952441, 1, 0, 0.8705882, 1,
1.253456, -1.829694, 2.738107, 1, 0, 0.8627451, 1,
1.258723, 0.354085, 0.6827021, 1, 0, 0.8588235, 1,
1.267596, -1.237951, 3.619411, 1, 0, 0.8509804, 1,
1.267792, 0.4165168, 0.3287503, 1, 0, 0.8470588, 1,
1.276131, 0.6351933, -1.1481, 1, 0, 0.8392157, 1,
1.276181, -0.4445438, 2.180384, 1, 0, 0.8352941, 1,
1.281809, -0.92351, 2.951144, 1, 0, 0.827451, 1,
1.293529, -1.172564, 1.651678, 1, 0, 0.8235294, 1,
1.29513, -0.3020931, 2.093256, 1, 0, 0.8156863, 1,
1.297455, -0.4178584, 2.446843, 1, 0, 0.8117647, 1,
1.310986, 1.648165, 0.6929814, 1, 0, 0.8039216, 1,
1.311131, 1.914954, -1.033094, 1, 0, 0.7960784, 1,
1.316022, 0.6624243, 1.285253, 1, 0, 0.7921569, 1,
1.330572, 0.5535504, 1.555132, 1, 0, 0.7843137, 1,
1.337181, -0.8369967, 1.881392, 1, 0, 0.7803922, 1,
1.349185, -1.874159, 1.088545, 1, 0, 0.772549, 1,
1.358754, -0.05609915, 2.724073, 1, 0, 0.7686275, 1,
1.364908, 1.31587, 1.633236, 1, 0, 0.7607843, 1,
1.364957, 0.5303825, 1.710268, 1, 0, 0.7568628, 1,
1.365526, -1.424779, 3.396549, 1, 0, 0.7490196, 1,
1.367566, -0.1301747, 3.393596, 1, 0, 0.7450981, 1,
1.369816, -0.01253119, 1.11821, 1, 0, 0.7372549, 1,
1.380467, 0.4659147, 0.1909515, 1, 0, 0.7333333, 1,
1.381964, 0.4929073, 0.9311989, 1, 0, 0.7254902, 1,
1.385214, 0.8031461, 0.8323336, 1, 0, 0.7215686, 1,
1.386471, -0.8138224, 2.03013, 1, 0, 0.7137255, 1,
1.388494, -0.7221861, 1.834245, 1, 0, 0.7098039, 1,
1.39101, -1.161941, 3.249739, 1, 0, 0.7019608, 1,
1.391097, -0.015123, 1.317307, 1, 0, 0.6941177, 1,
1.3981, -0.8685097, -0.2319748, 1, 0, 0.6901961, 1,
1.402029, 0.2399628, 2.461736, 1, 0, 0.682353, 1,
1.404001, -0.4326928, 1.519467, 1, 0, 0.6784314, 1,
1.405144, 0.896323, 1.803057, 1, 0, 0.6705883, 1,
1.407374, 0.7879126, 1.057044, 1, 0, 0.6666667, 1,
1.407824, -0.525607, 0.0848383, 1, 0, 0.6588235, 1,
1.408393, 1.716152, 2.542403, 1, 0, 0.654902, 1,
1.410338, 0.5036846, 1.304818, 1, 0, 0.6470588, 1,
1.413711, 0.3374506, 1.191314, 1, 0, 0.6431373, 1,
1.427191, 0.8453087, 1.317214, 1, 0, 0.6352941, 1,
1.428376, 1.917192, 0.7524286, 1, 0, 0.6313726, 1,
1.434501, 0.6138355, 1.708649, 1, 0, 0.6235294, 1,
1.446355, 0.590625, 1.338576, 1, 0, 0.6196079, 1,
1.447895, -0.4278484, 1.476862, 1, 0, 0.6117647, 1,
1.450666, -0.1379546, 2.482571, 1, 0, 0.6078432, 1,
1.461341, 1.113197, 2.613712, 1, 0, 0.6, 1,
1.469006, -0.02787423, 2.301402, 1, 0, 0.5921569, 1,
1.469146, 1.478499, 0.973289, 1, 0, 0.5882353, 1,
1.469252, 1.831007, -0.3297219, 1, 0, 0.5803922, 1,
1.474073, 1.931808, 0.6858647, 1, 0, 0.5764706, 1,
1.484982, -1.063752, 3.152119, 1, 0, 0.5686275, 1,
1.485377, -2.804292, 3.808384, 1, 0, 0.5647059, 1,
1.486388, 0.5632528, 0.3616557, 1, 0, 0.5568628, 1,
1.487028, -0.7135228, 1.276958, 1, 0, 0.5529412, 1,
1.496423, 2.04941, 1.422737, 1, 0, 0.5450981, 1,
1.496791, 1.263272, 1.169653, 1, 0, 0.5411765, 1,
1.499537, 0.6659248, 0.2789275, 1, 0, 0.5333334, 1,
1.501998, 0.3952111, 1.259299, 1, 0, 0.5294118, 1,
1.507586, -0.4085107, 1.700473, 1, 0, 0.5215687, 1,
1.508731, -0.599013, 2.206802, 1, 0, 0.5176471, 1,
1.511139, 0.5313052, 1.965113, 1, 0, 0.509804, 1,
1.512232, 0.4064723, 3.150061, 1, 0, 0.5058824, 1,
1.514272, -0.8090848, 0.2793047, 1, 0, 0.4980392, 1,
1.518968, 0.42979, 2.876919, 1, 0, 0.4901961, 1,
1.523159, -0.03285314, 3.127575, 1, 0, 0.4862745, 1,
1.535908, -0.296253, 0.8726571, 1, 0, 0.4784314, 1,
1.536126, 1.114328, 1.633073, 1, 0, 0.4745098, 1,
1.541848, -0.2311606, 2.045954, 1, 0, 0.4666667, 1,
1.553727, -1.295901, 2.402629, 1, 0, 0.4627451, 1,
1.557239, -0.307918, 2.470139, 1, 0, 0.454902, 1,
1.55924, -1.775361, 2.341943, 1, 0, 0.4509804, 1,
1.564368, 1.53361, 0.8482326, 1, 0, 0.4431373, 1,
1.569138, 1.297221, 0.5394311, 1, 0, 0.4392157, 1,
1.570298, 0.1868602, 0.7084579, 1, 0, 0.4313726, 1,
1.584825, 0.6366596, 1.443803, 1, 0, 0.427451, 1,
1.585761, -0.6885747, 1.041588, 1, 0, 0.4196078, 1,
1.592348, -0.05933693, 3.037498, 1, 0, 0.4156863, 1,
1.592506, -0.6553519, 2.8953, 1, 0, 0.4078431, 1,
1.596389, -1.043137, 1.922027, 1, 0, 0.4039216, 1,
1.606674, -0.03224126, 0.7105367, 1, 0, 0.3960784, 1,
1.622526, -0.4088828, 1.61393, 1, 0, 0.3882353, 1,
1.626233, -1.435343, 0.7011657, 1, 0, 0.3843137, 1,
1.631735, -0.211273, 0.5469056, 1, 0, 0.3764706, 1,
1.646262, -0.3530577, 2.226268, 1, 0, 0.372549, 1,
1.651692, 1.118745, 0.9951407, 1, 0, 0.3647059, 1,
1.654451, -0.9318998, 2.098156, 1, 0, 0.3607843, 1,
1.657759, -0.6078714, 2.424259, 1, 0, 0.3529412, 1,
1.659879, 0.4716036, 0.6557643, 1, 0, 0.3490196, 1,
1.661511, -0.6431372, 1.370252, 1, 0, 0.3411765, 1,
1.664748, 0.7060759, 1.077168, 1, 0, 0.3372549, 1,
1.693728, -0.2694584, 0.1125746, 1, 0, 0.3294118, 1,
1.723814, -0.9487075, 2.365279, 1, 0, 0.3254902, 1,
1.72476, -0.5187598, 3.351738, 1, 0, 0.3176471, 1,
1.730046, 1.690322, 1.830525, 1, 0, 0.3137255, 1,
1.734508, -0.5892653, 1.773502, 1, 0, 0.3058824, 1,
1.763239, 0.3626388, 1.539037, 1, 0, 0.2980392, 1,
1.769328, 0.60715, 1.549147, 1, 0, 0.2941177, 1,
1.776769, 1.0924, 1.235452, 1, 0, 0.2862745, 1,
1.783583, 1.443566, -0.215458, 1, 0, 0.282353, 1,
1.785743, 0.1255228, 1.286812, 1, 0, 0.2745098, 1,
1.791088, -0.9554568, 2.456316, 1, 0, 0.2705882, 1,
1.862375, -0.2189676, 0.4646549, 1, 0, 0.2627451, 1,
1.882933, -0.6590037, 1.109871, 1, 0, 0.2588235, 1,
1.894517, -1.219133, 3.400975, 1, 0, 0.2509804, 1,
1.907044, -0.9948441, 2.400826, 1, 0, 0.2470588, 1,
1.915505, 0.8787515, 3.529138, 1, 0, 0.2392157, 1,
1.915812, -0.07885959, 1.615908, 1, 0, 0.2352941, 1,
1.929547, -0.8426916, 1.739895, 1, 0, 0.227451, 1,
1.929877, 0.08613009, 4.851988, 1, 0, 0.2235294, 1,
1.937331, -0.8385288, 1.969798, 1, 0, 0.2156863, 1,
1.940639, 0.5651543, 1.172036, 1, 0, 0.2117647, 1,
1.941818, -1.26457, 2.984682, 1, 0, 0.2039216, 1,
1.946501, -1.412723, 1.532001, 1, 0, 0.1960784, 1,
1.964849, 0.2184214, 0.9397039, 1, 0, 0.1921569, 1,
1.979484, 0.0584687, 3.527745, 1, 0, 0.1843137, 1,
1.988166, 1.430675, 1.188554, 1, 0, 0.1803922, 1,
1.992551, 2.034214, -0.5762772, 1, 0, 0.172549, 1,
1.992687, 0.3858107, 0.5959421, 1, 0, 0.1686275, 1,
1.999307, 0.5913138, 2.057549, 1, 0, 0.1607843, 1,
2.023821, -0.6276748, 2.987556, 1, 0, 0.1568628, 1,
2.064352, -0.4141889, 2.290483, 1, 0, 0.1490196, 1,
2.071434, -0.4322279, 2.209415, 1, 0, 0.145098, 1,
2.08956, 0.3270286, 0.4579319, 1, 0, 0.1372549, 1,
2.150851, 0.1368064, 2.967477, 1, 0, 0.1333333, 1,
2.163658, -2.080048, 3.492976, 1, 0, 0.1254902, 1,
2.191714, 0.1218557, 0.3328052, 1, 0, 0.1215686, 1,
2.225753, 0.04273718, 3.094388, 1, 0, 0.1137255, 1,
2.262291, -0.1750209, 3.154428, 1, 0, 0.1098039, 1,
2.283384, -1.152517, 2.583651, 1, 0, 0.1019608, 1,
2.295911, 0.4946092, 0.9477877, 1, 0, 0.09411765, 1,
2.38599, 1.076758, -0.3402511, 1, 0, 0.09019608, 1,
2.388168, -0.4981338, 1.156268, 1, 0, 0.08235294, 1,
2.425027, 0.175248, 2.286703, 1, 0, 0.07843138, 1,
2.44475, 0.00577698, 2.360253, 1, 0, 0.07058824, 1,
2.528252, -0.7086001, 2.53085, 1, 0, 0.06666667, 1,
2.549115, 1.335785, 1.627725, 1, 0, 0.05882353, 1,
2.621971, 0.276061, 1.501467, 1, 0, 0.05490196, 1,
2.644639, -1.113391, 2.269313, 1, 0, 0.04705882, 1,
2.691433, -0.5309423, -0.5281011, 1, 0, 0.04313726, 1,
2.691691, -0.9998024, 1.443968, 1, 0, 0.03529412, 1,
2.749826, 0.4686014, 3.18451, 1, 0, 0.03137255, 1,
2.773906, 1.777095, 0.7781927, 1, 0, 0.02352941, 1,
2.835991, 0.6164841, 0.4182409, 1, 0, 0.01960784, 1,
3.732195, 0.3754522, -1.080957, 1, 0, 0.01176471, 1,
3.992045, -1.652251, 1.10454, 1, 0, 0.007843138, 1
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
0.383579, -4.783617, -6.658583, 0, -0.5, 0.5, 0.5,
0.383579, -4.783617, -6.658583, 1, -0.5, 0.5, 0.5,
0.383579, -4.783617, -6.658583, 1, 1.5, 0.5, 0.5,
0.383579, -4.783617, -6.658583, 0, 1.5, 0.5, 0.5
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
-4.448157, -0.4338187, -6.658583, 0, -0.5, 0.5, 0.5,
-4.448157, -0.4338187, -6.658583, 1, -0.5, 0.5, 0.5,
-4.448157, -0.4338187, -6.658583, 1, 1.5, 0.5, 0.5,
-4.448157, -0.4338187, -6.658583, 0, 1.5, 0.5, 0.5
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
-4.448157, -4.783617, 0.1041174, 0, -0.5, 0.5, 0.5,
-4.448157, -4.783617, 0.1041174, 1, -0.5, 0.5, 0.5,
-4.448157, -4.783617, 0.1041174, 1, 1.5, 0.5, 0.5,
-4.448157, -4.783617, 0.1041174, 0, 1.5, 0.5, 0.5
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
-2, -3.779817, -5.09796,
2, -3.779817, -5.09796,
-2, -3.779817, -5.09796,
-2, -3.947117, -5.358064,
0, -3.779817, -5.09796,
0, -3.947117, -5.358064,
2, -3.779817, -5.09796,
2, -3.947117, -5.358064
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
-2, -4.281717, -5.878272, 0, -0.5, 0.5, 0.5,
-2, -4.281717, -5.878272, 1, -0.5, 0.5, 0.5,
-2, -4.281717, -5.878272, 1, 1.5, 0.5, 0.5,
-2, -4.281717, -5.878272, 0, 1.5, 0.5, 0.5,
0, -4.281717, -5.878272, 0, -0.5, 0.5, 0.5,
0, -4.281717, -5.878272, 1, -0.5, 0.5, 0.5,
0, -4.281717, -5.878272, 1, 1.5, 0.5, 0.5,
0, -4.281717, -5.878272, 0, 1.5, 0.5, 0.5,
2, -4.281717, -5.878272, 0, -0.5, 0.5, 0.5,
2, -4.281717, -5.878272, 1, -0.5, 0.5, 0.5,
2, -4.281717, -5.878272, 1, 1.5, 0.5, 0.5,
2, -4.281717, -5.878272, 0, 1.5, 0.5, 0.5
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
-3.333141, -3, -5.09796,
-3.333141, 2, -5.09796,
-3.333141, -3, -5.09796,
-3.518977, -3, -5.358064,
-3.333141, -2, -5.09796,
-3.518977, -2, -5.358064,
-3.333141, -1, -5.09796,
-3.518977, -1, -5.358064,
-3.333141, 0, -5.09796,
-3.518977, 0, -5.358064,
-3.333141, 1, -5.09796,
-3.518977, 1, -5.358064,
-3.333141, 2, -5.09796,
-3.518977, 2, -5.358064
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
-3.890649, -3, -5.878272, 0, -0.5, 0.5, 0.5,
-3.890649, -3, -5.878272, 1, -0.5, 0.5, 0.5,
-3.890649, -3, -5.878272, 1, 1.5, 0.5, 0.5,
-3.890649, -3, -5.878272, 0, 1.5, 0.5, 0.5,
-3.890649, -2, -5.878272, 0, -0.5, 0.5, 0.5,
-3.890649, -2, -5.878272, 1, -0.5, 0.5, 0.5,
-3.890649, -2, -5.878272, 1, 1.5, 0.5, 0.5,
-3.890649, -2, -5.878272, 0, 1.5, 0.5, 0.5,
-3.890649, -1, -5.878272, 0, -0.5, 0.5, 0.5,
-3.890649, -1, -5.878272, 1, -0.5, 0.5, 0.5,
-3.890649, -1, -5.878272, 1, 1.5, 0.5, 0.5,
-3.890649, -1, -5.878272, 0, 1.5, 0.5, 0.5,
-3.890649, 0, -5.878272, 0, -0.5, 0.5, 0.5,
-3.890649, 0, -5.878272, 1, -0.5, 0.5, 0.5,
-3.890649, 0, -5.878272, 1, 1.5, 0.5, 0.5,
-3.890649, 0, -5.878272, 0, 1.5, 0.5, 0.5,
-3.890649, 1, -5.878272, 0, -0.5, 0.5, 0.5,
-3.890649, 1, -5.878272, 1, -0.5, 0.5, 0.5,
-3.890649, 1, -5.878272, 1, 1.5, 0.5, 0.5,
-3.890649, 1, -5.878272, 0, 1.5, 0.5, 0.5,
-3.890649, 2, -5.878272, 0, -0.5, 0.5, 0.5,
-3.890649, 2, -5.878272, 1, -0.5, 0.5, 0.5,
-3.890649, 2, -5.878272, 1, 1.5, 0.5, 0.5,
-3.890649, 2, -5.878272, 0, 1.5, 0.5, 0.5
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
-3.333141, -3.779817, -4,
-3.333141, -3.779817, 4,
-3.333141, -3.779817, -4,
-3.518977, -3.947117, -4,
-3.333141, -3.779817, -2,
-3.518977, -3.947117, -2,
-3.333141, -3.779817, 0,
-3.518977, -3.947117, 0,
-3.333141, -3.779817, 2,
-3.518977, -3.947117, 2,
-3.333141, -3.779817, 4,
-3.518977, -3.947117, 4
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
-3.890649, -4.281717, -4, 0, -0.5, 0.5, 0.5,
-3.890649, -4.281717, -4, 1, -0.5, 0.5, 0.5,
-3.890649, -4.281717, -4, 1, 1.5, 0.5, 0.5,
-3.890649, -4.281717, -4, 0, 1.5, 0.5, 0.5,
-3.890649, -4.281717, -2, 0, -0.5, 0.5, 0.5,
-3.890649, -4.281717, -2, 1, -0.5, 0.5, 0.5,
-3.890649, -4.281717, -2, 1, 1.5, 0.5, 0.5,
-3.890649, -4.281717, -2, 0, 1.5, 0.5, 0.5,
-3.890649, -4.281717, 0, 0, -0.5, 0.5, 0.5,
-3.890649, -4.281717, 0, 1, -0.5, 0.5, 0.5,
-3.890649, -4.281717, 0, 1, 1.5, 0.5, 0.5,
-3.890649, -4.281717, 0, 0, 1.5, 0.5, 0.5,
-3.890649, -4.281717, 2, 0, -0.5, 0.5, 0.5,
-3.890649, -4.281717, 2, 1, -0.5, 0.5, 0.5,
-3.890649, -4.281717, 2, 1, 1.5, 0.5, 0.5,
-3.890649, -4.281717, 2, 0, 1.5, 0.5, 0.5,
-3.890649, -4.281717, 4, 0, -0.5, 0.5, 0.5,
-3.890649, -4.281717, 4, 1, -0.5, 0.5, 0.5,
-3.890649, -4.281717, 4, 1, 1.5, 0.5, 0.5,
-3.890649, -4.281717, 4, 0, 1.5, 0.5, 0.5
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
-3.333141, -3.779817, -5.09796,
-3.333141, 2.91218, -5.09796,
-3.333141, -3.779817, 5.306195,
-3.333141, 2.91218, 5.306195,
-3.333141, -3.779817, -5.09796,
-3.333141, -3.779817, 5.306195,
-3.333141, 2.91218, -5.09796,
-3.333141, 2.91218, 5.306195,
-3.333141, -3.779817, -5.09796,
4.100299, -3.779817, -5.09796,
-3.333141, -3.779817, 5.306195,
4.100299, -3.779817, 5.306195,
-3.333141, 2.91218, -5.09796,
4.100299, 2.91218, -5.09796,
-3.333141, 2.91218, 5.306195,
4.100299, 2.91218, 5.306195,
4.100299, -3.779817, -5.09796,
4.100299, 2.91218, -5.09796,
4.100299, -3.779817, 5.306195,
4.100299, 2.91218, 5.306195,
4.100299, -3.779817, -5.09796,
4.100299, -3.779817, 5.306195,
4.100299, 2.91218, -5.09796,
4.100299, 2.91218, 5.306195
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
var radius = 7.706457;
var distance = 34.2869;
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
mvMatrix.translate( -0.383579, 0.4338187, -0.1041174 );
mvMatrix.scale( 1.120931, 1.245125, 0.8008697 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2869);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
dibromochloropropane<-read.table("dibromochloropropane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dibromochloropropane$V2
```

```
## Error in eval(expr, envir, enclos): object 'dibromochloropropane' not found
```

```r
y<-dibromochloropropane$V3
```

```
## Error in eval(expr, envir, enclos): object 'dibromochloropropane' not found
```

```r
z<-dibromochloropropane$V4
```

```
## Error in eval(expr, envir, enclos): object 'dibromochloropropane' not found
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
-3.224887, -0.8861201, -2.42277, 0, 0, 1, 1, 1,
-2.908172, -0.6566964, -1.384729, 1, 0, 0, 1, 1,
-2.750621, 2.005482, 0.2521099, 1, 0, 0, 1, 1,
-2.727516, -1.2254, -0.3187453, 1, 0, 0, 1, 1,
-2.713528, 1.772185, -1.974245, 1, 0, 0, 1, 1,
-2.673596, -0.4646994, -1.326477, 1, 0, 0, 1, 1,
-2.57177, 0.6187707, -1.018319, 0, 0, 0, 1, 1,
-2.561835, -0.1486558, -1.607228, 0, 0, 0, 1, 1,
-2.515049, -0.5007114, -1.108077, 0, 0, 0, 1, 1,
-2.479735, 0.7876404, -2.010134, 0, 0, 0, 1, 1,
-2.454351, 0.5575812, -0.2568388, 0, 0, 0, 1, 1,
-2.32668, -0.5581815, -1.002262, 0, 0, 0, 1, 1,
-2.309219, 2.053786, -0.8294691, 0, 0, 0, 1, 1,
-2.301846, 0.4720759, -1.489265, 1, 1, 1, 1, 1,
-2.238163, -0.04174187, -0.4396689, 1, 1, 1, 1, 1,
-2.234862, 0.9640797, -1.675282, 1, 1, 1, 1, 1,
-2.189275, -1.448747, -0.8261868, 1, 1, 1, 1, 1,
-2.15809, -0.6150654, -1.795003, 1, 1, 1, 1, 1,
-2.130992, -0.9443026, -1.87157, 1, 1, 1, 1, 1,
-2.129834, -0.8293954, -1.037498, 1, 1, 1, 1, 1,
-2.119907, 1.343277, -1.498194, 1, 1, 1, 1, 1,
-2.094826, 0.2205668, -0.6596235, 1, 1, 1, 1, 1,
-2.093593, 0.5828193, -1.923672, 1, 1, 1, 1, 1,
-2.051093, -1.686944, -2.582355, 1, 1, 1, 1, 1,
-1.990299, -0.8556624, -1.144923, 1, 1, 1, 1, 1,
-1.967429, 0.3986495, -1.940206, 1, 1, 1, 1, 1,
-1.965957, 0.4428456, -0.6783944, 1, 1, 1, 1, 1,
-1.961483, -0.6738792, -0.5997965, 1, 1, 1, 1, 1,
-1.95543, -0.3025538, 0.2555406, 0, 0, 1, 1, 1,
-1.944887, 0.5477456, -1.267537, 1, 0, 0, 1, 1,
-1.936342, 0.6220682, -0.6307805, 1, 0, 0, 1, 1,
-1.922069, 0.2665101, -0.2184874, 1, 0, 0, 1, 1,
-1.918071, 0.1024347, -1.371072, 1, 0, 0, 1, 1,
-1.90131, -1.488742, -2.678096, 1, 0, 0, 1, 1,
-1.895718, 1.00011, -2.975379, 0, 0, 0, 1, 1,
-1.894743, 0.6934222, -0.7411492, 0, 0, 0, 1, 1,
-1.882025, 1.395631, -0.7469172, 0, 0, 0, 1, 1,
-1.879222, 1.738799, -2.139009, 0, 0, 0, 1, 1,
-1.87584, 0.5937129, -0.2154278, 0, 0, 0, 1, 1,
-1.85867, 0.8821028, 1.858397, 0, 0, 0, 1, 1,
-1.858466, 0.03849664, -1.369705, 0, 0, 0, 1, 1,
-1.843601, 0.5240082, -0.6741009, 1, 1, 1, 1, 1,
-1.83185, -0.2575959, -0.6950453, 1, 1, 1, 1, 1,
-1.801016, -0.3172139, -2.118994, 1, 1, 1, 1, 1,
-1.791738, -0.4875162, -1.321193, 1, 1, 1, 1, 1,
-1.79022, -0.2014993, -0.2891138, 1, 1, 1, 1, 1,
-1.770578, -0.2397007, -1.108701, 1, 1, 1, 1, 1,
-1.756804, -0.08669624, -1.41432, 1, 1, 1, 1, 1,
-1.756287, -0.5298728, -2.837685, 1, 1, 1, 1, 1,
-1.732005, 0.4400921, -3.793426, 1, 1, 1, 1, 1,
-1.729951, 0.0737206, -2.158344, 1, 1, 1, 1, 1,
-1.727351, 1.257483, 0.06906901, 1, 1, 1, 1, 1,
-1.725466, -1.603656, -2.292108, 1, 1, 1, 1, 1,
-1.697877, -1.628728, -1.108369, 1, 1, 1, 1, 1,
-1.687463, -1.532183, -2.569777, 1, 1, 1, 1, 1,
-1.685004, 0.5286143, -1.448397, 1, 1, 1, 1, 1,
-1.67915, -2.341472, -4.300103, 0, 0, 1, 1, 1,
-1.664605, -0.3411404, -1.735772, 1, 0, 0, 1, 1,
-1.644727, 0.7814602, -1.894103, 1, 0, 0, 1, 1,
-1.644342, 0.3348322, -2.062873, 1, 0, 0, 1, 1,
-1.640381, -0.2388148, -1.387045, 1, 0, 0, 1, 1,
-1.638809, 0.03955518, -1.904764, 1, 0, 0, 1, 1,
-1.617984, 2.397647, -1.415363, 0, 0, 0, 1, 1,
-1.615321, 0.5615156, 0.2032303, 0, 0, 0, 1, 1,
-1.601997, -0.1569396, -1.498842, 0, 0, 0, 1, 1,
-1.601296, -0.07309488, -1.248344, 0, 0, 0, 1, 1,
-1.600834, 0.05292583, -2.324655, 0, 0, 0, 1, 1,
-1.592443, 0.5977512, -2.510151, 0, 0, 0, 1, 1,
-1.57919, 0.03055853, 0.1778894, 0, 0, 0, 1, 1,
-1.577805, 0.7334223, -0.6206538, 1, 1, 1, 1, 1,
-1.543003, 1.128472, -2.277146, 1, 1, 1, 1, 1,
-1.540304, -0.2194864, -1.823011, 1, 1, 1, 1, 1,
-1.539406, 0.5437438, 0.1277407, 1, 1, 1, 1, 1,
-1.531123, -0.1740171, 0.3422413, 1, 1, 1, 1, 1,
-1.519017, -0.9594135, -0.9971772, 1, 1, 1, 1, 1,
-1.509498, 0.1225748, -1.079589, 1, 1, 1, 1, 1,
-1.499209, 1.752285, -1.091686, 1, 1, 1, 1, 1,
-1.493673, -1.048479, -2.078462, 1, 1, 1, 1, 1,
-1.479669, 2.291359, 0.4641982, 1, 1, 1, 1, 1,
-1.478069, -0.03816966, -1.658943, 1, 1, 1, 1, 1,
-1.477996, 0.7737604, -1.580754, 1, 1, 1, 1, 1,
-1.476194, -0.6338354, -1.25271, 1, 1, 1, 1, 1,
-1.449784, -1.028677, -0.7786901, 1, 1, 1, 1, 1,
-1.447086, 1.226631, -0.4134162, 1, 1, 1, 1, 1,
-1.444151, -1.440106, -2.653209, 0, 0, 1, 1, 1,
-1.440399, 0.02993256, -1.924123, 1, 0, 0, 1, 1,
-1.431216, -2.693322, -2.309189, 1, 0, 0, 1, 1,
-1.417652, -1.195017, -0.6056634, 1, 0, 0, 1, 1,
-1.405346, -0.3063667, -1.855148, 1, 0, 0, 1, 1,
-1.392672, -1.41456, -1.247767, 1, 0, 0, 1, 1,
-1.391513, 0.02216546, -1.048982, 0, 0, 0, 1, 1,
-1.384166, -0.1172409, -0.2028547, 0, 0, 0, 1, 1,
-1.380749, -0.3020907, -2.600448, 0, 0, 0, 1, 1,
-1.376132, 0.5303099, -1.125018, 0, 0, 0, 1, 1,
-1.371834, 0.3587791, -0.8812851, 0, 0, 0, 1, 1,
-1.366638, -1.809375, -2.148295, 0, 0, 0, 1, 1,
-1.365634, 0.5642164, -0.04455752, 0, 0, 0, 1, 1,
-1.354523, -1.09249, -2.156661, 1, 1, 1, 1, 1,
-1.334777, -0.62079, -0.9294805, 1, 1, 1, 1, 1,
-1.309289, 0.09675835, -3.566921, 1, 1, 1, 1, 1,
-1.305748, 1.144822, 1.57672, 1, 1, 1, 1, 1,
-1.304693, 0.1441034, -0.6878452, 1, 1, 1, 1, 1,
-1.302562, -0.04238548, -1.228043, 1, 1, 1, 1, 1,
-1.299317, 0.4346085, -2.957371, 1, 1, 1, 1, 1,
-1.296719, -0.1176521, -1.585794, 1, 1, 1, 1, 1,
-1.29112, -0.9281414, -1.48303, 1, 1, 1, 1, 1,
-1.286723, -1.29612, -2.862159, 1, 1, 1, 1, 1,
-1.279689, -0.129395, -3.042033, 1, 1, 1, 1, 1,
-1.270824, -1.375156, -2.345683, 1, 1, 1, 1, 1,
-1.267794, 0.79017, -0.8886682, 1, 1, 1, 1, 1,
-1.259802, -0.6315663, -0.8160394, 1, 1, 1, 1, 1,
-1.252713, -0.1655544, -1.865247, 1, 1, 1, 1, 1,
-1.245884, 0.2008554, -0.8414829, 0, 0, 1, 1, 1,
-1.240673, -0.8629173, -1.957945, 1, 0, 0, 1, 1,
-1.239508, 1.879025, -2.257571, 1, 0, 0, 1, 1,
-1.223697, -0.5538675, -2.774543, 1, 0, 0, 1, 1,
-1.209186, -0.5895407, -3.622895, 1, 0, 0, 1, 1,
-1.208791, -0.7598124, -2.361334, 1, 0, 0, 1, 1,
-1.201633, -0.1903932, -1.012633, 0, 0, 0, 1, 1,
-1.199169, -0.1047454, -3.106565, 0, 0, 0, 1, 1,
-1.192501, -0.009888812, -1.041329, 0, 0, 0, 1, 1,
-1.179698, 0.2974541, 0.214658, 0, 0, 0, 1, 1,
-1.177655, -0.1123772, -2.77917, 0, 0, 0, 1, 1,
-1.172819, 0.2952147, -2.399345, 0, 0, 0, 1, 1,
-1.16371, -2.056461, -3.202581, 0, 0, 0, 1, 1,
-1.162397, -1.675208, -1.938801, 1, 1, 1, 1, 1,
-1.137929, 1.030775, -0.5823877, 1, 1, 1, 1, 1,
-1.125771, 0.3435082, -2.50517, 1, 1, 1, 1, 1,
-1.113976, 1.409388, -1.838262, 1, 1, 1, 1, 1,
-1.113545, 2.001995, -0.6186465, 1, 1, 1, 1, 1,
-1.109722, -1.364957, -1.882632, 1, 1, 1, 1, 1,
-1.101997, -0.6023623, -0.7897222, 1, 1, 1, 1, 1,
-1.096532, 0.2352097, -1.468022, 1, 1, 1, 1, 1,
-1.096528, 1.620246, 0.6178071, 1, 1, 1, 1, 1,
-1.096178, 0.6133842, -2.180629, 1, 1, 1, 1, 1,
-1.095764, -1.223098, -2.028736, 1, 1, 1, 1, 1,
-1.09437, 0.9295354, -0.945031, 1, 1, 1, 1, 1,
-1.089703, -0.2127565, -0.1170978, 1, 1, 1, 1, 1,
-1.087631, 0.6750885, -0.6929778, 1, 1, 1, 1, 1,
-1.072983, 0.4079341, 1.287194, 1, 1, 1, 1, 1,
-1.072324, 1.105955, -0.2152169, 0, 0, 1, 1, 1,
-1.071755, 1.42989, -0.5113456, 1, 0, 0, 1, 1,
-1.065386, -2.451694, -2.825605, 1, 0, 0, 1, 1,
-1.053144, -0.1345234, -1.309045, 1, 0, 0, 1, 1,
-1.048474, 0.8382572, -0.3181278, 1, 0, 0, 1, 1,
-1.04099, -1.503911, -1.097447, 1, 0, 0, 1, 1,
-1.033682, -1.20946, -2.771747, 0, 0, 0, 1, 1,
-1.032259, -0.9074888, -1.445473, 0, 0, 0, 1, 1,
-1.029058, 0.0624902, -2.122895, 0, 0, 0, 1, 1,
-1.02405, -0.8902336, -2.93648, 0, 0, 0, 1, 1,
-1.02198, 0.7249081, -0.4345352, 0, 0, 0, 1, 1,
-1.020977, -1.292814, -2.36195, 0, 0, 0, 1, 1,
-1.014149, -0.8082103, -2.033612, 0, 0, 0, 1, 1,
-1.013849, 1.296048, -1.672289, 1, 1, 1, 1, 1,
-1.005018, 0.2497115, -0.6032584, 1, 1, 1, 1, 1,
-1.004629, -0.6781398, 0.3667286, 1, 1, 1, 1, 1,
-1.002872, -0.5452115, -1.258118, 1, 1, 1, 1, 1,
-1.001825, -1.627437, -4.294144, 1, 1, 1, 1, 1,
-0.9919379, 0.7515081, -2.330218, 1, 1, 1, 1, 1,
-0.9878847, -0.9259735, -3.221417, 1, 1, 1, 1, 1,
-0.987108, -0.2994461, -1.062322, 1, 1, 1, 1, 1,
-0.983444, -1.155777, -3.739588, 1, 1, 1, 1, 1,
-0.983186, 0.1897232, -2.277264, 1, 1, 1, 1, 1,
-0.9775866, -0.433183, -1.918405, 1, 1, 1, 1, 1,
-0.9733949, -1.701908, -2.247592, 1, 1, 1, 1, 1,
-0.9723904, 0.8101655, -1.778202, 1, 1, 1, 1, 1,
-0.971612, -1.218738, -3.969128, 1, 1, 1, 1, 1,
-0.9679875, 1.530318, 0.9290781, 1, 1, 1, 1, 1,
-0.966149, 0.08763051, -2.167123, 0, 0, 1, 1, 1,
-0.9632798, -0.3716128, -0.5365272, 1, 0, 0, 1, 1,
-0.9609135, -0.8940355, -1.438827, 1, 0, 0, 1, 1,
-0.9604264, -0.183757, -2.24469, 1, 0, 0, 1, 1,
-0.9603591, -0.6467603, -3.360258, 1, 0, 0, 1, 1,
-0.9563173, 0.5890695, -1.17294, 1, 0, 0, 1, 1,
-0.9531084, 0.4717941, -2.455929, 0, 0, 0, 1, 1,
-0.9518426, 0.4792747, -1.633031, 0, 0, 0, 1, 1,
-0.9470801, 0.7682461, -1.257945, 0, 0, 0, 1, 1,
-0.9454795, -0.201223, -2.855033, 0, 0, 0, 1, 1,
-0.9414113, 0.2806868, 1.137235, 0, 0, 0, 1, 1,
-0.9344243, -0.6619602, -4.693973, 0, 0, 0, 1, 1,
-0.9326356, -0.9391307, -2.680867, 0, 0, 0, 1, 1,
-0.9314237, -0.2035135, -2.395911, 1, 1, 1, 1, 1,
-0.9116052, -0.05099478, -3.098916, 1, 1, 1, 1, 1,
-0.9049713, 1.107438, -0.7967818, 1, 1, 1, 1, 1,
-0.9036672, -0.3053731, -1.888973, 1, 1, 1, 1, 1,
-0.8964991, 1.69307, -0.4564803, 1, 1, 1, 1, 1,
-0.8931396, -0.0922377, -0.6789787, 1, 1, 1, 1, 1,
-0.8916466, -0.6877202, -2.516535, 1, 1, 1, 1, 1,
-0.8876868, 1.120429, -0.6177503, 1, 1, 1, 1, 1,
-0.8843542, 0.1588744, -1.291955, 1, 1, 1, 1, 1,
-0.883509, 1.677139, -2.272877, 1, 1, 1, 1, 1,
-0.8694757, -1.807503, -0.8500938, 1, 1, 1, 1, 1,
-0.863298, 0.8138521, 0.3192292, 1, 1, 1, 1, 1,
-0.8470231, 1.433512, 0.6002097, 1, 1, 1, 1, 1,
-0.840307, 0.02460509, -2.446116, 1, 1, 1, 1, 1,
-0.8319236, -1.50245, -0.6423697, 1, 1, 1, 1, 1,
-0.8264892, -1.766326, -2.007415, 0, 0, 1, 1, 1,
-0.8225895, 1.106859, -2.65231, 1, 0, 0, 1, 1,
-0.8190023, -0.3252835, -1.563877, 1, 0, 0, 1, 1,
-0.8179346, 0.65456, -0.9497192, 1, 0, 0, 1, 1,
-0.8137114, -0.2415162, -1.521049, 1, 0, 0, 1, 1,
-0.8117263, 0.6695436, -1.119457, 1, 0, 0, 1, 1,
-0.8077722, -0.5500009, -3.048635, 0, 0, 0, 1, 1,
-0.8055711, 0.05472111, -2.767289, 0, 0, 0, 1, 1,
-0.8008135, 0.0269732, -1.723897, 0, 0, 0, 1, 1,
-0.8003947, 0.1659749, -1.005696, 0, 0, 0, 1, 1,
-0.7900071, 1.486435, -0.4139178, 0, 0, 0, 1, 1,
-0.7805912, -0.4054945, -1.547685, 0, 0, 0, 1, 1,
-0.7710242, -0.9891073, -2.658094, 0, 0, 0, 1, 1,
-0.7709299, 0.4900314, -2.29372, 1, 1, 1, 1, 1,
-0.766416, -0.8737641, -2.806786, 1, 1, 1, 1, 1,
-0.7647973, -0.5849903, 0.1389394, 1, 1, 1, 1, 1,
-0.7612172, 0.4471955, -1.984033, 1, 1, 1, 1, 1,
-0.7611344, 1.044773, -0.01856024, 1, 1, 1, 1, 1,
-0.7599932, -0.2694879, -2.752175, 1, 1, 1, 1, 1,
-0.7584972, 0.3311661, -0.03625096, 1, 1, 1, 1, 1,
-0.7572443, 2.222228, 1.463182, 1, 1, 1, 1, 1,
-0.7439837, 0.06085185, -1.252195, 1, 1, 1, 1, 1,
-0.7434207, 0.9614041, -0.3687792, 1, 1, 1, 1, 1,
-0.7417955, -0.7977048, -2.369262, 1, 1, 1, 1, 1,
-0.7408653, 0.6951618, -0.2228247, 1, 1, 1, 1, 1,
-0.7291515, -0.2725486, -3.77582, 1, 1, 1, 1, 1,
-0.7286224, 0.02792505, -2.359705, 1, 1, 1, 1, 1,
-0.7229705, 0.5801141, -1.637203, 1, 1, 1, 1, 1,
-0.7223887, -1.056206, -2.130236, 0, 0, 1, 1, 1,
-0.7074444, 0.8948208, -2.379414, 1, 0, 0, 1, 1,
-0.7035871, -0.04732489, -0.9434968, 1, 0, 0, 1, 1,
-0.694045, 2.026202, 0.4146865, 1, 0, 0, 1, 1,
-0.6886531, 0.9768431, -1.79584, 1, 0, 0, 1, 1,
-0.6844127, 1.35596, -1.351859, 1, 0, 0, 1, 1,
-0.6816896, -1.481185, -0.8048635, 0, 0, 0, 1, 1,
-0.6747374, 0.2785791, -3.16885, 0, 0, 0, 1, 1,
-0.6679624, -1.21628, -1.658188, 0, 0, 0, 1, 1,
-0.6670512, -0.3536324, -2.304676, 0, 0, 0, 1, 1,
-0.6647227, 0.1656737, -0.9453768, 0, 0, 0, 1, 1,
-0.6623793, -0.3659652, -2.391502, 0, 0, 0, 1, 1,
-0.6623132, -0.5070759, -3.825763, 0, 0, 0, 1, 1,
-0.6591328, 1.215122, 1.231259, 1, 1, 1, 1, 1,
-0.6584393, 0.8743815, 0.4274085, 1, 1, 1, 1, 1,
-0.6579288, -0.6669444, -1.478268, 1, 1, 1, 1, 1,
-0.6573355, -1.157542, -3.015434, 1, 1, 1, 1, 1,
-0.6569132, -1.089595, -3.378915, 1, 1, 1, 1, 1,
-0.651862, 1.56239, -0.07604908, 1, 1, 1, 1, 1,
-0.6477047, 0.3781671, -0.2287381, 1, 1, 1, 1, 1,
-0.6474503, 0.448961, 0.1456756, 1, 1, 1, 1, 1,
-0.6471231, -0.5512419, -2.50694, 1, 1, 1, 1, 1,
-0.6465836, 0.333849, -0.2712626, 1, 1, 1, 1, 1,
-0.646518, 0.9348949, 0.011798, 1, 1, 1, 1, 1,
-0.643078, -0.1364062, 1.46852, 1, 1, 1, 1, 1,
-0.6429476, 0.291939, -1.913246, 1, 1, 1, 1, 1,
-0.6413118, -1.472164, -0.1444548, 1, 1, 1, 1, 1,
-0.6412748, 0.344452, -0.5150804, 1, 1, 1, 1, 1,
-0.630951, 0.1136386, -0.9391215, 0, 0, 1, 1, 1,
-0.6293844, 0.4114976, -1.227949, 1, 0, 0, 1, 1,
-0.6237364, 0.5912182, -1.620614, 1, 0, 0, 1, 1,
-0.6230409, 0.860372, -1.693934, 1, 0, 0, 1, 1,
-0.6229753, 0.08194319, -2.355909, 1, 0, 0, 1, 1,
-0.6225121, -0.3212721, -1.877411, 1, 0, 0, 1, 1,
-0.6224803, 0.4958901, -0.7711736, 0, 0, 0, 1, 1,
-0.6221517, 1.214086, 1.023513, 0, 0, 0, 1, 1,
-0.6219346, -0.7824206, -2.056042, 0, 0, 0, 1, 1,
-0.6216131, 1.752643, -0.4818192, 0, 0, 0, 1, 1,
-0.6195067, -1.971604, -4.874267, 0, 0, 0, 1, 1,
-0.6182032, -0.2455601, -0.3632499, 0, 0, 0, 1, 1,
-0.6180032, 1.212967, -0.628903, 0, 0, 0, 1, 1,
-0.6173024, 0.1979722, -1.866504, 1, 1, 1, 1, 1,
-0.6095596, 0.6035796, -1.407737, 1, 1, 1, 1, 1,
-0.6092665, 1.064059, -0.6086537, 1, 1, 1, 1, 1,
-0.6078488, 1.53405, -1.947178, 1, 1, 1, 1, 1,
-0.6019319, 0.2469491, -1.42003, 1, 1, 1, 1, 1,
-0.6005031, -0.5896382, -1.611471, 1, 1, 1, 1, 1,
-0.5885996, 0.5566543, -0.8016396, 1, 1, 1, 1, 1,
-0.5881221, 0.3462108, -2.067833, 1, 1, 1, 1, 1,
-0.5869164, 0.4243352, -1.252463, 1, 1, 1, 1, 1,
-0.5867686, -0.3383622, -2.349065, 1, 1, 1, 1, 1,
-0.5779599, 1.213983, -0.8863933, 1, 1, 1, 1, 1,
-0.57688, 2.127757, -0.5455703, 1, 1, 1, 1, 1,
-0.5732945, 1.139526, -1.029128, 1, 1, 1, 1, 1,
-0.5675601, 1.636661, -0.8354031, 1, 1, 1, 1, 1,
-0.5640385, 1.878784, -0.9190089, 1, 1, 1, 1, 1,
-0.5630983, 0.143474, -1.591152, 0, 0, 1, 1, 1,
-0.5589699, -0.2483828, -2.325757, 1, 0, 0, 1, 1,
-0.555137, -0.2537958, -0.7019849, 1, 0, 0, 1, 1,
-0.5478602, 0.1466422, -1.290577, 1, 0, 0, 1, 1,
-0.5473083, -0.2097079, -0.8879049, 1, 0, 0, 1, 1,
-0.5332037, 0.01252725, -2.138387, 1, 0, 0, 1, 1,
-0.5300996, -0.5531339, -4.254495, 0, 0, 0, 1, 1,
-0.5234091, -2.30764, -2.722988, 0, 0, 0, 1, 1,
-0.5098811, 1.335514, -1.216081, 0, 0, 0, 1, 1,
-0.5092461, -0.02566262, -2.059294, 0, 0, 0, 1, 1,
-0.5019451, 0.6990497, -0.6120313, 0, 0, 0, 1, 1,
-0.4846319, -0.09439471, -1.647913, 0, 0, 0, 1, 1,
-0.4840049, 0.3691834, 1.511352, 0, 0, 0, 1, 1,
-0.4833316, -0.4875285, -1.806278, 1, 1, 1, 1, 1,
-0.4783105, 2.80792, -1.112141, 1, 1, 1, 1, 1,
-0.4781313, 1.32021, -0.1654059, 1, 1, 1, 1, 1,
-0.4737185, 1.574686, -0.009164845, 1, 1, 1, 1, 1,
-0.472187, -0.3190665, -1.75299, 1, 1, 1, 1, 1,
-0.4719068, 0.2247696, -0.4622579, 1, 1, 1, 1, 1,
-0.4671594, -0.9748583, -1.036236, 1, 1, 1, 1, 1,
-0.4662511, -1.132801, -4.255064, 1, 1, 1, 1, 1,
-0.4618964, 1.402492, 0.6061488, 1, 1, 1, 1, 1,
-0.4606161, -0.7871016, -3.517447, 1, 1, 1, 1, 1,
-0.4532953, -1.066006, -1.799399, 1, 1, 1, 1, 1,
-0.4515702, 0.8648071, 0.04122887, 1, 1, 1, 1, 1,
-0.449568, 0.4990067, -0.2765181, 1, 1, 1, 1, 1,
-0.4475114, -0.3876443, -2.950614, 1, 1, 1, 1, 1,
-0.4432287, 0.857349, -1.668619, 1, 1, 1, 1, 1,
-0.4420181, 1.042559, -0.5465711, 0, 0, 1, 1, 1,
-0.442009, 0.4558768, -0.0568004, 1, 0, 0, 1, 1,
-0.44155, 0.3220707, -1.452478, 1, 0, 0, 1, 1,
-0.4410281, -0.3467905, -3.130261, 1, 0, 0, 1, 1,
-0.4362399, 2.062989, 0.3760702, 1, 0, 0, 1, 1,
-0.4356967, -1.506157, -3.020272, 1, 0, 0, 1, 1,
-0.4344002, -0.4411334, -3.534726, 0, 0, 0, 1, 1,
-0.4326462, -0.06872109, -1.573865, 0, 0, 0, 1, 1,
-0.4264741, 0.0290715, -1.896842, 0, 0, 0, 1, 1,
-0.4258856, 0.9944015, -1.459905, 0, 0, 0, 1, 1,
-0.4248866, 1.175621, -1.495763, 0, 0, 0, 1, 1,
-0.4232377, -2.271007, -4.946443, 0, 0, 0, 1, 1,
-0.4127497, 0.4351991, -0.2788451, 0, 0, 0, 1, 1,
-0.409551, -0.3487635, -1.903636, 1, 1, 1, 1, 1,
-0.4052047, 0.787577, -0.428794, 1, 1, 1, 1, 1,
-0.4025163, -1.356803, -3.288128, 1, 1, 1, 1, 1,
-0.393149, -1.127587, -3.071453, 1, 1, 1, 1, 1,
-0.3765976, -1.182569, -4.371477, 1, 1, 1, 1, 1,
-0.3643201, -0.2601552, -1.900466, 1, 1, 1, 1, 1,
-0.3642101, -1.431709, -2.97755, 1, 1, 1, 1, 1,
-0.3552439, -1.099143, -1.173766, 1, 1, 1, 1, 1,
-0.3547112, 1.500924, -0.8609893, 1, 1, 1, 1, 1,
-0.353876, 0.5683523, 0.5592465, 1, 1, 1, 1, 1,
-0.3522226, 1.755246, -0.5937274, 1, 1, 1, 1, 1,
-0.3511599, 1.154753, 0.2350728, 1, 1, 1, 1, 1,
-0.3485333, -0.732897, -2.931916, 1, 1, 1, 1, 1,
-0.3465207, -0.3369305, -3.10061, 1, 1, 1, 1, 1,
-0.3459525, 0.01169057, -2.306166, 1, 1, 1, 1, 1,
-0.3457603, 0.4106083, -2.157305, 0, 0, 1, 1, 1,
-0.3432231, 0.1049011, -2.183894, 1, 0, 0, 1, 1,
-0.3390199, 0.5376441, 0.1702563, 1, 0, 0, 1, 1,
-0.3357784, 0.8186767, 0.7900044, 1, 0, 0, 1, 1,
-0.3326952, 2.625129, 0.5877081, 1, 0, 0, 1, 1,
-0.3290721, -0.5855179, -2.814663, 1, 0, 0, 1, 1,
-0.3212669, -1.058456, -2.68659, 0, 0, 0, 1, 1,
-0.3187328, 0.07684334, -2.039196, 0, 0, 0, 1, 1,
-0.3166784, 0.8950291, -0.7722878, 0, 0, 0, 1, 1,
-0.3124682, 1.37767, 0.2571285, 0, 0, 0, 1, 1,
-0.3062856, 0.1273696, -2.137716, 0, 0, 0, 1, 1,
-0.3050671, 1.183812, 1.248532, 0, 0, 0, 1, 1,
-0.3019174, 1.50201, 0.1810436, 0, 0, 0, 1, 1,
-0.3015893, 1.494914, 1.894201, 1, 1, 1, 1, 1,
-0.2972473, 1.104228, -0.4055854, 1, 1, 1, 1, 1,
-0.2940024, 0.5691367, -0.1571919, 1, 1, 1, 1, 1,
-0.2887294, -1.378746, -2.171497, 1, 1, 1, 1, 1,
-0.286341, 1.166436, -0.5751369, 1, 1, 1, 1, 1,
-0.2861398, -0.94767, -2.84345, 1, 1, 1, 1, 1,
-0.283974, -1.472056, -3.779962, 1, 1, 1, 1, 1,
-0.2827895, 0.9040822, -0.2012086, 1, 1, 1, 1, 1,
-0.2824855, 0.2294189, -2.258475, 1, 1, 1, 1, 1,
-0.2824519, 1.485933, 1.331009, 1, 1, 1, 1, 1,
-0.2791256, 1.115449, 0.4700963, 1, 1, 1, 1, 1,
-0.2789719, -1.003358, -3.539223, 1, 1, 1, 1, 1,
-0.2766812, 0.3045756, 0.05185071, 1, 1, 1, 1, 1,
-0.2755566, -1.566729, -4.685082, 1, 1, 1, 1, 1,
-0.2750604, -0.6273651, -1.542025, 1, 1, 1, 1, 1,
-0.2692478, -1.224258, -2.295681, 0, 0, 1, 1, 1,
-0.2685825, 2.709765, -1.381608, 1, 0, 0, 1, 1,
-0.2602122, 0.9313666, 1.085958, 1, 0, 0, 1, 1,
-0.2600938, -0.2655527, -2.704902, 1, 0, 0, 1, 1,
-0.257636, -0.9054154, -1.226285, 1, 0, 0, 1, 1,
-0.2510318, -1.224297, -4.903405, 1, 0, 0, 1, 1,
-0.2493565, -0.6162804, -2.532984, 0, 0, 0, 1, 1,
-0.2479472, -0.2200078, -1.624291, 0, 0, 0, 1, 1,
-0.2448202, 1.422223, 0.786741, 0, 0, 0, 1, 1,
-0.2421762, -0.3651228, -2.958331, 0, 0, 0, 1, 1,
-0.2403063, 0.4525236, 0.6731421, 0, 0, 0, 1, 1,
-0.2376074, 0.4615898, -0.5651078, 0, 0, 0, 1, 1,
-0.2363718, 0.1814666, -1.613218, 0, 0, 0, 1, 1,
-0.2345532, 1.977204, -0.3500471, 1, 1, 1, 1, 1,
-0.2343784, 0.4592262, -2.157395, 1, 1, 1, 1, 1,
-0.2259896, 0.2014617, -1.033358, 1, 1, 1, 1, 1,
-0.2243235, -0.4962292, -2.385884, 1, 1, 1, 1, 1,
-0.222893, -2.315522, -3.663332, 1, 1, 1, 1, 1,
-0.2163735, -0.05297567, -2.332297, 1, 1, 1, 1, 1,
-0.2155904, 0.218337, -1.479978, 1, 1, 1, 1, 1,
-0.2138305, 0.81064, -1.404777, 1, 1, 1, 1, 1,
-0.2085556, -0.1500646, -0.6887619, 1, 1, 1, 1, 1,
-0.2079935, 1.824079, 0.4813378, 1, 1, 1, 1, 1,
-0.2038217, 0.4167305, 0.7279326, 1, 1, 1, 1, 1,
-0.1970708, 1.250499, -0.676606, 1, 1, 1, 1, 1,
-0.1953495, -0.672069, -4.221025, 1, 1, 1, 1, 1,
-0.1913697, -0.1209007, -1.152268, 1, 1, 1, 1, 1,
-0.1881774, -0.7277828, -3.28282, 1, 1, 1, 1, 1,
-0.1859734, -1.976815, -2.12869, 0, 0, 1, 1, 1,
-0.1846308, -1.212547, -4.833251, 1, 0, 0, 1, 1,
-0.1842229, 0.8084148, -2.612816, 1, 0, 0, 1, 1,
-0.1833662, -0.0026976, -2.645681, 1, 0, 0, 1, 1,
-0.1751539, 0.8422329, -0.3946356, 1, 0, 0, 1, 1,
-0.1656986, -0.2131237, -2.858444, 1, 0, 0, 1, 1,
-0.1650579, -1.689462, -2.620987, 0, 0, 0, 1, 1,
-0.1649365, -0.7672098, -1.927718, 0, 0, 0, 1, 1,
-0.157654, 0.008919956, -0.2838912, 0, 0, 0, 1, 1,
-0.1576368, 1.648965, -2.09478, 0, 0, 0, 1, 1,
-0.1539246, -0.3886953, -2.464519, 0, 0, 0, 1, 1,
-0.1523965, -0.07700934, -3.114361, 0, 0, 0, 1, 1,
-0.1503754, 0.9709466, -1.229667, 0, 0, 0, 1, 1,
-0.149108, -0.222155, -1.709212, 1, 1, 1, 1, 1,
-0.1443381, 1.242229, 0.04155533, 1, 1, 1, 1, 1,
-0.1441058, -0.2287587, -3.345819, 1, 1, 1, 1, 1,
-0.1404071, -0.1062305, -2.287893, 1, 1, 1, 1, 1,
-0.1317125, 1.43557, 0.2895022, 1, 1, 1, 1, 1,
-0.1294754, -0.154196, -4.053529, 1, 1, 1, 1, 1,
-0.122208, 1.131735, -0.988833, 1, 1, 1, 1, 1,
-0.1212261, 0.1056512, -0.8368779, 1, 1, 1, 1, 1,
-0.118413, 1.312429, -0.9283469, 1, 1, 1, 1, 1,
-0.1168798, -1.147009, -3.575051, 1, 1, 1, 1, 1,
-0.1126707, 0.5781913, -1.420541, 1, 1, 1, 1, 1,
-0.1124689, 2.321259, 0.2186242, 1, 1, 1, 1, 1,
-0.1119895, -0.5628719, -1.610711, 1, 1, 1, 1, 1,
-0.1112772, 0.5194882, 1.163888, 1, 1, 1, 1, 1,
-0.1111815, -0.1788728, -2.820547, 1, 1, 1, 1, 1,
-0.1108456, 0.114425, 0.2512373, 0, 0, 1, 1, 1,
-0.1097082, 1.458848, -0.3343583, 1, 0, 0, 1, 1,
-0.1092123, -1.123314, -3.926828, 1, 0, 0, 1, 1,
-0.1084335, 0.1264195, -2.493259, 1, 0, 0, 1, 1,
-0.1066846, -0.4843679, -2.800461, 1, 0, 0, 1, 1,
-0.1049771, -0.7589525, -3.388355, 1, 0, 0, 1, 1,
-0.09383519, -1.113413, -0.9879019, 0, 0, 0, 1, 1,
-0.09203169, 0.4839617, 0.2144198, 0, 0, 0, 1, 1,
-0.09103877, -2.290873, -1.507264, 0, 0, 0, 1, 1,
-0.09060126, 1.066117, -0.2450408, 0, 0, 0, 1, 1,
-0.08827861, 0.8697532, -0.9616444, 0, 0, 0, 1, 1,
-0.08598892, 0.5578895, 0.8671691, 0, 0, 0, 1, 1,
-0.08597974, 1.096173, 0.3677291, 0, 0, 0, 1, 1,
-0.08352128, 0.6437735, -0.1777811, 1, 1, 1, 1, 1,
-0.08019743, 0.5787078, -0.1459255, 1, 1, 1, 1, 1,
-0.08013726, 1.007548, -1.011814, 1, 1, 1, 1, 1,
-0.08008585, -1.628297, -3.114133, 1, 1, 1, 1, 1,
-0.07694419, -1.348526, -1.691417, 1, 1, 1, 1, 1,
-0.07669286, -1.18273, -4.487387, 1, 1, 1, 1, 1,
-0.07625823, 0.7109969, 0.2673853, 1, 1, 1, 1, 1,
-0.07519837, 0.3310129, 0.3647051, 1, 1, 1, 1, 1,
-0.07181606, -0.05736902, -1.567881, 1, 1, 1, 1, 1,
-0.0705042, 2.745633, -1.079321, 1, 1, 1, 1, 1,
-0.06675779, 0.1146481, -0.1593364, 1, 1, 1, 1, 1,
-0.06589548, -0.08169389, -2.591927, 1, 1, 1, 1, 1,
-0.05830307, -2.376868, -2.785056, 1, 1, 1, 1, 1,
-0.05586559, -0.101828, -4.356171, 1, 1, 1, 1, 1,
-0.05513572, -0.8330336, -0.9431519, 1, 1, 1, 1, 1,
-0.0514099, -3.606008, -3.103774, 0, 0, 1, 1, 1,
-0.05140758, 0.03584644, -1.706007, 1, 0, 0, 1, 1,
-0.05127306, 1.165323, 0.9678978, 1, 0, 0, 1, 1,
-0.04905812, -0.829994, -2.671793, 1, 0, 0, 1, 1,
-0.04603323, -0.5407267, -1.348507, 1, 0, 0, 1, 1,
-0.03782491, 1.063869, -0.6635631, 1, 0, 0, 1, 1,
-0.02546431, 2.083872, -0.6827523, 0, 0, 0, 1, 1,
-0.0240744, -1.193051, -4.492453, 0, 0, 0, 1, 1,
-0.02349361, -1.88941, -2.913959, 0, 0, 0, 1, 1,
-0.02043733, -0.9878964, -4.786614, 0, 0, 0, 1, 1,
-0.01956973, -0.1355474, -3.185328, 0, 0, 0, 1, 1,
-0.01745601, 1.36399, -0.8972228, 0, 0, 0, 1, 1,
-0.01621329, -0.3824906, -3.800448, 0, 0, 0, 1, 1,
-0.01267052, -0.06314645, -1.804161, 1, 1, 1, 1, 1,
-0.01220817, 0.6187777, 0.0423575, 1, 1, 1, 1, 1,
-0.01028462, -1.127655, -4.034194, 1, 1, 1, 1, 1,
-0.00980927, 0.1158306, -0.7948853, 1, 1, 1, 1, 1,
-0.008282016, 0.606377, 0.2044041, 1, 1, 1, 1, 1,
-0.00638233, -0.4893227, -3.970447, 1, 1, 1, 1, 1,
-0.004767622, -1.227643, -4.69992, 1, 1, 1, 1, 1,
-0.003662977, -0.3867341, -0.6588749, 1, 1, 1, 1, 1,
-0.002701816, 1.083148, -0.3042389, 1, 1, 1, 1, 1,
0.0003243575, -0.7875211, 4.696373, 1, 1, 1, 1, 1,
0.005131163, 1.743252, 1.686973, 1, 1, 1, 1, 1,
0.006309866, -0.9437674, 4.036806, 1, 1, 1, 1, 1,
0.01228714, 0.5209518, -2.726128, 1, 1, 1, 1, 1,
0.01264804, 0.7479609, 0.4892831, 1, 1, 1, 1, 1,
0.01291406, 0.9453856, -0.3754325, 1, 1, 1, 1, 1,
0.01397006, -0.06505432, 1.208068, 0, 0, 1, 1, 1,
0.01719591, 2.281766, 0.1238554, 1, 0, 0, 1, 1,
0.01988177, 0.22583, 1.573956, 1, 0, 0, 1, 1,
0.0224968, 0.9740564, 1.418902, 1, 0, 0, 1, 1,
0.02482277, -0.6418509, 4.685274, 1, 0, 0, 1, 1,
0.02652504, 0.4913057, 1.514349, 1, 0, 0, 1, 1,
0.02735897, -0.1906646, 3.539772, 0, 0, 0, 1, 1,
0.03176001, 0.9021953, 0.5774167, 0, 0, 0, 1, 1,
0.03306773, 0.6000889, -0.6509016, 0, 0, 0, 1, 1,
0.03634013, 0.08393636, 0.189708, 0, 0, 0, 1, 1,
0.03683972, 1.486318, -0.05364445, 0, 0, 0, 1, 1,
0.03877147, 0.2610446, -1.995198, 0, 0, 0, 1, 1,
0.04172257, -0.9399881, 2.774717, 0, 0, 0, 1, 1,
0.04259631, -0.3796166, 2.603674, 1, 1, 1, 1, 1,
0.04644442, 0.8330818, 0.9234024, 1, 1, 1, 1, 1,
0.05113367, 0.6545498, 0.05763946, 1, 1, 1, 1, 1,
0.05501194, -0.3151957, 1.60384, 1, 1, 1, 1, 1,
0.05577592, 0.007029984, 1.37884, 1, 1, 1, 1, 1,
0.05633641, -0.9696265, 3.742817, 1, 1, 1, 1, 1,
0.06092104, 0.4806742, -0.4966674, 1, 1, 1, 1, 1,
0.06126479, 1.032701, -0.2179133, 1, 1, 1, 1, 1,
0.06161619, -0.2408124, 3.129212, 1, 1, 1, 1, 1,
0.06627016, -1.697947, 2.624723, 1, 1, 1, 1, 1,
0.06738601, 0.8247193, 1.407071, 1, 1, 1, 1, 1,
0.07037221, -0.6475548, 3.398715, 1, 1, 1, 1, 1,
0.07161578, 1.250436, -0.4905498, 1, 1, 1, 1, 1,
0.07438894, -0.8629056, 3.017744, 1, 1, 1, 1, 1,
0.07827404, 0.2681521, 0.280491, 1, 1, 1, 1, 1,
0.07913578, 1.263591, -0.06966457, 0, 0, 1, 1, 1,
0.07939474, -1.517037, 3.0713, 1, 0, 0, 1, 1,
0.07971773, -1.02272, 2.24893, 1, 0, 0, 1, 1,
0.08150354, -0.3211381, 4.218079, 1, 0, 0, 1, 1,
0.08160929, 0.3311909, -0.509681, 1, 0, 0, 1, 1,
0.08309384, 1.714588, 0.4319502, 1, 0, 0, 1, 1,
0.08352385, -1.395853, 3.184228, 0, 0, 0, 1, 1,
0.08356877, -0.2244615, 2.946671, 0, 0, 0, 1, 1,
0.08426227, -0.7284644, 2.765232, 0, 0, 0, 1, 1,
0.08478571, -0.07252187, 2.342789, 0, 0, 0, 1, 1,
0.08614591, -0.4367372, 1.470493, 0, 0, 0, 1, 1,
0.09607383, 1.132868, 0.2334649, 0, 0, 0, 1, 1,
0.09793416, -1.681913, 4.57645, 0, 0, 0, 1, 1,
0.1061248, 1.069965, -0.6639786, 1, 1, 1, 1, 1,
0.1085373, -0.3113991, 4.528807, 1, 1, 1, 1, 1,
0.111054, 0.6235839, -0.1350684, 1, 1, 1, 1, 1,
0.1111484, 0.9573495, -0.1709591, 1, 1, 1, 1, 1,
0.1117474, 1.322639, -0.007218003, 1, 1, 1, 1, 1,
0.1155598, -0.7824916, 3.213685, 1, 1, 1, 1, 1,
0.1160946, 0.5852081, -0.005920088, 1, 1, 1, 1, 1,
0.1234495, -0.8793495, 1.797627, 1, 1, 1, 1, 1,
0.1302866, 0.3353154, -0.01732355, 1, 1, 1, 1, 1,
0.1344118, 0.2615288, 1.261849, 1, 1, 1, 1, 1,
0.1384492, -0.8488067, 3.80682, 1, 1, 1, 1, 1,
0.1400224, 0.8760769, 0.01330165, 1, 1, 1, 1, 1,
0.1408072, 0.2472948, 0.3441934, 1, 1, 1, 1, 1,
0.1410248, -1.345774, 3.96198, 1, 1, 1, 1, 1,
0.1434387, -0.5193527, 3.519419, 1, 1, 1, 1, 1,
0.1463174, 0.9027758, -0.3849579, 0, 0, 1, 1, 1,
0.150869, 1.116249, 0.4040283, 1, 0, 0, 1, 1,
0.1531412, -0.7509387, 4.211258, 1, 0, 0, 1, 1,
0.1546058, 0.762237, -0.2536655, 1, 0, 0, 1, 1,
0.1549776, -1.218085, 4.056692, 1, 0, 0, 1, 1,
0.155022, 0.149773, 1.386235, 1, 0, 0, 1, 1,
0.1571456, 1.93001, 1.208423, 0, 0, 0, 1, 1,
0.158365, -0.5852464, 4.738254, 0, 0, 0, 1, 1,
0.1586147, -1.736207, 4.209548, 0, 0, 0, 1, 1,
0.1596775, 0.492222, -0.5006832, 0, 0, 0, 1, 1,
0.1619496, 2.319581, 0.4634149, 0, 0, 0, 1, 1,
0.1650478, -0.446375, 1.24847, 0, 0, 0, 1, 1,
0.165609, -0.9261765, 4.739074, 0, 0, 0, 1, 1,
0.1677263, 0.4361187, 0.8825913, 1, 1, 1, 1, 1,
0.1679882, -2.139751, 2.525993, 1, 1, 1, 1, 1,
0.1706388, -0.08811549, 1.888053, 1, 1, 1, 1, 1,
0.1767368, -1.115002, 1.653481, 1, 1, 1, 1, 1,
0.178691, 0.847315, 1.099139, 1, 1, 1, 1, 1,
0.1793367, 1.063592, 0.4951158, 1, 1, 1, 1, 1,
0.180747, 1.098608, -2.059264, 1, 1, 1, 1, 1,
0.1807887, -1.428086, 3.182374, 1, 1, 1, 1, 1,
0.1808038, 0.4482349, -0.2376225, 1, 1, 1, 1, 1,
0.1835194, -0.05907807, 2.465037, 1, 1, 1, 1, 1,
0.1851868, 0.03755437, 1.340203, 1, 1, 1, 1, 1,
0.1871726, 0.1349422, -1.438181, 1, 1, 1, 1, 1,
0.1884456, 1.717547, 0.7455634, 1, 1, 1, 1, 1,
0.188998, 0.8377191, -0.3385227, 1, 1, 1, 1, 1,
0.1935488, -0.02326006, 1.673673, 1, 1, 1, 1, 1,
0.1944896, -0.1266512, 1.713708, 0, 0, 1, 1, 1,
0.1951002, 1.061226, -1.141489, 1, 0, 0, 1, 1,
0.2043845, 0.1999163, 1.984535, 1, 0, 0, 1, 1,
0.2069869, 0.5639553, -0.02537275, 1, 0, 0, 1, 1,
0.2080781, 0.4590012, -0.06606338, 1, 0, 0, 1, 1,
0.2084761, -1.33303, 1.735827, 1, 0, 0, 1, 1,
0.2098777, -0.4597009, 3.355105, 0, 0, 0, 1, 1,
0.216926, 0.5023508, 1.599554, 0, 0, 0, 1, 1,
0.2179677, 0.1769392, 0.6094597, 0, 0, 0, 1, 1,
0.2234729, -0.2849165, 5.154678, 0, 0, 0, 1, 1,
0.2268897, -0.5241746, 0.8805721, 0, 0, 0, 1, 1,
0.2280392, 0.7431126, 1.435887, 0, 0, 0, 1, 1,
0.2287033, 0.9478786, 1.063556, 0, 0, 0, 1, 1,
0.2309005, 2.04694, 1.378262, 1, 1, 1, 1, 1,
0.2334008, -0.3919694, 3.397468, 1, 1, 1, 1, 1,
0.2337576, -1.760637, 2.415815, 1, 1, 1, 1, 1,
0.2352741, 0.7019767, 0.7553901, 1, 1, 1, 1, 1,
0.2378857, -0.7541003, 2.271537, 1, 1, 1, 1, 1,
0.2417769, 2.814723, -0.3763876, 1, 1, 1, 1, 1,
0.2430159, 2.2038, -0.8977194, 1, 1, 1, 1, 1,
0.250037, -2.8452, 3.796731, 1, 1, 1, 1, 1,
0.2518809, -1.931343, 2.349781, 1, 1, 1, 1, 1,
0.2558478, -0.1375954, 2.996629, 1, 1, 1, 1, 1,
0.256501, -0.8323637, 1.608529, 1, 1, 1, 1, 1,
0.2667665, -1.421278, 3.161946, 1, 1, 1, 1, 1,
0.2763592, -0.006158683, 0.8505672, 1, 1, 1, 1, 1,
0.2845334, 1.184863, 0.7750426, 1, 1, 1, 1, 1,
0.28709, 1.171558, -0.4061546, 1, 1, 1, 1, 1,
0.2885846, 1.71552, 2.001401, 0, 0, 1, 1, 1,
0.2907494, -0.08099346, 2.266941, 1, 0, 0, 1, 1,
0.2996197, -0.8397226, 2.623295, 1, 0, 0, 1, 1,
0.3000687, -0.5489577, 1.298346, 1, 0, 0, 1, 1,
0.3076419, 0.2280536, 0.2933058, 1, 0, 0, 1, 1,
0.3169733, -0.9660368, 2.638294, 1, 0, 0, 1, 1,
0.3255353, -0.428304, 3.605704, 0, 0, 0, 1, 1,
0.3280062, -0.007016538, 2.272094, 0, 0, 0, 1, 1,
0.3290794, 0.1875786, 1.389864, 0, 0, 0, 1, 1,
0.3294466, -0.9299489, 1.940155, 0, 0, 0, 1, 1,
0.3321519, 0.6782201, 0.4579066, 0, 0, 0, 1, 1,
0.332883, 0.1315453, 0.5537344, 0, 0, 0, 1, 1,
0.3347631, -1.057677, 2.404055, 0, 0, 0, 1, 1,
0.3355852, 0.9480363, 1.00573, 1, 1, 1, 1, 1,
0.3446833, 0.2916683, 0.1981886, 1, 1, 1, 1, 1,
0.3516419, 2.728729, 0.2327613, 1, 1, 1, 1, 1,
0.3553669, 1.088643, 0.6363248, 1, 1, 1, 1, 1,
0.3571704, -0.0002935664, 1.04217, 1, 1, 1, 1, 1,
0.3624401, 0.191149, -0.4269779, 1, 1, 1, 1, 1,
0.3661747, -0.187612, 0.6404611, 1, 1, 1, 1, 1,
0.3663262, 0.6220875, 1.636437, 1, 1, 1, 1, 1,
0.3680223, 1.62451, -0.2804967, 1, 1, 1, 1, 1,
0.3727678, -0.5517199, 4.473855, 1, 1, 1, 1, 1,
0.3829815, 1.984895, 1.068378, 1, 1, 1, 1, 1,
0.3834677, 1.611867, 0.09963186, 1, 1, 1, 1, 1,
0.3884187, 0.5966612, 1.539095, 1, 1, 1, 1, 1,
0.3924968, -0.4735884, 1.547758, 1, 1, 1, 1, 1,
0.3938043, 0.654673, -0.6282807, 1, 1, 1, 1, 1,
0.3948095, 1.219074, 2.589835, 0, 0, 1, 1, 1,
0.3978926, 0.7700184, 1.597148, 1, 0, 0, 1, 1,
0.399339, -1.044401, 2.885253, 1, 0, 0, 1, 1,
0.4003952, -0.7450769, 2.09968, 1, 0, 0, 1, 1,
0.4059177, 0.4681963, -0.06580478, 1, 0, 0, 1, 1,
0.4065948, 0.3880976, 1.317753, 1, 0, 0, 1, 1,
0.4090951, 0.3966619, 0.6453506, 0, 0, 0, 1, 1,
0.4109126, -1.007736, 2.960204, 0, 0, 0, 1, 1,
0.4116848, 1.012829, 0.7499518, 0, 0, 0, 1, 1,
0.4124531, -0.5903105, 3.251323, 0, 0, 0, 1, 1,
0.4153088, 0.01236629, 1.006312, 0, 0, 0, 1, 1,
0.4182751, -1.486111, 2.854325, 0, 0, 0, 1, 1,
0.4182771, -0.2099988, 2.810029, 0, 0, 0, 1, 1,
0.4213585, -0.1299325, 2.981098, 1, 1, 1, 1, 1,
0.4219298, 0.952953, -0.08425198, 1, 1, 1, 1, 1,
0.4273737, 1.406371, -0.3797747, 1, 1, 1, 1, 1,
0.4275761, -1.377783, 3.767114, 1, 1, 1, 1, 1,
0.4336428, 0.4356146, 2.16351, 1, 1, 1, 1, 1,
0.4339747, 1.326291, 0.8688517, 1, 1, 1, 1, 1,
0.434257, -0.813818, 2.378476, 1, 1, 1, 1, 1,
0.4359442, -1.484202, 3.693207, 1, 1, 1, 1, 1,
0.4371141, -0.1211651, 2.331744, 1, 1, 1, 1, 1,
0.4456013, 0.1866102, 0.4604855, 1, 1, 1, 1, 1,
0.4456737, -0.3033019, 0.9529496, 1, 1, 1, 1, 1,
0.4558505, 0.4718063, 1.674023, 1, 1, 1, 1, 1,
0.4655292, -0.04720879, 4.31205, 1, 1, 1, 1, 1,
0.4661964, -0.1670972, 3.617446, 1, 1, 1, 1, 1,
0.4672039, 0.7429014, 1.975678, 1, 1, 1, 1, 1,
0.4701773, -0.53985, 2.441092, 0, 0, 1, 1, 1,
0.4731, -0.2078205, 1.489859, 1, 0, 0, 1, 1,
0.4733574, -0.7843975, 2.256389, 1, 0, 0, 1, 1,
0.4776623, -0.9361721, 3.931509, 1, 0, 0, 1, 1,
0.4844841, 1.500017, 2.124856, 1, 0, 0, 1, 1,
0.4899635, 0.4830927, 1.366515, 1, 0, 0, 1, 1,
0.4924882, -1.385457, 0.6973088, 0, 0, 0, 1, 1,
0.4941102, -0.4308138, 1.165964, 0, 0, 0, 1, 1,
0.4948477, 1.971663, 0.6433646, 0, 0, 0, 1, 1,
0.4976966, -1.958729, 3.316645, 0, 0, 0, 1, 1,
0.5009334, 2.205652, -0.4458881, 0, 0, 0, 1, 1,
0.5049024, 1.529857, 0.5118446, 0, 0, 0, 1, 1,
0.5051671, 0.835631, -0.7935411, 0, 0, 0, 1, 1,
0.5055711, 2.270283, 1.614804, 1, 1, 1, 1, 1,
0.5103665, 1.535874, 1.650881, 1, 1, 1, 1, 1,
0.5108012, -0.6142242, 1.710183, 1, 1, 1, 1, 1,
0.5131813, -1.590293, 1.093083, 1, 1, 1, 1, 1,
0.5158336, 0.9552556, -0.5467458, 1, 1, 1, 1, 1,
0.5163969, -0.1583265, 2.455041, 1, 1, 1, 1, 1,
0.5166162, -1.169771, 2.849653, 1, 1, 1, 1, 1,
0.5211202, 0.9205527, 0.6063873, 1, 1, 1, 1, 1,
0.5272346, -1.453388, 2.702275, 1, 1, 1, 1, 1,
0.5307044, 0.08579231, 2.061002, 1, 1, 1, 1, 1,
0.5321486, -0.5821279, 1.797446, 1, 1, 1, 1, 1,
0.5350113, 2.001261, 0.5398567, 1, 1, 1, 1, 1,
0.5354456, 0.02287944, 3.34323, 1, 1, 1, 1, 1,
0.5374727, -0.5116513, 2.269688, 1, 1, 1, 1, 1,
0.5384695, 0.1086194, 1.49399, 1, 1, 1, 1, 1,
0.5431764, 0.459973, 1.502856, 0, 0, 1, 1, 1,
0.5455526, -0.5370663, 0.8401039, 1, 0, 0, 1, 1,
0.5479399, -1.135769, 3.16487, 1, 0, 0, 1, 1,
0.5484697, 0.7407027, 0.7961451, 1, 0, 0, 1, 1,
0.5488392, 0.947444, 0.7158586, 1, 0, 0, 1, 1,
0.5490071, -1.934139, 1.607118, 1, 0, 0, 1, 1,
0.5512503, 1.478035, -0.2526542, 0, 0, 0, 1, 1,
0.5643989, 0.6345836, 1.983682, 0, 0, 0, 1, 1,
0.5644739, -0.1578181, 0.5580431, 0, 0, 0, 1, 1,
0.5673459, -0.3105091, 2.140231, 0, 0, 0, 1, 1,
0.5710029, 0.5989095, 2.451518, 0, 0, 0, 1, 1,
0.5712106, -0.4565215, 1.902482, 0, 0, 0, 1, 1,
0.5720225, -1.28391, 4.068594, 0, 0, 0, 1, 1,
0.5780334, 0.915486, 1.304053, 1, 1, 1, 1, 1,
0.5820498, 0.8472056, -1.559809, 1, 1, 1, 1, 1,
0.5826522, 2.077994, 0.7453906, 1, 1, 1, 1, 1,
0.6003745, -0.9467902, 2.625487, 1, 1, 1, 1, 1,
0.6019994, 1.694293, -0.3111248, 1, 1, 1, 1, 1,
0.6091514, 0.5724424, 1.789563, 1, 1, 1, 1, 1,
0.6106167, 0.0244269, 4.311973, 1, 1, 1, 1, 1,
0.611374, 1.520813, -0.02479898, 1, 1, 1, 1, 1,
0.6163499, 0.7262298, 0.4438453, 1, 1, 1, 1, 1,
0.6171483, -1.711132, 4.096778, 1, 1, 1, 1, 1,
0.6256614, 1.109742, 1.870069, 1, 1, 1, 1, 1,
0.6273188, -0.2779772, 1.192898, 1, 1, 1, 1, 1,
0.63118, 0.3312571, 0.7661856, 1, 1, 1, 1, 1,
0.6328599, -0.249934, 3.381614, 1, 1, 1, 1, 1,
0.6392626, -1.091628, 2.78305, 1, 1, 1, 1, 1,
0.6422072, 1.007783, 0.2500609, 0, 0, 1, 1, 1,
0.6469764, 0.5739612, 1.608306, 1, 0, 0, 1, 1,
0.6497141, 0.2077815, -0.1057511, 1, 0, 0, 1, 1,
0.6524454, 0.3829019, 0.1279442, 1, 0, 0, 1, 1,
0.654711, -0.6712665, 2.699401, 1, 0, 0, 1, 1,
0.6563132, 0.1333863, 2.440742, 1, 0, 0, 1, 1,
0.6627558, 1.486205, 0.1395018, 0, 0, 0, 1, 1,
0.6629105, -2.951699, 3.8082, 0, 0, 0, 1, 1,
0.6636354, 0.5107455, 1.196826, 0, 0, 0, 1, 1,
0.663942, 1.185958, -0.1339198, 0, 0, 0, 1, 1,
0.6644385, 1.149559, 1.243132, 0, 0, 0, 1, 1,
0.6656232, 1.495462, 1.541991, 0, 0, 0, 1, 1,
0.6670481, -1.227072, 1.434203, 0, 0, 0, 1, 1,
0.6725996, 0.887398, -0.07030532, 1, 1, 1, 1, 1,
0.6742994, -0.02162001, 1.056139, 1, 1, 1, 1, 1,
0.675707, 1.800999, 1.044181, 1, 1, 1, 1, 1,
0.685898, -0.2213539, 2.032454, 1, 1, 1, 1, 1,
0.6874844, 1.393576, 0.5892962, 1, 1, 1, 1, 1,
0.695788, -0.7060764, 1.791537, 1, 1, 1, 1, 1,
0.7028522, 1.524696, 0.4920302, 1, 1, 1, 1, 1,
0.7075722, -0.7280237, 1.909529, 1, 1, 1, 1, 1,
0.7119442, -0.3820396, 2.386862, 1, 1, 1, 1, 1,
0.7205788, 0.2957642, 2.182022, 1, 1, 1, 1, 1,
0.7224675, 0.4591902, 0.01335301, 1, 1, 1, 1, 1,
0.7249988, -0.1674456, 1.356054, 1, 1, 1, 1, 1,
0.7256804, -0.01799433, 0.950552, 1, 1, 1, 1, 1,
0.734133, 1.302907, 0.869635, 1, 1, 1, 1, 1,
0.7381438, 1.184791, 1.397291, 1, 1, 1, 1, 1,
0.7385966, 0.7640096, -0.806776, 0, 0, 1, 1, 1,
0.7389182, -2.168362, 3.44674, 1, 0, 0, 1, 1,
0.7403662, -0.09048428, 0.5398677, 1, 0, 0, 1, 1,
0.7405953, 0.0214596, 1.421808, 1, 0, 0, 1, 1,
0.742148, 0.05905934, 2.02896, 1, 0, 0, 1, 1,
0.7473053, 1.392437, 0.2351634, 1, 0, 0, 1, 1,
0.7536149, -0.3044877, -0.857003, 0, 0, 0, 1, 1,
0.7555947, -0.8693622, 1.730878, 0, 0, 0, 1, 1,
0.7605457, -0.7008476, 3.8306, 0, 0, 0, 1, 1,
0.7638382, -0.7406936, 1.371988, 0, 0, 0, 1, 1,
0.7680624, -1.46736, 2.722504, 0, 0, 0, 1, 1,
0.7714547, -1.066015, 2.182354, 0, 0, 0, 1, 1,
0.7720879, 0.1328319, 2.068372, 0, 0, 0, 1, 1,
0.7755517, 1.093275, 1.759258, 1, 1, 1, 1, 1,
0.7777236, -0.5980875, 3.337812, 1, 1, 1, 1, 1,
0.7794205, -0.5075772, 1.084591, 1, 1, 1, 1, 1,
0.7814494, -0.5692509, 2.439615, 1, 1, 1, 1, 1,
0.7850868, -0.2723122, 2.148127, 1, 1, 1, 1, 1,
0.7885807, -0.9679064, 3.450625, 1, 1, 1, 1, 1,
0.8010426, -2.517836, 3.696529, 1, 1, 1, 1, 1,
0.8024693, 0.2966132, 0.8531543, 1, 1, 1, 1, 1,
0.8056592, 1.686296, 1.360693, 1, 1, 1, 1, 1,
0.8092028, -0.738958, 2.12021, 1, 1, 1, 1, 1,
0.8107687, 0.09317172, 1.2951, 1, 1, 1, 1, 1,
0.8151867, 0.4044604, -0.887535, 1, 1, 1, 1, 1,
0.8164785, -0.2933673, 2.624862, 1, 1, 1, 1, 1,
0.8178719, -1.2866, 2.875308, 1, 1, 1, 1, 1,
0.8190694, -0.7459778, 4.404953, 1, 1, 1, 1, 1,
0.820583, 0.503132, 1.35242, 0, 0, 1, 1, 1,
0.8240116, -0.03464529, 1.142887, 1, 0, 0, 1, 1,
0.8254009, 0.2835985, 1.971163, 1, 0, 0, 1, 1,
0.8275844, -0.1464744, 0.2734041, 1, 0, 0, 1, 1,
0.8325907, 1.713303, -1.412588, 1, 0, 0, 1, 1,
0.841283, -0.8598846, 1.006902, 1, 0, 0, 1, 1,
0.8431597, -0.4020557, 1.927599, 0, 0, 0, 1, 1,
0.8443109, -0.02579498, 2.631359, 0, 0, 0, 1, 1,
0.8487401, -1.600817, 1.662754, 0, 0, 0, 1, 1,
0.8540987, -1.684222, 3.50742, 0, 0, 0, 1, 1,
0.8545913, 0.7423781, -0.4881002, 0, 0, 0, 1, 1,
0.8560556, 0.4422503, 2.213695, 0, 0, 0, 1, 1,
0.8563992, 0.02228714, 2.356469, 0, 0, 0, 1, 1,
0.8572767, 0.2191013, -0.7779446, 1, 1, 1, 1, 1,
0.8622239, 0.5089204, 2.912915, 1, 1, 1, 1, 1,
0.8655406, -0.2126644, 1.439177, 1, 1, 1, 1, 1,
0.8684813, 0.3575316, 0.8301719, 1, 1, 1, 1, 1,
0.8745307, -0.3837498, 1.152708, 1, 1, 1, 1, 1,
0.8746953, -0.3328917, 2.374468, 1, 1, 1, 1, 1,
0.8770696, 1.827032, -2.312653, 1, 1, 1, 1, 1,
0.8772864, 0.6987187, 1.591182, 1, 1, 1, 1, 1,
0.8773013, -3.682361, 0.6415334, 1, 1, 1, 1, 1,
0.8792972, 1.016789, -0.8456513, 1, 1, 1, 1, 1,
0.8821649, -0.615789, 0.9868433, 1, 1, 1, 1, 1,
0.8854264, -1.314561, 1.732755, 1, 1, 1, 1, 1,
0.8876938, -0.676504, 0.7074526, 1, 1, 1, 1, 1,
0.8906863, 1.072783, 1.512383, 1, 1, 1, 1, 1,
0.8914877, -1.939151, 1.373555, 1, 1, 1, 1, 1,
0.8968141, 0.9644977, 0.3152574, 0, 0, 1, 1, 1,
0.9006886, -0.4616807, 3.032265, 1, 0, 0, 1, 1,
0.9010268, -0.6751225, 2.011953, 1, 0, 0, 1, 1,
0.9039864, 1.425265, -0.5065649, 1, 0, 0, 1, 1,
0.9147764, 0.3060231, 0.9025509, 1, 0, 0, 1, 1,
0.9236144, 0.9062381, -0.3793814, 1, 0, 0, 1, 1,
0.9269843, -0.5188321, 2.011154, 0, 0, 0, 1, 1,
0.9294562, -0.5319176, 2.503911, 0, 0, 0, 1, 1,
0.9350227, 0.3452254, 2.490154, 0, 0, 0, 1, 1,
0.9357608, -0.8568035, 2.445193, 0, 0, 0, 1, 1,
0.9377401, 0.9585687, 1.364651, 0, 0, 0, 1, 1,
0.9580804, -1.970537, 3.921253, 0, 0, 0, 1, 1,
0.9638572, -1.062536, 2.349437, 0, 0, 0, 1, 1,
0.9711249, -0.1754239, 1.533761, 1, 1, 1, 1, 1,
0.9716293, -0.9469272, 3.38767, 1, 1, 1, 1, 1,
0.9726477, 1.22657, 0.6062719, 1, 1, 1, 1, 1,
0.9766811, -1.015628, 1.383049, 1, 1, 1, 1, 1,
0.9846677, -0.9607233, 3.181626, 1, 1, 1, 1, 1,
0.9859198, 0.4687488, 0.827256, 1, 1, 1, 1, 1,
0.988421, -0.1974798, 2.505052, 1, 1, 1, 1, 1,
0.9916406, 0.4901121, 1.04362, 1, 1, 1, 1, 1,
0.9955168, 1.942626, 0.6499607, 1, 1, 1, 1, 1,
1.004958, -0.2992395, 2.110738, 1, 1, 1, 1, 1,
1.007471, 0.8874041, 2.722744, 1, 1, 1, 1, 1,
1.013218, 0.5466875, 1.358159, 1, 1, 1, 1, 1,
1.028847, 0.9318274, 2.078595, 1, 1, 1, 1, 1,
1.041145, -1.240602, 1.729784, 1, 1, 1, 1, 1,
1.042623, 0.2489977, 0.6853274, 1, 1, 1, 1, 1,
1.043357, 0.2696017, 2.383854, 0, 0, 1, 1, 1,
1.043897, -0.4589708, 1.944517, 1, 0, 0, 1, 1,
1.044733, 0.2332377, 2.409905, 1, 0, 0, 1, 1,
1.045868, -0.01904341, 1.361986, 1, 0, 0, 1, 1,
1.046034, 0.05786123, 2.685681, 1, 0, 0, 1, 1,
1.051638, 0.6323059, -0.1155316, 1, 0, 0, 1, 1,
1.052326, -0.7465393, 2.1892, 0, 0, 0, 1, 1,
1.05469, -0.05996027, 1.39057, 0, 0, 0, 1, 1,
1.069441, 0.3198503, 3.118835, 0, 0, 0, 1, 1,
1.081954, 0.2352214, 1.144458, 0, 0, 0, 1, 1,
1.084991, 0.3187573, 0.9482176, 0, 0, 0, 1, 1,
1.090124, -0.4160354, 1.681474, 0, 0, 0, 1, 1,
1.093638, 1.107298, 0.8920022, 0, 0, 0, 1, 1,
1.096505, 0.513912, 0.6568599, 1, 1, 1, 1, 1,
1.101094, 1.383345, 1.05483, 1, 1, 1, 1, 1,
1.102344, -0.51853, 3.411785, 1, 1, 1, 1, 1,
1.102591, -0.7413759, 4.163968, 1, 1, 1, 1, 1,
1.112456, 0.5798199, 1.760676, 1, 1, 1, 1, 1,
1.122446, 0.0007022257, 1.034832, 1, 1, 1, 1, 1,
1.122846, 0.05440683, 2.633134, 1, 1, 1, 1, 1,
1.125035, 1.001152, 1.656625, 1, 1, 1, 1, 1,
1.151068, -0.771071, 1.525895, 1, 1, 1, 1, 1,
1.15206, -0.1835449, 3.950003, 1, 1, 1, 1, 1,
1.165319, -0.5411667, 3.043578, 1, 1, 1, 1, 1,
1.168605, 0.9147638, 0.6736438, 1, 1, 1, 1, 1,
1.172641, 0.5422103, 0.9877788, 1, 1, 1, 1, 1,
1.172767, 1.20135, -0.1719729, 1, 1, 1, 1, 1,
1.175452, 1.914635, 0.008572201, 1, 1, 1, 1, 1,
1.176912, 0.6593202, 2.233948, 0, 0, 1, 1, 1,
1.193853, 0.7108077, 0.5237167, 1, 0, 0, 1, 1,
1.195553, -0.04307762, 2.832648, 1, 0, 0, 1, 1,
1.19916, -2.288627, 3.807292, 1, 0, 0, 1, 1,
1.199415, 0.8237556, 2.14737, 1, 0, 0, 1, 1,
1.204936, -1.628129, 1.781935, 1, 0, 0, 1, 1,
1.213468, -0.3216117, 2.512533, 0, 0, 0, 1, 1,
1.21873, -0.2457844, 2.08782, 0, 0, 0, 1, 1,
1.229179, 0.6616373, 2.879899, 0, 0, 0, 1, 1,
1.232268, 1.40689, 2.500692, 0, 0, 0, 1, 1,
1.232428, -1.735492, 2.554511, 0, 0, 0, 1, 1,
1.233138, -0.8745836, 1.698027, 0, 0, 0, 1, 1,
1.237619, -1.577871, 2.539373, 0, 0, 0, 1, 1,
1.248797, 0.577812, 1.022433, 1, 1, 1, 1, 1,
1.249933, 1.2532, 0.9131501, 1, 1, 1, 1, 1,
1.251055, -1.514488, 2.952441, 1, 1, 1, 1, 1,
1.253456, -1.829694, 2.738107, 1, 1, 1, 1, 1,
1.258723, 0.354085, 0.6827021, 1, 1, 1, 1, 1,
1.267596, -1.237951, 3.619411, 1, 1, 1, 1, 1,
1.267792, 0.4165168, 0.3287503, 1, 1, 1, 1, 1,
1.276131, 0.6351933, -1.1481, 1, 1, 1, 1, 1,
1.276181, -0.4445438, 2.180384, 1, 1, 1, 1, 1,
1.281809, -0.92351, 2.951144, 1, 1, 1, 1, 1,
1.293529, -1.172564, 1.651678, 1, 1, 1, 1, 1,
1.29513, -0.3020931, 2.093256, 1, 1, 1, 1, 1,
1.297455, -0.4178584, 2.446843, 1, 1, 1, 1, 1,
1.310986, 1.648165, 0.6929814, 1, 1, 1, 1, 1,
1.311131, 1.914954, -1.033094, 1, 1, 1, 1, 1,
1.316022, 0.6624243, 1.285253, 0, 0, 1, 1, 1,
1.330572, 0.5535504, 1.555132, 1, 0, 0, 1, 1,
1.337181, -0.8369967, 1.881392, 1, 0, 0, 1, 1,
1.349185, -1.874159, 1.088545, 1, 0, 0, 1, 1,
1.358754, -0.05609915, 2.724073, 1, 0, 0, 1, 1,
1.364908, 1.31587, 1.633236, 1, 0, 0, 1, 1,
1.364957, 0.5303825, 1.710268, 0, 0, 0, 1, 1,
1.365526, -1.424779, 3.396549, 0, 0, 0, 1, 1,
1.367566, -0.1301747, 3.393596, 0, 0, 0, 1, 1,
1.369816, -0.01253119, 1.11821, 0, 0, 0, 1, 1,
1.380467, 0.4659147, 0.1909515, 0, 0, 0, 1, 1,
1.381964, 0.4929073, 0.9311989, 0, 0, 0, 1, 1,
1.385214, 0.8031461, 0.8323336, 0, 0, 0, 1, 1,
1.386471, -0.8138224, 2.03013, 1, 1, 1, 1, 1,
1.388494, -0.7221861, 1.834245, 1, 1, 1, 1, 1,
1.39101, -1.161941, 3.249739, 1, 1, 1, 1, 1,
1.391097, -0.015123, 1.317307, 1, 1, 1, 1, 1,
1.3981, -0.8685097, -0.2319748, 1, 1, 1, 1, 1,
1.402029, 0.2399628, 2.461736, 1, 1, 1, 1, 1,
1.404001, -0.4326928, 1.519467, 1, 1, 1, 1, 1,
1.405144, 0.896323, 1.803057, 1, 1, 1, 1, 1,
1.407374, 0.7879126, 1.057044, 1, 1, 1, 1, 1,
1.407824, -0.525607, 0.0848383, 1, 1, 1, 1, 1,
1.408393, 1.716152, 2.542403, 1, 1, 1, 1, 1,
1.410338, 0.5036846, 1.304818, 1, 1, 1, 1, 1,
1.413711, 0.3374506, 1.191314, 1, 1, 1, 1, 1,
1.427191, 0.8453087, 1.317214, 1, 1, 1, 1, 1,
1.428376, 1.917192, 0.7524286, 1, 1, 1, 1, 1,
1.434501, 0.6138355, 1.708649, 0, 0, 1, 1, 1,
1.446355, 0.590625, 1.338576, 1, 0, 0, 1, 1,
1.447895, -0.4278484, 1.476862, 1, 0, 0, 1, 1,
1.450666, -0.1379546, 2.482571, 1, 0, 0, 1, 1,
1.461341, 1.113197, 2.613712, 1, 0, 0, 1, 1,
1.469006, -0.02787423, 2.301402, 1, 0, 0, 1, 1,
1.469146, 1.478499, 0.973289, 0, 0, 0, 1, 1,
1.469252, 1.831007, -0.3297219, 0, 0, 0, 1, 1,
1.474073, 1.931808, 0.6858647, 0, 0, 0, 1, 1,
1.484982, -1.063752, 3.152119, 0, 0, 0, 1, 1,
1.485377, -2.804292, 3.808384, 0, 0, 0, 1, 1,
1.486388, 0.5632528, 0.3616557, 0, 0, 0, 1, 1,
1.487028, -0.7135228, 1.276958, 0, 0, 0, 1, 1,
1.496423, 2.04941, 1.422737, 1, 1, 1, 1, 1,
1.496791, 1.263272, 1.169653, 1, 1, 1, 1, 1,
1.499537, 0.6659248, 0.2789275, 1, 1, 1, 1, 1,
1.501998, 0.3952111, 1.259299, 1, 1, 1, 1, 1,
1.507586, -0.4085107, 1.700473, 1, 1, 1, 1, 1,
1.508731, -0.599013, 2.206802, 1, 1, 1, 1, 1,
1.511139, 0.5313052, 1.965113, 1, 1, 1, 1, 1,
1.512232, 0.4064723, 3.150061, 1, 1, 1, 1, 1,
1.514272, -0.8090848, 0.2793047, 1, 1, 1, 1, 1,
1.518968, 0.42979, 2.876919, 1, 1, 1, 1, 1,
1.523159, -0.03285314, 3.127575, 1, 1, 1, 1, 1,
1.535908, -0.296253, 0.8726571, 1, 1, 1, 1, 1,
1.536126, 1.114328, 1.633073, 1, 1, 1, 1, 1,
1.541848, -0.2311606, 2.045954, 1, 1, 1, 1, 1,
1.553727, -1.295901, 2.402629, 1, 1, 1, 1, 1,
1.557239, -0.307918, 2.470139, 0, 0, 1, 1, 1,
1.55924, -1.775361, 2.341943, 1, 0, 0, 1, 1,
1.564368, 1.53361, 0.8482326, 1, 0, 0, 1, 1,
1.569138, 1.297221, 0.5394311, 1, 0, 0, 1, 1,
1.570298, 0.1868602, 0.7084579, 1, 0, 0, 1, 1,
1.584825, 0.6366596, 1.443803, 1, 0, 0, 1, 1,
1.585761, -0.6885747, 1.041588, 0, 0, 0, 1, 1,
1.592348, -0.05933693, 3.037498, 0, 0, 0, 1, 1,
1.592506, -0.6553519, 2.8953, 0, 0, 0, 1, 1,
1.596389, -1.043137, 1.922027, 0, 0, 0, 1, 1,
1.606674, -0.03224126, 0.7105367, 0, 0, 0, 1, 1,
1.622526, -0.4088828, 1.61393, 0, 0, 0, 1, 1,
1.626233, -1.435343, 0.7011657, 0, 0, 0, 1, 1,
1.631735, -0.211273, 0.5469056, 1, 1, 1, 1, 1,
1.646262, -0.3530577, 2.226268, 1, 1, 1, 1, 1,
1.651692, 1.118745, 0.9951407, 1, 1, 1, 1, 1,
1.654451, -0.9318998, 2.098156, 1, 1, 1, 1, 1,
1.657759, -0.6078714, 2.424259, 1, 1, 1, 1, 1,
1.659879, 0.4716036, 0.6557643, 1, 1, 1, 1, 1,
1.661511, -0.6431372, 1.370252, 1, 1, 1, 1, 1,
1.664748, 0.7060759, 1.077168, 1, 1, 1, 1, 1,
1.693728, -0.2694584, 0.1125746, 1, 1, 1, 1, 1,
1.723814, -0.9487075, 2.365279, 1, 1, 1, 1, 1,
1.72476, -0.5187598, 3.351738, 1, 1, 1, 1, 1,
1.730046, 1.690322, 1.830525, 1, 1, 1, 1, 1,
1.734508, -0.5892653, 1.773502, 1, 1, 1, 1, 1,
1.763239, 0.3626388, 1.539037, 1, 1, 1, 1, 1,
1.769328, 0.60715, 1.549147, 1, 1, 1, 1, 1,
1.776769, 1.0924, 1.235452, 0, 0, 1, 1, 1,
1.783583, 1.443566, -0.215458, 1, 0, 0, 1, 1,
1.785743, 0.1255228, 1.286812, 1, 0, 0, 1, 1,
1.791088, -0.9554568, 2.456316, 1, 0, 0, 1, 1,
1.862375, -0.2189676, 0.4646549, 1, 0, 0, 1, 1,
1.882933, -0.6590037, 1.109871, 1, 0, 0, 1, 1,
1.894517, -1.219133, 3.400975, 0, 0, 0, 1, 1,
1.907044, -0.9948441, 2.400826, 0, 0, 0, 1, 1,
1.915505, 0.8787515, 3.529138, 0, 0, 0, 1, 1,
1.915812, -0.07885959, 1.615908, 0, 0, 0, 1, 1,
1.929547, -0.8426916, 1.739895, 0, 0, 0, 1, 1,
1.929877, 0.08613009, 4.851988, 0, 0, 0, 1, 1,
1.937331, -0.8385288, 1.969798, 0, 0, 0, 1, 1,
1.940639, 0.5651543, 1.172036, 1, 1, 1, 1, 1,
1.941818, -1.26457, 2.984682, 1, 1, 1, 1, 1,
1.946501, -1.412723, 1.532001, 1, 1, 1, 1, 1,
1.964849, 0.2184214, 0.9397039, 1, 1, 1, 1, 1,
1.979484, 0.0584687, 3.527745, 1, 1, 1, 1, 1,
1.988166, 1.430675, 1.188554, 1, 1, 1, 1, 1,
1.992551, 2.034214, -0.5762772, 1, 1, 1, 1, 1,
1.992687, 0.3858107, 0.5959421, 1, 1, 1, 1, 1,
1.999307, 0.5913138, 2.057549, 1, 1, 1, 1, 1,
2.023821, -0.6276748, 2.987556, 1, 1, 1, 1, 1,
2.064352, -0.4141889, 2.290483, 1, 1, 1, 1, 1,
2.071434, -0.4322279, 2.209415, 1, 1, 1, 1, 1,
2.08956, 0.3270286, 0.4579319, 1, 1, 1, 1, 1,
2.150851, 0.1368064, 2.967477, 1, 1, 1, 1, 1,
2.163658, -2.080048, 3.492976, 1, 1, 1, 1, 1,
2.191714, 0.1218557, 0.3328052, 0, 0, 1, 1, 1,
2.225753, 0.04273718, 3.094388, 1, 0, 0, 1, 1,
2.262291, -0.1750209, 3.154428, 1, 0, 0, 1, 1,
2.283384, -1.152517, 2.583651, 1, 0, 0, 1, 1,
2.295911, 0.4946092, 0.9477877, 1, 0, 0, 1, 1,
2.38599, 1.076758, -0.3402511, 1, 0, 0, 1, 1,
2.388168, -0.4981338, 1.156268, 0, 0, 0, 1, 1,
2.425027, 0.175248, 2.286703, 0, 0, 0, 1, 1,
2.44475, 0.00577698, 2.360253, 0, 0, 0, 1, 1,
2.528252, -0.7086001, 2.53085, 0, 0, 0, 1, 1,
2.549115, 1.335785, 1.627725, 0, 0, 0, 1, 1,
2.621971, 0.276061, 1.501467, 0, 0, 0, 1, 1,
2.644639, -1.113391, 2.269313, 0, 0, 0, 1, 1,
2.691433, -0.5309423, -0.5281011, 1, 1, 1, 1, 1,
2.691691, -0.9998024, 1.443968, 1, 1, 1, 1, 1,
2.749826, 0.4686014, 3.18451, 1, 1, 1, 1, 1,
2.773906, 1.777095, 0.7781927, 1, 1, 1, 1, 1,
2.835991, 0.6164841, 0.4182409, 1, 1, 1, 1, 1,
3.732195, 0.3754522, -1.080957, 1, 1, 1, 1, 1,
3.992045, -1.652251, 1.10454, 1, 1, 1, 1, 1
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
var radius = 9.583099;
var distance = 33.66023;
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
mvMatrix.translate( -0.3835793, 0.4338186, -0.1041174 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66023);
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
