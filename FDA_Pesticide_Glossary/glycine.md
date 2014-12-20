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
-3.516081, 0.9643253, -2.542324, 1, 0, 0, 1,
-3.010058, -0.1135103, -1.981559, 1, 0.007843138, 0, 1,
-2.996511, 0.5524644, -1.363184, 1, 0.01176471, 0, 1,
-2.984601, -0.2455004, -1.564085, 1, 0.01960784, 0, 1,
-2.809437, -1.122677, -2.436264, 1, 0.02352941, 0, 1,
-2.801944, 0.851074, -0.5443096, 1, 0.03137255, 0, 1,
-2.719476, -0.6140243, -3.177726, 1, 0.03529412, 0, 1,
-2.664326, -0.6828345, -3.210413, 1, 0.04313726, 0, 1,
-2.644084, 0.8857837, -2.006608, 1, 0.04705882, 0, 1,
-2.635816, -1.338405, -2.013421, 1, 0.05490196, 0, 1,
-2.531225, 0.8956223, -2.808924, 1, 0.05882353, 0, 1,
-2.434736, -0.05180248, -3.598841, 1, 0.06666667, 0, 1,
-2.392148, -0.07280237, -1.625616, 1, 0.07058824, 0, 1,
-2.388738, 2.12253, -0.5649651, 1, 0.07843138, 0, 1,
-2.362195, 0.1014992, -1.10437, 1, 0.08235294, 0, 1,
-2.361857, 1.502597, -0.3286127, 1, 0.09019608, 0, 1,
-2.33046, -0.6553487, 0.2708806, 1, 0.09411765, 0, 1,
-2.322853, 0.9128131, -0.591112, 1, 0.1019608, 0, 1,
-2.317306, 0.7509909, -1.536692, 1, 0.1098039, 0, 1,
-2.258761, 2.388085, -1.512338, 1, 0.1137255, 0, 1,
-2.246304, 0.5901769, 0.9358953, 1, 0.1215686, 0, 1,
-2.215234, -0.03190748, -2.00423, 1, 0.1254902, 0, 1,
-2.170877, -2.143393, -2.387125, 1, 0.1333333, 0, 1,
-2.170485, 0.0382042, -0.04531883, 1, 0.1372549, 0, 1,
-2.151234, 0.3929295, -0.2093079, 1, 0.145098, 0, 1,
-2.124128, -0.2000732, -2.740498, 1, 0.1490196, 0, 1,
-2.096136, -0.3433133, -1.309834, 1, 0.1568628, 0, 1,
-2.048823, -2.136386, -2.659716, 1, 0.1607843, 0, 1,
-2.028575, 0.5289187, -2.28147, 1, 0.1686275, 0, 1,
-2.024771, 1.042823, 0.9394686, 1, 0.172549, 0, 1,
-2.022405, -0.5179822, -1.807075, 1, 0.1803922, 0, 1,
-1.989937, -0.9338718, -1.218786, 1, 0.1843137, 0, 1,
-1.973787, -0.8206713, -3.004835, 1, 0.1921569, 0, 1,
-1.971651, 1.19148, -1.982686, 1, 0.1960784, 0, 1,
-1.967297, -0.6489587, -1.341202, 1, 0.2039216, 0, 1,
-1.955073, -0.4813352, -0.4781893, 1, 0.2117647, 0, 1,
-1.945136, -0.4710927, 0.07771613, 1, 0.2156863, 0, 1,
-1.939041, -0.7892365, -3.309649, 1, 0.2235294, 0, 1,
-1.898673, 1.706677, -0.1497039, 1, 0.227451, 0, 1,
-1.898389, 1.103278, 1.164134, 1, 0.2352941, 0, 1,
-1.883387, -0.1379123, -2.447599, 1, 0.2392157, 0, 1,
-1.878146, 0.3763915, -1.366515, 1, 0.2470588, 0, 1,
-1.858947, 0.06772328, -0.7910233, 1, 0.2509804, 0, 1,
-1.854729, 0.7050586, -2.316943, 1, 0.2588235, 0, 1,
-1.847785, -2.151052, -1.947852, 1, 0.2627451, 0, 1,
-1.837423, -1.950153, -2.303981, 1, 0.2705882, 0, 1,
-1.82958, 0.3861036, -2.156983, 1, 0.2745098, 0, 1,
-1.822482, -1.727893, -2.694299, 1, 0.282353, 0, 1,
-1.809116, -0.3345572, -1.878172, 1, 0.2862745, 0, 1,
-1.807323, -0.7552793, -3.608394, 1, 0.2941177, 0, 1,
-1.805123, -1.019264, -1.643154, 1, 0.3019608, 0, 1,
-1.802353, -0.473146, -1.739058, 1, 0.3058824, 0, 1,
-1.793815, 0.6152883, -2.224592, 1, 0.3137255, 0, 1,
-1.771893, 1.319371, -2.740848, 1, 0.3176471, 0, 1,
-1.755705, 0.3815412, -0.6216767, 1, 0.3254902, 0, 1,
-1.736943, -0.3395199, -0.8181036, 1, 0.3294118, 0, 1,
-1.717579, 1.00596, -1.468077, 1, 0.3372549, 0, 1,
-1.714156, -0.9717421, -0.9948943, 1, 0.3411765, 0, 1,
-1.712254, 1.084558, -2.211881, 1, 0.3490196, 0, 1,
-1.711965, -0.2736783, -0.515211, 1, 0.3529412, 0, 1,
-1.688367, 0.8243653, -1.929804, 1, 0.3607843, 0, 1,
-1.680878, 0.9752492, 0.2458427, 1, 0.3647059, 0, 1,
-1.672252, -1.529948, -0.8195462, 1, 0.372549, 0, 1,
-1.668209, 1.790754, 0.02178948, 1, 0.3764706, 0, 1,
-1.653341, 0.2585853, -2.307982, 1, 0.3843137, 0, 1,
-1.643008, 0.9875169, 0.303255, 1, 0.3882353, 0, 1,
-1.636864, 0.08255438, -0.4594044, 1, 0.3960784, 0, 1,
-1.610351, 0.5448235, 0.5331039, 1, 0.4039216, 0, 1,
-1.606782, 0.2620396, -2.537635, 1, 0.4078431, 0, 1,
-1.604345, -0.6566405, -2.431048, 1, 0.4156863, 0, 1,
-1.585614, 0.1058932, -2.05228, 1, 0.4196078, 0, 1,
-1.582203, 0.1905703, -0.471915, 1, 0.427451, 0, 1,
-1.581267, -1.291619, -0.31628, 1, 0.4313726, 0, 1,
-1.564652, -0.6581933, -1.009609, 1, 0.4392157, 0, 1,
-1.563253, 1.089025, 0.2395518, 1, 0.4431373, 0, 1,
-1.560794, 0.4801359, -0.4300806, 1, 0.4509804, 0, 1,
-1.55511, 1.304171, -1.41376, 1, 0.454902, 0, 1,
-1.552558, -0.4002107, 0.09830519, 1, 0.4627451, 0, 1,
-1.548605, -0.7940031, -2.063761, 1, 0.4666667, 0, 1,
-1.539741, -1.296224, -2.527233, 1, 0.4745098, 0, 1,
-1.537395, -0.09590778, -2.384068, 1, 0.4784314, 0, 1,
-1.509001, 0.8692715, -0.1822544, 1, 0.4862745, 0, 1,
-1.490347, 1.077729, -2.083109, 1, 0.4901961, 0, 1,
-1.489001, -0.2728687, -1.621071, 1, 0.4980392, 0, 1,
-1.487797, -2.753171, -3.750055, 1, 0.5058824, 0, 1,
-1.48436, -0.5803979, -2.035614, 1, 0.509804, 0, 1,
-1.482364, 0.3425843, -0.5410509, 1, 0.5176471, 0, 1,
-1.475501, -0.09248773, -1.936601, 1, 0.5215687, 0, 1,
-1.474823, 0.1578078, -2.735318, 1, 0.5294118, 0, 1,
-1.474326, 0.7301549, 0.2013216, 1, 0.5333334, 0, 1,
-1.473567, -0.2825482, -3.314814, 1, 0.5411765, 0, 1,
-1.46662, 0.2563659, 0.6819267, 1, 0.5450981, 0, 1,
-1.454381, 0.4818585, -1.745686, 1, 0.5529412, 0, 1,
-1.447443, -0.7837151, -1.559317, 1, 0.5568628, 0, 1,
-1.444532, -0.1091313, -0.4318294, 1, 0.5647059, 0, 1,
-1.437096, -0.3074302, -2.501464, 1, 0.5686275, 0, 1,
-1.42702, 0.6439059, 0.4091156, 1, 0.5764706, 0, 1,
-1.420112, 1.333901, -1.460686, 1, 0.5803922, 0, 1,
-1.417794, 1.618456, -1.481509, 1, 0.5882353, 0, 1,
-1.394918, -1.577954, -2.115512, 1, 0.5921569, 0, 1,
-1.374238, -0.8421049, -1.985393, 1, 0.6, 0, 1,
-1.363643, -0.7965162, -2.327113, 1, 0.6078432, 0, 1,
-1.363346, 1.428978, -2.277567, 1, 0.6117647, 0, 1,
-1.358619, -1.848554, -1.83566, 1, 0.6196079, 0, 1,
-1.35479, -0.5502324, -2.415645, 1, 0.6235294, 0, 1,
-1.35258, -0.4180084, -3.328467, 1, 0.6313726, 0, 1,
-1.35064, -0.03368406, -2.8654, 1, 0.6352941, 0, 1,
-1.344332, -0.08737297, -1.753085, 1, 0.6431373, 0, 1,
-1.342115, -1.020997, -3.51146, 1, 0.6470588, 0, 1,
-1.341704, -0.7277499, -0.8098361, 1, 0.654902, 0, 1,
-1.33979, 1.24863, -2.482423, 1, 0.6588235, 0, 1,
-1.339438, 1.228728, 0.3806789, 1, 0.6666667, 0, 1,
-1.334323, -1.869138, -3.699892, 1, 0.6705883, 0, 1,
-1.332651, -0.974929, -1.975171, 1, 0.6784314, 0, 1,
-1.329774, 0.7170356, -1.761078, 1, 0.682353, 0, 1,
-1.328086, 0.2819833, -1.534351, 1, 0.6901961, 0, 1,
-1.326123, 0.6078371, -3.277412, 1, 0.6941177, 0, 1,
-1.318972, -0.6962061, -1.871088, 1, 0.7019608, 0, 1,
-1.305297, 0.8596472, -1.41412, 1, 0.7098039, 0, 1,
-1.304348, 1.033979, -0.6220843, 1, 0.7137255, 0, 1,
-1.304012, 0.5454888, -1.816603, 1, 0.7215686, 0, 1,
-1.297336, -2.029862, -2.069027, 1, 0.7254902, 0, 1,
-1.296309, -0.3070084, -2.393688, 1, 0.7333333, 0, 1,
-1.294764, -1.163179, -3.825795, 1, 0.7372549, 0, 1,
-1.294423, -1.120288, -3.19726, 1, 0.7450981, 0, 1,
-1.294171, -0.4470289, -3.725009, 1, 0.7490196, 0, 1,
-1.292079, -0.7561553, -2.929944, 1, 0.7568628, 0, 1,
-1.284078, -0.1415459, -1.635941, 1, 0.7607843, 0, 1,
-1.281887, 0.4203176, -1.831497, 1, 0.7686275, 0, 1,
-1.279408, -0.077502, -1.366357, 1, 0.772549, 0, 1,
-1.273628, 1.322489, 0.5461158, 1, 0.7803922, 0, 1,
-1.270911, -1.053561, -1.064125, 1, 0.7843137, 0, 1,
-1.269206, 0.1385117, 0.8151478, 1, 0.7921569, 0, 1,
-1.268718, 1.218302, -1.248598, 1, 0.7960784, 0, 1,
-1.259437, -0.8601542, -1.809344, 1, 0.8039216, 0, 1,
-1.240851, -1.363399, -1.117293, 1, 0.8117647, 0, 1,
-1.226819, 1.255497, 0.4307093, 1, 0.8156863, 0, 1,
-1.198013, -1.590101, -1.673272, 1, 0.8235294, 0, 1,
-1.19571, -0.2272795, -1.366403, 1, 0.827451, 0, 1,
-1.187075, -0.580516, -3.266646, 1, 0.8352941, 0, 1,
-1.18115, -0.5970469, -2.977687, 1, 0.8392157, 0, 1,
-1.177638, -0.5740036, -3.43068, 1, 0.8470588, 0, 1,
-1.158146, 0.1083312, -1.898888, 1, 0.8509804, 0, 1,
-1.15171, 0.8722403, -0.9253085, 1, 0.8588235, 0, 1,
-1.151336, 1.121014, -0.7906358, 1, 0.8627451, 0, 1,
-1.150347, 1.69847, -1.59072, 1, 0.8705882, 0, 1,
-1.149876, 0.7647358, -1.573702, 1, 0.8745098, 0, 1,
-1.140051, 1.704, 0.7544742, 1, 0.8823529, 0, 1,
-1.139076, -0.6362455, -1.416984, 1, 0.8862745, 0, 1,
-1.138041, -2.089231, -3.086416, 1, 0.8941177, 0, 1,
-1.129522, 0.774421, -0.6300551, 1, 0.8980392, 0, 1,
-1.126269, -1.132234, -0.9356098, 1, 0.9058824, 0, 1,
-1.119386, 0.4291083, -0.4464507, 1, 0.9137255, 0, 1,
-1.115669, -1.102614, -4.153806, 1, 0.9176471, 0, 1,
-1.114246, 1.257413, -0.913369, 1, 0.9254902, 0, 1,
-1.104291, -0.4182647, -0.6772301, 1, 0.9294118, 0, 1,
-1.102088, -0.1158711, -1.868123, 1, 0.9372549, 0, 1,
-1.090546, -0.70183, -2.847055, 1, 0.9411765, 0, 1,
-1.079084, -1.722098, -1.426529, 1, 0.9490196, 0, 1,
-1.074709, -0.8213617, -4.498321, 1, 0.9529412, 0, 1,
-1.061625, 0.1806273, -1.80005, 1, 0.9607843, 0, 1,
-1.059879, 0.5180912, -1.222141, 1, 0.9647059, 0, 1,
-1.051329, 0.3646686, -1.648998, 1, 0.972549, 0, 1,
-1.049182, -0.4735658, -0.5537546, 1, 0.9764706, 0, 1,
-1.049002, -0.5217036, -3.297622, 1, 0.9843137, 0, 1,
-1.04893, 1.078889, -1.630178, 1, 0.9882353, 0, 1,
-1.046313, 1.59377, -0.6539267, 1, 0.9960784, 0, 1,
-1.035666, 0.7937658, -0.344238, 0.9960784, 1, 0, 1,
-1.027458, 1.81936, -0.7050909, 0.9921569, 1, 0, 1,
-1.025986, 0.2777918, 0.127261, 0.9843137, 1, 0, 1,
-1.023307, -0.8390947, -4.07776, 0.9803922, 1, 0, 1,
-1.019916, -0.5411511, -0.3255896, 0.972549, 1, 0, 1,
-1.018237, -0.2690845, -2.806391, 0.9686275, 1, 0, 1,
-1.016926, 1.197736, -1.815577, 0.9607843, 1, 0, 1,
-1.012523, -1.46442, -1.511848, 0.9568627, 1, 0, 1,
-0.9993984, 2.153362, -2.288218, 0.9490196, 1, 0, 1,
-0.997269, -0.4374027, -1.815927, 0.945098, 1, 0, 1,
-0.9893018, 0.5760083, -1.290076, 0.9372549, 1, 0, 1,
-0.9847388, 0.05822491, -1.687992, 0.9333333, 1, 0, 1,
-0.9776884, 0.7162016, -0.5915536, 0.9254902, 1, 0, 1,
-0.9771585, -1.170304, -2.538203, 0.9215686, 1, 0, 1,
-0.975201, 1.088341, -0.5767656, 0.9137255, 1, 0, 1,
-0.9742557, -0.8468659, -3.914821, 0.9098039, 1, 0, 1,
-0.9742047, -0.4850467, -1.071342, 0.9019608, 1, 0, 1,
-0.965592, 0.6829242, -1.466269, 0.8941177, 1, 0, 1,
-0.9650738, -1.43966, -2.146269, 0.8901961, 1, 0, 1,
-0.9631821, 2.201685, 0.8052505, 0.8823529, 1, 0, 1,
-0.9603533, -0.7874332, -0.5528894, 0.8784314, 1, 0, 1,
-0.9506565, 0.01946085, -1.765149, 0.8705882, 1, 0, 1,
-0.9496366, -1.338162, -3.793939, 0.8666667, 1, 0, 1,
-0.9494892, -0.05069274, -0.6908033, 0.8588235, 1, 0, 1,
-0.9477941, 0.2428848, -0.808652, 0.854902, 1, 0, 1,
-0.9429966, 1.232234, -0.5712919, 0.8470588, 1, 0, 1,
-0.9427191, 0.025386, -0.2449445, 0.8431373, 1, 0, 1,
-0.934849, 0.06259536, 0.4010305, 0.8352941, 1, 0, 1,
-0.9331881, -0.1688077, -1.356622, 0.8313726, 1, 0, 1,
-0.9252084, 1.706395, 0.6273379, 0.8235294, 1, 0, 1,
-0.9160001, -0.6187668, -2.113655, 0.8196079, 1, 0, 1,
-0.9154486, 0.9542108, -0.751448, 0.8117647, 1, 0, 1,
-0.9118077, 0.4187109, -1.642948, 0.8078431, 1, 0, 1,
-0.9111058, -0.1944487, -2.620029, 0.8, 1, 0, 1,
-0.9109578, 1.230989, -0.7434164, 0.7921569, 1, 0, 1,
-0.910515, -0.8706863, -1.987948, 0.7882353, 1, 0, 1,
-0.9064913, -0.644506, -1.963393, 0.7803922, 1, 0, 1,
-0.9061487, 1.429408, 0.1386323, 0.7764706, 1, 0, 1,
-0.9005145, 0.9190791, -0.5626507, 0.7686275, 1, 0, 1,
-0.8960442, 0.02680122, -0.6187076, 0.7647059, 1, 0, 1,
-0.8954161, -1.5772, -0.8765097, 0.7568628, 1, 0, 1,
-0.894852, 0.5584254, 0.4275884, 0.7529412, 1, 0, 1,
-0.887582, 1.485744, 0.008473502, 0.7450981, 1, 0, 1,
-0.8843684, 0.3086992, 0.04554037, 0.7411765, 1, 0, 1,
-0.884103, 1.535264, -1.680807, 0.7333333, 1, 0, 1,
-0.8810395, 0.6865121, -1.700175, 0.7294118, 1, 0, 1,
-0.8779849, -0.9953173, -2.432438, 0.7215686, 1, 0, 1,
-0.8761676, 1.175703, -0.1509845, 0.7176471, 1, 0, 1,
-0.8677876, 0.6049687, -1.81058, 0.7098039, 1, 0, 1,
-0.8646876, 0.3009781, -1.434875, 0.7058824, 1, 0, 1,
-0.8507777, -0.8110433, -1.538806, 0.6980392, 1, 0, 1,
-0.8473194, 0.6594163, -3.030064, 0.6901961, 1, 0, 1,
-0.8462416, -1.510319, -3.397617, 0.6862745, 1, 0, 1,
-0.8462303, 1.493318, 0.1466413, 0.6784314, 1, 0, 1,
-0.8421125, -1.242803, -3.693023, 0.6745098, 1, 0, 1,
-0.8398353, -0.88523, -2.601464, 0.6666667, 1, 0, 1,
-0.8315051, -0.9982092, -3.042292, 0.6627451, 1, 0, 1,
-0.8298376, 0.9359953, -1.54011, 0.654902, 1, 0, 1,
-0.8267308, -0.5549797, -1.176141, 0.6509804, 1, 0, 1,
-0.8188452, -0.2045129, 1.120175, 0.6431373, 1, 0, 1,
-0.8167753, 0.4349086, -2.81843, 0.6392157, 1, 0, 1,
-0.8137619, 0.5696284, -1.481536, 0.6313726, 1, 0, 1,
-0.8013862, 1.210598, -2.408318, 0.627451, 1, 0, 1,
-0.7805272, -0.08359544, -2.115421, 0.6196079, 1, 0, 1,
-0.7761293, -1.28894, -3.475462, 0.6156863, 1, 0, 1,
-0.7740296, 0.5217822, -2.035883, 0.6078432, 1, 0, 1,
-0.7733443, 1.986969, -1.710809, 0.6039216, 1, 0, 1,
-0.7733331, -0.5864531, -2.843446, 0.5960785, 1, 0, 1,
-0.7724369, -0.2309137, -3.289433, 0.5882353, 1, 0, 1,
-0.7703716, -0.7032897, -0.7625352, 0.5843138, 1, 0, 1,
-0.7700664, 0.5525432, -1.028931, 0.5764706, 1, 0, 1,
-0.7564983, -0.2593543, -2.242064, 0.572549, 1, 0, 1,
-0.7376351, -0.07715929, -0.2276852, 0.5647059, 1, 0, 1,
-0.736605, -2.405755, -1.434323, 0.5607843, 1, 0, 1,
-0.7343131, 0.6768004, 0.4735822, 0.5529412, 1, 0, 1,
-0.7305859, 1.22968, -1.07707, 0.5490196, 1, 0, 1,
-0.7203977, 0.5009282, -1.52617, 0.5411765, 1, 0, 1,
-0.7181407, -2.128509, -1.475505, 0.5372549, 1, 0, 1,
-0.7174566, -1.165831, -2.335943, 0.5294118, 1, 0, 1,
-0.7113439, -1.0091, -4.23188, 0.5254902, 1, 0, 1,
-0.701856, 0.5449537, -2.080825, 0.5176471, 1, 0, 1,
-0.7000784, -1.00157, -2.62322, 0.5137255, 1, 0, 1,
-0.6962132, -0.6809699, -3.610725, 0.5058824, 1, 0, 1,
-0.6947436, 0.07363014, -1.290056, 0.5019608, 1, 0, 1,
-0.6935642, 0.1361258, -1.060399, 0.4941176, 1, 0, 1,
-0.6854562, -0.1630319, -0.3969487, 0.4862745, 1, 0, 1,
-0.6840188, -1.066296, -1.249607, 0.4823529, 1, 0, 1,
-0.6823086, -0.1932271, -2.853564, 0.4745098, 1, 0, 1,
-0.6792969, -0.7767451, -4.265894, 0.4705882, 1, 0, 1,
-0.6775954, 0.3330664, -1.52185, 0.4627451, 1, 0, 1,
-0.6773388, -0.4468174, -1.277513, 0.4588235, 1, 0, 1,
-0.6748818, -0.7159361, -3.210216, 0.4509804, 1, 0, 1,
-0.6746483, 0.367557, -0.6608287, 0.4470588, 1, 0, 1,
-0.6715796, 1.584554, 0.2682326, 0.4392157, 1, 0, 1,
-0.6694846, -0.9179181, -2.863282, 0.4352941, 1, 0, 1,
-0.6686752, -1.984337, -3.650779, 0.427451, 1, 0, 1,
-0.666779, 1.216329, -0.05181849, 0.4235294, 1, 0, 1,
-0.6649695, 0.7689456, -1.111611, 0.4156863, 1, 0, 1,
-0.6644398, 1.135337, 1.293066, 0.4117647, 1, 0, 1,
-0.6642854, 1.536312, -0.4484962, 0.4039216, 1, 0, 1,
-0.663486, 2.443016, 1.023274, 0.3960784, 1, 0, 1,
-0.660827, -1.472497, -1.269889, 0.3921569, 1, 0, 1,
-0.6604058, -1.47347, -2.710906, 0.3843137, 1, 0, 1,
-0.6599418, -1.418627, -3.953466, 0.3803922, 1, 0, 1,
-0.6578504, 0.2585244, -2.068491, 0.372549, 1, 0, 1,
-0.6564047, 0.6105675, -2.48585, 0.3686275, 1, 0, 1,
-0.6563327, -1.313246, -2.749567, 0.3607843, 1, 0, 1,
-0.6555984, -1.10092, -3.622412, 0.3568628, 1, 0, 1,
-0.6511893, -0.1464512, 0.07217883, 0.3490196, 1, 0, 1,
-0.6491749, -1.860181, -2.449535, 0.345098, 1, 0, 1,
-0.6452416, 2.361129, 0.1215244, 0.3372549, 1, 0, 1,
-0.6443127, 1.037107, -1.987289, 0.3333333, 1, 0, 1,
-0.6428368, -0.4497717, -2.041171, 0.3254902, 1, 0, 1,
-0.6316876, 0.3747987, 0.1657656, 0.3215686, 1, 0, 1,
-0.6262415, -0.01360226, -0.3056397, 0.3137255, 1, 0, 1,
-0.6253647, 0.6553664, -1.682561, 0.3098039, 1, 0, 1,
-0.6168262, 0.7107442, -0.2499666, 0.3019608, 1, 0, 1,
-0.6166626, 0.1420354, -1.386934, 0.2941177, 1, 0, 1,
-0.6136402, -0.05328412, -0.1820047, 0.2901961, 1, 0, 1,
-0.6101911, 1.909803, -0.3449485, 0.282353, 1, 0, 1,
-0.608865, 0.9154298, 0.6960773, 0.2784314, 1, 0, 1,
-0.6084974, 0.6582685, -0.5929357, 0.2705882, 1, 0, 1,
-0.6075425, -0.4859655, -1.477084, 0.2666667, 1, 0, 1,
-0.5942034, -1.291713, -1.753197, 0.2588235, 1, 0, 1,
-0.5908175, -1.163572, -3.158316, 0.254902, 1, 0, 1,
-0.5906015, -0.8129277, -2.355726, 0.2470588, 1, 0, 1,
-0.5895717, -0.6469433, -1.471646, 0.2431373, 1, 0, 1,
-0.5845311, 0.02238812, -2.753061, 0.2352941, 1, 0, 1,
-0.583551, -0.1085222, -0.427466, 0.2313726, 1, 0, 1,
-0.5763552, 0.3135953, -2.31372, 0.2235294, 1, 0, 1,
-0.5755503, 0.6063992, -1.324872, 0.2196078, 1, 0, 1,
-0.5708837, -0.507486, -0.8310677, 0.2117647, 1, 0, 1,
-0.5600327, -0.0790168, -0.7304913, 0.2078431, 1, 0, 1,
-0.5551921, -1.14279, -2.677694, 0.2, 1, 0, 1,
-0.5514591, 0.9125769, 0.7957112, 0.1921569, 1, 0, 1,
-0.5409988, 0.8908327, -1.349455, 0.1882353, 1, 0, 1,
-0.5404191, 2.447178, 0.05665897, 0.1803922, 1, 0, 1,
-0.5383487, -0.8594867, -3.532671, 0.1764706, 1, 0, 1,
-0.5354975, 0.4102518, -0.8023717, 0.1686275, 1, 0, 1,
-0.5308757, 1.340371, -1.427794, 0.1647059, 1, 0, 1,
-0.5276281, -2.22573, -2.620262, 0.1568628, 1, 0, 1,
-0.5267347, 0.4985925, -1.235885, 0.1529412, 1, 0, 1,
-0.5207028, 0.6205251, -1.42602, 0.145098, 1, 0, 1,
-0.5198359, -0.1546127, -0.5751764, 0.1411765, 1, 0, 1,
-0.5174592, 1.937781, -0.5860166, 0.1333333, 1, 0, 1,
-0.5129813, -1.945612, -1.137867, 0.1294118, 1, 0, 1,
-0.508918, -0.09463684, -0.2911762, 0.1215686, 1, 0, 1,
-0.5088535, 1.443379, -1.06167, 0.1176471, 1, 0, 1,
-0.5002419, 0.7177817, 2.134057, 0.1098039, 1, 0, 1,
-0.499482, -1.270204, -4.138766, 0.1058824, 1, 0, 1,
-0.4991698, 0.3557856, -1.878708, 0.09803922, 1, 0, 1,
-0.4987223, -0.937311, -2.093197, 0.09019608, 1, 0, 1,
-0.4908851, 1.301668, -0.4329019, 0.08627451, 1, 0, 1,
-0.4898358, -0.3203828, -2.568518, 0.07843138, 1, 0, 1,
-0.4873537, 1.946977, -1.995494, 0.07450981, 1, 0, 1,
-0.4872512, -1.291055, -0.8519964, 0.06666667, 1, 0, 1,
-0.4861358, 0.987469, -1.012877, 0.0627451, 1, 0, 1,
-0.4838484, 0.3619647, -0.6520692, 0.05490196, 1, 0, 1,
-0.4810472, 1.912008, 1.220055, 0.05098039, 1, 0, 1,
-0.4774563, -0.06121108, -1.074757, 0.04313726, 1, 0, 1,
-0.4773171, 0.161981, -2.215409, 0.03921569, 1, 0, 1,
-0.4758352, 0.3591412, -2.700837, 0.03137255, 1, 0, 1,
-0.4751609, -0.7815219, -3.832536, 0.02745098, 1, 0, 1,
-0.4747566, 0.3374177, -0.5816252, 0.01960784, 1, 0, 1,
-0.4693943, -0.85084, -1.915278, 0.01568628, 1, 0, 1,
-0.4685317, 1.749815, -0.06426851, 0.007843138, 1, 0, 1,
-0.461689, 1.290056, -0.8827504, 0.003921569, 1, 0, 1,
-0.4609954, -0.8097045, -2.621859, 0, 1, 0.003921569, 1,
-0.4599112, 0.8828031, 0.3389199, 0, 1, 0.01176471, 1,
-0.4557427, -1.852462, -2.50274, 0, 1, 0.01568628, 1,
-0.4483756, -0.3131391, -1.354788, 0, 1, 0.02352941, 1,
-0.4472764, -0.8737338, -4.572981, 0, 1, 0.02745098, 1,
-0.4454892, -0.1209958, -1.024691, 0, 1, 0.03529412, 1,
-0.4449876, -1.678464, -3.8266, 0, 1, 0.03921569, 1,
-0.4425952, 1.439058, -0.657168, 0, 1, 0.04705882, 1,
-0.4325835, -1.620461, -3.528614, 0, 1, 0.05098039, 1,
-0.4266411, -0.22133, -3.702632, 0, 1, 0.05882353, 1,
-0.4263236, -1.251954, -4.228596, 0, 1, 0.0627451, 1,
-0.423655, 2.100246, -1.8038, 0, 1, 0.07058824, 1,
-0.4145267, 0.5036121, -2.106222, 0, 1, 0.07450981, 1,
-0.4144836, 0.6139039, -1.960463, 0, 1, 0.08235294, 1,
-0.4102145, -0.08719552, -2.365442, 0, 1, 0.08627451, 1,
-0.4095416, -1.991396, -2.951756, 0, 1, 0.09411765, 1,
-0.407477, 0.6743063, 1.216276, 0, 1, 0.1019608, 1,
-0.4030981, -0.9016305, -1.486059, 0, 1, 0.1058824, 1,
-0.3974186, 1.353738, -0.3319764, 0, 1, 0.1137255, 1,
-0.3963377, 0.5811483, -1.830165, 0, 1, 0.1176471, 1,
-0.3919673, -0.9800487, -4.083411, 0, 1, 0.1254902, 1,
-0.391031, 0.5887254, -0.347497, 0, 1, 0.1294118, 1,
-0.3898619, 0.3248322, -0.97607, 0, 1, 0.1372549, 1,
-0.3885078, 0.8045673, -1.261482, 0, 1, 0.1411765, 1,
-0.3855549, -0.4709263, -2.942899, 0, 1, 0.1490196, 1,
-0.3842987, 0.1311313, -0.7559435, 0, 1, 0.1529412, 1,
-0.3824867, -0.4939916, -3.645002, 0, 1, 0.1607843, 1,
-0.3823438, -0.4593334, -1.826894, 0, 1, 0.1647059, 1,
-0.3775237, 0.9418851, -0.4123516, 0, 1, 0.172549, 1,
-0.374646, -0.502383, -1.697799, 0, 1, 0.1764706, 1,
-0.3737254, 0.3875226, 0.09561118, 0, 1, 0.1843137, 1,
-0.3701203, -0.01494251, -3.023736, 0, 1, 0.1882353, 1,
-0.3686601, 0.8093446, -0.151366, 0, 1, 0.1960784, 1,
-0.366533, 1.357289, -1.486319, 0, 1, 0.2039216, 1,
-0.3643439, 0.02776484, -1.909156, 0, 1, 0.2078431, 1,
-0.3588652, 0.8120658, -0.7676949, 0, 1, 0.2156863, 1,
-0.358847, -0.5401176, -1.580233, 0, 1, 0.2196078, 1,
-0.3586681, 0.3702688, 1.467706, 0, 1, 0.227451, 1,
-0.3573844, 0.5300686, -0.6779395, 0, 1, 0.2313726, 1,
-0.3547779, 0.9599912, 0.3060286, 0, 1, 0.2392157, 1,
-0.3505373, -1.238626, -3.745385, 0, 1, 0.2431373, 1,
-0.3486987, -0.6441474, -2.58409, 0, 1, 0.2509804, 1,
-0.3478625, -0.8740159, -2.357713, 0, 1, 0.254902, 1,
-0.3413206, 0.3293379, -1.096087, 0, 1, 0.2627451, 1,
-0.3384184, -2.191954, -2.615856, 0, 1, 0.2666667, 1,
-0.3317438, -1.641932, -3.148532, 0, 1, 0.2745098, 1,
-0.3296834, -1.325237, -4.131712, 0, 1, 0.2784314, 1,
-0.3230263, 0.3015523, -1.209166, 0, 1, 0.2862745, 1,
-0.3210343, 1.731626, -0.8478833, 0, 1, 0.2901961, 1,
-0.3205967, 0.7016122, -1.897366, 0, 1, 0.2980392, 1,
-0.3189257, -0.597622, -3.855147, 0, 1, 0.3058824, 1,
-0.3182467, 1.975343, 1.25348, 0, 1, 0.3098039, 1,
-0.3151657, -0.09522696, -2.326108, 0, 1, 0.3176471, 1,
-0.3148141, 1.372378, -0.115846, 0, 1, 0.3215686, 1,
-0.3129201, -0.0720969, -1.346164, 0, 1, 0.3294118, 1,
-0.3122478, 1.161559, -2.139835, 0, 1, 0.3333333, 1,
-0.3101918, 0.5041023, -2.316895, 0, 1, 0.3411765, 1,
-0.3091765, 0.4452463, -1.433752, 0, 1, 0.345098, 1,
-0.3091041, -1.231434, -3.192909, 0, 1, 0.3529412, 1,
-0.3083748, 1.485815, -0.450315, 0, 1, 0.3568628, 1,
-0.3059264, -1.063474, -1.967424, 0, 1, 0.3647059, 1,
-0.2963828, 0.3292529, 0.9078587, 0, 1, 0.3686275, 1,
-0.2879409, 0.8167794, -0.404516, 0, 1, 0.3764706, 1,
-0.2848671, -0.07309452, -2.818073, 0, 1, 0.3803922, 1,
-0.2758122, -0.9918325, -4.066619, 0, 1, 0.3882353, 1,
-0.2755049, -0.1558176, -2.99315, 0, 1, 0.3921569, 1,
-0.2736689, -0.9484273, -1.560466, 0, 1, 0.4, 1,
-0.2720335, 1.216007, -0.4832576, 0, 1, 0.4078431, 1,
-0.2702958, -0.4063283, -2.913985, 0, 1, 0.4117647, 1,
-0.2679538, -0.58868, -5.201924, 0, 1, 0.4196078, 1,
-0.2639098, 0.2416804, 0.4195814, 0, 1, 0.4235294, 1,
-0.263634, 1.411644, 0.06324431, 0, 1, 0.4313726, 1,
-0.2635577, -0.9659252, -1.808586, 0, 1, 0.4352941, 1,
-0.2603652, -1.77417, -4.697062, 0, 1, 0.4431373, 1,
-0.2585314, 1.733321, -1.41181, 0, 1, 0.4470588, 1,
-0.2577257, 0.7419821, 0.4124297, 0, 1, 0.454902, 1,
-0.2557984, 0.02068714, -0.1847651, 0, 1, 0.4588235, 1,
-0.254789, -1.935065, -1.8376, 0, 1, 0.4666667, 1,
-0.2533683, 1.656879, 1.507026, 0, 1, 0.4705882, 1,
-0.2451051, -1.30135, -1.511179, 0, 1, 0.4784314, 1,
-0.2428799, -0.03426949, -1.15474, 0, 1, 0.4823529, 1,
-0.2345913, -0.199009, -4.091731, 0, 1, 0.4901961, 1,
-0.2344391, 0.5964733, -1.435475, 0, 1, 0.4941176, 1,
-0.2306267, -1.070092, -3.523482, 0, 1, 0.5019608, 1,
-0.2289292, 0.6319199, 1.77582, 0, 1, 0.509804, 1,
-0.2281779, -0.2778639, -3.894991, 0, 1, 0.5137255, 1,
-0.2172626, 0.9496496, 0.08939825, 0, 1, 0.5215687, 1,
-0.2167536, -0.7445996, -3.460481, 0, 1, 0.5254902, 1,
-0.2167134, 1.758485, -1.952041, 0, 1, 0.5333334, 1,
-0.2157123, 0.8201868, -0.3975753, 0, 1, 0.5372549, 1,
-0.2144451, -0.3745425, -2.533084, 0, 1, 0.5450981, 1,
-0.2136595, 0.6031979, 0.1370824, 0, 1, 0.5490196, 1,
-0.2101968, 1.617745, 0.3785383, 0, 1, 0.5568628, 1,
-0.209872, -0.0006270701, -1.712753, 0, 1, 0.5607843, 1,
-0.2095303, -0.06695594, -1.618793, 0, 1, 0.5686275, 1,
-0.2063849, -0.5380305, -2.944225, 0, 1, 0.572549, 1,
-0.2051467, -0.0626621, -0.8062568, 0, 1, 0.5803922, 1,
-0.2011639, -1.370841, -4.034597, 0, 1, 0.5843138, 1,
-0.1973549, -0.3864239, -2.677407, 0, 1, 0.5921569, 1,
-0.1972105, 0.705393, -1.029739, 0, 1, 0.5960785, 1,
-0.1965076, 2.005149, -1.72597, 0, 1, 0.6039216, 1,
-0.1917778, 0.2084237, -2.741106, 0, 1, 0.6117647, 1,
-0.1903935, 1.633544, 1.135015, 0, 1, 0.6156863, 1,
-0.1896383, -0.4026982, -2.334145, 0, 1, 0.6235294, 1,
-0.1838882, -0.4740455, -2.955715, 0, 1, 0.627451, 1,
-0.1826898, 1.003203, -1.536061, 0, 1, 0.6352941, 1,
-0.181509, -0.09732017, -0.1544206, 0, 1, 0.6392157, 1,
-0.1768995, 0.3577487, -0.7326619, 0, 1, 0.6470588, 1,
-0.1735178, -0.2078245, -2.481585, 0, 1, 0.6509804, 1,
-0.1659829, -1.413092, -2.853853, 0, 1, 0.6588235, 1,
-0.1655515, -1.841632, -1.631414, 0, 1, 0.6627451, 1,
-0.1612922, 0.4982427, -1.324694, 0, 1, 0.6705883, 1,
-0.1596458, -0.4328928, -4.064064, 0, 1, 0.6745098, 1,
-0.1508447, -0.2236065, -3.113272, 0, 1, 0.682353, 1,
-0.1487439, -0.6014434, -1.973577, 0, 1, 0.6862745, 1,
-0.1480319, -1.131358, -3.144525, 0, 1, 0.6941177, 1,
-0.1460308, -1.001351, -1.949559, 0, 1, 0.7019608, 1,
-0.144871, -0.4083931, -3.412118, 0, 1, 0.7058824, 1,
-0.1408512, -0.7684396, -1.153553, 0, 1, 0.7137255, 1,
-0.1354679, -0.4918249, -3.078316, 0, 1, 0.7176471, 1,
-0.1353637, -0.9399121, -4.295672, 0, 1, 0.7254902, 1,
-0.1346011, -1.151518, -3.733201, 0, 1, 0.7294118, 1,
-0.1309189, 2.074657, 0.5495602, 0, 1, 0.7372549, 1,
-0.1301613, -1.646404, -2.815612, 0, 1, 0.7411765, 1,
-0.1293262, 1.286247, 0.3162469, 0, 1, 0.7490196, 1,
-0.1282966, 0.8032976, 0.7641014, 0, 1, 0.7529412, 1,
-0.1236992, -1.919716, -3.674008, 0, 1, 0.7607843, 1,
-0.1220792, 1.31809, 2.236389, 0, 1, 0.7647059, 1,
-0.1186439, 0.7465693, 0.04933282, 0, 1, 0.772549, 1,
-0.115381, -0.4365832, -0.7544357, 0, 1, 0.7764706, 1,
-0.1130455, -1.753968, -4.532672, 0, 1, 0.7843137, 1,
-0.1107345, 0.981406, 0.3655101, 0, 1, 0.7882353, 1,
-0.1100402, -0.8834332, -3.559828, 0, 1, 0.7960784, 1,
-0.109286, -0.3606837, -2.241155, 0, 1, 0.8039216, 1,
-0.1078378, -0.2464401, -2.652473, 0, 1, 0.8078431, 1,
-0.1068157, -0.5589929, -3.132976, 0, 1, 0.8156863, 1,
-0.08802763, -0.4347745, -3.918744, 0, 1, 0.8196079, 1,
-0.07903033, 0.9357668, -0.2974741, 0, 1, 0.827451, 1,
-0.0784776, -0.226116, -0.6960452, 0, 1, 0.8313726, 1,
-0.07234219, -1.026974, -1.964148, 0, 1, 0.8392157, 1,
-0.07200406, -0.369984, -5.345809, 0, 1, 0.8431373, 1,
-0.06748441, -1.745324, -4.202775, 0, 1, 0.8509804, 1,
-0.06662969, 0.2576583, -0.7959017, 0, 1, 0.854902, 1,
-0.06560899, -1.683759, -1.142996, 0, 1, 0.8627451, 1,
-0.06174004, -0.7099817, -4.717771, 0, 1, 0.8666667, 1,
-0.06077559, 0.702638, -1.997529, 0, 1, 0.8745098, 1,
-0.05753868, 0.1866783, -1.266135, 0, 1, 0.8784314, 1,
-0.05436747, -0.5753028, -6.124156, 0, 1, 0.8862745, 1,
-0.04625405, -0.4012121, -2.222245, 0, 1, 0.8901961, 1,
-0.04257932, 0.252435, -0.9399024, 0, 1, 0.8980392, 1,
-0.04096918, -0.2789122, -3.388145, 0, 1, 0.9058824, 1,
-0.03906894, 0.548668, 0.4154907, 0, 1, 0.9098039, 1,
-0.03694275, 0.8508151, -1.124265, 0, 1, 0.9176471, 1,
-0.03575372, -1.53575, -2.922022, 0, 1, 0.9215686, 1,
-0.03510765, -0.3684014, -3.816371, 0, 1, 0.9294118, 1,
-0.03469646, -1.283319, -3.414215, 0, 1, 0.9333333, 1,
-0.0342562, -0.1386731, -3.694107, 0, 1, 0.9411765, 1,
-0.03090947, 0.5250613, -1.052468, 0, 1, 0.945098, 1,
-0.03012011, -0.9014696, -2.789108, 0, 1, 0.9529412, 1,
-0.02629619, 1.193798, -0.9762933, 0, 1, 0.9568627, 1,
-0.02542504, 1.208278, -1.108197, 0, 1, 0.9647059, 1,
-0.02456776, 0.6828339, 1.063835, 0, 1, 0.9686275, 1,
-0.01779935, 0.5989951, -0.1082503, 0, 1, 0.9764706, 1,
-0.01685125, -0.1763045, -1.148006, 0, 1, 0.9803922, 1,
-0.01484779, 0.233331, 0.1242525, 0, 1, 0.9882353, 1,
-0.01301358, 1.168578, 0.8440638, 0, 1, 0.9921569, 1,
-0.01280656, -0.09696304, -1.125212, 0, 1, 1, 1,
-0.01256043, -1.074974, -3.101757, 0, 0.9921569, 1, 1,
-0.009738047, -0.9125366, -2.92601, 0, 0.9882353, 1, 1,
-0.008521445, -1.35015, -2.871039, 0, 0.9803922, 1, 1,
-0.00647948, -1.888606, -3.311324, 0, 0.9764706, 1, 1,
-0.005125006, -1.14226, -3.071317, 0, 0.9686275, 1, 1,
-0.005118337, -1.471061, -2.006075, 0, 0.9647059, 1, 1,
-0.001507894, -2.33475, -1.355174, 0, 0.9568627, 1, 1,
0.0002173455, 0.311929, 0.3451133, 0, 0.9529412, 1, 1,
0.002072684, -0.9566805, 2.982282, 0, 0.945098, 1, 1,
0.007419467, 0.559082, 0.1134397, 0, 0.9411765, 1, 1,
0.008548368, -0.1118522, 3.431677, 0, 0.9333333, 1, 1,
0.01276895, 0.1896534, 0.1223141, 0, 0.9294118, 1, 1,
0.01852126, 0.8404395, 0.6274623, 0, 0.9215686, 1, 1,
0.02115645, -1.226981, 3.142034, 0, 0.9176471, 1, 1,
0.02153957, -1.496737, 5.227759, 0, 0.9098039, 1, 1,
0.02266173, 0.4137968, 0.2940511, 0, 0.9058824, 1, 1,
0.02379756, 0.670814, -0.1317465, 0, 0.8980392, 1, 1,
0.02402608, 0.005559195, 0.3356842, 0, 0.8901961, 1, 1,
0.0273269, 0.4746884, 1.065274, 0, 0.8862745, 1, 1,
0.02835608, -0.1479647, 4.606414, 0, 0.8784314, 1, 1,
0.03403468, 1.110285, 1.36772, 0, 0.8745098, 1, 1,
0.03456384, 0.564194, 0.2850967, 0, 0.8666667, 1, 1,
0.03488869, 0.8315396, 0.8388, 0, 0.8627451, 1, 1,
0.03909923, 1.195369, -0.8881816, 0, 0.854902, 1, 1,
0.04070288, -0.5058052, 2.441535, 0, 0.8509804, 1, 1,
0.04260337, -1.478959, 3.013154, 0, 0.8431373, 1, 1,
0.04507021, -1.110772, 3.151424, 0, 0.8392157, 1, 1,
0.04639138, -0.7787586, 1.093094, 0, 0.8313726, 1, 1,
0.05087381, 0.9016614, 0.3926347, 0, 0.827451, 1, 1,
0.05199539, -0.8044496, 2.85911, 0, 0.8196079, 1, 1,
0.05363571, -0.9129953, 3.150893, 0, 0.8156863, 1, 1,
0.05380417, -0.4760674, 3.008689, 0, 0.8078431, 1, 1,
0.06392229, 0.3906232, 0.5544931, 0, 0.8039216, 1, 1,
0.07311567, -1.520756, 4.526586, 0, 0.7960784, 1, 1,
0.07582581, -0.5789257, 3.891641, 0, 0.7882353, 1, 1,
0.076148, -0.6302773, 3.730628, 0, 0.7843137, 1, 1,
0.07863863, 0.4212947, 0.2828481, 0, 0.7764706, 1, 1,
0.08025305, -0.2984214, 2.924839, 0, 0.772549, 1, 1,
0.08266936, 0.3581214, -0.2926141, 0, 0.7647059, 1, 1,
0.08753937, -1.657708, 3.501476, 0, 0.7607843, 1, 1,
0.09410322, 1.404831, 1.31512, 0, 0.7529412, 1, 1,
0.09542812, -0.9325986, 2.289713, 0, 0.7490196, 1, 1,
0.09712713, -1.240473, 4.848662, 0, 0.7411765, 1, 1,
0.09970674, -0.3776552, 2.12751, 0, 0.7372549, 1, 1,
0.1003539, -0.1248879, 2.096452, 0, 0.7294118, 1, 1,
0.1003706, 0.8773025, 0.423764, 0, 0.7254902, 1, 1,
0.100584, -0.911285, 2.790402, 0, 0.7176471, 1, 1,
0.1036024, -0.809742, 2.455342, 0, 0.7137255, 1, 1,
0.106955, 0.7856493, 0.5084822, 0, 0.7058824, 1, 1,
0.1077532, -0.0324173, 0.6795816, 0, 0.6980392, 1, 1,
0.1105517, -1.955396, 4.989039, 0, 0.6941177, 1, 1,
0.1110206, -0.5191696, 1.679327, 0, 0.6862745, 1, 1,
0.1143711, 0.1159855, 0.8884159, 0, 0.682353, 1, 1,
0.1175678, 0.1279155, 0.5188218, 0, 0.6745098, 1, 1,
0.1234845, 0.2903791, 0.3161758, 0, 0.6705883, 1, 1,
0.1264031, 0.2928711, 0.27551, 0, 0.6627451, 1, 1,
0.1273389, -0.6898462, 2.932876, 0, 0.6588235, 1, 1,
0.1275311, -0.1767789, 0.5807261, 0, 0.6509804, 1, 1,
0.1311537, 2.215967, -2.038774, 0, 0.6470588, 1, 1,
0.1320608, 0.2450142, 0.6842307, 0, 0.6392157, 1, 1,
0.132726, 0.9872196, -0.1657968, 0, 0.6352941, 1, 1,
0.1423679, -0.2035796, 1.583627, 0, 0.627451, 1, 1,
0.1428479, -0.7191994, 1.122474, 0, 0.6235294, 1, 1,
0.1485565, -2.398108, 2.261535, 0, 0.6156863, 1, 1,
0.1492437, -0.6385906, 2.184797, 0, 0.6117647, 1, 1,
0.1498961, 1.020143, 0.2962924, 0, 0.6039216, 1, 1,
0.1512282, 0.8727973, 0.2997126, 0, 0.5960785, 1, 1,
0.1544853, 0.5782401, -0.9744646, 0, 0.5921569, 1, 1,
0.1566767, 1.4059, 1.190921, 0, 0.5843138, 1, 1,
0.1620787, 0.9743007, 0.8487335, 0, 0.5803922, 1, 1,
0.1644546, -0.8775741, 3.527895, 0, 0.572549, 1, 1,
0.1661465, 0.8044202, 0.8917491, 0, 0.5686275, 1, 1,
0.1670722, 0.1631699, 0.934147, 0, 0.5607843, 1, 1,
0.1673789, 0.3510308, -0.3265806, 0, 0.5568628, 1, 1,
0.1706905, -0.5451818, 2.561533, 0, 0.5490196, 1, 1,
0.1711753, -0.6040386, 2.807568, 0, 0.5450981, 1, 1,
0.1815305, -0.7609966, 2.289371, 0, 0.5372549, 1, 1,
0.1840121, -0.1568746, 2.724641, 0, 0.5333334, 1, 1,
0.1887509, 0.5332761, -0.4111615, 0, 0.5254902, 1, 1,
0.191169, -1.26845, 3.155153, 0, 0.5215687, 1, 1,
0.1952682, 1.380514, -0.976731, 0, 0.5137255, 1, 1,
0.1971178, -0.5084115, 2.151475, 0, 0.509804, 1, 1,
0.1993281, -0.4726707, 2.985667, 0, 0.5019608, 1, 1,
0.2064041, 0.2218756, 0.3276757, 0, 0.4941176, 1, 1,
0.2135404, 0.6347842, -0.4966247, 0, 0.4901961, 1, 1,
0.2188085, -0.4227603, 2.11167, 0, 0.4823529, 1, 1,
0.2216381, -0.1954394, 2.806223, 0, 0.4784314, 1, 1,
0.2238166, 0.5117489, 0.7364216, 0, 0.4705882, 1, 1,
0.2279031, -0.4457284, 1.434719, 0, 0.4666667, 1, 1,
0.2301954, 0.3259689, 2.725596, 0, 0.4588235, 1, 1,
0.2315616, 2.654431, -1.593101, 0, 0.454902, 1, 1,
0.2331609, -0.8699948, 2.438739, 0, 0.4470588, 1, 1,
0.2333026, 0.2753229, 1.579948, 0, 0.4431373, 1, 1,
0.2336689, 0.7077086, 0.07958369, 0, 0.4352941, 1, 1,
0.2372899, 0.1733589, 1.41353, 0, 0.4313726, 1, 1,
0.2374442, -0.1304851, 3.200763, 0, 0.4235294, 1, 1,
0.2383223, 0.8273579, -0.123606, 0, 0.4196078, 1, 1,
0.2422885, -0.01831567, 1.040516, 0, 0.4117647, 1, 1,
0.2458676, -1.043973, 2.938108, 0, 0.4078431, 1, 1,
0.2461936, 0.04197623, 0.9913403, 0, 0.4, 1, 1,
0.2493019, -1.130563, 2.551053, 0, 0.3921569, 1, 1,
0.2512675, -1.30695, 3.793128, 0, 0.3882353, 1, 1,
0.2538455, -0.06377879, 1.486811, 0, 0.3803922, 1, 1,
0.2594512, -0.3393387, 2.32184, 0, 0.3764706, 1, 1,
0.2645979, 0.03882642, 1.730506, 0, 0.3686275, 1, 1,
0.2668018, 2.731092, -0.4722901, 0, 0.3647059, 1, 1,
0.2697946, -0.7893327, 3.233093, 0, 0.3568628, 1, 1,
0.2715908, 1.299627, 1.181112, 0, 0.3529412, 1, 1,
0.2748413, 1.334442, 0.8199716, 0, 0.345098, 1, 1,
0.2755417, -0.9405037, 1.878582, 0, 0.3411765, 1, 1,
0.2780302, -1.558067, 5.438906, 0, 0.3333333, 1, 1,
0.2811963, -0.04520894, 1.940978, 0, 0.3294118, 1, 1,
0.2834564, 0.3446163, 0.3171381, 0, 0.3215686, 1, 1,
0.2855301, 1.212666, 0.1145145, 0, 0.3176471, 1, 1,
0.2876562, 0.6556345, -0.1119327, 0, 0.3098039, 1, 1,
0.2878675, -0.8915349, 0.3299748, 0, 0.3058824, 1, 1,
0.2913865, -0.9347254, 3.177012, 0, 0.2980392, 1, 1,
0.2943445, 0.3555913, 2.504322, 0, 0.2901961, 1, 1,
0.2957982, -1.130054, 3.661773, 0, 0.2862745, 1, 1,
0.2971128, -0.00663669, 1.964272, 0, 0.2784314, 1, 1,
0.2997202, 0.9103104, 1.375305, 0, 0.2745098, 1, 1,
0.3013325, 0.8278991, 1.662439, 0, 0.2666667, 1, 1,
0.3043238, 0.8223958, -0.2308852, 0, 0.2627451, 1, 1,
0.3081563, -1.407629, 3.55953, 0, 0.254902, 1, 1,
0.3114541, -0.3585793, 1.257155, 0, 0.2509804, 1, 1,
0.3147358, 0.01222, 1.603115, 0, 0.2431373, 1, 1,
0.3151315, -0.1286857, 2.719744, 0, 0.2392157, 1, 1,
0.3175678, 0.8943112, 0.8005728, 0, 0.2313726, 1, 1,
0.325377, 2.170714, -0.09711406, 0, 0.227451, 1, 1,
0.325473, -0.858774, 3.59211, 0, 0.2196078, 1, 1,
0.3254761, 0.2813484, 1.233457, 0, 0.2156863, 1, 1,
0.3265216, -0.713375, 3.284109, 0, 0.2078431, 1, 1,
0.3298974, -0.6011183, 3.398401, 0, 0.2039216, 1, 1,
0.3313656, -1.736421, 4.48004, 0, 0.1960784, 1, 1,
0.3362837, 0.690708, -0.2922773, 0, 0.1882353, 1, 1,
0.3402373, -1.034085, 2.020257, 0, 0.1843137, 1, 1,
0.3472977, 0.986852, 1.402647, 0, 0.1764706, 1, 1,
0.3487032, -1.029081, 1.793515, 0, 0.172549, 1, 1,
0.3538624, -1.542161, 1.814676, 0, 0.1647059, 1, 1,
0.3583742, -0.6050578, 2.027706, 0, 0.1607843, 1, 1,
0.3655293, -0.8152581, 3.188517, 0, 0.1529412, 1, 1,
0.3660232, -0.9298615, 2.846637, 0, 0.1490196, 1, 1,
0.3662342, 0.9957113, -0.4208414, 0, 0.1411765, 1, 1,
0.3718455, 0.01689798, 1.865564, 0, 0.1372549, 1, 1,
0.3737376, -0.8525333, 2.493551, 0, 0.1294118, 1, 1,
0.3889349, 0.6800559, 0.4349078, 0, 0.1254902, 1, 1,
0.3901581, -0.3876793, 1.434956, 0, 0.1176471, 1, 1,
0.3904437, 0.2924697, 2.07203, 0, 0.1137255, 1, 1,
0.3905464, 1.290464, 0.5961705, 0, 0.1058824, 1, 1,
0.3933373, 1.055133, -1.378015, 0, 0.09803922, 1, 1,
0.3944978, 0.4493951, 1.969855, 0, 0.09411765, 1, 1,
0.395102, -0.3985276, 2.673213, 0, 0.08627451, 1, 1,
0.3951946, 0.4838194, 1.652968, 0, 0.08235294, 1, 1,
0.4085844, -0.05919649, 2.114191, 0, 0.07450981, 1, 1,
0.4106637, 0.6937858, -1.227217, 0, 0.07058824, 1, 1,
0.411545, 1.17897, 0.3275262, 0, 0.0627451, 1, 1,
0.4146982, -0.04100994, 2.201419, 0, 0.05882353, 1, 1,
0.4203833, -0.82372, 1.777928, 0, 0.05098039, 1, 1,
0.4208311, -1.625375, 2.560472, 0, 0.04705882, 1, 1,
0.4371828, -0.4960985, 1.945987, 0, 0.03921569, 1, 1,
0.4396203, -1.478666, 3.819475, 0, 0.03529412, 1, 1,
0.4400734, 0.5408213, 0.6705493, 0, 0.02745098, 1, 1,
0.4430257, -0.7052991, 2.170076, 0, 0.02352941, 1, 1,
0.4479461, -0.1213825, 2.891724, 0, 0.01568628, 1, 1,
0.4483604, 1.258706, 2.243792, 0, 0.01176471, 1, 1,
0.4500608, -0.9158053, 4.954831, 0, 0.003921569, 1, 1,
0.4526567, 0.07979986, 1.027746, 0.003921569, 0, 1, 1,
0.4556758, 0.7777995, 3.3946, 0.007843138, 0, 1, 1,
0.4565221, -0.8968521, 2.91304, 0.01568628, 0, 1, 1,
0.457866, 0.2992418, 0.9480174, 0.01960784, 0, 1, 1,
0.4597427, 0.4161994, 0.7875291, 0.02745098, 0, 1, 1,
0.4630799, -0.2593754, 0.8352433, 0.03137255, 0, 1, 1,
0.4658388, -0.4494698, 3.687167, 0.03921569, 0, 1, 1,
0.4720999, 1.610909, 0.58039, 0.04313726, 0, 1, 1,
0.4753177, 0.9866433, -0.03249973, 0.05098039, 0, 1, 1,
0.4764229, -0.6879019, 2.128287, 0.05490196, 0, 1, 1,
0.4777179, 0.1599428, 1.732244, 0.0627451, 0, 1, 1,
0.4778086, -0.000192802, 2.149914, 0.06666667, 0, 1, 1,
0.4795164, 0.5752806, 1.208227, 0.07450981, 0, 1, 1,
0.4797229, 1.28648, -0.8313504, 0.07843138, 0, 1, 1,
0.4824035, -0.7893754, 4.848658, 0.08627451, 0, 1, 1,
0.5005243, -0.1042696, 2.484944, 0.09019608, 0, 1, 1,
0.5013658, -0.04002903, 2.431924, 0.09803922, 0, 1, 1,
0.5019491, 0.6755779, -0.8605804, 0.1058824, 0, 1, 1,
0.5062484, 1.267005, 0.4313189, 0.1098039, 0, 1, 1,
0.5069067, 1.019546, 0.7568952, 0.1176471, 0, 1, 1,
0.5093914, 0.2312424, -0.4993066, 0.1215686, 0, 1, 1,
0.516179, 0.4090347, -0.3000153, 0.1294118, 0, 1, 1,
0.5189925, -0.1525599, 2.29816, 0.1333333, 0, 1, 1,
0.5191153, 1.178249, 0.5920568, 0.1411765, 0, 1, 1,
0.5242544, 0.4223994, 2.327888, 0.145098, 0, 1, 1,
0.5255917, -0.3674318, 1.416711, 0.1529412, 0, 1, 1,
0.5293276, -1.254945, 1.567522, 0.1568628, 0, 1, 1,
0.5360164, 0.4193132, 1.05642, 0.1647059, 0, 1, 1,
0.5361035, 0.8462548, 0.6287353, 0.1686275, 0, 1, 1,
0.5371165, 1.859206, 2.939723, 0.1764706, 0, 1, 1,
0.5400248, 0.2129, 1.946087, 0.1803922, 0, 1, 1,
0.5401964, 2.141899, 1.406627, 0.1882353, 0, 1, 1,
0.5404536, -1.565121, 4.884751, 0.1921569, 0, 1, 1,
0.5406839, 0.8445659, 1.555647, 0.2, 0, 1, 1,
0.5468211, -1.019771, 5.066635, 0.2078431, 0, 1, 1,
0.5475402, -1.079185, 3.099351, 0.2117647, 0, 1, 1,
0.5522799, 0.03231259, 1.150283, 0.2196078, 0, 1, 1,
0.5564357, 1.071045, 0.9361218, 0.2235294, 0, 1, 1,
0.5580159, -0.1231112, 1.349366, 0.2313726, 0, 1, 1,
0.565819, 0.7983432, 0.004141461, 0.2352941, 0, 1, 1,
0.566317, 0.1740836, 2.410746, 0.2431373, 0, 1, 1,
0.5668222, 0.884977, 2.742519, 0.2470588, 0, 1, 1,
0.5685732, 0.7369715, 1.341285, 0.254902, 0, 1, 1,
0.5703133, 1.804034, 0.6229948, 0.2588235, 0, 1, 1,
0.5705253, 1.632975, 0.2192672, 0.2666667, 0, 1, 1,
0.576533, -0.6820527, 2.624632, 0.2705882, 0, 1, 1,
0.5778601, 0.1182212, -0.6546242, 0.2784314, 0, 1, 1,
0.5779655, -1.145288, 3.84077, 0.282353, 0, 1, 1,
0.5805309, -0.009291797, 1.994365, 0.2901961, 0, 1, 1,
0.5822488, 1.97867, -2.651929, 0.2941177, 0, 1, 1,
0.5857968, 1.263411, 0.103182, 0.3019608, 0, 1, 1,
0.5880451, 0.7322944, -0.5965574, 0.3098039, 0, 1, 1,
0.5888155, 0.7312294, 0.3858818, 0.3137255, 0, 1, 1,
0.5891393, -1.633105, 2.351274, 0.3215686, 0, 1, 1,
0.5901659, 0.235293, 2.467956, 0.3254902, 0, 1, 1,
0.5936856, -0.7844756, 3.293696, 0.3333333, 0, 1, 1,
0.5939114, 0.2819771, 3.012033, 0.3372549, 0, 1, 1,
0.5951232, 1.256292, -0.548808, 0.345098, 0, 1, 1,
0.6000418, 0.3041902, 1.167669, 0.3490196, 0, 1, 1,
0.6010685, 1.566375, 0.6123389, 0.3568628, 0, 1, 1,
0.6027278, -1.16862, 3.174735, 0.3607843, 0, 1, 1,
0.6037938, 0.2607285, 0.4050837, 0.3686275, 0, 1, 1,
0.6108244, -0.4274321, 0.5653016, 0.372549, 0, 1, 1,
0.6211655, -0.2905211, 1.118438, 0.3803922, 0, 1, 1,
0.6213234, -0.2316615, 2.521629, 0.3843137, 0, 1, 1,
0.6308641, -1.198685, 1.322742, 0.3921569, 0, 1, 1,
0.6322974, 0.1051496, 2.095785, 0.3960784, 0, 1, 1,
0.6323324, 0.8936831, 0.7621613, 0.4039216, 0, 1, 1,
0.6358017, 0.4962895, -0.1629749, 0.4117647, 0, 1, 1,
0.6391868, -0.6706096, 1.850619, 0.4156863, 0, 1, 1,
0.6441157, -0.648447, 1.001567, 0.4235294, 0, 1, 1,
0.6520383, -0.827651, 2.866522, 0.427451, 0, 1, 1,
0.6540264, 0.4791549, 0.5131791, 0.4352941, 0, 1, 1,
0.6558747, -0.6371324, 2.11247, 0.4392157, 0, 1, 1,
0.6558992, -0.6383168, 3.464237, 0.4470588, 0, 1, 1,
0.6604319, -0.09964376, 2.916709, 0.4509804, 0, 1, 1,
0.6630013, -1.229558, 2.12464, 0.4588235, 0, 1, 1,
0.6645582, 0.6199344, -0.6822637, 0.4627451, 0, 1, 1,
0.6704027, -0.9473434, 1.373803, 0.4705882, 0, 1, 1,
0.6709412, -0.8422475, 3.074994, 0.4745098, 0, 1, 1,
0.6739632, -1.28407, 1.968223, 0.4823529, 0, 1, 1,
0.6770206, -0.5480372, 4.285008, 0.4862745, 0, 1, 1,
0.6779248, -1.681746, 3.289754, 0.4941176, 0, 1, 1,
0.6788796, -0.7626849, 2.89506, 0.5019608, 0, 1, 1,
0.6803492, -1.997507, 4.041821, 0.5058824, 0, 1, 1,
0.6820002, 0.1918585, 2.723655, 0.5137255, 0, 1, 1,
0.689041, -0.2390395, 0.7149271, 0.5176471, 0, 1, 1,
0.6964879, -0.5674546, 2.710572, 0.5254902, 0, 1, 1,
0.7011081, -0.3702925, 2.345592, 0.5294118, 0, 1, 1,
0.702159, -0.9802395, 1.351131, 0.5372549, 0, 1, 1,
0.7029663, 0.2166388, 1.290361, 0.5411765, 0, 1, 1,
0.7066891, 1.220522, 0.5489044, 0.5490196, 0, 1, 1,
0.7080146, -0.6942295, 4.638487, 0.5529412, 0, 1, 1,
0.714197, 0.2363789, 1.543608, 0.5607843, 0, 1, 1,
0.7169388, -0.006027848, 2.18065, 0.5647059, 0, 1, 1,
0.7185884, -0.4534414, 3.421952, 0.572549, 0, 1, 1,
0.7187723, -0.1909653, 2.152606, 0.5764706, 0, 1, 1,
0.7193961, -1.880318, 1.911815, 0.5843138, 0, 1, 1,
0.721923, 0.3115488, 1.692352, 0.5882353, 0, 1, 1,
0.7223447, -0.6253707, 3.430994, 0.5960785, 0, 1, 1,
0.7239316, 0.4351237, 1.378621, 0.6039216, 0, 1, 1,
0.724032, 0.2210424, 1.279791, 0.6078432, 0, 1, 1,
0.7413765, -0.4496473, 4.383964, 0.6156863, 0, 1, 1,
0.7432572, -0.06478309, 2.407034, 0.6196079, 0, 1, 1,
0.7435836, -0.7059621, 2.747122, 0.627451, 0, 1, 1,
0.7452052, 0.393079, 0.7600074, 0.6313726, 0, 1, 1,
0.7508147, -0.011322, 0.1955356, 0.6392157, 0, 1, 1,
0.7565388, 1.540365, -0.7011433, 0.6431373, 0, 1, 1,
0.7625118, 0.8751838, -0.008100098, 0.6509804, 0, 1, 1,
0.7656872, -0.2612199, 3.56395, 0.654902, 0, 1, 1,
0.767197, 0.06610173, 0.6057974, 0.6627451, 0, 1, 1,
0.7757646, 0.6247505, 1.827271, 0.6666667, 0, 1, 1,
0.7809678, -0.7136184, 1.306152, 0.6745098, 0, 1, 1,
0.7860844, 0.5654603, -0.1031914, 0.6784314, 0, 1, 1,
0.7914895, -0.9539734, 0.6919962, 0.6862745, 0, 1, 1,
0.7922298, -1.111134, 0.4329374, 0.6901961, 0, 1, 1,
0.7938154, 0.5467069, 1.192965, 0.6980392, 0, 1, 1,
0.8030125, -1.560192, 3.428749, 0.7058824, 0, 1, 1,
0.8059195, 0.1762533, 0.3296627, 0.7098039, 0, 1, 1,
0.8091527, 0.4477389, 0.02251167, 0.7176471, 0, 1, 1,
0.8102152, -1.929693, 1.671834, 0.7215686, 0, 1, 1,
0.8162366, 0.7865517, 0.5404916, 0.7294118, 0, 1, 1,
0.8194778, 0.5023258, 1.215126, 0.7333333, 0, 1, 1,
0.8215349, -0.5122251, 2.702567, 0.7411765, 0, 1, 1,
0.8221161, -0.1434645, -0.08987254, 0.7450981, 0, 1, 1,
0.8297437, 0.1319107, 1.009677, 0.7529412, 0, 1, 1,
0.8363395, 0.08265742, 3.491198, 0.7568628, 0, 1, 1,
0.8414018, -0.46548, 4.280436, 0.7647059, 0, 1, 1,
0.8466012, -0.9312212, 3.073898, 0.7686275, 0, 1, 1,
0.8474598, -2.937439, 2.430614, 0.7764706, 0, 1, 1,
0.8523965, 0.8355067, 0.4032816, 0.7803922, 0, 1, 1,
0.8558135, 0.1265368, 0.2947273, 0.7882353, 0, 1, 1,
0.8564597, -1.596974, 1.990906, 0.7921569, 0, 1, 1,
0.8633996, 1.441449, 1.425124, 0.8, 0, 1, 1,
0.8645163, -0.3555016, 2.211149, 0.8078431, 0, 1, 1,
0.8664339, 1.978227, -0.2622697, 0.8117647, 0, 1, 1,
0.8783324, 1.765488, 1.257146, 0.8196079, 0, 1, 1,
0.8817077, 2.324561, 2.079985, 0.8235294, 0, 1, 1,
0.8819522, -0.1353497, 2.816761, 0.8313726, 0, 1, 1,
0.8838668, 0.9718753, 1.045276, 0.8352941, 0, 1, 1,
0.8846655, 0.08886689, 2.847603, 0.8431373, 0, 1, 1,
0.8914699, -0.9451505, 2.944227, 0.8470588, 0, 1, 1,
0.8925363, -0.3021797, 2.931904, 0.854902, 0, 1, 1,
0.8938572, -0.5663174, 1.957243, 0.8588235, 0, 1, 1,
0.9029795, 0.3208335, 1.652049, 0.8666667, 0, 1, 1,
0.9101006, 1.387172, 2.148226, 0.8705882, 0, 1, 1,
0.9171289, 1.919104, -0.6671124, 0.8784314, 0, 1, 1,
0.9302444, -0.4119294, 2.037278, 0.8823529, 0, 1, 1,
0.9432701, -0.8081713, 1.50007, 0.8901961, 0, 1, 1,
0.9497796, -1.271824, 1.324595, 0.8941177, 0, 1, 1,
0.9549509, -0.8053387, 2.399745, 0.9019608, 0, 1, 1,
0.9561712, 1.115844, 0.3674509, 0.9098039, 0, 1, 1,
0.961753, 1.273365, 1.197347, 0.9137255, 0, 1, 1,
0.9628819, -1.75554, 4.499948, 0.9215686, 0, 1, 1,
0.9679462, -0.7202326, 3.585641, 0.9254902, 0, 1, 1,
0.969417, 2.438208, -1.579011, 0.9333333, 0, 1, 1,
0.9706217, -0.5736268, 3.24985, 0.9372549, 0, 1, 1,
0.9710716, 0.8580559, 1.187959, 0.945098, 0, 1, 1,
0.9759645, 0.451241, 1.342444, 0.9490196, 0, 1, 1,
0.9761756, 0.4724284, 0.2258777, 0.9568627, 0, 1, 1,
0.9890998, 0.4646396, 1.139691, 0.9607843, 0, 1, 1,
0.9942564, 0.6740001, -0.113426, 0.9686275, 0, 1, 1,
0.9974235, -0.2648881, 0.7027618, 0.972549, 0, 1, 1,
0.9978928, -1.147581, 3.117496, 0.9803922, 0, 1, 1,
0.9979382, -0.6134432, 2.897188, 0.9843137, 0, 1, 1,
0.9983801, 0.7422751, 0.5784429, 0.9921569, 0, 1, 1,
0.9984299, -0.643918, 2.075039, 0.9960784, 0, 1, 1,
1.005409, 0.2016526, 2.165792, 1, 0, 0.9960784, 1,
1.016417, -0.341619, 2.380534, 1, 0, 0.9882353, 1,
1.025601, 2.767309, -0.2317685, 1, 0, 0.9843137, 1,
1.029559, -0.5405279, 2.581482, 1, 0, 0.9764706, 1,
1.04172, -0.7262694, 3.110115, 1, 0, 0.972549, 1,
1.057555, 0.9034156, 2.342815, 1, 0, 0.9647059, 1,
1.061649, 0.4455974, 0.7298665, 1, 0, 0.9607843, 1,
1.080296, -1.161766, 0.570586, 1, 0, 0.9529412, 1,
1.091377, 1.406221, -0.3544137, 1, 0, 0.9490196, 1,
1.091603, -0.4967841, 1.266931, 1, 0, 0.9411765, 1,
1.092536, -0.5715801, 1.177328, 1, 0, 0.9372549, 1,
1.106336, -2.43076, 2.101694, 1, 0, 0.9294118, 1,
1.107662, -0.3607696, 3.202325, 1, 0, 0.9254902, 1,
1.109496, -1.983569, 2.435892, 1, 0, 0.9176471, 1,
1.112397, 0.5428163, -0.3027166, 1, 0, 0.9137255, 1,
1.112746, -1.284021, 0.7730873, 1, 0, 0.9058824, 1,
1.118576, -0.4653541, 2.729315, 1, 0, 0.9019608, 1,
1.121387, -0.8154806, 2.524992, 1, 0, 0.8941177, 1,
1.122819, 0.4013524, 0.7399029, 1, 0, 0.8862745, 1,
1.127301, 1.805438, 1.405484, 1, 0, 0.8823529, 1,
1.141342, 0.2495293, -0.9248152, 1, 0, 0.8745098, 1,
1.142109, 2.128234, -1.407639, 1, 0, 0.8705882, 1,
1.143875, -0.3789409, 3.353363, 1, 0, 0.8627451, 1,
1.153598, -0.4019158, 1.504969, 1, 0, 0.8588235, 1,
1.15632, 1.110981, 0.004887458, 1, 0, 0.8509804, 1,
1.179383, 0.2258983, 0.7812952, 1, 0, 0.8470588, 1,
1.183281, -0.4395615, 1.283693, 1, 0, 0.8392157, 1,
1.184341, 0.2199757, 0.4557656, 1, 0, 0.8352941, 1,
1.190391, -0.2031192, 1.279269, 1, 0, 0.827451, 1,
1.198347, -1.51064, 1.468779, 1, 0, 0.8235294, 1,
1.202498, -1.022723, 2.529427, 1, 0, 0.8156863, 1,
1.209738, -1.312536, 3.34059, 1, 0, 0.8117647, 1,
1.212338, -0.5272011, 1.632273, 1, 0, 0.8039216, 1,
1.213617, 1.153376, -0.1426017, 1, 0, 0.7960784, 1,
1.214543, -0.314926, 1.358379, 1, 0, 0.7921569, 1,
1.215169, 1.503319, 0.1592458, 1, 0, 0.7843137, 1,
1.219138, 0.01606494, 0.02199408, 1, 0, 0.7803922, 1,
1.223545, 0.8304836, 2.151645, 1, 0, 0.772549, 1,
1.224745, -0.3650051, -0.7117364, 1, 0, 0.7686275, 1,
1.226773, 0.1030484, -0.06609844, 1, 0, 0.7607843, 1,
1.228812, -0.2793171, 3.717104, 1, 0, 0.7568628, 1,
1.228835, 1.31488, 0.5327963, 1, 0, 0.7490196, 1,
1.2409, 0.9146283, 0.6366321, 1, 0, 0.7450981, 1,
1.243683, -0.9737755, 3.664462, 1, 0, 0.7372549, 1,
1.260359, 1.222684, -1.428003, 1, 0, 0.7333333, 1,
1.269513, 0.56981, 1.788471, 1, 0, 0.7254902, 1,
1.278527, 0.5202323, 0.6497722, 1, 0, 0.7215686, 1,
1.282395, -0.6926249, 2.433134, 1, 0, 0.7137255, 1,
1.283674, -0.5192007, 2.162876, 1, 0, 0.7098039, 1,
1.290936, 0.8321671, -0.245992, 1, 0, 0.7019608, 1,
1.298003, 1.156494, 2.54049, 1, 0, 0.6941177, 1,
1.301291, -0.8919699, 1.390644, 1, 0, 0.6901961, 1,
1.302315, 0.2639966, 0.399304, 1, 0, 0.682353, 1,
1.31986, -2.331573, 0.9450771, 1, 0, 0.6784314, 1,
1.321773, -1.398479, 1.532165, 1, 0, 0.6705883, 1,
1.332435, -0.8622401, 3.029394, 1, 0, 0.6666667, 1,
1.334435, -0.2619541, 1.466765, 1, 0, 0.6588235, 1,
1.335038, 0.5482131, 4.048408, 1, 0, 0.654902, 1,
1.339545, -0.07087453, 1.606986, 1, 0, 0.6470588, 1,
1.34193, 1.028708, 2.332564, 1, 0, 0.6431373, 1,
1.34504, 0.6102077, -0.4212298, 1, 0, 0.6352941, 1,
1.348559, 0.9426799, 1.245518, 1, 0, 0.6313726, 1,
1.358582, -0.27878, 1.090961, 1, 0, 0.6235294, 1,
1.368307, 0.8803658, 2.638702, 1, 0, 0.6196079, 1,
1.390249, -0.7137054, 2.999885, 1, 0, 0.6117647, 1,
1.390292, -1.07939, 2.233044, 1, 0, 0.6078432, 1,
1.399202, -0.83022, 1.758908, 1, 0, 0.6, 1,
1.414129, 0.6439704, 0.4027492, 1, 0, 0.5921569, 1,
1.41787, -0.8231081, 2.576697, 1, 0, 0.5882353, 1,
1.420038, 0.5676752, 2.214836, 1, 0, 0.5803922, 1,
1.429325, -0.2268947, 0.3295781, 1, 0, 0.5764706, 1,
1.431368, -2.252486, -0.07903618, 1, 0, 0.5686275, 1,
1.432327, -0.5280898, 2.394569, 1, 0, 0.5647059, 1,
1.434305, 0.1241056, 1.819208, 1, 0, 0.5568628, 1,
1.43768, -1.31912, 2.285933, 1, 0, 0.5529412, 1,
1.442552, -0.0248171, 1.389826, 1, 0, 0.5450981, 1,
1.457056, -0.6644006, 2.999362, 1, 0, 0.5411765, 1,
1.461567, -1.400454, 3.005248, 1, 0, 0.5333334, 1,
1.469207, -0.8993343, 1.175765, 1, 0, 0.5294118, 1,
1.470361, -2.612587, 3.844109, 1, 0, 0.5215687, 1,
1.472332, -1.087878, 2.099247, 1, 0, 0.5176471, 1,
1.490072, 0.8132576, 1.498865, 1, 0, 0.509804, 1,
1.497213, 0.735332, 2.47201, 1, 0, 0.5058824, 1,
1.503516, -0.3123825, 2.13576, 1, 0, 0.4980392, 1,
1.518304, 0.1335593, 2.561915, 1, 0, 0.4901961, 1,
1.524969, 0.478449, 0.076011, 1, 0, 0.4862745, 1,
1.566265, -1.04806, 1.789329, 1, 0, 0.4784314, 1,
1.581504, 1.070105, 0.08366345, 1, 0, 0.4745098, 1,
1.587085, -2.163495, 3.02692, 1, 0, 0.4666667, 1,
1.6033, 0.08504163, -1.031881, 1, 0, 0.4627451, 1,
1.60923, 0.948216, 0.1773005, 1, 0, 0.454902, 1,
1.612506, 1.154415, 2.050278, 1, 0, 0.4509804, 1,
1.620295, 2.351603, -0.3861797, 1, 0, 0.4431373, 1,
1.622853, -0.1560588, 2.532325, 1, 0, 0.4392157, 1,
1.632258, -0.1180952, 1.618288, 1, 0, 0.4313726, 1,
1.634449, 1.27262, 0.06125527, 1, 0, 0.427451, 1,
1.650766, 2.550211, 1.939621, 1, 0, 0.4196078, 1,
1.653321, -1.497489, 1.988363, 1, 0, 0.4156863, 1,
1.65477, -0.4640348, 1.631918, 1, 0, 0.4078431, 1,
1.656896, -1.522253, 2.710526, 1, 0, 0.4039216, 1,
1.671415, 0.552009, 1.345999, 1, 0, 0.3960784, 1,
1.675083, 2.091457, 1.258642, 1, 0, 0.3882353, 1,
1.676745, 0.5906385, 3.016077, 1, 0, 0.3843137, 1,
1.686063, 1.007783, 1.093938, 1, 0, 0.3764706, 1,
1.699799, 0.8025159, 1.216272, 1, 0, 0.372549, 1,
1.714196, -0.8468279, -0.7544303, 1, 0, 0.3647059, 1,
1.716699, -0.06993159, 3.275502, 1, 0, 0.3607843, 1,
1.729726, 0.5660605, -0.5896581, 1, 0, 0.3529412, 1,
1.73808, 0.431522, 0.820389, 1, 0, 0.3490196, 1,
1.747046, 0.3653822, 0.5784476, 1, 0, 0.3411765, 1,
1.76035, 0.1374693, 2.094094, 1, 0, 0.3372549, 1,
1.775841, -0.9655637, 2.82316, 1, 0, 0.3294118, 1,
1.783799, -0.8758332, 1.785898, 1, 0, 0.3254902, 1,
1.786015, -1.216318, 1.420491, 1, 0, 0.3176471, 1,
1.793935, -0.3374549, 1.937444, 1, 0, 0.3137255, 1,
1.795106, 0.9597032, 2.396043, 1, 0, 0.3058824, 1,
1.81262, 0.6987566, 1.899202, 1, 0, 0.2980392, 1,
1.814404, 0.5988567, 1.830522, 1, 0, 0.2941177, 1,
1.816521, -2.227311, 2.581847, 1, 0, 0.2862745, 1,
1.822033, 1.85054, -0.5332105, 1, 0, 0.282353, 1,
1.841048, 0.4325403, -0.220894, 1, 0, 0.2745098, 1,
1.869446, -0.2375419, -0.3890996, 1, 0, 0.2705882, 1,
1.881761, 0.2258066, -2.592697, 1, 0, 0.2627451, 1,
1.882454, 0.9708798, 0.0433548, 1, 0, 0.2588235, 1,
1.896834, 0.4293914, -0.2338169, 1, 0, 0.2509804, 1,
1.907777, -0.6310138, 1.635226, 1, 0, 0.2470588, 1,
1.915825, -0.6054388, 2.001234, 1, 0, 0.2392157, 1,
1.916022, -1.433644, 2.908765, 1, 0, 0.2352941, 1,
1.916499, 0.7887323, 2.934077, 1, 0, 0.227451, 1,
1.917853, 0.07549548, 0.3459236, 1, 0, 0.2235294, 1,
1.970337, -1.095525, 1.791215, 1, 0, 0.2156863, 1,
1.999113, -0.8051264, 3.13161, 1, 0, 0.2117647, 1,
2.001818, 2.069668, 0.2229738, 1, 0, 0.2039216, 1,
2.006733, 1.796028, 1.760285, 1, 0, 0.1960784, 1,
2.05429, 0.00524708, 1.178943, 1, 0, 0.1921569, 1,
2.056051, -0.09527871, 0.8784816, 1, 0, 0.1843137, 1,
2.072588, 1.16569, 2.075791, 1, 0, 0.1803922, 1,
2.088868, -0.4683321, 1.864929, 1, 0, 0.172549, 1,
2.095445, 1.055704, 1.041264, 1, 0, 0.1686275, 1,
2.096177, 0.351869, 1.800348, 1, 0, 0.1607843, 1,
2.104814, -1.115782, 1.462521, 1, 0, 0.1568628, 1,
2.145221, -0.5314827, 2.835618, 1, 0, 0.1490196, 1,
2.159086, -0.5540344, 0.8343423, 1, 0, 0.145098, 1,
2.16061, 0.5494611, -0.6665558, 1, 0, 0.1372549, 1,
2.178982, 0.7892451, -0.2420753, 1, 0, 0.1333333, 1,
2.180739, -0.881181, 1.055441, 1, 0, 0.1254902, 1,
2.236504, -2.338011, 1.9757, 1, 0, 0.1215686, 1,
2.250588, 0.5970477, -0.166874, 1, 0, 0.1137255, 1,
2.255305, -1.193922, 1.160378, 1, 0, 0.1098039, 1,
2.431344, 0.8796728, 2.060199, 1, 0, 0.1019608, 1,
2.450076, 0.3743443, 1.065615, 1, 0, 0.09411765, 1,
2.450633, -0.9609998, 3.516995, 1, 0, 0.09019608, 1,
2.452823, 0.158241, 0.7556177, 1, 0, 0.08235294, 1,
2.471537, -1.39905, 0.7174315, 1, 0, 0.07843138, 1,
2.496887, 0.2479205, 0.4643306, 1, 0, 0.07058824, 1,
2.498453, -0.7207957, 2.180008, 1, 0, 0.06666667, 1,
2.519059, 1.815375, 0.5437328, 1, 0, 0.05882353, 1,
2.638899, 0.311059, 0.7798027, 1, 0, 0.05490196, 1,
2.682933, 1.717186, 1.298606, 1, 0, 0.04705882, 1,
2.775396, 0.04178872, 0.809227, 1, 0, 0.04313726, 1,
2.775895, 0.837509, 1.915999, 1, 0, 0.03529412, 1,
2.840933, 0.8083831, -0.145654, 1, 0, 0.03137255, 1,
2.887105, 1.06465, 1.327349, 1, 0, 0.02352941, 1,
2.944268, -1.796174, 1.166506, 1, 0, 0.01960784, 1,
3.130381, -1.029637, 1.947729, 1, 0, 0.01176471, 1,
3.552341, 1.452646, 1.842327, 1, 0, 0.007843138, 1
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
0.01812994, -3.904394, -8.084096, 0, -0.5, 0.5, 0.5,
0.01812994, -3.904394, -8.084096, 1, -0.5, 0.5, 0.5,
0.01812994, -3.904394, -8.084096, 1, 1.5, 0.5, 0.5,
0.01812994, -3.904394, -8.084096, 0, 1.5, 0.5, 0.5
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
-4.714178, -0.08506477, -8.084096, 0, -0.5, 0.5, 0.5,
-4.714178, -0.08506477, -8.084096, 1, -0.5, 0.5, 0.5,
-4.714178, -0.08506477, -8.084096, 1, 1.5, 0.5, 0.5,
-4.714178, -0.08506477, -8.084096, 0, 1.5, 0.5, 0.5
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
-4.714178, -3.904394, -0.3426254, 0, -0.5, 0.5, 0.5,
-4.714178, -3.904394, -0.3426254, 1, -0.5, 0.5, 0.5,
-4.714178, -3.904394, -0.3426254, 1, 1.5, 0.5, 0.5,
-4.714178, -3.904394, -0.3426254, 0, 1.5, 0.5, 0.5
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
-2, -3.02301, -6.297602,
2, -3.02301, -6.297602,
-2, -3.02301, -6.297602,
-2, -3.169908, -6.595351,
0, -3.02301, -6.297602,
0, -3.169908, -6.595351,
2, -3.02301, -6.297602,
2, -3.169908, -6.595351
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
-2, -3.463702, -7.190849, 0, -0.5, 0.5, 0.5,
-2, -3.463702, -7.190849, 1, -0.5, 0.5, 0.5,
-2, -3.463702, -7.190849, 1, 1.5, 0.5, 0.5,
-2, -3.463702, -7.190849, 0, 1.5, 0.5, 0.5,
0, -3.463702, -7.190849, 0, -0.5, 0.5, 0.5,
0, -3.463702, -7.190849, 1, -0.5, 0.5, 0.5,
0, -3.463702, -7.190849, 1, 1.5, 0.5, 0.5,
0, -3.463702, -7.190849, 0, 1.5, 0.5, 0.5,
2, -3.463702, -7.190849, 0, -0.5, 0.5, 0.5,
2, -3.463702, -7.190849, 1, -0.5, 0.5, 0.5,
2, -3.463702, -7.190849, 1, 1.5, 0.5, 0.5,
2, -3.463702, -7.190849, 0, 1.5, 0.5, 0.5
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
-3.622107, -2, -6.297602,
-3.622107, 2, -6.297602,
-3.622107, -2, -6.297602,
-3.804119, -2, -6.595351,
-3.622107, -1, -6.297602,
-3.804119, -1, -6.595351,
-3.622107, 0, -6.297602,
-3.804119, 0, -6.595351,
-3.622107, 1, -6.297602,
-3.804119, 1, -6.595351,
-3.622107, 2, -6.297602,
-3.804119, 2, -6.595351
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
-4.168143, -2, -7.190849, 0, -0.5, 0.5, 0.5,
-4.168143, -2, -7.190849, 1, -0.5, 0.5, 0.5,
-4.168143, -2, -7.190849, 1, 1.5, 0.5, 0.5,
-4.168143, -2, -7.190849, 0, 1.5, 0.5, 0.5,
-4.168143, -1, -7.190849, 0, -0.5, 0.5, 0.5,
-4.168143, -1, -7.190849, 1, -0.5, 0.5, 0.5,
-4.168143, -1, -7.190849, 1, 1.5, 0.5, 0.5,
-4.168143, -1, -7.190849, 0, 1.5, 0.5, 0.5,
-4.168143, 0, -7.190849, 0, -0.5, 0.5, 0.5,
-4.168143, 0, -7.190849, 1, -0.5, 0.5, 0.5,
-4.168143, 0, -7.190849, 1, 1.5, 0.5, 0.5,
-4.168143, 0, -7.190849, 0, 1.5, 0.5, 0.5,
-4.168143, 1, -7.190849, 0, -0.5, 0.5, 0.5,
-4.168143, 1, -7.190849, 1, -0.5, 0.5, 0.5,
-4.168143, 1, -7.190849, 1, 1.5, 0.5, 0.5,
-4.168143, 1, -7.190849, 0, 1.5, 0.5, 0.5,
-4.168143, 2, -7.190849, 0, -0.5, 0.5, 0.5,
-4.168143, 2, -7.190849, 1, -0.5, 0.5, 0.5,
-4.168143, 2, -7.190849, 1, 1.5, 0.5, 0.5,
-4.168143, 2, -7.190849, 0, 1.5, 0.5, 0.5
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
-3.622107, -3.02301, -6,
-3.622107, -3.02301, 4,
-3.622107, -3.02301, -6,
-3.804119, -3.169908, -6,
-3.622107, -3.02301, -4,
-3.804119, -3.169908, -4,
-3.622107, -3.02301, -2,
-3.804119, -3.169908, -2,
-3.622107, -3.02301, 0,
-3.804119, -3.169908, 0,
-3.622107, -3.02301, 2,
-3.804119, -3.169908, 2,
-3.622107, -3.02301, 4,
-3.804119, -3.169908, 4
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
"-6",
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
-4.168143, -3.463702, -6, 0, -0.5, 0.5, 0.5,
-4.168143, -3.463702, -6, 1, -0.5, 0.5, 0.5,
-4.168143, -3.463702, -6, 1, 1.5, 0.5, 0.5,
-4.168143, -3.463702, -6, 0, 1.5, 0.5, 0.5,
-4.168143, -3.463702, -4, 0, -0.5, 0.5, 0.5,
-4.168143, -3.463702, -4, 1, -0.5, 0.5, 0.5,
-4.168143, -3.463702, -4, 1, 1.5, 0.5, 0.5,
-4.168143, -3.463702, -4, 0, 1.5, 0.5, 0.5,
-4.168143, -3.463702, -2, 0, -0.5, 0.5, 0.5,
-4.168143, -3.463702, -2, 1, -0.5, 0.5, 0.5,
-4.168143, -3.463702, -2, 1, 1.5, 0.5, 0.5,
-4.168143, -3.463702, -2, 0, 1.5, 0.5, 0.5,
-4.168143, -3.463702, 0, 0, -0.5, 0.5, 0.5,
-4.168143, -3.463702, 0, 1, -0.5, 0.5, 0.5,
-4.168143, -3.463702, 0, 1, 1.5, 0.5, 0.5,
-4.168143, -3.463702, 0, 0, 1.5, 0.5, 0.5,
-4.168143, -3.463702, 2, 0, -0.5, 0.5, 0.5,
-4.168143, -3.463702, 2, 1, -0.5, 0.5, 0.5,
-4.168143, -3.463702, 2, 1, 1.5, 0.5, 0.5,
-4.168143, -3.463702, 2, 0, 1.5, 0.5, 0.5,
-4.168143, -3.463702, 4, 0, -0.5, 0.5, 0.5,
-4.168143, -3.463702, 4, 1, -0.5, 0.5, 0.5,
-4.168143, -3.463702, 4, 1, 1.5, 0.5, 0.5,
-4.168143, -3.463702, 4, 0, 1.5, 0.5, 0.5
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
-3.622107, -3.02301, -6.297602,
-3.622107, 2.852881, -6.297602,
-3.622107, -3.02301, 5.612351,
-3.622107, 2.852881, 5.612351,
-3.622107, -3.02301, -6.297602,
-3.622107, -3.02301, 5.612351,
-3.622107, 2.852881, -6.297602,
-3.622107, 2.852881, 5.612351,
-3.622107, -3.02301, -6.297602,
3.658367, -3.02301, -6.297602,
-3.622107, -3.02301, 5.612351,
3.658367, -3.02301, 5.612351,
-3.622107, 2.852881, -6.297602,
3.658367, 2.852881, -6.297602,
-3.622107, 2.852881, 5.612351,
3.658367, 2.852881, 5.612351,
3.658367, -3.02301, -6.297602,
3.658367, 2.852881, -6.297602,
3.658367, -3.02301, 5.612351,
3.658367, 2.852881, 5.612351,
3.658367, -3.02301, -6.297602,
3.658367, -3.02301, 5.612351,
3.658367, 2.852881, -6.297602,
3.658367, 2.852881, 5.612351
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
var radius = 8.087266;
var distance = 35.98116;
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
mvMatrix.translate( -0.01812994, 0.08506477, 0.3426254 );
mvMatrix.scale( 1.201036, 1.488134, 0.7341851 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98116);
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
glycine<-read.table("glycine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-glycine$V2
```

```
## Error in eval(expr, envir, enclos): object 'glycine' not found
```

```r
y<-glycine$V3
```

```
## Error in eval(expr, envir, enclos): object 'glycine' not found
```

```r
z<-glycine$V4
```

```
## Error in eval(expr, envir, enclos): object 'glycine' not found
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
-3.516081, 0.9643253, -2.542324, 0, 0, 1, 1, 1,
-3.010058, -0.1135103, -1.981559, 1, 0, 0, 1, 1,
-2.996511, 0.5524644, -1.363184, 1, 0, 0, 1, 1,
-2.984601, -0.2455004, -1.564085, 1, 0, 0, 1, 1,
-2.809437, -1.122677, -2.436264, 1, 0, 0, 1, 1,
-2.801944, 0.851074, -0.5443096, 1, 0, 0, 1, 1,
-2.719476, -0.6140243, -3.177726, 0, 0, 0, 1, 1,
-2.664326, -0.6828345, -3.210413, 0, 0, 0, 1, 1,
-2.644084, 0.8857837, -2.006608, 0, 0, 0, 1, 1,
-2.635816, -1.338405, -2.013421, 0, 0, 0, 1, 1,
-2.531225, 0.8956223, -2.808924, 0, 0, 0, 1, 1,
-2.434736, -0.05180248, -3.598841, 0, 0, 0, 1, 1,
-2.392148, -0.07280237, -1.625616, 0, 0, 0, 1, 1,
-2.388738, 2.12253, -0.5649651, 1, 1, 1, 1, 1,
-2.362195, 0.1014992, -1.10437, 1, 1, 1, 1, 1,
-2.361857, 1.502597, -0.3286127, 1, 1, 1, 1, 1,
-2.33046, -0.6553487, 0.2708806, 1, 1, 1, 1, 1,
-2.322853, 0.9128131, -0.591112, 1, 1, 1, 1, 1,
-2.317306, 0.7509909, -1.536692, 1, 1, 1, 1, 1,
-2.258761, 2.388085, -1.512338, 1, 1, 1, 1, 1,
-2.246304, 0.5901769, 0.9358953, 1, 1, 1, 1, 1,
-2.215234, -0.03190748, -2.00423, 1, 1, 1, 1, 1,
-2.170877, -2.143393, -2.387125, 1, 1, 1, 1, 1,
-2.170485, 0.0382042, -0.04531883, 1, 1, 1, 1, 1,
-2.151234, 0.3929295, -0.2093079, 1, 1, 1, 1, 1,
-2.124128, -0.2000732, -2.740498, 1, 1, 1, 1, 1,
-2.096136, -0.3433133, -1.309834, 1, 1, 1, 1, 1,
-2.048823, -2.136386, -2.659716, 1, 1, 1, 1, 1,
-2.028575, 0.5289187, -2.28147, 0, 0, 1, 1, 1,
-2.024771, 1.042823, 0.9394686, 1, 0, 0, 1, 1,
-2.022405, -0.5179822, -1.807075, 1, 0, 0, 1, 1,
-1.989937, -0.9338718, -1.218786, 1, 0, 0, 1, 1,
-1.973787, -0.8206713, -3.004835, 1, 0, 0, 1, 1,
-1.971651, 1.19148, -1.982686, 1, 0, 0, 1, 1,
-1.967297, -0.6489587, -1.341202, 0, 0, 0, 1, 1,
-1.955073, -0.4813352, -0.4781893, 0, 0, 0, 1, 1,
-1.945136, -0.4710927, 0.07771613, 0, 0, 0, 1, 1,
-1.939041, -0.7892365, -3.309649, 0, 0, 0, 1, 1,
-1.898673, 1.706677, -0.1497039, 0, 0, 0, 1, 1,
-1.898389, 1.103278, 1.164134, 0, 0, 0, 1, 1,
-1.883387, -0.1379123, -2.447599, 0, 0, 0, 1, 1,
-1.878146, 0.3763915, -1.366515, 1, 1, 1, 1, 1,
-1.858947, 0.06772328, -0.7910233, 1, 1, 1, 1, 1,
-1.854729, 0.7050586, -2.316943, 1, 1, 1, 1, 1,
-1.847785, -2.151052, -1.947852, 1, 1, 1, 1, 1,
-1.837423, -1.950153, -2.303981, 1, 1, 1, 1, 1,
-1.82958, 0.3861036, -2.156983, 1, 1, 1, 1, 1,
-1.822482, -1.727893, -2.694299, 1, 1, 1, 1, 1,
-1.809116, -0.3345572, -1.878172, 1, 1, 1, 1, 1,
-1.807323, -0.7552793, -3.608394, 1, 1, 1, 1, 1,
-1.805123, -1.019264, -1.643154, 1, 1, 1, 1, 1,
-1.802353, -0.473146, -1.739058, 1, 1, 1, 1, 1,
-1.793815, 0.6152883, -2.224592, 1, 1, 1, 1, 1,
-1.771893, 1.319371, -2.740848, 1, 1, 1, 1, 1,
-1.755705, 0.3815412, -0.6216767, 1, 1, 1, 1, 1,
-1.736943, -0.3395199, -0.8181036, 1, 1, 1, 1, 1,
-1.717579, 1.00596, -1.468077, 0, 0, 1, 1, 1,
-1.714156, -0.9717421, -0.9948943, 1, 0, 0, 1, 1,
-1.712254, 1.084558, -2.211881, 1, 0, 0, 1, 1,
-1.711965, -0.2736783, -0.515211, 1, 0, 0, 1, 1,
-1.688367, 0.8243653, -1.929804, 1, 0, 0, 1, 1,
-1.680878, 0.9752492, 0.2458427, 1, 0, 0, 1, 1,
-1.672252, -1.529948, -0.8195462, 0, 0, 0, 1, 1,
-1.668209, 1.790754, 0.02178948, 0, 0, 0, 1, 1,
-1.653341, 0.2585853, -2.307982, 0, 0, 0, 1, 1,
-1.643008, 0.9875169, 0.303255, 0, 0, 0, 1, 1,
-1.636864, 0.08255438, -0.4594044, 0, 0, 0, 1, 1,
-1.610351, 0.5448235, 0.5331039, 0, 0, 0, 1, 1,
-1.606782, 0.2620396, -2.537635, 0, 0, 0, 1, 1,
-1.604345, -0.6566405, -2.431048, 1, 1, 1, 1, 1,
-1.585614, 0.1058932, -2.05228, 1, 1, 1, 1, 1,
-1.582203, 0.1905703, -0.471915, 1, 1, 1, 1, 1,
-1.581267, -1.291619, -0.31628, 1, 1, 1, 1, 1,
-1.564652, -0.6581933, -1.009609, 1, 1, 1, 1, 1,
-1.563253, 1.089025, 0.2395518, 1, 1, 1, 1, 1,
-1.560794, 0.4801359, -0.4300806, 1, 1, 1, 1, 1,
-1.55511, 1.304171, -1.41376, 1, 1, 1, 1, 1,
-1.552558, -0.4002107, 0.09830519, 1, 1, 1, 1, 1,
-1.548605, -0.7940031, -2.063761, 1, 1, 1, 1, 1,
-1.539741, -1.296224, -2.527233, 1, 1, 1, 1, 1,
-1.537395, -0.09590778, -2.384068, 1, 1, 1, 1, 1,
-1.509001, 0.8692715, -0.1822544, 1, 1, 1, 1, 1,
-1.490347, 1.077729, -2.083109, 1, 1, 1, 1, 1,
-1.489001, -0.2728687, -1.621071, 1, 1, 1, 1, 1,
-1.487797, -2.753171, -3.750055, 0, 0, 1, 1, 1,
-1.48436, -0.5803979, -2.035614, 1, 0, 0, 1, 1,
-1.482364, 0.3425843, -0.5410509, 1, 0, 0, 1, 1,
-1.475501, -0.09248773, -1.936601, 1, 0, 0, 1, 1,
-1.474823, 0.1578078, -2.735318, 1, 0, 0, 1, 1,
-1.474326, 0.7301549, 0.2013216, 1, 0, 0, 1, 1,
-1.473567, -0.2825482, -3.314814, 0, 0, 0, 1, 1,
-1.46662, 0.2563659, 0.6819267, 0, 0, 0, 1, 1,
-1.454381, 0.4818585, -1.745686, 0, 0, 0, 1, 1,
-1.447443, -0.7837151, -1.559317, 0, 0, 0, 1, 1,
-1.444532, -0.1091313, -0.4318294, 0, 0, 0, 1, 1,
-1.437096, -0.3074302, -2.501464, 0, 0, 0, 1, 1,
-1.42702, 0.6439059, 0.4091156, 0, 0, 0, 1, 1,
-1.420112, 1.333901, -1.460686, 1, 1, 1, 1, 1,
-1.417794, 1.618456, -1.481509, 1, 1, 1, 1, 1,
-1.394918, -1.577954, -2.115512, 1, 1, 1, 1, 1,
-1.374238, -0.8421049, -1.985393, 1, 1, 1, 1, 1,
-1.363643, -0.7965162, -2.327113, 1, 1, 1, 1, 1,
-1.363346, 1.428978, -2.277567, 1, 1, 1, 1, 1,
-1.358619, -1.848554, -1.83566, 1, 1, 1, 1, 1,
-1.35479, -0.5502324, -2.415645, 1, 1, 1, 1, 1,
-1.35258, -0.4180084, -3.328467, 1, 1, 1, 1, 1,
-1.35064, -0.03368406, -2.8654, 1, 1, 1, 1, 1,
-1.344332, -0.08737297, -1.753085, 1, 1, 1, 1, 1,
-1.342115, -1.020997, -3.51146, 1, 1, 1, 1, 1,
-1.341704, -0.7277499, -0.8098361, 1, 1, 1, 1, 1,
-1.33979, 1.24863, -2.482423, 1, 1, 1, 1, 1,
-1.339438, 1.228728, 0.3806789, 1, 1, 1, 1, 1,
-1.334323, -1.869138, -3.699892, 0, 0, 1, 1, 1,
-1.332651, -0.974929, -1.975171, 1, 0, 0, 1, 1,
-1.329774, 0.7170356, -1.761078, 1, 0, 0, 1, 1,
-1.328086, 0.2819833, -1.534351, 1, 0, 0, 1, 1,
-1.326123, 0.6078371, -3.277412, 1, 0, 0, 1, 1,
-1.318972, -0.6962061, -1.871088, 1, 0, 0, 1, 1,
-1.305297, 0.8596472, -1.41412, 0, 0, 0, 1, 1,
-1.304348, 1.033979, -0.6220843, 0, 0, 0, 1, 1,
-1.304012, 0.5454888, -1.816603, 0, 0, 0, 1, 1,
-1.297336, -2.029862, -2.069027, 0, 0, 0, 1, 1,
-1.296309, -0.3070084, -2.393688, 0, 0, 0, 1, 1,
-1.294764, -1.163179, -3.825795, 0, 0, 0, 1, 1,
-1.294423, -1.120288, -3.19726, 0, 0, 0, 1, 1,
-1.294171, -0.4470289, -3.725009, 1, 1, 1, 1, 1,
-1.292079, -0.7561553, -2.929944, 1, 1, 1, 1, 1,
-1.284078, -0.1415459, -1.635941, 1, 1, 1, 1, 1,
-1.281887, 0.4203176, -1.831497, 1, 1, 1, 1, 1,
-1.279408, -0.077502, -1.366357, 1, 1, 1, 1, 1,
-1.273628, 1.322489, 0.5461158, 1, 1, 1, 1, 1,
-1.270911, -1.053561, -1.064125, 1, 1, 1, 1, 1,
-1.269206, 0.1385117, 0.8151478, 1, 1, 1, 1, 1,
-1.268718, 1.218302, -1.248598, 1, 1, 1, 1, 1,
-1.259437, -0.8601542, -1.809344, 1, 1, 1, 1, 1,
-1.240851, -1.363399, -1.117293, 1, 1, 1, 1, 1,
-1.226819, 1.255497, 0.4307093, 1, 1, 1, 1, 1,
-1.198013, -1.590101, -1.673272, 1, 1, 1, 1, 1,
-1.19571, -0.2272795, -1.366403, 1, 1, 1, 1, 1,
-1.187075, -0.580516, -3.266646, 1, 1, 1, 1, 1,
-1.18115, -0.5970469, -2.977687, 0, 0, 1, 1, 1,
-1.177638, -0.5740036, -3.43068, 1, 0, 0, 1, 1,
-1.158146, 0.1083312, -1.898888, 1, 0, 0, 1, 1,
-1.15171, 0.8722403, -0.9253085, 1, 0, 0, 1, 1,
-1.151336, 1.121014, -0.7906358, 1, 0, 0, 1, 1,
-1.150347, 1.69847, -1.59072, 1, 0, 0, 1, 1,
-1.149876, 0.7647358, -1.573702, 0, 0, 0, 1, 1,
-1.140051, 1.704, 0.7544742, 0, 0, 0, 1, 1,
-1.139076, -0.6362455, -1.416984, 0, 0, 0, 1, 1,
-1.138041, -2.089231, -3.086416, 0, 0, 0, 1, 1,
-1.129522, 0.774421, -0.6300551, 0, 0, 0, 1, 1,
-1.126269, -1.132234, -0.9356098, 0, 0, 0, 1, 1,
-1.119386, 0.4291083, -0.4464507, 0, 0, 0, 1, 1,
-1.115669, -1.102614, -4.153806, 1, 1, 1, 1, 1,
-1.114246, 1.257413, -0.913369, 1, 1, 1, 1, 1,
-1.104291, -0.4182647, -0.6772301, 1, 1, 1, 1, 1,
-1.102088, -0.1158711, -1.868123, 1, 1, 1, 1, 1,
-1.090546, -0.70183, -2.847055, 1, 1, 1, 1, 1,
-1.079084, -1.722098, -1.426529, 1, 1, 1, 1, 1,
-1.074709, -0.8213617, -4.498321, 1, 1, 1, 1, 1,
-1.061625, 0.1806273, -1.80005, 1, 1, 1, 1, 1,
-1.059879, 0.5180912, -1.222141, 1, 1, 1, 1, 1,
-1.051329, 0.3646686, -1.648998, 1, 1, 1, 1, 1,
-1.049182, -0.4735658, -0.5537546, 1, 1, 1, 1, 1,
-1.049002, -0.5217036, -3.297622, 1, 1, 1, 1, 1,
-1.04893, 1.078889, -1.630178, 1, 1, 1, 1, 1,
-1.046313, 1.59377, -0.6539267, 1, 1, 1, 1, 1,
-1.035666, 0.7937658, -0.344238, 1, 1, 1, 1, 1,
-1.027458, 1.81936, -0.7050909, 0, 0, 1, 1, 1,
-1.025986, 0.2777918, 0.127261, 1, 0, 0, 1, 1,
-1.023307, -0.8390947, -4.07776, 1, 0, 0, 1, 1,
-1.019916, -0.5411511, -0.3255896, 1, 0, 0, 1, 1,
-1.018237, -0.2690845, -2.806391, 1, 0, 0, 1, 1,
-1.016926, 1.197736, -1.815577, 1, 0, 0, 1, 1,
-1.012523, -1.46442, -1.511848, 0, 0, 0, 1, 1,
-0.9993984, 2.153362, -2.288218, 0, 0, 0, 1, 1,
-0.997269, -0.4374027, -1.815927, 0, 0, 0, 1, 1,
-0.9893018, 0.5760083, -1.290076, 0, 0, 0, 1, 1,
-0.9847388, 0.05822491, -1.687992, 0, 0, 0, 1, 1,
-0.9776884, 0.7162016, -0.5915536, 0, 0, 0, 1, 1,
-0.9771585, -1.170304, -2.538203, 0, 0, 0, 1, 1,
-0.975201, 1.088341, -0.5767656, 1, 1, 1, 1, 1,
-0.9742557, -0.8468659, -3.914821, 1, 1, 1, 1, 1,
-0.9742047, -0.4850467, -1.071342, 1, 1, 1, 1, 1,
-0.965592, 0.6829242, -1.466269, 1, 1, 1, 1, 1,
-0.9650738, -1.43966, -2.146269, 1, 1, 1, 1, 1,
-0.9631821, 2.201685, 0.8052505, 1, 1, 1, 1, 1,
-0.9603533, -0.7874332, -0.5528894, 1, 1, 1, 1, 1,
-0.9506565, 0.01946085, -1.765149, 1, 1, 1, 1, 1,
-0.9496366, -1.338162, -3.793939, 1, 1, 1, 1, 1,
-0.9494892, -0.05069274, -0.6908033, 1, 1, 1, 1, 1,
-0.9477941, 0.2428848, -0.808652, 1, 1, 1, 1, 1,
-0.9429966, 1.232234, -0.5712919, 1, 1, 1, 1, 1,
-0.9427191, 0.025386, -0.2449445, 1, 1, 1, 1, 1,
-0.934849, 0.06259536, 0.4010305, 1, 1, 1, 1, 1,
-0.9331881, -0.1688077, -1.356622, 1, 1, 1, 1, 1,
-0.9252084, 1.706395, 0.6273379, 0, 0, 1, 1, 1,
-0.9160001, -0.6187668, -2.113655, 1, 0, 0, 1, 1,
-0.9154486, 0.9542108, -0.751448, 1, 0, 0, 1, 1,
-0.9118077, 0.4187109, -1.642948, 1, 0, 0, 1, 1,
-0.9111058, -0.1944487, -2.620029, 1, 0, 0, 1, 1,
-0.9109578, 1.230989, -0.7434164, 1, 0, 0, 1, 1,
-0.910515, -0.8706863, -1.987948, 0, 0, 0, 1, 1,
-0.9064913, -0.644506, -1.963393, 0, 0, 0, 1, 1,
-0.9061487, 1.429408, 0.1386323, 0, 0, 0, 1, 1,
-0.9005145, 0.9190791, -0.5626507, 0, 0, 0, 1, 1,
-0.8960442, 0.02680122, -0.6187076, 0, 0, 0, 1, 1,
-0.8954161, -1.5772, -0.8765097, 0, 0, 0, 1, 1,
-0.894852, 0.5584254, 0.4275884, 0, 0, 0, 1, 1,
-0.887582, 1.485744, 0.008473502, 1, 1, 1, 1, 1,
-0.8843684, 0.3086992, 0.04554037, 1, 1, 1, 1, 1,
-0.884103, 1.535264, -1.680807, 1, 1, 1, 1, 1,
-0.8810395, 0.6865121, -1.700175, 1, 1, 1, 1, 1,
-0.8779849, -0.9953173, -2.432438, 1, 1, 1, 1, 1,
-0.8761676, 1.175703, -0.1509845, 1, 1, 1, 1, 1,
-0.8677876, 0.6049687, -1.81058, 1, 1, 1, 1, 1,
-0.8646876, 0.3009781, -1.434875, 1, 1, 1, 1, 1,
-0.8507777, -0.8110433, -1.538806, 1, 1, 1, 1, 1,
-0.8473194, 0.6594163, -3.030064, 1, 1, 1, 1, 1,
-0.8462416, -1.510319, -3.397617, 1, 1, 1, 1, 1,
-0.8462303, 1.493318, 0.1466413, 1, 1, 1, 1, 1,
-0.8421125, -1.242803, -3.693023, 1, 1, 1, 1, 1,
-0.8398353, -0.88523, -2.601464, 1, 1, 1, 1, 1,
-0.8315051, -0.9982092, -3.042292, 1, 1, 1, 1, 1,
-0.8298376, 0.9359953, -1.54011, 0, 0, 1, 1, 1,
-0.8267308, -0.5549797, -1.176141, 1, 0, 0, 1, 1,
-0.8188452, -0.2045129, 1.120175, 1, 0, 0, 1, 1,
-0.8167753, 0.4349086, -2.81843, 1, 0, 0, 1, 1,
-0.8137619, 0.5696284, -1.481536, 1, 0, 0, 1, 1,
-0.8013862, 1.210598, -2.408318, 1, 0, 0, 1, 1,
-0.7805272, -0.08359544, -2.115421, 0, 0, 0, 1, 1,
-0.7761293, -1.28894, -3.475462, 0, 0, 0, 1, 1,
-0.7740296, 0.5217822, -2.035883, 0, 0, 0, 1, 1,
-0.7733443, 1.986969, -1.710809, 0, 0, 0, 1, 1,
-0.7733331, -0.5864531, -2.843446, 0, 0, 0, 1, 1,
-0.7724369, -0.2309137, -3.289433, 0, 0, 0, 1, 1,
-0.7703716, -0.7032897, -0.7625352, 0, 0, 0, 1, 1,
-0.7700664, 0.5525432, -1.028931, 1, 1, 1, 1, 1,
-0.7564983, -0.2593543, -2.242064, 1, 1, 1, 1, 1,
-0.7376351, -0.07715929, -0.2276852, 1, 1, 1, 1, 1,
-0.736605, -2.405755, -1.434323, 1, 1, 1, 1, 1,
-0.7343131, 0.6768004, 0.4735822, 1, 1, 1, 1, 1,
-0.7305859, 1.22968, -1.07707, 1, 1, 1, 1, 1,
-0.7203977, 0.5009282, -1.52617, 1, 1, 1, 1, 1,
-0.7181407, -2.128509, -1.475505, 1, 1, 1, 1, 1,
-0.7174566, -1.165831, -2.335943, 1, 1, 1, 1, 1,
-0.7113439, -1.0091, -4.23188, 1, 1, 1, 1, 1,
-0.701856, 0.5449537, -2.080825, 1, 1, 1, 1, 1,
-0.7000784, -1.00157, -2.62322, 1, 1, 1, 1, 1,
-0.6962132, -0.6809699, -3.610725, 1, 1, 1, 1, 1,
-0.6947436, 0.07363014, -1.290056, 1, 1, 1, 1, 1,
-0.6935642, 0.1361258, -1.060399, 1, 1, 1, 1, 1,
-0.6854562, -0.1630319, -0.3969487, 0, 0, 1, 1, 1,
-0.6840188, -1.066296, -1.249607, 1, 0, 0, 1, 1,
-0.6823086, -0.1932271, -2.853564, 1, 0, 0, 1, 1,
-0.6792969, -0.7767451, -4.265894, 1, 0, 0, 1, 1,
-0.6775954, 0.3330664, -1.52185, 1, 0, 0, 1, 1,
-0.6773388, -0.4468174, -1.277513, 1, 0, 0, 1, 1,
-0.6748818, -0.7159361, -3.210216, 0, 0, 0, 1, 1,
-0.6746483, 0.367557, -0.6608287, 0, 0, 0, 1, 1,
-0.6715796, 1.584554, 0.2682326, 0, 0, 0, 1, 1,
-0.6694846, -0.9179181, -2.863282, 0, 0, 0, 1, 1,
-0.6686752, -1.984337, -3.650779, 0, 0, 0, 1, 1,
-0.666779, 1.216329, -0.05181849, 0, 0, 0, 1, 1,
-0.6649695, 0.7689456, -1.111611, 0, 0, 0, 1, 1,
-0.6644398, 1.135337, 1.293066, 1, 1, 1, 1, 1,
-0.6642854, 1.536312, -0.4484962, 1, 1, 1, 1, 1,
-0.663486, 2.443016, 1.023274, 1, 1, 1, 1, 1,
-0.660827, -1.472497, -1.269889, 1, 1, 1, 1, 1,
-0.6604058, -1.47347, -2.710906, 1, 1, 1, 1, 1,
-0.6599418, -1.418627, -3.953466, 1, 1, 1, 1, 1,
-0.6578504, 0.2585244, -2.068491, 1, 1, 1, 1, 1,
-0.6564047, 0.6105675, -2.48585, 1, 1, 1, 1, 1,
-0.6563327, -1.313246, -2.749567, 1, 1, 1, 1, 1,
-0.6555984, -1.10092, -3.622412, 1, 1, 1, 1, 1,
-0.6511893, -0.1464512, 0.07217883, 1, 1, 1, 1, 1,
-0.6491749, -1.860181, -2.449535, 1, 1, 1, 1, 1,
-0.6452416, 2.361129, 0.1215244, 1, 1, 1, 1, 1,
-0.6443127, 1.037107, -1.987289, 1, 1, 1, 1, 1,
-0.6428368, -0.4497717, -2.041171, 1, 1, 1, 1, 1,
-0.6316876, 0.3747987, 0.1657656, 0, 0, 1, 1, 1,
-0.6262415, -0.01360226, -0.3056397, 1, 0, 0, 1, 1,
-0.6253647, 0.6553664, -1.682561, 1, 0, 0, 1, 1,
-0.6168262, 0.7107442, -0.2499666, 1, 0, 0, 1, 1,
-0.6166626, 0.1420354, -1.386934, 1, 0, 0, 1, 1,
-0.6136402, -0.05328412, -0.1820047, 1, 0, 0, 1, 1,
-0.6101911, 1.909803, -0.3449485, 0, 0, 0, 1, 1,
-0.608865, 0.9154298, 0.6960773, 0, 0, 0, 1, 1,
-0.6084974, 0.6582685, -0.5929357, 0, 0, 0, 1, 1,
-0.6075425, -0.4859655, -1.477084, 0, 0, 0, 1, 1,
-0.5942034, -1.291713, -1.753197, 0, 0, 0, 1, 1,
-0.5908175, -1.163572, -3.158316, 0, 0, 0, 1, 1,
-0.5906015, -0.8129277, -2.355726, 0, 0, 0, 1, 1,
-0.5895717, -0.6469433, -1.471646, 1, 1, 1, 1, 1,
-0.5845311, 0.02238812, -2.753061, 1, 1, 1, 1, 1,
-0.583551, -0.1085222, -0.427466, 1, 1, 1, 1, 1,
-0.5763552, 0.3135953, -2.31372, 1, 1, 1, 1, 1,
-0.5755503, 0.6063992, -1.324872, 1, 1, 1, 1, 1,
-0.5708837, -0.507486, -0.8310677, 1, 1, 1, 1, 1,
-0.5600327, -0.0790168, -0.7304913, 1, 1, 1, 1, 1,
-0.5551921, -1.14279, -2.677694, 1, 1, 1, 1, 1,
-0.5514591, 0.9125769, 0.7957112, 1, 1, 1, 1, 1,
-0.5409988, 0.8908327, -1.349455, 1, 1, 1, 1, 1,
-0.5404191, 2.447178, 0.05665897, 1, 1, 1, 1, 1,
-0.5383487, -0.8594867, -3.532671, 1, 1, 1, 1, 1,
-0.5354975, 0.4102518, -0.8023717, 1, 1, 1, 1, 1,
-0.5308757, 1.340371, -1.427794, 1, 1, 1, 1, 1,
-0.5276281, -2.22573, -2.620262, 1, 1, 1, 1, 1,
-0.5267347, 0.4985925, -1.235885, 0, 0, 1, 1, 1,
-0.5207028, 0.6205251, -1.42602, 1, 0, 0, 1, 1,
-0.5198359, -0.1546127, -0.5751764, 1, 0, 0, 1, 1,
-0.5174592, 1.937781, -0.5860166, 1, 0, 0, 1, 1,
-0.5129813, -1.945612, -1.137867, 1, 0, 0, 1, 1,
-0.508918, -0.09463684, -0.2911762, 1, 0, 0, 1, 1,
-0.5088535, 1.443379, -1.06167, 0, 0, 0, 1, 1,
-0.5002419, 0.7177817, 2.134057, 0, 0, 0, 1, 1,
-0.499482, -1.270204, -4.138766, 0, 0, 0, 1, 1,
-0.4991698, 0.3557856, -1.878708, 0, 0, 0, 1, 1,
-0.4987223, -0.937311, -2.093197, 0, 0, 0, 1, 1,
-0.4908851, 1.301668, -0.4329019, 0, 0, 0, 1, 1,
-0.4898358, -0.3203828, -2.568518, 0, 0, 0, 1, 1,
-0.4873537, 1.946977, -1.995494, 1, 1, 1, 1, 1,
-0.4872512, -1.291055, -0.8519964, 1, 1, 1, 1, 1,
-0.4861358, 0.987469, -1.012877, 1, 1, 1, 1, 1,
-0.4838484, 0.3619647, -0.6520692, 1, 1, 1, 1, 1,
-0.4810472, 1.912008, 1.220055, 1, 1, 1, 1, 1,
-0.4774563, -0.06121108, -1.074757, 1, 1, 1, 1, 1,
-0.4773171, 0.161981, -2.215409, 1, 1, 1, 1, 1,
-0.4758352, 0.3591412, -2.700837, 1, 1, 1, 1, 1,
-0.4751609, -0.7815219, -3.832536, 1, 1, 1, 1, 1,
-0.4747566, 0.3374177, -0.5816252, 1, 1, 1, 1, 1,
-0.4693943, -0.85084, -1.915278, 1, 1, 1, 1, 1,
-0.4685317, 1.749815, -0.06426851, 1, 1, 1, 1, 1,
-0.461689, 1.290056, -0.8827504, 1, 1, 1, 1, 1,
-0.4609954, -0.8097045, -2.621859, 1, 1, 1, 1, 1,
-0.4599112, 0.8828031, 0.3389199, 1, 1, 1, 1, 1,
-0.4557427, -1.852462, -2.50274, 0, 0, 1, 1, 1,
-0.4483756, -0.3131391, -1.354788, 1, 0, 0, 1, 1,
-0.4472764, -0.8737338, -4.572981, 1, 0, 0, 1, 1,
-0.4454892, -0.1209958, -1.024691, 1, 0, 0, 1, 1,
-0.4449876, -1.678464, -3.8266, 1, 0, 0, 1, 1,
-0.4425952, 1.439058, -0.657168, 1, 0, 0, 1, 1,
-0.4325835, -1.620461, -3.528614, 0, 0, 0, 1, 1,
-0.4266411, -0.22133, -3.702632, 0, 0, 0, 1, 1,
-0.4263236, -1.251954, -4.228596, 0, 0, 0, 1, 1,
-0.423655, 2.100246, -1.8038, 0, 0, 0, 1, 1,
-0.4145267, 0.5036121, -2.106222, 0, 0, 0, 1, 1,
-0.4144836, 0.6139039, -1.960463, 0, 0, 0, 1, 1,
-0.4102145, -0.08719552, -2.365442, 0, 0, 0, 1, 1,
-0.4095416, -1.991396, -2.951756, 1, 1, 1, 1, 1,
-0.407477, 0.6743063, 1.216276, 1, 1, 1, 1, 1,
-0.4030981, -0.9016305, -1.486059, 1, 1, 1, 1, 1,
-0.3974186, 1.353738, -0.3319764, 1, 1, 1, 1, 1,
-0.3963377, 0.5811483, -1.830165, 1, 1, 1, 1, 1,
-0.3919673, -0.9800487, -4.083411, 1, 1, 1, 1, 1,
-0.391031, 0.5887254, -0.347497, 1, 1, 1, 1, 1,
-0.3898619, 0.3248322, -0.97607, 1, 1, 1, 1, 1,
-0.3885078, 0.8045673, -1.261482, 1, 1, 1, 1, 1,
-0.3855549, -0.4709263, -2.942899, 1, 1, 1, 1, 1,
-0.3842987, 0.1311313, -0.7559435, 1, 1, 1, 1, 1,
-0.3824867, -0.4939916, -3.645002, 1, 1, 1, 1, 1,
-0.3823438, -0.4593334, -1.826894, 1, 1, 1, 1, 1,
-0.3775237, 0.9418851, -0.4123516, 1, 1, 1, 1, 1,
-0.374646, -0.502383, -1.697799, 1, 1, 1, 1, 1,
-0.3737254, 0.3875226, 0.09561118, 0, 0, 1, 1, 1,
-0.3701203, -0.01494251, -3.023736, 1, 0, 0, 1, 1,
-0.3686601, 0.8093446, -0.151366, 1, 0, 0, 1, 1,
-0.366533, 1.357289, -1.486319, 1, 0, 0, 1, 1,
-0.3643439, 0.02776484, -1.909156, 1, 0, 0, 1, 1,
-0.3588652, 0.8120658, -0.7676949, 1, 0, 0, 1, 1,
-0.358847, -0.5401176, -1.580233, 0, 0, 0, 1, 1,
-0.3586681, 0.3702688, 1.467706, 0, 0, 0, 1, 1,
-0.3573844, 0.5300686, -0.6779395, 0, 0, 0, 1, 1,
-0.3547779, 0.9599912, 0.3060286, 0, 0, 0, 1, 1,
-0.3505373, -1.238626, -3.745385, 0, 0, 0, 1, 1,
-0.3486987, -0.6441474, -2.58409, 0, 0, 0, 1, 1,
-0.3478625, -0.8740159, -2.357713, 0, 0, 0, 1, 1,
-0.3413206, 0.3293379, -1.096087, 1, 1, 1, 1, 1,
-0.3384184, -2.191954, -2.615856, 1, 1, 1, 1, 1,
-0.3317438, -1.641932, -3.148532, 1, 1, 1, 1, 1,
-0.3296834, -1.325237, -4.131712, 1, 1, 1, 1, 1,
-0.3230263, 0.3015523, -1.209166, 1, 1, 1, 1, 1,
-0.3210343, 1.731626, -0.8478833, 1, 1, 1, 1, 1,
-0.3205967, 0.7016122, -1.897366, 1, 1, 1, 1, 1,
-0.3189257, -0.597622, -3.855147, 1, 1, 1, 1, 1,
-0.3182467, 1.975343, 1.25348, 1, 1, 1, 1, 1,
-0.3151657, -0.09522696, -2.326108, 1, 1, 1, 1, 1,
-0.3148141, 1.372378, -0.115846, 1, 1, 1, 1, 1,
-0.3129201, -0.0720969, -1.346164, 1, 1, 1, 1, 1,
-0.3122478, 1.161559, -2.139835, 1, 1, 1, 1, 1,
-0.3101918, 0.5041023, -2.316895, 1, 1, 1, 1, 1,
-0.3091765, 0.4452463, -1.433752, 1, 1, 1, 1, 1,
-0.3091041, -1.231434, -3.192909, 0, 0, 1, 1, 1,
-0.3083748, 1.485815, -0.450315, 1, 0, 0, 1, 1,
-0.3059264, -1.063474, -1.967424, 1, 0, 0, 1, 1,
-0.2963828, 0.3292529, 0.9078587, 1, 0, 0, 1, 1,
-0.2879409, 0.8167794, -0.404516, 1, 0, 0, 1, 1,
-0.2848671, -0.07309452, -2.818073, 1, 0, 0, 1, 1,
-0.2758122, -0.9918325, -4.066619, 0, 0, 0, 1, 1,
-0.2755049, -0.1558176, -2.99315, 0, 0, 0, 1, 1,
-0.2736689, -0.9484273, -1.560466, 0, 0, 0, 1, 1,
-0.2720335, 1.216007, -0.4832576, 0, 0, 0, 1, 1,
-0.2702958, -0.4063283, -2.913985, 0, 0, 0, 1, 1,
-0.2679538, -0.58868, -5.201924, 0, 0, 0, 1, 1,
-0.2639098, 0.2416804, 0.4195814, 0, 0, 0, 1, 1,
-0.263634, 1.411644, 0.06324431, 1, 1, 1, 1, 1,
-0.2635577, -0.9659252, -1.808586, 1, 1, 1, 1, 1,
-0.2603652, -1.77417, -4.697062, 1, 1, 1, 1, 1,
-0.2585314, 1.733321, -1.41181, 1, 1, 1, 1, 1,
-0.2577257, 0.7419821, 0.4124297, 1, 1, 1, 1, 1,
-0.2557984, 0.02068714, -0.1847651, 1, 1, 1, 1, 1,
-0.254789, -1.935065, -1.8376, 1, 1, 1, 1, 1,
-0.2533683, 1.656879, 1.507026, 1, 1, 1, 1, 1,
-0.2451051, -1.30135, -1.511179, 1, 1, 1, 1, 1,
-0.2428799, -0.03426949, -1.15474, 1, 1, 1, 1, 1,
-0.2345913, -0.199009, -4.091731, 1, 1, 1, 1, 1,
-0.2344391, 0.5964733, -1.435475, 1, 1, 1, 1, 1,
-0.2306267, -1.070092, -3.523482, 1, 1, 1, 1, 1,
-0.2289292, 0.6319199, 1.77582, 1, 1, 1, 1, 1,
-0.2281779, -0.2778639, -3.894991, 1, 1, 1, 1, 1,
-0.2172626, 0.9496496, 0.08939825, 0, 0, 1, 1, 1,
-0.2167536, -0.7445996, -3.460481, 1, 0, 0, 1, 1,
-0.2167134, 1.758485, -1.952041, 1, 0, 0, 1, 1,
-0.2157123, 0.8201868, -0.3975753, 1, 0, 0, 1, 1,
-0.2144451, -0.3745425, -2.533084, 1, 0, 0, 1, 1,
-0.2136595, 0.6031979, 0.1370824, 1, 0, 0, 1, 1,
-0.2101968, 1.617745, 0.3785383, 0, 0, 0, 1, 1,
-0.209872, -0.0006270701, -1.712753, 0, 0, 0, 1, 1,
-0.2095303, -0.06695594, -1.618793, 0, 0, 0, 1, 1,
-0.2063849, -0.5380305, -2.944225, 0, 0, 0, 1, 1,
-0.2051467, -0.0626621, -0.8062568, 0, 0, 0, 1, 1,
-0.2011639, -1.370841, -4.034597, 0, 0, 0, 1, 1,
-0.1973549, -0.3864239, -2.677407, 0, 0, 0, 1, 1,
-0.1972105, 0.705393, -1.029739, 1, 1, 1, 1, 1,
-0.1965076, 2.005149, -1.72597, 1, 1, 1, 1, 1,
-0.1917778, 0.2084237, -2.741106, 1, 1, 1, 1, 1,
-0.1903935, 1.633544, 1.135015, 1, 1, 1, 1, 1,
-0.1896383, -0.4026982, -2.334145, 1, 1, 1, 1, 1,
-0.1838882, -0.4740455, -2.955715, 1, 1, 1, 1, 1,
-0.1826898, 1.003203, -1.536061, 1, 1, 1, 1, 1,
-0.181509, -0.09732017, -0.1544206, 1, 1, 1, 1, 1,
-0.1768995, 0.3577487, -0.7326619, 1, 1, 1, 1, 1,
-0.1735178, -0.2078245, -2.481585, 1, 1, 1, 1, 1,
-0.1659829, -1.413092, -2.853853, 1, 1, 1, 1, 1,
-0.1655515, -1.841632, -1.631414, 1, 1, 1, 1, 1,
-0.1612922, 0.4982427, -1.324694, 1, 1, 1, 1, 1,
-0.1596458, -0.4328928, -4.064064, 1, 1, 1, 1, 1,
-0.1508447, -0.2236065, -3.113272, 1, 1, 1, 1, 1,
-0.1487439, -0.6014434, -1.973577, 0, 0, 1, 1, 1,
-0.1480319, -1.131358, -3.144525, 1, 0, 0, 1, 1,
-0.1460308, -1.001351, -1.949559, 1, 0, 0, 1, 1,
-0.144871, -0.4083931, -3.412118, 1, 0, 0, 1, 1,
-0.1408512, -0.7684396, -1.153553, 1, 0, 0, 1, 1,
-0.1354679, -0.4918249, -3.078316, 1, 0, 0, 1, 1,
-0.1353637, -0.9399121, -4.295672, 0, 0, 0, 1, 1,
-0.1346011, -1.151518, -3.733201, 0, 0, 0, 1, 1,
-0.1309189, 2.074657, 0.5495602, 0, 0, 0, 1, 1,
-0.1301613, -1.646404, -2.815612, 0, 0, 0, 1, 1,
-0.1293262, 1.286247, 0.3162469, 0, 0, 0, 1, 1,
-0.1282966, 0.8032976, 0.7641014, 0, 0, 0, 1, 1,
-0.1236992, -1.919716, -3.674008, 0, 0, 0, 1, 1,
-0.1220792, 1.31809, 2.236389, 1, 1, 1, 1, 1,
-0.1186439, 0.7465693, 0.04933282, 1, 1, 1, 1, 1,
-0.115381, -0.4365832, -0.7544357, 1, 1, 1, 1, 1,
-0.1130455, -1.753968, -4.532672, 1, 1, 1, 1, 1,
-0.1107345, 0.981406, 0.3655101, 1, 1, 1, 1, 1,
-0.1100402, -0.8834332, -3.559828, 1, 1, 1, 1, 1,
-0.109286, -0.3606837, -2.241155, 1, 1, 1, 1, 1,
-0.1078378, -0.2464401, -2.652473, 1, 1, 1, 1, 1,
-0.1068157, -0.5589929, -3.132976, 1, 1, 1, 1, 1,
-0.08802763, -0.4347745, -3.918744, 1, 1, 1, 1, 1,
-0.07903033, 0.9357668, -0.2974741, 1, 1, 1, 1, 1,
-0.0784776, -0.226116, -0.6960452, 1, 1, 1, 1, 1,
-0.07234219, -1.026974, -1.964148, 1, 1, 1, 1, 1,
-0.07200406, -0.369984, -5.345809, 1, 1, 1, 1, 1,
-0.06748441, -1.745324, -4.202775, 1, 1, 1, 1, 1,
-0.06662969, 0.2576583, -0.7959017, 0, 0, 1, 1, 1,
-0.06560899, -1.683759, -1.142996, 1, 0, 0, 1, 1,
-0.06174004, -0.7099817, -4.717771, 1, 0, 0, 1, 1,
-0.06077559, 0.702638, -1.997529, 1, 0, 0, 1, 1,
-0.05753868, 0.1866783, -1.266135, 1, 0, 0, 1, 1,
-0.05436747, -0.5753028, -6.124156, 1, 0, 0, 1, 1,
-0.04625405, -0.4012121, -2.222245, 0, 0, 0, 1, 1,
-0.04257932, 0.252435, -0.9399024, 0, 0, 0, 1, 1,
-0.04096918, -0.2789122, -3.388145, 0, 0, 0, 1, 1,
-0.03906894, 0.548668, 0.4154907, 0, 0, 0, 1, 1,
-0.03694275, 0.8508151, -1.124265, 0, 0, 0, 1, 1,
-0.03575372, -1.53575, -2.922022, 0, 0, 0, 1, 1,
-0.03510765, -0.3684014, -3.816371, 0, 0, 0, 1, 1,
-0.03469646, -1.283319, -3.414215, 1, 1, 1, 1, 1,
-0.0342562, -0.1386731, -3.694107, 1, 1, 1, 1, 1,
-0.03090947, 0.5250613, -1.052468, 1, 1, 1, 1, 1,
-0.03012011, -0.9014696, -2.789108, 1, 1, 1, 1, 1,
-0.02629619, 1.193798, -0.9762933, 1, 1, 1, 1, 1,
-0.02542504, 1.208278, -1.108197, 1, 1, 1, 1, 1,
-0.02456776, 0.6828339, 1.063835, 1, 1, 1, 1, 1,
-0.01779935, 0.5989951, -0.1082503, 1, 1, 1, 1, 1,
-0.01685125, -0.1763045, -1.148006, 1, 1, 1, 1, 1,
-0.01484779, 0.233331, 0.1242525, 1, 1, 1, 1, 1,
-0.01301358, 1.168578, 0.8440638, 1, 1, 1, 1, 1,
-0.01280656, -0.09696304, -1.125212, 1, 1, 1, 1, 1,
-0.01256043, -1.074974, -3.101757, 1, 1, 1, 1, 1,
-0.009738047, -0.9125366, -2.92601, 1, 1, 1, 1, 1,
-0.008521445, -1.35015, -2.871039, 1, 1, 1, 1, 1,
-0.00647948, -1.888606, -3.311324, 0, 0, 1, 1, 1,
-0.005125006, -1.14226, -3.071317, 1, 0, 0, 1, 1,
-0.005118337, -1.471061, -2.006075, 1, 0, 0, 1, 1,
-0.001507894, -2.33475, -1.355174, 1, 0, 0, 1, 1,
0.0002173455, 0.311929, 0.3451133, 1, 0, 0, 1, 1,
0.002072684, -0.9566805, 2.982282, 1, 0, 0, 1, 1,
0.007419467, 0.559082, 0.1134397, 0, 0, 0, 1, 1,
0.008548368, -0.1118522, 3.431677, 0, 0, 0, 1, 1,
0.01276895, 0.1896534, 0.1223141, 0, 0, 0, 1, 1,
0.01852126, 0.8404395, 0.6274623, 0, 0, 0, 1, 1,
0.02115645, -1.226981, 3.142034, 0, 0, 0, 1, 1,
0.02153957, -1.496737, 5.227759, 0, 0, 0, 1, 1,
0.02266173, 0.4137968, 0.2940511, 0, 0, 0, 1, 1,
0.02379756, 0.670814, -0.1317465, 1, 1, 1, 1, 1,
0.02402608, 0.005559195, 0.3356842, 1, 1, 1, 1, 1,
0.0273269, 0.4746884, 1.065274, 1, 1, 1, 1, 1,
0.02835608, -0.1479647, 4.606414, 1, 1, 1, 1, 1,
0.03403468, 1.110285, 1.36772, 1, 1, 1, 1, 1,
0.03456384, 0.564194, 0.2850967, 1, 1, 1, 1, 1,
0.03488869, 0.8315396, 0.8388, 1, 1, 1, 1, 1,
0.03909923, 1.195369, -0.8881816, 1, 1, 1, 1, 1,
0.04070288, -0.5058052, 2.441535, 1, 1, 1, 1, 1,
0.04260337, -1.478959, 3.013154, 1, 1, 1, 1, 1,
0.04507021, -1.110772, 3.151424, 1, 1, 1, 1, 1,
0.04639138, -0.7787586, 1.093094, 1, 1, 1, 1, 1,
0.05087381, 0.9016614, 0.3926347, 1, 1, 1, 1, 1,
0.05199539, -0.8044496, 2.85911, 1, 1, 1, 1, 1,
0.05363571, -0.9129953, 3.150893, 1, 1, 1, 1, 1,
0.05380417, -0.4760674, 3.008689, 0, 0, 1, 1, 1,
0.06392229, 0.3906232, 0.5544931, 1, 0, 0, 1, 1,
0.07311567, -1.520756, 4.526586, 1, 0, 0, 1, 1,
0.07582581, -0.5789257, 3.891641, 1, 0, 0, 1, 1,
0.076148, -0.6302773, 3.730628, 1, 0, 0, 1, 1,
0.07863863, 0.4212947, 0.2828481, 1, 0, 0, 1, 1,
0.08025305, -0.2984214, 2.924839, 0, 0, 0, 1, 1,
0.08266936, 0.3581214, -0.2926141, 0, 0, 0, 1, 1,
0.08753937, -1.657708, 3.501476, 0, 0, 0, 1, 1,
0.09410322, 1.404831, 1.31512, 0, 0, 0, 1, 1,
0.09542812, -0.9325986, 2.289713, 0, 0, 0, 1, 1,
0.09712713, -1.240473, 4.848662, 0, 0, 0, 1, 1,
0.09970674, -0.3776552, 2.12751, 0, 0, 0, 1, 1,
0.1003539, -0.1248879, 2.096452, 1, 1, 1, 1, 1,
0.1003706, 0.8773025, 0.423764, 1, 1, 1, 1, 1,
0.100584, -0.911285, 2.790402, 1, 1, 1, 1, 1,
0.1036024, -0.809742, 2.455342, 1, 1, 1, 1, 1,
0.106955, 0.7856493, 0.5084822, 1, 1, 1, 1, 1,
0.1077532, -0.0324173, 0.6795816, 1, 1, 1, 1, 1,
0.1105517, -1.955396, 4.989039, 1, 1, 1, 1, 1,
0.1110206, -0.5191696, 1.679327, 1, 1, 1, 1, 1,
0.1143711, 0.1159855, 0.8884159, 1, 1, 1, 1, 1,
0.1175678, 0.1279155, 0.5188218, 1, 1, 1, 1, 1,
0.1234845, 0.2903791, 0.3161758, 1, 1, 1, 1, 1,
0.1264031, 0.2928711, 0.27551, 1, 1, 1, 1, 1,
0.1273389, -0.6898462, 2.932876, 1, 1, 1, 1, 1,
0.1275311, -0.1767789, 0.5807261, 1, 1, 1, 1, 1,
0.1311537, 2.215967, -2.038774, 1, 1, 1, 1, 1,
0.1320608, 0.2450142, 0.6842307, 0, 0, 1, 1, 1,
0.132726, 0.9872196, -0.1657968, 1, 0, 0, 1, 1,
0.1423679, -0.2035796, 1.583627, 1, 0, 0, 1, 1,
0.1428479, -0.7191994, 1.122474, 1, 0, 0, 1, 1,
0.1485565, -2.398108, 2.261535, 1, 0, 0, 1, 1,
0.1492437, -0.6385906, 2.184797, 1, 0, 0, 1, 1,
0.1498961, 1.020143, 0.2962924, 0, 0, 0, 1, 1,
0.1512282, 0.8727973, 0.2997126, 0, 0, 0, 1, 1,
0.1544853, 0.5782401, -0.9744646, 0, 0, 0, 1, 1,
0.1566767, 1.4059, 1.190921, 0, 0, 0, 1, 1,
0.1620787, 0.9743007, 0.8487335, 0, 0, 0, 1, 1,
0.1644546, -0.8775741, 3.527895, 0, 0, 0, 1, 1,
0.1661465, 0.8044202, 0.8917491, 0, 0, 0, 1, 1,
0.1670722, 0.1631699, 0.934147, 1, 1, 1, 1, 1,
0.1673789, 0.3510308, -0.3265806, 1, 1, 1, 1, 1,
0.1706905, -0.5451818, 2.561533, 1, 1, 1, 1, 1,
0.1711753, -0.6040386, 2.807568, 1, 1, 1, 1, 1,
0.1815305, -0.7609966, 2.289371, 1, 1, 1, 1, 1,
0.1840121, -0.1568746, 2.724641, 1, 1, 1, 1, 1,
0.1887509, 0.5332761, -0.4111615, 1, 1, 1, 1, 1,
0.191169, -1.26845, 3.155153, 1, 1, 1, 1, 1,
0.1952682, 1.380514, -0.976731, 1, 1, 1, 1, 1,
0.1971178, -0.5084115, 2.151475, 1, 1, 1, 1, 1,
0.1993281, -0.4726707, 2.985667, 1, 1, 1, 1, 1,
0.2064041, 0.2218756, 0.3276757, 1, 1, 1, 1, 1,
0.2135404, 0.6347842, -0.4966247, 1, 1, 1, 1, 1,
0.2188085, -0.4227603, 2.11167, 1, 1, 1, 1, 1,
0.2216381, -0.1954394, 2.806223, 1, 1, 1, 1, 1,
0.2238166, 0.5117489, 0.7364216, 0, 0, 1, 1, 1,
0.2279031, -0.4457284, 1.434719, 1, 0, 0, 1, 1,
0.2301954, 0.3259689, 2.725596, 1, 0, 0, 1, 1,
0.2315616, 2.654431, -1.593101, 1, 0, 0, 1, 1,
0.2331609, -0.8699948, 2.438739, 1, 0, 0, 1, 1,
0.2333026, 0.2753229, 1.579948, 1, 0, 0, 1, 1,
0.2336689, 0.7077086, 0.07958369, 0, 0, 0, 1, 1,
0.2372899, 0.1733589, 1.41353, 0, 0, 0, 1, 1,
0.2374442, -0.1304851, 3.200763, 0, 0, 0, 1, 1,
0.2383223, 0.8273579, -0.123606, 0, 0, 0, 1, 1,
0.2422885, -0.01831567, 1.040516, 0, 0, 0, 1, 1,
0.2458676, -1.043973, 2.938108, 0, 0, 0, 1, 1,
0.2461936, 0.04197623, 0.9913403, 0, 0, 0, 1, 1,
0.2493019, -1.130563, 2.551053, 1, 1, 1, 1, 1,
0.2512675, -1.30695, 3.793128, 1, 1, 1, 1, 1,
0.2538455, -0.06377879, 1.486811, 1, 1, 1, 1, 1,
0.2594512, -0.3393387, 2.32184, 1, 1, 1, 1, 1,
0.2645979, 0.03882642, 1.730506, 1, 1, 1, 1, 1,
0.2668018, 2.731092, -0.4722901, 1, 1, 1, 1, 1,
0.2697946, -0.7893327, 3.233093, 1, 1, 1, 1, 1,
0.2715908, 1.299627, 1.181112, 1, 1, 1, 1, 1,
0.2748413, 1.334442, 0.8199716, 1, 1, 1, 1, 1,
0.2755417, -0.9405037, 1.878582, 1, 1, 1, 1, 1,
0.2780302, -1.558067, 5.438906, 1, 1, 1, 1, 1,
0.2811963, -0.04520894, 1.940978, 1, 1, 1, 1, 1,
0.2834564, 0.3446163, 0.3171381, 1, 1, 1, 1, 1,
0.2855301, 1.212666, 0.1145145, 1, 1, 1, 1, 1,
0.2876562, 0.6556345, -0.1119327, 1, 1, 1, 1, 1,
0.2878675, -0.8915349, 0.3299748, 0, 0, 1, 1, 1,
0.2913865, -0.9347254, 3.177012, 1, 0, 0, 1, 1,
0.2943445, 0.3555913, 2.504322, 1, 0, 0, 1, 1,
0.2957982, -1.130054, 3.661773, 1, 0, 0, 1, 1,
0.2971128, -0.00663669, 1.964272, 1, 0, 0, 1, 1,
0.2997202, 0.9103104, 1.375305, 1, 0, 0, 1, 1,
0.3013325, 0.8278991, 1.662439, 0, 0, 0, 1, 1,
0.3043238, 0.8223958, -0.2308852, 0, 0, 0, 1, 1,
0.3081563, -1.407629, 3.55953, 0, 0, 0, 1, 1,
0.3114541, -0.3585793, 1.257155, 0, 0, 0, 1, 1,
0.3147358, 0.01222, 1.603115, 0, 0, 0, 1, 1,
0.3151315, -0.1286857, 2.719744, 0, 0, 0, 1, 1,
0.3175678, 0.8943112, 0.8005728, 0, 0, 0, 1, 1,
0.325377, 2.170714, -0.09711406, 1, 1, 1, 1, 1,
0.325473, -0.858774, 3.59211, 1, 1, 1, 1, 1,
0.3254761, 0.2813484, 1.233457, 1, 1, 1, 1, 1,
0.3265216, -0.713375, 3.284109, 1, 1, 1, 1, 1,
0.3298974, -0.6011183, 3.398401, 1, 1, 1, 1, 1,
0.3313656, -1.736421, 4.48004, 1, 1, 1, 1, 1,
0.3362837, 0.690708, -0.2922773, 1, 1, 1, 1, 1,
0.3402373, -1.034085, 2.020257, 1, 1, 1, 1, 1,
0.3472977, 0.986852, 1.402647, 1, 1, 1, 1, 1,
0.3487032, -1.029081, 1.793515, 1, 1, 1, 1, 1,
0.3538624, -1.542161, 1.814676, 1, 1, 1, 1, 1,
0.3583742, -0.6050578, 2.027706, 1, 1, 1, 1, 1,
0.3655293, -0.8152581, 3.188517, 1, 1, 1, 1, 1,
0.3660232, -0.9298615, 2.846637, 1, 1, 1, 1, 1,
0.3662342, 0.9957113, -0.4208414, 1, 1, 1, 1, 1,
0.3718455, 0.01689798, 1.865564, 0, 0, 1, 1, 1,
0.3737376, -0.8525333, 2.493551, 1, 0, 0, 1, 1,
0.3889349, 0.6800559, 0.4349078, 1, 0, 0, 1, 1,
0.3901581, -0.3876793, 1.434956, 1, 0, 0, 1, 1,
0.3904437, 0.2924697, 2.07203, 1, 0, 0, 1, 1,
0.3905464, 1.290464, 0.5961705, 1, 0, 0, 1, 1,
0.3933373, 1.055133, -1.378015, 0, 0, 0, 1, 1,
0.3944978, 0.4493951, 1.969855, 0, 0, 0, 1, 1,
0.395102, -0.3985276, 2.673213, 0, 0, 0, 1, 1,
0.3951946, 0.4838194, 1.652968, 0, 0, 0, 1, 1,
0.4085844, -0.05919649, 2.114191, 0, 0, 0, 1, 1,
0.4106637, 0.6937858, -1.227217, 0, 0, 0, 1, 1,
0.411545, 1.17897, 0.3275262, 0, 0, 0, 1, 1,
0.4146982, -0.04100994, 2.201419, 1, 1, 1, 1, 1,
0.4203833, -0.82372, 1.777928, 1, 1, 1, 1, 1,
0.4208311, -1.625375, 2.560472, 1, 1, 1, 1, 1,
0.4371828, -0.4960985, 1.945987, 1, 1, 1, 1, 1,
0.4396203, -1.478666, 3.819475, 1, 1, 1, 1, 1,
0.4400734, 0.5408213, 0.6705493, 1, 1, 1, 1, 1,
0.4430257, -0.7052991, 2.170076, 1, 1, 1, 1, 1,
0.4479461, -0.1213825, 2.891724, 1, 1, 1, 1, 1,
0.4483604, 1.258706, 2.243792, 1, 1, 1, 1, 1,
0.4500608, -0.9158053, 4.954831, 1, 1, 1, 1, 1,
0.4526567, 0.07979986, 1.027746, 1, 1, 1, 1, 1,
0.4556758, 0.7777995, 3.3946, 1, 1, 1, 1, 1,
0.4565221, -0.8968521, 2.91304, 1, 1, 1, 1, 1,
0.457866, 0.2992418, 0.9480174, 1, 1, 1, 1, 1,
0.4597427, 0.4161994, 0.7875291, 1, 1, 1, 1, 1,
0.4630799, -0.2593754, 0.8352433, 0, 0, 1, 1, 1,
0.4658388, -0.4494698, 3.687167, 1, 0, 0, 1, 1,
0.4720999, 1.610909, 0.58039, 1, 0, 0, 1, 1,
0.4753177, 0.9866433, -0.03249973, 1, 0, 0, 1, 1,
0.4764229, -0.6879019, 2.128287, 1, 0, 0, 1, 1,
0.4777179, 0.1599428, 1.732244, 1, 0, 0, 1, 1,
0.4778086, -0.000192802, 2.149914, 0, 0, 0, 1, 1,
0.4795164, 0.5752806, 1.208227, 0, 0, 0, 1, 1,
0.4797229, 1.28648, -0.8313504, 0, 0, 0, 1, 1,
0.4824035, -0.7893754, 4.848658, 0, 0, 0, 1, 1,
0.5005243, -0.1042696, 2.484944, 0, 0, 0, 1, 1,
0.5013658, -0.04002903, 2.431924, 0, 0, 0, 1, 1,
0.5019491, 0.6755779, -0.8605804, 0, 0, 0, 1, 1,
0.5062484, 1.267005, 0.4313189, 1, 1, 1, 1, 1,
0.5069067, 1.019546, 0.7568952, 1, 1, 1, 1, 1,
0.5093914, 0.2312424, -0.4993066, 1, 1, 1, 1, 1,
0.516179, 0.4090347, -0.3000153, 1, 1, 1, 1, 1,
0.5189925, -0.1525599, 2.29816, 1, 1, 1, 1, 1,
0.5191153, 1.178249, 0.5920568, 1, 1, 1, 1, 1,
0.5242544, 0.4223994, 2.327888, 1, 1, 1, 1, 1,
0.5255917, -0.3674318, 1.416711, 1, 1, 1, 1, 1,
0.5293276, -1.254945, 1.567522, 1, 1, 1, 1, 1,
0.5360164, 0.4193132, 1.05642, 1, 1, 1, 1, 1,
0.5361035, 0.8462548, 0.6287353, 1, 1, 1, 1, 1,
0.5371165, 1.859206, 2.939723, 1, 1, 1, 1, 1,
0.5400248, 0.2129, 1.946087, 1, 1, 1, 1, 1,
0.5401964, 2.141899, 1.406627, 1, 1, 1, 1, 1,
0.5404536, -1.565121, 4.884751, 1, 1, 1, 1, 1,
0.5406839, 0.8445659, 1.555647, 0, 0, 1, 1, 1,
0.5468211, -1.019771, 5.066635, 1, 0, 0, 1, 1,
0.5475402, -1.079185, 3.099351, 1, 0, 0, 1, 1,
0.5522799, 0.03231259, 1.150283, 1, 0, 0, 1, 1,
0.5564357, 1.071045, 0.9361218, 1, 0, 0, 1, 1,
0.5580159, -0.1231112, 1.349366, 1, 0, 0, 1, 1,
0.565819, 0.7983432, 0.004141461, 0, 0, 0, 1, 1,
0.566317, 0.1740836, 2.410746, 0, 0, 0, 1, 1,
0.5668222, 0.884977, 2.742519, 0, 0, 0, 1, 1,
0.5685732, 0.7369715, 1.341285, 0, 0, 0, 1, 1,
0.5703133, 1.804034, 0.6229948, 0, 0, 0, 1, 1,
0.5705253, 1.632975, 0.2192672, 0, 0, 0, 1, 1,
0.576533, -0.6820527, 2.624632, 0, 0, 0, 1, 1,
0.5778601, 0.1182212, -0.6546242, 1, 1, 1, 1, 1,
0.5779655, -1.145288, 3.84077, 1, 1, 1, 1, 1,
0.5805309, -0.009291797, 1.994365, 1, 1, 1, 1, 1,
0.5822488, 1.97867, -2.651929, 1, 1, 1, 1, 1,
0.5857968, 1.263411, 0.103182, 1, 1, 1, 1, 1,
0.5880451, 0.7322944, -0.5965574, 1, 1, 1, 1, 1,
0.5888155, 0.7312294, 0.3858818, 1, 1, 1, 1, 1,
0.5891393, -1.633105, 2.351274, 1, 1, 1, 1, 1,
0.5901659, 0.235293, 2.467956, 1, 1, 1, 1, 1,
0.5936856, -0.7844756, 3.293696, 1, 1, 1, 1, 1,
0.5939114, 0.2819771, 3.012033, 1, 1, 1, 1, 1,
0.5951232, 1.256292, -0.548808, 1, 1, 1, 1, 1,
0.6000418, 0.3041902, 1.167669, 1, 1, 1, 1, 1,
0.6010685, 1.566375, 0.6123389, 1, 1, 1, 1, 1,
0.6027278, -1.16862, 3.174735, 1, 1, 1, 1, 1,
0.6037938, 0.2607285, 0.4050837, 0, 0, 1, 1, 1,
0.6108244, -0.4274321, 0.5653016, 1, 0, 0, 1, 1,
0.6211655, -0.2905211, 1.118438, 1, 0, 0, 1, 1,
0.6213234, -0.2316615, 2.521629, 1, 0, 0, 1, 1,
0.6308641, -1.198685, 1.322742, 1, 0, 0, 1, 1,
0.6322974, 0.1051496, 2.095785, 1, 0, 0, 1, 1,
0.6323324, 0.8936831, 0.7621613, 0, 0, 0, 1, 1,
0.6358017, 0.4962895, -0.1629749, 0, 0, 0, 1, 1,
0.6391868, -0.6706096, 1.850619, 0, 0, 0, 1, 1,
0.6441157, -0.648447, 1.001567, 0, 0, 0, 1, 1,
0.6520383, -0.827651, 2.866522, 0, 0, 0, 1, 1,
0.6540264, 0.4791549, 0.5131791, 0, 0, 0, 1, 1,
0.6558747, -0.6371324, 2.11247, 0, 0, 0, 1, 1,
0.6558992, -0.6383168, 3.464237, 1, 1, 1, 1, 1,
0.6604319, -0.09964376, 2.916709, 1, 1, 1, 1, 1,
0.6630013, -1.229558, 2.12464, 1, 1, 1, 1, 1,
0.6645582, 0.6199344, -0.6822637, 1, 1, 1, 1, 1,
0.6704027, -0.9473434, 1.373803, 1, 1, 1, 1, 1,
0.6709412, -0.8422475, 3.074994, 1, 1, 1, 1, 1,
0.6739632, -1.28407, 1.968223, 1, 1, 1, 1, 1,
0.6770206, -0.5480372, 4.285008, 1, 1, 1, 1, 1,
0.6779248, -1.681746, 3.289754, 1, 1, 1, 1, 1,
0.6788796, -0.7626849, 2.89506, 1, 1, 1, 1, 1,
0.6803492, -1.997507, 4.041821, 1, 1, 1, 1, 1,
0.6820002, 0.1918585, 2.723655, 1, 1, 1, 1, 1,
0.689041, -0.2390395, 0.7149271, 1, 1, 1, 1, 1,
0.6964879, -0.5674546, 2.710572, 1, 1, 1, 1, 1,
0.7011081, -0.3702925, 2.345592, 1, 1, 1, 1, 1,
0.702159, -0.9802395, 1.351131, 0, 0, 1, 1, 1,
0.7029663, 0.2166388, 1.290361, 1, 0, 0, 1, 1,
0.7066891, 1.220522, 0.5489044, 1, 0, 0, 1, 1,
0.7080146, -0.6942295, 4.638487, 1, 0, 0, 1, 1,
0.714197, 0.2363789, 1.543608, 1, 0, 0, 1, 1,
0.7169388, -0.006027848, 2.18065, 1, 0, 0, 1, 1,
0.7185884, -0.4534414, 3.421952, 0, 0, 0, 1, 1,
0.7187723, -0.1909653, 2.152606, 0, 0, 0, 1, 1,
0.7193961, -1.880318, 1.911815, 0, 0, 0, 1, 1,
0.721923, 0.3115488, 1.692352, 0, 0, 0, 1, 1,
0.7223447, -0.6253707, 3.430994, 0, 0, 0, 1, 1,
0.7239316, 0.4351237, 1.378621, 0, 0, 0, 1, 1,
0.724032, 0.2210424, 1.279791, 0, 0, 0, 1, 1,
0.7413765, -0.4496473, 4.383964, 1, 1, 1, 1, 1,
0.7432572, -0.06478309, 2.407034, 1, 1, 1, 1, 1,
0.7435836, -0.7059621, 2.747122, 1, 1, 1, 1, 1,
0.7452052, 0.393079, 0.7600074, 1, 1, 1, 1, 1,
0.7508147, -0.011322, 0.1955356, 1, 1, 1, 1, 1,
0.7565388, 1.540365, -0.7011433, 1, 1, 1, 1, 1,
0.7625118, 0.8751838, -0.008100098, 1, 1, 1, 1, 1,
0.7656872, -0.2612199, 3.56395, 1, 1, 1, 1, 1,
0.767197, 0.06610173, 0.6057974, 1, 1, 1, 1, 1,
0.7757646, 0.6247505, 1.827271, 1, 1, 1, 1, 1,
0.7809678, -0.7136184, 1.306152, 1, 1, 1, 1, 1,
0.7860844, 0.5654603, -0.1031914, 1, 1, 1, 1, 1,
0.7914895, -0.9539734, 0.6919962, 1, 1, 1, 1, 1,
0.7922298, -1.111134, 0.4329374, 1, 1, 1, 1, 1,
0.7938154, 0.5467069, 1.192965, 1, 1, 1, 1, 1,
0.8030125, -1.560192, 3.428749, 0, 0, 1, 1, 1,
0.8059195, 0.1762533, 0.3296627, 1, 0, 0, 1, 1,
0.8091527, 0.4477389, 0.02251167, 1, 0, 0, 1, 1,
0.8102152, -1.929693, 1.671834, 1, 0, 0, 1, 1,
0.8162366, 0.7865517, 0.5404916, 1, 0, 0, 1, 1,
0.8194778, 0.5023258, 1.215126, 1, 0, 0, 1, 1,
0.8215349, -0.5122251, 2.702567, 0, 0, 0, 1, 1,
0.8221161, -0.1434645, -0.08987254, 0, 0, 0, 1, 1,
0.8297437, 0.1319107, 1.009677, 0, 0, 0, 1, 1,
0.8363395, 0.08265742, 3.491198, 0, 0, 0, 1, 1,
0.8414018, -0.46548, 4.280436, 0, 0, 0, 1, 1,
0.8466012, -0.9312212, 3.073898, 0, 0, 0, 1, 1,
0.8474598, -2.937439, 2.430614, 0, 0, 0, 1, 1,
0.8523965, 0.8355067, 0.4032816, 1, 1, 1, 1, 1,
0.8558135, 0.1265368, 0.2947273, 1, 1, 1, 1, 1,
0.8564597, -1.596974, 1.990906, 1, 1, 1, 1, 1,
0.8633996, 1.441449, 1.425124, 1, 1, 1, 1, 1,
0.8645163, -0.3555016, 2.211149, 1, 1, 1, 1, 1,
0.8664339, 1.978227, -0.2622697, 1, 1, 1, 1, 1,
0.8783324, 1.765488, 1.257146, 1, 1, 1, 1, 1,
0.8817077, 2.324561, 2.079985, 1, 1, 1, 1, 1,
0.8819522, -0.1353497, 2.816761, 1, 1, 1, 1, 1,
0.8838668, 0.9718753, 1.045276, 1, 1, 1, 1, 1,
0.8846655, 0.08886689, 2.847603, 1, 1, 1, 1, 1,
0.8914699, -0.9451505, 2.944227, 1, 1, 1, 1, 1,
0.8925363, -0.3021797, 2.931904, 1, 1, 1, 1, 1,
0.8938572, -0.5663174, 1.957243, 1, 1, 1, 1, 1,
0.9029795, 0.3208335, 1.652049, 1, 1, 1, 1, 1,
0.9101006, 1.387172, 2.148226, 0, 0, 1, 1, 1,
0.9171289, 1.919104, -0.6671124, 1, 0, 0, 1, 1,
0.9302444, -0.4119294, 2.037278, 1, 0, 0, 1, 1,
0.9432701, -0.8081713, 1.50007, 1, 0, 0, 1, 1,
0.9497796, -1.271824, 1.324595, 1, 0, 0, 1, 1,
0.9549509, -0.8053387, 2.399745, 1, 0, 0, 1, 1,
0.9561712, 1.115844, 0.3674509, 0, 0, 0, 1, 1,
0.961753, 1.273365, 1.197347, 0, 0, 0, 1, 1,
0.9628819, -1.75554, 4.499948, 0, 0, 0, 1, 1,
0.9679462, -0.7202326, 3.585641, 0, 0, 0, 1, 1,
0.969417, 2.438208, -1.579011, 0, 0, 0, 1, 1,
0.9706217, -0.5736268, 3.24985, 0, 0, 0, 1, 1,
0.9710716, 0.8580559, 1.187959, 0, 0, 0, 1, 1,
0.9759645, 0.451241, 1.342444, 1, 1, 1, 1, 1,
0.9761756, 0.4724284, 0.2258777, 1, 1, 1, 1, 1,
0.9890998, 0.4646396, 1.139691, 1, 1, 1, 1, 1,
0.9942564, 0.6740001, -0.113426, 1, 1, 1, 1, 1,
0.9974235, -0.2648881, 0.7027618, 1, 1, 1, 1, 1,
0.9978928, -1.147581, 3.117496, 1, 1, 1, 1, 1,
0.9979382, -0.6134432, 2.897188, 1, 1, 1, 1, 1,
0.9983801, 0.7422751, 0.5784429, 1, 1, 1, 1, 1,
0.9984299, -0.643918, 2.075039, 1, 1, 1, 1, 1,
1.005409, 0.2016526, 2.165792, 1, 1, 1, 1, 1,
1.016417, -0.341619, 2.380534, 1, 1, 1, 1, 1,
1.025601, 2.767309, -0.2317685, 1, 1, 1, 1, 1,
1.029559, -0.5405279, 2.581482, 1, 1, 1, 1, 1,
1.04172, -0.7262694, 3.110115, 1, 1, 1, 1, 1,
1.057555, 0.9034156, 2.342815, 1, 1, 1, 1, 1,
1.061649, 0.4455974, 0.7298665, 0, 0, 1, 1, 1,
1.080296, -1.161766, 0.570586, 1, 0, 0, 1, 1,
1.091377, 1.406221, -0.3544137, 1, 0, 0, 1, 1,
1.091603, -0.4967841, 1.266931, 1, 0, 0, 1, 1,
1.092536, -0.5715801, 1.177328, 1, 0, 0, 1, 1,
1.106336, -2.43076, 2.101694, 1, 0, 0, 1, 1,
1.107662, -0.3607696, 3.202325, 0, 0, 0, 1, 1,
1.109496, -1.983569, 2.435892, 0, 0, 0, 1, 1,
1.112397, 0.5428163, -0.3027166, 0, 0, 0, 1, 1,
1.112746, -1.284021, 0.7730873, 0, 0, 0, 1, 1,
1.118576, -0.4653541, 2.729315, 0, 0, 0, 1, 1,
1.121387, -0.8154806, 2.524992, 0, 0, 0, 1, 1,
1.122819, 0.4013524, 0.7399029, 0, 0, 0, 1, 1,
1.127301, 1.805438, 1.405484, 1, 1, 1, 1, 1,
1.141342, 0.2495293, -0.9248152, 1, 1, 1, 1, 1,
1.142109, 2.128234, -1.407639, 1, 1, 1, 1, 1,
1.143875, -0.3789409, 3.353363, 1, 1, 1, 1, 1,
1.153598, -0.4019158, 1.504969, 1, 1, 1, 1, 1,
1.15632, 1.110981, 0.004887458, 1, 1, 1, 1, 1,
1.179383, 0.2258983, 0.7812952, 1, 1, 1, 1, 1,
1.183281, -0.4395615, 1.283693, 1, 1, 1, 1, 1,
1.184341, 0.2199757, 0.4557656, 1, 1, 1, 1, 1,
1.190391, -0.2031192, 1.279269, 1, 1, 1, 1, 1,
1.198347, -1.51064, 1.468779, 1, 1, 1, 1, 1,
1.202498, -1.022723, 2.529427, 1, 1, 1, 1, 1,
1.209738, -1.312536, 3.34059, 1, 1, 1, 1, 1,
1.212338, -0.5272011, 1.632273, 1, 1, 1, 1, 1,
1.213617, 1.153376, -0.1426017, 1, 1, 1, 1, 1,
1.214543, -0.314926, 1.358379, 0, 0, 1, 1, 1,
1.215169, 1.503319, 0.1592458, 1, 0, 0, 1, 1,
1.219138, 0.01606494, 0.02199408, 1, 0, 0, 1, 1,
1.223545, 0.8304836, 2.151645, 1, 0, 0, 1, 1,
1.224745, -0.3650051, -0.7117364, 1, 0, 0, 1, 1,
1.226773, 0.1030484, -0.06609844, 1, 0, 0, 1, 1,
1.228812, -0.2793171, 3.717104, 0, 0, 0, 1, 1,
1.228835, 1.31488, 0.5327963, 0, 0, 0, 1, 1,
1.2409, 0.9146283, 0.6366321, 0, 0, 0, 1, 1,
1.243683, -0.9737755, 3.664462, 0, 0, 0, 1, 1,
1.260359, 1.222684, -1.428003, 0, 0, 0, 1, 1,
1.269513, 0.56981, 1.788471, 0, 0, 0, 1, 1,
1.278527, 0.5202323, 0.6497722, 0, 0, 0, 1, 1,
1.282395, -0.6926249, 2.433134, 1, 1, 1, 1, 1,
1.283674, -0.5192007, 2.162876, 1, 1, 1, 1, 1,
1.290936, 0.8321671, -0.245992, 1, 1, 1, 1, 1,
1.298003, 1.156494, 2.54049, 1, 1, 1, 1, 1,
1.301291, -0.8919699, 1.390644, 1, 1, 1, 1, 1,
1.302315, 0.2639966, 0.399304, 1, 1, 1, 1, 1,
1.31986, -2.331573, 0.9450771, 1, 1, 1, 1, 1,
1.321773, -1.398479, 1.532165, 1, 1, 1, 1, 1,
1.332435, -0.8622401, 3.029394, 1, 1, 1, 1, 1,
1.334435, -0.2619541, 1.466765, 1, 1, 1, 1, 1,
1.335038, 0.5482131, 4.048408, 1, 1, 1, 1, 1,
1.339545, -0.07087453, 1.606986, 1, 1, 1, 1, 1,
1.34193, 1.028708, 2.332564, 1, 1, 1, 1, 1,
1.34504, 0.6102077, -0.4212298, 1, 1, 1, 1, 1,
1.348559, 0.9426799, 1.245518, 1, 1, 1, 1, 1,
1.358582, -0.27878, 1.090961, 0, 0, 1, 1, 1,
1.368307, 0.8803658, 2.638702, 1, 0, 0, 1, 1,
1.390249, -0.7137054, 2.999885, 1, 0, 0, 1, 1,
1.390292, -1.07939, 2.233044, 1, 0, 0, 1, 1,
1.399202, -0.83022, 1.758908, 1, 0, 0, 1, 1,
1.414129, 0.6439704, 0.4027492, 1, 0, 0, 1, 1,
1.41787, -0.8231081, 2.576697, 0, 0, 0, 1, 1,
1.420038, 0.5676752, 2.214836, 0, 0, 0, 1, 1,
1.429325, -0.2268947, 0.3295781, 0, 0, 0, 1, 1,
1.431368, -2.252486, -0.07903618, 0, 0, 0, 1, 1,
1.432327, -0.5280898, 2.394569, 0, 0, 0, 1, 1,
1.434305, 0.1241056, 1.819208, 0, 0, 0, 1, 1,
1.43768, -1.31912, 2.285933, 0, 0, 0, 1, 1,
1.442552, -0.0248171, 1.389826, 1, 1, 1, 1, 1,
1.457056, -0.6644006, 2.999362, 1, 1, 1, 1, 1,
1.461567, -1.400454, 3.005248, 1, 1, 1, 1, 1,
1.469207, -0.8993343, 1.175765, 1, 1, 1, 1, 1,
1.470361, -2.612587, 3.844109, 1, 1, 1, 1, 1,
1.472332, -1.087878, 2.099247, 1, 1, 1, 1, 1,
1.490072, 0.8132576, 1.498865, 1, 1, 1, 1, 1,
1.497213, 0.735332, 2.47201, 1, 1, 1, 1, 1,
1.503516, -0.3123825, 2.13576, 1, 1, 1, 1, 1,
1.518304, 0.1335593, 2.561915, 1, 1, 1, 1, 1,
1.524969, 0.478449, 0.076011, 1, 1, 1, 1, 1,
1.566265, -1.04806, 1.789329, 1, 1, 1, 1, 1,
1.581504, 1.070105, 0.08366345, 1, 1, 1, 1, 1,
1.587085, -2.163495, 3.02692, 1, 1, 1, 1, 1,
1.6033, 0.08504163, -1.031881, 1, 1, 1, 1, 1,
1.60923, 0.948216, 0.1773005, 0, 0, 1, 1, 1,
1.612506, 1.154415, 2.050278, 1, 0, 0, 1, 1,
1.620295, 2.351603, -0.3861797, 1, 0, 0, 1, 1,
1.622853, -0.1560588, 2.532325, 1, 0, 0, 1, 1,
1.632258, -0.1180952, 1.618288, 1, 0, 0, 1, 1,
1.634449, 1.27262, 0.06125527, 1, 0, 0, 1, 1,
1.650766, 2.550211, 1.939621, 0, 0, 0, 1, 1,
1.653321, -1.497489, 1.988363, 0, 0, 0, 1, 1,
1.65477, -0.4640348, 1.631918, 0, 0, 0, 1, 1,
1.656896, -1.522253, 2.710526, 0, 0, 0, 1, 1,
1.671415, 0.552009, 1.345999, 0, 0, 0, 1, 1,
1.675083, 2.091457, 1.258642, 0, 0, 0, 1, 1,
1.676745, 0.5906385, 3.016077, 0, 0, 0, 1, 1,
1.686063, 1.007783, 1.093938, 1, 1, 1, 1, 1,
1.699799, 0.8025159, 1.216272, 1, 1, 1, 1, 1,
1.714196, -0.8468279, -0.7544303, 1, 1, 1, 1, 1,
1.716699, -0.06993159, 3.275502, 1, 1, 1, 1, 1,
1.729726, 0.5660605, -0.5896581, 1, 1, 1, 1, 1,
1.73808, 0.431522, 0.820389, 1, 1, 1, 1, 1,
1.747046, 0.3653822, 0.5784476, 1, 1, 1, 1, 1,
1.76035, 0.1374693, 2.094094, 1, 1, 1, 1, 1,
1.775841, -0.9655637, 2.82316, 1, 1, 1, 1, 1,
1.783799, -0.8758332, 1.785898, 1, 1, 1, 1, 1,
1.786015, -1.216318, 1.420491, 1, 1, 1, 1, 1,
1.793935, -0.3374549, 1.937444, 1, 1, 1, 1, 1,
1.795106, 0.9597032, 2.396043, 1, 1, 1, 1, 1,
1.81262, 0.6987566, 1.899202, 1, 1, 1, 1, 1,
1.814404, 0.5988567, 1.830522, 1, 1, 1, 1, 1,
1.816521, -2.227311, 2.581847, 0, 0, 1, 1, 1,
1.822033, 1.85054, -0.5332105, 1, 0, 0, 1, 1,
1.841048, 0.4325403, -0.220894, 1, 0, 0, 1, 1,
1.869446, -0.2375419, -0.3890996, 1, 0, 0, 1, 1,
1.881761, 0.2258066, -2.592697, 1, 0, 0, 1, 1,
1.882454, 0.9708798, 0.0433548, 1, 0, 0, 1, 1,
1.896834, 0.4293914, -0.2338169, 0, 0, 0, 1, 1,
1.907777, -0.6310138, 1.635226, 0, 0, 0, 1, 1,
1.915825, -0.6054388, 2.001234, 0, 0, 0, 1, 1,
1.916022, -1.433644, 2.908765, 0, 0, 0, 1, 1,
1.916499, 0.7887323, 2.934077, 0, 0, 0, 1, 1,
1.917853, 0.07549548, 0.3459236, 0, 0, 0, 1, 1,
1.970337, -1.095525, 1.791215, 0, 0, 0, 1, 1,
1.999113, -0.8051264, 3.13161, 1, 1, 1, 1, 1,
2.001818, 2.069668, 0.2229738, 1, 1, 1, 1, 1,
2.006733, 1.796028, 1.760285, 1, 1, 1, 1, 1,
2.05429, 0.00524708, 1.178943, 1, 1, 1, 1, 1,
2.056051, -0.09527871, 0.8784816, 1, 1, 1, 1, 1,
2.072588, 1.16569, 2.075791, 1, 1, 1, 1, 1,
2.088868, -0.4683321, 1.864929, 1, 1, 1, 1, 1,
2.095445, 1.055704, 1.041264, 1, 1, 1, 1, 1,
2.096177, 0.351869, 1.800348, 1, 1, 1, 1, 1,
2.104814, -1.115782, 1.462521, 1, 1, 1, 1, 1,
2.145221, -0.5314827, 2.835618, 1, 1, 1, 1, 1,
2.159086, -0.5540344, 0.8343423, 1, 1, 1, 1, 1,
2.16061, 0.5494611, -0.6665558, 1, 1, 1, 1, 1,
2.178982, 0.7892451, -0.2420753, 1, 1, 1, 1, 1,
2.180739, -0.881181, 1.055441, 1, 1, 1, 1, 1,
2.236504, -2.338011, 1.9757, 0, 0, 1, 1, 1,
2.250588, 0.5970477, -0.166874, 1, 0, 0, 1, 1,
2.255305, -1.193922, 1.160378, 1, 0, 0, 1, 1,
2.431344, 0.8796728, 2.060199, 1, 0, 0, 1, 1,
2.450076, 0.3743443, 1.065615, 1, 0, 0, 1, 1,
2.450633, -0.9609998, 3.516995, 1, 0, 0, 1, 1,
2.452823, 0.158241, 0.7556177, 0, 0, 0, 1, 1,
2.471537, -1.39905, 0.7174315, 0, 0, 0, 1, 1,
2.496887, 0.2479205, 0.4643306, 0, 0, 0, 1, 1,
2.498453, -0.7207957, 2.180008, 0, 0, 0, 1, 1,
2.519059, 1.815375, 0.5437328, 0, 0, 0, 1, 1,
2.638899, 0.311059, 0.7798027, 0, 0, 0, 1, 1,
2.682933, 1.717186, 1.298606, 0, 0, 0, 1, 1,
2.775396, 0.04178872, 0.809227, 1, 1, 1, 1, 1,
2.775895, 0.837509, 1.915999, 1, 1, 1, 1, 1,
2.840933, 0.8083831, -0.145654, 1, 1, 1, 1, 1,
2.887105, 1.06465, 1.327349, 1, 1, 1, 1, 1,
2.944268, -1.796174, 1.166506, 1, 1, 1, 1, 1,
3.130381, -1.029637, 1.947729, 1, 1, 1, 1, 1,
3.552341, 1.452646, 1.842327, 1, 1, 1, 1, 1
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
var radius = 9.923745;
var distance = 34.85674;
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
mvMatrix.translate( -0.01812983, 0.08506477, 0.3426254 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.85674);
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
