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
-3.115013, 0.5413172, -2.777477, 1, 0, 0, 1,
-2.795582, 0.3633642, -4.529805, 1, 0.007843138, 0, 1,
-2.73071, 2.383727, -2.014573, 1, 0.01176471, 0, 1,
-2.623006, 0.7740409, -2.117054, 1, 0.01960784, 0, 1,
-2.571646, -0.1233819, -0.4100111, 1, 0.02352941, 0, 1,
-2.343112, -0.1900569, -1.221151, 1, 0.03137255, 0, 1,
-2.272264, 1.392036, -2.03706, 1, 0.03529412, 0, 1,
-2.146084, -0.1114792, -0.770419, 1, 0.04313726, 0, 1,
-2.113718, -1.132789, -1.555077, 1, 0.04705882, 0, 1,
-2.066088, -0.1652211, -0.4507884, 1, 0.05490196, 0, 1,
-2.019506, -0.2339413, -1.515464, 1, 0.05882353, 0, 1,
-2.008979, -0.07513966, -0.8635666, 1, 0.06666667, 0, 1,
-1.964486, 0.7709641, -1.468058, 1, 0.07058824, 0, 1,
-1.923237, -0.01425784, -0.6866631, 1, 0.07843138, 0, 1,
-1.905921, 0.0943552, -3.396282, 1, 0.08235294, 0, 1,
-1.899696, -0.7024176, -1.723043, 1, 0.09019608, 0, 1,
-1.897613, -0.5789882, -3.537801, 1, 0.09411765, 0, 1,
-1.886097, 1.640217, -1.188655, 1, 0.1019608, 0, 1,
-1.877972, 1.002194, -1.974766, 1, 0.1098039, 0, 1,
-1.874756, 0.9620224, -1.472712, 1, 0.1137255, 0, 1,
-1.874681, -1.488575, -1.70697, 1, 0.1215686, 0, 1,
-1.869082, 1.040798, 0.5628887, 1, 0.1254902, 0, 1,
-1.855252, -0.2264768, -0.4189796, 1, 0.1333333, 0, 1,
-1.843025, 0.02082799, -1.221716, 1, 0.1372549, 0, 1,
-1.820735, 0.493024, -1.50604, 1, 0.145098, 0, 1,
-1.811907, 1.353848, 0.3983597, 1, 0.1490196, 0, 1,
-1.811683, 0.1491045, -2.227746, 1, 0.1568628, 0, 1,
-1.794199, 0.5165519, -1.524953, 1, 0.1607843, 0, 1,
-1.789727, -0.4877574, -2.667935, 1, 0.1686275, 0, 1,
-1.7764, -0.2848947, 0.6337082, 1, 0.172549, 0, 1,
-1.766244, -0.8569617, -1.381219, 1, 0.1803922, 0, 1,
-1.760063, 0.2330416, -2.272794, 1, 0.1843137, 0, 1,
-1.751968, -1.078883, -1.467112, 1, 0.1921569, 0, 1,
-1.751911, -0.105011, -0.7697586, 1, 0.1960784, 0, 1,
-1.69501, 1.168675, -1.672404, 1, 0.2039216, 0, 1,
-1.691009, -1.693208, -0.0226275, 1, 0.2117647, 0, 1,
-1.685366, 0.5255528, -1.890897, 1, 0.2156863, 0, 1,
-1.666501, 0.2107608, 0.1888274, 1, 0.2235294, 0, 1,
-1.653898, 0.04406138, -3.1594, 1, 0.227451, 0, 1,
-1.610901, 0.000188209, -1.913433, 1, 0.2352941, 0, 1,
-1.602756, -0.002549264, -2.184317, 1, 0.2392157, 0, 1,
-1.599804, 0.268079, -3.821177, 1, 0.2470588, 0, 1,
-1.598713, 2.549123, -0.1851497, 1, 0.2509804, 0, 1,
-1.59128, 0.3470438, -2.261983, 1, 0.2588235, 0, 1,
-1.589899, 1.17173, -0.904965, 1, 0.2627451, 0, 1,
-1.588574, -0.3053662, -2.762685, 1, 0.2705882, 0, 1,
-1.586076, -0.986358, -1.19166, 1, 0.2745098, 0, 1,
-1.581796, -0.9268209, -1.443492, 1, 0.282353, 0, 1,
-1.572132, 0.007513769, -0.8619099, 1, 0.2862745, 0, 1,
-1.567565, 1.653754, 1.011777, 1, 0.2941177, 0, 1,
-1.54922, -0.3575289, -1.659684, 1, 0.3019608, 0, 1,
-1.541142, 0.1356292, -0.8509052, 1, 0.3058824, 0, 1,
-1.531341, 0.5919035, -1.766428, 1, 0.3137255, 0, 1,
-1.52065, 1.465175, -2.316369, 1, 0.3176471, 0, 1,
-1.512392, -0.2480479, -1.416113, 1, 0.3254902, 0, 1,
-1.509725, -0.2423163, -3.200446, 1, 0.3294118, 0, 1,
-1.50778, -0.009866996, -2.342684, 1, 0.3372549, 0, 1,
-1.503507, 1.612119, -1.275608, 1, 0.3411765, 0, 1,
-1.502335, -0.7964092, -0.6612192, 1, 0.3490196, 0, 1,
-1.500176, 0.337202, -2.049294, 1, 0.3529412, 0, 1,
-1.491743, -0.7371525, -0.7447783, 1, 0.3607843, 0, 1,
-1.489949, -0.8299531, -2.458694, 1, 0.3647059, 0, 1,
-1.483483, -1.737736, -1.639021, 1, 0.372549, 0, 1,
-1.47416, -0.9045537, -4.324687, 1, 0.3764706, 0, 1,
-1.473121, 0.9673347, -0.702441, 1, 0.3843137, 0, 1,
-1.472176, -0.2846455, -1.862576, 1, 0.3882353, 0, 1,
-1.470067, -0.234563, -1.72359, 1, 0.3960784, 0, 1,
-1.468475, -0.825038, -3.189385, 1, 0.4039216, 0, 1,
-1.468379, 0.01272863, -1.980525, 1, 0.4078431, 0, 1,
-1.455365, 0.7108932, -1.209247, 1, 0.4156863, 0, 1,
-1.441066, -1.001169, -3.293351, 1, 0.4196078, 0, 1,
-1.439889, 0.2319459, -2.85119, 1, 0.427451, 0, 1,
-1.427259, -0.07904577, 0.6735372, 1, 0.4313726, 0, 1,
-1.427122, -0.4569622, -2.606398, 1, 0.4392157, 0, 1,
-1.419475, 0.771933, 0.02948081, 1, 0.4431373, 0, 1,
-1.417203, -0.01111105, -1.810032, 1, 0.4509804, 0, 1,
-1.407881, 0.1017819, -1.736855, 1, 0.454902, 0, 1,
-1.397504, -1.74965, -1.905346, 1, 0.4627451, 0, 1,
-1.396969, 1.898887, 0.197092, 1, 0.4666667, 0, 1,
-1.379559, -0.04812356, -0.8239604, 1, 0.4745098, 0, 1,
-1.373539, 0.5866785, -1.456232, 1, 0.4784314, 0, 1,
-1.366507, -0.5566041, -3.484778, 1, 0.4862745, 0, 1,
-1.362231, 0.1831548, -1.826687, 1, 0.4901961, 0, 1,
-1.358595, 0.09627265, -2.656096, 1, 0.4980392, 0, 1,
-1.342472, 0.1453246, -0.711692, 1, 0.5058824, 0, 1,
-1.342356, 0.3678808, 0.4267422, 1, 0.509804, 0, 1,
-1.335724, 0.2495293, -1.813489, 1, 0.5176471, 0, 1,
-1.329591, -1.43508, -1.007304, 1, 0.5215687, 0, 1,
-1.300133, 0.3071877, -2.555601, 1, 0.5294118, 0, 1,
-1.296731, -0.6322715, 1.356742, 1, 0.5333334, 0, 1,
-1.296347, -0.8589976, -1.220651, 1, 0.5411765, 0, 1,
-1.288974, -0.9990779, -1.113037, 1, 0.5450981, 0, 1,
-1.288917, -1.284442, -1.741598, 1, 0.5529412, 0, 1,
-1.283908, 0.113037, -1.501689, 1, 0.5568628, 0, 1,
-1.28254, -0.4490565, -0.3580055, 1, 0.5647059, 0, 1,
-1.275825, -1.065297, -0.04398752, 1, 0.5686275, 0, 1,
-1.268874, 0.548078, -0.6009822, 1, 0.5764706, 0, 1,
-1.264835, 2.515192, -0.9874929, 1, 0.5803922, 0, 1,
-1.247684, -1.407582, -2.308189, 1, 0.5882353, 0, 1,
-1.233075, 1.727612, -0.3728727, 1, 0.5921569, 0, 1,
-1.225648, -1.656886, -1.824445, 1, 0.6, 0, 1,
-1.221184, 0.3161553, -2.50598, 1, 0.6078432, 0, 1,
-1.207954, -0.5235554, -0.9165755, 1, 0.6117647, 0, 1,
-1.205734, 1.718381, 0.7799035, 1, 0.6196079, 0, 1,
-1.188561, -1.038363, -1.677485, 1, 0.6235294, 0, 1,
-1.186165, 1.475836, -3.202052, 1, 0.6313726, 0, 1,
-1.184548, -1.023498, -1.690348, 1, 0.6352941, 0, 1,
-1.170798, 0.2962462, -0.06603941, 1, 0.6431373, 0, 1,
-1.163645, 1.439144, 0.3020277, 1, 0.6470588, 0, 1,
-1.15468, -0.633294, -0.8476968, 1, 0.654902, 0, 1,
-1.147614, -0.4676851, -2.13983, 1, 0.6588235, 0, 1,
-1.143167, -1.278308, -3.626858, 1, 0.6666667, 0, 1,
-1.133869, -2.110087, -1.805078, 1, 0.6705883, 0, 1,
-1.131939, 0.5840073, -0.4597998, 1, 0.6784314, 0, 1,
-1.122932, -0.124015, -1.257279, 1, 0.682353, 0, 1,
-1.11398, 0.3017194, -0.5570313, 1, 0.6901961, 0, 1,
-1.109925, -0.1475041, -0.9046596, 1, 0.6941177, 0, 1,
-1.108923, 0.7951719, -0.4268371, 1, 0.7019608, 0, 1,
-1.108276, 0.827987, -0.1482026, 1, 0.7098039, 0, 1,
-1.107771, -0.1731072, -1.497856, 1, 0.7137255, 0, 1,
-1.105091, -1.039571, -2.608227, 1, 0.7215686, 0, 1,
-1.103923, 1.341066, 0.4399778, 1, 0.7254902, 0, 1,
-1.102033, -0.8148031, -2.420015, 1, 0.7333333, 0, 1,
-1.099789, 0.109223, -2.061404, 1, 0.7372549, 0, 1,
-1.097271, -0.4722507, -2.709715, 1, 0.7450981, 0, 1,
-1.09041, -1.025477, -1.225404, 1, 0.7490196, 0, 1,
-1.089555, -1.837977, -3.13407, 1, 0.7568628, 0, 1,
-1.087563, -0.4919201, -2.616916, 1, 0.7607843, 0, 1,
-1.08662, -0.7993468, -1.683404, 1, 0.7686275, 0, 1,
-1.086338, -0.9525239, -2.840566, 1, 0.772549, 0, 1,
-1.085786, 1.111541, -1.123066, 1, 0.7803922, 0, 1,
-1.080684, -0.6348768, -1.665077, 1, 0.7843137, 0, 1,
-1.079703, -0.9995123, -2.635334, 1, 0.7921569, 0, 1,
-1.071082, 1.588751, 1.372152, 1, 0.7960784, 0, 1,
-1.068552, 0.9333919, -0.9017548, 1, 0.8039216, 0, 1,
-1.068474, 0.238937, -2.297687, 1, 0.8117647, 0, 1,
-1.065765, -0.3202161, -1.368921, 1, 0.8156863, 0, 1,
-1.063699, -1.316432, -2.445837, 1, 0.8235294, 0, 1,
-1.059872, 1.011495, -0.4898562, 1, 0.827451, 0, 1,
-1.047105, -0.2785436, -1.372471, 1, 0.8352941, 0, 1,
-1.04583, -0.6546879, -1.312393, 1, 0.8392157, 0, 1,
-1.044381, -1.417978, -1.74946, 1, 0.8470588, 0, 1,
-1.038845, 0.1552384, -2.751059, 1, 0.8509804, 0, 1,
-1.03749, 1.38276, -1.962624, 1, 0.8588235, 0, 1,
-1.033639, 2.022938, -0.6675276, 1, 0.8627451, 0, 1,
-1.032777, -1.000264, -4.059967, 1, 0.8705882, 0, 1,
-1.027874, 0.7903014, -1.433597, 1, 0.8745098, 0, 1,
-1.021909, -1.009718, -1.81717, 1, 0.8823529, 0, 1,
-1.012546, -1.03557, -2.642515, 1, 0.8862745, 0, 1,
-1.004171, -1.389855, -1.344575, 1, 0.8941177, 0, 1,
-1.000036, 0.6118827, -1.712621, 1, 0.8980392, 0, 1,
-0.99906, 0.2499096, -0.5006799, 1, 0.9058824, 0, 1,
-0.9949384, -1.899832, -3.482066, 1, 0.9137255, 0, 1,
-0.9885359, -0.7660001, -3.10315, 1, 0.9176471, 0, 1,
-0.984218, 0.7770686, -0.5899422, 1, 0.9254902, 0, 1,
-0.9733503, 0.04687249, -2.11985, 1, 0.9294118, 0, 1,
-0.9726506, -1.48626, -1.457624, 1, 0.9372549, 0, 1,
-0.9721411, -0.2570572, -1.255268, 1, 0.9411765, 0, 1,
-0.9639258, -0.01703242, -1.687807, 1, 0.9490196, 0, 1,
-0.9514676, -0.8905476, -1.325333, 1, 0.9529412, 0, 1,
-0.9482543, -0.7246283, -1.693655, 1, 0.9607843, 0, 1,
-0.9446975, -0.4529464, -1.437766, 1, 0.9647059, 0, 1,
-0.9433656, -2.344974, -2.077538, 1, 0.972549, 0, 1,
-0.9140639, -0.05580207, -3.679341, 1, 0.9764706, 0, 1,
-0.9137361, 1.119769, -0.3791051, 1, 0.9843137, 0, 1,
-0.9134192, 1.176558, 0.6774791, 1, 0.9882353, 0, 1,
-0.9106314, -0.267585, -1.366929, 1, 0.9960784, 0, 1,
-0.9063897, -1.276184, -2.253712, 0.9960784, 1, 0, 1,
-0.9041008, -1.365999, -1.805186, 0.9921569, 1, 0, 1,
-0.8998086, -1.024561, -2.812928, 0.9843137, 1, 0, 1,
-0.8991842, 2.52363, 0.7792529, 0.9803922, 1, 0, 1,
-0.8934212, 0.5254095, -2.353893, 0.972549, 1, 0, 1,
-0.8926306, -0.2384261, -1.358021, 0.9686275, 1, 0, 1,
-0.890461, 1.21358, -0.9442145, 0.9607843, 1, 0, 1,
-0.8901332, 0.8412578, 0.6484545, 0.9568627, 1, 0, 1,
-0.8884202, 0.9595586, -1.511968, 0.9490196, 1, 0, 1,
-0.884654, 0.8712497, -0.7273065, 0.945098, 1, 0, 1,
-0.8834046, 0.6336521, -1.866736, 0.9372549, 1, 0, 1,
-0.8772838, -0.9489775, -1.072397, 0.9333333, 1, 0, 1,
-0.8732431, 0.05613285, -1.384746, 0.9254902, 1, 0, 1,
-0.8634934, 0.5777802, -0.1362054, 0.9215686, 1, 0, 1,
-0.8630362, 0.8265326, -2.040976, 0.9137255, 1, 0, 1,
-0.8540199, 1.811717, 0.1490975, 0.9098039, 1, 0, 1,
-0.8432808, 0.5723169, -1.138939, 0.9019608, 1, 0, 1,
-0.8432148, -0.7785195, -0.6458941, 0.8941177, 1, 0, 1,
-0.8370422, 0.005962307, -0.5886153, 0.8901961, 1, 0, 1,
-0.831048, 0.1937926, -0.2493971, 0.8823529, 1, 0, 1,
-0.8298844, 0.5731824, 0.02952579, 0.8784314, 1, 0, 1,
-0.8288582, 0.001578744, -0.2666095, 0.8705882, 1, 0, 1,
-0.8275333, 0.7497824, -0.7784844, 0.8666667, 1, 0, 1,
-0.8266225, 0.04538222, -1.833381, 0.8588235, 1, 0, 1,
-0.8190686, 0.9427662, 0.2943234, 0.854902, 1, 0, 1,
-0.8183125, -0.9777051, -4.057766, 0.8470588, 1, 0, 1,
-0.8179027, 1.025, 0.04405738, 0.8431373, 1, 0, 1,
-0.81628, 0.6739529, -0.5720064, 0.8352941, 1, 0, 1,
-0.8098055, 0.1719999, -1.550546, 0.8313726, 1, 0, 1,
-0.7960077, 1.034233, -0.007800557, 0.8235294, 1, 0, 1,
-0.7928283, 0.9287371, -1.408959, 0.8196079, 1, 0, 1,
-0.7915357, 1.112971, -1.947908, 0.8117647, 1, 0, 1,
-0.7908836, -0.4432027, -3.460669, 0.8078431, 1, 0, 1,
-0.7826056, 0.671972, -2.050654, 0.8, 1, 0, 1,
-0.7810535, -0.6727687, -3.229761, 0.7921569, 1, 0, 1,
-0.7809704, 0.5366947, -1.523653, 0.7882353, 1, 0, 1,
-0.7800545, 0.2056096, -1.92069, 0.7803922, 1, 0, 1,
-0.7796691, -1.692683, -2.270938, 0.7764706, 1, 0, 1,
-0.7781764, -0.4224174, -2.336814, 0.7686275, 1, 0, 1,
-0.7766251, -0.2410978, -0.4988039, 0.7647059, 1, 0, 1,
-0.7760891, 0.8039519, -0.3535018, 0.7568628, 1, 0, 1,
-0.7729577, -1.84979, -1.469641, 0.7529412, 1, 0, 1,
-0.7710755, 0.5105767, 0.1483588, 0.7450981, 1, 0, 1,
-0.7607721, -1.696991, -1.466553, 0.7411765, 1, 0, 1,
-0.7580441, 1.925404, 0.1751429, 0.7333333, 1, 0, 1,
-0.7523436, -0.07564629, -1.948186, 0.7294118, 1, 0, 1,
-0.7518733, -0.09119446, -1.476459, 0.7215686, 1, 0, 1,
-0.7504363, 0.1163114, -0.866506, 0.7176471, 1, 0, 1,
-0.7453245, 1.014687, 0.08386318, 0.7098039, 1, 0, 1,
-0.7432472, 0.4339113, -0.8899926, 0.7058824, 1, 0, 1,
-0.7409911, -0.5724626, -1.967694, 0.6980392, 1, 0, 1,
-0.7402691, 1.698331, 0.5134134, 0.6901961, 1, 0, 1,
-0.7351379, 1.218564, 1.092629, 0.6862745, 1, 0, 1,
-0.7345479, 0.9833756, 0.04856156, 0.6784314, 1, 0, 1,
-0.7311815, -0.7587159, 0.01896651, 0.6745098, 1, 0, 1,
-0.7294815, 0.9805719, -2.4021, 0.6666667, 1, 0, 1,
-0.7287832, 0.2236364, -0.769278, 0.6627451, 1, 0, 1,
-0.7249311, 1.492936, -1.636737, 0.654902, 1, 0, 1,
-0.722836, 1.656359, 0.8153321, 0.6509804, 1, 0, 1,
-0.7218205, 0.2765054, -2.660686, 0.6431373, 1, 0, 1,
-0.7185127, -1.762282, -1.439593, 0.6392157, 1, 0, 1,
-0.7135208, 0.128012, -2.101301, 0.6313726, 1, 0, 1,
-0.7127773, -0.7645222, -2.936645, 0.627451, 1, 0, 1,
-0.7096065, -0.7206287, -3.141295, 0.6196079, 1, 0, 1,
-0.7038547, 0.5263679, 1.305678, 0.6156863, 1, 0, 1,
-0.6993802, 0.1059971, -2.236769, 0.6078432, 1, 0, 1,
-0.6977459, -1.427264, -2.853597, 0.6039216, 1, 0, 1,
-0.6957355, 1.096253, 0.7162967, 0.5960785, 1, 0, 1,
-0.693085, -0.6793865, -3.260197, 0.5882353, 1, 0, 1,
-0.6796118, -1.092864, -3.52315, 0.5843138, 1, 0, 1,
-0.6793466, -0.4471318, -2.41312, 0.5764706, 1, 0, 1,
-0.6763431, 0.828309, -0.3025267, 0.572549, 1, 0, 1,
-0.6752016, 0.4436426, -0.5000536, 0.5647059, 1, 0, 1,
-0.6748193, 0.3920625, -2.227781, 0.5607843, 1, 0, 1,
-0.6704733, -0.7001953, -2.441019, 0.5529412, 1, 0, 1,
-0.6684914, -0.7295005, -2.051568, 0.5490196, 1, 0, 1,
-0.6670001, -0.1727992, -3.294442, 0.5411765, 1, 0, 1,
-0.665273, -0.9655451, -2.388659, 0.5372549, 1, 0, 1,
-0.6621363, -0.8123436, -1.2242, 0.5294118, 1, 0, 1,
-0.6602905, -0.3218883, -1.871437, 0.5254902, 1, 0, 1,
-0.6512048, 1.454286, -1.578356, 0.5176471, 1, 0, 1,
-0.6444747, -0.7703896, -0.9947174, 0.5137255, 1, 0, 1,
-0.6427218, -0.2028558, -2.360873, 0.5058824, 1, 0, 1,
-0.6386746, -0.08219393, -2.62381, 0.5019608, 1, 0, 1,
-0.6351296, 1.408393, -0.4649689, 0.4941176, 1, 0, 1,
-0.6313429, 1.132144, 0.2656842, 0.4862745, 1, 0, 1,
-0.629376, -1.287163, -1.591472, 0.4823529, 1, 0, 1,
-0.6242601, -0.2705871, -1.41121, 0.4745098, 1, 0, 1,
-0.6228971, 0.4567077, -1.165269, 0.4705882, 1, 0, 1,
-0.6222506, -0.277187, -4.811633, 0.4627451, 1, 0, 1,
-0.6184508, -1.926628, -3.763758, 0.4588235, 1, 0, 1,
-0.6177778, -1.321521, -4.063654, 0.4509804, 1, 0, 1,
-0.6099493, 0.6648954, 0.7135317, 0.4470588, 1, 0, 1,
-0.6067029, -0.8327463, -3.408027, 0.4392157, 1, 0, 1,
-0.5959289, 0.8370771, -2.064929, 0.4352941, 1, 0, 1,
-0.593546, 0.4416786, -2.227962, 0.427451, 1, 0, 1,
-0.5877126, 0.4462955, -0.3748285, 0.4235294, 1, 0, 1,
-0.58666, -0.8289248, -1.464329, 0.4156863, 1, 0, 1,
-0.5825698, 2.675248, 1.697273, 0.4117647, 1, 0, 1,
-0.5823406, -1.839418, -5.335051, 0.4039216, 1, 0, 1,
-0.5798681, 1.363729, -1.518279, 0.3960784, 1, 0, 1,
-0.5742454, 0.9036666, 0.01739171, 0.3921569, 1, 0, 1,
-0.5727245, -0.7588263, -2.56519, 0.3843137, 1, 0, 1,
-0.5690949, -0.8850955, -2.140837, 0.3803922, 1, 0, 1,
-0.5664602, 1.521952, -0.4988208, 0.372549, 1, 0, 1,
-0.5647111, 1.085649, 0.09141632, 0.3686275, 1, 0, 1,
-0.5617483, -0.2861592, -0.4345483, 0.3607843, 1, 0, 1,
-0.5616174, -0.9954342, -1.632444, 0.3568628, 1, 0, 1,
-0.5578058, 0.5843279, 0.3189149, 0.3490196, 1, 0, 1,
-0.5570956, -0.5505534, -2.870703, 0.345098, 1, 0, 1,
-0.5541938, -0.1032113, -0.9073957, 0.3372549, 1, 0, 1,
-0.5529009, -1.053323, -0.139802, 0.3333333, 1, 0, 1,
-0.5498801, -1.969638, -3.163539, 0.3254902, 1, 0, 1,
-0.5421731, 1.285218, -1.363955, 0.3215686, 1, 0, 1,
-0.5417199, 0.03177234, -1.570423, 0.3137255, 1, 0, 1,
-0.5411193, -0.3161941, -2.377789, 0.3098039, 1, 0, 1,
-0.5401782, 0.1031906, -2.945279, 0.3019608, 1, 0, 1,
-0.5349787, 0.3703429, -0.1652435, 0.2941177, 1, 0, 1,
-0.527311, 0.95727, -1.366781, 0.2901961, 1, 0, 1,
-0.527225, -0.3719904, -2.716025, 0.282353, 1, 0, 1,
-0.5262084, -1.595196, -1.825286, 0.2784314, 1, 0, 1,
-0.5261952, 0.867093, 0.03021491, 0.2705882, 1, 0, 1,
-0.5181939, 0.8322163, -1.720373, 0.2666667, 1, 0, 1,
-0.5133939, 0.168381, -0.5567284, 0.2588235, 1, 0, 1,
-0.5129722, 0.02906464, -1.197097, 0.254902, 1, 0, 1,
-0.5120915, 1.231383, -0.8510687, 0.2470588, 1, 0, 1,
-0.5079288, -0.2187496, -1.509511, 0.2431373, 1, 0, 1,
-0.5037823, 0.6624058, -1.154807, 0.2352941, 1, 0, 1,
-0.5011043, 0.2193835, -1.738582, 0.2313726, 1, 0, 1,
-0.5004429, -1.49693, -3.389026, 0.2235294, 1, 0, 1,
-0.4982424, 0.8104247, -1.672588, 0.2196078, 1, 0, 1,
-0.4973168, 0.1743467, -0.3975406, 0.2117647, 1, 0, 1,
-0.4969671, -0.3234223, -2.65219, 0.2078431, 1, 0, 1,
-0.496752, -0.5431366, -2.629381, 0.2, 1, 0, 1,
-0.4959704, 1.42137, 1.324207, 0.1921569, 1, 0, 1,
-0.4959658, 0.6172708, -0.9420339, 0.1882353, 1, 0, 1,
-0.4885526, -0.4845773, -2.247579, 0.1803922, 1, 0, 1,
-0.4836742, -1.99711, -2.579859, 0.1764706, 1, 0, 1,
-0.4835597, -1.466895, -2.897101, 0.1686275, 1, 0, 1,
-0.4812931, 0.5105919, -0.6062475, 0.1647059, 1, 0, 1,
-0.4764184, -1.553325, -2.628824, 0.1568628, 1, 0, 1,
-0.4744514, -0.3563522, -0.5515563, 0.1529412, 1, 0, 1,
-0.4727276, -1.275538, -1.358814, 0.145098, 1, 0, 1,
-0.4706729, -1.4466, -3.942777, 0.1411765, 1, 0, 1,
-0.4701213, 1.3647, 0.6699256, 0.1333333, 1, 0, 1,
-0.4698158, -1.596146, -2.615669, 0.1294118, 1, 0, 1,
-0.4688812, -0.8334334, -3.405862, 0.1215686, 1, 0, 1,
-0.4684714, 0.2548051, -1.047649, 0.1176471, 1, 0, 1,
-0.4643315, 0.9113249, -2.590965, 0.1098039, 1, 0, 1,
-0.4628501, 1.183882, -2.310165, 0.1058824, 1, 0, 1,
-0.4610846, -0.1721003, -0.9773661, 0.09803922, 1, 0, 1,
-0.4600445, -1.450602, -2.045204, 0.09019608, 1, 0, 1,
-0.4586278, 0.8810266, 0.4091097, 0.08627451, 1, 0, 1,
-0.4366312, 1.193223, 1.505563, 0.07843138, 1, 0, 1,
-0.4343953, -0.00265298, -0.7579915, 0.07450981, 1, 0, 1,
-0.4324302, 1.999742, -2.269839, 0.06666667, 1, 0, 1,
-0.4319535, 0.9740764, -1.593393, 0.0627451, 1, 0, 1,
-0.4265465, 0.3041304, -0.382759, 0.05490196, 1, 0, 1,
-0.4260229, -0.8655782, -2.5183, 0.05098039, 1, 0, 1,
-0.4252704, 1.149443, -0.9383558, 0.04313726, 1, 0, 1,
-0.4237444, 0.5575129, 0.1268933, 0.03921569, 1, 0, 1,
-0.4224333, -0.9327047, -3.868632, 0.03137255, 1, 0, 1,
-0.4211098, -0.2714637, -0.0805004, 0.02745098, 1, 0, 1,
-0.420718, 1.056086, -0.6327853, 0.01960784, 1, 0, 1,
-0.4093977, -2.175931, -1.934551, 0.01568628, 1, 0, 1,
-0.4093537, -1.195493, -2.355368, 0.007843138, 1, 0, 1,
-0.4090878, 0.2124559, -1.568667, 0.003921569, 1, 0, 1,
-0.4080649, 0.1357882, -3.579357, 0, 1, 0.003921569, 1,
-0.405671, 1.01738, 0.5452917, 0, 1, 0.01176471, 1,
-0.3955048, -0.7964881, -3.258943, 0, 1, 0.01568628, 1,
-0.3929678, 0.7926213, -1.823244, 0, 1, 0.02352941, 1,
-0.3849481, 0.5298929, -0.3667867, 0, 1, 0.02745098, 1,
-0.3803866, 1.1043, -1.497846, 0, 1, 0.03529412, 1,
-0.3798008, 1.420961, 1.035962, 0, 1, 0.03921569, 1,
-0.3789514, -0.1191497, -1.470371, 0, 1, 0.04705882, 1,
-0.3783289, 0.88087, 0.2663763, 0, 1, 0.05098039, 1,
-0.3781568, 0.006902528, -1.721452, 0, 1, 0.05882353, 1,
-0.3748725, 0.5604568, -1.704195, 0, 1, 0.0627451, 1,
-0.3742671, 0.3710801, -0.7685254, 0, 1, 0.07058824, 1,
-0.370327, 0.4424326, -0.5686064, 0, 1, 0.07450981, 1,
-0.3698141, -2.772307, -2.826445, 0, 1, 0.08235294, 1,
-0.3665996, 0.8675277, 0.6504978, 0, 1, 0.08627451, 1,
-0.3649441, 1.963942, -1.087958, 0, 1, 0.09411765, 1,
-0.3622493, -0.0406672, -1.555225, 0, 1, 0.1019608, 1,
-0.3590463, 0.8200044, -1.157665, 0, 1, 0.1058824, 1,
-0.358604, -2.064294, -1.754137, 0, 1, 0.1137255, 1,
-0.3547796, -0.7804111, -3.626973, 0, 1, 0.1176471, 1,
-0.3398252, -0.01246039, -0.918488, 0, 1, 0.1254902, 1,
-0.3389732, 0.3778287, -0.5734428, 0, 1, 0.1294118, 1,
-0.3363551, 0.7047039, -0.4701304, 0, 1, 0.1372549, 1,
-0.3286887, 0.04409964, -0.3283489, 0, 1, 0.1411765, 1,
-0.3285245, -0.08515583, -2.088857, 0, 1, 0.1490196, 1,
-0.3284809, -0.7106665, -1.829244, 0, 1, 0.1529412, 1,
-0.3279417, -0.6047322, -3.009808, 0, 1, 0.1607843, 1,
-0.323447, -0.1415614, -2.799761, 0, 1, 0.1647059, 1,
-0.3228264, 0.4707809, -2.437747, 0, 1, 0.172549, 1,
-0.318296, 0.8516859, -1.320972, 0, 1, 0.1764706, 1,
-0.3179389, -0.3034644, -4.002667, 0, 1, 0.1843137, 1,
-0.3177747, -0.1623025, -1.949247, 0, 1, 0.1882353, 1,
-0.3152436, -1.124772, -2.888602, 0, 1, 0.1960784, 1,
-0.3107995, 0.907648, -0.6608633, 0, 1, 0.2039216, 1,
-0.3074214, 0.7550725, 2.071511, 0, 1, 0.2078431, 1,
-0.3057699, 1.255468, -0.6558926, 0, 1, 0.2156863, 1,
-0.3043181, -0.9474223, -2.332431, 0, 1, 0.2196078, 1,
-0.2980371, -1.050702, -3.355386, 0, 1, 0.227451, 1,
-0.295134, 0.7233797, -1.299086, 0, 1, 0.2313726, 1,
-0.294234, 0.6096607, -0.7645556, 0, 1, 0.2392157, 1,
-0.2927661, -0.5658371, -3.132834, 0, 1, 0.2431373, 1,
-0.2923893, 1.838766, -1.773911, 0, 1, 0.2509804, 1,
-0.2912209, -0.120589, -3.019102, 0, 1, 0.254902, 1,
-0.2906061, 0.9877105, -2.183437, 0, 1, 0.2627451, 1,
-0.2900974, 1.587303, -1.034616, 0, 1, 0.2666667, 1,
-0.2893548, 0.8736675, -1.352168, 0, 1, 0.2745098, 1,
-0.2848159, -0.8145402, -2.8953, 0, 1, 0.2784314, 1,
-0.2842954, 1.96465, -1.195089, 0, 1, 0.2862745, 1,
-0.279625, 1.147317, 0.8349349, 0, 1, 0.2901961, 1,
-0.2792957, 0.5511376, 0.6628303, 0, 1, 0.2980392, 1,
-0.2768477, -0.5103852, -1.806663, 0, 1, 0.3058824, 1,
-0.2765678, 0.1656428, -2.693457, 0, 1, 0.3098039, 1,
-0.2758401, -0.3202616, -3.380643, 0, 1, 0.3176471, 1,
-0.2727427, 0.08897327, -1.645011, 0, 1, 0.3215686, 1,
-0.272395, 0.3248332, 1.181706, 0, 1, 0.3294118, 1,
-0.2582827, 0.7355484, 0.9596558, 0, 1, 0.3333333, 1,
-0.2579221, 1.036505, 0.1963444, 0, 1, 0.3411765, 1,
-0.2563518, -0.6381307, -2.572648, 0, 1, 0.345098, 1,
-0.2548571, -0.1699234, -3.747424, 0, 1, 0.3529412, 1,
-0.2531885, -0.07841803, -2.499893, 0, 1, 0.3568628, 1,
-0.2519707, 1.98779, -2.148968, 0, 1, 0.3647059, 1,
-0.2452854, -1.591307, -5.944836, 0, 1, 0.3686275, 1,
-0.229205, 0.4843365, -0.1774876, 0, 1, 0.3764706, 1,
-0.2289309, 0.6572862, 0.2335902, 0, 1, 0.3803922, 1,
-0.2288955, -0.5284991, -4.386847, 0, 1, 0.3882353, 1,
-0.2115805, -0.8557425, -4.096866, 0, 1, 0.3921569, 1,
-0.2083414, 0.02380581, -2.107476, 0, 1, 0.4, 1,
-0.205851, 1.61805, 0.183023, 0, 1, 0.4078431, 1,
-0.2044142, -0.1900275, -3.860218, 0, 1, 0.4117647, 1,
-0.1979916, 0.9985998, -1.36939, 0, 1, 0.4196078, 1,
-0.1939575, -1.207653, -4.31915, 0, 1, 0.4235294, 1,
-0.1867381, -1.529991, -3.737699, 0, 1, 0.4313726, 1,
-0.1866615, -0.4423286, 0.2670848, 0, 1, 0.4352941, 1,
-0.1857297, 0.6647961, -0.5800694, 0, 1, 0.4431373, 1,
-0.1824614, 0.8166752, 1.575085, 0, 1, 0.4470588, 1,
-0.1786128, -1.082016, -2.000844, 0, 1, 0.454902, 1,
-0.1743333, 0.4233732, 0.2998059, 0, 1, 0.4588235, 1,
-0.1674913, 0.6687269, 0.5416234, 0, 1, 0.4666667, 1,
-0.1667316, -1.135103, -1.073808, 0, 1, 0.4705882, 1,
-0.1642745, -0.1919208, 0.2365549, 0, 1, 0.4784314, 1,
-0.1558089, 0.1552596, -0.6526824, 0, 1, 0.4823529, 1,
-0.1504639, 1.14598, -0.5310909, 0, 1, 0.4901961, 1,
-0.1483412, -0.752299, -3.052322, 0, 1, 0.4941176, 1,
-0.1431541, 0.1739359, -0.1024689, 0, 1, 0.5019608, 1,
-0.1424166, -0.8113615, -1.51639, 0, 1, 0.509804, 1,
-0.1406218, 0.9137486, 0.09218514, 0, 1, 0.5137255, 1,
-0.1397614, 1.804042, 0.5250239, 0, 1, 0.5215687, 1,
-0.139643, 1.942626, -0.6932054, 0, 1, 0.5254902, 1,
-0.1318007, 0.009119335, -1.057654, 0, 1, 0.5333334, 1,
-0.1218627, 0.5343667, 0.3548361, 0, 1, 0.5372549, 1,
-0.1208342, 0.2653974, -0.7806004, 0, 1, 0.5450981, 1,
-0.1208135, -0.4354256, -4.666746, 0, 1, 0.5490196, 1,
-0.1200058, -0.07069659, -3.807659, 0, 1, 0.5568628, 1,
-0.1176035, -0.4340955, -2.481951, 0, 1, 0.5607843, 1,
-0.1124555, -0.4329669, -1.615034, 0, 1, 0.5686275, 1,
-0.1123206, -0.6835195, -3.951603, 0, 1, 0.572549, 1,
-0.1123146, 0.3987559, 1.648932, 0, 1, 0.5803922, 1,
-0.1114012, 1.219813, 0.7583352, 0, 1, 0.5843138, 1,
-0.1111668, -0.1285957, -2.481428, 0, 1, 0.5921569, 1,
-0.1107106, -0.8666131, -2.639535, 0, 1, 0.5960785, 1,
-0.1104081, 0.83079, 0.775143, 0, 1, 0.6039216, 1,
-0.1103093, 0.2237111, -0.1159058, 0, 1, 0.6117647, 1,
-0.106396, -1.154008, -2.610403, 0, 1, 0.6156863, 1,
-0.1017098, 1.146776, -1.235029, 0, 1, 0.6235294, 1,
-0.1003735, 0.6604764, 0.3955305, 0, 1, 0.627451, 1,
-0.0986292, 2.724855, -0.5790011, 0, 1, 0.6352941, 1,
-0.09732556, 0.7702671, -0.9520553, 0, 1, 0.6392157, 1,
-0.09481224, 0.4965857, 0.2608685, 0, 1, 0.6470588, 1,
-0.09244593, 1.3014, -0.7728382, 0, 1, 0.6509804, 1,
-0.09156097, 0.2334834, 1.061324, 0, 1, 0.6588235, 1,
-0.09106692, -1.928785, -4.026929, 0, 1, 0.6627451, 1,
-0.09031999, -0.4226402, -2.926788, 0, 1, 0.6705883, 1,
-0.09012787, 0.8240679, -0.3806785, 0, 1, 0.6745098, 1,
-0.08796147, 0.6267678, 0.02633767, 0, 1, 0.682353, 1,
-0.0865102, -0.5627981, -3.788977, 0, 1, 0.6862745, 1,
-0.08643902, -0.7274148, -1.191528, 0, 1, 0.6941177, 1,
-0.08258336, 2.300852, 0.3333943, 0, 1, 0.7019608, 1,
-0.07984432, 0.9347476, 0.2015965, 0, 1, 0.7058824, 1,
-0.07801531, -0.8235704, -4.533482, 0, 1, 0.7137255, 1,
-0.07531045, 0.7479869, -0.3436227, 0, 1, 0.7176471, 1,
-0.07461232, 0.5907811, -0.7679291, 0, 1, 0.7254902, 1,
-0.06920813, -1.85984, -3.659403, 0, 1, 0.7294118, 1,
-0.06803891, -0.3366278, -4.858552, 0, 1, 0.7372549, 1,
-0.06745791, -1.173875, -2.262286, 0, 1, 0.7411765, 1,
-0.06647217, -0.09537452, -2.031946, 0, 1, 0.7490196, 1,
-0.06386657, 0.991664, 1.200903, 0, 1, 0.7529412, 1,
-0.06220403, -0.8299876, -3.370324, 0, 1, 0.7607843, 1,
-0.06108353, 0.7589504, -1.793052, 0, 1, 0.7647059, 1,
-0.0601377, -1.394932, -5.088448, 0, 1, 0.772549, 1,
-0.05993504, -1.583834, -4.081776, 0, 1, 0.7764706, 1,
-0.05874272, 1.250886, 0.8178567, 0, 1, 0.7843137, 1,
-0.05364949, 0.03971864, -0.8124023, 0, 1, 0.7882353, 1,
-0.05227321, 0.8882595, 1.863635, 0, 1, 0.7960784, 1,
-0.05146056, -1.097759, -3.059766, 0, 1, 0.8039216, 1,
-0.05142192, 1.217526, 0.05806401, 0, 1, 0.8078431, 1,
-0.04876579, -0.6647204, -3.424989, 0, 1, 0.8156863, 1,
-0.04394257, -0.7422951, -3.487327, 0, 1, 0.8196079, 1,
-0.04384302, -0.4439239, -2.859756, 0, 1, 0.827451, 1,
-0.04117519, 0.4820822, 0.4793022, 0, 1, 0.8313726, 1,
-0.03475837, -0.3006397, -3.13154, 0, 1, 0.8392157, 1,
-0.03204222, -1.561852, -3.309898, 0, 1, 0.8431373, 1,
-0.03157679, 0.9240238, -0.8914766, 0, 1, 0.8509804, 1,
-0.03142738, 0.09819774, 0.1982658, 0, 1, 0.854902, 1,
-0.0314176, -0.4229831, -1.99179, 0, 1, 0.8627451, 1,
-0.02852404, -0.7890866, -0.1153203, 0, 1, 0.8666667, 1,
-0.02380213, 0.1696677, -1.102365, 0, 1, 0.8745098, 1,
-0.02268894, 0.586902, -0.4586823, 0, 1, 0.8784314, 1,
-0.0220734, 0.05504645, -0.3357384, 0, 1, 0.8862745, 1,
-0.02097636, 0.3315714, 0.9694247, 0, 1, 0.8901961, 1,
-0.02093591, 1.066771, 0.1218228, 0, 1, 0.8980392, 1,
-0.02015675, -1.214583, -4.612184, 0, 1, 0.9058824, 1,
-0.01993933, 0.7624472, -1.622065, 0, 1, 0.9098039, 1,
-0.004278792, -0.916422, -1.991869, 0, 1, 0.9176471, 1,
-0.001130161, -1.172703, -2.105165, 0, 1, 0.9215686, 1,
0.0004910057, 0.5191463, 0.7419284, 0, 1, 0.9294118, 1,
0.005883242, 0.09868401, 1.188372, 0, 1, 0.9333333, 1,
0.007642141, -0.5387477, 2.692456, 0, 1, 0.9411765, 1,
0.01041667, -0.8857251, 2.895137, 0, 1, 0.945098, 1,
0.01362618, -1.694516, 4.16573, 0, 1, 0.9529412, 1,
0.01938801, 1.464401, -1.013273, 0, 1, 0.9568627, 1,
0.02289184, -0.5633945, 4.42871, 0, 1, 0.9647059, 1,
0.02530807, -1.150194, 2.839533, 0, 1, 0.9686275, 1,
0.02742225, -0.7638697, 3.911877, 0, 1, 0.9764706, 1,
0.02865175, -0.2128848, 2.234283, 0, 1, 0.9803922, 1,
0.02961043, 0.2220067, -1.652074, 0, 1, 0.9882353, 1,
0.03315544, -0.4355864, 0.4625875, 0, 1, 0.9921569, 1,
0.03972597, -1.125358, 3.825778, 0, 1, 1, 1,
0.04350498, 0.8291085, 0.5974565, 0, 0.9921569, 1, 1,
0.04504034, -1.470504, 4.784491, 0, 0.9882353, 1, 1,
0.04793305, 0.5970415, 1.091472, 0, 0.9803922, 1, 1,
0.05069154, -1.356631, 0.7559351, 0, 0.9764706, 1, 1,
0.05363542, -0.9304019, 2.517195, 0, 0.9686275, 1, 1,
0.05644718, -0.9987713, 2.511618, 0, 0.9647059, 1, 1,
0.05978732, -1.915498, 2.056973, 0, 0.9568627, 1, 1,
0.06094969, -1.341799, 3.210042, 0, 0.9529412, 1, 1,
0.06235005, 0.774234, 0.01915028, 0, 0.945098, 1, 1,
0.06487858, -0.3233725, 1.868706, 0, 0.9411765, 1, 1,
0.06680758, -1.842048, 4.174832, 0, 0.9333333, 1, 1,
0.06724682, 0.01836823, 2.071592, 0, 0.9294118, 1, 1,
0.07160549, -0.3094809, 1.045545, 0, 0.9215686, 1, 1,
0.08022521, -0.4579403, 2.810446, 0, 0.9176471, 1, 1,
0.08387546, 1.00473, -0.2011775, 0, 0.9098039, 1, 1,
0.1005132, -0.5328797, 3.931533, 0, 0.9058824, 1, 1,
0.1011561, 1.001212, -1.927408, 0, 0.8980392, 1, 1,
0.1140429, 0.2961523, 1.862537, 0, 0.8901961, 1, 1,
0.1156467, 1.125286, 0.5713242, 0, 0.8862745, 1, 1,
0.1189406, 0.01781327, 1.814336, 0, 0.8784314, 1, 1,
0.125591, -1.931354, 4.406127, 0, 0.8745098, 1, 1,
0.1262381, 1.359383, -0.6757988, 0, 0.8666667, 1, 1,
0.1264444, -1.209226, 2.271781, 0, 0.8627451, 1, 1,
0.1267161, 1.191066, 0.4216513, 0, 0.854902, 1, 1,
0.1276128, -0.2207245, 2.013474, 0, 0.8509804, 1, 1,
0.1281226, 1.044443, -0.1710492, 0, 0.8431373, 1, 1,
0.1304548, 1.613364, 1.63659, 0, 0.8392157, 1, 1,
0.1346694, 0.3758363, -0.4501684, 0, 0.8313726, 1, 1,
0.1346772, -1.005569, 2.976132, 0, 0.827451, 1, 1,
0.1350077, 0.04286204, 1.523833, 0, 0.8196079, 1, 1,
0.1440385, -0.7901486, 2.275352, 0, 0.8156863, 1, 1,
0.1456285, 0.3986243, 0.3052286, 0, 0.8078431, 1, 1,
0.150098, -0.6313786, 1.893609, 0, 0.8039216, 1, 1,
0.1597565, 0.05528992, 0.5826891, 0, 0.7960784, 1, 1,
0.1621233, -1.0424, 2.856008, 0, 0.7882353, 1, 1,
0.1650765, -1.040405, 2.17098, 0, 0.7843137, 1, 1,
0.1682163, -0.8353693, 2.495748, 0, 0.7764706, 1, 1,
0.1715382, -2.438948, 4.034555, 0, 0.772549, 1, 1,
0.1730323, 0.4615274, -0.3910201, 0, 0.7647059, 1, 1,
0.1766589, 0.8425482, -1.397294, 0, 0.7607843, 1, 1,
0.1830738, -0.1827066, 2.254197, 0, 0.7529412, 1, 1,
0.1962132, 1.014429, -1.189816, 0, 0.7490196, 1, 1,
0.1993649, 0.3689831, 0.1277844, 0, 0.7411765, 1, 1,
0.2003056, -1.989898, 3.202964, 0, 0.7372549, 1, 1,
0.2008698, -0.3733189, 3.522669, 0, 0.7294118, 1, 1,
0.2022451, -0.9156986, 3.5612, 0, 0.7254902, 1, 1,
0.2047216, 0.802062, 0.9751378, 0, 0.7176471, 1, 1,
0.2058819, -0.1279154, 2.296361, 0, 0.7137255, 1, 1,
0.2063407, -2.407976, 3.237508, 0, 0.7058824, 1, 1,
0.208721, 0.3814532, 2.072378, 0, 0.6980392, 1, 1,
0.2090323, 0.2373275, 1.247859, 0, 0.6941177, 1, 1,
0.2095917, -0.1342781, 0.6019211, 0, 0.6862745, 1, 1,
0.2098318, 0.01959623, 1.824368, 0, 0.682353, 1, 1,
0.2100262, -0.439282, 3.006674, 0, 0.6745098, 1, 1,
0.2163348, -2.98272, 2.415395, 0, 0.6705883, 1, 1,
0.2192768, 0.6470345, -0.2346769, 0, 0.6627451, 1, 1,
0.2227159, -1.36925, 4.16856, 0, 0.6588235, 1, 1,
0.2232457, -0.04804949, 1.334365, 0, 0.6509804, 1, 1,
0.2246045, 0.4846604, 2.269339, 0, 0.6470588, 1, 1,
0.2305538, 0.6048473, -0.128596, 0, 0.6392157, 1, 1,
0.2328833, 0.8694022, -0.4398536, 0, 0.6352941, 1, 1,
0.2331056, 0.1437565, 0.9549249, 0, 0.627451, 1, 1,
0.2362108, 1.227869, 2.292775, 0, 0.6235294, 1, 1,
0.2366963, -0.4964023, 4.380512, 0, 0.6156863, 1, 1,
0.2394588, 0.509685, -0.7695032, 0, 0.6117647, 1, 1,
0.2394614, 0.7062588, -0.1925922, 0, 0.6039216, 1, 1,
0.2396108, 0.176883, 0.3309296, 0, 0.5960785, 1, 1,
0.2406341, -1.201771, 3.736408, 0, 0.5921569, 1, 1,
0.2419494, 0.8060889, -0.04805866, 0, 0.5843138, 1, 1,
0.2547802, 1.06927, -0.7185563, 0, 0.5803922, 1, 1,
0.2570966, 0.2121737, 0.7906964, 0, 0.572549, 1, 1,
0.2575967, -0.8633679, 1.740901, 0, 0.5686275, 1, 1,
0.2577324, 0.06392995, 0.8016243, 0, 0.5607843, 1, 1,
0.258983, 2.093729, 0.3974242, 0, 0.5568628, 1, 1,
0.2592935, 0.2717156, -0.9466486, 0, 0.5490196, 1, 1,
0.2636843, -1.195808, 3.12247, 0, 0.5450981, 1, 1,
0.2673977, 0.2504443, 1.498927, 0, 0.5372549, 1, 1,
0.2679183, -0.3524847, 2.262984, 0, 0.5333334, 1, 1,
0.2682246, -0.4430603, 2.644609, 0, 0.5254902, 1, 1,
0.278467, -0.2869382, 3.322116, 0, 0.5215687, 1, 1,
0.2788389, 0.4646374, 1.580386, 0, 0.5137255, 1, 1,
0.2795533, 0.526962, 0.09159464, 0, 0.509804, 1, 1,
0.282178, -1.1303, 3.198226, 0, 0.5019608, 1, 1,
0.2829734, -1.109983, 1.943116, 0, 0.4941176, 1, 1,
0.2858148, 0.1273667, 1.877179, 0, 0.4901961, 1, 1,
0.2877287, -0.414332, 3.255919, 0, 0.4823529, 1, 1,
0.2899398, -1.120999, 4.023011, 0, 0.4784314, 1, 1,
0.2903813, -1.29185, 1.125448, 0, 0.4705882, 1, 1,
0.2904543, -0.6476474, 2.76734, 0, 0.4666667, 1, 1,
0.2976891, -1.751553, 2.570975, 0, 0.4588235, 1, 1,
0.2994324, -0.8755578, 1.600304, 0, 0.454902, 1, 1,
0.3014868, -0.4950218, 2.321874, 0, 0.4470588, 1, 1,
0.3027531, 1.184613, 1.219324, 0, 0.4431373, 1, 1,
0.3033137, -0.5437343, 3.140948, 0, 0.4352941, 1, 1,
0.3045702, -1.328319, 3.26709, 0, 0.4313726, 1, 1,
0.3047568, 0.8647866, 0.7971739, 0, 0.4235294, 1, 1,
0.306218, 2.450452, 1.409814, 0, 0.4196078, 1, 1,
0.3077071, -0.5389013, 2.720453, 0, 0.4117647, 1, 1,
0.3086383, -0.8029631, 2.667186, 0, 0.4078431, 1, 1,
0.3095571, 1.520316, 0.1870389, 0, 0.4, 1, 1,
0.3114457, -0.40316, 4.147861, 0, 0.3921569, 1, 1,
0.3152016, 0.1975003, 1.862484, 0, 0.3882353, 1, 1,
0.3188004, 0.2459177, 1.387853, 0, 0.3803922, 1, 1,
0.3193914, 1.284345, -0.8167098, 0, 0.3764706, 1, 1,
0.3240339, 0.6486192, -1.143674, 0, 0.3686275, 1, 1,
0.325813, -0.05067581, 1.380565, 0, 0.3647059, 1, 1,
0.3294494, -0.4714907, 2.239831, 0, 0.3568628, 1, 1,
0.3318311, 0.5321295, -1.168019, 0, 0.3529412, 1, 1,
0.3333412, -0.9345526, 1.533129, 0, 0.345098, 1, 1,
0.3390476, -0.7163684, 3.554924, 0, 0.3411765, 1, 1,
0.3395471, -1.103025, 1.446914, 0, 0.3333333, 1, 1,
0.3407895, -1.294324, 2.098698, 0, 0.3294118, 1, 1,
0.3427552, 0.6926256, 0.4005931, 0, 0.3215686, 1, 1,
0.3453946, -1.64394, 2.755303, 0, 0.3176471, 1, 1,
0.3463373, 0.6959747, -0.07595156, 0, 0.3098039, 1, 1,
0.3505093, 0.1955654, 0.1385369, 0, 0.3058824, 1, 1,
0.3506682, -0.6800649, 1.867877, 0, 0.2980392, 1, 1,
0.3510242, -0.06876521, 1.074833, 0, 0.2901961, 1, 1,
0.3567143, -1.779307, 2.136799, 0, 0.2862745, 1, 1,
0.3570173, 0.1821818, 2.147534, 0, 0.2784314, 1, 1,
0.3591608, 1.623726, 0.2717686, 0, 0.2745098, 1, 1,
0.3681509, 0.4903244, 0.8065611, 0, 0.2666667, 1, 1,
0.3685466, -0.8644742, 2.56107, 0, 0.2627451, 1, 1,
0.3702737, -0.1404825, 2.214155, 0, 0.254902, 1, 1,
0.3725013, 0.4987962, -0.3773715, 0, 0.2509804, 1, 1,
0.3781606, 1.109571, 0.6872926, 0, 0.2431373, 1, 1,
0.3808627, 1.035072, -0.1135833, 0, 0.2392157, 1, 1,
0.3818886, 1.692789, 0.3660695, 0, 0.2313726, 1, 1,
0.3830703, -0.4589568, 2.005615, 0, 0.227451, 1, 1,
0.3869428, -0.1504981, 2.894165, 0, 0.2196078, 1, 1,
0.3977501, -1.562298, 2.081406, 0, 0.2156863, 1, 1,
0.4003874, 0.8413171, 0.07708658, 0, 0.2078431, 1, 1,
0.4008034, 0.8749535, -0.09904698, 0, 0.2039216, 1, 1,
0.4036325, 1.041985, 1.526938, 0, 0.1960784, 1, 1,
0.4089881, -1.490791, 2.261363, 0, 0.1882353, 1, 1,
0.4100758, -0.2660206, 0.6901111, 0, 0.1843137, 1, 1,
0.4105534, 0.1029687, 2.645691, 0, 0.1764706, 1, 1,
0.4109874, 0.005417124, 1.330525, 0, 0.172549, 1, 1,
0.4123068, 1.185203, 0.6762559, 0, 0.1647059, 1, 1,
0.4140983, -0.09272204, 2.331325, 0, 0.1607843, 1, 1,
0.4157701, -2.120049, 3.736241, 0, 0.1529412, 1, 1,
0.4162521, 0.7868868, -1.328707, 0, 0.1490196, 1, 1,
0.4172933, 0.8577036, -0.6121835, 0, 0.1411765, 1, 1,
0.4179548, 1.049002, -0.3262654, 0, 0.1372549, 1, 1,
0.418252, -2.476908, 3.426472, 0, 0.1294118, 1, 1,
0.422567, 0.01405996, 1.626719, 0, 0.1254902, 1, 1,
0.4233024, 0.4537946, -0.7566841, 0, 0.1176471, 1, 1,
0.4242731, 0.5095692, -1.579937, 0, 0.1137255, 1, 1,
0.4310655, -1.430717, 2.354569, 0, 0.1058824, 1, 1,
0.4324106, -0.4679807, 2.176814, 0, 0.09803922, 1, 1,
0.4324283, -0.6783629, 2.992302, 0, 0.09411765, 1, 1,
0.4343888, -1.669119, 3.440339, 0, 0.08627451, 1, 1,
0.4344176, -0.6214626, 3.469208, 0, 0.08235294, 1, 1,
0.436664, -0.007574896, 1.388532, 0, 0.07450981, 1, 1,
0.436971, -0.01112175, 1.424914, 0, 0.07058824, 1, 1,
0.438431, 1.461161, -0.3488367, 0, 0.0627451, 1, 1,
0.4422196, -0.1191279, -0.399172, 0, 0.05882353, 1, 1,
0.4426959, 1.160005, 1.782706, 0, 0.05098039, 1, 1,
0.4434292, -0.4055549, 2.111678, 0, 0.04705882, 1, 1,
0.4447219, 0.9631308, 0.421709, 0, 0.03921569, 1, 1,
0.4494954, -0.6913812, 3.403354, 0, 0.03529412, 1, 1,
0.4505456, -2.571535, 4.469615, 0, 0.02745098, 1, 1,
0.4533547, -0.6510037, 3.225389, 0, 0.02352941, 1, 1,
0.4535874, 1.607709, 2.095978, 0, 0.01568628, 1, 1,
0.4539188, 0.1830034, 0.8982719, 0, 0.01176471, 1, 1,
0.4544721, -0.4893702, -1.451693, 0, 0.003921569, 1, 1,
0.4570685, 1.530689, -0.3221695, 0.003921569, 0, 1, 1,
0.4583291, -0.4033278, 2.186051, 0.007843138, 0, 1, 1,
0.460591, -0.7729145, 3.177285, 0.01568628, 0, 1, 1,
0.4619691, -0.639926, 2.112836, 0.01960784, 0, 1, 1,
0.4623722, -0.04918459, 1.433987, 0.02745098, 0, 1, 1,
0.4636677, 2.063319, 0.4596605, 0.03137255, 0, 1, 1,
0.4693363, 0.5006626, 1.520884, 0.03921569, 0, 1, 1,
0.4700618, 1.003441, 0.7027245, 0.04313726, 0, 1, 1,
0.4712074, 1.601621, 0.8726169, 0.05098039, 0, 1, 1,
0.4748822, 0.546155, -0.6003944, 0.05490196, 0, 1, 1,
0.4760239, -1.12153, 2.813427, 0.0627451, 0, 1, 1,
0.4763462, 0.05785543, -1.144806, 0.06666667, 0, 1, 1,
0.4819215, 1.489175, 1.879216, 0.07450981, 0, 1, 1,
0.4830176, -0.7279181, 1.327476, 0.07843138, 0, 1, 1,
0.4890088, -1.406291, 3.115915, 0.08627451, 0, 1, 1,
0.4895608, -0.6776586, 1.317935, 0.09019608, 0, 1, 1,
0.4903699, 0.4801286, 1.489158, 0.09803922, 0, 1, 1,
0.4928225, 0.7977781, 0.9931979, 0.1058824, 0, 1, 1,
0.492837, 1.434565, -0.8645403, 0.1098039, 0, 1, 1,
0.4935803, -0.6166895, 2.935833, 0.1176471, 0, 1, 1,
0.4963321, -0.2734686, 1.24879, 0.1215686, 0, 1, 1,
0.4979677, 0.1264623, 0.7308195, 0.1294118, 0, 1, 1,
0.5002944, 0.803009, 2.519675, 0.1333333, 0, 1, 1,
0.5044569, -1.080705, 2.671819, 0.1411765, 0, 1, 1,
0.5075244, 1.010743, -0.4777702, 0.145098, 0, 1, 1,
0.5149456, 0.2134289, 0.146496, 0.1529412, 0, 1, 1,
0.5155351, -1.611256, 1.688984, 0.1568628, 0, 1, 1,
0.5157896, -1.554021, 3.73756, 0.1647059, 0, 1, 1,
0.5158821, -0.3414184, 2.772699, 0.1686275, 0, 1, 1,
0.5164031, 1.30156, 0.08191931, 0.1764706, 0, 1, 1,
0.5205345, -2.802912, 4.100567, 0.1803922, 0, 1, 1,
0.520883, 0.7279013, -0.05774648, 0.1882353, 0, 1, 1,
0.5250839, 0.2516765, 0.7347576, 0.1921569, 0, 1, 1,
0.5251743, -0.3092349, 3.005787, 0.2, 0, 1, 1,
0.5264805, 0.02572927, 2.069684, 0.2078431, 0, 1, 1,
0.5273408, 0.868732, 0.8182901, 0.2117647, 0, 1, 1,
0.5325746, -0.750634, 2.005999, 0.2196078, 0, 1, 1,
0.5327686, 0.6760428, 0.9750284, 0.2235294, 0, 1, 1,
0.5409631, -1.643991, 3.070095, 0.2313726, 0, 1, 1,
0.5431731, -0.1206628, 2.479533, 0.2352941, 0, 1, 1,
0.5452417, -0.4687746, 3.361405, 0.2431373, 0, 1, 1,
0.5461686, -0.3510658, 2.700707, 0.2470588, 0, 1, 1,
0.5475574, 0.8564408, 0.1011705, 0.254902, 0, 1, 1,
0.5489379, 1.738562, 0.3280126, 0.2588235, 0, 1, 1,
0.5549294, 0.03559382, 2.933953, 0.2666667, 0, 1, 1,
0.5551953, 0.7528387, 0.468913, 0.2705882, 0, 1, 1,
0.5650417, 0.3130019, 2.24738, 0.2784314, 0, 1, 1,
0.5672599, -0.09122128, 3.223828, 0.282353, 0, 1, 1,
0.5686792, -0.9563359, 4.464443, 0.2901961, 0, 1, 1,
0.5706683, -0.5108019, 1.529933, 0.2941177, 0, 1, 1,
0.5772083, 1.901032, -1.037895, 0.3019608, 0, 1, 1,
0.5778415, 0.4163221, 1.941715, 0.3098039, 0, 1, 1,
0.5780647, 1.359206, -0.3640874, 0.3137255, 0, 1, 1,
0.5786042, -0.1935203, 3.660737, 0.3215686, 0, 1, 1,
0.5791581, -0.9393906, 3.752637, 0.3254902, 0, 1, 1,
0.5900185, -0.6039774, 2.314922, 0.3333333, 0, 1, 1,
0.590022, 0.6529198, 0.9896426, 0.3372549, 0, 1, 1,
0.5952613, -2.505355, 1.934078, 0.345098, 0, 1, 1,
0.5964445, 1.720381, -0.4580762, 0.3490196, 0, 1, 1,
0.5975811, 0.003142847, 0.696319, 0.3568628, 0, 1, 1,
0.6032715, -0.0737152, 0.4803377, 0.3607843, 0, 1, 1,
0.6032912, -0.02472014, -0.02682057, 0.3686275, 0, 1, 1,
0.6056728, 0.5494202, 0.09117344, 0.372549, 0, 1, 1,
0.607334, 0.8552568, 0.4847153, 0.3803922, 0, 1, 1,
0.6093621, -0.3626679, 2.193189, 0.3843137, 0, 1, 1,
0.6103504, -0.8926837, 2.662541, 0.3921569, 0, 1, 1,
0.6120215, 0.4503462, 1.368591, 0.3960784, 0, 1, 1,
0.615099, -1.759387, 1.693025, 0.4039216, 0, 1, 1,
0.6180694, 0.0391729, 1.843241, 0.4117647, 0, 1, 1,
0.6194184, -0.6886663, 2.300276, 0.4156863, 0, 1, 1,
0.6246876, 0.02726287, 0.2691766, 0.4235294, 0, 1, 1,
0.6251336, -0.9679453, 2.134783, 0.427451, 0, 1, 1,
0.6295639, 0.8106747, 1.472076, 0.4352941, 0, 1, 1,
0.6353989, 0.9468024, 0.3820326, 0.4392157, 0, 1, 1,
0.6403899, 0.412038, 0.467989, 0.4470588, 0, 1, 1,
0.6467698, 1.562106, 0.4068597, 0.4509804, 0, 1, 1,
0.6477246, -1.083447, 3.866074, 0.4588235, 0, 1, 1,
0.6479617, 1.525132, -0.2621493, 0.4627451, 0, 1, 1,
0.6485285, -0.5905802, 0.6294867, 0.4705882, 0, 1, 1,
0.6501854, 2.319036, 0.1876097, 0.4745098, 0, 1, 1,
0.6521329, 0.08468984, 2.904338, 0.4823529, 0, 1, 1,
0.652848, -0.4047084, 3.364592, 0.4862745, 0, 1, 1,
0.6606553, 0.8793997, 2.385125, 0.4941176, 0, 1, 1,
0.6717166, -0.0240637, 0.9150176, 0.5019608, 0, 1, 1,
0.6752141, -2.864271, 1.461504, 0.5058824, 0, 1, 1,
0.676384, 0.0580278, 2.630586, 0.5137255, 0, 1, 1,
0.6792029, 0.6409003, 0.6199319, 0.5176471, 0, 1, 1,
0.6834328, -0.7224262, 2.603408, 0.5254902, 0, 1, 1,
0.6860099, 0.3945004, 0.570936, 0.5294118, 0, 1, 1,
0.6887204, 0.2138871, 0.7153352, 0.5372549, 0, 1, 1,
0.6894684, 0.4763969, 1.194833, 0.5411765, 0, 1, 1,
0.691604, 0.3692362, 0.3259141, 0.5490196, 0, 1, 1,
0.6950325, -0.3732578, 1.32902, 0.5529412, 0, 1, 1,
0.6973224, 0.9004263, 0.6783479, 0.5607843, 0, 1, 1,
0.7002094, 0.5891314, -0.4522162, 0.5647059, 0, 1, 1,
0.7008209, 2.99926, -0.1684915, 0.572549, 0, 1, 1,
0.7124695, -1.761703, 2.948401, 0.5764706, 0, 1, 1,
0.7153822, 0.100354, 1.506587, 0.5843138, 0, 1, 1,
0.7156592, 0.6314006, 0.1325302, 0.5882353, 0, 1, 1,
0.7158007, 0.6917769, 0.1234803, 0.5960785, 0, 1, 1,
0.7180471, 1.10921, 0.858379, 0.6039216, 0, 1, 1,
0.7213637, 1.743451, -0.001856661, 0.6078432, 0, 1, 1,
0.7247292, 0.2008289, 1.015205, 0.6156863, 0, 1, 1,
0.7250915, -0.1988654, 3.003994, 0.6196079, 0, 1, 1,
0.7256342, -0.8946896, 2.795964, 0.627451, 0, 1, 1,
0.7268662, -0.2517464, 3.489275, 0.6313726, 0, 1, 1,
0.7281561, -1.769097, 2.352436, 0.6392157, 0, 1, 1,
0.7364175, -0.7664961, 3.803689, 0.6431373, 0, 1, 1,
0.7372413, 0.2374741, 3.148841, 0.6509804, 0, 1, 1,
0.7376915, -0.1655176, 1.599418, 0.654902, 0, 1, 1,
0.7382098, 0.704033, 0.4486925, 0.6627451, 0, 1, 1,
0.7493563, -0.6102375, 2.788672, 0.6666667, 0, 1, 1,
0.7586455, 0.5117704, 1.361477, 0.6745098, 0, 1, 1,
0.7703694, 0.08864709, 1.749025, 0.6784314, 0, 1, 1,
0.7756646, 1.132217, 1.539803, 0.6862745, 0, 1, 1,
0.7822955, -0.7056667, 3.659517, 0.6901961, 0, 1, 1,
0.7830883, 0.795204, 0.1473517, 0.6980392, 0, 1, 1,
0.7835116, -2.093154, 4.614368, 0.7058824, 0, 1, 1,
0.7866358, 0.8562269, -0.1952374, 0.7098039, 0, 1, 1,
0.7892854, 0.1788631, 1.691092, 0.7176471, 0, 1, 1,
0.7893499, -1.089778, 2.070518, 0.7215686, 0, 1, 1,
0.7927463, -0.5378188, 0.05685179, 0.7294118, 0, 1, 1,
0.7971624, -0.6480145, 2.404221, 0.7333333, 0, 1, 1,
0.8081573, -0.8263824, 1.339371, 0.7411765, 0, 1, 1,
0.8082665, -0.3623244, 2.945808, 0.7450981, 0, 1, 1,
0.8104263, 0.8039995, 1.233629, 0.7529412, 0, 1, 1,
0.8123661, -0.9769196, 3.798254, 0.7568628, 0, 1, 1,
0.8175777, 0.5678723, -0.4160593, 0.7647059, 0, 1, 1,
0.8191562, 0.4805463, 0.4476118, 0.7686275, 0, 1, 1,
0.8203008, -1.661166, 2.540077, 0.7764706, 0, 1, 1,
0.8223926, 1.496224, 0.2267162, 0.7803922, 0, 1, 1,
0.8247371, -0.9622664, 2.260119, 0.7882353, 0, 1, 1,
0.8269925, 0.3055688, 1.683191, 0.7921569, 0, 1, 1,
0.8270198, -0.1243079, 1.863618, 0.8, 0, 1, 1,
0.8304724, 0.2666373, 1.437544, 0.8078431, 0, 1, 1,
0.832541, -0.1401083, 1.166692, 0.8117647, 0, 1, 1,
0.836067, -0.6630241, 1.464152, 0.8196079, 0, 1, 1,
0.8374239, 1.217414, 0.4876076, 0.8235294, 0, 1, 1,
0.8405844, -2.339767, -0.5018303, 0.8313726, 0, 1, 1,
0.8422751, -1.185434, 1.370548, 0.8352941, 0, 1, 1,
0.844547, 0.4246041, 3.092456, 0.8431373, 0, 1, 1,
0.8530685, 0.4398711, 1.921972, 0.8470588, 0, 1, 1,
0.8548109, -0.419421, 1.669071, 0.854902, 0, 1, 1,
0.8564993, 0.3458985, 1.121263, 0.8588235, 0, 1, 1,
0.8582355, -0.4310637, 4.243725, 0.8666667, 0, 1, 1,
0.8614316, -1.845424, 2.044089, 0.8705882, 0, 1, 1,
0.8633398, -1.035074, 2.388442, 0.8784314, 0, 1, 1,
0.8784935, 0.2082236, -0.4517115, 0.8823529, 0, 1, 1,
0.8807391, 1.844304, 0.9660659, 0.8901961, 0, 1, 1,
0.8828423, 1.86188, 1.200618, 0.8941177, 0, 1, 1,
0.8862219, -1.296752, 1.82308, 0.9019608, 0, 1, 1,
0.8874409, 1.708797, -0.5615017, 0.9098039, 0, 1, 1,
0.8878303, 0.2402821, 1.757859, 0.9137255, 0, 1, 1,
0.8882069, -0.4395183, 2.284585, 0.9215686, 0, 1, 1,
0.8892034, -1.036396, 2.105699, 0.9254902, 0, 1, 1,
0.889998, -0.4516076, 4.420071, 0.9333333, 0, 1, 1,
0.9015574, -0.4157147, 0.9190958, 0.9372549, 0, 1, 1,
0.9019231, -1.007576, 4.294006, 0.945098, 0, 1, 1,
0.90268, -0.9926797, 1.979095, 0.9490196, 0, 1, 1,
0.9038869, 0.1548084, 0.1966634, 0.9568627, 0, 1, 1,
0.907835, 0.2700878, 1.615117, 0.9607843, 0, 1, 1,
0.9189554, 0.5028054, 1.398078, 0.9686275, 0, 1, 1,
0.921282, -0.1536049, 3.870753, 0.972549, 0, 1, 1,
0.921693, -1.05559, 2.721277, 0.9803922, 0, 1, 1,
0.9231154, 0.4328298, -0.5065574, 0.9843137, 0, 1, 1,
0.9235268, -0.142052, 0.8136075, 0.9921569, 0, 1, 1,
0.9258098, 0.3241699, -0.6822128, 0.9960784, 0, 1, 1,
0.9346977, -0.9456385, 2.636874, 1, 0, 0.9960784, 1,
0.9403347, 0.50811, 1.079178, 1, 0, 0.9882353, 1,
0.9416023, 0.2522789, 3.002103, 1, 0, 0.9843137, 1,
0.9505909, 0.002256282, 3.197589, 1, 0, 0.9764706, 1,
0.9688593, 0.8915881, -0.3614531, 1, 0, 0.972549, 1,
0.9761544, 0.9432279, 0.1748396, 1, 0, 0.9647059, 1,
0.9771144, -1.288297, 1.737266, 1, 0, 0.9607843, 1,
0.9820295, 0.530054, 0.3518532, 1, 0, 0.9529412, 1,
0.982085, -0.8565224, 1.881695, 1, 0, 0.9490196, 1,
0.9827462, 0.5038989, 2.819518, 1, 0, 0.9411765, 1,
0.9834813, 0.2659476, 1.339403, 1, 0, 0.9372549, 1,
0.9911045, -0.8952208, 2.331759, 1, 0, 0.9294118, 1,
0.9937314, -0.8778471, 0.5209955, 1, 0, 0.9254902, 1,
0.9958043, -0.1536292, 2.149985, 1, 0, 0.9176471, 1,
0.9964221, 0.8257907, 2.511007, 1, 0, 0.9137255, 1,
0.9997287, 1.559987, -0.282652, 1, 0, 0.9058824, 1,
1.000051, 2.076208, 0.09802561, 1, 0, 0.9019608, 1,
1.004644, -0.899865, 2.676368, 1, 0, 0.8941177, 1,
1.005175, -0.5557548, 1.493657, 1, 0, 0.8862745, 1,
1.006435, -0.2071382, 1.02608, 1, 0, 0.8823529, 1,
1.007698, 0.930034, -0.5170356, 1, 0, 0.8745098, 1,
1.012196, -1.661267, 2.321012, 1, 0, 0.8705882, 1,
1.017869, 0.3833049, 3.480081, 1, 0, 0.8627451, 1,
1.024282, -0.4588276, 2.059335, 1, 0, 0.8588235, 1,
1.026341, 2.297164, -2.419209, 1, 0, 0.8509804, 1,
1.026804, -0.01389272, -0.4614153, 1, 0, 0.8470588, 1,
1.038741, 0.3178708, 1.295223, 1, 0, 0.8392157, 1,
1.044553, -1.143498, 2.918579, 1, 0, 0.8352941, 1,
1.047626, 0.4222856, -0.2178555, 1, 0, 0.827451, 1,
1.052027, -0.6758006, 2.242744, 1, 0, 0.8235294, 1,
1.05567, -0.4808498, 1.637337, 1, 0, 0.8156863, 1,
1.06523, 1.689428, 0.1457176, 1, 0, 0.8117647, 1,
1.075487, 1.595516, 1.118787, 1, 0, 0.8039216, 1,
1.076354, -0.03042545, 2.056734, 1, 0, 0.7960784, 1,
1.081018, 1.038668, 1.158212, 1, 0, 0.7921569, 1,
1.081955, -1.306419, 3.289366, 1, 0, 0.7843137, 1,
1.091492, -1.536766, 3.720595, 1, 0, 0.7803922, 1,
1.097247, 0.7269052, 2.096409, 1, 0, 0.772549, 1,
1.104555, 0.988498, 0.2528508, 1, 0, 0.7686275, 1,
1.110155, 0.2974472, 1.822606, 1, 0, 0.7607843, 1,
1.112892, 0.3579282, 1.501602, 1, 0, 0.7568628, 1,
1.113356, -0.6506882, 0.3991746, 1, 0, 0.7490196, 1,
1.115918, -1.536085, 2.369772, 1, 0, 0.7450981, 1,
1.117054, -0.04608491, 2.37359, 1, 0, 0.7372549, 1,
1.119294, 1.329663, 1.980447, 1, 0, 0.7333333, 1,
1.123899, 1.560274, 0.1090184, 1, 0, 0.7254902, 1,
1.124032, -0.1772537, 1.149827, 1, 0, 0.7215686, 1,
1.131106, 1.117234, 1.452066, 1, 0, 0.7137255, 1,
1.137662, -1.759088, 3.287081, 1, 0, 0.7098039, 1,
1.140781, 0.2757604, 2.201515, 1, 0, 0.7019608, 1,
1.146032, 0.008196456, 1.26562, 1, 0, 0.6941177, 1,
1.146158, -0.7099771, 1.822922, 1, 0, 0.6901961, 1,
1.156582, -0.4748865, 2.573388, 1, 0, 0.682353, 1,
1.157969, 0.8083671, 2.331244, 1, 0, 0.6784314, 1,
1.160683, 0.1725707, 3.494, 1, 0, 0.6705883, 1,
1.160947, 1.579914, -1.068969, 1, 0, 0.6666667, 1,
1.16994, -1.334131, 1.962932, 1, 0, 0.6588235, 1,
1.173397, -0.1708891, 2.207499, 1, 0, 0.654902, 1,
1.191887, -1.466144, 2.981521, 1, 0, 0.6470588, 1,
1.197782, 0.9675761, 0.6869999, 1, 0, 0.6431373, 1,
1.215621, -1.52081, 2.892314, 1, 0, 0.6352941, 1,
1.23094, 0.9457151, -0.1217663, 1, 0, 0.6313726, 1,
1.233625, 0.2334412, 2.333342, 1, 0, 0.6235294, 1,
1.271318, -1.265197, 2.685547, 1, 0, 0.6196079, 1,
1.274913, 0.8883138, 1.697372, 1, 0, 0.6117647, 1,
1.275481, -2.859165, 3.330659, 1, 0, 0.6078432, 1,
1.277615, 2.438802, 0.7092613, 1, 0, 0.6, 1,
1.285714, -0.6358534, 1.880176, 1, 0, 0.5921569, 1,
1.285818, 1.186692, 0.5968702, 1, 0, 0.5882353, 1,
1.288322, 0.3322325, 1.781471, 1, 0, 0.5803922, 1,
1.291189, -0.4472001, 0.9798657, 1, 0, 0.5764706, 1,
1.292097, -0.708539, 1.661361, 1, 0, 0.5686275, 1,
1.329091, 1.363859, 1.149234, 1, 0, 0.5647059, 1,
1.329143, -2.056952, 3.896239, 1, 0, 0.5568628, 1,
1.334783, 0.1822403, 2.062233, 1, 0, 0.5529412, 1,
1.336723, -0.8439188, 2.812365, 1, 0, 0.5450981, 1,
1.339374, -0.1913844, 2.499013, 1, 0, 0.5411765, 1,
1.345503, 2.151484, 1.294934, 1, 0, 0.5333334, 1,
1.357252, 0.1946407, 0.8477736, 1, 0, 0.5294118, 1,
1.359903, 0.06652659, 1.69079, 1, 0, 0.5215687, 1,
1.360523, 0.3395382, 2.647352, 1, 0, 0.5176471, 1,
1.368146, 1.542283, 1.156368, 1, 0, 0.509804, 1,
1.370053, -1.041177, 2.882505, 1, 0, 0.5058824, 1,
1.374297, 0.2209483, 0.8544056, 1, 0, 0.4980392, 1,
1.391619, 0.3992971, -0.9835525, 1, 0, 0.4901961, 1,
1.400146, 0.3360331, 1.290478, 1, 0, 0.4862745, 1,
1.400185, -1.912928, 2.516588, 1, 0, 0.4784314, 1,
1.40577, 1.237548, 1.527745, 1, 0, 0.4745098, 1,
1.409123, -0.8362299, 1.33174, 1, 0, 0.4666667, 1,
1.409294, -0.7375647, 2.401862, 1, 0, 0.4627451, 1,
1.413573, -1.418687, 2.516176, 1, 0, 0.454902, 1,
1.415264, -1.795689, 1.259088, 1, 0, 0.4509804, 1,
1.424191, 1.747572, -0.01405343, 1, 0, 0.4431373, 1,
1.424222, 2.092344, 1.057238, 1, 0, 0.4392157, 1,
1.426897, -0.4906453, 3.31777, 1, 0, 0.4313726, 1,
1.442216, -0.8340988, 2.855045, 1, 0, 0.427451, 1,
1.442249, 0.1663349, 1.529756, 1, 0, 0.4196078, 1,
1.447027, -0.5611207, 0.9047544, 1, 0, 0.4156863, 1,
1.45987, 0.1468078, 2.004193, 1, 0, 0.4078431, 1,
1.470628, -0.2590003, 2.027044, 1, 0, 0.4039216, 1,
1.475448, 1.144704, 1.934028, 1, 0, 0.3960784, 1,
1.485466, 0.9864839, 2.848556, 1, 0, 0.3882353, 1,
1.489501, 0.02061275, 1.130447, 1, 0, 0.3843137, 1,
1.491275, 0.8996866, 1.096904, 1, 0, 0.3764706, 1,
1.491499, -0.4436868, 2.69515, 1, 0, 0.372549, 1,
1.5006, 2.041698, 1.026091, 1, 0, 0.3647059, 1,
1.511483, 0.9231247, -0.6072107, 1, 0, 0.3607843, 1,
1.518256, -0.8731735, 0.8794267, 1, 0, 0.3529412, 1,
1.523494, 0.8361655, 2.147125, 1, 0, 0.3490196, 1,
1.531539, 0.5425819, 1.447825, 1, 0, 0.3411765, 1,
1.535724, 0.2298066, 1.253383, 1, 0, 0.3372549, 1,
1.55609, 0.6365938, 3.68618, 1, 0, 0.3294118, 1,
1.560204, 1.20195, 1.796828, 1, 0, 0.3254902, 1,
1.569204, -0.231326, 2.957667, 1, 0, 0.3176471, 1,
1.575536, -0.6235647, 2.631053, 1, 0, 0.3137255, 1,
1.580576, 0.1940259, 1.233728, 1, 0, 0.3058824, 1,
1.589951, 0.445724, 1.980263, 1, 0, 0.2980392, 1,
1.601189, 1.775568, 1.246426, 1, 0, 0.2941177, 1,
1.607981, 1.328747, 2.134552, 1, 0, 0.2862745, 1,
1.676381, -0.7273941, 3.464051, 1, 0, 0.282353, 1,
1.688667, 0.800992, -0.3512334, 1, 0, 0.2745098, 1,
1.710835, 1.284179, 0.1935406, 1, 0, 0.2705882, 1,
1.713073, 1.446898, 1.699131, 1, 0, 0.2627451, 1,
1.713752, 0.3273164, -0.009715395, 1, 0, 0.2588235, 1,
1.730572, -0.761582, 4.147723, 1, 0, 0.2509804, 1,
1.732029, 0.6834878, 1.306649, 1, 0, 0.2470588, 1,
1.741681, 0.3553044, 1.586476, 1, 0, 0.2392157, 1,
1.746514, 2.021459, 0.8860877, 1, 0, 0.2352941, 1,
1.779318, -0.9896252, 3.409868, 1, 0, 0.227451, 1,
1.780878, -0.1329009, 2.568693, 1, 0, 0.2235294, 1,
1.784899, -1.224228, 2.272182, 1, 0, 0.2156863, 1,
1.786989, 0.6070925, -1.194674, 1, 0, 0.2117647, 1,
1.796289, 1.470799, -0.2600303, 1, 0, 0.2039216, 1,
1.819846, 1.102239, 1.632472, 1, 0, 0.1960784, 1,
1.844049, 0.09139273, 1.774298, 1, 0, 0.1921569, 1,
1.909285, -1.227469, 3.719772, 1, 0, 0.1843137, 1,
1.924819, -2.022174, 3.977168, 1, 0, 0.1803922, 1,
1.954626, 0.4557602, -1.329355, 1, 0, 0.172549, 1,
1.980934, -0.7888631, 0.92755, 1, 0, 0.1686275, 1,
1.993262, 0.4515913, 1.722927, 1, 0, 0.1607843, 1,
1.998905, 0.0716678, 1.313766, 1, 0, 0.1568628, 1,
1.999846, 0.682506, 2.641227, 1, 0, 0.1490196, 1,
2.010848, -0.6071452, 0.2676016, 1, 0, 0.145098, 1,
2.0144, -0.2800798, 2.20098, 1, 0, 0.1372549, 1,
2.022757, -0.4521651, 1.869536, 1, 0, 0.1333333, 1,
2.025718, -0.3909229, 1.667687, 1, 0, 0.1254902, 1,
2.038105, -0.2416769, 1.716388, 1, 0, 0.1215686, 1,
2.06906, 0.4111779, 0.7996062, 1, 0, 0.1137255, 1,
2.083818, 0.62945, 1.850726, 1, 0, 0.1098039, 1,
2.121069, -0.5518878, 2.495789, 1, 0, 0.1019608, 1,
2.125644, 1.426016, 0.1485724, 1, 0, 0.09411765, 1,
2.16208, 1.942033, 0.8425237, 1, 0, 0.09019608, 1,
2.172039, -0.3103814, 1.78195, 1, 0, 0.08235294, 1,
2.230885, 0.7785082, 1.076902, 1, 0, 0.07843138, 1,
2.233549, -0.389746, 2.043965, 1, 0, 0.07058824, 1,
2.266021, 1.559327, -0.1717242, 1, 0, 0.06666667, 1,
2.421647, 0.5423049, 2.374853, 1, 0, 0.05882353, 1,
2.463013, -0.9113089, 2.300652, 1, 0, 0.05490196, 1,
2.468396, -0.2553005, 0.8810735, 1, 0, 0.04705882, 1,
2.549732, 0.06978846, 2.071791, 1, 0, 0.04313726, 1,
2.564811, -0.1872804, 1.955435, 1, 0, 0.03529412, 1,
2.609886, 0.1106471, 1.65682, 1, 0, 0.03137255, 1,
2.644748, 0.4234081, 0.7945935, 1, 0, 0.02352941, 1,
2.657939, 0.2225279, 2.152184, 1, 0, 0.01960784, 1,
2.681558, 0.1045874, 1.444911, 1, 0, 0.01176471, 1,
3.166119, 0.7241855, 0.414967, 1, 0, 0.007843138, 1
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
0.02555275, -3.996665, -7.763456, 0, -0.5, 0.5, 0.5,
0.02555275, -3.996665, -7.763456, 1, -0.5, 0.5, 0.5,
0.02555275, -3.996665, -7.763456, 1, 1.5, 0.5, 0.5,
0.02555275, -3.996665, -7.763456, 0, 1.5, 0.5, 0.5
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
-4.179665, 0.008270144, -7.763456, 0, -0.5, 0.5, 0.5,
-4.179665, 0.008270144, -7.763456, 1, -0.5, 0.5, 0.5,
-4.179665, 0.008270144, -7.763456, 1, 1.5, 0.5, 0.5,
-4.179665, 0.008270144, -7.763456, 0, 1.5, 0.5, 0.5
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
-4.179665, -3.996665, -0.5801725, 0, -0.5, 0.5, 0.5,
-4.179665, -3.996665, -0.5801725, 1, -0.5, 0.5, 0.5,
-4.179665, -3.996665, -0.5801725, 1, 1.5, 0.5, 0.5,
-4.179665, -3.996665, -0.5801725, 0, 1.5, 0.5, 0.5
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
-3, -3.07245, -6.105775,
3, -3.07245, -6.105775,
-3, -3.07245, -6.105775,
-3, -3.226485, -6.382056,
-2, -3.07245, -6.105775,
-2, -3.226485, -6.382056,
-1, -3.07245, -6.105775,
-1, -3.226485, -6.382056,
0, -3.07245, -6.105775,
0, -3.226485, -6.382056,
1, -3.07245, -6.105775,
1, -3.226485, -6.382056,
2, -3.07245, -6.105775,
2, -3.226485, -6.382056,
3, -3.07245, -6.105775,
3, -3.226485, -6.382056
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
-3, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
-3, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
-3, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
-3, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5,
-2, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
-2, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
-2, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
-2, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5,
-1, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
-1, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
-1, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
-1, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5,
0, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
0, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
0, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
0, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5,
1, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
1, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
1, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
1, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5,
2, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
2, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
2, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
2, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5,
3, -3.534558, -6.934616, 0, -0.5, 0.5, 0.5,
3, -3.534558, -6.934616, 1, -0.5, 0.5, 0.5,
3, -3.534558, -6.934616, 1, 1.5, 0.5, 0.5,
3, -3.534558, -6.934616, 0, 1.5, 0.5, 0.5
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
-3.20923, -2, -6.105775,
-3.20923, 2, -6.105775,
-3.20923, -2, -6.105775,
-3.37097, -2, -6.382056,
-3.20923, -1, -6.105775,
-3.37097, -1, -6.382056,
-3.20923, 0, -6.105775,
-3.37097, 0, -6.382056,
-3.20923, 1, -6.105775,
-3.37097, 1, -6.382056,
-3.20923, 2, -6.105775,
-3.37097, 2, -6.382056
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
-3.694448, -2, -6.934616, 0, -0.5, 0.5, 0.5,
-3.694448, -2, -6.934616, 1, -0.5, 0.5, 0.5,
-3.694448, -2, -6.934616, 1, 1.5, 0.5, 0.5,
-3.694448, -2, -6.934616, 0, 1.5, 0.5, 0.5,
-3.694448, -1, -6.934616, 0, -0.5, 0.5, 0.5,
-3.694448, -1, -6.934616, 1, -0.5, 0.5, 0.5,
-3.694448, -1, -6.934616, 1, 1.5, 0.5, 0.5,
-3.694448, -1, -6.934616, 0, 1.5, 0.5, 0.5,
-3.694448, 0, -6.934616, 0, -0.5, 0.5, 0.5,
-3.694448, 0, -6.934616, 1, -0.5, 0.5, 0.5,
-3.694448, 0, -6.934616, 1, 1.5, 0.5, 0.5,
-3.694448, 0, -6.934616, 0, 1.5, 0.5, 0.5,
-3.694448, 1, -6.934616, 0, -0.5, 0.5, 0.5,
-3.694448, 1, -6.934616, 1, -0.5, 0.5, 0.5,
-3.694448, 1, -6.934616, 1, 1.5, 0.5, 0.5,
-3.694448, 1, -6.934616, 0, 1.5, 0.5, 0.5,
-3.694448, 2, -6.934616, 0, -0.5, 0.5, 0.5,
-3.694448, 2, -6.934616, 1, -0.5, 0.5, 0.5,
-3.694448, 2, -6.934616, 1, 1.5, 0.5, 0.5,
-3.694448, 2, -6.934616, 0, 1.5, 0.5, 0.5
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
-3.20923, -3.07245, -4,
-3.20923, -3.07245, 4,
-3.20923, -3.07245, -4,
-3.37097, -3.226485, -4,
-3.20923, -3.07245, -2,
-3.37097, -3.226485, -2,
-3.20923, -3.07245, 0,
-3.37097, -3.226485, 0,
-3.20923, -3.07245, 2,
-3.37097, -3.226485, 2,
-3.20923, -3.07245, 4,
-3.37097, -3.226485, 4
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
-3.694448, -3.534558, -4, 0, -0.5, 0.5, 0.5,
-3.694448, -3.534558, -4, 1, -0.5, 0.5, 0.5,
-3.694448, -3.534558, -4, 1, 1.5, 0.5, 0.5,
-3.694448, -3.534558, -4, 0, 1.5, 0.5, 0.5,
-3.694448, -3.534558, -2, 0, -0.5, 0.5, 0.5,
-3.694448, -3.534558, -2, 1, -0.5, 0.5, 0.5,
-3.694448, -3.534558, -2, 1, 1.5, 0.5, 0.5,
-3.694448, -3.534558, -2, 0, 1.5, 0.5, 0.5,
-3.694448, -3.534558, 0, 0, -0.5, 0.5, 0.5,
-3.694448, -3.534558, 0, 1, -0.5, 0.5, 0.5,
-3.694448, -3.534558, 0, 1, 1.5, 0.5, 0.5,
-3.694448, -3.534558, 0, 0, 1.5, 0.5, 0.5,
-3.694448, -3.534558, 2, 0, -0.5, 0.5, 0.5,
-3.694448, -3.534558, 2, 1, -0.5, 0.5, 0.5,
-3.694448, -3.534558, 2, 1, 1.5, 0.5, 0.5,
-3.694448, -3.534558, 2, 0, 1.5, 0.5, 0.5,
-3.694448, -3.534558, 4, 0, -0.5, 0.5, 0.5,
-3.694448, -3.534558, 4, 1, -0.5, 0.5, 0.5,
-3.694448, -3.534558, 4, 1, 1.5, 0.5, 0.5,
-3.694448, -3.534558, 4, 0, 1.5, 0.5, 0.5
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
-3.20923, -3.07245, -6.105775,
-3.20923, 3.08899, -6.105775,
-3.20923, -3.07245, 4.94543,
-3.20923, 3.08899, 4.94543,
-3.20923, -3.07245, -6.105775,
-3.20923, -3.07245, 4.94543,
-3.20923, 3.08899, -6.105775,
-3.20923, 3.08899, 4.94543,
-3.20923, -3.07245, -6.105775,
3.260336, -3.07245, -6.105775,
-3.20923, -3.07245, 4.94543,
3.260336, -3.07245, 4.94543,
-3.20923, 3.08899, -6.105775,
3.260336, 3.08899, -6.105775,
-3.20923, 3.08899, 4.94543,
3.260336, 3.08899, 4.94543,
3.260336, -3.07245, -6.105775,
3.260336, 3.08899, -6.105775,
3.260336, -3.07245, 4.94543,
3.260336, 3.08899, 4.94543,
3.260336, -3.07245, -6.105775,
3.260336, -3.07245, 4.94543,
3.260336, 3.08899, -6.105775,
3.260336, 3.08899, 4.94543
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
var radius = 7.588309;
var distance = 33.76125;
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
mvMatrix.translate( -0.02555275, -0.008270144, 0.5801725 );
mvMatrix.scale( 1.268188, 1.331609, 0.7424192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76125);
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
indanofan<-read.table("indanofan.xyz")
```

```
## Error in read.table("indanofan.xyz"): no lines available in input
```

```r
x<-indanofan$V2
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
```

```r
y<-indanofan$V3
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
```

```r
z<-indanofan$V4
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
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
-3.115013, 0.5413172, -2.777477, 0, 0, 1, 1, 1,
-2.795582, 0.3633642, -4.529805, 1, 0, 0, 1, 1,
-2.73071, 2.383727, -2.014573, 1, 0, 0, 1, 1,
-2.623006, 0.7740409, -2.117054, 1, 0, 0, 1, 1,
-2.571646, -0.1233819, -0.4100111, 1, 0, 0, 1, 1,
-2.343112, -0.1900569, -1.221151, 1, 0, 0, 1, 1,
-2.272264, 1.392036, -2.03706, 0, 0, 0, 1, 1,
-2.146084, -0.1114792, -0.770419, 0, 0, 0, 1, 1,
-2.113718, -1.132789, -1.555077, 0, 0, 0, 1, 1,
-2.066088, -0.1652211, -0.4507884, 0, 0, 0, 1, 1,
-2.019506, -0.2339413, -1.515464, 0, 0, 0, 1, 1,
-2.008979, -0.07513966, -0.8635666, 0, 0, 0, 1, 1,
-1.964486, 0.7709641, -1.468058, 0, 0, 0, 1, 1,
-1.923237, -0.01425784, -0.6866631, 1, 1, 1, 1, 1,
-1.905921, 0.0943552, -3.396282, 1, 1, 1, 1, 1,
-1.899696, -0.7024176, -1.723043, 1, 1, 1, 1, 1,
-1.897613, -0.5789882, -3.537801, 1, 1, 1, 1, 1,
-1.886097, 1.640217, -1.188655, 1, 1, 1, 1, 1,
-1.877972, 1.002194, -1.974766, 1, 1, 1, 1, 1,
-1.874756, 0.9620224, -1.472712, 1, 1, 1, 1, 1,
-1.874681, -1.488575, -1.70697, 1, 1, 1, 1, 1,
-1.869082, 1.040798, 0.5628887, 1, 1, 1, 1, 1,
-1.855252, -0.2264768, -0.4189796, 1, 1, 1, 1, 1,
-1.843025, 0.02082799, -1.221716, 1, 1, 1, 1, 1,
-1.820735, 0.493024, -1.50604, 1, 1, 1, 1, 1,
-1.811907, 1.353848, 0.3983597, 1, 1, 1, 1, 1,
-1.811683, 0.1491045, -2.227746, 1, 1, 1, 1, 1,
-1.794199, 0.5165519, -1.524953, 1, 1, 1, 1, 1,
-1.789727, -0.4877574, -2.667935, 0, 0, 1, 1, 1,
-1.7764, -0.2848947, 0.6337082, 1, 0, 0, 1, 1,
-1.766244, -0.8569617, -1.381219, 1, 0, 0, 1, 1,
-1.760063, 0.2330416, -2.272794, 1, 0, 0, 1, 1,
-1.751968, -1.078883, -1.467112, 1, 0, 0, 1, 1,
-1.751911, -0.105011, -0.7697586, 1, 0, 0, 1, 1,
-1.69501, 1.168675, -1.672404, 0, 0, 0, 1, 1,
-1.691009, -1.693208, -0.0226275, 0, 0, 0, 1, 1,
-1.685366, 0.5255528, -1.890897, 0, 0, 0, 1, 1,
-1.666501, 0.2107608, 0.1888274, 0, 0, 0, 1, 1,
-1.653898, 0.04406138, -3.1594, 0, 0, 0, 1, 1,
-1.610901, 0.000188209, -1.913433, 0, 0, 0, 1, 1,
-1.602756, -0.002549264, -2.184317, 0, 0, 0, 1, 1,
-1.599804, 0.268079, -3.821177, 1, 1, 1, 1, 1,
-1.598713, 2.549123, -0.1851497, 1, 1, 1, 1, 1,
-1.59128, 0.3470438, -2.261983, 1, 1, 1, 1, 1,
-1.589899, 1.17173, -0.904965, 1, 1, 1, 1, 1,
-1.588574, -0.3053662, -2.762685, 1, 1, 1, 1, 1,
-1.586076, -0.986358, -1.19166, 1, 1, 1, 1, 1,
-1.581796, -0.9268209, -1.443492, 1, 1, 1, 1, 1,
-1.572132, 0.007513769, -0.8619099, 1, 1, 1, 1, 1,
-1.567565, 1.653754, 1.011777, 1, 1, 1, 1, 1,
-1.54922, -0.3575289, -1.659684, 1, 1, 1, 1, 1,
-1.541142, 0.1356292, -0.8509052, 1, 1, 1, 1, 1,
-1.531341, 0.5919035, -1.766428, 1, 1, 1, 1, 1,
-1.52065, 1.465175, -2.316369, 1, 1, 1, 1, 1,
-1.512392, -0.2480479, -1.416113, 1, 1, 1, 1, 1,
-1.509725, -0.2423163, -3.200446, 1, 1, 1, 1, 1,
-1.50778, -0.009866996, -2.342684, 0, 0, 1, 1, 1,
-1.503507, 1.612119, -1.275608, 1, 0, 0, 1, 1,
-1.502335, -0.7964092, -0.6612192, 1, 0, 0, 1, 1,
-1.500176, 0.337202, -2.049294, 1, 0, 0, 1, 1,
-1.491743, -0.7371525, -0.7447783, 1, 0, 0, 1, 1,
-1.489949, -0.8299531, -2.458694, 1, 0, 0, 1, 1,
-1.483483, -1.737736, -1.639021, 0, 0, 0, 1, 1,
-1.47416, -0.9045537, -4.324687, 0, 0, 0, 1, 1,
-1.473121, 0.9673347, -0.702441, 0, 0, 0, 1, 1,
-1.472176, -0.2846455, -1.862576, 0, 0, 0, 1, 1,
-1.470067, -0.234563, -1.72359, 0, 0, 0, 1, 1,
-1.468475, -0.825038, -3.189385, 0, 0, 0, 1, 1,
-1.468379, 0.01272863, -1.980525, 0, 0, 0, 1, 1,
-1.455365, 0.7108932, -1.209247, 1, 1, 1, 1, 1,
-1.441066, -1.001169, -3.293351, 1, 1, 1, 1, 1,
-1.439889, 0.2319459, -2.85119, 1, 1, 1, 1, 1,
-1.427259, -0.07904577, 0.6735372, 1, 1, 1, 1, 1,
-1.427122, -0.4569622, -2.606398, 1, 1, 1, 1, 1,
-1.419475, 0.771933, 0.02948081, 1, 1, 1, 1, 1,
-1.417203, -0.01111105, -1.810032, 1, 1, 1, 1, 1,
-1.407881, 0.1017819, -1.736855, 1, 1, 1, 1, 1,
-1.397504, -1.74965, -1.905346, 1, 1, 1, 1, 1,
-1.396969, 1.898887, 0.197092, 1, 1, 1, 1, 1,
-1.379559, -0.04812356, -0.8239604, 1, 1, 1, 1, 1,
-1.373539, 0.5866785, -1.456232, 1, 1, 1, 1, 1,
-1.366507, -0.5566041, -3.484778, 1, 1, 1, 1, 1,
-1.362231, 0.1831548, -1.826687, 1, 1, 1, 1, 1,
-1.358595, 0.09627265, -2.656096, 1, 1, 1, 1, 1,
-1.342472, 0.1453246, -0.711692, 0, 0, 1, 1, 1,
-1.342356, 0.3678808, 0.4267422, 1, 0, 0, 1, 1,
-1.335724, 0.2495293, -1.813489, 1, 0, 0, 1, 1,
-1.329591, -1.43508, -1.007304, 1, 0, 0, 1, 1,
-1.300133, 0.3071877, -2.555601, 1, 0, 0, 1, 1,
-1.296731, -0.6322715, 1.356742, 1, 0, 0, 1, 1,
-1.296347, -0.8589976, -1.220651, 0, 0, 0, 1, 1,
-1.288974, -0.9990779, -1.113037, 0, 0, 0, 1, 1,
-1.288917, -1.284442, -1.741598, 0, 0, 0, 1, 1,
-1.283908, 0.113037, -1.501689, 0, 0, 0, 1, 1,
-1.28254, -0.4490565, -0.3580055, 0, 0, 0, 1, 1,
-1.275825, -1.065297, -0.04398752, 0, 0, 0, 1, 1,
-1.268874, 0.548078, -0.6009822, 0, 0, 0, 1, 1,
-1.264835, 2.515192, -0.9874929, 1, 1, 1, 1, 1,
-1.247684, -1.407582, -2.308189, 1, 1, 1, 1, 1,
-1.233075, 1.727612, -0.3728727, 1, 1, 1, 1, 1,
-1.225648, -1.656886, -1.824445, 1, 1, 1, 1, 1,
-1.221184, 0.3161553, -2.50598, 1, 1, 1, 1, 1,
-1.207954, -0.5235554, -0.9165755, 1, 1, 1, 1, 1,
-1.205734, 1.718381, 0.7799035, 1, 1, 1, 1, 1,
-1.188561, -1.038363, -1.677485, 1, 1, 1, 1, 1,
-1.186165, 1.475836, -3.202052, 1, 1, 1, 1, 1,
-1.184548, -1.023498, -1.690348, 1, 1, 1, 1, 1,
-1.170798, 0.2962462, -0.06603941, 1, 1, 1, 1, 1,
-1.163645, 1.439144, 0.3020277, 1, 1, 1, 1, 1,
-1.15468, -0.633294, -0.8476968, 1, 1, 1, 1, 1,
-1.147614, -0.4676851, -2.13983, 1, 1, 1, 1, 1,
-1.143167, -1.278308, -3.626858, 1, 1, 1, 1, 1,
-1.133869, -2.110087, -1.805078, 0, 0, 1, 1, 1,
-1.131939, 0.5840073, -0.4597998, 1, 0, 0, 1, 1,
-1.122932, -0.124015, -1.257279, 1, 0, 0, 1, 1,
-1.11398, 0.3017194, -0.5570313, 1, 0, 0, 1, 1,
-1.109925, -0.1475041, -0.9046596, 1, 0, 0, 1, 1,
-1.108923, 0.7951719, -0.4268371, 1, 0, 0, 1, 1,
-1.108276, 0.827987, -0.1482026, 0, 0, 0, 1, 1,
-1.107771, -0.1731072, -1.497856, 0, 0, 0, 1, 1,
-1.105091, -1.039571, -2.608227, 0, 0, 0, 1, 1,
-1.103923, 1.341066, 0.4399778, 0, 0, 0, 1, 1,
-1.102033, -0.8148031, -2.420015, 0, 0, 0, 1, 1,
-1.099789, 0.109223, -2.061404, 0, 0, 0, 1, 1,
-1.097271, -0.4722507, -2.709715, 0, 0, 0, 1, 1,
-1.09041, -1.025477, -1.225404, 1, 1, 1, 1, 1,
-1.089555, -1.837977, -3.13407, 1, 1, 1, 1, 1,
-1.087563, -0.4919201, -2.616916, 1, 1, 1, 1, 1,
-1.08662, -0.7993468, -1.683404, 1, 1, 1, 1, 1,
-1.086338, -0.9525239, -2.840566, 1, 1, 1, 1, 1,
-1.085786, 1.111541, -1.123066, 1, 1, 1, 1, 1,
-1.080684, -0.6348768, -1.665077, 1, 1, 1, 1, 1,
-1.079703, -0.9995123, -2.635334, 1, 1, 1, 1, 1,
-1.071082, 1.588751, 1.372152, 1, 1, 1, 1, 1,
-1.068552, 0.9333919, -0.9017548, 1, 1, 1, 1, 1,
-1.068474, 0.238937, -2.297687, 1, 1, 1, 1, 1,
-1.065765, -0.3202161, -1.368921, 1, 1, 1, 1, 1,
-1.063699, -1.316432, -2.445837, 1, 1, 1, 1, 1,
-1.059872, 1.011495, -0.4898562, 1, 1, 1, 1, 1,
-1.047105, -0.2785436, -1.372471, 1, 1, 1, 1, 1,
-1.04583, -0.6546879, -1.312393, 0, 0, 1, 1, 1,
-1.044381, -1.417978, -1.74946, 1, 0, 0, 1, 1,
-1.038845, 0.1552384, -2.751059, 1, 0, 0, 1, 1,
-1.03749, 1.38276, -1.962624, 1, 0, 0, 1, 1,
-1.033639, 2.022938, -0.6675276, 1, 0, 0, 1, 1,
-1.032777, -1.000264, -4.059967, 1, 0, 0, 1, 1,
-1.027874, 0.7903014, -1.433597, 0, 0, 0, 1, 1,
-1.021909, -1.009718, -1.81717, 0, 0, 0, 1, 1,
-1.012546, -1.03557, -2.642515, 0, 0, 0, 1, 1,
-1.004171, -1.389855, -1.344575, 0, 0, 0, 1, 1,
-1.000036, 0.6118827, -1.712621, 0, 0, 0, 1, 1,
-0.99906, 0.2499096, -0.5006799, 0, 0, 0, 1, 1,
-0.9949384, -1.899832, -3.482066, 0, 0, 0, 1, 1,
-0.9885359, -0.7660001, -3.10315, 1, 1, 1, 1, 1,
-0.984218, 0.7770686, -0.5899422, 1, 1, 1, 1, 1,
-0.9733503, 0.04687249, -2.11985, 1, 1, 1, 1, 1,
-0.9726506, -1.48626, -1.457624, 1, 1, 1, 1, 1,
-0.9721411, -0.2570572, -1.255268, 1, 1, 1, 1, 1,
-0.9639258, -0.01703242, -1.687807, 1, 1, 1, 1, 1,
-0.9514676, -0.8905476, -1.325333, 1, 1, 1, 1, 1,
-0.9482543, -0.7246283, -1.693655, 1, 1, 1, 1, 1,
-0.9446975, -0.4529464, -1.437766, 1, 1, 1, 1, 1,
-0.9433656, -2.344974, -2.077538, 1, 1, 1, 1, 1,
-0.9140639, -0.05580207, -3.679341, 1, 1, 1, 1, 1,
-0.9137361, 1.119769, -0.3791051, 1, 1, 1, 1, 1,
-0.9134192, 1.176558, 0.6774791, 1, 1, 1, 1, 1,
-0.9106314, -0.267585, -1.366929, 1, 1, 1, 1, 1,
-0.9063897, -1.276184, -2.253712, 1, 1, 1, 1, 1,
-0.9041008, -1.365999, -1.805186, 0, 0, 1, 1, 1,
-0.8998086, -1.024561, -2.812928, 1, 0, 0, 1, 1,
-0.8991842, 2.52363, 0.7792529, 1, 0, 0, 1, 1,
-0.8934212, 0.5254095, -2.353893, 1, 0, 0, 1, 1,
-0.8926306, -0.2384261, -1.358021, 1, 0, 0, 1, 1,
-0.890461, 1.21358, -0.9442145, 1, 0, 0, 1, 1,
-0.8901332, 0.8412578, 0.6484545, 0, 0, 0, 1, 1,
-0.8884202, 0.9595586, -1.511968, 0, 0, 0, 1, 1,
-0.884654, 0.8712497, -0.7273065, 0, 0, 0, 1, 1,
-0.8834046, 0.6336521, -1.866736, 0, 0, 0, 1, 1,
-0.8772838, -0.9489775, -1.072397, 0, 0, 0, 1, 1,
-0.8732431, 0.05613285, -1.384746, 0, 0, 0, 1, 1,
-0.8634934, 0.5777802, -0.1362054, 0, 0, 0, 1, 1,
-0.8630362, 0.8265326, -2.040976, 1, 1, 1, 1, 1,
-0.8540199, 1.811717, 0.1490975, 1, 1, 1, 1, 1,
-0.8432808, 0.5723169, -1.138939, 1, 1, 1, 1, 1,
-0.8432148, -0.7785195, -0.6458941, 1, 1, 1, 1, 1,
-0.8370422, 0.005962307, -0.5886153, 1, 1, 1, 1, 1,
-0.831048, 0.1937926, -0.2493971, 1, 1, 1, 1, 1,
-0.8298844, 0.5731824, 0.02952579, 1, 1, 1, 1, 1,
-0.8288582, 0.001578744, -0.2666095, 1, 1, 1, 1, 1,
-0.8275333, 0.7497824, -0.7784844, 1, 1, 1, 1, 1,
-0.8266225, 0.04538222, -1.833381, 1, 1, 1, 1, 1,
-0.8190686, 0.9427662, 0.2943234, 1, 1, 1, 1, 1,
-0.8183125, -0.9777051, -4.057766, 1, 1, 1, 1, 1,
-0.8179027, 1.025, 0.04405738, 1, 1, 1, 1, 1,
-0.81628, 0.6739529, -0.5720064, 1, 1, 1, 1, 1,
-0.8098055, 0.1719999, -1.550546, 1, 1, 1, 1, 1,
-0.7960077, 1.034233, -0.007800557, 0, 0, 1, 1, 1,
-0.7928283, 0.9287371, -1.408959, 1, 0, 0, 1, 1,
-0.7915357, 1.112971, -1.947908, 1, 0, 0, 1, 1,
-0.7908836, -0.4432027, -3.460669, 1, 0, 0, 1, 1,
-0.7826056, 0.671972, -2.050654, 1, 0, 0, 1, 1,
-0.7810535, -0.6727687, -3.229761, 1, 0, 0, 1, 1,
-0.7809704, 0.5366947, -1.523653, 0, 0, 0, 1, 1,
-0.7800545, 0.2056096, -1.92069, 0, 0, 0, 1, 1,
-0.7796691, -1.692683, -2.270938, 0, 0, 0, 1, 1,
-0.7781764, -0.4224174, -2.336814, 0, 0, 0, 1, 1,
-0.7766251, -0.2410978, -0.4988039, 0, 0, 0, 1, 1,
-0.7760891, 0.8039519, -0.3535018, 0, 0, 0, 1, 1,
-0.7729577, -1.84979, -1.469641, 0, 0, 0, 1, 1,
-0.7710755, 0.5105767, 0.1483588, 1, 1, 1, 1, 1,
-0.7607721, -1.696991, -1.466553, 1, 1, 1, 1, 1,
-0.7580441, 1.925404, 0.1751429, 1, 1, 1, 1, 1,
-0.7523436, -0.07564629, -1.948186, 1, 1, 1, 1, 1,
-0.7518733, -0.09119446, -1.476459, 1, 1, 1, 1, 1,
-0.7504363, 0.1163114, -0.866506, 1, 1, 1, 1, 1,
-0.7453245, 1.014687, 0.08386318, 1, 1, 1, 1, 1,
-0.7432472, 0.4339113, -0.8899926, 1, 1, 1, 1, 1,
-0.7409911, -0.5724626, -1.967694, 1, 1, 1, 1, 1,
-0.7402691, 1.698331, 0.5134134, 1, 1, 1, 1, 1,
-0.7351379, 1.218564, 1.092629, 1, 1, 1, 1, 1,
-0.7345479, 0.9833756, 0.04856156, 1, 1, 1, 1, 1,
-0.7311815, -0.7587159, 0.01896651, 1, 1, 1, 1, 1,
-0.7294815, 0.9805719, -2.4021, 1, 1, 1, 1, 1,
-0.7287832, 0.2236364, -0.769278, 1, 1, 1, 1, 1,
-0.7249311, 1.492936, -1.636737, 0, 0, 1, 1, 1,
-0.722836, 1.656359, 0.8153321, 1, 0, 0, 1, 1,
-0.7218205, 0.2765054, -2.660686, 1, 0, 0, 1, 1,
-0.7185127, -1.762282, -1.439593, 1, 0, 0, 1, 1,
-0.7135208, 0.128012, -2.101301, 1, 0, 0, 1, 1,
-0.7127773, -0.7645222, -2.936645, 1, 0, 0, 1, 1,
-0.7096065, -0.7206287, -3.141295, 0, 0, 0, 1, 1,
-0.7038547, 0.5263679, 1.305678, 0, 0, 0, 1, 1,
-0.6993802, 0.1059971, -2.236769, 0, 0, 0, 1, 1,
-0.6977459, -1.427264, -2.853597, 0, 0, 0, 1, 1,
-0.6957355, 1.096253, 0.7162967, 0, 0, 0, 1, 1,
-0.693085, -0.6793865, -3.260197, 0, 0, 0, 1, 1,
-0.6796118, -1.092864, -3.52315, 0, 0, 0, 1, 1,
-0.6793466, -0.4471318, -2.41312, 1, 1, 1, 1, 1,
-0.6763431, 0.828309, -0.3025267, 1, 1, 1, 1, 1,
-0.6752016, 0.4436426, -0.5000536, 1, 1, 1, 1, 1,
-0.6748193, 0.3920625, -2.227781, 1, 1, 1, 1, 1,
-0.6704733, -0.7001953, -2.441019, 1, 1, 1, 1, 1,
-0.6684914, -0.7295005, -2.051568, 1, 1, 1, 1, 1,
-0.6670001, -0.1727992, -3.294442, 1, 1, 1, 1, 1,
-0.665273, -0.9655451, -2.388659, 1, 1, 1, 1, 1,
-0.6621363, -0.8123436, -1.2242, 1, 1, 1, 1, 1,
-0.6602905, -0.3218883, -1.871437, 1, 1, 1, 1, 1,
-0.6512048, 1.454286, -1.578356, 1, 1, 1, 1, 1,
-0.6444747, -0.7703896, -0.9947174, 1, 1, 1, 1, 1,
-0.6427218, -0.2028558, -2.360873, 1, 1, 1, 1, 1,
-0.6386746, -0.08219393, -2.62381, 1, 1, 1, 1, 1,
-0.6351296, 1.408393, -0.4649689, 1, 1, 1, 1, 1,
-0.6313429, 1.132144, 0.2656842, 0, 0, 1, 1, 1,
-0.629376, -1.287163, -1.591472, 1, 0, 0, 1, 1,
-0.6242601, -0.2705871, -1.41121, 1, 0, 0, 1, 1,
-0.6228971, 0.4567077, -1.165269, 1, 0, 0, 1, 1,
-0.6222506, -0.277187, -4.811633, 1, 0, 0, 1, 1,
-0.6184508, -1.926628, -3.763758, 1, 0, 0, 1, 1,
-0.6177778, -1.321521, -4.063654, 0, 0, 0, 1, 1,
-0.6099493, 0.6648954, 0.7135317, 0, 0, 0, 1, 1,
-0.6067029, -0.8327463, -3.408027, 0, 0, 0, 1, 1,
-0.5959289, 0.8370771, -2.064929, 0, 0, 0, 1, 1,
-0.593546, 0.4416786, -2.227962, 0, 0, 0, 1, 1,
-0.5877126, 0.4462955, -0.3748285, 0, 0, 0, 1, 1,
-0.58666, -0.8289248, -1.464329, 0, 0, 0, 1, 1,
-0.5825698, 2.675248, 1.697273, 1, 1, 1, 1, 1,
-0.5823406, -1.839418, -5.335051, 1, 1, 1, 1, 1,
-0.5798681, 1.363729, -1.518279, 1, 1, 1, 1, 1,
-0.5742454, 0.9036666, 0.01739171, 1, 1, 1, 1, 1,
-0.5727245, -0.7588263, -2.56519, 1, 1, 1, 1, 1,
-0.5690949, -0.8850955, -2.140837, 1, 1, 1, 1, 1,
-0.5664602, 1.521952, -0.4988208, 1, 1, 1, 1, 1,
-0.5647111, 1.085649, 0.09141632, 1, 1, 1, 1, 1,
-0.5617483, -0.2861592, -0.4345483, 1, 1, 1, 1, 1,
-0.5616174, -0.9954342, -1.632444, 1, 1, 1, 1, 1,
-0.5578058, 0.5843279, 0.3189149, 1, 1, 1, 1, 1,
-0.5570956, -0.5505534, -2.870703, 1, 1, 1, 1, 1,
-0.5541938, -0.1032113, -0.9073957, 1, 1, 1, 1, 1,
-0.5529009, -1.053323, -0.139802, 1, 1, 1, 1, 1,
-0.5498801, -1.969638, -3.163539, 1, 1, 1, 1, 1,
-0.5421731, 1.285218, -1.363955, 0, 0, 1, 1, 1,
-0.5417199, 0.03177234, -1.570423, 1, 0, 0, 1, 1,
-0.5411193, -0.3161941, -2.377789, 1, 0, 0, 1, 1,
-0.5401782, 0.1031906, -2.945279, 1, 0, 0, 1, 1,
-0.5349787, 0.3703429, -0.1652435, 1, 0, 0, 1, 1,
-0.527311, 0.95727, -1.366781, 1, 0, 0, 1, 1,
-0.527225, -0.3719904, -2.716025, 0, 0, 0, 1, 1,
-0.5262084, -1.595196, -1.825286, 0, 0, 0, 1, 1,
-0.5261952, 0.867093, 0.03021491, 0, 0, 0, 1, 1,
-0.5181939, 0.8322163, -1.720373, 0, 0, 0, 1, 1,
-0.5133939, 0.168381, -0.5567284, 0, 0, 0, 1, 1,
-0.5129722, 0.02906464, -1.197097, 0, 0, 0, 1, 1,
-0.5120915, 1.231383, -0.8510687, 0, 0, 0, 1, 1,
-0.5079288, -0.2187496, -1.509511, 1, 1, 1, 1, 1,
-0.5037823, 0.6624058, -1.154807, 1, 1, 1, 1, 1,
-0.5011043, 0.2193835, -1.738582, 1, 1, 1, 1, 1,
-0.5004429, -1.49693, -3.389026, 1, 1, 1, 1, 1,
-0.4982424, 0.8104247, -1.672588, 1, 1, 1, 1, 1,
-0.4973168, 0.1743467, -0.3975406, 1, 1, 1, 1, 1,
-0.4969671, -0.3234223, -2.65219, 1, 1, 1, 1, 1,
-0.496752, -0.5431366, -2.629381, 1, 1, 1, 1, 1,
-0.4959704, 1.42137, 1.324207, 1, 1, 1, 1, 1,
-0.4959658, 0.6172708, -0.9420339, 1, 1, 1, 1, 1,
-0.4885526, -0.4845773, -2.247579, 1, 1, 1, 1, 1,
-0.4836742, -1.99711, -2.579859, 1, 1, 1, 1, 1,
-0.4835597, -1.466895, -2.897101, 1, 1, 1, 1, 1,
-0.4812931, 0.5105919, -0.6062475, 1, 1, 1, 1, 1,
-0.4764184, -1.553325, -2.628824, 1, 1, 1, 1, 1,
-0.4744514, -0.3563522, -0.5515563, 0, 0, 1, 1, 1,
-0.4727276, -1.275538, -1.358814, 1, 0, 0, 1, 1,
-0.4706729, -1.4466, -3.942777, 1, 0, 0, 1, 1,
-0.4701213, 1.3647, 0.6699256, 1, 0, 0, 1, 1,
-0.4698158, -1.596146, -2.615669, 1, 0, 0, 1, 1,
-0.4688812, -0.8334334, -3.405862, 1, 0, 0, 1, 1,
-0.4684714, 0.2548051, -1.047649, 0, 0, 0, 1, 1,
-0.4643315, 0.9113249, -2.590965, 0, 0, 0, 1, 1,
-0.4628501, 1.183882, -2.310165, 0, 0, 0, 1, 1,
-0.4610846, -0.1721003, -0.9773661, 0, 0, 0, 1, 1,
-0.4600445, -1.450602, -2.045204, 0, 0, 0, 1, 1,
-0.4586278, 0.8810266, 0.4091097, 0, 0, 0, 1, 1,
-0.4366312, 1.193223, 1.505563, 0, 0, 0, 1, 1,
-0.4343953, -0.00265298, -0.7579915, 1, 1, 1, 1, 1,
-0.4324302, 1.999742, -2.269839, 1, 1, 1, 1, 1,
-0.4319535, 0.9740764, -1.593393, 1, 1, 1, 1, 1,
-0.4265465, 0.3041304, -0.382759, 1, 1, 1, 1, 1,
-0.4260229, -0.8655782, -2.5183, 1, 1, 1, 1, 1,
-0.4252704, 1.149443, -0.9383558, 1, 1, 1, 1, 1,
-0.4237444, 0.5575129, 0.1268933, 1, 1, 1, 1, 1,
-0.4224333, -0.9327047, -3.868632, 1, 1, 1, 1, 1,
-0.4211098, -0.2714637, -0.0805004, 1, 1, 1, 1, 1,
-0.420718, 1.056086, -0.6327853, 1, 1, 1, 1, 1,
-0.4093977, -2.175931, -1.934551, 1, 1, 1, 1, 1,
-0.4093537, -1.195493, -2.355368, 1, 1, 1, 1, 1,
-0.4090878, 0.2124559, -1.568667, 1, 1, 1, 1, 1,
-0.4080649, 0.1357882, -3.579357, 1, 1, 1, 1, 1,
-0.405671, 1.01738, 0.5452917, 1, 1, 1, 1, 1,
-0.3955048, -0.7964881, -3.258943, 0, 0, 1, 1, 1,
-0.3929678, 0.7926213, -1.823244, 1, 0, 0, 1, 1,
-0.3849481, 0.5298929, -0.3667867, 1, 0, 0, 1, 1,
-0.3803866, 1.1043, -1.497846, 1, 0, 0, 1, 1,
-0.3798008, 1.420961, 1.035962, 1, 0, 0, 1, 1,
-0.3789514, -0.1191497, -1.470371, 1, 0, 0, 1, 1,
-0.3783289, 0.88087, 0.2663763, 0, 0, 0, 1, 1,
-0.3781568, 0.006902528, -1.721452, 0, 0, 0, 1, 1,
-0.3748725, 0.5604568, -1.704195, 0, 0, 0, 1, 1,
-0.3742671, 0.3710801, -0.7685254, 0, 0, 0, 1, 1,
-0.370327, 0.4424326, -0.5686064, 0, 0, 0, 1, 1,
-0.3698141, -2.772307, -2.826445, 0, 0, 0, 1, 1,
-0.3665996, 0.8675277, 0.6504978, 0, 0, 0, 1, 1,
-0.3649441, 1.963942, -1.087958, 1, 1, 1, 1, 1,
-0.3622493, -0.0406672, -1.555225, 1, 1, 1, 1, 1,
-0.3590463, 0.8200044, -1.157665, 1, 1, 1, 1, 1,
-0.358604, -2.064294, -1.754137, 1, 1, 1, 1, 1,
-0.3547796, -0.7804111, -3.626973, 1, 1, 1, 1, 1,
-0.3398252, -0.01246039, -0.918488, 1, 1, 1, 1, 1,
-0.3389732, 0.3778287, -0.5734428, 1, 1, 1, 1, 1,
-0.3363551, 0.7047039, -0.4701304, 1, 1, 1, 1, 1,
-0.3286887, 0.04409964, -0.3283489, 1, 1, 1, 1, 1,
-0.3285245, -0.08515583, -2.088857, 1, 1, 1, 1, 1,
-0.3284809, -0.7106665, -1.829244, 1, 1, 1, 1, 1,
-0.3279417, -0.6047322, -3.009808, 1, 1, 1, 1, 1,
-0.323447, -0.1415614, -2.799761, 1, 1, 1, 1, 1,
-0.3228264, 0.4707809, -2.437747, 1, 1, 1, 1, 1,
-0.318296, 0.8516859, -1.320972, 1, 1, 1, 1, 1,
-0.3179389, -0.3034644, -4.002667, 0, 0, 1, 1, 1,
-0.3177747, -0.1623025, -1.949247, 1, 0, 0, 1, 1,
-0.3152436, -1.124772, -2.888602, 1, 0, 0, 1, 1,
-0.3107995, 0.907648, -0.6608633, 1, 0, 0, 1, 1,
-0.3074214, 0.7550725, 2.071511, 1, 0, 0, 1, 1,
-0.3057699, 1.255468, -0.6558926, 1, 0, 0, 1, 1,
-0.3043181, -0.9474223, -2.332431, 0, 0, 0, 1, 1,
-0.2980371, -1.050702, -3.355386, 0, 0, 0, 1, 1,
-0.295134, 0.7233797, -1.299086, 0, 0, 0, 1, 1,
-0.294234, 0.6096607, -0.7645556, 0, 0, 0, 1, 1,
-0.2927661, -0.5658371, -3.132834, 0, 0, 0, 1, 1,
-0.2923893, 1.838766, -1.773911, 0, 0, 0, 1, 1,
-0.2912209, -0.120589, -3.019102, 0, 0, 0, 1, 1,
-0.2906061, 0.9877105, -2.183437, 1, 1, 1, 1, 1,
-0.2900974, 1.587303, -1.034616, 1, 1, 1, 1, 1,
-0.2893548, 0.8736675, -1.352168, 1, 1, 1, 1, 1,
-0.2848159, -0.8145402, -2.8953, 1, 1, 1, 1, 1,
-0.2842954, 1.96465, -1.195089, 1, 1, 1, 1, 1,
-0.279625, 1.147317, 0.8349349, 1, 1, 1, 1, 1,
-0.2792957, 0.5511376, 0.6628303, 1, 1, 1, 1, 1,
-0.2768477, -0.5103852, -1.806663, 1, 1, 1, 1, 1,
-0.2765678, 0.1656428, -2.693457, 1, 1, 1, 1, 1,
-0.2758401, -0.3202616, -3.380643, 1, 1, 1, 1, 1,
-0.2727427, 0.08897327, -1.645011, 1, 1, 1, 1, 1,
-0.272395, 0.3248332, 1.181706, 1, 1, 1, 1, 1,
-0.2582827, 0.7355484, 0.9596558, 1, 1, 1, 1, 1,
-0.2579221, 1.036505, 0.1963444, 1, 1, 1, 1, 1,
-0.2563518, -0.6381307, -2.572648, 1, 1, 1, 1, 1,
-0.2548571, -0.1699234, -3.747424, 0, 0, 1, 1, 1,
-0.2531885, -0.07841803, -2.499893, 1, 0, 0, 1, 1,
-0.2519707, 1.98779, -2.148968, 1, 0, 0, 1, 1,
-0.2452854, -1.591307, -5.944836, 1, 0, 0, 1, 1,
-0.229205, 0.4843365, -0.1774876, 1, 0, 0, 1, 1,
-0.2289309, 0.6572862, 0.2335902, 1, 0, 0, 1, 1,
-0.2288955, -0.5284991, -4.386847, 0, 0, 0, 1, 1,
-0.2115805, -0.8557425, -4.096866, 0, 0, 0, 1, 1,
-0.2083414, 0.02380581, -2.107476, 0, 0, 0, 1, 1,
-0.205851, 1.61805, 0.183023, 0, 0, 0, 1, 1,
-0.2044142, -0.1900275, -3.860218, 0, 0, 0, 1, 1,
-0.1979916, 0.9985998, -1.36939, 0, 0, 0, 1, 1,
-0.1939575, -1.207653, -4.31915, 0, 0, 0, 1, 1,
-0.1867381, -1.529991, -3.737699, 1, 1, 1, 1, 1,
-0.1866615, -0.4423286, 0.2670848, 1, 1, 1, 1, 1,
-0.1857297, 0.6647961, -0.5800694, 1, 1, 1, 1, 1,
-0.1824614, 0.8166752, 1.575085, 1, 1, 1, 1, 1,
-0.1786128, -1.082016, -2.000844, 1, 1, 1, 1, 1,
-0.1743333, 0.4233732, 0.2998059, 1, 1, 1, 1, 1,
-0.1674913, 0.6687269, 0.5416234, 1, 1, 1, 1, 1,
-0.1667316, -1.135103, -1.073808, 1, 1, 1, 1, 1,
-0.1642745, -0.1919208, 0.2365549, 1, 1, 1, 1, 1,
-0.1558089, 0.1552596, -0.6526824, 1, 1, 1, 1, 1,
-0.1504639, 1.14598, -0.5310909, 1, 1, 1, 1, 1,
-0.1483412, -0.752299, -3.052322, 1, 1, 1, 1, 1,
-0.1431541, 0.1739359, -0.1024689, 1, 1, 1, 1, 1,
-0.1424166, -0.8113615, -1.51639, 1, 1, 1, 1, 1,
-0.1406218, 0.9137486, 0.09218514, 1, 1, 1, 1, 1,
-0.1397614, 1.804042, 0.5250239, 0, 0, 1, 1, 1,
-0.139643, 1.942626, -0.6932054, 1, 0, 0, 1, 1,
-0.1318007, 0.009119335, -1.057654, 1, 0, 0, 1, 1,
-0.1218627, 0.5343667, 0.3548361, 1, 0, 0, 1, 1,
-0.1208342, 0.2653974, -0.7806004, 1, 0, 0, 1, 1,
-0.1208135, -0.4354256, -4.666746, 1, 0, 0, 1, 1,
-0.1200058, -0.07069659, -3.807659, 0, 0, 0, 1, 1,
-0.1176035, -0.4340955, -2.481951, 0, 0, 0, 1, 1,
-0.1124555, -0.4329669, -1.615034, 0, 0, 0, 1, 1,
-0.1123206, -0.6835195, -3.951603, 0, 0, 0, 1, 1,
-0.1123146, 0.3987559, 1.648932, 0, 0, 0, 1, 1,
-0.1114012, 1.219813, 0.7583352, 0, 0, 0, 1, 1,
-0.1111668, -0.1285957, -2.481428, 0, 0, 0, 1, 1,
-0.1107106, -0.8666131, -2.639535, 1, 1, 1, 1, 1,
-0.1104081, 0.83079, 0.775143, 1, 1, 1, 1, 1,
-0.1103093, 0.2237111, -0.1159058, 1, 1, 1, 1, 1,
-0.106396, -1.154008, -2.610403, 1, 1, 1, 1, 1,
-0.1017098, 1.146776, -1.235029, 1, 1, 1, 1, 1,
-0.1003735, 0.6604764, 0.3955305, 1, 1, 1, 1, 1,
-0.0986292, 2.724855, -0.5790011, 1, 1, 1, 1, 1,
-0.09732556, 0.7702671, -0.9520553, 1, 1, 1, 1, 1,
-0.09481224, 0.4965857, 0.2608685, 1, 1, 1, 1, 1,
-0.09244593, 1.3014, -0.7728382, 1, 1, 1, 1, 1,
-0.09156097, 0.2334834, 1.061324, 1, 1, 1, 1, 1,
-0.09106692, -1.928785, -4.026929, 1, 1, 1, 1, 1,
-0.09031999, -0.4226402, -2.926788, 1, 1, 1, 1, 1,
-0.09012787, 0.8240679, -0.3806785, 1, 1, 1, 1, 1,
-0.08796147, 0.6267678, 0.02633767, 1, 1, 1, 1, 1,
-0.0865102, -0.5627981, -3.788977, 0, 0, 1, 1, 1,
-0.08643902, -0.7274148, -1.191528, 1, 0, 0, 1, 1,
-0.08258336, 2.300852, 0.3333943, 1, 0, 0, 1, 1,
-0.07984432, 0.9347476, 0.2015965, 1, 0, 0, 1, 1,
-0.07801531, -0.8235704, -4.533482, 1, 0, 0, 1, 1,
-0.07531045, 0.7479869, -0.3436227, 1, 0, 0, 1, 1,
-0.07461232, 0.5907811, -0.7679291, 0, 0, 0, 1, 1,
-0.06920813, -1.85984, -3.659403, 0, 0, 0, 1, 1,
-0.06803891, -0.3366278, -4.858552, 0, 0, 0, 1, 1,
-0.06745791, -1.173875, -2.262286, 0, 0, 0, 1, 1,
-0.06647217, -0.09537452, -2.031946, 0, 0, 0, 1, 1,
-0.06386657, 0.991664, 1.200903, 0, 0, 0, 1, 1,
-0.06220403, -0.8299876, -3.370324, 0, 0, 0, 1, 1,
-0.06108353, 0.7589504, -1.793052, 1, 1, 1, 1, 1,
-0.0601377, -1.394932, -5.088448, 1, 1, 1, 1, 1,
-0.05993504, -1.583834, -4.081776, 1, 1, 1, 1, 1,
-0.05874272, 1.250886, 0.8178567, 1, 1, 1, 1, 1,
-0.05364949, 0.03971864, -0.8124023, 1, 1, 1, 1, 1,
-0.05227321, 0.8882595, 1.863635, 1, 1, 1, 1, 1,
-0.05146056, -1.097759, -3.059766, 1, 1, 1, 1, 1,
-0.05142192, 1.217526, 0.05806401, 1, 1, 1, 1, 1,
-0.04876579, -0.6647204, -3.424989, 1, 1, 1, 1, 1,
-0.04394257, -0.7422951, -3.487327, 1, 1, 1, 1, 1,
-0.04384302, -0.4439239, -2.859756, 1, 1, 1, 1, 1,
-0.04117519, 0.4820822, 0.4793022, 1, 1, 1, 1, 1,
-0.03475837, -0.3006397, -3.13154, 1, 1, 1, 1, 1,
-0.03204222, -1.561852, -3.309898, 1, 1, 1, 1, 1,
-0.03157679, 0.9240238, -0.8914766, 1, 1, 1, 1, 1,
-0.03142738, 0.09819774, 0.1982658, 0, 0, 1, 1, 1,
-0.0314176, -0.4229831, -1.99179, 1, 0, 0, 1, 1,
-0.02852404, -0.7890866, -0.1153203, 1, 0, 0, 1, 1,
-0.02380213, 0.1696677, -1.102365, 1, 0, 0, 1, 1,
-0.02268894, 0.586902, -0.4586823, 1, 0, 0, 1, 1,
-0.0220734, 0.05504645, -0.3357384, 1, 0, 0, 1, 1,
-0.02097636, 0.3315714, 0.9694247, 0, 0, 0, 1, 1,
-0.02093591, 1.066771, 0.1218228, 0, 0, 0, 1, 1,
-0.02015675, -1.214583, -4.612184, 0, 0, 0, 1, 1,
-0.01993933, 0.7624472, -1.622065, 0, 0, 0, 1, 1,
-0.004278792, -0.916422, -1.991869, 0, 0, 0, 1, 1,
-0.001130161, -1.172703, -2.105165, 0, 0, 0, 1, 1,
0.0004910057, 0.5191463, 0.7419284, 0, 0, 0, 1, 1,
0.005883242, 0.09868401, 1.188372, 1, 1, 1, 1, 1,
0.007642141, -0.5387477, 2.692456, 1, 1, 1, 1, 1,
0.01041667, -0.8857251, 2.895137, 1, 1, 1, 1, 1,
0.01362618, -1.694516, 4.16573, 1, 1, 1, 1, 1,
0.01938801, 1.464401, -1.013273, 1, 1, 1, 1, 1,
0.02289184, -0.5633945, 4.42871, 1, 1, 1, 1, 1,
0.02530807, -1.150194, 2.839533, 1, 1, 1, 1, 1,
0.02742225, -0.7638697, 3.911877, 1, 1, 1, 1, 1,
0.02865175, -0.2128848, 2.234283, 1, 1, 1, 1, 1,
0.02961043, 0.2220067, -1.652074, 1, 1, 1, 1, 1,
0.03315544, -0.4355864, 0.4625875, 1, 1, 1, 1, 1,
0.03972597, -1.125358, 3.825778, 1, 1, 1, 1, 1,
0.04350498, 0.8291085, 0.5974565, 1, 1, 1, 1, 1,
0.04504034, -1.470504, 4.784491, 1, 1, 1, 1, 1,
0.04793305, 0.5970415, 1.091472, 1, 1, 1, 1, 1,
0.05069154, -1.356631, 0.7559351, 0, 0, 1, 1, 1,
0.05363542, -0.9304019, 2.517195, 1, 0, 0, 1, 1,
0.05644718, -0.9987713, 2.511618, 1, 0, 0, 1, 1,
0.05978732, -1.915498, 2.056973, 1, 0, 0, 1, 1,
0.06094969, -1.341799, 3.210042, 1, 0, 0, 1, 1,
0.06235005, 0.774234, 0.01915028, 1, 0, 0, 1, 1,
0.06487858, -0.3233725, 1.868706, 0, 0, 0, 1, 1,
0.06680758, -1.842048, 4.174832, 0, 0, 0, 1, 1,
0.06724682, 0.01836823, 2.071592, 0, 0, 0, 1, 1,
0.07160549, -0.3094809, 1.045545, 0, 0, 0, 1, 1,
0.08022521, -0.4579403, 2.810446, 0, 0, 0, 1, 1,
0.08387546, 1.00473, -0.2011775, 0, 0, 0, 1, 1,
0.1005132, -0.5328797, 3.931533, 0, 0, 0, 1, 1,
0.1011561, 1.001212, -1.927408, 1, 1, 1, 1, 1,
0.1140429, 0.2961523, 1.862537, 1, 1, 1, 1, 1,
0.1156467, 1.125286, 0.5713242, 1, 1, 1, 1, 1,
0.1189406, 0.01781327, 1.814336, 1, 1, 1, 1, 1,
0.125591, -1.931354, 4.406127, 1, 1, 1, 1, 1,
0.1262381, 1.359383, -0.6757988, 1, 1, 1, 1, 1,
0.1264444, -1.209226, 2.271781, 1, 1, 1, 1, 1,
0.1267161, 1.191066, 0.4216513, 1, 1, 1, 1, 1,
0.1276128, -0.2207245, 2.013474, 1, 1, 1, 1, 1,
0.1281226, 1.044443, -0.1710492, 1, 1, 1, 1, 1,
0.1304548, 1.613364, 1.63659, 1, 1, 1, 1, 1,
0.1346694, 0.3758363, -0.4501684, 1, 1, 1, 1, 1,
0.1346772, -1.005569, 2.976132, 1, 1, 1, 1, 1,
0.1350077, 0.04286204, 1.523833, 1, 1, 1, 1, 1,
0.1440385, -0.7901486, 2.275352, 1, 1, 1, 1, 1,
0.1456285, 0.3986243, 0.3052286, 0, 0, 1, 1, 1,
0.150098, -0.6313786, 1.893609, 1, 0, 0, 1, 1,
0.1597565, 0.05528992, 0.5826891, 1, 0, 0, 1, 1,
0.1621233, -1.0424, 2.856008, 1, 0, 0, 1, 1,
0.1650765, -1.040405, 2.17098, 1, 0, 0, 1, 1,
0.1682163, -0.8353693, 2.495748, 1, 0, 0, 1, 1,
0.1715382, -2.438948, 4.034555, 0, 0, 0, 1, 1,
0.1730323, 0.4615274, -0.3910201, 0, 0, 0, 1, 1,
0.1766589, 0.8425482, -1.397294, 0, 0, 0, 1, 1,
0.1830738, -0.1827066, 2.254197, 0, 0, 0, 1, 1,
0.1962132, 1.014429, -1.189816, 0, 0, 0, 1, 1,
0.1993649, 0.3689831, 0.1277844, 0, 0, 0, 1, 1,
0.2003056, -1.989898, 3.202964, 0, 0, 0, 1, 1,
0.2008698, -0.3733189, 3.522669, 1, 1, 1, 1, 1,
0.2022451, -0.9156986, 3.5612, 1, 1, 1, 1, 1,
0.2047216, 0.802062, 0.9751378, 1, 1, 1, 1, 1,
0.2058819, -0.1279154, 2.296361, 1, 1, 1, 1, 1,
0.2063407, -2.407976, 3.237508, 1, 1, 1, 1, 1,
0.208721, 0.3814532, 2.072378, 1, 1, 1, 1, 1,
0.2090323, 0.2373275, 1.247859, 1, 1, 1, 1, 1,
0.2095917, -0.1342781, 0.6019211, 1, 1, 1, 1, 1,
0.2098318, 0.01959623, 1.824368, 1, 1, 1, 1, 1,
0.2100262, -0.439282, 3.006674, 1, 1, 1, 1, 1,
0.2163348, -2.98272, 2.415395, 1, 1, 1, 1, 1,
0.2192768, 0.6470345, -0.2346769, 1, 1, 1, 1, 1,
0.2227159, -1.36925, 4.16856, 1, 1, 1, 1, 1,
0.2232457, -0.04804949, 1.334365, 1, 1, 1, 1, 1,
0.2246045, 0.4846604, 2.269339, 1, 1, 1, 1, 1,
0.2305538, 0.6048473, -0.128596, 0, 0, 1, 1, 1,
0.2328833, 0.8694022, -0.4398536, 1, 0, 0, 1, 1,
0.2331056, 0.1437565, 0.9549249, 1, 0, 0, 1, 1,
0.2362108, 1.227869, 2.292775, 1, 0, 0, 1, 1,
0.2366963, -0.4964023, 4.380512, 1, 0, 0, 1, 1,
0.2394588, 0.509685, -0.7695032, 1, 0, 0, 1, 1,
0.2394614, 0.7062588, -0.1925922, 0, 0, 0, 1, 1,
0.2396108, 0.176883, 0.3309296, 0, 0, 0, 1, 1,
0.2406341, -1.201771, 3.736408, 0, 0, 0, 1, 1,
0.2419494, 0.8060889, -0.04805866, 0, 0, 0, 1, 1,
0.2547802, 1.06927, -0.7185563, 0, 0, 0, 1, 1,
0.2570966, 0.2121737, 0.7906964, 0, 0, 0, 1, 1,
0.2575967, -0.8633679, 1.740901, 0, 0, 0, 1, 1,
0.2577324, 0.06392995, 0.8016243, 1, 1, 1, 1, 1,
0.258983, 2.093729, 0.3974242, 1, 1, 1, 1, 1,
0.2592935, 0.2717156, -0.9466486, 1, 1, 1, 1, 1,
0.2636843, -1.195808, 3.12247, 1, 1, 1, 1, 1,
0.2673977, 0.2504443, 1.498927, 1, 1, 1, 1, 1,
0.2679183, -0.3524847, 2.262984, 1, 1, 1, 1, 1,
0.2682246, -0.4430603, 2.644609, 1, 1, 1, 1, 1,
0.278467, -0.2869382, 3.322116, 1, 1, 1, 1, 1,
0.2788389, 0.4646374, 1.580386, 1, 1, 1, 1, 1,
0.2795533, 0.526962, 0.09159464, 1, 1, 1, 1, 1,
0.282178, -1.1303, 3.198226, 1, 1, 1, 1, 1,
0.2829734, -1.109983, 1.943116, 1, 1, 1, 1, 1,
0.2858148, 0.1273667, 1.877179, 1, 1, 1, 1, 1,
0.2877287, -0.414332, 3.255919, 1, 1, 1, 1, 1,
0.2899398, -1.120999, 4.023011, 1, 1, 1, 1, 1,
0.2903813, -1.29185, 1.125448, 0, 0, 1, 1, 1,
0.2904543, -0.6476474, 2.76734, 1, 0, 0, 1, 1,
0.2976891, -1.751553, 2.570975, 1, 0, 0, 1, 1,
0.2994324, -0.8755578, 1.600304, 1, 0, 0, 1, 1,
0.3014868, -0.4950218, 2.321874, 1, 0, 0, 1, 1,
0.3027531, 1.184613, 1.219324, 1, 0, 0, 1, 1,
0.3033137, -0.5437343, 3.140948, 0, 0, 0, 1, 1,
0.3045702, -1.328319, 3.26709, 0, 0, 0, 1, 1,
0.3047568, 0.8647866, 0.7971739, 0, 0, 0, 1, 1,
0.306218, 2.450452, 1.409814, 0, 0, 0, 1, 1,
0.3077071, -0.5389013, 2.720453, 0, 0, 0, 1, 1,
0.3086383, -0.8029631, 2.667186, 0, 0, 0, 1, 1,
0.3095571, 1.520316, 0.1870389, 0, 0, 0, 1, 1,
0.3114457, -0.40316, 4.147861, 1, 1, 1, 1, 1,
0.3152016, 0.1975003, 1.862484, 1, 1, 1, 1, 1,
0.3188004, 0.2459177, 1.387853, 1, 1, 1, 1, 1,
0.3193914, 1.284345, -0.8167098, 1, 1, 1, 1, 1,
0.3240339, 0.6486192, -1.143674, 1, 1, 1, 1, 1,
0.325813, -0.05067581, 1.380565, 1, 1, 1, 1, 1,
0.3294494, -0.4714907, 2.239831, 1, 1, 1, 1, 1,
0.3318311, 0.5321295, -1.168019, 1, 1, 1, 1, 1,
0.3333412, -0.9345526, 1.533129, 1, 1, 1, 1, 1,
0.3390476, -0.7163684, 3.554924, 1, 1, 1, 1, 1,
0.3395471, -1.103025, 1.446914, 1, 1, 1, 1, 1,
0.3407895, -1.294324, 2.098698, 1, 1, 1, 1, 1,
0.3427552, 0.6926256, 0.4005931, 1, 1, 1, 1, 1,
0.3453946, -1.64394, 2.755303, 1, 1, 1, 1, 1,
0.3463373, 0.6959747, -0.07595156, 1, 1, 1, 1, 1,
0.3505093, 0.1955654, 0.1385369, 0, 0, 1, 1, 1,
0.3506682, -0.6800649, 1.867877, 1, 0, 0, 1, 1,
0.3510242, -0.06876521, 1.074833, 1, 0, 0, 1, 1,
0.3567143, -1.779307, 2.136799, 1, 0, 0, 1, 1,
0.3570173, 0.1821818, 2.147534, 1, 0, 0, 1, 1,
0.3591608, 1.623726, 0.2717686, 1, 0, 0, 1, 1,
0.3681509, 0.4903244, 0.8065611, 0, 0, 0, 1, 1,
0.3685466, -0.8644742, 2.56107, 0, 0, 0, 1, 1,
0.3702737, -0.1404825, 2.214155, 0, 0, 0, 1, 1,
0.3725013, 0.4987962, -0.3773715, 0, 0, 0, 1, 1,
0.3781606, 1.109571, 0.6872926, 0, 0, 0, 1, 1,
0.3808627, 1.035072, -0.1135833, 0, 0, 0, 1, 1,
0.3818886, 1.692789, 0.3660695, 0, 0, 0, 1, 1,
0.3830703, -0.4589568, 2.005615, 1, 1, 1, 1, 1,
0.3869428, -0.1504981, 2.894165, 1, 1, 1, 1, 1,
0.3977501, -1.562298, 2.081406, 1, 1, 1, 1, 1,
0.4003874, 0.8413171, 0.07708658, 1, 1, 1, 1, 1,
0.4008034, 0.8749535, -0.09904698, 1, 1, 1, 1, 1,
0.4036325, 1.041985, 1.526938, 1, 1, 1, 1, 1,
0.4089881, -1.490791, 2.261363, 1, 1, 1, 1, 1,
0.4100758, -0.2660206, 0.6901111, 1, 1, 1, 1, 1,
0.4105534, 0.1029687, 2.645691, 1, 1, 1, 1, 1,
0.4109874, 0.005417124, 1.330525, 1, 1, 1, 1, 1,
0.4123068, 1.185203, 0.6762559, 1, 1, 1, 1, 1,
0.4140983, -0.09272204, 2.331325, 1, 1, 1, 1, 1,
0.4157701, -2.120049, 3.736241, 1, 1, 1, 1, 1,
0.4162521, 0.7868868, -1.328707, 1, 1, 1, 1, 1,
0.4172933, 0.8577036, -0.6121835, 1, 1, 1, 1, 1,
0.4179548, 1.049002, -0.3262654, 0, 0, 1, 1, 1,
0.418252, -2.476908, 3.426472, 1, 0, 0, 1, 1,
0.422567, 0.01405996, 1.626719, 1, 0, 0, 1, 1,
0.4233024, 0.4537946, -0.7566841, 1, 0, 0, 1, 1,
0.4242731, 0.5095692, -1.579937, 1, 0, 0, 1, 1,
0.4310655, -1.430717, 2.354569, 1, 0, 0, 1, 1,
0.4324106, -0.4679807, 2.176814, 0, 0, 0, 1, 1,
0.4324283, -0.6783629, 2.992302, 0, 0, 0, 1, 1,
0.4343888, -1.669119, 3.440339, 0, 0, 0, 1, 1,
0.4344176, -0.6214626, 3.469208, 0, 0, 0, 1, 1,
0.436664, -0.007574896, 1.388532, 0, 0, 0, 1, 1,
0.436971, -0.01112175, 1.424914, 0, 0, 0, 1, 1,
0.438431, 1.461161, -0.3488367, 0, 0, 0, 1, 1,
0.4422196, -0.1191279, -0.399172, 1, 1, 1, 1, 1,
0.4426959, 1.160005, 1.782706, 1, 1, 1, 1, 1,
0.4434292, -0.4055549, 2.111678, 1, 1, 1, 1, 1,
0.4447219, 0.9631308, 0.421709, 1, 1, 1, 1, 1,
0.4494954, -0.6913812, 3.403354, 1, 1, 1, 1, 1,
0.4505456, -2.571535, 4.469615, 1, 1, 1, 1, 1,
0.4533547, -0.6510037, 3.225389, 1, 1, 1, 1, 1,
0.4535874, 1.607709, 2.095978, 1, 1, 1, 1, 1,
0.4539188, 0.1830034, 0.8982719, 1, 1, 1, 1, 1,
0.4544721, -0.4893702, -1.451693, 1, 1, 1, 1, 1,
0.4570685, 1.530689, -0.3221695, 1, 1, 1, 1, 1,
0.4583291, -0.4033278, 2.186051, 1, 1, 1, 1, 1,
0.460591, -0.7729145, 3.177285, 1, 1, 1, 1, 1,
0.4619691, -0.639926, 2.112836, 1, 1, 1, 1, 1,
0.4623722, -0.04918459, 1.433987, 1, 1, 1, 1, 1,
0.4636677, 2.063319, 0.4596605, 0, 0, 1, 1, 1,
0.4693363, 0.5006626, 1.520884, 1, 0, 0, 1, 1,
0.4700618, 1.003441, 0.7027245, 1, 0, 0, 1, 1,
0.4712074, 1.601621, 0.8726169, 1, 0, 0, 1, 1,
0.4748822, 0.546155, -0.6003944, 1, 0, 0, 1, 1,
0.4760239, -1.12153, 2.813427, 1, 0, 0, 1, 1,
0.4763462, 0.05785543, -1.144806, 0, 0, 0, 1, 1,
0.4819215, 1.489175, 1.879216, 0, 0, 0, 1, 1,
0.4830176, -0.7279181, 1.327476, 0, 0, 0, 1, 1,
0.4890088, -1.406291, 3.115915, 0, 0, 0, 1, 1,
0.4895608, -0.6776586, 1.317935, 0, 0, 0, 1, 1,
0.4903699, 0.4801286, 1.489158, 0, 0, 0, 1, 1,
0.4928225, 0.7977781, 0.9931979, 0, 0, 0, 1, 1,
0.492837, 1.434565, -0.8645403, 1, 1, 1, 1, 1,
0.4935803, -0.6166895, 2.935833, 1, 1, 1, 1, 1,
0.4963321, -0.2734686, 1.24879, 1, 1, 1, 1, 1,
0.4979677, 0.1264623, 0.7308195, 1, 1, 1, 1, 1,
0.5002944, 0.803009, 2.519675, 1, 1, 1, 1, 1,
0.5044569, -1.080705, 2.671819, 1, 1, 1, 1, 1,
0.5075244, 1.010743, -0.4777702, 1, 1, 1, 1, 1,
0.5149456, 0.2134289, 0.146496, 1, 1, 1, 1, 1,
0.5155351, -1.611256, 1.688984, 1, 1, 1, 1, 1,
0.5157896, -1.554021, 3.73756, 1, 1, 1, 1, 1,
0.5158821, -0.3414184, 2.772699, 1, 1, 1, 1, 1,
0.5164031, 1.30156, 0.08191931, 1, 1, 1, 1, 1,
0.5205345, -2.802912, 4.100567, 1, 1, 1, 1, 1,
0.520883, 0.7279013, -0.05774648, 1, 1, 1, 1, 1,
0.5250839, 0.2516765, 0.7347576, 1, 1, 1, 1, 1,
0.5251743, -0.3092349, 3.005787, 0, 0, 1, 1, 1,
0.5264805, 0.02572927, 2.069684, 1, 0, 0, 1, 1,
0.5273408, 0.868732, 0.8182901, 1, 0, 0, 1, 1,
0.5325746, -0.750634, 2.005999, 1, 0, 0, 1, 1,
0.5327686, 0.6760428, 0.9750284, 1, 0, 0, 1, 1,
0.5409631, -1.643991, 3.070095, 1, 0, 0, 1, 1,
0.5431731, -0.1206628, 2.479533, 0, 0, 0, 1, 1,
0.5452417, -0.4687746, 3.361405, 0, 0, 0, 1, 1,
0.5461686, -0.3510658, 2.700707, 0, 0, 0, 1, 1,
0.5475574, 0.8564408, 0.1011705, 0, 0, 0, 1, 1,
0.5489379, 1.738562, 0.3280126, 0, 0, 0, 1, 1,
0.5549294, 0.03559382, 2.933953, 0, 0, 0, 1, 1,
0.5551953, 0.7528387, 0.468913, 0, 0, 0, 1, 1,
0.5650417, 0.3130019, 2.24738, 1, 1, 1, 1, 1,
0.5672599, -0.09122128, 3.223828, 1, 1, 1, 1, 1,
0.5686792, -0.9563359, 4.464443, 1, 1, 1, 1, 1,
0.5706683, -0.5108019, 1.529933, 1, 1, 1, 1, 1,
0.5772083, 1.901032, -1.037895, 1, 1, 1, 1, 1,
0.5778415, 0.4163221, 1.941715, 1, 1, 1, 1, 1,
0.5780647, 1.359206, -0.3640874, 1, 1, 1, 1, 1,
0.5786042, -0.1935203, 3.660737, 1, 1, 1, 1, 1,
0.5791581, -0.9393906, 3.752637, 1, 1, 1, 1, 1,
0.5900185, -0.6039774, 2.314922, 1, 1, 1, 1, 1,
0.590022, 0.6529198, 0.9896426, 1, 1, 1, 1, 1,
0.5952613, -2.505355, 1.934078, 1, 1, 1, 1, 1,
0.5964445, 1.720381, -0.4580762, 1, 1, 1, 1, 1,
0.5975811, 0.003142847, 0.696319, 1, 1, 1, 1, 1,
0.6032715, -0.0737152, 0.4803377, 1, 1, 1, 1, 1,
0.6032912, -0.02472014, -0.02682057, 0, 0, 1, 1, 1,
0.6056728, 0.5494202, 0.09117344, 1, 0, 0, 1, 1,
0.607334, 0.8552568, 0.4847153, 1, 0, 0, 1, 1,
0.6093621, -0.3626679, 2.193189, 1, 0, 0, 1, 1,
0.6103504, -0.8926837, 2.662541, 1, 0, 0, 1, 1,
0.6120215, 0.4503462, 1.368591, 1, 0, 0, 1, 1,
0.615099, -1.759387, 1.693025, 0, 0, 0, 1, 1,
0.6180694, 0.0391729, 1.843241, 0, 0, 0, 1, 1,
0.6194184, -0.6886663, 2.300276, 0, 0, 0, 1, 1,
0.6246876, 0.02726287, 0.2691766, 0, 0, 0, 1, 1,
0.6251336, -0.9679453, 2.134783, 0, 0, 0, 1, 1,
0.6295639, 0.8106747, 1.472076, 0, 0, 0, 1, 1,
0.6353989, 0.9468024, 0.3820326, 0, 0, 0, 1, 1,
0.6403899, 0.412038, 0.467989, 1, 1, 1, 1, 1,
0.6467698, 1.562106, 0.4068597, 1, 1, 1, 1, 1,
0.6477246, -1.083447, 3.866074, 1, 1, 1, 1, 1,
0.6479617, 1.525132, -0.2621493, 1, 1, 1, 1, 1,
0.6485285, -0.5905802, 0.6294867, 1, 1, 1, 1, 1,
0.6501854, 2.319036, 0.1876097, 1, 1, 1, 1, 1,
0.6521329, 0.08468984, 2.904338, 1, 1, 1, 1, 1,
0.652848, -0.4047084, 3.364592, 1, 1, 1, 1, 1,
0.6606553, 0.8793997, 2.385125, 1, 1, 1, 1, 1,
0.6717166, -0.0240637, 0.9150176, 1, 1, 1, 1, 1,
0.6752141, -2.864271, 1.461504, 1, 1, 1, 1, 1,
0.676384, 0.0580278, 2.630586, 1, 1, 1, 1, 1,
0.6792029, 0.6409003, 0.6199319, 1, 1, 1, 1, 1,
0.6834328, -0.7224262, 2.603408, 1, 1, 1, 1, 1,
0.6860099, 0.3945004, 0.570936, 1, 1, 1, 1, 1,
0.6887204, 0.2138871, 0.7153352, 0, 0, 1, 1, 1,
0.6894684, 0.4763969, 1.194833, 1, 0, 0, 1, 1,
0.691604, 0.3692362, 0.3259141, 1, 0, 0, 1, 1,
0.6950325, -0.3732578, 1.32902, 1, 0, 0, 1, 1,
0.6973224, 0.9004263, 0.6783479, 1, 0, 0, 1, 1,
0.7002094, 0.5891314, -0.4522162, 1, 0, 0, 1, 1,
0.7008209, 2.99926, -0.1684915, 0, 0, 0, 1, 1,
0.7124695, -1.761703, 2.948401, 0, 0, 0, 1, 1,
0.7153822, 0.100354, 1.506587, 0, 0, 0, 1, 1,
0.7156592, 0.6314006, 0.1325302, 0, 0, 0, 1, 1,
0.7158007, 0.6917769, 0.1234803, 0, 0, 0, 1, 1,
0.7180471, 1.10921, 0.858379, 0, 0, 0, 1, 1,
0.7213637, 1.743451, -0.001856661, 0, 0, 0, 1, 1,
0.7247292, 0.2008289, 1.015205, 1, 1, 1, 1, 1,
0.7250915, -0.1988654, 3.003994, 1, 1, 1, 1, 1,
0.7256342, -0.8946896, 2.795964, 1, 1, 1, 1, 1,
0.7268662, -0.2517464, 3.489275, 1, 1, 1, 1, 1,
0.7281561, -1.769097, 2.352436, 1, 1, 1, 1, 1,
0.7364175, -0.7664961, 3.803689, 1, 1, 1, 1, 1,
0.7372413, 0.2374741, 3.148841, 1, 1, 1, 1, 1,
0.7376915, -0.1655176, 1.599418, 1, 1, 1, 1, 1,
0.7382098, 0.704033, 0.4486925, 1, 1, 1, 1, 1,
0.7493563, -0.6102375, 2.788672, 1, 1, 1, 1, 1,
0.7586455, 0.5117704, 1.361477, 1, 1, 1, 1, 1,
0.7703694, 0.08864709, 1.749025, 1, 1, 1, 1, 1,
0.7756646, 1.132217, 1.539803, 1, 1, 1, 1, 1,
0.7822955, -0.7056667, 3.659517, 1, 1, 1, 1, 1,
0.7830883, 0.795204, 0.1473517, 1, 1, 1, 1, 1,
0.7835116, -2.093154, 4.614368, 0, 0, 1, 1, 1,
0.7866358, 0.8562269, -0.1952374, 1, 0, 0, 1, 1,
0.7892854, 0.1788631, 1.691092, 1, 0, 0, 1, 1,
0.7893499, -1.089778, 2.070518, 1, 0, 0, 1, 1,
0.7927463, -0.5378188, 0.05685179, 1, 0, 0, 1, 1,
0.7971624, -0.6480145, 2.404221, 1, 0, 0, 1, 1,
0.8081573, -0.8263824, 1.339371, 0, 0, 0, 1, 1,
0.8082665, -0.3623244, 2.945808, 0, 0, 0, 1, 1,
0.8104263, 0.8039995, 1.233629, 0, 0, 0, 1, 1,
0.8123661, -0.9769196, 3.798254, 0, 0, 0, 1, 1,
0.8175777, 0.5678723, -0.4160593, 0, 0, 0, 1, 1,
0.8191562, 0.4805463, 0.4476118, 0, 0, 0, 1, 1,
0.8203008, -1.661166, 2.540077, 0, 0, 0, 1, 1,
0.8223926, 1.496224, 0.2267162, 1, 1, 1, 1, 1,
0.8247371, -0.9622664, 2.260119, 1, 1, 1, 1, 1,
0.8269925, 0.3055688, 1.683191, 1, 1, 1, 1, 1,
0.8270198, -0.1243079, 1.863618, 1, 1, 1, 1, 1,
0.8304724, 0.2666373, 1.437544, 1, 1, 1, 1, 1,
0.832541, -0.1401083, 1.166692, 1, 1, 1, 1, 1,
0.836067, -0.6630241, 1.464152, 1, 1, 1, 1, 1,
0.8374239, 1.217414, 0.4876076, 1, 1, 1, 1, 1,
0.8405844, -2.339767, -0.5018303, 1, 1, 1, 1, 1,
0.8422751, -1.185434, 1.370548, 1, 1, 1, 1, 1,
0.844547, 0.4246041, 3.092456, 1, 1, 1, 1, 1,
0.8530685, 0.4398711, 1.921972, 1, 1, 1, 1, 1,
0.8548109, -0.419421, 1.669071, 1, 1, 1, 1, 1,
0.8564993, 0.3458985, 1.121263, 1, 1, 1, 1, 1,
0.8582355, -0.4310637, 4.243725, 1, 1, 1, 1, 1,
0.8614316, -1.845424, 2.044089, 0, 0, 1, 1, 1,
0.8633398, -1.035074, 2.388442, 1, 0, 0, 1, 1,
0.8784935, 0.2082236, -0.4517115, 1, 0, 0, 1, 1,
0.8807391, 1.844304, 0.9660659, 1, 0, 0, 1, 1,
0.8828423, 1.86188, 1.200618, 1, 0, 0, 1, 1,
0.8862219, -1.296752, 1.82308, 1, 0, 0, 1, 1,
0.8874409, 1.708797, -0.5615017, 0, 0, 0, 1, 1,
0.8878303, 0.2402821, 1.757859, 0, 0, 0, 1, 1,
0.8882069, -0.4395183, 2.284585, 0, 0, 0, 1, 1,
0.8892034, -1.036396, 2.105699, 0, 0, 0, 1, 1,
0.889998, -0.4516076, 4.420071, 0, 0, 0, 1, 1,
0.9015574, -0.4157147, 0.9190958, 0, 0, 0, 1, 1,
0.9019231, -1.007576, 4.294006, 0, 0, 0, 1, 1,
0.90268, -0.9926797, 1.979095, 1, 1, 1, 1, 1,
0.9038869, 0.1548084, 0.1966634, 1, 1, 1, 1, 1,
0.907835, 0.2700878, 1.615117, 1, 1, 1, 1, 1,
0.9189554, 0.5028054, 1.398078, 1, 1, 1, 1, 1,
0.921282, -0.1536049, 3.870753, 1, 1, 1, 1, 1,
0.921693, -1.05559, 2.721277, 1, 1, 1, 1, 1,
0.9231154, 0.4328298, -0.5065574, 1, 1, 1, 1, 1,
0.9235268, -0.142052, 0.8136075, 1, 1, 1, 1, 1,
0.9258098, 0.3241699, -0.6822128, 1, 1, 1, 1, 1,
0.9346977, -0.9456385, 2.636874, 1, 1, 1, 1, 1,
0.9403347, 0.50811, 1.079178, 1, 1, 1, 1, 1,
0.9416023, 0.2522789, 3.002103, 1, 1, 1, 1, 1,
0.9505909, 0.002256282, 3.197589, 1, 1, 1, 1, 1,
0.9688593, 0.8915881, -0.3614531, 1, 1, 1, 1, 1,
0.9761544, 0.9432279, 0.1748396, 1, 1, 1, 1, 1,
0.9771144, -1.288297, 1.737266, 0, 0, 1, 1, 1,
0.9820295, 0.530054, 0.3518532, 1, 0, 0, 1, 1,
0.982085, -0.8565224, 1.881695, 1, 0, 0, 1, 1,
0.9827462, 0.5038989, 2.819518, 1, 0, 0, 1, 1,
0.9834813, 0.2659476, 1.339403, 1, 0, 0, 1, 1,
0.9911045, -0.8952208, 2.331759, 1, 0, 0, 1, 1,
0.9937314, -0.8778471, 0.5209955, 0, 0, 0, 1, 1,
0.9958043, -0.1536292, 2.149985, 0, 0, 0, 1, 1,
0.9964221, 0.8257907, 2.511007, 0, 0, 0, 1, 1,
0.9997287, 1.559987, -0.282652, 0, 0, 0, 1, 1,
1.000051, 2.076208, 0.09802561, 0, 0, 0, 1, 1,
1.004644, -0.899865, 2.676368, 0, 0, 0, 1, 1,
1.005175, -0.5557548, 1.493657, 0, 0, 0, 1, 1,
1.006435, -0.2071382, 1.02608, 1, 1, 1, 1, 1,
1.007698, 0.930034, -0.5170356, 1, 1, 1, 1, 1,
1.012196, -1.661267, 2.321012, 1, 1, 1, 1, 1,
1.017869, 0.3833049, 3.480081, 1, 1, 1, 1, 1,
1.024282, -0.4588276, 2.059335, 1, 1, 1, 1, 1,
1.026341, 2.297164, -2.419209, 1, 1, 1, 1, 1,
1.026804, -0.01389272, -0.4614153, 1, 1, 1, 1, 1,
1.038741, 0.3178708, 1.295223, 1, 1, 1, 1, 1,
1.044553, -1.143498, 2.918579, 1, 1, 1, 1, 1,
1.047626, 0.4222856, -0.2178555, 1, 1, 1, 1, 1,
1.052027, -0.6758006, 2.242744, 1, 1, 1, 1, 1,
1.05567, -0.4808498, 1.637337, 1, 1, 1, 1, 1,
1.06523, 1.689428, 0.1457176, 1, 1, 1, 1, 1,
1.075487, 1.595516, 1.118787, 1, 1, 1, 1, 1,
1.076354, -0.03042545, 2.056734, 1, 1, 1, 1, 1,
1.081018, 1.038668, 1.158212, 0, 0, 1, 1, 1,
1.081955, -1.306419, 3.289366, 1, 0, 0, 1, 1,
1.091492, -1.536766, 3.720595, 1, 0, 0, 1, 1,
1.097247, 0.7269052, 2.096409, 1, 0, 0, 1, 1,
1.104555, 0.988498, 0.2528508, 1, 0, 0, 1, 1,
1.110155, 0.2974472, 1.822606, 1, 0, 0, 1, 1,
1.112892, 0.3579282, 1.501602, 0, 0, 0, 1, 1,
1.113356, -0.6506882, 0.3991746, 0, 0, 0, 1, 1,
1.115918, -1.536085, 2.369772, 0, 0, 0, 1, 1,
1.117054, -0.04608491, 2.37359, 0, 0, 0, 1, 1,
1.119294, 1.329663, 1.980447, 0, 0, 0, 1, 1,
1.123899, 1.560274, 0.1090184, 0, 0, 0, 1, 1,
1.124032, -0.1772537, 1.149827, 0, 0, 0, 1, 1,
1.131106, 1.117234, 1.452066, 1, 1, 1, 1, 1,
1.137662, -1.759088, 3.287081, 1, 1, 1, 1, 1,
1.140781, 0.2757604, 2.201515, 1, 1, 1, 1, 1,
1.146032, 0.008196456, 1.26562, 1, 1, 1, 1, 1,
1.146158, -0.7099771, 1.822922, 1, 1, 1, 1, 1,
1.156582, -0.4748865, 2.573388, 1, 1, 1, 1, 1,
1.157969, 0.8083671, 2.331244, 1, 1, 1, 1, 1,
1.160683, 0.1725707, 3.494, 1, 1, 1, 1, 1,
1.160947, 1.579914, -1.068969, 1, 1, 1, 1, 1,
1.16994, -1.334131, 1.962932, 1, 1, 1, 1, 1,
1.173397, -0.1708891, 2.207499, 1, 1, 1, 1, 1,
1.191887, -1.466144, 2.981521, 1, 1, 1, 1, 1,
1.197782, 0.9675761, 0.6869999, 1, 1, 1, 1, 1,
1.215621, -1.52081, 2.892314, 1, 1, 1, 1, 1,
1.23094, 0.9457151, -0.1217663, 1, 1, 1, 1, 1,
1.233625, 0.2334412, 2.333342, 0, 0, 1, 1, 1,
1.271318, -1.265197, 2.685547, 1, 0, 0, 1, 1,
1.274913, 0.8883138, 1.697372, 1, 0, 0, 1, 1,
1.275481, -2.859165, 3.330659, 1, 0, 0, 1, 1,
1.277615, 2.438802, 0.7092613, 1, 0, 0, 1, 1,
1.285714, -0.6358534, 1.880176, 1, 0, 0, 1, 1,
1.285818, 1.186692, 0.5968702, 0, 0, 0, 1, 1,
1.288322, 0.3322325, 1.781471, 0, 0, 0, 1, 1,
1.291189, -0.4472001, 0.9798657, 0, 0, 0, 1, 1,
1.292097, -0.708539, 1.661361, 0, 0, 0, 1, 1,
1.329091, 1.363859, 1.149234, 0, 0, 0, 1, 1,
1.329143, -2.056952, 3.896239, 0, 0, 0, 1, 1,
1.334783, 0.1822403, 2.062233, 0, 0, 0, 1, 1,
1.336723, -0.8439188, 2.812365, 1, 1, 1, 1, 1,
1.339374, -0.1913844, 2.499013, 1, 1, 1, 1, 1,
1.345503, 2.151484, 1.294934, 1, 1, 1, 1, 1,
1.357252, 0.1946407, 0.8477736, 1, 1, 1, 1, 1,
1.359903, 0.06652659, 1.69079, 1, 1, 1, 1, 1,
1.360523, 0.3395382, 2.647352, 1, 1, 1, 1, 1,
1.368146, 1.542283, 1.156368, 1, 1, 1, 1, 1,
1.370053, -1.041177, 2.882505, 1, 1, 1, 1, 1,
1.374297, 0.2209483, 0.8544056, 1, 1, 1, 1, 1,
1.391619, 0.3992971, -0.9835525, 1, 1, 1, 1, 1,
1.400146, 0.3360331, 1.290478, 1, 1, 1, 1, 1,
1.400185, -1.912928, 2.516588, 1, 1, 1, 1, 1,
1.40577, 1.237548, 1.527745, 1, 1, 1, 1, 1,
1.409123, -0.8362299, 1.33174, 1, 1, 1, 1, 1,
1.409294, -0.7375647, 2.401862, 1, 1, 1, 1, 1,
1.413573, -1.418687, 2.516176, 0, 0, 1, 1, 1,
1.415264, -1.795689, 1.259088, 1, 0, 0, 1, 1,
1.424191, 1.747572, -0.01405343, 1, 0, 0, 1, 1,
1.424222, 2.092344, 1.057238, 1, 0, 0, 1, 1,
1.426897, -0.4906453, 3.31777, 1, 0, 0, 1, 1,
1.442216, -0.8340988, 2.855045, 1, 0, 0, 1, 1,
1.442249, 0.1663349, 1.529756, 0, 0, 0, 1, 1,
1.447027, -0.5611207, 0.9047544, 0, 0, 0, 1, 1,
1.45987, 0.1468078, 2.004193, 0, 0, 0, 1, 1,
1.470628, -0.2590003, 2.027044, 0, 0, 0, 1, 1,
1.475448, 1.144704, 1.934028, 0, 0, 0, 1, 1,
1.485466, 0.9864839, 2.848556, 0, 0, 0, 1, 1,
1.489501, 0.02061275, 1.130447, 0, 0, 0, 1, 1,
1.491275, 0.8996866, 1.096904, 1, 1, 1, 1, 1,
1.491499, -0.4436868, 2.69515, 1, 1, 1, 1, 1,
1.5006, 2.041698, 1.026091, 1, 1, 1, 1, 1,
1.511483, 0.9231247, -0.6072107, 1, 1, 1, 1, 1,
1.518256, -0.8731735, 0.8794267, 1, 1, 1, 1, 1,
1.523494, 0.8361655, 2.147125, 1, 1, 1, 1, 1,
1.531539, 0.5425819, 1.447825, 1, 1, 1, 1, 1,
1.535724, 0.2298066, 1.253383, 1, 1, 1, 1, 1,
1.55609, 0.6365938, 3.68618, 1, 1, 1, 1, 1,
1.560204, 1.20195, 1.796828, 1, 1, 1, 1, 1,
1.569204, -0.231326, 2.957667, 1, 1, 1, 1, 1,
1.575536, -0.6235647, 2.631053, 1, 1, 1, 1, 1,
1.580576, 0.1940259, 1.233728, 1, 1, 1, 1, 1,
1.589951, 0.445724, 1.980263, 1, 1, 1, 1, 1,
1.601189, 1.775568, 1.246426, 1, 1, 1, 1, 1,
1.607981, 1.328747, 2.134552, 0, 0, 1, 1, 1,
1.676381, -0.7273941, 3.464051, 1, 0, 0, 1, 1,
1.688667, 0.800992, -0.3512334, 1, 0, 0, 1, 1,
1.710835, 1.284179, 0.1935406, 1, 0, 0, 1, 1,
1.713073, 1.446898, 1.699131, 1, 0, 0, 1, 1,
1.713752, 0.3273164, -0.009715395, 1, 0, 0, 1, 1,
1.730572, -0.761582, 4.147723, 0, 0, 0, 1, 1,
1.732029, 0.6834878, 1.306649, 0, 0, 0, 1, 1,
1.741681, 0.3553044, 1.586476, 0, 0, 0, 1, 1,
1.746514, 2.021459, 0.8860877, 0, 0, 0, 1, 1,
1.779318, -0.9896252, 3.409868, 0, 0, 0, 1, 1,
1.780878, -0.1329009, 2.568693, 0, 0, 0, 1, 1,
1.784899, -1.224228, 2.272182, 0, 0, 0, 1, 1,
1.786989, 0.6070925, -1.194674, 1, 1, 1, 1, 1,
1.796289, 1.470799, -0.2600303, 1, 1, 1, 1, 1,
1.819846, 1.102239, 1.632472, 1, 1, 1, 1, 1,
1.844049, 0.09139273, 1.774298, 1, 1, 1, 1, 1,
1.909285, -1.227469, 3.719772, 1, 1, 1, 1, 1,
1.924819, -2.022174, 3.977168, 1, 1, 1, 1, 1,
1.954626, 0.4557602, -1.329355, 1, 1, 1, 1, 1,
1.980934, -0.7888631, 0.92755, 1, 1, 1, 1, 1,
1.993262, 0.4515913, 1.722927, 1, 1, 1, 1, 1,
1.998905, 0.0716678, 1.313766, 1, 1, 1, 1, 1,
1.999846, 0.682506, 2.641227, 1, 1, 1, 1, 1,
2.010848, -0.6071452, 0.2676016, 1, 1, 1, 1, 1,
2.0144, -0.2800798, 2.20098, 1, 1, 1, 1, 1,
2.022757, -0.4521651, 1.869536, 1, 1, 1, 1, 1,
2.025718, -0.3909229, 1.667687, 1, 1, 1, 1, 1,
2.038105, -0.2416769, 1.716388, 0, 0, 1, 1, 1,
2.06906, 0.4111779, 0.7996062, 1, 0, 0, 1, 1,
2.083818, 0.62945, 1.850726, 1, 0, 0, 1, 1,
2.121069, -0.5518878, 2.495789, 1, 0, 0, 1, 1,
2.125644, 1.426016, 0.1485724, 1, 0, 0, 1, 1,
2.16208, 1.942033, 0.8425237, 1, 0, 0, 1, 1,
2.172039, -0.3103814, 1.78195, 0, 0, 0, 1, 1,
2.230885, 0.7785082, 1.076902, 0, 0, 0, 1, 1,
2.233549, -0.389746, 2.043965, 0, 0, 0, 1, 1,
2.266021, 1.559327, -0.1717242, 0, 0, 0, 1, 1,
2.421647, 0.5423049, 2.374853, 0, 0, 0, 1, 1,
2.463013, -0.9113089, 2.300652, 0, 0, 0, 1, 1,
2.468396, -0.2553005, 0.8810735, 0, 0, 0, 1, 1,
2.549732, 0.06978846, 2.071791, 1, 1, 1, 1, 1,
2.564811, -0.1872804, 1.955435, 1, 1, 1, 1, 1,
2.609886, 0.1106471, 1.65682, 1, 1, 1, 1, 1,
2.644748, 0.4234081, 0.7945935, 1, 1, 1, 1, 1,
2.657939, 0.2225279, 2.152184, 1, 1, 1, 1, 1,
2.681558, 0.1045874, 1.444911, 1, 1, 1, 1, 1,
3.166119, 0.7241855, 0.414967, 1, 1, 1, 1, 1
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
var radius = 9.435745;
var distance = 33.14265;
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
mvMatrix.translate( -0.02555275, -0.008270144, 0.5801725 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14265);
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
