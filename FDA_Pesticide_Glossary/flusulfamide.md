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
-3.039827, 0.4515249, -0.2602388, 1, 0, 0, 1,
-2.901478, 1.701883, -0.4137113, 1, 0.007843138, 0, 1,
-2.70511, 1.988771, -0.6257479, 1, 0.01176471, 0, 1,
-2.647261, -0.780041, -3.56295, 1, 0.01960784, 0, 1,
-2.487003, 0.000406395, -0.3237906, 1, 0.02352941, 0, 1,
-2.427339, 0.04112067, -2.152063, 1, 0.03137255, 0, 1,
-2.409221, 0.2712595, -2.066402, 1, 0.03529412, 0, 1,
-2.319588, 0.2897226, -2.049949, 1, 0.04313726, 0, 1,
-2.293425, -0.3672051, -0.1588993, 1, 0.04705882, 0, 1,
-2.238861, -0.3453336, -0.1835293, 1, 0.05490196, 0, 1,
-2.163013, -1.620331, -3.518432, 1, 0.05882353, 0, 1,
-2.1506, -0.3609208, -1.169937, 1, 0.06666667, 0, 1,
-2.144894, -0.6700991, -2.039546, 1, 0.07058824, 0, 1,
-2.087053, 1.150701, -1.54672, 1, 0.07843138, 0, 1,
-2.062052, -1.382581, -1.934949, 1, 0.08235294, 0, 1,
-2.024622, 2.078819, -2.17848, 1, 0.09019608, 0, 1,
-1.997634, -0.1229626, -1.4919, 1, 0.09411765, 0, 1,
-1.992767, 0.3574933, 0.1967707, 1, 0.1019608, 0, 1,
-1.982718, -0.08125655, -1.937856, 1, 0.1098039, 0, 1,
-1.943937, -0.5631413, -3.087909, 1, 0.1137255, 0, 1,
-1.941201, -0.4398256, 0.1202248, 1, 0.1215686, 0, 1,
-1.904709, 0.9125879, 0.7610056, 1, 0.1254902, 0, 1,
-1.900075, -0.02615544, -0.9308113, 1, 0.1333333, 0, 1,
-1.879023, 1.388711, -1.744435, 1, 0.1372549, 0, 1,
-1.845628, 0.5032685, -1.120769, 1, 0.145098, 0, 1,
-1.82983, -0.7651982, -2.44289, 1, 0.1490196, 0, 1,
-1.808953, -0.2079602, -2.396955, 1, 0.1568628, 0, 1,
-1.79808, 0.6053302, -0.4844764, 1, 0.1607843, 0, 1,
-1.717638, -0.124306, -1.903848, 1, 0.1686275, 0, 1,
-1.707573, 0.9709516, -0.7713149, 1, 0.172549, 0, 1,
-1.705742, 0.7762158, -1.968849, 1, 0.1803922, 0, 1,
-1.687644, 2.216183, -0.8075603, 1, 0.1843137, 0, 1,
-1.684121, -0.7559132, -1.347224, 1, 0.1921569, 0, 1,
-1.683148, 0.7617143, -2.184698, 1, 0.1960784, 0, 1,
-1.677647, 0.260989, -1.607162, 1, 0.2039216, 0, 1,
-1.676345, -1.788889, -3.127166, 1, 0.2117647, 0, 1,
-1.6665, 0.5330994, -3.945837, 1, 0.2156863, 0, 1,
-1.664209, -0.8186318, -1.729555, 1, 0.2235294, 0, 1,
-1.662859, -0.9753452, -3.395089, 1, 0.227451, 0, 1,
-1.654718, -1.151906, -3.838108, 1, 0.2352941, 0, 1,
-1.642448, 1.895781, -0.7564572, 1, 0.2392157, 0, 1,
-1.629772, -0.188739, 0.1394864, 1, 0.2470588, 0, 1,
-1.60966, 1.076522, -1.661997, 1, 0.2509804, 0, 1,
-1.599875, -0.3085429, -2.355828, 1, 0.2588235, 0, 1,
-1.599268, 0.4458062, -0.5884687, 1, 0.2627451, 0, 1,
-1.590682, -1.132623, -2.046278, 1, 0.2705882, 0, 1,
-1.590472, -0.6347252, -1.878932, 1, 0.2745098, 0, 1,
-1.575624, 0.2426396, -2.054672, 1, 0.282353, 0, 1,
-1.562608, 1.167537, -0.03499605, 1, 0.2862745, 0, 1,
-1.559571, 1.387272, -0.7033115, 1, 0.2941177, 0, 1,
-1.554948, -0.2421004, -1.243746, 1, 0.3019608, 0, 1,
-1.55225, 0.5710581, 0.2747223, 1, 0.3058824, 0, 1,
-1.548351, 0.3944025, -1.442761, 1, 0.3137255, 0, 1,
-1.545764, 0.9800287, 1.092999, 1, 0.3176471, 0, 1,
-1.530903, -0.9650301, -2.302768, 1, 0.3254902, 0, 1,
-1.530683, 0.3704118, -1.607646, 1, 0.3294118, 0, 1,
-1.526016, -1.287313, -1.718827, 1, 0.3372549, 0, 1,
-1.525586, -2.135494, -2.653423, 1, 0.3411765, 0, 1,
-1.51702, 0.9961534, -0.4435139, 1, 0.3490196, 0, 1,
-1.508757, 0.8481696, -2.223729, 1, 0.3529412, 0, 1,
-1.501095, 0.9066054, -0.8737578, 1, 0.3607843, 0, 1,
-1.500614, 0.9722254, -0.5247148, 1, 0.3647059, 0, 1,
-1.500458, -1.967043, -3.391877, 1, 0.372549, 0, 1,
-1.500166, 0.4446879, -0.3343416, 1, 0.3764706, 0, 1,
-1.485825, -0.7491743, -2.631721, 1, 0.3843137, 0, 1,
-1.460107, 0.4225515, -1.969334, 1, 0.3882353, 0, 1,
-1.451379, -2.429211, -3.178847, 1, 0.3960784, 0, 1,
-1.450041, 0.762054, -0.983493, 1, 0.4039216, 0, 1,
-1.435579, -0.716159, -1.044443, 1, 0.4078431, 0, 1,
-1.435307, -0.6017348, -0.9952295, 1, 0.4156863, 0, 1,
-1.434815, 0.6409305, -1.362735, 1, 0.4196078, 0, 1,
-1.431959, 1.124386, -0.9142932, 1, 0.427451, 0, 1,
-1.424123, 1.022485, -0.4034023, 1, 0.4313726, 0, 1,
-1.42001, 0.3248446, -0.8576626, 1, 0.4392157, 0, 1,
-1.414032, 0.04123475, -1.396786, 1, 0.4431373, 0, 1,
-1.41068, 0.255502, -0.7148268, 1, 0.4509804, 0, 1,
-1.402257, 1.154658, -1.88651, 1, 0.454902, 0, 1,
-1.397459, -0.4127688, -1.161427, 1, 0.4627451, 0, 1,
-1.395334, -0.4913402, -4.042155, 1, 0.4666667, 0, 1,
-1.389458, -1.243383, -3.130302, 1, 0.4745098, 0, 1,
-1.387793, -0.4632017, -1.213483, 1, 0.4784314, 0, 1,
-1.387713, -0.2027192, -1.532307, 1, 0.4862745, 0, 1,
-1.375623, -1.677489, -2.329378, 1, 0.4901961, 0, 1,
-1.370093, -1.701546, -3.390968, 1, 0.4980392, 0, 1,
-1.363738, -1.818778, -0.3403239, 1, 0.5058824, 0, 1,
-1.359879, -0.2674193, -2.835965, 1, 0.509804, 0, 1,
-1.359475, 1.939772, 0.2526349, 1, 0.5176471, 0, 1,
-1.354715, 0.09913788, 0.1065086, 1, 0.5215687, 0, 1,
-1.351124, 1.513395, -0.2017514, 1, 0.5294118, 0, 1,
-1.347608, 0.1929469, -2.842543, 1, 0.5333334, 0, 1,
-1.330938, 1.548649, -1.57605, 1, 0.5411765, 0, 1,
-1.330283, -1.425986, -2.061864, 1, 0.5450981, 0, 1,
-1.31136, 0.2476224, -0.591241, 1, 0.5529412, 0, 1,
-1.310287, -0.5353897, -1.730867, 1, 0.5568628, 0, 1,
-1.30689, 0.3941732, -2.479445, 1, 0.5647059, 0, 1,
-1.305443, 0.8066372, -0.5567912, 1, 0.5686275, 0, 1,
-1.283327, 1.285002, 1.511205, 1, 0.5764706, 0, 1,
-1.276401, 0.6276466, 0.1346508, 1, 0.5803922, 0, 1,
-1.27348, -0.4613494, -1.644617, 1, 0.5882353, 0, 1,
-1.268038, -1.252244, -2.95309, 1, 0.5921569, 0, 1,
-1.265975, -0.3507827, -1.870801, 1, 0.6, 0, 1,
-1.2642, 0.2419616, -0.3379695, 1, 0.6078432, 0, 1,
-1.261932, 1.253482, -0.8696486, 1, 0.6117647, 0, 1,
-1.255326, 0.2402905, -2.095836, 1, 0.6196079, 0, 1,
-1.24859, 0.4377575, -2.261537, 1, 0.6235294, 0, 1,
-1.247706, -0.1240619, -1.698543, 1, 0.6313726, 0, 1,
-1.24174, 0.7830848, -0.5867136, 1, 0.6352941, 0, 1,
-1.231767, -0.4346252, 0.5777423, 1, 0.6431373, 0, 1,
-1.226658, -1.345489, -1.659922, 1, 0.6470588, 0, 1,
-1.226212, 0.7391575, -1.634917, 1, 0.654902, 0, 1,
-1.225304, 0.4985239, -0.01062767, 1, 0.6588235, 0, 1,
-1.218378, 0.271563, -1.152653, 1, 0.6666667, 0, 1,
-1.217861, -0.3361982, -3.180511, 1, 0.6705883, 0, 1,
-1.217286, 1.184417, -0.2667668, 1, 0.6784314, 0, 1,
-1.21396, -1.736467, -2.911376, 1, 0.682353, 0, 1,
-1.212115, 0.09732925, -1.035523, 1, 0.6901961, 0, 1,
-1.208994, 0.6877681, -0.7484925, 1, 0.6941177, 0, 1,
-1.204084, -1.517453, -4.151355, 1, 0.7019608, 0, 1,
-1.203785, 1.840768, -1.187975, 1, 0.7098039, 0, 1,
-1.2032, -1.415077, -1.430109, 1, 0.7137255, 0, 1,
-1.195552, -0.06855468, -0.2922996, 1, 0.7215686, 0, 1,
-1.194541, -1.825469, -3.418923, 1, 0.7254902, 0, 1,
-1.188594, 1.718603, -1.121548, 1, 0.7333333, 0, 1,
-1.185995, 0.3284242, -1.076657, 1, 0.7372549, 0, 1,
-1.175871, -0.1853499, -0.4639732, 1, 0.7450981, 0, 1,
-1.175661, 0.0813809, -3.761655, 1, 0.7490196, 0, 1,
-1.171712, -0.5096476, -1.849774, 1, 0.7568628, 0, 1,
-1.170486, 0.08624199, -0.6119989, 1, 0.7607843, 0, 1,
-1.160595, 0.2649403, -2.121038, 1, 0.7686275, 0, 1,
-1.157798, 0.876427, -1.001563, 1, 0.772549, 0, 1,
-1.154029, -0.3317006, -1.757079, 1, 0.7803922, 0, 1,
-1.153936, -2.690309, -2.963216, 1, 0.7843137, 0, 1,
-1.152912, 0.4327971, -0.4791215, 1, 0.7921569, 0, 1,
-1.143486, -0.2095604, -0.6956094, 1, 0.7960784, 0, 1,
-1.143347, -0.6618863, -3.58516, 1, 0.8039216, 0, 1,
-1.141558, 0.2667753, -1.184173, 1, 0.8117647, 0, 1,
-1.138954, 0.1430827, -1.01064, 1, 0.8156863, 0, 1,
-1.138657, 1.648913, -0.3888911, 1, 0.8235294, 0, 1,
-1.134759, 0.9872122, -0.2596655, 1, 0.827451, 0, 1,
-1.134185, 0.9724203, 0.4817178, 1, 0.8352941, 0, 1,
-1.133957, 0.2001654, -1.851363, 1, 0.8392157, 0, 1,
-1.128814, 0.6807306, 0.1525375, 1, 0.8470588, 0, 1,
-1.128709, 1.699966, -0.3472872, 1, 0.8509804, 0, 1,
-1.127127, -0.5217035, -2.890354, 1, 0.8588235, 0, 1,
-1.123947, 0.5224769, -0.114296, 1, 0.8627451, 0, 1,
-1.121445, -0.151393, -1.043548, 1, 0.8705882, 0, 1,
-1.119332, 1.201375, -1.213204, 1, 0.8745098, 0, 1,
-1.110614, 1.093338, -0.8567457, 1, 0.8823529, 0, 1,
-1.108311, 0.9992126, -1.161059, 1, 0.8862745, 0, 1,
-1.104896, 1.672901, -0.6110535, 1, 0.8941177, 0, 1,
-1.092032, -1.229757, -3.007123, 1, 0.8980392, 0, 1,
-1.082813, 0.4836043, -0.3635526, 1, 0.9058824, 0, 1,
-1.082044, -0.08822785, -3.579997, 1, 0.9137255, 0, 1,
-1.081856, 0.1294264, -2.610948, 1, 0.9176471, 0, 1,
-1.080101, 0.9140084, -0.2164976, 1, 0.9254902, 0, 1,
-1.076007, 0.7731915, 0.9039572, 1, 0.9294118, 0, 1,
-1.070117, 1.857432, 0.1672485, 1, 0.9372549, 0, 1,
-1.069533, -0.5272911, -3.452963, 1, 0.9411765, 0, 1,
-1.068623, 1.037152, 0.1835392, 1, 0.9490196, 0, 1,
-1.066772, 0.05826781, -0.5187042, 1, 0.9529412, 0, 1,
-1.063699, 2.122641, -0.7075766, 1, 0.9607843, 0, 1,
-1.057108, 1.860038, 1.530875, 1, 0.9647059, 0, 1,
-1.055555, 0.1122518, -1.902095, 1, 0.972549, 0, 1,
-1.052234, 1.58538, -0.4801154, 1, 0.9764706, 0, 1,
-1.043538, 0.05788632, -1.021082, 1, 0.9843137, 0, 1,
-1.043299, 0.1088682, -0.5439097, 1, 0.9882353, 0, 1,
-1.035587, -1.046142, -1.97037, 1, 0.9960784, 0, 1,
-1.01991, -0.1052716, -2.572039, 0.9960784, 1, 0, 1,
-1.019902, 0.38704, -1.946979, 0.9921569, 1, 0, 1,
-1.019896, 1.163761, 0.06612199, 0.9843137, 1, 0, 1,
-1.009964, 0.7503727, -0.5206228, 0.9803922, 1, 0, 1,
-1.009509, 0.6351335, 0.7387125, 0.972549, 1, 0, 1,
-1.006192, 0.8407587, -0.894486, 0.9686275, 1, 0, 1,
-1.002954, -0.5108744, -2.924764, 0.9607843, 1, 0, 1,
-0.9949909, 0.7185683, -0.3061545, 0.9568627, 1, 0, 1,
-0.993403, -1.666721, -3.865053, 0.9490196, 1, 0, 1,
-0.9854583, -0.6245298, -2.199754, 0.945098, 1, 0, 1,
-0.9836693, 0.6963707, -0.2519726, 0.9372549, 1, 0, 1,
-0.9794202, -0.3310975, -2.343654, 0.9333333, 1, 0, 1,
-0.9784048, 0.727433, -2.075143, 0.9254902, 1, 0, 1,
-0.978259, -1.152152, -3.577555, 0.9215686, 1, 0, 1,
-0.9731684, -0.7957515, -2.026698, 0.9137255, 1, 0, 1,
-0.9682326, 1.2477, 0.3486043, 0.9098039, 1, 0, 1,
-0.9668334, -0.8646702, -2.842715, 0.9019608, 1, 0, 1,
-0.960849, 0.04997398, -1.498083, 0.8941177, 1, 0, 1,
-0.953391, 0.4842302, -2.545713, 0.8901961, 1, 0, 1,
-0.95057, -0.7140691, -1.49936, 0.8823529, 1, 0, 1,
-0.9481486, 0.6372634, 0.2476023, 0.8784314, 1, 0, 1,
-0.9475026, 1.488426, -0.9908278, 0.8705882, 1, 0, 1,
-0.9436188, -0.3611694, -5.23753, 0.8666667, 1, 0, 1,
-0.9432372, -2.293355, -2.698985, 0.8588235, 1, 0, 1,
-0.9415581, -0.7157754, -3.288142, 0.854902, 1, 0, 1,
-0.9389976, -0.337054, -1.50063, 0.8470588, 1, 0, 1,
-0.9375495, -0.2056698, -2.675795, 0.8431373, 1, 0, 1,
-0.9370245, 0.9488718, -0.0918373, 0.8352941, 1, 0, 1,
-0.9288653, -0.6601483, -1.632821, 0.8313726, 1, 0, 1,
-0.9261014, 0.6186205, -1.389056, 0.8235294, 1, 0, 1,
-0.9259846, 1.353613, -1.441119, 0.8196079, 1, 0, 1,
-0.9244499, -0.3327924, -1.113174, 0.8117647, 1, 0, 1,
-0.9021112, 1.174316, -1.447054, 0.8078431, 1, 0, 1,
-0.9009085, -0.9182497, -2.5589, 0.8, 1, 0, 1,
-0.8971945, -2.525375, -1.474196, 0.7921569, 1, 0, 1,
-0.8857707, -0.2002681, 0.2188456, 0.7882353, 1, 0, 1,
-0.8841391, -1.477, -2.742259, 0.7803922, 1, 0, 1,
-0.8815867, 2.736382, -1.93749, 0.7764706, 1, 0, 1,
-0.8713765, -1.755225, -3.171276, 0.7686275, 1, 0, 1,
-0.871345, 0.7383432, -1.261071, 0.7647059, 1, 0, 1,
-0.8705428, -0.3409808, -0.7681451, 0.7568628, 1, 0, 1,
-0.8698085, 0.4617833, -1.317565, 0.7529412, 1, 0, 1,
-0.8689259, -0.3821621, -0.7321536, 0.7450981, 1, 0, 1,
-0.8632349, 1.475292, -0.3321708, 0.7411765, 1, 0, 1,
-0.8625332, -1.672747, -4.043904, 0.7333333, 1, 0, 1,
-0.8499482, 0.387389, -1.081147, 0.7294118, 1, 0, 1,
-0.8479909, -0.1518958, -2.361311, 0.7215686, 1, 0, 1,
-0.8479407, -1.212078, -2.30321, 0.7176471, 1, 0, 1,
-0.8426914, -0.8016289, -2.834991, 0.7098039, 1, 0, 1,
-0.8401382, -1.164073, -2.484521, 0.7058824, 1, 0, 1,
-0.8373321, -0.01917584, -2.962231, 0.6980392, 1, 0, 1,
-0.8338562, 0.1811463, -0.2505321, 0.6901961, 1, 0, 1,
-0.8332822, 1.160689, -0.2853627, 0.6862745, 1, 0, 1,
-0.8315673, 0.9300383, -0.09600841, 0.6784314, 1, 0, 1,
-0.8300387, 0.9417528, -1.371604, 0.6745098, 1, 0, 1,
-0.8256829, 0.3207673, -2.223358, 0.6666667, 1, 0, 1,
-0.8203731, 0.5025387, 0.6207463, 0.6627451, 1, 0, 1,
-0.8137539, -0.5167344, -1.20471, 0.654902, 1, 0, 1,
-0.8131034, 1.192949, -1.743202, 0.6509804, 1, 0, 1,
-0.8117515, -2.757206, -2.812413, 0.6431373, 1, 0, 1,
-0.8092637, 0.8314161, -0.4532969, 0.6392157, 1, 0, 1,
-0.8061001, 0.3535862, -0.9436694, 0.6313726, 1, 0, 1,
-0.7996404, -0.4546159, -2.370934, 0.627451, 1, 0, 1,
-0.7943859, -0.8650814, -1.386249, 0.6196079, 1, 0, 1,
-0.790965, 0.2068022, 0.7124908, 0.6156863, 1, 0, 1,
-0.7884961, 1.122074, -0.2446797, 0.6078432, 1, 0, 1,
-0.7759801, 0.4137087, -0.89741, 0.6039216, 1, 0, 1,
-0.7737191, 0.6395765, -1.424756, 0.5960785, 1, 0, 1,
-0.7735865, 0.6593038, -1.596756, 0.5882353, 1, 0, 1,
-0.7733372, 0.1438495, -0.03059541, 0.5843138, 1, 0, 1,
-0.7706115, 0.1637317, -1.061208, 0.5764706, 1, 0, 1,
-0.7699584, -0.3120078, -1.294998, 0.572549, 1, 0, 1,
-0.7675306, -0.447031, -1.623821, 0.5647059, 1, 0, 1,
-0.7656616, 0.35373, 0.6890665, 0.5607843, 1, 0, 1,
-0.7628992, -0.2127274, -1.827024, 0.5529412, 1, 0, 1,
-0.7583215, -0.998434, -3.435573, 0.5490196, 1, 0, 1,
-0.7534786, -1.05529, -1.251129, 0.5411765, 1, 0, 1,
-0.7505574, 0.7934428, -1.211878, 0.5372549, 1, 0, 1,
-0.7502467, 0.3476014, -2.223142, 0.5294118, 1, 0, 1,
-0.7470781, -0.7660539, -4.399135, 0.5254902, 1, 0, 1,
-0.7467997, -0.4582041, -1.340034, 0.5176471, 1, 0, 1,
-0.743677, 0.2690234, -2.699396, 0.5137255, 1, 0, 1,
-0.7427412, -1.134641, -2.187733, 0.5058824, 1, 0, 1,
-0.7391461, -0.002593703, -0.7800419, 0.5019608, 1, 0, 1,
-0.7360001, 1.401342, 2.44203, 0.4941176, 1, 0, 1,
-0.7352753, 1.268442, 0.8857609, 0.4862745, 1, 0, 1,
-0.7336708, 1.280602, -1.765242, 0.4823529, 1, 0, 1,
-0.7287928, -1.026508, -2.21279, 0.4745098, 1, 0, 1,
-0.7286761, -0.2430641, -2.162149, 0.4705882, 1, 0, 1,
-0.7239641, 0.2043253, -0.6643481, 0.4627451, 1, 0, 1,
-0.7231176, 1.328951, -1.043507, 0.4588235, 1, 0, 1,
-0.7210256, -0.222905, -1.224711, 0.4509804, 1, 0, 1,
-0.7196091, 0.5703295, -1.170844, 0.4470588, 1, 0, 1,
-0.7190936, 0.1124203, -1.517842, 0.4392157, 1, 0, 1,
-0.7063492, 1.064563, -0.7419757, 0.4352941, 1, 0, 1,
-0.6976663, -0.2201124, -2.083735, 0.427451, 1, 0, 1,
-0.6951517, -2.017357, -2.787344, 0.4235294, 1, 0, 1,
-0.6928134, 0.4749546, 0.7638959, 0.4156863, 1, 0, 1,
-0.6903651, -0.8250691, -2.000999, 0.4117647, 1, 0, 1,
-0.6867393, -0.7374854, -1.608971, 0.4039216, 1, 0, 1,
-0.6854642, 0.9163145, -0.9302162, 0.3960784, 1, 0, 1,
-0.6844252, 0.6018355, 0.3714425, 0.3921569, 1, 0, 1,
-0.6824169, 0.496608, -1.16226, 0.3843137, 1, 0, 1,
-0.6785291, -0.6174844, -2.082784, 0.3803922, 1, 0, 1,
-0.6716325, -0.6838791, -3.389634, 0.372549, 1, 0, 1,
-0.6687062, 0.9951143, 0.3053063, 0.3686275, 1, 0, 1,
-0.6628357, -0.814053, -3.885198, 0.3607843, 1, 0, 1,
-0.659596, -0.5250667, -1.732375, 0.3568628, 1, 0, 1,
-0.657208, -0.3608949, -1.6545, 0.3490196, 1, 0, 1,
-0.6571445, -2.066809, -1.585585, 0.345098, 1, 0, 1,
-0.6564832, 3.015252, -2.375761, 0.3372549, 1, 0, 1,
-0.6564126, 2.077389, -0.07040423, 0.3333333, 1, 0, 1,
-0.6507934, 0.1028244, -0.9858886, 0.3254902, 1, 0, 1,
-0.6437292, 0.7322278, 1.4406, 0.3215686, 1, 0, 1,
-0.6416383, -2.427217, -3.18389, 0.3137255, 1, 0, 1,
-0.6414748, -0.2643648, -2.418285, 0.3098039, 1, 0, 1,
-0.6349924, -0.2722467, -0.8820197, 0.3019608, 1, 0, 1,
-0.6326693, -2.125133, -4.568936, 0.2941177, 1, 0, 1,
-0.6283108, -0.1731375, -2.043266, 0.2901961, 1, 0, 1,
-0.627441, -1.506175, -3.628342, 0.282353, 1, 0, 1,
-0.6237971, 1.765122, 0.2647931, 0.2784314, 1, 0, 1,
-0.6203085, 2.05232, -2.230289, 0.2705882, 1, 0, 1,
-0.6131784, 0.6084384, -1.078327, 0.2666667, 1, 0, 1,
-0.612909, -1.243111, -0.4084451, 0.2588235, 1, 0, 1,
-0.6102565, -0.2560475, -2.98034, 0.254902, 1, 0, 1,
-0.6086314, 0.7338215, 1.69895, 0.2470588, 1, 0, 1,
-0.5975046, -0.735782, -3.132786, 0.2431373, 1, 0, 1,
-0.5934765, 1.221871, 1.142759, 0.2352941, 1, 0, 1,
-0.5864094, -1.256252, -4.303313, 0.2313726, 1, 0, 1,
-0.5851517, 0.1960683, -0.631377, 0.2235294, 1, 0, 1,
-0.5843026, 0.937229, -1.005872, 0.2196078, 1, 0, 1,
-0.5832057, 0.483227, -0.5301756, 0.2117647, 1, 0, 1,
-0.577831, 0.02246012, -2.325241, 0.2078431, 1, 0, 1,
-0.5678238, -0.04732482, 0.1144756, 0.2, 1, 0, 1,
-0.5622931, -0.7295908, -2.886471, 0.1921569, 1, 0, 1,
-0.5594553, 1.124104, -1.405108, 0.1882353, 1, 0, 1,
-0.5590724, 1.10189, -0.7486839, 0.1803922, 1, 0, 1,
-0.5577205, -1.355757, -2.827209, 0.1764706, 1, 0, 1,
-0.5527114, 1.153404, -0.3487863, 0.1686275, 1, 0, 1,
-0.5511654, -0.2419913, -2.690115, 0.1647059, 1, 0, 1,
-0.5496402, -0.250099, -1.857836, 0.1568628, 1, 0, 1,
-0.5488413, -1.110107, -3.384867, 0.1529412, 1, 0, 1,
-0.547001, -0.145262, -2.258013, 0.145098, 1, 0, 1,
-0.5414767, -1.276573, -2.889767, 0.1411765, 1, 0, 1,
-0.5379736, -2.323559, -1.510814, 0.1333333, 1, 0, 1,
-0.5350869, 0.745944, 0.1959494, 0.1294118, 1, 0, 1,
-0.5223348, -0.4554045, -1.608241, 0.1215686, 1, 0, 1,
-0.5202672, -0.2404541, -2.352469, 0.1176471, 1, 0, 1,
-0.5147692, -0.1447031, -1.195464, 0.1098039, 1, 0, 1,
-0.510987, -1.355618, -2.73952, 0.1058824, 1, 0, 1,
-0.508615, 0.226705, -0.9102426, 0.09803922, 1, 0, 1,
-0.5029799, 0.4770293, 0.7712927, 0.09019608, 1, 0, 1,
-0.5012745, 0.1754792, -2.133453, 0.08627451, 1, 0, 1,
-0.4991218, 0.7189157, -1.330466, 0.07843138, 1, 0, 1,
-0.4977596, -0.3079672, -4.148542, 0.07450981, 1, 0, 1,
-0.4969445, 0.6410029, -0.8302484, 0.06666667, 1, 0, 1,
-0.4964265, 0.7166291, 0.294662, 0.0627451, 1, 0, 1,
-0.4958476, 0.8567722, -0.8197713, 0.05490196, 1, 0, 1,
-0.4933026, -1.519772, -2.715411, 0.05098039, 1, 0, 1,
-0.4908242, -0.6624883, -3.462659, 0.04313726, 1, 0, 1,
-0.4891886, 0.10372, -1.079661, 0.03921569, 1, 0, 1,
-0.4870395, -1.443331, -1.048081, 0.03137255, 1, 0, 1,
-0.4793461, -1.246673, -3.402191, 0.02745098, 1, 0, 1,
-0.4773903, -0.1500479, -3.764889, 0.01960784, 1, 0, 1,
-0.472785, -1.764079, -2.419512, 0.01568628, 1, 0, 1,
-0.4671392, 0.2751724, -3.067187, 0.007843138, 1, 0, 1,
-0.4660876, -0.5640539, -5.33424, 0.003921569, 1, 0, 1,
-0.4649676, -0.5069872, -2.484817, 0, 1, 0.003921569, 1,
-0.4640551, -0.7614984, -2.342054, 0, 1, 0.01176471, 1,
-0.4603271, 0.6986158, 0.7682779, 0, 1, 0.01568628, 1,
-0.4600422, 1.150781, -1.079035, 0, 1, 0.02352941, 1,
-0.4562259, -0.7193331, -1.153955, 0, 1, 0.02745098, 1,
-0.4542599, 0.4667671, -3.141746, 0, 1, 0.03529412, 1,
-0.4525736, -0.7115033, -3.823081, 0, 1, 0.03921569, 1,
-0.4494136, 0.9898948, 0.5503504, 0, 1, 0.04705882, 1,
-0.4453808, 0.7107134, 0.1524684, 0, 1, 0.05098039, 1,
-0.441841, -0.6375722, -2.641374, 0, 1, 0.05882353, 1,
-0.4396956, 0.6790609, 0.07066611, 0, 1, 0.0627451, 1,
-0.4345665, 0.290352, -0.4875369, 0, 1, 0.07058824, 1,
-0.433716, 1.60237, -1.232512, 0, 1, 0.07450981, 1,
-0.4326599, 0.3536012, -0.5168847, 0, 1, 0.08235294, 1,
-0.4299691, 2.277349, 0.7919671, 0, 1, 0.08627451, 1,
-0.4297518, -0.5611395, -2.787935, 0, 1, 0.09411765, 1,
-0.4264095, 0.7410349, -0.9588922, 0, 1, 0.1019608, 1,
-0.4224356, -0.6888273, -2.378869, 0, 1, 0.1058824, 1,
-0.413662, -0.4791516, -3.085783, 0, 1, 0.1137255, 1,
-0.4073419, 0.1478839, -0.1138995, 0, 1, 0.1176471, 1,
-0.4046056, 1.069543, -0.04640784, 0, 1, 0.1254902, 1,
-0.4044223, 0.5777168, 0.2875314, 0, 1, 0.1294118, 1,
-0.3993748, 0.2890326, -1.378009, 0, 1, 0.1372549, 1,
-0.3982891, -0.448449, -2.005566, 0, 1, 0.1411765, 1,
-0.3878497, 0.3216904, -0.1455462, 0, 1, 0.1490196, 1,
-0.3857377, -0.849903, -2.116047, 0, 1, 0.1529412, 1,
-0.3747351, 1.853166, -1.631935, 0, 1, 0.1607843, 1,
-0.3739129, -1.321305, -2.802931, 0, 1, 0.1647059, 1,
-0.373501, -1.759209, -3.846352, 0, 1, 0.172549, 1,
-0.3661375, 0.1464357, -0.7261386, 0, 1, 0.1764706, 1,
-0.3659699, 1.72173, -1.01557, 0, 1, 0.1843137, 1,
-0.3584965, 0.2036189, -1.118983, 0, 1, 0.1882353, 1,
-0.3443826, -0.3715356, -2.419783, 0, 1, 0.1960784, 1,
-0.3441183, -0.4611611, -0.2662493, 0, 1, 0.2039216, 1,
-0.343749, 0.9930817, 0.2245021, 0, 1, 0.2078431, 1,
-0.3423576, -1.915844, -2.388535, 0, 1, 0.2156863, 1,
-0.3413541, 0.180367, -1.22436, 0, 1, 0.2196078, 1,
-0.3324803, 1.931243, -0.2815808, 0, 1, 0.227451, 1,
-0.325078, 1.148514, -1.363169, 0, 1, 0.2313726, 1,
-0.3231204, -0.02152695, -1.681277, 0, 1, 0.2392157, 1,
-0.3192276, 1.188844, -1.112946, 0, 1, 0.2431373, 1,
-0.3180822, -2.268156, -3.702599, 0, 1, 0.2509804, 1,
-0.3161992, -1.419727, -2.95415, 0, 1, 0.254902, 1,
-0.3141268, -0.3119089, -2.696513, 0, 1, 0.2627451, 1,
-0.3105671, -0.3118224, -1.114567, 0, 1, 0.2666667, 1,
-0.3075875, -0.9328566, -2.365903, 0, 1, 0.2745098, 1,
-0.3075155, 1.324713, -0.4025127, 0, 1, 0.2784314, 1,
-0.3055141, 0.2148248, -2.324718, 0, 1, 0.2862745, 1,
-0.30409, 0.07168116, -1.260646, 0, 1, 0.2901961, 1,
-0.3034564, 0.6838328, -1.681216, 0, 1, 0.2980392, 1,
-0.3013899, -0.3954264, -2.403769, 0, 1, 0.3058824, 1,
-0.2995874, -0.3841044, -2.650668, 0, 1, 0.3098039, 1,
-0.2922702, 0.003834687, -2.018616, 0, 1, 0.3176471, 1,
-0.2856123, 0.9990069, -0.6634045, 0, 1, 0.3215686, 1,
-0.2854381, 2.01017, 0.4160385, 0, 1, 0.3294118, 1,
-0.2831383, 1.471009, -1.097918, 0, 1, 0.3333333, 1,
-0.2783307, 1.281325, 0.5983595, 0, 1, 0.3411765, 1,
-0.278266, 0.09599817, -0.632506, 0, 1, 0.345098, 1,
-0.2778936, -0.7265196, -1.651024, 0, 1, 0.3529412, 1,
-0.2756181, 0.2808518, -0.6541202, 0, 1, 0.3568628, 1,
-0.2651859, 0.9209735, -0.8543929, 0, 1, 0.3647059, 1,
-0.2620407, 0.1766453, -0.5127267, 0, 1, 0.3686275, 1,
-0.2602762, 1.230761, 0.4511191, 0, 1, 0.3764706, 1,
-0.2599907, 0.9096928, -2.682481, 0, 1, 0.3803922, 1,
-0.2476988, 0.5949734, -1.360913, 0, 1, 0.3882353, 1,
-0.2469787, -1.497207, -3.305511, 0, 1, 0.3921569, 1,
-0.2398924, -1.882599, -3.306411, 0, 1, 0.4, 1,
-0.2374188, 0.3121724, 0.89332, 0, 1, 0.4078431, 1,
-0.2345483, 0.9594542, -1.813021, 0, 1, 0.4117647, 1,
-0.2294263, 1.227003, 1.790188, 0, 1, 0.4196078, 1,
-0.2290405, -1.377454, -2.289248, 0, 1, 0.4235294, 1,
-0.2259002, -1.397674, -2.388072, 0, 1, 0.4313726, 1,
-0.2228733, 0.940116, -0.4714342, 0, 1, 0.4352941, 1,
-0.2202275, -0.1141035, -0.8751833, 0, 1, 0.4431373, 1,
-0.2080996, 0.07338391, 0.5039011, 0, 1, 0.4470588, 1,
-0.2051405, -1.166392, -2.600624, 0, 1, 0.454902, 1,
-0.2040889, 2.328028, 1.441226, 0, 1, 0.4588235, 1,
-0.2014248, 0.6738669, -1.701439, 0, 1, 0.4666667, 1,
-0.1991719, 1.584795, 1.424099, 0, 1, 0.4705882, 1,
-0.1974574, -1.226332, -3.013025, 0, 1, 0.4784314, 1,
-0.1962588, -2.31583, -2.856076, 0, 1, 0.4823529, 1,
-0.1946577, -0.7927362, -2.257187, 0, 1, 0.4901961, 1,
-0.1921057, 0.4759997, -0.2639528, 0, 1, 0.4941176, 1,
-0.1915722, -0.4792188, -3.087358, 0, 1, 0.5019608, 1,
-0.1898732, 0.1564475, -1.99353, 0, 1, 0.509804, 1,
-0.1828413, -1.040385, -3.914422, 0, 1, 0.5137255, 1,
-0.1809809, 0.5475508, -0.7944694, 0, 1, 0.5215687, 1,
-0.1809595, -1.063388, -3.131203, 0, 1, 0.5254902, 1,
-0.1793911, -0.3624504, -3.533201, 0, 1, 0.5333334, 1,
-0.1790599, 0.4995804, -0.937079, 0, 1, 0.5372549, 1,
-0.1750433, -0.4240441, -2.223013, 0, 1, 0.5450981, 1,
-0.174344, 1.040341, -0.1659186, 0, 1, 0.5490196, 1,
-0.1717928, -0.2194118, -3.037205, 0, 1, 0.5568628, 1,
-0.170719, -0.8982047, -3.358104, 0, 1, 0.5607843, 1,
-0.1696449, -0.7966036, -4.12488, 0, 1, 0.5686275, 1,
-0.1652791, 0.2228769, 0.04276225, 0, 1, 0.572549, 1,
-0.1646166, -0.7214909, -3.811683, 0, 1, 0.5803922, 1,
-0.1591392, -0.743598, -1.926396, 0, 1, 0.5843138, 1,
-0.1581904, 0.4153596, -0.2366117, 0, 1, 0.5921569, 1,
-0.1571732, 1.155666, -0.05636873, 0, 1, 0.5960785, 1,
-0.1530588, -0.1369725, -1.812292, 0, 1, 0.6039216, 1,
-0.1441079, -0.1685517, -3.08126, 0, 1, 0.6117647, 1,
-0.1429436, -0.8404725, -3.348963, 0, 1, 0.6156863, 1,
-0.1403176, -0.2998632, -2.062171, 0, 1, 0.6235294, 1,
-0.1373415, -0.6997686, -2.459174, 0, 1, 0.627451, 1,
-0.1358757, 0.6589236, -1.542338, 0, 1, 0.6352941, 1,
-0.1338173, -0.6648408, -3.294032, 0, 1, 0.6392157, 1,
-0.1309712, -0.9042466, -2.927488, 0, 1, 0.6470588, 1,
-0.1292996, 0.6205835, -1.14395, 0, 1, 0.6509804, 1,
-0.1240096, 2.226802, -2.008741, 0, 1, 0.6588235, 1,
-0.1211627, 1.070846, -0.2234068, 0, 1, 0.6627451, 1,
-0.1207133, -0.5379454, -2.155153, 0, 1, 0.6705883, 1,
-0.1206463, 2.6635, 0.9596101, 0, 1, 0.6745098, 1,
-0.1204761, -1.093787, -5.733717, 0, 1, 0.682353, 1,
-0.120171, -0.3199885, -1.967551, 0, 1, 0.6862745, 1,
-0.1179217, -1.301058, -1.174358, 0, 1, 0.6941177, 1,
-0.1168095, 1.174531, -1.162565, 0, 1, 0.7019608, 1,
-0.1132751, -0.1136776, -3.452492, 0, 1, 0.7058824, 1,
-0.1122585, -1.141785, -4.999158, 0, 1, 0.7137255, 1,
-0.1093784, 0.6536627, 0.2502203, 0, 1, 0.7176471, 1,
-0.1040373, -0.1198775, -2.036028, 0, 1, 0.7254902, 1,
-0.09902841, -0.2672446, -2.558555, 0, 1, 0.7294118, 1,
-0.09407341, -0.3854637, -3.639982, 0, 1, 0.7372549, 1,
-0.08669621, -0.7652944, -3.140892, 0, 1, 0.7411765, 1,
-0.08126055, -1.643472, -1.929793, 0, 1, 0.7490196, 1,
-0.07906941, -0.79807, -1.385282, 0, 1, 0.7529412, 1,
-0.07724579, 1.347165, -1.572697, 0, 1, 0.7607843, 1,
-0.07721803, 1.784983, 0.8314609, 0, 1, 0.7647059, 1,
-0.0750649, -0.5448275, -2.97109, 0, 1, 0.772549, 1,
-0.07443646, -0.9322217, -2.429454, 0, 1, 0.7764706, 1,
-0.07166445, -0.4951506, -2.363835, 0, 1, 0.7843137, 1,
-0.07149886, -2.03488, -3.527031, 0, 1, 0.7882353, 1,
-0.06326915, 0.5358298, 0.1256528, 0, 1, 0.7960784, 1,
-0.06116167, -1.941537, -3.696832, 0, 1, 0.8039216, 1,
-0.05944634, 0.5290546, 1.107868, 0, 1, 0.8078431, 1,
-0.05828121, -1.259566, -4.22694, 0, 1, 0.8156863, 1,
-0.05497853, 0.6012681, 0.03335797, 0, 1, 0.8196079, 1,
-0.05300996, 0.6351254, 1.288082, 0, 1, 0.827451, 1,
-0.0524787, 1.222847, 2.304505, 0, 1, 0.8313726, 1,
-0.04959098, 1.342816, -0.5073012, 0, 1, 0.8392157, 1,
-0.04891324, 0.07999093, -0.7524258, 0, 1, 0.8431373, 1,
-0.04825874, -0.09007638, -2.922019, 0, 1, 0.8509804, 1,
-0.04713111, 0.9774166, 1.329943, 0, 1, 0.854902, 1,
-0.04481084, -0.4425487, -3.434469, 0, 1, 0.8627451, 1,
-0.04028061, -0.318708, -4.68652, 0, 1, 0.8666667, 1,
-0.03855229, 0.2915428, 1.569731, 0, 1, 0.8745098, 1,
-0.03368805, -0.1227771, -4.244532, 0, 1, 0.8784314, 1,
-0.03206268, 1.353352, -0.9726788, 0, 1, 0.8862745, 1,
-0.02922871, 0.3736349, -0.1323084, 0, 1, 0.8901961, 1,
-0.0283506, -0.07579063, -2.740845, 0, 1, 0.8980392, 1,
-0.02716523, 1.05758, -0.4844024, 0, 1, 0.9058824, 1,
-0.02683805, -2.324473, -2.282378, 0, 1, 0.9098039, 1,
-0.02596954, -0.07403044, -3.263728, 0, 1, 0.9176471, 1,
-0.02560564, 0.2099834, 0.20927, 0, 1, 0.9215686, 1,
-0.0243123, -0.3513136, -3.200332, 0, 1, 0.9294118, 1,
-0.02309069, 0.2407494, 2.783591, 0, 1, 0.9333333, 1,
-0.01920056, 0.59434, -1.379484, 0, 1, 0.9411765, 1,
-0.01248867, -2.071864, -4.156484, 0, 1, 0.945098, 1,
-0.005851107, 0.5416799, -0.7967114, 0, 1, 0.9529412, 1,
-0.00572696, 0.7967737, 1.003529, 0, 1, 0.9568627, 1,
-0.001816019, -0.5887691, -5.089177, 0, 1, 0.9647059, 1,
-0.0002762875, 1.053469, -1.963398, 0, 1, 0.9686275, 1,
0.004479931, -0.2824312, 4.797449, 0, 1, 0.9764706, 1,
0.00779178, -1.57907, 2.135518, 0, 1, 0.9803922, 1,
0.008746513, 1.373837, -0.2251881, 0, 1, 0.9882353, 1,
0.01470265, 1.018438, 0.5392853, 0, 1, 0.9921569, 1,
0.02276807, -0.3357403, 0.59947, 0, 1, 1, 1,
0.02740958, -0.3458364, 0.9285527, 0, 0.9921569, 1, 1,
0.02781585, 2.804611, 0.7083803, 0, 0.9882353, 1, 1,
0.02809517, 2.403888, 0.5756074, 0, 0.9803922, 1, 1,
0.02857048, 1.467096, -1.007862, 0, 0.9764706, 1, 1,
0.02984911, 0.01256443, -0.8987132, 0, 0.9686275, 1, 1,
0.03135015, 0.9723227, 0.7560861, 0, 0.9647059, 1, 1,
0.03197483, 0.3192594, 1.731099, 0, 0.9568627, 1, 1,
0.03292665, -0.57951, 3.864292, 0, 0.9529412, 1, 1,
0.03297536, 0.7037908, 0.6844748, 0, 0.945098, 1, 1,
0.03346138, -0.1547607, 3.81246, 0, 0.9411765, 1, 1,
0.0414748, -1.375995, 2.232045, 0, 0.9333333, 1, 1,
0.04284859, -1.087407, 4.019759, 0, 0.9294118, 1, 1,
0.04400328, -0.3609583, 3.744419, 0, 0.9215686, 1, 1,
0.04581828, 0.7859702, -0.5030836, 0, 0.9176471, 1, 1,
0.05053908, 0.1121584, -0.04370036, 0, 0.9098039, 1, 1,
0.05248677, -0.006376486, 0.6462606, 0, 0.9058824, 1, 1,
0.0544988, 1.815227, 1.938021, 0, 0.8980392, 1, 1,
0.05867912, -0.2811785, 2.790432, 0, 0.8901961, 1, 1,
0.0606166, -0.6942386, 2.687079, 0, 0.8862745, 1, 1,
0.06114471, -0.5076917, 2.962643, 0, 0.8784314, 1, 1,
0.06172792, 2.727295, -0.6718696, 0, 0.8745098, 1, 1,
0.06351624, -1.108729, 2.796524, 0, 0.8666667, 1, 1,
0.0677626, 0.1357157, -0.1264205, 0, 0.8627451, 1, 1,
0.07106768, -0.1813735, 2.659943, 0, 0.854902, 1, 1,
0.07137696, 0.3659352, -1.401586, 0, 0.8509804, 1, 1,
0.0756583, -0.1185788, 3.222736, 0, 0.8431373, 1, 1,
0.07667709, 0.05810139, -0.2499922, 0, 0.8392157, 1, 1,
0.08141387, -1.055832, 4.302329, 0, 0.8313726, 1, 1,
0.08266661, 0.3374295, 1.497941, 0, 0.827451, 1, 1,
0.08482654, -0.4391826, 3.634991, 0, 0.8196079, 1, 1,
0.08552475, -1.827659, 3.164982, 0, 0.8156863, 1, 1,
0.08798485, -0.3208715, 3.508105, 0, 0.8078431, 1, 1,
0.0926125, 1.250996, 1.035048, 0, 0.8039216, 1, 1,
0.09327026, 0.7282183, 1.746243, 0, 0.7960784, 1, 1,
0.0942535, -0.317738, 3.060513, 0, 0.7882353, 1, 1,
0.09599627, 1.060299, 0.5042078, 0, 0.7843137, 1, 1,
0.1011116, -1.993405, 2.710943, 0, 0.7764706, 1, 1,
0.1049382, 0.02820938, 1.853005, 0, 0.772549, 1, 1,
0.1085748, -0.4545852, 2.191888, 0, 0.7647059, 1, 1,
0.1109561, -0.5033498, 2.238975, 0, 0.7607843, 1, 1,
0.1134373, 0.4270905, -0.839219, 0, 0.7529412, 1, 1,
0.1179991, 0.2461908, 0.8724092, 0, 0.7490196, 1, 1,
0.118658, -1.071959, 3.06405, 0, 0.7411765, 1, 1,
0.1202664, 1.540777, -0.07440817, 0, 0.7372549, 1, 1,
0.1258188, 0.7983202, -0.008429526, 0, 0.7294118, 1, 1,
0.1260695, 1.116015, 0.3182774, 0, 0.7254902, 1, 1,
0.1349734, -0.3195819, 3.979065, 0, 0.7176471, 1, 1,
0.1398671, 0.2370106, -1.351109, 0, 0.7137255, 1, 1,
0.1408962, -1.046784, 3.327064, 0, 0.7058824, 1, 1,
0.1413209, 0.2758322, 1.814002, 0, 0.6980392, 1, 1,
0.1504865, -1.392791, 3.289043, 0, 0.6941177, 1, 1,
0.150966, 1.432745, 1.265629, 0, 0.6862745, 1, 1,
0.1617828, -1.45189, 3.876027, 0, 0.682353, 1, 1,
0.1652391, -0.5133631, 3.085802, 0, 0.6745098, 1, 1,
0.1662682, -0.6011037, 1.130422, 0, 0.6705883, 1, 1,
0.1668764, -0.9498715, 3.038859, 0, 0.6627451, 1, 1,
0.1735497, -0.4224801, 3.550724, 0, 0.6588235, 1, 1,
0.1756499, -0.5221664, 0.6095234, 0, 0.6509804, 1, 1,
0.1756797, 1.200824, 0.8294762, 0, 0.6470588, 1, 1,
0.176241, 1.09907, 3.123709, 0, 0.6392157, 1, 1,
0.1805149, 1.011005, -0.2582509, 0, 0.6352941, 1, 1,
0.1825213, -0.6240275, 2.481474, 0, 0.627451, 1, 1,
0.1845616, 0.05128469, 3.450636, 0, 0.6235294, 1, 1,
0.1902984, -0.8027629, 3.102932, 0, 0.6156863, 1, 1,
0.1903891, 0.2380337, 1.073098, 0, 0.6117647, 1, 1,
0.1905848, 0.3782079, -0.3234967, 0, 0.6039216, 1, 1,
0.201155, 0.1427886, 1.803464, 0, 0.5960785, 1, 1,
0.2016023, -0.08092502, 1.68032, 0, 0.5921569, 1, 1,
0.2025273, -1.34001, 3.805976, 0, 0.5843138, 1, 1,
0.2143455, 0.3772366, 0.9596193, 0, 0.5803922, 1, 1,
0.2176301, 1.233336, -0.2757036, 0, 0.572549, 1, 1,
0.2183341, 0.1988483, 1.287398, 0, 0.5686275, 1, 1,
0.2186887, -2.025229, 3.381056, 0, 0.5607843, 1, 1,
0.2221821, 0.3393846, 0.1772949, 0, 0.5568628, 1, 1,
0.2335308, 0.1349597, 0.8367128, 0, 0.5490196, 1, 1,
0.2375024, 0.1158945, 1.043075, 0, 0.5450981, 1, 1,
0.2376729, 1.654942, 1.909792, 0, 0.5372549, 1, 1,
0.2378016, 0.4823319, 1.101384, 0, 0.5333334, 1, 1,
0.2408613, -0.924141, 3.129067, 0, 0.5254902, 1, 1,
0.245434, -0.5992637, 4.418625, 0, 0.5215687, 1, 1,
0.2537088, -0.8515266, 4.046944, 0, 0.5137255, 1, 1,
0.2539828, -0.7338064, 2.220572, 0, 0.509804, 1, 1,
0.2546286, -1.78148, 4.373953, 0, 0.5019608, 1, 1,
0.2561359, 0.6044008, -0.180557, 0, 0.4941176, 1, 1,
0.2585216, -0.2466914, 2.423335, 0, 0.4901961, 1, 1,
0.2587262, 0.5468778, 0.04278018, 0, 0.4823529, 1, 1,
0.260812, 0.5999953, 2.481688, 0, 0.4784314, 1, 1,
0.2632286, 0.2342566, 1.423543, 0, 0.4705882, 1, 1,
0.264485, 0.2682161, 0.1609658, 0, 0.4666667, 1, 1,
0.2668942, -1.573907, 3.116231, 0, 0.4588235, 1, 1,
0.2674745, -0.8524593, 2.283863, 0, 0.454902, 1, 1,
0.2685224, 0.5185708, 1.871157, 0, 0.4470588, 1, 1,
0.2689127, 1.437575, 0.2241829, 0, 0.4431373, 1, 1,
0.2702597, -0.1548384, 1.552341, 0, 0.4352941, 1, 1,
0.2708052, -0.4496683, 2.868669, 0, 0.4313726, 1, 1,
0.276114, -0.09138096, 0.9188201, 0, 0.4235294, 1, 1,
0.2783462, 0.5128177, -0.2232422, 0, 0.4196078, 1, 1,
0.2810315, -1.166295, 3.134568, 0, 0.4117647, 1, 1,
0.2810596, 0.07645794, -0.4658013, 0, 0.4078431, 1, 1,
0.2831746, -3.000741, 3.670484, 0, 0.4, 1, 1,
0.283282, -0.4975555, 1.056374, 0, 0.3921569, 1, 1,
0.2856146, -0.6964884, 3.24011, 0, 0.3882353, 1, 1,
0.2917895, 0.08827239, 1.672106, 0, 0.3803922, 1, 1,
0.2937608, -0.4314663, 2.427519, 0, 0.3764706, 1, 1,
0.2948915, -0.04397885, -1.015046, 0, 0.3686275, 1, 1,
0.2955455, -2.827899, 2.245765, 0, 0.3647059, 1, 1,
0.29714, 1.002089, 1.208602, 0, 0.3568628, 1, 1,
0.2978925, -0.08175875, 0.08924319, 0, 0.3529412, 1, 1,
0.3039108, 0.07603872, 1.898745, 0, 0.345098, 1, 1,
0.3045975, 0.980405, 1.213989, 0, 0.3411765, 1, 1,
0.305358, 1.261162, 0.04877968, 0, 0.3333333, 1, 1,
0.3055513, -0.358153, 3.866029, 0, 0.3294118, 1, 1,
0.3078056, 0.4566875, -0.5316402, 0, 0.3215686, 1, 1,
0.3159016, -1.351512, 2.907724, 0, 0.3176471, 1, 1,
0.318363, -1.524803, 3.706681, 0, 0.3098039, 1, 1,
0.3206834, -1.117302, 1.938033, 0, 0.3058824, 1, 1,
0.3365577, 1.018031, -0.008678594, 0, 0.2980392, 1, 1,
0.3369625, -0.9823366, 3.109351, 0, 0.2901961, 1, 1,
0.3377653, 0.1497613, 2.075394, 0, 0.2862745, 1, 1,
0.3407612, 1.77637, 1.529384, 0, 0.2784314, 1, 1,
0.3474087, -1.881661, 3.982074, 0, 0.2745098, 1, 1,
0.3500364, 0.5233505, 1.219199, 0, 0.2666667, 1, 1,
0.3519974, 0.2193312, 1.537448, 0, 0.2627451, 1, 1,
0.3564742, -0.09709472, 3.425879, 0, 0.254902, 1, 1,
0.3567969, 1.899501, 1.129163, 0, 0.2509804, 1, 1,
0.3585719, -1.249167, 2.631774, 0, 0.2431373, 1, 1,
0.3590085, 0.4638663, 0.5195059, 0, 0.2392157, 1, 1,
0.3633896, 0.4931047, 0.5868617, 0, 0.2313726, 1, 1,
0.3644173, -0.5626571, 4.345063, 0, 0.227451, 1, 1,
0.3656333, 0.1205238, 1.250941, 0, 0.2196078, 1, 1,
0.3677961, 0.2797975, 0.5211374, 0, 0.2156863, 1, 1,
0.3688713, 0.408555, 0.7163348, 0, 0.2078431, 1, 1,
0.3701341, 0.6772354, 0.01965142, 0, 0.2039216, 1, 1,
0.3718147, 0.9401709, 2.691329, 0, 0.1960784, 1, 1,
0.3741667, -0.7414308, 3.074506, 0, 0.1882353, 1, 1,
0.3748133, -0.9629891, 2.494139, 0, 0.1843137, 1, 1,
0.3822266, -1.122253, 2.788283, 0, 0.1764706, 1, 1,
0.3822762, -1.364016, 1.799556, 0, 0.172549, 1, 1,
0.3833901, -0.08580117, 0.4792538, 0, 0.1647059, 1, 1,
0.3862814, 0.3094631, 0.1182044, 0, 0.1607843, 1, 1,
0.3888617, -0.7321422, 3.386233, 0, 0.1529412, 1, 1,
0.3965675, 1.096297, -0.7404334, 0, 0.1490196, 1, 1,
0.4024283, -0.3056811, 2.022494, 0, 0.1411765, 1, 1,
0.4040845, -2.118132, 4.213157, 0, 0.1372549, 1, 1,
0.4040909, -0.996037, 1.978111, 0, 0.1294118, 1, 1,
0.404937, 0.6321324, 0.2101188, 0, 0.1254902, 1, 1,
0.4071563, 0.00011092, 2.582668, 0, 0.1176471, 1, 1,
0.4079902, -0.8932124, 2.528512, 0, 0.1137255, 1, 1,
0.4084387, -1.849545, 2.331483, 0, 0.1058824, 1, 1,
0.4139496, -0.390974, 1.727596, 0, 0.09803922, 1, 1,
0.4160141, -0.505514, 2.927756, 0, 0.09411765, 1, 1,
0.4179257, -2.277667, 3.014357, 0, 0.08627451, 1, 1,
0.4190748, 0.7334701, -0.3902707, 0, 0.08235294, 1, 1,
0.4236184, 1.091006, -0.020688, 0, 0.07450981, 1, 1,
0.4260676, 0.6782136, 3.026679, 0, 0.07058824, 1, 1,
0.4279881, 0.3338902, 0.3366088, 0, 0.0627451, 1, 1,
0.4280102, -0.926781, 2.498058, 0, 0.05882353, 1, 1,
0.4285684, -2.360926, 2.307344, 0, 0.05098039, 1, 1,
0.4310317, 0.2007632, -0.4406457, 0, 0.04705882, 1, 1,
0.4339745, 0.6894273, 2.364017, 0, 0.03921569, 1, 1,
0.4389505, 0.5673286, -0.006029701, 0, 0.03529412, 1, 1,
0.4404655, 0.2773951, 1.322149, 0, 0.02745098, 1, 1,
0.4481487, 0.7434343, 2.224481, 0, 0.02352941, 1, 1,
0.4505697, 0.7155537, -0.2341463, 0, 0.01568628, 1, 1,
0.4524876, 1.156203, 0.938947, 0, 0.01176471, 1, 1,
0.4529465, -0.3859595, 1.754707, 0, 0.003921569, 1, 1,
0.4606382, 0.5402626, 0.63969, 0.003921569, 0, 1, 1,
0.461383, -1.239543, 2.445329, 0.007843138, 0, 1, 1,
0.4623533, -0.03125403, -0.5203288, 0.01568628, 0, 1, 1,
0.4637341, -1.231681, 2.492631, 0.01960784, 0, 1, 1,
0.4659935, 0.002141123, 1.458193, 0.02745098, 0, 1, 1,
0.4663939, -0.9427693, 1.448894, 0.03137255, 0, 1, 1,
0.4702095, 0.467813, -0.4618037, 0.03921569, 0, 1, 1,
0.4717854, 1.072125, -0.06658904, 0.04313726, 0, 1, 1,
0.4741537, 1.003582, -1.032566, 0.05098039, 0, 1, 1,
0.4782383, -0.3473255, 3.050109, 0.05490196, 0, 1, 1,
0.4838881, 0.05245725, 1.455609, 0.0627451, 0, 1, 1,
0.4851229, -0.6674342, 1.925968, 0.06666667, 0, 1, 1,
0.487107, -0.4196816, 1.021866, 0.07450981, 0, 1, 1,
0.4880483, 1.990029, -0.09493127, 0.07843138, 0, 1, 1,
0.4904877, -0.7892027, 2.884951, 0.08627451, 0, 1, 1,
0.4911038, 0.1509419, -0.1173198, 0.09019608, 0, 1, 1,
0.4959042, 1.610198, 1.103332, 0.09803922, 0, 1, 1,
0.500934, -1.774994, 3.657276, 0.1058824, 0, 1, 1,
0.5013561, -1.338416, 3.14701, 0.1098039, 0, 1, 1,
0.5020224, 0.2486719, 1.680526, 0.1176471, 0, 1, 1,
0.5134704, -0.7919779, 2.415926, 0.1215686, 0, 1, 1,
0.5208157, -1.066001, 1.311685, 0.1294118, 0, 1, 1,
0.5293556, 0.6239631, 1.388918, 0.1333333, 0, 1, 1,
0.5416309, -0.8595408, 3.025878, 0.1411765, 0, 1, 1,
0.5436505, 1.575924, 0.1326379, 0.145098, 0, 1, 1,
0.545231, -0.3837095, 2.500863, 0.1529412, 0, 1, 1,
0.5469564, 0.4870238, -0.3940448, 0.1568628, 0, 1, 1,
0.5473238, 0.1262176, 1.597457, 0.1647059, 0, 1, 1,
0.5547763, -0.1746437, -0.02510244, 0.1686275, 0, 1, 1,
0.5560631, 1.370295, 0.01580343, 0.1764706, 0, 1, 1,
0.5589543, 1.228662, 0.7516613, 0.1803922, 0, 1, 1,
0.565579, -0.1118016, 2.603232, 0.1882353, 0, 1, 1,
0.5738307, 0.8363814, -1.189343, 0.1921569, 0, 1, 1,
0.5742952, 1.077927, 0.6316789, 0.2, 0, 1, 1,
0.5743548, -0.6657168, 2.303335, 0.2078431, 0, 1, 1,
0.576112, 1.030995, 0.3677397, 0.2117647, 0, 1, 1,
0.5768059, 0.5865842, -0.9310446, 0.2196078, 0, 1, 1,
0.5793942, 1.065565, 0.03887664, 0.2235294, 0, 1, 1,
0.5835047, 0.3344128, -0.9236461, 0.2313726, 0, 1, 1,
0.5884501, 0.01717585, 3.1529, 0.2352941, 0, 1, 1,
0.5921183, 1.121081, 0.4859892, 0.2431373, 0, 1, 1,
0.593451, -1.130058, 2.566922, 0.2470588, 0, 1, 1,
0.5941457, -0.2929951, 0.6731004, 0.254902, 0, 1, 1,
0.5957357, 0.3260334, 1.415864, 0.2588235, 0, 1, 1,
0.5963833, 0.7598505, 1.25413, 0.2666667, 0, 1, 1,
0.5987326, -0.4375289, 2.538855, 0.2705882, 0, 1, 1,
0.5989602, 0.4538078, -0.1207629, 0.2784314, 0, 1, 1,
0.6044752, 0.8334523, -0.1948803, 0.282353, 0, 1, 1,
0.6054902, 0.5978633, 0.3022458, 0.2901961, 0, 1, 1,
0.6060824, 0.7880388, -0.5638958, 0.2941177, 0, 1, 1,
0.6157933, -0.1747263, 3.022738, 0.3019608, 0, 1, 1,
0.6242897, -0.4888117, 2.402675, 0.3098039, 0, 1, 1,
0.6245834, -1.046934, 1.620712, 0.3137255, 0, 1, 1,
0.6325381, 1.065901, 0.01340191, 0.3215686, 0, 1, 1,
0.6363531, -0.7376972, 2.945409, 0.3254902, 0, 1, 1,
0.643512, 0.1151348, 1.349002, 0.3333333, 0, 1, 1,
0.6448019, -2.161422, 4.025764, 0.3372549, 0, 1, 1,
0.6455413, -0.4172476, 3.118457, 0.345098, 0, 1, 1,
0.650879, 1.238189, -0.3151035, 0.3490196, 0, 1, 1,
0.652859, -1.455979, 3.931904, 0.3568628, 0, 1, 1,
0.6616493, -1.755327, 3.437017, 0.3607843, 0, 1, 1,
0.6625311, -0.7131724, 1.896645, 0.3686275, 0, 1, 1,
0.6739847, 0.5610891, 1.804065, 0.372549, 0, 1, 1,
0.6760302, 0.2866264, -0.2035876, 0.3803922, 0, 1, 1,
0.6774706, 1.169285, 1.334118, 0.3843137, 0, 1, 1,
0.6787066, -0.03797306, 1.966532, 0.3921569, 0, 1, 1,
0.6801269, -0.7565439, 2.251739, 0.3960784, 0, 1, 1,
0.686937, -0.797894, 2.810433, 0.4039216, 0, 1, 1,
0.6880352, -0.6924719, 3.926264, 0.4117647, 0, 1, 1,
0.6936077, 0.9786577, -0.644628, 0.4156863, 0, 1, 1,
0.6976178, 0.2284104, 2.174445, 0.4235294, 0, 1, 1,
0.6994793, -0.1528864, 2.559084, 0.427451, 0, 1, 1,
0.701791, -0.200657, 1.73758, 0.4352941, 0, 1, 1,
0.7030407, -0.03549359, 1.957766, 0.4392157, 0, 1, 1,
0.7038383, 0.4200857, 1.841298, 0.4470588, 0, 1, 1,
0.7067084, -1.330608, 2.777567, 0.4509804, 0, 1, 1,
0.7071112, -0.9466015, 3.241091, 0.4588235, 0, 1, 1,
0.7084681, -0.3405285, 2.235088, 0.4627451, 0, 1, 1,
0.7085946, 1.334159, 1.842222, 0.4705882, 0, 1, 1,
0.7109325, -2.063255, 3.671892, 0.4745098, 0, 1, 1,
0.7135129, -0.8372522, 1.856649, 0.4823529, 0, 1, 1,
0.7154812, 1.139649, 1.43413, 0.4862745, 0, 1, 1,
0.7274847, 0.1894133, 1.278883, 0.4941176, 0, 1, 1,
0.728336, -0.5814706, 2.2264, 0.5019608, 0, 1, 1,
0.7318214, 3.262665, -0.2592415, 0.5058824, 0, 1, 1,
0.738232, -0.1259784, 3.493716, 0.5137255, 0, 1, 1,
0.7470516, 0.3620391, 0.006194395, 0.5176471, 0, 1, 1,
0.7483768, 1.24643, -0.08598134, 0.5254902, 0, 1, 1,
0.7560506, 1.289021, 0.7894576, 0.5294118, 0, 1, 1,
0.7575328, -1.682698, 2.695306, 0.5372549, 0, 1, 1,
0.75759, -0.345882, 0.7231379, 0.5411765, 0, 1, 1,
0.7577565, -0.4687379, 0.6902318, 0.5490196, 0, 1, 1,
0.7583061, 1.314462, 0.445944, 0.5529412, 0, 1, 1,
0.7597103, 0.9126009, -0.7790733, 0.5607843, 0, 1, 1,
0.7642987, -1.974958, 3.656805, 0.5647059, 0, 1, 1,
0.7714021, -0.3805275, 2.405965, 0.572549, 0, 1, 1,
0.7859383, -0.3022518, 1.600671, 0.5764706, 0, 1, 1,
0.7922401, -0.175097, 0.4513366, 0.5843138, 0, 1, 1,
0.7929735, 1.114203, 0.9892132, 0.5882353, 0, 1, 1,
0.7936992, -0.8955637, 2.860261, 0.5960785, 0, 1, 1,
0.794514, 0.7539789, 1.049817, 0.6039216, 0, 1, 1,
0.7960851, -2.532714, 3.221787, 0.6078432, 0, 1, 1,
0.8050258, 1.197466, 0.2268438, 0.6156863, 0, 1, 1,
0.8064346, 0.5370421, 0.9093782, 0.6196079, 0, 1, 1,
0.8069476, 0.9755906, -0.4078267, 0.627451, 0, 1, 1,
0.8079109, 0.3368272, -1.016516, 0.6313726, 0, 1, 1,
0.8079565, -0.03914666, 0.9374607, 0.6392157, 0, 1, 1,
0.8135509, 1.380572, 3.130216, 0.6431373, 0, 1, 1,
0.8144136, 1.478972, 0.5641633, 0.6509804, 0, 1, 1,
0.8151846, -0.226373, 1.704554, 0.654902, 0, 1, 1,
0.8187051, -0.6678279, 4.225353, 0.6627451, 0, 1, 1,
0.8258243, 0.03882935, 1.657162, 0.6666667, 0, 1, 1,
0.8264998, 0.7377101, 1.088871, 0.6745098, 0, 1, 1,
0.8283044, 0.8989205, 1.85449, 0.6784314, 0, 1, 1,
0.8283784, -1.737592, 4.034277, 0.6862745, 0, 1, 1,
0.8310125, -0.07593837, 2.152585, 0.6901961, 0, 1, 1,
0.8310861, -2.104006, 1.43153, 0.6980392, 0, 1, 1,
0.8331377, -0.1777901, 0.06697445, 0.7058824, 0, 1, 1,
0.8349739, -0.2506287, 1.248077, 0.7098039, 0, 1, 1,
0.836649, 0.9902712, -0.1781996, 0.7176471, 0, 1, 1,
0.8370732, -0.4799275, 1.264155, 0.7215686, 0, 1, 1,
0.8409359, 0.5344722, 2.904743, 0.7294118, 0, 1, 1,
0.8413607, 1.456274, -2.272209, 0.7333333, 0, 1, 1,
0.8417892, -1.347123, 2.777466, 0.7411765, 0, 1, 1,
0.8425546, 1.190495, 0.4323827, 0.7450981, 0, 1, 1,
0.8428833, -0.7324117, 1.217628, 0.7529412, 0, 1, 1,
0.8511844, 2.096389, 0.6693759, 0.7568628, 0, 1, 1,
0.855498, -1.769601, 3.873153, 0.7647059, 0, 1, 1,
0.8612743, 0.1741017, 1.840973, 0.7686275, 0, 1, 1,
0.8637538, 0.5039449, 2.660003, 0.7764706, 0, 1, 1,
0.86591, 2.27432, -0.4752488, 0.7803922, 0, 1, 1,
0.8671637, -0.6844935, 0.2610076, 0.7882353, 0, 1, 1,
0.8739032, -0.06532506, 2.428619, 0.7921569, 0, 1, 1,
0.8753564, 0.4093424, 1.173426, 0.8, 0, 1, 1,
0.8771918, 0.7059104, 1.534814, 0.8078431, 0, 1, 1,
0.8774323, 0.7619964, -0.127291, 0.8117647, 0, 1, 1,
0.8776749, 0.3021097, 2.185228, 0.8196079, 0, 1, 1,
0.8823268, -0.8426123, 4.034021, 0.8235294, 0, 1, 1,
0.8873844, -0.9862474, 1.619587, 0.8313726, 0, 1, 1,
0.8878829, 0.7631274, 1.43365, 0.8352941, 0, 1, 1,
0.890855, -0.4499027, 3.222207, 0.8431373, 0, 1, 1,
0.8928891, 2.166319, 0.5671051, 0.8470588, 0, 1, 1,
0.8939037, 0.1004272, 2.172726, 0.854902, 0, 1, 1,
0.8968212, 1.185703, -1.154427, 0.8588235, 0, 1, 1,
0.9007048, -1.006247, 2.719538, 0.8666667, 0, 1, 1,
0.9031988, 0.2967956, 2.322041, 0.8705882, 0, 1, 1,
0.9053957, 0.1945942, 0.9771958, 0.8784314, 0, 1, 1,
0.9136284, -1.092882, 2.087879, 0.8823529, 0, 1, 1,
0.9139391, -1.299783, 2.126117, 0.8901961, 0, 1, 1,
0.9216842, 1.06553, 0.3019494, 0.8941177, 0, 1, 1,
0.9301579, -0.1529621, 3.522985, 0.9019608, 0, 1, 1,
0.9312982, -0.8063422, 4.620374, 0.9098039, 0, 1, 1,
0.9390156, -1.379686, 2.166198, 0.9137255, 0, 1, 1,
0.9393273, -0.5176507, 2.6429, 0.9215686, 0, 1, 1,
0.9411634, 1.74974, -0.1022076, 0.9254902, 0, 1, 1,
0.9468901, -0.4570598, 0.2220833, 0.9333333, 0, 1, 1,
0.9471752, 0.09453359, -0.09732314, 0.9372549, 0, 1, 1,
0.9609284, 0.07284449, 0.2317484, 0.945098, 0, 1, 1,
0.961877, -0.0864821, 2.120139, 0.9490196, 0, 1, 1,
0.9730345, 0.9268057, 1.931017, 0.9568627, 0, 1, 1,
0.9739624, 1.344092, 1.502697, 0.9607843, 0, 1, 1,
0.9746234, 0.2521818, 3.690144, 0.9686275, 0, 1, 1,
0.9798241, -0.123367, 1.63296, 0.972549, 0, 1, 1,
0.9839939, 1.948847, 1.510167, 0.9803922, 0, 1, 1,
0.9857324, -1.50118, 1.574975, 0.9843137, 0, 1, 1,
0.9870811, 2.324116, 0.8191559, 0.9921569, 0, 1, 1,
0.9925788, -0.7215047, 0.933194, 0.9960784, 0, 1, 1,
1.005428, 0.2491998, 2.459004, 1, 0, 0.9960784, 1,
1.009628, 1.220972, 1.183188, 1, 0, 0.9882353, 1,
1.011849, 0.3416894, 1.453393, 1, 0, 0.9843137, 1,
1.012771, 1.571164, 0.8584669, 1, 0, 0.9764706, 1,
1.01499, 0.0790951, 1.487885, 1, 0, 0.972549, 1,
1.015904, 1.299244, 1.672496, 1, 0, 0.9647059, 1,
1.022286, -0.8069134, 2.139293, 1, 0, 0.9607843, 1,
1.035366, -0.7596347, 2.557819, 1, 0, 0.9529412, 1,
1.037187, -0.1548608, 1.433927, 1, 0, 0.9490196, 1,
1.03946, 0.8739292, 1.555397, 1, 0, 0.9411765, 1,
1.041491, -0.3948506, 1.769382, 1, 0, 0.9372549, 1,
1.041811, -1.01463, 1.166051, 1, 0, 0.9294118, 1,
1.042381, -0.08009693, 2.16599, 1, 0, 0.9254902, 1,
1.044546, 1.178988, 1.009067, 1, 0, 0.9176471, 1,
1.045484, -1.245316, 4.559599, 1, 0, 0.9137255, 1,
1.048851, 0.03525369, 2.56222, 1, 0, 0.9058824, 1,
1.050776, -1.181571, 3.264266, 1, 0, 0.9019608, 1,
1.051586, 0.07365729, 2.073036, 1, 0, 0.8941177, 1,
1.05414, -1.7731, 3.721764, 1, 0, 0.8862745, 1,
1.054657, 2.133314, 1.894862, 1, 0, 0.8823529, 1,
1.055222, 0.6632912, 2.420481, 1, 0, 0.8745098, 1,
1.057539, 0.9096839, 0.5813173, 1, 0, 0.8705882, 1,
1.063268, -0.988248, 1.492543, 1, 0, 0.8627451, 1,
1.077403, -0.3772621, 2.765429, 1, 0, 0.8588235, 1,
1.091223, -0.9200771, 3.122557, 1, 0, 0.8509804, 1,
1.091857, -0.970864, 2.68412, 1, 0, 0.8470588, 1,
1.096824, -0.09685572, 3.023337, 1, 0, 0.8392157, 1,
1.100677, -0.3154525, 1.57172, 1, 0, 0.8352941, 1,
1.105817, 1.569968, 2.104724, 1, 0, 0.827451, 1,
1.110489, 1.190746, 0.4688429, 1, 0, 0.8235294, 1,
1.110728, -0.04870792, 1.457811, 1, 0, 0.8156863, 1,
1.124861, 0.2246411, 0.554492, 1, 0, 0.8117647, 1,
1.127315, -0.5297691, 3.222994, 1, 0, 0.8039216, 1,
1.1275, -1.682935, 4.627208, 1, 0, 0.7960784, 1,
1.12839, -0.8949947, 3.480943, 1, 0, 0.7921569, 1,
1.144166, 0.527326, 1.447147, 1, 0, 0.7843137, 1,
1.144944, -0.7700852, 1.179388, 1, 0, 0.7803922, 1,
1.149319, -0.05017381, -0.9293185, 1, 0, 0.772549, 1,
1.163866, -0.62186, 2.044912, 1, 0, 0.7686275, 1,
1.171971, -0.8894272, 2.896784, 1, 0, 0.7607843, 1,
1.183151, 0.415777, 1.477495, 1, 0, 0.7568628, 1,
1.195287, 0.9329764, 1.300235, 1, 0, 0.7490196, 1,
1.196769, 1.360361, -1.169765, 1, 0, 0.7450981, 1,
1.201221, -0.9309495, 4.894732, 1, 0, 0.7372549, 1,
1.206677, -0.3289171, 2.487057, 1, 0, 0.7333333, 1,
1.208216, -1.11085, 1.132902, 1, 0, 0.7254902, 1,
1.211776, -0.7118725, 1.057557, 1, 0, 0.7215686, 1,
1.220539, 1.413472, 1.351743, 1, 0, 0.7137255, 1,
1.223268, -0.1977358, 0.3977566, 1, 0, 0.7098039, 1,
1.238068, -1.339122, 3.206659, 1, 0, 0.7019608, 1,
1.240296, -0.6948985, 2.157371, 1, 0, 0.6941177, 1,
1.240919, 3.043963, -0.6876001, 1, 0, 0.6901961, 1,
1.241012, 0.3584268, 1.330235, 1, 0, 0.682353, 1,
1.246969, 0.2021159, 2.209772, 1, 0, 0.6784314, 1,
1.24745, 1.368533, 0.9420316, 1, 0, 0.6705883, 1,
1.249356, -0.8087977, 2.43537, 1, 0, 0.6666667, 1,
1.249488, -0.1117504, 1.89991, 1, 0, 0.6588235, 1,
1.250184, 0.708205, 1.215094, 1, 0, 0.654902, 1,
1.250386, -0.08589253, 2.084096, 1, 0, 0.6470588, 1,
1.252056, -0.03385984, 2.89265, 1, 0, 0.6431373, 1,
1.254966, -0.01629475, 0.9723678, 1, 0, 0.6352941, 1,
1.25793, -1.24993, 1.278702, 1, 0, 0.6313726, 1,
1.258254, -0.9496527, 2.319319, 1, 0, 0.6235294, 1,
1.261002, -0.8278769, 1.525599, 1, 0, 0.6196079, 1,
1.261645, -0.3627079, 2.672062, 1, 0, 0.6117647, 1,
1.262477, -0.3221202, 3.191358, 1, 0, 0.6078432, 1,
1.264302, -1.184142, 1.507872, 1, 0, 0.6, 1,
1.266784, -0.6735287, 2.171575, 1, 0, 0.5921569, 1,
1.271839, -1.432524, 1.73908, 1, 0, 0.5882353, 1,
1.279293, -0.6065587, 1.600226, 1, 0, 0.5803922, 1,
1.296296, 0.2342881, 0.5253589, 1, 0, 0.5764706, 1,
1.311661, 0.5591097, 0.312438, 1, 0, 0.5686275, 1,
1.3159, 0.1799337, -0.3002804, 1, 0, 0.5647059, 1,
1.31828, 0.3198024, 4.217782, 1, 0, 0.5568628, 1,
1.320402, -0.7814527, 0.7369922, 1, 0, 0.5529412, 1,
1.328902, -1.881084, 0.6361315, 1, 0, 0.5450981, 1,
1.329303, 0.9294971, 1.132223, 1, 0, 0.5411765, 1,
1.34125, -0.9369245, 2.273096, 1, 0, 0.5333334, 1,
1.346808, 0.2400673, 2.219668, 1, 0, 0.5294118, 1,
1.351273, -0.8995658, 2.843185, 1, 0, 0.5215687, 1,
1.353336, 1.034368, 1.739374, 1, 0, 0.5176471, 1,
1.366691, 0.3172423, 2.078049, 1, 0, 0.509804, 1,
1.386641, -1.616671, 0.9499313, 1, 0, 0.5058824, 1,
1.392741, -0.445416, 0.9464133, 1, 0, 0.4980392, 1,
1.431018, 0.7842052, 0.3738157, 1, 0, 0.4901961, 1,
1.441137, 0.4265041, 1.01539, 1, 0, 0.4862745, 1,
1.454592, 0.2914612, 0.907111, 1, 0, 0.4784314, 1,
1.459164, -0.9750898, 2.322052, 1, 0, 0.4745098, 1,
1.463642, -0.4914355, 1.902463, 1, 0, 0.4666667, 1,
1.464913, -0.4976916, 2.680176, 1, 0, 0.4627451, 1,
1.471897, 0.3788057, 0.9300615, 1, 0, 0.454902, 1,
1.480563, 1.398963, 0.1465237, 1, 0, 0.4509804, 1,
1.480868, -0.07295775, 2.018462, 1, 0, 0.4431373, 1,
1.486355, 1.122825, 1.898859, 1, 0, 0.4392157, 1,
1.491575, 1.928444, 0.3972068, 1, 0, 0.4313726, 1,
1.50291, 0.9172413, -0.592158, 1, 0, 0.427451, 1,
1.508869, -1.262905, 2.362905, 1, 0, 0.4196078, 1,
1.510141, 0.2435456, 2.16672, 1, 0, 0.4156863, 1,
1.518772, 0.8175256, 2.240682, 1, 0, 0.4078431, 1,
1.519708, -0.011074, 0.100909, 1, 0, 0.4039216, 1,
1.530867, 0.5499386, 1.354806, 1, 0, 0.3960784, 1,
1.533499, 0.845206, 0.6798977, 1, 0, 0.3882353, 1,
1.536647, 0.3283798, 1.192764, 1, 0, 0.3843137, 1,
1.549103, 0.8176518, -0.5307576, 1, 0, 0.3764706, 1,
1.554573, -0.1775709, 2.910774, 1, 0, 0.372549, 1,
1.565832, 0.6207904, 1.483644, 1, 0, 0.3647059, 1,
1.569134, -0.2612014, 1.029081, 1, 0, 0.3607843, 1,
1.571826, 0.9384652, 0.7152082, 1, 0, 0.3529412, 1,
1.585702, 0.5222561, 1.927415, 1, 0, 0.3490196, 1,
1.604665, 0.5334837, 2.038033, 1, 0, 0.3411765, 1,
1.617594, 0.1629526, 1.079851, 1, 0, 0.3372549, 1,
1.626999, -1.865149, 2.515254, 1, 0, 0.3294118, 1,
1.634262, -2.101424, 4.857086, 1, 0, 0.3254902, 1,
1.643535, -0.6196814, 1.905986, 1, 0, 0.3176471, 1,
1.644406, 0.8442061, 0.2401965, 1, 0, 0.3137255, 1,
1.675333, 1.539469, 1.241269, 1, 0, 0.3058824, 1,
1.676153, -0.7964109, 2.335284, 1, 0, 0.2980392, 1,
1.682667, -1.152581, 2.529343, 1, 0, 0.2941177, 1,
1.687437, 0.1075918, 2.780877, 1, 0, 0.2862745, 1,
1.694506, -0.2275845, 3.689692, 1, 0, 0.282353, 1,
1.695916, -0.04514277, 2.489362, 1, 0, 0.2745098, 1,
1.705796, 0.3114771, 1.533782, 1, 0, 0.2705882, 1,
1.717769, 1.110423, 0.4133736, 1, 0, 0.2627451, 1,
1.729095, -0.7098496, 1.385415, 1, 0, 0.2588235, 1,
1.729389, -0.1974063, 2.554104, 1, 0, 0.2509804, 1,
1.750819, -0.6692209, 1.526488, 1, 0, 0.2470588, 1,
1.754634, -0.6424875, 1.116446, 1, 0, 0.2392157, 1,
1.76527, -0.344149, 0.1740207, 1, 0, 0.2352941, 1,
1.769061, 0.8549238, 2.933413, 1, 0, 0.227451, 1,
1.778036, -0.7818475, 2.790282, 1, 0, 0.2235294, 1,
1.793152, -0.7150629, 1.093013, 1, 0, 0.2156863, 1,
1.794209, -0.6159849, 2.793541, 1, 0, 0.2117647, 1,
1.812567, 0.2064837, 1.514983, 1, 0, 0.2039216, 1,
1.852588, -1.500008, 3.361421, 1, 0, 0.1960784, 1,
1.859018, 1.088893, 0.4267054, 1, 0, 0.1921569, 1,
1.871456, 0.4009598, 2.186283, 1, 0, 0.1843137, 1,
1.877375, -0.1324976, 1.628016, 1, 0, 0.1803922, 1,
1.882467, 1.652235, 1.355038, 1, 0, 0.172549, 1,
1.885856, 1.38645, 1.666721, 1, 0, 0.1686275, 1,
1.900092, -1.427818, 3.045763, 1, 0, 0.1607843, 1,
1.90946, -0.6551492, 1.663546, 1, 0, 0.1568628, 1,
1.936287, 0.5189574, 1.315959, 1, 0, 0.1490196, 1,
1.942296, 0.961723, 1.006043, 1, 0, 0.145098, 1,
1.952663, 2.296817, 1.727829, 1, 0, 0.1372549, 1,
1.964025, -0.6223545, 3.275261, 1, 0, 0.1333333, 1,
1.974917, -2.407547, 1.256216, 1, 0, 0.1254902, 1,
1.975374, 0.9210462, 1.209424, 1, 0, 0.1215686, 1,
1.982829, 0.6487528, 0.8870448, 1, 0, 0.1137255, 1,
1.990064, 0.1075984, 2.708696, 1, 0, 0.1098039, 1,
2.046262, 2.637088, 1.685893, 1, 0, 0.1019608, 1,
2.048621, -0.2087769, 1.363282, 1, 0, 0.09411765, 1,
2.055697, 0.7967578, 1.890707, 1, 0, 0.09019608, 1,
2.056369, 1.127598, 0.3705837, 1, 0, 0.08235294, 1,
2.0654, -0.4791236, 1.431222, 1, 0, 0.07843138, 1,
2.076468, -0.4310134, 1.993711, 1, 0, 0.07058824, 1,
2.10441, -1.991341, 3.007813, 1, 0, 0.06666667, 1,
2.145393, -0.9295442, 2.433205, 1, 0, 0.05882353, 1,
2.162919, 0.3503112, 1.479355, 1, 0, 0.05490196, 1,
2.227501, 0.8621159, 2.413326, 1, 0, 0.04705882, 1,
2.301713, 0.8294705, 1.694105, 1, 0, 0.04313726, 1,
2.326095, 0.6072803, 1.213458, 1, 0, 0.03529412, 1,
2.495524, 0.6883005, 0.7680082, 1, 0, 0.03137255, 1,
2.614469, 0.1429492, 2.94667, 1, 0, 0.02352941, 1,
2.617781, -1.503008, 3.434893, 1, 0, 0.01960784, 1,
2.79274, -1.052602, 0.06863111, 1, 0, 0.01176471, 1,
2.866477, -0.2447337, 1.988665, 1, 0, 0.007843138, 1
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
-0.08667517, -4.062388, -7.53524, 0, -0.5, 0.5, 0.5,
-0.08667517, -4.062388, -7.53524, 1, -0.5, 0.5, 0.5,
-0.08667517, -4.062388, -7.53524, 1, 1.5, 0.5, 0.5,
-0.08667517, -4.062388, -7.53524, 0, 1.5, 0.5, 0.5
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
-4.040946, 0.130962, -7.53524, 0, -0.5, 0.5, 0.5,
-4.040946, 0.130962, -7.53524, 1, -0.5, 0.5, 0.5,
-4.040946, 0.130962, -7.53524, 1, 1.5, 0.5, 0.5,
-4.040946, 0.130962, -7.53524, 0, 1.5, 0.5, 0.5
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
-4.040946, -4.062388, -0.4194927, 0, -0.5, 0.5, 0.5,
-4.040946, -4.062388, -0.4194927, 1, -0.5, 0.5, 0.5,
-4.040946, -4.062388, -0.4194927, 1, 1.5, 0.5, 0.5,
-4.040946, -4.062388, -0.4194927, 0, 1.5, 0.5, 0.5
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
-3, -3.094692, -5.893144,
2, -3.094692, -5.893144,
-3, -3.094692, -5.893144,
-3, -3.255975, -6.166827,
-2, -3.094692, -5.893144,
-2, -3.255975, -6.166827,
-1, -3.094692, -5.893144,
-1, -3.255975, -6.166827,
0, -3.094692, -5.893144,
0, -3.255975, -6.166827,
1, -3.094692, -5.893144,
1, -3.255975, -6.166827,
2, -3.094692, -5.893144,
2, -3.255975, -6.166827
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
-3, -3.57854, -6.714192, 0, -0.5, 0.5, 0.5,
-3, -3.57854, -6.714192, 1, -0.5, 0.5, 0.5,
-3, -3.57854, -6.714192, 1, 1.5, 0.5, 0.5,
-3, -3.57854, -6.714192, 0, 1.5, 0.5, 0.5,
-2, -3.57854, -6.714192, 0, -0.5, 0.5, 0.5,
-2, -3.57854, -6.714192, 1, -0.5, 0.5, 0.5,
-2, -3.57854, -6.714192, 1, 1.5, 0.5, 0.5,
-2, -3.57854, -6.714192, 0, 1.5, 0.5, 0.5,
-1, -3.57854, -6.714192, 0, -0.5, 0.5, 0.5,
-1, -3.57854, -6.714192, 1, -0.5, 0.5, 0.5,
-1, -3.57854, -6.714192, 1, 1.5, 0.5, 0.5,
-1, -3.57854, -6.714192, 0, 1.5, 0.5, 0.5,
0, -3.57854, -6.714192, 0, -0.5, 0.5, 0.5,
0, -3.57854, -6.714192, 1, -0.5, 0.5, 0.5,
0, -3.57854, -6.714192, 1, 1.5, 0.5, 0.5,
0, -3.57854, -6.714192, 0, 1.5, 0.5, 0.5,
1, -3.57854, -6.714192, 0, -0.5, 0.5, 0.5,
1, -3.57854, -6.714192, 1, -0.5, 0.5, 0.5,
1, -3.57854, -6.714192, 1, 1.5, 0.5, 0.5,
1, -3.57854, -6.714192, 0, 1.5, 0.5, 0.5,
2, -3.57854, -6.714192, 0, -0.5, 0.5, 0.5,
2, -3.57854, -6.714192, 1, -0.5, 0.5, 0.5,
2, -3.57854, -6.714192, 1, 1.5, 0.5, 0.5,
2, -3.57854, -6.714192, 0, 1.5, 0.5, 0.5
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
-3.128422, -3, -5.893144,
-3.128422, 3, -5.893144,
-3.128422, -3, -5.893144,
-3.280509, -3, -6.166827,
-3.128422, -2, -5.893144,
-3.280509, -2, -6.166827,
-3.128422, -1, -5.893144,
-3.280509, -1, -6.166827,
-3.128422, 0, -5.893144,
-3.280509, 0, -6.166827,
-3.128422, 1, -5.893144,
-3.280509, 1, -6.166827,
-3.128422, 2, -5.893144,
-3.280509, 2, -6.166827,
-3.128422, 3, -5.893144,
-3.280509, 3, -6.166827
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
-3.584684, -3, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, -3, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, -3, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, -3, -6.714192, 0, 1.5, 0.5, 0.5,
-3.584684, -2, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, -2, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, -2, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, -2, -6.714192, 0, 1.5, 0.5, 0.5,
-3.584684, -1, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, -1, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, -1, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, -1, -6.714192, 0, 1.5, 0.5, 0.5,
-3.584684, 0, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, 0, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, 0, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, 0, -6.714192, 0, 1.5, 0.5, 0.5,
-3.584684, 1, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, 1, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, 1, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, 1, -6.714192, 0, 1.5, 0.5, 0.5,
-3.584684, 2, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, 2, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, 2, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, 2, -6.714192, 0, 1.5, 0.5, 0.5,
-3.584684, 3, -6.714192, 0, -0.5, 0.5, 0.5,
-3.584684, 3, -6.714192, 1, -0.5, 0.5, 0.5,
-3.584684, 3, -6.714192, 1, 1.5, 0.5, 0.5,
-3.584684, 3, -6.714192, 0, 1.5, 0.5, 0.5
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
-3.128422, -3.094692, -4,
-3.128422, -3.094692, 4,
-3.128422, -3.094692, -4,
-3.280509, -3.255975, -4,
-3.128422, -3.094692, -2,
-3.280509, -3.255975, -2,
-3.128422, -3.094692, 0,
-3.280509, -3.255975, 0,
-3.128422, -3.094692, 2,
-3.280509, -3.255975, 2,
-3.128422, -3.094692, 4,
-3.280509, -3.255975, 4
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
-3.584684, -3.57854, -4, 0, -0.5, 0.5, 0.5,
-3.584684, -3.57854, -4, 1, -0.5, 0.5, 0.5,
-3.584684, -3.57854, -4, 1, 1.5, 0.5, 0.5,
-3.584684, -3.57854, -4, 0, 1.5, 0.5, 0.5,
-3.584684, -3.57854, -2, 0, -0.5, 0.5, 0.5,
-3.584684, -3.57854, -2, 1, -0.5, 0.5, 0.5,
-3.584684, -3.57854, -2, 1, 1.5, 0.5, 0.5,
-3.584684, -3.57854, -2, 0, 1.5, 0.5, 0.5,
-3.584684, -3.57854, 0, 0, -0.5, 0.5, 0.5,
-3.584684, -3.57854, 0, 1, -0.5, 0.5, 0.5,
-3.584684, -3.57854, 0, 1, 1.5, 0.5, 0.5,
-3.584684, -3.57854, 0, 0, 1.5, 0.5, 0.5,
-3.584684, -3.57854, 2, 0, -0.5, 0.5, 0.5,
-3.584684, -3.57854, 2, 1, -0.5, 0.5, 0.5,
-3.584684, -3.57854, 2, 1, 1.5, 0.5, 0.5,
-3.584684, -3.57854, 2, 0, 1.5, 0.5, 0.5,
-3.584684, -3.57854, 4, 0, -0.5, 0.5, 0.5,
-3.584684, -3.57854, 4, 1, -0.5, 0.5, 0.5,
-3.584684, -3.57854, 4, 1, 1.5, 0.5, 0.5,
-3.584684, -3.57854, 4, 0, 1.5, 0.5, 0.5
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
-3.128422, -3.094692, -5.893144,
-3.128422, 3.356616, -5.893144,
-3.128422, -3.094692, 5.054159,
-3.128422, 3.356616, 5.054159,
-3.128422, -3.094692, -5.893144,
-3.128422, -3.094692, 5.054159,
-3.128422, 3.356616, -5.893144,
-3.128422, 3.356616, 5.054159,
-3.128422, -3.094692, -5.893144,
2.955072, -3.094692, -5.893144,
-3.128422, -3.094692, 5.054159,
2.955072, -3.094692, 5.054159,
-3.128422, 3.356616, -5.893144,
2.955072, 3.356616, -5.893144,
-3.128422, 3.356616, 5.054159,
2.955072, 3.356616, 5.054159,
2.955072, -3.094692, -5.893144,
2.955072, 3.356616, -5.893144,
2.955072, -3.094692, 5.054159,
2.955072, 3.356616, 5.054159,
2.955072, -3.094692, -5.893144,
2.955072, -3.094692, 5.054159,
2.955072, 3.356616, -5.893144,
2.955072, 3.356616, 5.054159
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
var radius = 7.522718;
var distance = 33.46942;
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
mvMatrix.translate( 0.08667517, -0.130962, 0.4194927 );
mvMatrix.scale( 1.337013, 1.260785, 0.7429876 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.46942);
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
flusulfamide<-read.table("flusulfamide.xyz")
```

```
## Error in read.table("flusulfamide.xyz"): no lines available in input
```

```r
x<-flusulfamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'flusulfamide' not found
```

```r
y<-flusulfamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'flusulfamide' not found
```

```r
z<-flusulfamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'flusulfamide' not found
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
-3.039827, 0.4515249, -0.2602388, 0, 0, 1, 1, 1,
-2.901478, 1.701883, -0.4137113, 1, 0, 0, 1, 1,
-2.70511, 1.988771, -0.6257479, 1, 0, 0, 1, 1,
-2.647261, -0.780041, -3.56295, 1, 0, 0, 1, 1,
-2.487003, 0.000406395, -0.3237906, 1, 0, 0, 1, 1,
-2.427339, 0.04112067, -2.152063, 1, 0, 0, 1, 1,
-2.409221, 0.2712595, -2.066402, 0, 0, 0, 1, 1,
-2.319588, 0.2897226, -2.049949, 0, 0, 0, 1, 1,
-2.293425, -0.3672051, -0.1588993, 0, 0, 0, 1, 1,
-2.238861, -0.3453336, -0.1835293, 0, 0, 0, 1, 1,
-2.163013, -1.620331, -3.518432, 0, 0, 0, 1, 1,
-2.1506, -0.3609208, -1.169937, 0, 0, 0, 1, 1,
-2.144894, -0.6700991, -2.039546, 0, 0, 0, 1, 1,
-2.087053, 1.150701, -1.54672, 1, 1, 1, 1, 1,
-2.062052, -1.382581, -1.934949, 1, 1, 1, 1, 1,
-2.024622, 2.078819, -2.17848, 1, 1, 1, 1, 1,
-1.997634, -0.1229626, -1.4919, 1, 1, 1, 1, 1,
-1.992767, 0.3574933, 0.1967707, 1, 1, 1, 1, 1,
-1.982718, -0.08125655, -1.937856, 1, 1, 1, 1, 1,
-1.943937, -0.5631413, -3.087909, 1, 1, 1, 1, 1,
-1.941201, -0.4398256, 0.1202248, 1, 1, 1, 1, 1,
-1.904709, 0.9125879, 0.7610056, 1, 1, 1, 1, 1,
-1.900075, -0.02615544, -0.9308113, 1, 1, 1, 1, 1,
-1.879023, 1.388711, -1.744435, 1, 1, 1, 1, 1,
-1.845628, 0.5032685, -1.120769, 1, 1, 1, 1, 1,
-1.82983, -0.7651982, -2.44289, 1, 1, 1, 1, 1,
-1.808953, -0.2079602, -2.396955, 1, 1, 1, 1, 1,
-1.79808, 0.6053302, -0.4844764, 1, 1, 1, 1, 1,
-1.717638, -0.124306, -1.903848, 0, 0, 1, 1, 1,
-1.707573, 0.9709516, -0.7713149, 1, 0, 0, 1, 1,
-1.705742, 0.7762158, -1.968849, 1, 0, 0, 1, 1,
-1.687644, 2.216183, -0.8075603, 1, 0, 0, 1, 1,
-1.684121, -0.7559132, -1.347224, 1, 0, 0, 1, 1,
-1.683148, 0.7617143, -2.184698, 1, 0, 0, 1, 1,
-1.677647, 0.260989, -1.607162, 0, 0, 0, 1, 1,
-1.676345, -1.788889, -3.127166, 0, 0, 0, 1, 1,
-1.6665, 0.5330994, -3.945837, 0, 0, 0, 1, 1,
-1.664209, -0.8186318, -1.729555, 0, 0, 0, 1, 1,
-1.662859, -0.9753452, -3.395089, 0, 0, 0, 1, 1,
-1.654718, -1.151906, -3.838108, 0, 0, 0, 1, 1,
-1.642448, 1.895781, -0.7564572, 0, 0, 0, 1, 1,
-1.629772, -0.188739, 0.1394864, 1, 1, 1, 1, 1,
-1.60966, 1.076522, -1.661997, 1, 1, 1, 1, 1,
-1.599875, -0.3085429, -2.355828, 1, 1, 1, 1, 1,
-1.599268, 0.4458062, -0.5884687, 1, 1, 1, 1, 1,
-1.590682, -1.132623, -2.046278, 1, 1, 1, 1, 1,
-1.590472, -0.6347252, -1.878932, 1, 1, 1, 1, 1,
-1.575624, 0.2426396, -2.054672, 1, 1, 1, 1, 1,
-1.562608, 1.167537, -0.03499605, 1, 1, 1, 1, 1,
-1.559571, 1.387272, -0.7033115, 1, 1, 1, 1, 1,
-1.554948, -0.2421004, -1.243746, 1, 1, 1, 1, 1,
-1.55225, 0.5710581, 0.2747223, 1, 1, 1, 1, 1,
-1.548351, 0.3944025, -1.442761, 1, 1, 1, 1, 1,
-1.545764, 0.9800287, 1.092999, 1, 1, 1, 1, 1,
-1.530903, -0.9650301, -2.302768, 1, 1, 1, 1, 1,
-1.530683, 0.3704118, -1.607646, 1, 1, 1, 1, 1,
-1.526016, -1.287313, -1.718827, 0, 0, 1, 1, 1,
-1.525586, -2.135494, -2.653423, 1, 0, 0, 1, 1,
-1.51702, 0.9961534, -0.4435139, 1, 0, 0, 1, 1,
-1.508757, 0.8481696, -2.223729, 1, 0, 0, 1, 1,
-1.501095, 0.9066054, -0.8737578, 1, 0, 0, 1, 1,
-1.500614, 0.9722254, -0.5247148, 1, 0, 0, 1, 1,
-1.500458, -1.967043, -3.391877, 0, 0, 0, 1, 1,
-1.500166, 0.4446879, -0.3343416, 0, 0, 0, 1, 1,
-1.485825, -0.7491743, -2.631721, 0, 0, 0, 1, 1,
-1.460107, 0.4225515, -1.969334, 0, 0, 0, 1, 1,
-1.451379, -2.429211, -3.178847, 0, 0, 0, 1, 1,
-1.450041, 0.762054, -0.983493, 0, 0, 0, 1, 1,
-1.435579, -0.716159, -1.044443, 0, 0, 0, 1, 1,
-1.435307, -0.6017348, -0.9952295, 1, 1, 1, 1, 1,
-1.434815, 0.6409305, -1.362735, 1, 1, 1, 1, 1,
-1.431959, 1.124386, -0.9142932, 1, 1, 1, 1, 1,
-1.424123, 1.022485, -0.4034023, 1, 1, 1, 1, 1,
-1.42001, 0.3248446, -0.8576626, 1, 1, 1, 1, 1,
-1.414032, 0.04123475, -1.396786, 1, 1, 1, 1, 1,
-1.41068, 0.255502, -0.7148268, 1, 1, 1, 1, 1,
-1.402257, 1.154658, -1.88651, 1, 1, 1, 1, 1,
-1.397459, -0.4127688, -1.161427, 1, 1, 1, 1, 1,
-1.395334, -0.4913402, -4.042155, 1, 1, 1, 1, 1,
-1.389458, -1.243383, -3.130302, 1, 1, 1, 1, 1,
-1.387793, -0.4632017, -1.213483, 1, 1, 1, 1, 1,
-1.387713, -0.2027192, -1.532307, 1, 1, 1, 1, 1,
-1.375623, -1.677489, -2.329378, 1, 1, 1, 1, 1,
-1.370093, -1.701546, -3.390968, 1, 1, 1, 1, 1,
-1.363738, -1.818778, -0.3403239, 0, 0, 1, 1, 1,
-1.359879, -0.2674193, -2.835965, 1, 0, 0, 1, 1,
-1.359475, 1.939772, 0.2526349, 1, 0, 0, 1, 1,
-1.354715, 0.09913788, 0.1065086, 1, 0, 0, 1, 1,
-1.351124, 1.513395, -0.2017514, 1, 0, 0, 1, 1,
-1.347608, 0.1929469, -2.842543, 1, 0, 0, 1, 1,
-1.330938, 1.548649, -1.57605, 0, 0, 0, 1, 1,
-1.330283, -1.425986, -2.061864, 0, 0, 0, 1, 1,
-1.31136, 0.2476224, -0.591241, 0, 0, 0, 1, 1,
-1.310287, -0.5353897, -1.730867, 0, 0, 0, 1, 1,
-1.30689, 0.3941732, -2.479445, 0, 0, 0, 1, 1,
-1.305443, 0.8066372, -0.5567912, 0, 0, 0, 1, 1,
-1.283327, 1.285002, 1.511205, 0, 0, 0, 1, 1,
-1.276401, 0.6276466, 0.1346508, 1, 1, 1, 1, 1,
-1.27348, -0.4613494, -1.644617, 1, 1, 1, 1, 1,
-1.268038, -1.252244, -2.95309, 1, 1, 1, 1, 1,
-1.265975, -0.3507827, -1.870801, 1, 1, 1, 1, 1,
-1.2642, 0.2419616, -0.3379695, 1, 1, 1, 1, 1,
-1.261932, 1.253482, -0.8696486, 1, 1, 1, 1, 1,
-1.255326, 0.2402905, -2.095836, 1, 1, 1, 1, 1,
-1.24859, 0.4377575, -2.261537, 1, 1, 1, 1, 1,
-1.247706, -0.1240619, -1.698543, 1, 1, 1, 1, 1,
-1.24174, 0.7830848, -0.5867136, 1, 1, 1, 1, 1,
-1.231767, -0.4346252, 0.5777423, 1, 1, 1, 1, 1,
-1.226658, -1.345489, -1.659922, 1, 1, 1, 1, 1,
-1.226212, 0.7391575, -1.634917, 1, 1, 1, 1, 1,
-1.225304, 0.4985239, -0.01062767, 1, 1, 1, 1, 1,
-1.218378, 0.271563, -1.152653, 1, 1, 1, 1, 1,
-1.217861, -0.3361982, -3.180511, 0, 0, 1, 1, 1,
-1.217286, 1.184417, -0.2667668, 1, 0, 0, 1, 1,
-1.21396, -1.736467, -2.911376, 1, 0, 0, 1, 1,
-1.212115, 0.09732925, -1.035523, 1, 0, 0, 1, 1,
-1.208994, 0.6877681, -0.7484925, 1, 0, 0, 1, 1,
-1.204084, -1.517453, -4.151355, 1, 0, 0, 1, 1,
-1.203785, 1.840768, -1.187975, 0, 0, 0, 1, 1,
-1.2032, -1.415077, -1.430109, 0, 0, 0, 1, 1,
-1.195552, -0.06855468, -0.2922996, 0, 0, 0, 1, 1,
-1.194541, -1.825469, -3.418923, 0, 0, 0, 1, 1,
-1.188594, 1.718603, -1.121548, 0, 0, 0, 1, 1,
-1.185995, 0.3284242, -1.076657, 0, 0, 0, 1, 1,
-1.175871, -0.1853499, -0.4639732, 0, 0, 0, 1, 1,
-1.175661, 0.0813809, -3.761655, 1, 1, 1, 1, 1,
-1.171712, -0.5096476, -1.849774, 1, 1, 1, 1, 1,
-1.170486, 0.08624199, -0.6119989, 1, 1, 1, 1, 1,
-1.160595, 0.2649403, -2.121038, 1, 1, 1, 1, 1,
-1.157798, 0.876427, -1.001563, 1, 1, 1, 1, 1,
-1.154029, -0.3317006, -1.757079, 1, 1, 1, 1, 1,
-1.153936, -2.690309, -2.963216, 1, 1, 1, 1, 1,
-1.152912, 0.4327971, -0.4791215, 1, 1, 1, 1, 1,
-1.143486, -0.2095604, -0.6956094, 1, 1, 1, 1, 1,
-1.143347, -0.6618863, -3.58516, 1, 1, 1, 1, 1,
-1.141558, 0.2667753, -1.184173, 1, 1, 1, 1, 1,
-1.138954, 0.1430827, -1.01064, 1, 1, 1, 1, 1,
-1.138657, 1.648913, -0.3888911, 1, 1, 1, 1, 1,
-1.134759, 0.9872122, -0.2596655, 1, 1, 1, 1, 1,
-1.134185, 0.9724203, 0.4817178, 1, 1, 1, 1, 1,
-1.133957, 0.2001654, -1.851363, 0, 0, 1, 1, 1,
-1.128814, 0.6807306, 0.1525375, 1, 0, 0, 1, 1,
-1.128709, 1.699966, -0.3472872, 1, 0, 0, 1, 1,
-1.127127, -0.5217035, -2.890354, 1, 0, 0, 1, 1,
-1.123947, 0.5224769, -0.114296, 1, 0, 0, 1, 1,
-1.121445, -0.151393, -1.043548, 1, 0, 0, 1, 1,
-1.119332, 1.201375, -1.213204, 0, 0, 0, 1, 1,
-1.110614, 1.093338, -0.8567457, 0, 0, 0, 1, 1,
-1.108311, 0.9992126, -1.161059, 0, 0, 0, 1, 1,
-1.104896, 1.672901, -0.6110535, 0, 0, 0, 1, 1,
-1.092032, -1.229757, -3.007123, 0, 0, 0, 1, 1,
-1.082813, 0.4836043, -0.3635526, 0, 0, 0, 1, 1,
-1.082044, -0.08822785, -3.579997, 0, 0, 0, 1, 1,
-1.081856, 0.1294264, -2.610948, 1, 1, 1, 1, 1,
-1.080101, 0.9140084, -0.2164976, 1, 1, 1, 1, 1,
-1.076007, 0.7731915, 0.9039572, 1, 1, 1, 1, 1,
-1.070117, 1.857432, 0.1672485, 1, 1, 1, 1, 1,
-1.069533, -0.5272911, -3.452963, 1, 1, 1, 1, 1,
-1.068623, 1.037152, 0.1835392, 1, 1, 1, 1, 1,
-1.066772, 0.05826781, -0.5187042, 1, 1, 1, 1, 1,
-1.063699, 2.122641, -0.7075766, 1, 1, 1, 1, 1,
-1.057108, 1.860038, 1.530875, 1, 1, 1, 1, 1,
-1.055555, 0.1122518, -1.902095, 1, 1, 1, 1, 1,
-1.052234, 1.58538, -0.4801154, 1, 1, 1, 1, 1,
-1.043538, 0.05788632, -1.021082, 1, 1, 1, 1, 1,
-1.043299, 0.1088682, -0.5439097, 1, 1, 1, 1, 1,
-1.035587, -1.046142, -1.97037, 1, 1, 1, 1, 1,
-1.01991, -0.1052716, -2.572039, 1, 1, 1, 1, 1,
-1.019902, 0.38704, -1.946979, 0, 0, 1, 1, 1,
-1.019896, 1.163761, 0.06612199, 1, 0, 0, 1, 1,
-1.009964, 0.7503727, -0.5206228, 1, 0, 0, 1, 1,
-1.009509, 0.6351335, 0.7387125, 1, 0, 0, 1, 1,
-1.006192, 0.8407587, -0.894486, 1, 0, 0, 1, 1,
-1.002954, -0.5108744, -2.924764, 1, 0, 0, 1, 1,
-0.9949909, 0.7185683, -0.3061545, 0, 0, 0, 1, 1,
-0.993403, -1.666721, -3.865053, 0, 0, 0, 1, 1,
-0.9854583, -0.6245298, -2.199754, 0, 0, 0, 1, 1,
-0.9836693, 0.6963707, -0.2519726, 0, 0, 0, 1, 1,
-0.9794202, -0.3310975, -2.343654, 0, 0, 0, 1, 1,
-0.9784048, 0.727433, -2.075143, 0, 0, 0, 1, 1,
-0.978259, -1.152152, -3.577555, 0, 0, 0, 1, 1,
-0.9731684, -0.7957515, -2.026698, 1, 1, 1, 1, 1,
-0.9682326, 1.2477, 0.3486043, 1, 1, 1, 1, 1,
-0.9668334, -0.8646702, -2.842715, 1, 1, 1, 1, 1,
-0.960849, 0.04997398, -1.498083, 1, 1, 1, 1, 1,
-0.953391, 0.4842302, -2.545713, 1, 1, 1, 1, 1,
-0.95057, -0.7140691, -1.49936, 1, 1, 1, 1, 1,
-0.9481486, 0.6372634, 0.2476023, 1, 1, 1, 1, 1,
-0.9475026, 1.488426, -0.9908278, 1, 1, 1, 1, 1,
-0.9436188, -0.3611694, -5.23753, 1, 1, 1, 1, 1,
-0.9432372, -2.293355, -2.698985, 1, 1, 1, 1, 1,
-0.9415581, -0.7157754, -3.288142, 1, 1, 1, 1, 1,
-0.9389976, -0.337054, -1.50063, 1, 1, 1, 1, 1,
-0.9375495, -0.2056698, -2.675795, 1, 1, 1, 1, 1,
-0.9370245, 0.9488718, -0.0918373, 1, 1, 1, 1, 1,
-0.9288653, -0.6601483, -1.632821, 1, 1, 1, 1, 1,
-0.9261014, 0.6186205, -1.389056, 0, 0, 1, 1, 1,
-0.9259846, 1.353613, -1.441119, 1, 0, 0, 1, 1,
-0.9244499, -0.3327924, -1.113174, 1, 0, 0, 1, 1,
-0.9021112, 1.174316, -1.447054, 1, 0, 0, 1, 1,
-0.9009085, -0.9182497, -2.5589, 1, 0, 0, 1, 1,
-0.8971945, -2.525375, -1.474196, 1, 0, 0, 1, 1,
-0.8857707, -0.2002681, 0.2188456, 0, 0, 0, 1, 1,
-0.8841391, -1.477, -2.742259, 0, 0, 0, 1, 1,
-0.8815867, 2.736382, -1.93749, 0, 0, 0, 1, 1,
-0.8713765, -1.755225, -3.171276, 0, 0, 0, 1, 1,
-0.871345, 0.7383432, -1.261071, 0, 0, 0, 1, 1,
-0.8705428, -0.3409808, -0.7681451, 0, 0, 0, 1, 1,
-0.8698085, 0.4617833, -1.317565, 0, 0, 0, 1, 1,
-0.8689259, -0.3821621, -0.7321536, 1, 1, 1, 1, 1,
-0.8632349, 1.475292, -0.3321708, 1, 1, 1, 1, 1,
-0.8625332, -1.672747, -4.043904, 1, 1, 1, 1, 1,
-0.8499482, 0.387389, -1.081147, 1, 1, 1, 1, 1,
-0.8479909, -0.1518958, -2.361311, 1, 1, 1, 1, 1,
-0.8479407, -1.212078, -2.30321, 1, 1, 1, 1, 1,
-0.8426914, -0.8016289, -2.834991, 1, 1, 1, 1, 1,
-0.8401382, -1.164073, -2.484521, 1, 1, 1, 1, 1,
-0.8373321, -0.01917584, -2.962231, 1, 1, 1, 1, 1,
-0.8338562, 0.1811463, -0.2505321, 1, 1, 1, 1, 1,
-0.8332822, 1.160689, -0.2853627, 1, 1, 1, 1, 1,
-0.8315673, 0.9300383, -0.09600841, 1, 1, 1, 1, 1,
-0.8300387, 0.9417528, -1.371604, 1, 1, 1, 1, 1,
-0.8256829, 0.3207673, -2.223358, 1, 1, 1, 1, 1,
-0.8203731, 0.5025387, 0.6207463, 1, 1, 1, 1, 1,
-0.8137539, -0.5167344, -1.20471, 0, 0, 1, 1, 1,
-0.8131034, 1.192949, -1.743202, 1, 0, 0, 1, 1,
-0.8117515, -2.757206, -2.812413, 1, 0, 0, 1, 1,
-0.8092637, 0.8314161, -0.4532969, 1, 0, 0, 1, 1,
-0.8061001, 0.3535862, -0.9436694, 1, 0, 0, 1, 1,
-0.7996404, -0.4546159, -2.370934, 1, 0, 0, 1, 1,
-0.7943859, -0.8650814, -1.386249, 0, 0, 0, 1, 1,
-0.790965, 0.2068022, 0.7124908, 0, 0, 0, 1, 1,
-0.7884961, 1.122074, -0.2446797, 0, 0, 0, 1, 1,
-0.7759801, 0.4137087, -0.89741, 0, 0, 0, 1, 1,
-0.7737191, 0.6395765, -1.424756, 0, 0, 0, 1, 1,
-0.7735865, 0.6593038, -1.596756, 0, 0, 0, 1, 1,
-0.7733372, 0.1438495, -0.03059541, 0, 0, 0, 1, 1,
-0.7706115, 0.1637317, -1.061208, 1, 1, 1, 1, 1,
-0.7699584, -0.3120078, -1.294998, 1, 1, 1, 1, 1,
-0.7675306, -0.447031, -1.623821, 1, 1, 1, 1, 1,
-0.7656616, 0.35373, 0.6890665, 1, 1, 1, 1, 1,
-0.7628992, -0.2127274, -1.827024, 1, 1, 1, 1, 1,
-0.7583215, -0.998434, -3.435573, 1, 1, 1, 1, 1,
-0.7534786, -1.05529, -1.251129, 1, 1, 1, 1, 1,
-0.7505574, 0.7934428, -1.211878, 1, 1, 1, 1, 1,
-0.7502467, 0.3476014, -2.223142, 1, 1, 1, 1, 1,
-0.7470781, -0.7660539, -4.399135, 1, 1, 1, 1, 1,
-0.7467997, -0.4582041, -1.340034, 1, 1, 1, 1, 1,
-0.743677, 0.2690234, -2.699396, 1, 1, 1, 1, 1,
-0.7427412, -1.134641, -2.187733, 1, 1, 1, 1, 1,
-0.7391461, -0.002593703, -0.7800419, 1, 1, 1, 1, 1,
-0.7360001, 1.401342, 2.44203, 1, 1, 1, 1, 1,
-0.7352753, 1.268442, 0.8857609, 0, 0, 1, 1, 1,
-0.7336708, 1.280602, -1.765242, 1, 0, 0, 1, 1,
-0.7287928, -1.026508, -2.21279, 1, 0, 0, 1, 1,
-0.7286761, -0.2430641, -2.162149, 1, 0, 0, 1, 1,
-0.7239641, 0.2043253, -0.6643481, 1, 0, 0, 1, 1,
-0.7231176, 1.328951, -1.043507, 1, 0, 0, 1, 1,
-0.7210256, -0.222905, -1.224711, 0, 0, 0, 1, 1,
-0.7196091, 0.5703295, -1.170844, 0, 0, 0, 1, 1,
-0.7190936, 0.1124203, -1.517842, 0, 0, 0, 1, 1,
-0.7063492, 1.064563, -0.7419757, 0, 0, 0, 1, 1,
-0.6976663, -0.2201124, -2.083735, 0, 0, 0, 1, 1,
-0.6951517, -2.017357, -2.787344, 0, 0, 0, 1, 1,
-0.6928134, 0.4749546, 0.7638959, 0, 0, 0, 1, 1,
-0.6903651, -0.8250691, -2.000999, 1, 1, 1, 1, 1,
-0.6867393, -0.7374854, -1.608971, 1, 1, 1, 1, 1,
-0.6854642, 0.9163145, -0.9302162, 1, 1, 1, 1, 1,
-0.6844252, 0.6018355, 0.3714425, 1, 1, 1, 1, 1,
-0.6824169, 0.496608, -1.16226, 1, 1, 1, 1, 1,
-0.6785291, -0.6174844, -2.082784, 1, 1, 1, 1, 1,
-0.6716325, -0.6838791, -3.389634, 1, 1, 1, 1, 1,
-0.6687062, 0.9951143, 0.3053063, 1, 1, 1, 1, 1,
-0.6628357, -0.814053, -3.885198, 1, 1, 1, 1, 1,
-0.659596, -0.5250667, -1.732375, 1, 1, 1, 1, 1,
-0.657208, -0.3608949, -1.6545, 1, 1, 1, 1, 1,
-0.6571445, -2.066809, -1.585585, 1, 1, 1, 1, 1,
-0.6564832, 3.015252, -2.375761, 1, 1, 1, 1, 1,
-0.6564126, 2.077389, -0.07040423, 1, 1, 1, 1, 1,
-0.6507934, 0.1028244, -0.9858886, 1, 1, 1, 1, 1,
-0.6437292, 0.7322278, 1.4406, 0, 0, 1, 1, 1,
-0.6416383, -2.427217, -3.18389, 1, 0, 0, 1, 1,
-0.6414748, -0.2643648, -2.418285, 1, 0, 0, 1, 1,
-0.6349924, -0.2722467, -0.8820197, 1, 0, 0, 1, 1,
-0.6326693, -2.125133, -4.568936, 1, 0, 0, 1, 1,
-0.6283108, -0.1731375, -2.043266, 1, 0, 0, 1, 1,
-0.627441, -1.506175, -3.628342, 0, 0, 0, 1, 1,
-0.6237971, 1.765122, 0.2647931, 0, 0, 0, 1, 1,
-0.6203085, 2.05232, -2.230289, 0, 0, 0, 1, 1,
-0.6131784, 0.6084384, -1.078327, 0, 0, 0, 1, 1,
-0.612909, -1.243111, -0.4084451, 0, 0, 0, 1, 1,
-0.6102565, -0.2560475, -2.98034, 0, 0, 0, 1, 1,
-0.6086314, 0.7338215, 1.69895, 0, 0, 0, 1, 1,
-0.5975046, -0.735782, -3.132786, 1, 1, 1, 1, 1,
-0.5934765, 1.221871, 1.142759, 1, 1, 1, 1, 1,
-0.5864094, -1.256252, -4.303313, 1, 1, 1, 1, 1,
-0.5851517, 0.1960683, -0.631377, 1, 1, 1, 1, 1,
-0.5843026, 0.937229, -1.005872, 1, 1, 1, 1, 1,
-0.5832057, 0.483227, -0.5301756, 1, 1, 1, 1, 1,
-0.577831, 0.02246012, -2.325241, 1, 1, 1, 1, 1,
-0.5678238, -0.04732482, 0.1144756, 1, 1, 1, 1, 1,
-0.5622931, -0.7295908, -2.886471, 1, 1, 1, 1, 1,
-0.5594553, 1.124104, -1.405108, 1, 1, 1, 1, 1,
-0.5590724, 1.10189, -0.7486839, 1, 1, 1, 1, 1,
-0.5577205, -1.355757, -2.827209, 1, 1, 1, 1, 1,
-0.5527114, 1.153404, -0.3487863, 1, 1, 1, 1, 1,
-0.5511654, -0.2419913, -2.690115, 1, 1, 1, 1, 1,
-0.5496402, -0.250099, -1.857836, 1, 1, 1, 1, 1,
-0.5488413, -1.110107, -3.384867, 0, 0, 1, 1, 1,
-0.547001, -0.145262, -2.258013, 1, 0, 0, 1, 1,
-0.5414767, -1.276573, -2.889767, 1, 0, 0, 1, 1,
-0.5379736, -2.323559, -1.510814, 1, 0, 0, 1, 1,
-0.5350869, 0.745944, 0.1959494, 1, 0, 0, 1, 1,
-0.5223348, -0.4554045, -1.608241, 1, 0, 0, 1, 1,
-0.5202672, -0.2404541, -2.352469, 0, 0, 0, 1, 1,
-0.5147692, -0.1447031, -1.195464, 0, 0, 0, 1, 1,
-0.510987, -1.355618, -2.73952, 0, 0, 0, 1, 1,
-0.508615, 0.226705, -0.9102426, 0, 0, 0, 1, 1,
-0.5029799, 0.4770293, 0.7712927, 0, 0, 0, 1, 1,
-0.5012745, 0.1754792, -2.133453, 0, 0, 0, 1, 1,
-0.4991218, 0.7189157, -1.330466, 0, 0, 0, 1, 1,
-0.4977596, -0.3079672, -4.148542, 1, 1, 1, 1, 1,
-0.4969445, 0.6410029, -0.8302484, 1, 1, 1, 1, 1,
-0.4964265, 0.7166291, 0.294662, 1, 1, 1, 1, 1,
-0.4958476, 0.8567722, -0.8197713, 1, 1, 1, 1, 1,
-0.4933026, -1.519772, -2.715411, 1, 1, 1, 1, 1,
-0.4908242, -0.6624883, -3.462659, 1, 1, 1, 1, 1,
-0.4891886, 0.10372, -1.079661, 1, 1, 1, 1, 1,
-0.4870395, -1.443331, -1.048081, 1, 1, 1, 1, 1,
-0.4793461, -1.246673, -3.402191, 1, 1, 1, 1, 1,
-0.4773903, -0.1500479, -3.764889, 1, 1, 1, 1, 1,
-0.472785, -1.764079, -2.419512, 1, 1, 1, 1, 1,
-0.4671392, 0.2751724, -3.067187, 1, 1, 1, 1, 1,
-0.4660876, -0.5640539, -5.33424, 1, 1, 1, 1, 1,
-0.4649676, -0.5069872, -2.484817, 1, 1, 1, 1, 1,
-0.4640551, -0.7614984, -2.342054, 1, 1, 1, 1, 1,
-0.4603271, 0.6986158, 0.7682779, 0, 0, 1, 1, 1,
-0.4600422, 1.150781, -1.079035, 1, 0, 0, 1, 1,
-0.4562259, -0.7193331, -1.153955, 1, 0, 0, 1, 1,
-0.4542599, 0.4667671, -3.141746, 1, 0, 0, 1, 1,
-0.4525736, -0.7115033, -3.823081, 1, 0, 0, 1, 1,
-0.4494136, 0.9898948, 0.5503504, 1, 0, 0, 1, 1,
-0.4453808, 0.7107134, 0.1524684, 0, 0, 0, 1, 1,
-0.441841, -0.6375722, -2.641374, 0, 0, 0, 1, 1,
-0.4396956, 0.6790609, 0.07066611, 0, 0, 0, 1, 1,
-0.4345665, 0.290352, -0.4875369, 0, 0, 0, 1, 1,
-0.433716, 1.60237, -1.232512, 0, 0, 0, 1, 1,
-0.4326599, 0.3536012, -0.5168847, 0, 0, 0, 1, 1,
-0.4299691, 2.277349, 0.7919671, 0, 0, 0, 1, 1,
-0.4297518, -0.5611395, -2.787935, 1, 1, 1, 1, 1,
-0.4264095, 0.7410349, -0.9588922, 1, 1, 1, 1, 1,
-0.4224356, -0.6888273, -2.378869, 1, 1, 1, 1, 1,
-0.413662, -0.4791516, -3.085783, 1, 1, 1, 1, 1,
-0.4073419, 0.1478839, -0.1138995, 1, 1, 1, 1, 1,
-0.4046056, 1.069543, -0.04640784, 1, 1, 1, 1, 1,
-0.4044223, 0.5777168, 0.2875314, 1, 1, 1, 1, 1,
-0.3993748, 0.2890326, -1.378009, 1, 1, 1, 1, 1,
-0.3982891, -0.448449, -2.005566, 1, 1, 1, 1, 1,
-0.3878497, 0.3216904, -0.1455462, 1, 1, 1, 1, 1,
-0.3857377, -0.849903, -2.116047, 1, 1, 1, 1, 1,
-0.3747351, 1.853166, -1.631935, 1, 1, 1, 1, 1,
-0.3739129, -1.321305, -2.802931, 1, 1, 1, 1, 1,
-0.373501, -1.759209, -3.846352, 1, 1, 1, 1, 1,
-0.3661375, 0.1464357, -0.7261386, 1, 1, 1, 1, 1,
-0.3659699, 1.72173, -1.01557, 0, 0, 1, 1, 1,
-0.3584965, 0.2036189, -1.118983, 1, 0, 0, 1, 1,
-0.3443826, -0.3715356, -2.419783, 1, 0, 0, 1, 1,
-0.3441183, -0.4611611, -0.2662493, 1, 0, 0, 1, 1,
-0.343749, 0.9930817, 0.2245021, 1, 0, 0, 1, 1,
-0.3423576, -1.915844, -2.388535, 1, 0, 0, 1, 1,
-0.3413541, 0.180367, -1.22436, 0, 0, 0, 1, 1,
-0.3324803, 1.931243, -0.2815808, 0, 0, 0, 1, 1,
-0.325078, 1.148514, -1.363169, 0, 0, 0, 1, 1,
-0.3231204, -0.02152695, -1.681277, 0, 0, 0, 1, 1,
-0.3192276, 1.188844, -1.112946, 0, 0, 0, 1, 1,
-0.3180822, -2.268156, -3.702599, 0, 0, 0, 1, 1,
-0.3161992, -1.419727, -2.95415, 0, 0, 0, 1, 1,
-0.3141268, -0.3119089, -2.696513, 1, 1, 1, 1, 1,
-0.3105671, -0.3118224, -1.114567, 1, 1, 1, 1, 1,
-0.3075875, -0.9328566, -2.365903, 1, 1, 1, 1, 1,
-0.3075155, 1.324713, -0.4025127, 1, 1, 1, 1, 1,
-0.3055141, 0.2148248, -2.324718, 1, 1, 1, 1, 1,
-0.30409, 0.07168116, -1.260646, 1, 1, 1, 1, 1,
-0.3034564, 0.6838328, -1.681216, 1, 1, 1, 1, 1,
-0.3013899, -0.3954264, -2.403769, 1, 1, 1, 1, 1,
-0.2995874, -0.3841044, -2.650668, 1, 1, 1, 1, 1,
-0.2922702, 0.003834687, -2.018616, 1, 1, 1, 1, 1,
-0.2856123, 0.9990069, -0.6634045, 1, 1, 1, 1, 1,
-0.2854381, 2.01017, 0.4160385, 1, 1, 1, 1, 1,
-0.2831383, 1.471009, -1.097918, 1, 1, 1, 1, 1,
-0.2783307, 1.281325, 0.5983595, 1, 1, 1, 1, 1,
-0.278266, 0.09599817, -0.632506, 1, 1, 1, 1, 1,
-0.2778936, -0.7265196, -1.651024, 0, 0, 1, 1, 1,
-0.2756181, 0.2808518, -0.6541202, 1, 0, 0, 1, 1,
-0.2651859, 0.9209735, -0.8543929, 1, 0, 0, 1, 1,
-0.2620407, 0.1766453, -0.5127267, 1, 0, 0, 1, 1,
-0.2602762, 1.230761, 0.4511191, 1, 0, 0, 1, 1,
-0.2599907, 0.9096928, -2.682481, 1, 0, 0, 1, 1,
-0.2476988, 0.5949734, -1.360913, 0, 0, 0, 1, 1,
-0.2469787, -1.497207, -3.305511, 0, 0, 0, 1, 1,
-0.2398924, -1.882599, -3.306411, 0, 0, 0, 1, 1,
-0.2374188, 0.3121724, 0.89332, 0, 0, 0, 1, 1,
-0.2345483, 0.9594542, -1.813021, 0, 0, 0, 1, 1,
-0.2294263, 1.227003, 1.790188, 0, 0, 0, 1, 1,
-0.2290405, -1.377454, -2.289248, 0, 0, 0, 1, 1,
-0.2259002, -1.397674, -2.388072, 1, 1, 1, 1, 1,
-0.2228733, 0.940116, -0.4714342, 1, 1, 1, 1, 1,
-0.2202275, -0.1141035, -0.8751833, 1, 1, 1, 1, 1,
-0.2080996, 0.07338391, 0.5039011, 1, 1, 1, 1, 1,
-0.2051405, -1.166392, -2.600624, 1, 1, 1, 1, 1,
-0.2040889, 2.328028, 1.441226, 1, 1, 1, 1, 1,
-0.2014248, 0.6738669, -1.701439, 1, 1, 1, 1, 1,
-0.1991719, 1.584795, 1.424099, 1, 1, 1, 1, 1,
-0.1974574, -1.226332, -3.013025, 1, 1, 1, 1, 1,
-0.1962588, -2.31583, -2.856076, 1, 1, 1, 1, 1,
-0.1946577, -0.7927362, -2.257187, 1, 1, 1, 1, 1,
-0.1921057, 0.4759997, -0.2639528, 1, 1, 1, 1, 1,
-0.1915722, -0.4792188, -3.087358, 1, 1, 1, 1, 1,
-0.1898732, 0.1564475, -1.99353, 1, 1, 1, 1, 1,
-0.1828413, -1.040385, -3.914422, 1, 1, 1, 1, 1,
-0.1809809, 0.5475508, -0.7944694, 0, 0, 1, 1, 1,
-0.1809595, -1.063388, -3.131203, 1, 0, 0, 1, 1,
-0.1793911, -0.3624504, -3.533201, 1, 0, 0, 1, 1,
-0.1790599, 0.4995804, -0.937079, 1, 0, 0, 1, 1,
-0.1750433, -0.4240441, -2.223013, 1, 0, 0, 1, 1,
-0.174344, 1.040341, -0.1659186, 1, 0, 0, 1, 1,
-0.1717928, -0.2194118, -3.037205, 0, 0, 0, 1, 1,
-0.170719, -0.8982047, -3.358104, 0, 0, 0, 1, 1,
-0.1696449, -0.7966036, -4.12488, 0, 0, 0, 1, 1,
-0.1652791, 0.2228769, 0.04276225, 0, 0, 0, 1, 1,
-0.1646166, -0.7214909, -3.811683, 0, 0, 0, 1, 1,
-0.1591392, -0.743598, -1.926396, 0, 0, 0, 1, 1,
-0.1581904, 0.4153596, -0.2366117, 0, 0, 0, 1, 1,
-0.1571732, 1.155666, -0.05636873, 1, 1, 1, 1, 1,
-0.1530588, -0.1369725, -1.812292, 1, 1, 1, 1, 1,
-0.1441079, -0.1685517, -3.08126, 1, 1, 1, 1, 1,
-0.1429436, -0.8404725, -3.348963, 1, 1, 1, 1, 1,
-0.1403176, -0.2998632, -2.062171, 1, 1, 1, 1, 1,
-0.1373415, -0.6997686, -2.459174, 1, 1, 1, 1, 1,
-0.1358757, 0.6589236, -1.542338, 1, 1, 1, 1, 1,
-0.1338173, -0.6648408, -3.294032, 1, 1, 1, 1, 1,
-0.1309712, -0.9042466, -2.927488, 1, 1, 1, 1, 1,
-0.1292996, 0.6205835, -1.14395, 1, 1, 1, 1, 1,
-0.1240096, 2.226802, -2.008741, 1, 1, 1, 1, 1,
-0.1211627, 1.070846, -0.2234068, 1, 1, 1, 1, 1,
-0.1207133, -0.5379454, -2.155153, 1, 1, 1, 1, 1,
-0.1206463, 2.6635, 0.9596101, 1, 1, 1, 1, 1,
-0.1204761, -1.093787, -5.733717, 1, 1, 1, 1, 1,
-0.120171, -0.3199885, -1.967551, 0, 0, 1, 1, 1,
-0.1179217, -1.301058, -1.174358, 1, 0, 0, 1, 1,
-0.1168095, 1.174531, -1.162565, 1, 0, 0, 1, 1,
-0.1132751, -0.1136776, -3.452492, 1, 0, 0, 1, 1,
-0.1122585, -1.141785, -4.999158, 1, 0, 0, 1, 1,
-0.1093784, 0.6536627, 0.2502203, 1, 0, 0, 1, 1,
-0.1040373, -0.1198775, -2.036028, 0, 0, 0, 1, 1,
-0.09902841, -0.2672446, -2.558555, 0, 0, 0, 1, 1,
-0.09407341, -0.3854637, -3.639982, 0, 0, 0, 1, 1,
-0.08669621, -0.7652944, -3.140892, 0, 0, 0, 1, 1,
-0.08126055, -1.643472, -1.929793, 0, 0, 0, 1, 1,
-0.07906941, -0.79807, -1.385282, 0, 0, 0, 1, 1,
-0.07724579, 1.347165, -1.572697, 0, 0, 0, 1, 1,
-0.07721803, 1.784983, 0.8314609, 1, 1, 1, 1, 1,
-0.0750649, -0.5448275, -2.97109, 1, 1, 1, 1, 1,
-0.07443646, -0.9322217, -2.429454, 1, 1, 1, 1, 1,
-0.07166445, -0.4951506, -2.363835, 1, 1, 1, 1, 1,
-0.07149886, -2.03488, -3.527031, 1, 1, 1, 1, 1,
-0.06326915, 0.5358298, 0.1256528, 1, 1, 1, 1, 1,
-0.06116167, -1.941537, -3.696832, 1, 1, 1, 1, 1,
-0.05944634, 0.5290546, 1.107868, 1, 1, 1, 1, 1,
-0.05828121, -1.259566, -4.22694, 1, 1, 1, 1, 1,
-0.05497853, 0.6012681, 0.03335797, 1, 1, 1, 1, 1,
-0.05300996, 0.6351254, 1.288082, 1, 1, 1, 1, 1,
-0.0524787, 1.222847, 2.304505, 1, 1, 1, 1, 1,
-0.04959098, 1.342816, -0.5073012, 1, 1, 1, 1, 1,
-0.04891324, 0.07999093, -0.7524258, 1, 1, 1, 1, 1,
-0.04825874, -0.09007638, -2.922019, 1, 1, 1, 1, 1,
-0.04713111, 0.9774166, 1.329943, 0, 0, 1, 1, 1,
-0.04481084, -0.4425487, -3.434469, 1, 0, 0, 1, 1,
-0.04028061, -0.318708, -4.68652, 1, 0, 0, 1, 1,
-0.03855229, 0.2915428, 1.569731, 1, 0, 0, 1, 1,
-0.03368805, -0.1227771, -4.244532, 1, 0, 0, 1, 1,
-0.03206268, 1.353352, -0.9726788, 1, 0, 0, 1, 1,
-0.02922871, 0.3736349, -0.1323084, 0, 0, 0, 1, 1,
-0.0283506, -0.07579063, -2.740845, 0, 0, 0, 1, 1,
-0.02716523, 1.05758, -0.4844024, 0, 0, 0, 1, 1,
-0.02683805, -2.324473, -2.282378, 0, 0, 0, 1, 1,
-0.02596954, -0.07403044, -3.263728, 0, 0, 0, 1, 1,
-0.02560564, 0.2099834, 0.20927, 0, 0, 0, 1, 1,
-0.0243123, -0.3513136, -3.200332, 0, 0, 0, 1, 1,
-0.02309069, 0.2407494, 2.783591, 1, 1, 1, 1, 1,
-0.01920056, 0.59434, -1.379484, 1, 1, 1, 1, 1,
-0.01248867, -2.071864, -4.156484, 1, 1, 1, 1, 1,
-0.005851107, 0.5416799, -0.7967114, 1, 1, 1, 1, 1,
-0.00572696, 0.7967737, 1.003529, 1, 1, 1, 1, 1,
-0.001816019, -0.5887691, -5.089177, 1, 1, 1, 1, 1,
-0.0002762875, 1.053469, -1.963398, 1, 1, 1, 1, 1,
0.004479931, -0.2824312, 4.797449, 1, 1, 1, 1, 1,
0.00779178, -1.57907, 2.135518, 1, 1, 1, 1, 1,
0.008746513, 1.373837, -0.2251881, 1, 1, 1, 1, 1,
0.01470265, 1.018438, 0.5392853, 1, 1, 1, 1, 1,
0.02276807, -0.3357403, 0.59947, 1, 1, 1, 1, 1,
0.02740958, -0.3458364, 0.9285527, 1, 1, 1, 1, 1,
0.02781585, 2.804611, 0.7083803, 1, 1, 1, 1, 1,
0.02809517, 2.403888, 0.5756074, 1, 1, 1, 1, 1,
0.02857048, 1.467096, -1.007862, 0, 0, 1, 1, 1,
0.02984911, 0.01256443, -0.8987132, 1, 0, 0, 1, 1,
0.03135015, 0.9723227, 0.7560861, 1, 0, 0, 1, 1,
0.03197483, 0.3192594, 1.731099, 1, 0, 0, 1, 1,
0.03292665, -0.57951, 3.864292, 1, 0, 0, 1, 1,
0.03297536, 0.7037908, 0.6844748, 1, 0, 0, 1, 1,
0.03346138, -0.1547607, 3.81246, 0, 0, 0, 1, 1,
0.0414748, -1.375995, 2.232045, 0, 0, 0, 1, 1,
0.04284859, -1.087407, 4.019759, 0, 0, 0, 1, 1,
0.04400328, -0.3609583, 3.744419, 0, 0, 0, 1, 1,
0.04581828, 0.7859702, -0.5030836, 0, 0, 0, 1, 1,
0.05053908, 0.1121584, -0.04370036, 0, 0, 0, 1, 1,
0.05248677, -0.006376486, 0.6462606, 0, 0, 0, 1, 1,
0.0544988, 1.815227, 1.938021, 1, 1, 1, 1, 1,
0.05867912, -0.2811785, 2.790432, 1, 1, 1, 1, 1,
0.0606166, -0.6942386, 2.687079, 1, 1, 1, 1, 1,
0.06114471, -0.5076917, 2.962643, 1, 1, 1, 1, 1,
0.06172792, 2.727295, -0.6718696, 1, 1, 1, 1, 1,
0.06351624, -1.108729, 2.796524, 1, 1, 1, 1, 1,
0.0677626, 0.1357157, -0.1264205, 1, 1, 1, 1, 1,
0.07106768, -0.1813735, 2.659943, 1, 1, 1, 1, 1,
0.07137696, 0.3659352, -1.401586, 1, 1, 1, 1, 1,
0.0756583, -0.1185788, 3.222736, 1, 1, 1, 1, 1,
0.07667709, 0.05810139, -0.2499922, 1, 1, 1, 1, 1,
0.08141387, -1.055832, 4.302329, 1, 1, 1, 1, 1,
0.08266661, 0.3374295, 1.497941, 1, 1, 1, 1, 1,
0.08482654, -0.4391826, 3.634991, 1, 1, 1, 1, 1,
0.08552475, -1.827659, 3.164982, 1, 1, 1, 1, 1,
0.08798485, -0.3208715, 3.508105, 0, 0, 1, 1, 1,
0.0926125, 1.250996, 1.035048, 1, 0, 0, 1, 1,
0.09327026, 0.7282183, 1.746243, 1, 0, 0, 1, 1,
0.0942535, -0.317738, 3.060513, 1, 0, 0, 1, 1,
0.09599627, 1.060299, 0.5042078, 1, 0, 0, 1, 1,
0.1011116, -1.993405, 2.710943, 1, 0, 0, 1, 1,
0.1049382, 0.02820938, 1.853005, 0, 0, 0, 1, 1,
0.1085748, -0.4545852, 2.191888, 0, 0, 0, 1, 1,
0.1109561, -0.5033498, 2.238975, 0, 0, 0, 1, 1,
0.1134373, 0.4270905, -0.839219, 0, 0, 0, 1, 1,
0.1179991, 0.2461908, 0.8724092, 0, 0, 0, 1, 1,
0.118658, -1.071959, 3.06405, 0, 0, 0, 1, 1,
0.1202664, 1.540777, -0.07440817, 0, 0, 0, 1, 1,
0.1258188, 0.7983202, -0.008429526, 1, 1, 1, 1, 1,
0.1260695, 1.116015, 0.3182774, 1, 1, 1, 1, 1,
0.1349734, -0.3195819, 3.979065, 1, 1, 1, 1, 1,
0.1398671, 0.2370106, -1.351109, 1, 1, 1, 1, 1,
0.1408962, -1.046784, 3.327064, 1, 1, 1, 1, 1,
0.1413209, 0.2758322, 1.814002, 1, 1, 1, 1, 1,
0.1504865, -1.392791, 3.289043, 1, 1, 1, 1, 1,
0.150966, 1.432745, 1.265629, 1, 1, 1, 1, 1,
0.1617828, -1.45189, 3.876027, 1, 1, 1, 1, 1,
0.1652391, -0.5133631, 3.085802, 1, 1, 1, 1, 1,
0.1662682, -0.6011037, 1.130422, 1, 1, 1, 1, 1,
0.1668764, -0.9498715, 3.038859, 1, 1, 1, 1, 1,
0.1735497, -0.4224801, 3.550724, 1, 1, 1, 1, 1,
0.1756499, -0.5221664, 0.6095234, 1, 1, 1, 1, 1,
0.1756797, 1.200824, 0.8294762, 1, 1, 1, 1, 1,
0.176241, 1.09907, 3.123709, 0, 0, 1, 1, 1,
0.1805149, 1.011005, -0.2582509, 1, 0, 0, 1, 1,
0.1825213, -0.6240275, 2.481474, 1, 0, 0, 1, 1,
0.1845616, 0.05128469, 3.450636, 1, 0, 0, 1, 1,
0.1902984, -0.8027629, 3.102932, 1, 0, 0, 1, 1,
0.1903891, 0.2380337, 1.073098, 1, 0, 0, 1, 1,
0.1905848, 0.3782079, -0.3234967, 0, 0, 0, 1, 1,
0.201155, 0.1427886, 1.803464, 0, 0, 0, 1, 1,
0.2016023, -0.08092502, 1.68032, 0, 0, 0, 1, 1,
0.2025273, -1.34001, 3.805976, 0, 0, 0, 1, 1,
0.2143455, 0.3772366, 0.9596193, 0, 0, 0, 1, 1,
0.2176301, 1.233336, -0.2757036, 0, 0, 0, 1, 1,
0.2183341, 0.1988483, 1.287398, 0, 0, 0, 1, 1,
0.2186887, -2.025229, 3.381056, 1, 1, 1, 1, 1,
0.2221821, 0.3393846, 0.1772949, 1, 1, 1, 1, 1,
0.2335308, 0.1349597, 0.8367128, 1, 1, 1, 1, 1,
0.2375024, 0.1158945, 1.043075, 1, 1, 1, 1, 1,
0.2376729, 1.654942, 1.909792, 1, 1, 1, 1, 1,
0.2378016, 0.4823319, 1.101384, 1, 1, 1, 1, 1,
0.2408613, -0.924141, 3.129067, 1, 1, 1, 1, 1,
0.245434, -0.5992637, 4.418625, 1, 1, 1, 1, 1,
0.2537088, -0.8515266, 4.046944, 1, 1, 1, 1, 1,
0.2539828, -0.7338064, 2.220572, 1, 1, 1, 1, 1,
0.2546286, -1.78148, 4.373953, 1, 1, 1, 1, 1,
0.2561359, 0.6044008, -0.180557, 1, 1, 1, 1, 1,
0.2585216, -0.2466914, 2.423335, 1, 1, 1, 1, 1,
0.2587262, 0.5468778, 0.04278018, 1, 1, 1, 1, 1,
0.260812, 0.5999953, 2.481688, 1, 1, 1, 1, 1,
0.2632286, 0.2342566, 1.423543, 0, 0, 1, 1, 1,
0.264485, 0.2682161, 0.1609658, 1, 0, 0, 1, 1,
0.2668942, -1.573907, 3.116231, 1, 0, 0, 1, 1,
0.2674745, -0.8524593, 2.283863, 1, 0, 0, 1, 1,
0.2685224, 0.5185708, 1.871157, 1, 0, 0, 1, 1,
0.2689127, 1.437575, 0.2241829, 1, 0, 0, 1, 1,
0.2702597, -0.1548384, 1.552341, 0, 0, 0, 1, 1,
0.2708052, -0.4496683, 2.868669, 0, 0, 0, 1, 1,
0.276114, -0.09138096, 0.9188201, 0, 0, 0, 1, 1,
0.2783462, 0.5128177, -0.2232422, 0, 0, 0, 1, 1,
0.2810315, -1.166295, 3.134568, 0, 0, 0, 1, 1,
0.2810596, 0.07645794, -0.4658013, 0, 0, 0, 1, 1,
0.2831746, -3.000741, 3.670484, 0, 0, 0, 1, 1,
0.283282, -0.4975555, 1.056374, 1, 1, 1, 1, 1,
0.2856146, -0.6964884, 3.24011, 1, 1, 1, 1, 1,
0.2917895, 0.08827239, 1.672106, 1, 1, 1, 1, 1,
0.2937608, -0.4314663, 2.427519, 1, 1, 1, 1, 1,
0.2948915, -0.04397885, -1.015046, 1, 1, 1, 1, 1,
0.2955455, -2.827899, 2.245765, 1, 1, 1, 1, 1,
0.29714, 1.002089, 1.208602, 1, 1, 1, 1, 1,
0.2978925, -0.08175875, 0.08924319, 1, 1, 1, 1, 1,
0.3039108, 0.07603872, 1.898745, 1, 1, 1, 1, 1,
0.3045975, 0.980405, 1.213989, 1, 1, 1, 1, 1,
0.305358, 1.261162, 0.04877968, 1, 1, 1, 1, 1,
0.3055513, -0.358153, 3.866029, 1, 1, 1, 1, 1,
0.3078056, 0.4566875, -0.5316402, 1, 1, 1, 1, 1,
0.3159016, -1.351512, 2.907724, 1, 1, 1, 1, 1,
0.318363, -1.524803, 3.706681, 1, 1, 1, 1, 1,
0.3206834, -1.117302, 1.938033, 0, 0, 1, 1, 1,
0.3365577, 1.018031, -0.008678594, 1, 0, 0, 1, 1,
0.3369625, -0.9823366, 3.109351, 1, 0, 0, 1, 1,
0.3377653, 0.1497613, 2.075394, 1, 0, 0, 1, 1,
0.3407612, 1.77637, 1.529384, 1, 0, 0, 1, 1,
0.3474087, -1.881661, 3.982074, 1, 0, 0, 1, 1,
0.3500364, 0.5233505, 1.219199, 0, 0, 0, 1, 1,
0.3519974, 0.2193312, 1.537448, 0, 0, 0, 1, 1,
0.3564742, -0.09709472, 3.425879, 0, 0, 0, 1, 1,
0.3567969, 1.899501, 1.129163, 0, 0, 0, 1, 1,
0.3585719, -1.249167, 2.631774, 0, 0, 0, 1, 1,
0.3590085, 0.4638663, 0.5195059, 0, 0, 0, 1, 1,
0.3633896, 0.4931047, 0.5868617, 0, 0, 0, 1, 1,
0.3644173, -0.5626571, 4.345063, 1, 1, 1, 1, 1,
0.3656333, 0.1205238, 1.250941, 1, 1, 1, 1, 1,
0.3677961, 0.2797975, 0.5211374, 1, 1, 1, 1, 1,
0.3688713, 0.408555, 0.7163348, 1, 1, 1, 1, 1,
0.3701341, 0.6772354, 0.01965142, 1, 1, 1, 1, 1,
0.3718147, 0.9401709, 2.691329, 1, 1, 1, 1, 1,
0.3741667, -0.7414308, 3.074506, 1, 1, 1, 1, 1,
0.3748133, -0.9629891, 2.494139, 1, 1, 1, 1, 1,
0.3822266, -1.122253, 2.788283, 1, 1, 1, 1, 1,
0.3822762, -1.364016, 1.799556, 1, 1, 1, 1, 1,
0.3833901, -0.08580117, 0.4792538, 1, 1, 1, 1, 1,
0.3862814, 0.3094631, 0.1182044, 1, 1, 1, 1, 1,
0.3888617, -0.7321422, 3.386233, 1, 1, 1, 1, 1,
0.3965675, 1.096297, -0.7404334, 1, 1, 1, 1, 1,
0.4024283, -0.3056811, 2.022494, 1, 1, 1, 1, 1,
0.4040845, -2.118132, 4.213157, 0, 0, 1, 1, 1,
0.4040909, -0.996037, 1.978111, 1, 0, 0, 1, 1,
0.404937, 0.6321324, 0.2101188, 1, 0, 0, 1, 1,
0.4071563, 0.00011092, 2.582668, 1, 0, 0, 1, 1,
0.4079902, -0.8932124, 2.528512, 1, 0, 0, 1, 1,
0.4084387, -1.849545, 2.331483, 1, 0, 0, 1, 1,
0.4139496, -0.390974, 1.727596, 0, 0, 0, 1, 1,
0.4160141, -0.505514, 2.927756, 0, 0, 0, 1, 1,
0.4179257, -2.277667, 3.014357, 0, 0, 0, 1, 1,
0.4190748, 0.7334701, -0.3902707, 0, 0, 0, 1, 1,
0.4236184, 1.091006, -0.020688, 0, 0, 0, 1, 1,
0.4260676, 0.6782136, 3.026679, 0, 0, 0, 1, 1,
0.4279881, 0.3338902, 0.3366088, 0, 0, 0, 1, 1,
0.4280102, -0.926781, 2.498058, 1, 1, 1, 1, 1,
0.4285684, -2.360926, 2.307344, 1, 1, 1, 1, 1,
0.4310317, 0.2007632, -0.4406457, 1, 1, 1, 1, 1,
0.4339745, 0.6894273, 2.364017, 1, 1, 1, 1, 1,
0.4389505, 0.5673286, -0.006029701, 1, 1, 1, 1, 1,
0.4404655, 0.2773951, 1.322149, 1, 1, 1, 1, 1,
0.4481487, 0.7434343, 2.224481, 1, 1, 1, 1, 1,
0.4505697, 0.7155537, -0.2341463, 1, 1, 1, 1, 1,
0.4524876, 1.156203, 0.938947, 1, 1, 1, 1, 1,
0.4529465, -0.3859595, 1.754707, 1, 1, 1, 1, 1,
0.4606382, 0.5402626, 0.63969, 1, 1, 1, 1, 1,
0.461383, -1.239543, 2.445329, 1, 1, 1, 1, 1,
0.4623533, -0.03125403, -0.5203288, 1, 1, 1, 1, 1,
0.4637341, -1.231681, 2.492631, 1, 1, 1, 1, 1,
0.4659935, 0.002141123, 1.458193, 1, 1, 1, 1, 1,
0.4663939, -0.9427693, 1.448894, 0, 0, 1, 1, 1,
0.4702095, 0.467813, -0.4618037, 1, 0, 0, 1, 1,
0.4717854, 1.072125, -0.06658904, 1, 0, 0, 1, 1,
0.4741537, 1.003582, -1.032566, 1, 0, 0, 1, 1,
0.4782383, -0.3473255, 3.050109, 1, 0, 0, 1, 1,
0.4838881, 0.05245725, 1.455609, 1, 0, 0, 1, 1,
0.4851229, -0.6674342, 1.925968, 0, 0, 0, 1, 1,
0.487107, -0.4196816, 1.021866, 0, 0, 0, 1, 1,
0.4880483, 1.990029, -0.09493127, 0, 0, 0, 1, 1,
0.4904877, -0.7892027, 2.884951, 0, 0, 0, 1, 1,
0.4911038, 0.1509419, -0.1173198, 0, 0, 0, 1, 1,
0.4959042, 1.610198, 1.103332, 0, 0, 0, 1, 1,
0.500934, -1.774994, 3.657276, 0, 0, 0, 1, 1,
0.5013561, -1.338416, 3.14701, 1, 1, 1, 1, 1,
0.5020224, 0.2486719, 1.680526, 1, 1, 1, 1, 1,
0.5134704, -0.7919779, 2.415926, 1, 1, 1, 1, 1,
0.5208157, -1.066001, 1.311685, 1, 1, 1, 1, 1,
0.5293556, 0.6239631, 1.388918, 1, 1, 1, 1, 1,
0.5416309, -0.8595408, 3.025878, 1, 1, 1, 1, 1,
0.5436505, 1.575924, 0.1326379, 1, 1, 1, 1, 1,
0.545231, -0.3837095, 2.500863, 1, 1, 1, 1, 1,
0.5469564, 0.4870238, -0.3940448, 1, 1, 1, 1, 1,
0.5473238, 0.1262176, 1.597457, 1, 1, 1, 1, 1,
0.5547763, -0.1746437, -0.02510244, 1, 1, 1, 1, 1,
0.5560631, 1.370295, 0.01580343, 1, 1, 1, 1, 1,
0.5589543, 1.228662, 0.7516613, 1, 1, 1, 1, 1,
0.565579, -0.1118016, 2.603232, 1, 1, 1, 1, 1,
0.5738307, 0.8363814, -1.189343, 1, 1, 1, 1, 1,
0.5742952, 1.077927, 0.6316789, 0, 0, 1, 1, 1,
0.5743548, -0.6657168, 2.303335, 1, 0, 0, 1, 1,
0.576112, 1.030995, 0.3677397, 1, 0, 0, 1, 1,
0.5768059, 0.5865842, -0.9310446, 1, 0, 0, 1, 1,
0.5793942, 1.065565, 0.03887664, 1, 0, 0, 1, 1,
0.5835047, 0.3344128, -0.9236461, 1, 0, 0, 1, 1,
0.5884501, 0.01717585, 3.1529, 0, 0, 0, 1, 1,
0.5921183, 1.121081, 0.4859892, 0, 0, 0, 1, 1,
0.593451, -1.130058, 2.566922, 0, 0, 0, 1, 1,
0.5941457, -0.2929951, 0.6731004, 0, 0, 0, 1, 1,
0.5957357, 0.3260334, 1.415864, 0, 0, 0, 1, 1,
0.5963833, 0.7598505, 1.25413, 0, 0, 0, 1, 1,
0.5987326, -0.4375289, 2.538855, 0, 0, 0, 1, 1,
0.5989602, 0.4538078, -0.1207629, 1, 1, 1, 1, 1,
0.6044752, 0.8334523, -0.1948803, 1, 1, 1, 1, 1,
0.6054902, 0.5978633, 0.3022458, 1, 1, 1, 1, 1,
0.6060824, 0.7880388, -0.5638958, 1, 1, 1, 1, 1,
0.6157933, -0.1747263, 3.022738, 1, 1, 1, 1, 1,
0.6242897, -0.4888117, 2.402675, 1, 1, 1, 1, 1,
0.6245834, -1.046934, 1.620712, 1, 1, 1, 1, 1,
0.6325381, 1.065901, 0.01340191, 1, 1, 1, 1, 1,
0.6363531, -0.7376972, 2.945409, 1, 1, 1, 1, 1,
0.643512, 0.1151348, 1.349002, 1, 1, 1, 1, 1,
0.6448019, -2.161422, 4.025764, 1, 1, 1, 1, 1,
0.6455413, -0.4172476, 3.118457, 1, 1, 1, 1, 1,
0.650879, 1.238189, -0.3151035, 1, 1, 1, 1, 1,
0.652859, -1.455979, 3.931904, 1, 1, 1, 1, 1,
0.6616493, -1.755327, 3.437017, 1, 1, 1, 1, 1,
0.6625311, -0.7131724, 1.896645, 0, 0, 1, 1, 1,
0.6739847, 0.5610891, 1.804065, 1, 0, 0, 1, 1,
0.6760302, 0.2866264, -0.2035876, 1, 0, 0, 1, 1,
0.6774706, 1.169285, 1.334118, 1, 0, 0, 1, 1,
0.6787066, -0.03797306, 1.966532, 1, 0, 0, 1, 1,
0.6801269, -0.7565439, 2.251739, 1, 0, 0, 1, 1,
0.686937, -0.797894, 2.810433, 0, 0, 0, 1, 1,
0.6880352, -0.6924719, 3.926264, 0, 0, 0, 1, 1,
0.6936077, 0.9786577, -0.644628, 0, 0, 0, 1, 1,
0.6976178, 0.2284104, 2.174445, 0, 0, 0, 1, 1,
0.6994793, -0.1528864, 2.559084, 0, 0, 0, 1, 1,
0.701791, -0.200657, 1.73758, 0, 0, 0, 1, 1,
0.7030407, -0.03549359, 1.957766, 0, 0, 0, 1, 1,
0.7038383, 0.4200857, 1.841298, 1, 1, 1, 1, 1,
0.7067084, -1.330608, 2.777567, 1, 1, 1, 1, 1,
0.7071112, -0.9466015, 3.241091, 1, 1, 1, 1, 1,
0.7084681, -0.3405285, 2.235088, 1, 1, 1, 1, 1,
0.7085946, 1.334159, 1.842222, 1, 1, 1, 1, 1,
0.7109325, -2.063255, 3.671892, 1, 1, 1, 1, 1,
0.7135129, -0.8372522, 1.856649, 1, 1, 1, 1, 1,
0.7154812, 1.139649, 1.43413, 1, 1, 1, 1, 1,
0.7274847, 0.1894133, 1.278883, 1, 1, 1, 1, 1,
0.728336, -0.5814706, 2.2264, 1, 1, 1, 1, 1,
0.7318214, 3.262665, -0.2592415, 1, 1, 1, 1, 1,
0.738232, -0.1259784, 3.493716, 1, 1, 1, 1, 1,
0.7470516, 0.3620391, 0.006194395, 1, 1, 1, 1, 1,
0.7483768, 1.24643, -0.08598134, 1, 1, 1, 1, 1,
0.7560506, 1.289021, 0.7894576, 1, 1, 1, 1, 1,
0.7575328, -1.682698, 2.695306, 0, 0, 1, 1, 1,
0.75759, -0.345882, 0.7231379, 1, 0, 0, 1, 1,
0.7577565, -0.4687379, 0.6902318, 1, 0, 0, 1, 1,
0.7583061, 1.314462, 0.445944, 1, 0, 0, 1, 1,
0.7597103, 0.9126009, -0.7790733, 1, 0, 0, 1, 1,
0.7642987, -1.974958, 3.656805, 1, 0, 0, 1, 1,
0.7714021, -0.3805275, 2.405965, 0, 0, 0, 1, 1,
0.7859383, -0.3022518, 1.600671, 0, 0, 0, 1, 1,
0.7922401, -0.175097, 0.4513366, 0, 0, 0, 1, 1,
0.7929735, 1.114203, 0.9892132, 0, 0, 0, 1, 1,
0.7936992, -0.8955637, 2.860261, 0, 0, 0, 1, 1,
0.794514, 0.7539789, 1.049817, 0, 0, 0, 1, 1,
0.7960851, -2.532714, 3.221787, 0, 0, 0, 1, 1,
0.8050258, 1.197466, 0.2268438, 1, 1, 1, 1, 1,
0.8064346, 0.5370421, 0.9093782, 1, 1, 1, 1, 1,
0.8069476, 0.9755906, -0.4078267, 1, 1, 1, 1, 1,
0.8079109, 0.3368272, -1.016516, 1, 1, 1, 1, 1,
0.8079565, -0.03914666, 0.9374607, 1, 1, 1, 1, 1,
0.8135509, 1.380572, 3.130216, 1, 1, 1, 1, 1,
0.8144136, 1.478972, 0.5641633, 1, 1, 1, 1, 1,
0.8151846, -0.226373, 1.704554, 1, 1, 1, 1, 1,
0.8187051, -0.6678279, 4.225353, 1, 1, 1, 1, 1,
0.8258243, 0.03882935, 1.657162, 1, 1, 1, 1, 1,
0.8264998, 0.7377101, 1.088871, 1, 1, 1, 1, 1,
0.8283044, 0.8989205, 1.85449, 1, 1, 1, 1, 1,
0.8283784, -1.737592, 4.034277, 1, 1, 1, 1, 1,
0.8310125, -0.07593837, 2.152585, 1, 1, 1, 1, 1,
0.8310861, -2.104006, 1.43153, 1, 1, 1, 1, 1,
0.8331377, -0.1777901, 0.06697445, 0, 0, 1, 1, 1,
0.8349739, -0.2506287, 1.248077, 1, 0, 0, 1, 1,
0.836649, 0.9902712, -0.1781996, 1, 0, 0, 1, 1,
0.8370732, -0.4799275, 1.264155, 1, 0, 0, 1, 1,
0.8409359, 0.5344722, 2.904743, 1, 0, 0, 1, 1,
0.8413607, 1.456274, -2.272209, 1, 0, 0, 1, 1,
0.8417892, -1.347123, 2.777466, 0, 0, 0, 1, 1,
0.8425546, 1.190495, 0.4323827, 0, 0, 0, 1, 1,
0.8428833, -0.7324117, 1.217628, 0, 0, 0, 1, 1,
0.8511844, 2.096389, 0.6693759, 0, 0, 0, 1, 1,
0.855498, -1.769601, 3.873153, 0, 0, 0, 1, 1,
0.8612743, 0.1741017, 1.840973, 0, 0, 0, 1, 1,
0.8637538, 0.5039449, 2.660003, 0, 0, 0, 1, 1,
0.86591, 2.27432, -0.4752488, 1, 1, 1, 1, 1,
0.8671637, -0.6844935, 0.2610076, 1, 1, 1, 1, 1,
0.8739032, -0.06532506, 2.428619, 1, 1, 1, 1, 1,
0.8753564, 0.4093424, 1.173426, 1, 1, 1, 1, 1,
0.8771918, 0.7059104, 1.534814, 1, 1, 1, 1, 1,
0.8774323, 0.7619964, -0.127291, 1, 1, 1, 1, 1,
0.8776749, 0.3021097, 2.185228, 1, 1, 1, 1, 1,
0.8823268, -0.8426123, 4.034021, 1, 1, 1, 1, 1,
0.8873844, -0.9862474, 1.619587, 1, 1, 1, 1, 1,
0.8878829, 0.7631274, 1.43365, 1, 1, 1, 1, 1,
0.890855, -0.4499027, 3.222207, 1, 1, 1, 1, 1,
0.8928891, 2.166319, 0.5671051, 1, 1, 1, 1, 1,
0.8939037, 0.1004272, 2.172726, 1, 1, 1, 1, 1,
0.8968212, 1.185703, -1.154427, 1, 1, 1, 1, 1,
0.9007048, -1.006247, 2.719538, 1, 1, 1, 1, 1,
0.9031988, 0.2967956, 2.322041, 0, 0, 1, 1, 1,
0.9053957, 0.1945942, 0.9771958, 1, 0, 0, 1, 1,
0.9136284, -1.092882, 2.087879, 1, 0, 0, 1, 1,
0.9139391, -1.299783, 2.126117, 1, 0, 0, 1, 1,
0.9216842, 1.06553, 0.3019494, 1, 0, 0, 1, 1,
0.9301579, -0.1529621, 3.522985, 1, 0, 0, 1, 1,
0.9312982, -0.8063422, 4.620374, 0, 0, 0, 1, 1,
0.9390156, -1.379686, 2.166198, 0, 0, 0, 1, 1,
0.9393273, -0.5176507, 2.6429, 0, 0, 0, 1, 1,
0.9411634, 1.74974, -0.1022076, 0, 0, 0, 1, 1,
0.9468901, -0.4570598, 0.2220833, 0, 0, 0, 1, 1,
0.9471752, 0.09453359, -0.09732314, 0, 0, 0, 1, 1,
0.9609284, 0.07284449, 0.2317484, 0, 0, 0, 1, 1,
0.961877, -0.0864821, 2.120139, 1, 1, 1, 1, 1,
0.9730345, 0.9268057, 1.931017, 1, 1, 1, 1, 1,
0.9739624, 1.344092, 1.502697, 1, 1, 1, 1, 1,
0.9746234, 0.2521818, 3.690144, 1, 1, 1, 1, 1,
0.9798241, -0.123367, 1.63296, 1, 1, 1, 1, 1,
0.9839939, 1.948847, 1.510167, 1, 1, 1, 1, 1,
0.9857324, -1.50118, 1.574975, 1, 1, 1, 1, 1,
0.9870811, 2.324116, 0.8191559, 1, 1, 1, 1, 1,
0.9925788, -0.7215047, 0.933194, 1, 1, 1, 1, 1,
1.005428, 0.2491998, 2.459004, 1, 1, 1, 1, 1,
1.009628, 1.220972, 1.183188, 1, 1, 1, 1, 1,
1.011849, 0.3416894, 1.453393, 1, 1, 1, 1, 1,
1.012771, 1.571164, 0.8584669, 1, 1, 1, 1, 1,
1.01499, 0.0790951, 1.487885, 1, 1, 1, 1, 1,
1.015904, 1.299244, 1.672496, 1, 1, 1, 1, 1,
1.022286, -0.8069134, 2.139293, 0, 0, 1, 1, 1,
1.035366, -0.7596347, 2.557819, 1, 0, 0, 1, 1,
1.037187, -0.1548608, 1.433927, 1, 0, 0, 1, 1,
1.03946, 0.8739292, 1.555397, 1, 0, 0, 1, 1,
1.041491, -0.3948506, 1.769382, 1, 0, 0, 1, 1,
1.041811, -1.01463, 1.166051, 1, 0, 0, 1, 1,
1.042381, -0.08009693, 2.16599, 0, 0, 0, 1, 1,
1.044546, 1.178988, 1.009067, 0, 0, 0, 1, 1,
1.045484, -1.245316, 4.559599, 0, 0, 0, 1, 1,
1.048851, 0.03525369, 2.56222, 0, 0, 0, 1, 1,
1.050776, -1.181571, 3.264266, 0, 0, 0, 1, 1,
1.051586, 0.07365729, 2.073036, 0, 0, 0, 1, 1,
1.05414, -1.7731, 3.721764, 0, 0, 0, 1, 1,
1.054657, 2.133314, 1.894862, 1, 1, 1, 1, 1,
1.055222, 0.6632912, 2.420481, 1, 1, 1, 1, 1,
1.057539, 0.9096839, 0.5813173, 1, 1, 1, 1, 1,
1.063268, -0.988248, 1.492543, 1, 1, 1, 1, 1,
1.077403, -0.3772621, 2.765429, 1, 1, 1, 1, 1,
1.091223, -0.9200771, 3.122557, 1, 1, 1, 1, 1,
1.091857, -0.970864, 2.68412, 1, 1, 1, 1, 1,
1.096824, -0.09685572, 3.023337, 1, 1, 1, 1, 1,
1.100677, -0.3154525, 1.57172, 1, 1, 1, 1, 1,
1.105817, 1.569968, 2.104724, 1, 1, 1, 1, 1,
1.110489, 1.190746, 0.4688429, 1, 1, 1, 1, 1,
1.110728, -0.04870792, 1.457811, 1, 1, 1, 1, 1,
1.124861, 0.2246411, 0.554492, 1, 1, 1, 1, 1,
1.127315, -0.5297691, 3.222994, 1, 1, 1, 1, 1,
1.1275, -1.682935, 4.627208, 1, 1, 1, 1, 1,
1.12839, -0.8949947, 3.480943, 0, 0, 1, 1, 1,
1.144166, 0.527326, 1.447147, 1, 0, 0, 1, 1,
1.144944, -0.7700852, 1.179388, 1, 0, 0, 1, 1,
1.149319, -0.05017381, -0.9293185, 1, 0, 0, 1, 1,
1.163866, -0.62186, 2.044912, 1, 0, 0, 1, 1,
1.171971, -0.8894272, 2.896784, 1, 0, 0, 1, 1,
1.183151, 0.415777, 1.477495, 0, 0, 0, 1, 1,
1.195287, 0.9329764, 1.300235, 0, 0, 0, 1, 1,
1.196769, 1.360361, -1.169765, 0, 0, 0, 1, 1,
1.201221, -0.9309495, 4.894732, 0, 0, 0, 1, 1,
1.206677, -0.3289171, 2.487057, 0, 0, 0, 1, 1,
1.208216, -1.11085, 1.132902, 0, 0, 0, 1, 1,
1.211776, -0.7118725, 1.057557, 0, 0, 0, 1, 1,
1.220539, 1.413472, 1.351743, 1, 1, 1, 1, 1,
1.223268, -0.1977358, 0.3977566, 1, 1, 1, 1, 1,
1.238068, -1.339122, 3.206659, 1, 1, 1, 1, 1,
1.240296, -0.6948985, 2.157371, 1, 1, 1, 1, 1,
1.240919, 3.043963, -0.6876001, 1, 1, 1, 1, 1,
1.241012, 0.3584268, 1.330235, 1, 1, 1, 1, 1,
1.246969, 0.2021159, 2.209772, 1, 1, 1, 1, 1,
1.24745, 1.368533, 0.9420316, 1, 1, 1, 1, 1,
1.249356, -0.8087977, 2.43537, 1, 1, 1, 1, 1,
1.249488, -0.1117504, 1.89991, 1, 1, 1, 1, 1,
1.250184, 0.708205, 1.215094, 1, 1, 1, 1, 1,
1.250386, -0.08589253, 2.084096, 1, 1, 1, 1, 1,
1.252056, -0.03385984, 2.89265, 1, 1, 1, 1, 1,
1.254966, -0.01629475, 0.9723678, 1, 1, 1, 1, 1,
1.25793, -1.24993, 1.278702, 1, 1, 1, 1, 1,
1.258254, -0.9496527, 2.319319, 0, 0, 1, 1, 1,
1.261002, -0.8278769, 1.525599, 1, 0, 0, 1, 1,
1.261645, -0.3627079, 2.672062, 1, 0, 0, 1, 1,
1.262477, -0.3221202, 3.191358, 1, 0, 0, 1, 1,
1.264302, -1.184142, 1.507872, 1, 0, 0, 1, 1,
1.266784, -0.6735287, 2.171575, 1, 0, 0, 1, 1,
1.271839, -1.432524, 1.73908, 0, 0, 0, 1, 1,
1.279293, -0.6065587, 1.600226, 0, 0, 0, 1, 1,
1.296296, 0.2342881, 0.5253589, 0, 0, 0, 1, 1,
1.311661, 0.5591097, 0.312438, 0, 0, 0, 1, 1,
1.3159, 0.1799337, -0.3002804, 0, 0, 0, 1, 1,
1.31828, 0.3198024, 4.217782, 0, 0, 0, 1, 1,
1.320402, -0.7814527, 0.7369922, 0, 0, 0, 1, 1,
1.328902, -1.881084, 0.6361315, 1, 1, 1, 1, 1,
1.329303, 0.9294971, 1.132223, 1, 1, 1, 1, 1,
1.34125, -0.9369245, 2.273096, 1, 1, 1, 1, 1,
1.346808, 0.2400673, 2.219668, 1, 1, 1, 1, 1,
1.351273, -0.8995658, 2.843185, 1, 1, 1, 1, 1,
1.353336, 1.034368, 1.739374, 1, 1, 1, 1, 1,
1.366691, 0.3172423, 2.078049, 1, 1, 1, 1, 1,
1.386641, -1.616671, 0.9499313, 1, 1, 1, 1, 1,
1.392741, -0.445416, 0.9464133, 1, 1, 1, 1, 1,
1.431018, 0.7842052, 0.3738157, 1, 1, 1, 1, 1,
1.441137, 0.4265041, 1.01539, 1, 1, 1, 1, 1,
1.454592, 0.2914612, 0.907111, 1, 1, 1, 1, 1,
1.459164, -0.9750898, 2.322052, 1, 1, 1, 1, 1,
1.463642, -0.4914355, 1.902463, 1, 1, 1, 1, 1,
1.464913, -0.4976916, 2.680176, 1, 1, 1, 1, 1,
1.471897, 0.3788057, 0.9300615, 0, 0, 1, 1, 1,
1.480563, 1.398963, 0.1465237, 1, 0, 0, 1, 1,
1.480868, -0.07295775, 2.018462, 1, 0, 0, 1, 1,
1.486355, 1.122825, 1.898859, 1, 0, 0, 1, 1,
1.491575, 1.928444, 0.3972068, 1, 0, 0, 1, 1,
1.50291, 0.9172413, -0.592158, 1, 0, 0, 1, 1,
1.508869, -1.262905, 2.362905, 0, 0, 0, 1, 1,
1.510141, 0.2435456, 2.16672, 0, 0, 0, 1, 1,
1.518772, 0.8175256, 2.240682, 0, 0, 0, 1, 1,
1.519708, -0.011074, 0.100909, 0, 0, 0, 1, 1,
1.530867, 0.5499386, 1.354806, 0, 0, 0, 1, 1,
1.533499, 0.845206, 0.6798977, 0, 0, 0, 1, 1,
1.536647, 0.3283798, 1.192764, 0, 0, 0, 1, 1,
1.549103, 0.8176518, -0.5307576, 1, 1, 1, 1, 1,
1.554573, -0.1775709, 2.910774, 1, 1, 1, 1, 1,
1.565832, 0.6207904, 1.483644, 1, 1, 1, 1, 1,
1.569134, -0.2612014, 1.029081, 1, 1, 1, 1, 1,
1.571826, 0.9384652, 0.7152082, 1, 1, 1, 1, 1,
1.585702, 0.5222561, 1.927415, 1, 1, 1, 1, 1,
1.604665, 0.5334837, 2.038033, 1, 1, 1, 1, 1,
1.617594, 0.1629526, 1.079851, 1, 1, 1, 1, 1,
1.626999, -1.865149, 2.515254, 1, 1, 1, 1, 1,
1.634262, -2.101424, 4.857086, 1, 1, 1, 1, 1,
1.643535, -0.6196814, 1.905986, 1, 1, 1, 1, 1,
1.644406, 0.8442061, 0.2401965, 1, 1, 1, 1, 1,
1.675333, 1.539469, 1.241269, 1, 1, 1, 1, 1,
1.676153, -0.7964109, 2.335284, 1, 1, 1, 1, 1,
1.682667, -1.152581, 2.529343, 1, 1, 1, 1, 1,
1.687437, 0.1075918, 2.780877, 0, 0, 1, 1, 1,
1.694506, -0.2275845, 3.689692, 1, 0, 0, 1, 1,
1.695916, -0.04514277, 2.489362, 1, 0, 0, 1, 1,
1.705796, 0.3114771, 1.533782, 1, 0, 0, 1, 1,
1.717769, 1.110423, 0.4133736, 1, 0, 0, 1, 1,
1.729095, -0.7098496, 1.385415, 1, 0, 0, 1, 1,
1.729389, -0.1974063, 2.554104, 0, 0, 0, 1, 1,
1.750819, -0.6692209, 1.526488, 0, 0, 0, 1, 1,
1.754634, -0.6424875, 1.116446, 0, 0, 0, 1, 1,
1.76527, -0.344149, 0.1740207, 0, 0, 0, 1, 1,
1.769061, 0.8549238, 2.933413, 0, 0, 0, 1, 1,
1.778036, -0.7818475, 2.790282, 0, 0, 0, 1, 1,
1.793152, -0.7150629, 1.093013, 0, 0, 0, 1, 1,
1.794209, -0.6159849, 2.793541, 1, 1, 1, 1, 1,
1.812567, 0.2064837, 1.514983, 1, 1, 1, 1, 1,
1.852588, -1.500008, 3.361421, 1, 1, 1, 1, 1,
1.859018, 1.088893, 0.4267054, 1, 1, 1, 1, 1,
1.871456, 0.4009598, 2.186283, 1, 1, 1, 1, 1,
1.877375, -0.1324976, 1.628016, 1, 1, 1, 1, 1,
1.882467, 1.652235, 1.355038, 1, 1, 1, 1, 1,
1.885856, 1.38645, 1.666721, 1, 1, 1, 1, 1,
1.900092, -1.427818, 3.045763, 1, 1, 1, 1, 1,
1.90946, -0.6551492, 1.663546, 1, 1, 1, 1, 1,
1.936287, 0.5189574, 1.315959, 1, 1, 1, 1, 1,
1.942296, 0.961723, 1.006043, 1, 1, 1, 1, 1,
1.952663, 2.296817, 1.727829, 1, 1, 1, 1, 1,
1.964025, -0.6223545, 3.275261, 1, 1, 1, 1, 1,
1.974917, -2.407547, 1.256216, 1, 1, 1, 1, 1,
1.975374, 0.9210462, 1.209424, 0, 0, 1, 1, 1,
1.982829, 0.6487528, 0.8870448, 1, 0, 0, 1, 1,
1.990064, 0.1075984, 2.708696, 1, 0, 0, 1, 1,
2.046262, 2.637088, 1.685893, 1, 0, 0, 1, 1,
2.048621, -0.2087769, 1.363282, 1, 0, 0, 1, 1,
2.055697, 0.7967578, 1.890707, 1, 0, 0, 1, 1,
2.056369, 1.127598, 0.3705837, 0, 0, 0, 1, 1,
2.0654, -0.4791236, 1.431222, 0, 0, 0, 1, 1,
2.076468, -0.4310134, 1.993711, 0, 0, 0, 1, 1,
2.10441, -1.991341, 3.007813, 0, 0, 0, 1, 1,
2.145393, -0.9295442, 2.433205, 0, 0, 0, 1, 1,
2.162919, 0.3503112, 1.479355, 0, 0, 0, 1, 1,
2.227501, 0.8621159, 2.413326, 0, 0, 0, 1, 1,
2.301713, 0.8294705, 1.694105, 1, 1, 1, 1, 1,
2.326095, 0.6072803, 1.213458, 1, 1, 1, 1, 1,
2.495524, 0.6883005, 0.7680082, 1, 1, 1, 1, 1,
2.614469, 0.1429492, 2.94667, 1, 1, 1, 1, 1,
2.617781, -1.503008, 3.434893, 1, 1, 1, 1, 1,
2.79274, -1.052602, 0.06863111, 1, 1, 1, 1, 1,
2.866477, -0.2447337, 1.988665, 1, 1, 1, 1, 1
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
var radius = 9.370542;
var distance = 32.91363;
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
mvMatrix.translate( 0.08667517, -0.1309619, 0.4194927 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91363);
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
