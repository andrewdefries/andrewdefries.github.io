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
-3.016196, 0.8302398, -1.466471, 1, 0, 0, 1,
-2.857151, 0.3014415, -2.243329, 1, 0.007843138, 0, 1,
-2.796695, 0.8743864, -2.18739, 1, 0.01176471, 0, 1,
-2.675009, -0.5462991, -0.5926487, 1, 0.01960784, 0, 1,
-2.657623, -1.12181, -1.243734, 1, 0.02352941, 0, 1,
-2.636048, -0.5336372, -3.158509, 1, 0.03137255, 0, 1,
-2.606882, 0.3986679, -0.06586897, 1, 0.03529412, 0, 1,
-2.555807, 0.5612527, 0.2274435, 1, 0.04313726, 0, 1,
-2.552402, 0.4714081, -1.794791, 1, 0.04705882, 0, 1,
-2.465716, -1.219365, -1.620976, 1, 0.05490196, 0, 1,
-2.400841, 0.2605863, -3.021641, 1, 0.05882353, 0, 1,
-2.395739, 0.5454389, 0.3091699, 1, 0.06666667, 0, 1,
-2.341891, 0.2903322, -2.002383, 1, 0.07058824, 0, 1,
-2.312295, 2.185241, -0.6847275, 1, 0.07843138, 0, 1,
-2.306767, -0.6177455, -2.452609, 1, 0.08235294, 0, 1,
-2.294004, -1.030973, -1.601141, 1, 0.09019608, 0, 1,
-2.265563, -0.4338563, -2.735895, 1, 0.09411765, 0, 1,
-2.262805, 0.7810065, -1.195343, 1, 0.1019608, 0, 1,
-2.220842, 1.210828, -3.155966, 1, 0.1098039, 0, 1,
-2.169802, -0.1871701, -2.18887, 1, 0.1137255, 0, 1,
-2.119957, -0.6464254, -0.6779811, 1, 0.1215686, 0, 1,
-2.109525, 2.493966, 2.731698, 1, 0.1254902, 0, 1,
-2.068564, -0.21866, -1.659523, 1, 0.1333333, 0, 1,
-2.066998, 0.5467412, -0.5890658, 1, 0.1372549, 0, 1,
-2.055583, -0.9327327, -2.152787, 1, 0.145098, 0, 1,
-2.0484, 0.9331114, -0.6481776, 1, 0.1490196, 0, 1,
-1.996351, 0.389773, -3.554609, 1, 0.1568628, 0, 1,
-1.981889, -0.7963132, -2.111713, 1, 0.1607843, 0, 1,
-1.976148, 0.1316436, -2.784378, 1, 0.1686275, 0, 1,
-1.952885, -0.7881685, -2.869574, 1, 0.172549, 0, 1,
-1.948899, 0.07931395, -1.421133, 1, 0.1803922, 0, 1,
-1.923724, 0.01494212, -0.7608997, 1, 0.1843137, 0, 1,
-1.905216, -1.112299, -1.566512, 1, 0.1921569, 0, 1,
-1.893084, -1.488047, -4.017249, 1, 0.1960784, 0, 1,
-1.885549, 0.7674766, -1.169408, 1, 0.2039216, 0, 1,
-1.879765, 0.9312434, -1.055126, 1, 0.2117647, 0, 1,
-1.859364, 0.9014856, 0.125767, 1, 0.2156863, 0, 1,
-1.835721, -0.7558104, -0.3258013, 1, 0.2235294, 0, 1,
-1.829842, 0.1960216, -2.051202, 1, 0.227451, 0, 1,
-1.816272, 0.2144739, -2.75268, 1, 0.2352941, 0, 1,
-1.790182, -0.5582056, -1.825387, 1, 0.2392157, 0, 1,
-1.77835, -1.508858, -3.774072, 1, 0.2470588, 0, 1,
-1.772757, -0.6484427, -1.25585, 1, 0.2509804, 0, 1,
-1.759594, -0.6862042, -2.099614, 1, 0.2588235, 0, 1,
-1.745429, 0.08909217, -0.8532825, 1, 0.2627451, 0, 1,
-1.735898, -1.938732, -1.667056, 1, 0.2705882, 0, 1,
-1.729231, 0.6224697, -0.7665199, 1, 0.2745098, 0, 1,
-1.721405, -0.349622, -3.872406, 1, 0.282353, 0, 1,
-1.720747, 0.1236418, -2.215531, 1, 0.2862745, 0, 1,
-1.720461, 0.1855615, -1.373159, 1, 0.2941177, 0, 1,
-1.717133, 1.853205, -0.9782426, 1, 0.3019608, 0, 1,
-1.70709, -0.8921655, -0.4399202, 1, 0.3058824, 0, 1,
-1.698833, 0.670532, -1.23036, 1, 0.3137255, 0, 1,
-1.693734, -0.4535415, -1.20382, 1, 0.3176471, 0, 1,
-1.689647, -0.6171992, -0.3973109, 1, 0.3254902, 0, 1,
-1.685479, 0.5303374, -1.374369, 1, 0.3294118, 0, 1,
-1.667423, -1.085296, -0.8589553, 1, 0.3372549, 0, 1,
-1.66461, 1.436566, -2.041828, 1, 0.3411765, 0, 1,
-1.650236, 0.2125495, -2.453438, 1, 0.3490196, 0, 1,
-1.647636, 0.9831637, -3.189137, 1, 0.3529412, 0, 1,
-1.631962, 0.7388345, -2.83252, 1, 0.3607843, 0, 1,
-1.611355, -0.3216322, -2.963149, 1, 0.3647059, 0, 1,
-1.609845, -0.1975, -0.8604304, 1, 0.372549, 0, 1,
-1.604955, 0.6685144, -1.322188, 1, 0.3764706, 0, 1,
-1.602994, -1.845876, -1.662704, 1, 0.3843137, 0, 1,
-1.595904, -1.639278, -1.738013, 1, 0.3882353, 0, 1,
-1.581499, -2.08199, -2.046721, 1, 0.3960784, 0, 1,
-1.580374, -0.9057695, -3.314882, 1, 0.4039216, 0, 1,
-1.570494, 0.6064405, -0.2597623, 1, 0.4078431, 0, 1,
-1.555104, 0.6821261, 0.00913118, 1, 0.4156863, 0, 1,
-1.550295, -1.062437, -2.403778, 1, 0.4196078, 0, 1,
-1.548321, -0.8875322, -2.464011, 1, 0.427451, 0, 1,
-1.537502, -0.5372093, -3.507288, 1, 0.4313726, 0, 1,
-1.534329, 0.4318527, -0.5756682, 1, 0.4392157, 0, 1,
-1.53166, 0.5014932, 0.1140221, 1, 0.4431373, 0, 1,
-1.53078, -0.5841291, -2.376325, 1, 0.4509804, 0, 1,
-1.530222, 0.2422389, -2.956571, 1, 0.454902, 0, 1,
-1.523528, 1.181194, 0.3763945, 1, 0.4627451, 0, 1,
-1.512765, 0.221969, -2.569458, 1, 0.4666667, 0, 1,
-1.509084, 0.2336103, -2.097147, 1, 0.4745098, 0, 1,
-1.491554, 2.491541, 0.2389128, 1, 0.4784314, 0, 1,
-1.487548, 0.2203486, -2.088179, 1, 0.4862745, 0, 1,
-1.481109, 1.403768, -0.5271316, 1, 0.4901961, 0, 1,
-1.466214, -1.442991, -2.855975, 1, 0.4980392, 0, 1,
-1.46606, -0.09291916, 0.250154, 1, 0.5058824, 0, 1,
-1.464908, 0.8298234, -1.682729, 1, 0.509804, 0, 1,
-1.454368, -2.156777, -0.5883479, 1, 0.5176471, 0, 1,
-1.43759, -0.6942717, -2.039147, 1, 0.5215687, 0, 1,
-1.435872, 1.027668, 1.037184, 1, 0.5294118, 0, 1,
-1.434304, -1.164831, -1.731734, 1, 0.5333334, 0, 1,
-1.428121, 1.653966, -0.9203638, 1, 0.5411765, 0, 1,
-1.401617, 1.706461, -1.455077, 1, 0.5450981, 0, 1,
-1.397844, -0.4661355, -1.073117, 1, 0.5529412, 0, 1,
-1.397598, 0.2865276, -0.2314772, 1, 0.5568628, 0, 1,
-1.395859, -2.2228, -3.289132, 1, 0.5647059, 0, 1,
-1.391534, -0.8058816, -3.669085, 1, 0.5686275, 0, 1,
-1.376523, -2.38397, -2.936795, 1, 0.5764706, 0, 1,
-1.376509, -0.2262542, -0.6905047, 1, 0.5803922, 0, 1,
-1.366734, 0.02872264, -0.5732605, 1, 0.5882353, 0, 1,
-1.365573, 0.03629812, 0.009363675, 1, 0.5921569, 0, 1,
-1.352737, -0.2272295, -1.133422, 1, 0.6, 0, 1,
-1.334521, -0.4497716, -1.482623, 1, 0.6078432, 0, 1,
-1.333379, -0.7145338, -1.254803, 1, 0.6117647, 0, 1,
-1.325265, 0.1031226, -2.885831, 1, 0.6196079, 0, 1,
-1.325052, -1.036671, -3.0151, 1, 0.6235294, 0, 1,
-1.324791, -0.1404368, -0.86946, 1, 0.6313726, 0, 1,
-1.324556, 1.573232, -1.233125, 1, 0.6352941, 0, 1,
-1.315503, 1.478577, -3.156981, 1, 0.6431373, 0, 1,
-1.314501, 1.699314, 0.9869773, 1, 0.6470588, 0, 1,
-1.311335, -1.100118, -1.449591, 1, 0.654902, 0, 1,
-1.30933, -0.486653, -1.821359, 1, 0.6588235, 0, 1,
-1.309088, -0.2754601, -1.222329, 1, 0.6666667, 0, 1,
-1.302668, 0.5320942, -1.013218, 1, 0.6705883, 0, 1,
-1.300169, -0.3270296, -1.979151, 1, 0.6784314, 0, 1,
-1.298699, 1.613257, 0.2130641, 1, 0.682353, 0, 1,
-1.297978, -0.6803731, -2.76468, 1, 0.6901961, 0, 1,
-1.287157, -0.2841398, -1.631331, 1, 0.6941177, 0, 1,
-1.285606, -1.23285, -2.039811, 1, 0.7019608, 0, 1,
-1.282457, 0.1032523, -2.635484, 1, 0.7098039, 0, 1,
-1.281084, -0.2615968, -1.447469, 1, 0.7137255, 0, 1,
-1.273992, 0.8877975, -0.05648318, 1, 0.7215686, 0, 1,
-1.265679, -0.2748528, -0.08805621, 1, 0.7254902, 0, 1,
-1.263039, -0.1390071, -0.3805639, 1, 0.7333333, 0, 1,
-1.261758, -1.799646, -4.806251, 1, 0.7372549, 0, 1,
-1.254705, -0.5904472, -2.633487, 1, 0.7450981, 0, 1,
-1.219892, -0.5263958, -1.345154, 1, 0.7490196, 0, 1,
-1.215803, -0.5663114, -2.052607, 1, 0.7568628, 0, 1,
-1.21543, 1.718177, -2.12479, 1, 0.7607843, 0, 1,
-1.210872, -0.7677891, -3.522561, 1, 0.7686275, 0, 1,
-1.205295, 0.7468691, -0.3597471, 1, 0.772549, 0, 1,
-1.19682, -0.3212527, -2.856118, 1, 0.7803922, 0, 1,
-1.194796, 2.137157, 1.716933, 1, 0.7843137, 0, 1,
-1.194615, -0.6591716, -2.011722, 1, 0.7921569, 0, 1,
-1.190536, -0.1445349, -0.7185912, 1, 0.7960784, 0, 1,
-1.184465, 0.5324568, -2.414767, 1, 0.8039216, 0, 1,
-1.181795, -0.09719312, -3.149147, 1, 0.8117647, 0, 1,
-1.170553, -0.492481, -2.946033, 1, 0.8156863, 0, 1,
-1.1682, -1.524796, -2.729617, 1, 0.8235294, 0, 1,
-1.163711, 0.5581616, -0.4370978, 1, 0.827451, 0, 1,
-1.161812, -1.331566, -0.417034, 1, 0.8352941, 0, 1,
-1.152005, -0.89165, -2.642824, 1, 0.8392157, 0, 1,
-1.150558, -0.8265323, -1.582333, 1, 0.8470588, 0, 1,
-1.146573, 0.8778241, -0.4054826, 1, 0.8509804, 0, 1,
-1.13402, -0.1095397, -1.357438, 1, 0.8588235, 0, 1,
-1.133416, -1.137781, -2.301044, 1, 0.8627451, 0, 1,
-1.120921, -0.6503111, -2.842156, 1, 0.8705882, 0, 1,
-1.118254, 0.9084697, 0.8207917, 1, 0.8745098, 0, 1,
-1.107004, 0.6793796, -1.187859, 1, 0.8823529, 0, 1,
-1.10559, -1.034927, -2.738567, 1, 0.8862745, 0, 1,
-1.100224, 0.7092792, 0.8847522, 1, 0.8941177, 0, 1,
-1.094328, -0.6440223, -0.340223, 1, 0.8980392, 0, 1,
-1.093759, 0.5608697, -1.211885, 1, 0.9058824, 0, 1,
-1.086922, -0.2315884, -1.506387, 1, 0.9137255, 0, 1,
-1.081394, -0.3665857, -3.977658, 1, 0.9176471, 0, 1,
-1.069944, 1.964843, -1.129398, 1, 0.9254902, 0, 1,
-1.069532, 0.6231192, -1.228687, 1, 0.9294118, 0, 1,
-1.0645, -0.2456947, -3.092915, 1, 0.9372549, 0, 1,
-1.047959, -0.2750013, -2.153663, 1, 0.9411765, 0, 1,
-1.040925, 0.4535377, 0.4505092, 1, 0.9490196, 0, 1,
-1.038618, 0.3470896, -2.19649, 1, 0.9529412, 0, 1,
-1.030394, -0.9408003, -3.72832, 1, 0.9607843, 0, 1,
-1.022305, -1.036284, -3.737228, 1, 0.9647059, 0, 1,
-1.018924, 0.5950397, -1.158027, 1, 0.972549, 0, 1,
-1.018454, 2.175633, 0.2134644, 1, 0.9764706, 0, 1,
-1.011832, -1.012397, -2.949497, 1, 0.9843137, 0, 1,
-1.010309, -0.4856769, -0.8857455, 1, 0.9882353, 0, 1,
-1.009152, 1.195787, 0.2902872, 1, 0.9960784, 0, 1,
-1.004527, -0.5427365, -1.470031, 0.9960784, 1, 0, 1,
-1.000286, -0.1509728, -1.210465, 0.9921569, 1, 0, 1,
-1.00019, -0.005495558, -0.1803715, 0.9843137, 1, 0, 1,
-0.9890339, -0.7342815, -3.280777, 0.9803922, 1, 0, 1,
-0.9753094, 0.4846261, -1.921007, 0.972549, 1, 0, 1,
-0.9707413, -1.177961, -1.247121, 0.9686275, 1, 0, 1,
-0.9704145, 0.9471417, -2.208493, 0.9607843, 1, 0, 1,
-0.9683885, 1.234307, 1.011358, 0.9568627, 1, 0, 1,
-0.9670504, 0.4640455, -3.275124, 0.9490196, 1, 0, 1,
-0.9665402, 2.701967, 0.125, 0.945098, 1, 0, 1,
-0.9542152, -0.6788014, -2.601498, 0.9372549, 1, 0, 1,
-0.9492827, -0.9385782, -2.184933, 0.9333333, 1, 0, 1,
-0.9474649, 0.6602577, -0.4927762, 0.9254902, 1, 0, 1,
-0.9468657, -0.338882, -2.792815, 0.9215686, 1, 0, 1,
-0.9386368, 0.2943697, -1.21328, 0.9137255, 1, 0, 1,
-0.9330102, 0.8151853, -0.9628018, 0.9098039, 1, 0, 1,
-0.9243327, -0.353228, -3.553584, 0.9019608, 1, 0, 1,
-0.923343, 0.6383132, -2.04895, 0.8941177, 1, 0, 1,
-0.9168168, -1.256561, -2.513529, 0.8901961, 1, 0, 1,
-0.9114773, -1.694854, -2.906863, 0.8823529, 1, 0, 1,
-0.9106081, 1.135774, -0.7637103, 0.8784314, 1, 0, 1,
-0.9079676, 0.6888732, -1.577037, 0.8705882, 1, 0, 1,
-0.905626, -1.992567, -1.165896, 0.8666667, 1, 0, 1,
-0.9054389, -0.7874133, -0.7608605, 0.8588235, 1, 0, 1,
-0.9031365, -0.6750915, -2.1103, 0.854902, 1, 0, 1,
-0.9029176, 0.2654394, -2.235246, 0.8470588, 1, 0, 1,
-0.9019148, -0.5948492, -1.832659, 0.8431373, 1, 0, 1,
-0.8947071, -0.2796075, -2.891349, 0.8352941, 1, 0, 1,
-0.8913509, 0.9849312, -0.5941558, 0.8313726, 1, 0, 1,
-0.8870819, -0.2440074, -1.443435, 0.8235294, 1, 0, 1,
-0.8856612, -0.3523135, -2.177109, 0.8196079, 1, 0, 1,
-0.8799638, 0.5941676, -3.58595, 0.8117647, 1, 0, 1,
-0.878733, 0.8201016, -0.6157882, 0.8078431, 1, 0, 1,
-0.8717755, -0.1531153, -2.443004, 0.8, 1, 0, 1,
-0.8675145, -0.8938516, -2.662212, 0.7921569, 1, 0, 1,
-0.8672038, 0.4452657, -2.20563, 0.7882353, 1, 0, 1,
-0.8661266, 0.7107145, -1.050486, 0.7803922, 1, 0, 1,
-0.8655974, 0.4790964, -0.3626735, 0.7764706, 1, 0, 1,
-0.8643857, 0.05602049, -1.486222, 0.7686275, 1, 0, 1,
-0.8634023, -0.007143461, -2.740853, 0.7647059, 1, 0, 1,
-0.8631853, -0.870577, -1.467098, 0.7568628, 1, 0, 1,
-0.8615472, 0.8695588, -1.832197, 0.7529412, 1, 0, 1,
-0.8568046, -0.749191, -2.681214, 0.7450981, 1, 0, 1,
-0.8528988, 0.6298533, -0.03653985, 0.7411765, 1, 0, 1,
-0.8509746, 1.284331, -1.358809, 0.7333333, 1, 0, 1,
-0.849705, 0.4172385, -0.314113, 0.7294118, 1, 0, 1,
-0.8447847, 1.335718, -1.59957, 0.7215686, 1, 0, 1,
-0.8438737, -1.571357, -1.982489, 0.7176471, 1, 0, 1,
-0.8368073, 0.9356825, -2.128093, 0.7098039, 1, 0, 1,
-0.8315082, 1.323, -0.670765, 0.7058824, 1, 0, 1,
-0.8311768, -0.6106223, -0.9050304, 0.6980392, 1, 0, 1,
-0.8299749, -0.8748754, -3.619215, 0.6901961, 1, 0, 1,
-0.8203419, -0.4709541, -2.155998, 0.6862745, 1, 0, 1,
-0.8135055, 0.7299812, -0.3433834, 0.6784314, 1, 0, 1,
-0.8010682, -1.829504, -3.955501, 0.6745098, 1, 0, 1,
-0.7934027, 0.2610385, -1.548929, 0.6666667, 1, 0, 1,
-0.7915281, 0.5682105, -0.5978187, 0.6627451, 1, 0, 1,
-0.7909792, -0.6394263, -0.7795478, 0.654902, 1, 0, 1,
-0.7884564, 0.493185, -0.4037575, 0.6509804, 1, 0, 1,
-0.7770672, -0.02703417, -1.642948, 0.6431373, 1, 0, 1,
-0.7739061, 1.186076, -1.147716, 0.6392157, 1, 0, 1,
-0.7720422, -1.784222, -2.841043, 0.6313726, 1, 0, 1,
-0.76888, 1.15859, -0.3398958, 0.627451, 1, 0, 1,
-0.7672837, -1.24319, -2.191064, 0.6196079, 1, 0, 1,
-0.7672035, -0.2590855, -2.176949, 0.6156863, 1, 0, 1,
-0.7663947, 1.004797, -2.308614, 0.6078432, 1, 0, 1,
-0.7569776, 0.6542568, -0.282228, 0.6039216, 1, 0, 1,
-0.7515982, -1.149572, -0.6831455, 0.5960785, 1, 0, 1,
-0.739141, 0.7182741, -1.155212, 0.5882353, 1, 0, 1,
-0.7362521, 0.9647608, 1.952862, 0.5843138, 1, 0, 1,
-0.7318971, 1.234825, -0.2699919, 0.5764706, 1, 0, 1,
-0.7299767, 0.7254193, -0.463147, 0.572549, 1, 0, 1,
-0.7219337, 0.5464596, -2.668581, 0.5647059, 1, 0, 1,
-0.7209712, -1.656479, -1.997137, 0.5607843, 1, 0, 1,
-0.7166111, -0.2188816, -2.134982, 0.5529412, 1, 0, 1,
-0.7157143, -0.5081713, -4.076175, 0.5490196, 1, 0, 1,
-0.7123882, 0.1702503, -1.194082, 0.5411765, 1, 0, 1,
-0.7095531, 1.469058, 1.266863, 0.5372549, 1, 0, 1,
-0.7080702, -1.0077, -2.627738, 0.5294118, 1, 0, 1,
-0.7019528, -0.8769599, -3.234222, 0.5254902, 1, 0, 1,
-0.70113, -0.963207, -2.814187, 0.5176471, 1, 0, 1,
-0.6994011, -0.9026461, -2.431021, 0.5137255, 1, 0, 1,
-0.6991207, -1.073262, -2.724716, 0.5058824, 1, 0, 1,
-0.6976215, -0.679585, -1.598042, 0.5019608, 1, 0, 1,
-0.6954603, -0.87498, -0.9126959, 0.4941176, 1, 0, 1,
-0.6931206, -1.687375, -2.276721, 0.4862745, 1, 0, 1,
-0.6924639, 0.8062772, -0.9912453, 0.4823529, 1, 0, 1,
-0.6922288, 0.4533803, -1.150269, 0.4745098, 1, 0, 1,
-0.6874264, -0.7138517, -2.346086, 0.4705882, 1, 0, 1,
-0.6865181, 0.4178163, -0.3379788, 0.4627451, 1, 0, 1,
-0.6804496, 0.1775866, -0.9600237, 0.4588235, 1, 0, 1,
-0.6747624, -0.6559978, -1.562786, 0.4509804, 1, 0, 1,
-0.6696896, 1.572704, -0.4831876, 0.4470588, 1, 0, 1,
-0.6686647, 0.4118568, -1.779643, 0.4392157, 1, 0, 1,
-0.6632515, -0.6386716, -0.8511015, 0.4352941, 1, 0, 1,
-0.6603814, 0.614948, -0.7711169, 0.427451, 1, 0, 1,
-0.6588703, 0.2387306, -1.956195, 0.4235294, 1, 0, 1,
-0.6587859, 0.6083125, 0.1559641, 0.4156863, 1, 0, 1,
-0.6577376, -0.7293243, -0.2067746, 0.4117647, 1, 0, 1,
-0.6509629, -1.796382, -2.291128, 0.4039216, 1, 0, 1,
-0.6495379, 1.771513, -0.8683032, 0.3960784, 1, 0, 1,
-0.6476171, 0.2032942, -0.8794516, 0.3921569, 1, 0, 1,
-0.6468595, 1.115193, 0.08071093, 0.3843137, 1, 0, 1,
-0.6463837, -1.844394, -2.034027, 0.3803922, 1, 0, 1,
-0.6436683, -1.209875, -2.708439, 0.372549, 1, 0, 1,
-0.6434165, -1.359691, -4.308261, 0.3686275, 1, 0, 1,
-0.6371062, 0.410337, -1.738058, 0.3607843, 1, 0, 1,
-0.6318871, 0.602344, -1.596464, 0.3568628, 1, 0, 1,
-0.6307493, -2.101825, -3.352546, 0.3490196, 1, 0, 1,
-0.6286884, -0.2333646, -1.979011, 0.345098, 1, 0, 1,
-0.6266836, -1.002414, -1.962658, 0.3372549, 1, 0, 1,
-0.6227803, -0.4028596, -4.295743, 0.3333333, 1, 0, 1,
-0.6216188, -1.180091, -2.601636, 0.3254902, 1, 0, 1,
-0.6215453, -0.3063498, -1.399229, 0.3215686, 1, 0, 1,
-0.6202443, -0.3892271, -2.150666, 0.3137255, 1, 0, 1,
-0.6194224, -0.006265491, -1.539851, 0.3098039, 1, 0, 1,
-0.6158155, -0.385163, -1.028704, 0.3019608, 1, 0, 1,
-0.6154935, 0.03630539, -1.551132, 0.2941177, 1, 0, 1,
-0.6069857, -0.7865552, -1.576351, 0.2901961, 1, 0, 1,
-0.6045935, -0.7167977, -2.586835, 0.282353, 1, 0, 1,
-0.6025568, 0.5351183, -1.33621, 0.2784314, 1, 0, 1,
-0.5982147, 1.338956, -1.019571, 0.2705882, 1, 0, 1,
-0.5937028, 1.975649, -1.707465, 0.2666667, 1, 0, 1,
-0.5931835, -1.456891, -3.09621, 0.2588235, 1, 0, 1,
-0.5928836, 0.1368981, -1.017538, 0.254902, 1, 0, 1,
-0.5921276, -0.4184455, -1.911608, 0.2470588, 1, 0, 1,
-0.5890288, 1.134677, -0.5070601, 0.2431373, 1, 0, 1,
-0.5888773, -1.255833, -1.813795, 0.2352941, 1, 0, 1,
-0.586722, 1.404514, 1.346529, 0.2313726, 1, 0, 1,
-0.5855219, 1.257978, -1.77752, 0.2235294, 1, 0, 1,
-0.5780287, 1.279286, -0.5460562, 0.2196078, 1, 0, 1,
-0.5773939, 0.5509537, 0.8268178, 0.2117647, 1, 0, 1,
-0.576314, -0.09704792, 0.0941724, 0.2078431, 1, 0, 1,
-0.5740718, 1.636121, -1.226554, 0.2, 1, 0, 1,
-0.5729043, -0.7549694, -2.577818, 0.1921569, 1, 0, 1,
-0.5684316, -0.0407095, -0.4321848, 0.1882353, 1, 0, 1,
-0.5662934, -1.588818, -4.5267, 0.1803922, 1, 0, 1,
-0.5658801, 1.380781, -1.740774, 0.1764706, 1, 0, 1,
-0.5658143, -0.008205179, -1.942872, 0.1686275, 1, 0, 1,
-0.562378, 0.8575135, -1.774998, 0.1647059, 1, 0, 1,
-0.561959, 0.4880104, -2.106818, 0.1568628, 1, 0, 1,
-0.5593997, -0.04002287, -1.752936, 0.1529412, 1, 0, 1,
-0.5526469, 0.3181546, 0.4522598, 0.145098, 1, 0, 1,
-0.5468436, 1.563469, 0.4445869, 0.1411765, 1, 0, 1,
-0.5397659, 1.014747, -1.213212, 0.1333333, 1, 0, 1,
-0.53905, 0.2777523, -0.9779838, 0.1294118, 1, 0, 1,
-0.5283167, 1.184819, 0.635078, 0.1215686, 1, 0, 1,
-0.5269421, 0.06252258, -0.8229395, 0.1176471, 1, 0, 1,
-0.5260832, -0.7402207, -3.578753, 0.1098039, 1, 0, 1,
-0.5249676, -1.425588, -2.260813, 0.1058824, 1, 0, 1,
-0.5218157, 0.03733567, -3.33539, 0.09803922, 1, 0, 1,
-0.5207136, -0.548096, -1.072228, 0.09019608, 1, 0, 1,
-0.5203096, -0.7044249, -2.68161, 0.08627451, 1, 0, 1,
-0.5181872, -1.056211, -1.846914, 0.07843138, 1, 0, 1,
-0.5172832, 1.411735, 1.073302, 0.07450981, 1, 0, 1,
-0.5117189, -0.7485623, -4.027888, 0.06666667, 1, 0, 1,
-0.5085171, 0.6686689, -1.463015, 0.0627451, 1, 0, 1,
-0.5003273, 1.498707, 0.130472, 0.05490196, 1, 0, 1,
-0.498967, -0.3257101, -2.891204, 0.05098039, 1, 0, 1,
-0.4976665, -0.3942075, -1.069629, 0.04313726, 1, 0, 1,
-0.4960865, 0.6426217, -0.953316, 0.03921569, 1, 0, 1,
-0.4918845, 0.6427039, -1.807965, 0.03137255, 1, 0, 1,
-0.484448, 0.5514241, -0.7911755, 0.02745098, 1, 0, 1,
-0.4832929, 1.250842, -0.4513678, 0.01960784, 1, 0, 1,
-0.4773058, 0.9000645, 0.3236977, 0.01568628, 1, 0, 1,
-0.4757647, -0.5527124, -2.936687, 0.007843138, 1, 0, 1,
-0.4729373, -1.372291, -3.775372, 0.003921569, 1, 0, 1,
-0.4698588, -1.341256, -2.698299, 0, 1, 0.003921569, 1,
-0.4671105, 0.6334941, -1.31844, 0, 1, 0.01176471, 1,
-0.4658318, -1.264449, -1.358543, 0, 1, 0.01568628, 1,
-0.4657626, -0.1967017, -1.572698, 0, 1, 0.02352941, 1,
-0.4596465, 0.5637302, -1.970823, 0, 1, 0.02745098, 1,
-0.4518063, -1.943053, -4.160506, 0, 1, 0.03529412, 1,
-0.4516067, -0.4085858, -3.829466, 0, 1, 0.03921569, 1,
-0.4444223, 1.864826, -0.5586941, 0, 1, 0.04705882, 1,
-0.44426, -0.06687827, -2.017464, 0, 1, 0.05098039, 1,
-0.4418146, -2.927584, -3.492961, 0, 1, 0.05882353, 1,
-0.4390669, -0.2068428, -1.489316, 0, 1, 0.0627451, 1,
-0.4228945, 0.0547037, -3.560921, 0, 1, 0.07058824, 1,
-0.422374, -1.474057, -2.591916, 0, 1, 0.07450981, 1,
-0.4177035, 0.7206445, -2.317545, 0, 1, 0.08235294, 1,
-0.415877, 1.78928, -1.407272, 0, 1, 0.08627451, 1,
-0.415824, 0.2424992, -2.535012, 0, 1, 0.09411765, 1,
-0.4137406, 0.6422701, -0.3732232, 0, 1, 0.1019608, 1,
-0.4115003, -1.3553, -1.311348, 0, 1, 0.1058824, 1,
-0.409044, 0.2587639, -0.2876293, 0, 1, 0.1137255, 1,
-0.4083205, -0.9845445, -2.457719, 0, 1, 0.1176471, 1,
-0.4071991, -1.126601, -1.493102, 0, 1, 0.1254902, 1,
-0.4000871, -1.411779, -4.674359, 0, 1, 0.1294118, 1,
-0.3927587, -0.1326922, -3.652804, 0, 1, 0.1372549, 1,
-0.3911254, 0.4435092, -0.9825549, 0, 1, 0.1411765, 1,
-0.3904805, 0.5160419, 0.277769, 0, 1, 0.1490196, 1,
-0.3871393, 1.115641, 0.478771, 0, 1, 0.1529412, 1,
-0.3857435, 1.554631, 0.4229957, 0, 1, 0.1607843, 1,
-0.3838893, 0.7739586, 1.160797, 0, 1, 0.1647059, 1,
-0.3827327, -0.1360516, -1.975786, 0, 1, 0.172549, 1,
-0.3766349, -1.438084, -3.536788, 0, 1, 0.1764706, 1,
-0.3722483, -0.8950509, -3.310758, 0, 1, 0.1843137, 1,
-0.3720955, 0.2204269, -1.920156, 0, 1, 0.1882353, 1,
-0.3694026, 0.007738503, -1.799092, 0, 1, 0.1960784, 1,
-0.3673991, -1.09549, -3.809306, 0, 1, 0.2039216, 1,
-0.3618174, 0.5686585, -0.6258268, 0, 1, 0.2078431, 1,
-0.3608988, -0.7701116, -3.290709, 0, 1, 0.2156863, 1,
-0.3566094, 0.5515491, -0.05609697, 0, 1, 0.2196078, 1,
-0.3553722, -0.2527201, -1.414782, 0, 1, 0.227451, 1,
-0.355264, 0.1722969, -0.4942126, 0, 1, 0.2313726, 1,
-0.3550925, -0.3261732, -3.14795, 0, 1, 0.2392157, 1,
-0.3510636, 0.4521454, -2.286805, 0, 1, 0.2431373, 1,
-0.3500018, 1.242731, -0.6325185, 0, 1, 0.2509804, 1,
-0.3483836, -0.3502671, -2.171479, 0, 1, 0.254902, 1,
-0.3462097, -0.444224, -1.773107, 0, 1, 0.2627451, 1,
-0.3367976, -1.2384, -1.693815, 0, 1, 0.2666667, 1,
-0.3347467, 1.357368, -1.050962, 0, 1, 0.2745098, 1,
-0.3344914, 1.673478, -0.1452278, 0, 1, 0.2784314, 1,
-0.3333575, 0.8466219, -1.337876, 0, 1, 0.2862745, 1,
-0.3327402, -0.1322281, -2.196064, 0, 1, 0.2901961, 1,
-0.3327264, 0.2624685, -0.9424394, 0, 1, 0.2980392, 1,
-0.3282977, 0.670926, -2.178127, 0, 1, 0.3058824, 1,
-0.3259758, -1.503108, -2.927573, 0, 1, 0.3098039, 1,
-0.3244343, -0.2892845, -3.84554, 0, 1, 0.3176471, 1,
-0.3216122, -0.3806086, -2.791793, 0, 1, 0.3215686, 1,
-0.3208494, 0.1323549, -1.810885, 0, 1, 0.3294118, 1,
-0.3196535, 0.8493089, 0.9125537, 0, 1, 0.3333333, 1,
-0.3191052, -2.011439, -2.205124, 0, 1, 0.3411765, 1,
-0.3138118, 0.5013301, -0.904389, 0, 1, 0.345098, 1,
-0.3135296, 1.220112, 1.444679, 0, 1, 0.3529412, 1,
-0.3089072, 0.9604245, -0.8668286, 0, 1, 0.3568628, 1,
-0.3060285, -0.2345558, -1.928907, 0, 1, 0.3647059, 1,
-0.3045231, -0.522872, -2.762504, 0, 1, 0.3686275, 1,
-0.2967809, -0.03501326, -1.235918, 0, 1, 0.3764706, 1,
-0.2966198, 0.8350758, -1.763729, 0, 1, 0.3803922, 1,
-0.2959676, 1.644604, 0.876714, 0, 1, 0.3882353, 1,
-0.2925106, 1.084577, 1.932981, 0, 1, 0.3921569, 1,
-0.2891701, 0.8718517, 0.8380967, 0, 1, 0.4, 1,
-0.2843214, 0.9310089, -0.02595933, 0, 1, 0.4078431, 1,
-0.2837825, 0.2308207, -2.626055, 0, 1, 0.4117647, 1,
-0.2791563, 2.210941, 0.9618015, 0, 1, 0.4196078, 1,
-0.2745793, 0.9624114, -0.7818702, 0, 1, 0.4235294, 1,
-0.2730162, 0.2278395, -0.6782306, 0, 1, 0.4313726, 1,
-0.2729365, -1.268746, -2.693063, 0, 1, 0.4352941, 1,
-0.2698596, 1.63537, 0.249535, 0, 1, 0.4431373, 1,
-0.2681401, 0.7426499, -1.574828, 0, 1, 0.4470588, 1,
-0.2662745, -1.522958, -2.166362, 0, 1, 0.454902, 1,
-0.2662572, -0.6370116, -5.223542, 0, 1, 0.4588235, 1,
-0.2656448, -2.175576, -3.655192, 0, 1, 0.4666667, 1,
-0.2638076, -0.1895073, -1.420055, 0, 1, 0.4705882, 1,
-0.2635549, -0.8770412, -2.508633, 0, 1, 0.4784314, 1,
-0.2568827, 1.626128, 0.1575474, 0, 1, 0.4823529, 1,
-0.2555077, -0.444194, -2.874603, 0, 1, 0.4901961, 1,
-0.2509396, -0.887448, -2.085634, 0, 1, 0.4941176, 1,
-0.2506194, -0.2675012, -2.329391, 0, 1, 0.5019608, 1,
-0.2496795, -0.1848446, -2.261348, 0, 1, 0.509804, 1,
-0.2483093, 0.7421346, 2.72235, 0, 1, 0.5137255, 1,
-0.2464223, -0.6706801, -3.113267, 0, 1, 0.5215687, 1,
-0.2414895, 0.2642605, -0.895302, 0, 1, 0.5254902, 1,
-0.2387825, 0.3740019, -1.509597, 0, 1, 0.5333334, 1,
-0.2351205, -0.8331799, -4.335306, 0, 1, 0.5372549, 1,
-0.2332477, 1.360717, -0.4161948, 0, 1, 0.5450981, 1,
-0.229426, -1.284884, -3.454735, 0, 1, 0.5490196, 1,
-0.2269307, 0.6800172, -0.05177399, 0, 1, 0.5568628, 1,
-0.2268736, -0.5232856, -3.788383, 0, 1, 0.5607843, 1,
-0.2266546, -0.4278599, -2.001414, 0, 1, 0.5686275, 1,
-0.2262937, -0.6589476, -2.978612, 0, 1, 0.572549, 1,
-0.2238212, 0.1876454, -0.2111995, 0, 1, 0.5803922, 1,
-0.2215338, -0.3772649, -1.876515, 0, 1, 0.5843138, 1,
-0.2163189, 0.8664898, 1.495246, 0, 1, 0.5921569, 1,
-0.2154678, 0.7749255, 0.7558812, 0, 1, 0.5960785, 1,
-0.2136941, -1.577628, -4.363822, 0, 1, 0.6039216, 1,
-0.2117171, -0.8149799, -4.058705, 0, 1, 0.6117647, 1,
-0.2115864, 0.2658149, -0.2135611, 0, 1, 0.6156863, 1,
-0.208341, -0.01538227, -1.453954, 0, 1, 0.6235294, 1,
-0.2054061, -0.8434934, -3.62623, 0, 1, 0.627451, 1,
-0.2009716, -0.3011023, -3.104681, 0, 1, 0.6352941, 1,
-0.2003822, -0.8637843, -4.382889, 0, 1, 0.6392157, 1,
-0.2002245, -0.1657849, -4.560557, 0, 1, 0.6470588, 1,
-0.1998922, 0.8892096, 1.32476, 0, 1, 0.6509804, 1,
-0.1963246, 0.3743075, -1.442383, 0, 1, 0.6588235, 1,
-0.1960719, 1.344215, -0.5289899, 0, 1, 0.6627451, 1,
-0.1946622, -0.1476754, 0.1061554, 0, 1, 0.6705883, 1,
-0.1776097, 0.1833773, 0.1751706, 0, 1, 0.6745098, 1,
-0.1769744, 0.1264387, -2.037986, 0, 1, 0.682353, 1,
-0.1722594, 1.383709, -0.425606, 0, 1, 0.6862745, 1,
-0.1697085, -0.1388155, -3.67103, 0, 1, 0.6941177, 1,
-0.1682736, 0.1803295, 0.4400533, 0, 1, 0.7019608, 1,
-0.1675439, 1.214206, -2.074652, 0, 1, 0.7058824, 1,
-0.1586859, 0.04566609, -0.1168222, 0, 1, 0.7137255, 1,
-0.1568138, -0.4034742, -3.838677, 0, 1, 0.7176471, 1,
-0.15601, -0.3557795, -2.692624, 0, 1, 0.7254902, 1,
-0.1547059, -0.2181464, -2.840319, 0, 1, 0.7294118, 1,
-0.1519812, -0.1281072, -2.939102, 0, 1, 0.7372549, 1,
-0.1509658, 0.149594, 0.2512823, 0, 1, 0.7411765, 1,
-0.1453063, -0.1753617, -1.860382, 0, 1, 0.7490196, 1,
-0.1264737, 2.566211, 0.8960144, 0, 1, 0.7529412, 1,
-0.1256554, -0.6706467, -3.608077, 0, 1, 0.7607843, 1,
-0.1251149, 0.08468212, -2.249148, 0, 1, 0.7647059, 1,
-0.11131, 0.5202629, -1.682213, 0, 1, 0.772549, 1,
-0.1059745, 0.4418384, -0.8441185, 0, 1, 0.7764706, 1,
-0.1046418, -0.5707259, -2.295482, 0, 1, 0.7843137, 1,
-0.1013657, 0.1993226, 0.1518846, 0, 1, 0.7882353, 1,
-0.1005476, -0.1408501, -1.568632, 0, 1, 0.7960784, 1,
-0.09927503, -0.9133363, -1.975179, 0, 1, 0.8039216, 1,
-0.09579648, 0.4012482, -0.4677145, 0, 1, 0.8078431, 1,
-0.09484619, -0.7136372, -2.085727, 0, 1, 0.8156863, 1,
-0.08657975, -0.3928422, -3.378314, 0, 1, 0.8196079, 1,
-0.07556638, 0.5947366, -0.5292659, 0, 1, 0.827451, 1,
-0.0716696, 0.1896876, 0.0879531, 0, 1, 0.8313726, 1,
-0.0711472, 2.538512, -0.67007, 0, 1, 0.8392157, 1,
-0.07022389, -0.5119808, -2.323849, 0, 1, 0.8431373, 1,
-0.07005629, 0.2716023, 0.1274171, 0, 1, 0.8509804, 1,
-0.06997579, -0.180564, -3.37399, 0, 1, 0.854902, 1,
-0.06454682, -0.4626521, -3.059003, 0, 1, 0.8627451, 1,
-0.05790482, 0.667586, -1.280142, 0, 1, 0.8666667, 1,
-0.05462005, -0.7425075, -3.513544, 0, 1, 0.8745098, 1,
-0.05309302, 1.337914, 0.446459, 0, 1, 0.8784314, 1,
-0.05096182, -0.8381611, -2.503452, 0, 1, 0.8862745, 1,
-0.05015464, -0.06667094, -2.616078, 0, 1, 0.8901961, 1,
-0.04153595, 1.652189, -0.17637, 0, 1, 0.8980392, 1,
-0.040281, 1.688381, 1.176353, 0, 1, 0.9058824, 1,
-0.03720522, -0.3604413, -1.904018, 0, 1, 0.9098039, 1,
-0.03706614, 0.2006184, -1.08054, 0, 1, 0.9176471, 1,
-0.03087723, 1.893151, -0.1998495, 0, 1, 0.9215686, 1,
-0.02843327, 1.250534, -0.7695771, 0, 1, 0.9294118, 1,
-0.02776686, 0.3461732, 1.309266, 0, 1, 0.9333333, 1,
-0.02167908, -0.2877934, -4.355684, 0, 1, 0.9411765, 1,
-0.02114039, -0.4293462, -4.055332, 0, 1, 0.945098, 1,
-0.02064416, -0.09049461, -3.611488, 0, 1, 0.9529412, 1,
-0.01791953, 0.04830623, -1.194032, 0, 1, 0.9568627, 1,
-0.01531856, -0.05485655, -1.270164, 0, 1, 0.9647059, 1,
-0.01410671, 1.209676, -0.9402056, 0, 1, 0.9686275, 1,
-0.009371736, -0.4214594, -3.361391, 0, 1, 0.9764706, 1,
-0.008695011, -0.3662733, -4.102141, 0, 1, 0.9803922, 1,
-0.004716734, -2.97823, -3.941835, 0, 1, 0.9882353, 1,
-0.003236004, 0.01159364, 0.01121192, 0, 1, 0.9921569, 1,
0.008656259, 0.1514114, 0.8059385, 0, 1, 1, 1,
0.00962918, -1.303452, 5.070534, 0, 0.9921569, 1, 1,
0.01102959, -0.5587, 2.223456, 0, 0.9882353, 1, 1,
0.0118578, 0.07873574, -1.243381, 0, 0.9803922, 1, 1,
0.01388968, -0.6795397, 4.588624, 0, 0.9764706, 1, 1,
0.01420949, -0.02096533, 2.795862, 0, 0.9686275, 1, 1,
0.01558267, -1.19123, 2.469777, 0, 0.9647059, 1, 1,
0.01850041, 1.321913, 1.297776, 0, 0.9568627, 1, 1,
0.01857474, 0.70894, 1.157269, 0, 0.9529412, 1, 1,
0.02251828, 0.1656224, -0.2517296, 0, 0.945098, 1, 1,
0.02911768, 0.07443735, -0.06714702, 0, 0.9411765, 1, 1,
0.02953617, 0.2108361, 0.5277627, 0, 0.9333333, 1, 1,
0.03005826, 0.4810989, -1.117111, 0, 0.9294118, 1, 1,
0.03118035, -0.7546543, 2.844788, 0, 0.9215686, 1, 1,
0.03604201, 0.167358, -0.8669881, 0, 0.9176471, 1, 1,
0.03618431, 1.055328, 0.3148342, 0, 0.9098039, 1, 1,
0.03948493, 0.09737787, -0.1834106, 0, 0.9058824, 1, 1,
0.04009252, -0.9137173, 2.531755, 0, 0.8980392, 1, 1,
0.0408697, 0.7399839, -0.6745115, 0, 0.8901961, 1, 1,
0.04243745, -0.6306427, 3.991482, 0, 0.8862745, 1, 1,
0.04531306, -0.5383635, 3.278326, 0, 0.8784314, 1, 1,
0.0472114, 0.1015763, -0.9168211, 0, 0.8745098, 1, 1,
0.05000599, 0.8312393, 0.2139572, 0, 0.8666667, 1, 1,
0.05142562, -0.1936281, 1.83138, 0, 0.8627451, 1, 1,
0.05634996, 0.8721766, 0.2640015, 0, 0.854902, 1, 1,
0.05701583, 0.03675017, 0.8715588, 0, 0.8509804, 1, 1,
0.05825717, -0.8058797, 2.418405, 0, 0.8431373, 1, 1,
0.05967755, -0.5283325, 3.352065, 0, 0.8392157, 1, 1,
0.067454, 0.4881864, -0.6849005, 0, 0.8313726, 1, 1,
0.07685829, 0.9072345, -0.9054927, 0, 0.827451, 1, 1,
0.08134285, -1.49436, 2.522555, 0, 0.8196079, 1, 1,
0.08407142, -0.1031376, 3.164047, 0, 0.8156863, 1, 1,
0.08473672, -0.6799582, 2.943427, 0, 0.8078431, 1, 1,
0.08524565, -0.9925101, 4.004849, 0, 0.8039216, 1, 1,
0.08573633, 0.05063838, 1.536808, 0, 0.7960784, 1, 1,
0.0858584, 2.560834, 1.41645, 0, 0.7882353, 1, 1,
0.09207202, 0.4992045, -1.167396, 0, 0.7843137, 1, 1,
0.09397361, -0.1030015, 1.766558, 0, 0.7764706, 1, 1,
0.09842487, 1.217523, -0.4578404, 0, 0.772549, 1, 1,
0.09909068, 0.28691, -0.6947367, 0, 0.7647059, 1, 1,
0.1001731, 1.16999, -1.495198, 0, 0.7607843, 1, 1,
0.1003033, -0.03961953, 3.183469, 0, 0.7529412, 1, 1,
0.1006225, 1.700876, -1.414377, 0, 0.7490196, 1, 1,
0.1028805, 2.758629, -0.07456382, 0, 0.7411765, 1, 1,
0.1030187, -0.6637628, 2.478264, 0, 0.7372549, 1, 1,
0.1030941, 0.8073118, 1.219901, 0, 0.7294118, 1, 1,
0.1109823, -0.8764511, 2.385458, 0, 0.7254902, 1, 1,
0.1151949, -0.6157911, 0.7027711, 0, 0.7176471, 1, 1,
0.1155337, 1.945684, -0.3921128, 0, 0.7137255, 1, 1,
0.1160821, 1.218243, 2.324944, 0, 0.7058824, 1, 1,
0.1172458, -0.3137143, 2.882048, 0, 0.6980392, 1, 1,
0.1190405, -1.265349, 3.077468, 0, 0.6941177, 1, 1,
0.1239764, -0.07854736, 3.271261, 0, 0.6862745, 1, 1,
0.1279961, -0.3111503, 3.094309, 0, 0.682353, 1, 1,
0.1288797, -1.059502, 3.431281, 0, 0.6745098, 1, 1,
0.1292868, -0.9100981, 2.166042, 0, 0.6705883, 1, 1,
0.1334849, -0.828985, 2.325375, 0, 0.6627451, 1, 1,
0.1362843, 0.8721343, 1.941308, 0, 0.6588235, 1, 1,
0.1396894, -0.8609292, 2.039098, 0, 0.6509804, 1, 1,
0.140249, 1.124367, 0.6503874, 0, 0.6470588, 1, 1,
0.1403829, 0.5641834, 0.3177676, 0, 0.6392157, 1, 1,
0.1480205, -1.382863, 2.673464, 0, 0.6352941, 1, 1,
0.1480525, -0.9806157, 3.201356, 0, 0.627451, 1, 1,
0.1485578, 0.8053079, -0.148944, 0, 0.6235294, 1, 1,
0.1508484, 0.959752, 0.515282, 0, 0.6156863, 1, 1,
0.1594923, -2.535804, 2.197033, 0, 0.6117647, 1, 1,
0.1657515, 0.1773192, 0.2927689, 0, 0.6039216, 1, 1,
0.1691878, 2.146511, 0.6724482, 0, 0.5960785, 1, 1,
0.1730613, -1.096005, 1.494892, 0, 0.5921569, 1, 1,
0.173248, 0.6794772, 0.0787263, 0, 0.5843138, 1, 1,
0.1750074, -0.7177166, 5.046589, 0, 0.5803922, 1, 1,
0.1756274, -2.029059, 3.657018, 0, 0.572549, 1, 1,
0.181031, 2.062455, -0.5848407, 0, 0.5686275, 1, 1,
0.1841794, 0.4535386, 1.18812, 0, 0.5607843, 1, 1,
0.1914244, 1.197721, -1.032915, 0, 0.5568628, 1, 1,
0.1920922, -0.6025321, 2.940874, 0, 0.5490196, 1, 1,
0.1931037, -1.05815, 5.260446, 0, 0.5450981, 1, 1,
0.1936472, -1.679967, 1.978285, 0, 0.5372549, 1, 1,
0.2019589, -0.6473882, 2.749814, 0, 0.5333334, 1, 1,
0.2037196, 0.6210327, 0.9350781, 0, 0.5254902, 1, 1,
0.2044698, -0.2426312, 3.808067, 0, 0.5215687, 1, 1,
0.2050632, 1.136615, -3.144171, 0, 0.5137255, 1, 1,
0.2056513, -0.787278, 4.12488, 0, 0.509804, 1, 1,
0.208125, 0.9092457, 0.7465284, 0, 0.5019608, 1, 1,
0.2083828, -0.7774218, 3.698804, 0, 0.4941176, 1, 1,
0.210044, 0.9317647, 0.8072593, 0, 0.4901961, 1, 1,
0.2103501, 0.02148597, 1.898974, 0, 0.4823529, 1, 1,
0.2160529, -0.850226, 3.068478, 0, 0.4784314, 1, 1,
0.2245829, -1.061021, 3.420688, 0, 0.4705882, 1, 1,
0.2283714, -1.86756, 2.804788, 0, 0.4666667, 1, 1,
0.2300472, 0.0290534, 2.055133, 0, 0.4588235, 1, 1,
0.2305378, -0.0239278, 2.522944, 0, 0.454902, 1, 1,
0.230968, -0.5390289, 2.425002, 0, 0.4470588, 1, 1,
0.2326285, 0.9871126, 0.2936631, 0, 0.4431373, 1, 1,
0.2349906, 1.028222, 0.6676501, 0, 0.4352941, 1, 1,
0.236785, 0.04053338, 2.412724, 0, 0.4313726, 1, 1,
0.2388609, -0.2895242, 3.130402, 0, 0.4235294, 1, 1,
0.2394549, -0.7789408, 4.766311, 0, 0.4196078, 1, 1,
0.2398512, 0.4392239, 0.6671968, 0, 0.4117647, 1, 1,
0.2400173, 1.960724, -1.74946, 0, 0.4078431, 1, 1,
0.2405582, -2.152627, 2.537935, 0, 0.4, 1, 1,
0.2434027, -0.103117, 1.581445, 0, 0.3921569, 1, 1,
0.243493, -0.536536, -0.2559955, 0, 0.3882353, 1, 1,
0.2463693, -0.3764172, 2.241607, 0, 0.3803922, 1, 1,
0.2465822, 2.011254, -0.919951, 0, 0.3764706, 1, 1,
0.2502483, -0.6741645, 3.215841, 0, 0.3686275, 1, 1,
0.256771, 1.151006, -1.473438, 0, 0.3647059, 1, 1,
0.2581388, 0.7794734, 0.5578243, 0, 0.3568628, 1, 1,
0.2584531, -0.1081747, 2.074735, 0, 0.3529412, 1, 1,
0.2614824, 1.008593, 0.1090238, 0, 0.345098, 1, 1,
0.2696814, 1.210923, 1.899139, 0, 0.3411765, 1, 1,
0.2714524, -0.3826955, 2.480958, 0, 0.3333333, 1, 1,
0.274971, -0.138889, 2.378717, 0, 0.3294118, 1, 1,
0.2758433, 0.6698421, 0.50036, 0, 0.3215686, 1, 1,
0.2769715, -0.3139105, 4.285478, 0, 0.3176471, 1, 1,
0.2769939, -0.7385096, 1.574063, 0, 0.3098039, 1, 1,
0.2781276, 0.09522229, 0.6061246, 0, 0.3058824, 1, 1,
0.2786853, 1.029634, 1.378101, 0, 0.2980392, 1, 1,
0.2792718, 0.1036823, 1.829571, 0, 0.2901961, 1, 1,
0.2805889, -2.410075, 2.849687, 0, 0.2862745, 1, 1,
0.2829563, -0.06191405, 3.588796, 0, 0.2784314, 1, 1,
0.2834722, -1.089432, 4.649689, 0, 0.2745098, 1, 1,
0.2837851, -0.7004083, 1.990809, 0, 0.2666667, 1, 1,
0.284553, 0.3752764, 0.5104895, 0, 0.2627451, 1, 1,
0.2859831, -0.8878976, 2.776992, 0, 0.254902, 1, 1,
0.2871064, -1.291356, 3.866245, 0, 0.2509804, 1, 1,
0.2871348, 0.1316773, 1.455517, 0, 0.2431373, 1, 1,
0.2929257, -0.7612824, 4.974385, 0, 0.2392157, 1, 1,
0.2941613, 0.4062719, -0.3836884, 0, 0.2313726, 1, 1,
0.297315, -1.458498, 2.221626, 0, 0.227451, 1, 1,
0.2981994, 1.301715, 1.086968, 0, 0.2196078, 1, 1,
0.3043104, 1.395711, 1.096576, 0, 0.2156863, 1, 1,
0.3047832, -0.3639504, 1.777431, 0, 0.2078431, 1, 1,
0.3082352, 0.5957791, 1.716969, 0, 0.2039216, 1, 1,
0.3109362, -0.4734657, 2.329127, 0, 0.1960784, 1, 1,
0.3139142, -1.004534, 2.159509, 0, 0.1882353, 1, 1,
0.3144308, -0.9746731, 3.143352, 0, 0.1843137, 1, 1,
0.3187744, 0.3559223, 1.556017, 0, 0.1764706, 1, 1,
0.3212411, -1.079911, 4.032537, 0, 0.172549, 1, 1,
0.3236318, 1.316994, 1.261862, 0, 0.1647059, 1, 1,
0.3269432, -0.752753, 3.156124, 0, 0.1607843, 1, 1,
0.3363959, -0.4845688, 1.798568, 0, 0.1529412, 1, 1,
0.3449777, -1.517765, 3.639254, 0, 0.1490196, 1, 1,
0.345229, 1.322738, 0.2424757, 0, 0.1411765, 1, 1,
0.34725, 2.725504, -0.4175963, 0, 0.1372549, 1, 1,
0.3480569, -0.3300368, 1.182853, 0, 0.1294118, 1, 1,
0.3517562, 1.49202, 1.599497, 0, 0.1254902, 1, 1,
0.3522749, -0.5244048, 3.093531, 0, 0.1176471, 1, 1,
0.3632354, 1.700481, -0.532323, 0, 0.1137255, 1, 1,
0.3660701, -0.1848981, 3.289788, 0, 0.1058824, 1, 1,
0.3664839, 1.286258, 0.1445904, 0, 0.09803922, 1, 1,
0.3696784, -0.09940354, 1.530169, 0, 0.09411765, 1, 1,
0.3719976, 0.1857958, 0.7534185, 0, 0.08627451, 1, 1,
0.377271, 0.8747929, 0.3427536, 0, 0.08235294, 1, 1,
0.3859743, 1.699963, 0.8296874, 0, 0.07450981, 1, 1,
0.3907267, -0.2419612, 1.718847, 0, 0.07058824, 1, 1,
0.3971381, 1.534784, 2.228299, 0, 0.0627451, 1, 1,
0.3995887, 0.5321669, 0.1816666, 0, 0.05882353, 1, 1,
0.4008744, -1.238293, 3.471014, 0, 0.05098039, 1, 1,
0.4009985, -1.40972, 1.777932, 0, 0.04705882, 1, 1,
0.4015702, 1.537822, -1.815008, 0, 0.03921569, 1, 1,
0.4034524, -0.7494824, 2.504455, 0, 0.03529412, 1, 1,
0.4047458, 0.6004667, 0.9947134, 0, 0.02745098, 1, 1,
0.4081238, -0.1627968, 2.563234, 0, 0.02352941, 1, 1,
0.4101043, 0.987011, 0.556008, 0, 0.01568628, 1, 1,
0.4145886, -1.544926, 2.591499, 0, 0.01176471, 1, 1,
0.4166803, 0.2467607, 0.7383952, 0, 0.003921569, 1, 1,
0.4171862, 1.278534, 0.6076175, 0.003921569, 0, 1, 1,
0.417299, -0.9448068, 3.216429, 0.007843138, 0, 1, 1,
0.4187651, 0.6700903, 2.619341, 0.01568628, 0, 1, 1,
0.4195642, -1.125012, 2.148855, 0.01960784, 0, 1, 1,
0.4203593, -0.1789259, 1.52899, 0.02745098, 0, 1, 1,
0.4229535, -0.4067358, 2.011708, 0.03137255, 0, 1, 1,
0.4231585, 0.3065246, 0.745318, 0.03921569, 0, 1, 1,
0.4238441, 0.368581, 2.337462, 0.04313726, 0, 1, 1,
0.4251323, -0.4898781, 1.985731, 0.05098039, 0, 1, 1,
0.4256627, -0.1257035, 1.180358, 0.05490196, 0, 1, 1,
0.4257963, -0.01175804, 1.92784, 0.0627451, 0, 1, 1,
0.4314, -2.186451, 4.698217, 0.06666667, 0, 1, 1,
0.4326801, 0.7064783, -0.1198541, 0.07450981, 0, 1, 1,
0.4337295, 1.221172, 0.2831478, 0.07843138, 0, 1, 1,
0.4362476, -0.09104019, 2.839195, 0.08627451, 0, 1, 1,
0.4411202, -0.8137555, 1.088923, 0.09019608, 0, 1, 1,
0.4424619, -0.9461316, 2.98779, 0.09803922, 0, 1, 1,
0.4437871, -0.1233358, 2.996964, 0.1058824, 0, 1, 1,
0.4441092, -1.257585, 2.014775, 0.1098039, 0, 1, 1,
0.4528604, 0.4841293, 2.214881, 0.1176471, 0, 1, 1,
0.4563257, 0.3990134, 1.181008, 0.1215686, 0, 1, 1,
0.4573013, 0.1070064, 0.5875828, 0.1294118, 0, 1, 1,
0.45731, -1.020893, 4.219145, 0.1333333, 0, 1, 1,
0.4577314, -0.9793229, 2.105702, 0.1411765, 0, 1, 1,
0.4646595, -1.090892, 2.496694, 0.145098, 0, 1, 1,
0.4651669, -1.425357, 3.504279, 0.1529412, 0, 1, 1,
0.4687042, -1.900199, 2.788946, 0.1568628, 0, 1, 1,
0.4714881, -0.1203509, 0.6043658, 0.1647059, 0, 1, 1,
0.4736785, -0.08784319, 2.55614, 0.1686275, 0, 1, 1,
0.4769204, 1.122997, -1.189161, 0.1764706, 0, 1, 1,
0.4782817, -0.7939724, 1.419152, 0.1803922, 0, 1, 1,
0.4818087, -0.470797, 3.666739, 0.1882353, 0, 1, 1,
0.4851732, 1.133499, 1.400182, 0.1921569, 0, 1, 1,
0.4889791, 0.001896535, 3.019389, 0.2, 0, 1, 1,
0.4929924, 0.3925378, -1.512579, 0.2078431, 0, 1, 1,
0.4938249, -0.8157412, 1.970686, 0.2117647, 0, 1, 1,
0.4955303, 0.8177845, 1.901238, 0.2196078, 0, 1, 1,
0.4956097, -0.8546551, 3.874097, 0.2235294, 0, 1, 1,
0.5038849, 0.2710674, 1.128307, 0.2313726, 0, 1, 1,
0.5051223, -1.724454, 3.09383, 0.2352941, 0, 1, 1,
0.5064704, -0.5077966, 1.686093, 0.2431373, 0, 1, 1,
0.514135, 1.501031, 1.687149, 0.2470588, 0, 1, 1,
0.514838, 2.012628, 0.007487873, 0.254902, 0, 1, 1,
0.5232771, 0.8345191, -0.6101867, 0.2588235, 0, 1, 1,
0.5277637, 0.9207567, 1.094761, 0.2666667, 0, 1, 1,
0.5320165, 0.1507298, 1.309467, 0.2705882, 0, 1, 1,
0.5336252, 0.3672382, 0.02040542, 0.2784314, 0, 1, 1,
0.5362264, -0.1025027, 3.286662, 0.282353, 0, 1, 1,
0.5363883, -1.141248, 4.154915, 0.2901961, 0, 1, 1,
0.53913, -0.03198989, 1.575287, 0.2941177, 0, 1, 1,
0.5404355, 1.028412, -0.1372252, 0.3019608, 0, 1, 1,
0.5472606, 0.3864414, -0.3250423, 0.3098039, 0, 1, 1,
0.5503399, 0.7440907, -0.4216052, 0.3137255, 0, 1, 1,
0.5599979, -0.2717146, 0.02730428, 0.3215686, 0, 1, 1,
0.5605925, 0.3660282, 3.216841, 0.3254902, 0, 1, 1,
0.5610654, -0.06664122, 1.822089, 0.3333333, 0, 1, 1,
0.5684618, 0.02109986, 1.222474, 0.3372549, 0, 1, 1,
0.5720406, -1.839513, 2.413464, 0.345098, 0, 1, 1,
0.5780753, 1.271211, 1.535935, 0.3490196, 0, 1, 1,
0.5962174, -1.661452, 1.592925, 0.3568628, 0, 1, 1,
0.5968072, 0.3857144, 1.2239, 0.3607843, 0, 1, 1,
0.5970578, -0.6332234, 0.9093415, 0.3686275, 0, 1, 1,
0.6005235, 1.745945, 2.342857, 0.372549, 0, 1, 1,
0.6025693, -0.05077819, 1.984943, 0.3803922, 0, 1, 1,
0.6031309, -1.239324, 2.31656, 0.3843137, 0, 1, 1,
0.6103779, 0.9030504, 0.0709731, 0.3921569, 0, 1, 1,
0.6161358, -0.2919231, 0.8178891, 0.3960784, 0, 1, 1,
0.6172885, -0.6792216, 3.299544, 0.4039216, 0, 1, 1,
0.6172995, -0.3820361, 1.627846, 0.4117647, 0, 1, 1,
0.6181846, 0.6381299, 1.035812, 0.4156863, 0, 1, 1,
0.6196663, 1.469693, 0.01833616, 0.4235294, 0, 1, 1,
0.6197066, -0.6725662, 2.035063, 0.427451, 0, 1, 1,
0.6197557, -2.189834, 2.587142, 0.4352941, 0, 1, 1,
0.6211402, 0.5232825, 1.547003, 0.4392157, 0, 1, 1,
0.6221914, 0.298957, 0.06443591, 0.4470588, 0, 1, 1,
0.6222013, 0.8889387, 1.148531, 0.4509804, 0, 1, 1,
0.6238484, -0.8889567, 3.082572, 0.4588235, 0, 1, 1,
0.6249208, -0.6578833, 3.126024, 0.4627451, 0, 1, 1,
0.6328524, 2.749756, -1.319017, 0.4705882, 0, 1, 1,
0.6328822, 1.218648, -0.544734, 0.4745098, 0, 1, 1,
0.6356817, 0.7837092, 1.2754, 0.4823529, 0, 1, 1,
0.6362059, -1.227821, 2.115748, 0.4862745, 0, 1, 1,
0.6412979, -0.9989291, 2.677191, 0.4941176, 0, 1, 1,
0.6424646, 0.175677, 1.825297, 0.5019608, 0, 1, 1,
0.6506425, -0.3084289, 1.661419, 0.5058824, 0, 1, 1,
0.6514643, -1.21282, 1.650292, 0.5137255, 0, 1, 1,
0.6589213, -0.6404715, 1.818743, 0.5176471, 0, 1, 1,
0.6616893, -0.1646323, 2.664354, 0.5254902, 0, 1, 1,
0.6620241, 0.9450254, 1.411377, 0.5294118, 0, 1, 1,
0.6652457, 1.406898, 0.1308958, 0.5372549, 0, 1, 1,
0.6695377, 0.3661457, 1.472412, 0.5411765, 0, 1, 1,
0.67136, 2.691195, 1.021283, 0.5490196, 0, 1, 1,
0.6733136, 1.239877, -0.6674479, 0.5529412, 0, 1, 1,
0.6786981, -0.343216, 1.946557, 0.5607843, 0, 1, 1,
0.6880801, 0.3982542, 1.868732, 0.5647059, 0, 1, 1,
0.6894268, -1.169062, 3.172616, 0.572549, 0, 1, 1,
0.6903763, -0.3172298, 1.474977, 0.5764706, 0, 1, 1,
0.6985154, -0.7668199, 3.568339, 0.5843138, 0, 1, 1,
0.7028924, 0.01384956, 0.8102353, 0.5882353, 0, 1, 1,
0.7050961, 0.1435411, 2.877855, 0.5960785, 0, 1, 1,
0.7092044, 0.01443253, 0.1373384, 0.6039216, 0, 1, 1,
0.713246, 0.9414045, -0.07171419, 0.6078432, 0, 1, 1,
0.7136495, -1.077525, 3.117429, 0.6156863, 0, 1, 1,
0.7139985, -0.6206608, 2.372097, 0.6196079, 0, 1, 1,
0.7148424, 0.4330628, -0.7836809, 0.627451, 0, 1, 1,
0.7195685, -1.470357, 1.76639, 0.6313726, 0, 1, 1,
0.7198296, -0.6367361, 1.983487, 0.6392157, 0, 1, 1,
0.7204512, -1.155598, 3.109425, 0.6431373, 0, 1, 1,
0.7219121, -1.008006, 3.092609, 0.6509804, 0, 1, 1,
0.7228294, 0.532849, 1.37213, 0.654902, 0, 1, 1,
0.7271274, -1.993126, 2.265613, 0.6627451, 0, 1, 1,
0.7274722, 0.4615924, 0.1266527, 0.6666667, 0, 1, 1,
0.7417192, 1.167134, -0.8481414, 0.6745098, 0, 1, 1,
0.7430376, -0.5520568, 2.176805, 0.6784314, 0, 1, 1,
0.7523813, 0.3363759, 2.28576, 0.6862745, 0, 1, 1,
0.7577145, -0.8964989, 1.506333, 0.6901961, 0, 1, 1,
0.7578577, -0.01361217, 0.8190918, 0.6980392, 0, 1, 1,
0.7588633, -0.5883046, 1.662305, 0.7058824, 0, 1, 1,
0.7659773, 0.494559, -1.427602, 0.7098039, 0, 1, 1,
0.7662689, 2.396943, 0.0577055, 0.7176471, 0, 1, 1,
0.766416, 0.2498022, 2.990281, 0.7215686, 0, 1, 1,
0.7694315, -0.7499239, 1.081194, 0.7294118, 0, 1, 1,
0.7738896, 0.5504156, 0.960366, 0.7333333, 0, 1, 1,
0.7789053, -0.7920499, 2.406188, 0.7411765, 0, 1, 1,
0.7798545, 0.8790656, 0.3206735, 0.7450981, 0, 1, 1,
0.7824287, 0.1477676, 2.619907, 0.7529412, 0, 1, 1,
0.7890897, 1.047889, 2.099924, 0.7568628, 0, 1, 1,
0.7906651, 0.1725985, 2.392177, 0.7647059, 0, 1, 1,
0.8066213, -0.20062, 1.503632, 0.7686275, 0, 1, 1,
0.807965, -0.8577887, 1.555071, 0.7764706, 0, 1, 1,
0.8110235, 0.2271592, 0.8392534, 0.7803922, 0, 1, 1,
0.8140243, -0.7972502, 2.934368, 0.7882353, 0, 1, 1,
0.8163423, -0.7782139, 3.668361, 0.7921569, 0, 1, 1,
0.8293154, 0.2428724, 0.6690947, 0.8, 0, 1, 1,
0.8321314, 0.3351048, 0.5912353, 0.8078431, 0, 1, 1,
0.8342721, 0.5782219, 2.140766, 0.8117647, 0, 1, 1,
0.838693, 0.2216819, -0.1305342, 0.8196079, 0, 1, 1,
0.8406565, -1.540433, 1.569815, 0.8235294, 0, 1, 1,
0.8413653, -0.9439973, 1.736596, 0.8313726, 0, 1, 1,
0.8423218, 0.4571965, 0.9695709, 0.8352941, 0, 1, 1,
0.8465039, -0.1409784, 2.608277, 0.8431373, 0, 1, 1,
0.850945, -1.196453, 3.03158, 0.8470588, 0, 1, 1,
0.8515524, 0.03822149, 1.351293, 0.854902, 0, 1, 1,
0.8549748, 0.1064643, 2.151178, 0.8588235, 0, 1, 1,
0.8557869, 0.2445402, 2.192298, 0.8666667, 0, 1, 1,
0.8623556, 0.535004, 0.2062988, 0.8705882, 0, 1, 1,
0.871661, -0.6998037, 0.3402617, 0.8784314, 0, 1, 1,
0.8771477, -1.136218, 2.181834, 0.8823529, 0, 1, 1,
0.878722, 0.06307752, 1.813597, 0.8901961, 0, 1, 1,
0.8827075, -0.6197466, 1.397676, 0.8941177, 0, 1, 1,
0.883045, -0.1480532, 3.642659, 0.9019608, 0, 1, 1,
0.8832973, -1.715391, 3.430924, 0.9098039, 0, 1, 1,
0.8906404, 0.8509874, 1.440476, 0.9137255, 0, 1, 1,
0.8943784, 1.007208, -2.335297, 0.9215686, 0, 1, 1,
0.8953928, -1.014393, 1.575145, 0.9254902, 0, 1, 1,
0.9012628, 1.017356, 0.5754089, 0.9333333, 0, 1, 1,
0.9016215, -0.9335667, 3.309782, 0.9372549, 0, 1, 1,
0.9080334, -0.5133394, 1.852992, 0.945098, 0, 1, 1,
0.9132648, -0.2656069, 0.900104, 0.9490196, 0, 1, 1,
0.9271212, -1.455099, 2.04885, 0.9568627, 0, 1, 1,
0.9332911, 0.7239039, 1.285153, 0.9607843, 0, 1, 1,
0.9353293, -1.455726, 2.441213, 0.9686275, 0, 1, 1,
0.9364524, 0.6039193, 1.460099, 0.972549, 0, 1, 1,
0.9457041, -1.11417, 2.953055, 0.9803922, 0, 1, 1,
0.9460515, -1.975439, 2.925992, 0.9843137, 0, 1, 1,
0.9540938, 0.1907335, 1.989104, 0.9921569, 0, 1, 1,
0.9542413, -1.577978, 3.153927, 0.9960784, 0, 1, 1,
0.9582208, 0.3509726, 2.459989, 1, 0, 0.9960784, 1,
0.9582248, 0.6449626, 2.175884, 1, 0, 0.9882353, 1,
0.9683016, 1.037338, 1.859899, 1, 0, 0.9843137, 1,
0.979429, -1.176019, 2.254932, 1, 0, 0.9764706, 1,
0.9798307, -0.8655555, 1.740041, 1, 0, 0.972549, 1,
0.9836324, 1.876114, -0.6645782, 1, 0, 0.9647059, 1,
0.9852278, -0.303175, 0.5398265, 1, 0, 0.9607843, 1,
0.9869255, 1.563987, 1.691739, 1, 0, 0.9529412, 1,
0.9917063, 0.5215203, 0.7116081, 1, 0, 0.9490196, 1,
0.9944379, 0.08565345, 1.365652, 1, 0, 0.9411765, 1,
0.9968439, 0.1612136, 1.035179, 1, 0, 0.9372549, 1,
0.9979045, -0.3949065, 1.75769, 1, 0, 0.9294118, 1,
0.9990619, 1.641873, 1.500836, 1, 0, 0.9254902, 1,
0.9991574, 2.111339, -0.8177859, 1, 0, 0.9176471, 1,
1.000051, -0.4676748, 0.2352673, 1, 0, 0.9137255, 1,
1.005223, -0.3828261, 1.580932, 1, 0, 0.9058824, 1,
1.015435, -0.1761542, 2.650608, 1, 0, 0.9019608, 1,
1.01654, -0.09036044, -1.108884, 1, 0, 0.8941177, 1,
1.016591, 0.3398403, 1.922334, 1, 0, 0.8862745, 1,
1.016838, -0.7094877, 1.009081, 1, 0, 0.8823529, 1,
1.020175, 1.096899, -0.2065301, 1, 0, 0.8745098, 1,
1.02036, -1.445668, 0.931488, 1, 0, 0.8705882, 1,
1.027056, -0.328411, 1.381994, 1, 0, 0.8627451, 1,
1.027837, -1.280627, 3.090117, 1, 0, 0.8588235, 1,
1.030102, 0.2742257, 1.427566, 1, 0, 0.8509804, 1,
1.036978, -0.4606573, 2.099054, 1, 0, 0.8470588, 1,
1.038616, -1.551946, 3.449183, 1, 0, 0.8392157, 1,
1.038951, 1.081007, 0.8314939, 1, 0, 0.8352941, 1,
1.039899, 0.4428861, 2.710948, 1, 0, 0.827451, 1,
1.042968, -1.142587, 3.066078, 1, 0, 0.8235294, 1,
1.043555, 0.6544877, 1.143833, 1, 0, 0.8156863, 1,
1.044342, -0.4519225, 1.35936, 1, 0, 0.8117647, 1,
1.053325, -0.6128778, 1.166684, 1, 0, 0.8039216, 1,
1.055756, 1.196796, -1.34518, 1, 0, 0.7960784, 1,
1.062014, 0.4941793, 2.35468, 1, 0, 0.7921569, 1,
1.064313, 0.578706, 1.892639, 1, 0, 0.7843137, 1,
1.068583, 0.1292674, 1.848531, 1, 0, 0.7803922, 1,
1.072762, 1.637743, 1.707904, 1, 0, 0.772549, 1,
1.0739, 1.850014, -0.8430285, 1, 0, 0.7686275, 1,
1.076594, -1.368715, 2.577653, 1, 0, 0.7607843, 1,
1.076633, -0.3653778, 2.530756, 1, 0, 0.7568628, 1,
1.076695, 0.139301, 1.993285, 1, 0, 0.7490196, 1,
1.096567, 0.770317, 0.5713716, 1, 0, 0.7450981, 1,
1.097592, 0.06410735, -0.8828375, 1, 0, 0.7372549, 1,
1.102917, 0.5255645, 1.299376, 1, 0, 0.7333333, 1,
1.10627, 0.4405616, 0.6057297, 1, 0, 0.7254902, 1,
1.106852, -0.1269912, 1.082846, 1, 0, 0.7215686, 1,
1.108161, 0.683717, 1.261363, 1, 0, 0.7137255, 1,
1.111556, 0.5432959, 2.546105, 1, 0, 0.7098039, 1,
1.113477, 0.7834135, -0.05724874, 1, 0, 0.7019608, 1,
1.125054, -0.9962258, 2.929322, 1, 0, 0.6941177, 1,
1.130393, -0.06334471, 0.7471638, 1, 0, 0.6901961, 1,
1.136576, -0.8950064, 3.678239, 1, 0, 0.682353, 1,
1.13857, -0.7976417, 1.48676, 1, 0, 0.6784314, 1,
1.138839, -0.2683639, 3.191793, 1, 0, 0.6705883, 1,
1.149521, 0.1571197, 0.777929, 1, 0, 0.6666667, 1,
1.155943, -0.4493471, 3.788368, 1, 0, 0.6588235, 1,
1.158356, 0.01075319, -0.1151593, 1, 0, 0.654902, 1,
1.176835, -0.1401694, 1.669259, 1, 0, 0.6470588, 1,
1.177162, -0.5378889, 0.9306913, 1, 0, 0.6431373, 1,
1.180582, -0.6711165, 1.306519, 1, 0, 0.6352941, 1,
1.184214, 1.980286, 1.640287, 1, 0, 0.6313726, 1,
1.190563, 1.384001, 1.085796, 1, 0, 0.6235294, 1,
1.190998, -0.8286393, 3.755581, 1, 0, 0.6196079, 1,
1.193648, 1.472063, -0.3950089, 1, 0, 0.6117647, 1,
1.208586, 0.1373642, 2.160222, 1, 0, 0.6078432, 1,
1.20953, -0.8152058, 1.385065, 1, 0, 0.6, 1,
1.215965, -1.410346, 2.518485, 1, 0, 0.5921569, 1,
1.216437, 0.9893085, 1.706984, 1, 0, 0.5882353, 1,
1.220881, -1.811617, 3.662863, 1, 0, 0.5803922, 1,
1.222374, 0.1719579, 3.496393, 1, 0, 0.5764706, 1,
1.22731, -0.882524, 3.249049, 1, 0, 0.5686275, 1,
1.234684, 0.2867037, -0.5616463, 1, 0, 0.5647059, 1,
1.239923, -1.51108, 3.567888, 1, 0, 0.5568628, 1,
1.241747, -0.6138675, 1.17289, 1, 0, 0.5529412, 1,
1.244488, -0.2712822, 0.3218441, 1, 0, 0.5450981, 1,
1.245165, -1.831017, 3.203363, 1, 0, 0.5411765, 1,
1.254452, -1.056803, 1.886277, 1, 0, 0.5333334, 1,
1.265607, -0.3297932, 2.47658, 1, 0, 0.5294118, 1,
1.269427, 1.270429, 2.518263, 1, 0, 0.5215687, 1,
1.275092, 0.4924923, 1.865948, 1, 0, 0.5176471, 1,
1.278977, -0.4510783, 1.69583, 1, 0, 0.509804, 1,
1.302805, -1.439296, 4.443326, 1, 0, 0.5058824, 1,
1.315657, -0.1993638, 1.539499, 1, 0, 0.4980392, 1,
1.342928, -1.881426, 1.772032, 1, 0, 0.4901961, 1,
1.354355, 1.896905, 1.041846, 1, 0, 0.4862745, 1,
1.355158, -0.2963494, 2.308265, 1, 0, 0.4784314, 1,
1.369794, -0.6915745, 1.349358, 1, 0, 0.4745098, 1,
1.369945, -0.4507426, 0.6861997, 1, 0, 0.4666667, 1,
1.370797, 1.07672, 0.7314615, 1, 0, 0.4627451, 1,
1.385898, -0.1204434, 0.7361845, 1, 0, 0.454902, 1,
1.40087, -0.6945899, 1.911146, 1, 0, 0.4509804, 1,
1.406598, 1.647002, 1.536348, 1, 0, 0.4431373, 1,
1.407648, 0.4353317, -0.3382898, 1, 0, 0.4392157, 1,
1.410857, -2.803397, 2.183594, 1, 0, 0.4313726, 1,
1.412388, 0.5385227, 0.7573383, 1, 0, 0.427451, 1,
1.414253, 1.016707, 2.524385, 1, 0, 0.4196078, 1,
1.415143, 0.05711862, 0.3123987, 1, 0, 0.4156863, 1,
1.43004, -1.769444, 2.088252, 1, 0, 0.4078431, 1,
1.446519, -0.2307027, 2.28755, 1, 0, 0.4039216, 1,
1.447755, -0.009415374, 2.270289, 1, 0, 0.3960784, 1,
1.462194, -0.3211459, 2.25966, 1, 0, 0.3882353, 1,
1.468267, -0.2044375, 3.143296, 1, 0, 0.3843137, 1,
1.486217, 1.376775, 1.187066, 1, 0, 0.3764706, 1,
1.4874, 1.088977, -0.4674598, 1, 0, 0.372549, 1,
1.493071, -0.7426752, 2.041614, 1, 0, 0.3647059, 1,
1.500983, 0.4191505, -0.8618219, 1, 0, 0.3607843, 1,
1.51808, -0.09764037, 2.262602, 1, 0, 0.3529412, 1,
1.520886, -0.1187213, 1.377847, 1, 0, 0.3490196, 1,
1.536418, 0.2229621, 0.861235, 1, 0, 0.3411765, 1,
1.550221, 0.06202818, 0.07509071, 1, 0, 0.3372549, 1,
1.55935, -0.04859274, 0.8563268, 1, 0, 0.3294118, 1,
1.561737, 0.9618679, 0.8719672, 1, 0, 0.3254902, 1,
1.570147, -1.315275, 3.474525, 1, 0, 0.3176471, 1,
1.586351, -0.05962279, 2.153299, 1, 0, 0.3137255, 1,
1.586394, -0.08412506, 0.01382519, 1, 0, 0.3058824, 1,
1.591294, -0.9660503, 3.600055, 1, 0, 0.2980392, 1,
1.612805, -0.1309486, 3.582146, 1, 0, 0.2941177, 1,
1.626884, -1.093999, 2.889451, 1, 0, 0.2862745, 1,
1.634755, -0.02389977, 3.669187, 1, 0, 0.282353, 1,
1.640744, -0.8177716, 3.529454, 1, 0, 0.2745098, 1,
1.669142, 1.066354, 1.3599, 1, 0, 0.2705882, 1,
1.715683, 0.5834708, 1.059777, 1, 0, 0.2627451, 1,
1.718717, -1.683092, 1.39021, 1, 0, 0.2588235, 1,
1.719473, 1.941481, 0.2141562, 1, 0, 0.2509804, 1,
1.727209, -0.8066496, 1.597757, 1, 0, 0.2470588, 1,
1.753404, -0.6750832, 2.428096, 1, 0, 0.2392157, 1,
1.756073, -0.09684303, 1.413011, 1, 0, 0.2352941, 1,
1.764035, -0.3622261, 2.174404, 1, 0, 0.227451, 1,
1.76497, -1.65921, 1.516911, 1, 0, 0.2235294, 1,
1.776055, -0.1815327, 1.40839, 1, 0, 0.2156863, 1,
1.819752, 0.7784036, 0.9536402, 1, 0, 0.2117647, 1,
1.821529, -0.0568895, 0.6074348, 1, 0, 0.2039216, 1,
1.837144, 0.431611, 2.908852, 1, 0, 0.1960784, 1,
1.844059, -0.7720803, 2.380495, 1, 0, 0.1921569, 1,
1.887175, -0.1597205, 1.30552, 1, 0, 0.1843137, 1,
1.901047, 0.6291234, 0.2199664, 1, 0, 0.1803922, 1,
1.92502, 0.8026147, 1.913582, 1, 0, 0.172549, 1,
1.947051, 0.1636256, 0.3547377, 1, 0, 0.1686275, 1,
1.950706, 0.6196328, 1.767851, 1, 0, 0.1607843, 1,
1.991169, 0.9519873, 1.314855, 1, 0, 0.1568628, 1,
1.992949, 0.3643091, 1.830675, 1, 0, 0.1490196, 1,
2.021599, 0.8634886, -0.2012309, 1, 0, 0.145098, 1,
2.07417, -0.4069297, 1.947657, 1, 0, 0.1372549, 1,
2.103328, -0.3314471, 2.408964, 1, 0, 0.1333333, 1,
2.105748, 0.8609076, 1.098603, 1, 0, 0.1254902, 1,
2.10756, 0.2665829, 2.443238, 1, 0, 0.1215686, 1,
2.132615, -0.4554115, 1.029346, 1, 0, 0.1137255, 1,
2.171751, -0.3330559, 2.15766, 1, 0, 0.1098039, 1,
2.201504, -0.3442387, 3.312352, 1, 0, 0.1019608, 1,
2.235719, -0.7799109, -2.027416, 1, 0, 0.09411765, 1,
2.287506, -1.704625, 0.8725739, 1, 0, 0.09019608, 1,
2.356236, -0.3377834, 0.1275055, 1, 0, 0.08235294, 1,
2.410879, -0.1631156, 3.645132, 1, 0, 0.07843138, 1,
2.423063, -0.170635, 1.098767, 1, 0, 0.07058824, 1,
2.429095, -0.2499965, 2.114856, 1, 0, 0.06666667, 1,
2.438604, -0.06358633, 1.181074, 1, 0, 0.05882353, 1,
2.458921, 1.159432, 2.660483, 1, 0, 0.05490196, 1,
2.547561, 0.3754374, 2.495439, 1, 0, 0.04705882, 1,
2.579887, 0.6207149, 2.641197, 1, 0, 0.04313726, 1,
2.642763, 2.329909, 0.06518718, 1, 0, 0.03529412, 1,
2.705917, -0.6760324, 1.804815, 1, 0, 0.03137255, 1,
2.79843, 0.5583667, 1.555633, 1, 0, 0.02352941, 1,
3.011803, -0.6053416, 0.8413137, 1, 0, 0.01960784, 1,
3.063811, -1.105355, 3.278419, 1, 0, 0.01176471, 1,
4.135237, 0.6563514, 1.637896, 1, 0, 0.007843138, 1
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
0.5595202, -3.950628, -7.000577, 0, -0.5, 0.5, 0.5,
0.5595202, -3.950628, -7.000577, 1, -0.5, 0.5, 0.5,
0.5595202, -3.950628, -7.000577, 1, 1.5, 0.5, 0.5,
0.5595202, -3.950628, -7.000577, 0, 1.5, 0.5, 0.5
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
-4.228364, -0.1098007, -7.000577, 0, -0.5, 0.5, 0.5,
-4.228364, -0.1098007, -7.000577, 1, -0.5, 0.5, 0.5,
-4.228364, -0.1098007, -7.000577, 1, 1.5, 0.5, 0.5,
-4.228364, -0.1098007, -7.000577, 0, 1.5, 0.5, 0.5
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
-4.228364, -3.950628, 0.01845217, 0, -0.5, 0.5, 0.5,
-4.228364, -3.950628, 0.01845217, 1, -0.5, 0.5, 0.5,
-4.228364, -3.950628, 0.01845217, 1, 1.5, 0.5, 0.5,
-4.228364, -3.950628, 0.01845217, 0, 1.5, 0.5, 0.5
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
-2, -3.064283, -5.380802,
4, -3.064283, -5.380802,
-2, -3.064283, -5.380802,
-2, -3.212008, -5.650764,
0, -3.064283, -5.380802,
0, -3.212008, -5.650764,
2, -3.064283, -5.380802,
2, -3.212008, -5.650764,
4, -3.064283, -5.380802,
4, -3.212008, -5.650764
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
-2, -3.507456, -6.19069, 0, -0.5, 0.5, 0.5,
-2, -3.507456, -6.19069, 1, -0.5, 0.5, 0.5,
-2, -3.507456, -6.19069, 1, 1.5, 0.5, 0.5,
-2, -3.507456, -6.19069, 0, 1.5, 0.5, 0.5,
0, -3.507456, -6.19069, 0, -0.5, 0.5, 0.5,
0, -3.507456, -6.19069, 1, -0.5, 0.5, 0.5,
0, -3.507456, -6.19069, 1, 1.5, 0.5, 0.5,
0, -3.507456, -6.19069, 0, 1.5, 0.5, 0.5,
2, -3.507456, -6.19069, 0, -0.5, 0.5, 0.5,
2, -3.507456, -6.19069, 1, -0.5, 0.5, 0.5,
2, -3.507456, -6.19069, 1, 1.5, 0.5, 0.5,
2, -3.507456, -6.19069, 0, 1.5, 0.5, 0.5,
4, -3.507456, -6.19069, 0, -0.5, 0.5, 0.5,
4, -3.507456, -6.19069, 1, -0.5, 0.5, 0.5,
4, -3.507456, -6.19069, 1, 1.5, 0.5, 0.5,
4, -3.507456, -6.19069, 0, 1.5, 0.5, 0.5
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
-3.123468, -2, -5.380802,
-3.123468, 2, -5.380802,
-3.123468, -2, -5.380802,
-3.307617, -2, -5.650764,
-3.123468, -1, -5.380802,
-3.307617, -1, -5.650764,
-3.123468, 0, -5.380802,
-3.307617, 0, -5.650764,
-3.123468, 1, -5.380802,
-3.307617, 1, -5.650764,
-3.123468, 2, -5.380802,
-3.307617, 2, -5.650764
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
-3.675916, -2, -6.19069, 0, -0.5, 0.5, 0.5,
-3.675916, -2, -6.19069, 1, -0.5, 0.5, 0.5,
-3.675916, -2, -6.19069, 1, 1.5, 0.5, 0.5,
-3.675916, -2, -6.19069, 0, 1.5, 0.5, 0.5,
-3.675916, -1, -6.19069, 0, -0.5, 0.5, 0.5,
-3.675916, -1, -6.19069, 1, -0.5, 0.5, 0.5,
-3.675916, -1, -6.19069, 1, 1.5, 0.5, 0.5,
-3.675916, -1, -6.19069, 0, 1.5, 0.5, 0.5,
-3.675916, 0, -6.19069, 0, -0.5, 0.5, 0.5,
-3.675916, 0, -6.19069, 1, -0.5, 0.5, 0.5,
-3.675916, 0, -6.19069, 1, 1.5, 0.5, 0.5,
-3.675916, 0, -6.19069, 0, 1.5, 0.5, 0.5,
-3.675916, 1, -6.19069, 0, -0.5, 0.5, 0.5,
-3.675916, 1, -6.19069, 1, -0.5, 0.5, 0.5,
-3.675916, 1, -6.19069, 1, 1.5, 0.5, 0.5,
-3.675916, 1, -6.19069, 0, 1.5, 0.5, 0.5,
-3.675916, 2, -6.19069, 0, -0.5, 0.5, 0.5,
-3.675916, 2, -6.19069, 1, -0.5, 0.5, 0.5,
-3.675916, 2, -6.19069, 1, 1.5, 0.5, 0.5,
-3.675916, 2, -6.19069, 0, 1.5, 0.5, 0.5
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
-3.123468, -3.064283, -4,
-3.123468, -3.064283, 4,
-3.123468, -3.064283, -4,
-3.307617, -3.212008, -4,
-3.123468, -3.064283, -2,
-3.307617, -3.212008, -2,
-3.123468, -3.064283, 0,
-3.307617, -3.212008, 0,
-3.123468, -3.064283, 2,
-3.307617, -3.212008, 2,
-3.123468, -3.064283, 4,
-3.307617, -3.212008, 4
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
-3.675916, -3.507456, -4, 0, -0.5, 0.5, 0.5,
-3.675916, -3.507456, -4, 1, -0.5, 0.5, 0.5,
-3.675916, -3.507456, -4, 1, 1.5, 0.5, 0.5,
-3.675916, -3.507456, -4, 0, 1.5, 0.5, 0.5,
-3.675916, -3.507456, -2, 0, -0.5, 0.5, 0.5,
-3.675916, -3.507456, -2, 1, -0.5, 0.5, 0.5,
-3.675916, -3.507456, -2, 1, 1.5, 0.5, 0.5,
-3.675916, -3.507456, -2, 0, 1.5, 0.5, 0.5,
-3.675916, -3.507456, 0, 0, -0.5, 0.5, 0.5,
-3.675916, -3.507456, 0, 1, -0.5, 0.5, 0.5,
-3.675916, -3.507456, 0, 1, 1.5, 0.5, 0.5,
-3.675916, -3.507456, 0, 0, 1.5, 0.5, 0.5,
-3.675916, -3.507456, 2, 0, -0.5, 0.5, 0.5,
-3.675916, -3.507456, 2, 1, -0.5, 0.5, 0.5,
-3.675916, -3.507456, 2, 1, 1.5, 0.5, 0.5,
-3.675916, -3.507456, 2, 0, 1.5, 0.5, 0.5,
-3.675916, -3.507456, 4, 0, -0.5, 0.5, 0.5,
-3.675916, -3.507456, 4, 1, -0.5, 0.5, 0.5,
-3.675916, -3.507456, 4, 1, 1.5, 0.5, 0.5,
-3.675916, -3.507456, 4, 0, 1.5, 0.5, 0.5
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
-3.123468, -3.064283, -5.380802,
-3.123468, 2.844682, -5.380802,
-3.123468, -3.064283, 5.417706,
-3.123468, 2.844682, 5.417706,
-3.123468, -3.064283, -5.380802,
-3.123468, -3.064283, 5.417706,
-3.123468, 2.844682, -5.380802,
-3.123468, 2.844682, 5.417706,
-3.123468, -3.064283, -5.380802,
4.242508, -3.064283, -5.380802,
-3.123468, -3.064283, 5.417706,
4.242508, -3.064283, 5.417706,
-3.123468, 2.844682, -5.380802,
4.242508, 2.844682, -5.380802,
-3.123468, 2.844682, 5.417706,
4.242508, 2.844682, 5.417706,
4.242508, -3.064283, -5.380802,
4.242508, 2.844682, -5.380802,
4.242508, -3.064283, 5.417706,
4.242508, 2.844682, 5.417706,
4.242508, -3.064283, -5.380802,
4.242508, -3.064283, 5.417706,
4.242508, 2.844682, -5.380802,
4.242508, 2.844682, 5.417706
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
var radius = 7.659993;
var distance = 34.08017;
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
mvMatrix.translate( -0.5595202, 0.1098007, -0.01845217 );
mvMatrix.scale( 1.124377, 1.401622, 0.7669703 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.08017);
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
ethoxycarbonylmethyl<-read.table("ethoxycarbonylmethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethoxycarbonylmethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylmethyl' not found
```

```r
y<-ethoxycarbonylmethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylmethyl' not found
```

```r
z<-ethoxycarbonylmethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylmethyl' not found
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
-3.016196, 0.8302398, -1.466471, 0, 0, 1, 1, 1,
-2.857151, 0.3014415, -2.243329, 1, 0, 0, 1, 1,
-2.796695, 0.8743864, -2.18739, 1, 0, 0, 1, 1,
-2.675009, -0.5462991, -0.5926487, 1, 0, 0, 1, 1,
-2.657623, -1.12181, -1.243734, 1, 0, 0, 1, 1,
-2.636048, -0.5336372, -3.158509, 1, 0, 0, 1, 1,
-2.606882, 0.3986679, -0.06586897, 0, 0, 0, 1, 1,
-2.555807, 0.5612527, 0.2274435, 0, 0, 0, 1, 1,
-2.552402, 0.4714081, -1.794791, 0, 0, 0, 1, 1,
-2.465716, -1.219365, -1.620976, 0, 0, 0, 1, 1,
-2.400841, 0.2605863, -3.021641, 0, 0, 0, 1, 1,
-2.395739, 0.5454389, 0.3091699, 0, 0, 0, 1, 1,
-2.341891, 0.2903322, -2.002383, 0, 0, 0, 1, 1,
-2.312295, 2.185241, -0.6847275, 1, 1, 1, 1, 1,
-2.306767, -0.6177455, -2.452609, 1, 1, 1, 1, 1,
-2.294004, -1.030973, -1.601141, 1, 1, 1, 1, 1,
-2.265563, -0.4338563, -2.735895, 1, 1, 1, 1, 1,
-2.262805, 0.7810065, -1.195343, 1, 1, 1, 1, 1,
-2.220842, 1.210828, -3.155966, 1, 1, 1, 1, 1,
-2.169802, -0.1871701, -2.18887, 1, 1, 1, 1, 1,
-2.119957, -0.6464254, -0.6779811, 1, 1, 1, 1, 1,
-2.109525, 2.493966, 2.731698, 1, 1, 1, 1, 1,
-2.068564, -0.21866, -1.659523, 1, 1, 1, 1, 1,
-2.066998, 0.5467412, -0.5890658, 1, 1, 1, 1, 1,
-2.055583, -0.9327327, -2.152787, 1, 1, 1, 1, 1,
-2.0484, 0.9331114, -0.6481776, 1, 1, 1, 1, 1,
-1.996351, 0.389773, -3.554609, 1, 1, 1, 1, 1,
-1.981889, -0.7963132, -2.111713, 1, 1, 1, 1, 1,
-1.976148, 0.1316436, -2.784378, 0, 0, 1, 1, 1,
-1.952885, -0.7881685, -2.869574, 1, 0, 0, 1, 1,
-1.948899, 0.07931395, -1.421133, 1, 0, 0, 1, 1,
-1.923724, 0.01494212, -0.7608997, 1, 0, 0, 1, 1,
-1.905216, -1.112299, -1.566512, 1, 0, 0, 1, 1,
-1.893084, -1.488047, -4.017249, 1, 0, 0, 1, 1,
-1.885549, 0.7674766, -1.169408, 0, 0, 0, 1, 1,
-1.879765, 0.9312434, -1.055126, 0, 0, 0, 1, 1,
-1.859364, 0.9014856, 0.125767, 0, 0, 0, 1, 1,
-1.835721, -0.7558104, -0.3258013, 0, 0, 0, 1, 1,
-1.829842, 0.1960216, -2.051202, 0, 0, 0, 1, 1,
-1.816272, 0.2144739, -2.75268, 0, 0, 0, 1, 1,
-1.790182, -0.5582056, -1.825387, 0, 0, 0, 1, 1,
-1.77835, -1.508858, -3.774072, 1, 1, 1, 1, 1,
-1.772757, -0.6484427, -1.25585, 1, 1, 1, 1, 1,
-1.759594, -0.6862042, -2.099614, 1, 1, 1, 1, 1,
-1.745429, 0.08909217, -0.8532825, 1, 1, 1, 1, 1,
-1.735898, -1.938732, -1.667056, 1, 1, 1, 1, 1,
-1.729231, 0.6224697, -0.7665199, 1, 1, 1, 1, 1,
-1.721405, -0.349622, -3.872406, 1, 1, 1, 1, 1,
-1.720747, 0.1236418, -2.215531, 1, 1, 1, 1, 1,
-1.720461, 0.1855615, -1.373159, 1, 1, 1, 1, 1,
-1.717133, 1.853205, -0.9782426, 1, 1, 1, 1, 1,
-1.70709, -0.8921655, -0.4399202, 1, 1, 1, 1, 1,
-1.698833, 0.670532, -1.23036, 1, 1, 1, 1, 1,
-1.693734, -0.4535415, -1.20382, 1, 1, 1, 1, 1,
-1.689647, -0.6171992, -0.3973109, 1, 1, 1, 1, 1,
-1.685479, 0.5303374, -1.374369, 1, 1, 1, 1, 1,
-1.667423, -1.085296, -0.8589553, 0, 0, 1, 1, 1,
-1.66461, 1.436566, -2.041828, 1, 0, 0, 1, 1,
-1.650236, 0.2125495, -2.453438, 1, 0, 0, 1, 1,
-1.647636, 0.9831637, -3.189137, 1, 0, 0, 1, 1,
-1.631962, 0.7388345, -2.83252, 1, 0, 0, 1, 1,
-1.611355, -0.3216322, -2.963149, 1, 0, 0, 1, 1,
-1.609845, -0.1975, -0.8604304, 0, 0, 0, 1, 1,
-1.604955, 0.6685144, -1.322188, 0, 0, 0, 1, 1,
-1.602994, -1.845876, -1.662704, 0, 0, 0, 1, 1,
-1.595904, -1.639278, -1.738013, 0, 0, 0, 1, 1,
-1.581499, -2.08199, -2.046721, 0, 0, 0, 1, 1,
-1.580374, -0.9057695, -3.314882, 0, 0, 0, 1, 1,
-1.570494, 0.6064405, -0.2597623, 0, 0, 0, 1, 1,
-1.555104, 0.6821261, 0.00913118, 1, 1, 1, 1, 1,
-1.550295, -1.062437, -2.403778, 1, 1, 1, 1, 1,
-1.548321, -0.8875322, -2.464011, 1, 1, 1, 1, 1,
-1.537502, -0.5372093, -3.507288, 1, 1, 1, 1, 1,
-1.534329, 0.4318527, -0.5756682, 1, 1, 1, 1, 1,
-1.53166, 0.5014932, 0.1140221, 1, 1, 1, 1, 1,
-1.53078, -0.5841291, -2.376325, 1, 1, 1, 1, 1,
-1.530222, 0.2422389, -2.956571, 1, 1, 1, 1, 1,
-1.523528, 1.181194, 0.3763945, 1, 1, 1, 1, 1,
-1.512765, 0.221969, -2.569458, 1, 1, 1, 1, 1,
-1.509084, 0.2336103, -2.097147, 1, 1, 1, 1, 1,
-1.491554, 2.491541, 0.2389128, 1, 1, 1, 1, 1,
-1.487548, 0.2203486, -2.088179, 1, 1, 1, 1, 1,
-1.481109, 1.403768, -0.5271316, 1, 1, 1, 1, 1,
-1.466214, -1.442991, -2.855975, 1, 1, 1, 1, 1,
-1.46606, -0.09291916, 0.250154, 0, 0, 1, 1, 1,
-1.464908, 0.8298234, -1.682729, 1, 0, 0, 1, 1,
-1.454368, -2.156777, -0.5883479, 1, 0, 0, 1, 1,
-1.43759, -0.6942717, -2.039147, 1, 0, 0, 1, 1,
-1.435872, 1.027668, 1.037184, 1, 0, 0, 1, 1,
-1.434304, -1.164831, -1.731734, 1, 0, 0, 1, 1,
-1.428121, 1.653966, -0.9203638, 0, 0, 0, 1, 1,
-1.401617, 1.706461, -1.455077, 0, 0, 0, 1, 1,
-1.397844, -0.4661355, -1.073117, 0, 0, 0, 1, 1,
-1.397598, 0.2865276, -0.2314772, 0, 0, 0, 1, 1,
-1.395859, -2.2228, -3.289132, 0, 0, 0, 1, 1,
-1.391534, -0.8058816, -3.669085, 0, 0, 0, 1, 1,
-1.376523, -2.38397, -2.936795, 0, 0, 0, 1, 1,
-1.376509, -0.2262542, -0.6905047, 1, 1, 1, 1, 1,
-1.366734, 0.02872264, -0.5732605, 1, 1, 1, 1, 1,
-1.365573, 0.03629812, 0.009363675, 1, 1, 1, 1, 1,
-1.352737, -0.2272295, -1.133422, 1, 1, 1, 1, 1,
-1.334521, -0.4497716, -1.482623, 1, 1, 1, 1, 1,
-1.333379, -0.7145338, -1.254803, 1, 1, 1, 1, 1,
-1.325265, 0.1031226, -2.885831, 1, 1, 1, 1, 1,
-1.325052, -1.036671, -3.0151, 1, 1, 1, 1, 1,
-1.324791, -0.1404368, -0.86946, 1, 1, 1, 1, 1,
-1.324556, 1.573232, -1.233125, 1, 1, 1, 1, 1,
-1.315503, 1.478577, -3.156981, 1, 1, 1, 1, 1,
-1.314501, 1.699314, 0.9869773, 1, 1, 1, 1, 1,
-1.311335, -1.100118, -1.449591, 1, 1, 1, 1, 1,
-1.30933, -0.486653, -1.821359, 1, 1, 1, 1, 1,
-1.309088, -0.2754601, -1.222329, 1, 1, 1, 1, 1,
-1.302668, 0.5320942, -1.013218, 0, 0, 1, 1, 1,
-1.300169, -0.3270296, -1.979151, 1, 0, 0, 1, 1,
-1.298699, 1.613257, 0.2130641, 1, 0, 0, 1, 1,
-1.297978, -0.6803731, -2.76468, 1, 0, 0, 1, 1,
-1.287157, -0.2841398, -1.631331, 1, 0, 0, 1, 1,
-1.285606, -1.23285, -2.039811, 1, 0, 0, 1, 1,
-1.282457, 0.1032523, -2.635484, 0, 0, 0, 1, 1,
-1.281084, -0.2615968, -1.447469, 0, 0, 0, 1, 1,
-1.273992, 0.8877975, -0.05648318, 0, 0, 0, 1, 1,
-1.265679, -0.2748528, -0.08805621, 0, 0, 0, 1, 1,
-1.263039, -0.1390071, -0.3805639, 0, 0, 0, 1, 1,
-1.261758, -1.799646, -4.806251, 0, 0, 0, 1, 1,
-1.254705, -0.5904472, -2.633487, 0, 0, 0, 1, 1,
-1.219892, -0.5263958, -1.345154, 1, 1, 1, 1, 1,
-1.215803, -0.5663114, -2.052607, 1, 1, 1, 1, 1,
-1.21543, 1.718177, -2.12479, 1, 1, 1, 1, 1,
-1.210872, -0.7677891, -3.522561, 1, 1, 1, 1, 1,
-1.205295, 0.7468691, -0.3597471, 1, 1, 1, 1, 1,
-1.19682, -0.3212527, -2.856118, 1, 1, 1, 1, 1,
-1.194796, 2.137157, 1.716933, 1, 1, 1, 1, 1,
-1.194615, -0.6591716, -2.011722, 1, 1, 1, 1, 1,
-1.190536, -0.1445349, -0.7185912, 1, 1, 1, 1, 1,
-1.184465, 0.5324568, -2.414767, 1, 1, 1, 1, 1,
-1.181795, -0.09719312, -3.149147, 1, 1, 1, 1, 1,
-1.170553, -0.492481, -2.946033, 1, 1, 1, 1, 1,
-1.1682, -1.524796, -2.729617, 1, 1, 1, 1, 1,
-1.163711, 0.5581616, -0.4370978, 1, 1, 1, 1, 1,
-1.161812, -1.331566, -0.417034, 1, 1, 1, 1, 1,
-1.152005, -0.89165, -2.642824, 0, 0, 1, 1, 1,
-1.150558, -0.8265323, -1.582333, 1, 0, 0, 1, 1,
-1.146573, 0.8778241, -0.4054826, 1, 0, 0, 1, 1,
-1.13402, -0.1095397, -1.357438, 1, 0, 0, 1, 1,
-1.133416, -1.137781, -2.301044, 1, 0, 0, 1, 1,
-1.120921, -0.6503111, -2.842156, 1, 0, 0, 1, 1,
-1.118254, 0.9084697, 0.8207917, 0, 0, 0, 1, 1,
-1.107004, 0.6793796, -1.187859, 0, 0, 0, 1, 1,
-1.10559, -1.034927, -2.738567, 0, 0, 0, 1, 1,
-1.100224, 0.7092792, 0.8847522, 0, 0, 0, 1, 1,
-1.094328, -0.6440223, -0.340223, 0, 0, 0, 1, 1,
-1.093759, 0.5608697, -1.211885, 0, 0, 0, 1, 1,
-1.086922, -0.2315884, -1.506387, 0, 0, 0, 1, 1,
-1.081394, -0.3665857, -3.977658, 1, 1, 1, 1, 1,
-1.069944, 1.964843, -1.129398, 1, 1, 1, 1, 1,
-1.069532, 0.6231192, -1.228687, 1, 1, 1, 1, 1,
-1.0645, -0.2456947, -3.092915, 1, 1, 1, 1, 1,
-1.047959, -0.2750013, -2.153663, 1, 1, 1, 1, 1,
-1.040925, 0.4535377, 0.4505092, 1, 1, 1, 1, 1,
-1.038618, 0.3470896, -2.19649, 1, 1, 1, 1, 1,
-1.030394, -0.9408003, -3.72832, 1, 1, 1, 1, 1,
-1.022305, -1.036284, -3.737228, 1, 1, 1, 1, 1,
-1.018924, 0.5950397, -1.158027, 1, 1, 1, 1, 1,
-1.018454, 2.175633, 0.2134644, 1, 1, 1, 1, 1,
-1.011832, -1.012397, -2.949497, 1, 1, 1, 1, 1,
-1.010309, -0.4856769, -0.8857455, 1, 1, 1, 1, 1,
-1.009152, 1.195787, 0.2902872, 1, 1, 1, 1, 1,
-1.004527, -0.5427365, -1.470031, 1, 1, 1, 1, 1,
-1.000286, -0.1509728, -1.210465, 0, 0, 1, 1, 1,
-1.00019, -0.005495558, -0.1803715, 1, 0, 0, 1, 1,
-0.9890339, -0.7342815, -3.280777, 1, 0, 0, 1, 1,
-0.9753094, 0.4846261, -1.921007, 1, 0, 0, 1, 1,
-0.9707413, -1.177961, -1.247121, 1, 0, 0, 1, 1,
-0.9704145, 0.9471417, -2.208493, 1, 0, 0, 1, 1,
-0.9683885, 1.234307, 1.011358, 0, 0, 0, 1, 1,
-0.9670504, 0.4640455, -3.275124, 0, 0, 0, 1, 1,
-0.9665402, 2.701967, 0.125, 0, 0, 0, 1, 1,
-0.9542152, -0.6788014, -2.601498, 0, 0, 0, 1, 1,
-0.9492827, -0.9385782, -2.184933, 0, 0, 0, 1, 1,
-0.9474649, 0.6602577, -0.4927762, 0, 0, 0, 1, 1,
-0.9468657, -0.338882, -2.792815, 0, 0, 0, 1, 1,
-0.9386368, 0.2943697, -1.21328, 1, 1, 1, 1, 1,
-0.9330102, 0.8151853, -0.9628018, 1, 1, 1, 1, 1,
-0.9243327, -0.353228, -3.553584, 1, 1, 1, 1, 1,
-0.923343, 0.6383132, -2.04895, 1, 1, 1, 1, 1,
-0.9168168, -1.256561, -2.513529, 1, 1, 1, 1, 1,
-0.9114773, -1.694854, -2.906863, 1, 1, 1, 1, 1,
-0.9106081, 1.135774, -0.7637103, 1, 1, 1, 1, 1,
-0.9079676, 0.6888732, -1.577037, 1, 1, 1, 1, 1,
-0.905626, -1.992567, -1.165896, 1, 1, 1, 1, 1,
-0.9054389, -0.7874133, -0.7608605, 1, 1, 1, 1, 1,
-0.9031365, -0.6750915, -2.1103, 1, 1, 1, 1, 1,
-0.9029176, 0.2654394, -2.235246, 1, 1, 1, 1, 1,
-0.9019148, -0.5948492, -1.832659, 1, 1, 1, 1, 1,
-0.8947071, -0.2796075, -2.891349, 1, 1, 1, 1, 1,
-0.8913509, 0.9849312, -0.5941558, 1, 1, 1, 1, 1,
-0.8870819, -0.2440074, -1.443435, 0, 0, 1, 1, 1,
-0.8856612, -0.3523135, -2.177109, 1, 0, 0, 1, 1,
-0.8799638, 0.5941676, -3.58595, 1, 0, 0, 1, 1,
-0.878733, 0.8201016, -0.6157882, 1, 0, 0, 1, 1,
-0.8717755, -0.1531153, -2.443004, 1, 0, 0, 1, 1,
-0.8675145, -0.8938516, -2.662212, 1, 0, 0, 1, 1,
-0.8672038, 0.4452657, -2.20563, 0, 0, 0, 1, 1,
-0.8661266, 0.7107145, -1.050486, 0, 0, 0, 1, 1,
-0.8655974, 0.4790964, -0.3626735, 0, 0, 0, 1, 1,
-0.8643857, 0.05602049, -1.486222, 0, 0, 0, 1, 1,
-0.8634023, -0.007143461, -2.740853, 0, 0, 0, 1, 1,
-0.8631853, -0.870577, -1.467098, 0, 0, 0, 1, 1,
-0.8615472, 0.8695588, -1.832197, 0, 0, 0, 1, 1,
-0.8568046, -0.749191, -2.681214, 1, 1, 1, 1, 1,
-0.8528988, 0.6298533, -0.03653985, 1, 1, 1, 1, 1,
-0.8509746, 1.284331, -1.358809, 1, 1, 1, 1, 1,
-0.849705, 0.4172385, -0.314113, 1, 1, 1, 1, 1,
-0.8447847, 1.335718, -1.59957, 1, 1, 1, 1, 1,
-0.8438737, -1.571357, -1.982489, 1, 1, 1, 1, 1,
-0.8368073, 0.9356825, -2.128093, 1, 1, 1, 1, 1,
-0.8315082, 1.323, -0.670765, 1, 1, 1, 1, 1,
-0.8311768, -0.6106223, -0.9050304, 1, 1, 1, 1, 1,
-0.8299749, -0.8748754, -3.619215, 1, 1, 1, 1, 1,
-0.8203419, -0.4709541, -2.155998, 1, 1, 1, 1, 1,
-0.8135055, 0.7299812, -0.3433834, 1, 1, 1, 1, 1,
-0.8010682, -1.829504, -3.955501, 1, 1, 1, 1, 1,
-0.7934027, 0.2610385, -1.548929, 1, 1, 1, 1, 1,
-0.7915281, 0.5682105, -0.5978187, 1, 1, 1, 1, 1,
-0.7909792, -0.6394263, -0.7795478, 0, 0, 1, 1, 1,
-0.7884564, 0.493185, -0.4037575, 1, 0, 0, 1, 1,
-0.7770672, -0.02703417, -1.642948, 1, 0, 0, 1, 1,
-0.7739061, 1.186076, -1.147716, 1, 0, 0, 1, 1,
-0.7720422, -1.784222, -2.841043, 1, 0, 0, 1, 1,
-0.76888, 1.15859, -0.3398958, 1, 0, 0, 1, 1,
-0.7672837, -1.24319, -2.191064, 0, 0, 0, 1, 1,
-0.7672035, -0.2590855, -2.176949, 0, 0, 0, 1, 1,
-0.7663947, 1.004797, -2.308614, 0, 0, 0, 1, 1,
-0.7569776, 0.6542568, -0.282228, 0, 0, 0, 1, 1,
-0.7515982, -1.149572, -0.6831455, 0, 0, 0, 1, 1,
-0.739141, 0.7182741, -1.155212, 0, 0, 0, 1, 1,
-0.7362521, 0.9647608, 1.952862, 0, 0, 0, 1, 1,
-0.7318971, 1.234825, -0.2699919, 1, 1, 1, 1, 1,
-0.7299767, 0.7254193, -0.463147, 1, 1, 1, 1, 1,
-0.7219337, 0.5464596, -2.668581, 1, 1, 1, 1, 1,
-0.7209712, -1.656479, -1.997137, 1, 1, 1, 1, 1,
-0.7166111, -0.2188816, -2.134982, 1, 1, 1, 1, 1,
-0.7157143, -0.5081713, -4.076175, 1, 1, 1, 1, 1,
-0.7123882, 0.1702503, -1.194082, 1, 1, 1, 1, 1,
-0.7095531, 1.469058, 1.266863, 1, 1, 1, 1, 1,
-0.7080702, -1.0077, -2.627738, 1, 1, 1, 1, 1,
-0.7019528, -0.8769599, -3.234222, 1, 1, 1, 1, 1,
-0.70113, -0.963207, -2.814187, 1, 1, 1, 1, 1,
-0.6994011, -0.9026461, -2.431021, 1, 1, 1, 1, 1,
-0.6991207, -1.073262, -2.724716, 1, 1, 1, 1, 1,
-0.6976215, -0.679585, -1.598042, 1, 1, 1, 1, 1,
-0.6954603, -0.87498, -0.9126959, 1, 1, 1, 1, 1,
-0.6931206, -1.687375, -2.276721, 0, 0, 1, 1, 1,
-0.6924639, 0.8062772, -0.9912453, 1, 0, 0, 1, 1,
-0.6922288, 0.4533803, -1.150269, 1, 0, 0, 1, 1,
-0.6874264, -0.7138517, -2.346086, 1, 0, 0, 1, 1,
-0.6865181, 0.4178163, -0.3379788, 1, 0, 0, 1, 1,
-0.6804496, 0.1775866, -0.9600237, 1, 0, 0, 1, 1,
-0.6747624, -0.6559978, -1.562786, 0, 0, 0, 1, 1,
-0.6696896, 1.572704, -0.4831876, 0, 0, 0, 1, 1,
-0.6686647, 0.4118568, -1.779643, 0, 0, 0, 1, 1,
-0.6632515, -0.6386716, -0.8511015, 0, 0, 0, 1, 1,
-0.6603814, 0.614948, -0.7711169, 0, 0, 0, 1, 1,
-0.6588703, 0.2387306, -1.956195, 0, 0, 0, 1, 1,
-0.6587859, 0.6083125, 0.1559641, 0, 0, 0, 1, 1,
-0.6577376, -0.7293243, -0.2067746, 1, 1, 1, 1, 1,
-0.6509629, -1.796382, -2.291128, 1, 1, 1, 1, 1,
-0.6495379, 1.771513, -0.8683032, 1, 1, 1, 1, 1,
-0.6476171, 0.2032942, -0.8794516, 1, 1, 1, 1, 1,
-0.6468595, 1.115193, 0.08071093, 1, 1, 1, 1, 1,
-0.6463837, -1.844394, -2.034027, 1, 1, 1, 1, 1,
-0.6436683, -1.209875, -2.708439, 1, 1, 1, 1, 1,
-0.6434165, -1.359691, -4.308261, 1, 1, 1, 1, 1,
-0.6371062, 0.410337, -1.738058, 1, 1, 1, 1, 1,
-0.6318871, 0.602344, -1.596464, 1, 1, 1, 1, 1,
-0.6307493, -2.101825, -3.352546, 1, 1, 1, 1, 1,
-0.6286884, -0.2333646, -1.979011, 1, 1, 1, 1, 1,
-0.6266836, -1.002414, -1.962658, 1, 1, 1, 1, 1,
-0.6227803, -0.4028596, -4.295743, 1, 1, 1, 1, 1,
-0.6216188, -1.180091, -2.601636, 1, 1, 1, 1, 1,
-0.6215453, -0.3063498, -1.399229, 0, 0, 1, 1, 1,
-0.6202443, -0.3892271, -2.150666, 1, 0, 0, 1, 1,
-0.6194224, -0.006265491, -1.539851, 1, 0, 0, 1, 1,
-0.6158155, -0.385163, -1.028704, 1, 0, 0, 1, 1,
-0.6154935, 0.03630539, -1.551132, 1, 0, 0, 1, 1,
-0.6069857, -0.7865552, -1.576351, 1, 0, 0, 1, 1,
-0.6045935, -0.7167977, -2.586835, 0, 0, 0, 1, 1,
-0.6025568, 0.5351183, -1.33621, 0, 0, 0, 1, 1,
-0.5982147, 1.338956, -1.019571, 0, 0, 0, 1, 1,
-0.5937028, 1.975649, -1.707465, 0, 0, 0, 1, 1,
-0.5931835, -1.456891, -3.09621, 0, 0, 0, 1, 1,
-0.5928836, 0.1368981, -1.017538, 0, 0, 0, 1, 1,
-0.5921276, -0.4184455, -1.911608, 0, 0, 0, 1, 1,
-0.5890288, 1.134677, -0.5070601, 1, 1, 1, 1, 1,
-0.5888773, -1.255833, -1.813795, 1, 1, 1, 1, 1,
-0.586722, 1.404514, 1.346529, 1, 1, 1, 1, 1,
-0.5855219, 1.257978, -1.77752, 1, 1, 1, 1, 1,
-0.5780287, 1.279286, -0.5460562, 1, 1, 1, 1, 1,
-0.5773939, 0.5509537, 0.8268178, 1, 1, 1, 1, 1,
-0.576314, -0.09704792, 0.0941724, 1, 1, 1, 1, 1,
-0.5740718, 1.636121, -1.226554, 1, 1, 1, 1, 1,
-0.5729043, -0.7549694, -2.577818, 1, 1, 1, 1, 1,
-0.5684316, -0.0407095, -0.4321848, 1, 1, 1, 1, 1,
-0.5662934, -1.588818, -4.5267, 1, 1, 1, 1, 1,
-0.5658801, 1.380781, -1.740774, 1, 1, 1, 1, 1,
-0.5658143, -0.008205179, -1.942872, 1, 1, 1, 1, 1,
-0.562378, 0.8575135, -1.774998, 1, 1, 1, 1, 1,
-0.561959, 0.4880104, -2.106818, 1, 1, 1, 1, 1,
-0.5593997, -0.04002287, -1.752936, 0, 0, 1, 1, 1,
-0.5526469, 0.3181546, 0.4522598, 1, 0, 0, 1, 1,
-0.5468436, 1.563469, 0.4445869, 1, 0, 0, 1, 1,
-0.5397659, 1.014747, -1.213212, 1, 0, 0, 1, 1,
-0.53905, 0.2777523, -0.9779838, 1, 0, 0, 1, 1,
-0.5283167, 1.184819, 0.635078, 1, 0, 0, 1, 1,
-0.5269421, 0.06252258, -0.8229395, 0, 0, 0, 1, 1,
-0.5260832, -0.7402207, -3.578753, 0, 0, 0, 1, 1,
-0.5249676, -1.425588, -2.260813, 0, 0, 0, 1, 1,
-0.5218157, 0.03733567, -3.33539, 0, 0, 0, 1, 1,
-0.5207136, -0.548096, -1.072228, 0, 0, 0, 1, 1,
-0.5203096, -0.7044249, -2.68161, 0, 0, 0, 1, 1,
-0.5181872, -1.056211, -1.846914, 0, 0, 0, 1, 1,
-0.5172832, 1.411735, 1.073302, 1, 1, 1, 1, 1,
-0.5117189, -0.7485623, -4.027888, 1, 1, 1, 1, 1,
-0.5085171, 0.6686689, -1.463015, 1, 1, 1, 1, 1,
-0.5003273, 1.498707, 0.130472, 1, 1, 1, 1, 1,
-0.498967, -0.3257101, -2.891204, 1, 1, 1, 1, 1,
-0.4976665, -0.3942075, -1.069629, 1, 1, 1, 1, 1,
-0.4960865, 0.6426217, -0.953316, 1, 1, 1, 1, 1,
-0.4918845, 0.6427039, -1.807965, 1, 1, 1, 1, 1,
-0.484448, 0.5514241, -0.7911755, 1, 1, 1, 1, 1,
-0.4832929, 1.250842, -0.4513678, 1, 1, 1, 1, 1,
-0.4773058, 0.9000645, 0.3236977, 1, 1, 1, 1, 1,
-0.4757647, -0.5527124, -2.936687, 1, 1, 1, 1, 1,
-0.4729373, -1.372291, -3.775372, 1, 1, 1, 1, 1,
-0.4698588, -1.341256, -2.698299, 1, 1, 1, 1, 1,
-0.4671105, 0.6334941, -1.31844, 1, 1, 1, 1, 1,
-0.4658318, -1.264449, -1.358543, 0, 0, 1, 1, 1,
-0.4657626, -0.1967017, -1.572698, 1, 0, 0, 1, 1,
-0.4596465, 0.5637302, -1.970823, 1, 0, 0, 1, 1,
-0.4518063, -1.943053, -4.160506, 1, 0, 0, 1, 1,
-0.4516067, -0.4085858, -3.829466, 1, 0, 0, 1, 1,
-0.4444223, 1.864826, -0.5586941, 1, 0, 0, 1, 1,
-0.44426, -0.06687827, -2.017464, 0, 0, 0, 1, 1,
-0.4418146, -2.927584, -3.492961, 0, 0, 0, 1, 1,
-0.4390669, -0.2068428, -1.489316, 0, 0, 0, 1, 1,
-0.4228945, 0.0547037, -3.560921, 0, 0, 0, 1, 1,
-0.422374, -1.474057, -2.591916, 0, 0, 0, 1, 1,
-0.4177035, 0.7206445, -2.317545, 0, 0, 0, 1, 1,
-0.415877, 1.78928, -1.407272, 0, 0, 0, 1, 1,
-0.415824, 0.2424992, -2.535012, 1, 1, 1, 1, 1,
-0.4137406, 0.6422701, -0.3732232, 1, 1, 1, 1, 1,
-0.4115003, -1.3553, -1.311348, 1, 1, 1, 1, 1,
-0.409044, 0.2587639, -0.2876293, 1, 1, 1, 1, 1,
-0.4083205, -0.9845445, -2.457719, 1, 1, 1, 1, 1,
-0.4071991, -1.126601, -1.493102, 1, 1, 1, 1, 1,
-0.4000871, -1.411779, -4.674359, 1, 1, 1, 1, 1,
-0.3927587, -0.1326922, -3.652804, 1, 1, 1, 1, 1,
-0.3911254, 0.4435092, -0.9825549, 1, 1, 1, 1, 1,
-0.3904805, 0.5160419, 0.277769, 1, 1, 1, 1, 1,
-0.3871393, 1.115641, 0.478771, 1, 1, 1, 1, 1,
-0.3857435, 1.554631, 0.4229957, 1, 1, 1, 1, 1,
-0.3838893, 0.7739586, 1.160797, 1, 1, 1, 1, 1,
-0.3827327, -0.1360516, -1.975786, 1, 1, 1, 1, 1,
-0.3766349, -1.438084, -3.536788, 1, 1, 1, 1, 1,
-0.3722483, -0.8950509, -3.310758, 0, 0, 1, 1, 1,
-0.3720955, 0.2204269, -1.920156, 1, 0, 0, 1, 1,
-0.3694026, 0.007738503, -1.799092, 1, 0, 0, 1, 1,
-0.3673991, -1.09549, -3.809306, 1, 0, 0, 1, 1,
-0.3618174, 0.5686585, -0.6258268, 1, 0, 0, 1, 1,
-0.3608988, -0.7701116, -3.290709, 1, 0, 0, 1, 1,
-0.3566094, 0.5515491, -0.05609697, 0, 0, 0, 1, 1,
-0.3553722, -0.2527201, -1.414782, 0, 0, 0, 1, 1,
-0.355264, 0.1722969, -0.4942126, 0, 0, 0, 1, 1,
-0.3550925, -0.3261732, -3.14795, 0, 0, 0, 1, 1,
-0.3510636, 0.4521454, -2.286805, 0, 0, 0, 1, 1,
-0.3500018, 1.242731, -0.6325185, 0, 0, 0, 1, 1,
-0.3483836, -0.3502671, -2.171479, 0, 0, 0, 1, 1,
-0.3462097, -0.444224, -1.773107, 1, 1, 1, 1, 1,
-0.3367976, -1.2384, -1.693815, 1, 1, 1, 1, 1,
-0.3347467, 1.357368, -1.050962, 1, 1, 1, 1, 1,
-0.3344914, 1.673478, -0.1452278, 1, 1, 1, 1, 1,
-0.3333575, 0.8466219, -1.337876, 1, 1, 1, 1, 1,
-0.3327402, -0.1322281, -2.196064, 1, 1, 1, 1, 1,
-0.3327264, 0.2624685, -0.9424394, 1, 1, 1, 1, 1,
-0.3282977, 0.670926, -2.178127, 1, 1, 1, 1, 1,
-0.3259758, -1.503108, -2.927573, 1, 1, 1, 1, 1,
-0.3244343, -0.2892845, -3.84554, 1, 1, 1, 1, 1,
-0.3216122, -0.3806086, -2.791793, 1, 1, 1, 1, 1,
-0.3208494, 0.1323549, -1.810885, 1, 1, 1, 1, 1,
-0.3196535, 0.8493089, 0.9125537, 1, 1, 1, 1, 1,
-0.3191052, -2.011439, -2.205124, 1, 1, 1, 1, 1,
-0.3138118, 0.5013301, -0.904389, 1, 1, 1, 1, 1,
-0.3135296, 1.220112, 1.444679, 0, 0, 1, 1, 1,
-0.3089072, 0.9604245, -0.8668286, 1, 0, 0, 1, 1,
-0.3060285, -0.2345558, -1.928907, 1, 0, 0, 1, 1,
-0.3045231, -0.522872, -2.762504, 1, 0, 0, 1, 1,
-0.2967809, -0.03501326, -1.235918, 1, 0, 0, 1, 1,
-0.2966198, 0.8350758, -1.763729, 1, 0, 0, 1, 1,
-0.2959676, 1.644604, 0.876714, 0, 0, 0, 1, 1,
-0.2925106, 1.084577, 1.932981, 0, 0, 0, 1, 1,
-0.2891701, 0.8718517, 0.8380967, 0, 0, 0, 1, 1,
-0.2843214, 0.9310089, -0.02595933, 0, 0, 0, 1, 1,
-0.2837825, 0.2308207, -2.626055, 0, 0, 0, 1, 1,
-0.2791563, 2.210941, 0.9618015, 0, 0, 0, 1, 1,
-0.2745793, 0.9624114, -0.7818702, 0, 0, 0, 1, 1,
-0.2730162, 0.2278395, -0.6782306, 1, 1, 1, 1, 1,
-0.2729365, -1.268746, -2.693063, 1, 1, 1, 1, 1,
-0.2698596, 1.63537, 0.249535, 1, 1, 1, 1, 1,
-0.2681401, 0.7426499, -1.574828, 1, 1, 1, 1, 1,
-0.2662745, -1.522958, -2.166362, 1, 1, 1, 1, 1,
-0.2662572, -0.6370116, -5.223542, 1, 1, 1, 1, 1,
-0.2656448, -2.175576, -3.655192, 1, 1, 1, 1, 1,
-0.2638076, -0.1895073, -1.420055, 1, 1, 1, 1, 1,
-0.2635549, -0.8770412, -2.508633, 1, 1, 1, 1, 1,
-0.2568827, 1.626128, 0.1575474, 1, 1, 1, 1, 1,
-0.2555077, -0.444194, -2.874603, 1, 1, 1, 1, 1,
-0.2509396, -0.887448, -2.085634, 1, 1, 1, 1, 1,
-0.2506194, -0.2675012, -2.329391, 1, 1, 1, 1, 1,
-0.2496795, -0.1848446, -2.261348, 1, 1, 1, 1, 1,
-0.2483093, 0.7421346, 2.72235, 1, 1, 1, 1, 1,
-0.2464223, -0.6706801, -3.113267, 0, 0, 1, 1, 1,
-0.2414895, 0.2642605, -0.895302, 1, 0, 0, 1, 1,
-0.2387825, 0.3740019, -1.509597, 1, 0, 0, 1, 1,
-0.2351205, -0.8331799, -4.335306, 1, 0, 0, 1, 1,
-0.2332477, 1.360717, -0.4161948, 1, 0, 0, 1, 1,
-0.229426, -1.284884, -3.454735, 1, 0, 0, 1, 1,
-0.2269307, 0.6800172, -0.05177399, 0, 0, 0, 1, 1,
-0.2268736, -0.5232856, -3.788383, 0, 0, 0, 1, 1,
-0.2266546, -0.4278599, -2.001414, 0, 0, 0, 1, 1,
-0.2262937, -0.6589476, -2.978612, 0, 0, 0, 1, 1,
-0.2238212, 0.1876454, -0.2111995, 0, 0, 0, 1, 1,
-0.2215338, -0.3772649, -1.876515, 0, 0, 0, 1, 1,
-0.2163189, 0.8664898, 1.495246, 0, 0, 0, 1, 1,
-0.2154678, 0.7749255, 0.7558812, 1, 1, 1, 1, 1,
-0.2136941, -1.577628, -4.363822, 1, 1, 1, 1, 1,
-0.2117171, -0.8149799, -4.058705, 1, 1, 1, 1, 1,
-0.2115864, 0.2658149, -0.2135611, 1, 1, 1, 1, 1,
-0.208341, -0.01538227, -1.453954, 1, 1, 1, 1, 1,
-0.2054061, -0.8434934, -3.62623, 1, 1, 1, 1, 1,
-0.2009716, -0.3011023, -3.104681, 1, 1, 1, 1, 1,
-0.2003822, -0.8637843, -4.382889, 1, 1, 1, 1, 1,
-0.2002245, -0.1657849, -4.560557, 1, 1, 1, 1, 1,
-0.1998922, 0.8892096, 1.32476, 1, 1, 1, 1, 1,
-0.1963246, 0.3743075, -1.442383, 1, 1, 1, 1, 1,
-0.1960719, 1.344215, -0.5289899, 1, 1, 1, 1, 1,
-0.1946622, -0.1476754, 0.1061554, 1, 1, 1, 1, 1,
-0.1776097, 0.1833773, 0.1751706, 1, 1, 1, 1, 1,
-0.1769744, 0.1264387, -2.037986, 1, 1, 1, 1, 1,
-0.1722594, 1.383709, -0.425606, 0, 0, 1, 1, 1,
-0.1697085, -0.1388155, -3.67103, 1, 0, 0, 1, 1,
-0.1682736, 0.1803295, 0.4400533, 1, 0, 0, 1, 1,
-0.1675439, 1.214206, -2.074652, 1, 0, 0, 1, 1,
-0.1586859, 0.04566609, -0.1168222, 1, 0, 0, 1, 1,
-0.1568138, -0.4034742, -3.838677, 1, 0, 0, 1, 1,
-0.15601, -0.3557795, -2.692624, 0, 0, 0, 1, 1,
-0.1547059, -0.2181464, -2.840319, 0, 0, 0, 1, 1,
-0.1519812, -0.1281072, -2.939102, 0, 0, 0, 1, 1,
-0.1509658, 0.149594, 0.2512823, 0, 0, 0, 1, 1,
-0.1453063, -0.1753617, -1.860382, 0, 0, 0, 1, 1,
-0.1264737, 2.566211, 0.8960144, 0, 0, 0, 1, 1,
-0.1256554, -0.6706467, -3.608077, 0, 0, 0, 1, 1,
-0.1251149, 0.08468212, -2.249148, 1, 1, 1, 1, 1,
-0.11131, 0.5202629, -1.682213, 1, 1, 1, 1, 1,
-0.1059745, 0.4418384, -0.8441185, 1, 1, 1, 1, 1,
-0.1046418, -0.5707259, -2.295482, 1, 1, 1, 1, 1,
-0.1013657, 0.1993226, 0.1518846, 1, 1, 1, 1, 1,
-0.1005476, -0.1408501, -1.568632, 1, 1, 1, 1, 1,
-0.09927503, -0.9133363, -1.975179, 1, 1, 1, 1, 1,
-0.09579648, 0.4012482, -0.4677145, 1, 1, 1, 1, 1,
-0.09484619, -0.7136372, -2.085727, 1, 1, 1, 1, 1,
-0.08657975, -0.3928422, -3.378314, 1, 1, 1, 1, 1,
-0.07556638, 0.5947366, -0.5292659, 1, 1, 1, 1, 1,
-0.0716696, 0.1896876, 0.0879531, 1, 1, 1, 1, 1,
-0.0711472, 2.538512, -0.67007, 1, 1, 1, 1, 1,
-0.07022389, -0.5119808, -2.323849, 1, 1, 1, 1, 1,
-0.07005629, 0.2716023, 0.1274171, 1, 1, 1, 1, 1,
-0.06997579, -0.180564, -3.37399, 0, 0, 1, 1, 1,
-0.06454682, -0.4626521, -3.059003, 1, 0, 0, 1, 1,
-0.05790482, 0.667586, -1.280142, 1, 0, 0, 1, 1,
-0.05462005, -0.7425075, -3.513544, 1, 0, 0, 1, 1,
-0.05309302, 1.337914, 0.446459, 1, 0, 0, 1, 1,
-0.05096182, -0.8381611, -2.503452, 1, 0, 0, 1, 1,
-0.05015464, -0.06667094, -2.616078, 0, 0, 0, 1, 1,
-0.04153595, 1.652189, -0.17637, 0, 0, 0, 1, 1,
-0.040281, 1.688381, 1.176353, 0, 0, 0, 1, 1,
-0.03720522, -0.3604413, -1.904018, 0, 0, 0, 1, 1,
-0.03706614, 0.2006184, -1.08054, 0, 0, 0, 1, 1,
-0.03087723, 1.893151, -0.1998495, 0, 0, 0, 1, 1,
-0.02843327, 1.250534, -0.7695771, 0, 0, 0, 1, 1,
-0.02776686, 0.3461732, 1.309266, 1, 1, 1, 1, 1,
-0.02167908, -0.2877934, -4.355684, 1, 1, 1, 1, 1,
-0.02114039, -0.4293462, -4.055332, 1, 1, 1, 1, 1,
-0.02064416, -0.09049461, -3.611488, 1, 1, 1, 1, 1,
-0.01791953, 0.04830623, -1.194032, 1, 1, 1, 1, 1,
-0.01531856, -0.05485655, -1.270164, 1, 1, 1, 1, 1,
-0.01410671, 1.209676, -0.9402056, 1, 1, 1, 1, 1,
-0.009371736, -0.4214594, -3.361391, 1, 1, 1, 1, 1,
-0.008695011, -0.3662733, -4.102141, 1, 1, 1, 1, 1,
-0.004716734, -2.97823, -3.941835, 1, 1, 1, 1, 1,
-0.003236004, 0.01159364, 0.01121192, 1, 1, 1, 1, 1,
0.008656259, 0.1514114, 0.8059385, 1, 1, 1, 1, 1,
0.00962918, -1.303452, 5.070534, 1, 1, 1, 1, 1,
0.01102959, -0.5587, 2.223456, 1, 1, 1, 1, 1,
0.0118578, 0.07873574, -1.243381, 1, 1, 1, 1, 1,
0.01388968, -0.6795397, 4.588624, 0, 0, 1, 1, 1,
0.01420949, -0.02096533, 2.795862, 1, 0, 0, 1, 1,
0.01558267, -1.19123, 2.469777, 1, 0, 0, 1, 1,
0.01850041, 1.321913, 1.297776, 1, 0, 0, 1, 1,
0.01857474, 0.70894, 1.157269, 1, 0, 0, 1, 1,
0.02251828, 0.1656224, -0.2517296, 1, 0, 0, 1, 1,
0.02911768, 0.07443735, -0.06714702, 0, 0, 0, 1, 1,
0.02953617, 0.2108361, 0.5277627, 0, 0, 0, 1, 1,
0.03005826, 0.4810989, -1.117111, 0, 0, 0, 1, 1,
0.03118035, -0.7546543, 2.844788, 0, 0, 0, 1, 1,
0.03604201, 0.167358, -0.8669881, 0, 0, 0, 1, 1,
0.03618431, 1.055328, 0.3148342, 0, 0, 0, 1, 1,
0.03948493, 0.09737787, -0.1834106, 0, 0, 0, 1, 1,
0.04009252, -0.9137173, 2.531755, 1, 1, 1, 1, 1,
0.0408697, 0.7399839, -0.6745115, 1, 1, 1, 1, 1,
0.04243745, -0.6306427, 3.991482, 1, 1, 1, 1, 1,
0.04531306, -0.5383635, 3.278326, 1, 1, 1, 1, 1,
0.0472114, 0.1015763, -0.9168211, 1, 1, 1, 1, 1,
0.05000599, 0.8312393, 0.2139572, 1, 1, 1, 1, 1,
0.05142562, -0.1936281, 1.83138, 1, 1, 1, 1, 1,
0.05634996, 0.8721766, 0.2640015, 1, 1, 1, 1, 1,
0.05701583, 0.03675017, 0.8715588, 1, 1, 1, 1, 1,
0.05825717, -0.8058797, 2.418405, 1, 1, 1, 1, 1,
0.05967755, -0.5283325, 3.352065, 1, 1, 1, 1, 1,
0.067454, 0.4881864, -0.6849005, 1, 1, 1, 1, 1,
0.07685829, 0.9072345, -0.9054927, 1, 1, 1, 1, 1,
0.08134285, -1.49436, 2.522555, 1, 1, 1, 1, 1,
0.08407142, -0.1031376, 3.164047, 1, 1, 1, 1, 1,
0.08473672, -0.6799582, 2.943427, 0, 0, 1, 1, 1,
0.08524565, -0.9925101, 4.004849, 1, 0, 0, 1, 1,
0.08573633, 0.05063838, 1.536808, 1, 0, 0, 1, 1,
0.0858584, 2.560834, 1.41645, 1, 0, 0, 1, 1,
0.09207202, 0.4992045, -1.167396, 1, 0, 0, 1, 1,
0.09397361, -0.1030015, 1.766558, 1, 0, 0, 1, 1,
0.09842487, 1.217523, -0.4578404, 0, 0, 0, 1, 1,
0.09909068, 0.28691, -0.6947367, 0, 0, 0, 1, 1,
0.1001731, 1.16999, -1.495198, 0, 0, 0, 1, 1,
0.1003033, -0.03961953, 3.183469, 0, 0, 0, 1, 1,
0.1006225, 1.700876, -1.414377, 0, 0, 0, 1, 1,
0.1028805, 2.758629, -0.07456382, 0, 0, 0, 1, 1,
0.1030187, -0.6637628, 2.478264, 0, 0, 0, 1, 1,
0.1030941, 0.8073118, 1.219901, 1, 1, 1, 1, 1,
0.1109823, -0.8764511, 2.385458, 1, 1, 1, 1, 1,
0.1151949, -0.6157911, 0.7027711, 1, 1, 1, 1, 1,
0.1155337, 1.945684, -0.3921128, 1, 1, 1, 1, 1,
0.1160821, 1.218243, 2.324944, 1, 1, 1, 1, 1,
0.1172458, -0.3137143, 2.882048, 1, 1, 1, 1, 1,
0.1190405, -1.265349, 3.077468, 1, 1, 1, 1, 1,
0.1239764, -0.07854736, 3.271261, 1, 1, 1, 1, 1,
0.1279961, -0.3111503, 3.094309, 1, 1, 1, 1, 1,
0.1288797, -1.059502, 3.431281, 1, 1, 1, 1, 1,
0.1292868, -0.9100981, 2.166042, 1, 1, 1, 1, 1,
0.1334849, -0.828985, 2.325375, 1, 1, 1, 1, 1,
0.1362843, 0.8721343, 1.941308, 1, 1, 1, 1, 1,
0.1396894, -0.8609292, 2.039098, 1, 1, 1, 1, 1,
0.140249, 1.124367, 0.6503874, 1, 1, 1, 1, 1,
0.1403829, 0.5641834, 0.3177676, 0, 0, 1, 1, 1,
0.1480205, -1.382863, 2.673464, 1, 0, 0, 1, 1,
0.1480525, -0.9806157, 3.201356, 1, 0, 0, 1, 1,
0.1485578, 0.8053079, -0.148944, 1, 0, 0, 1, 1,
0.1508484, 0.959752, 0.515282, 1, 0, 0, 1, 1,
0.1594923, -2.535804, 2.197033, 1, 0, 0, 1, 1,
0.1657515, 0.1773192, 0.2927689, 0, 0, 0, 1, 1,
0.1691878, 2.146511, 0.6724482, 0, 0, 0, 1, 1,
0.1730613, -1.096005, 1.494892, 0, 0, 0, 1, 1,
0.173248, 0.6794772, 0.0787263, 0, 0, 0, 1, 1,
0.1750074, -0.7177166, 5.046589, 0, 0, 0, 1, 1,
0.1756274, -2.029059, 3.657018, 0, 0, 0, 1, 1,
0.181031, 2.062455, -0.5848407, 0, 0, 0, 1, 1,
0.1841794, 0.4535386, 1.18812, 1, 1, 1, 1, 1,
0.1914244, 1.197721, -1.032915, 1, 1, 1, 1, 1,
0.1920922, -0.6025321, 2.940874, 1, 1, 1, 1, 1,
0.1931037, -1.05815, 5.260446, 1, 1, 1, 1, 1,
0.1936472, -1.679967, 1.978285, 1, 1, 1, 1, 1,
0.2019589, -0.6473882, 2.749814, 1, 1, 1, 1, 1,
0.2037196, 0.6210327, 0.9350781, 1, 1, 1, 1, 1,
0.2044698, -0.2426312, 3.808067, 1, 1, 1, 1, 1,
0.2050632, 1.136615, -3.144171, 1, 1, 1, 1, 1,
0.2056513, -0.787278, 4.12488, 1, 1, 1, 1, 1,
0.208125, 0.9092457, 0.7465284, 1, 1, 1, 1, 1,
0.2083828, -0.7774218, 3.698804, 1, 1, 1, 1, 1,
0.210044, 0.9317647, 0.8072593, 1, 1, 1, 1, 1,
0.2103501, 0.02148597, 1.898974, 1, 1, 1, 1, 1,
0.2160529, -0.850226, 3.068478, 1, 1, 1, 1, 1,
0.2245829, -1.061021, 3.420688, 0, 0, 1, 1, 1,
0.2283714, -1.86756, 2.804788, 1, 0, 0, 1, 1,
0.2300472, 0.0290534, 2.055133, 1, 0, 0, 1, 1,
0.2305378, -0.0239278, 2.522944, 1, 0, 0, 1, 1,
0.230968, -0.5390289, 2.425002, 1, 0, 0, 1, 1,
0.2326285, 0.9871126, 0.2936631, 1, 0, 0, 1, 1,
0.2349906, 1.028222, 0.6676501, 0, 0, 0, 1, 1,
0.236785, 0.04053338, 2.412724, 0, 0, 0, 1, 1,
0.2388609, -0.2895242, 3.130402, 0, 0, 0, 1, 1,
0.2394549, -0.7789408, 4.766311, 0, 0, 0, 1, 1,
0.2398512, 0.4392239, 0.6671968, 0, 0, 0, 1, 1,
0.2400173, 1.960724, -1.74946, 0, 0, 0, 1, 1,
0.2405582, -2.152627, 2.537935, 0, 0, 0, 1, 1,
0.2434027, -0.103117, 1.581445, 1, 1, 1, 1, 1,
0.243493, -0.536536, -0.2559955, 1, 1, 1, 1, 1,
0.2463693, -0.3764172, 2.241607, 1, 1, 1, 1, 1,
0.2465822, 2.011254, -0.919951, 1, 1, 1, 1, 1,
0.2502483, -0.6741645, 3.215841, 1, 1, 1, 1, 1,
0.256771, 1.151006, -1.473438, 1, 1, 1, 1, 1,
0.2581388, 0.7794734, 0.5578243, 1, 1, 1, 1, 1,
0.2584531, -0.1081747, 2.074735, 1, 1, 1, 1, 1,
0.2614824, 1.008593, 0.1090238, 1, 1, 1, 1, 1,
0.2696814, 1.210923, 1.899139, 1, 1, 1, 1, 1,
0.2714524, -0.3826955, 2.480958, 1, 1, 1, 1, 1,
0.274971, -0.138889, 2.378717, 1, 1, 1, 1, 1,
0.2758433, 0.6698421, 0.50036, 1, 1, 1, 1, 1,
0.2769715, -0.3139105, 4.285478, 1, 1, 1, 1, 1,
0.2769939, -0.7385096, 1.574063, 1, 1, 1, 1, 1,
0.2781276, 0.09522229, 0.6061246, 0, 0, 1, 1, 1,
0.2786853, 1.029634, 1.378101, 1, 0, 0, 1, 1,
0.2792718, 0.1036823, 1.829571, 1, 0, 0, 1, 1,
0.2805889, -2.410075, 2.849687, 1, 0, 0, 1, 1,
0.2829563, -0.06191405, 3.588796, 1, 0, 0, 1, 1,
0.2834722, -1.089432, 4.649689, 1, 0, 0, 1, 1,
0.2837851, -0.7004083, 1.990809, 0, 0, 0, 1, 1,
0.284553, 0.3752764, 0.5104895, 0, 0, 0, 1, 1,
0.2859831, -0.8878976, 2.776992, 0, 0, 0, 1, 1,
0.2871064, -1.291356, 3.866245, 0, 0, 0, 1, 1,
0.2871348, 0.1316773, 1.455517, 0, 0, 0, 1, 1,
0.2929257, -0.7612824, 4.974385, 0, 0, 0, 1, 1,
0.2941613, 0.4062719, -0.3836884, 0, 0, 0, 1, 1,
0.297315, -1.458498, 2.221626, 1, 1, 1, 1, 1,
0.2981994, 1.301715, 1.086968, 1, 1, 1, 1, 1,
0.3043104, 1.395711, 1.096576, 1, 1, 1, 1, 1,
0.3047832, -0.3639504, 1.777431, 1, 1, 1, 1, 1,
0.3082352, 0.5957791, 1.716969, 1, 1, 1, 1, 1,
0.3109362, -0.4734657, 2.329127, 1, 1, 1, 1, 1,
0.3139142, -1.004534, 2.159509, 1, 1, 1, 1, 1,
0.3144308, -0.9746731, 3.143352, 1, 1, 1, 1, 1,
0.3187744, 0.3559223, 1.556017, 1, 1, 1, 1, 1,
0.3212411, -1.079911, 4.032537, 1, 1, 1, 1, 1,
0.3236318, 1.316994, 1.261862, 1, 1, 1, 1, 1,
0.3269432, -0.752753, 3.156124, 1, 1, 1, 1, 1,
0.3363959, -0.4845688, 1.798568, 1, 1, 1, 1, 1,
0.3449777, -1.517765, 3.639254, 1, 1, 1, 1, 1,
0.345229, 1.322738, 0.2424757, 1, 1, 1, 1, 1,
0.34725, 2.725504, -0.4175963, 0, 0, 1, 1, 1,
0.3480569, -0.3300368, 1.182853, 1, 0, 0, 1, 1,
0.3517562, 1.49202, 1.599497, 1, 0, 0, 1, 1,
0.3522749, -0.5244048, 3.093531, 1, 0, 0, 1, 1,
0.3632354, 1.700481, -0.532323, 1, 0, 0, 1, 1,
0.3660701, -0.1848981, 3.289788, 1, 0, 0, 1, 1,
0.3664839, 1.286258, 0.1445904, 0, 0, 0, 1, 1,
0.3696784, -0.09940354, 1.530169, 0, 0, 0, 1, 1,
0.3719976, 0.1857958, 0.7534185, 0, 0, 0, 1, 1,
0.377271, 0.8747929, 0.3427536, 0, 0, 0, 1, 1,
0.3859743, 1.699963, 0.8296874, 0, 0, 0, 1, 1,
0.3907267, -0.2419612, 1.718847, 0, 0, 0, 1, 1,
0.3971381, 1.534784, 2.228299, 0, 0, 0, 1, 1,
0.3995887, 0.5321669, 0.1816666, 1, 1, 1, 1, 1,
0.4008744, -1.238293, 3.471014, 1, 1, 1, 1, 1,
0.4009985, -1.40972, 1.777932, 1, 1, 1, 1, 1,
0.4015702, 1.537822, -1.815008, 1, 1, 1, 1, 1,
0.4034524, -0.7494824, 2.504455, 1, 1, 1, 1, 1,
0.4047458, 0.6004667, 0.9947134, 1, 1, 1, 1, 1,
0.4081238, -0.1627968, 2.563234, 1, 1, 1, 1, 1,
0.4101043, 0.987011, 0.556008, 1, 1, 1, 1, 1,
0.4145886, -1.544926, 2.591499, 1, 1, 1, 1, 1,
0.4166803, 0.2467607, 0.7383952, 1, 1, 1, 1, 1,
0.4171862, 1.278534, 0.6076175, 1, 1, 1, 1, 1,
0.417299, -0.9448068, 3.216429, 1, 1, 1, 1, 1,
0.4187651, 0.6700903, 2.619341, 1, 1, 1, 1, 1,
0.4195642, -1.125012, 2.148855, 1, 1, 1, 1, 1,
0.4203593, -0.1789259, 1.52899, 1, 1, 1, 1, 1,
0.4229535, -0.4067358, 2.011708, 0, 0, 1, 1, 1,
0.4231585, 0.3065246, 0.745318, 1, 0, 0, 1, 1,
0.4238441, 0.368581, 2.337462, 1, 0, 0, 1, 1,
0.4251323, -0.4898781, 1.985731, 1, 0, 0, 1, 1,
0.4256627, -0.1257035, 1.180358, 1, 0, 0, 1, 1,
0.4257963, -0.01175804, 1.92784, 1, 0, 0, 1, 1,
0.4314, -2.186451, 4.698217, 0, 0, 0, 1, 1,
0.4326801, 0.7064783, -0.1198541, 0, 0, 0, 1, 1,
0.4337295, 1.221172, 0.2831478, 0, 0, 0, 1, 1,
0.4362476, -0.09104019, 2.839195, 0, 0, 0, 1, 1,
0.4411202, -0.8137555, 1.088923, 0, 0, 0, 1, 1,
0.4424619, -0.9461316, 2.98779, 0, 0, 0, 1, 1,
0.4437871, -0.1233358, 2.996964, 0, 0, 0, 1, 1,
0.4441092, -1.257585, 2.014775, 1, 1, 1, 1, 1,
0.4528604, 0.4841293, 2.214881, 1, 1, 1, 1, 1,
0.4563257, 0.3990134, 1.181008, 1, 1, 1, 1, 1,
0.4573013, 0.1070064, 0.5875828, 1, 1, 1, 1, 1,
0.45731, -1.020893, 4.219145, 1, 1, 1, 1, 1,
0.4577314, -0.9793229, 2.105702, 1, 1, 1, 1, 1,
0.4646595, -1.090892, 2.496694, 1, 1, 1, 1, 1,
0.4651669, -1.425357, 3.504279, 1, 1, 1, 1, 1,
0.4687042, -1.900199, 2.788946, 1, 1, 1, 1, 1,
0.4714881, -0.1203509, 0.6043658, 1, 1, 1, 1, 1,
0.4736785, -0.08784319, 2.55614, 1, 1, 1, 1, 1,
0.4769204, 1.122997, -1.189161, 1, 1, 1, 1, 1,
0.4782817, -0.7939724, 1.419152, 1, 1, 1, 1, 1,
0.4818087, -0.470797, 3.666739, 1, 1, 1, 1, 1,
0.4851732, 1.133499, 1.400182, 1, 1, 1, 1, 1,
0.4889791, 0.001896535, 3.019389, 0, 0, 1, 1, 1,
0.4929924, 0.3925378, -1.512579, 1, 0, 0, 1, 1,
0.4938249, -0.8157412, 1.970686, 1, 0, 0, 1, 1,
0.4955303, 0.8177845, 1.901238, 1, 0, 0, 1, 1,
0.4956097, -0.8546551, 3.874097, 1, 0, 0, 1, 1,
0.5038849, 0.2710674, 1.128307, 1, 0, 0, 1, 1,
0.5051223, -1.724454, 3.09383, 0, 0, 0, 1, 1,
0.5064704, -0.5077966, 1.686093, 0, 0, 0, 1, 1,
0.514135, 1.501031, 1.687149, 0, 0, 0, 1, 1,
0.514838, 2.012628, 0.007487873, 0, 0, 0, 1, 1,
0.5232771, 0.8345191, -0.6101867, 0, 0, 0, 1, 1,
0.5277637, 0.9207567, 1.094761, 0, 0, 0, 1, 1,
0.5320165, 0.1507298, 1.309467, 0, 0, 0, 1, 1,
0.5336252, 0.3672382, 0.02040542, 1, 1, 1, 1, 1,
0.5362264, -0.1025027, 3.286662, 1, 1, 1, 1, 1,
0.5363883, -1.141248, 4.154915, 1, 1, 1, 1, 1,
0.53913, -0.03198989, 1.575287, 1, 1, 1, 1, 1,
0.5404355, 1.028412, -0.1372252, 1, 1, 1, 1, 1,
0.5472606, 0.3864414, -0.3250423, 1, 1, 1, 1, 1,
0.5503399, 0.7440907, -0.4216052, 1, 1, 1, 1, 1,
0.5599979, -0.2717146, 0.02730428, 1, 1, 1, 1, 1,
0.5605925, 0.3660282, 3.216841, 1, 1, 1, 1, 1,
0.5610654, -0.06664122, 1.822089, 1, 1, 1, 1, 1,
0.5684618, 0.02109986, 1.222474, 1, 1, 1, 1, 1,
0.5720406, -1.839513, 2.413464, 1, 1, 1, 1, 1,
0.5780753, 1.271211, 1.535935, 1, 1, 1, 1, 1,
0.5962174, -1.661452, 1.592925, 1, 1, 1, 1, 1,
0.5968072, 0.3857144, 1.2239, 1, 1, 1, 1, 1,
0.5970578, -0.6332234, 0.9093415, 0, 0, 1, 1, 1,
0.6005235, 1.745945, 2.342857, 1, 0, 0, 1, 1,
0.6025693, -0.05077819, 1.984943, 1, 0, 0, 1, 1,
0.6031309, -1.239324, 2.31656, 1, 0, 0, 1, 1,
0.6103779, 0.9030504, 0.0709731, 1, 0, 0, 1, 1,
0.6161358, -0.2919231, 0.8178891, 1, 0, 0, 1, 1,
0.6172885, -0.6792216, 3.299544, 0, 0, 0, 1, 1,
0.6172995, -0.3820361, 1.627846, 0, 0, 0, 1, 1,
0.6181846, 0.6381299, 1.035812, 0, 0, 0, 1, 1,
0.6196663, 1.469693, 0.01833616, 0, 0, 0, 1, 1,
0.6197066, -0.6725662, 2.035063, 0, 0, 0, 1, 1,
0.6197557, -2.189834, 2.587142, 0, 0, 0, 1, 1,
0.6211402, 0.5232825, 1.547003, 0, 0, 0, 1, 1,
0.6221914, 0.298957, 0.06443591, 1, 1, 1, 1, 1,
0.6222013, 0.8889387, 1.148531, 1, 1, 1, 1, 1,
0.6238484, -0.8889567, 3.082572, 1, 1, 1, 1, 1,
0.6249208, -0.6578833, 3.126024, 1, 1, 1, 1, 1,
0.6328524, 2.749756, -1.319017, 1, 1, 1, 1, 1,
0.6328822, 1.218648, -0.544734, 1, 1, 1, 1, 1,
0.6356817, 0.7837092, 1.2754, 1, 1, 1, 1, 1,
0.6362059, -1.227821, 2.115748, 1, 1, 1, 1, 1,
0.6412979, -0.9989291, 2.677191, 1, 1, 1, 1, 1,
0.6424646, 0.175677, 1.825297, 1, 1, 1, 1, 1,
0.6506425, -0.3084289, 1.661419, 1, 1, 1, 1, 1,
0.6514643, -1.21282, 1.650292, 1, 1, 1, 1, 1,
0.6589213, -0.6404715, 1.818743, 1, 1, 1, 1, 1,
0.6616893, -0.1646323, 2.664354, 1, 1, 1, 1, 1,
0.6620241, 0.9450254, 1.411377, 1, 1, 1, 1, 1,
0.6652457, 1.406898, 0.1308958, 0, 0, 1, 1, 1,
0.6695377, 0.3661457, 1.472412, 1, 0, 0, 1, 1,
0.67136, 2.691195, 1.021283, 1, 0, 0, 1, 1,
0.6733136, 1.239877, -0.6674479, 1, 0, 0, 1, 1,
0.6786981, -0.343216, 1.946557, 1, 0, 0, 1, 1,
0.6880801, 0.3982542, 1.868732, 1, 0, 0, 1, 1,
0.6894268, -1.169062, 3.172616, 0, 0, 0, 1, 1,
0.6903763, -0.3172298, 1.474977, 0, 0, 0, 1, 1,
0.6985154, -0.7668199, 3.568339, 0, 0, 0, 1, 1,
0.7028924, 0.01384956, 0.8102353, 0, 0, 0, 1, 1,
0.7050961, 0.1435411, 2.877855, 0, 0, 0, 1, 1,
0.7092044, 0.01443253, 0.1373384, 0, 0, 0, 1, 1,
0.713246, 0.9414045, -0.07171419, 0, 0, 0, 1, 1,
0.7136495, -1.077525, 3.117429, 1, 1, 1, 1, 1,
0.7139985, -0.6206608, 2.372097, 1, 1, 1, 1, 1,
0.7148424, 0.4330628, -0.7836809, 1, 1, 1, 1, 1,
0.7195685, -1.470357, 1.76639, 1, 1, 1, 1, 1,
0.7198296, -0.6367361, 1.983487, 1, 1, 1, 1, 1,
0.7204512, -1.155598, 3.109425, 1, 1, 1, 1, 1,
0.7219121, -1.008006, 3.092609, 1, 1, 1, 1, 1,
0.7228294, 0.532849, 1.37213, 1, 1, 1, 1, 1,
0.7271274, -1.993126, 2.265613, 1, 1, 1, 1, 1,
0.7274722, 0.4615924, 0.1266527, 1, 1, 1, 1, 1,
0.7417192, 1.167134, -0.8481414, 1, 1, 1, 1, 1,
0.7430376, -0.5520568, 2.176805, 1, 1, 1, 1, 1,
0.7523813, 0.3363759, 2.28576, 1, 1, 1, 1, 1,
0.7577145, -0.8964989, 1.506333, 1, 1, 1, 1, 1,
0.7578577, -0.01361217, 0.8190918, 1, 1, 1, 1, 1,
0.7588633, -0.5883046, 1.662305, 0, 0, 1, 1, 1,
0.7659773, 0.494559, -1.427602, 1, 0, 0, 1, 1,
0.7662689, 2.396943, 0.0577055, 1, 0, 0, 1, 1,
0.766416, 0.2498022, 2.990281, 1, 0, 0, 1, 1,
0.7694315, -0.7499239, 1.081194, 1, 0, 0, 1, 1,
0.7738896, 0.5504156, 0.960366, 1, 0, 0, 1, 1,
0.7789053, -0.7920499, 2.406188, 0, 0, 0, 1, 1,
0.7798545, 0.8790656, 0.3206735, 0, 0, 0, 1, 1,
0.7824287, 0.1477676, 2.619907, 0, 0, 0, 1, 1,
0.7890897, 1.047889, 2.099924, 0, 0, 0, 1, 1,
0.7906651, 0.1725985, 2.392177, 0, 0, 0, 1, 1,
0.8066213, -0.20062, 1.503632, 0, 0, 0, 1, 1,
0.807965, -0.8577887, 1.555071, 0, 0, 0, 1, 1,
0.8110235, 0.2271592, 0.8392534, 1, 1, 1, 1, 1,
0.8140243, -0.7972502, 2.934368, 1, 1, 1, 1, 1,
0.8163423, -0.7782139, 3.668361, 1, 1, 1, 1, 1,
0.8293154, 0.2428724, 0.6690947, 1, 1, 1, 1, 1,
0.8321314, 0.3351048, 0.5912353, 1, 1, 1, 1, 1,
0.8342721, 0.5782219, 2.140766, 1, 1, 1, 1, 1,
0.838693, 0.2216819, -0.1305342, 1, 1, 1, 1, 1,
0.8406565, -1.540433, 1.569815, 1, 1, 1, 1, 1,
0.8413653, -0.9439973, 1.736596, 1, 1, 1, 1, 1,
0.8423218, 0.4571965, 0.9695709, 1, 1, 1, 1, 1,
0.8465039, -0.1409784, 2.608277, 1, 1, 1, 1, 1,
0.850945, -1.196453, 3.03158, 1, 1, 1, 1, 1,
0.8515524, 0.03822149, 1.351293, 1, 1, 1, 1, 1,
0.8549748, 0.1064643, 2.151178, 1, 1, 1, 1, 1,
0.8557869, 0.2445402, 2.192298, 1, 1, 1, 1, 1,
0.8623556, 0.535004, 0.2062988, 0, 0, 1, 1, 1,
0.871661, -0.6998037, 0.3402617, 1, 0, 0, 1, 1,
0.8771477, -1.136218, 2.181834, 1, 0, 0, 1, 1,
0.878722, 0.06307752, 1.813597, 1, 0, 0, 1, 1,
0.8827075, -0.6197466, 1.397676, 1, 0, 0, 1, 1,
0.883045, -0.1480532, 3.642659, 1, 0, 0, 1, 1,
0.8832973, -1.715391, 3.430924, 0, 0, 0, 1, 1,
0.8906404, 0.8509874, 1.440476, 0, 0, 0, 1, 1,
0.8943784, 1.007208, -2.335297, 0, 0, 0, 1, 1,
0.8953928, -1.014393, 1.575145, 0, 0, 0, 1, 1,
0.9012628, 1.017356, 0.5754089, 0, 0, 0, 1, 1,
0.9016215, -0.9335667, 3.309782, 0, 0, 0, 1, 1,
0.9080334, -0.5133394, 1.852992, 0, 0, 0, 1, 1,
0.9132648, -0.2656069, 0.900104, 1, 1, 1, 1, 1,
0.9271212, -1.455099, 2.04885, 1, 1, 1, 1, 1,
0.9332911, 0.7239039, 1.285153, 1, 1, 1, 1, 1,
0.9353293, -1.455726, 2.441213, 1, 1, 1, 1, 1,
0.9364524, 0.6039193, 1.460099, 1, 1, 1, 1, 1,
0.9457041, -1.11417, 2.953055, 1, 1, 1, 1, 1,
0.9460515, -1.975439, 2.925992, 1, 1, 1, 1, 1,
0.9540938, 0.1907335, 1.989104, 1, 1, 1, 1, 1,
0.9542413, -1.577978, 3.153927, 1, 1, 1, 1, 1,
0.9582208, 0.3509726, 2.459989, 1, 1, 1, 1, 1,
0.9582248, 0.6449626, 2.175884, 1, 1, 1, 1, 1,
0.9683016, 1.037338, 1.859899, 1, 1, 1, 1, 1,
0.979429, -1.176019, 2.254932, 1, 1, 1, 1, 1,
0.9798307, -0.8655555, 1.740041, 1, 1, 1, 1, 1,
0.9836324, 1.876114, -0.6645782, 1, 1, 1, 1, 1,
0.9852278, -0.303175, 0.5398265, 0, 0, 1, 1, 1,
0.9869255, 1.563987, 1.691739, 1, 0, 0, 1, 1,
0.9917063, 0.5215203, 0.7116081, 1, 0, 0, 1, 1,
0.9944379, 0.08565345, 1.365652, 1, 0, 0, 1, 1,
0.9968439, 0.1612136, 1.035179, 1, 0, 0, 1, 1,
0.9979045, -0.3949065, 1.75769, 1, 0, 0, 1, 1,
0.9990619, 1.641873, 1.500836, 0, 0, 0, 1, 1,
0.9991574, 2.111339, -0.8177859, 0, 0, 0, 1, 1,
1.000051, -0.4676748, 0.2352673, 0, 0, 0, 1, 1,
1.005223, -0.3828261, 1.580932, 0, 0, 0, 1, 1,
1.015435, -0.1761542, 2.650608, 0, 0, 0, 1, 1,
1.01654, -0.09036044, -1.108884, 0, 0, 0, 1, 1,
1.016591, 0.3398403, 1.922334, 0, 0, 0, 1, 1,
1.016838, -0.7094877, 1.009081, 1, 1, 1, 1, 1,
1.020175, 1.096899, -0.2065301, 1, 1, 1, 1, 1,
1.02036, -1.445668, 0.931488, 1, 1, 1, 1, 1,
1.027056, -0.328411, 1.381994, 1, 1, 1, 1, 1,
1.027837, -1.280627, 3.090117, 1, 1, 1, 1, 1,
1.030102, 0.2742257, 1.427566, 1, 1, 1, 1, 1,
1.036978, -0.4606573, 2.099054, 1, 1, 1, 1, 1,
1.038616, -1.551946, 3.449183, 1, 1, 1, 1, 1,
1.038951, 1.081007, 0.8314939, 1, 1, 1, 1, 1,
1.039899, 0.4428861, 2.710948, 1, 1, 1, 1, 1,
1.042968, -1.142587, 3.066078, 1, 1, 1, 1, 1,
1.043555, 0.6544877, 1.143833, 1, 1, 1, 1, 1,
1.044342, -0.4519225, 1.35936, 1, 1, 1, 1, 1,
1.053325, -0.6128778, 1.166684, 1, 1, 1, 1, 1,
1.055756, 1.196796, -1.34518, 1, 1, 1, 1, 1,
1.062014, 0.4941793, 2.35468, 0, 0, 1, 1, 1,
1.064313, 0.578706, 1.892639, 1, 0, 0, 1, 1,
1.068583, 0.1292674, 1.848531, 1, 0, 0, 1, 1,
1.072762, 1.637743, 1.707904, 1, 0, 0, 1, 1,
1.0739, 1.850014, -0.8430285, 1, 0, 0, 1, 1,
1.076594, -1.368715, 2.577653, 1, 0, 0, 1, 1,
1.076633, -0.3653778, 2.530756, 0, 0, 0, 1, 1,
1.076695, 0.139301, 1.993285, 0, 0, 0, 1, 1,
1.096567, 0.770317, 0.5713716, 0, 0, 0, 1, 1,
1.097592, 0.06410735, -0.8828375, 0, 0, 0, 1, 1,
1.102917, 0.5255645, 1.299376, 0, 0, 0, 1, 1,
1.10627, 0.4405616, 0.6057297, 0, 0, 0, 1, 1,
1.106852, -0.1269912, 1.082846, 0, 0, 0, 1, 1,
1.108161, 0.683717, 1.261363, 1, 1, 1, 1, 1,
1.111556, 0.5432959, 2.546105, 1, 1, 1, 1, 1,
1.113477, 0.7834135, -0.05724874, 1, 1, 1, 1, 1,
1.125054, -0.9962258, 2.929322, 1, 1, 1, 1, 1,
1.130393, -0.06334471, 0.7471638, 1, 1, 1, 1, 1,
1.136576, -0.8950064, 3.678239, 1, 1, 1, 1, 1,
1.13857, -0.7976417, 1.48676, 1, 1, 1, 1, 1,
1.138839, -0.2683639, 3.191793, 1, 1, 1, 1, 1,
1.149521, 0.1571197, 0.777929, 1, 1, 1, 1, 1,
1.155943, -0.4493471, 3.788368, 1, 1, 1, 1, 1,
1.158356, 0.01075319, -0.1151593, 1, 1, 1, 1, 1,
1.176835, -0.1401694, 1.669259, 1, 1, 1, 1, 1,
1.177162, -0.5378889, 0.9306913, 1, 1, 1, 1, 1,
1.180582, -0.6711165, 1.306519, 1, 1, 1, 1, 1,
1.184214, 1.980286, 1.640287, 1, 1, 1, 1, 1,
1.190563, 1.384001, 1.085796, 0, 0, 1, 1, 1,
1.190998, -0.8286393, 3.755581, 1, 0, 0, 1, 1,
1.193648, 1.472063, -0.3950089, 1, 0, 0, 1, 1,
1.208586, 0.1373642, 2.160222, 1, 0, 0, 1, 1,
1.20953, -0.8152058, 1.385065, 1, 0, 0, 1, 1,
1.215965, -1.410346, 2.518485, 1, 0, 0, 1, 1,
1.216437, 0.9893085, 1.706984, 0, 0, 0, 1, 1,
1.220881, -1.811617, 3.662863, 0, 0, 0, 1, 1,
1.222374, 0.1719579, 3.496393, 0, 0, 0, 1, 1,
1.22731, -0.882524, 3.249049, 0, 0, 0, 1, 1,
1.234684, 0.2867037, -0.5616463, 0, 0, 0, 1, 1,
1.239923, -1.51108, 3.567888, 0, 0, 0, 1, 1,
1.241747, -0.6138675, 1.17289, 0, 0, 0, 1, 1,
1.244488, -0.2712822, 0.3218441, 1, 1, 1, 1, 1,
1.245165, -1.831017, 3.203363, 1, 1, 1, 1, 1,
1.254452, -1.056803, 1.886277, 1, 1, 1, 1, 1,
1.265607, -0.3297932, 2.47658, 1, 1, 1, 1, 1,
1.269427, 1.270429, 2.518263, 1, 1, 1, 1, 1,
1.275092, 0.4924923, 1.865948, 1, 1, 1, 1, 1,
1.278977, -0.4510783, 1.69583, 1, 1, 1, 1, 1,
1.302805, -1.439296, 4.443326, 1, 1, 1, 1, 1,
1.315657, -0.1993638, 1.539499, 1, 1, 1, 1, 1,
1.342928, -1.881426, 1.772032, 1, 1, 1, 1, 1,
1.354355, 1.896905, 1.041846, 1, 1, 1, 1, 1,
1.355158, -0.2963494, 2.308265, 1, 1, 1, 1, 1,
1.369794, -0.6915745, 1.349358, 1, 1, 1, 1, 1,
1.369945, -0.4507426, 0.6861997, 1, 1, 1, 1, 1,
1.370797, 1.07672, 0.7314615, 1, 1, 1, 1, 1,
1.385898, -0.1204434, 0.7361845, 0, 0, 1, 1, 1,
1.40087, -0.6945899, 1.911146, 1, 0, 0, 1, 1,
1.406598, 1.647002, 1.536348, 1, 0, 0, 1, 1,
1.407648, 0.4353317, -0.3382898, 1, 0, 0, 1, 1,
1.410857, -2.803397, 2.183594, 1, 0, 0, 1, 1,
1.412388, 0.5385227, 0.7573383, 1, 0, 0, 1, 1,
1.414253, 1.016707, 2.524385, 0, 0, 0, 1, 1,
1.415143, 0.05711862, 0.3123987, 0, 0, 0, 1, 1,
1.43004, -1.769444, 2.088252, 0, 0, 0, 1, 1,
1.446519, -0.2307027, 2.28755, 0, 0, 0, 1, 1,
1.447755, -0.009415374, 2.270289, 0, 0, 0, 1, 1,
1.462194, -0.3211459, 2.25966, 0, 0, 0, 1, 1,
1.468267, -0.2044375, 3.143296, 0, 0, 0, 1, 1,
1.486217, 1.376775, 1.187066, 1, 1, 1, 1, 1,
1.4874, 1.088977, -0.4674598, 1, 1, 1, 1, 1,
1.493071, -0.7426752, 2.041614, 1, 1, 1, 1, 1,
1.500983, 0.4191505, -0.8618219, 1, 1, 1, 1, 1,
1.51808, -0.09764037, 2.262602, 1, 1, 1, 1, 1,
1.520886, -0.1187213, 1.377847, 1, 1, 1, 1, 1,
1.536418, 0.2229621, 0.861235, 1, 1, 1, 1, 1,
1.550221, 0.06202818, 0.07509071, 1, 1, 1, 1, 1,
1.55935, -0.04859274, 0.8563268, 1, 1, 1, 1, 1,
1.561737, 0.9618679, 0.8719672, 1, 1, 1, 1, 1,
1.570147, -1.315275, 3.474525, 1, 1, 1, 1, 1,
1.586351, -0.05962279, 2.153299, 1, 1, 1, 1, 1,
1.586394, -0.08412506, 0.01382519, 1, 1, 1, 1, 1,
1.591294, -0.9660503, 3.600055, 1, 1, 1, 1, 1,
1.612805, -0.1309486, 3.582146, 1, 1, 1, 1, 1,
1.626884, -1.093999, 2.889451, 0, 0, 1, 1, 1,
1.634755, -0.02389977, 3.669187, 1, 0, 0, 1, 1,
1.640744, -0.8177716, 3.529454, 1, 0, 0, 1, 1,
1.669142, 1.066354, 1.3599, 1, 0, 0, 1, 1,
1.715683, 0.5834708, 1.059777, 1, 0, 0, 1, 1,
1.718717, -1.683092, 1.39021, 1, 0, 0, 1, 1,
1.719473, 1.941481, 0.2141562, 0, 0, 0, 1, 1,
1.727209, -0.8066496, 1.597757, 0, 0, 0, 1, 1,
1.753404, -0.6750832, 2.428096, 0, 0, 0, 1, 1,
1.756073, -0.09684303, 1.413011, 0, 0, 0, 1, 1,
1.764035, -0.3622261, 2.174404, 0, 0, 0, 1, 1,
1.76497, -1.65921, 1.516911, 0, 0, 0, 1, 1,
1.776055, -0.1815327, 1.40839, 0, 0, 0, 1, 1,
1.819752, 0.7784036, 0.9536402, 1, 1, 1, 1, 1,
1.821529, -0.0568895, 0.6074348, 1, 1, 1, 1, 1,
1.837144, 0.431611, 2.908852, 1, 1, 1, 1, 1,
1.844059, -0.7720803, 2.380495, 1, 1, 1, 1, 1,
1.887175, -0.1597205, 1.30552, 1, 1, 1, 1, 1,
1.901047, 0.6291234, 0.2199664, 1, 1, 1, 1, 1,
1.92502, 0.8026147, 1.913582, 1, 1, 1, 1, 1,
1.947051, 0.1636256, 0.3547377, 1, 1, 1, 1, 1,
1.950706, 0.6196328, 1.767851, 1, 1, 1, 1, 1,
1.991169, 0.9519873, 1.314855, 1, 1, 1, 1, 1,
1.992949, 0.3643091, 1.830675, 1, 1, 1, 1, 1,
2.021599, 0.8634886, -0.2012309, 1, 1, 1, 1, 1,
2.07417, -0.4069297, 1.947657, 1, 1, 1, 1, 1,
2.103328, -0.3314471, 2.408964, 1, 1, 1, 1, 1,
2.105748, 0.8609076, 1.098603, 1, 1, 1, 1, 1,
2.10756, 0.2665829, 2.443238, 0, 0, 1, 1, 1,
2.132615, -0.4554115, 1.029346, 1, 0, 0, 1, 1,
2.171751, -0.3330559, 2.15766, 1, 0, 0, 1, 1,
2.201504, -0.3442387, 3.312352, 1, 0, 0, 1, 1,
2.235719, -0.7799109, -2.027416, 1, 0, 0, 1, 1,
2.287506, -1.704625, 0.8725739, 1, 0, 0, 1, 1,
2.356236, -0.3377834, 0.1275055, 0, 0, 0, 1, 1,
2.410879, -0.1631156, 3.645132, 0, 0, 0, 1, 1,
2.423063, -0.170635, 1.098767, 0, 0, 0, 1, 1,
2.429095, -0.2499965, 2.114856, 0, 0, 0, 1, 1,
2.438604, -0.06358633, 1.181074, 0, 0, 0, 1, 1,
2.458921, 1.159432, 2.660483, 0, 0, 0, 1, 1,
2.547561, 0.3754374, 2.495439, 0, 0, 0, 1, 1,
2.579887, 0.6207149, 2.641197, 1, 1, 1, 1, 1,
2.642763, 2.329909, 0.06518718, 1, 1, 1, 1, 1,
2.705917, -0.6760324, 1.804815, 1, 1, 1, 1, 1,
2.79843, 0.5583667, 1.555633, 1, 1, 1, 1, 1,
3.011803, -0.6053416, 0.8413137, 1, 1, 1, 1, 1,
3.063811, -1.105355, 3.278419, 1, 1, 1, 1, 1,
4.135237, 0.6563514, 1.637896, 1, 1, 1, 1, 1
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
var radius = 9.517665;
var distance = 33.4304;
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
mvMatrix.translate( -0.5595202, 0.1098007, -0.01845217 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4304);
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
