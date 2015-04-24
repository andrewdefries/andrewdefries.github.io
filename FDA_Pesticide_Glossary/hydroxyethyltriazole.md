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
-3.268175, 0.04248334, -2.837461, 1, 0, 0, 1,
-3.189055, 0.5205825, -2.378968, 1, 0.007843138, 0, 1,
-3.117499, -0.3377349, -2.438356, 1, 0.01176471, 0, 1,
-3.104022, 0.371566, -2.561149, 1, 0.01960784, 0, 1,
-2.91873, -0.3942738, -3.211457, 1, 0.02352941, 0, 1,
-2.903278, -0.7415231, -0.7057629, 1, 0.03137255, 0, 1,
-2.885959, 0.7791246, -0.1717027, 1, 0.03529412, 0, 1,
-2.773424, 1.14625, -2.58031, 1, 0.04313726, 0, 1,
-2.726742, -1.379671, -3.066055, 1, 0.04705882, 0, 1,
-2.699005, 0.6717286, -0.592193, 1, 0.05490196, 0, 1,
-2.565157, -0.4567017, 0.3632845, 1, 0.05882353, 0, 1,
-2.555886, -0.6839668, -0.8714347, 1, 0.06666667, 0, 1,
-2.529963, 0.08510354, -1.79417, 1, 0.07058824, 0, 1,
-2.501644, -1.282265, -1.989462, 1, 0.07843138, 0, 1,
-2.500556, -0.1213953, -3.121028, 1, 0.08235294, 0, 1,
-2.438621, -0.6894016, -2.260396, 1, 0.09019608, 0, 1,
-2.423297, -0.1555464, -1.19768, 1, 0.09411765, 0, 1,
-2.416936, -0.06006863, -1.580662, 1, 0.1019608, 0, 1,
-2.325215, -1.276942, -2.102777, 1, 0.1098039, 0, 1,
-2.323138, -0.04118406, -2.521898, 1, 0.1137255, 0, 1,
-2.284587, -1.148722, -2.278437, 1, 0.1215686, 0, 1,
-2.258723, -1.299554, -2.238879, 1, 0.1254902, 0, 1,
-2.196508, -1.2249, -1.783178, 1, 0.1333333, 0, 1,
-2.136327, -1.325015, -2.880363, 1, 0.1372549, 0, 1,
-2.131774, -1.580184, -1.639624, 1, 0.145098, 0, 1,
-2.106978, -0.9039761, -2.219717, 1, 0.1490196, 0, 1,
-2.086009, 0.6920639, -1.583033, 1, 0.1568628, 0, 1,
-2.08496, 0.9121718, -1.4223, 1, 0.1607843, 0, 1,
-2.063801, 0.6352288, -1.788783, 1, 0.1686275, 0, 1,
-2.016365, 1.198388, -0.8235648, 1, 0.172549, 0, 1,
-2.009605, 0.02092762, 1.51553, 1, 0.1803922, 0, 1,
-1.95278, 1.063192, 0.09290591, 1, 0.1843137, 0, 1,
-1.935004, 2.508931, -0.8453046, 1, 0.1921569, 0, 1,
-1.925664, 1.040623, -1.499203, 1, 0.1960784, 0, 1,
-1.911669, 1.413341, -1.22386, 1, 0.2039216, 0, 1,
-1.90679, 0.1976844, -0.5367477, 1, 0.2117647, 0, 1,
-1.867343, 1.09605, -0.6934795, 1, 0.2156863, 0, 1,
-1.85654, 1.060645, -0.7810737, 1, 0.2235294, 0, 1,
-1.84088, -1.931203, -2.545605, 1, 0.227451, 0, 1,
-1.836468, -0.5031425, -2.311825, 1, 0.2352941, 0, 1,
-1.831474, -0.180803, -3.022721, 1, 0.2392157, 0, 1,
-1.821366, -0.3613344, -2.014854, 1, 0.2470588, 0, 1,
-1.810402, 0.6109482, 0.1386144, 1, 0.2509804, 0, 1,
-1.805895, -0.72026, -3.782229, 1, 0.2588235, 0, 1,
-1.805692, -0.9020872, -2.078479, 1, 0.2627451, 0, 1,
-1.782109, -0.1912845, -2.075342, 1, 0.2705882, 0, 1,
-1.779814, 1.693881, -1.291252, 1, 0.2745098, 0, 1,
-1.75934, -0.2863982, -0.943406, 1, 0.282353, 0, 1,
-1.75213, -2.469808, -1.410536, 1, 0.2862745, 0, 1,
-1.736197, 0.339428, -3.049221, 1, 0.2941177, 0, 1,
-1.729967, -0.06136519, -0.5155763, 1, 0.3019608, 0, 1,
-1.724462, -0.7066151, -1.930319, 1, 0.3058824, 0, 1,
-1.707936, -1.033235, -2.210786, 1, 0.3137255, 0, 1,
-1.696737, 0.5691711, -0.7038001, 1, 0.3176471, 0, 1,
-1.674705, 0.5469362, -3.027523, 1, 0.3254902, 0, 1,
-1.659182, -0.3219883, -1.259679, 1, 0.3294118, 0, 1,
-1.657635, 0.152632, -2.676191, 1, 0.3372549, 0, 1,
-1.642194, -0.03115845, -1.198888, 1, 0.3411765, 0, 1,
-1.618285, -0.0009597258, -0.9705246, 1, 0.3490196, 0, 1,
-1.614082, 0.1936813, -2.772113, 1, 0.3529412, 0, 1,
-1.613239, -0.3860254, 0.5331498, 1, 0.3607843, 0, 1,
-1.61131, 0.8064597, 0.5264704, 1, 0.3647059, 0, 1,
-1.591272, 1.305873, 0.3079306, 1, 0.372549, 0, 1,
-1.585802, -0.1927699, -1.872931, 1, 0.3764706, 0, 1,
-1.583904, 0.4310113, 0.05058502, 1, 0.3843137, 0, 1,
-1.575703, -0.5194801, -1.661668, 1, 0.3882353, 0, 1,
-1.572978, -0.5947061, -2.736775, 1, 0.3960784, 0, 1,
-1.569728, 0.03404856, -0.9616647, 1, 0.4039216, 0, 1,
-1.564977, -0.6666026, -3.906211, 1, 0.4078431, 0, 1,
-1.564316, -0.3516852, -0.5679293, 1, 0.4156863, 0, 1,
-1.563719, -0.9462, -3.731708, 1, 0.4196078, 0, 1,
-1.541936, -0.8957235, -1.865156, 1, 0.427451, 0, 1,
-1.515891, 0.5516089, -2.357485, 1, 0.4313726, 0, 1,
-1.512836, 0.09385218, -1.380274, 1, 0.4392157, 0, 1,
-1.512018, -0.1568436, -2.073267, 1, 0.4431373, 0, 1,
-1.503838, 0.05959818, -2.2401, 1, 0.4509804, 0, 1,
-1.503289, 1.189333, -0.8174669, 1, 0.454902, 0, 1,
-1.497807, -1.224691, -2.505883, 1, 0.4627451, 0, 1,
-1.487841, -0.3800939, -1.350629, 1, 0.4666667, 0, 1,
-1.472588, 1.229396, -0.8538755, 1, 0.4745098, 0, 1,
-1.464288, 0.8355567, -0.1031238, 1, 0.4784314, 0, 1,
-1.461053, -0.5924967, -3.021691, 1, 0.4862745, 0, 1,
-1.459658, -1.040996, -3.441603, 1, 0.4901961, 0, 1,
-1.443316, -0.5970903, -1.009467, 1, 0.4980392, 0, 1,
-1.438973, -0.2180817, -1.853312, 1, 0.5058824, 0, 1,
-1.432326, -0.2178317, -1.95892, 1, 0.509804, 0, 1,
-1.42499, -0.7914715, -1.509873, 1, 0.5176471, 0, 1,
-1.422383, 0.04125039, -1.698721, 1, 0.5215687, 0, 1,
-1.41894, 0.9586567, -3.353714, 1, 0.5294118, 0, 1,
-1.406543, -1.015893, -2.357196, 1, 0.5333334, 0, 1,
-1.373971, -0.6509311, -3.251749, 1, 0.5411765, 0, 1,
-1.364852, 0.7818981, -1.706578, 1, 0.5450981, 0, 1,
-1.355933, -1.173181, -2.691698, 1, 0.5529412, 0, 1,
-1.353292, -0.001599187, -0.9656367, 1, 0.5568628, 0, 1,
-1.351363, -1.010118, -2.893606, 1, 0.5647059, 0, 1,
-1.339349, 0.08212306, -0.903093, 1, 0.5686275, 0, 1,
-1.322606, -0.3604952, -0.6077366, 1, 0.5764706, 0, 1,
-1.319211, 0.4183537, -1.638043, 1, 0.5803922, 0, 1,
-1.318447, 1.397766, -0.7620234, 1, 0.5882353, 0, 1,
-1.313526, -0.8496917, -3.018672, 1, 0.5921569, 0, 1,
-1.291444, -0.3948616, -2.248296, 1, 0.6, 0, 1,
-1.291179, -0.2117658, -0.8065369, 1, 0.6078432, 0, 1,
-1.279578, -0.3026905, -2.534439, 1, 0.6117647, 0, 1,
-1.27629, -1.468555, -0.191303, 1, 0.6196079, 0, 1,
-1.27049, 1.012556, 0.2405955, 1, 0.6235294, 0, 1,
-1.269365, -1.65389, -3.555012, 1, 0.6313726, 0, 1,
-1.26662, -0.3707657, -2.778972, 1, 0.6352941, 0, 1,
-1.264995, 0.2943827, -1.592494, 1, 0.6431373, 0, 1,
-1.253048, 0.6989314, -0.23558, 1, 0.6470588, 0, 1,
-1.251361, 1.329248, -0.9097937, 1, 0.654902, 0, 1,
-1.248514, 0.4385512, -1.751143, 1, 0.6588235, 0, 1,
-1.248209, 1.111197, -1.594864, 1, 0.6666667, 0, 1,
-1.232156, -0.7569426, -3.267963, 1, 0.6705883, 0, 1,
-1.217325, 0.1676686, -2.468838, 1, 0.6784314, 0, 1,
-1.212275, -0.164445, -2.253927, 1, 0.682353, 0, 1,
-1.1943, -1.613617, -0.8107745, 1, 0.6901961, 0, 1,
-1.191232, 1.061642, -1.030393, 1, 0.6941177, 0, 1,
-1.184007, 0.9891844, -1.552746, 1, 0.7019608, 0, 1,
-1.163111, -1.778993, -3.288619, 1, 0.7098039, 0, 1,
-1.162126, -0.9632045, -1.649622, 1, 0.7137255, 0, 1,
-1.159579, -2.235033, -2.479252, 1, 0.7215686, 0, 1,
-1.15716, 1.007991, 0.6843058, 1, 0.7254902, 0, 1,
-1.154244, 0.1007679, 0.918471, 1, 0.7333333, 0, 1,
-1.150017, -0.5052643, -1.849295, 1, 0.7372549, 0, 1,
-1.145757, -1.662967, -1.835588, 1, 0.7450981, 0, 1,
-1.145511, -1.164775, -3.110623, 1, 0.7490196, 0, 1,
-1.140255, -0.02005764, -0.8895585, 1, 0.7568628, 0, 1,
-1.138609, 0.6113239, -0.6941518, 1, 0.7607843, 0, 1,
-1.135373, -0.8594648, -2.216237, 1, 0.7686275, 0, 1,
-1.130524, -0.264993, -0.3901844, 1, 0.772549, 0, 1,
-1.126509, 1.959539, 0.7139856, 1, 0.7803922, 0, 1,
-1.125106, -0.1395481, -0.9820174, 1, 0.7843137, 0, 1,
-1.123401, 0.9097853, 0.1752071, 1, 0.7921569, 0, 1,
-1.108532, -0.6585193, -0.4245851, 1, 0.7960784, 0, 1,
-1.094563, -0.7068949, -2.531625, 1, 0.8039216, 0, 1,
-1.087397, -0.7689432, -3.270391, 1, 0.8117647, 0, 1,
-1.081369, -2.578014, -3.179836, 1, 0.8156863, 0, 1,
-1.069332, -0.4081388, -2.019521, 1, 0.8235294, 0, 1,
-1.068138, -1.400584, 0.3011275, 1, 0.827451, 0, 1,
-1.062305, -0.6319556, -1.42105, 1, 0.8352941, 0, 1,
-1.054344, -1.318128, -2.713647, 1, 0.8392157, 0, 1,
-1.053562, 0.1238339, -1.364154, 1, 0.8470588, 0, 1,
-1.050702, -1.353761, -2.160679, 1, 0.8509804, 0, 1,
-1.050688, -1.220684, -1.182221, 1, 0.8588235, 0, 1,
-1.048523, 0.6673065, 0.6786315, 1, 0.8627451, 0, 1,
-1.034207, 0.2413465, 0.208863, 1, 0.8705882, 0, 1,
-1.030272, -1.116379, -3.823511, 1, 0.8745098, 0, 1,
-1.022081, -0.05725666, -0.9844316, 1, 0.8823529, 0, 1,
-1.01696, -0.1356135, -2.257801, 1, 0.8862745, 0, 1,
-1.012664, 0.4057072, -0.9413331, 1, 0.8941177, 0, 1,
-1.002113, -0.5226012, -2.624315, 1, 0.8980392, 0, 1,
-0.9964885, 0.4961056, -1.410292, 1, 0.9058824, 0, 1,
-0.9939963, -0.3829527, -2.509289, 1, 0.9137255, 0, 1,
-0.99129, 0.1140873, -0.8532038, 1, 0.9176471, 0, 1,
-0.9874951, 0.141105, -0.02240925, 1, 0.9254902, 0, 1,
-0.9870489, 0.1005807, -1.404987, 1, 0.9294118, 0, 1,
-0.9819189, -0.1180538, -1.885444, 1, 0.9372549, 0, 1,
-0.9793825, 1.44685, 0.7032631, 1, 0.9411765, 0, 1,
-0.9790267, -1.560741, -4.507305, 1, 0.9490196, 0, 1,
-0.9707628, 0.2660604, 0.5229347, 1, 0.9529412, 0, 1,
-0.9689639, 0.7526644, -0.6488069, 1, 0.9607843, 0, 1,
-0.967554, 1.522129, -1.381354, 1, 0.9647059, 0, 1,
-0.9658151, -0.5240122, -1.658092, 1, 0.972549, 0, 1,
-0.9644012, 0.1996361, -0.6268409, 1, 0.9764706, 0, 1,
-0.955438, -0.2603771, -0.5126036, 1, 0.9843137, 0, 1,
-0.954591, -1.603194, -0.7957535, 1, 0.9882353, 0, 1,
-0.9411569, -1.53969, -1.776836, 1, 0.9960784, 0, 1,
-0.9335847, -1.357686, -3.21388, 0.9960784, 1, 0, 1,
-0.9325844, -1.008115, -1.246368, 0.9921569, 1, 0, 1,
-0.9313699, -1.577884, -2.564839, 0.9843137, 1, 0, 1,
-0.9239172, 0.163945, -1.649454, 0.9803922, 1, 0, 1,
-0.9210855, -0.1924514, -2.750699, 0.972549, 1, 0, 1,
-0.9165595, 0.4923141, -2.731459, 0.9686275, 1, 0, 1,
-0.9084308, -1.862205, -3.500947, 0.9607843, 1, 0, 1,
-0.9077449, 0.3463341, -2.341361, 0.9568627, 1, 0, 1,
-0.9075156, -1.241195, -1.358191, 0.9490196, 1, 0, 1,
-0.9059552, -0.8217952, -1.198784, 0.945098, 1, 0, 1,
-0.9042922, 1.09459, -0.8196027, 0.9372549, 1, 0, 1,
-0.8952797, 0.2523924, -2.595379, 0.9333333, 1, 0, 1,
-0.8861849, 0.3936926, -1.358305, 0.9254902, 1, 0, 1,
-0.8789051, -0.769105, -2.961919, 0.9215686, 1, 0, 1,
-0.8786646, -0.1824906, -0.9514523, 0.9137255, 1, 0, 1,
-0.8756974, -0.2958803, -0.5500821, 0.9098039, 1, 0, 1,
-0.8745469, 0.8911699, -1.430296, 0.9019608, 1, 0, 1,
-0.8736806, 0.7259579, -1.924405, 0.8941177, 1, 0, 1,
-0.8705991, 1.164763, -0.4585345, 0.8901961, 1, 0, 1,
-0.8702571, -0.5029427, -2.636971, 0.8823529, 1, 0, 1,
-0.8663162, 1.697129, -0.003733056, 0.8784314, 1, 0, 1,
-0.8628544, -1.396302, -3.402068, 0.8705882, 1, 0, 1,
-0.8625906, -0.305866, -1.961061, 0.8666667, 1, 0, 1,
-0.859758, -0.1613931, -1.702216, 0.8588235, 1, 0, 1,
-0.858016, -0.08640318, -1.608423, 0.854902, 1, 0, 1,
-0.8547721, -0.4510806, -1.07081, 0.8470588, 1, 0, 1,
-0.8534614, 0.5712796, -0.6905658, 0.8431373, 1, 0, 1,
-0.8527086, -1.164375, -2.655877, 0.8352941, 1, 0, 1,
-0.8503261, 2.060095, -1.427978, 0.8313726, 1, 0, 1,
-0.843787, 1.970184, -1.277129, 0.8235294, 1, 0, 1,
-0.8421012, -0.3654423, -2.844713, 0.8196079, 1, 0, 1,
-0.8418074, 1.272314, 0.2702688, 0.8117647, 1, 0, 1,
-0.838139, 2.240686, -1.810333, 0.8078431, 1, 0, 1,
-0.8365703, -0.9183534, -0.6628847, 0.8, 1, 0, 1,
-0.8282624, 1.324975, -0.8324462, 0.7921569, 1, 0, 1,
-0.8270034, 0.05472157, -1.917647, 0.7882353, 1, 0, 1,
-0.8257045, 0.4468235, -1.802445, 0.7803922, 1, 0, 1,
-0.8243104, -0.9486049, -2.203288, 0.7764706, 1, 0, 1,
-0.8000503, 0.9587924, 0.3264217, 0.7686275, 1, 0, 1,
-0.795795, 0.71476, -1.226329, 0.7647059, 1, 0, 1,
-0.7951233, -0.8195581, -3.240695, 0.7568628, 1, 0, 1,
-0.7929127, 0.8066682, -0.06616412, 0.7529412, 1, 0, 1,
-0.791365, 0.05252538, -1.341785, 0.7450981, 1, 0, 1,
-0.7871485, -0.8525153, -1.202571, 0.7411765, 1, 0, 1,
-0.7766441, -1.614347, -2.076158, 0.7333333, 1, 0, 1,
-0.7720066, -2.798358, -3.188752, 0.7294118, 1, 0, 1,
-0.7690484, -0.02458895, -2.174735, 0.7215686, 1, 0, 1,
-0.7636055, 0.3191294, 0.1040347, 0.7176471, 1, 0, 1,
-0.7605634, -0.3405763, -0.9898032, 0.7098039, 1, 0, 1,
-0.7588064, 0.6023377, -1.440845, 0.7058824, 1, 0, 1,
-0.7587224, -2.538045, -2.352676, 0.6980392, 1, 0, 1,
-0.7583345, -1.031629, -2.504256, 0.6901961, 1, 0, 1,
-0.757678, 0.9841257, -1.785177, 0.6862745, 1, 0, 1,
-0.7522727, 1.454732, 1.056846, 0.6784314, 1, 0, 1,
-0.7479885, -2.77891, -3.275684, 0.6745098, 1, 0, 1,
-0.7456461, -0.9531803, -2.137501, 0.6666667, 1, 0, 1,
-0.7450231, -0.1316985, -0.9721855, 0.6627451, 1, 0, 1,
-0.7448547, 1.264156, 0.9087709, 0.654902, 1, 0, 1,
-0.7376777, -1.595212, -1.674007, 0.6509804, 1, 0, 1,
-0.7353104, 0.004282744, -0.8913774, 0.6431373, 1, 0, 1,
-0.7338163, -0.9712033, -3.360531, 0.6392157, 1, 0, 1,
-0.7298679, 1.388523, -1.95845, 0.6313726, 1, 0, 1,
-0.7294804, 0.1847014, -1.075443, 0.627451, 1, 0, 1,
-0.7269996, -0.8522835, -1.781168, 0.6196079, 1, 0, 1,
-0.7266577, 1.310806, 0.7014336, 0.6156863, 1, 0, 1,
-0.7152709, -0.05301322, -1.571994, 0.6078432, 1, 0, 1,
-0.7152526, -0.5194248, -1.595213, 0.6039216, 1, 0, 1,
-0.7061254, -0.7272217, -1.678196, 0.5960785, 1, 0, 1,
-0.6912353, -0.0157219, -1.001586, 0.5882353, 1, 0, 1,
-0.6901655, 1.309468, 1.275436, 0.5843138, 1, 0, 1,
-0.6888509, -0.956815, -0.5980306, 0.5764706, 1, 0, 1,
-0.6870661, 0.1819964, -1.938403, 0.572549, 1, 0, 1,
-0.6859215, 0.7619685, -0.5082119, 0.5647059, 1, 0, 1,
-0.6810992, -0.2881583, -0.3659855, 0.5607843, 1, 0, 1,
-0.6762212, 1.846164, 0.330269, 0.5529412, 1, 0, 1,
-0.6747203, -0.9234538, -3.415768, 0.5490196, 1, 0, 1,
-0.6699395, -0.7432936, -2.083655, 0.5411765, 1, 0, 1,
-0.66624, 0.005559414, -0.8602567, 0.5372549, 1, 0, 1,
-0.6660795, -0.6506913, -2.33555, 0.5294118, 1, 0, 1,
-0.6649356, -0.773591, -3.178742, 0.5254902, 1, 0, 1,
-0.6625142, 0.166802, -1.769736, 0.5176471, 1, 0, 1,
-0.6604425, 0.5021818, -1.389444, 0.5137255, 1, 0, 1,
-0.6601767, 0.719785, 1.041218, 0.5058824, 1, 0, 1,
-0.6596399, 1.485318, -0.3745434, 0.5019608, 1, 0, 1,
-0.6575605, 0.6499602, -1.154688, 0.4941176, 1, 0, 1,
-0.6554995, 0.6084999, -1.707595, 0.4862745, 1, 0, 1,
-0.6518675, -2.502028, -2.916754, 0.4823529, 1, 0, 1,
-0.6508149, -0.4380621, -3.597621, 0.4745098, 1, 0, 1,
-0.6380607, -0.4598553, -2.519701, 0.4705882, 1, 0, 1,
-0.6372947, -1.23713, -3.338044, 0.4627451, 1, 0, 1,
-0.6370702, 0.05312156, -0.2535723, 0.4588235, 1, 0, 1,
-0.6368467, -0.1167433, -4.238944, 0.4509804, 1, 0, 1,
-0.6300534, -1.61611, -3.523456, 0.4470588, 1, 0, 1,
-0.6270802, -0.2914384, -1.686117, 0.4392157, 1, 0, 1,
-0.6225932, -1.854178, -2.212186, 0.4352941, 1, 0, 1,
-0.6199118, -0.4354767, -1.240279, 0.427451, 1, 0, 1,
-0.61558, 0.1487095, -4.138702, 0.4235294, 1, 0, 1,
-0.6100687, 0.04060665, -1.774427, 0.4156863, 1, 0, 1,
-0.6033081, -1.016942, -2.663046, 0.4117647, 1, 0, 1,
-0.600943, -0.6198695, -3.270157, 0.4039216, 1, 0, 1,
-0.6007584, -0.7961481, -2.409187, 0.3960784, 1, 0, 1,
-0.5985144, -0.5945967, -3.356094, 0.3921569, 1, 0, 1,
-0.5978923, -1.387299, -2.374425, 0.3843137, 1, 0, 1,
-0.5931236, 1.193457, 0.603489, 0.3803922, 1, 0, 1,
-0.5837712, 1.371769, -0.774061, 0.372549, 1, 0, 1,
-0.5788647, 0.7826681, 1.155988, 0.3686275, 1, 0, 1,
-0.5771154, 1.067618, -0.179722, 0.3607843, 1, 0, 1,
-0.5735417, -1.459158, -1.950494, 0.3568628, 1, 0, 1,
-0.5695532, 1.382191, -0.03478018, 0.3490196, 1, 0, 1,
-0.5601437, 0.66285, -0.7407031, 0.345098, 1, 0, 1,
-0.5564904, 0.4028652, -0.6962239, 0.3372549, 1, 0, 1,
-0.5548156, 0.07453762, -1.711829, 0.3333333, 1, 0, 1,
-0.5503974, 0.4796909, -1.248519, 0.3254902, 1, 0, 1,
-0.5426051, -0.4513083, -1.451041, 0.3215686, 1, 0, 1,
-0.5412464, 0.6534752, 0.7617515, 0.3137255, 1, 0, 1,
-0.5392235, -0.6037096, -1.373965, 0.3098039, 1, 0, 1,
-0.5329301, -0.4502906, -3.312574, 0.3019608, 1, 0, 1,
-0.5323535, 0.6432157, -1.305432, 0.2941177, 1, 0, 1,
-0.5253477, -0.06919894, -2.945697, 0.2901961, 1, 0, 1,
-0.5219668, -1.098222, -5.295207, 0.282353, 1, 0, 1,
-0.5210447, 1.894868, 1.129715, 0.2784314, 1, 0, 1,
-0.5111702, 0.3207724, 0.2256055, 0.2705882, 1, 0, 1,
-0.511061, 1.933696, 0.1742527, 0.2666667, 1, 0, 1,
-0.5108901, 0.5328968, 0.7752253, 0.2588235, 1, 0, 1,
-0.5105992, -1.184183, -3.185003, 0.254902, 1, 0, 1,
-0.5005966, 0.1159909, -1.768567, 0.2470588, 1, 0, 1,
-0.4984727, -1.950161, -3.971277, 0.2431373, 1, 0, 1,
-0.4978116, 0.1012012, -1.624471, 0.2352941, 1, 0, 1,
-0.4970984, 0.6058326, -1.096847, 0.2313726, 1, 0, 1,
-0.4899333, 2.121337, -0.6288484, 0.2235294, 1, 0, 1,
-0.4889812, 0.3022897, -0.5959234, 0.2196078, 1, 0, 1,
-0.4882315, -0.8936557, -2.400001, 0.2117647, 1, 0, 1,
-0.4875925, -1.357169, -3.38441, 0.2078431, 1, 0, 1,
-0.4850685, -2.745275, -1.930997, 0.2, 1, 0, 1,
-0.4822821, -1.50546, -4.134894, 0.1921569, 1, 0, 1,
-0.4808291, -0.8198243, -2.822735, 0.1882353, 1, 0, 1,
-0.4786056, 1.376618, -1.299324, 0.1803922, 1, 0, 1,
-0.4764819, -0.9441125, -1.654881, 0.1764706, 1, 0, 1,
-0.4757709, 0.8612254, -1.091469, 0.1686275, 1, 0, 1,
-0.4702655, -0.1194798, -0.402285, 0.1647059, 1, 0, 1,
-0.4683947, -0.006399256, -2.38174, 0.1568628, 1, 0, 1,
-0.4621516, 1.92257, -0.2067734, 0.1529412, 1, 0, 1,
-0.462052, 1.747016, -0.2771682, 0.145098, 1, 0, 1,
-0.4613438, 2.05055, -1.832839, 0.1411765, 1, 0, 1,
-0.4608992, 2.030642, -0.3763224, 0.1333333, 1, 0, 1,
-0.4603226, 0.9605128, -0.3979169, 0.1294118, 1, 0, 1,
-0.4584201, 1.590843, -0.3380369, 0.1215686, 1, 0, 1,
-0.4556805, 0.1754984, -0.5955514, 0.1176471, 1, 0, 1,
-0.4481102, -1.887019, -3.415733, 0.1098039, 1, 0, 1,
-0.4476932, -0.3253364, -2.310327, 0.1058824, 1, 0, 1,
-0.4472698, -0.1482209, -2.930846, 0.09803922, 1, 0, 1,
-0.4459254, 0.4568586, -0.7403482, 0.09019608, 1, 0, 1,
-0.4447738, 0.5244855, 0.4933253, 0.08627451, 1, 0, 1,
-0.4422826, -1.408663, -4.841299, 0.07843138, 1, 0, 1,
-0.4387848, -0.6897638, -4.324412, 0.07450981, 1, 0, 1,
-0.4372927, 0.7748542, -1.5998, 0.06666667, 1, 0, 1,
-0.4370867, 1.748824, -0.5563233, 0.0627451, 1, 0, 1,
-0.4315508, 0.1306506, -0.4777458, 0.05490196, 1, 0, 1,
-0.430376, 1.763007, 1.244714, 0.05098039, 1, 0, 1,
-0.4245577, 0.1113835, -2.663825, 0.04313726, 1, 0, 1,
-0.4234824, 1.461509, -1.11206, 0.03921569, 1, 0, 1,
-0.423417, -0.8770653, -1.607787, 0.03137255, 1, 0, 1,
-0.4210034, -0.2049839, -2.450957, 0.02745098, 1, 0, 1,
-0.4096268, -2.835069, -2.343446, 0.01960784, 1, 0, 1,
-0.4091689, 2.145693, -0.6582605, 0.01568628, 1, 0, 1,
-0.4086106, -0.9371434, -2.238714, 0.007843138, 1, 0, 1,
-0.4079508, -0.3910233, -1.55606, 0.003921569, 1, 0, 1,
-0.4036635, -0.3514749, -3.117002, 0, 1, 0.003921569, 1,
-0.401412, 0.5723402, -1.374349, 0, 1, 0.01176471, 1,
-0.4003857, -1.920037, -4.823349, 0, 1, 0.01568628, 1,
-0.3899889, 0.8214533, -0.0964992, 0, 1, 0.02352941, 1,
-0.3887745, 0.07955974, -0.1377252, 0, 1, 0.02745098, 1,
-0.3886468, 0.3191821, 0.3955507, 0, 1, 0.03529412, 1,
-0.3838651, -0.1707482, -0.1904702, 0, 1, 0.03921569, 1,
-0.3795084, 0.3496858, -0.6143465, 0, 1, 0.04705882, 1,
-0.3792232, 0.2467742, -1.025372, 0, 1, 0.05098039, 1,
-0.3792065, 0.3324258, -2.743617, 0, 1, 0.05882353, 1,
-0.376963, 0.1969053, -1.648701, 0, 1, 0.0627451, 1,
-0.3769159, -1.36866, -2.385856, 0, 1, 0.07058824, 1,
-0.3767371, 1.014151, -0.6967753, 0, 1, 0.07450981, 1,
-0.3744373, 1.204566, -0.2608903, 0, 1, 0.08235294, 1,
-0.3716373, 0.248577, 0.2577, 0, 1, 0.08627451, 1,
-0.3694426, 0.2716019, -1.287506, 0, 1, 0.09411765, 1,
-0.3689736, 0.9455101, -0.8587861, 0, 1, 0.1019608, 1,
-0.3687916, 0.8914097, -0.09985279, 0, 1, 0.1058824, 1,
-0.3670263, 0.3345205, 1.44251, 0, 1, 0.1137255, 1,
-0.3627356, -0.6726015, -3.341039, 0, 1, 0.1176471, 1,
-0.3519993, 1.662275, 0.05399116, 0, 1, 0.1254902, 1,
-0.3517413, 0.6180591, -1.322188, 0, 1, 0.1294118, 1,
-0.3484468, -0.7830679, -3.487175, 0, 1, 0.1372549, 1,
-0.3436976, 0.5682923, -1.383201, 0, 1, 0.1411765, 1,
-0.3434473, -0.5840928, -3.936119, 0, 1, 0.1490196, 1,
-0.3424026, 1.093741, -1.57806, 0, 1, 0.1529412, 1,
-0.3419957, -0.2798925, -2.037471, 0, 1, 0.1607843, 1,
-0.3395893, 0.7971892, -0.05930119, 0, 1, 0.1647059, 1,
-0.3354401, -0.7136927, -3.097479, 0, 1, 0.172549, 1,
-0.3347349, 0.1098027, -2.897088, 0, 1, 0.1764706, 1,
-0.3318872, 0.04255227, -1.006183, 0, 1, 0.1843137, 1,
-0.319728, 0.09826639, -4.204306, 0, 1, 0.1882353, 1,
-0.3185377, -0.7827087, -3.952798, 0, 1, 0.1960784, 1,
-0.3153619, -0.382819, -2.776764, 0, 1, 0.2039216, 1,
-0.3143384, -0.6043784, -3.020145, 0, 1, 0.2078431, 1,
-0.3113626, 0.3526121, -0.1994017, 0, 1, 0.2156863, 1,
-0.3090108, -1.195917, -3.174684, 0, 1, 0.2196078, 1,
-0.3088735, 0.6760123, 0.1379286, 0, 1, 0.227451, 1,
-0.3082923, 0.05780372, -1.792862, 0, 1, 0.2313726, 1,
-0.307787, 0.5507891, 0.5895585, 0, 1, 0.2392157, 1,
-0.3074742, -0.01514507, -2.897773, 0, 1, 0.2431373, 1,
-0.3068928, -0.3682343, -2.996791, 0, 1, 0.2509804, 1,
-0.3064834, 0.1398398, -1.240576, 0, 1, 0.254902, 1,
-0.3056333, -0.07588582, -1.740779, 0, 1, 0.2627451, 1,
-0.30019, -0.5369908, -3.1345, 0, 1, 0.2666667, 1,
-0.2991474, 1.756482, -0.2218854, 0, 1, 0.2745098, 1,
-0.2985886, 2.292599, 0.5199668, 0, 1, 0.2784314, 1,
-0.2975365, -0.3690137, -3.755647, 0, 1, 0.2862745, 1,
-0.2945673, -2.519875, -2.590397, 0, 1, 0.2901961, 1,
-0.2937748, 1.597911, -0.4815761, 0, 1, 0.2980392, 1,
-0.2916991, 1.100223, -0.06886242, 0, 1, 0.3058824, 1,
-0.2875355, -1.591614, -1.725968, 0, 1, 0.3098039, 1,
-0.2869267, 1.785683, -2.122472, 0, 1, 0.3176471, 1,
-0.2846757, 1.216019, -1.84452, 0, 1, 0.3215686, 1,
-0.2832283, -1.59256, -3.418626, 0, 1, 0.3294118, 1,
-0.2802099, -0.9363283, -3.01498, 0, 1, 0.3333333, 1,
-0.2793749, -1.275967, -2.663845, 0, 1, 0.3411765, 1,
-0.2787397, 0.7805818, -0.2478558, 0, 1, 0.345098, 1,
-0.2772832, -0.3992496, -1.14277, 0, 1, 0.3529412, 1,
-0.2768294, -0.2156219, -1.168543, 0, 1, 0.3568628, 1,
-0.2765092, -0.01788274, -2.614586, 0, 1, 0.3647059, 1,
-0.2700248, -2.403037, -3.077773, 0, 1, 0.3686275, 1,
-0.2683932, -0.7630941, -2.265954, 0, 1, 0.3764706, 1,
-0.2642792, -1.100876, -3.87171, 0, 1, 0.3803922, 1,
-0.2638846, -0.08075406, -0.3871541, 0, 1, 0.3882353, 1,
-0.26024, 0.8477094, -0.1815381, 0, 1, 0.3921569, 1,
-0.2567717, 0.1115273, 0.1833368, 0, 1, 0.4, 1,
-0.2533794, 0.1605315, -1.774388, 0, 1, 0.4078431, 1,
-0.2504437, 1.02678, 2.962828, 0, 1, 0.4117647, 1,
-0.2441931, -0.8312144, -2.970524, 0, 1, 0.4196078, 1,
-0.2433826, 1.221851, 0.4978558, 0, 1, 0.4235294, 1,
-0.2378206, 1.459751, -1.029521, 0, 1, 0.4313726, 1,
-0.2369135, -0.4335329, -3.59081, 0, 1, 0.4352941, 1,
-0.2344296, 0.218743, -1.765798, 0, 1, 0.4431373, 1,
-0.2333284, -0.8194601, -4.784099, 0, 1, 0.4470588, 1,
-0.2284321, 1.098393, -0.005191048, 0, 1, 0.454902, 1,
-0.2242731, 0.245423, -1.171336, 0, 1, 0.4588235, 1,
-0.2241543, -0.02455121, -2.643121, 0, 1, 0.4666667, 1,
-0.2207514, 1.455874, 0.7836726, 0, 1, 0.4705882, 1,
-0.2200072, 0.8900284, 0.2985007, 0, 1, 0.4784314, 1,
-0.218727, 0.3414324, -0.5839876, 0, 1, 0.4823529, 1,
-0.2168883, -0.5424772, -3.532961, 0, 1, 0.4901961, 1,
-0.2161078, -0.1799648, -3.452697, 0, 1, 0.4941176, 1,
-0.2106699, 0.08651863, -0.2861605, 0, 1, 0.5019608, 1,
-0.2106193, -0.07113502, -1.330025, 0, 1, 0.509804, 1,
-0.2104944, -0.5370545, -1.370028, 0, 1, 0.5137255, 1,
-0.2073584, -0.07698625, -0.5300077, 0, 1, 0.5215687, 1,
-0.206085, 1.995719, 0.2809158, 0, 1, 0.5254902, 1,
-0.1983015, -0.868104, -4.198983, 0, 1, 0.5333334, 1,
-0.1966072, 1.586248, -0.2714248, 0, 1, 0.5372549, 1,
-0.195783, 1.034093, -0.2358986, 0, 1, 0.5450981, 1,
-0.1955739, -0.8327325, -3.325297, 0, 1, 0.5490196, 1,
-0.1910436, -1.02486, -1.397698, 0, 1, 0.5568628, 1,
-0.1904937, -1.571203, -4.111692, 0, 1, 0.5607843, 1,
-0.1842003, 0.2904602, -1.017642, 0, 1, 0.5686275, 1,
-0.1813733, 0.6882408, -4.55422, 0, 1, 0.572549, 1,
-0.180527, -0.4027331, -2.105157, 0, 1, 0.5803922, 1,
-0.180383, 0.1745364, -1.836759, 0, 1, 0.5843138, 1,
-0.1766282, 0.6341216, 0.3713104, 0, 1, 0.5921569, 1,
-0.1763656, 0.3255953, -0.6682011, 0, 1, 0.5960785, 1,
-0.176016, 0.09147138, 1.13565, 0, 1, 0.6039216, 1,
-0.1712808, 1.62034, 0.2390674, 0, 1, 0.6117647, 1,
-0.1593893, -1.932716, -3.987527, 0, 1, 0.6156863, 1,
-0.1590334, -0.01454756, -2.834679, 0, 1, 0.6235294, 1,
-0.1580491, -1.837628, -1.914619, 0, 1, 0.627451, 1,
-0.1567038, -1.179939, -2.269344, 0, 1, 0.6352941, 1,
-0.1545801, -1.831039, -2.898021, 0, 1, 0.6392157, 1,
-0.1500989, -0.5528778, -3.066449, 0, 1, 0.6470588, 1,
-0.1435006, 1.210275, 0.2995967, 0, 1, 0.6509804, 1,
-0.1392412, 0.4360922, -1.869291, 0, 1, 0.6588235, 1,
-0.135145, -0.7935312, -3.673131, 0, 1, 0.6627451, 1,
-0.1337036, 0.1903375, -0.5129446, 0, 1, 0.6705883, 1,
-0.1334257, -1.420146, -2.247169, 0, 1, 0.6745098, 1,
-0.1314468, 0.01317161, -2.350714, 0, 1, 0.682353, 1,
-0.1306111, 0.9822897, 0.6260844, 0, 1, 0.6862745, 1,
-0.1305625, 0.893532, 0.8064624, 0, 1, 0.6941177, 1,
-0.1250904, -1.048408, -4.721816, 0, 1, 0.7019608, 1,
-0.120203, 1.542342, -0.1378969, 0, 1, 0.7058824, 1,
-0.1159278, -1.021129, -3.626524, 0, 1, 0.7137255, 1,
-0.1129581, 0.07613946, -1.546641, 0, 1, 0.7176471, 1,
-0.1126318, -1.635232, -4.104737, 0, 1, 0.7254902, 1,
-0.1054084, -0.4027513, -3.996552, 0, 1, 0.7294118, 1,
-0.1012596, 0.2625695, -0.4417472, 0, 1, 0.7372549, 1,
-0.0986423, 0.05176958, 0.1305479, 0, 1, 0.7411765, 1,
-0.09740984, -0.9994526, -4.349336, 0, 1, 0.7490196, 1,
-0.0952506, 1.194884, -0.3058775, 0, 1, 0.7529412, 1,
-0.09471511, -1.428061, -2.227229, 0, 1, 0.7607843, 1,
-0.094323, -2.073368, -2.189054, 0, 1, 0.7647059, 1,
-0.09298325, -1.022353, -2.849478, 0, 1, 0.772549, 1,
-0.09068704, 1.618683, 0.3258895, 0, 1, 0.7764706, 1,
-0.08829436, 0.2488272, 0.4783676, 0, 1, 0.7843137, 1,
-0.08815166, 0.2248132, 0.2028281, 0, 1, 0.7882353, 1,
-0.08454709, 0.3274768, -1.61373, 0, 1, 0.7960784, 1,
-0.07863197, 0.0309756, -0.8580552, 0, 1, 0.8039216, 1,
-0.07701433, 1.051026, 1.63004, 0, 1, 0.8078431, 1,
-0.07224461, 0.335373, -0.4465996, 0, 1, 0.8156863, 1,
-0.06846342, -0.1173917, -1.132239, 0, 1, 0.8196079, 1,
-0.06417286, 1.000014, 1.175078, 0, 1, 0.827451, 1,
-0.06328986, -0.7645866, -2.956911, 0, 1, 0.8313726, 1,
-0.06254632, -0.742465, -1.434687, 0, 1, 0.8392157, 1,
-0.06250197, 1.094252, 1.137103, 0, 1, 0.8431373, 1,
-0.06240452, -1.205352, -3.848914, 0, 1, 0.8509804, 1,
-0.05989204, 0.100374, -0.389468, 0, 1, 0.854902, 1,
-0.05349239, -0.1397687, -2.708318, 0, 1, 0.8627451, 1,
-0.05348156, 0.7596917, 0.9217791, 0, 1, 0.8666667, 1,
-0.05308538, 0.2611766, -0.1797435, 0, 1, 0.8745098, 1,
-0.05150455, -0.09826511, -0.5978619, 0, 1, 0.8784314, 1,
-0.04926454, -0.8311298, -2.660906, 0, 1, 0.8862745, 1,
-0.04578481, -0.1165113, -1.956296, 0, 1, 0.8901961, 1,
-0.03802831, 0.4363826, 0.07684892, 0, 1, 0.8980392, 1,
-0.03506975, 0.7102544, 0.3524153, 0, 1, 0.9058824, 1,
-0.034225, 0.565605, -1.280115, 0, 1, 0.9098039, 1,
-0.03247695, -1.183476, -2.84293, 0, 1, 0.9176471, 1,
-0.02915025, 1.006934, -0.5284558, 0, 1, 0.9215686, 1,
-0.02355241, 1.496626, 0.6021934, 0, 1, 0.9294118, 1,
-0.02269467, -1.663538, -1.53457, 0, 1, 0.9333333, 1,
-0.02003971, -1.657139, -2.95984, 0, 1, 0.9411765, 1,
-0.01656068, 0.6569137, -2.377811, 0, 1, 0.945098, 1,
-0.01482952, 0.007245386, -1.97854, 0, 1, 0.9529412, 1,
-0.01385984, 0.1060837, 1.371101, 0, 1, 0.9568627, 1,
-0.011864, -0.0670956, -4.844564, 0, 1, 0.9647059, 1,
-0.008986416, -0.5110258, -3.461133, 0, 1, 0.9686275, 1,
-0.007589683, 0.2392072, 0.7263286, 0, 1, 0.9764706, 1,
-0.007155292, 0.05284804, -0.5285541, 0, 1, 0.9803922, 1,
-0.005641299, -0.3599449, -3.041228, 0, 1, 0.9882353, 1,
-0.005285576, 0.3961093, 0.3501605, 0, 1, 0.9921569, 1,
-0.003459524, 0.121496, 0.6805864, 0, 1, 1, 1,
-0.001132469, -1.423082, -3.106028, 0, 0.9921569, 1, 1,
-0.001077906, -1.297121, -2.276289, 0, 0.9882353, 1, 1,
0.002072376, -0.4947904, 1.711695, 0, 0.9803922, 1, 1,
0.005106015, -0.5943394, 3.227112, 0, 0.9764706, 1, 1,
0.005765134, -0.4462389, 4.353059, 0, 0.9686275, 1, 1,
0.01162732, -0.386025, 3.643039, 0, 0.9647059, 1, 1,
0.01474421, 0.7956683, 1.559636, 0, 0.9568627, 1, 1,
0.02389847, -0.07244983, 2.568861, 0, 0.9529412, 1, 1,
0.02434609, 1.430212, 0.02958571, 0, 0.945098, 1, 1,
0.02556736, -0.2143543, 1.901679, 0, 0.9411765, 1, 1,
0.02763513, -0.04486733, 1.866147, 0, 0.9333333, 1, 1,
0.03026821, 0.4015767, 0.2625724, 0, 0.9294118, 1, 1,
0.03433799, -1.730775, 5.152512, 0, 0.9215686, 1, 1,
0.03940579, 0.8644149, -0.2233681, 0, 0.9176471, 1, 1,
0.04154017, -0.3022791, 3.119155, 0, 0.9098039, 1, 1,
0.04270181, 0.2597434, -0.7939664, 0, 0.9058824, 1, 1,
0.04361261, 0.1382864, 0.6751284, 0, 0.8980392, 1, 1,
0.04772381, -0.1882504, 3.054621, 0, 0.8901961, 1, 1,
0.05025806, 0.4718447, -0.3552594, 0, 0.8862745, 1, 1,
0.05118658, 0.4578943, -0.8717692, 0, 0.8784314, 1, 1,
0.05679644, -0.9608281, 2.979809, 0, 0.8745098, 1, 1,
0.05805555, 0.8186441, -0.7837263, 0, 0.8666667, 1, 1,
0.06530683, -0.1469378, 2.35923, 0, 0.8627451, 1, 1,
0.06756727, 0.8410756, -0.05704913, 0, 0.854902, 1, 1,
0.0697439, -0.2780743, 3.364588, 0, 0.8509804, 1, 1,
0.07508205, 0.5795959, 0.6063571, 0, 0.8431373, 1, 1,
0.07567232, 1.004557, -0.0809093, 0, 0.8392157, 1, 1,
0.07725204, -0.1231759, 1.42886, 0, 0.8313726, 1, 1,
0.07885989, -1.104717, 4.021026, 0, 0.827451, 1, 1,
0.07951358, 1.067434, 0.6940562, 0, 0.8196079, 1, 1,
0.08819679, 1.317556, -0.5988344, 0, 0.8156863, 1, 1,
0.08956686, 0.8404007, -1.292965, 0, 0.8078431, 1, 1,
0.09407665, -1.319908, 3.463034, 0, 0.8039216, 1, 1,
0.09474824, -0.7438647, 3.719443, 0, 0.7960784, 1, 1,
0.09957002, -1.141737, 2.465271, 0, 0.7882353, 1, 1,
0.09982274, -0.4286831, 2.343244, 0, 0.7843137, 1, 1,
0.1014684, 0.1910357, -1.038434, 0, 0.7764706, 1, 1,
0.1024071, -2.359866, 4.204823, 0, 0.772549, 1, 1,
0.1034027, 0.0110435, 2.882346, 0, 0.7647059, 1, 1,
0.104558, -0.3074259, 1.400591, 0, 0.7607843, 1, 1,
0.1117558, -0.7146467, 1.915447, 0, 0.7529412, 1, 1,
0.1155022, -1.181273, 2.927489, 0, 0.7490196, 1, 1,
0.1199213, -0.5802847, 3.378582, 0, 0.7411765, 1, 1,
0.1214153, -0.4536033, 2.242644, 0, 0.7372549, 1, 1,
0.121782, -1.377589, 2.907484, 0, 0.7294118, 1, 1,
0.1219406, -0.90784, 3.701973, 0, 0.7254902, 1, 1,
0.1240718, 0.3460298, -2.083649, 0, 0.7176471, 1, 1,
0.1387686, -0.318152, -0.6914318, 0, 0.7137255, 1, 1,
0.1430366, 0.3267997, -0.05174449, 0, 0.7058824, 1, 1,
0.1439736, 0.02981557, -0.1496596, 0, 0.6980392, 1, 1,
0.14536, -0.3854103, 2.07339, 0, 0.6941177, 1, 1,
0.1455609, 1.008385, -1.055009, 0, 0.6862745, 1, 1,
0.145629, 0.767226, -0.4330401, 0, 0.682353, 1, 1,
0.1458032, -1.383132, 4.435505, 0, 0.6745098, 1, 1,
0.1506274, -0.839278, 3.29183, 0, 0.6705883, 1, 1,
0.1549846, 0.213775, 0.5235731, 0, 0.6627451, 1, 1,
0.1575636, 0.04519715, 1.373872, 0, 0.6588235, 1, 1,
0.1639523, 0.3367153, 1.119806, 0, 0.6509804, 1, 1,
0.164453, 1.753374, 1.513693, 0, 0.6470588, 1, 1,
0.1687918, 1.198972, -0.3154395, 0, 0.6392157, 1, 1,
0.1695133, 0.2669812, 0.6639142, 0, 0.6352941, 1, 1,
0.1705953, 0.4436797, 0.3357058, 0, 0.627451, 1, 1,
0.1711727, 0.4470347, 0.599043, 0, 0.6235294, 1, 1,
0.1747385, 1.188636, -0.4906428, 0, 0.6156863, 1, 1,
0.174969, 2.004683, 1.45633, 0, 0.6117647, 1, 1,
0.1750565, 0.7356285, -0.6081131, 0, 0.6039216, 1, 1,
0.1770315, -1.089738, 1.626218, 0, 0.5960785, 1, 1,
0.1833666, 0.4729523, 0.6930674, 0, 0.5921569, 1, 1,
0.1893138, -1.17657, 2.731857, 0, 0.5843138, 1, 1,
0.1906078, 0.6699697, 0.293966, 0, 0.5803922, 1, 1,
0.2031808, 0.2424539, 1.334246, 0, 0.572549, 1, 1,
0.2031918, -0.7035897, 3.837352, 0, 0.5686275, 1, 1,
0.2032505, 0.2543883, 1.812481, 0, 0.5607843, 1, 1,
0.2040989, 0.7035692, -1.192904, 0, 0.5568628, 1, 1,
0.2049733, 0.04872878, 1.753754, 0, 0.5490196, 1, 1,
0.2062865, -1.45365, 1.663629, 0, 0.5450981, 1, 1,
0.2102954, -0.4232762, 2.046885, 0, 0.5372549, 1, 1,
0.2104309, -0.01253399, -0.09208861, 0, 0.5333334, 1, 1,
0.2121349, -1.277563, 3.901681, 0, 0.5254902, 1, 1,
0.2127823, -0.04045995, 2.404119, 0, 0.5215687, 1, 1,
0.2143063, -1.130308, 2.702077, 0, 0.5137255, 1, 1,
0.2143243, -0.2254536, 4.21575, 0, 0.509804, 1, 1,
0.2209517, 0.1683926, 0.5005895, 0, 0.5019608, 1, 1,
0.2245905, -0.4330136, 3.068198, 0, 0.4941176, 1, 1,
0.2288357, 0.6315657, -0.9354456, 0, 0.4901961, 1, 1,
0.2306061, -0.2294508, 3.177052, 0, 0.4823529, 1, 1,
0.2309578, 1.199885, -0.7472546, 0, 0.4784314, 1, 1,
0.2344697, 0.1089315, 1.047235, 0, 0.4705882, 1, 1,
0.2352122, 1.057696, 1.787048, 0, 0.4666667, 1, 1,
0.2395593, 0.2018104, 0.4454734, 0, 0.4588235, 1, 1,
0.2412383, -1.544294, 2.287272, 0, 0.454902, 1, 1,
0.2447015, 0.04529034, 0.2166311, 0, 0.4470588, 1, 1,
0.2463749, -1.193853, 3.282444, 0, 0.4431373, 1, 1,
0.2514245, -0.7469146, 2.383388, 0, 0.4352941, 1, 1,
0.2521331, 1.525192, -0.6322796, 0, 0.4313726, 1, 1,
0.2527238, -1.552694, 2.012399, 0, 0.4235294, 1, 1,
0.2579597, 0.04195171, 1.71159, 0, 0.4196078, 1, 1,
0.2583837, 1.027031, -0.6639263, 0, 0.4117647, 1, 1,
0.2589356, 1.141229, 1.301507, 0, 0.4078431, 1, 1,
0.2615748, 1.891048, -0.5573211, 0, 0.4, 1, 1,
0.26424, -1.31202, 2.839839, 0, 0.3921569, 1, 1,
0.268868, -1.646737, 3.14531, 0, 0.3882353, 1, 1,
0.2737463, 0.9219757, -0.2944868, 0, 0.3803922, 1, 1,
0.2741654, -0.5797036, 3.985955, 0, 0.3764706, 1, 1,
0.2751666, 0.1800349, 0.6829453, 0, 0.3686275, 1, 1,
0.2803473, 0.8534023, 0.06048151, 0, 0.3647059, 1, 1,
0.2839182, -0.6823556, 3.170052, 0, 0.3568628, 1, 1,
0.2866254, 0.2208549, 2.438221, 0, 0.3529412, 1, 1,
0.2877, -1.771053, 3.498424, 0, 0.345098, 1, 1,
0.2895146, 0.09123567, 0.2471219, 0, 0.3411765, 1, 1,
0.2901897, 0.1392068, 0.1073774, 0, 0.3333333, 1, 1,
0.2917023, 0.485732, 0.8159122, 0, 0.3294118, 1, 1,
0.2936227, 1.618229, 0.9557799, 0, 0.3215686, 1, 1,
0.2962448, 1.273517, -0.1988387, 0, 0.3176471, 1, 1,
0.2982877, 0.6309069, 0.1207218, 0, 0.3098039, 1, 1,
0.3092194, 0.1664991, 2.007731, 0, 0.3058824, 1, 1,
0.3121204, 0.1329885, 2.113369, 0, 0.2980392, 1, 1,
0.314815, 0.9838054, -0.2971311, 0, 0.2901961, 1, 1,
0.3185494, 0.5222582, 0.5481913, 0, 0.2862745, 1, 1,
0.3187949, -0.9778393, 3.383842, 0, 0.2784314, 1, 1,
0.3192887, -1.028727, 3.031576, 0, 0.2745098, 1, 1,
0.3202499, 0.1323725, 1.651399, 0, 0.2666667, 1, 1,
0.3204698, 0.5731246, 0.06566561, 0, 0.2627451, 1, 1,
0.3216446, 1.649719, -0.4449404, 0, 0.254902, 1, 1,
0.3288569, -1.025995, 4.171251, 0, 0.2509804, 1, 1,
0.3311512, -1.03902, 3.949184, 0, 0.2431373, 1, 1,
0.3331615, -0.08527742, 1.016704, 0, 0.2392157, 1, 1,
0.3334845, -0.1912899, 2.846676, 0, 0.2313726, 1, 1,
0.3349729, -0.1881885, 2.272621, 0, 0.227451, 1, 1,
0.3371342, -0.4853175, 3.344967, 0, 0.2196078, 1, 1,
0.3372734, 1.709434, 0.5396832, 0, 0.2156863, 1, 1,
0.3377047, -0.569295, 3.49016, 0, 0.2078431, 1, 1,
0.3379452, -0.14418, 2.02792, 0, 0.2039216, 1, 1,
0.3382886, 2.505738, -1.450167, 0, 0.1960784, 1, 1,
0.3406483, 0.8421845, -0.2036032, 0, 0.1882353, 1, 1,
0.3407966, 2.823846, -0.380247, 0, 0.1843137, 1, 1,
0.3423772, -2.256695, 2.734813, 0, 0.1764706, 1, 1,
0.3426773, 0.8379489, 1.385267, 0, 0.172549, 1, 1,
0.3453941, 1.004496, -0.6835541, 0, 0.1647059, 1, 1,
0.3484817, 1.633975, -0.788619, 0, 0.1607843, 1, 1,
0.3491641, 0.7465161, -1.147944, 0, 0.1529412, 1, 1,
0.3526417, 0.6189161, 0.8670776, 0, 0.1490196, 1, 1,
0.3540231, 0.08705228, -1.171046, 0, 0.1411765, 1, 1,
0.3548871, -1.088351, 2.875335, 0, 0.1372549, 1, 1,
0.3578205, 0.4417638, 1.762064, 0, 0.1294118, 1, 1,
0.3606264, 0.9033583, 1.062692, 0, 0.1254902, 1, 1,
0.3612064, -0.803657, 1.996261, 0, 0.1176471, 1, 1,
0.363402, -0.7953859, 3.161175, 0, 0.1137255, 1, 1,
0.3653499, 1.573076, -0.4292109, 0, 0.1058824, 1, 1,
0.3677928, 0.4293771, 0.7297813, 0, 0.09803922, 1, 1,
0.3722797, -0.2488718, 1.904806, 0, 0.09411765, 1, 1,
0.3735499, -0.3761671, 3.351492, 0, 0.08627451, 1, 1,
0.3761627, 2.055218, -0.1619332, 0, 0.08235294, 1, 1,
0.3765686, 0.2836888, 0.2484664, 0, 0.07450981, 1, 1,
0.3770707, 1.483754, 0.3565136, 0, 0.07058824, 1, 1,
0.3796725, -0.8393483, 3.302988, 0, 0.0627451, 1, 1,
0.380258, -0.6750418, 3.462825, 0, 0.05882353, 1, 1,
0.3823843, 0.04858346, -1.318714, 0, 0.05098039, 1, 1,
0.3826872, 0.289744, 2.279269, 0, 0.04705882, 1, 1,
0.3847092, 1.017942, 1.055451, 0, 0.03921569, 1, 1,
0.38582, -0.583402, 2.407871, 0, 0.03529412, 1, 1,
0.3894258, -0.4881015, 2.493541, 0, 0.02745098, 1, 1,
0.3944871, -0.2382748, 2.175917, 0, 0.02352941, 1, 1,
0.3959216, 0.7482715, 1.88259, 0, 0.01568628, 1, 1,
0.3993419, -0.6417643, 2.710889, 0, 0.01176471, 1, 1,
0.3996573, -0.8768907, 3.825319, 0, 0.003921569, 1, 1,
0.4014362, -1.225975, 1.98128, 0.003921569, 0, 1, 1,
0.4098491, 0.3094456, 1.127933, 0.007843138, 0, 1, 1,
0.4124208, -1.120553, 1.136819, 0.01568628, 0, 1, 1,
0.4186549, 1.843328, 2.200447, 0.01960784, 0, 1, 1,
0.4228604, -0.5234634, 2.72082, 0.02745098, 0, 1, 1,
0.4268334, -0.01877654, 0.2133435, 0.03137255, 0, 1, 1,
0.4287041, 0.1279865, 0.7097453, 0.03921569, 0, 1, 1,
0.4332205, 0.9172126, 0.2428308, 0.04313726, 0, 1, 1,
0.4350261, 1.111091, 1.397442, 0.05098039, 0, 1, 1,
0.4358969, 0.9860658, 0.4687671, 0.05490196, 0, 1, 1,
0.438085, -0.9004652, 3.430829, 0.0627451, 0, 1, 1,
0.4529743, 0.2964634, 1.480963, 0.06666667, 0, 1, 1,
0.4535578, 0.3237534, 0.6608701, 0.07450981, 0, 1, 1,
0.4546861, 0.971676, 0.712444, 0.07843138, 0, 1, 1,
0.4562248, -1.89808, 2.469809, 0.08627451, 0, 1, 1,
0.4608996, -0.2511134, 2.705199, 0.09019608, 0, 1, 1,
0.4614583, 1.129625, -0.05192757, 0.09803922, 0, 1, 1,
0.4615406, 0.2546348, 0.2042746, 0.1058824, 0, 1, 1,
0.4630873, -0.1125654, 1.435252, 0.1098039, 0, 1, 1,
0.4632368, -1.784976, 2.39362, 0.1176471, 0, 1, 1,
0.4632952, -0.9170685, 1.705098, 0.1215686, 0, 1, 1,
0.4637782, 1.0384, 0.5641133, 0.1294118, 0, 1, 1,
0.4648014, 0.42017, -0.2552685, 0.1333333, 0, 1, 1,
0.4648334, 1.821422, -1.325562, 0.1411765, 0, 1, 1,
0.4650788, 0.02433311, 1.904004, 0.145098, 0, 1, 1,
0.4743803, -0.314139, 1.893083, 0.1529412, 0, 1, 1,
0.479136, -0.8630801, 2.498255, 0.1568628, 0, 1, 1,
0.4792468, 0.7690197, 1.891171, 0.1647059, 0, 1, 1,
0.4802663, 1.887433, -0.8418315, 0.1686275, 0, 1, 1,
0.4819473, 0.3596988, -0.08050335, 0.1764706, 0, 1, 1,
0.4831977, 0.1166816, 0.565727, 0.1803922, 0, 1, 1,
0.4890936, 2.094072, -1.628132, 0.1882353, 0, 1, 1,
0.4909819, -1.341181, 2.678585, 0.1921569, 0, 1, 1,
0.4960611, -0.6065539, 2.486746, 0.2, 0, 1, 1,
0.4965472, -0.04911413, 1.02219, 0.2078431, 0, 1, 1,
0.5037101, 1.646403, 0.3191607, 0.2117647, 0, 1, 1,
0.5051854, 0.8387688, -0.8427557, 0.2196078, 0, 1, 1,
0.5089523, 0.5340636, 0.9370075, 0.2235294, 0, 1, 1,
0.5102085, -1.483983, 1.481626, 0.2313726, 0, 1, 1,
0.51658, 0.2026065, 1.104661, 0.2352941, 0, 1, 1,
0.5242172, -0.9823823, 3.107931, 0.2431373, 0, 1, 1,
0.5289496, 0.467784, -0.9712678, 0.2470588, 0, 1, 1,
0.5290878, 1.060491, 2.008102, 0.254902, 0, 1, 1,
0.5307964, -0.07005319, 2.009319, 0.2588235, 0, 1, 1,
0.5345659, -0.09860512, 0.5790438, 0.2666667, 0, 1, 1,
0.535571, 1.344275, 1.239936, 0.2705882, 0, 1, 1,
0.5412952, -0.2541344, 1.97996, 0.2784314, 0, 1, 1,
0.5422533, -2.050765e-05, 1.060238, 0.282353, 0, 1, 1,
0.5475916, -0.3835445, 2.047712, 0.2901961, 0, 1, 1,
0.5600681, -0.8071831, 3.202243, 0.2941177, 0, 1, 1,
0.5617006, 1.327813, 1.517422, 0.3019608, 0, 1, 1,
0.5669993, -0.6357127, 1.796008, 0.3098039, 0, 1, 1,
0.574522, 0.1891194, 0.6357937, 0.3137255, 0, 1, 1,
0.5753806, -1.005056, 1.404853, 0.3215686, 0, 1, 1,
0.5773105, -1.353749, 2.283059, 0.3254902, 0, 1, 1,
0.577343, 1.95742, -0.7762254, 0.3333333, 0, 1, 1,
0.5789943, 1.276618, 0.5928923, 0.3372549, 0, 1, 1,
0.5852339, 0.02903686, 2.467361, 0.345098, 0, 1, 1,
0.5935917, -0.4302478, 0.7808422, 0.3490196, 0, 1, 1,
0.5938669, -1.218069, 2.997511, 0.3568628, 0, 1, 1,
0.5940492, 1.556418, 1.413701, 0.3607843, 0, 1, 1,
0.59469, 0.7879622, 1.410928, 0.3686275, 0, 1, 1,
0.5983315, -0.8083771, 2.246017, 0.372549, 0, 1, 1,
0.6012108, 0.250883, 0.06742808, 0.3803922, 0, 1, 1,
0.6027359, 1.613197, 0.143603, 0.3843137, 0, 1, 1,
0.6097921, 0.1068616, 1.145408, 0.3921569, 0, 1, 1,
0.6141106, 1.584181, -0.2156398, 0.3960784, 0, 1, 1,
0.6146887, -0.03433728, 1.617831, 0.4039216, 0, 1, 1,
0.6166415, 0.9345282, 0.02978658, 0.4117647, 0, 1, 1,
0.6270915, -2.3315, 3.720179, 0.4156863, 0, 1, 1,
0.6295084, 0.6394764, 1.012756, 0.4235294, 0, 1, 1,
0.63359, 0.4864579, 1.448769, 0.427451, 0, 1, 1,
0.6408849, 0.5582238, 2.458104, 0.4352941, 0, 1, 1,
0.6409923, 1.062823, -0.3341924, 0.4392157, 0, 1, 1,
0.6434398, -0.7051185, 2.656342, 0.4470588, 0, 1, 1,
0.6441592, -0.4650067, 2.209589, 0.4509804, 0, 1, 1,
0.6532778, 0.5522911, -0.09556942, 0.4588235, 0, 1, 1,
0.6547124, -1.22273, 2.86042, 0.4627451, 0, 1, 1,
0.6547772, -0.9654447, 1.456467, 0.4705882, 0, 1, 1,
0.6573079, 2.463018, -0.3374038, 0.4745098, 0, 1, 1,
0.6582323, 2.130168, -0.4161938, 0.4823529, 0, 1, 1,
0.6598893, -0.4638989, 2.522275, 0.4862745, 0, 1, 1,
0.6615524, -1.48796, 3.804499, 0.4941176, 0, 1, 1,
0.6616261, 0.07325367, 1.683373, 0.5019608, 0, 1, 1,
0.6626615, 1.637766, 0.585741, 0.5058824, 0, 1, 1,
0.6635996, -0.3372506, 2.518231, 0.5137255, 0, 1, 1,
0.6651496, 0.08031709, 0.9848992, 0.5176471, 0, 1, 1,
0.6729111, 0.8226233, 1.421089, 0.5254902, 0, 1, 1,
0.6731328, -0.4024056, 1.598942, 0.5294118, 0, 1, 1,
0.6764231, -1.720061, 2.235091, 0.5372549, 0, 1, 1,
0.6846415, -0.223568, 0.4700011, 0.5411765, 0, 1, 1,
0.6860145, 0.8408203, 1.582495, 0.5490196, 0, 1, 1,
0.686583, -0.8320825, 2.275087, 0.5529412, 0, 1, 1,
0.6897264, -0.9494568, 5.257656, 0.5607843, 0, 1, 1,
0.6953272, 1.2794, 0.8002699, 0.5647059, 0, 1, 1,
0.6963838, -1.082087, 1.749385, 0.572549, 0, 1, 1,
0.7009447, 0.2136232, 1.08083, 0.5764706, 0, 1, 1,
0.7058825, 1.427024, 0.5910752, 0.5843138, 0, 1, 1,
0.7064214, -0.1478487, 1.863603, 0.5882353, 0, 1, 1,
0.7161314, -0.1851081, 2.069675, 0.5960785, 0, 1, 1,
0.7190369, 0.4491065, 0.7545234, 0.6039216, 0, 1, 1,
0.7192895, -0.8555034, 2.663609, 0.6078432, 0, 1, 1,
0.7221524, 0.9828051, -1.180512, 0.6156863, 0, 1, 1,
0.7271383, 1.073647, 2.343918, 0.6196079, 0, 1, 1,
0.7365627, -0.3118186, 2.274322, 0.627451, 0, 1, 1,
0.7405515, -0.1756147, 0.3046734, 0.6313726, 0, 1, 1,
0.7439728, 0.7912182, 0.729074, 0.6392157, 0, 1, 1,
0.7463759, 0.4213102, 1.42275, 0.6431373, 0, 1, 1,
0.7465059, 0.4625189, 1.281499, 0.6509804, 0, 1, 1,
0.74896, -0.4817023, 2.804054, 0.654902, 0, 1, 1,
0.7502709, 0.1273684, 1.40936, 0.6627451, 0, 1, 1,
0.7555249, 0.5068091, -0.2300137, 0.6666667, 0, 1, 1,
0.7567932, -0.04113457, 1.3415, 0.6745098, 0, 1, 1,
0.7580463, -0.5440724, 2.18917, 0.6784314, 0, 1, 1,
0.7583532, -0.6548711, 3.561307, 0.6862745, 0, 1, 1,
0.7717921, -1.237182, 1.740719, 0.6901961, 0, 1, 1,
0.7724496, -1.112712, 2.920428, 0.6980392, 0, 1, 1,
0.7730033, -2.188512, 3.071839, 0.7058824, 0, 1, 1,
0.7786843, 0.4209127, 1.415535, 0.7098039, 0, 1, 1,
0.7830713, 0.1105872, 3.535982, 0.7176471, 0, 1, 1,
0.7848681, -0.264549, 3.929811, 0.7215686, 0, 1, 1,
0.7867021, 1.316349, 0.1677448, 0.7294118, 0, 1, 1,
0.7875086, 1.401263, 0.0582935, 0.7333333, 0, 1, 1,
0.7898911, 0.09986636, 1.422782, 0.7411765, 0, 1, 1,
0.792217, -0.5594994, 0.2541924, 0.7450981, 0, 1, 1,
0.7951649, -0.2138767, 2.851378, 0.7529412, 0, 1, 1,
0.797196, 0.7340513, -0.8201827, 0.7568628, 0, 1, 1,
0.8076462, 0.09968183, 1.407553, 0.7647059, 0, 1, 1,
0.8092145, 0.08170046, 0.7834441, 0.7686275, 0, 1, 1,
0.8143926, 0.2858272, -0.5023238, 0.7764706, 0, 1, 1,
0.816166, -0.1908888, 1.632828, 0.7803922, 0, 1, 1,
0.8183851, 0.4252553, 0.8456143, 0.7882353, 0, 1, 1,
0.8195477, -0.454147, 1.600599, 0.7921569, 0, 1, 1,
0.8209664, -0.3919784, 1.696548, 0.8, 0, 1, 1,
0.825102, 1.104391, 0.2818884, 0.8078431, 0, 1, 1,
0.8289406, -0.8355454, 2.310332, 0.8117647, 0, 1, 1,
0.8308091, -0.8179277, 4.327611, 0.8196079, 0, 1, 1,
0.8356417, 1.603598, 0.2162171, 0.8235294, 0, 1, 1,
0.8382765, 0.4025925, 2.038133, 0.8313726, 0, 1, 1,
0.8425554, 1.383487, 3.246894, 0.8352941, 0, 1, 1,
0.8435102, -0.312057, 2.437228, 0.8431373, 0, 1, 1,
0.8441921, 0.2406926, 1.431417, 0.8470588, 0, 1, 1,
0.8445867, -0.954426, 1.955758, 0.854902, 0, 1, 1,
0.8582104, 0.2861016, 2.465404, 0.8588235, 0, 1, 1,
0.8590675, -1.242089, 2.139075, 0.8666667, 0, 1, 1,
0.8596457, 0.6172725, 1.564914, 0.8705882, 0, 1, 1,
0.8660343, -0.5167041, 1.413831, 0.8784314, 0, 1, 1,
0.8670613, 0.4211462, 0.4867907, 0.8823529, 0, 1, 1,
0.8674215, 0.4056709, 1.183273, 0.8901961, 0, 1, 1,
0.8676692, -2.063792, 4.059525, 0.8941177, 0, 1, 1,
0.8708908, -0.7301513, 2.786686, 0.9019608, 0, 1, 1,
0.8795152, 0.2124913, 1.90695, 0.9098039, 0, 1, 1,
0.8818213, -0.4380316, 3.108819, 0.9137255, 0, 1, 1,
0.8855939, -2.054361, 2.807229, 0.9215686, 0, 1, 1,
0.8946338, -0.3308423, 2.699337, 0.9254902, 0, 1, 1,
0.8974394, 0.2321544, 0.3776675, 0.9333333, 0, 1, 1,
0.8975365, 0.2429929, -0.5179001, 0.9372549, 0, 1, 1,
0.902383, -1.939547, 2.61471, 0.945098, 0, 1, 1,
0.9046478, -0.1529091, 0.1853216, 0.9490196, 0, 1, 1,
0.9056168, 0.3956321, 0.2659336, 0.9568627, 0, 1, 1,
0.9130051, 1.455694, 0.5802106, 0.9607843, 0, 1, 1,
0.9153868, -1.443022, 2.506721, 0.9686275, 0, 1, 1,
0.9154382, 0.6883326, 0.9847702, 0.972549, 0, 1, 1,
0.9156744, -1.57614, 2.682267, 0.9803922, 0, 1, 1,
0.9168954, 1.577796, 1.075286, 0.9843137, 0, 1, 1,
0.9196638, -0.6394635, 2.888153, 0.9921569, 0, 1, 1,
0.9202811, -0.1948852, 1.473333, 0.9960784, 0, 1, 1,
0.9216729, -1.320495, 4.991513, 1, 0, 0.9960784, 1,
0.9292564, -1.485858, 1.805116, 1, 0, 0.9882353, 1,
0.9310963, 0.2927825, 1.768344, 1, 0, 0.9843137, 1,
0.9337642, -0.1407211, 2.280014, 1, 0, 0.9764706, 1,
0.9373587, -0.3263617, 1.486981, 1, 0, 0.972549, 1,
0.9429454, -1.497414, 2.864897, 1, 0, 0.9647059, 1,
0.9452322, 0.1328662, 0.6484675, 1, 0, 0.9607843, 1,
0.9478148, -1.187954, 2.764853, 1, 0, 0.9529412, 1,
0.9485286, 0.4439395, 0.673567, 1, 0, 0.9490196, 1,
0.9545707, 0.5472777, 0.3795329, 1, 0, 0.9411765, 1,
0.9589334, -2.384418, 4.186474, 1, 0, 0.9372549, 1,
0.9672884, 0.1127128, 0.1987071, 1, 0, 0.9294118, 1,
0.9673388, 0.8397897, 0.9077753, 1, 0, 0.9254902, 1,
0.9729799, 1.74536, -0.9703751, 1, 0, 0.9176471, 1,
0.9735918, 0.8220289, 2.908348, 1, 0, 0.9137255, 1,
0.9795039, 1.276203, -0.02643644, 1, 0, 0.9058824, 1,
0.9872533, -0.02860567, 3.079061, 1, 0, 0.9019608, 1,
1.005522, 1.427901, 1.126548, 1, 0, 0.8941177, 1,
1.008048, -0.1251129, 3.165794, 1, 0, 0.8862745, 1,
1.009002, 0.628465, -0.756413, 1, 0, 0.8823529, 1,
1.009777, -0.3365908, 4.730904, 1, 0, 0.8745098, 1,
1.010911, 1.342286, 0.5205518, 1, 0, 0.8705882, 1,
1.015887, -0.8240395, 3.105917, 1, 0, 0.8627451, 1,
1.020504, -0.04415668, 1.66282, 1, 0, 0.8588235, 1,
1.020893, 0.3268166, 1.549424, 1, 0, 0.8509804, 1,
1.025729, 0.1314762, 1.123376, 1, 0, 0.8470588, 1,
1.027536, 0.5279394, 2.107528, 1, 0, 0.8392157, 1,
1.03083, -1.260587, 2.384984, 1, 0, 0.8352941, 1,
1.046907, 0.8948564, 0.500991, 1, 0, 0.827451, 1,
1.051195, 0.8046399, 1.014834, 1, 0, 0.8235294, 1,
1.05137, -0.595021, 2.336936, 1, 0, 0.8156863, 1,
1.052678, 0.02141638, 1.03493, 1, 0, 0.8117647, 1,
1.056091, -0.2613175, 1.012226, 1, 0, 0.8039216, 1,
1.05999, 0.5900261, 1.281659, 1, 0, 0.7960784, 1,
1.063152, -0.906696, 4.228337, 1, 0, 0.7921569, 1,
1.067205, 0.5607916, 0.3605863, 1, 0, 0.7843137, 1,
1.07496, -0.2704228, 4.056725, 1, 0, 0.7803922, 1,
1.076034, 0.08109367, 1.078027, 1, 0, 0.772549, 1,
1.082561, 0.588927, 1.437492, 1, 0, 0.7686275, 1,
1.082606, -0.9361538, 3.343286, 1, 0, 0.7607843, 1,
1.092397, 0.9806969, 0.28538, 1, 0, 0.7568628, 1,
1.096965, -0.5250688, 3.298387, 1, 0, 0.7490196, 1,
1.099501, -0.9873561, 1.120883, 1, 0, 0.7450981, 1,
1.101163, 1.111586, 2.385902, 1, 0, 0.7372549, 1,
1.106945, 1.012722, 1.343234, 1, 0, 0.7333333, 1,
1.11518, -0.6682376, 0.9765614, 1, 0, 0.7254902, 1,
1.123721, -1.47841, 2.102274, 1, 0, 0.7215686, 1,
1.128996, 0.0645678, -0.2791659, 1, 0, 0.7137255, 1,
1.133299, -0.9279292, 0.94516, 1, 0, 0.7098039, 1,
1.144513, 1.734381, 0.2011118, 1, 0, 0.7019608, 1,
1.148393, 0.3115672, 0.3093818, 1, 0, 0.6941177, 1,
1.149065, -1.477265, 3.828963, 1, 0, 0.6901961, 1,
1.153246, 0.7162112, 2.827402, 1, 0, 0.682353, 1,
1.15369, -1.974856, 1.586474, 1, 0, 0.6784314, 1,
1.158874, 0.3101546, 2.891159, 1, 0, 0.6705883, 1,
1.164149, 0.1924606, 3.193866, 1, 0, 0.6666667, 1,
1.169349, 0.3233113, 1.522113, 1, 0, 0.6588235, 1,
1.174078, 0.1548408, 1.888231, 1, 0, 0.654902, 1,
1.186504, -1.060305, 1.33685, 1, 0, 0.6470588, 1,
1.199322, -2.200091, 3.248114, 1, 0, 0.6431373, 1,
1.200083, 0.9474785, 0.6367718, 1, 0, 0.6352941, 1,
1.203998, -0.3526823, 2.348471, 1, 0, 0.6313726, 1,
1.206393, 0.3163706, 2.714634, 1, 0, 0.6235294, 1,
1.210698, -0.3384585, 2.42359, 1, 0, 0.6196079, 1,
1.2145, 0.178799, 1.634498, 1, 0, 0.6117647, 1,
1.22137, 0.202026, 0.6290023, 1, 0, 0.6078432, 1,
1.22381, -0.004050586, 1.398875, 1, 0, 0.6, 1,
1.24003, -1.027543, 2.071073, 1, 0, 0.5921569, 1,
1.245449, 0.8144534, 1.661264, 1, 0, 0.5882353, 1,
1.249692, 0.1456581, 0.818029, 1, 0, 0.5803922, 1,
1.252293, 0.299936, 0.587994, 1, 0, 0.5764706, 1,
1.255023, -1.696271, 1.153739, 1, 0, 0.5686275, 1,
1.262647, -0.1231318, 2.907777, 1, 0, 0.5647059, 1,
1.273844, 0.2313795, 0.6305659, 1, 0, 0.5568628, 1,
1.273938, 0.5660311, 0.2623093, 1, 0, 0.5529412, 1,
1.274189, -0.4189102, 2.99304, 1, 0, 0.5450981, 1,
1.277946, -0.8460132, 2.197383, 1, 0, 0.5411765, 1,
1.279887, -1.261335, 4.717301, 1, 0, 0.5333334, 1,
1.285573, 0.2499809, 1.022336, 1, 0, 0.5294118, 1,
1.28726, 0.2273159, 2.58089, 1, 0, 0.5215687, 1,
1.300908, -0.2709612, 2.658939, 1, 0, 0.5176471, 1,
1.308753, 0.6194217, 0.5502108, 1, 0, 0.509804, 1,
1.309451, -0.783218, 0.3277547, 1, 0, 0.5058824, 1,
1.326892, -0.1767492, 0.5316014, 1, 0, 0.4980392, 1,
1.328018, -0.290048, 1.014266, 1, 0, 0.4901961, 1,
1.342317, -0.777019, 2.607693, 1, 0, 0.4862745, 1,
1.34304, 0.03350282, 2.498996, 1, 0, 0.4784314, 1,
1.344503, 0.7438619, 0.5064778, 1, 0, 0.4745098, 1,
1.344579, 0.5612676, 1.594139, 1, 0, 0.4666667, 1,
1.347538, 1.901194, 0.9251661, 1, 0, 0.4627451, 1,
1.351526, 1.54997, 1.698344, 1, 0, 0.454902, 1,
1.352354, -0.3742943, 2.161956, 1, 0, 0.4509804, 1,
1.354849, -0.1753284, 1.131649, 1, 0, 0.4431373, 1,
1.36272, 0.0643205, 2.104052, 1, 0, 0.4392157, 1,
1.377061, 0.05060266, 2.691227, 1, 0, 0.4313726, 1,
1.386995, 1.903098, 2.121749, 1, 0, 0.427451, 1,
1.404532, -0.2638373, -0.1902554, 1, 0, 0.4196078, 1,
1.416403, -1.111623, 2.309313, 1, 0, 0.4156863, 1,
1.419772, 0.1669933, 1.341831, 1, 0, 0.4078431, 1,
1.421476, 0.2781052, 2.543664, 1, 0, 0.4039216, 1,
1.460756, 1.060571, 1.062676, 1, 0, 0.3960784, 1,
1.469774, -1.040501, 1.938753, 1, 0, 0.3882353, 1,
1.474381, -1.662424, 2.668016, 1, 0, 0.3843137, 1,
1.476497, 1.034409, -0.797834, 1, 0, 0.3764706, 1,
1.48694, -0.2105957, 4.551777, 1, 0, 0.372549, 1,
1.49527, 1.02984, 1.236343, 1, 0, 0.3647059, 1,
1.522469, 0.0283995, 2.330508, 1, 0, 0.3607843, 1,
1.530872, 1.054588, 2.156666, 1, 0, 0.3529412, 1,
1.538704, -0.2086771, -0.4307925, 1, 0, 0.3490196, 1,
1.53909, -0.05218446, 0.5240291, 1, 0, 0.3411765, 1,
1.54101, 0.6063818, 2.200197, 1, 0, 0.3372549, 1,
1.541804, 0.6847911, 1.734596, 1, 0, 0.3294118, 1,
1.556812, -0.3998102, 1.566943, 1, 0, 0.3254902, 1,
1.586074, 0.2422552, 2.140105, 1, 0, 0.3176471, 1,
1.588161, -0.1376587, 2.724264, 1, 0, 0.3137255, 1,
1.601818, -1.674347, 3.293979, 1, 0, 0.3058824, 1,
1.607781, 0.0241157, 3.074131, 1, 0, 0.2980392, 1,
1.628218, -0.8653877, 0.6241097, 1, 0, 0.2941177, 1,
1.62999, -1.771236, 1.998809, 1, 0, 0.2862745, 1,
1.641158, -1.995557, 3.494682, 1, 0, 0.282353, 1,
1.64449, -0.1387016, 1.261844, 1, 0, 0.2745098, 1,
1.649262, 0.5106079, 2.732946, 1, 0, 0.2705882, 1,
1.649951, 0.6193923, 0.6023287, 1, 0, 0.2627451, 1,
1.655844, -0.6918626, 2.137125, 1, 0, 0.2588235, 1,
1.657804, -0.8092575, 0.5352647, 1, 0, 0.2509804, 1,
1.662659, -0.2690364, 1.20338, 1, 0, 0.2470588, 1,
1.666991, -1.011712, 2.132519, 1, 0, 0.2392157, 1,
1.671837, -1.284913, 0.9451293, 1, 0, 0.2352941, 1,
1.672177, 1.993937, 0.4402027, 1, 0, 0.227451, 1,
1.687095, 0.3650126, -0.7372044, 1, 0, 0.2235294, 1,
1.69643, -1.026578, 2.171848, 1, 0, 0.2156863, 1,
1.717004, 1.156664, 2.138061, 1, 0, 0.2117647, 1,
1.724103, 0.3715504, 0.2670408, 1, 0, 0.2039216, 1,
1.763709, -0.9103651, 0.3877332, 1, 0, 0.1960784, 1,
1.769872, 0.4738539, 1.819486, 1, 0, 0.1921569, 1,
1.812919, 0.4557217, 1.500811, 1, 0, 0.1843137, 1,
1.845086, -1.067048, 5.034836, 1, 0, 0.1803922, 1,
1.848681, -0.8597631, 2.949958, 1, 0, 0.172549, 1,
1.869304, -1.840437, 1.063139, 1, 0, 0.1686275, 1,
1.891956, -0.9324316, 2.64066, 1, 0, 0.1607843, 1,
1.928567, 0.8804008, 1.255693, 1, 0, 0.1568628, 1,
1.942842, -1.033029, 2.554382, 1, 0, 0.1490196, 1,
1.965055, 1.416443, 1.480973, 1, 0, 0.145098, 1,
1.972309, 0.8891961, 0.8450741, 1, 0, 0.1372549, 1,
1.978724, 0.2907417, 2.369627, 1, 0, 0.1333333, 1,
1.993851, 1.064494, 0.6621105, 1, 0, 0.1254902, 1,
2.012582, -0.6086183, 1.162913, 1, 0, 0.1215686, 1,
2.065715, 0.1414982, 3.27569, 1, 0, 0.1137255, 1,
2.096973, -0.7641495, 2.168125, 1, 0, 0.1098039, 1,
2.102681, -1.292903, 2.475492, 1, 0, 0.1019608, 1,
2.124087, 1.657579, 0.1758617, 1, 0, 0.09411765, 1,
2.164462, 2.05591, 1.340943, 1, 0, 0.09019608, 1,
2.187599, 0.9587556, 3.512627, 1, 0, 0.08235294, 1,
2.208723, -1.547991, 1.895255, 1, 0, 0.07843138, 1,
2.259787, -1.688236, 1.32052, 1, 0, 0.07058824, 1,
2.290151, -1.107709, 2.25857, 1, 0, 0.06666667, 1,
2.30119, 0.003674913, 0.2664406, 1, 0, 0.05882353, 1,
2.376877, 0.06414032, 0.5528858, 1, 0, 0.05490196, 1,
2.390876, -0.233617, 3.428829, 1, 0, 0.04705882, 1,
2.401042, -1.875541, 3.397442, 1, 0, 0.04313726, 1,
2.504051, 1.025929, 2.184695, 1, 0, 0.03529412, 1,
2.531446, -1.401301, 2.028369, 1, 0, 0.03137255, 1,
2.664149, -0.3149703, 3.466302, 1, 0, 0.02352941, 1,
2.718207, 1.713193, -0.01020913, 1, 0, 0.01960784, 1,
2.922719, -0.6749642, 1.183894, 1, 0, 0.01176471, 1,
4.008193, -0.7834958, 0.7473623, 1, 0, 0.007843138, 1
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
0.3700086, -3.794255, -7.083917, 0, -0.5, 0.5, 0.5,
0.3700086, -3.794255, -7.083917, 1, -0.5, 0.5, 0.5,
0.3700086, -3.794255, -7.083917, 1, 1.5, 0.5, 0.5,
0.3700086, -3.794255, -7.083917, 0, 1.5, 0.5, 0.5
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
-4.50152, -0.005611658, -7.083917, 0, -0.5, 0.5, 0.5,
-4.50152, -0.005611658, -7.083917, 1, -0.5, 0.5, 0.5,
-4.50152, -0.005611658, -7.083917, 1, 1.5, 0.5, 0.5,
-4.50152, -0.005611658, -7.083917, 0, 1.5, 0.5, 0.5
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
-4.50152, -3.794255, -0.0187757, 0, -0.5, 0.5, 0.5,
-4.50152, -3.794255, -0.0187757, 1, -0.5, 0.5, 0.5,
-4.50152, -3.794255, -0.0187757, 1, 1.5, 0.5, 0.5,
-4.50152, -3.794255, -0.0187757, 0, 1.5, 0.5, 0.5
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
-2, -2.919953, -5.4535,
4, -2.919953, -5.4535,
-2, -2.919953, -5.4535,
-2, -3.06567, -5.725236,
0, -2.919953, -5.4535,
0, -3.06567, -5.725236,
2, -2.919953, -5.4535,
2, -3.06567, -5.725236,
4, -2.919953, -5.4535,
4, -3.06567, -5.725236
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
-2, -3.357104, -6.268709, 0, -0.5, 0.5, 0.5,
-2, -3.357104, -6.268709, 1, -0.5, 0.5, 0.5,
-2, -3.357104, -6.268709, 1, 1.5, 0.5, 0.5,
-2, -3.357104, -6.268709, 0, 1.5, 0.5, 0.5,
0, -3.357104, -6.268709, 0, -0.5, 0.5, 0.5,
0, -3.357104, -6.268709, 1, -0.5, 0.5, 0.5,
0, -3.357104, -6.268709, 1, 1.5, 0.5, 0.5,
0, -3.357104, -6.268709, 0, 1.5, 0.5, 0.5,
2, -3.357104, -6.268709, 0, -0.5, 0.5, 0.5,
2, -3.357104, -6.268709, 1, -0.5, 0.5, 0.5,
2, -3.357104, -6.268709, 1, 1.5, 0.5, 0.5,
2, -3.357104, -6.268709, 0, 1.5, 0.5, 0.5,
4, -3.357104, -6.268709, 0, -0.5, 0.5, 0.5,
4, -3.357104, -6.268709, 1, -0.5, 0.5, 0.5,
4, -3.357104, -6.268709, 1, 1.5, 0.5, 0.5,
4, -3.357104, -6.268709, 0, 1.5, 0.5, 0.5
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
-3.377321, -2, -5.4535,
-3.377321, 2, -5.4535,
-3.377321, -2, -5.4535,
-3.564687, -2, -5.725236,
-3.377321, -1, -5.4535,
-3.564687, -1, -5.725236,
-3.377321, 0, -5.4535,
-3.564687, 0, -5.725236,
-3.377321, 1, -5.4535,
-3.564687, 1, -5.725236,
-3.377321, 2, -5.4535,
-3.564687, 2, -5.725236
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
-3.93942, -2, -6.268709, 0, -0.5, 0.5, 0.5,
-3.93942, -2, -6.268709, 1, -0.5, 0.5, 0.5,
-3.93942, -2, -6.268709, 1, 1.5, 0.5, 0.5,
-3.93942, -2, -6.268709, 0, 1.5, 0.5, 0.5,
-3.93942, -1, -6.268709, 0, -0.5, 0.5, 0.5,
-3.93942, -1, -6.268709, 1, -0.5, 0.5, 0.5,
-3.93942, -1, -6.268709, 1, 1.5, 0.5, 0.5,
-3.93942, -1, -6.268709, 0, 1.5, 0.5, 0.5,
-3.93942, 0, -6.268709, 0, -0.5, 0.5, 0.5,
-3.93942, 0, -6.268709, 1, -0.5, 0.5, 0.5,
-3.93942, 0, -6.268709, 1, 1.5, 0.5, 0.5,
-3.93942, 0, -6.268709, 0, 1.5, 0.5, 0.5,
-3.93942, 1, -6.268709, 0, -0.5, 0.5, 0.5,
-3.93942, 1, -6.268709, 1, -0.5, 0.5, 0.5,
-3.93942, 1, -6.268709, 1, 1.5, 0.5, 0.5,
-3.93942, 1, -6.268709, 0, 1.5, 0.5, 0.5,
-3.93942, 2, -6.268709, 0, -0.5, 0.5, 0.5,
-3.93942, 2, -6.268709, 1, -0.5, 0.5, 0.5,
-3.93942, 2, -6.268709, 1, 1.5, 0.5, 0.5,
-3.93942, 2, -6.268709, 0, 1.5, 0.5, 0.5
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
-3.377321, -2.919953, -4,
-3.377321, -2.919953, 4,
-3.377321, -2.919953, -4,
-3.564687, -3.06567, -4,
-3.377321, -2.919953, -2,
-3.564687, -3.06567, -2,
-3.377321, -2.919953, 0,
-3.564687, -3.06567, 0,
-3.377321, -2.919953, 2,
-3.564687, -3.06567, 2,
-3.377321, -2.919953, 4,
-3.564687, -3.06567, 4
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
-3.93942, -3.357104, -4, 0, -0.5, 0.5, 0.5,
-3.93942, -3.357104, -4, 1, -0.5, 0.5, 0.5,
-3.93942, -3.357104, -4, 1, 1.5, 0.5, 0.5,
-3.93942, -3.357104, -4, 0, 1.5, 0.5, 0.5,
-3.93942, -3.357104, -2, 0, -0.5, 0.5, 0.5,
-3.93942, -3.357104, -2, 1, -0.5, 0.5, 0.5,
-3.93942, -3.357104, -2, 1, 1.5, 0.5, 0.5,
-3.93942, -3.357104, -2, 0, 1.5, 0.5, 0.5,
-3.93942, -3.357104, 0, 0, -0.5, 0.5, 0.5,
-3.93942, -3.357104, 0, 1, -0.5, 0.5, 0.5,
-3.93942, -3.357104, 0, 1, 1.5, 0.5, 0.5,
-3.93942, -3.357104, 0, 0, 1.5, 0.5, 0.5,
-3.93942, -3.357104, 2, 0, -0.5, 0.5, 0.5,
-3.93942, -3.357104, 2, 1, -0.5, 0.5, 0.5,
-3.93942, -3.357104, 2, 1, 1.5, 0.5, 0.5,
-3.93942, -3.357104, 2, 0, 1.5, 0.5, 0.5,
-3.93942, -3.357104, 4, 0, -0.5, 0.5, 0.5,
-3.93942, -3.357104, 4, 1, -0.5, 0.5, 0.5,
-3.93942, -3.357104, 4, 1, 1.5, 0.5, 0.5,
-3.93942, -3.357104, 4, 0, 1.5, 0.5, 0.5
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
-3.377321, -2.919953, -5.4535,
-3.377321, 2.90873, -5.4535,
-3.377321, -2.919953, 5.415948,
-3.377321, 2.90873, 5.415948,
-3.377321, -2.919953, -5.4535,
-3.377321, -2.919953, 5.415948,
-3.377321, 2.90873, -5.4535,
-3.377321, 2.90873, 5.415948,
-3.377321, -2.919953, -5.4535,
4.117338, -2.919953, -5.4535,
-3.377321, -2.919953, 5.415948,
4.117338, -2.919953, 5.415948,
-3.377321, 2.90873, -5.4535,
4.117338, 2.90873, -5.4535,
-3.377321, 2.90873, 5.415948,
4.117338, 2.90873, 5.415948,
4.117338, -2.919953, -5.4535,
4.117338, 2.90873, -5.4535,
4.117338, -2.919953, 5.415948,
4.117338, 2.90873, 5.415948,
4.117338, -2.919953, -5.4535,
4.117338, -2.919953, 5.415948,
4.117338, 2.90873, -5.4535,
4.117338, 2.90873, 5.415948
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
var radius = 7.706514;
var distance = 34.28715;
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
mvMatrix.translate( -0.3700086, 0.005611658, 0.0187757 );
mvMatrix.scale( 1.111783, 1.429557, 0.7665921 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.28715);
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
hydroxyethyltriazole<-read.table("hydroxyethyltriazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hydroxyethyltriazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyethyltriazole' not found
```

```r
y<-hydroxyethyltriazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyethyltriazole' not found
```

```r
z<-hydroxyethyltriazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyethyltriazole' not found
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
-3.268175, 0.04248334, -2.837461, 0, 0, 1, 1, 1,
-3.189055, 0.5205825, -2.378968, 1, 0, 0, 1, 1,
-3.117499, -0.3377349, -2.438356, 1, 0, 0, 1, 1,
-3.104022, 0.371566, -2.561149, 1, 0, 0, 1, 1,
-2.91873, -0.3942738, -3.211457, 1, 0, 0, 1, 1,
-2.903278, -0.7415231, -0.7057629, 1, 0, 0, 1, 1,
-2.885959, 0.7791246, -0.1717027, 0, 0, 0, 1, 1,
-2.773424, 1.14625, -2.58031, 0, 0, 0, 1, 1,
-2.726742, -1.379671, -3.066055, 0, 0, 0, 1, 1,
-2.699005, 0.6717286, -0.592193, 0, 0, 0, 1, 1,
-2.565157, -0.4567017, 0.3632845, 0, 0, 0, 1, 1,
-2.555886, -0.6839668, -0.8714347, 0, 0, 0, 1, 1,
-2.529963, 0.08510354, -1.79417, 0, 0, 0, 1, 1,
-2.501644, -1.282265, -1.989462, 1, 1, 1, 1, 1,
-2.500556, -0.1213953, -3.121028, 1, 1, 1, 1, 1,
-2.438621, -0.6894016, -2.260396, 1, 1, 1, 1, 1,
-2.423297, -0.1555464, -1.19768, 1, 1, 1, 1, 1,
-2.416936, -0.06006863, -1.580662, 1, 1, 1, 1, 1,
-2.325215, -1.276942, -2.102777, 1, 1, 1, 1, 1,
-2.323138, -0.04118406, -2.521898, 1, 1, 1, 1, 1,
-2.284587, -1.148722, -2.278437, 1, 1, 1, 1, 1,
-2.258723, -1.299554, -2.238879, 1, 1, 1, 1, 1,
-2.196508, -1.2249, -1.783178, 1, 1, 1, 1, 1,
-2.136327, -1.325015, -2.880363, 1, 1, 1, 1, 1,
-2.131774, -1.580184, -1.639624, 1, 1, 1, 1, 1,
-2.106978, -0.9039761, -2.219717, 1, 1, 1, 1, 1,
-2.086009, 0.6920639, -1.583033, 1, 1, 1, 1, 1,
-2.08496, 0.9121718, -1.4223, 1, 1, 1, 1, 1,
-2.063801, 0.6352288, -1.788783, 0, 0, 1, 1, 1,
-2.016365, 1.198388, -0.8235648, 1, 0, 0, 1, 1,
-2.009605, 0.02092762, 1.51553, 1, 0, 0, 1, 1,
-1.95278, 1.063192, 0.09290591, 1, 0, 0, 1, 1,
-1.935004, 2.508931, -0.8453046, 1, 0, 0, 1, 1,
-1.925664, 1.040623, -1.499203, 1, 0, 0, 1, 1,
-1.911669, 1.413341, -1.22386, 0, 0, 0, 1, 1,
-1.90679, 0.1976844, -0.5367477, 0, 0, 0, 1, 1,
-1.867343, 1.09605, -0.6934795, 0, 0, 0, 1, 1,
-1.85654, 1.060645, -0.7810737, 0, 0, 0, 1, 1,
-1.84088, -1.931203, -2.545605, 0, 0, 0, 1, 1,
-1.836468, -0.5031425, -2.311825, 0, 0, 0, 1, 1,
-1.831474, -0.180803, -3.022721, 0, 0, 0, 1, 1,
-1.821366, -0.3613344, -2.014854, 1, 1, 1, 1, 1,
-1.810402, 0.6109482, 0.1386144, 1, 1, 1, 1, 1,
-1.805895, -0.72026, -3.782229, 1, 1, 1, 1, 1,
-1.805692, -0.9020872, -2.078479, 1, 1, 1, 1, 1,
-1.782109, -0.1912845, -2.075342, 1, 1, 1, 1, 1,
-1.779814, 1.693881, -1.291252, 1, 1, 1, 1, 1,
-1.75934, -0.2863982, -0.943406, 1, 1, 1, 1, 1,
-1.75213, -2.469808, -1.410536, 1, 1, 1, 1, 1,
-1.736197, 0.339428, -3.049221, 1, 1, 1, 1, 1,
-1.729967, -0.06136519, -0.5155763, 1, 1, 1, 1, 1,
-1.724462, -0.7066151, -1.930319, 1, 1, 1, 1, 1,
-1.707936, -1.033235, -2.210786, 1, 1, 1, 1, 1,
-1.696737, 0.5691711, -0.7038001, 1, 1, 1, 1, 1,
-1.674705, 0.5469362, -3.027523, 1, 1, 1, 1, 1,
-1.659182, -0.3219883, -1.259679, 1, 1, 1, 1, 1,
-1.657635, 0.152632, -2.676191, 0, 0, 1, 1, 1,
-1.642194, -0.03115845, -1.198888, 1, 0, 0, 1, 1,
-1.618285, -0.0009597258, -0.9705246, 1, 0, 0, 1, 1,
-1.614082, 0.1936813, -2.772113, 1, 0, 0, 1, 1,
-1.613239, -0.3860254, 0.5331498, 1, 0, 0, 1, 1,
-1.61131, 0.8064597, 0.5264704, 1, 0, 0, 1, 1,
-1.591272, 1.305873, 0.3079306, 0, 0, 0, 1, 1,
-1.585802, -0.1927699, -1.872931, 0, 0, 0, 1, 1,
-1.583904, 0.4310113, 0.05058502, 0, 0, 0, 1, 1,
-1.575703, -0.5194801, -1.661668, 0, 0, 0, 1, 1,
-1.572978, -0.5947061, -2.736775, 0, 0, 0, 1, 1,
-1.569728, 0.03404856, -0.9616647, 0, 0, 0, 1, 1,
-1.564977, -0.6666026, -3.906211, 0, 0, 0, 1, 1,
-1.564316, -0.3516852, -0.5679293, 1, 1, 1, 1, 1,
-1.563719, -0.9462, -3.731708, 1, 1, 1, 1, 1,
-1.541936, -0.8957235, -1.865156, 1, 1, 1, 1, 1,
-1.515891, 0.5516089, -2.357485, 1, 1, 1, 1, 1,
-1.512836, 0.09385218, -1.380274, 1, 1, 1, 1, 1,
-1.512018, -0.1568436, -2.073267, 1, 1, 1, 1, 1,
-1.503838, 0.05959818, -2.2401, 1, 1, 1, 1, 1,
-1.503289, 1.189333, -0.8174669, 1, 1, 1, 1, 1,
-1.497807, -1.224691, -2.505883, 1, 1, 1, 1, 1,
-1.487841, -0.3800939, -1.350629, 1, 1, 1, 1, 1,
-1.472588, 1.229396, -0.8538755, 1, 1, 1, 1, 1,
-1.464288, 0.8355567, -0.1031238, 1, 1, 1, 1, 1,
-1.461053, -0.5924967, -3.021691, 1, 1, 1, 1, 1,
-1.459658, -1.040996, -3.441603, 1, 1, 1, 1, 1,
-1.443316, -0.5970903, -1.009467, 1, 1, 1, 1, 1,
-1.438973, -0.2180817, -1.853312, 0, 0, 1, 1, 1,
-1.432326, -0.2178317, -1.95892, 1, 0, 0, 1, 1,
-1.42499, -0.7914715, -1.509873, 1, 0, 0, 1, 1,
-1.422383, 0.04125039, -1.698721, 1, 0, 0, 1, 1,
-1.41894, 0.9586567, -3.353714, 1, 0, 0, 1, 1,
-1.406543, -1.015893, -2.357196, 1, 0, 0, 1, 1,
-1.373971, -0.6509311, -3.251749, 0, 0, 0, 1, 1,
-1.364852, 0.7818981, -1.706578, 0, 0, 0, 1, 1,
-1.355933, -1.173181, -2.691698, 0, 0, 0, 1, 1,
-1.353292, -0.001599187, -0.9656367, 0, 0, 0, 1, 1,
-1.351363, -1.010118, -2.893606, 0, 0, 0, 1, 1,
-1.339349, 0.08212306, -0.903093, 0, 0, 0, 1, 1,
-1.322606, -0.3604952, -0.6077366, 0, 0, 0, 1, 1,
-1.319211, 0.4183537, -1.638043, 1, 1, 1, 1, 1,
-1.318447, 1.397766, -0.7620234, 1, 1, 1, 1, 1,
-1.313526, -0.8496917, -3.018672, 1, 1, 1, 1, 1,
-1.291444, -0.3948616, -2.248296, 1, 1, 1, 1, 1,
-1.291179, -0.2117658, -0.8065369, 1, 1, 1, 1, 1,
-1.279578, -0.3026905, -2.534439, 1, 1, 1, 1, 1,
-1.27629, -1.468555, -0.191303, 1, 1, 1, 1, 1,
-1.27049, 1.012556, 0.2405955, 1, 1, 1, 1, 1,
-1.269365, -1.65389, -3.555012, 1, 1, 1, 1, 1,
-1.26662, -0.3707657, -2.778972, 1, 1, 1, 1, 1,
-1.264995, 0.2943827, -1.592494, 1, 1, 1, 1, 1,
-1.253048, 0.6989314, -0.23558, 1, 1, 1, 1, 1,
-1.251361, 1.329248, -0.9097937, 1, 1, 1, 1, 1,
-1.248514, 0.4385512, -1.751143, 1, 1, 1, 1, 1,
-1.248209, 1.111197, -1.594864, 1, 1, 1, 1, 1,
-1.232156, -0.7569426, -3.267963, 0, 0, 1, 1, 1,
-1.217325, 0.1676686, -2.468838, 1, 0, 0, 1, 1,
-1.212275, -0.164445, -2.253927, 1, 0, 0, 1, 1,
-1.1943, -1.613617, -0.8107745, 1, 0, 0, 1, 1,
-1.191232, 1.061642, -1.030393, 1, 0, 0, 1, 1,
-1.184007, 0.9891844, -1.552746, 1, 0, 0, 1, 1,
-1.163111, -1.778993, -3.288619, 0, 0, 0, 1, 1,
-1.162126, -0.9632045, -1.649622, 0, 0, 0, 1, 1,
-1.159579, -2.235033, -2.479252, 0, 0, 0, 1, 1,
-1.15716, 1.007991, 0.6843058, 0, 0, 0, 1, 1,
-1.154244, 0.1007679, 0.918471, 0, 0, 0, 1, 1,
-1.150017, -0.5052643, -1.849295, 0, 0, 0, 1, 1,
-1.145757, -1.662967, -1.835588, 0, 0, 0, 1, 1,
-1.145511, -1.164775, -3.110623, 1, 1, 1, 1, 1,
-1.140255, -0.02005764, -0.8895585, 1, 1, 1, 1, 1,
-1.138609, 0.6113239, -0.6941518, 1, 1, 1, 1, 1,
-1.135373, -0.8594648, -2.216237, 1, 1, 1, 1, 1,
-1.130524, -0.264993, -0.3901844, 1, 1, 1, 1, 1,
-1.126509, 1.959539, 0.7139856, 1, 1, 1, 1, 1,
-1.125106, -0.1395481, -0.9820174, 1, 1, 1, 1, 1,
-1.123401, 0.9097853, 0.1752071, 1, 1, 1, 1, 1,
-1.108532, -0.6585193, -0.4245851, 1, 1, 1, 1, 1,
-1.094563, -0.7068949, -2.531625, 1, 1, 1, 1, 1,
-1.087397, -0.7689432, -3.270391, 1, 1, 1, 1, 1,
-1.081369, -2.578014, -3.179836, 1, 1, 1, 1, 1,
-1.069332, -0.4081388, -2.019521, 1, 1, 1, 1, 1,
-1.068138, -1.400584, 0.3011275, 1, 1, 1, 1, 1,
-1.062305, -0.6319556, -1.42105, 1, 1, 1, 1, 1,
-1.054344, -1.318128, -2.713647, 0, 0, 1, 1, 1,
-1.053562, 0.1238339, -1.364154, 1, 0, 0, 1, 1,
-1.050702, -1.353761, -2.160679, 1, 0, 0, 1, 1,
-1.050688, -1.220684, -1.182221, 1, 0, 0, 1, 1,
-1.048523, 0.6673065, 0.6786315, 1, 0, 0, 1, 1,
-1.034207, 0.2413465, 0.208863, 1, 0, 0, 1, 1,
-1.030272, -1.116379, -3.823511, 0, 0, 0, 1, 1,
-1.022081, -0.05725666, -0.9844316, 0, 0, 0, 1, 1,
-1.01696, -0.1356135, -2.257801, 0, 0, 0, 1, 1,
-1.012664, 0.4057072, -0.9413331, 0, 0, 0, 1, 1,
-1.002113, -0.5226012, -2.624315, 0, 0, 0, 1, 1,
-0.9964885, 0.4961056, -1.410292, 0, 0, 0, 1, 1,
-0.9939963, -0.3829527, -2.509289, 0, 0, 0, 1, 1,
-0.99129, 0.1140873, -0.8532038, 1, 1, 1, 1, 1,
-0.9874951, 0.141105, -0.02240925, 1, 1, 1, 1, 1,
-0.9870489, 0.1005807, -1.404987, 1, 1, 1, 1, 1,
-0.9819189, -0.1180538, -1.885444, 1, 1, 1, 1, 1,
-0.9793825, 1.44685, 0.7032631, 1, 1, 1, 1, 1,
-0.9790267, -1.560741, -4.507305, 1, 1, 1, 1, 1,
-0.9707628, 0.2660604, 0.5229347, 1, 1, 1, 1, 1,
-0.9689639, 0.7526644, -0.6488069, 1, 1, 1, 1, 1,
-0.967554, 1.522129, -1.381354, 1, 1, 1, 1, 1,
-0.9658151, -0.5240122, -1.658092, 1, 1, 1, 1, 1,
-0.9644012, 0.1996361, -0.6268409, 1, 1, 1, 1, 1,
-0.955438, -0.2603771, -0.5126036, 1, 1, 1, 1, 1,
-0.954591, -1.603194, -0.7957535, 1, 1, 1, 1, 1,
-0.9411569, -1.53969, -1.776836, 1, 1, 1, 1, 1,
-0.9335847, -1.357686, -3.21388, 1, 1, 1, 1, 1,
-0.9325844, -1.008115, -1.246368, 0, 0, 1, 1, 1,
-0.9313699, -1.577884, -2.564839, 1, 0, 0, 1, 1,
-0.9239172, 0.163945, -1.649454, 1, 0, 0, 1, 1,
-0.9210855, -0.1924514, -2.750699, 1, 0, 0, 1, 1,
-0.9165595, 0.4923141, -2.731459, 1, 0, 0, 1, 1,
-0.9084308, -1.862205, -3.500947, 1, 0, 0, 1, 1,
-0.9077449, 0.3463341, -2.341361, 0, 0, 0, 1, 1,
-0.9075156, -1.241195, -1.358191, 0, 0, 0, 1, 1,
-0.9059552, -0.8217952, -1.198784, 0, 0, 0, 1, 1,
-0.9042922, 1.09459, -0.8196027, 0, 0, 0, 1, 1,
-0.8952797, 0.2523924, -2.595379, 0, 0, 0, 1, 1,
-0.8861849, 0.3936926, -1.358305, 0, 0, 0, 1, 1,
-0.8789051, -0.769105, -2.961919, 0, 0, 0, 1, 1,
-0.8786646, -0.1824906, -0.9514523, 1, 1, 1, 1, 1,
-0.8756974, -0.2958803, -0.5500821, 1, 1, 1, 1, 1,
-0.8745469, 0.8911699, -1.430296, 1, 1, 1, 1, 1,
-0.8736806, 0.7259579, -1.924405, 1, 1, 1, 1, 1,
-0.8705991, 1.164763, -0.4585345, 1, 1, 1, 1, 1,
-0.8702571, -0.5029427, -2.636971, 1, 1, 1, 1, 1,
-0.8663162, 1.697129, -0.003733056, 1, 1, 1, 1, 1,
-0.8628544, -1.396302, -3.402068, 1, 1, 1, 1, 1,
-0.8625906, -0.305866, -1.961061, 1, 1, 1, 1, 1,
-0.859758, -0.1613931, -1.702216, 1, 1, 1, 1, 1,
-0.858016, -0.08640318, -1.608423, 1, 1, 1, 1, 1,
-0.8547721, -0.4510806, -1.07081, 1, 1, 1, 1, 1,
-0.8534614, 0.5712796, -0.6905658, 1, 1, 1, 1, 1,
-0.8527086, -1.164375, -2.655877, 1, 1, 1, 1, 1,
-0.8503261, 2.060095, -1.427978, 1, 1, 1, 1, 1,
-0.843787, 1.970184, -1.277129, 0, 0, 1, 1, 1,
-0.8421012, -0.3654423, -2.844713, 1, 0, 0, 1, 1,
-0.8418074, 1.272314, 0.2702688, 1, 0, 0, 1, 1,
-0.838139, 2.240686, -1.810333, 1, 0, 0, 1, 1,
-0.8365703, -0.9183534, -0.6628847, 1, 0, 0, 1, 1,
-0.8282624, 1.324975, -0.8324462, 1, 0, 0, 1, 1,
-0.8270034, 0.05472157, -1.917647, 0, 0, 0, 1, 1,
-0.8257045, 0.4468235, -1.802445, 0, 0, 0, 1, 1,
-0.8243104, -0.9486049, -2.203288, 0, 0, 0, 1, 1,
-0.8000503, 0.9587924, 0.3264217, 0, 0, 0, 1, 1,
-0.795795, 0.71476, -1.226329, 0, 0, 0, 1, 1,
-0.7951233, -0.8195581, -3.240695, 0, 0, 0, 1, 1,
-0.7929127, 0.8066682, -0.06616412, 0, 0, 0, 1, 1,
-0.791365, 0.05252538, -1.341785, 1, 1, 1, 1, 1,
-0.7871485, -0.8525153, -1.202571, 1, 1, 1, 1, 1,
-0.7766441, -1.614347, -2.076158, 1, 1, 1, 1, 1,
-0.7720066, -2.798358, -3.188752, 1, 1, 1, 1, 1,
-0.7690484, -0.02458895, -2.174735, 1, 1, 1, 1, 1,
-0.7636055, 0.3191294, 0.1040347, 1, 1, 1, 1, 1,
-0.7605634, -0.3405763, -0.9898032, 1, 1, 1, 1, 1,
-0.7588064, 0.6023377, -1.440845, 1, 1, 1, 1, 1,
-0.7587224, -2.538045, -2.352676, 1, 1, 1, 1, 1,
-0.7583345, -1.031629, -2.504256, 1, 1, 1, 1, 1,
-0.757678, 0.9841257, -1.785177, 1, 1, 1, 1, 1,
-0.7522727, 1.454732, 1.056846, 1, 1, 1, 1, 1,
-0.7479885, -2.77891, -3.275684, 1, 1, 1, 1, 1,
-0.7456461, -0.9531803, -2.137501, 1, 1, 1, 1, 1,
-0.7450231, -0.1316985, -0.9721855, 1, 1, 1, 1, 1,
-0.7448547, 1.264156, 0.9087709, 0, 0, 1, 1, 1,
-0.7376777, -1.595212, -1.674007, 1, 0, 0, 1, 1,
-0.7353104, 0.004282744, -0.8913774, 1, 0, 0, 1, 1,
-0.7338163, -0.9712033, -3.360531, 1, 0, 0, 1, 1,
-0.7298679, 1.388523, -1.95845, 1, 0, 0, 1, 1,
-0.7294804, 0.1847014, -1.075443, 1, 0, 0, 1, 1,
-0.7269996, -0.8522835, -1.781168, 0, 0, 0, 1, 1,
-0.7266577, 1.310806, 0.7014336, 0, 0, 0, 1, 1,
-0.7152709, -0.05301322, -1.571994, 0, 0, 0, 1, 1,
-0.7152526, -0.5194248, -1.595213, 0, 0, 0, 1, 1,
-0.7061254, -0.7272217, -1.678196, 0, 0, 0, 1, 1,
-0.6912353, -0.0157219, -1.001586, 0, 0, 0, 1, 1,
-0.6901655, 1.309468, 1.275436, 0, 0, 0, 1, 1,
-0.6888509, -0.956815, -0.5980306, 1, 1, 1, 1, 1,
-0.6870661, 0.1819964, -1.938403, 1, 1, 1, 1, 1,
-0.6859215, 0.7619685, -0.5082119, 1, 1, 1, 1, 1,
-0.6810992, -0.2881583, -0.3659855, 1, 1, 1, 1, 1,
-0.6762212, 1.846164, 0.330269, 1, 1, 1, 1, 1,
-0.6747203, -0.9234538, -3.415768, 1, 1, 1, 1, 1,
-0.6699395, -0.7432936, -2.083655, 1, 1, 1, 1, 1,
-0.66624, 0.005559414, -0.8602567, 1, 1, 1, 1, 1,
-0.6660795, -0.6506913, -2.33555, 1, 1, 1, 1, 1,
-0.6649356, -0.773591, -3.178742, 1, 1, 1, 1, 1,
-0.6625142, 0.166802, -1.769736, 1, 1, 1, 1, 1,
-0.6604425, 0.5021818, -1.389444, 1, 1, 1, 1, 1,
-0.6601767, 0.719785, 1.041218, 1, 1, 1, 1, 1,
-0.6596399, 1.485318, -0.3745434, 1, 1, 1, 1, 1,
-0.6575605, 0.6499602, -1.154688, 1, 1, 1, 1, 1,
-0.6554995, 0.6084999, -1.707595, 0, 0, 1, 1, 1,
-0.6518675, -2.502028, -2.916754, 1, 0, 0, 1, 1,
-0.6508149, -0.4380621, -3.597621, 1, 0, 0, 1, 1,
-0.6380607, -0.4598553, -2.519701, 1, 0, 0, 1, 1,
-0.6372947, -1.23713, -3.338044, 1, 0, 0, 1, 1,
-0.6370702, 0.05312156, -0.2535723, 1, 0, 0, 1, 1,
-0.6368467, -0.1167433, -4.238944, 0, 0, 0, 1, 1,
-0.6300534, -1.61611, -3.523456, 0, 0, 0, 1, 1,
-0.6270802, -0.2914384, -1.686117, 0, 0, 0, 1, 1,
-0.6225932, -1.854178, -2.212186, 0, 0, 0, 1, 1,
-0.6199118, -0.4354767, -1.240279, 0, 0, 0, 1, 1,
-0.61558, 0.1487095, -4.138702, 0, 0, 0, 1, 1,
-0.6100687, 0.04060665, -1.774427, 0, 0, 0, 1, 1,
-0.6033081, -1.016942, -2.663046, 1, 1, 1, 1, 1,
-0.600943, -0.6198695, -3.270157, 1, 1, 1, 1, 1,
-0.6007584, -0.7961481, -2.409187, 1, 1, 1, 1, 1,
-0.5985144, -0.5945967, -3.356094, 1, 1, 1, 1, 1,
-0.5978923, -1.387299, -2.374425, 1, 1, 1, 1, 1,
-0.5931236, 1.193457, 0.603489, 1, 1, 1, 1, 1,
-0.5837712, 1.371769, -0.774061, 1, 1, 1, 1, 1,
-0.5788647, 0.7826681, 1.155988, 1, 1, 1, 1, 1,
-0.5771154, 1.067618, -0.179722, 1, 1, 1, 1, 1,
-0.5735417, -1.459158, -1.950494, 1, 1, 1, 1, 1,
-0.5695532, 1.382191, -0.03478018, 1, 1, 1, 1, 1,
-0.5601437, 0.66285, -0.7407031, 1, 1, 1, 1, 1,
-0.5564904, 0.4028652, -0.6962239, 1, 1, 1, 1, 1,
-0.5548156, 0.07453762, -1.711829, 1, 1, 1, 1, 1,
-0.5503974, 0.4796909, -1.248519, 1, 1, 1, 1, 1,
-0.5426051, -0.4513083, -1.451041, 0, 0, 1, 1, 1,
-0.5412464, 0.6534752, 0.7617515, 1, 0, 0, 1, 1,
-0.5392235, -0.6037096, -1.373965, 1, 0, 0, 1, 1,
-0.5329301, -0.4502906, -3.312574, 1, 0, 0, 1, 1,
-0.5323535, 0.6432157, -1.305432, 1, 0, 0, 1, 1,
-0.5253477, -0.06919894, -2.945697, 1, 0, 0, 1, 1,
-0.5219668, -1.098222, -5.295207, 0, 0, 0, 1, 1,
-0.5210447, 1.894868, 1.129715, 0, 0, 0, 1, 1,
-0.5111702, 0.3207724, 0.2256055, 0, 0, 0, 1, 1,
-0.511061, 1.933696, 0.1742527, 0, 0, 0, 1, 1,
-0.5108901, 0.5328968, 0.7752253, 0, 0, 0, 1, 1,
-0.5105992, -1.184183, -3.185003, 0, 0, 0, 1, 1,
-0.5005966, 0.1159909, -1.768567, 0, 0, 0, 1, 1,
-0.4984727, -1.950161, -3.971277, 1, 1, 1, 1, 1,
-0.4978116, 0.1012012, -1.624471, 1, 1, 1, 1, 1,
-0.4970984, 0.6058326, -1.096847, 1, 1, 1, 1, 1,
-0.4899333, 2.121337, -0.6288484, 1, 1, 1, 1, 1,
-0.4889812, 0.3022897, -0.5959234, 1, 1, 1, 1, 1,
-0.4882315, -0.8936557, -2.400001, 1, 1, 1, 1, 1,
-0.4875925, -1.357169, -3.38441, 1, 1, 1, 1, 1,
-0.4850685, -2.745275, -1.930997, 1, 1, 1, 1, 1,
-0.4822821, -1.50546, -4.134894, 1, 1, 1, 1, 1,
-0.4808291, -0.8198243, -2.822735, 1, 1, 1, 1, 1,
-0.4786056, 1.376618, -1.299324, 1, 1, 1, 1, 1,
-0.4764819, -0.9441125, -1.654881, 1, 1, 1, 1, 1,
-0.4757709, 0.8612254, -1.091469, 1, 1, 1, 1, 1,
-0.4702655, -0.1194798, -0.402285, 1, 1, 1, 1, 1,
-0.4683947, -0.006399256, -2.38174, 1, 1, 1, 1, 1,
-0.4621516, 1.92257, -0.2067734, 0, 0, 1, 1, 1,
-0.462052, 1.747016, -0.2771682, 1, 0, 0, 1, 1,
-0.4613438, 2.05055, -1.832839, 1, 0, 0, 1, 1,
-0.4608992, 2.030642, -0.3763224, 1, 0, 0, 1, 1,
-0.4603226, 0.9605128, -0.3979169, 1, 0, 0, 1, 1,
-0.4584201, 1.590843, -0.3380369, 1, 0, 0, 1, 1,
-0.4556805, 0.1754984, -0.5955514, 0, 0, 0, 1, 1,
-0.4481102, -1.887019, -3.415733, 0, 0, 0, 1, 1,
-0.4476932, -0.3253364, -2.310327, 0, 0, 0, 1, 1,
-0.4472698, -0.1482209, -2.930846, 0, 0, 0, 1, 1,
-0.4459254, 0.4568586, -0.7403482, 0, 0, 0, 1, 1,
-0.4447738, 0.5244855, 0.4933253, 0, 0, 0, 1, 1,
-0.4422826, -1.408663, -4.841299, 0, 0, 0, 1, 1,
-0.4387848, -0.6897638, -4.324412, 1, 1, 1, 1, 1,
-0.4372927, 0.7748542, -1.5998, 1, 1, 1, 1, 1,
-0.4370867, 1.748824, -0.5563233, 1, 1, 1, 1, 1,
-0.4315508, 0.1306506, -0.4777458, 1, 1, 1, 1, 1,
-0.430376, 1.763007, 1.244714, 1, 1, 1, 1, 1,
-0.4245577, 0.1113835, -2.663825, 1, 1, 1, 1, 1,
-0.4234824, 1.461509, -1.11206, 1, 1, 1, 1, 1,
-0.423417, -0.8770653, -1.607787, 1, 1, 1, 1, 1,
-0.4210034, -0.2049839, -2.450957, 1, 1, 1, 1, 1,
-0.4096268, -2.835069, -2.343446, 1, 1, 1, 1, 1,
-0.4091689, 2.145693, -0.6582605, 1, 1, 1, 1, 1,
-0.4086106, -0.9371434, -2.238714, 1, 1, 1, 1, 1,
-0.4079508, -0.3910233, -1.55606, 1, 1, 1, 1, 1,
-0.4036635, -0.3514749, -3.117002, 1, 1, 1, 1, 1,
-0.401412, 0.5723402, -1.374349, 1, 1, 1, 1, 1,
-0.4003857, -1.920037, -4.823349, 0, 0, 1, 1, 1,
-0.3899889, 0.8214533, -0.0964992, 1, 0, 0, 1, 1,
-0.3887745, 0.07955974, -0.1377252, 1, 0, 0, 1, 1,
-0.3886468, 0.3191821, 0.3955507, 1, 0, 0, 1, 1,
-0.3838651, -0.1707482, -0.1904702, 1, 0, 0, 1, 1,
-0.3795084, 0.3496858, -0.6143465, 1, 0, 0, 1, 1,
-0.3792232, 0.2467742, -1.025372, 0, 0, 0, 1, 1,
-0.3792065, 0.3324258, -2.743617, 0, 0, 0, 1, 1,
-0.376963, 0.1969053, -1.648701, 0, 0, 0, 1, 1,
-0.3769159, -1.36866, -2.385856, 0, 0, 0, 1, 1,
-0.3767371, 1.014151, -0.6967753, 0, 0, 0, 1, 1,
-0.3744373, 1.204566, -0.2608903, 0, 0, 0, 1, 1,
-0.3716373, 0.248577, 0.2577, 0, 0, 0, 1, 1,
-0.3694426, 0.2716019, -1.287506, 1, 1, 1, 1, 1,
-0.3689736, 0.9455101, -0.8587861, 1, 1, 1, 1, 1,
-0.3687916, 0.8914097, -0.09985279, 1, 1, 1, 1, 1,
-0.3670263, 0.3345205, 1.44251, 1, 1, 1, 1, 1,
-0.3627356, -0.6726015, -3.341039, 1, 1, 1, 1, 1,
-0.3519993, 1.662275, 0.05399116, 1, 1, 1, 1, 1,
-0.3517413, 0.6180591, -1.322188, 1, 1, 1, 1, 1,
-0.3484468, -0.7830679, -3.487175, 1, 1, 1, 1, 1,
-0.3436976, 0.5682923, -1.383201, 1, 1, 1, 1, 1,
-0.3434473, -0.5840928, -3.936119, 1, 1, 1, 1, 1,
-0.3424026, 1.093741, -1.57806, 1, 1, 1, 1, 1,
-0.3419957, -0.2798925, -2.037471, 1, 1, 1, 1, 1,
-0.3395893, 0.7971892, -0.05930119, 1, 1, 1, 1, 1,
-0.3354401, -0.7136927, -3.097479, 1, 1, 1, 1, 1,
-0.3347349, 0.1098027, -2.897088, 1, 1, 1, 1, 1,
-0.3318872, 0.04255227, -1.006183, 0, 0, 1, 1, 1,
-0.319728, 0.09826639, -4.204306, 1, 0, 0, 1, 1,
-0.3185377, -0.7827087, -3.952798, 1, 0, 0, 1, 1,
-0.3153619, -0.382819, -2.776764, 1, 0, 0, 1, 1,
-0.3143384, -0.6043784, -3.020145, 1, 0, 0, 1, 1,
-0.3113626, 0.3526121, -0.1994017, 1, 0, 0, 1, 1,
-0.3090108, -1.195917, -3.174684, 0, 0, 0, 1, 1,
-0.3088735, 0.6760123, 0.1379286, 0, 0, 0, 1, 1,
-0.3082923, 0.05780372, -1.792862, 0, 0, 0, 1, 1,
-0.307787, 0.5507891, 0.5895585, 0, 0, 0, 1, 1,
-0.3074742, -0.01514507, -2.897773, 0, 0, 0, 1, 1,
-0.3068928, -0.3682343, -2.996791, 0, 0, 0, 1, 1,
-0.3064834, 0.1398398, -1.240576, 0, 0, 0, 1, 1,
-0.3056333, -0.07588582, -1.740779, 1, 1, 1, 1, 1,
-0.30019, -0.5369908, -3.1345, 1, 1, 1, 1, 1,
-0.2991474, 1.756482, -0.2218854, 1, 1, 1, 1, 1,
-0.2985886, 2.292599, 0.5199668, 1, 1, 1, 1, 1,
-0.2975365, -0.3690137, -3.755647, 1, 1, 1, 1, 1,
-0.2945673, -2.519875, -2.590397, 1, 1, 1, 1, 1,
-0.2937748, 1.597911, -0.4815761, 1, 1, 1, 1, 1,
-0.2916991, 1.100223, -0.06886242, 1, 1, 1, 1, 1,
-0.2875355, -1.591614, -1.725968, 1, 1, 1, 1, 1,
-0.2869267, 1.785683, -2.122472, 1, 1, 1, 1, 1,
-0.2846757, 1.216019, -1.84452, 1, 1, 1, 1, 1,
-0.2832283, -1.59256, -3.418626, 1, 1, 1, 1, 1,
-0.2802099, -0.9363283, -3.01498, 1, 1, 1, 1, 1,
-0.2793749, -1.275967, -2.663845, 1, 1, 1, 1, 1,
-0.2787397, 0.7805818, -0.2478558, 1, 1, 1, 1, 1,
-0.2772832, -0.3992496, -1.14277, 0, 0, 1, 1, 1,
-0.2768294, -0.2156219, -1.168543, 1, 0, 0, 1, 1,
-0.2765092, -0.01788274, -2.614586, 1, 0, 0, 1, 1,
-0.2700248, -2.403037, -3.077773, 1, 0, 0, 1, 1,
-0.2683932, -0.7630941, -2.265954, 1, 0, 0, 1, 1,
-0.2642792, -1.100876, -3.87171, 1, 0, 0, 1, 1,
-0.2638846, -0.08075406, -0.3871541, 0, 0, 0, 1, 1,
-0.26024, 0.8477094, -0.1815381, 0, 0, 0, 1, 1,
-0.2567717, 0.1115273, 0.1833368, 0, 0, 0, 1, 1,
-0.2533794, 0.1605315, -1.774388, 0, 0, 0, 1, 1,
-0.2504437, 1.02678, 2.962828, 0, 0, 0, 1, 1,
-0.2441931, -0.8312144, -2.970524, 0, 0, 0, 1, 1,
-0.2433826, 1.221851, 0.4978558, 0, 0, 0, 1, 1,
-0.2378206, 1.459751, -1.029521, 1, 1, 1, 1, 1,
-0.2369135, -0.4335329, -3.59081, 1, 1, 1, 1, 1,
-0.2344296, 0.218743, -1.765798, 1, 1, 1, 1, 1,
-0.2333284, -0.8194601, -4.784099, 1, 1, 1, 1, 1,
-0.2284321, 1.098393, -0.005191048, 1, 1, 1, 1, 1,
-0.2242731, 0.245423, -1.171336, 1, 1, 1, 1, 1,
-0.2241543, -0.02455121, -2.643121, 1, 1, 1, 1, 1,
-0.2207514, 1.455874, 0.7836726, 1, 1, 1, 1, 1,
-0.2200072, 0.8900284, 0.2985007, 1, 1, 1, 1, 1,
-0.218727, 0.3414324, -0.5839876, 1, 1, 1, 1, 1,
-0.2168883, -0.5424772, -3.532961, 1, 1, 1, 1, 1,
-0.2161078, -0.1799648, -3.452697, 1, 1, 1, 1, 1,
-0.2106699, 0.08651863, -0.2861605, 1, 1, 1, 1, 1,
-0.2106193, -0.07113502, -1.330025, 1, 1, 1, 1, 1,
-0.2104944, -0.5370545, -1.370028, 1, 1, 1, 1, 1,
-0.2073584, -0.07698625, -0.5300077, 0, 0, 1, 1, 1,
-0.206085, 1.995719, 0.2809158, 1, 0, 0, 1, 1,
-0.1983015, -0.868104, -4.198983, 1, 0, 0, 1, 1,
-0.1966072, 1.586248, -0.2714248, 1, 0, 0, 1, 1,
-0.195783, 1.034093, -0.2358986, 1, 0, 0, 1, 1,
-0.1955739, -0.8327325, -3.325297, 1, 0, 0, 1, 1,
-0.1910436, -1.02486, -1.397698, 0, 0, 0, 1, 1,
-0.1904937, -1.571203, -4.111692, 0, 0, 0, 1, 1,
-0.1842003, 0.2904602, -1.017642, 0, 0, 0, 1, 1,
-0.1813733, 0.6882408, -4.55422, 0, 0, 0, 1, 1,
-0.180527, -0.4027331, -2.105157, 0, 0, 0, 1, 1,
-0.180383, 0.1745364, -1.836759, 0, 0, 0, 1, 1,
-0.1766282, 0.6341216, 0.3713104, 0, 0, 0, 1, 1,
-0.1763656, 0.3255953, -0.6682011, 1, 1, 1, 1, 1,
-0.176016, 0.09147138, 1.13565, 1, 1, 1, 1, 1,
-0.1712808, 1.62034, 0.2390674, 1, 1, 1, 1, 1,
-0.1593893, -1.932716, -3.987527, 1, 1, 1, 1, 1,
-0.1590334, -0.01454756, -2.834679, 1, 1, 1, 1, 1,
-0.1580491, -1.837628, -1.914619, 1, 1, 1, 1, 1,
-0.1567038, -1.179939, -2.269344, 1, 1, 1, 1, 1,
-0.1545801, -1.831039, -2.898021, 1, 1, 1, 1, 1,
-0.1500989, -0.5528778, -3.066449, 1, 1, 1, 1, 1,
-0.1435006, 1.210275, 0.2995967, 1, 1, 1, 1, 1,
-0.1392412, 0.4360922, -1.869291, 1, 1, 1, 1, 1,
-0.135145, -0.7935312, -3.673131, 1, 1, 1, 1, 1,
-0.1337036, 0.1903375, -0.5129446, 1, 1, 1, 1, 1,
-0.1334257, -1.420146, -2.247169, 1, 1, 1, 1, 1,
-0.1314468, 0.01317161, -2.350714, 1, 1, 1, 1, 1,
-0.1306111, 0.9822897, 0.6260844, 0, 0, 1, 1, 1,
-0.1305625, 0.893532, 0.8064624, 1, 0, 0, 1, 1,
-0.1250904, -1.048408, -4.721816, 1, 0, 0, 1, 1,
-0.120203, 1.542342, -0.1378969, 1, 0, 0, 1, 1,
-0.1159278, -1.021129, -3.626524, 1, 0, 0, 1, 1,
-0.1129581, 0.07613946, -1.546641, 1, 0, 0, 1, 1,
-0.1126318, -1.635232, -4.104737, 0, 0, 0, 1, 1,
-0.1054084, -0.4027513, -3.996552, 0, 0, 0, 1, 1,
-0.1012596, 0.2625695, -0.4417472, 0, 0, 0, 1, 1,
-0.0986423, 0.05176958, 0.1305479, 0, 0, 0, 1, 1,
-0.09740984, -0.9994526, -4.349336, 0, 0, 0, 1, 1,
-0.0952506, 1.194884, -0.3058775, 0, 0, 0, 1, 1,
-0.09471511, -1.428061, -2.227229, 0, 0, 0, 1, 1,
-0.094323, -2.073368, -2.189054, 1, 1, 1, 1, 1,
-0.09298325, -1.022353, -2.849478, 1, 1, 1, 1, 1,
-0.09068704, 1.618683, 0.3258895, 1, 1, 1, 1, 1,
-0.08829436, 0.2488272, 0.4783676, 1, 1, 1, 1, 1,
-0.08815166, 0.2248132, 0.2028281, 1, 1, 1, 1, 1,
-0.08454709, 0.3274768, -1.61373, 1, 1, 1, 1, 1,
-0.07863197, 0.0309756, -0.8580552, 1, 1, 1, 1, 1,
-0.07701433, 1.051026, 1.63004, 1, 1, 1, 1, 1,
-0.07224461, 0.335373, -0.4465996, 1, 1, 1, 1, 1,
-0.06846342, -0.1173917, -1.132239, 1, 1, 1, 1, 1,
-0.06417286, 1.000014, 1.175078, 1, 1, 1, 1, 1,
-0.06328986, -0.7645866, -2.956911, 1, 1, 1, 1, 1,
-0.06254632, -0.742465, -1.434687, 1, 1, 1, 1, 1,
-0.06250197, 1.094252, 1.137103, 1, 1, 1, 1, 1,
-0.06240452, -1.205352, -3.848914, 1, 1, 1, 1, 1,
-0.05989204, 0.100374, -0.389468, 0, 0, 1, 1, 1,
-0.05349239, -0.1397687, -2.708318, 1, 0, 0, 1, 1,
-0.05348156, 0.7596917, 0.9217791, 1, 0, 0, 1, 1,
-0.05308538, 0.2611766, -0.1797435, 1, 0, 0, 1, 1,
-0.05150455, -0.09826511, -0.5978619, 1, 0, 0, 1, 1,
-0.04926454, -0.8311298, -2.660906, 1, 0, 0, 1, 1,
-0.04578481, -0.1165113, -1.956296, 0, 0, 0, 1, 1,
-0.03802831, 0.4363826, 0.07684892, 0, 0, 0, 1, 1,
-0.03506975, 0.7102544, 0.3524153, 0, 0, 0, 1, 1,
-0.034225, 0.565605, -1.280115, 0, 0, 0, 1, 1,
-0.03247695, -1.183476, -2.84293, 0, 0, 0, 1, 1,
-0.02915025, 1.006934, -0.5284558, 0, 0, 0, 1, 1,
-0.02355241, 1.496626, 0.6021934, 0, 0, 0, 1, 1,
-0.02269467, -1.663538, -1.53457, 1, 1, 1, 1, 1,
-0.02003971, -1.657139, -2.95984, 1, 1, 1, 1, 1,
-0.01656068, 0.6569137, -2.377811, 1, 1, 1, 1, 1,
-0.01482952, 0.007245386, -1.97854, 1, 1, 1, 1, 1,
-0.01385984, 0.1060837, 1.371101, 1, 1, 1, 1, 1,
-0.011864, -0.0670956, -4.844564, 1, 1, 1, 1, 1,
-0.008986416, -0.5110258, -3.461133, 1, 1, 1, 1, 1,
-0.007589683, 0.2392072, 0.7263286, 1, 1, 1, 1, 1,
-0.007155292, 0.05284804, -0.5285541, 1, 1, 1, 1, 1,
-0.005641299, -0.3599449, -3.041228, 1, 1, 1, 1, 1,
-0.005285576, 0.3961093, 0.3501605, 1, 1, 1, 1, 1,
-0.003459524, 0.121496, 0.6805864, 1, 1, 1, 1, 1,
-0.001132469, -1.423082, -3.106028, 1, 1, 1, 1, 1,
-0.001077906, -1.297121, -2.276289, 1, 1, 1, 1, 1,
0.002072376, -0.4947904, 1.711695, 1, 1, 1, 1, 1,
0.005106015, -0.5943394, 3.227112, 0, 0, 1, 1, 1,
0.005765134, -0.4462389, 4.353059, 1, 0, 0, 1, 1,
0.01162732, -0.386025, 3.643039, 1, 0, 0, 1, 1,
0.01474421, 0.7956683, 1.559636, 1, 0, 0, 1, 1,
0.02389847, -0.07244983, 2.568861, 1, 0, 0, 1, 1,
0.02434609, 1.430212, 0.02958571, 1, 0, 0, 1, 1,
0.02556736, -0.2143543, 1.901679, 0, 0, 0, 1, 1,
0.02763513, -0.04486733, 1.866147, 0, 0, 0, 1, 1,
0.03026821, 0.4015767, 0.2625724, 0, 0, 0, 1, 1,
0.03433799, -1.730775, 5.152512, 0, 0, 0, 1, 1,
0.03940579, 0.8644149, -0.2233681, 0, 0, 0, 1, 1,
0.04154017, -0.3022791, 3.119155, 0, 0, 0, 1, 1,
0.04270181, 0.2597434, -0.7939664, 0, 0, 0, 1, 1,
0.04361261, 0.1382864, 0.6751284, 1, 1, 1, 1, 1,
0.04772381, -0.1882504, 3.054621, 1, 1, 1, 1, 1,
0.05025806, 0.4718447, -0.3552594, 1, 1, 1, 1, 1,
0.05118658, 0.4578943, -0.8717692, 1, 1, 1, 1, 1,
0.05679644, -0.9608281, 2.979809, 1, 1, 1, 1, 1,
0.05805555, 0.8186441, -0.7837263, 1, 1, 1, 1, 1,
0.06530683, -0.1469378, 2.35923, 1, 1, 1, 1, 1,
0.06756727, 0.8410756, -0.05704913, 1, 1, 1, 1, 1,
0.0697439, -0.2780743, 3.364588, 1, 1, 1, 1, 1,
0.07508205, 0.5795959, 0.6063571, 1, 1, 1, 1, 1,
0.07567232, 1.004557, -0.0809093, 1, 1, 1, 1, 1,
0.07725204, -0.1231759, 1.42886, 1, 1, 1, 1, 1,
0.07885989, -1.104717, 4.021026, 1, 1, 1, 1, 1,
0.07951358, 1.067434, 0.6940562, 1, 1, 1, 1, 1,
0.08819679, 1.317556, -0.5988344, 1, 1, 1, 1, 1,
0.08956686, 0.8404007, -1.292965, 0, 0, 1, 1, 1,
0.09407665, -1.319908, 3.463034, 1, 0, 0, 1, 1,
0.09474824, -0.7438647, 3.719443, 1, 0, 0, 1, 1,
0.09957002, -1.141737, 2.465271, 1, 0, 0, 1, 1,
0.09982274, -0.4286831, 2.343244, 1, 0, 0, 1, 1,
0.1014684, 0.1910357, -1.038434, 1, 0, 0, 1, 1,
0.1024071, -2.359866, 4.204823, 0, 0, 0, 1, 1,
0.1034027, 0.0110435, 2.882346, 0, 0, 0, 1, 1,
0.104558, -0.3074259, 1.400591, 0, 0, 0, 1, 1,
0.1117558, -0.7146467, 1.915447, 0, 0, 0, 1, 1,
0.1155022, -1.181273, 2.927489, 0, 0, 0, 1, 1,
0.1199213, -0.5802847, 3.378582, 0, 0, 0, 1, 1,
0.1214153, -0.4536033, 2.242644, 0, 0, 0, 1, 1,
0.121782, -1.377589, 2.907484, 1, 1, 1, 1, 1,
0.1219406, -0.90784, 3.701973, 1, 1, 1, 1, 1,
0.1240718, 0.3460298, -2.083649, 1, 1, 1, 1, 1,
0.1387686, -0.318152, -0.6914318, 1, 1, 1, 1, 1,
0.1430366, 0.3267997, -0.05174449, 1, 1, 1, 1, 1,
0.1439736, 0.02981557, -0.1496596, 1, 1, 1, 1, 1,
0.14536, -0.3854103, 2.07339, 1, 1, 1, 1, 1,
0.1455609, 1.008385, -1.055009, 1, 1, 1, 1, 1,
0.145629, 0.767226, -0.4330401, 1, 1, 1, 1, 1,
0.1458032, -1.383132, 4.435505, 1, 1, 1, 1, 1,
0.1506274, -0.839278, 3.29183, 1, 1, 1, 1, 1,
0.1549846, 0.213775, 0.5235731, 1, 1, 1, 1, 1,
0.1575636, 0.04519715, 1.373872, 1, 1, 1, 1, 1,
0.1639523, 0.3367153, 1.119806, 1, 1, 1, 1, 1,
0.164453, 1.753374, 1.513693, 1, 1, 1, 1, 1,
0.1687918, 1.198972, -0.3154395, 0, 0, 1, 1, 1,
0.1695133, 0.2669812, 0.6639142, 1, 0, 0, 1, 1,
0.1705953, 0.4436797, 0.3357058, 1, 0, 0, 1, 1,
0.1711727, 0.4470347, 0.599043, 1, 0, 0, 1, 1,
0.1747385, 1.188636, -0.4906428, 1, 0, 0, 1, 1,
0.174969, 2.004683, 1.45633, 1, 0, 0, 1, 1,
0.1750565, 0.7356285, -0.6081131, 0, 0, 0, 1, 1,
0.1770315, -1.089738, 1.626218, 0, 0, 0, 1, 1,
0.1833666, 0.4729523, 0.6930674, 0, 0, 0, 1, 1,
0.1893138, -1.17657, 2.731857, 0, 0, 0, 1, 1,
0.1906078, 0.6699697, 0.293966, 0, 0, 0, 1, 1,
0.2031808, 0.2424539, 1.334246, 0, 0, 0, 1, 1,
0.2031918, -0.7035897, 3.837352, 0, 0, 0, 1, 1,
0.2032505, 0.2543883, 1.812481, 1, 1, 1, 1, 1,
0.2040989, 0.7035692, -1.192904, 1, 1, 1, 1, 1,
0.2049733, 0.04872878, 1.753754, 1, 1, 1, 1, 1,
0.2062865, -1.45365, 1.663629, 1, 1, 1, 1, 1,
0.2102954, -0.4232762, 2.046885, 1, 1, 1, 1, 1,
0.2104309, -0.01253399, -0.09208861, 1, 1, 1, 1, 1,
0.2121349, -1.277563, 3.901681, 1, 1, 1, 1, 1,
0.2127823, -0.04045995, 2.404119, 1, 1, 1, 1, 1,
0.2143063, -1.130308, 2.702077, 1, 1, 1, 1, 1,
0.2143243, -0.2254536, 4.21575, 1, 1, 1, 1, 1,
0.2209517, 0.1683926, 0.5005895, 1, 1, 1, 1, 1,
0.2245905, -0.4330136, 3.068198, 1, 1, 1, 1, 1,
0.2288357, 0.6315657, -0.9354456, 1, 1, 1, 1, 1,
0.2306061, -0.2294508, 3.177052, 1, 1, 1, 1, 1,
0.2309578, 1.199885, -0.7472546, 1, 1, 1, 1, 1,
0.2344697, 0.1089315, 1.047235, 0, 0, 1, 1, 1,
0.2352122, 1.057696, 1.787048, 1, 0, 0, 1, 1,
0.2395593, 0.2018104, 0.4454734, 1, 0, 0, 1, 1,
0.2412383, -1.544294, 2.287272, 1, 0, 0, 1, 1,
0.2447015, 0.04529034, 0.2166311, 1, 0, 0, 1, 1,
0.2463749, -1.193853, 3.282444, 1, 0, 0, 1, 1,
0.2514245, -0.7469146, 2.383388, 0, 0, 0, 1, 1,
0.2521331, 1.525192, -0.6322796, 0, 0, 0, 1, 1,
0.2527238, -1.552694, 2.012399, 0, 0, 0, 1, 1,
0.2579597, 0.04195171, 1.71159, 0, 0, 0, 1, 1,
0.2583837, 1.027031, -0.6639263, 0, 0, 0, 1, 1,
0.2589356, 1.141229, 1.301507, 0, 0, 0, 1, 1,
0.2615748, 1.891048, -0.5573211, 0, 0, 0, 1, 1,
0.26424, -1.31202, 2.839839, 1, 1, 1, 1, 1,
0.268868, -1.646737, 3.14531, 1, 1, 1, 1, 1,
0.2737463, 0.9219757, -0.2944868, 1, 1, 1, 1, 1,
0.2741654, -0.5797036, 3.985955, 1, 1, 1, 1, 1,
0.2751666, 0.1800349, 0.6829453, 1, 1, 1, 1, 1,
0.2803473, 0.8534023, 0.06048151, 1, 1, 1, 1, 1,
0.2839182, -0.6823556, 3.170052, 1, 1, 1, 1, 1,
0.2866254, 0.2208549, 2.438221, 1, 1, 1, 1, 1,
0.2877, -1.771053, 3.498424, 1, 1, 1, 1, 1,
0.2895146, 0.09123567, 0.2471219, 1, 1, 1, 1, 1,
0.2901897, 0.1392068, 0.1073774, 1, 1, 1, 1, 1,
0.2917023, 0.485732, 0.8159122, 1, 1, 1, 1, 1,
0.2936227, 1.618229, 0.9557799, 1, 1, 1, 1, 1,
0.2962448, 1.273517, -0.1988387, 1, 1, 1, 1, 1,
0.2982877, 0.6309069, 0.1207218, 1, 1, 1, 1, 1,
0.3092194, 0.1664991, 2.007731, 0, 0, 1, 1, 1,
0.3121204, 0.1329885, 2.113369, 1, 0, 0, 1, 1,
0.314815, 0.9838054, -0.2971311, 1, 0, 0, 1, 1,
0.3185494, 0.5222582, 0.5481913, 1, 0, 0, 1, 1,
0.3187949, -0.9778393, 3.383842, 1, 0, 0, 1, 1,
0.3192887, -1.028727, 3.031576, 1, 0, 0, 1, 1,
0.3202499, 0.1323725, 1.651399, 0, 0, 0, 1, 1,
0.3204698, 0.5731246, 0.06566561, 0, 0, 0, 1, 1,
0.3216446, 1.649719, -0.4449404, 0, 0, 0, 1, 1,
0.3288569, -1.025995, 4.171251, 0, 0, 0, 1, 1,
0.3311512, -1.03902, 3.949184, 0, 0, 0, 1, 1,
0.3331615, -0.08527742, 1.016704, 0, 0, 0, 1, 1,
0.3334845, -0.1912899, 2.846676, 0, 0, 0, 1, 1,
0.3349729, -0.1881885, 2.272621, 1, 1, 1, 1, 1,
0.3371342, -0.4853175, 3.344967, 1, 1, 1, 1, 1,
0.3372734, 1.709434, 0.5396832, 1, 1, 1, 1, 1,
0.3377047, -0.569295, 3.49016, 1, 1, 1, 1, 1,
0.3379452, -0.14418, 2.02792, 1, 1, 1, 1, 1,
0.3382886, 2.505738, -1.450167, 1, 1, 1, 1, 1,
0.3406483, 0.8421845, -0.2036032, 1, 1, 1, 1, 1,
0.3407966, 2.823846, -0.380247, 1, 1, 1, 1, 1,
0.3423772, -2.256695, 2.734813, 1, 1, 1, 1, 1,
0.3426773, 0.8379489, 1.385267, 1, 1, 1, 1, 1,
0.3453941, 1.004496, -0.6835541, 1, 1, 1, 1, 1,
0.3484817, 1.633975, -0.788619, 1, 1, 1, 1, 1,
0.3491641, 0.7465161, -1.147944, 1, 1, 1, 1, 1,
0.3526417, 0.6189161, 0.8670776, 1, 1, 1, 1, 1,
0.3540231, 0.08705228, -1.171046, 1, 1, 1, 1, 1,
0.3548871, -1.088351, 2.875335, 0, 0, 1, 1, 1,
0.3578205, 0.4417638, 1.762064, 1, 0, 0, 1, 1,
0.3606264, 0.9033583, 1.062692, 1, 0, 0, 1, 1,
0.3612064, -0.803657, 1.996261, 1, 0, 0, 1, 1,
0.363402, -0.7953859, 3.161175, 1, 0, 0, 1, 1,
0.3653499, 1.573076, -0.4292109, 1, 0, 0, 1, 1,
0.3677928, 0.4293771, 0.7297813, 0, 0, 0, 1, 1,
0.3722797, -0.2488718, 1.904806, 0, 0, 0, 1, 1,
0.3735499, -0.3761671, 3.351492, 0, 0, 0, 1, 1,
0.3761627, 2.055218, -0.1619332, 0, 0, 0, 1, 1,
0.3765686, 0.2836888, 0.2484664, 0, 0, 0, 1, 1,
0.3770707, 1.483754, 0.3565136, 0, 0, 0, 1, 1,
0.3796725, -0.8393483, 3.302988, 0, 0, 0, 1, 1,
0.380258, -0.6750418, 3.462825, 1, 1, 1, 1, 1,
0.3823843, 0.04858346, -1.318714, 1, 1, 1, 1, 1,
0.3826872, 0.289744, 2.279269, 1, 1, 1, 1, 1,
0.3847092, 1.017942, 1.055451, 1, 1, 1, 1, 1,
0.38582, -0.583402, 2.407871, 1, 1, 1, 1, 1,
0.3894258, -0.4881015, 2.493541, 1, 1, 1, 1, 1,
0.3944871, -0.2382748, 2.175917, 1, 1, 1, 1, 1,
0.3959216, 0.7482715, 1.88259, 1, 1, 1, 1, 1,
0.3993419, -0.6417643, 2.710889, 1, 1, 1, 1, 1,
0.3996573, -0.8768907, 3.825319, 1, 1, 1, 1, 1,
0.4014362, -1.225975, 1.98128, 1, 1, 1, 1, 1,
0.4098491, 0.3094456, 1.127933, 1, 1, 1, 1, 1,
0.4124208, -1.120553, 1.136819, 1, 1, 1, 1, 1,
0.4186549, 1.843328, 2.200447, 1, 1, 1, 1, 1,
0.4228604, -0.5234634, 2.72082, 1, 1, 1, 1, 1,
0.4268334, -0.01877654, 0.2133435, 0, 0, 1, 1, 1,
0.4287041, 0.1279865, 0.7097453, 1, 0, 0, 1, 1,
0.4332205, 0.9172126, 0.2428308, 1, 0, 0, 1, 1,
0.4350261, 1.111091, 1.397442, 1, 0, 0, 1, 1,
0.4358969, 0.9860658, 0.4687671, 1, 0, 0, 1, 1,
0.438085, -0.9004652, 3.430829, 1, 0, 0, 1, 1,
0.4529743, 0.2964634, 1.480963, 0, 0, 0, 1, 1,
0.4535578, 0.3237534, 0.6608701, 0, 0, 0, 1, 1,
0.4546861, 0.971676, 0.712444, 0, 0, 0, 1, 1,
0.4562248, -1.89808, 2.469809, 0, 0, 0, 1, 1,
0.4608996, -0.2511134, 2.705199, 0, 0, 0, 1, 1,
0.4614583, 1.129625, -0.05192757, 0, 0, 0, 1, 1,
0.4615406, 0.2546348, 0.2042746, 0, 0, 0, 1, 1,
0.4630873, -0.1125654, 1.435252, 1, 1, 1, 1, 1,
0.4632368, -1.784976, 2.39362, 1, 1, 1, 1, 1,
0.4632952, -0.9170685, 1.705098, 1, 1, 1, 1, 1,
0.4637782, 1.0384, 0.5641133, 1, 1, 1, 1, 1,
0.4648014, 0.42017, -0.2552685, 1, 1, 1, 1, 1,
0.4648334, 1.821422, -1.325562, 1, 1, 1, 1, 1,
0.4650788, 0.02433311, 1.904004, 1, 1, 1, 1, 1,
0.4743803, -0.314139, 1.893083, 1, 1, 1, 1, 1,
0.479136, -0.8630801, 2.498255, 1, 1, 1, 1, 1,
0.4792468, 0.7690197, 1.891171, 1, 1, 1, 1, 1,
0.4802663, 1.887433, -0.8418315, 1, 1, 1, 1, 1,
0.4819473, 0.3596988, -0.08050335, 1, 1, 1, 1, 1,
0.4831977, 0.1166816, 0.565727, 1, 1, 1, 1, 1,
0.4890936, 2.094072, -1.628132, 1, 1, 1, 1, 1,
0.4909819, -1.341181, 2.678585, 1, 1, 1, 1, 1,
0.4960611, -0.6065539, 2.486746, 0, 0, 1, 1, 1,
0.4965472, -0.04911413, 1.02219, 1, 0, 0, 1, 1,
0.5037101, 1.646403, 0.3191607, 1, 0, 0, 1, 1,
0.5051854, 0.8387688, -0.8427557, 1, 0, 0, 1, 1,
0.5089523, 0.5340636, 0.9370075, 1, 0, 0, 1, 1,
0.5102085, -1.483983, 1.481626, 1, 0, 0, 1, 1,
0.51658, 0.2026065, 1.104661, 0, 0, 0, 1, 1,
0.5242172, -0.9823823, 3.107931, 0, 0, 0, 1, 1,
0.5289496, 0.467784, -0.9712678, 0, 0, 0, 1, 1,
0.5290878, 1.060491, 2.008102, 0, 0, 0, 1, 1,
0.5307964, -0.07005319, 2.009319, 0, 0, 0, 1, 1,
0.5345659, -0.09860512, 0.5790438, 0, 0, 0, 1, 1,
0.535571, 1.344275, 1.239936, 0, 0, 0, 1, 1,
0.5412952, -0.2541344, 1.97996, 1, 1, 1, 1, 1,
0.5422533, -2.050765e-05, 1.060238, 1, 1, 1, 1, 1,
0.5475916, -0.3835445, 2.047712, 1, 1, 1, 1, 1,
0.5600681, -0.8071831, 3.202243, 1, 1, 1, 1, 1,
0.5617006, 1.327813, 1.517422, 1, 1, 1, 1, 1,
0.5669993, -0.6357127, 1.796008, 1, 1, 1, 1, 1,
0.574522, 0.1891194, 0.6357937, 1, 1, 1, 1, 1,
0.5753806, -1.005056, 1.404853, 1, 1, 1, 1, 1,
0.5773105, -1.353749, 2.283059, 1, 1, 1, 1, 1,
0.577343, 1.95742, -0.7762254, 1, 1, 1, 1, 1,
0.5789943, 1.276618, 0.5928923, 1, 1, 1, 1, 1,
0.5852339, 0.02903686, 2.467361, 1, 1, 1, 1, 1,
0.5935917, -0.4302478, 0.7808422, 1, 1, 1, 1, 1,
0.5938669, -1.218069, 2.997511, 1, 1, 1, 1, 1,
0.5940492, 1.556418, 1.413701, 1, 1, 1, 1, 1,
0.59469, 0.7879622, 1.410928, 0, 0, 1, 1, 1,
0.5983315, -0.8083771, 2.246017, 1, 0, 0, 1, 1,
0.6012108, 0.250883, 0.06742808, 1, 0, 0, 1, 1,
0.6027359, 1.613197, 0.143603, 1, 0, 0, 1, 1,
0.6097921, 0.1068616, 1.145408, 1, 0, 0, 1, 1,
0.6141106, 1.584181, -0.2156398, 1, 0, 0, 1, 1,
0.6146887, -0.03433728, 1.617831, 0, 0, 0, 1, 1,
0.6166415, 0.9345282, 0.02978658, 0, 0, 0, 1, 1,
0.6270915, -2.3315, 3.720179, 0, 0, 0, 1, 1,
0.6295084, 0.6394764, 1.012756, 0, 0, 0, 1, 1,
0.63359, 0.4864579, 1.448769, 0, 0, 0, 1, 1,
0.6408849, 0.5582238, 2.458104, 0, 0, 0, 1, 1,
0.6409923, 1.062823, -0.3341924, 0, 0, 0, 1, 1,
0.6434398, -0.7051185, 2.656342, 1, 1, 1, 1, 1,
0.6441592, -0.4650067, 2.209589, 1, 1, 1, 1, 1,
0.6532778, 0.5522911, -0.09556942, 1, 1, 1, 1, 1,
0.6547124, -1.22273, 2.86042, 1, 1, 1, 1, 1,
0.6547772, -0.9654447, 1.456467, 1, 1, 1, 1, 1,
0.6573079, 2.463018, -0.3374038, 1, 1, 1, 1, 1,
0.6582323, 2.130168, -0.4161938, 1, 1, 1, 1, 1,
0.6598893, -0.4638989, 2.522275, 1, 1, 1, 1, 1,
0.6615524, -1.48796, 3.804499, 1, 1, 1, 1, 1,
0.6616261, 0.07325367, 1.683373, 1, 1, 1, 1, 1,
0.6626615, 1.637766, 0.585741, 1, 1, 1, 1, 1,
0.6635996, -0.3372506, 2.518231, 1, 1, 1, 1, 1,
0.6651496, 0.08031709, 0.9848992, 1, 1, 1, 1, 1,
0.6729111, 0.8226233, 1.421089, 1, 1, 1, 1, 1,
0.6731328, -0.4024056, 1.598942, 1, 1, 1, 1, 1,
0.6764231, -1.720061, 2.235091, 0, 0, 1, 1, 1,
0.6846415, -0.223568, 0.4700011, 1, 0, 0, 1, 1,
0.6860145, 0.8408203, 1.582495, 1, 0, 0, 1, 1,
0.686583, -0.8320825, 2.275087, 1, 0, 0, 1, 1,
0.6897264, -0.9494568, 5.257656, 1, 0, 0, 1, 1,
0.6953272, 1.2794, 0.8002699, 1, 0, 0, 1, 1,
0.6963838, -1.082087, 1.749385, 0, 0, 0, 1, 1,
0.7009447, 0.2136232, 1.08083, 0, 0, 0, 1, 1,
0.7058825, 1.427024, 0.5910752, 0, 0, 0, 1, 1,
0.7064214, -0.1478487, 1.863603, 0, 0, 0, 1, 1,
0.7161314, -0.1851081, 2.069675, 0, 0, 0, 1, 1,
0.7190369, 0.4491065, 0.7545234, 0, 0, 0, 1, 1,
0.7192895, -0.8555034, 2.663609, 0, 0, 0, 1, 1,
0.7221524, 0.9828051, -1.180512, 1, 1, 1, 1, 1,
0.7271383, 1.073647, 2.343918, 1, 1, 1, 1, 1,
0.7365627, -0.3118186, 2.274322, 1, 1, 1, 1, 1,
0.7405515, -0.1756147, 0.3046734, 1, 1, 1, 1, 1,
0.7439728, 0.7912182, 0.729074, 1, 1, 1, 1, 1,
0.7463759, 0.4213102, 1.42275, 1, 1, 1, 1, 1,
0.7465059, 0.4625189, 1.281499, 1, 1, 1, 1, 1,
0.74896, -0.4817023, 2.804054, 1, 1, 1, 1, 1,
0.7502709, 0.1273684, 1.40936, 1, 1, 1, 1, 1,
0.7555249, 0.5068091, -0.2300137, 1, 1, 1, 1, 1,
0.7567932, -0.04113457, 1.3415, 1, 1, 1, 1, 1,
0.7580463, -0.5440724, 2.18917, 1, 1, 1, 1, 1,
0.7583532, -0.6548711, 3.561307, 1, 1, 1, 1, 1,
0.7717921, -1.237182, 1.740719, 1, 1, 1, 1, 1,
0.7724496, -1.112712, 2.920428, 1, 1, 1, 1, 1,
0.7730033, -2.188512, 3.071839, 0, 0, 1, 1, 1,
0.7786843, 0.4209127, 1.415535, 1, 0, 0, 1, 1,
0.7830713, 0.1105872, 3.535982, 1, 0, 0, 1, 1,
0.7848681, -0.264549, 3.929811, 1, 0, 0, 1, 1,
0.7867021, 1.316349, 0.1677448, 1, 0, 0, 1, 1,
0.7875086, 1.401263, 0.0582935, 1, 0, 0, 1, 1,
0.7898911, 0.09986636, 1.422782, 0, 0, 0, 1, 1,
0.792217, -0.5594994, 0.2541924, 0, 0, 0, 1, 1,
0.7951649, -0.2138767, 2.851378, 0, 0, 0, 1, 1,
0.797196, 0.7340513, -0.8201827, 0, 0, 0, 1, 1,
0.8076462, 0.09968183, 1.407553, 0, 0, 0, 1, 1,
0.8092145, 0.08170046, 0.7834441, 0, 0, 0, 1, 1,
0.8143926, 0.2858272, -0.5023238, 0, 0, 0, 1, 1,
0.816166, -0.1908888, 1.632828, 1, 1, 1, 1, 1,
0.8183851, 0.4252553, 0.8456143, 1, 1, 1, 1, 1,
0.8195477, -0.454147, 1.600599, 1, 1, 1, 1, 1,
0.8209664, -0.3919784, 1.696548, 1, 1, 1, 1, 1,
0.825102, 1.104391, 0.2818884, 1, 1, 1, 1, 1,
0.8289406, -0.8355454, 2.310332, 1, 1, 1, 1, 1,
0.8308091, -0.8179277, 4.327611, 1, 1, 1, 1, 1,
0.8356417, 1.603598, 0.2162171, 1, 1, 1, 1, 1,
0.8382765, 0.4025925, 2.038133, 1, 1, 1, 1, 1,
0.8425554, 1.383487, 3.246894, 1, 1, 1, 1, 1,
0.8435102, -0.312057, 2.437228, 1, 1, 1, 1, 1,
0.8441921, 0.2406926, 1.431417, 1, 1, 1, 1, 1,
0.8445867, -0.954426, 1.955758, 1, 1, 1, 1, 1,
0.8582104, 0.2861016, 2.465404, 1, 1, 1, 1, 1,
0.8590675, -1.242089, 2.139075, 1, 1, 1, 1, 1,
0.8596457, 0.6172725, 1.564914, 0, 0, 1, 1, 1,
0.8660343, -0.5167041, 1.413831, 1, 0, 0, 1, 1,
0.8670613, 0.4211462, 0.4867907, 1, 0, 0, 1, 1,
0.8674215, 0.4056709, 1.183273, 1, 0, 0, 1, 1,
0.8676692, -2.063792, 4.059525, 1, 0, 0, 1, 1,
0.8708908, -0.7301513, 2.786686, 1, 0, 0, 1, 1,
0.8795152, 0.2124913, 1.90695, 0, 0, 0, 1, 1,
0.8818213, -0.4380316, 3.108819, 0, 0, 0, 1, 1,
0.8855939, -2.054361, 2.807229, 0, 0, 0, 1, 1,
0.8946338, -0.3308423, 2.699337, 0, 0, 0, 1, 1,
0.8974394, 0.2321544, 0.3776675, 0, 0, 0, 1, 1,
0.8975365, 0.2429929, -0.5179001, 0, 0, 0, 1, 1,
0.902383, -1.939547, 2.61471, 0, 0, 0, 1, 1,
0.9046478, -0.1529091, 0.1853216, 1, 1, 1, 1, 1,
0.9056168, 0.3956321, 0.2659336, 1, 1, 1, 1, 1,
0.9130051, 1.455694, 0.5802106, 1, 1, 1, 1, 1,
0.9153868, -1.443022, 2.506721, 1, 1, 1, 1, 1,
0.9154382, 0.6883326, 0.9847702, 1, 1, 1, 1, 1,
0.9156744, -1.57614, 2.682267, 1, 1, 1, 1, 1,
0.9168954, 1.577796, 1.075286, 1, 1, 1, 1, 1,
0.9196638, -0.6394635, 2.888153, 1, 1, 1, 1, 1,
0.9202811, -0.1948852, 1.473333, 1, 1, 1, 1, 1,
0.9216729, -1.320495, 4.991513, 1, 1, 1, 1, 1,
0.9292564, -1.485858, 1.805116, 1, 1, 1, 1, 1,
0.9310963, 0.2927825, 1.768344, 1, 1, 1, 1, 1,
0.9337642, -0.1407211, 2.280014, 1, 1, 1, 1, 1,
0.9373587, -0.3263617, 1.486981, 1, 1, 1, 1, 1,
0.9429454, -1.497414, 2.864897, 1, 1, 1, 1, 1,
0.9452322, 0.1328662, 0.6484675, 0, 0, 1, 1, 1,
0.9478148, -1.187954, 2.764853, 1, 0, 0, 1, 1,
0.9485286, 0.4439395, 0.673567, 1, 0, 0, 1, 1,
0.9545707, 0.5472777, 0.3795329, 1, 0, 0, 1, 1,
0.9589334, -2.384418, 4.186474, 1, 0, 0, 1, 1,
0.9672884, 0.1127128, 0.1987071, 1, 0, 0, 1, 1,
0.9673388, 0.8397897, 0.9077753, 0, 0, 0, 1, 1,
0.9729799, 1.74536, -0.9703751, 0, 0, 0, 1, 1,
0.9735918, 0.8220289, 2.908348, 0, 0, 0, 1, 1,
0.9795039, 1.276203, -0.02643644, 0, 0, 0, 1, 1,
0.9872533, -0.02860567, 3.079061, 0, 0, 0, 1, 1,
1.005522, 1.427901, 1.126548, 0, 0, 0, 1, 1,
1.008048, -0.1251129, 3.165794, 0, 0, 0, 1, 1,
1.009002, 0.628465, -0.756413, 1, 1, 1, 1, 1,
1.009777, -0.3365908, 4.730904, 1, 1, 1, 1, 1,
1.010911, 1.342286, 0.5205518, 1, 1, 1, 1, 1,
1.015887, -0.8240395, 3.105917, 1, 1, 1, 1, 1,
1.020504, -0.04415668, 1.66282, 1, 1, 1, 1, 1,
1.020893, 0.3268166, 1.549424, 1, 1, 1, 1, 1,
1.025729, 0.1314762, 1.123376, 1, 1, 1, 1, 1,
1.027536, 0.5279394, 2.107528, 1, 1, 1, 1, 1,
1.03083, -1.260587, 2.384984, 1, 1, 1, 1, 1,
1.046907, 0.8948564, 0.500991, 1, 1, 1, 1, 1,
1.051195, 0.8046399, 1.014834, 1, 1, 1, 1, 1,
1.05137, -0.595021, 2.336936, 1, 1, 1, 1, 1,
1.052678, 0.02141638, 1.03493, 1, 1, 1, 1, 1,
1.056091, -0.2613175, 1.012226, 1, 1, 1, 1, 1,
1.05999, 0.5900261, 1.281659, 1, 1, 1, 1, 1,
1.063152, -0.906696, 4.228337, 0, 0, 1, 1, 1,
1.067205, 0.5607916, 0.3605863, 1, 0, 0, 1, 1,
1.07496, -0.2704228, 4.056725, 1, 0, 0, 1, 1,
1.076034, 0.08109367, 1.078027, 1, 0, 0, 1, 1,
1.082561, 0.588927, 1.437492, 1, 0, 0, 1, 1,
1.082606, -0.9361538, 3.343286, 1, 0, 0, 1, 1,
1.092397, 0.9806969, 0.28538, 0, 0, 0, 1, 1,
1.096965, -0.5250688, 3.298387, 0, 0, 0, 1, 1,
1.099501, -0.9873561, 1.120883, 0, 0, 0, 1, 1,
1.101163, 1.111586, 2.385902, 0, 0, 0, 1, 1,
1.106945, 1.012722, 1.343234, 0, 0, 0, 1, 1,
1.11518, -0.6682376, 0.9765614, 0, 0, 0, 1, 1,
1.123721, -1.47841, 2.102274, 0, 0, 0, 1, 1,
1.128996, 0.0645678, -0.2791659, 1, 1, 1, 1, 1,
1.133299, -0.9279292, 0.94516, 1, 1, 1, 1, 1,
1.144513, 1.734381, 0.2011118, 1, 1, 1, 1, 1,
1.148393, 0.3115672, 0.3093818, 1, 1, 1, 1, 1,
1.149065, -1.477265, 3.828963, 1, 1, 1, 1, 1,
1.153246, 0.7162112, 2.827402, 1, 1, 1, 1, 1,
1.15369, -1.974856, 1.586474, 1, 1, 1, 1, 1,
1.158874, 0.3101546, 2.891159, 1, 1, 1, 1, 1,
1.164149, 0.1924606, 3.193866, 1, 1, 1, 1, 1,
1.169349, 0.3233113, 1.522113, 1, 1, 1, 1, 1,
1.174078, 0.1548408, 1.888231, 1, 1, 1, 1, 1,
1.186504, -1.060305, 1.33685, 1, 1, 1, 1, 1,
1.199322, -2.200091, 3.248114, 1, 1, 1, 1, 1,
1.200083, 0.9474785, 0.6367718, 1, 1, 1, 1, 1,
1.203998, -0.3526823, 2.348471, 1, 1, 1, 1, 1,
1.206393, 0.3163706, 2.714634, 0, 0, 1, 1, 1,
1.210698, -0.3384585, 2.42359, 1, 0, 0, 1, 1,
1.2145, 0.178799, 1.634498, 1, 0, 0, 1, 1,
1.22137, 0.202026, 0.6290023, 1, 0, 0, 1, 1,
1.22381, -0.004050586, 1.398875, 1, 0, 0, 1, 1,
1.24003, -1.027543, 2.071073, 1, 0, 0, 1, 1,
1.245449, 0.8144534, 1.661264, 0, 0, 0, 1, 1,
1.249692, 0.1456581, 0.818029, 0, 0, 0, 1, 1,
1.252293, 0.299936, 0.587994, 0, 0, 0, 1, 1,
1.255023, -1.696271, 1.153739, 0, 0, 0, 1, 1,
1.262647, -0.1231318, 2.907777, 0, 0, 0, 1, 1,
1.273844, 0.2313795, 0.6305659, 0, 0, 0, 1, 1,
1.273938, 0.5660311, 0.2623093, 0, 0, 0, 1, 1,
1.274189, -0.4189102, 2.99304, 1, 1, 1, 1, 1,
1.277946, -0.8460132, 2.197383, 1, 1, 1, 1, 1,
1.279887, -1.261335, 4.717301, 1, 1, 1, 1, 1,
1.285573, 0.2499809, 1.022336, 1, 1, 1, 1, 1,
1.28726, 0.2273159, 2.58089, 1, 1, 1, 1, 1,
1.300908, -0.2709612, 2.658939, 1, 1, 1, 1, 1,
1.308753, 0.6194217, 0.5502108, 1, 1, 1, 1, 1,
1.309451, -0.783218, 0.3277547, 1, 1, 1, 1, 1,
1.326892, -0.1767492, 0.5316014, 1, 1, 1, 1, 1,
1.328018, -0.290048, 1.014266, 1, 1, 1, 1, 1,
1.342317, -0.777019, 2.607693, 1, 1, 1, 1, 1,
1.34304, 0.03350282, 2.498996, 1, 1, 1, 1, 1,
1.344503, 0.7438619, 0.5064778, 1, 1, 1, 1, 1,
1.344579, 0.5612676, 1.594139, 1, 1, 1, 1, 1,
1.347538, 1.901194, 0.9251661, 1, 1, 1, 1, 1,
1.351526, 1.54997, 1.698344, 0, 0, 1, 1, 1,
1.352354, -0.3742943, 2.161956, 1, 0, 0, 1, 1,
1.354849, -0.1753284, 1.131649, 1, 0, 0, 1, 1,
1.36272, 0.0643205, 2.104052, 1, 0, 0, 1, 1,
1.377061, 0.05060266, 2.691227, 1, 0, 0, 1, 1,
1.386995, 1.903098, 2.121749, 1, 0, 0, 1, 1,
1.404532, -0.2638373, -0.1902554, 0, 0, 0, 1, 1,
1.416403, -1.111623, 2.309313, 0, 0, 0, 1, 1,
1.419772, 0.1669933, 1.341831, 0, 0, 0, 1, 1,
1.421476, 0.2781052, 2.543664, 0, 0, 0, 1, 1,
1.460756, 1.060571, 1.062676, 0, 0, 0, 1, 1,
1.469774, -1.040501, 1.938753, 0, 0, 0, 1, 1,
1.474381, -1.662424, 2.668016, 0, 0, 0, 1, 1,
1.476497, 1.034409, -0.797834, 1, 1, 1, 1, 1,
1.48694, -0.2105957, 4.551777, 1, 1, 1, 1, 1,
1.49527, 1.02984, 1.236343, 1, 1, 1, 1, 1,
1.522469, 0.0283995, 2.330508, 1, 1, 1, 1, 1,
1.530872, 1.054588, 2.156666, 1, 1, 1, 1, 1,
1.538704, -0.2086771, -0.4307925, 1, 1, 1, 1, 1,
1.53909, -0.05218446, 0.5240291, 1, 1, 1, 1, 1,
1.54101, 0.6063818, 2.200197, 1, 1, 1, 1, 1,
1.541804, 0.6847911, 1.734596, 1, 1, 1, 1, 1,
1.556812, -0.3998102, 1.566943, 1, 1, 1, 1, 1,
1.586074, 0.2422552, 2.140105, 1, 1, 1, 1, 1,
1.588161, -0.1376587, 2.724264, 1, 1, 1, 1, 1,
1.601818, -1.674347, 3.293979, 1, 1, 1, 1, 1,
1.607781, 0.0241157, 3.074131, 1, 1, 1, 1, 1,
1.628218, -0.8653877, 0.6241097, 1, 1, 1, 1, 1,
1.62999, -1.771236, 1.998809, 0, 0, 1, 1, 1,
1.641158, -1.995557, 3.494682, 1, 0, 0, 1, 1,
1.64449, -0.1387016, 1.261844, 1, 0, 0, 1, 1,
1.649262, 0.5106079, 2.732946, 1, 0, 0, 1, 1,
1.649951, 0.6193923, 0.6023287, 1, 0, 0, 1, 1,
1.655844, -0.6918626, 2.137125, 1, 0, 0, 1, 1,
1.657804, -0.8092575, 0.5352647, 0, 0, 0, 1, 1,
1.662659, -0.2690364, 1.20338, 0, 0, 0, 1, 1,
1.666991, -1.011712, 2.132519, 0, 0, 0, 1, 1,
1.671837, -1.284913, 0.9451293, 0, 0, 0, 1, 1,
1.672177, 1.993937, 0.4402027, 0, 0, 0, 1, 1,
1.687095, 0.3650126, -0.7372044, 0, 0, 0, 1, 1,
1.69643, -1.026578, 2.171848, 0, 0, 0, 1, 1,
1.717004, 1.156664, 2.138061, 1, 1, 1, 1, 1,
1.724103, 0.3715504, 0.2670408, 1, 1, 1, 1, 1,
1.763709, -0.9103651, 0.3877332, 1, 1, 1, 1, 1,
1.769872, 0.4738539, 1.819486, 1, 1, 1, 1, 1,
1.812919, 0.4557217, 1.500811, 1, 1, 1, 1, 1,
1.845086, -1.067048, 5.034836, 1, 1, 1, 1, 1,
1.848681, -0.8597631, 2.949958, 1, 1, 1, 1, 1,
1.869304, -1.840437, 1.063139, 1, 1, 1, 1, 1,
1.891956, -0.9324316, 2.64066, 1, 1, 1, 1, 1,
1.928567, 0.8804008, 1.255693, 1, 1, 1, 1, 1,
1.942842, -1.033029, 2.554382, 1, 1, 1, 1, 1,
1.965055, 1.416443, 1.480973, 1, 1, 1, 1, 1,
1.972309, 0.8891961, 0.8450741, 1, 1, 1, 1, 1,
1.978724, 0.2907417, 2.369627, 1, 1, 1, 1, 1,
1.993851, 1.064494, 0.6621105, 1, 1, 1, 1, 1,
2.012582, -0.6086183, 1.162913, 0, 0, 1, 1, 1,
2.065715, 0.1414982, 3.27569, 1, 0, 0, 1, 1,
2.096973, -0.7641495, 2.168125, 1, 0, 0, 1, 1,
2.102681, -1.292903, 2.475492, 1, 0, 0, 1, 1,
2.124087, 1.657579, 0.1758617, 1, 0, 0, 1, 1,
2.164462, 2.05591, 1.340943, 1, 0, 0, 1, 1,
2.187599, 0.9587556, 3.512627, 0, 0, 0, 1, 1,
2.208723, -1.547991, 1.895255, 0, 0, 0, 1, 1,
2.259787, -1.688236, 1.32052, 0, 0, 0, 1, 1,
2.290151, -1.107709, 2.25857, 0, 0, 0, 1, 1,
2.30119, 0.003674913, 0.2664406, 0, 0, 0, 1, 1,
2.376877, 0.06414032, 0.5528858, 0, 0, 0, 1, 1,
2.390876, -0.233617, 3.428829, 0, 0, 0, 1, 1,
2.401042, -1.875541, 3.397442, 1, 1, 1, 1, 1,
2.504051, 1.025929, 2.184695, 1, 1, 1, 1, 1,
2.531446, -1.401301, 2.028369, 1, 1, 1, 1, 1,
2.664149, -0.3149703, 3.466302, 1, 1, 1, 1, 1,
2.718207, 1.713193, -0.01020913, 1, 1, 1, 1, 1,
2.922719, -0.6749642, 1.183894, 1, 1, 1, 1, 1,
4.008193, -0.7834958, 0.7473623, 1, 1, 1, 1, 1
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
var radius = 9.562479;
var distance = 33.5878;
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
mvMatrix.translate( -0.3700087, 0.005611658, 0.0187757 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5878);
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