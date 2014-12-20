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
-2.8888, 0.6298989, -1.757166, 1, 0, 0, 1,
-2.870325, 0.7748659, -0.8856236, 1, 0.007843138, 0, 1,
-2.854134, 1.748067, -1.812758, 1, 0.01176471, 0, 1,
-2.722888, -0.8049706, -1.546854, 1, 0.01960784, 0, 1,
-2.680367, -1.314351, -1.816913, 1, 0.02352941, 0, 1,
-2.629973, -0.02082871, -3.3524, 1, 0.03137255, 0, 1,
-2.620178, 0.2158687, -0.338015, 1, 0.03529412, 0, 1,
-2.598042, -0.7239351, -3.145808, 1, 0.04313726, 0, 1,
-2.462689, 1.111907, -3.037219, 1, 0.04705882, 0, 1,
-2.396965, 0.2667575, -0.4393546, 1, 0.05490196, 0, 1,
-2.391973, 0.1760917, -1.840833, 1, 0.05882353, 0, 1,
-2.389482, 0.6144095, -2.435177, 1, 0.06666667, 0, 1,
-2.337337, -1.020535, -2.28379, 1, 0.07058824, 0, 1,
-2.277915, -0.1868637, -1.308783, 1, 0.07843138, 0, 1,
-2.188816, -0.1234024, -2.016567, 1, 0.08235294, 0, 1,
-2.141594, -0.05766868, -1.294678, 1, 0.09019608, 0, 1,
-2.125873, -0.09340407, -0.1556318, 1, 0.09411765, 0, 1,
-2.088982, -0.5699992, -1.013317, 1, 0.1019608, 0, 1,
-2.088239, -0.1891899, -2.662233, 1, 0.1098039, 0, 1,
-2.070772, 1.903941, -0.2037661, 1, 0.1137255, 0, 1,
-2.067963, 1.8405, -2.252079, 1, 0.1215686, 0, 1,
-2.063968, -0.3273968, -0.9245003, 1, 0.1254902, 0, 1,
-2.036531, -1.788147, -3.529502, 1, 0.1333333, 0, 1,
-1.996314, -2.122897, -2.490304, 1, 0.1372549, 0, 1,
-1.990223, 0.1200502, -0.963401, 1, 0.145098, 0, 1,
-1.983142, -1.809418, -2.410421, 1, 0.1490196, 0, 1,
-1.97973, 0.06344634, -1.696502, 1, 0.1568628, 0, 1,
-1.968726, -1.771143, -2.342489, 1, 0.1607843, 0, 1,
-1.958209, 0.8556303, 0.6229721, 1, 0.1686275, 0, 1,
-1.949933, 1.120224, -0.4314283, 1, 0.172549, 0, 1,
-1.934777, -0.1923737, -1.494105, 1, 0.1803922, 0, 1,
-1.915401, 0.2934884, -0.9152814, 1, 0.1843137, 0, 1,
-1.898087, -0.04271447, -1.477256, 1, 0.1921569, 0, 1,
-1.890953, 1.683914, -1.004445, 1, 0.1960784, 0, 1,
-1.839066, 0.5213028, 0.1080951, 1, 0.2039216, 0, 1,
-1.828129, 0.7567258, -1.169126, 1, 0.2117647, 0, 1,
-1.823937, -0.2859026, -0.207597, 1, 0.2156863, 0, 1,
-1.818642, -0.1866079, -3.881434, 1, 0.2235294, 0, 1,
-1.816478, -0.626975, -1.878137, 1, 0.227451, 0, 1,
-1.806779, 0.4855937, -0.4016351, 1, 0.2352941, 0, 1,
-1.804016, 0.3303898, -0.6285807, 1, 0.2392157, 0, 1,
-1.800967, -1.160017, -2.326933, 1, 0.2470588, 0, 1,
-1.79435, -1.197292, -1.121353, 1, 0.2509804, 0, 1,
-1.773765, -0.7773244, -2.990146, 1, 0.2588235, 0, 1,
-1.773194, 1.282933, 1.775924, 1, 0.2627451, 0, 1,
-1.756212, -0.5758908, -0.1227501, 1, 0.2705882, 0, 1,
-1.746138, 0.2216961, 0.6401901, 1, 0.2745098, 0, 1,
-1.722231, 0.3323704, -1.674964, 1, 0.282353, 0, 1,
-1.719296, 0.3796493, -1.32919, 1, 0.2862745, 0, 1,
-1.665221, 0.424284, -2.136811, 1, 0.2941177, 0, 1,
-1.664007, 3.001615, 0.6891786, 1, 0.3019608, 0, 1,
-1.63707, 2.096231, -0.0779966, 1, 0.3058824, 0, 1,
-1.631623, 1.349499, -0.6736373, 1, 0.3137255, 0, 1,
-1.622729, 0.2622398, -0.05941613, 1, 0.3176471, 0, 1,
-1.619748, 0.137639, -1.604563, 1, 0.3254902, 0, 1,
-1.61609, 1.207356, -0.3816452, 1, 0.3294118, 0, 1,
-1.610142, -0.9477269, -1.932562, 1, 0.3372549, 0, 1,
-1.594309, -1.164045, -1.47665, 1, 0.3411765, 0, 1,
-1.592656, -0.5847545, -1.882014, 1, 0.3490196, 0, 1,
-1.590252, 0.6281005, -0.03545905, 1, 0.3529412, 0, 1,
-1.578969, -1.19739, -2.062212, 1, 0.3607843, 0, 1,
-1.565604, -1.526917, -1.889361, 1, 0.3647059, 0, 1,
-1.563766, 1.737543, 0.7095474, 1, 0.372549, 0, 1,
-1.533247, -0.4835403, -0.3262118, 1, 0.3764706, 0, 1,
-1.477117, 0.5703823, -1.455544, 1, 0.3843137, 0, 1,
-1.474059, 0.8877218, -0.6151535, 1, 0.3882353, 0, 1,
-1.472142, -0.8640206, -2.690094, 1, 0.3960784, 0, 1,
-1.468494, 0.3219205, -0.7253755, 1, 0.4039216, 0, 1,
-1.466204, -0.9622642, -2.496105, 1, 0.4078431, 0, 1,
-1.465156, 0.4175024, -2.054945, 1, 0.4156863, 0, 1,
-1.462563, 0.2368137, -2.244097, 1, 0.4196078, 0, 1,
-1.456239, 1.405581, -1.139679, 1, 0.427451, 0, 1,
-1.440311, -0.8417857, -1.958119, 1, 0.4313726, 0, 1,
-1.435358, -0.3729917, -2.456284, 1, 0.4392157, 0, 1,
-1.423615, -1.044552, -0.4587502, 1, 0.4431373, 0, 1,
-1.388073, -0.8654833, -1.830793, 1, 0.4509804, 0, 1,
-1.387053, -0.7877989, -2.220692, 1, 0.454902, 0, 1,
-1.386788, 0.3685312, -2.437569, 1, 0.4627451, 0, 1,
-1.386471, -1.471406, -1.903025, 1, 0.4666667, 0, 1,
-1.381364, -0.9518042, -2.331836, 1, 0.4745098, 0, 1,
-1.379371, -0.40261, 1.256285, 1, 0.4784314, 0, 1,
-1.365936, 0.3419585, -1.027589, 1, 0.4862745, 0, 1,
-1.357774, -0.02647356, -3.083815, 1, 0.4901961, 0, 1,
-1.342562, -0.8384206, -1.36801, 1, 0.4980392, 0, 1,
-1.3314, -2.272355, -2.851983, 1, 0.5058824, 0, 1,
-1.313883, 0.2782692, -0.745657, 1, 0.509804, 0, 1,
-1.300286, 0.5191034, 1.57838, 1, 0.5176471, 0, 1,
-1.299153, 1.300472, -0.1776339, 1, 0.5215687, 0, 1,
-1.299072, -0.5278134, -2.347866, 1, 0.5294118, 0, 1,
-1.294551, -0.1390271, -1.719384, 1, 0.5333334, 0, 1,
-1.29015, -0.3834453, -2.340018, 1, 0.5411765, 0, 1,
-1.286461, -0.3003463, -1.810673, 1, 0.5450981, 0, 1,
-1.283033, 0.8108222, -0.8493989, 1, 0.5529412, 0, 1,
-1.279592, 1.475896, -0.16795, 1, 0.5568628, 0, 1,
-1.276504, -2.146628, -2.184675, 1, 0.5647059, 0, 1,
-1.272878, -2.254321, -4.056729, 1, 0.5686275, 0, 1,
-1.26826, -0.8185006, -0.04777497, 1, 0.5764706, 0, 1,
-1.25824, 2.96892, 0.7057965, 1, 0.5803922, 0, 1,
-1.252534, -1.40113, -3.159077, 1, 0.5882353, 0, 1,
-1.249067, -0.4563, -2.974048, 1, 0.5921569, 0, 1,
-1.24626, 0.4464492, 0.4870903, 1, 0.6, 0, 1,
-1.227245, 0.8353115, 0.734219, 1, 0.6078432, 0, 1,
-1.224826, 1.623404, -1.994846, 1, 0.6117647, 0, 1,
-1.224731, 1.178648, -1.624774, 1, 0.6196079, 0, 1,
-1.223527, 0.4752758, -2.518479, 1, 0.6235294, 0, 1,
-1.205451, -1.319686, 0.3617144, 1, 0.6313726, 0, 1,
-1.197677, 0.231338, 0.9377736, 1, 0.6352941, 0, 1,
-1.192263, 0.4018341, 0.5773976, 1, 0.6431373, 0, 1,
-1.175064, -1.253752, -4.272644, 1, 0.6470588, 0, 1,
-1.171191, 1.667286, -0.9850051, 1, 0.654902, 0, 1,
-1.169027, 0.2365861, -1.154723, 1, 0.6588235, 0, 1,
-1.16649, 0.3446755, -1.074427, 1, 0.6666667, 0, 1,
-1.163868, -0.07126722, -1.009678, 1, 0.6705883, 0, 1,
-1.156557, 0.5356379, 0.7877, 1, 0.6784314, 0, 1,
-1.150199, 0.916599, 0.06176591, 1, 0.682353, 0, 1,
-1.144711, -0.8485354, -2.301303, 1, 0.6901961, 0, 1,
-1.144689, -0.7935888, -2.929696, 1, 0.6941177, 0, 1,
-1.142414, 1.446203, -1.946, 1, 0.7019608, 0, 1,
-1.130454, -0.9352643, -2.715589, 1, 0.7098039, 0, 1,
-1.127752, 0.1566797, 0.4408251, 1, 0.7137255, 0, 1,
-1.115257, 2.266631, -1.408419, 1, 0.7215686, 0, 1,
-1.115212, 0.6096285, -0.5665923, 1, 0.7254902, 0, 1,
-1.112219, 1.734394, -1.357351, 1, 0.7333333, 0, 1,
-1.105618, 1.682275, -1.044742, 1, 0.7372549, 0, 1,
-1.10257, -0.830516, -1.072138, 1, 0.7450981, 0, 1,
-1.093842, -0.9660119, -2.845995, 1, 0.7490196, 0, 1,
-1.089637, 0.03829605, -1.490174, 1, 0.7568628, 0, 1,
-1.081358, 1.018542, -2.681834, 1, 0.7607843, 0, 1,
-1.074343, 1.796291, -0.8804548, 1, 0.7686275, 0, 1,
-1.072083, 0.474339, -1.059437, 1, 0.772549, 0, 1,
-1.06586, -0.7848317, -1.851725, 1, 0.7803922, 0, 1,
-1.06451, 0.2852107, -0.4624127, 1, 0.7843137, 0, 1,
-1.063821, -2.59509, -1.910125, 1, 0.7921569, 0, 1,
-1.06329, 0.5618551, -1.64187, 1, 0.7960784, 0, 1,
-1.063012, 1.41162, 0.5488577, 1, 0.8039216, 0, 1,
-1.0601, -0.5967459, -0.3857796, 1, 0.8117647, 0, 1,
-1.052591, -0.2079894, -0.8989121, 1, 0.8156863, 0, 1,
-1.051274, 1.815346, -1.954922, 1, 0.8235294, 0, 1,
-1.048084, 0.07901166, -0.0795017, 1, 0.827451, 0, 1,
-1.045578, -1.810776, -0.5326288, 1, 0.8352941, 0, 1,
-1.041884, -0.9442772, -3.53178, 1, 0.8392157, 0, 1,
-1.035589, -0.5891527, -1.469069, 1, 0.8470588, 0, 1,
-1.033374, 0.09146218, -0.7668498, 1, 0.8509804, 0, 1,
-1.031002, -0.3537056, -2.109741, 1, 0.8588235, 0, 1,
-1.020239, -1.995392, -2.345681, 1, 0.8627451, 0, 1,
-1.009017, -0.0355107, 0.398208, 1, 0.8705882, 0, 1,
-1.004755, 0.7063228, -1.803133, 1, 0.8745098, 0, 1,
-1.000278, -2.091306, -4.280497, 1, 0.8823529, 0, 1,
-0.995798, -1.396635, -1.424659, 1, 0.8862745, 0, 1,
-0.9939507, -1.000441, -3.220098, 1, 0.8941177, 0, 1,
-0.9912134, -1.130187, -1.610128, 1, 0.8980392, 0, 1,
-0.9900973, 0.5491819, -2.712904, 1, 0.9058824, 0, 1,
-0.9856173, -0.2575882, -0.5304078, 1, 0.9137255, 0, 1,
-0.9793847, 0.6554604, -1.462615, 1, 0.9176471, 0, 1,
-0.9752036, -1.281731, -3.742258, 1, 0.9254902, 0, 1,
-0.9736929, -0.1676963, -1.399667, 1, 0.9294118, 0, 1,
-0.9735222, 0.7233856, -2.153895, 1, 0.9372549, 0, 1,
-0.9649249, 1.360198, -1.751991, 1, 0.9411765, 0, 1,
-0.9564608, -0.2211614, -2.023938, 1, 0.9490196, 0, 1,
-0.9555193, 0.6380763, -2.436289, 1, 0.9529412, 0, 1,
-0.9547582, 0.342051, -1.020865, 1, 0.9607843, 0, 1,
-0.9531572, 0.3769746, -0.4137035, 1, 0.9647059, 0, 1,
-0.9504363, 2.557764, -0.7550966, 1, 0.972549, 0, 1,
-0.9452077, 2.229366, -0.0690584, 1, 0.9764706, 0, 1,
-0.9447175, -1.220612, -3.355409, 1, 0.9843137, 0, 1,
-0.9399494, -0.5779675, -2.57472, 1, 0.9882353, 0, 1,
-0.9273237, 0.3581033, 0.000224077, 1, 0.9960784, 0, 1,
-0.9231611, 0.4748943, -0.2653751, 0.9960784, 1, 0, 1,
-0.9143723, 0.156036, -2.25248, 0.9921569, 1, 0, 1,
-0.9139649, -1.572113, -1.722932, 0.9843137, 1, 0, 1,
-0.9111162, -0.5145829, -0.8657092, 0.9803922, 1, 0, 1,
-0.9067234, -1.519415, -3.515134, 0.972549, 1, 0, 1,
-0.9036087, 0.02704383, -0.4151726, 0.9686275, 1, 0, 1,
-0.8945191, -0.5129447, -2.279288, 0.9607843, 1, 0, 1,
-0.8936847, 0.6940759, -2.486903, 0.9568627, 1, 0, 1,
-0.8918295, -0.9892758, -4.115921, 0.9490196, 1, 0, 1,
-0.8904737, -0.6521471, -2.777313, 0.945098, 1, 0, 1,
-0.8879322, 1.088176, -0.1492996, 0.9372549, 1, 0, 1,
-0.8861958, 0.5030345, -0.6189899, 0.9333333, 1, 0, 1,
-0.8854007, -1.455278, -2.618962, 0.9254902, 1, 0, 1,
-0.8835884, 2.367384, 0.6218418, 0.9215686, 1, 0, 1,
-0.8818038, -1.204445, -2.147782, 0.9137255, 1, 0, 1,
-0.8817489, 0.5581387, -0.8986017, 0.9098039, 1, 0, 1,
-0.8751893, -0.4604651, -2.048899, 0.9019608, 1, 0, 1,
-0.8691844, 0.1699332, -2.73062, 0.8941177, 1, 0, 1,
-0.8687125, 0.9464567, -1.041772, 0.8901961, 1, 0, 1,
-0.8614635, -0.07968243, -2.994279, 0.8823529, 1, 0, 1,
-0.8585035, -0.4334611, -3.307297, 0.8784314, 1, 0, 1,
-0.8574662, 0.3999555, -1.669493, 0.8705882, 1, 0, 1,
-0.8552684, -0.982662, -0.2361041, 0.8666667, 1, 0, 1,
-0.853429, -0.5661654, 1.518013, 0.8588235, 1, 0, 1,
-0.8522538, -0.5705392, -2.020905, 0.854902, 1, 0, 1,
-0.8377036, 0.2787401, -1.758565, 0.8470588, 1, 0, 1,
-0.8365397, -0.3289163, -2.549013, 0.8431373, 1, 0, 1,
-0.8349214, 1.021635, -1.016491, 0.8352941, 1, 0, 1,
-0.8325957, 0.770771, -0.5777972, 0.8313726, 1, 0, 1,
-0.8275353, 0.9723296, -1.12959, 0.8235294, 1, 0, 1,
-0.826463, 0.2506925, 0.2519667, 0.8196079, 1, 0, 1,
-0.8216024, 0.1597626, -1.674732, 0.8117647, 1, 0, 1,
-0.8200968, -1.533767, -2.280383, 0.8078431, 1, 0, 1,
-0.8199648, 0.1893135, -1.442904, 0.8, 1, 0, 1,
-0.8124663, 0.6184117, -1.004295, 0.7921569, 1, 0, 1,
-0.8115994, -0.5632849, -4.513689, 0.7882353, 1, 0, 1,
-0.8108588, -0.6541722, -3.849944, 0.7803922, 1, 0, 1,
-0.8058772, 0.2300011, -0.3773902, 0.7764706, 1, 0, 1,
-0.8046415, -1.648273, -3.380912, 0.7686275, 1, 0, 1,
-0.7852474, 0.8518038, -1.663148, 0.7647059, 1, 0, 1,
-0.7828149, 0.7846755, -1.301161, 0.7568628, 1, 0, 1,
-0.780895, -1.486026, -1.160955, 0.7529412, 1, 0, 1,
-0.7808033, -1.436467, -1.745821, 0.7450981, 1, 0, 1,
-0.7758521, 1.056069, 1.46416, 0.7411765, 1, 0, 1,
-0.7696353, 0.9712954, -0.3149156, 0.7333333, 1, 0, 1,
-0.7657273, -1.331778, -1.918369, 0.7294118, 1, 0, 1,
-0.7625632, 1.345442, -1.279109, 0.7215686, 1, 0, 1,
-0.7604458, -0.6377384, -2.418194, 0.7176471, 1, 0, 1,
-0.7569793, 1.193623, -0.4146532, 0.7098039, 1, 0, 1,
-0.7546393, -0.2612057, 0.03430461, 0.7058824, 1, 0, 1,
-0.7538404, -0.09812213, -1.555629, 0.6980392, 1, 0, 1,
-0.7538251, -0.1155429, -1.707204, 0.6901961, 1, 0, 1,
-0.7533271, 1.37531, -1.376928, 0.6862745, 1, 0, 1,
-0.7467923, 1.596364, 0.2895986, 0.6784314, 1, 0, 1,
-0.7464648, -1.548639, -2.390254, 0.6745098, 1, 0, 1,
-0.7388796, -0.1843629, -1.707936, 0.6666667, 1, 0, 1,
-0.7361263, 0.4061889, -1.478206, 0.6627451, 1, 0, 1,
-0.7326285, -2.088259, -3.059006, 0.654902, 1, 0, 1,
-0.7306886, -0.0683257, -1.851189, 0.6509804, 1, 0, 1,
-0.7273665, -1.15312, -3.651034, 0.6431373, 1, 0, 1,
-0.7248268, 0.3486848, -1.982446, 0.6392157, 1, 0, 1,
-0.7174951, -1.208113, -1.700807, 0.6313726, 1, 0, 1,
-0.7162406, -1.413356, -2.669843, 0.627451, 1, 0, 1,
-0.7117031, 0.624082, 0.06479428, 0.6196079, 1, 0, 1,
-0.7095074, 0.4718266, 1.448887, 0.6156863, 1, 0, 1,
-0.7085092, -1.452143, -0.6142627, 0.6078432, 1, 0, 1,
-0.7085041, 0.7777209, 0.03258947, 0.6039216, 1, 0, 1,
-0.7066684, -0.06864255, -3.400366, 0.5960785, 1, 0, 1,
-0.7040936, -0.7255133, -1.454363, 0.5882353, 1, 0, 1,
-0.6975695, 0.4251687, -0.8964029, 0.5843138, 1, 0, 1,
-0.6934451, 0.7751473, -1.446711, 0.5764706, 1, 0, 1,
-0.689527, 0.2951941, -0.7503519, 0.572549, 1, 0, 1,
-0.6892076, -0.0866145, -1.862906, 0.5647059, 1, 0, 1,
-0.6886754, 2.299492, 0.5550579, 0.5607843, 1, 0, 1,
-0.6837426, -0.7790513, -2.711064, 0.5529412, 1, 0, 1,
-0.6834585, 0.2106591, 0.01295994, 0.5490196, 1, 0, 1,
-0.6833335, 0.404986, -0.5679958, 0.5411765, 1, 0, 1,
-0.6806925, -0.8077481, -2.326509, 0.5372549, 1, 0, 1,
-0.6773656, -1.38377, -3.940002, 0.5294118, 1, 0, 1,
-0.6768305, -0.2068579, -1.341517, 0.5254902, 1, 0, 1,
-0.6765545, -0.5313914, -2.820529, 0.5176471, 1, 0, 1,
-0.6763533, 0.8091623, -0.609463, 0.5137255, 1, 0, 1,
-0.6742692, 0.508029, 0.2421224, 0.5058824, 1, 0, 1,
-0.6585954, 1.071872, -0.004524156, 0.5019608, 1, 0, 1,
-0.6532871, -0.5779396, -1.907587, 0.4941176, 1, 0, 1,
-0.6525363, -1.336343, -1.450262, 0.4862745, 1, 0, 1,
-0.6523175, -0.16975, -2.867787, 0.4823529, 1, 0, 1,
-0.6500368, 0.3263857, -1.906747, 0.4745098, 1, 0, 1,
-0.6478987, 0.7428885, 0.5994276, 0.4705882, 1, 0, 1,
-0.6453708, -0.785985, -3.035729, 0.4627451, 1, 0, 1,
-0.6452957, -0.005861325, -0.4408761, 0.4588235, 1, 0, 1,
-0.643371, 0.604575, -0.2049878, 0.4509804, 1, 0, 1,
-0.6405741, -0.6435017, -3.139144, 0.4470588, 1, 0, 1,
-0.6287668, 1.64338, -1.589931, 0.4392157, 1, 0, 1,
-0.628204, -0.2194908, -2.821116, 0.4352941, 1, 0, 1,
-0.6277022, -0.9413504, -1.633894, 0.427451, 1, 0, 1,
-0.6250319, 1.600184, -0.9417733, 0.4235294, 1, 0, 1,
-0.6199167, -1.400185, -3.078456, 0.4156863, 1, 0, 1,
-0.6196096, -1.280824, -1.758507, 0.4117647, 1, 0, 1,
-0.6172845, -0.9524949, -0.9581484, 0.4039216, 1, 0, 1,
-0.6125626, 0.1856077, -0.6384798, 0.3960784, 1, 0, 1,
-0.6056728, -0.8927807, -2.048975, 0.3921569, 1, 0, 1,
-0.6053233, 1.646646, -0.7914949, 0.3843137, 1, 0, 1,
-0.6035926, 1.430813, -0.7871208, 0.3803922, 1, 0, 1,
-0.6004781, -0.1484944, -0.7099911, 0.372549, 1, 0, 1,
-0.6004766, -0.8278114, -2.742115, 0.3686275, 1, 0, 1,
-0.5997149, 0.9414947, 0.7604662, 0.3607843, 1, 0, 1,
-0.5975889, 1.19274, 0.7107565, 0.3568628, 1, 0, 1,
-0.5968876, 0.7757939, -0.8566635, 0.3490196, 1, 0, 1,
-0.594965, 1.012155, 1.481261, 0.345098, 1, 0, 1,
-0.593133, -0.1281225, -3.332498, 0.3372549, 1, 0, 1,
-0.5926388, -0.2652947, -2.356265, 0.3333333, 1, 0, 1,
-0.5876833, -0.1984045, -2.182876, 0.3254902, 1, 0, 1,
-0.5868561, -0.5713331, -2.023121, 0.3215686, 1, 0, 1,
-0.5866374, 0.6154649, -1.194838, 0.3137255, 1, 0, 1,
-0.5845829, 1.080538, -1.173495, 0.3098039, 1, 0, 1,
-0.5830975, 1.802269, -0.4108619, 0.3019608, 1, 0, 1,
-0.5810806, 0.5295034, 0.7299376, 0.2941177, 1, 0, 1,
-0.5736281, -1.138454, -2.528696, 0.2901961, 1, 0, 1,
-0.5735556, 0.01956031, -1.753411, 0.282353, 1, 0, 1,
-0.5725234, -0.4816146, -2.636815, 0.2784314, 1, 0, 1,
-0.5678117, 0.8003743, -1.650422, 0.2705882, 1, 0, 1,
-0.5637955, -0.4132014, -2.108865, 0.2666667, 1, 0, 1,
-0.5614747, 0.8032813, -0.7990045, 0.2588235, 1, 0, 1,
-0.5602927, 1.181139, -0.848748, 0.254902, 1, 0, 1,
-0.5523666, 0.3043587, -0.6990716, 0.2470588, 1, 0, 1,
-0.5518299, -0.5620629, -2.307974, 0.2431373, 1, 0, 1,
-0.5492694, 0.3614044, -1.350359, 0.2352941, 1, 0, 1,
-0.5484862, 0.06638189, -2.388562, 0.2313726, 1, 0, 1,
-0.5444641, -0.08477847, -2.700125, 0.2235294, 1, 0, 1,
-0.5391368, -0.2609492, -0.4896049, 0.2196078, 1, 0, 1,
-0.5365963, 0.3984703, -2.021835, 0.2117647, 1, 0, 1,
-0.5343258, -0.8333251, -3.426986, 0.2078431, 1, 0, 1,
-0.5325565, -1.429086, -3.387352, 0.2, 1, 0, 1,
-0.5305737, -0.7218524, -1.594911, 0.1921569, 1, 0, 1,
-0.5282696, -1.026223, -3.005783, 0.1882353, 1, 0, 1,
-0.5199179, 0.2686578, 0.5867501, 0.1803922, 1, 0, 1,
-0.5187619, 0.1402461, -0.7818325, 0.1764706, 1, 0, 1,
-0.5168793, -1.034475, -2.774596, 0.1686275, 1, 0, 1,
-0.5038645, 0.7550062, 0.6989473, 0.1647059, 1, 0, 1,
-0.5028339, 1.240666, 1.999524, 0.1568628, 1, 0, 1,
-0.5025755, -0.9288669, -1.324653, 0.1529412, 1, 0, 1,
-0.5008808, 1.442497, 0.2341606, 0.145098, 1, 0, 1,
-0.5003273, -0.2355146, -3.108258, 0.1411765, 1, 0, 1,
-0.4991493, 0.6446769, -2.436282, 0.1333333, 1, 0, 1,
-0.498917, -0.7415383, -2.03774, 0.1294118, 1, 0, 1,
-0.4978783, -0.07415491, -1.182974, 0.1215686, 1, 0, 1,
-0.4950418, -0.8870049, -3.102919, 0.1176471, 1, 0, 1,
-0.4903936, -0.8746341, -1.542074, 0.1098039, 1, 0, 1,
-0.488492, 0.1027877, -1.965687, 0.1058824, 1, 0, 1,
-0.4801831, 1.058211, 0.1754951, 0.09803922, 1, 0, 1,
-0.4784287, 0.6102031, -1.416337, 0.09019608, 1, 0, 1,
-0.4734321, -1.904911, -4.357187, 0.08627451, 1, 0, 1,
-0.4723348, -0.4813212, -1.471412, 0.07843138, 1, 0, 1,
-0.4690003, -0.9704586, -1.972575, 0.07450981, 1, 0, 1,
-0.4688169, -0.3111531, -0.6688787, 0.06666667, 1, 0, 1,
-0.4638216, -0.7822328, -3.108342, 0.0627451, 1, 0, 1,
-0.4628927, 0.7265272, 0.2735525, 0.05490196, 1, 0, 1,
-0.4614491, -1.471893, -1.487409, 0.05098039, 1, 0, 1,
-0.4565947, 0.9764588, 0.1005922, 0.04313726, 1, 0, 1,
-0.4544777, 0.7872418, -0.1805596, 0.03921569, 1, 0, 1,
-0.4512667, -0.3722692, -3.547965, 0.03137255, 1, 0, 1,
-0.4507253, -1.448959, -2.418633, 0.02745098, 1, 0, 1,
-0.4490244, -0.4850516, -4.254784, 0.01960784, 1, 0, 1,
-0.448876, 1.099821, -0.5943063, 0.01568628, 1, 0, 1,
-0.448093, 1.864039, 1.806821, 0.007843138, 1, 0, 1,
-0.4470753, 0.9199167, 2.281917, 0.003921569, 1, 0, 1,
-0.4457939, -0.6754516, -3.93763, 0, 1, 0.003921569, 1,
-0.444972, -0.6264726, -3.419697, 0, 1, 0.01176471, 1,
-0.438195, -0.5366585, -3.046295, 0, 1, 0.01568628, 1,
-0.4375288, -1.64346, -3.00217, 0, 1, 0.02352941, 1,
-0.4368756, -1.567755, -3.856307, 0, 1, 0.02745098, 1,
-0.4356185, 0.7249517, -2.346505, 0, 1, 0.03529412, 1,
-0.4353252, -0.1930002, -2.459579, 0, 1, 0.03921569, 1,
-0.4345035, -0.1689231, -0.5398085, 0, 1, 0.04705882, 1,
-0.4247662, -1.411173, -2.474833, 0, 1, 0.05098039, 1,
-0.4245712, 1.068037, -0.532044, 0, 1, 0.05882353, 1,
-0.4237818, -0.1028835, -1.516847, 0, 1, 0.0627451, 1,
-0.4225497, -0.7513924, -1.282048, 0, 1, 0.07058824, 1,
-0.4225105, 1.66664, 0.09316045, 0, 1, 0.07450981, 1,
-0.4195646, -0.802509, -2.751053, 0, 1, 0.08235294, 1,
-0.4104231, -0.07213261, -2.214701, 0, 1, 0.08627451, 1,
-0.4098203, 0.9137689, -0.1538946, 0, 1, 0.09411765, 1,
-0.4097576, 0.0731814, -1.101581, 0, 1, 0.1019608, 1,
-0.4076036, -0.5261124, -3.812223, 0, 1, 0.1058824, 1,
-0.4066963, 0.9618902, 0.4324671, 0, 1, 0.1137255, 1,
-0.4056331, 0.8173485, 0.2503983, 0, 1, 0.1176471, 1,
-0.4048023, 1.061329, -0.05069441, 0, 1, 0.1254902, 1,
-0.4037097, -1.552253, -2.696887, 0, 1, 0.1294118, 1,
-0.4004961, 1.00604, -0.3693806, 0, 1, 0.1372549, 1,
-0.3932396, -1.374665, -2.701795, 0, 1, 0.1411765, 1,
-0.3902104, -0.245715, -2.463986, 0, 1, 0.1490196, 1,
-0.3877916, 2.197828, -1.760975, 0, 1, 0.1529412, 1,
-0.3845708, -0.04110174, -0.7154206, 0, 1, 0.1607843, 1,
-0.3838482, -0.8774961, -4.265181, 0, 1, 0.1647059, 1,
-0.3790718, -1.256703, -1.452415, 0, 1, 0.172549, 1,
-0.3781308, -0.6846843, -2.614335, 0, 1, 0.1764706, 1,
-0.3771339, -0.5748684, -2.280087, 0, 1, 0.1843137, 1,
-0.3764051, -0.868745, -3.332215, 0, 1, 0.1882353, 1,
-0.3730192, -1.649148, -2.97894, 0, 1, 0.1960784, 1,
-0.3720567, -0.3610936, -1.931144, 0, 1, 0.2039216, 1,
-0.3718651, 0.9034858, -0.1941665, 0, 1, 0.2078431, 1,
-0.3705193, 0.1150866, -1.288449, 0, 1, 0.2156863, 1,
-0.3687116, 1.116299, -0.8307293, 0, 1, 0.2196078, 1,
-0.3643561, 0.6891146, -1.303465, 0, 1, 0.227451, 1,
-0.3629907, -0.7061313, -3.650186, 0, 1, 0.2313726, 1,
-0.362554, 0.1724124, 0.7238299, 0, 1, 0.2392157, 1,
-0.3624233, 0.4905982, -1.357793, 0, 1, 0.2431373, 1,
-0.361455, -1.422644, -4.052012, 0, 1, 0.2509804, 1,
-0.3608346, -0.3521206, -3.680112, 0, 1, 0.254902, 1,
-0.3603482, -0.6397314, -0.6672329, 0, 1, 0.2627451, 1,
-0.3573647, 0.1680267, -0.6581012, 0, 1, 0.2666667, 1,
-0.3561503, -0.135676, -0.1706855, 0, 1, 0.2745098, 1,
-0.3546158, -0.9686761, -1.438784, 0, 1, 0.2784314, 1,
-0.3500528, 1.786525, -1.512365, 0, 1, 0.2862745, 1,
-0.3471212, -1.540578, -3.948058, 0, 1, 0.2901961, 1,
-0.3460583, 0.4742794, -1.113001, 0, 1, 0.2980392, 1,
-0.3451678, -1.221625, -3.351487, 0, 1, 0.3058824, 1,
-0.3444807, -0.09945986, -0.3508993, 0, 1, 0.3098039, 1,
-0.3414251, -1.381002, -3.133769, 0, 1, 0.3176471, 1,
-0.3353511, 2.445527, 0.6135662, 0, 1, 0.3215686, 1,
-0.3315879, -0.1142677, -2.942045, 0, 1, 0.3294118, 1,
-0.3301415, -2.157685, -3.164411, 0, 1, 0.3333333, 1,
-0.3292311, -0.09191386, -1.704545, 0, 1, 0.3411765, 1,
-0.3284808, 0.05794331, -1.160141, 0, 1, 0.345098, 1,
-0.3235417, -2.171407, -3.332606, 0, 1, 0.3529412, 1,
-0.3221662, -0.02246322, -2.183975, 0, 1, 0.3568628, 1,
-0.3210097, 1.971664, 0.6626178, 0, 1, 0.3647059, 1,
-0.3174489, -0.05738582, -3.070832, 0, 1, 0.3686275, 1,
-0.3081124, -0.2154034, -1.587402, 0, 1, 0.3764706, 1,
-0.3039302, 0.5610453, 0.711267, 0, 1, 0.3803922, 1,
-0.3026154, -1.59936, -1.204067, 0, 1, 0.3882353, 1,
-0.3013638, 2.715507, -1.091774, 0, 1, 0.3921569, 1,
-0.3001702, -0.9295498, -2.367904, 0, 1, 0.4, 1,
-0.2998191, -1.362686, -2.542555, 0, 1, 0.4078431, 1,
-0.298843, -0.1800714, -0.9134806, 0, 1, 0.4117647, 1,
-0.2985194, 0.2519763, -3.290725, 0, 1, 0.4196078, 1,
-0.292978, -0.4272729, -3.036503, 0, 1, 0.4235294, 1,
-0.2924109, 0.1694469, -0.3220121, 0, 1, 0.4313726, 1,
-0.2832286, 0.3339373, -3.419895, 0, 1, 0.4352941, 1,
-0.281529, 0.1715014, -1.337505, 0, 1, 0.4431373, 1,
-0.2720388, 0.259291, -1.284823, 0, 1, 0.4470588, 1,
-0.2701463, -0.5565221, -3.565457, 0, 1, 0.454902, 1,
-0.2695274, -1.383114, -0.117727, 0, 1, 0.4588235, 1,
-0.2689986, -2.637681, -3.544447, 0, 1, 0.4666667, 1,
-0.2688329, -0.6276476, -3.564324, 0, 1, 0.4705882, 1,
-0.2678728, 0.3282843, -1.136833, 0, 1, 0.4784314, 1,
-0.2677816, -0.3361478, -3.294842, 0, 1, 0.4823529, 1,
-0.267763, -0.2936805, -2.731207, 0, 1, 0.4901961, 1,
-0.2636188, -0.1373582, -5.41789, 0, 1, 0.4941176, 1,
-0.2614707, -0.01650149, -1.936894, 0, 1, 0.5019608, 1,
-0.2598577, 0.03121573, 0.4428388, 0, 1, 0.509804, 1,
-0.253464, 0.4343151, 0.937379, 0, 1, 0.5137255, 1,
-0.2345924, 0.7884679, -0.7164494, 0, 1, 0.5215687, 1,
-0.2318188, 0.4397819, -0.3959375, 0, 1, 0.5254902, 1,
-0.2317579, -1.336002, -1.282641, 0, 1, 0.5333334, 1,
-0.2241535, -0.3385347, -2.485312, 0, 1, 0.5372549, 1,
-0.2189316, 0.2413325, -3.033043, 0, 1, 0.5450981, 1,
-0.2164759, 0.1669611, -0.318968, 0, 1, 0.5490196, 1,
-0.2133577, -0.04030306, -2.596939, 0, 1, 0.5568628, 1,
-0.2081941, 0.3964862, -0.5139477, 0, 1, 0.5607843, 1,
-0.2011538, 0.9234704, -0.6721264, 0, 1, 0.5686275, 1,
-0.1974505, -0.9568049, -1.711046, 0, 1, 0.572549, 1,
-0.1946092, -0.3606342, -1.908758, 0, 1, 0.5803922, 1,
-0.1917848, 1.782871, -1.304014, 0, 1, 0.5843138, 1,
-0.1899914, -1.043686, -2.504673, 0, 1, 0.5921569, 1,
-0.1884018, 0.4895136, 0.3852847, 0, 1, 0.5960785, 1,
-0.188131, -0.2295017, -0.9321682, 0, 1, 0.6039216, 1,
-0.1845871, 0.4012715, -0.1100183, 0, 1, 0.6117647, 1,
-0.1814286, 0.3452893, 0.4625621, 0, 1, 0.6156863, 1,
-0.179843, 0.3268524, 0.4806213, 0, 1, 0.6235294, 1,
-0.1796575, 0.6950015, -0.1836334, 0, 1, 0.627451, 1,
-0.1793758, -0.8796746, -5.56955, 0, 1, 0.6352941, 1,
-0.1777175, -2.196862, -2.795193, 0, 1, 0.6392157, 1,
-0.1775713, 0.9965736, 0.4564437, 0, 1, 0.6470588, 1,
-0.1750975, 1.560165, -0.9496579, 0, 1, 0.6509804, 1,
-0.168536, -0.6673281, -2.787489, 0, 1, 0.6588235, 1,
-0.1538002, 1.291769, -0.4764578, 0, 1, 0.6627451, 1,
-0.1445237, 0.6666815, 0.3863049, 0, 1, 0.6705883, 1,
-0.1444492, -0.6485775, -3.773506, 0, 1, 0.6745098, 1,
-0.1415062, 2.132896, 0.3525196, 0, 1, 0.682353, 1,
-0.1405164, 0.9075387, 0.1497854, 0, 1, 0.6862745, 1,
-0.138439, 0.9734517, 0.79428, 0, 1, 0.6941177, 1,
-0.1315492, 0.8200804, -0.7021471, 0, 1, 0.7019608, 1,
-0.1303862, -2.17442, -4.979433, 0, 1, 0.7058824, 1,
-0.1292041, 1.742378, -1.134366, 0, 1, 0.7137255, 1,
-0.1276035, -0.2055, -2.419115, 0, 1, 0.7176471, 1,
-0.1241383, 0.4125043, 0.6303129, 0, 1, 0.7254902, 1,
-0.1239498, 0.05639057, -0.1726826, 0, 1, 0.7294118, 1,
-0.1232799, 0.2327687, 0.8747977, 0, 1, 0.7372549, 1,
-0.1170692, -0.3506228, -2.677098, 0, 1, 0.7411765, 1,
-0.1134473, 0.1455412, -0.6448749, 0, 1, 0.7490196, 1,
-0.1066489, -0.652979, -1.437357, 0, 1, 0.7529412, 1,
-0.105549, -0.2102761, -3.681435, 0, 1, 0.7607843, 1,
-0.1035766, -1.315255, -3.999654, 0, 1, 0.7647059, 1,
-0.1025399, -1.409264, -1.703624, 0, 1, 0.772549, 1,
-0.1021057, -0.8047016, -3.907927, 0, 1, 0.7764706, 1,
-0.100666, 0.08060633, -1.281038, 0, 1, 0.7843137, 1,
-0.09187175, -1.271258, -2.052214, 0, 1, 0.7882353, 1,
-0.09042455, -1.301061, -2.835372, 0, 1, 0.7960784, 1,
-0.08409032, -0.6228451, -4.586051, 0, 1, 0.8039216, 1,
-0.0789871, -0.5197803, -2.39543, 0, 1, 0.8078431, 1,
-0.07633962, 0.9573259, 0.6688499, 0, 1, 0.8156863, 1,
-0.07621349, -0.7216661, -3.992584, 0, 1, 0.8196079, 1,
-0.07451515, -1.032455, -5.858818, 0, 1, 0.827451, 1,
-0.07422054, -0.8783799, -2.080138, 0, 1, 0.8313726, 1,
-0.07365368, -0.9145921, -5.147379, 0, 1, 0.8392157, 1,
-0.07223362, -0.5433726, -1.556393, 0, 1, 0.8431373, 1,
-0.07001016, 0.3315209, 0.09617902, 0, 1, 0.8509804, 1,
-0.06999359, 0.9727439, -0.5339314, 0, 1, 0.854902, 1,
-0.0697625, -0.9102587, -2.451253, 0, 1, 0.8627451, 1,
-0.06848846, 2.844839, -1.692836, 0, 1, 0.8666667, 1,
-0.06652507, 0.1017251, -0.328202, 0, 1, 0.8745098, 1,
-0.06532208, 0.4709108, 1.176384, 0, 1, 0.8784314, 1,
-0.06306818, -0.6160604, -1.149313, 0, 1, 0.8862745, 1,
-0.06244475, 0.03673829, -1.612195, 0, 1, 0.8901961, 1,
-0.06148997, 2.02342, 0.9171279, 0, 1, 0.8980392, 1,
-0.06050504, 1.182713, 2.891703, 0, 1, 0.9058824, 1,
-0.05981958, 1.263495, -1.097915, 0, 1, 0.9098039, 1,
-0.05964524, -0.8475928, -0.9622725, 0, 1, 0.9176471, 1,
-0.05557183, 0.7915677, 0.5120181, 0, 1, 0.9215686, 1,
-0.05540261, 1.193137, -0.3139516, 0, 1, 0.9294118, 1,
-0.05250619, -0.7323756, -2.03482, 0, 1, 0.9333333, 1,
-0.05193202, 0.9157237, -0.3943913, 0, 1, 0.9411765, 1,
-0.05017828, 1.675274, -0.8047807, 0, 1, 0.945098, 1,
-0.04225202, -0.1434351, -3.653352, 0, 1, 0.9529412, 1,
-0.04224218, 1.160339, -0.4249857, 0, 1, 0.9568627, 1,
-0.04188395, -1.116278, -2.337974, 0, 1, 0.9647059, 1,
-0.04087586, 1.037688, 1.368963, 0, 1, 0.9686275, 1,
-0.03362115, 0.6488, 1.435021, 0, 1, 0.9764706, 1,
-0.03276373, -1.33845, -3.397957, 0, 1, 0.9803922, 1,
-0.03213525, -1.194521, -3.592599, 0, 1, 0.9882353, 1,
-0.03062657, 0.02357447, -2.273496, 0, 1, 0.9921569, 1,
-0.02514461, 0.347438, 0.2992977, 0, 1, 1, 1,
-0.02144029, 1.0981, 0.1328997, 0, 0.9921569, 1, 1,
-0.020052, 1.16025, -0.3867501, 0, 0.9882353, 1, 1,
-0.02001224, -0.9352258, -2.939003, 0, 0.9803922, 1, 1,
-0.01973687, 0.05539201, 0.3627532, 0, 0.9764706, 1, 1,
-0.01759401, 0.1693301, -0.7380215, 0, 0.9686275, 1, 1,
-0.01580885, 0.5639877, 0.2416876, 0, 0.9647059, 1, 1,
-0.01498864, -0.1015438, -4.981119, 0, 0.9568627, 1, 1,
-0.01360792, -0.4717427, -4.480999, 0, 0.9529412, 1, 1,
-0.009659093, -0.7074551, -3.16865, 0, 0.945098, 1, 1,
-0.00960724, -1.515215, -3.456928, 0, 0.9411765, 1, 1,
-0.00911563, -0.4084306, -4.945899, 0, 0.9333333, 1, 1,
-0.007597129, 3.232871, -0.001081024, 0, 0.9294118, 1, 1,
-0.007492642, 0.6243462, 0.9521025, 0, 0.9215686, 1, 1,
-0.002472314, 0.8475775, 0.4016412, 0, 0.9176471, 1, 1,
-0.0002991518, -1.169677, -4.035521, 0, 0.9098039, 1, 1,
0.005420959, -0.1115697, 3.430129, 0, 0.9058824, 1, 1,
0.006388355, 1.05348, -0.7315641, 0, 0.8980392, 1, 1,
0.009573805, 0.235796, -0.4090706, 0, 0.8901961, 1, 1,
0.01819895, 0.2326728, -2.559583, 0, 0.8862745, 1, 1,
0.02364052, 0.6989694, -0.7847654, 0, 0.8784314, 1, 1,
0.0249089, 0.5294047, 1.018744, 0, 0.8745098, 1, 1,
0.02538533, -0.1898658, 2.880764, 0, 0.8666667, 1, 1,
0.02693089, -0.7233486, 1.491946, 0, 0.8627451, 1, 1,
0.02783432, 0.6433312, 0.7151294, 0, 0.854902, 1, 1,
0.02877051, -0.7107012, 5.142775, 0, 0.8509804, 1, 1,
0.0290644, 0.3500859, -0.7237095, 0, 0.8431373, 1, 1,
0.03847508, 1.017075, 0.04777912, 0, 0.8392157, 1, 1,
0.04064066, -2.064136, 2.535861, 0, 0.8313726, 1, 1,
0.05008301, -1.724138, 4.195891, 0, 0.827451, 1, 1,
0.0554479, 1.033176, -0.3334471, 0, 0.8196079, 1, 1,
0.05628093, -1.806137, 3.829597, 0, 0.8156863, 1, 1,
0.06075597, 0.04641318, -0.4033844, 0, 0.8078431, 1, 1,
0.06339619, 0.09003785, 0.9214121, 0, 0.8039216, 1, 1,
0.06724612, -1.62819, 5.238493, 0, 0.7960784, 1, 1,
0.06799442, -0.7383469, 2.688665, 0, 0.7882353, 1, 1,
0.07799049, 0.3592899, 0.4422241, 0, 0.7843137, 1, 1,
0.08462446, 0.963452, 1.222282, 0, 0.7764706, 1, 1,
0.08569041, -2.08928, 4.593458, 0, 0.772549, 1, 1,
0.08573519, 0.5446464, 0.4822679, 0, 0.7647059, 1, 1,
0.08719432, -0.5197048, 3.382162, 0, 0.7607843, 1, 1,
0.08769006, -0.6621368, 1.867306, 0, 0.7529412, 1, 1,
0.08915819, -0.6948798, 3.068445, 0, 0.7490196, 1, 1,
0.08938871, 1.146861, 0.0665123, 0, 0.7411765, 1, 1,
0.09057502, -0.6338663, 3.571019, 0, 0.7372549, 1, 1,
0.09395639, -0.1732946, 4.456767, 0, 0.7294118, 1, 1,
0.1057151, -0.4201348, 0.6577041, 0, 0.7254902, 1, 1,
0.1087021, 1.875971, 0.1662929, 0, 0.7176471, 1, 1,
0.1100283, 0.7937965, 1.044564, 0, 0.7137255, 1, 1,
0.1124545, -0.1853473, 2.23374, 0, 0.7058824, 1, 1,
0.1137851, -0.2373111, 3.42102, 0, 0.6980392, 1, 1,
0.1152204, -0.04123702, 2.449163, 0, 0.6941177, 1, 1,
0.1179282, 1.833678, -0.6839895, 0, 0.6862745, 1, 1,
0.119131, 0.8527961, 0.4018329, 0, 0.682353, 1, 1,
0.1199631, 0.3095039, 0.8813226, 0, 0.6745098, 1, 1,
0.1208995, 0.04291204, 2.343078, 0, 0.6705883, 1, 1,
0.1209497, 0.6937693, -0.2464935, 0, 0.6627451, 1, 1,
0.1214643, 0.8658203, -0.2339265, 0, 0.6588235, 1, 1,
0.1260407, 2.240324, -1.353227, 0, 0.6509804, 1, 1,
0.1293226, -0.3416406, 4.148885, 0, 0.6470588, 1, 1,
0.13006, 0.1246478, 1.599183, 0, 0.6392157, 1, 1,
0.1310088, -0.8214015, 2.348702, 0, 0.6352941, 1, 1,
0.1414501, 0.2735946, 0.1354991, 0, 0.627451, 1, 1,
0.1457534, -0.180673, 1.789248, 0, 0.6235294, 1, 1,
0.1458354, -0.2887807, 2.290296, 0, 0.6156863, 1, 1,
0.1467347, 0.4327257, 1.373294, 0, 0.6117647, 1, 1,
0.1527535, 0.5252683, -0.4983639, 0, 0.6039216, 1, 1,
0.1570215, -0.5966484, 3.713658, 0, 0.5960785, 1, 1,
0.1576468, -1.395723, 4.821805, 0, 0.5921569, 1, 1,
0.1611658, -0.5580751, 2.810393, 0, 0.5843138, 1, 1,
0.1647879, -0.03149819, 2.177428, 0, 0.5803922, 1, 1,
0.1649359, -0.8402189, 1.493588, 0, 0.572549, 1, 1,
0.1662124, -1.147068, 3.360079, 0, 0.5686275, 1, 1,
0.1676695, 0.3442318, 1.366081, 0, 0.5607843, 1, 1,
0.1688057, 0.9641266, 0.418871, 0, 0.5568628, 1, 1,
0.1719378, 2.392231, -1.876885, 0, 0.5490196, 1, 1,
0.1730073, 0.5114298, 1.075544, 0, 0.5450981, 1, 1,
0.1789385, -0.1244707, 1.80614, 0, 0.5372549, 1, 1,
0.1807294, 0.8273191, 0.7314183, 0, 0.5333334, 1, 1,
0.1882516, 0.27365, 0.2116286, 0, 0.5254902, 1, 1,
0.1899834, 0.3482884, 0.3689289, 0, 0.5215687, 1, 1,
0.1948462, 1.098481, 0.2659195, 0, 0.5137255, 1, 1,
0.199841, 1.226601, -0.0458529, 0, 0.509804, 1, 1,
0.2016207, -2.502329, 2.871569, 0, 0.5019608, 1, 1,
0.2052914, 0.488904, -1.150196, 0, 0.4941176, 1, 1,
0.2071142, 1.569836, 0.5146264, 0, 0.4901961, 1, 1,
0.2073596, 0.4653567, 1.328818, 0, 0.4823529, 1, 1,
0.2076479, -0.06898702, 0.8390484, 0, 0.4784314, 1, 1,
0.2118161, 2.297786, 0.9475448, 0, 0.4705882, 1, 1,
0.2121602, 0.07271159, 0.302796, 0, 0.4666667, 1, 1,
0.2141083, -0.9284664, 1.612495, 0, 0.4588235, 1, 1,
0.2146228, 0.9235111, 0.9462724, 0, 0.454902, 1, 1,
0.2164808, -0.6790839, 2.752383, 0, 0.4470588, 1, 1,
0.218979, 0.2018834, 1.607543, 0, 0.4431373, 1, 1,
0.2202625, 0.3221181, 0.0107025, 0, 0.4352941, 1, 1,
0.2239174, 0.09060628, 3.192666, 0, 0.4313726, 1, 1,
0.225465, 0.5302947, 0.7230559, 0, 0.4235294, 1, 1,
0.2267462, -1.837339, 2.910226, 0, 0.4196078, 1, 1,
0.227384, 0.6353484, -0.7563474, 0, 0.4117647, 1, 1,
0.2297758, 0.2629139, 1.425241, 0, 0.4078431, 1, 1,
0.2301195, 0.3784073, -0.2344664, 0, 0.4, 1, 1,
0.2319393, -0.1149845, 1.596452, 0, 0.3921569, 1, 1,
0.2326433, -0.8533977, 3.686648, 0, 0.3882353, 1, 1,
0.2352882, 1.093489, -1.508158, 0, 0.3803922, 1, 1,
0.2376453, 0.2945539, 0.7255411, 0, 0.3764706, 1, 1,
0.2399649, 0.1533259, 2.793989, 0, 0.3686275, 1, 1,
0.2405495, -0.7886584, 2.666794, 0, 0.3647059, 1, 1,
0.2413432, -2.685136, 2.725908, 0, 0.3568628, 1, 1,
0.2414121, 0.003985511, 2.217008, 0, 0.3529412, 1, 1,
0.2487263, -1.374948, 2.572645, 0, 0.345098, 1, 1,
0.2545724, 2.010477, 0.573202, 0, 0.3411765, 1, 1,
0.2552008, -0.6618548, 3.450708, 0, 0.3333333, 1, 1,
0.2583192, -1.301201, 3.783077, 0, 0.3294118, 1, 1,
0.2629834, 1.018753, -0.2163543, 0, 0.3215686, 1, 1,
0.2634563, 0.05203864, 0.122892, 0, 0.3176471, 1, 1,
0.265704, 1.118615, 1.352832, 0, 0.3098039, 1, 1,
0.2677751, 1.352463, 0.3344439, 0, 0.3058824, 1, 1,
0.2685017, -0.9680466, 2.799398, 0, 0.2980392, 1, 1,
0.2713739, -0.4773334, 1.021496, 0, 0.2901961, 1, 1,
0.2714754, 0.1765362, 1.759834, 0, 0.2862745, 1, 1,
0.2716887, -0.4827977, 3.421405, 0, 0.2784314, 1, 1,
0.2791086, -0.8092377, 1.612229, 0, 0.2745098, 1, 1,
0.284135, -1.861941, 3.583514, 0, 0.2666667, 1, 1,
0.2851924, 0.01241233, 1.17235, 0, 0.2627451, 1, 1,
0.2857975, -1.374344, 1.182841, 0, 0.254902, 1, 1,
0.2863999, -0.8333035, 2.025661, 0, 0.2509804, 1, 1,
0.2931246, 0.149817, -0.1253057, 0, 0.2431373, 1, 1,
0.2975155, 0.4997586, 1.056953, 0, 0.2392157, 1, 1,
0.2991215, 0.9716386, 0.5011809, 0, 0.2313726, 1, 1,
0.2995219, 2.101902, -0.2258424, 0, 0.227451, 1, 1,
0.2999467, 0.07102255, 0.9874523, 0, 0.2196078, 1, 1,
0.3012784, -0.2635542, 2.80213, 0, 0.2156863, 1, 1,
0.3021486, 1.654021, -1.078949, 0, 0.2078431, 1, 1,
0.3035271, 0.3223398, 1.158098, 0, 0.2039216, 1, 1,
0.3052489, -2.838295, 2.700075, 0, 0.1960784, 1, 1,
0.3089191, 0.3147235, -0.3863121, 0, 0.1882353, 1, 1,
0.3120428, -0.4942495, 1.469526, 0, 0.1843137, 1, 1,
0.3127061, 0.3447337, 1.403878, 0, 0.1764706, 1, 1,
0.3129628, 0.7486543, 0.1900609, 0, 0.172549, 1, 1,
0.3176019, -0.5905377, 1.318905, 0, 0.1647059, 1, 1,
0.3232115, -0.2988249, 2.683429, 0, 0.1607843, 1, 1,
0.3274067, -0.7976092, 4.054045, 0, 0.1529412, 1, 1,
0.3285204, 2.620903, 1.521442, 0, 0.1490196, 1, 1,
0.3308703, 0.3071896, 1.791946, 0, 0.1411765, 1, 1,
0.3431848, 0.1137776, 2.143308, 0, 0.1372549, 1, 1,
0.3443481, -0.7196225, 3.52427, 0, 0.1294118, 1, 1,
0.3449733, -0.8117067, 3.77675, 0, 0.1254902, 1, 1,
0.3546163, 0.8608625, 2.370598, 0, 0.1176471, 1, 1,
0.3568029, -0.008094015, 0.7745766, 0, 0.1137255, 1, 1,
0.3580212, 0.7615475, -0.7126805, 0, 0.1058824, 1, 1,
0.3593512, -0.6022198, 4.722138, 0, 0.09803922, 1, 1,
0.363567, 2.375019, -0.705345, 0, 0.09411765, 1, 1,
0.366522, -0.6861747, 1.290286, 0, 0.08627451, 1, 1,
0.3665967, 0.359025, 0.3733261, 0, 0.08235294, 1, 1,
0.3668431, 1.625805, 2.633118, 0, 0.07450981, 1, 1,
0.3712321, 1.84312, -1.317462, 0, 0.07058824, 1, 1,
0.3723583, 0.2399337, 1.72967, 0, 0.0627451, 1, 1,
0.3739173, 0.6786365, 0.4451631, 0, 0.05882353, 1, 1,
0.3748202, 1.305176, -0.5977303, 0, 0.05098039, 1, 1,
0.3835207, 1.975966, 0.3623712, 0, 0.04705882, 1, 1,
0.3841386, -2.106038, 4.107187, 0, 0.03921569, 1, 1,
0.3845325, 1.685284, 1.904229, 0, 0.03529412, 1, 1,
0.3892909, -0.5149415, 1.582004, 0, 0.02745098, 1, 1,
0.3918976, 0.2674545, 1.53459, 0, 0.02352941, 1, 1,
0.3929944, -0.8007894, 2.60383, 0, 0.01568628, 1, 1,
0.3931475, -0.1395134, 1.995158, 0, 0.01176471, 1, 1,
0.3952493, -0.5358561, 2.055614, 0, 0.003921569, 1, 1,
0.3958188, 0.5253141, 1.224638, 0.003921569, 0, 1, 1,
0.400047, 0.06530754, 1.248737, 0.007843138, 0, 1, 1,
0.4011352, 1.047007, -0.4679909, 0.01568628, 0, 1, 1,
0.4019069, -0.5042511, 2.032047, 0.01960784, 0, 1, 1,
0.4030113, -0.920918, 2.305975, 0.02745098, 0, 1, 1,
0.4030499, 0.6367571, 1.085465, 0.03137255, 0, 1, 1,
0.4058037, -0.5459849, 1.64692, 0.03921569, 0, 1, 1,
0.4123897, -0.05295213, 1.004986, 0.04313726, 0, 1, 1,
0.4212657, -0.3135829, 3.926091, 0.05098039, 0, 1, 1,
0.4253855, 0.7273968, -1.01941, 0.05490196, 0, 1, 1,
0.4277371, -0.5904795, 2.920682, 0.0627451, 0, 1, 1,
0.4277919, 0.6957873, -0.5668016, 0.06666667, 0, 1, 1,
0.4289273, -0.3265668, 2.800565, 0.07450981, 0, 1, 1,
0.4298392, -0.7675983, 1.941885, 0.07843138, 0, 1, 1,
0.4305983, -0.08041239, -0.4938844, 0.08627451, 0, 1, 1,
0.4308752, 0.003152887, 2.352806, 0.09019608, 0, 1, 1,
0.4324041, 0.1523329, 1.514843, 0.09803922, 0, 1, 1,
0.4349143, -2.336229, 3.124253, 0.1058824, 0, 1, 1,
0.4387909, 1.719507, 0.8127245, 0.1098039, 0, 1, 1,
0.4410239, 0.1938908, 2.675783, 0.1176471, 0, 1, 1,
0.4411452, 0.2111839, 0.5822364, 0.1215686, 0, 1, 1,
0.4433585, -1.034266, 1.989549, 0.1294118, 0, 1, 1,
0.4468429, -0.134976, 0.3294958, 0.1333333, 0, 1, 1,
0.4479055, -0.6247941, 0.4684325, 0.1411765, 0, 1, 1,
0.4529026, 0.6221824, -1.003581, 0.145098, 0, 1, 1,
0.4542767, -0.9949639, 2.195974, 0.1529412, 0, 1, 1,
0.4582918, 2.138619, 1.390966, 0.1568628, 0, 1, 1,
0.4594991, 1.608563, 1.081518, 0.1647059, 0, 1, 1,
0.4678895, 0.06966168, 2.255385, 0.1686275, 0, 1, 1,
0.4694211, -0.7025117, 2.946371, 0.1764706, 0, 1, 1,
0.4694453, -0.02785144, 1.422766, 0.1803922, 0, 1, 1,
0.4711988, -1.820674, 1.57817, 0.1882353, 0, 1, 1,
0.4721937, 0.4931842, -0.4535921, 0.1921569, 0, 1, 1,
0.4725983, -1.162864, 2.946496, 0.2, 0, 1, 1,
0.4770119, -0.2648163, 2.290115, 0.2078431, 0, 1, 1,
0.4808825, 1.344017, 0.4964689, 0.2117647, 0, 1, 1,
0.4911867, -0.5901149, 3.421307, 0.2196078, 0, 1, 1,
0.4916261, -1.048697, 4.346383, 0.2235294, 0, 1, 1,
0.4925449, -1.302, 2.338757, 0.2313726, 0, 1, 1,
0.4929094, -0.4914626, 2.591111, 0.2352941, 0, 1, 1,
0.4931782, -1.319824, 4.571766, 0.2431373, 0, 1, 1,
0.4936041, -0.4196873, 2.058547, 0.2470588, 0, 1, 1,
0.4966989, -0.2871881, 1.749125, 0.254902, 0, 1, 1,
0.4971503, 1.405714, 0.04252535, 0.2588235, 0, 1, 1,
0.4977028, 1.849199, -1.213243, 0.2666667, 0, 1, 1,
0.4993276, -0.5842714, 1.93333, 0.2705882, 0, 1, 1,
0.5131619, -0.3920522, 1.144782, 0.2784314, 0, 1, 1,
0.5149745, -0.07922122, 3.952251, 0.282353, 0, 1, 1,
0.5157889, -0.7242198, 3.629242, 0.2901961, 0, 1, 1,
0.5162737, 0.6196173, 1.874144, 0.2941177, 0, 1, 1,
0.5179371, -0.5346457, 3.408515, 0.3019608, 0, 1, 1,
0.5196288, -1.5312, 4.221855, 0.3098039, 0, 1, 1,
0.521094, -0.2970598, 3.252407, 0.3137255, 0, 1, 1,
0.5271412, -0.3941926, 2.013833, 0.3215686, 0, 1, 1,
0.5294871, 0.2501855, -0.09129588, 0.3254902, 0, 1, 1,
0.5295969, -0.06951621, 1.685236, 0.3333333, 0, 1, 1,
0.530794, 0.4584915, 2.48425, 0.3372549, 0, 1, 1,
0.5312295, 1.4695, 0.7551201, 0.345098, 0, 1, 1,
0.5316775, 0.04282203, 1.846078, 0.3490196, 0, 1, 1,
0.5345789, -0.3795177, 3.512872, 0.3568628, 0, 1, 1,
0.5368977, 1.239295, 0.8152099, 0.3607843, 0, 1, 1,
0.5371935, 0.1954017, 0.3302678, 0.3686275, 0, 1, 1,
0.5374011, 0.860182, 0.1388309, 0.372549, 0, 1, 1,
0.5397448, 1.656639, 0.1220987, 0.3803922, 0, 1, 1,
0.5411259, 1.352521, 1.109496, 0.3843137, 0, 1, 1,
0.5413309, 0.1660011, 0.8784782, 0.3921569, 0, 1, 1,
0.5421817, 0.7655011, -1.63246, 0.3960784, 0, 1, 1,
0.5429936, 1.117882, 1.700894, 0.4039216, 0, 1, 1,
0.5450098, 0.7384033, -1.164745, 0.4117647, 0, 1, 1,
0.5458393, 0.3236163, 0.9772754, 0.4156863, 0, 1, 1,
0.5465734, 0.06074962, 0.2880619, 0.4235294, 0, 1, 1,
0.5513278, 1.001554, -1.82799, 0.427451, 0, 1, 1,
0.5528111, -1.075574, 1.965183, 0.4352941, 0, 1, 1,
0.554736, 1.372872, 1.255601, 0.4392157, 0, 1, 1,
0.5593031, -1.523449, 2.449108, 0.4470588, 0, 1, 1,
0.5616675, -1.117143, 3.935306, 0.4509804, 0, 1, 1,
0.5618792, 0.7502056, -0.08132216, 0.4588235, 0, 1, 1,
0.5704037, 0.2678282, 0.05428194, 0.4627451, 0, 1, 1,
0.5741792, 2.058971, 0.3235013, 0.4705882, 0, 1, 1,
0.5761058, 0.8446349, -0.2379364, 0.4745098, 0, 1, 1,
0.5780653, 0.5208592, 1.004291, 0.4823529, 0, 1, 1,
0.587858, -1.779068, 3.105287, 0.4862745, 0, 1, 1,
0.6045727, -0.2796738, 3.913785, 0.4941176, 0, 1, 1,
0.6069646, -0.9418173, 2.307314, 0.5019608, 0, 1, 1,
0.6122826, -0.6012233, 0.7644626, 0.5058824, 0, 1, 1,
0.6141583, 0.9560963, 0.7444982, 0.5137255, 0, 1, 1,
0.6146453, -0.5897856, 1.983654, 0.5176471, 0, 1, 1,
0.6180354, -0.4753577, 1.368243, 0.5254902, 0, 1, 1,
0.6233136, -1.562373, 2.461789, 0.5294118, 0, 1, 1,
0.62959, 0.09340557, 2.327359, 0.5372549, 0, 1, 1,
0.6415718, -0.7316873, 2.630648, 0.5411765, 0, 1, 1,
0.6445168, -0.2471622, 1.104888, 0.5490196, 0, 1, 1,
0.6497502, 1.532706, 0.612998, 0.5529412, 0, 1, 1,
0.654215, -0.494879, 1.223701, 0.5607843, 0, 1, 1,
0.6620225, 0.6965483, 0.802781, 0.5647059, 0, 1, 1,
0.6632526, 1.382104, 1.103129, 0.572549, 0, 1, 1,
0.6636171, -0.2665781, 1.858774, 0.5764706, 0, 1, 1,
0.6638234, 0.4156485, 0.7005293, 0.5843138, 0, 1, 1,
0.6642854, -0.4724958, 1.689303, 0.5882353, 0, 1, 1,
0.6649854, -1.188289, 3.155157, 0.5960785, 0, 1, 1,
0.6749642, -0.44182, 3.110679, 0.6039216, 0, 1, 1,
0.6771134, 0.1840709, -0.218426, 0.6078432, 0, 1, 1,
0.6798758, -0.01505594, 2.146062, 0.6156863, 0, 1, 1,
0.6838365, -1.309363, 1.837429, 0.6196079, 0, 1, 1,
0.6840803, -0.6970986, 1.619097, 0.627451, 0, 1, 1,
0.6842136, -0.9189788, 2.42744, 0.6313726, 0, 1, 1,
0.6843868, -0.2684183, -0.1436317, 0.6392157, 0, 1, 1,
0.6849377, -0.6971635, 1.228685, 0.6431373, 0, 1, 1,
0.6852273, 0.2898802, 2.47533, 0.6509804, 0, 1, 1,
0.6864285, -2.138314, 3.307527, 0.654902, 0, 1, 1,
0.6898893, 2.588072, -0.5674997, 0.6627451, 0, 1, 1,
0.6958869, -0.5886583, 2.915032, 0.6666667, 0, 1, 1,
0.7059392, -0.3636664, 3.010082, 0.6745098, 0, 1, 1,
0.7111615, 0.2450957, 1.350229, 0.6784314, 0, 1, 1,
0.7122676, -0.4779262, 1.475142, 0.6862745, 0, 1, 1,
0.7187255, 0.8806753, 0.4191638, 0.6901961, 0, 1, 1,
0.7204539, -1.428306, 4.254917, 0.6980392, 0, 1, 1,
0.7247699, -1.88072, 2.747722, 0.7058824, 0, 1, 1,
0.725284, 0.3213566, 1.391068, 0.7098039, 0, 1, 1,
0.7277603, -0.6585432, 2.785819, 0.7176471, 0, 1, 1,
0.7458539, 1.663338, -0.8863444, 0.7215686, 0, 1, 1,
0.7460841, -0.4487448, 1.706062, 0.7294118, 0, 1, 1,
0.7524553, -0.9523586, 2.036549, 0.7333333, 0, 1, 1,
0.7554989, 0.8561804, 1.146593, 0.7411765, 0, 1, 1,
0.756644, -1.692503, 3.664845, 0.7450981, 0, 1, 1,
0.7648213, 1.934136, 1.127254, 0.7529412, 0, 1, 1,
0.7652434, -0.8890318, 3.571936, 0.7568628, 0, 1, 1,
0.767068, -1.964253, 2.479315, 0.7647059, 0, 1, 1,
0.7674449, 0.4866268, 1.610872, 0.7686275, 0, 1, 1,
0.785515, 0.6349303, -1.54414, 0.7764706, 0, 1, 1,
0.7868645, -0.4634118, 2.413917, 0.7803922, 0, 1, 1,
0.7926244, -0.9198756, 4.187601, 0.7882353, 0, 1, 1,
0.792905, -0.05167168, 2.458254, 0.7921569, 0, 1, 1,
0.8005201, 0.04159132, -0.4673767, 0.8, 0, 1, 1,
0.8096037, 0.2096812, 1.970677, 0.8078431, 0, 1, 1,
0.810547, -1.112534, 5.2069, 0.8117647, 0, 1, 1,
0.8259259, -1.925063, 2.162425, 0.8196079, 0, 1, 1,
0.8269049, 0.3354096, -1.701282, 0.8235294, 0, 1, 1,
0.828732, 1.494558, 1.691894, 0.8313726, 0, 1, 1,
0.8372565, -1.739157, 2.887646, 0.8352941, 0, 1, 1,
0.8428985, 0.6645056, 1.648289, 0.8431373, 0, 1, 1,
0.8524657, -0.4914811, 2.408944, 0.8470588, 0, 1, 1,
0.8622789, -0.4086573, 3.589603, 0.854902, 0, 1, 1,
0.863034, -1.285192, 3.990282, 0.8588235, 0, 1, 1,
0.8630729, -0.02659558, 1.882816, 0.8666667, 0, 1, 1,
0.8631768, -1.413859, 2.002861, 0.8705882, 0, 1, 1,
0.864519, -1.25999, 2.601393, 0.8784314, 0, 1, 1,
0.8656423, 0.9841725, -0.4994009, 0.8823529, 0, 1, 1,
0.8690706, 1.16081, -0.2268151, 0.8901961, 0, 1, 1,
0.8751013, -0.1598062, 0.7194731, 0.8941177, 0, 1, 1,
0.8814503, 0.2434171, 0.4911661, 0.9019608, 0, 1, 1,
0.8864596, 1.586443, 1.646721, 0.9098039, 0, 1, 1,
0.8912422, 1.29739, 2.097455, 0.9137255, 0, 1, 1,
0.9003235, -1.421389, 2.804326, 0.9215686, 0, 1, 1,
0.9009774, -2.560486, 3.527678, 0.9254902, 0, 1, 1,
0.9046981, 0.06380542, 0.2216954, 0.9333333, 0, 1, 1,
0.9072727, 0.3126816, 1.296495, 0.9372549, 0, 1, 1,
0.9184195, -1.176218, 3.123183, 0.945098, 0, 1, 1,
0.9195815, 0.7260233, -0.1286185, 0.9490196, 0, 1, 1,
0.920519, -0.4240259, 2.789058, 0.9568627, 0, 1, 1,
0.925531, -0.3596604, 1.643586, 0.9607843, 0, 1, 1,
0.9298771, 0.00896387, 1.461985, 0.9686275, 0, 1, 1,
0.9309918, -0.03149844, 3.209373, 0.972549, 0, 1, 1,
0.9429816, 2.235707, -0.5982535, 0.9803922, 0, 1, 1,
0.9430275, -1.456078, 0.7780952, 0.9843137, 0, 1, 1,
0.9612198, -1.172497, 1.504202, 0.9921569, 0, 1, 1,
0.9625212, -1.266951, 3.351067, 0.9960784, 0, 1, 1,
0.9639236, -0.9229547, 3.811133, 1, 0, 0.9960784, 1,
0.964022, -1.184305, 1.87044, 1, 0, 0.9882353, 1,
0.9762052, -3.34736, 3.138872, 1, 0, 0.9843137, 1,
0.9871253, 0.1397369, 1.348973, 1, 0, 0.9764706, 1,
0.9910307, -1.570395, 3.3381, 1, 0, 0.972549, 1,
0.9917405, -0.5640173, 2.687145, 1, 0, 0.9647059, 1,
0.9928542, -0.5507769, 2.552096, 1, 0, 0.9607843, 1,
0.9936904, -0.5669329, 2.416395, 1, 0, 0.9529412, 1,
0.994731, 1.284092, 0.7659761, 1, 0, 0.9490196, 1,
1.002518, 0.08478013, 1.914488, 1, 0, 0.9411765, 1,
1.016148, -0.1253897, 1.970964, 1, 0, 0.9372549, 1,
1.020247, 1.988991, 0.2180139, 1, 0, 0.9294118, 1,
1.025915, 1.382488, 0.821812, 1, 0, 0.9254902, 1,
1.032586, -0.7442386, 4.40275, 1, 0, 0.9176471, 1,
1.034839, -1.684216, 0.8591371, 1, 0, 0.9137255, 1,
1.058, -0.3700411, 3.053399, 1, 0, 0.9058824, 1,
1.059881, 0.2089752, 2.303604, 1, 0, 0.9019608, 1,
1.062219, -0.4572263, 1.841959, 1, 0, 0.8941177, 1,
1.064085, -1.404528, 1.773848, 1, 0, 0.8862745, 1,
1.070651, 1.064636, 1.367079, 1, 0, 0.8823529, 1,
1.074244, -0.4154041, 2.498139, 1, 0, 0.8745098, 1,
1.086329, 0.3153609, 2.151157, 1, 0, 0.8705882, 1,
1.088983, 1.444684, -0.1248829, 1, 0, 0.8627451, 1,
1.089749, -0.8403346, 2.913893, 1, 0, 0.8588235, 1,
1.094944, -0.362713, 0.7252413, 1, 0, 0.8509804, 1,
1.095367, 0.2775781, 0.1401267, 1, 0, 0.8470588, 1,
1.096369, -0.6312234, 1.522193, 1, 0, 0.8392157, 1,
1.097387, -1.127879, 2.581889, 1, 0, 0.8352941, 1,
1.10377, -0.2170273, 1.87215, 1, 0, 0.827451, 1,
1.108067, -0.9585701, 3.862864, 1, 0, 0.8235294, 1,
1.110215, -2.445476, 2.626342, 1, 0, 0.8156863, 1,
1.113049, 0.2938931, 0.4434491, 1, 0, 0.8117647, 1,
1.118381, 0.9460462, -0.0382024, 1, 0, 0.8039216, 1,
1.121494, -0.8364472, 1.659801, 1, 0, 0.7960784, 1,
1.12593, 0.957132, 2.270268, 1, 0, 0.7921569, 1,
1.137013, 0.2213741, 2.562188, 1, 0, 0.7843137, 1,
1.142841, -1.75956, 2.371188, 1, 0, 0.7803922, 1,
1.145293, -1.735006, 4.416352, 1, 0, 0.772549, 1,
1.156233, -0.408473, 2.523956, 1, 0, 0.7686275, 1,
1.170603, 0.7804413, 1.125202, 1, 0, 0.7607843, 1,
1.180627, 1.173351, -0.1228801, 1, 0, 0.7568628, 1,
1.183982, 1.473584, 0.6352188, 1, 0, 0.7490196, 1,
1.187454, 0.569355, 2.249866, 1, 0, 0.7450981, 1,
1.193756, -1.68066, 2.924017, 1, 0, 0.7372549, 1,
1.193921, 1.181437, 0.7026098, 1, 0, 0.7333333, 1,
1.201326, 0.7457002, 0.5127301, 1, 0, 0.7254902, 1,
1.202475, -0.6204255, 3.172021, 1, 0, 0.7215686, 1,
1.210114, -0.496016, 0.4662629, 1, 0, 0.7137255, 1,
1.218541, 0.292822, 0.2200771, 1, 0, 0.7098039, 1,
1.221249, -0.6559256, 0.5736635, 1, 0, 0.7019608, 1,
1.224298, 0.401211, 1.384145, 1, 0, 0.6941177, 1,
1.228314, -0.7856927, 1.332041, 1, 0, 0.6901961, 1,
1.229184, 0.2603002, 0.6440314, 1, 0, 0.682353, 1,
1.231245, 1.139776, 2.027908, 1, 0, 0.6784314, 1,
1.231497, -1.339639, 2.617678, 1, 0, 0.6705883, 1,
1.243613, 0.7980354, 1.164297, 1, 0, 0.6666667, 1,
1.245246, -0.4653735, 2.074435, 1, 0, 0.6588235, 1,
1.246155, 1.32513, 0.7082773, 1, 0, 0.654902, 1,
1.249473, -0.4861934, 3.299959, 1, 0, 0.6470588, 1,
1.257752, 1.36544, -0.2343405, 1, 0, 0.6431373, 1,
1.261555, -1.759218, 1.781301, 1, 0, 0.6352941, 1,
1.273997, 2.100018, -0.915246, 1, 0, 0.6313726, 1,
1.274455, -0.01510101, 1.610426, 1, 0, 0.6235294, 1,
1.29731, 0.1756695, 1.291006, 1, 0, 0.6196079, 1,
1.299714, 0.4675346, 1.983203, 1, 0, 0.6117647, 1,
1.305658, 0.8190044, 1.502907, 1, 0, 0.6078432, 1,
1.317366, -0.8473667, 0.6937408, 1, 0, 0.6, 1,
1.317966, 0.9156289, 0.7938244, 1, 0, 0.5921569, 1,
1.323045, 0.3044699, 1.091372, 1, 0, 0.5882353, 1,
1.327873, -1.130382, 2.251328, 1, 0, 0.5803922, 1,
1.335746, -0.05611566, 1.491591, 1, 0, 0.5764706, 1,
1.340877, -1.663844, 4.389996, 1, 0, 0.5686275, 1,
1.343329, -0.5559234, 2.520884, 1, 0, 0.5647059, 1,
1.353301, -0.4141946, 1.684039, 1, 0, 0.5568628, 1,
1.353332, -2.053485, 2.692591, 1, 0, 0.5529412, 1,
1.355023, 0.3427422, 2.479632, 1, 0, 0.5450981, 1,
1.355824, 0.9438634, -0.2129572, 1, 0, 0.5411765, 1,
1.358918, -1.007305, 1.673635, 1, 0, 0.5333334, 1,
1.368568, 0.8179765, 1.069661, 1, 0, 0.5294118, 1,
1.378401, 2.330854, -0.959996, 1, 0, 0.5215687, 1,
1.383975, 0.2818567, 1.910928, 1, 0, 0.5176471, 1,
1.388089, -1.204482, 2.952502, 1, 0, 0.509804, 1,
1.406918, -0.06883764, 1.15729, 1, 0, 0.5058824, 1,
1.426717, 0.8318073, 0.9033512, 1, 0, 0.4980392, 1,
1.432093, -1.577933, 2.475475, 1, 0, 0.4901961, 1,
1.437186, -1.391017, 3.56, 1, 0, 0.4862745, 1,
1.438188, -0.5191654, 2.226085, 1, 0, 0.4784314, 1,
1.441967, 0.3160557, 0.8521081, 1, 0, 0.4745098, 1,
1.443305, 1.615501, 1.813051, 1, 0, 0.4666667, 1,
1.457929, -1.461721, 1.186022, 1, 0, 0.4627451, 1,
1.458324, -1.23339, 2.72596, 1, 0, 0.454902, 1,
1.459391, 0.6201443, 2.133595, 1, 0, 0.4509804, 1,
1.460701, -0.05201007, 0.3290214, 1, 0, 0.4431373, 1,
1.464623, -0.2049805, 2.373912, 1, 0, 0.4392157, 1,
1.476703, 0.3276377, 0.5002976, 1, 0, 0.4313726, 1,
1.493939, 1.194428, 1.843227, 1, 0, 0.427451, 1,
1.501522, 1.963524, -0.3378, 1, 0, 0.4196078, 1,
1.510663, -0.05366729, 0.8228256, 1, 0, 0.4156863, 1,
1.517906, -0.9971904, 2.007535, 1, 0, 0.4078431, 1,
1.53585, 1.598109, 0.02225732, 1, 0, 0.4039216, 1,
1.55585, -0.2615337, 2.369328, 1, 0, 0.3960784, 1,
1.560991, -1.371068, 3.959874, 1, 0, 0.3882353, 1,
1.588361, 0.1712916, 0.3693245, 1, 0, 0.3843137, 1,
1.593081, 0.2624037, 2.315799, 1, 0, 0.3764706, 1,
1.60333, 0.4672395, 0.8938166, 1, 0, 0.372549, 1,
1.605163, -2.310815, 3.552728, 1, 0, 0.3647059, 1,
1.62048, -0.372069, 1.656933, 1, 0, 0.3607843, 1,
1.62232, 0.8802479, 0.252724, 1, 0, 0.3529412, 1,
1.631137, -0.5790731, 1.02639, 1, 0, 0.3490196, 1,
1.633502, 0.8279823, -0.4792714, 1, 0, 0.3411765, 1,
1.639956, -0.5030004, 0.5948905, 1, 0, 0.3372549, 1,
1.641414, -0.9099352, 1.069332, 1, 0, 0.3294118, 1,
1.649675, -0.334366, 1.266634, 1, 0, 0.3254902, 1,
1.65061, 1.504485, 0.04825735, 1, 0, 0.3176471, 1,
1.6715, -0.3163863, 0.9528376, 1, 0, 0.3137255, 1,
1.671504, -0.910544, 2.482974, 1, 0, 0.3058824, 1,
1.678061, -2.581312, 2.644649, 1, 0, 0.2980392, 1,
1.689633, -0.7590772, 1.425092, 1, 0, 0.2941177, 1,
1.692331, -2.269068, 3.291568, 1, 0, 0.2862745, 1,
1.702618, 0.6340241, 1.101129, 1, 0, 0.282353, 1,
1.708581, -1.744323, 1.921549, 1, 0, 0.2745098, 1,
1.720009, -0.6299033, 0.3476083, 1, 0, 0.2705882, 1,
1.724529, -0.9078503, 3.656682, 1, 0, 0.2627451, 1,
1.733272, 0.9480183, 1.154938, 1, 0, 0.2588235, 1,
1.738057, -0.2322113, 1.031403, 1, 0, 0.2509804, 1,
1.75556, 1.855852, 1.495238, 1, 0, 0.2470588, 1,
1.758609, -0.178469, 0.02045427, 1, 0, 0.2392157, 1,
1.788352, -1.670083, 3.1631, 1, 0, 0.2352941, 1,
1.790754, 0.06928531, 2.812989, 1, 0, 0.227451, 1,
1.800506, 1.340874, -1.236655, 1, 0, 0.2235294, 1,
1.805615, 0.0003633928, 1.904417, 1, 0, 0.2156863, 1,
1.81963, -1.076069, 1.816459, 1, 0, 0.2117647, 1,
1.823263, 1.336879, -0.04573199, 1, 0, 0.2039216, 1,
1.826071, 0.0100172, 0.7940012, 1, 0, 0.1960784, 1,
1.838925, -1.066163, 3.494678, 1, 0, 0.1921569, 1,
1.849778, -0.5415418, 2.880008, 1, 0, 0.1843137, 1,
1.85413, 0.750907, 1.95096, 1, 0, 0.1803922, 1,
1.863397, -1.658245, 3.208693, 1, 0, 0.172549, 1,
1.865957, -1.068088, 3.742616, 1, 0, 0.1686275, 1,
1.868049, 2.396527, 0.0207688, 1, 0, 0.1607843, 1,
1.926561, 0.6513014, 1.904171, 1, 0, 0.1568628, 1,
1.958938, 0.113265, 0.8538147, 1, 0, 0.1490196, 1,
1.959492, -1.197883, 3.385476, 1, 0, 0.145098, 1,
1.963414, -0.5931191, 2.891066, 1, 0, 0.1372549, 1,
1.974111, -0.06314658, 2.858117, 1, 0, 0.1333333, 1,
1.981101, 1.898674, 2.658674, 1, 0, 0.1254902, 1,
2.027994, -0.5271425, 1.683651, 1, 0, 0.1215686, 1,
2.045483, 0.8408587, -1.393967, 1, 0, 0.1137255, 1,
2.089677, 0.1531195, 0.2048093, 1, 0, 0.1098039, 1,
2.099505, 0.198531, 1.071692, 1, 0, 0.1019608, 1,
2.138345, -0.3968631, 2.189607, 1, 0, 0.09411765, 1,
2.143652, 0.1884631, 1.815537, 1, 0, 0.09019608, 1,
2.246296, 0.6476539, 1.724419, 1, 0, 0.08235294, 1,
2.250271, -1.381626, 2.24737, 1, 0, 0.07843138, 1,
2.27591, -1.189085, 2.408281, 1, 0, 0.07058824, 1,
2.279326, -0.3821553, 1.824214, 1, 0, 0.06666667, 1,
2.395966, 0.6056084, 1.780949, 1, 0, 0.05882353, 1,
2.501757, -1.339525, 1.126248, 1, 0, 0.05490196, 1,
2.58776, -0.8836234, 1.100342, 1, 0, 0.04705882, 1,
2.622846, -1.706398, 3.175975, 1, 0, 0.04313726, 1,
2.656875, 0.9190248, -0.8277246, 1, 0, 0.03529412, 1,
2.702203, 0.8773742, 1.550651, 1, 0, 0.03137255, 1,
2.739012, -0.7780336, 3.690028, 1, 0, 0.02352941, 1,
2.867818, -1.807147, -0.3920922, 1, 0, 0.01960784, 1,
2.982825, -0.7401983, 1.96289, 1, 0, 0.01176471, 1,
3.440864, 0.4115043, 1.636127, 1, 0, 0.007843138, 1
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
0.276032, -4.462709, -7.739812, 0, -0.5, 0.5, 0.5,
0.276032, -4.462709, -7.739812, 1, -0.5, 0.5, 0.5,
0.276032, -4.462709, -7.739812, 1, 1.5, 0.5, 0.5,
0.276032, -4.462709, -7.739812, 0, 1.5, 0.5, 0.5
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
-3.961678, -0.05724454, -7.739812, 0, -0.5, 0.5, 0.5,
-3.961678, -0.05724454, -7.739812, 1, -0.5, 0.5, 0.5,
-3.961678, -0.05724454, -7.739812, 1, 1.5, 0.5, 0.5,
-3.961678, -0.05724454, -7.739812, 0, 1.5, 0.5, 0.5
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
-3.961678, -4.462709, -0.3101625, 0, -0.5, 0.5, 0.5,
-3.961678, -4.462709, -0.3101625, 1, -0.5, 0.5, 0.5,
-3.961678, -4.462709, -0.3101625, 1, 1.5, 0.5, 0.5,
-3.961678, -4.462709, -0.3101625, 0, 1.5, 0.5, 0.5
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
-2, -3.446064, -6.025278,
3, -3.446064, -6.025278,
-2, -3.446064, -6.025278,
-2, -3.615505, -6.311033,
-1, -3.446064, -6.025278,
-1, -3.615505, -6.311033,
0, -3.446064, -6.025278,
0, -3.615505, -6.311033,
1, -3.446064, -6.025278,
1, -3.615505, -6.311033,
2, -3.446064, -6.025278,
2, -3.615505, -6.311033,
3, -3.446064, -6.025278,
3, -3.615505, -6.311033
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
-2, -3.954387, -6.882545, 0, -0.5, 0.5, 0.5,
-2, -3.954387, -6.882545, 1, -0.5, 0.5, 0.5,
-2, -3.954387, -6.882545, 1, 1.5, 0.5, 0.5,
-2, -3.954387, -6.882545, 0, 1.5, 0.5, 0.5,
-1, -3.954387, -6.882545, 0, -0.5, 0.5, 0.5,
-1, -3.954387, -6.882545, 1, -0.5, 0.5, 0.5,
-1, -3.954387, -6.882545, 1, 1.5, 0.5, 0.5,
-1, -3.954387, -6.882545, 0, 1.5, 0.5, 0.5,
0, -3.954387, -6.882545, 0, -0.5, 0.5, 0.5,
0, -3.954387, -6.882545, 1, -0.5, 0.5, 0.5,
0, -3.954387, -6.882545, 1, 1.5, 0.5, 0.5,
0, -3.954387, -6.882545, 0, 1.5, 0.5, 0.5,
1, -3.954387, -6.882545, 0, -0.5, 0.5, 0.5,
1, -3.954387, -6.882545, 1, -0.5, 0.5, 0.5,
1, -3.954387, -6.882545, 1, 1.5, 0.5, 0.5,
1, -3.954387, -6.882545, 0, 1.5, 0.5, 0.5,
2, -3.954387, -6.882545, 0, -0.5, 0.5, 0.5,
2, -3.954387, -6.882545, 1, -0.5, 0.5, 0.5,
2, -3.954387, -6.882545, 1, 1.5, 0.5, 0.5,
2, -3.954387, -6.882545, 0, 1.5, 0.5, 0.5,
3, -3.954387, -6.882545, 0, -0.5, 0.5, 0.5,
3, -3.954387, -6.882545, 1, -0.5, 0.5, 0.5,
3, -3.954387, -6.882545, 1, 1.5, 0.5, 0.5,
3, -3.954387, -6.882545, 0, 1.5, 0.5, 0.5
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
-2.983745, -3, -6.025278,
-2.983745, 3, -6.025278,
-2.983745, -3, -6.025278,
-3.146734, -3, -6.311033,
-2.983745, -2, -6.025278,
-3.146734, -2, -6.311033,
-2.983745, -1, -6.025278,
-3.146734, -1, -6.311033,
-2.983745, 0, -6.025278,
-3.146734, 0, -6.311033,
-2.983745, 1, -6.025278,
-3.146734, 1, -6.311033,
-2.983745, 2, -6.025278,
-3.146734, 2, -6.311033,
-2.983745, 3, -6.025278,
-3.146734, 3, -6.311033
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
-3.472712, -3, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, -3, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, -3, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, -3, -6.882545, 0, 1.5, 0.5, 0.5,
-3.472712, -2, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, -2, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, -2, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, -2, -6.882545, 0, 1.5, 0.5, 0.5,
-3.472712, -1, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, -1, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, -1, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, -1, -6.882545, 0, 1.5, 0.5, 0.5,
-3.472712, 0, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, 0, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, 0, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, 0, -6.882545, 0, 1.5, 0.5, 0.5,
-3.472712, 1, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, 1, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, 1, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, 1, -6.882545, 0, 1.5, 0.5, 0.5,
-3.472712, 2, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, 2, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, 2, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, 2, -6.882545, 0, 1.5, 0.5, 0.5,
-3.472712, 3, -6.882545, 0, -0.5, 0.5, 0.5,
-3.472712, 3, -6.882545, 1, -0.5, 0.5, 0.5,
-3.472712, 3, -6.882545, 1, 1.5, 0.5, 0.5,
-3.472712, 3, -6.882545, 0, 1.5, 0.5, 0.5
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
-2.983745, -3.446064, -4,
-2.983745, -3.446064, 4,
-2.983745, -3.446064, -4,
-3.146734, -3.615505, -4,
-2.983745, -3.446064, -2,
-3.146734, -3.615505, -2,
-2.983745, -3.446064, 0,
-3.146734, -3.615505, 0,
-2.983745, -3.446064, 2,
-3.146734, -3.615505, 2,
-2.983745, -3.446064, 4,
-3.146734, -3.615505, 4
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
-3.472712, -3.954387, -4, 0, -0.5, 0.5, 0.5,
-3.472712, -3.954387, -4, 1, -0.5, 0.5, 0.5,
-3.472712, -3.954387, -4, 1, 1.5, 0.5, 0.5,
-3.472712, -3.954387, -4, 0, 1.5, 0.5, 0.5,
-3.472712, -3.954387, -2, 0, -0.5, 0.5, 0.5,
-3.472712, -3.954387, -2, 1, -0.5, 0.5, 0.5,
-3.472712, -3.954387, -2, 1, 1.5, 0.5, 0.5,
-3.472712, -3.954387, -2, 0, 1.5, 0.5, 0.5,
-3.472712, -3.954387, 0, 0, -0.5, 0.5, 0.5,
-3.472712, -3.954387, 0, 1, -0.5, 0.5, 0.5,
-3.472712, -3.954387, 0, 1, 1.5, 0.5, 0.5,
-3.472712, -3.954387, 0, 0, 1.5, 0.5, 0.5,
-3.472712, -3.954387, 2, 0, -0.5, 0.5, 0.5,
-3.472712, -3.954387, 2, 1, -0.5, 0.5, 0.5,
-3.472712, -3.954387, 2, 1, 1.5, 0.5, 0.5,
-3.472712, -3.954387, 2, 0, 1.5, 0.5, 0.5,
-3.472712, -3.954387, 4, 0, -0.5, 0.5, 0.5,
-3.472712, -3.954387, 4, 1, -0.5, 0.5, 0.5,
-3.472712, -3.954387, 4, 1, 1.5, 0.5, 0.5,
-3.472712, -3.954387, 4, 0, 1.5, 0.5, 0.5
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
-2.983745, -3.446064, -6.025278,
-2.983745, 3.331575, -6.025278,
-2.983745, -3.446064, 5.404953,
-2.983745, 3.331575, 5.404953,
-2.983745, -3.446064, -6.025278,
-2.983745, -3.446064, 5.404953,
-2.983745, 3.331575, -6.025278,
-2.983745, 3.331575, 5.404953,
-2.983745, -3.446064, -6.025278,
3.535809, -3.446064, -6.025278,
-2.983745, -3.446064, 5.404953,
3.535809, -3.446064, 5.404953,
-2.983745, 3.331575, -6.025278,
3.535809, 3.331575, -6.025278,
-2.983745, 3.331575, 5.404953,
3.535809, 3.331575, 5.404953,
3.535809, -3.446064, -6.025278,
3.535809, 3.331575, -6.025278,
3.535809, -3.446064, 5.404953,
3.535809, 3.331575, 5.404953,
3.535809, -3.446064, -6.025278,
3.535809, -3.446064, 5.404953,
3.535809, 3.331575, -6.025278,
3.535809, 3.331575, 5.404953
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
var radius = 7.903835;
var distance = 35.16506;
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
mvMatrix.translate( -0.276032, 0.05724454, 0.3101625 );
mvMatrix.scale( 1.310792, 1.260879, 0.7476473 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16506);
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
isoprothiolane<-read.table("isoprothiolane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoprothiolane$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
```

```r
y<-isoprothiolane$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
```

```r
z<-isoprothiolane$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
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
-2.8888, 0.6298989, -1.757166, 0, 0, 1, 1, 1,
-2.870325, 0.7748659, -0.8856236, 1, 0, 0, 1, 1,
-2.854134, 1.748067, -1.812758, 1, 0, 0, 1, 1,
-2.722888, -0.8049706, -1.546854, 1, 0, 0, 1, 1,
-2.680367, -1.314351, -1.816913, 1, 0, 0, 1, 1,
-2.629973, -0.02082871, -3.3524, 1, 0, 0, 1, 1,
-2.620178, 0.2158687, -0.338015, 0, 0, 0, 1, 1,
-2.598042, -0.7239351, -3.145808, 0, 0, 0, 1, 1,
-2.462689, 1.111907, -3.037219, 0, 0, 0, 1, 1,
-2.396965, 0.2667575, -0.4393546, 0, 0, 0, 1, 1,
-2.391973, 0.1760917, -1.840833, 0, 0, 0, 1, 1,
-2.389482, 0.6144095, -2.435177, 0, 0, 0, 1, 1,
-2.337337, -1.020535, -2.28379, 0, 0, 0, 1, 1,
-2.277915, -0.1868637, -1.308783, 1, 1, 1, 1, 1,
-2.188816, -0.1234024, -2.016567, 1, 1, 1, 1, 1,
-2.141594, -0.05766868, -1.294678, 1, 1, 1, 1, 1,
-2.125873, -0.09340407, -0.1556318, 1, 1, 1, 1, 1,
-2.088982, -0.5699992, -1.013317, 1, 1, 1, 1, 1,
-2.088239, -0.1891899, -2.662233, 1, 1, 1, 1, 1,
-2.070772, 1.903941, -0.2037661, 1, 1, 1, 1, 1,
-2.067963, 1.8405, -2.252079, 1, 1, 1, 1, 1,
-2.063968, -0.3273968, -0.9245003, 1, 1, 1, 1, 1,
-2.036531, -1.788147, -3.529502, 1, 1, 1, 1, 1,
-1.996314, -2.122897, -2.490304, 1, 1, 1, 1, 1,
-1.990223, 0.1200502, -0.963401, 1, 1, 1, 1, 1,
-1.983142, -1.809418, -2.410421, 1, 1, 1, 1, 1,
-1.97973, 0.06344634, -1.696502, 1, 1, 1, 1, 1,
-1.968726, -1.771143, -2.342489, 1, 1, 1, 1, 1,
-1.958209, 0.8556303, 0.6229721, 0, 0, 1, 1, 1,
-1.949933, 1.120224, -0.4314283, 1, 0, 0, 1, 1,
-1.934777, -0.1923737, -1.494105, 1, 0, 0, 1, 1,
-1.915401, 0.2934884, -0.9152814, 1, 0, 0, 1, 1,
-1.898087, -0.04271447, -1.477256, 1, 0, 0, 1, 1,
-1.890953, 1.683914, -1.004445, 1, 0, 0, 1, 1,
-1.839066, 0.5213028, 0.1080951, 0, 0, 0, 1, 1,
-1.828129, 0.7567258, -1.169126, 0, 0, 0, 1, 1,
-1.823937, -0.2859026, -0.207597, 0, 0, 0, 1, 1,
-1.818642, -0.1866079, -3.881434, 0, 0, 0, 1, 1,
-1.816478, -0.626975, -1.878137, 0, 0, 0, 1, 1,
-1.806779, 0.4855937, -0.4016351, 0, 0, 0, 1, 1,
-1.804016, 0.3303898, -0.6285807, 0, 0, 0, 1, 1,
-1.800967, -1.160017, -2.326933, 1, 1, 1, 1, 1,
-1.79435, -1.197292, -1.121353, 1, 1, 1, 1, 1,
-1.773765, -0.7773244, -2.990146, 1, 1, 1, 1, 1,
-1.773194, 1.282933, 1.775924, 1, 1, 1, 1, 1,
-1.756212, -0.5758908, -0.1227501, 1, 1, 1, 1, 1,
-1.746138, 0.2216961, 0.6401901, 1, 1, 1, 1, 1,
-1.722231, 0.3323704, -1.674964, 1, 1, 1, 1, 1,
-1.719296, 0.3796493, -1.32919, 1, 1, 1, 1, 1,
-1.665221, 0.424284, -2.136811, 1, 1, 1, 1, 1,
-1.664007, 3.001615, 0.6891786, 1, 1, 1, 1, 1,
-1.63707, 2.096231, -0.0779966, 1, 1, 1, 1, 1,
-1.631623, 1.349499, -0.6736373, 1, 1, 1, 1, 1,
-1.622729, 0.2622398, -0.05941613, 1, 1, 1, 1, 1,
-1.619748, 0.137639, -1.604563, 1, 1, 1, 1, 1,
-1.61609, 1.207356, -0.3816452, 1, 1, 1, 1, 1,
-1.610142, -0.9477269, -1.932562, 0, 0, 1, 1, 1,
-1.594309, -1.164045, -1.47665, 1, 0, 0, 1, 1,
-1.592656, -0.5847545, -1.882014, 1, 0, 0, 1, 1,
-1.590252, 0.6281005, -0.03545905, 1, 0, 0, 1, 1,
-1.578969, -1.19739, -2.062212, 1, 0, 0, 1, 1,
-1.565604, -1.526917, -1.889361, 1, 0, 0, 1, 1,
-1.563766, 1.737543, 0.7095474, 0, 0, 0, 1, 1,
-1.533247, -0.4835403, -0.3262118, 0, 0, 0, 1, 1,
-1.477117, 0.5703823, -1.455544, 0, 0, 0, 1, 1,
-1.474059, 0.8877218, -0.6151535, 0, 0, 0, 1, 1,
-1.472142, -0.8640206, -2.690094, 0, 0, 0, 1, 1,
-1.468494, 0.3219205, -0.7253755, 0, 0, 0, 1, 1,
-1.466204, -0.9622642, -2.496105, 0, 0, 0, 1, 1,
-1.465156, 0.4175024, -2.054945, 1, 1, 1, 1, 1,
-1.462563, 0.2368137, -2.244097, 1, 1, 1, 1, 1,
-1.456239, 1.405581, -1.139679, 1, 1, 1, 1, 1,
-1.440311, -0.8417857, -1.958119, 1, 1, 1, 1, 1,
-1.435358, -0.3729917, -2.456284, 1, 1, 1, 1, 1,
-1.423615, -1.044552, -0.4587502, 1, 1, 1, 1, 1,
-1.388073, -0.8654833, -1.830793, 1, 1, 1, 1, 1,
-1.387053, -0.7877989, -2.220692, 1, 1, 1, 1, 1,
-1.386788, 0.3685312, -2.437569, 1, 1, 1, 1, 1,
-1.386471, -1.471406, -1.903025, 1, 1, 1, 1, 1,
-1.381364, -0.9518042, -2.331836, 1, 1, 1, 1, 1,
-1.379371, -0.40261, 1.256285, 1, 1, 1, 1, 1,
-1.365936, 0.3419585, -1.027589, 1, 1, 1, 1, 1,
-1.357774, -0.02647356, -3.083815, 1, 1, 1, 1, 1,
-1.342562, -0.8384206, -1.36801, 1, 1, 1, 1, 1,
-1.3314, -2.272355, -2.851983, 0, 0, 1, 1, 1,
-1.313883, 0.2782692, -0.745657, 1, 0, 0, 1, 1,
-1.300286, 0.5191034, 1.57838, 1, 0, 0, 1, 1,
-1.299153, 1.300472, -0.1776339, 1, 0, 0, 1, 1,
-1.299072, -0.5278134, -2.347866, 1, 0, 0, 1, 1,
-1.294551, -0.1390271, -1.719384, 1, 0, 0, 1, 1,
-1.29015, -0.3834453, -2.340018, 0, 0, 0, 1, 1,
-1.286461, -0.3003463, -1.810673, 0, 0, 0, 1, 1,
-1.283033, 0.8108222, -0.8493989, 0, 0, 0, 1, 1,
-1.279592, 1.475896, -0.16795, 0, 0, 0, 1, 1,
-1.276504, -2.146628, -2.184675, 0, 0, 0, 1, 1,
-1.272878, -2.254321, -4.056729, 0, 0, 0, 1, 1,
-1.26826, -0.8185006, -0.04777497, 0, 0, 0, 1, 1,
-1.25824, 2.96892, 0.7057965, 1, 1, 1, 1, 1,
-1.252534, -1.40113, -3.159077, 1, 1, 1, 1, 1,
-1.249067, -0.4563, -2.974048, 1, 1, 1, 1, 1,
-1.24626, 0.4464492, 0.4870903, 1, 1, 1, 1, 1,
-1.227245, 0.8353115, 0.734219, 1, 1, 1, 1, 1,
-1.224826, 1.623404, -1.994846, 1, 1, 1, 1, 1,
-1.224731, 1.178648, -1.624774, 1, 1, 1, 1, 1,
-1.223527, 0.4752758, -2.518479, 1, 1, 1, 1, 1,
-1.205451, -1.319686, 0.3617144, 1, 1, 1, 1, 1,
-1.197677, 0.231338, 0.9377736, 1, 1, 1, 1, 1,
-1.192263, 0.4018341, 0.5773976, 1, 1, 1, 1, 1,
-1.175064, -1.253752, -4.272644, 1, 1, 1, 1, 1,
-1.171191, 1.667286, -0.9850051, 1, 1, 1, 1, 1,
-1.169027, 0.2365861, -1.154723, 1, 1, 1, 1, 1,
-1.16649, 0.3446755, -1.074427, 1, 1, 1, 1, 1,
-1.163868, -0.07126722, -1.009678, 0, 0, 1, 1, 1,
-1.156557, 0.5356379, 0.7877, 1, 0, 0, 1, 1,
-1.150199, 0.916599, 0.06176591, 1, 0, 0, 1, 1,
-1.144711, -0.8485354, -2.301303, 1, 0, 0, 1, 1,
-1.144689, -0.7935888, -2.929696, 1, 0, 0, 1, 1,
-1.142414, 1.446203, -1.946, 1, 0, 0, 1, 1,
-1.130454, -0.9352643, -2.715589, 0, 0, 0, 1, 1,
-1.127752, 0.1566797, 0.4408251, 0, 0, 0, 1, 1,
-1.115257, 2.266631, -1.408419, 0, 0, 0, 1, 1,
-1.115212, 0.6096285, -0.5665923, 0, 0, 0, 1, 1,
-1.112219, 1.734394, -1.357351, 0, 0, 0, 1, 1,
-1.105618, 1.682275, -1.044742, 0, 0, 0, 1, 1,
-1.10257, -0.830516, -1.072138, 0, 0, 0, 1, 1,
-1.093842, -0.9660119, -2.845995, 1, 1, 1, 1, 1,
-1.089637, 0.03829605, -1.490174, 1, 1, 1, 1, 1,
-1.081358, 1.018542, -2.681834, 1, 1, 1, 1, 1,
-1.074343, 1.796291, -0.8804548, 1, 1, 1, 1, 1,
-1.072083, 0.474339, -1.059437, 1, 1, 1, 1, 1,
-1.06586, -0.7848317, -1.851725, 1, 1, 1, 1, 1,
-1.06451, 0.2852107, -0.4624127, 1, 1, 1, 1, 1,
-1.063821, -2.59509, -1.910125, 1, 1, 1, 1, 1,
-1.06329, 0.5618551, -1.64187, 1, 1, 1, 1, 1,
-1.063012, 1.41162, 0.5488577, 1, 1, 1, 1, 1,
-1.0601, -0.5967459, -0.3857796, 1, 1, 1, 1, 1,
-1.052591, -0.2079894, -0.8989121, 1, 1, 1, 1, 1,
-1.051274, 1.815346, -1.954922, 1, 1, 1, 1, 1,
-1.048084, 0.07901166, -0.0795017, 1, 1, 1, 1, 1,
-1.045578, -1.810776, -0.5326288, 1, 1, 1, 1, 1,
-1.041884, -0.9442772, -3.53178, 0, 0, 1, 1, 1,
-1.035589, -0.5891527, -1.469069, 1, 0, 0, 1, 1,
-1.033374, 0.09146218, -0.7668498, 1, 0, 0, 1, 1,
-1.031002, -0.3537056, -2.109741, 1, 0, 0, 1, 1,
-1.020239, -1.995392, -2.345681, 1, 0, 0, 1, 1,
-1.009017, -0.0355107, 0.398208, 1, 0, 0, 1, 1,
-1.004755, 0.7063228, -1.803133, 0, 0, 0, 1, 1,
-1.000278, -2.091306, -4.280497, 0, 0, 0, 1, 1,
-0.995798, -1.396635, -1.424659, 0, 0, 0, 1, 1,
-0.9939507, -1.000441, -3.220098, 0, 0, 0, 1, 1,
-0.9912134, -1.130187, -1.610128, 0, 0, 0, 1, 1,
-0.9900973, 0.5491819, -2.712904, 0, 0, 0, 1, 1,
-0.9856173, -0.2575882, -0.5304078, 0, 0, 0, 1, 1,
-0.9793847, 0.6554604, -1.462615, 1, 1, 1, 1, 1,
-0.9752036, -1.281731, -3.742258, 1, 1, 1, 1, 1,
-0.9736929, -0.1676963, -1.399667, 1, 1, 1, 1, 1,
-0.9735222, 0.7233856, -2.153895, 1, 1, 1, 1, 1,
-0.9649249, 1.360198, -1.751991, 1, 1, 1, 1, 1,
-0.9564608, -0.2211614, -2.023938, 1, 1, 1, 1, 1,
-0.9555193, 0.6380763, -2.436289, 1, 1, 1, 1, 1,
-0.9547582, 0.342051, -1.020865, 1, 1, 1, 1, 1,
-0.9531572, 0.3769746, -0.4137035, 1, 1, 1, 1, 1,
-0.9504363, 2.557764, -0.7550966, 1, 1, 1, 1, 1,
-0.9452077, 2.229366, -0.0690584, 1, 1, 1, 1, 1,
-0.9447175, -1.220612, -3.355409, 1, 1, 1, 1, 1,
-0.9399494, -0.5779675, -2.57472, 1, 1, 1, 1, 1,
-0.9273237, 0.3581033, 0.000224077, 1, 1, 1, 1, 1,
-0.9231611, 0.4748943, -0.2653751, 1, 1, 1, 1, 1,
-0.9143723, 0.156036, -2.25248, 0, 0, 1, 1, 1,
-0.9139649, -1.572113, -1.722932, 1, 0, 0, 1, 1,
-0.9111162, -0.5145829, -0.8657092, 1, 0, 0, 1, 1,
-0.9067234, -1.519415, -3.515134, 1, 0, 0, 1, 1,
-0.9036087, 0.02704383, -0.4151726, 1, 0, 0, 1, 1,
-0.8945191, -0.5129447, -2.279288, 1, 0, 0, 1, 1,
-0.8936847, 0.6940759, -2.486903, 0, 0, 0, 1, 1,
-0.8918295, -0.9892758, -4.115921, 0, 0, 0, 1, 1,
-0.8904737, -0.6521471, -2.777313, 0, 0, 0, 1, 1,
-0.8879322, 1.088176, -0.1492996, 0, 0, 0, 1, 1,
-0.8861958, 0.5030345, -0.6189899, 0, 0, 0, 1, 1,
-0.8854007, -1.455278, -2.618962, 0, 0, 0, 1, 1,
-0.8835884, 2.367384, 0.6218418, 0, 0, 0, 1, 1,
-0.8818038, -1.204445, -2.147782, 1, 1, 1, 1, 1,
-0.8817489, 0.5581387, -0.8986017, 1, 1, 1, 1, 1,
-0.8751893, -0.4604651, -2.048899, 1, 1, 1, 1, 1,
-0.8691844, 0.1699332, -2.73062, 1, 1, 1, 1, 1,
-0.8687125, 0.9464567, -1.041772, 1, 1, 1, 1, 1,
-0.8614635, -0.07968243, -2.994279, 1, 1, 1, 1, 1,
-0.8585035, -0.4334611, -3.307297, 1, 1, 1, 1, 1,
-0.8574662, 0.3999555, -1.669493, 1, 1, 1, 1, 1,
-0.8552684, -0.982662, -0.2361041, 1, 1, 1, 1, 1,
-0.853429, -0.5661654, 1.518013, 1, 1, 1, 1, 1,
-0.8522538, -0.5705392, -2.020905, 1, 1, 1, 1, 1,
-0.8377036, 0.2787401, -1.758565, 1, 1, 1, 1, 1,
-0.8365397, -0.3289163, -2.549013, 1, 1, 1, 1, 1,
-0.8349214, 1.021635, -1.016491, 1, 1, 1, 1, 1,
-0.8325957, 0.770771, -0.5777972, 1, 1, 1, 1, 1,
-0.8275353, 0.9723296, -1.12959, 0, 0, 1, 1, 1,
-0.826463, 0.2506925, 0.2519667, 1, 0, 0, 1, 1,
-0.8216024, 0.1597626, -1.674732, 1, 0, 0, 1, 1,
-0.8200968, -1.533767, -2.280383, 1, 0, 0, 1, 1,
-0.8199648, 0.1893135, -1.442904, 1, 0, 0, 1, 1,
-0.8124663, 0.6184117, -1.004295, 1, 0, 0, 1, 1,
-0.8115994, -0.5632849, -4.513689, 0, 0, 0, 1, 1,
-0.8108588, -0.6541722, -3.849944, 0, 0, 0, 1, 1,
-0.8058772, 0.2300011, -0.3773902, 0, 0, 0, 1, 1,
-0.8046415, -1.648273, -3.380912, 0, 0, 0, 1, 1,
-0.7852474, 0.8518038, -1.663148, 0, 0, 0, 1, 1,
-0.7828149, 0.7846755, -1.301161, 0, 0, 0, 1, 1,
-0.780895, -1.486026, -1.160955, 0, 0, 0, 1, 1,
-0.7808033, -1.436467, -1.745821, 1, 1, 1, 1, 1,
-0.7758521, 1.056069, 1.46416, 1, 1, 1, 1, 1,
-0.7696353, 0.9712954, -0.3149156, 1, 1, 1, 1, 1,
-0.7657273, -1.331778, -1.918369, 1, 1, 1, 1, 1,
-0.7625632, 1.345442, -1.279109, 1, 1, 1, 1, 1,
-0.7604458, -0.6377384, -2.418194, 1, 1, 1, 1, 1,
-0.7569793, 1.193623, -0.4146532, 1, 1, 1, 1, 1,
-0.7546393, -0.2612057, 0.03430461, 1, 1, 1, 1, 1,
-0.7538404, -0.09812213, -1.555629, 1, 1, 1, 1, 1,
-0.7538251, -0.1155429, -1.707204, 1, 1, 1, 1, 1,
-0.7533271, 1.37531, -1.376928, 1, 1, 1, 1, 1,
-0.7467923, 1.596364, 0.2895986, 1, 1, 1, 1, 1,
-0.7464648, -1.548639, -2.390254, 1, 1, 1, 1, 1,
-0.7388796, -0.1843629, -1.707936, 1, 1, 1, 1, 1,
-0.7361263, 0.4061889, -1.478206, 1, 1, 1, 1, 1,
-0.7326285, -2.088259, -3.059006, 0, 0, 1, 1, 1,
-0.7306886, -0.0683257, -1.851189, 1, 0, 0, 1, 1,
-0.7273665, -1.15312, -3.651034, 1, 0, 0, 1, 1,
-0.7248268, 0.3486848, -1.982446, 1, 0, 0, 1, 1,
-0.7174951, -1.208113, -1.700807, 1, 0, 0, 1, 1,
-0.7162406, -1.413356, -2.669843, 1, 0, 0, 1, 1,
-0.7117031, 0.624082, 0.06479428, 0, 0, 0, 1, 1,
-0.7095074, 0.4718266, 1.448887, 0, 0, 0, 1, 1,
-0.7085092, -1.452143, -0.6142627, 0, 0, 0, 1, 1,
-0.7085041, 0.7777209, 0.03258947, 0, 0, 0, 1, 1,
-0.7066684, -0.06864255, -3.400366, 0, 0, 0, 1, 1,
-0.7040936, -0.7255133, -1.454363, 0, 0, 0, 1, 1,
-0.6975695, 0.4251687, -0.8964029, 0, 0, 0, 1, 1,
-0.6934451, 0.7751473, -1.446711, 1, 1, 1, 1, 1,
-0.689527, 0.2951941, -0.7503519, 1, 1, 1, 1, 1,
-0.6892076, -0.0866145, -1.862906, 1, 1, 1, 1, 1,
-0.6886754, 2.299492, 0.5550579, 1, 1, 1, 1, 1,
-0.6837426, -0.7790513, -2.711064, 1, 1, 1, 1, 1,
-0.6834585, 0.2106591, 0.01295994, 1, 1, 1, 1, 1,
-0.6833335, 0.404986, -0.5679958, 1, 1, 1, 1, 1,
-0.6806925, -0.8077481, -2.326509, 1, 1, 1, 1, 1,
-0.6773656, -1.38377, -3.940002, 1, 1, 1, 1, 1,
-0.6768305, -0.2068579, -1.341517, 1, 1, 1, 1, 1,
-0.6765545, -0.5313914, -2.820529, 1, 1, 1, 1, 1,
-0.6763533, 0.8091623, -0.609463, 1, 1, 1, 1, 1,
-0.6742692, 0.508029, 0.2421224, 1, 1, 1, 1, 1,
-0.6585954, 1.071872, -0.004524156, 1, 1, 1, 1, 1,
-0.6532871, -0.5779396, -1.907587, 1, 1, 1, 1, 1,
-0.6525363, -1.336343, -1.450262, 0, 0, 1, 1, 1,
-0.6523175, -0.16975, -2.867787, 1, 0, 0, 1, 1,
-0.6500368, 0.3263857, -1.906747, 1, 0, 0, 1, 1,
-0.6478987, 0.7428885, 0.5994276, 1, 0, 0, 1, 1,
-0.6453708, -0.785985, -3.035729, 1, 0, 0, 1, 1,
-0.6452957, -0.005861325, -0.4408761, 1, 0, 0, 1, 1,
-0.643371, 0.604575, -0.2049878, 0, 0, 0, 1, 1,
-0.6405741, -0.6435017, -3.139144, 0, 0, 0, 1, 1,
-0.6287668, 1.64338, -1.589931, 0, 0, 0, 1, 1,
-0.628204, -0.2194908, -2.821116, 0, 0, 0, 1, 1,
-0.6277022, -0.9413504, -1.633894, 0, 0, 0, 1, 1,
-0.6250319, 1.600184, -0.9417733, 0, 0, 0, 1, 1,
-0.6199167, -1.400185, -3.078456, 0, 0, 0, 1, 1,
-0.6196096, -1.280824, -1.758507, 1, 1, 1, 1, 1,
-0.6172845, -0.9524949, -0.9581484, 1, 1, 1, 1, 1,
-0.6125626, 0.1856077, -0.6384798, 1, 1, 1, 1, 1,
-0.6056728, -0.8927807, -2.048975, 1, 1, 1, 1, 1,
-0.6053233, 1.646646, -0.7914949, 1, 1, 1, 1, 1,
-0.6035926, 1.430813, -0.7871208, 1, 1, 1, 1, 1,
-0.6004781, -0.1484944, -0.7099911, 1, 1, 1, 1, 1,
-0.6004766, -0.8278114, -2.742115, 1, 1, 1, 1, 1,
-0.5997149, 0.9414947, 0.7604662, 1, 1, 1, 1, 1,
-0.5975889, 1.19274, 0.7107565, 1, 1, 1, 1, 1,
-0.5968876, 0.7757939, -0.8566635, 1, 1, 1, 1, 1,
-0.594965, 1.012155, 1.481261, 1, 1, 1, 1, 1,
-0.593133, -0.1281225, -3.332498, 1, 1, 1, 1, 1,
-0.5926388, -0.2652947, -2.356265, 1, 1, 1, 1, 1,
-0.5876833, -0.1984045, -2.182876, 1, 1, 1, 1, 1,
-0.5868561, -0.5713331, -2.023121, 0, 0, 1, 1, 1,
-0.5866374, 0.6154649, -1.194838, 1, 0, 0, 1, 1,
-0.5845829, 1.080538, -1.173495, 1, 0, 0, 1, 1,
-0.5830975, 1.802269, -0.4108619, 1, 0, 0, 1, 1,
-0.5810806, 0.5295034, 0.7299376, 1, 0, 0, 1, 1,
-0.5736281, -1.138454, -2.528696, 1, 0, 0, 1, 1,
-0.5735556, 0.01956031, -1.753411, 0, 0, 0, 1, 1,
-0.5725234, -0.4816146, -2.636815, 0, 0, 0, 1, 1,
-0.5678117, 0.8003743, -1.650422, 0, 0, 0, 1, 1,
-0.5637955, -0.4132014, -2.108865, 0, 0, 0, 1, 1,
-0.5614747, 0.8032813, -0.7990045, 0, 0, 0, 1, 1,
-0.5602927, 1.181139, -0.848748, 0, 0, 0, 1, 1,
-0.5523666, 0.3043587, -0.6990716, 0, 0, 0, 1, 1,
-0.5518299, -0.5620629, -2.307974, 1, 1, 1, 1, 1,
-0.5492694, 0.3614044, -1.350359, 1, 1, 1, 1, 1,
-0.5484862, 0.06638189, -2.388562, 1, 1, 1, 1, 1,
-0.5444641, -0.08477847, -2.700125, 1, 1, 1, 1, 1,
-0.5391368, -0.2609492, -0.4896049, 1, 1, 1, 1, 1,
-0.5365963, 0.3984703, -2.021835, 1, 1, 1, 1, 1,
-0.5343258, -0.8333251, -3.426986, 1, 1, 1, 1, 1,
-0.5325565, -1.429086, -3.387352, 1, 1, 1, 1, 1,
-0.5305737, -0.7218524, -1.594911, 1, 1, 1, 1, 1,
-0.5282696, -1.026223, -3.005783, 1, 1, 1, 1, 1,
-0.5199179, 0.2686578, 0.5867501, 1, 1, 1, 1, 1,
-0.5187619, 0.1402461, -0.7818325, 1, 1, 1, 1, 1,
-0.5168793, -1.034475, -2.774596, 1, 1, 1, 1, 1,
-0.5038645, 0.7550062, 0.6989473, 1, 1, 1, 1, 1,
-0.5028339, 1.240666, 1.999524, 1, 1, 1, 1, 1,
-0.5025755, -0.9288669, -1.324653, 0, 0, 1, 1, 1,
-0.5008808, 1.442497, 0.2341606, 1, 0, 0, 1, 1,
-0.5003273, -0.2355146, -3.108258, 1, 0, 0, 1, 1,
-0.4991493, 0.6446769, -2.436282, 1, 0, 0, 1, 1,
-0.498917, -0.7415383, -2.03774, 1, 0, 0, 1, 1,
-0.4978783, -0.07415491, -1.182974, 1, 0, 0, 1, 1,
-0.4950418, -0.8870049, -3.102919, 0, 0, 0, 1, 1,
-0.4903936, -0.8746341, -1.542074, 0, 0, 0, 1, 1,
-0.488492, 0.1027877, -1.965687, 0, 0, 0, 1, 1,
-0.4801831, 1.058211, 0.1754951, 0, 0, 0, 1, 1,
-0.4784287, 0.6102031, -1.416337, 0, 0, 0, 1, 1,
-0.4734321, -1.904911, -4.357187, 0, 0, 0, 1, 1,
-0.4723348, -0.4813212, -1.471412, 0, 0, 0, 1, 1,
-0.4690003, -0.9704586, -1.972575, 1, 1, 1, 1, 1,
-0.4688169, -0.3111531, -0.6688787, 1, 1, 1, 1, 1,
-0.4638216, -0.7822328, -3.108342, 1, 1, 1, 1, 1,
-0.4628927, 0.7265272, 0.2735525, 1, 1, 1, 1, 1,
-0.4614491, -1.471893, -1.487409, 1, 1, 1, 1, 1,
-0.4565947, 0.9764588, 0.1005922, 1, 1, 1, 1, 1,
-0.4544777, 0.7872418, -0.1805596, 1, 1, 1, 1, 1,
-0.4512667, -0.3722692, -3.547965, 1, 1, 1, 1, 1,
-0.4507253, -1.448959, -2.418633, 1, 1, 1, 1, 1,
-0.4490244, -0.4850516, -4.254784, 1, 1, 1, 1, 1,
-0.448876, 1.099821, -0.5943063, 1, 1, 1, 1, 1,
-0.448093, 1.864039, 1.806821, 1, 1, 1, 1, 1,
-0.4470753, 0.9199167, 2.281917, 1, 1, 1, 1, 1,
-0.4457939, -0.6754516, -3.93763, 1, 1, 1, 1, 1,
-0.444972, -0.6264726, -3.419697, 1, 1, 1, 1, 1,
-0.438195, -0.5366585, -3.046295, 0, 0, 1, 1, 1,
-0.4375288, -1.64346, -3.00217, 1, 0, 0, 1, 1,
-0.4368756, -1.567755, -3.856307, 1, 0, 0, 1, 1,
-0.4356185, 0.7249517, -2.346505, 1, 0, 0, 1, 1,
-0.4353252, -0.1930002, -2.459579, 1, 0, 0, 1, 1,
-0.4345035, -0.1689231, -0.5398085, 1, 0, 0, 1, 1,
-0.4247662, -1.411173, -2.474833, 0, 0, 0, 1, 1,
-0.4245712, 1.068037, -0.532044, 0, 0, 0, 1, 1,
-0.4237818, -0.1028835, -1.516847, 0, 0, 0, 1, 1,
-0.4225497, -0.7513924, -1.282048, 0, 0, 0, 1, 1,
-0.4225105, 1.66664, 0.09316045, 0, 0, 0, 1, 1,
-0.4195646, -0.802509, -2.751053, 0, 0, 0, 1, 1,
-0.4104231, -0.07213261, -2.214701, 0, 0, 0, 1, 1,
-0.4098203, 0.9137689, -0.1538946, 1, 1, 1, 1, 1,
-0.4097576, 0.0731814, -1.101581, 1, 1, 1, 1, 1,
-0.4076036, -0.5261124, -3.812223, 1, 1, 1, 1, 1,
-0.4066963, 0.9618902, 0.4324671, 1, 1, 1, 1, 1,
-0.4056331, 0.8173485, 0.2503983, 1, 1, 1, 1, 1,
-0.4048023, 1.061329, -0.05069441, 1, 1, 1, 1, 1,
-0.4037097, -1.552253, -2.696887, 1, 1, 1, 1, 1,
-0.4004961, 1.00604, -0.3693806, 1, 1, 1, 1, 1,
-0.3932396, -1.374665, -2.701795, 1, 1, 1, 1, 1,
-0.3902104, -0.245715, -2.463986, 1, 1, 1, 1, 1,
-0.3877916, 2.197828, -1.760975, 1, 1, 1, 1, 1,
-0.3845708, -0.04110174, -0.7154206, 1, 1, 1, 1, 1,
-0.3838482, -0.8774961, -4.265181, 1, 1, 1, 1, 1,
-0.3790718, -1.256703, -1.452415, 1, 1, 1, 1, 1,
-0.3781308, -0.6846843, -2.614335, 1, 1, 1, 1, 1,
-0.3771339, -0.5748684, -2.280087, 0, 0, 1, 1, 1,
-0.3764051, -0.868745, -3.332215, 1, 0, 0, 1, 1,
-0.3730192, -1.649148, -2.97894, 1, 0, 0, 1, 1,
-0.3720567, -0.3610936, -1.931144, 1, 0, 0, 1, 1,
-0.3718651, 0.9034858, -0.1941665, 1, 0, 0, 1, 1,
-0.3705193, 0.1150866, -1.288449, 1, 0, 0, 1, 1,
-0.3687116, 1.116299, -0.8307293, 0, 0, 0, 1, 1,
-0.3643561, 0.6891146, -1.303465, 0, 0, 0, 1, 1,
-0.3629907, -0.7061313, -3.650186, 0, 0, 0, 1, 1,
-0.362554, 0.1724124, 0.7238299, 0, 0, 0, 1, 1,
-0.3624233, 0.4905982, -1.357793, 0, 0, 0, 1, 1,
-0.361455, -1.422644, -4.052012, 0, 0, 0, 1, 1,
-0.3608346, -0.3521206, -3.680112, 0, 0, 0, 1, 1,
-0.3603482, -0.6397314, -0.6672329, 1, 1, 1, 1, 1,
-0.3573647, 0.1680267, -0.6581012, 1, 1, 1, 1, 1,
-0.3561503, -0.135676, -0.1706855, 1, 1, 1, 1, 1,
-0.3546158, -0.9686761, -1.438784, 1, 1, 1, 1, 1,
-0.3500528, 1.786525, -1.512365, 1, 1, 1, 1, 1,
-0.3471212, -1.540578, -3.948058, 1, 1, 1, 1, 1,
-0.3460583, 0.4742794, -1.113001, 1, 1, 1, 1, 1,
-0.3451678, -1.221625, -3.351487, 1, 1, 1, 1, 1,
-0.3444807, -0.09945986, -0.3508993, 1, 1, 1, 1, 1,
-0.3414251, -1.381002, -3.133769, 1, 1, 1, 1, 1,
-0.3353511, 2.445527, 0.6135662, 1, 1, 1, 1, 1,
-0.3315879, -0.1142677, -2.942045, 1, 1, 1, 1, 1,
-0.3301415, -2.157685, -3.164411, 1, 1, 1, 1, 1,
-0.3292311, -0.09191386, -1.704545, 1, 1, 1, 1, 1,
-0.3284808, 0.05794331, -1.160141, 1, 1, 1, 1, 1,
-0.3235417, -2.171407, -3.332606, 0, 0, 1, 1, 1,
-0.3221662, -0.02246322, -2.183975, 1, 0, 0, 1, 1,
-0.3210097, 1.971664, 0.6626178, 1, 0, 0, 1, 1,
-0.3174489, -0.05738582, -3.070832, 1, 0, 0, 1, 1,
-0.3081124, -0.2154034, -1.587402, 1, 0, 0, 1, 1,
-0.3039302, 0.5610453, 0.711267, 1, 0, 0, 1, 1,
-0.3026154, -1.59936, -1.204067, 0, 0, 0, 1, 1,
-0.3013638, 2.715507, -1.091774, 0, 0, 0, 1, 1,
-0.3001702, -0.9295498, -2.367904, 0, 0, 0, 1, 1,
-0.2998191, -1.362686, -2.542555, 0, 0, 0, 1, 1,
-0.298843, -0.1800714, -0.9134806, 0, 0, 0, 1, 1,
-0.2985194, 0.2519763, -3.290725, 0, 0, 0, 1, 1,
-0.292978, -0.4272729, -3.036503, 0, 0, 0, 1, 1,
-0.2924109, 0.1694469, -0.3220121, 1, 1, 1, 1, 1,
-0.2832286, 0.3339373, -3.419895, 1, 1, 1, 1, 1,
-0.281529, 0.1715014, -1.337505, 1, 1, 1, 1, 1,
-0.2720388, 0.259291, -1.284823, 1, 1, 1, 1, 1,
-0.2701463, -0.5565221, -3.565457, 1, 1, 1, 1, 1,
-0.2695274, -1.383114, -0.117727, 1, 1, 1, 1, 1,
-0.2689986, -2.637681, -3.544447, 1, 1, 1, 1, 1,
-0.2688329, -0.6276476, -3.564324, 1, 1, 1, 1, 1,
-0.2678728, 0.3282843, -1.136833, 1, 1, 1, 1, 1,
-0.2677816, -0.3361478, -3.294842, 1, 1, 1, 1, 1,
-0.267763, -0.2936805, -2.731207, 1, 1, 1, 1, 1,
-0.2636188, -0.1373582, -5.41789, 1, 1, 1, 1, 1,
-0.2614707, -0.01650149, -1.936894, 1, 1, 1, 1, 1,
-0.2598577, 0.03121573, 0.4428388, 1, 1, 1, 1, 1,
-0.253464, 0.4343151, 0.937379, 1, 1, 1, 1, 1,
-0.2345924, 0.7884679, -0.7164494, 0, 0, 1, 1, 1,
-0.2318188, 0.4397819, -0.3959375, 1, 0, 0, 1, 1,
-0.2317579, -1.336002, -1.282641, 1, 0, 0, 1, 1,
-0.2241535, -0.3385347, -2.485312, 1, 0, 0, 1, 1,
-0.2189316, 0.2413325, -3.033043, 1, 0, 0, 1, 1,
-0.2164759, 0.1669611, -0.318968, 1, 0, 0, 1, 1,
-0.2133577, -0.04030306, -2.596939, 0, 0, 0, 1, 1,
-0.2081941, 0.3964862, -0.5139477, 0, 0, 0, 1, 1,
-0.2011538, 0.9234704, -0.6721264, 0, 0, 0, 1, 1,
-0.1974505, -0.9568049, -1.711046, 0, 0, 0, 1, 1,
-0.1946092, -0.3606342, -1.908758, 0, 0, 0, 1, 1,
-0.1917848, 1.782871, -1.304014, 0, 0, 0, 1, 1,
-0.1899914, -1.043686, -2.504673, 0, 0, 0, 1, 1,
-0.1884018, 0.4895136, 0.3852847, 1, 1, 1, 1, 1,
-0.188131, -0.2295017, -0.9321682, 1, 1, 1, 1, 1,
-0.1845871, 0.4012715, -0.1100183, 1, 1, 1, 1, 1,
-0.1814286, 0.3452893, 0.4625621, 1, 1, 1, 1, 1,
-0.179843, 0.3268524, 0.4806213, 1, 1, 1, 1, 1,
-0.1796575, 0.6950015, -0.1836334, 1, 1, 1, 1, 1,
-0.1793758, -0.8796746, -5.56955, 1, 1, 1, 1, 1,
-0.1777175, -2.196862, -2.795193, 1, 1, 1, 1, 1,
-0.1775713, 0.9965736, 0.4564437, 1, 1, 1, 1, 1,
-0.1750975, 1.560165, -0.9496579, 1, 1, 1, 1, 1,
-0.168536, -0.6673281, -2.787489, 1, 1, 1, 1, 1,
-0.1538002, 1.291769, -0.4764578, 1, 1, 1, 1, 1,
-0.1445237, 0.6666815, 0.3863049, 1, 1, 1, 1, 1,
-0.1444492, -0.6485775, -3.773506, 1, 1, 1, 1, 1,
-0.1415062, 2.132896, 0.3525196, 1, 1, 1, 1, 1,
-0.1405164, 0.9075387, 0.1497854, 0, 0, 1, 1, 1,
-0.138439, 0.9734517, 0.79428, 1, 0, 0, 1, 1,
-0.1315492, 0.8200804, -0.7021471, 1, 0, 0, 1, 1,
-0.1303862, -2.17442, -4.979433, 1, 0, 0, 1, 1,
-0.1292041, 1.742378, -1.134366, 1, 0, 0, 1, 1,
-0.1276035, -0.2055, -2.419115, 1, 0, 0, 1, 1,
-0.1241383, 0.4125043, 0.6303129, 0, 0, 0, 1, 1,
-0.1239498, 0.05639057, -0.1726826, 0, 0, 0, 1, 1,
-0.1232799, 0.2327687, 0.8747977, 0, 0, 0, 1, 1,
-0.1170692, -0.3506228, -2.677098, 0, 0, 0, 1, 1,
-0.1134473, 0.1455412, -0.6448749, 0, 0, 0, 1, 1,
-0.1066489, -0.652979, -1.437357, 0, 0, 0, 1, 1,
-0.105549, -0.2102761, -3.681435, 0, 0, 0, 1, 1,
-0.1035766, -1.315255, -3.999654, 1, 1, 1, 1, 1,
-0.1025399, -1.409264, -1.703624, 1, 1, 1, 1, 1,
-0.1021057, -0.8047016, -3.907927, 1, 1, 1, 1, 1,
-0.100666, 0.08060633, -1.281038, 1, 1, 1, 1, 1,
-0.09187175, -1.271258, -2.052214, 1, 1, 1, 1, 1,
-0.09042455, -1.301061, -2.835372, 1, 1, 1, 1, 1,
-0.08409032, -0.6228451, -4.586051, 1, 1, 1, 1, 1,
-0.0789871, -0.5197803, -2.39543, 1, 1, 1, 1, 1,
-0.07633962, 0.9573259, 0.6688499, 1, 1, 1, 1, 1,
-0.07621349, -0.7216661, -3.992584, 1, 1, 1, 1, 1,
-0.07451515, -1.032455, -5.858818, 1, 1, 1, 1, 1,
-0.07422054, -0.8783799, -2.080138, 1, 1, 1, 1, 1,
-0.07365368, -0.9145921, -5.147379, 1, 1, 1, 1, 1,
-0.07223362, -0.5433726, -1.556393, 1, 1, 1, 1, 1,
-0.07001016, 0.3315209, 0.09617902, 1, 1, 1, 1, 1,
-0.06999359, 0.9727439, -0.5339314, 0, 0, 1, 1, 1,
-0.0697625, -0.9102587, -2.451253, 1, 0, 0, 1, 1,
-0.06848846, 2.844839, -1.692836, 1, 0, 0, 1, 1,
-0.06652507, 0.1017251, -0.328202, 1, 0, 0, 1, 1,
-0.06532208, 0.4709108, 1.176384, 1, 0, 0, 1, 1,
-0.06306818, -0.6160604, -1.149313, 1, 0, 0, 1, 1,
-0.06244475, 0.03673829, -1.612195, 0, 0, 0, 1, 1,
-0.06148997, 2.02342, 0.9171279, 0, 0, 0, 1, 1,
-0.06050504, 1.182713, 2.891703, 0, 0, 0, 1, 1,
-0.05981958, 1.263495, -1.097915, 0, 0, 0, 1, 1,
-0.05964524, -0.8475928, -0.9622725, 0, 0, 0, 1, 1,
-0.05557183, 0.7915677, 0.5120181, 0, 0, 0, 1, 1,
-0.05540261, 1.193137, -0.3139516, 0, 0, 0, 1, 1,
-0.05250619, -0.7323756, -2.03482, 1, 1, 1, 1, 1,
-0.05193202, 0.9157237, -0.3943913, 1, 1, 1, 1, 1,
-0.05017828, 1.675274, -0.8047807, 1, 1, 1, 1, 1,
-0.04225202, -0.1434351, -3.653352, 1, 1, 1, 1, 1,
-0.04224218, 1.160339, -0.4249857, 1, 1, 1, 1, 1,
-0.04188395, -1.116278, -2.337974, 1, 1, 1, 1, 1,
-0.04087586, 1.037688, 1.368963, 1, 1, 1, 1, 1,
-0.03362115, 0.6488, 1.435021, 1, 1, 1, 1, 1,
-0.03276373, -1.33845, -3.397957, 1, 1, 1, 1, 1,
-0.03213525, -1.194521, -3.592599, 1, 1, 1, 1, 1,
-0.03062657, 0.02357447, -2.273496, 1, 1, 1, 1, 1,
-0.02514461, 0.347438, 0.2992977, 1, 1, 1, 1, 1,
-0.02144029, 1.0981, 0.1328997, 1, 1, 1, 1, 1,
-0.020052, 1.16025, -0.3867501, 1, 1, 1, 1, 1,
-0.02001224, -0.9352258, -2.939003, 1, 1, 1, 1, 1,
-0.01973687, 0.05539201, 0.3627532, 0, 0, 1, 1, 1,
-0.01759401, 0.1693301, -0.7380215, 1, 0, 0, 1, 1,
-0.01580885, 0.5639877, 0.2416876, 1, 0, 0, 1, 1,
-0.01498864, -0.1015438, -4.981119, 1, 0, 0, 1, 1,
-0.01360792, -0.4717427, -4.480999, 1, 0, 0, 1, 1,
-0.009659093, -0.7074551, -3.16865, 1, 0, 0, 1, 1,
-0.00960724, -1.515215, -3.456928, 0, 0, 0, 1, 1,
-0.00911563, -0.4084306, -4.945899, 0, 0, 0, 1, 1,
-0.007597129, 3.232871, -0.001081024, 0, 0, 0, 1, 1,
-0.007492642, 0.6243462, 0.9521025, 0, 0, 0, 1, 1,
-0.002472314, 0.8475775, 0.4016412, 0, 0, 0, 1, 1,
-0.0002991518, -1.169677, -4.035521, 0, 0, 0, 1, 1,
0.005420959, -0.1115697, 3.430129, 0, 0, 0, 1, 1,
0.006388355, 1.05348, -0.7315641, 1, 1, 1, 1, 1,
0.009573805, 0.235796, -0.4090706, 1, 1, 1, 1, 1,
0.01819895, 0.2326728, -2.559583, 1, 1, 1, 1, 1,
0.02364052, 0.6989694, -0.7847654, 1, 1, 1, 1, 1,
0.0249089, 0.5294047, 1.018744, 1, 1, 1, 1, 1,
0.02538533, -0.1898658, 2.880764, 1, 1, 1, 1, 1,
0.02693089, -0.7233486, 1.491946, 1, 1, 1, 1, 1,
0.02783432, 0.6433312, 0.7151294, 1, 1, 1, 1, 1,
0.02877051, -0.7107012, 5.142775, 1, 1, 1, 1, 1,
0.0290644, 0.3500859, -0.7237095, 1, 1, 1, 1, 1,
0.03847508, 1.017075, 0.04777912, 1, 1, 1, 1, 1,
0.04064066, -2.064136, 2.535861, 1, 1, 1, 1, 1,
0.05008301, -1.724138, 4.195891, 1, 1, 1, 1, 1,
0.0554479, 1.033176, -0.3334471, 1, 1, 1, 1, 1,
0.05628093, -1.806137, 3.829597, 1, 1, 1, 1, 1,
0.06075597, 0.04641318, -0.4033844, 0, 0, 1, 1, 1,
0.06339619, 0.09003785, 0.9214121, 1, 0, 0, 1, 1,
0.06724612, -1.62819, 5.238493, 1, 0, 0, 1, 1,
0.06799442, -0.7383469, 2.688665, 1, 0, 0, 1, 1,
0.07799049, 0.3592899, 0.4422241, 1, 0, 0, 1, 1,
0.08462446, 0.963452, 1.222282, 1, 0, 0, 1, 1,
0.08569041, -2.08928, 4.593458, 0, 0, 0, 1, 1,
0.08573519, 0.5446464, 0.4822679, 0, 0, 0, 1, 1,
0.08719432, -0.5197048, 3.382162, 0, 0, 0, 1, 1,
0.08769006, -0.6621368, 1.867306, 0, 0, 0, 1, 1,
0.08915819, -0.6948798, 3.068445, 0, 0, 0, 1, 1,
0.08938871, 1.146861, 0.0665123, 0, 0, 0, 1, 1,
0.09057502, -0.6338663, 3.571019, 0, 0, 0, 1, 1,
0.09395639, -0.1732946, 4.456767, 1, 1, 1, 1, 1,
0.1057151, -0.4201348, 0.6577041, 1, 1, 1, 1, 1,
0.1087021, 1.875971, 0.1662929, 1, 1, 1, 1, 1,
0.1100283, 0.7937965, 1.044564, 1, 1, 1, 1, 1,
0.1124545, -0.1853473, 2.23374, 1, 1, 1, 1, 1,
0.1137851, -0.2373111, 3.42102, 1, 1, 1, 1, 1,
0.1152204, -0.04123702, 2.449163, 1, 1, 1, 1, 1,
0.1179282, 1.833678, -0.6839895, 1, 1, 1, 1, 1,
0.119131, 0.8527961, 0.4018329, 1, 1, 1, 1, 1,
0.1199631, 0.3095039, 0.8813226, 1, 1, 1, 1, 1,
0.1208995, 0.04291204, 2.343078, 1, 1, 1, 1, 1,
0.1209497, 0.6937693, -0.2464935, 1, 1, 1, 1, 1,
0.1214643, 0.8658203, -0.2339265, 1, 1, 1, 1, 1,
0.1260407, 2.240324, -1.353227, 1, 1, 1, 1, 1,
0.1293226, -0.3416406, 4.148885, 1, 1, 1, 1, 1,
0.13006, 0.1246478, 1.599183, 0, 0, 1, 1, 1,
0.1310088, -0.8214015, 2.348702, 1, 0, 0, 1, 1,
0.1414501, 0.2735946, 0.1354991, 1, 0, 0, 1, 1,
0.1457534, -0.180673, 1.789248, 1, 0, 0, 1, 1,
0.1458354, -0.2887807, 2.290296, 1, 0, 0, 1, 1,
0.1467347, 0.4327257, 1.373294, 1, 0, 0, 1, 1,
0.1527535, 0.5252683, -0.4983639, 0, 0, 0, 1, 1,
0.1570215, -0.5966484, 3.713658, 0, 0, 0, 1, 1,
0.1576468, -1.395723, 4.821805, 0, 0, 0, 1, 1,
0.1611658, -0.5580751, 2.810393, 0, 0, 0, 1, 1,
0.1647879, -0.03149819, 2.177428, 0, 0, 0, 1, 1,
0.1649359, -0.8402189, 1.493588, 0, 0, 0, 1, 1,
0.1662124, -1.147068, 3.360079, 0, 0, 0, 1, 1,
0.1676695, 0.3442318, 1.366081, 1, 1, 1, 1, 1,
0.1688057, 0.9641266, 0.418871, 1, 1, 1, 1, 1,
0.1719378, 2.392231, -1.876885, 1, 1, 1, 1, 1,
0.1730073, 0.5114298, 1.075544, 1, 1, 1, 1, 1,
0.1789385, -0.1244707, 1.80614, 1, 1, 1, 1, 1,
0.1807294, 0.8273191, 0.7314183, 1, 1, 1, 1, 1,
0.1882516, 0.27365, 0.2116286, 1, 1, 1, 1, 1,
0.1899834, 0.3482884, 0.3689289, 1, 1, 1, 1, 1,
0.1948462, 1.098481, 0.2659195, 1, 1, 1, 1, 1,
0.199841, 1.226601, -0.0458529, 1, 1, 1, 1, 1,
0.2016207, -2.502329, 2.871569, 1, 1, 1, 1, 1,
0.2052914, 0.488904, -1.150196, 1, 1, 1, 1, 1,
0.2071142, 1.569836, 0.5146264, 1, 1, 1, 1, 1,
0.2073596, 0.4653567, 1.328818, 1, 1, 1, 1, 1,
0.2076479, -0.06898702, 0.8390484, 1, 1, 1, 1, 1,
0.2118161, 2.297786, 0.9475448, 0, 0, 1, 1, 1,
0.2121602, 0.07271159, 0.302796, 1, 0, 0, 1, 1,
0.2141083, -0.9284664, 1.612495, 1, 0, 0, 1, 1,
0.2146228, 0.9235111, 0.9462724, 1, 0, 0, 1, 1,
0.2164808, -0.6790839, 2.752383, 1, 0, 0, 1, 1,
0.218979, 0.2018834, 1.607543, 1, 0, 0, 1, 1,
0.2202625, 0.3221181, 0.0107025, 0, 0, 0, 1, 1,
0.2239174, 0.09060628, 3.192666, 0, 0, 0, 1, 1,
0.225465, 0.5302947, 0.7230559, 0, 0, 0, 1, 1,
0.2267462, -1.837339, 2.910226, 0, 0, 0, 1, 1,
0.227384, 0.6353484, -0.7563474, 0, 0, 0, 1, 1,
0.2297758, 0.2629139, 1.425241, 0, 0, 0, 1, 1,
0.2301195, 0.3784073, -0.2344664, 0, 0, 0, 1, 1,
0.2319393, -0.1149845, 1.596452, 1, 1, 1, 1, 1,
0.2326433, -0.8533977, 3.686648, 1, 1, 1, 1, 1,
0.2352882, 1.093489, -1.508158, 1, 1, 1, 1, 1,
0.2376453, 0.2945539, 0.7255411, 1, 1, 1, 1, 1,
0.2399649, 0.1533259, 2.793989, 1, 1, 1, 1, 1,
0.2405495, -0.7886584, 2.666794, 1, 1, 1, 1, 1,
0.2413432, -2.685136, 2.725908, 1, 1, 1, 1, 1,
0.2414121, 0.003985511, 2.217008, 1, 1, 1, 1, 1,
0.2487263, -1.374948, 2.572645, 1, 1, 1, 1, 1,
0.2545724, 2.010477, 0.573202, 1, 1, 1, 1, 1,
0.2552008, -0.6618548, 3.450708, 1, 1, 1, 1, 1,
0.2583192, -1.301201, 3.783077, 1, 1, 1, 1, 1,
0.2629834, 1.018753, -0.2163543, 1, 1, 1, 1, 1,
0.2634563, 0.05203864, 0.122892, 1, 1, 1, 1, 1,
0.265704, 1.118615, 1.352832, 1, 1, 1, 1, 1,
0.2677751, 1.352463, 0.3344439, 0, 0, 1, 1, 1,
0.2685017, -0.9680466, 2.799398, 1, 0, 0, 1, 1,
0.2713739, -0.4773334, 1.021496, 1, 0, 0, 1, 1,
0.2714754, 0.1765362, 1.759834, 1, 0, 0, 1, 1,
0.2716887, -0.4827977, 3.421405, 1, 0, 0, 1, 1,
0.2791086, -0.8092377, 1.612229, 1, 0, 0, 1, 1,
0.284135, -1.861941, 3.583514, 0, 0, 0, 1, 1,
0.2851924, 0.01241233, 1.17235, 0, 0, 0, 1, 1,
0.2857975, -1.374344, 1.182841, 0, 0, 0, 1, 1,
0.2863999, -0.8333035, 2.025661, 0, 0, 0, 1, 1,
0.2931246, 0.149817, -0.1253057, 0, 0, 0, 1, 1,
0.2975155, 0.4997586, 1.056953, 0, 0, 0, 1, 1,
0.2991215, 0.9716386, 0.5011809, 0, 0, 0, 1, 1,
0.2995219, 2.101902, -0.2258424, 1, 1, 1, 1, 1,
0.2999467, 0.07102255, 0.9874523, 1, 1, 1, 1, 1,
0.3012784, -0.2635542, 2.80213, 1, 1, 1, 1, 1,
0.3021486, 1.654021, -1.078949, 1, 1, 1, 1, 1,
0.3035271, 0.3223398, 1.158098, 1, 1, 1, 1, 1,
0.3052489, -2.838295, 2.700075, 1, 1, 1, 1, 1,
0.3089191, 0.3147235, -0.3863121, 1, 1, 1, 1, 1,
0.3120428, -0.4942495, 1.469526, 1, 1, 1, 1, 1,
0.3127061, 0.3447337, 1.403878, 1, 1, 1, 1, 1,
0.3129628, 0.7486543, 0.1900609, 1, 1, 1, 1, 1,
0.3176019, -0.5905377, 1.318905, 1, 1, 1, 1, 1,
0.3232115, -0.2988249, 2.683429, 1, 1, 1, 1, 1,
0.3274067, -0.7976092, 4.054045, 1, 1, 1, 1, 1,
0.3285204, 2.620903, 1.521442, 1, 1, 1, 1, 1,
0.3308703, 0.3071896, 1.791946, 1, 1, 1, 1, 1,
0.3431848, 0.1137776, 2.143308, 0, 0, 1, 1, 1,
0.3443481, -0.7196225, 3.52427, 1, 0, 0, 1, 1,
0.3449733, -0.8117067, 3.77675, 1, 0, 0, 1, 1,
0.3546163, 0.8608625, 2.370598, 1, 0, 0, 1, 1,
0.3568029, -0.008094015, 0.7745766, 1, 0, 0, 1, 1,
0.3580212, 0.7615475, -0.7126805, 1, 0, 0, 1, 1,
0.3593512, -0.6022198, 4.722138, 0, 0, 0, 1, 1,
0.363567, 2.375019, -0.705345, 0, 0, 0, 1, 1,
0.366522, -0.6861747, 1.290286, 0, 0, 0, 1, 1,
0.3665967, 0.359025, 0.3733261, 0, 0, 0, 1, 1,
0.3668431, 1.625805, 2.633118, 0, 0, 0, 1, 1,
0.3712321, 1.84312, -1.317462, 0, 0, 0, 1, 1,
0.3723583, 0.2399337, 1.72967, 0, 0, 0, 1, 1,
0.3739173, 0.6786365, 0.4451631, 1, 1, 1, 1, 1,
0.3748202, 1.305176, -0.5977303, 1, 1, 1, 1, 1,
0.3835207, 1.975966, 0.3623712, 1, 1, 1, 1, 1,
0.3841386, -2.106038, 4.107187, 1, 1, 1, 1, 1,
0.3845325, 1.685284, 1.904229, 1, 1, 1, 1, 1,
0.3892909, -0.5149415, 1.582004, 1, 1, 1, 1, 1,
0.3918976, 0.2674545, 1.53459, 1, 1, 1, 1, 1,
0.3929944, -0.8007894, 2.60383, 1, 1, 1, 1, 1,
0.3931475, -0.1395134, 1.995158, 1, 1, 1, 1, 1,
0.3952493, -0.5358561, 2.055614, 1, 1, 1, 1, 1,
0.3958188, 0.5253141, 1.224638, 1, 1, 1, 1, 1,
0.400047, 0.06530754, 1.248737, 1, 1, 1, 1, 1,
0.4011352, 1.047007, -0.4679909, 1, 1, 1, 1, 1,
0.4019069, -0.5042511, 2.032047, 1, 1, 1, 1, 1,
0.4030113, -0.920918, 2.305975, 1, 1, 1, 1, 1,
0.4030499, 0.6367571, 1.085465, 0, 0, 1, 1, 1,
0.4058037, -0.5459849, 1.64692, 1, 0, 0, 1, 1,
0.4123897, -0.05295213, 1.004986, 1, 0, 0, 1, 1,
0.4212657, -0.3135829, 3.926091, 1, 0, 0, 1, 1,
0.4253855, 0.7273968, -1.01941, 1, 0, 0, 1, 1,
0.4277371, -0.5904795, 2.920682, 1, 0, 0, 1, 1,
0.4277919, 0.6957873, -0.5668016, 0, 0, 0, 1, 1,
0.4289273, -0.3265668, 2.800565, 0, 0, 0, 1, 1,
0.4298392, -0.7675983, 1.941885, 0, 0, 0, 1, 1,
0.4305983, -0.08041239, -0.4938844, 0, 0, 0, 1, 1,
0.4308752, 0.003152887, 2.352806, 0, 0, 0, 1, 1,
0.4324041, 0.1523329, 1.514843, 0, 0, 0, 1, 1,
0.4349143, -2.336229, 3.124253, 0, 0, 0, 1, 1,
0.4387909, 1.719507, 0.8127245, 1, 1, 1, 1, 1,
0.4410239, 0.1938908, 2.675783, 1, 1, 1, 1, 1,
0.4411452, 0.2111839, 0.5822364, 1, 1, 1, 1, 1,
0.4433585, -1.034266, 1.989549, 1, 1, 1, 1, 1,
0.4468429, -0.134976, 0.3294958, 1, 1, 1, 1, 1,
0.4479055, -0.6247941, 0.4684325, 1, 1, 1, 1, 1,
0.4529026, 0.6221824, -1.003581, 1, 1, 1, 1, 1,
0.4542767, -0.9949639, 2.195974, 1, 1, 1, 1, 1,
0.4582918, 2.138619, 1.390966, 1, 1, 1, 1, 1,
0.4594991, 1.608563, 1.081518, 1, 1, 1, 1, 1,
0.4678895, 0.06966168, 2.255385, 1, 1, 1, 1, 1,
0.4694211, -0.7025117, 2.946371, 1, 1, 1, 1, 1,
0.4694453, -0.02785144, 1.422766, 1, 1, 1, 1, 1,
0.4711988, -1.820674, 1.57817, 1, 1, 1, 1, 1,
0.4721937, 0.4931842, -0.4535921, 1, 1, 1, 1, 1,
0.4725983, -1.162864, 2.946496, 0, 0, 1, 1, 1,
0.4770119, -0.2648163, 2.290115, 1, 0, 0, 1, 1,
0.4808825, 1.344017, 0.4964689, 1, 0, 0, 1, 1,
0.4911867, -0.5901149, 3.421307, 1, 0, 0, 1, 1,
0.4916261, -1.048697, 4.346383, 1, 0, 0, 1, 1,
0.4925449, -1.302, 2.338757, 1, 0, 0, 1, 1,
0.4929094, -0.4914626, 2.591111, 0, 0, 0, 1, 1,
0.4931782, -1.319824, 4.571766, 0, 0, 0, 1, 1,
0.4936041, -0.4196873, 2.058547, 0, 0, 0, 1, 1,
0.4966989, -0.2871881, 1.749125, 0, 0, 0, 1, 1,
0.4971503, 1.405714, 0.04252535, 0, 0, 0, 1, 1,
0.4977028, 1.849199, -1.213243, 0, 0, 0, 1, 1,
0.4993276, -0.5842714, 1.93333, 0, 0, 0, 1, 1,
0.5131619, -0.3920522, 1.144782, 1, 1, 1, 1, 1,
0.5149745, -0.07922122, 3.952251, 1, 1, 1, 1, 1,
0.5157889, -0.7242198, 3.629242, 1, 1, 1, 1, 1,
0.5162737, 0.6196173, 1.874144, 1, 1, 1, 1, 1,
0.5179371, -0.5346457, 3.408515, 1, 1, 1, 1, 1,
0.5196288, -1.5312, 4.221855, 1, 1, 1, 1, 1,
0.521094, -0.2970598, 3.252407, 1, 1, 1, 1, 1,
0.5271412, -0.3941926, 2.013833, 1, 1, 1, 1, 1,
0.5294871, 0.2501855, -0.09129588, 1, 1, 1, 1, 1,
0.5295969, -0.06951621, 1.685236, 1, 1, 1, 1, 1,
0.530794, 0.4584915, 2.48425, 1, 1, 1, 1, 1,
0.5312295, 1.4695, 0.7551201, 1, 1, 1, 1, 1,
0.5316775, 0.04282203, 1.846078, 1, 1, 1, 1, 1,
0.5345789, -0.3795177, 3.512872, 1, 1, 1, 1, 1,
0.5368977, 1.239295, 0.8152099, 1, 1, 1, 1, 1,
0.5371935, 0.1954017, 0.3302678, 0, 0, 1, 1, 1,
0.5374011, 0.860182, 0.1388309, 1, 0, 0, 1, 1,
0.5397448, 1.656639, 0.1220987, 1, 0, 0, 1, 1,
0.5411259, 1.352521, 1.109496, 1, 0, 0, 1, 1,
0.5413309, 0.1660011, 0.8784782, 1, 0, 0, 1, 1,
0.5421817, 0.7655011, -1.63246, 1, 0, 0, 1, 1,
0.5429936, 1.117882, 1.700894, 0, 0, 0, 1, 1,
0.5450098, 0.7384033, -1.164745, 0, 0, 0, 1, 1,
0.5458393, 0.3236163, 0.9772754, 0, 0, 0, 1, 1,
0.5465734, 0.06074962, 0.2880619, 0, 0, 0, 1, 1,
0.5513278, 1.001554, -1.82799, 0, 0, 0, 1, 1,
0.5528111, -1.075574, 1.965183, 0, 0, 0, 1, 1,
0.554736, 1.372872, 1.255601, 0, 0, 0, 1, 1,
0.5593031, -1.523449, 2.449108, 1, 1, 1, 1, 1,
0.5616675, -1.117143, 3.935306, 1, 1, 1, 1, 1,
0.5618792, 0.7502056, -0.08132216, 1, 1, 1, 1, 1,
0.5704037, 0.2678282, 0.05428194, 1, 1, 1, 1, 1,
0.5741792, 2.058971, 0.3235013, 1, 1, 1, 1, 1,
0.5761058, 0.8446349, -0.2379364, 1, 1, 1, 1, 1,
0.5780653, 0.5208592, 1.004291, 1, 1, 1, 1, 1,
0.587858, -1.779068, 3.105287, 1, 1, 1, 1, 1,
0.6045727, -0.2796738, 3.913785, 1, 1, 1, 1, 1,
0.6069646, -0.9418173, 2.307314, 1, 1, 1, 1, 1,
0.6122826, -0.6012233, 0.7644626, 1, 1, 1, 1, 1,
0.6141583, 0.9560963, 0.7444982, 1, 1, 1, 1, 1,
0.6146453, -0.5897856, 1.983654, 1, 1, 1, 1, 1,
0.6180354, -0.4753577, 1.368243, 1, 1, 1, 1, 1,
0.6233136, -1.562373, 2.461789, 1, 1, 1, 1, 1,
0.62959, 0.09340557, 2.327359, 0, 0, 1, 1, 1,
0.6415718, -0.7316873, 2.630648, 1, 0, 0, 1, 1,
0.6445168, -0.2471622, 1.104888, 1, 0, 0, 1, 1,
0.6497502, 1.532706, 0.612998, 1, 0, 0, 1, 1,
0.654215, -0.494879, 1.223701, 1, 0, 0, 1, 1,
0.6620225, 0.6965483, 0.802781, 1, 0, 0, 1, 1,
0.6632526, 1.382104, 1.103129, 0, 0, 0, 1, 1,
0.6636171, -0.2665781, 1.858774, 0, 0, 0, 1, 1,
0.6638234, 0.4156485, 0.7005293, 0, 0, 0, 1, 1,
0.6642854, -0.4724958, 1.689303, 0, 0, 0, 1, 1,
0.6649854, -1.188289, 3.155157, 0, 0, 0, 1, 1,
0.6749642, -0.44182, 3.110679, 0, 0, 0, 1, 1,
0.6771134, 0.1840709, -0.218426, 0, 0, 0, 1, 1,
0.6798758, -0.01505594, 2.146062, 1, 1, 1, 1, 1,
0.6838365, -1.309363, 1.837429, 1, 1, 1, 1, 1,
0.6840803, -0.6970986, 1.619097, 1, 1, 1, 1, 1,
0.6842136, -0.9189788, 2.42744, 1, 1, 1, 1, 1,
0.6843868, -0.2684183, -0.1436317, 1, 1, 1, 1, 1,
0.6849377, -0.6971635, 1.228685, 1, 1, 1, 1, 1,
0.6852273, 0.2898802, 2.47533, 1, 1, 1, 1, 1,
0.6864285, -2.138314, 3.307527, 1, 1, 1, 1, 1,
0.6898893, 2.588072, -0.5674997, 1, 1, 1, 1, 1,
0.6958869, -0.5886583, 2.915032, 1, 1, 1, 1, 1,
0.7059392, -0.3636664, 3.010082, 1, 1, 1, 1, 1,
0.7111615, 0.2450957, 1.350229, 1, 1, 1, 1, 1,
0.7122676, -0.4779262, 1.475142, 1, 1, 1, 1, 1,
0.7187255, 0.8806753, 0.4191638, 1, 1, 1, 1, 1,
0.7204539, -1.428306, 4.254917, 1, 1, 1, 1, 1,
0.7247699, -1.88072, 2.747722, 0, 0, 1, 1, 1,
0.725284, 0.3213566, 1.391068, 1, 0, 0, 1, 1,
0.7277603, -0.6585432, 2.785819, 1, 0, 0, 1, 1,
0.7458539, 1.663338, -0.8863444, 1, 0, 0, 1, 1,
0.7460841, -0.4487448, 1.706062, 1, 0, 0, 1, 1,
0.7524553, -0.9523586, 2.036549, 1, 0, 0, 1, 1,
0.7554989, 0.8561804, 1.146593, 0, 0, 0, 1, 1,
0.756644, -1.692503, 3.664845, 0, 0, 0, 1, 1,
0.7648213, 1.934136, 1.127254, 0, 0, 0, 1, 1,
0.7652434, -0.8890318, 3.571936, 0, 0, 0, 1, 1,
0.767068, -1.964253, 2.479315, 0, 0, 0, 1, 1,
0.7674449, 0.4866268, 1.610872, 0, 0, 0, 1, 1,
0.785515, 0.6349303, -1.54414, 0, 0, 0, 1, 1,
0.7868645, -0.4634118, 2.413917, 1, 1, 1, 1, 1,
0.7926244, -0.9198756, 4.187601, 1, 1, 1, 1, 1,
0.792905, -0.05167168, 2.458254, 1, 1, 1, 1, 1,
0.8005201, 0.04159132, -0.4673767, 1, 1, 1, 1, 1,
0.8096037, 0.2096812, 1.970677, 1, 1, 1, 1, 1,
0.810547, -1.112534, 5.2069, 1, 1, 1, 1, 1,
0.8259259, -1.925063, 2.162425, 1, 1, 1, 1, 1,
0.8269049, 0.3354096, -1.701282, 1, 1, 1, 1, 1,
0.828732, 1.494558, 1.691894, 1, 1, 1, 1, 1,
0.8372565, -1.739157, 2.887646, 1, 1, 1, 1, 1,
0.8428985, 0.6645056, 1.648289, 1, 1, 1, 1, 1,
0.8524657, -0.4914811, 2.408944, 1, 1, 1, 1, 1,
0.8622789, -0.4086573, 3.589603, 1, 1, 1, 1, 1,
0.863034, -1.285192, 3.990282, 1, 1, 1, 1, 1,
0.8630729, -0.02659558, 1.882816, 1, 1, 1, 1, 1,
0.8631768, -1.413859, 2.002861, 0, 0, 1, 1, 1,
0.864519, -1.25999, 2.601393, 1, 0, 0, 1, 1,
0.8656423, 0.9841725, -0.4994009, 1, 0, 0, 1, 1,
0.8690706, 1.16081, -0.2268151, 1, 0, 0, 1, 1,
0.8751013, -0.1598062, 0.7194731, 1, 0, 0, 1, 1,
0.8814503, 0.2434171, 0.4911661, 1, 0, 0, 1, 1,
0.8864596, 1.586443, 1.646721, 0, 0, 0, 1, 1,
0.8912422, 1.29739, 2.097455, 0, 0, 0, 1, 1,
0.9003235, -1.421389, 2.804326, 0, 0, 0, 1, 1,
0.9009774, -2.560486, 3.527678, 0, 0, 0, 1, 1,
0.9046981, 0.06380542, 0.2216954, 0, 0, 0, 1, 1,
0.9072727, 0.3126816, 1.296495, 0, 0, 0, 1, 1,
0.9184195, -1.176218, 3.123183, 0, 0, 0, 1, 1,
0.9195815, 0.7260233, -0.1286185, 1, 1, 1, 1, 1,
0.920519, -0.4240259, 2.789058, 1, 1, 1, 1, 1,
0.925531, -0.3596604, 1.643586, 1, 1, 1, 1, 1,
0.9298771, 0.00896387, 1.461985, 1, 1, 1, 1, 1,
0.9309918, -0.03149844, 3.209373, 1, 1, 1, 1, 1,
0.9429816, 2.235707, -0.5982535, 1, 1, 1, 1, 1,
0.9430275, -1.456078, 0.7780952, 1, 1, 1, 1, 1,
0.9612198, -1.172497, 1.504202, 1, 1, 1, 1, 1,
0.9625212, -1.266951, 3.351067, 1, 1, 1, 1, 1,
0.9639236, -0.9229547, 3.811133, 1, 1, 1, 1, 1,
0.964022, -1.184305, 1.87044, 1, 1, 1, 1, 1,
0.9762052, -3.34736, 3.138872, 1, 1, 1, 1, 1,
0.9871253, 0.1397369, 1.348973, 1, 1, 1, 1, 1,
0.9910307, -1.570395, 3.3381, 1, 1, 1, 1, 1,
0.9917405, -0.5640173, 2.687145, 1, 1, 1, 1, 1,
0.9928542, -0.5507769, 2.552096, 0, 0, 1, 1, 1,
0.9936904, -0.5669329, 2.416395, 1, 0, 0, 1, 1,
0.994731, 1.284092, 0.7659761, 1, 0, 0, 1, 1,
1.002518, 0.08478013, 1.914488, 1, 0, 0, 1, 1,
1.016148, -0.1253897, 1.970964, 1, 0, 0, 1, 1,
1.020247, 1.988991, 0.2180139, 1, 0, 0, 1, 1,
1.025915, 1.382488, 0.821812, 0, 0, 0, 1, 1,
1.032586, -0.7442386, 4.40275, 0, 0, 0, 1, 1,
1.034839, -1.684216, 0.8591371, 0, 0, 0, 1, 1,
1.058, -0.3700411, 3.053399, 0, 0, 0, 1, 1,
1.059881, 0.2089752, 2.303604, 0, 0, 0, 1, 1,
1.062219, -0.4572263, 1.841959, 0, 0, 0, 1, 1,
1.064085, -1.404528, 1.773848, 0, 0, 0, 1, 1,
1.070651, 1.064636, 1.367079, 1, 1, 1, 1, 1,
1.074244, -0.4154041, 2.498139, 1, 1, 1, 1, 1,
1.086329, 0.3153609, 2.151157, 1, 1, 1, 1, 1,
1.088983, 1.444684, -0.1248829, 1, 1, 1, 1, 1,
1.089749, -0.8403346, 2.913893, 1, 1, 1, 1, 1,
1.094944, -0.362713, 0.7252413, 1, 1, 1, 1, 1,
1.095367, 0.2775781, 0.1401267, 1, 1, 1, 1, 1,
1.096369, -0.6312234, 1.522193, 1, 1, 1, 1, 1,
1.097387, -1.127879, 2.581889, 1, 1, 1, 1, 1,
1.10377, -0.2170273, 1.87215, 1, 1, 1, 1, 1,
1.108067, -0.9585701, 3.862864, 1, 1, 1, 1, 1,
1.110215, -2.445476, 2.626342, 1, 1, 1, 1, 1,
1.113049, 0.2938931, 0.4434491, 1, 1, 1, 1, 1,
1.118381, 0.9460462, -0.0382024, 1, 1, 1, 1, 1,
1.121494, -0.8364472, 1.659801, 1, 1, 1, 1, 1,
1.12593, 0.957132, 2.270268, 0, 0, 1, 1, 1,
1.137013, 0.2213741, 2.562188, 1, 0, 0, 1, 1,
1.142841, -1.75956, 2.371188, 1, 0, 0, 1, 1,
1.145293, -1.735006, 4.416352, 1, 0, 0, 1, 1,
1.156233, -0.408473, 2.523956, 1, 0, 0, 1, 1,
1.170603, 0.7804413, 1.125202, 1, 0, 0, 1, 1,
1.180627, 1.173351, -0.1228801, 0, 0, 0, 1, 1,
1.183982, 1.473584, 0.6352188, 0, 0, 0, 1, 1,
1.187454, 0.569355, 2.249866, 0, 0, 0, 1, 1,
1.193756, -1.68066, 2.924017, 0, 0, 0, 1, 1,
1.193921, 1.181437, 0.7026098, 0, 0, 0, 1, 1,
1.201326, 0.7457002, 0.5127301, 0, 0, 0, 1, 1,
1.202475, -0.6204255, 3.172021, 0, 0, 0, 1, 1,
1.210114, -0.496016, 0.4662629, 1, 1, 1, 1, 1,
1.218541, 0.292822, 0.2200771, 1, 1, 1, 1, 1,
1.221249, -0.6559256, 0.5736635, 1, 1, 1, 1, 1,
1.224298, 0.401211, 1.384145, 1, 1, 1, 1, 1,
1.228314, -0.7856927, 1.332041, 1, 1, 1, 1, 1,
1.229184, 0.2603002, 0.6440314, 1, 1, 1, 1, 1,
1.231245, 1.139776, 2.027908, 1, 1, 1, 1, 1,
1.231497, -1.339639, 2.617678, 1, 1, 1, 1, 1,
1.243613, 0.7980354, 1.164297, 1, 1, 1, 1, 1,
1.245246, -0.4653735, 2.074435, 1, 1, 1, 1, 1,
1.246155, 1.32513, 0.7082773, 1, 1, 1, 1, 1,
1.249473, -0.4861934, 3.299959, 1, 1, 1, 1, 1,
1.257752, 1.36544, -0.2343405, 1, 1, 1, 1, 1,
1.261555, -1.759218, 1.781301, 1, 1, 1, 1, 1,
1.273997, 2.100018, -0.915246, 1, 1, 1, 1, 1,
1.274455, -0.01510101, 1.610426, 0, 0, 1, 1, 1,
1.29731, 0.1756695, 1.291006, 1, 0, 0, 1, 1,
1.299714, 0.4675346, 1.983203, 1, 0, 0, 1, 1,
1.305658, 0.8190044, 1.502907, 1, 0, 0, 1, 1,
1.317366, -0.8473667, 0.6937408, 1, 0, 0, 1, 1,
1.317966, 0.9156289, 0.7938244, 1, 0, 0, 1, 1,
1.323045, 0.3044699, 1.091372, 0, 0, 0, 1, 1,
1.327873, -1.130382, 2.251328, 0, 0, 0, 1, 1,
1.335746, -0.05611566, 1.491591, 0, 0, 0, 1, 1,
1.340877, -1.663844, 4.389996, 0, 0, 0, 1, 1,
1.343329, -0.5559234, 2.520884, 0, 0, 0, 1, 1,
1.353301, -0.4141946, 1.684039, 0, 0, 0, 1, 1,
1.353332, -2.053485, 2.692591, 0, 0, 0, 1, 1,
1.355023, 0.3427422, 2.479632, 1, 1, 1, 1, 1,
1.355824, 0.9438634, -0.2129572, 1, 1, 1, 1, 1,
1.358918, -1.007305, 1.673635, 1, 1, 1, 1, 1,
1.368568, 0.8179765, 1.069661, 1, 1, 1, 1, 1,
1.378401, 2.330854, -0.959996, 1, 1, 1, 1, 1,
1.383975, 0.2818567, 1.910928, 1, 1, 1, 1, 1,
1.388089, -1.204482, 2.952502, 1, 1, 1, 1, 1,
1.406918, -0.06883764, 1.15729, 1, 1, 1, 1, 1,
1.426717, 0.8318073, 0.9033512, 1, 1, 1, 1, 1,
1.432093, -1.577933, 2.475475, 1, 1, 1, 1, 1,
1.437186, -1.391017, 3.56, 1, 1, 1, 1, 1,
1.438188, -0.5191654, 2.226085, 1, 1, 1, 1, 1,
1.441967, 0.3160557, 0.8521081, 1, 1, 1, 1, 1,
1.443305, 1.615501, 1.813051, 1, 1, 1, 1, 1,
1.457929, -1.461721, 1.186022, 1, 1, 1, 1, 1,
1.458324, -1.23339, 2.72596, 0, 0, 1, 1, 1,
1.459391, 0.6201443, 2.133595, 1, 0, 0, 1, 1,
1.460701, -0.05201007, 0.3290214, 1, 0, 0, 1, 1,
1.464623, -0.2049805, 2.373912, 1, 0, 0, 1, 1,
1.476703, 0.3276377, 0.5002976, 1, 0, 0, 1, 1,
1.493939, 1.194428, 1.843227, 1, 0, 0, 1, 1,
1.501522, 1.963524, -0.3378, 0, 0, 0, 1, 1,
1.510663, -0.05366729, 0.8228256, 0, 0, 0, 1, 1,
1.517906, -0.9971904, 2.007535, 0, 0, 0, 1, 1,
1.53585, 1.598109, 0.02225732, 0, 0, 0, 1, 1,
1.55585, -0.2615337, 2.369328, 0, 0, 0, 1, 1,
1.560991, -1.371068, 3.959874, 0, 0, 0, 1, 1,
1.588361, 0.1712916, 0.3693245, 0, 0, 0, 1, 1,
1.593081, 0.2624037, 2.315799, 1, 1, 1, 1, 1,
1.60333, 0.4672395, 0.8938166, 1, 1, 1, 1, 1,
1.605163, -2.310815, 3.552728, 1, 1, 1, 1, 1,
1.62048, -0.372069, 1.656933, 1, 1, 1, 1, 1,
1.62232, 0.8802479, 0.252724, 1, 1, 1, 1, 1,
1.631137, -0.5790731, 1.02639, 1, 1, 1, 1, 1,
1.633502, 0.8279823, -0.4792714, 1, 1, 1, 1, 1,
1.639956, -0.5030004, 0.5948905, 1, 1, 1, 1, 1,
1.641414, -0.9099352, 1.069332, 1, 1, 1, 1, 1,
1.649675, -0.334366, 1.266634, 1, 1, 1, 1, 1,
1.65061, 1.504485, 0.04825735, 1, 1, 1, 1, 1,
1.6715, -0.3163863, 0.9528376, 1, 1, 1, 1, 1,
1.671504, -0.910544, 2.482974, 1, 1, 1, 1, 1,
1.678061, -2.581312, 2.644649, 1, 1, 1, 1, 1,
1.689633, -0.7590772, 1.425092, 1, 1, 1, 1, 1,
1.692331, -2.269068, 3.291568, 0, 0, 1, 1, 1,
1.702618, 0.6340241, 1.101129, 1, 0, 0, 1, 1,
1.708581, -1.744323, 1.921549, 1, 0, 0, 1, 1,
1.720009, -0.6299033, 0.3476083, 1, 0, 0, 1, 1,
1.724529, -0.9078503, 3.656682, 1, 0, 0, 1, 1,
1.733272, 0.9480183, 1.154938, 1, 0, 0, 1, 1,
1.738057, -0.2322113, 1.031403, 0, 0, 0, 1, 1,
1.75556, 1.855852, 1.495238, 0, 0, 0, 1, 1,
1.758609, -0.178469, 0.02045427, 0, 0, 0, 1, 1,
1.788352, -1.670083, 3.1631, 0, 0, 0, 1, 1,
1.790754, 0.06928531, 2.812989, 0, 0, 0, 1, 1,
1.800506, 1.340874, -1.236655, 0, 0, 0, 1, 1,
1.805615, 0.0003633928, 1.904417, 0, 0, 0, 1, 1,
1.81963, -1.076069, 1.816459, 1, 1, 1, 1, 1,
1.823263, 1.336879, -0.04573199, 1, 1, 1, 1, 1,
1.826071, 0.0100172, 0.7940012, 1, 1, 1, 1, 1,
1.838925, -1.066163, 3.494678, 1, 1, 1, 1, 1,
1.849778, -0.5415418, 2.880008, 1, 1, 1, 1, 1,
1.85413, 0.750907, 1.95096, 1, 1, 1, 1, 1,
1.863397, -1.658245, 3.208693, 1, 1, 1, 1, 1,
1.865957, -1.068088, 3.742616, 1, 1, 1, 1, 1,
1.868049, 2.396527, 0.0207688, 1, 1, 1, 1, 1,
1.926561, 0.6513014, 1.904171, 1, 1, 1, 1, 1,
1.958938, 0.113265, 0.8538147, 1, 1, 1, 1, 1,
1.959492, -1.197883, 3.385476, 1, 1, 1, 1, 1,
1.963414, -0.5931191, 2.891066, 1, 1, 1, 1, 1,
1.974111, -0.06314658, 2.858117, 1, 1, 1, 1, 1,
1.981101, 1.898674, 2.658674, 1, 1, 1, 1, 1,
2.027994, -0.5271425, 1.683651, 0, 0, 1, 1, 1,
2.045483, 0.8408587, -1.393967, 1, 0, 0, 1, 1,
2.089677, 0.1531195, 0.2048093, 1, 0, 0, 1, 1,
2.099505, 0.198531, 1.071692, 1, 0, 0, 1, 1,
2.138345, -0.3968631, 2.189607, 1, 0, 0, 1, 1,
2.143652, 0.1884631, 1.815537, 1, 0, 0, 1, 1,
2.246296, 0.6476539, 1.724419, 0, 0, 0, 1, 1,
2.250271, -1.381626, 2.24737, 0, 0, 0, 1, 1,
2.27591, -1.189085, 2.408281, 0, 0, 0, 1, 1,
2.279326, -0.3821553, 1.824214, 0, 0, 0, 1, 1,
2.395966, 0.6056084, 1.780949, 0, 0, 0, 1, 1,
2.501757, -1.339525, 1.126248, 0, 0, 0, 1, 1,
2.58776, -0.8836234, 1.100342, 0, 0, 0, 1, 1,
2.622846, -1.706398, 3.175975, 1, 1, 1, 1, 1,
2.656875, 0.9190248, -0.8277246, 1, 1, 1, 1, 1,
2.702203, 0.8773742, 1.550651, 1, 1, 1, 1, 1,
2.739012, -0.7780336, 3.690028, 1, 1, 1, 1, 1,
2.867818, -1.807147, -0.3920922, 1, 1, 1, 1, 1,
2.982825, -0.7401983, 1.96289, 1, 1, 1, 1, 1,
3.440864, 0.4115043, 1.636127, 1, 1, 1, 1, 1
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
var radius = 9.754452;
var distance = 34.2621;
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
mvMatrix.translate( -0.276032, 0.05724478, 0.3101625 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2621);
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
