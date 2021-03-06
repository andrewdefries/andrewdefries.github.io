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
-4.076019, 0.3435745, -1.52349, 1, 0, 0, 1,
-2.835866, 0.2685141, -0.6763024, 1, 0.007843138, 0, 1,
-2.758983, 0.01317357, -1.207785, 1, 0.01176471, 0, 1,
-2.665052, 0.2536051, 0.03945, 1, 0.01960784, 0, 1,
-2.523335, 0.4913018, -0.4376213, 1, 0.02352941, 0, 1,
-2.523282, 0.3041576, -1.726059, 1, 0.03137255, 0, 1,
-2.513847, 1.489348, -0.6813267, 1, 0.03529412, 0, 1,
-2.465901, 0.8388336, -1.352276, 1, 0.04313726, 0, 1,
-2.437275, -1.750989, -2.636633, 1, 0.04705882, 0, 1,
-2.333322, -0.2597331, -0.3900783, 1, 0.05490196, 0, 1,
-2.33111, -0.4036992, -3.187277, 1, 0.05882353, 0, 1,
-2.321454, -0.1381713, -2.514692, 1, 0.06666667, 0, 1,
-2.306735, 1.090753, 0.876257, 1, 0.07058824, 0, 1,
-2.231064, -0.2308711, -2.18195, 1, 0.07843138, 0, 1,
-2.219118, 0.6579487, -1.355646, 1, 0.08235294, 0, 1,
-2.218894, -0.2356525, -2.587133, 1, 0.09019608, 0, 1,
-2.218215, 1.078453, -1.335094, 1, 0.09411765, 0, 1,
-2.175585, 1.661036, -2.479175, 1, 0.1019608, 0, 1,
-2.150597, -0.4936126, -1.78948, 1, 0.1098039, 0, 1,
-2.136037, -0.7735395, -1.98105, 1, 0.1137255, 0, 1,
-2.129309, -0.5865499, -2.178691, 1, 0.1215686, 0, 1,
-2.060999, 0.789019, -1.810015, 1, 0.1254902, 0, 1,
-1.992613, -0.07447411, -1.607737, 1, 0.1333333, 0, 1,
-1.987238, -0.1873916, -0.8432146, 1, 0.1372549, 0, 1,
-1.963663, -1.029418, -1.660242, 1, 0.145098, 0, 1,
-1.961608, 1.092814, -0.6239343, 1, 0.1490196, 0, 1,
-1.960324, 2.380936, -2.092259, 1, 0.1568628, 0, 1,
-1.958641, 2.155708, -0.2484117, 1, 0.1607843, 0, 1,
-1.948116, -0.182209, -2.694811, 1, 0.1686275, 0, 1,
-1.938856, 1.819047, -1.137379, 1, 0.172549, 0, 1,
-1.936385, 0.172881, -0.6589004, 1, 0.1803922, 0, 1,
-1.935687, -0.9566824, 0.1346426, 1, 0.1843137, 0, 1,
-1.884387, 1.538595, -2.152528, 1, 0.1921569, 0, 1,
-1.860476, -0.682285, -2.020954, 1, 0.1960784, 0, 1,
-1.85217, -1.223552, -1.925121, 1, 0.2039216, 0, 1,
-1.837668, 0.9264883, -1.248516, 1, 0.2117647, 0, 1,
-1.821894, -1.289608, -2.600106, 1, 0.2156863, 0, 1,
-1.802922, -0.2887058, -2.95348, 1, 0.2235294, 0, 1,
-1.782693, -0.1366595, -1.362649, 1, 0.227451, 0, 1,
-1.780421, -1.303472, -2.536726, 1, 0.2352941, 0, 1,
-1.774923, 0.2216856, -1.320403, 1, 0.2392157, 0, 1,
-1.770344, 0.8321747, -2.416324, 1, 0.2470588, 0, 1,
-1.733395, -0.3632373, -2.69852, 1, 0.2509804, 0, 1,
-1.733391, -0.08599541, -2.742269, 1, 0.2588235, 0, 1,
-1.732679, -0.9474465, -0.8891341, 1, 0.2627451, 0, 1,
-1.732656, 1.826329, -2.245314, 1, 0.2705882, 0, 1,
-1.69997, -0.7229235, -0.9593544, 1, 0.2745098, 0, 1,
-1.688531, 0.04111334, -4.038894, 1, 0.282353, 0, 1,
-1.687199, 0.4199793, -0.07704154, 1, 0.2862745, 0, 1,
-1.678572, 0.1843517, -0.05156501, 1, 0.2941177, 0, 1,
-1.669547, -0.02635087, -1.451883, 1, 0.3019608, 0, 1,
-1.662432, -0.07471611, -1.360754, 1, 0.3058824, 0, 1,
-1.657145, -0.2385727, -3.15747, 1, 0.3137255, 0, 1,
-1.63582, -0.09809867, -2.300425, 1, 0.3176471, 0, 1,
-1.621435, 0.8382324, 0.07498454, 1, 0.3254902, 0, 1,
-1.6168, 0.8878686, -1.745559, 1, 0.3294118, 0, 1,
-1.584399, 0.5142855, 0.09176826, 1, 0.3372549, 0, 1,
-1.568771, -0.701819, -2.759417, 1, 0.3411765, 0, 1,
-1.562388, -0.954669, -2.922888, 1, 0.3490196, 0, 1,
-1.561114, 3.207274, -0.4069958, 1, 0.3529412, 0, 1,
-1.558135, 0.09016085, -0.9085818, 1, 0.3607843, 0, 1,
-1.555999, -0.1949214, -2.530218, 1, 0.3647059, 0, 1,
-1.555779, -1.37674, -1.224695, 1, 0.372549, 0, 1,
-1.550113, 1.358096, -0.1784811, 1, 0.3764706, 0, 1,
-1.540493, 1.005475, -1.474608, 1, 0.3843137, 0, 1,
-1.540401, 0.2713779, -1.795705, 1, 0.3882353, 0, 1,
-1.524361, 0.4747681, -1.395477, 1, 0.3960784, 0, 1,
-1.519012, -1.441758, -1.253664, 1, 0.4039216, 0, 1,
-1.509862, -0.8432776, -1.766981, 1, 0.4078431, 0, 1,
-1.507975, -0.4828078, -2.565439, 1, 0.4156863, 0, 1,
-1.490116, 1.021254, -2.13709, 1, 0.4196078, 0, 1,
-1.487024, 1.059765, -1.344723, 1, 0.427451, 0, 1,
-1.465614, 1.292861, -0.612266, 1, 0.4313726, 0, 1,
-1.460217, -0.0340905, -1.497008, 1, 0.4392157, 0, 1,
-1.450102, -0.1187428, -2.094473, 1, 0.4431373, 0, 1,
-1.448878, 0.5138378, -2.071138, 1, 0.4509804, 0, 1,
-1.442291, 0.4778008, -0.4542719, 1, 0.454902, 0, 1,
-1.42674, -0.2140853, -1.205833, 1, 0.4627451, 0, 1,
-1.420897, -1.095374, -2.001925, 1, 0.4666667, 0, 1,
-1.417023, -0.3152851, -1.47223, 1, 0.4745098, 0, 1,
-1.412557, 0.9014876, -1.795854, 1, 0.4784314, 0, 1,
-1.412461, -1.255186, -1.841539, 1, 0.4862745, 0, 1,
-1.405439, -0.4692951, -2.408327, 1, 0.4901961, 0, 1,
-1.399441, 0.4330453, -1.541348, 1, 0.4980392, 0, 1,
-1.39282, -0.3494687, -3.442216, 1, 0.5058824, 0, 1,
-1.38202, 1.011002, -0.1163111, 1, 0.509804, 0, 1,
-1.366072, -0.2301808, -0.5849914, 1, 0.5176471, 0, 1,
-1.364491, 0.007171857, -1.617006, 1, 0.5215687, 0, 1,
-1.361094, 0.8389626, -0.9023195, 1, 0.5294118, 0, 1,
-1.356036, 0.05423268, -0.1682317, 1, 0.5333334, 0, 1,
-1.343099, 0.5846595, -2.794212, 1, 0.5411765, 0, 1,
-1.341918, -1.703607, -2.011283, 1, 0.5450981, 0, 1,
-1.338008, 0.1761543, -1.229255, 1, 0.5529412, 0, 1,
-1.333035, 1.338002, 0.0835517, 1, 0.5568628, 0, 1,
-1.330169, -0.2076072, -1.363804, 1, 0.5647059, 0, 1,
-1.319428, 0.3121633, -0.8522246, 1, 0.5686275, 0, 1,
-1.319155, 1.191813, -0.5768946, 1, 0.5764706, 0, 1,
-1.302785, 0.9688963, -2.491667, 1, 0.5803922, 0, 1,
-1.299564, 0.5414388, -0.7517289, 1, 0.5882353, 0, 1,
-1.29939, 0.675872, -1.218183, 1, 0.5921569, 0, 1,
-1.297009, -0.399066, -0.5346568, 1, 0.6, 0, 1,
-1.293426, 0.002678805, -2.212593, 1, 0.6078432, 0, 1,
-1.290297, 0.6793805, -0.2456587, 1, 0.6117647, 0, 1,
-1.288357, -0.7447839, -2.607456, 1, 0.6196079, 0, 1,
-1.285591, 0.7963387, -1.267045, 1, 0.6235294, 0, 1,
-1.279092, 0.1074968, -0.4869863, 1, 0.6313726, 0, 1,
-1.275558, -0.7733451, -2.121325, 1, 0.6352941, 0, 1,
-1.266809, 0.07859311, -1.535372, 1, 0.6431373, 0, 1,
-1.259444, -0.9254733, -1.07708, 1, 0.6470588, 0, 1,
-1.258327, 1.221685, -0.9831145, 1, 0.654902, 0, 1,
-1.248431, -1.70324, -0.7583183, 1, 0.6588235, 0, 1,
-1.221565, 0.3596147, -2.887921, 1, 0.6666667, 0, 1,
-1.210146, -0.3252043, -2.573498, 1, 0.6705883, 0, 1,
-1.20644, -1.683184, -1.260974, 1, 0.6784314, 0, 1,
-1.202652, -0.6161612, -2.931396, 1, 0.682353, 0, 1,
-1.197819, -0.6900951, -4.40198, 1, 0.6901961, 0, 1,
-1.195166, -0.2950257, -1.31652, 1, 0.6941177, 0, 1,
-1.195086, -1.439283, -3.204105, 1, 0.7019608, 0, 1,
-1.191589, -0.3382834, -1.144737, 1, 0.7098039, 0, 1,
-1.182619, -0.5181782, -1.599506, 1, 0.7137255, 0, 1,
-1.179972, 0.1286037, -1.754339, 1, 0.7215686, 0, 1,
-1.175416, -0.4555203, -1.70571, 1, 0.7254902, 0, 1,
-1.17432, -0.1750968, -2.104641, 1, 0.7333333, 0, 1,
-1.173621, 1.096169, -2.156069, 1, 0.7372549, 0, 1,
-1.168501, 1.46465, -2.204448, 1, 0.7450981, 0, 1,
-1.16493, 1.655733, 1.704807, 1, 0.7490196, 0, 1,
-1.160501, -0.0644862, 0.1572918, 1, 0.7568628, 0, 1,
-1.159696, 0.05454074, -3.607279, 1, 0.7607843, 0, 1,
-1.15434, -0.5577206, -1.827768, 1, 0.7686275, 0, 1,
-1.152941, 1.089059, -1.288816, 1, 0.772549, 0, 1,
-1.150844, 0.9903889, -2.099664, 1, 0.7803922, 0, 1,
-1.146723, -0.1380862, -2.078929, 1, 0.7843137, 0, 1,
-1.146041, -1.200034, -1.820216, 1, 0.7921569, 0, 1,
-1.143596, -1.784278, -2.822989, 1, 0.7960784, 0, 1,
-1.136871, -2.014181, -1.900326, 1, 0.8039216, 0, 1,
-1.136524, -1.015107, -1.21744, 1, 0.8117647, 0, 1,
-1.121722, -0.9265131, -2.017693, 1, 0.8156863, 0, 1,
-1.119764, -0.346867, -2.223328, 1, 0.8235294, 0, 1,
-1.115981, 1.394532, -0.03220937, 1, 0.827451, 0, 1,
-1.115814, -0.2139677, -2.260579, 1, 0.8352941, 0, 1,
-1.106733, 0.9039963, -0.6684054, 1, 0.8392157, 0, 1,
-1.100962, 1.378997, 1.936046, 1, 0.8470588, 0, 1,
-1.092839, -1.116149, -2.248016, 1, 0.8509804, 0, 1,
-1.085349, -1.225477, -0.9966772, 1, 0.8588235, 0, 1,
-1.077772, -0.236045, -3.749521, 1, 0.8627451, 0, 1,
-1.076349, 1.382723, 1.616827, 1, 0.8705882, 0, 1,
-1.073828, 0.4387679, -2.356719, 1, 0.8745098, 0, 1,
-1.065705, 0.1588042, -1.434553, 1, 0.8823529, 0, 1,
-1.060147, 0.2336913, -0.07848421, 1, 0.8862745, 0, 1,
-1.054878, 1.058039, -1.750306, 1, 0.8941177, 0, 1,
-1.049896, -0.663637, -2.922331, 1, 0.8980392, 0, 1,
-1.042767, 0.9874949, -1.877375, 1, 0.9058824, 0, 1,
-1.042596, 0.04965527, -1.071824, 1, 0.9137255, 0, 1,
-1.040373, -0.5187654, -0.8607276, 1, 0.9176471, 0, 1,
-1.040338, -1.00791, -4.091958, 1, 0.9254902, 0, 1,
-1.039117, 0.4228522, 0.2730845, 1, 0.9294118, 0, 1,
-1.027323, -1.407861, -3.405418, 1, 0.9372549, 0, 1,
-1.024392, -1.667474, -4.082247, 1, 0.9411765, 0, 1,
-1.023721, -0.9705479, -4.000141, 1, 0.9490196, 0, 1,
-1.023244, 0.4720631, -2.068535, 1, 0.9529412, 0, 1,
-1.01734, 1.469105, -2.286873, 1, 0.9607843, 0, 1,
-1.013697, -1.149086, -3.86993, 1, 0.9647059, 0, 1,
-1.007258, -0.361093, 0.4062164, 1, 0.972549, 0, 1,
-1.000291, 0.470831, -2.886525, 1, 0.9764706, 0, 1,
-0.9984567, 0.3970227, 0.03178915, 1, 0.9843137, 0, 1,
-0.9977861, -0.6403487, -2.614284, 1, 0.9882353, 0, 1,
-0.9922641, 1.060094, 0.5511444, 1, 0.9960784, 0, 1,
-0.9908373, -0.4997681, -0.8878918, 0.9960784, 1, 0, 1,
-0.9862401, 0.7476947, -1.666093, 0.9921569, 1, 0, 1,
-0.9858255, 1.70183, -0.1495264, 0.9843137, 1, 0, 1,
-0.9657835, 0.1911637, -1.868552, 0.9803922, 1, 0, 1,
-0.9650389, -1.364194, -2.905116, 0.972549, 1, 0, 1,
-0.9638572, 1.061606, -0.3285587, 0.9686275, 1, 0, 1,
-0.9569469, -0.208319, -2.519509, 0.9607843, 1, 0, 1,
-0.9390707, 1.078552, -1.19608, 0.9568627, 1, 0, 1,
-0.9361202, 0.6524402, 0.2350895, 0.9490196, 1, 0, 1,
-0.9348498, 0.5419863, -0.9865259, 0.945098, 1, 0, 1,
-0.9344724, 0.5183877, -0.2234878, 0.9372549, 1, 0, 1,
-0.9318904, 1.192922, -2.057599, 0.9333333, 1, 0, 1,
-0.9284515, -1.124858, -3.430453, 0.9254902, 1, 0, 1,
-0.9281445, 0.4872222, -0.674984, 0.9215686, 1, 0, 1,
-0.9271923, 1.015353, -1.038828, 0.9137255, 1, 0, 1,
-0.9254079, -0.7360232, 0.8732027, 0.9098039, 1, 0, 1,
-0.9242985, -0.6959807, -1.995732, 0.9019608, 1, 0, 1,
-0.9216657, 0.7384651, 1.212612, 0.8941177, 1, 0, 1,
-0.9216086, -0.1140483, -1.231681, 0.8901961, 1, 0, 1,
-0.9184467, 2.893877, -0.7155057, 0.8823529, 1, 0, 1,
-0.9140554, 1.040955, -1.413609, 0.8784314, 1, 0, 1,
-0.9136636, -1.130201, -2.453489, 0.8705882, 1, 0, 1,
-0.9083093, -0.5832326, -1.817729, 0.8666667, 1, 0, 1,
-0.9017304, 0.4469258, -1.130703, 0.8588235, 1, 0, 1,
-0.9010695, 2.278103, -0.7432655, 0.854902, 1, 0, 1,
-0.90071, 2.188492, 0.005710948, 0.8470588, 1, 0, 1,
-0.8985484, -0.798658, -3.259631, 0.8431373, 1, 0, 1,
-0.8925594, 1.493364, -1.997864, 0.8352941, 1, 0, 1,
-0.8922254, 0.8258953, -2.430144, 0.8313726, 1, 0, 1,
-0.8862361, 0.877906, -1.137002, 0.8235294, 1, 0, 1,
-0.8800244, -0.07022845, -2.052449, 0.8196079, 1, 0, 1,
-0.8775031, -0.3390101, -3.001753, 0.8117647, 1, 0, 1,
-0.8739036, -1.610799, -2.53145, 0.8078431, 1, 0, 1,
-0.8736291, -0.1004522, -2.922693, 0.8, 1, 0, 1,
-0.8733504, 1.224769, -0.08344685, 0.7921569, 1, 0, 1,
-0.8661335, 0.2347203, -2.370407, 0.7882353, 1, 0, 1,
-0.8635195, 1.320569, -1.114555, 0.7803922, 1, 0, 1,
-0.859592, 0.8744352, -3.067933, 0.7764706, 1, 0, 1,
-0.8587921, -0.7336963, -2.173549, 0.7686275, 1, 0, 1,
-0.8559894, -0.8602523, -3.483113, 0.7647059, 1, 0, 1,
-0.8536192, 1.300978, -1.143999, 0.7568628, 1, 0, 1,
-0.841334, -0.04632295, -2.508742, 0.7529412, 1, 0, 1,
-0.8393226, -1.096326, -2.803012, 0.7450981, 1, 0, 1,
-0.8378193, -0.4072319, -1.873955, 0.7411765, 1, 0, 1,
-0.8326828, 0.1372177, -0.8022158, 0.7333333, 1, 0, 1,
-0.829522, -0.6412288, -1.808108, 0.7294118, 1, 0, 1,
-0.82392, -1.173561, -2.925277, 0.7215686, 1, 0, 1,
-0.8198848, -1.463942, -2.587717, 0.7176471, 1, 0, 1,
-0.8141267, -0.9872403, -1.884649, 0.7098039, 1, 0, 1,
-0.8137957, -0.2130718, -1.722143, 0.7058824, 1, 0, 1,
-0.8117469, 0.4244237, -0.8400978, 0.6980392, 1, 0, 1,
-0.8094046, 1.295375, -1.847795, 0.6901961, 1, 0, 1,
-0.8049057, 1.686915, 0.7171112, 0.6862745, 1, 0, 1,
-0.794578, 0.9211722, 0.03366753, 0.6784314, 1, 0, 1,
-0.7849546, -0.5769179, -0.2056439, 0.6745098, 1, 0, 1,
-0.7796588, 0.7873412, -0.1724651, 0.6666667, 1, 0, 1,
-0.7751206, -0.6804746, -2.837041, 0.6627451, 1, 0, 1,
-0.7737007, 0.2318428, -1.114642, 0.654902, 1, 0, 1,
-0.7691939, 0.541716, -1.85755, 0.6509804, 1, 0, 1,
-0.7691589, -0.3870956, -1.684233, 0.6431373, 1, 0, 1,
-0.7651893, -0.3614313, -2.607431, 0.6392157, 1, 0, 1,
-0.7640468, -0.4873387, -2.337571, 0.6313726, 1, 0, 1,
-0.7621663, -0.6541275, -2.14319, 0.627451, 1, 0, 1,
-0.7621097, -0.9389761, -1.524516, 0.6196079, 1, 0, 1,
-0.7593231, 0.6493816, -0.7186931, 0.6156863, 1, 0, 1,
-0.7572275, -1.16093, -3.002922, 0.6078432, 1, 0, 1,
-0.7570965, -0.624303, -4.012613, 0.6039216, 1, 0, 1,
-0.7468646, 0.7969501, -0.7881339, 0.5960785, 1, 0, 1,
-0.7382038, -1.364982, -3.196933, 0.5882353, 1, 0, 1,
-0.7372184, 1.337896, -0.05038916, 0.5843138, 1, 0, 1,
-0.7349817, 0.7290927, -0.9469326, 0.5764706, 1, 0, 1,
-0.7334176, -0.5320491, -0.8353658, 0.572549, 1, 0, 1,
-0.7318139, -0.3826231, -2.292165, 0.5647059, 1, 0, 1,
-0.7307186, 1.80344, -0.8360214, 0.5607843, 1, 0, 1,
-0.7284741, 0.1512153, -0.09591975, 0.5529412, 1, 0, 1,
-0.7272114, 1.237346, -0.550649, 0.5490196, 1, 0, 1,
-0.7248789, 0.7152714, -1.249268, 0.5411765, 1, 0, 1,
-0.7247115, -1.49683, -3.81958, 0.5372549, 1, 0, 1,
-0.7215596, 0.3597153, -1.812491, 0.5294118, 1, 0, 1,
-0.7178806, 0.6759245, 1.177917, 0.5254902, 1, 0, 1,
-0.7163376, -1.015592, -2.654822, 0.5176471, 1, 0, 1,
-0.7154776, -0.5888258, -2.756102, 0.5137255, 1, 0, 1,
-0.695954, -1.015732, -3.305153, 0.5058824, 1, 0, 1,
-0.6959253, 0.5221667, -0.951124, 0.5019608, 1, 0, 1,
-0.6716173, -0.06844172, -1.866959, 0.4941176, 1, 0, 1,
-0.6648748, 0.8061538, -1.274011, 0.4862745, 1, 0, 1,
-0.6620572, 0.57588, -2.639485, 0.4823529, 1, 0, 1,
-0.6614748, 0.5708959, -0.340427, 0.4745098, 1, 0, 1,
-0.6594601, 0.6609319, -0.6319309, 0.4705882, 1, 0, 1,
-0.6577377, -2.103641, -3.25714, 0.4627451, 1, 0, 1,
-0.6575806, -2.691149, -4.58868, 0.4588235, 1, 0, 1,
-0.654608, 0.6777906, -1.149832, 0.4509804, 1, 0, 1,
-0.6540308, -0.5601616, -4.045757, 0.4470588, 1, 0, 1,
-0.64705, 0.1349747, -0.7206449, 0.4392157, 1, 0, 1,
-0.6464349, -1.392763, -1.909387, 0.4352941, 1, 0, 1,
-0.6433701, 0.8953533, -1.278421, 0.427451, 1, 0, 1,
-0.6420209, 1.587096, 0.6641444, 0.4235294, 1, 0, 1,
-0.6410007, 0.9352779, 0.7143828, 0.4156863, 1, 0, 1,
-0.6389929, 0.04028933, -1.993571, 0.4117647, 1, 0, 1,
-0.6353238, -1.095889, -1.384639, 0.4039216, 1, 0, 1,
-0.634043, -0.7551627, -2.026081, 0.3960784, 1, 0, 1,
-0.6318912, 0.2545705, -1.656718, 0.3921569, 1, 0, 1,
-0.6288062, 0.3459954, -1.339032, 0.3843137, 1, 0, 1,
-0.6278738, 0.3113808, -2.608266, 0.3803922, 1, 0, 1,
-0.6276944, -0.2318234, -2.862213, 0.372549, 1, 0, 1,
-0.6267363, 0.1444569, 0.6828518, 0.3686275, 1, 0, 1,
-0.6255653, -0.3170846, -1.61399, 0.3607843, 1, 0, 1,
-0.6226882, 2.638805, -0.4219016, 0.3568628, 1, 0, 1,
-0.621594, -0.5271037, -1.803002, 0.3490196, 1, 0, 1,
-0.6191083, -0.3484491, -1.548255, 0.345098, 1, 0, 1,
-0.6143596, -3.617556, -4.361322, 0.3372549, 1, 0, 1,
-0.6044778, 0.9276652, -1.187911, 0.3333333, 1, 0, 1,
-0.6032371, 0.6396964, -0.4185832, 0.3254902, 1, 0, 1,
-0.6021925, -1.268414, -4.18724, 0.3215686, 1, 0, 1,
-0.601605, -1.731172, -4.56445, 0.3137255, 1, 0, 1,
-0.5973442, 1.620032, 0.2389611, 0.3098039, 1, 0, 1,
-0.5962815, -0.7196801, -1.384862, 0.3019608, 1, 0, 1,
-0.5957382, 0.1745483, -0.5665301, 0.2941177, 1, 0, 1,
-0.59532, 0.8019797, -1.125919, 0.2901961, 1, 0, 1,
-0.5952318, 0.8842005, -0.9883287, 0.282353, 1, 0, 1,
-0.592097, 0.007063945, -3.235374, 0.2784314, 1, 0, 1,
-0.5909802, -0.5095885, -3.0172, 0.2705882, 1, 0, 1,
-0.5890301, -1.480503, -2.61466, 0.2666667, 1, 0, 1,
-0.5885648, -2.133478, -2.296142, 0.2588235, 1, 0, 1,
-0.5881663, 0.8784867, -2.309476, 0.254902, 1, 0, 1,
-0.580324, -0.8456536, -1.505444, 0.2470588, 1, 0, 1,
-0.5786961, -0.2528365, -2.064926, 0.2431373, 1, 0, 1,
-0.5775504, 0.222952, -1.155184, 0.2352941, 1, 0, 1,
-0.576755, -1.060993, -2.461325, 0.2313726, 1, 0, 1,
-0.5719241, 0.3911623, -0.3586141, 0.2235294, 1, 0, 1,
-0.5715236, 0.8501858, -0.389464, 0.2196078, 1, 0, 1,
-0.5711493, -0.401135, -1.511225, 0.2117647, 1, 0, 1,
-0.5690886, 1.800385, -0.5421536, 0.2078431, 1, 0, 1,
-0.5643274, -1.233589, -3.647618, 0.2, 1, 0, 1,
-0.5598806, -0.06487962, -1.906508, 0.1921569, 1, 0, 1,
-0.558488, 0.4178775, -1.050306, 0.1882353, 1, 0, 1,
-0.5572541, 0.3293297, -3.210701, 0.1803922, 1, 0, 1,
-0.5534422, 1.451569, -0.4673923, 0.1764706, 1, 0, 1,
-0.5484521, -0.01432634, 0.7533057, 0.1686275, 1, 0, 1,
-0.5459679, 0.7145353, -0.7353491, 0.1647059, 1, 0, 1,
-0.543398, 1.11409, -1.18141, 0.1568628, 1, 0, 1,
-0.5348943, 2.085207, 0.007423469, 0.1529412, 1, 0, 1,
-0.5341453, -1.127317, -2.092712, 0.145098, 1, 0, 1,
-0.5336887, 1.406823, 0.5921347, 0.1411765, 1, 0, 1,
-0.5285042, 0.6762503, -0.5072928, 0.1333333, 1, 0, 1,
-0.5241315, -0.5191979, -2.586016, 0.1294118, 1, 0, 1,
-0.5171243, 0.2687082, 0.7931827, 0.1215686, 1, 0, 1,
-0.5146697, 0.03101316, -3.077576, 0.1176471, 1, 0, 1,
-0.5138629, 0.9513789, 0.7449988, 0.1098039, 1, 0, 1,
-0.5096758, -0.5923051, -3.092573, 0.1058824, 1, 0, 1,
-0.5025326, -0.1941384, -0.7079424, 0.09803922, 1, 0, 1,
-0.5000789, 0.7024598, 0.9626868, 0.09019608, 1, 0, 1,
-0.4994434, 0.766932, -2.320662, 0.08627451, 1, 0, 1,
-0.4975341, -0.5224321, -2.754733, 0.07843138, 1, 0, 1,
-0.4969912, -0.5698557, -4.82017, 0.07450981, 1, 0, 1,
-0.49467, -0.4729333, -1.20985, 0.06666667, 1, 0, 1,
-0.4945394, 0.1982371, -1.603436, 0.0627451, 1, 0, 1,
-0.4943328, 0.3425191, 0.7676885, 0.05490196, 1, 0, 1,
-0.4907464, -0.2504999, -0.8331029, 0.05098039, 1, 0, 1,
-0.4888513, -0.3985558, -4.063526, 0.04313726, 1, 0, 1,
-0.4858466, -0.6420041, -1.015666, 0.03921569, 1, 0, 1,
-0.4828999, 0.1959752, -1.183371, 0.03137255, 1, 0, 1,
-0.4762968, 0.4676805, -1.154729, 0.02745098, 1, 0, 1,
-0.4752982, -0.5398148, -3.41905, 0.01960784, 1, 0, 1,
-0.4750419, 0.2652414, -1.350324, 0.01568628, 1, 0, 1,
-0.4732842, 0.5717885, -0.9250236, 0.007843138, 1, 0, 1,
-0.4723782, -1.554085, -3.331473, 0.003921569, 1, 0, 1,
-0.4681664, 0.3069712, -0.8460682, 0, 1, 0.003921569, 1,
-0.4668505, 0.2396106, -0.6770998, 0, 1, 0.01176471, 1,
-0.4658223, 1.654379, 0.5421894, 0, 1, 0.01568628, 1,
-0.4653513, -0.1069289, -1.609905, 0, 1, 0.02352941, 1,
-0.4624512, -0.1673898, -2.940209, 0, 1, 0.02745098, 1,
-0.4616334, -1.295477, -5.319083, 0, 1, 0.03529412, 1,
-0.4600108, 1.072154, -3.100707, 0, 1, 0.03921569, 1,
-0.4595633, -0.3042158, -2.597203, 0, 1, 0.04705882, 1,
-0.4589806, 0.9278961, -0.6639276, 0, 1, 0.05098039, 1,
-0.4588508, -0.3139809, -2.532574, 0, 1, 0.05882353, 1,
-0.457119, 0.07860814, -1.075164, 0, 1, 0.0627451, 1,
-0.4560655, -0.04284092, -2.300487, 0, 1, 0.07058824, 1,
-0.4517294, -1.408481, -4.185891, 0, 1, 0.07450981, 1,
-0.4501056, -1.018932, -4.092014, 0, 1, 0.08235294, 1,
-0.4477978, -0.06904081, -3.616714, 0, 1, 0.08627451, 1,
-0.4459364, -0.752122, -2.502886, 0, 1, 0.09411765, 1,
-0.4431327, 0.8835726, -0.3096499, 0, 1, 0.1019608, 1,
-0.4425808, -0.3162233, -2.107684, 0, 1, 0.1058824, 1,
-0.4421521, 0.3438121, -1.035498, 0, 1, 0.1137255, 1,
-0.4407128, 0.4706196, -2.185539, 0, 1, 0.1176471, 1,
-0.4395956, -0.7641749, -3.473568, 0, 1, 0.1254902, 1,
-0.4381867, -0.8097905, -3.142234, 0, 1, 0.1294118, 1,
-0.4374299, 0.07430671, -1.873382, 0, 1, 0.1372549, 1,
-0.4056324, -1.122812, -3.017473, 0, 1, 0.1411765, 1,
-0.4038436, -0.8479541, -2.153958, 0, 1, 0.1490196, 1,
-0.4014862, 0.3948001, -0.6989219, 0, 1, 0.1529412, 1,
-0.3994111, 0.8260928, -0.1937871, 0, 1, 0.1607843, 1,
-0.3969589, 1.486111, -0.3986966, 0, 1, 0.1647059, 1,
-0.3949588, 0.1647622, -0.8213074, 0, 1, 0.172549, 1,
-0.3910165, -0.2211748, -4.017538, 0, 1, 0.1764706, 1,
-0.3839729, 1.015492, 1.411496, 0, 1, 0.1843137, 1,
-0.3796572, 0.1174401, -1.934736, 0, 1, 0.1882353, 1,
-0.3785021, 0.1223126, -0.3113748, 0, 1, 0.1960784, 1,
-0.3784703, -1.776484, -4.975613, 0, 1, 0.2039216, 1,
-0.3784442, -0.9256106, -2.979097, 0, 1, 0.2078431, 1,
-0.3753324, 0.2679836, -1.294094, 0, 1, 0.2156863, 1,
-0.3704574, 0.9740923, -0.4030714, 0, 1, 0.2196078, 1,
-0.366112, 0.1766735, -1.76792, 0, 1, 0.227451, 1,
-0.3608644, 1.071607, 0.3174527, 0, 1, 0.2313726, 1,
-0.3564565, -0.3471476, -3.197601, 0, 1, 0.2392157, 1,
-0.3548274, 2.067713, 0.7189484, 0, 1, 0.2431373, 1,
-0.3538973, -0.2958754, -2.465657, 0, 1, 0.2509804, 1,
-0.3508657, -1.882801, -2.718472, 0, 1, 0.254902, 1,
-0.3494171, 0.4106641, -3.620562, 0, 1, 0.2627451, 1,
-0.3489137, 1.120624, 1.252142, 0, 1, 0.2666667, 1,
-0.3475675, -0.2242253, -1.036052, 0, 1, 0.2745098, 1,
-0.3457945, 2.560068, -0.6632181, 0, 1, 0.2784314, 1,
-0.3437584, -0.6978185, -3.034888, 0, 1, 0.2862745, 1,
-0.343242, 0.2257761, 0.0676615, 0, 1, 0.2901961, 1,
-0.3392104, 0.6545857, -0.5703204, 0, 1, 0.2980392, 1,
-0.3388643, -0.8592282, -3.266575, 0, 1, 0.3058824, 1,
-0.3386528, -3.02046, -3.631977, 0, 1, 0.3098039, 1,
-0.3376149, 0.8222725, -1.441276, 0, 1, 0.3176471, 1,
-0.3320766, -1.419961, -3.91683, 0, 1, 0.3215686, 1,
-0.3292956, -0.5164478, -2.891588, 0, 1, 0.3294118, 1,
-0.3280757, 0.8248307, 1.814687, 0, 1, 0.3333333, 1,
-0.3266377, -0.5849928, -3.997213, 0, 1, 0.3411765, 1,
-0.32568, 0.1521696, -1.076521, 0, 1, 0.345098, 1,
-0.3210505, 0.1052042, 0.6264051, 0, 1, 0.3529412, 1,
-0.3202336, 0.9863643, -0.9060255, 0, 1, 0.3568628, 1,
-0.3197825, -1.293203, -2.4881, 0, 1, 0.3647059, 1,
-0.3191708, 2.759182, -0.1802195, 0, 1, 0.3686275, 1,
-0.3149923, -1.599717, -4.273766, 0, 1, 0.3764706, 1,
-0.3111955, 1.115787, -1.75669, 0, 1, 0.3803922, 1,
-0.3081934, 0.7048631, -0.2105426, 0, 1, 0.3882353, 1,
-0.3050974, 0.337567, -0.4175061, 0, 1, 0.3921569, 1,
-0.3048627, 2.470803, -0.3966024, 0, 1, 0.4, 1,
-0.3030768, -0.03444054, -1.86611, 0, 1, 0.4078431, 1,
-0.2965882, -0.4834034, -3.00839, 0, 1, 0.4117647, 1,
-0.2956193, 0.5284168, -0.313513, 0, 1, 0.4196078, 1,
-0.2920879, -1.422707, -2.050165, 0, 1, 0.4235294, 1,
-0.290318, 2.938155, -0.2845908, 0, 1, 0.4313726, 1,
-0.2898736, -0.2101065, -2.529992, 0, 1, 0.4352941, 1,
-0.2873464, -0.5286298, -3.421276, 0, 1, 0.4431373, 1,
-0.281787, 1.224687, -0.9322212, 0, 1, 0.4470588, 1,
-0.2814758, -0.6300855, -2.395085, 0, 1, 0.454902, 1,
-0.2640528, 0.3059775, 0.6656255, 0, 1, 0.4588235, 1,
-0.2631847, -1.698525, -2.306494, 0, 1, 0.4666667, 1,
-0.2630683, 0.3149249, -1.943197, 0, 1, 0.4705882, 1,
-0.2597032, -0.3758053, -1.712625, 0, 1, 0.4784314, 1,
-0.2549563, -0.3756139, -2.860836, 0, 1, 0.4823529, 1,
-0.2539624, -0.5839298, -3.635406, 0, 1, 0.4901961, 1,
-0.2535639, 0.6268461, -0.1686949, 0, 1, 0.4941176, 1,
-0.2525509, 0.5907416, 0.07643645, 0, 1, 0.5019608, 1,
-0.2509185, 0.2158117, 0.5987319, 0, 1, 0.509804, 1,
-0.2506495, 0.004088421, -0.5966272, 0, 1, 0.5137255, 1,
-0.2482306, -2.73292, -2.986376, 0, 1, 0.5215687, 1,
-0.242245, 0.3713712, -2.201778, 0, 1, 0.5254902, 1,
-0.2331028, -0.4667146, -2.63209, 0, 1, 0.5333334, 1,
-0.2323883, -0.3028825, -3.291034, 0, 1, 0.5372549, 1,
-0.2300912, -0.6844709, -3.651394, 0, 1, 0.5450981, 1,
-0.2285186, 0.2244124, -2.47999, 0, 1, 0.5490196, 1,
-0.2281602, 1.067294, -0.1215808, 0, 1, 0.5568628, 1,
-0.2175515, -1.197048, -2.328555, 0, 1, 0.5607843, 1,
-0.2169188, -0.04417817, -0.7522468, 0, 1, 0.5686275, 1,
-0.2134632, 0.2306358, 0.006322434, 0, 1, 0.572549, 1,
-0.2131511, -1.153507, -3.249461, 0, 1, 0.5803922, 1,
-0.2075515, 1.775674, -0.7546381, 0, 1, 0.5843138, 1,
-0.2034915, -2.089818, -4.618743, 0, 1, 0.5921569, 1,
-0.2033011, -0.4063009, -3.154476, 0, 1, 0.5960785, 1,
-0.201286, -0.6806237, -1.950568, 0, 1, 0.6039216, 1,
-0.2006442, -0.6316414, -2.341455, 0, 1, 0.6117647, 1,
-0.2002047, 0.5533565, -2.308077, 0, 1, 0.6156863, 1,
-0.2000311, 0.3167639, -0.2047927, 0, 1, 0.6235294, 1,
-0.1990337, 2.093787, -0.8183239, 0, 1, 0.627451, 1,
-0.1953158, 0.8791378, 0.4047791, 0, 1, 0.6352941, 1,
-0.1905833, -0.4779477, -2.302478, 0, 1, 0.6392157, 1,
-0.1883267, -0.4765667, -1.619669, 0, 1, 0.6470588, 1,
-0.1883168, -0.8464248, -1.874897, 0, 1, 0.6509804, 1,
-0.1860565, -0.6750531, -2.641208, 0, 1, 0.6588235, 1,
-0.1851074, 1.608255, -0.08990088, 0, 1, 0.6627451, 1,
-0.1824587, -0.7056994, -1.901019, 0, 1, 0.6705883, 1,
-0.1775833, -0.01728896, -1.065763, 0, 1, 0.6745098, 1,
-0.1774709, -1.457602, -2.67316, 0, 1, 0.682353, 1,
-0.1773323, -0.1303364, -0.8332646, 0, 1, 0.6862745, 1,
-0.1767395, -0.1423904, -3.535793, 0, 1, 0.6941177, 1,
-0.1765969, 0.06416705, -1.291999, 0, 1, 0.7019608, 1,
-0.1742885, 0.5852051, -0.05814666, 0, 1, 0.7058824, 1,
-0.1734326, 0.724675, 0.2468954, 0, 1, 0.7137255, 1,
-0.1712605, 0.9004846, 1.133648, 0, 1, 0.7176471, 1,
-0.1698426, 0.8228061, -0.8022513, 0, 1, 0.7254902, 1,
-0.1691161, 0.8400796, -0.1820981, 0, 1, 0.7294118, 1,
-0.1682729, -0.3549795, -2.482807, 0, 1, 0.7372549, 1,
-0.1680121, -0.2441546, -2.835533, 0, 1, 0.7411765, 1,
-0.1651461, -0.04533017, -2.880744, 0, 1, 0.7490196, 1,
-0.1643188, 0.2947827, -2.753948, 0, 1, 0.7529412, 1,
-0.1617209, 2.14975, -0.946941, 0, 1, 0.7607843, 1,
-0.1608884, 0.06489911, 0.3541787, 0, 1, 0.7647059, 1,
-0.1594092, 2.413163, -0.1177396, 0, 1, 0.772549, 1,
-0.1564505, -1.185909, -3.367147, 0, 1, 0.7764706, 1,
-0.1563434, -2.560585, -2.55719, 0, 1, 0.7843137, 1,
-0.1556474, 0.7978065, -0.9432637, 0, 1, 0.7882353, 1,
-0.1487185, -1.403197, -2.74043, 0, 1, 0.7960784, 1,
-0.1373026, -2.080765, -1.829453, 0, 1, 0.8039216, 1,
-0.1350553, -0.1687588, -3.342593, 0, 1, 0.8078431, 1,
-0.1335349, -0.7403588, -2.867867, 0, 1, 0.8156863, 1,
-0.1315471, 1.653117, 1.043527, 0, 1, 0.8196079, 1,
-0.130725, 0.6994966, 1.89145, 0, 1, 0.827451, 1,
-0.128649, -0.2762997, -3.374419, 0, 1, 0.8313726, 1,
-0.1253545, -0.887445, -2.636322, 0, 1, 0.8392157, 1,
-0.1234254, 2.598697, 0.1100411, 0, 1, 0.8431373, 1,
-0.1165551, -0.4419031, -1.286428, 0, 1, 0.8509804, 1,
-0.1136863, -0.1288244, -3.041197, 0, 1, 0.854902, 1,
-0.1118033, -1.229558, -3.046628, 0, 1, 0.8627451, 1,
-0.1084825, 0.1079119, -0.9947121, 0, 1, 0.8666667, 1,
-0.1011484, -0.221019, -2.373106, 0, 1, 0.8745098, 1,
-0.1005743, -0.5440622, -3.712925, 0, 1, 0.8784314, 1,
-0.09643038, 0.1435649, -0.3682722, 0, 1, 0.8862745, 1,
-0.09100777, -0.5590504, -3.195809, 0, 1, 0.8901961, 1,
-0.09089792, 0.9880895, -0.814522, 0, 1, 0.8980392, 1,
-0.08738489, -1.500592, -3.446412, 0, 1, 0.9058824, 1,
-0.08510714, -1.564156, -3.369037, 0, 1, 0.9098039, 1,
-0.08331818, -0.6374635, -3.32964, 0, 1, 0.9176471, 1,
-0.08175933, 0.09293339, -1.460112, 0, 1, 0.9215686, 1,
-0.08174368, 1.166764, 0.6966236, 0, 1, 0.9294118, 1,
-0.08121043, 0.3651063, -0.761301, 0, 1, 0.9333333, 1,
-0.0778081, -0.7003615, -3.604981, 0, 1, 0.9411765, 1,
-0.07363907, 0.3010279, 0.1142967, 0, 1, 0.945098, 1,
-0.07287786, -0.3805085, -2.370905, 0, 1, 0.9529412, 1,
-0.07177774, 1.74196, 0.8050203, 0, 1, 0.9568627, 1,
-0.06881878, -0.005877876, -3.983164, 0, 1, 0.9647059, 1,
-0.06875048, 0.08089626, -0.6051645, 0, 1, 0.9686275, 1,
-0.06776898, 0.5565982, -0.4833998, 0, 1, 0.9764706, 1,
-0.06333944, 1.05035, 1.167276, 0, 1, 0.9803922, 1,
-0.05405433, 0.6063562, 0.8307721, 0, 1, 0.9882353, 1,
-0.0531095, -0.1947904, -3.512861, 0, 1, 0.9921569, 1,
-0.05022109, -0.6428682, -3.027806, 0, 1, 1, 1,
-0.04941446, -1.18864, -2.362739, 0, 0.9921569, 1, 1,
-0.04895335, 1.519253, -0.494833, 0, 0.9882353, 1, 1,
-0.045522, -0.9009544, -2.328564, 0, 0.9803922, 1, 1,
-0.04433219, -0.1325568, -3.698926, 0, 0.9764706, 1, 1,
-0.04188122, 0.1848579, -2.510281, 0, 0.9686275, 1, 1,
-0.04036987, 1.197978, 0.4872375, 0, 0.9647059, 1, 1,
-0.03918048, 1.1136, 0.9509053, 0, 0.9568627, 1, 1,
-0.03773928, 1.03755, -0.613179, 0, 0.9529412, 1, 1,
-0.03530273, -2.258101, -3.174357, 0, 0.945098, 1, 1,
-0.03320032, 1.950286, -1.269567, 0, 0.9411765, 1, 1,
-0.03155351, 0.9066295, 1.151847, 0, 0.9333333, 1, 1,
-0.02934383, -0.5745248, -3.199573, 0, 0.9294118, 1, 1,
-0.02790438, 0.3877458, 0.4971289, 0, 0.9215686, 1, 1,
-0.02687216, -0.08614194, -1.871849, 0, 0.9176471, 1, 1,
-0.02675273, 0.05215493, -0.9215726, 0, 0.9098039, 1, 1,
-0.02449143, -0.5642869, -4.540241, 0, 0.9058824, 1, 1,
-0.02090104, 0.2606565, 0.4141473, 0, 0.8980392, 1, 1,
-0.01801909, 0.09884008, 0.04407652, 0, 0.8901961, 1, 1,
-0.01741003, 0.881239, -0.09802675, 0, 0.8862745, 1, 1,
-0.01739367, 1.026231, -0.2847844, 0, 0.8784314, 1, 1,
-0.01441654, 0.1773468, -0.5304034, 0, 0.8745098, 1, 1,
-0.01288829, 0.3330019, 0.4851167, 0, 0.8666667, 1, 1,
-0.01228598, 0.2961034, -1.404431, 0, 0.8627451, 1, 1,
-0.009586196, -0.850924, -2.055222, 0, 0.854902, 1, 1,
-0.004206824, -0.0695255, -2.397125, 0, 0.8509804, 1, 1,
0.002335739, 0.001395936, 0.5187941, 0, 0.8431373, 1, 1,
0.007257617, 0.2801812, 0.2548989, 0, 0.8392157, 1, 1,
0.0083537, -0.250136, 2.834597, 0, 0.8313726, 1, 1,
0.009757922, 0.3074999, -1.821392, 0, 0.827451, 1, 1,
0.01296243, -2.189325, 1.945959, 0, 0.8196079, 1, 1,
0.015045, -1.277658, 3.477341, 0, 0.8156863, 1, 1,
0.01820188, -0.2963336, 2.931946, 0, 0.8078431, 1, 1,
0.02042325, 0.05530479, 0.09164225, 0, 0.8039216, 1, 1,
0.02152571, 0.1509876, 0.7192034, 0, 0.7960784, 1, 1,
0.02203407, -0.7150868, 1.517423, 0, 0.7882353, 1, 1,
0.02351554, 0.3888008, 0.1372805, 0, 0.7843137, 1, 1,
0.02428808, -0.4249852, 5.516049, 0, 0.7764706, 1, 1,
0.02618753, 1.475603, -0.122363, 0, 0.772549, 1, 1,
0.02873922, 0.402256, 1.410462, 0, 0.7647059, 1, 1,
0.03057393, -0.5209457, 3.122551, 0, 0.7607843, 1, 1,
0.03476427, -1.074892, 2.888532, 0, 0.7529412, 1, 1,
0.03982493, -0.6629019, 5.238609, 0, 0.7490196, 1, 1,
0.04303727, -0.8254629, 4.020602, 0, 0.7411765, 1, 1,
0.05373831, 1.02848, -1.589436, 0, 0.7372549, 1, 1,
0.0648855, -1.685141, 1.140652, 0, 0.7294118, 1, 1,
0.0649101, 0.11788, -0.2052315, 0, 0.7254902, 1, 1,
0.06763855, 1.058333, 1.143507, 0, 0.7176471, 1, 1,
0.06801001, 0.3617091, 1.449665, 0, 0.7137255, 1, 1,
0.0686444, -0.2810807, 3.263275, 0, 0.7058824, 1, 1,
0.07192096, -0.414753, 3.49027, 0, 0.6980392, 1, 1,
0.07329204, 0.5664479, 0.0008057164, 0, 0.6941177, 1, 1,
0.07666424, -0.7587249, 2.596591, 0, 0.6862745, 1, 1,
0.0773031, -0.8847777, 3.42073, 0, 0.682353, 1, 1,
0.07915325, -1.544119, 3.056591, 0, 0.6745098, 1, 1,
0.08047724, -1.055292, 3.558617, 0, 0.6705883, 1, 1,
0.08459046, 0.9737164, -1.343886, 0, 0.6627451, 1, 1,
0.08701985, 1.650477, 0.1985657, 0, 0.6588235, 1, 1,
0.09114318, -0.04948878, 1.883171, 0, 0.6509804, 1, 1,
0.09352558, -1.131567, 3.527556, 0, 0.6470588, 1, 1,
0.09771435, -0.1015855, 3.240333, 0, 0.6392157, 1, 1,
0.09936033, -1.300694, 3.524182, 0, 0.6352941, 1, 1,
0.09989331, -0.8005716, 3.383644, 0, 0.627451, 1, 1,
0.1020343, -0.8003023, 3.270827, 0, 0.6235294, 1, 1,
0.1062577, -0.1900153, 3.295683, 0, 0.6156863, 1, 1,
0.1099318, 0.9973871, -0.925113, 0, 0.6117647, 1, 1,
0.1161863, -0.1549601, 2.118931, 0, 0.6039216, 1, 1,
0.1201503, 1.309394, 1.87248, 0, 0.5960785, 1, 1,
0.1213754, -1.446224, 3.172947, 0, 0.5921569, 1, 1,
0.1250027, 0.07777154, 2.201455, 0, 0.5843138, 1, 1,
0.1277224, -0.2600634, 2.660705, 0, 0.5803922, 1, 1,
0.1331021, -1.11543, 2.433548, 0, 0.572549, 1, 1,
0.1371946, -1.929086, 2.770903, 0, 0.5686275, 1, 1,
0.1380999, -0.5761569, 1.780547, 0, 0.5607843, 1, 1,
0.1414311, -0.1265819, 5.016283, 0, 0.5568628, 1, 1,
0.1415413, -0.6822779, 1.833779, 0, 0.5490196, 1, 1,
0.1422378, 1.809837, -1.126295, 0, 0.5450981, 1, 1,
0.1428679, 1.214165, 0.5664285, 0, 0.5372549, 1, 1,
0.14372, -0.004948622, 3.707608, 0, 0.5333334, 1, 1,
0.1440427, 0.2114526, -0.8346795, 0, 0.5254902, 1, 1,
0.148299, 1.102154, -0.7485083, 0, 0.5215687, 1, 1,
0.150448, 0.1513762, 0.7809443, 0, 0.5137255, 1, 1,
0.1504555, 0.7939862, -1.1984, 0, 0.509804, 1, 1,
0.1504786, -0.8536452, 4.064594, 0, 0.5019608, 1, 1,
0.1509447, -0.2789219, 3.681117, 0, 0.4941176, 1, 1,
0.1515838, 0.1937913, 2.148346, 0, 0.4901961, 1, 1,
0.1546649, -1.048682, 3.205842, 0, 0.4823529, 1, 1,
0.1552508, 0.334098, 0.2093687, 0, 0.4784314, 1, 1,
0.1553168, 0.3741944, -0.9521954, 0, 0.4705882, 1, 1,
0.1584756, -2.338888, 3.520907, 0, 0.4666667, 1, 1,
0.1612268, 0.2036567, 0.9382109, 0, 0.4588235, 1, 1,
0.1713666, -1.565825, 2.534606, 0, 0.454902, 1, 1,
0.1730812, 0.7729523, 1.029143, 0, 0.4470588, 1, 1,
0.1731062, -1.586285, 5.312234, 0, 0.4431373, 1, 1,
0.1764401, -1.239975, 2.929002, 0, 0.4352941, 1, 1,
0.1786429, -0.3306127, 1.095492, 0, 0.4313726, 1, 1,
0.1879651, -0.1402193, 1.13344, 0, 0.4235294, 1, 1,
0.1885228, 1.989095, -1.905603, 0, 0.4196078, 1, 1,
0.1902323, -1.259805, 1.255423, 0, 0.4117647, 1, 1,
0.1907484, -0.7967414, 3.901833, 0, 0.4078431, 1, 1,
0.1925127, -0.3142289, 3.057989, 0, 0.4, 1, 1,
0.1931269, 0.2249941, 1.108145, 0, 0.3921569, 1, 1,
0.1961325, 2.332357, 1.37043, 0, 0.3882353, 1, 1,
0.1991388, 0.5372064, 0.7612605, 0, 0.3803922, 1, 1,
0.2030423, -0.7939543, 3.192218, 0, 0.3764706, 1, 1,
0.2034023, -0.4308003, 2.685387, 0, 0.3686275, 1, 1,
0.2052476, -2.056393, 3.27728, 0, 0.3647059, 1, 1,
0.2089437, 0.7956709, 0.2172846, 0, 0.3568628, 1, 1,
0.2226117, 0.6273345, 0.1941598, 0, 0.3529412, 1, 1,
0.2230818, -0.7094021, 2.078339, 0, 0.345098, 1, 1,
0.228296, 0.4280164, 1.455628, 0, 0.3411765, 1, 1,
0.2285772, -0.641775, 2.904823, 0, 0.3333333, 1, 1,
0.2316848, -0.9069641, 2.721348, 0, 0.3294118, 1, 1,
0.2344998, -1.390231, 2.942329, 0, 0.3215686, 1, 1,
0.23463, 0.01017311, 0.6445563, 0, 0.3176471, 1, 1,
0.2358026, -1.627729, 3.000923, 0, 0.3098039, 1, 1,
0.235985, 1.103574, -0.2202495, 0, 0.3058824, 1, 1,
0.2367397, 0.110567, 1.392316, 0, 0.2980392, 1, 1,
0.2389473, -0.2657945, 2.583661, 0, 0.2901961, 1, 1,
0.2397945, 0.7027005, 2.020986, 0, 0.2862745, 1, 1,
0.2403067, 1.247703, -0.6592255, 0, 0.2784314, 1, 1,
0.2404414, -1.135472, 1.842164, 0, 0.2745098, 1, 1,
0.2444354, 0.3807119, 1.384936, 0, 0.2666667, 1, 1,
0.2452434, 0.1481528, 0.01079959, 0, 0.2627451, 1, 1,
0.2559019, -1.039956, 0.7781205, 0, 0.254902, 1, 1,
0.2573224, -0.1829328, 2.413798, 0, 0.2509804, 1, 1,
0.2577138, -0.8991245, 2.307478, 0, 0.2431373, 1, 1,
0.2577553, 0.6199209, 1.903069, 0, 0.2392157, 1, 1,
0.2683969, 0.08166535, 0.8788023, 0, 0.2313726, 1, 1,
0.2705918, 1.825616, 1.217513, 0, 0.227451, 1, 1,
0.2795309, 1.691993, 0.9532279, 0, 0.2196078, 1, 1,
0.284119, 0.174653, 1.230229, 0, 0.2156863, 1, 1,
0.2844747, -1.077821, 2.27622, 0, 0.2078431, 1, 1,
0.2857152, -0.09378926, 2.587748, 0, 0.2039216, 1, 1,
0.2887205, -1.268566, 5.063082, 0, 0.1960784, 1, 1,
0.2914942, 0.5183583, 1.770524, 0, 0.1882353, 1, 1,
0.2969124, 0.8766152, -0.0257954, 0, 0.1843137, 1, 1,
0.3044992, -1.219686, 1.43038, 0, 0.1764706, 1, 1,
0.3060055, 0.4951783, 0.1727396, 0, 0.172549, 1, 1,
0.3070309, 0.4538168, -1.011865, 0, 0.1647059, 1, 1,
0.3110487, -0.8319585, 0.8041307, 0, 0.1607843, 1, 1,
0.3113807, 0.5145965, 0.4886732, 0, 0.1529412, 1, 1,
0.315397, -0.8691393, 3.09683, 0, 0.1490196, 1, 1,
0.3181024, 0.715753, -2.029993, 0, 0.1411765, 1, 1,
0.321775, -0.1051106, 2.089097, 0, 0.1372549, 1, 1,
0.3242027, 0.3129651, -0.139485, 0, 0.1294118, 1, 1,
0.3247444, 0.9215272, 2.071976, 0, 0.1254902, 1, 1,
0.324906, -0.6699199, 3.326271, 0, 0.1176471, 1, 1,
0.3287918, 0.1304124, 2.437864, 0, 0.1137255, 1, 1,
0.3301915, -0.4820511, 2.658058, 0, 0.1058824, 1, 1,
0.3302939, -0.6402898, 1.426659, 0, 0.09803922, 1, 1,
0.3426012, 0.6719419, 0.6687143, 0, 0.09411765, 1, 1,
0.344027, -0.6302068, 0.9466389, 0, 0.08627451, 1, 1,
0.3452112, -0.5982425, 2.151461, 0, 0.08235294, 1, 1,
0.3454766, 0.3087847, -1.185466, 0, 0.07450981, 1, 1,
0.3499112, -0.3966525, 2.697197, 0, 0.07058824, 1, 1,
0.3544135, -0.1861482, 3.508513, 0, 0.0627451, 1, 1,
0.3561359, 0.5419945, 1.045923, 0, 0.05882353, 1, 1,
0.3565213, 0.4057875, 0.6936135, 0, 0.05098039, 1, 1,
0.3566228, -1.317837, 4.366313, 0, 0.04705882, 1, 1,
0.3575866, 0.2051505, 1.172775, 0, 0.03921569, 1, 1,
0.3630263, 0.8912014, 0.3198374, 0, 0.03529412, 1, 1,
0.3672557, -0.2027055, 2.494984, 0, 0.02745098, 1, 1,
0.3682124, 0.3563901, 1.805607, 0, 0.02352941, 1, 1,
0.3694672, -0.2966281, 2.104266, 0, 0.01568628, 1, 1,
0.369515, 0.4801863, 0.8138344, 0, 0.01176471, 1, 1,
0.373229, 1.039407, 1.053498, 0, 0.003921569, 1, 1,
0.3774125, 0.1270248, 0.9164161, 0.003921569, 0, 1, 1,
0.3868371, -0.007810542, 1.802046, 0.007843138, 0, 1, 1,
0.3908424, -0.1286773, 2.512282, 0.01568628, 0, 1, 1,
0.3914124, -2.736883, 3.641691, 0.01960784, 0, 1, 1,
0.396022, -0.968668, 2.302556, 0.02745098, 0, 1, 1,
0.3981164, -1.719274, 1.572918, 0.03137255, 0, 1, 1,
0.4022859, -0.06857175, 0.47203, 0.03921569, 0, 1, 1,
0.4034036, -1.706156, 4.346719, 0.04313726, 0, 1, 1,
0.4041215, 0.6065875, -0.1200611, 0.05098039, 0, 1, 1,
0.4042496, -0.1945554, 1.947868, 0.05490196, 0, 1, 1,
0.4049239, -1.773559, 2.954074, 0.0627451, 0, 1, 1,
0.4067386, 1.330527, 1.075014, 0.06666667, 0, 1, 1,
0.4069009, -0.3977103, 2.356767, 0.07450981, 0, 1, 1,
0.4070913, -1.039816, 4.078846, 0.07843138, 0, 1, 1,
0.419771, -0.3177121, 4.203802, 0.08627451, 0, 1, 1,
0.4262915, 0.6246987, 0.1710529, 0.09019608, 0, 1, 1,
0.4319292, -0.9705156, 3.309634, 0.09803922, 0, 1, 1,
0.4324999, -2.670999, 4.655063, 0.1058824, 0, 1, 1,
0.433857, 0.09783616, 2.48102, 0.1098039, 0, 1, 1,
0.4350185, -1.22255, 2.731365, 0.1176471, 0, 1, 1,
0.4401285, 1.165052, -0.8825968, 0.1215686, 0, 1, 1,
0.4415486, 2.207039, -0.4712484, 0.1294118, 0, 1, 1,
0.4435319, -0.1255983, 2.665277, 0.1333333, 0, 1, 1,
0.4463533, -0.8310534, 2.064054, 0.1411765, 0, 1, 1,
0.4468394, -1.465183, 3.126191, 0.145098, 0, 1, 1,
0.4468987, -0.1636499, 3.305237, 0.1529412, 0, 1, 1,
0.4515241, -0.5126207, 3.394498, 0.1568628, 0, 1, 1,
0.4540303, 1.576962, 1.284485, 0.1647059, 0, 1, 1,
0.4560722, -0.8172831, 3.04371, 0.1686275, 0, 1, 1,
0.4620385, 0.1322318, 0.7311674, 0.1764706, 0, 1, 1,
0.4628134, -1.131584, 0.5981739, 0.1803922, 0, 1, 1,
0.4694697, -0.03182375, 3.972298, 0.1882353, 0, 1, 1,
0.4703472, 1.9535, 0.5297278, 0.1921569, 0, 1, 1,
0.4745062, 1.322125, -0.4193498, 0.2, 0, 1, 1,
0.4809524, 0.4827005, 2.398836, 0.2078431, 0, 1, 1,
0.4810686, 1.107227, 2.042755, 0.2117647, 0, 1, 1,
0.4811032, -0.06516694, 3.062923, 0.2196078, 0, 1, 1,
0.4867103, 0.3585483, 1.007178, 0.2235294, 0, 1, 1,
0.4874258, 1.992592, -0.3232853, 0.2313726, 0, 1, 1,
0.4885842, 1.131735, 1.031764, 0.2352941, 0, 1, 1,
0.495041, -0.0451605, 2.019906, 0.2431373, 0, 1, 1,
0.4956306, 0.3068141, 1.156727, 0.2470588, 0, 1, 1,
0.4999093, 0.1465486, 1.519083, 0.254902, 0, 1, 1,
0.5069426, 1.800222, 0.4065808, 0.2588235, 0, 1, 1,
0.5085168, -0.299915, 3.248548, 0.2666667, 0, 1, 1,
0.5110866, 1.16499, 0.07916213, 0.2705882, 0, 1, 1,
0.5123583, -0.1255669, 2.238441, 0.2784314, 0, 1, 1,
0.5137408, -0.01141993, 1.587683, 0.282353, 0, 1, 1,
0.5193229, 0.551808, 1.291405, 0.2901961, 0, 1, 1,
0.5271009, 0.3685704, 1.964832, 0.2941177, 0, 1, 1,
0.5297832, -0.9685875, 0.7247185, 0.3019608, 0, 1, 1,
0.5298804, 0.3653294, 0.9221444, 0.3098039, 0, 1, 1,
0.5300103, -1.061471, 3.666649, 0.3137255, 0, 1, 1,
0.5301653, -0.472526, 0.767899, 0.3215686, 0, 1, 1,
0.5309607, -0.4840303, 3.139369, 0.3254902, 0, 1, 1,
0.5383212, -1.640775, 3.102813, 0.3333333, 0, 1, 1,
0.5402519, 0.3641067, 0.733016, 0.3372549, 0, 1, 1,
0.5419562, -1.706174, 3.17474, 0.345098, 0, 1, 1,
0.5426456, 0.6004743, 1.610041, 0.3490196, 0, 1, 1,
0.5458098, 0.167989, 0.6270459, 0.3568628, 0, 1, 1,
0.5486124, 0.9497169, 0.1121111, 0.3607843, 0, 1, 1,
0.551113, 0.9738612, 1.473933, 0.3686275, 0, 1, 1,
0.5563074, -1.491766, 1.466378, 0.372549, 0, 1, 1,
0.557944, -0.6159396, 1.648103, 0.3803922, 0, 1, 1,
0.5580735, -0.1892201, 0.8745516, 0.3843137, 0, 1, 1,
0.563621, -0.6130497, 3.767285, 0.3921569, 0, 1, 1,
0.5658975, -1.554181, 1.714829, 0.3960784, 0, 1, 1,
0.5887361, -1.03827, 1.041332, 0.4039216, 0, 1, 1,
0.5892237, 1.754984, -0.07242063, 0.4117647, 0, 1, 1,
0.5929386, -1.143591, 3.007069, 0.4156863, 0, 1, 1,
0.5944668, -2.060224, 4.280472, 0.4235294, 0, 1, 1,
0.5947943, -1.407327, 3.553709, 0.427451, 0, 1, 1,
0.5949963, 0.933673, 1.283361, 0.4352941, 0, 1, 1,
0.5963885, -0.09397032, 2.161209, 0.4392157, 0, 1, 1,
0.6034311, 0.772341, -0.09802636, 0.4470588, 0, 1, 1,
0.6044255, 0.07454835, 1.504104, 0.4509804, 0, 1, 1,
0.6097515, 0.2642475, 0.2185453, 0.4588235, 0, 1, 1,
0.6167304, -0.07380423, 1.953906, 0.4627451, 0, 1, 1,
0.6167412, -0.228212, 3.023574, 0.4705882, 0, 1, 1,
0.6215001, -1.487259, 1.030582, 0.4745098, 0, 1, 1,
0.6236746, 0.05494387, 0.7150767, 0.4823529, 0, 1, 1,
0.6269595, 1.541747, -0.6524946, 0.4862745, 0, 1, 1,
0.6281129, 0.1630287, 1.992423, 0.4941176, 0, 1, 1,
0.6307694, 0.3507964, 0.3204839, 0.5019608, 0, 1, 1,
0.654469, 0.2456895, 2.939751, 0.5058824, 0, 1, 1,
0.6707596, -0.1916961, 1.208447, 0.5137255, 0, 1, 1,
0.6773433, 1.335454, 1.989041, 0.5176471, 0, 1, 1,
0.6791393, -0.2703231, 1.226343, 0.5254902, 0, 1, 1,
0.6836575, 0.174324, 2.176498, 0.5294118, 0, 1, 1,
0.6881188, -1.183305, 2.439827, 0.5372549, 0, 1, 1,
0.6968499, -0.1960852, 1.221164, 0.5411765, 0, 1, 1,
0.7000105, -0.5355257, 5.109334, 0.5490196, 0, 1, 1,
0.7031516, -0.3071004, 1.203421, 0.5529412, 0, 1, 1,
0.7109701, -1.475889, 2.149088, 0.5607843, 0, 1, 1,
0.7124256, 0.4575581, 1.187529, 0.5647059, 0, 1, 1,
0.7133308, -0.7768152, 2.579673, 0.572549, 0, 1, 1,
0.7159845, -0.2577743, 1.933041, 0.5764706, 0, 1, 1,
0.7267309, -1.001899, 3.37668, 0.5843138, 0, 1, 1,
0.7395728, 1.636781, -0.01592399, 0.5882353, 0, 1, 1,
0.7416016, -0.4211223, 2.689368, 0.5960785, 0, 1, 1,
0.7438214, 1.865492, 0.3644996, 0.6039216, 0, 1, 1,
0.7471383, -0.6548085, 2.906088, 0.6078432, 0, 1, 1,
0.7523801, -0.9281065, 1.384613, 0.6156863, 0, 1, 1,
0.7564661, 0.6159261, -0.876862, 0.6196079, 0, 1, 1,
0.757665, 1.070426, 1.183915, 0.627451, 0, 1, 1,
0.7594485, -0.5290726, 1.561326, 0.6313726, 0, 1, 1,
0.7612674, 1.808271, 0.7903628, 0.6392157, 0, 1, 1,
0.761362, 0.3350014, 0.8264483, 0.6431373, 0, 1, 1,
0.761968, 0.2360858, 1.146765, 0.6509804, 0, 1, 1,
0.7629192, -0.2683266, 2.081611, 0.654902, 0, 1, 1,
0.7639069, 0.08443222, 1.898116, 0.6627451, 0, 1, 1,
0.7770442, 1.515011, 0.6676534, 0.6666667, 0, 1, 1,
0.7786099, -0.01845587, -0.1024485, 0.6745098, 0, 1, 1,
0.7793347, -0.873839, 2.650712, 0.6784314, 0, 1, 1,
0.7829175, 1.370042, 0.3885071, 0.6862745, 0, 1, 1,
0.7884537, -1.261651, 3.849931, 0.6901961, 0, 1, 1,
0.7905527, 0.4296134, 1.368163, 0.6980392, 0, 1, 1,
0.7972577, -3.523319, 3.339662, 0.7058824, 0, 1, 1,
0.802363, 0.01385632, 3.318752, 0.7098039, 0, 1, 1,
0.8024983, 0.5092508, 1.078831, 0.7176471, 0, 1, 1,
0.802959, 0.6297114, 0.8989059, 0.7215686, 0, 1, 1,
0.8055934, -0.7449177, 0.816084, 0.7294118, 0, 1, 1,
0.8085204, 2.089125, -0.387778, 0.7333333, 0, 1, 1,
0.8134694, -0.5774664, 1.499331, 0.7411765, 0, 1, 1,
0.8141513, 2.489832, 0.5322843, 0.7450981, 0, 1, 1,
0.8286587, -0.004064857, 2.777984, 0.7529412, 0, 1, 1,
0.8287699, 1.369409, 0.6338102, 0.7568628, 0, 1, 1,
0.8302159, -0.6570569, 2.624314, 0.7647059, 0, 1, 1,
0.8336281, -1.398531, 1.879695, 0.7686275, 0, 1, 1,
0.8356189, -0.214385, 2.475207, 0.7764706, 0, 1, 1,
0.841033, -0.8534814, 2.49403, 0.7803922, 0, 1, 1,
0.8459486, -0.1491911, 2.607426, 0.7882353, 0, 1, 1,
0.848114, 0.635474, 1.524741, 0.7921569, 0, 1, 1,
0.8486644, 0.1396187, 2.012752, 0.8, 0, 1, 1,
0.8501078, 0.8525366, 1.947525, 0.8078431, 0, 1, 1,
0.8540404, -0.8784855, 1.420295, 0.8117647, 0, 1, 1,
0.854666, 0.6050125, 0.2320739, 0.8196079, 0, 1, 1,
0.8555997, -0.8836229, 2.177162, 0.8235294, 0, 1, 1,
0.856535, -0.691396, 2.226888, 0.8313726, 0, 1, 1,
0.8569658, -0.7021148, 2.693163, 0.8352941, 0, 1, 1,
0.8626918, -0.9008492, 1.445574, 0.8431373, 0, 1, 1,
0.8685756, 0.6668175, 0.176262, 0.8470588, 0, 1, 1,
0.8698249, 0.7065049, 2.284097, 0.854902, 0, 1, 1,
0.8705209, 0.5066763, -0.09178375, 0.8588235, 0, 1, 1,
0.8722793, 1.275181, 2.433282, 0.8666667, 0, 1, 1,
0.875298, -0.0881376, -0.1469069, 0.8705882, 0, 1, 1,
0.8797444, 1.255339, 0.8721197, 0.8784314, 0, 1, 1,
0.8817739, 1.162381, 0.497854, 0.8823529, 0, 1, 1,
0.8822413, -0.4296622, 2.493504, 0.8901961, 0, 1, 1,
0.9018047, -0.1724229, 1.213522, 0.8941177, 0, 1, 1,
0.9081778, -1.163817, 3.013787, 0.9019608, 0, 1, 1,
0.9100391, 0.7496852, 1.94407, 0.9098039, 0, 1, 1,
0.913099, 0.1355848, 1.589214, 0.9137255, 0, 1, 1,
0.9148294, -1.070941, 2.424451, 0.9215686, 0, 1, 1,
0.9164375, -1.099911, 2.776928, 0.9254902, 0, 1, 1,
0.9178753, 0.1036574, 1.329603, 0.9333333, 0, 1, 1,
0.9224735, -2.575581, 2.768354, 0.9372549, 0, 1, 1,
0.9228055, -0.5058194, 2.897399, 0.945098, 0, 1, 1,
0.930378, 0.6214857, 0.6649456, 0.9490196, 0, 1, 1,
0.9332144, 0.9320903, 0.4775369, 0.9568627, 0, 1, 1,
0.934618, 0.7313285, -0.2120063, 0.9607843, 0, 1, 1,
0.9369479, 0.9333851, 1.073777, 0.9686275, 0, 1, 1,
0.9374067, -0.6160342, 1.357669, 0.972549, 0, 1, 1,
0.9437842, -0.9241709, 1.722425, 0.9803922, 0, 1, 1,
0.9467852, 0.2703774, 3.707039, 0.9843137, 0, 1, 1,
0.9472399, -0.5166085, 2.862282, 0.9921569, 0, 1, 1,
0.9474747, 0.4901372, -0.7517605, 0.9960784, 0, 1, 1,
0.9499384, 0.4813578, 0.375993, 1, 0, 0.9960784, 1,
0.9501778, -1.053435, 1.607723, 1, 0, 0.9882353, 1,
0.9577408, 0.9643148, 0.3638038, 1, 0, 0.9843137, 1,
0.97506, -0.5234247, 1.334205, 1, 0, 0.9764706, 1,
0.9854031, 0.1676294, 1.05547, 1, 0, 0.972549, 1,
1.004679, 0.8183375, 1.553555, 1, 0, 0.9647059, 1,
1.014735, 0.6736556, 2.207336, 1, 0, 0.9607843, 1,
1.015416, -1.132039, 1.65182, 1, 0, 0.9529412, 1,
1.026322, 0.7375036, -0.8687775, 1, 0, 0.9490196, 1,
1.0267, -0.9860263, 2.382013, 1, 0, 0.9411765, 1,
1.029327, 1.337056, 0.7221202, 1, 0, 0.9372549, 1,
1.031416, 0.7471419, 1.756878, 1, 0, 0.9294118, 1,
1.031717, -0.0692304, 3.778201, 1, 0, 0.9254902, 1,
1.033404, 1.283292, 1.338432, 1, 0, 0.9176471, 1,
1.033817, 0.3743266, 0.1677053, 1, 0, 0.9137255, 1,
1.040909, 1.376868, -0.4235578, 1, 0, 0.9058824, 1,
1.040966, -0.2297093, 0.9824616, 1, 0, 0.9019608, 1,
1.042826, 0.1269741, 2.090443, 1, 0, 0.8941177, 1,
1.044381, 1.511674, 0.7681814, 1, 0, 0.8862745, 1,
1.04626, -0.1784347, 0.6780991, 1, 0, 0.8823529, 1,
1.048147, 1.037269, 2.020808, 1, 0, 0.8745098, 1,
1.057263, 2.962558, -0.4510521, 1, 0, 0.8705882, 1,
1.058572, -0.1558056, 0.1064112, 1, 0, 0.8627451, 1,
1.059372, -0.795703, 2.835223, 1, 0, 0.8588235, 1,
1.062108, 1.383501, -1.087755, 1, 0, 0.8509804, 1,
1.063733, 0.3293976, 0.9515913, 1, 0, 0.8470588, 1,
1.066852, 0.1950602, 1.218102, 1, 0, 0.8392157, 1,
1.067381, -0.4786676, 2.563392, 1, 0, 0.8352941, 1,
1.067747, 1.004833, -0.2629877, 1, 0, 0.827451, 1,
1.067861, 0.5209061, 2.191492, 1, 0, 0.8235294, 1,
1.069353, 0.7591516, 1.219271, 1, 0, 0.8156863, 1,
1.070071, 0.7456398, -1.734564, 1, 0, 0.8117647, 1,
1.089529, -0.7545798, 2.742797, 1, 0, 0.8039216, 1,
1.095048, -0.6142084, 4.390391, 1, 0, 0.7960784, 1,
1.095907, -1.696804, 1.185907, 1, 0, 0.7921569, 1,
1.099996, -0.3814446, 1.444998, 1, 0, 0.7843137, 1,
1.10452, 0.06966831, 0.1146393, 1, 0, 0.7803922, 1,
1.109372, -0.9667773, 1.853615, 1, 0, 0.772549, 1,
1.118257, -0.4415206, 2.331038, 1, 0, 0.7686275, 1,
1.120439, -0.04809593, 0.7486051, 1, 0, 0.7607843, 1,
1.142894, -2.049593, 2.761117, 1, 0, 0.7568628, 1,
1.147067, 0.517441, 3.071669, 1, 0, 0.7490196, 1,
1.149594, 0.5237724, 1.881732, 1, 0, 0.7450981, 1,
1.153353, 0.8908018, 1.586168, 1, 0, 0.7372549, 1,
1.156637, -0.3863814, 2.823699, 1, 0, 0.7333333, 1,
1.161822, -0.1722259, 1.300965, 1, 0, 0.7254902, 1,
1.168959, 0.6237139, 0.3462462, 1, 0, 0.7215686, 1,
1.174282, -0.1844415, 1.074281, 1, 0, 0.7137255, 1,
1.176915, -0.3860304, 2.570026, 1, 0, 0.7098039, 1,
1.177456, 1.282206, 2.15121, 1, 0, 0.7019608, 1,
1.188231, 1.246367, 0.5470908, 1, 0, 0.6941177, 1,
1.193097, 0.1139838, 1.274603, 1, 0, 0.6901961, 1,
1.196907, 0.01491605, 1.440413, 1, 0, 0.682353, 1,
1.198343, 0.9170889, 2.163726, 1, 0, 0.6784314, 1,
1.204167, -0.5126439, 0.5271111, 1, 0, 0.6705883, 1,
1.207503, -0.4440973, 2.115405, 1, 0, 0.6666667, 1,
1.214308, 0.671585, 0.3825271, 1, 0, 0.6588235, 1,
1.226393, 2.35313, 0.476102, 1, 0, 0.654902, 1,
1.228538, -0.6237477, 3.176261, 1, 0, 0.6470588, 1,
1.232893, -1.118593, 0.2237769, 1, 0, 0.6431373, 1,
1.23503, 1.389529, 0.2361929, 1, 0, 0.6352941, 1,
1.238396, -0.2456414, 3.050107, 1, 0, 0.6313726, 1,
1.242479, -0.901108, 2.621321, 1, 0, 0.6235294, 1,
1.244706, 0.06589636, 1.706007, 1, 0, 0.6196079, 1,
1.246636, -1.365272, 3.391728, 1, 0, 0.6117647, 1,
1.253535, -0.5596821, 0.8220375, 1, 0, 0.6078432, 1,
1.255235, -0.6564739, 1.957511, 1, 0, 0.6, 1,
1.264735, -0.3297507, 1.132229, 1, 0, 0.5921569, 1,
1.275903, 1.190791, -1.501945, 1, 0, 0.5882353, 1,
1.279899, -0.6851352, 2.253406, 1, 0, 0.5803922, 1,
1.283632, 2.276329, -0.9737657, 1, 0, 0.5764706, 1,
1.283837, -0.01883089, 0.02253504, 1, 0, 0.5686275, 1,
1.285721, -0.3578918, 3.225512, 1, 0, 0.5647059, 1,
1.28971, -0.4316448, 1.537363, 1, 0, 0.5568628, 1,
1.290458, -0.9105723, 2.400185, 1, 0, 0.5529412, 1,
1.299581, 0.8747024, 1.322409, 1, 0, 0.5450981, 1,
1.300897, -0.4406495, 0.9975148, 1, 0, 0.5411765, 1,
1.305312, 0.1920716, -0.1008369, 1, 0, 0.5333334, 1,
1.337832, -2.312751, 3.120552, 1, 0, 0.5294118, 1,
1.344749, -1.103392, 3.46291, 1, 0, 0.5215687, 1,
1.346949, -1.633212, 3.692402, 1, 0, 0.5176471, 1,
1.352332, -1.388309, 1.094074, 1, 0, 0.509804, 1,
1.3534, -1.272947, 3.265044, 1, 0, 0.5058824, 1,
1.361351, 0.324925, 0.380045, 1, 0, 0.4980392, 1,
1.362821, 1.939303, -0.9909242, 1, 0, 0.4901961, 1,
1.366534, 0.7322692, 0.4925125, 1, 0, 0.4862745, 1,
1.369209, 1.359975, 1.379559, 1, 0, 0.4784314, 1,
1.376971, 0.06651969, 2.752206, 1, 0, 0.4745098, 1,
1.382492, -1.073145, 2.692831, 1, 0, 0.4666667, 1,
1.384339, -1.301841, 3.328719, 1, 0, 0.4627451, 1,
1.387281, 0.4002242, 1.431877, 1, 0, 0.454902, 1,
1.397013, 0.7171295, -2.21649, 1, 0, 0.4509804, 1,
1.404285, 2.568854, -0.2270624, 1, 0, 0.4431373, 1,
1.406764, 0.3421772, 1.369578, 1, 0, 0.4392157, 1,
1.413929, 0.1892497, 0.3004006, 1, 0, 0.4313726, 1,
1.416729, -0.9600949, 2.233437, 1, 0, 0.427451, 1,
1.419253, 0.8909308, 1.437773, 1, 0, 0.4196078, 1,
1.426651, -1.547794, 2.550345, 1, 0, 0.4156863, 1,
1.43243, -0.02305767, 1.694453, 1, 0, 0.4078431, 1,
1.436185, -0.4776809, 0.9617279, 1, 0, 0.4039216, 1,
1.437863, -0.31016, 1.845942, 1, 0, 0.3960784, 1,
1.441763, -0.3257063, 1.263638, 1, 0, 0.3882353, 1,
1.460299, -0.264336, 2.930752, 1, 0, 0.3843137, 1,
1.467792, 0.4301685, 1.601707, 1, 0, 0.3764706, 1,
1.487285, -0.2413431, 1.774303, 1, 0, 0.372549, 1,
1.499715, -0.2445803, 2.407284, 1, 0, 0.3647059, 1,
1.503601, 0.1369391, 3.898486, 1, 0, 0.3607843, 1,
1.505683, 0.1899732, 1.258355, 1, 0, 0.3529412, 1,
1.530559, -0.07304314, 2.102609, 1, 0, 0.3490196, 1,
1.553477, -0.2822432, 2.770278, 1, 0, 0.3411765, 1,
1.556913, 0.7184652, 2.083063, 1, 0, 0.3372549, 1,
1.561064, 0.4430564, 0.241577, 1, 0, 0.3294118, 1,
1.565469, 1.926134, 1.739952, 1, 0, 0.3254902, 1,
1.578588, -0.2889971, -1.098428, 1, 0, 0.3176471, 1,
1.594179, -1.753543, 2.909748, 1, 0, 0.3137255, 1,
1.599275, 1.651187, 1.302652, 1, 0, 0.3058824, 1,
1.613377, 0.6022248, -0.5631463, 1, 0, 0.2980392, 1,
1.621312, 0.9751678, 0.2836785, 1, 0, 0.2941177, 1,
1.622117, 1.19566, 2.218161, 1, 0, 0.2862745, 1,
1.634107, 1.449069, 0.2423214, 1, 0, 0.282353, 1,
1.650781, 1.073709, 0.9180074, 1, 0, 0.2745098, 1,
1.653224, 0.5032991, -0.02494262, 1, 0, 0.2705882, 1,
1.666068, -1.869464, 2.340754, 1, 0, 0.2627451, 1,
1.695052, -0.4898128, 2.030887, 1, 0, 0.2588235, 1,
1.704194, 2.445512, -0.4548369, 1, 0, 0.2509804, 1,
1.719499, 0.1201473, 0.8512999, 1, 0, 0.2470588, 1,
1.744326, -0.04685347, 2.005828, 1, 0, 0.2392157, 1,
1.752857, -0.1462741, 0.8618348, 1, 0, 0.2352941, 1,
1.765442, 0.9387919, -0.7778407, 1, 0, 0.227451, 1,
1.766007, -0.5108663, 2.109593, 1, 0, 0.2235294, 1,
1.77503, -1.367045, 2.147772, 1, 0, 0.2156863, 1,
1.780159, -1.249019, 4.917365, 1, 0, 0.2117647, 1,
1.805396, 0.111672, 1.218118, 1, 0, 0.2039216, 1,
1.806939, 1.696394, 0.7914321, 1, 0, 0.1960784, 1,
1.863457, -0.4275959, -1.598925, 1, 0, 0.1921569, 1,
1.865834, 0.9778349, 3.210785, 1, 0, 0.1843137, 1,
1.879689, -0.42574, 2.286827, 1, 0, 0.1803922, 1,
1.891005, -0.8539768, -0.1399893, 1, 0, 0.172549, 1,
1.916407, 1.172174, -0.4778877, 1, 0, 0.1686275, 1,
1.934437, 0.4010637, 2.84821, 1, 0, 0.1607843, 1,
1.953664, 1.346662, 1.27367, 1, 0, 0.1568628, 1,
2.013432, 1.730738, 1.58612, 1, 0, 0.1490196, 1,
2.050604, -0.9041824, 2.008949, 1, 0, 0.145098, 1,
2.09054, 1.24139, 1.578189, 1, 0, 0.1372549, 1,
2.100341, 1.391671, 0.06866667, 1, 0, 0.1333333, 1,
2.181889, 0.534361, 2.611872, 1, 0, 0.1254902, 1,
2.229511, -1.445262, 2.100024, 1, 0, 0.1215686, 1,
2.299206, 0.7138086, 1.697443, 1, 0, 0.1137255, 1,
2.326131, -1.036195, 2.803402, 1, 0, 0.1098039, 1,
2.351476, 1.031004, 2.102643, 1, 0, 0.1019608, 1,
2.372951, 1.366208, 0.73571, 1, 0, 0.09411765, 1,
2.394999, 1.096462, 0.8851395, 1, 0, 0.09019608, 1,
2.430434, 0.3932758, 0.1908259, 1, 0, 0.08235294, 1,
2.435613, 0.1507355, 0.8945865, 1, 0, 0.07843138, 1,
2.441705, -0.02889175, 2.4739, 1, 0, 0.07058824, 1,
2.45064, -0.4451788, 1.332508, 1, 0, 0.06666667, 1,
2.469564, -0.9778941, 1.029425, 1, 0, 0.05882353, 1,
2.517998, -0.6771175, 0.5486942, 1, 0, 0.05490196, 1,
2.55179, -1.778121, 1.794422, 1, 0, 0.04705882, 1,
2.557424, 0.9890222, -0.2444021, 1, 0, 0.04313726, 1,
2.571102, 0.05012198, 0.3100697, 1, 0, 0.03529412, 1,
2.63203, 0.3177541, 1.781937, 1, 0, 0.03137255, 1,
2.641138, -1.416298, 1.108104, 1, 0, 0.02352941, 1,
2.760365, 0.1886667, 1.076374, 1, 0, 0.01960784, 1,
2.903104, -0.912375, 1.118992, 1, 0, 0.01176471, 1,
3.415474, 1.604156, 1.738155, 1, 0, 0.007843138, 1
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
-0.3302727, -4.774364, -7.155638, 0, -0.5, 0.5, 0.5,
-0.3302727, -4.774364, -7.155638, 1, -0.5, 0.5, 0.5,
-0.3302727, -4.774364, -7.155638, 1, 1.5, 0.5, 0.5,
-0.3302727, -4.774364, -7.155638, 0, 1.5, 0.5, 0.5
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
-5.345828, -0.2051407, -7.155638, 0, -0.5, 0.5, 0.5,
-5.345828, -0.2051407, -7.155638, 1, -0.5, 0.5, 0.5,
-5.345828, -0.2051407, -7.155638, 1, 1.5, 0.5, 0.5,
-5.345828, -0.2051407, -7.155638, 0, 1.5, 0.5, 0.5
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
-5.345828, -4.774364, 0.09848285, 0, -0.5, 0.5, 0.5,
-5.345828, -4.774364, 0.09848285, 1, -0.5, 0.5, 0.5,
-5.345828, -4.774364, 0.09848285, 1, 1.5, 0.5, 0.5,
-5.345828, -4.774364, 0.09848285, 0, 1.5, 0.5, 0.5
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
-4, -3.719928, -5.48161,
2, -3.719928, -5.48161,
-4, -3.719928, -5.48161,
-4, -3.895668, -5.760615,
-2, -3.719928, -5.48161,
-2, -3.895668, -5.760615,
0, -3.719928, -5.48161,
0, -3.895668, -5.760615,
2, -3.719928, -5.48161,
2, -3.895668, -5.760615
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
"-4",
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
-4, -4.247147, -6.318624, 0, -0.5, 0.5, 0.5,
-4, -4.247147, -6.318624, 1, -0.5, 0.5, 0.5,
-4, -4.247147, -6.318624, 1, 1.5, 0.5, 0.5,
-4, -4.247147, -6.318624, 0, 1.5, 0.5, 0.5,
-2, -4.247147, -6.318624, 0, -0.5, 0.5, 0.5,
-2, -4.247147, -6.318624, 1, -0.5, 0.5, 0.5,
-2, -4.247147, -6.318624, 1, 1.5, 0.5, 0.5,
-2, -4.247147, -6.318624, 0, 1.5, 0.5, 0.5,
0, -4.247147, -6.318624, 0, -0.5, 0.5, 0.5,
0, -4.247147, -6.318624, 1, -0.5, 0.5, 0.5,
0, -4.247147, -6.318624, 1, 1.5, 0.5, 0.5,
0, -4.247147, -6.318624, 0, 1.5, 0.5, 0.5,
2, -4.247147, -6.318624, 0, -0.5, 0.5, 0.5,
2, -4.247147, -6.318624, 1, -0.5, 0.5, 0.5,
2, -4.247147, -6.318624, 1, 1.5, 0.5, 0.5,
2, -4.247147, -6.318624, 0, 1.5, 0.5, 0.5
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
-4.188392, -3, -5.48161,
-4.188392, 3, -5.48161,
-4.188392, -3, -5.48161,
-4.381298, -3, -5.760615,
-4.188392, -2, -5.48161,
-4.381298, -2, -5.760615,
-4.188392, -1, -5.48161,
-4.381298, -1, -5.760615,
-4.188392, 0, -5.48161,
-4.381298, 0, -5.760615,
-4.188392, 1, -5.48161,
-4.381298, 1, -5.760615,
-4.188392, 2, -5.48161,
-4.381298, 2, -5.760615,
-4.188392, 3, -5.48161,
-4.381298, 3, -5.760615
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
-4.767109, -3, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, -3, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, -3, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, -3, -6.318624, 0, 1.5, 0.5, 0.5,
-4.767109, -2, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, -2, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, -2, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, -2, -6.318624, 0, 1.5, 0.5, 0.5,
-4.767109, -1, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, -1, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, -1, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, -1, -6.318624, 0, 1.5, 0.5, 0.5,
-4.767109, 0, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, 0, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, 0, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, 0, -6.318624, 0, 1.5, 0.5, 0.5,
-4.767109, 1, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, 1, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, 1, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, 1, -6.318624, 0, 1.5, 0.5, 0.5,
-4.767109, 2, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, 2, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, 2, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, 2, -6.318624, 0, 1.5, 0.5, 0.5,
-4.767109, 3, -6.318624, 0, -0.5, 0.5, 0.5,
-4.767109, 3, -6.318624, 1, -0.5, 0.5, 0.5,
-4.767109, 3, -6.318624, 1, 1.5, 0.5, 0.5,
-4.767109, 3, -6.318624, 0, 1.5, 0.5, 0.5
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
-4.188392, -3.719928, -4,
-4.188392, -3.719928, 4,
-4.188392, -3.719928, -4,
-4.381298, -3.895668, -4,
-4.188392, -3.719928, -2,
-4.381298, -3.895668, -2,
-4.188392, -3.719928, 0,
-4.381298, -3.895668, 0,
-4.188392, -3.719928, 2,
-4.381298, -3.895668, 2,
-4.188392, -3.719928, 4,
-4.381298, -3.895668, 4
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
-4.767109, -4.247147, -4, 0, -0.5, 0.5, 0.5,
-4.767109, -4.247147, -4, 1, -0.5, 0.5, 0.5,
-4.767109, -4.247147, -4, 1, 1.5, 0.5, 0.5,
-4.767109, -4.247147, -4, 0, 1.5, 0.5, 0.5,
-4.767109, -4.247147, -2, 0, -0.5, 0.5, 0.5,
-4.767109, -4.247147, -2, 1, -0.5, 0.5, 0.5,
-4.767109, -4.247147, -2, 1, 1.5, 0.5, 0.5,
-4.767109, -4.247147, -2, 0, 1.5, 0.5, 0.5,
-4.767109, -4.247147, 0, 0, -0.5, 0.5, 0.5,
-4.767109, -4.247147, 0, 1, -0.5, 0.5, 0.5,
-4.767109, -4.247147, 0, 1, 1.5, 0.5, 0.5,
-4.767109, -4.247147, 0, 0, 1.5, 0.5, 0.5,
-4.767109, -4.247147, 2, 0, -0.5, 0.5, 0.5,
-4.767109, -4.247147, 2, 1, -0.5, 0.5, 0.5,
-4.767109, -4.247147, 2, 1, 1.5, 0.5, 0.5,
-4.767109, -4.247147, 2, 0, 1.5, 0.5, 0.5,
-4.767109, -4.247147, 4, 0, -0.5, 0.5, 0.5,
-4.767109, -4.247147, 4, 1, -0.5, 0.5, 0.5,
-4.767109, -4.247147, 4, 1, 1.5, 0.5, 0.5,
-4.767109, -4.247147, 4, 0, 1.5, 0.5, 0.5
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
-4.188392, -3.719928, -5.48161,
-4.188392, 3.309647, -5.48161,
-4.188392, -3.719928, 5.678576,
-4.188392, 3.309647, 5.678576,
-4.188392, -3.719928, -5.48161,
-4.188392, -3.719928, 5.678576,
-4.188392, 3.309647, -5.48161,
-4.188392, 3.309647, 5.678576,
-4.188392, -3.719928, -5.48161,
3.527846, -3.719928, -5.48161,
-4.188392, -3.719928, 5.678576,
3.527846, -3.719928, 5.678576,
-4.188392, 3.309647, -5.48161,
3.527846, 3.309647, -5.48161,
-4.188392, 3.309647, 5.678576,
3.527846, 3.309647, 5.678576,
3.527846, -3.719928, -5.48161,
3.527846, 3.309647, -5.48161,
3.527846, -3.719928, 5.678576,
3.527846, 3.309647, 5.678576,
3.527846, -3.719928, -5.48161,
3.527846, -3.719928, 5.678576,
3.527846, 3.309647, -5.48161,
3.527846, 3.309647, 5.678576
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
var radius = 8.159688;
var distance = 36.30338;
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
mvMatrix.translate( 0.3302727, 0.2051407, -0.09848285 );
mvMatrix.scale( 1.143357, 1.255042, 0.7905258 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.30338);
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
ethylene_dibromide_b<-read.table("ethylene_dibromide_b.xyz", skip=1)
```

```
## Error in read.table("ethylene_dibromide_b.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-ethylene_dibromide_b$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_b' not found
```

```r
y<-ethylene_dibromide_b$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_b' not found
```

```r
z<-ethylene_dibromide_b$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_b' not found
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
-4.076019, 0.3435745, -1.52349, 0, 0, 1, 1, 1,
-2.835866, 0.2685141, -0.6763024, 1, 0, 0, 1, 1,
-2.758983, 0.01317357, -1.207785, 1, 0, 0, 1, 1,
-2.665052, 0.2536051, 0.03945, 1, 0, 0, 1, 1,
-2.523335, 0.4913018, -0.4376213, 1, 0, 0, 1, 1,
-2.523282, 0.3041576, -1.726059, 1, 0, 0, 1, 1,
-2.513847, 1.489348, -0.6813267, 0, 0, 0, 1, 1,
-2.465901, 0.8388336, -1.352276, 0, 0, 0, 1, 1,
-2.437275, -1.750989, -2.636633, 0, 0, 0, 1, 1,
-2.333322, -0.2597331, -0.3900783, 0, 0, 0, 1, 1,
-2.33111, -0.4036992, -3.187277, 0, 0, 0, 1, 1,
-2.321454, -0.1381713, -2.514692, 0, 0, 0, 1, 1,
-2.306735, 1.090753, 0.876257, 0, 0, 0, 1, 1,
-2.231064, -0.2308711, -2.18195, 1, 1, 1, 1, 1,
-2.219118, 0.6579487, -1.355646, 1, 1, 1, 1, 1,
-2.218894, -0.2356525, -2.587133, 1, 1, 1, 1, 1,
-2.218215, 1.078453, -1.335094, 1, 1, 1, 1, 1,
-2.175585, 1.661036, -2.479175, 1, 1, 1, 1, 1,
-2.150597, -0.4936126, -1.78948, 1, 1, 1, 1, 1,
-2.136037, -0.7735395, -1.98105, 1, 1, 1, 1, 1,
-2.129309, -0.5865499, -2.178691, 1, 1, 1, 1, 1,
-2.060999, 0.789019, -1.810015, 1, 1, 1, 1, 1,
-1.992613, -0.07447411, -1.607737, 1, 1, 1, 1, 1,
-1.987238, -0.1873916, -0.8432146, 1, 1, 1, 1, 1,
-1.963663, -1.029418, -1.660242, 1, 1, 1, 1, 1,
-1.961608, 1.092814, -0.6239343, 1, 1, 1, 1, 1,
-1.960324, 2.380936, -2.092259, 1, 1, 1, 1, 1,
-1.958641, 2.155708, -0.2484117, 1, 1, 1, 1, 1,
-1.948116, -0.182209, -2.694811, 0, 0, 1, 1, 1,
-1.938856, 1.819047, -1.137379, 1, 0, 0, 1, 1,
-1.936385, 0.172881, -0.6589004, 1, 0, 0, 1, 1,
-1.935687, -0.9566824, 0.1346426, 1, 0, 0, 1, 1,
-1.884387, 1.538595, -2.152528, 1, 0, 0, 1, 1,
-1.860476, -0.682285, -2.020954, 1, 0, 0, 1, 1,
-1.85217, -1.223552, -1.925121, 0, 0, 0, 1, 1,
-1.837668, 0.9264883, -1.248516, 0, 0, 0, 1, 1,
-1.821894, -1.289608, -2.600106, 0, 0, 0, 1, 1,
-1.802922, -0.2887058, -2.95348, 0, 0, 0, 1, 1,
-1.782693, -0.1366595, -1.362649, 0, 0, 0, 1, 1,
-1.780421, -1.303472, -2.536726, 0, 0, 0, 1, 1,
-1.774923, 0.2216856, -1.320403, 0, 0, 0, 1, 1,
-1.770344, 0.8321747, -2.416324, 1, 1, 1, 1, 1,
-1.733395, -0.3632373, -2.69852, 1, 1, 1, 1, 1,
-1.733391, -0.08599541, -2.742269, 1, 1, 1, 1, 1,
-1.732679, -0.9474465, -0.8891341, 1, 1, 1, 1, 1,
-1.732656, 1.826329, -2.245314, 1, 1, 1, 1, 1,
-1.69997, -0.7229235, -0.9593544, 1, 1, 1, 1, 1,
-1.688531, 0.04111334, -4.038894, 1, 1, 1, 1, 1,
-1.687199, 0.4199793, -0.07704154, 1, 1, 1, 1, 1,
-1.678572, 0.1843517, -0.05156501, 1, 1, 1, 1, 1,
-1.669547, -0.02635087, -1.451883, 1, 1, 1, 1, 1,
-1.662432, -0.07471611, -1.360754, 1, 1, 1, 1, 1,
-1.657145, -0.2385727, -3.15747, 1, 1, 1, 1, 1,
-1.63582, -0.09809867, -2.300425, 1, 1, 1, 1, 1,
-1.621435, 0.8382324, 0.07498454, 1, 1, 1, 1, 1,
-1.6168, 0.8878686, -1.745559, 1, 1, 1, 1, 1,
-1.584399, 0.5142855, 0.09176826, 0, 0, 1, 1, 1,
-1.568771, -0.701819, -2.759417, 1, 0, 0, 1, 1,
-1.562388, -0.954669, -2.922888, 1, 0, 0, 1, 1,
-1.561114, 3.207274, -0.4069958, 1, 0, 0, 1, 1,
-1.558135, 0.09016085, -0.9085818, 1, 0, 0, 1, 1,
-1.555999, -0.1949214, -2.530218, 1, 0, 0, 1, 1,
-1.555779, -1.37674, -1.224695, 0, 0, 0, 1, 1,
-1.550113, 1.358096, -0.1784811, 0, 0, 0, 1, 1,
-1.540493, 1.005475, -1.474608, 0, 0, 0, 1, 1,
-1.540401, 0.2713779, -1.795705, 0, 0, 0, 1, 1,
-1.524361, 0.4747681, -1.395477, 0, 0, 0, 1, 1,
-1.519012, -1.441758, -1.253664, 0, 0, 0, 1, 1,
-1.509862, -0.8432776, -1.766981, 0, 0, 0, 1, 1,
-1.507975, -0.4828078, -2.565439, 1, 1, 1, 1, 1,
-1.490116, 1.021254, -2.13709, 1, 1, 1, 1, 1,
-1.487024, 1.059765, -1.344723, 1, 1, 1, 1, 1,
-1.465614, 1.292861, -0.612266, 1, 1, 1, 1, 1,
-1.460217, -0.0340905, -1.497008, 1, 1, 1, 1, 1,
-1.450102, -0.1187428, -2.094473, 1, 1, 1, 1, 1,
-1.448878, 0.5138378, -2.071138, 1, 1, 1, 1, 1,
-1.442291, 0.4778008, -0.4542719, 1, 1, 1, 1, 1,
-1.42674, -0.2140853, -1.205833, 1, 1, 1, 1, 1,
-1.420897, -1.095374, -2.001925, 1, 1, 1, 1, 1,
-1.417023, -0.3152851, -1.47223, 1, 1, 1, 1, 1,
-1.412557, 0.9014876, -1.795854, 1, 1, 1, 1, 1,
-1.412461, -1.255186, -1.841539, 1, 1, 1, 1, 1,
-1.405439, -0.4692951, -2.408327, 1, 1, 1, 1, 1,
-1.399441, 0.4330453, -1.541348, 1, 1, 1, 1, 1,
-1.39282, -0.3494687, -3.442216, 0, 0, 1, 1, 1,
-1.38202, 1.011002, -0.1163111, 1, 0, 0, 1, 1,
-1.366072, -0.2301808, -0.5849914, 1, 0, 0, 1, 1,
-1.364491, 0.007171857, -1.617006, 1, 0, 0, 1, 1,
-1.361094, 0.8389626, -0.9023195, 1, 0, 0, 1, 1,
-1.356036, 0.05423268, -0.1682317, 1, 0, 0, 1, 1,
-1.343099, 0.5846595, -2.794212, 0, 0, 0, 1, 1,
-1.341918, -1.703607, -2.011283, 0, 0, 0, 1, 1,
-1.338008, 0.1761543, -1.229255, 0, 0, 0, 1, 1,
-1.333035, 1.338002, 0.0835517, 0, 0, 0, 1, 1,
-1.330169, -0.2076072, -1.363804, 0, 0, 0, 1, 1,
-1.319428, 0.3121633, -0.8522246, 0, 0, 0, 1, 1,
-1.319155, 1.191813, -0.5768946, 0, 0, 0, 1, 1,
-1.302785, 0.9688963, -2.491667, 1, 1, 1, 1, 1,
-1.299564, 0.5414388, -0.7517289, 1, 1, 1, 1, 1,
-1.29939, 0.675872, -1.218183, 1, 1, 1, 1, 1,
-1.297009, -0.399066, -0.5346568, 1, 1, 1, 1, 1,
-1.293426, 0.002678805, -2.212593, 1, 1, 1, 1, 1,
-1.290297, 0.6793805, -0.2456587, 1, 1, 1, 1, 1,
-1.288357, -0.7447839, -2.607456, 1, 1, 1, 1, 1,
-1.285591, 0.7963387, -1.267045, 1, 1, 1, 1, 1,
-1.279092, 0.1074968, -0.4869863, 1, 1, 1, 1, 1,
-1.275558, -0.7733451, -2.121325, 1, 1, 1, 1, 1,
-1.266809, 0.07859311, -1.535372, 1, 1, 1, 1, 1,
-1.259444, -0.9254733, -1.07708, 1, 1, 1, 1, 1,
-1.258327, 1.221685, -0.9831145, 1, 1, 1, 1, 1,
-1.248431, -1.70324, -0.7583183, 1, 1, 1, 1, 1,
-1.221565, 0.3596147, -2.887921, 1, 1, 1, 1, 1,
-1.210146, -0.3252043, -2.573498, 0, 0, 1, 1, 1,
-1.20644, -1.683184, -1.260974, 1, 0, 0, 1, 1,
-1.202652, -0.6161612, -2.931396, 1, 0, 0, 1, 1,
-1.197819, -0.6900951, -4.40198, 1, 0, 0, 1, 1,
-1.195166, -0.2950257, -1.31652, 1, 0, 0, 1, 1,
-1.195086, -1.439283, -3.204105, 1, 0, 0, 1, 1,
-1.191589, -0.3382834, -1.144737, 0, 0, 0, 1, 1,
-1.182619, -0.5181782, -1.599506, 0, 0, 0, 1, 1,
-1.179972, 0.1286037, -1.754339, 0, 0, 0, 1, 1,
-1.175416, -0.4555203, -1.70571, 0, 0, 0, 1, 1,
-1.17432, -0.1750968, -2.104641, 0, 0, 0, 1, 1,
-1.173621, 1.096169, -2.156069, 0, 0, 0, 1, 1,
-1.168501, 1.46465, -2.204448, 0, 0, 0, 1, 1,
-1.16493, 1.655733, 1.704807, 1, 1, 1, 1, 1,
-1.160501, -0.0644862, 0.1572918, 1, 1, 1, 1, 1,
-1.159696, 0.05454074, -3.607279, 1, 1, 1, 1, 1,
-1.15434, -0.5577206, -1.827768, 1, 1, 1, 1, 1,
-1.152941, 1.089059, -1.288816, 1, 1, 1, 1, 1,
-1.150844, 0.9903889, -2.099664, 1, 1, 1, 1, 1,
-1.146723, -0.1380862, -2.078929, 1, 1, 1, 1, 1,
-1.146041, -1.200034, -1.820216, 1, 1, 1, 1, 1,
-1.143596, -1.784278, -2.822989, 1, 1, 1, 1, 1,
-1.136871, -2.014181, -1.900326, 1, 1, 1, 1, 1,
-1.136524, -1.015107, -1.21744, 1, 1, 1, 1, 1,
-1.121722, -0.9265131, -2.017693, 1, 1, 1, 1, 1,
-1.119764, -0.346867, -2.223328, 1, 1, 1, 1, 1,
-1.115981, 1.394532, -0.03220937, 1, 1, 1, 1, 1,
-1.115814, -0.2139677, -2.260579, 1, 1, 1, 1, 1,
-1.106733, 0.9039963, -0.6684054, 0, 0, 1, 1, 1,
-1.100962, 1.378997, 1.936046, 1, 0, 0, 1, 1,
-1.092839, -1.116149, -2.248016, 1, 0, 0, 1, 1,
-1.085349, -1.225477, -0.9966772, 1, 0, 0, 1, 1,
-1.077772, -0.236045, -3.749521, 1, 0, 0, 1, 1,
-1.076349, 1.382723, 1.616827, 1, 0, 0, 1, 1,
-1.073828, 0.4387679, -2.356719, 0, 0, 0, 1, 1,
-1.065705, 0.1588042, -1.434553, 0, 0, 0, 1, 1,
-1.060147, 0.2336913, -0.07848421, 0, 0, 0, 1, 1,
-1.054878, 1.058039, -1.750306, 0, 0, 0, 1, 1,
-1.049896, -0.663637, -2.922331, 0, 0, 0, 1, 1,
-1.042767, 0.9874949, -1.877375, 0, 0, 0, 1, 1,
-1.042596, 0.04965527, -1.071824, 0, 0, 0, 1, 1,
-1.040373, -0.5187654, -0.8607276, 1, 1, 1, 1, 1,
-1.040338, -1.00791, -4.091958, 1, 1, 1, 1, 1,
-1.039117, 0.4228522, 0.2730845, 1, 1, 1, 1, 1,
-1.027323, -1.407861, -3.405418, 1, 1, 1, 1, 1,
-1.024392, -1.667474, -4.082247, 1, 1, 1, 1, 1,
-1.023721, -0.9705479, -4.000141, 1, 1, 1, 1, 1,
-1.023244, 0.4720631, -2.068535, 1, 1, 1, 1, 1,
-1.01734, 1.469105, -2.286873, 1, 1, 1, 1, 1,
-1.013697, -1.149086, -3.86993, 1, 1, 1, 1, 1,
-1.007258, -0.361093, 0.4062164, 1, 1, 1, 1, 1,
-1.000291, 0.470831, -2.886525, 1, 1, 1, 1, 1,
-0.9984567, 0.3970227, 0.03178915, 1, 1, 1, 1, 1,
-0.9977861, -0.6403487, -2.614284, 1, 1, 1, 1, 1,
-0.9922641, 1.060094, 0.5511444, 1, 1, 1, 1, 1,
-0.9908373, -0.4997681, -0.8878918, 1, 1, 1, 1, 1,
-0.9862401, 0.7476947, -1.666093, 0, 0, 1, 1, 1,
-0.9858255, 1.70183, -0.1495264, 1, 0, 0, 1, 1,
-0.9657835, 0.1911637, -1.868552, 1, 0, 0, 1, 1,
-0.9650389, -1.364194, -2.905116, 1, 0, 0, 1, 1,
-0.9638572, 1.061606, -0.3285587, 1, 0, 0, 1, 1,
-0.9569469, -0.208319, -2.519509, 1, 0, 0, 1, 1,
-0.9390707, 1.078552, -1.19608, 0, 0, 0, 1, 1,
-0.9361202, 0.6524402, 0.2350895, 0, 0, 0, 1, 1,
-0.9348498, 0.5419863, -0.9865259, 0, 0, 0, 1, 1,
-0.9344724, 0.5183877, -0.2234878, 0, 0, 0, 1, 1,
-0.9318904, 1.192922, -2.057599, 0, 0, 0, 1, 1,
-0.9284515, -1.124858, -3.430453, 0, 0, 0, 1, 1,
-0.9281445, 0.4872222, -0.674984, 0, 0, 0, 1, 1,
-0.9271923, 1.015353, -1.038828, 1, 1, 1, 1, 1,
-0.9254079, -0.7360232, 0.8732027, 1, 1, 1, 1, 1,
-0.9242985, -0.6959807, -1.995732, 1, 1, 1, 1, 1,
-0.9216657, 0.7384651, 1.212612, 1, 1, 1, 1, 1,
-0.9216086, -0.1140483, -1.231681, 1, 1, 1, 1, 1,
-0.9184467, 2.893877, -0.7155057, 1, 1, 1, 1, 1,
-0.9140554, 1.040955, -1.413609, 1, 1, 1, 1, 1,
-0.9136636, -1.130201, -2.453489, 1, 1, 1, 1, 1,
-0.9083093, -0.5832326, -1.817729, 1, 1, 1, 1, 1,
-0.9017304, 0.4469258, -1.130703, 1, 1, 1, 1, 1,
-0.9010695, 2.278103, -0.7432655, 1, 1, 1, 1, 1,
-0.90071, 2.188492, 0.005710948, 1, 1, 1, 1, 1,
-0.8985484, -0.798658, -3.259631, 1, 1, 1, 1, 1,
-0.8925594, 1.493364, -1.997864, 1, 1, 1, 1, 1,
-0.8922254, 0.8258953, -2.430144, 1, 1, 1, 1, 1,
-0.8862361, 0.877906, -1.137002, 0, 0, 1, 1, 1,
-0.8800244, -0.07022845, -2.052449, 1, 0, 0, 1, 1,
-0.8775031, -0.3390101, -3.001753, 1, 0, 0, 1, 1,
-0.8739036, -1.610799, -2.53145, 1, 0, 0, 1, 1,
-0.8736291, -0.1004522, -2.922693, 1, 0, 0, 1, 1,
-0.8733504, 1.224769, -0.08344685, 1, 0, 0, 1, 1,
-0.8661335, 0.2347203, -2.370407, 0, 0, 0, 1, 1,
-0.8635195, 1.320569, -1.114555, 0, 0, 0, 1, 1,
-0.859592, 0.8744352, -3.067933, 0, 0, 0, 1, 1,
-0.8587921, -0.7336963, -2.173549, 0, 0, 0, 1, 1,
-0.8559894, -0.8602523, -3.483113, 0, 0, 0, 1, 1,
-0.8536192, 1.300978, -1.143999, 0, 0, 0, 1, 1,
-0.841334, -0.04632295, -2.508742, 0, 0, 0, 1, 1,
-0.8393226, -1.096326, -2.803012, 1, 1, 1, 1, 1,
-0.8378193, -0.4072319, -1.873955, 1, 1, 1, 1, 1,
-0.8326828, 0.1372177, -0.8022158, 1, 1, 1, 1, 1,
-0.829522, -0.6412288, -1.808108, 1, 1, 1, 1, 1,
-0.82392, -1.173561, -2.925277, 1, 1, 1, 1, 1,
-0.8198848, -1.463942, -2.587717, 1, 1, 1, 1, 1,
-0.8141267, -0.9872403, -1.884649, 1, 1, 1, 1, 1,
-0.8137957, -0.2130718, -1.722143, 1, 1, 1, 1, 1,
-0.8117469, 0.4244237, -0.8400978, 1, 1, 1, 1, 1,
-0.8094046, 1.295375, -1.847795, 1, 1, 1, 1, 1,
-0.8049057, 1.686915, 0.7171112, 1, 1, 1, 1, 1,
-0.794578, 0.9211722, 0.03366753, 1, 1, 1, 1, 1,
-0.7849546, -0.5769179, -0.2056439, 1, 1, 1, 1, 1,
-0.7796588, 0.7873412, -0.1724651, 1, 1, 1, 1, 1,
-0.7751206, -0.6804746, -2.837041, 1, 1, 1, 1, 1,
-0.7737007, 0.2318428, -1.114642, 0, 0, 1, 1, 1,
-0.7691939, 0.541716, -1.85755, 1, 0, 0, 1, 1,
-0.7691589, -0.3870956, -1.684233, 1, 0, 0, 1, 1,
-0.7651893, -0.3614313, -2.607431, 1, 0, 0, 1, 1,
-0.7640468, -0.4873387, -2.337571, 1, 0, 0, 1, 1,
-0.7621663, -0.6541275, -2.14319, 1, 0, 0, 1, 1,
-0.7621097, -0.9389761, -1.524516, 0, 0, 0, 1, 1,
-0.7593231, 0.6493816, -0.7186931, 0, 0, 0, 1, 1,
-0.7572275, -1.16093, -3.002922, 0, 0, 0, 1, 1,
-0.7570965, -0.624303, -4.012613, 0, 0, 0, 1, 1,
-0.7468646, 0.7969501, -0.7881339, 0, 0, 0, 1, 1,
-0.7382038, -1.364982, -3.196933, 0, 0, 0, 1, 1,
-0.7372184, 1.337896, -0.05038916, 0, 0, 0, 1, 1,
-0.7349817, 0.7290927, -0.9469326, 1, 1, 1, 1, 1,
-0.7334176, -0.5320491, -0.8353658, 1, 1, 1, 1, 1,
-0.7318139, -0.3826231, -2.292165, 1, 1, 1, 1, 1,
-0.7307186, 1.80344, -0.8360214, 1, 1, 1, 1, 1,
-0.7284741, 0.1512153, -0.09591975, 1, 1, 1, 1, 1,
-0.7272114, 1.237346, -0.550649, 1, 1, 1, 1, 1,
-0.7248789, 0.7152714, -1.249268, 1, 1, 1, 1, 1,
-0.7247115, -1.49683, -3.81958, 1, 1, 1, 1, 1,
-0.7215596, 0.3597153, -1.812491, 1, 1, 1, 1, 1,
-0.7178806, 0.6759245, 1.177917, 1, 1, 1, 1, 1,
-0.7163376, -1.015592, -2.654822, 1, 1, 1, 1, 1,
-0.7154776, -0.5888258, -2.756102, 1, 1, 1, 1, 1,
-0.695954, -1.015732, -3.305153, 1, 1, 1, 1, 1,
-0.6959253, 0.5221667, -0.951124, 1, 1, 1, 1, 1,
-0.6716173, -0.06844172, -1.866959, 1, 1, 1, 1, 1,
-0.6648748, 0.8061538, -1.274011, 0, 0, 1, 1, 1,
-0.6620572, 0.57588, -2.639485, 1, 0, 0, 1, 1,
-0.6614748, 0.5708959, -0.340427, 1, 0, 0, 1, 1,
-0.6594601, 0.6609319, -0.6319309, 1, 0, 0, 1, 1,
-0.6577377, -2.103641, -3.25714, 1, 0, 0, 1, 1,
-0.6575806, -2.691149, -4.58868, 1, 0, 0, 1, 1,
-0.654608, 0.6777906, -1.149832, 0, 0, 0, 1, 1,
-0.6540308, -0.5601616, -4.045757, 0, 0, 0, 1, 1,
-0.64705, 0.1349747, -0.7206449, 0, 0, 0, 1, 1,
-0.6464349, -1.392763, -1.909387, 0, 0, 0, 1, 1,
-0.6433701, 0.8953533, -1.278421, 0, 0, 0, 1, 1,
-0.6420209, 1.587096, 0.6641444, 0, 0, 0, 1, 1,
-0.6410007, 0.9352779, 0.7143828, 0, 0, 0, 1, 1,
-0.6389929, 0.04028933, -1.993571, 1, 1, 1, 1, 1,
-0.6353238, -1.095889, -1.384639, 1, 1, 1, 1, 1,
-0.634043, -0.7551627, -2.026081, 1, 1, 1, 1, 1,
-0.6318912, 0.2545705, -1.656718, 1, 1, 1, 1, 1,
-0.6288062, 0.3459954, -1.339032, 1, 1, 1, 1, 1,
-0.6278738, 0.3113808, -2.608266, 1, 1, 1, 1, 1,
-0.6276944, -0.2318234, -2.862213, 1, 1, 1, 1, 1,
-0.6267363, 0.1444569, 0.6828518, 1, 1, 1, 1, 1,
-0.6255653, -0.3170846, -1.61399, 1, 1, 1, 1, 1,
-0.6226882, 2.638805, -0.4219016, 1, 1, 1, 1, 1,
-0.621594, -0.5271037, -1.803002, 1, 1, 1, 1, 1,
-0.6191083, -0.3484491, -1.548255, 1, 1, 1, 1, 1,
-0.6143596, -3.617556, -4.361322, 1, 1, 1, 1, 1,
-0.6044778, 0.9276652, -1.187911, 1, 1, 1, 1, 1,
-0.6032371, 0.6396964, -0.4185832, 1, 1, 1, 1, 1,
-0.6021925, -1.268414, -4.18724, 0, 0, 1, 1, 1,
-0.601605, -1.731172, -4.56445, 1, 0, 0, 1, 1,
-0.5973442, 1.620032, 0.2389611, 1, 0, 0, 1, 1,
-0.5962815, -0.7196801, -1.384862, 1, 0, 0, 1, 1,
-0.5957382, 0.1745483, -0.5665301, 1, 0, 0, 1, 1,
-0.59532, 0.8019797, -1.125919, 1, 0, 0, 1, 1,
-0.5952318, 0.8842005, -0.9883287, 0, 0, 0, 1, 1,
-0.592097, 0.007063945, -3.235374, 0, 0, 0, 1, 1,
-0.5909802, -0.5095885, -3.0172, 0, 0, 0, 1, 1,
-0.5890301, -1.480503, -2.61466, 0, 0, 0, 1, 1,
-0.5885648, -2.133478, -2.296142, 0, 0, 0, 1, 1,
-0.5881663, 0.8784867, -2.309476, 0, 0, 0, 1, 1,
-0.580324, -0.8456536, -1.505444, 0, 0, 0, 1, 1,
-0.5786961, -0.2528365, -2.064926, 1, 1, 1, 1, 1,
-0.5775504, 0.222952, -1.155184, 1, 1, 1, 1, 1,
-0.576755, -1.060993, -2.461325, 1, 1, 1, 1, 1,
-0.5719241, 0.3911623, -0.3586141, 1, 1, 1, 1, 1,
-0.5715236, 0.8501858, -0.389464, 1, 1, 1, 1, 1,
-0.5711493, -0.401135, -1.511225, 1, 1, 1, 1, 1,
-0.5690886, 1.800385, -0.5421536, 1, 1, 1, 1, 1,
-0.5643274, -1.233589, -3.647618, 1, 1, 1, 1, 1,
-0.5598806, -0.06487962, -1.906508, 1, 1, 1, 1, 1,
-0.558488, 0.4178775, -1.050306, 1, 1, 1, 1, 1,
-0.5572541, 0.3293297, -3.210701, 1, 1, 1, 1, 1,
-0.5534422, 1.451569, -0.4673923, 1, 1, 1, 1, 1,
-0.5484521, -0.01432634, 0.7533057, 1, 1, 1, 1, 1,
-0.5459679, 0.7145353, -0.7353491, 1, 1, 1, 1, 1,
-0.543398, 1.11409, -1.18141, 1, 1, 1, 1, 1,
-0.5348943, 2.085207, 0.007423469, 0, 0, 1, 1, 1,
-0.5341453, -1.127317, -2.092712, 1, 0, 0, 1, 1,
-0.5336887, 1.406823, 0.5921347, 1, 0, 0, 1, 1,
-0.5285042, 0.6762503, -0.5072928, 1, 0, 0, 1, 1,
-0.5241315, -0.5191979, -2.586016, 1, 0, 0, 1, 1,
-0.5171243, 0.2687082, 0.7931827, 1, 0, 0, 1, 1,
-0.5146697, 0.03101316, -3.077576, 0, 0, 0, 1, 1,
-0.5138629, 0.9513789, 0.7449988, 0, 0, 0, 1, 1,
-0.5096758, -0.5923051, -3.092573, 0, 0, 0, 1, 1,
-0.5025326, -0.1941384, -0.7079424, 0, 0, 0, 1, 1,
-0.5000789, 0.7024598, 0.9626868, 0, 0, 0, 1, 1,
-0.4994434, 0.766932, -2.320662, 0, 0, 0, 1, 1,
-0.4975341, -0.5224321, -2.754733, 0, 0, 0, 1, 1,
-0.4969912, -0.5698557, -4.82017, 1, 1, 1, 1, 1,
-0.49467, -0.4729333, -1.20985, 1, 1, 1, 1, 1,
-0.4945394, 0.1982371, -1.603436, 1, 1, 1, 1, 1,
-0.4943328, 0.3425191, 0.7676885, 1, 1, 1, 1, 1,
-0.4907464, -0.2504999, -0.8331029, 1, 1, 1, 1, 1,
-0.4888513, -0.3985558, -4.063526, 1, 1, 1, 1, 1,
-0.4858466, -0.6420041, -1.015666, 1, 1, 1, 1, 1,
-0.4828999, 0.1959752, -1.183371, 1, 1, 1, 1, 1,
-0.4762968, 0.4676805, -1.154729, 1, 1, 1, 1, 1,
-0.4752982, -0.5398148, -3.41905, 1, 1, 1, 1, 1,
-0.4750419, 0.2652414, -1.350324, 1, 1, 1, 1, 1,
-0.4732842, 0.5717885, -0.9250236, 1, 1, 1, 1, 1,
-0.4723782, -1.554085, -3.331473, 1, 1, 1, 1, 1,
-0.4681664, 0.3069712, -0.8460682, 1, 1, 1, 1, 1,
-0.4668505, 0.2396106, -0.6770998, 1, 1, 1, 1, 1,
-0.4658223, 1.654379, 0.5421894, 0, 0, 1, 1, 1,
-0.4653513, -0.1069289, -1.609905, 1, 0, 0, 1, 1,
-0.4624512, -0.1673898, -2.940209, 1, 0, 0, 1, 1,
-0.4616334, -1.295477, -5.319083, 1, 0, 0, 1, 1,
-0.4600108, 1.072154, -3.100707, 1, 0, 0, 1, 1,
-0.4595633, -0.3042158, -2.597203, 1, 0, 0, 1, 1,
-0.4589806, 0.9278961, -0.6639276, 0, 0, 0, 1, 1,
-0.4588508, -0.3139809, -2.532574, 0, 0, 0, 1, 1,
-0.457119, 0.07860814, -1.075164, 0, 0, 0, 1, 1,
-0.4560655, -0.04284092, -2.300487, 0, 0, 0, 1, 1,
-0.4517294, -1.408481, -4.185891, 0, 0, 0, 1, 1,
-0.4501056, -1.018932, -4.092014, 0, 0, 0, 1, 1,
-0.4477978, -0.06904081, -3.616714, 0, 0, 0, 1, 1,
-0.4459364, -0.752122, -2.502886, 1, 1, 1, 1, 1,
-0.4431327, 0.8835726, -0.3096499, 1, 1, 1, 1, 1,
-0.4425808, -0.3162233, -2.107684, 1, 1, 1, 1, 1,
-0.4421521, 0.3438121, -1.035498, 1, 1, 1, 1, 1,
-0.4407128, 0.4706196, -2.185539, 1, 1, 1, 1, 1,
-0.4395956, -0.7641749, -3.473568, 1, 1, 1, 1, 1,
-0.4381867, -0.8097905, -3.142234, 1, 1, 1, 1, 1,
-0.4374299, 0.07430671, -1.873382, 1, 1, 1, 1, 1,
-0.4056324, -1.122812, -3.017473, 1, 1, 1, 1, 1,
-0.4038436, -0.8479541, -2.153958, 1, 1, 1, 1, 1,
-0.4014862, 0.3948001, -0.6989219, 1, 1, 1, 1, 1,
-0.3994111, 0.8260928, -0.1937871, 1, 1, 1, 1, 1,
-0.3969589, 1.486111, -0.3986966, 1, 1, 1, 1, 1,
-0.3949588, 0.1647622, -0.8213074, 1, 1, 1, 1, 1,
-0.3910165, -0.2211748, -4.017538, 1, 1, 1, 1, 1,
-0.3839729, 1.015492, 1.411496, 0, 0, 1, 1, 1,
-0.3796572, 0.1174401, -1.934736, 1, 0, 0, 1, 1,
-0.3785021, 0.1223126, -0.3113748, 1, 0, 0, 1, 1,
-0.3784703, -1.776484, -4.975613, 1, 0, 0, 1, 1,
-0.3784442, -0.9256106, -2.979097, 1, 0, 0, 1, 1,
-0.3753324, 0.2679836, -1.294094, 1, 0, 0, 1, 1,
-0.3704574, 0.9740923, -0.4030714, 0, 0, 0, 1, 1,
-0.366112, 0.1766735, -1.76792, 0, 0, 0, 1, 1,
-0.3608644, 1.071607, 0.3174527, 0, 0, 0, 1, 1,
-0.3564565, -0.3471476, -3.197601, 0, 0, 0, 1, 1,
-0.3548274, 2.067713, 0.7189484, 0, 0, 0, 1, 1,
-0.3538973, -0.2958754, -2.465657, 0, 0, 0, 1, 1,
-0.3508657, -1.882801, -2.718472, 0, 0, 0, 1, 1,
-0.3494171, 0.4106641, -3.620562, 1, 1, 1, 1, 1,
-0.3489137, 1.120624, 1.252142, 1, 1, 1, 1, 1,
-0.3475675, -0.2242253, -1.036052, 1, 1, 1, 1, 1,
-0.3457945, 2.560068, -0.6632181, 1, 1, 1, 1, 1,
-0.3437584, -0.6978185, -3.034888, 1, 1, 1, 1, 1,
-0.343242, 0.2257761, 0.0676615, 1, 1, 1, 1, 1,
-0.3392104, 0.6545857, -0.5703204, 1, 1, 1, 1, 1,
-0.3388643, -0.8592282, -3.266575, 1, 1, 1, 1, 1,
-0.3386528, -3.02046, -3.631977, 1, 1, 1, 1, 1,
-0.3376149, 0.8222725, -1.441276, 1, 1, 1, 1, 1,
-0.3320766, -1.419961, -3.91683, 1, 1, 1, 1, 1,
-0.3292956, -0.5164478, -2.891588, 1, 1, 1, 1, 1,
-0.3280757, 0.8248307, 1.814687, 1, 1, 1, 1, 1,
-0.3266377, -0.5849928, -3.997213, 1, 1, 1, 1, 1,
-0.32568, 0.1521696, -1.076521, 1, 1, 1, 1, 1,
-0.3210505, 0.1052042, 0.6264051, 0, 0, 1, 1, 1,
-0.3202336, 0.9863643, -0.9060255, 1, 0, 0, 1, 1,
-0.3197825, -1.293203, -2.4881, 1, 0, 0, 1, 1,
-0.3191708, 2.759182, -0.1802195, 1, 0, 0, 1, 1,
-0.3149923, -1.599717, -4.273766, 1, 0, 0, 1, 1,
-0.3111955, 1.115787, -1.75669, 1, 0, 0, 1, 1,
-0.3081934, 0.7048631, -0.2105426, 0, 0, 0, 1, 1,
-0.3050974, 0.337567, -0.4175061, 0, 0, 0, 1, 1,
-0.3048627, 2.470803, -0.3966024, 0, 0, 0, 1, 1,
-0.3030768, -0.03444054, -1.86611, 0, 0, 0, 1, 1,
-0.2965882, -0.4834034, -3.00839, 0, 0, 0, 1, 1,
-0.2956193, 0.5284168, -0.313513, 0, 0, 0, 1, 1,
-0.2920879, -1.422707, -2.050165, 0, 0, 0, 1, 1,
-0.290318, 2.938155, -0.2845908, 1, 1, 1, 1, 1,
-0.2898736, -0.2101065, -2.529992, 1, 1, 1, 1, 1,
-0.2873464, -0.5286298, -3.421276, 1, 1, 1, 1, 1,
-0.281787, 1.224687, -0.9322212, 1, 1, 1, 1, 1,
-0.2814758, -0.6300855, -2.395085, 1, 1, 1, 1, 1,
-0.2640528, 0.3059775, 0.6656255, 1, 1, 1, 1, 1,
-0.2631847, -1.698525, -2.306494, 1, 1, 1, 1, 1,
-0.2630683, 0.3149249, -1.943197, 1, 1, 1, 1, 1,
-0.2597032, -0.3758053, -1.712625, 1, 1, 1, 1, 1,
-0.2549563, -0.3756139, -2.860836, 1, 1, 1, 1, 1,
-0.2539624, -0.5839298, -3.635406, 1, 1, 1, 1, 1,
-0.2535639, 0.6268461, -0.1686949, 1, 1, 1, 1, 1,
-0.2525509, 0.5907416, 0.07643645, 1, 1, 1, 1, 1,
-0.2509185, 0.2158117, 0.5987319, 1, 1, 1, 1, 1,
-0.2506495, 0.004088421, -0.5966272, 1, 1, 1, 1, 1,
-0.2482306, -2.73292, -2.986376, 0, 0, 1, 1, 1,
-0.242245, 0.3713712, -2.201778, 1, 0, 0, 1, 1,
-0.2331028, -0.4667146, -2.63209, 1, 0, 0, 1, 1,
-0.2323883, -0.3028825, -3.291034, 1, 0, 0, 1, 1,
-0.2300912, -0.6844709, -3.651394, 1, 0, 0, 1, 1,
-0.2285186, 0.2244124, -2.47999, 1, 0, 0, 1, 1,
-0.2281602, 1.067294, -0.1215808, 0, 0, 0, 1, 1,
-0.2175515, -1.197048, -2.328555, 0, 0, 0, 1, 1,
-0.2169188, -0.04417817, -0.7522468, 0, 0, 0, 1, 1,
-0.2134632, 0.2306358, 0.006322434, 0, 0, 0, 1, 1,
-0.2131511, -1.153507, -3.249461, 0, 0, 0, 1, 1,
-0.2075515, 1.775674, -0.7546381, 0, 0, 0, 1, 1,
-0.2034915, -2.089818, -4.618743, 0, 0, 0, 1, 1,
-0.2033011, -0.4063009, -3.154476, 1, 1, 1, 1, 1,
-0.201286, -0.6806237, -1.950568, 1, 1, 1, 1, 1,
-0.2006442, -0.6316414, -2.341455, 1, 1, 1, 1, 1,
-0.2002047, 0.5533565, -2.308077, 1, 1, 1, 1, 1,
-0.2000311, 0.3167639, -0.2047927, 1, 1, 1, 1, 1,
-0.1990337, 2.093787, -0.8183239, 1, 1, 1, 1, 1,
-0.1953158, 0.8791378, 0.4047791, 1, 1, 1, 1, 1,
-0.1905833, -0.4779477, -2.302478, 1, 1, 1, 1, 1,
-0.1883267, -0.4765667, -1.619669, 1, 1, 1, 1, 1,
-0.1883168, -0.8464248, -1.874897, 1, 1, 1, 1, 1,
-0.1860565, -0.6750531, -2.641208, 1, 1, 1, 1, 1,
-0.1851074, 1.608255, -0.08990088, 1, 1, 1, 1, 1,
-0.1824587, -0.7056994, -1.901019, 1, 1, 1, 1, 1,
-0.1775833, -0.01728896, -1.065763, 1, 1, 1, 1, 1,
-0.1774709, -1.457602, -2.67316, 1, 1, 1, 1, 1,
-0.1773323, -0.1303364, -0.8332646, 0, 0, 1, 1, 1,
-0.1767395, -0.1423904, -3.535793, 1, 0, 0, 1, 1,
-0.1765969, 0.06416705, -1.291999, 1, 0, 0, 1, 1,
-0.1742885, 0.5852051, -0.05814666, 1, 0, 0, 1, 1,
-0.1734326, 0.724675, 0.2468954, 1, 0, 0, 1, 1,
-0.1712605, 0.9004846, 1.133648, 1, 0, 0, 1, 1,
-0.1698426, 0.8228061, -0.8022513, 0, 0, 0, 1, 1,
-0.1691161, 0.8400796, -0.1820981, 0, 0, 0, 1, 1,
-0.1682729, -0.3549795, -2.482807, 0, 0, 0, 1, 1,
-0.1680121, -0.2441546, -2.835533, 0, 0, 0, 1, 1,
-0.1651461, -0.04533017, -2.880744, 0, 0, 0, 1, 1,
-0.1643188, 0.2947827, -2.753948, 0, 0, 0, 1, 1,
-0.1617209, 2.14975, -0.946941, 0, 0, 0, 1, 1,
-0.1608884, 0.06489911, 0.3541787, 1, 1, 1, 1, 1,
-0.1594092, 2.413163, -0.1177396, 1, 1, 1, 1, 1,
-0.1564505, -1.185909, -3.367147, 1, 1, 1, 1, 1,
-0.1563434, -2.560585, -2.55719, 1, 1, 1, 1, 1,
-0.1556474, 0.7978065, -0.9432637, 1, 1, 1, 1, 1,
-0.1487185, -1.403197, -2.74043, 1, 1, 1, 1, 1,
-0.1373026, -2.080765, -1.829453, 1, 1, 1, 1, 1,
-0.1350553, -0.1687588, -3.342593, 1, 1, 1, 1, 1,
-0.1335349, -0.7403588, -2.867867, 1, 1, 1, 1, 1,
-0.1315471, 1.653117, 1.043527, 1, 1, 1, 1, 1,
-0.130725, 0.6994966, 1.89145, 1, 1, 1, 1, 1,
-0.128649, -0.2762997, -3.374419, 1, 1, 1, 1, 1,
-0.1253545, -0.887445, -2.636322, 1, 1, 1, 1, 1,
-0.1234254, 2.598697, 0.1100411, 1, 1, 1, 1, 1,
-0.1165551, -0.4419031, -1.286428, 1, 1, 1, 1, 1,
-0.1136863, -0.1288244, -3.041197, 0, 0, 1, 1, 1,
-0.1118033, -1.229558, -3.046628, 1, 0, 0, 1, 1,
-0.1084825, 0.1079119, -0.9947121, 1, 0, 0, 1, 1,
-0.1011484, -0.221019, -2.373106, 1, 0, 0, 1, 1,
-0.1005743, -0.5440622, -3.712925, 1, 0, 0, 1, 1,
-0.09643038, 0.1435649, -0.3682722, 1, 0, 0, 1, 1,
-0.09100777, -0.5590504, -3.195809, 0, 0, 0, 1, 1,
-0.09089792, 0.9880895, -0.814522, 0, 0, 0, 1, 1,
-0.08738489, -1.500592, -3.446412, 0, 0, 0, 1, 1,
-0.08510714, -1.564156, -3.369037, 0, 0, 0, 1, 1,
-0.08331818, -0.6374635, -3.32964, 0, 0, 0, 1, 1,
-0.08175933, 0.09293339, -1.460112, 0, 0, 0, 1, 1,
-0.08174368, 1.166764, 0.6966236, 0, 0, 0, 1, 1,
-0.08121043, 0.3651063, -0.761301, 1, 1, 1, 1, 1,
-0.0778081, -0.7003615, -3.604981, 1, 1, 1, 1, 1,
-0.07363907, 0.3010279, 0.1142967, 1, 1, 1, 1, 1,
-0.07287786, -0.3805085, -2.370905, 1, 1, 1, 1, 1,
-0.07177774, 1.74196, 0.8050203, 1, 1, 1, 1, 1,
-0.06881878, -0.005877876, -3.983164, 1, 1, 1, 1, 1,
-0.06875048, 0.08089626, -0.6051645, 1, 1, 1, 1, 1,
-0.06776898, 0.5565982, -0.4833998, 1, 1, 1, 1, 1,
-0.06333944, 1.05035, 1.167276, 1, 1, 1, 1, 1,
-0.05405433, 0.6063562, 0.8307721, 1, 1, 1, 1, 1,
-0.0531095, -0.1947904, -3.512861, 1, 1, 1, 1, 1,
-0.05022109, -0.6428682, -3.027806, 1, 1, 1, 1, 1,
-0.04941446, -1.18864, -2.362739, 1, 1, 1, 1, 1,
-0.04895335, 1.519253, -0.494833, 1, 1, 1, 1, 1,
-0.045522, -0.9009544, -2.328564, 1, 1, 1, 1, 1,
-0.04433219, -0.1325568, -3.698926, 0, 0, 1, 1, 1,
-0.04188122, 0.1848579, -2.510281, 1, 0, 0, 1, 1,
-0.04036987, 1.197978, 0.4872375, 1, 0, 0, 1, 1,
-0.03918048, 1.1136, 0.9509053, 1, 0, 0, 1, 1,
-0.03773928, 1.03755, -0.613179, 1, 0, 0, 1, 1,
-0.03530273, -2.258101, -3.174357, 1, 0, 0, 1, 1,
-0.03320032, 1.950286, -1.269567, 0, 0, 0, 1, 1,
-0.03155351, 0.9066295, 1.151847, 0, 0, 0, 1, 1,
-0.02934383, -0.5745248, -3.199573, 0, 0, 0, 1, 1,
-0.02790438, 0.3877458, 0.4971289, 0, 0, 0, 1, 1,
-0.02687216, -0.08614194, -1.871849, 0, 0, 0, 1, 1,
-0.02675273, 0.05215493, -0.9215726, 0, 0, 0, 1, 1,
-0.02449143, -0.5642869, -4.540241, 0, 0, 0, 1, 1,
-0.02090104, 0.2606565, 0.4141473, 1, 1, 1, 1, 1,
-0.01801909, 0.09884008, 0.04407652, 1, 1, 1, 1, 1,
-0.01741003, 0.881239, -0.09802675, 1, 1, 1, 1, 1,
-0.01739367, 1.026231, -0.2847844, 1, 1, 1, 1, 1,
-0.01441654, 0.1773468, -0.5304034, 1, 1, 1, 1, 1,
-0.01288829, 0.3330019, 0.4851167, 1, 1, 1, 1, 1,
-0.01228598, 0.2961034, -1.404431, 1, 1, 1, 1, 1,
-0.009586196, -0.850924, -2.055222, 1, 1, 1, 1, 1,
-0.004206824, -0.0695255, -2.397125, 1, 1, 1, 1, 1,
0.002335739, 0.001395936, 0.5187941, 1, 1, 1, 1, 1,
0.007257617, 0.2801812, 0.2548989, 1, 1, 1, 1, 1,
0.0083537, -0.250136, 2.834597, 1, 1, 1, 1, 1,
0.009757922, 0.3074999, -1.821392, 1, 1, 1, 1, 1,
0.01296243, -2.189325, 1.945959, 1, 1, 1, 1, 1,
0.015045, -1.277658, 3.477341, 1, 1, 1, 1, 1,
0.01820188, -0.2963336, 2.931946, 0, 0, 1, 1, 1,
0.02042325, 0.05530479, 0.09164225, 1, 0, 0, 1, 1,
0.02152571, 0.1509876, 0.7192034, 1, 0, 0, 1, 1,
0.02203407, -0.7150868, 1.517423, 1, 0, 0, 1, 1,
0.02351554, 0.3888008, 0.1372805, 1, 0, 0, 1, 1,
0.02428808, -0.4249852, 5.516049, 1, 0, 0, 1, 1,
0.02618753, 1.475603, -0.122363, 0, 0, 0, 1, 1,
0.02873922, 0.402256, 1.410462, 0, 0, 0, 1, 1,
0.03057393, -0.5209457, 3.122551, 0, 0, 0, 1, 1,
0.03476427, -1.074892, 2.888532, 0, 0, 0, 1, 1,
0.03982493, -0.6629019, 5.238609, 0, 0, 0, 1, 1,
0.04303727, -0.8254629, 4.020602, 0, 0, 0, 1, 1,
0.05373831, 1.02848, -1.589436, 0, 0, 0, 1, 1,
0.0648855, -1.685141, 1.140652, 1, 1, 1, 1, 1,
0.0649101, 0.11788, -0.2052315, 1, 1, 1, 1, 1,
0.06763855, 1.058333, 1.143507, 1, 1, 1, 1, 1,
0.06801001, 0.3617091, 1.449665, 1, 1, 1, 1, 1,
0.0686444, -0.2810807, 3.263275, 1, 1, 1, 1, 1,
0.07192096, -0.414753, 3.49027, 1, 1, 1, 1, 1,
0.07329204, 0.5664479, 0.0008057164, 1, 1, 1, 1, 1,
0.07666424, -0.7587249, 2.596591, 1, 1, 1, 1, 1,
0.0773031, -0.8847777, 3.42073, 1, 1, 1, 1, 1,
0.07915325, -1.544119, 3.056591, 1, 1, 1, 1, 1,
0.08047724, -1.055292, 3.558617, 1, 1, 1, 1, 1,
0.08459046, 0.9737164, -1.343886, 1, 1, 1, 1, 1,
0.08701985, 1.650477, 0.1985657, 1, 1, 1, 1, 1,
0.09114318, -0.04948878, 1.883171, 1, 1, 1, 1, 1,
0.09352558, -1.131567, 3.527556, 1, 1, 1, 1, 1,
0.09771435, -0.1015855, 3.240333, 0, 0, 1, 1, 1,
0.09936033, -1.300694, 3.524182, 1, 0, 0, 1, 1,
0.09989331, -0.8005716, 3.383644, 1, 0, 0, 1, 1,
0.1020343, -0.8003023, 3.270827, 1, 0, 0, 1, 1,
0.1062577, -0.1900153, 3.295683, 1, 0, 0, 1, 1,
0.1099318, 0.9973871, -0.925113, 1, 0, 0, 1, 1,
0.1161863, -0.1549601, 2.118931, 0, 0, 0, 1, 1,
0.1201503, 1.309394, 1.87248, 0, 0, 0, 1, 1,
0.1213754, -1.446224, 3.172947, 0, 0, 0, 1, 1,
0.1250027, 0.07777154, 2.201455, 0, 0, 0, 1, 1,
0.1277224, -0.2600634, 2.660705, 0, 0, 0, 1, 1,
0.1331021, -1.11543, 2.433548, 0, 0, 0, 1, 1,
0.1371946, -1.929086, 2.770903, 0, 0, 0, 1, 1,
0.1380999, -0.5761569, 1.780547, 1, 1, 1, 1, 1,
0.1414311, -0.1265819, 5.016283, 1, 1, 1, 1, 1,
0.1415413, -0.6822779, 1.833779, 1, 1, 1, 1, 1,
0.1422378, 1.809837, -1.126295, 1, 1, 1, 1, 1,
0.1428679, 1.214165, 0.5664285, 1, 1, 1, 1, 1,
0.14372, -0.004948622, 3.707608, 1, 1, 1, 1, 1,
0.1440427, 0.2114526, -0.8346795, 1, 1, 1, 1, 1,
0.148299, 1.102154, -0.7485083, 1, 1, 1, 1, 1,
0.150448, 0.1513762, 0.7809443, 1, 1, 1, 1, 1,
0.1504555, 0.7939862, -1.1984, 1, 1, 1, 1, 1,
0.1504786, -0.8536452, 4.064594, 1, 1, 1, 1, 1,
0.1509447, -0.2789219, 3.681117, 1, 1, 1, 1, 1,
0.1515838, 0.1937913, 2.148346, 1, 1, 1, 1, 1,
0.1546649, -1.048682, 3.205842, 1, 1, 1, 1, 1,
0.1552508, 0.334098, 0.2093687, 1, 1, 1, 1, 1,
0.1553168, 0.3741944, -0.9521954, 0, 0, 1, 1, 1,
0.1584756, -2.338888, 3.520907, 1, 0, 0, 1, 1,
0.1612268, 0.2036567, 0.9382109, 1, 0, 0, 1, 1,
0.1713666, -1.565825, 2.534606, 1, 0, 0, 1, 1,
0.1730812, 0.7729523, 1.029143, 1, 0, 0, 1, 1,
0.1731062, -1.586285, 5.312234, 1, 0, 0, 1, 1,
0.1764401, -1.239975, 2.929002, 0, 0, 0, 1, 1,
0.1786429, -0.3306127, 1.095492, 0, 0, 0, 1, 1,
0.1879651, -0.1402193, 1.13344, 0, 0, 0, 1, 1,
0.1885228, 1.989095, -1.905603, 0, 0, 0, 1, 1,
0.1902323, -1.259805, 1.255423, 0, 0, 0, 1, 1,
0.1907484, -0.7967414, 3.901833, 0, 0, 0, 1, 1,
0.1925127, -0.3142289, 3.057989, 0, 0, 0, 1, 1,
0.1931269, 0.2249941, 1.108145, 1, 1, 1, 1, 1,
0.1961325, 2.332357, 1.37043, 1, 1, 1, 1, 1,
0.1991388, 0.5372064, 0.7612605, 1, 1, 1, 1, 1,
0.2030423, -0.7939543, 3.192218, 1, 1, 1, 1, 1,
0.2034023, -0.4308003, 2.685387, 1, 1, 1, 1, 1,
0.2052476, -2.056393, 3.27728, 1, 1, 1, 1, 1,
0.2089437, 0.7956709, 0.2172846, 1, 1, 1, 1, 1,
0.2226117, 0.6273345, 0.1941598, 1, 1, 1, 1, 1,
0.2230818, -0.7094021, 2.078339, 1, 1, 1, 1, 1,
0.228296, 0.4280164, 1.455628, 1, 1, 1, 1, 1,
0.2285772, -0.641775, 2.904823, 1, 1, 1, 1, 1,
0.2316848, -0.9069641, 2.721348, 1, 1, 1, 1, 1,
0.2344998, -1.390231, 2.942329, 1, 1, 1, 1, 1,
0.23463, 0.01017311, 0.6445563, 1, 1, 1, 1, 1,
0.2358026, -1.627729, 3.000923, 1, 1, 1, 1, 1,
0.235985, 1.103574, -0.2202495, 0, 0, 1, 1, 1,
0.2367397, 0.110567, 1.392316, 1, 0, 0, 1, 1,
0.2389473, -0.2657945, 2.583661, 1, 0, 0, 1, 1,
0.2397945, 0.7027005, 2.020986, 1, 0, 0, 1, 1,
0.2403067, 1.247703, -0.6592255, 1, 0, 0, 1, 1,
0.2404414, -1.135472, 1.842164, 1, 0, 0, 1, 1,
0.2444354, 0.3807119, 1.384936, 0, 0, 0, 1, 1,
0.2452434, 0.1481528, 0.01079959, 0, 0, 0, 1, 1,
0.2559019, -1.039956, 0.7781205, 0, 0, 0, 1, 1,
0.2573224, -0.1829328, 2.413798, 0, 0, 0, 1, 1,
0.2577138, -0.8991245, 2.307478, 0, 0, 0, 1, 1,
0.2577553, 0.6199209, 1.903069, 0, 0, 0, 1, 1,
0.2683969, 0.08166535, 0.8788023, 0, 0, 0, 1, 1,
0.2705918, 1.825616, 1.217513, 1, 1, 1, 1, 1,
0.2795309, 1.691993, 0.9532279, 1, 1, 1, 1, 1,
0.284119, 0.174653, 1.230229, 1, 1, 1, 1, 1,
0.2844747, -1.077821, 2.27622, 1, 1, 1, 1, 1,
0.2857152, -0.09378926, 2.587748, 1, 1, 1, 1, 1,
0.2887205, -1.268566, 5.063082, 1, 1, 1, 1, 1,
0.2914942, 0.5183583, 1.770524, 1, 1, 1, 1, 1,
0.2969124, 0.8766152, -0.0257954, 1, 1, 1, 1, 1,
0.3044992, -1.219686, 1.43038, 1, 1, 1, 1, 1,
0.3060055, 0.4951783, 0.1727396, 1, 1, 1, 1, 1,
0.3070309, 0.4538168, -1.011865, 1, 1, 1, 1, 1,
0.3110487, -0.8319585, 0.8041307, 1, 1, 1, 1, 1,
0.3113807, 0.5145965, 0.4886732, 1, 1, 1, 1, 1,
0.315397, -0.8691393, 3.09683, 1, 1, 1, 1, 1,
0.3181024, 0.715753, -2.029993, 1, 1, 1, 1, 1,
0.321775, -0.1051106, 2.089097, 0, 0, 1, 1, 1,
0.3242027, 0.3129651, -0.139485, 1, 0, 0, 1, 1,
0.3247444, 0.9215272, 2.071976, 1, 0, 0, 1, 1,
0.324906, -0.6699199, 3.326271, 1, 0, 0, 1, 1,
0.3287918, 0.1304124, 2.437864, 1, 0, 0, 1, 1,
0.3301915, -0.4820511, 2.658058, 1, 0, 0, 1, 1,
0.3302939, -0.6402898, 1.426659, 0, 0, 0, 1, 1,
0.3426012, 0.6719419, 0.6687143, 0, 0, 0, 1, 1,
0.344027, -0.6302068, 0.9466389, 0, 0, 0, 1, 1,
0.3452112, -0.5982425, 2.151461, 0, 0, 0, 1, 1,
0.3454766, 0.3087847, -1.185466, 0, 0, 0, 1, 1,
0.3499112, -0.3966525, 2.697197, 0, 0, 0, 1, 1,
0.3544135, -0.1861482, 3.508513, 0, 0, 0, 1, 1,
0.3561359, 0.5419945, 1.045923, 1, 1, 1, 1, 1,
0.3565213, 0.4057875, 0.6936135, 1, 1, 1, 1, 1,
0.3566228, -1.317837, 4.366313, 1, 1, 1, 1, 1,
0.3575866, 0.2051505, 1.172775, 1, 1, 1, 1, 1,
0.3630263, 0.8912014, 0.3198374, 1, 1, 1, 1, 1,
0.3672557, -0.2027055, 2.494984, 1, 1, 1, 1, 1,
0.3682124, 0.3563901, 1.805607, 1, 1, 1, 1, 1,
0.3694672, -0.2966281, 2.104266, 1, 1, 1, 1, 1,
0.369515, 0.4801863, 0.8138344, 1, 1, 1, 1, 1,
0.373229, 1.039407, 1.053498, 1, 1, 1, 1, 1,
0.3774125, 0.1270248, 0.9164161, 1, 1, 1, 1, 1,
0.3868371, -0.007810542, 1.802046, 1, 1, 1, 1, 1,
0.3908424, -0.1286773, 2.512282, 1, 1, 1, 1, 1,
0.3914124, -2.736883, 3.641691, 1, 1, 1, 1, 1,
0.396022, -0.968668, 2.302556, 1, 1, 1, 1, 1,
0.3981164, -1.719274, 1.572918, 0, 0, 1, 1, 1,
0.4022859, -0.06857175, 0.47203, 1, 0, 0, 1, 1,
0.4034036, -1.706156, 4.346719, 1, 0, 0, 1, 1,
0.4041215, 0.6065875, -0.1200611, 1, 0, 0, 1, 1,
0.4042496, -0.1945554, 1.947868, 1, 0, 0, 1, 1,
0.4049239, -1.773559, 2.954074, 1, 0, 0, 1, 1,
0.4067386, 1.330527, 1.075014, 0, 0, 0, 1, 1,
0.4069009, -0.3977103, 2.356767, 0, 0, 0, 1, 1,
0.4070913, -1.039816, 4.078846, 0, 0, 0, 1, 1,
0.419771, -0.3177121, 4.203802, 0, 0, 0, 1, 1,
0.4262915, 0.6246987, 0.1710529, 0, 0, 0, 1, 1,
0.4319292, -0.9705156, 3.309634, 0, 0, 0, 1, 1,
0.4324999, -2.670999, 4.655063, 0, 0, 0, 1, 1,
0.433857, 0.09783616, 2.48102, 1, 1, 1, 1, 1,
0.4350185, -1.22255, 2.731365, 1, 1, 1, 1, 1,
0.4401285, 1.165052, -0.8825968, 1, 1, 1, 1, 1,
0.4415486, 2.207039, -0.4712484, 1, 1, 1, 1, 1,
0.4435319, -0.1255983, 2.665277, 1, 1, 1, 1, 1,
0.4463533, -0.8310534, 2.064054, 1, 1, 1, 1, 1,
0.4468394, -1.465183, 3.126191, 1, 1, 1, 1, 1,
0.4468987, -0.1636499, 3.305237, 1, 1, 1, 1, 1,
0.4515241, -0.5126207, 3.394498, 1, 1, 1, 1, 1,
0.4540303, 1.576962, 1.284485, 1, 1, 1, 1, 1,
0.4560722, -0.8172831, 3.04371, 1, 1, 1, 1, 1,
0.4620385, 0.1322318, 0.7311674, 1, 1, 1, 1, 1,
0.4628134, -1.131584, 0.5981739, 1, 1, 1, 1, 1,
0.4694697, -0.03182375, 3.972298, 1, 1, 1, 1, 1,
0.4703472, 1.9535, 0.5297278, 1, 1, 1, 1, 1,
0.4745062, 1.322125, -0.4193498, 0, 0, 1, 1, 1,
0.4809524, 0.4827005, 2.398836, 1, 0, 0, 1, 1,
0.4810686, 1.107227, 2.042755, 1, 0, 0, 1, 1,
0.4811032, -0.06516694, 3.062923, 1, 0, 0, 1, 1,
0.4867103, 0.3585483, 1.007178, 1, 0, 0, 1, 1,
0.4874258, 1.992592, -0.3232853, 1, 0, 0, 1, 1,
0.4885842, 1.131735, 1.031764, 0, 0, 0, 1, 1,
0.495041, -0.0451605, 2.019906, 0, 0, 0, 1, 1,
0.4956306, 0.3068141, 1.156727, 0, 0, 0, 1, 1,
0.4999093, 0.1465486, 1.519083, 0, 0, 0, 1, 1,
0.5069426, 1.800222, 0.4065808, 0, 0, 0, 1, 1,
0.5085168, -0.299915, 3.248548, 0, 0, 0, 1, 1,
0.5110866, 1.16499, 0.07916213, 0, 0, 0, 1, 1,
0.5123583, -0.1255669, 2.238441, 1, 1, 1, 1, 1,
0.5137408, -0.01141993, 1.587683, 1, 1, 1, 1, 1,
0.5193229, 0.551808, 1.291405, 1, 1, 1, 1, 1,
0.5271009, 0.3685704, 1.964832, 1, 1, 1, 1, 1,
0.5297832, -0.9685875, 0.7247185, 1, 1, 1, 1, 1,
0.5298804, 0.3653294, 0.9221444, 1, 1, 1, 1, 1,
0.5300103, -1.061471, 3.666649, 1, 1, 1, 1, 1,
0.5301653, -0.472526, 0.767899, 1, 1, 1, 1, 1,
0.5309607, -0.4840303, 3.139369, 1, 1, 1, 1, 1,
0.5383212, -1.640775, 3.102813, 1, 1, 1, 1, 1,
0.5402519, 0.3641067, 0.733016, 1, 1, 1, 1, 1,
0.5419562, -1.706174, 3.17474, 1, 1, 1, 1, 1,
0.5426456, 0.6004743, 1.610041, 1, 1, 1, 1, 1,
0.5458098, 0.167989, 0.6270459, 1, 1, 1, 1, 1,
0.5486124, 0.9497169, 0.1121111, 1, 1, 1, 1, 1,
0.551113, 0.9738612, 1.473933, 0, 0, 1, 1, 1,
0.5563074, -1.491766, 1.466378, 1, 0, 0, 1, 1,
0.557944, -0.6159396, 1.648103, 1, 0, 0, 1, 1,
0.5580735, -0.1892201, 0.8745516, 1, 0, 0, 1, 1,
0.563621, -0.6130497, 3.767285, 1, 0, 0, 1, 1,
0.5658975, -1.554181, 1.714829, 1, 0, 0, 1, 1,
0.5887361, -1.03827, 1.041332, 0, 0, 0, 1, 1,
0.5892237, 1.754984, -0.07242063, 0, 0, 0, 1, 1,
0.5929386, -1.143591, 3.007069, 0, 0, 0, 1, 1,
0.5944668, -2.060224, 4.280472, 0, 0, 0, 1, 1,
0.5947943, -1.407327, 3.553709, 0, 0, 0, 1, 1,
0.5949963, 0.933673, 1.283361, 0, 0, 0, 1, 1,
0.5963885, -0.09397032, 2.161209, 0, 0, 0, 1, 1,
0.6034311, 0.772341, -0.09802636, 1, 1, 1, 1, 1,
0.6044255, 0.07454835, 1.504104, 1, 1, 1, 1, 1,
0.6097515, 0.2642475, 0.2185453, 1, 1, 1, 1, 1,
0.6167304, -0.07380423, 1.953906, 1, 1, 1, 1, 1,
0.6167412, -0.228212, 3.023574, 1, 1, 1, 1, 1,
0.6215001, -1.487259, 1.030582, 1, 1, 1, 1, 1,
0.6236746, 0.05494387, 0.7150767, 1, 1, 1, 1, 1,
0.6269595, 1.541747, -0.6524946, 1, 1, 1, 1, 1,
0.6281129, 0.1630287, 1.992423, 1, 1, 1, 1, 1,
0.6307694, 0.3507964, 0.3204839, 1, 1, 1, 1, 1,
0.654469, 0.2456895, 2.939751, 1, 1, 1, 1, 1,
0.6707596, -0.1916961, 1.208447, 1, 1, 1, 1, 1,
0.6773433, 1.335454, 1.989041, 1, 1, 1, 1, 1,
0.6791393, -0.2703231, 1.226343, 1, 1, 1, 1, 1,
0.6836575, 0.174324, 2.176498, 1, 1, 1, 1, 1,
0.6881188, -1.183305, 2.439827, 0, 0, 1, 1, 1,
0.6968499, -0.1960852, 1.221164, 1, 0, 0, 1, 1,
0.7000105, -0.5355257, 5.109334, 1, 0, 0, 1, 1,
0.7031516, -0.3071004, 1.203421, 1, 0, 0, 1, 1,
0.7109701, -1.475889, 2.149088, 1, 0, 0, 1, 1,
0.7124256, 0.4575581, 1.187529, 1, 0, 0, 1, 1,
0.7133308, -0.7768152, 2.579673, 0, 0, 0, 1, 1,
0.7159845, -0.2577743, 1.933041, 0, 0, 0, 1, 1,
0.7267309, -1.001899, 3.37668, 0, 0, 0, 1, 1,
0.7395728, 1.636781, -0.01592399, 0, 0, 0, 1, 1,
0.7416016, -0.4211223, 2.689368, 0, 0, 0, 1, 1,
0.7438214, 1.865492, 0.3644996, 0, 0, 0, 1, 1,
0.7471383, -0.6548085, 2.906088, 0, 0, 0, 1, 1,
0.7523801, -0.9281065, 1.384613, 1, 1, 1, 1, 1,
0.7564661, 0.6159261, -0.876862, 1, 1, 1, 1, 1,
0.757665, 1.070426, 1.183915, 1, 1, 1, 1, 1,
0.7594485, -0.5290726, 1.561326, 1, 1, 1, 1, 1,
0.7612674, 1.808271, 0.7903628, 1, 1, 1, 1, 1,
0.761362, 0.3350014, 0.8264483, 1, 1, 1, 1, 1,
0.761968, 0.2360858, 1.146765, 1, 1, 1, 1, 1,
0.7629192, -0.2683266, 2.081611, 1, 1, 1, 1, 1,
0.7639069, 0.08443222, 1.898116, 1, 1, 1, 1, 1,
0.7770442, 1.515011, 0.6676534, 1, 1, 1, 1, 1,
0.7786099, -0.01845587, -0.1024485, 1, 1, 1, 1, 1,
0.7793347, -0.873839, 2.650712, 1, 1, 1, 1, 1,
0.7829175, 1.370042, 0.3885071, 1, 1, 1, 1, 1,
0.7884537, -1.261651, 3.849931, 1, 1, 1, 1, 1,
0.7905527, 0.4296134, 1.368163, 1, 1, 1, 1, 1,
0.7972577, -3.523319, 3.339662, 0, 0, 1, 1, 1,
0.802363, 0.01385632, 3.318752, 1, 0, 0, 1, 1,
0.8024983, 0.5092508, 1.078831, 1, 0, 0, 1, 1,
0.802959, 0.6297114, 0.8989059, 1, 0, 0, 1, 1,
0.8055934, -0.7449177, 0.816084, 1, 0, 0, 1, 1,
0.8085204, 2.089125, -0.387778, 1, 0, 0, 1, 1,
0.8134694, -0.5774664, 1.499331, 0, 0, 0, 1, 1,
0.8141513, 2.489832, 0.5322843, 0, 0, 0, 1, 1,
0.8286587, -0.004064857, 2.777984, 0, 0, 0, 1, 1,
0.8287699, 1.369409, 0.6338102, 0, 0, 0, 1, 1,
0.8302159, -0.6570569, 2.624314, 0, 0, 0, 1, 1,
0.8336281, -1.398531, 1.879695, 0, 0, 0, 1, 1,
0.8356189, -0.214385, 2.475207, 0, 0, 0, 1, 1,
0.841033, -0.8534814, 2.49403, 1, 1, 1, 1, 1,
0.8459486, -0.1491911, 2.607426, 1, 1, 1, 1, 1,
0.848114, 0.635474, 1.524741, 1, 1, 1, 1, 1,
0.8486644, 0.1396187, 2.012752, 1, 1, 1, 1, 1,
0.8501078, 0.8525366, 1.947525, 1, 1, 1, 1, 1,
0.8540404, -0.8784855, 1.420295, 1, 1, 1, 1, 1,
0.854666, 0.6050125, 0.2320739, 1, 1, 1, 1, 1,
0.8555997, -0.8836229, 2.177162, 1, 1, 1, 1, 1,
0.856535, -0.691396, 2.226888, 1, 1, 1, 1, 1,
0.8569658, -0.7021148, 2.693163, 1, 1, 1, 1, 1,
0.8626918, -0.9008492, 1.445574, 1, 1, 1, 1, 1,
0.8685756, 0.6668175, 0.176262, 1, 1, 1, 1, 1,
0.8698249, 0.7065049, 2.284097, 1, 1, 1, 1, 1,
0.8705209, 0.5066763, -0.09178375, 1, 1, 1, 1, 1,
0.8722793, 1.275181, 2.433282, 1, 1, 1, 1, 1,
0.875298, -0.0881376, -0.1469069, 0, 0, 1, 1, 1,
0.8797444, 1.255339, 0.8721197, 1, 0, 0, 1, 1,
0.8817739, 1.162381, 0.497854, 1, 0, 0, 1, 1,
0.8822413, -0.4296622, 2.493504, 1, 0, 0, 1, 1,
0.9018047, -0.1724229, 1.213522, 1, 0, 0, 1, 1,
0.9081778, -1.163817, 3.013787, 1, 0, 0, 1, 1,
0.9100391, 0.7496852, 1.94407, 0, 0, 0, 1, 1,
0.913099, 0.1355848, 1.589214, 0, 0, 0, 1, 1,
0.9148294, -1.070941, 2.424451, 0, 0, 0, 1, 1,
0.9164375, -1.099911, 2.776928, 0, 0, 0, 1, 1,
0.9178753, 0.1036574, 1.329603, 0, 0, 0, 1, 1,
0.9224735, -2.575581, 2.768354, 0, 0, 0, 1, 1,
0.9228055, -0.5058194, 2.897399, 0, 0, 0, 1, 1,
0.930378, 0.6214857, 0.6649456, 1, 1, 1, 1, 1,
0.9332144, 0.9320903, 0.4775369, 1, 1, 1, 1, 1,
0.934618, 0.7313285, -0.2120063, 1, 1, 1, 1, 1,
0.9369479, 0.9333851, 1.073777, 1, 1, 1, 1, 1,
0.9374067, -0.6160342, 1.357669, 1, 1, 1, 1, 1,
0.9437842, -0.9241709, 1.722425, 1, 1, 1, 1, 1,
0.9467852, 0.2703774, 3.707039, 1, 1, 1, 1, 1,
0.9472399, -0.5166085, 2.862282, 1, 1, 1, 1, 1,
0.9474747, 0.4901372, -0.7517605, 1, 1, 1, 1, 1,
0.9499384, 0.4813578, 0.375993, 1, 1, 1, 1, 1,
0.9501778, -1.053435, 1.607723, 1, 1, 1, 1, 1,
0.9577408, 0.9643148, 0.3638038, 1, 1, 1, 1, 1,
0.97506, -0.5234247, 1.334205, 1, 1, 1, 1, 1,
0.9854031, 0.1676294, 1.05547, 1, 1, 1, 1, 1,
1.004679, 0.8183375, 1.553555, 1, 1, 1, 1, 1,
1.014735, 0.6736556, 2.207336, 0, 0, 1, 1, 1,
1.015416, -1.132039, 1.65182, 1, 0, 0, 1, 1,
1.026322, 0.7375036, -0.8687775, 1, 0, 0, 1, 1,
1.0267, -0.9860263, 2.382013, 1, 0, 0, 1, 1,
1.029327, 1.337056, 0.7221202, 1, 0, 0, 1, 1,
1.031416, 0.7471419, 1.756878, 1, 0, 0, 1, 1,
1.031717, -0.0692304, 3.778201, 0, 0, 0, 1, 1,
1.033404, 1.283292, 1.338432, 0, 0, 0, 1, 1,
1.033817, 0.3743266, 0.1677053, 0, 0, 0, 1, 1,
1.040909, 1.376868, -0.4235578, 0, 0, 0, 1, 1,
1.040966, -0.2297093, 0.9824616, 0, 0, 0, 1, 1,
1.042826, 0.1269741, 2.090443, 0, 0, 0, 1, 1,
1.044381, 1.511674, 0.7681814, 0, 0, 0, 1, 1,
1.04626, -0.1784347, 0.6780991, 1, 1, 1, 1, 1,
1.048147, 1.037269, 2.020808, 1, 1, 1, 1, 1,
1.057263, 2.962558, -0.4510521, 1, 1, 1, 1, 1,
1.058572, -0.1558056, 0.1064112, 1, 1, 1, 1, 1,
1.059372, -0.795703, 2.835223, 1, 1, 1, 1, 1,
1.062108, 1.383501, -1.087755, 1, 1, 1, 1, 1,
1.063733, 0.3293976, 0.9515913, 1, 1, 1, 1, 1,
1.066852, 0.1950602, 1.218102, 1, 1, 1, 1, 1,
1.067381, -0.4786676, 2.563392, 1, 1, 1, 1, 1,
1.067747, 1.004833, -0.2629877, 1, 1, 1, 1, 1,
1.067861, 0.5209061, 2.191492, 1, 1, 1, 1, 1,
1.069353, 0.7591516, 1.219271, 1, 1, 1, 1, 1,
1.070071, 0.7456398, -1.734564, 1, 1, 1, 1, 1,
1.089529, -0.7545798, 2.742797, 1, 1, 1, 1, 1,
1.095048, -0.6142084, 4.390391, 1, 1, 1, 1, 1,
1.095907, -1.696804, 1.185907, 0, 0, 1, 1, 1,
1.099996, -0.3814446, 1.444998, 1, 0, 0, 1, 1,
1.10452, 0.06966831, 0.1146393, 1, 0, 0, 1, 1,
1.109372, -0.9667773, 1.853615, 1, 0, 0, 1, 1,
1.118257, -0.4415206, 2.331038, 1, 0, 0, 1, 1,
1.120439, -0.04809593, 0.7486051, 1, 0, 0, 1, 1,
1.142894, -2.049593, 2.761117, 0, 0, 0, 1, 1,
1.147067, 0.517441, 3.071669, 0, 0, 0, 1, 1,
1.149594, 0.5237724, 1.881732, 0, 0, 0, 1, 1,
1.153353, 0.8908018, 1.586168, 0, 0, 0, 1, 1,
1.156637, -0.3863814, 2.823699, 0, 0, 0, 1, 1,
1.161822, -0.1722259, 1.300965, 0, 0, 0, 1, 1,
1.168959, 0.6237139, 0.3462462, 0, 0, 0, 1, 1,
1.174282, -0.1844415, 1.074281, 1, 1, 1, 1, 1,
1.176915, -0.3860304, 2.570026, 1, 1, 1, 1, 1,
1.177456, 1.282206, 2.15121, 1, 1, 1, 1, 1,
1.188231, 1.246367, 0.5470908, 1, 1, 1, 1, 1,
1.193097, 0.1139838, 1.274603, 1, 1, 1, 1, 1,
1.196907, 0.01491605, 1.440413, 1, 1, 1, 1, 1,
1.198343, 0.9170889, 2.163726, 1, 1, 1, 1, 1,
1.204167, -0.5126439, 0.5271111, 1, 1, 1, 1, 1,
1.207503, -0.4440973, 2.115405, 1, 1, 1, 1, 1,
1.214308, 0.671585, 0.3825271, 1, 1, 1, 1, 1,
1.226393, 2.35313, 0.476102, 1, 1, 1, 1, 1,
1.228538, -0.6237477, 3.176261, 1, 1, 1, 1, 1,
1.232893, -1.118593, 0.2237769, 1, 1, 1, 1, 1,
1.23503, 1.389529, 0.2361929, 1, 1, 1, 1, 1,
1.238396, -0.2456414, 3.050107, 1, 1, 1, 1, 1,
1.242479, -0.901108, 2.621321, 0, 0, 1, 1, 1,
1.244706, 0.06589636, 1.706007, 1, 0, 0, 1, 1,
1.246636, -1.365272, 3.391728, 1, 0, 0, 1, 1,
1.253535, -0.5596821, 0.8220375, 1, 0, 0, 1, 1,
1.255235, -0.6564739, 1.957511, 1, 0, 0, 1, 1,
1.264735, -0.3297507, 1.132229, 1, 0, 0, 1, 1,
1.275903, 1.190791, -1.501945, 0, 0, 0, 1, 1,
1.279899, -0.6851352, 2.253406, 0, 0, 0, 1, 1,
1.283632, 2.276329, -0.9737657, 0, 0, 0, 1, 1,
1.283837, -0.01883089, 0.02253504, 0, 0, 0, 1, 1,
1.285721, -0.3578918, 3.225512, 0, 0, 0, 1, 1,
1.28971, -0.4316448, 1.537363, 0, 0, 0, 1, 1,
1.290458, -0.9105723, 2.400185, 0, 0, 0, 1, 1,
1.299581, 0.8747024, 1.322409, 1, 1, 1, 1, 1,
1.300897, -0.4406495, 0.9975148, 1, 1, 1, 1, 1,
1.305312, 0.1920716, -0.1008369, 1, 1, 1, 1, 1,
1.337832, -2.312751, 3.120552, 1, 1, 1, 1, 1,
1.344749, -1.103392, 3.46291, 1, 1, 1, 1, 1,
1.346949, -1.633212, 3.692402, 1, 1, 1, 1, 1,
1.352332, -1.388309, 1.094074, 1, 1, 1, 1, 1,
1.3534, -1.272947, 3.265044, 1, 1, 1, 1, 1,
1.361351, 0.324925, 0.380045, 1, 1, 1, 1, 1,
1.362821, 1.939303, -0.9909242, 1, 1, 1, 1, 1,
1.366534, 0.7322692, 0.4925125, 1, 1, 1, 1, 1,
1.369209, 1.359975, 1.379559, 1, 1, 1, 1, 1,
1.376971, 0.06651969, 2.752206, 1, 1, 1, 1, 1,
1.382492, -1.073145, 2.692831, 1, 1, 1, 1, 1,
1.384339, -1.301841, 3.328719, 1, 1, 1, 1, 1,
1.387281, 0.4002242, 1.431877, 0, 0, 1, 1, 1,
1.397013, 0.7171295, -2.21649, 1, 0, 0, 1, 1,
1.404285, 2.568854, -0.2270624, 1, 0, 0, 1, 1,
1.406764, 0.3421772, 1.369578, 1, 0, 0, 1, 1,
1.413929, 0.1892497, 0.3004006, 1, 0, 0, 1, 1,
1.416729, -0.9600949, 2.233437, 1, 0, 0, 1, 1,
1.419253, 0.8909308, 1.437773, 0, 0, 0, 1, 1,
1.426651, -1.547794, 2.550345, 0, 0, 0, 1, 1,
1.43243, -0.02305767, 1.694453, 0, 0, 0, 1, 1,
1.436185, -0.4776809, 0.9617279, 0, 0, 0, 1, 1,
1.437863, -0.31016, 1.845942, 0, 0, 0, 1, 1,
1.441763, -0.3257063, 1.263638, 0, 0, 0, 1, 1,
1.460299, -0.264336, 2.930752, 0, 0, 0, 1, 1,
1.467792, 0.4301685, 1.601707, 1, 1, 1, 1, 1,
1.487285, -0.2413431, 1.774303, 1, 1, 1, 1, 1,
1.499715, -0.2445803, 2.407284, 1, 1, 1, 1, 1,
1.503601, 0.1369391, 3.898486, 1, 1, 1, 1, 1,
1.505683, 0.1899732, 1.258355, 1, 1, 1, 1, 1,
1.530559, -0.07304314, 2.102609, 1, 1, 1, 1, 1,
1.553477, -0.2822432, 2.770278, 1, 1, 1, 1, 1,
1.556913, 0.7184652, 2.083063, 1, 1, 1, 1, 1,
1.561064, 0.4430564, 0.241577, 1, 1, 1, 1, 1,
1.565469, 1.926134, 1.739952, 1, 1, 1, 1, 1,
1.578588, -0.2889971, -1.098428, 1, 1, 1, 1, 1,
1.594179, -1.753543, 2.909748, 1, 1, 1, 1, 1,
1.599275, 1.651187, 1.302652, 1, 1, 1, 1, 1,
1.613377, 0.6022248, -0.5631463, 1, 1, 1, 1, 1,
1.621312, 0.9751678, 0.2836785, 1, 1, 1, 1, 1,
1.622117, 1.19566, 2.218161, 0, 0, 1, 1, 1,
1.634107, 1.449069, 0.2423214, 1, 0, 0, 1, 1,
1.650781, 1.073709, 0.9180074, 1, 0, 0, 1, 1,
1.653224, 0.5032991, -0.02494262, 1, 0, 0, 1, 1,
1.666068, -1.869464, 2.340754, 1, 0, 0, 1, 1,
1.695052, -0.4898128, 2.030887, 1, 0, 0, 1, 1,
1.704194, 2.445512, -0.4548369, 0, 0, 0, 1, 1,
1.719499, 0.1201473, 0.8512999, 0, 0, 0, 1, 1,
1.744326, -0.04685347, 2.005828, 0, 0, 0, 1, 1,
1.752857, -0.1462741, 0.8618348, 0, 0, 0, 1, 1,
1.765442, 0.9387919, -0.7778407, 0, 0, 0, 1, 1,
1.766007, -0.5108663, 2.109593, 0, 0, 0, 1, 1,
1.77503, -1.367045, 2.147772, 0, 0, 0, 1, 1,
1.780159, -1.249019, 4.917365, 1, 1, 1, 1, 1,
1.805396, 0.111672, 1.218118, 1, 1, 1, 1, 1,
1.806939, 1.696394, 0.7914321, 1, 1, 1, 1, 1,
1.863457, -0.4275959, -1.598925, 1, 1, 1, 1, 1,
1.865834, 0.9778349, 3.210785, 1, 1, 1, 1, 1,
1.879689, -0.42574, 2.286827, 1, 1, 1, 1, 1,
1.891005, -0.8539768, -0.1399893, 1, 1, 1, 1, 1,
1.916407, 1.172174, -0.4778877, 1, 1, 1, 1, 1,
1.934437, 0.4010637, 2.84821, 1, 1, 1, 1, 1,
1.953664, 1.346662, 1.27367, 1, 1, 1, 1, 1,
2.013432, 1.730738, 1.58612, 1, 1, 1, 1, 1,
2.050604, -0.9041824, 2.008949, 1, 1, 1, 1, 1,
2.09054, 1.24139, 1.578189, 1, 1, 1, 1, 1,
2.100341, 1.391671, 0.06866667, 1, 1, 1, 1, 1,
2.181889, 0.534361, 2.611872, 1, 1, 1, 1, 1,
2.229511, -1.445262, 2.100024, 0, 0, 1, 1, 1,
2.299206, 0.7138086, 1.697443, 1, 0, 0, 1, 1,
2.326131, -1.036195, 2.803402, 1, 0, 0, 1, 1,
2.351476, 1.031004, 2.102643, 1, 0, 0, 1, 1,
2.372951, 1.366208, 0.73571, 1, 0, 0, 1, 1,
2.394999, 1.096462, 0.8851395, 1, 0, 0, 1, 1,
2.430434, 0.3932758, 0.1908259, 0, 0, 0, 1, 1,
2.435613, 0.1507355, 0.8945865, 0, 0, 0, 1, 1,
2.441705, -0.02889175, 2.4739, 0, 0, 0, 1, 1,
2.45064, -0.4451788, 1.332508, 0, 0, 0, 1, 1,
2.469564, -0.9778941, 1.029425, 0, 0, 0, 1, 1,
2.517998, -0.6771175, 0.5486942, 0, 0, 0, 1, 1,
2.55179, -1.778121, 1.794422, 0, 0, 0, 1, 1,
2.557424, 0.9890222, -0.2444021, 1, 1, 1, 1, 1,
2.571102, 0.05012198, 0.3100697, 1, 1, 1, 1, 1,
2.63203, 0.3177541, 1.781937, 1, 1, 1, 1, 1,
2.641138, -1.416298, 1.108104, 1, 1, 1, 1, 1,
2.760365, 0.1886667, 1.076374, 1, 1, 1, 1, 1,
2.903104, -0.912375, 1.118992, 1, 1, 1, 1, 1,
3.415474, 1.604156, 1.738155, 1, 1, 1, 1, 1
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
var radius = 10.03214;
var distance = 35.23746;
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
mvMatrix.translate( 0.3302727, 0.2051406, -0.09848285 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.23746);
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
