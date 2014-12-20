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
-3.679162, -1.28802, -2.799337, 1, 0, 0, 1,
-3.130463, -0.3979604, -2.715505, 1, 0.007843138, 0, 1,
-3.128482, 0.9708206, -2.017164, 1, 0.01176471, 0, 1,
-2.80823, -0.922657, -3.778567, 1, 0.01960784, 0, 1,
-2.678304, 1.75323, -1.520439, 1, 0.02352941, 0, 1,
-2.639235, 1.516412, -1.810873, 1, 0.03137255, 0, 1,
-2.549695, 0.8336284, -0.615024, 1, 0.03529412, 0, 1,
-2.526344, 1.861437, 0.2796146, 1, 0.04313726, 0, 1,
-2.518119, -0.7095566, -0.4438665, 1, 0.04705882, 0, 1,
-2.503971, -1.230868, -4.226419, 1, 0.05490196, 0, 1,
-2.346769, 1.089412, -0.06240145, 1, 0.05882353, 0, 1,
-2.318228, -0.5786937, -2.297754, 1, 0.06666667, 0, 1,
-2.314201, -0.7514542, -1.989602, 1, 0.07058824, 0, 1,
-2.296114, 0.07503705, -0.9734609, 1, 0.07843138, 0, 1,
-2.289183, 0.1832552, -1.858977, 1, 0.08235294, 0, 1,
-2.283581, -0.8835056, -2.059049, 1, 0.09019608, 0, 1,
-2.220345, 0.1488439, -3.033058, 1, 0.09411765, 0, 1,
-2.210004, -0.06497524, -0.4216351, 1, 0.1019608, 0, 1,
-2.09783, 0.1126543, 1.121606, 1, 0.1098039, 0, 1,
-2.088947, -0.04788357, -1.161661, 1, 0.1137255, 0, 1,
-2.058343, -1.299512, -1.3427, 1, 0.1215686, 0, 1,
-2.041667, 0.4087466, -0.9807106, 1, 0.1254902, 0, 1,
-2.040805, 1.107755, 0.8724412, 1, 0.1333333, 0, 1,
-2.019587, -0.7130468, -2.473769, 1, 0.1372549, 0, 1,
-2.017632, 1.749009, 1.512976, 1, 0.145098, 0, 1,
-2.011796, -0.3145033, -3.744766, 1, 0.1490196, 0, 1,
-1.992222, 1.517472, -0.7149632, 1, 0.1568628, 0, 1,
-1.98193, -0.9407935, -2.904805, 1, 0.1607843, 0, 1,
-1.98129, 0.4555257, -1.007526, 1, 0.1686275, 0, 1,
-1.887002, 0.6656526, 0.4011932, 1, 0.172549, 0, 1,
-1.880198, -1.438798, -2.676902, 1, 0.1803922, 0, 1,
-1.861458, 0.4406327, -2.275884, 1, 0.1843137, 0, 1,
-1.832862, -0.06739558, -1.462377, 1, 0.1921569, 0, 1,
-1.787379, 0.9447516, -2.486835, 1, 0.1960784, 0, 1,
-1.776944, -0.6428801, -0.5808027, 1, 0.2039216, 0, 1,
-1.766301, 0.257422, -1.959203, 1, 0.2117647, 0, 1,
-1.762808, 0.7447379, -2.368259, 1, 0.2156863, 0, 1,
-1.755413, -0.07301381, -2.697646, 1, 0.2235294, 0, 1,
-1.741456, -0.5099924, -3.356118, 1, 0.227451, 0, 1,
-1.737098, 0.8750735, -0.3150515, 1, 0.2352941, 0, 1,
-1.727467, -0.08526649, -0.7451589, 1, 0.2392157, 0, 1,
-1.708084, 0.3034118, -2.277603, 1, 0.2470588, 0, 1,
-1.707987, -0.9169766, -3.268596, 1, 0.2509804, 0, 1,
-1.685651, 0.3906598, -2.050255, 1, 0.2588235, 0, 1,
-1.681172, -0.6845425, -1.965664, 1, 0.2627451, 0, 1,
-1.670148, -0.3950542, -3.04791, 1, 0.2705882, 0, 1,
-1.650206, 1.54026, -0.937565, 1, 0.2745098, 0, 1,
-1.646766, -0.4402782, -1.45125, 1, 0.282353, 0, 1,
-1.620111, -0.9673656, -3.261228, 1, 0.2862745, 0, 1,
-1.618057, 1.091637, -2.729436, 1, 0.2941177, 0, 1,
-1.613809, 1.3995, -1.50205, 1, 0.3019608, 0, 1,
-1.609698, 0.5433214, -1.894554, 1, 0.3058824, 0, 1,
-1.593875, -1.593831, -3.203879, 1, 0.3137255, 0, 1,
-1.591457, -2.110742, -1.107355, 1, 0.3176471, 0, 1,
-1.579334, 1.224372, -0.604538, 1, 0.3254902, 0, 1,
-1.560068, -1.011041, -1.243371, 1, 0.3294118, 0, 1,
-1.558145, -0.7091646, -3.078292, 1, 0.3372549, 0, 1,
-1.551907, -1.124269, -3.380847, 1, 0.3411765, 0, 1,
-1.548987, 0.801485, -2.673648, 1, 0.3490196, 0, 1,
-1.547228, 0.602117, -0.4520518, 1, 0.3529412, 0, 1,
-1.527045, -0.6331363, -4.490232, 1, 0.3607843, 0, 1,
-1.518326, 1.211754, -2.875541, 1, 0.3647059, 0, 1,
-1.505455, 0.2085896, 0.2261777, 1, 0.372549, 0, 1,
-1.499144, 0.08608213, -0.5747414, 1, 0.3764706, 0, 1,
-1.492156, 1.686306, -1.233751, 1, 0.3843137, 0, 1,
-1.487915, -0.6617175, -2.689862, 1, 0.3882353, 0, 1,
-1.469704, -0.04161851, -2.336523, 1, 0.3960784, 0, 1,
-1.469613, 1.538713, -0.4404909, 1, 0.4039216, 0, 1,
-1.468514, 0.3879228, -1.896821, 1, 0.4078431, 0, 1,
-1.46591, 0.01427881, -2.47205, 1, 0.4156863, 0, 1,
-1.454845, 0.2243693, -1.871777, 1, 0.4196078, 0, 1,
-1.451812, 0.7698558, 0.1977767, 1, 0.427451, 0, 1,
-1.449939, -0.8208133, -1.920504, 1, 0.4313726, 0, 1,
-1.447715, 1.007113, -1.901535, 1, 0.4392157, 0, 1,
-1.419691, -0.1585753, -0.9536693, 1, 0.4431373, 0, 1,
-1.415965, 0.9981557, -1.154788, 1, 0.4509804, 0, 1,
-1.414023, -0.2304856, -2.412407, 1, 0.454902, 0, 1,
-1.409959, 1.037298, -1.888154, 1, 0.4627451, 0, 1,
-1.4065, -1.41089, -1.588155, 1, 0.4666667, 0, 1,
-1.399003, -0.04596708, 0.3166892, 1, 0.4745098, 0, 1,
-1.394661, 0.8302565, -2.412731, 1, 0.4784314, 0, 1,
-1.39312, 1.136292, -2.070372, 1, 0.4862745, 0, 1,
-1.387866, 0.6713805, -1.831235, 1, 0.4901961, 0, 1,
-1.386525, -0.2259417, -2.54343, 1, 0.4980392, 0, 1,
-1.38542, 1.715127, 0.222726, 1, 0.5058824, 0, 1,
-1.382424, -0.3412168, -0.6135569, 1, 0.509804, 0, 1,
-1.380423, 0.8873905, -0.3652341, 1, 0.5176471, 0, 1,
-1.379157, 0.8579946, -1.594171, 1, 0.5215687, 0, 1,
-1.364945, -1.019622, -1.368327, 1, 0.5294118, 0, 1,
-1.353895, 0.3125879, -3.472201, 1, 0.5333334, 0, 1,
-1.351708, 0.1367171, -2.215747, 1, 0.5411765, 0, 1,
-1.331408, -0.5304514, -1.919869, 1, 0.5450981, 0, 1,
-1.330727, -0.9112533, -1.746615, 1, 0.5529412, 0, 1,
-1.326969, 0.2312751, -0.8450245, 1, 0.5568628, 0, 1,
-1.323127, 0.06958941, -1.142454, 1, 0.5647059, 0, 1,
-1.318532, -0.4554515, -2.125548, 1, 0.5686275, 0, 1,
-1.304157, 0.7880976, -0.6164119, 1, 0.5764706, 0, 1,
-1.30208, 0.03248727, -2.010366, 1, 0.5803922, 0, 1,
-1.30199, -0.647105, -2.974196, 1, 0.5882353, 0, 1,
-1.300389, 0.6279597, -0.4219734, 1, 0.5921569, 0, 1,
-1.297814, -0.9232791, -2.034859, 1, 0.6, 0, 1,
-1.296628, 0.1423258, -1.675244, 1, 0.6078432, 0, 1,
-1.294332, 0.5127973, -0.4291199, 1, 0.6117647, 0, 1,
-1.287802, -0.7590548, -2.585259, 1, 0.6196079, 0, 1,
-1.275069, -0.9350464, -3.57538, 1, 0.6235294, 0, 1,
-1.269747, -1.364849, -1.800992, 1, 0.6313726, 0, 1,
-1.265682, 0.5690004, -1.223526, 1, 0.6352941, 0, 1,
-1.261674, 0.2081121, -0.8645406, 1, 0.6431373, 0, 1,
-1.252381, -1.156039, -2.677999, 1, 0.6470588, 0, 1,
-1.25158, 0.7495892, 0.6831996, 1, 0.654902, 0, 1,
-1.241378, -0.5106171, -2.870316, 1, 0.6588235, 0, 1,
-1.241177, -1.543768, -3.276052, 1, 0.6666667, 0, 1,
-1.225541, 0.8610209, -0.07923596, 1, 0.6705883, 0, 1,
-1.225477, 0.8125348, -0.3911191, 1, 0.6784314, 0, 1,
-1.225401, -0.01596302, -3.172193, 1, 0.682353, 0, 1,
-1.224913, -1.802683, -1.437899, 1, 0.6901961, 0, 1,
-1.219932, 1.613606, -1.656032, 1, 0.6941177, 0, 1,
-1.21495, -0.7902893, -2.754919, 1, 0.7019608, 0, 1,
-1.211044, 1.228563, 0.5154368, 1, 0.7098039, 0, 1,
-1.202626, -0.5098665, -2.918128, 1, 0.7137255, 0, 1,
-1.197908, 0.5991299, -1.35017, 1, 0.7215686, 0, 1,
-1.189821, 1.538498, -0.2479749, 1, 0.7254902, 0, 1,
-1.188661, 1.017748, -0.09294452, 1, 0.7333333, 0, 1,
-1.178031, 0.1894903, -1.498135, 1, 0.7372549, 0, 1,
-1.17298, 1.264771, -0.4286561, 1, 0.7450981, 0, 1,
-1.145131, 1.465466, -0.6464517, 1, 0.7490196, 0, 1,
-1.142708, -0.1230117, -1.929574, 1, 0.7568628, 0, 1,
-1.140838, 0.5998367, -1.835939, 1, 0.7607843, 0, 1,
-1.138981, -0.2849526, -2.060494, 1, 0.7686275, 0, 1,
-1.134935, -1.075081, -2.439045, 1, 0.772549, 0, 1,
-1.127057, -1.32597, -1.825806, 1, 0.7803922, 0, 1,
-1.125332, -2.117166, -3.849587, 1, 0.7843137, 0, 1,
-1.119316, 0.4062288, -1.532259, 1, 0.7921569, 0, 1,
-1.107452, -0.9982495, -2.162054, 1, 0.7960784, 0, 1,
-1.103482, -0.3149668, -3.313684, 1, 0.8039216, 0, 1,
-1.100331, 0.6570938, -1.092221, 1, 0.8117647, 0, 1,
-1.097474, -0.3936457, -1.473417, 1, 0.8156863, 0, 1,
-1.091945, -0.3325457, -2.919653, 1, 0.8235294, 0, 1,
-1.082513, -0.9793266, -0.695936, 1, 0.827451, 0, 1,
-1.076026, -2.077938, -3.528306, 1, 0.8352941, 0, 1,
-1.069163, 0.683942, -2.716237, 1, 0.8392157, 0, 1,
-1.06669, 1.352376, 0.2773094, 1, 0.8470588, 0, 1,
-1.063428, 0.6629764, -2.160959, 1, 0.8509804, 0, 1,
-1.060203, -1.846079, -3.884943, 1, 0.8588235, 0, 1,
-1.060062, -0.2735386, -0.3914236, 1, 0.8627451, 0, 1,
-1.046361, 0.5684912, -0.1511841, 1, 0.8705882, 0, 1,
-1.033707, 0.2458213, -0.1845343, 1, 0.8745098, 0, 1,
-1.027607, -0.6938323, -2.075482, 1, 0.8823529, 0, 1,
-1.027397, -1.253267, -2.059362, 1, 0.8862745, 0, 1,
-1.017114, 0.6109701, -1.333367, 1, 0.8941177, 0, 1,
-1.001252, -0.4224654, -0.725311, 1, 0.8980392, 0, 1,
-1.000072, -0.02894952, -0.4625462, 1, 0.9058824, 0, 1,
-0.9995025, -0.04049893, -1.416413, 1, 0.9137255, 0, 1,
-0.9890735, 0.8161659, 0.129471, 1, 0.9176471, 0, 1,
-0.9852124, -0.4488631, -0.02430982, 1, 0.9254902, 0, 1,
-0.9831967, -0.1177218, -1.846927, 1, 0.9294118, 0, 1,
-0.9825082, -0.4292901, -3.060604, 1, 0.9372549, 0, 1,
-0.9822912, -0.8529978, -0.5169709, 1, 0.9411765, 0, 1,
-0.978108, 0.9684823, 0.5067854, 1, 0.9490196, 0, 1,
-0.9695352, -1.326206, -2.257836, 1, 0.9529412, 0, 1,
-0.9553113, -0.4556728, -1.627964, 1, 0.9607843, 0, 1,
-0.9547252, -0.3741969, -2.382306, 1, 0.9647059, 0, 1,
-0.9540598, 1.056102, -0.5211272, 1, 0.972549, 0, 1,
-0.9527822, -0.266699, -0.984939, 1, 0.9764706, 0, 1,
-0.9448256, -0.03669831, -2.130569, 1, 0.9843137, 0, 1,
-0.9441882, -0.9068477, -1.763192, 1, 0.9882353, 0, 1,
-0.9440737, 0.2780584, 0.5522493, 1, 0.9960784, 0, 1,
-0.9354046, 0.6503307, -0.455065, 0.9960784, 1, 0, 1,
-0.9272933, -0.473035, 0.2746144, 0.9921569, 1, 0, 1,
-0.9266912, -0.7256427, -1.5039, 0.9843137, 1, 0, 1,
-0.9263055, -0.08574322, -2.658178, 0.9803922, 1, 0, 1,
-0.9228889, 0.2965168, -0.9892181, 0.972549, 1, 0, 1,
-0.9171261, 1.492138, 0.2125356, 0.9686275, 1, 0, 1,
-0.9165319, -1.75688, -1.706519, 0.9607843, 1, 0, 1,
-0.9140388, 0.1574221, -1.683338, 0.9568627, 1, 0, 1,
-0.9136038, 1.137889, -0.761176, 0.9490196, 1, 0, 1,
-0.9128305, -1.842178, -2.887747, 0.945098, 1, 0, 1,
-0.904143, 1.011634, 0.3276543, 0.9372549, 1, 0, 1,
-0.9019977, -0.8351481, -3.028179, 0.9333333, 1, 0, 1,
-0.8983868, -2.076057, -2.913284, 0.9254902, 1, 0, 1,
-0.889656, 0.8064529, -2.603512, 0.9215686, 1, 0, 1,
-0.8861005, 1.1562, -0.6767623, 0.9137255, 1, 0, 1,
-0.8823034, -0.3001232, -3.475077, 0.9098039, 1, 0, 1,
-0.8822376, 2.262292, -0.1163272, 0.9019608, 1, 0, 1,
-0.8786526, 0.4112955, -3.274869, 0.8941177, 1, 0, 1,
-0.869487, 1.29782, -0.7810789, 0.8901961, 1, 0, 1,
-0.8682389, 0.3824865, -2.20783, 0.8823529, 1, 0, 1,
-0.8608146, -0.1896679, -2.744605, 0.8784314, 1, 0, 1,
-0.859652, 0.1960927, -0.9491377, 0.8705882, 1, 0, 1,
-0.8561323, 2.801101, -0.6578799, 0.8666667, 1, 0, 1,
-0.8560044, 0.1663362, -0.1985792, 0.8588235, 1, 0, 1,
-0.8474831, 0.2369406, 0.1001036, 0.854902, 1, 0, 1,
-0.8417533, -0.5182623, -0.8938052, 0.8470588, 1, 0, 1,
-0.8364161, -0.5760309, -2.556818, 0.8431373, 1, 0, 1,
-0.8361354, -1.676412, -2.668799, 0.8352941, 1, 0, 1,
-0.8357911, 1.098368, -1.523172, 0.8313726, 1, 0, 1,
-0.8330375, 0.619381, -1.729007, 0.8235294, 1, 0, 1,
-0.8328642, -0.8255003, -2.606575, 0.8196079, 1, 0, 1,
-0.8294134, 0.2017, -0.8864338, 0.8117647, 1, 0, 1,
-0.8246101, 0.9293412, 0.5319246, 0.8078431, 1, 0, 1,
-0.8226364, 0.9771935, -0.8444274, 0.8, 1, 0, 1,
-0.817075, 1.12533, -1.302673, 0.7921569, 1, 0, 1,
-0.8159967, -0.9460967, -2.797237, 0.7882353, 1, 0, 1,
-0.8153954, 0.2772531, -0.5517513, 0.7803922, 1, 0, 1,
-0.8132175, 0.2808651, -0.584058, 0.7764706, 1, 0, 1,
-0.8111393, -0.1240029, -2.259986, 0.7686275, 1, 0, 1,
-0.8095506, 0.2611822, 0.4031124, 0.7647059, 1, 0, 1,
-0.8076586, 0.468014, 0.8418199, 0.7568628, 1, 0, 1,
-0.8052033, 0.3334156, -1.897377, 0.7529412, 1, 0, 1,
-0.8051614, -1.267613, -3.682813, 0.7450981, 1, 0, 1,
-0.799753, -1.401477, -2.98936, 0.7411765, 1, 0, 1,
-0.7979269, -0.1838247, -2.569723, 0.7333333, 1, 0, 1,
-0.7940061, 0.4272241, -1.743163, 0.7294118, 1, 0, 1,
-0.788367, 1.558378, -1.696518, 0.7215686, 1, 0, 1,
-0.7883606, 0.3641612, -2.077528, 0.7176471, 1, 0, 1,
-0.7876011, 0.739852, -0.2873607, 0.7098039, 1, 0, 1,
-0.7835631, -0.6635539, -2.41204, 0.7058824, 1, 0, 1,
-0.7755694, 1.37457, -1.322545, 0.6980392, 1, 0, 1,
-0.7739729, -0.04533663, -3.999563, 0.6901961, 1, 0, 1,
-0.7722056, 0.08991875, -1.643564, 0.6862745, 1, 0, 1,
-0.764846, 1.494359, -3.265159, 0.6784314, 1, 0, 1,
-0.764515, 1.060306, -0.8331681, 0.6745098, 1, 0, 1,
-0.760427, 0.05054195, -3.305325, 0.6666667, 1, 0, 1,
-0.7533175, 0.7105635, -0.6659085, 0.6627451, 1, 0, 1,
-0.7424051, -0.2464983, -1.284524, 0.654902, 1, 0, 1,
-0.7329124, -1.126601, -2.325624, 0.6509804, 1, 0, 1,
-0.7320683, -0.4474516, -0.5936409, 0.6431373, 1, 0, 1,
-0.7286579, 0.7454236, -2.090727, 0.6392157, 1, 0, 1,
-0.7227372, -0.01339689, -1.288297, 0.6313726, 1, 0, 1,
-0.7222577, -0.1384658, -2.420152, 0.627451, 1, 0, 1,
-0.7190387, 1.581482, -1.136562, 0.6196079, 1, 0, 1,
-0.7177473, -1.383306, -3.54195, 0.6156863, 1, 0, 1,
-0.7172079, 0.9413258, -0.7849963, 0.6078432, 1, 0, 1,
-0.7151835, 0.6572689, -1.75365, 0.6039216, 1, 0, 1,
-0.7150801, 1.365561, -0.3628883, 0.5960785, 1, 0, 1,
-0.7096456, -0.739244, -3.569376, 0.5882353, 1, 0, 1,
-0.7072393, 0.5775057, -0.9110094, 0.5843138, 1, 0, 1,
-0.7051824, -0.1345046, 0.1696495, 0.5764706, 1, 0, 1,
-0.7045339, -0.9999478, -4.470783, 0.572549, 1, 0, 1,
-0.6999966, 0.98846, -1.480849, 0.5647059, 1, 0, 1,
-0.6994566, 0.7167119, -0.8501541, 0.5607843, 1, 0, 1,
-0.69936, 0.3164603, -1.085083, 0.5529412, 1, 0, 1,
-0.6972719, 2.05996, -1.050119, 0.5490196, 1, 0, 1,
-0.6933979, 0.3499684, -0.5431907, 0.5411765, 1, 0, 1,
-0.6849647, 0.1762482, -0.7766103, 0.5372549, 1, 0, 1,
-0.6842408, 0.1306042, -1.777927, 0.5294118, 1, 0, 1,
-0.6834527, 0.9151919, 0.2693984, 0.5254902, 1, 0, 1,
-0.6808967, 1.267373, -0.7545931, 0.5176471, 1, 0, 1,
-0.6773452, 0.03260114, -1.629136, 0.5137255, 1, 0, 1,
-0.6770676, 1.21629, -2.415697, 0.5058824, 1, 0, 1,
-0.6767235, 1.74313, -1.57769, 0.5019608, 1, 0, 1,
-0.6727134, -0.6103865, -2.284, 0.4941176, 1, 0, 1,
-0.6718506, 1.05863, -0.2328883, 0.4862745, 1, 0, 1,
-0.6703306, -1.476798, -3.569196, 0.4823529, 1, 0, 1,
-0.6679367, 0.5407995, -0.6525468, 0.4745098, 1, 0, 1,
-0.6652802, 1.30268, -1.912748, 0.4705882, 1, 0, 1,
-0.6600815, -0.5037444, 0.1281073, 0.4627451, 1, 0, 1,
-0.647305, -0.1082722, -2.088735, 0.4588235, 1, 0, 1,
-0.633862, 1.156805, -0.3093488, 0.4509804, 1, 0, 1,
-0.6299748, -0.8843455, -3.497902, 0.4470588, 1, 0, 1,
-0.6265531, 0.3042538, -1.724238, 0.4392157, 1, 0, 1,
-0.6241608, -1.059814, -1.636942, 0.4352941, 1, 0, 1,
-0.6228867, 1.370786, 1.049565, 0.427451, 1, 0, 1,
-0.6188717, 1.682092, 0.160952, 0.4235294, 1, 0, 1,
-0.6124342, 1.256491, -0.4095326, 0.4156863, 1, 0, 1,
-0.612268, 0.7317141, 0.3172943, 0.4117647, 1, 0, 1,
-0.6096331, 0.1717898, 1.168249, 0.4039216, 1, 0, 1,
-0.609067, 0.8649629, -1.306435, 0.3960784, 1, 0, 1,
-0.6051449, -1.471498, -2.584461, 0.3921569, 1, 0, 1,
-0.6038785, 0.433058, -0.5183859, 0.3843137, 1, 0, 1,
-0.603867, 1.541467, 1.685418, 0.3803922, 1, 0, 1,
-0.6030893, -0.7938403, -1.525227, 0.372549, 1, 0, 1,
-0.5994633, -1.369632, -2.838829, 0.3686275, 1, 0, 1,
-0.5984337, 0.6192166, -0.6108198, 0.3607843, 1, 0, 1,
-0.5974065, -0.8152632, -2.848198, 0.3568628, 1, 0, 1,
-0.5933791, -0.04478358, -2.58984, 0.3490196, 1, 0, 1,
-0.5899517, 0.3838058, -0.5141305, 0.345098, 1, 0, 1,
-0.5824744, 0.09721401, -0.3385744, 0.3372549, 1, 0, 1,
-0.5809906, 0.9247354, -1.394566, 0.3333333, 1, 0, 1,
-0.5805184, -0.2476628, -0.8721259, 0.3254902, 1, 0, 1,
-0.580427, -1.517247, -2.706291, 0.3215686, 1, 0, 1,
-0.5778751, 0.7113801, -0.2371339, 0.3137255, 1, 0, 1,
-0.5763894, -0.3097665, -1.331677, 0.3098039, 1, 0, 1,
-0.5725187, 0.9530507, -1.784552, 0.3019608, 1, 0, 1,
-0.5718561, 0.3991585, -1.142469, 0.2941177, 1, 0, 1,
-0.5696787, 0.555388, -0.2723562, 0.2901961, 1, 0, 1,
-0.5601285, 0.6808993, -0.4884444, 0.282353, 1, 0, 1,
-0.5591798, -0.02036433, -2.371594, 0.2784314, 1, 0, 1,
-0.5589954, 0.894002, -0.4365504, 0.2705882, 1, 0, 1,
-0.5577145, -0.1374378, -0.3918872, 0.2666667, 1, 0, 1,
-0.5570258, -0.08439818, -0.2604772, 0.2588235, 1, 0, 1,
-0.5523359, -0.8585118, -1.960322, 0.254902, 1, 0, 1,
-0.549639, 0.4346214, -0.9558353, 0.2470588, 1, 0, 1,
-0.5486442, -1.24095, -2.13345, 0.2431373, 1, 0, 1,
-0.5434495, 0.09951232, -1.530802, 0.2352941, 1, 0, 1,
-0.5337529, -0.36193, -2.903911, 0.2313726, 1, 0, 1,
-0.5278777, 0.5807455, -0.1963458, 0.2235294, 1, 0, 1,
-0.5262001, 2.376531, 0.6240812, 0.2196078, 1, 0, 1,
-0.5250084, 1.931377, -0.2151452, 0.2117647, 1, 0, 1,
-0.5182886, -2.054363, -1.251697, 0.2078431, 1, 0, 1,
-0.5174985, 0.6624842, -0.2917506, 0.2, 1, 0, 1,
-0.5147883, 0.5555968, -1.328826, 0.1921569, 1, 0, 1,
-0.5122787, -2.057795, -3.268088, 0.1882353, 1, 0, 1,
-0.5082348, 0.6067998, -1.187019, 0.1803922, 1, 0, 1,
-0.504471, 0.781458, -1.554105, 0.1764706, 1, 0, 1,
-0.5026847, -0.4247702, -2.329885, 0.1686275, 1, 0, 1,
-0.5017135, 0.5332272, 0.1939631, 0.1647059, 1, 0, 1,
-0.5015093, 0.1820283, 0.1813797, 0.1568628, 1, 0, 1,
-0.4984747, -0.01491075, -0.6465154, 0.1529412, 1, 0, 1,
-0.495751, -0.4848247, -2.587096, 0.145098, 1, 0, 1,
-0.4955137, -0.08797027, -1.241739, 0.1411765, 1, 0, 1,
-0.4951325, 1.315385, -1.173595, 0.1333333, 1, 0, 1,
-0.4867773, 0.5806273, -1.455563, 0.1294118, 1, 0, 1,
-0.4866059, -0.08116297, -2.11163, 0.1215686, 1, 0, 1,
-0.4860782, 0.839096, -1.529493, 0.1176471, 1, 0, 1,
-0.4837635, -0.8174369, -2.937992, 0.1098039, 1, 0, 1,
-0.4817762, 0.256009, -0.5910591, 0.1058824, 1, 0, 1,
-0.4785345, 0.606464, 0.4087506, 0.09803922, 1, 0, 1,
-0.4766595, -0.5917894, -3.690419, 0.09019608, 1, 0, 1,
-0.4694372, -0.3606492, -2.007854, 0.08627451, 1, 0, 1,
-0.4668839, 0.7537768, -0.9528732, 0.07843138, 1, 0, 1,
-0.4653496, 0.4893644, -1.686565, 0.07450981, 1, 0, 1,
-0.4646904, -0.8202156, -2.768499, 0.06666667, 1, 0, 1,
-0.4618109, -0.7982405, -3.563532, 0.0627451, 1, 0, 1,
-0.4598611, -1.090922, -3.845028, 0.05490196, 1, 0, 1,
-0.4587789, -2.905861, -2.164085, 0.05098039, 1, 0, 1,
-0.455524, 1.335595, -0.06655161, 0.04313726, 1, 0, 1,
-0.4547374, -0.5701023, -1.125453, 0.03921569, 1, 0, 1,
-0.45452, 0.2447376, -1.665281, 0.03137255, 1, 0, 1,
-0.4540423, -0.2270412, -2.59359, 0.02745098, 1, 0, 1,
-0.4490006, -0.3695217, -1.698542, 0.01960784, 1, 0, 1,
-0.4405358, -1.057036, -1.93247, 0.01568628, 1, 0, 1,
-0.4381047, -1.190037, -2.383628, 0.007843138, 1, 0, 1,
-0.4248781, -0.9691451, -2.003777, 0.003921569, 1, 0, 1,
-0.4207834, -1.81084, -2.158559, 0, 1, 0.003921569, 1,
-0.4207757, 0.3001259, 0.4260269, 0, 1, 0.01176471, 1,
-0.417869, -0.8546016, -1.895653, 0, 1, 0.01568628, 1,
-0.4152797, -0.6019443, -2.747572, 0, 1, 0.02352941, 1,
-0.4132926, 1.193419, -0.8227811, 0, 1, 0.02745098, 1,
-0.4117517, -0.6235809, -3.19752, 0, 1, 0.03529412, 1,
-0.4077837, 0.1005329, -1.386722, 0, 1, 0.03921569, 1,
-0.4060622, -0.6499212, -2.752926, 0, 1, 0.04705882, 1,
-0.4035768, -1.401613, -3.489267, 0, 1, 0.05098039, 1,
-0.3992634, 0.09320078, -2.578354, 0, 1, 0.05882353, 1,
-0.3969861, 0.9463991, 0.01335188, 0, 1, 0.0627451, 1,
-0.3962762, 0.1702872, -2.041292, 0, 1, 0.07058824, 1,
-0.3962399, -0.4205446, -1.024278, 0, 1, 0.07450981, 1,
-0.3957985, 1.682759, -0.872481, 0, 1, 0.08235294, 1,
-0.3931262, -1.228047, -2.822855, 0, 1, 0.08627451, 1,
-0.3908515, -2.717513, -1.945991, 0, 1, 0.09411765, 1,
-0.3786207, 0.5648614, -0.2450668, 0, 1, 0.1019608, 1,
-0.3783103, 1.166608, -0.3219322, 0, 1, 0.1058824, 1,
-0.3774523, -1.572547, -2.476397, 0, 1, 0.1137255, 1,
-0.3760146, -1.833959, -1.773519, 0, 1, 0.1176471, 1,
-0.3737427, -0.6872335, -1.892289, 0, 1, 0.1254902, 1,
-0.3667597, 0.347624, -0.2494989, 0, 1, 0.1294118, 1,
-0.3630894, -1.345816, -2.068581, 0, 1, 0.1372549, 1,
-0.3555356, -0.2582097, -2.372471, 0, 1, 0.1411765, 1,
-0.3479193, -0.997642, -0.6616067, 0, 1, 0.1490196, 1,
-0.3445749, 1.021959, 0.2064843, 0, 1, 0.1529412, 1,
-0.3394185, 0.6814553, 0.1725463, 0, 1, 0.1607843, 1,
-0.3362977, -0.9464304, -2.518714, 0, 1, 0.1647059, 1,
-0.3336217, -0.3503525, -2.394367, 0, 1, 0.172549, 1,
-0.330591, -0.3386621, -2.419248, 0, 1, 0.1764706, 1,
-0.3255963, -0.5006502, -0.9839849, 0, 1, 0.1843137, 1,
-0.321361, -0.004114063, -0.2943963, 0, 1, 0.1882353, 1,
-0.3192151, 1.395968, -0.06686195, 0, 1, 0.1960784, 1,
-0.3082167, 0.8869674, 0.7025704, 0, 1, 0.2039216, 1,
-0.3068973, 1.032973, -0.4310354, 0, 1, 0.2078431, 1,
-0.3050199, -0.6390679, -5.207593, 0, 1, 0.2156863, 1,
-0.3037664, -1.238359, -1.318649, 0, 1, 0.2196078, 1,
-0.3011448, -0.4155825, -2.83841, 0, 1, 0.227451, 1,
-0.2961007, 2.367157, 0.04973851, 0, 1, 0.2313726, 1,
-0.2922644, -0.1361426, -3.191047, 0, 1, 0.2392157, 1,
-0.2883405, 0.2500296, -0.3631132, 0, 1, 0.2431373, 1,
-0.2877118, -0.5159309, -2.614985, 0, 1, 0.2509804, 1,
-0.2841942, 2.719826, -0.5174158, 0, 1, 0.254902, 1,
-0.283444, 1.565363, -1.750819, 0, 1, 0.2627451, 1,
-0.2791587, -1.072754, -3.351723, 0, 1, 0.2666667, 1,
-0.2782635, 1.140906, -1.016785, 0, 1, 0.2745098, 1,
-0.2776108, 0.1747551, -0.5536756, 0, 1, 0.2784314, 1,
-0.2774666, -0.9277661, -2.508452, 0, 1, 0.2862745, 1,
-0.2773534, 1.023344, -0.5647504, 0, 1, 0.2901961, 1,
-0.2757095, 0.8077245, -0.5563143, 0, 1, 0.2980392, 1,
-0.274395, -0.2074568, -0.9033116, 0, 1, 0.3058824, 1,
-0.2717864, -1.383739, -1.499106, 0, 1, 0.3098039, 1,
-0.2716947, 1.078093, -0.7875294, 0, 1, 0.3176471, 1,
-0.2691768, 0.09406453, -0.3244342, 0, 1, 0.3215686, 1,
-0.2681829, 0.2495076, -1.697373, 0, 1, 0.3294118, 1,
-0.2668656, -0.3542966, -2.828718, 0, 1, 0.3333333, 1,
-0.2663497, 0.7124474, 0.2712102, 0, 1, 0.3411765, 1,
-0.2626323, 1.927932, -0.2891821, 0, 1, 0.345098, 1,
-0.261781, -0.02474147, -2.248657, 0, 1, 0.3529412, 1,
-0.2612697, -0.651379, -1.487281, 0, 1, 0.3568628, 1,
-0.2597868, -0.34956, -2.280962, 0, 1, 0.3647059, 1,
-0.2592615, -0.6540071, -3.583815, 0, 1, 0.3686275, 1,
-0.2590473, 0.02291208, -1.664742, 0, 1, 0.3764706, 1,
-0.2571069, -0.945126, -3.304738, 0, 1, 0.3803922, 1,
-0.2531547, -1.725048, -2.695323, 0, 1, 0.3882353, 1,
-0.2527601, -0.6409485, -3.9508, 0, 1, 0.3921569, 1,
-0.2431985, 0.7198578, 0.1361453, 0, 1, 0.4, 1,
-0.2420017, -0.5179692, 0.3020976, 0, 1, 0.4078431, 1,
-0.2396028, -0.4559617, -3.973594, 0, 1, 0.4117647, 1,
-0.239293, 0.746416, 0.324897, 0, 1, 0.4196078, 1,
-0.2384747, 0.5852546, 1.227798, 0, 1, 0.4235294, 1,
-0.2307059, -1.732553, -1.98082, 0, 1, 0.4313726, 1,
-0.2281547, -0.8085294, -1.684454, 0, 1, 0.4352941, 1,
-0.2261077, 0.2315635, -1.353415, 0, 1, 0.4431373, 1,
-0.2253796, -0.01147935, -2.495058, 0, 1, 0.4470588, 1,
-0.2243186, -0.008794726, -0.9835268, 0, 1, 0.454902, 1,
-0.2213203, -0.1784216, -3.440458, 0, 1, 0.4588235, 1,
-0.2196684, -1.723701, -3.209489, 0, 1, 0.4666667, 1,
-0.2180099, -0.2407966, -0.7863922, 0, 1, 0.4705882, 1,
-0.2175915, -1.33524, -5.044517, 0, 1, 0.4784314, 1,
-0.2169494, -0.9971913, -2.924035, 0, 1, 0.4823529, 1,
-0.2110575, 0.3920265, -2.24872, 0, 1, 0.4901961, 1,
-0.2074578, -0.3468626, -1.13553, 0, 1, 0.4941176, 1,
-0.2068455, 0.789436, 0.7528533, 0, 1, 0.5019608, 1,
-0.2063059, -0.0318037, -2.065879, 0, 1, 0.509804, 1,
-0.2022724, 0.06396358, -1.359998, 0, 1, 0.5137255, 1,
-0.2009202, -0.7958886, -2.524513, 0, 1, 0.5215687, 1,
-0.2008578, 0.0508394, -1.41448, 0, 1, 0.5254902, 1,
-0.1952637, -0.3512715, -2.080972, 0, 1, 0.5333334, 1,
-0.1910757, -0.4275141, -3.169085, 0, 1, 0.5372549, 1,
-0.191061, 0.7050681, 0.9253238, 0, 1, 0.5450981, 1,
-0.1882756, 0.8019834, -0.2272473, 0, 1, 0.5490196, 1,
-0.1873062, 0.1103347, -2.409243, 0, 1, 0.5568628, 1,
-0.186495, -1.215541, -2.224855, 0, 1, 0.5607843, 1,
-0.1829714, 1.936202, 0.5514616, 0, 1, 0.5686275, 1,
-0.176312, -1.630664, -4.304721, 0, 1, 0.572549, 1,
-0.1747248, -1.452482, -1.416135, 0, 1, 0.5803922, 1,
-0.1695278, -0.5289866, -2.531477, 0, 1, 0.5843138, 1,
-0.1693005, -0.2051437, -2.531087, 0, 1, 0.5921569, 1,
-0.167456, 1.831143, 0.3281522, 0, 1, 0.5960785, 1,
-0.1664637, -1.066202, -4.645156, 0, 1, 0.6039216, 1,
-0.1569101, 0.3978358, 0.8613196, 0, 1, 0.6117647, 1,
-0.1561347, -0.5627021, -2.432229, 0, 1, 0.6156863, 1,
-0.1559042, 0.7374889, 1.166258, 0, 1, 0.6235294, 1,
-0.154652, 1.243317, 1.114361, 0, 1, 0.627451, 1,
-0.1533314, -0.671496, -4.252235, 0, 1, 0.6352941, 1,
-0.1520409, -0.3308572, -3.128629, 0, 1, 0.6392157, 1,
-0.1479418, 1.046937, -2.544861, 0, 1, 0.6470588, 1,
-0.1442044, -0.3067462, -1.99458, 0, 1, 0.6509804, 1,
-0.1438883, 1.10568, -0.8389011, 0, 1, 0.6588235, 1,
-0.1434057, 0.466463, -1.128288, 0, 1, 0.6627451, 1,
-0.1425077, -1.708007, -3.982692, 0, 1, 0.6705883, 1,
-0.1421775, 0.5925499, 1.560582, 0, 1, 0.6745098, 1,
-0.1358375, 0.8606041, 1.726805, 0, 1, 0.682353, 1,
-0.133561, -2.737922, -1.947875, 0, 1, 0.6862745, 1,
-0.1313929, 0.2393923, -1.635461, 0, 1, 0.6941177, 1,
-0.1268829, 0.1441302, -1.679448, 0, 1, 0.7019608, 1,
-0.1213691, -0.1517287, -4.257019, 0, 1, 0.7058824, 1,
-0.1198555, -0.2937896, -2.243737, 0, 1, 0.7137255, 1,
-0.1158183, 0.3091485, 0.454763, 0, 1, 0.7176471, 1,
-0.1109568, 0.8512618, 0.197787, 0, 1, 0.7254902, 1,
-0.1077518, -0.4380747, -2.57146, 0, 1, 0.7294118, 1,
-0.1073927, -0.974994, -2.299471, 0, 1, 0.7372549, 1,
-0.1065635, 0.4950604, 1.199724, 0, 1, 0.7411765, 1,
-0.1008858, 0.9364528, 0.1364655, 0, 1, 0.7490196, 1,
-0.09969898, 0.3958537, -0.9914777, 0, 1, 0.7529412, 1,
-0.09903294, 0.1533239, -1.000136, 0, 1, 0.7607843, 1,
-0.09727731, 1.682541, 1.384724, 0, 1, 0.7647059, 1,
-0.09504059, 1.445035, -0.2548245, 0, 1, 0.772549, 1,
-0.09431191, -1.042479, -2.228016, 0, 1, 0.7764706, 1,
-0.09315353, -1.824965, -4.318717, 0, 1, 0.7843137, 1,
-0.09251032, 0.7595001, -2.133202, 0, 1, 0.7882353, 1,
-0.09138764, -0.8386277, -3.360271, 0, 1, 0.7960784, 1,
-0.08855895, 0.2978806, 0.263198, 0, 1, 0.8039216, 1,
-0.08766926, 0.3763944, -0.7911025, 0, 1, 0.8078431, 1,
-0.0844995, -1.421954, -3.635056, 0, 1, 0.8156863, 1,
-0.08160173, 0.0338024, -2.286649, 0, 1, 0.8196079, 1,
-0.07523668, -1.657065, -3.928732, 0, 1, 0.827451, 1,
-0.07332317, 1.156473, 0.2835681, 0, 1, 0.8313726, 1,
-0.07176515, 0.04740157, -0.5014505, 0, 1, 0.8392157, 1,
-0.06856679, -0.06379101, -0.4937638, 0, 1, 0.8431373, 1,
-0.0647079, 1.146802, -0.01531057, 0, 1, 0.8509804, 1,
-0.06190807, -0.7033246, -3.654878, 0, 1, 0.854902, 1,
-0.05783689, -0.4334565, -1.386206, 0, 1, 0.8627451, 1,
-0.0526388, 1.626928, -0.6376594, 0, 1, 0.8666667, 1,
-0.05194208, -1.142686, -3.255652, 0, 1, 0.8745098, 1,
-0.05105973, -0.09559014, -3.770431, 0, 1, 0.8784314, 1,
-0.04890211, -0.5352314, -5.253701, 0, 1, 0.8862745, 1,
-0.04867546, 0.05665515, -0.0592962, 0, 1, 0.8901961, 1,
-0.04853039, -0.4438972, -3.894368, 0, 1, 0.8980392, 1,
-0.04667227, -0.4972643, -3.505214, 0, 1, 0.9058824, 1,
-0.04441475, -0.3317438, -4.381475, 0, 1, 0.9098039, 1,
-0.042733, -1.83088, -1.756491, 0, 1, 0.9176471, 1,
-0.03657567, -0.2993498, -4.627155, 0, 1, 0.9215686, 1,
-0.03592291, 0.05626602, -1.417727, 0, 1, 0.9294118, 1,
-0.03475086, 0.1849126, 1.092273, 0, 1, 0.9333333, 1,
-0.03139935, -1.865206, -4.164777, 0, 1, 0.9411765, 1,
-0.02617163, -0.6185336, -1.398787, 0, 1, 0.945098, 1,
-0.02553619, 0.6198683, 2.567216, 0, 1, 0.9529412, 1,
-0.02287862, -0.1606537, -3.070128, 0, 1, 0.9568627, 1,
-0.02256258, 0.4214988, -0.5574059, 0, 1, 0.9647059, 1,
-0.01859427, 1.240885, -1.530488, 0, 1, 0.9686275, 1,
-0.0136659, -0.7822748, -1.810972, 0, 1, 0.9764706, 1,
-0.01154997, -0.2340764, -4.156218, 0, 1, 0.9803922, 1,
-0.01103394, 0.3972493, 1.865913, 0, 1, 0.9882353, 1,
-0.01093807, -0.03643713, -3.776014, 0, 1, 0.9921569, 1,
-0.008900478, -2.357625, -4.626023, 0, 1, 1, 1,
-0.007707425, -1.128516, -3.534113, 0, 0.9921569, 1, 1,
-0.004748045, -0.04739477, -2.846781, 0, 0.9882353, 1, 1,
-0.004166928, -0.5242501, -2.8841, 0, 0.9803922, 1, 1,
-0.003491625, 0.2728821, -0.3925933, 0, 0.9764706, 1, 1,
0.001425687, 0.09014624, 0.7087532, 0, 0.9686275, 1, 1,
0.004032239, -0.2727832, 2.573643, 0, 0.9647059, 1, 1,
0.004593369, 3.178932, 1.489374, 0, 0.9568627, 1, 1,
0.006850383, -1.028179, 3.486763, 0, 0.9529412, 1, 1,
0.006927066, -0.254366, 3.281407, 0, 0.945098, 1, 1,
0.01239648, 1.597458, 0.9446199, 0, 0.9411765, 1, 1,
0.01293843, -0.5056286, 3.596477, 0, 0.9333333, 1, 1,
0.01480461, 0.2330345, -0.8013533, 0, 0.9294118, 1, 1,
0.01749074, -0.20518, 4.814071, 0, 0.9215686, 1, 1,
0.02164341, 0.2454984, -0.7464623, 0, 0.9176471, 1, 1,
0.02322109, -2.288308, 3.510614, 0, 0.9098039, 1, 1,
0.02455575, -0.296715, 2.460908, 0, 0.9058824, 1, 1,
0.0247876, -0.2952169, 3.977816, 0, 0.8980392, 1, 1,
0.0273362, 0.112882, 1.610319, 0, 0.8901961, 1, 1,
0.02857627, -0.1034582, 1.440313, 0, 0.8862745, 1, 1,
0.02881046, 2.015748, 0.3876275, 0, 0.8784314, 1, 1,
0.03155509, -0.5171239, 4.034302, 0, 0.8745098, 1, 1,
0.03160634, 0.2431401, 1.120003, 0, 0.8666667, 1, 1,
0.03349576, 0.2676239, 1.148603, 0, 0.8627451, 1, 1,
0.03749174, -0.7749769, 2.626848, 0, 0.854902, 1, 1,
0.04231886, 0.2236194, -0.2442235, 0, 0.8509804, 1, 1,
0.04426093, 0.2551606, 0.4240613, 0, 0.8431373, 1, 1,
0.04488699, 0.3924018, 2.324215, 0, 0.8392157, 1, 1,
0.04983296, -1.327055, 3.104966, 0, 0.8313726, 1, 1,
0.05118652, -1.928419, 4.692518, 0, 0.827451, 1, 1,
0.05182419, 0.2558712, 0.9938065, 0, 0.8196079, 1, 1,
0.05542093, -2.464301, 4.49773, 0, 0.8156863, 1, 1,
0.05587897, -0.5468715, 2.29968, 0, 0.8078431, 1, 1,
0.05804691, 0.5398425, -0.9413824, 0, 0.8039216, 1, 1,
0.06465393, -0.2151483, 2.983075, 0, 0.7960784, 1, 1,
0.0677342, -0.1936221, 2.638633, 0, 0.7882353, 1, 1,
0.07418516, -0.9149126, 3.508438, 0, 0.7843137, 1, 1,
0.07595143, 0.1242775, 0.07911117, 0, 0.7764706, 1, 1,
0.07669875, 0.278185, -1.020822, 0, 0.772549, 1, 1,
0.08267125, 0.4065414, 0.03659452, 0, 0.7647059, 1, 1,
0.0841133, 1.041987, -1.00478, 0, 0.7607843, 1, 1,
0.08482531, 1.276864, 0.7313442, 0, 0.7529412, 1, 1,
0.08511338, 1.367286, 0.1805007, 0, 0.7490196, 1, 1,
0.08573602, -1.425988, 1.278108, 0, 0.7411765, 1, 1,
0.08749064, -0.8155115, 2.005919, 0, 0.7372549, 1, 1,
0.08862137, -0.09044193, 1.644183, 0, 0.7294118, 1, 1,
0.09185269, 0.01647157, 0.09924461, 0, 0.7254902, 1, 1,
0.09546854, 1.239707, 1.253446, 0, 0.7176471, 1, 1,
0.09553571, -1.720251, 0.465573, 0, 0.7137255, 1, 1,
0.1053772, -0.9204246, 4.444986, 0, 0.7058824, 1, 1,
0.1062785, -2.123468, 2.330061, 0, 0.6980392, 1, 1,
0.1088989, 0.5140966, -0.07409099, 0, 0.6941177, 1, 1,
0.110108, -0.4938046, 3.556638, 0, 0.6862745, 1, 1,
0.1124418, -0.4757559, 1.895139, 0, 0.682353, 1, 1,
0.1128791, -0.1154404, 4.886473, 0, 0.6745098, 1, 1,
0.1176202, -1.0392, 2.329119, 0, 0.6705883, 1, 1,
0.1209482, -1.689056, 2.164477, 0, 0.6627451, 1, 1,
0.1225193, 0.2375812, -0.07404518, 0, 0.6588235, 1, 1,
0.1293467, 0.9140576, 0.1270702, 0, 0.6509804, 1, 1,
0.1300637, -1.217259, 3.999068, 0, 0.6470588, 1, 1,
0.1355205, 0.4217684, 1.090978, 0, 0.6392157, 1, 1,
0.1449228, 0.5839377, 0.9890143, 0, 0.6352941, 1, 1,
0.1477953, -0.4593627, 2.584983, 0, 0.627451, 1, 1,
0.1516646, -1.377345, 3.466445, 0, 0.6235294, 1, 1,
0.1576026, 0.32359, -1.135899, 0, 0.6156863, 1, 1,
0.1598422, -1.610469, 4.65583, 0, 0.6117647, 1, 1,
0.160838, -1.074562, 1.49026, 0, 0.6039216, 1, 1,
0.1623852, 0.07193556, 0.3385649, 0, 0.5960785, 1, 1,
0.1626972, 0.2849062, -0.6466126, 0, 0.5921569, 1, 1,
0.1629293, -0.844224, 3.220028, 0, 0.5843138, 1, 1,
0.1652467, -0.5324926, 5.007305, 0, 0.5803922, 1, 1,
0.1662313, -0.266845, 1.426071, 0, 0.572549, 1, 1,
0.1673918, -0.04056422, 1.382716, 0, 0.5686275, 1, 1,
0.171248, 1.573511, 1.67973, 0, 0.5607843, 1, 1,
0.1738112, 1.124776, 1.66069, 0, 0.5568628, 1, 1,
0.1783213, 1.166139, -0.4439457, 0, 0.5490196, 1, 1,
0.1795593, 0.5422233, 0.6166452, 0, 0.5450981, 1, 1,
0.1821964, 0.01230572, 3.023343, 0, 0.5372549, 1, 1,
0.1824919, -0.2514696, 0.845048, 0, 0.5333334, 1, 1,
0.1825853, 0.06801735, -0.3191468, 0, 0.5254902, 1, 1,
0.185608, -1.460949, 2.920927, 0, 0.5215687, 1, 1,
0.1867997, -0.2081247, 3.260587, 0, 0.5137255, 1, 1,
0.1875522, 1.660416, 1.333688, 0, 0.509804, 1, 1,
0.1896024, -0.04554901, 2.373261, 0, 0.5019608, 1, 1,
0.1924977, -0.01965346, 2.480583, 0, 0.4941176, 1, 1,
0.1941379, 1.515028, -0.337621, 0, 0.4901961, 1, 1,
0.1990597, 1.31769, 0.5981695, 0, 0.4823529, 1, 1,
0.2011268, 0.2974871, -1.151935, 0, 0.4784314, 1, 1,
0.2027822, 1.934719, -0.5831338, 0, 0.4705882, 1, 1,
0.2038954, 0.002347775, 2.571718, 0, 0.4666667, 1, 1,
0.2104439, 0.3426702, 0.3154638, 0, 0.4588235, 1, 1,
0.2105221, -0.2731825, 3.403279, 0, 0.454902, 1, 1,
0.2128517, -0.5528812, 3.459112, 0, 0.4470588, 1, 1,
0.2142111, 0.6150758, 0.3416885, 0, 0.4431373, 1, 1,
0.2162313, 2.559584, -1.675208, 0, 0.4352941, 1, 1,
0.216701, 0.2586353, 0.5902071, 0, 0.4313726, 1, 1,
0.2167511, -0.367441, 3.478699, 0, 0.4235294, 1, 1,
0.218927, 1.367903, 0.09857552, 0, 0.4196078, 1, 1,
0.2194614, -1.670967, 3.705543, 0, 0.4117647, 1, 1,
0.2277122, -0.3923084, 0.7932886, 0, 0.4078431, 1, 1,
0.2317798, 1.692034, -0.03877924, 0, 0.4, 1, 1,
0.2338399, 0.7459509, -0.1974198, 0, 0.3921569, 1, 1,
0.2357527, 2.029188, 1.069904, 0, 0.3882353, 1, 1,
0.2459137, 0.03739253, -0.6226084, 0, 0.3803922, 1, 1,
0.2514432, 0.9709656, 0.9804856, 0, 0.3764706, 1, 1,
0.2589929, -1.773822, 2.432745, 0, 0.3686275, 1, 1,
0.2632645, -0.1541146, 2.291132, 0, 0.3647059, 1, 1,
0.2655647, -0.0616944, 0.8413053, 0, 0.3568628, 1, 1,
0.2667545, 0.5813928, -1.660275, 0, 0.3529412, 1, 1,
0.2691648, -0.3684655, 2.304865, 0, 0.345098, 1, 1,
0.2697992, -0.1887311, 2.799421, 0, 0.3411765, 1, 1,
0.273642, 0.3291151, 1.281289, 0, 0.3333333, 1, 1,
0.2739453, -0.2568169, 1.411928, 0, 0.3294118, 1, 1,
0.2750067, -0.8415945, 3.348195, 0, 0.3215686, 1, 1,
0.2750727, -0.957993, 2.969077, 0, 0.3176471, 1, 1,
0.2792854, 1.790763, 0.4230372, 0, 0.3098039, 1, 1,
0.2794463, 0.01533503, 1.022318, 0, 0.3058824, 1, 1,
0.2807932, -0.4572726, 1.875376, 0, 0.2980392, 1, 1,
0.282109, 1.339367, 0.7857638, 0, 0.2901961, 1, 1,
0.2893016, -1.196197, 1.897167, 0, 0.2862745, 1, 1,
0.2898511, -0.1004628, 1.469613, 0, 0.2784314, 1, 1,
0.2935548, 1.518806, 1.289305, 0, 0.2745098, 1, 1,
0.2945206, -0.2998627, 2.995932, 0, 0.2666667, 1, 1,
0.295822, -1.178207, 3.627863, 0, 0.2627451, 1, 1,
0.299801, 0.5376799, 2.735826, 0, 0.254902, 1, 1,
0.3038775, 1.427663, 0.1967935, 0, 0.2509804, 1, 1,
0.3060179, 0.123968, 1.939908, 0, 0.2431373, 1, 1,
0.3126732, -2.35997, 2.876947, 0, 0.2392157, 1, 1,
0.3133211, -0.4897641, 4.540657, 0, 0.2313726, 1, 1,
0.3219011, -2.254444, 4.488953, 0, 0.227451, 1, 1,
0.3234486, -0.1838165, 1.947611, 0, 0.2196078, 1, 1,
0.3257699, 2.117439, 0.4168887, 0, 0.2156863, 1, 1,
0.3276082, 0.08862851, 2.235172, 0, 0.2078431, 1, 1,
0.3289105, -1.552334, 3.072438, 0, 0.2039216, 1, 1,
0.3317577, 1.357252, -0.07456096, 0, 0.1960784, 1, 1,
0.3317661, 0.4122003, 1.160747, 0, 0.1882353, 1, 1,
0.3399942, 1.076707, -0.9355461, 0, 0.1843137, 1, 1,
0.3425885, 0.7278564, 0.5631753, 0, 0.1764706, 1, 1,
0.3502527, 0.4865479, 1.530306, 0, 0.172549, 1, 1,
0.3539969, -0.1560265, 1.542328, 0, 0.1647059, 1, 1,
0.3545632, 1.318059, 1.200323, 0, 0.1607843, 1, 1,
0.3616748, -1.093028, 2.975312, 0, 0.1529412, 1, 1,
0.3625673, 1.586552, 0.8256493, 0, 0.1490196, 1, 1,
0.363174, 0.776664, -0.1156631, 0, 0.1411765, 1, 1,
0.3634756, -0.479391, 1.139559, 0, 0.1372549, 1, 1,
0.3657482, -0.5655733, 3.154376, 0, 0.1294118, 1, 1,
0.3755113, -0.100939, 1.561229, 0, 0.1254902, 1, 1,
0.3830961, -1.929769, 1.358521, 0, 0.1176471, 1, 1,
0.3890832, -0.000430895, -0.3488144, 0, 0.1137255, 1, 1,
0.3925197, -1.080031, 3.536874, 0, 0.1058824, 1, 1,
0.3927958, -1.777758, 2.754166, 0, 0.09803922, 1, 1,
0.3932754, -1.426678, 3.30741, 0, 0.09411765, 1, 1,
0.39553, 0.4364312, 1.585253, 0, 0.08627451, 1, 1,
0.3973769, -2.860967, 1.914332, 0, 0.08235294, 1, 1,
0.3981575, 0.2117604, 0.2635275, 0, 0.07450981, 1, 1,
0.3997754, 1.585997, -0.2522954, 0, 0.07058824, 1, 1,
0.4018851, 1.841789, -1.986044, 0, 0.0627451, 1, 1,
0.4025396, 0.8135135, 1.297285, 0, 0.05882353, 1, 1,
0.4028683, 1.058249, -1.857653, 0, 0.05098039, 1, 1,
0.4082284, 1.611491, -1.492756, 0, 0.04705882, 1, 1,
0.4084312, -0.1365512, 1.578054, 0, 0.03921569, 1, 1,
0.4086127, -0.06738341, 1.688362, 0, 0.03529412, 1, 1,
0.4102152, 1.175701, 2.046957, 0, 0.02745098, 1, 1,
0.4146332, -2.940907, 2.794456, 0, 0.02352941, 1, 1,
0.4162073, 0.92449, 1.213487, 0, 0.01568628, 1, 1,
0.4164889, -1.635535, 3.649083, 0, 0.01176471, 1, 1,
0.4179136, -0.03551736, 0.638817, 0, 0.003921569, 1, 1,
0.4189081, -0.6610137, 2.063299, 0.003921569, 0, 1, 1,
0.4225447, 1.36618, 1.93062, 0.007843138, 0, 1, 1,
0.4233683, -0.1006167, 2.807707, 0.01568628, 0, 1, 1,
0.4245104, 1.098554, 1.054183, 0.01960784, 0, 1, 1,
0.4276974, 2.131819, 1.554697, 0.02745098, 0, 1, 1,
0.43137, 0.3840554, 1.455848, 0.03137255, 0, 1, 1,
0.4317642, 0.3229297, 1.237594, 0.03921569, 0, 1, 1,
0.4331311, 0.1163649, 0.9901527, 0.04313726, 0, 1, 1,
0.4334155, 0.1726059, 2.323607, 0.05098039, 0, 1, 1,
0.4376864, 1.443951, -0.8009055, 0.05490196, 0, 1, 1,
0.4399407, 0.2061195, -0.6577846, 0.0627451, 0, 1, 1,
0.4415209, -1.638892, 2.967988, 0.06666667, 0, 1, 1,
0.4433013, -1.288162, 1.794178, 0.07450981, 0, 1, 1,
0.4451951, 0.1618449, 2.290591, 0.07843138, 0, 1, 1,
0.4478949, -1.761739, 4.119536, 0.08627451, 0, 1, 1,
0.4576681, 0.1301713, 1.450257, 0.09019608, 0, 1, 1,
0.4583995, -1.503815, 2.887125, 0.09803922, 0, 1, 1,
0.4621177, -0.2408033, 1.439742, 0.1058824, 0, 1, 1,
0.4667425, -1.612794, 2.631083, 0.1098039, 0, 1, 1,
0.4695441, -1.310413, 3.805366, 0.1176471, 0, 1, 1,
0.470067, 1.219166, 1.23624, 0.1215686, 0, 1, 1,
0.4732105, 0.6741993, -0.4518169, 0.1294118, 0, 1, 1,
0.4754727, 0.6719656, -0.08507401, 0.1333333, 0, 1, 1,
0.4776821, 0.01219567, 1.308185, 0.1411765, 0, 1, 1,
0.4787133, -0.6675766, 2.12992, 0.145098, 0, 1, 1,
0.4806544, 1.116452, 2.011487, 0.1529412, 0, 1, 1,
0.483057, 2.191172, -0.2542974, 0.1568628, 0, 1, 1,
0.4863063, -1.72353, 3.354645, 0.1647059, 0, 1, 1,
0.5022725, 0.04228842, 1.349612, 0.1686275, 0, 1, 1,
0.5042233, 1.373069, -1.411474, 0.1764706, 0, 1, 1,
0.5045015, -0.1189088, 2.40754, 0.1803922, 0, 1, 1,
0.5112618, 0.5751408, 1.445083, 0.1882353, 0, 1, 1,
0.5162413, 0.05322576, 0.9542193, 0.1921569, 0, 1, 1,
0.5193507, 0.9033291, 0.6669608, 0.2, 0, 1, 1,
0.5193693, -0.3541873, 2.495254, 0.2078431, 0, 1, 1,
0.5269541, -1.742267, 0.895272, 0.2117647, 0, 1, 1,
0.5292076, 1.930776, 2.276091, 0.2196078, 0, 1, 1,
0.531382, -0.0947905, 3.793349, 0.2235294, 0, 1, 1,
0.533531, -0.122205, 1.589341, 0.2313726, 0, 1, 1,
0.5380003, -0.06103694, 2.724472, 0.2352941, 0, 1, 1,
0.5492939, -1.807678, 3.154312, 0.2431373, 0, 1, 1,
0.550774, 0.08676741, 1.916905, 0.2470588, 0, 1, 1,
0.5520924, 0.0112321, 0.7444226, 0.254902, 0, 1, 1,
0.5557365, -0.6296315, 2.118381, 0.2588235, 0, 1, 1,
0.5593063, -0.402206, 2.734987, 0.2666667, 0, 1, 1,
0.5626215, 1.077508, 0.9094216, 0.2705882, 0, 1, 1,
0.5647135, -2.347067, 2.354023, 0.2784314, 0, 1, 1,
0.5652409, -0.5421037, 2.272307, 0.282353, 0, 1, 1,
0.5669098, -1.597991, 2.932231, 0.2901961, 0, 1, 1,
0.5690241, 0.916697, 0.8327897, 0.2941177, 0, 1, 1,
0.5746201, 0.4575791, 1.350688, 0.3019608, 0, 1, 1,
0.5773064, -1.397125, 1.009206, 0.3098039, 0, 1, 1,
0.5778668, -1.64386, 3.26267, 0.3137255, 0, 1, 1,
0.5781003, -0.9015869, 2.188836, 0.3215686, 0, 1, 1,
0.5870258, 0.8482851, 0.1837566, 0.3254902, 0, 1, 1,
0.5881281, -1.972964, 2.407819, 0.3333333, 0, 1, 1,
0.5888016, 1.250081, 2.181033, 0.3372549, 0, 1, 1,
0.5892462, 0.3234775, 1.275806, 0.345098, 0, 1, 1,
0.5897004, -0.987181, 2.902831, 0.3490196, 0, 1, 1,
0.5948223, -0.760094, 1.796658, 0.3568628, 0, 1, 1,
0.5980726, 1.26754, -0.232521, 0.3607843, 0, 1, 1,
0.5987853, -0.8890095, -0.255881, 0.3686275, 0, 1, 1,
0.6052825, -1.029641, 2.172612, 0.372549, 0, 1, 1,
0.6071346, -0.6936331, 1.348613, 0.3803922, 0, 1, 1,
0.6178346, -0.8593662, 2.289486, 0.3843137, 0, 1, 1,
0.6200147, -0.03567433, 2.32327, 0.3921569, 0, 1, 1,
0.6228145, -0.5864394, 4.545621, 0.3960784, 0, 1, 1,
0.6307465, 1.744326, 1.038026, 0.4039216, 0, 1, 1,
0.6308028, 0.8439252, -0.2781391, 0.4117647, 0, 1, 1,
0.6323535, -0.00173515, 1.214624, 0.4156863, 0, 1, 1,
0.6369774, 0.1402009, 1.730691, 0.4235294, 0, 1, 1,
0.6455274, -2.058478, 1.340036, 0.427451, 0, 1, 1,
0.6541418, 0.3829025, -0.07907824, 0.4352941, 0, 1, 1,
0.6551492, 0.5574703, 2.298923, 0.4392157, 0, 1, 1,
0.6589358, 0.7854573, 2.069295, 0.4470588, 0, 1, 1,
0.6619651, -0.2702018, 2.016398, 0.4509804, 0, 1, 1,
0.6637539, 0.2525308, 1.908419, 0.4588235, 0, 1, 1,
0.6713793, -1.095495, 3.857264, 0.4627451, 0, 1, 1,
0.6769655, 0.2474734, -1.410907, 0.4705882, 0, 1, 1,
0.677212, 0.8069492, -0.8829542, 0.4745098, 0, 1, 1,
0.6827763, 2.174741, -1.056903, 0.4823529, 0, 1, 1,
0.6865451, -1.082223, 4.217268, 0.4862745, 0, 1, 1,
0.6868427, -2.085947, 2.991753, 0.4941176, 0, 1, 1,
0.6889428, 0.8456059, -0.6497027, 0.5019608, 0, 1, 1,
0.6893854, 0.9656504, 0.4406185, 0.5058824, 0, 1, 1,
0.6936108, -0.6382004, 3.118577, 0.5137255, 0, 1, 1,
0.6981346, -0.5517708, 1.761593, 0.5176471, 0, 1, 1,
0.7053797, 0.6102645, 1.964291, 0.5254902, 0, 1, 1,
0.7066741, 0.1458058, 0.425391, 0.5294118, 0, 1, 1,
0.7111646, 0.01903602, 0.9710156, 0.5372549, 0, 1, 1,
0.711481, -0.1302267, 1.469288, 0.5411765, 0, 1, 1,
0.7122873, -0.9367603, 3.318736, 0.5490196, 0, 1, 1,
0.7142804, 0.8345053, 1.288199, 0.5529412, 0, 1, 1,
0.7147796, -1.080711, 3.091843, 0.5607843, 0, 1, 1,
0.7151764, -0.843203, 1.610327, 0.5647059, 0, 1, 1,
0.7163525, 0.6255035, 0.8494862, 0.572549, 0, 1, 1,
0.7169578, -0.2929465, 2.859045, 0.5764706, 0, 1, 1,
0.7171826, -0.8631184, 1.175195, 0.5843138, 0, 1, 1,
0.7254835, 0.1558073, 2.279032, 0.5882353, 0, 1, 1,
0.7271988, 0.4215669, 0.4566034, 0.5960785, 0, 1, 1,
0.7306486, 1.275456, 2.607209, 0.6039216, 0, 1, 1,
0.7387519, 2.038548, 0.9955263, 0.6078432, 0, 1, 1,
0.7396321, -0.4081113, 2.103308, 0.6156863, 0, 1, 1,
0.7430497, 0.9901412, 0.362126, 0.6196079, 0, 1, 1,
0.7450399, -0.2778284, 1.523146, 0.627451, 0, 1, 1,
0.747313, -0.9237635, 1.890656, 0.6313726, 0, 1, 1,
0.748664, -2.299094, 2.305456, 0.6392157, 0, 1, 1,
0.7502421, -0.1286925, 1.811328, 0.6431373, 0, 1, 1,
0.7637384, 0.1324764, 2.428337, 0.6509804, 0, 1, 1,
0.764932, -0.437862, 3.106774, 0.654902, 0, 1, 1,
0.7655672, -1.411868, 3.406984, 0.6627451, 0, 1, 1,
0.7675096, -1.310805, 1.060144, 0.6666667, 0, 1, 1,
0.769658, 0.400466, 0.4644046, 0.6745098, 0, 1, 1,
0.7784391, 0.3781638, 0.3583158, 0.6784314, 0, 1, 1,
0.7803847, 0.7053478, 1.613071, 0.6862745, 0, 1, 1,
0.7806222, -1.242724, 3.008013, 0.6901961, 0, 1, 1,
0.7811922, 1.109247, -0.3955647, 0.6980392, 0, 1, 1,
0.7910001, -1.929394, 2.831366, 0.7058824, 0, 1, 1,
0.7962388, 0.2970147, 0.6940465, 0.7098039, 0, 1, 1,
0.7982371, 0.3782606, 2.294904, 0.7176471, 0, 1, 1,
0.8010828, 1.269113, 2.179929, 0.7215686, 0, 1, 1,
0.8096204, 1.170381, 0.5604681, 0.7294118, 0, 1, 1,
0.8104788, -0.2013311, 0.3668054, 0.7333333, 0, 1, 1,
0.8107355, 0.1991185, 1.457594, 0.7411765, 0, 1, 1,
0.8122059, 1.537179, -0.7301714, 0.7450981, 0, 1, 1,
0.8125297, 0.5883484, 0.8698448, 0.7529412, 0, 1, 1,
0.8137428, -0.450637, 3.262063, 0.7568628, 0, 1, 1,
0.8138589, -0.1404272, 1.942498, 0.7647059, 0, 1, 1,
0.8174543, -0.7350301, 0.9316049, 0.7686275, 0, 1, 1,
0.8184125, -0.8473796, 0.9104673, 0.7764706, 0, 1, 1,
0.8213238, -2.161768, 2.123015, 0.7803922, 0, 1, 1,
0.8268238, 0.02663109, 1.936359, 0.7882353, 0, 1, 1,
0.8279735, 1.006901, -1.492597, 0.7921569, 0, 1, 1,
0.8317871, -0.8272037, 1.327125, 0.8, 0, 1, 1,
0.8334808, 0.2162618, 0.4815075, 0.8078431, 0, 1, 1,
0.8347405, -0.7831996, 3.401424, 0.8117647, 0, 1, 1,
0.8379249, -0.2002087, 1.466271, 0.8196079, 0, 1, 1,
0.8402334, -0.2207406, 1.475078, 0.8235294, 0, 1, 1,
0.8431497, 0.4309618, -1.097246, 0.8313726, 0, 1, 1,
0.8431733, 0.3408684, 0.2710053, 0.8352941, 0, 1, 1,
0.8486384, 0.3613764, -0.2029497, 0.8431373, 0, 1, 1,
0.8535411, -0.2775718, 1.498819, 0.8470588, 0, 1, 1,
0.8562683, -0.1073465, 2.018034, 0.854902, 0, 1, 1,
0.8600392, -0.4481291, 4.472996, 0.8588235, 0, 1, 1,
0.8626547, -0.3070246, 2.576564, 0.8666667, 0, 1, 1,
0.864521, 1.108465, 2.278569, 0.8705882, 0, 1, 1,
0.8684406, -1.305162, 4.257071, 0.8784314, 0, 1, 1,
0.8697299, 1.313489, 1.16213, 0.8823529, 0, 1, 1,
0.8724959, -0.1322952, 3.139362, 0.8901961, 0, 1, 1,
0.8846833, 0.5053123, 1.087053, 0.8941177, 0, 1, 1,
0.8849295, -0.5429756, 1.865171, 0.9019608, 0, 1, 1,
0.8881693, 1.834021, -0.01015041, 0.9098039, 0, 1, 1,
0.8977279, 0.7839199, -2.023645, 0.9137255, 0, 1, 1,
0.9016423, 0.3363313, 2.814764, 0.9215686, 0, 1, 1,
0.91281, 1.574027, -0.9256715, 0.9254902, 0, 1, 1,
0.9129555, -0.4450085, 2.106324, 0.9333333, 0, 1, 1,
0.9136331, -0.8305542, 3.136399, 0.9372549, 0, 1, 1,
0.9148669, 0.9586189, 0.03673368, 0.945098, 0, 1, 1,
0.9173751, -0.5042546, 2.475125, 0.9490196, 0, 1, 1,
0.92031, 0.5647829, 2.231797, 0.9568627, 0, 1, 1,
0.9234986, 0.7749499, -1.890186, 0.9607843, 0, 1, 1,
0.9286463, -0.1464467, 2.823287, 0.9686275, 0, 1, 1,
0.932088, -0.1138004, 3.369078, 0.972549, 0, 1, 1,
0.9369293, -2.080306, 3.005243, 0.9803922, 0, 1, 1,
0.9380596, -2.120039, 3.146649, 0.9843137, 0, 1, 1,
0.9383907, 0.1397832, 1.72766, 0.9921569, 0, 1, 1,
0.9392805, 0.3125517, 2.278812, 0.9960784, 0, 1, 1,
0.9402432, -0.4687813, 2.321947, 1, 0, 0.9960784, 1,
0.9405146, 0.8603731, 2.142354, 1, 0, 0.9882353, 1,
0.9435917, 1.041545, 1.328454, 1, 0, 0.9843137, 1,
0.9537404, 1.930243, 0.1287194, 1, 0, 0.9764706, 1,
0.9585373, -0.3308709, 1.66905, 1, 0, 0.972549, 1,
0.961621, 2.298888, 2.252596, 1, 0, 0.9647059, 1,
0.966324, 0.1177388, 3.271015, 1, 0, 0.9607843, 1,
0.9665166, 0.06383812, 1.423948, 1, 0, 0.9529412, 1,
0.9696272, 0.9969826, 0.1329549, 1, 0, 0.9490196, 1,
0.9732854, 0.0894218, 0.1954845, 1, 0, 0.9411765, 1,
0.9777346, -0.2300382, 0.9521315, 1, 0, 0.9372549, 1,
0.9846237, 0.4078895, 1.535862, 1, 0, 0.9294118, 1,
0.9991997, -0.5952889, 2.013674, 1, 0, 0.9254902, 1,
0.9993834, -0.07859624, 1.193412, 1, 0, 0.9176471, 1,
1.00614, -0.8526235, 3.412558, 1, 0, 0.9137255, 1,
1.007001, 0.5286563, 0.9585315, 1, 0, 0.9058824, 1,
1.008984, -0.6987962, 1.865019, 1, 0, 0.9019608, 1,
1.021796, -1.922567, 3.895066, 1, 0, 0.8941177, 1,
1.037773, 1.318336, 1.697822, 1, 0, 0.8862745, 1,
1.038775, -0.5309545, 2.0699, 1, 0, 0.8823529, 1,
1.054018, -0.05599038, -0.2862768, 1, 0, 0.8745098, 1,
1.054225, 0.7144103, -0.1477144, 1, 0, 0.8705882, 1,
1.056818, 0.7376706, 2.628875, 1, 0, 0.8627451, 1,
1.05837, -0.2180555, 1.874267, 1, 0, 0.8588235, 1,
1.060708, 1.511115, 0.6040083, 1, 0, 0.8509804, 1,
1.061605, -1.015687, 3.204003, 1, 0, 0.8470588, 1,
1.064279, -0.5212739, 0.8521789, 1, 0, 0.8392157, 1,
1.065217, 1.175536, 0.7833071, 1, 0, 0.8352941, 1,
1.069602, 1.034935, 2.523073, 1, 0, 0.827451, 1,
1.069914, 1.534223, 1.337706, 1, 0, 0.8235294, 1,
1.073548, -0.170294, 1.150678, 1, 0, 0.8156863, 1,
1.077916, -1.199183, 2.334542, 1, 0, 0.8117647, 1,
1.080196, 1.645446, 1.16596, 1, 0, 0.8039216, 1,
1.080363, 0.3915356, 1.602256, 1, 0, 0.7960784, 1,
1.081537, 0.8117534, 0.8069398, 1, 0, 0.7921569, 1,
1.090501, 1.144342, 1.399079, 1, 0, 0.7843137, 1,
1.098503, 0.1846366, 2.176525, 1, 0, 0.7803922, 1,
1.114431, -0.3969145, 1.516038, 1, 0, 0.772549, 1,
1.116603, 0.9742696, 0.6187274, 1, 0, 0.7686275, 1,
1.119072, -0.8523474, 3.232788, 1, 0, 0.7607843, 1,
1.12928, -0.6158479, 1.505779, 1, 0, 0.7568628, 1,
1.135822, 0.4047552, 0.4556632, 1, 0, 0.7490196, 1,
1.150585, 1.123356, 1.374435, 1, 0, 0.7450981, 1,
1.154308, 0.506964, 0.6875644, 1, 0, 0.7372549, 1,
1.158892, -1.389422, 1.844896, 1, 0, 0.7333333, 1,
1.159524, -0.639404, 2.392499, 1, 0, 0.7254902, 1,
1.160162, 0.2065223, 0.721038, 1, 0, 0.7215686, 1,
1.163791, 1.235218, -0.702262, 1, 0, 0.7137255, 1,
1.165619, -0.1786643, 1.755035, 1, 0, 0.7098039, 1,
1.166435, -2.358202, 3.604792, 1, 0, 0.7019608, 1,
1.166625, -1.529331, 2.012959, 1, 0, 0.6941177, 1,
1.169292, -0.2086955, 1.086973, 1, 0, 0.6901961, 1,
1.169868, -1.180959, 2.54623, 1, 0, 0.682353, 1,
1.175097, 1.556195, 1.67952, 1, 0, 0.6784314, 1,
1.18011, 0.1300713, 2.171878, 1, 0, 0.6705883, 1,
1.183376, 1.385472, 1.406186, 1, 0, 0.6666667, 1,
1.187092, 0.9005591, 0.5075986, 1, 0, 0.6588235, 1,
1.187964, -0.4485097, 3.253737, 1, 0, 0.654902, 1,
1.18894, -0.01981057, 1.530006, 1, 0, 0.6470588, 1,
1.192791, 1.49312, 1.602347, 1, 0, 0.6431373, 1,
1.196758, -1.593083, 3.167324, 1, 0, 0.6352941, 1,
1.198307, -1.146996, 1.299806, 1, 0, 0.6313726, 1,
1.222774, -0.2534849, 2.407684, 1, 0, 0.6235294, 1,
1.227511, -1.773042, 3.023327, 1, 0, 0.6196079, 1,
1.231136, 0.6109223, -0.6864832, 1, 0, 0.6117647, 1,
1.231506, -0.725925, 2.60683, 1, 0, 0.6078432, 1,
1.233302, -0.1812878, 3.266232, 1, 0, 0.6, 1,
1.233881, 1.040685, 0.8352183, 1, 0, 0.5921569, 1,
1.239256, -2.728808, 3.225795, 1, 0, 0.5882353, 1,
1.239264, 0.9474006, 3.4805, 1, 0, 0.5803922, 1,
1.242781, -1.676827, 2.488662, 1, 0, 0.5764706, 1,
1.253744, 1.813398, 1.532443, 1, 0, 0.5686275, 1,
1.280066, -1.193916, 1.636052, 1, 0, 0.5647059, 1,
1.293367, 1.434353, -0.2343075, 1, 0, 0.5568628, 1,
1.299306, -0.1082877, 1.787167, 1, 0, 0.5529412, 1,
1.319125, 0.8825934, 0.2635362, 1, 0, 0.5450981, 1,
1.326455, 0.858478, 1.120316, 1, 0, 0.5411765, 1,
1.32997, -0.393314, 4.284593, 1, 0, 0.5333334, 1,
1.333906, 0.3826177, 1.069783, 1, 0, 0.5294118, 1,
1.34043, 1.082479, -0.008522701, 1, 0, 0.5215687, 1,
1.342135, 0.3907716, 2.778577, 1, 0, 0.5176471, 1,
1.342664, 0.3375393, 0.3187304, 1, 0, 0.509804, 1,
1.343555, -0.857467, 1.790494, 1, 0, 0.5058824, 1,
1.348457, -0.2130581, 1.846254, 1, 0, 0.4980392, 1,
1.355146, -1.456338, 3.2285, 1, 0, 0.4901961, 1,
1.364075, 1.829245, 0.6631192, 1, 0, 0.4862745, 1,
1.376456, -1.690088, 3.441139, 1, 0, 0.4784314, 1,
1.384322, 0.323633, 1.865583, 1, 0, 0.4745098, 1,
1.397216, 0.7354717, 0.330081, 1, 0, 0.4666667, 1,
1.401698, 0.07270194, -0.8361536, 1, 0, 0.4627451, 1,
1.40395, -0.9270879, 1.146444, 1, 0, 0.454902, 1,
1.404789, 0.6524599, 1.232607, 1, 0, 0.4509804, 1,
1.407945, -0.4076284, 2.779285, 1, 0, 0.4431373, 1,
1.420043, 0.05460357, 2.76038, 1, 0, 0.4392157, 1,
1.425641, 0.8630511, 1.172247, 1, 0, 0.4313726, 1,
1.429352, -1.150185, 1.100957, 1, 0, 0.427451, 1,
1.442961, -0.812314, 2.206882, 1, 0, 0.4196078, 1,
1.445493, -1.079198, 2.377817, 1, 0, 0.4156863, 1,
1.453984, -0.03696871, 1.480949, 1, 0, 0.4078431, 1,
1.456275, -0.6494163, 1.346035, 1, 0, 0.4039216, 1,
1.468966, 0.3972121, 1.402418, 1, 0, 0.3960784, 1,
1.486483, 0.1440505, 0.217653, 1, 0, 0.3882353, 1,
1.494966, 0.3063856, 1.824213, 1, 0, 0.3843137, 1,
1.515697, -0.7657909, 0.2782019, 1, 0, 0.3764706, 1,
1.519644, 0.4929827, 1.016259, 1, 0, 0.372549, 1,
1.524115, -0.1986924, 1.721468, 1, 0, 0.3647059, 1,
1.535142, -0.7435676, 0.8781981, 1, 0, 0.3607843, 1,
1.549956, -1.624274, 2.844428, 1, 0, 0.3529412, 1,
1.563894, 0.5958709, 0.4268828, 1, 0, 0.3490196, 1,
1.593921, -0.6156932, 2.501697, 1, 0, 0.3411765, 1,
1.604009, 0.5779538, 1.382412, 1, 0, 0.3372549, 1,
1.605214, 0.8398078, 1.375549, 1, 0, 0.3294118, 1,
1.610903, -1.636496, 0.9166898, 1, 0, 0.3254902, 1,
1.617235, -1.556185, 2.127832, 1, 0, 0.3176471, 1,
1.643482, 1.382671, 1.037641, 1, 0, 0.3137255, 1,
1.645442, -1.114519, 0.4874063, 1, 0, 0.3058824, 1,
1.651356, 0.08390973, 3.451722, 1, 0, 0.2980392, 1,
1.654792, 0.238923, 3.314351, 1, 0, 0.2941177, 1,
1.657263, 1.417369, 0.2483833, 1, 0, 0.2862745, 1,
1.659459, -0.8559136, 2.155504, 1, 0, 0.282353, 1,
1.665559, 0.8117277, 2.024463, 1, 0, 0.2745098, 1,
1.667228, 0.2447083, 1.83687, 1, 0, 0.2705882, 1,
1.673335, -0.5022675, 1.502451, 1, 0, 0.2627451, 1,
1.680774, -1.27369, 2.842873, 1, 0, 0.2588235, 1,
1.692913, -0.5784587, 1.255312, 1, 0, 0.2509804, 1,
1.693833, 0.2054545, 1.694685, 1, 0, 0.2470588, 1,
1.696896, 0.2881179, 2.049724, 1, 0, 0.2392157, 1,
1.710826, -0.5463457, 1.37356, 1, 0, 0.2352941, 1,
1.714884, -0.7058941, 1.660544, 1, 0, 0.227451, 1,
1.75412, -0.5504909, 2.527088, 1, 0, 0.2235294, 1,
1.780062, 0.8673762, 0.6578494, 1, 0, 0.2156863, 1,
1.786592, -0.6601779, 2.171545, 1, 0, 0.2117647, 1,
1.84963, 1.404385, 0.4150836, 1, 0, 0.2039216, 1,
1.868001, 0.6352179, -1.278272, 1, 0, 0.1960784, 1,
1.888357, -0.8395127, 2.00846, 1, 0, 0.1921569, 1,
1.898533, -0.356046, 1.321601, 1, 0, 0.1843137, 1,
1.915192, 0.5876475, 0.3688973, 1, 0, 0.1803922, 1,
1.916997, 0.140501, 2.024518, 1, 0, 0.172549, 1,
1.929675, 1.519506, -0.7524208, 1, 0, 0.1686275, 1,
1.934884, 0.1975461, 0.218884, 1, 0, 0.1607843, 1,
1.936981, -0.1402263, 1.935956, 1, 0, 0.1568628, 1,
1.963367, 2.660334, 2.440159, 1, 0, 0.1490196, 1,
1.998976, -1.219415, 2.296997, 1, 0, 0.145098, 1,
1.999979, 1.087184, 1.221923, 1, 0, 0.1372549, 1,
2.01939, -0.2275133, 1.456478, 1, 0, 0.1333333, 1,
2.024033, -1.493058, 3.688275, 1, 0, 0.1254902, 1,
2.033271, 0.3423657, 1.657266, 1, 0, 0.1215686, 1,
2.043009, -0.03846947, 2.605194, 1, 0, 0.1137255, 1,
2.06496, -0.08664913, 3.181597, 1, 0, 0.1098039, 1,
2.149202, -0.04876794, 1.884984, 1, 0, 0.1019608, 1,
2.164639, -0.06147591, 0.6361542, 1, 0, 0.09411765, 1,
2.171074, -0.3260688, 1.352575, 1, 0, 0.09019608, 1,
2.17242, -0.6753321, 1.327786, 1, 0, 0.08235294, 1,
2.176593, 1.082322, 2.284962, 1, 0, 0.07843138, 1,
2.179994, -0.2530808, 1.144066, 1, 0, 0.07058824, 1,
2.250462, -0.6927219, 1.697594, 1, 0, 0.06666667, 1,
2.273324, 0.8897753, 0.9471629, 1, 0, 0.05882353, 1,
2.301107, 0.1322937, 1.440133, 1, 0, 0.05490196, 1,
2.311558, 0.1653602, 2.723941, 1, 0, 0.04705882, 1,
2.376849, 0.2689646, 2.516809, 1, 0, 0.04313726, 1,
2.460068, 0.6962358, 1.690446, 1, 0, 0.03529412, 1,
2.492159, 0.4307804, 1.2722, 1, 0, 0.03137255, 1,
2.628537, -0.492089, 1.48641, 1, 0, 0.02352941, 1,
2.694467, -0.03365435, 3.158659, 1, 0, 0.01960784, 1,
2.714243, -1.731734, -0.3230644, 1, 0, 0.01176471, 1,
2.728338, -0.2214296, 1.888034, 1, 0, 0.007843138, 1
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
-0.4754119, -3.97822, -6.992942, 0, -0.5, 0.5, 0.5,
-0.4754119, -3.97822, -6.992942, 1, -0.5, 0.5, 0.5,
-0.4754119, -3.97822, -6.992942, 1, 1.5, 0.5, 0.5,
-0.4754119, -3.97822, -6.992942, 0, 1.5, 0.5, 0.5
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
-4.765233, 0.1190124, -6.992942, 0, -0.5, 0.5, 0.5,
-4.765233, 0.1190124, -6.992942, 1, -0.5, 0.5, 0.5,
-4.765233, 0.1190124, -6.992942, 1, 1.5, 0.5, 0.5,
-4.765233, 0.1190124, -6.992942, 0, 1.5, 0.5, 0.5
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
-4.765233, -3.97822, -0.1231983, 0, -0.5, 0.5, 0.5,
-4.765233, -3.97822, -0.1231983, 1, -0.5, 0.5, 0.5,
-4.765233, -3.97822, -0.1231983, 1, 1.5, 0.5, 0.5,
-4.765233, -3.97822, -0.1231983, 0, 1.5, 0.5, 0.5
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
-3, -3.032705, -5.407616,
2, -3.032705, -5.407616,
-3, -3.032705, -5.407616,
-3, -3.190291, -5.671837,
-2, -3.032705, -5.407616,
-2, -3.190291, -5.671837,
-1, -3.032705, -5.407616,
-1, -3.190291, -5.671837,
0, -3.032705, -5.407616,
0, -3.190291, -5.671837,
1, -3.032705, -5.407616,
1, -3.190291, -5.671837,
2, -3.032705, -5.407616,
2, -3.190291, -5.671837
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
-3, -3.505462, -6.200279, 0, -0.5, 0.5, 0.5,
-3, -3.505462, -6.200279, 1, -0.5, 0.5, 0.5,
-3, -3.505462, -6.200279, 1, 1.5, 0.5, 0.5,
-3, -3.505462, -6.200279, 0, 1.5, 0.5, 0.5,
-2, -3.505462, -6.200279, 0, -0.5, 0.5, 0.5,
-2, -3.505462, -6.200279, 1, -0.5, 0.5, 0.5,
-2, -3.505462, -6.200279, 1, 1.5, 0.5, 0.5,
-2, -3.505462, -6.200279, 0, 1.5, 0.5, 0.5,
-1, -3.505462, -6.200279, 0, -0.5, 0.5, 0.5,
-1, -3.505462, -6.200279, 1, -0.5, 0.5, 0.5,
-1, -3.505462, -6.200279, 1, 1.5, 0.5, 0.5,
-1, -3.505462, -6.200279, 0, 1.5, 0.5, 0.5,
0, -3.505462, -6.200279, 0, -0.5, 0.5, 0.5,
0, -3.505462, -6.200279, 1, -0.5, 0.5, 0.5,
0, -3.505462, -6.200279, 1, 1.5, 0.5, 0.5,
0, -3.505462, -6.200279, 0, 1.5, 0.5, 0.5,
1, -3.505462, -6.200279, 0, -0.5, 0.5, 0.5,
1, -3.505462, -6.200279, 1, -0.5, 0.5, 0.5,
1, -3.505462, -6.200279, 1, 1.5, 0.5, 0.5,
1, -3.505462, -6.200279, 0, 1.5, 0.5, 0.5,
2, -3.505462, -6.200279, 0, -0.5, 0.5, 0.5,
2, -3.505462, -6.200279, 1, -0.5, 0.5, 0.5,
2, -3.505462, -6.200279, 1, 1.5, 0.5, 0.5,
2, -3.505462, -6.200279, 0, 1.5, 0.5, 0.5
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
-3.775274, -2, -5.407616,
-3.775274, 3, -5.407616,
-3.775274, -2, -5.407616,
-3.940267, -2, -5.671837,
-3.775274, -1, -5.407616,
-3.940267, -1, -5.671837,
-3.775274, 0, -5.407616,
-3.940267, 0, -5.671837,
-3.775274, 1, -5.407616,
-3.940267, 1, -5.671837,
-3.775274, 2, -5.407616,
-3.940267, 2, -5.671837,
-3.775274, 3, -5.407616,
-3.940267, 3, -5.671837
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
-4.270254, -2, -6.200279, 0, -0.5, 0.5, 0.5,
-4.270254, -2, -6.200279, 1, -0.5, 0.5, 0.5,
-4.270254, -2, -6.200279, 1, 1.5, 0.5, 0.5,
-4.270254, -2, -6.200279, 0, 1.5, 0.5, 0.5,
-4.270254, -1, -6.200279, 0, -0.5, 0.5, 0.5,
-4.270254, -1, -6.200279, 1, -0.5, 0.5, 0.5,
-4.270254, -1, -6.200279, 1, 1.5, 0.5, 0.5,
-4.270254, -1, -6.200279, 0, 1.5, 0.5, 0.5,
-4.270254, 0, -6.200279, 0, -0.5, 0.5, 0.5,
-4.270254, 0, -6.200279, 1, -0.5, 0.5, 0.5,
-4.270254, 0, -6.200279, 1, 1.5, 0.5, 0.5,
-4.270254, 0, -6.200279, 0, 1.5, 0.5, 0.5,
-4.270254, 1, -6.200279, 0, -0.5, 0.5, 0.5,
-4.270254, 1, -6.200279, 1, -0.5, 0.5, 0.5,
-4.270254, 1, -6.200279, 1, 1.5, 0.5, 0.5,
-4.270254, 1, -6.200279, 0, 1.5, 0.5, 0.5,
-4.270254, 2, -6.200279, 0, -0.5, 0.5, 0.5,
-4.270254, 2, -6.200279, 1, -0.5, 0.5, 0.5,
-4.270254, 2, -6.200279, 1, 1.5, 0.5, 0.5,
-4.270254, 2, -6.200279, 0, 1.5, 0.5, 0.5,
-4.270254, 3, -6.200279, 0, -0.5, 0.5, 0.5,
-4.270254, 3, -6.200279, 1, -0.5, 0.5, 0.5,
-4.270254, 3, -6.200279, 1, 1.5, 0.5, 0.5,
-4.270254, 3, -6.200279, 0, 1.5, 0.5, 0.5
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
-3.775274, -3.032705, -4,
-3.775274, -3.032705, 4,
-3.775274, -3.032705, -4,
-3.940267, -3.190291, -4,
-3.775274, -3.032705, -2,
-3.940267, -3.190291, -2,
-3.775274, -3.032705, 0,
-3.940267, -3.190291, 0,
-3.775274, -3.032705, 2,
-3.940267, -3.190291, 2,
-3.775274, -3.032705, 4,
-3.940267, -3.190291, 4
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
-4.270254, -3.505462, -4, 0, -0.5, 0.5, 0.5,
-4.270254, -3.505462, -4, 1, -0.5, 0.5, 0.5,
-4.270254, -3.505462, -4, 1, 1.5, 0.5, 0.5,
-4.270254, -3.505462, -4, 0, 1.5, 0.5, 0.5,
-4.270254, -3.505462, -2, 0, -0.5, 0.5, 0.5,
-4.270254, -3.505462, -2, 1, -0.5, 0.5, 0.5,
-4.270254, -3.505462, -2, 1, 1.5, 0.5, 0.5,
-4.270254, -3.505462, -2, 0, 1.5, 0.5, 0.5,
-4.270254, -3.505462, 0, 0, -0.5, 0.5, 0.5,
-4.270254, -3.505462, 0, 1, -0.5, 0.5, 0.5,
-4.270254, -3.505462, 0, 1, 1.5, 0.5, 0.5,
-4.270254, -3.505462, 0, 0, 1.5, 0.5, 0.5,
-4.270254, -3.505462, 2, 0, -0.5, 0.5, 0.5,
-4.270254, -3.505462, 2, 1, -0.5, 0.5, 0.5,
-4.270254, -3.505462, 2, 1, 1.5, 0.5, 0.5,
-4.270254, -3.505462, 2, 0, 1.5, 0.5, 0.5,
-4.270254, -3.505462, 4, 0, -0.5, 0.5, 0.5,
-4.270254, -3.505462, 4, 1, -0.5, 0.5, 0.5,
-4.270254, -3.505462, 4, 1, 1.5, 0.5, 0.5,
-4.270254, -3.505462, 4, 0, 1.5, 0.5, 0.5
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
-3.775274, -3.032705, -5.407616,
-3.775274, 3.27073, -5.407616,
-3.775274, -3.032705, 5.16122,
-3.775274, 3.27073, 5.16122,
-3.775274, -3.032705, -5.407616,
-3.775274, -3.032705, 5.16122,
-3.775274, 3.27073, -5.407616,
-3.775274, 3.27073, 5.16122,
-3.775274, -3.032705, -5.407616,
2.82445, -3.032705, -5.407616,
-3.775274, -3.032705, 5.16122,
2.82445, -3.032705, 5.16122,
-3.775274, 3.27073, -5.407616,
2.82445, 3.27073, -5.407616,
-3.775274, 3.27073, 5.16122,
2.82445, 3.27073, 5.16122,
2.82445, -3.032705, -5.407616,
2.82445, 3.27073, -5.407616,
2.82445, -3.032705, 5.16122,
2.82445, 3.27073, 5.16122,
2.82445, -3.032705, -5.407616,
2.82445, -3.032705, 5.16122,
2.82445, 3.27073, -5.407616,
2.82445, 3.27073, 5.16122
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
var radius = 7.456441;
var distance = 33.17455;
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
mvMatrix.translate( 0.4754119, -0.1190124, 0.1231983 );
mvMatrix.scale( 1.221574, 1.278993, 0.7628134 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.17455);
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


