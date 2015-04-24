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
-3.634257, -0.1244262, -2.63991, 1, 0, 0, 1,
-3.364236, 0.8474266, 0.4602795, 1, 0.007843138, 0, 1,
-2.874106, 0.4193406, -2.603796, 1, 0.01176471, 0, 1,
-2.868464, 1.223275, -0.3341507, 1, 0.01960784, 0, 1,
-2.863252, 0.4687437, -0.6651497, 1, 0.02352941, 0, 1,
-2.814165, 0.2040972, -1.818546, 1, 0.03137255, 0, 1,
-2.728828, 1.811721, 0.3214661, 1, 0.03529412, 0, 1,
-2.712382, 0.7999116, -1.314623, 1, 0.04313726, 0, 1,
-2.598906, 0.6552648, -0.9430383, 1, 0.04705882, 0, 1,
-2.554489, -1.529157, -2.436435, 1, 0.05490196, 0, 1,
-2.302505, 1.945194, -0.2178556, 1, 0.05882353, 0, 1,
-2.287203, -1.458362, -2.982174, 1, 0.06666667, 0, 1,
-2.128834, 0.1201203, -2.779832, 1, 0.07058824, 0, 1,
-2.078357, -0.6565767, -0.6826468, 1, 0.07843138, 0, 1,
-2.024987, 0.4216846, -0.7959793, 1, 0.08235294, 0, 1,
-2.000589, -1.370256, -2.370641, 1, 0.09019608, 0, 1,
-1.992099, 1.221456, -1.594673, 1, 0.09411765, 0, 1,
-1.972904, 0.7721756, -1.674066, 1, 0.1019608, 0, 1,
-1.943997, 0.02436099, -1.421984, 1, 0.1098039, 0, 1,
-1.934114, 0.2675046, -0.1371548, 1, 0.1137255, 0, 1,
-1.928627, -0.2951309, -2.564934, 1, 0.1215686, 0, 1,
-1.922134, 0.1088262, -1.309233, 1, 0.1254902, 0, 1,
-1.865436, -0.2484122, -2.395854, 1, 0.1333333, 0, 1,
-1.856483, 0.2192866, -0.8902439, 1, 0.1372549, 0, 1,
-1.842711, 1.73281, -0.7702327, 1, 0.145098, 0, 1,
-1.818402, 0.2586733, -0.6562725, 1, 0.1490196, 0, 1,
-1.815517, 0.0384386, 0.1940791, 1, 0.1568628, 0, 1,
-1.799358, -1.041558, -1.3332, 1, 0.1607843, 0, 1,
-1.795139, -0.6180596, -2.291001, 1, 0.1686275, 0, 1,
-1.780976, 0.8072517, -0.4575026, 1, 0.172549, 0, 1,
-1.774909, 1.583018, -1.880561, 1, 0.1803922, 0, 1,
-1.769816, 0.477745, -0.9384995, 1, 0.1843137, 0, 1,
-1.747971, -0.04388119, -2.380356, 1, 0.1921569, 0, 1,
-1.740844, -0.6709582, -2.34139, 1, 0.1960784, 0, 1,
-1.731961, -1.69837, -1.764796, 1, 0.2039216, 0, 1,
-1.715757, -0.5302431, -0.8046044, 1, 0.2117647, 0, 1,
-1.704018, -0.09878603, -0.9109054, 1, 0.2156863, 0, 1,
-1.686353, -0.6157471, -1.096225, 1, 0.2235294, 0, 1,
-1.670141, -0.09712763, -1.60573, 1, 0.227451, 0, 1,
-1.660877, -0.8044795, -2.719581, 1, 0.2352941, 0, 1,
-1.658481, 0.7049377, -1.582376, 1, 0.2392157, 0, 1,
-1.656325, 0.2301672, -2.121046, 1, 0.2470588, 0, 1,
-1.652475, -1.35838, -1.473297, 1, 0.2509804, 0, 1,
-1.650655, -0.4786883, -0.8096417, 1, 0.2588235, 0, 1,
-1.647048, 1.013299, -2.218574, 1, 0.2627451, 0, 1,
-1.635963, 1.055413, 0.3603821, 1, 0.2705882, 0, 1,
-1.610118, -0.01945196, -0.9149871, 1, 0.2745098, 0, 1,
-1.600512, 0.4408711, -0.09595948, 1, 0.282353, 0, 1,
-1.599544, -0.8444519, -0.5523648, 1, 0.2862745, 0, 1,
-1.596434, 0.6507697, -1.053037, 1, 0.2941177, 0, 1,
-1.580434, 0.7688057, -0.2239964, 1, 0.3019608, 0, 1,
-1.554066, -0.3007334, -1.704648, 1, 0.3058824, 0, 1,
-1.547757, 0.3267433, -2.461792, 1, 0.3137255, 0, 1,
-1.546932, -0.2591229, -1.006171, 1, 0.3176471, 0, 1,
-1.530354, 0.6653138, -2.870294, 1, 0.3254902, 0, 1,
-1.517215, 0.5017222, -1.55723, 1, 0.3294118, 0, 1,
-1.509725, 2.244704, -0.9329609, 1, 0.3372549, 0, 1,
-1.497532, -1.157909, -2.167784, 1, 0.3411765, 0, 1,
-1.496611, 0.1011687, -0.6647266, 1, 0.3490196, 0, 1,
-1.480136, 0.809225, 0.8415791, 1, 0.3529412, 0, 1,
-1.47449, -1.30064, -1.588266, 1, 0.3607843, 0, 1,
-1.470407, -1.653646, -1.103665, 1, 0.3647059, 0, 1,
-1.465796, 0.07796324, -0.5081536, 1, 0.372549, 0, 1,
-1.464796, 0.2533885, -1.212081, 1, 0.3764706, 0, 1,
-1.464024, 0.2192617, -0.4686784, 1, 0.3843137, 0, 1,
-1.450742, -0.4747814, -2.937481, 1, 0.3882353, 0, 1,
-1.445993, -1.546462, -2.957448, 1, 0.3960784, 0, 1,
-1.443839, -0.6441809, -3.005954, 1, 0.4039216, 0, 1,
-1.442563, 0.06972619, -2.497993, 1, 0.4078431, 0, 1,
-1.422358, -0.7091126, -1.227152, 1, 0.4156863, 0, 1,
-1.4135, 0.9488773, -1.750893, 1, 0.4196078, 0, 1,
-1.41324, 0.09463935, -0.01610754, 1, 0.427451, 0, 1,
-1.400619, -0.5943072, -1.184929, 1, 0.4313726, 0, 1,
-1.400349, 1.025835, -0.415926, 1, 0.4392157, 0, 1,
-1.394672, 0.8709365, -0.07485684, 1, 0.4431373, 0, 1,
-1.392262, -1.058159, -1.613021, 1, 0.4509804, 0, 1,
-1.381184, 0.7919854, -0.1321179, 1, 0.454902, 0, 1,
-1.367141, 0.3145982, -0.2285614, 1, 0.4627451, 0, 1,
-1.364891, 0.7111722, -0.5439907, 1, 0.4666667, 0, 1,
-1.350418, -0.3272201, -0.7832083, 1, 0.4745098, 0, 1,
-1.345863, 0.6208901, -2.085825, 1, 0.4784314, 0, 1,
-1.339932, 1.066011, 0.4378227, 1, 0.4862745, 0, 1,
-1.336352, -0.05661571, -3.497389, 1, 0.4901961, 0, 1,
-1.327789, 1.180799, -0.3546397, 1, 0.4980392, 0, 1,
-1.327279, -0.9347132, -3.60105, 1, 0.5058824, 0, 1,
-1.321457, 0.2048148, -1.826578, 1, 0.509804, 0, 1,
-1.318306, -0.8860045, -2.506305, 1, 0.5176471, 0, 1,
-1.314336, -1.405278, -2.184131, 1, 0.5215687, 0, 1,
-1.312452, 0.6388497, -0.06150582, 1, 0.5294118, 0, 1,
-1.30501, -1.129438, -2.363035, 1, 0.5333334, 0, 1,
-1.303412, 1.861708, -1.519736, 1, 0.5411765, 0, 1,
-1.295728, -1.53115, -3.557267, 1, 0.5450981, 0, 1,
-1.293839, 0.4258057, -0.4267408, 1, 0.5529412, 0, 1,
-1.290051, 1.65886, -1.026681, 1, 0.5568628, 0, 1,
-1.27184, 0.9913791, -0.5273879, 1, 0.5647059, 0, 1,
-1.269765, -0.278746, -0.1875914, 1, 0.5686275, 0, 1,
-1.253943, -1.129604, -3.016565, 1, 0.5764706, 0, 1,
-1.245894, 1.550245, -1.068609, 1, 0.5803922, 0, 1,
-1.241903, 0.05782794, -1.937873, 1, 0.5882353, 0, 1,
-1.23976, -0.3303361, -1.302748, 1, 0.5921569, 0, 1,
-1.229894, -1.137192, -1.08569, 1, 0.6, 0, 1,
-1.229648, -1.047943, -3.062971, 1, 0.6078432, 0, 1,
-1.222057, -0.1877431, -2.403459, 1, 0.6117647, 0, 1,
-1.218288, 1.140655, -0.8209559, 1, 0.6196079, 0, 1,
-1.210831, 0.0971357, -3.085537, 1, 0.6235294, 0, 1,
-1.207711, 0.7206789, -0.5991252, 1, 0.6313726, 0, 1,
-1.200525, 1.528256, 0.03695487, 1, 0.6352941, 0, 1,
-1.197578, -0.6125482, -0.3385379, 1, 0.6431373, 0, 1,
-1.194296, 3.445591, -1.95144, 1, 0.6470588, 0, 1,
-1.192382, -1.165303, -3.981286, 1, 0.654902, 0, 1,
-1.192177, -0.5810635, -1.342166, 1, 0.6588235, 0, 1,
-1.190719, -0.7187819, -2.097815, 1, 0.6666667, 0, 1,
-1.187957, -0.8201665, -2.169501, 1, 0.6705883, 0, 1,
-1.181895, 1.082444, 0.05257664, 1, 0.6784314, 0, 1,
-1.180541, 0.1787791, -0.6663304, 1, 0.682353, 0, 1,
-1.176516, 0.1220411, -1.674335, 1, 0.6901961, 0, 1,
-1.175874, -0.8299734, -2.858575, 1, 0.6941177, 0, 1,
-1.171642, -0.0253618, -1.81166, 1, 0.7019608, 0, 1,
-1.167499, -0.9709048, -1.007649, 1, 0.7098039, 0, 1,
-1.162147, 1.734585, -2.214306, 1, 0.7137255, 0, 1,
-1.159838, 0.2899617, -0.4178515, 1, 0.7215686, 0, 1,
-1.157593, -1.388504, -1.330124, 1, 0.7254902, 0, 1,
-1.123296, 0.3279321, -0.8447987, 1, 0.7333333, 0, 1,
-1.122399, 0.2600363, -1.914235, 1, 0.7372549, 0, 1,
-1.122337, -1.071533, -1.881626, 1, 0.7450981, 0, 1,
-1.117994, 0.2604642, -1.775157, 1, 0.7490196, 0, 1,
-1.117599, -0.263149, -1.036371, 1, 0.7568628, 0, 1,
-1.117066, 0.1353877, -1.201162, 1, 0.7607843, 0, 1,
-1.115307, 0.3024588, -0.07023699, 1, 0.7686275, 0, 1,
-1.114324, 0.9783741, 1.021278, 1, 0.772549, 0, 1,
-1.107335, 0.7155501, -1.365836, 1, 0.7803922, 0, 1,
-1.092619, -0.4322847, -0.5541377, 1, 0.7843137, 0, 1,
-1.092286, -2.337897, -2.416375, 1, 0.7921569, 0, 1,
-1.087642, 0.2984211, -1.099903, 1, 0.7960784, 0, 1,
-1.084988, -0.01670539, -0.1684512, 1, 0.8039216, 0, 1,
-1.082546, 0.1923737, -0.5230393, 1, 0.8117647, 0, 1,
-1.07966, 1.015713, -1.401264, 1, 0.8156863, 0, 1,
-1.076748, -0.6385411, -1.196549, 1, 0.8235294, 0, 1,
-1.07049, -0.05962544, -1.138364, 1, 0.827451, 0, 1,
-1.068416, -1.580301, -2.862008, 1, 0.8352941, 0, 1,
-1.06682, 2.681504, -1.572402, 1, 0.8392157, 0, 1,
-1.062769, 1.173963, -0.969906, 1, 0.8470588, 0, 1,
-1.058132, -0.3809606, -2.087384, 1, 0.8509804, 0, 1,
-1.055825, -0.8937322, -2.989485, 1, 0.8588235, 0, 1,
-1.047782, -0.6324384, -1.046097, 1, 0.8627451, 0, 1,
-1.047542, -1.56369, -2.117428, 1, 0.8705882, 0, 1,
-1.031033, 0.7834868, -0.2657795, 1, 0.8745098, 0, 1,
-1.027961, 1.768644, -1.071446, 1, 0.8823529, 0, 1,
-1.024344, 2.749818, 0.08058632, 1, 0.8862745, 0, 1,
-1.021279, 0.5953578, -0.1876317, 1, 0.8941177, 0, 1,
-1.019503, 0.7042727, 0.2757335, 1, 0.8980392, 0, 1,
-1.012361, 1.232102, 0.3731484, 1, 0.9058824, 0, 1,
-1.00631, -1.094087, -2.278624, 1, 0.9137255, 0, 1,
-1.004542, -1.413346, -2.092741, 1, 0.9176471, 0, 1,
-0.994827, -0.2634333, -0.8260931, 1, 0.9254902, 0, 1,
-0.9939398, 0.2449779, -2.021629, 1, 0.9294118, 0, 1,
-0.9912, 0.9364592, -2.143915, 1, 0.9372549, 0, 1,
-0.9802036, -2.574597, -0.531578, 1, 0.9411765, 0, 1,
-0.9678972, 1.154859, -0.2534606, 1, 0.9490196, 0, 1,
-0.9558169, -0.4652675, -3.497276, 1, 0.9529412, 0, 1,
-0.9546584, -2.518833, -1.231755, 1, 0.9607843, 0, 1,
-0.9528466, 0.6201406, -0.9325659, 1, 0.9647059, 0, 1,
-0.95225, 0.001551016, -1.330866, 1, 0.972549, 0, 1,
-0.9504077, -0.05774926, -2.714387, 1, 0.9764706, 0, 1,
-0.9380416, 1.902663, 0.3546235, 1, 0.9843137, 0, 1,
-0.9335414, -1.815301, -1.621624, 1, 0.9882353, 0, 1,
-0.9320383, -0.7814876, -4.256591, 1, 0.9960784, 0, 1,
-0.9263121, -0.8059559, -2.203544, 0.9960784, 1, 0, 1,
-0.9214718, -0.8272028, -2.056817, 0.9921569, 1, 0, 1,
-0.9151261, -0.3174607, -1.667107, 0.9843137, 1, 0, 1,
-0.9102033, 1.183364, -0.4222038, 0.9803922, 1, 0, 1,
-0.9099737, 0.3517641, 0.3962926, 0.972549, 1, 0, 1,
-0.8964818, -0.5889965, -1.43827, 0.9686275, 1, 0, 1,
-0.8897811, -0.5879794, -3.111631, 0.9607843, 1, 0, 1,
-0.8864412, -0.9098194, -4.398917, 0.9568627, 1, 0, 1,
-0.8836629, 1.073192, -1.034179, 0.9490196, 1, 0, 1,
-0.879384, -0.3792805, -0.8647516, 0.945098, 1, 0, 1,
-0.875315, -0.57762, -1.232403, 0.9372549, 1, 0, 1,
-0.8656089, -1.106779, -2.553559, 0.9333333, 1, 0, 1,
-0.859425, -0.9121414, -0.6625425, 0.9254902, 1, 0, 1,
-0.8521104, -0.9350284, -3.876004, 0.9215686, 1, 0, 1,
-0.8441641, -0.7438958, -1.952651, 0.9137255, 1, 0, 1,
-0.8402702, -1.712589, -2.153717, 0.9098039, 1, 0, 1,
-0.8398322, -0.6481148, -1.842417, 0.9019608, 1, 0, 1,
-0.8395018, -0.6119561, -2.250401, 0.8941177, 1, 0, 1,
-0.838536, -0.1989559, -1.912138, 0.8901961, 1, 0, 1,
-0.8293069, -1.479778, -4.352443, 0.8823529, 1, 0, 1,
-0.8277907, 1.131513, -1.612793, 0.8784314, 1, 0, 1,
-0.8273087, -0.2140405, -1.899788, 0.8705882, 1, 0, 1,
-0.8251755, 0.2568399, -0.7416128, 0.8666667, 1, 0, 1,
-0.8225369, 0.7245003, -0.02862833, 0.8588235, 1, 0, 1,
-0.8161929, 1.178165, -1.150852, 0.854902, 1, 0, 1,
-0.8143781, 0.2899047, -0.04579706, 0.8470588, 1, 0, 1,
-0.8133816, -0.4424894, -1.255489, 0.8431373, 1, 0, 1,
-0.8126139, 0.9406192, -1.153206, 0.8352941, 1, 0, 1,
-0.8122638, 1.488253, -1.823088, 0.8313726, 1, 0, 1,
-0.8102255, 0.1024127, -1.02773, 0.8235294, 1, 0, 1,
-0.810078, 0.5140217, -0.01450027, 0.8196079, 1, 0, 1,
-0.7986695, -0.2187396, -2.093869, 0.8117647, 1, 0, 1,
-0.7958388, 0.3453978, -2.700658, 0.8078431, 1, 0, 1,
-0.7889314, -1.056432, -1.330287, 0.8, 1, 0, 1,
-0.7885954, -0.3629777, -1.511567, 0.7921569, 1, 0, 1,
-0.788188, -0.7723588, -0.7161096, 0.7882353, 1, 0, 1,
-0.780133, 0.4426754, -1.862747, 0.7803922, 1, 0, 1,
-0.7795004, -0.5287285, -2.796517, 0.7764706, 1, 0, 1,
-0.7784454, -1.760447, -3.264682, 0.7686275, 1, 0, 1,
-0.7758979, 0.877335, 0.5483081, 0.7647059, 1, 0, 1,
-0.7740571, -0.4239284, -2.916379, 0.7568628, 1, 0, 1,
-0.7701276, 0.319787, -2.088249, 0.7529412, 1, 0, 1,
-0.767545, -0.7013568, -2.351518, 0.7450981, 1, 0, 1,
-0.7670803, 0.3840519, -0.785013, 0.7411765, 1, 0, 1,
-0.7650993, 0.1982604, -0.1445746, 0.7333333, 1, 0, 1,
-0.7617926, -0.4292234, -1.502247, 0.7294118, 1, 0, 1,
-0.7593648, 0.1455584, -3.221966, 0.7215686, 1, 0, 1,
-0.7589783, -0.6030431, -3.286651, 0.7176471, 1, 0, 1,
-0.7536243, 0.6818107, -1.311898, 0.7098039, 1, 0, 1,
-0.7525241, 0.08125268, 0.3502799, 0.7058824, 1, 0, 1,
-0.7499714, 1.738324, -1.908816, 0.6980392, 1, 0, 1,
-0.7452377, -0.2095421, -0.044, 0.6901961, 1, 0, 1,
-0.7425538, 1.721465, 0.2679609, 0.6862745, 1, 0, 1,
-0.7381067, -0.2915958, -1.852784, 0.6784314, 1, 0, 1,
-0.7359836, -0.8905834, -2.900601, 0.6745098, 1, 0, 1,
-0.7352592, 2.648559, -0.1379557, 0.6666667, 1, 0, 1,
-0.7317144, -0.1865396, -0.7400311, 0.6627451, 1, 0, 1,
-0.730321, 0.3973528, -0.01537861, 0.654902, 1, 0, 1,
-0.7271534, 1.698745, 0.8293512, 0.6509804, 1, 0, 1,
-0.7254451, -1.251555, -4.724009, 0.6431373, 1, 0, 1,
-0.7199546, 1.229426, -1.190654, 0.6392157, 1, 0, 1,
-0.7107854, 0.4149946, -1.168528, 0.6313726, 1, 0, 1,
-0.7087708, -0.4386317, -1.945334, 0.627451, 1, 0, 1,
-0.7071627, -2.381665, -3.451116, 0.6196079, 1, 0, 1,
-0.7066573, 0.1682804, -1.962904, 0.6156863, 1, 0, 1,
-0.7060937, 0.2298972, -0.6523466, 0.6078432, 1, 0, 1,
-0.7027869, -2.07786, -3.335651, 0.6039216, 1, 0, 1,
-0.7010033, 0.6038975, -2.483117, 0.5960785, 1, 0, 1,
-0.6996781, -0.5106221, -2.329396, 0.5882353, 1, 0, 1,
-0.6918677, -0.9585055, -1.658558, 0.5843138, 1, 0, 1,
-0.687272, 0.03513096, -1.801078, 0.5764706, 1, 0, 1,
-0.6814455, 0.686433, -1.757132, 0.572549, 1, 0, 1,
-0.6812018, -0.5733572, -3.899869, 0.5647059, 1, 0, 1,
-0.6805016, 1.25164, -1.624723, 0.5607843, 1, 0, 1,
-0.6798715, 0.3555663, -1.3504, 0.5529412, 1, 0, 1,
-0.6796754, -1.678911, -3.444603, 0.5490196, 1, 0, 1,
-0.6779755, -1.062586, -2.620836, 0.5411765, 1, 0, 1,
-0.6747495, 0.807417, -0.154127, 0.5372549, 1, 0, 1,
-0.6717121, -0.333443, -1.006866, 0.5294118, 1, 0, 1,
-0.6657361, 0.5305735, -0.8581007, 0.5254902, 1, 0, 1,
-0.6647873, -0.06010551, -0.2519764, 0.5176471, 1, 0, 1,
-0.6636496, 1.326636, 1.29906, 0.5137255, 1, 0, 1,
-0.6630968, 0.02235815, 0.1855831, 0.5058824, 1, 0, 1,
-0.6605837, 1.87427, 0.1038449, 0.5019608, 1, 0, 1,
-0.6589035, 0.4166255, -0.4243025, 0.4941176, 1, 0, 1,
-0.6570904, 0.8835435, 0.5543739, 0.4862745, 1, 0, 1,
-0.6553059, 0.5697927, -0.3435511, 0.4823529, 1, 0, 1,
-0.6552968, -0.389661, -2.711361, 0.4745098, 1, 0, 1,
-0.6522829, -0.6379651, -0.8462442, 0.4705882, 1, 0, 1,
-0.6521828, 2.304562, -0.1325006, 0.4627451, 1, 0, 1,
-0.6505303, 0.1591888, -2.849438, 0.4588235, 1, 0, 1,
-0.6427689, -0.6288003, -1.198567, 0.4509804, 1, 0, 1,
-0.6424634, -0.9946593, -5.384265, 0.4470588, 1, 0, 1,
-0.6405451, 0.01200512, -2.570928, 0.4392157, 1, 0, 1,
-0.6372015, 0.7328908, -0.7784423, 0.4352941, 1, 0, 1,
-0.6355773, -0.3165029, -3.233418, 0.427451, 1, 0, 1,
-0.6288376, 0.2631763, -0.945421, 0.4235294, 1, 0, 1,
-0.6284119, 0.365605, -1.715554, 0.4156863, 1, 0, 1,
-0.6215708, -0.9364051, -0.4639756, 0.4117647, 1, 0, 1,
-0.6211858, -1.148086, -3.009462, 0.4039216, 1, 0, 1,
-0.6182253, 0.2722424, -3.334694, 0.3960784, 1, 0, 1,
-0.617368, 0.5590861, 0.7847086, 0.3921569, 1, 0, 1,
-0.6045929, -1.213637, -3.229161, 0.3843137, 1, 0, 1,
-0.6043968, 0.6286911, -0.8779125, 0.3803922, 1, 0, 1,
-0.5982522, -0.7605484, -3.964821, 0.372549, 1, 0, 1,
-0.598047, 2.087762, 0.1071485, 0.3686275, 1, 0, 1,
-0.5965914, 1.037281, 0.1154878, 0.3607843, 1, 0, 1,
-0.5884972, 0.5061064, -0.6374477, 0.3568628, 1, 0, 1,
-0.5817567, -0.1555465, -0.9076952, 0.3490196, 1, 0, 1,
-0.5777294, 0.6930151, -0.1976204, 0.345098, 1, 0, 1,
-0.5734709, 0.4635528, -1.023489, 0.3372549, 1, 0, 1,
-0.5710456, 0.2631679, 0.08337384, 0.3333333, 1, 0, 1,
-0.5698878, 0.2313359, -1.996583, 0.3254902, 1, 0, 1,
-0.5696107, 0.1874982, -1.035842, 0.3215686, 1, 0, 1,
-0.5680454, 0.602878, -0.1158516, 0.3137255, 1, 0, 1,
-0.5666864, -0.6153629, -3.84302, 0.3098039, 1, 0, 1,
-0.5636389, -2.036417, -2.433406, 0.3019608, 1, 0, 1,
-0.5584438, -0.1296903, -1.316993, 0.2941177, 1, 0, 1,
-0.5560027, -0.4760757, -2.439612, 0.2901961, 1, 0, 1,
-0.5457027, 0.6544467, -0.409558, 0.282353, 1, 0, 1,
-0.5426439, 0.3375874, -1.625445, 0.2784314, 1, 0, 1,
-0.541004, -1.03581, -1.23353, 0.2705882, 1, 0, 1,
-0.5408633, -0.3297771, -3.034292, 0.2666667, 1, 0, 1,
-0.5400254, -0.413528, -2.259894, 0.2588235, 1, 0, 1,
-0.5297824, -0.6042809, -2.591712, 0.254902, 1, 0, 1,
-0.5292996, 0.8495551, -1.056014, 0.2470588, 1, 0, 1,
-0.5285351, 0.6939948, -2.103967, 0.2431373, 1, 0, 1,
-0.5265831, -0.05788048, -1.630174, 0.2352941, 1, 0, 1,
-0.5196605, -0.4983001, -3.618081, 0.2313726, 1, 0, 1,
-0.518292, 0.8212034, 0.1502794, 0.2235294, 1, 0, 1,
-0.5105439, 0.4533207, -2.540116, 0.2196078, 1, 0, 1,
-0.5104094, -0.589258, -2.139507, 0.2117647, 1, 0, 1,
-0.5077556, -0.8982804, -2.771873, 0.2078431, 1, 0, 1,
-0.4954274, 0.2455516, 0.5857061, 0.2, 1, 0, 1,
-0.494322, -2.003279, -2.155974, 0.1921569, 1, 0, 1,
-0.4900776, -1.141511, -2.745111, 0.1882353, 1, 0, 1,
-0.4888557, -0.763683, -3.919099, 0.1803922, 1, 0, 1,
-0.4871579, 0.3497988, -0.262799, 0.1764706, 1, 0, 1,
-0.481303, 1.016949, 0.7883419, 0.1686275, 1, 0, 1,
-0.4806412, -0.7233113, -1.435211, 0.1647059, 1, 0, 1,
-0.4795795, 0.2160247, -1.412941, 0.1568628, 1, 0, 1,
-0.479136, -1.974582, -4.186472, 0.1529412, 1, 0, 1,
-0.4787785, -1.191394, -3.057098, 0.145098, 1, 0, 1,
-0.4723687, 0.3635013, -0.03464311, 0.1411765, 1, 0, 1,
-0.4667217, -0.02616983, -2.694303, 0.1333333, 1, 0, 1,
-0.4644412, -0.7108018, -1.824159, 0.1294118, 1, 0, 1,
-0.4622634, -1.160732, -3.085678, 0.1215686, 1, 0, 1,
-0.4609178, 2.060276, 0.466223, 0.1176471, 1, 0, 1,
-0.4573897, 0.7338053, -0.4245974, 0.1098039, 1, 0, 1,
-0.452591, 0.07270906, -1.766627, 0.1058824, 1, 0, 1,
-0.4515856, -1.233177, -4.091569, 0.09803922, 1, 0, 1,
-0.4506521, -1.932136, -1.399086, 0.09019608, 1, 0, 1,
-0.4504382, 1.164559, -1.629407, 0.08627451, 1, 0, 1,
-0.4496556, 0.7954401, -1.742779, 0.07843138, 1, 0, 1,
-0.4472519, 1.204148, -0.7479818, 0.07450981, 1, 0, 1,
-0.4466764, 0.4148472, -1.929015, 0.06666667, 1, 0, 1,
-0.4457625, 0.03654108, -2.280374, 0.0627451, 1, 0, 1,
-0.444282, 0.4113396, -3.502785, 0.05490196, 1, 0, 1,
-0.4430657, 0.146834, -2.453593, 0.05098039, 1, 0, 1,
-0.4377037, 0.1068649, -0.7724236, 0.04313726, 1, 0, 1,
-0.4353877, 0.9032303, -0.2825643, 0.03921569, 1, 0, 1,
-0.4352119, -0.6953435, -2.855137, 0.03137255, 1, 0, 1,
-0.4336218, 0.1149542, -2.375429, 0.02745098, 1, 0, 1,
-0.4320046, 0.3746362, -1.240444, 0.01960784, 1, 0, 1,
-0.421573, -0.8724027, -2.765975, 0.01568628, 1, 0, 1,
-0.4196719, 1.329736, 0.1841897, 0.007843138, 1, 0, 1,
-0.4177907, -0.65465, -2.064591, 0.003921569, 1, 0, 1,
-0.4130047, 0.12114, -1.174489, 0, 1, 0.003921569, 1,
-0.4126182, -0.2619544, -1.974104, 0, 1, 0.01176471, 1,
-0.4070528, -0.04812178, -1.746053, 0, 1, 0.01568628, 1,
-0.4062366, -0.7841777, -2.252532, 0, 1, 0.02352941, 1,
-0.4001183, -1.473834, -4.023827, 0, 1, 0.02745098, 1,
-0.3973933, -0.7144269, -3.072406, 0, 1, 0.03529412, 1,
-0.3963636, -1.054617, -2.426278, 0, 1, 0.03921569, 1,
-0.390375, 0.919038, -1.133749, 0, 1, 0.04705882, 1,
-0.3848926, 0.9101195, -2.05217, 0, 1, 0.05098039, 1,
-0.3848344, -0.1843645, -1.294265, 0, 1, 0.05882353, 1,
-0.3813366, 0.09092424, -2.308437, 0, 1, 0.0627451, 1,
-0.3789432, -2.472668, -1.538968, 0, 1, 0.07058824, 1,
-0.3760488, 0.5529215, 0.7055033, 0, 1, 0.07450981, 1,
-0.3750458, 0.5769913, -1.696747, 0, 1, 0.08235294, 1,
-0.3698734, -0.3008313, -0.8172096, 0, 1, 0.08627451, 1,
-0.3692209, -0.3959417, -2.775858, 0, 1, 0.09411765, 1,
-0.3652664, -0.1686965, -3.066219, 0, 1, 0.1019608, 1,
-0.3651876, 1.505987, -0.7984666, 0, 1, 0.1058824, 1,
-0.3622776, -0.03724004, -3.151228, 0, 1, 0.1137255, 1,
-0.3620349, 0.7087231, 0.1545464, 0, 1, 0.1176471, 1,
-0.3606406, 1.494921, -0.02029459, 0, 1, 0.1254902, 1,
-0.3568869, 0.1223222, -0.04539885, 0, 1, 0.1294118, 1,
-0.3539837, 0.7429645, -1.409898, 0, 1, 0.1372549, 1,
-0.3487969, 0.2547183, -1.599407, 0, 1, 0.1411765, 1,
-0.3473692, 1.062571, 0.3427626, 0, 1, 0.1490196, 1,
-0.347092, 1.010572, -0.3503439, 0, 1, 0.1529412, 1,
-0.3456127, -0.4560052, -4.585992, 0, 1, 0.1607843, 1,
-0.3452687, -0.07309376, -2.624147, 0, 1, 0.1647059, 1,
-0.3447825, 1.389125, 1.406654, 0, 1, 0.172549, 1,
-0.3428597, 0.09119146, -0.7896131, 0, 1, 0.1764706, 1,
-0.3403962, -0.4926049, -2.165033, 0, 1, 0.1843137, 1,
-0.3396305, -1.778417, -2.535537, 0, 1, 0.1882353, 1,
-0.3388689, -0.2950108, -4.594351, 0, 1, 0.1960784, 1,
-0.3370544, -0.1157544, -1.014372, 0, 1, 0.2039216, 1,
-0.334413, -0.2144249, -0.799642, 0, 1, 0.2078431, 1,
-0.3332721, -0.2870785, -2.35121, 0, 1, 0.2156863, 1,
-0.3304816, -0.5011021, -4.09638, 0, 1, 0.2196078, 1,
-0.3303873, 0.9078344, 1.404281, 0, 1, 0.227451, 1,
-0.3257655, 0.3700834, -0.468312, 0, 1, 0.2313726, 1,
-0.3249818, -1.14752, -2.679421, 0, 1, 0.2392157, 1,
-0.3245213, -0.7579535, -3.443959, 0, 1, 0.2431373, 1,
-0.3184259, 1.389906, -1.216422, 0, 1, 0.2509804, 1,
-0.3162813, -0.8186342, -2.872637, 0, 1, 0.254902, 1,
-0.316013, -0.7292704, -2.535408, 0, 1, 0.2627451, 1,
-0.312149, -1.725253, -2.949392, 0, 1, 0.2666667, 1,
-0.3083719, -0.7602437, -2.896099, 0, 1, 0.2745098, 1,
-0.304493, -0.1100564, -1.784654, 0, 1, 0.2784314, 1,
-0.3010557, -1.856177, -1.670512, 0, 1, 0.2862745, 1,
-0.2981442, -0.893205, -3.400149, 0, 1, 0.2901961, 1,
-0.29394, 0.04111682, -2.374388, 0, 1, 0.2980392, 1,
-0.2916524, -1.653194, -4.387279, 0, 1, 0.3058824, 1,
-0.290729, 0.2801249, -0.4575578, 0, 1, 0.3098039, 1,
-0.2905312, -0.3255427, -1.854097, 0, 1, 0.3176471, 1,
-0.2887131, -1.337701, -2.805147, 0, 1, 0.3215686, 1,
-0.2837368, -1.206737, -1.678267, 0, 1, 0.3294118, 1,
-0.2783667, 0.7621971, -0.3903373, 0, 1, 0.3333333, 1,
-0.2766182, 1.015424, -0.503893, 0, 1, 0.3411765, 1,
-0.2749493, -0.3575954, -2.014726, 0, 1, 0.345098, 1,
-0.274675, 0.1245658, 0.8320124, 0, 1, 0.3529412, 1,
-0.2744263, -0.06140612, -0.9207675, 0, 1, 0.3568628, 1,
-0.2722793, 0.1546381, -2.897747, 0, 1, 0.3647059, 1,
-0.2665165, -0.4696867, -3.183772, 0, 1, 0.3686275, 1,
-0.2629849, -0.6509721, -3.58987, 0, 1, 0.3764706, 1,
-0.2605357, -0.05423634, -2.394505, 0, 1, 0.3803922, 1,
-0.2602412, -0.2593704, -0.9179856, 0, 1, 0.3882353, 1,
-0.2585501, -0.08021645, -0.6635274, 0, 1, 0.3921569, 1,
-0.2555179, -0.3401734, -3.450056, 0, 1, 0.4, 1,
-0.2521935, 0.4686723, -0.8662584, 0, 1, 0.4078431, 1,
-0.2471932, 2.155757, -0.256642, 0, 1, 0.4117647, 1,
-0.2458448, -0.8834626, -2.557025, 0, 1, 0.4196078, 1,
-0.2458151, 0.8438411, -0.8203868, 0, 1, 0.4235294, 1,
-0.2448729, -0.2239609, -3.378286, 0, 1, 0.4313726, 1,
-0.2432054, -1.528666, -3.367369, 0, 1, 0.4352941, 1,
-0.24279, 1.10043, -0.6192515, 0, 1, 0.4431373, 1,
-0.2426817, 0.5784128, -0.3205973, 0, 1, 0.4470588, 1,
-0.2347043, -0.374009, -4.524007, 0, 1, 0.454902, 1,
-0.233206, -0.09798017, -0.6039314, 0, 1, 0.4588235, 1,
-0.2309348, -0.3886895, -1.514193, 0, 1, 0.4666667, 1,
-0.229338, -1.167325, -3.67675, 0, 1, 0.4705882, 1,
-0.2289084, -0.4349416, -1.160101, 0, 1, 0.4784314, 1,
-0.2283492, -3.057267, -2.214088, 0, 1, 0.4823529, 1,
-0.2159538, -1.30406, -2.076254, 0, 1, 0.4901961, 1,
-0.2152406, 0.5304883, 0.6495679, 0, 1, 0.4941176, 1,
-0.2147246, 1.087907, -0.6046171, 0, 1, 0.5019608, 1,
-0.2142853, -1.524002, -5.217871, 0, 1, 0.509804, 1,
-0.2140184, -0.848119, -2.563483, 0, 1, 0.5137255, 1,
-0.2133512, -0.7965991, -3.464448, 0, 1, 0.5215687, 1,
-0.2107645, 0.2234062, 0.9976521, 0, 1, 0.5254902, 1,
-0.2013336, 1.103478, -0.1966412, 0, 1, 0.5333334, 1,
-0.195829, 1.393133, 0.3360828, 0, 1, 0.5372549, 1,
-0.1953307, 0.2647169, -0.8929116, 0, 1, 0.5450981, 1,
-0.1929589, -1.72768, -3.340791, 0, 1, 0.5490196, 1,
-0.1927128, 2.284663, -0.04418259, 0, 1, 0.5568628, 1,
-0.189074, 0.1316739, -0.830022, 0, 1, 0.5607843, 1,
-0.1833667, 0.576307, 0.02042797, 0, 1, 0.5686275, 1,
-0.1808011, 1.804419, -3.073298, 0, 1, 0.572549, 1,
-0.1779827, -0.3978735, -3.848692, 0, 1, 0.5803922, 1,
-0.1770118, -1.245033, -3.61519, 0, 1, 0.5843138, 1,
-0.1652026, 0.279672, 0.6748599, 0, 1, 0.5921569, 1,
-0.165022, -0.7905065, -1.04077, 0, 1, 0.5960785, 1,
-0.1646313, 0.3426851, 1.239089, 0, 1, 0.6039216, 1,
-0.1549202, -0.7938839, -2.856198, 0, 1, 0.6117647, 1,
-0.1548243, -2.554971, -0.580881, 0, 1, 0.6156863, 1,
-0.154487, 0.3155918, -0.6941282, 0, 1, 0.6235294, 1,
-0.1526938, 0.5769064, 1.010631, 0, 1, 0.627451, 1,
-0.1514378, 0.2255393, 0.7698979, 0, 1, 0.6352941, 1,
-0.1511963, -0.02413128, -0.807355, 0, 1, 0.6392157, 1,
-0.1500347, -0.5473019, -1.88981, 0, 1, 0.6470588, 1,
-0.1496259, -0.292602, -4.361846, 0, 1, 0.6509804, 1,
-0.1457523, 1.294922, 0.4007563, 0, 1, 0.6588235, 1,
-0.1407977, 0.6925274, 0.3395611, 0, 1, 0.6627451, 1,
-0.140647, -0.7081106, -3.193327, 0, 1, 0.6705883, 1,
-0.1396076, -2.129756, -3.149444, 0, 1, 0.6745098, 1,
-0.1394593, 0.276211, -0.8144958, 0, 1, 0.682353, 1,
-0.1316459, -1.189576, -2.24004, 0, 1, 0.6862745, 1,
-0.1248584, 1.073593, 0.8539358, 0, 1, 0.6941177, 1,
-0.1238208, 0.3328805, 0.6251891, 0, 1, 0.7019608, 1,
-0.1225219, -0.5224305, -3.626945, 0, 1, 0.7058824, 1,
-0.1222553, 0.3681059, -2.143167, 0, 1, 0.7137255, 1,
-0.120066, 1.234912, -0.4428388, 0, 1, 0.7176471, 1,
-0.1194084, 0.5739926, 0.2289323, 0, 1, 0.7254902, 1,
-0.1174195, -0.05145574, -2.100088, 0, 1, 0.7294118, 1,
-0.1166106, -0.4757281, -2.172868, 0, 1, 0.7372549, 1,
-0.1164771, -1.925377, -3.280086, 0, 1, 0.7411765, 1,
-0.1128279, 0.3268775, -0.5588944, 0, 1, 0.7490196, 1,
-0.1072873, 0.02767248, -1.147598, 0, 1, 0.7529412, 1,
-0.1022894, 0.2752306, -1.129712, 0, 1, 0.7607843, 1,
-0.1009989, 0.3216406, 0.3127885, 0, 1, 0.7647059, 1,
-0.09756938, 0.8907506, 0.127107, 0, 1, 0.772549, 1,
-0.09449347, 1.687455, 1.444335, 0, 1, 0.7764706, 1,
-0.09383134, -0.5600293, -2.77555, 0, 1, 0.7843137, 1,
-0.08937071, -1.211451, -3.54576, 0, 1, 0.7882353, 1,
-0.08811186, 1.142806, -0.8815487, 0, 1, 0.7960784, 1,
-0.08623797, 1.826309, 0.5651225, 0, 1, 0.8039216, 1,
-0.08410112, 1.549098, 2.151906, 0, 1, 0.8078431, 1,
-0.0793222, -0.6572217, -3.067117, 0, 1, 0.8156863, 1,
-0.07659868, -0.3768869, -3.639272, 0, 1, 0.8196079, 1,
-0.07433266, -0.08600204, -3.026974, 0, 1, 0.827451, 1,
-0.07353463, 0.5035449, 1.049619, 0, 1, 0.8313726, 1,
-0.07215458, 2.19142, 0.3994946, 0, 1, 0.8392157, 1,
-0.06910677, 0.8480277, -1.439001, 0, 1, 0.8431373, 1,
-0.05869675, -0.1761352, -3.54263, 0, 1, 0.8509804, 1,
-0.05798398, 1.007575, -0.5759902, 0, 1, 0.854902, 1,
-0.05694448, -0.7995232, -2.508238, 0, 1, 0.8627451, 1,
-0.05591368, 0.1330445, 0.1797118, 0, 1, 0.8666667, 1,
-0.05179787, 2.973122, -0.8771603, 0, 1, 0.8745098, 1,
-0.04951544, -1.129675, -2.714335, 0, 1, 0.8784314, 1,
-0.04852857, 2.221443, -0.5104513, 0, 1, 0.8862745, 1,
-0.04751409, 0.2331983, -1.09056, 0, 1, 0.8901961, 1,
-0.04111979, -0.375658, -1.53872, 0, 1, 0.8980392, 1,
-0.0405909, 2.154208, 0.4781158, 0, 1, 0.9058824, 1,
-0.03593412, 1.73129, -0.837908, 0, 1, 0.9098039, 1,
-0.03538183, 0.6458737, -1.42716, 0, 1, 0.9176471, 1,
-0.03351022, 2.16267, -1.684685, 0, 1, 0.9215686, 1,
-0.03209143, 0.3624838, -0.5937034, 0, 1, 0.9294118, 1,
-0.02812869, 1.864996, -0.2176483, 0, 1, 0.9333333, 1,
-0.02763147, 0.2754962, 0.07203574, 0, 1, 0.9411765, 1,
-0.02712701, 0.6924205, -0.3732887, 0, 1, 0.945098, 1,
-0.02632279, -1.95874, -2.490567, 0, 1, 0.9529412, 1,
-0.0228941, -1.245732, -3.597845, 0, 1, 0.9568627, 1,
-0.0190943, -0.6375482, -4.161053, 0, 1, 0.9647059, 1,
-0.007822506, -0.8418558, -1.620912, 0, 1, 0.9686275, 1,
-0.007489734, 0.2296232, -0.5318621, 0, 1, 0.9764706, 1,
0.006111783, 0.1695827, -0.2294997, 0, 1, 0.9803922, 1,
0.009274323, 2.877955, 0.5197842, 0, 1, 0.9882353, 1,
0.01483326, 0.1660471, -0.4281444, 0, 1, 0.9921569, 1,
0.0148726, -0.9314522, 3.157972, 0, 1, 1, 1,
0.01635848, -0.1584985, 1.634215, 0, 0.9921569, 1, 1,
0.01683655, 0.06261002, 0.1679326, 0, 0.9882353, 1, 1,
0.02355335, 0.8824209, 1.355678, 0, 0.9803922, 1, 1,
0.0288649, 0.3750702, -0.2122957, 0, 0.9764706, 1, 1,
0.03930771, -0.2177218, 1.166489, 0, 0.9686275, 1, 1,
0.0405149, -0.5036635, 3.226697, 0, 0.9647059, 1, 1,
0.04626179, 2.18523, 0.004693503, 0, 0.9568627, 1, 1,
0.04860719, 0.9725806, 0.1665473, 0, 0.9529412, 1, 1,
0.05272305, -0.6169446, 3.211939, 0, 0.945098, 1, 1,
0.05329954, -0.571611, 2.403461, 0, 0.9411765, 1, 1,
0.05343165, 0.1610751, 0.4168316, 0, 0.9333333, 1, 1,
0.05403177, -0.6323553, 3.330994, 0, 0.9294118, 1, 1,
0.05579152, -1.604863, 4.123509, 0, 0.9215686, 1, 1,
0.05648814, -0.1304173, 2.629776, 0, 0.9176471, 1, 1,
0.05651359, 0.1926885, 1.926452, 0, 0.9098039, 1, 1,
0.06005247, -0.2771076, 3.436638, 0, 0.9058824, 1, 1,
0.06005393, -0.3705295, 2.648903, 0, 0.8980392, 1, 1,
0.06753351, -1.383768, 5.31828, 0, 0.8901961, 1, 1,
0.07290094, -0.3708027, 3.27555, 0, 0.8862745, 1, 1,
0.07468668, -2.183193, 4.191928, 0, 0.8784314, 1, 1,
0.07657757, -0.1526389, 2.908363, 0, 0.8745098, 1, 1,
0.07663412, -0.001016814, 0.1769133, 0, 0.8666667, 1, 1,
0.07739715, 1.606107, -0.7585292, 0, 0.8627451, 1, 1,
0.08354305, -1.03723, 4.088303, 0, 0.854902, 1, 1,
0.08467867, -1.235294, 3.895558, 0, 0.8509804, 1, 1,
0.09338158, -0.1433075, 3.11224, 0, 0.8431373, 1, 1,
0.09517349, -0.9922224, 3.712572, 0, 0.8392157, 1, 1,
0.09610397, 0.2576357, -1.39708, 0, 0.8313726, 1, 1,
0.09693807, -2.491341, 2.522477, 0, 0.827451, 1, 1,
0.1016145, -1.138829, 2.881571, 0, 0.8196079, 1, 1,
0.1016414, -1.293681, 4.386199, 0, 0.8156863, 1, 1,
0.1029502, 0.8840793, -0.4145711, 0, 0.8078431, 1, 1,
0.1036526, 0.9840924, 0.1141984, 0, 0.8039216, 1, 1,
0.1056339, -1.150418, 2.507628, 0, 0.7960784, 1, 1,
0.1062457, 1.356568, 0.2242589, 0, 0.7882353, 1, 1,
0.1064075, 1.197763, -0.9797605, 0, 0.7843137, 1, 1,
0.1080018, 0.01002653, 1.430382, 0, 0.7764706, 1, 1,
0.1106728, 2.093929, -1.306164, 0, 0.772549, 1, 1,
0.1125595, -1.563917, 2.956679, 0, 0.7647059, 1, 1,
0.1154826, 0.3923262, -1.401, 0, 0.7607843, 1, 1,
0.1159865, 0.8783761, 1.219585, 0, 0.7529412, 1, 1,
0.1188534, 0.02290523, 1.632434, 0, 0.7490196, 1, 1,
0.1252571, -0.8511056, 2.775203, 0, 0.7411765, 1, 1,
0.1255094, 0.2568604, -0.08561087, 0, 0.7372549, 1, 1,
0.1272529, 0.7274238, -2.061091, 0, 0.7294118, 1, 1,
0.1284415, -1.220282, 3.076765, 0, 0.7254902, 1, 1,
0.1290001, 0.1851583, 1.344239, 0, 0.7176471, 1, 1,
0.1296436, -1.233639, 3.586553, 0, 0.7137255, 1, 1,
0.1330409, -0.859215, 3.13727, 0, 0.7058824, 1, 1,
0.1368797, -0.8077824, 1.529562, 0, 0.6980392, 1, 1,
0.1378556, 0.1844082, 1.466136, 0, 0.6941177, 1, 1,
0.1393828, 0.603017, -1.171802, 0, 0.6862745, 1, 1,
0.1416273, 0.5068106, -1.42384, 0, 0.682353, 1, 1,
0.1455175, 0.3654754, 0.2915315, 0, 0.6745098, 1, 1,
0.1515667, -1.263731, 4.132938, 0, 0.6705883, 1, 1,
0.1548761, -0.185096, 2.703217, 0, 0.6627451, 1, 1,
0.1569277, -0.9277889, 3.358872, 0, 0.6588235, 1, 1,
0.1635569, -0.1777162, 4.034322, 0, 0.6509804, 1, 1,
0.1638226, 1.482945, -0.3710222, 0, 0.6470588, 1, 1,
0.1639575, -0.1442806, 1.072912, 0, 0.6392157, 1, 1,
0.1642702, -0.6491938, 4.317635, 0, 0.6352941, 1, 1,
0.1653292, 1.426438, 2.964425, 0, 0.627451, 1, 1,
0.1672115, -0.5201112, 1.247442, 0, 0.6235294, 1, 1,
0.1719396, 0.4150206, 1.402808, 0, 0.6156863, 1, 1,
0.1728732, -1.029513, 4.28986, 0, 0.6117647, 1, 1,
0.1757245, -0.692073, 3.055992, 0, 0.6039216, 1, 1,
0.1781126, 1.910904, -0.893381, 0, 0.5960785, 1, 1,
0.1840528, -0.2824171, 2.313696, 0, 0.5921569, 1, 1,
0.1856266, -0.009520623, 2.499995, 0, 0.5843138, 1, 1,
0.1857922, -1.927238, 2.875929, 0, 0.5803922, 1, 1,
0.1866439, 0.8749641, 0.09005361, 0, 0.572549, 1, 1,
0.1886533, -0.5777749, 4.801857, 0, 0.5686275, 1, 1,
0.1939168, -0.2037153, 3.035821, 0, 0.5607843, 1, 1,
0.1979614, -2.355891, 4.37851, 0, 0.5568628, 1, 1,
0.1988328, 0.08430631, -0.1488625, 0, 0.5490196, 1, 1,
0.2018809, 1.737198, 0.4922087, 0, 0.5450981, 1, 1,
0.2064601, 1.511178, -1.379948, 0, 0.5372549, 1, 1,
0.20745, 0.633411, 0.5897162, 0, 0.5333334, 1, 1,
0.2099216, -0.5210625, 1.030487, 0, 0.5254902, 1, 1,
0.211579, -1.495407, 2.674792, 0, 0.5215687, 1, 1,
0.2129699, -1.583494, 2.65967, 0, 0.5137255, 1, 1,
0.2139454, -0.2854394, 3.30305, 0, 0.509804, 1, 1,
0.215338, 1.204246, 0.05056179, 0, 0.5019608, 1, 1,
0.2155258, 0.5032395, 0.9147394, 0, 0.4941176, 1, 1,
0.2171999, -0.6231, 2.599373, 0, 0.4901961, 1, 1,
0.2204412, -0.4143198, 3.671951, 0, 0.4823529, 1, 1,
0.2215244, -0.6696246, 2.316347, 0, 0.4784314, 1, 1,
0.2251704, -0.9395553, 4.036718, 0, 0.4705882, 1, 1,
0.2375302, 0.7754439, 1.032656, 0, 0.4666667, 1, 1,
0.2382136, -3.663404, 4.535501, 0, 0.4588235, 1, 1,
0.2393417, 1.04876, -1.476785, 0, 0.454902, 1, 1,
0.2424109, 0.2319806, 1.930523, 0, 0.4470588, 1, 1,
0.2424596, 0.8830145, -0.1091273, 0, 0.4431373, 1, 1,
0.2499533, -1.614696, 2.931478, 0, 0.4352941, 1, 1,
0.2540398, -0.6848543, 3.454963, 0, 0.4313726, 1, 1,
0.2545342, 2.115607, -1.722249, 0, 0.4235294, 1, 1,
0.2556277, 0.3798448, -0.2542132, 0, 0.4196078, 1, 1,
0.2558474, 0.8864712, 0.3799645, 0, 0.4117647, 1, 1,
0.260756, -0.8269374, 2.272887, 0, 0.4078431, 1, 1,
0.2609484, -0.6944793, 4.513745, 0, 0.4, 1, 1,
0.2651248, -0.3857395, 2.355981, 0, 0.3921569, 1, 1,
0.2682941, 1.391558, 0.127104, 0, 0.3882353, 1, 1,
0.2725502, -1.7866, 3.071725, 0, 0.3803922, 1, 1,
0.2725836, 0.06766929, 2.851234, 0, 0.3764706, 1, 1,
0.2766948, -0.1670128, 0.9449128, 0, 0.3686275, 1, 1,
0.2816038, 1.293508, -1.51436, 0, 0.3647059, 1, 1,
0.2874958, -0.1408781, 1.522222, 0, 0.3568628, 1, 1,
0.2890517, 0.6444341, 1.409305, 0, 0.3529412, 1, 1,
0.2896308, 0.9850941, 0.512534, 0, 0.345098, 1, 1,
0.2897353, -0.6744819, 2.732896, 0, 0.3411765, 1, 1,
0.2902917, -1.079053, 4.011664, 0, 0.3333333, 1, 1,
0.2918287, 0.006855763, 1.921047, 0, 0.3294118, 1, 1,
0.2926481, 1.759487, -1.167236, 0, 0.3215686, 1, 1,
0.2939809, -0.5158788, 2.412949, 0, 0.3176471, 1, 1,
0.2944109, 1.997818, 0.2946092, 0, 0.3098039, 1, 1,
0.2974915, -0.5550321, 2.852404, 0, 0.3058824, 1, 1,
0.3012054, 0.4590475, 0.5923551, 0, 0.2980392, 1, 1,
0.3016452, -0.02715139, 1.980728, 0, 0.2901961, 1, 1,
0.3052449, 0.1545655, 1.670244, 0, 0.2862745, 1, 1,
0.3072122, -0.05343856, -0.0448388, 0, 0.2784314, 1, 1,
0.3086863, 0.8876361, -0.3709961, 0, 0.2745098, 1, 1,
0.3101334, -1.295224, 2.349512, 0, 0.2666667, 1, 1,
0.3119695, 0.3871496, 1.331672, 0, 0.2627451, 1, 1,
0.315255, 0.6434383, 0.1916967, 0, 0.254902, 1, 1,
0.3166685, 0.845252, 0.354685, 0, 0.2509804, 1, 1,
0.3174724, 2.031375, -0.4256816, 0, 0.2431373, 1, 1,
0.3259712, -0.3681368, 1.634005, 0, 0.2392157, 1, 1,
0.3281737, 1.358307, 1.323709, 0, 0.2313726, 1, 1,
0.3308595, 0.463719, 0.8690364, 0, 0.227451, 1, 1,
0.3329947, -0.1963663, 2.740636, 0, 0.2196078, 1, 1,
0.3422149, 2.396566, 1.649811, 0, 0.2156863, 1, 1,
0.3442161, -0.2468763, 2.271308, 0, 0.2078431, 1, 1,
0.3447569, -0.6945308, 2.072942, 0, 0.2039216, 1, 1,
0.3459875, -0.2291266, 0.9787868, 0, 0.1960784, 1, 1,
0.3496788, -0.4755357, 3.52876, 0, 0.1882353, 1, 1,
0.3517906, -1.111224, 3.446289, 0, 0.1843137, 1, 1,
0.3587381, -1.317162, 2.427968, 0, 0.1764706, 1, 1,
0.3598213, 0.1492207, 0.2623, 0, 0.172549, 1, 1,
0.3620764, -0.2859626, 2.761014, 0, 0.1647059, 1, 1,
0.3665189, 0.4255779, 0.4991585, 0, 0.1607843, 1, 1,
0.3678849, 0.3839962, 1.593993, 0, 0.1529412, 1, 1,
0.3703864, 0.5463873, -0.004832424, 0, 0.1490196, 1, 1,
0.3745994, 0.96292, 0.5399986, 0, 0.1411765, 1, 1,
0.3788038, 0.6588227, 0.7544533, 0, 0.1372549, 1, 1,
0.3819588, -1.14042, 2.56478, 0, 0.1294118, 1, 1,
0.3846923, 0.01946399, 1.680301, 0, 0.1254902, 1, 1,
0.3875899, 0.8964615, 0.563745, 0, 0.1176471, 1, 1,
0.3876848, 0.4929684, 0.04113686, 0, 0.1137255, 1, 1,
0.3890033, 0.0566527, 0.5176168, 0, 0.1058824, 1, 1,
0.3907689, -0.3738297, 1.96589, 0, 0.09803922, 1, 1,
0.3931039, 0.2506413, 0.9712893, 0, 0.09411765, 1, 1,
0.3936257, 0.4955972, -0.7520425, 0, 0.08627451, 1, 1,
0.3966683, 0.3828665, 0.9734133, 0, 0.08235294, 1, 1,
0.3983002, 1.805039, 1.393604, 0, 0.07450981, 1, 1,
0.4041922, -1.053927, 4.281767, 0, 0.07058824, 1, 1,
0.4043631, 0.09547703, 0.6499531, 0, 0.0627451, 1, 1,
0.4056382, 1.014854, -2.362381, 0, 0.05882353, 1, 1,
0.4059474, -0.3861184, 3.26027, 0, 0.05098039, 1, 1,
0.4080387, 0.6923051, 1.192042, 0, 0.04705882, 1, 1,
0.4168541, -1.169441, 3.45474, 0, 0.03921569, 1, 1,
0.4171853, 0.9450332, 0.621663, 0, 0.03529412, 1, 1,
0.4203787, -1.098915, 2.265804, 0, 0.02745098, 1, 1,
0.4209035, 1.209154, 0.7953393, 0, 0.02352941, 1, 1,
0.4211167, 0.4010994, 0.3080814, 0, 0.01568628, 1, 1,
0.4216328, 0.4234468, 0.4683059, 0, 0.01176471, 1, 1,
0.4223358, 0.1790675, 1.506064, 0, 0.003921569, 1, 1,
0.422547, 0.7711065, 1.351095, 0.003921569, 0, 1, 1,
0.4234458, -0.3584945, 3.619477, 0.007843138, 0, 1, 1,
0.4260084, 0.3438869, 1.83572, 0.01568628, 0, 1, 1,
0.4294558, 1.427129, -0.6199406, 0.01960784, 0, 1, 1,
0.4299661, -0.7218077, 1.547269, 0.02745098, 0, 1, 1,
0.4339969, 0.2312529, -0.2912723, 0.03137255, 0, 1, 1,
0.4424067, 2.584107, -0.0210099, 0.03921569, 0, 1, 1,
0.4446695, -0.5063984, 1.783904, 0.04313726, 0, 1, 1,
0.4470422, -0.6961382, 0.5147226, 0.05098039, 0, 1, 1,
0.4473725, 0.624536, 0.2763823, 0.05490196, 0, 1, 1,
0.4475278, -0.3388472, 2.555578, 0.0627451, 0, 1, 1,
0.4509131, -0.8324062, 1.028319, 0.06666667, 0, 1, 1,
0.457527, 0.2728571, 1.807542, 0.07450981, 0, 1, 1,
0.4595956, 2.109911, 0.4612043, 0.07843138, 0, 1, 1,
0.465018, 0.8301126, 1.644469, 0.08627451, 0, 1, 1,
0.4692056, 0.1137835, -0.009324854, 0.09019608, 0, 1, 1,
0.4708192, 1.170002, -0.9248117, 0.09803922, 0, 1, 1,
0.478593, 0.3294222, 1.05251, 0.1058824, 0, 1, 1,
0.4819267, -0.554872, 0.1184447, 0.1098039, 0, 1, 1,
0.4833901, -0.6927822, 1.87115, 0.1176471, 0, 1, 1,
0.4897633, -0.2005913, 1.99406, 0.1215686, 0, 1, 1,
0.4923235, 1.849854, -0.5812182, 0.1294118, 0, 1, 1,
0.4932418, 0.1121866, 0.8931487, 0.1333333, 0, 1, 1,
0.4935385, 0.3002144, 2.345211, 0.1411765, 0, 1, 1,
0.4966682, 0.7769378, 1.967621, 0.145098, 0, 1, 1,
0.514908, -0.615216, 2.627885, 0.1529412, 0, 1, 1,
0.5200568, -0.7569814, 2.868201, 0.1568628, 0, 1, 1,
0.5237086, -0.1440443, 3.130172, 0.1647059, 0, 1, 1,
0.5277956, 0.5841902, 0.2245815, 0.1686275, 0, 1, 1,
0.5283579, -1.128801, 3.575362, 0.1764706, 0, 1, 1,
0.5298471, 0.1425651, 1.665808, 0.1803922, 0, 1, 1,
0.5374635, 3.089713, -0.405908, 0.1882353, 0, 1, 1,
0.540269, 0.956342, 0.610943, 0.1921569, 0, 1, 1,
0.5427091, -0.6079183, 2.075758, 0.2, 0, 1, 1,
0.546124, 0.03264462, 1.971827, 0.2078431, 0, 1, 1,
0.5461567, 1.096877, 0.5047673, 0.2117647, 0, 1, 1,
0.5530095, 0.6303819, 1.290382, 0.2196078, 0, 1, 1,
0.559902, 1.547845, -1.016874, 0.2235294, 0, 1, 1,
0.5619272, -1.875411, 2.992093, 0.2313726, 0, 1, 1,
0.5648121, 2.679103, 0.1723204, 0.2352941, 0, 1, 1,
0.5702217, 0.2621267, 3.503489, 0.2431373, 0, 1, 1,
0.5754451, -1.91573, 4.297451, 0.2470588, 0, 1, 1,
0.5754743, 2.041116, 1.317463, 0.254902, 0, 1, 1,
0.5765024, -1.009545, 2.975528, 0.2588235, 0, 1, 1,
0.5828949, -0.7471486, 1.481807, 0.2666667, 0, 1, 1,
0.5846758, -0.6995695, 3.072753, 0.2705882, 0, 1, 1,
0.5858314, 0.3734563, 2.297878, 0.2784314, 0, 1, 1,
0.5861566, 0.5873781, 1.362385, 0.282353, 0, 1, 1,
0.5888655, -1.238273, 2.364668, 0.2901961, 0, 1, 1,
0.5911275, -1.898271, 3.341413, 0.2941177, 0, 1, 1,
0.5934711, -1.363613, 2.048437, 0.3019608, 0, 1, 1,
0.5958176, 2.35022, -0.7510295, 0.3098039, 0, 1, 1,
0.59623, 1.583065, 2.458721, 0.3137255, 0, 1, 1,
0.6019756, -0.2181108, 2.550075, 0.3215686, 0, 1, 1,
0.6076338, 0.280066, -0.3941082, 0.3254902, 0, 1, 1,
0.6129686, 0.7738492, 0.9859635, 0.3333333, 0, 1, 1,
0.6180916, 0.4473393, -0.9244804, 0.3372549, 0, 1, 1,
0.6181254, -0.2162455, 1.033325, 0.345098, 0, 1, 1,
0.6221849, 0.2178139, 1.122006, 0.3490196, 0, 1, 1,
0.6296886, -0.05771662, 2.918262, 0.3568628, 0, 1, 1,
0.6328673, -0.2717369, 1.557073, 0.3607843, 0, 1, 1,
0.6337423, 0.2613201, 1.439939, 0.3686275, 0, 1, 1,
0.6346356, -0.6238117, 1.762076, 0.372549, 0, 1, 1,
0.6373937, 2.053783, -0.1999246, 0.3803922, 0, 1, 1,
0.644284, 0.3388781, 1.695771, 0.3843137, 0, 1, 1,
0.6456581, 0.9761578, 0.6074431, 0.3921569, 0, 1, 1,
0.6480186, 0.1178623, 1.412638, 0.3960784, 0, 1, 1,
0.6529128, 0.7218977, -0.6753544, 0.4039216, 0, 1, 1,
0.653362, 0.2579872, 2.546643, 0.4117647, 0, 1, 1,
0.6534745, 0.8387094, 0.4520759, 0.4156863, 0, 1, 1,
0.6547117, -1.052082, 2.636946, 0.4235294, 0, 1, 1,
0.6552885, -0.9324521, 2.159072, 0.427451, 0, 1, 1,
0.6590615, 1.205436, 0.5143282, 0.4352941, 0, 1, 1,
0.6601674, -0.6917613, 4.452909, 0.4392157, 0, 1, 1,
0.6616356, 0.4894378, 1.286515, 0.4470588, 0, 1, 1,
0.662306, -1.232235, 2.902055, 0.4509804, 0, 1, 1,
0.6652254, 0.8829356, 0.2473231, 0.4588235, 0, 1, 1,
0.6674139, 1.198921, 0.7966103, 0.4627451, 0, 1, 1,
0.6680179, -1.088707, 1.863344, 0.4705882, 0, 1, 1,
0.6714192, 1.387242, 2.371013, 0.4745098, 0, 1, 1,
0.6733374, -2.244213, 4.129348, 0.4823529, 0, 1, 1,
0.6814513, 0.4851327, 1.155025, 0.4862745, 0, 1, 1,
0.6834288, 0.02950105, 1.55151, 0.4941176, 0, 1, 1,
0.6863562, -0.9826376, 2.542357, 0.5019608, 0, 1, 1,
0.6868655, 0.3273109, 2.134578, 0.5058824, 0, 1, 1,
0.687396, -1.378545, 2.91021, 0.5137255, 0, 1, 1,
0.6874842, 1.083157, -0.9207575, 0.5176471, 0, 1, 1,
0.689038, -0.1673325, 1.355392, 0.5254902, 0, 1, 1,
0.6907756, -0.4823896, 0.5545126, 0.5294118, 0, 1, 1,
0.6916809, -0.9622993, 3.004379, 0.5372549, 0, 1, 1,
0.6918446, 0.8436522, 1.344808, 0.5411765, 0, 1, 1,
0.6937894, 1.731683, -0.5374562, 0.5490196, 0, 1, 1,
0.6980158, -0.4253624, 0.9096802, 0.5529412, 0, 1, 1,
0.7001218, 0.216059, 1.85089, 0.5607843, 0, 1, 1,
0.7010828, 0.1693718, 1.899568, 0.5647059, 0, 1, 1,
0.7030073, 0.3974731, 2.132404, 0.572549, 0, 1, 1,
0.708102, 0.8717426, 1.582108, 0.5764706, 0, 1, 1,
0.7121759, -0.4992405, 2.937127, 0.5843138, 0, 1, 1,
0.7122509, 1.64419, 2.463266, 0.5882353, 0, 1, 1,
0.7144157, 0.5515313, 1.349899, 0.5960785, 0, 1, 1,
0.7211322, -0.01954485, 2.165538, 0.6039216, 0, 1, 1,
0.7217308, -1.043496, 1.620304, 0.6078432, 0, 1, 1,
0.7261484, 0.2906169, 0.8891753, 0.6156863, 0, 1, 1,
0.7292058, 0.6397958, 1.218438, 0.6196079, 0, 1, 1,
0.734293, -1.85379, 2.398858, 0.627451, 0, 1, 1,
0.7357945, -0.8471843, 2.547796, 0.6313726, 0, 1, 1,
0.7393208, 2.23479, -0.659223, 0.6392157, 0, 1, 1,
0.7490081, 0.1479641, 0.4590654, 0.6431373, 0, 1, 1,
0.7501649, 0.04152832, 1.920042, 0.6509804, 0, 1, 1,
0.7523594, 1.834901, 0.5623516, 0.654902, 0, 1, 1,
0.7556496, 1.016939, 0.8239759, 0.6627451, 0, 1, 1,
0.7584391, 1.569453, -1.274015, 0.6666667, 0, 1, 1,
0.7586458, 0.1526839, 1.724009, 0.6745098, 0, 1, 1,
0.7601817, -0.7026568, 1.622991, 0.6784314, 0, 1, 1,
0.7675815, 0.4939968, 1.940675, 0.6862745, 0, 1, 1,
0.7698495, 0.3059776, 2.073496, 0.6901961, 0, 1, 1,
0.7716963, 2.309267, -0.04225237, 0.6980392, 0, 1, 1,
0.7818804, -1.029667, 0.5291426, 0.7058824, 0, 1, 1,
0.7880915, -1.319993, 3.081577, 0.7098039, 0, 1, 1,
0.7889441, 0.3430594, 2.092326, 0.7176471, 0, 1, 1,
0.7900366, -0.2160957, 1.481324, 0.7215686, 0, 1, 1,
0.7954843, 0.3173941, 2.153977, 0.7294118, 0, 1, 1,
0.7974322, 0.1511807, 0.4982321, 0.7333333, 0, 1, 1,
0.7979535, 0.829716, 1.528903, 0.7411765, 0, 1, 1,
0.8022395, -0.690745, 2.798921, 0.7450981, 0, 1, 1,
0.8047012, -1.150419, 1.598154, 0.7529412, 0, 1, 1,
0.8068905, -0.6689985, 0.4484174, 0.7568628, 0, 1, 1,
0.8122921, -0.5428923, 3.869681, 0.7647059, 0, 1, 1,
0.8167164, -2.042875, 2.057611, 0.7686275, 0, 1, 1,
0.8212897, 0.08366244, 3.201758, 0.7764706, 0, 1, 1,
0.8301737, -0.1957138, 2.005448, 0.7803922, 0, 1, 1,
0.8319842, 0.5825174, 1.426521, 0.7882353, 0, 1, 1,
0.8325077, 1.091943, -0.4452131, 0.7921569, 0, 1, 1,
0.8475972, -0.2495878, 2.898826, 0.8, 0, 1, 1,
0.8507262, 1.530034, 2.387278, 0.8078431, 0, 1, 1,
0.8532401, 0.6775388, 1.773937, 0.8117647, 0, 1, 1,
0.854512, -0.2221404, 2.667898, 0.8196079, 0, 1, 1,
0.8574415, -0.5185176, 3.136118, 0.8235294, 0, 1, 1,
0.8585342, 1.347233, 0.3002198, 0.8313726, 0, 1, 1,
0.8649335, 1.137677, 0.6296168, 0.8352941, 0, 1, 1,
0.8662912, 0.3893351, 0.6229235, 0.8431373, 0, 1, 1,
0.8690497, 0.2177088, 0.8347686, 0.8470588, 0, 1, 1,
0.8848746, -0.8800968, 2.477206, 0.854902, 0, 1, 1,
0.8865541, -0.8421054, 1.441617, 0.8588235, 0, 1, 1,
0.8872719, -0.2428264, -0.2471527, 0.8666667, 0, 1, 1,
0.8895707, -1.984294, 2.303859, 0.8705882, 0, 1, 1,
0.889788, -1.55239, 3.767963, 0.8784314, 0, 1, 1,
0.8924776, -0.7756493, 3.773777, 0.8823529, 0, 1, 1,
0.8978134, -0.2187546, 1.008556, 0.8901961, 0, 1, 1,
0.89796, -1.070095, 1.843454, 0.8941177, 0, 1, 1,
0.9036795, 0.7749848, 0.9013464, 0.9019608, 0, 1, 1,
0.9174488, 1.022408, 1.23385, 0.9098039, 0, 1, 1,
0.9212897, 1.274378, 1.323686, 0.9137255, 0, 1, 1,
0.9281177, 0.5966421, 1.406249, 0.9215686, 0, 1, 1,
0.9312056, -0.04598144, 2.642683, 0.9254902, 0, 1, 1,
0.9338556, -0.3984722, 3.803115, 0.9333333, 0, 1, 1,
0.9358597, -0.6985387, 1.693534, 0.9372549, 0, 1, 1,
0.9421345, -0.2505737, 3.288662, 0.945098, 0, 1, 1,
0.9433528, -0.1045576, 0.3081775, 0.9490196, 0, 1, 1,
0.9441056, 0.8953847, 0.6067919, 0.9568627, 0, 1, 1,
0.9444081, -0.3887754, 2.339595, 0.9607843, 0, 1, 1,
0.9452119, 0.1605439, 1.390076, 0.9686275, 0, 1, 1,
0.9457742, -2.198107, 2.865132, 0.972549, 0, 1, 1,
0.9477811, 1.528467, 1.095383, 0.9803922, 0, 1, 1,
0.9494563, 0.6639134, 0.3612383, 0.9843137, 0, 1, 1,
0.9530711, 1.090083, 1.628042, 0.9921569, 0, 1, 1,
0.953274, -0.07080483, 1.719615, 0.9960784, 0, 1, 1,
0.9571418, 1.454778, -0.7182721, 1, 0, 0.9960784, 1,
0.9633581, 0.3250383, -1.793219, 1, 0, 0.9882353, 1,
0.9663291, 1.540633, -0.4059104, 1, 0, 0.9843137, 1,
0.9671956, 1.629212, -0.6262832, 1, 0, 0.9764706, 1,
0.9681385, -0.124703, 0.7780976, 1, 0, 0.972549, 1,
0.9710969, -0.7803957, 2.906132, 1, 0, 0.9647059, 1,
0.9720808, -0.7654206, 1.012658, 1, 0, 0.9607843, 1,
0.9741108, -0.4109542, 2.054264, 1, 0, 0.9529412, 1,
0.9780311, 0.7380381, 2.379405, 1, 0, 0.9490196, 1,
0.9807705, -1.481969, 3.526538, 1, 0, 0.9411765, 1,
0.9825842, 0.3028181, 2.465257, 1, 0, 0.9372549, 1,
0.9936174, 0.6158258, 0.3179102, 1, 0, 0.9294118, 1,
1.005111, -0.1527639, 1.778535, 1, 0, 0.9254902, 1,
1.01009, -0.09036046, 1.437745, 1, 0, 0.9176471, 1,
1.011995, -0.2744563, 1.182363, 1, 0, 0.9137255, 1,
1.014068, -0.9840739, 2.359004, 1, 0, 0.9058824, 1,
1.021481, 2.298019, -0.4903671, 1, 0, 0.9019608, 1,
1.021761, 1.116289, 1.121035, 1, 0, 0.8941177, 1,
1.030292, -0.8085741, 1.446711, 1, 0, 0.8862745, 1,
1.032595, 1.040731, 0.5495783, 1, 0, 0.8823529, 1,
1.041588, -0.1709851, 2.286856, 1, 0, 0.8745098, 1,
1.043727, -1.385522, 1.864537, 1, 0, 0.8705882, 1,
1.046089, 1.469641, -0.6824586, 1, 0, 0.8627451, 1,
1.063849, -0.7308378, 0.9544885, 1, 0, 0.8588235, 1,
1.068271, -0.9931475, 2.380082, 1, 0, 0.8509804, 1,
1.070614, 0.2461774, 0.6727937, 1, 0, 0.8470588, 1,
1.072011, 1.067412, -0.4160111, 1, 0, 0.8392157, 1,
1.083872, 1.056262, 0.7628867, 1, 0, 0.8352941, 1,
1.085515, 1.125141, 0.8829544, 1, 0, 0.827451, 1,
1.096688, -0.1626301, 1.60643, 1, 0, 0.8235294, 1,
1.103711, -1.607024, 2.220006, 1, 0, 0.8156863, 1,
1.114783, 0.7148786, 0.6705001, 1, 0, 0.8117647, 1,
1.121485, -0.2467437, 0.3641457, 1, 0, 0.8039216, 1,
1.123317, 0.4402272, -0.2168675, 1, 0, 0.7960784, 1,
1.125436, 0.6096002, 0.7558757, 1, 0, 0.7921569, 1,
1.127497, -0.4712965, 2.61069, 1, 0, 0.7843137, 1,
1.127777, 0.6057882, 0.2326427, 1, 0, 0.7803922, 1,
1.128696, 0.6907741, 1.174407, 1, 0, 0.772549, 1,
1.14312, 1.825235, -1.977747, 1, 0, 0.7686275, 1,
1.144198, -0.3331389, 2.626972, 1, 0, 0.7607843, 1,
1.14791, 0.3022285, 0.5685462, 1, 0, 0.7568628, 1,
1.158224, 1.181878, 3.121876, 1, 0, 0.7490196, 1,
1.162496, 0.4700477, 0.1286739, 1, 0, 0.7450981, 1,
1.172462, -1.273219, 2.887883, 1, 0, 0.7372549, 1,
1.177086, 0.5754682, 0.8268951, 1, 0, 0.7333333, 1,
1.179193, -0.6969184, 2.853686, 1, 0, 0.7254902, 1,
1.180277, -0.3667524, 1.244914, 1, 0, 0.7215686, 1,
1.192134, 0.1702327, 1.575713, 1, 0, 0.7137255, 1,
1.195142, -0.2185597, 2.25294, 1, 0, 0.7098039, 1,
1.197376, -0.007920216, 3.399925, 1, 0, 0.7019608, 1,
1.200545, 0.4484045, 3.873687, 1, 0, 0.6941177, 1,
1.202599, -2.161059, 2.05462, 1, 0, 0.6901961, 1,
1.213295, 2.118888, 2.171044, 1, 0, 0.682353, 1,
1.2144, -1.169928, 2.0804, 1, 0, 0.6784314, 1,
1.221059, -0.7514976, 2.260607, 1, 0, 0.6705883, 1,
1.24332, -0.2215568, 3.4221, 1, 0, 0.6666667, 1,
1.244108, 0.1866305, 0.7558916, 1, 0, 0.6588235, 1,
1.245057, 1.242516, 1.918711, 1, 0, 0.654902, 1,
1.248805, 0.6209055, 3.334538, 1, 0, 0.6470588, 1,
1.258078, 1.293273, 0.9628903, 1, 0, 0.6431373, 1,
1.269302, 1.062128, 1.460856, 1, 0, 0.6352941, 1,
1.273741, 2.659139, 0.02470089, 1, 0, 0.6313726, 1,
1.274123, -0.6073358, 4.009631, 1, 0, 0.6235294, 1,
1.276446, -1.47089, 3.598331, 1, 0, 0.6196079, 1,
1.277246, 0.9555085, 1.477539, 1, 0, 0.6117647, 1,
1.284006, 1.426327, -0.06441128, 1, 0, 0.6078432, 1,
1.284597, 0.2200768, 1.320442, 1, 0, 0.6, 1,
1.285734, 0.7950386, 2.140618, 1, 0, 0.5921569, 1,
1.291884, 0.9593339, 0.9172627, 1, 0, 0.5882353, 1,
1.299557, 0.928487, 1.264452, 1, 0, 0.5803922, 1,
1.315846, 0.6915668, -1.597534, 1, 0, 0.5764706, 1,
1.321434, 0.7208112, 2.913685, 1, 0, 0.5686275, 1,
1.326085, -0.5345629, 1.556735, 1, 0, 0.5647059, 1,
1.334526, 0.05892409, 1.391156, 1, 0, 0.5568628, 1,
1.342914, -0.2990819, 0.1100184, 1, 0, 0.5529412, 1,
1.347901, 0.3405291, 1.091727, 1, 0, 0.5450981, 1,
1.357624, 0.5245112, 0.764234, 1, 0, 0.5411765, 1,
1.365169, -0.8139321, -0.005628505, 1, 0, 0.5333334, 1,
1.380958, 1.1722, 1.322646, 1, 0, 0.5294118, 1,
1.381874, 0.1767028, -0.694846, 1, 0, 0.5215687, 1,
1.3838, 0.4076697, -0.8492697, 1, 0, 0.5176471, 1,
1.387201, -0.08801965, 1.735183, 1, 0, 0.509804, 1,
1.41499, -2.096137, 3.139752, 1, 0, 0.5058824, 1,
1.417579, 0.3178929, 0.1246038, 1, 0, 0.4980392, 1,
1.422713, -0.1619525, 3.196674, 1, 0, 0.4901961, 1,
1.432297, -0.3157807, 4.039897, 1, 0, 0.4862745, 1,
1.437145, 0.5698127, 0.7839525, 1, 0, 0.4784314, 1,
1.439253, 0.3221909, 2.80424, 1, 0, 0.4745098, 1,
1.444763, 0.8929473, 0.6270608, 1, 0, 0.4666667, 1,
1.447407, -0.2188763, 1.987872, 1, 0, 0.4627451, 1,
1.45306, -0.5136061, 3.7861, 1, 0, 0.454902, 1,
1.46337, 1.674561, 0.9385151, 1, 0, 0.4509804, 1,
1.466967, -0.9785509, 3.515851, 1, 0, 0.4431373, 1,
1.472993, -0.5673609, 1.466208, 1, 0, 0.4392157, 1,
1.473237, -0.5908068, 2.429178, 1, 0, 0.4313726, 1,
1.491585, -0.3101735, 1.372238, 1, 0, 0.427451, 1,
1.501945, -0.142042, 1.054311, 1, 0, 0.4196078, 1,
1.503907, 0.4581284, 0.3441134, 1, 0, 0.4156863, 1,
1.508453, -0.1298157, 3.513856, 1, 0, 0.4078431, 1,
1.521846, -1.843395, 3.347416, 1, 0, 0.4039216, 1,
1.528081, -0.1251788, -0.5218884, 1, 0, 0.3960784, 1,
1.528141, 1.000765, 1.139249, 1, 0, 0.3882353, 1,
1.535595, 0.2567745, 2.045431, 1, 0, 0.3843137, 1,
1.537346, 1.413177, 0.9914233, 1, 0, 0.3764706, 1,
1.540454, 0.01105318, 0.6170053, 1, 0, 0.372549, 1,
1.543782, 0.8166605, 0.9876807, 1, 0, 0.3647059, 1,
1.557885, -1.020187, 3.451011, 1, 0, 0.3607843, 1,
1.559797, -0.7507331, 0.7137045, 1, 0, 0.3529412, 1,
1.571016, -0.9253923, 2.902264, 1, 0, 0.3490196, 1,
1.58712, -2.602365, 2.295198, 1, 0, 0.3411765, 1,
1.593817, 1.323295, 1.500957, 1, 0, 0.3372549, 1,
1.617171, 0.9428703, 0.6825458, 1, 0, 0.3294118, 1,
1.625333, 0.9053918, 2.308965, 1, 0, 0.3254902, 1,
1.643321, 0.6194412, 1.775464, 1, 0, 0.3176471, 1,
1.643394, 1.393297, 1.115504, 1, 0, 0.3137255, 1,
1.661713, -1.34955, 2.015685, 1, 0, 0.3058824, 1,
1.666181, -0.655534, 3.280368, 1, 0, 0.2980392, 1,
1.670137, -1.037852, 1.893456, 1, 0, 0.2941177, 1,
1.696409, 0.02030997, 0.3486162, 1, 0, 0.2862745, 1,
1.707315, -2.006041, 3.38702, 1, 0, 0.282353, 1,
1.707521, -0.6406206, 1.079235, 1, 0, 0.2745098, 1,
1.709437, -0.8197695, 2.602763, 1, 0, 0.2705882, 1,
1.720252, -0.8899795, 1.568209, 1, 0, 0.2627451, 1,
1.720504, 1.031153, 1.095201, 1, 0, 0.2588235, 1,
1.731589, 1.502538, 0.8274681, 1, 0, 0.2509804, 1,
1.742471, 1.063087, 0.1735142, 1, 0, 0.2470588, 1,
1.755919, -0.3095842, 1.292529, 1, 0, 0.2392157, 1,
1.776532, -1.064432, 2.457472, 1, 0, 0.2352941, 1,
1.790332, -0.7894247, 2.55303, 1, 0, 0.227451, 1,
1.793523, -0.8346421, 0.7090513, 1, 0, 0.2235294, 1,
1.798534, -0.6461961, 1.626028, 1, 0, 0.2156863, 1,
1.830422, 1.013457, 1.373593, 1, 0, 0.2117647, 1,
1.833791, -1.34308, 1.890075, 1, 0, 0.2039216, 1,
1.838603, 0.1408692, -0.2224174, 1, 0, 0.1960784, 1,
1.842265, 0.2063721, 2.022508, 1, 0, 0.1921569, 1,
1.853059, -0.5979779, 4.693782, 1, 0, 0.1843137, 1,
1.858743, -0.5747703, 2.054925, 1, 0, 0.1803922, 1,
1.880551, -0.384147, 1.714912, 1, 0, 0.172549, 1,
1.888475, -0.8123616, 1.059912, 1, 0, 0.1686275, 1,
1.891431, -2.167264, 1.647704, 1, 0, 0.1607843, 1,
1.922052, 1.077873, -0.4693337, 1, 0, 0.1568628, 1,
1.936989, 0.6211873, 2.620491, 1, 0, 0.1490196, 1,
1.948772, 1.63347, 2.262747, 1, 0, 0.145098, 1,
1.955686, -0.6816131, 2.595876, 1, 0, 0.1372549, 1,
2.011224, 1.512512, 1.077353, 1, 0, 0.1333333, 1,
2.03093, 0.3000513, 1.609844, 1, 0, 0.1254902, 1,
2.032798, 0.5605552, 0.3389315, 1, 0, 0.1215686, 1,
2.035548, 0.4001147, 1.017553, 1, 0, 0.1137255, 1,
2.052766, 0.2373525, 0.5007439, 1, 0, 0.1098039, 1,
2.077697, -1.534345, 2.232887, 1, 0, 0.1019608, 1,
2.106516, -0.8514693, 0.2784835, 1, 0, 0.09411765, 1,
2.116106, -0.2289159, 2.499383, 1, 0, 0.09019608, 1,
2.146622, -0.4686508, -0.09549652, 1, 0, 0.08235294, 1,
2.16142, 1.851132, -0.578093, 1, 0, 0.07843138, 1,
2.210224, -0.3452767, 0.1740362, 1, 0, 0.07058824, 1,
2.234006, 0.7367357, 3.755997, 1, 0, 0.06666667, 1,
2.277124, 1.298158, 0.8762021, 1, 0, 0.05882353, 1,
2.292159, -0.7912098, 2.126675, 1, 0, 0.05490196, 1,
2.342604, -0.8535731, 2.675516, 1, 0, 0.04705882, 1,
2.621952, 0.2919833, 0.3454537, 1, 0, 0.04313726, 1,
2.624992, 0.5258966, 0.6852987, 1, 0, 0.03529412, 1,
2.664293, 0.3852502, 0.05782403, 1, 0, 0.03137255, 1,
2.711583, -0.4999215, 1.877595, 1, 0, 0.02352941, 1,
2.769576, 0.256877, 1.799959, 1, 0, 0.01960784, 1,
3.009582, 0.8703406, -0.5442317, 1, 0, 0.01176471, 1,
3.032387, 0.9141863, 1.236683, 1, 0, 0.007843138, 1
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
-0.3009348, -4.868379, -7.198346, 0, -0.5, 0.5, 0.5,
-0.3009348, -4.868379, -7.198346, 1, -0.5, 0.5, 0.5,
-0.3009348, -4.868379, -7.198346, 1, 1.5, 0.5, 0.5,
-0.3009348, -4.868379, -7.198346, 0, 1.5, 0.5, 0.5
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
-4.764253, -0.1089065, -7.198346, 0, -0.5, 0.5, 0.5,
-4.764253, -0.1089065, -7.198346, 1, -0.5, 0.5, 0.5,
-4.764253, -0.1089065, -7.198346, 1, 1.5, 0.5, 0.5,
-4.764253, -0.1089065, -7.198346, 0, 1.5, 0.5, 0.5
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
-4.764253, -4.868379, -0.0329926, 0, -0.5, 0.5, 0.5,
-4.764253, -4.868379, -0.0329926, 1, -0.5, 0.5, 0.5,
-4.764253, -4.868379, -0.0329926, 1, 1.5, 0.5, 0.5,
-4.764253, -4.868379, -0.0329926, 0, 1.5, 0.5, 0.5
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
-3, -3.770039, -5.544803,
3, -3.770039, -5.544803,
-3, -3.770039, -5.544803,
-3, -3.953096, -5.820394,
-2, -3.770039, -5.544803,
-2, -3.953096, -5.820394,
-1, -3.770039, -5.544803,
-1, -3.953096, -5.820394,
0, -3.770039, -5.544803,
0, -3.953096, -5.820394,
1, -3.770039, -5.544803,
1, -3.953096, -5.820394,
2, -3.770039, -5.544803,
2, -3.953096, -5.820394,
3, -3.770039, -5.544803,
3, -3.953096, -5.820394
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
-3, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
-3, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
-3, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
-3, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5,
-2, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
-2, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
-2, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
-2, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5,
-1, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
-1, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
-1, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
-1, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5,
0, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
0, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
0, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
0, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5,
1, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
1, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
1, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
1, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5,
2, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
2, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
2, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
2, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5,
3, -4.31921, -6.371575, 0, -0.5, 0.5, 0.5,
3, -4.31921, -6.371575, 1, -0.5, 0.5, 0.5,
3, -4.31921, -6.371575, 1, 1.5, 0.5, 0.5,
3, -4.31921, -6.371575, 0, 1.5, 0.5, 0.5
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
-3.734256, -2, -5.544803,
-3.734256, 2, -5.544803,
-3.734256, -2, -5.544803,
-3.905922, -2, -5.820394,
-3.734256, 0, -5.544803,
-3.905922, 0, -5.820394,
-3.734256, 2, -5.544803,
-3.905922, 2, -5.820394
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
-4.249255, -2, -6.371575, 0, -0.5, 0.5, 0.5,
-4.249255, -2, -6.371575, 1, -0.5, 0.5, 0.5,
-4.249255, -2, -6.371575, 1, 1.5, 0.5, 0.5,
-4.249255, -2, -6.371575, 0, 1.5, 0.5, 0.5,
-4.249255, 0, -6.371575, 0, -0.5, 0.5, 0.5,
-4.249255, 0, -6.371575, 1, -0.5, 0.5, 0.5,
-4.249255, 0, -6.371575, 1, 1.5, 0.5, 0.5,
-4.249255, 0, -6.371575, 0, 1.5, 0.5, 0.5,
-4.249255, 2, -6.371575, 0, -0.5, 0.5, 0.5,
-4.249255, 2, -6.371575, 1, -0.5, 0.5, 0.5,
-4.249255, 2, -6.371575, 1, 1.5, 0.5, 0.5,
-4.249255, 2, -6.371575, 0, 1.5, 0.5, 0.5
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
-3.734256, -3.770039, -4,
-3.734256, -3.770039, 4,
-3.734256, -3.770039, -4,
-3.905922, -3.953096, -4,
-3.734256, -3.770039, -2,
-3.905922, -3.953096, -2,
-3.734256, -3.770039, 0,
-3.905922, -3.953096, 0,
-3.734256, -3.770039, 2,
-3.905922, -3.953096, 2,
-3.734256, -3.770039, 4,
-3.905922, -3.953096, 4
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
-4.249255, -4.31921, -4, 0, -0.5, 0.5, 0.5,
-4.249255, -4.31921, -4, 1, -0.5, 0.5, 0.5,
-4.249255, -4.31921, -4, 1, 1.5, 0.5, 0.5,
-4.249255, -4.31921, -4, 0, 1.5, 0.5, 0.5,
-4.249255, -4.31921, -2, 0, -0.5, 0.5, 0.5,
-4.249255, -4.31921, -2, 1, -0.5, 0.5, 0.5,
-4.249255, -4.31921, -2, 1, 1.5, 0.5, 0.5,
-4.249255, -4.31921, -2, 0, 1.5, 0.5, 0.5,
-4.249255, -4.31921, 0, 0, -0.5, 0.5, 0.5,
-4.249255, -4.31921, 0, 1, -0.5, 0.5, 0.5,
-4.249255, -4.31921, 0, 1, 1.5, 0.5, 0.5,
-4.249255, -4.31921, 0, 0, 1.5, 0.5, 0.5,
-4.249255, -4.31921, 2, 0, -0.5, 0.5, 0.5,
-4.249255, -4.31921, 2, 1, -0.5, 0.5, 0.5,
-4.249255, -4.31921, 2, 1, 1.5, 0.5, 0.5,
-4.249255, -4.31921, 2, 0, 1.5, 0.5, 0.5,
-4.249255, -4.31921, 4, 0, -0.5, 0.5, 0.5,
-4.249255, -4.31921, 4, 1, -0.5, 0.5, 0.5,
-4.249255, -4.31921, 4, 1, 1.5, 0.5, 0.5,
-4.249255, -4.31921, 4, 0, 1.5, 0.5, 0.5
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
-3.734256, -3.770039, -5.544803,
-3.734256, 3.552226, -5.544803,
-3.734256, -3.770039, 5.478818,
-3.734256, 3.552226, 5.478818,
-3.734256, -3.770039, -5.544803,
-3.734256, -3.770039, 5.478818,
-3.734256, 3.552226, -5.544803,
-3.734256, 3.552226, 5.478818,
-3.734256, -3.770039, -5.544803,
3.132387, -3.770039, -5.544803,
-3.734256, -3.770039, 5.478818,
3.132387, -3.770039, 5.478818,
-3.734256, 3.552226, -5.544803,
3.132387, 3.552226, -5.544803,
-3.734256, 3.552226, 5.478818,
3.132387, 3.552226, 5.478818,
3.132387, -3.770039, -5.544803,
3.132387, 3.552226, -5.544803,
3.132387, -3.770039, 5.478818,
3.132387, 3.552226, 5.478818,
3.132387, -3.770039, -5.544803,
3.132387, -3.770039, 5.478818,
3.132387, 3.552226, -5.544803,
3.132387, 3.552226, 5.478818
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
var radius = 7.961265;
var distance = 35.42057;
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
mvMatrix.translate( 0.3009348, 0.1089065, 0.0329926 );
mvMatrix.scale( 1.253579, 1.175575, 0.7808574 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42057);
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
metosulam<-read.table("metosulam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metosulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'metosulam' not found
```

```r
y<-metosulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'metosulam' not found
```

```r
z<-metosulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'metosulam' not found
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
-3.634257, -0.1244262, -2.63991, 0, 0, 1, 1, 1,
-3.364236, 0.8474266, 0.4602795, 1, 0, 0, 1, 1,
-2.874106, 0.4193406, -2.603796, 1, 0, 0, 1, 1,
-2.868464, 1.223275, -0.3341507, 1, 0, 0, 1, 1,
-2.863252, 0.4687437, -0.6651497, 1, 0, 0, 1, 1,
-2.814165, 0.2040972, -1.818546, 1, 0, 0, 1, 1,
-2.728828, 1.811721, 0.3214661, 0, 0, 0, 1, 1,
-2.712382, 0.7999116, -1.314623, 0, 0, 0, 1, 1,
-2.598906, 0.6552648, -0.9430383, 0, 0, 0, 1, 1,
-2.554489, -1.529157, -2.436435, 0, 0, 0, 1, 1,
-2.302505, 1.945194, -0.2178556, 0, 0, 0, 1, 1,
-2.287203, -1.458362, -2.982174, 0, 0, 0, 1, 1,
-2.128834, 0.1201203, -2.779832, 0, 0, 0, 1, 1,
-2.078357, -0.6565767, -0.6826468, 1, 1, 1, 1, 1,
-2.024987, 0.4216846, -0.7959793, 1, 1, 1, 1, 1,
-2.000589, -1.370256, -2.370641, 1, 1, 1, 1, 1,
-1.992099, 1.221456, -1.594673, 1, 1, 1, 1, 1,
-1.972904, 0.7721756, -1.674066, 1, 1, 1, 1, 1,
-1.943997, 0.02436099, -1.421984, 1, 1, 1, 1, 1,
-1.934114, 0.2675046, -0.1371548, 1, 1, 1, 1, 1,
-1.928627, -0.2951309, -2.564934, 1, 1, 1, 1, 1,
-1.922134, 0.1088262, -1.309233, 1, 1, 1, 1, 1,
-1.865436, -0.2484122, -2.395854, 1, 1, 1, 1, 1,
-1.856483, 0.2192866, -0.8902439, 1, 1, 1, 1, 1,
-1.842711, 1.73281, -0.7702327, 1, 1, 1, 1, 1,
-1.818402, 0.2586733, -0.6562725, 1, 1, 1, 1, 1,
-1.815517, 0.0384386, 0.1940791, 1, 1, 1, 1, 1,
-1.799358, -1.041558, -1.3332, 1, 1, 1, 1, 1,
-1.795139, -0.6180596, -2.291001, 0, 0, 1, 1, 1,
-1.780976, 0.8072517, -0.4575026, 1, 0, 0, 1, 1,
-1.774909, 1.583018, -1.880561, 1, 0, 0, 1, 1,
-1.769816, 0.477745, -0.9384995, 1, 0, 0, 1, 1,
-1.747971, -0.04388119, -2.380356, 1, 0, 0, 1, 1,
-1.740844, -0.6709582, -2.34139, 1, 0, 0, 1, 1,
-1.731961, -1.69837, -1.764796, 0, 0, 0, 1, 1,
-1.715757, -0.5302431, -0.8046044, 0, 0, 0, 1, 1,
-1.704018, -0.09878603, -0.9109054, 0, 0, 0, 1, 1,
-1.686353, -0.6157471, -1.096225, 0, 0, 0, 1, 1,
-1.670141, -0.09712763, -1.60573, 0, 0, 0, 1, 1,
-1.660877, -0.8044795, -2.719581, 0, 0, 0, 1, 1,
-1.658481, 0.7049377, -1.582376, 0, 0, 0, 1, 1,
-1.656325, 0.2301672, -2.121046, 1, 1, 1, 1, 1,
-1.652475, -1.35838, -1.473297, 1, 1, 1, 1, 1,
-1.650655, -0.4786883, -0.8096417, 1, 1, 1, 1, 1,
-1.647048, 1.013299, -2.218574, 1, 1, 1, 1, 1,
-1.635963, 1.055413, 0.3603821, 1, 1, 1, 1, 1,
-1.610118, -0.01945196, -0.9149871, 1, 1, 1, 1, 1,
-1.600512, 0.4408711, -0.09595948, 1, 1, 1, 1, 1,
-1.599544, -0.8444519, -0.5523648, 1, 1, 1, 1, 1,
-1.596434, 0.6507697, -1.053037, 1, 1, 1, 1, 1,
-1.580434, 0.7688057, -0.2239964, 1, 1, 1, 1, 1,
-1.554066, -0.3007334, -1.704648, 1, 1, 1, 1, 1,
-1.547757, 0.3267433, -2.461792, 1, 1, 1, 1, 1,
-1.546932, -0.2591229, -1.006171, 1, 1, 1, 1, 1,
-1.530354, 0.6653138, -2.870294, 1, 1, 1, 1, 1,
-1.517215, 0.5017222, -1.55723, 1, 1, 1, 1, 1,
-1.509725, 2.244704, -0.9329609, 0, 0, 1, 1, 1,
-1.497532, -1.157909, -2.167784, 1, 0, 0, 1, 1,
-1.496611, 0.1011687, -0.6647266, 1, 0, 0, 1, 1,
-1.480136, 0.809225, 0.8415791, 1, 0, 0, 1, 1,
-1.47449, -1.30064, -1.588266, 1, 0, 0, 1, 1,
-1.470407, -1.653646, -1.103665, 1, 0, 0, 1, 1,
-1.465796, 0.07796324, -0.5081536, 0, 0, 0, 1, 1,
-1.464796, 0.2533885, -1.212081, 0, 0, 0, 1, 1,
-1.464024, 0.2192617, -0.4686784, 0, 0, 0, 1, 1,
-1.450742, -0.4747814, -2.937481, 0, 0, 0, 1, 1,
-1.445993, -1.546462, -2.957448, 0, 0, 0, 1, 1,
-1.443839, -0.6441809, -3.005954, 0, 0, 0, 1, 1,
-1.442563, 0.06972619, -2.497993, 0, 0, 0, 1, 1,
-1.422358, -0.7091126, -1.227152, 1, 1, 1, 1, 1,
-1.4135, 0.9488773, -1.750893, 1, 1, 1, 1, 1,
-1.41324, 0.09463935, -0.01610754, 1, 1, 1, 1, 1,
-1.400619, -0.5943072, -1.184929, 1, 1, 1, 1, 1,
-1.400349, 1.025835, -0.415926, 1, 1, 1, 1, 1,
-1.394672, 0.8709365, -0.07485684, 1, 1, 1, 1, 1,
-1.392262, -1.058159, -1.613021, 1, 1, 1, 1, 1,
-1.381184, 0.7919854, -0.1321179, 1, 1, 1, 1, 1,
-1.367141, 0.3145982, -0.2285614, 1, 1, 1, 1, 1,
-1.364891, 0.7111722, -0.5439907, 1, 1, 1, 1, 1,
-1.350418, -0.3272201, -0.7832083, 1, 1, 1, 1, 1,
-1.345863, 0.6208901, -2.085825, 1, 1, 1, 1, 1,
-1.339932, 1.066011, 0.4378227, 1, 1, 1, 1, 1,
-1.336352, -0.05661571, -3.497389, 1, 1, 1, 1, 1,
-1.327789, 1.180799, -0.3546397, 1, 1, 1, 1, 1,
-1.327279, -0.9347132, -3.60105, 0, 0, 1, 1, 1,
-1.321457, 0.2048148, -1.826578, 1, 0, 0, 1, 1,
-1.318306, -0.8860045, -2.506305, 1, 0, 0, 1, 1,
-1.314336, -1.405278, -2.184131, 1, 0, 0, 1, 1,
-1.312452, 0.6388497, -0.06150582, 1, 0, 0, 1, 1,
-1.30501, -1.129438, -2.363035, 1, 0, 0, 1, 1,
-1.303412, 1.861708, -1.519736, 0, 0, 0, 1, 1,
-1.295728, -1.53115, -3.557267, 0, 0, 0, 1, 1,
-1.293839, 0.4258057, -0.4267408, 0, 0, 0, 1, 1,
-1.290051, 1.65886, -1.026681, 0, 0, 0, 1, 1,
-1.27184, 0.9913791, -0.5273879, 0, 0, 0, 1, 1,
-1.269765, -0.278746, -0.1875914, 0, 0, 0, 1, 1,
-1.253943, -1.129604, -3.016565, 0, 0, 0, 1, 1,
-1.245894, 1.550245, -1.068609, 1, 1, 1, 1, 1,
-1.241903, 0.05782794, -1.937873, 1, 1, 1, 1, 1,
-1.23976, -0.3303361, -1.302748, 1, 1, 1, 1, 1,
-1.229894, -1.137192, -1.08569, 1, 1, 1, 1, 1,
-1.229648, -1.047943, -3.062971, 1, 1, 1, 1, 1,
-1.222057, -0.1877431, -2.403459, 1, 1, 1, 1, 1,
-1.218288, 1.140655, -0.8209559, 1, 1, 1, 1, 1,
-1.210831, 0.0971357, -3.085537, 1, 1, 1, 1, 1,
-1.207711, 0.7206789, -0.5991252, 1, 1, 1, 1, 1,
-1.200525, 1.528256, 0.03695487, 1, 1, 1, 1, 1,
-1.197578, -0.6125482, -0.3385379, 1, 1, 1, 1, 1,
-1.194296, 3.445591, -1.95144, 1, 1, 1, 1, 1,
-1.192382, -1.165303, -3.981286, 1, 1, 1, 1, 1,
-1.192177, -0.5810635, -1.342166, 1, 1, 1, 1, 1,
-1.190719, -0.7187819, -2.097815, 1, 1, 1, 1, 1,
-1.187957, -0.8201665, -2.169501, 0, 0, 1, 1, 1,
-1.181895, 1.082444, 0.05257664, 1, 0, 0, 1, 1,
-1.180541, 0.1787791, -0.6663304, 1, 0, 0, 1, 1,
-1.176516, 0.1220411, -1.674335, 1, 0, 0, 1, 1,
-1.175874, -0.8299734, -2.858575, 1, 0, 0, 1, 1,
-1.171642, -0.0253618, -1.81166, 1, 0, 0, 1, 1,
-1.167499, -0.9709048, -1.007649, 0, 0, 0, 1, 1,
-1.162147, 1.734585, -2.214306, 0, 0, 0, 1, 1,
-1.159838, 0.2899617, -0.4178515, 0, 0, 0, 1, 1,
-1.157593, -1.388504, -1.330124, 0, 0, 0, 1, 1,
-1.123296, 0.3279321, -0.8447987, 0, 0, 0, 1, 1,
-1.122399, 0.2600363, -1.914235, 0, 0, 0, 1, 1,
-1.122337, -1.071533, -1.881626, 0, 0, 0, 1, 1,
-1.117994, 0.2604642, -1.775157, 1, 1, 1, 1, 1,
-1.117599, -0.263149, -1.036371, 1, 1, 1, 1, 1,
-1.117066, 0.1353877, -1.201162, 1, 1, 1, 1, 1,
-1.115307, 0.3024588, -0.07023699, 1, 1, 1, 1, 1,
-1.114324, 0.9783741, 1.021278, 1, 1, 1, 1, 1,
-1.107335, 0.7155501, -1.365836, 1, 1, 1, 1, 1,
-1.092619, -0.4322847, -0.5541377, 1, 1, 1, 1, 1,
-1.092286, -2.337897, -2.416375, 1, 1, 1, 1, 1,
-1.087642, 0.2984211, -1.099903, 1, 1, 1, 1, 1,
-1.084988, -0.01670539, -0.1684512, 1, 1, 1, 1, 1,
-1.082546, 0.1923737, -0.5230393, 1, 1, 1, 1, 1,
-1.07966, 1.015713, -1.401264, 1, 1, 1, 1, 1,
-1.076748, -0.6385411, -1.196549, 1, 1, 1, 1, 1,
-1.07049, -0.05962544, -1.138364, 1, 1, 1, 1, 1,
-1.068416, -1.580301, -2.862008, 1, 1, 1, 1, 1,
-1.06682, 2.681504, -1.572402, 0, 0, 1, 1, 1,
-1.062769, 1.173963, -0.969906, 1, 0, 0, 1, 1,
-1.058132, -0.3809606, -2.087384, 1, 0, 0, 1, 1,
-1.055825, -0.8937322, -2.989485, 1, 0, 0, 1, 1,
-1.047782, -0.6324384, -1.046097, 1, 0, 0, 1, 1,
-1.047542, -1.56369, -2.117428, 1, 0, 0, 1, 1,
-1.031033, 0.7834868, -0.2657795, 0, 0, 0, 1, 1,
-1.027961, 1.768644, -1.071446, 0, 0, 0, 1, 1,
-1.024344, 2.749818, 0.08058632, 0, 0, 0, 1, 1,
-1.021279, 0.5953578, -0.1876317, 0, 0, 0, 1, 1,
-1.019503, 0.7042727, 0.2757335, 0, 0, 0, 1, 1,
-1.012361, 1.232102, 0.3731484, 0, 0, 0, 1, 1,
-1.00631, -1.094087, -2.278624, 0, 0, 0, 1, 1,
-1.004542, -1.413346, -2.092741, 1, 1, 1, 1, 1,
-0.994827, -0.2634333, -0.8260931, 1, 1, 1, 1, 1,
-0.9939398, 0.2449779, -2.021629, 1, 1, 1, 1, 1,
-0.9912, 0.9364592, -2.143915, 1, 1, 1, 1, 1,
-0.9802036, -2.574597, -0.531578, 1, 1, 1, 1, 1,
-0.9678972, 1.154859, -0.2534606, 1, 1, 1, 1, 1,
-0.9558169, -0.4652675, -3.497276, 1, 1, 1, 1, 1,
-0.9546584, -2.518833, -1.231755, 1, 1, 1, 1, 1,
-0.9528466, 0.6201406, -0.9325659, 1, 1, 1, 1, 1,
-0.95225, 0.001551016, -1.330866, 1, 1, 1, 1, 1,
-0.9504077, -0.05774926, -2.714387, 1, 1, 1, 1, 1,
-0.9380416, 1.902663, 0.3546235, 1, 1, 1, 1, 1,
-0.9335414, -1.815301, -1.621624, 1, 1, 1, 1, 1,
-0.9320383, -0.7814876, -4.256591, 1, 1, 1, 1, 1,
-0.9263121, -0.8059559, -2.203544, 1, 1, 1, 1, 1,
-0.9214718, -0.8272028, -2.056817, 0, 0, 1, 1, 1,
-0.9151261, -0.3174607, -1.667107, 1, 0, 0, 1, 1,
-0.9102033, 1.183364, -0.4222038, 1, 0, 0, 1, 1,
-0.9099737, 0.3517641, 0.3962926, 1, 0, 0, 1, 1,
-0.8964818, -0.5889965, -1.43827, 1, 0, 0, 1, 1,
-0.8897811, -0.5879794, -3.111631, 1, 0, 0, 1, 1,
-0.8864412, -0.9098194, -4.398917, 0, 0, 0, 1, 1,
-0.8836629, 1.073192, -1.034179, 0, 0, 0, 1, 1,
-0.879384, -0.3792805, -0.8647516, 0, 0, 0, 1, 1,
-0.875315, -0.57762, -1.232403, 0, 0, 0, 1, 1,
-0.8656089, -1.106779, -2.553559, 0, 0, 0, 1, 1,
-0.859425, -0.9121414, -0.6625425, 0, 0, 0, 1, 1,
-0.8521104, -0.9350284, -3.876004, 0, 0, 0, 1, 1,
-0.8441641, -0.7438958, -1.952651, 1, 1, 1, 1, 1,
-0.8402702, -1.712589, -2.153717, 1, 1, 1, 1, 1,
-0.8398322, -0.6481148, -1.842417, 1, 1, 1, 1, 1,
-0.8395018, -0.6119561, -2.250401, 1, 1, 1, 1, 1,
-0.838536, -0.1989559, -1.912138, 1, 1, 1, 1, 1,
-0.8293069, -1.479778, -4.352443, 1, 1, 1, 1, 1,
-0.8277907, 1.131513, -1.612793, 1, 1, 1, 1, 1,
-0.8273087, -0.2140405, -1.899788, 1, 1, 1, 1, 1,
-0.8251755, 0.2568399, -0.7416128, 1, 1, 1, 1, 1,
-0.8225369, 0.7245003, -0.02862833, 1, 1, 1, 1, 1,
-0.8161929, 1.178165, -1.150852, 1, 1, 1, 1, 1,
-0.8143781, 0.2899047, -0.04579706, 1, 1, 1, 1, 1,
-0.8133816, -0.4424894, -1.255489, 1, 1, 1, 1, 1,
-0.8126139, 0.9406192, -1.153206, 1, 1, 1, 1, 1,
-0.8122638, 1.488253, -1.823088, 1, 1, 1, 1, 1,
-0.8102255, 0.1024127, -1.02773, 0, 0, 1, 1, 1,
-0.810078, 0.5140217, -0.01450027, 1, 0, 0, 1, 1,
-0.7986695, -0.2187396, -2.093869, 1, 0, 0, 1, 1,
-0.7958388, 0.3453978, -2.700658, 1, 0, 0, 1, 1,
-0.7889314, -1.056432, -1.330287, 1, 0, 0, 1, 1,
-0.7885954, -0.3629777, -1.511567, 1, 0, 0, 1, 1,
-0.788188, -0.7723588, -0.7161096, 0, 0, 0, 1, 1,
-0.780133, 0.4426754, -1.862747, 0, 0, 0, 1, 1,
-0.7795004, -0.5287285, -2.796517, 0, 0, 0, 1, 1,
-0.7784454, -1.760447, -3.264682, 0, 0, 0, 1, 1,
-0.7758979, 0.877335, 0.5483081, 0, 0, 0, 1, 1,
-0.7740571, -0.4239284, -2.916379, 0, 0, 0, 1, 1,
-0.7701276, 0.319787, -2.088249, 0, 0, 0, 1, 1,
-0.767545, -0.7013568, -2.351518, 1, 1, 1, 1, 1,
-0.7670803, 0.3840519, -0.785013, 1, 1, 1, 1, 1,
-0.7650993, 0.1982604, -0.1445746, 1, 1, 1, 1, 1,
-0.7617926, -0.4292234, -1.502247, 1, 1, 1, 1, 1,
-0.7593648, 0.1455584, -3.221966, 1, 1, 1, 1, 1,
-0.7589783, -0.6030431, -3.286651, 1, 1, 1, 1, 1,
-0.7536243, 0.6818107, -1.311898, 1, 1, 1, 1, 1,
-0.7525241, 0.08125268, 0.3502799, 1, 1, 1, 1, 1,
-0.7499714, 1.738324, -1.908816, 1, 1, 1, 1, 1,
-0.7452377, -0.2095421, -0.044, 1, 1, 1, 1, 1,
-0.7425538, 1.721465, 0.2679609, 1, 1, 1, 1, 1,
-0.7381067, -0.2915958, -1.852784, 1, 1, 1, 1, 1,
-0.7359836, -0.8905834, -2.900601, 1, 1, 1, 1, 1,
-0.7352592, 2.648559, -0.1379557, 1, 1, 1, 1, 1,
-0.7317144, -0.1865396, -0.7400311, 1, 1, 1, 1, 1,
-0.730321, 0.3973528, -0.01537861, 0, 0, 1, 1, 1,
-0.7271534, 1.698745, 0.8293512, 1, 0, 0, 1, 1,
-0.7254451, -1.251555, -4.724009, 1, 0, 0, 1, 1,
-0.7199546, 1.229426, -1.190654, 1, 0, 0, 1, 1,
-0.7107854, 0.4149946, -1.168528, 1, 0, 0, 1, 1,
-0.7087708, -0.4386317, -1.945334, 1, 0, 0, 1, 1,
-0.7071627, -2.381665, -3.451116, 0, 0, 0, 1, 1,
-0.7066573, 0.1682804, -1.962904, 0, 0, 0, 1, 1,
-0.7060937, 0.2298972, -0.6523466, 0, 0, 0, 1, 1,
-0.7027869, -2.07786, -3.335651, 0, 0, 0, 1, 1,
-0.7010033, 0.6038975, -2.483117, 0, 0, 0, 1, 1,
-0.6996781, -0.5106221, -2.329396, 0, 0, 0, 1, 1,
-0.6918677, -0.9585055, -1.658558, 0, 0, 0, 1, 1,
-0.687272, 0.03513096, -1.801078, 1, 1, 1, 1, 1,
-0.6814455, 0.686433, -1.757132, 1, 1, 1, 1, 1,
-0.6812018, -0.5733572, -3.899869, 1, 1, 1, 1, 1,
-0.6805016, 1.25164, -1.624723, 1, 1, 1, 1, 1,
-0.6798715, 0.3555663, -1.3504, 1, 1, 1, 1, 1,
-0.6796754, -1.678911, -3.444603, 1, 1, 1, 1, 1,
-0.6779755, -1.062586, -2.620836, 1, 1, 1, 1, 1,
-0.6747495, 0.807417, -0.154127, 1, 1, 1, 1, 1,
-0.6717121, -0.333443, -1.006866, 1, 1, 1, 1, 1,
-0.6657361, 0.5305735, -0.8581007, 1, 1, 1, 1, 1,
-0.6647873, -0.06010551, -0.2519764, 1, 1, 1, 1, 1,
-0.6636496, 1.326636, 1.29906, 1, 1, 1, 1, 1,
-0.6630968, 0.02235815, 0.1855831, 1, 1, 1, 1, 1,
-0.6605837, 1.87427, 0.1038449, 1, 1, 1, 1, 1,
-0.6589035, 0.4166255, -0.4243025, 1, 1, 1, 1, 1,
-0.6570904, 0.8835435, 0.5543739, 0, 0, 1, 1, 1,
-0.6553059, 0.5697927, -0.3435511, 1, 0, 0, 1, 1,
-0.6552968, -0.389661, -2.711361, 1, 0, 0, 1, 1,
-0.6522829, -0.6379651, -0.8462442, 1, 0, 0, 1, 1,
-0.6521828, 2.304562, -0.1325006, 1, 0, 0, 1, 1,
-0.6505303, 0.1591888, -2.849438, 1, 0, 0, 1, 1,
-0.6427689, -0.6288003, -1.198567, 0, 0, 0, 1, 1,
-0.6424634, -0.9946593, -5.384265, 0, 0, 0, 1, 1,
-0.6405451, 0.01200512, -2.570928, 0, 0, 0, 1, 1,
-0.6372015, 0.7328908, -0.7784423, 0, 0, 0, 1, 1,
-0.6355773, -0.3165029, -3.233418, 0, 0, 0, 1, 1,
-0.6288376, 0.2631763, -0.945421, 0, 0, 0, 1, 1,
-0.6284119, 0.365605, -1.715554, 0, 0, 0, 1, 1,
-0.6215708, -0.9364051, -0.4639756, 1, 1, 1, 1, 1,
-0.6211858, -1.148086, -3.009462, 1, 1, 1, 1, 1,
-0.6182253, 0.2722424, -3.334694, 1, 1, 1, 1, 1,
-0.617368, 0.5590861, 0.7847086, 1, 1, 1, 1, 1,
-0.6045929, -1.213637, -3.229161, 1, 1, 1, 1, 1,
-0.6043968, 0.6286911, -0.8779125, 1, 1, 1, 1, 1,
-0.5982522, -0.7605484, -3.964821, 1, 1, 1, 1, 1,
-0.598047, 2.087762, 0.1071485, 1, 1, 1, 1, 1,
-0.5965914, 1.037281, 0.1154878, 1, 1, 1, 1, 1,
-0.5884972, 0.5061064, -0.6374477, 1, 1, 1, 1, 1,
-0.5817567, -0.1555465, -0.9076952, 1, 1, 1, 1, 1,
-0.5777294, 0.6930151, -0.1976204, 1, 1, 1, 1, 1,
-0.5734709, 0.4635528, -1.023489, 1, 1, 1, 1, 1,
-0.5710456, 0.2631679, 0.08337384, 1, 1, 1, 1, 1,
-0.5698878, 0.2313359, -1.996583, 1, 1, 1, 1, 1,
-0.5696107, 0.1874982, -1.035842, 0, 0, 1, 1, 1,
-0.5680454, 0.602878, -0.1158516, 1, 0, 0, 1, 1,
-0.5666864, -0.6153629, -3.84302, 1, 0, 0, 1, 1,
-0.5636389, -2.036417, -2.433406, 1, 0, 0, 1, 1,
-0.5584438, -0.1296903, -1.316993, 1, 0, 0, 1, 1,
-0.5560027, -0.4760757, -2.439612, 1, 0, 0, 1, 1,
-0.5457027, 0.6544467, -0.409558, 0, 0, 0, 1, 1,
-0.5426439, 0.3375874, -1.625445, 0, 0, 0, 1, 1,
-0.541004, -1.03581, -1.23353, 0, 0, 0, 1, 1,
-0.5408633, -0.3297771, -3.034292, 0, 0, 0, 1, 1,
-0.5400254, -0.413528, -2.259894, 0, 0, 0, 1, 1,
-0.5297824, -0.6042809, -2.591712, 0, 0, 0, 1, 1,
-0.5292996, 0.8495551, -1.056014, 0, 0, 0, 1, 1,
-0.5285351, 0.6939948, -2.103967, 1, 1, 1, 1, 1,
-0.5265831, -0.05788048, -1.630174, 1, 1, 1, 1, 1,
-0.5196605, -0.4983001, -3.618081, 1, 1, 1, 1, 1,
-0.518292, 0.8212034, 0.1502794, 1, 1, 1, 1, 1,
-0.5105439, 0.4533207, -2.540116, 1, 1, 1, 1, 1,
-0.5104094, -0.589258, -2.139507, 1, 1, 1, 1, 1,
-0.5077556, -0.8982804, -2.771873, 1, 1, 1, 1, 1,
-0.4954274, 0.2455516, 0.5857061, 1, 1, 1, 1, 1,
-0.494322, -2.003279, -2.155974, 1, 1, 1, 1, 1,
-0.4900776, -1.141511, -2.745111, 1, 1, 1, 1, 1,
-0.4888557, -0.763683, -3.919099, 1, 1, 1, 1, 1,
-0.4871579, 0.3497988, -0.262799, 1, 1, 1, 1, 1,
-0.481303, 1.016949, 0.7883419, 1, 1, 1, 1, 1,
-0.4806412, -0.7233113, -1.435211, 1, 1, 1, 1, 1,
-0.4795795, 0.2160247, -1.412941, 1, 1, 1, 1, 1,
-0.479136, -1.974582, -4.186472, 0, 0, 1, 1, 1,
-0.4787785, -1.191394, -3.057098, 1, 0, 0, 1, 1,
-0.4723687, 0.3635013, -0.03464311, 1, 0, 0, 1, 1,
-0.4667217, -0.02616983, -2.694303, 1, 0, 0, 1, 1,
-0.4644412, -0.7108018, -1.824159, 1, 0, 0, 1, 1,
-0.4622634, -1.160732, -3.085678, 1, 0, 0, 1, 1,
-0.4609178, 2.060276, 0.466223, 0, 0, 0, 1, 1,
-0.4573897, 0.7338053, -0.4245974, 0, 0, 0, 1, 1,
-0.452591, 0.07270906, -1.766627, 0, 0, 0, 1, 1,
-0.4515856, -1.233177, -4.091569, 0, 0, 0, 1, 1,
-0.4506521, -1.932136, -1.399086, 0, 0, 0, 1, 1,
-0.4504382, 1.164559, -1.629407, 0, 0, 0, 1, 1,
-0.4496556, 0.7954401, -1.742779, 0, 0, 0, 1, 1,
-0.4472519, 1.204148, -0.7479818, 1, 1, 1, 1, 1,
-0.4466764, 0.4148472, -1.929015, 1, 1, 1, 1, 1,
-0.4457625, 0.03654108, -2.280374, 1, 1, 1, 1, 1,
-0.444282, 0.4113396, -3.502785, 1, 1, 1, 1, 1,
-0.4430657, 0.146834, -2.453593, 1, 1, 1, 1, 1,
-0.4377037, 0.1068649, -0.7724236, 1, 1, 1, 1, 1,
-0.4353877, 0.9032303, -0.2825643, 1, 1, 1, 1, 1,
-0.4352119, -0.6953435, -2.855137, 1, 1, 1, 1, 1,
-0.4336218, 0.1149542, -2.375429, 1, 1, 1, 1, 1,
-0.4320046, 0.3746362, -1.240444, 1, 1, 1, 1, 1,
-0.421573, -0.8724027, -2.765975, 1, 1, 1, 1, 1,
-0.4196719, 1.329736, 0.1841897, 1, 1, 1, 1, 1,
-0.4177907, -0.65465, -2.064591, 1, 1, 1, 1, 1,
-0.4130047, 0.12114, -1.174489, 1, 1, 1, 1, 1,
-0.4126182, -0.2619544, -1.974104, 1, 1, 1, 1, 1,
-0.4070528, -0.04812178, -1.746053, 0, 0, 1, 1, 1,
-0.4062366, -0.7841777, -2.252532, 1, 0, 0, 1, 1,
-0.4001183, -1.473834, -4.023827, 1, 0, 0, 1, 1,
-0.3973933, -0.7144269, -3.072406, 1, 0, 0, 1, 1,
-0.3963636, -1.054617, -2.426278, 1, 0, 0, 1, 1,
-0.390375, 0.919038, -1.133749, 1, 0, 0, 1, 1,
-0.3848926, 0.9101195, -2.05217, 0, 0, 0, 1, 1,
-0.3848344, -0.1843645, -1.294265, 0, 0, 0, 1, 1,
-0.3813366, 0.09092424, -2.308437, 0, 0, 0, 1, 1,
-0.3789432, -2.472668, -1.538968, 0, 0, 0, 1, 1,
-0.3760488, 0.5529215, 0.7055033, 0, 0, 0, 1, 1,
-0.3750458, 0.5769913, -1.696747, 0, 0, 0, 1, 1,
-0.3698734, -0.3008313, -0.8172096, 0, 0, 0, 1, 1,
-0.3692209, -0.3959417, -2.775858, 1, 1, 1, 1, 1,
-0.3652664, -0.1686965, -3.066219, 1, 1, 1, 1, 1,
-0.3651876, 1.505987, -0.7984666, 1, 1, 1, 1, 1,
-0.3622776, -0.03724004, -3.151228, 1, 1, 1, 1, 1,
-0.3620349, 0.7087231, 0.1545464, 1, 1, 1, 1, 1,
-0.3606406, 1.494921, -0.02029459, 1, 1, 1, 1, 1,
-0.3568869, 0.1223222, -0.04539885, 1, 1, 1, 1, 1,
-0.3539837, 0.7429645, -1.409898, 1, 1, 1, 1, 1,
-0.3487969, 0.2547183, -1.599407, 1, 1, 1, 1, 1,
-0.3473692, 1.062571, 0.3427626, 1, 1, 1, 1, 1,
-0.347092, 1.010572, -0.3503439, 1, 1, 1, 1, 1,
-0.3456127, -0.4560052, -4.585992, 1, 1, 1, 1, 1,
-0.3452687, -0.07309376, -2.624147, 1, 1, 1, 1, 1,
-0.3447825, 1.389125, 1.406654, 1, 1, 1, 1, 1,
-0.3428597, 0.09119146, -0.7896131, 1, 1, 1, 1, 1,
-0.3403962, -0.4926049, -2.165033, 0, 0, 1, 1, 1,
-0.3396305, -1.778417, -2.535537, 1, 0, 0, 1, 1,
-0.3388689, -0.2950108, -4.594351, 1, 0, 0, 1, 1,
-0.3370544, -0.1157544, -1.014372, 1, 0, 0, 1, 1,
-0.334413, -0.2144249, -0.799642, 1, 0, 0, 1, 1,
-0.3332721, -0.2870785, -2.35121, 1, 0, 0, 1, 1,
-0.3304816, -0.5011021, -4.09638, 0, 0, 0, 1, 1,
-0.3303873, 0.9078344, 1.404281, 0, 0, 0, 1, 1,
-0.3257655, 0.3700834, -0.468312, 0, 0, 0, 1, 1,
-0.3249818, -1.14752, -2.679421, 0, 0, 0, 1, 1,
-0.3245213, -0.7579535, -3.443959, 0, 0, 0, 1, 1,
-0.3184259, 1.389906, -1.216422, 0, 0, 0, 1, 1,
-0.3162813, -0.8186342, -2.872637, 0, 0, 0, 1, 1,
-0.316013, -0.7292704, -2.535408, 1, 1, 1, 1, 1,
-0.312149, -1.725253, -2.949392, 1, 1, 1, 1, 1,
-0.3083719, -0.7602437, -2.896099, 1, 1, 1, 1, 1,
-0.304493, -0.1100564, -1.784654, 1, 1, 1, 1, 1,
-0.3010557, -1.856177, -1.670512, 1, 1, 1, 1, 1,
-0.2981442, -0.893205, -3.400149, 1, 1, 1, 1, 1,
-0.29394, 0.04111682, -2.374388, 1, 1, 1, 1, 1,
-0.2916524, -1.653194, -4.387279, 1, 1, 1, 1, 1,
-0.290729, 0.2801249, -0.4575578, 1, 1, 1, 1, 1,
-0.2905312, -0.3255427, -1.854097, 1, 1, 1, 1, 1,
-0.2887131, -1.337701, -2.805147, 1, 1, 1, 1, 1,
-0.2837368, -1.206737, -1.678267, 1, 1, 1, 1, 1,
-0.2783667, 0.7621971, -0.3903373, 1, 1, 1, 1, 1,
-0.2766182, 1.015424, -0.503893, 1, 1, 1, 1, 1,
-0.2749493, -0.3575954, -2.014726, 1, 1, 1, 1, 1,
-0.274675, 0.1245658, 0.8320124, 0, 0, 1, 1, 1,
-0.2744263, -0.06140612, -0.9207675, 1, 0, 0, 1, 1,
-0.2722793, 0.1546381, -2.897747, 1, 0, 0, 1, 1,
-0.2665165, -0.4696867, -3.183772, 1, 0, 0, 1, 1,
-0.2629849, -0.6509721, -3.58987, 1, 0, 0, 1, 1,
-0.2605357, -0.05423634, -2.394505, 1, 0, 0, 1, 1,
-0.2602412, -0.2593704, -0.9179856, 0, 0, 0, 1, 1,
-0.2585501, -0.08021645, -0.6635274, 0, 0, 0, 1, 1,
-0.2555179, -0.3401734, -3.450056, 0, 0, 0, 1, 1,
-0.2521935, 0.4686723, -0.8662584, 0, 0, 0, 1, 1,
-0.2471932, 2.155757, -0.256642, 0, 0, 0, 1, 1,
-0.2458448, -0.8834626, -2.557025, 0, 0, 0, 1, 1,
-0.2458151, 0.8438411, -0.8203868, 0, 0, 0, 1, 1,
-0.2448729, -0.2239609, -3.378286, 1, 1, 1, 1, 1,
-0.2432054, -1.528666, -3.367369, 1, 1, 1, 1, 1,
-0.24279, 1.10043, -0.6192515, 1, 1, 1, 1, 1,
-0.2426817, 0.5784128, -0.3205973, 1, 1, 1, 1, 1,
-0.2347043, -0.374009, -4.524007, 1, 1, 1, 1, 1,
-0.233206, -0.09798017, -0.6039314, 1, 1, 1, 1, 1,
-0.2309348, -0.3886895, -1.514193, 1, 1, 1, 1, 1,
-0.229338, -1.167325, -3.67675, 1, 1, 1, 1, 1,
-0.2289084, -0.4349416, -1.160101, 1, 1, 1, 1, 1,
-0.2283492, -3.057267, -2.214088, 1, 1, 1, 1, 1,
-0.2159538, -1.30406, -2.076254, 1, 1, 1, 1, 1,
-0.2152406, 0.5304883, 0.6495679, 1, 1, 1, 1, 1,
-0.2147246, 1.087907, -0.6046171, 1, 1, 1, 1, 1,
-0.2142853, -1.524002, -5.217871, 1, 1, 1, 1, 1,
-0.2140184, -0.848119, -2.563483, 1, 1, 1, 1, 1,
-0.2133512, -0.7965991, -3.464448, 0, 0, 1, 1, 1,
-0.2107645, 0.2234062, 0.9976521, 1, 0, 0, 1, 1,
-0.2013336, 1.103478, -0.1966412, 1, 0, 0, 1, 1,
-0.195829, 1.393133, 0.3360828, 1, 0, 0, 1, 1,
-0.1953307, 0.2647169, -0.8929116, 1, 0, 0, 1, 1,
-0.1929589, -1.72768, -3.340791, 1, 0, 0, 1, 1,
-0.1927128, 2.284663, -0.04418259, 0, 0, 0, 1, 1,
-0.189074, 0.1316739, -0.830022, 0, 0, 0, 1, 1,
-0.1833667, 0.576307, 0.02042797, 0, 0, 0, 1, 1,
-0.1808011, 1.804419, -3.073298, 0, 0, 0, 1, 1,
-0.1779827, -0.3978735, -3.848692, 0, 0, 0, 1, 1,
-0.1770118, -1.245033, -3.61519, 0, 0, 0, 1, 1,
-0.1652026, 0.279672, 0.6748599, 0, 0, 0, 1, 1,
-0.165022, -0.7905065, -1.04077, 1, 1, 1, 1, 1,
-0.1646313, 0.3426851, 1.239089, 1, 1, 1, 1, 1,
-0.1549202, -0.7938839, -2.856198, 1, 1, 1, 1, 1,
-0.1548243, -2.554971, -0.580881, 1, 1, 1, 1, 1,
-0.154487, 0.3155918, -0.6941282, 1, 1, 1, 1, 1,
-0.1526938, 0.5769064, 1.010631, 1, 1, 1, 1, 1,
-0.1514378, 0.2255393, 0.7698979, 1, 1, 1, 1, 1,
-0.1511963, -0.02413128, -0.807355, 1, 1, 1, 1, 1,
-0.1500347, -0.5473019, -1.88981, 1, 1, 1, 1, 1,
-0.1496259, -0.292602, -4.361846, 1, 1, 1, 1, 1,
-0.1457523, 1.294922, 0.4007563, 1, 1, 1, 1, 1,
-0.1407977, 0.6925274, 0.3395611, 1, 1, 1, 1, 1,
-0.140647, -0.7081106, -3.193327, 1, 1, 1, 1, 1,
-0.1396076, -2.129756, -3.149444, 1, 1, 1, 1, 1,
-0.1394593, 0.276211, -0.8144958, 1, 1, 1, 1, 1,
-0.1316459, -1.189576, -2.24004, 0, 0, 1, 1, 1,
-0.1248584, 1.073593, 0.8539358, 1, 0, 0, 1, 1,
-0.1238208, 0.3328805, 0.6251891, 1, 0, 0, 1, 1,
-0.1225219, -0.5224305, -3.626945, 1, 0, 0, 1, 1,
-0.1222553, 0.3681059, -2.143167, 1, 0, 0, 1, 1,
-0.120066, 1.234912, -0.4428388, 1, 0, 0, 1, 1,
-0.1194084, 0.5739926, 0.2289323, 0, 0, 0, 1, 1,
-0.1174195, -0.05145574, -2.100088, 0, 0, 0, 1, 1,
-0.1166106, -0.4757281, -2.172868, 0, 0, 0, 1, 1,
-0.1164771, -1.925377, -3.280086, 0, 0, 0, 1, 1,
-0.1128279, 0.3268775, -0.5588944, 0, 0, 0, 1, 1,
-0.1072873, 0.02767248, -1.147598, 0, 0, 0, 1, 1,
-0.1022894, 0.2752306, -1.129712, 0, 0, 0, 1, 1,
-0.1009989, 0.3216406, 0.3127885, 1, 1, 1, 1, 1,
-0.09756938, 0.8907506, 0.127107, 1, 1, 1, 1, 1,
-0.09449347, 1.687455, 1.444335, 1, 1, 1, 1, 1,
-0.09383134, -0.5600293, -2.77555, 1, 1, 1, 1, 1,
-0.08937071, -1.211451, -3.54576, 1, 1, 1, 1, 1,
-0.08811186, 1.142806, -0.8815487, 1, 1, 1, 1, 1,
-0.08623797, 1.826309, 0.5651225, 1, 1, 1, 1, 1,
-0.08410112, 1.549098, 2.151906, 1, 1, 1, 1, 1,
-0.0793222, -0.6572217, -3.067117, 1, 1, 1, 1, 1,
-0.07659868, -0.3768869, -3.639272, 1, 1, 1, 1, 1,
-0.07433266, -0.08600204, -3.026974, 1, 1, 1, 1, 1,
-0.07353463, 0.5035449, 1.049619, 1, 1, 1, 1, 1,
-0.07215458, 2.19142, 0.3994946, 1, 1, 1, 1, 1,
-0.06910677, 0.8480277, -1.439001, 1, 1, 1, 1, 1,
-0.05869675, -0.1761352, -3.54263, 1, 1, 1, 1, 1,
-0.05798398, 1.007575, -0.5759902, 0, 0, 1, 1, 1,
-0.05694448, -0.7995232, -2.508238, 1, 0, 0, 1, 1,
-0.05591368, 0.1330445, 0.1797118, 1, 0, 0, 1, 1,
-0.05179787, 2.973122, -0.8771603, 1, 0, 0, 1, 1,
-0.04951544, -1.129675, -2.714335, 1, 0, 0, 1, 1,
-0.04852857, 2.221443, -0.5104513, 1, 0, 0, 1, 1,
-0.04751409, 0.2331983, -1.09056, 0, 0, 0, 1, 1,
-0.04111979, -0.375658, -1.53872, 0, 0, 0, 1, 1,
-0.0405909, 2.154208, 0.4781158, 0, 0, 0, 1, 1,
-0.03593412, 1.73129, -0.837908, 0, 0, 0, 1, 1,
-0.03538183, 0.6458737, -1.42716, 0, 0, 0, 1, 1,
-0.03351022, 2.16267, -1.684685, 0, 0, 0, 1, 1,
-0.03209143, 0.3624838, -0.5937034, 0, 0, 0, 1, 1,
-0.02812869, 1.864996, -0.2176483, 1, 1, 1, 1, 1,
-0.02763147, 0.2754962, 0.07203574, 1, 1, 1, 1, 1,
-0.02712701, 0.6924205, -0.3732887, 1, 1, 1, 1, 1,
-0.02632279, -1.95874, -2.490567, 1, 1, 1, 1, 1,
-0.0228941, -1.245732, -3.597845, 1, 1, 1, 1, 1,
-0.0190943, -0.6375482, -4.161053, 1, 1, 1, 1, 1,
-0.007822506, -0.8418558, -1.620912, 1, 1, 1, 1, 1,
-0.007489734, 0.2296232, -0.5318621, 1, 1, 1, 1, 1,
0.006111783, 0.1695827, -0.2294997, 1, 1, 1, 1, 1,
0.009274323, 2.877955, 0.5197842, 1, 1, 1, 1, 1,
0.01483326, 0.1660471, -0.4281444, 1, 1, 1, 1, 1,
0.0148726, -0.9314522, 3.157972, 1, 1, 1, 1, 1,
0.01635848, -0.1584985, 1.634215, 1, 1, 1, 1, 1,
0.01683655, 0.06261002, 0.1679326, 1, 1, 1, 1, 1,
0.02355335, 0.8824209, 1.355678, 1, 1, 1, 1, 1,
0.0288649, 0.3750702, -0.2122957, 0, 0, 1, 1, 1,
0.03930771, -0.2177218, 1.166489, 1, 0, 0, 1, 1,
0.0405149, -0.5036635, 3.226697, 1, 0, 0, 1, 1,
0.04626179, 2.18523, 0.004693503, 1, 0, 0, 1, 1,
0.04860719, 0.9725806, 0.1665473, 1, 0, 0, 1, 1,
0.05272305, -0.6169446, 3.211939, 1, 0, 0, 1, 1,
0.05329954, -0.571611, 2.403461, 0, 0, 0, 1, 1,
0.05343165, 0.1610751, 0.4168316, 0, 0, 0, 1, 1,
0.05403177, -0.6323553, 3.330994, 0, 0, 0, 1, 1,
0.05579152, -1.604863, 4.123509, 0, 0, 0, 1, 1,
0.05648814, -0.1304173, 2.629776, 0, 0, 0, 1, 1,
0.05651359, 0.1926885, 1.926452, 0, 0, 0, 1, 1,
0.06005247, -0.2771076, 3.436638, 0, 0, 0, 1, 1,
0.06005393, -0.3705295, 2.648903, 1, 1, 1, 1, 1,
0.06753351, -1.383768, 5.31828, 1, 1, 1, 1, 1,
0.07290094, -0.3708027, 3.27555, 1, 1, 1, 1, 1,
0.07468668, -2.183193, 4.191928, 1, 1, 1, 1, 1,
0.07657757, -0.1526389, 2.908363, 1, 1, 1, 1, 1,
0.07663412, -0.001016814, 0.1769133, 1, 1, 1, 1, 1,
0.07739715, 1.606107, -0.7585292, 1, 1, 1, 1, 1,
0.08354305, -1.03723, 4.088303, 1, 1, 1, 1, 1,
0.08467867, -1.235294, 3.895558, 1, 1, 1, 1, 1,
0.09338158, -0.1433075, 3.11224, 1, 1, 1, 1, 1,
0.09517349, -0.9922224, 3.712572, 1, 1, 1, 1, 1,
0.09610397, 0.2576357, -1.39708, 1, 1, 1, 1, 1,
0.09693807, -2.491341, 2.522477, 1, 1, 1, 1, 1,
0.1016145, -1.138829, 2.881571, 1, 1, 1, 1, 1,
0.1016414, -1.293681, 4.386199, 1, 1, 1, 1, 1,
0.1029502, 0.8840793, -0.4145711, 0, 0, 1, 1, 1,
0.1036526, 0.9840924, 0.1141984, 1, 0, 0, 1, 1,
0.1056339, -1.150418, 2.507628, 1, 0, 0, 1, 1,
0.1062457, 1.356568, 0.2242589, 1, 0, 0, 1, 1,
0.1064075, 1.197763, -0.9797605, 1, 0, 0, 1, 1,
0.1080018, 0.01002653, 1.430382, 1, 0, 0, 1, 1,
0.1106728, 2.093929, -1.306164, 0, 0, 0, 1, 1,
0.1125595, -1.563917, 2.956679, 0, 0, 0, 1, 1,
0.1154826, 0.3923262, -1.401, 0, 0, 0, 1, 1,
0.1159865, 0.8783761, 1.219585, 0, 0, 0, 1, 1,
0.1188534, 0.02290523, 1.632434, 0, 0, 0, 1, 1,
0.1252571, -0.8511056, 2.775203, 0, 0, 0, 1, 1,
0.1255094, 0.2568604, -0.08561087, 0, 0, 0, 1, 1,
0.1272529, 0.7274238, -2.061091, 1, 1, 1, 1, 1,
0.1284415, -1.220282, 3.076765, 1, 1, 1, 1, 1,
0.1290001, 0.1851583, 1.344239, 1, 1, 1, 1, 1,
0.1296436, -1.233639, 3.586553, 1, 1, 1, 1, 1,
0.1330409, -0.859215, 3.13727, 1, 1, 1, 1, 1,
0.1368797, -0.8077824, 1.529562, 1, 1, 1, 1, 1,
0.1378556, 0.1844082, 1.466136, 1, 1, 1, 1, 1,
0.1393828, 0.603017, -1.171802, 1, 1, 1, 1, 1,
0.1416273, 0.5068106, -1.42384, 1, 1, 1, 1, 1,
0.1455175, 0.3654754, 0.2915315, 1, 1, 1, 1, 1,
0.1515667, -1.263731, 4.132938, 1, 1, 1, 1, 1,
0.1548761, -0.185096, 2.703217, 1, 1, 1, 1, 1,
0.1569277, -0.9277889, 3.358872, 1, 1, 1, 1, 1,
0.1635569, -0.1777162, 4.034322, 1, 1, 1, 1, 1,
0.1638226, 1.482945, -0.3710222, 1, 1, 1, 1, 1,
0.1639575, -0.1442806, 1.072912, 0, 0, 1, 1, 1,
0.1642702, -0.6491938, 4.317635, 1, 0, 0, 1, 1,
0.1653292, 1.426438, 2.964425, 1, 0, 0, 1, 1,
0.1672115, -0.5201112, 1.247442, 1, 0, 0, 1, 1,
0.1719396, 0.4150206, 1.402808, 1, 0, 0, 1, 1,
0.1728732, -1.029513, 4.28986, 1, 0, 0, 1, 1,
0.1757245, -0.692073, 3.055992, 0, 0, 0, 1, 1,
0.1781126, 1.910904, -0.893381, 0, 0, 0, 1, 1,
0.1840528, -0.2824171, 2.313696, 0, 0, 0, 1, 1,
0.1856266, -0.009520623, 2.499995, 0, 0, 0, 1, 1,
0.1857922, -1.927238, 2.875929, 0, 0, 0, 1, 1,
0.1866439, 0.8749641, 0.09005361, 0, 0, 0, 1, 1,
0.1886533, -0.5777749, 4.801857, 0, 0, 0, 1, 1,
0.1939168, -0.2037153, 3.035821, 1, 1, 1, 1, 1,
0.1979614, -2.355891, 4.37851, 1, 1, 1, 1, 1,
0.1988328, 0.08430631, -0.1488625, 1, 1, 1, 1, 1,
0.2018809, 1.737198, 0.4922087, 1, 1, 1, 1, 1,
0.2064601, 1.511178, -1.379948, 1, 1, 1, 1, 1,
0.20745, 0.633411, 0.5897162, 1, 1, 1, 1, 1,
0.2099216, -0.5210625, 1.030487, 1, 1, 1, 1, 1,
0.211579, -1.495407, 2.674792, 1, 1, 1, 1, 1,
0.2129699, -1.583494, 2.65967, 1, 1, 1, 1, 1,
0.2139454, -0.2854394, 3.30305, 1, 1, 1, 1, 1,
0.215338, 1.204246, 0.05056179, 1, 1, 1, 1, 1,
0.2155258, 0.5032395, 0.9147394, 1, 1, 1, 1, 1,
0.2171999, -0.6231, 2.599373, 1, 1, 1, 1, 1,
0.2204412, -0.4143198, 3.671951, 1, 1, 1, 1, 1,
0.2215244, -0.6696246, 2.316347, 1, 1, 1, 1, 1,
0.2251704, -0.9395553, 4.036718, 0, 0, 1, 1, 1,
0.2375302, 0.7754439, 1.032656, 1, 0, 0, 1, 1,
0.2382136, -3.663404, 4.535501, 1, 0, 0, 1, 1,
0.2393417, 1.04876, -1.476785, 1, 0, 0, 1, 1,
0.2424109, 0.2319806, 1.930523, 1, 0, 0, 1, 1,
0.2424596, 0.8830145, -0.1091273, 1, 0, 0, 1, 1,
0.2499533, -1.614696, 2.931478, 0, 0, 0, 1, 1,
0.2540398, -0.6848543, 3.454963, 0, 0, 0, 1, 1,
0.2545342, 2.115607, -1.722249, 0, 0, 0, 1, 1,
0.2556277, 0.3798448, -0.2542132, 0, 0, 0, 1, 1,
0.2558474, 0.8864712, 0.3799645, 0, 0, 0, 1, 1,
0.260756, -0.8269374, 2.272887, 0, 0, 0, 1, 1,
0.2609484, -0.6944793, 4.513745, 0, 0, 0, 1, 1,
0.2651248, -0.3857395, 2.355981, 1, 1, 1, 1, 1,
0.2682941, 1.391558, 0.127104, 1, 1, 1, 1, 1,
0.2725502, -1.7866, 3.071725, 1, 1, 1, 1, 1,
0.2725836, 0.06766929, 2.851234, 1, 1, 1, 1, 1,
0.2766948, -0.1670128, 0.9449128, 1, 1, 1, 1, 1,
0.2816038, 1.293508, -1.51436, 1, 1, 1, 1, 1,
0.2874958, -0.1408781, 1.522222, 1, 1, 1, 1, 1,
0.2890517, 0.6444341, 1.409305, 1, 1, 1, 1, 1,
0.2896308, 0.9850941, 0.512534, 1, 1, 1, 1, 1,
0.2897353, -0.6744819, 2.732896, 1, 1, 1, 1, 1,
0.2902917, -1.079053, 4.011664, 1, 1, 1, 1, 1,
0.2918287, 0.006855763, 1.921047, 1, 1, 1, 1, 1,
0.2926481, 1.759487, -1.167236, 1, 1, 1, 1, 1,
0.2939809, -0.5158788, 2.412949, 1, 1, 1, 1, 1,
0.2944109, 1.997818, 0.2946092, 1, 1, 1, 1, 1,
0.2974915, -0.5550321, 2.852404, 0, 0, 1, 1, 1,
0.3012054, 0.4590475, 0.5923551, 1, 0, 0, 1, 1,
0.3016452, -0.02715139, 1.980728, 1, 0, 0, 1, 1,
0.3052449, 0.1545655, 1.670244, 1, 0, 0, 1, 1,
0.3072122, -0.05343856, -0.0448388, 1, 0, 0, 1, 1,
0.3086863, 0.8876361, -0.3709961, 1, 0, 0, 1, 1,
0.3101334, -1.295224, 2.349512, 0, 0, 0, 1, 1,
0.3119695, 0.3871496, 1.331672, 0, 0, 0, 1, 1,
0.315255, 0.6434383, 0.1916967, 0, 0, 0, 1, 1,
0.3166685, 0.845252, 0.354685, 0, 0, 0, 1, 1,
0.3174724, 2.031375, -0.4256816, 0, 0, 0, 1, 1,
0.3259712, -0.3681368, 1.634005, 0, 0, 0, 1, 1,
0.3281737, 1.358307, 1.323709, 0, 0, 0, 1, 1,
0.3308595, 0.463719, 0.8690364, 1, 1, 1, 1, 1,
0.3329947, -0.1963663, 2.740636, 1, 1, 1, 1, 1,
0.3422149, 2.396566, 1.649811, 1, 1, 1, 1, 1,
0.3442161, -0.2468763, 2.271308, 1, 1, 1, 1, 1,
0.3447569, -0.6945308, 2.072942, 1, 1, 1, 1, 1,
0.3459875, -0.2291266, 0.9787868, 1, 1, 1, 1, 1,
0.3496788, -0.4755357, 3.52876, 1, 1, 1, 1, 1,
0.3517906, -1.111224, 3.446289, 1, 1, 1, 1, 1,
0.3587381, -1.317162, 2.427968, 1, 1, 1, 1, 1,
0.3598213, 0.1492207, 0.2623, 1, 1, 1, 1, 1,
0.3620764, -0.2859626, 2.761014, 1, 1, 1, 1, 1,
0.3665189, 0.4255779, 0.4991585, 1, 1, 1, 1, 1,
0.3678849, 0.3839962, 1.593993, 1, 1, 1, 1, 1,
0.3703864, 0.5463873, -0.004832424, 1, 1, 1, 1, 1,
0.3745994, 0.96292, 0.5399986, 1, 1, 1, 1, 1,
0.3788038, 0.6588227, 0.7544533, 0, 0, 1, 1, 1,
0.3819588, -1.14042, 2.56478, 1, 0, 0, 1, 1,
0.3846923, 0.01946399, 1.680301, 1, 0, 0, 1, 1,
0.3875899, 0.8964615, 0.563745, 1, 0, 0, 1, 1,
0.3876848, 0.4929684, 0.04113686, 1, 0, 0, 1, 1,
0.3890033, 0.0566527, 0.5176168, 1, 0, 0, 1, 1,
0.3907689, -0.3738297, 1.96589, 0, 0, 0, 1, 1,
0.3931039, 0.2506413, 0.9712893, 0, 0, 0, 1, 1,
0.3936257, 0.4955972, -0.7520425, 0, 0, 0, 1, 1,
0.3966683, 0.3828665, 0.9734133, 0, 0, 0, 1, 1,
0.3983002, 1.805039, 1.393604, 0, 0, 0, 1, 1,
0.4041922, -1.053927, 4.281767, 0, 0, 0, 1, 1,
0.4043631, 0.09547703, 0.6499531, 0, 0, 0, 1, 1,
0.4056382, 1.014854, -2.362381, 1, 1, 1, 1, 1,
0.4059474, -0.3861184, 3.26027, 1, 1, 1, 1, 1,
0.4080387, 0.6923051, 1.192042, 1, 1, 1, 1, 1,
0.4168541, -1.169441, 3.45474, 1, 1, 1, 1, 1,
0.4171853, 0.9450332, 0.621663, 1, 1, 1, 1, 1,
0.4203787, -1.098915, 2.265804, 1, 1, 1, 1, 1,
0.4209035, 1.209154, 0.7953393, 1, 1, 1, 1, 1,
0.4211167, 0.4010994, 0.3080814, 1, 1, 1, 1, 1,
0.4216328, 0.4234468, 0.4683059, 1, 1, 1, 1, 1,
0.4223358, 0.1790675, 1.506064, 1, 1, 1, 1, 1,
0.422547, 0.7711065, 1.351095, 1, 1, 1, 1, 1,
0.4234458, -0.3584945, 3.619477, 1, 1, 1, 1, 1,
0.4260084, 0.3438869, 1.83572, 1, 1, 1, 1, 1,
0.4294558, 1.427129, -0.6199406, 1, 1, 1, 1, 1,
0.4299661, -0.7218077, 1.547269, 1, 1, 1, 1, 1,
0.4339969, 0.2312529, -0.2912723, 0, 0, 1, 1, 1,
0.4424067, 2.584107, -0.0210099, 1, 0, 0, 1, 1,
0.4446695, -0.5063984, 1.783904, 1, 0, 0, 1, 1,
0.4470422, -0.6961382, 0.5147226, 1, 0, 0, 1, 1,
0.4473725, 0.624536, 0.2763823, 1, 0, 0, 1, 1,
0.4475278, -0.3388472, 2.555578, 1, 0, 0, 1, 1,
0.4509131, -0.8324062, 1.028319, 0, 0, 0, 1, 1,
0.457527, 0.2728571, 1.807542, 0, 0, 0, 1, 1,
0.4595956, 2.109911, 0.4612043, 0, 0, 0, 1, 1,
0.465018, 0.8301126, 1.644469, 0, 0, 0, 1, 1,
0.4692056, 0.1137835, -0.009324854, 0, 0, 0, 1, 1,
0.4708192, 1.170002, -0.9248117, 0, 0, 0, 1, 1,
0.478593, 0.3294222, 1.05251, 0, 0, 0, 1, 1,
0.4819267, -0.554872, 0.1184447, 1, 1, 1, 1, 1,
0.4833901, -0.6927822, 1.87115, 1, 1, 1, 1, 1,
0.4897633, -0.2005913, 1.99406, 1, 1, 1, 1, 1,
0.4923235, 1.849854, -0.5812182, 1, 1, 1, 1, 1,
0.4932418, 0.1121866, 0.8931487, 1, 1, 1, 1, 1,
0.4935385, 0.3002144, 2.345211, 1, 1, 1, 1, 1,
0.4966682, 0.7769378, 1.967621, 1, 1, 1, 1, 1,
0.514908, -0.615216, 2.627885, 1, 1, 1, 1, 1,
0.5200568, -0.7569814, 2.868201, 1, 1, 1, 1, 1,
0.5237086, -0.1440443, 3.130172, 1, 1, 1, 1, 1,
0.5277956, 0.5841902, 0.2245815, 1, 1, 1, 1, 1,
0.5283579, -1.128801, 3.575362, 1, 1, 1, 1, 1,
0.5298471, 0.1425651, 1.665808, 1, 1, 1, 1, 1,
0.5374635, 3.089713, -0.405908, 1, 1, 1, 1, 1,
0.540269, 0.956342, 0.610943, 1, 1, 1, 1, 1,
0.5427091, -0.6079183, 2.075758, 0, 0, 1, 1, 1,
0.546124, 0.03264462, 1.971827, 1, 0, 0, 1, 1,
0.5461567, 1.096877, 0.5047673, 1, 0, 0, 1, 1,
0.5530095, 0.6303819, 1.290382, 1, 0, 0, 1, 1,
0.559902, 1.547845, -1.016874, 1, 0, 0, 1, 1,
0.5619272, -1.875411, 2.992093, 1, 0, 0, 1, 1,
0.5648121, 2.679103, 0.1723204, 0, 0, 0, 1, 1,
0.5702217, 0.2621267, 3.503489, 0, 0, 0, 1, 1,
0.5754451, -1.91573, 4.297451, 0, 0, 0, 1, 1,
0.5754743, 2.041116, 1.317463, 0, 0, 0, 1, 1,
0.5765024, -1.009545, 2.975528, 0, 0, 0, 1, 1,
0.5828949, -0.7471486, 1.481807, 0, 0, 0, 1, 1,
0.5846758, -0.6995695, 3.072753, 0, 0, 0, 1, 1,
0.5858314, 0.3734563, 2.297878, 1, 1, 1, 1, 1,
0.5861566, 0.5873781, 1.362385, 1, 1, 1, 1, 1,
0.5888655, -1.238273, 2.364668, 1, 1, 1, 1, 1,
0.5911275, -1.898271, 3.341413, 1, 1, 1, 1, 1,
0.5934711, -1.363613, 2.048437, 1, 1, 1, 1, 1,
0.5958176, 2.35022, -0.7510295, 1, 1, 1, 1, 1,
0.59623, 1.583065, 2.458721, 1, 1, 1, 1, 1,
0.6019756, -0.2181108, 2.550075, 1, 1, 1, 1, 1,
0.6076338, 0.280066, -0.3941082, 1, 1, 1, 1, 1,
0.6129686, 0.7738492, 0.9859635, 1, 1, 1, 1, 1,
0.6180916, 0.4473393, -0.9244804, 1, 1, 1, 1, 1,
0.6181254, -0.2162455, 1.033325, 1, 1, 1, 1, 1,
0.6221849, 0.2178139, 1.122006, 1, 1, 1, 1, 1,
0.6296886, -0.05771662, 2.918262, 1, 1, 1, 1, 1,
0.6328673, -0.2717369, 1.557073, 1, 1, 1, 1, 1,
0.6337423, 0.2613201, 1.439939, 0, 0, 1, 1, 1,
0.6346356, -0.6238117, 1.762076, 1, 0, 0, 1, 1,
0.6373937, 2.053783, -0.1999246, 1, 0, 0, 1, 1,
0.644284, 0.3388781, 1.695771, 1, 0, 0, 1, 1,
0.6456581, 0.9761578, 0.6074431, 1, 0, 0, 1, 1,
0.6480186, 0.1178623, 1.412638, 1, 0, 0, 1, 1,
0.6529128, 0.7218977, -0.6753544, 0, 0, 0, 1, 1,
0.653362, 0.2579872, 2.546643, 0, 0, 0, 1, 1,
0.6534745, 0.8387094, 0.4520759, 0, 0, 0, 1, 1,
0.6547117, -1.052082, 2.636946, 0, 0, 0, 1, 1,
0.6552885, -0.9324521, 2.159072, 0, 0, 0, 1, 1,
0.6590615, 1.205436, 0.5143282, 0, 0, 0, 1, 1,
0.6601674, -0.6917613, 4.452909, 0, 0, 0, 1, 1,
0.6616356, 0.4894378, 1.286515, 1, 1, 1, 1, 1,
0.662306, -1.232235, 2.902055, 1, 1, 1, 1, 1,
0.6652254, 0.8829356, 0.2473231, 1, 1, 1, 1, 1,
0.6674139, 1.198921, 0.7966103, 1, 1, 1, 1, 1,
0.6680179, -1.088707, 1.863344, 1, 1, 1, 1, 1,
0.6714192, 1.387242, 2.371013, 1, 1, 1, 1, 1,
0.6733374, -2.244213, 4.129348, 1, 1, 1, 1, 1,
0.6814513, 0.4851327, 1.155025, 1, 1, 1, 1, 1,
0.6834288, 0.02950105, 1.55151, 1, 1, 1, 1, 1,
0.6863562, -0.9826376, 2.542357, 1, 1, 1, 1, 1,
0.6868655, 0.3273109, 2.134578, 1, 1, 1, 1, 1,
0.687396, -1.378545, 2.91021, 1, 1, 1, 1, 1,
0.6874842, 1.083157, -0.9207575, 1, 1, 1, 1, 1,
0.689038, -0.1673325, 1.355392, 1, 1, 1, 1, 1,
0.6907756, -0.4823896, 0.5545126, 1, 1, 1, 1, 1,
0.6916809, -0.9622993, 3.004379, 0, 0, 1, 1, 1,
0.6918446, 0.8436522, 1.344808, 1, 0, 0, 1, 1,
0.6937894, 1.731683, -0.5374562, 1, 0, 0, 1, 1,
0.6980158, -0.4253624, 0.9096802, 1, 0, 0, 1, 1,
0.7001218, 0.216059, 1.85089, 1, 0, 0, 1, 1,
0.7010828, 0.1693718, 1.899568, 1, 0, 0, 1, 1,
0.7030073, 0.3974731, 2.132404, 0, 0, 0, 1, 1,
0.708102, 0.8717426, 1.582108, 0, 0, 0, 1, 1,
0.7121759, -0.4992405, 2.937127, 0, 0, 0, 1, 1,
0.7122509, 1.64419, 2.463266, 0, 0, 0, 1, 1,
0.7144157, 0.5515313, 1.349899, 0, 0, 0, 1, 1,
0.7211322, -0.01954485, 2.165538, 0, 0, 0, 1, 1,
0.7217308, -1.043496, 1.620304, 0, 0, 0, 1, 1,
0.7261484, 0.2906169, 0.8891753, 1, 1, 1, 1, 1,
0.7292058, 0.6397958, 1.218438, 1, 1, 1, 1, 1,
0.734293, -1.85379, 2.398858, 1, 1, 1, 1, 1,
0.7357945, -0.8471843, 2.547796, 1, 1, 1, 1, 1,
0.7393208, 2.23479, -0.659223, 1, 1, 1, 1, 1,
0.7490081, 0.1479641, 0.4590654, 1, 1, 1, 1, 1,
0.7501649, 0.04152832, 1.920042, 1, 1, 1, 1, 1,
0.7523594, 1.834901, 0.5623516, 1, 1, 1, 1, 1,
0.7556496, 1.016939, 0.8239759, 1, 1, 1, 1, 1,
0.7584391, 1.569453, -1.274015, 1, 1, 1, 1, 1,
0.7586458, 0.1526839, 1.724009, 1, 1, 1, 1, 1,
0.7601817, -0.7026568, 1.622991, 1, 1, 1, 1, 1,
0.7675815, 0.4939968, 1.940675, 1, 1, 1, 1, 1,
0.7698495, 0.3059776, 2.073496, 1, 1, 1, 1, 1,
0.7716963, 2.309267, -0.04225237, 1, 1, 1, 1, 1,
0.7818804, -1.029667, 0.5291426, 0, 0, 1, 1, 1,
0.7880915, -1.319993, 3.081577, 1, 0, 0, 1, 1,
0.7889441, 0.3430594, 2.092326, 1, 0, 0, 1, 1,
0.7900366, -0.2160957, 1.481324, 1, 0, 0, 1, 1,
0.7954843, 0.3173941, 2.153977, 1, 0, 0, 1, 1,
0.7974322, 0.1511807, 0.4982321, 1, 0, 0, 1, 1,
0.7979535, 0.829716, 1.528903, 0, 0, 0, 1, 1,
0.8022395, -0.690745, 2.798921, 0, 0, 0, 1, 1,
0.8047012, -1.150419, 1.598154, 0, 0, 0, 1, 1,
0.8068905, -0.6689985, 0.4484174, 0, 0, 0, 1, 1,
0.8122921, -0.5428923, 3.869681, 0, 0, 0, 1, 1,
0.8167164, -2.042875, 2.057611, 0, 0, 0, 1, 1,
0.8212897, 0.08366244, 3.201758, 0, 0, 0, 1, 1,
0.8301737, -0.1957138, 2.005448, 1, 1, 1, 1, 1,
0.8319842, 0.5825174, 1.426521, 1, 1, 1, 1, 1,
0.8325077, 1.091943, -0.4452131, 1, 1, 1, 1, 1,
0.8475972, -0.2495878, 2.898826, 1, 1, 1, 1, 1,
0.8507262, 1.530034, 2.387278, 1, 1, 1, 1, 1,
0.8532401, 0.6775388, 1.773937, 1, 1, 1, 1, 1,
0.854512, -0.2221404, 2.667898, 1, 1, 1, 1, 1,
0.8574415, -0.5185176, 3.136118, 1, 1, 1, 1, 1,
0.8585342, 1.347233, 0.3002198, 1, 1, 1, 1, 1,
0.8649335, 1.137677, 0.6296168, 1, 1, 1, 1, 1,
0.8662912, 0.3893351, 0.6229235, 1, 1, 1, 1, 1,
0.8690497, 0.2177088, 0.8347686, 1, 1, 1, 1, 1,
0.8848746, -0.8800968, 2.477206, 1, 1, 1, 1, 1,
0.8865541, -0.8421054, 1.441617, 1, 1, 1, 1, 1,
0.8872719, -0.2428264, -0.2471527, 1, 1, 1, 1, 1,
0.8895707, -1.984294, 2.303859, 0, 0, 1, 1, 1,
0.889788, -1.55239, 3.767963, 1, 0, 0, 1, 1,
0.8924776, -0.7756493, 3.773777, 1, 0, 0, 1, 1,
0.8978134, -0.2187546, 1.008556, 1, 0, 0, 1, 1,
0.89796, -1.070095, 1.843454, 1, 0, 0, 1, 1,
0.9036795, 0.7749848, 0.9013464, 1, 0, 0, 1, 1,
0.9174488, 1.022408, 1.23385, 0, 0, 0, 1, 1,
0.9212897, 1.274378, 1.323686, 0, 0, 0, 1, 1,
0.9281177, 0.5966421, 1.406249, 0, 0, 0, 1, 1,
0.9312056, -0.04598144, 2.642683, 0, 0, 0, 1, 1,
0.9338556, -0.3984722, 3.803115, 0, 0, 0, 1, 1,
0.9358597, -0.6985387, 1.693534, 0, 0, 0, 1, 1,
0.9421345, -0.2505737, 3.288662, 0, 0, 0, 1, 1,
0.9433528, -0.1045576, 0.3081775, 1, 1, 1, 1, 1,
0.9441056, 0.8953847, 0.6067919, 1, 1, 1, 1, 1,
0.9444081, -0.3887754, 2.339595, 1, 1, 1, 1, 1,
0.9452119, 0.1605439, 1.390076, 1, 1, 1, 1, 1,
0.9457742, -2.198107, 2.865132, 1, 1, 1, 1, 1,
0.9477811, 1.528467, 1.095383, 1, 1, 1, 1, 1,
0.9494563, 0.6639134, 0.3612383, 1, 1, 1, 1, 1,
0.9530711, 1.090083, 1.628042, 1, 1, 1, 1, 1,
0.953274, -0.07080483, 1.719615, 1, 1, 1, 1, 1,
0.9571418, 1.454778, -0.7182721, 1, 1, 1, 1, 1,
0.9633581, 0.3250383, -1.793219, 1, 1, 1, 1, 1,
0.9663291, 1.540633, -0.4059104, 1, 1, 1, 1, 1,
0.9671956, 1.629212, -0.6262832, 1, 1, 1, 1, 1,
0.9681385, -0.124703, 0.7780976, 1, 1, 1, 1, 1,
0.9710969, -0.7803957, 2.906132, 1, 1, 1, 1, 1,
0.9720808, -0.7654206, 1.012658, 0, 0, 1, 1, 1,
0.9741108, -0.4109542, 2.054264, 1, 0, 0, 1, 1,
0.9780311, 0.7380381, 2.379405, 1, 0, 0, 1, 1,
0.9807705, -1.481969, 3.526538, 1, 0, 0, 1, 1,
0.9825842, 0.3028181, 2.465257, 1, 0, 0, 1, 1,
0.9936174, 0.6158258, 0.3179102, 1, 0, 0, 1, 1,
1.005111, -0.1527639, 1.778535, 0, 0, 0, 1, 1,
1.01009, -0.09036046, 1.437745, 0, 0, 0, 1, 1,
1.011995, -0.2744563, 1.182363, 0, 0, 0, 1, 1,
1.014068, -0.9840739, 2.359004, 0, 0, 0, 1, 1,
1.021481, 2.298019, -0.4903671, 0, 0, 0, 1, 1,
1.021761, 1.116289, 1.121035, 0, 0, 0, 1, 1,
1.030292, -0.8085741, 1.446711, 0, 0, 0, 1, 1,
1.032595, 1.040731, 0.5495783, 1, 1, 1, 1, 1,
1.041588, -0.1709851, 2.286856, 1, 1, 1, 1, 1,
1.043727, -1.385522, 1.864537, 1, 1, 1, 1, 1,
1.046089, 1.469641, -0.6824586, 1, 1, 1, 1, 1,
1.063849, -0.7308378, 0.9544885, 1, 1, 1, 1, 1,
1.068271, -0.9931475, 2.380082, 1, 1, 1, 1, 1,
1.070614, 0.2461774, 0.6727937, 1, 1, 1, 1, 1,
1.072011, 1.067412, -0.4160111, 1, 1, 1, 1, 1,
1.083872, 1.056262, 0.7628867, 1, 1, 1, 1, 1,
1.085515, 1.125141, 0.8829544, 1, 1, 1, 1, 1,
1.096688, -0.1626301, 1.60643, 1, 1, 1, 1, 1,
1.103711, -1.607024, 2.220006, 1, 1, 1, 1, 1,
1.114783, 0.7148786, 0.6705001, 1, 1, 1, 1, 1,
1.121485, -0.2467437, 0.3641457, 1, 1, 1, 1, 1,
1.123317, 0.4402272, -0.2168675, 1, 1, 1, 1, 1,
1.125436, 0.6096002, 0.7558757, 0, 0, 1, 1, 1,
1.127497, -0.4712965, 2.61069, 1, 0, 0, 1, 1,
1.127777, 0.6057882, 0.2326427, 1, 0, 0, 1, 1,
1.128696, 0.6907741, 1.174407, 1, 0, 0, 1, 1,
1.14312, 1.825235, -1.977747, 1, 0, 0, 1, 1,
1.144198, -0.3331389, 2.626972, 1, 0, 0, 1, 1,
1.14791, 0.3022285, 0.5685462, 0, 0, 0, 1, 1,
1.158224, 1.181878, 3.121876, 0, 0, 0, 1, 1,
1.162496, 0.4700477, 0.1286739, 0, 0, 0, 1, 1,
1.172462, -1.273219, 2.887883, 0, 0, 0, 1, 1,
1.177086, 0.5754682, 0.8268951, 0, 0, 0, 1, 1,
1.179193, -0.6969184, 2.853686, 0, 0, 0, 1, 1,
1.180277, -0.3667524, 1.244914, 0, 0, 0, 1, 1,
1.192134, 0.1702327, 1.575713, 1, 1, 1, 1, 1,
1.195142, -0.2185597, 2.25294, 1, 1, 1, 1, 1,
1.197376, -0.007920216, 3.399925, 1, 1, 1, 1, 1,
1.200545, 0.4484045, 3.873687, 1, 1, 1, 1, 1,
1.202599, -2.161059, 2.05462, 1, 1, 1, 1, 1,
1.213295, 2.118888, 2.171044, 1, 1, 1, 1, 1,
1.2144, -1.169928, 2.0804, 1, 1, 1, 1, 1,
1.221059, -0.7514976, 2.260607, 1, 1, 1, 1, 1,
1.24332, -0.2215568, 3.4221, 1, 1, 1, 1, 1,
1.244108, 0.1866305, 0.7558916, 1, 1, 1, 1, 1,
1.245057, 1.242516, 1.918711, 1, 1, 1, 1, 1,
1.248805, 0.6209055, 3.334538, 1, 1, 1, 1, 1,
1.258078, 1.293273, 0.9628903, 1, 1, 1, 1, 1,
1.269302, 1.062128, 1.460856, 1, 1, 1, 1, 1,
1.273741, 2.659139, 0.02470089, 1, 1, 1, 1, 1,
1.274123, -0.6073358, 4.009631, 0, 0, 1, 1, 1,
1.276446, -1.47089, 3.598331, 1, 0, 0, 1, 1,
1.277246, 0.9555085, 1.477539, 1, 0, 0, 1, 1,
1.284006, 1.426327, -0.06441128, 1, 0, 0, 1, 1,
1.284597, 0.2200768, 1.320442, 1, 0, 0, 1, 1,
1.285734, 0.7950386, 2.140618, 1, 0, 0, 1, 1,
1.291884, 0.9593339, 0.9172627, 0, 0, 0, 1, 1,
1.299557, 0.928487, 1.264452, 0, 0, 0, 1, 1,
1.315846, 0.6915668, -1.597534, 0, 0, 0, 1, 1,
1.321434, 0.7208112, 2.913685, 0, 0, 0, 1, 1,
1.326085, -0.5345629, 1.556735, 0, 0, 0, 1, 1,
1.334526, 0.05892409, 1.391156, 0, 0, 0, 1, 1,
1.342914, -0.2990819, 0.1100184, 0, 0, 0, 1, 1,
1.347901, 0.3405291, 1.091727, 1, 1, 1, 1, 1,
1.357624, 0.5245112, 0.764234, 1, 1, 1, 1, 1,
1.365169, -0.8139321, -0.005628505, 1, 1, 1, 1, 1,
1.380958, 1.1722, 1.322646, 1, 1, 1, 1, 1,
1.381874, 0.1767028, -0.694846, 1, 1, 1, 1, 1,
1.3838, 0.4076697, -0.8492697, 1, 1, 1, 1, 1,
1.387201, -0.08801965, 1.735183, 1, 1, 1, 1, 1,
1.41499, -2.096137, 3.139752, 1, 1, 1, 1, 1,
1.417579, 0.3178929, 0.1246038, 1, 1, 1, 1, 1,
1.422713, -0.1619525, 3.196674, 1, 1, 1, 1, 1,
1.432297, -0.3157807, 4.039897, 1, 1, 1, 1, 1,
1.437145, 0.5698127, 0.7839525, 1, 1, 1, 1, 1,
1.439253, 0.3221909, 2.80424, 1, 1, 1, 1, 1,
1.444763, 0.8929473, 0.6270608, 1, 1, 1, 1, 1,
1.447407, -0.2188763, 1.987872, 1, 1, 1, 1, 1,
1.45306, -0.5136061, 3.7861, 0, 0, 1, 1, 1,
1.46337, 1.674561, 0.9385151, 1, 0, 0, 1, 1,
1.466967, -0.9785509, 3.515851, 1, 0, 0, 1, 1,
1.472993, -0.5673609, 1.466208, 1, 0, 0, 1, 1,
1.473237, -0.5908068, 2.429178, 1, 0, 0, 1, 1,
1.491585, -0.3101735, 1.372238, 1, 0, 0, 1, 1,
1.501945, -0.142042, 1.054311, 0, 0, 0, 1, 1,
1.503907, 0.4581284, 0.3441134, 0, 0, 0, 1, 1,
1.508453, -0.1298157, 3.513856, 0, 0, 0, 1, 1,
1.521846, -1.843395, 3.347416, 0, 0, 0, 1, 1,
1.528081, -0.1251788, -0.5218884, 0, 0, 0, 1, 1,
1.528141, 1.000765, 1.139249, 0, 0, 0, 1, 1,
1.535595, 0.2567745, 2.045431, 0, 0, 0, 1, 1,
1.537346, 1.413177, 0.9914233, 1, 1, 1, 1, 1,
1.540454, 0.01105318, 0.6170053, 1, 1, 1, 1, 1,
1.543782, 0.8166605, 0.9876807, 1, 1, 1, 1, 1,
1.557885, -1.020187, 3.451011, 1, 1, 1, 1, 1,
1.559797, -0.7507331, 0.7137045, 1, 1, 1, 1, 1,
1.571016, -0.9253923, 2.902264, 1, 1, 1, 1, 1,
1.58712, -2.602365, 2.295198, 1, 1, 1, 1, 1,
1.593817, 1.323295, 1.500957, 1, 1, 1, 1, 1,
1.617171, 0.9428703, 0.6825458, 1, 1, 1, 1, 1,
1.625333, 0.9053918, 2.308965, 1, 1, 1, 1, 1,
1.643321, 0.6194412, 1.775464, 1, 1, 1, 1, 1,
1.643394, 1.393297, 1.115504, 1, 1, 1, 1, 1,
1.661713, -1.34955, 2.015685, 1, 1, 1, 1, 1,
1.666181, -0.655534, 3.280368, 1, 1, 1, 1, 1,
1.670137, -1.037852, 1.893456, 1, 1, 1, 1, 1,
1.696409, 0.02030997, 0.3486162, 0, 0, 1, 1, 1,
1.707315, -2.006041, 3.38702, 1, 0, 0, 1, 1,
1.707521, -0.6406206, 1.079235, 1, 0, 0, 1, 1,
1.709437, -0.8197695, 2.602763, 1, 0, 0, 1, 1,
1.720252, -0.8899795, 1.568209, 1, 0, 0, 1, 1,
1.720504, 1.031153, 1.095201, 1, 0, 0, 1, 1,
1.731589, 1.502538, 0.8274681, 0, 0, 0, 1, 1,
1.742471, 1.063087, 0.1735142, 0, 0, 0, 1, 1,
1.755919, -0.3095842, 1.292529, 0, 0, 0, 1, 1,
1.776532, -1.064432, 2.457472, 0, 0, 0, 1, 1,
1.790332, -0.7894247, 2.55303, 0, 0, 0, 1, 1,
1.793523, -0.8346421, 0.7090513, 0, 0, 0, 1, 1,
1.798534, -0.6461961, 1.626028, 0, 0, 0, 1, 1,
1.830422, 1.013457, 1.373593, 1, 1, 1, 1, 1,
1.833791, -1.34308, 1.890075, 1, 1, 1, 1, 1,
1.838603, 0.1408692, -0.2224174, 1, 1, 1, 1, 1,
1.842265, 0.2063721, 2.022508, 1, 1, 1, 1, 1,
1.853059, -0.5979779, 4.693782, 1, 1, 1, 1, 1,
1.858743, -0.5747703, 2.054925, 1, 1, 1, 1, 1,
1.880551, -0.384147, 1.714912, 1, 1, 1, 1, 1,
1.888475, -0.8123616, 1.059912, 1, 1, 1, 1, 1,
1.891431, -2.167264, 1.647704, 1, 1, 1, 1, 1,
1.922052, 1.077873, -0.4693337, 1, 1, 1, 1, 1,
1.936989, 0.6211873, 2.620491, 1, 1, 1, 1, 1,
1.948772, 1.63347, 2.262747, 1, 1, 1, 1, 1,
1.955686, -0.6816131, 2.595876, 1, 1, 1, 1, 1,
2.011224, 1.512512, 1.077353, 1, 1, 1, 1, 1,
2.03093, 0.3000513, 1.609844, 1, 1, 1, 1, 1,
2.032798, 0.5605552, 0.3389315, 0, 0, 1, 1, 1,
2.035548, 0.4001147, 1.017553, 1, 0, 0, 1, 1,
2.052766, 0.2373525, 0.5007439, 1, 0, 0, 1, 1,
2.077697, -1.534345, 2.232887, 1, 0, 0, 1, 1,
2.106516, -0.8514693, 0.2784835, 1, 0, 0, 1, 1,
2.116106, -0.2289159, 2.499383, 1, 0, 0, 1, 1,
2.146622, -0.4686508, -0.09549652, 0, 0, 0, 1, 1,
2.16142, 1.851132, -0.578093, 0, 0, 0, 1, 1,
2.210224, -0.3452767, 0.1740362, 0, 0, 0, 1, 1,
2.234006, 0.7367357, 3.755997, 0, 0, 0, 1, 1,
2.277124, 1.298158, 0.8762021, 0, 0, 0, 1, 1,
2.292159, -0.7912098, 2.126675, 0, 0, 0, 1, 1,
2.342604, -0.8535731, 2.675516, 0, 0, 0, 1, 1,
2.621952, 0.2919833, 0.3454537, 1, 1, 1, 1, 1,
2.624992, 0.5258966, 0.6852987, 1, 1, 1, 1, 1,
2.664293, 0.3852502, 0.05782403, 1, 1, 1, 1, 1,
2.711583, -0.4999215, 1.877595, 1, 1, 1, 1, 1,
2.769576, 0.256877, 1.799959, 1, 1, 1, 1, 1,
3.009582, 0.8703406, -0.5442317, 1, 1, 1, 1, 1,
3.032387, 0.9141863, 1.236683, 1, 1, 1, 1, 1
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
var radius = 9.830073;
var distance = 34.52771;
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
mvMatrix.translate( 0.3009348, 0.1089065, 0.0329926 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.52771);
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