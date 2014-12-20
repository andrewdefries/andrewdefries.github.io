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
-3.239836, -1.271475, -2.301543, 1, 0, 0, 1,
-3.045259, 0.175116, -3.456774, 1, 0.007843138, 0, 1,
-2.862004, -0.91111, -1.985699, 1, 0.01176471, 0, 1,
-2.809708, 1.411429, -2.358135, 1, 0.01960784, 0, 1,
-2.76147, 0.9629836, -0.6144248, 1, 0.02352941, 0, 1,
-2.62825, -1.396581, -1.057244, 1, 0.03137255, 0, 1,
-2.528783, -1.346802, -2.048477, 1, 0.03529412, 0, 1,
-2.43645, 0.3081863, -1.240013, 1, 0.04313726, 0, 1,
-2.428055, 0.06012191, -1.315196, 1, 0.04705882, 0, 1,
-2.363862, -1.576721, -2.126754, 1, 0.05490196, 0, 1,
-2.357441, -0.8540789, -0.3226966, 1, 0.05882353, 0, 1,
-2.355877, 0.07926077, -1.386409, 1, 0.06666667, 0, 1,
-2.291748, 0.6648858, -1.629888, 1, 0.07058824, 0, 1,
-2.228796, 0.5374411, -2.716609, 1, 0.07843138, 0, 1,
-2.164136, -0.4805358, -0.5983823, 1, 0.08235294, 0, 1,
-2.14955, 1.022145, -1.888086, 1, 0.09019608, 0, 1,
-2.148581, -0.9688135, -1.32723, 1, 0.09411765, 0, 1,
-2.14483, -1.238666, -2.00982, 1, 0.1019608, 0, 1,
-2.13581, -0.8096683, -1.461485, 1, 0.1098039, 0, 1,
-2.122917, -0.2085444, -2.693213, 1, 0.1137255, 0, 1,
-2.098556, -0.01893358, 0.04778802, 1, 0.1215686, 0, 1,
-2.029451, -0.4296977, -1.315104, 1, 0.1254902, 0, 1,
-2.013882, 0.2034624, -0.890503, 1, 0.1333333, 0, 1,
-1.934742, 1.908995, -0.3075174, 1, 0.1372549, 0, 1,
-1.91452, -0.7354587, -3.143467, 1, 0.145098, 0, 1,
-1.88272, -0.3702406, -1.670543, 1, 0.1490196, 0, 1,
-1.874118, -0.6390586, -3.067684, 1, 0.1568628, 0, 1,
-1.865453, 0.9659182, 0.08815759, 1, 0.1607843, 0, 1,
-1.856847, 0.4158095, -0.735837, 1, 0.1686275, 0, 1,
-1.84973, -0.06584242, -1.81342, 1, 0.172549, 0, 1,
-1.836973, -0.6832041, -2.337059, 1, 0.1803922, 0, 1,
-1.819397, 0.5849478, -0.8956691, 1, 0.1843137, 0, 1,
-1.800076, 0.7042971, -0.5343795, 1, 0.1921569, 0, 1,
-1.796499, 0.2059197, -2.861964, 1, 0.1960784, 0, 1,
-1.7684, 0.5964352, -1.176526, 1, 0.2039216, 0, 1,
-1.763697, -0.2824775, -2.881211, 1, 0.2117647, 0, 1,
-1.760641, 0.07760956, -1.206498, 1, 0.2156863, 0, 1,
-1.751896, -1.394167, -3.150712, 1, 0.2235294, 0, 1,
-1.74523, 0.1973938, -1.515913, 1, 0.227451, 0, 1,
-1.734906, 1.319761, -1.797077, 1, 0.2352941, 0, 1,
-1.731409, 0.7153786, -0.7248853, 1, 0.2392157, 0, 1,
-1.72985, 1.265938, -0.5388771, 1, 0.2470588, 0, 1,
-1.707945, 1.512551, -1.830662, 1, 0.2509804, 0, 1,
-1.686143, -0.3077655, -1.543548, 1, 0.2588235, 0, 1,
-1.664189, -1.20328, -2.633281, 1, 0.2627451, 0, 1,
-1.66011, 0.6330001, -1.622327, 1, 0.2705882, 0, 1,
-1.657611, -0.2389618, -0.8297722, 1, 0.2745098, 0, 1,
-1.649776, 1.537287, -0.9984733, 1, 0.282353, 0, 1,
-1.636373, 0.4219406, 0.5384897, 1, 0.2862745, 0, 1,
-1.620582, 0.4563069, -1.021371, 1, 0.2941177, 0, 1,
-1.614175, 0.6004041, -0.7073271, 1, 0.3019608, 0, 1,
-1.613389, -0.5163589, -0.3727183, 1, 0.3058824, 0, 1,
-1.612975, -1.094832, -3.551655, 1, 0.3137255, 0, 1,
-1.589947, 1.585121, -0.3621057, 1, 0.3176471, 0, 1,
-1.583999, 1.798797, -0.5477152, 1, 0.3254902, 0, 1,
-1.583469, -0.3351837, -0.9163134, 1, 0.3294118, 0, 1,
-1.575185, -0.8948318, -0.4668804, 1, 0.3372549, 0, 1,
-1.574996, -0.5673046, -1.63545, 1, 0.3411765, 0, 1,
-1.552904, -1.300324, -1.716571, 1, 0.3490196, 0, 1,
-1.549977, 0.4356448, -0.5045819, 1, 0.3529412, 0, 1,
-1.546784, 0.5230629, -1.415255, 1, 0.3607843, 0, 1,
-1.546343, 0.08004484, -2.846163, 1, 0.3647059, 0, 1,
-1.539724, 0.01239522, -0.5158041, 1, 0.372549, 0, 1,
-1.530874, -0.7969638, -2.458804, 1, 0.3764706, 0, 1,
-1.52617, -1.015197, -2.411067, 1, 0.3843137, 0, 1,
-1.52448, -0.136374, -1.240257, 1, 0.3882353, 0, 1,
-1.51732, -0.6761084, -1.899048, 1, 0.3960784, 0, 1,
-1.482019, 0.8319446, -0.6590191, 1, 0.4039216, 0, 1,
-1.459725, -1.524254, -4.352661, 1, 0.4078431, 0, 1,
-1.457019, -0.2415944, -2.511226, 1, 0.4156863, 0, 1,
-1.451478, -0.8108967, -2.075474, 1, 0.4196078, 0, 1,
-1.446856, -0.1058824, -0.8514968, 1, 0.427451, 0, 1,
-1.443128, 1.070772, -0.3787157, 1, 0.4313726, 0, 1,
-1.425179, -1.289387, -2.004372, 1, 0.4392157, 0, 1,
-1.424558, -0.7982858, -1.747926, 1, 0.4431373, 0, 1,
-1.418474, -0.2842114, -2.540239, 1, 0.4509804, 0, 1,
-1.41737, 0.4661842, -1.034218, 1, 0.454902, 0, 1,
-1.404399, -2.116297, -2.908932, 1, 0.4627451, 0, 1,
-1.398773, 1.554754, -2.028883, 1, 0.4666667, 0, 1,
-1.388888, 0.6171065, -0.9815379, 1, 0.4745098, 0, 1,
-1.380725, -0.5149969, -2.126787, 1, 0.4784314, 0, 1,
-1.366827, 0.5705184, -1.772558, 1, 0.4862745, 0, 1,
-1.361575, 1.148774, -1.574674, 1, 0.4901961, 0, 1,
-1.356204, -0.5069107, -2.862728, 1, 0.4980392, 0, 1,
-1.347158, 0.4889501, -0.7485756, 1, 0.5058824, 0, 1,
-1.346597, -0.9279422, -5.057234, 1, 0.509804, 0, 1,
-1.33846, -0.3474807, -0.3847202, 1, 0.5176471, 0, 1,
-1.334334, -0.90367, -0.6683467, 1, 0.5215687, 0, 1,
-1.328935, 0.5694178, -2.315671, 1, 0.5294118, 0, 1,
-1.32395, 1.341504, -1.119367, 1, 0.5333334, 0, 1,
-1.315771, -1.071939, -2.278998, 1, 0.5411765, 0, 1,
-1.312283, -0.0397635, -1.677215, 1, 0.5450981, 0, 1,
-1.311818, -0.5849823, -2.480188, 1, 0.5529412, 0, 1,
-1.306654, -0.342216, -0.8032642, 1, 0.5568628, 0, 1,
-1.302536, -0.04112088, 0.1952312, 1, 0.5647059, 0, 1,
-1.296986, -1.187994, -2.384892, 1, 0.5686275, 0, 1,
-1.296405, -1.013047, -2.338721, 1, 0.5764706, 0, 1,
-1.29634, 0.3927373, -1.094367, 1, 0.5803922, 0, 1,
-1.296265, -1.558484, -2.170687, 1, 0.5882353, 0, 1,
-1.291048, 1.232928, -0.7650815, 1, 0.5921569, 0, 1,
-1.290818, -1.836683, -2.29144, 1, 0.6, 0, 1,
-1.287679, -0.01625964, -1.681932, 1, 0.6078432, 0, 1,
-1.279559, 0.8092639, -2.307903, 1, 0.6117647, 0, 1,
-1.27919, 0.6210021, -1.74729, 1, 0.6196079, 0, 1,
-1.278421, 0.753054, -2.185805, 1, 0.6235294, 0, 1,
-1.277102, 0.3019708, -2.377946, 1, 0.6313726, 0, 1,
-1.273746, 1.17514, -0.915114, 1, 0.6352941, 0, 1,
-1.271282, 0.5065379, -1.609905, 1, 0.6431373, 0, 1,
-1.258911, -0.0379313, -1.948823, 1, 0.6470588, 0, 1,
-1.257555, -1.874874, -2.290445, 1, 0.654902, 0, 1,
-1.250701, -1.180673, -2.448265, 1, 0.6588235, 0, 1,
-1.248021, -0.05962849, -0.1504731, 1, 0.6666667, 0, 1,
-1.247342, -0.6609164, -2.525057, 1, 0.6705883, 0, 1,
-1.236137, 0.312007, -2.5653, 1, 0.6784314, 0, 1,
-1.233926, 0.270492, -0.7449199, 1, 0.682353, 0, 1,
-1.228394, 1.017069, -0.4999662, 1, 0.6901961, 0, 1,
-1.224658, -1.217803, -2.134267, 1, 0.6941177, 0, 1,
-1.224521, -0.6009333, -2.458398, 1, 0.7019608, 0, 1,
-1.216799, -0.5471452, -1.397381, 1, 0.7098039, 0, 1,
-1.214323, 1.319231, -0.5666448, 1, 0.7137255, 0, 1,
-1.208866, -1.563198, -2.965452, 1, 0.7215686, 0, 1,
-1.208201, 0.278018, -0.7119209, 1, 0.7254902, 0, 1,
-1.199725, 0.1682319, 0.1486483, 1, 0.7333333, 0, 1,
-1.184989, -0.7788745, -3.748924, 1, 0.7372549, 0, 1,
-1.175812, -1.114422, -0.9534958, 1, 0.7450981, 0, 1,
-1.175759, -1.417807, -2.992847, 1, 0.7490196, 0, 1,
-1.172788, -1.204481, -3.639462, 1, 0.7568628, 0, 1,
-1.169034, -2.169888, -3.119749, 1, 0.7607843, 0, 1,
-1.165743, 1.090314, 1.12517, 1, 0.7686275, 0, 1,
-1.165702, -0.4967791, -0.5612419, 1, 0.772549, 0, 1,
-1.165271, -0.4178877, -1.598476, 1, 0.7803922, 0, 1,
-1.160686, 0.2941089, -1.398092, 1, 0.7843137, 0, 1,
-1.157586, -2.145786, -3.465042, 1, 0.7921569, 0, 1,
-1.144848, -0.3482545, -0.9141555, 1, 0.7960784, 0, 1,
-1.140959, 0.8550655, 0.3714262, 1, 0.8039216, 0, 1,
-1.139295, -1.891952, -1.169836, 1, 0.8117647, 0, 1,
-1.139107, 1.249457, -1.649528, 1, 0.8156863, 0, 1,
-1.137164, 2.15542, 0.675833, 1, 0.8235294, 0, 1,
-1.119568, 1.05182, -1.091925, 1, 0.827451, 0, 1,
-1.112293, -1.4187, -3.012629, 1, 0.8352941, 0, 1,
-1.10998, 1.008501, -0.7973723, 1, 0.8392157, 0, 1,
-1.109311, -0.2985743, -0.5225218, 1, 0.8470588, 0, 1,
-1.108883, 1.161769, -1.138059, 1, 0.8509804, 0, 1,
-1.107627, -1.708698, -2.53327, 1, 0.8588235, 0, 1,
-1.100775, -1.183446, -2.740069, 1, 0.8627451, 0, 1,
-1.099474, -0.3190856, -2.193482, 1, 0.8705882, 0, 1,
-1.096248, -0.8702696, -1.983368, 1, 0.8745098, 0, 1,
-1.09519, 0.597896, -2.117281, 1, 0.8823529, 0, 1,
-1.093086, 0.3241708, -0.5333096, 1, 0.8862745, 0, 1,
-1.091743, -2.143641, -3.513487, 1, 0.8941177, 0, 1,
-1.089728, 0.4604179, -0.1603497, 1, 0.8980392, 0, 1,
-1.089633, 0.3775191, -0.0116942, 1, 0.9058824, 0, 1,
-1.088278, 0.4156963, -1.180879, 1, 0.9137255, 0, 1,
-1.085668, 1.039888, -1.016751, 1, 0.9176471, 0, 1,
-1.08053, 0.6703351, -3.137102, 1, 0.9254902, 0, 1,
-1.079449, -0.7534598, -1.604428, 1, 0.9294118, 0, 1,
-1.078879, -1.034772, -3.49855, 1, 0.9372549, 0, 1,
-1.064761, 1.42798, -1.148517, 1, 0.9411765, 0, 1,
-1.060262, 0.3665086, 0.7097324, 1, 0.9490196, 0, 1,
-1.058816, 0.07744861, -1.515823, 1, 0.9529412, 0, 1,
-1.056687, 0.7137759, -0.7953885, 1, 0.9607843, 0, 1,
-1.055002, -2.0077, -2.716309, 1, 0.9647059, 0, 1,
-1.046341, 0.03024571, -2.00805, 1, 0.972549, 0, 1,
-1.043313, -0.664411, -2.689299, 1, 0.9764706, 0, 1,
-1.04079, -2.647208, -2.889104, 1, 0.9843137, 0, 1,
-1.040761, -0.6325241, -0.3692576, 1, 0.9882353, 0, 1,
-1.036541, -0.149185, -1.357269, 1, 0.9960784, 0, 1,
-1.032471, 0.08978174, -2.949183, 0.9960784, 1, 0, 1,
-1.019985, 0.5418148, -2.649876, 0.9921569, 1, 0, 1,
-1.018595, -0.4151097, -1.246737, 0.9843137, 1, 0, 1,
-1.012877, -0.05358103, -1.667114, 0.9803922, 1, 0, 1,
-1.000681, -2.206544, -4.033353, 0.972549, 1, 0, 1,
-0.9891278, 0.2565712, -0.588329, 0.9686275, 1, 0, 1,
-0.9861137, 1.161503, -1.345861, 0.9607843, 1, 0, 1,
-0.9811655, 1.336764, -0.4055873, 0.9568627, 1, 0, 1,
-0.9725206, 1.335194, -0.2094779, 0.9490196, 1, 0, 1,
-0.9681638, -1.395295, -2.575134, 0.945098, 1, 0, 1,
-0.9604549, 0.7965149, -1.564844, 0.9372549, 1, 0, 1,
-0.9539923, -1.422888, -1.474623, 0.9333333, 1, 0, 1,
-0.9519213, -1.60453, -2.951505, 0.9254902, 1, 0, 1,
-0.950351, -0.9599436, -4.028086, 0.9215686, 1, 0, 1,
-0.9498745, -0.1264401, -1.069149, 0.9137255, 1, 0, 1,
-0.9494788, 0.09975677, -2.187877, 0.9098039, 1, 0, 1,
-0.948357, 0.02668034, -3.866297, 0.9019608, 1, 0, 1,
-0.9424233, 0.8568369, -2.460326, 0.8941177, 1, 0, 1,
-0.938292, -1.137927, 0.5905004, 0.8901961, 1, 0, 1,
-0.9332523, 0.1607592, -0.3173278, 0.8823529, 1, 0, 1,
-0.9325352, 0.9612923, 0.8664917, 0.8784314, 1, 0, 1,
-0.9298609, -1.455385, -2.884954, 0.8705882, 1, 0, 1,
-0.9272831, 0.4302754, -1.505745, 0.8666667, 1, 0, 1,
-0.9210099, -0.4882384, -1.039111, 0.8588235, 1, 0, 1,
-0.9068899, -0.6655038, -3.322101, 0.854902, 1, 0, 1,
-0.9048752, -1.408685, -3.346837, 0.8470588, 1, 0, 1,
-0.9044835, -1.922252, -3.301636, 0.8431373, 1, 0, 1,
-0.9019561, -1.265499, -1.510927, 0.8352941, 1, 0, 1,
-0.8959466, 0.5851745, -0.7746087, 0.8313726, 1, 0, 1,
-0.8924617, 0.9390582, -2.406943, 0.8235294, 1, 0, 1,
-0.889267, 0.1157812, -1.550936, 0.8196079, 1, 0, 1,
-0.8878486, -0.5499901, -2.098811, 0.8117647, 1, 0, 1,
-0.8796358, -0.3130206, -2.211591, 0.8078431, 1, 0, 1,
-0.8735666, -0.5141171, -0.5853428, 0.8, 1, 0, 1,
-0.8705957, 1.114869, -0.7887062, 0.7921569, 1, 0, 1,
-0.867984, 0.5666324, -1.120155, 0.7882353, 1, 0, 1,
-0.8619213, -0.7505174, -3.142949, 0.7803922, 1, 0, 1,
-0.8601092, -1.758451, -3.084042, 0.7764706, 1, 0, 1,
-0.8544044, -0.8881938, -1.248885, 0.7686275, 1, 0, 1,
-0.8528852, 0.6153055, 1.394107, 0.7647059, 1, 0, 1,
-0.8449398, 1.29347, -2.580778, 0.7568628, 1, 0, 1,
-0.8351408, -0.3107362, -2.448766, 0.7529412, 1, 0, 1,
-0.8330529, 0.4605704, -1.194746, 0.7450981, 1, 0, 1,
-0.8256822, -0.7786471, -3.400921, 0.7411765, 1, 0, 1,
-0.8238788, -0.09007741, -0.8345836, 0.7333333, 1, 0, 1,
-0.8223067, -0.2649274, -0.4184821, 0.7294118, 1, 0, 1,
-0.8197488, 0.002457579, -2.857185, 0.7215686, 1, 0, 1,
-0.8031471, -0.2460112, -1.952045, 0.7176471, 1, 0, 1,
-0.8017789, -1.425414, -3.206747, 0.7098039, 1, 0, 1,
-0.7972955, 0.2843492, -1.132754, 0.7058824, 1, 0, 1,
-0.7902963, 0.3401891, -1.188898, 0.6980392, 1, 0, 1,
-0.7870083, -0.004063965, 0.2657309, 0.6901961, 1, 0, 1,
-0.7840141, -1.865934, -2.171944, 0.6862745, 1, 0, 1,
-0.781216, 0.1024343, 0.7283797, 0.6784314, 1, 0, 1,
-0.7809398, 0.194616, 0.09476403, 0.6745098, 1, 0, 1,
-0.7809089, 0.6422088, -0.05649839, 0.6666667, 1, 0, 1,
-0.7795922, -0.6041745, -2.082086, 0.6627451, 1, 0, 1,
-0.7756786, 0.1606796, -2.096132, 0.654902, 1, 0, 1,
-0.7752457, -0.9218169, -0.8712978, 0.6509804, 1, 0, 1,
-0.7721033, -0.2379234, -3.07869, 0.6431373, 1, 0, 1,
-0.7699829, -0.03605761, -2.411082, 0.6392157, 1, 0, 1,
-0.766068, 1.002225, -2.796935, 0.6313726, 1, 0, 1,
-0.7652252, 0.1003286, -1.047793, 0.627451, 1, 0, 1,
-0.758948, -0.388393, -2.85102, 0.6196079, 1, 0, 1,
-0.7586049, 0.4762897, -1.526656, 0.6156863, 1, 0, 1,
-0.7574436, 1.969253, -0.6141816, 0.6078432, 1, 0, 1,
-0.7527637, -1.394637, -2.143584, 0.6039216, 1, 0, 1,
-0.7514932, 0.3231029, -0.3934539, 0.5960785, 1, 0, 1,
-0.7469049, -0.02485354, -0.8983398, 0.5882353, 1, 0, 1,
-0.7415501, 1.258431, -1.144264, 0.5843138, 1, 0, 1,
-0.7399636, -0.1353859, -1.629174, 0.5764706, 1, 0, 1,
-0.7273442, 1.635604, 0.578932, 0.572549, 1, 0, 1,
-0.7155516, 1.688488, -0.8599342, 0.5647059, 1, 0, 1,
-0.7143565, 0.09169245, -1.162314, 0.5607843, 1, 0, 1,
-0.7123767, 0.3276311, 0.2313794, 0.5529412, 1, 0, 1,
-0.7113659, -0.02342355, -3.003682, 0.5490196, 1, 0, 1,
-0.7104164, 1.65346, -0.4174864, 0.5411765, 1, 0, 1,
-0.7083347, 0.5639549, -0.8070962, 0.5372549, 1, 0, 1,
-0.7076505, -1.612056, -2.041997, 0.5294118, 1, 0, 1,
-0.7048798, -0.7615812, -2.387172, 0.5254902, 1, 0, 1,
-0.7035805, 0.9132658, 0.2987669, 0.5176471, 1, 0, 1,
-0.6986896, 0.008409131, -1.727444, 0.5137255, 1, 0, 1,
-0.6985494, 0.04407478, -1.70219, 0.5058824, 1, 0, 1,
-0.6976104, 0.03428389, -2.793029, 0.5019608, 1, 0, 1,
-0.6888722, 1.418889, 0.609748, 0.4941176, 1, 0, 1,
-0.6833286, 0.5756274, -1.165639, 0.4862745, 1, 0, 1,
-0.6822697, 0.7889704, -1.604916, 0.4823529, 1, 0, 1,
-0.6817474, -1.409628, -2.275788, 0.4745098, 1, 0, 1,
-0.6778319, -0.7452493, -4.262184, 0.4705882, 1, 0, 1,
-0.6742151, 1.568754, -0.5409218, 0.4627451, 1, 0, 1,
-0.6730451, 0.2506621, -2.800501, 0.4588235, 1, 0, 1,
-0.6670299, 1.138185, -2.334934, 0.4509804, 1, 0, 1,
-0.6639042, 0.2958856, 0.7010997, 0.4470588, 1, 0, 1,
-0.6510004, -1.25329, -4.308635, 0.4392157, 1, 0, 1,
-0.650745, 0.03578367, -2.826286, 0.4352941, 1, 0, 1,
-0.6457496, -1.714442, -3.874585, 0.427451, 1, 0, 1,
-0.6440849, -0.7989124, -0.6553895, 0.4235294, 1, 0, 1,
-0.6271846, -0.6306581, -2.730888, 0.4156863, 1, 0, 1,
-0.6271254, -0.6472197, -2.841539, 0.4117647, 1, 0, 1,
-0.6233836, 1.201276, 0.5917818, 0.4039216, 1, 0, 1,
-0.6201224, 2.131048, 0.6929271, 0.3960784, 1, 0, 1,
-0.6181862, 2.250479, -0.9127098, 0.3921569, 1, 0, 1,
-0.6142392, -1.046321, -2.017569, 0.3843137, 1, 0, 1,
-0.6098146, 1.807508, -0.8113399, 0.3803922, 1, 0, 1,
-0.6077292, 1.104517, 1.906007, 0.372549, 1, 0, 1,
-0.6045243, 0.2548535, -2.129667, 0.3686275, 1, 0, 1,
-0.6004924, -0.9961478, -2.405764, 0.3607843, 1, 0, 1,
-0.599103, -0.2863611, -0.9636783, 0.3568628, 1, 0, 1,
-0.5989949, 0.2875976, -1.619048, 0.3490196, 1, 0, 1,
-0.5972266, 0.1849091, 0.3207387, 0.345098, 1, 0, 1,
-0.5952047, 0.1497018, -0.3378558, 0.3372549, 1, 0, 1,
-0.5934849, 0.007019516, 0.8369174, 0.3333333, 1, 0, 1,
-0.5909816, 0.07053328, -2.712849, 0.3254902, 1, 0, 1,
-0.5898162, 1.237178, -0.03096083, 0.3215686, 1, 0, 1,
-0.5858871, -1.493752, -2.89082, 0.3137255, 1, 0, 1,
-0.5804054, 0.6488376, -0.157956, 0.3098039, 1, 0, 1,
-0.5775147, 2.463183, 0.0931189, 0.3019608, 1, 0, 1,
-0.5761487, 0.07873116, -0.5083072, 0.2941177, 1, 0, 1,
-0.5691957, 0.3233654, -0.1856755, 0.2901961, 1, 0, 1,
-0.5686849, -0.7958025, -2.445336, 0.282353, 1, 0, 1,
-0.565725, 1.439384, -0.05939163, 0.2784314, 1, 0, 1,
-0.5639395, -0.1198899, -1.417615, 0.2705882, 1, 0, 1,
-0.5574397, -0.7451049, -2.034189, 0.2666667, 1, 0, 1,
-0.5545758, 0.5353051, 0.5524996, 0.2588235, 1, 0, 1,
-0.5536449, -0.6180555, -2.300266, 0.254902, 1, 0, 1,
-0.5498446, -0.432274, -0.7107996, 0.2470588, 1, 0, 1,
-0.5464006, -1.273836, -1.455036, 0.2431373, 1, 0, 1,
-0.542707, -2.605808, -3.052217, 0.2352941, 1, 0, 1,
-0.5367489, -0.7856891, -4.473287, 0.2313726, 1, 0, 1,
-0.5282156, 0.7813107, -1.966836, 0.2235294, 1, 0, 1,
-0.5278509, 1.534822, -0.2390169, 0.2196078, 1, 0, 1,
-0.5263297, -0.5838298, -2.087357, 0.2117647, 1, 0, 1,
-0.5217764, -0.01828338, -1.540453, 0.2078431, 1, 0, 1,
-0.5162215, -0.9869223, -0.5574937, 0.2, 1, 0, 1,
-0.5091777, -0.1518068, -3.754679, 0.1921569, 1, 0, 1,
-0.5090446, -0.4085226, -3.245954, 0.1882353, 1, 0, 1,
-0.5064442, -0.7103469, -2.842337, 0.1803922, 1, 0, 1,
-0.5062467, -0.2286386, -2.334962, 0.1764706, 1, 0, 1,
-0.5057501, 0.5992932, 0.1954384, 0.1686275, 1, 0, 1,
-0.5027724, -1.079499, -3.884266, 0.1647059, 1, 0, 1,
-0.4976507, 1.081568, -2.702985, 0.1568628, 1, 0, 1,
-0.496164, 0.1494835, -1.983525, 0.1529412, 1, 0, 1,
-0.4897194, -0.2018303, -1.622392, 0.145098, 1, 0, 1,
-0.4798067, 1.222565, -0.983139, 0.1411765, 1, 0, 1,
-0.4787115, 0.2920248, -1.213835, 0.1333333, 1, 0, 1,
-0.4776329, 0.2607149, -1.459145, 0.1294118, 1, 0, 1,
-0.4683338, -1.049685, -2.844743, 0.1215686, 1, 0, 1,
-0.4596957, -1.321816, -3.599334, 0.1176471, 1, 0, 1,
-0.4591323, -1.07329, -1.345117, 0.1098039, 1, 0, 1,
-0.4576054, 0.6817439, -1.050275, 0.1058824, 1, 0, 1,
-0.4562181, 0.03177395, -0.7169966, 0.09803922, 1, 0, 1,
-0.4560843, -0.2367967, -1.744231, 0.09019608, 1, 0, 1,
-0.4514582, 1.037974, -0.2154737, 0.08627451, 1, 0, 1,
-0.4479513, 0.3007909, -0.6354302, 0.07843138, 1, 0, 1,
-0.447746, -0.1336145, -0.7150506, 0.07450981, 1, 0, 1,
-0.4468617, -0.6156354, -3.394004, 0.06666667, 1, 0, 1,
-0.4461505, -0.225687, -1.127074, 0.0627451, 1, 0, 1,
-0.4441742, 0.174665, -2.108261, 0.05490196, 1, 0, 1,
-0.4393732, -0.1570161, -0.9992135, 0.05098039, 1, 0, 1,
-0.4378279, -0.3267294, -2.643986, 0.04313726, 1, 0, 1,
-0.4294632, 1.253449, 0.4385351, 0.03921569, 1, 0, 1,
-0.4275828, 0.890721, 0.3509885, 0.03137255, 1, 0, 1,
-0.4274376, 0.9585933, 0.03523614, 0.02745098, 1, 0, 1,
-0.4246854, -2.249801, -2.306667, 0.01960784, 1, 0, 1,
-0.4171709, 0.2492367, -0.4661433, 0.01568628, 1, 0, 1,
-0.4159114, 1.261005, 0.03197552, 0.007843138, 1, 0, 1,
-0.4156991, -2.332798, -2.490775, 0.003921569, 1, 0, 1,
-0.415494, -0.8167074, -2.769368, 0, 1, 0.003921569, 1,
-0.4144916, -0.2241721, -2.426347, 0, 1, 0.01176471, 1,
-0.4103245, 1.577336, -0.03608217, 0, 1, 0.01568628, 1,
-0.409702, 0.9631909, -0.03978626, 0, 1, 0.02352941, 1,
-0.4086884, -0.289848, -2.892874, 0, 1, 0.02745098, 1,
-0.4042954, 1.882338, 0.8030631, 0, 1, 0.03529412, 1,
-0.4037129, 0.2338306, -2.125653, 0, 1, 0.03921569, 1,
-0.4011976, 0.9774413, -1.774207, 0, 1, 0.04705882, 1,
-0.3971483, 0.02724092, -2.406035, 0, 1, 0.05098039, 1,
-0.3959292, -0.04755179, -2.215743, 0, 1, 0.05882353, 1,
-0.393886, 0.2954575, 0.2012286, 0, 1, 0.0627451, 1,
-0.3928, 0.9091251, 0.6003274, 0, 1, 0.07058824, 1,
-0.3805596, -1.459987, -3.277342, 0, 1, 0.07450981, 1,
-0.3721497, 0.9198386, -0.3271717, 0, 1, 0.08235294, 1,
-0.3715846, 0.9202113, -0.1382299, 0, 1, 0.08627451, 1,
-0.3672838, -0.9258923, -2.827126, 0, 1, 0.09411765, 1,
-0.3652529, -1.234, -2.531276, 0, 1, 0.1019608, 1,
-0.3650293, -0.7657366, -2.005878, 0, 1, 0.1058824, 1,
-0.362332, 0.646065, -1.230081, 0, 1, 0.1137255, 1,
-0.3620926, 0.5104067, -0.8961792, 0, 1, 0.1176471, 1,
-0.3573619, 0.0008311162, -1.58755, 0, 1, 0.1254902, 1,
-0.3543598, -1.658775, -3.971305, 0, 1, 0.1294118, 1,
-0.3542367, -0.660542, -1.563103, 0, 1, 0.1372549, 1,
-0.3524232, -0.4120385, -2.068379, 0, 1, 0.1411765, 1,
-0.3497836, 0.2289646, -0.6341347, 0, 1, 0.1490196, 1,
-0.3488743, 1.817878, -0.2850798, 0, 1, 0.1529412, 1,
-0.34825, -0.9567329, -4.262752, 0, 1, 0.1607843, 1,
-0.3469598, -0.2321703, 1.039003, 0, 1, 0.1647059, 1,
-0.345419, -0.2374506, -2.939213, 0, 1, 0.172549, 1,
-0.3446451, 0.5853009, -2.358298, 0, 1, 0.1764706, 1,
-0.3444087, -1.740285, -3.349445, 0, 1, 0.1843137, 1,
-0.3441455, 0.4520608, -1.358701, 0, 1, 0.1882353, 1,
-0.3383195, 2.890354, 1.053802, 0, 1, 0.1960784, 1,
-0.3381703, 1.192946, -0.7173979, 0, 1, 0.2039216, 1,
-0.3332902, 1.593057, 0.03586034, 0, 1, 0.2078431, 1,
-0.3316365, 0.1057271, -0.302771, 0, 1, 0.2156863, 1,
-0.3257965, 1.598345, -0.8131528, 0, 1, 0.2196078, 1,
-0.3257851, 0.4250528, -0.4805934, 0, 1, 0.227451, 1,
-0.3214706, 0.7947856, -1.194978, 0, 1, 0.2313726, 1,
-0.3090776, -0.6758355, -2.294846, 0, 1, 0.2392157, 1,
-0.3046398, 0.7148308, -0.1021025, 0, 1, 0.2431373, 1,
-0.3024993, 1.362071, 0.7073576, 0, 1, 0.2509804, 1,
-0.2994017, 1.97582, 1.134711, 0, 1, 0.254902, 1,
-0.2987689, -1.67462, -2.42927, 0, 1, 0.2627451, 1,
-0.2974392, 0.9118015, -0.3128555, 0, 1, 0.2666667, 1,
-0.2954115, 0.3820258, 0.1609552, 0, 1, 0.2745098, 1,
-0.2947779, -1.257035, -3.353836, 0, 1, 0.2784314, 1,
-0.2940753, -0.08344132, -2.585244, 0, 1, 0.2862745, 1,
-0.2905867, -0.3311744, -3.753923, 0, 1, 0.2901961, 1,
-0.2904809, 0.685309, 0.003296477, 0, 1, 0.2980392, 1,
-0.2873408, 1.143448, -0.6309897, 0, 1, 0.3058824, 1,
-0.2849833, 1.33679, -2.738316, 0, 1, 0.3098039, 1,
-0.2848831, 0.1956948, -1.034435, 0, 1, 0.3176471, 1,
-0.2833669, -0.09765799, -2.97032, 0, 1, 0.3215686, 1,
-0.2801862, 0.5084, -0.6021714, 0, 1, 0.3294118, 1,
-0.2765989, -1.12122, -1.353079, 0, 1, 0.3333333, 1,
-0.2738666, 0.2308796, 0.6526774, 0, 1, 0.3411765, 1,
-0.2727284, -0.2978947, -3.40864, 0, 1, 0.345098, 1,
-0.2722452, 0.6862441, -0.5310348, 0, 1, 0.3529412, 1,
-0.2707448, -0.6058652, -2.369316, 0, 1, 0.3568628, 1,
-0.2682558, -0.4194943, -1.406365, 0, 1, 0.3647059, 1,
-0.2634994, -0.7385366, -1.684954, 0, 1, 0.3686275, 1,
-0.2603437, 0.325191, -0.8141651, 0, 1, 0.3764706, 1,
-0.2571302, -0.507483, -4.063876, 0, 1, 0.3803922, 1,
-0.251488, -0.3447471, -1.937975, 0, 1, 0.3882353, 1,
-0.249341, -1.888508, -1.829922, 0, 1, 0.3921569, 1,
-0.2485228, -1.437994, -1.321682, 0, 1, 0.4, 1,
-0.2484926, 1.451896, 0.6712453, 0, 1, 0.4078431, 1,
-0.2464727, 1.038105, -0.5513413, 0, 1, 0.4117647, 1,
-0.2459005, -1.329634, -3.539272, 0, 1, 0.4196078, 1,
-0.2441423, -0.1816267, -3.025728, 0, 1, 0.4235294, 1,
-0.2432051, -0.1639326, -1.426186, 0, 1, 0.4313726, 1,
-0.2407819, -0.01749099, -2.730103, 0, 1, 0.4352941, 1,
-0.2396153, -0.2655626, -1.821636, 0, 1, 0.4431373, 1,
-0.2360328, 0.6079293, -0.6728632, 0, 1, 0.4470588, 1,
-0.2341954, 0.2040833, -0.4155258, 0, 1, 0.454902, 1,
-0.2317047, 2.171047, 1.910093, 0, 1, 0.4588235, 1,
-0.2285258, 1.156748, -0.2203249, 0, 1, 0.4666667, 1,
-0.2233969, 1.387585, 0.5819392, 0, 1, 0.4705882, 1,
-0.2210641, -0.9671981, -3.078358, 0, 1, 0.4784314, 1,
-0.2172503, -0.9963113, -3.34515, 0, 1, 0.4823529, 1,
-0.2156236, -0.9865944, -1.367746, 0, 1, 0.4901961, 1,
-0.2114464, 1.109991, -0.3990444, 0, 1, 0.4941176, 1,
-0.210535, 1.478133, -1.167284, 0, 1, 0.5019608, 1,
-0.2086663, -2.89189, -3.511931, 0, 1, 0.509804, 1,
-0.2061822, 0.4252478, -0.2855771, 0, 1, 0.5137255, 1,
-0.2045613, -1.158136, -3.143235, 0, 1, 0.5215687, 1,
-0.2038177, -1.165908, -2.849296, 0, 1, 0.5254902, 1,
-0.1967283, -0.630502, -2.325221, 0, 1, 0.5333334, 1,
-0.1952864, 1.180431, 0.5321546, 0, 1, 0.5372549, 1,
-0.1891105, -0.1757923, -2.611401, 0, 1, 0.5450981, 1,
-0.1876577, 0.9325918, -0.6017129, 0, 1, 0.5490196, 1,
-0.186525, 1.028385, 0.3266179, 0, 1, 0.5568628, 1,
-0.1856374, -1.204823, -2.39082, 0, 1, 0.5607843, 1,
-0.1852649, 1.050228, -0.5059146, 0, 1, 0.5686275, 1,
-0.1822667, 2.573991, 0.9183831, 0, 1, 0.572549, 1,
-0.1813218, -0.5926605, -2.903445, 0, 1, 0.5803922, 1,
-0.1804103, 1.134882, -0.2561722, 0, 1, 0.5843138, 1,
-0.1757842, -0.0343366, -2.963082, 0, 1, 0.5921569, 1,
-0.1744008, -1.818976, -5.223472, 0, 1, 0.5960785, 1,
-0.1708114, -1.045318, -2.654825, 0, 1, 0.6039216, 1,
-0.1627182, 2.31676, -0.6171655, 0, 1, 0.6117647, 1,
-0.1588432, 0.6109922, -0.4430985, 0, 1, 0.6156863, 1,
-0.1557887, -2.224815, -2.98359, 0, 1, 0.6235294, 1,
-0.1538771, -0.01867444, -2.346383, 0, 1, 0.627451, 1,
-0.1505302, -1.816155, -2.906544, 0, 1, 0.6352941, 1,
-0.1489505, 0.4402612, -0.6164751, 0, 1, 0.6392157, 1,
-0.145777, -0.7120155, -2.417352, 0, 1, 0.6470588, 1,
-0.145428, 0.03314523, -0.00420624, 0, 1, 0.6509804, 1,
-0.1402764, -0.2501984, -1.973548, 0, 1, 0.6588235, 1,
-0.1367643, -0.6691766, -4.076877, 0, 1, 0.6627451, 1,
-0.1350049, 0.3205106, -3.264914, 0, 1, 0.6705883, 1,
-0.1334682, 0.08997295, -0.7922259, 0, 1, 0.6745098, 1,
-0.1323183, 0.3361363, -0.8229989, 0, 1, 0.682353, 1,
-0.1321405, -0.1365315, -1.703188, 0, 1, 0.6862745, 1,
-0.131121, -0.7849931, -2.400448, 0, 1, 0.6941177, 1,
-0.1270153, -0.868149, -3.311771, 0, 1, 0.7019608, 1,
-0.1238821, -0.5344439, -2.392189, 0, 1, 0.7058824, 1,
-0.1226392, -1.211317, -3.978721, 0, 1, 0.7137255, 1,
-0.1171807, 1.423444, -1.333848, 0, 1, 0.7176471, 1,
-0.113519, 0.9125879, -0.6078653, 0, 1, 0.7254902, 1,
-0.1126975, -0.6869505, -2.941872, 0, 1, 0.7294118, 1,
-0.09860785, -0.1831992, -1.337484, 0, 1, 0.7372549, 1,
-0.09753308, -0.3447092, -2.928804, 0, 1, 0.7411765, 1,
-0.09740736, -0.3603972, -4.049806, 0, 1, 0.7490196, 1,
-0.09697725, -0.02485492, -0.8558246, 0, 1, 0.7529412, 1,
-0.09683825, 0.7208412, -0.7911171, 0, 1, 0.7607843, 1,
-0.09059134, -2.239097, -2.43434, 0, 1, 0.7647059, 1,
-0.08638504, 1.044117, -0.04482252, 0, 1, 0.772549, 1,
-0.08304877, -0.7080798, -2.772582, 0, 1, 0.7764706, 1,
-0.08284077, 1.009389, -0.2732985, 0, 1, 0.7843137, 1,
-0.07885479, -0.6603923, -3.988454, 0, 1, 0.7882353, 1,
-0.07213581, -0.2616092, -2.755793, 0, 1, 0.7960784, 1,
-0.0716623, 1.110805, 0.114429, 0, 1, 0.8039216, 1,
-0.07117966, 0.9876339, -0.6415771, 0, 1, 0.8078431, 1,
-0.0695924, -0.681627, -2.804938, 0, 1, 0.8156863, 1,
-0.0695745, 1.000249, 0.5995786, 0, 1, 0.8196079, 1,
-0.06699631, 0.2150673, 2.087626, 0, 1, 0.827451, 1,
-0.06691293, 1.709918, -0.2697068, 0, 1, 0.8313726, 1,
-0.06330366, -0.09986358, -4.673165, 0, 1, 0.8392157, 1,
-0.06235712, -1.039419, -2.331641, 0, 1, 0.8431373, 1,
-0.06066681, 0.637248, -0.4053805, 0, 1, 0.8509804, 1,
-0.06036038, 0.5125309, 1.183253, 0, 1, 0.854902, 1,
-0.05913344, 0.3441632, -0.9782235, 0, 1, 0.8627451, 1,
-0.05733879, 1.18905, 0.7613766, 0, 1, 0.8666667, 1,
-0.05624105, -1.914867, -3.36184, 0, 1, 0.8745098, 1,
-0.05515676, -1.380638, -3.4789, 0, 1, 0.8784314, 1,
-0.05464999, -1.7458, -3.341593, 0, 1, 0.8862745, 1,
-0.05282016, 0.06338178, 0.4841545, 0, 1, 0.8901961, 1,
-0.05039056, 0.1752399, -0.9456244, 0, 1, 0.8980392, 1,
-0.04993409, 0.1168509, -1.139332, 0, 1, 0.9058824, 1,
-0.04350734, -0.3325687, -4.074595, 0, 1, 0.9098039, 1,
-0.04121875, 0.1596159, -1.836004, 0, 1, 0.9176471, 1,
-0.0406517, 0.7958112, -0.3283914, 0, 1, 0.9215686, 1,
-0.0402506, 0.2027328, 1.558482, 0, 1, 0.9294118, 1,
-0.0391725, 0.4742878, -0.0166708, 0, 1, 0.9333333, 1,
-0.03817658, -1.401898, -4.141626, 0, 1, 0.9411765, 1,
-0.03415599, -0.1892585, -4.298632, 0, 1, 0.945098, 1,
-0.03154407, -1.614912, -4.133967, 0, 1, 0.9529412, 1,
-0.03055225, 1.25537, 1.508826, 0, 1, 0.9568627, 1,
-0.0279973, 0.4352976, 1.222961, 0, 1, 0.9647059, 1,
-0.02550499, -0.07003418, -3.246083, 0, 1, 0.9686275, 1,
-0.02518758, 0.9175601, 0.5773091, 0, 1, 0.9764706, 1,
-0.02400614, 0.2021859, 1.676868, 0, 1, 0.9803922, 1,
-0.02359731, -0.6537963, -3.522364, 0, 1, 0.9882353, 1,
-0.02151616, 0.4732243, 0.2391968, 0, 1, 0.9921569, 1,
-0.02128309, 0.02717196, 0.03429262, 0, 1, 1, 1,
-0.01615239, 0.7650545, 0.8557374, 0, 0.9921569, 1, 1,
-0.0157021, -1.128806, -3.187295, 0, 0.9882353, 1, 1,
-0.01494777, 0.7236744, -0.3811213, 0, 0.9803922, 1, 1,
-0.01377555, -0.08538526, -2.643924, 0, 0.9764706, 1, 1,
-0.01204024, -0.9127715, -3.435242, 0, 0.9686275, 1, 1,
-0.01087897, -0.9353864, -3.506698, 0, 0.9647059, 1, 1,
-0.005292595, 0.1064148, -0.125897, 0, 0.9568627, 1, 1,
0.0007805799, -0.09495606, 2.42706, 0, 0.9529412, 1, 1,
0.008609455, 0.9106433, -0.5787362, 0, 0.945098, 1, 1,
0.01229021, 0.7031773, -0.2015411, 0, 0.9411765, 1, 1,
0.01355177, 0.7429478, 0.6688693, 0, 0.9333333, 1, 1,
0.01524235, -1.690015, 3.204814, 0, 0.9294118, 1, 1,
0.01787389, 1.209456, -0.1240809, 0, 0.9215686, 1, 1,
0.01858662, 0.2704502, -0.9023095, 0, 0.9176471, 1, 1,
0.01919561, 1.108822, 1.180536, 0, 0.9098039, 1, 1,
0.02216092, -1.208431, 1.542872, 0, 0.9058824, 1, 1,
0.02294987, 0.9701844, 1.678388, 0, 0.8980392, 1, 1,
0.02465438, -0.7032102, 4.199639, 0, 0.8901961, 1, 1,
0.02675349, 0.1517955, 0.2916664, 0, 0.8862745, 1, 1,
0.02733693, 0.7117513, 0.07871759, 0, 0.8784314, 1, 1,
0.0319248, 0.4876577, 0.01457317, 0, 0.8745098, 1, 1,
0.03652654, 1.503316, 0.07934259, 0, 0.8666667, 1, 1,
0.03842226, 1.292028, -0.1471877, 0, 0.8627451, 1, 1,
0.0414825, 0.3159342, -0.08444867, 0, 0.854902, 1, 1,
0.04233723, 0.487287, 0.155556, 0, 0.8509804, 1, 1,
0.04311735, -0.2475034, 1.564283, 0, 0.8431373, 1, 1,
0.05569285, -1.14634, 2.259969, 0, 0.8392157, 1, 1,
0.05895652, 1.038854, 0.6074806, 0, 0.8313726, 1, 1,
0.06040695, 0.3831193, 0.4032088, 0, 0.827451, 1, 1,
0.06187107, -0.1846435, 2.250591, 0, 0.8196079, 1, 1,
0.06187594, 0.5188301, -2.015945, 0, 0.8156863, 1, 1,
0.06214864, -1.549452, 2.723962, 0, 0.8078431, 1, 1,
0.06467049, -0.9637928, 6.093041, 0, 0.8039216, 1, 1,
0.06677639, -1.014762, 3.581655, 0, 0.7960784, 1, 1,
0.07047378, -1.024591, 3.587507, 0, 0.7882353, 1, 1,
0.07570987, 1.878029, 0.4711104, 0, 0.7843137, 1, 1,
0.077808, -0.3525676, 4.117454, 0, 0.7764706, 1, 1,
0.07800876, 0.04573095, 2.023754, 0, 0.772549, 1, 1,
0.07835739, 1.651829, -0.9075507, 0, 0.7647059, 1, 1,
0.07901058, 0.3290519, 0.08876682, 0, 0.7607843, 1, 1,
0.07931627, -0.2913756, 5.050566, 0, 0.7529412, 1, 1,
0.08369459, 0.06150188, 1.905964, 0, 0.7490196, 1, 1,
0.08719824, 1.107237, -0.526987, 0, 0.7411765, 1, 1,
0.08802746, -1.808789, 2.052382, 0, 0.7372549, 1, 1,
0.08809277, -0.5042267, 1.552924, 0, 0.7294118, 1, 1,
0.08900314, 0.3808053, -0.673525, 0, 0.7254902, 1, 1,
0.09247499, -1.382838, 1.420379, 0, 0.7176471, 1, 1,
0.0951953, 0.2845398, -0.5012468, 0, 0.7137255, 1, 1,
0.09644369, -2.977479, 3.677638, 0, 0.7058824, 1, 1,
0.09927989, -0.3940216, 3.472176, 0, 0.6980392, 1, 1,
0.1018771, -0.5543233, 2.025433, 0, 0.6941177, 1, 1,
0.1021313, -0.6020426, 4.279476, 0, 0.6862745, 1, 1,
0.1035204, 0.7289819, -0.5477788, 0, 0.682353, 1, 1,
0.1104749, 1.776673, 1.598569, 0, 0.6745098, 1, 1,
0.110679, -0.6408575, 4.29217, 0, 0.6705883, 1, 1,
0.1111519, -0.6526612, 2.605274, 0, 0.6627451, 1, 1,
0.1153934, 0.65662, 1.213774, 0, 0.6588235, 1, 1,
0.1206907, -0.8283587, 2.609311, 0, 0.6509804, 1, 1,
0.1230387, 0.3312567, 1.089234, 0, 0.6470588, 1, 1,
0.1270453, 0.09897142, 2.270426, 0, 0.6392157, 1, 1,
0.1288642, 2.252329, -0.1922432, 0, 0.6352941, 1, 1,
0.1306577, -0.4369829, 3.69618, 0, 0.627451, 1, 1,
0.1324453, -0.2592081, 3.434204, 0, 0.6235294, 1, 1,
0.1328332, 1.359239, -1.877975, 0, 0.6156863, 1, 1,
0.1351971, 0.1986635, 0.783609, 0, 0.6117647, 1, 1,
0.1363334, -1.419758, 2.409855, 0, 0.6039216, 1, 1,
0.1384154, 0.1783261, -0.8440623, 0, 0.5960785, 1, 1,
0.141152, -0.9103484, 2.931554, 0, 0.5921569, 1, 1,
0.1489182, 0.06099235, 2.358811, 0, 0.5843138, 1, 1,
0.1518943, 2.360631, -0.04685871, 0, 0.5803922, 1, 1,
0.1607226, -0.5339028, 4.682298, 0, 0.572549, 1, 1,
0.1611949, 1.292375, 0.7186963, 0, 0.5686275, 1, 1,
0.1628331, -1.498928, 3.461063, 0, 0.5607843, 1, 1,
0.1642531, 0.8320653, 1.093829, 0, 0.5568628, 1, 1,
0.165393, 1.479426, 1.648978, 0, 0.5490196, 1, 1,
0.1693367, -1.422831, 1.915931, 0, 0.5450981, 1, 1,
0.1695198, -0.2419998, 4.1738, 0, 0.5372549, 1, 1,
0.1759076, -1.225595, 3.793349, 0, 0.5333334, 1, 1,
0.1767105, 1.420448, -1.722103, 0, 0.5254902, 1, 1,
0.1780238, -0.3161908, 1.057676, 0, 0.5215687, 1, 1,
0.1807003, -0.2716134, 3.085912, 0, 0.5137255, 1, 1,
0.1833501, -0.5459038, 3.940976, 0, 0.509804, 1, 1,
0.1872905, -0.08462012, 3.77141, 0, 0.5019608, 1, 1,
0.1877198, -0.1278234, 2.512596, 0, 0.4941176, 1, 1,
0.187849, -0.3253609, 2.09512, 0, 0.4901961, 1, 1,
0.1878875, -1.908359, 2.326794, 0, 0.4823529, 1, 1,
0.1890043, -0.04583232, 2.481447, 0, 0.4784314, 1, 1,
0.1896353, 0.9777967, 0.2111595, 0, 0.4705882, 1, 1,
0.1923914, -0.1232039, 2.708239, 0, 0.4666667, 1, 1,
0.1954251, 1.272776, 0.3468422, 0, 0.4588235, 1, 1,
0.198732, -0.6097692, 2.362635, 0, 0.454902, 1, 1,
0.1998506, 0.5973315, 0.01533677, 0, 0.4470588, 1, 1,
0.2034679, -0.3604995, 2.952735, 0, 0.4431373, 1, 1,
0.2038553, -1.323514, 3.788337, 0, 0.4352941, 1, 1,
0.2114337, 1.161427, -0.8065417, 0, 0.4313726, 1, 1,
0.2157104, -1.346789, 2.57269, 0, 0.4235294, 1, 1,
0.2165291, 0.1392676, 1.213142, 0, 0.4196078, 1, 1,
0.216899, 0.1963618, -0.3243034, 0, 0.4117647, 1, 1,
0.217419, 0.5795527, 0.5912863, 0, 0.4078431, 1, 1,
0.2186899, -0.9214985, 3.424022, 0, 0.4, 1, 1,
0.2203768, -1.427353, 1.908066, 0, 0.3921569, 1, 1,
0.2227353, -0.7629109, 3.889292, 0, 0.3882353, 1, 1,
0.2266069, -0.3646987, 3.80028, 0, 0.3803922, 1, 1,
0.2288568, -0.7847307, 5.359788, 0, 0.3764706, 1, 1,
0.238601, -0.8550546, 3.170247, 0, 0.3686275, 1, 1,
0.2460712, -1.23855, 1.600134, 0, 0.3647059, 1, 1,
0.2474429, 0.1857274, -0.4809187, 0, 0.3568628, 1, 1,
0.2519715, -0.3457583, 1.588567, 0, 0.3529412, 1, 1,
0.253356, 0.851378, -0.4336624, 0, 0.345098, 1, 1,
0.2666249, 2.0127, 0.2112046, 0, 0.3411765, 1, 1,
0.2736578, 2.02663, 0.7435246, 0, 0.3333333, 1, 1,
0.2744649, 1.461226, 0.3994704, 0, 0.3294118, 1, 1,
0.2762463, 1.478874, 1.001487, 0, 0.3215686, 1, 1,
0.2812074, -0.8654654, 3.428005, 0, 0.3176471, 1, 1,
0.2816746, -1.062831, 2.25448, 0, 0.3098039, 1, 1,
0.2841494, -1.252022, 3.025576, 0, 0.3058824, 1, 1,
0.2879936, 0.3164058, 3.011701, 0, 0.2980392, 1, 1,
0.2880502, -0.7773341, 2.307472, 0, 0.2901961, 1, 1,
0.2927598, 2.067254, -0.6323138, 0, 0.2862745, 1, 1,
0.2945227, -1.361041, 2.98985, 0, 0.2784314, 1, 1,
0.2974276, 0.06348963, 1.346228, 0, 0.2745098, 1, 1,
0.3010789, 0.1473529, 1.418067, 0, 0.2666667, 1, 1,
0.3016444, 0.6495363, -0.2159771, 0, 0.2627451, 1, 1,
0.3092377, -0.2540963, 1.983997, 0, 0.254902, 1, 1,
0.3104726, 0.5204204, 0.2211943, 0, 0.2509804, 1, 1,
0.3150736, 1.118358, 0.4657791, 0, 0.2431373, 1, 1,
0.3161617, 2.161973, 0.9451881, 0, 0.2392157, 1, 1,
0.3205466, 0.5739673, 0.09524146, 0, 0.2313726, 1, 1,
0.3281725, -0.4818825, 2.886167, 0, 0.227451, 1, 1,
0.3290794, -0.7824829, 4.846506, 0, 0.2196078, 1, 1,
0.3352179, -1.148042, 2.187415, 0, 0.2156863, 1, 1,
0.3381694, -0.6951275, 3.858578, 0, 0.2078431, 1, 1,
0.3420026, -0.158005, 3.777442, 0, 0.2039216, 1, 1,
0.3449681, -0.9308628, 2.697431, 0, 0.1960784, 1, 1,
0.34832, 0.8800442, 0.7273982, 0, 0.1882353, 1, 1,
0.3497433, -0.2300054, 1.892542, 0, 0.1843137, 1, 1,
0.3505895, -0.5787342, 2.395584, 0, 0.1764706, 1, 1,
0.3575149, 1.148183, -1.01893, 0, 0.172549, 1, 1,
0.3604661, -0.460685, 2.520522, 0, 0.1647059, 1, 1,
0.3628431, 1.981001, -1.911945, 0, 0.1607843, 1, 1,
0.3691847, -1.972577, 1.487368, 0, 0.1529412, 1, 1,
0.3741401, 2.078202, 0.7327341, 0, 0.1490196, 1, 1,
0.3783926, 1.971314, -0.8739841, 0, 0.1411765, 1, 1,
0.3818608, 0.03621885, 0.3240541, 0, 0.1372549, 1, 1,
0.3818936, -0.9818237, 3.874822, 0, 0.1294118, 1, 1,
0.3835387, -1.387766, 6.444138, 0, 0.1254902, 1, 1,
0.3851501, 1.54172, 2.231469, 0, 0.1176471, 1, 1,
0.3899084, 1.076367, 2.226874, 0, 0.1137255, 1, 1,
0.3963833, 0.6807011, 1.317943, 0, 0.1058824, 1, 1,
0.3967178, 0.07005943, 2.257318, 0, 0.09803922, 1, 1,
0.3970948, -0.7120669, 2.983832, 0, 0.09411765, 1, 1,
0.3998334, 0.9185575, 0.2188343, 0, 0.08627451, 1, 1,
0.4039581, 1.854565, -0.5728076, 0, 0.08235294, 1, 1,
0.4054078, -0.4132978, 4.706662, 0, 0.07450981, 1, 1,
0.4067108, 0.6912656, 0.561723, 0, 0.07058824, 1, 1,
0.4097837, -0.1676546, 2.24486, 0, 0.0627451, 1, 1,
0.4121284, -0.352807, 1.324748, 0, 0.05882353, 1, 1,
0.4122663, -1.539574, 4.247152, 0, 0.05098039, 1, 1,
0.4128475, 1.588767, -0.3919561, 0, 0.04705882, 1, 1,
0.413221, 1.279519, -0.8731204, 0, 0.03921569, 1, 1,
0.417824, 1.002946, -1.249627, 0, 0.03529412, 1, 1,
0.4208938, -0.6976313, 1.316354, 0, 0.02745098, 1, 1,
0.4224645, -0.4085808, 3.102368, 0, 0.02352941, 1, 1,
0.4243222, 0.9512771, 0.962394, 0, 0.01568628, 1, 1,
0.4261344, 0.915954, -0.09267162, 0, 0.01176471, 1, 1,
0.4289749, -1.843634, 2.292049, 0, 0.003921569, 1, 1,
0.4394294, -0.2039679, 1.885208, 0.003921569, 0, 1, 1,
0.4406157, 1.154652, -0.4513968, 0.007843138, 0, 1, 1,
0.4421969, 0.2255517, 0.9813206, 0.01568628, 0, 1, 1,
0.4423368, 1.271289, 1.649678, 0.01960784, 0, 1, 1,
0.4498768, 0.8961874, 1.05422, 0.02745098, 0, 1, 1,
0.4590408, -0.1968466, 3.048874, 0.03137255, 0, 1, 1,
0.4613373, 1.751377, 1.83024, 0.03921569, 0, 1, 1,
0.4652567, -0.3392943, 1.001493, 0.04313726, 0, 1, 1,
0.4708246, -1.061679, 2.973463, 0.05098039, 0, 1, 1,
0.4743387, -0.5889479, 2.759936, 0.05490196, 0, 1, 1,
0.478019, 0.1802407, 0.8264409, 0.0627451, 0, 1, 1,
0.4798491, -1.319273, 2.991803, 0.06666667, 0, 1, 1,
0.4800124, -0.8495314, 2.656077, 0.07450981, 0, 1, 1,
0.4842027, -1.30375, 2.967087, 0.07843138, 0, 1, 1,
0.4855906, -0.0379409, 0.5792329, 0.08627451, 0, 1, 1,
0.4859223, 1.012687, 1.353201, 0.09019608, 0, 1, 1,
0.492264, -1.105883, 3.764502, 0.09803922, 0, 1, 1,
0.4925936, 0.177461, 0.3562859, 0.1058824, 0, 1, 1,
0.4948407, -2.50886, 3.125833, 0.1098039, 0, 1, 1,
0.4982223, 0.2578158, 2.662669, 0.1176471, 0, 1, 1,
0.5004199, -1.241081, 1.45328, 0.1215686, 0, 1, 1,
0.5008433, 0.1199758, -0.6102175, 0.1294118, 0, 1, 1,
0.5059698, -1.184489, 2.603639, 0.1333333, 0, 1, 1,
0.5070919, 1.314621, 0.5500663, 0.1411765, 0, 1, 1,
0.51314, 0.8399053, -0.04898202, 0.145098, 0, 1, 1,
0.5192031, -0.7871574, 3.783342, 0.1529412, 0, 1, 1,
0.5199005, 0.03850763, 0.07440832, 0.1568628, 0, 1, 1,
0.5230128, 0.2701838, 0.04254275, 0.1647059, 0, 1, 1,
0.5306857, 0.7798222, 0.6944547, 0.1686275, 0, 1, 1,
0.5322041, 1.329791, 1.582552, 0.1764706, 0, 1, 1,
0.532764, -0.1643424, 1.435926, 0.1803922, 0, 1, 1,
0.5393804, 0.6173849, 2.775092, 0.1882353, 0, 1, 1,
0.5406014, -0.6889824, 1.94162, 0.1921569, 0, 1, 1,
0.5411978, 0.9428464, 1.779549, 0.2, 0, 1, 1,
0.5474607, 0.5863525, 3.931727, 0.2078431, 0, 1, 1,
0.548727, -2.87136, 3.288724, 0.2117647, 0, 1, 1,
0.554431, -1.126153, 3.035391, 0.2196078, 0, 1, 1,
0.557663, -0.8494214, 1.732278, 0.2235294, 0, 1, 1,
0.5614237, 0.2156472, 2.222528, 0.2313726, 0, 1, 1,
0.5620438, -0.87691, 3.048671, 0.2352941, 0, 1, 1,
0.5658963, -0.5747481, 1.003384, 0.2431373, 0, 1, 1,
0.5661486, -0.7645776, 2.394447, 0.2470588, 0, 1, 1,
0.5703459, -1.678938, 2.213503, 0.254902, 0, 1, 1,
0.5714149, -0.9347351, 1.355144, 0.2588235, 0, 1, 1,
0.577693, 0.7682545, -1.332034, 0.2666667, 0, 1, 1,
0.5778099, -0.5888853, 1.652987, 0.2705882, 0, 1, 1,
0.5778483, -0.1186542, 2.291399, 0.2784314, 0, 1, 1,
0.5787115, 1.174252, 1.39135, 0.282353, 0, 1, 1,
0.5788097, 2.620583, 0.942898, 0.2901961, 0, 1, 1,
0.5933623, 0.1952932, 0.5773234, 0.2941177, 0, 1, 1,
0.6042321, -1.967026, 3.831868, 0.3019608, 0, 1, 1,
0.6064309, 1.70614, 0.9087022, 0.3098039, 0, 1, 1,
0.6069024, 0.4588891, 2.818038, 0.3137255, 0, 1, 1,
0.6084832, 0.5621573, -0.1277319, 0.3215686, 0, 1, 1,
0.610465, 1.110566, -2.112649, 0.3254902, 0, 1, 1,
0.6119139, 1.100152, 1.205306, 0.3333333, 0, 1, 1,
0.6123236, -0.3557229, 3.223073, 0.3372549, 0, 1, 1,
0.6129683, -1.264035, 3.696342, 0.345098, 0, 1, 1,
0.6162684, 0.4184293, 0.4941529, 0.3490196, 0, 1, 1,
0.6169932, -0.7787678, 1.865952, 0.3568628, 0, 1, 1,
0.623049, -0.6721954, 2.210628, 0.3607843, 0, 1, 1,
0.6236588, 0.7122121, 0.1554337, 0.3686275, 0, 1, 1,
0.6240551, -0.8376098, 1.749063, 0.372549, 0, 1, 1,
0.6316732, 0.9517345, 1.765585, 0.3803922, 0, 1, 1,
0.634998, 0.07675376, 0.08039539, 0.3843137, 0, 1, 1,
0.6360873, -1.990385, 1.871735, 0.3921569, 0, 1, 1,
0.6374788, -0.2850576, 2.189737, 0.3960784, 0, 1, 1,
0.6379714, -0.0275469, 2.134632, 0.4039216, 0, 1, 1,
0.6393938, 0.05009976, 2.334681, 0.4117647, 0, 1, 1,
0.640343, 0.2867452, 1.743951, 0.4156863, 0, 1, 1,
0.6427403, 0.09503306, 1.627834, 0.4235294, 0, 1, 1,
0.6472862, 0.04889245, 1.922402, 0.427451, 0, 1, 1,
0.6476945, 0.5344809, 1.077841, 0.4352941, 0, 1, 1,
0.6513748, -2.149323, 2.866834, 0.4392157, 0, 1, 1,
0.6527825, 1.877794, 0.3785314, 0.4470588, 0, 1, 1,
0.6549191, -1.533071, 2.8604, 0.4509804, 0, 1, 1,
0.6582917, -0.9916972, 2.891505, 0.4588235, 0, 1, 1,
0.6613398, -1.074891, 3.799695, 0.4627451, 0, 1, 1,
0.6642582, -0.0693965, 1.10841, 0.4705882, 0, 1, 1,
0.668334, -0.05462391, 3.287059, 0.4745098, 0, 1, 1,
0.6695683, 0.709358, -1.138828, 0.4823529, 0, 1, 1,
0.6710377, 1.38302, 1.93936, 0.4862745, 0, 1, 1,
0.6727237, -1.283284, 2.156367, 0.4941176, 0, 1, 1,
0.6778459, 0.9871743, 1.734427, 0.5019608, 0, 1, 1,
0.6825384, 0.2060318, 2.720429, 0.5058824, 0, 1, 1,
0.6855336, -0.1494964, 1.751395, 0.5137255, 0, 1, 1,
0.6893452, 0.6507112, -0.3201894, 0.5176471, 0, 1, 1,
0.6915172, -0.4399823, 3.617608, 0.5254902, 0, 1, 1,
0.6934431, -0.4436925, 2.246811, 0.5294118, 0, 1, 1,
0.6979674, 0.382406, 0.3640098, 0.5372549, 0, 1, 1,
0.7004547, -0.7406034, 2.735978, 0.5411765, 0, 1, 1,
0.7005693, 0.6507267, 2.843401, 0.5490196, 0, 1, 1,
0.7024288, -0.1638094, 1.441127, 0.5529412, 0, 1, 1,
0.7048821, -0.6762277, 2.075609, 0.5607843, 0, 1, 1,
0.7106271, -0.6088066, 2.513261, 0.5647059, 0, 1, 1,
0.7143108, -2.131222, 2.101968, 0.572549, 0, 1, 1,
0.7152231, 0.6773691, -0.1532477, 0.5764706, 0, 1, 1,
0.7249455, -0.1768464, 1.371885, 0.5843138, 0, 1, 1,
0.725884, 0.084782, 2.976901, 0.5882353, 0, 1, 1,
0.7270386, -0.4477321, 1.435683, 0.5960785, 0, 1, 1,
0.7299576, 0.8599486, 3.191692, 0.6039216, 0, 1, 1,
0.7390129, 0.1319814, 1.007178, 0.6078432, 0, 1, 1,
0.7433978, -0.7723455, 3.027806, 0.6156863, 0, 1, 1,
0.7466314, -0.1136604, 2.636684, 0.6196079, 0, 1, 1,
0.7521552, -0.2391873, 1.729213, 0.627451, 0, 1, 1,
0.7524012, 0.3187555, -0.8809437, 0.6313726, 0, 1, 1,
0.7538767, 1.465141, 1.630086, 0.6392157, 0, 1, 1,
0.7542856, -0.840237, 3.295006, 0.6431373, 0, 1, 1,
0.757011, -0.6966575, 2.291583, 0.6509804, 0, 1, 1,
0.7584324, -0.7416176, 2.297958, 0.654902, 0, 1, 1,
0.7642275, -1.837968, 3.145713, 0.6627451, 0, 1, 1,
0.7681415, -0.5547659, 0.2630165, 0.6666667, 0, 1, 1,
0.7703125, 2.143792, 1.488982, 0.6745098, 0, 1, 1,
0.7706316, -0.9373103, 1.308418, 0.6784314, 0, 1, 1,
0.7762706, 0.2011972, 2.190823, 0.6862745, 0, 1, 1,
0.7763091, -0.2631111, 0.718268, 0.6901961, 0, 1, 1,
0.7804382, 0.7991574, 0.5008935, 0.6980392, 0, 1, 1,
0.7847493, 0.6892679, 1.92707, 0.7058824, 0, 1, 1,
0.7850662, 0.2312157, 1.762808, 0.7098039, 0, 1, 1,
0.7950909, 0.6609192, 0.7714002, 0.7176471, 0, 1, 1,
0.8017563, 0.115094, 0.1078866, 0.7215686, 0, 1, 1,
0.8043706, 1.054806, 1.438317, 0.7294118, 0, 1, 1,
0.8138511, -0.7936192, 3.941091, 0.7333333, 0, 1, 1,
0.8150041, -0.09687012, 2.086405, 0.7411765, 0, 1, 1,
0.8197958, 0.09968963, 0.8714523, 0.7450981, 0, 1, 1,
0.8213894, -1.214415, 1.130241, 0.7529412, 0, 1, 1,
0.8250399, 0.3810789, 1.688051, 0.7568628, 0, 1, 1,
0.8278846, -0.1130565, 2.840968, 0.7647059, 0, 1, 1,
0.8306237, -0.02766148, 0.1956644, 0.7686275, 0, 1, 1,
0.8341865, -0.6198314, 2.546117, 0.7764706, 0, 1, 1,
0.8376173, -0.1250305, 1.399985, 0.7803922, 0, 1, 1,
0.8395144, -0.6785128, 3.698488, 0.7882353, 0, 1, 1,
0.8450215, -1.151405, 0.03231554, 0.7921569, 0, 1, 1,
0.8455778, 1.974568, 0.7699879, 0.8, 0, 1, 1,
0.8456171, 2.248428, -0.7551165, 0.8078431, 0, 1, 1,
0.8552759, 2.798591, -0.3076526, 0.8117647, 0, 1, 1,
0.8580516, -0.6174893, 1.905054, 0.8196079, 0, 1, 1,
0.8626209, 0.1642808, 2.253667, 0.8235294, 0, 1, 1,
0.8683029, -0.3830785, 2.932419, 0.8313726, 0, 1, 1,
0.8689951, 0.7957497, 1.092114, 0.8352941, 0, 1, 1,
0.8716222, 0.01701008, 1.230758, 0.8431373, 0, 1, 1,
0.8756131, 1.985654, 1.144842, 0.8470588, 0, 1, 1,
0.8838097, -1.760082, 2.553256, 0.854902, 0, 1, 1,
0.8842873, 0.4017784, -0.06484356, 0.8588235, 0, 1, 1,
0.8847714, 2.827864, 0.7779089, 0.8666667, 0, 1, 1,
0.8858953, 0.2078806, 1.968016, 0.8705882, 0, 1, 1,
0.8928387, -0.2268777, 5.088979, 0.8784314, 0, 1, 1,
0.8963999, 2.127184, 1.195865, 0.8823529, 0, 1, 1,
0.9010077, 0.1643407, 1.14164, 0.8901961, 0, 1, 1,
0.9051749, -0.1856376, 2.807512, 0.8941177, 0, 1, 1,
0.9063357, 0.8596267, 1.262632, 0.9019608, 0, 1, 1,
0.917412, -3.017565, 5.160267, 0.9098039, 0, 1, 1,
0.9202226, 1.055602, 0.4379767, 0.9137255, 0, 1, 1,
0.9217964, -0.5324107, 0.8127466, 0.9215686, 0, 1, 1,
0.921998, 0.5309985, 0.4267642, 0.9254902, 0, 1, 1,
0.9220827, -0.1772605, 1.734397, 0.9333333, 0, 1, 1,
0.9247434, 0.08781771, 2.534539, 0.9372549, 0, 1, 1,
0.9290539, 0.024055, 0.4038245, 0.945098, 0, 1, 1,
0.9348986, -0.7681221, 3.769024, 0.9490196, 0, 1, 1,
0.9358958, 0.01161911, 1.387967, 0.9568627, 0, 1, 1,
0.9370669, 0.3686543, -0.09181038, 0.9607843, 0, 1, 1,
0.9412972, -0.01049518, 0.8951136, 0.9686275, 0, 1, 1,
0.9430341, 0.05144804, -0.4405521, 0.972549, 0, 1, 1,
0.9432154, -0.1504711, 1.443985, 0.9803922, 0, 1, 1,
0.9447351, -0.2352492, 2.253497, 0.9843137, 0, 1, 1,
0.9517408, 0.4853759, 1.211996, 0.9921569, 0, 1, 1,
0.9586439, -0.1554425, 0.4387522, 0.9960784, 0, 1, 1,
0.9655772, -0.1112276, 1.949594, 1, 0, 0.9960784, 1,
0.9718679, -0.03084563, 1.813956, 1, 0, 0.9882353, 1,
0.979928, 1.787582, 1.233931, 1, 0, 0.9843137, 1,
0.9806401, -1.884637, 3.561616, 1, 0, 0.9764706, 1,
0.9829935, 0.3439122, -0.3333583, 1, 0, 0.972549, 1,
0.9890074, -0.7014073, 2.252761, 1, 0, 0.9647059, 1,
0.9909176, 0.3789319, 1.401567, 1, 0, 0.9607843, 1,
0.9910851, 0.2653303, -1.160855, 1, 0, 0.9529412, 1,
1.003762, 0.3033024, 1.779203, 1, 0, 0.9490196, 1,
1.004553, 0.3041469, 0.7031878, 1, 0, 0.9411765, 1,
1.005991, -0.1883585, 1.711566, 1, 0, 0.9372549, 1,
1.010844, -1.210987, 3.007171, 1, 0, 0.9294118, 1,
1.010856, 0.2094108, 2.526359, 1, 0, 0.9254902, 1,
1.011204, 1.02453, -0.2821967, 1, 0, 0.9176471, 1,
1.011458, -0.8389851, 2.211662, 1, 0, 0.9137255, 1,
1.015661, 1.725489, -0.8609063, 1, 0, 0.9058824, 1,
1.01692, 2.143674, 1.117863, 1, 0, 0.9019608, 1,
1.020942, -0.1803649, 1.593662, 1, 0, 0.8941177, 1,
1.029202, -1.474157, 2.727252, 1, 0, 0.8862745, 1,
1.035616, 0.1657447, 2.675635, 1, 0, 0.8823529, 1,
1.038758, 1.459313, 0.7726395, 1, 0, 0.8745098, 1,
1.042514, 0.3161693, 0.8157738, 1, 0, 0.8705882, 1,
1.052858, -1.008582, 3.11623, 1, 0, 0.8627451, 1,
1.053621, 1.233848, -0.1288141, 1, 0, 0.8588235, 1,
1.058168, -0.4111739, 1.586585, 1, 0, 0.8509804, 1,
1.060815, 0.6730229, 0.3154051, 1, 0, 0.8470588, 1,
1.06089, -0.26714, 2.184336, 1, 0, 0.8392157, 1,
1.06322, -0.5041955, 1.789704, 1, 0, 0.8352941, 1,
1.067224, -0.02497698, 1.32662, 1, 0, 0.827451, 1,
1.070596, 0.1324314, 0.3089641, 1, 0, 0.8235294, 1,
1.071828, -0.8617167, 2.939348, 1, 0, 0.8156863, 1,
1.074868, -0.7119408, 0.7362007, 1, 0, 0.8117647, 1,
1.076875, -1.215073, 0.9639577, 1, 0, 0.8039216, 1,
1.079285, 0.7470094, -0.3360514, 1, 0, 0.7960784, 1,
1.086942, 0.9144303, 1.576007, 1, 0, 0.7921569, 1,
1.088785, 1.273111, 1.673178, 1, 0, 0.7843137, 1,
1.089147, -0.4848077, 1.838986, 1, 0, 0.7803922, 1,
1.093442, 0.004819514, 1.021399, 1, 0, 0.772549, 1,
1.100396, 0.8575947, 0.7589709, 1, 0, 0.7686275, 1,
1.100785, 0.1677438, 1.879555, 1, 0, 0.7607843, 1,
1.103221, 1.440838, 0.2330734, 1, 0, 0.7568628, 1,
1.104034, -1.995605, 0.8361408, 1, 0, 0.7490196, 1,
1.108398, 0.0002462991, 2.329772, 1, 0, 0.7450981, 1,
1.11236, 0.1177228, 1.599167, 1, 0, 0.7372549, 1,
1.113178, 1.176061, 0.4759488, 1, 0, 0.7333333, 1,
1.118084, 0.5117372, 0.6189619, 1, 0, 0.7254902, 1,
1.129246, -0.9521798, 2.664948, 1, 0, 0.7215686, 1,
1.132122, -0.01175177, 1.527704, 1, 0, 0.7137255, 1,
1.145311, 1.989715, -0.5852162, 1, 0, 0.7098039, 1,
1.162051, -0.4640699, 0.9138881, 1, 0, 0.7019608, 1,
1.163666, 1.06606, 2.289109, 1, 0, 0.6941177, 1,
1.163833, 1.273771, 0.02138895, 1, 0, 0.6901961, 1,
1.163949, -0.5943473, -0.3712052, 1, 0, 0.682353, 1,
1.181722, 0.1346826, 1.161389, 1, 0, 0.6784314, 1,
1.181974, -1.051765, 1.530915, 1, 0, 0.6705883, 1,
1.184592, -0.06532346, 0.9245512, 1, 0, 0.6666667, 1,
1.197155, 0.7517369, 0.8071454, 1, 0, 0.6588235, 1,
1.203878, -1.078047, 1.755304, 1, 0, 0.654902, 1,
1.205325, -0.6855991, 3.021222, 1, 0, 0.6470588, 1,
1.214719, 0.03863785, 1.085898, 1, 0, 0.6431373, 1,
1.216961, -1.131763, 3.057025, 1, 0, 0.6352941, 1,
1.218455, -0.6355425, 2.700332, 1, 0, 0.6313726, 1,
1.22845, -0.8852701, 1.526259, 1, 0, 0.6235294, 1,
1.232108, 0.3924518, -0.7556806, 1, 0, 0.6196079, 1,
1.238745, -0.3431014, 0.421136, 1, 0, 0.6117647, 1,
1.244338, 0.7336121, 1.34523, 1, 0, 0.6078432, 1,
1.252252, 0.5973865, 1.724721, 1, 0, 0.6, 1,
1.257414, -0.02055652, 2.415945, 1, 0, 0.5921569, 1,
1.260464, 1.564471, 1.443739, 1, 0, 0.5882353, 1,
1.262574, -0.115696, 2.459121, 1, 0, 0.5803922, 1,
1.280216, -0.9003573, 2.977243, 1, 0, 0.5764706, 1,
1.290346, -1.101478, 3.253376, 1, 0, 0.5686275, 1,
1.295361, -0.207894, 2.54252, 1, 0, 0.5647059, 1,
1.321496, -0.4556826, 2.854171, 1, 0, 0.5568628, 1,
1.325045, -0.02450755, 3.578126, 1, 0, 0.5529412, 1,
1.334698, 0.0552759, 0.7932965, 1, 0, 0.5450981, 1,
1.336403, -0.5173707, 1.892602, 1, 0, 0.5411765, 1,
1.344366, -0.09865177, 2.000957, 1, 0, 0.5333334, 1,
1.344814, 1.012351, -0.05601671, 1, 0, 0.5294118, 1,
1.350445, 0.4217713, 0.9882426, 1, 0, 0.5215687, 1,
1.35112, -0.05649505, -0.7902638, 1, 0, 0.5176471, 1,
1.35238, 0.005089896, 1.299961, 1, 0, 0.509804, 1,
1.362116, -0.3957843, 1.094868, 1, 0, 0.5058824, 1,
1.367639, 0.3509926, -1.009942, 1, 0, 0.4980392, 1,
1.394951, 0.2609365, 3.032813, 1, 0, 0.4901961, 1,
1.396228, -0.3009945, 1.672005, 1, 0, 0.4862745, 1,
1.398356, -1.342021, 2.922425, 1, 0, 0.4784314, 1,
1.399338, 0.07974538, -0.4429057, 1, 0, 0.4745098, 1,
1.404475, -0.2348499, 2.788474, 1, 0, 0.4666667, 1,
1.421871, 0.3289679, 2.026953, 1, 0, 0.4627451, 1,
1.436114, -1.7196, 2.579183, 1, 0, 0.454902, 1,
1.44635, 1.104889, 1.351057, 1, 0, 0.4509804, 1,
1.458558, -1.690657, 2.499478, 1, 0, 0.4431373, 1,
1.465673, -0.4274418, 2.559418, 1, 0, 0.4392157, 1,
1.467821, -0.6537159, 1.598338, 1, 0, 0.4313726, 1,
1.475053, 2.780451, -0.2166697, 1, 0, 0.427451, 1,
1.486472, 2.020769, 1.395867, 1, 0, 0.4196078, 1,
1.49245, -0.8496461, 2.146942, 1, 0, 0.4156863, 1,
1.508962, -0.4430927, 3.035737, 1, 0, 0.4078431, 1,
1.516505, 0.1088897, 0.4706009, 1, 0, 0.4039216, 1,
1.522017, -0.882542, 3.136398, 1, 0, 0.3960784, 1,
1.536617, -2.821552, 3.243801, 1, 0, 0.3882353, 1,
1.542767, -1.159995, 1.34966, 1, 0, 0.3843137, 1,
1.561073, -0.2465628, 2.053397, 1, 0, 0.3764706, 1,
1.579546, -0.3084404, 2.375366, 1, 0, 0.372549, 1,
1.580745, -1.320307, 3.060067, 1, 0, 0.3647059, 1,
1.586323, -1.501419, 2.769199, 1, 0, 0.3607843, 1,
1.590608, 0.3383133, -0.1420324, 1, 0, 0.3529412, 1,
1.595727, 0.6576959, 1.147324, 1, 0, 0.3490196, 1,
1.596232, -0.28464, 1.069153, 1, 0, 0.3411765, 1,
1.5998, -0.5910454, 3.70046, 1, 0, 0.3372549, 1,
1.601749, -1.007361, 2.266668, 1, 0, 0.3294118, 1,
1.605324, -1.049165, 2.281175, 1, 0, 0.3254902, 1,
1.625544, -1.393583, 3.690742, 1, 0, 0.3176471, 1,
1.640663, 0.4587593, 2.264703, 1, 0, 0.3137255, 1,
1.650823, -0.3836253, 1.181903, 1, 0, 0.3058824, 1,
1.653014, -0.1001826, 1.563716, 1, 0, 0.2980392, 1,
1.653893, -0.2651153, -0.1213319, 1, 0, 0.2941177, 1,
1.661927, 2.02588, 0.2470679, 1, 0, 0.2862745, 1,
1.672787, 0.06122196, 1.218745, 1, 0, 0.282353, 1,
1.695048, -1.375299, 2.051839, 1, 0, 0.2745098, 1,
1.713534, 1.1693, 1.660063, 1, 0, 0.2705882, 1,
1.740147, 0.9955267, 2.5821, 1, 0, 0.2627451, 1,
1.751944, 0.4986316, 0.6598664, 1, 0, 0.2588235, 1,
1.752149, -1.406283, 2.720064, 1, 0, 0.2509804, 1,
1.761413, -0.003924222, 1.19301, 1, 0, 0.2470588, 1,
1.762048, 1.051107, 0.498786, 1, 0, 0.2392157, 1,
1.77552, 0.5044068, 1.260451, 1, 0, 0.2352941, 1,
1.775717, -0.3797977, 1.116683, 1, 0, 0.227451, 1,
1.776412, 0.6831663, 4.146628, 1, 0, 0.2235294, 1,
1.782297, -0.7152103, 2.521855, 1, 0, 0.2156863, 1,
1.800355, -0.3889322, 1.497596, 1, 0, 0.2117647, 1,
1.821113, 0.5113363, 1.53446, 1, 0, 0.2039216, 1,
1.830482, -1.529148, 2.574014, 1, 0, 0.1960784, 1,
1.831517, 0.987437, 1.084657, 1, 0, 0.1921569, 1,
1.855391, 0.2351903, 0.2345017, 1, 0, 0.1843137, 1,
1.869067, 1.187977, 2.251412, 1, 0, 0.1803922, 1,
1.869073, -0.9663595, 2.573235, 1, 0, 0.172549, 1,
1.880747, -1.575854, 1.856262, 1, 0, 0.1686275, 1,
1.898529, 1.846547, 0.919664, 1, 0, 0.1607843, 1,
1.906765, -0.4357584, 1.174351, 1, 0, 0.1568628, 1,
1.935832, -1.365348, 2.199601, 1, 0, 0.1490196, 1,
1.978022, -1.000248, 0.5940922, 1, 0, 0.145098, 1,
1.997281, 0.8534948, 0.9329905, 1, 0, 0.1372549, 1,
1.998078, 0.8229024, -0.83342, 1, 0, 0.1333333, 1,
2.008965, -0.7439194, 2.406264, 1, 0, 0.1254902, 1,
2.017602, -1.694672, 1.45307, 1, 0, 0.1215686, 1,
2.042428, 0.01800989, 0.7292576, 1, 0, 0.1137255, 1,
2.060508, 0.6266991, 0.9463582, 1, 0, 0.1098039, 1,
2.06242, 0.9784624, -1.121737, 1, 0, 0.1019608, 1,
2.072601, 0.279544, 2.034312, 1, 0, 0.09411765, 1,
2.092355, -1.017958, 1.545322, 1, 0, 0.09019608, 1,
2.134366, -1.012232, 1.428067, 1, 0, 0.08235294, 1,
2.138866, 0.627113, 1.386935, 1, 0, 0.07843138, 1,
2.164499, 0.4859404, -0.2051672, 1, 0, 0.07058824, 1,
2.190014, 0.6200591, 1.286212, 1, 0, 0.06666667, 1,
2.213439, -1.424282, -0.1807724, 1, 0, 0.05882353, 1,
2.308362, 0.3737849, 2.328802, 1, 0, 0.05490196, 1,
2.316255, -2.530006, 3.073756, 1, 0, 0.04705882, 1,
2.336838, 0.5116954, 1.252247, 1, 0, 0.04313726, 1,
2.437796, 1.0698, 0.1729105, 1, 0, 0.03529412, 1,
2.514977, -0.03585649, 3.392034, 1, 0, 0.03137255, 1,
2.519467, 1.681171, 2.778965, 1, 0, 0.02352941, 1,
2.623255, 1.571963, 1.133814, 1, 0, 0.01960784, 1,
2.819652, -0.3611367, 1.723018, 1, 0, 0.01176471, 1,
3.605461, -1.499766, 2.360095, 1, 0, 0.007843138, 1
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
0.1828121, -4.018958, -7.201131, 0, -0.5, 0.5, 0.5,
0.1828121, -4.018958, -7.201131, 1, -0.5, 0.5, 0.5,
0.1828121, -4.018958, -7.201131, 1, 1.5, 0.5, 0.5,
0.1828121, -4.018958, -7.201131, 0, 1.5, 0.5, 0.5
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
-4.400115, -0.06360579, -7.201131, 0, -0.5, 0.5, 0.5,
-4.400115, -0.06360579, -7.201131, 1, -0.5, 0.5, 0.5,
-4.400115, -0.06360579, -7.201131, 1, 1.5, 0.5, 0.5,
-4.400115, -0.06360579, -7.201131, 0, 1.5, 0.5, 0.5
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
-4.400115, -4.018958, 0.6103332, 0, -0.5, 0.5, 0.5,
-4.400115, -4.018958, 0.6103332, 1, -0.5, 0.5, 0.5,
-4.400115, -4.018958, 0.6103332, 1, 1.5, 0.5, 0.5,
-4.400115, -4.018958, 0.6103332, 0, 1.5, 0.5, 0.5
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
-3, -3.106184, -5.398486,
3, -3.106184, -5.398486,
-3, -3.106184, -5.398486,
-3, -3.258313, -5.698927,
-2, -3.106184, -5.398486,
-2, -3.258313, -5.698927,
-1, -3.106184, -5.398486,
-1, -3.258313, -5.698927,
0, -3.106184, -5.398486,
0, -3.258313, -5.698927,
1, -3.106184, -5.398486,
1, -3.258313, -5.698927,
2, -3.106184, -5.398486,
2, -3.258313, -5.698927,
3, -3.106184, -5.398486,
3, -3.258313, -5.698927
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
-3, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
-3, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
-3, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
-3, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5,
-2, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
-2, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
-2, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
-2, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5,
-1, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
-1, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
-1, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
-1, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5,
0, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
0, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
0, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
0, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5,
1, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
1, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
1, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
1, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5,
2, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
2, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
2, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
2, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5,
3, -3.562571, -6.299809, 0, -0.5, 0.5, 0.5,
3, -3.562571, -6.299809, 1, -0.5, 0.5, 0.5,
3, -3.562571, -6.299809, 1, 1.5, 0.5, 0.5,
3, -3.562571, -6.299809, 0, 1.5, 0.5, 0.5
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
-3.342516, -3, -5.398486,
-3.342516, 2, -5.398486,
-3.342516, -3, -5.398486,
-3.518782, -3, -5.698927,
-3.342516, -2, -5.398486,
-3.518782, -2, -5.698927,
-3.342516, -1, -5.398486,
-3.518782, -1, -5.698927,
-3.342516, 0, -5.398486,
-3.518782, 0, -5.698927,
-3.342516, 1, -5.398486,
-3.518782, 1, -5.698927,
-3.342516, 2, -5.398486,
-3.518782, 2, -5.698927
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
-3.871315, -3, -6.299809, 0, -0.5, 0.5, 0.5,
-3.871315, -3, -6.299809, 1, -0.5, 0.5, 0.5,
-3.871315, -3, -6.299809, 1, 1.5, 0.5, 0.5,
-3.871315, -3, -6.299809, 0, 1.5, 0.5, 0.5,
-3.871315, -2, -6.299809, 0, -0.5, 0.5, 0.5,
-3.871315, -2, -6.299809, 1, -0.5, 0.5, 0.5,
-3.871315, -2, -6.299809, 1, 1.5, 0.5, 0.5,
-3.871315, -2, -6.299809, 0, 1.5, 0.5, 0.5,
-3.871315, -1, -6.299809, 0, -0.5, 0.5, 0.5,
-3.871315, -1, -6.299809, 1, -0.5, 0.5, 0.5,
-3.871315, -1, -6.299809, 1, 1.5, 0.5, 0.5,
-3.871315, -1, -6.299809, 0, 1.5, 0.5, 0.5,
-3.871315, 0, -6.299809, 0, -0.5, 0.5, 0.5,
-3.871315, 0, -6.299809, 1, -0.5, 0.5, 0.5,
-3.871315, 0, -6.299809, 1, 1.5, 0.5, 0.5,
-3.871315, 0, -6.299809, 0, 1.5, 0.5, 0.5,
-3.871315, 1, -6.299809, 0, -0.5, 0.5, 0.5,
-3.871315, 1, -6.299809, 1, -0.5, 0.5, 0.5,
-3.871315, 1, -6.299809, 1, 1.5, 0.5, 0.5,
-3.871315, 1, -6.299809, 0, 1.5, 0.5, 0.5,
-3.871315, 2, -6.299809, 0, -0.5, 0.5, 0.5,
-3.871315, 2, -6.299809, 1, -0.5, 0.5, 0.5,
-3.871315, 2, -6.299809, 1, 1.5, 0.5, 0.5,
-3.871315, 2, -6.299809, 0, 1.5, 0.5, 0.5
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
-3.342516, -3.106184, -4,
-3.342516, -3.106184, 6,
-3.342516, -3.106184, -4,
-3.518782, -3.258313, -4,
-3.342516, -3.106184, -2,
-3.518782, -3.258313, -2,
-3.342516, -3.106184, 0,
-3.518782, -3.258313, 0,
-3.342516, -3.106184, 2,
-3.518782, -3.258313, 2,
-3.342516, -3.106184, 4,
-3.518782, -3.258313, 4,
-3.342516, -3.106184, 6,
-3.518782, -3.258313, 6
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
"4",
"6"
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
-3.871315, -3.562571, -4, 0, -0.5, 0.5, 0.5,
-3.871315, -3.562571, -4, 1, -0.5, 0.5, 0.5,
-3.871315, -3.562571, -4, 1, 1.5, 0.5, 0.5,
-3.871315, -3.562571, -4, 0, 1.5, 0.5, 0.5,
-3.871315, -3.562571, -2, 0, -0.5, 0.5, 0.5,
-3.871315, -3.562571, -2, 1, -0.5, 0.5, 0.5,
-3.871315, -3.562571, -2, 1, 1.5, 0.5, 0.5,
-3.871315, -3.562571, -2, 0, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 0, 0, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 0, 1, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 0, 1, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 0, 0, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 2, 0, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 2, 1, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 2, 1, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 2, 0, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 4, 0, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 4, 1, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 4, 1, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 4, 0, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 6, 0, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 6, 1, -0.5, 0.5, 0.5,
-3.871315, -3.562571, 6, 1, 1.5, 0.5, 0.5,
-3.871315, -3.562571, 6, 0, 1.5, 0.5, 0.5
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
-3.342516, -3.106184, -5.398486,
-3.342516, 2.978972, -5.398486,
-3.342516, -3.106184, 6.619152,
-3.342516, 2.978972, 6.619152,
-3.342516, -3.106184, -5.398486,
-3.342516, -3.106184, 6.619152,
-3.342516, 2.978972, -5.398486,
-3.342516, 2.978972, 6.619152,
-3.342516, -3.106184, -5.398486,
3.70814, -3.106184, -5.398486,
-3.342516, -3.106184, 6.619152,
3.70814, -3.106184, 6.619152,
-3.342516, 2.978972, -5.398486,
3.70814, 2.978972, -5.398486,
-3.342516, 2.978972, 6.619152,
3.70814, 2.978972, 6.619152,
3.70814, -3.106184, -5.398486,
3.70814, 2.978972, -5.398486,
3.70814, -3.106184, 6.619152,
3.70814, 2.978972, 6.619152,
3.70814, -3.106184, -5.398486,
3.70814, -3.106184, 6.619152,
3.70814, 2.978972, -5.398486,
3.70814, 2.978972, 6.619152
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
var radius = 8.118692;
var distance = 36.12098;
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
mvMatrix.translate( -0.1828121, 0.06360579, -0.6103332 );
mvMatrix.scale( 1.245003, 1.442541, 0.7304338 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.12098);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


