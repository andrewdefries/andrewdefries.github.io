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
-3.459306, 0.3142314, 0.02477784, 1, 0, 0, 1,
-3.156287, -0.6764885, -2.549136, 1, 0.007843138, 0, 1,
-3.004313, -0.9515092, -1.553529, 1, 0.01176471, 0, 1,
-2.762086, -0.1878861, -2.631024, 1, 0.01960784, 0, 1,
-2.757465, -0.209235, -1.873754, 1, 0.02352941, 0, 1,
-2.667268, 0.2402919, -1.219926, 1, 0.03137255, 0, 1,
-2.653041, -1.131842, -1.718714, 1, 0.03529412, 0, 1,
-2.511105, 1.011488, -0.5441476, 1, 0.04313726, 0, 1,
-2.446006, -0.01834193, -0.9809986, 1, 0.04705882, 0, 1,
-2.431489, 0.3744189, -1.468216, 1, 0.05490196, 0, 1,
-2.425812, 1.219129, 0.04401454, 1, 0.05882353, 0, 1,
-2.393334, -0.8412064, -1.6389, 1, 0.06666667, 0, 1,
-2.307233, -0.8638753, -1.919412, 1, 0.07058824, 0, 1,
-2.281869, -2.239211, -1.921033, 1, 0.07843138, 0, 1,
-2.209196, 0.5898309, -0.9857373, 1, 0.08235294, 0, 1,
-2.205926, -0.2504309, 0.4062925, 1, 0.09019608, 0, 1,
-2.095617, -0.6249039, -2.344247, 1, 0.09411765, 0, 1,
-2.095038, 0.684945, -0.5354267, 1, 0.1019608, 0, 1,
-2.090985, -0.00863381, -3.850534, 1, 0.1098039, 0, 1,
-2.082863, 0.7357176, -1.217287, 1, 0.1137255, 0, 1,
-2.080525, -1.043327, -1.802706, 1, 0.1215686, 0, 1,
-2.066407, -0.0007265464, -2.235647, 1, 0.1254902, 0, 1,
-2.061055, 1.020013, -2.426554, 1, 0.1333333, 0, 1,
-2.0607, -0.9600605, -2.781808, 1, 0.1372549, 0, 1,
-2.046708, -0.8802896, -2.731226, 1, 0.145098, 0, 1,
-2.042891, -1.015254, -1.239277, 1, 0.1490196, 0, 1,
-2.005928, 0.200299, -0.9568443, 1, 0.1568628, 0, 1,
-2.000782, -0.6238092, -1.387797, 1, 0.1607843, 0, 1,
-1.900416, -0.1153473, -1.028644, 1, 0.1686275, 0, 1,
-1.893828, -0.9068033, -1.968086, 1, 0.172549, 0, 1,
-1.844368, -0.3082686, -3.450485, 1, 0.1803922, 0, 1,
-1.832457, -2.23232, -4.559849, 1, 0.1843137, 0, 1,
-1.803822, 0.04132714, -1.862579, 1, 0.1921569, 0, 1,
-1.792231, 1.225152, -1.863333, 1, 0.1960784, 0, 1,
-1.781238, 1.453487, -0.2468769, 1, 0.2039216, 0, 1,
-1.776308, -0.5808094, -2.349854, 1, 0.2117647, 0, 1,
-1.775653, -0.6338204, -1.045141, 1, 0.2156863, 0, 1,
-1.768076, -0.4281213, -3.703694, 1, 0.2235294, 0, 1,
-1.764461, -0.06366424, -1.90453, 1, 0.227451, 0, 1,
-1.753984, -0.8000951, -1.556642, 1, 0.2352941, 0, 1,
-1.744988, -0.9630732, -1.727106, 1, 0.2392157, 0, 1,
-1.722369, 0.2216403, -1.428429, 1, 0.2470588, 0, 1,
-1.719763, 0.7829279, -1.858582, 1, 0.2509804, 0, 1,
-1.710636, 0.3948743, -1.19757, 1, 0.2588235, 0, 1,
-1.70815, -0.9394441, -1.815904, 1, 0.2627451, 0, 1,
-1.693393, -0.2618541, -2.407862, 1, 0.2705882, 0, 1,
-1.683618, 1.791251, -0.4029143, 1, 0.2745098, 0, 1,
-1.681521, 1.208483, -0.5634542, 1, 0.282353, 0, 1,
-1.673622, 1.085678, -0.6875303, 1, 0.2862745, 0, 1,
-1.669615, -2.129525, -1.88406, 1, 0.2941177, 0, 1,
-1.667812, 0.1081091, -1.561459, 1, 0.3019608, 0, 1,
-1.662961, 0.03802017, -0.007813522, 1, 0.3058824, 0, 1,
-1.656118, -1.160068, -3.401706, 1, 0.3137255, 0, 1,
-1.653926, -0.6840627, -1.724436, 1, 0.3176471, 0, 1,
-1.647295, -0.955443, -3.564781, 1, 0.3254902, 0, 1,
-1.619603, -0.6266685, -3.100695, 1, 0.3294118, 0, 1,
-1.603342, -0.3065895, -2.639586, 1, 0.3372549, 0, 1,
-1.581353, -0.01927936, -1.118869, 1, 0.3411765, 0, 1,
-1.564424, 0.09530039, -1.778722, 1, 0.3490196, 0, 1,
-1.561562, -0.2859873, -1.984167, 1, 0.3529412, 0, 1,
-1.553529, -1.557368, -2.547115, 1, 0.3607843, 0, 1,
-1.546169, 0.5546763, 0.761344, 1, 0.3647059, 0, 1,
-1.543236, -0.9296525, -2.916348, 1, 0.372549, 0, 1,
-1.532434, -0.9574149, -2.96055, 1, 0.3764706, 0, 1,
-1.531029, 1.164337, -0.1643769, 1, 0.3843137, 0, 1,
-1.520865, -1.148046, -1.638708, 1, 0.3882353, 0, 1,
-1.514995, 1.303235, -0.4493664, 1, 0.3960784, 0, 1,
-1.512825, 0.2532113, -2.08008, 1, 0.4039216, 0, 1,
-1.504579, -0.9497933, -0.9184288, 1, 0.4078431, 0, 1,
-1.478222, 0.622238, 1.033085, 1, 0.4156863, 0, 1,
-1.475141, -0.1259134, -1.911864, 1, 0.4196078, 0, 1,
-1.470894, 0.4686491, -2.701524, 1, 0.427451, 0, 1,
-1.462149, 1.052786, 0.8782284, 1, 0.4313726, 0, 1,
-1.455547, -0.9448034, -1.641511, 1, 0.4392157, 0, 1,
-1.454314, -0.2073433, -0.190208, 1, 0.4431373, 0, 1,
-1.445971, 0.6839349, 0.1322927, 1, 0.4509804, 0, 1,
-1.444313, -0.899166, -0.7358389, 1, 0.454902, 0, 1,
-1.439882, 1.331, 0.0176841, 1, 0.4627451, 0, 1,
-1.437844, 0.04105257, -0.8287138, 1, 0.4666667, 0, 1,
-1.435029, 0.4485847, 0.4213335, 1, 0.4745098, 0, 1,
-1.431189, 0.4863767, 0.3780524, 1, 0.4784314, 0, 1,
-1.429602, 2.192037, -0.4032122, 1, 0.4862745, 0, 1,
-1.424854, 0.4153478, -1.244456, 1, 0.4901961, 0, 1,
-1.419007, 0.03850455, -1.158767, 1, 0.4980392, 0, 1,
-1.418695, -0.5952373, -1.627825, 1, 0.5058824, 0, 1,
-1.417663, -0.4335904, -3.417113, 1, 0.509804, 0, 1,
-1.415479, 0.8918703, -1.891965, 1, 0.5176471, 0, 1,
-1.406076, 0.2927227, -2.36078, 1, 0.5215687, 0, 1,
-1.400416, 0.4253922, -0.8411386, 1, 0.5294118, 0, 1,
-1.395907, -1.408768, -2.833047, 1, 0.5333334, 0, 1,
-1.391031, -0.6124696, -2.847754, 1, 0.5411765, 0, 1,
-1.38728, 0.1813775, -1.057418, 1, 0.5450981, 0, 1,
-1.372744, -0.386606, -1.973703, 1, 0.5529412, 0, 1,
-1.37239, -0.390093, -1.127176, 1, 0.5568628, 0, 1,
-1.366978, 0.9315031, -0.4615346, 1, 0.5647059, 0, 1,
-1.363471, -0.2720166, -1.488779, 1, 0.5686275, 0, 1,
-1.361577, -0.2541455, -2.885572, 1, 0.5764706, 0, 1,
-1.359557, 0.4383609, -0.3221155, 1, 0.5803922, 0, 1,
-1.33282, -0.8424972, -1.949532, 1, 0.5882353, 0, 1,
-1.326828, 0.4101581, -2.948284, 1, 0.5921569, 0, 1,
-1.31873, 0.1556844, -1.884638, 1, 0.6, 0, 1,
-1.31539, -0.1970236, -1.542426, 1, 0.6078432, 0, 1,
-1.288312, 0.5126055, -2.01531, 1, 0.6117647, 0, 1,
-1.284042, -0.183937, -4.528933, 1, 0.6196079, 0, 1,
-1.268979, -0.8793797, -4.530632, 1, 0.6235294, 0, 1,
-1.256637, 0.1293129, -0.3483654, 1, 0.6313726, 0, 1,
-1.253546, 0.967675, -0.718224, 1, 0.6352941, 0, 1,
-1.249263, 2.099808, 0.6287449, 1, 0.6431373, 0, 1,
-1.245563, -0.8978745, -2.899294, 1, 0.6470588, 0, 1,
-1.229832, -0.7097731, -1.74551, 1, 0.654902, 0, 1,
-1.223815, -0.6148021, -2.620549, 1, 0.6588235, 0, 1,
-1.220905, -0.5365689, -3.501871, 1, 0.6666667, 0, 1,
-1.220352, 0.3984101, -1.939522, 1, 0.6705883, 0, 1,
-1.204672, -0.3537581, -1.792218, 1, 0.6784314, 0, 1,
-1.202503, -0.6341867, -1.637694, 1, 0.682353, 0, 1,
-1.196862, 0.1369463, -1.44838, 1, 0.6901961, 0, 1,
-1.192726, -1.674098, -2.761493, 1, 0.6941177, 0, 1,
-1.19207, 0.09744856, -2.041849, 1, 0.7019608, 0, 1,
-1.190886, -0.3315968, -1.196923, 1, 0.7098039, 0, 1,
-1.186444, 1.330078, -0.7211513, 1, 0.7137255, 0, 1,
-1.184618, -0.1223561, -2.827896, 1, 0.7215686, 0, 1,
-1.183622, 0.7514886, -1.379888, 1, 0.7254902, 0, 1,
-1.182362, 0.5326437, -3.167699, 1, 0.7333333, 0, 1,
-1.179014, 0.9481557, -0.3212055, 1, 0.7372549, 0, 1,
-1.174985, -0.6288363, -2.342129, 1, 0.7450981, 0, 1,
-1.173185, 0.3020864, -1.64071, 1, 0.7490196, 0, 1,
-1.17172, 0.5007814, -3.004136, 1, 0.7568628, 0, 1,
-1.171672, -0.4207945, -2.946114, 1, 0.7607843, 0, 1,
-1.165264, -0.4278594, -0.4917407, 1, 0.7686275, 0, 1,
-1.161228, 0.305385, -1.468777, 1, 0.772549, 0, 1,
-1.153561, -1.408145, -1.630575, 1, 0.7803922, 0, 1,
-1.14819, 0.2395059, 0.2078968, 1, 0.7843137, 0, 1,
-1.136702, -0.2775435, -2.2654, 1, 0.7921569, 0, 1,
-1.13471, -1.202197, -2.900638, 1, 0.7960784, 0, 1,
-1.129873, -0.4292574, 0.6668372, 1, 0.8039216, 0, 1,
-1.129125, 1.103299, -1.106179, 1, 0.8117647, 0, 1,
-1.118924, -2.327768, -2.135902, 1, 0.8156863, 0, 1,
-1.116713, -0.1428713, -2.263118, 1, 0.8235294, 0, 1,
-1.108985, 0.7636376, -0.6246251, 1, 0.827451, 0, 1,
-1.108813, -1.215583, -1.810182, 1, 0.8352941, 0, 1,
-1.108072, -0.3609624, -2.316082, 1, 0.8392157, 0, 1,
-1.104444, 0.7389804, 2.181351, 1, 0.8470588, 0, 1,
-1.102603, 1.244303, -0.6411641, 1, 0.8509804, 0, 1,
-1.095032, -0.1142782, -1.871882, 1, 0.8588235, 0, 1,
-1.092221, -1.38457, -1.161243, 1, 0.8627451, 0, 1,
-1.091793, 0.8338292, -1.007824, 1, 0.8705882, 0, 1,
-1.077578, 0.3708819, -2.260132, 1, 0.8745098, 0, 1,
-1.076085, -2.018826, -2.341441, 1, 0.8823529, 0, 1,
-1.071814, 0.01588592, -1.702691, 1, 0.8862745, 0, 1,
-1.056158, -0.8074459, -1.059633, 1, 0.8941177, 0, 1,
-1.045178, 0.61988, -0.7478435, 1, 0.8980392, 0, 1,
-1.043394, -0.6773309, -2.662399, 1, 0.9058824, 0, 1,
-1.039859, 0.9513561, -0.2455039, 1, 0.9137255, 0, 1,
-1.026171, -2.015972, -1.420779, 1, 0.9176471, 0, 1,
-1.022912, 0.0480939, -1.022227, 1, 0.9254902, 0, 1,
-1.013331, 0.9896165, -0.2474219, 1, 0.9294118, 0, 1,
-1.009784, 0.1563109, 0.7645885, 1, 0.9372549, 0, 1,
-1.00241, -1.554738, -2.798017, 1, 0.9411765, 0, 1,
-0.9979565, 1.468599, 0.5395291, 1, 0.9490196, 0, 1,
-0.9959672, 1.052976, -0.0926857, 1, 0.9529412, 0, 1,
-0.9931786, -0.9717755, -1.766541, 1, 0.9607843, 0, 1,
-0.9867444, -0.3027961, -1.537587, 1, 0.9647059, 0, 1,
-0.9840013, -1.197225, -3.802493, 1, 0.972549, 0, 1,
-0.9786887, 0.5303848, -3.665162, 1, 0.9764706, 0, 1,
-0.9739941, 0.6589411, -0.5263332, 1, 0.9843137, 0, 1,
-0.9730522, -0.02154637, -2.604849, 1, 0.9882353, 0, 1,
-0.9720594, 1.802744, -0.5061988, 1, 0.9960784, 0, 1,
-0.9695339, -1.236369, -2.409108, 0.9960784, 1, 0, 1,
-0.9668829, 0.2509502, 0.07611445, 0.9921569, 1, 0, 1,
-0.9605519, -0.4683305, -1.962272, 0.9843137, 1, 0, 1,
-0.9600084, -0.3822841, -3.202372, 0.9803922, 1, 0, 1,
-0.9558503, -1.372978, -2.141505, 0.972549, 1, 0, 1,
-0.9544626, -0.1536333, -0.6323864, 0.9686275, 1, 0, 1,
-0.9512157, 1.68452, -0.6544628, 0.9607843, 1, 0, 1,
-0.9507443, 0.4934917, -1.607206, 0.9568627, 1, 0, 1,
-0.9503545, -1.252865, -2.577292, 0.9490196, 1, 0, 1,
-0.9475451, -0.1397135, -3.146031, 0.945098, 1, 0, 1,
-0.9425011, 2.450084, 0.3354251, 0.9372549, 1, 0, 1,
-0.939266, 1.845159, 0.2190174, 0.9333333, 1, 0, 1,
-0.9391554, 0.5292044, -0.01661233, 0.9254902, 1, 0, 1,
-0.9379009, 0.7561878, -1.043908, 0.9215686, 1, 0, 1,
-0.9342965, -0.8982969, -2.906152, 0.9137255, 1, 0, 1,
-0.9297372, 1.869827, -0.2511377, 0.9098039, 1, 0, 1,
-0.928736, -1.007123, -3.643394, 0.9019608, 1, 0, 1,
-0.926722, -0.5644366, -3.880724, 0.8941177, 1, 0, 1,
-0.926031, 0.5294045, 0.01046545, 0.8901961, 1, 0, 1,
-0.922924, 0.9713997, -1.890574, 0.8823529, 1, 0, 1,
-0.9222618, -0.345927, -1.246125, 0.8784314, 1, 0, 1,
-0.9158191, -1.834092, -2.146451, 0.8705882, 1, 0, 1,
-0.9126723, -0.04529352, -1.109662, 0.8666667, 1, 0, 1,
-0.9108377, -0.09223974, 0.1616117, 0.8588235, 1, 0, 1,
-0.9073364, 1.111205, -1.369154, 0.854902, 1, 0, 1,
-0.9056469, 0.1251029, -3.703873, 0.8470588, 1, 0, 1,
-0.9045973, 0.1432779, -2.363712, 0.8431373, 1, 0, 1,
-0.9041932, -1.092746, -2.261071, 0.8352941, 1, 0, 1,
-0.9029937, 1.153879, -1.679177, 0.8313726, 1, 0, 1,
-0.9007124, 0.2691385, -3.961942, 0.8235294, 1, 0, 1,
-0.8985671, 1.812315, -0.1030507, 0.8196079, 1, 0, 1,
-0.8954304, 1.050898, -1.823818, 0.8117647, 1, 0, 1,
-0.8945329, -0.4811611, -1.77795, 0.8078431, 1, 0, 1,
-0.8919821, 0.6412104, -1.320155, 0.8, 1, 0, 1,
-0.8886685, 0.3206377, -1.76118, 0.7921569, 1, 0, 1,
-0.8883018, -0.5742912, -1.101352, 0.7882353, 1, 0, 1,
-0.8816323, -0.0463789, -2.559963, 0.7803922, 1, 0, 1,
-0.8798606, 0.9876381, 0.1658222, 0.7764706, 1, 0, 1,
-0.8790974, 0.9138976, 0.9719692, 0.7686275, 1, 0, 1,
-0.8736609, -0.5617295, -2.148437, 0.7647059, 1, 0, 1,
-0.8682873, -0.7472706, -1.463234, 0.7568628, 1, 0, 1,
-0.8653462, -1.701928, -3.296949, 0.7529412, 1, 0, 1,
-0.8624386, 0.7393429, 0.9504607, 0.7450981, 1, 0, 1,
-0.8597643, -1.232649, -1.849671, 0.7411765, 1, 0, 1,
-0.8554258, 0.002797344, -3.176098, 0.7333333, 1, 0, 1,
-0.854488, 0.4672965, -0.5977938, 0.7294118, 1, 0, 1,
-0.8519252, -0.1612767, -0.9518586, 0.7215686, 1, 0, 1,
-0.8475329, 0.4274849, -1.303398, 0.7176471, 1, 0, 1,
-0.8466812, 1.312092, -1.50878, 0.7098039, 1, 0, 1,
-0.8440442, 0.6681442, 2.107484, 0.7058824, 1, 0, 1,
-0.839608, 3.393815, -1.093906, 0.6980392, 1, 0, 1,
-0.8376631, -0.7069196, -1.516991, 0.6901961, 1, 0, 1,
-0.8321925, 0.2662733, -2.212257, 0.6862745, 1, 0, 1,
-0.8315405, 0.3517877, -0.9301765, 0.6784314, 1, 0, 1,
-0.8312135, 0.9176793, -1.008083, 0.6745098, 1, 0, 1,
-0.8297208, 1.007806, 0.3918463, 0.6666667, 1, 0, 1,
-0.8269508, 1.231957, 0.4261396, 0.6627451, 1, 0, 1,
-0.8266186, 1.012374, -0.2739792, 0.654902, 1, 0, 1,
-0.8241801, -0.4050338, -1.779714, 0.6509804, 1, 0, 1,
-0.8116471, -0.6376722, -3.682348, 0.6431373, 1, 0, 1,
-0.8102996, -1.794137, -1.388323, 0.6392157, 1, 0, 1,
-0.8102733, 1.117657, -1.6666, 0.6313726, 1, 0, 1,
-0.8030927, -1.404387, -2.217775, 0.627451, 1, 0, 1,
-0.8011578, 1.680746, -0.8785536, 0.6196079, 1, 0, 1,
-0.8002051, -1.743079, -3.529083, 0.6156863, 1, 0, 1,
-0.7926375, 0.9692224, -1.656809, 0.6078432, 1, 0, 1,
-0.7919186, 0.6040098, -3.029178, 0.6039216, 1, 0, 1,
-0.7898413, 0.8705661, 0.346115, 0.5960785, 1, 0, 1,
-0.7874808, -0.3386097, -1.989473, 0.5882353, 1, 0, 1,
-0.7733063, -0.719686, -3.77388, 0.5843138, 1, 0, 1,
-0.7655441, -0.8092679, -2.032146, 0.5764706, 1, 0, 1,
-0.7637514, 0.1582168, -0.5178381, 0.572549, 1, 0, 1,
-0.7606712, -1.303557, -2.979237, 0.5647059, 1, 0, 1,
-0.760071, -0.3690323, -2.401737, 0.5607843, 1, 0, 1,
-0.7597647, -0.4914897, -3.750494, 0.5529412, 1, 0, 1,
-0.7568168, -0.2937361, -2.83363, 0.5490196, 1, 0, 1,
-0.7406768, 1.078927, -1.907255, 0.5411765, 1, 0, 1,
-0.7311672, 0.5068305, -0.6150362, 0.5372549, 1, 0, 1,
-0.721078, -0.3864512, -0.9286535, 0.5294118, 1, 0, 1,
-0.7182037, 1.613569, 0.2637767, 0.5254902, 1, 0, 1,
-0.7135087, 1.180254, -1.034425, 0.5176471, 1, 0, 1,
-0.7090614, -0.2215893, -3.952217, 0.5137255, 1, 0, 1,
-0.7023118, 0.5990635, 0.6556383, 0.5058824, 1, 0, 1,
-0.7014738, 0.5653012, -0.249374, 0.5019608, 1, 0, 1,
-0.7013911, -0.8754077, -3.316443, 0.4941176, 1, 0, 1,
-0.7009009, 0.7060052, 0.2915343, 0.4862745, 1, 0, 1,
-0.6975024, 0.29686, -2.684756, 0.4823529, 1, 0, 1,
-0.6881012, 0.6247964, -0.5229902, 0.4745098, 1, 0, 1,
-0.6861547, -0.1297146, -0.4141633, 0.4705882, 1, 0, 1,
-0.6858483, -0.8727263, -1.68575, 0.4627451, 1, 0, 1,
-0.6857855, 0.5365619, -2.30569, 0.4588235, 1, 0, 1,
-0.6798779, -0.270434, -1.537163, 0.4509804, 1, 0, 1,
-0.6762984, 1.636416, -0.2556748, 0.4470588, 1, 0, 1,
-0.6757034, -1.021058, -3.984501, 0.4392157, 1, 0, 1,
-0.6738425, -0.7718542, -1.172701, 0.4352941, 1, 0, 1,
-0.6733535, -0.1819033, -3.040231, 0.427451, 1, 0, 1,
-0.6715153, -0.1795211, -2.092217, 0.4235294, 1, 0, 1,
-0.6700311, -1.084988, -2.831375, 0.4156863, 1, 0, 1,
-0.6632743, -1.209919, -1.937333, 0.4117647, 1, 0, 1,
-0.660026, -0.3853818, -3.487278, 0.4039216, 1, 0, 1,
-0.6567459, 0.2184689, -2.211393, 0.3960784, 1, 0, 1,
-0.6525586, -0.1188876, -2.080808, 0.3921569, 1, 0, 1,
-0.652278, 0.110646, -1.56466, 0.3843137, 1, 0, 1,
-0.6510325, 0.6071634, -2.978976, 0.3803922, 1, 0, 1,
-0.6505122, 1.122865, -0.133061, 0.372549, 1, 0, 1,
-0.6483582, 0.7006969, 0.04516943, 0.3686275, 1, 0, 1,
-0.6472851, -0.4105445, -2.298839, 0.3607843, 1, 0, 1,
-0.6437458, -0.4960678, -1.092512, 0.3568628, 1, 0, 1,
-0.6376027, 0.2927913, -1.31518, 0.3490196, 1, 0, 1,
-0.6264707, -0.07653088, -1.287942, 0.345098, 1, 0, 1,
-0.6261383, -0.5943118, -2.512442, 0.3372549, 1, 0, 1,
-0.6252319, 1.764508, -1.616887, 0.3333333, 1, 0, 1,
-0.6216431, 0.02647853, -1.821971, 0.3254902, 1, 0, 1,
-0.6194856, 0.8056701, -1.971178, 0.3215686, 1, 0, 1,
-0.6123943, -1.102587, -1.733829, 0.3137255, 1, 0, 1,
-0.6096762, 0.5426714, -0.4246801, 0.3098039, 1, 0, 1,
-0.6059286, -0.3293455, -1.816622, 0.3019608, 1, 0, 1,
-0.6006171, -0.3706444, -3.840724, 0.2941177, 1, 0, 1,
-0.6000246, 0.6519158, -1.386046, 0.2901961, 1, 0, 1,
-0.5995882, 0.50882, -0.5289621, 0.282353, 1, 0, 1,
-0.5978862, -1.254636, -3.109269, 0.2784314, 1, 0, 1,
-0.5957618, 0.1051117, -1.714665, 0.2705882, 1, 0, 1,
-0.5955486, 1.326927, -0.8648547, 0.2666667, 1, 0, 1,
-0.5903508, -1.508286, -2.085269, 0.2588235, 1, 0, 1,
-0.5877652, 1.548175, 0.4464573, 0.254902, 1, 0, 1,
-0.5869462, 0.4877045, -0.082387, 0.2470588, 1, 0, 1,
-0.5866452, 0.9786461, -1.86807, 0.2431373, 1, 0, 1,
-0.5832937, -0.9673034, -2.219809, 0.2352941, 1, 0, 1,
-0.5799142, 0.8811111, -0.8249251, 0.2313726, 1, 0, 1,
-0.5753106, 1.662337, 0.1394095, 0.2235294, 1, 0, 1,
-0.5741133, -1.308691, -2.234073, 0.2196078, 1, 0, 1,
-0.5716562, -0.8427032, -3.683741, 0.2117647, 1, 0, 1,
-0.5695679, 1.065032, -1.101836, 0.2078431, 1, 0, 1,
-0.5653118, 0.289412, -0.09605683, 0.2, 1, 0, 1,
-0.5627774, -0.2389391, -1.416017, 0.1921569, 1, 0, 1,
-0.5623839, 0.01460262, 0.2817015, 0.1882353, 1, 0, 1,
-0.5614513, 1.489472, -0.8949761, 0.1803922, 1, 0, 1,
-0.5612694, 0.7258996, -1.103018, 0.1764706, 1, 0, 1,
-0.5571866, -0.08057325, -2.335232, 0.1686275, 1, 0, 1,
-0.5522555, 0.3873983, -0.3728907, 0.1647059, 1, 0, 1,
-0.5521443, 0.7288622, -1.240137, 0.1568628, 1, 0, 1,
-0.5504032, 0.3307711, -1.255008, 0.1529412, 1, 0, 1,
-0.5431569, 0.322433, -1.378699, 0.145098, 1, 0, 1,
-0.5346876, 1.031919, -0.3217495, 0.1411765, 1, 0, 1,
-0.5345336, 3.593257, 0.6762567, 0.1333333, 1, 0, 1,
-0.5311543, -0.3981969, -3.6786, 0.1294118, 1, 0, 1,
-0.5311356, -0.5985845, -2.581635, 0.1215686, 1, 0, 1,
-0.527922, -0.2956363, -1.258597, 0.1176471, 1, 0, 1,
-0.5245029, -1.275887, -2.723064, 0.1098039, 1, 0, 1,
-0.5225832, 0.7318425, 1.548489, 0.1058824, 1, 0, 1,
-0.52044, 0.7128214, -1.805377, 0.09803922, 1, 0, 1,
-0.5157823, -0.7590055, -3.251418, 0.09019608, 1, 0, 1,
-0.5146945, -0.001661206, -1.292271, 0.08627451, 1, 0, 1,
-0.513633, 0.2388514, -2.674484, 0.07843138, 1, 0, 1,
-0.5073373, 0.468303, -1.631515, 0.07450981, 1, 0, 1,
-0.5049101, -1.151203, -2.5919, 0.06666667, 1, 0, 1,
-0.4980246, -0.6672003, -3.960761, 0.0627451, 1, 0, 1,
-0.4936463, -2.359502, -2.416375, 0.05490196, 1, 0, 1,
-0.4922438, -0.9710563, -2.904068, 0.05098039, 1, 0, 1,
-0.4918959, 0.0752272, -1.860804, 0.04313726, 1, 0, 1,
-0.4904687, -0.4791379, -0.3641613, 0.03921569, 1, 0, 1,
-0.4864519, -0.05265072, -1.171172, 0.03137255, 1, 0, 1,
-0.4795344, 1.036691, -0.9332664, 0.02745098, 1, 0, 1,
-0.4760725, -1.003119, -2.150676, 0.01960784, 1, 0, 1,
-0.4727696, 1.201968, -1.61672, 0.01568628, 1, 0, 1,
-0.4691815, -0.142232, -1.412346, 0.007843138, 1, 0, 1,
-0.4677027, 0.3240942, -0.4220695, 0.003921569, 1, 0, 1,
-0.4612876, -0.7705061, -2.340732, 0, 1, 0.003921569, 1,
-0.4558297, 0.8916178, -0.544833, 0, 1, 0.01176471, 1,
-0.453157, -0.3458489, -2.090084, 0, 1, 0.01568628, 1,
-0.4524092, 0.1024382, -1.743377, 0, 1, 0.02352941, 1,
-0.4514454, 1.210629, -1.362934, 0, 1, 0.02745098, 1,
-0.4491642, -0.6289204, -4.50474, 0, 1, 0.03529412, 1,
-0.4484385, 0.8120686, -0.9541496, 0, 1, 0.03921569, 1,
-0.4479873, -0.9536285, -3.191373, 0, 1, 0.04705882, 1,
-0.4455909, 0.3756235, 0.7440175, 0, 1, 0.05098039, 1,
-0.4444575, -0.2834392, -0.7879713, 0, 1, 0.05882353, 1,
-0.4420174, -0.5823833, -2.469042, 0, 1, 0.0627451, 1,
-0.4385666, -0.05109807, -0.8089194, 0, 1, 0.07058824, 1,
-0.4379813, 0.3286855, -1.736429, 0, 1, 0.07450981, 1,
-0.4360429, 1.310403, 0.1708871, 0, 1, 0.08235294, 1,
-0.4283116, -1.423188, -3.723855, 0, 1, 0.08627451, 1,
-0.4277895, -0.8851524, -3.235586, 0, 1, 0.09411765, 1,
-0.427311, -1.562759, -3.326959, 0, 1, 0.1019608, 1,
-0.4265227, -0.6927187, -3.675522, 0, 1, 0.1058824, 1,
-0.4260398, -0.3456514, -1.813268, 0, 1, 0.1137255, 1,
-0.4233586, -1.535943, -1.971209, 0, 1, 0.1176471, 1,
-0.4211385, -0.8039244, -2.919244, 0, 1, 0.1254902, 1,
-0.4208514, 0.5142457, -1.116172, 0, 1, 0.1294118, 1,
-0.4182993, -1.298489, -2.067116, 0, 1, 0.1372549, 1,
-0.4142859, -2.108656, -2.899941, 0, 1, 0.1411765, 1,
-0.4128416, -0.4747347, -2.432051, 0, 1, 0.1490196, 1,
-0.4114822, 1.340051, -0.676731, 0, 1, 0.1529412, 1,
-0.408552, 0.05934227, -1.90951, 0, 1, 0.1607843, 1,
-0.406353, 0.1408705, -2.881733, 0, 1, 0.1647059, 1,
-0.405648, 0.9969497, -0.5924348, 0, 1, 0.172549, 1,
-0.4010202, -0.8087521, -3.135372, 0, 1, 0.1764706, 1,
-0.4007547, 0.452589, -0.03721195, 0, 1, 0.1843137, 1,
-0.3986439, -0.4190485, -2.530446, 0, 1, 0.1882353, 1,
-0.3947827, -1.320256, -1.98033, 0, 1, 0.1960784, 1,
-0.3909333, -0.6019066, -2.179436, 0, 1, 0.2039216, 1,
-0.3872476, 0.2219348, -1.952923, 0, 1, 0.2078431, 1,
-0.3808386, -0.7312857, -3.091691, 0, 1, 0.2156863, 1,
-0.3804311, -0.03278996, 0.2283271, 0, 1, 0.2196078, 1,
-0.3754052, 1.340352, -0.1335353, 0, 1, 0.227451, 1,
-0.370928, -1.000817, -5.199633, 0, 1, 0.2313726, 1,
-0.37012, -0.3580059, -2.401661, 0, 1, 0.2392157, 1,
-0.3683964, 1.30825, -0.402657, 0, 1, 0.2431373, 1,
-0.3677544, 0.8132027, -1.041878, 0, 1, 0.2509804, 1,
-0.3659054, 0.977423, -1.332726, 0, 1, 0.254902, 1,
-0.3645903, 1.235955, -0.6185973, 0, 1, 0.2627451, 1,
-0.354511, 0.8548315, -0.05283992, 0, 1, 0.2666667, 1,
-0.3484422, 0.3990162, -0.7857074, 0, 1, 0.2745098, 1,
-0.3478014, 1.073172, -1.073253, 0, 1, 0.2784314, 1,
-0.3413558, 1.24249, -2.390499, 0, 1, 0.2862745, 1,
-0.3391898, 0.5541106, -0.7933055, 0, 1, 0.2901961, 1,
-0.3297956, 0.718915, 0.06687676, 0, 1, 0.2980392, 1,
-0.3275797, -0.6296077, -1.690696, 0, 1, 0.3058824, 1,
-0.3253129, -0.9618087, -3.003226, 0, 1, 0.3098039, 1,
-0.316364, -0.5993611, -2.838763, 0, 1, 0.3176471, 1,
-0.3162109, 0.9069265, 0.02809705, 0, 1, 0.3215686, 1,
-0.3133014, -0.3463544, -2.5808, 0, 1, 0.3294118, 1,
-0.3119051, -0.02102875, -2.240012, 0, 1, 0.3333333, 1,
-0.3104912, -0.5732884, -3.462427, 0, 1, 0.3411765, 1,
-0.306649, -1.186254, -2.997813, 0, 1, 0.345098, 1,
-0.3044949, 0.2806848, -0.8716627, 0, 1, 0.3529412, 1,
-0.3032862, -1.458272, -2.814879, 0, 1, 0.3568628, 1,
-0.3007908, -0.6526738, -2.773576, 0, 1, 0.3647059, 1,
-0.2931967, 0.4903341, -0.6430662, 0, 1, 0.3686275, 1,
-0.2923857, -1.089851, -3.188423, 0, 1, 0.3764706, 1,
-0.2913702, -0.9006184, -3.578444, 0, 1, 0.3803922, 1,
-0.2885029, 0.7315382, -0.5505292, 0, 1, 0.3882353, 1,
-0.2881161, 0.1626904, -2.10655, 0, 1, 0.3921569, 1,
-0.2852018, -0.640725, -2.714017, 0, 1, 0.4, 1,
-0.2831143, 1.819628, -1.112579, 0, 1, 0.4078431, 1,
-0.2824442, -1.042135, -2.425452, 0, 1, 0.4117647, 1,
-0.2789437, -0.08697526, -2.938154, 0, 1, 0.4196078, 1,
-0.2788959, 0.02320112, -1.703849, 0, 1, 0.4235294, 1,
-0.2787123, 0.07794753, -3.461643, 0, 1, 0.4313726, 1,
-0.2724923, 1.138099, -0.4873213, 0, 1, 0.4352941, 1,
-0.2685191, -0.01978214, -1.015923, 0, 1, 0.4431373, 1,
-0.2681675, -2.472139, -2.472425, 0, 1, 0.4470588, 1,
-0.2677586, 0.3544119, 0.05329059, 0, 1, 0.454902, 1,
-0.2652783, -0.2790045, -3.057388, 0, 1, 0.4588235, 1,
-0.2559787, 0.9359456, -3.091901, 0, 1, 0.4666667, 1,
-0.254967, -1.657297, -3.509165, 0, 1, 0.4705882, 1,
-0.253848, -0.09213454, -1.222267, 0, 1, 0.4784314, 1,
-0.25297, 0.7207963, -1.124857, 0, 1, 0.4823529, 1,
-0.2526334, 0.9928631, 0.5242777, 0, 1, 0.4901961, 1,
-0.2512648, 0.991968, -0.8956725, 0, 1, 0.4941176, 1,
-0.2482246, -1.024735, -1.190946, 0, 1, 0.5019608, 1,
-0.2474823, -1.955578, -1.600131, 0, 1, 0.509804, 1,
-0.2451739, -0.6397166, -1.823735, 0, 1, 0.5137255, 1,
-0.2388723, 0.3959398, -0.6634539, 0, 1, 0.5215687, 1,
-0.2386226, -2.051769, -4.384344, 0, 1, 0.5254902, 1,
-0.2369724, -3.328867, -2.563184, 0, 1, 0.5333334, 1,
-0.2360272, -0.2237569, -0.8415599, 0, 1, 0.5372549, 1,
-0.2276916, -0.7641462, -4.037063, 0, 1, 0.5450981, 1,
-0.2267302, -1.72672, -3.541147, 0, 1, 0.5490196, 1,
-0.2262418, 1.575317, -0.1962339, 0, 1, 0.5568628, 1,
-0.2250743, -0.8582881, -2.173733, 0, 1, 0.5607843, 1,
-0.2247128, -1.616038, -3.839756, 0, 1, 0.5686275, 1,
-0.2205908, -0.5242732, -4.316667, 0, 1, 0.572549, 1,
-0.2199001, 0.5419654, -1.595342, 0, 1, 0.5803922, 1,
-0.2099857, -0.1644241, -1.1781, 0, 1, 0.5843138, 1,
-0.2070931, 0.6091176, 0.8707225, 0, 1, 0.5921569, 1,
-0.2017377, 0.8063011, -0.5559604, 0, 1, 0.5960785, 1,
-0.2000002, -1.678506, -2.417081, 0, 1, 0.6039216, 1,
-0.1935174, 0.1888196, 0.1500079, 0, 1, 0.6117647, 1,
-0.1909475, -0.2437507, -3.021184, 0, 1, 0.6156863, 1,
-0.1897868, 0.6659113, -1.475566, 0, 1, 0.6235294, 1,
-0.1886629, -0.7241853, -3.908152, 0, 1, 0.627451, 1,
-0.1883849, -0.1316866, -3.041564, 0, 1, 0.6352941, 1,
-0.1849867, 0.7346478, 0.08861043, 0, 1, 0.6392157, 1,
-0.1846329, -1.795398, -4.056051, 0, 1, 0.6470588, 1,
-0.1838584, 0.1950707, -0.2212783, 0, 1, 0.6509804, 1,
-0.1742143, -1.306452, -2.598731, 0, 1, 0.6588235, 1,
-0.1716234, 0.6047752, -1.143339, 0, 1, 0.6627451, 1,
-0.1715001, 0.3894688, 0.7291899, 0, 1, 0.6705883, 1,
-0.1695042, -0.6709338, -3.569631, 0, 1, 0.6745098, 1,
-0.1654736, -0.4352362, -2.656662, 0, 1, 0.682353, 1,
-0.1638776, 0.6451302, -0.9639963, 0, 1, 0.6862745, 1,
-0.1631898, -0.2725428, -3.432819, 0, 1, 0.6941177, 1,
-0.1615779, -0.4050038, -3.838014, 0, 1, 0.7019608, 1,
-0.1609467, 0.7103873, -0.548394, 0, 1, 0.7058824, 1,
-0.1596359, -1.610678, -3.335451, 0, 1, 0.7137255, 1,
-0.1583771, 0.2224625, -1.491614, 0, 1, 0.7176471, 1,
-0.1561569, -0.5016488, -2.347349, 0, 1, 0.7254902, 1,
-0.1555612, 1.495061, -1.713656, 0, 1, 0.7294118, 1,
-0.1552694, 0.7382959, -1.656446, 0, 1, 0.7372549, 1,
-0.1546072, -0.00245167, -0.5731984, 0, 1, 0.7411765, 1,
-0.1509039, -0.2417248, -3.660491, 0, 1, 0.7490196, 1,
-0.148131, -2.406579, -2.658382, 0, 1, 0.7529412, 1,
-0.1474931, 1.202852, -0.33182, 0, 1, 0.7607843, 1,
-0.1464023, -0.2027267, -1.433484, 0, 1, 0.7647059, 1,
-0.1448817, -0.2280664, -0.6141649, 0, 1, 0.772549, 1,
-0.1326043, -0.1453299, -1.183047, 0, 1, 0.7764706, 1,
-0.1306926, -0.1158043, -3.424081, 0, 1, 0.7843137, 1,
-0.1213041, -0.4907952, -1.96113, 0, 1, 0.7882353, 1,
-0.1146907, -1.783462, -2.899724, 0, 1, 0.7960784, 1,
-0.1137238, -1.344163, -3.252383, 0, 1, 0.8039216, 1,
-0.1128504, 1.431913, 1.398878, 0, 1, 0.8078431, 1,
-0.1108441, -0.3818101, -3.874456, 0, 1, 0.8156863, 1,
-0.1102948, 1.727815, -0.5714576, 0, 1, 0.8196079, 1,
-0.1070233, -1.605868, -5.163129, 0, 1, 0.827451, 1,
-0.09987146, -0.4085342, -3.71057, 0, 1, 0.8313726, 1,
-0.09733406, 0.3253322, 1.098409, 0, 1, 0.8392157, 1,
-0.09517462, 0.4979551, -0.0265063, 0, 1, 0.8431373, 1,
-0.09458602, 1.5984, 1.018931, 0, 1, 0.8509804, 1,
-0.09402129, 0.1296236, 0.2331284, 0, 1, 0.854902, 1,
-0.09321542, -1.062277, -3.791196, 0, 1, 0.8627451, 1,
-0.09216572, 1.544382, 0.421463, 0, 1, 0.8666667, 1,
-0.09081638, 0.456468, 0.8576885, 0, 1, 0.8745098, 1,
-0.09010981, -1.172846, -2.739698, 0, 1, 0.8784314, 1,
-0.0883201, -1.062952, -2.580086, 0, 1, 0.8862745, 1,
-0.08727526, 3.158823, 0.6284784, 0, 1, 0.8901961, 1,
-0.08704411, -0.03998544, -2.179582, 0, 1, 0.8980392, 1,
-0.08609103, -1.535019, -3.265908, 0, 1, 0.9058824, 1,
-0.08449575, -0.383211, -0.8283873, 0, 1, 0.9098039, 1,
-0.08401431, -1.039095, -3.558494, 0, 1, 0.9176471, 1,
-0.08090779, -0.111657, -1.392065, 0, 1, 0.9215686, 1,
-0.07819536, 0.1519929, -2.185407, 0, 1, 0.9294118, 1,
-0.07633981, 0.8371411, -0.1125907, 0, 1, 0.9333333, 1,
-0.0756959, -0.2372603, -2.333794, 0, 1, 0.9411765, 1,
-0.07471583, -2.139546, -3.896703, 0, 1, 0.945098, 1,
-0.06467437, -0.08439486, -3.13433, 0, 1, 0.9529412, 1,
-0.06182621, -1.420358, -2.576285, 0, 1, 0.9568627, 1,
-0.0603512, 0.6272939, 0.3386552, 0, 1, 0.9647059, 1,
-0.05936914, -1.551115, -3.206707, 0, 1, 0.9686275, 1,
-0.05898559, 0.6864854, 0.379821, 0, 1, 0.9764706, 1,
-0.05445125, -0.4335462, -4.715223, 0, 1, 0.9803922, 1,
-0.05262052, 1.380801, 0.9128094, 0, 1, 0.9882353, 1,
-0.05057132, -0.5978115, -2.305605, 0, 1, 0.9921569, 1,
-0.05017884, -0.2048116, -2.297821, 0, 1, 1, 1,
-0.04856249, -0.1079416, -3.016335, 0, 0.9921569, 1, 1,
-0.04763354, 0.6429139, 0.7351705, 0, 0.9882353, 1, 1,
-0.03962522, -0.8703147, -4.727831, 0, 0.9803922, 1, 1,
-0.03898025, -0.6157222, -3.280327, 0, 0.9764706, 1, 1,
-0.03547493, -0.2631071, -4.680006, 0, 0.9686275, 1, 1,
-0.03523058, 0.6681364, -0.3021967, 0, 0.9647059, 1, 1,
-0.03307908, -0.2120892, -2.188502, 0, 0.9568627, 1, 1,
-0.02906417, 1.076997, 1.927774, 0, 0.9529412, 1, 1,
-0.02854056, -0.5659525, -3.517468, 0, 0.945098, 1, 1,
-0.02485455, 2.80033, 0.6515093, 0, 0.9411765, 1, 1,
-0.02469567, -1.798724, -2.312145, 0, 0.9333333, 1, 1,
-0.02273075, -0.8025626, -3.125341, 0, 0.9294118, 1, 1,
-0.01686141, -1.675339, -1.535929, 0, 0.9215686, 1, 1,
-0.01674608, 0.4817131, -0.9260893, 0, 0.9176471, 1, 1,
-0.01664103, 0.08338644, -1.025872, 0, 0.9098039, 1, 1,
-0.0148121, 0.7942561, 2.193176, 0, 0.9058824, 1, 1,
-0.007220574, -0.4272067, -3.451677, 0, 0.8980392, 1, 1,
-0.003834791, 0.4695411, 0.03838846, 0, 0.8901961, 1, 1,
0.0005086036, 0.1228441, 1.247796, 0, 0.8862745, 1, 1,
0.002779247, -0.5347288, 3.318346, 0, 0.8784314, 1, 1,
0.004746146, 0.1141548, 0.05302767, 0, 0.8745098, 1, 1,
0.005242541, -1.975037, 0.5702649, 0, 0.8666667, 1, 1,
0.007400744, -0.1820925, 2.746907, 0, 0.8627451, 1, 1,
0.007523605, -0.4275127, 3.782498, 0, 0.854902, 1, 1,
0.008183952, 1.556331, 1.30657, 0, 0.8509804, 1, 1,
0.01036084, 0.1098531, -0.9979326, 0, 0.8431373, 1, 1,
0.01287764, -1.669005, 1.464299, 0, 0.8392157, 1, 1,
0.02872061, -0.2159033, 2.977254, 0, 0.8313726, 1, 1,
0.03775891, 0.8477162, -0.2586382, 0, 0.827451, 1, 1,
0.04239449, 0.6474063, -1.828832, 0, 0.8196079, 1, 1,
0.04396325, 1.444246, 1.513785, 0, 0.8156863, 1, 1,
0.05150571, -0.2781759, 3.760469, 0, 0.8078431, 1, 1,
0.0533839, 2.301857, -0.3678177, 0, 0.8039216, 1, 1,
0.05408811, -0.3393419, 3.113718, 0, 0.7960784, 1, 1,
0.05441615, -1.119159, 2.974363, 0, 0.7882353, 1, 1,
0.05599871, -0.05228039, 1.456167, 0, 0.7843137, 1, 1,
0.05767179, -0.6131939, 4.175905, 0, 0.7764706, 1, 1,
0.06482445, 0.7299364, 1.064419, 0, 0.772549, 1, 1,
0.06589196, 0.2952559, -1.261074, 0, 0.7647059, 1, 1,
0.06780893, -0.4530614, 2.547458, 0, 0.7607843, 1, 1,
0.07299022, -1.09277, 3.230937, 0, 0.7529412, 1, 1,
0.07308387, -0.02418613, 4.179348, 0, 0.7490196, 1, 1,
0.07366385, -1.845927, 2.587404, 0, 0.7411765, 1, 1,
0.07801143, 0.4298333, 0.7902179, 0, 0.7372549, 1, 1,
0.08320813, -0.0337242, -0.3785866, 0, 0.7294118, 1, 1,
0.08398984, -0.5939324, 2.914225, 0, 0.7254902, 1, 1,
0.0882243, 0.4318865, 0.6130677, 0, 0.7176471, 1, 1,
0.08992627, -0.3729023, 1.451765, 0, 0.7137255, 1, 1,
0.0907316, -1.160469, 4.712649, 0, 0.7058824, 1, 1,
0.09140705, -1.360925, 1.980674, 0, 0.6980392, 1, 1,
0.09246887, 0.3302101, -2.111075, 0, 0.6941177, 1, 1,
0.09380071, 1.395218, 0.8954238, 0, 0.6862745, 1, 1,
0.09520122, 0.9938191, 0.08833542, 0, 0.682353, 1, 1,
0.09597369, 1.452542, -0.6442149, 0, 0.6745098, 1, 1,
0.09830918, -0.4059245, 3.608065, 0, 0.6705883, 1, 1,
0.09908825, -0.9604352, 2.640534, 0, 0.6627451, 1, 1,
0.1024969, 0.3391481, 0.8448154, 0, 0.6588235, 1, 1,
0.1027957, 1.023349, 0.2474393, 0, 0.6509804, 1, 1,
0.1062966, 2.338978, -1.046126, 0, 0.6470588, 1, 1,
0.1067106, -1.558342, 2.517783, 0, 0.6392157, 1, 1,
0.1158457, -1.67563, 2.96967, 0, 0.6352941, 1, 1,
0.1159738, 0.6807477, 0.2179095, 0, 0.627451, 1, 1,
0.1186936, 0.4552369, 1.583483, 0, 0.6235294, 1, 1,
0.1222709, -0.09084753, 1.431244, 0, 0.6156863, 1, 1,
0.1247926, 0.8681777, -0.7385688, 0, 0.6117647, 1, 1,
0.1340175, -1.249031, 4.525295, 0, 0.6039216, 1, 1,
0.1363375, 0.2884948, -0.1968343, 0, 0.5960785, 1, 1,
0.1412893, -0.7285694, 2.496864, 0, 0.5921569, 1, 1,
0.1416509, -1.421467, 3.212871, 0, 0.5843138, 1, 1,
0.1432268, 0.0221449, 1.751446, 0, 0.5803922, 1, 1,
0.1473524, 0.1430602, 2.87279, 0, 0.572549, 1, 1,
0.147802, 0.3998466, -2.356383, 0, 0.5686275, 1, 1,
0.1534082, -1.265143, 3.888296, 0, 0.5607843, 1, 1,
0.1569392, -1.021901, 2.219784, 0, 0.5568628, 1, 1,
0.1643283, -0.7239869, 2.311533, 0, 0.5490196, 1, 1,
0.1653069, 0.314962, -0.06345771, 0, 0.5450981, 1, 1,
0.166368, -1.30871, 2.505658, 0, 0.5372549, 1, 1,
0.166919, 0.8373672, 0.966371, 0, 0.5333334, 1, 1,
0.1690391, -2.681292, 1.411178, 0, 0.5254902, 1, 1,
0.1735225, -2.349964, 1.553493, 0, 0.5215687, 1, 1,
0.1771957, -0.8598307, 2.261877, 0, 0.5137255, 1, 1,
0.1773662, -1.392645, 4.282429, 0, 0.509804, 1, 1,
0.1820277, 0.7947097, -1.36815, 0, 0.5019608, 1, 1,
0.1833088, 0.1924968, -1.022809, 0, 0.4941176, 1, 1,
0.1881411, -0.2078916, 1.995916, 0, 0.4901961, 1, 1,
0.1903296, 0.243972, -0.7446432, 0, 0.4823529, 1, 1,
0.1930208, 0.2030407, 0.5596295, 0, 0.4784314, 1, 1,
0.1940705, 0.9155656, 1.185446, 0, 0.4705882, 1, 1,
0.1990012, -0.9799142, 4.580453, 0, 0.4666667, 1, 1,
0.199779, 1.022155, -0.05010067, 0, 0.4588235, 1, 1,
0.2008809, -0.009827216, 0.9536301, 0, 0.454902, 1, 1,
0.202378, -1.63989, 4.433775, 0, 0.4470588, 1, 1,
0.2025805, 2.567632, -0.3924355, 0, 0.4431373, 1, 1,
0.2041833, 1.244292, -0.9208897, 0, 0.4352941, 1, 1,
0.2075977, 0.8726035, -0.4770926, 0, 0.4313726, 1, 1,
0.2079113, 0.06525809, 1.365337, 0, 0.4235294, 1, 1,
0.2112845, -0.6485126, 1.424707, 0, 0.4196078, 1, 1,
0.2117261, 0.3205688, 2.247741, 0, 0.4117647, 1, 1,
0.2126172, -1.239336, 4.214019, 0, 0.4078431, 1, 1,
0.2160184, -1.351933, 3.63525, 0, 0.4, 1, 1,
0.2162934, -0.1414884, 2.656795, 0, 0.3921569, 1, 1,
0.2171417, -0.8776528, 4.28946, 0, 0.3882353, 1, 1,
0.2229667, -0.2745843, 2.254342, 0, 0.3803922, 1, 1,
0.2276065, 0.4177493, 2.135679, 0, 0.3764706, 1, 1,
0.2334438, -0.07413088, 1.157874, 0, 0.3686275, 1, 1,
0.2334908, -0.5386441, 3.007364, 0, 0.3647059, 1, 1,
0.2338156, -1.312743, 3.861059, 0, 0.3568628, 1, 1,
0.234903, 1.043558, -1.27073, 0, 0.3529412, 1, 1,
0.2349932, -0.1410147, 0.2952633, 0, 0.345098, 1, 1,
0.2366523, 0.7637732, -0.7982411, 0, 0.3411765, 1, 1,
0.2478991, 0.5706724, 1.263411, 0, 0.3333333, 1, 1,
0.2512848, -0.1783112, 2.881692, 0, 0.3294118, 1, 1,
0.2516626, -0.8007747, 4.475643, 0, 0.3215686, 1, 1,
0.2589105, 0.896534, 1.098557, 0, 0.3176471, 1, 1,
0.2603048, 0.4141493, 0.8244677, 0, 0.3098039, 1, 1,
0.2685034, 2.712659, 1.192505, 0, 0.3058824, 1, 1,
0.2698184, 0.3092719, 0.3820957, 0, 0.2980392, 1, 1,
0.271707, 0.9052055, 0.3157428, 0, 0.2901961, 1, 1,
0.2737934, -0.3317712, 3.722672, 0, 0.2862745, 1, 1,
0.2744171, -0.355526, 1.292817, 0, 0.2784314, 1, 1,
0.2750517, -1.706553, 2.88646, 0, 0.2745098, 1, 1,
0.283124, 1.880007, 0.01080228, 0, 0.2666667, 1, 1,
0.2854299, 0.849223, -0.3196203, 0, 0.2627451, 1, 1,
0.2893533, 1.422065, 0.2524439, 0, 0.254902, 1, 1,
0.2951978, -0.6248738, 3.922223, 0, 0.2509804, 1, 1,
0.2973726, 2.625061, 0.8631592, 0, 0.2431373, 1, 1,
0.298485, 1.861802, 0.8818551, 0, 0.2392157, 1, 1,
0.3023749, -1.10249, 4.356374, 0, 0.2313726, 1, 1,
0.3024712, -0.01657669, 0.4408893, 0, 0.227451, 1, 1,
0.3038878, -0.3169343, 3.084667, 0, 0.2196078, 1, 1,
0.3145012, 0.6347903, 0.4384836, 0, 0.2156863, 1, 1,
0.317681, -0.8303046, 3.281477, 0, 0.2078431, 1, 1,
0.3191033, -0.9522931, 3.74494, 0, 0.2039216, 1, 1,
0.3232529, 1.753926, -0.4568694, 0, 0.1960784, 1, 1,
0.3238918, -0.2250053, 0.7805132, 0, 0.1882353, 1, 1,
0.3246463, -1.314102, 1.061025, 0, 0.1843137, 1, 1,
0.3255851, 0.6542398, 1.038141, 0, 0.1764706, 1, 1,
0.3273737, 0.02173839, 1.844405, 0, 0.172549, 1, 1,
0.3299455, -0.3694849, 1.701056, 0, 0.1647059, 1, 1,
0.3347091, 0.4645696, 0.7168963, 0, 0.1607843, 1, 1,
0.3371322, 0.8566464, 2.076997, 0, 0.1529412, 1, 1,
0.337399, -0.5544644, 0.6748328, 0, 0.1490196, 1, 1,
0.3384184, -0.3299235, 2.622675, 0, 0.1411765, 1, 1,
0.3394491, 0.1963433, 0.9039617, 0, 0.1372549, 1, 1,
0.3428887, -1.354892, 1.554742, 0, 0.1294118, 1, 1,
0.3433664, 0.6496318, -0.6449516, 0, 0.1254902, 1, 1,
0.3449899, 0.2195725, 1.410215, 0, 0.1176471, 1, 1,
0.349336, 1.339005, 0.7271879, 0, 0.1137255, 1, 1,
0.3497493, -1.345583, 2.890366, 0, 0.1058824, 1, 1,
0.3542681, -2.569406, 4.302366, 0, 0.09803922, 1, 1,
0.3569441, 1.410041, -1.523647, 0, 0.09411765, 1, 1,
0.3619215, -0.6052654, 3.727839, 0, 0.08627451, 1, 1,
0.3647933, -1.111607, 4.485209, 0, 0.08235294, 1, 1,
0.3706236, -1.585402, 2.639038, 0, 0.07450981, 1, 1,
0.3711521, -0.0310544, 0.8735277, 0, 0.07058824, 1, 1,
0.3726608, -0.5857963, 3.503509, 0, 0.0627451, 1, 1,
0.3733157, 0.5332881, -0.01853775, 0, 0.05882353, 1, 1,
0.3734807, 0.9420438, 0.2562041, 0, 0.05098039, 1, 1,
0.3837218, 1.307339, 0.898454, 0, 0.04705882, 1, 1,
0.385342, 0.9279672, -0.7378193, 0, 0.03921569, 1, 1,
0.3894939, -1.450776, 3.045506, 0, 0.03529412, 1, 1,
0.3914202, 0.9596353, 0.4736587, 0, 0.02745098, 1, 1,
0.3996858, -2.748382, 3.338178, 0, 0.02352941, 1, 1,
0.4038072, -1.673566, 2.093086, 0, 0.01568628, 1, 1,
0.4061521, -0.2448625, 1.202384, 0, 0.01176471, 1, 1,
0.4090399, 0.2681701, 1.116118, 0, 0.003921569, 1, 1,
0.4091955, 0.1894702, 0.4384962, 0.003921569, 0, 1, 1,
0.4112905, 1.319615, -0.5006574, 0.007843138, 0, 1, 1,
0.4116064, -1.901982, 2.733372, 0.01568628, 0, 1, 1,
0.4121395, -0.9370368, 1.589257, 0.01960784, 0, 1, 1,
0.4134397, 1.267793, 0.6533522, 0.02745098, 0, 1, 1,
0.4150631, 0.4256082, 2.335852, 0.03137255, 0, 1, 1,
0.4171304, -0.8790132, 3.15408, 0.03921569, 0, 1, 1,
0.4197924, -1.048593, 2.964551, 0.04313726, 0, 1, 1,
0.4233838, 0.3667156, -0.3504842, 0.05098039, 0, 1, 1,
0.4277158, 0.806635, -0.0598826, 0.05490196, 0, 1, 1,
0.4287981, 0.7519361, 1.413864, 0.0627451, 0, 1, 1,
0.4327458, -0.3239389, 3.726718, 0.06666667, 0, 1, 1,
0.4338703, -1.953437, 4.602432, 0.07450981, 0, 1, 1,
0.4369738, 0.1919382, 3.438285, 0.07843138, 0, 1, 1,
0.4380966, -0.3843572, 1.943752, 0.08627451, 0, 1, 1,
0.4408962, -0.1079769, 3.024267, 0.09019608, 0, 1, 1,
0.4479522, -0.7692631, 2.595433, 0.09803922, 0, 1, 1,
0.4492025, -0.8322787, 2.804902, 0.1058824, 0, 1, 1,
0.4514503, 1.599686, -0.07166582, 0.1098039, 0, 1, 1,
0.4521458, 0.4983935, 1.769815, 0.1176471, 0, 1, 1,
0.4583074, 0.1171188, 0.8178945, 0.1215686, 0, 1, 1,
0.4618883, 0.2875621, 1.202818, 0.1294118, 0, 1, 1,
0.4620836, 1.763183, -0.3836184, 0.1333333, 0, 1, 1,
0.466404, -0.06198558, 1.816748, 0.1411765, 0, 1, 1,
0.4737474, 0.7841544, 1.041635, 0.145098, 0, 1, 1,
0.4753695, 1.531827, 1.412517, 0.1529412, 0, 1, 1,
0.4767396, -0.1410125, 1.725293, 0.1568628, 0, 1, 1,
0.4885412, -1.111175, 3.795946, 0.1647059, 0, 1, 1,
0.4886574, -0.3937595, 3.590126, 0.1686275, 0, 1, 1,
0.4894563, -1.110478, 2.766657, 0.1764706, 0, 1, 1,
0.4907908, 0.4816734, 0.006801769, 0.1803922, 0, 1, 1,
0.4991694, -0.5000556, 2.706921, 0.1882353, 0, 1, 1,
0.5025374, 0.4548869, -1.900254, 0.1921569, 0, 1, 1,
0.5042555, 0.1993571, 0.1075771, 0.2, 0, 1, 1,
0.5080623, -0.57572, 3.598643, 0.2078431, 0, 1, 1,
0.5089908, -0.7032189, 2.227338, 0.2117647, 0, 1, 1,
0.5091615, 0.8862132, 1.0046, 0.2196078, 0, 1, 1,
0.5243415, 0.3976375, 0.8500062, 0.2235294, 0, 1, 1,
0.5254143, -0.769986, 2.339814, 0.2313726, 0, 1, 1,
0.5260439, 0.8735422, -0.5391154, 0.2352941, 0, 1, 1,
0.5337211, 1.597875, -0.7126768, 0.2431373, 0, 1, 1,
0.5343581, -0.2165642, 0.6026795, 0.2470588, 0, 1, 1,
0.5381531, 0.0110091, 1.07109, 0.254902, 0, 1, 1,
0.5403732, -0.9583389, 2.411824, 0.2588235, 0, 1, 1,
0.5405656, 1.630419, -0.2136017, 0.2666667, 0, 1, 1,
0.5429248, -0.534118, 0.7266273, 0.2705882, 0, 1, 1,
0.5448544, 0.5315126, 1.668896, 0.2784314, 0, 1, 1,
0.5460445, 1.631319, -0.2308422, 0.282353, 0, 1, 1,
0.5539063, -1.187093, 2.811512, 0.2901961, 0, 1, 1,
0.5579319, 0.2672046, 2.263477, 0.2941177, 0, 1, 1,
0.5637233, -1.021123, 2.576123, 0.3019608, 0, 1, 1,
0.5681528, 0.421303, 1.514014, 0.3098039, 0, 1, 1,
0.5698907, 1.188404, 0.04044052, 0.3137255, 0, 1, 1,
0.5701796, -0.0523083, 1.319173, 0.3215686, 0, 1, 1,
0.5749886, -1.012395, 3.040901, 0.3254902, 0, 1, 1,
0.5751151, 0.07843763, 0.08056858, 0.3333333, 0, 1, 1,
0.5764038, 1.626231, 0.7066757, 0.3372549, 0, 1, 1,
0.5777663, 1.356341, 0.6531751, 0.345098, 0, 1, 1,
0.5780373, 0.6402693, 1.799612, 0.3490196, 0, 1, 1,
0.5859095, 0.5587626, 1.017111, 0.3568628, 0, 1, 1,
0.5887765, 1.557308, 0.04543539, 0.3607843, 0, 1, 1,
0.5929905, 0.08481932, 0.2607731, 0.3686275, 0, 1, 1,
0.6034928, -0.9523586, 1.371607, 0.372549, 0, 1, 1,
0.6041495, -0.1057077, 1.067507, 0.3803922, 0, 1, 1,
0.6044999, -0.8671548, 2.663803, 0.3843137, 0, 1, 1,
0.6107229, -0.9717293, 3.124659, 0.3921569, 0, 1, 1,
0.6118105, 0.7188699, -0.3253043, 0.3960784, 0, 1, 1,
0.6167348, -1.104902, 3.279642, 0.4039216, 0, 1, 1,
0.6176986, 1.386008, 1.244364, 0.4117647, 0, 1, 1,
0.6249945, 0.5189948, -0.501657, 0.4156863, 0, 1, 1,
0.6277583, 0.04208774, 1.769186, 0.4235294, 0, 1, 1,
0.6285887, 0.07779763, 1.413408, 0.427451, 0, 1, 1,
0.631029, 0.8425652, 0.6044475, 0.4352941, 0, 1, 1,
0.640984, -0.6307028, 2.12142, 0.4392157, 0, 1, 1,
0.6418553, 0.09916517, 2.068363, 0.4470588, 0, 1, 1,
0.6500787, 0.5324414, -0.1981971, 0.4509804, 0, 1, 1,
0.6516533, 0.7210083, 0.5608461, 0.4588235, 0, 1, 1,
0.6516697, 0.9249409, 0.1149107, 0.4627451, 0, 1, 1,
0.652207, -0.2907763, 2.853917, 0.4705882, 0, 1, 1,
0.6535354, -0.04034379, 2.216275, 0.4745098, 0, 1, 1,
0.655731, -0.7082, 2.480045, 0.4823529, 0, 1, 1,
0.6591709, 0.1417806, 2.4513, 0.4862745, 0, 1, 1,
0.6654307, -1.168652, 4.290213, 0.4941176, 0, 1, 1,
0.6666968, 0.02445518, 0.01381109, 0.5019608, 0, 1, 1,
0.6684534, -0.03556585, 1.271933, 0.5058824, 0, 1, 1,
0.6693192, -0.1163866, 0.4246229, 0.5137255, 0, 1, 1,
0.6701916, 1.484119, 0.700313, 0.5176471, 0, 1, 1,
0.6829278, -1.877184, 2.810295, 0.5254902, 0, 1, 1,
0.6831941, 1.847483, 0.5656166, 0.5294118, 0, 1, 1,
0.6852652, 0.2581854, 0.4838414, 0.5372549, 0, 1, 1,
0.7003431, -0.6116291, 2.193196, 0.5411765, 0, 1, 1,
0.7017013, -0.3154807, 3.09535, 0.5490196, 0, 1, 1,
0.703441, -0.5542458, 0.7700499, 0.5529412, 0, 1, 1,
0.7073936, 0.2272927, 1.087921, 0.5607843, 0, 1, 1,
0.7145413, 0.149748, -0.1299922, 0.5647059, 0, 1, 1,
0.7155066, 0.795635, 1.475881, 0.572549, 0, 1, 1,
0.7186521, -0.3162116, 2.29625, 0.5764706, 0, 1, 1,
0.7193087, 0.7985134, 1.087069, 0.5843138, 0, 1, 1,
0.7252332, -0.4017499, 2.648035, 0.5882353, 0, 1, 1,
0.7272488, -0.01532582, 0.09841021, 0.5960785, 0, 1, 1,
0.7274238, 1.068428, 2.133741, 0.6039216, 0, 1, 1,
0.7282482, -1.19778, 1.980386, 0.6078432, 0, 1, 1,
0.7296294, -1.490139, 3.50284, 0.6156863, 0, 1, 1,
0.7323703, -0.4174932, 2.128539, 0.6196079, 0, 1, 1,
0.7351711, 0.2823578, 2.512997, 0.627451, 0, 1, 1,
0.7369717, -0.2647852, 3.409273, 0.6313726, 0, 1, 1,
0.7388417, 0.8566495, 0.1096577, 0.6392157, 0, 1, 1,
0.7389908, 1.051264, -0.1063533, 0.6431373, 0, 1, 1,
0.740016, -2.449237, 2.937074, 0.6509804, 0, 1, 1,
0.7435197, 0.8496158, -0.4976678, 0.654902, 0, 1, 1,
0.7450662, 1.250028, -1.27544, 0.6627451, 0, 1, 1,
0.7477142, -0.06939914, 2.787277, 0.6666667, 0, 1, 1,
0.7523325, 0.5718949, 0.2776946, 0.6745098, 0, 1, 1,
0.7524089, 0.08556215, 1.346347, 0.6784314, 0, 1, 1,
0.7524904, 0.2518437, 1.65028, 0.6862745, 0, 1, 1,
0.7528145, 0.377469, -0.1716752, 0.6901961, 0, 1, 1,
0.7687124, 0.8138939, 2.112813, 0.6980392, 0, 1, 1,
0.7720758, -0.9805908, 0.4261062, 0.7058824, 0, 1, 1,
0.7763856, 0.127198, -0.09803056, 0.7098039, 0, 1, 1,
0.7823465, -1.414457, 1.217514, 0.7176471, 0, 1, 1,
0.7830079, 2.005323, -0.9128311, 0.7215686, 0, 1, 1,
0.786492, 1.562578, 0.392912, 0.7294118, 0, 1, 1,
0.7882226, 1.582289, -0.04013532, 0.7333333, 0, 1, 1,
0.7904444, 0.01331454, 2.754335, 0.7411765, 0, 1, 1,
0.790886, -0.2463829, 1.324661, 0.7450981, 0, 1, 1,
0.7947128, 0.8414491, 0.1413643, 0.7529412, 0, 1, 1,
0.7966322, 0.2196348, 1.942136, 0.7568628, 0, 1, 1,
0.8018381, -0.8500156, 2.971708, 0.7647059, 0, 1, 1,
0.8052754, 0.4499299, 1.54389, 0.7686275, 0, 1, 1,
0.8141339, 1.042744, 0.3114823, 0.7764706, 0, 1, 1,
0.8150595, -0.642875, 0.8370192, 0.7803922, 0, 1, 1,
0.8159731, -0.6801645, 1.915061, 0.7882353, 0, 1, 1,
0.8164747, 0.9977956, 1.4262, 0.7921569, 0, 1, 1,
0.8206618, -0.2449427, 3.604365, 0.8, 0, 1, 1,
0.8236061, -0.9873018, 2.121495, 0.8078431, 0, 1, 1,
0.8273838, 0.2494987, 1.87906, 0.8117647, 0, 1, 1,
0.8346259, 0.4811182, 0.8747541, 0.8196079, 0, 1, 1,
0.835061, 0.7636781, 2.810277, 0.8235294, 0, 1, 1,
0.8409394, 1.396134, 0.1035175, 0.8313726, 0, 1, 1,
0.8566692, -1.920483, 2.955781, 0.8352941, 0, 1, 1,
0.861935, -0.2560245, 2.910801, 0.8431373, 0, 1, 1,
0.8630391, 1.179241, -1.132281, 0.8470588, 0, 1, 1,
0.8679096, -0.4967728, 1.029579, 0.854902, 0, 1, 1,
0.8685631, 0.2897995, 0.2335933, 0.8588235, 0, 1, 1,
0.8687081, -1.048584, 2.422621, 0.8666667, 0, 1, 1,
0.8688089, -0.4048387, 1.571956, 0.8705882, 0, 1, 1,
0.8700546, 1.662007, -0.117822, 0.8784314, 0, 1, 1,
0.8771183, 0.3822149, 0.5987313, 0.8823529, 0, 1, 1,
0.8772997, -0.2479528, 2.631972, 0.8901961, 0, 1, 1,
0.8803034, -2.09523, 2.492562, 0.8941177, 0, 1, 1,
0.8810574, 1.358102, 1.934512, 0.9019608, 0, 1, 1,
0.884839, -0.7484451, 2.421066, 0.9098039, 0, 1, 1,
0.8886421, 2.383604, 1.403112, 0.9137255, 0, 1, 1,
0.8900772, -1.29781, 1.645927, 0.9215686, 0, 1, 1,
0.8923642, 0.1862266, 1.384164, 0.9254902, 0, 1, 1,
0.8925027, 0.1054361, 1.552158, 0.9333333, 0, 1, 1,
0.893813, 0.623143, 2.723476, 0.9372549, 0, 1, 1,
0.8948647, 1.809874, 1.254507, 0.945098, 0, 1, 1,
0.9083155, -0.487127, 2.103365, 0.9490196, 0, 1, 1,
0.9092478, 1.04033, 0.2886422, 0.9568627, 0, 1, 1,
0.9189902, 0.5770546, -0.5131075, 0.9607843, 0, 1, 1,
0.9192988, -0.008317557, 1.631844, 0.9686275, 0, 1, 1,
0.9202169, 1.510083, 1.258738, 0.972549, 0, 1, 1,
0.9244506, 0.7143753, 1.828652, 0.9803922, 0, 1, 1,
0.9334449, -0.1123863, 1.82332, 0.9843137, 0, 1, 1,
0.9366599, -0.303488, 3.167896, 0.9921569, 0, 1, 1,
0.9379377, -0.2006174, -0.6260814, 0.9960784, 0, 1, 1,
0.9467587, 0.758873, -0.4776655, 1, 0, 0.9960784, 1,
0.9482514, -2.416226, 2.544232, 1, 0, 0.9882353, 1,
0.9543981, -0.993441, 2.396823, 1, 0, 0.9843137, 1,
0.9717218, 0.4620527, 1.855896, 1, 0, 0.9764706, 1,
0.972529, 0.1927523, 0.5536405, 1, 0, 0.972549, 1,
0.9734519, 0.1624609, -0.168507, 1, 0, 0.9647059, 1,
0.9783037, -1.612173, 3.710307, 1, 0, 0.9607843, 1,
0.978772, 1.924752, -0.735963, 1, 0, 0.9529412, 1,
0.9803611, 1.447657, 0.8909245, 1, 0, 0.9490196, 1,
0.9854893, -0.3578907, 2.652445, 1, 0, 0.9411765, 1,
0.997754, -0.3253267, 2.962872, 1, 0, 0.9372549, 1,
1.004827, -0.01550372, 1.562151, 1, 0, 0.9294118, 1,
1.00805, -1.452831, 2.765967, 1, 0, 0.9254902, 1,
1.010704, 0.0853518, 0.1931139, 1, 0, 0.9176471, 1,
1.016292, -1.929645, 2.639656, 1, 0, 0.9137255, 1,
1.018368, 0.873, 0.6061643, 1, 0, 0.9058824, 1,
1.024222, 2.081968, -0.07041877, 1, 0, 0.9019608, 1,
1.026788, 0.8039146, 0.7992553, 1, 0, 0.8941177, 1,
1.039714, -0.4911815, 1.620054, 1, 0, 0.8862745, 1,
1.042038, -1.153481, 1.878835, 1, 0, 0.8823529, 1,
1.044127, 1.048138, -0.766793, 1, 0, 0.8745098, 1,
1.046391, 0.304942, 0.5674569, 1, 0, 0.8705882, 1,
1.052731, -0.3555416, 3.432541, 1, 0, 0.8627451, 1,
1.074261, -0.01115933, 1.609745, 1, 0, 0.8588235, 1,
1.076782, 0.8542525, 1.185001, 1, 0, 0.8509804, 1,
1.076932, 0.07661615, 1.377962, 1, 0, 0.8470588, 1,
1.081709, -0.6451029, 3.5722, 1, 0, 0.8392157, 1,
1.08276, -0.426602, 2.412919, 1, 0, 0.8352941, 1,
1.084429, -0.5254455, 2.079802, 1, 0, 0.827451, 1,
1.08916, 0.2842756, 1.548285, 1, 0, 0.8235294, 1,
1.089454, 1.19186, 0.4835714, 1, 0, 0.8156863, 1,
1.091729, -0.7476113, 0.7081841, 1, 0, 0.8117647, 1,
1.092608, -0.6467733, 1.709915, 1, 0, 0.8039216, 1,
1.094901, -0.3180979, -0.08693215, 1, 0, 0.7960784, 1,
1.095735, -0.1989505, 0.9185024, 1, 0, 0.7921569, 1,
1.096097, 0.1558884, 1.186491, 1, 0, 0.7843137, 1,
1.103509, -0.8526585, 0.8643872, 1, 0, 0.7803922, 1,
1.104231, 0.1940354, 1.954938, 1, 0, 0.772549, 1,
1.105876, 0.6890438, 0.2840869, 1, 0, 0.7686275, 1,
1.114605, -1.198162, 1.990279, 1, 0, 0.7607843, 1,
1.118059, 1.571125, 0.5921443, 1, 0, 0.7568628, 1,
1.119726, 0.1527162, 2.187711, 1, 0, 0.7490196, 1,
1.120276, -1.853028, 0.5723189, 1, 0, 0.7450981, 1,
1.12993, -1.578312, 1.938223, 1, 0, 0.7372549, 1,
1.139616, 0.5966639, 0.4686283, 1, 0, 0.7333333, 1,
1.142235, -0.6416574, 3.002178, 1, 0, 0.7254902, 1,
1.147594, 0.633509, 1.583871, 1, 0, 0.7215686, 1,
1.150658, 1.237059, 0.1366163, 1, 0, 0.7137255, 1,
1.151491, 0.02770323, 1.072322, 1, 0, 0.7098039, 1,
1.155675, 1.009582, 0.5842195, 1, 0, 0.7019608, 1,
1.163334, 1.273543, 1.290929, 1, 0, 0.6941177, 1,
1.173322, 1.472077, 1.40267, 1, 0, 0.6901961, 1,
1.181173, 0.0313319, 1.392155, 1, 0, 0.682353, 1,
1.183823, 0.3035137, 2.744551, 1, 0, 0.6784314, 1,
1.183984, 1.03683, -0.07841186, 1, 0, 0.6705883, 1,
1.188243, -0.2866965, 3.153251, 1, 0, 0.6666667, 1,
1.190173, -0.2196976, 3.034104, 1, 0, 0.6588235, 1,
1.197493, -2.083385, 2.463713, 1, 0, 0.654902, 1,
1.205346, -1.06497, 0.8848945, 1, 0, 0.6470588, 1,
1.205742, 1.018457, 1.598326, 1, 0, 0.6431373, 1,
1.210022, -0.775798, 2.340612, 1, 0, 0.6352941, 1,
1.212612, -1.337908, 0.6922916, 1, 0, 0.6313726, 1,
1.21267, -0.09703601, 1.516325, 1, 0, 0.6235294, 1,
1.227835, 0.8640535, 2.401124, 1, 0, 0.6196079, 1,
1.227952, 1.910807, 1.348085, 1, 0, 0.6117647, 1,
1.231229, -0.881907, 1.602777, 1, 0, 0.6078432, 1,
1.231486, 0.5562028, 0.1668715, 1, 0, 0.6, 1,
1.237017, -0.7499009, 2.760887, 1, 0, 0.5921569, 1,
1.254472, -2.234085, 2.566271, 1, 0, 0.5882353, 1,
1.263162, 0.9216135, 0.8324342, 1, 0, 0.5803922, 1,
1.263605, -0.3847439, 3.143388, 1, 0, 0.5764706, 1,
1.271991, 0.81898, 1.092249, 1, 0, 0.5686275, 1,
1.283627, 1.436112, 0.3736815, 1, 0, 0.5647059, 1,
1.28667, 0.7321909, 0.9250984, 1, 0, 0.5568628, 1,
1.290487, -0.5973101, 1.253273, 1, 0, 0.5529412, 1,
1.295976, -1.225445, 2.057522, 1, 0, 0.5450981, 1,
1.300656, 0.5530736, 0.8617954, 1, 0, 0.5411765, 1,
1.303164, 0.5374572, -0.3084333, 1, 0, 0.5333334, 1,
1.305955, 0.3801553, 3.261896, 1, 0, 0.5294118, 1,
1.315453, -0.2740991, 0.8317021, 1, 0, 0.5215687, 1,
1.318402, 0.9114173, -0.5479805, 1, 0, 0.5176471, 1,
1.319694, 1.041575, -0.10857, 1, 0, 0.509804, 1,
1.320735, 0.8582224, 0.3830125, 1, 0, 0.5058824, 1,
1.321421, -0.320228, 2.009155, 1, 0, 0.4980392, 1,
1.331483, 0.3973329, 0.4578207, 1, 0, 0.4901961, 1,
1.334223, 1.487257, 1.59786, 1, 0, 0.4862745, 1,
1.336088, -0.1913498, 1.510575, 1, 0, 0.4784314, 1,
1.339408, 0.2967848, 0.5628941, 1, 0, 0.4745098, 1,
1.343196, 0.4510137, 1.755664, 1, 0, 0.4666667, 1,
1.344562, 1.207567, 1.880553, 1, 0, 0.4627451, 1,
1.351968, 1.370596, -1.377991, 1, 0, 0.454902, 1,
1.354858, -0.9886929, 0.7518546, 1, 0, 0.4509804, 1,
1.356275, 1.494253, -0.3820898, 1, 0, 0.4431373, 1,
1.357949, 0.3123282, 0.8976271, 1, 0, 0.4392157, 1,
1.366566, -1.352859, 1.053084, 1, 0, 0.4313726, 1,
1.369365, 1.837226, 1.284592, 1, 0, 0.427451, 1,
1.372303, -0.7676883, 1.734542, 1, 0, 0.4196078, 1,
1.390255, 0.09880465, 2.812691, 1, 0, 0.4156863, 1,
1.399507, -0.3466943, 1.650261, 1, 0, 0.4078431, 1,
1.407979, 0.5291088, 1.092816, 1, 0, 0.4039216, 1,
1.408888, 0.6060377, 1.052404, 1, 0, 0.3960784, 1,
1.428583, 0.3210495, 0.08496377, 1, 0, 0.3882353, 1,
1.439583, -0.06678762, 1.702551, 1, 0, 0.3843137, 1,
1.441481, 0.725186, 1.400898, 1, 0, 0.3764706, 1,
1.458723, 1.247242, -0.5496847, 1, 0, 0.372549, 1,
1.465129, 1.205811, 0.01568932, 1, 0, 0.3647059, 1,
1.468446, -0.9445269, 0.8678122, 1, 0, 0.3607843, 1,
1.478017, 0.1847696, 0.9995009, 1, 0, 0.3529412, 1,
1.490812, 1.020555, 0.4238586, 1, 0, 0.3490196, 1,
1.49882, -2.614155, 2.538795, 1, 0, 0.3411765, 1,
1.5025, -1.397061, 1.937156, 1, 0, 0.3372549, 1,
1.509073, -0.5572824, 3.143485, 1, 0, 0.3294118, 1,
1.518863, 0.4835969, -0.1140399, 1, 0, 0.3254902, 1,
1.529578, 2.289951, 1.726864, 1, 0, 0.3176471, 1,
1.553725, 0.2533613, 3.328321, 1, 0, 0.3137255, 1,
1.582411, 1.342694, -0.1162775, 1, 0, 0.3058824, 1,
1.605646, -1.056258, 1.414989, 1, 0, 0.2980392, 1,
1.616203, 1.519393, 1.893828, 1, 0, 0.2941177, 1,
1.620526, -1.855425, 1.084189, 1, 0, 0.2862745, 1,
1.621483, 1.230541, 0.6556356, 1, 0, 0.282353, 1,
1.625186, -1.959649, 3.038145, 1, 0, 0.2745098, 1,
1.627576, 2.704058, 1.822324, 1, 0, 0.2705882, 1,
1.640967, -0.5268242, 1.93644, 1, 0, 0.2627451, 1,
1.669207, 0.6728792, 0.6369196, 1, 0, 0.2588235, 1,
1.671372, 0.483099, 1.267872, 1, 0, 0.2509804, 1,
1.674591, -1.122951, 4.199705, 1, 0, 0.2470588, 1,
1.684649, 0.4097942, 2.320464, 1, 0, 0.2392157, 1,
1.706842, -0.3385962, 1.040108, 1, 0, 0.2352941, 1,
1.709576, -0.3219175, 2.751602, 1, 0, 0.227451, 1,
1.729365, 0.01420667, 1.287348, 1, 0, 0.2235294, 1,
1.751081, 0.5588675, 1.776666, 1, 0, 0.2156863, 1,
1.754694, -0.1229461, 0.9907505, 1, 0, 0.2117647, 1,
1.796939, -1.635361, 3.458205, 1, 0, 0.2039216, 1,
1.821897, 0.878877, 1.967632, 1, 0, 0.1960784, 1,
1.831773, -0.948074, 3.939796, 1, 0, 0.1921569, 1,
1.839945, 0.5673898, 0.08707793, 1, 0, 0.1843137, 1,
1.890276, -0.1238839, 1.692894, 1, 0, 0.1803922, 1,
1.921875, 1.529679, 0.7495955, 1, 0, 0.172549, 1,
1.92355, 0.7362176, 1.512, 1, 0, 0.1686275, 1,
1.929497, 0.4496758, 0.6821266, 1, 0, 0.1607843, 1,
1.957046, 0.1050249, 2.409579, 1, 0, 0.1568628, 1,
1.962555, 1.470171, 1.412902, 1, 0, 0.1490196, 1,
1.977177, 1.460432, 0.6241627, 1, 0, 0.145098, 1,
1.979747, 0.9118768, 1.358885, 1, 0, 0.1372549, 1,
1.980311, -1.370757, 3.482661, 1, 0, 0.1333333, 1,
1.997018, 0.2873712, 1.51281, 1, 0, 0.1254902, 1,
1.999992, 0.4060733, -1.567965, 1, 0, 0.1215686, 1,
2.037486, 3.015311, 1.279288, 1, 0, 0.1137255, 1,
2.074331, -0.7041503, 2.102952, 1, 0, 0.1098039, 1,
2.082065, -1.298714, 2.37428, 1, 0, 0.1019608, 1,
2.082929, -0.5315126, 1.285596, 1, 0, 0.09411765, 1,
2.205514, -1.429824, 3.370967, 1, 0, 0.09019608, 1,
2.221403, -0.448507, 3.477059, 1, 0, 0.08235294, 1,
2.254419, 1.436041, -0.274398, 1, 0, 0.07843138, 1,
2.274565, 0.8761202, 2.450445, 1, 0, 0.07058824, 1,
2.314271, 1.712115, 2.261609, 1, 0, 0.06666667, 1,
2.421135, 1.342757, -0.1796899, 1, 0, 0.05882353, 1,
2.57409, -1.282714, 2.067364, 1, 0, 0.05490196, 1,
2.618656, 1.677488, 0.8791225, 1, 0, 0.04705882, 1,
2.650077, -0.6813845, 1.966882, 1, 0, 0.04313726, 1,
2.756115, 0.1791081, 1.979206, 1, 0, 0.03529412, 1,
2.826989, -0.5106695, 2.305537, 1, 0, 0.03137255, 1,
2.848347, -1.301038, 0.09059414, 1, 0, 0.02352941, 1,
3.006116, -0.5069557, 1.150812, 1, 0, 0.01960784, 1,
3.196574, -1.27894, 2.861495, 1, 0, 0.01176471, 1,
3.733881, 0.1935517, 3.436621, 1, 0, 0.007843138, 1
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
0.1372871, -4.502167, -6.879765, 0, -0.5, 0.5, 0.5,
0.1372871, -4.502167, -6.879765, 1, -0.5, 0.5, 0.5,
0.1372871, -4.502167, -6.879765, 1, 1.5, 0.5, 0.5,
0.1372871, -4.502167, -6.879765, 0, 1.5, 0.5, 0.5
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
-4.678552, 0.132195, -6.879765, 0, -0.5, 0.5, 0.5,
-4.678552, 0.132195, -6.879765, 1, -0.5, 0.5, 0.5,
-4.678552, 0.132195, -6.879765, 1, 1.5, 0.5, 0.5,
-4.678552, 0.132195, -6.879765, 0, 1.5, 0.5, 0.5
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
-4.678552, -4.502167, -0.2434919, 0, -0.5, 0.5, 0.5,
-4.678552, -4.502167, -0.2434919, 1, -0.5, 0.5, 0.5,
-4.678552, -4.502167, -0.2434919, 1, 1.5, 0.5, 0.5,
-4.678552, -4.502167, -0.2434919, 0, 1.5, 0.5, 0.5
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
-2, -3.432698, -5.348317,
2, -3.432698, -5.348317,
-2, -3.432698, -5.348317,
-2, -3.610943, -5.603559,
0, -3.432698, -5.348317,
0, -3.610943, -5.603559,
2, -3.432698, -5.348317,
2, -3.610943, -5.603559
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
-2, -3.967432, -6.114041, 0, -0.5, 0.5, 0.5,
-2, -3.967432, -6.114041, 1, -0.5, 0.5, 0.5,
-2, -3.967432, -6.114041, 1, 1.5, 0.5, 0.5,
-2, -3.967432, -6.114041, 0, 1.5, 0.5, 0.5,
0, -3.967432, -6.114041, 0, -0.5, 0.5, 0.5,
0, -3.967432, -6.114041, 1, -0.5, 0.5, 0.5,
0, -3.967432, -6.114041, 1, 1.5, 0.5, 0.5,
0, -3.967432, -6.114041, 0, 1.5, 0.5, 0.5,
2, -3.967432, -6.114041, 0, -0.5, 0.5, 0.5,
2, -3.967432, -6.114041, 1, -0.5, 0.5, 0.5,
2, -3.967432, -6.114041, 1, 1.5, 0.5, 0.5,
2, -3.967432, -6.114041, 0, 1.5, 0.5, 0.5
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
-3.567204, -3, -5.348317,
-3.567204, 3, -5.348317,
-3.567204, -3, -5.348317,
-3.752429, -3, -5.603559,
-3.567204, -2, -5.348317,
-3.752429, -2, -5.603559,
-3.567204, -1, -5.348317,
-3.752429, -1, -5.603559,
-3.567204, 0, -5.348317,
-3.752429, 0, -5.603559,
-3.567204, 1, -5.348317,
-3.752429, 1, -5.603559,
-3.567204, 2, -5.348317,
-3.752429, 2, -5.603559,
-3.567204, 3, -5.348317,
-3.752429, 3, -5.603559
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
-4.122878, -3, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, -3, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, -3, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, -3, -6.114041, 0, 1.5, 0.5, 0.5,
-4.122878, -2, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, -2, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, -2, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, -2, -6.114041, 0, 1.5, 0.5, 0.5,
-4.122878, -1, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, -1, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, -1, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, -1, -6.114041, 0, 1.5, 0.5, 0.5,
-4.122878, 0, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, 0, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, 0, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, 0, -6.114041, 0, 1.5, 0.5, 0.5,
-4.122878, 1, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, 1, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, 1, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, 1, -6.114041, 0, 1.5, 0.5, 0.5,
-4.122878, 2, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, 2, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, 2, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, 2, -6.114041, 0, 1.5, 0.5, 0.5,
-4.122878, 3, -6.114041, 0, -0.5, 0.5, 0.5,
-4.122878, 3, -6.114041, 1, -0.5, 0.5, 0.5,
-4.122878, 3, -6.114041, 1, 1.5, 0.5, 0.5,
-4.122878, 3, -6.114041, 0, 1.5, 0.5, 0.5
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
-3.567204, -3.432698, -4,
-3.567204, -3.432698, 4,
-3.567204, -3.432698, -4,
-3.752429, -3.610943, -4,
-3.567204, -3.432698, -2,
-3.752429, -3.610943, -2,
-3.567204, -3.432698, 0,
-3.752429, -3.610943, 0,
-3.567204, -3.432698, 2,
-3.752429, -3.610943, 2,
-3.567204, -3.432698, 4,
-3.752429, -3.610943, 4
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
-4.122878, -3.967432, -4, 0, -0.5, 0.5, 0.5,
-4.122878, -3.967432, -4, 1, -0.5, 0.5, 0.5,
-4.122878, -3.967432, -4, 1, 1.5, 0.5, 0.5,
-4.122878, -3.967432, -4, 0, 1.5, 0.5, 0.5,
-4.122878, -3.967432, -2, 0, -0.5, 0.5, 0.5,
-4.122878, -3.967432, -2, 1, -0.5, 0.5, 0.5,
-4.122878, -3.967432, -2, 1, 1.5, 0.5, 0.5,
-4.122878, -3.967432, -2, 0, 1.5, 0.5, 0.5,
-4.122878, -3.967432, 0, 0, -0.5, 0.5, 0.5,
-4.122878, -3.967432, 0, 1, -0.5, 0.5, 0.5,
-4.122878, -3.967432, 0, 1, 1.5, 0.5, 0.5,
-4.122878, -3.967432, 0, 0, 1.5, 0.5, 0.5,
-4.122878, -3.967432, 2, 0, -0.5, 0.5, 0.5,
-4.122878, -3.967432, 2, 1, -0.5, 0.5, 0.5,
-4.122878, -3.967432, 2, 1, 1.5, 0.5, 0.5,
-4.122878, -3.967432, 2, 0, 1.5, 0.5, 0.5,
-4.122878, -3.967432, 4, 0, -0.5, 0.5, 0.5,
-4.122878, -3.967432, 4, 1, -0.5, 0.5, 0.5,
-4.122878, -3.967432, 4, 1, 1.5, 0.5, 0.5,
-4.122878, -3.967432, 4, 0, 1.5, 0.5, 0.5
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
-3.567204, -3.432698, -5.348317,
-3.567204, 3.697088, -5.348317,
-3.567204, -3.432698, 4.861333,
-3.567204, 3.697088, 4.861333,
-3.567204, -3.432698, -5.348317,
-3.567204, -3.432698, 4.861333,
-3.567204, 3.697088, -5.348317,
-3.567204, 3.697088, 4.861333,
-3.567204, -3.432698, -5.348317,
3.841779, -3.432698, -5.348317,
-3.567204, -3.432698, 4.861333,
3.841779, -3.432698, 4.861333,
-3.567204, 3.697088, -5.348317,
3.841779, 3.697088, -5.348317,
-3.567204, 3.697088, 4.861333,
3.841779, 3.697088, 4.861333,
3.841779, -3.432698, -5.348317,
3.841779, 3.697088, -5.348317,
3.841779, -3.432698, 4.861333,
3.841779, 3.697088, 4.861333,
3.841779, -3.432698, -5.348317,
3.841779, -3.432698, 4.861333,
3.841779, 3.697088, -5.348317,
3.841779, 3.697088, 4.861333
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
var radius = 7.737448;
var distance = 34.42478;
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
mvMatrix.translate( -0.1372871, -0.132195, 0.2434919 );
mvMatrix.scale( 1.129154, 1.17337, 0.8194091 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.42478);
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
fenvalerate<-read.table("fenvalerate.xyz")
```

```
## Error in read.table("fenvalerate.xyz"): no lines available in input
```

```r
x<-fenvalerate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
```

```r
y<-fenvalerate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
```

```r
z<-fenvalerate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
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
-3.459306, 0.3142314, 0.02477784, 0, 0, 1, 1, 1,
-3.156287, -0.6764885, -2.549136, 1, 0, 0, 1, 1,
-3.004313, -0.9515092, -1.553529, 1, 0, 0, 1, 1,
-2.762086, -0.1878861, -2.631024, 1, 0, 0, 1, 1,
-2.757465, -0.209235, -1.873754, 1, 0, 0, 1, 1,
-2.667268, 0.2402919, -1.219926, 1, 0, 0, 1, 1,
-2.653041, -1.131842, -1.718714, 0, 0, 0, 1, 1,
-2.511105, 1.011488, -0.5441476, 0, 0, 0, 1, 1,
-2.446006, -0.01834193, -0.9809986, 0, 0, 0, 1, 1,
-2.431489, 0.3744189, -1.468216, 0, 0, 0, 1, 1,
-2.425812, 1.219129, 0.04401454, 0, 0, 0, 1, 1,
-2.393334, -0.8412064, -1.6389, 0, 0, 0, 1, 1,
-2.307233, -0.8638753, -1.919412, 0, 0, 0, 1, 1,
-2.281869, -2.239211, -1.921033, 1, 1, 1, 1, 1,
-2.209196, 0.5898309, -0.9857373, 1, 1, 1, 1, 1,
-2.205926, -0.2504309, 0.4062925, 1, 1, 1, 1, 1,
-2.095617, -0.6249039, -2.344247, 1, 1, 1, 1, 1,
-2.095038, 0.684945, -0.5354267, 1, 1, 1, 1, 1,
-2.090985, -0.00863381, -3.850534, 1, 1, 1, 1, 1,
-2.082863, 0.7357176, -1.217287, 1, 1, 1, 1, 1,
-2.080525, -1.043327, -1.802706, 1, 1, 1, 1, 1,
-2.066407, -0.0007265464, -2.235647, 1, 1, 1, 1, 1,
-2.061055, 1.020013, -2.426554, 1, 1, 1, 1, 1,
-2.0607, -0.9600605, -2.781808, 1, 1, 1, 1, 1,
-2.046708, -0.8802896, -2.731226, 1, 1, 1, 1, 1,
-2.042891, -1.015254, -1.239277, 1, 1, 1, 1, 1,
-2.005928, 0.200299, -0.9568443, 1, 1, 1, 1, 1,
-2.000782, -0.6238092, -1.387797, 1, 1, 1, 1, 1,
-1.900416, -0.1153473, -1.028644, 0, 0, 1, 1, 1,
-1.893828, -0.9068033, -1.968086, 1, 0, 0, 1, 1,
-1.844368, -0.3082686, -3.450485, 1, 0, 0, 1, 1,
-1.832457, -2.23232, -4.559849, 1, 0, 0, 1, 1,
-1.803822, 0.04132714, -1.862579, 1, 0, 0, 1, 1,
-1.792231, 1.225152, -1.863333, 1, 0, 0, 1, 1,
-1.781238, 1.453487, -0.2468769, 0, 0, 0, 1, 1,
-1.776308, -0.5808094, -2.349854, 0, 0, 0, 1, 1,
-1.775653, -0.6338204, -1.045141, 0, 0, 0, 1, 1,
-1.768076, -0.4281213, -3.703694, 0, 0, 0, 1, 1,
-1.764461, -0.06366424, -1.90453, 0, 0, 0, 1, 1,
-1.753984, -0.8000951, -1.556642, 0, 0, 0, 1, 1,
-1.744988, -0.9630732, -1.727106, 0, 0, 0, 1, 1,
-1.722369, 0.2216403, -1.428429, 1, 1, 1, 1, 1,
-1.719763, 0.7829279, -1.858582, 1, 1, 1, 1, 1,
-1.710636, 0.3948743, -1.19757, 1, 1, 1, 1, 1,
-1.70815, -0.9394441, -1.815904, 1, 1, 1, 1, 1,
-1.693393, -0.2618541, -2.407862, 1, 1, 1, 1, 1,
-1.683618, 1.791251, -0.4029143, 1, 1, 1, 1, 1,
-1.681521, 1.208483, -0.5634542, 1, 1, 1, 1, 1,
-1.673622, 1.085678, -0.6875303, 1, 1, 1, 1, 1,
-1.669615, -2.129525, -1.88406, 1, 1, 1, 1, 1,
-1.667812, 0.1081091, -1.561459, 1, 1, 1, 1, 1,
-1.662961, 0.03802017, -0.007813522, 1, 1, 1, 1, 1,
-1.656118, -1.160068, -3.401706, 1, 1, 1, 1, 1,
-1.653926, -0.6840627, -1.724436, 1, 1, 1, 1, 1,
-1.647295, -0.955443, -3.564781, 1, 1, 1, 1, 1,
-1.619603, -0.6266685, -3.100695, 1, 1, 1, 1, 1,
-1.603342, -0.3065895, -2.639586, 0, 0, 1, 1, 1,
-1.581353, -0.01927936, -1.118869, 1, 0, 0, 1, 1,
-1.564424, 0.09530039, -1.778722, 1, 0, 0, 1, 1,
-1.561562, -0.2859873, -1.984167, 1, 0, 0, 1, 1,
-1.553529, -1.557368, -2.547115, 1, 0, 0, 1, 1,
-1.546169, 0.5546763, 0.761344, 1, 0, 0, 1, 1,
-1.543236, -0.9296525, -2.916348, 0, 0, 0, 1, 1,
-1.532434, -0.9574149, -2.96055, 0, 0, 0, 1, 1,
-1.531029, 1.164337, -0.1643769, 0, 0, 0, 1, 1,
-1.520865, -1.148046, -1.638708, 0, 0, 0, 1, 1,
-1.514995, 1.303235, -0.4493664, 0, 0, 0, 1, 1,
-1.512825, 0.2532113, -2.08008, 0, 0, 0, 1, 1,
-1.504579, -0.9497933, -0.9184288, 0, 0, 0, 1, 1,
-1.478222, 0.622238, 1.033085, 1, 1, 1, 1, 1,
-1.475141, -0.1259134, -1.911864, 1, 1, 1, 1, 1,
-1.470894, 0.4686491, -2.701524, 1, 1, 1, 1, 1,
-1.462149, 1.052786, 0.8782284, 1, 1, 1, 1, 1,
-1.455547, -0.9448034, -1.641511, 1, 1, 1, 1, 1,
-1.454314, -0.2073433, -0.190208, 1, 1, 1, 1, 1,
-1.445971, 0.6839349, 0.1322927, 1, 1, 1, 1, 1,
-1.444313, -0.899166, -0.7358389, 1, 1, 1, 1, 1,
-1.439882, 1.331, 0.0176841, 1, 1, 1, 1, 1,
-1.437844, 0.04105257, -0.8287138, 1, 1, 1, 1, 1,
-1.435029, 0.4485847, 0.4213335, 1, 1, 1, 1, 1,
-1.431189, 0.4863767, 0.3780524, 1, 1, 1, 1, 1,
-1.429602, 2.192037, -0.4032122, 1, 1, 1, 1, 1,
-1.424854, 0.4153478, -1.244456, 1, 1, 1, 1, 1,
-1.419007, 0.03850455, -1.158767, 1, 1, 1, 1, 1,
-1.418695, -0.5952373, -1.627825, 0, 0, 1, 1, 1,
-1.417663, -0.4335904, -3.417113, 1, 0, 0, 1, 1,
-1.415479, 0.8918703, -1.891965, 1, 0, 0, 1, 1,
-1.406076, 0.2927227, -2.36078, 1, 0, 0, 1, 1,
-1.400416, 0.4253922, -0.8411386, 1, 0, 0, 1, 1,
-1.395907, -1.408768, -2.833047, 1, 0, 0, 1, 1,
-1.391031, -0.6124696, -2.847754, 0, 0, 0, 1, 1,
-1.38728, 0.1813775, -1.057418, 0, 0, 0, 1, 1,
-1.372744, -0.386606, -1.973703, 0, 0, 0, 1, 1,
-1.37239, -0.390093, -1.127176, 0, 0, 0, 1, 1,
-1.366978, 0.9315031, -0.4615346, 0, 0, 0, 1, 1,
-1.363471, -0.2720166, -1.488779, 0, 0, 0, 1, 1,
-1.361577, -0.2541455, -2.885572, 0, 0, 0, 1, 1,
-1.359557, 0.4383609, -0.3221155, 1, 1, 1, 1, 1,
-1.33282, -0.8424972, -1.949532, 1, 1, 1, 1, 1,
-1.326828, 0.4101581, -2.948284, 1, 1, 1, 1, 1,
-1.31873, 0.1556844, -1.884638, 1, 1, 1, 1, 1,
-1.31539, -0.1970236, -1.542426, 1, 1, 1, 1, 1,
-1.288312, 0.5126055, -2.01531, 1, 1, 1, 1, 1,
-1.284042, -0.183937, -4.528933, 1, 1, 1, 1, 1,
-1.268979, -0.8793797, -4.530632, 1, 1, 1, 1, 1,
-1.256637, 0.1293129, -0.3483654, 1, 1, 1, 1, 1,
-1.253546, 0.967675, -0.718224, 1, 1, 1, 1, 1,
-1.249263, 2.099808, 0.6287449, 1, 1, 1, 1, 1,
-1.245563, -0.8978745, -2.899294, 1, 1, 1, 1, 1,
-1.229832, -0.7097731, -1.74551, 1, 1, 1, 1, 1,
-1.223815, -0.6148021, -2.620549, 1, 1, 1, 1, 1,
-1.220905, -0.5365689, -3.501871, 1, 1, 1, 1, 1,
-1.220352, 0.3984101, -1.939522, 0, 0, 1, 1, 1,
-1.204672, -0.3537581, -1.792218, 1, 0, 0, 1, 1,
-1.202503, -0.6341867, -1.637694, 1, 0, 0, 1, 1,
-1.196862, 0.1369463, -1.44838, 1, 0, 0, 1, 1,
-1.192726, -1.674098, -2.761493, 1, 0, 0, 1, 1,
-1.19207, 0.09744856, -2.041849, 1, 0, 0, 1, 1,
-1.190886, -0.3315968, -1.196923, 0, 0, 0, 1, 1,
-1.186444, 1.330078, -0.7211513, 0, 0, 0, 1, 1,
-1.184618, -0.1223561, -2.827896, 0, 0, 0, 1, 1,
-1.183622, 0.7514886, -1.379888, 0, 0, 0, 1, 1,
-1.182362, 0.5326437, -3.167699, 0, 0, 0, 1, 1,
-1.179014, 0.9481557, -0.3212055, 0, 0, 0, 1, 1,
-1.174985, -0.6288363, -2.342129, 0, 0, 0, 1, 1,
-1.173185, 0.3020864, -1.64071, 1, 1, 1, 1, 1,
-1.17172, 0.5007814, -3.004136, 1, 1, 1, 1, 1,
-1.171672, -0.4207945, -2.946114, 1, 1, 1, 1, 1,
-1.165264, -0.4278594, -0.4917407, 1, 1, 1, 1, 1,
-1.161228, 0.305385, -1.468777, 1, 1, 1, 1, 1,
-1.153561, -1.408145, -1.630575, 1, 1, 1, 1, 1,
-1.14819, 0.2395059, 0.2078968, 1, 1, 1, 1, 1,
-1.136702, -0.2775435, -2.2654, 1, 1, 1, 1, 1,
-1.13471, -1.202197, -2.900638, 1, 1, 1, 1, 1,
-1.129873, -0.4292574, 0.6668372, 1, 1, 1, 1, 1,
-1.129125, 1.103299, -1.106179, 1, 1, 1, 1, 1,
-1.118924, -2.327768, -2.135902, 1, 1, 1, 1, 1,
-1.116713, -0.1428713, -2.263118, 1, 1, 1, 1, 1,
-1.108985, 0.7636376, -0.6246251, 1, 1, 1, 1, 1,
-1.108813, -1.215583, -1.810182, 1, 1, 1, 1, 1,
-1.108072, -0.3609624, -2.316082, 0, 0, 1, 1, 1,
-1.104444, 0.7389804, 2.181351, 1, 0, 0, 1, 1,
-1.102603, 1.244303, -0.6411641, 1, 0, 0, 1, 1,
-1.095032, -0.1142782, -1.871882, 1, 0, 0, 1, 1,
-1.092221, -1.38457, -1.161243, 1, 0, 0, 1, 1,
-1.091793, 0.8338292, -1.007824, 1, 0, 0, 1, 1,
-1.077578, 0.3708819, -2.260132, 0, 0, 0, 1, 1,
-1.076085, -2.018826, -2.341441, 0, 0, 0, 1, 1,
-1.071814, 0.01588592, -1.702691, 0, 0, 0, 1, 1,
-1.056158, -0.8074459, -1.059633, 0, 0, 0, 1, 1,
-1.045178, 0.61988, -0.7478435, 0, 0, 0, 1, 1,
-1.043394, -0.6773309, -2.662399, 0, 0, 0, 1, 1,
-1.039859, 0.9513561, -0.2455039, 0, 0, 0, 1, 1,
-1.026171, -2.015972, -1.420779, 1, 1, 1, 1, 1,
-1.022912, 0.0480939, -1.022227, 1, 1, 1, 1, 1,
-1.013331, 0.9896165, -0.2474219, 1, 1, 1, 1, 1,
-1.009784, 0.1563109, 0.7645885, 1, 1, 1, 1, 1,
-1.00241, -1.554738, -2.798017, 1, 1, 1, 1, 1,
-0.9979565, 1.468599, 0.5395291, 1, 1, 1, 1, 1,
-0.9959672, 1.052976, -0.0926857, 1, 1, 1, 1, 1,
-0.9931786, -0.9717755, -1.766541, 1, 1, 1, 1, 1,
-0.9867444, -0.3027961, -1.537587, 1, 1, 1, 1, 1,
-0.9840013, -1.197225, -3.802493, 1, 1, 1, 1, 1,
-0.9786887, 0.5303848, -3.665162, 1, 1, 1, 1, 1,
-0.9739941, 0.6589411, -0.5263332, 1, 1, 1, 1, 1,
-0.9730522, -0.02154637, -2.604849, 1, 1, 1, 1, 1,
-0.9720594, 1.802744, -0.5061988, 1, 1, 1, 1, 1,
-0.9695339, -1.236369, -2.409108, 1, 1, 1, 1, 1,
-0.9668829, 0.2509502, 0.07611445, 0, 0, 1, 1, 1,
-0.9605519, -0.4683305, -1.962272, 1, 0, 0, 1, 1,
-0.9600084, -0.3822841, -3.202372, 1, 0, 0, 1, 1,
-0.9558503, -1.372978, -2.141505, 1, 0, 0, 1, 1,
-0.9544626, -0.1536333, -0.6323864, 1, 0, 0, 1, 1,
-0.9512157, 1.68452, -0.6544628, 1, 0, 0, 1, 1,
-0.9507443, 0.4934917, -1.607206, 0, 0, 0, 1, 1,
-0.9503545, -1.252865, -2.577292, 0, 0, 0, 1, 1,
-0.9475451, -0.1397135, -3.146031, 0, 0, 0, 1, 1,
-0.9425011, 2.450084, 0.3354251, 0, 0, 0, 1, 1,
-0.939266, 1.845159, 0.2190174, 0, 0, 0, 1, 1,
-0.9391554, 0.5292044, -0.01661233, 0, 0, 0, 1, 1,
-0.9379009, 0.7561878, -1.043908, 0, 0, 0, 1, 1,
-0.9342965, -0.8982969, -2.906152, 1, 1, 1, 1, 1,
-0.9297372, 1.869827, -0.2511377, 1, 1, 1, 1, 1,
-0.928736, -1.007123, -3.643394, 1, 1, 1, 1, 1,
-0.926722, -0.5644366, -3.880724, 1, 1, 1, 1, 1,
-0.926031, 0.5294045, 0.01046545, 1, 1, 1, 1, 1,
-0.922924, 0.9713997, -1.890574, 1, 1, 1, 1, 1,
-0.9222618, -0.345927, -1.246125, 1, 1, 1, 1, 1,
-0.9158191, -1.834092, -2.146451, 1, 1, 1, 1, 1,
-0.9126723, -0.04529352, -1.109662, 1, 1, 1, 1, 1,
-0.9108377, -0.09223974, 0.1616117, 1, 1, 1, 1, 1,
-0.9073364, 1.111205, -1.369154, 1, 1, 1, 1, 1,
-0.9056469, 0.1251029, -3.703873, 1, 1, 1, 1, 1,
-0.9045973, 0.1432779, -2.363712, 1, 1, 1, 1, 1,
-0.9041932, -1.092746, -2.261071, 1, 1, 1, 1, 1,
-0.9029937, 1.153879, -1.679177, 1, 1, 1, 1, 1,
-0.9007124, 0.2691385, -3.961942, 0, 0, 1, 1, 1,
-0.8985671, 1.812315, -0.1030507, 1, 0, 0, 1, 1,
-0.8954304, 1.050898, -1.823818, 1, 0, 0, 1, 1,
-0.8945329, -0.4811611, -1.77795, 1, 0, 0, 1, 1,
-0.8919821, 0.6412104, -1.320155, 1, 0, 0, 1, 1,
-0.8886685, 0.3206377, -1.76118, 1, 0, 0, 1, 1,
-0.8883018, -0.5742912, -1.101352, 0, 0, 0, 1, 1,
-0.8816323, -0.0463789, -2.559963, 0, 0, 0, 1, 1,
-0.8798606, 0.9876381, 0.1658222, 0, 0, 0, 1, 1,
-0.8790974, 0.9138976, 0.9719692, 0, 0, 0, 1, 1,
-0.8736609, -0.5617295, -2.148437, 0, 0, 0, 1, 1,
-0.8682873, -0.7472706, -1.463234, 0, 0, 0, 1, 1,
-0.8653462, -1.701928, -3.296949, 0, 0, 0, 1, 1,
-0.8624386, 0.7393429, 0.9504607, 1, 1, 1, 1, 1,
-0.8597643, -1.232649, -1.849671, 1, 1, 1, 1, 1,
-0.8554258, 0.002797344, -3.176098, 1, 1, 1, 1, 1,
-0.854488, 0.4672965, -0.5977938, 1, 1, 1, 1, 1,
-0.8519252, -0.1612767, -0.9518586, 1, 1, 1, 1, 1,
-0.8475329, 0.4274849, -1.303398, 1, 1, 1, 1, 1,
-0.8466812, 1.312092, -1.50878, 1, 1, 1, 1, 1,
-0.8440442, 0.6681442, 2.107484, 1, 1, 1, 1, 1,
-0.839608, 3.393815, -1.093906, 1, 1, 1, 1, 1,
-0.8376631, -0.7069196, -1.516991, 1, 1, 1, 1, 1,
-0.8321925, 0.2662733, -2.212257, 1, 1, 1, 1, 1,
-0.8315405, 0.3517877, -0.9301765, 1, 1, 1, 1, 1,
-0.8312135, 0.9176793, -1.008083, 1, 1, 1, 1, 1,
-0.8297208, 1.007806, 0.3918463, 1, 1, 1, 1, 1,
-0.8269508, 1.231957, 0.4261396, 1, 1, 1, 1, 1,
-0.8266186, 1.012374, -0.2739792, 0, 0, 1, 1, 1,
-0.8241801, -0.4050338, -1.779714, 1, 0, 0, 1, 1,
-0.8116471, -0.6376722, -3.682348, 1, 0, 0, 1, 1,
-0.8102996, -1.794137, -1.388323, 1, 0, 0, 1, 1,
-0.8102733, 1.117657, -1.6666, 1, 0, 0, 1, 1,
-0.8030927, -1.404387, -2.217775, 1, 0, 0, 1, 1,
-0.8011578, 1.680746, -0.8785536, 0, 0, 0, 1, 1,
-0.8002051, -1.743079, -3.529083, 0, 0, 0, 1, 1,
-0.7926375, 0.9692224, -1.656809, 0, 0, 0, 1, 1,
-0.7919186, 0.6040098, -3.029178, 0, 0, 0, 1, 1,
-0.7898413, 0.8705661, 0.346115, 0, 0, 0, 1, 1,
-0.7874808, -0.3386097, -1.989473, 0, 0, 0, 1, 1,
-0.7733063, -0.719686, -3.77388, 0, 0, 0, 1, 1,
-0.7655441, -0.8092679, -2.032146, 1, 1, 1, 1, 1,
-0.7637514, 0.1582168, -0.5178381, 1, 1, 1, 1, 1,
-0.7606712, -1.303557, -2.979237, 1, 1, 1, 1, 1,
-0.760071, -0.3690323, -2.401737, 1, 1, 1, 1, 1,
-0.7597647, -0.4914897, -3.750494, 1, 1, 1, 1, 1,
-0.7568168, -0.2937361, -2.83363, 1, 1, 1, 1, 1,
-0.7406768, 1.078927, -1.907255, 1, 1, 1, 1, 1,
-0.7311672, 0.5068305, -0.6150362, 1, 1, 1, 1, 1,
-0.721078, -0.3864512, -0.9286535, 1, 1, 1, 1, 1,
-0.7182037, 1.613569, 0.2637767, 1, 1, 1, 1, 1,
-0.7135087, 1.180254, -1.034425, 1, 1, 1, 1, 1,
-0.7090614, -0.2215893, -3.952217, 1, 1, 1, 1, 1,
-0.7023118, 0.5990635, 0.6556383, 1, 1, 1, 1, 1,
-0.7014738, 0.5653012, -0.249374, 1, 1, 1, 1, 1,
-0.7013911, -0.8754077, -3.316443, 1, 1, 1, 1, 1,
-0.7009009, 0.7060052, 0.2915343, 0, 0, 1, 1, 1,
-0.6975024, 0.29686, -2.684756, 1, 0, 0, 1, 1,
-0.6881012, 0.6247964, -0.5229902, 1, 0, 0, 1, 1,
-0.6861547, -0.1297146, -0.4141633, 1, 0, 0, 1, 1,
-0.6858483, -0.8727263, -1.68575, 1, 0, 0, 1, 1,
-0.6857855, 0.5365619, -2.30569, 1, 0, 0, 1, 1,
-0.6798779, -0.270434, -1.537163, 0, 0, 0, 1, 1,
-0.6762984, 1.636416, -0.2556748, 0, 0, 0, 1, 1,
-0.6757034, -1.021058, -3.984501, 0, 0, 0, 1, 1,
-0.6738425, -0.7718542, -1.172701, 0, 0, 0, 1, 1,
-0.6733535, -0.1819033, -3.040231, 0, 0, 0, 1, 1,
-0.6715153, -0.1795211, -2.092217, 0, 0, 0, 1, 1,
-0.6700311, -1.084988, -2.831375, 0, 0, 0, 1, 1,
-0.6632743, -1.209919, -1.937333, 1, 1, 1, 1, 1,
-0.660026, -0.3853818, -3.487278, 1, 1, 1, 1, 1,
-0.6567459, 0.2184689, -2.211393, 1, 1, 1, 1, 1,
-0.6525586, -0.1188876, -2.080808, 1, 1, 1, 1, 1,
-0.652278, 0.110646, -1.56466, 1, 1, 1, 1, 1,
-0.6510325, 0.6071634, -2.978976, 1, 1, 1, 1, 1,
-0.6505122, 1.122865, -0.133061, 1, 1, 1, 1, 1,
-0.6483582, 0.7006969, 0.04516943, 1, 1, 1, 1, 1,
-0.6472851, -0.4105445, -2.298839, 1, 1, 1, 1, 1,
-0.6437458, -0.4960678, -1.092512, 1, 1, 1, 1, 1,
-0.6376027, 0.2927913, -1.31518, 1, 1, 1, 1, 1,
-0.6264707, -0.07653088, -1.287942, 1, 1, 1, 1, 1,
-0.6261383, -0.5943118, -2.512442, 1, 1, 1, 1, 1,
-0.6252319, 1.764508, -1.616887, 1, 1, 1, 1, 1,
-0.6216431, 0.02647853, -1.821971, 1, 1, 1, 1, 1,
-0.6194856, 0.8056701, -1.971178, 0, 0, 1, 1, 1,
-0.6123943, -1.102587, -1.733829, 1, 0, 0, 1, 1,
-0.6096762, 0.5426714, -0.4246801, 1, 0, 0, 1, 1,
-0.6059286, -0.3293455, -1.816622, 1, 0, 0, 1, 1,
-0.6006171, -0.3706444, -3.840724, 1, 0, 0, 1, 1,
-0.6000246, 0.6519158, -1.386046, 1, 0, 0, 1, 1,
-0.5995882, 0.50882, -0.5289621, 0, 0, 0, 1, 1,
-0.5978862, -1.254636, -3.109269, 0, 0, 0, 1, 1,
-0.5957618, 0.1051117, -1.714665, 0, 0, 0, 1, 1,
-0.5955486, 1.326927, -0.8648547, 0, 0, 0, 1, 1,
-0.5903508, -1.508286, -2.085269, 0, 0, 0, 1, 1,
-0.5877652, 1.548175, 0.4464573, 0, 0, 0, 1, 1,
-0.5869462, 0.4877045, -0.082387, 0, 0, 0, 1, 1,
-0.5866452, 0.9786461, -1.86807, 1, 1, 1, 1, 1,
-0.5832937, -0.9673034, -2.219809, 1, 1, 1, 1, 1,
-0.5799142, 0.8811111, -0.8249251, 1, 1, 1, 1, 1,
-0.5753106, 1.662337, 0.1394095, 1, 1, 1, 1, 1,
-0.5741133, -1.308691, -2.234073, 1, 1, 1, 1, 1,
-0.5716562, -0.8427032, -3.683741, 1, 1, 1, 1, 1,
-0.5695679, 1.065032, -1.101836, 1, 1, 1, 1, 1,
-0.5653118, 0.289412, -0.09605683, 1, 1, 1, 1, 1,
-0.5627774, -0.2389391, -1.416017, 1, 1, 1, 1, 1,
-0.5623839, 0.01460262, 0.2817015, 1, 1, 1, 1, 1,
-0.5614513, 1.489472, -0.8949761, 1, 1, 1, 1, 1,
-0.5612694, 0.7258996, -1.103018, 1, 1, 1, 1, 1,
-0.5571866, -0.08057325, -2.335232, 1, 1, 1, 1, 1,
-0.5522555, 0.3873983, -0.3728907, 1, 1, 1, 1, 1,
-0.5521443, 0.7288622, -1.240137, 1, 1, 1, 1, 1,
-0.5504032, 0.3307711, -1.255008, 0, 0, 1, 1, 1,
-0.5431569, 0.322433, -1.378699, 1, 0, 0, 1, 1,
-0.5346876, 1.031919, -0.3217495, 1, 0, 0, 1, 1,
-0.5345336, 3.593257, 0.6762567, 1, 0, 0, 1, 1,
-0.5311543, -0.3981969, -3.6786, 1, 0, 0, 1, 1,
-0.5311356, -0.5985845, -2.581635, 1, 0, 0, 1, 1,
-0.527922, -0.2956363, -1.258597, 0, 0, 0, 1, 1,
-0.5245029, -1.275887, -2.723064, 0, 0, 0, 1, 1,
-0.5225832, 0.7318425, 1.548489, 0, 0, 0, 1, 1,
-0.52044, 0.7128214, -1.805377, 0, 0, 0, 1, 1,
-0.5157823, -0.7590055, -3.251418, 0, 0, 0, 1, 1,
-0.5146945, -0.001661206, -1.292271, 0, 0, 0, 1, 1,
-0.513633, 0.2388514, -2.674484, 0, 0, 0, 1, 1,
-0.5073373, 0.468303, -1.631515, 1, 1, 1, 1, 1,
-0.5049101, -1.151203, -2.5919, 1, 1, 1, 1, 1,
-0.4980246, -0.6672003, -3.960761, 1, 1, 1, 1, 1,
-0.4936463, -2.359502, -2.416375, 1, 1, 1, 1, 1,
-0.4922438, -0.9710563, -2.904068, 1, 1, 1, 1, 1,
-0.4918959, 0.0752272, -1.860804, 1, 1, 1, 1, 1,
-0.4904687, -0.4791379, -0.3641613, 1, 1, 1, 1, 1,
-0.4864519, -0.05265072, -1.171172, 1, 1, 1, 1, 1,
-0.4795344, 1.036691, -0.9332664, 1, 1, 1, 1, 1,
-0.4760725, -1.003119, -2.150676, 1, 1, 1, 1, 1,
-0.4727696, 1.201968, -1.61672, 1, 1, 1, 1, 1,
-0.4691815, -0.142232, -1.412346, 1, 1, 1, 1, 1,
-0.4677027, 0.3240942, -0.4220695, 1, 1, 1, 1, 1,
-0.4612876, -0.7705061, -2.340732, 1, 1, 1, 1, 1,
-0.4558297, 0.8916178, -0.544833, 1, 1, 1, 1, 1,
-0.453157, -0.3458489, -2.090084, 0, 0, 1, 1, 1,
-0.4524092, 0.1024382, -1.743377, 1, 0, 0, 1, 1,
-0.4514454, 1.210629, -1.362934, 1, 0, 0, 1, 1,
-0.4491642, -0.6289204, -4.50474, 1, 0, 0, 1, 1,
-0.4484385, 0.8120686, -0.9541496, 1, 0, 0, 1, 1,
-0.4479873, -0.9536285, -3.191373, 1, 0, 0, 1, 1,
-0.4455909, 0.3756235, 0.7440175, 0, 0, 0, 1, 1,
-0.4444575, -0.2834392, -0.7879713, 0, 0, 0, 1, 1,
-0.4420174, -0.5823833, -2.469042, 0, 0, 0, 1, 1,
-0.4385666, -0.05109807, -0.8089194, 0, 0, 0, 1, 1,
-0.4379813, 0.3286855, -1.736429, 0, 0, 0, 1, 1,
-0.4360429, 1.310403, 0.1708871, 0, 0, 0, 1, 1,
-0.4283116, -1.423188, -3.723855, 0, 0, 0, 1, 1,
-0.4277895, -0.8851524, -3.235586, 1, 1, 1, 1, 1,
-0.427311, -1.562759, -3.326959, 1, 1, 1, 1, 1,
-0.4265227, -0.6927187, -3.675522, 1, 1, 1, 1, 1,
-0.4260398, -0.3456514, -1.813268, 1, 1, 1, 1, 1,
-0.4233586, -1.535943, -1.971209, 1, 1, 1, 1, 1,
-0.4211385, -0.8039244, -2.919244, 1, 1, 1, 1, 1,
-0.4208514, 0.5142457, -1.116172, 1, 1, 1, 1, 1,
-0.4182993, -1.298489, -2.067116, 1, 1, 1, 1, 1,
-0.4142859, -2.108656, -2.899941, 1, 1, 1, 1, 1,
-0.4128416, -0.4747347, -2.432051, 1, 1, 1, 1, 1,
-0.4114822, 1.340051, -0.676731, 1, 1, 1, 1, 1,
-0.408552, 0.05934227, -1.90951, 1, 1, 1, 1, 1,
-0.406353, 0.1408705, -2.881733, 1, 1, 1, 1, 1,
-0.405648, 0.9969497, -0.5924348, 1, 1, 1, 1, 1,
-0.4010202, -0.8087521, -3.135372, 1, 1, 1, 1, 1,
-0.4007547, 0.452589, -0.03721195, 0, 0, 1, 1, 1,
-0.3986439, -0.4190485, -2.530446, 1, 0, 0, 1, 1,
-0.3947827, -1.320256, -1.98033, 1, 0, 0, 1, 1,
-0.3909333, -0.6019066, -2.179436, 1, 0, 0, 1, 1,
-0.3872476, 0.2219348, -1.952923, 1, 0, 0, 1, 1,
-0.3808386, -0.7312857, -3.091691, 1, 0, 0, 1, 1,
-0.3804311, -0.03278996, 0.2283271, 0, 0, 0, 1, 1,
-0.3754052, 1.340352, -0.1335353, 0, 0, 0, 1, 1,
-0.370928, -1.000817, -5.199633, 0, 0, 0, 1, 1,
-0.37012, -0.3580059, -2.401661, 0, 0, 0, 1, 1,
-0.3683964, 1.30825, -0.402657, 0, 0, 0, 1, 1,
-0.3677544, 0.8132027, -1.041878, 0, 0, 0, 1, 1,
-0.3659054, 0.977423, -1.332726, 0, 0, 0, 1, 1,
-0.3645903, 1.235955, -0.6185973, 1, 1, 1, 1, 1,
-0.354511, 0.8548315, -0.05283992, 1, 1, 1, 1, 1,
-0.3484422, 0.3990162, -0.7857074, 1, 1, 1, 1, 1,
-0.3478014, 1.073172, -1.073253, 1, 1, 1, 1, 1,
-0.3413558, 1.24249, -2.390499, 1, 1, 1, 1, 1,
-0.3391898, 0.5541106, -0.7933055, 1, 1, 1, 1, 1,
-0.3297956, 0.718915, 0.06687676, 1, 1, 1, 1, 1,
-0.3275797, -0.6296077, -1.690696, 1, 1, 1, 1, 1,
-0.3253129, -0.9618087, -3.003226, 1, 1, 1, 1, 1,
-0.316364, -0.5993611, -2.838763, 1, 1, 1, 1, 1,
-0.3162109, 0.9069265, 0.02809705, 1, 1, 1, 1, 1,
-0.3133014, -0.3463544, -2.5808, 1, 1, 1, 1, 1,
-0.3119051, -0.02102875, -2.240012, 1, 1, 1, 1, 1,
-0.3104912, -0.5732884, -3.462427, 1, 1, 1, 1, 1,
-0.306649, -1.186254, -2.997813, 1, 1, 1, 1, 1,
-0.3044949, 0.2806848, -0.8716627, 0, 0, 1, 1, 1,
-0.3032862, -1.458272, -2.814879, 1, 0, 0, 1, 1,
-0.3007908, -0.6526738, -2.773576, 1, 0, 0, 1, 1,
-0.2931967, 0.4903341, -0.6430662, 1, 0, 0, 1, 1,
-0.2923857, -1.089851, -3.188423, 1, 0, 0, 1, 1,
-0.2913702, -0.9006184, -3.578444, 1, 0, 0, 1, 1,
-0.2885029, 0.7315382, -0.5505292, 0, 0, 0, 1, 1,
-0.2881161, 0.1626904, -2.10655, 0, 0, 0, 1, 1,
-0.2852018, -0.640725, -2.714017, 0, 0, 0, 1, 1,
-0.2831143, 1.819628, -1.112579, 0, 0, 0, 1, 1,
-0.2824442, -1.042135, -2.425452, 0, 0, 0, 1, 1,
-0.2789437, -0.08697526, -2.938154, 0, 0, 0, 1, 1,
-0.2788959, 0.02320112, -1.703849, 0, 0, 0, 1, 1,
-0.2787123, 0.07794753, -3.461643, 1, 1, 1, 1, 1,
-0.2724923, 1.138099, -0.4873213, 1, 1, 1, 1, 1,
-0.2685191, -0.01978214, -1.015923, 1, 1, 1, 1, 1,
-0.2681675, -2.472139, -2.472425, 1, 1, 1, 1, 1,
-0.2677586, 0.3544119, 0.05329059, 1, 1, 1, 1, 1,
-0.2652783, -0.2790045, -3.057388, 1, 1, 1, 1, 1,
-0.2559787, 0.9359456, -3.091901, 1, 1, 1, 1, 1,
-0.254967, -1.657297, -3.509165, 1, 1, 1, 1, 1,
-0.253848, -0.09213454, -1.222267, 1, 1, 1, 1, 1,
-0.25297, 0.7207963, -1.124857, 1, 1, 1, 1, 1,
-0.2526334, 0.9928631, 0.5242777, 1, 1, 1, 1, 1,
-0.2512648, 0.991968, -0.8956725, 1, 1, 1, 1, 1,
-0.2482246, -1.024735, -1.190946, 1, 1, 1, 1, 1,
-0.2474823, -1.955578, -1.600131, 1, 1, 1, 1, 1,
-0.2451739, -0.6397166, -1.823735, 1, 1, 1, 1, 1,
-0.2388723, 0.3959398, -0.6634539, 0, 0, 1, 1, 1,
-0.2386226, -2.051769, -4.384344, 1, 0, 0, 1, 1,
-0.2369724, -3.328867, -2.563184, 1, 0, 0, 1, 1,
-0.2360272, -0.2237569, -0.8415599, 1, 0, 0, 1, 1,
-0.2276916, -0.7641462, -4.037063, 1, 0, 0, 1, 1,
-0.2267302, -1.72672, -3.541147, 1, 0, 0, 1, 1,
-0.2262418, 1.575317, -0.1962339, 0, 0, 0, 1, 1,
-0.2250743, -0.8582881, -2.173733, 0, 0, 0, 1, 1,
-0.2247128, -1.616038, -3.839756, 0, 0, 0, 1, 1,
-0.2205908, -0.5242732, -4.316667, 0, 0, 0, 1, 1,
-0.2199001, 0.5419654, -1.595342, 0, 0, 0, 1, 1,
-0.2099857, -0.1644241, -1.1781, 0, 0, 0, 1, 1,
-0.2070931, 0.6091176, 0.8707225, 0, 0, 0, 1, 1,
-0.2017377, 0.8063011, -0.5559604, 1, 1, 1, 1, 1,
-0.2000002, -1.678506, -2.417081, 1, 1, 1, 1, 1,
-0.1935174, 0.1888196, 0.1500079, 1, 1, 1, 1, 1,
-0.1909475, -0.2437507, -3.021184, 1, 1, 1, 1, 1,
-0.1897868, 0.6659113, -1.475566, 1, 1, 1, 1, 1,
-0.1886629, -0.7241853, -3.908152, 1, 1, 1, 1, 1,
-0.1883849, -0.1316866, -3.041564, 1, 1, 1, 1, 1,
-0.1849867, 0.7346478, 0.08861043, 1, 1, 1, 1, 1,
-0.1846329, -1.795398, -4.056051, 1, 1, 1, 1, 1,
-0.1838584, 0.1950707, -0.2212783, 1, 1, 1, 1, 1,
-0.1742143, -1.306452, -2.598731, 1, 1, 1, 1, 1,
-0.1716234, 0.6047752, -1.143339, 1, 1, 1, 1, 1,
-0.1715001, 0.3894688, 0.7291899, 1, 1, 1, 1, 1,
-0.1695042, -0.6709338, -3.569631, 1, 1, 1, 1, 1,
-0.1654736, -0.4352362, -2.656662, 1, 1, 1, 1, 1,
-0.1638776, 0.6451302, -0.9639963, 0, 0, 1, 1, 1,
-0.1631898, -0.2725428, -3.432819, 1, 0, 0, 1, 1,
-0.1615779, -0.4050038, -3.838014, 1, 0, 0, 1, 1,
-0.1609467, 0.7103873, -0.548394, 1, 0, 0, 1, 1,
-0.1596359, -1.610678, -3.335451, 1, 0, 0, 1, 1,
-0.1583771, 0.2224625, -1.491614, 1, 0, 0, 1, 1,
-0.1561569, -0.5016488, -2.347349, 0, 0, 0, 1, 1,
-0.1555612, 1.495061, -1.713656, 0, 0, 0, 1, 1,
-0.1552694, 0.7382959, -1.656446, 0, 0, 0, 1, 1,
-0.1546072, -0.00245167, -0.5731984, 0, 0, 0, 1, 1,
-0.1509039, -0.2417248, -3.660491, 0, 0, 0, 1, 1,
-0.148131, -2.406579, -2.658382, 0, 0, 0, 1, 1,
-0.1474931, 1.202852, -0.33182, 0, 0, 0, 1, 1,
-0.1464023, -0.2027267, -1.433484, 1, 1, 1, 1, 1,
-0.1448817, -0.2280664, -0.6141649, 1, 1, 1, 1, 1,
-0.1326043, -0.1453299, -1.183047, 1, 1, 1, 1, 1,
-0.1306926, -0.1158043, -3.424081, 1, 1, 1, 1, 1,
-0.1213041, -0.4907952, -1.96113, 1, 1, 1, 1, 1,
-0.1146907, -1.783462, -2.899724, 1, 1, 1, 1, 1,
-0.1137238, -1.344163, -3.252383, 1, 1, 1, 1, 1,
-0.1128504, 1.431913, 1.398878, 1, 1, 1, 1, 1,
-0.1108441, -0.3818101, -3.874456, 1, 1, 1, 1, 1,
-0.1102948, 1.727815, -0.5714576, 1, 1, 1, 1, 1,
-0.1070233, -1.605868, -5.163129, 1, 1, 1, 1, 1,
-0.09987146, -0.4085342, -3.71057, 1, 1, 1, 1, 1,
-0.09733406, 0.3253322, 1.098409, 1, 1, 1, 1, 1,
-0.09517462, 0.4979551, -0.0265063, 1, 1, 1, 1, 1,
-0.09458602, 1.5984, 1.018931, 1, 1, 1, 1, 1,
-0.09402129, 0.1296236, 0.2331284, 0, 0, 1, 1, 1,
-0.09321542, -1.062277, -3.791196, 1, 0, 0, 1, 1,
-0.09216572, 1.544382, 0.421463, 1, 0, 0, 1, 1,
-0.09081638, 0.456468, 0.8576885, 1, 0, 0, 1, 1,
-0.09010981, -1.172846, -2.739698, 1, 0, 0, 1, 1,
-0.0883201, -1.062952, -2.580086, 1, 0, 0, 1, 1,
-0.08727526, 3.158823, 0.6284784, 0, 0, 0, 1, 1,
-0.08704411, -0.03998544, -2.179582, 0, 0, 0, 1, 1,
-0.08609103, -1.535019, -3.265908, 0, 0, 0, 1, 1,
-0.08449575, -0.383211, -0.8283873, 0, 0, 0, 1, 1,
-0.08401431, -1.039095, -3.558494, 0, 0, 0, 1, 1,
-0.08090779, -0.111657, -1.392065, 0, 0, 0, 1, 1,
-0.07819536, 0.1519929, -2.185407, 0, 0, 0, 1, 1,
-0.07633981, 0.8371411, -0.1125907, 1, 1, 1, 1, 1,
-0.0756959, -0.2372603, -2.333794, 1, 1, 1, 1, 1,
-0.07471583, -2.139546, -3.896703, 1, 1, 1, 1, 1,
-0.06467437, -0.08439486, -3.13433, 1, 1, 1, 1, 1,
-0.06182621, -1.420358, -2.576285, 1, 1, 1, 1, 1,
-0.0603512, 0.6272939, 0.3386552, 1, 1, 1, 1, 1,
-0.05936914, -1.551115, -3.206707, 1, 1, 1, 1, 1,
-0.05898559, 0.6864854, 0.379821, 1, 1, 1, 1, 1,
-0.05445125, -0.4335462, -4.715223, 1, 1, 1, 1, 1,
-0.05262052, 1.380801, 0.9128094, 1, 1, 1, 1, 1,
-0.05057132, -0.5978115, -2.305605, 1, 1, 1, 1, 1,
-0.05017884, -0.2048116, -2.297821, 1, 1, 1, 1, 1,
-0.04856249, -0.1079416, -3.016335, 1, 1, 1, 1, 1,
-0.04763354, 0.6429139, 0.7351705, 1, 1, 1, 1, 1,
-0.03962522, -0.8703147, -4.727831, 1, 1, 1, 1, 1,
-0.03898025, -0.6157222, -3.280327, 0, 0, 1, 1, 1,
-0.03547493, -0.2631071, -4.680006, 1, 0, 0, 1, 1,
-0.03523058, 0.6681364, -0.3021967, 1, 0, 0, 1, 1,
-0.03307908, -0.2120892, -2.188502, 1, 0, 0, 1, 1,
-0.02906417, 1.076997, 1.927774, 1, 0, 0, 1, 1,
-0.02854056, -0.5659525, -3.517468, 1, 0, 0, 1, 1,
-0.02485455, 2.80033, 0.6515093, 0, 0, 0, 1, 1,
-0.02469567, -1.798724, -2.312145, 0, 0, 0, 1, 1,
-0.02273075, -0.8025626, -3.125341, 0, 0, 0, 1, 1,
-0.01686141, -1.675339, -1.535929, 0, 0, 0, 1, 1,
-0.01674608, 0.4817131, -0.9260893, 0, 0, 0, 1, 1,
-0.01664103, 0.08338644, -1.025872, 0, 0, 0, 1, 1,
-0.0148121, 0.7942561, 2.193176, 0, 0, 0, 1, 1,
-0.007220574, -0.4272067, -3.451677, 1, 1, 1, 1, 1,
-0.003834791, 0.4695411, 0.03838846, 1, 1, 1, 1, 1,
0.0005086036, 0.1228441, 1.247796, 1, 1, 1, 1, 1,
0.002779247, -0.5347288, 3.318346, 1, 1, 1, 1, 1,
0.004746146, 0.1141548, 0.05302767, 1, 1, 1, 1, 1,
0.005242541, -1.975037, 0.5702649, 1, 1, 1, 1, 1,
0.007400744, -0.1820925, 2.746907, 1, 1, 1, 1, 1,
0.007523605, -0.4275127, 3.782498, 1, 1, 1, 1, 1,
0.008183952, 1.556331, 1.30657, 1, 1, 1, 1, 1,
0.01036084, 0.1098531, -0.9979326, 1, 1, 1, 1, 1,
0.01287764, -1.669005, 1.464299, 1, 1, 1, 1, 1,
0.02872061, -0.2159033, 2.977254, 1, 1, 1, 1, 1,
0.03775891, 0.8477162, -0.2586382, 1, 1, 1, 1, 1,
0.04239449, 0.6474063, -1.828832, 1, 1, 1, 1, 1,
0.04396325, 1.444246, 1.513785, 1, 1, 1, 1, 1,
0.05150571, -0.2781759, 3.760469, 0, 0, 1, 1, 1,
0.0533839, 2.301857, -0.3678177, 1, 0, 0, 1, 1,
0.05408811, -0.3393419, 3.113718, 1, 0, 0, 1, 1,
0.05441615, -1.119159, 2.974363, 1, 0, 0, 1, 1,
0.05599871, -0.05228039, 1.456167, 1, 0, 0, 1, 1,
0.05767179, -0.6131939, 4.175905, 1, 0, 0, 1, 1,
0.06482445, 0.7299364, 1.064419, 0, 0, 0, 1, 1,
0.06589196, 0.2952559, -1.261074, 0, 0, 0, 1, 1,
0.06780893, -0.4530614, 2.547458, 0, 0, 0, 1, 1,
0.07299022, -1.09277, 3.230937, 0, 0, 0, 1, 1,
0.07308387, -0.02418613, 4.179348, 0, 0, 0, 1, 1,
0.07366385, -1.845927, 2.587404, 0, 0, 0, 1, 1,
0.07801143, 0.4298333, 0.7902179, 0, 0, 0, 1, 1,
0.08320813, -0.0337242, -0.3785866, 1, 1, 1, 1, 1,
0.08398984, -0.5939324, 2.914225, 1, 1, 1, 1, 1,
0.0882243, 0.4318865, 0.6130677, 1, 1, 1, 1, 1,
0.08992627, -0.3729023, 1.451765, 1, 1, 1, 1, 1,
0.0907316, -1.160469, 4.712649, 1, 1, 1, 1, 1,
0.09140705, -1.360925, 1.980674, 1, 1, 1, 1, 1,
0.09246887, 0.3302101, -2.111075, 1, 1, 1, 1, 1,
0.09380071, 1.395218, 0.8954238, 1, 1, 1, 1, 1,
0.09520122, 0.9938191, 0.08833542, 1, 1, 1, 1, 1,
0.09597369, 1.452542, -0.6442149, 1, 1, 1, 1, 1,
0.09830918, -0.4059245, 3.608065, 1, 1, 1, 1, 1,
0.09908825, -0.9604352, 2.640534, 1, 1, 1, 1, 1,
0.1024969, 0.3391481, 0.8448154, 1, 1, 1, 1, 1,
0.1027957, 1.023349, 0.2474393, 1, 1, 1, 1, 1,
0.1062966, 2.338978, -1.046126, 1, 1, 1, 1, 1,
0.1067106, -1.558342, 2.517783, 0, 0, 1, 1, 1,
0.1158457, -1.67563, 2.96967, 1, 0, 0, 1, 1,
0.1159738, 0.6807477, 0.2179095, 1, 0, 0, 1, 1,
0.1186936, 0.4552369, 1.583483, 1, 0, 0, 1, 1,
0.1222709, -0.09084753, 1.431244, 1, 0, 0, 1, 1,
0.1247926, 0.8681777, -0.7385688, 1, 0, 0, 1, 1,
0.1340175, -1.249031, 4.525295, 0, 0, 0, 1, 1,
0.1363375, 0.2884948, -0.1968343, 0, 0, 0, 1, 1,
0.1412893, -0.7285694, 2.496864, 0, 0, 0, 1, 1,
0.1416509, -1.421467, 3.212871, 0, 0, 0, 1, 1,
0.1432268, 0.0221449, 1.751446, 0, 0, 0, 1, 1,
0.1473524, 0.1430602, 2.87279, 0, 0, 0, 1, 1,
0.147802, 0.3998466, -2.356383, 0, 0, 0, 1, 1,
0.1534082, -1.265143, 3.888296, 1, 1, 1, 1, 1,
0.1569392, -1.021901, 2.219784, 1, 1, 1, 1, 1,
0.1643283, -0.7239869, 2.311533, 1, 1, 1, 1, 1,
0.1653069, 0.314962, -0.06345771, 1, 1, 1, 1, 1,
0.166368, -1.30871, 2.505658, 1, 1, 1, 1, 1,
0.166919, 0.8373672, 0.966371, 1, 1, 1, 1, 1,
0.1690391, -2.681292, 1.411178, 1, 1, 1, 1, 1,
0.1735225, -2.349964, 1.553493, 1, 1, 1, 1, 1,
0.1771957, -0.8598307, 2.261877, 1, 1, 1, 1, 1,
0.1773662, -1.392645, 4.282429, 1, 1, 1, 1, 1,
0.1820277, 0.7947097, -1.36815, 1, 1, 1, 1, 1,
0.1833088, 0.1924968, -1.022809, 1, 1, 1, 1, 1,
0.1881411, -0.2078916, 1.995916, 1, 1, 1, 1, 1,
0.1903296, 0.243972, -0.7446432, 1, 1, 1, 1, 1,
0.1930208, 0.2030407, 0.5596295, 1, 1, 1, 1, 1,
0.1940705, 0.9155656, 1.185446, 0, 0, 1, 1, 1,
0.1990012, -0.9799142, 4.580453, 1, 0, 0, 1, 1,
0.199779, 1.022155, -0.05010067, 1, 0, 0, 1, 1,
0.2008809, -0.009827216, 0.9536301, 1, 0, 0, 1, 1,
0.202378, -1.63989, 4.433775, 1, 0, 0, 1, 1,
0.2025805, 2.567632, -0.3924355, 1, 0, 0, 1, 1,
0.2041833, 1.244292, -0.9208897, 0, 0, 0, 1, 1,
0.2075977, 0.8726035, -0.4770926, 0, 0, 0, 1, 1,
0.2079113, 0.06525809, 1.365337, 0, 0, 0, 1, 1,
0.2112845, -0.6485126, 1.424707, 0, 0, 0, 1, 1,
0.2117261, 0.3205688, 2.247741, 0, 0, 0, 1, 1,
0.2126172, -1.239336, 4.214019, 0, 0, 0, 1, 1,
0.2160184, -1.351933, 3.63525, 0, 0, 0, 1, 1,
0.2162934, -0.1414884, 2.656795, 1, 1, 1, 1, 1,
0.2171417, -0.8776528, 4.28946, 1, 1, 1, 1, 1,
0.2229667, -0.2745843, 2.254342, 1, 1, 1, 1, 1,
0.2276065, 0.4177493, 2.135679, 1, 1, 1, 1, 1,
0.2334438, -0.07413088, 1.157874, 1, 1, 1, 1, 1,
0.2334908, -0.5386441, 3.007364, 1, 1, 1, 1, 1,
0.2338156, -1.312743, 3.861059, 1, 1, 1, 1, 1,
0.234903, 1.043558, -1.27073, 1, 1, 1, 1, 1,
0.2349932, -0.1410147, 0.2952633, 1, 1, 1, 1, 1,
0.2366523, 0.7637732, -0.7982411, 1, 1, 1, 1, 1,
0.2478991, 0.5706724, 1.263411, 1, 1, 1, 1, 1,
0.2512848, -0.1783112, 2.881692, 1, 1, 1, 1, 1,
0.2516626, -0.8007747, 4.475643, 1, 1, 1, 1, 1,
0.2589105, 0.896534, 1.098557, 1, 1, 1, 1, 1,
0.2603048, 0.4141493, 0.8244677, 1, 1, 1, 1, 1,
0.2685034, 2.712659, 1.192505, 0, 0, 1, 1, 1,
0.2698184, 0.3092719, 0.3820957, 1, 0, 0, 1, 1,
0.271707, 0.9052055, 0.3157428, 1, 0, 0, 1, 1,
0.2737934, -0.3317712, 3.722672, 1, 0, 0, 1, 1,
0.2744171, -0.355526, 1.292817, 1, 0, 0, 1, 1,
0.2750517, -1.706553, 2.88646, 1, 0, 0, 1, 1,
0.283124, 1.880007, 0.01080228, 0, 0, 0, 1, 1,
0.2854299, 0.849223, -0.3196203, 0, 0, 0, 1, 1,
0.2893533, 1.422065, 0.2524439, 0, 0, 0, 1, 1,
0.2951978, -0.6248738, 3.922223, 0, 0, 0, 1, 1,
0.2973726, 2.625061, 0.8631592, 0, 0, 0, 1, 1,
0.298485, 1.861802, 0.8818551, 0, 0, 0, 1, 1,
0.3023749, -1.10249, 4.356374, 0, 0, 0, 1, 1,
0.3024712, -0.01657669, 0.4408893, 1, 1, 1, 1, 1,
0.3038878, -0.3169343, 3.084667, 1, 1, 1, 1, 1,
0.3145012, 0.6347903, 0.4384836, 1, 1, 1, 1, 1,
0.317681, -0.8303046, 3.281477, 1, 1, 1, 1, 1,
0.3191033, -0.9522931, 3.74494, 1, 1, 1, 1, 1,
0.3232529, 1.753926, -0.4568694, 1, 1, 1, 1, 1,
0.3238918, -0.2250053, 0.7805132, 1, 1, 1, 1, 1,
0.3246463, -1.314102, 1.061025, 1, 1, 1, 1, 1,
0.3255851, 0.6542398, 1.038141, 1, 1, 1, 1, 1,
0.3273737, 0.02173839, 1.844405, 1, 1, 1, 1, 1,
0.3299455, -0.3694849, 1.701056, 1, 1, 1, 1, 1,
0.3347091, 0.4645696, 0.7168963, 1, 1, 1, 1, 1,
0.3371322, 0.8566464, 2.076997, 1, 1, 1, 1, 1,
0.337399, -0.5544644, 0.6748328, 1, 1, 1, 1, 1,
0.3384184, -0.3299235, 2.622675, 1, 1, 1, 1, 1,
0.3394491, 0.1963433, 0.9039617, 0, 0, 1, 1, 1,
0.3428887, -1.354892, 1.554742, 1, 0, 0, 1, 1,
0.3433664, 0.6496318, -0.6449516, 1, 0, 0, 1, 1,
0.3449899, 0.2195725, 1.410215, 1, 0, 0, 1, 1,
0.349336, 1.339005, 0.7271879, 1, 0, 0, 1, 1,
0.3497493, -1.345583, 2.890366, 1, 0, 0, 1, 1,
0.3542681, -2.569406, 4.302366, 0, 0, 0, 1, 1,
0.3569441, 1.410041, -1.523647, 0, 0, 0, 1, 1,
0.3619215, -0.6052654, 3.727839, 0, 0, 0, 1, 1,
0.3647933, -1.111607, 4.485209, 0, 0, 0, 1, 1,
0.3706236, -1.585402, 2.639038, 0, 0, 0, 1, 1,
0.3711521, -0.0310544, 0.8735277, 0, 0, 0, 1, 1,
0.3726608, -0.5857963, 3.503509, 0, 0, 0, 1, 1,
0.3733157, 0.5332881, -0.01853775, 1, 1, 1, 1, 1,
0.3734807, 0.9420438, 0.2562041, 1, 1, 1, 1, 1,
0.3837218, 1.307339, 0.898454, 1, 1, 1, 1, 1,
0.385342, 0.9279672, -0.7378193, 1, 1, 1, 1, 1,
0.3894939, -1.450776, 3.045506, 1, 1, 1, 1, 1,
0.3914202, 0.9596353, 0.4736587, 1, 1, 1, 1, 1,
0.3996858, -2.748382, 3.338178, 1, 1, 1, 1, 1,
0.4038072, -1.673566, 2.093086, 1, 1, 1, 1, 1,
0.4061521, -0.2448625, 1.202384, 1, 1, 1, 1, 1,
0.4090399, 0.2681701, 1.116118, 1, 1, 1, 1, 1,
0.4091955, 0.1894702, 0.4384962, 1, 1, 1, 1, 1,
0.4112905, 1.319615, -0.5006574, 1, 1, 1, 1, 1,
0.4116064, -1.901982, 2.733372, 1, 1, 1, 1, 1,
0.4121395, -0.9370368, 1.589257, 1, 1, 1, 1, 1,
0.4134397, 1.267793, 0.6533522, 1, 1, 1, 1, 1,
0.4150631, 0.4256082, 2.335852, 0, 0, 1, 1, 1,
0.4171304, -0.8790132, 3.15408, 1, 0, 0, 1, 1,
0.4197924, -1.048593, 2.964551, 1, 0, 0, 1, 1,
0.4233838, 0.3667156, -0.3504842, 1, 0, 0, 1, 1,
0.4277158, 0.806635, -0.0598826, 1, 0, 0, 1, 1,
0.4287981, 0.7519361, 1.413864, 1, 0, 0, 1, 1,
0.4327458, -0.3239389, 3.726718, 0, 0, 0, 1, 1,
0.4338703, -1.953437, 4.602432, 0, 0, 0, 1, 1,
0.4369738, 0.1919382, 3.438285, 0, 0, 0, 1, 1,
0.4380966, -0.3843572, 1.943752, 0, 0, 0, 1, 1,
0.4408962, -0.1079769, 3.024267, 0, 0, 0, 1, 1,
0.4479522, -0.7692631, 2.595433, 0, 0, 0, 1, 1,
0.4492025, -0.8322787, 2.804902, 0, 0, 0, 1, 1,
0.4514503, 1.599686, -0.07166582, 1, 1, 1, 1, 1,
0.4521458, 0.4983935, 1.769815, 1, 1, 1, 1, 1,
0.4583074, 0.1171188, 0.8178945, 1, 1, 1, 1, 1,
0.4618883, 0.2875621, 1.202818, 1, 1, 1, 1, 1,
0.4620836, 1.763183, -0.3836184, 1, 1, 1, 1, 1,
0.466404, -0.06198558, 1.816748, 1, 1, 1, 1, 1,
0.4737474, 0.7841544, 1.041635, 1, 1, 1, 1, 1,
0.4753695, 1.531827, 1.412517, 1, 1, 1, 1, 1,
0.4767396, -0.1410125, 1.725293, 1, 1, 1, 1, 1,
0.4885412, -1.111175, 3.795946, 1, 1, 1, 1, 1,
0.4886574, -0.3937595, 3.590126, 1, 1, 1, 1, 1,
0.4894563, -1.110478, 2.766657, 1, 1, 1, 1, 1,
0.4907908, 0.4816734, 0.006801769, 1, 1, 1, 1, 1,
0.4991694, -0.5000556, 2.706921, 1, 1, 1, 1, 1,
0.5025374, 0.4548869, -1.900254, 1, 1, 1, 1, 1,
0.5042555, 0.1993571, 0.1075771, 0, 0, 1, 1, 1,
0.5080623, -0.57572, 3.598643, 1, 0, 0, 1, 1,
0.5089908, -0.7032189, 2.227338, 1, 0, 0, 1, 1,
0.5091615, 0.8862132, 1.0046, 1, 0, 0, 1, 1,
0.5243415, 0.3976375, 0.8500062, 1, 0, 0, 1, 1,
0.5254143, -0.769986, 2.339814, 1, 0, 0, 1, 1,
0.5260439, 0.8735422, -0.5391154, 0, 0, 0, 1, 1,
0.5337211, 1.597875, -0.7126768, 0, 0, 0, 1, 1,
0.5343581, -0.2165642, 0.6026795, 0, 0, 0, 1, 1,
0.5381531, 0.0110091, 1.07109, 0, 0, 0, 1, 1,
0.5403732, -0.9583389, 2.411824, 0, 0, 0, 1, 1,
0.5405656, 1.630419, -0.2136017, 0, 0, 0, 1, 1,
0.5429248, -0.534118, 0.7266273, 0, 0, 0, 1, 1,
0.5448544, 0.5315126, 1.668896, 1, 1, 1, 1, 1,
0.5460445, 1.631319, -0.2308422, 1, 1, 1, 1, 1,
0.5539063, -1.187093, 2.811512, 1, 1, 1, 1, 1,
0.5579319, 0.2672046, 2.263477, 1, 1, 1, 1, 1,
0.5637233, -1.021123, 2.576123, 1, 1, 1, 1, 1,
0.5681528, 0.421303, 1.514014, 1, 1, 1, 1, 1,
0.5698907, 1.188404, 0.04044052, 1, 1, 1, 1, 1,
0.5701796, -0.0523083, 1.319173, 1, 1, 1, 1, 1,
0.5749886, -1.012395, 3.040901, 1, 1, 1, 1, 1,
0.5751151, 0.07843763, 0.08056858, 1, 1, 1, 1, 1,
0.5764038, 1.626231, 0.7066757, 1, 1, 1, 1, 1,
0.5777663, 1.356341, 0.6531751, 1, 1, 1, 1, 1,
0.5780373, 0.6402693, 1.799612, 1, 1, 1, 1, 1,
0.5859095, 0.5587626, 1.017111, 1, 1, 1, 1, 1,
0.5887765, 1.557308, 0.04543539, 1, 1, 1, 1, 1,
0.5929905, 0.08481932, 0.2607731, 0, 0, 1, 1, 1,
0.6034928, -0.9523586, 1.371607, 1, 0, 0, 1, 1,
0.6041495, -0.1057077, 1.067507, 1, 0, 0, 1, 1,
0.6044999, -0.8671548, 2.663803, 1, 0, 0, 1, 1,
0.6107229, -0.9717293, 3.124659, 1, 0, 0, 1, 1,
0.6118105, 0.7188699, -0.3253043, 1, 0, 0, 1, 1,
0.6167348, -1.104902, 3.279642, 0, 0, 0, 1, 1,
0.6176986, 1.386008, 1.244364, 0, 0, 0, 1, 1,
0.6249945, 0.5189948, -0.501657, 0, 0, 0, 1, 1,
0.6277583, 0.04208774, 1.769186, 0, 0, 0, 1, 1,
0.6285887, 0.07779763, 1.413408, 0, 0, 0, 1, 1,
0.631029, 0.8425652, 0.6044475, 0, 0, 0, 1, 1,
0.640984, -0.6307028, 2.12142, 0, 0, 0, 1, 1,
0.6418553, 0.09916517, 2.068363, 1, 1, 1, 1, 1,
0.6500787, 0.5324414, -0.1981971, 1, 1, 1, 1, 1,
0.6516533, 0.7210083, 0.5608461, 1, 1, 1, 1, 1,
0.6516697, 0.9249409, 0.1149107, 1, 1, 1, 1, 1,
0.652207, -0.2907763, 2.853917, 1, 1, 1, 1, 1,
0.6535354, -0.04034379, 2.216275, 1, 1, 1, 1, 1,
0.655731, -0.7082, 2.480045, 1, 1, 1, 1, 1,
0.6591709, 0.1417806, 2.4513, 1, 1, 1, 1, 1,
0.6654307, -1.168652, 4.290213, 1, 1, 1, 1, 1,
0.6666968, 0.02445518, 0.01381109, 1, 1, 1, 1, 1,
0.6684534, -0.03556585, 1.271933, 1, 1, 1, 1, 1,
0.6693192, -0.1163866, 0.4246229, 1, 1, 1, 1, 1,
0.6701916, 1.484119, 0.700313, 1, 1, 1, 1, 1,
0.6829278, -1.877184, 2.810295, 1, 1, 1, 1, 1,
0.6831941, 1.847483, 0.5656166, 1, 1, 1, 1, 1,
0.6852652, 0.2581854, 0.4838414, 0, 0, 1, 1, 1,
0.7003431, -0.6116291, 2.193196, 1, 0, 0, 1, 1,
0.7017013, -0.3154807, 3.09535, 1, 0, 0, 1, 1,
0.703441, -0.5542458, 0.7700499, 1, 0, 0, 1, 1,
0.7073936, 0.2272927, 1.087921, 1, 0, 0, 1, 1,
0.7145413, 0.149748, -0.1299922, 1, 0, 0, 1, 1,
0.7155066, 0.795635, 1.475881, 0, 0, 0, 1, 1,
0.7186521, -0.3162116, 2.29625, 0, 0, 0, 1, 1,
0.7193087, 0.7985134, 1.087069, 0, 0, 0, 1, 1,
0.7252332, -0.4017499, 2.648035, 0, 0, 0, 1, 1,
0.7272488, -0.01532582, 0.09841021, 0, 0, 0, 1, 1,
0.7274238, 1.068428, 2.133741, 0, 0, 0, 1, 1,
0.7282482, -1.19778, 1.980386, 0, 0, 0, 1, 1,
0.7296294, -1.490139, 3.50284, 1, 1, 1, 1, 1,
0.7323703, -0.4174932, 2.128539, 1, 1, 1, 1, 1,
0.7351711, 0.2823578, 2.512997, 1, 1, 1, 1, 1,
0.7369717, -0.2647852, 3.409273, 1, 1, 1, 1, 1,
0.7388417, 0.8566495, 0.1096577, 1, 1, 1, 1, 1,
0.7389908, 1.051264, -0.1063533, 1, 1, 1, 1, 1,
0.740016, -2.449237, 2.937074, 1, 1, 1, 1, 1,
0.7435197, 0.8496158, -0.4976678, 1, 1, 1, 1, 1,
0.7450662, 1.250028, -1.27544, 1, 1, 1, 1, 1,
0.7477142, -0.06939914, 2.787277, 1, 1, 1, 1, 1,
0.7523325, 0.5718949, 0.2776946, 1, 1, 1, 1, 1,
0.7524089, 0.08556215, 1.346347, 1, 1, 1, 1, 1,
0.7524904, 0.2518437, 1.65028, 1, 1, 1, 1, 1,
0.7528145, 0.377469, -0.1716752, 1, 1, 1, 1, 1,
0.7687124, 0.8138939, 2.112813, 1, 1, 1, 1, 1,
0.7720758, -0.9805908, 0.4261062, 0, 0, 1, 1, 1,
0.7763856, 0.127198, -0.09803056, 1, 0, 0, 1, 1,
0.7823465, -1.414457, 1.217514, 1, 0, 0, 1, 1,
0.7830079, 2.005323, -0.9128311, 1, 0, 0, 1, 1,
0.786492, 1.562578, 0.392912, 1, 0, 0, 1, 1,
0.7882226, 1.582289, -0.04013532, 1, 0, 0, 1, 1,
0.7904444, 0.01331454, 2.754335, 0, 0, 0, 1, 1,
0.790886, -0.2463829, 1.324661, 0, 0, 0, 1, 1,
0.7947128, 0.8414491, 0.1413643, 0, 0, 0, 1, 1,
0.7966322, 0.2196348, 1.942136, 0, 0, 0, 1, 1,
0.8018381, -0.8500156, 2.971708, 0, 0, 0, 1, 1,
0.8052754, 0.4499299, 1.54389, 0, 0, 0, 1, 1,
0.8141339, 1.042744, 0.3114823, 0, 0, 0, 1, 1,
0.8150595, -0.642875, 0.8370192, 1, 1, 1, 1, 1,
0.8159731, -0.6801645, 1.915061, 1, 1, 1, 1, 1,
0.8164747, 0.9977956, 1.4262, 1, 1, 1, 1, 1,
0.8206618, -0.2449427, 3.604365, 1, 1, 1, 1, 1,
0.8236061, -0.9873018, 2.121495, 1, 1, 1, 1, 1,
0.8273838, 0.2494987, 1.87906, 1, 1, 1, 1, 1,
0.8346259, 0.4811182, 0.8747541, 1, 1, 1, 1, 1,
0.835061, 0.7636781, 2.810277, 1, 1, 1, 1, 1,
0.8409394, 1.396134, 0.1035175, 1, 1, 1, 1, 1,
0.8566692, -1.920483, 2.955781, 1, 1, 1, 1, 1,
0.861935, -0.2560245, 2.910801, 1, 1, 1, 1, 1,
0.8630391, 1.179241, -1.132281, 1, 1, 1, 1, 1,
0.8679096, -0.4967728, 1.029579, 1, 1, 1, 1, 1,
0.8685631, 0.2897995, 0.2335933, 1, 1, 1, 1, 1,
0.8687081, -1.048584, 2.422621, 1, 1, 1, 1, 1,
0.8688089, -0.4048387, 1.571956, 0, 0, 1, 1, 1,
0.8700546, 1.662007, -0.117822, 1, 0, 0, 1, 1,
0.8771183, 0.3822149, 0.5987313, 1, 0, 0, 1, 1,
0.8772997, -0.2479528, 2.631972, 1, 0, 0, 1, 1,
0.8803034, -2.09523, 2.492562, 1, 0, 0, 1, 1,
0.8810574, 1.358102, 1.934512, 1, 0, 0, 1, 1,
0.884839, -0.7484451, 2.421066, 0, 0, 0, 1, 1,
0.8886421, 2.383604, 1.403112, 0, 0, 0, 1, 1,
0.8900772, -1.29781, 1.645927, 0, 0, 0, 1, 1,
0.8923642, 0.1862266, 1.384164, 0, 0, 0, 1, 1,
0.8925027, 0.1054361, 1.552158, 0, 0, 0, 1, 1,
0.893813, 0.623143, 2.723476, 0, 0, 0, 1, 1,
0.8948647, 1.809874, 1.254507, 0, 0, 0, 1, 1,
0.9083155, -0.487127, 2.103365, 1, 1, 1, 1, 1,
0.9092478, 1.04033, 0.2886422, 1, 1, 1, 1, 1,
0.9189902, 0.5770546, -0.5131075, 1, 1, 1, 1, 1,
0.9192988, -0.008317557, 1.631844, 1, 1, 1, 1, 1,
0.9202169, 1.510083, 1.258738, 1, 1, 1, 1, 1,
0.9244506, 0.7143753, 1.828652, 1, 1, 1, 1, 1,
0.9334449, -0.1123863, 1.82332, 1, 1, 1, 1, 1,
0.9366599, -0.303488, 3.167896, 1, 1, 1, 1, 1,
0.9379377, -0.2006174, -0.6260814, 1, 1, 1, 1, 1,
0.9467587, 0.758873, -0.4776655, 1, 1, 1, 1, 1,
0.9482514, -2.416226, 2.544232, 1, 1, 1, 1, 1,
0.9543981, -0.993441, 2.396823, 1, 1, 1, 1, 1,
0.9717218, 0.4620527, 1.855896, 1, 1, 1, 1, 1,
0.972529, 0.1927523, 0.5536405, 1, 1, 1, 1, 1,
0.9734519, 0.1624609, -0.168507, 1, 1, 1, 1, 1,
0.9783037, -1.612173, 3.710307, 0, 0, 1, 1, 1,
0.978772, 1.924752, -0.735963, 1, 0, 0, 1, 1,
0.9803611, 1.447657, 0.8909245, 1, 0, 0, 1, 1,
0.9854893, -0.3578907, 2.652445, 1, 0, 0, 1, 1,
0.997754, -0.3253267, 2.962872, 1, 0, 0, 1, 1,
1.004827, -0.01550372, 1.562151, 1, 0, 0, 1, 1,
1.00805, -1.452831, 2.765967, 0, 0, 0, 1, 1,
1.010704, 0.0853518, 0.1931139, 0, 0, 0, 1, 1,
1.016292, -1.929645, 2.639656, 0, 0, 0, 1, 1,
1.018368, 0.873, 0.6061643, 0, 0, 0, 1, 1,
1.024222, 2.081968, -0.07041877, 0, 0, 0, 1, 1,
1.026788, 0.8039146, 0.7992553, 0, 0, 0, 1, 1,
1.039714, -0.4911815, 1.620054, 0, 0, 0, 1, 1,
1.042038, -1.153481, 1.878835, 1, 1, 1, 1, 1,
1.044127, 1.048138, -0.766793, 1, 1, 1, 1, 1,
1.046391, 0.304942, 0.5674569, 1, 1, 1, 1, 1,
1.052731, -0.3555416, 3.432541, 1, 1, 1, 1, 1,
1.074261, -0.01115933, 1.609745, 1, 1, 1, 1, 1,
1.076782, 0.8542525, 1.185001, 1, 1, 1, 1, 1,
1.076932, 0.07661615, 1.377962, 1, 1, 1, 1, 1,
1.081709, -0.6451029, 3.5722, 1, 1, 1, 1, 1,
1.08276, -0.426602, 2.412919, 1, 1, 1, 1, 1,
1.084429, -0.5254455, 2.079802, 1, 1, 1, 1, 1,
1.08916, 0.2842756, 1.548285, 1, 1, 1, 1, 1,
1.089454, 1.19186, 0.4835714, 1, 1, 1, 1, 1,
1.091729, -0.7476113, 0.7081841, 1, 1, 1, 1, 1,
1.092608, -0.6467733, 1.709915, 1, 1, 1, 1, 1,
1.094901, -0.3180979, -0.08693215, 1, 1, 1, 1, 1,
1.095735, -0.1989505, 0.9185024, 0, 0, 1, 1, 1,
1.096097, 0.1558884, 1.186491, 1, 0, 0, 1, 1,
1.103509, -0.8526585, 0.8643872, 1, 0, 0, 1, 1,
1.104231, 0.1940354, 1.954938, 1, 0, 0, 1, 1,
1.105876, 0.6890438, 0.2840869, 1, 0, 0, 1, 1,
1.114605, -1.198162, 1.990279, 1, 0, 0, 1, 1,
1.118059, 1.571125, 0.5921443, 0, 0, 0, 1, 1,
1.119726, 0.1527162, 2.187711, 0, 0, 0, 1, 1,
1.120276, -1.853028, 0.5723189, 0, 0, 0, 1, 1,
1.12993, -1.578312, 1.938223, 0, 0, 0, 1, 1,
1.139616, 0.5966639, 0.4686283, 0, 0, 0, 1, 1,
1.142235, -0.6416574, 3.002178, 0, 0, 0, 1, 1,
1.147594, 0.633509, 1.583871, 0, 0, 0, 1, 1,
1.150658, 1.237059, 0.1366163, 1, 1, 1, 1, 1,
1.151491, 0.02770323, 1.072322, 1, 1, 1, 1, 1,
1.155675, 1.009582, 0.5842195, 1, 1, 1, 1, 1,
1.163334, 1.273543, 1.290929, 1, 1, 1, 1, 1,
1.173322, 1.472077, 1.40267, 1, 1, 1, 1, 1,
1.181173, 0.0313319, 1.392155, 1, 1, 1, 1, 1,
1.183823, 0.3035137, 2.744551, 1, 1, 1, 1, 1,
1.183984, 1.03683, -0.07841186, 1, 1, 1, 1, 1,
1.188243, -0.2866965, 3.153251, 1, 1, 1, 1, 1,
1.190173, -0.2196976, 3.034104, 1, 1, 1, 1, 1,
1.197493, -2.083385, 2.463713, 1, 1, 1, 1, 1,
1.205346, -1.06497, 0.8848945, 1, 1, 1, 1, 1,
1.205742, 1.018457, 1.598326, 1, 1, 1, 1, 1,
1.210022, -0.775798, 2.340612, 1, 1, 1, 1, 1,
1.212612, -1.337908, 0.6922916, 1, 1, 1, 1, 1,
1.21267, -0.09703601, 1.516325, 0, 0, 1, 1, 1,
1.227835, 0.8640535, 2.401124, 1, 0, 0, 1, 1,
1.227952, 1.910807, 1.348085, 1, 0, 0, 1, 1,
1.231229, -0.881907, 1.602777, 1, 0, 0, 1, 1,
1.231486, 0.5562028, 0.1668715, 1, 0, 0, 1, 1,
1.237017, -0.7499009, 2.760887, 1, 0, 0, 1, 1,
1.254472, -2.234085, 2.566271, 0, 0, 0, 1, 1,
1.263162, 0.9216135, 0.8324342, 0, 0, 0, 1, 1,
1.263605, -0.3847439, 3.143388, 0, 0, 0, 1, 1,
1.271991, 0.81898, 1.092249, 0, 0, 0, 1, 1,
1.283627, 1.436112, 0.3736815, 0, 0, 0, 1, 1,
1.28667, 0.7321909, 0.9250984, 0, 0, 0, 1, 1,
1.290487, -0.5973101, 1.253273, 0, 0, 0, 1, 1,
1.295976, -1.225445, 2.057522, 1, 1, 1, 1, 1,
1.300656, 0.5530736, 0.8617954, 1, 1, 1, 1, 1,
1.303164, 0.5374572, -0.3084333, 1, 1, 1, 1, 1,
1.305955, 0.3801553, 3.261896, 1, 1, 1, 1, 1,
1.315453, -0.2740991, 0.8317021, 1, 1, 1, 1, 1,
1.318402, 0.9114173, -0.5479805, 1, 1, 1, 1, 1,
1.319694, 1.041575, -0.10857, 1, 1, 1, 1, 1,
1.320735, 0.8582224, 0.3830125, 1, 1, 1, 1, 1,
1.321421, -0.320228, 2.009155, 1, 1, 1, 1, 1,
1.331483, 0.3973329, 0.4578207, 1, 1, 1, 1, 1,
1.334223, 1.487257, 1.59786, 1, 1, 1, 1, 1,
1.336088, -0.1913498, 1.510575, 1, 1, 1, 1, 1,
1.339408, 0.2967848, 0.5628941, 1, 1, 1, 1, 1,
1.343196, 0.4510137, 1.755664, 1, 1, 1, 1, 1,
1.344562, 1.207567, 1.880553, 1, 1, 1, 1, 1,
1.351968, 1.370596, -1.377991, 0, 0, 1, 1, 1,
1.354858, -0.9886929, 0.7518546, 1, 0, 0, 1, 1,
1.356275, 1.494253, -0.3820898, 1, 0, 0, 1, 1,
1.357949, 0.3123282, 0.8976271, 1, 0, 0, 1, 1,
1.366566, -1.352859, 1.053084, 1, 0, 0, 1, 1,
1.369365, 1.837226, 1.284592, 1, 0, 0, 1, 1,
1.372303, -0.7676883, 1.734542, 0, 0, 0, 1, 1,
1.390255, 0.09880465, 2.812691, 0, 0, 0, 1, 1,
1.399507, -0.3466943, 1.650261, 0, 0, 0, 1, 1,
1.407979, 0.5291088, 1.092816, 0, 0, 0, 1, 1,
1.408888, 0.6060377, 1.052404, 0, 0, 0, 1, 1,
1.428583, 0.3210495, 0.08496377, 0, 0, 0, 1, 1,
1.439583, -0.06678762, 1.702551, 0, 0, 0, 1, 1,
1.441481, 0.725186, 1.400898, 1, 1, 1, 1, 1,
1.458723, 1.247242, -0.5496847, 1, 1, 1, 1, 1,
1.465129, 1.205811, 0.01568932, 1, 1, 1, 1, 1,
1.468446, -0.9445269, 0.8678122, 1, 1, 1, 1, 1,
1.478017, 0.1847696, 0.9995009, 1, 1, 1, 1, 1,
1.490812, 1.020555, 0.4238586, 1, 1, 1, 1, 1,
1.49882, -2.614155, 2.538795, 1, 1, 1, 1, 1,
1.5025, -1.397061, 1.937156, 1, 1, 1, 1, 1,
1.509073, -0.5572824, 3.143485, 1, 1, 1, 1, 1,
1.518863, 0.4835969, -0.1140399, 1, 1, 1, 1, 1,
1.529578, 2.289951, 1.726864, 1, 1, 1, 1, 1,
1.553725, 0.2533613, 3.328321, 1, 1, 1, 1, 1,
1.582411, 1.342694, -0.1162775, 1, 1, 1, 1, 1,
1.605646, -1.056258, 1.414989, 1, 1, 1, 1, 1,
1.616203, 1.519393, 1.893828, 1, 1, 1, 1, 1,
1.620526, -1.855425, 1.084189, 0, 0, 1, 1, 1,
1.621483, 1.230541, 0.6556356, 1, 0, 0, 1, 1,
1.625186, -1.959649, 3.038145, 1, 0, 0, 1, 1,
1.627576, 2.704058, 1.822324, 1, 0, 0, 1, 1,
1.640967, -0.5268242, 1.93644, 1, 0, 0, 1, 1,
1.669207, 0.6728792, 0.6369196, 1, 0, 0, 1, 1,
1.671372, 0.483099, 1.267872, 0, 0, 0, 1, 1,
1.674591, -1.122951, 4.199705, 0, 0, 0, 1, 1,
1.684649, 0.4097942, 2.320464, 0, 0, 0, 1, 1,
1.706842, -0.3385962, 1.040108, 0, 0, 0, 1, 1,
1.709576, -0.3219175, 2.751602, 0, 0, 0, 1, 1,
1.729365, 0.01420667, 1.287348, 0, 0, 0, 1, 1,
1.751081, 0.5588675, 1.776666, 0, 0, 0, 1, 1,
1.754694, -0.1229461, 0.9907505, 1, 1, 1, 1, 1,
1.796939, -1.635361, 3.458205, 1, 1, 1, 1, 1,
1.821897, 0.878877, 1.967632, 1, 1, 1, 1, 1,
1.831773, -0.948074, 3.939796, 1, 1, 1, 1, 1,
1.839945, 0.5673898, 0.08707793, 1, 1, 1, 1, 1,
1.890276, -0.1238839, 1.692894, 1, 1, 1, 1, 1,
1.921875, 1.529679, 0.7495955, 1, 1, 1, 1, 1,
1.92355, 0.7362176, 1.512, 1, 1, 1, 1, 1,
1.929497, 0.4496758, 0.6821266, 1, 1, 1, 1, 1,
1.957046, 0.1050249, 2.409579, 1, 1, 1, 1, 1,
1.962555, 1.470171, 1.412902, 1, 1, 1, 1, 1,
1.977177, 1.460432, 0.6241627, 1, 1, 1, 1, 1,
1.979747, 0.9118768, 1.358885, 1, 1, 1, 1, 1,
1.980311, -1.370757, 3.482661, 1, 1, 1, 1, 1,
1.997018, 0.2873712, 1.51281, 1, 1, 1, 1, 1,
1.999992, 0.4060733, -1.567965, 0, 0, 1, 1, 1,
2.037486, 3.015311, 1.279288, 1, 0, 0, 1, 1,
2.074331, -0.7041503, 2.102952, 1, 0, 0, 1, 1,
2.082065, -1.298714, 2.37428, 1, 0, 0, 1, 1,
2.082929, -0.5315126, 1.285596, 1, 0, 0, 1, 1,
2.205514, -1.429824, 3.370967, 1, 0, 0, 1, 1,
2.221403, -0.448507, 3.477059, 0, 0, 0, 1, 1,
2.254419, 1.436041, -0.274398, 0, 0, 0, 1, 1,
2.274565, 0.8761202, 2.450445, 0, 0, 0, 1, 1,
2.314271, 1.712115, 2.261609, 0, 0, 0, 1, 1,
2.421135, 1.342757, -0.1796899, 0, 0, 0, 1, 1,
2.57409, -1.282714, 2.067364, 0, 0, 0, 1, 1,
2.618656, 1.677488, 0.8791225, 0, 0, 0, 1, 1,
2.650077, -0.6813845, 1.966882, 1, 1, 1, 1, 1,
2.756115, 0.1791081, 1.979206, 1, 1, 1, 1, 1,
2.826989, -0.5106695, 2.305537, 1, 1, 1, 1, 1,
2.848347, -1.301038, 0.09059414, 1, 1, 1, 1, 1,
3.006116, -0.5069557, 1.150812, 1, 1, 1, 1, 1,
3.196574, -1.27894, 2.861495, 1, 1, 1, 1, 1,
3.733881, 0.1935517, 3.436621, 1, 1, 1, 1, 1
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
var radius = 9.621408;
var distance = 33.79479;
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
mvMatrix.translate( -0.1372871, -0.132195, 0.2434919 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79479);
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
