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
-2.956646, -0.5073684, -2.162245, 1, 0, 0, 1,
-2.950521, -0.8980886, -0.8428664, 1, 0.007843138, 0, 1,
-2.926954, 3.243223, -0.8408996, 1, 0.01176471, 0, 1,
-2.892309, 0.4784542, -0.6877948, 1, 0.01960784, 0, 1,
-2.796144, -0.1318895, -2.196487, 1, 0.02352941, 0, 1,
-2.63455, -1.027278, -2.138021, 1, 0.03137255, 0, 1,
-2.55799, 1.324658, -0.3149122, 1, 0.03529412, 0, 1,
-2.460545, 0.9449753, 0.1176372, 1, 0.04313726, 0, 1,
-2.43864, -1.822971, -2.259908, 1, 0.04705882, 0, 1,
-2.420525, 1.012932, -1.361936, 1, 0.05490196, 0, 1,
-2.332036, -0.1920111, -1.610816, 1, 0.05882353, 0, 1,
-2.304192, 0.4257574, -1.03164, 1, 0.06666667, 0, 1,
-2.263055, 0.2140301, -1.212898, 1, 0.07058824, 0, 1,
-2.259103, 0.01059933, -0.7323732, 1, 0.07843138, 0, 1,
-2.199214, 0.8967562, -1.481569, 1, 0.08235294, 0, 1,
-2.19003, 0.6290818, -1.261438, 1, 0.09019608, 0, 1,
-2.157596, 0.938504, -2.456804, 1, 0.09411765, 0, 1,
-2.138429, 0.1403685, -2.244281, 1, 0.1019608, 0, 1,
-2.134535, 0.1395689, -0.7069166, 1, 0.1098039, 0, 1,
-2.125882, -0.216674, -1.684796, 1, 0.1137255, 0, 1,
-2.088207, 0.04871079, -3.278961, 1, 0.1215686, 0, 1,
-2.063136, -1.170353, -2.078845, 1, 0.1254902, 0, 1,
-2.043012, 1.532899, -1.753078, 1, 0.1333333, 0, 1,
-2.028896, -0.4622367, -0.9980365, 1, 0.1372549, 0, 1,
-2.024723, 0.2632623, -2.297884, 1, 0.145098, 0, 1,
-2.018919, -0.8764141, -2.436819, 1, 0.1490196, 0, 1,
-1.99716, 0.797303, -2.20073, 1, 0.1568628, 0, 1,
-1.980043, 1.457267, -0.3134781, 1, 0.1607843, 0, 1,
-1.970952, -0.7426836, -0.1829705, 1, 0.1686275, 0, 1,
-1.967051, -0.5858523, -1.394269, 1, 0.172549, 0, 1,
-1.94897, -0.2616929, -1.7565, 1, 0.1803922, 0, 1,
-1.936752, 0.8543663, -0.9085212, 1, 0.1843137, 0, 1,
-1.924767, -0.7709149, -1.654565, 1, 0.1921569, 0, 1,
-1.921892, -0.8708692, -2.342596, 1, 0.1960784, 0, 1,
-1.915442, 0.533403, -2.665736, 1, 0.2039216, 0, 1,
-1.91263, -0.3135011, -0.5745173, 1, 0.2117647, 0, 1,
-1.817006, 1.109412, -1.11281, 1, 0.2156863, 0, 1,
-1.811049, 1.157292, -0.496136, 1, 0.2235294, 0, 1,
-1.768079, -0.3079568, 0.08419775, 1, 0.227451, 0, 1,
-1.742562, 1.519885, -0.2541503, 1, 0.2352941, 0, 1,
-1.702337, -1.326551, -0.9605187, 1, 0.2392157, 0, 1,
-1.696598, 1.69196, -0.8456012, 1, 0.2470588, 0, 1,
-1.692692, -1.244924, -1.766085, 1, 0.2509804, 0, 1,
-1.69085, 0.5655616, -1.901451, 1, 0.2588235, 0, 1,
-1.686397, 0.1081851, -0.6839242, 1, 0.2627451, 0, 1,
-1.685888, 0.2712564, -1.025652, 1, 0.2705882, 0, 1,
-1.680725, -0.3779807, -2.559455, 1, 0.2745098, 0, 1,
-1.674065, -1.189692, -1.570334, 1, 0.282353, 0, 1,
-1.657436, 0.7418194, -2.396106, 1, 0.2862745, 0, 1,
-1.655271, -1.116869, -1.176804, 1, 0.2941177, 0, 1,
-1.633992, -0.05529541, -3.563042, 1, 0.3019608, 0, 1,
-1.633374, -0.80042, -3.281208, 1, 0.3058824, 0, 1,
-1.619556, 0.4877488, -1.189618, 1, 0.3137255, 0, 1,
-1.603534, 0.2687059, -1.198967, 1, 0.3176471, 0, 1,
-1.601683, 0.3249844, -1.426369, 1, 0.3254902, 0, 1,
-1.60145, 0.6999825, 1.117322, 1, 0.3294118, 0, 1,
-1.596968, -0.337085, -2.686469, 1, 0.3372549, 0, 1,
-1.574401, 1.641961, 0.2636859, 1, 0.3411765, 0, 1,
-1.570728, -0.04207646, -0.9367498, 1, 0.3490196, 0, 1,
-1.570667, -1.408838, -1.92963, 1, 0.3529412, 0, 1,
-1.568382, 0.742403, -0.8604825, 1, 0.3607843, 0, 1,
-1.559185, 1.396914, 0.02132832, 1, 0.3647059, 0, 1,
-1.548376, -0.8032358, -2.91544, 1, 0.372549, 0, 1,
-1.528063, -0.5081532, -3.248132, 1, 0.3764706, 0, 1,
-1.510391, -1.732779, -3.879833, 1, 0.3843137, 0, 1,
-1.506858, 0.5294022, 0.9700628, 1, 0.3882353, 0, 1,
-1.499916, 0.1359627, -1.566165, 1, 0.3960784, 0, 1,
-1.496939, -0.3961608, -1.394233, 1, 0.4039216, 0, 1,
-1.47293, 0.3259418, -1.024714, 1, 0.4078431, 0, 1,
-1.467066, 1.001026, -0.9140854, 1, 0.4156863, 0, 1,
-1.462848, 0.6507265, -1.492757, 1, 0.4196078, 0, 1,
-1.462277, -1.337711, -1.568743, 1, 0.427451, 0, 1,
-1.460571, 1.309323, -1.426211, 1, 0.4313726, 0, 1,
-1.457082, 0.2386837, -0.3429232, 1, 0.4392157, 0, 1,
-1.453774, 0.3744115, -1.331521, 1, 0.4431373, 0, 1,
-1.452294, -1.179912, -1.436045, 1, 0.4509804, 0, 1,
-1.450199, -0.1349503, -2.183176, 1, 0.454902, 0, 1,
-1.441192, 0.4347546, -2.063548, 1, 0.4627451, 0, 1,
-1.436836, -1.016133, -0.9898006, 1, 0.4666667, 0, 1,
-1.436343, 0.4663356, -1.411876, 1, 0.4745098, 0, 1,
-1.432458, -0.3647049, -2.518129, 1, 0.4784314, 0, 1,
-1.425422, -0.4027673, -3.551142, 1, 0.4862745, 0, 1,
-1.422245, -0.7441845, -1.308555, 1, 0.4901961, 0, 1,
-1.420898, 0.2421921, -1.549698, 1, 0.4980392, 0, 1,
-1.412006, 0.5249764, -1.074194, 1, 0.5058824, 0, 1,
-1.371716, 1.235653, 0.5903942, 1, 0.509804, 0, 1,
-1.367528, 0.3670902, -0.3624484, 1, 0.5176471, 0, 1,
-1.366284, 0.1512225, -2.777021, 1, 0.5215687, 0, 1,
-1.357268, -0.4817519, -2.366697, 1, 0.5294118, 0, 1,
-1.354953, 0.6272239, -2.220267, 1, 0.5333334, 0, 1,
-1.330253, 1.321203, -0.3695939, 1, 0.5411765, 0, 1,
-1.322489, 0.5036724, -3.819379, 1, 0.5450981, 0, 1,
-1.311365, 0.838532, -0.07987832, 1, 0.5529412, 0, 1,
-1.311328, 0.2484453, -2.372428, 1, 0.5568628, 0, 1,
-1.307158, -1.700287, -2.249452, 1, 0.5647059, 0, 1,
-1.30708, -0.4888827, -1.114255, 1, 0.5686275, 0, 1,
-1.284127, -1.130763, -3.499255, 1, 0.5764706, 0, 1,
-1.267684, -0.6939389, -1.086896, 1, 0.5803922, 0, 1,
-1.265676, -0.6271985, -2.228831, 1, 0.5882353, 0, 1,
-1.26405, 1.260157, -1.554741, 1, 0.5921569, 0, 1,
-1.262747, 1.205785, -1.282552, 1, 0.6, 0, 1,
-1.25607, 0.5354289, -0.1083296, 1, 0.6078432, 0, 1,
-1.255896, 0.04080329, -1.382072, 1, 0.6117647, 0, 1,
-1.253172, 0.350828, -0.5798925, 1, 0.6196079, 0, 1,
-1.2516, 0.09870874, -1.031991, 1, 0.6235294, 0, 1,
-1.246996, -0.7593548, -1.177707, 1, 0.6313726, 0, 1,
-1.244501, 0.5563221, -0.4018393, 1, 0.6352941, 0, 1,
-1.243624, -0.9352782, -4.861006, 1, 0.6431373, 0, 1,
-1.241722, -0.9040828, -2.896606, 1, 0.6470588, 0, 1,
-1.235975, -0.008651244, -1.167273, 1, 0.654902, 0, 1,
-1.233745, 0.2934334, -1.573362, 1, 0.6588235, 0, 1,
-1.22908, 1.135226, -0.5736347, 1, 0.6666667, 0, 1,
-1.210645, -0.8717728, -2.51808, 1, 0.6705883, 0, 1,
-1.207818, -0.6659267, -2.85743, 1, 0.6784314, 0, 1,
-1.205832, 0.7354826, 0.2961833, 1, 0.682353, 0, 1,
-1.193607, 0.06037088, -1.826756, 1, 0.6901961, 0, 1,
-1.191392, -0.9777573, -2.893499, 1, 0.6941177, 0, 1,
-1.187739, 0.2607495, -2.128173, 1, 0.7019608, 0, 1,
-1.182095, -0.6007606, -2.978803, 1, 0.7098039, 0, 1,
-1.180497, -0.107952, -1.658687, 1, 0.7137255, 0, 1,
-1.175642, -0.5829821, -0.7260593, 1, 0.7215686, 0, 1,
-1.17564, 1.451349, -2.012821, 1, 0.7254902, 0, 1,
-1.164534, 1.507606, -0.8326461, 1, 0.7333333, 0, 1,
-1.163865, 0.1209328, -2.462083, 1, 0.7372549, 0, 1,
-1.159078, 0.0281394, -1.500058, 1, 0.7450981, 0, 1,
-1.132063, -0.9094739, -0.4241183, 1, 0.7490196, 0, 1,
-1.131357, -0.4093918, -1.299702, 1, 0.7568628, 0, 1,
-1.131045, -0.8458291, -1.914498, 1, 0.7607843, 0, 1,
-1.130746, -0.4254311, 0.4733542, 1, 0.7686275, 0, 1,
-1.128538, 0.5373902, 0.06099475, 1, 0.772549, 0, 1,
-1.124646, -1.724434, -3.888942, 1, 0.7803922, 0, 1,
-1.122174, -0.3764538, -2.643769, 1, 0.7843137, 0, 1,
-1.121645, 0.06573536, 0.4297815, 1, 0.7921569, 0, 1,
-1.117862, 1.14946, -0.1728405, 1, 0.7960784, 0, 1,
-1.103197, -0.02412113, -1.296327, 1, 0.8039216, 0, 1,
-1.096608, -0.3177054, -1.855159, 1, 0.8117647, 0, 1,
-1.096322, 1.007229, -1.977244, 1, 0.8156863, 0, 1,
-1.09626, 1.629946, -0.9050573, 1, 0.8235294, 0, 1,
-1.090065, 1.358118, -1.675817, 1, 0.827451, 0, 1,
-1.083749, -0.2944442, -1.486508, 1, 0.8352941, 0, 1,
-1.08328, -2.106683, -2.413877, 1, 0.8392157, 0, 1,
-1.078975, 0.5315081, -1.951849, 1, 0.8470588, 0, 1,
-1.076478, -0.2408641, -3.122015, 1, 0.8509804, 0, 1,
-1.076272, 0.5554453, -2.982383, 1, 0.8588235, 0, 1,
-1.072314, -2.01576, -2.482745, 1, 0.8627451, 0, 1,
-1.070143, 1.377422, -0.02209508, 1, 0.8705882, 0, 1,
-1.068759, 0.014124, -2.56547, 1, 0.8745098, 0, 1,
-1.067031, -0.6297725, -2.120456, 1, 0.8823529, 0, 1,
-1.06566, 2.346768, -1.480198, 1, 0.8862745, 0, 1,
-1.055161, -0.2364582, -1.190633, 1, 0.8941177, 0, 1,
-1.047916, -1.502455, -3.955208, 1, 0.8980392, 0, 1,
-1.044961, -0.6808446, -2.739049, 1, 0.9058824, 0, 1,
-1.041337, -0.7626163, -1.299778, 1, 0.9137255, 0, 1,
-1.040138, -1.291194, -1.845704, 1, 0.9176471, 0, 1,
-1.037102, -0.5469943, -2.328433, 1, 0.9254902, 0, 1,
-1.022398, 0.09391647, -1.01679, 1, 0.9294118, 0, 1,
-1.017878, -0.31253, 0.2750288, 1, 0.9372549, 0, 1,
-1.016297, -0.07652105, -1.239223, 1, 0.9411765, 0, 1,
-1.011722, -0.2099799, -2.5937, 1, 0.9490196, 0, 1,
-1.010136, -0.1481132, -2.022189, 1, 0.9529412, 0, 1,
-1.007895, 1.633653, -2.493416, 1, 0.9607843, 0, 1,
-0.9940211, 0.998734, -2.273709, 1, 0.9647059, 0, 1,
-0.9863057, -1.075413, -1.845801, 1, 0.972549, 0, 1,
-0.9814153, -0.6934015, -1.880675, 1, 0.9764706, 0, 1,
-0.9783363, -0.6266772, -1.954099, 1, 0.9843137, 0, 1,
-0.9690239, -0.06190402, -3.807794, 1, 0.9882353, 0, 1,
-0.9633454, -1.153905, -2.541683, 1, 0.9960784, 0, 1,
-0.9625301, -0.4950745, -2.088565, 0.9960784, 1, 0, 1,
-0.9560047, 1.537058, 0.5786134, 0.9921569, 1, 0, 1,
-0.954279, -0.3364424, -0.6750987, 0.9843137, 1, 0, 1,
-0.953447, -0.1747645, -2.253523, 0.9803922, 1, 0, 1,
-0.9525661, -0.7291457, -1.147673, 0.972549, 1, 0, 1,
-0.9481748, -0.04814397, -0.2627022, 0.9686275, 1, 0, 1,
-0.9392225, -0.587246, -0.404358, 0.9607843, 1, 0, 1,
-0.9361821, -1.059944, -2.284148, 0.9568627, 1, 0, 1,
-0.9320958, 0.4396968, -1.941536, 0.9490196, 1, 0, 1,
-0.9288946, 0.7796506, 0.3224637, 0.945098, 1, 0, 1,
-0.9269915, 0.8623177, 0.8434256, 0.9372549, 1, 0, 1,
-0.9252425, -0.1411882, -1.268529, 0.9333333, 1, 0, 1,
-0.9219074, -0.7897078, -1.811853, 0.9254902, 1, 0, 1,
-0.9148325, 0.2046706, 0.2416704, 0.9215686, 1, 0, 1,
-0.913009, 0.4811023, -2.864357, 0.9137255, 1, 0, 1,
-0.9102448, 1.162111, -2.063225, 0.9098039, 1, 0, 1,
-0.9080578, 1.789708, -2.590517, 0.9019608, 1, 0, 1,
-0.907674, -1.18141, -3.601565, 0.8941177, 1, 0, 1,
-0.8998085, 1.908932, -0.6928252, 0.8901961, 1, 0, 1,
-0.8939098, -0.5366623, -1.31999, 0.8823529, 1, 0, 1,
-0.8934038, -1.74862, -4.906456, 0.8784314, 1, 0, 1,
-0.8782559, -1.348718, -1.803755, 0.8705882, 1, 0, 1,
-0.8781834, -0.2239631, -1.915737, 0.8666667, 1, 0, 1,
-0.8757715, -0.362958, -1.762976, 0.8588235, 1, 0, 1,
-0.8696481, -0.3168638, -3.011898, 0.854902, 1, 0, 1,
-0.8687881, 2.067634, 0.5640466, 0.8470588, 1, 0, 1,
-0.8586808, 1.81656, -1.315256, 0.8431373, 1, 0, 1,
-0.8499556, -2.144981, -3.684029, 0.8352941, 1, 0, 1,
-0.8492439, -0.9072824, -1.217494, 0.8313726, 1, 0, 1,
-0.8444462, -0.3293934, 0.04687031, 0.8235294, 1, 0, 1,
-0.8400041, -0.01112581, -3.254532, 0.8196079, 1, 0, 1,
-0.8354238, -0.4380525, -1.582928, 0.8117647, 1, 0, 1,
-0.8207758, 1.312535, -0.901552, 0.8078431, 1, 0, 1,
-0.8187882, 2.202579, 0.2827701, 0.8, 1, 0, 1,
-0.8128628, -0.5665799, -2.744076, 0.7921569, 1, 0, 1,
-0.8112673, 0.1409169, -2.873919, 0.7882353, 1, 0, 1,
-0.8068702, -0.1988009, -1.099738, 0.7803922, 1, 0, 1,
-0.806293, -0.9868913, -3.001877, 0.7764706, 1, 0, 1,
-0.8043248, 1.381679, 0.5305087, 0.7686275, 1, 0, 1,
-0.8018786, -0.3718765, -2.591104, 0.7647059, 1, 0, 1,
-0.7978514, -0.3378979, -1.990551, 0.7568628, 1, 0, 1,
-0.7923691, -0.7523658, -2.371855, 0.7529412, 1, 0, 1,
-0.7879174, -1.052625, -1.575489, 0.7450981, 1, 0, 1,
-0.7858562, 0.4832309, -2.042054, 0.7411765, 1, 0, 1,
-0.7825716, -0.3633349, -1.733172, 0.7333333, 1, 0, 1,
-0.7716451, -0.1601615, -2.572054, 0.7294118, 1, 0, 1,
-0.7711253, 0.4068186, -2.259584, 0.7215686, 1, 0, 1,
-0.7703035, 0.2963554, -2.06925, 0.7176471, 1, 0, 1,
-0.7646452, 1.888046, -0.07237613, 0.7098039, 1, 0, 1,
-0.7613865, 1.489451, -1.755046, 0.7058824, 1, 0, 1,
-0.7390109, 1.93645, -0.4394978, 0.6980392, 1, 0, 1,
-0.7388481, -0.9187026, -4.037745, 0.6901961, 1, 0, 1,
-0.73836, 0.9444398, -0.4254646, 0.6862745, 1, 0, 1,
-0.7372641, 0.3014972, -2.087757, 0.6784314, 1, 0, 1,
-0.7316257, 0.4278408, -2.095638, 0.6745098, 1, 0, 1,
-0.7277872, -0.04854681, -2.013715, 0.6666667, 1, 0, 1,
-0.724472, -0.1467417, -3.399435, 0.6627451, 1, 0, 1,
-0.7225237, 3.118328, -1.487903, 0.654902, 1, 0, 1,
-0.7197129, -1.40408, -0.973173, 0.6509804, 1, 0, 1,
-0.7170776, -0.7130451, -3.292021, 0.6431373, 1, 0, 1,
-0.7169044, 0.2419738, -2.836158, 0.6392157, 1, 0, 1,
-0.7156363, -0.04737809, -0.3992761, 0.6313726, 1, 0, 1,
-0.710779, 1.234483, -1.112731, 0.627451, 1, 0, 1,
-0.7071091, -0.8904602, -3.7104, 0.6196079, 1, 0, 1,
-0.7058225, -0.5194276, -0.4857239, 0.6156863, 1, 0, 1,
-0.7017372, 0.4414221, -0.4666623, 0.6078432, 1, 0, 1,
-0.7004245, 0.3593725, -0.8477787, 0.6039216, 1, 0, 1,
-0.6922465, -1.126531, -2.495804, 0.5960785, 1, 0, 1,
-0.6910131, 0.6405725, 0.1391854, 0.5882353, 1, 0, 1,
-0.6898016, 0.01477544, -1.082346, 0.5843138, 1, 0, 1,
-0.6871088, 0.2372143, -0.618065, 0.5764706, 1, 0, 1,
-0.6844624, 1.020134, -0.3315064, 0.572549, 1, 0, 1,
-0.6830012, -0.4547452, -1.662912, 0.5647059, 1, 0, 1,
-0.6795641, -0.6275961, -2.027689, 0.5607843, 1, 0, 1,
-0.6790915, 0.05385294, -2.783113, 0.5529412, 1, 0, 1,
-0.6732374, 0.02391707, -0.919857, 0.5490196, 1, 0, 1,
-0.6635467, -0.6515689, -1.919109, 0.5411765, 1, 0, 1,
-0.663228, 0.04341544, -1.836719, 0.5372549, 1, 0, 1,
-0.6628038, -0.9669886, -2.544541, 0.5294118, 1, 0, 1,
-0.6627828, -0.8671226, -3.827148, 0.5254902, 1, 0, 1,
-0.6615786, 0.7057329, -1.472224, 0.5176471, 1, 0, 1,
-0.6571007, 1.206319, -1.606556, 0.5137255, 1, 0, 1,
-0.6540997, -0.8624173, -2.561189, 0.5058824, 1, 0, 1,
-0.6492255, 0.4008343, -0.6137345, 0.5019608, 1, 0, 1,
-0.6489999, -0.07500426, -1.04423, 0.4941176, 1, 0, 1,
-0.6464044, 0.5185393, -3.018785, 0.4862745, 1, 0, 1,
-0.6437048, -0.8208497, -2.08252, 0.4823529, 1, 0, 1,
-0.6403733, 1.16536, 0.2610849, 0.4745098, 1, 0, 1,
-0.6400531, -0.1311265, -1.173088, 0.4705882, 1, 0, 1,
-0.6356397, 0.4848098, 0.6757949, 0.4627451, 1, 0, 1,
-0.6341307, -0.2170024, -2.221062, 0.4588235, 1, 0, 1,
-0.6279957, -1.555341, -2.0917, 0.4509804, 1, 0, 1,
-0.6262, -1.486979, -2.547508, 0.4470588, 1, 0, 1,
-0.6242488, 1.712916, -0.2461663, 0.4392157, 1, 0, 1,
-0.623009, -1.283147, -0.5954737, 0.4352941, 1, 0, 1,
-0.6206176, -0.6802037, -1.308069, 0.427451, 1, 0, 1,
-0.6196748, 0.9688445, -2.30313, 0.4235294, 1, 0, 1,
-0.6187106, 0.752933, -0.06361305, 0.4156863, 1, 0, 1,
-0.6087232, -0.3844645, -2.896196, 0.4117647, 1, 0, 1,
-0.608315, 0.6187281, -1.398181, 0.4039216, 1, 0, 1,
-0.6020887, 0.6613328, 0.05586831, 0.3960784, 1, 0, 1,
-0.597844, -1.214961, -2.363514, 0.3921569, 1, 0, 1,
-0.5942641, -1.181581, -1.62683, 0.3843137, 1, 0, 1,
-0.5915032, -0.506253, -3.400233, 0.3803922, 1, 0, 1,
-0.5905961, 1.027838, -0.4600008, 0.372549, 1, 0, 1,
-0.5883688, 1.813835, -1.272807, 0.3686275, 1, 0, 1,
-0.5756388, 0.902321, 0.06292418, 0.3607843, 1, 0, 1,
-0.5703802, 0.5435826, -1.757589, 0.3568628, 1, 0, 1,
-0.5678232, 1.092795, -0.9573224, 0.3490196, 1, 0, 1,
-0.5655259, 1.074468, -0.8369681, 0.345098, 1, 0, 1,
-0.5633892, -1.502405, -3.41832, 0.3372549, 1, 0, 1,
-0.5625924, -0.4053089, -1.994016, 0.3333333, 1, 0, 1,
-0.5623057, -0.9559563, -3.010393, 0.3254902, 1, 0, 1,
-0.5558507, 0.510542, 0.2946315, 0.3215686, 1, 0, 1,
-0.5366784, -2.044142, -3.488337, 0.3137255, 1, 0, 1,
-0.5361707, 0.8432243, -0.4528224, 0.3098039, 1, 0, 1,
-0.5358555, 0.09562832, -1.450994, 0.3019608, 1, 0, 1,
-0.5343239, 0.903491, 0.1648366, 0.2941177, 1, 0, 1,
-0.5310986, -0.3500767, -0.4602281, 0.2901961, 1, 0, 1,
-0.5293642, -0.2311809, -2.317852, 0.282353, 1, 0, 1,
-0.5266109, 0.818403, -0.7345344, 0.2784314, 1, 0, 1,
-0.5163859, -0.2941872, -3.341902, 0.2705882, 1, 0, 1,
-0.5148529, -2.296639, -1.616798, 0.2666667, 1, 0, 1,
-0.513821, 0.0188155, -2.711436, 0.2588235, 1, 0, 1,
-0.5103855, 0.09252414, -0.3260072, 0.254902, 1, 0, 1,
-0.5093643, 1.383361, -0.2146555, 0.2470588, 1, 0, 1,
-0.5058398, 2.068778, -0.7843149, 0.2431373, 1, 0, 1,
-0.5046709, -1.487877, -2.219065, 0.2352941, 1, 0, 1,
-0.4963838, -1.345937, -2.842816, 0.2313726, 1, 0, 1,
-0.4955662, 0.08576092, -1.153803, 0.2235294, 1, 0, 1,
-0.4911816, 0.2796232, -2.370827, 0.2196078, 1, 0, 1,
-0.4866998, 1.475057, -0.4369703, 0.2117647, 1, 0, 1,
-0.4845752, -0.9129736, -3.71387, 0.2078431, 1, 0, 1,
-0.477903, 2.148644, 0.6713926, 0.2, 1, 0, 1,
-0.4776061, 0.497947, -1.153703, 0.1921569, 1, 0, 1,
-0.4726468, -0.5090238, -3.652383, 0.1882353, 1, 0, 1,
-0.4712448, 0.05300767, -1.002607, 0.1803922, 1, 0, 1,
-0.4653421, 0.5757682, -1.581693, 0.1764706, 1, 0, 1,
-0.4650513, -0.457839, -1.106199, 0.1686275, 1, 0, 1,
-0.4648481, 0.4826443, 0.9763968, 0.1647059, 1, 0, 1,
-0.4625985, -1.416999, -4.082041, 0.1568628, 1, 0, 1,
-0.4594665, -0.1361723, -0.8281565, 0.1529412, 1, 0, 1,
-0.4583208, 2.380859, 0.57336, 0.145098, 1, 0, 1,
-0.4506936, -2.767898, -4.126437, 0.1411765, 1, 0, 1,
-0.4501011, -1.484433, -3.27417, 0.1333333, 1, 0, 1,
-0.4487014, 0.2719403, -1.298596, 0.1294118, 1, 0, 1,
-0.4472451, 0.8181335, 0.3339876, 0.1215686, 1, 0, 1,
-0.442386, 0.5628399, -1.945571, 0.1176471, 1, 0, 1,
-0.4359926, -0.5717632, -2.3333, 0.1098039, 1, 0, 1,
-0.433373, 0.2431158, -0.6914157, 0.1058824, 1, 0, 1,
-0.433301, -0.1929699, -2.011905, 0.09803922, 1, 0, 1,
-0.43074, 1.309587, -0.6575212, 0.09019608, 1, 0, 1,
-0.4271477, 1.385364, -0.6428899, 0.08627451, 1, 0, 1,
-0.426921, 0.715323, 1.63234, 0.07843138, 1, 0, 1,
-0.426551, 0.6742035, -1.052836, 0.07450981, 1, 0, 1,
-0.4216097, 0.3262613, -0.3362874, 0.06666667, 1, 0, 1,
-0.4204493, -0.1246596, -3.641561, 0.0627451, 1, 0, 1,
-0.4117593, 0.7357597, -0.7023557, 0.05490196, 1, 0, 1,
-0.4093209, 0.7238242, -2.042191, 0.05098039, 1, 0, 1,
-0.4092454, 1.24655, 0.4644009, 0.04313726, 1, 0, 1,
-0.4087972, -0.6393309, -2.406301, 0.03921569, 1, 0, 1,
-0.407982, 0.7936186, -1.15575, 0.03137255, 1, 0, 1,
-0.4067781, -0.7405395, -1.886984, 0.02745098, 1, 0, 1,
-0.402291, 0.327568, -0.9720947, 0.01960784, 1, 0, 1,
-0.4002915, 0.1582851, -0.4088024, 0.01568628, 1, 0, 1,
-0.3994069, -0.8620179, -0.7318435, 0.007843138, 1, 0, 1,
-0.3931461, 0.8580622, 0.9201627, 0.003921569, 1, 0, 1,
-0.385922, -0.1321868, -2.765068, 0, 1, 0.003921569, 1,
-0.3833556, -2.322252, -1.572837, 0, 1, 0.01176471, 1,
-0.3785074, 1.111337, 0.5479372, 0, 1, 0.01568628, 1,
-0.3748184, -0.3919398, -4.173763, 0, 1, 0.02352941, 1,
-0.3713359, -0.9863502, -3.597246, 0, 1, 0.02745098, 1,
-0.3653877, 1.139531, -0.08440159, 0, 1, 0.03529412, 1,
-0.3610393, 0.8426649, 1.076662, 0, 1, 0.03921569, 1,
-0.3595313, -0.2165634, -1.844283, 0, 1, 0.04705882, 1,
-0.3581409, 0.9795654, -0.6526418, 0, 1, 0.05098039, 1,
-0.3503816, 0.4181574, -0.550101, 0, 1, 0.05882353, 1,
-0.3501787, -0.4471627, -3.066326, 0, 1, 0.0627451, 1,
-0.3478168, -0.1714383, -2.403248, 0, 1, 0.07058824, 1,
-0.3421549, 0.6413554, -1.031942, 0, 1, 0.07450981, 1,
-0.3408852, -0.287623, -1.012932, 0, 1, 0.08235294, 1,
-0.3381619, -0.2280071, -0.553048, 0, 1, 0.08627451, 1,
-0.3320929, -0.2733471, -1.222645, 0, 1, 0.09411765, 1,
-0.3268052, -0.1013848, -3.745595, 0, 1, 0.1019608, 1,
-0.3266525, 2.001586, 0.2626931, 0, 1, 0.1058824, 1,
-0.3240991, -1.417018, -2.382509, 0, 1, 0.1137255, 1,
-0.3195577, 0.9266894, 0.6512831, 0, 1, 0.1176471, 1,
-0.3193472, 0.3346757, -0.07335699, 0, 1, 0.1254902, 1,
-0.3178278, -0.6680471, -3.930022, 0, 1, 0.1294118, 1,
-0.3171148, 1.486567, -0.5633658, 0, 1, 0.1372549, 1,
-0.3159777, -0.4214718, -3.154528, 0, 1, 0.1411765, 1,
-0.314021, -1.250072, -0.8950938, 0, 1, 0.1490196, 1,
-0.3104639, -2.051351, -2.748502, 0, 1, 0.1529412, 1,
-0.3079169, 0.5644191, -1.89447, 0, 1, 0.1607843, 1,
-0.3058169, -1.029662, -3.074868, 0, 1, 0.1647059, 1,
-0.3006347, -0.2211088, -4.117869, 0, 1, 0.172549, 1,
-0.2992124, -0.8470272, -3.555261, 0, 1, 0.1764706, 1,
-0.2976974, -0.3545749, -0.05479468, 0, 1, 0.1843137, 1,
-0.2971169, 1.241064, 0.1911149, 0, 1, 0.1882353, 1,
-0.2969389, -0.08994769, -2.82127, 0, 1, 0.1960784, 1,
-0.2966751, 1.227581, -0.1510885, 0, 1, 0.2039216, 1,
-0.2963834, 1.970347, 0.3344351, 0, 1, 0.2078431, 1,
-0.2960365, -0.3880426, -0.6128517, 0, 1, 0.2156863, 1,
-0.2942872, 0.8689851, -1.532051, 0, 1, 0.2196078, 1,
-0.2942321, -0.8970822, -3.230435, 0, 1, 0.227451, 1,
-0.2931581, 0.126322, -1.450558, 0, 1, 0.2313726, 1,
-0.2908115, -0.3568216, -2.735475, 0, 1, 0.2392157, 1,
-0.2868305, 1.008105, -0.5521342, 0, 1, 0.2431373, 1,
-0.2865268, -1.345142, -4.54696, 0, 1, 0.2509804, 1,
-0.2847937, 0.2382999, -0.8935928, 0, 1, 0.254902, 1,
-0.2774038, -0.9684277, -0.9413373, 0, 1, 0.2627451, 1,
-0.2765211, -0.8388987, -1.880883, 0, 1, 0.2666667, 1,
-0.2762867, -0.8385744, -3.068905, 0, 1, 0.2745098, 1,
-0.273692, 1.063722, 0.2454017, 0, 1, 0.2784314, 1,
-0.2733585, 0.548429, 0.2931834, 0, 1, 0.2862745, 1,
-0.266092, -1.298528, -3.400661, 0, 1, 0.2901961, 1,
-0.2647015, -1.548421, -4.537273, 0, 1, 0.2980392, 1,
-0.2612962, 0.3013985, -1.03501, 0, 1, 0.3058824, 1,
-0.2568805, 0.3869681, -0.5946113, 0, 1, 0.3098039, 1,
-0.2547536, -0.9986073, -4.03705, 0, 1, 0.3176471, 1,
-0.2498232, -1.058802, -1.751094, 0, 1, 0.3215686, 1,
-0.244339, 1.783598, -1.744356, 0, 1, 0.3294118, 1,
-0.2395874, 1.341732, -1.408532, 0, 1, 0.3333333, 1,
-0.238574, -0.610405, -2.764926, 0, 1, 0.3411765, 1,
-0.2371452, 1.31488, -1.640261, 0, 1, 0.345098, 1,
-0.2335212, -0.2524294, -3.381824, 0, 1, 0.3529412, 1,
-0.2325137, 0.188075, -0.9896463, 0, 1, 0.3568628, 1,
-0.2318693, 1.11967, 2.440664, 0, 1, 0.3647059, 1,
-0.2295645, -0.9470429, -3.140825, 0, 1, 0.3686275, 1,
-0.2280346, -0.39555, -3.27372, 0, 1, 0.3764706, 1,
-0.2271803, 0.6397157, 0.3820067, 0, 1, 0.3803922, 1,
-0.2255879, 0.6743637, -0.6178429, 0, 1, 0.3882353, 1,
-0.2196804, 0.5014475, -0.07562641, 0, 1, 0.3921569, 1,
-0.2195873, 2.952336, 1.011312, 0, 1, 0.4, 1,
-0.2177777, 0.00930361, -2.676651, 0, 1, 0.4078431, 1,
-0.2170985, 0.5627099, 0.2783382, 0, 1, 0.4117647, 1,
-0.2156575, -0.7224612, -4.420178, 0, 1, 0.4196078, 1,
-0.2090423, -0.8273925, -1.776251, 0, 1, 0.4235294, 1,
-0.2057779, -0.1389484, -1.750762, 0, 1, 0.4313726, 1,
-0.2049852, 0.5711699, -0.4037358, 0, 1, 0.4352941, 1,
-0.204517, 1.738182, -0.2710939, 0, 1, 0.4431373, 1,
-0.2021146, -0.2637094, -2.447704, 0, 1, 0.4470588, 1,
-0.198776, -0.299879, -2.889132, 0, 1, 0.454902, 1,
-0.1979365, 0.8682661, 0.5920404, 0, 1, 0.4588235, 1,
-0.1970215, 0.3640211, 0.2551802, 0, 1, 0.4666667, 1,
-0.1957359, -1.326397, -3.54994, 0, 1, 0.4705882, 1,
-0.1912329, 0.7457191, -0.07698565, 0, 1, 0.4784314, 1,
-0.1859172, -0.4915248, -2.719323, 0, 1, 0.4823529, 1,
-0.1850482, -0.07354511, -2.282188, 0, 1, 0.4901961, 1,
-0.1831482, -0.4981304, -2.091931, 0, 1, 0.4941176, 1,
-0.1808117, 0.3021736, -0.5116959, 0, 1, 0.5019608, 1,
-0.1807287, -1.641198, -1.396973, 0, 1, 0.509804, 1,
-0.1806939, 0.3095084, -1.137612, 0, 1, 0.5137255, 1,
-0.1773722, -1.182824, -1.876955, 0, 1, 0.5215687, 1,
-0.1736737, 0.7705576, -0.5239744, 0, 1, 0.5254902, 1,
-0.1695468, -0.6512617, -1.157372, 0, 1, 0.5333334, 1,
-0.1684062, 0.8417404, -0.09063721, 0, 1, 0.5372549, 1,
-0.1679232, 0.6500344, -1.168076, 0, 1, 0.5450981, 1,
-0.1661076, 0.6202151, -0.455565, 0, 1, 0.5490196, 1,
-0.1628566, -1.531266, -1.481585, 0, 1, 0.5568628, 1,
-0.1606636, -0.7260236, -5.094476, 0, 1, 0.5607843, 1,
-0.1601403, 1.400173, -0.7813035, 0, 1, 0.5686275, 1,
-0.1584413, -0.1353431, -2.282738, 0, 1, 0.572549, 1,
-0.1579475, -0.4428949, -1.649567, 0, 1, 0.5803922, 1,
-0.1550014, 0.5287284, 0.4937885, 0, 1, 0.5843138, 1,
-0.1547712, -0.698246, -4.041107, 0, 1, 0.5921569, 1,
-0.1532345, 0.4004675, 0.3034097, 0, 1, 0.5960785, 1,
-0.1488629, -0.0438133, -1.330604, 0, 1, 0.6039216, 1,
-0.1488423, -0.3579529, -3.87502, 0, 1, 0.6117647, 1,
-0.1456229, 0.4979873, 0.7353064, 0, 1, 0.6156863, 1,
-0.1418938, 0.8472522, 0.1569251, 0, 1, 0.6235294, 1,
-0.1376099, 0.3368959, -0.4431322, 0, 1, 0.627451, 1,
-0.1369293, 0.1567378, -1.765734, 0, 1, 0.6352941, 1,
-0.1363057, 1.197746, 1.014741, 0, 1, 0.6392157, 1,
-0.1353715, 1.285674, 0.5846769, 0, 1, 0.6470588, 1,
-0.1319764, 0.2902161, -0.9329613, 0, 1, 0.6509804, 1,
-0.1308373, 0.8288095, 1.463984, 0, 1, 0.6588235, 1,
-0.1304095, 0.4702135, 1.393467, 0, 1, 0.6627451, 1,
-0.1295129, -0.8859174, -1.683133, 0, 1, 0.6705883, 1,
-0.1271109, -0.7464152, -3.076715, 0, 1, 0.6745098, 1,
-0.1250947, -0.6510012, -1.459556, 0, 1, 0.682353, 1,
-0.1250085, 0.4384528, -1.646857, 0, 1, 0.6862745, 1,
-0.1155117, 1.838064, 0.4314882, 0, 1, 0.6941177, 1,
-0.1134556, 1.355106, -1.014434, 0, 1, 0.7019608, 1,
-0.1109447, -0.9235346, -4.481592, 0, 1, 0.7058824, 1,
-0.1089356, -0.7302361, -4.512321, 0, 1, 0.7137255, 1,
-0.1085814, 0.4529932, -0.7264255, 0, 1, 0.7176471, 1,
-0.09089724, -0.6851974, -3.097738, 0, 1, 0.7254902, 1,
-0.08947709, 1.139228, 0.8672798, 0, 1, 0.7294118, 1,
-0.08865489, -0.1912378, -1.921381, 0, 1, 0.7372549, 1,
-0.08290631, 0.2705519, -1.237013, 0, 1, 0.7411765, 1,
-0.07450989, 0.01179214, -1.02465, 0, 1, 0.7490196, 1,
-0.07195707, 1.753338, 1.574649, 0, 1, 0.7529412, 1,
-0.07044812, -0.3300152, -4.502911, 0, 1, 0.7607843, 1,
-0.06973793, -0.3289349, -2.246954, 0, 1, 0.7647059, 1,
-0.06503645, 0.5102463, 0.06705521, 0, 1, 0.772549, 1,
-0.06490967, 1.040967, 0.9610343, 0, 1, 0.7764706, 1,
-0.06264251, 2.702073, -0.430843, 0, 1, 0.7843137, 1,
-0.06105833, 1.456616, -2.042664, 0, 1, 0.7882353, 1,
-0.04539819, -0.3941549, -2.951035, 0, 1, 0.7960784, 1,
-0.04333586, -0.7603437, -3.432127, 0, 1, 0.8039216, 1,
-0.03951832, 1.064798, -0.9997811, 0, 1, 0.8078431, 1,
-0.03856372, -0.7981777, -1.768261, 0, 1, 0.8156863, 1,
-0.03763285, -0.9270083, -1.559564, 0, 1, 0.8196079, 1,
-0.03633732, -0.1750098, -2.156886, 0, 1, 0.827451, 1,
-0.03280067, -0.4296417, -2.363092, 0, 1, 0.8313726, 1,
-0.03156916, -0.8542062, -4.337487, 0, 1, 0.8392157, 1,
-0.02815834, -0.6942104, -2.271691, 0, 1, 0.8431373, 1,
-0.02456983, 1.209077, -0.799645, 0, 1, 0.8509804, 1,
-0.02200166, 1.017119, 0.6975802, 0, 1, 0.854902, 1,
-0.01944805, 0.9665662, 1.225571, 0, 1, 0.8627451, 1,
-0.01840171, 0.5559826, -0.4115773, 0, 1, 0.8666667, 1,
-0.01654332, 1.34771, -1.169057, 0, 1, 0.8745098, 1,
-0.01650748, 1.112016, 1.358981, 0, 1, 0.8784314, 1,
-0.0137019, 0.195134, 0.6231856, 0, 1, 0.8862745, 1,
-0.01191975, 0.06847843, -1.781991, 0, 1, 0.8901961, 1,
-0.009678584, 0.4071892, -0.6310624, 0, 1, 0.8980392, 1,
-0.007218448, -0.9718338, -4.694176, 0, 1, 0.9058824, 1,
-0.004712826, -0.1724322, -2.772953, 0, 1, 0.9098039, 1,
-0.003990591, -1.306409, -4.080399, 0, 1, 0.9176471, 1,
-0.003878616, -0.08432335, -3.917297, 0, 1, 0.9215686, 1,
-0.002994919, 2.295051, 0.8055012, 0, 1, 0.9294118, 1,
-0.001198714, -1.199668, -4.988476, 0, 1, 0.9333333, 1,
0.00138038, 0.7314349, -0.09300197, 0, 1, 0.9411765, 1,
0.001730851, -0.09006862, 2.663654, 0, 1, 0.945098, 1,
0.002065335, 0.1759367, -2.103706, 0, 1, 0.9529412, 1,
0.006627983, 0.5417712, 1.020497, 0, 1, 0.9568627, 1,
0.007030441, -0.4094799, 3.724936, 0, 1, 0.9647059, 1,
0.01059588, -0.881136, 3.828495, 0, 1, 0.9686275, 1,
0.01152404, -0.1575466, 2.806529, 0, 1, 0.9764706, 1,
0.01246664, -0.6022476, 1.17901, 0, 1, 0.9803922, 1,
0.01729598, 1.068391, -1.721485, 0, 1, 0.9882353, 1,
0.01958096, 0.8909175, 1.133233, 0, 1, 0.9921569, 1,
0.02459077, 0.5117774, 0.04775914, 0, 1, 1, 1,
0.02677573, -0.2490501, 4.564848, 0, 0.9921569, 1, 1,
0.02772751, 0.432607, 0.8694187, 0, 0.9882353, 1, 1,
0.02816853, -1.558363, 5.161259, 0, 0.9803922, 1, 1,
0.02880536, 0.5511192, 2.330295, 0, 0.9764706, 1, 1,
0.02883915, 0.2346385, -0.5025296, 0, 0.9686275, 1, 1,
0.03108663, -0.04899697, 1.791221, 0, 0.9647059, 1, 1,
0.03719794, -0.5284875, 4.019837, 0, 0.9568627, 1, 1,
0.03790013, -0.3197365, 1.777562, 0, 0.9529412, 1, 1,
0.03921219, -0.04245655, 3.792244, 0, 0.945098, 1, 1,
0.04217704, -0.3603273, 3.453161, 0, 0.9411765, 1, 1,
0.04332871, -0.9363657, 3.505612, 0, 0.9333333, 1, 1,
0.04411029, 1.179662, -1.073207, 0, 0.9294118, 1, 1,
0.05137593, 0.7923529, 0.1228248, 0, 0.9215686, 1, 1,
0.05172021, -0.559687, 2.409249, 0, 0.9176471, 1, 1,
0.05512134, 0.8838198, 0.9639354, 0, 0.9098039, 1, 1,
0.05597564, 1.950885, 0.4303702, 0, 0.9058824, 1, 1,
0.06052346, -0.4811454, 3.916914, 0, 0.8980392, 1, 1,
0.06190629, 1.608942, -1.061795, 0, 0.8901961, 1, 1,
0.06282763, -1.732495, 4.115, 0, 0.8862745, 1, 1,
0.06860439, -1.088869, 3.207066, 0, 0.8784314, 1, 1,
0.07068997, 0.7587654, -1.391291, 0, 0.8745098, 1, 1,
0.07387393, 0.9208522, 0.3376153, 0, 0.8666667, 1, 1,
0.07524072, 0.3034411, 0.7894229, 0, 0.8627451, 1, 1,
0.07635441, -0.3728757, 2.786265, 0, 0.854902, 1, 1,
0.07760242, -1.23492, 2.755881, 0, 0.8509804, 1, 1,
0.07988055, 1.63575, -0.8006797, 0, 0.8431373, 1, 1,
0.07993577, -0.1899066, 1.373229, 0, 0.8392157, 1, 1,
0.08235227, 0.9489245, 0.1220011, 0, 0.8313726, 1, 1,
0.08399432, 1.176152, 1.422813, 0, 0.827451, 1, 1,
0.08783432, 0.9783878, 0.3207766, 0, 0.8196079, 1, 1,
0.08936116, 0.9421626, 0.3181549, 0, 0.8156863, 1, 1,
0.09429418, -1.223713, 1.766592, 0, 0.8078431, 1, 1,
0.09531915, 0.7986529, 1.21515, 0, 0.8039216, 1, 1,
0.09854347, 0.1447913, -1.075823, 0, 0.7960784, 1, 1,
0.1011672, -0.1246232, 2.032916, 0, 0.7882353, 1, 1,
0.1012781, 0.10585, 2.124697, 0, 0.7843137, 1, 1,
0.1024656, 1.234569, 2.512881, 0, 0.7764706, 1, 1,
0.1033761, -2.10538, 2.910547, 0, 0.772549, 1, 1,
0.105527, 0.5433483, -0.1599703, 0, 0.7647059, 1, 1,
0.1090003, -0.6255233, 2.134197, 0, 0.7607843, 1, 1,
0.1150269, 0.6226972, -0.2085083, 0, 0.7529412, 1, 1,
0.1163324, 0.6573575, -0.3963247, 0, 0.7490196, 1, 1,
0.1184355, -0.6534259, 1.255062, 0, 0.7411765, 1, 1,
0.1187691, -1.493348, 3.695443, 0, 0.7372549, 1, 1,
0.122639, -0.208411, 1.287216, 0, 0.7294118, 1, 1,
0.1246727, 0.8761697, -0.5339702, 0, 0.7254902, 1, 1,
0.1271367, -0.3218413, 1.303661, 0, 0.7176471, 1, 1,
0.1288448, -0.8976992, 4.131507, 0, 0.7137255, 1, 1,
0.131621, 0.002381633, 1.733814, 0, 0.7058824, 1, 1,
0.1320456, -1.563831, 2.748644, 0, 0.6980392, 1, 1,
0.1418732, 0.4303177, -0.9536194, 0, 0.6941177, 1, 1,
0.1430688, 0.5554391, 0.5004532, 0, 0.6862745, 1, 1,
0.1441036, 0.7993041, -0.4964676, 0, 0.682353, 1, 1,
0.1461941, 0.1145187, 1.3645, 0, 0.6745098, 1, 1,
0.1475918, 1.017243, -0.9766299, 0, 0.6705883, 1, 1,
0.1516929, -0.4152399, 3.018695, 0, 0.6627451, 1, 1,
0.1535686, 0.6985415, 1.304847, 0, 0.6588235, 1, 1,
0.1537436, 0.2662112, 1.580209, 0, 0.6509804, 1, 1,
0.1558987, 1.134654, 1.784823, 0, 0.6470588, 1, 1,
0.159136, 0.9478181, 0.6123195, 0, 0.6392157, 1, 1,
0.1609782, 1.235101, -0.5307507, 0, 0.6352941, 1, 1,
0.1655643, 0.01621735, 2.068864, 0, 0.627451, 1, 1,
0.1673952, -0.1896594, 3.278638, 0, 0.6235294, 1, 1,
0.1708965, 2.027337, 2.348148, 0, 0.6156863, 1, 1,
0.173318, 0.7940799, 0.1890799, 0, 0.6117647, 1, 1,
0.1737233, -0.3417213, 4.039755, 0, 0.6039216, 1, 1,
0.1749598, 1.067661, -0.3950835, 0, 0.5960785, 1, 1,
0.1856547, -0.622219, 4.001573, 0, 0.5921569, 1, 1,
0.1930402, 0.8669683, 1.874596, 0, 0.5843138, 1, 1,
0.1934536, 0.1390861, 2.261004, 0, 0.5803922, 1, 1,
0.1948642, -0.7901775, 3.60099, 0, 0.572549, 1, 1,
0.1985991, 0.1690329, 1.269576, 0, 0.5686275, 1, 1,
0.1986138, -0.4825045, 1.147753, 0, 0.5607843, 1, 1,
0.2049602, 0.1566109, 2.075639, 0, 0.5568628, 1, 1,
0.2081971, -0.159349, 3.175379, 0, 0.5490196, 1, 1,
0.2104717, 0.9394512, -0.697818, 0, 0.5450981, 1, 1,
0.2116167, 1.517008, -0.4303752, 0, 0.5372549, 1, 1,
0.2122341, 0.3571003, 0.9707661, 0, 0.5333334, 1, 1,
0.2137616, 0.06484248, 0.8535321, 0, 0.5254902, 1, 1,
0.2145533, -1.143054, 2.997952, 0, 0.5215687, 1, 1,
0.214792, 0.6544107, 1.971455, 0, 0.5137255, 1, 1,
0.2151174, 0.4392258, -0.3964053, 0, 0.509804, 1, 1,
0.2156956, -0.1751658, 2.649107, 0, 0.5019608, 1, 1,
0.2213881, -0.3566353, 2.456852, 0, 0.4941176, 1, 1,
0.222677, 1.511661, -0.240205, 0, 0.4901961, 1, 1,
0.2264121, 1.411569, 0.4735408, 0, 0.4823529, 1, 1,
0.2332178, 1.342559, -0.7826278, 0, 0.4784314, 1, 1,
0.2355645, 0.8612942, -0.8246589, 0, 0.4705882, 1, 1,
0.2356071, -0.5846428, 3.500739, 0, 0.4666667, 1, 1,
0.2373535, 1.362751, 1.413921, 0, 0.4588235, 1, 1,
0.2425632, 0.6428649, -1.900797, 0, 0.454902, 1, 1,
0.252553, 0.565926, -1.336393, 0, 0.4470588, 1, 1,
0.2530028, 0.3368514, 0.4332052, 0, 0.4431373, 1, 1,
0.253964, -1.783395, 3.715327, 0, 0.4352941, 1, 1,
0.2545864, -2.506703, 3.037436, 0, 0.4313726, 1, 1,
0.2607689, -0.05151307, 1.928909, 0, 0.4235294, 1, 1,
0.2615286, 1.052085, -0.3262963, 0, 0.4196078, 1, 1,
0.2653904, -0.5312352, 2.654721, 0, 0.4117647, 1, 1,
0.265652, 1.658585, -1.041658, 0, 0.4078431, 1, 1,
0.2659964, -1.289018, 1.787948, 0, 0.4, 1, 1,
0.2660502, 0.4831015, 2.171579, 0, 0.3921569, 1, 1,
0.2692423, 1.386089, -0.2593297, 0, 0.3882353, 1, 1,
0.2748252, 0.8859939, 0.5120116, 0, 0.3803922, 1, 1,
0.2756512, -0.4653698, 3.067353, 0, 0.3764706, 1, 1,
0.2761003, -0.9301268, 2.914021, 0, 0.3686275, 1, 1,
0.2763519, 0.3599491, 1.152409, 0, 0.3647059, 1, 1,
0.2926019, 0.1745389, 1.37426, 0, 0.3568628, 1, 1,
0.2991374, -0.213811, 1.85408, 0, 0.3529412, 1, 1,
0.2996054, -1.371907, 4.987107, 0, 0.345098, 1, 1,
0.3054213, -0.9292041, 2.225707, 0, 0.3411765, 1, 1,
0.3099862, -1.357041, 3.320437, 0, 0.3333333, 1, 1,
0.3199881, 1.684727, 1.656179, 0, 0.3294118, 1, 1,
0.3247893, 0.4652199, -0.02351938, 0, 0.3215686, 1, 1,
0.3277683, 0.4749315, 1.916672, 0, 0.3176471, 1, 1,
0.3292512, -2.066573, 4.883016, 0, 0.3098039, 1, 1,
0.3309226, 1.24534, 1.092507, 0, 0.3058824, 1, 1,
0.3329443, -0.4187258, 0.6114815, 0, 0.2980392, 1, 1,
0.3331174, -0.0100953, 2.437676, 0, 0.2901961, 1, 1,
0.3356174, 0.3101571, 1.314776, 0, 0.2862745, 1, 1,
0.3382782, -0.8026094, 3.447692, 0, 0.2784314, 1, 1,
0.3506484, 0.6711399, 0.456975, 0, 0.2745098, 1, 1,
0.3513955, 1.257515, 0.261101, 0, 0.2666667, 1, 1,
0.3596937, -2.085936, 3.418878, 0, 0.2627451, 1, 1,
0.3598312, 0.240874, -0.4807741, 0, 0.254902, 1, 1,
0.3631928, 0.6583118, 1.020344, 0, 0.2509804, 1, 1,
0.3645497, 0.07452588, -0.4117339, 0, 0.2431373, 1, 1,
0.3648973, 0.09980316, 0.03290648, 0, 0.2392157, 1, 1,
0.3721579, 1.399675, 0.4450478, 0, 0.2313726, 1, 1,
0.3775408, -0.9846833, 1.602661, 0, 0.227451, 1, 1,
0.3776631, 0.8150914, 0.5741594, 0, 0.2196078, 1, 1,
0.3820229, 0.7564972, 0.3845022, 0, 0.2156863, 1, 1,
0.3832591, -1.69618, 5.089075, 0, 0.2078431, 1, 1,
0.3860534, 0.02665895, 2.210936, 0, 0.2039216, 1, 1,
0.3891953, 2.297027, 0.7894123, 0, 0.1960784, 1, 1,
0.3973061, 0.8442678, 1.172109, 0, 0.1882353, 1, 1,
0.4013742, 0.1843909, 0.4070014, 0, 0.1843137, 1, 1,
0.4028119, -0.02735333, 0.8738801, 0, 0.1764706, 1, 1,
0.4031208, 0.5863104, 0.4634241, 0, 0.172549, 1, 1,
0.4051676, -0.4599754, 3.09857, 0, 0.1647059, 1, 1,
0.4053439, 0.7570767, 0.3650281, 0, 0.1607843, 1, 1,
0.415361, -0.4591776, 3.003033, 0, 0.1529412, 1, 1,
0.4166727, 0.3845549, 0.294994, 0, 0.1490196, 1, 1,
0.4180596, -1.373495, 3.017817, 0, 0.1411765, 1, 1,
0.4189116, 1.277556, 1.178356, 0, 0.1372549, 1, 1,
0.4235514, 0.5736413, 2.942417, 0, 0.1294118, 1, 1,
0.4276256, 0.6273654, 0.5830587, 0, 0.1254902, 1, 1,
0.4316178, 1.767606, 1.815696, 0, 0.1176471, 1, 1,
0.4343127, -0.5626599, 3.890231, 0, 0.1137255, 1, 1,
0.4365281, 0.1821968, 1.091913, 0, 0.1058824, 1, 1,
0.4372053, -3.741174, 4.095418, 0, 0.09803922, 1, 1,
0.4386701, 0.3581853, -0.4503139, 0, 0.09411765, 1, 1,
0.4393753, -0.8415858, 3.122223, 0, 0.08627451, 1, 1,
0.4402022, -0.710938, 2.612134, 0, 0.08235294, 1, 1,
0.4440624, 0.6492805, 0.4753312, 0, 0.07450981, 1, 1,
0.444755, 0.1203639, 1.621874, 0, 0.07058824, 1, 1,
0.4452568, -0.3619183, 0.9994524, 0, 0.0627451, 1, 1,
0.4454872, 0.9044268, 1.086348, 0, 0.05882353, 1, 1,
0.4455472, -1.070876, 0.7400391, 0, 0.05098039, 1, 1,
0.4480209, 1.000274, 1.679958, 0, 0.04705882, 1, 1,
0.4520133, -0.488691, 3.244474, 0, 0.03921569, 1, 1,
0.4594887, 0.6394519, 1.179005, 0, 0.03529412, 1, 1,
0.4612326, -0.1344211, 0.3070292, 0, 0.02745098, 1, 1,
0.4671285, -0.1790457, 0.6645153, 0, 0.02352941, 1, 1,
0.4673959, 0.8360883, -0.3021637, 0, 0.01568628, 1, 1,
0.4687716, -0.3068882, 1.44202, 0, 0.01176471, 1, 1,
0.4694479, 2.447871, -1.161553, 0, 0.003921569, 1, 1,
0.4708926, -0.6600068, 1.679181, 0.003921569, 0, 1, 1,
0.4775937, -0.7033983, 1.806078, 0.007843138, 0, 1, 1,
0.4798983, 0.6899748, 1.277242, 0.01568628, 0, 1, 1,
0.486602, -0.9091277, 1.8362, 0.01960784, 0, 1, 1,
0.4886393, -1.028935, 2.776215, 0.02745098, 0, 1, 1,
0.4916634, -0.7060544, 2.761848, 0.03137255, 0, 1, 1,
0.4955641, 0.1590314, 1.775496, 0.03921569, 0, 1, 1,
0.4955978, -0.6074393, 4.266465, 0.04313726, 0, 1, 1,
0.4964779, 0.1559722, 1.5427, 0.05098039, 0, 1, 1,
0.5116012, -0.1533522, 1.988431, 0.05490196, 0, 1, 1,
0.5156599, 0.7944456, 1.480237, 0.0627451, 0, 1, 1,
0.5162537, 0.9310731, -0.8461213, 0.06666667, 0, 1, 1,
0.5180307, 0.5385929, 0.6955815, 0.07450981, 0, 1, 1,
0.5192194, -0.8434735, 2.188972, 0.07843138, 0, 1, 1,
0.5236123, 0.9152861, 1.990351, 0.08627451, 0, 1, 1,
0.5237743, 1.047619, 1.347874, 0.09019608, 0, 1, 1,
0.5247849, 0.2322922, 0.4230032, 0.09803922, 0, 1, 1,
0.5263955, 1.43383, -0.1886421, 0.1058824, 0, 1, 1,
0.5339382, 0.20587, 1.244313, 0.1098039, 0, 1, 1,
0.5354192, 0.2330432, 0.3002881, 0.1176471, 0, 1, 1,
0.5378574, 0.2358744, 2.290431, 0.1215686, 0, 1, 1,
0.5379978, 1.063624, 0.139576, 0.1294118, 0, 1, 1,
0.5413219, 0.06880554, 0.8370629, 0.1333333, 0, 1, 1,
0.5452025, -0.4350349, 1.786252, 0.1411765, 0, 1, 1,
0.5470707, -0.4093896, 3.70475, 0.145098, 0, 1, 1,
0.5471137, 0.5826819, 1.049783, 0.1529412, 0, 1, 1,
0.5490908, 0.9981322, 1.589296, 0.1568628, 0, 1, 1,
0.553546, -1.49139, 2.189932, 0.1647059, 0, 1, 1,
0.5538084, 1.011231, 1.736903, 0.1686275, 0, 1, 1,
0.555094, 0.3547093, 2.099889, 0.1764706, 0, 1, 1,
0.5605294, -1.315953, 1.548767, 0.1803922, 0, 1, 1,
0.5607088, -1.036119, 1.740419, 0.1882353, 0, 1, 1,
0.5612919, 1.161305, 0.1669927, 0.1921569, 0, 1, 1,
0.5653815, -0.5301298, 2.139655, 0.2, 0, 1, 1,
0.5683497, -0.4648353, 2.015987, 0.2078431, 0, 1, 1,
0.5712751, 0.7233874, 0.1012202, 0.2117647, 0, 1, 1,
0.5727937, -0.5287164, 4.504027, 0.2196078, 0, 1, 1,
0.576161, 1.896727, 1.433458, 0.2235294, 0, 1, 1,
0.5794307, -1.763172, 1.498567, 0.2313726, 0, 1, 1,
0.5820154, 2.004489, 0.9325052, 0.2352941, 0, 1, 1,
0.5821978, -0.5625307, 2.568376, 0.2431373, 0, 1, 1,
0.5853205, -0.5346081, 2.77118, 0.2470588, 0, 1, 1,
0.5872471, -1.616132, 2.613502, 0.254902, 0, 1, 1,
0.5886518, 2.095198, 1.274759, 0.2588235, 0, 1, 1,
0.5902833, 0.453281, 1.373009, 0.2666667, 0, 1, 1,
0.5950794, 0.6550055, 2.018583, 0.2705882, 0, 1, 1,
0.5953462, 1.629768, -0.6910989, 0.2784314, 0, 1, 1,
0.5971287, -0.8902129, 3.552643, 0.282353, 0, 1, 1,
0.5983024, -1.597835, 3.4837, 0.2901961, 0, 1, 1,
0.6057231, -0.05436011, 2.375441, 0.2941177, 0, 1, 1,
0.6071507, -1.076932, 3.409746, 0.3019608, 0, 1, 1,
0.6098978, 2.908594, -0.8784979, 0.3098039, 0, 1, 1,
0.6125886, -0.9315346, 1.841558, 0.3137255, 0, 1, 1,
0.6148016, -0.04792596, 2.597985, 0.3215686, 0, 1, 1,
0.6160853, -0.5797919, 0.8223865, 0.3254902, 0, 1, 1,
0.6214083, 0.5611472, -0.1281093, 0.3333333, 0, 1, 1,
0.6265659, -0.3913572, 1.854243, 0.3372549, 0, 1, 1,
0.6268603, 0.1683565, 1.413356, 0.345098, 0, 1, 1,
0.6319425, 0.2774799, 0.76815, 0.3490196, 0, 1, 1,
0.6323208, -1.323944, 1.290637, 0.3568628, 0, 1, 1,
0.6339043, -0.1566489, 1.386316, 0.3607843, 0, 1, 1,
0.6360149, 0.3592916, 1.609415, 0.3686275, 0, 1, 1,
0.6379012, -0.1917059, 2.013114, 0.372549, 0, 1, 1,
0.6402841, 1.346486, 0.1646156, 0.3803922, 0, 1, 1,
0.6438044, 1.244485, 3.364823, 0.3843137, 0, 1, 1,
0.6442794, -0.09872365, 0.4332774, 0.3921569, 0, 1, 1,
0.6443703, 1.563273, 0.6306792, 0.3960784, 0, 1, 1,
0.6459929, 0.266884, 0.8663095, 0.4039216, 0, 1, 1,
0.6487501, -1.034746, 3.68469, 0.4117647, 0, 1, 1,
0.6494191, 0.01781516, 2.859368, 0.4156863, 0, 1, 1,
0.6498526, 0.9701474, 2.061967, 0.4235294, 0, 1, 1,
0.6570704, -0.6971328, 1.889735, 0.427451, 0, 1, 1,
0.6611056, 0.612941, 1.180751, 0.4352941, 0, 1, 1,
0.6611166, -0.7024881, 3.00852, 0.4392157, 0, 1, 1,
0.6624911, 0.8949606, 1.593888, 0.4470588, 0, 1, 1,
0.6734171, -0.1912296, 0.9257389, 0.4509804, 0, 1, 1,
0.6782536, 0.1725083, 0.688331, 0.4588235, 0, 1, 1,
0.6824486, -1.160288, 1.940538, 0.4627451, 0, 1, 1,
0.6858801, 0.4883711, 2.151767, 0.4705882, 0, 1, 1,
0.6907446, 0.2933956, 2.030474, 0.4745098, 0, 1, 1,
0.6924234, -1.062413, 3.420154, 0.4823529, 0, 1, 1,
0.6966991, -2.252474, 2.986936, 0.4862745, 0, 1, 1,
0.7094198, -1.443523, 3.60165, 0.4941176, 0, 1, 1,
0.7100949, -1.164749, 1.166823, 0.5019608, 0, 1, 1,
0.7102966, 0.8340057, 0.04406917, 0.5058824, 0, 1, 1,
0.712935, -0.04948947, 0.4412604, 0.5137255, 0, 1, 1,
0.7170196, 0.3923455, 0.822136, 0.5176471, 0, 1, 1,
0.7177147, 1.362662, 0.3022286, 0.5254902, 0, 1, 1,
0.7194929, 0.1690325, 2.038393, 0.5294118, 0, 1, 1,
0.7209674, -0.1391583, 3.271401, 0.5372549, 0, 1, 1,
0.7258946, 0.5039165, -0.1482674, 0.5411765, 0, 1, 1,
0.7261823, 0.3032136, 1.627575, 0.5490196, 0, 1, 1,
0.7265527, -1.74895, 3.57728, 0.5529412, 0, 1, 1,
0.7386891, 0.1420077, 3.549699, 0.5607843, 0, 1, 1,
0.7416556, 0.2357324, 0.5437046, 0.5647059, 0, 1, 1,
0.7446721, 0.9443281, 1.274258, 0.572549, 0, 1, 1,
0.7515419, -0.8346623, 2.224423, 0.5764706, 0, 1, 1,
0.7556581, 0.9743263, 1.210949, 0.5843138, 0, 1, 1,
0.7683978, -0.3111762, 1.970022, 0.5882353, 0, 1, 1,
0.7727755, -0.2808111, 0.3812577, 0.5960785, 0, 1, 1,
0.774538, -0.570513, 1.771348, 0.6039216, 0, 1, 1,
0.7759393, -0.3339393, 2.1035, 0.6078432, 0, 1, 1,
0.7792248, -1.284646, 2.67826, 0.6156863, 0, 1, 1,
0.7830887, 1.221769, 0.09569954, 0.6196079, 0, 1, 1,
0.7872459, -0.2685379, 1.951735, 0.627451, 0, 1, 1,
0.7890959, -1.65145, 2.16552, 0.6313726, 0, 1, 1,
0.7917286, -0.4652974, 4.108007, 0.6392157, 0, 1, 1,
0.794841, -0.5654772, 0.9396461, 0.6431373, 0, 1, 1,
0.7954395, 0.06891104, 1.092797, 0.6509804, 0, 1, 1,
0.8026291, -0.4142462, 2.179995, 0.654902, 0, 1, 1,
0.8042264, 0.2899079, 2.911504, 0.6627451, 0, 1, 1,
0.8072939, -1.247138, 2.361958, 0.6666667, 0, 1, 1,
0.8118703, 0.8176268, 1.372632, 0.6745098, 0, 1, 1,
0.8138816, 0.316263, 0.06800251, 0.6784314, 0, 1, 1,
0.8164243, 0.76845, 0.8188701, 0.6862745, 0, 1, 1,
0.827675, -0.8857368, 3.378394, 0.6901961, 0, 1, 1,
0.8346513, -0.252468, 2.435421, 0.6980392, 0, 1, 1,
0.8367747, 0.6282316, 1.31483, 0.7058824, 0, 1, 1,
0.8375018, -1.264288, 1.326183, 0.7098039, 0, 1, 1,
0.8452057, -0.7994922, 1.409436, 0.7176471, 0, 1, 1,
0.8471878, 0.3622588, 1.191246, 0.7215686, 0, 1, 1,
0.8550576, -0.05842777, 1.10832, 0.7294118, 0, 1, 1,
0.8577043, -0.3170683, 1.743938, 0.7333333, 0, 1, 1,
0.8627114, -0.9451838, 3.169792, 0.7411765, 0, 1, 1,
0.865172, -0.4314568, 3.121434, 0.7450981, 0, 1, 1,
0.8658856, 0.3091098, 1.516325, 0.7529412, 0, 1, 1,
0.8704628, -0.9667925, 3.138182, 0.7568628, 0, 1, 1,
0.8759652, -0.1394965, 0.1836423, 0.7647059, 0, 1, 1,
0.8760836, 0.322704, 3.987729, 0.7686275, 0, 1, 1,
0.8793991, -0.7809092, 1.827674, 0.7764706, 0, 1, 1,
0.881599, 1.951347, -0.0729822, 0.7803922, 0, 1, 1,
0.8824039, -1.719281, 3.280205, 0.7882353, 0, 1, 1,
0.8913809, -0.8098906, 1.426722, 0.7921569, 0, 1, 1,
0.8926253, 1.084292, 0.6925763, 0.8, 0, 1, 1,
0.8975893, -0.2417779, 3.715015, 0.8078431, 0, 1, 1,
0.9070836, 0.773266, 2.362145, 0.8117647, 0, 1, 1,
0.9089211, -1.451885, 1.844495, 0.8196079, 0, 1, 1,
0.9094054, 0.003162359, 2.733861, 0.8235294, 0, 1, 1,
0.9134625, -0.5053957, 2.888417, 0.8313726, 0, 1, 1,
0.9161028, -0.2910912, 1.963529, 0.8352941, 0, 1, 1,
0.9184905, -0.0480161, 1.877, 0.8431373, 0, 1, 1,
0.9197989, 0.7816045, 0.7687168, 0.8470588, 0, 1, 1,
0.9233489, -0.4125672, 0.4590475, 0.854902, 0, 1, 1,
0.9371646, -0.1423894, 2.338598, 0.8588235, 0, 1, 1,
0.9387879, -0.1636733, 3.139127, 0.8666667, 0, 1, 1,
0.9495366, -0.6269193, 1.443188, 0.8705882, 0, 1, 1,
0.9607908, -0.9978056, 3.363594, 0.8784314, 0, 1, 1,
0.9612336, 1.229932, 1.404761, 0.8823529, 0, 1, 1,
0.9613106, 1.014581, -0.2037221, 0.8901961, 0, 1, 1,
0.9616657, 0.06316214, 1.694394, 0.8941177, 0, 1, 1,
0.962952, -0.4180807, 1.64766, 0.9019608, 0, 1, 1,
0.9672258, 0.2840365, 2.521823, 0.9098039, 0, 1, 1,
0.9672567, -1.626413, 2.735258, 0.9137255, 0, 1, 1,
0.9744393, -0.9755425, 4.904518, 0.9215686, 0, 1, 1,
0.9793099, 0.5328711, 1.553455, 0.9254902, 0, 1, 1,
0.9837104, 1.737001, 2.382314, 0.9333333, 0, 1, 1,
0.9848344, 0.003576913, 0.2416468, 0.9372549, 0, 1, 1,
0.9853844, 1.141735, -0.2916965, 0.945098, 0, 1, 1,
0.9864626, -0.2888652, 1.628128, 0.9490196, 0, 1, 1,
0.9951572, 2.524648, 1.14131, 0.9568627, 0, 1, 1,
1.00259, -0.1013489, 1.283775, 0.9607843, 0, 1, 1,
1.006462, -0.6878851, 0.1690069, 0.9686275, 0, 1, 1,
1.007692, -2.056665, 2.656083, 0.972549, 0, 1, 1,
1.012577, -0.3757336, 1.405649, 0.9803922, 0, 1, 1,
1.033253, -0.1696358, 2.772227, 0.9843137, 0, 1, 1,
1.033291, 1.188536, 1.150365, 0.9921569, 0, 1, 1,
1.03395, 1.04091, -0.4876506, 0.9960784, 0, 1, 1,
1.039364, 1.940152, -1.324223, 1, 0, 0.9960784, 1,
1.044557, -1.314019, 2.558309, 1, 0, 0.9882353, 1,
1.046306, 2.324377, 1.429498, 1, 0, 0.9843137, 1,
1.04896, -1.136845, 2.220441, 1, 0, 0.9764706, 1,
1.052482, 0.5493593, 0.6383805, 1, 0, 0.972549, 1,
1.059631, -0.5506828, 1.501992, 1, 0, 0.9647059, 1,
1.062024, 0.3163498, -0.5742398, 1, 0, 0.9607843, 1,
1.062502, -0.4899144, 2.278889, 1, 0, 0.9529412, 1,
1.063853, 1.467896, 1.024929, 1, 0, 0.9490196, 1,
1.063905, -1.382066, 3.276332, 1, 0, 0.9411765, 1,
1.065281, 0.291276, 3.647465, 1, 0, 0.9372549, 1,
1.06814, -0.2664872, 1.348826, 1, 0, 0.9294118, 1,
1.076332, 0.3200667, 2.39953, 1, 0, 0.9254902, 1,
1.087155, 1.118563, 1.932711, 1, 0, 0.9176471, 1,
1.095026, 0.8337475, 1.834412, 1, 0, 0.9137255, 1,
1.095885, -0.06072774, 1.962548, 1, 0, 0.9058824, 1,
1.116848, -1.34314, 1.254894, 1, 0, 0.9019608, 1,
1.117425, -2.131178, 3.435592, 1, 0, 0.8941177, 1,
1.122854, 0.7155661, 0.5098016, 1, 0, 0.8862745, 1,
1.124907, -0.3944988, 2.444788, 1, 0, 0.8823529, 1,
1.127345, -0.04263562, 3.502079, 1, 0, 0.8745098, 1,
1.128446, 0.4983993, 1.317838, 1, 0, 0.8705882, 1,
1.13322, -0.9639429, 1.941097, 1, 0, 0.8627451, 1,
1.13325, -0.5565782, 1.897847, 1, 0, 0.8588235, 1,
1.137656, -0.4999956, 2.199517, 1, 0, 0.8509804, 1,
1.138976, 0.6908535, 1.847024, 1, 0, 0.8470588, 1,
1.141907, 0.8308745, 0.1210225, 1, 0, 0.8392157, 1,
1.146002, 1.103028, 1.028058, 1, 0, 0.8352941, 1,
1.149404, 0.6585062, 2.097791, 1, 0, 0.827451, 1,
1.153491, 1.36628, -0.1834986, 1, 0, 0.8235294, 1,
1.155359, -0.1233592, 0.791303, 1, 0, 0.8156863, 1,
1.158082, -0.20111, 1.911446, 1, 0, 0.8117647, 1,
1.162906, -1.440194, 2.155141, 1, 0, 0.8039216, 1,
1.164651, 1.702049, 1.178651, 1, 0, 0.7960784, 1,
1.16857, 0.4177582, 1.560346, 1, 0, 0.7921569, 1,
1.171812, 0.9002376, -0.05171804, 1, 0, 0.7843137, 1,
1.18003, -1.645449, 3.9267, 1, 0, 0.7803922, 1,
1.180627, -1.552229, 3.091491, 1, 0, 0.772549, 1,
1.184603, 0.9217857, 1.854774, 1, 0, 0.7686275, 1,
1.187878, 0.2780604, 1.85413, 1, 0, 0.7607843, 1,
1.189373, 0.2296113, 1.718998, 1, 0, 0.7568628, 1,
1.192928, 1.220127, 1.527193, 1, 0, 0.7490196, 1,
1.205377, 1.218463, 0.2204141, 1, 0, 0.7450981, 1,
1.207363, -0.8585432, 1.996639, 1, 0, 0.7372549, 1,
1.207511, -0.636103, 0.4398049, 1, 0, 0.7333333, 1,
1.207905, -1.949493, 2.151613, 1, 0, 0.7254902, 1,
1.211295, -0.9047067, 2.210548, 1, 0, 0.7215686, 1,
1.218114, 1.401551, 2.414028, 1, 0, 0.7137255, 1,
1.220462, 0.3223294, 0.4645028, 1, 0, 0.7098039, 1,
1.221925, -1.737344, 1.560121, 1, 0, 0.7019608, 1,
1.224774, -2.298279, 1.750517, 1, 0, 0.6941177, 1,
1.22938, -1.431622, 1.883632, 1, 0, 0.6901961, 1,
1.23432, -0.7775907, 2.879488, 1, 0, 0.682353, 1,
1.250604, -0.08298792, 3.86288, 1, 0, 0.6784314, 1,
1.266543, 0.2980769, 0.9166434, 1, 0, 0.6705883, 1,
1.269866, 0.09517027, 2.388845, 1, 0, 0.6666667, 1,
1.272606, 1.257391, 1.185552, 1, 0, 0.6588235, 1,
1.272987, -0.1819694, 3.610522, 1, 0, 0.654902, 1,
1.284177, 0.9191015, 1.379899, 1, 0, 0.6470588, 1,
1.291479, 0.3402652, 0.7440838, 1, 0, 0.6431373, 1,
1.293838, 0.195016, 2.624449, 1, 0, 0.6352941, 1,
1.298144, -0.4962181, 1.739099, 1, 0, 0.6313726, 1,
1.299601, 1.238974, -0.6266789, 1, 0, 0.6235294, 1,
1.304827, -1.034105, 2.320475, 1, 0, 0.6196079, 1,
1.309555, -0.8941661, 0.7090173, 1, 0, 0.6117647, 1,
1.310158, -0.4870231, 3.410319, 1, 0, 0.6078432, 1,
1.312254, -0.4408188, 2.596424, 1, 0, 0.6, 1,
1.3167, -0.1393455, 1.978568, 1, 0, 0.5921569, 1,
1.31731, -0.8102939, 1.445857, 1, 0, 0.5882353, 1,
1.319792, -0.9731855, 2.204307, 1, 0, 0.5803922, 1,
1.329212, 0.9318631, 1.45849, 1, 0, 0.5764706, 1,
1.331355, 0.355715, 0.855721, 1, 0, 0.5686275, 1,
1.335608, 1.321639, 1.112787, 1, 0, 0.5647059, 1,
1.336866, -0.1716789, 2.546468, 1, 0, 0.5568628, 1,
1.339882, -1.155619, 1.419316, 1, 0, 0.5529412, 1,
1.340734, -0.8332707, 1.294175, 1, 0, 0.5450981, 1,
1.341749, -1.00078, 2.927535, 1, 0, 0.5411765, 1,
1.344597, -0.8938454, 3.107035, 1, 0, 0.5333334, 1,
1.356788, 0.04300239, 0.6630969, 1, 0, 0.5294118, 1,
1.361299, -0.8856072, 2.059925, 1, 0, 0.5215687, 1,
1.365288, -0.7478901, 1.700008, 1, 0, 0.5176471, 1,
1.367787, 0.4698731, 0.3900779, 1, 0, 0.509804, 1,
1.368739, 1.012973, -1.23319, 1, 0, 0.5058824, 1,
1.379783, 2.188704, -0.4791983, 1, 0, 0.4980392, 1,
1.387298, 0.4964625, 1.34292, 1, 0, 0.4901961, 1,
1.398922, 0.5836812, 1.232688, 1, 0, 0.4862745, 1,
1.399363, 0.1613798, 1.102825, 1, 0, 0.4784314, 1,
1.401452, -0.3940927, 2.846088, 1, 0, 0.4745098, 1,
1.415644, 0.297446, 1.840449, 1, 0, 0.4666667, 1,
1.423084, 0.3931437, 0.6353839, 1, 0, 0.4627451, 1,
1.424259, 1.414694, 2.612869, 1, 0, 0.454902, 1,
1.427357, 0.5364741, 0.5730495, 1, 0, 0.4509804, 1,
1.428903, 1.263554, 0.6778703, 1, 0, 0.4431373, 1,
1.431397, -0.5950705, 2.672438, 1, 0, 0.4392157, 1,
1.440583, -1.099585, 3.283067, 1, 0, 0.4313726, 1,
1.442447, 1.675887, 1.374111, 1, 0, 0.427451, 1,
1.443973, 1.395969, -1.68228, 1, 0, 0.4196078, 1,
1.449985, 0.890543, 2.957059, 1, 0, 0.4156863, 1,
1.464496, 1.414473, 0.8302484, 1, 0, 0.4078431, 1,
1.475119, 1.053241, 2.512167, 1, 0, 0.4039216, 1,
1.476996, 3.75206, -0.8640226, 1, 0, 0.3960784, 1,
1.492308, -1.901261, 2.711336, 1, 0, 0.3882353, 1,
1.494734, -1.227561, 1.761592, 1, 0, 0.3843137, 1,
1.497768, -0.4522139, 2.534254, 1, 0, 0.3764706, 1,
1.501061, -0.3035244, 2.229677, 1, 0, 0.372549, 1,
1.507802, 0.8236346, -0.04955233, 1, 0, 0.3647059, 1,
1.508325, 0.0911116, -0.3473236, 1, 0, 0.3607843, 1,
1.515095, -0.2234294, 2.776944, 1, 0, 0.3529412, 1,
1.526415, 0.6248081, 0.8421105, 1, 0, 0.3490196, 1,
1.527924, 0.8547256, 0.6382655, 1, 0, 0.3411765, 1,
1.535199, 0.1566328, 2.06731, 1, 0, 0.3372549, 1,
1.535817, 0.7574713, 0.2635341, 1, 0, 0.3294118, 1,
1.537431, -0.4675853, 2.365086, 1, 0, 0.3254902, 1,
1.559637, -1.328992, 2.22304, 1, 0, 0.3176471, 1,
1.560552, 0.763104, -0.7902112, 1, 0, 0.3137255, 1,
1.581035, -0.3343292, 0.6867588, 1, 0, 0.3058824, 1,
1.582982, 1.111203, 0.5259581, 1, 0, 0.2980392, 1,
1.596959, -0.4914666, 0.8542669, 1, 0, 0.2941177, 1,
1.597807, 0.04875707, 1.783124, 1, 0, 0.2862745, 1,
1.602844, -1.086046, 2.734212, 1, 0, 0.282353, 1,
1.603122, 1.980101, -0.1468652, 1, 0, 0.2745098, 1,
1.632749, -0.009512303, 1.401786, 1, 0, 0.2705882, 1,
1.635875, 0.8938818, 2.62195, 1, 0, 0.2627451, 1,
1.640406, 0.339975, 1.750283, 1, 0, 0.2588235, 1,
1.653777, -0.06097802, 1.582747, 1, 0, 0.2509804, 1,
1.662269, -0.01395301, 1.39398, 1, 0, 0.2470588, 1,
1.670715, 1.169634, 0.6384825, 1, 0, 0.2392157, 1,
1.704453, 0.8915127, 1.141623, 1, 0, 0.2352941, 1,
1.719497, 1.968168, 0.8530151, 1, 0, 0.227451, 1,
1.739301, 0.2666716, 0.1571018, 1, 0, 0.2235294, 1,
1.751252, -0.7577561, 1.157775, 1, 0, 0.2156863, 1,
1.75237, -0.5869721, 1.018957, 1, 0, 0.2117647, 1,
1.758581, 0.07381401, 1.285387, 1, 0, 0.2039216, 1,
1.771577, 0.4749132, 2.148496, 1, 0, 0.1960784, 1,
1.789024, -0.5672153, 1.451954, 1, 0, 0.1921569, 1,
1.799068, 0.7020452, 3.70319, 1, 0, 0.1843137, 1,
1.807625, 0.4699143, 1.412224, 1, 0, 0.1803922, 1,
1.816271, -0.6974025, 1.279616, 1, 0, 0.172549, 1,
1.841174, 1.339472, 0.7986448, 1, 0, 0.1686275, 1,
1.851717, -0.488575, -0.02034571, 1, 0, 0.1607843, 1,
1.858884, 0.8423736, 1.405524, 1, 0, 0.1568628, 1,
1.884801, -1.294881, 0.9181674, 1, 0, 0.1490196, 1,
1.900881, 0.06864136, 1.316079, 1, 0, 0.145098, 1,
1.924001, -0.02442953, 2.48393, 1, 0, 0.1372549, 1,
1.940279, -2.502527, 1.983777, 1, 0, 0.1333333, 1,
1.990325, -1.166196, 3.794866, 1, 0, 0.1254902, 1,
2.037266, -0.9755989, 2.947331, 1, 0, 0.1215686, 1,
2.083705, 0.3693022, 2.123071, 1, 0, 0.1137255, 1,
2.164481, 0.7773999, 1.532906, 1, 0, 0.1098039, 1,
2.196906, -0.5249891, 0.5832731, 1, 0, 0.1019608, 1,
2.198128, 0.3356775, 2.283546, 1, 0, 0.09411765, 1,
2.214384, 0.255359, 2.070535, 1, 0, 0.09019608, 1,
2.216398, 1.055843, -0.09944451, 1, 0, 0.08235294, 1,
2.220454, -0.5860695, 0.6653717, 1, 0, 0.07843138, 1,
2.26294, -1.032466, 2.83035, 1, 0, 0.07058824, 1,
2.270504, 0.9879234, 1.049804, 1, 0, 0.06666667, 1,
2.274841, -0.5842602, 0.1160919, 1, 0, 0.05882353, 1,
2.322968, 2.477945, 0.9154384, 1, 0, 0.05490196, 1,
2.402014, -1.767152, 3.077189, 1, 0, 0.04705882, 1,
2.752213, 0.07217619, 1.080224, 1, 0, 0.04313726, 1,
2.836155, 0.1684194, 2.412113, 1, 0, 0.03529412, 1,
3.063174, -1.249667, 0.2685705, 1, 0, 0.03137255, 1,
3.219198, 1.88384, 0.04233503, 1, 0, 0.02352941, 1,
3.315986, 0.54187, 1.725557, 1, 0, 0.01960784, 1,
3.723162, -1.264938, 1.955864, 1, 0, 0.01176471, 1,
3.803036, -0.9753248, 1.598448, 1, 0, 0.007843138, 1
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
0.4231949, -5.011277, -6.832823, 0, -0.5, 0.5, 0.5,
0.4231949, -5.011277, -6.832823, 1, -0.5, 0.5, 0.5,
0.4231949, -5.011277, -6.832823, 1, 1.5, 0.5, 0.5,
0.4231949, -5.011277, -6.832823, 0, 1.5, 0.5, 0.5
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
-4.102413, 0.005443454, -6.832823, 0, -0.5, 0.5, 0.5,
-4.102413, 0.005443454, -6.832823, 1, -0.5, 0.5, 0.5,
-4.102413, 0.005443454, -6.832823, 1, 1.5, 0.5, 0.5,
-4.102413, 0.005443454, -6.832823, 0, 1.5, 0.5, 0.5
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
-4.102413, -5.011277, 0.03339171, 0, -0.5, 0.5, 0.5,
-4.102413, -5.011277, 0.03339171, 1, -0.5, 0.5, 0.5,
-4.102413, -5.011277, 0.03339171, 1, 1.5, 0.5, 0.5,
-4.102413, -5.011277, 0.03339171, 0, 1.5, 0.5, 0.5
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
-2, -3.853572, -5.248312,
3, -3.853572, -5.248312,
-2, -3.853572, -5.248312,
-2, -4.046523, -5.512397,
-1, -3.853572, -5.248312,
-1, -4.046523, -5.512397,
0, -3.853572, -5.248312,
0, -4.046523, -5.512397,
1, -3.853572, -5.248312,
1, -4.046523, -5.512397,
2, -3.853572, -5.248312,
2, -4.046523, -5.512397,
3, -3.853572, -5.248312,
3, -4.046523, -5.512397
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
-2, -4.432425, -6.040567, 0, -0.5, 0.5, 0.5,
-2, -4.432425, -6.040567, 1, -0.5, 0.5, 0.5,
-2, -4.432425, -6.040567, 1, 1.5, 0.5, 0.5,
-2, -4.432425, -6.040567, 0, 1.5, 0.5, 0.5,
-1, -4.432425, -6.040567, 0, -0.5, 0.5, 0.5,
-1, -4.432425, -6.040567, 1, -0.5, 0.5, 0.5,
-1, -4.432425, -6.040567, 1, 1.5, 0.5, 0.5,
-1, -4.432425, -6.040567, 0, 1.5, 0.5, 0.5,
0, -4.432425, -6.040567, 0, -0.5, 0.5, 0.5,
0, -4.432425, -6.040567, 1, -0.5, 0.5, 0.5,
0, -4.432425, -6.040567, 1, 1.5, 0.5, 0.5,
0, -4.432425, -6.040567, 0, 1.5, 0.5, 0.5,
1, -4.432425, -6.040567, 0, -0.5, 0.5, 0.5,
1, -4.432425, -6.040567, 1, -0.5, 0.5, 0.5,
1, -4.432425, -6.040567, 1, 1.5, 0.5, 0.5,
1, -4.432425, -6.040567, 0, 1.5, 0.5, 0.5,
2, -4.432425, -6.040567, 0, -0.5, 0.5, 0.5,
2, -4.432425, -6.040567, 1, -0.5, 0.5, 0.5,
2, -4.432425, -6.040567, 1, 1.5, 0.5, 0.5,
2, -4.432425, -6.040567, 0, 1.5, 0.5, 0.5,
3, -4.432425, -6.040567, 0, -0.5, 0.5, 0.5,
3, -4.432425, -6.040567, 1, -0.5, 0.5, 0.5,
3, -4.432425, -6.040567, 1, 1.5, 0.5, 0.5,
3, -4.432425, -6.040567, 0, 1.5, 0.5, 0.5
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
-3.058042, -2, -5.248312,
-3.058042, 2, -5.248312,
-3.058042, -2, -5.248312,
-3.232104, -2, -5.512397,
-3.058042, 0, -5.248312,
-3.232104, 0, -5.512397,
-3.058042, 2, -5.248312,
-3.232104, 2, -5.512397
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
-3.580227, -2, -6.040567, 0, -0.5, 0.5, 0.5,
-3.580227, -2, -6.040567, 1, -0.5, 0.5, 0.5,
-3.580227, -2, -6.040567, 1, 1.5, 0.5, 0.5,
-3.580227, -2, -6.040567, 0, 1.5, 0.5, 0.5,
-3.580227, 0, -6.040567, 0, -0.5, 0.5, 0.5,
-3.580227, 0, -6.040567, 1, -0.5, 0.5, 0.5,
-3.580227, 0, -6.040567, 1, 1.5, 0.5, 0.5,
-3.580227, 0, -6.040567, 0, 1.5, 0.5, 0.5,
-3.580227, 2, -6.040567, 0, -0.5, 0.5, 0.5,
-3.580227, 2, -6.040567, 1, -0.5, 0.5, 0.5,
-3.580227, 2, -6.040567, 1, 1.5, 0.5, 0.5,
-3.580227, 2, -6.040567, 0, 1.5, 0.5, 0.5
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
-3.058042, -3.853572, -4,
-3.058042, -3.853572, 4,
-3.058042, -3.853572, -4,
-3.232104, -4.046523, -4,
-3.058042, -3.853572, -2,
-3.232104, -4.046523, -2,
-3.058042, -3.853572, 0,
-3.232104, -4.046523, 0,
-3.058042, -3.853572, 2,
-3.232104, -4.046523, 2,
-3.058042, -3.853572, 4,
-3.232104, -4.046523, 4
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
-3.580227, -4.432425, -4, 0, -0.5, 0.5, 0.5,
-3.580227, -4.432425, -4, 1, -0.5, 0.5, 0.5,
-3.580227, -4.432425, -4, 1, 1.5, 0.5, 0.5,
-3.580227, -4.432425, -4, 0, 1.5, 0.5, 0.5,
-3.580227, -4.432425, -2, 0, -0.5, 0.5, 0.5,
-3.580227, -4.432425, -2, 1, -0.5, 0.5, 0.5,
-3.580227, -4.432425, -2, 1, 1.5, 0.5, 0.5,
-3.580227, -4.432425, -2, 0, 1.5, 0.5, 0.5,
-3.580227, -4.432425, 0, 0, -0.5, 0.5, 0.5,
-3.580227, -4.432425, 0, 1, -0.5, 0.5, 0.5,
-3.580227, -4.432425, 0, 1, 1.5, 0.5, 0.5,
-3.580227, -4.432425, 0, 0, 1.5, 0.5, 0.5,
-3.580227, -4.432425, 2, 0, -0.5, 0.5, 0.5,
-3.580227, -4.432425, 2, 1, -0.5, 0.5, 0.5,
-3.580227, -4.432425, 2, 1, 1.5, 0.5, 0.5,
-3.580227, -4.432425, 2, 0, 1.5, 0.5, 0.5,
-3.580227, -4.432425, 4, 0, -0.5, 0.5, 0.5,
-3.580227, -4.432425, 4, 1, -0.5, 0.5, 0.5,
-3.580227, -4.432425, 4, 1, 1.5, 0.5, 0.5,
-3.580227, -4.432425, 4, 0, 1.5, 0.5, 0.5
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
-3.058042, -3.853572, -5.248312,
-3.058042, 3.864459, -5.248312,
-3.058042, -3.853572, 5.315095,
-3.058042, 3.864459, 5.315095,
-3.058042, -3.853572, -5.248312,
-3.058042, -3.853572, 5.315095,
-3.058042, 3.864459, -5.248312,
-3.058042, 3.864459, 5.315095,
-3.058042, -3.853572, -5.248312,
3.904431, -3.853572, -5.248312,
-3.058042, -3.853572, 5.315095,
3.904431, -3.853572, 5.315095,
-3.058042, 3.864459, -5.248312,
3.904431, 3.864459, -5.248312,
-3.058042, 3.864459, 5.315095,
3.904431, 3.864459, 5.315095,
3.904431, -3.853572, -5.248312,
3.904431, 3.864459, -5.248312,
3.904431, -3.853572, 5.315095,
3.904431, 3.864459, 5.315095,
3.904431, -3.853572, -5.248312,
3.904431, -3.853572, 5.315095,
3.904431, 3.864459, -5.248312,
3.904431, 3.864459, 5.315095
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
var radius = 7.913542;
var distance = 35.20824;
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
mvMatrix.translate( -0.4231949, -0.005443454, -0.03339171 );
mvMatrix.scale( 1.228913, 1.108609, 0.8099921 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20824);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flumetover<-read.table("flumetover.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flumetover$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
```

```r
y<-flumetover$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
```

```r
z<-flumetover$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
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
-2.956646, -0.5073684, -2.162245, 0, 0, 1, 1, 1,
-2.950521, -0.8980886, -0.8428664, 1, 0, 0, 1, 1,
-2.926954, 3.243223, -0.8408996, 1, 0, 0, 1, 1,
-2.892309, 0.4784542, -0.6877948, 1, 0, 0, 1, 1,
-2.796144, -0.1318895, -2.196487, 1, 0, 0, 1, 1,
-2.63455, -1.027278, -2.138021, 1, 0, 0, 1, 1,
-2.55799, 1.324658, -0.3149122, 0, 0, 0, 1, 1,
-2.460545, 0.9449753, 0.1176372, 0, 0, 0, 1, 1,
-2.43864, -1.822971, -2.259908, 0, 0, 0, 1, 1,
-2.420525, 1.012932, -1.361936, 0, 0, 0, 1, 1,
-2.332036, -0.1920111, -1.610816, 0, 0, 0, 1, 1,
-2.304192, 0.4257574, -1.03164, 0, 0, 0, 1, 1,
-2.263055, 0.2140301, -1.212898, 0, 0, 0, 1, 1,
-2.259103, 0.01059933, -0.7323732, 1, 1, 1, 1, 1,
-2.199214, 0.8967562, -1.481569, 1, 1, 1, 1, 1,
-2.19003, 0.6290818, -1.261438, 1, 1, 1, 1, 1,
-2.157596, 0.938504, -2.456804, 1, 1, 1, 1, 1,
-2.138429, 0.1403685, -2.244281, 1, 1, 1, 1, 1,
-2.134535, 0.1395689, -0.7069166, 1, 1, 1, 1, 1,
-2.125882, -0.216674, -1.684796, 1, 1, 1, 1, 1,
-2.088207, 0.04871079, -3.278961, 1, 1, 1, 1, 1,
-2.063136, -1.170353, -2.078845, 1, 1, 1, 1, 1,
-2.043012, 1.532899, -1.753078, 1, 1, 1, 1, 1,
-2.028896, -0.4622367, -0.9980365, 1, 1, 1, 1, 1,
-2.024723, 0.2632623, -2.297884, 1, 1, 1, 1, 1,
-2.018919, -0.8764141, -2.436819, 1, 1, 1, 1, 1,
-1.99716, 0.797303, -2.20073, 1, 1, 1, 1, 1,
-1.980043, 1.457267, -0.3134781, 1, 1, 1, 1, 1,
-1.970952, -0.7426836, -0.1829705, 0, 0, 1, 1, 1,
-1.967051, -0.5858523, -1.394269, 1, 0, 0, 1, 1,
-1.94897, -0.2616929, -1.7565, 1, 0, 0, 1, 1,
-1.936752, 0.8543663, -0.9085212, 1, 0, 0, 1, 1,
-1.924767, -0.7709149, -1.654565, 1, 0, 0, 1, 1,
-1.921892, -0.8708692, -2.342596, 1, 0, 0, 1, 1,
-1.915442, 0.533403, -2.665736, 0, 0, 0, 1, 1,
-1.91263, -0.3135011, -0.5745173, 0, 0, 0, 1, 1,
-1.817006, 1.109412, -1.11281, 0, 0, 0, 1, 1,
-1.811049, 1.157292, -0.496136, 0, 0, 0, 1, 1,
-1.768079, -0.3079568, 0.08419775, 0, 0, 0, 1, 1,
-1.742562, 1.519885, -0.2541503, 0, 0, 0, 1, 1,
-1.702337, -1.326551, -0.9605187, 0, 0, 0, 1, 1,
-1.696598, 1.69196, -0.8456012, 1, 1, 1, 1, 1,
-1.692692, -1.244924, -1.766085, 1, 1, 1, 1, 1,
-1.69085, 0.5655616, -1.901451, 1, 1, 1, 1, 1,
-1.686397, 0.1081851, -0.6839242, 1, 1, 1, 1, 1,
-1.685888, 0.2712564, -1.025652, 1, 1, 1, 1, 1,
-1.680725, -0.3779807, -2.559455, 1, 1, 1, 1, 1,
-1.674065, -1.189692, -1.570334, 1, 1, 1, 1, 1,
-1.657436, 0.7418194, -2.396106, 1, 1, 1, 1, 1,
-1.655271, -1.116869, -1.176804, 1, 1, 1, 1, 1,
-1.633992, -0.05529541, -3.563042, 1, 1, 1, 1, 1,
-1.633374, -0.80042, -3.281208, 1, 1, 1, 1, 1,
-1.619556, 0.4877488, -1.189618, 1, 1, 1, 1, 1,
-1.603534, 0.2687059, -1.198967, 1, 1, 1, 1, 1,
-1.601683, 0.3249844, -1.426369, 1, 1, 1, 1, 1,
-1.60145, 0.6999825, 1.117322, 1, 1, 1, 1, 1,
-1.596968, -0.337085, -2.686469, 0, 0, 1, 1, 1,
-1.574401, 1.641961, 0.2636859, 1, 0, 0, 1, 1,
-1.570728, -0.04207646, -0.9367498, 1, 0, 0, 1, 1,
-1.570667, -1.408838, -1.92963, 1, 0, 0, 1, 1,
-1.568382, 0.742403, -0.8604825, 1, 0, 0, 1, 1,
-1.559185, 1.396914, 0.02132832, 1, 0, 0, 1, 1,
-1.548376, -0.8032358, -2.91544, 0, 0, 0, 1, 1,
-1.528063, -0.5081532, -3.248132, 0, 0, 0, 1, 1,
-1.510391, -1.732779, -3.879833, 0, 0, 0, 1, 1,
-1.506858, 0.5294022, 0.9700628, 0, 0, 0, 1, 1,
-1.499916, 0.1359627, -1.566165, 0, 0, 0, 1, 1,
-1.496939, -0.3961608, -1.394233, 0, 0, 0, 1, 1,
-1.47293, 0.3259418, -1.024714, 0, 0, 0, 1, 1,
-1.467066, 1.001026, -0.9140854, 1, 1, 1, 1, 1,
-1.462848, 0.6507265, -1.492757, 1, 1, 1, 1, 1,
-1.462277, -1.337711, -1.568743, 1, 1, 1, 1, 1,
-1.460571, 1.309323, -1.426211, 1, 1, 1, 1, 1,
-1.457082, 0.2386837, -0.3429232, 1, 1, 1, 1, 1,
-1.453774, 0.3744115, -1.331521, 1, 1, 1, 1, 1,
-1.452294, -1.179912, -1.436045, 1, 1, 1, 1, 1,
-1.450199, -0.1349503, -2.183176, 1, 1, 1, 1, 1,
-1.441192, 0.4347546, -2.063548, 1, 1, 1, 1, 1,
-1.436836, -1.016133, -0.9898006, 1, 1, 1, 1, 1,
-1.436343, 0.4663356, -1.411876, 1, 1, 1, 1, 1,
-1.432458, -0.3647049, -2.518129, 1, 1, 1, 1, 1,
-1.425422, -0.4027673, -3.551142, 1, 1, 1, 1, 1,
-1.422245, -0.7441845, -1.308555, 1, 1, 1, 1, 1,
-1.420898, 0.2421921, -1.549698, 1, 1, 1, 1, 1,
-1.412006, 0.5249764, -1.074194, 0, 0, 1, 1, 1,
-1.371716, 1.235653, 0.5903942, 1, 0, 0, 1, 1,
-1.367528, 0.3670902, -0.3624484, 1, 0, 0, 1, 1,
-1.366284, 0.1512225, -2.777021, 1, 0, 0, 1, 1,
-1.357268, -0.4817519, -2.366697, 1, 0, 0, 1, 1,
-1.354953, 0.6272239, -2.220267, 1, 0, 0, 1, 1,
-1.330253, 1.321203, -0.3695939, 0, 0, 0, 1, 1,
-1.322489, 0.5036724, -3.819379, 0, 0, 0, 1, 1,
-1.311365, 0.838532, -0.07987832, 0, 0, 0, 1, 1,
-1.311328, 0.2484453, -2.372428, 0, 0, 0, 1, 1,
-1.307158, -1.700287, -2.249452, 0, 0, 0, 1, 1,
-1.30708, -0.4888827, -1.114255, 0, 0, 0, 1, 1,
-1.284127, -1.130763, -3.499255, 0, 0, 0, 1, 1,
-1.267684, -0.6939389, -1.086896, 1, 1, 1, 1, 1,
-1.265676, -0.6271985, -2.228831, 1, 1, 1, 1, 1,
-1.26405, 1.260157, -1.554741, 1, 1, 1, 1, 1,
-1.262747, 1.205785, -1.282552, 1, 1, 1, 1, 1,
-1.25607, 0.5354289, -0.1083296, 1, 1, 1, 1, 1,
-1.255896, 0.04080329, -1.382072, 1, 1, 1, 1, 1,
-1.253172, 0.350828, -0.5798925, 1, 1, 1, 1, 1,
-1.2516, 0.09870874, -1.031991, 1, 1, 1, 1, 1,
-1.246996, -0.7593548, -1.177707, 1, 1, 1, 1, 1,
-1.244501, 0.5563221, -0.4018393, 1, 1, 1, 1, 1,
-1.243624, -0.9352782, -4.861006, 1, 1, 1, 1, 1,
-1.241722, -0.9040828, -2.896606, 1, 1, 1, 1, 1,
-1.235975, -0.008651244, -1.167273, 1, 1, 1, 1, 1,
-1.233745, 0.2934334, -1.573362, 1, 1, 1, 1, 1,
-1.22908, 1.135226, -0.5736347, 1, 1, 1, 1, 1,
-1.210645, -0.8717728, -2.51808, 0, 0, 1, 1, 1,
-1.207818, -0.6659267, -2.85743, 1, 0, 0, 1, 1,
-1.205832, 0.7354826, 0.2961833, 1, 0, 0, 1, 1,
-1.193607, 0.06037088, -1.826756, 1, 0, 0, 1, 1,
-1.191392, -0.9777573, -2.893499, 1, 0, 0, 1, 1,
-1.187739, 0.2607495, -2.128173, 1, 0, 0, 1, 1,
-1.182095, -0.6007606, -2.978803, 0, 0, 0, 1, 1,
-1.180497, -0.107952, -1.658687, 0, 0, 0, 1, 1,
-1.175642, -0.5829821, -0.7260593, 0, 0, 0, 1, 1,
-1.17564, 1.451349, -2.012821, 0, 0, 0, 1, 1,
-1.164534, 1.507606, -0.8326461, 0, 0, 0, 1, 1,
-1.163865, 0.1209328, -2.462083, 0, 0, 0, 1, 1,
-1.159078, 0.0281394, -1.500058, 0, 0, 0, 1, 1,
-1.132063, -0.9094739, -0.4241183, 1, 1, 1, 1, 1,
-1.131357, -0.4093918, -1.299702, 1, 1, 1, 1, 1,
-1.131045, -0.8458291, -1.914498, 1, 1, 1, 1, 1,
-1.130746, -0.4254311, 0.4733542, 1, 1, 1, 1, 1,
-1.128538, 0.5373902, 0.06099475, 1, 1, 1, 1, 1,
-1.124646, -1.724434, -3.888942, 1, 1, 1, 1, 1,
-1.122174, -0.3764538, -2.643769, 1, 1, 1, 1, 1,
-1.121645, 0.06573536, 0.4297815, 1, 1, 1, 1, 1,
-1.117862, 1.14946, -0.1728405, 1, 1, 1, 1, 1,
-1.103197, -0.02412113, -1.296327, 1, 1, 1, 1, 1,
-1.096608, -0.3177054, -1.855159, 1, 1, 1, 1, 1,
-1.096322, 1.007229, -1.977244, 1, 1, 1, 1, 1,
-1.09626, 1.629946, -0.9050573, 1, 1, 1, 1, 1,
-1.090065, 1.358118, -1.675817, 1, 1, 1, 1, 1,
-1.083749, -0.2944442, -1.486508, 1, 1, 1, 1, 1,
-1.08328, -2.106683, -2.413877, 0, 0, 1, 1, 1,
-1.078975, 0.5315081, -1.951849, 1, 0, 0, 1, 1,
-1.076478, -0.2408641, -3.122015, 1, 0, 0, 1, 1,
-1.076272, 0.5554453, -2.982383, 1, 0, 0, 1, 1,
-1.072314, -2.01576, -2.482745, 1, 0, 0, 1, 1,
-1.070143, 1.377422, -0.02209508, 1, 0, 0, 1, 1,
-1.068759, 0.014124, -2.56547, 0, 0, 0, 1, 1,
-1.067031, -0.6297725, -2.120456, 0, 0, 0, 1, 1,
-1.06566, 2.346768, -1.480198, 0, 0, 0, 1, 1,
-1.055161, -0.2364582, -1.190633, 0, 0, 0, 1, 1,
-1.047916, -1.502455, -3.955208, 0, 0, 0, 1, 1,
-1.044961, -0.6808446, -2.739049, 0, 0, 0, 1, 1,
-1.041337, -0.7626163, -1.299778, 0, 0, 0, 1, 1,
-1.040138, -1.291194, -1.845704, 1, 1, 1, 1, 1,
-1.037102, -0.5469943, -2.328433, 1, 1, 1, 1, 1,
-1.022398, 0.09391647, -1.01679, 1, 1, 1, 1, 1,
-1.017878, -0.31253, 0.2750288, 1, 1, 1, 1, 1,
-1.016297, -0.07652105, -1.239223, 1, 1, 1, 1, 1,
-1.011722, -0.2099799, -2.5937, 1, 1, 1, 1, 1,
-1.010136, -0.1481132, -2.022189, 1, 1, 1, 1, 1,
-1.007895, 1.633653, -2.493416, 1, 1, 1, 1, 1,
-0.9940211, 0.998734, -2.273709, 1, 1, 1, 1, 1,
-0.9863057, -1.075413, -1.845801, 1, 1, 1, 1, 1,
-0.9814153, -0.6934015, -1.880675, 1, 1, 1, 1, 1,
-0.9783363, -0.6266772, -1.954099, 1, 1, 1, 1, 1,
-0.9690239, -0.06190402, -3.807794, 1, 1, 1, 1, 1,
-0.9633454, -1.153905, -2.541683, 1, 1, 1, 1, 1,
-0.9625301, -0.4950745, -2.088565, 1, 1, 1, 1, 1,
-0.9560047, 1.537058, 0.5786134, 0, 0, 1, 1, 1,
-0.954279, -0.3364424, -0.6750987, 1, 0, 0, 1, 1,
-0.953447, -0.1747645, -2.253523, 1, 0, 0, 1, 1,
-0.9525661, -0.7291457, -1.147673, 1, 0, 0, 1, 1,
-0.9481748, -0.04814397, -0.2627022, 1, 0, 0, 1, 1,
-0.9392225, -0.587246, -0.404358, 1, 0, 0, 1, 1,
-0.9361821, -1.059944, -2.284148, 0, 0, 0, 1, 1,
-0.9320958, 0.4396968, -1.941536, 0, 0, 0, 1, 1,
-0.9288946, 0.7796506, 0.3224637, 0, 0, 0, 1, 1,
-0.9269915, 0.8623177, 0.8434256, 0, 0, 0, 1, 1,
-0.9252425, -0.1411882, -1.268529, 0, 0, 0, 1, 1,
-0.9219074, -0.7897078, -1.811853, 0, 0, 0, 1, 1,
-0.9148325, 0.2046706, 0.2416704, 0, 0, 0, 1, 1,
-0.913009, 0.4811023, -2.864357, 1, 1, 1, 1, 1,
-0.9102448, 1.162111, -2.063225, 1, 1, 1, 1, 1,
-0.9080578, 1.789708, -2.590517, 1, 1, 1, 1, 1,
-0.907674, -1.18141, -3.601565, 1, 1, 1, 1, 1,
-0.8998085, 1.908932, -0.6928252, 1, 1, 1, 1, 1,
-0.8939098, -0.5366623, -1.31999, 1, 1, 1, 1, 1,
-0.8934038, -1.74862, -4.906456, 1, 1, 1, 1, 1,
-0.8782559, -1.348718, -1.803755, 1, 1, 1, 1, 1,
-0.8781834, -0.2239631, -1.915737, 1, 1, 1, 1, 1,
-0.8757715, -0.362958, -1.762976, 1, 1, 1, 1, 1,
-0.8696481, -0.3168638, -3.011898, 1, 1, 1, 1, 1,
-0.8687881, 2.067634, 0.5640466, 1, 1, 1, 1, 1,
-0.8586808, 1.81656, -1.315256, 1, 1, 1, 1, 1,
-0.8499556, -2.144981, -3.684029, 1, 1, 1, 1, 1,
-0.8492439, -0.9072824, -1.217494, 1, 1, 1, 1, 1,
-0.8444462, -0.3293934, 0.04687031, 0, 0, 1, 1, 1,
-0.8400041, -0.01112581, -3.254532, 1, 0, 0, 1, 1,
-0.8354238, -0.4380525, -1.582928, 1, 0, 0, 1, 1,
-0.8207758, 1.312535, -0.901552, 1, 0, 0, 1, 1,
-0.8187882, 2.202579, 0.2827701, 1, 0, 0, 1, 1,
-0.8128628, -0.5665799, -2.744076, 1, 0, 0, 1, 1,
-0.8112673, 0.1409169, -2.873919, 0, 0, 0, 1, 1,
-0.8068702, -0.1988009, -1.099738, 0, 0, 0, 1, 1,
-0.806293, -0.9868913, -3.001877, 0, 0, 0, 1, 1,
-0.8043248, 1.381679, 0.5305087, 0, 0, 0, 1, 1,
-0.8018786, -0.3718765, -2.591104, 0, 0, 0, 1, 1,
-0.7978514, -0.3378979, -1.990551, 0, 0, 0, 1, 1,
-0.7923691, -0.7523658, -2.371855, 0, 0, 0, 1, 1,
-0.7879174, -1.052625, -1.575489, 1, 1, 1, 1, 1,
-0.7858562, 0.4832309, -2.042054, 1, 1, 1, 1, 1,
-0.7825716, -0.3633349, -1.733172, 1, 1, 1, 1, 1,
-0.7716451, -0.1601615, -2.572054, 1, 1, 1, 1, 1,
-0.7711253, 0.4068186, -2.259584, 1, 1, 1, 1, 1,
-0.7703035, 0.2963554, -2.06925, 1, 1, 1, 1, 1,
-0.7646452, 1.888046, -0.07237613, 1, 1, 1, 1, 1,
-0.7613865, 1.489451, -1.755046, 1, 1, 1, 1, 1,
-0.7390109, 1.93645, -0.4394978, 1, 1, 1, 1, 1,
-0.7388481, -0.9187026, -4.037745, 1, 1, 1, 1, 1,
-0.73836, 0.9444398, -0.4254646, 1, 1, 1, 1, 1,
-0.7372641, 0.3014972, -2.087757, 1, 1, 1, 1, 1,
-0.7316257, 0.4278408, -2.095638, 1, 1, 1, 1, 1,
-0.7277872, -0.04854681, -2.013715, 1, 1, 1, 1, 1,
-0.724472, -0.1467417, -3.399435, 1, 1, 1, 1, 1,
-0.7225237, 3.118328, -1.487903, 0, 0, 1, 1, 1,
-0.7197129, -1.40408, -0.973173, 1, 0, 0, 1, 1,
-0.7170776, -0.7130451, -3.292021, 1, 0, 0, 1, 1,
-0.7169044, 0.2419738, -2.836158, 1, 0, 0, 1, 1,
-0.7156363, -0.04737809, -0.3992761, 1, 0, 0, 1, 1,
-0.710779, 1.234483, -1.112731, 1, 0, 0, 1, 1,
-0.7071091, -0.8904602, -3.7104, 0, 0, 0, 1, 1,
-0.7058225, -0.5194276, -0.4857239, 0, 0, 0, 1, 1,
-0.7017372, 0.4414221, -0.4666623, 0, 0, 0, 1, 1,
-0.7004245, 0.3593725, -0.8477787, 0, 0, 0, 1, 1,
-0.6922465, -1.126531, -2.495804, 0, 0, 0, 1, 1,
-0.6910131, 0.6405725, 0.1391854, 0, 0, 0, 1, 1,
-0.6898016, 0.01477544, -1.082346, 0, 0, 0, 1, 1,
-0.6871088, 0.2372143, -0.618065, 1, 1, 1, 1, 1,
-0.6844624, 1.020134, -0.3315064, 1, 1, 1, 1, 1,
-0.6830012, -0.4547452, -1.662912, 1, 1, 1, 1, 1,
-0.6795641, -0.6275961, -2.027689, 1, 1, 1, 1, 1,
-0.6790915, 0.05385294, -2.783113, 1, 1, 1, 1, 1,
-0.6732374, 0.02391707, -0.919857, 1, 1, 1, 1, 1,
-0.6635467, -0.6515689, -1.919109, 1, 1, 1, 1, 1,
-0.663228, 0.04341544, -1.836719, 1, 1, 1, 1, 1,
-0.6628038, -0.9669886, -2.544541, 1, 1, 1, 1, 1,
-0.6627828, -0.8671226, -3.827148, 1, 1, 1, 1, 1,
-0.6615786, 0.7057329, -1.472224, 1, 1, 1, 1, 1,
-0.6571007, 1.206319, -1.606556, 1, 1, 1, 1, 1,
-0.6540997, -0.8624173, -2.561189, 1, 1, 1, 1, 1,
-0.6492255, 0.4008343, -0.6137345, 1, 1, 1, 1, 1,
-0.6489999, -0.07500426, -1.04423, 1, 1, 1, 1, 1,
-0.6464044, 0.5185393, -3.018785, 0, 0, 1, 1, 1,
-0.6437048, -0.8208497, -2.08252, 1, 0, 0, 1, 1,
-0.6403733, 1.16536, 0.2610849, 1, 0, 0, 1, 1,
-0.6400531, -0.1311265, -1.173088, 1, 0, 0, 1, 1,
-0.6356397, 0.4848098, 0.6757949, 1, 0, 0, 1, 1,
-0.6341307, -0.2170024, -2.221062, 1, 0, 0, 1, 1,
-0.6279957, -1.555341, -2.0917, 0, 0, 0, 1, 1,
-0.6262, -1.486979, -2.547508, 0, 0, 0, 1, 1,
-0.6242488, 1.712916, -0.2461663, 0, 0, 0, 1, 1,
-0.623009, -1.283147, -0.5954737, 0, 0, 0, 1, 1,
-0.6206176, -0.6802037, -1.308069, 0, 0, 0, 1, 1,
-0.6196748, 0.9688445, -2.30313, 0, 0, 0, 1, 1,
-0.6187106, 0.752933, -0.06361305, 0, 0, 0, 1, 1,
-0.6087232, -0.3844645, -2.896196, 1, 1, 1, 1, 1,
-0.608315, 0.6187281, -1.398181, 1, 1, 1, 1, 1,
-0.6020887, 0.6613328, 0.05586831, 1, 1, 1, 1, 1,
-0.597844, -1.214961, -2.363514, 1, 1, 1, 1, 1,
-0.5942641, -1.181581, -1.62683, 1, 1, 1, 1, 1,
-0.5915032, -0.506253, -3.400233, 1, 1, 1, 1, 1,
-0.5905961, 1.027838, -0.4600008, 1, 1, 1, 1, 1,
-0.5883688, 1.813835, -1.272807, 1, 1, 1, 1, 1,
-0.5756388, 0.902321, 0.06292418, 1, 1, 1, 1, 1,
-0.5703802, 0.5435826, -1.757589, 1, 1, 1, 1, 1,
-0.5678232, 1.092795, -0.9573224, 1, 1, 1, 1, 1,
-0.5655259, 1.074468, -0.8369681, 1, 1, 1, 1, 1,
-0.5633892, -1.502405, -3.41832, 1, 1, 1, 1, 1,
-0.5625924, -0.4053089, -1.994016, 1, 1, 1, 1, 1,
-0.5623057, -0.9559563, -3.010393, 1, 1, 1, 1, 1,
-0.5558507, 0.510542, 0.2946315, 0, 0, 1, 1, 1,
-0.5366784, -2.044142, -3.488337, 1, 0, 0, 1, 1,
-0.5361707, 0.8432243, -0.4528224, 1, 0, 0, 1, 1,
-0.5358555, 0.09562832, -1.450994, 1, 0, 0, 1, 1,
-0.5343239, 0.903491, 0.1648366, 1, 0, 0, 1, 1,
-0.5310986, -0.3500767, -0.4602281, 1, 0, 0, 1, 1,
-0.5293642, -0.2311809, -2.317852, 0, 0, 0, 1, 1,
-0.5266109, 0.818403, -0.7345344, 0, 0, 0, 1, 1,
-0.5163859, -0.2941872, -3.341902, 0, 0, 0, 1, 1,
-0.5148529, -2.296639, -1.616798, 0, 0, 0, 1, 1,
-0.513821, 0.0188155, -2.711436, 0, 0, 0, 1, 1,
-0.5103855, 0.09252414, -0.3260072, 0, 0, 0, 1, 1,
-0.5093643, 1.383361, -0.2146555, 0, 0, 0, 1, 1,
-0.5058398, 2.068778, -0.7843149, 1, 1, 1, 1, 1,
-0.5046709, -1.487877, -2.219065, 1, 1, 1, 1, 1,
-0.4963838, -1.345937, -2.842816, 1, 1, 1, 1, 1,
-0.4955662, 0.08576092, -1.153803, 1, 1, 1, 1, 1,
-0.4911816, 0.2796232, -2.370827, 1, 1, 1, 1, 1,
-0.4866998, 1.475057, -0.4369703, 1, 1, 1, 1, 1,
-0.4845752, -0.9129736, -3.71387, 1, 1, 1, 1, 1,
-0.477903, 2.148644, 0.6713926, 1, 1, 1, 1, 1,
-0.4776061, 0.497947, -1.153703, 1, 1, 1, 1, 1,
-0.4726468, -0.5090238, -3.652383, 1, 1, 1, 1, 1,
-0.4712448, 0.05300767, -1.002607, 1, 1, 1, 1, 1,
-0.4653421, 0.5757682, -1.581693, 1, 1, 1, 1, 1,
-0.4650513, -0.457839, -1.106199, 1, 1, 1, 1, 1,
-0.4648481, 0.4826443, 0.9763968, 1, 1, 1, 1, 1,
-0.4625985, -1.416999, -4.082041, 1, 1, 1, 1, 1,
-0.4594665, -0.1361723, -0.8281565, 0, 0, 1, 1, 1,
-0.4583208, 2.380859, 0.57336, 1, 0, 0, 1, 1,
-0.4506936, -2.767898, -4.126437, 1, 0, 0, 1, 1,
-0.4501011, -1.484433, -3.27417, 1, 0, 0, 1, 1,
-0.4487014, 0.2719403, -1.298596, 1, 0, 0, 1, 1,
-0.4472451, 0.8181335, 0.3339876, 1, 0, 0, 1, 1,
-0.442386, 0.5628399, -1.945571, 0, 0, 0, 1, 1,
-0.4359926, -0.5717632, -2.3333, 0, 0, 0, 1, 1,
-0.433373, 0.2431158, -0.6914157, 0, 0, 0, 1, 1,
-0.433301, -0.1929699, -2.011905, 0, 0, 0, 1, 1,
-0.43074, 1.309587, -0.6575212, 0, 0, 0, 1, 1,
-0.4271477, 1.385364, -0.6428899, 0, 0, 0, 1, 1,
-0.426921, 0.715323, 1.63234, 0, 0, 0, 1, 1,
-0.426551, 0.6742035, -1.052836, 1, 1, 1, 1, 1,
-0.4216097, 0.3262613, -0.3362874, 1, 1, 1, 1, 1,
-0.4204493, -0.1246596, -3.641561, 1, 1, 1, 1, 1,
-0.4117593, 0.7357597, -0.7023557, 1, 1, 1, 1, 1,
-0.4093209, 0.7238242, -2.042191, 1, 1, 1, 1, 1,
-0.4092454, 1.24655, 0.4644009, 1, 1, 1, 1, 1,
-0.4087972, -0.6393309, -2.406301, 1, 1, 1, 1, 1,
-0.407982, 0.7936186, -1.15575, 1, 1, 1, 1, 1,
-0.4067781, -0.7405395, -1.886984, 1, 1, 1, 1, 1,
-0.402291, 0.327568, -0.9720947, 1, 1, 1, 1, 1,
-0.4002915, 0.1582851, -0.4088024, 1, 1, 1, 1, 1,
-0.3994069, -0.8620179, -0.7318435, 1, 1, 1, 1, 1,
-0.3931461, 0.8580622, 0.9201627, 1, 1, 1, 1, 1,
-0.385922, -0.1321868, -2.765068, 1, 1, 1, 1, 1,
-0.3833556, -2.322252, -1.572837, 1, 1, 1, 1, 1,
-0.3785074, 1.111337, 0.5479372, 0, 0, 1, 1, 1,
-0.3748184, -0.3919398, -4.173763, 1, 0, 0, 1, 1,
-0.3713359, -0.9863502, -3.597246, 1, 0, 0, 1, 1,
-0.3653877, 1.139531, -0.08440159, 1, 0, 0, 1, 1,
-0.3610393, 0.8426649, 1.076662, 1, 0, 0, 1, 1,
-0.3595313, -0.2165634, -1.844283, 1, 0, 0, 1, 1,
-0.3581409, 0.9795654, -0.6526418, 0, 0, 0, 1, 1,
-0.3503816, 0.4181574, -0.550101, 0, 0, 0, 1, 1,
-0.3501787, -0.4471627, -3.066326, 0, 0, 0, 1, 1,
-0.3478168, -0.1714383, -2.403248, 0, 0, 0, 1, 1,
-0.3421549, 0.6413554, -1.031942, 0, 0, 0, 1, 1,
-0.3408852, -0.287623, -1.012932, 0, 0, 0, 1, 1,
-0.3381619, -0.2280071, -0.553048, 0, 0, 0, 1, 1,
-0.3320929, -0.2733471, -1.222645, 1, 1, 1, 1, 1,
-0.3268052, -0.1013848, -3.745595, 1, 1, 1, 1, 1,
-0.3266525, 2.001586, 0.2626931, 1, 1, 1, 1, 1,
-0.3240991, -1.417018, -2.382509, 1, 1, 1, 1, 1,
-0.3195577, 0.9266894, 0.6512831, 1, 1, 1, 1, 1,
-0.3193472, 0.3346757, -0.07335699, 1, 1, 1, 1, 1,
-0.3178278, -0.6680471, -3.930022, 1, 1, 1, 1, 1,
-0.3171148, 1.486567, -0.5633658, 1, 1, 1, 1, 1,
-0.3159777, -0.4214718, -3.154528, 1, 1, 1, 1, 1,
-0.314021, -1.250072, -0.8950938, 1, 1, 1, 1, 1,
-0.3104639, -2.051351, -2.748502, 1, 1, 1, 1, 1,
-0.3079169, 0.5644191, -1.89447, 1, 1, 1, 1, 1,
-0.3058169, -1.029662, -3.074868, 1, 1, 1, 1, 1,
-0.3006347, -0.2211088, -4.117869, 1, 1, 1, 1, 1,
-0.2992124, -0.8470272, -3.555261, 1, 1, 1, 1, 1,
-0.2976974, -0.3545749, -0.05479468, 0, 0, 1, 1, 1,
-0.2971169, 1.241064, 0.1911149, 1, 0, 0, 1, 1,
-0.2969389, -0.08994769, -2.82127, 1, 0, 0, 1, 1,
-0.2966751, 1.227581, -0.1510885, 1, 0, 0, 1, 1,
-0.2963834, 1.970347, 0.3344351, 1, 0, 0, 1, 1,
-0.2960365, -0.3880426, -0.6128517, 1, 0, 0, 1, 1,
-0.2942872, 0.8689851, -1.532051, 0, 0, 0, 1, 1,
-0.2942321, -0.8970822, -3.230435, 0, 0, 0, 1, 1,
-0.2931581, 0.126322, -1.450558, 0, 0, 0, 1, 1,
-0.2908115, -0.3568216, -2.735475, 0, 0, 0, 1, 1,
-0.2868305, 1.008105, -0.5521342, 0, 0, 0, 1, 1,
-0.2865268, -1.345142, -4.54696, 0, 0, 0, 1, 1,
-0.2847937, 0.2382999, -0.8935928, 0, 0, 0, 1, 1,
-0.2774038, -0.9684277, -0.9413373, 1, 1, 1, 1, 1,
-0.2765211, -0.8388987, -1.880883, 1, 1, 1, 1, 1,
-0.2762867, -0.8385744, -3.068905, 1, 1, 1, 1, 1,
-0.273692, 1.063722, 0.2454017, 1, 1, 1, 1, 1,
-0.2733585, 0.548429, 0.2931834, 1, 1, 1, 1, 1,
-0.266092, -1.298528, -3.400661, 1, 1, 1, 1, 1,
-0.2647015, -1.548421, -4.537273, 1, 1, 1, 1, 1,
-0.2612962, 0.3013985, -1.03501, 1, 1, 1, 1, 1,
-0.2568805, 0.3869681, -0.5946113, 1, 1, 1, 1, 1,
-0.2547536, -0.9986073, -4.03705, 1, 1, 1, 1, 1,
-0.2498232, -1.058802, -1.751094, 1, 1, 1, 1, 1,
-0.244339, 1.783598, -1.744356, 1, 1, 1, 1, 1,
-0.2395874, 1.341732, -1.408532, 1, 1, 1, 1, 1,
-0.238574, -0.610405, -2.764926, 1, 1, 1, 1, 1,
-0.2371452, 1.31488, -1.640261, 1, 1, 1, 1, 1,
-0.2335212, -0.2524294, -3.381824, 0, 0, 1, 1, 1,
-0.2325137, 0.188075, -0.9896463, 1, 0, 0, 1, 1,
-0.2318693, 1.11967, 2.440664, 1, 0, 0, 1, 1,
-0.2295645, -0.9470429, -3.140825, 1, 0, 0, 1, 1,
-0.2280346, -0.39555, -3.27372, 1, 0, 0, 1, 1,
-0.2271803, 0.6397157, 0.3820067, 1, 0, 0, 1, 1,
-0.2255879, 0.6743637, -0.6178429, 0, 0, 0, 1, 1,
-0.2196804, 0.5014475, -0.07562641, 0, 0, 0, 1, 1,
-0.2195873, 2.952336, 1.011312, 0, 0, 0, 1, 1,
-0.2177777, 0.00930361, -2.676651, 0, 0, 0, 1, 1,
-0.2170985, 0.5627099, 0.2783382, 0, 0, 0, 1, 1,
-0.2156575, -0.7224612, -4.420178, 0, 0, 0, 1, 1,
-0.2090423, -0.8273925, -1.776251, 0, 0, 0, 1, 1,
-0.2057779, -0.1389484, -1.750762, 1, 1, 1, 1, 1,
-0.2049852, 0.5711699, -0.4037358, 1, 1, 1, 1, 1,
-0.204517, 1.738182, -0.2710939, 1, 1, 1, 1, 1,
-0.2021146, -0.2637094, -2.447704, 1, 1, 1, 1, 1,
-0.198776, -0.299879, -2.889132, 1, 1, 1, 1, 1,
-0.1979365, 0.8682661, 0.5920404, 1, 1, 1, 1, 1,
-0.1970215, 0.3640211, 0.2551802, 1, 1, 1, 1, 1,
-0.1957359, -1.326397, -3.54994, 1, 1, 1, 1, 1,
-0.1912329, 0.7457191, -0.07698565, 1, 1, 1, 1, 1,
-0.1859172, -0.4915248, -2.719323, 1, 1, 1, 1, 1,
-0.1850482, -0.07354511, -2.282188, 1, 1, 1, 1, 1,
-0.1831482, -0.4981304, -2.091931, 1, 1, 1, 1, 1,
-0.1808117, 0.3021736, -0.5116959, 1, 1, 1, 1, 1,
-0.1807287, -1.641198, -1.396973, 1, 1, 1, 1, 1,
-0.1806939, 0.3095084, -1.137612, 1, 1, 1, 1, 1,
-0.1773722, -1.182824, -1.876955, 0, 0, 1, 1, 1,
-0.1736737, 0.7705576, -0.5239744, 1, 0, 0, 1, 1,
-0.1695468, -0.6512617, -1.157372, 1, 0, 0, 1, 1,
-0.1684062, 0.8417404, -0.09063721, 1, 0, 0, 1, 1,
-0.1679232, 0.6500344, -1.168076, 1, 0, 0, 1, 1,
-0.1661076, 0.6202151, -0.455565, 1, 0, 0, 1, 1,
-0.1628566, -1.531266, -1.481585, 0, 0, 0, 1, 1,
-0.1606636, -0.7260236, -5.094476, 0, 0, 0, 1, 1,
-0.1601403, 1.400173, -0.7813035, 0, 0, 0, 1, 1,
-0.1584413, -0.1353431, -2.282738, 0, 0, 0, 1, 1,
-0.1579475, -0.4428949, -1.649567, 0, 0, 0, 1, 1,
-0.1550014, 0.5287284, 0.4937885, 0, 0, 0, 1, 1,
-0.1547712, -0.698246, -4.041107, 0, 0, 0, 1, 1,
-0.1532345, 0.4004675, 0.3034097, 1, 1, 1, 1, 1,
-0.1488629, -0.0438133, -1.330604, 1, 1, 1, 1, 1,
-0.1488423, -0.3579529, -3.87502, 1, 1, 1, 1, 1,
-0.1456229, 0.4979873, 0.7353064, 1, 1, 1, 1, 1,
-0.1418938, 0.8472522, 0.1569251, 1, 1, 1, 1, 1,
-0.1376099, 0.3368959, -0.4431322, 1, 1, 1, 1, 1,
-0.1369293, 0.1567378, -1.765734, 1, 1, 1, 1, 1,
-0.1363057, 1.197746, 1.014741, 1, 1, 1, 1, 1,
-0.1353715, 1.285674, 0.5846769, 1, 1, 1, 1, 1,
-0.1319764, 0.2902161, -0.9329613, 1, 1, 1, 1, 1,
-0.1308373, 0.8288095, 1.463984, 1, 1, 1, 1, 1,
-0.1304095, 0.4702135, 1.393467, 1, 1, 1, 1, 1,
-0.1295129, -0.8859174, -1.683133, 1, 1, 1, 1, 1,
-0.1271109, -0.7464152, -3.076715, 1, 1, 1, 1, 1,
-0.1250947, -0.6510012, -1.459556, 1, 1, 1, 1, 1,
-0.1250085, 0.4384528, -1.646857, 0, 0, 1, 1, 1,
-0.1155117, 1.838064, 0.4314882, 1, 0, 0, 1, 1,
-0.1134556, 1.355106, -1.014434, 1, 0, 0, 1, 1,
-0.1109447, -0.9235346, -4.481592, 1, 0, 0, 1, 1,
-0.1089356, -0.7302361, -4.512321, 1, 0, 0, 1, 1,
-0.1085814, 0.4529932, -0.7264255, 1, 0, 0, 1, 1,
-0.09089724, -0.6851974, -3.097738, 0, 0, 0, 1, 1,
-0.08947709, 1.139228, 0.8672798, 0, 0, 0, 1, 1,
-0.08865489, -0.1912378, -1.921381, 0, 0, 0, 1, 1,
-0.08290631, 0.2705519, -1.237013, 0, 0, 0, 1, 1,
-0.07450989, 0.01179214, -1.02465, 0, 0, 0, 1, 1,
-0.07195707, 1.753338, 1.574649, 0, 0, 0, 1, 1,
-0.07044812, -0.3300152, -4.502911, 0, 0, 0, 1, 1,
-0.06973793, -0.3289349, -2.246954, 1, 1, 1, 1, 1,
-0.06503645, 0.5102463, 0.06705521, 1, 1, 1, 1, 1,
-0.06490967, 1.040967, 0.9610343, 1, 1, 1, 1, 1,
-0.06264251, 2.702073, -0.430843, 1, 1, 1, 1, 1,
-0.06105833, 1.456616, -2.042664, 1, 1, 1, 1, 1,
-0.04539819, -0.3941549, -2.951035, 1, 1, 1, 1, 1,
-0.04333586, -0.7603437, -3.432127, 1, 1, 1, 1, 1,
-0.03951832, 1.064798, -0.9997811, 1, 1, 1, 1, 1,
-0.03856372, -0.7981777, -1.768261, 1, 1, 1, 1, 1,
-0.03763285, -0.9270083, -1.559564, 1, 1, 1, 1, 1,
-0.03633732, -0.1750098, -2.156886, 1, 1, 1, 1, 1,
-0.03280067, -0.4296417, -2.363092, 1, 1, 1, 1, 1,
-0.03156916, -0.8542062, -4.337487, 1, 1, 1, 1, 1,
-0.02815834, -0.6942104, -2.271691, 1, 1, 1, 1, 1,
-0.02456983, 1.209077, -0.799645, 1, 1, 1, 1, 1,
-0.02200166, 1.017119, 0.6975802, 0, 0, 1, 1, 1,
-0.01944805, 0.9665662, 1.225571, 1, 0, 0, 1, 1,
-0.01840171, 0.5559826, -0.4115773, 1, 0, 0, 1, 1,
-0.01654332, 1.34771, -1.169057, 1, 0, 0, 1, 1,
-0.01650748, 1.112016, 1.358981, 1, 0, 0, 1, 1,
-0.0137019, 0.195134, 0.6231856, 1, 0, 0, 1, 1,
-0.01191975, 0.06847843, -1.781991, 0, 0, 0, 1, 1,
-0.009678584, 0.4071892, -0.6310624, 0, 0, 0, 1, 1,
-0.007218448, -0.9718338, -4.694176, 0, 0, 0, 1, 1,
-0.004712826, -0.1724322, -2.772953, 0, 0, 0, 1, 1,
-0.003990591, -1.306409, -4.080399, 0, 0, 0, 1, 1,
-0.003878616, -0.08432335, -3.917297, 0, 0, 0, 1, 1,
-0.002994919, 2.295051, 0.8055012, 0, 0, 0, 1, 1,
-0.001198714, -1.199668, -4.988476, 1, 1, 1, 1, 1,
0.00138038, 0.7314349, -0.09300197, 1, 1, 1, 1, 1,
0.001730851, -0.09006862, 2.663654, 1, 1, 1, 1, 1,
0.002065335, 0.1759367, -2.103706, 1, 1, 1, 1, 1,
0.006627983, 0.5417712, 1.020497, 1, 1, 1, 1, 1,
0.007030441, -0.4094799, 3.724936, 1, 1, 1, 1, 1,
0.01059588, -0.881136, 3.828495, 1, 1, 1, 1, 1,
0.01152404, -0.1575466, 2.806529, 1, 1, 1, 1, 1,
0.01246664, -0.6022476, 1.17901, 1, 1, 1, 1, 1,
0.01729598, 1.068391, -1.721485, 1, 1, 1, 1, 1,
0.01958096, 0.8909175, 1.133233, 1, 1, 1, 1, 1,
0.02459077, 0.5117774, 0.04775914, 1, 1, 1, 1, 1,
0.02677573, -0.2490501, 4.564848, 1, 1, 1, 1, 1,
0.02772751, 0.432607, 0.8694187, 1, 1, 1, 1, 1,
0.02816853, -1.558363, 5.161259, 1, 1, 1, 1, 1,
0.02880536, 0.5511192, 2.330295, 0, 0, 1, 1, 1,
0.02883915, 0.2346385, -0.5025296, 1, 0, 0, 1, 1,
0.03108663, -0.04899697, 1.791221, 1, 0, 0, 1, 1,
0.03719794, -0.5284875, 4.019837, 1, 0, 0, 1, 1,
0.03790013, -0.3197365, 1.777562, 1, 0, 0, 1, 1,
0.03921219, -0.04245655, 3.792244, 1, 0, 0, 1, 1,
0.04217704, -0.3603273, 3.453161, 0, 0, 0, 1, 1,
0.04332871, -0.9363657, 3.505612, 0, 0, 0, 1, 1,
0.04411029, 1.179662, -1.073207, 0, 0, 0, 1, 1,
0.05137593, 0.7923529, 0.1228248, 0, 0, 0, 1, 1,
0.05172021, -0.559687, 2.409249, 0, 0, 0, 1, 1,
0.05512134, 0.8838198, 0.9639354, 0, 0, 0, 1, 1,
0.05597564, 1.950885, 0.4303702, 0, 0, 0, 1, 1,
0.06052346, -0.4811454, 3.916914, 1, 1, 1, 1, 1,
0.06190629, 1.608942, -1.061795, 1, 1, 1, 1, 1,
0.06282763, -1.732495, 4.115, 1, 1, 1, 1, 1,
0.06860439, -1.088869, 3.207066, 1, 1, 1, 1, 1,
0.07068997, 0.7587654, -1.391291, 1, 1, 1, 1, 1,
0.07387393, 0.9208522, 0.3376153, 1, 1, 1, 1, 1,
0.07524072, 0.3034411, 0.7894229, 1, 1, 1, 1, 1,
0.07635441, -0.3728757, 2.786265, 1, 1, 1, 1, 1,
0.07760242, -1.23492, 2.755881, 1, 1, 1, 1, 1,
0.07988055, 1.63575, -0.8006797, 1, 1, 1, 1, 1,
0.07993577, -0.1899066, 1.373229, 1, 1, 1, 1, 1,
0.08235227, 0.9489245, 0.1220011, 1, 1, 1, 1, 1,
0.08399432, 1.176152, 1.422813, 1, 1, 1, 1, 1,
0.08783432, 0.9783878, 0.3207766, 1, 1, 1, 1, 1,
0.08936116, 0.9421626, 0.3181549, 1, 1, 1, 1, 1,
0.09429418, -1.223713, 1.766592, 0, 0, 1, 1, 1,
0.09531915, 0.7986529, 1.21515, 1, 0, 0, 1, 1,
0.09854347, 0.1447913, -1.075823, 1, 0, 0, 1, 1,
0.1011672, -0.1246232, 2.032916, 1, 0, 0, 1, 1,
0.1012781, 0.10585, 2.124697, 1, 0, 0, 1, 1,
0.1024656, 1.234569, 2.512881, 1, 0, 0, 1, 1,
0.1033761, -2.10538, 2.910547, 0, 0, 0, 1, 1,
0.105527, 0.5433483, -0.1599703, 0, 0, 0, 1, 1,
0.1090003, -0.6255233, 2.134197, 0, 0, 0, 1, 1,
0.1150269, 0.6226972, -0.2085083, 0, 0, 0, 1, 1,
0.1163324, 0.6573575, -0.3963247, 0, 0, 0, 1, 1,
0.1184355, -0.6534259, 1.255062, 0, 0, 0, 1, 1,
0.1187691, -1.493348, 3.695443, 0, 0, 0, 1, 1,
0.122639, -0.208411, 1.287216, 1, 1, 1, 1, 1,
0.1246727, 0.8761697, -0.5339702, 1, 1, 1, 1, 1,
0.1271367, -0.3218413, 1.303661, 1, 1, 1, 1, 1,
0.1288448, -0.8976992, 4.131507, 1, 1, 1, 1, 1,
0.131621, 0.002381633, 1.733814, 1, 1, 1, 1, 1,
0.1320456, -1.563831, 2.748644, 1, 1, 1, 1, 1,
0.1418732, 0.4303177, -0.9536194, 1, 1, 1, 1, 1,
0.1430688, 0.5554391, 0.5004532, 1, 1, 1, 1, 1,
0.1441036, 0.7993041, -0.4964676, 1, 1, 1, 1, 1,
0.1461941, 0.1145187, 1.3645, 1, 1, 1, 1, 1,
0.1475918, 1.017243, -0.9766299, 1, 1, 1, 1, 1,
0.1516929, -0.4152399, 3.018695, 1, 1, 1, 1, 1,
0.1535686, 0.6985415, 1.304847, 1, 1, 1, 1, 1,
0.1537436, 0.2662112, 1.580209, 1, 1, 1, 1, 1,
0.1558987, 1.134654, 1.784823, 1, 1, 1, 1, 1,
0.159136, 0.9478181, 0.6123195, 0, 0, 1, 1, 1,
0.1609782, 1.235101, -0.5307507, 1, 0, 0, 1, 1,
0.1655643, 0.01621735, 2.068864, 1, 0, 0, 1, 1,
0.1673952, -0.1896594, 3.278638, 1, 0, 0, 1, 1,
0.1708965, 2.027337, 2.348148, 1, 0, 0, 1, 1,
0.173318, 0.7940799, 0.1890799, 1, 0, 0, 1, 1,
0.1737233, -0.3417213, 4.039755, 0, 0, 0, 1, 1,
0.1749598, 1.067661, -0.3950835, 0, 0, 0, 1, 1,
0.1856547, -0.622219, 4.001573, 0, 0, 0, 1, 1,
0.1930402, 0.8669683, 1.874596, 0, 0, 0, 1, 1,
0.1934536, 0.1390861, 2.261004, 0, 0, 0, 1, 1,
0.1948642, -0.7901775, 3.60099, 0, 0, 0, 1, 1,
0.1985991, 0.1690329, 1.269576, 0, 0, 0, 1, 1,
0.1986138, -0.4825045, 1.147753, 1, 1, 1, 1, 1,
0.2049602, 0.1566109, 2.075639, 1, 1, 1, 1, 1,
0.2081971, -0.159349, 3.175379, 1, 1, 1, 1, 1,
0.2104717, 0.9394512, -0.697818, 1, 1, 1, 1, 1,
0.2116167, 1.517008, -0.4303752, 1, 1, 1, 1, 1,
0.2122341, 0.3571003, 0.9707661, 1, 1, 1, 1, 1,
0.2137616, 0.06484248, 0.8535321, 1, 1, 1, 1, 1,
0.2145533, -1.143054, 2.997952, 1, 1, 1, 1, 1,
0.214792, 0.6544107, 1.971455, 1, 1, 1, 1, 1,
0.2151174, 0.4392258, -0.3964053, 1, 1, 1, 1, 1,
0.2156956, -0.1751658, 2.649107, 1, 1, 1, 1, 1,
0.2213881, -0.3566353, 2.456852, 1, 1, 1, 1, 1,
0.222677, 1.511661, -0.240205, 1, 1, 1, 1, 1,
0.2264121, 1.411569, 0.4735408, 1, 1, 1, 1, 1,
0.2332178, 1.342559, -0.7826278, 1, 1, 1, 1, 1,
0.2355645, 0.8612942, -0.8246589, 0, 0, 1, 1, 1,
0.2356071, -0.5846428, 3.500739, 1, 0, 0, 1, 1,
0.2373535, 1.362751, 1.413921, 1, 0, 0, 1, 1,
0.2425632, 0.6428649, -1.900797, 1, 0, 0, 1, 1,
0.252553, 0.565926, -1.336393, 1, 0, 0, 1, 1,
0.2530028, 0.3368514, 0.4332052, 1, 0, 0, 1, 1,
0.253964, -1.783395, 3.715327, 0, 0, 0, 1, 1,
0.2545864, -2.506703, 3.037436, 0, 0, 0, 1, 1,
0.2607689, -0.05151307, 1.928909, 0, 0, 0, 1, 1,
0.2615286, 1.052085, -0.3262963, 0, 0, 0, 1, 1,
0.2653904, -0.5312352, 2.654721, 0, 0, 0, 1, 1,
0.265652, 1.658585, -1.041658, 0, 0, 0, 1, 1,
0.2659964, -1.289018, 1.787948, 0, 0, 0, 1, 1,
0.2660502, 0.4831015, 2.171579, 1, 1, 1, 1, 1,
0.2692423, 1.386089, -0.2593297, 1, 1, 1, 1, 1,
0.2748252, 0.8859939, 0.5120116, 1, 1, 1, 1, 1,
0.2756512, -0.4653698, 3.067353, 1, 1, 1, 1, 1,
0.2761003, -0.9301268, 2.914021, 1, 1, 1, 1, 1,
0.2763519, 0.3599491, 1.152409, 1, 1, 1, 1, 1,
0.2926019, 0.1745389, 1.37426, 1, 1, 1, 1, 1,
0.2991374, -0.213811, 1.85408, 1, 1, 1, 1, 1,
0.2996054, -1.371907, 4.987107, 1, 1, 1, 1, 1,
0.3054213, -0.9292041, 2.225707, 1, 1, 1, 1, 1,
0.3099862, -1.357041, 3.320437, 1, 1, 1, 1, 1,
0.3199881, 1.684727, 1.656179, 1, 1, 1, 1, 1,
0.3247893, 0.4652199, -0.02351938, 1, 1, 1, 1, 1,
0.3277683, 0.4749315, 1.916672, 1, 1, 1, 1, 1,
0.3292512, -2.066573, 4.883016, 1, 1, 1, 1, 1,
0.3309226, 1.24534, 1.092507, 0, 0, 1, 1, 1,
0.3329443, -0.4187258, 0.6114815, 1, 0, 0, 1, 1,
0.3331174, -0.0100953, 2.437676, 1, 0, 0, 1, 1,
0.3356174, 0.3101571, 1.314776, 1, 0, 0, 1, 1,
0.3382782, -0.8026094, 3.447692, 1, 0, 0, 1, 1,
0.3506484, 0.6711399, 0.456975, 1, 0, 0, 1, 1,
0.3513955, 1.257515, 0.261101, 0, 0, 0, 1, 1,
0.3596937, -2.085936, 3.418878, 0, 0, 0, 1, 1,
0.3598312, 0.240874, -0.4807741, 0, 0, 0, 1, 1,
0.3631928, 0.6583118, 1.020344, 0, 0, 0, 1, 1,
0.3645497, 0.07452588, -0.4117339, 0, 0, 0, 1, 1,
0.3648973, 0.09980316, 0.03290648, 0, 0, 0, 1, 1,
0.3721579, 1.399675, 0.4450478, 0, 0, 0, 1, 1,
0.3775408, -0.9846833, 1.602661, 1, 1, 1, 1, 1,
0.3776631, 0.8150914, 0.5741594, 1, 1, 1, 1, 1,
0.3820229, 0.7564972, 0.3845022, 1, 1, 1, 1, 1,
0.3832591, -1.69618, 5.089075, 1, 1, 1, 1, 1,
0.3860534, 0.02665895, 2.210936, 1, 1, 1, 1, 1,
0.3891953, 2.297027, 0.7894123, 1, 1, 1, 1, 1,
0.3973061, 0.8442678, 1.172109, 1, 1, 1, 1, 1,
0.4013742, 0.1843909, 0.4070014, 1, 1, 1, 1, 1,
0.4028119, -0.02735333, 0.8738801, 1, 1, 1, 1, 1,
0.4031208, 0.5863104, 0.4634241, 1, 1, 1, 1, 1,
0.4051676, -0.4599754, 3.09857, 1, 1, 1, 1, 1,
0.4053439, 0.7570767, 0.3650281, 1, 1, 1, 1, 1,
0.415361, -0.4591776, 3.003033, 1, 1, 1, 1, 1,
0.4166727, 0.3845549, 0.294994, 1, 1, 1, 1, 1,
0.4180596, -1.373495, 3.017817, 1, 1, 1, 1, 1,
0.4189116, 1.277556, 1.178356, 0, 0, 1, 1, 1,
0.4235514, 0.5736413, 2.942417, 1, 0, 0, 1, 1,
0.4276256, 0.6273654, 0.5830587, 1, 0, 0, 1, 1,
0.4316178, 1.767606, 1.815696, 1, 0, 0, 1, 1,
0.4343127, -0.5626599, 3.890231, 1, 0, 0, 1, 1,
0.4365281, 0.1821968, 1.091913, 1, 0, 0, 1, 1,
0.4372053, -3.741174, 4.095418, 0, 0, 0, 1, 1,
0.4386701, 0.3581853, -0.4503139, 0, 0, 0, 1, 1,
0.4393753, -0.8415858, 3.122223, 0, 0, 0, 1, 1,
0.4402022, -0.710938, 2.612134, 0, 0, 0, 1, 1,
0.4440624, 0.6492805, 0.4753312, 0, 0, 0, 1, 1,
0.444755, 0.1203639, 1.621874, 0, 0, 0, 1, 1,
0.4452568, -0.3619183, 0.9994524, 0, 0, 0, 1, 1,
0.4454872, 0.9044268, 1.086348, 1, 1, 1, 1, 1,
0.4455472, -1.070876, 0.7400391, 1, 1, 1, 1, 1,
0.4480209, 1.000274, 1.679958, 1, 1, 1, 1, 1,
0.4520133, -0.488691, 3.244474, 1, 1, 1, 1, 1,
0.4594887, 0.6394519, 1.179005, 1, 1, 1, 1, 1,
0.4612326, -0.1344211, 0.3070292, 1, 1, 1, 1, 1,
0.4671285, -0.1790457, 0.6645153, 1, 1, 1, 1, 1,
0.4673959, 0.8360883, -0.3021637, 1, 1, 1, 1, 1,
0.4687716, -0.3068882, 1.44202, 1, 1, 1, 1, 1,
0.4694479, 2.447871, -1.161553, 1, 1, 1, 1, 1,
0.4708926, -0.6600068, 1.679181, 1, 1, 1, 1, 1,
0.4775937, -0.7033983, 1.806078, 1, 1, 1, 1, 1,
0.4798983, 0.6899748, 1.277242, 1, 1, 1, 1, 1,
0.486602, -0.9091277, 1.8362, 1, 1, 1, 1, 1,
0.4886393, -1.028935, 2.776215, 1, 1, 1, 1, 1,
0.4916634, -0.7060544, 2.761848, 0, 0, 1, 1, 1,
0.4955641, 0.1590314, 1.775496, 1, 0, 0, 1, 1,
0.4955978, -0.6074393, 4.266465, 1, 0, 0, 1, 1,
0.4964779, 0.1559722, 1.5427, 1, 0, 0, 1, 1,
0.5116012, -0.1533522, 1.988431, 1, 0, 0, 1, 1,
0.5156599, 0.7944456, 1.480237, 1, 0, 0, 1, 1,
0.5162537, 0.9310731, -0.8461213, 0, 0, 0, 1, 1,
0.5180307, 0.5385929, 0.6955815, 0, 0, 0, 1, 1,
0.5192194, -0.8434735, 2.188972, 0, 0, 0, 1, 1,
0.5236123, 0.9152861, 1.990351, 0, 0, 0, 1, 1,
0.5237743, 1.047619, 1.347874, 0, 0, 0, 1, 1,
0.5247849, 0.2322922, 0.4230032, 0, 0, 0, 1, 1,
0.5263955, 1.43383, -0.1886421, 0, 0, 0, 1, 1,
0.5339382, 0.20587, 1.244313, 1, 1, 1, 1, 1,
0.5354192, 0.2330432, 0.3002881, 1, 1, 1, 1, 1,
0.5378574, 0.2358744, 2.290431, 1, 1, 1, 1, 1,
0.5379978, 1.063624, 0.139576, 1, 1, 1, 1, 1,
0.5413219, 0.06880554, 0.8370629, 1, 1, 1, 1, 1,
0.5452025, -0.4350349, 1.786252, 1, 1, 1, 1, 1,
0.5470707, -0.4093896, 3.70475, 1, 1, 1, 1, 1,
0.5471137, 0.5826819, 1.049783, 1, 1, 1, 1, 1,
0.5490908, 0.9981322, 1.589296, 1, 1, 1, 1, 1,
0.553546, -1.49139, 2.189932, 1, 1, 1, 1, 1,
0.5538084, 1.011231, 1.736903, 1, 1, 1, 1, 1,
0.555094, 0.3547093, 2.099889, 1, 1, 1, 1, 1,
0.5605294, -1.315953, 1.548767, 1, 1, 1, 1, 1,
0.5607088, -1.036119, 1.740419, 1, 1, 1, 1, 1,
0.5612919, 1.161305, 0.1669927, 1, 1, 1, 1, 1,
0.5653815, -0.5301298, 2.139655, 0, 0, 1, 1, 1,
0.5683497, -0.4648353, 2.015987, 1, 0, 0, 1, 1,
0.5712751, 0.7233874, 0.1012202, 1, 0, 0, 1, 1,
0.5727937, -0.5287164, 4.504027, 1, 0, 0, 1, 1,
0.576161, 1.896727, 1.433458, 1, 0, 0, 1, 1,
0.5794307, -1.763172, 1.498567, 1, 0, 0, 1, 1,
0.5820154, 2.004489, 0.9325052, 0, 0, 0, 1, 1,
0.5821978, -0.5625307, 2.568376, 0, 0, 0, 1, 1,
0.5853205, -0.5346081, 2.77118, 0, 0, 0, 1, 1,
0.5872471, -1.616132, 2.613502, 0, 0, 0, 1, 1,
0.5886518, 2.095198, 1.274759, 0, 0, 0, 1, 1,
0.5902833, 0.453281, 1.373009, 0, 0, 0, 1, 1,
0.5950794, 0.6550055, 2.018583, 0, 0, 0, 1, 1,
0.5953462, 1.629768, -0.6910989, 1, 1, 1, 1, 1,
0.5971287, -0.8902129, 3.552643, 1, 1, 1, 1, 1,
0.5983024, -1.597835, 3.4837, 1, 1, 1, 1, 1,
0.6057231, -0.05436011, 2.375441, 1, 1, 1, 1, 1,
0.6071507, -1.076932, 3.409746, 1, 1, 1, 1, 1,
0.6098978, 2.908594, -0.8784979, 1, 1, 1, 1, 1,
0.6125886, -0.9315346, 1.841558, 1, 1, 1, 1, 1,
0.6148016, -0.04792596, 2.597985, 1, 1, 1, 1, 1,
0.6160853, -0.5797919, 0.8223865, 1, 1, 1, 1, 1,
0.6214083, 0.5611472, -0.1281093, 1, 1, 1, 1, 1,
0.6265659, -0.3913572, 1.854243, 1, 1, 1, 1, 1,
0.6268603, 0.1683565, 1.413356, 1, 1, 1, 1, 1,
0.6319425, 0.2774799, 0.76815, 1, 1, 1, 1, 1,
0.6323208, -1.323944, 1.290637, 1, 1, 1, 1, 1,
0.6339043, -0.1566489, 1.386316, 1, 1, 1, 1, 1,
0.6360149, 0.3592916, 1.609415, 0, 0, 1, 1, 1,
0.6379012, -0.1917059, 2.013114, 1, 0, 0, 1, 1,
0.6402841, 1.346486, 0.1646156, 1, 0, 0, 1, 1,
0.6438044, 1.244485, 3.364823, 1, 0, 0, 1, 1,
0.6442794, -0.09872365, 0.4332774, 1, 0, 0, 1, 1,
0.6443703, 1.563273, 0.6306792, 1, 0, 0, 1, 1,
0.6459929, 0.266884, 0.8663095, 0, 0, 0, 1, 1,
0.6487501, -1.034746, 3.68469, 0, 0, 0, 1, 1,
0.6494191, 0.01781516, 2.859368, 0, 0, 0, 1, 1,
0.6498526, 0.9701474, 2.061967, 0, 0, 0, 1, 1,
0.6570704, -0.6971328, 1.889735, 0, 0, 0, 1, 1,
0.6611056, 0.612941, 1.180751, 0, 0, 0, 1, 1,
0.6611166, -0.7024881, 3.00852, 0, 0, 0, 1, 1,
0.6624911, 0.8949606, 1.593888, 1, 1, 1, 1, 1,
0.6734171, -0.1912296, 0.9257389, 1, 1, 1, 1, 1,
0.6782536, 0.1725083, 0.688331, 1, 1, 1, 1, 1,
0.6824486, -1.160288, 1.940538, 1, 1, 1, 1, 1,
0.6858801, 0.4883711, 2.151767, 1, 1, 1, 1, 1,
0.6907446, 0.2933956, 2.030474, 1, 1, 1, 1, 1,
0.6924234, -1.062413, 3.420154, 1, 1, 1, 1, 1,
0.6966991, -2.252474, 2.986936, 1, 1, 1, 1, 1,
0.7094198, -1.443523, 3.60165, 1, 1, 1, 1, 1,
0.7100949, -1.164749, 1.166823, 1, 1, 1, 1, 1,
0.7102966, 0.8340057, 0.04406917, 1, 1, 1, 1, 1,
0.712935, -0.04948947, 0.4412604, 1, 1, 1, 1, 1,
0.7170196, 0.3923455, 0.822136, 1, 1, 1, 1, 1,
0.7177147, 1.362662, 0.3022286, 1, 1, 1, 1, 1,
0.7194929, 0.1690325, 2.038393, 1, 1, 1, 1, 1,
0.7209674, -0.1391583, 3.271401, 0, 0, 1, 1, 1,
0.7258946, 0.5039165, -0.1482674, 1, 0, 0, 1, 1,
0.7261823, 0.3032136, 1.627575, 1, 0, 0, 1, 1,
0.7265527, -1.74895, 3.57728, 1, 0, 0, 1, 1,
0.7386891, 0.1420077, 3.549699, 1, 0, 0, 1, 1,
0.7416556, 0.2357324, 0.5437046, 1, 0, 0, 1, 1,
0.7446721, 0.9443281, 1.274258, 0, 0, 0, 1, 1,
0.7515419, -0.8346623, 2.224423, 0, 0, 0, 1, 1,
0.7556581, 0.9743263, 1.210949, 0, 0, 0, 1, 1,
0.7683978, -0.3111762, 1.970022, 0, 0, 0, 1, 1,
0.7727755, -0.2808111, 0.3812577, 0, 0, 0, 1, 1,
0.774538, -0.570513, 1.771348, 0, 0, 0, 1, 1,
0.7759393, -0.3339393, 2.1035, 0, 0, 0, 1, 1,
0.7792248, -1.284646, 2.67826, 1, 1, 1, 1, 1,
0.7830887, 1.221769, 0.09569954, 1, 1, 1, 1, 1,
0.7872459, -0.2685379, 1.951735, 1, 1, 1, 1, 1,
0.7890959, -1.65145, 2.16552, 1, 1, 1, 1, 1,
0.7917286, -0.4652974, 4.108007, 1, 1, 1, 1, 1,
0.794841, -0.5654772, 0.9396461, 1, 1, 1, 1, 1,
0.7954395, 0.06891104, 1.092797, 1, 1, 1, 1, 1,
0.8026291, -0.4142462, 2.179995, 1, 1, 1, 1, 1,
0.8042264, 0.2899079, 2.911504, 1, 1, 1, 1, 1,
0.8072939, -1.247138, 2.361958, 1, 1, 1, 1, 1,
0.8118703, 0.8176268, 1.372632, 1, 1, 1, 1, 1,
0.8138816, 0.316263, 0.06800251, 1, 1, 1, 1, 1,
0.8164243, 0.76845, 0.8188701, 1, 1, 1, 1, 1,
0.827675, -0.8857368, 3.378394, 1, 1, 1, 1, 1,
0.8346513, -0.252468, 2.435421, 1, 1, 1, 1, 1,
0.8367747, 0.6282316, 1.31483, 0, 0, 1, 1, 1,
0.8375018, -1.264288, 1.326183, 1, 0, 0, 1, 1,
0.8452057, -0.7994922, 1.409436, 1, 0, 0, 1, 1,
0.8471878, 0.3622588, 1.191246, 1, 0, 0, 1, 1,
0.8550576, -0.05842777, 1.10832, 1, 0, 0, 1, 1,
0.8577043, -0.3170683, 1.743938, 1, 0, 0, 1, 1,
0.8627114, -0.9451838, 3.169792, 0, 0, 0, 1, 1,
0.865172, -0.4314568, 3.121434, 0, 0, 0, 1, 1,
0.8658856, 0.3091098, 1.516325, 0, 0, 0, 1, 1,
0.8704628, -0.9667925, 3.138182, 0, 0, 0, 1, 1,
0.8759652, -0.1394965, 0.1836423, 0, 0, 0, 1, 1,
0.8760836, 0.322704, 3.987729, 0, 0, 0, 1, 1,
0.8793991, -0.7809092, 1.827674, 0, 0, 0, 1, 1,
0.881599, 1.951347, -0.0729822, 1, 1, 1, 1, 1,
0.8824039, -1.719281, 3.280205, 1, 1, 1, 1, 1,
0.8913809, -0.8098906, 1.426722, 1, 1, 1, 1, 1,
0.8926253, 1.084292, 0.6925763, 1, 1, 1, 1, 1,
0.8975893, -0.2417779, 3.715015, 1, 1, 1, 1, 1,
0.9070836, 0.773266, 2.362145, 1, 1, 1, 1, 1,
0.9089211, -1.451885, 1.844495, 1, 1, 1, 1, 1,
0.9094054, 0.003162359, 2.733861, 1, 1, 1, 1, 1,
0.9134625, -0.5053957, 2.888417, 1, 1, 1, 1, 1,
0.9161028, -0.2910912, 1.963529, 1, 1, 1, 1, 1,
0.9184905, -0.0480161, 1.877, 1, 1, 1, 1, 1,
0.9197989, 0.7816045, 0.7687168, 1, 1, 1, 1, 1,
0.9233489, -0.4125672, 0.4590475, 1, 1, 1, 1, 1,
0.9371646, -0.1423894, 2.338598, 1, 1, 1, 1, 1,
0.9387879, -0.1636733, 3.139127, 1, 1, 1, 1, 1,
0.9495366, -0.6269193, 1.443188, 0, 0, 1, 1, 1,
0.9607908, -0.9978056, 3.363594, 1, 0, 0, 1, 1,
0.9612336, 1.229932, 1.404761, 1, 0, 0, 1, 1,
0.9613106, 1.014581, -0.2037221, 1, 0, 0, 1, 1,
0.9616657, 0.06316214, 1.694394, 1, 0, 0, 1, 1,
0.962952, -0.4180807, 1.64766, 1, 0, 0, 1, 1,
0.9672258, 0.2840365, 2.521823, 0, 0, 0, 1, 1,
0.9672567, -1.626413, 2.735258, 0, 0, 0, 1, 1,
0.9744393, -0.9755425, 4.904518, 0, 0, 0, 1, 1,
0.9793099, 0.5328711, 1.553455, 0, 0, 0, 1, 1,
0.9837104, 1.737001, 2.382314, 0, 0, 0, 1, 1,
0.9848344, 0.003576913, 0.2416468, 0, 0, 0, 1, 1,
0.9853844, 1.141735, -0.2916965, 0, 0, 0, 1, 1,
0.9864626, -0.2888652, 1.628128, 1, 1, 1, 1, 1,
0.9951572, 2.524648, 1.14131, 1, 1, 1, 1, 1,
1.00259, -0.1013489, 1.283775, 1, 1, 1, 1, 1,
1.006462, -0.6878851, 0.1690069, 1, 1, 1, 1, 1,
1.007692, -2.056665, 2.656083, 1, 1, 1, 1, 1,
1.012577, -0.3757336, 1.405649, 1, 1, 1, 1, 1,
1.033253, -0.1696358, 2.772227, 1, 1, 1, 1, 1,
1.033291, 1.188536, 1.150365, 1, 1, 1, 1, 1,
1.03395, 1.04091, -0.4876506, 1, 1, 1, 1, 1,
1.039364, 1.940152, -1.324223, 1, 1, 1, 1, 1,
1.044557, -1.314019, 2.558309, 1, 1, 1, 1, 1,
1.046306, 2.324377, 1.429498, 1, 1, 1, 1, 1,
1.04896, -1.136845, 2.220441, 1, 1, 1, 1, 1,
1.052482, 0.5493593, 0.6383805, 1, 1, 1, 1, 1,
1.059631, -0.5506828, 1.501992, 1, 1, 1, 1, 1,
1.062024, 0.3163498, -0.5742398, 0, 0, 1, 1, 1,
1.062502, -0.4899144, 2.278889, 1, 0, 0, 1, 1,
1.063853, 1.467896, 1.024929, 1, 0, 0, 1, 1,
1.063905, -1.382066, 3.276332, 1, 0, 0, 1, 1,
1.065281, 0.291276, 3.647465, 1, 0, 0, 1, 1,
1.06814, -0.2664872, 1.348826, 1, 0, 0, 1, 1,
1.076332, 0.3200667, 2.39953, 0, 0, 0, 1, 1,
1.087155, 1.118563, 1.932711, 0, 0, 0, 1, 1,
1.095026, 0.8337475, 1.834412, 0, 0, 0, 1, 1,
1.095885, -0.06072774, 1.962548, 0, 0, 0, 1, 1,
1.116848, -1.34314, 1.254894, 0, 0, 0, 1, 1,
1.117425, -2.131178, 3.435592, 0, 0, 0, 1, 1,
1.122854, 0.7155661, 0.5098016, 0, 0, 0, 1, 1,
1.124907, -0.3944988, 2.444788, 1, 1, 1, 1, 1,
1.127345, -0.04263562, 3.502079, 1, 1, 1, 1, 1,
1.128446, 0.4983993, 1.317838, 1, 1, 1, 1, 1,
1.13322, -0.9639429, 1.941097, 1, 1, 1, 1, 1,
1.13325, -0.5565782, 1.897847, 1, 1, 1, 1, 1,
1.137656, -0.4999956, 2.199517, 1, 1, 1, 1, 1,
1.138976, 0.6908535, 1.847024, 1, 1, 1, 1, 1,
1.141907, 0.8308745, 0.1210225, 1, 1, 1, 1, 1,
1.146002, 1.103028, 1.028058, 1, 1, 1, 1, 1,
1.149404, 0.6585062, 2.097791, 1, 1, 1, 1, 1,
1.153491, 1.36628, -0.1834986, 1, 1, 1, 1, 1,
1.155359, -0.1233592, 0.791303, 1, 1, 1, 1, 1,
1.158082, -0.20111, 1.911446, 1, 1, 1, 1, 1,
1.162906, -1.440194, 2.155141, 1, 1, 1, 1, 1,
1.164651, 1.702049, 1.178651, 1, 1, 1, 1, 1,
1.16857, 0.4177582, 1.560346, 0, 0, 1, 1, 1,
1.171812, 0.9002376, -0.05171804, 1, 0, 0, 1, 1,
1.18003, -1.645449, 3.9267, 1, 0, 0, 1, 1,
1.180627, -1.552229, 3.091491, 1, 0, 0, 1, 1,
1.184603, 0.9217857, 1.854774, 1, 0, 0, 1, 1,
1.187878, 0.2780604, 1.85413, 1, 0, 0, 1, 1,
1.189373, 0.2296113, 1.718998, 0, 0, 0, 1, 1,
1.192928, 1.220127, 1.527193, 0, 0, 0, 1, 1,
1.205377, 1.218463, 0.2204141, 0, 0, 0, 1, 1,
1.207363, -0.8585432, 1.996639, 0, 0, 0, 1, 1,
1.207511, -0.636103, 0.4398049, 0, 0, 0, 1, 1,
1.207905, -1.949493, 2.151613, 0, 0, 0, 1, 1,
1.211295, -0.9047067, 2.210548, 0, 0, 0, 1, 1,
1.218114, 1.401551, 2.414028, 1, 1, 1, 1, 1,
1.220462, 0.3223294, 0.4645028, 1, 1, 1, 1, 1,
1.221925, -1.737344, 1.560121, 1, 1, 1, 1, 1,
1.224774, -2.298279, 1.750517, 1, 1, 1, 1, 1,
1.22938, -1.431622, 1.883632, 1, 1, 1, 1, 1,
1.23432, -0.7775907, 2.879488, 1, 1, 1, 1, 1,
1.250604, -0.08298792, 3.86288, 1, 1, 1, 1, 1,
1.266543, 0.2980769, 0.9166434, 1, 1, 1, 1, 1,
1.269866, 0.09517027, 2.388845, 1, 1, 1, 1, 1,
1.272606, 1.257391, 1.185552, 1, 1, 1, 1, 1,
1.272987, -0.1819694, 3.610522, 1, 1, 1, 1, 1,
1.284177, 0.9191015, 1.379899, 1, 1, 1, 1, 1,
1.291479, 0.3402652, 0.7440838, 1, 1, 1, 1, 1,
1.293838, 0.195016, 2.624449, 1, 1, 1, 1, 1,
1.298144, -0.4962181, 1.739099, 1, 1, 1, 1, 1,
1.299601, 1.238974, -0.6266789, 0, 0, 1, 1, 1,
1.304827, -1.034105, 2.320475, 1, 0, 0, 1, 1,
1.309555, -0.8941661, 0.7090173, 1, 0, 0, 1, 1,
1.310158, -0.4870231, 3.410319, 1, 0, 0, 1, 1,
1.312254, -0.4408188, 2.596424, 1, 0, 0, 1, 1,
1.3167, -0.1393455, 1.978568, 1, 0, 0, 1, 1,
1.31731, -0.8102939, 1.445857, 0, 0, 0, 1, 1,
1.319792, -0.9731855, 2.204307, 0, 0, 0, 1, 1,
1.329212, 0.9318631, 1.45849, 0, 0, 0, 1, 1,
1.331355, 0.355715, 0.855721, 0, 0, 0, 1, 1,
1.335608, 1.321639, 1.112787, 0, 0, 0, 1, 1,
1.336866, -0.1716789, 2.546468, 0, 0, 0, 1, 1,
1.339882, -1.155619, 1.419316, 0, 0, 0, 1, 1,
1.340734, -0.8332707, 1.294175, 1, 1, 1, 1, 1,
1.341749, -1.00078, 2.927535, 1, 1, 1, 1, 1,
1.344597, -0.8938454, 3.107035, 1, 1, 1, 1, 1,
1.356788, 0.04300239, 0.6630969, 1, 1, 1, 1, 1,
1.361299, -0.8856072, 2.059925, 1, 1, 1, 1, 1,
1.365288, -0.7478901, 1.700008, 1, 1, 1, 1, 1,
1.367787, 0.4698731, 0.3900779, 1, 1, 1, 1, 1,
1.368739, 1.012973, -1.23319, 1, 1, 1, 1, 1,
1.379783, 2.188704, -0.4791983, 1, 1, 1, 1, 1,
1.387298, 0.4964625, 1.34292, 1, 1, 1, 1, 1,
1.398922, 0.5836812, 1.232688, 1, 1, 1, 1, 1,
1.399363, 0.1613798, 1.102825, 1, 1, 1, 1, 1,
1.401452, -0.3940927, 2.846088, 1, 1, 1, 1, 1,
1.415644, 0.297446, 1.840449, 1, 1, 1, 1, 1,
1.423084, 0.3931437, 0.6353839, 1, 1, 1, 1, 1,
1.424259, 1.414694, 2.612869, 0, 0, 1, 1, 1,
1.427357, 0.5364741, 0.5730495, 1, 0, 0, 1, 1,
1.428903, 1.263554, 0.6778703, 1, 0, 0, 1, 1,
1.431397, -0.5950705, 2.672438, 1, 0, 0, 1, 1,
1.440583, -1.099585, 3.283067, 1, 0, 0, 1, 1,
1.442447, 1.675887, 1.374111, 1, 0, 0, 1, 1,
1.443973, 1.395969, -1.68228, 0, 0, 0, 1, 1,
1.449985, 0.890543, 2.957059, 0, 0, 0, 1, 1,
1.464496, 1.414473, 0.8302484, 0, 0, 0, 1, 1,
1.475119, 1.053241, 2.512167, 0, 0, 0, 1, 1,
1.476996, 3.75206, -0.8640226, 0, 0, 0, 1, 1,
1.492308, -1.901261, 2.711336, 0, 0, 0, 1, 1,
1.494734, -1.227561, 1.761592, 0, 0, 0, 1, 1,
1.497768, -0.4522139, 2.534254, 1, 1, 1, 1, 1,
1.501061, -0.3035244, 2.229677, 1, 1, 1, 1, 1,
1.507802, 0.8236346, -0.04955233, 1, 1, 1, 1, 1,
1.508325, 0.0911116, -0.3473236, 1, 1, 1, 1, 1,
1.515095, -0.2234294, 2.776944, 1, 1, 1, 1, 1,
1.526415, 0.6248081, 0.8421105, 1, 1, 1, 1, 1,
1.527924, 0.8547256, 0.6382655, 1, 1, 1, 1, 1,
1.535199, 0.1566328, 2.06731, 1, 1, 1, 1, 1,
1.535817, 0.7574713, 0.2635341, 1, 1, 1, 1, 1,
1.537431, -0.4675853, 2.365086, 1, 1, 1, 1, 1,
1.559637, -1.328992, 2.22304, 1, 1, 1, 1, 1,
1.560552, 0.763104, -0.7902112, 1, 1, 1, 1, 1,
1.581035, -0.3343292, 0.6867588, 1, 1, 1, 1, 1,
1.582982, 1.111203, 0.5259581, 1, 1, 1, 1, 1,
1.596959, -0.4914666, 0.8542669, 1, 1, 1, 1, 1,
1.597807, 0.04875707, 1.783124, 0, 0, 1, 1, 1,
1.602844, -1.086046, 2.734212, 1, 0, 0, 1, 1,
1.603122, 1.980101, -0.1468652, 1, 0, 0, 1, 1,
1.632749, -0.009512303, 1.401786, 1, 0, 0, 1, 1,
1.635875, 0.8938818, 2.62195, 1, 0, 0, 1, 1,
1.640406, 0.339975, 1.750283, 1, 0, 0, 1, 1,
1.653777, -0.06097802, 1.582747, 0, 0, 0, 1, 1,
1.662269, -0.01395301, 1.39398, 0, 0, 0, 1, 1,
1.670715, 1.169634, 0.6384825, 0, 0, 0, 1, 1,
1.704453, 0.8915127, 1.141623, 0, 0, 0, 1, 1,
1.719497, 1.968168, 0.8530151, 0, 0, 0, 1, 1,
1.739301, 0.2666716, 0.1571018, 0, 0, 0, 1, 1,
1.751252, -0.7577561, 1.157775, 0, 0, 0, 1, 1,
1.75237, -0.5869721, 1.018957, 1, 1, 1, 1, 1,
1.758581, 0.07381401, 1.285387, 1, 1, 1, 1, 1,
1.771577, 0.4749132, 2.148496, 1, 1, 1, 1, 1,
1.789024, -0.5672153, 1.451954, 1, 1, 1, 1, 1,
1.799068, 0.7020452, 3.70319, 1, 1, 1, 1, 1,
1.807625, 0.4699143, 1.412224, 1, 1, 1, 1, 1,
1.816271, -0.6974025, 1.279616, 1, 1, 1, 1, 1,
1.841174, 1.339472, 0.7986448, 1, 1, 1, 1, 1,
1.851717, -0.488575, -0.02034571, 1, 1, 1, 1, 1,
1.858884, 0.8423736, 1.405524, 1, 1, 1, 1, 1,
1.884801, -1.294881, 0.9181674, 1, 1, 1, 1, 1,
1.900881, 0.06864136, 1.316079, 1, 1, 1, 1, 1,
1.924001, -0.02442953, 2.48393, 1, 1, 1, 1, 1,
1.940279, -2.502527, 1.983777, 1, 1, 1, 1, 1,
1.990325, -1.166196, 3.794866, 1, 1, 1, 1, 1,
2.037266, -0.9755989, 2.947331, 0, 0, 1, 1, 1,
2.083705, 0.3693022, 2.123071, 1, 0, 0, 1, 1,
2.164481, 0.7773999, 1.532906, 1, 0, 0, 1, 1,
2.196906, -0.5249891, 0.5832731, 1, 0, 0, 1, 1,
2.198128, 0.3356775, 2.283546, 1, 0, 0, 1, 1,
2.214384, 0.255359, 2.070535, 1, 0, 0, 1, 1,
2.216398, 1.055843, -0.09944451, 0, 0, 0, 1, 1,
2.220454, -0.5860695, 0.6653717, 0, 0, 0, 1, 1,
2.26294, -1.032466, 2.83035, 0, 0, 0, 1, 1,
2.270504, 0.9879234, 1.049804, 0, 0, 0, 1, 1,
2.274841, -0.5842602, 0.1160919, 0, 0, 0, 1, 1,
2.322968, 2.477945, 0.9154384, 0, 0, 0, 1, 1,
2.402014, -1.767152, 3.077189, 0, 0, 0, 1, 1,
2.752213, 0.07217619, 1.080224, 1, 1, 1, 1, 1,
2.836155, 0.1684194, 2.412113, 1, 1, 1, 1, 1,
3.063174, -1.249667, 0.2685705, 1, 1, 1, 1, 1,
3.219198, 1.88384, 0.04233503, 1, 1, 1, 1, 1,
3.315986, 0.54187, 1.725557, 1, 1, 1, 1, 1,
3.723162, -1.264938, 1.955864, 1, 1, 1, 1, 1,
3.803036, -0.9753248, 1.598448, 1, 1, 1, 1, 1
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
var radius = 9.793345;
var distance = 34.39871;
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
mvMatrix.translate( -0.4231949, -0.005443335, -0.03339171 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39871);
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
