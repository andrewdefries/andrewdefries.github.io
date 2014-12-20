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
-2.86402, -0.8428251, -2.35293, 1, 0, 0, 1,
-2.767614, -0.6393826, 0.193551, 1, 0.007843138, 0, 1,
-2.644844, -0.7234122, -1.68073, 1, 0.01176471, 0, 1,
-2.598469, 0.3746635, 0.2986654, 1, 0.01960784, 0, 1,
-2.521772, -1.208397, -2.220713, 1, 0.02352941, 0, 1,
-2.503232, 1.154714, -2.315368, 1, 0.03137255, 0, 1,
-2.500987, -0.826698, -2.513216, 1, 0.03529412, 0, 1,
-2.379882, 0.4716713, -0.8935257, 1, 0.04313726, 0, 1,
-2.366978, -0.01641909, -1.879444, 1, 0.04705882, 0, 1,
-2.344888, 0.9314418, -1.663946, 1, 0.05490196, 0, 1,
-2.308151, 1.970274, -0.6905725, 1, 0.05882353, 0, 1,
-2.302323, -0.06139015, -1.534811, 1, 0.06666667, 0, 1,
-2.299306, -0.3870023, -0.9176328, 1, 0.07058824, 0, 1,
-2.266622, -1.618594, -2.840185, 1, 0.07843138, 0, 1,
-2.19586, 1.649937, -0.5124938, 1, 0.08235294, 0, 1,
-2.181232, -0.1744247, -0.7808923, 1, 0.09019608, 0, 1,
-2.167622, 0.05399251, -2.164791, 1, 0.09411765, 0, 1,
-2.147988, 0.3683673, -1.463502, 1, 0.1019608, 0, 1,
-2.121834, -1.716849, -3.218597, 1, 0.1098039, 0, 1,
-2.087482, -1.797552, -2.376501, 1, 0.1137255, 0, 1,
-2.062347, 0.7522836, -1.675024, 1, 0.1215686, 0, 1,
-2.001248, 0.7771559, -0.3882174, 1, 0.1254902, 0, 1,
-2.000918, -0.00826503, -0.9188482, 1, 0.1333333, 0, 1,
-1.97431, -0.6961809, -1.943873, 1, 0.1372549, 0, 1,
-1.971806, -0.6097822, -0.8844483, 1, 0.145098, 0, 1,
-1.971541, 0.5180455, -0.8287804, 1, 0.1490196, 0, 1,
-1.959704, 0.9192794, -2.030352, 1, 0.1568628, 0, 1,
-1.936896, -0.08975733, -2.480651, 1, 0.1607843, 0, 1,
-1.927292, 1.746727, 0.1427281, 1, 0.1686275, 0, 1,
-1.912329, 0.289448, -1.972549, 1, 0.172549, 0, 1,
-1.910629, -1.056899, -2.098544, 1, 0.1803922, 0, 1,
-1.892091, 0.3626492, -0.3945959, 1, 0.1843137, 0, 1,
-1.872974, 0.09730491, -2.859804, 1, 0.1921569, 0, 1,
-1.869595, -0.01093231, -1.067107, 1, 0.1960784, 0, 1,
-1.852102, 0.1791358, -0.3619878, 1, 0.2039216, 0, 1,
-1.826351, -1.367309, -2.61867, 1, 0.2117647, 0, 1,
-1.818016, -0.1078184, -2.340483, 1, 0.2156863, 0, 1,
-1.817756, 0.05377895, -0.134679, 1, 0.2235294, 0, 1,
-1.792254, 0.723125, -1.121152, 1, 0.227451, 0, 1,
-1.779981, 0.6464148, -0.5997023, 1, 0.2352941, 0, 1,
-1.775052, 0.693084, -0.4472756, 1, 0.2392157, 0, 1,
-1.762242, 0.4811588, -0.7911659, 1, 0.2470588, 0, 1,
-1.760025, 1.52257, -1.689446, 1, 0.2509804, 0, 1,
-1.753424, 0.8743864, -2.154037, 1, 0.2588235, 0, 1,
-1.748839, 1.408751, -2.361787, 1, 0.2627451, 0, 1,
-1.748539, -0.5113485, -1.128663, 1, 0.2705882, 0, 1,
-1.745414, -0.1653797, -2.32984, 1, 0.2745098, 0, 1,
-1.71538, -0.9476746, -2.183707, 1, 0.282353, 0, 1,
-1.708276, 0.08716403, -1.779939, 1, 0.2862745, 0, 1,
-1.696119, -0.6887102, 0.006788085, 1, 0.2941177, 0, 1,
-1.680262, 0.7779593, 0.457065, 1, 0.3019608, 0, 1,
-1.679519, -1.558938, -2.907815, 1, 0.3058824, 0, 1,
-1.658495, -1.791482, -3.291546, 1, 0.3137255, 0, 1,
-1.654561, 1.297421, -1.728835, 1, 0.3176471, 0, 1,
-1.650813, -0.9622327, -0.6061454, 1, 0.3254902, 0, 1,
-1.633653, -1.517387, -2.892138, 1, 0.3294118, 0, 1,
-1.633317, -0.01213413, -0.6629226, 1, 0.3372549, 0, 1,
-1.627193, -1.215801, -2.666434, 1, 0.3411765, 0, 1,
-1.608073, -1.110893, -3.773824, 1, 0.3490196, 0, 1,
-1.603465, 0.1188302, -2.270259, 1, 0.3529412, 0, 1,
-1.602147, -1.141974, -3.324896, 1, 0.3607843, 0, 1,
-1.600582, 0.9366402, -0.5028872, 1, 0.3647059, 0, 1,
-1.591817, -0.250328, -2.895247, 1, 0.372549, 0, 1,
-1.59096, -1.215719, -1.648331, 1, 0.3764706, 0, 1,
-1.566574, 1.768292, 0.3083258, 1, 0.3843137, 0, 1,
-1.561493, 1.005973, -2.210178, 1, 0.3882353, 0, 1,
-1.556635, 0.1890299, -2.022835, 1, 0.3960784, 0, 1,
-1.547989, 0.1092408, -3.877212, 1, 0.4039216, 0, 1,
-1.536564, -0.0002082515, 1.53234, 1, 0.4078431, 0, 1,
-1.530172, -3.499507, -3.430838, 1, 0.4156863, 0, 1,
-1.504698, -0.6096267, -1.109758, 1, 0.4196078, 0, 1,
-1.494021, 0.7834196, -0.6962096, 1, 0.427451, 0, 1,
-1.487546, 0.9171846, 0.08185831, 1, 0.4313726, 0, 1,
-1.48264, -1.370298, -2.819556, 1, 0.4392157, 0, 1,
-1.466543, 1.227641, 0.2027611, 1, 0.4431373, 0, 1,
-1.457, 0.04219585, -0.7845936, 1, 0.4509804, 0, 1,
-1.456269, 0.01746852, -2.753908, 1, 0.454902, 0, 1,
-1.455767, -0.5977685, -1.822089, 1, 0.4627451, 0, 1,
-1.454701, -0.5406858, -1.330251, 1, 0.4666667, 0, 1,
-1.447291, -0.6109308, -1.597844, 1, 0.4745098, 0, 1,
-1.441069, 0.8980192, -0.9101745, 1, 0.4784314, 0, 1,
-1.439037, -0.450368, -2.457368, 1, 0.4862745, 0, 1,
-1.422138, 0.2304934, -1.947404, 1, 0.4901961, 0, 1,
-1.422004, -1.192769, -3.793255, 1, 0.4980392, 0, 1,
-1.418693, 1.752742, -0.913892, 1, 0.5058824, 0, 1,
-1.416716, -0.0006777334, -1.280876, 1, 0.509804, 0, 1,
-1.391055, -1.453691, -0.5820512, 1, 0.5176471, 0, 1,
-1.385782, 0.7680219, -1.451501, 1, 0.5215687, 0, 1,
-1.383654, 0.6413364, -1.520451, 1, 0.5294118, 0, 1,
-1.375574, -0.6132601, -3.358468, 1, 0.5333334, 0, 1,
-1.374985, -0.05415804, -2.531006, 1, 0.5411765, 0, 1,
-1.374485, -1.539047, -2.475544, 1, 0.5450981, 0, 1,
-1.374307, 0.3767152, 0.5306293, 1, 0.5529412, 0, 1,
-1.373685, 1.309565, -0.2517369, 1, 0.5568628, 0, 1,
-1.371533, 0.1118842, -2.05134, 1, 0.5647059, 0, 1,
-1.350948, 1.859541, -2.488662, 1, 0.5686275, 0, 1,
-1.336643, -1.076645, -2.240349, 1, 0.5764706, 0, 1,
-1.32557, 0.1551003, -1.425321, 1, 0.5803922, 0, 1,
-1.317589, 2.059245, -2.065139, 1, 0.5882353, 0, 1,
-1.295801, 2.118293, 1.039696, 1, 0.5921569, 0, 1,
-1.294235, -0.2890173, -1.860827, 1, 0.6, 0, 1,
-1.285631, -0.3830509, -2.846217, 1, 0.6078432, 0, 1,
-1.281594, 2.064014, -1.459493, 1, 0.6117647, 0, 1,
-1.275736, 0.3643234, -0.9505002, 1, 0.6196079, 0, 1,
-1.275337, 0.8205991, 0.2167575, 1, 0.6235294, 0, 1,
-1.267992, 0.1957619, -0.7240089, 1, 0.6313726, 0, 1,
-1.260617, -0.1845223, -0.4202332, 1, 0.6352941, 0, 1,
-1.256577, -2.009767, -2.138295, 1, 0.6431373, 0, 1,
-1.24272, 0.649695, -0.8167654, 1, 0.6470588, 0, 1,
-1.234628, -0.7888879, -1.737016, 1, 0.654902, 0, 1,
-1.231811, -0.2661434, -1.84962, 1, 0.6588235, 0, 1,
-1.228063, 0.9397721, -2.376797, 1, 0.6666667, 0, 1,
-1.227908, 1.780913, -0.4339796, 1, 0.6705883, 0, 1,
-1.225128, -1.75334, -2.523264, 1, 0.6784314, 0, 1,
-1.222076, -0.4156385, -3.020105, 1, 0.682353, 0, 1,
-1.219577, 0.5602113, -0.3214796, 1, 0.6901961, 0, 1,
-1.217489, 0.6432084, -0.6388214, 1, 0.6941177, 0, 1,
-1.214794, -0.07503445, -2.245144, 1, 0.7019608, 0, 1,
-1.213923, 0.01070597, -1.943488, 1, 0.7098039, 0, 1,
-1.213319, 0.6674321, -0.128967, 1, 0.7137255, 0, 1,
-1.210026, -0.03518076, -1.197708, 1, 0.7215686, 0, 1,
-1.204951, 0.5771208, -2.527515, 1, 0.7254902, 0, 1,
-1.20264, 0.731205, 0.5401672, 1, 0.7333333, 0, 1,
-1.196995, -0.480923, -2.8567, 1, 0.7372549, 0, 1,
-1.19228, -2.225821, -2.645711, 1, 0.7450981, 0, 1,
-1.192176, 0.1429603, -1.778231, 1, 0.7490196, 0, 1,
-1.191408, -1.167639, -1.689618, 1, 0.7568628, 0, 1,
-1.178841, -0.6654389, -1.440662, 1, 0.7607843, 0, 1,
-1.171592, -0.7396553, -3.835058, 1, 0.7686275, 0, 1,
-1.170898, -1.11034, -2.753576, 1, 0.772549, 0, 1,
-1.159427, 1.110733, -0.1397568, 1, 0.7803922, 0, 1,
-1.156915, 0.7893116, -1.84581, 1, 0.7843137, 0, 1,
-1.154198, -0.817042, -3.774154, 1, 0.7921569, 0, 1,
-1.148911, 0.4414352, -1.540374, 1, 0.7960784, 0, 1,
-1.14419, -0.4922759, -1.416602, 1, 0.8039216, 0, 1,
-1.143898, -0.2820877, -1.803754, 1, 0.8117647, 0, 1,
-1.141773, 2.487649, -1.880267, 1, 0.8156863, 0, 1,
-1.141343, -1.210362, -3.767122, 1, 0.8235294, 0, 1,
-1.140584, 0.5384927, -1.948159, 1, 0.827451, 0, 1,
-1.138971, -1.240925, -3.429763, 1, 0.8352941, 0, 1,
-1.135432, 0.5540553, -2.27046, 1, 0.8392157, 0, 1,
-1.127274, 1.37489, -0.4772164, 1, 0.8470588, 0, 1,
-1.124215, -0.7173127, -3.33288, 1, 0.8509804, 0, 1,
-1.11963, 0.6198931, -0.4659458, 1, 0.8588235, 0, 1,
-1.09928, 0.1404137, -2.121401, 1, 0.8627451, 0, 1,
-1.093921, 0.8983287, 0.02249406, 1, 0.8705882, 0, 1,
-1.093459, -1.330915, -3.080271, 1, 0.8745098, 0, 1,
-1.088071, 0.07929631, -1.370422, 1, 0.8823529, 0, 1,
-1.085093, -0.6714315, -2.083979, 1, 0.8862745, 0, 1,
-1.081546, 0.4978009, -1.244129, 1, 0.8941177, 0, 1,
-1.081463, -1.652936, -3.124289, 1, 0.8980392, 0, 1,
-1.076724, 0.09781753, -1.424258, 1, 0.9058824, 0, 1,
-1.073821, 0.1244702, -1.044213, 1, 0.9137255, 0, 1,
-1.072971, 1.417207, 0.2400909, 1, 0.9176471, 0, 1,
-1.072299, -0.2208847, -2.143303, 1, 0.9254902, 0, 1,
-1.070338, 0.5383314, -0.5247011, 1, 0.9294118, 0, 1,
-1.069224, -1.916258, -3.284054, 1, 0.9372549, 0, 1,
-1.064116, -0.3793626, -1.645568, 1, 0.9411765, 0, 1,
-1.061071, -0.145196, -1.338289, 1, 0.9490196, 0, 1,
-1.060127, 0.6625471, -1.428931, 1, 0.9529412, 0, 1,
-1.057467, -0.9431936, -2.165666, 1, 0.9607843, 0, 1,
-1.057333, 1.686921, 0.176623, 1, 0.9647059, 0, 1,
-1.0497, -0.2747291, -0.464604, 1, 0.972549, 0, 1,
-1.036958, -1.632231, -3.265127, 1, 0.9764706, 0, 1,
-1.034331, 1.83501, -0.3286759, 1, 0.9843137, 0, 1,
-1.017097, 0.09499613, -2.306469, 1, 0.9882353, 0, 1,
-0.9949486, -0.3027369, -2.096657, 1, 0.9960784, 0, 1,
-0.9920779, 1.037023, -1.610754, 0.9960784, 1, 0, 1,
-0.9841822, 2.302948, 0.1289997, 0.9921569, 1, 0, 1,
-0.9820014, -0.5604293, -1.609527, 0.9843137, 1, 0, 1,
-0.9785837, 1.607705, -1.474834, 0.9803922, 1, 0, 1,
-0.9720012, -0.1477795, -2.40918, 0.972549, 1, 0, 1,
-0.968182, -0.2097642, -1.26745, 0.9686275, 1, 0, 1,
-0.9570582, -0.2347185, -2.88732, 0.9607843, 1, 0, 1,
-0.9523855, -0.9225928, -1.52934, 0.9568627, 1, 0, 1,
-0.9482141, 0.02459016, -3.344746, 0.9490196, 1, 0, 1,
-0.9475973, -1.930175, -3.688401, 0.945098, 1, 0, 1,
-0.9440355, 0.4365631, -0.8780325, 0.9372549, 1, 0, 1,
-0.9422569, -0.2746812, 0.2645589, 0.9333333, 1, 0, 1,
-0.9417151, -1.480235, -2.594084, 0.9254902, 1, 0, 1,
-0.9304834, 0.2590163, -1.32071, 0.9215686, 1, 0, 1,
-0.9297101, -0.1617819, -2.715782, 0.9137255, 1, 0, 1,
-0.9189816, -0.3114009, -3.248323, 0.9098039, 1, 0, 1,
-0.9132631, -1.277372, -2.929127, 0.9019608, 1, 0, 1,
-0.9088612, -0.4375815, -1.955276, 0.8941177, 1, 0, 1,
-0.9084194, -0.8622652, -3.022053, 0.8901961, 1, 0, 1,
-0.9052948, -0.01973325, -1.322629, 0.8823529, 1, 0, 1,
-0.9051229, 0.29405, -0.226271, 0.8784314, 1, 0, 1,
-0.8966233, -0.4312324, -1.523682, 0.8705882, 1, 0, 1,
-0.8924373, 0.5439709, -2.088881, 0.8666667, 1, 0, 1,
-0.892435, -0.1587217, -2.367483, 0.8588235, 1, 0, 1,
-0.8905137, 2.040201, -0.4765842, 0.854902, 1, 0, 1,
-0.8898275, -0.9888556, -4.381274, 0.8470588, 1, 0, 1,
-0.8894269, 0.4264624, 0.7137835, 0.8431373, 1, 0, 1,
-0.8749882, -1.12363, -2.67733, 0.8352941, 1, 0, 1,
-0.8730942, 0.5319918, -1.453914, 0.8313726, 1, 0, 1,
-0.8722713, -1.249018, -2.762395, 0.8235294, 1, 0, 1,
-0.8713829, -1.625286, -2.336286, 0.8196079, 1, 0, 1,
-0.8706228, 0.0909059, -0.03811245, 0.8117647, 1, 0, 1,
-0.8647181, 0.604075, -0.334189, 0.8078431, 1, 0, 1,
-0.8601542, 0.7654338, -2.454125, 0.8, 1, 0, 1,
-0.8479581, 0.9214629, 0.1838788, 0.7921569, 1, 0, 1,
-0.8466772, -1.379329, -2.367974, 0.7882353, 1, 0, 1,
-0.8360984, -1.796679, -3.142816, 0.7803922, 1, 0, 1,
-0.8260154, 0.480338, -0.7929088, 0.7764706, 1, 0, 1,
-0.823783, -0.400737, -2.801636, 0.7686275, 1, 0, 1,
-0.8217538, -1.037259, -2.894555, 0.7647059, 1, 0, 1,
-0.8213887, 0.5318268, -1.318999, 0.7568628, 1, 0, 1,
-0.8200853, 0.04718142, -1.805694, 0.7529412, 1, 0, 1,
-0.814707, -1.877489, -0.7378541, 0.7450981, 1, 0, 1,
-0.8082836, 0.7060892, -0.5461408, 0.7411765, 1, 0, 1,
-0.8020579, -0.4492382, -1.635747, 0.7333333, 1, 0, 1,
-0.7935693, 0.2113235, -1.122886, 0.7294118, 1, 0, 1,
-0.7904852, -2.423686, -2.930415, 0.7215686, 1, 0, 1,
-0.7901894, -1.45708, -2.458412, 0.7176471, 1, 0, 1,
-0.7887972, 0.2823185, -0.04397272, 0.7098039, 1, 0, 1,
-0.7862454, -1.015751, -2.462915, 0.7058824, 1, 0, 1,
-0.7763636, 1.385332, -0.6186047, 0.6980392, 1, 0, 1,
-0.7749528, -1.251558, -3.02908, 0.6901961, 1, 0, 1,
-0.7736251, -0.5956237, -0.8459927, 0.6862745, 1, 0, 1,
-0.7731057, -0.07304306, -0.1894149, 0.6784314, 1, 0, 1,
-0.7718973, -0.03193586, -1.752712, 0.6745098, 1, 0, 1,
-0.7679688, -1.48466, -1.189769, 0.6666667, 1, 0, 1,
-0.767844, 0.7036974, -2.264672, 0.6627451, 1, 0, 1,
-0.7677132, 1.445076, -0.4143744, 0.654902, 1, 0, 1,
-0.7639886, -0.8372037, -3.353581, 0.6509804, 1, 0, 1,
-0.7604913, 0.7332551, -0.287831, 0.6431373, 1, 0, 1,
-0.7564059, 1.372322, 1.403313, 0.6392157, 1, 0, 1,
-0.7551522, -0.2339702, -1.318053, 0.6313726, 1, 0, 1,
-0.7547001, -0.8470927, -1.064093, 0.627451, 1, 0, 1,
-0.7542089, -0.681474, -1.445492, 0.6196079, 1, 0, 1,
-0.7535005, -0.279682, -0.1431378, 0.6156863, 1, 0, 1,
-0.7528777, 0.9432984, -2.372027, 0.6078432, 1, 0, 1,
-0.7489726, 0.3582676, -0.8518174, 0.6039216, 1, 0, 1,
-0.7456923, 0.3572415, -0.6338677, 0.5960785, 1, 0, 1,
-0.7444011, 0.4668908, -1.126709, 0.5882353, 1, 0, 1,
-0.7440709, 0.09918001, -2.790689, 0.5843138, 1, 0, 1,
-0.7299435, 3.009009, 0.6536415, 0.5764706, 1, 0, 1,
-0.7283753, -0.4054466, -0.05374108, 0.572549, 1, 0, 1,
-0.726335, -0.6376621, -3.011722, 0.5647059, 1, 0, 1,
-0.7257618, -0.6645604, -3.334932, 0.5607843, 1, 0, 1,
-0.7223638, 1.06754, -0.5755967, 0.5529412, 1, 0, 1,
-0.7152907, 1.655473, -0.5786467, 0.5490196, 1, 0, 1,
-0.7150297, 0.2274913, -0.4692044, 0.5411765, 1, 0, 1,
-0.7095468, 0.7413625, 0.3927508, 0.5372549, 1, 0, 1,
-0.7049081, 1.589602, -1.37348, 0.5294118, 1, 0, 1,
-0.6993259, 0.5670531, -1.139681, 0.5254902, 1, 0, 1,
-0.6932252, 0.8472391, -0.7396305, 0.5176471, 1, 0, 1,
-0.6917357, 1.367797, -0.5789452, 0.5137255, 1, 0, 1,
-0.6858547, -0.6987092, -3.026016, 0.5058824, 1, 0, 1,
-0.6857309, -0.06325892, -1.209834, 0.5019608, 1, 0, 1,
-0.6835458, -0.4238739, -3.155261, 0.4941176, 1, 0, 1,
-0.6799646, -0.9671113, -2.281368, 0.4862745, 1, 0, 1,
-0.6793265, -0.3385195, -2.429217, 0.4823529, 1, 0, 1,
-0.6773854, 1.161249, 0.1089102, 0.4745098, 1, 0, 1,
-0.6750132, -0.4538401, -1.742385, 0.4705882, 1, 0, 1,
-0.6708941, -0.6034704, -2.500405, 0.4627451, 1, 0, 1,
-0.6681975, 0.5597433, -1.534801, 0.4588235, 1, 0, 1,
-0.6676492, 0.5239843, 0.7873759, 0.4509804, 1, 0, 1,
-0.6656463, -0.05991976, -0.6351567, 0.4470588, 1, 0, 1,
-0.6648217, 0.5402395, -0.5853128, 0.4392157, 1, 0, 1,
-0.6564825, 1.256922, -2.264587, 0.4352941, 1, 0, 1,
-0.6552345, -0.8870668, -4.622268, 0.427451, 1, 0, 1,
-0.6435208, 0.2654988, -1.486037, 0.4235294, 1, 0, 1,
-0.6390522, -0.8688876, -4.978798, 0.4156863, 1, 0, 1,
-0.635673, -1.325804, -0.9161236, 0.4117647, 1, 0, 1,
-0.6343732, 0.2078742, -0.6798835, 0.4039216, 1, 0, 1,
-0.6338342, 0.07951704, -1.061446, 0.3960784, 1, 0, 1,
-0.6309552, 0.1145429, -0.4374244, 0.3921569, 1, 0, 1,
-0.6300451, 1.2952, -0.6561407, 0.3843137, 1, 0, 1,
-0.6239368, 1.192997, -0.1829058, 0.3803922, 1, 0, 1,
-0.6184741, -2.214666, -3.122449, 0.372549, 1, 0, 1,
-0.6169032, -0.7267904, -3.132843, 0.3686275, 1, 0, 1,
-0.6115422, -1.252293, -2.007171, 0.3607843, 1, 0, 1,
-0.6090985, -0.9274244, -2.947113, 0.3568628, 1, 0, 1,
-0.6005954, 0.7506468, 1.268108, 0.3490196, 1, 0, 1,
-0.599187, -1.091913, -2.808643, 0.345098, 1, 0, 1,
-0.5975533, 1.125286, -0.6117074, 0.3372549, 1, 0, 1,
-0.594675, -1.130667, -2.493696, 0.3333333, 1, 0, 1,
-0.5915929, -0.2740144, -2.129159, 0.3254902, 1, 0, 1,
-0.5888901, -0.04341411, -0.4914144, 0.3215686, 1, 0, 1,
-0.5798311, -1.045247, -2.982444, 0.3137255, 1, 0, 1,
-0.5789891, 0.3806325, -2.079879, 0.3098039, 1, 0, 1,
-0.5747198, 1.700607, -0.4389784, 0.3019608, 1, 0, 1,
-0.5686269, 1.404122, 0.846466, 0.2941177, 1, 0, 1,
-0.5637586, -1.293212, -3.601341, 0.2901961, 1, 0, 1,
-0.5612447, -0.6417106, -2.381075, 0.282353, 1, 0, 1,
-0.554858, 0.3864519, -2.284365, 0.2784314, 1, 0, 1,
-0.5535091, 0.5805745, -0.266917, 0.2705882, 1, 0, 1,
-0.5481912, 0.2907306, -2.89879, 0.2666667, 1, 0, 1,
-0.5479531, -0.1976096, -0.3625909, 0.2588235, 1, 0, 1,
-0.5416407, -1.934391, -2.713369, 0.254902, 1, 0, 1,
-0.5355261, 0.4746852, -1.159309, 0.2470588, 1, 0, 1,
-0.5278196, 0.7958003, -1.542771, 0.2431373, 1, 0, 1,
-0.5271912, -0.2028354, -0.8019642, 0.2352941, 1, 0, 1,
-0.5244371, 0.6925657, -0.5592111, 0.2313726, 1, 0, 1,
-0.5229366, 0.1498932, -3.269567, 0.2235294, 1, 0, 1,
-0.5203924, -0.5766748, -0.4253964, 0.2196078, 1, 0, 1,
-0.5202798, 0.5663614, 0.3907217, 0.2117647, 1, 0, 1,
-0.519253, 0.4719841, -3.038962, 0.2078431, 1, 0, 1,
-0.5188185, -0.7351453, -2.39179, 0.2, 1, 0, 1,
-0.517451, 0.1837806, -2.580518, 0.1921569, 1, 0, 1,
-0.5133306, 0.6068779, -2.056452, 0.1882353, 1, 0, 1,
-0.5130351, -0.8802695, -1.873341, 0.1803922, 1, 0, 1,
-0.5128204, -0.1719506, -2.682408, 0.1764706, 1, 0, 1,
-0.5125577, -0.1257595, -1.750113, 0.1686275, 1, 0, 1,
-0.5120357, -1.002479, -3.143924, 0.1647059, 1, 0, 1,
-0.5084441, 1.324248, 0.06733961, 0.1568628, 1, 0, 1,
-0.5066665, 1.719733, -0.7574759, 0.1529412, 1, 0, 1,
-0.501473, 0.2493185, -0.5636661, 0.145098, 1, 0, 1,
-0.4965295, 0.7199293, -0.8556321, 0.1411765, 1, 0, 1,
-0.4958704, -0.6444901, -2.805762, 0.1333333, 1, 0, 1,
-0.4953244, 1.006502, -1.243943, 0.1294118, 1, 0, 1,
-0.49335, -0.422461, -2.327627, 0.1215686, 1, 0, 1,
-0.4874648, -0.2106545, -2.639032, 0.1176471, 1, 0, 1,
-0.4844757, 0.4372122, -1.564885, 0.1098039, 1, 0, 1,
-0.4819765, -0.006075586, 0.1795963, 0.1058824, 1, 0, 1,
-0.4813935, 0.2852599, -0.990937, 0.09803922, 1, 0, 1,
-0.4708643, -1.047577, -3.44024, 0.09019608, 1, 0, 1,
-0.4696598, -0.9104687, -2.940107, 0.08627451, 1, 0, 1,
-0.4681697, 1.213953, 0.748723, 0.07843138, 1, 0, 1,
-0.4675784, 0.347286, -1.963211, 0.07450981, 1, 0, 1,
-0.4637399, 0.2458556, -1.483874, 0.06666667, 1, 0, 1,
-0.4562437, 0.2834172, 0.7112696, 0.0627451, 1, 0, 1,
-0.4535958, 1.007089, 0.5164613, 0.05490196, 1, 0, 1,
-0.4521454, 0.3102866, 1.769657, 0.05098039, 1, 0, 1,
-0.4500949, -0.7917365, -2.579475, 0.04313726, 1, 0, 1,
-0.4495876, 1.631106, -0.5143098, 0.03921569, 1, 0, 1,
-0.448273, 1.002353, -1.168571, 0.03137255, 1, 0, 1,
-0.445599, -0.4486331, -1.752929, 0.02745098, 1, 0, 1,
-0.4413586, 0.03394349, -1.776997, 0.01960784, 1, 0, 1,
-0.4399334, -0.5498542, -5.302248, 0.01568628, 1, 0, 1,
-0.4343715, 1.550026, 0.208529, 0.007843138, 1, 0, 1,
-0.4326284, -0.09258106, -0.6370984, 0.003921569, 1, 0, 1,
-0.4306141, 0.06295741, -1.672934, 0, 1, 0.003921569, 1,
-0.4294394, -0.7673074, -4.274981, 0, 1, 0.01176471, 1,
-0.4286281, -0.6533738, -2.613007, 0, 1, 0.01568628, 1,
-0.426962, 1.250101, -0.915889, 0, 1, 0.02352941, 1,
-0.4210454, 1.292989, -0.1694316, 0, 1, 0.02745098, 1,
-0.4205031, 0.4027024, -1.713357, 0, 1, 0.03529412, 1,
-0.4151779, 1.014537, -0.6426467, 0, 1, 0.03921569, 1,
-0.4150203, -0.3571329, -2.263697, 0, 1, 0.04705882, 1,
-0.414612, -1.092614, -1.457895, 0, 1, 0.05098039, 1,
-0.4102134, -0.9829473, -2.645832, 0, 1, 0.05882353, 1,
-0.4102097, -0.01945377, -1.954381, 0, 1, 0.0627451, 1,
-0.4086391, 0.3220116, -2.151465, 0, 1, 0.07058824, 1,
-0.4043524, -1.187697, -4.247913, 0, 1, 0.07450981, 1,
-0.3958381, 1.970142, -1.160791, 0, 1, 0.08235294, 1,
-0.3745342, -0.1157787, -1.638537, 0, 1, 0.08627451, 1,
-0.3713049, -1.430722, -3.917648, 0, 1, 0.09411765, 1,
-0.3712916, 0.4320151, 0.5520695, 0, 1, 0.1019608, 1,
-0.3704274, 0.1282013, -1.026682, 0, 1, 0.1058824, 1,
-0.3613364, 0.5674549, 2.102922, 0, 1, 0.1137255, 1,
-0.3605457, 0.2679282, -0.6898525, 0, 1, 0.1176471, 1,
-0.3542645, 1.468668, -2.009371, 0, 1, 0.1254902, 1,
-0.3523116, -0.2488984, -1.687512, 0, 1, 0.1294118, 1,
-0.3467624, 0.268753, -2.344312, 0, 1, 0.1372549, 1,
-0.3467432, 0.3254809, -1.96687, 0, 1, 0.1411765, 1,
-0.3325905, 0.5662771, -0.475468, 0, 1, 0.1490196, 1,
-0.3315372, -0.2637346, -5.086614, 0, 1, 0.1529412, 1,
-0.3265469, -1.513629, -3.817076, 0, 1, 0.1607843, 1,
-0.3223626, -0.3838289, -2.62012, 0, 1, 0.1647059, 1,
-0.3210534, 0.1959101, -2.156296, 0, 1, 0.172549, 1,
-0.3198253, -1.743492, -1.447301, 0, 1, 0.1764706, 1,
-0.3146932, -1.342926, -3.695049, 0, 1, 0.1843137, 1,
-0.313956, -0.4639358, -2.497076, 0, 1, 0.1882353, 1,
-0.3026297, -0.2592742, -1.987265, 0, 1, 0.1960784, 1,
-0.3010278, -0.5922005, -3.389407, 0, 1, 0.2039216, 1,
-0.3008484, 1.171759, -0.3489858, 0, 1, 0.2078431, 1,
-0.2990452, -0.9475774, -2.405817, 0, 1, 0.2156863, 1,
-0.2986644, 0.358148, -1.077628, 0, 1, 0.2196078, 1,
-0.2982845, -0.5234846, -2.629037, 0, 1, 0.227451, 1,
-0.2942635, -0.7584292, -4.03543, 0, 1, 0.2313726, 1,
-0.2929918, -0.01811868, -0.9978853, 0, 1, 0.2392157, 1,
-0.2925684, 1.516645, 0.8173181, 0, 1, 0.2431373, 1,
-0.2882604, -0.1940475, -1.566856, 0, 1, 0.2509804, 1,
-0.2860854, -1.278886, -3.768923, 0, 1, 0.254902, 1,
-0.2777975, 0.9184058, 0.2187744, 0, 1, 0.2627451, 1,
-0.2722286, 0.4118584, -1.654729, 0, 1, 0.2666667, 1,
-0.2670945, -0.6576499, -4.244577, 0, 1, 0.2745098, 1,
-0.2559389, -0.003571353, -0.942455, 0, 1, 0.2784314, 1,
-0.2553335, -0.8986301, -3.530025, 0, 1, 0.2862745, 1,
-0.2530777, -0.8651004, -3.379925, 0, 1, 0.2901961, 1,
-0.2489762, 0.8668963, -0.8280361, 0, 1, 0.2980392, 1,
-0.2482233, -0.4222085, -1.279815, 0, 1, 0.3058824, 1,
-0.2468284, -0.5376222, -3.212402, 0, 1, 0.3098039, 1,
-0.2449279, 0.5471842, -1.153383, 0, 1, 0.3176471, 1,
-0.2363913, -0.7875165, -2.827436, 0, 1, 0.3215686, 1,
-0.2314769, -2.666296, -2.402041, 0, 1, 0.3294118, 1,
-0.2296605, -1.695564, -3.605724, 0, 1, 0.3333333, 1,
-0.2288482, -1.073238, -4.176673, 0, 1, 0.3411765, 1,
-0.2255808, 1.505315, 0.7058337, 0, 1, 0.345098, 1,
-0.2247109, 1.315446, -1.740898, 0, 1, 0.3529412, 1,
-0.2234357, -0.8928924, -3.604725, 0, 1, 0.3568628, 1,
-0.2232789, -0.9034934, -3.762196, 0, 1, 0.3647059, 1,
-0.2175487, -0.8283262, -1.199218, 0, 1, 0.3686275, 1,
-0.2162464, 0.1120404, -1.030777, 0, 1, 0.3764706, 1,
-0.2137332, -0.1249674, -4.096196, 0, 1, 0.3803922, 1,
-0.2127101, -0.4074392, -3.049241, 0, 1, 0.3882353, 1,
-0.209174, 0.4915711, -1.450661, 0, 1, 0.3921569, 1,
-0.2010382, -1.779433, -2.95622, 0, 1, 0.4, 1,
-0.1810509, 0.380878, 0.03460427, 0, 1, 0.4078431, 1,
-0.1785643, -1.974643, -3.544973, 0, 1, 0.4117647, 1,
-0.1782971, 1.353809, -1.296583, 0, 1, 0.4196078, 1,
-0.1750147, -0.115158, -3.317156, 0, 1, 0.4235294, 1,
-0.1706765, 1.289052, -0.3356089, 0, 1, 0.4313726, 1,
-0.1704005, 0.4203697, -0.7318413, 0, 1, 0.4352941, 1,
-0.1687755, 0.6462931, -0.474703, 0, 1, 0.4431373, 1,
-0.1663924, 1.278499, -0.2566827, 0, 1, 0.4470588, 1,
-0.1662698, -0.7917194, -2.010993, 0, 1, 0.454902, 1,
-0.1662645, 0.244761, -0.6424586, 0, 1, 0.4588235, 1,
-0.1638902, -1.006683, -3.670758, 0, 1, 0.4666667, 1,
-0.1626467, -0.5650057, -2.141726, 0, 1, 0.4705882, 1,
-0.1582261, -0.832083, -3.732895, 0, 1, 0.4784314, 1,
-0.158212, -0.2299677, -2.61282, 0, 1, 0.4823529, 1,
-0.1581112, 0.1190347, -0.3176341, 0, 1, 0.4901961, 1,
-0.1509184, 0.09762289, -1.22577, 0, 1, 0.4941176, 1,
-0.1496141, 0.03589888, -1.278539, 0, 1, 0.5019608, 1,
-0.144198, 0.366718, 1.00728, 0, 1, 0.509804, 1,
-0.1431638, 0.6514111, 0.066336, 0, 1, 0.5137255, 1,
-0.1413369, -0.1474491, -4.541748, 0, 1, 0.5215687, 1,
-0.1390891, 0.7421941, -1.990427, 0, 1, 0.5254902, 1,
-0.1345772, -1.265859, -3.076257, 0, 1, 0.5333334, 1,
-0.1259957, 1.419358, -0.8690146, 0, 1, 0.5372549, 1,
-0.125344, -0.6020429, -2.530572, 0, 1, 0.5450981, 1,
-0.124671, 0.828306, 0.1918805, 0, 1, 0.5490196, 1,
-0.124401, -0.6760907, -3.095188, 0, 1, 0.5568628, 1,
-0.124127, -0.8679758, -3.776703, 0, 1, 0.5607843, 1,
-0.1225999, 1.918889, -0.8152241, 0, 1, 0.5686275, 1,
-0.1186264, 0.2403181, -1.481572, 0, 1, 0.572549, 1,
-0.1125956, 0.7334189, 2.000835, 0, 1, 0.5803922, 1,
-0.1106189, -1.854827, -3.219483, 0, 1, 0.5843138, 1,
-0.1063639, -1.050107, -3.146027, 0, 1, 0.5921569, 1,
-0.1050942, 0.5412229, -1.557928, 0, 1, 0.5960785, 1,
-0.1044047, -3.218441, -3.371471, 0, 1, 0.6039216, 1,
-0.1003362, 0.766796, -0.5629073, 0, 1, 0.6117647, 1,
-0.1000201, -0.9364744, -3.420421, 0, 1, 0.6156863, 1,
-0.09814852, 0.09434623, -1.120211, 0, 1, 0.6235294, 1,
-0.09683187, 1.440208, -1.736732, 0, 1, 0.627451, 1,
-0.09356907, -0.2536234, -2.673828, 0, 1, 0.6352941, 1,
-0.09218979, 1.159903, -0.1016128, 0, 1, 0.6392157, 1,
-0.09120201, -0.3429495, -2.294502, 0, 1, 0.6470588, 1,
-0.09077469, 0.06203032, -1.298342, 0, 1, 0.6509804, 1,
-0.08943538, 1.769744, -1.381145, 0, 1, 0.6588235, 1,
-0.08896949, -0.02433823, -1.29671, 0, 1, 0.6627451, 1,
-0.08566375, 1.204795, -0.9156334, 0, 1, 0.6705883, 1,
-0.08356695, 0.1553964, -1.148381, 0, 1, 0.6745098, 1,
-0.0814124, 0.8762944, -0.1187608, 0, 1, 0.682353, 1,
-0.080984, -1.515734, -3.292346, 0, 1, 0.6862745, 1,
-0.08000935, -1.509544, -2.800087, 0, 1, 0.6941177, 1,
-0.0784781, 0.2520575, -0.7416272, 0, 1, 0.7019608, 1,
-0.06947896, 0.4809394, -0.7943721, 0, 1, 0.7058824, 1,
-0.0650394, -0.3005606, -1.724576, 0, 1, 0.7137255, 1,
-0.06358822, 1.118865, 0.6797867, 0, 1, 0.7176471, 1,
-0.06358016, 0.4595458, 1.497975, 0, 1, 0.7254902, 1,
-0.0632267, 1.331378, 1.004402, 0, 1, 0.7294118, 1,
-0.05918742, -0.410535, -3.042936, 0, 1, 0.7372549, 1,
-0.0570679, 1.503719, 1.40854, 0, 1, 0.7411765, 1,
-0.05611897, -0.08447841, -3.552848, 0, 1, 0.7490196, 1,
-0.05117084, -0.09016506, -4.130165, 0, 1, 0.7529412, 1,
-0.050881, -0.3840266, -4.934968, 0, 1, 0.7607843, 1,
-0.04912155, -0.6569905, -1.784353, 0, 1, 0.7647059, 1,
-0.03728838, 0.7270294, -1.022593, 0, 1, 0.772549, 1,
-0.03535564, -0.5318435, -2.997547, 0, 1, 0.7764706, 1,
-0.03513024, 1.006084, 0.1137769, 0, 1, 0.7843137, 1,
-0.03441897, 0.5460662, -0.1551404, 0, 1, 0.7882353, 1,
-0.03365674, -1.186279, -4.544769, 0, 1, 0.7960784, 1,
-0.0334674, -0.9872765, -3.632935, 0, 1, 0.8039216, 1,
-0.03287333, -0.05156557, -2.073461, 0, 1, 0.8078431, 1,
-0.03101149, 0.5657246, 0.2722371, 0, 1, 0.8156863, 1,
-0.0295986, -0.6809863, -3.74873, 0, 1, 0.8196079, 1,
-0.02948999, 0.540087, 0.3156168, 0, 1, 0.827451, 1,
-0.02885207, 0.9534364, -0.1256811, 0, 1, 0.8313726, 1,
-0.02381788, -0.03246332, -1.662311, 0, 1, 0.8392157, 1,
-0.02227836, 0.3212742, -0.3174526, 0, 1, 0.8431373, 1,
-0.01669096, 1.054793, -2.910305, 0, 1, 0.8509804, 1,
-0.01277886, -0.6087223, -2.743525, 0, 1, 0.854902, 1,
-0.01164522, -0.319596, -4.176694, 0, 1, 0.8627451, 1,
-0.005902934, -0.6748695, -3.192336, 0, 1, 0.8666667, 1,
0.001396159, -2.068541, 4.295859, 0, 1, 0.8745098, 1,
0.004852463, 0.4667836, -0.6986546, 0, 1, 0.8784314, 1,
0.007596052, -0.4045408, 2.68129, 0, 1, 0.8862745, 1,
0.01149687, -0.07527109, 2.157309, 0, 1, 0.8901961, 1,
0.01258008, -1.358315, 2.56498, 0, 1, 0.8980392, 1,
0.01833038, 0.1673656, 0.1148147, 0, 1, 0.9058824, 1,
0.02031383, 0.5772646, -0.1914613, 0, 1, 0.9098039, 1,
0.02208987, 0.1885251, -0.339326, 0, 1, 0.9176471, 1,
0.02288413, -0.3459161, 4.276497, 0, 1, 0.9215686, 1,
0.02314504, 1.197633, -0.2614943, 0, 1, 0.9294118, 1,
0.02320412, 0.4803091, 1.898346, 0, 1, 0.9333333, 1,
0.02460341, 0.3286345, -0.9202968, 0, 1, 0.9411765, 1,
0.02479841, 1.102057, 0.9051759, 0, 1, 0.945098, 1,
0.02534969, 1.689865, -0.5252272, 0, 1, 0.9529412, 1,
0.02772907, -0.8105772, 2.273156, 0, 1, 0.9568627, 1,
0.03022368, 0.6672428, 0.7820579, 0, 1, 0.9647059, 1,
0.03379402, 1.672667, 0.2387738, 0, 1, 0.9686275, 1,
0.03457414, 1.840187, -1.025444, 0, 1, 0.9764706, 1,
0.03461365, -0.2303074, 4.068606, 0, 1, 0.9803922, 1,
0.03831611, -0.1610974, 2.373492, 0, 1, 0.9882353, 1,
0.03902305, 0.6382313, -0.6723346, 0, 1, 0.9921569, 1,
0.04085097, 0.6964284, -0.7437161, 0, 1, 1, 1,
0.04707293, -1.638851, 3.698022, 0, 0.9921569, 1, 1,
0.05090298, 0.6247031, -0.5266693, 0, 0.9882353, 1, 1,
0.05093385, -0.07687116, 2.598923, 0, 0.9803922, 1, 1,
0.05151992, 1.989359, -0.1120586, 0, 0.9764706, 1, 1,
0.05466976, 0.6950865, 1.021731, 0, 0.9686275, 1, 1,
0.05529771, -0.7928363, 3.256164, 0, 0.9647059, 1, 1,
0.05775654, 1.481333, 0.1518738, 0, 0.9568627, 1, 1,
0.05915124, 0.912191, 0.4982153, 0, 0.9529412, 1, 1,
0.05966432, 0.3439071, 0.8283312, 0, 0.945098, 1, 1,
0.06314046, -0.8293024, 0.9615472, 0, 0.9411765, 1, 1,
0.06972206, 0.123673, 0.3629657, 0, 0.9333333, 1, 1,
0.06976292, 1.420131, 1.7269, 0, 0.9294118, 1, 1,
0.07390153, 1.666243, 0.5594112, 0, 0.9215686, 1, 1,
0.07697388, -0.08011165, 2.12901, 0, 0.9176471, 1, 1,
0.07700303, -1.261909, 3.493782, 0, 0.9098039, 1, 1,
0.08077371, -0.4411764, 2.9441, 0, 0.9058824, 1, 1,
0.08727643, -0.1518047, 2.832438, 0, 0.8980392, 1, 1,
0.08995748, 0.01869464, 2.521258, 0, 0.8901961, 1, 1,
0.09179588, 0.5683439, -1.41238, 0, 0.8862745, 1, 1,
0.09219009, 0.6379141, 0.9759231, 0, 0.8784314, 1, 1,
0.09280132, 0.9350294, 0.7378055, 0, 0.8745098, 1, 1,
0.09472176, -1.140135, 3.65034, 0, 0.8666667, 1, 1,
0.0953966, 0.309389, 0.7602183, 0, 0.8627451, 1, 1,
0.09952272, -1.084121, 3.176073, 0, 0.854902, 1, 1,
0.1013364, -0.5740721, 2.438331, 0, 0.8509804, 1, 1,
0.1028416, -1.221462, 3.4369, 0, 0.8431373, 1, 1,
0.1030486, -0.3326775, 0.6129046, 0, 0.8392157, 1, 1,
0.1069885, 0.1474136, 1.233469, 0, 0.8313726, 1, 1,
0.1141961, 0.9610369, 0.9896424, 0, 0.827451, 1, 1,
0.1159609, 0.1695797, -0.2622389, 0, 0.8196079, 1, 1,
0.1207865, -1.344087, 2.260229, 0, 0.8156863, 1, 1,
0.1214617, -0.2761636, 1.381549, 0, 0.8078431, 1, 1,
0.1225842, 0.1748191, 0.8851946, 0, 0.8039216, 1, 1,
0.1287148, 1.807431, 0.3908132, 0, 0.7960784, 1, 1,
0.130721, -1.182937, 3.009334, 0, 0.7882353, 1, 1,
0.1311531, 0.0214084, 0.4261371, 0, 0.7843137, 1, 1,
0.1317344, 1.524892, -1.779822, 0, 0.7764706, 1, 1,
0.1318777, 0.04542592, 1.219293, 0, 0.772549, 1, 1,
0.1330249, -0.1280483, 3.363122, 0, 0.7647059, 1, 1,
0.13392, -0.0003333553, 2.584479, 0, 0.7607843, 1, 1,
0.1394323, -0.8554441, 2.967816, 0, 0.7529412, 1, 1,
0.1417519, -0.9460866, 1.882849, 0, 0.7490196, 1, 1,
0.1527597, 0.3808276, -0.5672389, 0, 0.7411765, 1, 1,
0.1559846, -0.7759713, 2.428062, 0, 0.7372549, 1, 1,
0.1563671, -1.183685, 2.189788, 0, 0.7294118, 1, 1,
0.1583457, -0.6631364, 0.9907852, 0, 0.7254902, 1, 1,
0.1596385, 0.9339432, -0.604475, 0, 0.7176471, 1, 1,
0.1604823, 0.2199356, 0.436466, 0, 0.7137255, 1, 1,
0.160916, -1.347769, 2.852566, 0, 0.7058824, 1, 1,
0.160997, 0.5215872, 0.7981035, 0, 0.6980392, 1, 1,
0.1621468, -0.06718519, 1.348475, 0, 0.6941177, 1, 1,
0.1625664, 0.7970385, 0.2049657, 0, 0.6862745, 1, 1,
0.1638564, 0.59299, 0.9598878, 0, 0.682353, 1, 1,
0.1668079, 0.5517487, 1.617309, 0, 0.6745098, 1, 1,
0.1705825, -0.3283553, 1.855407, 0, 0.6705883, 1, 1,
0.1747344, -0.4853519, 3.696597, 0, 0.6627451, 1, 1,
0.1760665, -0.499583, 1.820254, 0, 0.6588235, 1, 1,
0.1766906, -0.4052088, 2.08329, 0, 0.6509804, 1, 1,
0.1767242, -0.4963336, 1.973913, 0, 0.6470588, 1, 1,
0.1801537, 0.2484341, 2.539349, 0, 0.6392157, 1, 1,
0.1813468, 0.6681244, 2.306828, 0, 0.6352941, 1, 1,
0.1826617, -0.1068686, 1.069163, 0, 0.627451, 1, 1,
0.1840847, -0.00102032, 2.207304, 0, 0.6235294, 1, 1,
0.1901594, -1.954711, 3.767983, 0, 0.6156863, 1, 1,
0.1948194, -0.927358, 1.910037, 0, 0.6117647, 1, 1,
0.2018021, -0.550498, 2.713909, 0, 0.6039216, 1, 1,
0.2124578, 0.1002503, 1.036994, 0, 0.5960785, 1, 1,
0.2152096, -0.1211762, 1.596361, 0, 0.5921569, 1, 1,
0.215277, -0.06790591, 1.330362, 0, 0.5843138, 1, 1,
0.216603, 0.02499976, 0.09930551, 0, 0.5803922, 1, 1,
0.219291, 0.8123209, -0.3796266, 0, 0.572549, 1, 1,
0.2292658, -1.066945, 3.428459, 0, 0.5686275, 1, 1,
0.2302691, -0.3566678, 3.382877, 0, 0.5607843, 1, 1,
0.232951, -0.7838798, 1.591396, 0, 0.5568628, 1, 1,
0.2347873, -0.8973244, 4.431485, 0, 0.5490196, 1, 1,
0.2349543, -0.1067365, 2.655598, 0, 0.5450981, 1, 1,
0.2350804, 0.07079218, 2.757662, 0, 0.5372549, 1, 1,
0.2355958, 0.5452667, -0.5019755, 0, 0.5333334, 1, 1,
0.2368091, 0.5912054, -0.07490465, 0, 0.5254902, 1, 1,
0.250409, -0.5773904, 2.119603, 0, 0.5215687, 1, 1,
0.2528153, -0.4390933, 2.232391, 0, 0.5137255, 1, 1,
0.2537203, -1.830681, 3.602712, 0, 0.509804, 1, 1,
0.2570225, 0.6733059, 0.91737, 0, 0.5019608, 1, 1,
0.2621124, -1.610243, 2.469746, 0, 0.4941176, 1, 1,
0.2621256, -0.5825163, 1.975372, 0, 0.4901961, 1, 1,
0.2648573, 0.4244887, 0.9263083, 0, 0.4823529, 1, 1,
0.2665538, -0.2688492, 1.773148, 0, 0.4784314, 1, 1,
0.2714289, -0.3344437, 3.685188, 0, 0.4705882, 1, 1,
0.2809241, 1.303423, 1.247314, 0, 0.4666667, 1, 1,
0.2813756, 0.488012, 1.981537, 0, 0.4588235, 1, 1,
0.2832403, -0.4655073, 1.619348, 0, 0.454902, 1, 1,
0.2833977, 0.5033584, 0.2133136, 0, 0.4470588, 1, 1,
0.284205, 0.4213959, 1.209502, 0, 0.4431373, 1, 1,
0.2967788, -0.1617785, 3.124422, 0, 0.4352941, 1, 1,
0.2981262, 0.8624805, 2.377574, 0, 0.4313726, 1, 1,
0.2994111, -0.4563187, 0.8165905, 0, 0.4235294, 1, 1,
0.3017621, 1.445729, 1.624049, 0, 0.4196078, 1, 1,
0.305845, 0.5031562, 0.06039206, 0, 0.4117647, 1, 1,
0.3062167, -1.105378, 2.833317, 0, 0.4078431, 1, 1,
0.3097194, -1.079537, 4.3867, 0, 0.4, 1, 1,
0.3101826, -1.19498, 2.691205, 0, 0.3921569, 1, 1,
0.3103268, 1.434174, -0.8948243, 0, 0.3882353, 1, 1,
0.3165255, 0.1328465, 0.8049567, 0, 0.3803922, 1, 1,
0.3234202, 1.222915, 0.01908336, 0, 0.3764706, 1, 1,
0.3271683, -0.6175434, 1.392223, 0, 0.3686275, 1, 1,
0.3276505, -0.6263009, 3.50545, 0, 0.3647059, 1, 1,
0.3335961, 0.6709468, 1.185345, 0, 0.3568628, 1, 1,
0.3351941, 1.087873, 1.707651, 0, 0.3529412, 1, 1,
0.3356553, 1.395358, 0.1465992, 0, 0.345098, 1, 1,
0.3367114, 0.01199448, 1.478559, 0, 0.3411765, 1, 1,
0.3423389, 0.751632, -0.8266175, 0, 0.3333333, 1, 1,
0.342445, 0.09696715, 1.723927, 0, 0.3294118, 1, 1,
0.3457042, 0.3260582, 0.7140033, 0, 0.3215686, 1, 1,
0.3461709, -1.207588, 2.728439, 0, 0.3176471, 1, 1,
0.3519601, 2.616247, 0.4837425, 0, 0.3098039, 1, 1,
0.3545714, -1.375631, 3.185295, 0, 0.3058824, 1, 1,
0.355205, -1.491241, 2.611141, 0, 0.2980392, 1, 1,
0.3573342, 1.17405, -1.356798, 0, 0.2901961, 1, 1,
0.3626816, -1.304344, 2.446833, 0, 0.2862745, 1, 1,
0.3646089, -1.152735, 3.815585, 0, 0.2784314, 1, 1,
0.367303, -0.4123715, 2.155604, 0, 0.2745098, 1, 1,
0.3674842, 0.8577099, 1.446714, 0, 0.2666667, 1, 1,
0.3712029, -1.412896, 3.014008, 0, 0.2627451, 1, 1,
0.3742806, -1.562686, 3.579775, 0, 0.254902, 1, 1,
0.3758314, -0.5840088, 4.889421, 0, 0.2509804, 1, 1,
0.376607, -0.6237312, 3.662782, 0, 0.2431373, 1, 1,
0.3789414, -1.024309, 4.446455, 0, 0.2392157, 1, 1,
0.37918, -0.9586002, 0.8578235, 0, 0.2313726, 1, 1,
0.380042, -0.4402115, 2.966043, 0, 0.227451, 1, 1,
0.3801492, 0.2169188, 0.7515195, 0, 0.2196078, 1, 1,
0.380388, 0.4370911, -0.826461, 0, 0.2156863, 1, 1,
0.3868478, -1.0736, 4.150637, 0, 0.2078431, 1, 1,
0.3871516, 0.4242337, 1.186655, 0, 0.2039216, 1, 1,
0.3923145, -0.1432621, 2.206798, 0, 0.1960784, 1, 1,
0.3978397, 0.4070774, 0.69912, 0, 0.1882353, 1, 1,
0.398966, 0.8325556, 0.1235062, 0, 0.1843137, 1, 1,
0.3995741, 1.179018, -0.2597058, 0, 0.1764706, 1, 1,
0.4073647, 1.481073, 0.4707493, 0, 0.172549, 1, 1,
0.4074371, -0.3041081, 2.294399, 0, 0.1647059, 1, 1,
0.407789, -0.4507699, 2.428056, 0, 0.1607843, 1, 1,
0.4079356, -0.8970349, 3.655295, 0, 0.1529412, 1, 1,
0.4155264, 0.5313531, 0.539396, 0, 0.1490196, 1, 1,
0.4176623, 0.375035, 0.3113476, 0, 0.1411765, 1, 1,
0.4226652, -0.4272991, 3.339585, 0, 0.1372549, 1, 1,
0.4260357, -1.496493, 2.604002, 0, 0.1294118, 1, 1,
0.4286419, -0.6178754, 2.537387, 0, 0.1254902, 1, 1,
0.4314205, -0.961919, 1.186119, 0, 0.1176471, 1, 1,
0.4325579, -1.305283, 4.38302, 0, 0.1137255, 1, 1,
0.4329113, 0.9444475, 0.4165291, 0, 0.1058824, 1, 1,
0.4370197, -0.7552897, 1.5809, 0, 0.09803922, 1, 1,
0.4375245, -0.7222479, 1.919045, 0, 0.09411765, 1, 1,
0.437664, -1.144819, 1.751321, 0, 0.08627451, 1, 1,
0.4400145, 1.813338, 0.1939231, 0, 0.08235294, 1, 1,
0.4413179, -2.582187, 3.504109, 0, 0.07450981, 1, 1,
0.4439103, 0.8014759, 1.074193, 0, 0.07058824, 1, 1,
0.4453304, -1.164944, 2.625637, 0, 0.0627451, 1, 1,
0.445462, 1.080038, 0.05921107, 0, 0.05882353, 1, 1,
0.4493895, -0.1731377, 1.389466, 0, 0.05098039, 1, 1,
0.4510562, 0.6467273, -1.283902, 0, 0.04705882, 1, 1,
0.4518814, 0.3465839, 0.5276354, 0, 0.03921569, 1, 1,
0.457454, 0.3446682, 1.20626, 0, 0.03529412, 1, 1,
0.4675523, -1.425635, 3.196535, 0, 0.02745098, 1, 1,
0.4689332, 0.2129249, 0.6796075, 0, 0.02352941, 1, 1,
0.4692988, 0.1488253, 2.099111, 0, 0.01568628, 1, 1,
0.4761006, -0.7952016, 0.8668977, 0, 0.01176471, 1, 1,
0.4769786, 0.1892725, 0.6550742, 0, 0.003921569, 1, 1,
0.477182, 0.877107, -0.6124542, 0.003921569, 0, 1, 1,
0.4774964, 0.002434495, 1.998473, 0.007843138, 0, 1, 1,
0.4796338, 1.044943, -0.8956448, 0.01568628, 0, 1, 1,
0.4826724, 0.4282448, 2.468967, 0.01960784, 0, 1, 1,
0.4852082, 1.470852, 0.08120626, 0.02745098, 0, 1, 1,
0.4857207, -0.928921, 2.317722, 0.03137255, 0, 1, 1,
0.4862527, -0.5416397, 2.677451, 0.03921569, 0, 1, 1,
0.489725, -0.827976, 1.214189, 0.04313726, 0, 1, 1,
0.4919881, -0.7561289, 1.892134, 0.05098039, 0, 1, 1,
0.492052, 0.3728185, 1.095362, 0.05490196, 0, 1, 1,
0.4923441, 0.5415986, 1.999701, 0.0627451, 0, 1, 1,
0.494032, 1.305076, 0.9200116, 0.06666667, 0, 1, 1,
0.4944925, 1.3023, -1.904276, 0.07450981, 0, 1, 1,
0.494801, 0.9580429, -0.387656, 0.07843138, 0, 1, 1,
0.5003873, -0.3060803, 2.69931, 0.08627451, 0, 1, 1,
0.5018533, 0.2862065, 0.9775057, 0.09019608, 0, 1, 1,
0.5064272, -0.5323995, 1.593035, 0.09803922, 0, 1, 1,
0.5114071, 0.4518889, 2.253978, 0.1058824, 0, 1, 1,
0.5156439, 1.171071, -0.5484889, 0.1098039, 0, 1, 1,
0.5251145, 0.0676444, -0.07061522, 0.1176471, 0, 1, 1,
0.5262728, -0.6326097, 2.208673, 0.1215686, 0, 1, 1,
0.5287541, -1.286907, 0.5850452, 0.1294118, 0, 1, 1,
0.5366494, -0.1006153, -0.07934623, 0.1333333, 0, 1, 1,
0.5375077, -1.310931, 1.789914, 0.1411765, 0, 1, 1,
0.5417627, 0.304812, 0.7107729, 0.145098, 0, 1, 1,
0.5424517, 1.690422, 0.6385698, 0.1529412, 0, 1, 1,
0.5498474, -0.5417525, 2.00829, 0.1568628, 0, 1, 1,
0.5499069, 1.33345, 0.5423808, 0.1647059, 0, 1, 1,
0.5504072, -0.7456811, 1.321758, 0.1686275, 0, 1, 1,
0.5511003, -0.08760171, 1.482813, 0.1764706, 0, 1, 1,
0.5552874, -0.06072819, 0.65523, 0.1803922, 0, 1, 1,
0.5669601, 0.5093323, 1.802307, 0.1882353, 0, 1, 1,
0.5672418, 0.2260407, 1.222264, 0.1921569, 0, 1, 1,
0.5688184, 0.1920419, -0.1277587, 0.2, 0, 1, 1,
0.5722164, -0.144832, 0.4031885, 0.2078431, 0, 1, 1,
0.5735866, -1.043509, 2.365156, 0.2117647, 0, 1, 1,
0.580048, 1.193357, -1.036088, 0.2196078, 0, 1, 1,
0.585159, -0.1840833, 2.439644, 0.2235294, 0, 1, 1,
0.5883367, -1.048955, 3.503369, 0.2313726, 0, 1, 1,
0.5917377, 0.6972188, -0.4774942, 0.2352941, 0, 1, 1,
0.5941064, 0.3261774, 0.3603719, 0.2431373, 0, 1, 1,
0.596392, 0.1376739, 2.847087, 0.2470588, 0, 1, 1,
0.6107444, 0.02609992, 2.134418, 0.254902, 0, 1, 1,
0.6117399, -1.835134, 2.382468, 0.2588235, 0, 1, 1,
0.6226748, -0.1478328, 1.310979, 0.2666667, 0, 1, 1,
0.6347744, 0.1104526, 1.699464, 0.2705882, 0, 1, 1,
0.6359268, -0.255458, 1.936705, 0.2784314, 0, 1, 1,
0.6388816, -1.479194, 3.330015, 0.282353, 0, 1, 1,
0.6393825, -0.3796661, 1.632099, 0.2901961, 0, 1, 1,
0.6410058, 1.321759, 0.2661525, 0.2941177, 0, 1, 1,
0.6429267, -1.835031, 2.933677, 0.3019608, 0, 1, 1,
0.6478333, -1.812218, 4.090587, 0.3098039, 0, 1, 1,
0.6482913, 0.04297336, 1.508264, 0.3137255, 0, 1, 1,
0.6504545, 0.927461, 1.531437, 0.3215686, 0, 1, 1,
0.6509153, 1.66737, 2.335723, 0.3254902, 0, 1, 1,
0.6585798, 0.4656449, 0.1683322, 0.3333333, 0, 1, 1,
0.6603732, 0.635979, 1.752523, 0.3372549, 0, 1, 1,
0.6658502, 0.6614707, 1.504165, 0.345098, 0, 1, 1,
0.6666618, 0.3977944, 0.2316889, 0.3490196, 0, 1, 1,
0.6716689, 0.5636109, -0.734831, 0.3568628, 0, 1, 1,
0.6736144, -1.611341, 1.491846, 0.3607843, 0, 1, 1,
0.676393, -1.153082, 3.486199, 0.3686275, 0, 1, 1,
0.6786003, 1.172863, 0.03837813, 0.372549, 0, 1, 1,
0.6791227, -0.7272856, 2.775967, 0.3803922, 0, 1, 1,
0.6791891, -0.2419639, 2.427824, 0.3843137, 0, 1, 1,
0.6798127, 0.2752527, 0.603587, 0.3921569, 0, 1, 1,
0.680545, -1.303279, 2.803544, 0.3960784, 0, 1, 1,
0.6823799, -0.2079286, 1.410292, 0.4039216, 0, 1, 1,
0.6897522, -0.4313555, 4.054364, 0.4117647, 0, 1, 1,
0.6939184, -0.6130807, 2.154058, 0.4156863, 0, 1, 1,
0.6967325, -0.11781, 2.128346, 0.4235294, 0, 1, 1,
0.6991764, 0.4766974, 0.2534278, 0.427451, 0, 1, 1,
0.7009347, 1.095821, -1.325148, 0.4352941, 0, 1, 1,
0.706072, 0.426598, 0.7390587, 0.4392157, 0, 1, 1,
0.7080923, -0.1009696, 2.600173, 0.4470588, 0, 1, 1,
0.7084584, 0.01828337, 1.756592, 0.4509804, 0, 1, 1,
0.7135329, 0.7297478, 0.3686057, 0.4588235, 0, 1, 1,
0.7159369, 1.795651, 2.81635, 0.4627451, 0, 1, 1,
0.7172472, 0.4391553, 0.6447779, 0.4705882, 0, 1, 1,
0.7173254, -0.4455314, 2.931737, 0.4745098, 0, 1, 1,
0.7173867, 1.04445, 1.285238, 0.4823529, 0, 1, 1,
0.7218854, -0.3427238, 3.279765, 0.4862745, 0, 1, 1,
0.7235703, -0.01878957, 1.138813, 0.4941176, 0, 1, 1,
0.7281069, -0.9726849, 2.804931, 0.5019608, 0, 1, 1,
0.7285074, -0.002841968, 1.834389, 0.5058824, 0, 1, 1,
0.7351603, 0.735423, 1.499508, 0.5137255, 0, 1, 1,
0.7363414, -0.6785629, 2.683909, 0.5176471, 0, 1, 1,
0.7376471, 0.05479893, 1.961413, 0.5254902, 0, 1, 1,
0.7403827, -1.146991, 2.795109, 0.5294118, 0, 1, 1,
0.742462, 0.5500748, -0.3525781, 0.5372549, 0, 1, 1,
0.7473732, 0.559831, 1.353244, 0.5411765, 0, 1, 1,
0.7487493, 1.122349, 0.04528119, 0.5490196, 0, 1, 1,
0.7501222, -0.7730731, 0.8820553, 0.5529412, 0, 1, 1,
0.7527679, -0.8284737, 0.4937491, 0.5607843, 0, 1, 1,
0.7547942, -2.214146, 4.28508, 0.5647059, 0, 1, 1,
0.7551055, 1.768374, 0.5988352, 0.572549, 0, 1, 1,
0.7580355, 0.191762, 2.860533, 0.5764706, 0, 1, 1,
0.760061, 1.102417, 1.348195, 0.5843138, 0, 1, 1,
0.7608548, 1.210662, 0.4912384, 0.5882353, 0, 1, 1,
0.7690018, -0.7638657, 2.076004, 0.5960785, 0, 1, 1,
0.7728806, 0.9569925, 1.686319, 0.6039216, 0, 1, 1,
0.7731435, 1.32759, -0.5547646, 0.6078432, 0, 1, 1,
0.7790841, -0.8120679, 2.445694, 0.6156863, 0, 1, 1,
0.7791438, 0.07570437, 3.063596, 0.6196079, 0, 1, 1,
0.7796865, -0.1667052, -0.1708357, 0.627451, 0, 1, 1,
0.784085, 0.9687223, 1.300501, 0.6313726, 0, 1, 1,
0.7902301, -0.8441315, 2.861576, 0.6392157, 0, 1, 1,
0.7911341, 0.7773026, -1.010164, 0.6431373, 0, 1, 1,
0.7924086, 1.187487, 0.1255263, 0.6509804, 0, 1, 1,
0.7928231, -0.1926755, 0.1370859, 0.654902, 0, 1, 1,
0.7973725, -0.8184159, 1.701313, 0.6627451, 0, 1, 1,
0.7986214, -0.1959469, 3.59457, 0.6666667, 0, 1, 1,
0.8001902, 0.2999538, 1.139473, 0.6745098, 0, 1, 1,
0.8036149, -0.7293289, 1.449788, 0.6784314, 0, 1, 1,
0.8037254, 0.351618, 0.4517049, 0.6862745, 0, 1, 1,
0.8100549, 0.3105545, 0.8812749, 0.6901961, 0, 1, 1,
0.8118412, -0.3328132, 0.9611381, 0.6980392, 0, 1, 1,
0.8119094, -1.085441, 3.438676, 0.7058824, 0, 1, 1,
0.8123766, -1.849383, 2.578047, 0.7098039, 0, 1, 1,
0.8144548, -1.426896, 2.330548, 0.7176471, 0, 1, 1,
0.8156512, -0.2105864, 3.768368, 0.7215686, 0, 1, 1,
0.8211066, 0.2238313, 1.888786, 0.7294118, 0, 1, 1,
0.8235416, 0.3800097, 0.2700526, 0.7333333, 0, 1, 1,
0.8280394, -0.3389915, 0.3797851, 0.7411765, 0, 1, 1,
0.8294775, -0.3266885, 3.271177, 0.7450981, 0, 1, 1,
0.8310813, 0.4953136, 0.5681561, 0.7529412, 0, 1, 1,
0.8482155, -1.260999, 2.117331, 0.7568628, 0, 1, 1,
0.8526159, 1.873161, 2.401377, 0.7647059, 0, 1, 1,
0.8570734, -1.827246, 3.12419, 0.7686275, 0, 1, 1,
0.8612497, 1.820832, -0.2562707, 0.7764706, 0, 1, 1,
0.866527, 0.8783925, 0.6833646, 0.7803922, 0, 1, 1,
0.8706083, 0.2116957, 1.463935, 0.7882353, 0, 1, 1,
0.8716244, -0.2894614, 1.175487, 0.7921569, 0, 1, 1,
0.8765953, 0.2945706, 2.611676, 0.8, 0, 1, 1,
0.8807307, 0.2187107, 1.050212, 0.8078431, 0, 1, 1,
0.8831702, 0.3174553, 2.305104, 0.8117647, 0, 1, 1,
0.8871365, -0.4795004, 2.103578, 0.8196079, 0, 1, 1,
0.8880107, 1.225775, -0.07029557, 0.8235294, 0, 1, 1,
0.8918244, 0.6957469, 0.1223629, 0.8313726, 0, 1, 1,
0.8961549, 1.086555, 1.364485, 0.8352941, 0, 1, 1,
0.9017665, 0.9620343, 1.009788, 0.8431373, 0, 1, 1,
0.9029085, -0.1564009, 2.302331, 0.8470588, 0, 1, 1,
0.9071097, 1.791153, 0.4425139, 0.854902, 0, 1, 1,
0.9085753, -1.797439, 3.116286, 0.8588235, 0, 1, 1,
0.9132445, 0.6951311, 0.8449954, 0.8666667, 0, 1, 1,
0.9141623, -1.643881, 2.788359, 0.8705882, 0, 1, 1,
0.915673, 0.77692, 1.720127, 0.8784314, 0, 1, 1,
0.9219584, 0.4314526, 0.04627978, 0.8823529, 0, 1, 1,
0.9236124, 0.8326973, 0.8484069, 0.8901961, 0, 1, 1,
0.928329, -0.03445942, 2.631231, 0.8941177, 0, 1, 1,
0.9330746, 0.9765438, 0.5198041, 0.9019608, 0, 1, 1,
0.9352175, 0.8456952, 1.10339, 0.9098039, 0, 1, 1,
0.9486046, 1.229547, -0.147663, 0.9137255, 0, 1, 1,
0.9525998, -0.2014897, 0.6474829, 0.9215686, 0, 1, 1,
0.9543115, 0.1704719, 1.45048, 0.9254902, 0, 1, 1,
0.9543188, -0.1014254, 1.804146, 0.9333333, 0, 1, 1,
0.9544148, -1.026611, 3.240743, 0.9372549, 0, 1, 1,
0.9561348, -1.827492, 2.307745, 0.945098, 0, 1, 1,
0.9622098, 0.8892422, 1.037309, 0.9490196, 0, 1, 1,
0.9622848, -0.2058993, 2.106936, 0.9568627, 0, 1, 1,
0.9663865, 0.1056355, 1.732979, 0.9607843, 0, 1, 1,
0.9667724, -1.262893, 0.7891573, 0.9686275, 0, 1, 1,
0.9769878, -0.3270626, 1.227308, 0.972549, 0, 1, 1,
0.9863681, 1.791417, 0.5649778, 0.9803922, 0, 1, 1,
0.9890684, 0.311823, 1.419183, 0.9843137, 0, 1, 1,
0.9922706, 0.1856861, -1.064634, 0.9921569, 0, 1, 1,
0.9959736, 0.7496217, -0.05429276, 0.9960784, 0, 1, 1,
1.001603, 2.073673, 1.478016, 1, 0, 0.9960784, 1,
1.003282, 0.236433, 0.8467534, 1, 0, 0.9882353, 1,
1.00469, 1.457192, 0.9614391, 1, 0, 0.9843137, 1,
1.009979, -1.988005, 0.7287474, 1, 0, 0.9764706, 1,
1.019565, -0.7142823, 1.795952, 1, 0, 0.972549, 1,
1.020965, 1.837498, 2.46925, 1, 0, 0.9647059, 1,
1.027341, 1.04634, -0.4840585, 1, 0, 0.9607843, 1,
1.027797, 0.5141674, 1.599784, 1, 0, 0.9529412, 1,
1.034808, 1.02596, -1.096368, 1, 0, 0.9490196, 1,
1.039093, 0.3935971, 1.633415, 1, 0, 0.9411765, 1,
1.042542, -1.080283, 2.193295, 1, 0, 0.9372549, 1,
1.044121, 0.8606885, 0.9322855, 1, 0, 0.9294118, 1,
1.045119, -0.06985762, 0.5972552, 1, 0, 0.9254902, 1,
1.046181, 0.2490183, 1.577704, 1, 0, 0.9176471, 1,
1.047326, -0.820715, 2.402481, 1, 0, 0.9137255, 1,
1.048308, 1.849082, 0.4133299, 1, 0, 0.9058824, 1,
1.056238, -1.178077, 1.486533, 1, 0, 0.9019608, 1,
1.056797, -0.4836738, 1.331918, 1, 0, 0.8941177, 1,
1.064999, -1.634727, 1.506999, 1, 0, 0.8862745, 1,
1.0676, 1.498737, 1.276061, 1, 0, 0.8823529, 1,
1.067688, -1.095881, 2.200652, 1, 0, 0.8745098, 1,
1.073198, 0.8404724, 0.9121063, 1, 0, 0.8705882, 1,
1.073997, -1.509545, 1.958412, 1, 0, 0.8627451, 1,
1.074073, 0.7060994, 1.130373, 1, 0, 0.8588235, 1,
1.086598, -1.798257, 3.011382, 1, 0, 0.8509804, 1,
1.095612, 1.361421, 0.09895314, 1, 0, 0.8470588, 1,
1.098977, 0.1300445, 1.333551, 1, 0, 0.8392157, 1,
1.107808, -0.4189107, 2.249419, 1, 0, 0.8352941, 1,
1.12301, 2.260533, 0.3427272, 1, 0, 0.827451, 1,
1.124364, 0.6579806, 2.192433, 1, 0, 0.8235294, 1,
1.127432, 0.4629859, 1.945823, 1, 0, 0.8156863, 1,
1.132767, -0.5505211, 2.350696, 1, 0, 0.8117647, 1,
1.136608, -2.220082, 1.663329, 1, 0, 0.8039216, 1,
1.136665, -0.8939043, 1.922428, 1, 0, 0.7960784, 1,
1.138602, -1.001392, 2.078477, 1, 0, 0.7921569, 1,
1.143699, 0.1896888, -0.09170521, 1, 0, 0.7843137, 1,
1.150025, -1.810694, 3.773591, 1, 0, 0.7803922, 1,
1.156787, -1.176478, 2.868311, 1, 0, 0.772549, 1,
1.158507, 1.751205, -0.6988365, 1, 0, 0.7686275, 1,
1.158621, 0.05054789, 2.199497, 1, 0, 0.7607843, 1,
1.158831, -0.2487589, 3.062549, 1, 0, 0.7568628, 1,
1.163025, -0.7102964, -0.06221049, 1, 0, 0.7490196, 1,
1.16472, -0.8585725, 2.56988, 1, 0, 0.7450981, 1,
1.165965, -0.3993373, 1.384319, 1, 0, 0.7372549, 1,
1.171086, -0.169216, 1.67437, 1, 0, 0.7333333, 1,
1.176779, 1.131349, 2.307828, 1, 0, 0.7254902, 1,
1.188096, -1.145326, 1.931929, 1, 0, 0.7215686, 1,
1.188494, 0.3234367, 0.916769, 1, 0, 0.7137255, 1,
1.19303, 0.956301, 0.1000742, 1, 0, 0.7098039, 1,
1.199224, 0.6058709, 1.935001, 1, 0, 0.7019608, 1,
1.205605, -0.09507462, 2.03874, 1, 0, 0.6941177, 1,
1.208181, -0.737411, 0.9676809, 1, 0, 0.6901961, 1,
1.208625, -0.9283283, 2.400479, 1, 0, 0.682353, 1,
1.209472, -0.2530754, 0.9396027, 1, 0, 0.6784314, 1,
1.211542, 1.044789, 0.9515826, 1, 0, 0.6705883, 1,
1.217034, -2.75809, 3.520628, 1, 0, 0.6666667, 1,
1.237154, -1.137152, 2.438218, 1, 0, 0.6588235, 1,
1.239282, -0.9035307, 2.161068, 1, 0, 0.654902, 1,
1.249706, 0.439123, 1.07075, 1, 0, 0.6470588, 1,
1.249712, -1.034394, 1.787726, 1, 0, 0.6431373, 1,
1.255894, -0.325859, 1.372714, 1, 0, 0.6352941, 1,
1.258035, -0.2937466, 2.744169, 1, 0, 0.6313726, 1,
1.259196, 1.805898, 0.4640299, 1, 0, 0.6235294, 1,
1.260244, 0.4931199, 1.915153, 1, 0, 0.6196079, 1,
1.269684, -0.5822183, 3.625366, 1, 0, 0.6117647, 1,
1.270685, 0.9819998, 0.7823745, 1, 0, 0.6078432, 1,
1.274861, 0.7290885, 0.624445, 1, 0, 0.6, 1,
1.276086, -0.1242038, 0.5818566, 1, 0, 0.5921569, 1,
1.294913, 1.16497, 0.8686756, 1, 0, 0.5882353, 1,
1.30383, -0.6780312, 2.595467, 1, 0, 0.5803922, 1,
1.309242, 1.844879, -0.4041457, 1, 0, 0.5764706, 1,
1.309617, -0.482677, 2.071332, 1, 0, 0.5686275, 1,
1.310568, -0.5931, 2.20057, 1, 0, 0.5647059, 1,
1.314586, -1.192246, 3.196664, 1, 0, 0.5568628, 1,
1.320492, 1.067057, 2.241508, 1, 0, 0.5529412, 1,
1.322444, -0.7510229, 2.084684, 1, 0, 0.5450981, 1,
1.324139, 0.6814672, 0.3072346, 1, 0, 0.5411765, 1,
1.32543, 0.4409716, 0.7659102, 1, 0, 0.5333334, 1,
1.34659, 0.657819, 1.866324, 1, 0, 0.5294118, 1,
1.359187, -0.4454061, 1.654249, 1, 0, 0.5215687, 1,
1.369739, 1.524099, 0.1848715, 1, 0, 0.5176471, 1,
1.379505, -1.84833, 2.025761, 1, 0, 0.509804, 1,
1.380866, -0.2119031, 2.898433, 1, 0, 0.5058824, 1,
1.406647, 0.4381303, 0.4287368, 1, 0, 0.4980392, 1,
1.420233, -0.3153609, 0.1213732, 1, 0, 0.4901961, 1,
1.420704, 0.7756087, -1.203526, 1, 0, 0.4862745, 1,
1.432922, -1.280981, 3.386421, 1, 0, 0.4784314, 1,
1.433978, 1.662236, 1.487442, 1, 0, 0.4745098, 1,
1.435296, -0.433023, 1.908938, 1, 0, 0.4666667, 1,
1.447997, -0.06385767, 2.992328, 1, 0, 0.4627451, 1,
1.453484, -1.996547, 2.446646, 1, 0, 0.454902, 1,
1.456464, -1.054885, 2.228914, 1, 0, 0.4509804, 1,
1.462771, 0.3418487, 0.9543594, 1, 0, 0.4431373, 1,
1.474525, 0.5239643, 0.833204, 1, 0, 0.4392157, 1,
1.475522, 0.7133505, -0.1401012, 1, 0, 0.4313726, 1,
1.511232, 0.006476443, 2.242715, 1, 0, 0.427451, 1,
1.511379, 0.3369724, 2.815916, 1, 0, 0.4196078, 1,
1.516814, -0.6978872, 2.351586, 1, 0, 0.4156863, 1,
1.520783, -1.571671, 2.047409, 1, 0, 0.4078431, 1,
1.523134, -1.277149, 2.43106, 1, 0, 0.4039216, 1,
1.539282, 0.4007795, 1.762787, 1, 0, 0.3960784, 1,
1.545026, 0.111811, 2.547248, 1, 0, 0.3882353, 1,
1.569942, 0.5534011, 0.7482582, 1, 0, 0.3843137, 1,
1.57514, -1.616186, 0.5535799, 1, 0, 0.3764706, 1,
1.589957, -0.9058511, 0.5421022, 1, 0, 0.372549, 1,
1.594893, 0.48163, 0.6308228, 1, 0, 0.3647059, 1,
1.618035, 1.240011, 1.031771, 1, 0, 0.3607843, 1,
1.641853, 2.143147, 0.3132778, 1, 0, 0.3529412, 1,
1.660008, 0.707297, 0.4134112, 1, 0, 0.3490196, 1,
1.6645, -0.5042323, -0.1073334, 1, 0, 0.3411765, 1,
1.672745, 0.4284382, -0.4423681, 1, 0, 0.3372549, 1,
1.674047, -0.6453491, 1.286045, 1, 0, 0.3294118, 1,
1.675084, 0.002861486, -1.038201, 1, 0, 0.3254902, 1,
1.682847, -0.6203247, 3.784306, 1, 0, 0.3176471, 1,
1.688439, 1.079436, 1.633442, 1, 0, 0.3137255, 1,
1.688563, 0.3385823, 1.154795, 1, 0, 0.3058824, 1,
1.690571, -1.507462, 3.093744, 1, 0, 0.2980392, 1,
1.693561, -0.9032961, 3.290231, 1, 0, 0.2941177, 1,
1.700654, 0.7084457, 1.867378, 1, 0, 0.2862745, 1,
1.712863, -1.096932, 2.926853, 1, 0, 0.282353, 1,
1.717167, -1.334689, 2.144759, 1, 0, 0.2745098, 1,
1.724276, -0.5789241, 1.542354, 1, 0, 0.2705882, 1,
1.727052, -0.2871134, 1.78311, 1, 0, 0.2627451, 1,
1.729637, 0.4507651, 2.652403, 1, 0, 0.2588235, 1,
1.736915, -0.8621535, 1.715214, 1, 0, 0.2509804, 1,
1.742753, 1.421416, -0.09007481, 1, 0, 0.2470588, 1,
1.749641, -1.880772, 2.806455, 1, 0, 0.2392157, 1,
1.755294, -0.03715723, 1.805995, 1, 0, 0.2352941, 1,
1.763768, -0.9634905, 2.467854, 1, 0, 0.227451, 1,
1.779397, -0.1353262, 0.5887033, 1, 0, 0.2235294, 1,
1.802726, 0.06833671, 1.698774, 1, 0, 0.2156863, 1,
1.805911, -0.3042379, 1.737947, 1, 0, 0.2117647, 1,
1.825699, 1.368635, 0.6711036, 1, 0, 0.2039216, 1,
1.825907, -1.195344, 3.51388, 1, 0, 0.1960784, 1,
1.844909, -0.5816144, 1.807585, 1, 0, 0.1921569, 1,
1.877166, -1.104837, 2.225974, 1, 0, 0.1843137, 1,
1.88779, 0.8260542, 1.45835, 1, 0, 0.1803922, 1,
1.892642, -0.3373484, 1.200682, 1, 0, 0.172549, 1,
1.912833, 0.6741404, 1.985893, 1, 0, 0.1686275, 1,
1.916145, -0.3130009, 0.5928434, 1, 0, 0.1607843, 1,
1.967727, -0.8634542, 1.158842, 1, 0, 0.1568628, 1,
1.978396, 0.9664724, 3.172626, 1, 0, 0.1490196, 1,
1.981601, 1.212278, 0.7703157, 1, 0, 0.145098, 1,
2.050834, 0.02657892, 1.226698, 1, 0, 0.1372549, 1,
2.0681, 1.286497, 1.642461, 1, 0, 0.1333333, 1,
2.070108, -2.046704, 2.451588, 1, 0, 0.1254902, 1,
2.082105, -2.042304, 1.887529, 1, 0, 0.1215686, 1,
2.098019, 0.9779584, -0.1539494, 1, 0, 0.1137255, 1,
2.09956, 0.302269, 0.7890346, 1, 0, 0.1098039, 1,
2.101371, -0.9143764, 3.004812, 1, 0, 0.1019608, 1,
2.105553, 0.5178861, 2.104495, 1, 0, 0.09411765, 1,
2.119511, -0.005642166, 0.843666, 1, 0, 0.09019608, 1,
2.141591, -0.4079464, 2.396868, 1, 0, 0.08235294, 1,
2.189055, -0.2927978, 1.13796, 1, 0, 0.07843138, 1,
2.252487, 0.3306038, 0.9846398, 1, 0, 0.07058824, 1,
2.316215, 0.2871914, 3.190523, 1, 0, 0.06666667, 1,
2.336947, 0.447876, 0.7912142, 1, 0, 0.05882353, 1,
2.338119, -1.060139, 3.024254, 1, 0, 0.05490196, 1,
2.35134, 0.09662059, 3.37082, 1, 0, 0.04705882, 1,
2.364582, -1.553373, 1.173105, 1, 0, 0.04313726, 1,
2.374209, -0.7460971, 1.268723, 1, 0, 0.03529412, 1,
2.378563, 1.055006, 1.723709, 1, 0, 0.03137255, 1,
2.475263, -1.563467, 2.428543, 1, 0, 0.02352941, 1,
2.776716, 1.153627, -0.7912238, 1, 0, 0.01960784, 1,
2.786823, -0.885232, 1.101539, 1, 0, 0.01176471, 1,
2.798628, -0.5182394, 1.611408, 1, 0, 0.007843138, 1
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
-0.03269589, -4.6027, -7.029737, 0, -0.5, 0.5, 0.5,
-0.03269589, -4.6027, -7.029737, 1, -0.5, 0.5, 0.5,
-0.03269589, -4.6027, -7.029737, 1, 1.5, 0.5, 0.5,
-0.03269589, -4.6027, -7.029737, 0, 1.5, 0.5, 0.5
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
-3.823839, -0.2452492, -7.029737, 0, -0.5, 0.5, 0.5,
-3.823839, -0.2452492, -7.029737, 1, -0.5, 0.5, 0.5,
-3.823839, -0.2452492, -7.029737, 1, 1.5, 0.5, 0.5,
-3.823839, -0.2452492, -7.029737, 0, 1.5, 0.5, 0.5
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
-3.823839, -4.6027, -0.2064137, 0, -0.5, 0.5, 0.5,
-3.823839, -4.6027, -0.2064137, 1, -0.5, 0.5, 0.5,
-3.823839, -4.6027, -0.2064137, 1, 1.5, 0.5, 0.5,
-3.823839, -4.6027, -0.2064137, 0, 1.5, 0.5, 0.5
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
-2, -3.597135, -5.455123,
2, -3.597135, -5.455123,
-2, -3.597135, -5.455123,
-2, -3.764729, -5.717559,
-1, -3.597135, -5.455123,
-1, -3.764729, -5.717559,
0, -3.597135, -5.455123,
0, -3.764729, -5.717559,
1, -3.597135, -5.455123,
1, -3.764729, -5.717559,
2, -3.597135, -5.455123,
2, -3.764729, -5.717559
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
-2, -4.099917, -6.24243, 0, -0.5, 0.5, 0.5,
-2, -4.099917, -6.24243, 1, -0.5, 0.5, 0.5,
-2, -4.099917, -6.24243, 1, 1.5, 0.5, 0.5,
-2, -4.099917, -6.24243, 0, 1.5, 0.5, 0.5,
-1, -4.099917, -6.24243, 0, -0.5, 0.5, 0.5,
-1, -4.099917, -6.24243, 1, -0.5, 0.5, 0.5,
-1, -4.099917, -6.24243, 1, 1.5, 0.5, 0.5,
-1, -4.099917, -6.24243, 0, 1.5, 0.5, 0.5,
0, -4.099917, -6.24243, 0, -0.5, 0.5, 0.5,
0, -4.099917, -6.24243, 1, -0.5, 0.5, 0.5,
0, -4.099917, -6.24243, 1, 1.5, 0.5, 0.5,
0, -4.099917, -6.24243, 0, 1.5, 0.5, 0.5,
1, -4.099917, -6.24243, 0, -0.5, 0.5, 0.5,
1, -4.099917, -6.24243, 1, -0.5, 0.5, 0.5,
1, -4.099917, -6.24243, 1, 1.5, 0.5, 0.5,
1, -4.099917, -6.24243, 0, 1.5, 0.5, 0.5,
2, -4.099917, -6.24243, 0, -0.5, 0.5, 0.5,
2, -4.099917, -6.24243, 1, -0.5, 0.5, 0.5,
2, -4.099917, -6.24243, 1, 1.5, 0.5, 0.5,
2, -4.099917, -6.24243, 0, 1.5, 0.5, 0.5
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
-2.94896, -3, -5.455123,
-2.94896, 3, -5.455123,
-2.94896, -3, -5.455123,
-3.094773, -3, -5.717559,
-2.94896, -2, -5.455123,
-3.094773, -2, -5.717559,
-2.94896, -1, -5.455123,
-3.094773, -1, -5.717559,
-2.94896, 0, -5.455123,
-3.094773, 0, -5.717559,
-2.94896, 1, -5.455123,
-3.094773, 1, -5.717559,
-2.94896, 2, -5.455123,
-3.094773, 2, -5.717559,
-2.94896, 3, -5.455123,
-3.094773, 3, -5.717559
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
-3.386399, -3, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, -3, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, -3, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, -3, -6.24243, 0, 1.5, 0.5, 0.5,
-3.386399, -2, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, -2, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, -2, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, -2, -6.24243, 0, 1.5, 0.5, 0.5,
-3.386399, -1, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, -1, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, -1, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, -1, -6.24243, 0, 1.5, 0.5, 0.5,
-3.386399, 0, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, 0, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, 0, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, 0, -6.24243, 0, 1.5, 0.5, 0.5,
-3.386399, 1, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, 1, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, 1, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, 1, -6.24243, 0, 1.5, 0.5, 0.5,
-3.386399, 2, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, 2, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, 2, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, 2, -6.24243, 0, 1.5, 0.5, 0.5,
-3.386399, 3, -6.24243, 0, -0.5, 0.5, 0.5,
-3.386399, 3, -6.24243, 1, -0.5, 0.5, 0.5,
-3.386399, 3, -6.24243, 1, 1.5, 0.5, 0.5,
-3.386399, 3, -6.24243, 0, 1.5, 0.5, 0.5
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
-2.94896, -3.597135, -4,
-2.94896, -3.597135, 4,
-2.94896, -3.597135, -4,
-3.094773, -3.764729, -4,
-2.94896, -3.597135, -2,
-3.094773, -3.764729, -2,
-2.94896, -3.597135, 0,
-3.094773, -3.764729, 0,
-2.94896, -3.597135, 2,
-3.094773, -3.764729, 2,
-2.94896, -3.597135, 4,
-3.094773, -3.764729, 4
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
-3.386399, -4.099917, -4, 0, -0.5, 0.5, 0.5,
-3.386399, -4.099917, -4, 1, -0.5, 0.5, 0.5,
-3.386399, -4.099917, -4, 1, 1.5, 0.5, 0.5,
-3.386399, -4.099917, -4, 0, 1.5, 0.5, 0.5,
-3.386399, -4.099917, -2, 0, -0.5, 0.5, 0.5,
-3.386399, -4.099917, -2, 1, -0.5, 0.5, 0.5,
-3.386399, -4.099917, -2, 1, 1.5, 0.5, 0.5,
-3.386399, -4.099917, -2, 0, 1.5, 0.5, 0.5,
-3.386399, -4.099917, 0, 0, -0.5, 0.5, 0.5,
-3.386399, -4.099917, 0, 1, -0.5, 0.5, 0.5,
-3.386399, -4.099917, 0, 1, 1.5, 0.5, 0.5,
-3.386399, -4.099917, 0, 0, 1.5, 0.5, 0.5,
-3.386399, -4.099917, 2, 0, -0.5, 0.5, 0.5,
-3.386399, -4.099917, 2, 1, -0.5, 0.5, 0.5,
-3.386399, -4.099917, 2, 1, 1.5, 0.5, 0.5,
-3.386399, -4.099917, 2, 0, 1.5, 0.5, 0.5,
-3.386399, -4.099917, 4, 0, -0.5, 0.5, 0.5,
-3.386399, -4.099917, 4, 1, -0.5, 0.5, 0.5,
-3.386399, -4.099917, 4, 1, 1.5, 0.5, 0.5,
-3.386399, -4.099917, 4, 0, 1.5, 0.5, 0.5
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
-2.94896, -3.597135, -5.455123,
-2.94896, 3.106636, -5.455123,
-2.94896, -3.597135, 5.042296,
-2.94896, 3.106636, 5.042296,
-2.94896, -3.597135, -5.455123,
-2.94896, -3.597135, 5.042296,
-2.94896, 3.106636, -5.455123,
-2.94896, 3.106636, 5.042296,
-2.94896, -3.597135, -5.455123,
2.883568, -3.597135, -5.455123,
-2.94896, -3.597135, 5.042296,
2.883568, -3.597135, 5.042296,
-2.94896, 3.106636, -5.455123,
2.883568, 3.106636, -5.455123,
-2.94896, 3.106636, 5.042296,
2.883568, 3.106636, 5.042296,
2.883568, -3.597135, -5.455123,
2.883568, 3.106636, -5.455123,
2.883568, -3.597135, 5.042296,
2.883568, 3.106636, 5.042296,
2.883568, -3.597135, -5.455123,
2.883568, -3.597135, 5.042296,
2.883568, 3.106636, -5.455123,
2.883568, 3.106636, 5.042296
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
var radius = 7.344024;
var distance = 32.6744;
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
mvMatrix.translate( 0.03269589, 0.2452492, 0.2064137 );
mvMatrix.scale( 1.361417, 1.184483, 0.7564242 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.6744);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fenchlorazole-ethyl<-read.table("fenchlorazole-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenchlorazole-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
```

```r
y<-fenchlorazole-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
```

```r
z<-fenchlorazole-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
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
-2.86402, -0.8428251, -2.35293, 0, 0, 1, 1, 1,
-2.767614, -0.6393826, 0.193551, 1, 0, 0, 1, 1,
-2.644844, -0.7234122, -1.68073, 1, 0, 0, 1, 1,
-2.598469, 0.3746635, 0.2986654, 1, 0, 0, 1, 1,
-2.521772, -1.208397, -2.220713, 1, 0, 0, 1, 1,
-2.503232, 1.154714, -2.315368, 1, 0, 0, 1, 1,
-2.500987, -0.826698, -2.513216, 0, 0, 0, 1, 1,
-2.379882, 0.4716713, -0.8935257, 0, 0, 0, 1, 1,
-2.366978, -0.01641909, -1.879444, 0, 0, 0, 1, 1,
-2.344888, 0.9314418, -1.663946, 0, 0, 0, 1, 1,
-2.308151, 1.970274, -0.6905725, 0, 0, 0, 1, 1,
-2.302323, -0.06139015, -1.534811, 0, 0, 0, 1, 1,
-2.299306, -0.3870023, -0.9176328, 0, 0, 0, 1, 1,
-2.266622, -1.618594, -2.840185, 1, 1, 1, 1, 1,
-2.19586, 1.649937, -0.5124938, 1, 1, 1, 1, 1,
-2.181232, -0.1744247, -0.7808923, 1, 1, 1, 1, 1,
-2.167622, 0.05399251, -2.164791, 1, 1, 1, 1, 1,
-2.147988, 0.3683673, -1.463502, 1, 1, 1, 1, 1,
-2.121834, -1.716849, -3.218597, 1, 1, 1, 1, 1,
-2.087482, -1.797552, -2.376501, 1, 1, 1, 1, 1,
-2.062347, 0.7522836, -1.675024, 1, 1, 1, 1, 1,
-2.001248, 0.7771559, -0.3882174, 1, 1, 1, 1, 1,
-2.000918, -0.00826503, -0.9188482, 1, 1, 1, 1, 1,
-1.97431, -0.6961809, -1.943873, 1, 1, 1, 1, 1,
-1.971806, -0.6097822, -0.8844483, 1, 1, 1, 1, 1,
-1.971541, 0.5180455, -0.8287804, 1, 1, 1, 1, 1,
-1.959704, 0.9192794, -2.030352, 1, 1, 1, 1, 1,
-1.936896, -0.08975733, -2.480651, 1, 1, 1, 1, 1,
-1.927292, 1.746727, 0.1427281, 0, 0, 1, 1, 1,
-1.912329, 0.289448, -1.972549, 1, 0, 0, 1, 1,
-1.910629, -1.056899, -2.098544, 1, 0, 0, 1, 1,
-1.892091, 0.3626492, -0.3945959, 1, 0, 0, 1, 1,
-1.872974, 0.09730491, -2.859804, 1, 0, 0, 1, 1,
-1.869595, -0.01093231, -1.067107, 1, 0, 0, 1, 1,
-1.852102, 0.1791358, -0.3619878, 0, 0, 0, 1, 1,
-1.826351, -1.367309, -2.61867, 0, 0, 0, 1, 1,
-1.818016, -0.1078184, -2.340483, 0, 0, 0, 1, 1,
-1.817756, 0.05377895, -0.134679, 0, 0, 0, 1, 1,
-1.792254, 0.723125, -1.121152, 0, 0, 0, 1, 1,
-1.779981, 0.6464148, -0.5997023, 0, 0, 0, 1, 1,
-1.775052, 0.693084, -0.4472756, 0, 0, 0, 1, 1,
-1.762242, 0.4811588, -0.7911659, 1, 1, 1, 1, 1,
-1.760025, 1.52257, -1.689446, 1, 1, 1, 1, 1,
-1.753424, 0.8743864, -2.154037, 1, 1, 1, 1, 1,
-1.748839, 1.408751, -2.361787, 1, 1, 1, 1, 1,
-1.748539, -0.5113485, -1.128663, 1, 1, 1, 1, 1,
-1.745414, -0.1653797, -2.32984, 1, 1, 1, 1, 1,
-1.71538, -0.9476746, -2.183707, 1, 1, 1, 1, 1,
-1.708276, 0.08716403, -1.779939, 1, 1, 1, 1, 1,
-1.696119, -0.6887102, 0.006788085, 1, 1, 1, 1, 1,
-1.680262, 0.7779593, 0.457065, 1, 1, 1, 1, 1,
-1.679519, -1.558938, -2.907815, 1, 1, 1, 1, 1,
-1.658495, -1.791482, -3.291546, 1, 1, 1, 1, 1,
-1.654561, 1.297421, -1.728835, 1, 1, 1, 1, 1,
-1.650813, -0.9622327, -0.6061454, 1, 1, 1, 1, 1,
-1.633653, -1.517387, -2.892138, 1, 1, 1, 1, 1,
-1.633317, -0.01213413, -0.6629226, 0, 0, 1, 1, 1,
-1.627193, -1.215801, -2.666434, 1, 0, 0, 1, 1,
-1.608073, -1.110893, -3.773824, 1, 0, 0, 1, 1,
-1.603465, 0.1188302, -2.270259, 1, 0, 0, 1, 1,
-1.602147, -1.141974, -3.324896, 1, 0, 0, 1, 1,
-1.600582, 0.9366402, -0.5028872, 1, 0, 0, 1, 1,
-1.591817, -0.250328, -2.895247, 0, 0, 0, 1, 1,
-1.59096, -1.215719, -1.648331, 0, 0, 0, 1, 1,
-1.566574, 1.768292, 0.3083258, 0, 0, 0, 1, 1,
-1.561493, 1.005973, -2.210178, 0, 0, 0, 1, 1,
-1.556635, 0.1890299, -2.022835, 0, 0, 0, 1, 1,
-1.547989, 0.1092408, -3.877212, 0, 0, 0, 1, 1,
-1.536564, -0.0002082515, 1.53234, 0, 0, 0, 1, 1,
-1.530172, -3.499507, -3.430838, 1, 1, 1, 1, 1,
-1.504698, -0.6096267, -1.109758, 1, 1, 1, 1, 1,
-1.494021, 0.7834196, -0.6962096, 1, 1, 1, 1, 1,
-1.487546, 0.9171846, 0.08185831, 1, 1, 1, 1, 1,
-1.48264, -1.370298, -2.819556, 1, 1, 1, 1, 1,
-1.466543, 1.227641, 0.2027611, 1, 1, 1, 1, 1,
-1.457, 0.04219585, -0.7845936, 1, 1, 1, 1, 1,
-1.456269, 0.01746852, -2.753908, 1, 1, 1, 1, 1,
-1.455767, -0.5977685, -1.822089, 1, 1, 1, 1, 1,
-1.454701, -0.5406858, -1.330251, 1, 1, 1, 1, 1,
-1.447291, -0.6109308, -1.597844, 1, 1, 1, 1, 1,
-1.441069, 0.8980192, -0.9101745, 1, 1, 1, 1, 1,
-1.439037, -0.450368, -2.457368, 1, 1, 1, 1, 1,
-1.422138, 0.2304934, -1.947404, 1, 1, 1, 1, 1,
-1.422004, -1.192769, -3.793255, 1, 1, 1, 1, 1,
-1.418693, 1.752742, -0.913892, 0, 0, 1, 1, 1,
-1.416716, -0.0006777334, -1.280876, 1, 0, 0, 1, 1,
-1.391055, -1.453691, -0.5820512, 1, 0, 0, 1, 1,
-1.385782, 0.7680219, -1.451501, 1, 0, 0, 1, 1,
-1.383654, 0.6413364, -1.520451, 1, 0, 0, 1, 1,
-1.375574, -0.6132601, -3.358468, 1, 0, 0, 1, 1,
-1.374985, -0.05415804, -2.531006, 0, 0, 0, 1, 1,
-1.374485, -1.539047, -2.475544, 0, 0, 0, 1, 1,
-1.374307, 0.3767152, 0.5306293, 0, 0, 0, 1, 1,
-1.373685, 1.309565, -0.2517369, 0, 0, 0, 1, 1,
-1.371533, 0.1118842, -2.05134, 0, 0, 0, 1, 1,
-1.350948, 1.859541, -2.488662, 0, 0, 0, 1, 1,
-1.336643, -1.076645, -2.240349, 0, 0, 0, 1, 1,
-1.32557, 0.1551003, -1.425321, 1, 1, 1, 1, 1,
-1.317589, 2.059245, -2.065139, 1, 1, 1, 1, 1,
-1.295801, 2.118293, 1.039696, 1, 1, 1, 1, 1,
-1.294235, -0.2890173, -1.860827, 1, 1, 1, 1, 1,
-1.285631, -0.3830509, -2.846217, 1, 1, 1, 1, 1,
-1.281594, 2.064014, -1.459493, 1, 1, 1, 1, 1,
-1.275736, 0.3643234, -0.9505002, 1, 1, 1, 1, 1,
-1.275337, 0.8205991, 0.2167575, 1, 1, 1, 1, 1,
-1.267992, 0.1957619, -0.7240089, 1, 1, 1, 1, 1,
-1.260617, -0.1845223, -0.4202332, 1, 1, 1, 1, 1,
-1.256577, -2.009767, -2.138295, 1, 1, 1, 1, 1,
-1.24272, 0.649695, -0.8167654, 1, 1, 1, 1, 1,
-1.234628, -0.7888879, -1.737016, 1, 1, 1, 1, 1,
-1.231811, -0.2661434, -1.84962, 1, 1, 1, 1, 1,
-1.228063, 0.9397721, -2.376797, 1, 1, 1, 1, 1,
-1.227908, 1.780913, -0.4339796, 0, 0, 1, 1, 1,
-1.225128, -1.75334, -2.523264, 1, 0, 0, 1, 1,
-1.222076, -0.4156385, -3.020105, 1, 0, 0, 1, 1,
-1.219577, 0.5602113, -0.3214796, 1, 0, 0, 1, 1,
-1.217489, 0.6432084, -0.6388214, 1, 0, 0, 1, 1,
-1.214794, -0.07503445, -2.245144, 1, 0, 0, 1, 1,
-1.213923, 0.01070597, -1.943488, 0, 0, 0, 1, 1,
-1.213319, 0.6674321, -0.128967, 0, 0, 0, 1, 1,
-1.210026, -0.03518076, -1.197708, 0, 0, 0, 1, 1,
-1.204951, 0.5771208, -2.527515, 0, 0, 0, 1, 1,
-1.20264, 0.731205, 0.5401672, 0, 0, 0, 1, 1,
-1.196995, -0.480923, -2.8567, 0, 0, 0, 1, 1,
-1.19228, -2.225821, -2.645711, 0, 0, 0, 1, 1,
-1.192176, 0.1429603, -1.778231, 1, 1, 1, 1, 1,
-1.191408, -1.167639, -1.689618, 1, 1, 1, 1, 1,
-1.178841, -0.6654389, -1.440662, 1, 1, 1, 1, 1,
-1.171592, -0.7396553, -3.835058, 1, 1, 1, 1, 1,
-1.170898, -1.11034, -2.753576, 1, 1, 1, 1, 1,
-1.159427, 1.110733, -0.1397568, 1, 1, 1, 1, 1,
-1.156915, 0.7893116, -1.84581, 1, 1, 1, 1, 1,
-1.154198, -0.817042, -3.774154, 1, 1, 1, 1, 1,
-1.148911, 0.4414352, -1.540374, 1, 1, 1, 1, 1,
-1.14419, -0.4922759, -1.416602, 1, 1, 1, 1, 1,
-1.143898, -0.2820877, -1.803754, 1, 1, 1, 1, 1,
-1.141773, 2.487649, -1.880267, 1, 1, 1, 1, 1,
-1.141343, -1.210362, -3.767122, 1, 1, 1, 1, 1,
-1.140584, 0.5384927, -1.948159, 1, 1, 1, 1, 1,
-1.138971, -1.240925, -3.429763, 1, 1, 1, 1, 1,
-1.135432, 0.5540553, -2.27046, 0, 0, 1, 1, 1,
-1.127274, 1.37489, -0.4772164, 1, 0, 0, 1, 1,
-1.124215, -0.7173127, -3.33288, 1, 0, 0, 1, 1,
-1.11963, 0.6198931, -0.4659458, 1, 0, 0, 1, 1,
-1.09928, 0.1404137, -2.121401, 1, 0, 0, 1, 1,
-1.093921, 0.8983287, 0.02249406, 1, 0, 0, 1, 1,
-1.093459, -1.330915, -3.080271, 0, 0, 0, 1, 1,
-1.088071, 0.07929631, -1.370422, 0, 0, 0, 1, 1,
-1.085093, -0.6714315, -2.083979, 0, 0, 0, 1, 1,
-1.081546, 0.4978009, -1.244129, 0, 0, 0, 1, 1,
-1.081463, -1.652936, -3.124289, 0, 0, 0, 1, 1,
-1.076724, 0.09781753, -1.424258, 0, 0, 0, 1, 1,
-1.073821, 0.1244702, -1.044213, 0, 0, 0, 1, 1,
-1.072971, 1.417207, 0.2400909, 1, 1, 1, 1, 1,
-1.072299, -0.2208847, -2.143303, 1, 1, 1, 1, 1,
-1.070338, 0.5383314, -0.5247011, 1, 1, 1, 1, 1,
-1.069224, -1.916258, -3.284054, 1, 1, 1, 1, 1,
-1.064116, -0.3793626, -1.645568, 1, 1, 1, 1, 1,
-1.061071, -0.145196, -1.338289, 1, 1, 1, 1, 1,
-1.060127, 0.6625471, -1.428931, 1, 1, 1, 1, 1,
-1.057467, -0.9431936, -2.165666, 1, 1, 1, 1, 1,
-1.057333, 1.686921, 0.176623, 1, 1, 1, 1, 1,
-1.0497, -0.2747291, -0.464604, 1, 1, 1, 1, 1,
-1.036958, -1.632231, -3.265127, 1, 1, 1, 1, 1,
-1.034331, 1.83501, -0.3286759, 1, 1, 1, 1, 1,
-1.017097, 0.09499613, -2.306469, 1, 1, 1, 1, 1,
-0.9949486, -0.3027369, -2.096657, 1, 1, 1, 1, 1,
-0.9920779, 1.037023, -1.610754, 1, 1, 1, 1, 1,
-0.9841822, 2.302948, 0.1289997, 0, 0, 1, 1, 1,
-0.9820014, -0.5604293, -1.609527, 1, 0, 0, 1, 1,
-0.9785837, 1.607705, -1.474834, 1, 0, 0, 1, 1,
-0.9720012, -0.1477795, -2.40918, 1, 0, 0, 1, 1,
-0.968182, -0.2097642, -1.26745, 1, 0, 0, 1, 1,
-0.9570582, -0.2347185, -2.88732, 1, 0, 0, 1, 1,
-0.9523855, -0.9225928, -1.52934, 0, 0, 0, 1, 1,
-0.9482141, 0.02459016, -3.344746, 0, 0, 0, 1, 1,
-0.9475973, -1.930175, -3.688401, 0, 0, 0, 1, 1,
-0.9440355, 0.4365631, -0.8780325, 0, 0, 0, 1, 1,
-0.9422569, -0.2746812, 0.2645589, 0, 0, 0, 1, 1,
-0.9417151, -1.480235, -2.594084, 0, 0, 0, 1, 1,
-0.9304834, 0.2590163, -1.32071, 0, 0, 0, 1, 1,
-0.9297101, -0.1617819, -2.715782, 1, 1, 1, 1, 1,
-0.9189816, -0.3114009, -3.248323, 1, 1, 1, 1, 1,
-0.9132631, -1.277372, -2.929127, 1, 1, 1, 1, 1,
-0.9088612, -0.4375815, -1.955276, 1, 1, 1, 1, 1,
-0.9084194, -0.8622652, -3.022053, 1, 1, 1, 1, 1,
-0.9052948, -0.01973325, -1.322629, 1, 1, 1, 1, 1,
-0.9051229, 0.29405, -0.226271, 1, 1, 1, 1, 1,
-0.8966233, -0.4312324, -1.523682, 1, 1, 1, 1, 1,
-0.8924373, 0.5439709, -2.088881, 1, 1, 1, 1, 1,
-0.892435, -0.1587217, -2.367483, 1, 1, 1, 1, 1,
-0.8905137, 2.040201, -0.4765842, 1, 1, 1, 1, 1,
-0.8898275, -0.9888556, -4.381274, 1, 1, 1, 1, 1,
-0.8894269, 0.4264624, 0.7137835, 1, 1, 1, 1, 1,
-0.8749882, -1.12363, -2.67733, 1, 1, 1, 1, 1,
-0.8730942, 0.5319918, -1.453914, 1, 1, 1, 1, 1,
-0.8722713, -1.249018, -2.762395, 0, 0, 1, 1, 1,
-0.8713829, -1.625286, -2.336286, 1, 0, 0, 1, 1,
-0.8706228, 0.0909059, -0.03811245, 1, 0, 0, 1, 1,
-0.8647181, 0.604075, -0.334189, 1, 0, 0, 1, 1,
-0.8601542, 0.7654338, -2.454125, 1, 0, 0, 1, 1,
-0.8479581, 0.9214629, 0.1838788, 1, 0, 0, 1, 1,
-0.8466772, -1.379329, -2.367974, 0, 0, 0, 1, 1,
-0.8360984, -1.796679, -3.142816, 0, 0, 0, 1, 1,
-0.8260154, 0.480338, -0.7929088, 0, 0, 0, 1, 1,
-0.823783, -0.400737, -2.801636, 0, 0, 0, 1, 1,
-0.8217538, -1.037259, -2.894555, 0, 0, 0, 1, 1,
-0.8213887, 0.5318268, -1.318999, 0, 0, 0, 1, 1,
-0.8200853, 0.04718142, -1.805694, 0, 0, 0, 1, 1,
-0.814707, -1.877489, -0.7378541, 1, 1, 1, 1, 1,
-0.8082836, 0.7060892, -0.5461408, 1, 1, 1, 1, 1,
-0.8020579, -0.4492382, -1.635747, 1, 1, 1, 1, 1,
-0.7935693, 0.2113235, -1.122886, 1, 1, 1, 1, 1,
-0.7904852, -2.423686, -2.930415, 1, 1, 1, 1, 1,
-0.7901894, -1.45708, -2.458412, 1, 1, 1, 1, 1,
-0.7887972, 0.2823185, -0.04397272, 1, 1, 1, 1, 1,
-0.7862454, -1.015751, -2.462915, 1, 1, 1, 1, 1,
-0.7763636, 1.385332, -0.6186047, 1, 1, 1, 1, 1,
-0.7749528, -1.251558, -3.02908, 1, 1, 1, 1, 1,
-0.7736251, -0.5956237, -0.8459927, 1, 1, 1, 1, 1,
-0.7731057, -0.07304306, -0.1894149, 1, 1, 1, 1, 1,
-0.7718973, -0.03193586, -1.752712, 1, 1, 1, 1, 1,
-0.7679688, -1.48466, -1.189769, 1, 1, 1, 1, 1,
-0.767844, 0.7036974, -2.264672, 1, 1, 1, 1, 1,
-0.7677132, 1.445076, -0.4143744, 0, 0, 1, 1, 1,
-0.7639886, -0.8372037, -3.353581, 1, 0, 0, 1, 1,
-0.7604913, 0.7332551, -0.287831, 1, 0, 0, 1, 1,
-0.7564059, 1.372322, 1.403313, 1, 0, 0, 1, 1,
-0.7551522, -0.2339702, -1.318053, 1, 0, 0, 1, 1,
-0.7547001, -0.8470927, -1.064093, 1, 0, 0, 1, 1,
-0.7542089, -0.681474, -1.445492, 0, 0, 0, 1, 1,
-0.7535005, -0.279682, -0.1431378, 0, 0, 0, 1, 1,
-0.7528777, 0.9432984, -2.372027, 0, 0, 0, 1, 1,
-0.7489726, 0.3582676, -0.8518174, 0, 0, 0, 1, 1,
-0.7456923, 0.3572415, -0.6338677, 0, 0, 0, 1, 1,
-0.7444011, 0.4668908, -1.126709, 0, 0, 0, 1, 1,
-0.7440709, 0.09918001, -2.790689, 0, 0, 0, 1, 1,
-0.7299435, 3.009009, 0.6536415, 1, 1, 1, 1, 1,
-0.7283753, -0.4054466, -0.05374108, 1, 1, 1, 1, 1,
-0.726335, -0.6376621, -3.011722, 1, 1, 1, 1, 1,
-0.7257618, -0.6645604, -3.334932, 1, 1, 1, 1, 1,
-0.7223638, 1.06754, -0.5755967, 1, 1, 1, 1, 1,
-0.7152907, 1.655473, -0.5786467, 1, 1, 1, 1, 1,
-0.7150297, 0.2274913, -0.4692044, 1, 1, 1, 1, 1,
-0.7095468, 0.7413625, 0.3927508, 1, 1, 1, 1, 1,
-0.7049081, 1.589602, -1.37348, 1, 1, 1, 1, 1,
-0.6993259, 0.5670531, -1.139681, 1, 1, 1, 1, 1,
-0.6932252, 0.8472391, -0.7396305, 1, 1, 1, 1, 1,
-0.6917357, 1.367797, -0.5789452, 1, 1, 1, 1, 1,
-0.6858547, -0.6987092, -3.026016, 1, 1, 1, 1, 1,
-0.6857309, -0.06325892, -1.209834, 1, 1, 1, 1, 1,
-0.6835458, -0.4238739, -3.155261, 1, 1, 1, 1, 1,
-0.6799646, -0.9671113, -2.281368, 0, 0, 1, 1, 1,
-0.6793265, -0.3385195, -2.429217, 1, 0, 0, 1, 1,
-0.6773854, 1.161249, 0.1089102, 1, 0, 0, 1, 1,
-0.6750132, -0.4538401, -1.742385, 1, 0, 0, 1, 1,
-0.6708941, -0.6034704, -2.500405, 1, 0, 0, 1, 1,
-0.6681975, 0.5597433, -1.534801, 1, 0, 0, 1, 1,
-0.6676492, 0.5239843, 0.7873759, 0, 0, 0, 1, 1,
-0.6656463, -0.05991976, -0.6351567, 0, 0, 0, 1, 1,
-0.6648217, 0.5402395, -0.5853128, 0, 0, 0, 1, 1,
-0.6564825, 1.256922, -2.264587, 0, 0, 0, 1, 1,
-0.6552345, -0.8870668, -4.622268, 0, 0, 0, 1, 1,
-0.6435208, 0.2654988, -1.486037, 0, 0, 0, 1, 1,
-0.6390522, -0.8688876, -4.978798, 0, 0, 0, 1, 1,
-0.635673, -1.325804, -0.9161236, 1, 1, 1, 1, 1,
-0.6343732, 0.2078742, -0.6798835, 1, 1, 1, 1, 1,
-0.6338342, 0.07951704, -1.061446, 1, 1, 1, 1, 1,
-0.6309552, 0.1145429, -0.4374244, 1, 1, 1, 1, 1,
-0.6300451, 1.2952, -0.6561407, 1, 1, 1, 1, 1,
-0.6239368, 1.192997, -0.1829058, 1, 1, 1, 1, 1,
-0.6184741, -2.214666, -3.122449, 1, 1, 1, 1, 1,
-0.6169032, -0.7267904, -3.132843, 1, 1, 1, 1, 1,
-0.6115422, -1.252293, -2.007171, 1, 1, 1, 1, 1,
-0.6090985, -0.9274244, -2.947113, 1, 1, 1, 1, 1,
-0.6005954, 0.7506468, 1.268108, 1, 1, 1, 1, 1,
-0.599187, -1.091913, -2.808643, 1, 1, 1, 1, 1,
-0.5975533, 1.125286, -0.6117074, 1, 1, 1, 1, 1,
-0.594675, -1.130667, -2.493696, 1, 1, 1, 1, 1,
-0.5915929, -0.2740144, -2.129159, 1, 1, 1, 1, 1,
-0.5888901, -0.04341411, -0.4914144, 0, 0, 1, 1, 1,
-0.5798311, -1.045247, -2.982444, 1, 0, 0, 1, 1,
-0.5789891, 0.3806325, -2.079879, 1, 0, 0, 1, 1,
-0.5747198, 1.700607, -0.4389784, 1, 0, 0, 1, 1,
-0.5686269, 1.404122, 0.846466, 1, 0, 0, 1, 1,
-0.5637586, -1.293212, -3.601341, 1, 0, 0, 1, 1,
-0.5612447, -0.6417106, -2.381075, 0, 0, 0, 1, 1,
-0.554858, 0.3864519, -2.284365, 0, 0, 0, 1, 1,
-0.5535091, 0.5805745, -0.266917, 0, 0, 0, 1, 1,
-0.5481912, 0.2907306, -2.89879, 0, 0, 0, 1, 1,
-0.5479531, -0.1976096, -0.3625909, 0, 0, 0, 1, 1,
-0.5416407, -1.934391, -2.713369, 0, 0, 0, 1, 1,
-0.5355261, 0.4746852, -1.159309, 0, 0, 0, 1, 1,
-0.5278196, 0.7958003, -1.542771, 1, 1, 1, 1, 1,
-0.5271912, -0.2028354, -0.8019642, 1, 1, 1, 1, 1,
-0.5244371, 0.6925657, -0.5592111, 1, 1, 1, 1, 1,
-0.5229366, 0.1498932, -3.269567, 1, 1, 1, 1, 1,
-0.5203924, -0.5766748, -0.4253964, 1, 1, 1, 1, 1,
-0.5202798, 0.5663614, 0.3907217, 1, 1, 1, 1, 1,
-0.519253, 0.4719841, -3.038962, 1, 1, 1, 1, 1,
-0.5188185, -0.7351453, -2.39179, 1, 1, 1, 1, 1,
-0.517451, 0.1837806, -2.580518, 1, 1, 1, 1, 1,
-0.5133306, 0.6068779, -2.056452, 1, 1, 1, 1, 1,
-0.5130351, -0.8802695, -1.873341, 1, 1, 1, 1, 1,
-0.5128204, -0.1719506, -2.682408, 1, 1, 1, 1, 1,
-0.5125577, -0.1257595, -1.750113, 1, 1, 1, 1, 1,
-0.5120357, -1.002479, -3.143924, 1, 1, 1, 1, 1,
-0.5084441, 1.324248, 0.06733961, 1, 1, 1, 1, 1,
-0.5066665, 1.719733, -0.7574759, 0, 0, 1, 1, 1,
-0.501473, 0.2493185, -0.5636661, 1, 0, 0, 1, 1,
-0.4965295, 0.7199293, -0.8556321, 1, 0, 0, 1, 1,
-0.4958704, -0.6444901, -2.805762, 1, 0, 0, 1, 1,
-0.4953244, 1.006502, -1.243943, 1, 0, 0, 1, 1,
-0.49335, -0.422461, -2.327627, 1, 0, 0, 1, 1,
-0.4874648, -0.2106545, -2.639032, 0, 0, 0, 1, 1,
-0.4844757, 0.4372122, -1.564885, 0, 0, 0, 1, 1,
-0.4819765, -0.006075586, 0.1795963, 0, 0, 0, 1, 1,
-0.4813935, 0.2852599, -0.990937, 0, 0, 0, 1, 1,
-0.4708643, -1.047577, -3.44024, 0, 0, 0, 1, 1,
-0.4696598, -0.9104687, -2.940107, 0, 0, 0, 1, 1,
-0.4681697, 1.213953, 0.748723, 0, 0, 0, 1, 1,
-0.4675784, 0.347286, -1.963211, 1, 1, 1, 1, 1,
-0.4637399, 0.2458556, -1.483874, 1, 1, 1, 1, 1,
-0.4562437, 0.2834172, 0.7112696, 1, 1, 1, 1, 1,
-0.4535958, 1.007089, 0.5164613, 1, 1, 1, 1, 1,
-0.4521454, 0.3102866, 1.769657, 1, 1, 1, 1, 1,
-0.4500949, -0.7917365, -2.579475, 1, 1, 1, 1, 1,
-0.4495876, 1.631106, -0.5143098, 1, 1, 1, 1, 1,
-0.448273, 1.002353, -1.168571, 1, 1, 1, 1, 1,
-0.445599, -0.4486331, -1.752929, 1, 1, 1, 1, 1,
-0.4413586, 0.03394349, -1.776997, 1, 1, 1, 1, 1,
-0.4399334, -0.5498542, -5.302248, 1, 1, 1, 1, 1,
-0.4343715, 1.550026, 0.208529, 1, 1, 1, 1, 1,
-0.4326284, -0.09258106, -0.6370984, 1, 1, 1, 1, 1,
-0.4306141, 0.06295741, -1.672934, 1, 1, 1, 1, 1,
-0.4294394, -0.7673074, -4.274981, 1, 1, 1, 1, 1,
-0.4286281, -0.6533738, -2.613007, 0, 0, 1, 1, 1,
-0.426962, 1.250101, -0.915889, 1, 0, 0, 1, 1,
-0.4210454, 1.292989, -0.1694316, 1, 0, 0, 1, 1,
-0.4205031, 0.4027024, -1.713357, 1, 0, 0, 1, 1,
-0.4151779, 1.014537, -0.6426467, 1, 0, 0, 1, 1,
-0.4150203, -0.3571329, -2.263697, 1, 0, 0, 1, 1,
-0.414612, -1.092614, -1.457895, 0, 0, 0, 1, 1,
-0.4102134, -0.9829473, -2.645832, 0, 0, 0, 1, 1,
-0.4102097, -0.01945377, -1.954381, 0, 0, 0, 1, 1,
-0.4086391, 0.3220116, -2.151465, 0, 0, 0, 1, 1,
-0.4043524, -1.187697, -4.247913, 0, 0, 0, 1, 1,
-0.3958381, 1.970142, -1.160791, 0, 0, 0, 1, 1,
-0.3745342, -0.1157787, -1.638537, 0, 0, 0, 1, 1,
-0.3713049, -1.430722, -3.917648, 1, 1, 1, 1, 1,
-0.3712916, 0.4320151, 0.5520695, 1, 1, 1, 1, 1,
-0.3704274, 0.1282013, -1.026682, 1, 1, 1, 1, 1,
-0.3613364, 0.5674549, 2.102922, 1, 1, 1, 1, 1,
-0.3605457, 0.2679282, -0.6898525, 1, 1, 1, 1, 1,
-0.3542645, 1.468668, -2.009371, 1, 1, 1, 1, 1,
-0.3523116, -0.2488984, -1.687512, 1, 1, 1, 1, 1,
-0.3467624, 0.268753, -2.344312, 1, 1, 1, 1, 1,
-0.3467432, 0.3254809, -1.96687, 1, 1, 1, 1, 1,
-0.3325905, 0.5662771, -0.475468, 1, 1, 1, 1, 1,
-0.3315372, -0.2637346, -5.086614, 1, 1, 1, 1, 1,
-0.3265469, -1.513629, -3.817076, 1, 1, 1, 1, 1,
-0.3223626, -0.3838289, -2.62012, 1, 1, 1, 1, 1,
-0.3210534, 0.1959101, -2.156296, 1, 1, 1, 1, 1,
-0.3198253, -1.743492, -1.447301, 1, 1, 1, 1, 1,
-0.3146932, -1.342926, -3.695049, 0, 0, 1, 1, 1,
-0.313956, -0.4639358, -2.497076, 1, 0, 0, 1, 1,
-0.3026297, -0.2592742, -1.987265, 1, 0, 0, 1, 1,
-0.3010278, -0.5922005, -3.389407, 1, 0, 0, 1, 1,
-0.3008484, 1.171759, -0.3489858, 1, 0, 0, 1, 1,
-0.2990452, -0.9475774, -2.405817, 1, 0, 0, 1, 1,
-0.2986644, 0.358148, -1.077628, 0, 0, 0, 1, 1,
-0.2982845, -0.5234846, -2.629037, 0, 0, 0, 1, 1,
-0.2942635, -0.7584292, -4.03543, 0, 0, 0, 1, 1,
-0.2929918, -0.01811868, -0.9978853, 0, 0, 0, 1, 1,
-0.2925684, 1.516645, 0.8173181, 0, 0, 0, 1, 1,
-0.2882604, -0.1940475, -1.566856, 0, 0, 0, 1, 1,
-0.2860854, -1.278886, -3.768923, 0, 0, 0, 1, 1,
-0.2777975, 0.9184058, 0.2187744, 1, 1, 1, 1, 1,
-0.2722286, 0.4118584, -1.654729, 1, 1, 1, 1, 1,
-0.2670945, -0.6576499, -4.244577, 1, 1, 1, 1, 1,
-0.2559389, -0.003571353, -0.942455, 1, 1, 1, 1, 1,
-0.2553335, -0.8986301, -3.530025, 1, 1, 1, 1, 1,
-0.2530777, -0.8651004, -3.379925, 1, 1, 1, 1, 1,
-0.2489762, 0.8668963, -0.8280361, 1, 1, 1, 1, 1,
-0.2482233, -0.4222085, -1.279815, 1, 1, 1, 1, 1,
-0.2468284, -0.5376222, -3.212402, 1, 1, 1, 1, 1,
-0.2449279, 0.5471842, -1.153383, 1, 1, 1, 1, 1,
-0.2363913, -0.7875165, -2.827436, 1, 1, 1, 1, 1,
-0.2314769, -2.666296, -2.402041, 1, 1, 1, 1, 1,
-0.2296605, -1.695564, -3.605724, 1, 1, 1, 1, 1,
-0.2288482, -1.073238, -4.176673, 1, 1, 1, 1, 1,
-0.2255808, 1.505315, 0.7058337, 1, 1, 1, 1, 1,
-0.2247109, 1.315446, -1.740898, 0, 0, 1, 1, 1,
-0.2234357, -0.8928924, -3.604725, 1, 0, 0, 1, 1,
-0.2232789, -0.9034934, -3.762196, 1, 0, 0, 1, 1,
-0.2175487, -0.8283262, -1.199218, 1, 0, 0, 1, 1,
-0.2162464, 0.1120404, -1.030777, 1, 0, 0, 1, 1,
-0.2137332, -0.1249674, -4.096196, 1, 0, 0, 1, 1,
-0.2127101, -0.4074392, -3.049241, 0, 0, 0, 1, 1,
-0.209174, 0.4915711, -1.450661, 0, 0, 0, 1, 1,
-0.2010382, -1.779433, -2.95622, 0, 0, 0, 1, 1,
-0.1810509, 0.380878, 0.03460427, 0, 0, 0, 1, 1,
-0.1785643, -1.974643, -3.544973, 0, 0, 0, 1, 1,
-0.1782971, 1.353809, -1.296583, 0, 0, 0, 1, 1,
-0.1750147, -0.115158, -3.317156, 0, 0, 0, 1, 1,
-0.1706765, 1.289052, -0.3356089, 1, 1, 1, 1, 1,
-0.1704005, 0.4203697, -0.7318413, 1, 1, 1, 1, 1,
-0.1687755, 0.6462931, -0.474703, 1, 1, 1, 1, 1,
-0.1663924, 1.278499, -0.2566827, 1, 1, 1, 1, 1,
-0.1662698, -0.7917194, -2.010993, 1, 1, 1, 1, 1,
-0.1662645, 0.244761, -0.6424586, 1, 1, 1, 1, 1,
-0.1638902, -1.006683, -3.670758, 1, 1, 1, 1, 1,
-0.1626467, -0.5650057, -2.141726, 1, 1, 1, 1, 1,
-0.1582261, -0.832083, -3.732895, 1, 1, 1, 1, 1,
-0.158212, -0.2299677, -2.61282, 1, 1, 1, 1, 1,
-0.1581112, 0.1190347, -0.3176341, 1, 1, 1, 1, 1,
-0.1509184, 0.09762289, -1.22577, 1, 1, 1, 1, 1,
-0.1496141, 0.03589888, -1.278539, 1, 1, 1, 1, 1,
-0.144198, 0.366718, 1.00728, 1, 1, 1, 1, 1,
-0.1431638, 0.6514111, 0.066336, 1, 1, 1, 1, 1,
-0.1413369, -0.1474491, -4.541748, 0, 0, 1, 1, 1,
-0.1390891, 0.7421941, -1.990427, 1, 0, 0, 1, 1,
-0.1345772, -1.265859, -3.076257, 1, 0, 0, 1, 1,
-0.1259957, 1.419358, -0.8690146, 1, 0, 0, 1, 1,
-0.125344, -0.6020429, -2.530572, 1, 0, 0, 1, 1,
-0.124671, 0.828306, 0.1918805, 1, 0, 0, 1, 1,
-0.124401, -0.6760907, -3.095188, 0, 0, 0, 1, 1,
-0.124127, -0.8679758, -3.776703, 0, 0, 0, 1, 1,
-0.1225999, 1.918889, -0.8152241, 0, 0, 0, 1, 1,
-0.1186264, 0.2403181, -1.481572, 0, 0, 0, 1, 1,
-0.1125956, 0.7334189, 2.000835, 0, 0, 0, 1, 1,
-0.1106189, -1.854827, -3.219483, 0, 0, 0, 1, 1,
-0.1063639, -1.050107, -3.146027, 0, 0, 0, 1, 1,
-0.1050942, 0.5412229, -1.557928, 1, 1, 1, 1, 1,
-0.1044047, -3.218441, -3.371471, 1, 1, 1, 1, 1,
-0.1003362, 0.766796, -0.5629073, 1, 1, 1, 1, 1,
-0.1000201, -0.9364744, -3.420421, 1, 1, 1, 1, 1,
-0.09814852, 0.09434623, -1.120211, 1, 1, 1, 1, 1,
-0.09683187, 1.440208, -1.736732, 1, 1, 1, 1, 1,
-0.09356907, -0.2536234, -2.673828, 1, 1, 1, 1, 1,
-0.09218979, 1.159903, -0.1016128, 1, 1, 1, 1, 1,
-0.09120201, -0.3429495, -2.294502, 1, 1, 1, 1, 1,
-0.09077469, 0.06203032, -1.298342, 1, 1, 1, 1, 1,
-0.08943538, 1.769744, -1.381145, 1, 1, 1, 1, 1,
-0.08896949, -0.02433823, -1.29671, 1, 1, 1, 1, 1,
-0.08566375, 1.204795, -0.9156334, 1, 1, 1, 1, 1,
-0.08356695, 0.1553964, -1.148381, 1, 1, 1, 1, 1,
-0.0814124, 0.8762944, -0.1187608, 1, 1, 1, 1, 1,
-0.080984, -1.515734, -3.292346, 0, 0, 1, 1, 1,
-0.08000935, -1.509544, -2.800087, 1, 0, 0, 1, 1,
-0.0784781, 0.2520575, -0.7416272, 1, 0, 0, 1, 1,
-0.06947896, 0.4809394, -0.7943721, 1, 0, 0, 1, 1,
-0.0650394, -0.3005606, -1.724576, 1, 0, 0, 1, 1,
-0.06358822, 1.118865, 0.6797867, 1, 0, 0, 1, 1,
-0.06358016, 0.4595458, 1.497975, 0, 0, 0, 1, 1,
-0.0632267, 1.331378, 1.004402, 0, 0, 0, 1, 1,
-0.05918742, -0.410535, -3.042936, 0, 0, 0, 1, 1,
-0.0570679, 1.503719, 1.40854, 0, 0, 0, 1, 1,
-0.05611897, -0.08447841, -3.552848, 0, 0, 0, 1, 1,
-0.05117084, -0.09016506, -4.130165, 0, 0, 0, 1, 1,
-0.050881, -0.3840266, -4.934968, 0, 0, 0, 1, 1,
-0.04912155, -0.6569905, -1.784353, 1, 1, 1, 1, 1,
-0.03728838, 0.7270294, -1.022593, 1, 1, 1, 1, 1,
-0.03535564, -0.5318435, -2.997547, 1, 1, 1, 1, 1,
-0.03513024, 1.006084, 0.1137769, 1, 1, 1, 1, 1,
-0.03441897, 0.5460662, -0.1551404, 1, 1, 1, 1, 1,
-0.03365674, -1.186279, -4.544769, 1, 1, 1, 1, 1,
-0.0334674, -0.9872765, -3.632935, 1, 1, 1, 1, 1,
-0.03287333, -0.05156557, -2.073461, 1, 1, 1, 1, 1,
-0.03101149, 0.5657246, 0.2722371, 1, 1, 1, 1, 1,
-0.0295986, -0.6809863, -3.74873, 1, 1, 1, 1, 1,
-0.02948999, 0.540087, 0.3156168, 1, 1, 1, 1, 1,
-0.02885207, 0.9534364, -0.1256811, 1, 1, 1, 1, 1,
-0.02381788, -0.03246332, -1.662311, 1, 1, 1, 1, 1,
-0.02227836, 0.3212742, -0.3174526, 1, 1, 1, 1, 1,
-0.01669096, 1.054793, -2.910305, 1, 1, 1, 1, 1,
-0.01277886, -0.6087223, -2.743525, 0, 0, 1, 1, 1,
-0.01164522, -0.319596, -4.176694, 1, 0, 0, 1, 1,
-0.005902934, -0.6748695, -3.192336, 1, 0, 0, 1, 1,
0.001396159, -2.068541, 4.295859, 1, 0, 0, 1, 1,
0.004852463, 0.4667836, -0.6986546, 1, 0, 0, 1, 1,
0.007596052, -0.4045408, 2.68129, 1, 0, 0, 1, 1,
0.01149687, -0.07527109, 2.157309, 0, 0, 0, 1, 1,
0.01258008, -1.358315, 2.56498, 0, 0, 0, 1, 1,
0.01833038, 0.1673656, 0.1148147, 0, 0, 0, 1, 1,
0.02031383, 0.5772646, -0.1914613, 0, 0, 0, 1, 1,
0.02208987, 0.1885251, -0.339326, 0, 0, 0, 1, 1,
0.02288413, -0.3459161, 4.276497, 0, 0, 0, 1, 1,
0.02314504, 1.197633, -0.2614943, 0, 0, 0, 1, 1,
0.02320412, 0.4803091, 1.898346, 1, 1, 1, 1, 1,
0.02460341, 0.3286345, -0.9202968, 1, 1, 1, 1, 1,
0.02479841, 1.102057, 0.9051759, 1, 1, 1, 1, 1,
0.02534969, 1.689865, -0.5252272, 1, 1, 1, 1, 1,
0.02772907, -0.8105772, 2.273156, 1, 1, 1, 1, 1,
0.03022368, 0.6672428, 0.7820579, 1, 1, 1, 1, 1,
0.03379402, 1.672667, 0.2387738, 1, 1, 1, 1, 1,
0.03457414, 1.840187, -1.025444, 1, 1, 1, 1, 1,
0.03461365, -0.2303074, 4.068606, 1, 1, 1, 1, 1,
0.03831611, -0.1610974, 2.373492, 1, 1, 1, 1, 1,
0.03902305, 0.6382313, -0.6723346, 1, 1, 1, 1, 1,
0.04085097, 0.6964284, -0.7437161, 1, 1, 1, 1, 1,
0.04707293, -1.638851, 3.698022, 1, 1, 1, 1, 1,
0.05090298, 0.6247031, -0.5266693, 1, 1, 1, 1, 1,
0.05093385, -0.07687116, 2.598923, 1, 1, 1, 1, 1,
0.05151992, 1.989359, -0.1120586, 0, 0, 1, 1, 1,
0.05466976, 0.6950865, 1.021731, 1, 0, 0, 1, 1,
0.05529771, -0.7928363, 3.256164, 1, 0, 0, 1, 1,
0.05775654, 1.481333, 0.1518738, 1, 0, 0, 1, 1,
0.05915124, 0.912191, 0.4982153, 1, 0, 0, 1, 1,
0.05966432, 0.3439071, 0.8283312, 1, 0, 0, 1, 1,
0.06314046, -0.8293024, 0.9615472, 0, 0, 0, 1, 1,
0.06972206, 0.123673, 0.3629657, 0, 0, 0, 1, 1,
0.06976292, 1.420131, 1.7269, 0, 0, 0, 1, 1,
0.07390153, 1.666243, 0.5594112, 0, 0, 0, 1, 1,
0.07697388, -0.08011165, 2.12901, 0, 0, 0, 1, 1,
0.07700303, -1.261909, 3.493782, 0, 0, 0, 1, 1,
0.08077371, -0.4411764, 2.9441, 0, 0, 0, 1, 1,
0.08727643, -0.1518047, 2.832438, 1, 1, 1, 1, 1,
0.08995748, 0.01869464, 2.521258, 1, 1, 1, 1, 1,
0.09179588, 0.5683439, -1.41238, 1, 1, 1, 1, 1,
0.09219009, 0.6379141, 0.9759231, 1, 1, 1, 1, 1,
0.09280132, 0.9350294, 0.7378055, 1, 1, 1, 1, 1,
0.09472176, -1.140135, 3.65034, 1, 1, 1, 1, 1,
0.0953966, 0.309389, 0.7602183, 1, 1, 1, 1, 1,
0.09952272, -1.084121, 3.176073, 1, 1, 1, 1, 1,
0.1013364, -0.5740721, 2.438331, 1, 1, 1, 1, 1,
0.1028416, -1.221462, 3.4369, 1, 1, 1, 1, 1,
0.1030486, -0.3326775, 0.6129046, 1, 1, 1, 1, 1,
0.1069885, 0.1474136, 1.233469, 1, 1, 1, 1, 1,
0.1141961, 0.9610369, 0.9896424, 1, 1, 1, 1, 1,
0.1159609, 0.1695797, -0.2622389, 1, 1, 1, 1, 1,
0.1207865, -1.344087, 2.260229, 1, 1, 1, 1, 1,
0.1214617, -0.2761636, 1.381549, 0, 0, 1, 1, 1,
0.1225842, 0.1748191, 0.8851946, 1, 0, 0, 1, 1,
0.1287148, 1.807431, 0.3908132, 1, 0, 0, 1, 1,
0.130721, -1.182937, 3.009334, 1, 0, 0, 1, 1,
0.1311531, 0.0214084, 0.4261371, 1, 0, 0, 1, 1,
0.1317344, 1.524892, -1.779822, 1, 0, 0, 1, 1,
0.1318777, 0.04542592, 1.219293, 0, 0, 0, 1, 1,
0.1330249, -0.1280483, 3.363122, 0, 0, 0, 1, 1,
0.13392, -0.0003333553, 2.584479, 0, 0, 0, 1, 1,
0.1394323, -0.8554441, 2.967816, 0, 0, 0, 1, 1,
0.1417519, -0.9460866, 1.882849, 0, 0, 0, 1, 1,
0.1527597, 0.3808276, -0.5672389, 0, 0, 0, 1, 1,
0.1559846, -0.7759713, 2.428062, 0, 0, 0, 1, 1,
0.1563671, -1.183685, 2.189788, 1, 1, 1, 1, 1,
0.1583457, -0.6631364, 0.9907852, 1, 1, 1, 1, 1,
0.1596385, 0.9339432, -0.604475, 1, 1, 1, 1, 1,
0.1604823, 0.2199356, 0.436466, 1, 1, 1, 1, 1,
0.160916, -1.347769, 2.852566, 1, 1, 1, 1, 1,
0.160997, 0.5215872, 0.7981035, 1, 1, 1, 1, 1,
0.1621468, -0.06718519, 1.348475, 1, 1, 1, 1, 1,
0.1625664, 0.7970385, 0.2049657, 1, 1, 1, 1, 1,
0.1638564, 0.59299, 0.9598878, 1, 1, 1, 1, 1,
0.1668079, 0.5517487, 1.617309, 1, 1, 1, 1, 1,
0.1705825, -0.3283553, 1.855407, 1, 1, 1, 1, 1,
0.1747344, -0.4853519, 3.696597, 1, 1, 1, 1, 1,
0.1760665, -0.499583, 1.820254, 1, 1, 1, 1, 1,
0.1766906, -0.4052088, 2.08329, 1, 1, 1, 1, 1,
0.1767242, -0.4963336, 1.973913, 1, 1, 1, 1, 1,
0.1801537, 0.2484341, 2.539349, 0, 0, 1, 1, 1,
0.1813468, 0.6681244, 2.306828, 1, 0, 0, 1, 1,
0.1826617, -0.1068686, 1.069163, 1, 0, 0, 1, 1,
0.1840847, -0.00102032, 2.207304, 1, 0, 0, 1, 1,
0.1901594, -1.954711, 3.767983, 1, 0, 0, 1, 1,
0.1948194, -0.927358, 1.910037, 1, 0, 0, 1, 1,
0.2018021, -0.550498, 2.713909, 0, 0, 0, 1, 1,
0.2124578, 0.1002503, 1.036994, 0, 0, 0, 1, 1,
0.2152096, -0.1211762, 1.596361, 0, 0, 0, 1, 1,
0.215277, -0.06790591, 1.330362, 0, 0, 0, 1, 1,
0.216603, 0.02499976, 0.09930551, 0, 0, 0, 1, 1,
0.219291, 0.8123209, -0.3796266, 0, 0, 0, 1, 1,
0.2292658, -1.066945, 3.428459, 0, 0, 0, 1, 1,
0.2302691, -0.3566678, 3.382877, 1, 1, 1, 1, 1,
0.232951, -0.7838798, 1.591396, 1, 1, 1, 1, 1,
0.2347873, -0.8973244, 4.431485, 1, 1, 1, 1, 1,
0.2349543, -0.1067365, 2.655598, 1, 1, 1, 1, 1,
0.2350804, 0.07079218, 2.757662, 1, 1, 1, 1, 1,
0.2355958, 0.5452667, -0.5019755, 1, 1, 1, 1, 1,
0.2368091, 0.5912054, -0.07490465, 1, 1, 1, 1, 1,
0.250409, -0.5773904, 2.119603, 1, 1, 1, 1, 1,
0.2528153, -0.4390933, 2.232391, 1, 1, 1, 1, 1,
0.2537203, -1.830681, 3.602712, 1, 1, 1, 1, 1,
0.2570225, 0.6733059, 0.91737, 1, 1, 1, 1, 1,
0.2621124, -1.610243, 2.469746, 1, 1, 1, 1, 1,
0.2621256, -0.5825163, 1.975372, 1, 1, 1, 1, 1,
0.2648573, 0.4244887, 0.9263083, 1, 1, 1, 1, 1,
0.2665538, -0.2688492, 1.773148, 1, 1, 1, 1, 1,
0.2714289, -0.3344437, 3.685188, 0, 0, 1, 1, 1,
0.2809241, 1.303423, 1.247314, 1, 0, 0, 1, 1,
0.2813756, 0.488012, 1.981537, 1, 0, 0, 1, 1,
0.2832403, -0.4655073, 1.619348, 1, 0, 0, 1, 1,
0.2833977, 0.5033584, 0.2133136, 1, 0, 0, 1, 1,
0.284205, 0.4213959, 1.209502, 1, 0, 0, 1, 1,
0.2967788, -0.1617785, 3.124422, 0, 0, 0, 1, 1,
0.2981262, 0.8624805, 2.377574, 0, 0, 0, 1, 1,
0.2994111, -0.4563187, 0.8165905, 0, 0, 0, 1, 1,
0.3017621, 1.445729, 1.624049, 0, 0, 0, 1, 1,
0.305845, 0.5031562, 0.06039206, 0, 0, 0, 1, 1,
0.3062167, -1.105378, 2.833317, 0, 0, 0, 1, 1,
0.3097194, -1.079537, 4.3867, 0, 0, 0, 1, 1,
0.3101826, -1.19498, 2.691205, 1, 1, 1, 1, 1,
0.3103268, 1.434174, -0.8948243, 1, 1, 1, 1, 1,
0.3165255, 0.1328465, 0.8049567, 1, 1, 1, 1, 1,
0.3234202, 1.222915, 0.01908336, 1, 1, 1, 1, 1,
0.3271683, -0.6175434, 1.392223, 1, 1, 1, 1, 1,
0.3276505, -0.6263009, 3.50545, 1, 1, 1, 1, 1,
0.3335961, 0.6709468, 1.185345, 1, 1, 1, 1, 1,
0.3351941, 1.087873, 1.707651, 1, 1, 1, 1, 1,
0.3356553, 1.395358, 0.1465992, 1, 1, 1, 1, 1,
0.3367114, 0.01199448, 1.478559, 1, 1, 1, 1, 1,
0.3423389, 0.751632, -0.8266175, 1, 1, 1, 1, 1,
0.342445, 0.09696715, 1.723927, 1, 1, 1, 1, 1,
0.3457042, 0.3260582, 0.7140033, 1, 1, 1, 1, 1,
0.3461709, -1.207588, 2.728439, 1, 1, 1, 1, 1,
0.3519601, 2.616247, 0.4837425, 1, 1, 1, 1, 1,
0.3545714, -1.375631, 3.185295, 0, 0, 1, 1, 1,
0.355205, -1.491241, 2.611141, 1, 0, 0, 1, 1,
0.3573342, 1.17405, -1.356798, 1, 0, 0, 1, 1,
0.3626816, -1.304344, 2.446833, 1, 0, 0, 1, 1,
0.3646089, -1.152735, 3.815585, 1, 0, 0, 1, 1,
0.367303, -0.4123715, 2.155604, 1, 0, 0, 1, 1,
0.3674842, 0.8577099, 1.446714, 0, 0, 0, 1, 1,
0.3712029, -1.412896, 3.014008, 0, 0, 0, 1, 1,
0.3742806, -1.562686, 3.579775, 0, 0, 0, 1, 1,
0.3758314, -0.5840088, 4.889421, 0, 0, 0, 1, 1,
0.376607, -0.6237312, 3.662782, 0, 0, 0, 1, 1,
0.3789414, -1.024309, 4.446455, 0, 0, 0, 1, 1,
0.37918, -0.9586002, 0.8578235, 0, 0, 0, 1, 1,
0.380042, -0.4402115, 2.966043, 1, 1, 1, 1, 1,
0.3801492, 0.2169188, 0.7515195, 1, 1, 1, 1, 1,
0.380388, 0.4370911, -0.826461, 1, 1, 1, 1, 1,
0.3868478, -1.0736, 4.150637, 1, 1, 1, 1, 1,
0.3871516, 0.4242337, 1.186655, 1, 1, 1, 1, 1,
0.3923145, -0.1432621, 2.206798, 1, 1, 1, 1, 1,
0.3978397, 0.4070774, 0.69912, 1, 1, 1, 1, 1,
0.398966, 0.8325556, 0.1235062, 1, 1, 1, 1, 1,
0.3995741, 1.179018, -0.2597058, 1, 1, 1, 1, 1,
0.4073647, 1.481073, 0.4707493, 1, 1, 1, 1, 1,
0.4074371, -0.3041081, 2.294399, 1, 1, 1, 1, 1,
0.407789, -0.4507699, 2.428056, 1, 1, 1, 1, 1,
0.4079356, -0.8970349, 3.655295, 1, 1, 1, 1, 1,
0.4155264, 0.5313531, 0.539396, 1, 1, 1, 1, 1,
0.4176623, 0.375035, 0.3113476, 1, 1, 1, 1, 1,
0.4226652, -0.4272991, 3.339585, 0, 0, 1, 1, 1,
0.4260357, -1.496493, 2.604002, 1, 0, 0, 1, 1,
0.4286419, -0.6178754, 2.537387, 1, 0, 0, 1, 1,
0.4314205, -0.961919, 1.186119, 1, 0, 0, 1, 1,
0.4325579, -1.305283, 4.38302, 1, 0, 0, 1, 1,
0.4329113, 0.9444475, 0.4165291, 1, 0, 0, 1, 1,
0.4370197, -0.7552897, 1.5809, 0, 0, 0, 1, 1,
0.4375245, -0.7222479, 1.919045, 0, 0, 0, 1, 1,
0.437664, -1.144819, 1.751321, 0, 0, 0, 1, 1,
0.4400145, 1.813338, 0.1939231, 0, 0, 0, 1, 1,
0.4413179, -2.582187, 3.504109, 0, 0, 0, 1, 1,
0.4439103, 0.8014759, 1.074193, 0, 0, 0, 1, 1,
0.4453304, -1.164944, 2.625637, 0, 0, 0, 1, 1,
0.445462, 1.080038, 0.05921107, 1, 1, 1, 1, 1,
0.4493895, -0.1731377, 1.389466, 1, 1, 1, 1, 1,
0.4510562, 0.6467273, -1.283902, 1, 1, 1, 1, 1,
0.4518814, 0.3465839, 0.5276354, 1, 1, 1, 1, 1,
0.457454, 0.3446682, 1.20626, 1, 1, 1, 1, 1,
0.4675523, -1.425635, 3.196535, 1, 1, 1, 1, 1,
0.4689332, 0.2129249, 0.6796075, 1, 1, 1, 1, 1,
0.4692988, 0.1488253, 2.099111, 1, 1, 1, 1, 1,
0.4761006, -0.7952016, 0.8668977, 1, 1, 1, 1, 1,
0.4769786, 0.1892725, 0.6550742, 1, 1, 1, 1, 1,
0.477182, 0.877107, -0.6124542, 1, 1, 1, 1, 1,
0.4774964, 0.002434495, 1.998473, 1, 1, 1, 1, 1,
0.4796338, 1.044943, -0.8956448, 1, 1, 1, 1, 1,
0.4826724, 0.4282448, 2.468967, 1, 1, 1, 1, 1,
0.4852082, 1.470852, 0.08120626, 1, 1, 1, 1, 1,
0.4857207, -0.928921, 2.317722, 0, 0, 1, 1, 1,
0.4862527, -0.5416397, 2.677451, 1, 0, 0, 1, 1,
0.489725, -0.827976, 1.214189, 1, 0, 0, 1, 1,
0.4919881, -0.7561289, 1.892134, 1, 0, 0, 1, 1,
0.492052, 0.3728185, 1.095362, 1, 0, 0, 1, 1,
0.4923441, 0.5415986, 1.999701, 1, 0, 0, 1, 1,
0.494032, 1.305076, 0.9200116, 0, 0, 0, 1, 1,
0.4944925, 1.3023, -1.904276, 0, 0, 0, 1, 1,
0.494801, 0.9580429, -0.387656, 0, 0, 0, 1, 1,
0.5003873, -0.3060803, 2.69931, 0, 0, 0, 1, 1,
0.5018533, 0.2862065, 0.9775057, 0, 0, 0, 1, 1,
0.5064272, -0.5323995, 1.593035, 0, 0, 0, 1, 1,
0.5114071, 0.4518889, 2.253978, 0, 0, 0, 1, 1,
0.5156439, 1.171071, -0.5484889, 1, 1, 1, 1, 1,
0.5251145, 0.0676444, -0.07061522, 1, 1, 1, 1, 1,
0.5262728, -0.6326097, 2.208673, 1, 1, 1, 1, 1,
0.5287541, -1.286907, 0.5850452, 1, 1, 1, 1, 1,
0.5366494, -0.1006153, -0.07934623, 1, 1, 1, 1, 1,
0.5375077, -1.310931, 1.789914, 1, 1, 1, 1, 1,
0.5417627, 0.304812, 0.7107729, 1, 1, 1, 1, 1,
0.5424517, 1.690422, 0.6385698, 1, 1, 1, 1, 1,
0.5498474, -0.5417525, 2.00829, 1, 1, 1, 1, 1,
0.5499069, 1.33345, 0.5423808, 1, 1, 1, 1, 1,
0.5504072, -0.7456811, 1.321758, 1, 1, 1, 1, 1,
0.5511003, -0.08760171, 1.482813, 1, 1, 1, 1, 1,
0.5552874, -0.06072819, 0.65523, 1, 1, 1, 1, 1,
0.5669601, 0.5093323, 1.802307, 1, 1, 1, 1, 1,
0.5672418, 0.2260407, 1.222264, 1, 1, 1, 1, 1,
0.5688184, 0.1920419, -0.1277587, 0, 0, 1, 1, 1,
0.5722164, -0.144832, 0.4031885, 1, 0, 0, 1, 1,
0.5735866, -1.043509, 2.365156, 1, 0, 0, 1, 1,
0.580048, 1.193357, -1.036088, 1, 0, 0, 1, 1,
0.585159, -0.1840833, 2.439644, 1, 0, 0, 1, 1,
0.5883367, -1.048955, 3.503369, 1, 0, 0, 1, 1,
0.5917377, 0.6972188, -0.4774942, 0, 0, 0, 1, 1,
0.5941064, 0.3261774, 0.3603719, 0, 0, 0, 1, 1,
0.596392, 0.1376739, 2.847087, 0, 0, 0, 1, 1,
0.6107444, 0.02609992, 2.134418, 0, 0, 0, 1, 1,
0.6117399, -1.835134, 2.382468, 0, 0, 0, 1, 1,
0.6226748, -0.1478328, 1.310979, 0, 0, 0, 1, 1,
0.6347744, 0.1104526, 1.699464, 0, 0, 0, 1, 1,
0.6359268, -0.255458, 1.936705, 1, 1, 1, 1, 1,
0.6388816, -1.479194, 3.330015, 1, 1, 1, 1, 1,
0.6393825, -0.3796661, 1.632099, 1, 1, 1, 1, 1,
0.6410058, 1.321759, 0.2661525, 1, 1, 1, 1, 1,
0.6429267, -1.835031, 2.933677, 1, 1, 1, 1, 1,
0.6478333, -1.812218, 4.090587, 1, 1, 1, 1, 1,
0.6482913, 0.04297336, 1.508264, 1, 1, 1, 1, 1,
0.6504545, 0.927461, 1.531437, 1, 1, 1, 1, 1,
0.6509153, 1.66737, 2.335723, 1, 1, 1, 1, 1,
0.6585798, 0.4656449, 0.1683322, 1, 1, 1, 1, 1,
0.6603732, 0.635979, 1.752523, 1, 1, 1, 1, 1,
0.6658502, 0.6614707, 1.504165, 1, 1, 1, 1, 1,
0.6666618, 0.3977944, 0.2316889, 1, 1, 1, 1, 1,
0.6716689, 0.5636109, -0.734831, 1, 1, 1, 1, 1,
0.6736144, -1.611341, 1.491846, 1, 1, 1, 1, 1,
0.676393, -1.153082, 3.486199, 0, 0, 1, 1, 1,
0.6786003, 1.172863, 0.03837813, 1, 0, 0, 1, 1,
0.6791227, -0.7272856, 2.775967, 1, 0, 0, 1, 1,
0.6791891, -0.2419639, 2.427824, 1, 0, 0, 1, 1,
0.6798127, 0.2752527, 0.603587, 1, 0, 0, 1, 1,
0.680545, -1.303279, 2.803544, 1, 0, 0, 1, 1,
0.6823799, -0.2079286, 1.410292, 0, 0, 0, 1, 1,
0.6897522, -0.4313555, 4.054364, 0, 0, 0, 1, 1,
0.6939184, -0.6130807, 2.154058, 0, 0, 0, 1, 1,
0.6967325, -0.11781, 2.128346, 0, 0, 0, 1, 1,
0.6991764, 0.4766974, 0.2534278, 0, 0, 0, 1, 1,
0.7009347, 1.095821, -1.325148, 0, 0, 0, 1, 1,
0.706072, 0.426598, 0.7390587, 0, 0, 0, 1, 1,
0.7080923, -0.1009696, 2.600173, 1, 1, 1, 1, 1,
0.7084584, 0.01828337, 1.756592, 1, 1, 1, 1, 1,
0.7135329, 0.7297478, 0.3686057, 1, 1, 1, 1, 1,
0.7159369, 1.795651, 2.81635, 1, 1, 1, 1, 1,
0.7172472, 0.4391553, 0.6447779, 1, 1, 1, 1, 1,
0.7173254, -0.4455314, 2.931737, 1, 1, 1, 1, 1,
0.7173867, 1.04445, 1.285238, 1, 1, 1, 1, 1,
0.7218854, -0.3427238, 3.279765, 1, 1, 1, 1, 1,
0.7235703, -0.01878957, 1.138813, 1, 1, 1, 1, 1,
0.7281069, -0.9726849, 2.804931, 1, 1, 1, 1, 1,
0.7285074, -0.002841968, 1.834389, 1, 1, 1, 1, 1,
0.7351603, 0.735423, 1.499508, 1, 1, 1, 1, 1,
0.7363414, -0.6785629, 2.683909, 1, 1, 1, 1, 1,
0.7376471, 0.05479893, 1.961413, 1, 1, 1, 1, 1,
0.7403827, -1.146991, 2.795109, 1, 1, 1, 1, 1,
0.742462, 0.5500748, -0.3525781, 0, 0, 1, 1, 1,
0.7473732, 0.559831, 1.353244, 1, 0, 0, 1, 1,
0.7487493, 1.122349, 0.04528119, 1, 0, 0, 1, 1,
0.7501222, -0.7730731, 0.8820553, 1, 0, 0, 1, 1,
0.7527679, -0.8284737, 0.4937491, 1, 0, 0, 1, 1,
0.7547942, -2.214146, 4.28508, 1, 0, 0, 1, 1,
0.7551055, 1.768374, 0.5988352, 0, 0, 0, 1, 1,
0.7580355, 0.191762, 2.860533, 0, 0, 0, 1, 1,
0.760061, 1.102417, 1.348195, 0, 0, 0, 1, 1,
0.7608548, 1.210662, 0.4912384, 0, 0, 0, 1, 1,
0.7690018, -0.7638657, 2.076004, 0, 0, 0, 1, 1,
0.7728806, 0.9569925, 1.686319, 0, 0, 0, 1, 1,
0.7731435, 1.32759, -0.5547646, 0, 0, 0, 1, 1,
0.7790841, -0.8120679, 2.445694, 1, 1, 1, 1, 1,
0.7791438, 0.07570437, 3.063596, 1, 1, 1, 1, 1,
0.7796865, -0.1667052, -0.1708357, 1, 1, 1, 1, 1,
0.784085, 0.9687223, 1.300501, 1, 1, 1, 1, 1,
0.7902301, -0.8441315, 2.861576, 1, 1, 1, 1, 1,
0.7911341, 0.7773026, -1.010164, 1, 1, 1, 1, 1,
0.7924086, 1.187487, 0.1255263, 1, 1, 1, 1, 1,
0.7928231, -0.1926755, 0.1370859, 1, 1, 1, 1, 1,
0.7973725, -0.8184159, 1.701313, 1, 1, 1, 1, 1,
0.7986214, -0.1959469, 3.59457, 1, 1, 1, 1, 1,
0.8001902, 0.2999538, 1.139473, 1, 1, 1, 1, 1,
0.8036149, -0.7293289, 1.449788, 1, 1, 1, 1, 1,
0.8037254, 0.351618, 0.4517049, 1, 1, 1, 1, 1,
0.8100549, 0.3105545, 0.8812749, 1, 1, 1, 1, 1,
0.8118412, -0.3328132, 0.9611381, 1, 1, 1, 1, 1,
0.8119094, -1.085441, 3.438676, 0, 0, 1, 1, 1,
0.8123766, -1.849383, 2.578047, 1, 0, 0, 1, 1,
0.8144548, -1.426896, 2.330548, 1, 0, 0, 1, 1,
0.8156512, -0.2105864, 3.768368, 1, 0, 0, 1, 1,
0.8211066, 0.2238313, 1.888786, 1, 0, 0, 1, 1,
0.8235416, 0.3800097, 0.2700526, 1, 0, 0, 1, 1,
0.8280394, -0.3389915, 0.3797851, 0, 0, 0, 1, 1,
0.8294775, -0.3266885, 3.271177, 0, 0, 0, 1, 1,
0.8310813, 0.4953136, 0.5681561, 0, 0, 0, 1, 1,
0.8482155, -1.260999, 2.117331, 0, 0, 0, 1, 1,
0.8526159, 1.873161, 2.401377, 0, 0, 0, 1, 1,
0.8570734, -1.827246, 3.12419, 0, 0, 0, 1, 1,
0.8612497, 1.820832, -0.2562707, 0, 0, 0, 1, 1,
0.866527, 0.8783925, 0.6833646, 1, 1, 1, 1, 1,
0.8706083, 0.2116957, 1.463935, 1, 1, 1, 1, 1,
0.8716244, -0.2894614, 1.175487, 1, 1, 1, 1, 1,
0.8765953, 0.2945706, 2.611676, 1, 1, 1, 1, 1,
0.8807307, 0.2187107, 1.050212, 1, 1, 1, 1, 1,
0.8831702, 0.3174553, 2.305104, 1, 1, 1, 1, 1,
0.8871365, -0.4795004, 2.103578, 1, 1, 1, 1, 1,
0.8880107, 1.225775, -0.07029557, 1, 1, 1, 1, 1,
0.8918244, 0.6957469, 0.1223629, 1, 1, 1, 1, 1,
0.8961549, 1.086555, 1.364485, 1, 1, 1, 1, 1,
0.9017665, 0.9620343, 1.009788, 1, 1, 1, 1, 1,
0.9029085, -0.1564009, 2.302331, 1, 1, 1, 1, 1,
0.9071097, 1.791153, 0.4425139, 1, 1, 1, 1, 1,
0.9085753, -1.797439, 3.116286, 1, 1, 1, 1, 1,
0.9132445, 0.6951311, 0.8449954, 1, 1, 1, 1, 1,
0.9141623, -1.643881, 2.788359, 0, 0, 1, 1, 1,
0.915673, 0.77692, 1.720127, 1, 0, 0, 1, 1,
0.9219584, 0.4314526, 0.04627978, 1, 0, 0, 1, 1,
0.9236124, 0.8326973, 0.8484069, 1, 0, 0, 1, 1,
0.928329, -0.03445942, 2.631231, 1, 0, 0, 1, 1,
0.9330746, 0.9765438, 0.5198041, 1, 0, 0, 1, 1,
0.9352175, 0.8456952, 1.10339, 0, 0, 0, 1, 1,
0.9486046, 1.229547, -0.147663, 0, 0, 0, 1, 1,
0.9525998, -0.2014897, 0.6474829, 0, 0, 0, 1, 1,
0.9543115, 0.1704719, 1.45048, 0, 0, 0, 1, 1,
0.9543188, -0.1014254, 1.804146, 0, 0, 0, 1, 1,
0.9544148, -1.026611, 3.240743, 0, 0, 0, 1, 1,
0.9561348, -1.827492, 2.307745, 0, 0, 0, 1, 1,
0.9622098, 0.8892422, 1.037309, 1, 1, 1, 1, 1,
0.9622848, -0.2058993, 2.106936, 1, 1, 1, 1, 1,
0.9663865, 0.1056355, 1.732979, 1, 1, 1, 1, 1,
0.9667724, -1.262893, 0.7891573, 1, 1, 1, 1, 1,
0.9769878, -0.3270626, 1.227308, 1, 1, 1, 1, 1,
0.9863681, 1.791417, 0.5649778, 1, 1, 1, 1, 1,
0.9890684, 0.311823, 1.419183, 1, 1, 1, 1, 1,
0.9922706, 0.1856861, -1.064634, 1, 1, 1, 1, 1,
0.9959736, 0.7496217, -0.05429276, 1, 1, 1, 1, 1,
1.001603, 2.073673, 1.478016, 1, 1, 1, 1, 1,
1.003282, 0.236433, 0.8467534, 1, 1, 1, 1, 1,
1.00469, 1.457192, 0.9614391, 1, 1, 1, 1, 1,
1.009979, -1.988005, 0.7287474, 1, 1, 1, 1, 1,
1.019565, -0.7142823, 1.795952, 1, 1, 1, 1, 1,
1.020965, 1.837498, 2.46925, 1, 1, 1, 1, 1,
1.027341, 1.04634, -0.4840585, 0, 0, 1, 1, 1,
1.027797, 0.5141674, 1.599784, 1, 0, 0, 1, 1,
1.034808, 1.02596, -1.096368, 1, 0, 0, 1, 1,
1.039093, 0.3935971, 1.633415, 1, 0, 0, 1, 1,
1.042542, -1.080283, 2.193295, 1, 0, 0, 1, 1,
1.044121, 0.8606885, 0.9322855, 1, 0, 0, 1, 1,
1.045119, -0.06985762, 0.5972552, 0, 0, 0, 1, 1,
1.046181, 0.2490183, 1.577704, 0, 0, 0, 1, 1,
1.047326, -0.820715, 2.402481, 0, 0, 0, 1, 1,
1.048308, 1.849082, 0.4133299, 0, 0, 0, 1, 1,
1.056238, -1.178077, 1.486533, 0, 0, 0, 1, 1,
1.056797, -0.4836738, 1.331918, 0, 0, 0, 1, 1,
1.064999, -1.634727, 1.506999, 0, 0, 0, 1, 1,
1.0676, 1.498737, 1.276061, 1, 1, 1, 1, 1,
1.067688, -1.095881, 2.200652, 1, 1, 1, 1, 1,
1.073198, 0.8404724, 0.9121063, 1, 1, 1, 1, 1,
1.073997, -1.509545, 1.958412, 1, 1, 1, 1, 1,
1.074073, 0.7060994, 1.130373, 1, 1, 1, 1, 1,
1.086598, -1.798257, 3.011382, 1, 1, 1, 1, 1,
1.095612, 1.361421, 0.09895314, 1, 1, 1, 1, 1,
1.098977, 0.1300445, 1.333551, 1, 1, 1, 1, 1,
1.107808, -0.4189107, 2.249419, 1, 1, 1, 1, 1,
1.12301, 2.260533, 0.3427272, 1, 1, 1, 1, 1,
1.124364, 0.6579806, 2.192433, 1, 1, 1, 1, 1,
1.127432, 0.4629859, 1.945823, 1, 1, 1, 1, 1,
1.132767, -0.5505211, 2.350696, 1, 1, 1, 1, 1,
1.136608, -2.220082, 1.663329, 1, 1, 1, 1, 1,
1.136665, -0.8939043, 1.922428, 1, 1, 1, 1, 1,
1.138602, -1.001392, 2.078477, 0, 0, 1, 1, 1,
1.143699, 0.1896888, -0.09170521, 1, 0, 0, 1, 1,
1.150025, -1.810694, 3.773591, 1, 0, 0, 1, 1,
1.156787, -1.176478, 2.868311, 1, 0, 0, 1, 1,
1.158507, 1.751205, -0.6988365, 1, 0, 0, 1, 1,
1.158621, 0.05054789, 2.199497, 1, 0, 0, 1, 1,
1.158831, -0.2487589, 3.062549, 0, 0, 0, 1, 1,
1.163025, -0.7102964, -0.06221049, 0, 0, 0, 1, 1,
1.16472, -0.8585725, 2.56988, 0, 0, 0, 1, 1,
1.165965, -0.3993373, 1.384319, 0, 0, 0, 1, 1,
1.171086, -0.169216, 1.67437, 0, 0, 0, 1, 1,
1.176779, 1.131349, 2.307828, 0, 0, 0, 1, 1,
1.188096, -1.145326, 1.931929, 0, 0, 0, 1, 1,
1.188494, 0.3234367, 0.916769, 1, 1, 1, 1, 1,
1.19303, 0.956301, 0.1000742, 1, 1, 1, 1, 1,
1.199224, 0.6058709, 1.935001, 1, 1, 1, 1, 1,
1.205605, -0.09507462, 2.03874, 1, 1, 1, 1, 1,
1.208181, -0.737411, 0.9676809, 1, 1, 1, 1, 1,
1.208625, -0.9283283, 2.400479, 1, 1, 1, 1, 1,
1.209472, -0.2530754, 0.9396027, 1, 1, 1, 1, 1,
1.211542, 1.044789, 0.9515826, 1, 1, 1, 1, 1,
1.217034, -2.75809, 3.520628, 1, 1, 1, 1, 1,
1.237154, -1.137152, 2.438218, 1, 1, 1, 1, 1,
1.239282, -0.9035307, 2.161068, 1, 1, 1, 1, 1,
1.249706, 0.439123, 1.07075, 1, 1, 1, 1, 1,
1.249712, -1.034394, 1.787726, 1, 1, 1, 1, 1,
1.255894, -0.325859, 1.372714, 1, 1, 1, 1, 1,
1.258035, -0.2937466, 2.744169, 1, 1, 1, 1, 1,
1.259196, 1.805898, 0.4640299, 0, 0, 1, 1, 1,
1.260244, 0.4931199, 1.915153, 1, 0, 0, 1, 1,
1.269684, -0.5822183, 3.625366, 1, 0, 0, 1, 1,
1.270685, 0.9819998, 0.7823745, 1, 0, 0, 1, 1,
1.274861, 0.7290885, 0.624445, 1, 0, 0, 1, 1,
1.276086, -0.1242038, 0.5818566, 1, 0, 0, 1, 1,
1.294913, 1.16497, 0.8686756, 0, 0, 0, 1, 1,
1.30383, -0.6780312, 2.595467, 0, 0, 0, 1, 1,
1.309242, 1.844879, -0.4041457, 0, 0, 0, 1, 1,
1.309617, -0.482677, 2.071332, 0, 0, 0, 1, 1,
1.310568, -0.5931, 2.20057, 0, 0, 0, 1, 1,
1.314586, -1.192246, 3.196664, 0, 0, 0, 1, 1,
1.320492, 1.067057, 2.241508, 0, 0, 0, 1, 1,
1.322444, -0.7510229, 2.084684, 1, 1, 1, 1, 1,
1.324139, 0.6814672, 0.3072346, 1, 1, 1, 1, 1,
1.32543, 0.4409716, 0.7659102, 1, 1, 1, 1, 1,
1.34659, 0.657819, 1.866324, 1, 1, 1, 1, 1,
1.359187, -0.4454061, 1.654249, 1, 1, 1, 1, 1,
1.369739, 1.524099, 0.1848715, 1, 1, 1, 1, 1,
1.379505, -1.84833, 2.025761, 1, 1, 1, 1, 1,
1.380866, -0.2119031, 2.898433, 1, 1, 1, 1, 1,
1.406647, 0.4381303, 0.4287368, 1, 1, 1, 1, 1,
1.420233, -0.3153609, 0.1213732, 1, 1, 1, 1, 1,
1.420704, 0.7756087, -1.203526, 1, 1, 1, 1, 1,
1.432922, -1.280981, 3.386421, 1, 1, 1, 1, 1,
1.433978, 1.662236, 1.487442, 1, 1, 1, 1, 1,
1.435296, -0.433023, 1.908938, 1, 1, 1, 1, 1,
1.447997, -0.06385767, 2.992328, 1, 1, 1, 1, 1,
1.453484, -1.996547, 2.446646, 0, 0, 1, 1, 1,
1.456464, -1.054885, 2.228914, 1, 0, 0, 1, 1,
1.462771, 0.3418487, 0.9543594, 1, 0, 0, 1, 1,
1.474525, 0.5239643, 0.833204, 1, 0, 0, 1, 1,
1.475522, 0.7133505, -0.1401012, 1, 0, 0, 1, 1,
1.511232, 0.006476443, 2.242715, 1, 0, 0, 1, 1,
1.511379, 0.3369724, 2.815916, 0, 0, 0, 1, 1,
1.516814, -0.6978872, 2.351586, 0, 0, 0, 1, 1,
1.520783, -1.571671, 2.047409, 0, 0, 0, 1, 1,
1.523134, -1.277149, 2.43106, 0, 0, 0, 1, 1,
1.539282, 0.4007795, 1.762787, 0, 0, 0, 1, 1,
1.545026, 0.111811, 2.547248, 0, 0, 0, 1, 1,
1.569942, 0.5534011, 0.7482582, 0, 0, 0, 1, 1,
1.57514, -1.616186, 0.5535799, 1, 1, 1, 1, 1,
1.589957, -0.9058511, 0.5421022, 1, 1, 1, 1, 1,
1.594893, 0.48163, 0.6308228, 1, 1, 1, 1, 1,
1.618035, 1.240011, 1.031771, 1, 1, 1, 1, 1,
1.641853, 2.143147, 0.3132778, 1, 1, 1, 1, 1,
1.660008, 0.707297, 0.4134112, 1, 1, 1, 1, 1,
1.6645, -0.5042323, -0.1073334, 1, 1, 1, 1, 1,
1.672745, 0.4284382, -0.4423681, 1, 1, 1, 1, 1,
1.674047, -0.6453491, 1.286045, 1, 1, 1, 1, 1,
1.675084, 0.002861486, -1.038201, 1, 1, 1, 1, 1,
1.682847, -0.6203247, 3.784306, 1, 1, 1, 1, 1,
1.688439, 1.079436, 1.633442, 1, 1, 1, 1, 1,
1.688563, 0.3385823, 1.154795, 1, 1, 1, 1, 1,
1.690571, -1.507462, 3.093744, 1, 1, 1, 1, 1,
1.693561, -0.9032961, 3.290231, 1, 1, 1, 1, 1,
1.700654, 0.7084457, 1.867378, 0, 0, 1, 1, 1,
1.712863, -1.096932, 2.926853, 1, 0, 0, 1, 1,
1.717167, -1.334689, 2.144759, 1, 0, 0, 1, 1,
1.724276, -0.5789241, 1.542354, 1, 0, 0, 1, 1,
1.727052, -0.2871134, 1.78311, 1, 0, 0, 1, 1,
1.729637, 0.4507651, 2.652403, 1, 0, 0, 1, 1,
1.736915, -0.8621535, 1.715214, 0, 0, 0, 1, 1,
1.742753, 1.421416, -0.09007481, 0, 0, 0, 1, 1,
1.749641, -1.880772, 2.806455, 0, 0, 0, 1, 1,
1.755294, -0.03715723, 1.805995, 0, 0, 0, 1, 1,
1.763768, -0.9634905, 2.467854, 0, 0, 0, 1, 1,
1.779397, -0.1353262, 0.5887033, 0, 0, 0, 1, 1,
1.802726, 0.06833671, 1.698774, 0, 0, 0, 1, 1,
1.805911, -0.3042379, 1.737947, 1, 1, 1, 1, 1,
1.825699, 1.368635, 0.6711036, 1, 1, 1, 1, 1,
1.825907, -1.195344, 3.51388, 1, 1, 1, 1, 1,
1.844909, -0.5816144, 1.807585, 1, 1, 1, 1, 1,
1.877166, -1.104837, 2.225974, 1, 1, 1, 1, 1,
1.88779, 0.8260542, 1.45835, 1, 1, 1, 1, 1,
1.892642, -0.3373484, 1.200682, 1, 1, 1, 1, 1,
1.912833, 0.6741404, 1.985893, 1, 1, 1, 1, 1,
1.916145, -0.3130009, 0.5928434, 1, 1, 1, 1, 1,
1.967727, -0.8634542, 1.158842, 1, 1, 1, 1, 1,
1.978396, 0.9664724, 3.172626, 1, 1, 1, 1, 1,
1.981601, 1.212278, 0.7703157, 1, 1, 1, 1, 1,
2.050834, 0.02657892, 1.226698, 1, 1, 1, 1, 1,
2.0681, 1.286497, 1.642461, 1, 1, 1, 1, 1,
2.070108, -2.046704, 2.451588, 1, 1, 1, 1, 1,
2.082105, -2.042304, 1.887529, 0, 0, 1, 1, 1,
2.098019, 0.9779584, -0.1539494, 1, 0, 0, 1, 1,
2.09956, 0.302269, 0.7890346, 1, 0, 0, 1, 1,
2.101371, -0.9143764, 3.004812, 1, 0, 0, 1, 1,
2.105553, 0.5178861, 2.104495, 1, 0, 0, 1, 1,
2.119511, -0.005642166, 0.843666, 1, 0, 0, 1, 1,
2.141591, -0.4079464, 2.396868, 0, 0, 0, 1, 1,
2.189055, -0.2927978, 1.13796, 0, 0, 0, 1, 1,
2.252487, 0.3306038, 0.9846398, 0, 0, 0, 1, 1,
2.316215, 0.2871914, 3.190523, 0, 0, 0, 1, 1,
2.336947, 0.447876, 0.7912142, 0, 0, 0, 1, 1,
2.338119, -1.060139, 3.024254, 0, 0, 0, 1, 1,
2.35134, 0.09662059, 3.37082, 0, 0, 0, 1, 1,
2.364582, -1.553373, 1.173105, 1, 1, 1, 1, 1,
2.374209, -0.7460971, 1.268723, 1, 1, 1, 1, 1,
2.378563, 1.055006, 1.723709, 1, 1, 1, 1, 1,
2.475263, -1.563467, 2.428543, 1, 1, 1, 1, 1,
2.776716, 1.153627, -0.7912238, 1, 1, 1, 1, 1,
2.786823, -0.885232, 1.101539, 1, 1, 1, 1, 1,
2.798628, -0.5182394, 1.611408, 1, 1, 1, 1, 1
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
var radius = 9.199115;
var distance = 32.3115;
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
mvMatrix.translate( 0.03269589, 0.2452493, 0.2064137 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.3115);
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
