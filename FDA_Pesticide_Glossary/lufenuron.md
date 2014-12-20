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
-3.606387, -0.1527262, 0.5104948, 1, 0, 0, 1,
-2.825966, 1.304824, -3.314378, 1, 0.007843138, 0, 1,
-2.661255, 0.542333, -2.018299, 1, 0.01176471, 0, 1,
-2.612677, 0.6132352, -1.421341, 1, 0.01960784, 0, 1,
-2.484338, 0.05665493, -2.604818, 1, 0.02352941, 0, 1,
-2.39598, -0.221452, -2.166211, 1, 0.03137255, 0, 1,
-2.38347, 1.19527, -0.7898342, 1, 0.03529412, 0, 1,
-2.352515, 0.01803866, -2.070449, 1, 0.04313726, 0, 1,
-2.328948, 1.073615, 0.801028, 1, 0.04705882, 0, 1,
-2.312054, 0.5075061, -2.499957, 1, 0.05490196, 0, 1,
-2.304448, 0.9279931, -0.1779052, 1, 0.05882353, 0, 1,
-2.237192, -0.7264125, -1.683788, 1, 0.06666667, 0, 1,
-2.211106, -0.4881047, -2.248371, 1, 0.07058824, 0, 1,
-2.171959, -0.5555677, -3.521661, 1, 0.07843138, 0, 1,
-2.075138, -0.4246717, -1.40535, 1, 0.08235294, 0, 1,
-2.071376, 0.7028031, 0.1830404, 1, 0.09019608, 0, 1,
-2.064865, 1.978221, 0.5655705, 1, 0.09411765, 0, 1,
-2.041427, -1.391796, -2.375673, 1, 0.1019608, 0, 1,
-2.026744, 0.570673, -0.2034618, 1, 0.1098039, 0, 1,
-1.999845, -0.4109138, -0.8509267, 1, 0.1137255, 0, 1,
-1.983467, 0.4319564, 0.06176735, 1, 0.1215686, 0, 1,
-1.968924, 0.4854509, -1.379047, 1, 0.1254902, 0, 1,
-1.941677, 0.5931287, -1.679329, 1, 0.1333333, 0, 1,
-1.94084, -0.2060525, -0.7903941, 1, 0.1372549, 0, 1,
-1.930214, 1.051032, -0.4219448, 1, 0.145098, 0, 1,
-1.927577, -0.3392919, -1.898981, 1, 0.1490196, 0, 1,
-1.911205, 2.252029, -0.4626758, 1, 0.1568628, 0, 1,
-1.882461, 0.8729742, -1.850305, 1, 0.1607843, 0, 1,
-1.851232, 0.02602202, -2.376312, 1, 0.1686275, 0, 1,
-1.850051, 2.301214, -0.335798, 1, 0.172549, 0, 1,
-1.833946, 1.607151, -0.3299224, 1, 0.1803922, 0, 1,
-1.833572, -1.281718, -1.769193, 1, 0.1843137, 0, 1,
-1.814127, 1.439726, -0.866394, 1, 0.1921569, 0, 1,
-1.790622, 1.306698, -0.1218543, 1, 0.1960784, 0, 1,
-1.788751, -0.7825236, -0.8809757, 1, 0.2039216, 0, 1,
-1.773213, 2.5166, -0.1026045, 1, 0.2117647, 0, 1,
-1.747507, -1.310456, -3.09724, 1, 0.2156863, 0, 1,
-1.744442, 0.9552836, -0.3630743, 1, 0.2235294, 0, 1,
-1.744244, 0.2614949, -1.264663, 1, 0.227451, 0, 1,
-1.743254, 0.7253922, -1.637566, 1, 0.2352941, 0, 1,
-1.717489, 0.2009789, -1.876026, 1, 0.2392157, 0, 1,
-1.714848, 0.1476399, -0.4716983, 1, 0.2470588, 0, 1,
-1.714275, 1.329398, -1.863256, 1, 0.2509804, 0, 1,
-1.712727, 1.310604, -0.5424463, 1, 0.2588235, 0, 1,
-1.700845, -0.9741783, -3.532274, 1, 0.2627451, 0, 1,
-1.700056, -1.30288, -1.543231, 1, 0.2705882, 0, 1,
-1.694447, -0.4495247, -0.2534138, 1, 0.2745098, 0, 1,
-1.686115, -2.238451, -1.751711, 1, 0.282353, 0, 1,
-1.678687, 0.6299511, -1.715434, 1, 0.2862745, 0, 1,
-1.673455, -0.8386207, -1.277411, 1, 0.2941177, 0, 1,
-1.672084, 1.119037, -1.766035, 1, 0.3019608, 0, 1,
-1.665433, 0.2988172, -1.22266, 1, 0.3058824, 0, 1,
-1.657117, -0.1892287, -1.153751, 1, 0.3137255, 0, 1,
-1.643536, 1.417917, -0.7760615, 1, 0.3176471, 0, 1,
-1.643143, -0.3149134, -2.157908, 1, 0.3254902, 0, 1,
-1.642202, -0.2387147, 0.4425903, 1, 0.3294118, 0, 1,
-1.635934, 0.5822645, -1.271884, 1, 0.3372549, 0, 1,
-1.633039, -0.8972698, -1.552218, 1, 0.3411765, 0, 1,
-1.59466, 1.798048, -1.88364, 1, 0.3490196, 0, 1,
-1.593493, 0.4275393, -2.116058, 1, 0.3529412, 0, 1,
-1.56823, -0.6174285, -1.893973, 1, 0.3607843, 0, 1,
-1.554481, -0.03207823, -2.803883, 1, 0.3647059, 0, 1,
-1.546997, 0.1825057, -3.669034, 1, 0.372549, 0, 1,
-1.534073, 0.2000154, -4.02762, 1, 0.3764706, 0, 1,
-1.515035, 0.6712244, -1.148656, 1, 0.3843137, 0, 1,
-1.514047, 0.1164275, -0.227384, 1, 0.3882353, 0, 1,
-1.507175, -0.6266862, -1.06395, 1, 0.3960784, 0, 1,
-1.502408, -2.083771, -1.245289, 1, 0.4039216, 0, 1,
-1.498377, 0.5092748, -3.600815, 1, 0.4078431, 0, 1,
-1.496738, -0.7430369, -0.6325532, 1, 0.4156863, 0, 1,
-1.489101, 0.3459601, -0.7850372, 1, 0.4196078, 0, 1,
-1.484104, 0.4263407, -0.605379, 1, 0.427451, 0, 1,
-1.48401, -0.4166366, -0.8397597, 1, 0.4313726, 0, 1,
-1.479924, 1.384934, -0.9402456, 1, 0.4392157, 0, 1,
-1.477956, 0.9887776, 0.5321223, 1, 0.4431373, 0, 1,
-1.466214, -0.4065723, -1.163805, 1, 0.4509804, 0, 1,
-1.452963, 1.675262, -1.751556, 1, 0.454902, 0, 1,
-1.447892, 0.4812203, -0.7517728, 1, 0.4627451, 0, 1,
-1.446941, -0.8698781, -4.430064, 1, 0.4666667, 0, 1,
-1.443834, 0.4413333, 0.43367, 1, 0.4745098, 0, 1,
-1.425096, 0.3087782, -0.3595575, 1, 0.4784314, 0, 1,
-1.412399, -0.5576968, -0.4826461, 1, 0.4862745, 0, 1,
-1.404205, -0.01720524, -0.4832659, 1, 0.4901961, 0, 1,
-1.39664, 0.7434221, 0.3054465, 1, 0.4980392, 0, 1,
-1.390792, -0.05633295, -1.202911, 1, 0.5058824, 0, 1,
-1.387563, 0.2115574, -2.599917, 1, 0.509804, 0, 1,
-1.385721, 0.8135044, -2.59458, 1, 0.5176471, 0, 1,
-1.381293, 0.3072522, -1.257127, 1, 0.5215687, 0, 1,
-1.380603, -1.696088, -1.600379, 1, 0.5294118, 0, 1,
-1.376612, 0.6104394, -0.1185238, 1, 0.5333334, 0, 1,
-1.364742, 1.515029, -0.8813969, 1, 0.5411765, 0, 1,
-1.355201, -0.464317, -2.221912, 1, 0.5450981, 0, 1,
-1.338564, -0.2980876, -2.070459, 1, 0.5529412, 0, 1,
-1.317371, -1.38125, -2.425518, 1, 0.5568628, 0, 1,
-1.267929, -1.346239, -2.970742, 1, 0.5647059, 0, 1,
-1.266392, -0.3636493, -0.6697838, 1, 0.5686275, 0, 1,
-1.247183, 2.390999, -0.5244507, 1, 0.5764706, 0, 1,
-1.244382, 0.005473119, -1.383179, 1, 0.5803922, 0, 1,
-1.239219, 0.5236149, -2.131054, 1, 0.5882353, 0, 1,
-1.233452, 0.7399269, -1.61016, 1, 0.5921569, 0, 1,
-1.22735, 0.3852867, -0.7598667, 1, 0.6, 0, 1,
-1.21655, 0.6530258, -1.091702, 1, 0.6078432, 0, 1,
-1.213967, 0.7905901, -1.532645, 1, 0.6117647, 0, 1,
-1.209886, -1.756513, -3.365704, 1, 0.6196079, 0, 1,
-1.203612, -1.729881, -3.641177, 1, 0.6235294, 0, 1,
-1.192908, 0.06764846, -2.229627, 1, 0.6313726, 0, 1,
-1.191374, -1.32284, -3.585397, 1, 0.6352941, 0, 1,
-1.185711, -1.209146, -0.5334252, 1, 0.6431373, 0, 1,
-1.180536, -0.6282787, -1.499679, 1, 0.6470588, 0, 1,
-1.17754, -0.5158489, -4.544442, 1, 0.654902, 0, 1,
-1.175958, -0.01664981, -0.9869092, 1, 0.6588235, 0, 1,
-1.169283, 0.862043, -0.7456378, 1, 0.6666667, 0, 1,
-1.165012, 1.421081, -1.291363, 1, 0.6705883, 0, 1,
-1.164628, -0.3806521, 0.1683439, 1, 0.6784314, 0, 1,
-1.16262, -0.8261308, -2.504915, 1, 0.682353, 0, 1,
-1.16182, -0.522835, -1.709162, 1, 0.6901961, 0, 1,
-1.159517, 0.6617772, -1.549908, 1, 0.6941177, 0, 1,
-1.142896, 1.262023, 0.2923761, 1, 0.7019608, 0, 1,
-1.140333, 0.39043, -1.380435, 1, 0.7098039, 0, 1,
-1.1403, -0.9037958, -3.225416, 1, 0.7137255, 0, 1,
-1.137375, 0.513796, -2.591664, 1, 0.7215686, 0, 1,
-1.135838, 0.8906087, -0.2353346, 1, 0.7254902, 0, 1,
-1.132549, -0.8457687, -1.138394, 1, 0.7333333, 0, 1,
-1.129956, 0.4397457, -0.745021, 1, 0.7372549, 0, 1,
-1.129824, -2.058152, -3.649709, 1, 0.7450981, 0, 1,
-1.124725, 0.676257, -1.993542, 1, 0.7490196, 0, 1,
-1.121404, 0.2046592, -1.159906, 1, 0.7568628, 0, 1,
-1.12138, -1.505915, -2.811544, 1, 0.7607843, 0, 1,
-1.11956, -0.8881748, -2.807321, 1, 0.7686275, 0, 1,
-1.109516, 0.5209555, -0.775053, 1, 0.772549, 0, 1,
-1.109457, -0.8771322, -2.680465, 1, 0.7803922, 0, 1,
-1.106654, 0.5260588, -1.269668, 1, 0.7843137, 0, 1,
-1.105297, 1.457385, -0.4020028, 1, 0.7921569, 0, 1,
-1.101544, 0.8006113, -0.8500655, 1, 0.7960784, 0, 1,
-1.098263, 0.08340305, -1.802112, 1, 0.8039216, 0, 1,
-1.094187, -2.092724, -1.770065, 1, 0.8117647, 0, 1,
-1.080661, 1.671919, -1.981021, 1, 0.8156863, 0, 1,
-1.078231, -0.01353212, -2.611839, 1, 0.8235294, 0, 1,
-1.076107, 1.083936, -1.544068, 1, 0.827451, 0, 1,
-1.071948, 0.102665, 0.6579984, 1, 0.8352941, 0, 1,
-1.069954, 0.2794268, -2.504629, 1, 0.8392157, 0, 1,
-1.069468, 0.01592968, -1.183369, 1, 0.8470588, 0, 1,
-1.05735, -0.8772489, -2.771794, 1, 0.8509804, 0, 1,
-1.056904, -1.100062, -2.669786, 1, 0.8588235, 0, 1,
-1.052472, -0.4297557, -0.7606924, 1, 0.8627451, 0, 1,
-1.050352, -0.8091597, -1.697344, 1, 0.8705882, 0, 1,
-1.042708, -0.3639092, -2.436323, 1, 0.8745098, 0, 1,
-1.037851, 0.8635083, 1.232491, 1, 0.8823529, 0, 1,
-1.037078, 0.3384732, -1.673896, 1, 0.8862745, 0, 1,
-1.035671, -0.4502094, -2.020099, 1, 0.8941177, 0, 1,
-1.033358, 0.4013821, -1.19976, 1, 0.8980392, 0, 1,
-1.033176, 1.889614, -1.140879, 1, 0.9058824, 0, 1,
-1.026593, -1.162545, -2.370474, 1, 0.9137255, 0, 1,
-1.025893, 1.592239, 0.2103526, 1, 0.9176471, 0, 1,
-1.023196, -1.241888, -2.256132, 1, 0.9254902, 0, 1,
-1.018408, 0.3966227, 1.546648, 1, 0.9294118, 0, 1,
-1.012071, -0.2476263, -2.480782, 1, 0.9372549, 0, 1,
-1.004044, 2.058626, 0.36858, 1, 0.9411765, 0, 1,
-1.001517, -0.5649995, -2.872586, 1, 0.9490196, 0, 1,
-0.9923175, -2.421563, -3.389119, 1, 0.9529412, 0, 1,
-0.9914001, 0.633638, -1.433444, 1, 0.9607843, 0, 1,
-0.9846565, 0.7435507, -1.24737, 1, 0.9647059, 0, 1,
-0.9837525, 0.4013852, -1.821709, 1, 0.972549, 0, 1,
-0.9804086, -0.8942378, -2.82827, 1, 0.9764706, 0, 1,
-0.9720175, -0.6002573, -2.480727, 1, 0.9843137, 0, 1,
-0.9657089, 0.1356571, -0.9081922, 1, 0.9882353, 0, 1,
-0.9653905, 1.150578, -1.292514, 1, 0.9960784, 0, 1,
-0.9545239, 1.199621, -1.735527, 0.9960784, 1, 0, 1,
-0.9531457, -1.21712, -2.064307, 0.9921569, 1, 0, 1,
-0.9512062, 0.5407881, 0.3421513, 0.9843137, 1, 0, 1,
-0.9493544, -0.8653169, -2.664306, 0.9803922, 1, 0, 1,
-0.944966, -0.080389, -2.818205, 0.972549, 1, 0, 1,
-0.9412763, 0.02771883, -2.23611, 0.9686275, 1, 0, 1,
-0.9323462, -0.01623145, -1.804917, 0.9607843, 1, 0, 1,
-0.9269775, 0.2590387, -2.280182, 0.9568627, 1, 0, 1,
-0.9225374, 1.239257, -1.159725, 0.9490196, 1, 0, 1,
-0.9108676, -0.1457061, -0.8293647, 0.945098, 1, 0, 1,
-0.9077036, 0.9234068, -0.9274086, 0.9372549, 1, 0, 1,
-0.9076253, 0.3415854, -1.561197, 0.9333333, 1, 0, 1,
-0.9068511, -1.611569, -3.791873, 0.9254902, 1, 0, 1,
-0.9014854, 0.2357794, -1.630598, 0.9215686, 1, 0, 1,
-0.9011913, -0.5134312, -2.012841, 0.9137255, 1, 0, 1,
-0.8985652, -1.577803, -4.672905, 0.9098039, 1, 0, 1,
-0.8970318, 1.337831, 0.5970085, 0.9019608, 1, 0, 1,
-0.892529, 1.723316, -1.29562, 0.8941177, 1, 0, 1,
-0.8854817, -0.9084046, -2.90257, 0.8901961, 1, 0, 1,
-0.8852921, 2.089395, -0.1084852, 0.8823529, 1, 0, 1,
-0.883015, -1.285964, -2.628017, 0.8784314, 1, 0, 1,
-0.8821507, 0.3038989, -2.461192, 0.8705882, 1, 0, 1,
-0.8806892, -0.3168503, -1.75197, 0.8666667, 1, 0, 1,
-0.8761408, -0.1364758, -1.798406, 0.8588235, 1, 0, 1,
-0.8753846, -1.224074, -2.308062, 0.854902, 1, 0, 1,
-0.8733283, 0.5303171, -0.04660352, 0.8470588, 1, 0, 1,
-0.8697683, 0.7589764, -2.817624, 0.8431373, 1, 0, 1,
-0.8689062, -0.4844749, -1.827837, 0.8352941, 1, 0, 1,
-0.8685945, -0.6620141, -1.678543, 0.8313726, 1, 0, 1,
-0.8678166, 0.6382235, -0.4075609, 0.8235294, 1, 0, 1,
-0.8653673, -0.6441077, -3.452341, 0.8196079, 1, 0, 1,
-0.8632916, -0.4935321, -3.764683, 0.8117647, 1, 0, 1,
-0.862489, -0.2534799, -1.867132, 0.8078431, 1, 0, 1,
-0.8588353, 0.3268388, -0.9124078, 0.8, 1, 0, 1,
-0.8542207, 0.7228087, -1.774169, 0.7921569, 1, 0, 1,
-0.853977, 0.9935871, 2.278988, 0.7882353, 1, 0, 1,
-0.849543, -0.2190056, -2.362089, 0.7803922, 1, 0, 1,
-0.8418381, -0.7969103, -1.034707, 0.7764706, 1, 0, 1,
-0.8332174, 0.464469, -1.47078, 0.7686275, 1, 0, 1,
-0.8306111, -0.05044491, -0.9598382, 0.7647059, 1, 0, 1,
-0.8251249, 0.3079763, -0.01414751, 0.7568628, 1, 0, 1,
-0.8219459, 0.2709928, -2.809132, 0.7529412, 1, 0, 1,
-0.8135903, -1.997307, -2.486311, 0.7450981, 1, 0, 1,
-0.8075211, 0.3247488, -0.7139276, 0.7411765, 1, 0, 1,
-0.8069986, -2.186185, -2.700096, 0.7333333, 1, 0, 1,
-0.8021921, 1.101165, -1.340041, 0.7294118, 1, 0, 1,
-0.7989057, -0.3950256, -1.58248, 0.7215686, 1, 0, 1,
-0.7963882, -0.5225528, -0.7919569, 0.7176471, 1, 0, 1,
-0.7961246, -0.4434716, -2.310021, 0.7098039, 1, 0, 1,
-0.7878438, 0.4490241, -3.578658, 0.7058824, 1, 0, 1,
-0.7855973, -1.494815, -2.172157, 0.6980392, 1, 0, 1,
-0.784447, 0.0193765, -2.024003, 0.6901961, 1, 0, 1,
-0.7832643, -1.055763, -3.793185, 0.6862745, 1, 0, 1,
-0.7824673, -1.765684, -1.610796, 0.6784314, 1, 0, 1,
-0.7792558, 0.1703487, -1.256047, 0.6745098, 1, 0, 1,
-0.775963, -0.05211424, -1.421814, 0.6666667, 1, 0, 1,
-0.7732323, -0.2582106, -1.605882, 0.6627451, 1, 0, 1,
-0.7724122, -1.887262, -2.496881, 0.654902, 1, 0, 1,
-0.76947, 1.162744, -0.5784143, 0.6509804, 1, 0, 1,
-0.7660386, 0.8337758, -1.714783, 0.6431373, 1, 0, 1,
-0.7633367, 0.1344973, -2.102411, 0.6392157, 1, 0, 1,
-0.7610255, -1.146488, -2.565808, 0.6313726, 1, 0, 1,
-0.7566251, 1.734359, -0.4735388, 0.627451, 1, 0, 1,
-0.7475102, -0.7509589, -2.734229, 0.6196079, 1, 0, 1,
-0.7467193, 1.226548, -1.931629, 0.6156863, 1, 0, 1,
-0.7460106, -1.005464, -2.556381, 0.6078432, 1, 0, 1,
-0.7459016, -0.2435998, -3.508901, 0.6039216, 1, 0, 1,
-0.742754, -0.7553887, -1.276492, 0.5960785, 1, 0, 1,
-0.7396373, -1.421956, -2.326123, 0.5882353, 1, 0, 1,
-0.7383841, 0.05408309, 0.6853872, 0.5843138, 1, 0, 1,
-0.7357064, -0.06365037, -2.402275, 0.5764706, 1, 0, 1,
-0.7277625, 1.221618, 0.1378108, 0.572549, 1, 0, 1,
-0.7186443, -1.564151, -2.824646, 0.5647059, 1, 0, 1,
-0.7122124, -0.9810396, -2.446298, 0.5607843, 1, 0, 1,
-0.7099584, 1.712928, 0.08987028, 0.5529412, 1, 0, 1,
-0.708362, 1.441925, -0.7459042, 0.5490196, 1, 0, 1,
-0.7041923, -0.8029823, -2.202374, 0.5411765, 1, 0, 1,
-0.6993552, -2.251249, -3.243348, 0.5372549, 1, 0, 1,
-0.6992147, -0.9300655, -2.501036, 0.5294118, 1, 0, 1,
-0.6967852, 0.3912106, 0.9269325, 0.5254902, 1, 0, 1,
-0.6964257, 0.7773047, -1.741829, 0.5176471, 1, 0, 1,
-0.6895038, 0.2020808, 0.5776002, 0.5137255, 1, 0, 1,
-0.6894766, -0.628467, -1.315009, 0.5058824, 1, 0, 1,
-0.6874589, 0.1170562, -2.03159, 0.5019608, 1, 0, 1,
-0.6828403, -1.750162, -2.36942, 0.4941176, 1, 0, 1,
-0.6801878, -1.948913, -1.666095, 0.4862745, 1, 0, 1,
-0.6637, 2.002729, -0.3965553, 0.4823529, 1, 0, 1,
-0.6626652, 0.9353569, 0.4666405, 0.4745098, 1, 0, 1,
-0.6601287, 1.007447, -0.8427793, 0.4705882, 1, 0, 1,
-0.6564314, -0.433448, -1.37846, 0.4627451, 1, 0, 1,
-0.6510943, 0.003707106, -0.6792161, 0.4588235, 1, 0, 1,
-0.6472617, 0.86649, -0.4880324, 0.4509804, 1, 0, 1,
-0.6433845, 0.7271407, -1.680154, 0.4470588, 1, 0, 1,
-0.6420323, 1.096647, -0.5796667, 0.4392157, 1, 0, 1,
-0.6419644, 0.6434514, -0.4046754, 0.4352941, 1, 0, 1,
-0.6417625, -1.955791, -2.422025, 0.427451, 1, 0, 1,
-0.6400624, -0.6882635, -1.676562, 0.4235294, 1, 0, 1,
-0.6374666, 0.1442669, -3.232056, 0.4156863, 1, 0, 1,
-0.635949, -0.1591388, -0.4385303, 0.4117647, 1, 0, 1,
-0.6322957, 0.2237341, -1.715491, 0.4039216, 1, 0, 1,
-0.6262692, -0.1184903, -3.130026, 0.3960784, 1, 0, 1,
-0.622597, -2.164869, -2.981632, 0.3921569, 1, 0, 1,
-0.618558, 0.07512966, -0.8691679, 0.3843137, 1, 0, 1,
-0.6180847, 0.2330784, -0.6881584, 0.3803922, 1, 0, 1,
-0.6165468, 0.4159034, -0.277394, 0.372549, 1, 0, 1,
-0.6148333, -0.02769014, -0.4605514, 0.3686275, 1, 0, 1,
-0.6117669, -0.3215676, -2.283856, 0.3607843, 1, 0, 1,
-0.6117212, 0.8256651, -0.9243986, 0.3568628, 1, 0, 1,
-0.6095738, -0.6810625, -1.878619, 0.3490196, 1, 0, 1,
-0.6033094, -1.318168, -2.463196, 0.345098, 1, 0, 1,
-0.602213, -0.8033238, -3.556042, 0.3372549, 1, 0, 1,
-0.600461, 1.293932, 0.2782071, 0.3333333, 1, 0, 1,
-0.5971924, -1.045437, -2.000141, 0.3254902, 1, 0, 1,
-0.5881483, 0.4173945, -0.4075856, 0.3215686, 1, 0, 1,
-0.5881326, 0.7846515, -0.1797035, 0.3137255, 1, 0, 1,
-0.5847367, 0.7946495, -0.9244571, 0.3098039, 1, 0, 1,
-0.5842716, -0.3930303, -2.788299, 0.3019608, 1, 0, 1,
-0.5838311, 0.8498423, -1.908395, 0.2941177, 1, 0, 1,
-0.5778215, 1.215518, 0.09324428, 0.2901961, 1, 0, 1,
-0.5759451, 1.442408, 0.8892486, 0.282353, 1, 0, 1,
-0.5747631, 0.3836019, -0.2653289, 0.2784314, 1, 0, 1,
-0.5736833, 0.1814946, -2.18132, 0.2705882, 1, 0, 1,
-0.5646694, 0.4699299, -2.0842, 0.2666667, 1, 0, 1,
-0.5628436, -1.609299, -2.659216, 0.2588235, 1, 0, 1,
-0.5619743, -0.9340471, -1.809762, 0.254902, 1, 0, 1,
-0.5591401, 0.5275964, -1.433082, 0.2470588, 1, 0, 1,
-0.5589767, -1.644537, -0.6175557, 0.2431373, 1, 0, 1,
-0.5540558, -0.03314783, -2.6624, 0.2352941, 1, 0, 1,
-0.5535932, 1.032642, -1.079971, 0.2313726, 1, 0, 1,
-0.5524324, 1.213817, -0.7789776, 0.2235294, 1, 0, 1,
-0.5493212, -1.119283, -1.419007, 0.2196078, 1, 0, 1,
-0.5485392, -1.213449, -4.171255, 0.2117647, 1, 0, 1,
-0.5456436, 0.3646576, -0.1509202, 0.2078431, 1, 0, 1,
-0.5453556, 0.3821888, -1.410484, 0.2, 1, 0, 1,
-0.5402907, 0.1925476, -2.35925, 0.1921569, 1, 0, 1,
-0.5386046, 3.545999, -1.383202, 0.1882353, 1, 0, 1,
-0.534767, -0.9794311, -2.87241, 0.1803922, 1, 0, 1,
-0.5344449, -1.3366, -0.01757127, 0.1764706, 1, 0, 1,
-0.5314381, 0.554746, -1.16203, 0.1686275, 1, 0, 1,
-0.5264778, -1.368701, -1.043234, 0.1647059, 1, 0, 1,
-0.5252581, -0.2708883, -0.6458836, 0.1568628, 1, 0, 1,
-0.5176721, 1.061797, 0.3848895, 0.1529412, 1, 0, 1,
-0.5050154, -0.6853265, -3.584857, 0.145098, 1, 0, 1,
-0.4997851, 0.4031141, -1.079496, 0.1411765, 1, 0, 1,
-0.4945548, -1.671343, -2.296129, 0.1333333, 1, 0, 1,
-0.4941797, 0.4398803, 0.2935719, 0.1294118, 1, 0, 1,
-0.4941675, -1.100398, -2.224274, 0.1215686, 1, 0, 1,
-0.4934804, -0.4893801, -0.820782, 0.1176471, 1, 0, 1,
-0.4856219, -2.246262, -3.067932, 0.1098039, 1, 0, 1,
-0.4832429, -0.2563017, -3.176822, 0.1058824, 1, 0, 1,
-0.4813879, 1.144378, 0.4621705, 0.09803922, 1, 0, 1,
-0.4809944, 1.212166, -2.085236, 0.09019608, 1, 0, 1,
-0.4798526, -1.556547, -3.772403, 0.08627451, 1, 0, 1,
-0.4752248, 1.085921, -1.717397, 0.07843138, 1, 0, 1,
-0.4711356, -1.455891, -2.180853, 0.07450981, 1, 0, 1,
-0.4710831, -2.950631, -2.059574, 0.06666667, 1, 0, 1,
-0.4706622, 0.7324485, 0.02143981, 0.0627451, 1, 0, 1,
-0.4694014, -0.6061597, -3.339186, 0.05490196, 1, 0, 1,
-0.4689743, -1.179782, -4.122352, 0.05098039, 1, 0, 1,
-0.4623299, 0.5913717, 0.07508931, 0.04313726, 1, 0, 1,
-0.4613087, 0.2431872, -1.095512, 0.03921569, 1, 0, 1,
-0.4597221, -0.2624, -1.76464, 0.03137255, 1, 0, 1,
-0.4556603, -1.844374, -3.269776, 0.02745098, 1, 0, 1,
-0.4538726, 1.792476, -0.9317107, 0.01960784, 1, 0, 1,
-0.4538155, 0.02277631, -2.21757, 0.01568628, 1, 0, 1,
-0.4504907, 2.075729, 0.3299536, 0.007843138, 1, 0, 1,
-0.4417149, 0.3663632, 0.2397807, 0.003921569, 1, 0, 1,
-0.4403109, 0.3867929, -1.229768, 0, 1, 0.003921569, 1,
-0.4403031, -0.993543, -3.192937, 0, 1, 0.01176471, 1,
-0.4387923, -0.887658, -1.133741, 0, 1, 0.01568628, 1,
-0.4378466, 1.833291, 0.2988735, 0, 1, 0.02352941, 1,
-0.4333395, 0.5952261, -0.4389996, 0, 1, 0.02745098, 1,
-0.4297081, 0.4974332, -1.784703, 0, 1, 0.03529412, 1,
-0.4280365, 0.405242, -1.381829, 0, 1, 0.03921569, 1,
-0.4271552, -1.758497, -3.026511, 0, 1, 0.04705882, 1,
-0.425044, -0.2499775, -1.232342, 0, 1, 0.05098039, 1,
-0.4250098, 0.8111222, 0.1617279, 0, 1, 0.05882353, 1,
-0.4247208, 0.2678607, -1.531808, 0, 1, 0.0627451, 1,
-0.4237888, -0.2927732, -2.779535, 0, 1, 0.07058824, 1,
-0.421546, -0.666695, -1.861382, 0, 1, 0.07450981, 1,
-0.4184397, -0.581688, -1.403186, 0, 1, 0.08235294, 1,
-0.4166113, 1.479425, -2.811084, 0, 1, 0.08627451, 1,
-0.4161599, -0.3243666, -2.874707, 0, 1, 0.09411765, 1,
-0.4152201, -1.463317, -1.292594, 0, 1, 0.1019608, 1,
-0.4149958, -2.695435, -1.892325, 0, 1, 0.1058824, 1,
-0.4092673, 1.330208, -0.6666548, 0, 1, 0.1137255, 1,
-0.4085741, -1.066805, -3.050389, 0, 1, 0.1176471, 1,
-0.4049811, -1.082111, -2.563709, 0, 1, 0.1254902, 1,
-0.4048076, -0.4675547, -4.582891, 0, 1, 0.1294118, 1,
-0.4023717, -0.4878407, -4.419835, 0, 1, 0.1372549, 1,
-0.4002596, -0.613969, -2.682681, 0, 1, 0.1411765, 1,
-0.3968857, -0.3350535, -1.967067, 0, 1, 0.1490196, 1,
-0.3942029, -1.765627, -2.21664, 0, 1, 0.1529412, 1,
-0.393029, -0.2447369, -1.529878, 0, 1, 0.1607843, 1,
-0.391757, 1.724653, -0.6361134, 0, 1, 0.1647059, 1,
-0.3888632, -1.901942, -2.391912, 0, 1, 0.172549, 1,
-0.386751, 0.9164912, -1.159474, 0, 1, 0.1764706, 1,
-0.3851406, -0.9392509, -1.080505, 0, 1, 0.1843137, 1,
-0.3819788, 1.376346, -1.12603, 0, 1, 0.1882353, 1,
-0.3765935, 0.3802654, -1.644361, 0, 1, 0.1960784, 1,
-0.3764572, -1.178882, -2.977005, 0, 1, 0.2039216, 1,
-0.3729157, -0.7843369, -2.353064, 0, 1, 0.2078431, 1,
-0.3724483, -0.4112048, -3.488136, 0, 1, 0.2156863, 1,
-0.3703951, 0.4963063, -2.771101, 0, 1, 0.2196078, 1,
-0.3700081, -1.438991, -3.080361, 0, 1, 0.227451, 1,
-0.3678887, -1.862945, -1.535809, 0, 1, 0.2313726, 1,
-0.3673644, -0.3099315, -3.993164, 0, 1, 0.2392157, 1,
-0.3648647, 0.8889253, -2.050246, 0, 1, 0.2431373, 1,
-0.3586898, 0.2359751, -0.7950035, 0, 1, 0.2509804, 1,
-0.3582393, -0.01174101, -2.741724, 0, 1, 0.254902, 1,
-0.3499674, -1.884195, -3.113327, 0, 1, 0.2627451, 1,
-0.3490598, 0.5124004, -1.128996, 0, 1, 0.2666667, 1,
-0.3472125, 0.7144907, -0.7563698, 0, 1, 0.2745098, 1,
-0.346185, 0.272425, -0.4993642, 0, 1, 0.2784314, 1,
-0.3418715, 0.2443876, 0.03280028, 0, 1, 0.2862745, 1,
-0.3413422, -0.08173777, -1.57195, 0, 1, 0.2901961, 1,
-0.3377384, 0.5578386, -1.199416, 0, 1, 0.2980392, 1,
-0.3375762, 0.9147549, 1.990765, 0, 1, 0.3058824, 1,
-0.3345164, -0.3535312, -1.582527, 0, 1, 0.3098039, 1,
-0.3331648, -0.8120521, -3.264807, 0, 1, 0.3176471, 1,
-0.3313527, 0.3506213, -0.225157, 0, 1, 0.3215686, 1,
-0.3191178, -0.6206568, -2.988253, 0, 1, 0.3294118, 1,
-0.3180407, 0.9024264, -0.9959131, 0, 1, 0.3333333, 1,
-0.3176344, 0.1472439, -1.65639, 0, 1, 0.3411765, 1,
-0.3176166, 0.8536224, -0.7261745, 0, 1, 0.345098, 1,
-0.3158484, -1.618502, -3.193857, 0, 1, 0.3529412, 1,
-0.3154045, -0.4123633, -2.907414, 0, 1, 0.3568628, 1,
-0.3142338, 0.2651351, -1.299759, 0, 1, 0.3647059, 1,
-0.3128332, 1.111199, -0.03001446, 0, 1, 0.3686275, 1,
-0.3097614, 1.25105, -0.5209135, 0, 1, 0.3764706, 1,
-0.3084168, 0.4326716, -1.729837, 0, 1, 0.3803922, 1,
-0.3072219, 0.9218239, -0.1186999, 0, 1, 0.3882353, 1,
-0.3018987, 0.2728051, -1.155434, 0, 1, 0.3921569, 1,
-0.3000267, 0.2442499, 0.2243312, 0, 1, 0.4, 1,
-0.2991758, 0.7646366, -1.266283, 0, 1, 0.4078431, 1,
-0.2985105, -2.23777, -2.281433, 0, 1, 0.4117647, 1,
-0.2952699, 0.7325585, 0.660674, 0, 1, 0.4196078, 1,
-0.2902116, -0.2888162, -1.637411, 0, 1, 0.4235294, 1,
-0.2897159, -0.5930791, -3.015486, 0, 1, 0.4313726, 1,
-0.2878008, 0.7822135, -0.1305264, 0, 1, 0.4352941, 1,
-0.2851045, -1.346975, -3.885232, 0, 1, 0.4431373, 1,
-0.2849936, 1.217427, -0.9988167, 0, 1, 0.4470588, 1,
-0.2836799, -1.469829, -4.158182, 0, 1, 0.454902, 1,
-0.2688487, -0.4274734, -3.524901, 0, 1, 0.4588235, 1,
-0.2660193, 0.3225416, 0.1926249, 0, 1, 0.4666667, 1,
-0.2636336, -0.02120944, -3.561532, 0, 1, 0.4705882, 1,
-0.2624186, -0.4040104, -1.870837, 0, 1, 0.4784314, 1,
-0.2531328, -0.02133752, -1.072601, 0, 1, 0.4823529, 1,
-0.2502871, 1.211371, 0.9802098, 0, 1, 0.4901961, 1,
-0.2499524, -2.144422, -0.957013, 0, 1, 0.4941176, 1,
-0.2416999, 0.7093141, -0.1609794, 0, 1, 0.5019608, 1,
-0.2374716, -0.4663693, -4.028224, 0, 1, 0.509804, 1,
-0.2330444, -0.6830966, -0.3509777, 0, 1, 0.5137255, 1,
-0.2302764, -0.5082191, -3.323037, 0, 1, 0.5215687, 1,
-0.2271549, 0.2313509, -0.4813271, 0, 1, 0.5254902, 1,
-0.226335, -0.6737617, -2.745528, 0, 1, 0.5333334, 1,
-0.2208831, 0.4196273, 1.247735, 0, 1, 0.5372549, 1,
-0.2193301, -0.8453141, -3.83136, 0, 1, 0.5450981, 1,
-0.2080747, 0.8389774, -1.591818, 0, 1, 0.5490196, 1,
-0.2058121, -0.005974075, -0.4307415, 0, 1, 0.5568628, 1,
-0.2056829, -0.3285967, -0.5101872, 0, 1, 0.5607843, 1,
-0.2050193, 0.9658915, -0.4224908, 0, 1, 0.5686275, 1,
-0.2049136, -0.5183032, -3.330723, 0, 1, 0.572549, 1,
-0.1993084, 0.5369188, -0.3621475, 0, 1, 0.5803922, 1,
-0.1950114, 0.001239948, -2.276124, 0, 1, 0.5843138, 1,
-0.192084, -0.2415503, -2.700567, 0, 1, 0.5921569, 1,
-0.1867377, 1.935612, -0.2828797, 0, 1, 0.5960785, 1,
-0.1855984, 1.033964, -1.628236, 0, 1, 0.6039216, 1,
-0.1822022, 1.109382, 0.7815756, 0, 1, 0.6117647, 1,
-0.1742857, 0.4312726, 0.2562462, 0, 1, 0.6156863, 1,
-0.1722426, -2.626864, -2.522144, 0, 1, 0.6235294, 1,
-0.167742, -0.8196373, -3.640327, 0, 1, 0.627451, 1,
-0.1641489, 0.696924, -2.562682, 0, 1, 0.6352941, 1,
-0.1641487, 1.162426, -0.6711472, 0, 1, 0.6392157, 1,
-0.1635998, 1.066424, -0.7009002, 0, 1, 0.6470588, 1,
-0.1606097, -1.200403, -2.371465, 0, 1, 0.6509804, 1,
-0.159862, 1.438026, -1.471637, 0, 1, 0.6588235, 1,
-0.1568721, -1.752157, -3.547342, 0, 1, 0.6627451, 1,
-0.1549395, 1.07106, 0.7071314, 0, 1, 0.6705883, 1,
-0.1535803, -0.1748034, -3.254736, 0, 1, 0.6745098, 1,
-0.1527504, -2.813483, -2.728585, 0, 1, 0.682353, 1,
-0.1503459, 3.166709, -0.8520087, 0, 1, 0.6862745, 1,
-0.1482091, 0.8354298, -1.334794, 0, 1, 0.6941177, 1,
-0.1441306, 0.3896414, 0.4974017, 0, 1, 0.7019608, 1,
-0.1377338, 0.9894524, 1.062134, 0, 1, 0.7058824, 1,
-0.1358688, -1.316721, -2.130558, 0, 1, 0.7137255, 1,
-0.1319735, 0.6695221, -0.7416944, 0, 1, 0.7176471, 1,
-0.1294391, 0.05425929, -2.156058, 0, 1, 0.7254902, 1,
-0.1276624, -0.0345295, -0.3605575, 0, 1, 0.7294118, 1,
-0.1268821, 1.427515, -2.542285, 0, 1, 0.7372549, 1,
-0.1238038, 0.6258522, 0.2990933, 0, 1, 0.7411765, 1,
-0.1233487, -0.3898747, -4.054751, 0, 1, 0.7490196, 1,
-0.1224823, -0.4414426, -3.057193, 0, 1, 0.7529412, 1,
-0.1114294, -0.9225559, -4.325595, 0, 1, 0.7607843, 1,
-0.111203, -0.2789243, -2.355779, 0, 1, 0.7647059, 1,
-0.1088882, -2.03032, -2.306725, 0, 1, 0.772549, 1,
-0.1029039, -0.9829702, -3.035091, 0, 1, 0.7764706, 1,
-0.1020621, 1.421906, -1.074754, 0, 1, 0.7843137, 1,
-0.1016532, -0.6103631, -3.971228, 0, 1, 0.7882353, 1,
-0.1014914, -0.7757685, -2.830967, 0, 1, 0.7960784, 1,
-0.1008258, -1.05111, -5.204362, 0, 1, 0.8039216, 1,
-0.1002894, 0.2253007, -0.01487967, 0, 1, 0.8078431, 1,
-0.09964612, -0.479929, -3.281723, 0, 1, 0.8156863, 1,
-0.09872254, 0.3166712, 2.240174, 0, 1, 0.8196079, 1,
-0.09776334, -0.888965, -2.476081, 0, 1, 0.827451, 1,
-0.08808395, -1.035895, -4.913672, 0, 1, 0.8313726, 1,
-0.08500806, 0.6000118, -0.8178086, 0, 1, 0.8392157, 1,
-0.08420097, 0.6062652, 0.4503386, 0, 1, 0.8431373, 1,
-0.08402283, 0.1206134, -0.2508266, 0, 1, 0.8509804, 1,
-0.0741506, 1.13359, -1.1631, 0, 1, 0.854902, 1,
-0.07178355, -0.9146895, -2.927062, 0, 1, 0.8627451, 1,
-0.07171665, 0.22234, -0.4192066, 0, 1, 0.8666667, 1,
-0.07048932, -0.511888, -4.059245, 0, 1, 0.8745098, 1,
-0.06951847, 0.4642099, -1.569695, 0, 1, 0.8784314, 1,
-0.06620778, -1.415403, -1.897018, 0, 1, 0.8862745, 1,
-0.06597462, 0.07979944, -2.855394, 0, 1, 0.8901961, 1,
-0.05874661, 0.4229564, -0.4793844, 0, 1, 0.8980392, 1,
-0.05779104, 1.897237, -0.3519684, 0, 1, 0.9058824, 1,
-0.05707297, -0.3996324, -2.472013, 0, 1, 0.9098039, 1,
-0.05284571, 0.4393287, 1.124941, 0, 1, 0.9176471, 1,
-0.04964661, -0.9603662, -2.899854, 0, 1, 0.9215686, 1,
-0.0479225, 0.7803448, 0.8255169, 0, 1, 0.9294118, 1,
-0.04737076, 1.396858, 0.2847434, 0, 1, 0.9333333, 1,
-0.04670229, 2.475431, -0.7053689, 0, 1, 0.9411765, 1,
-0.04567507, 2.629237, 0.1996285, 0, 1, 0.945098, 1,
-0.04413411, 0.2328995, 0.5829152, 0, 1, 0.9529412, 1,
-0.04028657, 0.6699287, -1.786031, 0, 1, 0.9568627, 1,
-0.03980524, 1.652143, -0.7140789, 0, 1, 0.9647059, 1,
-0.03217224, 0.3982281, -1.510546, 0, 1, 0.9686275, 1,
-0.02548652, 2.346972, 0.5450962, 0, 1, 0.9764706, 1,
-0.02483781, 0.02665848, 0.3348066, 0, 1, 0.9803922, 1,
-0.02067935, -0.7348516, -2.860417, 0, 1, 0.9882353, 1,
-0.01955619, 0.04808973, 0.132088, 0, 1, 0.9921569, 1,
-0.01948349, -0.1258952, -2.82923, 0, 1, 1, 1,
-0.01890344, -1.085669, -3.002641, 0, 0.9921569, 1, 1,
-0.01786143, -0.9599416, -3.501034, 0, 0.9882353, 1, 1,
-0.01078213, -0.1058785, -3.351713, 0, 0.9803922, 1, 1,
-0.007081053, -0.3794242, -2.950376, 0, 0.9764706, 1, 1,
-0.007012012, 0.9777613, -0.1857614, 0, 0.9686275, 1, 1,
-0.00594702, 0.5608885, 0.5719154, 0, 0.9647059, 1, 1,
-0.005037061, 1.038375, 0.4569159, 0, 0.9568627, 1, 1,
-0.002045658, -2.265977, -3.158289, 0, 0.9529412, 1, 1,
0.002121878, -0.40479, 3.901137, 0, 0.945098, 1, 1,
0.00503441, 0.6683745, 0.5979404, 0, 0.9411765, 1, 1,
0.007531079, -0.508058, 4.884838, 0, 0.9333333, 1, 1,
0.01239113, -0.5672596, 2.812863, 0, 0.9294118, 1, 1,
0.01545173, 0.9723036, -1.166865, 0, 0.9215686, 1, 1,
0.01759737, -0.8462722, 4.207125, 0, 0.9176471, 1, 1,
0.01898173, 0.4340913, 1.154857, 0, 0.9098039, 1, 1,
0.01959813, -0.1163042, 3.283199, 0, 0.9058824, 1, 1,
0.021305, 0.4710639, 0.828687, 0, 0.8980392, 1, 1,
0.02195898, 0.7427853, 0.1557486, 0, 0.8901961, 1, 1,
0.02542396, -0.944243, 1.616255, 0, 0.8862745, 1, 1,
0.02610259, 0.5627737, 1.203003, 0, 0.8784314, 1, 1,
0.02685026, -0.3855823, 2.837313, 0, 0.8745098, 1, 1,
0.02985038, -1.882084, 2.50857, 0, 0.8666667, 1, 1,
0.03994681, -0.2949301, 3.285308, 0, 0.8627451, 1, 1,
0.05525628, -1.704764, 3.35635, 0, 0.854902, 1, 1,
0.05645882, -1.592534, 4.588964, 0, 0.8509804, 1, 1,
0.05755811, 0.1328151, 1.154499, 0, 0.8431373, 1, 1,
0.05843915, -2.380732, 2.142371, 0, 0.8392157, 1, 1,
0.06145123, 1.179767, 1.682829, 0, 0.8313726, 1, 1,
0.06587992, 0.1049436, -0.4125944, 0, 0.827451, 1, 1,
0.06633579, 0.07715853, 0.472666, 0, 0.8196079, 1, 1,
0.06700467, 0.3055806, -1.193399, 0, 0.8156863, 1, 1,
0.0683093, 0.7712427, -1.14958, 0, 0.8078431, 1, 1,
0.06840453, 1.231033, -0.2548725, 0, 0.8039216, 1, 1,
0.06847025, 1.140334, -0.8125375, 0, 0.7960784, 1, 1,
0.06933875, -1.268036, 3.597509, 0, 0.7882353, 1, 1,
0.07130749, -0.4578533, 2.708484, 0, 0.7843137, 1, 1,
0.07539833, -0.5221542, 3.719938, 0, 0.7764706, 1, 1,
0.07597579, 1.391009, -1.144604, 0, 0.772549, 1, 1,
0.07889833, 0.4930446, 1.433522, 0, 0.7647059, 1, 1,
0.07939003, 0.6913583, -1.542325, 0, 0.7607843, 1, 1,
0.08135839, 0.8282918, -1.090714, 0, 0.7529412, 1, 1,
0.08242864, 0.6641244, 0.4673542, 0, 0.7490196, 1, 1,
0.08302677, 0.260884, 0.1226432, 0, 0.7411765, 1, 1,
0.08308097, 1.535693, 0.7705773, 0, 0.7372549, 1, 1,
0.09275082, -1.707554, 4.614589, 0, 0.7294118, 1, 1,
0.09293267, -1.024204, 2.745322, 0, 0.7254902, 1, 1,
0.09588453, -0.05649863, 1.069554, 0, 0.7176471, 1, 1,
0.1002491, -0.06906476, 0.8443733, 0, 0.7137255, 1, 1,
0.1056907, -0.0333407, -0.1877694, 0, 0.7058824, 1, 1,
0.1057219, 0.3235875, -1.7594, 0, 0.6980392, 1, 1,
0.1065709, 0.4917439, 0.7064753, 0, 0.6941177, 1, 1,
0.1068034, -0.8105522, 5.263887, 0, 0.6862745, 1, 1,
0.1094432, -1.750232, 2.520607, 0, 0.682353, 1, 1,
0.1113447, 1.263457, 1.110328, 0, 0.6745098, 1, 1,
0.1122304, 0.8659927, -1.3519, 0, 0.6705883, 1, 1,
0.1140523, 0.773091, -0.3350831, 0, 0.6627451, 1, 1,
0.1167722, -1.092273, 0.7537079, 0, 0.6588235, 1, 1,
0.1169379, 1.184297, -0.1092615, 0, 0.6509804, 1, 1,
0.1170648, 0.3487655, 0.2630557, 0, 0.6470588, 1, 1,
0.1179343, 0.7312398, -0.9632712, 0, 0.6392157, 1, 1,
0.1184944, 0.1332754, 1.648816, 0, 0.6352941, 1, 1,
0.1236113, 1.0105, 0.3913451, 0, 0.627451, 1, 1,
0.1263901, -1.068701, 4.474658, 0, 0.6235294, 1, 1,
0.1265622, -0.3760011, 1.999644, 0, 0.6156863, 1, 1,
0.1273113, 2.137697, 0.2856391, 0, 0.6117647, 1, 1,
0.1319327, -0.8698314, 3.253441, 0, 0.6039216, 1, 1,
0.1358505, -1.214465, 1.842558, 0, 0.5960785, 1, 1,
0.1381778, 0.04769263, 3.360246, 0, 0.5921569, 1, 1,
0.1394192, 1.062074, -1.511699, 0, 0.5843138, 1, 1,
0.140423, -0.1504643, 0.8435973, 0, 0.5803922, 1, 1,
0.1415604, -1.736059, 3.933252, 0, 0.572549, 1, 1,
0.1437306, -0.2392263, 2.093878, 0, 0.5686275, 1, 1,
0.146625, 0.7113345, -0.4849763, 0, 0.5607843, 1, 1,
0.1477882, -1.424688, 3.291692, 0, 0.5568628, 1, 1,
0.1526305, -0.1023116, 4.372038, 0, 0.5490196, 1, 1,
0.1621861, 0.2609258, -0.6538851, 0, 0.5450981, 1, 1,
0.1668001, 0.4624294, 1.48933, 0, 0.5372549, 1, 1,
0.1686652, -0.8302081, 2.631962, 0, 0.5333334, 1, 1,
0.1712823, -1.215384, 2.876835, 0, 0.5254902, 1, 1,
0.1751606, 1.037122, 0.5577762, 0, 0.5215687, 1, 1,
0.1763499, 0.2444495, 0.201599, 0, 0.5137255, 1, 1,
0.183977, -0.4120456, 2.431533, 0, 0.509804, 1, 1,
0.1884403, -1.762184, 3.861997, 0, 0.5019608, 1, 1,
0.19235, -1.223532, 3.862619, 0, 0.4941176, 1, 1,
0.1938756, -0.7304801, 1.823906, 0, 0.4901961, 1, 1,
0.1942989, 1.379213, 1.978145, 0, 0.4823529, 1, 1,
0.1962152, 1.741316, -1.040823, 0, 0.4784314, 1, 1,
0.1991191, 0.8859602, 0.426367, 0, 0.4705882, 1, 1,
0.2007123, 0.6996186, 1.05691, 0, 0.4666667, 1, 1,
0.2038136, 0.7220193, -0.1739223, 0, 0.4588235, 1, 1,
0.2046936, -1.98917, 3.269868, 0, 0.454902, 1, 1,
0.2048817, 2.030631, -1.262855, 0, 0.4470588, 1, 1,
0.2083592, -0.3717911, 2.31685, 0, 0.4431373, 1, 1,
0.2095663, 1.183769, 1.058627, 0, 0.4352941, 1, 1,
0.217988, -0.2244481, 1.516931, 0, 0.4313726, 1, 1,
0.2192745, -0.9721751, 4.737798, 0, 0.4235294, 1, 1,
0.2242702, 1.570386, -0.04786816, 0, 0.4196078, 1, 1,
0.2260101, 0.02852311, 0.4830126, 0, 0.4117647, 1, 1,
0.2267401, -0.9419653, 3.146186, 0, 0.4078431, 1, 1,
0.2269296, -0.2034105, 1.172617, 0, 0.4, 1, 1,
0.227952, -0.9123874, 3.046073, 0, 0.3921569, 1, 1,
0.2380547, 0.5596127, 1.091439, 0, 0.3882353, 1, 1,
0.2568662, -0.372424, 2.782199, 0, 0.3803922, 1, 1,
0.2595159, -0.007861625, 1.219226, 0, 0.3764706, 1, 1,
0.2604303, -1.602389, 3.201495, 0, 0.3686275, 1, 1,
0.2606811, 0.3569736, 0.003554672, 0, 0.3647059, 1, 1,
0.2666401, -0.4170028, 2.630309, 0, 0.3568628, 1, 1,
0.2688588, 0.6587108, -0.07047376, 0, 0.3529412, 1, 1,
0.2706275, -1.559053, 3.621283, 0, 0.345098, 1, 1,
0.2727227, 1.013678, -1.625696, 0, 0.3411765, 1, 1,
0.2734516, -0.5103137, 4.969059, 0, 0.3333333, 1, 1,
0.2755473, 0.4375021, 1.09701, 0, 0.3294118, 1, 1,
0.2765766, 1.203319, 0.9790157, 0, 0.3215686, 1, 1,
0.2787947, 0.1377629, 0.1146171, 0, 0.3176471, 1, 1,
0.2816292, -1.26075, 0.5720525, 0, 0.3098039, 1, 1,
0.2850818, 0.6312736, 1.113883, 0, 0.3058824, 1, 1,
0.2852292, -1.449342, 2.433893, 0, 0.2980392, 1, 1,
0.2923243, -0.4290659, 1.359107, 0, 0.2901961, 1, 1,
0.2950836, -0.7628067, 1.724377, 0, 0.2862745, 1, 1,
0.298263, -0.2725712, 2.236277, 0, 0.2784314, 1, 1,
0.2993893, -0.7555081, 3.517223, 0, 0.2745098, 1, 1,
0.3025406, -0.3909569, 3.520014, 0, 0.2666667, 1, 1,
0.3052656, 0.8681952, -0.1187518, 0, 0.2627451, 1, 1,
0.3128938, 2.380624, 0.6571991, 0, 0.254902, 1, 1,
0.3141885, -1.451402, 3.736882, 0, 0.2509804, 1, 1,
0.3273255, -0.3499155, 3.902611, 0, 0.2431373, 1, 1,
0.3293736, 1.013102, -0.6640423, 0, 0.2392157, 1, 1,
0.332337, 0.3267211, 1.138757, 0, 0.2313726, 1, 1,
0.3342758, 0.2114254, 0.5706854, 0, 0.227451, 1, 1,
0.3424591, -0.6997938, 2.620893, 0, 0.2196078, 1, 1,
0.3445777, -1.284374, 2.047279, 0, 0.2156863, 1, 1,
0.3467257, -0.8193136, 0.6833991, 0, 0.2078431, 1, 1,
0.3478985, 0.1195036, 4.011584, 0, 0.2039216, 1, 1,
0.3486692, -0.1118526, 0.9993953, 0, 0.1960784, 1, 1,
0.3491594, 1.202671, -1.369229, 0, 0.1882353, 1, 1,
0.3496882, 0.6269846, 1.178536, 0, 0.1843137, 1, 1,
0.353539, -1.179727, 3.936644, 0, 0.1764706, 1, 1,
0.3539422, -0.3628691, 2.135105, 0, 0.172549, 1, 1,
0.3542244, -0.7005519, 1.986814, 0, 0.1647059, 1, 1,
0.356283, -0.1515391, 3.14005, 0, 0.1607843, 1, 1,
0.3574216, 1.725708, -2.082399, 0, 0.1529412, 1, 1,
0.3579517, -1.173641, 2.589325, 0, 0.1490196, 1, 1,
0.3596463, -0.9131892, 2.774177, 0, 0.1411765, 1, 1,
0.3599252, 0.1548458, 1.370127, 0, 0.1372549, 1, 1,
0.3617807, -0.5286874, 3.02527, 0, 0.1294118, 1, 1,
0.3618244, 0.8489064, -0.2967658, 0, 0.1254902, 1, 1,
0.3664232, 0.3615516, -0.1159009, 0, 0.1176471, 1, 1,
0.3709977, -0.3536687, 2.585125, 0, 0.1137255, 1, 1,
0.3730354, 0.3822719, 0.06457822, 0, 0.1058824, 1, 1,
0.3737243, -0.6908838, 2.390991, 0, 0.09803922, 1, 1,
0.3738441, 1.184383, 1.052671, 0, 0.09411765, 1, 1,
0.3745727, 0.6926559, -0.147703, 0, 0.08627451, 1, 1,
0.3749908, 0.9665735, -0.6005538, 0, 0.08235294, 1, 1,
0.3764657, -0.8469018, 2.462885, 0, 0.07450981, 1, 1,
0.3796893, 0.2125247, 2.4365, 0, 0.07058824, 1, 1,
0.3859418, -0.6265731, 2.713948, 0, 0.0627451, 1, 1,
0.3872545, 0.4008618, -0.4947459, 0, 0.05882353, 1, 1,
0.3874148, -0.216647, 2.61578, 0, 0.05098039, 1, 1,
0.389638, 2.301382, 0.3540373, 0, 0.04705882, 1, 1,
0.3900426, -0.002766677, 2.905495, 0, 0.03921569, 1, 1,
0.3915297, 0.9681032, -0.4471056, 0, 0.03529412, 1, 1,
0.3974268, 1.428061, 0.4922485, 0, 0.02745098, 1, 1,
0.3985092, 0.7540799, 0.7093953, 0, 0.02352941, 1, 1,
0.4000031, -1.357676, 4.245234, 0, 0.01568628, 1, 1,
0.4031664, 0.1140756, 1.555882, 0, 0.01176471, 1, 1,
0.4035028, -1.439433, 2.395782, 0, 0.003921569, 1, 1,
0.4047422, 1.185915, -1.068241, 0.003921569, 0, 1, 1,
0.4053022, 2.738565, 0.9885433, 0.007843138, 0, 1, 1,
0.40744, -0.7043468, 2.45601, 0.01568628, 0, 1, 1,
0.4076757, 0.1471172, 2.507932, 0.01960784, 0, 1, 1,
0.4132333, -0.2307339, 2.244252, 0.02745098, 0, 1, 1,
0.4146535, 0.982502, 0.1630282, 0.03137255, 0, 1, 1,
0.4171487, 1.085961, 0.1616977, 0.03921569, 0, 1, 1,
0.4206389, 0.1470384, 0.9833813, 0.04313726, 0, 1, 1,
0.421419, 0.2645298, 1.144116, 0.05098039, 0, 1, 1,
0.4252878, 0.4741921, 1.802991, 0.05490196, 0, 1, 1,
0.4259026, -1.277406, 4.874504, 0.0627451, 0, 1, 1,
0.4271362, -1.374252, 1.709422, 0.06666667, 0, 1, 1,
0.4312041, -1.365381, 2.871301, 0.07450981, 0, 1, 1,
0.4325144, -0.3455803, 0.9292992, 0.07843138, 0, 1, 1,
0.4327711, -0.1604382, 1.753374, 0.08627451, 0, 1, 1,
0.4337309, 0.2882302, 1.2847, 0.09019608, 0, 1, 1,
0.4342051, -1.034443, 2.345612, 0.09803922, 0, 1, 1,
0.4367912, 0.16597, 1.720453, 0.1058824, 0, 1, 1,
0.4379094, -0.2253993, 0.3269299, 0.1098039, 0, 1, 1,
0.4412185, -1.884421, 3.141496, 0.1176471, 0, 1, 1,
0.4424677, 0.2450084, -0.2427653, 0.1215686, 0, 1, 1,
0.4452085, -2.093982, 2.897398, 0.1294118, 0, 1, 1,
0.4473821, -0.07481338, 0.8345964, 0.1333333, 0, 1, 1,
0.453421, -0.1855793, 3.811162, 0.1411765, 0, 1, 1,
0.4542847, -1.513568, 4.150651, 0.145098, 0, 1, 1,
0.4563612, -1.011402, 2.381155, 0.1529412, 0, 1, 1,
0.4608591, 0.9572943, 2.246534, 0.1568628, 0, 1, 1,
0.466347, -0.9696285, 0.9891499, 0.1647059, 0, 1, 1,
0.4768787, 1.330361, -0.5514527, 0.1686275, 0, 1, 1,
0.4807716, 0.6102075, 1.103573, 0.1764706, 0, 1, 1,
0.4848835, 0.1609343, 2.676408, 0.1803922, 0, 1, 1,
0.4934604, -0.1188288, 3.534443, 0.1882353, 0, 1, 1,
0.4959035, -0.4175045, 2.04028, 0.1921569, 0, 1, 1,
0.5011874, 0.02258907, 1.885949, 0.2, 0, 1, 1,
0.5024502, 0.6217278, 1.605534, 0.2078431, 0, 1, 1,
0.5070733, -0.2137284, 1.771957, 0.2117647, 0, 1, 1,
0.5090936, -1.243562, 1.139269, 0.2196078, 0, 1, 1,
0.5100368, -0.0398498, -0.08398306, 0.2235294, 0, 1, 1,
0.5117759, 1.268996, -0.9381816, 0.2313726, 0, 1, 1,
0.5130381, -0.3163696, 1.352969, 0.2352941, 0, 1, 1,
0.5169185, 0.6855524, 0.6219705, 0.2431373, 0, 1, 1,
0.5170681, -0.9213576, 2.594603, 0.2470588, 0, 1, 1,
0.5215793, -0.42921, 3.38098, 0.254902, 0, 1, 1,
0.5229968, -0.0516598, 0.9341105, 0.2588235, 0, 1, 1,
0.5259839, 0.2149792, 1.182484, 0.2666667, 0, 1, 1,
0.5260381, 0.08733572, 1.286714, 0.2705882, 0, 1, 1,
0.5298212, -0.5985016, 2.022683, 0.2784314, 0, 1, 1,
0.535597, -0.2162761, 2.772999, 0.282353, 0, 1, 1,
0.5386525, -0.2222508, 1.868417, 0.2901961, 0, 1, 1,
0.5392107, 0.08055467, 0.4513532, 0.2941177, 0, 1, 1,
0.5469535, -0.8055234, 2.76564, 0.3019608, 0, 1, 1,
0.5502412, -0.4362325, 2.345281, 0.3098039, 0, 1, 1,
0.5517273, 0.4180193, -0.07714228, 0.3137255, 0, 1, 1,
0.5520276, 1.721135, -1.628677, 0.3215686, 0, 1, 1,
0.5539602, 0.106019, 1.30352, 0.3254902, 0, 1, 1,
0.5584384, -0.2242947, 1.923108, 0.3333333, 0, 1, 1,
0.5630723, 1.294573, -0.5606323, 0.3372549, 0, 1, 1,
0.5651581, -0.3143399, 2.835688, 0.345098, 0, 1, 1,
0.5699595, -0.3107893, 1.277043, 0.3490196, 0, 1, 1,
0.5727223, -0.2211803, 1.884791, 0.3568628, 0, 1, 1,
0.5760732, -0.100478, 0.2073492, 0.3607843, 0, 1, 1,
0.5795674, -1.057438, 2.742616, 0.3686275, 0, 1, 1,
0.5806214, -0.2744315, 2.653786, 0.372549, 0, 1, 1,
0.5816508, 2.321495, 0.3597424, 0.3803922, 0, 1, 1,
0.5831431, -0.2866092, 1.816863, 0.3843137, 0, 1, 1,
0.5884778, 0.7998017, 0.7420176, 0.3921569, 0, 1, 1,
0.5895232, -1.758879, 3.099229, 0.3960784, 0, 1, 1,
0.5896044, -0.5393376, 2.215636, 0.4039216, 0, 1, 1,
0.5930035, 0.7759153, 0.231902, 0.4117647, 0, 1, 1,
0.5932188, 1.634293, 1.016357, 0.4156863, 0, 1, 1,
0.5982597, -0.6872636, 2.082535, 0.4235294, 0, 1, 1,
0.5992384, -0.0133095, 1.97284, 0.427451, 0, 1, 1,
0.6037908, 0.7778215, 1.81599, 0.4352941, 0, 1, 1,
0.60399, -0.3469234, 1.457414, 0.4392157, 0, 1, 1,
0.6056674, 0.1469114, 1.501606, 0.4470588, 0, 1, 1,
0.6102833, -0.9619116, 3.95049, 0.4509804, 0, 1, 1,
0.6103244, 0.1342323, 1.752126, 0.4588235, 0, 1, 1,
0.6120315, 0.7836145, 2.10811, 0.4627451, 0, 1, 1,
0.6122956, 1.021084, 0.1811003, 0.4705882, 0, 1, 1,
0.6166, -0.2172746, 2.998813, 0.4745098, 0, 1, 1,
0.6219555, 0.9364209, 0.5162998, 0.4823529, 0, 1, 1,
0.6282539, 0.6227842, 1.885755, 0.4862745, 0, 1, 1,
0.628672, -2.389265, 3.428279, 0.4941176, 0, 1, 1,
0.6287872, 0.6648682, 0.3147706, 0.5019608, 0, 1, 1,
0.6290703, -1.313549, 4.561666, 0.5058824, 0, 1, 1,
0.6331933, -0.850352, 1.807684, 0.5137255, 0, 1, 1,
0.6351379, 0.0188218, 1.938493, 0.5176471, 0, 1, 1,
0.6396547, 0.3962815, 0.2294085, 0.5254902, 0, 1, 1,
0.6405249, -0.4700474, 1.966529, 0.5294118, 0, 1, 1,
0.648178, -0.08059528, 2.189521, 0.5372549, 0, 1, 1,
0.6496555, -1.446275, 2.332385, 0.5411765, 0, 1, 1,
0.6526071, 0.6744536, 0.7724329, 0.5490196, 0, 1, 1,
0.6562732, 0.7412493, 1.626722, 0.5529412, 0, 1, 1,
0.6584296, -1.394883, 3.396659, 0.5607843, 0, 1, 1,
0.6590626, 1.000493, 0.606871, 0.5647059, 0, 1, 1,
0.661732, 1.243728, 0.6177407, 0.572549, 0, 1, 1,
0.661934, 0.7502051, 0.6796479, 0.5764706, 0, 1, 1,
0.6640997, -0.1942, 2.530979, 0.5843138, 0, 1, 1,
0.6678113, 0.3870853, -0.3823296, 0.5882353, 0, 1, 1,
0.681927, -1.041903, 2.149673, 0.5960785, 0, 1, 1,
0.6834236, -1.747855, 3.27545, 0.6039216, 0, 1, 1,
0.6882726, -1.107313, 1.314406, 0.6078432, 0, 1, 1,
0.6958293, 0.29616, 1.239437, 0.6156863, 0, 1, 1,
0.6995201, -0.06658343, 2.283828, 0.6196079, 0, 1, 1,
0.7020594, 0.8887424, -0.00188484, 0.627451, 0, 1, 1,
0.7046498, 1.264922, -0.9710091, 0.6313726, 0, 1, 1,
0.7060534, -2.676702, 3.078483, 0.6392157, 0, 1, 1,
0.7075187, -0.9596958, 5.065541, 0.6431373, 0, 1, 1,
0.7111744, 0.414137, 1.269388, 0.6509804, 0, 1, 1,
0.7139077, -0.8882213, 4.685751, 0.654902, 0, 1, 1,
0.715125, -0.6580168, 3.463509, 0.6627451, 0, 1, 1,
0.7161281, 1.141469, -1.048501, 0.6666667, 0, 1, 1,
0.7161424, -0.1532689, 3.704355, 0.6745098, 0, 1, 1,
0.7192165, -0.2939803, 2.466332, 0.6784314, 0, 1, 1,
0.7194546, -0.2793598, 0.8896496, 0.6862745, 0, 1, 1,
0.7217371, 1.27496, 1.153605, 0.6901961, 0, 1, 1,
0.7218202, -0.7232525, 1.413722, 0.6980392, 0, 1, 1,
0.7223453, 0.4732599, -0.5487723, 0.7058824, 0, 1, 1,
0.7427178, -0.141319, 1.082524, 0.7098039, 0, 1, 1,
0.7510887, 0.8395985, 0.8505979, 0.7176471, 0, 1, 1,
0.7543238, 1.423866, 1.769812, 0.7215686, 0, 1, 1,
0.7548816, 0.3290088, -1.017149, 0.7294118, 0, 1, 1,
0.7572393, 0.7031642, 0.634721, 0.7333333, 0, 1, 1,
0.7603389, 0.6189305, 2.103648, 0.7411765, 0, 1, 1,
0.7640001, 0.5639507, 3.479716, 0.7450981, 0, 1, 1,
0.7659054, 1.322174, 1.923544, 0.7529412, 0, 1, 1,
0.7659374, -2.79661, 3.733685, 0.7568628, 0, 1, 1,
0.7710571, 1.168671, 0.113705, 0.7647059, 0, 1, 1,
0.7771803, 1.954173, -0.4306198, 0.7686275, 0, 1, 1,
0.7771842, -0.5133116, 1.509811, 0.7764706, 0, 1, 1,
0.778151, -0.4768576, 2.070852, 0.7803922, 0, 1, 1,
0.7835637, 1.797016, -1.107633, 0.7882353, 0, 1, 1,
0.7889435, -0.03755331, 1.046951, 0.7921569, 0, 1, 1,
0.794512, -0.6061198, 0.564364, 0.8, 0, 1, 1,
0.8069381, 0.5579473, -0.2239756, 0.8078431, 0, 1, 1,
0.8089291, -0.3353777, 1.274454, 0.8117647, 0, 1, 1,
0.8179374, 0.1087961, 0.847353, 0.8196079, 0, 1, 1,
0.8200033, -0.7229742, 0.9337606, 0.8235294, 0, 1, 1,
0.8210441, -0.2531986, 0.3785903, 0.8313726, 0, 1, 1,
0.8221858, -0.5898944, 1.526108, 0.8352941, 0, 1, 1,
0.8299808, -0.9568463, 1.762965, 0.8431373, 0, 1, 1,
0.8327348, 0.2693288, 3.39669, 0.8470588, 0, 1, 1,
0.8344088, 0.594922, -0.5540503, 0.854902, 0, 1, 1,
0.8442457, -0.4275205, 3.289479, 0.8588235, 0, 1, 1,
0.8566306, 0.7868041, -1.4617, 0.8666667, 0, 1, 1,
0.8590857, 1.000018, 1.458057, 0.8705882, 0, 1, 1,
0.8608437, -0.9515066, 2.09741, 0.8784314, 0, 1, 1,
0.8628777, -0.4818594, 1.130699, 0.8823529, 0, 1, 1,
0.8646613, 0.3510742, 1.082807, 0.8901961, 0, 1, 1,
0.8752977, 0.7573598, -0.1938167, 0.8941177, 0, 1, 1,
0.8782015, 0.1308941, 2.661454, 0.9019608, 0, 1, 1,
0.8833334, 0.3415576, -0.1334239, 0.9098039, 0, 1, 1,
0.8851683, 0.6415448, 2.060577, 0.9137255, 0, 1, 1,
0.8937644, -0.3250697, 1.100344, 0.9215686, 0, 1, 1,
0.8942146, 1.448979, 0.2079514, 0.9254902, 0, 1, 1,
0.8962922, -0.8129285, 2.37659, 0.9333333, 0, 1, 1,
0.8995996, 0.4105015, -0.3117604, 0.9372549, 0, 1, 1,
0.9068704, 1.076035, -0.1897823, 0.945098, 0, 1, 1,
0.9253457, -1.076878, 3.189371, 0.9490196, 0, 1, 1,
0.9282628, 0.6191359, 2.255412, 0.9568627, 0, 1, 1,
0.9506597, 0.0896786, 2.158904, 0.9607843, 0, 1, 1,
0.9516906, -1.547126, 2.990262, 0.9686275, 0, 1, 1,
0.9534594, 0.5067081, 0.03515518, 0.972549, 0, 1, 1,
0.9557272, 0.05306112, 2.000383, 0.9803922, 0, 1, 1,
0.9566777, 0.06988202, 2.968711, 0.9843137, 0, 1, 1,
0.9638584, -0.7722008, 2.436381, 0.9921569, 0, 1, 1,
0.9679213, 1.24397, 0.7434534, 0.9960784, 0, 1, 1,
0.9698052, -0.02153972, 0.1752372, 1, 0, 0.9960784, 1,
0.9706077, -0.5907431, 1.134322, 1, 0, 0.9882353, 1,
0.9707897, -1.262996, 3.199384, 1, 0, 0.9843137, 1,
0.9729845, 1.491192, 0.091799, 1, 0, 0.9764706, 1,
0.9753181, 0.578546, -0.3213507, 1, 0, 0.972549, 1,
0.9840396, 0.2337208, 0.6129339, 1, 0, 0.9647059, 1,
0.9854106, 0.1353278, 0.5020003, 1, 0, 0.9607843, 1,
0.9871428, -1.308192, 2.131295, 1, 0, 0.9529412, 1,
0.9911835, 0.1749906, 1.68092, 1, 0, 0.9490196, 1,
0.9970229, 1.237095, 0.02791827, 1, 0, 0.9411765, 1,
0.9979646, 0.09472635, 3.231564, 1, 0, 0.9372549, 1,
1.001497, 1.506825, 0.9909652, 1, 0, 0.9294118, 1,
1.004889, 1.58792, -0.8378987, 1, 0, 0.9254902, 1,
1.008093, 0.5665545, 0.1709222, 1, 0, 0.9176471, 1,
1.011405, 0.6280969, -0.2853583, 1, 0, 0.9137255, 1,
1.01326, -0.5184985, 3.654158, 1, 0, 0.9058824, 1,
1.013515, -0.1330773, 2.238925, 1, 0, 0.9019608, 1,
1.016753, 1.362441, 1.768522, 1, 0, 0.8941177, 1,
1.03461, 0.6429954, 1.178251, 1, 0, 0.8862745, 1,
1.037585, -0.5986598, 1.965745, 1, 0, 0.8823529, 1,
1.045907, -0.1454431, -0.3825883, 1, 0, 0.8745098, 1,
1.051851, -0.7418604, 1.555346, 1, 0, 0.8705882, 1,
1.058329, 0.8141582, -1.121797, 1, 0, 0.8627451, 1,
1.058766, 0.6845695, 0.3308964, 1, 0, 0.8588235, 1,
1.061578, 0.2898968, 2.070217, 1, 0, 0.8509804, 1,
1.062497, 2.099032, -0.6621705, 1, 0, 0.8470588, 1,
1.066362, -1.24686, 3.720647, 1, 0, 0.8392157, 1,
1.067225, -0.02329556, 1.764517, 1, 0, 0.8352941, 1,
1.068836, 2.112388, 0.3206649, 1, 0, 0.827451, 1,
1.070928, 0.7080429, 0.3757306, 1, 0, 0.8235294, 1,
1.075885, -0.8277594, 4.059482, 1, 0, 0.8156863, 1,
1.078213, -0.0521515, 2.017386, 1, 0, 0.8117647, 1,
1.078459, 0.4917995, 0.8901454, 1, 0, 0.8039216, 1,
1.081001, -0.4685039, 3.465066, 1, 0, 0.7960784, 1,
1.08338, -0.3057376, 0.5507665, 1, 0, 0.7921569, 1,
1.088406, -0.3762818, 2.356638, 1, 0, 0.7843137, 1,
1.08907, -3.876683, 0.9830067, 1, 0, 0.7803922, 1,
1.090076, 1.082396, 0.3600062, 1, 0, 0.772549, 1,
1.090206, -1.907035, 3.589439, 1, 0, 0.7686275, 1,
1.091506, 0.2580679, 2.057392, 1, 0, 0.7607843, 1,
1.102651, -0.5888407, 1.122246, 1, 0, 0.7568628, 1,
1.104451, -2.576977, 2.897642, 1, 0, 0.7490196, 1,
1.104854, -1.246627, 1.376306, 1, 0, 0.7450981, 1,
1.105859, -0.9876947, 0.7358367, 1, 0, 0.7372549, 1,
1.107029, 0.1347228, 2.416738, 1, 0, 0.7333333, 1,
1.107063, 0.1269713, 3.441015, 1, 0, 0.7254902, 1,
1.111363, -0.2300498, 1.536701, 1, 0, 0.7215686, 1,
1.11343, 0.2628598, 1.384989, 1, 0, 0.7137255, 1,
1.11788, -0.7474368, 2.510391, 1, 0, 0.7098039, 1,
1.123659, -0.8017212, 2.194259, 1, 0, 0.7019608, 1,
1.133401, 0.8075208, 2.573125, 1, 0, 0.6941177, 1,
1.134881, 0.9440665, 1.842413, 1, 0, 0.6901961, 1,
1.147083, 3.261053, -0.07180396, 1, 0, 0.682353, 1,
1.15417, 1.301856, -0.06165925, 1, 0, 0.6784314, 1,
1.158897, 0.03143714, 2.001227, 1, 0, 0.6705883, 1,
1.158929, 2.760902, 0.3438137, 1, 0, 0.6666667, 1,
1.161226, 1.62621, 2.568247, 1, 0, 0.6588235, 1,
1.164663, -0.9500273, 2.31475, 1, 0, 0.654902, 1,
1.183421, 0.4280708, 1.434287, 1, 0, 0.6470588, 1,
1.191284, -0.005828157, 0.5578663, 1, 0, 0.6431373, 1,
1.20471, -0.7296711, 1.746868, 1, 0, 0.6352941, 1,
1.206587, -0.1929035, 2.260493, 1, 0, 0.6313726, 1,
1.209017, 1.110829, 0.7208825, 1, 0, 0.6235294, 1,
1.225392, -1.429763, 4.948357, 1, 0, 0.6196079, 1,
1.234685, 0.8142297, -0.7259851, 1, 0, 0.6117647, 1,
1.243371, 0.4841988, 0.2864027, 1, 0, 0.6078432, 1,
1.251286, 0.5249059, 2.592358, 1, 0, 0.6, 1,
1.254117, -0.7209095, 1.5737, 1, 0, 0.5921569, 1,
1.267974, 1.144021, -0.2801025, 1, 0, 0.5882353, 1,
1.269039, -0.6843981, 1.556977, 1, 0, 0.5803922, 1,
1.269649, 1.441949, -0.02872461, 1, 0, 0.5764706, 1,
1.272839, 1.534032, -0.2867997, 1, 0, 0.5686275, 1,
1.275546, 1.00679, -0.1232117, 1, 0, 0.5647059, 1,
1.280631, 1.085088, 1.262302, 1, 0, 0.5568628, 1,
1.281513, -0.709317, 1.923728, 1, 0, 0.5529412, 1,
1.283132, -0.02449967, 2.736362, 1, 0, 0.5450981, 1,
1.283852, -0.09814095, 3.496301, 1, 0, 0.5411765, 1,
1.286422, 1.100361, 1.530334, 1, 0, 0.5333334, 1,
1.292102, -0.6984363, 1.398211, 1, 0, 0.5294118, 1,
1.29461, 1.500396, 0.9591332, 1, 0, 0.5215687, 1,
1.297804, 0.08427884, 2.087831, 1, 0, 0.5176471, 1,
1.30717, 0.7500602, 0.387958, 1, 0, 0.509804, 1,
1.309785, -0.5915827, 2.069405, 1, 0, 0.5058824, 1,
1.314416, 0.3813986, 1.073907, 1, 0, 0.4980392, 1,
1.31486, -0.4957856, 3.038396, 1, 0, 0.4901961, 1,
1.323292, 0.694261, 0.6611656, 1, 0, 0.4862745, 1,
1.32865, 0.07467572, 0.4710735, 1, 0, 0.4784314, 1,
1.344168, 0.006947363, 2.843057, 1, 0, 0.4745098, 1,
1.344608, -0.6952789, 2.405479, 1, 0, 0.4666667, 1,
1.350575, 1.027719, 0.1381645, 1, 0, 0.4627451, 1,
1.360606, -0.2690174, 3.351706, 1, 0, 0.454902, 1,
1.363711, 0.4021325, 0.7915263, 1, 0, 0.4509804, 1,
1.368001, 1.108014, 2.304322, 1, 0, 0.4431373, 1,
1.370522, 0.9317082, -0.102603, 1, 0, 0.4392157, 1,
1.377059, 0.01845132, 1.59648, 1, 0, 0.4313726, 1,
1.386901, 0.5665885, 1.004167, 1, 0, 0.427451, 1,
1.394171, 0.1979574, -0.8182551, 1, 0, 0.4196078, 1,
1.405572, -0.9954965, 2.382795, 1, 0, 0.4156863, 1,
1.410334, 0.723115, 2.795281, 1, 0, 0.4078431, 1,
1.42995, -0.9741514, 2.559834, 1, 0, 0.4039216, 1,
1.43093, -0.9242178, 2.402561, 1, 0, 0.3960784, 1,
1.436081, -1.844096, 1.860088, 1, 0, 0.3882353, 1,
1.440326, -0.07275765, 2.140455, 1, 0, 0.3843137, 1,
1.452161, 0.08667883, 0.9234707, 1, 0, 0.3764706, 1,
1.463787, -1.968045, 2.794048, 1, 0, 0.372549, 1,
1.463865, 1.620548, 1.882531, 1, 0, 0.3647059, 1,
1.480816, -0.2373528, 1.236281, 1, 0, 0.3607843, 1,
1.485593, -1.957152, 2.104466, 1, 0, 0.3529412, 1,
1.508782, 0.6707258, 1.241349, 1, 0, 0.3490196, 1,
1.523325, -1.232475, 2.892438, 1, 0, 0.3411765, 1,
1.531762, 0.01059168, 0.5485359, 1, 0, 0.3372549, 1,
1.536033, 0.08016808, 3.737631, 1, 0, 0.3294118, 1,
1.539148, 1.105629, 1.238045, 1, 0, 0.3254902, 1,
1.551936, 0.4913444, 1.288678, 1, 0, 0.3176471, 1,
1.559361, 0.6015829, 1.088249, 1, 0, 0.3137255, 1,
1.559609, -0.6570702, 1.778325, 1, 0, 0.3058824, 1,
1.583345, 0.08751687, 2.178071, 1, 0, 0.2980392, 1,
1.595428, -1.184089, 2.404595, 1, 0, 0.2941177, 1,
1.601351, -0.6978629, 2.750541, 1, 0, 0.2862745, 1,
1.637222, -0.5188869, 3.052487, 1, 0, 0.282353, 1,
1.674728, -0.4720712, 2.270273, 1, 0, 0.2745098, 1,
1.675159, -0.4182802, 1.132482, 1, 0, 0.2705882, 1,
1.681542, 0.6796629, 1.760903, 1, 0, 0.2627451, 1,
1.701554, 0.04590803, 1.454976, 1, 0, 0.2588235, 1,
1.70651, 1.057302, -1.141451, 1, 0, 0.2509804, 1,
1.710956, 0.3568256, 0.5566384, 1, 0, 0.2470588, 1,
1.720336, -0.3382762, 2.732054, 1, 0, 0.2392157, 1,
1.73341, 0.5854753, 0.3879139, 1, 0, 0.2352941, 1,
1.753152, -0.4288518, 2.079593, 1, 0, 0.227451, 1,
1.776358, -0.7803051, 1.095373, 1, 0, 0.2235294, 1,
1.79313, 0.1798619, 0.02042826, 1, 0, 0.2156863, 1,
1.808192, -0.8970975, 1.603986, 1, 0, 0.2117647, 1,
1.824274, 0.02615981, 2.449052, 1, 0, 0.2039216, 1,
1.827873, -1.188128, 1.954983, 1, 0, 0.1960784, 1,
1.830588, -0.9445671, 0.7794663, 1, 0, 0.1921569, 1,
1.840304, 1.080795, 2.063661, 1, 0, 0.1843137, 1,
1.848282, -3.45891, 0.02416295, 1, 0, 0.1803922, 1,
1.888498, -0.5040774, 2.93943, 1, 0, 0.172549, 1,
1.891588, -0.8072108, 0.5798732, 1, 0, 0.1686275, 1,
1.894313, -0.8911669, -0.3752925, 1, 0, 0.1607843, 1,
1.899048, -0.04004784, 2.275815, 1, 0, 0.1568628, 1,
1.943776, 1.822291, 0.7278872, 1, 0, 0.1490196, 1,
1.957471, 0.216702, 1.494286, 1, 0, 0.145098, 1,
1.995477, -1.030593, 0.464459, 1, 0, 0.1372549, 1,
1.999636, -0.02006474, 1.625023, 1, 0, 0.1333333, 1,
2.012724, 1.206151, 2.658626, 1, 0, 0.1254902, 1,
2.032749, -1.672002, 0.4315022, 1, 0, 0.1215686, 1,
2.078637, -1.534332, 2.90122, 1, 0, 0.1137255, 1,
2.099607, 0.02760872, 0.9592637, 1, 0, 0.1098039, 1,
2.112792, -1.613268, 2.020249, 1, 0, 0.1019608, 1,
2.123451, -0.3357427, 0.6806045, 1, 0, 0.09411765, 1,
2.155494, -1.147156, 3.152604, 1, 0, 0.09019608, 1,
2.171903, 1.052984, 0.5280627, 1, 0, 0.08235294, 1,
2.176234, 0.3658249, 2.619522, 1, 0, 0.07843138, 1,
2.190739, -0.5038568, 2.843802, 1, 0, 0.07058824, 1,
2.195462, 0.8226616, 1.50199, 1, 0, 0.06666667, 1,
2.294516, 0.5234424, 1.448601, 1, 0, 0.05882353, 1,
2.301962, 0.2352436, 0.9744769, 1, 0, 0.05490196, 1,
2.325424, 0.03492535, 1.926125, 1, 0, 0.04705882, 1,
2.380703, 0.6377839, 1.365526, 1, 0, 0.04313726, 1,
2.419024, 0.3691153, 3.8095, 1, 0, 0.03529412, 1,
2.708026, 0.6158004, 2.591556, 1, 0, 0.03137255, 1,
2.718971, 1.101867, 1.144482, 1, 0, 0.02352941, 1,
2.826446, -0.8148078, 1.132915, 1, 0, 0.01960784, 1,
2.899781, 0.5924252, 2.54546, 1, 0, 0.01176471, 1,
3.392722, -0.710121, 2.135727, 1, 0, 0.007843138, 1
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
-0.1068324, -5.134828, -6.97873, 0, -0.5, 0.5, 0.5,
-0.1068324, -5.134828, -6.97873, 1, -0.5, 0.5, 0.5,
-0.1068324, -5.134828, -6.97873, 1, 1.5, 0.5, 0.5,
-0.1068324, -5.134828, -6.97873, 0, 1.5, 0.5, 0.5
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
-4.792736, -0.1653423, -6.97873, 0, -0.5, 0.5, 0.5,
-4.792736, -0.1653423, -6.97873, 1, -0.5, 0.5, 0.5,
-4.792736, -0.1653423, -6.97873, 1, 1.5, 0.5, 0.5,
-4.792736, -0.1653423, -6.97873, 0, 1.5, 0.5, 0.5
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
-4.792736, -5.134828, 0.02976274, 0, -0.5, 0.5, 0.5,
-4.792736, -5.134828, 0.02976274, 1, -0.5, 0.5, 0.5,
-4.792736, -5.134828, 0.02976274, 1, 1.5, 0.5, 0.5,
-4.792736, -5.134828, 0.02976274, 0, 1.5, 0.5, 0.5
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
-3, -3.988024, -5.361386,
3, -3.988024, -5.361386,
-3, -3.988024, -5.361386,
-3, -4.179158, -5.630943,
-2, -3.988024, -5.361386,
-2, -4.179158, -5.630943,
-1, -3.988024, -5.361386,
-1, -4.179158, -5.630943,
0, -3.988024, -5.361386,
0, -4.179158, -5.630943,
1, -3.988024, -5.361386,
1, -4.179158, -5.630943,
2, -3.988024, -5.361386,
2, -4.179158, -5.630943,
3, -3.988024, -5.361386,
3, -4.179158, -5.630943
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
-3, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
-3, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
-3, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
-3, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5,
-2, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
-2, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
-2, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
-2, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5,
-1, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
-1, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
-1, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
-1, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5,
0, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
0, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
0, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
0, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5,
1, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
1, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
1, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
1, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5,
2, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
2, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
2, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
2, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5,
3, -4.561426, -6.170058, 0, -0.5, 0.5, 0.5,
3, -4.561426, -6.170058, 1, -0.5, 0.5, 0.5,
3, -4.561426, -6.170058, 1, 1.5, 0.5, 0.5,
3, -4.561426, -6.170058, 0, 1.5, 0.5, 0.5
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
-3.711374, -2, -5.361386,
-3.711374, 2, -5.361386,
-3.711374, -2, -5.361386,
-3.891601, -2, -5.630943,
-3.711374, 0, -5.361386,
-3.891601, 0, -5.630943,
-3.711374, 2, -5.361386,
-3.891601, 2, -5.630943
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
-4.252055, -2, -6.170058, 0, -0.5, 0.5, 0.5,
-4.252055, -2, -6.170058, 1, -0.5, 0.5, 0.5,
-4.252055, -2, -6.170058, 1, 1.5, 0.5, 0.5,
-4.252055, -2, -6.170058, 0, 1.5, 0.5, 0.5,
-4.252055, 0, -6.170058, 0, -0.5, 0.5, 0.5,
-4.252055, 0, -6.170058, 1, -0.5, 0.5, 0.5,
-4.252055, 0, -6.170058, 1, 1.5, 0.5, 0.5,
-4.252055, 0, -6.170058, 0, 1.5, 0.5, 0.5,
-4.252055, 2, -6.170058, 0, -0.5, 0.5, 0.5,
-4.252055, 2, -6.170058, 1, -0.5, 0.5, 0.5,
-4.252055, 2, -6.170058, 1, 1.5, 0.5, 0.5,
-4.252055, 2, -6.170058, 0, 1.5, 0.5, 0.5
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
-3.711374, -3.988024, -4,
-3.711374, -3.988024, 4,
-3.711374, -3.988024, -4,
-3.891601, -4.179158, -4,
-3.711374, -3.988024, -2,
-3.891601, -4.179158, -2,
-3.711374, -3.988024, 0,
-3.891601, -4.179158, 0,
-3.711374, -3.988024, 2,
-3.891601, -4.179158, 2,
-3.711374, -3.988024, 4,
-3.891601, -4.179158, 4
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
-4.252055, -4.561426, -4, 0, -0.5, 0.5, 0.5,
-4.252055, -4.561426, -4, 1, -0.5, 0.5, 0.5,
-4.252055, -4.561426, -4, 1, 1.5, 0.5, 0.5,
-4.252055, -4.561426, -4, 0, 1.5, 0.5, 0.5,
-4.252055, -4.561426, -2, 0, -0.5, 0.5, 0.5,
-4.252055, -4.561426, -2, 1, -0.5, 0.5, 0.5,
-4.252055, -4.561426, -2, 1, 1.5, 0.5, 0.5,
-4.252055, -4.561426, -2, 0, 1.5, 0.5, 0.5,
-4.252055, -4.561426, 0, 0, -0.5, 0.5, 0.5,
-4.252055, -4.561426, 0, 1, -0.5, 0.5, 0.5,
-4.252055, -4.561426, 0, 1, 1.5, 0.5, 0.5,
-4.252055, -4.561426, 0, 0, 1.5, 0.5, 0.5,
-4.252055, -4.561426, 2, 0, -0.5, 0.5, 0.5,
-4.252055, -4.561426, 2, 1, -0.5, 0.5, 0.5,
-4.252055, -4.561426, 2, 1, 1.5, 0.5, 0.5,
-4.252055, -4.561426, 2, 0, 1.5, 0.5, 0.5,
-4.252055, -4.561426, 4, 0, -0.5, 0.5, 0.5,
-4.252055, -4.561426, 4, 1, -0.5, 0.5, 0.5,
-4.252055, -4.561426, 4, 1, 1.5, 0.5, 0.5,
-4.252055, -4.561426, 4, 0, 1.5, 0.5, 0.5
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
-3.711374, -3.988024, -5.361386,
-3.711374, 3.657339, -5.361386,
-3.711374, -3.988024, 5.420911,
-3.711374, 3.657339, 5.420911,
-3.711374, -3.988024, -5.361386,
-3.711374, -3.988024, 5.420911,
-3.711374, 3.657339, -5.361386,
-3.711374, 3.657339, 5.420911,
-3.711374, -3.988024, -5.361386,
3.497709, -3.988024, -5.361386,
-3.711374, -3.988024, 5.420911,
3.497709, -3.988024, 5.420911,
-3.711374, 3.657339, -5.361386,
3.497709, 3.657339, -5.361386,
-3.711374, 3.657339, 5.420911,
3.497709, 3.657339, 5.420911,
3.497709, -3.988024, -5.361386,
3.497709, 3.657339, -5.361386,
3.497709, -3.988024, 5.420911,
3.497709, 3.657339, 5.420911,
3.497709, -3.988024, -5.361386,
3.497709, -3.988024, 5.420911,
3.497709, 3.657339, -5.361386,
3.497709, 3.657339, 5.420911
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
var radius = 8.039562;
var distance = 35.76892;
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
mvMatrix.translate( 0.1068324, 0.1653423, -0.02976274 );
mvMatrix.scale( 1.205775, 1.136968, 0.8061856 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.76892);
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
lufenuron<-read.table("lufenuron.xyz")
```

```
## Error in read.table("lufenuron.xyz"): no lines available in input
```

```r
x<-lufenuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
```

```r
y<-lufenuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
```

```r
z<-lufenuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
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
-3.606387, -0.1527262, 0.5104948, 0, 0, 1, 1, 1,
-2.825966, 1.304824, -3.314378, 1, 0, 0, 1, 1,
-2.661255, 0.542333, -2.018299, 1, 0, 0, 1, 1,
-2.612677, 0.6132352, -1.421341, 1, 0, 0, 1, 1,
-2.484338, 0.05665493, -2.604818, 1, 0, 0, 1, 1,
-2.39598, -0.221452, -2.166211, 1, 0, 0, 1, 1,
-2.38347, 1.19527, -0.7898342, 0, 0, 0, 1, 1,
-2.352515, 0.01803866, -2.070449, 0, 0, 0, 1, 1,
-2.328948, 1.073615, 0.801028, 0, 0, 0, 1, 1,
-2.312054, 0.5075061, -2.499957, 0, 0, 0, 1, 1,
-2.304448, 0.9279931, -0.1779052, 0, 0, 0, 1, 1,
-2.237192, -0.7264125, -1.683788, 0, 0, 0, 1, 1,
-2.211106, -0.4881047, -2.248371, 0, 0, 0, 1, 1,
-2.171959, -0.5555677, -3.521661, 1, 1, 1, 1, 1,
-2.075138, -0.4246717, -1.40535, 1, 1, 1, 1, 1,
-2.071376, 0.7028031, 0.1830404, 1, 1, 1, 1, 1,
-2.064865, 1.978221, 0.5655705, 1, 1, 1, 1, 1,
-2.041427, -1.391796, -2.375673, 1, 1, 1, 1, 1,
-2.026744, 0.570673, -0.2034618, 1, 1, 1, 1, 1,
-1.999845, -0.4109138, -0.8509267, 1, 1, 1, 1, 1,
-1.983467, 0.4319564, 0.06176735, 1, 1, 1, 1, 1,
-1.968924, 0.4854509, -1.379047, 1, 1, 1, 1, 1,
-1.941677, 0.5931287, -1.679329, 1, 1, 1, 1, 1,
-1.94084, -0.2060525, -0.7903941, 1, 1, 1, 1, 1,
-1.930214, 1.051032, -0.4219448, 1, 1, 1, 1, 1,
-1.927577, -0.3392919, -1.898981, 1, 1, 1, 1, 1,
-1.911205, 2.252029, -0.4626758, 1, 1, 1, 1, 1,
-1.882461, 0.8729742, -1.850305, 1, 1, 1, 1, 1,
-1.851232, 0.02602202, -2.376312, 0, 0, 1, 1, 1,
-1.850051, 2.301214, -0.335798, 1, 0, 0, 1, 1,
-1.833946, 1.607151, -0.3299224, 1, 0, 0, 1, 1,
-1.833572, -1.281718, -1.769193, 1, 0, 0, 1, 1,
-1.814127, 1.439726, -0.866394, 1, 0, 0, 1, 1,
-1.790622, 1.306698, -0.1218543, 1, 0, 0, 1, 1,
-1.788751, -0.7825236, -0.8809757, 0, 0, 0, 1, 1,
-1.773213, 2.5166, -0.1026045, 0, 0, 0, 1, 1,
-1.747507, -1.310456, -3.09724, 0, 0, 0, 1, 1,
-1.744442, 0.9552836, -0.3630743, 0, 0, 0, 1, 1,
-1.744244, 0.2614949, -1.264663, 0, 0, 0, 1, 1,
-1.743254, 0.7253922, -1.637566, 0, 0, 0, 1, 1,
-1.717489, 0.2009789, -1.876026, 0, 0, 0, 1, 1,
-1.714848, 0.1476399, -0.4716983, 1, 1, 1, 1, 1,
-1.714275, 1.329398, -1.863256, 1, 1, 1, 1, 1,
-1.712727, 1.310604, -0.5424463, 1, 1, 1, 1, 1,
-1.700845, -0.9741783, -3.532274, 1, 1, 1, 1, 1,
-1.700056, -1.30288, -1.543231, 1, 1, 1, 1, 1,
-1.694447, -0.4495247, -0.2534138, 1, 1, 1, 1, 1,
-1.686115, -2.238451, -1.751711, 1, 1, 1, 1, 1,
-1.678687, 0.6299511, -1.715434, 1, 1, 1, 1, 1,
-1.673455, -0.8386207, -1.277411, 1, 1, 1, 1, 1,
-1.672084, 1.119037, -1.766035, 1, 1, 1, 1, 1,
-1.665433, 0.2988172, -1.22266, 1, 1, 1, 1, 1,
-1.657117, -0.1892287, -1.153751, 1, 1, 1, 1, 1,
-1.643536, 1.417917, -0.7760615, 1, 1, 1, 1, 1,
-1.643143, -0.3149134, -2.157908, 1, 1, 1, 1, 1,
-1.642202, -0.2387147, 0.4425903, 1, 1, 1, 1, 1,
-1.635934, 0.5822645, -1.271884, 0, 0, 1, 1, 1,
-1.633039, -0.8972698, -1.552218, 1, 0, 0, 1, 1,
-1.59466, 1.798048, -1.88364, 1, 0, 0, 1, 1,
-1.593493, 0.4275393, -2.116058, 1, 0, 0, 1, 1,
-1.56823, -0.6174285, -1.893973, 1, 0, 0, 1, 1,
-1.554481, -0.03207823, -2.803883, 1, 0, 0, 1, 1,
-1.546997, 0.1825057, -3.669034, 0, 0, 0, 1, 1,
-1.534073, 0.2000154, -4.02762, 0, 0, 0, 1, 1,
-1.515035, 0.6712244, -1.148656, 0, 0, 0, 1, 1,
-1.514047, 0.1164275, -0.227384, 0, 0, 0, 1, 1,
-1.507175, -0.6266862, -1.06395, 0, 0, 0, 1, 1,
-1.502408, -2.083771, -1.245289, 0, 0, 0, 1, 1,
-1.498377, 0.5092748, -3.600815, 0, 0, 0, 1, 1,
-1.496738, -0.7430369, -0.6325532, 1, 1, 1, 1, 1,
-1.489101, 0.3459601, -0.7850372, 1, 1, 1, 1, 1,
-1.484104, 0.4263407, -0.605379, 1, 1, 1, 1, 1,
-1.48401, -0.4166366, -0.8397597, 1, 1, 1, 1, 1,
-1.479924, 1.384934, -0.9402456, 1, 1, 1, 1, 1,
-1.477956, 0.9887776, 0.5321223, 1, 1, 1, 1, 1,
-1.466214, -0.4065723, -1.163805, 1, 1, 1, 1, 1,
-1.452963, 1.675262, -1.751556, 1, 1, 1, 1, 1,
-1.447892, 0.4812203, -0.7517728, 1, 1, 1, 1, 1,
-1.446941, -0.8698781, -4.430064, 1, 1, 1, 1, 1,
-1.443834, 0.4413333, 0.43367, 1, 1, 1, 1, 1,
-1.425096, 0.3087782, -0.3595575, 1, 1, 1, 1, 1,
-1.412399, -0.5576968, -0.4826461, 1, 1, 1, 1, 1,
-1.404205, -0.01720524, -0.4832659, 1, 1, 1, 1, 1,
-1.39664, 0.7434221, 0.3054465, 1, 1, 1, 1, 1,
-1.390792, -0.05633295, -1.202911, 0, 0, 1, 1, 1,
-1.387563, 0.2115574, -2.599917, 1, 0, 0, 1, 1,
-1.385721, 0.8135044, -2.59458, 1, 0, 0, 1, 1,
-1.381293, 0.3072522, -1.257127, 1, 0, 0, 1, 1,
-1.380603, -1.696088, -1.600379, 1, 0, 0, 1, 1,
-1.376612, 0.6104394, -0.1185238, 1, 0, 0, 1, 1,
-1.364742, 1.515029, -0.8813969, 0, 0, 0, 1, 1,
-1.355201, -0.464317, -2.221912, 0, 0, 0, 1, 1,
-1.338564, -0.2980876, -2.070459, 0, 0, 0, 1, 1,
-1.317371, -1.38125, -2.425518, 0, 0, 0, 1, 1,
-1.267929, -1.346239, -2.970742, 0, 0, 0, 1, 1,
-1.266392, -0.3636493, -0.6697838, 0, 0, 0, 1, 1,
-1.247183, 2.390999, -0.5244507, 0, 0, 0, 1, 1,
-1.244382, 0.005473119, -1.383179, 1, 1, 1, 1, 1,
-1.239219, 0.5236149, -2.131054, 1, 1, 1, 1, 1,
-1.233452, 0.7399269, -1.61016, 1, 1, 1, 1, 1,
-1.22735, 0.3852867, -0.7598667, 1, 1, 1, 1, 1,
-1.21655, 0.6530258, -1.091702, 1, 1, 1, 1, 1,
-1.213967, 0.7905901, -1.532645, 1, 1, 1, 1, 1,
-1.209886, -1.756513, -3.365704, 1, 1, 1, 1, 1,
-1.203612, -1.729881, -3.641177, 1, 1, 1, 1, 1,
-1.192908, 0.06764846, -2.229627, 1, 1, 1, 1, 1,
-1.191374, -1.32284, -3.585397, 1, 1, 1, 1, 1,
-1.185711, -1.209146, -0.5334252, 1, 1, 1, 1, 1,
-1.180536, -0.6282787, -1.499679, 1, 1, 1, 1, 1,
-1.17754, -0.5158489, -4.544442, 1, 1, 1, 1, 1,
-1.175958, -0.01664981, -0.9869092, 1, 1, 1, 1, 1,
-1.169283, 0.862043, -0.7456378, 1, 1, 1, 1, 1,
-1.165012, 1.421081, -1.291363, 0, 0, 1, 1, 1,
-1.164628, -0.3806521, 0.1683439, 1, 0, 0, 1, 1,
-1.16262, -0.8261308, -2.504915, 1, 0, 0, 1, 1,
-1.16182, -0.522835, -1.709162, 1, 0, 0, 1, 1,
-1.159517, 0.6617772, -1.549908, 1, 0, 0, 1, 1,
-1.142896, 1.262023, 0.2923761, 1, 0, 0, 1, 1,
-1.140333, 0.39043, -1.380435, 0, 0, 0, 1, 1,
-1.1403, -0.9037958, -3.225416, 0, 0, 0, 1, 1,
-1.137375, 0.513796, -2.591664, 0, 0, 0, 1, 1,
-1.135838, 0.8906087, -0.2353346, 0, 0, 0, 1, 1,
-1.132549, -0.8457687, -1.138394, 0, 0, 0, 1, 1,
-1.129956, 0.4397457, -0.745021, 0, 0, 0, 1, 1,
-1.129824, -2.058152, -3.649709, 0, 0, 0, 1, 1,
-1.124725, 0.676257, -1.993542, 1, 1, 1, 1, 1,
-1.121404, 0.2046592, -1.159906, 1, 1, 1, 1, 1,
-1.12138, -1.505915, -2.811544, 1, 1, 1, 1, 1,
-1.11956, -0.8881748, -2.807321, 1, 1, 1, 1, 1,
-1.109516, 0.5209555, -0.775053, 1, 1, 1, 1, 1,
-1.109457, -0.8771322, -2.680465, 1, 1, 1, 1, 1,
-1.106654, 0.5260588, -1.269668, 1, 1, 1, 1, 1,
-1.105297, 1.457385, -0.4020028, 1, 1, 1, 1, 1,
-1.101544, 0.8006113, -0.8500655, 1, 1, 1, 1, 1,
-1.098263, 0.08340305, -1.802112, 1, 1, 1, 1, 1,
-1.094187, -2.092724, -1.770065, 1, 1, 1, 1, 1,
-1.080661, 1.671919, -1.981021, 1, 1, 1, 1, 1,
-1.078231, -0.01353212, -2.611839, 1, 1, 1, 1, 1,
-1.076107, 1.083936, -1.544068, 1, 1, 1, 1, 1,
-1.071948, 0.102665, 0.6579984, 1, 1, 1, 1, 1,
-1.069954, 0.2794268, -2.504629, 0, 0, 1, 1, 1,
-1.069468, 0.01592968, -1.183369, 1, 0, 0, 1, 1,
-1.05735, -0.8772489, -2.771794, 1, 0, 0, 1, 1,
-1.056904, -1.100062, -2.669786, 1, 0, 0, 1, 1,
-1.052472, -0.4297557, -0.7606924, 1, 0, 0, 1, 1,
-1.050352, -0.8091597, -1.697344, 1, 0, 0, 1, 1,
-1.042708, -0.3639092, -2.436323, 0, 0, 0, 1, 1,
-1.037851, 0.8635083, 1.232491, 0, 0, 0, 1, 1,
-1.037078, 0.3384732, -1.673896, 0, 0, 0, 1, 1,
-1.035671, -0.4502094, -2.020099, 0, 0, 0, 1, 1,
-1.033358, 0.4013821, -1.19976, 0, 0, 0, 1, 1,
-1.033176, 1.889614, -1.140879, 0, 0, 0, 1, 1,
-1.026593, -1.162545, -2.370474, 0, 0, 0, 1, 1,
-1.025893, 1.592239, 0.2103526, 1, 1, 1, 1, 1,
-1.023196, -1.241888, -2.256132, 1, 1, 1, 1, 1,
-1.018408, 0.3966227, 1.546648, 1, 1, 1, 1, 1,
-1.012071, -0.2476263, -2.480782, 1, 1, 1, 1, 1,
-1.004044, 2.058626, 0.36858, 1, 1, 1, 1, 1,
-1.001517, -0.5649995, -2.872586, 1, 1, 1, 1, 1,
-0.9923175, -2.421563, -3.389119, 1, 1, 1, 1, 1,
-0.9914001, 0.633638, -1.433444, 1, 1, 1, 1, 1,
-0.9846565, 0.7435507, -1.24737, 1, 1, 1, 1, 1,
-0.9837525, 0.4013852, -1.821709, 1, 1, 1, 1, 1,
-0.9804086, -0.8942378, -2.82827, 1, 1, 1, 1, 1,
-0.9720175, -0.6002573, -2.480727, 1, 1, 1, 1, 1,
-0.9657089, 0.1356571, -0.9081922, 1, 1, 1, 1, 1,
-0.9653905, 1.150578, -1.292514, 1, 1, 1, 1, 1,
-0.9545239, 1.199621, -1.735527, 1, 1, 1, 1, 1,
-0.9531457, -1.21712, -2.064307, 0, 0, 1, 1, 1,
-0.9512062, 0.5407881, 0.3421513, 1, 0, 0, 1, 1,
-0.9493544, -0.8653169, -2.664306, 1, 0, 0, 1, 1,
-0.944966, -0.080389, -2.818205, 1, 0, 0, 1, 1,
-0.9412763, 0.02771883, -2.23611, 1, 0, 0, 1, 1,
-0.9323462, -0.01623145, -1.804917, 1, 0, 0, 1, 1,
-0.9269775, 0.2590387, -2.280182, 0, 0, 0, 1, 1,
-0.9225374, 1.239257, -1.159725, 0, 0, 0, 1, 1,
-0.9108676, -0.1457061, -0.8293647, 0, 0, 0, 1, 1,
-0.9077036, 0.9234068, -0.9274086, 0, 0, 0, 1, 1,
-0.9076253, 0.3415854, -1.561197, 0, 0, 0, 1, 1,
-0.9068511, -1.611569, -3.791873, 0, 0, 0, 1, 1,
-0.9014854, 0.2357794, -1.630598, 0, 0, 0, 1, 1,
-0.9011913, -0.5134312, -2.012841, 1, 1, 1, 1, 1,
-0.8985652, -1.577803, -4.672905, 1, 1, 1, 1, 1,
-0.8970318, 1.337831, 0.5970085, 1, 1, 1, 1, 1,
-0.892529, 1.723316, -1.29562, 1, 1, 1, 1, 1,
-0.8854817, -0.9084046, -2.90257, 1, 1, 1, 1, 1,
-0.8852921, 2.089395, -0.1084852, 1, 1, 1, 1, 1,
-0.883015, -1.285964, -2.628017, 1, 1, 1, 1, 1,
-0.8821507, 0.3038989, -2.461192, 1, 1, 1, 1, 1,
-0.8806892, -0.3168503, -1.75197, 1, 1, 1, 1, 1,
-0.8761408, -0.1364758, -1.798406, 1, 1, 1, 1, 1,
-0.8753846, -1.224074, -2.308062, 1, 1, 1, 1, 1,
-0.8733283, 0.5303171, -0.04660352, 1, 1, 1, 1, 1,
-0.8697683, 0.7589764, -2.817624, 1, 1, 1, 1, 1,
-0.8689062, -0.4844749, -1.827837, 1, 1, 1, 1, 1,
-0.8685945, -0.6620141, -1.678543, 1, 1, 1, 1, 1,
-0.8678166, 0.6382235, -0.4075609, 0, 0, 1, 1, 1,
-0.8653673, -0.6441077, -3.452341, 1, 0, 0, 1, 1,
-0.8632916, -0.4935321, -3.764683, 1, 0, 0, 1, 1,
-0.862489, -0.2534799, -1.867132, 1, 0, 0, 1, 1,
-0.8588353, 0.3268388, -0.9124078, 1, 0, 0, 1, 1,
-0.8542207, 0.7228087, -1.774169, 1, 0, 0, 1, 1,
-0.853977, 0.9935871, 2.278988, 0, 0, 0, 1, 1,
-0.849543, -0.2190056, -2.362089, 0, 0, 0, 1, 1,
-0.8418381, -0.7969103, -1.034707, 0, 0, 0, 1, 1,
-0.8332174, 0.464469, -1.47078, 0, 0, 0, 1, 1,
-0.8306111, -0.05044491, -0.9598382, 0, 0, 0, 1, 1,
-0.8251249, 0.3079763, -0.01414751, 0, 0, 0, 1, 1,
-0.8219459, 0.2709928, -2.809132, 0, 0, 0, 1, 1,
-0.8135903, -1.997307, -2.486311, 1, 1, 1, 1, 1,
-0.8075211, 0.3247488, -0.7139276, 1, 1, 1, 1, 1,
-0.8069986, -2.186185, -2.700096, 1, 1, 1, 1, 1,
-0.8021921, 1.101165, -1.340041, 1, 1, 1, 1, 1,
-0.7989057, -0.3950256, -1.58248, 1, 1, 1, 1, 1,
-0.7963882, -0.5225528, -0.7919569, 1, 1, 1, 1, 1,
-0.7961246, -0.4434716, -2.310021, 1, 1, 1, 1, 1,
-0.7878438, 0.4490241, -3.578658, 1, 1, 1, 1, 1,
-0.7855973, -1.494815, -2.172157, 1, 1, 1, 1, 1,
-0.784447, 0.0193765, -2.024003, 1, 1, 1, 1, 1,
-0.7832643, -1.055763, -3.793185, 1, 1, 1, 1, 1,
-0.7824673, -1.765684, -1.610796, 1, 1, 1, 1, 1,
-0.7792558, 0.1703487, -1.256047, 1, 1, 1, 1, 1,
-0.775963, -0.05211424, -1.421814, 1, 1, 1, 1, 1,
-0.7732323, -0.2582106, -1.605882, 1, 1, 1, 1, 1,
-0.7724122, -1.887262, -2.496881, 0, 0, 1, 1, 1,
-0.76947, 1.162744, -0.5784143, 1, 0, 0, 1, 1,
-0.7660386, 0.8337758, -1.714783, 1, 0, 0, 1, 1,
-0.7633367, 0.1344973, -2.102411, 1, 0, 0, 1, 1,
-0.7610255, -1.146488, -2.565808, 1, 0, 0, 1, 1,
-0.7566251, 1.734359, -0.4735388, 1, 0, 0, 1, 1,
-0.7475102, -0.7509589, -2.734229, 0, 0, 0, 1, 1,
-0.7467193, 1.226548, -1.931629, 0, 0, 0, 1, 1,
-0.7460106, -1.005464, -2.556381, 0, 0, 0, 1, 1,
-0.7459016, -0.2435998, -3.508901, 0, 0, 0, 1, 1,
-0.742754, -0.7553887, -1.276492, 0, 0, 0, 1, 1,
-0.7396373, -1.421956, -2.326123, 0, 0, 0, 1, 1,
-0.7383841, 0.05408309, 0.6853872, 0, 0, 0, 1, 1,
-0.7357064, -0.06365037, -2.402275, 1, 1, 1, 1, 1,
-0.7277625, 1.221618, 0.1378108, 1, 1, 1, 1, 1,
-0.7186443, -1.564151, -2.824646, 1, 1, 1, 1, 1,
-0.7122124, -0.9810396, -2.446298, 1, 1, 1, 1, 1,
-0.7099584, 1.712928, 0.08987028, 1, 1, 1, 1, 1,
-0.708362, 1.441925, -0.7459042, 1, 1, 1, 1, 1,
-0.7041923, -0.8029823, -2.202374, 1, 1, 1, 1, 1,
-0.6993552, -2.251249, -3.243348, 1, 1, 1, 1, 1,
-0.6992147, -0.9300655, -2.501036, 1, 1, 1, 1, 1,
-0.6967852, 0.3912106, 0.9269325, 1, 1, 1, 1, 1,
-0.6964257, 0.7773047, -1.741829, 1, 1, 1, 1, 1,
-0.6895038, 0.2020808, 0.5776002, 1, 1, 1, 1, 1,
-0.6894766, -0.628467, -1.315009, 1, 1, 1, 1, 1,
-0.6874589, 0.1170562, -2.03159, 1, 1, 1, 1, 1,
-0.6828403, -1.750162, -2.36942, 1, 1, 1, 1, 1,
-0.6801878, -1.948913, -1.666095, 0, 0, 1, 1, 1,
-0.6637, 2.002729, -0.3965553, 1, 0, 0, 1, 1,
-0.6626652, 0.9353569, 0.4666405, 1, 0, 0, 1, 1,
-0.6601287, 1.007447, -0.8427793, 1, 0, 0, 1, 1,
-0.6564314, -0.433448, -1.37846, 1, 0, 0, 1, 1,
-0.6510943, 0.003707106, -0.6792161, 1, 0, 0, 1, 1,
-0.6472617, 0.86649, -0.4880324, 0, 0, 0, 1, 1,
-0.6433845, 0.7271407, -1.680154, 0, 0, 0, 1, 1,
-0.6420323, 1.096647, -0.5796667, 0, 0, 0, 1, 1,
-0.6419644, 0.6434514, -0.4046754, 0, 0, 0, 1, 1,
-0.6417625, -1.955791, -2.422025, 0, 0, 0, 1, 1,
-0.6400624, -0.6882635, -1.676562, 0, 0, 0, 1, 1,
-0.6374666, 0.1442669, -3.232056, 0, 0, 0, 1, 1,
-0.635949, -0.1591388, -0.4385303, 1, 1, 1, 1, 1,
-0.6322957, 0.2237341, -1.715491, 1, 1, 1, 1, 1,
-0.6262692, -0.1184903, -3.130026, 1, 1, 1, 1, 1,
-0.622597, -2.164869, -2.981632, 1, 1, 1, 1, 1,
-0.618558, 0.07512966, -0.8691679, 1, 1, 1, 1, 1,
-0.6180847, 0.2330784, -0.6881584, 1, 1, 1, 1, 1,
-0.6165468, 0.4159034, -0.277394, 1, 1, 1, 1, 1,
-0.6148333, -0.02769014, -0.4605514, 1, 1, 1, 1, 1,
-0.6117669, -0.3215676, -2.283856, 1, 1, 1, 1, 1,
-0.6117212, 0.8256651, -0.9243986, 1, 1, 1, 1, 1,
-0.6095738, -0.6810625, -1.878619, 1, 1, 1, 1, 1,
-0.6033094, -1.318168, -2.463196, 1, 1, 1, 1, 1,
-0.602213, -0.8033238, -3.556042, 1, 1, 1, 1, 1,
-0.600461, 1.293932, 0.2782071, 1, 1, 1, 1, 1,
-0.5971924, -1.045437, -2.000141, 1, 1, 1, 1, 1,
-0.5881483, 0.4173945, -0.4075856, 0, 0, 1, 1, 1,
-0.5881326, 0.7846515, -0.1797035, 1, 0, 0, 1, 1,
-0.5847367, 0.7946495, -0.9244571, 1, 0, 0, 1, 1,
-0.5842716, -0.3930303, -2.788299, 1, 0, 0, 1, 1,
-0.5838311, 0.8498423, -1.908395, 1, 0, 0, 1, 1,
-0.5778215, 1.215518, 0.09324428, 1, 0, 0, 1, 1,
-0.5759451, 1.442408, 0.8892486, 0, 0, 0, 1, 1,
-0.5747631, 0.3836019, -0.2653289, 0, 0, 0, 1, 1,
-0.5736833, 0.1814946, -2.18132, 0, 0, 0, 1, 1,
-0.5646694, 0.4699299, -2.0842, 0, 0, 0, 1, 1,
-0.5628436, -1.609299, -2.659216, 0, 0, 0, 1, 1,
-0.5619743, -0.9340471, -1.809762, 0, 0, 0, 1, 1,
-0.5591401, 0.5275964, -1.433082, 0, 0, 0, 1, 1,
-0.5589767, -1.644537, -0.6175557, 1, 1, 1, 1, 1,
-0.5540558, -0.03314783, -2.6624, 1, 1, 1, 1, 1,
-0.5535932, 1.032642, -1.079971, 1, 1, 1, 1, 1,
-0.5524324, 1.213817, -0.7789776, 1, 1, 1, 1, 1,
-0.5493212, -1.119283, -1.419007, 1, 1, 1, 1, 1,
-0.5485392, -1.213449, -4.171255, 1, 1, 1, 1, 1,
-0.5456436, 0.3646576, -0.1509202, 1, 1, 1, 1, 1,
-0.5453556, 0.3821888, -1.410484, 1, 1, 1, 1, 1,
-0.5402907, 0.1925476, -2.35925, 1, 1, 1, 1, 1,
-0.5386046, 3.545999, -1.383202, 1, 1, 1, 1, 1,
-0.534767, -0.9794311, -2.87241, 1, 1, 1, 1, 1,
-0.5344449, -1.3366, -0.01757127, 1, 1, 1, 1, 1,
-0.5314381, 0.554746, -1.16203, 1, 1, 1, 1, 1,
-0.5264778, -1.368701, -1.043234, 1, 1, 1, 1, 1,
-0.5252581, -0.2708883, -0.6458836, 1, 1, 1, 1, 1,
-0.5176721, 1.061797, 0.3848895, 0, 0, 1, 1, 1,
-0.5050154, -0.6853265, -3.584857, 1, 0, 0, 1, 1,
-0.4997851, 0.4031141, -1.079496, 1, 0, 0, 1, 1,
-0.4945548, -1.671343, -2.296129, 1, 0, 0, 1, 1,
-0.4941797, 0.4398803, 0.2935719, 1, 0, 0, 1, 1,
-0.4941675, -1.100398, -2.224274, 1, 0, 0, 1, 1,
-0.4934804, -0.4893801, -0.820782, 0, 0, 0, 1, 1,
-0.4856219, -2.246262, -3.067932, 0, 0, 0, 1, 1,
-0.4832429, -0.2563017, -3.176822, 0, 0, 0, 1, 1,
-0.4813879, 1.144378, 0.4621705, 0, 0, 0, 1, 1,
-0.4809944, 1.212166, -2.085236, 0, 0, 0, 1, 1,
-0.4798526, -1.556547, -3.772403, 0, 0, 0, 1, 1,
-0.4752248, 1.085921, -1.717397, 0, 0, 0, 1, 1,
-0.4711356, -1.455891, -2.180853, 1, 1, 1, 1, 1,
-0.4710831, -2.950631, -2.059574, 1, 1, 1, 1, 1,
-0.4706622, 0.7324485, 0.02143981, 1, 1, 1, 1, 1,
-0.4694014, -0.6061597, -3.339186, 1, 1, 1, 1, 1,
-0.4689743, -1.179782, -4.122352, 1, 1, 1, 1, 1,
-0.4623299, 0.5913717, 0.07508931, 1, 1, 1, 1, 1,
-0.4613087, 0.2431872, -1.095512, 1, 1, 1, 1, 1,
-0.4597221, -0.2624, -1.76464, 1, 1, 1, 1, 1,
-0.4556603, -1.844374, -3.269776, 1, 1, 1, 1, 1,
-0.4538726, 1.792476, -0.9317107, 1, 1, 1, 1, 1,
-0.4538155, 0.02277631, -2.21757, 1, 1, 1, 1, 1,
-0.4504907, 2.075729, 0.3299536, 1, 1, 1, 1, 1,
-0.4417149, 0.3663632, 0.2397807, 1, 1, 1, 1, 1,
-0.4403109, 0.3867929, -1.229768, 1, 1, 1, 1, 1,
-0.4403031, -0.993543, -3.192937, 1, 1, 1, 1, 1,
-0.4387923, -0.887658, -1.133741, 0, 0, 1, 1, 1,
-0.4378466, 1.833291, 0.2988735, 1, 0, 0, 1, 1,
-0.4333395, 0.5952261, -0.4389996, 1, 0, 0, 1, 1,
-0.4297081, 0.4974332, -1.784703, 1, 0, 0, 1, 1,
-0.4280365, 0.405242, -1.381829, 1, 0, 0, 1, 1,
-0.4271552, -1.758497, -3.026511, 1, 0, 0, 1, 1,
-0.425044, -0.2499775, -1.232342, 0, 0, 0, 1, 1,
-0.4250098, 0.8111222, 0.1617279, 0, 0, 0, 1, 1,
-0.4247208, 0.2678607, -1.531808, 0, 0, 0, 1, 1,
-0.4237888, -0.2927732, -2.779535, 0, 0, 0, 1, 1,
-0.421546, -0.666695, -1.861382, 0, 0, 0, 1, 1,
-0.4184397, -0.581688, -1.403186, 0, 0, 0, 1, 1,
-0.4166113, 1.479425, -2.811084, 0, 0, 0, 1, 1,
-0.4161599, -0.3243666, -2.874707, 1, 1, 1, 1, 1,
-0.4152201, -1.463317, -1.292594, 1, 1, 1, 1, 1,
-0.4149958, -2.695435, -1.892325, 1, 1, 1, 1, 1,
-0.4092673, 1.330208, -0.6666548, 1, 1, 1, 1, 1,
-0.4085741, -1.066805, -3.050389, 1, 1, 1, 1, 1,
-0.4049811, -1.082111, -2.563709, 1, 1, 1, 1, 1,
-0.4048076, -0.4675547, -4.582891, 1, 1, 1, 1, 1,
-0.4023717, -0.4878407, -4.419835, 1, 1, 1, 1, 1,
-0.4002596, -0.613969, -2.682681, 1, 1, 1, 1, 1,
-0.3968857, -0.3350535, -1.967067, 1, 1, 1, 1, 1,
-0.3942029, -1.765627, -2.21664, 1, 1, 1, 1, 1,
-0.393029, -0.2447369, -1.529878, 1, 1, 1, 1, 1,
-0.391757, 1.724653, -0.6361134, 1, 1, 1, 1, 1,
-0.3888632, -1.901942, -2.391912, 1, 1, 1, 1, 1,
-0.386751, 0.9164912, -1.159474, 1, 1, 1, 1, 1,
-0.3851406, -0.9392509, -1.080505, 0, 0, 1, 1, 1,
-0.3819788, 1.376346, -1.12603, 1, 0, 0, 1, 1,
-0.3765935, 0.3802654, -1.644361, 1, 0, 0, 1, 1,
-0.3764572, -1.178882, -2.977005, 1, 0, 0, 1, 1,
-0.3729157, -0.7843369, -2.353064, 1, 0, 0, 1, 1,
-0.3724483, -0.4112048, -3.488136, 1, 0, 0, 1, 1,
-0.3703951, 0.4963063, -2.771101, 0, 0, 0, 1, 1,
-0.3700081, -1.438991, -3.080361, 0, 0, 0, 1, 1,
-0.3678887, -1.862945, -1.535809, 0, 0, 0, 1, 1,
-0.3673644, -0.3099315, -3.993164, 0, 0, 0, 1, 1,
-0.3648647, 0.8889253, -2.050246, 0, 0, 0, 1, 1,
-0.3586898, 0.2359751, -0.7950035, 0, 0, 0, 1, 1,
-0.3582393, -0.01174101, -2.741724, 0, 0, 0, 1, 1,
-0.3499674, -1.884195, -3.113327, 1, 1, 1, 1, 1,
-0.3490598, 0.5124004, -1.128996, 1, 1, 1, 1, 1,
-0.3472125, 0.7144907, -0.7563698, 1, 1, 1, 1, 1,
-0.346185, 0.272425, -0.4993642, 1, 1, 1, 1, 1,
-0.3418715, 0.2443876, 0.03280028, 1, 1, 1, 1, 1,
-0.3413422, -0.08173777, -1.57195, 1, 1, 1, 1, 1,
-0.3377384, 0.5578386, -1.199416, 1, 1, 1, 1, 1,
-0.3375762, 0.9147549, 1.990765, 1, 1, 1, 1, 1,
-0.3345164, -0.3535312, -1.582527, 1, 1, 1, 1, 1,
-0.3331648, -0.8120521, -3.264807, 1, 1, 1, 1, 1,
-0.3313527, 0.3506213, -0.225157, 1, 1, 1, 1, 1,
-0.3191178, -0.6206568, -2.988253, 1, 1, 1, 1, 1,
-0.3180407, 0.9024264, -0.9959131, 1, 1, 1, 1, 1,
-0.3176344, 0.1472439, -1.65639, 1, 1, 1, 1, 1,
-0.3176166, 0.8536224, -0.7261745, 1, 1, 1, 1, 1,
-0.3158484, -1.618502, -3.193857, 0, 0, 1, 1, 1,
-0.3154045, -0.4123633, -2.907414, 1, 0, 0, 1, 1,
-0.3142338, 0.2651351, -1.299759, 1, 0, 0, 1, 1,
-0.3128332, 1.111199, -0.03001446, 1, 0, 0, 1, 1,
-0.3097614, 1.25105, -0.5209135, 1, 0, 0, 1, 1,
-0.3084168, 0.4326716, -1.729837, 1, 0, 0, 1, 1,
-0.3072219, 0.9218239, -0.1186999, 0, 0, 0, 1, 1,
-0.3018987, 0.2728051, -1.155434, 0, 0, 0, 1, 1,
-0.3000267, 0.2442499, 0.2243312, 0, 0, 0, 1, 1,
-0.2991758, 0.7646366, -1.266283, 0, 0, 0, 1, 1,
-0.2985105, -2.23777, -2.281433, 0, 0, 0, 1, 1,
-0.2952699, 0.7325585, 0.660674, 0, 0, 0, 1, 1,
-0.2902116, -0.2888162, -1.637411, 0, 0, 0, 1, 1,
-0.2897159, -0.5930791, -3.015486, 1, 1, 1, 1, 1,
-0.2878008, 0.7822135, -0.1305264, 1, 1, 1, 1, 1,
-0.2851045, -1.346975, -3.885232, 1, 1, 1, 1, 1,
-0.2849936, 1.217427, -0.9988167, 1, 1, 1, 1, 1,
-0.2836799, -1.469829, -4.158182, 1, 1, 1, 1, 1,
-0.2688487, -0.4274734, -3.524901, 1, 1, 1, 1, 1,
-0.2660193, 0.3225416, 0.1926249, 1, 1, 1, 1, 1,
-0.2636336, -0.02120944, -3.561532, 1, 1, 1, 1, 1,
-0.2624186, -0.4040104, -1.870837, 1, 1, 1, 1, 1,
-0.2531328, -0.02133752, -1.072601, 1, 1, 1, 1, 1,
-0.2502871, 1.211371, 0.9802098, 1, 1, 1, 1, 1,
-0.2499524, -2.144422, -0.957013, 1, 1, 1, 1, 1,
-0.2416999, 0.7093141, -0.1609794, 1, 1, 1, 1, 1,
-0.2374716, -0.4663693, -4.028224, 1, 1, 1, 1, 1,
-0.2330444, -0.6830966, -0.3509777, 1, 1, 1, 1, 1,
-0.2302764, -0.5082191, -3.323037, 0, 0, 1, 1, 1,
-0.2271549, 0.2313509, -0.4813271, 1, 0, 0, 1, 1,
-0.226335, -0.6737617, -2.745528, 1, 0, 0, 1, 1,
-0.2208831, 0.4196273, 1.247735, 1, 0, 0, 1, 1,
-0.2193301, -0.8453141, -3.83136, 1, 0, 0, 1, 1,
-0.2080747, 0.8389774, -1.591818, 1, 0, 0, 1, 1,
-0.2058121, -0.005974075, -0.4307415, 0, 0, 0, 1, 1,
-0.2056829, -0.3285967, -0.5101872, 0, 0, 0, 1, 1,
-0.2050193, 0.9658915, -0.4224908, 0, 0, 0, 1, 1,
-0.2049136, -0.5183032, -3.330723, 0, 0, 0, 1, 1,
-0.1993084, 0.5369188, -0.3621475, 0, 0, 0, 1, 1,
-0.1950114, 0.001239948, -2.276124, 0, 0, 0, 1, 1,
-0.192084, -0.2415503, -2.700567, 0, 0, 0, 1, 1,
-0.1867377, 1.935612, -0.2828797, 1, 1, 1, 1, 1,
-0.1855984, 1.033964, -1.628236, 1, 1, 1, 1, 1,
-0.1822022, 1.109382, 0.7815756, 1, 1, 1, 1, 1,
-0.1742857, 0.4312726, 0.2562462, 1, 1, 1, 1, 1,
-0.1722426, -2.626864, -2.522144, 1, 1, 1, 1, 1,
-0.167742, -0.8196373, -3.640327, 1, 1, 1, 1, 1,
-0.1641489, 0.696924, -2.562682, 1, 1, 1, 1, 1,
-0.1641487, 1.162426, -0.6711472, 1, 1, 1, 1, 1,
-0.1635998, 1.066424, -0.7009002, 1, 1, 1, 1, 1,
-0.1606097, -1.200403, -2.371465, 1, 1, 1, 1, 1,
-0.159862, 1.438026, -1.471637, 1, 1, 1, 1, 1,
-0.1568721, -1.752157, -3.547342, 1, 1, 1, 1, 1,
-0.1549395, 1.07106, 0.7071314, 1, 1, 1, 1, 1,
-0.1535803, -0.1748034, -3.254736, 1, 1, 1, 1, 1,
-0.1527504, -2.813483, -2.728585, 1, 1, 1, 1, 1,
-0.1503459, 3.166709, -0.8520087, 0, 0, 1, 1, 1,
-0.1482091, 0.8354298, -1.334794, 1, 0, 0, 1, 1,
-0.1441306, 0.3896414, 0.4974017, 1, 0, 0, 1, 1,
-0.1377338, 0.9894524, 1.062134, 1, 0, 0, 1, 1,
-0.1358688, -1.316721, -2.130558, 1, 0, 0, 1, 1,
-0.1319735, 0.6695221, -0.7416944, 1, 0, 0, 1, 1,
-0.1294391, 0.05425929, -2.156058, 0, 0, 0, 1, 1,
-0.1276624, -0.0345295, -0.3605575, 0, 0, 0, 1, 1,
-0.1268821, 1.427515, -2.542285, 0, 0, 0, 1, 1,
-0.1238038, 0.6258522, 0.2990933, 0, 0, 0, 1, 1,
-0.1233487, -0.3898747, -4.054751, 0, 0, 0, 1, 1,
-0.1224823, -0.4414426, -3.057193, 0, 0, 0, 1, 1,
-0.1114294, -0.9225559, -4.325595, 0, 0, 0, 1, 1,
-0.111203, -0.2789243, -2.355779, 1, 1, 1, 1, 1,
-0.1088882, -2.03032, -2.306725, 1, 1, 1, 1, 1,
-0.1029039, -0.9829702, -3.035091, 1, 1, 1, 1, 1,
-0.1020621, 1.421906, -1.074754, 1, 1, 1, 1, 1,
-0.1016532, -0.6103631, -3.971228, 1, 1, 1, 1, 1,
-0.1014914, -0.7757685, -2.830967, 1, 1, 1, 1, 1,
-0.1008258, -1.05111, -5.204362, 1, 1, 1, 1, 1,
-0.1002894, 0.2253007, -0.01487967, 1, 1, 1, 1, 1,
-0.09964612, -0.479929, -3.281723, 1, 1, 1, 1, 1,
-0.09872254, 0.3166712, 2.240174, 1, 1, 1, 1, 1,
-0.09776334, -0.888965, -2.476081, 1, 1, 1, 1, 1,
-0.08808395, -1.035895, -4.913672, 1, 1, 1, 1, 1,
-0.08500806, 0.6000118, -0.8178086, 1, 1, 1, 1, 1,
-0.08420097, 0.6062652, 0.4503386, 1, 1, 1, 1, 1,
-0.08402283, 0.1206134, -0.2508266, 1, 1, 1, 1, 1,
-0.0741506, 1.13359, -1.1631, 0, 0, 1, 1, 1,
-0.07178355, -0.9146895, -2.927062, 1, 0, 0, 1, 1,
-0.07171665, 0.22234, -0.4192066, 1, 0, 0, 1, 1,
-0.07048932, -0.511888, -4.059245, 1, 0, 0, 1, 1,
-0.06951847, 0.4642099, -1.569695, 1, 0, 0, 1, 1,
-0.06620778, -1.415403, -1.897018, 1, 0, 0, 1, 1,
-0.06597462, 0.07979944, -2.855394, 0, 0, 0, 1, 1,
-0.05874661, 0.4229564, -0.4793844, 0, 0, 0, 1, 1,
-0.05779104, 1.897237, -0.3519684, 0, 0, 0, 1, 1,
-0.05707297, -0.3996324, -2.472013, 0, 0, 0, 1, 1,
-0.05284571, 0.4393287, 1.124941, 0, 0, 0, 1, 1,
-0.04964661, -0.9603662, -2.899854, 0, 0, 0, 1, 1,
-0.0479225, 0.7803448, 0.8255169, 0, 0, 0, 1, 1,
-0.04737076, 1.396858, 0.2847434, 1, 1, 1, 1, 1,
-0.04670229, 2.475431, -0.7053689, 1, 1, 1, 1, 1,
-0.04567507, 2.629237, 0.1996285, 1, 1, 1, 1, 1,
-0.04413411, 0.2328995, 0.5829152, 1, 1, 1, 1, 1,
-0.04028657, 0.6699287, -1.786031, 1, 1, 1, 1, 1,
-0.03980524, 1.652143, -0.7140789, 1, 1, 1, 1, 1,
-0.03217224, 0.3982281, -1.510546, 1, 1, 1, 1, 1,
-0.02548652, 2.346972, 0.5450962, 1, 1, 1, 1, 1,
-0.02483781, 0.02665848, 0.3348066, 1, 1, 1, 1, 1,
-0.02067935, -0.7348516, -2.860417, 1, 1, 1, 1, 1,
-0.01955619, 0.04808973, 0.132088, 1, 1, 1, 1, 1,
-0.01948349, -0.1258952, -2.82923, 1, 1, 1, 1, 1,
-0.01890344, -1.085669, -3.002641, 1, 1, 1, 1, 1,
-0.01786143, -0.9599416, -3.501034, 1, 1, 1, 1, 1,
-0.01078213, -0.1058785, -3.351713, 1, 1, 1, 1, 1,
-0.007081053, -0.3794242, -2.950376, 0, 0, 1, 1, 1,
-0.007012012, 0.9777613, -0.1857614, 1, 0, 0, 1, 1,
-0.00594702, 0.5608885, 0.5719154, 1, 0, 0, 1, 1,
-0.005037061, 1.038375, 0.4569159, 1, 0, 0, 1, 1,
-0.002045658, -2.265977, -3.158289, 1, 0, 0, 1, 1,
0.002121878, -0.40479, 3.901137, 1, 0, 0, 1, 1,
0.00503441, 0.6683745, 0.5979404, 0, 0, 0, 1, 1,
0.007531079, -0.508058, 4.884838, 0, 0, 0, 1, 1,
0.01239113, -0.5672596, 2.812863, 0, 0, 0, 1, 1,
0.01545173, 0.9723036, -1.166865, 0, 0, 0, 1, 1,
0.01759737, -0.8462722, 4.207125, 0, 0, 0, 1, 1,
0.01898173, 0.4340913, 1.154857, 0, 0, 0, 1, 1,
0.01959813, -0.1163042, 3.283199, 0, 0, 0, 1, 1,
0.021305, 0.4710639, 0.828687, 1, 1, 1, 1, 1,
0.02195898, 0.7427853, 0.1557486, 1, 1, 1, 1, 1,
0.02542396, -0.944243, 1.616255, 1, 1, 1, 1, 1,
0.02610259, 0.5627737, 1.203003, 1, 1, 1, 1, 1,
0.02685026, -0.3855823, 2.837313, 1, 1, 1, 1, 1,
0.02985038, -1.882084, 2.50857, 1, 1, 1, 1, 1,
0.03994681, -0.2949301, 3.285308, 1, 1, 1, 1, 1,
0.05525628, -1.704764, 3.35635, 1, 1, 1, 1, 1,
0.05645882, -1.592534, 4.588964, 1, 1, 1, 1, 1,
0.05755811, 0.1328151, 1.154499, 1, 1, 1, 1, 1,
0.05843915, -2.380732, 2.142371, 1, 1, 1, 1, 1,
0.06145123, 1.179767, 1.682829, 1, 1, 1, 1, 1,
0.06587992, 0.1049436, -0.4125944, 1, 1, 1, 1, 1,
0.06633579, 0.07715853, 0.472666, 1, 1, 1, 1, 1,
0.06700467, 0.3055806, -1.193399, 1, 1, 1, 1, 1,
0.0683093, 0.7712427, -1.14958, 0, 0, 1, 1, 1,
0.06840453, 1.231033, -0.2548725, 1, 0, 0, 1, 1,
0.06847025, 1.140334, -0.8125375, 1, 0, 0, 1, 1,
0.06933875, -1.268036, 3.597509, 1, 0, 0, 1, 1,
0.07130749, -0.4578533, 2.708484, 1, 0, 0, 1, 1,
0.07539833, -0.5221542, 3.719938, 1, 0, 0, 1, 1,
0.07597579, 1.391009, -1.144604, 0, 0, 0, 1, 1,
0.07889833, 0.4930446, 1.433522, 0, 0, 0, 1, 1,
0.07939003, 0.6913583, -1.542325, 0, 0, 0, 1, 1,
0.08135839, 0.8282918, -1.090714, 0, 0, 0, 1, 1,
0.08242864, 0.6641244, 0.4673542, 0, 0, 0, 1, 1,
0.08302677, 0.260884, 0.1226432, 0, 0, 0, 1, 1,
0.08308097, 1.535693, 0.7705773, 0, 0, 0, 1, 1,
0.09275082, -1.707554, 4.614589, 1, 1, 1, 1, 1,
0.09293267, -1.024204, 2.745322, 1, 1, 1, 1, 1,
0.09588453, -0.05649863, 1.069554, 1, 1, 1, 1, 1,
0.1002491, -0.06906476, 0.8443733, 1, 1, 1, 1, 1,
0.1056907, -0.0333407, -0.1877694, 1, 1, 1, 1, 1,
0.1057219, 0.3235875, -1.7594, 1, 1, 1, 1, 1,
0.1065709, 0.4917439, 0.7064753, 1, 1, 1, 1, 1,
0.1068034, -0.8105522, 5.263887, 1, 1, 1, 1, 1,
0.1094432, -1.750232, 2.520607, 1, 1, 1, 1, 1,
0.1113447, 1.263457, 1.110328, 1, 1, 1, 1, 1,
0.1122304, 0.8659927, -1.3519, 1, 1, 1, 1, 1,
0.1140523, 0.773091, -0.3350831, 1, 1, 1, 1, 1,
0.1167722, -1.092273, 0.7537079, 1, 1, 1, 1, 1,
0.1169379, 1.184297, -0.1092615, 1, 1, 1, 1, 1,
0.1170648, 0.3487655, 0.2630557, 1, 1, 1, 1, 1,
0.1179343, 0.7312398, -0.9632712, 0, 0, 1, 1, 1,
0.1184944, 0.1332754, 1.648816, 1, 0, 0, 1, 1,
0.1236113, 1.0105, 0.3913451, 1, 0, 0, 1, 1,
0.1263901, -1.068701, 4.474658, 1, 0, 0, 1, 1,
0.1265622, -0.3760011, 1.999644, 1, 0, 0, 1, 1,
0.1273113, 2.137697, 0.2856391, 1, 0, 0, 1, 1,
0.1319327, -0.8698314, 3.253441, 0, 0, 0, 1, 1,
0.1358505, -1.214465, 1.842558, 0, 0, 0, 1, 1,
0.1381778, 0.04769263, 3.360246, 0, 0, 0, 1, 1,
0.1394192, 1.062074, -1.511699, 0, 0, 0, 1, 1,
0.140423, -0.1504643, 0.8435973, 0, 0, 0, 1, 1,
0.1415604, -1.736059, 3.933252, 0, 0, 0, 1, 1,
0.1437306, -0.2392263, 2.093878, 0, 0, 0, 1, 1,
0.146625, 0.7113345, -0.4849763, 1, 1, 1, 1, 1,
0.1477882, -1.424688, 3.291692, 1, 1, 1, 1, 1,
0.1526305, -0.1023116, 4.372038, 1, 1, 1, 1, 1,
0.1621861, 0.2609258, -0.6538851, 1, 1, 1, 1, 1,
0.1668001, 0.4624294, 1.48933, 1, 1, 1, 1, 1,
0.1686652, -0.8302081, 2.631962, 1, 1, 1, 1, 1,
0.1712823, -1.215384, 2.876835, 1, 1, 1, 1, 1,
0.1751606, 1.037122, 0.5577762, 1, 1, 1, 1, 1,
0.1763499, 0.2444495, 0.201599, 1, 1, 1, 1, 1,
0.183977, -0.4120456, 2.431533, 1, 1, 1, 1, 1,
0.1884403, -1.762184, 3.861997, 1, 1, 1, 1, 1,
0.19235, -1.223532, 3.862619, 1, 1, 1, 1, 1,
0.1938756, -0.7304801, 1.823906, 1, 1, 1, 1, 1,
0.1942989, 1.379213, 1.978145, 1, 1, 1, 1, 1,
0.1962152, 1.741316, -1.040823, 1, 1, 1, 1, 1,
0.1991191, 0.8859602, 0.426367, 0, 0, 1, 1, 1,
0.2007123, 0.6996186, 1.05691, 1, 0, 0, 1, 1,
0.2038136, 0.7220193, -0.1739223, 1, 0, 0, 1, 1,
0.2046936, -1.98917, 3.269868, 1, 0, 0, 1, 1,
0.2048817, 2.030631, -1.262855, 1, 0, 0, 1, 1,
0.2083592, -0.3717911, 2.31685, 1, 0, 0, 1, 1,
0.2095663, 1.183769, 1.058627, 0, 0, 0, 1, 1,
0.217988, -0.2244481, 1.516931, 0, 0, 0, 1, 1,
0.2192745, -0.9721751, 4.737798, 0, 0, 0, 1, 1,
0.2242702, 1.570386, -0.04786816, 0, 0, 0, 1, 1,
0.2260101, 0.02852311, 0.4830126, 0, 0, 0, 1, 1,
0.2267401, -0.9419653, 3.146186, 0, 0, 0, 1, 1,
0.2269296, -0.2034105, 1.172617, 0, 0, 0, 1, 1,
0.227952, -0.9123874, 3.046073, 1, 1, 1, 1, 1,
0.2380547, 0.5596127, 1.091439, 1, 1, 1, 1, 1,
0.2568662, -0.372424, 2.782199, 1, 1, 1, 1, 1,
0.2595159, -0.007861625, 1.219226, 1, 1, 1, 1, 1,
0.2604303, -1.602389, 3.201495, 1, 1, 1, 1, 1,
0.2606811, 0.3569736, 0.003554672, 1, 1, 1, 1, 1,
0.2666401, -0.4170028, 2.630309, 1, 1, 1, 1, 1,
0.2688588, 0.6587108, -0.07047376, 1, 1, 1, 1, 1,
0.2706275, -1.559053, 3.621283, 1, 1, 1, 1, 1,
0.2727227, 1.013678, -1.625696, 1, 1, 1, 1, 1,
0.2734516, -0.5103137, 4.969059, 1, 1, 1, 1, 1,
0.2755473, 0.4375021, 1.09701, 1, 1, 1, 1, 1,
0.2765766, 1.203319, 0.9790157, 1, 1, 1, 1, 1,
0.2787947, 0.1377629, 0.1146171, 1, 1, 1, 1, 1,
0.2816292, -1.26075, 0.5720525, 1, 1, 1, 1, 1,
0.2850818, 0.6312736, 1.113883, 0, 0, 1, 1, 1,
0.2852292, -1.449342, 2.433893, 1, 0, 0, 1, 1,
0.2923243, -0.4290659, 1.359107, 1, 0, 0, 1, 1,
0.2950836, -0.7628067, 1.724377, 1, 0, 0, 1, 1,
0.298263, -0.2725712, 2.236277, 1, 0, 0, 1, 1,
0.2993893, -0.7555081, 3.517223, 1, 0, 0, 1, 1,
0.3025406, -0.3909569, 3.520014, 0, 0, 0, 1, 1,
0.3052656, 0.8681952, -0.1187518, 0, 0, 0, 1, 1,
0.3128938, 2.380624, 0.6571991, 0, 0, 0, 1, 1,
0.3141885, -1.451402, 3.736882, 0, 0, 0, 1, 1,
0.3273255, -0.3499155, 3.902611, 0, 0, 0, 1, 1,
0.3293736, 1.013102, -0.6640423, 0, 0, 0, 1, 1,
0.332337, 0.3267211, 1.138757, 0, 0, 0, 1, 1,
0.3342758, 0.2114254, 0.5706854, 1, 1, 1, 1, 1,
0.3424591, -0.6997938, 2.620893, 1, 1, 1, 1, 1,
0.3445777, -1.284374, 2.047279, 1, 1, 1, 1, 1,
0.3467257, -0.8193136, 0.6833991, 1, 1, 1, 1, 1,
0.3478985, 0.1195036, 4.011584, 1, 1, 1, 1, 1,
0.3486692, -0.1118526, 0.9993953, 1, 1, 1, 1, 1,
0.3491594, 1.202671, -1.369229, 1, 1, 1, 1, 1,
0.3496882, 0.6269846, 1.178536, 1, 1, 1, 1, 1,
0.353539, -1.179727, 3.936644, 1, 1, 1, 1, 1,
0.3539422, -0.3628691, 2.135105, 1, 1, 1, 1, 1,
0.3542244, -0.7005519, 1.986814, 1, 1, 1, 1, 1,
0.356283, -0.1515391, 3.14005, 1, 1, 1, 1, 1,
0.3574216, 1.725708, -2.082399, 1, 1, 1, 1, 1,
0.3579517, -1.173641, 2.589325, 1, 1, 1, 1, 1,
0.3596463, -0.9131892, 2.774177, 1, 1, 1, 1, 1,
0.3599252, 0.1548458, 1.370127, 0, 0, 1, 1, 1,
0.3617807, -0.5286874, 3.02527, 1, 0, 0, 1, 1,
0.3618244, 0.8489064, -0.2967658, 1, 0, 0, 1, 1,
0.3664232, 0.3615516, -0.1159009, 1, 0, 0, 1, 1,
0.3709977, -0.3536687, 2.585125, 1, 0, 0, 1, 1,
0.3730354, 0.3822719, 0.06457822, 1, 0, 0, 1, 1,
0.3737243, -0.6908838, 2.390991, 0, 0, 0, 1, 1,
0.3738441, 1.184383, 1.052671, 0, 0, 0, 1, 1,
0.3745727, 0.6926559, -0.147703, 0, 0, 0, 1, 1,
0.3749908, 0.9665735, -0.6005538, 0, 0, 0, 1, 1,
0.3764657, -0.8469018, 2.462885, 0, 0, 0, 1, 1,
0.3796893, 0.2125247, 2.4365, 0, 0, 0, 1, 1,
0.3859418, -0.6265731, 2.713948, 0, 0, 0, 1, 1,
0.3872545, 0.4008618, -0.4947459, 1, 1, 1, 1, 1,
0.3874148, -0.216647, 2.61578, 1, 1, 1, 1, 1,
0.389638, 2.301382, 0.3540373, 1, 1, 1, 1, 1,
0.3900426, -0.002766677, 2.905495, 1, 1, 1, 1, 1,
0.3915297, 0.9681032, -0.4471056, 1, 1, 1, 1, 1,
0.3974268, 1.428061, 0.4922485, 1, 1, 1, 1, 1,
0.3985092, 0.7540799, 0.7093953, 1, 1, 1, 1, 1,
0.4000031, -1.357676, 4.245234, 1, 1, 1, 1, 1,
0.4031664, 0.1140756, 1.555882, 1, 1, 1, 1, 1,
0.4035028, -1.439433, 2.395782, 1, 1, 1, 1, 1,
0.4047422, 1.185915, -1.068241, 1, 1, 1, 1, 1,
0.4053022, 2.738565, 0.9885433, 1, 1, 1, 1, 1,
0.40744, -0.7043468, 2.45601, 1, 1, 1, 1, 1,
0.4076757, 0.1471172, 2.507932, 1, 1, 1, 1, 1,
0.4132333, -0.2307339, 2.244252, 1, 1, 1, 1, 1,
0.4146535, 0.982502, 0.1630282, 0, 0, 1, 1, 1,
0.4171487, 1.085961, 0.1616977, 1, 0, 0, 1, 1,
0.4206389, 0.1470384, 0.9833813, 1, 0, 0, 1, 1,
0.421419, 0.2645298, 1.144116, 1, 0, 0, 1, 1,
0.4252878, 0.4741921, 1.802991, 1, 0, 0, 1, 1,
0.4259026, -1.277406, 4.874504, 1, 0, 0, 1, 1,
0.4271362, -1.374252, 1.709422, 0, 0, 0, 1, 1,
0.4312041, -1.365381, 2.871301, 0, 0, 0, 1, 1,
0.4325144, -0.3455803, 0.9292992, 0, 0, 0, 1, 1,
0.4327711, -0.1604382, 1.753374, 0, 0, 0, 1, 1,
0.4337309, 0.2882302, 1.2847, 0, 0, 0, 1, 1,
0.4342051, -1.034443, 2.345612, 0, 0, 0, 1, 1,
0.4367912, 0.16597, 1.720453, 0, 0, 0, 1, 1,
0.4379094, -0.2253993, 0.3269299, 1, 1, 1, 1, 1,
0.4412185, -1.884421, 3.141496, 1, 1, 1, 1, 1,
0.4424677, 0.2450084, -0.2427653, 1, 1, 1, 1, 1,
0.4452085, -2.093982, 2.897398, 1, 1, 1, 1, 1,
0.4473821, -0.07481338, 0.8345964, 1, 1, 1, 1, 1,
0.453421, -0.1855793, 3.811162, 1, 1, 1, 1, 1,
0.4542847, -1.513568, 4.150651, 1, 1, 1, 1, 1,
0.4563612, -1.011402, 2.381155, 1, 1, 1, 1, 1,
0.4608591, 0.9572943, 2.246534, 1, 1, 1, 1, 1,
0.466347, -0.9696285, 0.9891499, 1, 1, 1, 1, 1,
0.4768787, 1.330361, -0.5514527, 1, 1, 1, 1, 1,
0.4807716, 0.6102075, 1.103573, 1, 1, 1, 1, 1,
0.4848835, 0.1609343, 2.676408, 1, 1, 1, 1, 1,
0.4934604, -0.1188288, 3.534443, 1, 1, 1, 1, 1,
0.4959035, -0.4175045, 2.04028, 1, 1, 1, 1, 1,
0.5011874, 0.02258907, 1.885949, 0, 0, 1, 1, 1,
0.5024502, 0.6217278, 1.605534, 1, 0, 0, 1, 1,
0.5070733, -0.2137284, 1.771957, 1, 0, 0, 1, 1,
0.5090936, -1.243562, 1.139269, 1, 0, 0, 1, 1,
0.5100368, -0.0398498, -0.08398306, 1, 0, 0, 1, 1,
0.5117759, 1.268996, -0.9381816, 1, 0, 0, 1, 1,
0.5130381, -0.3163696, 1.352969, 0, 0, 0, 1, 1,
0.5169185, 0.6855524, 0.6219705, 0, 0, 0, 1, 1,
0.5170681, -0.9213576, 2.594603, 0, 0, 0, 1, 1,
0.5215793, -0.42921, 3.38098, 0, 0, 0, 1, 1,
0.5229968, -0.0516598, 0.9341105, 0, 0, 0, 1, 1,
0.5259839, 0.2149792, 1.182484, 0, 0, 0, 1, 1,
0.5260381, 0.08733572, 1.286714, 0, 0, 0, 1, 1,
0.5298212, -0.5985016, 2.022683, 1, 1, 1, 1, 1,
0.535597, -0.2162761, 2.772999, 1, 1, 1, 1, 1,
0.5386525, -0.2222508, 1.868417, 1, 1, 1, 1, 1,
0.5392107, 0.08055467, 0.4513532, 1, 1, 1, 1, 1,
0.5469535, -0.8055234, 2.76564, 1, 1, 1, 1, 1,
0.5502412, -0.4362325, 2.345281, 1, 1, 1, 1, 1,
0.5517273, 0.4180193, -0.07714228, 1, 1, 1, 1, 1,
0.5520276, 1.721135, -1.628677, 1, 1, 1, 1, 1,
0.5539602, 0.106019, 1.30352, 1, 1, 1, 1, 1,
0.5584384, -0.2242947, 1.923108, 1, 1, 1, 1, 1,
0.5630723, 1.294573, -0.5606323, 1, 1, 1, 1, 1,
0.5651581, -0.3143399, 2.835688, 1, 1, 1, 1, 1,
0.5699595, -0.3107893, 1.277043, 1, 1, 1, 1, 1,
0.5727223, -0.2211803, 1.884791, 1, 1, 1, 1, 1,
0.5760732, -0.100478, 0.2073492, 1, 1, 1, 1, 1,
0.5795674, -1.057438, 2.742616, 0, 0, 1, 1, 1,
0.5806214, -0.2744315, 2.653786, 1, 0, 0, 1, 1,
0.5816508, 2.321495, 0.3597424, 1, 0, 0, 1, 1,
0.5831431, -0.2866092, 1.816863, 1, 0, 0, 1, 1,
0.5884778, 0.7998017, 0.7420176, 1, 0, 0, 1, 1,
0.5895232, -1.758879, 3.099229, 1, 0, 0, 1, 1,
0.5896044, -0.5393376, 2.215636, 0, 0, 0, 1, 1,
0.5930035, 0.7759153, 0.231902, 0, 0, 0, 1, 1,
0.5932188, 1.634293, 1.016357, 0, 0, 0, 1, 1,
0.5982597, -0.6872636, 2.082535, 0, 0, 0, 1, 1,
0.5992384, -0.0133095, 1.97284, 0, 0, 0, 1, 1,
0.6037908, 0.7778215, 1.81599, 0, 0, 0, 1, 1,
0.60399, -0.3469234, 1.457414, 0, 0, 0, 1, 1,
0.6056674, 0.1469114, 1.501606, 1, 1, 1, 1, 1,
0.6102833, -0.9619116, 3.95049, 1, 1, 1, 1, 1,
0.6103244, 0.1342323, 1.752126, 1, 1, 1, 1, 1,
0.6120315, 0.7836145, 2.10811, 1, 1, 1, 1, 1,
0.6122956, 1.021084, 0.1811003, 1, 1, 1, 1, 1,
0.6166, -0.2172746, 2.998813, 1, 1, 1, 1, 1,
0.6219555, 0.9364209, 0.5162998, 1, 1, 1, 1, 1,
0.6282539, 0.6227842, 1.885755, 1, 1, 1, 1, 1,
0.628672, -2.389265, 3.428279, 1, 1, 1, 1, 1,
0.6287872, 0.6648682, 0.3147706, 1, 1, 1, 1, 1,
0.6290703, -1.313549, 4.561666, 1, 1, 1, 1, 1,
0.6331933, -0.850352, 1.807684, 1, 1, 1, 1, 1,
0.6351379, 0.0188218, 1.938493, 1, 1, 1, 1, 1,
0.6396547, 0.3962815, 0.2294085, 1, 1, 1, 1, 1,
0.6405249, -0.4700474, 1.966529, 1, 1, 1, 1, 1,
0.648178, -0.08059528, 2.189521, 0, 0, 1, 1, 1,
0.6496555, -1.446275, 2.332385, 1, 0, 0, 1, 1,
0.6526071, 0.6744536, 0.7724329, 1, 0, 0, 1, 1,
0.6562732, 0.7412493, 1.626722, 1, 0, 0, 1, 1,
0.6584296, -1.394883, 3.396659, 1, 0, 0, 1, 1,
0.6590626, 1.000493, 0.606871, 1, 0, 0, 1, 1,
0.661732, 1.243728, 0.6177407, 0, 0, 0, 1, 1,
0.661934, 0.7502051, 0.6796479, 0, 0, 0, 1, 1,
0.6640997, -0.1942, 2.530979, 0, 0, 0, 1, 1,
0.6678113, 0.3870853, -0.3823296, 0, 0, 0, 1, 1,
0.681927, -1.041903, 2.149673, 0, 0, 0, 1, 1,
0.6834236, -1.747855, 3.27545, 0, 0, 0, 1, 1,
0.6882726, -1.107313, 1.314406, 0, 0, 0, 1, 1,
0.6958293, 0.29616, 1.239437, 1, 1, 1, 1, 1,
0.6995201, -0.06658343, 2.283828, 1, 1, 1, 1, 1,
0.7020594, 0.8887424, -0.00188484, 1, 1, 1, 1, 1,
0.7046498, 1.264922, -0.9710091, 1, 1, 1, 1, 1,
0.7060534, -2.676702, 3.078483, 1, 1, 1, 1, 1,
0.7075187, -0.9596958, 5.065541, 1, 1, 1, 1, 1,
0.7111744, 0.414137, 1.269388, 1, 1, 1, 1, 1,
0.7139077, -0.8882213, 4.685751, 1, 1, 1, 1, 1,
0.715125, -0.6580168, 3.463509, 1, 1, 1, 1, 1,
0.7161281, 1.141469, -1.048501, 1, 1, 1, 1, 1,
0.7161424, -0.1532689, 3.704355, 1, 1, 1, 1, 1,
0.7192165, -0.2939803, 2.466332, 1, 1, 1, 1, 1,
0.7194546, -0.2793598, 0.8896496, 1, 1, 1, 1, 1,
0.7217371, 1.27496, 1.153605, 1, 1, 1, 1, 1,
0.7218202, -0.7232525, 1.413722, 1, 1, 1, 1, 1,
0.7223453, 0.4732599, -0.5487723, 0, 0, 1, 1, 1,
0.7427178, -0.141319, 1.082524, 1, 0, 0, 1, 1,
0.7510887, 0.8395985, 0.8505979, 1, 0, 0, 1, 1,
0.7543238, 1.423866, 1.769812, 1, 0, 0, 1, 1,
0.7548816, 0.3290088, -1.017149, 1, 0, 0, 1, 1,
0.7572393, 0.7031642, 0.634721, 1, 0, 0, 1, 1,
0.7603389, 0.6189305, 2.103648, 0, 0, 0, 1, 1,
0.7640001, 0.5639507, 3.479716, 0, 0, 0, 1, 1,
0.7659054, 1.322174, 1.923544, 0, 0, 0, 1, 1,
0.7659374, -2.79661, 3.733685, 0, 0, 0, 1, 1,
0.7710571, 1.168671, 0.113705, 0, 0, 0, 1, 1,
0.7771803, 1.954173, -0.4306198, 0, 0, 0, 1, 1,
0.7771842, -0.5133116, 1.509811, 0, 0, 0, 1, 1,
0.778151, -0.4768576, 2.070852, 1, 1, 1, 1, 1,
0.7835637, 1.797016, -1.107633, 1, 1, 1, 1, 1,
0.7889435, -0.03755331, 1.046951, 1, 1, 1, 1, 1,
0.794512, -0.6061198, 0.564364, 1, 1, 1, 1, 1,
0.8069381, 0.5579473, -0.2239756, 1, 1, 1, 1, 1,
0.8089291, -0.3353777, 1.274454, 1, 1, 1, 1, 1,
0.8179374, 0.1087961, 0.847353, 1, 1, 1, 1, 1,
0.8200033, -0.7229742, 0.9337606, 1, 1, 1, 1, 1,
0.8210441, -0.2531986, 0.3785903, 1, 1, 1, 1, 1,
0.8221858, -0.5898944, 1.526108, 1, 1, 1, 1, 1,
0.8299808, -0.9568463, 1.762965, 1, 1, 1, 1, 1,
0.8327348, 0.2693288, 3.39669, 1, 1, 1, 1, 1,
0.8344088, 0.594922, -0.5540503, 1, 1, 1, 1, 1,
0.8442457, -0.4275205, 3.289479, 1, 1, 1, 1, 1,
0.8566306, 0.7868041, -1.4617, 1, 1, 1, 1, 1,
0.8590857, 1.000018, 1.458057, 0, 0, 1, 1, 1,
0.8608437, -0.9515066, 2.09741, 1, 0, 0, 1, 1,
0.8628777, -0.4818594, 1.130699, 1, 0, 0, 1, 1,
0.8646613, 0.3510742, 1.082807, 1, 0, 0, 1, 1,
0.8752977, 0.7573598, -0.1938167, 1, 0, 0, 1, 1,
0.8782015, 0.1308941, 2.661454, 1, 0, 0, 1, 1,
0.8833334, 0.3415576, -0.1334239, 0, 0, 0, 1, 1,
0.8851683, 0.6415448, 2.060577, 0, 0, 0, 1, 1,
0.8937644, -0.3250697, 1.100344, 0, 0, 0, 1, 1,
0.8942146, 1.448979, 0.2079514, 0, 0, 0, 1, 1,
0.8962922, -0.8129285, 2.37659, 0, 0, 0, 1, 1,
0.8995996, 0.4105015, -0.3117604, 0, 0, 0, 1, 1,
0.9068704, 1.076035, -0.1897823, 0, 0, 0, 1, 1,
0.9253457, -1.076878, 3.189371, 1, 1, 1, 1, 1,
0.9282628, 0.6191359, 2.255412, 1, 1, 1, 1, 1,
0.9506597, 0.0896786, 2.158904, 1, 1, 1, 1, 1,
0.9516906, -1.547126, 2.990262, 1, 1, 1, 1, 1,
0.9534594, 0.5067081, 0.03515518, 1, 1, 1, 1, 1,
0.9557272, 0.05306112, 2.000383, 1, 1, 1, 1, 1,
0.9566777, 0.06988202, 2.968711, 1, 1, 1, 1, 1,
0.9638584, -0.7722008, 2.436381, 1, 1, 1, 1, 1,
0.9679213, 1.24397, 0.7434534, 1, 1, 1, 1, 1,
0.9698052, -0.02153972, 0.1752372, 1, 1, 1, 1, 1,
0.9706077, -0.5907431, 1.134322, 1, 1, 1, 1, 1,
0.9707897, -1.262996, 3.199384, 1, 1, 1, 1, 1,
0.9729845, 1.491192, 0.091799, 1, 1, 1, 1, 1,
0.9753181, 0.578546, -0.3213507, 1, 1, 1, 1, 1,
0.9840396, 0.2337208, 0.6129339, 1, 1, 1, 1, 1,
0.9854106, 0.1353278, 0.5020003, 0, 0, 1, 1, 1,
0.9871428, -1.308192, 2.131295, 1, 0, 0, 1, 1,
0.9911835, 0.1749906, 1.68092, 1, 0, 0, 1, 1,
0.9970229, 1.237095, 0.02791827, 1, 0, 0, 1, 1,
0.9979646, 0.09472635, 3.231564, 1, 0, 0, 1, 1,
1.001497, 1.506825, 0.9909652, 1, 0, 0, 1, 1,
1.004889, 1.58792, -0.8378987, 0, 0, 0, 1, 1,
1.008093, 0.5665545, 0.1709222, 0, 0, 0, 1, 1,
1.011405, 0.6280969, -0.2853583, 0, 0, 0, 1, 1,
1.01326, -0.5184985, 3.654158, 0, 0, 0, 1, 1,
1.013515, -0.1330773, 2.238925, 0, 0, 0, 1, 1,
1.016753, 1.362441, 1.768522, 0, 0, 0, 1, 1,
1.03461, 0.6429954, 1.178251, 0, 0, 0, 1, 1,
1.037585, -0.5986598, 1.965745, 1, 1, 1, 1, 1,
1.045907, -0.1454431, -0.3825883, 1, 1, 1, 1, 1,
1.051851, -0.7418604, 1.555346, 1, 1, 1, 1, 1,
1.058329, 0.8141582, -1.121797, 1, 1, 1, 1, 1,
1.058766, 0.6845695, 0.3308964, 1, 1, 1, 1, 1,
1.061578, 0.2898968, 2.070217, 1, 1, 1, 1, 1,
1.062497, 2.099032, -0.6621705, 1, 1, 1, 1, 1,
1.066362, -1.24686, 3.720647, 1, 1, 1, 1, 1,
1.067225, -0.02329556, 1.764517, 1, 1, 1, 1, 1,
1.068836, 2.112388, 0.3206649, 1, 1, 1, 1, 1,
1.070928, 0.7080429, 0.3757306, 1, 1, 1, 1, 1,
1.075885, -0.8277594, 4.059482, 1, 1, 1, 1, 1,
1.078213, -0.0521515, 2.017386, 1, 1, 1, 1, 1,
1.078459, 0.4917995, 0.8901454, 1, 1, 1, 1, 1,
1.081001, -0.4685039, 3.465066, 1, 1, 1, 1, 1,
1.08338, -0.3057376, 0.5507665, 0, 0, 1, 1, 1,
1.088406, -0.3762818, 2.356638, 1, 0, 0, 1, 1,
1.08907, -3.876683, 0.9830067, 1, 0, 0, 1, 1,
1.090076, 1.082396, 0.3600062, 1, 0, 0, 1, 1,
1.090206, -1.907035, 3.589439, 1, 0, 0, 1, 1,
1.091506, 0.2580679, 2.057392, 1, 0, 0, 1, 1,
1.102651, -0.5888407, 1.122246, 0, 0, 0, 1, 1,
1.104451, -2.576977, 2.897642, 0, 0, 0, 1, 1,
1.104854, -1.246627, 1.376306, 0, 0, 0, 1, 1,
1.105859, -0.9876947, 0.7358367, 0, 0, 0, 1, 1,
1.107029, 0.1347228, 2.416738, 0, 0, 0, 1, 1,
1.107063, 0.1269713, 3.441015, 0, 0, 0, 1, 1,
1.111363, -0.2300498, 1.536701, 0, 0, 0, 1, 1,
1.11343, 0.2628598, 1.384989, 1, 1, 1, 1, 1,
1.11788, -0.7474368, 2.510391, 1, 1, 1, 1, 1,
1.123659, -0.8017212, 2.194259, 1, 1, 1, 1, 1,
1.133401, 0.8075208, 2.573125, 1, 1, 1, 1, 1,
1.134881, 0.9440665, 1.842413, 1, 1, 1, 1, 1,
1.147083, 3.261053, -0.07180396, 1, 1, 1, 1, 1,
1.15417, 1.301856, -0.06165925, 1, 1, 1, 1, 1,
1.158897, 0.03143714, 2.001227, 1, 1, 1, 1, 1,
1.158929, 2.760902, 0.3438137, 1, 1, 1, 1, 1,
1.161226, 1.62621, 2.568247, 1, 1, 1, 1, 1,
1.164663, -0.9500273, 2.31475, 1, 1, 1, 1, 1,
1.183421, 0.4280708, 1.434287, 1, 1, 1, 1, 1,
1.191284, -0.005828157, 0.5578663, 1, 1, 1, 1, 1,
1.20471, -0.7296711, 1.746868, 1, 1, 1, 1, 1,
1.206587, -0.1929035, 2.260493, 1, 1, 1, 1, 1,
1.209017, 1.110829, 0.7208825, 0, 0, 1, 1, 1,
1.225392, -1.429763, 4.948357, 1, 0, 0, 1, 1,
1.234685, 0.8142297, -0.7259851, 1, 0, 0, 1, 1,
1.243371, 0.4841988, 0.2864027, 1, 0, 0, 1, 1,
1.251286, 0.5249059, 2.592358, 1, 0, 0, 1, 1,
1.254117, -0.7209095, 1.5737, 1, 0, 0, 1, 1,
1.267974, 1.144021, -0.2801025, 0, 0, 0, 1, 1,
1.269039, -0.6843981, 1.556977, 0, 0, 0, 1, 1,
1.269649, 1.441949, -0.02872461, 0, 0, 0, 1, 1,
1.272839, 1.534032, -0.2867997, 0, 0, 0, 1, 1,
1.275546, 1.00679, -0.1232117, 0, 0, 0, 1, 1,
1.280631, 1.085088, 1.262302, 0, 0, 0, 1, 1,
1.281513, -0.709317, 1.923728, 0, 0, 0, 1, 1,
1.283132, -0.02449967, 2.736362, 1, 1, 1, 1, 1,
1.283852, -0.09814095, 3.496301, 1, 1, 1, 1, 1,
1.286422, 1.100361, 1.530334, 1, 1, 1, 1, 1,
1.292102, -0.6984363, 1.398211, 1, 1, 1, 1, 1,
1.29461, 1.500396, 0.9591332, 1, 1, 1, 1, 1,
1.297804, 0.08427884, 2.087831, 1, 1, 1, 1, 1,
1.30717, 0.7500602, 0.387958, 1, 1, 1, 1, 1,
1.309785, -0.5915827, 2.069405, 1, 1, 1, 1, 1,
1.314416, 0.3813986, 1.073907, 1, 1, 1, 1, 1,
1.31486, -0.4957856, 3.038396, 1, 1, 1, 1, 1,
1.323292, 0.694261, 0.6611656, 1, 1, 1, 1, 1,
1.32865, 0.07467572, 0.4710735, 1, 1, 1, 1, 1,
1.344168, 0.006947363, 2.843057, 1, 1, 1, 1, 1,
1.344608, -0.6952789, 2.405479, 1, 1, 1, 1, 1,
1.350575, 1.027719, 0.1381645, 1, 1, 1, 1, 1,
1.360606, -0.2690174, 3.351706, 0, 0, 1, 1, 1,
1.363711, 0.4021325, 0.7915263, 1, 0, 0, 1, 1,
1.368001, 1.108014, 2.304322, 1, 0, 0, 1, 1,
1.370522, 0.9317082, -0.102603, 1, 0, 0, 1, 1,
1.377059, 0.01845132, 1.59648, 1, 0, 0, 1, 1,
1.386901, 0.5665885, 1.004167, 1, 0, 0, 1, 1,
1.394171, 0.1979574, -0.8182551, 0, 0, 0, 1, 1,
1.405572, -0.9954965, 2.382795, 0, 0, 0, 1, 1,
1.410334, 0.723115, 2.795281, 0, 0, 0, 1, 1,
1.42995, -0.9741514, 2.559834, 0, 0, 0, 1, 1,
1.43093, -0.9242178, 2.402561, 0, 0, 0, 1, 1,
1.436081, -1.844096, 1.860088, 0, 0, 0, 1, 1,
1.440326, -0.07275765, 2.140455, 0, 0, 0, 1, 1,
1.452161, 0.08667883, 0.9234707, 1, 1, 1, 1, 1,
1.463787, -1.968045, 2.794048, 1, 1, 1, 1, 1,
1.463865, 1.620548, 1.882531, 1, 1, 1, 1, 1,
1.480816, -0.2373528, 1.236281, 1, 1, 1, 1, 1,
1.485593, -1.957152, 2.104466, 1, 1, 1, 1, 1,
1.508782, 0.6707258, 1.241349, 1, 1, 1, 1, 1,
1.523325, -1.232475, 2.892438, 1, 1, 1, 1, 1,
1.531762, 0.01059168, 0.5485359, 1, 1, 1, 1, 1,
1.536033, 0.08016808, 3.737631, 1, 1, 1, 1, 1,
1.539148, 1.105629, 1.238045, 1, 1, 1, 1, 1,
1.551936, 0.4913444, 1.288678, 1, 1, 1, 1, 1,
1.559361, 0.6015829, 1.088249, 1, 1, 1, 1, 1,
1.559609, -0.6570702, 1.778325, 1, 1, 1, 1, 1,
1.583345, 0.08751687, 2.178071, 1, 1, 1, 1, 1,
1.595428, -1.184089, 2.404595, 1, 1, 1, 1, 1,
1.601351, -0.6978629, 2.750541, 0, 0, 1, 1, 1,
1.637222, -0.5188869, 3.052487, 1, 0, 0, 1, 1,
1.674728, -0.4720712, 2.270273, 1, 0, 0, 1, 1,
1.675159, -0.4182802, 1.132482, 1, 0, 0, 1, 1,
1.681542, 0.6796629, 1.760903, 1, 0, 0, 1, 1,
1.701554, 0.04590803, 1.454976, 1, 0, 0, 1, 1,
1.70651, 1.057302, -1.141451, 0, 0, 0, 1, 1,
1.710956, 0.3568256, 0.5566384, 0, 0, 0, 1, 1,
1.720336, -0.3382762, 2.732054, 0, 0, 0, 1, 1,
1.73341, 0.5854753, 0.3879139, 0, 0, 0, 1, 1,
1.753152, -0.4288518, 2.079593, 0, 0, 0, 1, 1,
1.776358, -0.7803051, 1.095373, 0, 0, 0, 1, 1,
1.79313, 0.1798619, 0.02042826, 0, 0, 0, 1, 1,
1.808192, -0.8970975, 1.603986, 1, 1, 1, 1, 1,
1.824274, 0.02615981, 2.449052, 1, 1, 1, 1, 1,
1.827873, -1.188128, 1.954983, 1, 1, 1, 1, 1,
1.830588, -0.9445671, 0.7794663, 1, 1, 1, 1, 1,
1.840304, 1.080795, 2.063661, 1, 1, 1, 1, 1,
1.848282, -3.45891, 0.02416295, 1, 1, 1, 1, 1,
1.888498, -0.5040774, 2.93943, 1, 1, 1, 1, 1,
1.891588, -0.8072108, 0.5798732, 1, 1, 1, 1, 1,
1.894313, -0.8911669, -0.3752925, 1, 1, 1, 1, 1,
1.899048, -0.04004784, 2.275815, 1, 1, 1, 1, 1,
1.943776, 1.822291, 0.7278872, 1, 1, 1, 1, 1,
1.957471, 0.216702, 1.494286, 1, 1, 1, 1, 1,
1.995477, -1.030593, 0.464459, 1, 1, 1, 1, 1,
1.999636, -0.02006474, 1.625023, 1, 1, 1, 1, 1,
2.012724, 1.206151, 2.658626, 1, 1, 1, 1, 1,
2.032749, -1.672002, 0.4315022, 0, 0, 1, 1, 1,
2.078637, -1.534332, 2.90122, 1, 0, 0, 1, 1,
2.099607, 0.02760872, 0.9592637, 1, 0, 0, 1, 1,
2.112792, -1.613268, 2.020249, 1, 0, 0, 1, 1,
2.123451, -0.3357427, 0.6806045, 1, 0, 0, 1, 1,
2.155494, -1.147156, 3.152604, 1, 0, 0, 1, 1,
2.171903, 1.052984, 0.5280627, 0, 0, 0, 1, 1,
2.176234, 0.3658249, 2.619522, 0, 0, 0, 1, 1,
2.190739, -0.5038568, 2.843802, 0, 0, 0, 1, 1,
2.195462, 0.8226616, 1.50199, 0, 0, 0, 1, 1,
2.294516, 0.5234424, 1.448601, 0, 0, 0, 1, 1,
2.301962, 0.2352436, 0.9744769, 0, 0, 0, 1, 1,
2.325424, 0.03492535, 1.926125, 0, 0, 0, 1, 1,
2.380703, 0.6377839, 1.365526, 1, 1, 1, 1, 1,
2.419024, 0.3691153, 3.8095, 1, 1, 1, 1, 1,
2.708026, 0.6158004, 2.591556, 1, 1, 1, 1, 1,
2.718971, 1.101867, 1.144482, 1, 1, 1, 1, 1,
2.826446, -0.8148078, 1.132915, 1, 1, 1, 1, 1,
2.899781, 0.5924252, 2.54546, 1, 1, 1, 1, 1,
3.392722, -0.710121, 2.135727, 1, 1, 1, 1, 1
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
var radius = 9.918746;
var distance = 34.83917;
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
mvMatrix.translate( 0.1068325, 0.1653423, -0.02976274 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83917);
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
