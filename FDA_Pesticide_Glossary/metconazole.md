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
-3.097637, -0.7169328, -1.202943, 1, 0, 0, 1,
-2.910421, 0.9786566, -0.5490103, 1, 0.007843138, 0, 1,
-2.837563, -0.03567833, -2.256633, 1, 0.01176471, 0, 1,
-2.764701, 0.8818179, -0.8788055, 1, 0.01960784, 0, 1,
-2.686784, 1.078493, -0.9663768, 1, 0.02352941, 0, 1,
-2.668282, -1.004276, -3.080197, 1, 0.03137255, 0, 1,
-2.644318, -0.3180152, -0.8665888, 1, 0.03529412, 0, 1,
-2.629545, -0.1934074, -1.395544, 1, 0.04313726, 0, 1,
-2.598675, -0.8892625, -0.1698058, 1, 0.04705882, 0, 1,
-2.424494, -0.2132139, -3.231113, 1, 0.05490196, 0, 1,
-2.420091, -0.1241733, -1.496217, 1, 0.05882353, 0, 1,
-2.408137, 0.09757265, -2.245494, 1, 0.06666667, 0, 1,
-2.362314, 1.177946, -1.03212, 1, 0.07058824, 0, 1,
-2.318877, 0.2821237, -2.010407, 1, 0.07843138, 0, 1,
-2.305393, 0.4466189, -3.82708, 1, 0.08235294, 0, 1,
-2.22762, -0.7002552, -1.555765, 1, 0.09019608, 0, 1,
-2.215864, 0.6027803, -1.557376, 1, 0.09411765, 0, 1,
-2.190442, 0.2651651, -2.577329, 1, 0.1019608, 0, 1,
-2.179053, 1.38607, -0.9045407, 1, 0.1098039, 0, 1,
-2.16751, -1.143821, -3.773317, 1, 0.1137255, 0, 1,
-2.158921, 0.5365934, -2.527181, 1, 0.1215686, 0, 1,
-2.128446, -0.08050305, -1.820004, 1, 0.1254902, 0, 1,
-2.115191, 0.471584, -0.6469328, 1, 0.1333333, 0, 1,
-2.113959, -1.064383, -1.234335, 1, 0.1372549, 0, 1,
-2.096542, -1.065557, -2.887389, 1, 0.145098, 0, 1,
-2.0732, 0.48105, -0.897608, 1, 0.1490196, 0, 1,
-2.070271, -1.071288, -3.507909, 1, 0.1568628, 0, 1,
-2.057906, 1.510021, -2.442001, 1, 0.1607843, 0, 1,
-2.034506, 0.4995823, -3.648034, 1, 0.1686275, 0, 1,
-2.025527, -0.9587337, -1.073997, 1, 0.172549, 0, 1,
-2.019906, 0.2715767, -1.95295, 1, 0.1803922, 0, 1,
-2.000906, 0.3443624, -1.246257, 1, 0.1843137, 0, 1,
-1.974713, -0.7257606, -2.143707, 1, 0.1921569, 0, 1,
-1.961085, 0.3812822, -1.277209, 1, 0.1960784, 0, 1,
-1.958542, -0.6688815, -0.5690144, 1, 0.2039216, 0, 1,
-1.918227, -0.3022271, -1.100676, 1, 0.2117647, 0, 1,
-1.917899, 0.8600093, -1.277506, 1, 0.2156863, 0, 1,
-1.912962, -0.9760983, -1.918083, 1, 0.2235294, 0, 1,
-1.910169, -0.4274282, -2.771183, 1, 0.227451, 0, 1,
-1.908654, 0.5931187, -0.8869725, 1, 0.2352941, 0, 1,
-1.890172, -2.541774, -3.722706, 1, 0.2392157, 0, 1,
-1.871485, -0.08981835, -1.955216, 1, 0.2470588, 0, 1,
-1.850201, -0.5770486, -4.176955, 1, 0.2509804, 0, 1,
-1.845755, -0.8346965, -1.548724, 1, 0.2588235, 0, 1,
-1.816259, 1.679131, -0.5970387, 1, 0.2627451, 0, 1,
-1.801327, 0.711455, -0.8043276, 1, 0.2705882, 0, 1,
-1.797947, 0.7350425, -0.7384405, 1, 0.2745098, 0, 1,
-1.797518, 0.2312621, -0.5901831, 1, 0.282353, 0, 1,
-1.777636, 0.8212245, -2.310829, 1, 0.2862745, 0, 1,
-1.769696, -1.123459, -2.371624, 1, 0.2941177, 0, 1,
-1.758363, -0.5197376, -1.731942, 1, 0.3019608, 0, 1,
-1.712428, 1.354748, -0.6766258, 1, 0.3058824, 0, 1,
-1.702789, 1.242586, -1.30821, 1, 0.3137255, 0, 1,
-1.697113, -2.2061, -3.32061, 1, 0.3176471, 0, 1,
-1.695144, 0.2831247, -1.727575, 1, 0.3254902, 0, 1,
-1.680447, -0.7343653, -2.866764, 1, 0.3294118, 0, 1,
-1.678259, -0.7989035, -1.87538, 1, 0.3372549, 0, 1,
-1.676197, 0.3982779, -1.837974, 1, 0.3411765, 0, 1,
-1.663736, -0.5398934, -1.402399, 1, 0.3490196, 0, 1,
-1.661389, -0.3909971, -1.290906, 1, 0.3529412, 0, 1,
-1.652547, 1.133814, -0.5215677, 1, 0.3607843, 0, 1,
-1.638751, -0.9312063, 0.8709959, 1, 0.3647059, 0, 1,
-1.634419, -0.307806, -2.199061, 1, 0.372549, 0, 1,
-1.632678, -0.6433822, -0.856026, 1, 0.3764706, 0, 1,
-1.62486, 0.5058965, -0.2828517, 1, 0.3843137, 0, 1,
-1.622953, 1.272946, 0.03131059, 1, 0.3882353, 0, 1,
-1.597761, -0.2192032, -1.872004, 1, 0.3960784, 0, 1,
-1.555369, -0.117638, -3.453879, 1, 0.4039216, 0, 1,
-1.54816, -1.375749, -2.511771, 1, 0.4078431, 0, 1,
-1.544995, 1.943102, -1.194405, 1, 0.4156863, 0, 1,
-1.533216, -0.7819488, -1.455519, 1, 0.4196078, 0, 1,
-1.532871, 0.6113867, -0.9668643, 1, 0.427451, 0, 1,
-1.52482, 0.8366796, -0.4906754, 1, 0.4313726, 0, 1,
-1.522442, -0.4756418, -3.170732, 1, 0.4392157, 0, 1,
-1.516474, -0.5639061, -0.43275, 1, 0.4431373, 0, 1,
-1.514973, 0.01492304, -1.865238, 1, 0.4509804, 0, 1,
-1.507189, -0.7480566, -1.468578, 1, 0.454902, 0, 1,
-1.503421, -0.4426233, -2.992582, 1, 0.4627451, 0, 1,
-1.503113, 0.7477602, 0.4431629, 1, 0.4666667, 0, 1,
-1.502876, 0.2502548, -1.162096, 1, 0.4745098, 0, 1,
-1.501575, 0.2782221, -2.053255, 1, 0.4784314, 0, 1,
-1.493376, -0.581995, -0.06929208, 1, 0.4862745, 0, 1,
-1.490744, -1.260475, -0.2069424, 1, 0.4901961, 0, 1,
-1.480645, -2.014851, -4.340871, 1, 0.4980392, 0, 1,
-1.465113, 0.1460743, -1.80493, 1, 0.5058824, 0, 1,
-1.44704, 0.05028274, -3.412886, 1, 0.509804, 0, 1,
-1.443557, -0.8313126, -1.870268, 1, 0.5176471, 0, 1,
-1.431847, -0.9747674, -1.886997, 1, 0.5215687, 0, 1,
-1.430958, -0.8215506, -2.243553, 1, 0.5294118, 0, 1,
-1.424873, -0.0704435, -1.743985, 1, 0.5333334, 0, 1,
-1.397018, -0.4660399, -0.6869766, 1, 0.5411765, 0, 1,
-1.391807, 2.658577, 0.07645147, 1, 0.5450981, 0, 1,
-1.37583, -0.5634557, -3.377574, 1, 0.5529412, 0, 1,
-1.369718, -0.750673, -1.586554, 1, 0.5568628, 0, 1,
-1.357364, 0.238185, -1.84867, 1, 0.5647059, 0, 1,
-1.3565, 0.1060595, -0.1933501, 1, 0.5686275, 0, 1,
-1.3406, -0.2386124, -0.9039059, 1, 0.5764706, 0, 1,
-1.327458, 0.05534175, -0.9370381, 1, 0.5803922, 0, 1,
-1.327191, 0.2258605, -1.81199, 1, 0.5882353, 0, 1,
-1.316268, 0.2446259, -2.020472, 1, 0.5921569, 0, 1,
-1.313958, 1.101576, -0.9585731, 1, 0.6, 0, 1,
-1.309277, 1.469965, -0.6432763, 1, 0.6078432, 0, 1,
-1.302136, 0.4507789, -0.9515864, 1, 0.6117647, 0, 1,
-1.29534, -1.666322, -2.836792, 1, 0.6196079, 0, 1,
-1.290141, -0.7650735, -2.458313, 1, 0.6235294, 0, 1,
-1.281908, -0.003183851, -2.261115, 1, 0.6313726, 0, 1,
-1.271974, -0.8872645, -4.208653, 1, 0.6352941, 0, 1,
-1.26581, 0.5568742, -1.642854, 1, 0.6431373, 0, 1,
-1.25664, 0.8417982, -0.09727359, 1, 0.6470588, 0, 1,
-1.255943, 0.04599092, -1.117199, 1, 0.654902, 0, 1,
-1.255129, 0.06052442, -0.3683676, 1, 0.6588235, 0, 1,
-1.247864, 0.06849255, -1.577843, 1, 0.6666667, 0, 1,
-1.246955, 1.588873, -1.189471, 1, 0.6705883, 0, 1,
-1.2404, 0.6348453, -0.2568858, 1, 0.6784314, 0, 1,
-1.240019, 3.156286, -0.8532458, 1, 0.682353, 0, 1,
-1.23916, 0.1258753, -0.9852166, 1, 0.6901961, 0, 1,
-1.216113, 0.9278817, -0.7873693, 1, 0.6941177, 0, 1,
-1.214793, 1.538472, -0.5542631, 1, 0.7019608, 0, 1,
-1.20703, -1.354208, -2.284551, 1, 0.7098039, 0, 1,
-1.19955, -0.5110574, -2.385052, 1, 0.7137255, 0, 1,
-1.185061, 0.5037588, -0.06533875, 1, 0.7215686, 0, 1,
-1.170377, 0.2656935, -1.493246, 1, 0.7254902, 0, 1,
-1.166519, -0.1901894, -2.085914, 1, 0.7333333, 0, 1,
-1.166501, -0.2281798, -0.3077222, 1, 0.7372549, 0, 1,
-1.164737, 0.4271983, -2.367039, 1, 0.7450981, 0, 1,
-1.159346, 1.213287, -2.670673, 1, 0.7490196, 0, 1,
-1.158287, 0.758504, -1.18855, 1, 0.7568628, 0, 1,
-1.154492, 0.557855, 0.1123282, 1, 0.7607843, 0, 1,
-1.15005, -0.3911756, -2.622585, 1, 0.7686275, 0, 1,
-1.141718, 0.6659068, 0.05520068, 1, 0.772549, 0, 1,
-1.134842, -1.234889, -3.586443, 1, 0.7803922, 0, 1,
-1.130914, -0.3420753, -2.810844, 1, 0.7843137, 0, 1,
-1.118193, -0.7332459, -2.019087, 1, 0.7921569, 0, 1,
-1.108667, -0.06056436, -3.118837, 1, 0.7960784, 0, 1,
-1.10599, -0.3674328, -1.441163, 1, 0.8039216, 0, 1,
-1.099039, -1.454008, -2.136747, 1, 0.8117647, 0, 1,
-1.097261, 0.2004015, -0.9649906, 1, 0.8156863, 0, 1,
-1.093804, -0.3625655, -3.109763, 1, 0.8235294, 0, 1,
-1.093323, 0.01063994, 1.184671, 1, 0.827451, 0, 1,
-1.092001, -0.9489231, -2.394107, 1, 0.8352941, 0, 1,
-1.091787, 0.3454461, -1.287542, 1, 0.8392157, 0, 1,
-1.0911, -2.935493, -1.526931, 1, 0.8470588, 0, 1,
-1.088035, 1.179569, 0.4721996, 1, 0.8509804, 0, 1,
-1.083291, -0.7206782, -2.129622, 1, 0.8588235, 0, 1,
-1.082511, 1.454648, -0.8026493, 1, 0.8627451, 0, 1,
-1.078241, 0.5680951, -1.206683, 1, 0.8705882, 0, 1,
-1.076839, 0.6416062, -0.0412775, 1, 0.8745098, 0, 1,
-1.07442, 0.5831652, -1.233395, 1, 0.8823529, 0, 1,
-1.068728, -0.3439839, -0.5728608, 1, 0.8862745, 0, 1,
-1.067066, 0.109073, 0.2518588, 1, 0.8941177, 0, 1,
-1.04863, -0.2553679, -1.016277, 1, 0.8980392, 0, 1,
-1.045364, 1.861251, -0.631861, 1, 0.9058824, 0, 1,
-1.044988, -0.4792738, 0.2796066, 1, 0.9137255, 0, 1,
-1.044851, -1.054567, -0.2180145, 1, 0.9176471, 0, 1,
-1.039337, 1.067082, -1.575112, 1, 0.9254902, 0, 1,
-1.016241, 0.4021322, -3.954916, 1, 0.9294118, 0, 1,
-1.01362, 0.5520228, -3.188257, 1, 0.9372549, 0, 1,
-1.013505, -1.756886, -1.676303, 1, 0.9411765, 0, 1,
-1.012715, 0.657517, 1.593606, 1, 0.9490196, 0, 1,
-1.005783, 1.278231, -0.9709764, 1, 0.9529412, 0, 1,
-1.005042, 0.9655371, 0.1223367, 1, 0.9607843, 0, 1,
-1.002203, 0.5745578, -1.421264, 1, 0.9647059, 0, 1,
-0.9990531, 0.2874791, -2.0732, 1, 0.972549, 0, 1,
-0.9792303, -0.479356, -2.982838, 1, 0.9764706, 0, 1,
-0.9782978, 0.05040014, -1.573823, 1, 0.9843137, 0, 1,
-0.9739044, -0.01972538, -1.222551, 1, 0.9882353, 0, 1,
-0.9725772, -0.08428264, 0.1184049, 1, 0.9960784, 0, 1,
-0.9716179, -0.6538538, -2.870738, 0.9960784, 1, 0, 1,
-0.9704307, -1.32481, -3.41432, 0.9921569, 1, 0, 1,
-0.9690676, 3.143628, 0.1507291, 0.9843137, 1, 0, 1,
-0.9680752, 0.1083744, -2.160758, 0.9803922, 1, 0, 1,
-0.9655535, -0.315793, -2.859725, 0.972549, 1, 0, 1,
-0.9641572, -0.05920044, -1.183872, 0.9686275, 1, 0, 1,
-0.9626774, 0.992605, -2.17978, 0.9607843, 1, 0, 1,
-0.9626747, -0.07248158, -2.997495, 0.9568627, 1, 0, 1,
-0.9572368, 0.7396997, 0.0444551, 0.9490196, 1, 0, 1,
-0.9569498, 0.09775642, -0.6123823, 0.945098, 1, 0, 1,
-0.9541928, 1.235993, 1.741738, 0.9372549, 1, 0, 1,
-0.9489632, 0.3224364, -3.318361, 0.9333333, 1, 0, 1,
-0.9440498, -0.3396398, -3.197073, 0.9254902, 1, 0, 1,
-0.9424242, 0.0260119, -0.6074367, 0.9215686, 1, 0, 1,
-0.9380223, 1.043853, 0.4212736, 0.9137255, 1, 0, 1,
-0.9342902, 0.7572602, -1.454348, 0.9098039, 1, 0, 1,
-0.9211497, -2.12069, -1.674477, 0.9019608, 1, 0, 1,
-0.9208922, -0.2313271, -0.8378392, 0.8941177, 1, 0, 1,
-0.9167621, 0.2535713, -0.1888668, 0.8901961, 1, 0, 1,
-0.9035982, -1.247831, -0.9677032, 0.8823529, 1, 0, 1,
-0.9023641, 0.4714548, 0.7458476, 0.8784314, 1, 0, 1,
-0.9001048, -1.994233, -2.658981, 0.8705882, 1, 0, 1,
-0.8996572, -0.3290772, -1.911561, 0.8666667, 1, 0, 1,
-0.8919352, -0.2959094, -2.361423, 0.8588235, 1, 0, 1,
-0.8918808, 0.5041572, -0.5336044, 0.854902, 1, 0, 1,
-0.8894044, 0.6487318, -1.82418, 0.8470588, 1, 0, 1,
-0.8882883, 1.691638, -0.7674923, 0.8431373, 1, 0, 1,
-0.8853666, -0.2414234, -1.208035, 0.8352941, 1, 0, 1,
-0.8852662, -0.5941002, -2.370892, 0.8313726, 1, 0, 1,
-0.8841854, 1.484653, -0.3486347, 0.8235294, 1, 0, 1,
-0.8815536, 0.2436711, -1.684068, 0.8196079, 1, 0, 1,
-0.8803791, -1.478692, -3.487578, 0.8117647, 1, 0, 1,
-0.8798097, -0.6835529, -4.225806, 0.8078431, 1, 0, 1,
-0.8797578, -0.4494293, -2.074257, 0.8, 1, 0, 1,
-0.8760777, 0.2292558, -0.1092996, 0.7921569, 1, 0, 1,
-0.8716355, 1.280182, -0.05042637, 0.7882353, 1, 0, 1,
-0.8662308, -0.5119579, -1.489807, 0.7803922, 1, 0, 1,
-0.864638, -0.4931992, -0.5696439, 0.7764706, 1, 0, 1,
-0.8499217, -1.238509, -3.576385, 0.7686275, 1, 0, 1,
-0.8453522, -0.6212052, -3.041246, 0.7647059, 1, 0, 1,
-0.8398616, -1.142706, -3.111914, 0.7568628, 1, 0, 1,
-0.8314635, 0.4381143, -1.232486, 0.7529412, 1, 0, 1,
-0.8298308, -1.262439, -2.870011, 0.7450981, 1, 0, 1,
-0.8191951, 2.053181, 0.7832299, 0.7411765, 1, 0, 1,
-0.8190452, -1.464724, -4.787234, 0.7333333, 1, 0, 1,
-0.8184341, -0.6224151, -1.999638, 0.7294118, 1, 0, 1,
-0.8165092, -0.2635011, -2.459957, 0.7215686, 1, 0, 1,
-0.8030537, -0.2404605, -2.619176, 0.7176471, 1, 0, 1,
-0.8030211, 2.154522, 1.684047, 0.7098039, 1, 0, 1,
-0.8017108, -0.5591317, -3.249783, 0.7058824, 1, 0, 1,
-0.7908497, -0.2222372, -1.067636, 0.6980392, 1, 0, 1,
-0.7872675, 0.8565411, -0.004830869, 0.6901961, 1, 0, 1,
-0.7872663, -0.09466357, -0.8898292, 0.6862745, 1, 0, 1,
-0.7832509, 2.839564, 1.850956, 0.6784314, 1, 0, 1,
-0.7772532, 0.003525538, -0.2747494, 0.6745098, 1, 0, 1,
-0.7685694, 0.2773361, -0.4428646, 0.6666667, 1, 0, 1,
-0.7668566, -1.700132, -4.351919, 0.6627451, 1, 0, 1,
-0.7568909, -0.3054437, -0.5824659, 0.654902, 1, 0, 1,
-0.7560103, 0.9412404, -0.02367402, 0.6509804, 1, 0, 1,
-0.754656, 1.375383, -1.850479, 0.6431373, 1, 0, 1,
-0.7527211, 0.5413925, 0.3301137, 0.6392157, 1, 0, 1,
-0.752701, -0.5608573, -3.709928, 0.6313726, 1, 0, 1,
-0.7483631, -0.6341965, -2.978372, 0.627451, 1, 0, 1,
-0.7477857, -0.6502224, -2.431418, 0.6196079, 1, 0, 1,
-0.7435047, -0.6438453, -2.38885, 0.6156863, 1, 0, 1,
-0.7400396, 0.242515, 0.3968965, 0.6078432, 1, 0, 1,
-0.7395926, 0.02260757, -0.6922979, 0.6039216, 1, 0, 1,
-0.7381037, 0.2058038, -2.749802, 0.5960785, 1, 0, 1,
-0.7378535, 0.9009198, -1.204732, 0.5882353, 1, 0, 1,
-0.7351556, -1.068171, -2.134151, 0.5843138, 1, 0, 1,
-0.7303404, -1.540404, -1.598869, 0.5764706, 1, 0, 1,
-0.729256, 0.2894648, 0.5888224, 0.572549, 1, 0, 1,
-0.7287428, 0.4849529, -1.662675, 0.5647059, 1, 0, 1,
-0.7184585, 0.572062, 0.3123817, 0.5607843, 1, 0, 1,
-0.7182335, 0.7818303, 0.3317414, 0.5529412, 1, 0, 1,
-0.7155098, -0.2200992, -2.884558, 0.5490196, 1, 0, 1,
-0.7145262, 1.350123, -0.06327615, 0.5411765, 1, 0, 1,
-0.7136726, 1.015908, -0.3312218, 0.5372549, 1, 0, 1,
-0.7121555, 0.3791108, -0.1591117, 0.5294118, 1, 0, 1,
-0.7114396, 0.7459977, 0.3091259, 0.5254902, 1, 0, 1,
-0.7077463, -1.349426, -1.68524, 0.5176471, 1, 0, 1,
-0.7071287, 0.08755936, -0.6512142, 0.5137255, 1, 0, 1,
-0.7053027, -0.3148953, -1.545331, 0.5058824, 1, 0, 1,
-0.6990383, 0.8762568, -0.5437428, 0.5019608, 1, 0, 1,
-0.6959351, -0.1668908, -2.462114, 0.4941176, 1, 0, 1,
-0.6944047, 0.6803181, -1.166683, 0.4862745, 1, 0, 1,
-0.691492, 0.3182793, 0.08814507, 0.4823529, 1, 0, 1,
-0.6855211, -0.01269452, -2.511826, 0.4745098, 1, 0, 1,
-0.6845452, 0.9866719, -0.527688, 0.4705882, 1, 0, 1,
-0.6814359, -1.495381, -1.053414, 0.4627451, 1, 0, 1,
-0.6780238, 0.6664198, -1.687993, 0.4588235, 1, 0, 1,
-0.6749823, 0.1509178, -0.1181065, 0.4509804, 1, 0, 1,
-0.6743059, 1.623283, 0.01194295, 0.4470588, 1, 0, 1,
-0.6720814, -1.149139, -2.778232, 0.4392157, 1, 0, 1,
-0.6646317, 1.764169, -0.3213592, 0.4352941, 1, 0, 1,
-0.6619647, -1.763673, -1.759695, 0.427451, 1, 0, 1,
-0.6589025, -0.8499423, -3.592175, 0.4235294, 1, 0, 1,
-0.657055, -0.7536696, -4.084577, 0.4156863, 1, 0, 1,
-0.651969, 0.6351632, -2.589325, 0.4117647, 1, 0, 1,
-0.6468214, -1.676824, -4.570146, 0.4039216, 1, 0, 1,
-0.6450888, 0.2935701, -1.29537, 0.3960784, 1, 0, 1,
-0.6441904, -0.4022873, -2.432919, 0.3921569, 1, 0, 1,
-0.6439841, -0.191872, 1.800782, 0.3843137, 1, 0, 1,
-0.6438633, -0.2324899, -2.661516, 0.3803922, 1, 0, 1,
-0.6420676, 1.087091, -0.2785819, 0.372549, 1, 0, 1,
-0.6400474, 0.5919387, -0.08005006, 0.3686275, 1, 0, 1,
-0.6357136, -0.5166101, -2.999114, 0.3607843, 1, 0, 1,
-0.6348264, -2.445107, -3.572164, 0.3568628, 1, 0, 1,
-0.6346309, 0.1787181, -1.231519, 0.3490196, 1, 0, 1,
-0.6297186, -1.611714, -2.452575, 0.345098, 1, 0, 1,
-0.6296092, 1.007427, -0.9208159, 0.3372549, 1, 0, 1,
-0.6226371, 1.251653, -0.6031824, 0.3333333, 1, 0, 1,
-0.621251, -1.575943, -2.757607, 0.3254902, 1, 0, 1,
-0.611598, 1.124208, 0.1404044, 0.3215686, 1, 0, 1,
-0.6068808, 0.21338, -2.257321, 0.3137255, 1, 0, 1,
-0.6066304, -0.9058022, -2.542746, 0.3098039, 1, 0, 1,
-0.6027536, 0.4715236, -0.1517897, 0.3019608, 1, 0, 1,
-0.602453, -0.07536913, -2.502963, 0.2941177, 1, 0, 1,
-0.6017028, -0.5386537, -1.603737, 0.2901961, 1, 0, 1,
-0.5988591, -1.716822, -4.600644, 0.282353, 1, 0, 1,
-0.5980458, 1.320509, 1.716085, 0.2784314, 1, 0, 1,
-0.5965825, 2.553216, -0.7645196, 0.2705882, 1, 0, 1,
-0.5956044, -0.1548778, -2.096285, 0.2666667, 1, 0, 1,
-0.5917946, 0.7889141, 0.1949873, 0.2588235, 1, 0, 1,
-0.591408, -1.259164, -2.115421, 0.254902, 1, 0, 1,
-0.5831625, 0.4284097, 0.9520398, 0.2470588, 1, 0, 1,
-0.5817959, 2.684731, -1.774904, 0.2431373, 1, 0, 1,
-0.5807238, 1.040194, -3.525891, 0.2352941, 1, 0, 1,
-0.5798482, 2.369577, -0.5975844, 0.2313726, 1, 0, 1,
-0.576659, -0.8640282, -1.915576, 0.2235294, 1, 0, 1,
-0.5740233, 1.280133, -0.5125168, 0.2196078, 1, 0, 1,
-0.5739529, -0.071557, -1.026688, 0.2117647, 1, 0, 1,
-0.5690219, 0.1040658, -1.708403, 0.2078431, 1, 0, 1,
-0.5684571, 0.00989631, -0.4812903, 0.2, 1, 0, 1,
-0.5668844, 0.1709894, -1.620887, 0.1921569, 1, 0, 1,
-0.5656086, 0.5067713, 0.3944918, 0.1882353, 1, 0, 1,
-0.5601095, -0.2147804, -2.863182, 0.1803922, 1, 0, 1,
-0.5595148, 0.6397088, -0.163092, 0.1764706, 1, 0, 1,
-0.5592836, 1.704732, -0.1832937, 0.1686275, 1, 0, 1,
-0.5566792, 2.020884, 0.6844141, 0.1647059, 1, 0, 1,
-0.5565544, 0.4445617, -3.03058, 0.1568628, 1, 0, 1,
-0.5525725, -0.2585836, -2.996977, 0.1529412, 1, 0, 1,
-0.551901, 0.2812759, -0.4477938, 0.145098, 1, 0, 1,
-0.5493992, -0.3247087, -1.872257, 0.1411765, 1, 0, 1,
-0.5488313, 0.2286844, -0.1729718, 0.1333333, 1, 0, 1,
-0.5465789, -1.075486, -4.147024, 0.1294118, 1, 0, 1,
-0.5424989, -1.456711, -3.318552, 0.1215686, 1, 0, 1,
-0.5403005, 0.01001314, -0.442428, 0.1176471, 1, 0, 1,
-0.5385305, 1.799237, 2.883675, 0.1098039, 1, 0, 1,
-0.537908, -1.630476, -5.683842, 0.1058824, 1, 0, 1,
-0.5352772, 0.3131689, -2.493103, 0.09803922, 1, 0, 1,
-0.5325478, 0.2704722, -0.2420524, 0.09019608, 1, 0, 1,
-0.530805, 0.4077987, 0.8352417, 0.08627451, 1, 0, 1,
-0.5280855, 0.376101, -3.505831, 0.07843138, 1, 0, 1,
-0.5245769, 0.3138854, -1.028439, 0.07450981, 1, 0, 1,
-0.522998, -1.051603, -3.271052, 0.06666667, 1, 0, 1,
-0.522188, 0.1713806, 0.531315, 0.0627451, 1, 0, 1,
-0.5181425, 1.658597, -1.469889, 0.05490196, 1, 0, 1,
-0.5140399, 0.5422935, -1.039489, 0.05098039, 1, 0, 1,
-0.5095153, -0.08781505, -1.895455, 0.04313726, 1, 0, 1,
-0.5054851, 0.5479072, -0.9075711, 0.03921569, 1, 0, 1,
-0.502595, 0.9956113, -1.478604, 0.03137255, 1, 0, 1,
-0.4951415, -0.2423406, -2.331371, 0.02745098, 1, 0, 1,
-0.4924149, 0.3543096, -0.2376454, 0.01960784, 1, 0, 1,
-0.4915959, -0.9221705, -1.456175, 0.01568628, 1, 0, 1,
-0.4913143, 0.2949556, -0.994444, 0.007843138, 1, 0, 1,
-0.4885972, 0.4062655, -1.190403, 0.003921569, 1, 0, 1,
-0.4868362, 0.7008197, -1.638954, 0, 1, 0.003921569, 1,
-0.4816937, -0.4861241, -3.047425, 0, 1, 0.01176471, 1,
-0.4647685, -0.3827106, -0.008087155, 0, 1, 0.01568628, 1,
-0.4627125, -0.2627577, 0.6778501, 0, 1, 0.02352941, 1,
-0.4599532, 0.8924009, 1.309591, 0, 1, 0.02745098, 1,
-0.4596345, 1.659104, -1.060551, 0, 1, 0.03529412, 1,
-0.4590528, -0.5094091, -1.8787, 0, 1, 0.03921569, 1,
-0.4589151, -0.03013286, -1.78615, 0, 1, 0.04705882, 1,
-0.4564608, -0.5988181, -2.462932, 0, 1, 0.05098039, 1,
-0.4531006, 0.966181, -0.06970359, 0, 1, 0.05882353, 1,
-0.4527583, 0.2021802, -0.617649, 0, 1, 0.0627451, 1,
-0.4502353, -0.331088, -3.372872, 0, 1, 0.07058824, 1,
-0.4494244, -1.010774, -1.355892, 0, 1, 0.07450981, 1,
-0.4469025, -1.017297, -2.409597, 0, 1, 0.08235294, 1,
-0.4467633, -0.6509496, -2.102102, 0, 1, 0.08627451, 1,
-0.4448232, 0.3347751, -0.9945665, 0, 1, 0.09411765, 1,
-0.4419072, -0.1692613, -2.881464, 0, 1, 0.1019608, 1,
-0.4371772, -1.48342, -3.182694, 0, 1, 0.1058824, 1,
-0.4354357, -1.876774, -4.173303, 0, 1, 0.1137255, 1,
-0.4329711, 1.591642, 1.398395, 0, 1, 0.1176471, 1,
-0.4310367, -2.031453, -1.205629, 0, 1, 0.1254902, 1,
-0.4301834, 1.068309, -0.463689, 0, 1, 0.1294118, 1,
-0.4286479, 1.73684, 0.02425952, 0, 1, 0.1372549, 1,
-0.4282646, -0.3027619, -3.441356, 0, 1, 0.1411765, 1,
-0.424515, -0.3344784, -2.380725, 0, 1, 0.1490196, 1,
-0.4185964, -0.1961899, -2.95288, 0, 1, 0.1529412, 1,
-0.4128036, -0.7947576, -1.187076, 0, 1, 0.1607843, 1,
-0.4067343, 0.3163747, 0.1200478, 0, 1, 0.1647059, 1,
-0.4051757, -0.1755951, -1.734819, 0, 1, 0.172549, 1,
-0.4018388, -0.9441529, -1.596883, 0, 1, 0.1764706, 1,
-0.400598, 0.2220898, -0.1210921, 0, 1, 0.1843137, 1,
-0.3973036, -1.036669, -2.562491, 0, 1, 0.1882353, 1,
-0.3888439, -0.948039, -2.330454, 0, 1, 0.1960784, 1,
-0.3788886, 0.2236402, -1.566525, 0, 1, 0.2039216, 1,
-0.3785318, 0.1996026, -1.137193, 0, 1, 0.2078431, 1,
-0.3785034, 0.3915358, -0.942551, 0, 1, 0.2156863, 1,
-0.3625624, 2.283623, -0.3673607, 0, 1, 0.2196078, 1,
-0.357869, 0.472231, -2.447198, 0, 1, 0.227451, 1,
-0.3536354, -0.7074343, -3.703488, 0, 1, 0.2313726, 1,
-0.3455353, 0.3808026, -0.9994562, 0, 1, 0.2392157, 1,
-0.3423855, 0.2444788, -0.8474551, 0, 1, 0.2431373, 1,
-0.3417364, 0.3706733, -2.184372, 0, 1, 0.2509804, 1,
-0.3378857, -1.319767, -3.118127, 0, 1, 0.254902, 1,
-0.3352571, -0.2307592, 0.1294603, 0, 1, 0.2627451, 1,
-0.3326707, -1.108071, -2.97777, 0, 1, 0.2666667, 1,
-0.3278389, 0.3977115, -0.7420122, 0, 1, 0.2745098, 1,
-0.3260615, -0.5301895, -2.76213, 0, 1, 0.2784314, 1,
-0.3197932, -0.5724488, -2.936265, 0, 1, 0.2862745, 1,
-0.3188694, 0.01153788, -2.020961, 0, 1, 0.2901961, 1,
-0.3177063, -0.2168978, -2.430369, 0, 1, 0.2980392, 1,
-0.31574, 1.251266, -2.869031, 0, 1, 0.3058824, 1,
-0.3138703, -0.7298767, -4.034848, 0, 1, 0.3098039, 1,
-0.3011076, -0.8501538, -1.049219, 0, 1, 0.3176471, 1,
-0.2928189, -0.5706928, -2.003812, 0, 1, 0.3215686, 1,
-0.2926671, -0.1034375, -2.141411, 0, 1, 0.3294118, 1,
-0.291557, -1.36177, -6.301414, 0, 1, 0.3333333, 1,
-0.289766, -0.4328026, -0.7824283, 0, 1, 0.3411765, 1,
-0.2896478, -0.02899885, -1.457345, 0, 1, 0.345098, 1,
-0.2854928, -0.5315971, -2.26346, 0, 1, 0.3529412, 1,
-0.2790423, 1.643215, 0.1373949, 0, 1, 0.3568628, 1,
-0.2785172, -1.135131, -0.8607932, 0, 1, 0.3647059, 1,
-0.2683481, 0.8547844, -1.320541, 0, 1, 0.3686275, 1,
-0.2629018, -0.4846412, -0.7254462, 0, 1, 0.3764706, 1,
-0.2586318, 0.1159566, -1.028001, 0, 1, 0.3803922, 1,
-0.2584999, -0.1299528, -2.088708, 0, 1, 0.3882353, 1,
-0.2542555, 0.06893364, -0.3131582, 0, 1, 0.3921569, 1,
-0.2522151, -0.4388486, -1.537575, 0, 1, 0.4, 1,
-0.2481605, -0.8764115, -2.729085, 0, 1, 0.4078431, 1,
-0.2460396, -0.7885832, -3.765823, 0, 1, 0.4117647, 1,
-0.2452825, -1.481478, -3.324391, 0, 1, 0.4196078, 1,
-0.2452524, -0.2244677, -2.499462, 0, 1, 0.4235294, 1,
-0.241852, 1.603724, -1.958677, 0, 1, 0.4313726, 1,
-0.2323298, 1.26239, -2.271008, 0, 1, 0.4352941, 1,
-0.2316746, -1.658808, -3.262273, 0, 1, 0.4431373, 1,
-0.231328, 0.07156652, -0.3120039, 0, 1, 0.4470588, 1,
-0.2264854, -0.1654915, -1.19477, 0, 1, 0.454902, 1,
-0.2263883, -0.4568991, -3.585637, 0, 1, 0.4588235, 1,
-0.2223685, 0.9664143, 0.08990854, 0, 1, 0.4666667, 1,
-0.2181524, -0.09430847, -1.661726, 0, 1, 0.4705882, 1,
-0.2161009, 1.305863, -1.361521, 0, 1, 0.4784314, 1,
-0.2156288, 1.985154, 1.530931, 0, 1, 0.4823529, 1,
-0.213738, 0.7726994, -0.7531025, 0, 1, 0.4901961, 1,
-0.2136901, 0.04951308, -2.259264, 0, 1, 0.4941176, 1,
-0.2086584, -0.6657414, -1.843251, 0, 1, 0.5019608, 1,
-0.2080266, -0.6782836, -1.062825, 0, 1, 0.509804, 1,
-0.207045, 1.764917, 1.022773, 0, 1, 0.5137255, 1,
-0.2064472, 1.772424, -0.1967962, 0, 1, 0.5215687, 1,
-0.1993299, 1.52289, -0.2067404, 0, 1, 0.5254902, 1,
-0.1986452, -0.618923, -2.148376, 0, 1, 0.5333334, 1,
-0.1978762, -0.1434499, -3.9256, 0, 1, 0.5372549, 1,
-0.1969918, -1.141533, -2.899889, 0, 1, 0.5450981, 1,
-0.1960886, 1.407853, -0.2760193, 0, 1, 0.5490196, 1,
-0.1949568, -0.7692043, -2.850173, 0, 1, 0.5568628, 1,
-0.1944214, -0.78921, -3.540141, 0, 1, 0.5607843, 1,
-0.1940728, -1.244569, -3.627522, 0, 1, 0.5686275, 1,
-0.1903369, 0.08022384, -3.406272, 0, 1, 0.572549, 1,
-0.190136, 0.06425951, -1.045276, 0, 1, 0.5803922, 1,
-0.1893189, -0.3766101, -2.048205, 0, 1, 0.5843138, 1,
-0.1790116, -1.590666, -2.485279, 0, 1, 0.5921569, 1,
-0.1788115, -0.5532584, -2.412038, 0, 1, 0.5960785, 1,
-0.1767441, -0.4552877, -1.72484, 0, 1, 0.6039216, 1,
-0.1764203, 2.069118, -0.1830678, 0, 1, 0.6117647, 1,
-0.1756182, -0.6041781, -3.899958, 0, 1, 0.6156863, 1,
-0.172026, 0.1191114, 0.004423364, 0, 1, 0.6235294, 1,
-0.1677047, -0.7609556, -3.001632, 0, 1, 0.627451, 1,
-0.1627782, -0.03386477, -1.75612, 0, 1, 0.6352941, 1,
-0.1625425, 1.187021, -0.1994118, 0, 1, 0.6392157, 1,
-0.1586391, -1.400398, -2.164581, 0, 1, 0.6470588, 1,
-0.1518049, 1.330686, 0.2626109, 0, 1, 0.6509804, 1,
-0.1491091, -1.391521, -3.921723, 0, 1, 0.6588235, 1,
-0.1450152, 1.144538, 0.4579436, 0, 1, 0.6627451, 1,
-0.143834, -0.8930782, -4.130754, 0, 1, 0.6705883, 1,
-0.139867, -0.3801488, -2.887578, 0, 1, 0.6745098, 1,
-0.1395061, 0.4467996, -0.401081, 0, 1, 0.682353, 1,
-0.1354976, -1.374576, -3.448828, 0, 1, 0.6862745, 1,
-0.1284637, -0.6512616, -4.212, 0, 1, 0.6941177, 1,
-0.12804, 1.889657, 1.462214, 0, 1, 0.7019608, 1,
-0.1244, 0.05969193, -1.09737, 0, 1, 0.7058824, 1,
-0.1239357, 2.08635, -1.610745, 0, 1, 0.7137255, 1,
-0.1238527, -0.8892292, -3.409097, 0, 1, 0.7176471, 1,
-0.1118321, -0.4683459, -2.613922, 0, 1, 0.7254902, 1,
-0.1093651, -0.2196258, -2.926449, 0, 1, 0.7294118, 1,
-0.1066156, -0.5221607, -1.732069, 0, 1, 0.7372549, 1,
-0.1057512, 0.6358696, 0.717453, 0, 1, 0.7411765, 1,
-0.1037369, 0.1934008, 0.2093992, 0, 1, 0.7490196, 1,
-0.09424486, 1.63637, 2.467022, 0, 1, 0.7529412, 1,
-0.09140112, -0.1684315, -2.55141, 0, 1, 0.7607843, 1,
-0.0888035, 0.3317024, -0.3844703, 0, 1, 0.7647059, 1,
-0.08659438, -1.126643, -3.299855, 0, 1, 0.772549, 1,
-0.07694328, -1.287424, -3.778561, 0, 1, 0.7764706, 1,
-0.07432868, -0.3170412, -2.256982, 0, 1, 0.7843137, 1,
-0.07393664, 1.012344, 0.5008146, 0, 1, 0.7882353, 1,
-0.0719615, -0.4749403, -2.411262, 0, 1, 0.7960784, 1,
-0.0712866, 0.3395497, -2.208075, 0, 1, 0.8039216, 1,
-0.07039347, -1.392631, -2.191223, 0, 1, 0.8078431, 1,
-0.06902954, -0.8594122, -3.147028, 0, 1, 0.8156863, 1,
-0.06834168, 0.1818523, 0.7211588, 0, 1, 0.8196079, 1,
-0.0678734, -0.9325462, -4.037155, 0, 1, 0.827451, 1,
-0.06531639, 0.4892527, -2.313201, 0, 1, 0.8313726, 1,
-0.06487387, 1.305882, -1.540219, 0, 1, 0.8392157, 1,
-0.06064223, -0.2394676, -3.294675, 0, 1, 0.8431373, 1,
-0.06020137, 0.02155455, -1.443134, 0, 1, 0.8509804, 1,
-0.06009178, 0.6990088, -0.6977099, 0, 1, 0.854902, 1,
-0.05597278, -1.689826, -2.700609, 0, 1, 0.8627451, 1,
-0.04834939, -0.7562492, -3.103193, 0, 1, 0.8666667, 1,
-0.04583493, -0.805631, -3.189824, 0, 1, 0.8745098, 1,
-0.04572845, 0.3347338, -0.1961059, 0, 1, 0.8784314, 1,
-0.0435978, 0.3788742, 0.4503044, 0, 1, 0.8862745, 1,
-0.03391892, -0.9712111, -3.504524, 0, 1, 0.8901961, 1,
-0.02956269, -0.1868836, -4.819371, 0, 1, 0.8980392, 1,
-0.02668945, 1.212651, 0.07537851, 0, 1, 0.9058824, 1,
-0.02631074, 0.4804028, -0.8962865, 0, 1, 0.9098039, 1,
-0.02596304, -0.4712595, -3.03506, 0, 1, 0.9176471, 1,
-0.0254724, -1.192735, -2.253565, 0, 1, 0.9215686, 1,
-0.02417796, -1.550786, -3.033745, 0, 1, 0.9294118, 1,
-0.02236793, 0.01553852, -1.424137, 0, 1, 0.9333333, 1,
-0.0165673, -0.4187726, -1.719568, 0, 1, 0.9411765, 1,
-0.0148497, 1.689497, -0.1174622, 0, 1, 0.945098, 1,
-0.01444651, 2.135266, -0.1041865, 0, 1, 0.9529412, 1,
-0.007616353, -0.4737023, -3.013494, 0, 1, 0.9568627, 1,
-0.006761288, 0.2474423, -1.212458, 0, 1, 0.9647059, 1,
-0.004348867, -0.1552279, -2.839675, 0, 1, 0.9686275, 1,
-0.003180495, -0.4857742, -3.3756, 0, 1, 0.9764706, 1,
-0.002958265, 1.787889, 0.7415012, 0, 1, 0.9803922, 1,
0.0001646202, 1.972907, -0.8092423, 0, 1, 0.9882353, 1,
0.001010216, 0.8616357, 1.905695, 0, 1, 0.9921569, 1,
0.002492949, 0.8343057, 1.338795, 0, 1, 1, 1,
0.006241781, 1.131733, -1.71983, 0, 0.9921569, 1, 1,
0.009162225, -0.04739112, 1.99086, 0, 0.9882353, 1, 1,
0.00916841, 0.5924754, 0.5121661, 0, 0.9803922, 1, 1,
0.01741143, 0.2910863, 1.030277, 0, 0.9764706, 1, 1,
0.01934518, -1.639603, 2.521568, 0, 0.9686275, 1, 1,
0.02279048, 0.03464607, 0.324546, 0, 0.9647059, 1, 1,
0.02305058, 1.3709, -0.6372187, 0, 0.9568627, 1, 1,
0.02395445, -0.1324778, 1.858841, 0, 0.9529412, 1, 1,
0.02510188, -0.1010393, 3.632838, 0, 0.945098, 1, 1,
0.02705986, 0.8251818, -0.09520253, 0, 0.9411765, 1, 1,
0.02813357, -0.6268449, 2.512057, 0, 0.9333333, 1, 1,
0.0290191, 0.5457977, -1.72896, 0, 0.9294118, 1, 1,
0.03208745, -0.01175201, 1.168774, 0, 0.9215686, 1, 1,
0.0327787, -0.3541501, 3.283393, 0, 0.9176471, 1, 1,
0.03351296, -0.4211157, 2.661309, 0, 0.9098039, 1, 1,
0.0339394, 0.9436792, 0.1036497, 0, 0.9058824, 1, 1,
0.04580395, 0.03558907, 1.022899, 0, 0.8980392, 1, 1,
0.0558131, 0.3198735, 1.283588, 0, 0.8901961, 1, 1,
0.05596142, -1.190679, 3.354977, 0, 0.8862745, 1, 1,
0.05725763, -2.017916, 1.375315, 0, 0.8784314, 1, 1,
0.06416334, -0.791142, 2.113324, 0, 0.8745098, 1, 1,
0.07495546, 0.869295, 0.5070714, 0, 0.8666667, 1, 1,
0.07975402, 1.279915, 0.966737, 0, 0.8627451, 1, 1,
0.08171948, -1.451913, 4.838096, 0, 0.854902, 1, 1,
0.08832957, -0.6636506, 3.915318, 0, 0.8509804, 1, 1,
0.09297122, 0.1379154, 1.737715, 0, 0.8431373, 1, 1,
0.09506107, 1.516764, 0.599879, 0, 0.8392157, 1, 1,
0.09691601, -1.0978, 3.897031, 0, 0.8313726, 1, 1,
0.09715975, -1.505473, 0.8635219, 0, 0.827451, 1, 1,
0.1006812, -0.8219942, 3.100336, 0, 0.8196079, 1, 1,
0.1026172, 0.0308035, 0.1078132, 0, 0.8156863, 1, 1,
0.106941, 1.077944, -3.062193, 0, 0.8078431, 1, 1,
0.1075707, -0.467294, 3.958488, 0, 0.8039216, 1, 1,
0.1136352, -0.1849821, 2.320292, 0, 0.7960784, 1, 1,
0.1145863, -0.03688417, 0.6781828, 0, 0.7882353, 1, 1,
0.1155991, 1.24132, 1.456496, 0, 0.7843137, 1, 1,
0.1160774, -0.6218173, 3.689055, 0, 0.7764706, 1, 1,
0.1199169, -0.6328876, 1.934382, 0, 0.772549, 1, 1,
0.1209561, 1.593734, -0.04618398, 0, 0.7647059, 1, 1,
0.1243663, 0.1065878, 1.195607, 0, 0.7607843, 1, 1,
0.1349624, -1.022643, 3.637093, 0, 0.7529412, 1, 1,
0.137886, -0.6494887, 3.917064, 0, 0.7490196, 1, 1,
0.1380768, 2.248816, 1.310703, 0, 0.7411765, 1, 1,
0.1381307, -0.8671463, 3.061153, 0, 0.7372549, 1, 1,
0.1391282, -1.700722, 4.574276, 0, 0.7294118, 1, 1,
0.1442572, -1.507975, 3.254308, 0, 0.7254902, 1, 1,
0.148622, -0.2789826, 3.892881, 0, 0.7176471, 1, 1,
0.1488951, -1.130761, 1.595682, 0, 0.7137255, 1, 1,
0.1497763, 1.53346, -0.7813725, 0, 0.7058824, 1, 1,
0.1563809, 1.092799, 0.44994, 0, 0.6980392, 1, 1,
0.1576697, 0.418349, -0.5292868, 0, 0.6941177, 1, 1,
0.1601139, 0.681556, -0.5965657, 0, 0.6862745, 1, 1,
0.1618775, -1.620858, 2.387533, 0, 0.682353, 1, 1,
0.1648081, -0.5697412, 2.541686, 0, 0.6745098, 1, 1,
0.1679351, -0.6510659, 4.60266, 0, 0.6705883, 1, 1,
0.1689904, -0.4217904, 1.994762, 0, 0.6627451, 1, 1,
0.1764426, 0.630471, -0.9435579, 0, 0.6588235, 1, 1,
0.1767577, 1.539621, 0.7620524, 0, 0.6509804, 1, 1,
0.1801791, 0.540853, -0.09970253, 0, 0.6470588, 1, 1,
0.1816537, 1.603074, 0.7115136, 0, 0.6392157, 1, 1,
0.181993, -0.8668069, 2.364476, 0, 0.6352941, 1, 1,
0.1828764, 0.9744346, -0.4519415, 0, 0.627451, 1, 1,
0.1862646, 0.1685207, 0.5588015, 0, 0.6235294, 1, 1,
0.1868909, 0.2411552, 0.8295258, 0, 0.6156863, 1, 1,
0.1883805, 1.47944, 1.343088, 0, 0.6117647, 1, 1,
0.1890598, -0.3420666, 3.231575, 0, 0.6039216, 1, 1,
0.1892006, 0.2520936, 0.8299664, 0, 0.5960785, 1, 1,
0.1895681, -0.6641394, 2.757829, 0, 0.5921569, 1, 1,
0.1905902, 0.5946299, -0.9509848, 0, 0.5843138, 1, 1,
0.1923463, 1.367119, -0.0109415, 0, 0.5803922, 1, 1,
0.1926283, -0.5296639, 2.281385, 0, 0.572549, 1, 1,
0.1945765, -0.1953806, 2.18827, 0, 0.5686275, 1, 1,
0.1960254, -0.3687437, 1.777816, 0, 0.5607843, 1, 1,
0.1992804, -1.496783, 2.979935, 0, 0.5568628, 1, 1,
0.2014192, 0.06871457, 1.964651, 0, 0.5490196, 1, 1,
0.2049257, -0.8303069, 2.297482, 0, 0.5450981, 1, 1,
0.2063881, -0.7038931, 2.359174, 0, 0.5372549, 1, 1,
0.2107354, -0.2101903, 3.702694, 0, 0.5333334, 1, 1,
0.2122976, -0.4499642, 3.398308, 0, 0.5254902, 1, 1,
0.2148462, -0.1050832, 1.324409, 0, 0.5215687, 1, 1,
0.2149428, 0.4815367, -0.1499511, 0, 0.5137255, 1, 1,
0.2176106, 0.8648739, 0.6421469, 0, 0.509804, 1, 1,
0.220546, 1.082574, 0.4254358, 0, 0.5019608, 1, 1,
0.224626, -0.8047938, 3.254646, 0, 0.4941176, 1, 1,
0.225118, 0.6141742, 1.065514, 0, 0.4901961, 1, 1,
0.2299439, -0.6157877, 4.151246, 0, 0.4823529, 1, 1,
0.2302657, -1.623173, 4.446315, 0, 0.4784314, 1, 1,
0.2329803, -1.398046, 2.646961, 0, 0.4705882, 1, 1,
0.2348929, -0.2832473, 1.915785, 0, 0.4666667, 1, 1,
0.2367783, 2.190554, 0.3156962, 0, 0.4588235, 1, 1,
0.238297, 0.5922182, 2.24038, 0, 0.454902, 1, 1,
0.2402446, 1.660968, 0.03350872, 0, 0.4470588, 1, 1,
0.2418135, -1.6092, 1.676177, 0, 0.4431373, 1, 1,
0.2436852, -0.544086, 2.355893, 0, 0.4352941, 1, 1,
0.249575, 0.9187184, -1.508112, 0, 0.4313726, 1, 1,
0.2505663, 1.569576, 0.6887467, 0, 0.4235294, 1, 1,
0.2510379, 1.469403, -0.8782359, 0, 0.4196078, 1, 1,
0.2554306, 1.975989, 2.657292, 0, 0.4117647, 1, 1,
0.2623468, -0.4560486, 1.593446, 0, 0.4078431, 1, 1,
0.265561, -1.211679, 3.752059, 0, 0.4, 1, 1,
0.2702414, -0.283253, 2.404929, 0, 0.3921569, 1, 1,
0.2763036, -0.2247936, -0.01054166, 0, 0.3882353, 1, 1,
0.2802685, -1.23998, 4.135684, 0, 0.3803922, 1, 1,
0.2805961, -0.5328413, 2.428862, 0, 0.3764706, 1, 1,
0.288001, 0.6664292, 0.5207531, 0, 0.3686275, 1, 1,
0.288091, 0.3961212, 2.100827, 0, 0.3647059, 1, 1,
0.2897683, -0.1832102, 1.056872, 0, 0.3568628, 1, 1,
0.2980412, -0.05614177, 1.639082, 0, 0.3529412, 1, 1,
0.2993614, -0.04095318, 0.5483251, 0, 0.345098, 1, 1,
0.2993769, -0.341296, 2.249913, 0, 0.3411765, 1, 1,
0.3007998, 0.399323, -1.442015, 0, 0.3333333, 1, 1,
0.3027812, -0.4959119, 2.277148, 0, 0.3294118, 1, 1,
0.3049577, -1.343446, 3.544593, 0, 0.3215686, 1, 1,
0.3082053, -0.1950917, 2.257461, 0, 0.3176471, 1, 1,
0.3087145, 0.09471027, 0.7207521, 0, 0.3098039, 1, 1,
0.3095672, 0.626222, 1.167685, 0, 0.3058824, 1, 1,
0.3120203, 1.263321, 1.124593, 0, 0.2980392, 1, 1,
0.313958, -0.9766493, 2.143194, 0, 0.2901961, 1, 1,
0.3158771, -0.9412155, 3.068201, 0, 0.2862745, 1, 1,
0.3160555, 1.146415, 1.562985, 0, 0.2784314, 1, 1,
0.3201177, -0.6862736, 4.45789, 0, 0.2745098, 1, 1,
0.324067, -0.1562309, 1.131296, 0, 0.2666667, 1, 1,
0.3264478, 2.343849, -1.388284, 0, 0.2627451, 1, 1,
0.3278342, -0.2492741, 1.921557, 0, 0.254902, 1, 1,
0.3302368, 0.6849973, -2.455805, 0, 0.2509804, 1, 1,
0.3314596, -0.8031447, 1.587482, 0, 0.2431373, 1, 1,
0.3346587, -0.5704495, 0.8621682, 0, 0.2392157, 1, 1,
0.3356934, -0.7390916, 2.589305, 0, 0.2313726, 1, 1,
0.3385962, 0.5842934, 1.100334, 0, 0.227451, 1, 1,
0.3395461, 2.031536, 0.1899502, 0, 0.2196078, 1, 1,
0.3414584, -1.000145, 2.878291, 0, 0.2156863, 1, 1,
0.3420691, 0.04829504, 0.2741006, 0, 0.2078431, 1, 1,
0.3439001, -0.611676, 2.109312, 0, 0.2039216, 1, 1,
0.3439485, -0.0339513, 1.222594, 0, 0.1960784, 1, 1,
0.345697, -1.144076, 3.591997, 0, 0.1882353, 1, 1,
0.3462397, 0.3977768, 0.7142272, 0, 0.1843137, 1, 1,
0.3507926, -0.8224095, 1.938861, 0, 0.1764706, 1, 1,
0.3526546, -0.4954591, 1.652888, 0, 0.172549, 1, 1,
0.3559626, -2.832292, 2.5154, 0, 0.1647059, 1, 1,
0.3570609, -0.2115679, 2.730716, 0, 0.1607843, 1, 1,
0.3571716, 0.2133397, 0.08540799, 0, 0.1529412, 1, 1,
0.359639, -0.8402398, 4.362367, 0, 0.1490196, 1, 1,
0.3605008, 0.5231371, 0.03024253, 0, 0.1411765, 1, 1,
0.3621053, -0.2430579, 1.854365, 0, 0.1372549, 1, 1,
0.3640539, -0.7158715, 2.231578, 0, 0.1294118, 1, 1,
0.3702156, 1.74659, -0.3500139, 0, 0.1254902, 1, 1,
0.370308, 2.438384, -0.2249272, 0, 0.1176471, 1, 1,
0.3747286, 0.5506632, -0.3570762, 0, 0.1137255, 1, 1,
0.3814321, 0.6004665, 0.8826505, 0, 0.1058824, 1, 1,
0.3822672, -0.7512359, 3.540555, 0, 0.09803922, 1, 1,
0.3827221, -0.9007715, 2.538067, 0, 0.09411765, 1, 1,
0.3877233, 0.5015332, -0.4492132, 0, 0.08627451, 1, 1,
0.3908145, -0.2679578, 3.525146, 0, 0.08235294, 1, 1,
0.393704, 0.3860343, -0.1857429, 0, 0.07450981, 1, 1,
0.3975776, 1.243914, -0.2206374, 0, 0.07058824, 1, 1,
0.3978797, 0.05442346, 0.7018288, 0, 0.0627451, 1, 1,
0.3981095, -0.585997, 2.792305, 0, 0.05882353, 1, 1,
0.3990149, 0.1777038, 1.067409, 0, 0.05098039, 1, 1,
0.4044367, -0.8804009, 2.850367, 0, 0.04705882, 1, 1,
0.4052033, -0.5476388, 2.431156, 0, 0.03921569, 1, 1,
0.4101526, -1.676649, 1.953679, 0, 0.03529412, 1, 1,
0.4146651, -1.743855, 3.469815, 0, 0.02745098, 1, 1,
0.4188252, -0.2805215, 1.821977, 0, 0.02352941, 1, 1,
0.4191304, -0.06503583, 1.716313, 0, 0.01568628, 1, 1,
0.4192614, 0.1364633, 0.8405492, 0, 0.01176471, 1, 1,
0.4235872, 0.8091319, -0.5384432, 0, 0.003921569, 1, 1,
0.4286293, 0.8839225, 1.503704, 0.003921569, 0, 1, 1,
0.4437982, -0.3121665, 0.5865656, 0.007843138, 0, 1, 1,
0.448585, -0.894389, 2.475981, 0.01568628, 0, 1, 1,
0.4492119, -0.1625182, 0.4374905, 0.01960784, 0, 1, 1,
0.4493118, -1.160321, 2.473464, 0.02745098, 0, 1, 1,
0.4562157, -0.2204675, 1.239761, 0.03137255, 0, 1, 1,
0.4563237, -0.6554822, 1.108489, 0.03921569, 0, 1, 1,
0.4568721, 0.1126212, 4.040426, 0.04313726, 0, 1, 1,
0.4583026, 0.6505479, -0.04467812, 0.05098039, 0, 1, 1,
0.4591527, -0.4885244, 2.674364, 0.05490196, 0, 1, 1,
0.4607047, -0.8041323, 2.017875, 0.0627451, 0, 1, 1,
0.468785, -0.8814836, 3.696006, 0.06666667, 0, 1, 1,
0.4715053, 0.6676243, 1.209575, 0.07450981, 0, 1, 1,
0.4779741, 0.4791532, -0.6035017, 0.07843138, 0, 1, 1,
0.4790727, 1.178639, -0.9243439, 0.08627451, 0, 1, 1,
0.4797652, -0.2900034, 0.6651657, 0.09019608, 0, 1, 1,
0.4816892, 1.233435, 0.01081061, 0.09803922, 0, 1, 1,
0.484133, 0.1617673, 1.137245, 0.1058824, 0, 1, 1,
0.4847729, 0.6355631, 0.4907064, 0.1098039, 0, 1, 1,
0.4886207, 0.1782123, 1.880969, 0.1176471, 0, 1, 1,
0.4889448, -0.2572996, -0.09746335, 0.1215686, 0, 1, 1,
0.4904748, 0.1343514, 1.393175, 0.1294118, 0, 1, 1,
0.4914674, 1.354582, -0.9707628, 0.1333333, 0, 1, 1,
0.4952593, -0.1091723, 1.884246, 0.1411765, 0, 1, 1,
0.4952932, -0.5691993, 3.352801, 0.145098, 0, 1, 1,
0.4991043, 0.1535009, 2.167295, 0.1529412, 0, 1, 1,
0.4995203, 0.7881837, 0.6694611, 0.1568628, 0, 1, 1,
0.500909, 0.6028362, 1.83828, 0.1647059, 0, 1, 1,
0.5009929, 0.2017978, -1.143376, 0.1686275, 0, 1, 1,
0.5028383, -0.1249843, 2.50485, 0.1764706, 0, 1, 1,
0.5100955, 0.4295409, -0.264772, 0.1803922, 0, 1, 1,
0.5112988, 0.3925512, 0.5862103, 0.1882353, 0, 1, 1,
0.511435, 0.05224743, 1.219367, 0.1921569, 0, 1, 1,
0.5158703, 0.2820958, 1.083758, 0.2, 0, 1, 1,
0.5207852, 1.304716, -0.4336734, 0.2078431, 0, 1, 1,
0.5229065, 0.5583524, 1.776709, 0.2117647, 0, 1, 1,
0.5266105, 1.285786, 1.577456, 0.2196078, 0, 1, 1,
0.5338447, -2.287274, 1.678583, 0.2235294, 0, 1, 1,
0.5400404, 0.1479092, 0.7751612, 0.2313726, 0, 1, 1,
0.543997, 1.523427, -1.877633, 0.2352941, 0, 1, 1,
0.5478714, 0.4056952, 1.631653, 0.2431373, 0, 1, 1,
0.5552776, 0.7940407, 1.66381, 0.2470588, 0, 1, 1,
0.5583324, 0.636477, 0.1486773, 0.254902, 0, 1, 1,
0.5595127, 0.654232, -0.6315447, 0.2588235, 0, 1, 1,
0.5666289, 0.5785061, 1.703176, 0.2666667, 0, 1, 1,
0.5739411, -0.1280071, 0.4129072, 0.2705882, 0, 1, 1,
0.5742766, -0.5428972, 1.328298, 0.2784314, 0, 1, 1,
0.5752593, -1.171746, 2.781266, 0.282353, 0, 1, 1,
0.5754505, -0.1013878, 0.3464789, 0.2901961, 0, 1, 1,
0.5762755, -0.1263183, 2.684668, 0.2941177, 0, 1, 1,
0.5778309, -0.6252714, 1.04036, 0.3019608, 0, 1, 1,
0.5825813, 0.1193682, 2.027014, 0.3098039, 0, 1, 1,
0.5859517, -1.153389, 3.006393, 0.3137255, 0, 1, 1,
0.5904784, 0.2768313, 1.981341, 0.3215686, 0, 1, 1,
0.5907958, 0.8205723, 0.4268838, 0.3254902, 0, 1, 1,
0.5932003, -0.257783, 1.679698, 0.3333333, 0, 1, 1,
0.5955092, -0.2557275, 3.076137, 0.3372549, 0, 1, 1,
0.5982167, 0.2333412, 1.155047, 0.345098, 0, 1, 1,
0.599403, -0.4182181, 1.301954, 0.3490196, 0, 1, 1,
0.6012815, 0.4072607, -0.3533501, 0.3568628, 0, 1, 1,
0.6036794, -0.8611931, 1.46896, 0.3607843, 0, 1, 1,
0.6042336, -0.3919694, 3.149122, 0.3686275, 0, 1, 1,
0.6048681, -0.08946439, 1.24193, 0.372549, 0, 1, 1,
0.6059725, -1.021451, 1.519197, 0.3803922, 0, 1, 1,
0.6060199, 1.220463, 1.109122, 0.3843137, 0, 1, 1,
0.6157937, 1.14917, 0.3074405, 0.3921569, 0, 1, 1,
0.6187397, -0.8182862, 2.781281, 0.3960784, 0, 1, 1,
0.6187727, -1.33541, 3.220966, 0.4039216, 0, 1, 1,
0.6214634, -1.496572, 2.747476, 0.4117647, 0, 1, 1,
0.6240953, 0.2848521, -0.1481025, 0.4156863, 0, 1, 1,
0.6259773, 0.6327164, -0.08260377, 0.4235294, 0, 1, 1,
0.6273443, 1.061726, 0.4681528, 0.427451, 0, 1, 1,
0.6283405, -0.06717139, 2.628697, 0.4352941, 0, 1, 1,
0.6301562, -0.1251369, 1.060155, 0.4392157, 0, 1, 1,
0.6355956, -0.2364789, 1.83865, 0.4470588, 0, 1, 1,
0.6463312, 0.3211291, 0.3696966, 0.4509804, 0, 1, 1,
0.6468266, -0.5560941, 1.644767, 0.4588235, 0, 1, 1,
0.6512845, -1.413565, 2.48292, 0.4627451, 0, 1, 1,
0.6517251, -0.7056295, 1.936355, 0.4705882, 0, 1, 1,
0.6523448, 1.413678, 0.8678794, 0.4745098, 0, 1, 1,
0.659454, -0.5462524, 1.738498, 0.4823529, 0, 1, 1,
0.6647452, 0.7447391, 1.003501, 0.4862745, 0, 1, 1,
0.6654094, 1.216431, -2.249713, 0.4941176, 0, 1, 1,
0.6698619, -0.2722287, 2.422541, 0.5019608, 0, 1, 1,
0.6714207, -0.7929087, 2.44962, 0.5058824, 0, 1, 1,
0.672424, -0.7698137, 2.172585, 0.5137255, 0, 1, 1,
0.6727169, -1.027305, 3.969054, 0.5176471, 0, 1, 1,
0.6743305, -0.3242522, 1.633809, 0.5254902, 0, 1, 1,
0.6746042, -0.3093444, 1.822834, 0.5294118, 0, 1, 1,
0.6765391, 0.593978, 2.538072, 0.5372549, 0, 1, 1,
0.6862877, -1.372547, 3.445887, 0.5411765, 0, 1, 1,
0.6914645, -1.630239, 2.677418, 0.5490196, 0, 1, 1,
0.6967714, 0.0339583, 3.234267, 0.5529412, 0, 1, 1,
0.6980692, 2.891768, 0.4083318, 0.5607843, 0, 1, 1,
0.6985322, 0.6869029, 0.8147148, 0.5647059, 0, 1, 1,
0.6996636, -2.534763, 3.589619, 0.572549, 0, 1, 1,
0.7032408, -0.3569553, 2.794168, 0.5764706, 0, 1, 1,
0.703635, -0.892063, 1.871732, 0.5843138, 0, 1, 1,
0.7037196, -1.054739, 2.524248, 0.5882353, 0, 1, 1,
0.703805, 0.3994512, 1.789999, 0.5960785, 0, 1, 1,
0.7051019, 0.8429571, 1.668175, 0.6039216, 0, 1, 1,
0.7071159, -1.341676, 3.785249, 0.6078432, 0, 1, 1,
0.7123076, -1.263576, 1.547131, 0.6156863, 0, 1, 1,
0.7161388, -2.673061, 4.088126, 0.6196079, 0, 1, 1,
0.7186955, 0.7411702, 1.297477, 0.627451, 0, 1, 1,
0.7232885, -2.283702, 3.439309, 0.6313726, 0, 1, 1,
0.7281922, -0.2026918, 3.310202, 0.6392157, 0, 1, 1,
0.74381, 0.8524222, -0.08980579, 0.6431373, 0, 1, 1,
0.7472985, -0.2560076, 2.136829, 0.6509804, 0, 1, 1,
0.7477346, 1.111066, 0.07803015, 0.654902, 0, 1, 1,
0.7483245, -0.2494065, 0.06404685, 0.6627451, 0, 1, 1,
0.7539629, 0.7668369, 1.058424, 0.6666667, 0, 1, 1,
0.7602095, -0.5277846, 2.75713, 0.6745098, 0, 1, 1,
0.7632163, -0.1026912, 2.103237, 0.6784314, 0, 1, 1,
0.7646192, 0.6208711, 2.709787, 0.6862745, 0, 1, 1,
0.7697873, -0.6577474, 4.955741, 0.6901961, 0, 1, 1,
0.7700233, -0.6404745, 1.139393, 0.6980392, 0, 1, 1,
0.7727599, -0.416066, 2.928801, 0.7058824, 0, 1, 1,
0.77356, -1.472678, 2.867672, 0.7098039, 0, 1, 1,
0.7752537, -0.4990044, 2.183475, 0.7176471, 0, 1, 1,
0.7778543, -0.6003407, 1.858565, 0.7215686, 0, 1, 1,
0.7802629, 1.099926, 1.057818, 0.7294118, 0, 1, 1,
0.7966773, -2.984174, 3.782041, 0.7333333, 0, 1, 1,
0.8016554, 0.313345, -0.2967792, 0.7411765, 0, 1, 1,
0.8031849, -1.048049, 1.774429, 0.7450981, 0, 1, 1,
0.8040524, -0.8071153, 1.752837, 0.7529412, 0, 1, 1,
0.80709, -0.7332212, 1.762465, 0.7568628, 0, 1, 1,
0.811865, 0.2402704, 0.3578681, 0.7647059, 0, 1, 1,
0.8154576, -2.608176, 2.196409, 0.7686275, 0, 1, 1,
0.8172802, 0.9493564, 0.3087696, 0.7764706, 0, 1, 1,
0.8250996, -0.3425274, 2.578509, 0.7803922, 0, 1, 1,
0.8335425, -1.046662, 3.362467, 0.7882353, 0, 1, 1,
0.8354458, 1.670937, -0.03400119, 0.7921569, 0, 1, 1,
0.8370646, 1.292441, 2.315425, 0.8, 0, 1, 1,
0.8382938, -0.254859, 1.436419, 0.8078431, 0, 1, 1,
0.8493947, 1.390432, 0.3865889, 0.8117647, 0, 1, 1,
0.8521526, 0.8691206, -0.267134, 0.8196079, 0, 1, 1,
0.8556195, 0.5047226, 0.2651846, 0.8235294, 0, 1, 1,
0.8614489, 0.6346498, 1.634359, 0.8313726, 0, 1, 1,
0.8621936, 0.6422568, 1.037558, 0.8352941, 0, 1, 1,
0.8647671, 2.045251, 0.6122742, 0.8431373, 0, 1, 1,
0.8743216, -1.614468, 3.493649, 0.8470588, 0, 1, 1,
0.8804681, -0.6979787, 1.833058, 0.854902, 0, 1, 1,
0.8852823, 0.32783, -0.4359046, 0.8588235, 0, 1, 1,
0.8863997, -0.7076694, 2.161787, 0.8666667, 0, 1, 1,
0.8894973, 0.5539428, 1.939928, 0.8705882, 0, 1, 1,
0.8941596, -1.390618, 1.544892, 0.8784314, 0, 1, 1,
0.8967609, 0.4273836, 1.15597, 0.8823529, 0, 1, 1,
0.8970674, 0.7777535, 0.06280248, 0.8901961, 0, 1, 1,
0.8983448, -1.476102, 3.227094, 0.8941177, 0, 1, 1,
0.9010499, -0.6579825, 3.259009, 0.9019608, 0, 1, 1,
0.9023395, 0.3949863, 0.626528, 0.9098039, 0, 1, 1,
0.9027133, 0.7975122, 0.6370837, 0.9137255, 0, 1, 1,
0.9062657, -0.3716771, 1.244881, 0.9215686, 0, 1, 1,
0.9089265, 1.034918, 2.391177, 0.9254902, 0, 1, 1,
0.9092031, -1.748848, 0.2011545, 0.9333333, 0, 1, 1,
0.9102392, 0.7692623, 1.388598, 0.9372549, 0, 1, 1,
0.9143183, 1.077016, 0.8371306, 0.945098, 0, 1, 1,
0.9326164, 0.7158126, -0.5215044, 0.9490196, 0, 1, 1,
0.9400216, -0.8853892, 2.711217, 0.9568627, 0, 1, 1,
0.9430894, 0.1269213, -0.1812334, 0.9607843, 0, 1, 1,
0.9439049, 0.02768905, 0.4778531, 0.9686275, 0, 1, 1,
0.95135, 0.6808662, 1.688316, 0.972549, 0, 1, 1,
0.9536328, 0.667943, 1.418861, 0.9803922, 0, 1, 1,
0.9564531, -0.4035572, 1.241671, 0.9843137, 0, 1, 1,
0.9589539, 0.02863839, 1.362632, 0.9921569, 0, 1, 1,
0.9608096, 0.4671027, 0.4541442, 0.9960784, 0, 1, 1,
0.9608898, -1.014208, 1.712838, 1, 0, 0.9960784, 1,
0.963459, 0.07333403, 2.846601, 1, 0, 0.9882353, 1,
0.965673, 0.150267, 0.8616987, 1, 0, 0.9843137, 1,
0.966392, 0.5691053, 1.975865, 1, 0, 0.9764706, 1,
0.9665735, -0.2273811, 2.617908, 1, 0, 0.972549, 1,
0.9696482, -1.653424, 3.95787, 1, 0, 0.9647059, 1,
0.9730967, -0.5542996, 2.712168, 1, 0, 0.9607843, 1,
0.9871189, -0.7977709, 1.804143, 1, 0, 0.9529412, 1,
0.9886843, -1.439894, 3.635053, 1, 0, 0.9490196, 1,
0.9912312, 1.959237, -1.007717, 1, 0, 0.9411765, 1,
1.000352, 0.647567, -0.3268904, 1, 0, 0.9372549, 1,
1.001322, 1.866221, 0.7508215, 1, 0, 0.9294118, 1,
1.002882, -0.4310755, 1.194686, 1, 0, 0.9254902, 1,
1.003238, -0.9588523, 3.367419, 1, 0, 0.9176471, 1,
1.009904, 1.001535, -0.4235708, 1, 0, 0.9137255, 1,
1.01112, 2.093345, 1.865857, 1, 0, 0.9058824, 1,
1.01134, 0.6825971, 0.1169637, 1, 0, 0.9019608, 1,
1.016406, -0.1307779, 3.26162, 1, 0, 0.8941177, 1,
1.021822, -1.442996, 4.4295, 1, 0, 0.8862745, 1,
1.022679, 0.885077, 0.273229, 1, 0, 0.8823529, 1,
1.024158, -0.1305917, 1.816149, 1, 0, 0.8745098, 1,
1.026986, -0.276078, 0.7855738, 1, 0, 0.8705882, 1,
1.032553, 0.8230392, 2.09462, 1, 0, 0.8627451, 1,
1.035685, 0.8437027, 1.598307, 1, 0, 0.8588235, 1,
1.042411, -0.6622086, 2.749551, 1, 0, 0.8509804, 1,
1.045915, -1.389874, 3.375869, 1, 0, 0.8470588, 1,
1.046399, -0.4079632, 1.72567, 1, 0, 0.8392157, 1,
1.050335, 0.1503638, 1.416174, 1, 0, 0.8352941, 1,
1.050791, 1.364731, 0.3353348, 1, 0, 0.827451, 1,
1.052505, 0.005480522, 1.907715, 1, 0, 0.8235294, 1,
1.053447, 0.6234092, 2.034546, 1, 0, 0.8156863, 1,
1.06321, -0.3878895, 2.921634, 1, 0, 0.8117647, 1,
1.064648, 0.7215689, 1.219865, 1, 0, 0.8039216, 1,
1.066395, 0.3262951, 0.34798, 1, 0, 0.7960784, 1,
1.067879, -0.1386361, 1.577223, 1, 0, 0.7921569, 1,
1.068823, 0.2913838, 1.348963, 1, 0, 0.7843137, 1,
1.070337, -0.6001115, 2.057876, 1, 0, 0.7803922, 1,
1.070798, -0.8421166, 3.246353, 1, 0, 0.772549, 1,
1.075331, 0.6256328, -0.1204196, 1, 0, 0.7686275, 1,
1.076286, 0.7687892, 1.762277, 1, 0, 0.7607843, 1,
1.080024, 0.5517765, 1.883328, 1, 0, 0.7568628, 1,
1.087486, -0.2162311, 3.598347, 1, 0, 0.7490196, 1,
1.094947, 0.09064388, 2.78255, 1, 0, 0.7450981, 1,
1.103271, -0.129988, 1.217445, 1, 0, 0.7372549, 1,
1.105509, 0.2236615, 1.452484, 1, 0, 0.7333333, 1,
1.107273, 0.07260918, -0.1869855, 1, 0, 0.7254902, 1,
1.113523, -0.5609891, 0.4758979, 1, 0, 0.7215686, 1,
1.123102, -0.8901325, 2.181983, 1, 0, 0.7137255, 1,
1.130508, -0.1330838, 2.79188, 1, 0, 0.7098039, 1,
1.140186, 0.5357763, 0.04280497, 1, 0, 0.7019608, 1,
1.140775, 0.4630271, 1.302071, 1, 0, 0.6941177, 1,
1.14228, 0.4314684, 0.7429396, 1, 0, 0.6901961, 1,
1.145537, -1.756318, 1.784916, 1, 0, 0.682353, 1,
1.150555, 1.198493, 0.9247758, 1, 0, 0.6784314, 1,
1.154381, 0.8412508, 2.826147, 1, 0, 0.6705883, 1,
1.157515, -1.069277, 1.424261, 1, 0, 0.6666667, 1,
1.160528, -0.612007, 3.984303, 1, 0, 0.6588235, 1,
1.161794, -0.8560755, 1.563517, 1, 0, 0.654902, 1,
1.177503, 0.4098743, 2.339621, 1, 0, 0.6470588, 1,
1.179007, 0.00684199, 1.560809, 1, 0, 0.6431373, 1,
1.183121, -2.378107, 2.959531, 1, 0, 0.6352941, 1,
1.192854, -0.9272471, 1.006425, 1, 0, 0.6313726, 1,
1.193312, -1.086456, 3.423716, 1, 0, 0.6235294, 1,
1.197208, 1.004278, 0.801087, 1, 0, 0.6196079, 1,
1.204945, -0.0406687, 1.811097, 1, 0, 0.6117647, 1,
1.208749, 0.3995631, 1.04775, 1, 0, 0.6078432, 1,
1.210829, -1.942882, 1.61717, 1, 0, 0.6, 1,
1.213127, -0.9194667, 2.627729, 1, 0, 0.5921569, 1,
1.227148, 0.241034, 1.159076, 1, 0, 0.5882353, 1,
1.234488, 0.01734184, 1.444268, 1, 0, 0.5803922, 1,
1.241978, 0.3280008, 1.805042, 1, 0, 0.5764706, 1,
1.243832, -0.5841433, 2.420171, 1, 0, 0.5686275, 1,
1.244017, 0.6055788, 2.775296, 1, 0, 0.5647059, 1,
1.246485, 0.9938762, 0.8844382, 1, 0, 0.5568628, 1,
1.267017, 0.8140275, 0.3844679, 1, 0, 0.5529412, 1,
1.280396, -0.06919482, 3.165333, 1, 0, 0.5450981, 1,
1.283995, -0.50085, 0.9196694, 1, 0, 0.5411765, 1,
1.289757, 0.04083633, 1.85125, 1, 0, 0.5333334, 1,
1.304109, -0.09523655, 2.80651, 1, 0, 0.5294118, 1,
1.305346, 0.0009294754, 2.57746, 1, 0, 0.5215687, 1,
1.308853, 0.393448, 1.364994, 1, 0, 0.5176471, 1,
1.319538, 0.3987521, 2.131589, 1, 0, 0.509804, 1,
1.320841, -0.7393541, 0.5542611, 1, 0, 0.5058824, 1,
1.338205, -1.389276, 3.77586, 1, 0, 0.4980392, 1,
1.34724, 0.4603016, 1.073205, 1, 0, 0.4901961, 1,
1.367207, -0.1954599, 2.113089, 1, 0, 0.4862745, 1,
1.370843, 1.053738, -0.8128118, 1, 0, 0.4784314, 1,
1.371419, 0.7895877, 2.210093, 1, 0, 0.4745098, 1,
1.372475, -0.2702655, 2.109661, 1, 0, 0.4666667, 1,
1.382914, -0.2826776, 1.033325, 1, 0, 0.4627451, 1,
1.38333, 1.379412, 1.551781, 1, 0, 0.454902, 1,
1.387587, -0.3562284, 0.2497924, 1, 0, 0.4509804, 1,
1.39791, 0.7136291, 1.869479, 1, 0, 0.4431373, 1,
1.402851, -0.7535022, 1.348318, 1, 0, 0.4392157, 1,
1.403876, 1.363672, 0.5157026, 1, 0, 0.4313726, 1,
1.405062, -0.5582368, 1.777499, 1, 0, 0.427451, 1,
1.410753, 1.306628, 0.7945943, 1, 0, 0.4196078, 1,
1.411724, -0.5604524, 1.704791, 1, 0, 0.4156863, 1,
1.422536, 0.2678883, 1.918842, 1, 0, 0.4078431, 1,
1.434664, -0.9051517, 1.991356, 1, 0, 0.4039216, 1,
1.442457, -0.9418892, 1.200225, 1, 0, 0.3960784, 1,
1.467543, -1.402076, 2.470403, 1, 0, 0.3882353, 1,
1.475037, 0.3277355, 0.516358, 1, 0, 0.3843137, 1,
1.479146, -0.968778, 1.025073, 1, 0, 0.3764706, 1,
1.485532, -0.2021981, 1.181534, 1, 0, 0.372549, 1,
1.489391, 0.6475502, 1.597205, 1, 0, 0.3647059, 1,
1.489703, 0.2243181, 2.034272, 1, 0, 0.3607843, 1,
1.491946, -1.010692, 2.464424, 1, 0, 0.3529412, 1,
1.500729, 0.5067639, -2.004601, 1, 0, 0.3490196, 1,
1.504263, -0.1438979, 1.445011, 1, 0, 0.3411765, 1,
1.523721, 0.1059065, 1.909514, 1, 0, 0.3372549, 1,
1.53336, 0.4679973, 2.166362, 1, 0, 0.3294118, 1,
1.54056, 0.6500111, 1.424616, 1, 0, 0.3254902, 1,
1.541168, 0.4598069, 1.220675, 1, 0, 0.3176471, 1,
1.543526, -0.221486, 0.4817658, 1, 0, 0.3137255, 1,
1.550838, 0.002581856, -0.348436, 1, 0, 0.3058824, 1,
1.556435, -2.195938, 2.955227, 1, 0, 0.2980392, 1,
1.556741, -1.062544, 0.4835003, 1, 0, 0.2941177, 1,
1.568776, 2.670792, 0.1944044, 1, 0, 0.2862745, 1,
1.572754, -0.6235256, 3.615753, 1, 0, 0.282353, 1,
1.573101, -0.6687039, 2.418734, 1, 0, 0.2745098, 1,
1.587029, 0.6081052, 2.377118, 1, 0, 0.2705882, 1,
1.592096, -0.2052374, -0.2541747, 1, 0, 0.2627451, 1,
1.59427, -0.2033592, 4.904233, 1, 0, 0.2588235, 1,
1.596292, -0.3826774, 1.369804, 1, 0, 0.2509804, 1,
1.597596, 1.976374, 0.6343147, 1, 0, 0.2470588, 1,
1.599039, 0.6492483, -0.0097922, 1, 0, 0.2392157, 1,
1.640071, 0.5411836, 0.1838536, 1, 0, 0.2352941, 1,
1.641521, 0.449138, 1.697373, 1, 0, 0.227451, 1,
1.643175, 0.3555539, 2.23053, 1, 0, 0.2235294, 1,
1.681758, 0.3203767, 1.771853, 1, 0, 0.2156863, 1,
1.700029, -1.677362, 1.405286, 1, 0, 0.2117647, 1,
1.701724, -0.9596095, 2.350712, 1, 0, 0.2039216, 1,
1.722184, 1.550314, 1.706874, 1, 0, 0.1960784, 1,
1.756246, -0.4459108, 0.546956, 1, 0, 0.1921569, 1,
1.780836, 0.5916499, 1.077726, 1, 0, 0.1843137, 1,
1.787529, -1.559542, 2.231564, 1, 0, 0.1803922, 1,
1.836515, 1.229877, 1.048246, 1, 0, 0.172549, 1,
1.851051, -1.169332, 3.904864, 1, 0, 0.1686275, 1,
1.865572, -0.6657296, 2.795347, 1, 0, 0.1607843, 1,
1.895963, -0.7120408, 1.6208, 1, 0, 0.1568628, 1,
1.93119, -0.04404672, 0.7843224, 1, 0, 0.1490196, 1,
1.93305, -1.329468, 3.262365, 1, 0, 0.145098, 1,
1.950568, 1.323698, 0.7200856, 1, 0, 0.1372549, 1,
1.957352, -1.572344, 1.596529, 1, 0, 0.1333333, 1,
1.958801, 0.5653503, 2.454632, 1, 0, 0.1254902, 1,
1.969366, 1.300827, 0.9921029, 1, 0, 0.1215686, 1,
1.975532, -0.3199419, 1.359682, 1, 0, 0.1137255, 1,
2.000339, -0.277788, -0.05931978, 1, 0, 0.1098039, 1,
2.008838, 1.572186, 1.808382, 1, 0, 0.1019608, 1,
2.019554, -1.674015, 1.61062, 1, 0, 0.09411765, 1,
2.039771, 0.5400361, -0.5861918, 1, 0, 0.09019608, 1,
2.040239, -1.085346, 1.375285, 1, 0, 0.08235294, 1,
2.103397, 0.9997498, 1.107311, 1, 0, 0.07843138, 1,
2.111423, 0.2516477, 3.347343, 1, 0, 0.07058824, 1,
2.198328, -0.3537114, 2.243452, 1, 0, 0.06666667, 1,
2.273811, -0.1607615, 2.084816, 1, 0, 0.05882353, 1,
2.381245, -1.366357, 2.170373, 1, 0, 0.05490196, 1,
2.432927, 1.358767, 1.847169, 1, 0, 0.04705882, 1,
2.441147, 0.1300621, 0.5991181, 1, 0, 0.04313726, 1,
2.552015, 0.3896306, 0.08538846, 1, 0, 0.03529412, 1,
2.743363, 1.709367, 0.3208358, 1, 0, 0.03137255, 1,
2.816203, -0.07028068, 0.6343594, 1, 0, 0.02352941, 1,
3.159141, 0.5824836, 2.235402, 1, 0, 0.01960784, 1,
3.290456, -1.299683, 1.303844, 1, 0, 0.01176471, 1,
3.827688, -0.5385376, 1.458563, 1, 0, 0.007843138, 1
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
0.3650252, -4.024982, -8.209502, 0, -0.5, 0.5, 0.5,
0.3650252, -4.024982, -8.209502, 1, -0.5, 0.5, 0.5,
0.3650252, -4.024982, -8.209502, 1, 1.5, 0.5, 0.5,
0.3650252, -4.024982, -8.209502, 0, 1.5, 0.5, 0.5
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
-4.27148, 0.08605623, -8.209502, 0, -0.5, 0.5, 0.5,
-4.27148, 0.08605623, -8.209502, 1, -0.5, 0.5, 0.5,
-4.27148, 0.08605623, -8.209502, 1, 1.5, 0.5, 0.5,
-4.27148, 0.08605623, -8.209502, 0, 1.5, 0.5, 0.5
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
-4.27148, -4.024982, -0.6728365, 0, -0.5, 0.5, 0.5,
-4.27148, -4.024982, -0.6728365, 1, -0.5, 0.5, 0.5,
-4.27148, -4.024982, -0.6728365, 1, 1.5, 0.5, 0.5,
-4.27148, -4.024982, -0.6728365, 0, 1.5, 0.5, 0.5
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
-3, -3.076281, -6.470272,
3, -3.076281, -6.470272,
-3, -3.076281, -6.470272,
-3, -3.234398, -6.760144,
-2, -3.076281, -6.470272,
-2, -3.234398, -6.760144,
-1, -3.076281, -6.470272,
-1, -3.234398, -6.760144,
0, -3.076281, -6.470272,
0, -3.234398, -6.760144,
1, -3.076281, -6.470272,
1, -3.234398, -6.760144,
2, -3.076281, -6.470272,
2, -3.234398, -6.760144,
3, -3.076281, -6.470272,
3, -3.234398, -6.760144
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
-3, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
-3, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
-3, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
-3, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5,
-2, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
-2, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
-2, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
-2, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5,
-1, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
-1, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
-1, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
-1, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5,
0, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
0, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
0, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
0, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5,
1, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
1, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
1, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
1, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5,
2, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
2, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
2, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
2, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5,
3, -3.550632, -7.339887, 0, -0.5, 0.5, 0.5,
3, -3.550632, -7.339887, 1, -0.5, 0.5, 0.5,
3, -3.550632, -7.339887, 1, 1.5, 0.5, 0.5,
3, -3.550632, -7.339887, 0, 1.5, 0.5, 0.5
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
-3.201517, -2, -6.470272,
-3.201517, 3, -6.470272,
-3.201517, -2, -6.470272,
-3.379844, -2, -6.760144,
-3.201517, -1, -6.470272,
-3.379844, -1, -6.760144,
-3.201517, 0, -6.470272,
-3.379844, 0, -6.760144,
-3.201517, 1, -6.470272,
-3.379844, 1, -6.760144,
-3.201517, 2, -6.470272,
-3.379844, 2, -6.760144,
-3.201517, 3, -6.470272,
-3.379844, 3, -6.760144
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
-3.736499, -2, -7.339887, 0, -0.5, 0.5, 0.5,
-3.736499, -2, -7.339887, 1, -0.5, 0.5, 0.5,
-3.736499, -2, -7.339887, 1, 1.5, 0.5, 0.5,
-3.736499, -2, -7.339887, 0, 1.5, 0.5, 0.5,
-3.736499, -1, -7.339887, 0, -0.5, 0.5, 0.5,
-3.736499, -1, -7.339887, 1, -0.5, 0.5, 0.5,
-3.736499, -1, -7.339887, 1, 1.5, 0.5, 0.5,
-3.736499, -1, -7.339887, 0, 1.5, 0.5, 0.5,
-3.736499, 0, -7.339887, 0, -0.5, 0.5, 0.5,
-3.736499, 0, -7.339887, 1, -0.5, 0.5, 0.5,
-3.736499, 0, -7.339887, 1, 1.5, 0.5, 0.5,
-3.736499, 0, -7.339887, 0, 1.5, 0.5, 0.5,
-3.736499, 1, -7.339887, 0, -0.5, 0.5, 0.5,
-3.736499, 1, -7.339887, 1, -0.5, 0.5, 0.5,
-3.736499, 1, -7.339887, 1, 1.5, 0.5, 0.5,
-3.736499, 1, -7.339887, 0, 1.5, 0.5, 0.5,
-3.736499, 2, -7.339887, 0, -0.5, 0.5, 0.5,
-3.736499, 2, -7.339887, 1, -0.5, 0.5, 0.5,
-3.736499, 2, -7.339887, 1, 1.5, 0.5, 0.5,
-3.736499, 2, -7.339887, 0, 1.5, 0.5, 0.5,
-3.736499, 3, -7.339887, 0, -0.5, 0.5, 0.5,
-3.736499, 3, -7.339887, 1, -0.5, 0.5, 0.5,
-3.736499, 3, -7.339887, 1, 1.5, 0.5, 0.5,
-3.736499, 3, -7.339887, 0, 1.5, 0.5, 0.5
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
-3.201517, -3.076281, -6,
-3.201517, -3.076281, 4,
-3.201517, -3.076281, -6,
-3.379844, -3.234398, -6,
-3.201517, -3.076281, -4,
-3.379844, -3.234398, -4,
-3.201517, -3.076281, -2,
-3.379844, -3.234398, -2,
-3.201517, -3.076281, 0,
-3.379844, -3.234398, 0,
-3.201517, -3.076281, 2,
-3.379844, -3.234398, 2,
-3.201517, -3.076281, 4,
-3.379844, -3.234398, 4
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
-3.736499, -3.550632, -6, 0, -0.5, 0.5, 0.5,
-3.736499, -3.550632, -6, 1, -0.5, 0.5, 0.5,
-3.736499, -3.550632, -6, 1, 1.5, 0.5, 0.5,
-3.736499, -3.550632, -6, 0, 1.5, 0.5, 0.5,
-3.736499, -3.550632, -4, 0, -0.5, 0.5, 0.5,
-3.736499, -3.550632, -4, 1, -0.5, 0.5, 0.5,
-3.736499, -3.550632, -4, 1, 1.5, 0.5, 0.5,
-3.736499, -3.550632, -4, 0, 1.5, 0.5, 0.5,
-3.736499, -3.550632, -2, 0, -0.5, 0.5, 0.5,
-3.736499, -3.550632, -2, 1, -0.5, 0.5, 0.5,
-3.736499, -3.550632, -2, 1, 1.5, 0.5, 0.5,
-3.736499, -3.550632, -2, 0, 1.5, 0.5, 0.5,
-3.736499, -3.550632, 0, 0, -0.5, 0.5, 0.5,
-3.736499, -3.550632, 0, 1, -0.5, 0.5, 0.5,
-3.736499, -3.550632, 0, 1, 1.5, 0.5, 0.5,
-3.736499, -3.550632, 0, 0, 1.5, 0.5, 0.5,
-3.736499, -3.550632, 2, 0, -0.5, 0.5, 0.5,
-3.736499, -3.550632, 2, 1, -0.5, 0.5, 0.5,
-3.736499, -3.550632, 2, 1, 1.5, 0.5, 0.5,
-3.736499, -3.550632, 2, 0, 1.5, 0.5, 0.5,
-3.736499, -3.550632, 4, 0, -0.5, 0.5, 0.5,
-3.736499, -3.550632, 4, 1, -0.5, 0.5, 0.5,
-3.736499, -3.550632, 4, 1, 1.5, 0.5, 0.5,
-3.736499, -3.550632, 4, 0, 1.5, 0.5, 0.5
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
-3.201517, -3.076281, -6.470272,
-3.201517, 3.248393, -6.470272,
-3.201517, -3.076281, 5.124599,
-3.201517, 3.248393, 5.124599,
-3.201517, -3.076281, -6.470272,
-3.201517, -3.076281, 5.124599,
-3.201517, 3.248393, -6.470272,
-3.201517, 3.248393, 5.124599,
-3.201517, -3.076281, -6.470272,
3.931568, -3.076281, -6.470272,
-3.201517, -3.076281, 5.124599,
3.931568, -3.076281, 5.124599,
-3.201517, 3.248393, -6.470272,
3.931568, 3.248393, -6.470272,
-3.201517, 3.248393, 5.124599,
3.931568, 3.248393, 5.124599,
3.931568, -3.076281, -6.470272,
3.931568, 3.248393, -6.470272,
3.931568, -3.076281, 5.124599,
3.931568, 3.248393, 5.124599,
3.931568, -3.076281, -6.470272,
3.931568, -3.076281, 5.124599,
3.931568, 3.248393, -6.470272,
3.931568, 3.248393, 5.124599
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
var radius = 8.015464;
var distance = 35.6617;
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
mvMatrix.translate( -0.3650252, -0.08605623, 0.6728365 );
mvMatrix.scale( 1.214969, 1.370264, 0.7474405 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.6617);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
metconazole<-read.table("metconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
```

```r
y<-metconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
```

```r
z<-metconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
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
-3.097637, -0.7169328, -1.202943, 0, 0, 1, 1, 1,
-2.910421, 0.9786566, -0.5490103, 1, 0, 0, 1, 1,
-2.837563, -0.03567833, -2.256633, 1, 0, 0, 1, 1,
-2.764701, 0.8818179, -0.8788055, 1, 0, 0, 1, 1,
-2.686784, 1.078493, -0.9663768, 1, 0, 0, 1, 1,
-2.668282, -1.004276, -3.080197, 1, 0, 0, 1, 1,
-2.644318, -0.3180152, -0.8665888, 0, 0, 0, 1, 1,
-2.629545, -0.1934074, -1.395544, 0, 0, 0, 1, 1,
-2.598675, -0.8892625, -0.1698058, 0, 0, 0, 1, 1,
-2.424494, -0.2132139, -3.231113, 0, 0, 0, 1, 1,
-2.420091, -0.1241733, -1.496217, 0, 0, 0, 1, 1,
-2.408137, 0.09757265, -2.245494, 0, 0, 0, 1, 1,
-2.362314, 1.177946, -1.03212, 0, 0, 0, 1, 1,
-2.318877, 0.2821237, -2.010407, 1, 1, 1, 1, 1,
-2.305393, 0.4466189, -3.82708, 1, 1, 1, 1, 1,
-2.22762, -0.7002552, -1.555765, 1, 1, 1, 1, 1,
-2.215864, 0.6027803, -1.557376, 1, 1, 1, 1, 1,
-2.190442, 0.2651651, -2.577329, 1, 1, 1, 1, 1,
-2.179053, 1.38607, -0.9045407, 1, 1, 1, 1, 1,
-2.16751, -1.143821, -3.773317, 1, 1, 1, 1, 1,
-2.158921, 0.5365934, -2.527181, 1, 1, 1, 1, 1,
-2.128446, -0.08050305, -1.820004, 1, 1, 1, 1, 1,
-2.115191, 0.471584, -0.6469328, 1, 1, 1, 1, 1,
-2.113959, -1.064383, -1.234335, 1, 1, 1, 1, 1,
-2.096542, -1.065557, -2.887389, 1, 1, 1, 1, 1,
-2.0732, 0.48105, -0.897608, 1, 1, 1, 1, 1,
-2.070271, -1.071288, -3.507909, 1, 1, 1, 1, 1,
-2.057906, 1.510021, -2.442001, 1, 1, 1, 1, 1,
-2.034506, 0.4995823, -3.648034, 0, 0, 1, 1, 1,
-2.025527, -0.9587337, -1.073997, 1, 0, 0, 1, 1,
-2.019906, 0.2715767, -1.95295, 1, 0, 0, 1, 1,
-2.000906, 0.3443624, -1.246257, 1, 0, 0, 1, 1,
-1.974713, -0.7257606, -2.143707, 1, 0, 0, 1, 1,
-1.961085, 0.3812822, -1.277209, 1, 0, 0, 1, 1,
-1.958542, -0.6688815, -0.5690144, 0, 0, 0, 1, 1,
-1.918227, -0.3022271, -1.100676, 0, 0, 0, 1, 1,
-1.917899, 0.8600093, -1.277506, 0, 0, 0, 1, 1,
-1.912962, -0.9760983, -1.918083, 0, 0, 0, 1, 1,
-1.910169, -0.4274282, -2.771183, 0, 0, 0, 1, 1,
-1.908654, 0.5931187, -0.8869725, 0, 0, 0, 1, 1,
-1.890172, -2.541774, -3.722706, 0, 0, 0, 1, 1,
-1.871485, -0.08981835, -1.955216, 1, 1, 1, 1, 1,
-1.850201, -0.5770486, -4.176955, 1, 1, 1, 1, 1,
-1.845755, -0.8346965, -1.548724, 1, 1, 1, 1, 1,
-1.816259, 1.679131, -0.5970387, 1, 1, 1, 1, 1,
-1.801327, 0.711455, -0.8043276, 1, 1, 1, 1, 1,
-1.797947, 0.7350425, -0.7384405, 1, 1, 1, 1, 1,
-1.797518, 0.2312621, -0.5901831, 1, 1, 1, 1, 1,
-1.777636, 0.8212245, -2.310829, 1, 1, 1, 1, 1,
-1.769696, -1.123459, -2.371624, 1, 1, 1, 1, 1,
-1.758363, -0.5197376, -1.731942, 1, 1, 1, 1, 1,
-1.712428, 1.354748, -0.6766258, 1, 1, 1, 1, 1,
-1.702789, 1.242586, -1.30821, 1, 1, 1, 1, 1,
-1.697113, -2.2061, -3.32061, 1, 1, 1, 1, 1,
-1.695144, 0.2831247, -1.727575, 1, 1, 1, 1, 1,
-1.680447, -0.7343653, -2.866764, 1, 1, 1, 1, 1,
-1.678259, -0.7989035, -1.87538, 0, 0, 1, 1, 1,
-1.676197, 0.3982779, -1.837974, 1, 0, 0, 1, 1,
-1.663736, -0.5398934, -1.402399, 1, 0, 0, 1, 1,
-1.661389, -0.3909971, -1.290906, 1, 0, 0, 1, 1,
-1.652547, 1.133814, -0.5215677, 1, 0, 0, 1, 1,
-1.638751, -0.9312063, 0.8709959, 1, 0, 0, 1, 1,
-1.634419, -0.307806, -2.199061, 0, 0, 0, 1, 1,
-1.632678, -0.6433822, -0.856026, 0, 0, 0, 1, 1,
-1.62486, 0.5058965, -0.2828517, 0, 0, 0, 1, 1,
-1.622953, 1.272946, 0.03131059, 0, 0, 0, 1, 1,
-1.597761, -0.2192032, -1.872004, 0, 0, 0, 1, 1,
-1.555369, -0.117638, -3.453879, 0, 0, 0, 1, 1,
-1.54816, -1.375749, -2.511771, 0, 0, 0, 1, 1,
-1.544995, 1.943102, -1.194405, 1, 1, 1, 1, 1,
-1.533216, -0.7819488, -1.455519, 1, 1, 1, 1, 1,
-1.532871, 0.6113867, -0.9668643, 1, 1, 1, 1, 1,
-1.52482, 0.8366796, -0.4906754, 1, 1, 1, 1, 1,
-1.522442, -0.4756418, -3.170732, 1, 1, 1, 1, 1,
-1.516474, -0.5639061, -0.43275, 1, 1, 1, 1, 1,
-1.514973, 0.01492304, -1.865238, 1, 1, 1, 1, 1,
-1.507189, -0.7480566, -1.468578, 1, 1, 1, 1, 1,
-1.503421, -0.4426233, -2.992582, 1, 1, 1, 1, 1,
-1.503113, 0.7477602, 0.4431629, 1, 1, 1, 1, 1,
-1.502876, 0.2502548, -1.162096, 1, 1, 1, 1, 1,
-1.501575, 0.2782221, -2.053255, 1, 1, 1, 1, 1,
-1.493376, -0.581995, -0.06929208, 1, 1, 1, 1, 1,
-1.490744, -1.260475, -0.2069424, 1, 1, 1, 1, 1,
-1.480645, -2.014851, -4.340871, 1, 1, 1, 1, 1,
-1.465113, 0.1460743, -1.80493, 0, 0, 1, 1, 1,
-1.44704, 0.05028274, -3.412886, 1, 0, 0, 1, 1,
-1.443557, -0.8313126, -1.870268, 1, 0, 0, 1, 1,
-1.431847, -0.9747674, -1.886997, 1, 0, 0, 1, 1,
-1.430958, -0.8215506, -2.243553, 1, 0, 0, 1, 1,
-1.424873, -0.0704435, -1.743985, 1, 0, 0, 1, 1,
-1.397018, -0.4660399, -0.6869766, 0, 0, 0, 1, 1,
-1.391807, 2.658577, 0.07645147, 0, 0, 0, 1, 1,
-1.37583, -0.5634557, -3.377574, 0, 0, 0, 1, 1,
-1.369718, -0.750673, -1.586554, 0, 0, 0, 1, 1,
-1.357364, 0.238185, -1.84867, 0, 0, 0, 1, 1,
-1.3565, 0.1060595, -0.1933501, 0, 0, 0, 1, 1,
-1.3406, -0.2386124, -0.9039059, 0, 0, 0, 1, 1,
-1.327458, 0.05534175, -0.9370381, 1, 1, 1, 1, 1,
-1.327191, 0.2258605, -1.81199, 1, 1, 1, 1, 1,
-1.316268, 0.2446259, -2.020472, 1, 1, 1, 1, 1,
-1.313958, 1.101576, -0.9585731, 1, 1, 1, 1, 1,
-1.309277, 1.469965, -0.6432763, 1, 1, 1, 1, 1,
-1.302136, 0.4507789, -0.9515864, 1, 1, 1, 1, 1,
-1.29534, -1.666322, -2.836792, 1, 1, 1, 1, 1,
-1.290141, -0.7650735, -2.458313, 1, 1, 1, 1, 1,
-1.281908, -0.003183851, -2.261115, 1, 1, 1, 1, 1,
-1.271974, -0.8872645, -4.208653, 1, 1, 1, 1, 1,
-1.26581, 0.5568742, -1.642854, 1, 1, 1, 1, 1,
-1.25664, 0.8417982, -0.09727359, 1, 1, 1, 1, 1,
-1.255943, 0.04599092, -1.117199, 1, 1, 1, 1, 1,
-1.255129, 0.06052442, -0.3683676, 1, 1, 1, 1, 1,
-1.247864, 0.06849255, -1.577843, 1, 1, 1, 1, 1,
-1.246955, 1.588873, -1.189471, 0, 0, 1, 1, 1,
-1.2404, 0.6348453, -0.2568858, 1, 0, 0, 1, 1,
-1.240019, 3.156286, -0.8532458, 1, 0, 0, 1, 1,
-1.23916, 0.1258753, -0.9852166, 1, 0, 0, 1, 1,
-1.216113, 0.9278817, -0.7873693, 1, 0, 0, 1, 1,
-1.214793, 1.538472, -0.5542631, 1, 0, 0, 1, 1,
-1.20703, -1.354208, -2.284551, 0, 0, 0, 1, 1,
-1.19955, -0.5110574, -2.385052, 0, 0, 0, 1, 1,
-1.185061, 0.5037588, -0.06533875, 0, 0, 0, 1, 1,
-1.170377, 0.2656935, -1.493246, 0, 0, 0, 1, 1,
-1.166519, -0.1901894, -2.085914, 0, 0, 0, 1, 1,
-1.166501, -0.2281798, -0.3077222, 0, 0, 0, 1, 1,
-1.164737, 0.4271983, -2.367039, 0, 0, 0, 1, 1,
-1.159346, 1.213287, -2.670673, 1, 1, 1, 1, 1,
-1.158287, 0.758504, -1.18855, 1, 1, 1, 1, 1,
-1.154492, 0.557855, 0.1123282, 1, 1, 1, 1, 1,
-1.15005, -0.3911756, -2.622585, 1, 1, 1, 1, 1,
-1.141718, 0.6659068, 0.05520068, 1, 1, 1, 1, 1,
-1.134842, -1.234889, -3.586443, 1, 1, 1, 1, 1,
-1.130914, -0.3420753, -2.810844, 1, 1, 1, 1, 1,
-1.118193, -0.7332459, -2.019087, 1, 1, 1, 1, 1,
-1.108667, -0.06056436, -3.118837, 1, 1, 1, 1, 1,
-1.10599, -0.3674328, -1.441163, 1, 1, 1, 1, 1,
-1.099039, -1.454008, -2.136747, 1, 1, 1, 1, 1,
-1.097261, 0.2004015, -0.9649906, 1, 1, 1, 1, 1,
-1.093804, -0.3625655, -3.109763, 1, 1, 1, 1, 1,
-1.093323, 0.01063994, 1.184671, 1, 1, 1, 1, 1,
-1.092001, -0.9489231, -2.394107, 1, 1, 1, 1, 1,
-1.091787, 0.3454461, -1.287542, 0, 0, 1, 1, 1,
-1.0911, -2.935493, -1.526931, 1, 0, 0, 1, 1,
-1.088035, 1.179569, 0.4721996, 1, 0, 0, 1, 1,
-1.083291, -0.7206782, -2.129622, 1, 0, 0, 1, 1,
-1.082511, 1.454648, -0.8026493, 1, 0, 0, 1, 1,
-1.078241, 0.5680951, -1.206683, 1, 0, 0, 1, 1,
-1.076839, 0.6416062, -0.0412775, 0, 0, 0, 1, 1,
-1.07442, 0.5831652, -1.233395, 0, 0, 0, 1, 1,
-1.068728, -0.3439839, -0.5728608, 0, 0, 0, 1, 1,
-1.067066, 0.109073, 0.2518588, 0, 0, 0, 1, 1,
-1.04863, -0.2553679, -1.016277, 0, 0, 0, 1, 1,
-1.045364, 1.861251, -0.631861, 0, 0, 0, 1, 1,
-1.044988, -0.4792738, 0.2796066, 0, 0, 0, 1, 1,
-1.044851, -1.054567, -0.2180145, 1, 1, 1, 1, 1,
-1.039337, 1.067082, -1.575112, 1, 1, 1, 1, 1,
-1.016241, 0.4021322, -3.954916, 1, 1, 1, 1, 1,
-1.01362, 0.5520228, -3.188257, 1, 1, 1, 1, 1,
-1.013505, -1.756886, -1.676303, 1, 1, 1, 1, 1,
-1.012715, 0.657517, 1.593606, 1, 1, 1, 1, 1,
-1.005783, 1.278231, -0.9709764, 1, 1, 1, 1, 1,
-1.005042, 0.9655371, 0.1223367, 1, 1, 1, 1, 1,
-1.002203, 0.5745578, -1.421264, 1, 1, 1, 1, 1,
-0.9990531, 0.2874791, -2.0732, 1, 1, 1, 1, 1,
-0.9792303, -0.479356, -2.982838, 1, 1, 1, 1, 1,
-0.9782978, 0.05040014, -1.573823, 1, 1, 1, 1, 1,
-0.9739044, -0.01972538, -1.222551, 1, 1, 1, 1, 1,
-0.9725772, -0.08428264, 0.1184049, 1, 1, 1, 1, 1,
-0.9716179, -0.6538538, -2.870738, 1, 1, 1, 1, 1,
-0.9704307, -1.32481, -3.41432, 0, 0, 1, 1, 1,
-0.9690676, 3.143628, 0.1507291, 1, 0, 0, 1, 1,
-0.9680752, 0.1083744, -2.160758, 1, 0, 0, 1, 1,
-0.9655535, -0.315793, -2.859725, 1, 0, 0, 1, 1,
-0.9641572, -0.05920044, -1.183872, 1, 0, 0, 1, 1,
-0.9626774, 0.992605, -2.17978, 1, 0, 0, 1, 1,
-0.9626747, -0.07248158, -2.997495, 0, 0, 0, 1, 1,
-0.9572368, 0.7396997, 0.0444551, 0, 0, 0, 1, 1,
-0.9569498, 0.09775642, -0.6123823, 0, 0, 0, 1, 1,
-0.9541928, 1.235993, 1.741738, 0, 0, 0, 1, 1,
-0.9489632, 0.3224364, -3.318361, 0, 0, 0, 1, 1,
-0.9440498, -0.3396398, -3.197073, 0, 0, 0, 1, 1,
-0.9424242, 0.0260119, -0.6074367, 0, 0, 0, 1, 1,
-0.9380223, 1.043853, 0.4212736, 1, 1, 1, 1, 1,
-0.9342902, 0.7572602, -1.454348, 1, 1, 1, 1, 1,
-0.9211497, -2.12069, -1.674477, 1, 1, 1, 1, 1,
-0.9208922, -0.2313271, -0.8378392, 1, 1, 1, 1, 1,
-0.9167621, 0.2535713, -0.1888668, 1, 1, 1, 1, 1,
-0.9035982, -1.247831, -0.9677032, 1, 1, 1, 1, 1,
-0.9023641, 0.4714548, 0.7458476, 1, 1, 1, 1, 1,
-0.9001048, -1.994233, -2.658981, 1, 1, 1, 1, 1,
-0.8996572, -0.3290772, -1.911561, 1, 1, 1, 1, 1,
-0.8919352, -0.2959094, -2.361423, 1, 1, 1, 1, 1,
-0.8918808, 0.5041572, -0.5336044, 1, 1, 1, 1, 1,
-0.8894044, 0.6487318, -1.82418, 1, 1, 1, 1, 1,
-0.8882883, 1.691638, -0.7674923, 1, 1, 1, 1, 1,
-0.8853666, -0.2414234, -1.208035, 1, 1, 1, 1, 1,
-0.8852662, -0.5941002, -2.370892, 1, 1, 1, 1, 1,
-0.8841854, 1.484653, -0.3486347, 0, 0, 1, 1, 1,
-0.8815536, 0.2436711, -1.684068, 1, 0, 0, 1, 1,
-0.8803791, -1.478692, -3.487578, 1, 0, 0, 1, 1,
-0.8798097, -0.6835529, -4.225806, 1, 0, 0, 1, 1,
-0.8797578, -0.4494293, -2.074257, 1, 0, 0, 1, 1,
-0.8760777, 0.2292558, -0.1092996, 1, 0, 0, 1, 1,
-0.8716355, 1.280182, -0.05042637, 0, 0, 0, 1, 1,
-0.8662308, -0.5119579, -1.489807, 0, 0, 0, 1, 1,
-0.864638, -0.4931992, -0.5696439, 0, 0, 0, 1, 1,
-0.8499217, -1.238509, -3.576385, 0, 0, 0, 1, 1,
-0.8453522, -0.6212052, -3.041246, 0, 0, 0, 1, 1,
-0.8398616, -1.142706, -3.111914, 0, 0, 0, 1, 1,
-0.8314635, 0.4381143, -1.232486, 0, 0, 0, 1, 1,
-0.8298308, -1.262439, -2.870011, 1, 1, 1, 1, 1,
-0.8191951, 2.053181, 0.7832299, 1, 1, 1, 1, 1,
-0.8190452, -1.464724, -4.787234, 1, 1, 1, 1, 1,
-0.8184341, -0.6224151, -1.999638, 1, 1, 1, 1, 1,
-0.8165092, -0.2635011, -2.459957, 1, 1, 1, 1, 1,
-0.8030537, -0.2404605, -2.619176, 1, 1, 1, 1, 1,
-0.8030211, 2.154522, 1.684047, 1, 1, 1, 1, 1,
-0.8017108, -0.5591317, -3.249783, 1, 1, 1, 1, 1,
-0.7908497, -0.2222372, -1.067636, 1, 1, 1, 1, 1,
-0.7872675, 0.8565411, -0.004830869, 1, 1, 1, 1, 1,
-0.7872663, -0.09466357, -0.8898292, 1, 1, 1, 1, 1,
-0.7832509, 2.839564, 1.850956, 1, 1, 1, 1, 1,
-0.7772532, 0.003525538, -0.2747494, 1, 1, 1, 1, 1,
-0.7685694, 0.2773361, -0.4428646, 1, 1, 1, 1, 1,
-0.7668566, -1.700132, -4.351919, 1, 1, 1, 1, 1,
-0.7568909, -0.3054437, -0.5824659, 0, 0, 1, 1, 1,
-0.7560103, 0.9412404, -0.02367402, 1, 0, 0, 1, 1,
-0.754656, 1.375383, -1.850479, 1, 0, 0, 1, 1,
-0.7527211, 0.5413925, 0.3301137, 1, 0, 0, 1, 1,
-0.752701, -0.5608573, -3.709928, 1, 0, 0, 1, 1,
-0.7483631, -0.6341965, -2.978372, 1, 0, 0, 1, 1,
-0.7477857, -0.6502224, -2.431418, 0, 0, 0, 1, 1,
-0.7435047, -0.6438453, -2.38885, 0, 0, 0, 1, 1,
-0.7400396, 0.242515, 0.3968965, 0, 0, 0, 1, 1,
-0.7395926, 0.02260757, -0.6922979, 0, 0, 0, 1, 1,
-0.7381037, 0.2058038, -2.749802, 0, 0, 0, 1, 1,
-0.7378535, 0.9009198, -1.204732, 0, 0, 0, 1, 1,
-0.7351556, -1.068171, -2.134151, 0, 0, 0, 1, 1,
-0.7303404, -1.540404, -1.598869, 1, 1, 1, 1, 1,
-0.729256, 0.2894648, 0.5888224, 1, 1, 1, 1, 1,
-0.7287428, 0.4849529, -1.662675, 1, 1, 1, 1, 1,
-0.7184585, 0.572062, 0.3123817, 1, 1, 1, 1, 1,
-0.7182335, 0.7818303, 0.3317414, 1, 1, 1, 1, 1,
-0.7155098, -0.2200992, -2.884558, 1, 1, 1, 1, 1,
-0.7145262, 1.350123, -0.06327615, 1, 1, 1, 1, 1,
-0.7136726, 1.015908, -0.3312218, 1, 1, 1, 1, 1,
-0.7121555, 0.3791108, -0.1591117, 1, 1, 1, 1, 1,
-0.7114396, 0.7459977, 0.3091259, 1, 1, 1, 1, 1,
-0.7077463, -1.349426, -1.68524, 1, 1, 1, 1, 1,
-0.7071287, 0.08755936, -0.6512142, 1, 1, 1, 1, 1,
-0.7053027, -0.3148953, -1.545331, 1, 1, 1, 1, 1,
-0.6990383, 0.8762568, -0.5437428, 1, 1, 1, 1, 1,
-0.6959351, -0.1668908, -2.462114, 1, 1, 1, 1, 1,
-0.6944047, 0.6803181, -1.166683, 0, 0, 1, 1, 1,
-0.691492, 0.3182793, 0.08814507, 1, 0, 0, 1, 1,
-0.6855211, -0.01269452, -2.511826, 1, 0, 0, 1, 1,
-0.6845452, 0.9866719, -0.527688, 1, 0, 0, 1, 1,
-0.6814359, -1.495381, -1.053414, 1, 0, 0, 1, 1,
-0.6780238, 0.6664198, -1.687993, 1, 0, 0, 1, 1,
-0.6749823, 0.1509178, -0.1181065, 0, 0, 0, 1, 1,
-0.6743059, 1.623283, 0.01194295, 0, 0, 0, 1, 1,
-0.6720814, -1.149139, -2.778232, 0, 0, 0, 1, 1,
-0.6646317, 1.764169, -0.3213592, 0, 0, 0, 1, 1,
-0.6619647, -1.763673, -1.759695, 0, 0, 0, 1, 1,
-0.6589025, -0.8499423, -3.592175, 0, 0, 0, 1, 1,
-0.657055, -0.7536696, -4.084577, 0, 0, 0, 1, 1,
-0.651969, 0.6351632, -2.589325, 1, 1, 1, 1, 1,
-0.6468214, -1.676824, -4.570146, 1, 1, 1, 1, 1,
-0.6450888, 0.2935701, -1.29537, 1, 1, 1, 1, 1,
-0.6441904, -0.4022873, -2.432919, 1, 1, 1, 1, 1,
-0.6439841, -0.191872, 1.800782, 1, 1, 1, 1, 1,
-0.6438633, -0.2324899, -2.661516, 1, 1, 1, 1, 1,
-0.6420676, 1.087091, -0.2785819, 1, 1, 1, 1, 1,
-0.6400474, 0.5919387, -0.08005006, 1, 1, 1, 1, 1,
-0.6357136, -0.5166101, -2.999114, 1, 1, 1, 1, 1,
-0.6348264, -2.445107, -3.572164, 1, 1, 1, 1, 1,
-0.6346309, 0.1787181, -1.231519, 1, 1, 1, 1, 1,
-0.6297186, -1.611714, -2.452575, 1, 1, 1, 1, 1,
-0.6296092, 1.007427, -0.9208159, 1, 1, 1, 1, 1,
-0.6226371, 1.251653, -0.6031824, 1, 1, 1, 1, 1,
-0.621251, -1.575943, -2.757607, 1, 1, 1, 1, 1,
-0.611598, 1.124208, 0.1404044, 0, 0, 1, 1, 1,
-0.6068808, 0.21338, -2.257321, 1, 0, 0, 1, 1,
-0.6066304, -0.9058022, -2.542746, 1, 0, 0, 1, 1,
-0.6027536, 0.4715236, -0.1517897, 1, 0, 0, 1, 1,
-0.602453, -0.07536913, -2.502963, 1, 0, 0, 1, 1,
-0.6017028, -0.5386537, -1.603737, 1, 0, 0, 1, 1,
-0.5988591, -1.716822, -4.600644, 0, 0, 0, 1, 1,
-0.5980458, 1.320509, 1.716085, 0, 0, 0, 1, 1,
-0.5965825, 2.553216, -0.7645196, 0, 0, 0, 1, 1,
-0.5956044, -0.1548778, -2.096285, 0, 0, 0, 1, 1,
-0.5917946, 0.7889141, 0.1949873, 0, 0, 0, 1, 1,
-0.591408, -1.259164, -2.115421, 0, 0, 0, 1, 1,
-0.5831625, 0.4284097, 0.9520398, 0, 0, 0, 1, 1,
-0.5817959, 2.684731, -1.774904, 1, 1, 1, 1, 1,
-0.5807238, 1.040194, -3.525891, 1, 1, 1, 1, 1,
-0.5798482, 2.369577, -0.5975844, 1, 1, 1, 1, 1,
-0.576659, -0.8640282, -1.915576, 1, 1, 1, 1, 1,
-0.5740233, 1.280133, -0.5125168, 1, 1, 1, 1, 1,
-0.5739529, -0.071557, -1.026688, 1, 1, 1, 1, 1,
-0.5690219, 0.1040658, -1.708403, 1, 1, 1, 1, 1,
-0.5684571, 0.00989631, -0.4812903, 1, 1, 1, 1, 1,
-0.5668844, 0.1709894, -1.620887, 1, 1, 1, 1, 1,
-0.5656086, 0.5067713, 0.3944918, 1, 1, 1, 1, 1,
-0.5601095, -0.2147804, -2.863182, 1, 1, 1, 1, 1,
-0.5595148, 0.6397088, -0.163092, 1, 1, 1, 1, 1,
-0.5592836, 1.704732, -0.1832937, 1, 1, 1, 1, 1,
-0.5566792, 2.020884, 0.6844141, 1, 1, 1, 1, 1,
-0.5565544, 0.4445617, -3.03058, 1, 1, 1, 1, 1,
-0.5525725, -0.2585836, -2.996977, 0, 0, 1, 1, 1,
-0.551901, 0.2812759, -0.4477938, 1, 0, 0, 1, 1,
-0.5493992, -0.3247087, -1.872257, 1, 0, 0, 1, 1,
-0.5488313, 0.2286844, -0.1729718, 1, 0, 0, 1, 1,
-0.5465789, -1.075486, -4.147024, 1, 0, 0, 1, 1,
-0.5424989, -1.456711, -3.318552, 1, 0, 0, 1, 1,
-0.5403005, 0.01001314, -0.442428, 0, 0, 0, 1, 1,
-0.5385305, 1.799237, 2.883675, 0, 0, 0, 1, 1,
-0.537908, -1.630476, -5.683842, 0, 0, 0, 1, 1,
-0.5352772, 0.3131689, -2.493103, 0, 0, 0, 1, 1,
-0.5325478, 0.2704722, -0.2420524, 0, 0, 0, 1, 1,
-0.530805, 0.4077987, 0.8352417, 0, 0, 0, 1, 1,
-0.5280855, 0.376101, -3.505831, 0, 0, 0, 1, 1,
-0.5245769, 0.3138854, -1.028439, 1, 1, 1, 1, 1,
-0.522998, -1.051603, -3.271052, 1, 1, 1, 1, 1,
-0.522188, 0.1713806, 0.531315, 1, 1, 1, 1, 1,
-0.5181425, 1.658597, -1.469889, 1, 1, 1, 1, 1,
-0.5140399, 0.5422935, -1.039489, 1, 1, 1, 1, 1,
-0.5095153, -0.08781505, -1.895455, 1, 1, 1, 1, 1,
-0.5054851, 0.5479072, -0.9075711, 1, 1, 1, 1, 1,
-0.502595, 0.9956113, -1.478604, 1, 1, 1, 1, 1,
-0.4951415, -0.2423406, -2.331371, 1, 1, 1, 1, 1,
-0.4924149, 0.3543096, -0.2376454, 1, 1, 1, 1, 1,
-0.4915959, -0.9221705, -1.456175, 1, 1, 1, 1, 1,
-0.4913143, 0.2949556, -0.994444, 1, 1, 1, 1, 1,
-0.4885972, 0.4062655, -1.190403, 1, 1, 1, 1, 1,
-0.4868362, 0.7008197, -1.638954, 1, 1, 1, 1, 1,
-0.4816937, -0.4861241, -3.047425, 1, 1, 1, 1, 1,
-0.4647685, -0.3827106, -0.008087155, 0, 0, 1, 1, 1,
-0.4627125, -0.2627577, 0.6778501, 1, 0, 0, 1, 1,
-0.4599532, 0.8924009, 1.309591, 1, 0, 0, 1, 1,
-0.4596345, 1.659104, -1.060551, 1, 0, 0, 1, 1,
-0.4590528, -0.5094091, -1.8787, 1, 0, 0, 1, 1,
-0.4589151, -0.03013286, -1.78615, 1, 0, 0, 1, 1,
-0.4564608, -0.5988181, -2.462932, 0, 0, 0, 1, 1,
-0.4531006, 0.966181, -0.06970359, 0, 0, 0, 1, 1,
-0.4527583, 0.2021802, -0.617649, 0, 0, 0, 1, 1,
-0.4502353, -0.331088, -3.372872, 0, 0, 0, 1, 1,
-0.4494244, -1.010774, -1.355892, 0, 0, 0, 1, 1,
-0.4469025, -1.017297, -2.409597, 0, 0, 0, 1, 1,
-0.4467633, -0.6509496, -2.102102, 0, 0, 0, 1, 1,
-0.4448232, 0.3347751, -0.9945665, 1, 1, 1, 1, 1,
-0.4419072, -0.1692613, -2.881464, 1, 1, 1, 1, 1,
-0.4371772, -1.48342, -3.182694, 1, 1, 1, 1, 1,
-0.4354357, -1.876774, -4.173303, 1, 1, 1, 1, 1,
-0.4329711, 1.591642, 1.398395, 1, 1, 1, 1, 1,
-0.4310367, -2.031453, -1.205629, 1, 1, 1, 1, 1,
-0.4301834, 1.068309, -0.463689, 1, 1, 1, 1, 1,
-0.4286479, 1.73684, 0.02425952, 1, 1, 1, 1, 1,
-0.4282646, -0.3027619, -3.441356, 1, 1, 1, 1, 1,
-0.424515, -0.3344784, -2.380725, 1, 1, 1, 1, 1,
-0.4185964, -0.1961899, -2.95288, 1, 1, 1, 1, 1,
-0.4128036, -0.7947576, -1.187076, 1, 1, 1, 1, 1,
-0.4067343, 0.3163747, 0.1200478, 1, 1, 1, 1, 1,
-0.4051757, -0.1755951, -1.734819, 1, 1, 1, 1, 1,
-0.4018388, -0.9441529, -1.596883, 1, 1, 1, 1, 1,
-0.400598, 0.2220898, -0.1210921, 0, 0, 1, 1, 1,
-0.3973036, -1.036669, -2.562491, 1, 0, 0, 1, 1,
-0.3888439, -0.948039, -2.330454, 1, 0, 0, 1, 1,
-0.3788886, 0.2236402, -1.566525, 1, 0, 0, 1, 1,
-0.3785318, 0.1996026, -1.137193, 1, 0, 0, 1, 1,
-0.3785034, 0.3915358, -0.942551, 1, 0, 0, 1, 1,
-0.3625624, 2.283623, -0.3673607, 0, 0, 0, 1, 1,
-0.357869, 0.472231, -2.447198, 0, 0, 0, 1, 1,
-0.3536354, -0.7074343, -3.703488, 0, 0, 0, 1, 1,
-0.3455353, 0.3808026, -0.9994562, 0, 0, 0, 1, 1,
-0.3423855, 0.2444788, -0.8474551, 0, 0, 0, 1, 1,
-0.3417364, 0.3706733, -2.184372, 0, 0, 0, 1, 1,
-0.3378857, -1.319767, -3.118127, 0, 0, 0, 1, 1,
-0.3352571, -0.2307592, 0.1294603, 1, 1, 1, 1, 1,
-0.3326707, -1.108071, -2.97777, 1, 1, 1, 1, 1,
-0.3278389, 0.3977115, -0.7420122, 1, 1, 1, 1, 1,
-0.3260615, -0.5301895, -2.76213, 1, 1, 1, 1, 1,
-0.3197932, -0.5724488, -2.936265, 1, 1, 1, 1, 1,
-0.3188694, 0.01153788, -2.020961, 1, 1, 1, 1, 1,
-0.3177063, -0.2168978, -2.430369, 1, 1, 1, 1, 1,
-0.31574, 1.251266, -2.869031, 1, 1, 1, 1, 1,
-0.3138703, -0.7298767, -4.034848, 1, 1, 1, 1, 1,
-0.3011076, -0.8501538, -1.049219, 1, 1, 1, 1, 1,
-0.2928189, -0.5706928, -2.003812, 1, 1, 1, 1, 1,
-0.2926671, -0.1034375, -2.141411, 1, 1, 1, 1, 1,
-0.291557, -1.36177, -6.301414, 1, 1, 1, 1, 1,
-0.289766, -0.4328026, -0.7824283, 1, 1, 1, 1, 1,
-0.2896478, -0.02899885, -1.457345, 1, 1, 1, 1, 1,
-0.2854928, -0.5315971, -2.26346, 0, 0, 1, 1, 1,
-0.2790423, 1.643215, 0.1373949, 1, 0, 0, 1, 1,
-0.2785172, -1.135131, -0.8607932, 1, 0, 0, 1, 1,
-0.2683481, 0.8547844, -1.320541, 1, 0, 0, 1, 1,
-0.2629018, -0.4846412, -0.7254462, 1, 0, 0, 1, 1,
-0.2586318, 0.1159566, -1.028001, 1, 0, 0, 1, 1,
-0.2584999, -0.1299528, -2.088708, 0, 0, 0, 1, 1,
-0.2542555, 0.06893364, -0.3131582, 0, 0, 0, 1, 1,
-0.2522151, -0.4388486, -1.537575, 0, 0, 0, 1, 1,
-0.2481605, -0.8764115, -2.729085, 0, 0, 0, 1, 1,
-0.2460396, -0.7885832, -3.765823, 0, 0, 0, 1, 1,
-0.2452825, -1.481478, -3.324391, 0, 0, 0, 1, 1,
-0.2452524, -0.2244677, -2.499462, 0, 0, 0, 1, 1,
-0.241852, 1.603724, -1.958677, 1, 1, 1, 1, 1,
-0.2323298, 1.26239, -2.271008, 1, 1, 1, 1, 1,
-0.2316746, -1.658808, -3.262273, 1, 1, 1, 1, 1,
-0.231328, 0.07156652, -0.3120039, 1, 1, 1, 1, 1,
-0.2264854, -0.1654915, -1.19477, 1, 1, 1, 1, 1,
-0.2263883, -0.4568991, -3.585637, 1, 1, 1, 1, 1,
-0.2223685, 0.9664143, 0.08990854, 1, 1, 1, 1, 1,
-0.2181524, -0.09430847, -1.661726, 1, 1, 1, 1, 1,
-0.2161009, 1.305863, -1.361521, 1, 1, 1, 1, 1,
-0.2156288, 1.985154, 1.530931, 1, 1, 1, 1, 1,
-0.213738, 0.7726994, -0.7531025, 1, 1, 1, 1, 1,
-0.2136901, 0.04951308, -2.259264, 1, 1, 1, 1, 1,
-0.2086584, -0.6657414, -1.843251, 1, 1, 1, 1, 1,
-0.2080266, -0.6782836, -1.062825, 1, 1, 1, 1, 1,
-0.207045, 1.764917, 1.022773, 1, 1, 1, 1, 1,
-0.2064472, 1.772424, -0.1967962, 0, 0, 1, 1, 1,
-0.1993299, 1.52289, -0.2067404, 1, 0, 0, 1, 1,
-0.1986452, -0.618923, -2.148376, 1, 0, 0, 1, 1,
-0.1978762, -0.1434499, -3.9256, 1, 0, 0, 1, 1,
-0.1969918, -1.141533, -2.899889, 1, 0, 0, 1, 1,
-0.1960886, 1.407853, -0.2760193, 1, 0, 0, 1, 1,
-0.1949568, -0.7692043, -2.850173, 0, 0, 0, 1, 1,
-0.1944214, -0.78921, -3.540141, 0, 0, 0, 1, 1,
-0.1940728, -1.244569, -3.627522, 0, 0, 0, 1, 1,
-0.1903369, 0.08022384, -3.406272, 0, 0, 0, 1, 1,
-0.190136, 0.06425951, -1.045276, 0, 0, 0, 1, 1,
-0.1893189, -0.3766101, -2.048205, 0, 0, 0, 1, 1,
-0.1790116, -1.590666, -2.485279, 0, 0, 0, 1, 1,
-0.1788115, -0.5532584, -2.412038, 1, 1, 1, 1, 1,
-0.1767441, -0.4552877, -1.72484, 1, 1, 1, 1, 1,
-0.1764203, 2.069118, -0.1830678, 1, 1, 1, 1, 1,
-0.1756182, -0.6041781, -3.899958, 1, 1, 1, 1, 1,
-0.172026, 0.1191114, 0.004423364, 1, 1, 1, 1, 1,
-0.1677047, -0.7609556, -3.001632, 1, 1, 1, 1, 1,
-0.1627782, -0.03386477, -1.75612, 1, 1, 1, 1, 1,
-0.1625425, 1.187021, -0.1994118, 1, 1, 1, 1, 1,
-0.1586391, -1.400398, -2.164581, 1, 1, 1, 1, 1,
-0.1518049, 1.330686, 0.2626109, 1, 1, 1, 1, 1,
-0.1491091, -1.391521, -3.921723, 1, 1, 1, 1, 1,
-0.1450152, 1.144538, 0.4579436, 1, 1, 1, 1, 1,
-0.143834, -0.8930782, -4.130754, 1, 1, 1, 1, 1,
-0.139867, -0.3801488, -2.887578, 1, 1, 1, 1, 1,
-0.1395061, 0.4467996, -0.401081, 1, 1, 1, 1, 1,
-0.1354976, -1.374576, -3.448828, 0, 0, 1, 1, 1,
-0.1284637, -0.6512616, -4.212, 1, 0, 0, 1, 1,
-0.12804, 1.889657, 1.462214, 1, 0, 0, 1, 1,
-0.1244, 0.05969193, -1.09737, 1, 0, 0, 1, 1,
-0.1239357, 2.08635, -1.610745, 1, 0, 0, 1, 1,
-0.1238527, -0.8892292, -3.409097, 1, 0, 0, 1, 1,
-0.1118321, -0.4683459, -2.613922, 0, 0, 0, 1, 1,
-0.1093651, -0.2196258, -2.926449, 0, 0, 0, 1, 1,
-0.1066156, -0.5221607, -1.732069, 0, 0, 0, 1, 1,
-0.1057512, 0.6358696, 0.717453, 0, 0, 0, 1, 1,
-0.1037369, 0.1934008, 0.2093992, 0, 0, 0, 1, 1,
-0.09424486, 1.63637, 2.467022, 0, 0, 0, 1, 1,
-0.09140112, -0.1684315, -2.55141, 0, 0, 0, 1, 1,
-0.0888035, 0.3317024, -0.3844703, 1, 1, 1, 1, 1,
-0.08659438, -1.126643, -3.299855, 1, 1, 1, 1, 1,
-0.07694328, -1.287424, -3.778561, 1, 1, 1, 1, 1,
-0.07432868, -0.3170412, -2.256982, 1, 1, 1, 1, 1,
-0.07393664, 1.012344, 0.5008146, 1, 1, 1, 1, 1,
-0.0719615, -0.4749403, -2.411262, 1, 1, 1, 1, 1,
-0.0712866, 0.3395497, -2.208075, 1, 1, 1, 1, 1,
-0.07039347, -1.392631, -2.191223, 1, 1, 1, 1, 1,
-0.06902954, -0.8594122, -3.147028, 1, 1, 1, 1, 1,
-0.06834168, 0.1818523, 0.7211588, 1, 1, 1, 1, 1,
-0.0678734, -0.9325462, -4.037155, 1, 1, 1, 1, 1,
-0.06531639, 0.4892527, -2.313201, 1, 1, 1, 1, 1,
-0.06487387, 1.305882, -1.540219, 1, 1, 1, 1, 1,
-0.06064223, -0.2394676, -3.294675, 1, 1, 1, 1, 1,
-0.06020137, 0.02155455, -1.443134, 1, 1, 1, 1, 1,
-0.06009178, 0.6990088, -0.6977099, 0, 0, 1, 1, 1,
-0.05597278, -1.689826, -2.700609, 1, 0, 0, 1, 1,
-0.04834939, -0.7562492, -3.103193, 1, 0, 0, 1, 1,
-0.04583493, -0.805631, -3.189824, 1, 0, 0, 1, 1,
-0.04572845, 0.3347338, -0.1961059, 1, 0, 0, 1, 1,
-0.0435978, 0.3788742, 0.4503044, 1, 0, 0, 1, 1,
-0.03391892, -0.9712111, -3.504524, 0, 0, 0, 1, 1,
-0.02956269, -0.1868836, -4.819371, 0, 0, 0, 1, 1,
-0.02668945, 1.212651, 0.07537851, 0, 0, 0, 1, 1,
-0.02631074, 0.4804028, -0.8962865, 0, 0, 0, 1, 1,
-0.02596304, -0.4712595, -3.03506, 0, 0, 0, 1, 1,
-0.0254724, -1.192735, -2.253565, 0, 0, 0, 1, 1,
-0.02417796, -1.550786, -3.033745, 0, 0, 0, 1, 1,
-0.02236793, 0.01553852, -1.424137, 1, 1, 1, 1, 1,
-0.0165673, -0.4187726, -1.719568, 1, 1, 1, 1, 1,
-0.0148497, 1.689497, -0.1174622, 1, 1, 1, 1, 1,
-0.01444651, 2.135266, -0.1041865, 1, 1, 1, 1, 1,
-0.007616353, -0.4737023, -3.013494, 1, 1, 1, 1, 1,
-0.006761288, 0.2474423, -1.212458, 1, 1, 1, 1, 1,
-0.004348867, -0.1552279, -2.839675, 1, 1, 1, 1, 1,
-0.003180495, -0.4857742, -3.3756, 1, 1, 1, 1, 1,
-0.002958265, 1.787889, 0.7415012, 1, 1, 1, 1, 1,
0.0001646202, 1.972907, -0.8092423, 1, 1, 1, 1, 1,
0.001010216, 0.8616357, 1.905695, 1, 1, 1, 1, 1,
0.002492949, 0.8343057, 1.338795, 1, 1, 1, 1, 1,
0.006241781, 1.131733, -1.71983, 1, 1, 1, 1, 1,
0.009162225, -0.04739112, 1.99086, 1, 1, 1, 1, 1,
0.00916841, 0.5924754, 0.5121661, 1, 1, 1, 1, 1,
0.01741143, 0.2910863, 1.030277, 0, 0, 1, 1, 1,
0.01934518, -1.639603, 2.521568, 1, 0, 0, 1, 1,
0.02279048, 0.03464607, 0.324546, 1, 0, 0, 1, 1,
0.02305058, 1.3709, -0.6372187, 1, 0, 0, 1, 1,
0.02395445, -0.1324778, 1.858841, 1, 0, 0, 1, 1,
0.02510188, -0.1010393, 3.632838, 1, 0, 0, 1, 1,
0.02705986, 0.8251818, -0.09520253, 0, 0, 0, 1, 1,
0.02813357, -0.6268449, 2.512057, 0, 0, 0, 1, 1,
0.0290191, 0.5457977, -1.72896, 0, 0, 0, 1, 1,
0.03208745, -0.01175201, 1.168774, 0, 0, 0, 1, 1,
0.0327787, -0.3541501, 3.283393, 0, 0, 0, 1, 1,
0.03351296, -0.4211157, 2.661309, 0, 0, 0, 1, 1,
0.0339394, 0.9436792, 0.1036497, 0, 0, 0, 1, 1,
0.04580395, 0.03558907, 1.022899, 1, 1, 1, 1, 1,
0.0558131, 0.3198735, 1.283588, 1, 1, 1, 1, 1,
0.05596142, -1.190679, 3.354977, 1, 1, 1, 1, 1,
0.05725763, -2.017916, 1.375315, 1, 1, 1, 1, 1,
0.06416334, -0.791142, 2.113324, 1, 1, 1, 1, 1,
0.07495546, 0.869295, 0.5070714, 1, 1, 1, 1, 1,
0.07975402, 1.279915, 0.966737, 1, 1, 1, 1, 1,
0.08171948, -1.451913, 4.838096, 1, 1, 1, 1, 1,
0.08832957, -0.6636506, 3.915318, 1, 1, 1, 1, 1,
0.09297122, 0.1379154, 1.737715, 1, 1, 1, 1, 1,
0.09506107, 1.516764, 0.599879, 1, 1, 1, 1, 1,
0.09691601, -1.0978, 3.897031, 1, 1, 1, 1, 1,
0.09715975, -1.505473, 0.8635219, 1, 1, 1, 1, 1,
0.1006812, -0.8219942, 3.100336, 1, 1, 1, 1, 1,
0.1026172, 0.0308035, 0.1078132, 1, 1, 1, 1, 1,
0.106941, 1.077944, -3.062193, 0, 0, 1, 1, 1,
0.1075707, -0.467294, 3.958488, 1, 0, 0, 1, 1,
0.1136352, -0.1849821, 2.320292, 1, 0, 0, 1, 1,
0.1145863, -0.03688417, 0.6781828, 1, 0, 0, 1, 1,
0.1155991, 1.24132, 1.456496, 1, 0, 0, 1, 1,
0.1160774, -0.6218173, 3.689055, 1, 0, 0, 1, 1,
0.1199169, -0.6328876, 1.934382, 0, 0, 0, 1, 1,
0.1209561, 1.593734, -0.04618398, 0, 0, 0, 1, 1,
0.1243663, 0.1065878, 1.195607, 0, 0, 0, 1, 1,
0.1349624, -1.022643, 3.637093, 0, 0, 0, 1, 1,
0.137886, -0.6494887, 3.917064, 0, 0, 0, 1, 1,
0.1380768, 2.248816, 1.310703, 0, 0, 0, 1, 1,
0.1381307, -0.8671463, 3.061153, 0, 0, 0, 1, 1,
0.1391282, -1.700722, 4.574276, 1, 1, 1, 1, 1,
0.1442572, -1.507975, 3.254308, 1, 1, 1, 1, 1,
0.148622, -0.2789826, 3.892881, 1, 1, 1, 1, 1,
0.1488951, -1.130761, 1.595682, 1, 1, 1, 1, 1,
0.1497763, 1.53346, -0.7813725, 1, 1, 1, 1, 1,
0.1563809, 1.092799, 0.44994, 1, 1, 1, 1, 1,
0.1576697, 0.418349, -0.5292868, 1, 1, 1, 1, 1,
0.1601139, 0.681556, -0.5965657, 1, 1, 1, 1, 1,
0.1618775, -1.620858, 2.387533, 1, 1, 1, 1, 1,
0.1648081, -0.5697412, 2.541686, 1, 1, 1, 1, 1,
0.1679351, -0.6510659, 4.60266, 1, 1, 1, 1, 1,
0.1689904, -0.4217904, 1.994762, 1, 1, 1, 1, 1,
0.1764426, 0.630471, -0.9435579, 1, 1, 1, 1, 1,
0.1767577, 1.539621, 0.7620524, 1, 1, 1, 1, 1,
0.1801791, 0.540853, -0.09970253, 1, 1, 1, 1, 1,
0.1816537, 1.603074, 0.7115136, 0, 0, 1, 1, 1,
0.181993, -0.8668069, 2.364476, 1, 0, 0, 1, 1,
0.1828764, 0.9744346, -0.4519415, 1, 0, 0, 1, 1,
0.1862646, 0.1685207, 0.5588015, 1, 0, 0, 1, 1,
0.1868909, 0.2411552, 0.8295258, 1, 0, 0, 1, 1,
0.1883805, 1.47944, 1.343088, 1, 0, 0, 1, 1,
0.1890598, -0.3420666, 3.231575, 0, 0, 0, 1, 1,
0.1892006, 0.2520936, 0.8299664, 0, 0, 0, 1, 1,
0.1895681, -0.6641394, 2.757829, 0, 0, 0, 1, 1,
0.1905902, 0.5946299, -0.9509848, 0, 0, 0, 1, 1,
0.1923463, 1.367119, -0.0109415, 0, 0, 0, 1, 1,
0.1926283, -0.5296639, 2.281385, 0, 0, 0, 1, 1,
0.1945765, -0.1953806, 2.18827, 0, 0, 0, 1, 1,
0.1960254, -0.3687437, 1.777816, 1, 1, 1, 1, 1,
0.1992804, -1.496783, 2.979935, 1, 1, 1, 1, 1,
0.2014192, 0.06871457, 1.964651, 1, 1, 1, 1, 1,
0.2049257, -0.8303069, 2.297482, 1, 1, 1, 1, 1,
0.2063881, -0.7038931, 2.359174, 1, 1, 1, 1, 1,
0.2107354, -0.2101903, 3.702694, 1, 1, 1, 1, 1,
0.2122976, -0.4499642, 3.398308, 1, 1, 1, 1, 1,
0.2148462, -0.1050832, 1.324409, 1, 1, 1, 1, 1,
0.2149428, 0.4815367, -0.1499511, 1, 1, 1, 1, 1,
0.2176106, 0.8648739, 0.6421469, 1, 1, 1, 1, 1,
0.220546, 1.082574, 0.4254358, 1, 1, 1, 1, 1,
0.224626, -0.8047938, 3.254646, 1, 1, 1, 1, 1,
0.225118, 0.6141742, 1.065514, 1, 1, 1, 1, 1,
0.2299439, -0.6157877, 4.151246, 1, 1, 1, 1, 1,
0.2302657, -1.623173, 4.446315, 1, 1, 1, 1, 1,
0.2329803, -1.398046, 2.646961, 0, 0, 1, 1, 1,
0.2348929, -0.2832473, 1.915785, 1, 0, 0, 1, 1,
0.2367783, 2.190554, 0.3156962, 1, 0, 0, 1, 1,
0.238297, 0.5922182, 2.24038, 1, 0, 0, 1, 1,
0.2402446, 1.660968, 0.03350872, 1, 0, 0, 1, 1,
0.2418135, -1.6092, 1.676177, 1, 0, 0, 1, 1,
0.2436852, -0.544086, 2.355893, 0, 0, 0, 1, 1,
0.249575, 0.9187184, -1.508112, 0, 0, 0, 1, 1,
0.2505663, 1.569576, 0.6887467, 0, 0, 0, 1, 1,
0.2510379, 1.469403, -0.8782359, 0, 0, 0, 1, 1,
0.2554306, 1.975989, 2.657292, 0, 0, 0, 1, 1,
0.2623468, -0.4560486, 1.593446, 0, 0, 0, 1, 1,
0.265561, -1.211679, 3.752059, 0, 0, 0, 1, 1,
0.2702414, -0.283253, 2.404929, 1, 1, 1, 1, 1,
0.2763036, -0.2247936, -0.01054166, 1, 1, 1, 1, 1,
0.2802685, -1.23998, 4.135684, 1, 1, 1, 1, 1,
0.2805961, -0.5328413, 2.428862, 1, 1, 1, 1, 1,
0.288001, 0.6664292, 0.5207531, 1, 1, 1, 1, 1,
0.288091, 0.3961212, 2.100827, 1, 1, 1, 1, 1,
0.2897683, -0.1832102, 1.056872, 1, 1, 1, 1, 1,
0.2980412, -0.05614177, 1.639082, 1, 1, 1, 1, 1,
0.2993614, -0.04095318, 0.5483251, 1, 1, 1, 1, 1,
0.2993769, -0.341296, 2.249913, 1, 1, 1, 1, 1,
0.3007998, 0.399323, -1.442015, 1, 1, 1, 1, 1,
0.3027812, -0.4959119, 2.277148, 1, 1, 1, 1, 1,
0.3049577, -1.343446, 3.544593, 1, 1, 1, 1, 1,
0.3082053, -0.1950917, 2.257461, 1, 1, 1, 1, 1,
0.3087145, 0.09471027, 0.7207521, 1, 1, 1, 1, 1,
0.3095672, 0.626222, 1.167685, 0, 0, 1, 1, 1,
0.3120203, 1.263321, 1.124593, 1, 0, 0, 1, 1,
0.313958, -0.9766493, 2.143194, 1, 0, 0, 1, 1,
0.3158771, -0.9412155, 3.068201, 1, 0, 0, 1, 1,
0.3160555, 1.146415, 1.562985, 1, 0, 0, 1, 1,
0.3201177, -0.6862736, 4.45789, 1, 0, 0, 1, 1,
0.324067, -0.1562309, 1.131296, 0, 0, 0, 1, 1,
0.3264478, 2.343849, -1.388284, 0, 0, 0, 1, 1,
0.3278342, -0.2492741, 1.921557, 0, 0, 0, 1, 1,
0.3302368, 0.6849973, -2.455805, 0, 0, 0, 1, 1,
0.3314596, -0.8031447, 1.587482, 0, 0, 0, 1, 1,
0.3346587, -0.5704495, 0.8621682, 0, 0, 0, 1, 1,
0.3356934, -0.7390916, 2.589305, 0, 0, 0, 1, 1,
0.3385962, 0.5842934, 1.100334, 1, 1, 1, 1, 1,
0.3395461, 2.031536, 0.1899502, 1, 1, 1, 1, 1,
0.3414584, -1.000145, 2.878291, 1, 1, 1, 1, 1,
0.3420691, 0.04829504, 0.2741006, 1, 1, 1, 1, 1,
0.3439001, -0.611676, 2.109312, 1, 1, 1, 1, 1,
0.3439485, -0.0339513, 1.222594, 1, 1, 1, 1, 1,
0.345697, -1.144076, 3.591997, 1, 1, 1, 1, 1,
0.3462397, 0.3977768, 0.7142272, 1, 1, 1, 1, 1,
0.3507926, -0.8224095, 1.938861, 1, 1, 1, 1, 1,
0.3526546, -0.4954591, 1.652888, 1, 1, 1, 1, 1,
0.3559626, -2.832292, 2.5154, 1, 1, 1, 1, 1,
0.3570609, -0.2115679, 2.730716, 1, 1, 1, 1, 1,
0.3571716, 0.2133397, 0.08540799, 1, 1, 1, 1, 1,
0.359639, -0.8402398, 4.362367, 1, 1, 1, 1, 1,
0.3605008, 0.5231371, 0.03024253, 1, 1, 1, 1, 1,
0.3621053, -0.2430579, 1.854365, 0, 0, 1, 1, 1,
0.3640539, -0.7158715, 2.231578, 1, 0, 0, 1, 1,
0.3702156, 1.74659, -0.3500139, 1, 0, 0, 1, 1,
0.370308, 2.438384, -0.2249272, 1, 0, 0, 1, 1,
0.3747286, 0.5506632, -0.3570762, 1, 0, 0, 1, 1,
0.3814321, 0.6004665, 0.8826505, 1, 0, 0, 1, 1,
0.3822672, -0.7512359, 3.540555, 0, 0, 0, 1, 1,
0.3827221, -0.9007715, 2.538067, 0, 0, 0, 1, 1,
0.3877233, 0.5015332, -0.4492132, 0, 0, 0, 1, 1,
0.3908145, -0.2679578, 3.525146, 0, 0, 0, 1, 1,
0.393704, 0.3860343, -0.1857429, 0, 0, 0, 1, 1,
0.3975776, 1.243914, -0.2206374, 0, 0, 0, 1, 1,
0.3978797, 0.05442346, 0.7018288, 0, 0, 0, 1, 1,
0.3981095, -0.585997, 2.792305, 1, 1, 1, 1, 1,
0.3990149, 0.1777038, 1.067409, 1, 1, 1, 1, 1,
0.4044367, -0.8804009, 2.850367, 1, 1, 1, 1, 1,
0.4052033, -0.5476388, 2.431156, 1, 1, 1, 1, 1,
0.4101526, -1.676649, 1.953679, 1, 1, 1, 1, 1,
0.4146651, -1.743855, 3.469815, 1, 1, 1, 1, 1,
0.4188252, -0.2805215, 1.821977, 1, 1, 1, 1, 1,
0.4191304, -0.06503583, 1.716313, 1, 1, 1, 1, 1,
0.4192614, 0.1364633, 0.8405492, 1, 1, 1, 1, 1,
0.4235872, 0.8091319, -0.5384432, 1, 1, 1, 1, 1,
0.4286293, 0.8839225, 1.503704, 1, 1, 1, 1, 1,
0.4437982, -0.3121665, 0.5865656, 1, 1, 1, 1, 1,
0.448585, -0.894389, 2.475981, 1, 1, 1, 1, 1,
0.4492119, -0.1625182, 0.4374905, 1, 1, 1, 1, 1,
0.4493118, -1.160321, 2.473464, 1, 1, 1, 1, 1,
0.4562157, -0.2204675, 1.239761, 0, 0, 1, 1, 1,
0.4563237, -0.6554822, 1.108489, 1, 0, 0, 1, 1,
0.4568721, 0.1126212, 4.040426, 1, 0, 0, 1, 1,
0.4583026, 0.6505479, -0.04467812, 1, 0, 0, 1, 1,
0.4591527, -0.4885244, 2.674364, 1, 0, 0, 1, 1,
0.4607047, -0.8041323, 2.017875, 1, 0, 0, 1, 1,
0.468785, -0.8814836, 3.696006, 0, 0, 0, 1, 1,
0.4715053, 0.6676243, 1.209575, 0, 0, 0, 1, 1,
0.4779741, 0.4791532, -0.6035017, 0, 0, 0, 1, 1,
0.4790727, 1.178639, -0.9243439, 0, 0, 0, 1, 1,
0.4797652, -0.2900034, 0.6651657, 0, 0, 0, 1, 1,
0.4816892, 1.233435, 0.01081061, 0, 0, 0, 1, 1,
0.484133, 0.1617673, 1.137245, 0, 0, 0, 1, 1,
0.4847729, 0.6355631, 0.4907064, 1, 1, 1, 1, 1,
0.4886207, 0.1782123, 1.880969, 1, 1, 1, 1, 1,
0.4889448, -0.2572996, -0.09746335, 1, 1, 1, 1, 1,
0.4904748, 0.1343514, 1.393175, 1, 1, 1, 1, 1,
0.4914674, 1.354582, -0.9707628, 1, 1, 1, 1, 1,
0.4952593, -0.1091723, 1.884246, 1, 1, 1, 1, 1,
0.4952932, -0.5691993, 3.352801, 1, 1, 1, 1, 1,
0.4991043, 0.1535009, 2.167295, 1, 1, 1, 1, 1,
0.4995203, 0.7881837, 0.6694611, 1, 1, 1, 1, 1,
0.500909, 0.6028362, 1.83828, 1, 1, 1, 1, 1,
0.5009929, 0.2017978, -1.143376, 1, 1, 1, 1, 1,
0.5028383, -0.1249843, 2.50485, 1, 1, 1, 1, 1,
0.5100955, 0.4295409, -0.264772, 1, 1, 1, 1, 1,
0.5112988, 0.3925512, 0.5862103, 1, 1, 1, 1, 1,
0.511435, 0.05224743, 1.219367, 1, 1, 1, 1, 1,
0.5158703, 0.2820958, 1.083758, 0, 0, 1, 1, 1,
0.5207852, 1.304716, -0.4336734, 1, 0, 0, 1, 1,
0.5229065, 0.5583524, 1.776709, 1, 0, 0, 1, 1,
0.5266105, 1.285786, 1.577456, 1, 0, 0, 1, 1,
0.5338447, -2.287274, 1.678583, 1, 0, 0, 1, 1,
0.5400404, 0.1479092, 0.7751612, 1, 0, 0, 1, 1,
0.543997, 1.523427, -1.877633, 0, 0, 0, 1, 1,
0.5478714, 0.4056952, 1.631653, 0, 0, 0, 1, 1,
0.5552776, 0.7940407, 1.66381, 0, 0, 0, 1, 1,
0.5583324, 0.636477, 0.1486773, 0, 0, 0, 1, 1,
0.5595127, 0.654232, -0.6315447, 0, 0, 0, 1, 1,
0.5666289, 0.5785061, 1.703176, 0, 0, 0, 1, 1,
0.5739411, -0.1280071, 0.4129072, 0, 0, 0, 1, 1,
0.5742766, -0.5428972, 1.328298, 1, 1, 1, 1, 1,
0.5752593, -1.171746, 2.781266, 1, 1, 1, 1, 1,
0.5754505, -0.1013878, 0.3464789, 1, 1, 1, 1, 1,
0.5762755, -0.1263183, 2.684668, 1, 1, 1, 1, 1,
0.5778309, -0.6252714, 1.04036, 1, 1, 1, 1, 1,
0.5825813, 0.1193682, 2.027014, 1, 1, 1, 1, 1,
0.5859517, -1.153389, 3.006393, 1, 1, 1, 1, 1,
0.5904784, 0.2768313, 1.981341, 1, 1, 1, 1, 1,
0.5907958, 0.8205723, 0.4268838, 1, 1, 1, 1, 1,
0.5932003, -0.257783, 1.679698, 1, 1, 1, 1, 1,
0.5955092, -0.2557275, 3.076137, 1, 1, 1, 1, 1,
0.5982167, 0.2333412, 1.155047, 1, 1, 1, 1, 1,
0.599403, -0.4182181, 1.301954, 1, 1, 1, 1, 1,
0.6012815, 0.4072607, -0.3533501, 1, 1, 1, 1, 1,
0.6036794, -0.8611931, 1.46896, 1, 1, 1, 1, 1,
0.6042336, -0.3919694, 3.149122, 0, 0, 1, 1, 1,
0.6048681, -0.08946439, 1.24193, 1, 0, 0, 1, 1,
0.6059725, -1.021451, 1.519197, 1, 0, 0, 1, 1,
0.6060199, 1.220463, 1.109122, 1, 0, 0, 1, 1,
0.6157937, 1.14917, 0.3074405, 1, 0, 0, 1, 1,
0.6187397, -0.8182862, 2.781281, 1, 0, 0, 1, 1,
0.6187727, -1.33541, 3.220966, 0, 0, 0, 1, 1,
0.6214634, -1.496572, 2.747476, 0, 0, 0, 1, 1,
0.6240953, 0.2848521, -0.1481025, 0, 0, 0, 1, 1,
0.6259773, 0.6327164, -0.08260377, 0, 0, 0, 1, 1,
0.6273443, 1.061726, 0.4681528, 0, 0, 0, 1, 1,
0.6283405, -0.06717139, 2.628697, 0, 0, 0, 1, 1,
0.6301562, -0.1251369, 1.060155, 0, 0, 0, 1, 1,
0.6355956, -0.2364789, 1.83865, 1, 1, 1, 1, 1,
0.6463312, 0.3211291, 0.3696966, 1, 1, 1, 1, 1,
0.6468266, -0.5560941, 1.644767, 1, 1, 1, 1, 1,
0.6512845, -1.413565, 2.48292, 1, 1, 1, 1, 1,
0.6517251, -0.7056295, 1.936355, 1, 1, 1, 1, 1,
0.6523448, 1.413678, 0.8678794, 1, 1, 1, 1, 1,
0.659454, -0.5462524, 1.738498, 1, 1, 1, 1, 1,
0.6647452, 0.7447391, 1.003501, 1, 1, 1, 1, 1,
0.6654094, 1.216431, -2.249713, 1, 1, 1, 1, 1,
0.6698619, -0.2722287, 2.422541, 1, 1, 1, 1, 1,
0.6714207, -0.7929087, 2.44962, 1, 1, 1, 1, 1,
0.672424, -0.7698137, 2.172585, 1, 1, 1, 1, 1,
0.6727169, -1.027305, 3.969054, 1, 1, 1, 1, 1,
0.6743305, -0.3242522, 1.633809, 1, 1, 1, 1, 1,
0.6746042, -0.3093444, 1.822834, 1, 1, 1, 1, 1,
0.6765391, 0.593978, 2.538072, 0, 0, 1, 1, 1,
0.6862877, -1.372547, 3.445887, 1, 0, 0, 1, 1,
0.6914645, -1.630239, 2.677418, 1, 0, 0, 1, 1,
0.6967714, 0.0339583, 3.234267, 1, 0, 0, 1, 1,
0.6980692, 2.891768, 0.4083318, 1, 0, 0, 1, 1,
0.6985322, 0.6869029, 0.8147148, 1, 0, 0, 1, 1,
0.6996636, -2.534763, 3.589619, 0, 0, 0, 1, 1,
0.7032408, -0.3569553, 2.794168, 0, 0, 0, 1, 1,
0.703635, -0.892063, 1.871732, 0, 0, 0, 1, 1,
0.7037196, -1.054739, 2.524248, 0, 0, 0, 1, 1,
0.703805, 0.3994512, 1.789999, 0, 0, 0, 1, 1,
0.7051019, 0.8429571, 1.668175, 0, 0, 0, 1, 1,
0.7071159, -1.341676, 3.785249, 0, 0, 0, 1, 1,
0.7123076, -1.263576, 1.547131, 1, 1, 1, 1, 1,
0.7161388, -2.673061, 4.088126, 1, 1, 1, 1, 1,
0.7186955, 0.7411702, 1.297477, 1, 1, 1, 1, 1,
0.7232885, -2.283702, 3.439309, 1, 1, 1, 1, 1,
0.7281922, -0.2026918, 3.310202, 1, 1, 1, 1, 1,
0.74381, 0.8524222, -0.08980579, 1, 1, 1, 1, 1,
0.7472985, -0.2560076, 2.136829, 1, 1, 1, 1, 1,
0.7477346, 1.111066, 0.07803015, 1, 1, 1, 1, 1,
0.7483245, -0.2494065, 0.06404685, 1, 1, 1, 1, 1,
0.7539629, 0.7668369, 1.058424, 1, 1, 1, 1, 1,
0.7602095, -0.5277846, 2.75713, 1, 1, 1, 1, 1,
0.7632163, -0.1026912, 2.103237, 1, 1, 1, 1, 1,
0.7646192, 0.6208711, 2.709787, 1, 1, 1, 1, 1,
0.7697873, -0.6577474, 4.955741, 1, 1, 1, 1, 1,
0.7700233, -0.6404745, 1.139393, 1, 1, 1, 1, 1,
0.7727599, -0.416066, 2.928801, 0, 0, 1, 1, 1,
0.77356, -1.472678, 2.867672, 1, 0, 0, 1, 1,
0.7752537, -0.4990044, 2.183475, 1, 0, 0, 1, 1,
0.7778543, -0.6003407, 1.858565, 1, 0, 0, 1, 1,
0.7802629, 1.099926, 1.057818, 1, 0, 0, 1, 1,
0.7966773, -2.984174, 3.782041, 1, 0, 0, 1, 1,
0.8016554, 0.313345, -0.2967792, 0, 0, 0, 1, 1,
0.8031849, -1.048049, 1.774429, 0, 0, 0, 1, 1,
0.8040524, -0.8071153, 1.752837, 0, 0, 0, 1, 1,
0.80709, -0.7332212, 1.762465, 0, 0, 0, 1, 1,
0.811865, 0.2402704, 0.3578681, 0, 0, 0, 1, 1,
0.8154576, -2.608176, 2.196409, 0, 0, 0, 1, 1,
0.8172802, 0.9493564, 0.3087696, 0, 0, 0, 1, 1,
0.8250996, -0.3425274, 2.578509, 1, 1, 1, 1, 1,
0.8335425, -1.046662, 3.362467, 1, 1, 1, 1, 1,
0.8354458, 1.670937, -0.03400119, 1, 1, 1, 1, 1,
0.8370646, 1.292441, 2.315425, 1, 1, 1, 1, 1,
0.8382938, -0.254859, 1.436419, 1, 1, 1, 1, 1,
0.8493947, 1.390432, 0.3865889, 1, 1, 1, 1, 1,
0.8521526, 0.8691206, -0.267134, 1, 1, 1, 1, 1,
0.8556195, 0.5047226, 0.2651846, 1, 1, 1, 1, 1,
0.8614489, 0.6346498, 1.634359, 1, 1, 1, 1, 1,
0.8621936, 0.6422568, 1.037558, 1, 1, 1, 1, 1,
0.8647671, 2.045251, 0.6122742, 1, 1, 1, 1, 1,
0.8743216, -1.614468, 3.493649, 1, 1, 1, 1, 1,
0.8804681, -0.6979787, 1.833058, 1, 1, 1, 1, 1,
0.8852823, 0.32783, -0.4359046, 1, 1, 1, 1, 1,
0.8863997, -0.7076694, 2.161787, 1, 1, 1, 1, 1,
0.8894973, 0.5539428, 1.939928, 0, 0, 1, 1, 1,
0.8941596, -1.390618, 1.544892, 1, 0, 0, 1, 1,
0.8967609, 0.4273836, 1.15597, 1, 0, 0, 1, 1,
0.8970674, 0.7777535, 0.06280248, 1, 0, 0, 1, 1,
0.8983448, -1.476102, 3.227094, 1, 0, 0, 1, 1,
0.9010499, -0.6579825, 3.259009, 1, 0, 0, 1, 1,
0.9023395, 0.3949863, 0.626528, 0, 0, 0, 1, 1,
0.9027133, 0.7975122, 0.6370837, 0, 0, 0, 1, 1,
0.9062657, -0.3716771, 1.244881, 0, 0, 0, 1, 1,
0.9089265, 1.034918, 2.391177, 0, 0, 0, 1, 1,
0.9092031, -1.748848, 0.2011545, 0, 0, 0, 1, 1,
0.9102392, 0.7692623, 1.388598, 0, 0, 0, 1, 1,
0.9143183, 1.077016, 0.8371306, 0, 0, 0, 1, 1,
0.9326164, 0.7158126, -0.5215044, 1, 1, 1, 1, 1,
0.9400216, -0.8853892, 2.711217, 1, 1, 1, 1, 1,
0.9430894, 0.1269213, -0.1812334, 1, 1, 1, 1, 1,
0.9439049, 0.02768905, 0.4778531, 1, 1, 1, 1, 1,
0.95135, 0.6808662, 1.688316, 1, 1, 1, 1, 1,
0.9536328, 0.667943, 1.418861, 1, 1, 1, 1, 1,
0.9564531, -0.4035572, 1.241671, 1, 1, 1, 1, 1,
0.9589539, 0.02863839, 1.362632, 1, 1, 1, 1, 1,
0.9608096, 0.4671027, 0.4541442, 1, 1, 1, 1, 1,
0.9608898, -1.014208, 1.712838, 1, 1, 1, 1, 1,
0.963459, 0.07333403, 2.846601, 1, 1, 1, 1, 1,
0.965673, 0.150267, 0.8616987, 1, 1, 1, 1, 1,
0.966392, 0.5691053, 1.975865, 1, 1, 1, 1, 1,
0.9665735, -0.2273811, 2.617908, 1, 1, 1, 1, 1,
0.9696482, -1.653424, 3.95787, 1, 1, 1, 1, 1,
0.9730967, -0.5542996, 2.712168, 0, 0, 1, 1, 1,
0.9871189, -0.7977709, 1.804143, 1, 0, 0, 1, 1,
0.9886843, -1.439894, 3.635053, 1, 0, 0, 1, 1,
0.9912312, 1.959237, -1.007717, 1, 0, 0, 1, 1,
1.000352, 0.647567, -0.3268904, 1, 0, 0, 1, 1,
1.001322, 1.866221, 0.7508215, 1, 0, 0, 1, 1,
1.002882, -0.4310755, 1.194686, 0, 0, 0, 1, 1,
1.003238, -0.9588523, 3.367419, 0, 0, 0, 1, 1,
1.009904, 1.001535, -0.4235708, 0, 0, 0, 1, 1,
1.01112, 2.093345, 1.865857, 0, 0, 0, 1, 1,
1.01134, 0.6825971, 0.1169637, 0, 0, 0, 1, 1,
1.016406, -0.1307779, 3.26162, 0, 0, 0, 1, 1,
1.021822, -1.442996, 4.4295, 0, 0, 0, 1, 1,
1.022679, 0.885077, 0.273229, 1, 1, 1, 1, 1,
1.024158, -0.1305917, 1.816149, 1, 1, 1, 1, 1,
1.026986, -0.276078, 0.7855738, 1, 1, 1, 1, 1,
1.032553, 0.8230392, 2.09462, 1, 1, 1, 1, 1,
1.035685, 0.8437027, 1.598307, 1, 1, 1, 1, 1,
1.042411, -0.6622086, 2.749551, 1, 1, 1, 1, 1,
1.045915, -1.389874, 3.375869, 1, 1, 1, 1, 1,
1.046399, -0.4079632, 1.72567, 1, 1, 1, 1, 1,
1.050335, 0.1503638, 1.416174, 1, 1, 1, 1, 1,
1.050791, 1.364731, 0.3353348, 1, 1, 1, 1, 1,
1.052505, 0.005480522, 1.907715, 1, 1, 1, 1, 1,
1.053447, 0.6234092, 2.034546, 1, 1, 1, 1, 1,
1.06321, -0.3878895, 2.921634, 1, 1, 1, 1, 1,
1.064648, 0.7215689, 1.219865, 1, 1, 1, 1, 1,
1.066395, 0.3262951, 0.34798, 1, 1, 1, 1, 1,
1.067879, -0.1386361, 1.577223, 0, 0, 1, 1, 1,
1.068823, 0.2913838, 1.348963, 1, 0, 0, 1, 1,
1.070337, -0.6001115, 2.057876, 1, 0, 0, 1, 1,
1.070798, -0.8421166, 3.246353, 1, 0, 0, 1, 1,
1.075331, 0.6256328, -0.1204196, 1, 0, 0, 1, 1,
1.076286, 0.7687892, 1.762277, 1, 0, 0, 1, 1,
1.080024, 0.5517765, 1.883328, 0, 0, 0, 1, 1,
1.087486, -0.2162311, 3.598347, 0, 0, 0, 1, 1,
1.094947, 0.09064388, 2.78255, 0, 0, 0, 1, 1,
1.103271, -0.129988, 1.217445, 0, 0, 0, 1, 1,
1.105509, 0.2236615, 1.452484, 0, 0, 0, 1, 1,
1.107273, 0.07260918, -0.1869855, 0, 0, 0, 1, 1,
1.113523, -0.5609891, 0.4758979, 0, 0, 0, 1, 1,
1.123102, -0.8901325, 2.181983, 1, 1, 1, 1, 1,
1.130508, -0.1330838, 2.79188, 1, 1, 1, 1, 1,
1.140186, 0.5357763, 0.04280497, 1, 1, 1, 1, 1,
1.140775, 0.4630271, 1.302071, 1, 1, 1, 1, 1,
1.14228, 0.4314684, 0.7429396, 1, 1, 1, 1, 1,
1.145537, -1.756318, 1.784916, 1, 1, 1, 1, 1,
1.150555, 1.198493, 0.9247758, 1, 1, 1, 1, 1,
1.154381, 0.8412508, 2.826147, 1, 1, 1, 1, 1,
1.157515, -1.069277, 1.424261, 1, 1, 1, 1, 1,
1.160528, -0.612007, 3.984303, 1, 1, 1, 1, 1,
1.161794, -0.8560755, 1.563517, 1, 1, 1, 1, 1,
1.177503, 0.4098743, 2.339621, 1, 1, 1, 1, 1,
1.179007, 0.00684199, 1.560809, 1, 1, 1, 1, 1,
1.183121, -2.378107, 2.959531, 1, 1, 1, 1, 1,
1.192854, -0.9272471, 1.006425, 1, 1, 1, 1, 1,
1.193312, -1.086456, 3.423716, 0, 0, 1, 1, 1,
1.197208, 1.004278, 0.801087, 1, 0, 0, 1, 1,
1.204945, -0.0406687, 1.811097, 1, 0, 0, 1, 1,
1.208749, 0.3995631, 1.04775, 1, 0, 0, 1, 1,
1.210829, -1.942882, 1.61717, 1, 0, 0, 1, 1,
1.213127, -0.9194667, 2.627729, 1, 0, 0, 1, 1,
1.227148, 0.241034, 1.159076, 0, 0, 0, 1, 1,
1.234488, 0.01734184, 1.444268, 0, 0, 0, 1, 1,
1.241978, 0.3280008, 1.805042, 0, 0, 0, 1, 1,
1.243832, -0.5841433, 2.420171, 0, 0, 0, 1, 1,
1.244017, 0.6055788, 2.775296, 0, 0, 0, 1, 1,
1.246485, 0.9938762, 0.8844382, 0, 0, 0, 1, 1,
1.267017, 0.8140275, 0.3844679, 0, 0, 0, 1, 1,
1.280396, -0.06919482, 3.165333, 1, 1, 1, 1, 1,
1.283995, -0.50085, 0.9196694, 1, 1, 1, 1, 1,
1.289757, 0.04083633, 1.85125, 1, 1, 1, 1, 1,
1.304109, -0.09523655, 2.80651, 1, 1, 1, 1, 1,
1.305346, 0.0009294754, 2.57746, 1, 1, 1, 1, 1,
1.308853, 0.393448, 1.364994, 1, 1, 1, 1, 1,
1.319538, 0.3987521, 2.131589, 1, 1, 1, 1, 1,
1.320841, -0.7393541, 0.5542611, 1, 1, 1, 1, 1,
1.338205, -1.389276, 3.77586, 1, 1, 1, 1, 1,
1.34724, 0.4603016, 1.073205, 1, 1, 1, 1, 1,
1.367207, -0.1954599, 2.113089, 1, 1, 1, 1, 1,
1.370843, 1.053738, -0.8128118, 1, 1, 1, 1, 1,
1.371419, 0.7895877, 2.210093, 1, 1, 1, 1, 1,
1.372475, -0.2702655, 2.109661, 1, 1, 1, 1, 1,
1.382914, -0.2826776, 1.033325, 1, 1, 1, 1, 1,
1.38333, 1.379412, 1.551781, 0, 0, 1, 1, 1,
1.387587, -0.3562284, 0.2497924, 1, 0, 0, 1, 1,
1.39791, 0.7136291, 1.869479, 1, 0, 0, 1, 1,
1.402851, -0.7535022, 1.348318, 1, 0, 0, 1, 1,
1.403876, 1.363672, 0.5157026, 1, 0, 0, 1, 1,
1.405062, -0.5582368, 1.777499, 1, 0, 0, 1, 1,
1.410753, 1.306628, 0.7945943, 0, 0, 0, 1, 1,
1.411724, -0.5604524, 1.704791, 0, 0, 0, 1, 1,
1.422536, 0.2678883, 1.918842, 0, 0, 0, 1, 1,
1.434664, -0.9051517, 1.991356, 0, 0, 0, 1, 1,
1.442457, -0.9418892, 1.200225, 0, 0, 0, 1, 1,
1.467543, -1.402076, 2.470403, 0, 0, 0, 1, 1,
1.475037, 0.3277355, 0.516358, 0, 0, 0, 1, 1,
1.479146, -0.968778, 1.025073, 1, 1, 1, 1, 1,
1.485532, -0.2021981, 1.181534, 1, 1, 1, 1, 1,
1.489391, 0.6475502, 1.597205, 1, 1, 1, 1, 1,
1.489703, 0.2243181, 2.034272, 1, 1, 1, 1, 1,
1.491946, -1.010692, 2.464424, 1, 1, 1, 1, 1,
1.500729, 0.5067639, -2.004601, 1, 1, 1, 1, 1,
1.504263, -0.1438979, 1.445011, 1, 1, 1, 1, 1,
1.523721, 0.1059065, 1.909514, 1, 1, 1, 1, 1,
1.53336, 0.4679973, 2.166362, 1, 1, 1, 1, 1,
1.54056, 0.6500111, 1.424616, 1, 1, 1, 1, 1,
1.541168, 0.4598069, 1.220675, 1, 1, 1, 1, 1,
1.543526, -0.221486, 0.4817658, 1, 1, 1, 1, 1,
1.550838, 0.002581856, -0.348436, 1, 1, 1, 1, 1,
1.556435, -2.195938, 2.955227, 1, 1, 1, 1, 1,
1.556741, -1.062544, 0.4835003, 1, 1, 1, 1, 1,
1.568776, 2.670792, 0.1944044, 0, 0, 1, 1, 1,
1.572754, -0.6235256, 3.615753, 1, 0, 0, 1, 1,
1.573101, -0.6687039, 2.418734, 1, 0, 0, 1, 1,
1.587029, 0.6081052, 2.377118, 1, 0, 0, 1, 1,
1.592096, -0.2052374, -0.2541747, 1, 0, 0, 1, 1,
1.59427, -0.2033592, 4.904233, 1, 0, 0, 1, 1,
1.596292, -0.3826774, 1.369804, 0, 0, 0, 1, 1,
1.597596, 1.976374, 0.6343147, 0, 0, 0, 1, 1,
1.599039, 0.6492483, -0.0097922, 0, 0, 0, 1, 1,
1.640071, 0.5411836, 0.1838536, 0, 0, 0, 1, 1,
1.641521, 0.449138, 1.697373, 0, 0, 0, 1, 1,
1.643175, 0.3555539, 2.23053, 0, 0, 0, 1, 1,
1.681758, 0.3203767, 1.771853, 0, 0, 0, 1, 1,
1.700029, -1.677362, 1.405286, 1, 1, 1, 1, 1,
1.701724, -0.9596095, 2.350712, 1, 1, 1, 1, 1,
1.722184, 1.550314, 1.706874, 1, 1, 1, 1, 1,
1.756246, -0.4459108, 0.546956, 1, 1, 1, 1, 1,
1.780836, 0.5916499, 1.077726, 1, 1, 1, 1, 1,
1.787529, -1.559542, 2.231564, 1, 1, 1, 1, 1,
1.836515, 1.229877, 1.048246, 1, 1, 1, 1, 1,
1.851051, -1.169332, 3.904864, 1, 1, 1, 1, 1,
1.865572, -0.6657296, 2.795347, 1, 1, 1, 1, 1,
1.895963, -0.7120408, 1.6208, 1, 1, 1, 1, 1,
1.93119, -0.04404672, 0.7843224, 1, 1, 1, 1, 1,
1.93305, -1.329468, 3.262365, 1, 1, 1, 1, 1,
1.950568, 1.323698, 0.7200856, 1, 1, 1, 1, 1,
1.957352, -1.572344, 1.596529, 1, 1, 1, 1, 1,
1.958801, 0.5653503, 2.454632, 1, 1, 1, 1, 1,
1.969366, 1.300827, 0.9921029, 0, 0, 1, 1, 1,
1.975532, -0.3199419, 1.359682, 1, 0, 0, 1, 1,
2.000339, -0.277788, -0.05931978, 1, 0, 0, 1, 1,
2.008838, 1.572186, 1.808382, 1, 0, 0, 1, 1,
2.019554, -1.674015, 1.61062, 1, 0, 0, 1, 1,
2.039771, 0.5400361, -0.5861918, 1, 0, 0, 1, 1,
2.040239, -1.085346, 1.375285, 0, 0, 0, 1, 1,
2.103397, 0.9997498, 1.107311, 0, 0, 0, 1, 1,
2.111423, 0.2516477, 3.347343, 0, 0, 0, 1, 1,
2.198328, -0.3537114, 2.243452, 0, 0, 0, 1, 1,
2.273811, -0.1607615, 2.084816, 0, 0, 0, 1, 1,
2.381245, -1.366357, 2.170373, 0, 0, 0, 1, 1,
2.432927, 1.358767, 1.847169, 0, 0, 0, 1, 1,
2.441147, 0.1300621, 0.5991181, 1, 1, 1, 1, 1,
2.552015, 0.3896306, 0.08538846, 1, 1, 1, 1, 1,
2.743363, 1.709367, 0.3208358, 1, 1, 1, 1, 1,
2.816203, -0.07028068, 0.6343594, 1, 1, 1, 1, 1,
3.159141, 0.5824836, 2.235402, 1, 1, 1, 1, 1,
3.290456, -1.299683, 1.303844, 1, 1, 1, 1, 1,
3.827688, -0.5385376, 1.458563, 1, 1, 1, 1, 1
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
var radius = 9.864503;
var distance = 34.64865;
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
mvMatrix.translate( -0.3650253, -0.08605611, 0.6728365 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.64865);
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