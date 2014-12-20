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
-3.540195, -0.03374946, -0.8656946, 1, 0, 0, 1,
-3.34889, 0.9292612, -1.110416, 1, 0.007843138, 0, 1,
-3.2309, 0.1044177, -0.4547687, 1, 0.01176471, 0, 1,
-3.163899, 0.5252174, -1.309495, 1, 0.01960784, 0, 1,
-2.781843, 0.5160291, -0.309608, 1, 0.02352941, 0, 1,
-2.741672, -0.2584893, -1.482199, 1, 0.03137255, 0, 1,
-2.554257, 1.472725, -1.690233, 1, 0.03529412, 0, 1,
-2.54568, -0.9106882, -2.200027, 1, 0.04313726, 0, 1,
-2.489124, 0.5821179, -1.012933, 1, 0.04705882, 0, 1,
-2.467989, -0.9138694, -2.810788, 1, 0.05490196, 0, 1,
-2.463902, -0.5473193, -1.475984, 1, 0.05882353, 0, 1,
-2.336948, 1.363938, -0.885064, 1, 0.06666667, 0, 1,
-2.279549, -2.058985, -3.336096, 1, 0.07058824, 0, 1,
-2.27954, -0.4760397, -3.037826, 1, 0.07843138, 0, 1,
-2.187535, -1.27807, -1.29523, 1, 0.08235294, 0, 1,
-2.123576, -0.8729114, -1.612848, 1, 0.09019608, 0, 1,
-2.067279, 0.5295459, 0.7789615, 1, 0.09411765, 0, 1,
-2.060772, -0.3489421, -2.11051, 1, 0.1019608, 0, 1,
-2.050678, 0.809413, 0.5493405, 1, 0.1098039, 0, 1,
-2.01451, -0.3130938, -0.3765675, 1, 0.1137255, 0, 1,
-2.009099, 0.5076285, -0.8611343, 1, 0.1215686, 0, 1,
-1.991401, -1.716948, -2.182063, 1, 0.1254902, 0, 1,
-1.96855, -0.2631425, -1.214649, 1, 0.1333333, 0, 1,
-1.96707, -0.04804957, -1.824165, 1, 0.1372549, 0, 1,
-1.899319, -1.487664, -0.9200618, 1, 0.145098, 0, 1,
-1.864652, -0.3302381, -1.667463, 1, 0.1490196, 0, 1,
-1.842929, -0.5101954, -1.401297, 1, 0.1568628, 0, 1,
-1.840124, 0.875771, -1.73489, 1, 0.1607843, 0, 1,
-1.829069, -0.6525509, -3.053296, 1, 0.1686275, 0, 1,
-1.81912, -1.538502, -3.372493, 1, 0.172549, 0, 1,
-1.81713, 1.662318, 0.6632403, 1, 0.1803922, 0, 1,
-1.816777, 0.9956796, -1.298629, 1, 0.1843137, 0, 1,
-1.799211, -0.07955667, -1.86675, 1, 0.1921569, 0, 1,
-1.796665, 1.720329, 0.1360773, 1, 0.1960784, 0, 1,
-1.764218, 0.7275896, -1.477462, 1, 0.2039216, 0, 1,
-1.753357, 1.957152, -0.8036349, 1, 0.2117647, 0, 1,
-1.752881, -0.1901547, -1.221898, 1, 0.2156863, 0, 1,
-1.738745, 1.65824, 0.5864108, 1, 0.2235294, 0, 1,
-1.732026, -0.8597558, -1.040153, 1, 0.227451, 0, 1,
-1.730998, 0.7087901, -0.4977558, 1, 0.2352941, 0, 1,
-1.705656, 0.7203023, -1.9967, 1, 0.2392157, 0, 1,
-1.705343, -0.5146202, -1.609936, 1, 0.2470588, 0, 1,
-1.698708, -1.745304, -1.229713, 1, 0.2509804, 0, 1,
-1.693567, 2.591295, -1.522928, 1, 0.2588235, 0, 1,
-1.663088, -3.766559, -2.667991, 1, 0.2627451, 0, 1,
-1.653968, 1.080174, 0.02668541, 1, 0.2705882, 0, 1,
-1.652666, -0.2482715, -1.549691, 1, 0.2745098, 0, 1,
-1.649434, 0.5122096, 1.465649, 1, 0.282353, 0, 1,
-1.641931, 0.8190569, -1.930101, 1, 0.2862745, 0, 1,
-1.636937, -0.04875939, -1.513746, 1, 0.2941177, 0, 1,
-1.627047, 0.7413518, 0.006499671, 1, 0.3019608, 0, 1,
-1.620334, 0.4028351, -0.4008185, 1, 0.3058824, 0, 1,
-1.618982, -0.1271695, -0.6781234, 1, 0.3137255, 0, 1,
-1.60232, -0.3548011, -0.7077734, 1, 0.3176471, 0, 1,
-1.58479, 0.1159835, -0.8559195, 1, 0.3254902, 0, 1,
-1.562404, 1.235859, -1.599927, 1, 0.3294118, 0, 1,
-1.553864, 1.162243, -1.392244, 1, 0.3372549, 0, 1,
-1.553053, -1.350788, -0.3153773, 1, 0.3411765, 0, 1,
-1.544925, 0.05268876, -0.4854276, 1, 0.3490196, 0, 1,
-1.53983, 0.4472218, -1.018557, 1, 0.3529412, 0, 1,
-1.53644, -0.3804595, -1.878207, 1, 0.3607843, 0, 1,
-1.535553, 1.213248, -1.645074, 1, 0.3647059, 0, 1,
-1.533578, -0.4683789, -1.972937, 1, 0.372549, 0, 1,
-1.530134, -1.253618, -1.123693, 1, 0.3764706, 0, 1,
-1.524953, -1.248468, -1.372909, 1, 0.3843137, 0, 1,
-1.521514, 0.3068925, -2.324881, 1, 0.3882353, 0, 1,
-1.508072, -0.4521338, -2.905779, 1, 0.3960784, 0, 1,
-1.505702, 0.1841655, -0.8059182, 1, 0.4039216, 0, 1,
-1.481217, -1.144972, -1.035968, 1, 0.4078431, 0, 1,
-1.46629, -1.254402, -3.189564, 1, 0.4156863, 0, 1,
-1.466241, -0.6370775, -2.022123, 1, 0.4196078, 0, 1,
-1.460965, -0.6447383, -3.485026, 1, 0.427451, 0, 1,
-1.457616, -0.4036307, -2.298656, 1, 0.4313726, 0, 1,
-1.456348, 1.456216, -1.113597, 1, 0.4392157, 0, 1,
-1.45364, 0.07568769, -0.9994946, 1, 0.4431373, 0, 1,
-1.444067, -0.2446689, -2.937994, 1, 0.4509804, 0, 1,
-1.440411, -1.091712, -1.486579, 1, 0.454902, 0, 1,
-1.429281, 0.4515823, -2.312758, 1, 0.4627451, 0, 1,
-1.426519, 0.5746524, -2.229862, 1, 0.4666667, 0, 1,
-1.410276, -1.26171, -3.105026, 1, 0.4745098, 0, 1,
-1.407164, 0.8862522, -0.908304, 1, 0.4784314, 0, 1,
-1.397709, -1.2584, -2.940108, 1, 0.4862745, 0, 1,
-1.384691, 1.345553, -0.2805584, 1, 0.4901961, 0, 1,
-1.382733, 0.9755848, -1.154624, 1, 0.4980392, 0, 1,
-1.382581, 0.525607, -1.129742, 1, 0.5058824, 0, 1,
-1.376492, 0.3655489, -1.542899, 1, 0.509804, 0, 1,
-1.370786, 1.712878, -0.0001522382, 1, 0.5176471, 0, 1,
-1.369533, -0.03633684, -0.5931284, 1, 0.5215687, 0, 1,
-1.361083, 0.003667405, -2.216793, 1, 0.5294118, 0, 1,
-1.359013, -1.395044, -0.9290969, 1, 0.5333334, 0, 1,
-1.353533, 1.019514, -0.4769473, 1, 0.5411765, 0, 1,
-1.351382, 0.4816402, -2.190814, 1, 0.5450981, 0, 1,
-1.350925, -0.2464627, -0.8319666, 1, 0.5529412, 0, 1,
-1.349615, -1.660354, -2.934163, 1, 0.5568628, 0, 1,
-1.341668, -1.134867, -1.352858, 1, 0.5647059, 0, 1,
-1.338951, -1.555529, -2.53964, 1, 0.5686275, 0, 1,
-1.327018, 1.413381, -0.4261742, 1, 0.5764706, 0, 1,
-1.323936, 0.2026958, -0.8334421, 1, 0.5803922, 0, 1,
-1.322962, -1.023328, -1.132865, 1, 0.5882353, 0, 1,
-1.320842, -0.3488032, -0.4378485, 1, 0.5921569, 0, 1,
-1.319757, -0.7189302, -3.145851, 1, 0.6, 0, 1,
-1.31523, 0.1049242, -2.528988, 1, 0.6078432, 0, 1,
-1.307505, 0.6075844, 0.4154127, 1, 0.6117647, 0, 1,
-1.306689, -1.381163, -3.053956, 1, 0.6196079, 0, 1,
-1.305959, -0.1943002, -0.4708209, 1, 0.6235294, 0, 1,
-1.297032, -1.331855, -3.114514, 1, 0.6313726, 0, 1,
-1.285756, 0.2673929, -1.395405, 1, 0.6352941, 0, 1,
-1.285293, -1.301152, -3.505715, 1, 0.6431373, 0, 1,
-1.278987, 0.0527757, -2.459457, 1, 0.6470588, 0, 1,
-1.276512, -0.9608473, -3.220388, 1, 0.654902, 0, 1,
-1.273834, -0.001852448, 0.3988671, 1, 0.6588235, 0, 1,
-1.264312, -1.279167, -1.166275, 1, 0.6666667, 0, 1,
-1.261946, 1.410741, -0.05710602, 1, 0.6705883, 0, 1,
-1.260564, 1.305181, 0.4687698, 1, 0.6784314, 0, 1,
-1.248113, -0.3348207, -1.074226, 1, 0.682353, 0, 1,
-1.242112, 1.629524, -1.224928, 1, 0.6901961, 0, 1,
-1.240695, -0.01352498, -3.617415, 1, 0.6941177, 0, 1,
-1.23978, 0.1527659, -2.005002, 1, 0.7019608, 0, 1,
-1.231687, 0.9904947, -0.08154691, 1, 0.7098039, 0, 1,
-1.224549, -0.2234307, -2.967535, 1, 0.7137255, 0, 1,
-1.222561, 2.466718, 2.138928, 1, 0.7215686, 0, 1,
-1.212949, 1.58451, -0.7410017, 1, 0.7254902, 0, 1,
-1.205108, 0.5342935, -1.591577, 1, 0.7333333, 0, 1,
-1.199957, -0.2877212, -2.80298, 1, 0.7372549, 0, 1,
-1.194149, -1.100788, -1.91426, 1, 0.7450981, 0, 1,
-1.192454, -1.300416, -3.271865, 1, 0.7490196, 0, 1,
-1.188949, 1.236642, 0.4409076, 1, 0.7568628, 0, 1,
-1.188368, -0.1349922, -2.221818, 1, 0.7607843, 0, 1,
-1.183958, 0.4445182, -0.3936087, 1, 0.7686275, 0, 1,
-1.182803, 0.2770487, -1.917825, 1, 0.772549, 0, 1,
-1.165515, -0.0955616, -1.389946, 1, 0.7803922, 0, 1,
-1.16322, -0.3261685, 0.2661772, 1, 0.7843137, 0, 1,
-1.161445, -0.8966419, -3.100011, 1, 0.7921569, 0, 1,
-1.159964, 0.06746712, -1.872504, 1, 0.7960784, 0, 1,
-1.158991, 1.241619, 0.3849069, 1, 0.8039216, 0, 1,
-1.149416, 0.1777933, -0.5652528, 1, 0.8117647, 0, 1,
-1.147724, -0.8840815, -2.534315, 1, 0.8156863, 0, 1,
-1.145877, 0.4635804, -3.228834, 1, 0.8235294, 0, 1,
-1.126775, -0.1602025, -1.784959, 1, 0.827451, 0, 1,
-1.120472, -0.7909964, -3.1555, 1, 0.8352941, 0, 1,
-1.109622, -0.0378434, -0.9807146, 1, 0.8392157, 0, 1,
-1.108332, -0.5154084, -2.107514, 1, 0.8470588, 0, 1,
-1.107479, 0.3184909, 0.2489049, 1, 0.8509804, 0, 1,
-1.105338, 0.8000464, 1.450911, 1, 0.8588235, 0, 1,
-1.088808, -0.8452682, -1.526676, 1, 0.8627451, 0, 1,
-1.07914, 1.624568, -1.319973, 1, 0.8705882, 0, 1,
-1.076516, -0.2521514, -1.292097, 1, 0.8745098, 0, 1,
-1.075509, -2.319507, -2.288809, 1, 0.8823529, 0, 1,
-1.066623, 0.563149, -0.6623771, 1, 0.8862745, 0, 1,
-1.065991, -0.1014295, -1.562569, 1, 0.8941177, 0, 1,
-1.062428, -1.144349, -1.654032, 1, 0.8980392, 0, 1,
-1.057266, 0.2229377, -3.245437, 1, 0.9058824, 0, 1,
-1.053922, -0.5244755, -1.152344, 1, 0.9137255, 0, 1,
-1.045956, 1.797814, -2.14824, 1, 0.9176471, 0, 1,
-1.037791, -1.337989, -0.9609162, 1, 0.9254902, 0, 1,
-1.03263, -0.2033165, -2.973468, 1, 0.9294118, 0, 1,
-1.029726, 0.235605, -0.169935, 1, 0.9372549, 0, 1,
-1.023639, 0.5974512, -1.162625, 1, 0.9411765, 0, 1,
-1.023528, -0.5587827, -3.104493, 1, 0.9490196, 0, 1,
-1.019755, -1.122345, -2.132571, 1, 0.9529412, 0, 1,
-1.015102, -0.8653867, -2.281652, 1, 0.9607843, 0, 1,
-1.012158, 0.02703971, -2.330258, 1, 0.9647059, 0, 1,
-1.001783, -0.03191699, -2.641308, 1, 0.972549, 0, 1,
-1.000721, 0.9107398, -0.2650451, 1, 0.9764706, 0, 1,
-0.9968719, -0.603821, 0.9178971, 1, 0.9843137, 0, 1,
-0.9922621, -1.936059, -2.591254, 1, 0.9882353, 0, 1,
-0.9919131, 1.373111, -1.859389, 1, 0.9960784, 0, 1,
-0.9885825, -0.9023329, -2.418921, 0.9960784, 1, 0, 1,
-0.9874007, -0.553812, -2.76685, 0.9921569, 1, 0, 1,
-0.9764288, 0.2430833, -1.359127, 0.9843137, 1, 0, 1,
-0.9743538, 0.2497941, -3.963272, 0.9803922, 1, 0, 1,
-0.9702564, 0.2254597, -0.02882965, 0.972549, 1, 0, 1,
-0.969078, 0.01519783, -0.7331933, 0.9686275, 1, 0, 1,
-0.9625533, 2.331037, 0.4463365, 0.9607843, 1, 0, 1,
-0.9602005, 2.434556, -0.659947, 0.9568627, 1, 0, 1,
-0.9589667, -0.5476594, -1.789039, 0.9490196, 1, 0, 1,
-0.9408711, 2.34468, 1.197606, 0.945098, 1, 0, 1,
-0.9329278, -0.2594655, -0.9983483, 0.9372549, 1, 0, 1,
-0.9264843, -1.06672, -2.567241, 0.9333333, 1, 0, 1,
-0.9254926, 0.3374879, -1.747488, 0.9254902, 1, 0, 1,
-0.9196606, -1.884802, -4.507287, 0.9215686, 1, 0, 1,
-0.9167139, -0.5208138, -1.489463, 0.9137255, 1, 0, 1,
-0.904183, -0.3723757, -1.388707, 0.9098039, 1, 0, 1,
-0.8849859, 0.547703, 1.421906, 0.9019608, 1, 0, 1,
-0.8758015, 0.482452, -2.496473, 0.8941177, 1, 0, 1,
-0.8752975, 0.08626296, -1.67086, 0.8901961, 1, 0, 1,
-0.8738291, 0.8836793, -0.9663647, 0.8823529, 1, 0, 1,
-0.8723521, 0.05428652, -1.755479, 0.8784314, 1, 0, 1,
-0.8715223, 0.8276581, -1.410848, 0.8705882, 1, 0, 1,
-0.869915, 0.1748641, -1.226668, 0.8666667, 1, 0, 1,
-0.8678835, -1.086679, -4.424221, 0.8588235, 1, 0, 1,
-0.8667206, -0.4438412, -2.08067, 0.854902, 1, 0, 1,
-0.846805, -0.2514078, -1.909914, 0.8470588, 1, 0, 1,
-0.8442456, -0.2772476, -2.610248, 0.8431373, 1, 0, 1,
-0.8403766, 1.446202, -2.101022, 0.8352941, 1, 0, 1,
-0.8371463, 1.524152, -1.576596, 0.8313726, 1, 0, 1,
-0.834803, 1.051525, 0.3269749, 0.8235294, 1, 0, 1,
-0.8330965, -2.0971, -2.968704, 0.8196079, 1, 0, 1,
-0.824129, -0.7474046, -3.299325, 0.8117647, 1, 0, 1,
-0.8214029, -0.9932452, -3.86067, 0.8078431, 1, 0, 1,
-0.8207772, 1.330502, 0.5475398, 0.8, 1, 0, 1,
-0.815612, 0.1914773, -0.5877203, 0.7921569, 1, 0, 1,
-0.8077213, 0.3214717, -0.5614496, 0.7882353, 1, 0, 1,
-0.8055223, 0.1260656, -0.03796818, 0.7803922, 1, 0, 1,
-0.8025519, 0.886196, -1.947466, 0.7764706, 1, 0, 1,
-0.7940591, -0.502178, -3.102755, 0.7686275, 1, 0, 1,
-0.7921897, -0.5145904, -2.484065, 0.7647059, 1, 0, 1,
-0.7821764, 0.4548926, -1.819234, 0.7568628, 1, 0, 1,
-0.7802581, -1.086109, -2.667898, 0.7529412, 1, 0, 1,
-0.7745172, -0.04155968, -2.824663, 0.7450981, 1, 0, 1,
-0.7618152, 0.1810147, -2.67638, 0.7411765, 1, 0, 1,
-0.7484095, -0.02342088, -1.851264, 0.7333333, 1, 0, 1,
-0.743508, -0.8029556, -4.745158, 0.7294118, 1, 0, 1,
-0.7355475, 0.2759476, 0.3891307, 0.7215686, 1, 0, 1,
-0.7351389, 1.217873, -0.3731101, 0.7176471, 1, 0, 1,
-0.7338617, -0.1644739, -1.57384, 0.7098039, 1, 0, 1,
-0.7274312, 1.744131, -0.6521986, 0.7058824, 1, 0, 1,
-0.7271953, 1.099967, -0.9818681, 0.6980392, 1, 0, 1,
-0.7264848, 1.833149, -0.8889996, 0.6901961, 1, 0, 1,
-0.7251233, -1.512986, -2.869883, 0.6862745, 1, 0, 1,
-0.7163715, 3.098672, 2.434142, 0.6784314, 1, 0, 1,
-0.7129825, -1.182336, -4.129704, 0.6745098, 1, 0, 1,
-0.7117629, 0.1142648, -1.094564, 0.6666667, 1, 0, 1,
-0.7088127, -0.7195414, -3.161929, 0.6627451, 1, 0, 1,
-0.7071465, -0.5752308, -2.785192, 0.654902, 1, 0, 1,
-0.7054802, 0.1046231, -0.9439107, 0.6509804, 1, 0, 1,
-0.6990626, -0.5673789, -0.6687081, 0.6431373, 1, 0, 1,
-0.6979825, 1.103573, -1.354474, 0.6392157, 1, 0, 1,
-0.6937916, 1.87416, 0.2184958, 0.6313726, 1, 0, 1,
-0.6907273, 0.4180864, -1.016445, 0.627451, 1, 0, 1,
-0.6843725, 0.0342323, -3.902669, 0.6196079, 1, 0, 1,
-0.6814215, -0.4659589, -1.651408, 0.6156863, 1, 0, 1,
-0.6704267, -0.1326482, -2.386842, 0.6078432, 1, 0, 1,
-0.6561352, 0.01055467, -2.346973, 0.6039216, 1, 0, 1,
-0.6529953, 1.309096, -0.1949827, 0.5960785, 1, 0, 1,
-0.6526718, -1.528274, -2.89043, 0.5882353, 1, 0, 1,
-0.6426373, 0.7497811, -0.9124632, 0.5843138, 1, 0, 1,
-0.6417528, 0.01200104, -0.68891, 0.5764706, 1, 0, 1,
-0.6400216, 0.9593512, -0.1687765, 0.572549, 1, 0, 1,
-0.6351106, 0.5811942, -0.299304, 0.5647059, 1, 0, 1,
-0.6274514, 1.105858, -0.874387, 0.5607843, 1, 0, 1,
-0.626564, -0.2288187, -2.956735, 0.5529412, 1, 0, 1,
-0.6260427, 1.659397, 1.03532, 0.5490196, 1, 0, 1,
-0.6257794, 0.4321137, -1.046825, 0.5411765, 1, 0, 1,
-0.6184726, 1.018373, -0.3951747, 0.5372549, 1, 0, 1,
-0.6109738, -0.1338475, -1.690843, 0.5294118, 1, 0, 1,
-0.6011456, 1.328259, -0.2836465, 0.5254902, 1, 0, 1,
-0.6010742, 1.720463, -2.025204, 0.5176471, 1, 0, 1,
-0.599662, -0.9027488, -3.171326, 0.5137255, 1, 0, 1,
-0.5970609, 1.929687, -0.1621846, 0.5058824, 1, 0, 1,
-0.5962117, 0.2237958, -0.7323728, 0.5019608, 1, 0, 1,
-0.5900694, 0.8874122, -0.2332983, 0.4941176, 1, 0, 1,
-0.5876383, -0.4010021, -2.995381, 0.4862745, 1, 0, 1,
-0.583857, 0.5911698, -0.2964975, 0.4823529, 1, 0, 1,
-0.5816113, 1.100793, -0.7201633, 0.4745098, 1, 0, 1,
-0.5810143, -0.0942358, -0.7744107, 0.4705882, 1, 0, 1,
-0.5779441, -0.9397147, -1.86858, 0.4627451, 1, 0, 1,
-0.5771111, 0.06345429, 0.01857889, 0.4588235, 1, 0, 1,
-0.5759484, -0.2042854, -2.505194, 0.4509804, 1, 0, 1,
-0.5756024, 0.2171544, -1.661555, 0.4470588, 1, 0, 1,
-0.5731148, 0.07079029, -3.146586, 0.4392157, 1, 0, 1,
-0.5703112, -0.6466612, -2.097264, 0.4352941, 1, 0, 1,
-0.5682295, -0.8906049, -2.288376, 0.427451, 1, 0, 1,
-0.5653998, 0.9383459, -1.408902, 0.4235294, 1, 0, 1,
-0.5629038, 0.839794, -2.185836, 0.4156863, 1, 0, 1,
-0.5623206, -0.4018908, -2.551232, 0.4117647, 1, 0, 1,
-0.5620123, 1.291925, -0.8056728, 0.4039216, 1, 0, 1,
-0.5488472, -1.391308, -2.298653, 0.3960784, 1, 0, 1,
-0.5440371, -0.8281938, -2.794296, 0.3921569, 1, 0, 1,
-0.5320995, -1.634807, -3.340136, 0.3843137, 1, 0, 1,
-0.529822, 1.541537, 0.6526449, 0.3803922, 1, 0, 1,
-0.5294352, 1.014212, -0.650759, 0.372549, 1, 0, 1,
-0.5286649, -0.1320819, -0.6013597, 0.3686275, 1, 0, 1,
-0.5237326, -0.3530718, -2.793597, 0.3607843, 1, 0, 1,
-0.5105363, 0.3672735, 0.824607, 0.3568628, 1, 0, 1,
-0.5097966, 0.0964137, -1.644018, 0.3490196, 1, 0, 1,
-0.5072871, 0.3984993, 0.7849693, 0.345098, 1, 0, 1,
-0.4987474, -1.127035, -3.130699, 0.3372549, 1, 0, 1,
-0.4957341, 0.927398, -1.261867, 0.3333333, 1, 0, 1,
-0.4931198, -0.8135611, -2.269579, 0.3254902, 1, 0, 1,
-0.4884524, -0.849669, -1.450814, 0.3215686, 1, 0, 1,
-0.4866074, -1.458145, -4.63059, 0.3137255, 1, 0, 1,
-0.4861143, -0.9937496, -3.333338, 0.3098039, 1, 0, 1,
-0.484899, 0.2411261, -0.7231887, 0.3019608, 1, 0, 1,
-0.4842501, 1.107839, -0.5058479, 0.2941177, 1, 0, 1,
-0.4832583, -1.101488, -3.01897, 0.2901961, 1, 0, 1,
-0.481849, 0.4929112, 0.1986827, 0.282353, 1, 0, 1,
-0.477079, 0.4778208, -1.098567, 0.2784314, 1, 0, 1,
-0.4762519, -0.5229723, -2.531721, 0.2705882, 1, 0, 1,
-0.4740886, 1.014428, -1.532805, 0.2666667, 1, 0, 1,
-0.4736075, 0.5858282, -0.01683349, 0.2588235, 1, 0, 1,
-0.4724959, -0.8869585, -3.226825, 0.254902, 1, 0, 1,
-0.467696, 0.8552551, -0.1520633, 0.2470588, 1, 0, 1,
-0.4651404, -0.5927684, -1.932895, 0.2431373, 1, 0, 1,
-0.4615313, 0.7519602, 0.4711153, 0.2352941, 1, 0, 1,
-0.4583986, -0.3110973, -3.746739, 0.2313726, 1, 0, 1,
-0.457644, 0.006980025, -2.228779, 0.2235294, 1, 0, 1,
-0.4570371, 1.34365, 0.06936466, 0.2196078, 1, 0, 1,
-0.4548586, -1.324354, -4.63773, 0.2117647, 1, 0, 1,
-0.4541581, 0.3687426, -0.6449392, 0.2078431, 1, 0, 1,
-0.4488315, -0.7307243, -1.297343, 0.2, 1, 0, 1,
-0.448555, 0.8152547, -0.9024094, 0.1921569, 1, 0, 1,
-0.4477041, 0.6018359, 0.8290557, 0.1882353, 1, 0, 1,
-0.4440488, 0.1524426, -0.8395261, 0.1803922, 1, 0, 1,
-0.4361917, 1.533204, -1.632362, 0.1764706, 1, 0, 1,
-0.4341544, 0.1708382, -2.031377, 0.1686275, 1, 0, 1,
-0.4333126, 0.1055765, -0.6137717, 0.1647059, 1, 0, 1,
-0.4310657, -0.4139305, -1.290812, 0.1568628, 1, 0, 1,
-0.4252762, 0.5077448, -0.6673803, 0.1529412, 1, 0, 1,
-0.4240824, -0.09791137, -1.519137, 0.145098, 1, 0, 1,
-0.4218636, 0.7131987, 0.02652736, 0.1411765, 1, 0, 1,
-0.421679, -0.2180576, -1.123251, 0.1333333, 1, 0, 1,
-0.4205332, 0.100592, -3.528448, 0.1294118, 1, 0, 1,
-0.4198803, 1.02725, -1.397112, 0.1215686, 1, 0, 1,
-0.4196991, -0.2417308, -3.047971, 0.1176471, 1, 0, 1,
-0.4195633, 1.6606, 0.7026156, 0.1098039, 1, 0, 1,
-0.4102553, -0.2043607, -1.289542, 0.1058824, 1, 0, 1,
-0.4100604, 0.2276257, -1.042378, 0.09803922, 1, 0, 1,
-0.4082508, 0.3561379, -2.126474, 0.09019608, 1, 0, 1,
-0.4025092, 1.04813, -0.7583203, 0.08627451, 1, 0, 1,
-0.4013173, 0.5122882, 1.273876, 0.07843138, 1, 0, 1,
-0.3981099, -0.08855917, -0.4780289, 0.07450981, 1, 0, 1,
-0.3916122, 2.092698, -0.01462576, 0.06666667, 1, 0, 1,
-0.3789671, 0.414847, -0.7947534, 0.0627451, 1, 0, 1,
-0.3748786, -1.462345, -0.7113587, 0.05490196, 1, 0, 1,
-0.3726114, 0.07864678, -1.751265, 0.05098039, 1, 0, 1,
-0.3713758, -1.083136, -3.456023, 0.04313726, 1, 0, 1,
-0.369209, 0.9948535, -2.116029, 0.03921569, 1, 0, 1,
-0.3634099, 2.222332, 0.2111481, 0.03137255, 1, 0, 1,
-0.3620093, -1.094717, -1.708562, 0.02745098, 1, 0, 1,
-0.3615555, -0.02477656, 0.4209108, 0.01960784, 1, 0, 1,
-0.3588865, -0.3882802, -1.880382, 0.01568628, 1, 0, 1,
-0.3583255, -1.324282, -3.355909, 0.007843138, 1, 0, 1,
-0.3559395, -0.01450814, -1.720654, 0.003921569, 1, 0, 1,
-0.3492767, -0.461996, -4.105202, 0, 1, 0.003921569, 1,
-0.3453938, -0.8242553, -2.534109, 0, 1, 0.01176471, 1,
-0.343237, -0.5406213, -3.204976, 0, 1, 0.01568628, 1,
-0.3431408, 0.5268602, -0.780493, 0, 1, 0.02352941, 1,
-0.3426429, -0.5539762, -2.962696, 0, 1, 0.02745098, 1,
-0.3408189, -0.7401571, -4.459831, 0, 1, 0.03529412, 1,
-0.3359532, 0.7864997, -2.899604, 0, 1, 0.03921569, 1,
-0.3348782, 1.492924, -0.7155651, 0, 1, 0.04705882, 1,
-0.3340115, -2.450349, -2.52323, 0, 1, 0.05098039, 1,
-0.3328923, -0.9860007, -1.563561, 0, 1, 0.05882353, 1,
-0.3313771, -1.102314, -3.705978, 0, 1, 0.0627451, 1,
-0.3308636, 0.03961727, -2.177166, 0, 1, 0.07058824, 1,
-0.3282773, -0.7995379, -1.999148, 0, 1, 0.07450981, 1,
-0.3264316, -0.1037876, -3.48714, 0, 1, 0.08235294, 1,
-0.3260995, 0.669944, -1.815281, 0, 1, 0.08627451, 1,
-0.3249312, 1.324159, 0.1019761, 0, 1, 0.09411765, 1,
-0.3242943, 0.5332513, -0.4294449, 0, 1, 0.1019608, 1,
-0.320445, -1.176128, -3.745073, 0, 1, 0.1058824, 1,
-0.3202614, 1.074017, -1.609307, 0, 1, 0.1137255, 1,
-0.3181089, -1.089573, -1.198145, 0, 1, 0.1176471, 1,
-0.3171002, -0.9140029, -1.413085, 0, 1, 0.1254902, 1,
-0.3159652, -0.8953339, -2.291893, 0, 1, 0.1294118, 1,
-0.3157209, -1.224014, -1.800797, 0, 1, 0.1372549, 1,
-0.3066311, 0.9515702, 0.06767163, 0, 1, 0.1411765, 1,
-0.3056597, 0.1956523, -0.3739513, 0, 1, 0.1490196, 1,
-0.3037241, 1.33658, -0.8791193, 0, 1, 0.1529412, 1,
-0.2999538, -2.641117, -2.038967, 0, 1, 0.1607843, 1,
-0.2950415, 1.638057, 1.114195, 0, 1, 0.1647059, 1,
-0.2931405, 0.04011556, -1.224729, 0, 1, 0.172549, 1,
-0.2881815, 0.9305572, -0.7830172, 0, 1, 0.1764706, 1,
-0.2793207, -0.2890523, -2.600541, 0, 1, 0.1843137, 1,
-0.2790512, -0.4437497, -3.071847, 0, 1, 0.1882353, 1,
-0.2781802, -1.224775, -3.923158, 0, 1, 0.1960784, 1,
-0.2682429, -0.8660012, -2.858226, 0, 1, 0.2039216, 1,
-0.265886, 0.6106524, -0.7503919, 0, 1, 0.2078431, 1,
-0.264735, -0.5755671, -2.632321, 0, 1, 0.2156863, 1,
-0.2638015, 1.383916, 0.5012711, 0, 1, 0.2196078, 1,
-0.2630907, 0.6626047, -0.3921625, 0, 1, 0.227451, 1,
-0.2588812, -0.8137909, -2.112175, 0, 1, 0.2313726, 1,
-0.258465, -0.7975102, -2.013583, 0, 1, 0.2392157, 1,
-0.2576099, -1.368754, -2.693664, 0, 1, 0.2431373, 1,
-0.2575713, -1.804948, -3.87931, 0, 1, 0.2509804, 1,
-0.2563903, 1.352583, 0.6222407, 0, 1, 0.254902, 1,
-0.2553449, 1.341705, 0.3008708, 0, 1, 0.2627451, 1,
-0.2530721, -0.2233905, -2.349234, 0, 1, 0.2666667, 1,
-0.2479111, 0.2069732, -1.244448, 0, 1, 0.2745098, 1,
-0.2470871, 0.4535952, 0.1126893, 0, 1, 0.2784314, 1,
-0.2443614, 0.5436427, -1.043489, 0, 1, 0.2862745, 1,
-0.2440122, -0.2482035, -2.117133, 0, 1, 0.2901961, 1,
-0.2415623, -0.9706749, -2.201697, 0, 1, 0.2980392, 1,
-0.2395433, 0.9835882, -0.3970869, 0, 1, 0.3058824, 1,
-0.2368116, 0.5003595, 0.1581563, 0, 1, 0.3098039, 1,
-0.2359422, -0.5059686, -4.890895, 0, 1, 0.3176471, 1,
-0.2354819, -2.27567, -2.300344, 0, 1, 0.3215686, 1,
-0.2332346, 0.1996234, -1.091323, 0, 1, 0.3294118, 1,
-0.2322772, 0.4306515, -0.8837934, 0, 1, 0.3333333, 1,
-0.2313927, -0.01767646, -4.207667, 0, 1, 0.3411765, 1,
-0.2302223, -2.24854, -1.957714, 0, 1, 0.345098, 1,
-0.2255034, 0.9170721, 1.582943, 0, 1, 0.3529412, 1,
-0.2222307, 0.4450375, 0.5102213, 0, 1, 0.3568628, 1,
-0.2222105, -0.2085494, -3.35499, 0, 1, 0.3647059, 1,
-0.2203885, 0.5439801, 0.4569783, 0, 1, 0.3686275, 1,
-0.2184093, 1.678509, 1.182463, 0, 1, 0.3764706, 1,
-0.2181902, -0.5802771, -2.938617, 0, 1, 0.3803922, 1,
-0.2139503, -0.7252962, -2.308707, 0, 1, 0.3882353, 1,
-0.2106436, -1.181652, -0.5541229, 0, 1, 0.3921569, 1,
-0.2039569, -0.3771725, -1.55216, 0, 1, 0.4, 1,
-0.1987609, -0.6264215, -2.107501, 0, 1, 0.4078431, 1,
-0.1952974, 0.4660604, -0.2224414, 0, 1, 0.4117647, 1,
-0.1948985, -0.2245409, -2.685467, 0, 1, 0.4196078, 1,
-0.1927566, -0.07061154, -0.9180841, 0, 1, 0.4235294, 1,
-0.1864453, -0.2002949, 0.01034797, 0, 1, 0.4313726, 1,
-0.1835018, -1.442613, -2.99868, 0, 1, 0.4352941, 1,
-0.1826887, 0.2602959, -0.8661499, 0, 1, 0.4431373, 1,
-0.1810861, 0.01243127, -0.8135541, 0, 1, 0.4470588, 1,
-0.178374, -1.288043, -2.378359, 0, 1, 0.454902, 1,
-0.1779472, -0.4360252, -2.32343, 0, 1, 0.4588235, 1,
-0.1765171, -0.5685806, -1.426632, 0, 1, 0.4666667, 1,
-0.1721071, 1.035177, 0.5584052, 0, 1, 0.4705882, 1,
-0.1699402, -1.084168, -4.915493, 0, 1, 0.4784314, 1,
-0.163349, 0.192737, -2.479012, 0, 1, 0.4823529, 1,
-0.1618674, -1.097016, -3.263997, 0, 1, 0.4901961, 1,
-0.1598191, 0.7312905, 0.1545303, 0, 1, 0.4941176, 1,
-0.1575094, 0.2024345, 0.4466894, 0, 1, 0.5019608, 1,
-0.1525455, 0.2231012, -2.137383, 0, 1, 0.509804, 1,
-0.1512855, 0.2768536, -1.022775, 0, 1, 0.5137255, 1,
-0.1474555, 0.3572861, -2.372186, 0, 1, 0.5215687, 1,
-0.1462848, -1.438404, -2.123487, 0, 1, 0.5254902, 1,
-0.1410142, -0.9668601, -3.581992, 0, 1, 0.5333334, 1,
-0.1406878, 1.080496, 0.8308158, 0, 1, 0.5372549, 1,
-0.1399566, 2.62407, -1.087307, 0, 1, 0.5450981, 1,
-0.1384391, 0.1708239, -1.610618, 0, 1, 0.5490196, 1,
-0.1376246, 1.599652, 0.8189499, 0, 1, 0.5568628, 1,
-0.1338631, -1.111574, -2.350794, 0, 1, 0.5607843, 1,
-0.1331735, 0.3270859, -0.7252386, 0, 1, 0.5686275, 1,
-0.1312295, 0.4889229, 2.764, 0, 1, 0.572549, 1,
-0.1303675, 0.8004187, -0.04783416, 0, 1, 0.5803922, 1,
-0.1300858, 1.080597, 0.2774357, 0, 1, 0.5843138, 1,
-0.1278932, -0.3854418, -3.591328, 0, 1, 0.5921569, 1,
-0.1215049, -0.4370497, -2.97376, 0, 1, 0.5960785, 1,
-0.1208751, 0.1343795, -0.2216922, 0, 1, 0.6039216, 1,
-0.1205909, -0.8597757, 0.2658538, 0, 1, 0.6117647, 1,
-0.1197808, 0.7702269, -0.5225366, 0, 1, 0.6156863, 1,
-0.1167047, 1.518675, 1.290356, 0, 1, 0.6235294, 1,
-0.1164695, -1.481689, -2.485133, 0, 1, 0.627451, 1,
-0.1147833, -1.056999, -2.89065, 0, 1, 0.6352941, 1,
-0.1103207, -1.354969, -1.226887, 0, 1, 0.6392157, 1,
-0.1094076, -1.216599, -2.060396, 0, 1, 0.6470588, 1,
-0.1090827, 0.559733, -0.9278818, 0, 1, 0.6509804, 1,
-0.1077724, -0.5225768, -3.028106, 0, 1, 0.6588235, 1,
-0.1047226, -0.2813407, -2.867045, 0, 1, 0.6627451, 1,
-0.09790029, -0.2367469, -1.538142, 0, 1, 0.6705883, 1,
-0.09685028, -1.7545, -2.32537, 0, 1, 0.6745098, 1,
-0.09663893, -0.981759, -3.281637, 0, 1, 0.682353, 1,
-0.09584335, 0.5868585, 0.7928141, 0, 1, 0.6862745, 1,
-0.09467086, -0.4903718, -3.37814, 0, 1, 0.6941177, 1,
-0.09211481, -0.148698, -0.7103739, 0, 1, 0.7019608, 1,
-0.09051362, -0.542047, -2.831738, 0, 1, 0.7058824, 1,
-0.08886096, -1.286357, -2.01528, 0, 1, 0.7137255, 1,
-0.08767822, -1.766546, -2.70227, 0, 1, 0.7176471, 1,
-0.08761104, 1.723719, 1.556517, 0, 1, 0.7254902, 1,
-0.08557985, 0.171403, -0.7390401, 0, 1, 0.7294118, 1,
-0.08401313, 1.671487, -1.400397, 0, 1, 0.7372549, 1,
-0.07788941, 0.09260478, -2.163411, 0, 1, 0.7411765, 1,
-0.07770842, 0.5270885, -1.403655, 0, 1, 0.7490196, 1,
-0.07490215, -0.4912244, -1.502022, 0, 1, 0.7529412, 1,
-0.07484423, -0.1285157, -0.4121535, 0, 1, 0.7607843, 1,
-0.06962427, 1.317685, 1.61739, 0, 1, 0.7647059, 1,
-0.0680282, -0.2039247, -4.082765, 0, 1, 0.772549, 1,
-0.06765388, -0.6052879, -3.396384, 0, 1, 0.7764706, 1,
-0.06702434, -0.8862052, -2.850396, 0, 1, 0.7843137, 1,
-0.06421013, -1.024169, -3.580816, 0, 1, 0.7882353, 1,
-0.06162295, -0.05937274, -2.532863, 0, 1, 0.7960784, 1,
-0.0600586, -0.3411068, -3.422282, 0, 1, 0.8039216, 1,
-0.05952711, 0.8696668, -2.053262, 0, 1, 0.8078431, 1,
-0.05436699, -0.8002204, -2.311678, 0, 1, 0.8156863, 1,
-0.05280891, -0.3589832, -3.526812, 0, 1, 0.8196079, 1,
-0.05278065, -1.301798, -3.195203, 0, 1, 0.827451, 1,
-0.05241779, 0.01367928, -0.9179957, 0, 1, 0.8313726, 1,
-0.05119798, 0.1697682, -0.1545653, 0, 1, 0.8392157, 1,
-0.05078008, 1.251057, 1.51985, 0, 1, 0.8431373, 1,
-0.0493296, 0.4784304, -0.5255522, 0, 1, 0.8509804, 1,
-0.04864547, -1.091453, -1.625296, 0, 1, 0.854902, 1,
-0.04800231, 0.3569188, 0.8140516, 0, 1, 0.8627451, 1,
-0.04768959, -0.5329795, -2.681768, 0, 1, 0.8666667, 1,
-0.04345801, 0.5665116, -1.22354, 0, 1, 0.8745098, 1,
-0.04222891, 0.2819529, -1.49307, 0, 1, 0.8784314, 1,
-0.03158138, -0.3289268, -2.574327, 0, 1, 0.8862745, 1,
-0.02610257, 0.4127496, 0.2162126, 0, 1, 0.8901961, 1,
-0.02493597, 0.1828091, -1.830241, 0, 1, 0.8980392, 1,
-0.02480473, -0.06820956, -2.305447, 0, 1, 0.9058824, 1,
-0.023885, 0.8242916, -0.4252202, 0, 1, 0.9098039, 1,
-0.0222753, 0.06473933, -0.5952002, 0, 1, 0.9176471, 1,
-0.01144888, 0.317517, -0.5036743, 0, 1, 0.9215686, 1,
-0.01123572, 0.06380237, -0.9709696, 0, 1, 0.9294118, 1,
-0.01089682, 0.5560886, 0.1962399, 0, 1, 0.9333333, 1,
-0.007159355, -0.3879924, -3.626726, 0, 1, 0.9411765, 1,
-0.003894126, -0.4752314, -2.227541, 0, 1, 0.945098, 1,
-0.00127677, 0.6752715, -0.4122577, 0, 1, 0.9529412, 1,
0.0006625916, -2.208104, 0.62099, 0, 1, 0.9568627, 1,
0.00180424, 0.2824927, -0.5960578, 0, 1, 0.9647059, 1,
0.005883732, -0.8451215, 2.832227, 0, 1, 0.9686275, 1,
0.007484154, -0.4937807, 2.51608, 0, 1, 0.9764706, 1,
0.008803977, 2.220198, 1.071461, 0, 1, 0.9803922, 1,
0.008910926, -0.1794336, 2.228137, 0, 1, 0.9882353, 1,
0.009513806, -0.3619885, 3.209999, 0, 1, 0.9921569, 1,
0.01949527, -0.1257822, 2.471412, 0, 1, 1, 1,
0.0202099, -1.400185, 3.000061, 0, 0.9921569, 1, 1,
0.02179312, -1.239379, 2.618016, 0, 0.9882353, 1, 1,
0.02666872, -0.5219683, 4.165926, 0, 0.9803922, 1, 1,
0.03115502, -0.4226189, 3.880522, 0, 0.9764706, 1, 1,
0.03189356, -1.580553, 3.187248, 0, 0.9686275, 1, 1,
0.03368293, 0.02094337, 1.434934, 0, 0.9647059, 1, 1,
0.03381566, 0.2630721, 1.956349, 0, 0.9568627, 1, 1,
0.03526695, 0.2942519, 0.2522615, 0, 0.9529412, 1, 1,
0.04042733, 0.3874293, 0.6334742, 0, 0.945098, 1, 1,
0.04170254, -0.2479559, 4.122029, 0, 0.9411765, 1, 1,
0.04379397, -0.8370515, 3.592496, 0, 0.9333333, 1, 1,
0.04679438, 0.1375027, 0.922342, 0, 0.9294118, 1, 1,
0.04687342, 0.5899636, -0.4045688, 0, 0.9215686, 1, 1,
0.04698385, -1.051529, 4.009184, 0, 0.9176471, 1, 1,
0.05274326, -0.4635551, 3.333022, 0, 0.9098039, 1, 1,
0.05362835, -1.171729, 2.784032, 0, 0.9058824, 1, 1,
0.05618237, 0.2618244, -1.149406, 0, 0.8980392, 1, 1,
0.0610531, -0.2629066, 1.703644, 0, 0.8901961, 1, 1,
0.06471241, -0.3088022, 3.526892, 0, 0.8862745, 1, 1,
0.06744666, -1.243059, 2.234804, 0, 0.8784314, 1, 1,
0.06871814, 1.008284, -2.285021, 0, 0.8745098, 1, 1,
0.07043443, -1.823269, 3.026648, 0, 0.8666667, 1, 1,
0.07655908, -2.263081, 4.009807, 0, 0.8627451, 1, 1,
0.07817187, 0.1795865, 0.4555949, 0, 0.854902, 1, 1,
0.07997344, 0.4239775, 1.360141, 0, 0.8509804, 1, 1,
0.0836473, -1.083468, 3.267515, 0, 0.8431373, 1, 1,
0.08390939, -0.1308932, 4.850382, 0, 0.8392157, 1, 1,
0.08455466, 0.9073772, 1.177612, 0, 0.8313726, 1, 1,
0.08492685, 1.243579, -0.3964991, 0, 0.827451, 1, 1,
0.08504884, -1.510879, 5.097596, 0, 0.8196079, 1, 1,
0.08539715, 0.8648815, -0.2395405, 0, 0.8156863, 1, 1,
0.09536764, -1.493132, 1.978565, 0, 0.8078431, 1, 1,
0.101629, -1.485384, 3.373276, 0, 0.8039216, 1, 1,
0.1090821, 0.5223269, -0.205987, 0, 0.7960784, 1, 1,
0.1101691, 0.1187639, 1.579688, 0, 0.7882353, 1, 1,
0.1122344, -0.5179446, 2.276167, 0, 0.7843137, 1, 1,
0.1231732, 0.1683189, 0.4966182, 0, 0.7764706, 1, 1,
0.1238689, -0.9312847, 1.963288, 0, 0.772549, 1, 1,
0.1246189, -1.364281, 3.024979, 0, 0.7647059, 1, 1,
0.1278072, -1.743405, 3.232078, 0, 0.7607843, 1, 1,
0.1349337, -0.9565133, 2.538083, 0, 0.7529412, 1, 1,
0.1354867, -0.9221927, 1.909473, 0, 0.7490196, 1, 1,
0.1364244, -0.9831332, 3.392517, 0, 0.7411765, 1, 1,
0.136891, 0.96556, -0.1102356, 0, 0.7372549, 1, 1,
0.1395116, 0.892651, 0.7903991, 0, 0.7294118, 1, 1,
0.1439575, -0.07348249, 1.469998, 0, 0.7254902, 1, 1,
0.1442927, -0.5446596, 1.89349, 0, 0.7176471, 1, 1,
0.1485459, 0.1102744, 1.991761, 0, 0.7137255, 1, 1,
0.1499447, -0.9700987, 2.37971, 0, 0.7058824, 1, 1,
0.1553039, -1.443789, 2.884363, 0, 0.6980392, 1, 1,
0.1560112, -0.4827507, 3.388129, 0, 0.6941177, 1, 1,
0.1562794, 0.5187467, -0.119279, 0, 0.6862745, 1, 1,
0.1572581, 1.969216, 1.505765, 0, 0.682353, 1, 1,
0.1626468, -0.6283166, 1.571434, 0, 0.6745098, 1, 1,
0.1628568, -0.04076297, 2.220091, 0, 0.6705883, 1, 1,
0.1631374, -0.3884503, 1.651335, 0, 0.6627451, 1, 1,
0.1699513, 0.7520308, -0.5050284, 0, 0.6588235, 1, 1,
0.1712399, 0.0361487, 0.716594, 0, 0.6509804, 1, 1,
0.1726641, 0.4826034, 0.8579974, 0, 0.6470588, 1, 1,
0.1743988, 0.7155434, 0.3227627, 0, 0.6392157, 1, 1,
0.175224, -0.5052139, 3.704255, 0, 0.6352941, 1, 1,
0.1757262, -0.7545069, 3.657415, 0, 0.627451, 1, 1,
0.1790186, -1.822779, 3.684799, 0, 0.6235294, 1, 1,
0.1799001, -1.518339, 4.756087, 0, 0.6156863, 1, 1,
0.1814218, -3.510032, 3.681241, 0, 0.6117647, 1, 1,
0.1868453, -1.368342, 2.261336, 0, 0.6039216, 1, 1,
0.1910765, -0.8434886, 2.133558, 0, 0.5960785, 1, 1,
0.19423, 0.9170898, 0.5975295, 0, 0.5921569, 1, 1,
0.1966476, 1.828951, -0.3189873, 0, 0.5843138, 1, 1,
0.1986764, -0.2007255, 3.74266, 0, 0.5803922, 1, 1,
0.1996045, 0.6053852, 1.453189, 0, 0.572549, 1, 1,
0.2011956, -1.583706, 3.732852, 0, 0.5686275, 1, 1,
0.2058167, -1.299167, 2.374777, 0, 0.5607843, 1, 1,
0.2073241, -1.788253, 2.658571, 0, 0.5568628, 1, 1,
0.2105304, -0.5579631, 4.402216, 0, 0.5490196, 1, 1,
0.2125828, 0.4308391, 0.1169155, 0, 0.5450981, 1, 1,
0.2171763, 1.037238, -0.7043652, 0, 0.5372549, 1, 1,
0.2175293, -0.04314719, 1.394437, 0, 0.5333334, 1, 1,
0.2181861, 0.007296897, 0.6617593, 0, 0.5254902, 1, 1,
0.2208423, -0.5204152, 4.048139, 0, 0.5215687, 1, 1,
0.227125, -0.01796943, 2.275991, 0, 0.5137255, 1, 1,
0.228012, 0.2654861, 1.423616, 0, 0.509804, 1, 1,
0.2280653, -0.2390012, 3.417499, 0, 0.5019608, 1, 1,
0.229688, -0.07493778, 3.416315, 0, 0.4941176, 1, 1,
0.2307807, -0.4232828, 2.636807, 0, 0.4901961, 1, 1,
0.2314866, 0.239702, 2.133917, 0, 0.4823529, 1, 1,
0.2331537, -0.9164754, 3.309269, 0, 0.4784314, 1, 1,
0.233505, -0.820399, 4.251146, 0, 0.4705882, 1, 1,
0.235942, 0.08968408, 0.6609917, 0, 0.4666667, 1, 1,
0.2398893, 1.03067, 0.7671749, 0, 0.4588235, 1, 1,
0.2401667, -0.2643016, 2.891825, 0, 0.454902, 1, 1,
0.2406659, 0.4365537, -0.08768757, 0, 0.4470588, 1, 1,
0.2449227, -0.1595901, 2.342144, 0, 0.4431373, 1, 1,
0.2482632, 0.8869152, -0.2537975, 0, 0.4352941, 1, 1,
0.2510108, 0.4207264, -0.736196, 0, 0.4313726, 1, 1,
0.2550338, 1.153641, 0.4051083, 0, 0.4235294, 1, 1,
0.2642968, 1.586361, -1.194701, 0, 0.4196078, 1, 1,
0.2651095, -1.318501, 2.376018, 0, 0.4117647, 1, 1,
0.2678935, 0.2284095, 1.367034, 0, 0.4078431, 1, 1,
0.2701235, -0.02113293, 2.583368, 0, 0.4, 1, 1,
0.274609, 0.1628681, 1.108121, 0, 0.3921569, 1, 1,
0.2773555, -0.2235409, 0.0844111, 0, 0.3882353, 1, 1,
0.2801351, 1.002858, -0.4124145, 0, 0.3803922, 1, 1,
0.284611, 0.7213705, 1.183342, 0, 0.3764706, 1, 1,
0.2857013, -0.9253042, 3.221394, 0, 0.3686275, 1, 1,
0.2858669, -1.50639, 3.456528, 0, 0.3647059, 1, 1,
0.2893276, 1.637522, 0.01268297, 0, 0.3568628, 1, 1,
0.301167, 1.078598, 1.46355, 0, 0.3529412, 1, 1,
0.3014205, 0.6599948, -0.6742642, 0, 0.345098, 1, 1,
0.3028363, -1.301142, 3.884414, 0, 0.3411765, 1, 1,
0.3044962, 0.2508873, 1.577166, 0, 0.3333333, 1, 1,
0.3098761, 0.637911, 0.1771013, 0, 0.3294118, 1, 1,
0.3103374, 0.539097, -0.7441866, 0, 0.3215686, 1, 1,
0.3194467, 0.7346973, 1.395171, 0, 0.3176471, 1, 1,
0.3209294, -2.200297, 2.516535, 0, 0.3098039, 1, 1,
0.3245055, 0.815196, 0.637318, 0, 0.3058824, 1, 1,
0.325394, 1.08196, -1.182144, 0, 0.2980392, 1, 1,
0.3265631, -0.06367322, 1.2965, 0, 0.2901961, 1, 1,
0.3266625, -0.3204055, 1.991906, 0, 0.2862745, 1, 1,
0.3321823, 0.5038257, -0.4407027, 0, 0.2784314, 1, 1,
0.3322312, -0.4487091, 1.992948, 0, 0.2745098, 1, 1,
0.3367518, -1.740675, 4.512883, 0, 0.2666667, 1, 1,
0.3372164, 0.2021932, 2.078959, 0, 0.2627451, 1, 1,
0.3380299, 2.429551, -0.1319473, 0, 0.254902, 1, 1,
0.3456715, -0.3055362, 3.891212, 0, 0.2509804, 1, 1,
0.3479448, -0.8385448, 2.062569, 0, 0.2431373, 1, 1,
0.3498282, 1.675787, 0.03277206, 0, 0.2392157, 1, 1,
0.3503126, -0.8595724, 2.719831, 0, 0.2313726, 1, 1,
0.3519545, 0.2420274, 2.199617, 0, 0.227451, 1, 1,
0.3545145, 0.220993, 1.337213, 0, 0.2196078, 1, 1,
0.3611132, -0.2359819, 1.376023, 0, 0.2156863, 1, 1,
0.3652724, -1.23856, 3.259175, 0, 0.2078431, 1, 1,
0.3674799, 0.3609327, 1.020596, 0, 0.2039216, 1, 1,
0.3688653, 0.4368984, -0.008501276, 0, 0.1960784, 1, 1,
0.3689008, 0.4271889, 2.242514, 0, 0.1882353, 1, 1,
0.3693516, 0.1206482, 1.555251, 0, 0.1843137, 1, 1,
0.36962, 0.8820822, -0.4483065, 0, 0.1764706, 1, 1,
0.3744437, -0.4058892, 4.218977, 0, 0.172549, 1, 1,
0.3769414, 0.3855065, 2.628438, 0, 0.1647059, 1, 1,
0.3790486, -1.56175, 4.19747, 0, 0.1607843, 1, 1,
0.3855384, -0.3287448, 4.295413, 0, 0.1529412, 1, 1,
0.3856602, 0.0945248, 1.602958, 0, 0.1490196, 1, 1,
0.3931404, 0.6279017, -0.9153689, 0, 0.1411765, 1, 1,
0.3953231, 0.2335864, 0.7391435, 0, 0.1372549, 1, 1,
0.3971948, 1.453941, 0.8935559, 0, 0.1294118, 1, 1,
0.4013564, 0.6678861, -0.6651552, 0, 0.1254902, 1, 1,
0.4097495, -1.205669, 2.945191, 0, 0.1176471, 1, 1,
0.4127085, -0.04398388, 1.927568, 0, 0.1137255, 1, 1,
0.4128908, -0.5378279, 2.152539, 0, 0.1058824, 1, 1,
0.4152649, 1.705322, 0.2771325, 0, 0.09803922, 1, 1,
0.4162859, 1.185473, -0.6340705, 0, 0.09411765, 1, 1,
0.4219399, -0.5404108, 3.336344, 0, 0.08627451, 1, 1,
0.4223219, 0.3526018, 1.53732, 0, 0.08235294, 1, 1,
0.4224108, -1.64647, 2.484958, 0, 0.07450981, 1, 1,
0.423998, 1.610945, 0.7988107, 0, 0.07058824, 1, 1,
0.4248563, -0.4765612, 1.261332, 0, 0.0627451, 1, 1,
0.4276671, -0.02650598, 0.1929393, 0, 0.05882353, 1, 1,
0.4286898, 0.7118903, -0.2501409, 0, 0.05098039, 1, 1,
0.4309318, 0.3124011, 1.631436, 0, 0.04705882, 1, 1,
0.4313629, 2.348418, 0.7565997, 0, 0.03921569, 1, 1,
0.4346918, 0.1697459, 0.7749318, 0, 0.03529412, 1, 1,
0.445855, 1.799782, -0.8085364, 0, 0.02745098, 1, 1,
0.4459403, 0.7555457, -0.6630445, 0, 0.02352941, 1, 1,
0.4521109, -1.269831, 1.173512, 0, 0.01568628, 1, 1,
0.4553625, -0.05854674, 2.506543, 0, 0.01176471, 1, 1,
0.4560007, -1.664218, 1.411489, 0, 0.003921569, 1, 1,
0.4561079, 1.007764, 1.010387, 0.003921569, 0, 1, 1,
0.4579777, -0.3405105, 3.396515, 0.007843138, 0, 1, 1,
0.4584357, -0.78102, 3.09716, 0.01568628, 0, 1, 1,
0.4585506, -0.2956803, 2.369919, 0.01960784, 0, 1, 1,
0.4598339, -0.7409706, 2.083638, 0.02745098, 0, 1, 1,
0.4612783, -0.5580854, 2.275394, 0.03137255, 0, 1, 1,
0.4637287, 0.4655029, -0.001621229, 0.03921569, 0, 1, 1,
0.4638321, -0.2177311, 0.2534374, 0.04313726, 0, 1, 1,
0.464101, -1.036801, 3.346532, 0.05098039, 0, 1, 1,
0.4683996, -0.5782577, 2.291685, 0.05490196, 0, 1, 1,
0.4803586, 1.141354, 1.78171, 0.0627451, 0, 1, 1,
0.4890406, -1.203673, 3.552411, 0.06666667, 0, 1, 1,
0.4891028, -4.130707, 3.429566, 0.07450981, 0, 1, 1,
0.4983121, -0.1690997, 2.091756, 0.07843138, 0, 1, 1,
0.5005209, 0.2520035, 1.309517, 0.08627451, 0, 1, 1,
0.5012118, 0.3953709, -0.05581704, 0.09019608, 0, 1, 1,
0.5039788, 0.5240072, 0.5006624, 0.09803922, 0, 1, 1,
0.5068922, 0.1290403, 1.872383, 0.1058824, 0, 1, 1,
0.5088691, 0.02402391, 1.235693, 0.1098039, 0, 1, 1,
0.5108798, -0.8734919, 2.850014, 0.1176471, 0, 1, 1,
0.5141335, -0.259592, 2.262368, 0.1215686, 0, 1, 1,
0.5160728, -0.4307145, 5.050509, 0.1294118, 0, 1, 1,
0.516135, -0.1444673, 2.135312, 0.1333333, 0, 1, 1,
0.5176256, 0.3303386, 1.111548, 0.1411765, 0, 1, 1,
0.5217118, 0.2687702, 3.608222, 0.145098, 0, 1, 1,
0.5225809, -2.082572, 3.17402, 0.1529412, 0, 1, 1,
0.522998, -0.2260294, 3.047225, 0.1568628, 0, 1, 1,
0.5235194, -1.378117, 3.239121, 0.1647059, 0, 1, 1,
0.5295814, 0.103452, 1.738431, 0.1686275, 0, 1, 1,
0.5300531, 1.057713, 1.521713, 0.1764706, 0, 1, 1,
0.5352312, 0.9343292, 0.4886971, 0.1803922, 0, 1, 1,
0.5376546, 0.1193506, 2.47177, 0.1882353, 0, 1, 1,
0.5396299, -0.793458, 6.062346, 0.1921569, 0, 1, 1,
0.5448931, 0.448099, 1.000596, 0.2, 0, 1, 1,
0.5463958, -0.1941748, 2.219351, 0.2078431, 0, 1, 1,
0.5490924, -0.839325, 2.060738, 0.2117647, 0, 1, 1,
0.5532591, 1.962132, -1.350219, 0.2196078, 0, 1, 1,
0.5548716, -0.5372155, 2.480649, 0.2235294, 0, 1, 1,
0.5657354, 2.00404, -0.4041546, 0.2313726, 0, 1, 1,
0.56583, 0.3291183, 1.505686, 0.2352941, 0, 1, 1,
0.5699196, -0.9172028, 2.093582, 0.2431373, 0, 1, 1,
0.5725634, 1.114537, 2.050189, 0.2470588, 0, 1, 1,
0.5791465, 0.5531418, 2.276061, 0.254902, 0, 1, 1,
0.5792084, -0.4219605, 1.424376, 0.2588235, 0, 1, 1,
0.5827971, 0.6266473, 0.734461, 0.2666667, 0, 1, 1,
0.5833435, -0.7352859, 3.051885, 0.2705882, 0, 1, 1,
0.5878868, -0.4697308, 2.882681, 0.2784314, 0, 1, 1,
0.5885652, 0.9533451, 0.3990352, 0.282353, 0, 1, 1,
0.5917136, -0.969623, 3.164994, 0.2901961, 0, 1, 1,
0.593402, 0.5430338, -0.3471299, 0.2941177, 0, 1, 1,
0.5942858, 0.7064842, 1.012893, 0.3019608, 0, 1, 1,
0.5977823, -1.553022, 1.587581, 0.3098039, 0, 1, 1,
0.6041055, -1.975425, 3.040682, 0.3137255, 0, 1, 1,
0.6049182, 0.7517436, 0.4120424, 0.3215686, 0, 1, 1,
0.6060755, 0.9697178, 0.546162, 0.3254902, 0, 1, 1,
0.6075808, 1.071873, -0.2941587, 0.3333333, 0, 1, 1,
0.6100264, 0.1246992, 0.2292674, 0.3372549, 0, 1, 1,
0.6108959, -1.150745, 3.0728, 0.345098, 0, 1, 1,
0.6134251, 0.9926831, 0.3234746, 0.3490196, 0, 1, 1,
0.6162818, 1.615327, -0.9446766, 0.3568628, 0, 1, 1,
0.618439, 0.05442578, -0.4219403, 0.3607843, 0, 1, 1,
0.6192349, 1.16013, -0.6420765, 0.3686275, 0, 1, 1,
0.6222429, 1.056121, 0.7709696, 0.372549, 0, 1, 1,
0.6269399, 0.1461774, 0.4447962, 0.3803922, 0, 1, 1,
0.6290302, 0.3050803, 0.8464822, 0.3843137, 0, 1, 1,
0.6375319, -0.0008974809, 0.0709288, 0.3921569, 0, 1, 1,
0.6379609, 0.3556292, 2.772259, 0.3960784, 0, 1, 1,
0.6383636, -0.3929678, 3.390793, 0.4039216, 0, 1, 1,
0.6411975, 0.5972504, -1.533148, 0.4117647, 0, 1, 1,
0.6420248, 1.73536, 1.635192, 0.4156863, 0, 1, 1,
0.6431181, 1.030341, -0.2245557, 0.4235294, 0, 1, 1,
0.6443341, 0.06349093, 2.215153, 0.427451, 0, 1, 1,
0.6451499, 2.272949, 0.1323357, 0.4352941, 0, 1, 1,
0.6467769, -0.7225548, 1.902151, 0.4392157, 0, 1, 1,
0.6512836, -0.3934228, 1.515526, 0.4470588, 0, 1, 1,
0.6578192, -1.127087, 3.612327, 0.4509804, 0, 1, 1,
0.6640474, 1.21288, 1.7353, 0.4588235, 0, 1, 1,
0.667738, 1.291204, 1.809805, 0.4627451, 0, 1, 1,
0.6707756, -1.273868, 2.39365, 0.4705882, 0, 1, 1,
0.6719118, 1.874339, 0.362406, 0.4745098, 0, 1, 1,
0.6755986, -0.151218, 2.191682, 0.4823529, 0, 1, 1,
0.6828784, 1.734085, 0.3117593, 0.4862745, 0, 1, 1,
0.6832105, 0.4765413, 1.144958, 0.4941176, 0, 1, 1,
0.6837384, 0.7914861, 1.126172, 0.5019608, 0, 1, 1,
0.6842659, -0.9259385, 3.37498, 0.5058824, 0, 1, 1,
0.6859415, -0.7648126, 2.976487, 0.5137255, 0, 1, 1,
0.697682, -0.07791464, 2.930047, 0.5176471, 0, 1, 1,
0.7011852, 1.101734, 2.467614, 0.5254902, 0, 1, 1,
0.7032226, 0.09472851, 2.836771, 0.5294118, 0, 1, 1,
0.7116519, 1.961319, -0.9639611, 0.5372549, 0, 1, 1,
0.7196857, 0.2723128, 1.613947, 0.5411765, 0, 1, 1,
0.7198016, 0.03699189, 0.05264729, 0.5490196, 0, 1, 1,
0.7199516, -2.228694, 3.593379, 0.5529412, 0, 1, 1,
0.7228292, 0.9208853, -0.5609313, 0.5607843, 0, 1, 1,
0.7236435, 0.463244, -0.2582639, 0.5647059, 0, 1, 1,
0.7245699, 1.955814, 0.1256664, 0.572549, 0, 1, 1,
0.7317365, -0.3920372, 2.247594, 0.5764706, 0, 1, 1,
0.7337857, -0.06479175, 1.404191, 0.5843138, 0, 1, 1,
0.7371029, 0.1581281, -0.3316601, 0.5882353, 0, 1, 1,
0.7401518, -0.574164, 1.759855, 0.5960785, 0, 1, 1,
0.7470895, -0.4611248, 2.665952, 0.6039216, 0, 1, 1,
0.7471517, 1.007651, -1.079347, 0.6078432, 0, 1, 1,
0.7477696, 1.401312, 2.112236, 0.6156863, 0, 1, 1,
0.7492113, 0.9616431, -0.3225552, 0.6196079, 0, 1, 1,
0.7498751, 1.231082, -0.3333705, 0.627451, 0, 1, 1,
0.7580175, -0.8089119, 2.305141, 0.6313726, 0, 1, 1,
0.7621136, 1.746379, 2.910632, 0.6392157, 0, 1, 1,
0.7680479, 0.6280069, 0.2647122, 0.6431373, 0, 1, 1,
0.7743921, -0.2622921, 1.307082, 0.6509804, 0, 1, 1,
0.7750118, 1.178925, 0.4475314, 0.654902, 0, 1, 1,
0.7789217, 0.7360632, 1.285849, 0.6627451, 0, 1, 1,
0.7844567, -1.024967, 1.318112, 0.6666667, 0, 1, 1,
0.7875075, -0.7134067, 4.400951, 0.6745098, 0, 1, 1,
0.7966715, 0.8678542, 1.083684, 0.6784314, 0, 1, 1,
0.806286, 0.5531493, 0.8751848, 0.6862745, 0, 1, 1,
0.810984, 1.507777, 0.2064566, 0.6901961, 0, 1, 1,
0.8120576, 0.5068259, 2.005849, 0.6980392, 0, 1, 1,
0.8201883, 0.8724129, 0.2571062, 0.7058824, 0, 1, 1,
0.8205901, -0.6195418, 2.479817, 0.7098039, 0, 1, 1,
0.821479, -0.0531114, 0.9740862, 0.7176471, 0, 1, 1,
0.8216941, -0.08909395, 2.422752, 0.7215686, 0, 1, 1,
0.8220494, 1.455704, -0.06399693, 0.7294118, 0, 1, 1,
0.8223099, -0.1012412, 1.84008, 0.7333333, 0, 1, 1,
0.8247399, -0.6355779, 1.964253, 0.7411765, 0, 1, 1,
0.8252708, 0.8335324, 2.487998, 0.7450981, 0, 1, 1,
0.8290737, -2.292599, 3.328206, 0.7529412, 0, 1, 1,
0.8334761, -0.4882094, 3.507814, 0.7568628, 0, 1, 1,
0.8363823, -0.983658, 3.741153, 0.7647059, 0, 1, 1,
0.837441, 0.2175357, 3.007451, 0.7686275, 0, 1, 1,
0.8385239, -1.657345, 2.206977, 0.7764706, 0, 1, 1,
0.8389391, 0.04324009, 0.7343451, 0.7803922, 0, 1, 1,
0.8392788, -0.6947443, 2.719719, 0.7882353, 0, 1, 1,
0.8470663, -1.127347, 3.88209, 0.7921569, 0, 1, 1,
0.8486386, 0.9790559, -1.104593, 0.8, 0, 1, 1,
0.850578, -0.06686704, 1.519513, 0.8078431, 0, 1, 1,
0.8506568, 2.320053, 0.8673238, 0.8117647, 0, 1, 1,
0.8548607, -0.9389226, 2.270181, 0.8196079, 0, 1, 1,
0.8561991, -1.054113, 1.948274, 0.8235294, 0, 1, 1,
0.8568884, 0.7217245, 1.21388, 0.8313726, 0, 1, 1,
0.8629525, 0.4503666, 0.7913143, 0.8352941, 0, 1, 1,
0.8652025, -1.619861, 2.281739, 0.8431373, 0, 1, 1,
0.8653999, 0.392936, 0.8087646, 0.8470588, 0, 1, 1,
0.8705385, -0.9120759, 3.320419, 0.854902, 0, 1, 1,
0.8764957, -0.7301849, 3.416119, 0.8588235, 0, 1, 1,
0.8780383, 2.215036, -0.4185688, 0.8666667, 0, 1, 1,
0.8781487, -0.3618656, 1.390407, 0.8705882, 0, 1, 1,
0.8785011, 0.8977349, 0.6509139, 0.8784314, 0, 1, 1,
0.8794498, -2.287648, 3.022291, 0.8823529, 0, 1, 1,
0.8927977, -0.3399038, 2.219075, 0.8901961, 0, 1, 1,
0.89658, 2.124266, 0.2913475, 0.8941177, 0, 1, 1,
0.8971989, 0.397405, 1.557494, 0.9019608, 0, 1, 1,
0.9067927, -0.08944198, 3.341878, 0.9098039, 0, 1, 1,
0.9071735, -0.1004499, 2.261411, 0.9137255, 0, 1, 1,
0.9178902, 1.670632, -0.1968061, 0.9215686, 0, 1, 1,
0.9186918, -0.1536266, 0.07204782, 0.9254902, 0, 1, 1,
0.9211434, -0.3739019, 0.6454725, 0.9333333, 0, 1, 1,
0.9237592, -0.05329122, 0.9666039, 0.9372549, 0, 1, 1,
0.923963, -1.102584, 2.391362, 0.945098, 0, 1, 1,
0.9275511, 1.259935, 0.3737654, 0.9490196, 0, 1, 1,
0.9339541, -0.5409782, 1.05514, 0.9568627, 0, 1, 1,
0.9353656, -0.2233835, 5.241945, 0.9607843, 0, 1, 1,
0.9376072, 0.4138764, 0.46567, 0.9686275, 0, 1, 1,
0.9391148, 0.5917211, -0.3789395, 0.972549, 0, 1, 1,
0.9395718, -1.148058, 1.432059, 0.9803922, 0, 1, 1,
0.9396711, 0.5270716, 0.6221033, 0.9843137, 0, 1, 1,
0.945371, -1.090317, 2.211816, 0.9921569, 0, 1, 1,
0.9456615, 0.2099506, 0.5673795, 0.9960784, 0, 1, 1,
0.9472952, 0.1633352, 0.2576506, 1, 0, 0.9960784, 1,
0.953698, 0.4844858, 0.08646335, 1, 0, 0.9882353, 1,
0.9657458, 0.6981468, -0.1763829, 1, 0, 0.9843137, 1,
0.9662382, -1.738422, 2.607432, 1, 0, 0.9764706, 1,
0.9700757, 0.1854033, 2.016231, 1, 0, 0.972549, 1,
0.9806057, -2.171974, 2.270957, 1, 0, 0.9647059, 1,
0.9861081, -0.2123074, 0.5511996, 1, 0, 0.9607843, 1,
1.002902, 0.4628919, 1.031428, 1, 0, 0.9529412, 1,
1.008151, -0.5548226, 3.459526, 1, 0, 0.9490196, 1,
1.008671, -1.253848, 3.161279, 1, 0, 0.9411765, 1,
1.011396, -0.365076, 2.329017, 1, 0, 0.9372549, 1,
1.014025, 0.5389153, 1.311752, 1, 0, 0.9294118, 1,
1.014991, 0.640247, -0.05582715, 1, 0, 0.9254902, 1,
1.017388, 0.9050375, -1.767278, 1, 0, 0.9176471, 1,
1.022511, -0.481738, 4.069476, 1, 0, 0.9137255, 1,
1.023252, 1.237938, 1.171969, 1, 0, 0.9058824, 1,
1.023885, -0.9800693, 1.419555, 1, 0, 0.9019608, 1,
1.024876, 0.4105582, -0.3015859, 1, 0, 0.8941177, 1,
1.028472, 1.102094, 1.374296, 1, 0, 0.8862745, 1,
1.033853, -0.1937744, 2.960462, 1, 0, 0.8823529, 1,
1.035347, 0.5700223, 0.9428557, 1, 0, 0.8745098, 1,
1.039945, -0.5201829, 3.399503, 1, 0, 0.8705882, 1,
1.042432, 1.984598, 0.9767539, 1, 0, 0.8627451, 1,
1.04366, 0.305138, 0.2743479, 1, 0, 0.8588235, 1,
1.046062, 0.1410757, 3.122322, 1, 0, 0.8509804, 1,
1.053217, 0.3921888, 0.6992983, 1, 0, 0.8470588, 1,
1.056769, 2.472106, 0.4657786, 1, 0, 0.8392157, 1,
1.057617, -1.230218, 4.633822, 1, 0, 0.8352941, 1,
1.063542, -0.4038767, 1.590409, 1, 0, 0.827451, 1,
1.067287, -1.014714, 1.589937, 1, 0, 0.8235294, 1,
1.074341, 0.8927992, 0.7439967, 1, 0, 0.8156863, 1,
1.074748, -1.077525, 2.389494, 1, 0, 0.8117647, 1,
1.075299, 0.3405513, -0.4995986, 1, 0, 0.8039216, 1,
1.080738, 0.5526363, 1.440851, 1, 0, 0.7960784, 1,
1.086975, -1.149592, 2.157429, 1, 0, 0.7921569, 1,
1.089256, 0.157431, 2.730834, 1, 0, 0.7843137, 1,
1.092227, -0.2188551, 2.761966, 1, 0, 0.7803922, 1,
1.092584, 2.565014, -2.203107, 1, 0, 0.772549, 1,
1.099005, 0.5048028, 0.8844653, 1, 0, 0.7686275, 1,
1.104059, 0.1661398, 4.168806, 1, 0, 0.7607843, 1,
1.10447, 0.9958114, -0.195866, 1, 0, 0.7568628, 1,
1.104657, -3.16035, 3.387723, 1, 0, 0.7490196, 1,
1.104894, 0.754446, 1.701845, 1, 0, 0.7450981, 1,
1.110798, 0.8620574, -0.2359106, 1, 0, 0.7372549, 1,
1.122304, 0.4986464, 3.408607, 1, 0, 0.7333333, 1,
1.122343, -1.025762, 2.407568, 1, 0, 0.7254902, 1,
1.126897, -1.911685, 3.049065, 1, 0, 0.7215686, 1,
1.127674, -1.296128, 1.366958, 1, 0, 0.7137255, 1,
1.137127, 0.1987705, 3.232076, 1, 0, 0.7098039, 1,
1.140819, 0.4105097, 1.06231, 1, 0, 0.7019608, 1,
1.141871, 0.8376522, -1.376749, 1, 0, 0.6941177, 1,
1.142298, 3.001285, 1.530712, 1, 0, 0.6901961, 1,
1.143409, 0.7834556, -0.002180244, 1, 0, 0.682353, 1,
1.157199, -0.9821288, 2.265818, 1, 0, 0.6784314, 1,
1.158832, -0.943463, 3.198724, 1, 0, 0.6705883, 1,
1.161057, -2.053358, 2.761562, 1, 0, 0.6666667, 1,
1.162764, 0.5958993, 1.625031, 1, 0, 0.6588235, 1,
1.171949, -0.5848814, 0.3502352, 1, 0, 0.654902, 1,
1.182017, 1.59604, -0.3645946, 1, 0, 0.6470588, 1,
1.191439, -0.0890841, 2.671613, 1, 0, 0.6431373, 1,
1.195469, 2.055081, -0.3602809, 1, 0, 0.6352941, 1,
1.221438, -0.3129887, 3.364691, 1, 0, 0.6313726, 1,
1.230455, -0.9965969, 1.349816, 1, 0, 0.6235294, 1,
1.231913, -1.831676, 2.781518, 1, 0, 0.6196079, 1,
1.233616, -0.4621304, 1.674904, 1, 0, 0.6117647, 1,
1.23697, -1.229747, 2.326085, 1, 0, 0.6078432, 1,
1.250542, 1.356573, 0.6152756, 1, 0, 0.6, 1,
1.264283, 1.194878, 1.030447, 1, 0, 0.5921569, 1,
1.268319, -0.6339442, 2.014756, 1, 0, 0.5882353, 1,
1.272872, 0.08948562, 1.06071, 1, 0, 0.5803922, 1,
1.27775, 0.1866535, 2.317606, 1, 0, 0.5764706, 1,
1.284771, -2.459736, 2.194583, 1, 0, 0.5686275, 1,
1.30193, -0.1736811, 2.686331, 1, 0, 0.5647059, 1,
1.315664, -0.7037202, 1.393142, 1, 0, 0.5568628, 1,
1.320193, -0.6717051, 2.522073, 1, 0, 0.5529412, 1,
1.322937, 0.8613403, 0.2113007, 1, 0, 0.5450981, 1,
1.323045, 0.2415385, 1.088709, 1, 0, 0.5411765, 1,
1.325293, 1.314532, 0.634358, 1, 0, 0.5333334, 1,
1.326923, 0.208264, 1.214931, 1, 0, 0.5294118, 1,
1.33296, -0.972076, 1.757772, 1, 0, 0.5215687, 1,
1.360541, 1.206052, 2.246025, 1, 0, 0.5176471, 1,
1.363787, -0.9236016, 1.860126, 1, 0, 0.509804, 1,
1.367905, -0.09377467, 2.847862, 1, 0, 0.5058824, 1,
1.373862, -0.8720904, 1.506072, 1, 0, 0.4980392, 1,
1.375213, -0.6907319, 2.513762, 1, 0, 0.4901961, 1,
1.390267, 1.676653, 1.410112, 1, 0, 0.4862745, 1,
1.391436, 1.102746, 0.510619, 1, 0, 0.4784314, 1,
1.391483, 0.6376356, 2.155284, 1, 0, 0.4745098, 1,
1.404267, -0.73634, 1.505902, 1, 0, 0.4666667, 1,
1.411013, 0.6262138, 0.6510881, 1, 0, 0.4627451, 1,
1.416151, -0.654621, 1.389044, 1, 0, 0.454902, 1,
1.424833, 0.5237839, 2.166902, 1, 0, 0.4509804, 1,
1.431832, 0.0106052, 3.044476, 1, 0, 0.4431373, 1,
1.439049, -1.798918, 4.152583, 1, 0, 0.4392157, 1,
1.446823, -0.6041282, 3.657584, 1, 0, 0.4313726, 1,
1.450783, 0.2945343, 1.024408, 1, 0, 0.427451, 1,
1.462785, -0.4838558, 1.542502, 1, 0, 0.4196078, 1,
1.472568, -0.4734115, 2.442826, 1, 0, 0.4156863, 1,
1.473858, -0.8517764, -0.1493423, 1, 0, 0.4078431, 1,
1.490301, -0.1860083, 1.65662, 1, 0, 0.4039216, 1,
1.492232, -1.021246, 2.209001, 1, 0, 0.3960784, 1,
1.494551, -1.187922, 0.3909386, 1, 0, 0.3882353, 1,
1.514704, -1.695925, 2.223641, 1, 0, 0.3843137, 1,
1.544559, -0.7759259, 1.303402, 1, 0, 0.3764706, 1,
1.546215, -0.5621876, 2.437958, 1, 0, 0.372549, 1,
1.548184, -0.4750147, 0.1533398, 1, 0, 0.3647059, 1,
1.549245, -0.8972186, 2.058936, 1, 0, 0.3607843, 1,
1.555321, 0.9408299, 1.102717, 1, 0, 0.3529412, 1,
1.561845, 0.3223852, 1.325642, 1, 0, 0.3490196, 1,
1.561855, -0.04455353, 1.774133, 1, 0, 0.3411765, 1,
1.564658, 0.7360314, 2.210711, 1, 0, 0.3372549, 1,
1.58176, -0.2914479, 2.406799, 1, 0, 0.3294118, 1,
1.588858, 1.031306, 0.9695532, 1, 0, 0.3254902, 1,
1.588987, 0.398122, 2.208229, 1, 0, 0.3176471, 1,
1.591351, -0.8051133, 0.876844, 1, 0, 0.3137255, 1,
1.594078, -1.397319, 1.615481, 1, 0, 0.3058824, 1,
1.594124, -0.9165936, 2.078613, 1, 0, 0.2980392, 1,
1.613621, -2.222931, 2.450577, 1, 0, 0.2941177, 1,
1.619082, 0.6073757, 0.8109375, 1, 0, 0.2862745, 1,
1.621394, -1.573242, 2.252919, 1, 0, 0.282353, 1,
1.623729, -1.400502, 1.071071, 1, 0, 0.2745098, 1,
1.633879, -0.7294152, 2.6536, 1, 0, 0.2705882, 1,
1.649671, -2.260607, 0.9978698, 1, 0, 0.2627451, 1,
1.655127, -0.3704576, 3.957328, 1, 0, 0.2588235, 1,
1.658093, 0.5849124, -0.8792771, 1, 0, 0.2509804, 1,
1.690388, 0.4809055, 1.404833, 1, 0, 0.2470588, 1,
1.72484, -0.1544316, 1.147465, 1, 0, 0.2392157, 1,
1.745023, 0.3663741, 1.807406, 1, 0, 0.2352941, 1,
1.771019, 1.207412, 0.9487918, 1, 0, 0.227451, 1,
1.775261, -0.3697276, 0.829654, 1, 0, 0.2235294, 1,
1.788226, 1.229367, 1.779732, 1, 0, 0.2156863, 1,
1.791986, -1.783654, 1.051633, 1, 0, 0.2117647, 1,
1.797281, 0.8164424, 0.6431617, 1, 0, 0.2039216, 1,
1.80287, 0.6004378, 0.9997441, 1, 0, 0.1960784, 1,
1.803083, 1.572836, -0.1094537, 1, 0, 0.1921569, 1,
1.825428, 0.2350496, 0.9458724, 1, 0, 0.1843137, 1,
1.834754, 0.2833875, 0.8590971, 1, 0, 0.1803922, 1,
1.841472, 1.222676, 1.586616, 1, 0, 0.172549, 1,
1.850386, -0.1084169, 1.615871, 1, 0, 0.1686275, 1,
1.900957, -0.9159701, 1.314682, 1, 0, 0.1607843, 1,
1.900966, -0.9994724, 2.103082, 1, 0, 0.1568628, 1,
1.925601, 0.9317023, 2.166185, 1, 0, 0.1490196, 1,
1.930191, 0.5539383, 3.14259, 1, 0, 0.145098, 1,
1.96032, -1.006165, 2.243258, 1, 0, 0.1372549, 1,
1.978536, 0.8862191, 1.162009, 1, 0, 0.1333333, 1,
1.982987, 0.7785226, 0.2488543, 1, 0, 0.1254902, 1,
1.991706, -0.05755546, -0.2389717, 1, 0, 0.1215686, 1,
1.995117, 0.8893182, 2.03681, 1, 0, 0.1137255, 1,
2.017411, -0.2510028, 1.058231, 1, 0, 0.1098039, 1,
2.02315, -0.9514866, 3.706509, 1, 0, 0.1019608, 1,
2.035092, 0.2960549, 2.637015, 1, 0, 0.09411765, 1,
2.069232, -0.1175976, 0.1640146, 1, 0, 0.09019608, 1,
2.080601, -0.3761367, 1.692252, 1, 0, 0.08235294, 1,
2.106278, -0.4238303, 1.619787, 1, 0, 0.07843138, 1,
2.114006, 0.0972489, -0.01449786, 1, 0, 0.07058824, 1,
2.117714, -0.06927964, 1.180274, 1, 0, 0.06666667, 1,
2.164204, 0.2191405, 0.4322979, 1, 0, 0.05882353, 1,
2.226461, 0.9998994, 1.288284, 1, 0, 0.05490196, 1,
2.266144, 0.008241363, 3.169408, 1, 0, 0.04705882, 1,
2.323705, 1.049389, 0.5770423, 1, 0, 0.04313726, 1,
2.49207, -0.5784984, 1.429627, 1, 0, 0.03529412, 1,
2.495235, 1.455458, -1.239334, 1, 0, 0.03137255, 1,
2.504631, 2.052763, 1.927676, 1, 0, 0.02352941, 1,
2.616131, -0.1451459, 2.352662, 1, 0, 0.01960784, 1,
2.831283, -0.3617656, 2.418049, 1, 0, 0.01176471, 1,
3.044569, 2.689526, 1.453016, 1, 0, 0.007843138, 1
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
-0.247813, -5.356087, -6.776236, 0, -0.5, 0.5, 0.5,
-0.247813, -5.356087, -6.776236, 1, -0.5, 0.5, 0.5,
-0.247813, -5.356087, -6.776236, 1, 1.5, 0.5, 0.5,
-0.247813, -5.356087, -6.776236, 0, 1.5, 0.5, 0.5
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
-4.656313, -0.5160172, -6.776236, 0, -0.5, 0.5, 0.5,
-4.656313, -0.5160172, -6.776236, 1, -0.5, 0.5, 0.5,
-4.656313, -0.5160172, -6.776236, 1, 1.5, 0.5, 0.5,
-4.656313, -0.5160172, -6.776236, 0, 1.5, 0.5, 0.5
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
-4.656313, -5.356087, 0.5734265, 0, -0.5, 0.5, 0.5,
-4.656313, -5.356087, 0.5734265, 1, -0.5, 0.5, 0.5,
-4.656313, -5.356087, 0.5734265, 1, 1.5, 0.5, 0.5,
-4.656313, -5.356087, 0.5734265, 0, 1.5, 0.5, 0.5
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
-3, -4.239148, -5.08016,
3, -4.239148, -5.08016,
-3, -4.239148, -5.08016,
-3, -4.425304, -5.362839,
-2, -4.239148, -5.08016,
-2, -4.425304, -5.362839,
-1, -4.239148, -5.08016,
-1, -4.425304, -5.362839,
0, -4.239148, -5.08016,
0, -4.425304, -5.362839,
1, -4.239148, -5.08016,
1, -4.425304, -5.362839,
2, -4.239148, -5.08016,
2, -4.425304, -5.362839,
3, -4.239148, -5.08016,
3, -4.425304, -5.362839
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
-3, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
-3, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
-3, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
-3, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5,
-2, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
-2, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
-2, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
-2, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5,
-1, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
-1, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
-1, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
-1, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5,
0, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
0, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
0, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
0, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5,
1, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
1, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
1, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
1, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5,
2, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
2, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
2, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
2, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5,
3, -4.797617, -5.928198, 0, -0.5, 0.5, 0.5,
3, -4.797617, -5.928198, 1, -0.5, 0.5, 0.5,
3, -4.797617, -5.928198, 1, 1.5, 0.5, 0.5,
3, -4.797617, -5.928198, 0, 1.5, 0.5, 0.5
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
-3.638967, -4, -5.08016,
-3.638967, 2, -5.08016,
-3.638967, -4, -5.08016,
-3.808525, -4, -5.362839,
-3.638967, -2, -5.08016,
-3.808525, -2, -5.362839,
-3.638967, 0, -5.08016,
-3.808525, 0, -5.362839,
-3.638967, 2, -5.08016,
-3.808525, 2, -5.362839
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
"-4",
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
-4.14764, -4, -5.928198, 0, -0.5, 0.5, 0.5,
-4.14764, -4, -5.928198, 1, -0.5, 0.5, 0.5,
-4.14764, -4, -5.928198, 1, 1.5, 0.5, 0.5,
-4.14764, -4, -5.928198, 0, 1.5, 0.5, 0.5,
-4.14764, -2, -5.928198, 0, -0.5, 0.5, 0.5,
-4.14764, -2, -5.928198, 1, -0.5, 0.5, 0.5,
-4.14764, -2, -5.928198, 1, 1.5, 0.5, 0.5,
-4.14764, -2, -5.928198, 0, 1.5, 0.5, 0.5,
-4.14764, 0, -5.928198, 0, -0.5, 0.5, 0.5,
-4.14764, 0, -5.928198, 1, -0.5, 0.5, 0.5,
-4.14764, 0, -5.928198, 1, 1.5, 0.5, 0.5,
-4.14764, 0, -5.928198, 0, 1.5, 0.5, 0.5,
-4.14764, 2, -5.928198, 0, -0.5, 0.5, 0.5,
-4.14764, 2, -5.928198, 1, -0.5, 0.5, 0.5,
-4.14764, 2, -5.928198, 1, 1.5, 0.5, 0.5,
-4.14764, 2, -5.928198, 0, 1.5, 0.5, 0.5
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
-3.638967, -4.239148, -4,
-3.638967, -4.239148, 6,
-3.638967, -4.239148, -4,
-3.808525, -4.425304, -4,
-3.638967, -4.239148, -2,
-3.808525, -4.425304, -2,
-3.638967, -4.239148, 0,
-3.808525, -4.425304, 0,
-3.638967, -4.239148, 2,
-3.808525, -4.425304, 2,
-3.638967, -4.239148, 4,
-3.808525, -4.425304, 4,
-3.638967, -4.239148, 6,
-3.808525, -4.425304, 6
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
-4.14764, -4.797617, -4, 0, -0.5, 0.5, 0.5,
-4.14764, -4.797617, -4, 1, -0.5, 0.5, 0.5,
-4.14764, -4.797617, -4, 1, 1.5, 0.5, 0.5,
-4.14764, -4.797617, -4, 0, 1.5, 0.5, 0.5,
-4.14764, -4.797617, -2, 0, -0.5, 0.5, 0.5,
-4.14764, -4.797617, -2, 1, -0.5, 0.5, 0.5,
-4.14764, -4.797617, -2, 1, 1.5, 0.5, 0.5,
-4.14764, -4.797617, -2, 0, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 0, 0, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 0, 1, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 0, 1, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 0, 0, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 2, 0, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 2, 1, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 2, 1, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 2, 0, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 4, 0, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 4, 1, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 4, 1, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 4, 0, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 6, 0, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 6, 1, -0.5, 0.5, 0.5,
-4.14764, -4.797617, 6, 1, 1.5, 0.5, 0.5,
-4.14764, -4.797617, 6, 0, 1.5, 0.5, 0.5
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
-3.638967, -4.239148, -5.08016,
-3.638967, 3.207113, -5.08016,
-3.638967, -4.239148, 6.227013,
-3.638967, 3.207113, 6.227013,
-3.638967, -4.239148, -5.08016,
-3.638967, -4.239148, 6.227013,
-3.638967, 3.207113, -5.08016,
-3.638967, 3.207113, 6.227013,
-3.638967, -4.239148, -5.08016,
3.143341, -4.239148, -5.08016,
-3.638967, -4.239148, 6.227013,
3.143341, -4.239148, 6.227013,
-3.638967, 3.207113, -5.08016,
3.143341, 3.207113, -5.08016,
-3.638967, 3.207113, 6.227013,
3.143341, 3.207113, 6.227013,
3.143341, -4.239148, -5.08016,
3.143341, 3.207113, -5.08016,
3.143341, -4.239148, 6.227013,
3.143341, 3.207113, 6.227013,
3.143341, -4.239148, -5.08016,
3.143341, -4.239148, 6.227013,
3.143341, 3.207113, -5.08016,
3.143341, 3.207113, 6.227013
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
var radius = 8.08586;
var distance = 35.9749;
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
mvMatrix.translate( 0.247813, 0.5160172, -0.5734265 );
mvMatrix.scale( 1.289029, 1.174091, 0.7731897 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.9749);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
ditolyl_ether<-read.table("ditolyl_ether.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ditolyl_ether$V2
```

```
## Error in eval(expr, envir, enclos): object 'ditolyl_ether' not found
```

```r
y<-ditolyl_ether$V3
```

```
## Error in eval(expr, envir, enclos): object 'ditolyl_ether' not found
```

```r
z<-ditolyl_ether$V4
```

```
## Error in eval(expr, envir, enclos): object 'ditolyl_ether' not found
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
-3.540195, -0.03374946, -0.8656946, 0, 0, 1, 1, 1,
-3.34889, 0.9292612, -1.110416, 1, 0, 0, 1, 1,
-3.2309, 0.1044177, -0.4547687, 1, 0, 0, 1, 1,
-3.163899, 0.5252174, -1.309495, 1, 0, 0, 1, 1,
-2.781843, 0.5160291, -0.309608, 1, 0, 0, 1, 1,
-2.741672, -0.2584893, -1.482199, 1, 0, 0, 1, 1,
-2.554257, 1.472725, -1.690233, 0, 0, 0, 1, 1,
-2.54568, -0.9106882, -2.200027, 0, 0, 0, 1, 1,
-2.489124, 0.5821179, -1.012933, 0, 0, 0, 1, 1,
-2.467989, -0.9138694, -2.810788, 0, 0, 0, 1, 1,
-2.463902, -0.5473193, -1.475984, 0, 0, 0, 1, 1,
-2.336948, 1.363938, -0.885064, 0, 0, 0, 1, 1,
-2.279549, -2.058985, -3.336096, 0, 0, 0, 1, 1,
-2.27954, -0.4760397, -3.037826, 1, 1, 1, 1, 1,
-2.187535, -1.27807, -1.29523, 1, 1, 1, 1, 1,
-2.123576, -0.8729114, -1.612848, 1, 1, 1, 1, 1,
-2.067279, 0.5295459, 0.7789615, 1, 1, 1, 1, 1,
-2.060772, -0.3489421, -2.11051, 1, 1, 1, 1, 1,
-2.050678, 0.809413, 0.5493405, 1, 1, 1, 1, 1,
-2.01451, -0.3130938, -0.3765675, 1, 1, 1, 1, 1,
-2.009099, 0.5076285, -0.8611343, 1, 1, 1, 1, 1,
-1.991401, -1.716948, -2.182063, 1, 1, 1, 1, 1,
-1.96855, -0.2631425, -1.214649, 1, 1, 1, 1, 1,
-1.96707, -0.04804957, -1.824165, 1, 1, 1, 1, 1,
-1.899319, -1.487664, -0.9200618, 1, 1, 1, 1, 1,
-1.864652, -0.3302381, -1.667463, 1, 1, 1, 1, 1,
-1.842929, -0.5101954, -1.401297, 1, 1, 1, 1, 1,
-1.840124, 0.875771, -1.73489, 1, 1, 1, 1, 1,
-1.829069, -0.6525509, -3.053296, 0, 0, 1, 1, 1,
-1.81912, -1.538502, -3.372493, 1, 0, 0, 1, 1,
-1.81713, 1.662318, 0.6632403, 1, 0, 0, 1, 1,
-1.816777, 0.9956796, -1.298629, 1, 0, 0, 1, 1,
-1.799211, -0.07955667, -1.86675, 1, 0, 0, 1, 1,
-1.796665, 1.720329, 0.1360773, 1, 0, 0, 1, 1,
-1.764218, 0.7275896, -1.477462, 0, 0, 0, 1, 1,
-1.753357, 1.957152, -0.8036349, 0, 0, 0, 1, 1,
-1.752881, -0.1901547, -1.221898, 0, 0, 0, 1, 1,
-1.738745, 1.65824, 0.5864108, 0, 0, 0, 1, 1,
-1.732026, -0.8597558, -1.040153, 0, 0, 0, 1, 1,
-1.730998, 0.7087901, -0.4977558, 0, 0, 0, 1, 1,
-1.705656, 0.7203023, -1.9967, 0, 0, 0, 1, 1,
-1.705343, -0.5146202, -1.609936, 1, 1, 1, 1, 1,
-1.698708, -1.745304, -1.229713, 1, 1, 1, 1, 1,
-1.693567, 2.591295, -1.522928, 1, 1, 1, 1, 1,
-1.663088, -3.766559, -2.667991, 1, 1, 1, 1, 1,
-1.653968, 1.080174, 0.02668541, 1, 1, 1, 1, 1,
-1.652666, -0.2482715, -1.549691, 1, 1, 1, 1, 1,
-1.649434, 0.5122096, 1.465649, 1, 1, 1, 1, 1,
-1.641931, 0.8190569, -1.930101, 1, 1, 1, 1, 1,
-1.636937, -0.04875939, -1.513746, 1, 1, 1, 1, 1,
-1.627047, 0.7413518, 0.006499671, 1, 1, 1, 1, 1,
-1.620334, 0.4028351, -0.4008185, 1, 1, 1, 1, 1,
-1.618982, -0.1271695, -0.6781234, 1, 1, 1, 1, 1,
-1.60232, -0.3548011, -0.7077734, 1, 1, 1, 1, 1,
-1.58479, 0.1159835, -0.8559195, 1, 1, 1, 1, 1,
-1.562404, 1.235859, -1.599927, 1, 1, 1, 1, 1,
-1.553864, 1.162243, -1.392244, 0, 0, 1, 1, 1,
-1.553053, -1.350788, -0.3153773, 1, 0, 0, 1, 1,
-1.544925, 0.05268876, -0.4854276, 1, 0, 0, 1, 1,
-1.53983, 0.4472218, -1.018557, 1, 0, 0, 1, 1,
-1.53644, -0.3804595, -1.878207, 1, 0, 0, 1, 1,
-1.535553, 1.213248, -1.645074, 1, 0, 0, 1, 1,
-1.533578, -0.4683789, -1.972937, 0, 0, 0, 1, 1,
-1.530134, -1.253618, -1.123693, 0, 0, 0, 1, 1,
-1.524953, -1.248468, -1.372909, 0, 0, 0, 1, 1,
-1.521514, 0.3068925, -2.324881, 0, 0, 0, 1, 1,
-1.508072, -0.4521338, -2.905779, 0, 0, 0, 1, 1,
-1.505702, 0.1841655, -0.8059182, 0, 0, 0, 1, 1,
-1.481217, -1.144972, -1.035968, 0, 0, 0, 1, 1,
-1.46629, -1.254402, -3.189564, 1, 1, 1, 1, 1,
-1.466241, -0.6370775, -2.022123, 1, 1, 1, 1, 1,
-1.460965, -0.6447383, -3.485026, 1, 1, 1, 1, 1,
-1.457616, -0.4036307, -2.298656, 1, 1, 1, 1, 1,
-1.456348, 1.456216, -1.113597, 1, 1, 1, 1, 1,
-1.45364, 0.07568769, -0.9994946, 1, 1, 1, 1, 1,
-1.444067, -0.2446689, -2.937994, 1, 1, 1, 1, 1,
-1.440411, -1.091712, -1.486579, 1, 1, 1, 1, 1,
-1.429281, 0.4515823, -2.312758, 1, 1, 1, 1, 1,
-1.426519, 0.5746524, -2.229862, 1, 1, 1, 1, 1,
-1.410276, -1.26171, -3.105026, 1, 1, 1, 1, 1,
-1.407164, 0.8862522, -0.908304, 1, 1, 1, 1, 1,
-1.397709, -1.2584, -2.940108, 1, 1, 1, 1, 1,
-1.384691, 1.345553, -0.2805584, 1, 1, 1, 1, 1,
-1.382733, 0.9755848, -1.154624, 1, 1, 1, 1, 1,
-1.382581, 0.525607, -1.129742, 0, 0, 1, 1, 1,
-1.376492, 0.3655489, -1.542899, 1, 0, 0, 1, 1,
-1.370786, 1.712878, -0.0001522382, 1, 0, 0, 1, 1,
-1.369533, -0.03633684, -0.5931284, 1, 0, 0, 1, 1,
-1.361083, 0.003667405, -2.216793, 1, 0, 0, 1, 1,
-1.359013, -1.395044, -0.9290969, 1, 0, 0, 1, 1,
-1.353533, 1.019514, -0.4769473, 0, 0, 0, 1, 1,
-1.351382, 0.4816402, -2.190814, 0, 0, 0, 1, 1,
-1.350925, -0.2464627, -0.8319666, 0, 0, 0, 1, 1,
-1.349615, -1.660354, -2.934163, 0, 0, 0, 1, 1,
-1.341668, -1.134867, -1.352858, 0, 0, 0, 1, 1,
-1.338951, -1.555529, -2.53964, 0, 0, 0, 1, 1,
-1.327018, 1.413381, -0.4261742, 0, 0, 0, 1, 1,
-1.323936, 0.2026958, -0.8334421, 1, 1, 1, 1, 1,
-1.322962, -1.023328, -1.132865, 1, 1, 1, 1, 1,
-1.320842, -0.3488032, -0.4378485, 1, 1, 1, 1, 1,
-1.319757, -0.7189302, -3.145851, 1, 1, 1, 1, 1,
-1.31523, 0.1049242, -2.528988, 1, 1, 1, 1, 1,
-1.307505, 0.6075844, 0.4154127, 1, 1, 1, 1, 1,
-1.306689, -1.381163, -3.053956, 1, 1, 1, 1, 1,
-1.305959, -0.1943002, -0.4708209, 1, 1, 1, 1, 1,
-1.297032, -1.331855, -3.114514, 1, 1, 1, 1, 1,
-1.285756, 0.2673929, -1.395405, 1, 1, 1, 1, 1,
-1.285293, -1.301152, -3.505715, 1, 1, 1, 1, 1,
-1.278987, 0.0527757, -2.459457, 1, 1, 1, 1, 1,
-1.276512, -0.9608473, -3.220388, 1, 1, 1, 1, 1,
-1.273834, -0.001852448, 0.3988671, 1, 1, 1, 1, 1,
-1.264312, -1.279167, -1.166275, 1, 1, 1, 1, 1,
-1.261946, 1.410741, -0.05710602, 0, 0, 1, 1, 1,
-1.260564, 1.305181, 0.4687698, 1, 0, 0, 1, 1,
-1.248113, -0.3348207, -1.074226, 1, 0, 0, 1, 1,
-1.242112, 1.629524, -1.224928, 1, 0, 0, 1, 1,
-1.240695, -0.01352498, -3.617415, 1, 0, 0, 1, 1,
-1.23978, 0.1527659, -2.005002, 1, 0, 0, 1, 1,
-1.231687, 0.9904947, -0.08154691, 0, 0, 0, 1, 1,
-1.224549, -0.2234307, -2.967535, 0, 0, 0, 1, 1,
-1.222561, 2.466718, 2.138928, 0, 0, 0, 1, 1,
-1.212949, 1.58451, -0.7410017, 0, 0, 0, 1, 1,
-1.205108, 0.5342935, -1.591577, 0, 0, 0, 1, 1,
-1.199957, -0.2877212, -2.80298, 0, 0, 0, 1, 1,
-1.194149, -1.100788, -1.91426, 0, 0, 0, 1, 1,
-1.192454, -1.300416, -3.271865, 1, 1, 1, 1, 1,
-1.188949, 1.236642, 0.4409076, 1, 1, 1, 1, 1,
-1.188368, -0.1349922, -2.221818, 1, 1, 1, 1, 1,
-1.183958, 0.4445182, -0.3936087, 1, 1, 1, 1, 1,
-1.182803, 0.2770487, -1.917825, 1, 1, 1, 1, 1,
-1.165515, -0.0955616, -1.389946, 1, 1, 1, 1, 1,
-1.16322, -0.3261685, 0.2661772, 1, 1, 1, 1, 1,
-1.161445, -0.8966419, -3.100011, 1, 1, 1, 1, 1,
-1.159964, 0.06746712, -1.872504, 1, 1, 1, 1, 1,
-1.158991, 1.241619, 0.3849069, 1, 1, 1, 1, 1,
-1.149416, 0.1777933, -0.5652528, 1, 1, 1, 1, 1,
-1.147724, -0.8840815, -2.534315, 1, 1, 1, 1, 1,
-1.145877, 0.4635804, -3.228834, 1, 1, 1, 1, 1,
-1.126775, -0.1602025, -1.784959, 1, 1, 1, 1, 1,
-1.120472, -0.7909964, -3.1555, 1, 1, 1, 1, 1,
-1.109622, -0.0378434, -0.9807146, 0, 0, 1, 1, 1,
-1.108332, -0.5154084, -2.107514, 1, 0, 0, 1, 1,
-1.107479, 0.3184909, 0.2489049, 1, 0, 0, 1, 1,
-1.105338, 0.8000464, 1.450911, 1, 0, 0, 1, 1,
-1.088808, -0.8452682, -1.526676, 1, 0, 0, 1, 1,
-1.07914, 1.624568, -1.319973, 1, 0, 0, 1, 1,
-1.076516, -0.2521514, -1.292097, 0, 0, 0, 1, 1,
-1.075509, -2.319507, -2.288809, 0, 0, 0, 1, 1,
-1.066623, 0.563149, -0.6623771, 0, 0, 0, 1, 1,
-1.065991, -0.1014295, -1.562569, 0, 0, 0, 1, 1,
-1.062428, -1.144349, -1.654032, 0, 0, 0, 1, 1,
-1.057266, 0.2229377, -3.245437, 0, 0, 0, 1, 1,
-1.053922, -0.5244755, -1.152344, 0, 0, 0, 1, 1,
-1.045956, 1.797814, -2.14824, 1, 1, 1, 1, 1,
-1.037791, -1.337989, -0.9609162, 1, 1, 1, 1, 1,
-1.03263, -0.2033165, -2.973468, 1, 1, 1, 1, 1,
-1.029726, 0.235605, -0.169935, 1, 1, 1, 1, 1,
-1.023639, 0.5974512, -1.162625, 1, 1, 1, 1, 1,
-1.023528, -0.5587827, -3.104493, 1, 1, 1, 1, 1,
-1.019755, -1.122345, -2.132571, 1, 1, 1, 1, 1,
-1.015102, -0.8653867, -2.281652, 1, 1, 1, 1, 1,
-1.012158, 0.02703971, -2.330258, 1, 1, 1, 1, 1,
-1.001783, -0.03191699, -2.641308, 1, 1, 1, 1, 1,
-1.000721, 0.9107398, -0.2650451, 1, 1, 1, 1, 1,
-0.9968719, -0.603821, 0.9178971, 1, 1, 1, 1, 1,
-0.9922621, -1.936059, -2.591254, 1, 1, 1, 1, 1,
-0.9919131, 1.373111, -1.859389, 1, 1, 1, 1, 1,
-0.9885825, -0.9023329, -2.418921, 1, 1, 1, 1, 1,
-0.9874007, -0.553812, -2.76685, 0, 0, 1, 1, 1,
-0.9764288, 0.2430833, -1.359127, 1, 0, 0, 1, 1,
-0.9743538, 0.2497941, -3.963272, 1, 0, 0, 1, 1,
-0.9702564, 0.2254597, -0.02882965, 1, 0, 0, 1, 1,
-0.969078, 0.01519783, -0.7331933, 1, 0, 0, 1, 1,
-0.9625533, 2.331037, 0.4463365, 1, 0, 0, 1, 1,
-0.9602005, 2.434556, -0.659947, 0, 0, 0, 1, 1,
-0.9589667, -0.5476594, -1.789039, 0, 0, 0, 1, 1,
-0.9408711, 2.34468, 1.197606, 0, 0, 0, 1, 1,
-0.9329278, -0.2594655, -0.9983483, 0, 0, 0, 1, 1,
-0.9264843, -1.06672, -2.567241, 0, 0, 0, 1, 1,
-0.9254926, 0.3374879, -1.747488, 0, 0, 0, 1, 1,
-0.9196606, -1.884802, -4.507287, 0, 0, 0, 1, 1,
-0.9167139, -0.5208138, -1.489463, 1, 1, 1, 1, 1,
-0.904183, -0.3723757, -1.388707, 1, 1, 1, 1, 1,
-0.8849859, 0.547703, 1.421906, 1, 1, 1, 1, 1,
-0.8758015, 0.482452, -2.496473, 1, 1, 1, 1, 1,
-0.8752975, 0.08626296, -1.67086, 1, 1, 1, 1, 1,
-0.8738291, 0.8836793, -0.9663647, 1, 1, 1, 1, 1,
-0.8723521, 0.05428652, -1.755479, 1, 1, 1, 1, 1,
-0.8715223, 0.8276581, -1.410848, 1, 1, 1, 1, 1,
-0.869915, 0.1748641, -1.226668, 1, 1, 1, 1, 1,
-0.8678835, -1.086679, -4.424221, 1, 1, 1, 1, 1,
-0.8667206, -0.4438412, -2.08067, 1, 1, 1, 1, 1,
-0.846805, -0.2514078, -1.909914, 1, 1, 1, 1, 1,
-0.8442456, -0.2772476, -2.610248, 1, 1, 1, 1, 1,
-0.8403766, 1.446202, -2.101022, 1, 1, 1, 1, 1,
-0.8371463, 1.524152, -1.576596, 1, 1, 1, 1, 1,
-0.834803, 1.051525, 0.3269749, 0, 0, 1, 1, 1,
-0.8330965, -2.0971, -2.968704, 1, 0, 0, 1, 1,
-0.824129, -0.7474046, -3.299325, 1, 0, 0, 1, 1,
-0.8214029, -0.9932452, -3.86067, 1, 0, 0, 1, 1,
-0.8207772, 1.330502, 0.5475398, 1, 0, 0, 1, 1,
-0.815612, 0.1914773, -0.5877203, 1, 0, 0, 1, 1,
-0.8077213, 0.3214717, -0.5614496, 0, 0, 0, 1, 1,
-0.8055223, 0.1260656, -0.03796818, 0, 0, 0, 1, 1,
-0.8025519, 0.886196, -1.947466, 0, 0, 0, 1, 1,
-0.7940591, -0.502178, -3.102755, 0, 0, 0, 1, 1,
-0.7921897, -0.5145904, -2.484065, 0, 0, 0, 1, 1,
-0.7821764, 0.4548926, -1.819234, 0, 0, 0, 1, 1,
-0.7802581, -1.086109, -2.667898, 0, 0, 0, 1, 1,
-0.7745172, -0.04155968, -2.824663, 1, 1, 1, 1, 1,
-0.7618152, 0.1810147, -2.67638, 1, 1, 1, 1, 1,
-0.7484095, -0.02342088, -1.851264, 1, 1, 1, 1, 1,
-0.743508, -0.8029556, -4.745158, 1, 1, 1, 1, 1,
-0.7355475, 0.2759476, 0.3891307, 1, 1, 1, 1, 1,
-0.7351389, 1.217873, -0.3731101, 1, 1, 1, 1, 1,
-0.7338617, -0.1644739, -1.57384, 1, 1, 1, 1, 1,
-0.7274312, 1.744131, -0.6521986, 1, 1, 1, 1, 1,
-0.7271953, 1.099967, -0.9818681, 1, 1, 1, 1, 1,
-0.7264848, 1.833149, -0.8889996, 1, 1, 1, 1, 1,
-0.7251233, -1.512986, -2.869883, 1, 1, 1, 1, 1,
-0.7163715, 3.098672, 2.434142, 1, 1, 1, 1, 1,
-0.7129825, -1.182336, -4.129704, 1, 1, 1, 1, 1,
-0.7117629, 0.1142648, -1.094564, 1, 1, 1, 1, 1,
-0.7088127, -0.7195414, -3.161929, 1, 1, 1, 1, 1,
-0.7071465, -0.5752308, -2.785192, 0, 0, 1, 1, 1,
-0.7054802, 0.1046231, -0.9439107, 1, 0, 0, 1, 1,
-0.6990626, -0.5673789, -0.6687081, 1, 0, 0, 1, 1,
-0.6979825, 1.103573, -1.354474, 1, 0, 0, 1, 1,
-0.6937916, 1.87416, 0.2184958, 1, 0, 0, 1, 1,
-0.6907273, 0.4180864, -1.016445, 1, 0, 0, 1, 1,
-0.6843725, 0.0342323, -3.902669, 0, 0, 0, 1, 1,
-0.6814215, -0.4659589, -1.651408, 0, 0, 0, 1, 1,
-0.6704267, -0.1326482, -2.386842, 0, 0, 0, 1, 1,
-0.6561352, 0.01055467, -2.346973, 0, 0, 0, 1, 1,
-0.6529953, 1.309096, -0.1949827, 0, 0, 0, 1, 1,
-0.6526718, -1.528274, -2.89043, 0, 0, 0, 1, 1,
-0.6426373, 0.7497811, -0.9124632, 0, 0, 0, 1, 1,
-0.6417528, 0.01200104, -0.68891, 1, 1, 1, 1, 1,
-0.6400216, 0.9593512, -0.1687765, 1, 1, 1, 1, 1,
-0.6351106, 0.5811942, -0.299304, 1, 1, 1, 1, 1,
-0.6274514, 1.105858, -0.874387, 1, 1, 1, 1, 1,
-0.626564, -0.2288187, -2.956735, 1, 1, 1, 1, 1,
-0.6260427, 1.659397, 1.03532, 1, 1, 1, 1, 1,
-0.6257794, 0.4321137, -1.046825, 1, 1, 1, 1, 1,
-0.6184726, 1.018373, -0.3951747, 1, 1, 1, 1, 1,
-0.6109738, -0.1338475, -1.690843, 1, 1, 1, 1, 1,
-0.6011456, 1.328259, -0.2836465, 1, 1, 1, 1, 1,
-0.6010742, 1.720463, -2.025204, 1, 1, 1, 1, 1,
-0.599662, -0.9027488, -3.171326, 1, 1, 1, 1, 1,
-0.5970609, 1.929687, -0.1621846, 1, 1, 1, 1, 1,
-0.5962117, 0.2237958, -0.7323728, 1, 1, 1, 1, 1,
-0.5900694, 0.8874122, -0.2332983, 1, 1, 1, 1, 1,
-0.5876383, -0.4010021, -2.995381, 0, 0, 1, 1, 1,
-0.583857, 0.5911698, -0.2964975, 1, 0, 0, 1, 1,
-0.5816113, 1.100793, -0.7201633, 1, 0, 0, 1, 1,
-0.5810143, -0.0942358, -0.7744107, 1, 0, 0, 1, 1,
-0.5779441, -0.9397147, -1.86858, 1, 0, 0, 1, 1,
-0.5771111, 0.06345429, 0.01857889, 1, 0, 0, 1, 1,
-0.5759484, -0.2042854, -2.505194, 0, 0, 0, 1, 1,
-0.5756024, 0.2171544, -1.661555, 0, 0, 0, 1, 1,
-0.5731148, 0.07079029, -3.146586, 0, 0, 0, 1, 1,
-0.5703112, -0.6466612, -2.097264, 0, 0, 0, 1, 1,
-0.5682295, -0.8906049, -2.288376, 0, 0, 0, 1, 1,
-0.5653998, 0.9383459, -1.408902, 0, 0, 0, 1, 1,
-0.5629038, 0.839794, -2.185836, 0, 0, 0, 1, 1,
-0.5623206, -0.4018908, -2.551232, 1, 1, 1, 1, 1,
-0.5620123, 1.291925, -0.8056728, 1, 1, 1, 1, 1,
-0.5488472, -1.391308, -2.298653, 1, 1, 1, 1, 1,
-0.5440371, -0.8281938, -2.794296, 1, 1, 1, 1, 1,
-0.5320995, -1.634807, -3.340136, 1, 1, 1, 1, 1,
-0.529822, 1.541537, 0.6526449, 1, 1, 1, 1, 1,
-0.5294352, 1.014212, -0.650759, 1, 1, 1, 1, 1,
-0.5286649, -0.1320819, -0.6013597, 1, 1, 1, 1, 1,
-0.5237326, -0.3530718, -2.793597, 1, 1, 1, 1, 1,
-0.5105363, 0.3672735, 0.824607, 1, 1, 1, 1, 1,
-0.5097966, 0.0964137, -1.644018, 1, 1, 1, 1, 1,
-0.5072871, 0.3984993, 0.7849693, 1, 1, 1, 1, 1,
-0.4987474, -1.127035, -3.130699, 1, 1, 1, 1, 1,
-0.4957341, 0.927398, -1.261867, 1, 1, 1, 1, 1,
-0.4931198, -0.8135611, -2.269579, 1, 1, 1, 1, 1,
-0.4884524, -0.849669, -1.450814, 0, 0, 1, 1, 1,
-0.4866074, -1.458145, -4.63059, 1, 0, 0, 1, 1,
-0.4861143, -0.9937496, -3.333338, 1, 0, 0, 1, 1,
-0.484899, 0.2411261, -0.7231887, 1, 0, 0, 1, 1,
-0.4842501, 1.107839, -0.5058479, 1, 0, 0, 1, 1,
-0.4832583, -1.101488, -3.01897, 1, 0, 0, 1, 1,
-0.481849, 0.4929112, 0.1986827, 0, 0, 0, 1, 1,
-0.477079, 0.4778208, -1.098567, 0, 0, 0, 1, 1,
-0.4762519, -0.5229723, -2.531721, 0, 0, 0, 1, 1,
-0.4740886, 1.014428, -1.532805, 0, 0, 0, 1, 1,
-0.4736075, 0.5858282, -0.01683349, 0, 0, 0, 1, 1,
-0.4724959, -0.8869585, -3.226825, 0, 0, 0, 1, 1,
-0.467696, 0.8552551, -0.1520633, 0, 0, 0, 1, 1,
-0.4651404, -0.5927684, -1.932895, 1, 1, 1, 1, 1,
-0.4615313, 0.7519602, 0.4711153, 1, 1, 1, 1, 1,
-0.4583986, -0.3110973, -3.746739, 1, 1, 1, 1, 1,
-0.457644, 0.006980025, -2.228779, 1, 1, 1, 1, 1,
-0.4570371, 1.34365, 0.06936466, 1, 1, 1, 1, 1,
-0.4548586, -1.324354, -4.63773, 1, 1, 1, 1, 1,
-0.4541581, 0.3687426, -0.6449392, 1, 1, 1, 1, 1,
-0.4488315, -0.7307243, -1.297343, 1, 1, 1, 1, 1,
-0.448555, 0.8152547, -0.9024094, 1, 1, 1, 1, 1,
-0.4477041, 0.6018359, 0.8290557, 1, 1, 1, 1, 1,
-0.4440488, 0.1524426, -0.8395261, 1, 1, 1, 1, 1,
-0.4361917, 1.533204, -1.632362, 1, 1, 1, 1, 1,
-0.4341544, 0.1708382, -2.031377, 1, 1, 1, 1, 1,
-0.4333126, 0.1055765, -0.6137717, 1, 1, 1, 1, 1,
-0.4310657, -0.4139305, -1.290812, 1, 1, 1, 1, 1,
-0.4252762, 0.5077448, -0.6673803, 0, 0, 1, 1, 1,
-0.4240824, -0.09791137, -1.519137, 1, 0, 0, 1, 1,
-0.4218636, 0.7131987, 0.02652736, 1, 0, 0, 1, 1,
-0.421679, -0.2180576, -1.123251, 1, 0, 0, 1, 1,
-0.4205332, 0.100592, -3.528448, 1, 0, 0, 1, 1,
-0.4198803, 1.02725, -1.397112, 1, 0, 0, 1, 1,
-0.4196991, -0.2417308, -3.047971, 0, 0, 0, 1, 1,
-0.4195633, 1.6606, 0.7026156, 0, 0, 0, 1, 1,
-0.4102553, -0.2043607, -1.289542, 0, 0, 0, 1, 1,
-0.4100604, 0.2276257, -1.042378, 0, 0, 0, 1, 1,
-0.4082508, 0.3561379, -2.126474, 0, 0, 0, 1, 1,
-0.4025092, 1.04813, -0.7583203, 0, 0, 0, 1, 1,
-0.4013173, 0.5122882, 1.273876, 0, 0, 0, 1, 1,
-0.3981099, -0.08855917, -0.4780289, 1, 1, 1, 1, 1,
-0.3916122, 2.092698, -0.01462576, 1, 1, 1, 1, 1,
-0.3789671, 0.414847, -0.7947534, 1, 1, 1, 1, 1,
-0.3748786, -1.462345, -0.7113587, 1, 1, 1, 1, 1,
-0.3726114, 0.07864678, -1.751265, 1, 1, 1, 1, 1,
-0.3713758, -1.083136, -3.456023, 1, 1, 1, 1, 1,
-0.369209, 0.9948535, -2.116029, 1, 1, 1, 1, 1,
-0.3634099, 2.222332, 0.2111481, 1, 1, 1, 1, 1,
-0.3620093, -1.094717, -1.708562, 1, 1, 1, 1, 1,
-0.3615555, -0.02477656, 0.4209108, 1, 1, 1, 1, 1,
-0.3588865, -0.3882802, -1.880382, 1, 1, 1, 1, 1,
-0.3583255, -1.324282, -3.355909, 1, 1, 1, 1, 1,
-0.3559395, -0.01450814, -1.720654, 1, 1, 1, 1, 1,
-0.3492767, -0.461996, -4.105202, 1, 1, 1, 1, 1,
-0.3453938, -0.8242553, -2.534109, 1, 1, 1, 1, 1,
-0.343237, -0.5406213, -3.204976, 0, 0, 1, 1, 1,
-0.3431408, 0.5268602, -0.780493, 1, 0, 0, 1, 1,
-0.3426429, -0.5539762, -2.962696, 1, 0, 0, 1, 1,
-0.3408189, -0.7401571, -4.459831, 1, 0, 0, 1, 1,
-0.3359532, 0.7864997, -2.899604, 1, 0, 0, 1, 1,
-0.3348782, 1.492924, -0.7155651, 1, 0, 0, 1, 1,
-0.3340115, -2.450349, -2.52323, 0, 0, 0, 1, 1,
-0.3328923, -0.9860007, -1.563561, 0, 0, 0, 1, 1,
-0.3313771, -1.102314, -3.705978, 0, 0, 0, 1, 1,
-0.3308636, 0.03961727, -2.177166, 0, 0, 0, 1, 1,
-0.3282773, -0.7995379, -1.999148, 0, 0, 0, 1, 1,
-0.3264316, -0.1037876, -3.48714, 0, 0, 0, 1, 1,
-0.3260995, 0.669944, -1.815281, 0, 0, 0, 1, 1,
-0.3249312, 1.324159, 0.1019761, 1, 1, 1, 1, 1,
-0.3242943, 0.5332513, -0.4294449, 1, 1, 1, 1, 1,
-0.320445, -1.176128, -3.745073, 1, 1, 1, 1, 1,
-0.3202614, 1.074017, -1.609307, 1, 1, 1, 1, 1,
-0.3181089, -1.089573, -1.198145, 1, 1, 1, 1, 1,
-0.3171002, -0.9140029, -1.413085, 1, 1, 1, 1, 1,
-0.3159652, -0.8953339, -2.291893, 1, 1, 1, 1, 1,
-0.3157209, -1.224014, -1.800797, 1, 1, 1, 1, 1,
-0.3066311, 0.9515702, 0.06767163, 1, 1, 1, 1, 1,
-0.3056597, 0.1956523, -0.3739513, 1, 1, 1, 1, 1,
-0.3037241, 1.33658, -0.8791193, 1, 1, 1, 1, 1,
-0.2999538, -2.641117, -2.038967, 1, 1, 1, 1, 1,
-0.2950415, 1.638057, 1.114195, 1, 1, 1, 1, 1,
-0.2931405, 0.04011556, -1.224729, 1, 1, 1, 1, 1,
-0.2881815, 0.9305572, -0.7830172, 1, 1, 1, 1, 1,
-0.2793207, -0.2890523, -2.600541, 0, 0, 1, 1, 1,
-0.2790512, -0.4437497, -3.071847, 1, 0, 0, 1, 1,
-0.2781802, -1.224775, -3.923158, 1, 0, 0, 1, 1,
-0.2682429, -0.8660012, -2.858226, 1, 0, 0, 1, 1,
-0.265886, 0.6106524, -0.7503919, 1, 0, 0, 1, 1,
-0.264735, -0.5755671, -2.632321, 1, 0, 0, 1, 1,
-0.2638015, 1.383916, 0.5012711, 0, 0, 0, 1, 1,
-0.2630907, 0.6626047, -0.3921625, 0, 0, 0, 1, 1,
-0.2588812, -0.8137909, -2.112175, 0, 0, 0, 1, 1,
-0.258465, -0.7975102, -2.013583, 0, 0, 0, 1, 1,
-0.2576099, -1.368754, -2.693664, 0, 0, 0, 1, 1,
-0.2575713, -1.804948, -3.87931, 0, 0, 0, 1, 1,
-0.2563903, 1.352583, 0.6222407, 0, 0, 0, 1, 1,
-0.2553449, 1.341705, 0.3008708, 1, 1, 1, 1, 1,
-0.2530721, -0.2233905, -2.349234, 1, 1, 1, 1, 1,
-0.2479111, 0.2069732, -1.244448, 1, 1, 1, 1, 1,
-0.2470871, 0.4535952, 0.1126893, 1, 1, 1, 1, 1,
-0.2443614, 0.5436427, -1.043489, 1, 1, 1, 1, 1,
-0.2440122, -0.2482035, -2.117133, 1, 1, 1, 1, 1,
-0.2415623, -0.9706749, -2.201697, 1, 1, 1, 1, 1,
-0.2395433, 0.9835882, -0.3970869, 1, 1, 1, 1, 1,
-0.2368116, 0.5003595, 0.1581563, 1, 1, 1, 1, 1,
-0.2359422, -0.5059686, -4.890895, 1, 1, 1, 1, 1,
-0.2354819, -2.27567, -2.300344, 1, 1, 1, 1, 1,
-0.2332346, 0.1996234, -1.091323, 1, 1, 1, 1, 1,
-0.2322772, 0.4306515, -0.8837934, 1, 1, 1, 1, 1,
-0.2313927, -0.01767646, -4.207667, 1, 1, 1, 1, 1,
-0.2302223, -2.24854, -1.957714, 1, 1, 1, 1, 1,
-0.2255034, 0.9170721, 1.582943, 0, 0, 1, 1, 1,
-0.2222307, 0.4450375, 0.5102213, 1, 0, 0, 1, 1,
-0.2222105, -0.2085494, -3.35499, 1, 0, 0, 1, 1,
-0.2203885, 0.5439801, 0.4569783, 1, 0, 0, 1, 1,
-0.2184093, 1.678509, 1.182463, 1, 0, 0, 1, 1,
-0.2181902, -0.5802771, -2.938617, 1, 0, 0, 1, 1,
-0.2139503, -0.7252962, -2.308707, 0, 0, 0, 1, 1,
-0.2106436, -1.181652, -0.5541229, 0, 0, 0, 1, 1,
-0.2039569, -0.3771725, -1.55216, 0, 0, 0, 1, 1,
-0.1987609, -0.6264215, -2.107501, 0, 0, 0, 1, 1,
-0.1952974, 0.4660604, -0.2224414, 0, 0, 0, 1, 1,
-0.1948985, -0.2245409, -2.685467, 0, 0, 0, 1, 1,
-0.1927566, -0.07061154, -0.9180841, 0, 0, 0, 1, 1,
-0.1864453, -0.2002949, 0.01034797, 1, 1, 1, 1, 1,
-0.1835018, -1.442613, -2.99868, 1, 1, 1, 1, 1,
-0.1826887, 0.2602959, -0.8661499, 1, 1, 1, 1, 1,
-0.1810861, 0.01243127, -0.8135541, 1, 1, 1, 1, 1,
-0.178374, -1.288043, -2.378359, 1, 1, 1, 1, 1,
-0.1779472, -0.4360252, -2.32343, 1, 1, 1, 1, 1,
-0.1765171, -0.5685806, -1.426632, 1, 1, 1, 1, 1,
-0.1721071, 1.035177, 0.5584052, 1, 1, 1, 1, 1,
-0.1699402, -1.084168, -4.915493, 1, 1, 1, 1, 1,
-0.163349, 0.192737, -2.479012, 1, 1, 1, 1, 1,
-0.1618674, -1.097016, -3.263997, 1, 1, 1, 1, 1,
-0.1598191, 0.7312905, 0.1545303, 1, 1, 1, 1, 1,
-0.1575094, 0.2024345, 0.4466894, 1, 1, 1, 1, 1,
-0.1525455, 0.2231012, -2.137383, 1, 1, 1, 1, 1,
-0.1512855, 0.2768536, -1.022775, 1, 1, 1, 1, 1,
-0.1474555, 0.3572861, -2.372186, 0, 0, 1, 1, 1,
-0.1462848, -1.438404, -2.123487, 1, 0, 0, 1, 1,
-0.1410142, -0.9668601, -3.581992, 1, 0, 0, 1, 1,
-0.1406878, 1.080496, 0.8308158, 1, 0, 0, 1, 1,
-0.1399566, 2.62407, -1.087307, 1, 0, 0, 1, 1,
-0.1384391, 0.1708239, -1.610618, 1, 0, 0, 1, 1,
-0.1376246, 1.599652, 0.8189499, 0, 0, 0, 1, 1,
-0.1338631, -1.111574, -2.350794, 0, 0, 0, 1, 1,
-0.1331735, 0.3270859, -0.7252386, 0, 0, 0, 1, 1,
-0.1312295, 0.4889229, 2.764, 0, 0, 0, 1, 1,
-0.1303675, 0.8004187, -0.04783416, 0, 0, 0, 1, 1,
-0.1300858, 1.080597, 0.2774357, 0, 0, 0, 1, 1,
-0.1278932, -0.3854418, -3.591328, 0, 0, 0, 1, 1,
-0.1215049, -0.4370497, -2.97376, 1, 1, 1, 1, 1,
-0.1208751, 0.1343795, -0.2216922, 1, 1, 1, 1, 1,
-0.1205909, -0.8597757, 0.2658538, 1, 1, 1, 1, 1,
-0.1197808, 0.7702269, -0.5225366, 1, 1, 1, 1, 1,
-0.1167047, 1.518675, 1.290356, 1, 1, 1, 1, 1,
-0.1164695, -1.481689, -2.485133, 1, 1, 1, 1, 1,
-0.1147833, -1.056999, -2.89065, 1, 1, 1, 1, 1,
-0.1103207, -1.354969, -1.226887, 1, 1, 1, 1, 1,
-0.1094076, -1.216599, -2.060396, 1, 1, 1, 1, 1,
-0.1090827, 0.559733, -0.9278818, 1, 1, 1, 1, 1,
-0.1077724, -0.5225768, -3.028106, 1, 1, 1, 1, 1,
-0.1047226, -0.2813407, -2.867045, 1, 1, 1, 1, 1,
-0.09790029, -0.2367469, -1.538142, 1, 1, 1, 1, 1,
-0.09685028, -1.7545, -2.32537, 1, 1, 1, 1, 1,
-0.09663893, -0.981759, -3.281637, 1, 1, 1, 1, 1,
-0.09584335, 0.5868585, 0.7928141, 0, 0, 1, 1, 1,
-0.09467086, -0.4903718, -3.37814, 1, 0, 0, 1, 1,
-0.09211481, -0.148698, -0.7103739, 1, 0, 0, 1, 1,
-0.09051362, -0.542047, -2.831738, 1, 0, 0, 1, 1,
-0.08886096, -1.286357, -2.01528, 1, 0, 0, 1, 1,
-0.08767822, -1.766546, -2.70227, 1, 0, 0, 1, 1,
-0.08761104, 1.723719, 1.556517, 0, 0, 0, 1, 1,
-0.08557985, 0.171403, -0.7390401, 0, 0, 0, 1, 1,
-0.08401313, 1.671487, -1.400397, 0, 0, 0, 1, 1,
-0.07788941, 0.09260478, -2.163411, 0, 0, 0, 1, 1,
-0.07770842, 0.5270885, -1.403655, 0, 0, 0, 1, 1,
-0.07490215, -0.4912244, -1.502022, 0, 0, 0, 1, 1,
-0.07484423, -0.1285157, -0.4121535, 0, 0, 0, 1, 1,
-0.06962427, 1.317685, 1.61739, 1, 1, 1, 1, 1,
-0.0680282, -0.2039247, -4.082765, 1, 1, 1, 1, 1,
-0.06765388, -0.6052879, -3.396384, 1, 1, 1, 1, 1,
-0.06702434, -0.8862052, -2.850396, 1, 1, 1, 1, 1,
-0.06421013, -1.024169, -3.580816, 1, 1, 1, 1, 1,
-0.06162295, -0.05937274, -2.532863, 1, 1, 1, 1, 1,
-0.0600586, -0.3411068, -3.422282, 1, 1, 1, 1, 1,
-0.05952711, 0.8696668, -2.053262, 1, 1, 1, 1, 1,
-0.05436699, -0.8002204, -2.311678, 1, 1, 1, 1, 1,
-0.05280891, -0.3589832, -3.526812, 1, 1, 1, 1, 1,
-0.05278065, -1.301798, -3.195203, 1, 1, 1, 1, 1,
-0.05241779, 0.01367928, -0.9179957, 1, 1, 1, 1, 1,
-0.05119798, 0.1697682, -0.1545653, 1, 1, 1, 1, 1,
-0.05078008, 1.251057, 1.51985, 1, 1, 1, 1, 1,
-0.0493296, 0.4784304, -0.5255522, 1, 1, 1, 1, 1,
-0.04864547, -1.091453, -1.625296, 0, 0, 1, 1, 1,
-0.04800231, 0.3569188, 0.8140516, 1, 0, 0, 1, 1,
-0.04768959, -0.5329795, -2.681768, 1, 0, 0, 1, 1,
-0.04345801, 0.5665116, -1.22354, 1, 0, 0, 1, 1,
-0.04222891, 0.2819529, -1.49307, 1, 0, 0, 1, 1,
-0.03158138, -0.3289268, -2.574327, 1, 0, 0, 1, 1,
-0.02610257, 0.4127496, 0.2162126, 0, 0, 0, 1, 1,
-0.02493597, 0.1828091, -1.830241, 0, 0, 0, 1, 1,
-0.02480473, -0.06820956, -2.305447, 0, 0, 0, 1, 1,
-0.023885, 0.8242916, -0.4252202, 0, 0, 0, 1, 1,
-0.0222753, 0.06473933, -0.5952002, 0, 0, 0, 1, 1,
-0.01144888, 0.317517, -0.5036743, 0, 0, 0, 1, 1,
-0.01123572, 0.06380237, -0.9709696, 0, 0, 0, 1, 1,
-0.01089682, 0.5560886, 0.1962399, 1, 1, 1, 1, 1,
-0.007159355, -0.3879924, -3.626726, 1, 1, 1, 1, 1,
-0.003894126, -0.4752314, -2.227541, 1, 1, 1, 1, 1,
-0.00127677, 0.6752715, -0.4122577, 1, 1, 1, 1, 1,
0.0006625916, -2.208104, 0.62099, 1, 1, 1, 1, 1,
0.00180424, 0.2824927, -0.5960578, 1, 1, 1, 1, 1,
0.005883732, -0.8451215, 2.832227, 1, 1, 1, 1, 1,
0.007484154, -0.4937807, 2.51608, 1, 1, 1, 1, 1,
0.008803977, 2.220198, 1.071461, 1, 1, 1, 1, 1,
0.008910926, -0.1794336, 2.228137, 1, 1, 1, 1, 1,
0.009513806, -0.3619885, 3.209999, 1, 1, 1, 1, 1,
0.01949527, -0.1257822, 2.471412, 1, 1, 1, 1, 1,
0.0202099, -1.400185, 3.000061, 1, 1, 1, 1, 1,
0.02179312, -1.239379, 2.618016, 1, 1, 1, 1, 1,
0.02666872, -0.5219683, 4.165926, 1, 1, 1, 1, 1,
0.03115502, -0.4226189, 3.880522, 0, 0, 1, 1, 1,
0.03189356, -1.580553, 3.187248, 1, 0, 0, 1, 1,
0.03368293, 0.02094337, 1.434934, 1, 0, 0, 1, 1,
0.03381566, 0.2630721, 1.956349, 1, 0, 0, 1, 1,
0.03526695, 0.2942519, 0.2522615, 1, 0, 0, 1, 1,
0.04042733, 0.3874293, 0.6334742, 1, 0, 0, 1, 1,
0.04170254, -0.2479559, 4.122029, 0, 0, 0, 1, 1,
0.04379397, -0.8370515, 3.592496, 0, 0, 0, 1, 1,
0.04679438, 0.1375027, 0.922342, 0, 0, 0, 1, 1,
0.04687342, 0.5899636, -0.4045688, 0, 0, 0, 1, 1,
0.04698385, -1.051529, 4.009184, 0, 0, 0, 1, 1,
0.05274326, -0.4635551, 3.333022, 0, 0, 0, 1, 1,
0.05362835, -1.171729, 2.784032, 0, 0, 0, 1, 1,
0.05618237, 0.2618244, -1.149406, 1, 1, 1, 1, 1,
0.0610531, -0.2629066, 1.703644, 1, 1, 1, 1, 1,
0.06471241, -0.3088022, 3.526892, 1, 1, 1, 1, 1,
0.06744666, -1.243059, 2.234804, 1, 1, 1, 1, 1,
0.06871814, 1.008284, -2.285021, 1, 1, 1, 1, 1,
0.07043443, -1.823269, 3.026648, 1, 1, 1, 1, 1,
0.07655908, -2.263081, 4.009807, 1, 1, 1, 1, 1,
0.07817187, 0.1795865, 0.4555949, 1, 1, 1, 1, 1,
0.07997344, 0.4239775, 1.360141, 1, 1, 1, 1, 1,
0.0836473, -1.083468, 3.267515, 1, 1, 1, 1, 1,
0.08390939, -0.1308932, 4.850382, 1, 1, 1, 1, 1,
0.08455466, 0.9073772, 1.177612, 1, 1, 1, 1, 1,
0.08492685, 1.243579, -0.3964991, 1, 1, 1, 1, 1,
0.08504884, -1.510879, 5.097596, 1, 1, 1, 1, 1,
0.08539715, 0.8648815, -0.2395405, 1, 1, 1, 1, 1,
0.09536764, -1.493132, 1.978565, 0, 0, 1, 1, 1,
0.101629, -1.485384, 3.373276, 1, 0, 0, 1, 1,
0.1090821, 0.5223269, -0.205987, 1, 0, 0, 1, 1,
0.1101691, 0.1187639, 1.579688, 1, 0, 0, 1, 1,
0.1122344, -0.5179446, 2.276167, 1, 0, 0, 1, 1,
0.1231732, 0.1683189, 0.4966182, 1, 0, 0, 1, 1,
0.1238689, -0.9312847, 1.963288, 0, 0, 0, 1, 1,
0.1246189, -1.364281, 3.024979, 0, 0, 0, 1, 1,
0.1278072, -1.743405, 3.232078, 0, 0, 0, 1, 1,
0.1349337, -0.9565133, 2.538083, 0, 0, 0, 1, 1,
0.1354867, -0.9221927, 1.909473, 0, 0, 0, 1, 1,
0.1364244, -0.9831332, 3.392517, 0, 0, 0, 1, 1,
0.136891, 0.96556, -0.1102356, 0, 0, 0, 1, 1,
0.1395116, 0.892651, 0.7903991, 1, 1, 1, 1, 1,
0.1439575, -0.07348249, 1.469998, 1, 1, 1, 1, 1,
0.1442927, -0.5446596, 1.89349, 1, 1, 1, 1, 1,
0.1485459, 0.1102744, 1.991761, 1, 1, 1, 1, 1,
0.1499447, -0.9700987, 2.37971, 1, 1, 1, 1, 1,
0.1553039, -1.443789, 2.884363, 1, 1, 1, 1, 1,
0.1560112, -0.4827507, 3.388129, 1, 1, 1, 1, 1,
0.1562794, 0.5187467, -0.119279, 1, 1, 1, 1, 1,
0.1572581, 1.969216, 1.505765, 1, 1, 1, 1, 1,
0.1626468, -0.6283166, 1.571434, 1, 1, 1, 1, 1,
0.1628568, -0.04076297, 2.220091, 1, 1, 1, 1, 1,
0.1631374, -0.3884503, 1.651335, 1, 1, 1, 1, 1,
0.1699513, 0.7520308, -0.5050284, 1, 1, 1, 1, 1,
0.1712399, 0.0361487, 0.716594, 1, 1, 1, 1, 1,
0.1726641, 0.4826034, 0.8579974, 1, 1, 1, 1, 1,
0.1743988, 0.7155434, 0.3227627, 0, 0, 1, 1, 1,
0.175224, -0.5052139, 3.704255, 1, 0, 0, 1, 1,
0.1757262, -0.7545069, 3.657415, 1, 0, 0, 1, 1,
0.1790186, -1.822779, 3.684799, 1, 0, 0, 1, 1,
0.1799001, -1.518339, 4.756087, 1, 0, 0, 1, 1,
0.1814218, -3.510032, 3.681241, 1, 0, 0, 1, 1,
0.1868453, -1.368342, 2.261336, 0, 0, 0, 1, 1,
0.1910765, -0.8434886, 2.133558, 0, 0, 0, 1, 1,
0.19423, 0.9170898, 0.5975295, 0, 0, 0, 1, 1,
0.1966476, 1.828951, -0.3189873, 0, 0, 0, 1, 1,
0.1986764, -0.2007255, 3.74266, 0, 0, 0, 1, 1,
0.1996045, 0.6053852, 1.453189, 0, 0, 0, 1, 1,
0.2011956, -1.583706, 3.732852, 0, 0, 0, 1, 1,
0.2058167, -1.299167, 2.374777, 1, 1, 1, 1, 1,
0.2073241, -1.788253, 2.658571, 1, 1, 1, 1, 1,
0.2105304, -0.5579631, 4.402216, 1, 1, 1, 1, 1,
0.2125828, 0.4308391, 0.1169155, 1, 1, 1, 1, 1,
0.2171763, 1.037238, -0.7043652, 1, 1, 1, 1, 1,
0.2175293, -0.04314719, 1.394437, 1, 1, 1, 1, 1,
0.2181861, 0.007296897, 0.6617593, 1, 1, 1, 1, 1,
0.2208423, -0.5204152, 4.048139, 1, 1, 1, 1, 1,
0.227125, -0.01796943, 2.275991, 1, 1, 1, 1, 1,
0.228012, 0.2654861, 1.423616, 1, 1, 1, 1, 1,
0.2280653, -0.2390012, 3.417499, 1, 1, 1, 1, 1,
0.229688, -0.07493778, 3.416315, 1, 1, 1, 1, 1,
0.2307807, -0.4232828, 2.636807, 1, 1, 1, 1, 1,
0.2314866, 0.239702, 2.133917, 1, 1, 1, 1, 1,
0.2331537, -0.9164754, 3.309269, 1, 1, 1, 1, 1,
0.233505, -0.820399, 4.251146, 0, 0, 1, 1, 1,
0.235942, 0.08968408, 0.6609917, 1, 0, 0, 1, 1,
0.2398893, 1.03067, 0.7671749, 1, 0, 0, 1, 1,
0.2401667, -0.2643016, 2.891825, 1, 0, 0, 1, 1,
0.2406659, 0.4365537, -0.08768757, 1, 0, 0, 1, 1,
0.2449227, -0.1595901, 2.342144, 1, 0, 0, 1, 1,
0.2482632, 0.8869152, -0.2537975, 0, 0, 0, 1, 1,
0.2510108, 0.4207264, -0.736196, 0, 0, 0, 1, 1,
0.2550338, 1.153641, 0.4051083, 0, 0, 0, 1, 1,
0.2642968, 1.586361, -1.194701, 0, 0, 0, 1, 1,
0.2651095, -1.318501, 2.376018, 0, 0, 0, 1, 1,
0.2678935, 0.2284095, 1.367034, 0, 0, 0, 1, 1,
0.2701235, -0.02113293, 2.583368, 0, 0, 0, 1, 1,
0.274609, 0.1628681, 1.108121, 1, 1, 1, 1, 1,
0.2773555, -0.2235409, 0.0844111, 1, 1, 1, 1, 1,
0.2801351, 1.002858, -0.4124145, 1, 1, 1, 1, 1,
0.284611, 0.7213705, 1.183342, 1, 1, 1, 1, 1,
0.2857013, -0.9253042, 3.221394, 1, 1, 1, 1, 1,
0.2858669, -1.50639, 3.456528, 1, 1, 1, 1, 1,
0.2893276, 1.637522, 0.01268297, 1, 1, 1, 1, 1,
0.301167, 1.078598, 1.46355, 1, 1, 1, 1, 1,
0.3014205, 0.6599948, -0.6742642, 1, 1, 1, 1, 1,
0.3028363, -1.301142, 3.884414, 1, 1, 1, 1, 1,
0.3044962, 0.2508873, 1.577166, 1, 1, 1, 1, 1,
0.3098761, 0.637911, 0.1771013, 1, 1, 1, 1, 1,
0.3103374, 0.539097, -0.7441866, 1, 1, 1, 1, 1,
0.3194467, 0.7346973, 1.395171, 1, 1, 1, 1, 1,
0.3209294, -2.200297, 2.516535, 1, 1, 1, 1, 1,
0.3245055, 0.815196, 0.637318, 0, 0, 1, 1, 1,
0.325394, 1.08196, -1.182144, 1, 0, 0, 1, 1,
0.3265631, -0.06367322, 1.2965, 1, 0, 0, 1, 1,
0.3266625, -0.3204055, 1.991906, 1, 0, 0, 1, 1,
0.3321823, 0.5038257, -0.4407027, 1, 0, 0, 1, 1,
0.3322312, -0.4487091, 1.992948, 1, 0, 0, 1, 1,
0.3367518, -1.740675, 4.512883, 0, 0, 0, 1, 1,
0.3372164, 0.2021932, 2.078959, 0, 0, 0, 1, 1,
0.3380299, 2.429551, -0.1319473, 0, 0, 0, 1, 1,
0.3456715, -0.3055362, 3.891212, 0, 0, 0, 1, 1,
0.3479448, -0.8385448, 2.062569, 0, 0, 0, 1, 1,
0.3498282, 1.675787, 0.03277206, 0, 0, 0, 1, 1,
0.3503126, -0.8595724, 2.719831, 0, 0, 0, 1, 1,
0.3519545, 0.2420274, 2.199617, 1, 1, 1, 1, 1,
0.3545145, 0.220993, 1.337213, 1, 1, 1, 1, 1,
0.3611132, -0.2359819, 1.376023, 1, 1, 1, 1, 1,
0.3652724, -1.23856, 3.259175, 1, 1, 1, 1, 1,
0.3674799, 0.3609327, 1.020596, 1, 1, 1, 1, 1,
0.3688653, 0.4368984, -0.008501276, 1, 1, 1, 1, 1,
0.3689008, 0.4271889, 2.242514, 1, 1, 1, 1, 1,
0.3693516, 0.1206482, 1.555251, 1, 1, 1, 1, 1,
0.36962, 0.8820822, -0.4483065, 1, 1, 1, 1, 1,
0.3744437, -0.4058892, 4.218977, 1, 1, 1, 1, 1,
0.3769414, 0.3855065, 2.628438, 1, 1, 1, 1, 1,
0.3790486, -1.56175, 4.19747, 1, 1, 1, 1, 1,
0.3855384, -0.3287448, 4.295413, 1, 1, 1, 1, 1,
0.3856602, 0.0945248, 1.602958, 1, 1, 1, 1, 1,
0.3931404, 0.6279017, -0.9153689, 1, 1, 1, 1, 1,
0.3953231, 0.2335864, 0.7391435, 0, 0, 1, 1, 1,
0.3971948, 1.453941, 0.8935559, 1, 0, 0, 1, 1,
0.4013564, 0.6678861, -0.6651552, 1, 0, 0, 1, 1,
0.4097495, -1.205669, 2.945191, 1, 0, 0, 1, 1,
0.4127085, -0.04398388, 1.927568, 1, 0, 0, 1, 1,
0.4128908, -0.5378279, 2.152539, 1, 0, 0, 1, 1,
0.4152649, 1.705322, 0.2771325, 0, 0, 0, 1, 1,
0.4162859, 1.185473, -0.6340705, 0, 0, 0, 1, 1,
0.4219399, -0.5404108, 3.336344, 0, 0, 0, 1, 1,
0.4223219, 0.3526018, 1.53732, 0, 0, 0, 1, 1,
0.4224108, -1.64647, 2.484958, 0, 0, 0, 1, 1,
0.423998, 1.610945, 0.7988107, 0, 0, 0, 1, 1,
0.4248563, -0.4765612, 1.261332, 0, 0, 0, 1, 1,
0.4276671, -0.02650598, 0.1929393, 1, 1, 1, 1, 1,
0.4286898, 0.7118903, -0.2501409, 1, 1, 1, 1, 1,
0.4309318, 0.3124011, 1.631436, 1, 1, 1, 1, 1,
0.4313629, 2.348418, 0.7565997, 1, 1, 1, 1, 1,
0.4346918, 0.1697459, 0.7749318, 1, 1, 1, 1, 1,
0.445855, 1.799782, -0.8085364, 1, 1, 1, 1, 1,
0.4459403, 0.7555457, -0.6630445, 1, 1, 1, 1, 1,
0.4521109, -1.269831, 1.173512, 1, 1, 1, 1, 1,
0.4553625, -0.05854674, 2.506543, 1, 1, 1, 1, 1,
0.4560007, -1.664218, 1.411489, 1, 1, 1, 1, 1,
0.4561079, 1.007764, 1.010387, 1, 1, 1, 1, 1,
0.4579777, -0.3405105, 3.396515, 1, 1, 1, 1, 1,
0.4584357, -0.78102, 3.09716, 1, 1, 1, 1, 1,
0.4585506, -0.2956803, 2.369919, 1, 1, 1, 1, 1,
0.4598339, -0.7409706, 2.083638, 1, 1, 1, 1, 1,
0.4612783, -0.5580854, 2.275394, 0, 0, 1, 1, 1,
0.4637287, 0.4655029, -0.001621229, 1, 0, 0, 1, 1,
0.4638321, -0.2177311, 0.2534374, 1, 0, 0, 1, 1,
0.464101, -1.036801, 3.346532, 1, 0, 0, 1, 1,
0.4683996, -0.5782577, 2.291685, 1, 0, 0, 1, 1,
0.4803586, 1.141354, 1.78171, 1, 0, 0, 1, 1,
0.4890406, -1.203673, 3.552411, 0, 0, 0, 1, 1,
0.4891028, -4.130707, 3.429566, 0, 0, 0, 1, 1,
0.4983121, -0.1690997, 2.091756, 0, 0, 0, 1, 1,
0.5005209, 0.2520035, 1.309517, 0, 0, 0, 1, 1,
0.5012118, 0.3953709, -0.05581704, 0, 0, 0, 1, 1,
0.5039788, 0.5240072, 0.5006624, 0, 0, 0, 1, 1,
0.5068922, 0.1290403, 1.872383, 0, 0, 0, 1, 1,
0.5088691, 0.02402391, 1.235693, 1, 1, 1, 1, 1,
0.5108798, -0.8734919, 2.850014, 1, 1, 1, 1, 1,
0.5141335, -0.259592, 2.262368, 1, 1, 1, 1, 1,
0.5160728, -0.4307145, 5.050509, 1, 1, 1, 1, 1,
0.516135, -0.1444673, 2.135312, 1, 1, 1, 1, 1,
0.5176256, 0.3303386, 1.111548, 1, 1, 1, 1, 1,
0.5217118, 0.2687702, 3.608222, 1, 1, 1, 1, 1,
0.5225809, -2.082572, 3.17402, 1, 1, 1, 1, 1,
0.522998, -0.2260294, 3.047225, 1, 1, 1, 1, 1,
0.5235194, -1.378117, 3.239121, 1, 1, 1, 1, 1,
0.5295814, 0.103452, 1.738431, 1, 1, 1, 1, 1,
0.5300531, 1.057713, 1.521713, 1, 1, 1, 1, 1,
0.5352312, 0.9343292, 0.4886971, 1, 1, 1, 1, 1,
0.5376546, 0.1193506, 2.47177, 1, 1, 1, 1, 1,
0.5396299, -0.793458, 6.062346, 1, 1, 1, 1, 1,
0.5448931, 0.448099, 1.000596, 0, 0, 1, 1, 1,
0.5463958, -0.1941748, 2.219351, 1, 0, 0, 1, 1,
0.5490924, -0.839325, 2.060738, 1, 0, 0, 1, 1,
0.5532591, 1.962132, -1.350219, 1, 0, 0, 1, 1,
0.5548716, -0.5372155, 2.480649, 1, 0, 0, 1, 1,
0.5657354, 2.00404, -0.4041546, 1, 0, 0, 1, 1,
0.56583, 0.3291183, 1.505686, 0, 0, 0, 1, 1,
0.5699196, -0.9172028, 2.093582, 0, 0, 0, 1, 1,
0.5725634, 1.114537, 2.050189, 0, 0, 0, 1, 1,
0.5791465, 0.5531418, 2.276061, 0, 0, 0, 1, 1,
0.5792084, -0.4219605, 1.424376, 0, 0, 0, 1, 1,
0.5827971, 0.6266473, 0.734461, 0, 0, 0, 1, 1,
0.5833435, -0.7352859, 3.051885, 0, 0, 0, 1, 1,
0.5878868, -0.4697308, 2.882681, 1, 1, 1, 1, 1,
0.5885652, 0.9533451, 0.3990352, 1, 1, 1, 1, 1,
0.5917136, -0.969623, 3.164994, 1, 1, 1, 1, 1,
0.593402, 0.5430338, -0.3471299, 1, 1, 1, 1, 1,
0.5942858, 0.7064842, 1.012893, 1, 1, 1, 1, 1,
0.5977823, -1.553022, 1.587581, 1, 1, 1, 1, 1,
0.6041055, -1.975425, 3.040682, 1, 1, 1, 1, 1,
0.6049182, 0.7517436, 0.4120424, 1, 1, 1, 1, 1,
0.6060755, 0.9697178, 0.546162, 1, 1, 1, 1, 1,
0.6075808, 1.071873, -0.2941587, 1, 1, 1, 1, 1,
0.6100264, 0.1246992, 0.2292674, 1, 1, 1, 1, 1,
0.6108959, -1.150745, 3.0728, 1, 1, 1, 1, 1,
0.6134251, 0.9926831, 0.3234746, 1, 1, 1, 1, 1,
0.6162818, 1.615327, -0.9446766, 1, 1, 1, 1, 1,
0.618439, 0.05442578, -0.4219403, 1, 1, 1, 1, 1,
0.6192349, 1.16013, -0.6420765, 0, 0, 1, 1, 1,
0.6222429, 1.056121, 0.7709696, 1, 0, 0, 1, 1,
0.6269399, 0.1461774, 0.4447962, 1, 0, 0, 1, 1,
0.6290302, 0.3050803, 0.8464822, 1, 0, 0, 1, 1,
0.6375319, -0.0008974809, 0.0709288, 1, 0, 0, 1, 1,
0.6379609, 0.3556292, 2.772259, 1, 0, 0, 1, 1,
0.6383636, -0.3929678, 3.390793, 0, 0, 0, 1, 1,
0.6411975, 0.5972504, -1.533148, 0, 0, 0, 1, 1,
0.6420248, 1.73536, 1.635192, 0, 0, 0, 1, 1,
0.6431181, 1.030341, -0.2245557, 0, 0, 0, 1, 1,
0.6443341, 0.06349093, 2.215153, 0, 0, 0, 1, 1,
0.6451499, 2.272949, 0.1323357, 0, 0, 0, 1, 1,
0.6467769, -0.7225548, 1.902151, 0, 0, 0, 1, 1,
0.6512836, -0.3934228, 1.515526, 1, 1, 1, 1, 1,
0.6578192, -1.127087, 3.612327, 1, 1, 1, 1, 1,
0.6640474, 1.21288, 1.7353, 1, 1, 1, 1, 1,
0.667738, 1.291204, 1.809805, 1, 1, 1, 1, 1,
0.6707756, -1.273868, 2.39365, 1, 1, 1, 1, 1,
0.6719118, 1.874339, 0.362406, 1, 1, 1, 1, 1,
0.6755986, -0.151218, 2.191682, 1, 1, 1, 1, 1,
0.6828784, 1.734085, 0.3117593, 1, 1, 1, 1, 1,
0.6832105, 0.4765413, 1.144958, 1, 1, 1, 1, 1,
0.6837384, 0.7914861, 1.126172, 1, 1, 1, 1, 1,
0.6842659, -0.9259385, 3.37498, 1, 1, 1, 1, 1,
0.6859415, -0.7648126, 2.976487, 1, 1, 1, 1, 1,
0.697682, -0.07791464, 2.930047, 1, 1, 1, 1, 1,
0.7011852, 1.101734, 2.467614, 1, 1, 1, 1, 1,
0.7032226, 0.09472851, 2.836771, 1, 1, 1, 1, 1,
0.7116519, 1.961319, -0.9639611, 0, 0, 1, 1, 1,
0.7196857, 0.2723128, 1.613947, 1, 0, 0, 1, 1,
0.7198016, 0.03699189, 0.05264729, 1, 0, 0, 1, 1,
0.7199516, -2.228694, 3.593379, 1, 0, 0, 1, 1,
0.7228292, 0.9208853, -0.5609313, 1, 0, 0, 1, 1,
0.7236435, 0.463244, -0.2582639, 1, 0, 0, 1, 1,
0.7245699, 1.955814, 0.1256664, 0, 0, 0, 1, 1,
0.7317365, -0.3920372, 2.247594, 0, 0, 0, 1, 1,
0.7337857, -0.06479175, 1.404191, 0, 0, 0, 1, 1,
0.7371029, 0.1581281, -0.3316601, 0, 0, 0, 1, 1,
0.7401518, -0.574164, 1.759855, 0, 0, 0, 1, 1,
0.7470895, -0.4611248, 2.665952, 0, 0, 0, 1, 1,
0.7471517, 1.007651, -1.079347, 0, 0, 0, 1, 1,
0.7477696, 1.401312, 2.112236, 1, 1, 1, 1, 1,
0.7492113, 0.9616431, -0.3225552, 1, 1, 1, 1, 1,
0.7498751, 1.231082, -0.3333705, 1, 1, 1, 1, 1,
0.7580175, -0.8089119, 2.305141, 1, 1, 1, 1, 1,
0.7621136, 1.746379, 2.910632, 1, 1, 1, 1, 1,
0.7680479, 0.6280069, 0.2647122, 1, 1, 1, 1, 1,
0.7743921, -0.2622921, 1.307082, 1, 1, 1, 1, 1,
0.7750118, 1.178925, 0.4475314, 1, 1, 1, 1, 1,
0.7789217, 0.7360632, 1.285849, 1, 1, 1, 1, 1,
0.7844567, -1.024967, 1.318112, 1, 1, 1, 1, 1,
0.7875075, -0.7134067, 4.400951, 1, 1, 1, 1, 1,
0.7966715, 0.8678542, 1.083684, 1, 1, 1, 1, 1,
0.806286, 0.5531493, 0.8751848, 1, 1, 1, 1, 1,
0.810984, 1.507777, 0.2064566, 1, 1, 1, 1, 1,
0.8120576, 0.5068259, 2.005849, 1, 1, 1, 1, 1,
0.8201883, 0.8724129, 0.2571062, 0, 0, 1, 1, 1,
0.8205901, -0.6195418, 2.479817, 1, 0, 0, 1, 1,
0.821479, -0.0531114, 0.9740862, 1, 0, 0, 1, 1,
0.8216941, -0.08909395, 2.422752, 1, 0, 0, 1, 1,
0.8220494, 1.455704, -0.06399693, 1, 0, 0, 1, 1,
0.8223099, -0.1012412, 1.84008, 1, 0, 0, 1, 1,
0.8247399, -0.6355779, 1.964253, 0, 0, 0, 1, 1,
0.8252708, 0.8335324, 2.487998, 0, 0, 0, 1, 1,
0.8290737, -2.292599, 3.328206, 0, 0, 0, 1, 1,
0.8334761, -0.4882094, 3.507814, 0, 0, 0, 1, 1,
0.8363823, -0.983658, 3.741153, 0, 0, 0, 1, 1,
0.837441, 0.2175357, 3.007451, 0, 0, 0, 1, 1,
0.8385239, -1.657345, 2.206977, 0, 0, 0, 1, 1,
0.8389391, 0.04324009, 0.7343451, 1, 1, 1, 1, 1,
0.8392788, -0.6947443, 2.719719, 1, 1, 1, 1, 1,
0.8470663, -1.127347, 3.88209, 1, 1, 1, 1, 1,
0.8486386, 0.9790559, -1.104593, 1, 1, 1, 1, 1,
0.850578, -0.06686704, 1.519513, 1, 1, 1, 1, 1,
0.8506568, 2.320053, 0.8673238, 1, 1, 1, 1, 1,
0.8548607, -0.9389226, 2.270181, 1, 1, 1, 1, 1,
0.8561991, -1.054113, 1.948274, 1, 1, 1, 1, 1,
0.8568884, 0.7217245, 1.21388, 1, 1, 1, 1, 1,
0.8629525, 0.4503666, 0.7913143, 1, 1, 1, 1, 1,
0.8652025, -1.619861, 2.281739, 1, 1, 1, 1, 1,
0.8653999, 0.392936, 0.8087646, 1, 1, 1, 1, 1,
0.8705385, -0.9120759, 3.320419, 1, 1, 1, 1, 1,
0.8764957, -0.7301849, 3.416119, 1, 1, 1, 1, 1,
0.8780383, 2.215036, -0.4185688, 1, 1, 1, 1, 1,
0.8781487, -0.3618656, 1.390407, 0, 0, 1, 1, 1,
0.8785011, 0.8977349, 0.6509139, 1, 0, 0, 1, 1,
0.8794498, -2.287648, 3.022291, 1, 0, 0, 1, 1,
0.8927977, -0.3399038, 2.219075, 1, 0, 0, 1, 1,
0.89658, 2.124266, 0.2913475, 1, 0, 0, 1, 1,
0.8971989, 0.397405, 1.557494, 1, 0, 0, 1, 1,
0.9067927, -0.08944198, 3.341878, 0, 0, 0, 1, 1,
0.9071735, -0.1004499, 2.261411, 0, 0, 0, 1, 1,
0.9178902, 1.670632, -0.1968061, 0, 0, 0, 1, 1,
0.9186918, -0.1536266, 0.07204782, 0, 0, 0, 1, 1,
0.9211434, -0.3739019, 0.6454725, 0, 0, 0, 1, 1,
0.9237592, -0.05329122, 0.9666039, 0, 0, 0, 1, 1,
0.923963, -1.102584, 2.391362, 0, 0, 0, 1, 1,
0.9275511, 1.259935, 0.3737654, 1, 1, 1, 1, 1,
0.9339541, -0.5409782, 1.05514, 1, 1, 1, 1, 1,
0.9353656, -0.2233835, 5.241945, 1, 1, 1, 1, 1,
0.9376072, 0.4138764, 0.46567, 1, 1, 1, 1, 1,
0.9391148, 0.5917211, -0.3789395, 1, 1, 1, 1, 1,
0.9395718, -1.148058, 1.432059, 1, 1, 1, 1, 1,
0.9396711, 0.5270716, 0.6221033, 1, 1, 1, 1, 1,
0.945371, -1.090317, 2.211816, 1, 1, 1, 1, 1,
0.9456615, 0.2099506, 0.5673795, 1, 1, 1, 1, 1,
0.9472952, 0.1633352, 0.2576506, 1, 1, 1, 1, 1,
0.953698, 0.4844858, 0.08646335, 1, 1, 1, 1, 1,
0.9657458, 0.6981468, -0.1763829, 1, 1, 1, 1, 1,
0.9662382, -1.738422, 2.607432, 1, 1, 1, 1, 1,
0.9700757, 0.1854033, 2.016231, 1, 1, 1, 1, 1,
0.9806057, -2.171974, 2.270957, 1, 1, 1, 1, 1,
0.9861081, -0.2123074, 0.5511996, 0, 0, 1, 1, 1,
1.002902, 0.4628919, 1.031428, 1, 0, 0, 1, 1,
1.008151, -0.5548226, 3.459526, 1, 0, 0, 1, 1,
1.008671, -1.253848, 3.161279, 1, 0, 0, 1, 1,
1.011396, -0.365076, 2.329017, 1, 0, 0, 1, 1,
1.014025, 0.5389153, 1.311752, 1, 0, 0, 1, 1,
1.014991, 0.640247, -0.05582715, 0, 0, 0, 1, 1,
1.017388, 0.9050375, -1.767278, 0, 0, 0, 1, 1,
1.022511, -0.481738, 4.069476, 0, 0, 0, 1, 1,
1.023252, 1.237938, 1.171969, 0, 0, 0, 1, 1,
1.023885, -0.9800693, 1.419555, 0, 0, 0, 1, 1,
1.024876, 0.4105582, -0.3015859, 0, 0, 0, 1, 1,
1.028472, 1.102094, 1.374296, 0, 0, 0, 1, 1,
1.033853, -0.1937744, 2.960462, 1, 1, 1, 1, 1,
1.035347, 0.5700223, 0.9428557, 1, 1, 1, 1, 1,
1.039945, -0.5201829, 3.399503, 1, 1, 1, 1, 1,
1.042432, 1.984598, 0.9767539, 1, 1, 1, 1, 1,
1.04366, 0.305138, 0.2743479, 1, 1, 1, 1, 1,
1.046062, 0.1410757, 3.122322, 1, 1, 1, 1, 1,
1.053217, 0.3921888, 0.6992983, 1, 1, 1, 1, 1,
1.056769, 2.472106, 0.4657786, 1, 1, 1, 1, 1,
1.057617, -1.230218, 4.633822, 1, 1, 1, 1, 1,
1.063542, -0.4038767, 1.590409, 1, 1, 1, 1, 1,
1.067287, -1.014714, 1.589937, 1, 1, 1, 1, 1,
1.074341, 0.8927992, 0.7439967, 1, 1, 1, 1, 1,
1.074748, -1.077525, 2.389494, 1, 1, 1, 1, 1,
1.075299, 0.3405513, -0.4995986, 1, 1, 1, 1, 1,
1.080738, 0.5526363, 1.440851, 1, 1, 1, 1, 1,
1.086975, -1.149592, 2.157429, 0, 0, 1, 1, 1,
1.089256, 0.157431, 2.730834, 1, 0, 0, 1, 1,
1.092227, -0.2188551, 2.761966, 1, 0, 0, 1, 1,
1.092584, 2.565014, -2.203107, 1, 0, 0, 1, 1,
1.099005, 0.5048028, 0.8844653, 1, 0, 0, 1, 1,
1.104059, 0.1661398, 4.168806, 1, 0, 0, 1, 1,
1.10447, 0.9958114, -0.195866, 0, 0, 0, 1, 1,
1.104657, -3.16035, 3.387723, 0, 0, 0, 1, 1,
1.104894, 0.754446, 1.701845, 0, 0, 0, 1, 1,
1.110798, 0.8620574, -0.2359106, 0, 0, 0, 1, 1,
1.122304, 0.4986464, 3.408607, 0, 0, 0, 1, 1,
1.122343, -1.025762, 2.407568, 0, 0, 0, 1, 1,
1.126897, -1.911685, 3.049065, 0, 0, 0, 1, 1,
1.127674, -1.296128, 1.366958, 1, 1, 1, 1, 1,
1.137127, 0.1987705, 3.232076, 1, 1, 1, 1, 1,
1.140819, 0.4105097, 1.06231, 1, 1, 1, 1, 1,
1.141871, 0.8376522, -1.376749, 1, 1, 1, 1, 1,
1.142298, 3.001285, 1.530712, 1, 1, 1, 1, 1,
1.143409, 0.7834556, -0.002180244, 1, 1, 1, 1, 1,
1.157199, -0.9821288, 2.265818, 1, 1, 1, 1, 1,
1.158832, -0.943463, 3.198724, 1, 1, 1, 1, 1,
1.161057, -2.053358, 2.761562, 1, 1, 1, 1, 1,
1.162764, 0.5958993, 1.625031, 1, 1, 1, 1, 1,
1.171949, -0.5848814, 0.3502352, 1, 1, 1, 1, 1,
1.182017, 1.59604, -0.3645946, 1, 1, 1, 1, 1,
1.191439, -0.0890841, 2.671613, 1, 1, 1, 1, 1,
1.195469, 2.055081, -0.3602809, 1, 1, 1, 1, 1,
1.221438, -0.3129887, 3.364691, 1, 1, 1, 1, 1,
1.230455, -0.9965969, 1.349816, 0, 0, 1, 1, 1,
1.231913, -1.831676, 2.781518, 1, 0, 0, 1, 1,
1.233616, -0.4621304, 1.674904, 1, 0, 0, 1, 1,
1.23697, -1.229747, 2.326085, 1, 0, 0, 1, 1,
1.250542, 1.356573, 0.6152756, 1, 0, 0, 1, 1,
1.264283, 1.194878, 1.030447, 1, 0, 0, 1, 1,
1.268319, -0.6339442, 2.014756, 0, 0, 0, 1, 1,
1.272872, 0.08948562, 1.06071, 0, 0, 0, 1, 1,
1.27775, 0.1866535, 2.317606, 0, 0, 0, 1, 1,
1.284771, -2.459736, 2.194583, 0, 0, 0, 1, 1,
1.30193, -0.1736811, 2.686331, 0, 0, 0, 1, 1,
1.315664, -0.7037202, 1.393142, 0, 0, 0, 1, 1,
1.320193, -0.6717051, 2.522073, 0, 0, 0, 1, 1,
1.322937, 0.8613403, 0.2113007, 1, 1, 1, 1, 1,
1.323045, 0.2415385, 1.088709, 1, 1, 1, 1, 1,
1.325293, 1.314532, 0.634358, 1, 1, 1, 1, 1,
1.326923, 0.208264, 1.214931, 1, 1, 1, 1, 1,
1.33296, -0.972076, 1.757772, 1, 1, 1, 1, 1,
1.360541, 1.206052, 2.246025, 1, 1, 1, 1, 1,
1.363787, -0.9236016, 1.860126, 1, 1, 1, 1, 1,
1.367905, -0.09377467, 2.847862, 1, 1, 1, 1, 1,
1.373862, -0.8720904, 1.506072, 1, 1, 1, 1, 1,
1.375213, -0.6907319, 2.513762, 1, 1, 1, 1, 1,
1.390267, 1.676653, 1.410112, 1, 1, 1, 1, 1,
1.391436, 1.102746, 0.510619, 1, 1, 1, 1, 1,
1.391483, 0.6376356, 2.155284, 1, 1, 1, 1, 1,
1.404267, -0.73634, 1.505902, 1, 1, 1, 1, 1,
1.411013, 0.6262138, 0.6510881, 1, 1, 1, 1, 1,
1.416151, -0.654621, 1.389044, 0, 0, 1, 1, 1,
1.424833, 0.5237839, 2.166902, 1, 0, 0, 1, 1,
1.431832, 0.0106052, 3.044476, 1, 0, 0, 1, 1,
1.439049, -1.798918, 4.152583, 1, 0, 0, 1, 1,
1.446823, -0.6041282, 3.657584, 1, 0, 0, 1, 1,
1.450783, 0.2945343, 1.024408, 1, 0, 0, 1, 1,
1.462785, -0.4838558, 1.542502, 0, 0, 0, 1, 1,
1.472568, -0.4734115, 2.442826, 0, 0, 0, 1, 1,
1.473858, -0.8517764, -0.1493423, 0, 0, 0, 1, 1,
1.490301, -0.1860083, 1.65662, 0, 0, 0, 1, 1,
1.492232, -1.021246, 2.209001, 0, 0, 0, 1, 1,
1.494551, -1.187922, 0.3909386, 0, 0, 0, 1, 1,
1.514704, -1.695925, 2.223641, 0, 0, 0, 1, 1,
1.544559, -0.7759259, 1.303402, 1, 1, 1, 1, 1,
1.546215, -0.5621876, 2.437958, 1, 1, 1, 1, 1,
1.548184, -0.4750147, 0.1533398, 1, 1, 1, 1, 1,
1.549245, -0.8972186, 2.058936, 1, 1, 1, 1, 1,
1.555321, 0.9408299, 1.102717, 1, 1, 1, 1, 1,
1.561845, 0.3223852, 1.325642, 1, 1, 1, 1, 1,
1.561855, -0.04455353, 1.774133, 1, 1, 1, 1, 1,
1.564658, 0.7360314, 2.210711, 1, 1, 1, 1, 1,
1.58176, -0.2914479, 2.406799, 1, 1, 1, 1, 1,
1.588858, 1.031306, 0.9695532, 1, 1, 1, 1, 1,
1.588987, 0.398122, 2.208229, 1, 1, 1, 1, 1,
1.591351, -0.8051133, 0.876844, 1, 1, 1, 1, 1,
1.594078, -1.397319, 1.615481, 1, 1, 1, 1, 1,
1.594124, -0.9165936, 2.078613, 1, 1, 1, 1, 1,
1.613621, -2.222931, 2.450577, 1, 1, 1, 1, 1,
1.619082, 0.6073757, 0.8109375, 0, 0, 1, 1, 1,
1.621394, -1.573242, 2.252919, 1, 0, 0, 1, 1,
1.623729, -1.400502, 1.071071, 1, 0, 0, 1, 1,
1.633879, -0.7294152, 2.6536, 1, 0, 0, 1, 1,
1.649671, -2.260607, 0.9978698, 1, 0, 0, 1, 1,
1.655127, -0.3704576, 3.957328, 1, 0, 0, 1, 1,
1.658093, 0.5849124, -0.8792771, 0, 0, 0, 1, 1,
1.690388, 0.4809055, 1.404833, 0, 0, 0, 1, 1,
1.72484, -0.1544316, 1.147465, 0, 0, 0, 1, 1,
1.745023, 0.3663741, 1.807406, 0, 0, 0, 1, 1,
1.771019, 1.207412, 0.9487918, 0, 0, 0, 1, 1,
1.775261, -0.3697276, 0.829654, 0, 0, 0, 1, 1,
1.788226, 1.229367, 1.779732, 0, 0, 0, 1, 1,
1.791986, -1.783654, 1.051633, 1, 1, 1, 1, 1,
1.797281, 0.8164424, 0.6431617, 1, 1, 1, 1, 1,
1.80287, 0.6004378, 0.9997441, 1, 1, 1, 1, 1,
1.803083, 1.572836, -0.1094537, 1, 1, 1, 1, 1,
1.825428, 0.2350496, 0.9458724, 1, 1, 1, 1, 1,
1.834754, 0.2833875, 0.8590971, 1, 1, 1, 1, 1,
1.841472, 1.222676, 1.586616, 1, 1, 1, 1, 1,
1.850386, -0.1084169, 1.615871, 1, 1, 1, 1, 1,
1.900957, -0.9159701, 1.314682, 1, 1, 1, 1, 1,
1.900966, -0.9994724, 2.103082, 1, 1, 1, 1, 1,
1.925601, 0.9317023, 2.166185, 1, 1, 1, 1, 1,
1.930191, 0.5539383, 3.14259, 1, 1, 1, 1, 1,
1.96032, -1.006165, 2.243258, 1, 1, 1, 1, 1,
1.978536, 0.8862191, 1.162009, 1, 1, 1, 1, 1,
1.982987, 0.7785226, 0.2488543, 1, 1, 1, 1, 1,
1.991706, -0.05755546, -0.2389717, 0, 0, 1, 1, 1,
1.995117, 0.8893182, 2.03681, 1, 0, 0, 1, 1,
2.017411, -0.2510028, 1.058231, 1, 0, 0, 1, 1,
2.02315, -0.9514866, 3.706509, 1, 0, 0, 1, 1,
2.035092, 0.2960549, 2.637015, 1, 0, 0, 1, 1,
2.069232, -0.1175976, 0.1640146, 1, 0, 0, 1, 1,
2.080601, -0.3761367, 1.692252, 0, 0, 0, 1, 1,
2.106278, -0.4238303, 1.619787, 0, 0, 0, 1, 1,
2.114006, 0.0972489, -0.01449786, 0, 0, 0, 1, 1,
2.117714, -0.06927964, 1.180274, 0, 0, 0, 1, 1,
2.164204, 0.2191405, 0.4322979, 0, 0, 0, 1, 1,
2.226461, 0.9998994, 1.288284, 0, 0, 0, 1, 1,
2.266144, 0.008241363, 3.169408, 0, 0, 0, 1, 1,
2.323705, 1.049389, 0.5770423, 1, 1, 1, 1, 1,
2.49207, -0.5784984, 1.429627, 1, 1, 1, 1, 1,
2.495235, 1.455458, -1.239334, 1, 1, 1, 1, 1,
2.504631, 2.052763, 1.927676, 1, 1, 1, 1, 1,
2.616131, -0.1451459, 2.352662, 1, 1, 1, 1, 1,
2.831283, -0.3617656, 2.418049, 1, 1, 1, 1, 1,
3.044569, 2.689526, 1.453016, 1, 1, 1, 1, 1
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
var radius = 9.950348;
var distance = 34.95018;
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
mvMatrix.translate( 0.247813, 0.5160172, -0.5734265 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.95018);
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
