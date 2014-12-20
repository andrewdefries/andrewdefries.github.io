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
-3.063871, -0.8935092, -2.754904, 1, 0, 0, 1,
-3.026214, 0.5919397, -0.04292371, 1, 0.007843138, 0, 1,
-2.802359, 0.5896721, -0.6452883, 1, 0.01176471, 0, 1,
-2.688372, 1.663499, -2.247443, 1, 0.01960784, 0, 1,
-2.504999, -1.270531, -0.5348426, 1, 0.02352941, 0, 1,
-2.430089, -0.5708423, -2.18392, 1, 0.03137255, 0, 1,
-2.296134, -1.072028, -2.447176, 1, 0.03529412, 0, 1,
-2.28248, 0.3319626, -1.438607, 1, 0.04313726, 0, 1,
-2.177822, -1.193427, -3.309896, 1, 0.04705882, 0, 1,
-2.163936, -0.5107576, -0.6454142, 1, 0.05490196, 0, 1,
-2.140632, 1.064706, -2.147072, 1, 0.05882353, 0, 1,
-2.13833, 1.628356, -0.4496095, 1, 0.06666667, 0, 1,
-2.127823, 0.9391361, -0.5400468, 1, 0.07058824, 0, 1,
-2.127292, -0.5952852, -1.261014, 1, 0.07843138, 0, 1,
-2.116914, 0.3239466, -0.5714584, 1, 0.08235294, 0, 1,
-2.101008, 1.461817, -0.5798094, 1, 0.09019608, 0, 1,
-2.081907, -0.6720376, -0.5061426, 1, 0.09411765, 0, 1,
-1.960925, 0.5121841, -1.033193, 1, 0.1019608, 0, 1,
-1.959503, -2.836092, -1.678868, 1, 0.1098039, 0, 1,
-1.946241, -0.5163315, -1.89303, 1, 0.1137255, 0, 1,
-1.90335, 1.811828, -0.9456272, 1, 0.1215686, 0, 1,
-1.895886, 0.6608313, -1.762859, 1, 0.1254902, 0, 1,
-1.880767, 0.7651561, -1.883349, 1, 0.1333333, 0, 1,
-1.879457, 2.35826, -1.397476, 1, 0.1372549, 0, 1,
-1.875586, -0.2410518, -2.339728, 1, 0.145098, 0, 1,
-1.857279, 0.979755, -1.371498, 1, 0.1490196, 0, 1,
-1.855995, 0.2341748, -1.643329, 1, 0.1568628, 0, 1,
-1.842496, 0.2994946, -1.335661, 1, 0.1607843, 0, 1,
-1.833175, 0.3887379, -2.327953, 1, 0.1686275, 0, 1,
-1.780683, 1.401978, -2.41695, 1, 0.172549, 0, 1,
-1.763452, 0.7832489, -0.08572931, 1, 0.1803922, 0, 1,
-1.762935, 0.1094879, -1.649348, 1, 0.1843137, 0, 1,
-1.746582, 0.7389842, -1.783456, 1, 0.1921569, 0, 1,
-1.743193, -1.49924, -0.4693323, 1, 0.1960784, 0, 1,
-1.740031, -0.6551963, -1.80701, 1, 0.2039216, 0, 1,
-1.734826, 0.5013255, -2.245468, 1, 0.2117647, 0, 1,
-1.720775, 0.2324801, -2.573425, 1, 0.2156863, 0, 1,
-1.669168, 0.5364048, -0.8977336, 1, 0.2235294, 0, 1,
-1.668217, -1.296993, -2.544042, 1, 0.227451, 0, 1,
-1.665478, 1.17227, -0.5261564, 1, 0.2352941, 0, 1,
-1.656321, 0.6495016, -2.230878, 1, 0.2392157, 0, 1,
-1.655334, 1.631358, -1.057603, 1, 0.2470588, 0, 1,
-1.649719, 0.8873729, -1.345115, 1, 0.2509804, 0, 1,
-1.642783, -0.3489471, -1.54165, 1, 0.2588235, 0, 1,
-1.636679, 1.129255, 0.07879273, 1, 0.2627451, 0, 1,
-1.619928, 1.116092, -1.377328, 1, 0.2705882, 0, 1,
-1.587166, -1.35494, -3.135584, 1, 0.2745098, 0, 1,
-1.586554, -1.020267, -2.092021, 1, 0.282353, 0, 1,
-1.577958, 0.0312513, -1.683001, 1, 0.2862745, 0, 1,
-1.569148, 0.4391864, 0.200633, 1, 0.2941177, 0, 1,
-1.556881, 1.412676, -1.549441, 1, 0.3019608, 0, 1,
-1.555664, 0.2163485, -1.617617, 1, 0.3058824, 0, 1,
-1.552159, 0.9750638, -2.209788, 1, 0.3137255, 0, 1,
-1.547581, 0.9861528, -1.119401, 1, 0.3176471, 0, 1,
-1.54465, -3.30025, -3.663923, 1, 0.3254902, 0, 1,
-1.538271, 1.115202, -0.7295601, 1, 0.3294118, 0, 1,
-1.524187, 0.7932692, -1.677169, 1, 0.3372549, 0, 1,
-1.522551, 0.2807814, -0.7219225, 1, 0.3411765, 0, 1,
-1.515177, -0.2460369, -2.936249, 1, 0.3490196, 0, 1,
-1.504791, 1.3723, -0.1212126, 1, 0.3529412, 0, 1,
-1.48806, -0.7936519, 0.4839801, 1, 0.3607843, 0, 1,
-1.482785, -1.985373, -2.307876, 1, 0.3647059, 0, 1,
-1.478547, -0.06069762, -1.139634, 1, 0.372549, 0, 1,
-1.473477, 0.11213, -2.825376, 1, 0.3764706, 0, 1,
-1.4703, 0.009039466, -1.706346, 1, 0.3843137, 0, 1,
-1.435205, -1.303755, -4.623544, 1, 0.3882353, 0, 1,
-1.430938, -1.437089, -3.896207, 1, 0.3960784, 0, 1,
-1.426868, 0.09204962, -2.636683, 1, 0.4039216, 0, 1,
-1.382254, 0.907247, -1.772822, 1, 0.4078431, 0, 1,
-1.372441, 0.4246649, -0.336902, 1, 0.4156863, 0, 1,
-1.365811, -0.7558596, -3.352178, 1, 0.4196078, 0, 1,
-1.363404, -0.1062098, -1.094949, 1, 0.427451, 0, 1,
-1.352911, -0.6786925, 0.1889248, 1, 0.4313726, 0, 1,
-1.344131, 0.7360307, 0.007542275, 1, 0.4392157, 0, 1,
-1.342121, -0.08881903, -0.8907374, 1, 0.4431373, 0, 1,
-1.341472, 0.1251414, -2.358778, 1, 0.4509804, 0, 1,
-1.34063, -0.7887182, -2.203542, 1, 0.454902, 0, 1,
-1.319226, -0.5375594, -1.295569, 1, 0.4627451, 0, 1,
-1.314625, -0.6136878, -3.669535, 1, 0.4666667, 0, 1,
-1.313293, 0.4642942, 0.2312828, 1, 0.4745098, 0, 1,
-1.313102, 0.2369066, -1.419001, 1, 0.4784314, 0, 1,
-1.267139, -0.2792361, -0.5755441, 1, 0.4862745, 0, 1,
-1.262883, 1.219862, -0.1394963, 1, 0.4901961, 0, 1,
-1.251469, 1.616663, 0.2221414, 1, 0.4980392, 0, 1,
-1.242081, -0.276913, -9.011348e-05, 1, 0.5058824, 0, 1,
-1.238024, -1.433741, -3.713449, 1, 0.509804, 0, 1,
-1.224069, 0.5445358, -3.473913, 1, 0.5176471, 0, 1,
-1.223307, 0.7159912, 0.3562964, 1, 0.5215687, 0, 1,
-1.215934, -0.7340716, -2.374358, 1, 0.5294118, 0, 1,
-1.214834, 2.140174, -0.8235143, 1, 0.5333334, 0, 1,
-1.210045, -1.040429, -0.2974671, 1, 0.5411765, 0, 1,
-1.204883, 0.3654364, -0.772827, 1, 0.5450981, 0, 1,
-1.202922, 0.4747409, -1.623172, 1, 0.5529412, 0, 1,
-1.199858, 0.02058054, -2.248917, 1, 0.5568628, 0, 1,
-1.192649, -0.6462697, -2.356481, 1, 0.5647059, 0, 1,
-1.187766, -0.02341461, -0.1025257, 1, 0.5686275, 0, 1,
-1.186154, 1.589614, -0.9419481, 1, 0.5764706, 0, 1,
-1.182752, -0.7011453, -2.474867, 1, 0.5803922, 0, 1,
-1.182741, 1.196205, -1.907049, 1, 0.5882353, 0, 1,
-1.180887, -0.8584777, -3.169209, 1, 0.5921569, 0, 1,
-1.172876, 1.907577, 0.8861653, 1, 0.6, 0, 1,
-1.170424, -1.208441, -3.569672, 1, 0.6078432, 0, 1,
-1.168223, -1.043277, -3.606683, 1, 0.6117647, 0, 1,
-1.16557, 0.1550258, -0.3363563, 1, 0.6196079, 0, 1,
-1.159416, 0.6004437, -0.1076944, 1, 0.6235294, 0, 1,
-1.146348, 1.28572, -1.633231, 1, 0.6313726, 0, 1,
-1.142232, -3.104594, -1.455075, 1, 0.6352941, 0, 1,
-1.137212, 1.844838, -1.457551, 1, 0.6431373, 0, 1,
-1.129627, -0.07072308, -0.925737, 1, 0.6470588, 0, 1,
-1.118531, -0.08219589, -0.6736258, 1, 0.654902, 0, 1,
-1.118451, -0.586578, -0.7365085, 1, 0.6588235, 0, 1,
-1.114974, -0.505116, -2.432407, 1, 0.6666667, 0, 1,
-1.109723, -2.349977, -3.075381, 1, 0.6705883, 0, 1,
-1.089921, -0.9627995, -2.491113, 1, 0.6784314, 0, 1,
-1.088055, 1.228402, -0.8139801, 1, 0.682353, 0, 1,
-1.073032, 0.3127154, -1.129376, 1, 0.6901961, 0, 1,
-1.071793, 0.2421378, -0.6950457, 1, 0.6941177, 0, 1,
-1.065569, -0.5503679, -3.13856, 1, 0.7019608, 0, 1,
-1.06473, -0.4475388, -2.618071, 1, 0.7098039, 0, 1,
-1.060394, -0.8204712, -1.916232, 1, 0.7137255, 0, 1,
-1.057745, -0.559118, -1.062286, 1, 0.7215686, 0, 1,
-1.049265, 1.179104, -0.4498885, 1, 0.7254902, 0, 1,
-1.036345, -1.497843, -1.709186, 1, 0.7333333, 0, 1,
-1.034527, -0.7356273, -1.729687, 1, 0.7372549, 0, 1,
-1.027735, -0.2790453, -1.196352, 1, 0.7450981, 0, 1,
-1.027687, -0.05972569, -1.172929, 1, 0.7490196, 0, 1,
-1.021867, -0.1562356, -2.404271, 1, 0.7568628, 0, 1,
-1.017999, -1.453924, -3.17469, 1, 0.7607843, 0, 1,
-1.016986, 0.9261685, -1.818666, 1, 0.7686275, 0, 1,
-1.012506, 0.1796444, -2.207832, 1, 0.772549, 0, 1,
-1.012179, -0.8684291, -2.083616, 1, 0.7803922, 0, 1,
-1.011947, 0.3974358, -0.01122089, 1, 0.7843137, 0, 1,
-1.000815, 0.7979335, -0.8944916, 1, 0.7921569, 0, 1,
-0.9962221, 1.035454, -1.455167, 1, 0.7960784, 0, 1,
-0.9958805, 2.432861, 0.08525661, 1, 0.8039216, 0, 1,
-0.9902996, 0.9619608, -1.422979, 1, 0.8117647, 0, 1,
-0.9832454, 1.104709, -2.085897, 1, 0.8156863, 0, 1,
-0.9748989, -1.289885, -2.022699, 1, 0.8235294, 0, 1,
-0.9738576, -1.065367, -3.662577, 1, 0.827451, 0, 1,
-0.97168, 0.3113796, -2.342831, 1, 0.8352941, 0, 1,
-0.9700452, -0.9881756, -2.872185, 1, 0.8392157, 0, 1,
-0.9657426, -0.3533055, -2.774703, 1, 0.8470588, 0, 1,
-0.9586436, 2.095923, -1.25013, 1, 0.8509804, 0, 1,
-0.9586002, -1.399196, -3.741562, 1, 0.8588235, 0, 1,
-0.9512554, -0.523439, -2.623111, 1, 0.8627451, 0, 1,
-0.9459577, 0.4272988, -1.785126, 1, 0.8705882, 0, 1,
-0.9411986, 0.6594064, -1.274809, 1, 0.8745098, 0, 1,
-0.9394256, 0.4607027, 0.1288389, 1, 0.8823529, 0, 1,
-0.9322063, 0.708226, -1.823859, 1, 0.8862745, 0, 1,
-0.9226669, -1.083153, -4.336309, 1, 0.8941177, 0, 1,
-0.917944, -1.027155, -1.646688, 1, 0.8980392, 0, 1,
-0.91283, 0.1632871, 0.5242533, 1, 0.9058824, 0, 1,
-0.9104491, 1.406547, 0.2177718, 1, 0.9137255, 0, 1,
-0.9094457, 1.231138, 0.1287369, 1, 0.9176471, 0, 1,
-0.9033229, 1.769947, 2.597798, 1, 0.9254902, 0, 1,
-0.8986916, 1.475792, 0.5931283, 1, 0.9294118, 0, 1,
-0.8982329, -0.5259951, -1.416398, 1, 0.9372549, 0, 1,
-0.8916162, -1.160558, -0.04783718, 1, 0.9411765, 0, 1,
-0.8913504, 0.8668611, -2.808371, 1, 0.9490196, 0, 1,
-0.8898572, 0.1864034, -1.108408, 1, 0.9529412, 0, 1,
-0.8822433, -0.1312654, -0.5051477, 1, 0.9607843, 0, 1,
-0.881249, -1.39888, -0.7725298, 1, 0.9647059, 0, 1,
-0.8765487, 0.7884853, -0.6236384, 1, 0.972549, 0, 1,
-0.8698297, -0.01154063, -2.586183, 1, 0.9764706, 0, 1,
-0.8634226, 0.3630013, -2.530296, 1, 0.9843137, 0, 1,
-0.8584632, 0.4884658, -0.3322566, 1, 0.9882353, 0, 1,
-0.8573285, -0.7105356, -1.258577, 1, 0.9960784, 0, 1,
-0.8494263, -0.2048859, -1.893186, 0.9960784, 1, 0, 1,
-0.849077, -0.4041226, -2.646934, 0.9921569, 1, 0, 1,
-0.8464808, 1.197635, -0.6273388, 0.9843137, 1, 0, 1,
-0.8426579, -0.3722284, -1.533577, 0.9803922, 1, 0, 1,
-0.8406048, 2.212624, -0.2290368, 0.972549, 1, 0, 1,
-0.8383433, 1.758643, -0.7805465, 0.9686275, 1, 0, 1,
-0.829012, 0.4653384, -1.768849, 0.9607843, 1, 0, 1,
-0.8288503, 2.754216, 0.8224503, 0.9568627, 1, 0, 1,
-0.8285648, -1.889214, -3.559646, 0.9490196, 1, 0, 1,
-0.82775, -2.364844, -2.107056, 0.945098, 1, 0, 1,
-0.8254005, 0.1617175, -1.904475, 0.9372549, 1, 0, 1,
-0.8253261, 0.2165072, -0.2460451, 0.9333333, 1, 0, 1,
-0.8239372, -0.556794, -2.536161, 0.9254902, 1, 0, 1,
-0.8206041, -0.08311339, -2.026255, 0.9215686, 1, 0, 1,
-0.8103949, -0.07052115, -2.72287, 0.9137255, 1, 0, 1,
-0.8043213, -0.1688428, -1.5643, 0.9098039, 1, 0, 1,
-0.8035725, 0.6613014, 1.123484, 0.9019608, 1, 0, 1,
-0.7993669, 0.1276371, -1.234525, 0.8941177, 1, 0, 1,
-0.7969982, -2.243477, -4.037366, 0.8901961, 1, 0, 1,
-0.7918278, -0.3792812, -2.211806, 0.8823529, 1, 0, 1,
-0.7898535, 0.111563, -0.2590215, 0.8784314, 1, 0, 1,
-0.7857535, -2.401862, -1.832326, 0.8705882, 1, 0, 1,
-0.7782874, 1.044819, -0.5181001, 0.8666667, 1, 0, 1,
-0.7780809, -0.3676736, 0.0186256, 0.8588235, 1, 0, 1,
-0.7742129, 0.3531215, -1.969189, 0.854902, 1, 0, 1,
-0.7738779, 0.2322601, -1.658975, 0.8470588, 1, 0, 1,
-0.7685522, 1.325279, 0.09009951, 0.8431373, 1, 0, 1,
-0.7659538, 0.2518569, -1.072411, 0.8352941, 1, 0, 1,
-0.7652326, -0.4948417, -0.7091331, 0.8313726, 1, 0, 1,
-0.7648228, -0.8125955, -1.34578, 0.8235294, 1, 0, 1,
-0.7605597, -0.6447648, -2.818085, 0.8196079, 1, 0, 1,
-0.7549301, 0.1538472, -1.650902, 0.8117647, 1, 0, 1,
-0.754239, 0.3734353, -1.950219, 0.8078431, 1, 0, 1,
-0.7525955, -1.890723, -2.529388, 0.8, 1, 0, 1,
-0.75203, -0.4560937, -2.800078, 0.7921569, 1, 0, 1,
-0.7497824, 1.217713, -0.8850023, 0.7882353, 1, 0, 1,
-0.7496799, 0.3730719, -1.027525, 0.7803922, 1, 0, 1,
-0.7494778, 1.388262, -0.9582426, 0.7764706, 1, 0, 1,
-0.7467458, -0.5102602, -0.7475066, 0.7686275, 1, 0, 1,
-0.7391206, 0.002141598, -0.6864541, 0.7647059, 1, 0, 1,
-0.7375721, -1.200584, -3.083791, 0.7568628, 1, 0, 1,
-0.736772, -0.8603368, -1.50579, 0.7529412, 1, 0, 1,
-0.7349193, -1.507152, -2.925272, 0.7450981, 1, 0, 1,
-0.7338634, 0.8953392, 0.9684308, 0.7411765, 1, 0, 1,
-0.7277249, 0.311792, -2.30945, 0.7333333, 1, 0, 1,
-0.721218, -0.9611869, -2.464988, 0.7294118, 1, 0, 1,
-0.7210071, -0.2624963, -1.889893, 0.7215686, 1, 0, 1,
-0.7206628, 0.7707927, 0.04368041, 0.7176471, 1, 0, 1,
-0.7194608, 0.8580346, -3.26117, 0.7098039, 1, 0, 1,
-0.7114621, -0.6324623, -2.331399, 0.7058824, 1, 0, 1,
-0.7087842, 0.6802992, -0.9140918, 0.6980392, 1, 0, 1,
-0.7084019, -0.655827, -2.38601, 0.6901961, 1, 0, 1,
-0.7056165, -3.119281, -2.631029, 0.6862745, 1, 0, 1,
-0.703837, -0.061415, -1.622005, 0.6784314, 1, 0, 1,
-0.7021415, -2.610901, -2.445741, 0.6745098, 1, 0, 1,
-0.6997969, 0.4735736, -1.393713, 0.6666667, 1, 0, 1,
-0.6996936, -0.08991688, -3.75212, 0.6627451, 1, 0, 1,
-0.6990243, -0.3482889, -1.892303, 0.654902, 1, 0, 1,
-0.6965482, 0.6824616, -1.871528, 0.6509804, 1, 0, 1,
-0.6938912, 0.965619, -0.4961034, 0.6431373, 1, 0, 1,
-0.6921564, -1.184834, -3.262481, 0.6392157, 1, 0, 1,
-0.6804867, -0.9349893, -3.553536, 0.6313726, 1, 0, 1,
-0.6747422, 0.3420632, -1.401402, 0.627451, 1, 0, 1,
-0.6744785, -0.4371243, -1.740698, 0.6196079, 1, 0, 1,
-0.6680462, -0.01137674, -2.168416, 0.6156863, 1, 0, 1,
-0.6635767, 0.002430481, -1.29058, 0.6078432, 1, 0, 1,
-0.6583812, 0.1339009, -0.7069792, 0.6039216, 1, 0, 1,
-0.6537112, -0.8058355, -1.479185, 0.5960785, 1, 0, 1,
-0.6511915, -0.1155669, -1.884807, 0.5882353, 1, 0, 1,
-0.6491191, -1.186484, -3.53672, 0.5843138, 1, 0, 1,
-0.6478292, 0.761532, -1.067424, 0.5764706, 1, 0, 1,
-0.6370175, -0.9255221, -1.881523, 0.572549, 1, 0, 1,
-0.6351818, -0.1187822, 0.06785688, 0.5647059, 1, 0, 1,
-0.6323737, 1.127122, -2.35884, 0.5607843, 1, 0, 1,
-0.628418, -0.1604494, -1.756529, 0.5529412, 1, 0, 1,
-0.6204512, -0.5280215, -0.8549863, 0.5490196, 1, 0, 1,
-0.6196058, -0.1316459, -0.2845482, 0.5411765, 1, 0, 1,
-0.6181798, -1.592742, -1.107689, 0.5372549, 1, 0, 1,
-0.6160802, 0.9765825, -0.6343232, 0.5294118, 1, 0, 1,
-0.6083276, -2.292358, -3.982274, 0.5254902, 1, 0, 1,
-0.5992529, -0.8051149, -3.965296, 0.5176471, 1, 0, 1,
-0.5928097, 1.477051, 0.3577906, 0.5137255, 1, 0, 1,
-0.5923304, 0.5880241, -2.137092, 0.5058824, 1, 0, 1,
-0.5843121, 0.2054184, -1.783619, 0.5019608, 1, 0, 1,
-0.5829883, 0.2982082, -0.2509961, 0.4941176, 1, 0, 1,
-0.5806528, 0.5967609, -2.278202, 0.4862745, 1, 0, 1,
-0.5804419, -1.22679, -3.482654, 0.4823529, 1, 0, 1,
-0.5742779, -0.4367507, -3.145121, 0.4745098, 1, 0, 1,
-0.5720982, 0.03697915, -1.319536, 0.4705882, 1, 0, 1,
-0.5693811, 0.6592889, -0.6585351, 0.4627451, 1, 0, 1,
-0.5540872, -0.09681039, -0.4151275, 0.4588235, 1, 0, 1,
-0.5532635, 0.4743072, -1.088277, 0.4509804, 1, 0, 1,
-0.5517091, -1.665319, -2.803106, 0.4470588, 1, 0, 1,
-0.5514889, 0.5958551, -1.186914, 0.4392157, 1, 0, 1,
-0.5497814, 1.341664, -0.1877868, 0.4352941, 1, 0, 1,
-0.5469092, -0.1740824, -2.307169, 0.427451, 1, 0, 1,
-0.5434738, -0.8011084, -1.824137, 0.4235294, 1, 0, 1,
-0.5428532, 0.6111721, -1.577141, 0.4156863, 1, 0, 1,
-0.5351107, -0.047024, -1.431869, 0.4117647, 1, 0, 1,
-0.5336638, -0.8672212, -3.909201, 0.4039216, 1, 0, 1,
-0.530391, 0.2687677, -1.59164, 0.3960784, 1, 0, 1,
-0.5284677, 0.5289627, -3.138148, 0.3921569, 1, 0, 1,
-0.5278824, 0.3380595, -2.001858, 0.3843137, 1, 0, 1,
-0.5257643, 0.0512144, -2.569529, 0.3803922, 1, 0, 1,
-0.5246024, -0.8310038, -2.680796, 0.372549, 1, 0, 1,
-0.5227612, 0.8181689, -1.237637, 0.3686275, 1, 0, 1,
-0.5122493, 0.8828601, 0.02948105, 0.3607843, 1, 0, 1,
-0.5120128, -0.2072316, -2.743996, 0.3568628, 1, 0, 1,
-0.5071554, 0.3074348, -0.5326641, 0.3490196, 1, 0, 1,
-0.4924093, 1.652753, 0.1386627, 0.345098, 1, 0, 1,
-0.4922266, -0.004335842, -0.8015241, 0.3372549, 1, 0, 1,
-0.4907564, -0.9027225, -1.506272, 0.3333333, 1, 0, 1,
-0.4896846, 0.07420444, -0.6223415, 0.3254902, 1, 0, 1,
-0.4873758, -0.48644, -1.211173, 0.3215686, 1, 0, 1,
-0.4868061, 0.4821769, 1.130224, 0.3137255, 1, 0, 1,
-0.4854265, 0.9250292, -0.6912578, 0.3098039, 1, 0, 1,
-0.4849063, 0.9904574, -0.4213068, 0.3019608, 1, 0, 1,
-0.478363, -0.7243978, -0.9183079, 0.2941177, 1, 0, 1,
-0.4763644, -1.077403, -3.395072, 0.2901961, 1, 0, 1,
-0.4760384, 0.6510662, -0.4616583, 0.282353, 1, 0, 1,
-0.4757961, -1.430468, -3.346319, 0.2784314, 1, 0, 1,
-0.4731788, 0.06522874, -2.417426, 0.2705882, 1, 0, 1,
-0.4712576, 0.441237, 0.3472616, 0.2666667, 1, 0, 1,
-0.4706856, -0.5469496, -2.405784, 0.2588235, 1, 0, 1,
-0.4649765, -0.1840708, -2.400189, 0.254902, 1, 0, 1,
-0.4622512, -1.719859, -4.02665, 0.2470588, 1, 0, 1,
-0.459066, 1.740695, -1.363896, 0.2431373, 1, 0, 1,
-0.456491, -2.601415, -3.160311, 0.2352941, 1, 0, 1,
-0.4552038, -0.1363585, -1.816389, 0.2313726, 1, 0, 1,
-0.4467097, 0.7482797, -0.825698, 0.2235294, 1, 0, 1,
-0.4452665, -1.31778, -0.8354143, 0.2196078, 1, 0, 1,
-0.443656, 1.053689, 0.06332209, 0.2117647, 1, 0, 1,
-0.4436274, 1.96659, -1.022213, 0.2078431, 1, 0, 1,
-0.4418857, 0.1688883, -0.8503062, 0.2, 1, 0, 1,
-0.4386819, 2.914442, -0.257383, 0.1921569, 1, 0, 1,
-0.4322778, -0.1235884, -0.98339, 0.1882353, 1, 0, 1,
-0.4309998, -0.3993887, -2.403559, 0.1803922, 1, 0, 1,
-0.4263786, -0.9293781, -2.363459, 0.1764706, 1, 0, 1,
-0.4238371, 0.6104232, 0.6224215, 0.1686275, 1, 0, 1,
-0.4200261, -1.281129, -1.830488, 0.1647059, 1, 0, 1,
-0.4139857, 0.2993515, -0.6151494, 0.1568628, 1, 0, 1,
-0.409901, 0.03605112, -1.39828, 0.1529412, 1, 0, 1,
-0.403264, -0.6719493, -1.900635, 0.145098, 1, 0, 1,
-0.4001826, -1.705354, -3.922504, 0.1411765, 1, 0, 1,
-0.4000496, 0.02742683, -0.9613829, 0.1333333, 1, 0, 1,
-0.3986615, 0.9577011, -0.7520662, 0.1294118, 1, 0, 1,
-0.3961885, -2.247727, -2.835057, 0.1215686, 1, 0, 1,
-0.3948343, 0.2157011, -0.002516028, 0.1176471, 1, 0, 1,
-0.3929081, -0.5886509, -2.704899, 0.1098039, 1, 0, 1,
-0.384298, -0.8816265, -1.593072, 0.1058824, 1, 0, 1,
-0.3764911, 2.499818, -0.9821721, 0.09803922, 1, 0, 1,
-0.3756939, -1.570435, -1.625372, 0.09019608, 1, 0, 1,
-0.3739168, -0.6060982, -4.176822, 0.08627451, 1, 0, 1,
-0.372552, 0.7370615, -0.2765372, 0.07843138, 1, 0, 1,
-0.3695744, 0.2256269, -0.1336014, 0.07450981, 1, 0, 1,
-0.3687698, -1.082315, -3.78111, 0.06666667, 1, 0, 1,
-0.363512, 0.8697469, -0.160124, 0.0627451, 1, 0, 1,
-0.3627795, 0.04137319, -1.642818, 0.05490196, 1, 0, 1,
-0.3595255, -0.06259144, -4.299688, 0.05098039, 1, 0, 1,
-0.3471888, 0.8290628, -0.9435169, 0.04313726, 1, 0, 1,
-0.3434062, -0.02458826, -1.600309, 0.03921569, 1, 0, 1,
-0.3428719, 0.7335477, 0.1148799, 0.03137255, 1, 0, 1,
-0.34235, 0.418909, -1.975131, 0.02745098, 1, 0, 1,
-0.3418505, -0.06205308, -1.802839, 0.01960784, 1, 0, 1,
-0.3394073, -0.3799706, -2.193514, 0.01568628, 1, 0, 1,
-0.3371318, -0.7339098, -2.244561, 0.007843138, 1, 0, 1,
-0.3369918, 0.5265952, -2.94131, 0.003921569, 1, 0, 1,
-0.3367864, 0.494205, 0.06625786, 0, 1, 0.003921569, 1,
-0.3321614, 0.8767646, -1.319253, 0, 1, 0.01176471, 1,
-0.3320153, 0.3571363, -1.02302, 0, 1, 0.01568628, 1,
-0.3311502, 0.06720652, -0.8290833, 0, 1, 0.02352941, 1,
-0.331073, 1.794479, 0.1987449, 0, 1, 0.02745098, 1,
-0.3293962, 0.9800931, 0.1043536, 0, 1, 0.03529412, 1,
-0.3288167, -1.170176, -2.575783, 0, 1, 0.03921569, 1,
-0.3228554, -0.6763807, -3.016453, 0, 1, 0.04705882, 1,
-0.3170956, 0.4621916, -4.077285, 0, 1, 0.05098039, 1,
-0.3159828, 0.06263573, 0.6120529, 0, 1, 0.05882353, 1,
-0.3138641, -0.8303646, -1.564254, 0, 1, 0.0627451, 1,
-0.3121136, -0.3922651, -2.453453, 0, 1, 0.07058824, 1,
-0.31122, -0.2275592, -2.039305, 0, 1, 0.07450981, 1,
-0.3047989, 0.6552988, -0.874512, 0, 1, 0.08235294, 1,
-0.3028189, -0.5649083, -3.034889, 0, 1, 0.08627451, 1,
-0.2977377, -0.8824328, -3.764297, 0, 1, 0.09411765, 1,
-0.2926681, 1.218419, -2.360461, 0, 1, 0.1019608, 1,
-0.2903703, 0.9445078, -0.1353654, 0, 1, 0.1058824, 1,
-0.289129, -0.7238112, -1.066536, 0, 1, 0.1137255, 1,
-0.2888099, -0.3301366, -3.231115, 0, 1, 0.1176471, 1,
-0.2880233, 0.5108746, -1.600426, 0, 1, 0.1254902, 1,
-0.2834302, -0.1045593, -0.845431, 0, 1, 0.1294118, 1,
-0.2819991, -0.287892, -0.7561594, 0, 1, 0.1372549, 1,
-0.2782724, 0.770218, -2.105608, 0, 1, 0.1411765, 1,
-0.2732376, -0.4040875, -1.909177, 0, 1, 0.1490196, 1,
-0.2710457, 1.315089, -0.1105935, 0, 1, 0.1529412, 1,
-0.2690977, -0.2163015, -1.221364, 0, 1, 0.1607843, 1,
-0.2650472, 0.08808497, -1.874521, 0, 1, 0.1647059, 1,
-0.262252, -0.272162, -2.546214, 0, 1, 0.172549, 1,
-0.2605878, 0.4593677, 0.01087911, 0, 1, 0.1764706, 1,
-0.2598302, 0.4876013, -0.3858014, 0, 1, 0.1843137, 1,
-0.2592019, 0.386344, -1.587653, 0, 1, 0.1882353, 1,
-0.2559107, -0.8996383, -2.693727, 0, 1, 0.1960784, 1,
-0.2554134, 0.4361066, -0.7182009, 0, 1, 0.2039216, 1,
-0.2538283, -0.5081905, -1.998013, 0, 1, 0.2078431, 1,
-0.2513576, 1.297925, 0.04062771, 0, 1, 0.2156863, 1,
-0.2502319, -2.578548, -2.225225, 0, 1, 0.2196078, 1,
-0.2496016, -0.2078653, -2.913031, 0, 1, 0.227451, 1,
-0.2489201, 2.277042, -1.66347, 0, 1, 0.2313726, 1,
-0.2468476, -1.413199, -2.239586, 0, 1, 0.2392157, 1,
-0.2458024, 1.140611, 0.8498657, 0, 1, 0.2431373, 1,
-0.2455547, 0.4085917, -0.8832262, 0, 1, 0.2509804, 1,
-0.2453235, -0.1168532, -1.36028, 0, 1, 0.254902, 1,
-0.2447782, -0.9138315, -3.499254, 0, 1, 0.2627451, 1,
-0.2358707, 0.7963543, -1.75731, 0, 1, 0.2666667, 1,
-0.2345147, 0.6465698, -0.2265518, 0, 1, 0.2745098, 1,
-0.2324089, 0.2103663, -0.5355642, 0, 1, 0.2784314, 1,
-0.2317158, 0.506905, 0.7061655, 0, 1, 0.2862745, 1,
-0.2270876, 0.2859594, 0.3274681, 0, 1, 0.2901961, 1,
-0.2232382, 0.2418821, -0.1053255, 0, 1, 0.2980392, 1,
-0.2228043, -0.08130141, 0.2303514, 0, 1, 0.3058824, 1,
-0.222703, -0.764162, -1.715037, 0, 1, 0.3098039, 1,
-0.2209625, -0.9588935, -3.742522, 0, 1, 0.3176471, 1,
-0.2195455, -0.3825924, -3.224909, 0, 1, 0.3215686, 1,
-0.2151858, 0.8051347, -0.891884, 0, 1, 0.3294118, 1,
-0.2103615, 0.6021039, -0.2300766, 0, 1, 0.3333333, 1,
-0.2100876, -1.365625, -2.888038, 0, 1, 0.3411765, 1,
-0.2079238, 0.8747575, -1.899185, 0, 1, 0.345098, 1,
-0.2064857, -0.5326024, -3.372996, 0, 1, 0.3529412, 1,
-0.2064556, 1.695645, -1.522195, 0, 1, 0.3568628, 1,
-0.2043878, 0.1288128, 0.1674804, 0, 1, 0.3647059, 1,
-0.1976359, -0.2082207, -1.286019, 0, 1, 0.3686275, 1,
-0.1867448, 1.413427, -0.2999919, 0, 1, 0.3764706, 1,
-0.1838862, 0.4141057, 1.8795, 0, 1, 0.3803922, 1,
-0.183849, 0.3583409, -0.7940219, 0, 1, 0.3882353, 1,
-0.1822774, 1.078273, -0.7807533, 0, 1, 0.3921569, 1,
-0.1817273, -1.552972, -1.10305, 0, 1, 0.4, 1,
-0.1811879, -0.6575063, -3.74665, 0, 1, 0.4078431, 1,
-0.1783267, -0.6451231, -1.934724, 0, 1, 0.4117647, 1,
-0.1742609, 0.3335719, 0.4013468, 0, 1, 0.4196078, 1,
-0.1737977, -1.314994, -2.900916, 0, 1, 0.4235294, 1,
-0.1724451, 0.4290532, 0.02776038, 0, 1, 0.4313726, 1,
-0.1721627, 0.4142725, 1.384722, 0, 1, 0.4352941, 1,
-0.1665863, -1.819433, -3.2069, 0, 1, 0.4431373, 1,
-0.1659642, -0.5285333, -0.8445618, 0, 1, 0.4470588, 1,
-0.1619978, 1.28198, 1.503076, 0, 1, 0.454902, 1,
-0.1604466, 0.7589808, -0.1097139, 0, 1, 0.4588235, 1,
-0.1583998, 0.4598478, -1.448219, 0, 1, 0.4666667, 1,
-0.1577538, 1.507206, -1.704638, 0, 1, 0.4705882, 1,
-0.1512151, -0.6679253, -3.133286, 0, 1, 0.4784314, 1,
-0.1475225, 0.6579788, -0.9369615, 0, 1, 0.4823529, 1,
-0.1435569, 0.06890466, -1.934631, 0, 1, 0.4901961, 1,
-0.1425141, 1.225299, -0.1006423, 0, 1, 0.4941176, 1,
-0.1419985, 0.4312551, -0.5496526, 0, 1, 0.5019608, 1,
-0.1395682, 0.9772846, 0.660542, 0, 1, 0.509804, 1,
-0.1390859, -0.1825929, -1.43155, 0, 1, 0.5137255, 1,
-0.1364307, 2.129243, 0.07511327, 0, 1, 0.5215687, 1,
-0.1359062, -0.980833, -1.882364, 0, 1, 0.5254902, 1,
-0.1325226, 1.148849, -0.7058694, 0, 1, 0.5333334, 1,
-0.1281188, -2.10145, -2.747178, 0, 1, 0.5372549, 1,
-0.1272855, 0.6589607, -0.8166255, 0, 1, 0.5450981, 1,
-0.1263991, 0.6385029, -0.1219097, 0, 1, 0.5490196, 1,
-0.1231377, 1.658286, 0.2635988, 0, 1, 0.5568628, 1,
-0.1230786, -1.679912, -3.711543, 0, 1, 0.5607843, 1,
-0.1209273, -0.4261771, -1.485233, 0, 1, 0.5686275, 1,
-0.1093846, -1.293948, -2.580059, 0, 1, 0.572549, 1,
-0.1092405, -1.145138, -1.013612, 0, 1, 0.5803922, 1,
-0.1002913, -1.151023, -3.365276, 0, 1, 0.5843138, 1,
-0.1000962, -1.398811, -2.946761, 0, 1, 0.5921569, 1,
-0.09925199, -0.222537, -1.629923, 0, 1, 0.5960785, 1,
-0.0987206, 0.7272232, -0.6269224, 0, 1, 0.6039216, 1,
-0.09440797, -0.2433739, -1.345591, 0, 1, 0.6117647, 1,
-0.09215412, -0.3956308, -2.915408, 0, 1, 0.6156863, 1,
-0.09072999, 0.6585233, 0.1102949, 0, 1, 0.6235294, 1,
-0.08455548, 0.8262538, -0.119003, 0, 1, 0.627451, 1,
-0.08193643, -0.8343499, -3.038273, 0, 1, 0.6352941, 1,
-0.07752858, 1.202545, -0.5753264, 0, 1, 0.6392157, 1,
-0.07709373, -0.0936523, -2.178795, 0, 1, 0.6470588, 1,
-0.07622661, -0.0920387, -2.916721, 0, 1, 0.6509804, 1,
-0.07548805, -0.1545967, -2.392317, 0, 1, 0.6588235, 1,
-0.07465352, 0.6874746, -0.3449147, 0, 1, 0.6627451, 1,
-0.07235137, 0.3706471, 2.001726, 0, 1, 0.6705883, 1,
-0.07092039, 1.381438, -1.401532, 0, 1, 0.6745098, 1,
-0.06939599, 0.3808391, 0.7159884, 0, 1, 0.682353, 1,
-0.06879396, 1.551372, -0.03524209, 0, 1, 0.6862745, 1,
-0.06851332, -0.002607812, -2.133061, 0, 1, 0.6941177, 1,
-0.06652727, 0.9898435, -0.1053714, 0, 1, 0.7019608, 1,
-0.06352174, 0.1072841, 0.7592491, 0, 1, 0.7058824, 1,
-0.0629724, -0.178291, -3.061726, 0, 1, 0.7137255, 1,
-0.06232539, -0.07132521, -1.512036, 0, 1, 0.7176471, 1,
-0.05939184, -0.6909302, -3.510187, 0, 1, 0.7254902, 1,
-0.05707563, -1.585304, -3.296549, 0, 1, 0.7294118, 1,
-0.05642425, 1.193347, -0.6305011, 0, 1, 0.7372549, 1,
-0.05485608, 2.244872, -0.4300494, 0, 1, 0.7411765, 1,
-0.05431838, -1.415748, -2.972728, 0, 1, 0.7490196, 1,
-0.05377833, 0.2289195, -0.8628314, 0, 1, 0.7529412, 1,
-0.04886075, 1.829479, 0.3854699, 0, 1, 0.7607843, 1,
-0.04014104, 0.9031792, -2.498676, 0, 1, 0.7647059, 1,
-0.0400739, 0.1322641, 0.893482, 0, 1, 0.772549, 1,
-0.03885901, -2.795641, -3.398955, 0, 1, 0.7764706, 1,
-0.03822543, 0.3287392, 0.2255393, 0, 1, 0.7843137, 1,
-0.03466397, 0.8394651, -2.426332, 0, 1, 0.7882353, 1,
-0.0313625, -0.7923704, -2.122797, 0, 1, 0.7960784, 1,
-0.03112072, 1.123721, 0.2749924, 0, 1, 0.8039216, 1,
-0.02733661, -0.02310266, -1.308453, 0, 1, 0.8078431, 1,
-0.02621692, -0.9409959, -3.122249, 0, 1, 0.8156863, 1,
-0.02406116, -0.4434893, -2.950558, 0, 1, 0.8196079, 1,
-0.02124515, 2.422189, 1.340207, 0, 1, 0.827451, 1,
-0.0142771, -0.263932, -1.416983, 0, 1, 0.8313726, 1,
-0.01420213, -0.1237482, -3.631825, 0, 1, 0.8392157, 1,
-0.01252549, 1.247033, -0.3466592, 0, 1, 0.8431373, 1,
-0.01244824, -0.261057, -3.031904, 0, 1, 0.8509804, 1,
-0.008827505, -0.2788838, -3.264596, 0, 1, 0.854902, 1,
-0.004511338, 1.347874, -0.9722285, 0, 1, 0.8627451, 1,
-0.003152295, -0.70904, -1.680991, 0, 1, 0.8666667, 1,
0.005199542, -1.069771, 2.123039, 0, 1, 0.8745098, 1,
0.009574099, 0.02570673, 1.24604, 0, 1, 0.8784314, 1,
0.01143497, 1.933659, -1.251965, 0, 1, 0.8862745, 1,
0.01506272, 0.05607521, 0.08577631, 0, 1, 0.8901961, 1,
0.01793965, 0.191751, 0.1264994, 0, 1, 0.8980392, 1,
0.01863884, -1.207783, 3.037934, 0, 1, 0.9058824, 1,
0.02120532, -1.971456, 2.960428, 0, 1, 0.9098039, 1,
0.02165742, -1.366856, 0.6766093, 0, 1, 0.9176471, 1,
0.0227041, -0.05213885, 2.191464, 0, 1, 0.9215686, 1,
0.02319887, 0.2491878, -0.3055193, 0, 1, 0.9294118, 1,
0.02667602, -1.247849, 3.722466, 0, 1, 0.9333333, 1,
0.02933249, 1.700714, -2.234957, 0, 1, 0.9411765, 1,
0.02962955, -0.5481365, 1.536255, 0, 1, 0.945098, 1,
0.03108049, 0.1417851, 0.2629297, 0, 1, 0.9529412, 1,
0.03480601, -0.8197274, 4.408551, 0, 1, 0.9568627, 1,
0.03683498, 0.8167231, -0.8488913, 0, 1, 0.9647059, 1,
0.04070613, -1.202824, 3.868973, 0, 1, 0.9686275, 1,
0.04617478, 2.626425, -0.9229653, 0, 1, 0.9764706, 1,
0.0476844, -0.06023899, 4.846488, 0, 1, 0.9803922, 1,
0.04968845, 2.29204, -1.276038, 0, 1, 0.9882353, 1,
0.05054792, -0.388096, 3.160778, 0, 1, 0.9921569, 1,
0.05066606, 0.1312798, 0.9765795, 0, 1, 1, 1,
0.05104858, -0.2490855, 0.534579, 0, 0.9921569, 1, 1,
0.05290474, -1.345708, 3.903527, 0, 0.9882353, 1, 1,
0.05950327, -0.8815702, 3.634044, 0, 0.9803922, 1, 1,
0.06212882, 0.1832895, 1.393447, 0, 0.9764706, 1, 1,
0.0657201, -0.5756372, 2.316941, 0, 0.9686275, 1, 1,
0.06969927, 0.8909566, -0.4161073, 0, 0.9647059, 1, 1,
0.07016779, 0.2111211, -0.5123293, 0, 0.9568627, 1, 1,
0.07227229, 1.642882, 0.8412643, 0, 0.9529412, 1, 1,
0.07411528, 0.8461289, 1.02033, 0, 0.945098, 1, 1,
0.07486779, 0.4246111, -0.9655292, 0, 0.9411765, 1, 1,
0.08367711, 0.2742015, 1.057832, 0, 0.9333333, 1, 1,
0.08503962, -1.073821, 2.494625, 0, 0.9294118, 1, 1,
0.08610325, -1.245943, 3.908853, 0, 0.9215686, 1, 1,
0.08769675, -0.5632924, 1.989595, 0, 0.9176471, 1, 1,
0.08800009, 0.4686893, 0.8617285, 0, 0.9098039, 1, 1,
0.08928992, 0.7263076, 1.33277, 0, 0.9058824, 1, 1,
0.09215046, 0.4960418, 0.3147974, 0, 0.8980392, 1, 1,
0.09505139, 0.8725756, 0.6252218, 0, 0.8901961, 1, 1,
0.09892943, 1.786956, 1.928802, 0, 0.8862745, 1, 1,
0.1016517, -1.29907, 3.633089, 0, 0.8784314, 1, 1,
0.1051705, 0.1072819, -1.039, 0, 0.8745098, 1, 1,
0.1068726, 1.270141, 0.55389, 0, 0.8666667, 1, 1,
0.1093193, -0.1654854, 1.661955, 0, 0.8627451, 1, 1,
0.1097056, -0.1559161, 2.974978, 0, 0.854902, 1, 1,
0.1153754, 0.9970024, -1.248991, 0, 0.8509804, 1, 1,
0.11671, -2.027484, 0.5175284, 0, 0.8431373, 1, 1,
0.1198115, -0.8649882, 2.522834, 0, 0.8392157, 1, 1,
0.1220998, -0.6059257, 5.068043, 0, 0.8313726, 1, 1,
0.1231716, 0.9508742, -0.3035067, 0, 0.827451, 1, 1,
0.1305805, -0.3540481, 2.447836, 0, 0.8196079, 1, 1,
0.1332411, -0.3067098, 1.686789, 0, 0.8156863, 1, 1,
0.1338793, -2.05407, 3.813773, 0, 0.8078431, 1, 1,
0.1366827, -0.2368966, -0.3777545, 0, 0.8039216, 1, 1,
0.1369965, -2.038821, 2.829661, 0, 0.7960784, 1, 1,
0.1419268, -0.1172374, 1.663191, 0, 0.7882353, 1, 1,
0.1429489, -0.2545205, 2.40475, 0, 0.7843137, 1, 1,
0.1433332, 1.424338, -1.71193, 0, 0.7764706, 1, 1,
0.1470977, -1.769027, 3.569997, 0, 0.772549, 1, 1,
0.1480069, 2.016979, 1.168709, 0, 0.7647059, 1, 1,
0.1489541, 1.066504, -0.8009137, 0, 0.7607843, 1, 1,
0.1536007, -0.3596729, 1.365409, 0, 0.7529412, 1, 1,
0.1536614, 0.881753, 0.9306188, 0, 0.7490196, 1, 1,
0.1592427, -0.1132732, 2.610022, 0, 0.7411765, 1, 1,
0.1594237, -0.05881902, -0.4851814, 0, 0.7372549, 1, 1,
0.1637179, -0.4225678, 2.951572, 0, 0.7294118, 1, 1,
0.1646757, 0.960358, 0.5134498, 0, 0.7254902, 1, 1,
0.1702524, -0.264838, 1.611417, 0, 0.7176471, 1, 1,
0.1712399, -0.5896575, 1.071278, 0, 0.7137255, 1, 1,
0.1715678, -0.5007116, 1.946174, 0, 0.7058824, 1, 1,
0.172814, -0.3144031, 3.633349, 0, 0.6980392, 1, 1,
0.1740426, 2.090905, 1.108556, 0, 0.6941177, 1, 1,
0.174165, -0.1344527, 1.61353, 0, 0.6862745, 1, 1,
0.1752794, -0.1496712, 2.838074, 0, 0.682353, 1, 1,
0.1794748, -0.3236783, 2.80433, 0, 0.6745098, 1, 1,
0.1794857, -1.325782, 0.6533407, 0, 0.6705883, 1, 1,
0.1847563, 0.01120155, 1.851526, 0, 0.6627451, 1, 1,
0.1859397, -1.209383, 3.552767, 0, 0.6588235, 1, 1,
0.1876708, -1.201284, 1.716832, 0, 0.6509804, 1, 1,
0.1882073, 2.537773, 1.461263, 0, 0.6470588, 1, 1,
0.1898099, -0.09002932, 2.919017, 0, 0.6392157, 1, 1,
0.190371, -0.2364611, 1.614098, 0, 0.6352941, 1, 1,
0.1954291, -0.235745, 2.215882, 0, 0.627451, 1, 1,
0.1973339, -0.4326934, 1.508629, 0, 0.6235294, 1, 1,
0.1981584, -1.018538, 3.127998, 0, 0.6156863, 1, 1,
0.1989995, -1.214364, 2.30915, 0, 0.6117647, 1, 1,
0.1994768, 1.133333, 0.01421051, 0, 0.6039216, 1, 1,
0.2019505, 0.4372482, 0.2320721, 0, 0.5960785, 1, 1,
0.2019643, 0.7296118, 0.7293479, 0, 0.5921569, 1, 1,
0.2034653, 1.649349, -1.591539, 0, 0.5843138, 1, 1,
0.2035072, -1.015769, 3.173016, 0, 0.5803922, 1, 1,
0.2093986, -0.4463165, 2.697063, 0, 0.572549, 1, 1,
0.2107825, -0.1635632, 2.823929, 0, 0.5686275, 1, 1,
0.211445, 1.857802, 1.131333, 0, 0.5607843, 1, 1,
0.211836, 0.9380096, 2.002405, 0, 0.5568628, 1, 1,
0.2123035, -0.7350308, 4.209015, 0, 0.5490196, 1, 1,
0.2129792, 1.682033, -0.2485593, 0, 0.5450981, 1, 1,
0.2130115, 0.6618456, -1.494059, 0, 0.5372549, 1, 1,
0.2157559, 0.6675166, 0.3170311, 0, 0.5333334, 1, 1,
0.219494, 1.226672, 2.058439, 0, 0.5254902, 1, 1,
0.2218157, -0.1105076, 1.661418, 0, 0.5215687, 1, 1,
0.2222979, -0.315473, 3.662111, 0, 0.5137255, 1, 1,
0.2274634, 0.967502, 0.2607821, 0, 0.509804, 1, 1,
0.2276795, 0.7213731, -0.4840788, 0, 0.5019608, 1, 1,
0.2289214, 0.7563816, 1.07351, 0, 0.4941176, 1, 1,
0.229854, 0.2575639, 0.9040642, 0, 0.4901961, 1, 1,
0.2335212, 2.129707, -1.554891, 0, 0.4823529, 1, 1,
0.2344507, 0.2054973, -0.07369976, 0, 0.4784314, 1, 1,
0.2362843, -0.5696742, 3.32516, 0, 0.4705882, 1, 1,
0.2396217, -1.414386, 4.171145, 0, 0.4666667, 1, 1,
0.2401713, -0.1531236, 3.639019, 0, 0.4588235, 1, 1,
0.2414478, 1.292592, -0.1575278, 0, 0.454902, 1, 1,
0.2427895, -0.7576708, 3.709367, 0, 0.4470588, 1, 1,
0.244677, -0.3807032, 2.250971, 0, 0.4431373, 1, 1,
0.247593, 0.673103, 0.4331516, 0, 0.4352941, 1, 1,
0.2487056, 0.585658, -0.0873097, 0, 0.4313726, 1, 1,
0.2490444, -0.8636632, 1.979801, 0, 0.4235294, 1, 1,
0.2519746, 0.3201084, 0.7494334, 0, 0.4196078, 1, 1,
0.2579765, -1.45984, 3.141148, 0, 0.4117647, 1, 1,
0.2589158, 0.509875, 0.3859145, 0, 0.4078431, 1, 1,
0.2592514, -0.8932384, 1.103293, 0, 0.4, 1, 1,
0.2594229, 0.6919424, 1.054489, 0, 0.3921569, 1, 1,
0.2598473, -1.385559, 3.760218, 0, 0.3882353, 1, 1,
0.263872, -2.125816, 2.791884, 0, 0.3803922, 1, 1,
0.2678005, 0.2889036, 0.5300429, 0, 0.3764706, 1, 1,
0.2720292, 1.379645, 1.552664, 0, 0.3686275, 1, 1,
0.2749405, -1.587904, 2.835574, 0, 0.3647059, 1, 1,
0.2750175, 1.391429, 1.320575, 0, 0.3568628, 1, 1,
0.2780356, -0.2046371, 1.738326, 0, 0.3529412, 1, 1,
0.282678, 0.8479982, 0.0964588, 0, 0.345098, 1, 1,
0.2827574, 0.2455066, 0.1836998, 0, 0.3411765, 1, 1,
0.2828387, -0.2435286, 3.223793, 0, 0.3333333, 1, 1,
0.2836376, -0.3826657, 0.7235822, 0, 0.3294118, 1, 1,
0.2837299, -0.4094615, 2.234454, 0, 0.3215686, 1, 1,
0.2840837, 0.7690635, -0.270262, 0, 0.3176471, 1, 1,
0.2898809, -1.598991, 3.245965, 0, 0.3098039, 1, 1,
0.2925079, -0.5235839, 2.385572, 0, 0.3058824, 1, 1,
0.2961585, -0.6352466, 2.396993, 0, 0.2980392, 1, 1,
0.3000429, 0.0106886, 0.4709854, 0, 0.2901961, 1, 1,
0.3045448, -0.234306, 2.66186, 0, 0.2862745, 1, 1,
0.3076253, -0.4350209, 2.747174, 0, 0.2784314, 1, 1,
0.3095937, 0.03525982, 0.4756625, 0, 0.2745098, 1, 1,
0.3129659, -0.6645682, 2.377255, 0, 0.2666667, 1, 1,
0.3150425, 3.383548, 0.5369797, 0, 0.2627451, 1, 1,
0.3171446, 1.02941, -0.02453765, 0, 0.254902, 1, 1,
0.3180922, -0.06251638, -0.2018086, 0, 0.2509804, 1, 1,
0.3248571, 1.131493, 2.139473, 0, 0.2431373, 1, 1,
0.3314052, -0.4282057, 3.351624, 0, 0.2392157, 1, 1,
0.3320366, 0.01720024, 1.72674, 0, 0.2313726, 1, 1,
0.3330632, -1.18095, 3.357704, 0, 0.227451, 1, 1,
0.3387302, -0.7752188, 3.648062, 0, 0.2196078, 1, 1,
0.3387932, -2.344454, 4.087452, 0, 0.2156863, 1, 1,
0.3415523, -0.3286704, 4.69878, 0, 0.2078431, 1, 1,
0.3421079, 0.4506978, 1.52531, 0, 0.2039216, 1, 1,
0.34282, -0.8967561, 3.778937, 0, 0.1960784, 1, 1,
0.3474722, 1.242352, -0.1684199, 0, 0.1882353, 1, 1,
0.3538787, 0.6288337, 1.610799, 0, 0.1843137, 1, 1,
0.3545004, 2.322576, 1.755192, 0, 0.1764706, 1, 1,
0.3550234, -0.4133349, -0.4193096, 0, 0.172549, 1, 1,
0.35973, 0.7039587, -0.2416276, 0, 0.1647059, 1, 1,
0.3600296, -0.165588, 0.9168509, 0, 0.1607843, 1, 1,
0.3625844, 0.590947, -0.07459677, 0, 0.1529412, 1, 1,
0.3644524, -0.3603885, 2.38583, 0, 0.1490196, 1, 1,
0.3657053, -0.2217622, 1.42922, 0, 0.1411765, 1, 1,
0.3710842, -0.9653691, 2.489017, 0, 0.1372549, 1, 1,
0.3729076, 0.7385618, 1.58372, 0, 0.1294118, 1, 1,
0.3786374, 1.674501, 0.8261557, 0, 0.1254902, 1, 1,
0.3795577, -0.9478422, 3.472163, 0, 0.1176471, 1, 1,
0.3798716, 0.7012292, 1.663427, 0, 0.1137255, 1, 1,
0.3826925, -0.7485264, 4.29716, 0, 0.1058824, 1, 1,
0.3841904, -0.3295887, 4.063952, 0, 0.09803922, 1, 1,
0.384959, -0.6821674, 3.028401, 0, 0.09411765, 1, 1,
0.3864147, 0.683845, 0.0354324, 0, 0.08627451, 1, 1,
0.389106, -1.117029, 2.629837, 0, 0.08235294, 1, 1,
0.3910002, -0.892476, 3.144028, 0, 0.07450981, 1, 1,
0.3916308, 1.414223, 1.199113, 0, 0.07058824, 1, 1,
0.3928334, 0.1536898, 3.601906, 0, 0.0627451, 1, 1,
0.3965411, -0.1676182, 1.799524, 0, 0.05882353, 1, 1,
0.3972137, -0.164268, 3.194964, 0, 0.05098039, 1, 1,
0.4042741, -0.05873137, 0.6583995, 0, 0.04705882, 1, 1,
0.4080163, -0.1178941, 4.450634, 0, 0.03921569, 1, 1,
0.4151622, -1.19822, 3.720339, 0, 0.03529412, 1, 1,
0.4173144, -0.5986019, -0.2029334, 0, 0.02745098, 1, 1,
0.4192899, -0.5305538, 3.874462, 0, 0.02352941, 1, 1,
0.4196055, -0.9913139, 0.8806384, 0, 0.01568628, 1, 1,
0.4201947, 0.4044068, -1.278484, 0, 0.01176471, 1, 1,
0.4234764, 0.715993, 2.492763, 0, 0.003921569, 1, 1,
0.4244078, 0.1591117, 2.333088, 0.003921569, 0, 1, 1,
0.4271212, 0.7530748, 0.7663358, 0.007843138, 0, 1, 1,
0.4287368, -1.272276, 3.118283, 0.01568628, 0, 1, 1,
0.4294086, 0.4911474, 0.9094412, 0.01960784, 0, 1, 1,
0.4406385, -0.1759276, 2.206642, 0.02745098, 0, 1, 1,
0.4586632, -0.6297719, 1.171401, 0.03137255, 0, 1, 1,
0.4589252, 0.04032004, 2.153607, 0.03921569, 0, 1, 1,
0.4593385, 0.6610538, 0.5811009, 0.04313726, 0, 1, 1,
0.4647216, 1.352586, 1.508389, 0.05098039, 0, 1, 1,
0.4658462, -0.5156213, 1.82712, 0.05490196, 0, 1, 1,
0.4707228, -0.49748, 3.141623, 0.0627451, 0, 1, 1,
0.479933, 1.205737, 1.287939, 0.06666667, 0, 1, 1,
0.4864583, 0.5444437, -0.1618996, 0.07450981, 0, 1, 1,
0.4871752, -1.027572, 3.249219, 0.07843138, 0, 1, 1,
0.4979191, -1.142625, 2.693714, 0.08627451, 0, 1, 1,
0.5064549, 0.5440502, 1.170293, 0.09019608, 0, 1, 1,
0.5066748, 0.04433198, 1.186333, 0.09803922, 0, 1, 1,
0.511517, 0.4596787, 2.222693, 0.1058824, 0, 1, 1,
0.5131238, 0.5518675, 0.2036898, 0.1098039, 0, 1, 1,
0.513305, -0.2962232, 3.458434, 0.1176471, 0, 1, 1,
0.5158432, 0.9798802, 2.209374, 0.1215686, 0, 1, 1,
0.5235305, -0.9194658, 4.341904, 0.1294118, 0, 1, 1,
0.5256225, -0.4946891, 1.174728, 0.1333333, 0, 1, 1,
0.5256503, 1.697804, -1.360854, 0.1411765, 0, 1, 1,
0.5257344, 1.111032, 0.09034306, 0.145098, 0, 1, 1,
0.5291907, 0.6527032, 0.4381066, 0.1529412, 0, 1, 1,
0.5333422, 1.846756, -2.044701, 0.1568628, 0, 1, 1,
0.5347189, 0.3650967, -0.5395305, 0.1647059, 0, 1, 1,
0.5354656, 0.6603134, 1.370273, 0.1686275, 0, 1, 1,
0.5385377, -1.675572, 1.771705, 0.1764706, 0, 1, 1,
0.5395355, 0.2768386, 1.038004, 0.1803922, 0, 1, 1,
0.5546849, -2.224097, 3.30032, 0.1882353, 0, 1, 1,
0.5579764, 1.257176, -0.5220344, 0.1921569, 0, 1, 1,
0.5603853, -0.644872, 1.623021, 0.2, 0, 1, 1,
0.5665815, -2.257662, 3.86532, 0.2078431, 0, 1, 1,
0.5674688, -0.5600982, 0.6095781, 0.2117647, 0, 1, 1,
0.5744731, 0.1585716, 1.744084, 0.2196078, 0, 1, 1,
0.5755542, -1.969128, 2.883752, 0.2235294, 0, 1, 1,
0.5790151, -0.3911603, 2.7198, 0.2313726, 0, 1, 1,
0.5817993, -0.4905611, 1.903257, 0.2352941, 0, 1, 1,
0.5825298, 1.073722, 0.08132286, 0.2431373, 0, 1, 1,
0.5835702, 0.9645304, -0.916764, 0.2470588, 0, 1, 1,
0.5865544, -0.006674302, 2.640963, 0.254902, 0, 1, 1,
0.5867057, 0.5159673, -0.009453224, 0.2588235, 0, 1, 1,
0.587752, -1.541279, 0.4384744, 0.2666667, 0, 1, 1,
0.5966718, 0.8812694, -0.7367443, 0.2705882, 0, 1, 1,
0.5998577, -1.026025, 2.4129, 0.2784314, 0, 1, 1,
0.603457, -1.420037, 3.002431, 0.282353, 0, 1, 1,
0.6040497, 1.822167, -0.5484573, 0.2901961, 0, 1, 1,
0.6064323, -0.3509019, 2.952326, 0.2941177, 0, 1, 1,
0.6167938, 1.122957, -0.7250545, 0.3019608, 0, 1, 1,
0.6234627, 0.1793391, 1.915986, 0.3098039, 0, 1, 1,
0.6265163, 1.192423, 0.8332491, 0.3137255, 0, 1, 1,
0.6302611, 0.5640498, -0.4628461, 0.3215686, 0, 1, 1,
0.6309172, 0.2971112, 1.886023, 0.3254902, 0, 1, 1,
0.6331035, -1.612435, 2.422786, 0.3333333, 0, 1, 1,
0.6373679, -1.406785, 1.610546, 0.3372549, 0, 1, 1,
0.6438139, -2.64411, 2.756248, 0.345098, 0, 1, 1,
0.6445721, 0.7643171, 1.677554, 0.3490196, 0, 1, 1,
0.6481061, 0.8421291, -2.125641, 0.3568628, 0, 1, 1,
0.6496472, -0.1754669, 1.63195, 0.3607843, 0, 1, 1,
0.6499807, 1.119827, 0.336978, 0.3686275, 0, 1, 1,
0.6517426, 0.5759504, 1.265708, 0.372549, 0, 1, 1,
0.6565536, -1.052341, 2.457897, 0.3803922, 0, 1, 1,
0.6584356, -0.2569681, -0.6994302, 0.3843137, 0, 1, 1,
0.6625715, 0.2609894, -0.1733887, 0.3921569, 0, 1, 1,
0.6699725, -0.5740282, 2.807071, 0.3960784, 0, 1, 1,
0.6700552, 0.618028, -0.4905444, 0.4039216, 0, 1, 1,
0.6724294, 1.126406, 1.085867, 0.4117647, 0, 1, 1,
0.6791341, 0.6142736, 0.2351302, 0.4156863, 0, 1, 1,
0.6833462, -1.091265, 0.6509655, 0.4235294, 0, 1, 1,
0.6842347, -0.08239745, 0.4699406, 0.427451, 0, 1, 1,
0.6863117, -0.531935, 2.380034, 0.4352941, 0, 1, 1,
0.6882123, -1.416873, 1.792406, 0.4392157, 0, 1, 1,
0.6892481, 1.06992, 2.061402, 0.4470588, 0, 1, 1,
0.6901614, -1.108166, 2.701025, 0.4509804, 0, 1, 1,
0.6901879, -1.744657, 1.299047, 0.4588235, 0, 1, 1,
0.6947673, -0.02416204, 1.178401, 0.4627451, 0, 1, 1,
0.6963467, -0.536806, 1.700774, 0.4705882, 0, 1, 1,
0.6966884, -0.2820833, 3.107347, 0.4745098, 0, 1, 1,
0.7018882, 0.3832178, -0.2811582, 0.4823529, 0, 1, 1,
0.703895, -0.2797595, 1.994874, 0.4862745, 0, 1, 1,
0.7076611, 0.5187202, 0.5005202, 0.4941176, 0, 1, 1,
0.7141265, 0.111876, 1.713885, 0.5019608, 0, 1, 1,
0.7182235, 0.2827404, 1.226866, 0.5058824, 0, 1, 1,
0.7185141, -0.3123358, 1.858435, 0.5137255, 0, 1, 1,
0.7188928, 0.7926701, 0.606259, 0.5176471, 0, 1, 1,
0.7202299, -0.9108661, 2.756168, 0.5254902, 0, 1, 1,
0.7208369, -1.71018, 1.061438, 0.5294118, 0, 1, 1,
0.7230004, 0.194828, 1.294224, 0.5372549, 0, 1, 1,
0.7230516, -1.041734, 1.858225, 0.5411765, 0, 1, 1,
0.7235504, -0.1601292, 2.004695, 0.5490196, 0, 1, 1,
0.7242582, 0.01712931, 2.274291, 0.5529412, 0, 1, 1,
0.72448, -0.7710814, 3.994255, 0.5607843, 0, 1, 1,
0.736896, -1.310921, 2.452513, 0.5647059, 0, 1, 1,
0.7374763, -0.3055464, 3.139239, 0.572549, 0, 1, 1,
0.7392592, 0.6562383, 2.46597, 0.5764706, 0, 1, 1,
0.7414914, -0.4166665, 2.202034, 0.5843138, 0, 1, 1,
0.7436336, -0.5063793, 2.603105, 0.5882353, 0, 1, 1,
0.7445948, 0.1866435, 0.1466566, 0.5960785, 0, 1, 1,
0.7470933, -0.7220725, 3.396541, 0.6039216, 0, 1, 1,
0.750793, -0.4458122, 2.842033, 0.6078432, 0, 1, 1,
0.751668, -1.550261, 1.364331, 0.6156863, 0, 1, 1,
0.7534772, -0.3537863, 2.480168, 0.6196079, 0, 1, 1,
0.7537164, 0.5085058, -0.2520494, 0.627451, 0, 1, 1,
0.7545469, -0.6783043, 2.91436, 0.6313726, 0, 1, 1,
0.7577974, -1.098036, 2.2373, 0.6392157, 0, 1, 1,
0.758384, -0.4720078, 2.540704, 0.6431373, 0, 1, 1,
0.7664675, 1.380442, 0.4261057, 0.6509804, 0, 1, 1,
0.7840754, 1.31346, -2.153532, 0.654902, 0, 1, 1,
0.7974449, 0.07191155, 1.679032, 0.6627451, 0, 1, 1,
0.7983147, -0.3833514, 0.742777, 0.6666667, 0, 1, 1,
0.800848, 0.7996867, 1.394962, 0.6745098, 0, 1, 1,
0.8036417, 0.2246833, 1.097369, 0.6784314, 0, 1, 1,
0.8073787, 0.06190571, 1.806118, 0.6862745, 0, 1, 1,
0.8075604, 0.8231127, 1.664879, 0.6901961, 0, 1, 1,
0.8108816, -0.2833083, 2.095874, 0.6980392, 0, 1, 1,
0.8117464, -1.293396, 1.783948, 0.7058824, 0, 1, 1,
0.8148567, 0.3914469, 2.700673, 0.7098039, 0, 1, 1,
0.8148683, 0.9518974, 0.9723008, 0.7176471, 0, 1, 1,
0.8156002, 0.906294, 1.046408, 0.7215686, 0, 1, 1,
0.8161196, -0.3209568, 1.748138, 0.7294118, 0, 1, 1,
0.8168025, -0.4490202, -0.1002376, 0.7333333, 0, 1, 1,
0.8196666, -0.3599934, -0.2714586, 0.7411765, 0, 1, 1,
0.8436142, -1.755817, 2.663829, 0.7450981, 0, 1, 1,
0.8478759, 0.6279476, 0.8452274, 0.7529412, 0, 1, 1,
0.8497388, 1.076757, 1.048882, 0.7568628, 0, 1, 1,
0.8503162, -0.1935315, 2.172836, 0.7647059, 0, 1, 1,
0.8595158, 1.012624, -1.150985, 0.7686275, 0, 1, 1,
0.8648275, -0.6365067, 2.348297, 0.7764706, 0, 1, 1,
0.8674421, -0.179101, 2.094168, 0.7803922, 0, 1, 1,
0.8726969, 0.4636225, 3.317169, 0.7882353, 0, 1, 1,
0.8740488, 0.07032553, 2.576257, 0.7921569, 0, 1, 1,
0.8798224, -0.3130927, 1.489177, 0.8, 0, 1, 1,
0.8875434, 2.149466, 1.23693, 0.8078431, 0, 1, 1,
0.8953401, -1.651023, 1.745319, 0.8117647, 0, 1, 1,
0.8998606, -0.04879419, 2.255742, 0.8196079, 0, 1, 1,
0.9009667, -1.250531, 2.752786, 0.8235294, 0, 1, 1,
0.9027756, 0.382625, 0.5507819, 0.8313726, 0, 1, 1,
0.9041834, -1.69162, 1.962866, 0.8352941, 0, 1, 1,
0.9069405, -0.5644413, 3.366998, 0.8431373, 0, 1, 1,
0.9075709, -1.076713, 3.672517, 0.8470588, 0, 1, 1,
0.913751, -0.1620231, 2.35463, 0.854902, 0, 1, 1,
0.9141454, 0.1838453, 0.8509905, 0.8588235, 0, 1, 1,
0.9156732, 1.052436, -0.2700806, 0.8666667, 0, 1, 1,
0.9218953, 0.2616189, 2.086157, 0.8705882, 0, 1, 1,
0.9241651, 0.4441877, 0.3147857, 0.8784314, 0, 1, 1,
0.9275112, 1.224794, 0.5105828, 0.8823529, 0, 1, 1,
0.9329801, 0.1164428, 2.391907, 0.8901961, 0, 1, 1,
0.9331202, 0.5913479, 2.351136, 0.8941177, 0, 1, 1,
0.9348454, -1.158197, 4.289978, 0.9019608, 0, 1, 1,
0.9353282, 0.1016713, 2.348497, 0.9098039, 0, 1, 1,
0.9360659, 0.1627808, 1.109464, 0.9137255, 0, 1, 1,
0.9372054, -1.084855, 3.787362, 0.9215686, 0, 1, 1,
0.9393001, -1.962938, 4.308311, 0.9254902, 0, 1, 1,
0.9490358, 0.2398816, 1.349924, 0.9333333, 0, 1, 1,
0.9541158, 0.4312746, 0.08844515, 0.9372549, 0, 1, 1,
0.9558764, 1.298147, 1.390424, 0.945098, 0, 1, 1,
0.9588151, 1.532146, 0.6285602, 0.9490196, 0, 1, 1,
0.9641528, 0.7181334, -0.8690203, 0.9568627, 0, 1, 1,
0.9693275, 2.196529, 1.665585, 0.9607843, 0, 1, 1,
0.9731648, 1.384425, 0.3990971, 0.9686275, 0, 1, 1,
0.9789825, -1.025274, 1.087408, 0.972549, 0, 1, 1,
0.9809749, -0.7792843, 2.398937, 0.9803922, 0, 1, 1,
0.9818481, -0.6026151, 2.788989, 0.9843137, 0, 1, 1,
0.9830614, -0.6800001, 2.56154, 0.9921569, 0, 1, 1,
0.9861619, 1.405144, 1.66181, 0.9960784, 0, 1, 1,
0.9895031, -0.6747718, 2.680648, 1, 0, 0.9960784, 1,
0.9978289, -0.4613901, 4.632957, 1, 0, 0.9882353, 1,
1.000514, -1.31568, 1.789617, 1, 0, 0.9843137, 1,
1.002645, 0.4871934, 1.205965, 1, 0, 0.9764706, 1,
1.004713, -1.285242, 2.923299, 1, 0, 0.972549, 1,
1.005741, 1.02001, 1.194472, 1, 0, 0.9647059, 1,
1.007687, -0.0108289, 1.562971, 1, 0, 0.9607843, 1,
1.007688, -1.258035, 3.711895, 1, 0, 0.9529412, 1,
1.010754, 0.915938, 2.046832, 1, 0, 0.9490196, 1,
1.011831, 0.5530591, 1.395251, 1, 0, 0.9411765, 1,
1.012883, 1.989965, -0.2547548, 1, 0, 0.9372549, 1,
1.02011, 1.241212, 0.9263792, 1, 0, 0.9294118, 1,
1.022166, -0.2001731, 1.083185, 1, 0, 0.9254902, 1,
1.029453, -1.197295, 0.8683038, 1, 0, 0.9176471, 1,
1.030256, -0.5299015, 1.560054, 1, 0, 0.9137255, 1,
1.032916, 3.279086, 0.4699778, 1, 0, 0.9058824, 1,
1.036578, 0.2844106, 1.166455, 1, 0, 0.9019608, 1,
1.038319, -0.4296588, 1.019275, 1, 0, 0.8941177, 1,
1.041181, 2.03544, 0.5278157, 1, 0, 0.8862745, 1,
1.052728, 0.6679281, 0.5336084, 1, 0, 0.8823529, 1,
1.05514, 0.2775792, 2.834256, 1, 0, 0.8745098, 1,
1.062003, -1.758762, 3.435153, 1, 0, 0.8705882, 1,
1.064145, -1.945469, 2.791916, 1, 0, 0.8627451, 1,
1.078659, 0.798472, -0.09367565, 1, 0, 0.8588235, 1,
1.078871, 0.6061939, 0.3403425, 1, 0, 0.8509804, 1,
1.096231, 0.05983706, 1.585036, 1, 0, 0.8470588, 1,
1.101205, -0.07419267, 1.711852, 1, 0, 0.8392157, 1,
1.10456, 0.1266697, 2.952446, 1, 0, 0.8352941, 1,
1.104907, -0.08026743, 1.910474, 1, 0, 0.827451, 1,
1.10881, 0.6677558, 1.951975, 1, 0, 0.8235294, 1,
1.110041, 0.4430985, 0.8010176, 1, 0, 0.8156863, 1,
1.116124, 1.137345, 0.9912167, 1, 0, 0.8117647, 1,
1.119855, 1.238532, -0.1049134, 1, 0, 0.8039216, 1,
1.120556, 0.6565926, 0.850961, 1, 0, 0.7960784, 1,
1.121909, 0.09966376, 2.272823, 1, 0, 0.7921569, 1,
1.123649, -0.2813024, 0.8432616, 1, 0, 0.7843137, 1,
1.130098, -0.03817433, 0.9074557, 1, 0, 0.7803922, 1,
1.130935, -1.209979, 2.015815, 1, 0, 0.772549, 1,
1.134734, 0.4206722, 2.409478, 1, 0, 0.7686275, 1,
1.146704, -0.05251149, -0.3784519, 1, 0, 0.7607843, 1,
1.150617, 0.1083022, -0.8084331, 1, 0, 0.7568628, 1,
1.152841, 0.8976387, 0.634738, 1, 0, 0.7490196, 1,
1.154455, -1.280105, 3.287781, 1, 0, 0.7450981, 1,
1.158514, 1.013383, 0.4018124, 1, 0, 0.7372549, 1,
1.160422, 0.272626, 1.66891, 1, 0, 0.7333333, 1,
1.169524, 0.7819068, 0.325419, 1, 0, 0.7254902, 1,
1.171274, 1.12307, 1.664387, 1, 0, 0.7215686, 1,
1.173805, -0.0829796, 1.867922, 1, 0, 0.7137255, 1,
1.181444, 1.697029, 0.2195014, 1, 0, 0.7098039, 1,
1.195774, -0.1684867, 1.89272, 1, 0, 0.7019608, 1,
1.197533, 0.4615205, 0.360926, 1, 0, 0.6941177, 1,
1.203806, 0.678149, 1.511431, 1, 0, 0.6901961, 1,
1.203984, 0.7454048, 0.819347, 1, 0, 0.682353, 1,
1.204524, -1.074589, 3.180113, 1, 0, 0.6784314, 1,
1.211195, -0.5422058, 3.008492, 1, 0, 0.6705883, 1,
1.213975, 0.7619857, 1.11692, 1, 0, 0.6666667, 1,
1.225129, -1.341926, 3.826326, 1, 0, 0.6588235, 1,
1.232272, 0.7623742, 0.2554546, 1, 0, 0.654902, 1,
1.235809, 0.4895705, 1.077816, 1, 0, 0.6470588, 1,
1.236285, 0.0459235, 1.709244, 1, 0, 0.6431373, 1,
1.236392, 1.945771, 0.9603679, 1, 0, 0.6352941, 1,
1.239082, -1.012766, 1.85074, 1, 0, 0.6313726, 1,
1.245178, -0.5555346, 1.910255, 1, 0, 0.6235294, 1,
1.252274, -1.155825, 3.526785, 1, 0, 0.6196079, 1,
1.252964, 0.5654158, 1.308673, 1, 0, 0.6117647, 1,
1.259723, -0.943827, 1.818677, 1, 0, 0.6078432, 1,
1.262739, 1.168118, 2.438195, 1, 0, 0.6, 1,
1.263311, -0.6603274, 2.490329, 1, 0, 0.5921569, 1,
1.266372, -1.661341, 4.123359, 1, 0, 0.5882353, 1,
1.272536, 0.8600609, 0.7349431, 1, 0, 0.5803922, 1,
1.273823, -0.7953767, 2.894585, 1, 0, 0.5764706, 1,
1.27443, 0.5702395, 0.6135293, 1, 0, 0.5686275, 1,
1.288077, 1.435865, 0.9575931, 1, 0, 0.5647059, 1,
1.313291, -0.03530247, 1.458246, 1, 0, 0.5568628, 1,
1.333564, 0.6298087, -0.03040806, 1, 0, 0.5529412, 1,
1.334183, -0.6004483, 2.778215, 1, 0, 0.5450981, 1,
1.33463, 1.289738, -0.1745101, 1, 0, 0.5411765, 1,
1.334657, -0.290162, 1.238926, 1, 0, 0.5333334, 1,
1.351704, -0.131643, 3.264061, 1, 0, 0.5294118, 1,
1.355491, -0.0853838, 1.173067, 1, 0, 0.5215687, 1,
1.356448, -0.4329817, 4.004202, 1, 0, 0.5176471, 1,
1.375256, 0.8824034, -0.2030881, 1, 0, 0.509804, 1,
1.377992, -0.8818069, 1.551979, 1, 0, 0.5058824, 1,
1.381632, -0.4801255, 1.44289, 1, 0, 0.4980392, 1,
1.387535, -1.026153, 0.7521874, 1, 0, 0.4901961, 1,
1.388748, 0.6184064, 0.6834438, 1, 0, 0.4862745, 1,
1.404512, -0.8733564, 2.469086, 1, 0, 0.4784314, 1,
1.405893, 0.6581451, 0.7271087, 1, 0, 0.4745098, 1,
1.418231, 0.4981146, 0.7113193, 1, 0, 0.4666667, 1,
1.423377, -1.198858, 1.425059, 1, 0, 0.4627451, 1,
1.424556, -0.6497065, 2.416894, 1, 0, 0.454902, 1,
1.433895, 0.8761762, 1.87331, 1, 0, 0.4509804, 1,
1.435121, -0.8723053, 1.822601, 1, 0, 0.4431373, 1,
1.440876, 0.4993235, 0.3768156, 1, 0, 0.4392157, 1,
1.447562, 0.6184927, 1.123664, 1, 0, 0.4313726, 1,
1.460721, 0.1730807, 2.512784, 1, 0, 0.427451, 1,
1.473702, 1.551545, 2.563477, 1, 0, 0.4196078, 1,
1.478661, 0.1273927, 1.398914, 1, 0, 0.4156863, 1,
1.480354, 0.03049199, 1.022001, 1, 0, 0.4078431, 1,
1.481237, 0.6361361, 1.588863, 1, 0, 0.4039216, 1,
1.495203, 0.4645988, 2.491822, 1, 0, 0.3960784, 1,
1.497621, 0.2609313, 1.573757, 1, 0, 0.3882353, 1,
1.499476, 0.7683474, 1.15598, 1, 0, 0.3843137, 1,
1.50248, -0.7680883, 1.106217, 1, 0, 0.3764706, 1,
1.505919, 0.5178966, 2.442429, 1, 0, 0.372549, 1,
1.507416, 0.2984682, -0.7758322, 1, 0, 0.3647059, 1,
1.513498, 1.173668, 1.06278, 1, 0, 0.3607843, 1,
1.520556, -0.2799553, 2.241888, 1, 0, 0.3529412, 1,
1.539579, -0.1218291, 2.20517, 1, 0, 0.3490196, 1,
1.546066, 0.0811943, 2.648205, 1, 0, 0.3411765, 1,
1.565488, -1.379037, 2.775757, 1, 0, 0.3372549, 1,
1.569332, 0.4883542, -0.6438241, 1, 0, 0.3294118, 1,
1.569336, -0.2649042, 0.4169135, 1, 0, 0.3254902, 1,
1.570151, -0.7531753, 3.0176, 1, 0, 0.3176471, 1,
1.57336, -0.3604497, -0.1485588, 1, 0, 0.3137255, 1,
1.586205, -2.30242, 3.393037, 1, 0, 0.3058824, 1,
1.619572, -1.770819, 2.200949, 1, 0, 0.2980392, 1,
1.624263, 0.1394476, 0.6571687, 1, 0, 0.2941177, 1,
1.638506, -0.9399061, 1.387807, 1, 0, 0.2862745, 1,
1.657092, -1.860664, 2.732179, 1, 0, 0.282353, 1,
1.659119, 0.09579585, 1.886374, 1, 0, 0.2745098, 1,
1.669464, 0.0476405, 3.091231, 1, 0, 0.2705882, 1,
1.669741, -0.2738694, 1.035925, 1, 0, 0.2627451, 1,
1.688646, 2.962032, 0.2260504, 1, 0, 0.2588235, 1,
1.692681, 0.7657077, 2.043961, 1, 0, 0.2509804, 1,
1.717821, 0.9917977, 2.45189, 1, 0, 0.2470588, 1,
1.728627, -0.3069311, 1.730712, 1, 0, 0.2392157, 1,
1.731766, 0.456015, 0.5318784, 1, 0, 0.2352941, 1,
1.760945, 1.918625, 2.443935, 1, 0, 0.227451, 1,
1.76418, -0.9736984, 2.581977, 1, 0, 0.2235294, 1,
1.786145, -0.831524, 1.128274, 1, 0, 0.2156863, 1,
1.812754, 0.8509808, -0.1936565, 1, 0, 0.2117647, 1,
1.85388, -0.4255221, 0.9433874, 1, 0, 0.2039216, 1,
1.864962, -0.7400847, 2.432314, 1, 0, 0.1960784, 1,
1.877533, 0.9020231, 1.276803, 1, 0, 0.1921569, 1,
1.891739, -1.173203, 0.7941527, 1, 0, 0.1843137, 1,
1.925979, -2.130251, 0.9489701, 1, 0, 0.1803922, 1,
1.934126, 0.06097814, 1.816952, 1, 0, 0.172549, 1,
1.936268, -1.052307, 1.651082, 1, 0, 0.1686275, 1,
1.947515, -0.7042537, 1.892523, 1, 0, 0.1607843, 1,
1.983813, 1.154356, 1.486289, 1, 0, 0.1568628, 1,
1.984571, -1.590296, 3.54003, 1, 0, 0.1490196, 1,
2.01028, -0.5602594, 1.327994, 1, 0, 0.145098, 1,
2.011567, -0.5293047, 2.816707, 1, 0, 0.1372549, 1,
2.020606, 0.524729, 1.566171, 1, 0, 0.1333333, 1,
2.03878, 2.095091, 1.594409, 1, 0, 0.1254902, 1,
2.040189, -0.1851077, 2.146425, 1, 0, 0.1215686, 1,
2.041174, -0.1511798, 0.6748149, 1, 0, 0.1137255, 1,
2.070398, -1.025833, 1.356609, 1, 0, 0.1098039, 1,
2.070962, -1.721836, 2.960525, 1, 0, 0.1019608, 1,
2.080128, 0.7051581, 1.914864, 1, 0, 0.09411765, 1,
2.105155, 0.9270274, -0.162679, 1, 0, 0.09019608, 1,
2.119911, 0.593138, -0.1967085, 1, 0, 0.08235294, 1,
2.141301, -1.31645, 4.23847, 1, 0, 0.07843138, 1,
2.429997, -0.1886937, 1.923395, 1, 0, 0.07058824, 1,
2.472067, -1.459486, 3.512309, 1, 0, 0.06666667, 1,
2.536498, 0.01999412, 1.148108, 1, 0, 0.05882353, 1,
2.576813, -0.8013098, 1.930814, 1, 0, 0.05490196, 1,
2.63005, -0.05666782, 0.5380474, 1, 0, 0.04705882, 1,
2.67037, -0.4509131, 1.680762, 1, 0, 0.04313726, 1,
2.717932, -0.6880586, 1.300752, 1, 0, 0.03529412, 1,
2.84802, -0.009206702, 2.193013, 1, 0, 0.03137255, 1,
2.84917, -0.3160544, 4.192961, 1, 0, 0.02352941, 1,
2.906574, 1.07738, -1.388146, 1, 0, 0.01960784, 1,
3.017779, -0.5369498, 2.801015, 1, 0, 0.01176471, 1,
3.116944, -0.8860912, 3.063141, 1, 0, 0.007843138, 1
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
0.02653682, -4.433154, -6.266268, 0, -0.5, 0.5, 0.5,
0.02653682, -4.433154, -6.266268, 1, -0.5, 0.5, 0.5,
0.02653682, -4.433154, -6.266268, 1, 1.5, 0.5, 0.5,
0.02653682, -4.433154, -6.266268, 0, 1.5, 0.5, 0.5
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
-4.111519, 0.04164875, -6.266268, 0, -0.5, 0.5, 0.5,
-4.111519, 0.04164875, -6.266268, 1, -0.5, 0.5, 0.5,
-4.111519, 0.04164875, -6.266268, 1, 1.5, 0.5, 0.5,
-4.111519, 0.04164875, -6.266268, 0, 1.5, 0.5, 0.5
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
-4.111519, -4.433154, 0.2222495, 0, -0.5, 0.5, 0.5,
-4.111519, -4.433154, 0.2222495, 1, -0.5, 0.5, 0.5,
-4.111519, -4.433154, 0.2222495, 1, 1.5, 0.5, 0.5,
-4.111519, -4.433154, 0.2222495, 0, 1.5, 0.5, 0.5
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
-3, -3.400507, -4.768918,
3, -3.400507, -4.768918,
-3, -3.400507, -4.768918,
-3, -3.572615, -5.018476,
-2, -3.400507, -4.768918,
-2, -3.572615, -5.018476,
-1, -3.400507, -4.768918,
-1, -3.572615, -5.018476,
0, -3.400507, -4.768918,
0, -3.572615, -5.018476,
1, -3.400507, -4.768918,
1, -3.572615, -5.018476,
2, -3.400507, -4.768918,
2, -3.572615, -5.018476,
3, -3.400507, -4.768918,
3, -3.572615, -5.018476
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
-3, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
-3, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
-3, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
-3, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5,
-2, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
-2, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
-2, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
-2, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5,
-1, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
-1, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
-1, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
-1, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5,
0, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
0, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
0, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
0, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5,
1, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
1, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
1, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
1, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5,
2, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
2, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
2, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
2, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5,
3, -3.91683, -5.517593, 0, -0.5, 0.5, 0.5,
3, -3.91683, -5.517593, 1, -0.5, 0.5, 0.5,
3, -3.91683, -5.517593, 1, 1.5, 0.5, 0.5,
3, -3.91683, -5.517593, 0, 1.5, 0.5, 0.5
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
-3.156583, -3, -4.768918,
-3.156583, 3, -4.768918,
-3.156583, -3, -4.768918,
-3.315739, -3, -5.018476,
-3.156583, -2, -4.768918,
-3.315739, -2, -5.018476,
-3.156583, -1, -4.768918,
-3.315739, -1, -5.018476,
-3.156583, 0, -4.768918,
-3.315739, 0, -5.018476,
-3.156583, 1, -4.768918,
-3.315739, 1, -5.018476,
-3.156583, 2, -4.768918,
-3.315739, 2, -5.018476,
-3.156583, 3, -4.768918,
-3.315739, 3, -5.018476
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
-3.634051, -3, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, -3, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, -3, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, -3, -5.517593, 0, 1.5, 0.5, 0.5,
-3.634051, -2, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, -2, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, -2, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, -2, -5.517593, 0, 1.5, 0.5, 0.5,
-3.634051, -1, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, -1, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, -1, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, -1, -5.517593, 0, 1.5, 0.5, 0.5,
-3.634051, 0, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, 0, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, 0, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, 0, -5.517593, 0, 1.5, 0.5, 0.5,
-3.634051, 1, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, 1, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, 1, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, 1, -5.517593, 0, 1.5, 0.5, 0.5,
-3.634051, 2, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, 2, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, 2, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, 2, -5.517593, 0, 1.5, 0.5, 0.5,
-3.634051, 3, -5.517593, 0, -0.5, 0.5, 0.5,
-3.634051, 3, -5.517593, 1, -0.5, 0.5, 0.5,
-3.634051, 3, -5.517593, 1, 1.5, 0.5, 0.5,
-3.634051, 3, -5.517593, 0, 1.5, 0.5, 0.5
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
-3.156583, -3.400507, -4,
-3.156583, -3.400507, 4,
-3.156583, -3.400507, -4,
-3.315739, -3.572615, -4,
-3.156583, -3.400507, -2,
-3.315739, -3.572615, -2,
-3.156583, -3.400507, 0,
-3.315739, -3.572615, 0,
-3.156583, -3.400507, 2,
-3.315739, -3.572615, 2,
-3.156583, -3.400507, 4,
-3.315739, -3.572615, 4
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
-3.634051, -3.91683, -4, 0, -0.5, 0.5, 0.5,
-3.634051, -3.91683, -4, 1, -0.5, 0.5, 0.5,
-3.634051, -3.91683, -4, 1, 1.5, 0.5, 0.5,
-3.634051, -3.91683, -4, 0, 1.5, 0.5, 0.5,
-3.634051, -3.91683, -2, 0, -0.5, 0.5, 0.5,
-3.634051, -3.91683, -2, 1, -0.5, 0.5, 0.5,
-3.634051, -3.91683, -2, 1, 1.5, 0.5, 0.5,
-3.634051, -3.91683, -2, 0, 1.5, 0.5, 0.5,
-3.634051, -3.91683, 0, 0, -0.5, 0.5, 0.5,
-3.634051, -3.91683, 0, 1, -0.5, 0.5, 0.5,
-3.634051, -3.91683, 0, 1, 1.5, 0.5, 0.5,
-3.634051, -3.91683, 0, 0, 1.5, 0.5, 0.5,
-3.634051, -3.91683, 2, 0, -0.5, 0.5, 0.5,
-3.634051, -3.91683, 2, 1, -0.5, 0.5, 0.5,
-3.634051, -3.91683, 2, 1, 1.5, 0.5, 0.5,
-3.634051, -3.91683, 2, 0, 1.5, 0.5, 0.5,
-3.634051, -3.91683, 4, 0, -0.5, 0.5, 0.5,
-3.634051, -3.91683, 4, 1, -0.5, 0.5, 0.5,
-3.634051, -3.91683, 4, 1, 1.5, 0.5, 0.5,
-3.634051, -3.91683, 4, 0, 1.5, 0.5, 0.5
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
-3.156583, -3.400507, -4.768918,
-3.156583, 3.483804, -4.768918,
-3.156583, -3.400507, 5.213417,
-3.156583, 3.483804, 5.213417,
-3.156583, -3.400507, -4.768918,
-3.156583, -3.400507, 5.213417,
-3.156583, 3.483804, -4.768918,
-3.156583, 3.483804, 5.213417,
-3.156583, -3.400507, -4.768918,
3.209656, -3.400507, -4.768918,
-3.156583, -3.400507, 5.213417,
3.209656, -3.400507, 5.213417,
-3.156583, 3.483804, -4.768918,
3.209656, 3.483804, -4.768918,
-3.156583, 3.483804, 5.213417,
3.209656, 3.483804, 5.213417,
3.209656, -3.400507, -4.768918,
3.209656, 3.483804, -4.768918,
3.209656, -3.400507, 5.213417,
3.209656, 3.483804, 5.213417,
3.209656, -3.400507, -4.768918,
3.209656, -3.400507, 5.213417,
3.209656, 3.483804, -4.768918,
3.209656, 3.483804, 5.213417
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
var radius = 7.31319;
var distance = 32.53721;
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
mvMatrix.translate( -0.02653682, -0.04164875, -0.2222495 );
mvMatrix.scale( 1.242046, 1.148577, 0.7921157 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.53721);
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
difenacoum<-read.table("difenacoum.xyz")
```

```
## Error in read.table("difenacoum.xyz"): no lines available in input
```

```r
x<-difenacoum$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
```

```r
y<-difenacoum$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
```

```r
z<-difenacoum$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
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
-3.063871, -0.8935092, -2.754904, 0, 0, 1, 1, 1,
-3.026214, 0.5919397, -0.04292371, 1, 0, 0, 1, 1,
-2.802359, 0.5896721, -0.6452883, 1, 0, 0, 1, 1,
-2.688372, 1.663499, -2.247443, 1, 0, 0, 1, 1,
-2.504999, -1.270531, -0.5348426, 1, 0, 0, 1, 1,
-2.430089, -0.5708423, -2.18392, 1, 0, 0, 1, 1,
-2.296134, -1.072028, -2.447176, 0, 0, 0, 1, 1,
-2.28248, 0.3319626, -1.438607, 0, 0, 0, 1, 1,
-2.177822, -1.193427, -3.309896, 0, 0, 0, 1, 1,
-2.163936, -0.5107576, -0.6454142, 0, 0, 0, 1, 1,
-2.140632, 1.064706, -2.147072, 0, 0, 0, 1, 1,
-2.13833, 1.628356, -0.4496095, 0, 0, 0, 1, 1,
-2.127823, 0.9391361, -0.5400468, 0, 0, 0, 1, 1,
-2.127292, -0.5952852, -1.261014, 1, 1, 1, 1, 1,
-2.116914, 0.3239466, -0.5714584, 1, 1, 1, 1, 1,
-2.101008, 1.461817, -0.5798094, 1, 1, 1, 1, 1,
-2.081907, -0.6720376, -0.5061426, 1, 1, 1, 1, 1,
-1.960925, 0.5121841, -1.033193, 1, 1, 1, 1, 1,
-1.959503, -2.836092, -1.678868, 1, 1, 1, 1, 1,
-1.946241, -0.5163315, -1.89303, 1, 1, 1, 1, 1,
-1.90335, 1.811828, -0.9456272, 1, 1, 1, 1, 1,
-1.895886, 0.6608313, -1.762859, 1, 1, 1, 1, 1,
-1.880767, 0.7651561, -1.883349, 1, 1, 1, 1, 1,
-1.879457, 2.35826, -1.397476, 1, 1, 1, 1, 1,
-1.875586, -0.2410518, -2.339728, 1, 1, 1, 1, 1,
-1.857279, 0.979755, -1.371498, 1, 1, 1, 1, 1,
-1.855995, 0.2341748, -1.643329, 1, 1, 1, 1, 1,
-1.842496, 0.2994946, -1.335661, 1, 1, 1, 1, 1,
-1.833175, 0.3887379, -2.327953, 0, 0, 1, 1, 1,
-1.780683, 1.401978, -2.41695, 1, 0, 0, 1, 1,
-1.763452, 0.7832489, -0.08572931, 1, 0, 0, 1, 1,
-1.762935, 0.1094879, -1.649348, 1, 0, 0, 1, 1,
-1.746582, 0.7389842, -1.783456, 1, 0, 0, 1, 1,
-1.743193, -1.49924, -0.4693323, 1, 0, 0, 1, 1,
-1.740031, -0.6551963, -1.80701, 0, 0, 0, 1, 1,
-1.734826, 0.5013255, -2.245468, 0, 0, 0, 1, 1,
-1.720775, 0.2324801, -2.573425, 0, 0, 0, 1, 1,
-1.669168, 0.5364048, -0.8977336, 0, 0, 0, 1, 1,
-1.668217, -1.296993, -2.544042, 0, 0, 0, 1, 1,
-1.665478, 1.17227, -0.5261564, 0, 0, 0, 1, 1,
-1.656321, 0.6495016, -2.230878, 0, 0, 0, 1, 1,
-1.655334, 1.631358, -1.057603, 1, 1, 1, 1, 1,
-1.649719, 0.8873729, -1.345115, 1, 1, 1, 1, 1,
-1.642783, -0.3489471, -1.54165, 1, 1, 1, 1, 1,
-1.636679, 1.129255, 0.07879273, 1, 1, 1, 1, 1,
-1.619928, 1.116092, -1.377328, 1, 1, 1, 1, 1,
-1.587166, -1.35494, -3.135584, 1, 1, 1, 1, 1,
-1.586554, -1.020267, -2.092021, 1, 1, 1, 1, 1,
-1.577958, 0.0312513, -1.683001, 1, 1, 1, 1, 1,
-1.569148, 0.4391864, 0.200633, 1, 1, 1, 1, 1,
-1.556881, 1.412676, -1.549441, 1, 1, 1, 1, 1,
-1.555664, 0.2163485, -1.617617, 1, 1, 1, 1, 1,
-1.552159, 0.9750638, -2.209788, 1, 1, 1, 1, 1,
-1.547581, 0.9861528, -1.119401, 1, 1, 1, 1, 1,
-1.54465, -3.30025, -3.663923, 1, 1, 1, 1, 1,
-1.538271, 1.115202, -0.7295601, 1, 1, 1, 1, 1,
-1.524187, 0.7932692, -1.677169, 0, 0, 1, 1, 1,
-1.522551, 0.2807814, -0.7219225, 1, 0, 0, 1, 1,
-1.515177, -0.2460369, -2.936249, 1, 0, 0, 1, 1,
-1.504791, 1.3723, -0.1212126, 1, 0, 0, 1, 1,
-1.48806, -0.7936519, 0.4839801, 1, 0, 0, 1, 1,
-1.482785, -1.985373, -2.307876, 1, 0, 0, 1, 1,
-1.478547, -0.06069762, -1.139634, 0, 0, 0, 1, 1,
-1.473477, 0.11213, -2.825376, 0, 0, 0, 1, 1,
-1.4703, 0.009039466, -1.706346, 0, 0, 0, 1, 1,
-1.435205, -1.303755, -4.623544, 0, 0, 0, 1, 1,
-1.430938, -1.437089, -3.896207, 0, 0, 0, 1, 1,
-1.426868, 0.09204962, -2.636683, 0, 0, 0, 1, 1,
-1.382254, 0.907247, -1.772822, 0, 0, 0, 1, 1,
-1.372441, 0.4246649, -0.336902, 1, 1, 1, 1, 1,
-1.365811, -0.7558596, -3.352178, 1, 1, 1, 1, 1,
-1.363404, -0.1062098, -1.094949, 1, 1, 1, 1, 1,
-1.352911, -0.6786925, 0.1889248, 1, 1, 1, 1, 1,
-1.344131, 0.7360307, 0.007542275, 1, 1, 1, 1, 1,
-1.342121, -0.08881903, -0.8907374, 1, 1, 1, 1, 1,
-1.341472, 0.1251414, -2.358778, 1, 1, 1, 1, 1,
-1.34063, -0.7887182, -2.203542, 1, 1, 1, 1, 1,
-1.319226, -0.5375594, -1.295569, 1, 1, 1, 1, 1,
-1.314625, -0.6136878, -3.669535, 1, 1, 1, 1, 1,
-1.313293, 0.4642942, 0.2312828, 1, 1, 1, 1, 1,
-1.313102, 0.2369066, -1.419001, 1, 1, 1, 1, 1,
-1.267139, -0.2792361, -0.5755441, 1, 1, 1, 1, 1,
-1.262883, 1.219862, -0.1394963, 1, 1, 1, 1, 1,
-1.251469, 1.616663, 0.2221414, 1, 1, 1, 1, 1,
-1.242081, -0.276913, -9.011348e-05, 0, 0, 1, 1, 1,
-1.238024, -1.433741, -3.713449, 1, 0, 0, 1, 1,
-1.224069, 0.5445358, -3.473913, 1, 0, 0, 1, 1,
-1.223307, 0.7159912, 0.3562964, 1, 0, 0, 1, 1,
-1.215934, -0.7340716, -2.374358, 1, 0, 0, 1, 1,
-1.214834, 2.140174, -0.8235143, 1, 0, 0, 1, 1,
-1.210045, -1.040429, -0.2974671, 0, 0, 0, 1, 1,
-1.204883, 0.3654364, -0.772827, 0, 0, 0, 1, 1,
-1.202922, 0.4747409, -1.623172, 0, 0, 0, 1, 1,
-1.199858, 0.02058054, -2.248917, 0, 0, 0, 1, 1,
-1.192649, -0.6462697, -2.356481, 0, 0, 0, 1, 1,
-1.187766, -0.02341461, -0.1025257, 0, 0, 0, 1, 1,
-1.186154, 1.589614, -0.9419481, 0, 0, 0, 1, 1,
-1.182752, -0.7011453, -2.474867, 1, 1, 1, 1, 1,
-1.182741, 1.196205, -1.907049, 1, 1, 1, 1, 1,
-1.180887, -0.8584777, -3.169209, 1, 1, 1, 1, 1,
-1.172876, 1.907577, 0.8861653, 1, 1, 1, 1, 1,
-1.170424, -1.208441, -3.569672, 1, 1, 1, 1, 1,
-1.168223, -1.043277, -3.606683, 1, 1, 1, 1, 1,
-1.16557, 0.1550258, -0.3363563, 1, 1, 1, 1, 1,
-1.159416, 0.6004437, -0.1076944, 1, 1, 1, 1, 1,
-1.146348, 1.28572, -1.633231, 1, 1, 1, 1, 1,
-1.142232, -3.104594, -1.455075, 1, 1, 1, 1, 1,
-1.137212, 1.844838, -1.457551, 1, 1, 1, 1, 1,
-1.129627, -0.07072308, -0.925737, 1, 1, 1, 1, 1,
-1.118531, -0.08219589, -0.6736258, 1, 1, 1, 1, 1,
-1.118451, -0.586578, -0.7365085, 1, 1, 1, 1, 1,
-1.114974, -0.505116, -2.432407, 1, 1, 1, 1, 1,
-1.109723, -2.349977, -3.075381, 0, 0, 1, 1, 1,
-1.089921, -0.9627995, -2.491113, 1, 0, 0, 1, 1,
-1.088055, 1.228402, -0.8139801, 1, 0, 0, 1, 1,
-1.073032, 0.3127154, -1.129376, 1, 0, 0, 1, 1,
-1.071793, 0.2421378, -0.6950457, 1, 0, 0, 1, 1,
-1.065569, -0.5503679, -3.13856, 1, 0, 0, 1, 1,
-1.06473, -0.4475388, -2.618071, 0, 0, 0, 1, 1,
-1.060394, -0.8204712, -1.916232, 0, 0, 0, 1, 1,
-1.057745, -0.559118, -1.062286, 0, 0, 0, 1, 1,
-1.049265, 1.179104, -0.4498885, 0, 0, 0, 1, 1,
-1.036345, -1.497843, -1.709186, 0, 0, 0, 1, 1,
-1.034527, -0.7356273, -1.729687, 0, 0, 0, 1, 1,
-1.027735, -0.2790453, -1.196352, 0, 0, 0, 1, 1,
-1.027687, -0.05972569, -1.172929, 1, 1, 1, 1, 1,
-1.021867, -0.1562356, -2.404271, 1, 1, 1, 1, 1,
-1.017999, -1.453924, -3.17469, 1, 1, 1, 1, 1,
-1.016986, 0.9261685, -1.818666, 1, 1, 1, 1, 1,
-1.012506, 0.1796444, -2.207832, 1, 1, 1, 1, 1,
-1.012179, -0.8684291, -2.083616, 1, 1, 1, 1, 1,
-1.011947, 0.3974358, -0.01122089, 1, 1, 1, 1, 1,
-1.000815, 0.7979335, -0.8944916, 1, 1, 1, 1, 1,
-0.9962221, 1.035454, -1.455167, 1, 1, 1, 1, 1,
-0.9958805, 2.432861, 0.08525661, 1, 1, 1, 1, 1,
-0.9902996, 0.9619608, -1.422979, 1, 1, 1, 1, 1,
-0.9832454, 1.104709, -2.085897, 1, 1, 1, 1, 1,
-0.9748989, -1.289885, -2.022699, 1, 1, 1, 1, 1,
-0.9738576, -1.065367, -3.662577, 1, 1, 1, 1, 1,
-0.97168, 0.3113796, -2.342831, 1, 1, 1, 1, 1,
-0.9700452, -0.9881756, -2.872185, 0, 0, 1, 1, 1,
-0.9657426, -0.3533055, -2.774703, 1, 0, 0, 1, 1,
-0.9586436, 2.095923, -1.25013, 1, 0, 0, 1, 1,
-0.9586002, -1.399196, -3.741562, 1, 0, 0, 1, 1,
-0.9512554, -0.523439, -2.623111, 1, 0, 0, 1, 1,
-0.9459577, 0.4272988, -1.785126, 1, 0, 0, 1, 1,
-0.9411986, 0.6594064, -1.274809, 0, 0, 0, 1, 1,
-0.9394256, 0.4607027, 0.1288389, 0, 0, 0, 1, 1,
-0.9322063, 0.708226, -1.823859, 0, 0, 0, 1, 1,
-0.9226669, -1.083153, -4.336309, 0, 0, 0, 1, 1,
-0.917944, -1.027155, -1.646688, 0, 0, 0, 1, 1,
-0.91283, 0.1632871, 0.5242533, 0, 0, 0, 1, 1,
-0.9104491, 1.406547, 0.2177718, 0, 0, 0, 1, 1,
-0.9094457, 1.231138, 0.1287369, 1, 1, 1, 1, 1,
-0.9033229, 1.769947, 2.597798, 1, 1, 1, 1, 1,
-0.8986916, 1.475792, 0.5931283, 1, 1, 1, 1, 1,
-0.8982329, -0.5259951, -1.416398, 1, 1, 1, 1, 1,
-0.8916162, -1.160558, -0.04783718, 1, 1, 1, 1, 1,
-0.8913504, 0.8668611, -2.808371, 1, 1, 1, 1, 1,
-0.8898572, 0.1864034, -1.108408, 1, 1, 1, 1, 1,
-0.8822433, -0.1312654, -0.5051477, 1, 1, 1, 1, 1,
-0.881249, -1.39888, -0.7725298, 1, 1, 1, 1, 1,
-0.8765487, 0.7884853, -0.6236384, 1, 1, 1, 1, 1,
-0.8698297, -0.01154063, -2.586183, 1, 1, 1, 1, 1,
-0.8634226, 0.3630013, -2.530296, 1, 1, 1, 1, 1,
-0.8584632, 0.4884658, -0.3322566, 1, 1, 1, 1, 1,
-0.8573285, -0.7105356, -1.258577, 1, 1, 1, 1, 1,
-0.8494263, -0.2048859, -1.893186, 1, 1, 1, 1, 1,
-0.849077, -0.4041226, -2.646934, 0, 0, 1, 1, 1,
-0.8464808, 1.197635, -0.6273388, 1, 0, 0, 1, 1,
-0.8426579, -0.3722284, -1.533577, 1, 0, 0, 1, 1,
-0.8406048, 2.212624, -0.2290368, 1, 0, 0, 1, 1,
-0.8383433, 1.758643, -0.7805465, 1, 0, 0, 1, 1,
-0.829012, 0.4653384, -1.768849, 1, 0, 0, 1, 1,
-0.8288503, 2.754216, 0.8224503, 0, 0, 0, 1, 1,
-0.8285648, -1.889214, -3.559646, 0, 0, 0, 1, 1,
-0.82775, -2.364844, -2.107056, 0, 0, 0, 1, 1,
-0.8254005, 0.1617175, -1.904475, 0, 0, 0, 1, 1,
-0.8253261, 0.2165072, -0.2460451, 0, 0, 0, 1, 1,
-0.8239372, -0.556794, -2.536161, 0, 0, 0, 1, 1,
-0.8206041, -0.08311339, -2.026255, 0, 0, 0, 1, 1,
-0.8103949, -0.07052115, -2.72287, 1, 1, 1, 1, 1,
-0.8043213, -0.1688428, -1.5643, 1, 1, 1, 1, 1,
-0.8035725, 0.6613014, 1.123484, 1, 1, 1, 1, 1,
-0.7993669, 0.1276371, -1.234525, 1, 1, 1, 1, 1,
-0.7969982, -2.243477, -4.037366, 1, 1, 1, 1, 1,
-0.7918278, -0.3792812, -2.211806, 1, 1, 1, 1, 1,
-0.7898535, 0.111563, -0.2590215, 1, 1, 1, 1, 1,
-0.7857535, -2.401862, -1.832326, 1, 1, 1, 1, 1,
-0.7782874, 1.044819, -0.5181001, 1, 1, 1, 1, 1,
-0.7780809, -0.3676736, 0.0186256, 1, 1, 1, 1, 1,
-0.7742129, 0.3531215, -1.969189, 1, 1, 1, 1, 1,
-0.7738779, 0.2322601, -1.658975, 1, 1, 1, 1, 1,
-0.7685522, 1.325279, 0.09009951, 1, 1, 1, 1, 1,
-0.7659538, 0.2518569, -1.072411, 1, 1, 1, 1, 1,
-0.7652326, -0.4948417, -0.7091331, 1, 1, 1, 1, 1,
-0.7648228, -0.8125955, -1.34578, 0, 0, 1, 1, 1,
-0.7605597, -0.6447648, -2.818085, 1, 0, 0, 1, 1,
-0.7549301, 0.1538472, -1.650902, 1, 0, 0, 1, 1,
-0.754239, 0.3734353, -1.950219, 1, 0, 0, 1, 1,
-0.7525955, -1.890723, -2.529388, 1, 0, 0, 1, 1,
-0.75203, -0.4560937, -2.800078, 1, 0, 0, 1, 1,
-0.7497824, 1.217713, -0.8850023, 0, 0, 0, 1, 1,
-0.7496799, 0.3730719, -1.027525, 0, 0, 0, 1, 1,
-0.7494778, 1.388262, -0.9582426, 0, 0, 0, 1, 1,
-0.7467458, -0.5102602, -0.7475066, 0, 0, 0, 1, 1,
-0.7391206, 0.002141598, -0.6864541, 0, 0, 0, 1, 1,
-0.7375721, -1.200584, -3.083791, 0, 0, 0, 1, 1,
-0.736772, -0.8603368, -1.50579, 0, 0, 0, 1, 1,
-0.7349193, -1.507152, -2.925272, 1, 1, 1, 1, 1,
-0.7338634, 0.8953392, 0.9684308, 1, 1, 1, 1, 1,
-0.7277249, 0.311792, -2.30945, 1, 1, 1, 1, 1,
-0.721218, -0.9611869, -2.464988, 1, 1, 1, 1, 1,
-0.7210071, -0.2624963, -1.889893, 1, 1, 1, 1, 1,
-0.7206628, 0.7707927, 0.04368041, 1, 1, 1, 1, 1,
-0.7194608, 0.8580346, -3.26117, 1, 1, 1, 1, 1,
-0.7114621, -0.6324623, -2.331399, 1, 1, 1, 1, 1,
-0.7087842, 0.6802992, -0.9140918, 1, 1, 1, 1, 1,
-0.7084019, -0.655827, -2.38601, 1, 1, 1, 1, 1,
-0.7056165, -3.119281, -2.631029, 1, 1, 1, 1, 1,
-0.703837, -0.061415, -1.622005, 1, 1, 1, 1, 1,
-0.7021415, -2.610901, -2.445741, 1, 1, 1, 1, 1,
-0.6997969, 0.4735736, -1.393713, 1, 1, 1, 1, 1,
-0.6996936, -0.08991688, -3.75212, 1, 1, 1, 1, 1,
-0.6990243, -0.3482889, -1.892303, 0, 0, 1, 1, 1,
-0.6965482, 0.6824616, -1.871528, 1, 0, 0, 1, 1,
-0.6938912, 0.965619, -0.4961034, 1, 0, 0, 1, 1,
-0.6921564, -1.184834, -3.262481, 1, 0, 0, 1, 1,
-0.6804867, -0.9349893, -3.553536, 1, 0, 0, 1, 1,
-0.6747422, 0.3420632, -1.401402, 1, 0, 0, 1, 1,
-0.6744785, -0.4371243, -1.740698, 0, 0, 0, 1, 1,
-0.6680462, -0.01137674, -2.168416, 0, 0, 0, 1, 1,
-0.6635767, 0.002430481, -1.29058, 0, 0, 0, 1, 1,
-0.6583812, 0.1339009, -0.7069792, 0, 0, 0, 1, 1,
-0.6537112, -0.8058355, -1.479185, 0, 0, 0, 1, 1,
-0.6511915, -0.1155669, -1.884807, 0, 0, 0, 1, 1,
-0.6491191, -1.186484, -3.53672, 0, 0, 0, 1, 1,
-0.6478292, 0.761532, -1.067424, 1, 1, 1, 1, 1,
-0.6370175, -0.9255221, -1.881523, 1, 1, 1, 1, 1,
-0.6351818, -0.1187822, 0.06785688, 1, 1, 1, 1, 1,
-0.6323737, 1.127122, -2.35884, 1, 1, 1, 1, 1,
-0.628418, -0.1604494, -1.756529, 1, 1, 1, 1, 1,
-0.6204512, -0.5280215, -0.8549863, 1, 1, 1, 1, 1,
-0.6196058, -0.1316459, -0.2845482, 1, 1, 1, 1, 1,
-0.6181798, -1.592742, -1.107689, 1, 1, 1, 1, 1,
-0.6160802, 0.9765825, -0.6343232, 1, 1, 1, 1, 1,
-0.6083276, -2.292358, -3.982274, 1, 1, 1, 1, 1,
-0.5992529, -0.8051149, -3.965296, 1, 1, 1, 1, 1,
-0.5928097, 1.477051, 0.3577906, 1, 1, 1, 1, 1,
-0.5923304, 0.5880241, -2.137092, 1, 1, 1, 1, 1,
-0.5843121, 0.2054184, -1.783619, 1, 1, 1, 1, 1,
-0.5829883, 0.2982082, -0.2509961, 1, 1, 1, 1, 1,
-0.5806528, 0.5967609, -2.278202, 0, 0, 1, 1, 1,
-0.5804419, -1.22679, -3.482654, 1, 0, 0, 1, 1,
-0.5742779, -0.4367507, -3.145121, 1, 0, 0, 1, 1,
-0.5720982, 0.03697915, -1.319536, 1, 0, 0, 1, 1,
-0.5693811, 0.6592889, -0.6585351, 1, 0, 0, 1, 1,
-0.5540872, -0.09681039, -0.4151275, 1, 0, 0, 1, 1,
-0.5532635, 0.4743072, -1.088277, 0, 0, 0, 1, 1,
-0.5517091, -1.665319, -2.803106, 0, 0, 0, 1, 1,
-0.5514889, 0.5958551, -1.186914, 0, 0, 0, 1, 1,
-0.5497814, 1.341664, -0.1877868, 0, 0, 0, 1, 1,
-0.5469092, -0.1740824, -2.307169, 0, 0, 0, 1, 1,
-0.5434738, -0.8011084, -1.824137, 0, 0, 0, 1, 1,
-0.5428532, 0.6111721, -1.577141, 0, 0, 0, 1, 1,
-0.5351107, -0.047024, -1.431869, 1, 1, 1, 1, 1,
-0.5336638, -0.8672212, -3.909201, 1, 1, 1, 1, 1,
-0.530391, 0.2687677, -1.59164, 1, 1, 1, 1, 1,
-0.5284677, 0.5289627, -3.138148, 1, 1, 1, 1, 1,
-0.5278824, 0.3380595, -2.001858, 1, 1, 1, 1, 1,
-0.5257643, 0.0512144, -2.569529, 1, 1, 1, 1, 1,
-0.5246024, -0.8310038, -2.680796, 1, 1, 1, 1, 1,
-0.5227612, 0.8181689, -1.237637, 1, 1, 1, 1, 1,
-0.5122493, 0.8828601, 0.02948105, 1, 1, 1, 1, 1,
-0.5120128, -0.2072316, -2.743996, 1, 1, 1, 1, 1,
-0.5071554, 0.3074348, -0.5326641, 1, 1, 1, 1, 1,
-0.4924093, 1.652753, 0.1386627, 1, 1, 1, 1, 1,
-0.4922266, -0.004335842, -0.8015241, 1, 1, 1, 1, 1,
-0.4907564, -0.9027225, -1.506272, 1, 1, 1, 1, 1,
-0.4896846, 0.07420444, -0.6223415, 1, 1, 1, 1, 1,
-0.4873758, -0.48644, -1.211173, 0, 0, 1, 1, 1,
-0.4868061, 0.4821769, 1.130224, 1, 0, 0, 1, 1,
-0.4854265, 0.9250292, -0.6912578, 1, 0, 0, 1, 1,
-0.4849063, 0.9904574, -0.4213068, 1, 0, 0, 1, 1,
-0.478363, -0.7243978, -0.9183079, 1, 0, 0, 1, 1,
-0.4763644, -1.077403, -3.395072, 1, 0, 0, 1, 1,
-0.4760384, 0.6510662, -0.4616583, 0, 0, 0, 1, 1,
-0.4757961, -1.430468, -3.346319, 0, 0, 0, 1, 1,
-0.4731788, 0.06522874, -2.417426, 0, 0, 0, 1, 1,
-0.4712576, 0.441237, 0.3472616, 0, 0, 0, 1, 1,
-0.4706856, -0.5469496, -2.405784, 0, 0, 0, 1, 1,
-0.4649765, -0.1840708, -2.400189, 0, 0, 0, 1, 1,
-0.4622512, -1.719859, -4.02665, 0, 0, 0, 1, 1,
-0.459066, 1.740695, -1.363896, 1, 1, 1, 1, 1,
-0.456491, -2.601415, -3.160311, 1, 1, 1, 1, 1,
-0.4552038, -0.1363585, -1.816389, 1, 1, 1, 1, 1,
-0.4467097, 0.7482797, -0.825698, 1, 1, 1, 1, 1,
-0.4452665, -1.31778, -0.8354143, 1, 1, 1, 1, 1,
-0.443656, 1.053689, 0.06332209, 1, 1, 1, 1, 1,
-0.4436274, 1.96659, -1.022213, 1, 1, 1, 1, 1,
-0.4418857, 0.1688883, -0.8503062, 1, 1, 1, 1, 1,
-0.4386819, 2.914442, -0.257383, 1, 1, 1, 1, 1,
-0.4322778, -0.1235884, -0.98339, 1, 1, 1, 1, 1,
-0.4309998, -0.3993887, -2.403559, 1, 1, 1, 1, 1,
-0.4263786, -0.9293781, -2.363459, 1, 1, 1, 1, 1,
-0.4238371, 0.6104232, 0.6224215, 1, 1, 1, 1, 1,
-0.4200261, -1.281129, -1.830488, 1, 1, 1, 1, 1,
-0.4139857, 0.2993515, -0.6151494, 1, 1, 1, 1, 1,
-0.409901, 0.03605112, -1.39828, 0, 0, 1, 1, 1,
-0.403264, -0.6719493, -1.900635, 1, 0, 0, 1, 1,
-0.4001826, -1.705354, -3.922504, 1, 0, 0, 1, 1,
-0.4000496, 0.02742683, -0.9613829, 1, 0, 0, 1, 1,
-0.3986615, 0.9577011, -0.7520662, 1, 0, 0, 1, 1,
-0.3961885, -2.247727, -2.835057, 1, 0, 0, 1, 1,
-0.3948343, 0.2157011, -0.002516028, 0, 0, 0, 1, 1,
-0.3929081, -0.5886509, -2.704899, 0, 0, 0, 1, 1,
-0.384298, -0.8816265, -1.593072, 0, 0, 0, 1, 1,
-0.3764911, 2.499818, -0.9821721, 0, 0, 0, 1, 1,
-0.3756939, -1.570435, -1.625372, 0, 0, 0, 1, 1,
-0.3739168, -0.6060982, -4.176822, 0, 0, 0, 1, 1,
-0.372552, 0.7370615, -0.2765372, 0, 0, 0, 1, 1,
-0.3695744, 0.2256269, -0.1336014, 1, 1, 1, 1, 1,
-0.3687698, -1.082315, -3.78111, 1, 1, 1, 1, 1,
-0.363512, 0.8697469, -0.160124, 1, 1, 1, 1, 1,
-0.3627795, 0.04137319, -1.642818, 1, 1, 1, 1, 1,
-0.3595255, -0.06259144, -4.299688, 1, 1, 1, 1, 1,
-0.3471888, 0.8290628, -0.9435169, 1, 1, 1, 1, 1,
-0.3434062, -0.02458826, -1.600309, 1, 1, 1, 1, 1,
-0.3428719, 0.7335477, 0.1148799, 1, 1, 1, 1, 1,
-0.34235, 0.418909, -1.975131, 1, 1, 1, 1, 1,
-0.3418505, -0.06205308, -1.802839, 1, 1, 1, 1, 1,
-0.3394073, -0.3799706, -2.193514, 1, 1, 1, 1, 1,
-0.3371318, -0.7339098, -2.244561, 1, 1, 1, 1, 1,
-0.3369918, 0.5265952, -2.94131, 1, 1, 1, 1, 1,
-0.3367864, 0.494205, 0.06625786, 1, 1, 1, 1, 1,
-0.3321614, 0.8767646, -1.319253, 1, 1, 1, 1, 1,
-0.3320153, 0.3571363, -1.02302, 0, 0, 1, 1, 1,
-0.3311502, 0.06720652, -0.8290833, 1, 0, 0, 1, 1,
-0.331073, 1.794479, 0.1987449, 1, 0, 0, 1, 1,
-0.3293962, 0.9800931, 0.1043536, 1, 0, 0, 1, 1,
-0.3288167, -1.170176, -2.575783, 1, 0, 0, 1, 1,
-0.3228554, -0.6763807, -3.016453, 1, 0, 0, 1, 1,
-0.3170956, 0.4621916, -4.077285, 0, 0, 0, 1, 1,
-0.3159828, 0.06263573, 0.6120529, 0, 0, 0, 1, 1,
-0.3138641, -0.8303646, -1.564254, 0, 0, 0, 1, 1,
-0.3121136, -0.3922651, -2.453453, 0, 0, 0, 1, 1,
-0.31122, -0.2275592, -2.039305, 0, 0, 0, 1, 1,
-0.3047989, 0.6552988, -0.874512, 0, 0, 0, 1, 1,
-0.3028189, -0.5649083, -3.034889, 0, 0, 0, 1, 1,
-0.2977377, -0.8824328, -3.764297, 1, 1, 1, 1, 1,
-0.2926681, 1.218419, -2.360461, 1, 1, 1, 1, 1,
-0.2903703, 0.9445078, -0.1353654, 1, 1, 1, 1, 1,
-0.289129, -0.7238112, -1.066536, 1, 1, 1, 1, 1,
-0.2888099, -0.3301366, -3.231115, 1, 1, 1, 1, 1,
-0.2880233, 0.5108746, -1.600426, 1, 1, 1, 1, 1,
-0.2834302, -0.1045593, -0.845431, 1, 1, 1, 1, 1,
-0.2819991, -0.287892, -0.7561594, 1, 1, 1, 1, 1,
-0.2782724, 0.770218, -2.105608, 1, 1, 1, 1, 1,
-0.2732376, -0.4040875, -1.909177, 1, 1, 1, 1, 1,
-0.2710457, 1.315089, -0.1105935, 1, 1, 1, 1, 1,
-0.2690977, -0.2163015, -1.221364, 1, 1, 1, 1, 1,
-0.2650472, 0.08808497, -1.874521, 1, 1, 1, 1, 1,
-0.262252, -0.272162, -2.546214, 1, 1, 1, 1, 1,
-0.2605878, 0.4593677, 0.01087911, 1, 1, 1, 1, 1,
-0.2598302, 0.4876013, -0.3858014, 0, 0, 1, 1, 1,
-0.2592019, 0.386344, -1.587653, 1, 0, 0, 1, 1,
-0.2559107, -0.8996383, -2.693727, 1, 0, 0, 1, 1,
-0.2554134, 0.4361066, -0.7182009, 1, 0, 0, 1, 1,
-0.2538283, -0.5081905, -1.998013, 1, 0, 0, 1, 1,
-0.2513576, 1.297925, 0.04062771, 1, 0, 0, 1, 1,
-0.2502319, -2.578548, -2.225225, 0, 0, 0, 1, 1,
-0.2496016, -0.2078653, -2.913031, 0, 0, 0, 1, 1,
-0.2489201, 2.277042, -1.66347, 0, 0, 0, 1, 1,
-0.2468476, -1.413199, -2.239586, 0, 0, 0, 1, 1,
-0.2458024, 1.140611, 0.8498657, 0, 0, 0, 1, 1,
-0.2455547, 0.4085917, -0.8832262, 0, 0, 0, 1, 1,
-0.2453235, -0.1168532, -1.36028, 0, 0, 0, 1, 1,
-0.2447782, -0.9138315, -3.499254, 1, 1, 1, 1, 1,
-0.2358707, 0.7963543, -1.75731, 1, 1, 1, 1, 1,
-0.2345147, 0.6465698, -0.2265518, 1, 1, 1, 1, 1,
-0.2324089, 0.2103663, -0.5355642, 1, 1, 1, 1, 1,
-0.2317158, 0.506905, 0.7061655, 1, 1, 1, 1, 1,
-0.2270876, 0.2859594, 0.3274681, 1, 1, 1, 1, 1,
-0.2232382, 0.2418821, -0.1053255, 1, 1, 1, 1, 1,
-0.2228043, -0.08130141, 0.2303514, 1, 1, 1, 1, 1,
-0.222703, -0.764162, -1.715037, 1, 1, 1, 1, 1,
-0.2209625, -0.9588935, -3.742522, 1, 1, 1, 1, 1,
-0.2195455, -0.3825924, -3.224909, 1, 1, 1, 1, 1,
-0.2151858, 0.8051347, -0.891884, 1, 1, 1, 1, 1,
-0.2103615, 0.6021039, -0.2300766, 1, 1, 1, 1, 1,
-0.2100876, -1.365625, -2.888038, 1, 1, 1, 1, 1,
-0.2079238, 0.8747575, -1.899185, 1, 1, 1, 1, 1,
-0.2064857, -0.5326024, -3.372996, 0, 0, 1, 1, 1,
-0.2064556, 1.695645, -1.522195, 1, 0, 0, 1, 1,
-0.2043878, 0.1288128, 0.1674804, 1, 0, 0, 1, 1,
-0.1976359, -0.2082207, -1.286019, 1, 0, 0, 1, 1,
-0.1867448, 1.413427, -0.2999919, 1, 0, 0, 1, 1,
-0.1838862, 0.4141057, 1.8795, 1, 0, 0, 1, 1,
-0.183849, 0.3583409, -0.7940219, 0, 0, 0, 1, 1,
-0.1822774, 1.078273, -0.7807533, 0, 0, 0, 1, 1,
-0.1817273, -1.552972, -1.10305, 0, 0, 0, 1, 1,
-0.1811879, -0.6575063, -3.74665, 0, 0, 0, 1, 1,
-0.1783267, -0.6451231, -1.934724, 0, 0, 0, 1, 1,
-0.1742609, 0.3335719, 0.4013468, 0, 0, 0, 1, 1,
-0.1737977, -1.314994, -2.900916, 0, 0, 0, 1, 1,
-0.1724451, 0.4290532, 0.02776038, 1, 1, 1, 1, 1,
-0.1721627, 0.4142725, 1.384722, 1, 1, 1, 1, 1,
-0.1665863, -1.819433, -3.2069, 1, 1, 1, 1, 1,
-0.1659642, -0.5285333, -0.8445618, 1, 1, 1, 1, 1,
-0.1619978, 1.28198, 1.503076, 1, 1, 1, 1, 1,
-0.1604466, 0.7589808, -0.1097139, 1, 1, 1, 1, 1,
-0.1583998, 0.4598478, -1.448219, 1, 1, 1, 1, 1,
-0.1577538, 1.507206, -1.704638, 1, 1, 1, 1, 1,
-0.1512151, -0.6679253, -3.133286, 1, 1, 1, 1, 1,
-0.1475225, 0.6579788, -0.9369615, 1, 1, 1, 1, 1,
-0.1435569, 0.06890466, -1.934631, 1, 1, 1, 1, 1,
-0.1425141, 1.225299, -0.1006423, 1, 1, 1, 1, 1,
-0.1419985, 0.4312551, -0.5496526, 1, 1, 1, 1, 1,
-0.1395682, 0.9772846, 0.660542, 1, 1, 1, 1, 1,
-0.1390859, -0.1825929, -1.43155, 1, 1, 1, 1, 1,
-0.1364307, 2.129243, 0.07511327, 0, 0, 1, 1, 1,
-0.1359062, -0.980833, -1.882364, 1, 0, 0, 1, 1,
-0.1325226, 1.148849, -0.7058694, 1, 0, 0, 1, 1,
-0.1281188, -2.10145, -2.747178, 1, 0, 0, 1, 1,
-0.1272855, 0.6589607, -0.8166255, 1, 0, 0, 1, 1,
-0.1263991, 0.6385029, -0.1219097, 1, 0, 0, 1, 1,
-0.1231377, 1.658286, 0.2635988, 0, 0, 0, 1, 1,
-0.1230786, -1.679912, -3.711543, 0, 0, 0, 1, 1,
-0.1209273, -0.4261771, -1.485233, 0, 0, 0, 1, 1,
-0.1093846, -1.293948, -2.580059, 0, 0, 0, 1, 1,
-0.1092405, -1.145138, -1.013612, 0, 0, 0, 1, 1,
-0.1002913, -1.151023, -3.365276, 0, 0, 0, 1, 1,
-0.1000962, -1.398811, -2.946761, 0, 0, 0, 1, 1,
-0.09925199, -0.222537, -1.629923, 1, 1, 1, 1, 1,
-0.0987206, 0.7272232, -0.6269224, 1, 1, 1, 1, 1,
-0.09440797, -0.2433739, -1.345591, 1, 1, 1, 1, 1,
-0.09215412, -0.3956308, -2.915408, 1, 1, 1, 1, 1,
-0.09072999, 0.6585233, 0.1102949, 1, 1, 1, 1, 1,
-0.08455548, 0.8262538, -0.119003, 1, 1, 1, 1, 1,
-0.08193643, -0.8343499, -3.038273, 1, 1, 1, 1, 1,
-0.07752858, 1.202545, -0.5753264, 1, 1, 1, 1, 1,
-0.07709373, -0.0936523, -2.178795, 1, 1, 1, 1, 1,
-0.07622661, -0.0920387, -2.916721, 1, 1, 1, 1, 1,
-0.07548805, -0.1545967, -2.392317, 1, 1, 1, 1, 1,
-0.07465352, 0.6874746, -0.3449147, 1, 1, 1, 1, 1,
-0.07235137, 0.3706471, 2.001726, 1, 1, 1, 1, 1,
-0.07092039, 1.381438, -1.401532, 1, 1, 1, 1, 1,
-0.06939599, 0.3808391, 0.7159884, 1, 1, 1, 1, 1,
-0.06879396, 1.551372, -0.03524209, 0, 0, 1, 1, 1,
-0.06851332, -0.002607812, -2.133061, 1, 0, 0, 1, 1,
-0.06652727, 0.9898435, -0.1053714, 1, 0, 0, 1, 1,
-0.06352174, 0.1072841, 0.7592491, 1, 0, 0, 1, 1,
-0.0629724, -0.178291, -3.061726, 1, 0, 0, 1, 1,
-0.06232539, -0.07132521, -1.512036, 1, 0, 0, 1, 1,
-0.05939184, -0.6909302, -3.510187, 0, 0, 0, 1, 1,
-0.05707563, -1.585304, -3.296549, 0, 0, 0, 1, 1,
-0.05642425, 1.193347, -0.6305011, 0, 0, 0, 1, 1,
-0.05485608, 2.244872, -0.4300494, 0, 0, 0, 1, 1,
-0.05431838, -1.415748, -2.972728, 0, 0, 0, 1, 1,
-0.05377833, 0.2289195, -0.8628314, 0, 0, 0, 1, 1,
-0.04886075, 1.829479, 0.3854699, 0, 0, 0, 1, 1,
-0.04014104, 0.9031792, -2.498676, 1, 1, 1, 1, 1,
-0.0400739, 0.1322641, 0.893482, 1, 1, 1, 1, 1,
-0.03885901, -2.795641, -3.398955, 1, 1, 1, 1, 1,
-0.03822543, 0.3287392, 0.2255393, 1, 1, 1, 1, 1,
-0.03466397, 0.8394651, -2.426332, 1, 1, 1, 1, 1,
-0.0313625, -0.7923704, -2.122797, 1, 1, 1, 1, 1,
-0.03112072, 1.123721, 0.2749924, 1, 1, 1, 1, 1,
-0.02733661, -0.02310266, -1.308453, 1, 1, 1, 1, 1,
-0.02621692, -0.9409959, -3.122249, 1, 1, 1, 1, 1,
-0.02406116, -0.4434893, -2.950558, 1, 1, 1, 1, 1,
-0.02124515, 2.422189, 1.340207, 1, 1, 1, 1, 1,
-0.0142771, -0.263932, -1.416983, 1, 1, 1, 1, 1,
-0.01420213, -0.1237482, -3.631825, 1, 1, 1, 1, 1,
-0.01252549, 1.247033, -0.3466592, 1, 1, 1, 1, 1,
-0.01244824, -0.261057, -3.031904, 1, 1, 1, 1, 1,
-0.008827505, -0.2788838, -3.264596, 0, 0, 1, 1, 1,
-0.004511338, 1.347874, -0.9722285, 1, 0, 0, 1, 1,
-0.003152295, -0.70904, -1.680991, 1, 0, 0, 1, 1,
0.005199542, -1.069771, 2.123039, 1, 0, 0, 1, 1,
0.009574099, 0.02570673, 1.24604, 1, 0, 0, 1, 1,
0.01143497, 1.933659, -1.251965, 1, 0, 0, 1, 1,
0.01506272, 0.05607521, 0.08577631, 0, 0, 0, 1, 1,
0.01793965, 0.191751, 0.1264994, 0, 0, 0, 1, 1,
0.01863884, -1.207783, 3.037934, 0, 0, 0, 1, 1,
0.02120532, -1.971456, 2.960428, 0, 0, 0, 1, 1,
0.02165742, -1.366856, 0.6766093, 0, 0, 0, 1, 1,
0.0227041, -0.05213885, 2.191464, 0, 0, 0, 1, 1,
0.02319887, 0.2491878, -0.3055193, 0, 0, 0, 1, 1,
0.02667602, -1.247849, 3.722466, 1, 1, 1, 1, 1,
0.02933249, 1.700714, -2.234957, 1, 1, 1, 1, 1,
0.02962955, -0.5481365, 1.536255, 1, 1, 1, 1, 1,
0.03108049, 0.1417851, 0.2629297, 1, 1, 1, 1, 1,
0.03480601, -0.8197274, 4.408551, 1, 1, 1, 1, 1,
0.03683498, 0.8167231, -0.8488913, 1, 1, 1, 1, 1,
0.04070613, -1.202824, 3.868973, 1, 1, 1, 1, 1,
0.04617478, 2.626425, -0.9229653, 1, 1, 1, 1, 1,
0.0476844, -0.06023899, 4.846488, 1, 1, 1, 1, 1,
0.04968845, 2.29204, -1.276038, 1, 1, 1, 1, 1,
0.05054792, -0.388096, 3.160778, 1, 1, 1, 1, 1,
0.05066606, 0.1312798, 0.9765795, 1, 1, 1, 1, 1,
0.05104858, -0.2490855, 0.534579, 1, 1, 1, 1, 1,
0.05290474, -1.345708, 3.903527, 1, 1, 1, 1, 1,
0.05950327, -0.8815702, 3.634044, 1, 1, 1, 1, 1,
0.06212882, 0.1832895, 1.393447, 0, 0, 1, 1, 1,
0.0657201, -0.5756372, 2.316941, 1, 0, 0, 1, 1,
0.06969927, 0.8909566, -0.4161073, 1, 0, 0, 1, 1,
0.07016779, 0.2111211, -0.5123293, 1, 0, 0, 1, 1,
0.07227229, 1.642882, 0.8412643, 1, 0, 0, 1, 1,
0.07411528, 0.8461289, 1.02033, 1, 0, 0, 1, 1,
0.07486779, 0.4246111, -0.9655292, 0, 0, 0, 1, 1,
0.08367711, 0.2742015, 1.057832, 0, 0, 0, 1, 1,
0.08503962, -1.073821, 2.494625, 0, 0, 0, 1, 1,
0.08610325, -1.245943, 3.908853, 0, 0, 0, 1, 1,
0.08769675, -0.5632924, 1.989595, 0, 0, 0, 1, 1,
0.08800009, 0.4686893, 0.8617285, 0, 0, 0, 1, 1,
0.08928992, 0.7263076, 1.33277, 0, 0, 0, 1, 1,
0.09215046, 0.4960418, 0.3147974, 1, 1, 1, 1, 1,
0.09505139, 0.8725756, 0.6252218, 1, 1, 1, 1, 1,
0.09892943, 1.786956, 1.928802, 1, 1, 1, 1, 1,
0.1016517, -1.29907, 3.633089, 1, 1, 1, 1, 1,
0.1051705, 0.1072819, -1.039, 1, 1, 1, 1, 1,
0.1068726, 1.270141, 0.55389, 1, 1, 1, 1, 1,
0.1093193, -0.1654854, 1.661955, 1, 1, 1, 1, 1,
0.1097056, -0.1559161, 2.974978, 1, 1, 1, 1, 1,
0.1153754, 0.9970024, -1.248991, 1, 1, 1, 1, 1,
0.11671, -2.027484, 0.5175284, 1, 1, 1, 1, 1,
0.1198115, -0.8649882, 2.522834, 1, 1, 1, 1, 1,
0.1220998, -0.6059257, 5.068043, 1, 1, 1, 1, 1,
0.1231716, 0.9508742, -0.3035067, 1, 1, 1, 1, 1,
0.1305805, -0.3540481, 2.447836, 1, 1, 1, 1, 1,
0.1332411, -0.3067098, 1.686789, 1, 1, 1, 1, 1,
0.1338793, -2.05407, 3.813773, 0, 0, 1, 1, 1,
0.1366827, -0.2368966, -0.3777545, 1, 0, 0, 1, 1,
0.1369965, -2.038821, 2.829661, 1, 0, 0, 1, 1,
0.1419268, -0.1172374, 1.663191, 1, 0, 0, 1, 1,
0.1429489, -0.2545205, 2.40475, 1, 0, 0, 1, 1,
0.1433332, 1.424338, -1.71193, 1, 0, 0, 1, 1,
0.1470977, -1.769027, 3.569997, 0, 0, 0, 1, 1,
0.1480069, 2.016979, 1.168709, 0, 0, 0, 1, 1,
0.1489541, 1.066504, -0.8009137, 0, 0, 0, 1, 1,
0.1536007, -0.3596729, 1.365409, 0, 0, 0, 1, 1,
0.1536614, 0.881753, 0.9306188, 0, 0, 0, 1, 1,
0.1592427, -0.1132732, 2.610022, 0, 0, 0, 1, 1,
0.1594237, -0.05881902, -0.4851814, 0, 0, 0, 1, 1,
0.1637179, -0.4225678, 2.951572, 1, 1, 1, 1, 1,
0.1646757, 0.960358, 0.5134498, 1, 1, 1, 1, 1,
0.1702524, -0.264838, 1.611417, 1, 1, 1, 1, 1,
0.1712399, -0.5896575, 1.071278, 1, 1, 1, 1, 1,
0.1715678, -0.5007116, 1.946174, 1, 1, 1, 1, 1,
0.172814, -0.3144031, 3.633349, 1, 1, 1, 1, 1,
0.1740426, 2.090905, 1.108556, 1, 1, 1, 1, 1,
0.174165, -0.1344527, 1.61353, 1, 1, 1, 1, 1,
0.1752794, -0.1496712, 2.838074, 1, 1, 1, 1, 1,
0.1794748, -0.3236783, 2.80433, 1, 1, 1, 1, 1,
0.1794857, -1.325782, 0.6533407, 1, 1, 1, 1, 1,
0.1847563, 0.01120155, 1.851526, 1, 1, 1, 1, 1,
0.1859397, -1.209383, 3.552767, 1, 1, 1, 1, 1,
0.1876708, -1.201284, 1.716832, 1, 1, 1, 1, 1,
0.1882073, 2.537773, 1.461263, 1, 1, 1, 1, 1,
0.1898099, -0.09002932, 2.919017, 0, 0, 1, 1, 1,
0.190371, -0.2364611, 1.614098, 1, 0, 0, 1, 1,
0.1954291, -0.235745, 2.215882, 1, 0, 0, 1, 1,
0.1973339, -0.4326934, 1.508629, 1, 0, 0, 1, 1,
0.1981584, -1.018538, 3.127998, 1, 0, 0, 1, 1,
0.1989995, -1.214364, 2.30915, 1, 0, 0, 1, 1,
0.1994768, 1.133333, 0.01421051, 0, 0, 0, 1, 1,
0.2019505, 0.4372482, 0.2320721, 0, 0, 0, 1, 1,
0.2019643, 0.7296118, 0.7293479, 0, 0, 0, 1, 1,
0.2034653, 1.649349, -1.591539, 0, 0, 0, 1, 1,
0.2035072, -1.015769, 3.173016, 0, 0, 0, 1, 1,
0.2093986, -0.4463165, 2.697063, 0, 0, 0, 1, 1,
0.2107825, -0.1635632, 2.823929, 0, 0, 0, 1, 1,
0.211445, 1.857802, 1.131333, 1, 1, 1, 1, 1,
0.211836, 0.9380096, 2.002405, 1, 1, 1, 1, 1,
0.2123035, -0.7350308, 4.209015, 1, 1, 1, 1, 1,
0.2129792, 1.682033, -0.2485593, 1, 1, 1, 1, 1,
0.2130115, 0.6618456, -1.494059, 1, 1, 1, 1, 1,
0.2157559, 0.6675166, 0.3170311, 1, 1, 1, 1, 1,
0.219494, 1.226672, 2.058439, 1, 1, 1, 1, 1,
0.2218157, -0.1105076, 1.661418, 1, 1, 1, 1, 1,
0.2222979, -0.315473, 3.662111, 1, 1, 1, 1, 1,
0.2274634, 0.967502, 0.2607821, 1, 1, 1, 1, 1,
0.2276795, 0.7213731, -0.4840788, 1, 1, 1, 1, 1,
0.2289214, 0.7563816, 1.07351, 1, 1, 1, 1, 1,
0.229854, 0.2575639, 0.9040642, 1, 1, 1, 1, 1,
0.2335212, 2.129707, -1.554891, 1, 1, 1, 1, 1,
0.2344507, 0.2054973, -0.07369976, 1, 1, 1, 1, 1,
0.2362843, -0.5696742, 3.32516, 0, 0, 1, 1, 1,
0.2396217, -1.414386, 4.171145, 1, 0, 0, 1, 1,
0.2401713, -0.1531236, 3.639019, 1, 0, 0, 1, 1,
0.2414478, 1.292592, -0.1575278, 1, 0, 0, 1, 1,
0.2427895, -0.7576708, 3.709367, 1, 0, 0, 1, 1,
0.244677, -0.3807032, 2.250971, 1, 0, 0, 1, 1,
0.247593, 0.673103, 0.4331516, 0, 0, 0, 1, 1,
0.2487056, 0.585658, -0.0873097, 0, 0, 0, 1, 1,
0.2490444, -0.8636632, 1.979801, 0, 0, 0, 1, 1,
0.2519746, 0.3201084, 0.7494334, 0, 0, 0, 1, 1,
0.2579765, -1.45984, 3.141148, 0, 0, 0, 1, 1,
0.2589158, 0.509875, 0.3859145, 0, 0, 0, 1, 1,
0.2592514, -0.8932384, 1.103293, 0, 0, 0, 1, 1,
0.2594229, 0.6919424, 1.054489, 1, 1, 1, 1, 1,
0.2598473, -1.385559, 3.760218, 1, 1, 1, 1, 1,
0.263872, -2.125816, 2.791884, 1, 1, 1, 1, 1,
0.2678005, 0.2889036, 0.5300429, 1, 1, 1, 1, 1,
0.2720292, 1.379645, 1.552664, 1, 1, 1, 1, 1,
0.2749405, -1.587904, 2.835574, 1, 1, 1, 1, 1,
0.2750175, 1.391429, 1.320575, 1, 1, 1, 1, 1,
0.2780356, -0.2046371, 1.738326, 1, 1, 1, 1, 1,
0.282678, 0.8479982, 0.0964588, 1, 1, 1, 1, 1,
0.2827574, 0.2455066, 0.1836998, 1, 1, 1, 1, 1,
0.2828387, -0.2435286, 3.223793, 1, 1, 1, 1, 1,
0.2836376, -0.3826657, 0.7235822, 1, 1, 1, 1, 1,
0.2837299, -0.4094615, 2.234454, 1, 1, 1, 1, 1,
0.2840837, 0.7690635, -0.270262, 1, 1, 1, 1, 1,
0.2898809, -1.598991, 3.245965, 1, 1, 1, 1, 1,
0.2925079, -0.5235839, 2.385572, 0, 0, 1, 1, 1,
0.2961585, -0.6352466, 2.396993, 1, 0, 0, 1, 1,
0.3000429, 0.0106886, 0.4709854, 1, 0, 0, 1, 1,
0.3045448, -0.234306, 2.66186, 1, 0, 0, 1, 1,
0.3076253, -0.4350209, 2.747174, 1, 0, 0, 1, 1,
0.3095937, 0.03525982, 0.4756625, 1, 0, 0, 1, 1,
0.3129659, -0.6645682, 2.377255, 0, 0, 0, 1, 1,
0.3150425, 3.383548, 0.5369797, 0, 0, 0, 1, 1,
0.3171446, 1.02941, -0.02453765, 0, 0, 0, 1, 1,
0.3180922, -0.06251638, -0.2018086, 0, 0, 0, 1, 1,
0.3248571, 1.131493, 2.139473, 0, 0, 0, 1, 1,
0.3314052, -0.4282057, 3.351624, 0, 0, 0, 1, 1,
0.3320366, 0.01720024, 1.72674, 0, 0, 0, 1, 1,
0.3330632, -1.18095, 3.357704, 1, 1, 1, 1, 1,
0.3387302, -0.7752188, 3.648062, 1, 1, 1, 1, 1,
0.3387932, -2.344454, 4.087452, 1, 1, 1, 1, 1,
0.3415523, -0.3286704, 4.69878, 1, 1, 1, 1, 1,
0.3421079, 0.4506978, 1.52531, 1, 1, 1, 1, 1,
0.34282, -0.8967561, 3.778937, 1, 1, 1, 1, 1,
0.3474722, 1.242352, -0.1684199, 1, 1, 1, 1, 1,
0.3538787, 0.6288337, 1.610799, 1, 1, 1, 1, 1,
0.3545004, 2.322576, 1.755192, 1, 1, 1, 1, 1,
0.3550234, -0.4133349, -0.4193096, 1, 1, 1, 1, 1,
0.35973, 0.7039587, -0.2416276, 1, 1, 1, 1, 1,
0.3600296, -0.165588, 0.9168509, 1, 1, 1, 1, 1,
0.3625844, 0.590947, -0.07459677, 1, 1, 1, 1, 1,
0.3644524, -0.3603885, 2.38583, 1, 1, 1, 1, 1,
0.3657053, -0.2217622, 1.42922, 1, 1, 1, 1, 1,
0.3710842, -0.9653691, 2.489017, 0, 0, 1, 1, 1,
0.3729076, 0.7385618, 1.58372, 1, 0, 0, 1, 1,
0.3786374, 1.674501, 0.8261557, 1, 0, 0, 1, 1,
0.3795577, -0.9478422, 3.472163, 1, 0, 0, 1, 1,
0.3798716, 0.7012292, 1.663427, 1, 0, 0, 1, 1,
0.3826925, -0.7485264, 4.29716, 1, 0, 0, 1, 1,
0.3841904, -0.3295887, 4.063952, 0, 0, 0, 1, 1,
0.384959, -0.6821674, 3.028401, 0, 0, 0, 1, 1,
0.3864147, 0.683845, 0.0354324, 0, 0, 0, 1, 1,
0.389106, -1.117029, 2.629837, 0, 0, 0, 1, 1,
0.3910002, -0.892476, 3.144028, 0, 0, 0, 1, 1,
0.3916308, 1.414223, 1.199113, 0, 0, 0, 1, 1,
0.3928334, 0.1536898, 3.601906, 0, 0, 0, 1, 1,
0.3965411, -0.1676182, 1.799524, 1, 1, 1, 1, 1,
0.3972137, -0.164268, 3.194964, 1, 1, 1, 1, 1,
0.4042741, -0.05873137, 0.6583995, 1, 1, 1, 1, 1,
0.4080163, -0.1178941, 4.450634, 1, 1, 1, 1, 1,
0.4151622, -1.19822, 3.720339, 1, 1, 1, 1, 1,
0.4173144, -0.5986019, -0.2029334, 1, 1, 1, 1, 1,
0.4192899, -0.5305538, 3.874462, 1, 1, 1, 1, 1,
0.4196055, -0.9913139, 0.8806384, 1, 1, 1, 1, 1,
0.4201947, 0.4044068, -1.278484, 1, 1, 1, 1, 1,
0.4234764, 0.715993, 2.492763, 1, 1, 1, 1, 1,
0.4244078, 0.1591117, 2.333088, 1, 1, 1, 1, 1,
0.4271212, 0.7530748, 0.7663358, 1, 1, 1, 1, 1,
0.4287368, -1.272276, 3.118283, 1, 1, 1, 1, 1,
0.4294086, 0.4911474, 0.9094412, 1, 1, 1, 1, 1,
0.4406385, -0.1759276, 2.206642, 1, 1, 1, 1, 1,
0.4586632, -0.6297719, 1.171401, 0, 0, 1, 1, 1,
0.4589252, 0.04032004, 2.153607, 1, 0, 0, 1, 1,
0.4593385, 0.6610538, 0.5811009, 1, 0, 0, 1, 1,
0.4647216, 1.352586, 1.508389, 1, 0, 0, 1, 1,
0.4658462, -0.5156213, 1.82712, 1, 0, 0, 1, 1,
0.4707228, -0.49748, 3.141623, 1, 0, 0, 1, 1,
0.479933, 1.205737, 1.287939, 0, 0, 0, 1, 1,
0.4864583, 0.5444437, -0.1618996, 0, 0, 0, 1, 1,
0.4871752, -1.027572, 3.249219, 0, 0, 0, 1, 1,
0.4979191, -1.142625, 2.693714, 0, 0, 0, 1, 1,
0.5064549, 0.5440502, 1.170293, 0, 0, 0, 1, 1,
0.5066748, 0.04433198, 1.186333, 0, 0, 0, 1, 1,
0.511517, 0.4596787, 2.222693, 0, 0, 0, 1, 1,
0.5131238, 0.5518675, 0.2036898, 1, 1, 1, 1, 1,
0.513305, -0.2962232, 3.458434, 1, 1, 1, 1, 1,
0.5158432, 0.9798802, 2.209374, 1, 1, 1, 1, 1,
0.5235305, -0.9194658, 4.341904, 1, 1, 1, 1, 1,
0.5256225, -0.4946891, 1.174728, 1, 1, 1, 1, 1,
0.5256503, 1.697804, -1.360854, 1, 1, 1, 1, 1,
0.5257344, 1.111032, 0.09034306, 1, 1, 1, 1, 1,
0.5291907, 0.6527032, 0.4381066, 1, 1, 1, 1, 1,
0.5333422, 1.846756, -2.044701, 1, 1, 1, 1, 1,
0.5347189, 0.3650967, -0.5395305, 1, 1, 1, 1, 1,
0.5354656, 0.6603134, 1.370273, 1, 1, 1, 1, 1,
0.5385377, -1.675572, 1.771705, 1, 1, 1, 1, 1,
0.5395355, 0.2768386, 1.038004, 1, 1, 1, 1, 1,
0.5546849, -2.224097, 3.30032, 1, 1, 1, 1, 1,
0.5579764, 1.257176, -0.5220344, 1, 1, 1, 1, 1,
0.5603853, -0.644872, 1.623021, 0, 0, 1, 1, 1,
0.5665815, -2.257662, 3.86532, 1, 0, 0, 1, 1,
0.5674688, -0.5600982, 0.6095781, 1, 0, 0, 1, 1,
0.5744731, 0.1585716, 1.744084, 1, 0, 0, 1, 1,
0.5755542, -1.969128, 2.883752, 1, 0, 0, 1, 1,
0.5790151, -0.3911603, 2.7198, 1, 0, 0, 1, 1,
0.5817993, -0.4905611, 1.903257, 0, 0, 0, 1, 1,
0.5825298, 1.073722, 0.08132286, 0, 0, 0, 1, 1,
0.5835702, 0.9645304, -0.916764, 0, 0, 0, 1, 1,
0.5865544, -0.006674302, 2.640963, 0, 0, 0, 1, 1,
0.5867057, 0.5159673, -0.009453224, 0, 0, 0, 1, 1,
0.587752, -1.541279, 0.4384744, 0, 0, 0, 1, 1,
0.5966718, 0.8812694, -0.7367443, 0, 0, 0, 1, 1,
0.5998577, -1.026025, 2.4129, 1, 1, 1, 1, 1,
0.603457, -1.420037, 3.002431, 1, 1, 1, 1, 1,
0.6040497, 1.822167, -0.5484573, 1, 1, 1, 1, 1,
0.6064323, -0.3509019, 2.952326, 1, 1, 1, 1, 1,
0.6167938, 1.122957, -0.7250545, 1, 1, 1, 1, 1,
0.6234627, 0.1793391, 1.915986, 1, 1, 1, 1, 1,
0.6265163, 1.192423, 0.8332491, 1, 1, 1, 1, 1,
0.6302611, 0.5640498, -0.4628461, 1, 1, 1, 1, 1,
0.6309172, 0.2971112, 1.886023, 1, 1, 1, 1, 1,
0.6331035, -1.612435, 2.422786, 1, 1, 1, 1, 1,
0.6373679, -1.406785, 1.610546, 1, 1, 1, 1, 1,
0.6438139, -2.64411, 2.756248, 1, 1, 1, 1, 1,
0.6445721, 0.7643171, 1.677554, 1, 1, 1, 1, 1,
0.6481061, 0.8421291, -2.125641, 1, 1, 1, 1, 1,
0.6496472, -0.1754669, 1.63195, 1, 1, 1, 1, 1,
0.6499807, 1.119827, 0.336978, 0, 0, 1, 1, 1,
0.6517426, 0.5759504, 1.265708, 1, 0, 0, 1, 1,
0.6565536, -1.052341, 2.457897, 1, 0, 0, 1, 1,
0.6584356, -0.2569681, -0.6994302, 1, 0, 0, 1, 1,
0.6625715, 0.2609894, -0.1733887, 1, 0, 0, 1, 1,
0.6699725, -0.5740282, 2.807071, 1, 0, 0, 1, 1,
0.6700552, 0.618028, -0.4905444, 0, 0, 0, 1, 1,
0.6724294, 1.126406, 1.085867, 0, 0, 0, 1, 1,
0.6791341, 0.6142736, 0.2351302, 0, 0, 0, 1, 1,
0.6833462, -1.091265, 0.6509655, 0, 0, 0, 1, 1,
0.6842347, -0.08239745, 0.4699406, 0, 0, 0, 1, 1,
0.6863117, -0.531935, 2.380034, 0, 0, 0, 1, 1,
0.6882123, -1.416873, 1.792406, 0, 0, 0, 1, 1,
0.6892481, 1.06992, 2.061402, 1, 1, 1, 1, 1,
0.6901614, -1.108166, 2.701025, 1, 1, 1, 1, 1,
0.6901879, -1.744657, 1.299047, 1, 1, 1, 1, 1,
0.6947673, -0.02416204, 1.178401, 1, 1, 1, 1, 1,
0.6963467, -0.536806, 1.700774, 1, 1, 1, 1, 1,
0.6966884, -0.2820833, 3.107347, 1, 1, 1, 1, 1,
0.7018882, 0.3832178, -0.2811582, 1, 1, 1, 1, 1,
0.703895, -0.2797595, 1.994874, 1, 1, 1, 1, 1,
0.7076611, 0.5187202, 0.5005202, 1, 1, 1, 1, 1,
0.7141265, 0.111876, 1.713885, 1, 1, 1, 1, 1,
0.7182235, 0.2827404, 1.226866, 1, 1, 1, 1, 1,
0.7185141, -0.3123358, 1.858435, 1, 1, 1, 1, 1,
0.7188928, 0.7926701, 0.606259, 1, 1, 1, 1, 1,
0.7202299, -0.9108661, 2.756168, 1, 1, 1, 1, 1,
0.7208369, -1.71018, 1.061438, 1, 1, 1, 1, 1,
0.7230004, 0.194828, 1.294224, 0, 0, 1, 1, 1,
0.7230516, -1.041734, 1.858225, 1, 0, 0, 1, 1,
0.7235504, -0.1601292, 2.004695, 1, 0, 0, 1, 1,
0.7242582, 0.01712931, 2.274291, 1, 0, 0, 1, 1,
0.72448, -0.7710814, 3.994255, 1, 0, 0, 1, 1,
0.736896, -1.310921, 2.452513, 1, 0, 0, 1, 1,
0.7374763, -0.3055464, 3.139239, 0, 0, 0, 1, 1,
0.7392592, 0.6562383, 2.46597, 0, 0, 0, 1, 1,
0.7414914, -0.4166665, 2.202034, 0, 0, 0, 1, 1,
0.7436336, -0.5063793, 2.603105, 0, 0, 0, 1, 1,
0.7445948, 0.1866435, 0.1466566, 0, 0, 0, 1, 1,
0.7470933, -0.7220725, 3.396541, 0, 0, 0, 1, 1,
0.750793, -0.4458122, 2.842033, 0, 0, 0, 1, 1,
0.751668, -1.550261, 1.364331, 1, 1, 1, 1, 1,
0.7534772, -0.3537863, 2.480168, 1, 1, 1, 1, 1,
0.7537164, 0.5085058, -0.2520494, 1, 1, 1, 1, 1,
0.7545469, -0.6783043, 2.91436, 1, 1, 1, 1, 1,
0.7577974, -1.098036, 2.2373, 1, 1, 1, 1, 1,
0.758384, -0.4720078, 2.540704, 1, 1, 1, 1, 1,
0.7664675, 1.380442, 0.4261057, 1, 1, 1, 1, 1,
0.7840754, 1.31346, -2.153532, 1, 1, 1, 1, 1,
0.7974449, 0.07191155, 1.679032, 1, 1, 1, 1, 1,
0.7983147, -0.3833514, 0.742777, 1, 1, 1, 1, 1,
0.800848, 0.7996867, 1.394962, 1, 1, 1, 1, 1,
0.8036417, 0.2246833, 1.097369, 1, 1, 1, 1, 1,
0.8073787, 0.06190571, 1.806118, 1, 1, 1, 1, 1,
0.8075604, 0.8231127, 1.664879, 1, 1, 1, 1, 1,
0.8108816, -0.2833083, 2.095874, 1, 1, 1, 1, 1,
0.8117464, -1.293396, 1.783948, 0, 0, 1, 1, 1,
0.8148567, 0.3914469, 2.700673, 1, 0, 0, 1, 1,
0.8148683, 0.9518974, 0.9723008, 1, 0, 0, 1, 1,
0.8156002, 0.906294, 1.046408, 1, 0, 0, 1, 1,
0.8161196, -0.3209568, 1.748138, 1, 0, 0, 1, 1,
0.8168025, -0.4490202, -0.1002376, 1, 0, 0, 1, 1,
0.8196666, -0.3599934, -0.2714586, 0, 0, 0, 1, 1,
0.8436142, -1.755817, 2.663829, 0, 0, 0, 1, 1,
0.8478759, 0.6279476, 0.8452274, 0, 0, 0, 1, 1,
0.8497388, 1.076757, 1.048882, 0, 0, 0, 1, 1,
0.8503162, -0.1935315, 2.172836, 0, 0, 0, 1, 1,
0.8595158, 1.012624, -1.150985, 0, 0, 0, 1, 1,
0.8648275, -0.6365067, 2.348297, 0, 0, 0, 1, 1,
0.8674421, -0.179101, 2.094168, 1, 1, 1, 1, 1,
0.8726969, 0.4636225, 3.317169, 1, 1, 1, 1, 1,
0.8740488, 0.07032553, 2.576257, 1, 1, 1, 1, 1,
0.8798224, -0.3130927, 1.489177, 1, 1, 1, 1, 1,
0.8875434, 2.149466, 1.23693, 1, 1, 1, 1, 1,
0.8953401, -1.651023, 1.745319, 1, 1, 1, 1, 1,
0.8998606, -0.04879419, 2.255742, 1, 1, 1, 1, 1,
0.9009667, -1.250531, 2.752786, 1, 1, 1, 1, 1,
0.9027756, 0.382625, 0.5507819, 1, 1, 1, 1, 1,
0.9041834, -1.69162, 1.962866, 1, 1, 1, 1, 1,
0.9069405, -0.5644413, 3.366998, 1, 1, 1, 1, 1,
0.9075709, -1.076713, 3.672517, 1, 1, 1, 1, 1,
0.913751, -0.1620231, 2.35463, 1, 1, 1, 1, 1,
0.9141454, 0.1838453, 0.8509905, 1, 1, 1, 1, 1,
0.9156732, 1.052436, -0.2700806, 1, 1, 1, 1, 1,
0.9218953, 0.2616189, 2.086157, 0, 0, 1, 1, 1,
0.9241651, 0.4441877, 0.3147857, 1, 0, 0, 1, 1,
0.9275112, 1.224794, 0.5105828, 1, 0, 0, 1, 1,
0.9329801, 0.1164428, 2.391907, 1, 0, 0, 1, 1,
0.9331202, 0.5913479, 2.351136, 1, 0, 0, 1, 1,
0.9348454, -1.158197, 4.289978, 1, 0, 0, 1, 1,
0.9353282, 0.1016713, 2.348497, 0, 0, 0, 1, 1,
0.9360659, 0.1627808, 1.109464, 0, 0, 0, 1, 1,
0.9372054, -1.084855, 3.787362, 0, 0, 0, 1, 1,
0.9393001, -1.962938, 4.308311, 0, 0, 0, 1, 1,
0.9490358, 0.2398816, 1.349924, 0, 0, 0, 1, 1,
0.9541158, 0.4312746, 0.08844515, 0, 0, 0, 1, 1,
0.9558764, 1.298147, 1.390424, 0, 0, 0, 1, 1,
0.9588151, 1.532146, 0.6285602, 1, 1, 1, 1, 1,
0.9641528, 0.7181334, -0.8690203, 1, 1, 1, 1, 1,
0.9693275, 2.196529, 1.665585, 1, 1, 1, 1, 1,
0.9731648, 1.384425, 0.3990971, 1, 1, 1, 1, 1,
0.9789825, -1.025274, 1.087408, 1, 1, 1, 1, 1,
0.9809749, -0.7792843, 2.398937, 1, 1, 1, 1, 1,
0.9818481, -0.6026151, 2.788989, 1, 1, 1, 1, 1,
0.9830614, -0.6800001, 2.56154, 1, 1, 1, 1, 1,
0.9861619, 1.405144, 1.66181, 1, 1, 1, 1, 1,
0.9895031, -0.6747718, 2.680648, 1, 1, 1, 1, 1,
0.9978289, -0.4613901, 4.632957, 1, 1, 1, 1, 1,
1.000514, -1.31568, 1.789617, 1, 1, 1, 1, 1,
1.002645, 0.4871934, 1.205965, 1, 1, 1, 1, 1,
1.004713, -1.285242, 2.923299, 1, 1, 1, 1, 1,
1.005741, 1.02001, 1.194472, 1, 1, 1, 1, 1,
1.007687, -0.0108289, 1.562971, 0, 0, 1, 1, 1,
1.007688, -1.258035, 3.711895, 1, 0, 0, 1, 1,
1.010754, 0.915938, 2.046832, 1, 0, 0, 1, 1,
1.011831, 0.5530591, 1.395251, 1, 0, 0, 1, 1,
1.012883, 1.989965, -0.2547548, 1, 0, 0, 1, 1,
1.02011, 1.241212, 0.9263792, 1, 0, 0, 1, 1,
1.022166, -0.2001731, 1.083185, 0, 0, 0, 1, 1,
1.029453, -1.197295, 0.8683038, 0, 0, 0, 1, 1,
1.030256, -0.5299015, 1.560054, 0, 0, 0, 1, 1,
1.032916, 3.279086, 0.4699778, 0, 0, 0, 1, 1,
1.036578, 0.2844106, 1.166455, 0, 0, 0, 1, 1,
1.038319, -0.4296588, 1.019275, 0, 0, 0, 1, 1,
1.041181, 2.03544, 0.5278157, 0, 0, 0, 1, 1,
1.052728, 0.6679281, 0.5336084, 1, 1, 1, 1, 1,
1.05514, 0.2775792, 2.834256, 1, 1, 1, 1, 1,
1.062003, -1.758762, 3.435153, 1, 1, 1, 1, 1,
1.064145, -1.945469, 2.791916, 1, 1, 1, 1, 1,
1.078659, 0.798472, -0.09367565, 1, 1, 1, 1, 1,
1.078871, 0.6061939, 0.3403425, 1, 1, 1, 1, 1,
1.096231, 0.05983706, 1.585036, 1, 1, 1, 1, 1,
1.101205, -0.07419267, 1.711852, 1, 1, 1, 1, 1,
1.10456, 0.1266697, 2.952446, 1, 1, 1, 1, 1,
1.104907, -0.08026743, 1.910474, 1, 1, 1, 1, 1,
1.10881, 0.6677558, 1.951975, 1, 1, 1, 1, 1,
1.110041, 0.4430985, 0.8010176, 1, 1, 1, 1, 1,
1.116124, 1.137345, 0.9912167, 1, 1, 1, 1, 1,
1.119855, 1.238532, -0.1049134, 1, 1, 1, 1, 1,
1.120556, 0.6565926, 0.850961, 1, 1, 1, 1, 1,
1.121909, 0.09966376, 2.272823, 0, 0, 1, 1, 1,
1.123649, -0.2813024, 0.8432616, 1, 0, 0, 1, 1,
1.130098, -0.03817433, 0.9074557, 1, 0, 0, 1, 1,
1.130935, -1.209979, 2.015815, 1, 0, 0, 1, 1,
1.134734, 0.4206722, 2.409478, 1, 0, 0, 1, 1,
1.146704, -0.05251149, -0.3784519, 1, 0, 0, 1, 1,
1.150617, 0.1083022, -0.8084331, 0, 0, 0, 1, 1,
1.152841, 0.8976387, 0.634738, 0, 0, 0, 1, 1,
1.154455, -1.280105, 3.287781, 0, 0, 0, 1, 1,
1.158514, 1.013383, 0.4018124, 0, 0, 0, 1, 1,
1.160422, 0.272626, 1.66891, 0, 0, 0, 1, 1,
1.169524, 0.7819068, 0.325419, 0, 0, 0, 1, 1,
1.171274, 1.12307, 1.664387, 0, 0, 0, 1, 1,
1.173805, -0.0829796, 1.867922, 1, 1, 1, 1, 1,
1.181444, 1.697029, 0.2195014, 1, 1, 1, 1, 1,
1.195774, -0.1684867, 1.89272, 1, 1, 1, 1, 1,
1.197533, 0.4615205, 0.360926, 1, 1, 1, 1, 1,
1.203806, 0.678149, 1.511431, 1, 1, 1, 1, 1,
1.203984, 0.7454048, 0.819347, 1, 1, 1, 1, 1,
1.204524, -1.074589, 3.180113, 1, 1, 1, 1, 1,
1.211195, -0.5422058, 3.008492, 1, 1, 1, 1, 1,
1.213975, 0.7619857, 1.11692, 1, 1, 1, 1, 1,
1.225129, -1.341926, 3.826326, 1, 1, 1, 1, 1,
1.232272, 0.7623742, 0.2554546, 1, 1, 1, 1, 1,
1.235809, 0.4895705, 1.077816, 1, 1, 1, 1, 1,
1.236285, 0.0459235, 1.709244, 1, 1, 1, 1, 1,
1.236392, 1.945771, 0.9603679, 1, 1, 1, 1, 1,
1.239082, -1.012766, 1.85074, 1, 1, 1, 1, 1,
1.245178, -0.5555346, 1.910255, 0, 0, 1, 1, 1,
1.252274, -1.155825, 3.526785, 1, 0, 0, 1, 1,
1.252964, 0.5654158, 1.308673, 1, 0, 0, 1, 1,
1.259723, -0.943827, 1.818677, 1, 0, 0, 1, 1,
1.262739, 1.168118, 2.438195, 1, 0, 0, 1, 1,
1.263311, -0.6603274, 2.490329, 1, 0, 0, 1, 1,
1.266372, -1.661341, 4.123359, 0, 0, 0, 1, 1,
1.272536, 0.8600609, 0.7349431, 0, 0, 0, 1, 1,
1.273823, -0.7953767, 2.894585, 0, 0, 0, 1, 1,
1.27443, 0.5702395, 0.6135293, 0, 0, 0, 1, 1,
1.288077, 1.435865, 0.9575931, 0, 0, 0, 1, 1,
1.313291, -0.03530247, 1.458246, 0, 0, 0, 1, 1,
1.333564, 0.6298087, -0.03040806, 0, 0, 0, 1, 1,
1.334183, -0.6004483, 2.778215, 1, 1, 1, 1, 1,
1.33463, 1.289738, -0.1745101, 1, 1, 1, 1, 1,
1.334657, -0.290162, 1.238926, 1, 1, 1, 1, 1,
1.351704, -0.131643, 3.264061, 1, 1, 1, 1, 1,
1.355491, -0.0853838, 1.173067, 1, 1, 1, 1, 1,
1.356448, -0.4329817, 4.004202, 1, 1, 1, 1, 1,
1.375256, 0.8824034, -0.2030881, 1, 1, 1, 1, 1,
1.377992, -0.8818069, 1.551979, 1, 1, 1, 1, 1,
1.381632, -0.4801255, 1.44289, 1, 1, 1, 1, 1,
1.387535, -1.026153, 0.7521874, 1, 1, 1, 1, 1,
1.388748, 0.6184064, 0.6834438, 1, 1, 1, 1, 1,
1.404512, -0.8733564, 2.469086, 1, 1, 1, 1, 1,
1.405893, 0.6581451, 0.7271087, 1, 1, 1, 1, 1,
1.418231, 0.4981146, 0.7113193, 1, 1, 1, 1, 1,
1.423377, -1.198858, 1.425059, 1, 1, 1, 1, 1,
1.424556, -0.6497065, 2.416894, 0, 0, 1, 1, 1,
1.433895, 0.8761762, 1.87331, 1, 0, 0, 1, 1,
1.435121, -0.8723053, 1.822601, 1, 0, 0, 1, 1,
1.440876, 0.4993235, 0.3768156, 1, 0, 0, 1, 1,
1.447562, 0.6184927, 1.123664, 1, 0, 0, 1, 1,
1.460721, 0.1730807, 2.512784, 1, 0, 0, 1, 1,
1.473702, 1.551545, 2.563477, 0, 0, 0, 1, 1,
1.478661, 0.1273927, 1.398914, 0, 0, 0, 1, 1,
1.480354, 0.03049199, 1.022001, 0, 0, 0, 1, 1,
1.481237, 0.6361361, 1.588863, 0, 0, 0, 1, 1,
1.495203, 0.4645988, 2.491822, 0, 0, 0, 1, 1,
1.497621, 0.2609313, 1.573757, 0, 0, 0, 1, 1,
1.499476, 0.7683474, 1.15598, 0, 0, 0, 1, 1,
1.50248, -0.7680883, 1.106217, 1, 1, 1, 1, 1,
1.505919, 0.5178966, 2.442429, 1, 1, 1, 1, 1,
1.507416, 0.2984682, -0.7758322, 1, 1, 1, 1, 1,
1.513498, 1.173668, 1.06278, 1, 1, 1, 1, 1,
1.520556, -0.2799553, 2.241888, 1, 1, 1, 1, 1,
1.539579, -0.1218291, 2.20517, 1, 1, 1, 1, 1,
1.546066, 0.0811943, 2.648205, 1, 1, 1, 1, 1,
1.565488, -1.379037, 2.775757, 1, 1, 1, 1, 1,
1.569332, 0.4883542, -0.6438241, 1, 1, 1, 1, 1,
1.569336, -0.2649042, 0.4169135, 1, 1, 1, 1, 1,
1.570151, -0.7531753, 3.0176, 1, 1, 1, 1, 1,
1.57336, -0.3604497, -0.1485588, 1, 1, 1, 1, 1,
1.586205, -2.30242, 3.393037, 1, 1, 1, 1, 1,
1.619572, -1.770819, 2.200949, 1, 1, 1, 1, 1,
1.624263, 0.1394476, 0.6571687, 1, 1, 1, 1, 1,
1.638506, -0.9399061, 1.387807, 0, 0, 1, 1, 1,
1.657092, -1.860664, 2.732179, 1, 0, 0, 1, 1,
1.659119, 0.09579585, 1.886374, 1, 0, 0, 1, 1,
1.669464, 0.0476405, 3.091231, 1, 0, 0, 1, 1,
1.669741, -0.2738694, 1.035925, 1, 0, 0, 1, 1,
1.688646, 2.962032, 0.2260504, 1, 0, 0, 1, 1,
1.692681, 0.7657077, 2.043961, 0, 0, 0, 1, 1,
1.717821, 0.9917977, 2.45189, 0, 0, 0, 1, 1,
1.728627, -0.3069311, 1.730712, 0, 0, 0, 1, 1,
1.731766, 0.456015, 0.5318784, 0, 0, 0, 1, 1,
1.760945, 1.918625, 2.443935, 0, 0, 0, 1, 1,
1.76418, -0.9736984, 2.581977, 0, 0, 0, 1, 1,
1.786145, -0.831524, 1.128274, 0, 0, 0, 1, 1,
1.812754, 0.8509808, -0.1936565, 1, 1, 1, 1, 1,
1.85388, -0.4255221, 0.9433874, 1, 1, 1, 1, 1,
1.864962, -0.7400847, 2.432314, 1, 1, 1, 1, 1,
1.877533, 0.9020231, 1.276803, 1, 1, 1, 1, 1,
1.891739, -1.173203, 0.7941527, 1, 1, 1, 1, 1,
1.925979, -2.130251, 0.9489701, 1, 1, 1, 1, 1,
1.934126, 0.06097814, 1.816952, 1, 1, 1, 1, 1,
1.936268, -1.052307, 1.651082, 1, 1, 1, 1, 1,
1.947515, -0.7042537, 1.892523, 1, 1, 1, 1, 1,
1.983813, 1.154356, 1.486289, 1, 1, 1, 1, 1,
1.984571, -1.590296, 3.54003, 1, 1, 1, 1, 1,
2.01028, -0.5602594, 1.327994, 1, 1, 1, 1, 1,
2.011567, -0.5293047, 2.816707, 1, 1, 1, 1, 1,
2.020606, 0.524729, 1.566171, 1, 1, 1, 1, 1,
2.03878, 2.095091, 1.594409, 1, 1, 1, 1, 1,
2.040189, -0.1851077, 2.146425, 0, 0, 1, 1, 1,
2.041174, -0.1511798, 0.6748149, 1, 0, 0, 1, 1,
2.070398, -1.025833, 1.356609, 1, 0, 0, 1, 1,
2.070962, -1.721836, 2.960525, 1, 0, 0, 1, 1,
2.080128, 0.7051581, 1.914864, 1, 0, 0, 1, 1,
2.105155, 0.9270274, -0.162679, 1, 0, 0, 1, 1,
2.119911, 0.593138, -0.1967085, 0, 0, 0, 1, 1,
2.141301, -1.31645, 4.23847, 0, 0, 0, 1, 1,
2.429997, -0.1886937, 1.923395, 0, 0, 0, 1, 1,
2.472067, -1.459486, 3.512309, 0, 0, 0, 1, 1,
2.536498, 0.01999412, 1.148108, 0, 0, 0, 1, 1,
2.576813, -0.8013098, 1.930814, 0, 0, 0, 1, 1,
2.63005, -0.05666782, 0.5380474, 0, 0, 0, 1, 1,
2.67037, -0.4509131, 1.680762, 1, 1, 1, 1, 1,
2.717932, -0.6880586, 1.300752, 1, 1, 1, 1, 1,
2.84802, -0.009206702, 2.193013, 1, 1, 1, 1, 1,
2.84917, -0.3160544, 4.192961, 1, 1, 1, 1, 1,
2.906574, 1.07738, -1.388146, 1, 1, 1, 1, 1,
3.017779, -0.5369498, 2.801015, 1, 1, 1, 1, 1,
3.116944, -0.8860912, 3.063141, 1, 1, 1, 1, 1
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
var radius = 9.187261;
var distance = 32.26986;
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
mvMatrix.translate( -0.02653694, -0.04164886, -0.2222495 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.26986);
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
