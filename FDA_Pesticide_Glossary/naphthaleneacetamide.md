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
-3.103729, -0.8503464, -0.02791173, 1, 0, 0, 1,
-2.87638, 0.1334645, -0.9725773, 1, 0.007843138, 0, 1,
-2.857901, -0.4928091, -1.562844, 1, 0.01176471, 0, 1,
-2.806014, 0.8742123, -2.141106, 1, 0.01960784, 0, 1,
-2.674989, -0.8103768, -1.654436, 1, 0.02352941, 0, 1,
-2.587783, -1.595375, -1.58398, 1, 0.03137255, 0, 1,
-2.578402, -0.1458358, -2.284847, 1, 0.03529412, 0, 1,
-2.539907, -2.879644, -2.690722, 1, 0.04313726, 0, 1,
-2.318984, -1.424458, -3.258203, 1, 0.04705882, 0, 1,
-2.303316, 1.260219, -0.7263669, 1, 0.05490196, 0, 1,
-2.263085, 0.4904994, -2.286924, 1, 0.05882353, 0, 1,
-2.262743, -0.3044048, -1.490711, 1, 0.06666667, 0, 1,
-2.262154, -0.693014, -2.788296, 1, 0.07058824, 0, 1,
-2.221268, -0.05310548, -1.464719, 1, 0.07843138, 0, 1,
-2.206834, -1.779294, -1.163768, 1, 0.08235294, 0, 1,
-2.204206, 1.029687, -0.9403461, 1, 0.09019608, 0, 1,
-2.199564, -0.9359105, -2.962774, 1, 0.09411765, 0, 1,
-2.003621, 0.2452798, -1.038279, 1, 0.1019608, 0, 1,
-1.994715, 0.3941098, -2.85799, 1, 0.1098039, 0, 1,
-1.982444, 0.1667129, -2.536443, 1, 0.1137255, 0, 1,
-1.962265, -1.399085, -0.5243597, 1, 0.1215686, 0, 1,
-1.952616, -1.383305, -2.413929, 1, 0.1254902, 0, 1,
-1.951379, -0.3849944, -2.188123, 1, 0.1333333, 0, 1,
-1.91964, -0.8655646, -1.173838, 1, 0.1372549, 0, 1,
-1.89688, 0.1304572, -1.172328, 1, 0.145098, 0, 1,
-1.833522, 0.4184374, -0.401106, 1, 0.1490196, 0, 1,
-1.822516, 1.786796, -0.9206221, 1, 0.1568628, 0, 1,
-1.815925, 0.1556398, -0.5199413, 1, 0.1607843, 0, 1,
-1.81469, 1.452322, -0.4440532, 1, 0.1686275, 0, 1,
-1.805713, -0.5688981, -2.368487, 1, 0.172549, 0, 1,
-1.80138, -0.4259003, -1.814747, 1, 0.1803922, 0, 1,
-1.791505, 0.3816769, -1.476988, 1, 0.1843137, 0, 1,
-1.785613, -1.335042, -2.00779, 1, 0.1921569, 0, 1,
-1.781354, 1.938502, -0.5127553, 1, 0.1960784, 0, 1,
-1.775623, -1.9122, -2.637042, 1, 0.2039216, 0, 1,
-1.766926, -0.3503921, -1.600356, 1, 0.2117647, 0, 1,
-1.76266, -1.586097, -0.9651882, 1, 0.2156863, 0, 1,
-1.734749, 1.938509, -0.07273496, 1, 0.2235294, 0, 1,
-1.720533, 0.5675361, -1.310524, 1, 0.227451, 0, 1,
-1.719362, -0.07041235, -2.525491, 1, 0.2352941, 0, 1,
-1.695377, 0.201098, 1.234306, 1, 0.2392157, 0, 1,
-1.674302, -2.585296, -3.243872, 1, 0.2470588, 0, 1,
-1.668836, -1.757933, -1.497799, 1, 0.2509804, 0, 1,
-1.661062, 0.1656338, -1.763015, 1, 0.2588235, 0, 1,
-1.655195, 0.3057776, -0.6114617, 1, 0.2627451, 0, 1,
-1.650485, -0.7733902, -1.321997, 1, 0.2705882, 0, 1,
-1.636384, 0.9526315, -1.379164, 1, 0.2745098, 0, 1,
-1.631544, -2.264595, -3.449715, 1, 0.282353, 0, 1,
-1.605105, 0.159087, -2.510917, 1, 0.2862745, 0, 1,
-1.577345, 0.8788711, -1.561529, 1, 0.2941177, 0, 1,
-1.567192, 0.9786208, 0.3527007, 1, 0.3019608, 0, 1,
-1.566522, -0.1981605, 0.9942522, 1, 0.3058824, 0, 1,
-1.557044, -1.334129, -3.296251, 1, 0.3137255, 0, 1,
-1.544144, 2.081727, 0.4175526, 1, 0.3176471, 0, 1,
-1.543949, 0.4305839, 0.02789298, 1, 0.3254902, 0, 1,
-1.524096, -0.06642544, -1.216356, 1, 0.3294118, 0, 1,
-1.523823, -1.73228, -0.7907432, 1, 0.3372549, 0, 1,
-1.5235, 0.9091845, -0.3042178, 1, 0.3411765, 0, 1,
-1.520406, -0.6491616, -2.307994, 1, 0.3490196, 0, 1,
-1.516165, 0.7260444, -0.5766489, 1, 0.3529412, 0, 1,
-1.509284, -2.335407, -1.731524, 1, 0.3607843, 0, 1,
-1.507115, -0.5137245, -1.660399, 1, 0.3647059, 0, 1,
-1.501311, 1.136507, -0.8950217, 1, 0.372549, 0, 1,
-1.491835, -0.3349801, -2.076073, 1, 0.3764706, 0, 1,
-1.485786, -2.607774, -3.348161, 1, 0.3843137, 0, 1,
-1.479213, -0.2001867, -1.019079, 1, 0.3882353, 0, 1,
-1.477529, 1.084559, -0.09094594, 1, 0.3960784, 0, 1,
-1.476964, -0.3450393, -2.174034, 1, 0.4039216, 0, 1,
-1.463077, 0.7629392, -0.07255921, 1, 0.4078431, 0, 1,
-1.457269, -1.463987, -0.8050078, 1, 0.4156863, 0, 1,
-1.454971, -0.5853733, -1.614543, 1, 0.4196078, 0, 1,
-1.440277, -0.490701, -0.681687, 1, 0.427451, 0, 1,
-1.43172, -0.1907967, -1.374246, 1, 0.4313726, 0, 1,
-1.43141, 0.8355012, -1.500991, 1, 0.4392157, 0, 1,
-1.427472, 2.593032, 0.480742, 1, 0.4431373, 0, 1,
-1.426345, 0.8375973, -2.115949, 1, 0.4509804, 0, 1,
-1.412276, -0.8205532, -1.636598, 1, 0.454902, 0, 1,
-1.402266, -1.091192, -1.318918, 1, 0.4627451, 0, 1,
-1.399788, 0.6509439, 0.5144081, 1, 0.4666667, 0, 1,
-1.391416, 0.37514, -1.405077, 1, 0.4745098, 0, 1,
-1.380813, -1.807928, -2.156877, 1, 0.4784314, 0, 1,
-1.365181, -1.326498, -1.525279, 1, 0.4862745, 0, 1,
-1.362464, 1.503305, 0.5386024, 1, 0.4901961, 0, 1,
-1.357826, 0.03949057, -1.952879, 1, 0.4980392, 0, 1,
-1.331176, 0.6015854, -1.351955, 1, 0.5058824, 0, 1,
-1.325281, -0.3281803, 0.212616, 1, 0.509804, 0, 1,
-1.313067, 0.8558051, -1.951256, 1, 0.5176471, 0, 1,
-1.312983, 0.9390984, -0.8541891, 1, 0.5215687, 0, 1,
-1.312419, -0.7871864, -1.268472, 1, 0.5294118, 0, 1,
-1.309441, 2.785536, 0.109897, 1, 0.5333334, 0, 1,
-1.308034, 0.1716009, -3.08621, 1, 0.5411765, 0, 1,
-1.295717, 0.2477637, -0.3019346, 1, 0.5450981, 0, 1,
-1.293295, -0.4408607, -1.222144, 1, 0.5529412, 0, 1,
-1.273016, 0.8967121, -0.9998456, 1, 0.5568628, 0, 1,
-1.272158, -1.405243, -2.724138, 1, 0.5647059, 0, 1,
-1.265518, 0.003972532, -0.3473559, 1, 0.5686275, 0, 1,
-1.24971, -0.9055272, -1.198033, 1, 0.5764706, 0, 1,
-1.247708, 0.8910282, -1.257014, 1, 0.5803922, 0, 1,
-1.236912, 0.9600617, -1.599317, 1, 0.5882353, 0, 1,
-1.233559, 0.9947833, -1.493537, 1, 0.5921569, 0, 1,
-1.231591, 1.880115, -0.09570307, 1, 0.6, 0, 1,
-1.228323, 0.5272852, -0.5862541, 1, 0.6078432, 0, 1,
-1.224346, 0.555342, -0.4727043, 1, 0.6117647, 0, 1,
-1.21553, 1.031697, -0.9348377, 1, 0.6196079, 0, 1,
-1.209595, 0.2351095, -1.381081, 1, 0.6235294, 0, 1,
-1.207196, -0.05492957, -2.646347, 1, 0.6313726, 0, 1,
-1.203897, -1.441398, -3.943434, 1, 0.6352941, 0, 1,
-1.200086, -0.6794628, -2.483427, 1, 0.6431373, 0, 1,
-1.192806, -0.6080719, 0.05113737, 1, 0.6470588, 0, 1,
-1.186131, 0.9164737, 0.2286308, 1, 0.654902, 0, 1,
-1.18599, 0.3330748, -2.346708, 1, 0.6588235, 0, 1,
-1.185754, 0.2811319, -0.6868495, 1, 0.6666667, 0, 1,
-1.185581, -0.6119757, -1.156991, 1, 0.6705883, 0, 1,
-1.17983, -0.2124577, -0.7101753, 1, 0.6784314, 0, 1,
-1.178618, 0.3272264, -1.959086, 1, 0.682353, 0, 1,
-1.178153, -0.1542555, -1.524031, 1, 0.6901961, 0, 1,
-1.178068, -0.5565486, -1.45171, 1, 0.6941177, 0, 1,
-1.176853, 0.9989817, -2.002522, 1, 0.7019608, 0, 1,
-1.172982, -0.0435195, -2.254555, 1, 0.7098039, 0, 1,
-1.167792, -0.854711, -2.684794, 1, 0.7137255, 0, 1,
-1.165172, 0.2694223, -2.517734, 1, 0.7215686, 0, 1,
-1.155751, 1.574392, 0.6292395, 1, 0.7254902, 0, 1,
-1.151773, 0.2386955, -0.9050772, 1, 0.7333333, 0, 1,
-1.146969, -0.2773264, -1.964636, 1, 0.7372549, 0, 1,
-1.138118, 1.560153, -1.762114, 1, 0.7450981, 0, 1,
-1.136381, 0.6673657, -2.803749, 1, 0.7490196, 0, 1,
-1.131324, 0.223969, -1.524711, 1, 0.7568628, 0, 1,
-1.128402, 0.9218443, -1.463512, 1, 0.7607843, 0, 1,
-1.126986, -1.31194, -2.084787, 1, 0.7686275, 0, 1,
-1.12463, -1.485364, -3.013032, 1, 0.772549, 0, 1,
-1.123175, -0.4275827, -1.306685, 1, 0.7803922, 0, 1,
-1.119721, -1.649592, -1.746454, 1, 0.7843137, 0, 1,
-1.116515, 1.808299, -2.340613, 1, 0.7921569, 0, 1,
-1.107736, -0.4518411, -1.952148, 1, 0.7960784, 0, 1,
-1.107274, -0.8651478, -3.271792, 1, 0.8039216, 0, 1,
-1.101173, -0.5285644, -2.996661, 1, 0.8117647, 0, 1,
-1.090932, 0.0211941, -3.376357, 1, 0.8156863, 0, 1,
-1.086939, -0.3178877, -1.900727, 1, 0.8235294, 0, 1,
-1.08599, -0.5851887, -3.802853, 1, 0.827451, 0, 1,
-1.083326, 0.802718, -1.077604, 1, 0.8352941, 0, 1,
-1.067498, 0.4499393, -0.8803738, 1, 0.8392157, 0, 1,
-1.064937, -0.8798143, -2.669298, 1, 0.8470588, 0, 1,
-1.063464, -1.207693, -3.279963, 1, 0.8509804, 0, 1,
-1.052267, -0.7603397, -1.676919, 1, 0.8588235, 0, 1,
-1.043175, 0.1410129, -2.160823, 1, 0.8627451, 0, 1,
-1.039258, 0.08544932, 0.3329888, 1, 0.8705882, 0, 1,
-1.025625, 0.1758344, -1.137346, 1, 0.8745098, 0, 1,
-1.021758, 1.251969, -0.09831884, 1, 0.8823529, 0, 1,
-1.020947, -0.06656682, -1.606802, 1, 0.8862745, 0, 1,
-1.018667, -0.09437887, -2.554377, 1, 0.8941177, 0, 1,
-1.014126, 1.026127, -1.089592, 1, 0.8980392, 0, 1,
-1.003555, -0.8559835, -1.926069, 1, 0.9058824, 0, 1,
-0.9897131, 0.4773893, -0.4172209, 1, 0.9137255, 0, 1,
-0.9885058, 0.1042425, -0.6393599, 1, 0.9176471, 0, 1,
-0.9702262, -0.6204019, -2.312593, 1, 0.9254902, 0, 1,
-0.9631139, -0.7828906, -3.419297, 1, 0.9294118, 0, 1,
-0.9615918, 0.1865869, -2.995978, 1, 0.9372549, 0, 1,
-0.9602892, 1.081582, -2.447193, 1, 0.9411765, 0, 1,
-0.9581376, -0.5530923, -2.399908, 1, 0.9490196, 0, 1,
-0.950712, 1.681278, 0.5073264, 1, 0.9529412, 0, 1,
-0.933531, -0.05147422, 0.515673, 1, 0.9607843, 0, 1,
-0.9314442, 0.5597244, -0.7324625, 1, 0.9647059, 0, 1,
-0.9155111, -0.4079849, -1.60874, 1, 0.972549, 0, 1,
-0.9086909, 0.4121017, 0.0915779, 1, 0.9764706, 0, 1,
-0.9036541, -1.491678, -4.50519, 1, 0.9843137, 0, 1,
-0.9004034, 0.1619033, -1.505969, 1, 0.9882353, 0, 1,
-0.8967322, -1.788849, -2.769001, 1, 0.9960784, 0, 1,
-0.8906063, -0.4782987, -3.56173, 0.9960784, 1, 0, 1,
-0.8872623, 0.5536266, -1.762393, 0.9921569, 1, 0, 1,
-0.8800377, 0.1452374, -3.12642, 0.9843137, 1, 0, 1,
-0.8775585, -0.3303285, -1.628509, 0.9803922, 1, 0, 1,
-0.8762127, 0.6642595, -1.24842, 0.972549, 1, 0, 1,
-0.8740368, 0.902109, -1.365848, 0.9686275, 1, 0, 1,
-0.8670998, 0.6564066, -1.009662, 0.9607843, 1, 0, 1,
-0.8597994, -0.2805225, -2.635261, 0.9568627, 1, 0, 1,
-0.8592807, 0.7239667, -1.451659, 0.9490196, 1, 0, 1,
-0.8589217, 0.1574339, -0.07536643, 0.945098, 1, 0, 1,
-0.8581467, -0.8993785, -3.223759, 0.9372549, 1, 0, 1,
-0.8543118, -0.3723051, -1.238693, 0.9333333, 1, 0, 1,
-0.8514206, 1.535015, -1.688387, 0.9254902, 1, 0, 1,
-0.8450075, 1.60641, -0.4835711, 0.9215686, 1, 0, 1,
-0.8435683, 0.2169098, -1.820337, 0.9137255, 1, 0, 1,
-0.8429167, -1.253906, -0.9399922, 0.9098039, 1, 0, 1,
-0.8412043, -0.5790127, -2.24814, 0.9019608, 1, 0, 1,
-0.8334476, -2.197663, -2.610073, 0.8941177, 1, 0, 1,
-0.8320549, -0.06789391, -1.522222, 0.8901961, 1, 0, 1,
-0.8319827, -2.084079, -1.097878, 0.8823529, 1, 0, 1,
-0.8318918, 1.565538, -1.729742, 0.8784314, 1, 0, 1,
-0.8304168, -0.4946252, -2.436959, 0.8705882, 1, 0, 1,
-0.8301558, 1.183179, 0.07718621, 0.8666667, 1, 0, 1,
-0.8259558, 1.427937, -0.2275476, 0.8588235, 1, 0, 1,
-0.8233771, 0.9623742, -0.7340122, 0.854902, 1, 0, 1,
-0.8220029, -0.8592622, -3.78156, 0.8470588, 1, 0, 1,
-0.8204238, -0.9042088, -2.656837, 0.8431373, 1, 0, 1,
-0.8141959, 1.303324, -0.1786478, 0.8352941, 1, 0, 1,
-0.8130098, -1.351365, -4.664564, 0.8313726, 1, 0, 1,
-0.8123827, 0.2242661, -1.003603, 0.8235294, 1, 0, 1,
-0.8105252, 0.5056785, -2.320873, 0.8196079, 1, 0, 1,
-0.8005612, 0.6443591, -1.469, 0.8117647, 1, 0, 1,
-0.7964155, -0.3302126, -1.542947, 0.8078431, 1, 0, 1,
-0.79624, 0.1433076, -1.921669, 0.8, 1, 0, 1,
-0.7948481, 1.350631, 0.6561248, 0.7921569, 1, 0, 1,
-0.7833061, -0.1798729, -1.963719, 0.7882353, 1, 0, 1,
-0.7828448, 2.223992, -0.6023164, 0.7803922, 1, 0, 1,
-0.7821012, -1.101929, -0.8522651, 0.7764706, 1, 0, 1,
-0.7790674, -0.2591896, -0.7279088, 0.7686275, 1, 0, 1,
-0.7763405, -0.9790986, -2.516853, 0.7647059, 1, 0, 1,
-0.7747686, -0.1100679, -1.793751, 0.7568628, 1, 0, 1,
-0.7739094, -1.339966, -2.931796, 0.7529412, 1, 0, 1,
-0.7734079, -0.2057964, -3.379412, 0.7450981, 1, 0, 1,
-0.7724707, 0.8020807, -0.970395, 0.7411765, 1, 0, 1,
-0.7688554, 0.1058351, -0.7350729, 0.7333333, 1, 0, 1,
-0.7688493, -0.3274146, -2.081175, 0.7294118, 1, 0, 1,
-0.7680482, 0.1670906, -1.95989, 0.7215686, 1, 0, 1,
-0.7673495, 0.9523222, 0.12944, 0.7176471, 1, 0, 1,
-0.7672806, -0.04259077, -0.9851978, 0.7098039, 1, 0, 1,
-0.7620074, 0.01711603, -1.361004, 0.7058824, 1, 0, 1,
-0.7614117, -0.4532405, -2.46004, 0.6980392, 1, 0, 1,
-0.7584455, -0.2321716, -2.063119, 0.6901961, 1, 0, 1,
-0.7557942, -2.005708, -3.966171, 0.6862745, 1, 0, 1,
-0.7554358, -0.6940719, -3.566851, 0.6784314, 1, 0, 1,
-0.7544445, 0.0962871, 0.2341857, 0.6745098, 1, 0, 1,
-0.752501, -0.3751034, -1.575766, 0.6666667, 1, 0, 1,
-0.7509678, -1.223039, -3.529248, 0.6627451, 1, 0, 1,
-0.7480121, -0.9458539, -1.323897, 0.654902, 1, 0, 1,
-0.7437794, -0.2164486, -1.325751, 0.6509804, 1, 0, 1,
-0.7351658, -0.4612714, -2.238812, 0.6431373, 1, 0, 1,
-0.734075, -1.422903, -3.387799, 0.6392157, 1, 0, 1,
-0.7292796, -0.2060617, -3.082402, 0.6313726, 1, 0, 1,
-0.7284863, 1.027196, -1.903618, 0.627451, 1, 0, 1,
-0.7281005, -1.178612, -3.661432, 0.6196079, 1, 0, 1,
-0.7266112, -0.4681343, -2.496343, 0.6156863, 1, 0, 1,
-0.7243716, -1.008608, -1.790779, 0.6078432, 1, 0, 1,
-0.7156402, -0.727828, -1.891746, 0.6039216, 1, 0, 1,
-0.7146168, 0.2026857, -1.025744, 0.5960785, 1, 0, 1,
-0.71456, -0.2711766, -3.083472, 0.5882353, 1, 0, 1,
-0.7144032, -0.371965, -2.834873, 0.5843138, 1, 0, 1,
-0.7142628, -0.7469427, -4.240445, 0.5764706, 1, 0, 1,
-0.7126727, 1.374927, -1.826011, 0.572549, 1, 0, 1,
-0.7124571, -1.120854, -2.584778, 0.5647059, 1, 0, 1,
-0.7066379, 0.1710294, -2.097033, 0.5607843, 1, 0, 1,
-0.7030594, 1.0628, -0.1217883, 0.5529412, 1, 0, 1,
-0.6946869, 0.6893066, 0.1049514, 0.5490196, 1, 0, 1,
-0.6934883, 0.4175814, 3.046911, 0.5411765, 1, 0, 1,
-0.6916341, -1.332363, -2.926772, 0.5372549, 1, 0, 1,
-0.6898794, -0.3678738, -2.337706, 0.5294118, 1, 0, 1,
-0.6807764, -1.100722, -1.505728, 0.5254902, 1, 0, 1,
-0.6792734, -3.372588, -3.81368, 0.5176471, 1, 0, 1,
-0.6782677, 1.312758, 0.1064991, 0.5137255, 1, 0, 1,
-0.676762, 0.7140378, -0.8193932, 0.5058824, 1, 0, 1,
-0.6715466, -0.7257211, -2.918851, 0.5019608, 1, 0, 1,
-0.6689142, 0.3418776, -1.850916, 0.4941176, 1, 0, 1,
-0.6609433, -0.2488729, -1.552711, 0.4862745, 1, 0, 1,
-0.6541551, -0.3186639, -1.418451, 0.4823529, 1, 0, 1,
-0.6531751, 1.869363, -0.7357486, 0.4745098, 1, 0, 1,
-0.6521901, -0.5165327, -3.024857, 0.4705882, 1, 0, 1,
-0.650081, -0.2015504, -1.670426, 0.4627451, 1, 0, 1,
-0.6486111, 1.665269, -0.7278713, 0.4588235, 1, 0, 1,
-0.6462535, -0.05670918, -2.14911, 0.4509804, 1, 0, 1,
-0.6449549, 0.04374163, -2.53569, 0.4470588, 1, 0, 1,
-0.6408981, 0.3342093, -0.9175865, 0.4392157, 1, 0, 1,
-0.6357213, 1.364594, -1.637211, 0.4352941, 1, 0, 1,
-0.6322752, -0.5764705, -2.028363, 0.427451, 1, 0, 1,
-0.6309633, -0.2519671, -1.239685, 0.4235294, 1, 0, 1,
-0.6307293, 1.58396, -1.979483, 0.4156863, 1, 0, 1,
-0.6306955, 0.9355037, -1.482516, 0.4117647, 1, 0, 1,
-0.6291679, 1.154298, -1.409694, 0.4039216, 1, 0, 1,
-0.6249205, -0.4296258, -1.160422, 0.3960784, 1, 0, 1,
-0.6156147, -0.9559645, -3.281058, 0.3921569, 1, 0, 1,
-0.6149645, 0.5038362, -2.412886, 0.3843137, 1, 0, 1,
-0.6133294, 1.014684, -0.6440916, 0.3803922, 1, 0, 1,
-0.6114497, 1.368615, -1.074138, 0.372549, 1, 0, 1,
-0.610691, -1.876313, -2.516255, 0.3686275, 1, 0, 1,
-0.6091924, -0.4869537, -1.322968, 0.3607843, 1, 0, 1,
-0.6081154, 0.3670533, -0.7952722, 0.3568628, 1, 0, 1,
-0.6064795, 0.7330601, -0.3012004, 0.3490196, 1, 0, 1,
-0.5990167, -0.836454, -1.195775, 0.345098, 1, 0, 1,
-0.5947262, -0.6218762, -2.010164, 0.3372549, 1, 0, 1,
-0.5918531, 0.904194, -0.6864668, 0.3333333, 1, 0, 1,
-0.5859269, 0.2381769, -1.364076, 0.3254902, 1, 0, 1,
-0.5811362, 0.318885, -1.160062, 0.3215686, 1, 0, 1,
-0.5757061, 0.7378665, 0.7167532, 0.3137255, 1, 0, 1,
-0.5679265, -0.8469325, -3.883093, 0.3098039, 1, 0, 1,
-0.567794, -1.311751, -2.868142, 0.3019608, 1, 0, 1,
-0.5660506, 0.3350671, -0.3724577, 0.2941177, 1, 0, 1,
-0.5637175, 0.4626996, -0.4215532, 0.2901961, 1, 0, 1,
-0.5600342, -0.3579561, -1.830468, 0.282353, 1, 0, 1,
-0.5586689, -0.5138807, -2.506069, 0.2784314, 1, 0, 1,
-0.5548133, -1.098807, -2.962037, 0.2705882, 1, 0, 1,
-0.5515187, -0.9975113, -1.881044, 0.2666667, 1, 0, 1,
-0.5486456, -0.8792907, -1.311446, 0.2588235, 1, 0, 1,
-0.5434519, -0.4276544, -2.310349, 0.254902, 1, 0, 1,
-0.5389329, -2.208189, -5.223909, 0.2470588, 1, 0, 1,
-0.5348366, -0.7318621, -2.058204, 0.2431373, 1, 0, 1,
-0.5196086, 0.4069075, -0.6741776, 0.2352941, 1, 0, 1,
-0.5152125, -0.3427058, -3.064816, 0.2313726, 1, 0, 1,
-0.5150549, -1.001638, -2.411016, 0.2235294, 1, 0, 1,
-0.5147924, 1.414545, -0.8811626, 0.2196078, 1, 0, 1,
-0.5139824, -0.7217086, -2.241189, 0.2117647, 1, 0, 1,
-0.5128734, 0.1840157, -2.387949, 0.2078431, 1, 0, 1,
-0.5127618, 1.496809, -1.251438, 0.2, 1, 0, 1,
-0.5076356, 1.007901, -2.422607, 0.1921569, 1, 0, 1,
-0.5055895, -1.343909, -4.201944, 0.1882353, 1, 0, 1,
-0.49888, 0.9028582, -0.3903354, 0.1803922, 1, 0, 1,
-0.4960659, -0.5851347, -1.841785, 0.1764706, 1, 0, 1,
-0.4949178, -1.270965, -3.969513, 0.1686275, 1, 0, 1,
-0.4946636, -0.1007474, -0.9841692, 0.1647059, 1, 0, 1,
-0.4940644, -2.10753, -2.548251, 0.1568628, 1, 0, 1,
-0.4871697, 0.1126911, -0.8879171, 0.1529412, 1, 0, 1,
-0.4868306, -0.7477785, -3.110422, 0.145098, 1, 0, 1,
-0.4865567, 0.2657394, -1.888427, 0.1411765, 1, 0, 1,
-0.4863387, 0.8888317, -0.8661921, 0.1333333, 1, 0, 1,
-0.4842111, -1.252033, -3.008328, 0.1294118, 1, 0, 1,
-0.4771475, -1.602979, -3.571873, 0.1215686, 1, 0, 1,
-0.4756213, 1.033621, -0.7230334, 0.1176471, 1, 0, 1,
-0.4694843, 0.6621639, 0.4528815, 0.1098039, 1, 0, 1,
-0.4690977, 0.7982574, -1.848953, 0.1058824, 1, 0, 1,
-0.4674083, -0.6371959, -2.505, 0.09803922, 1, 0, 1,
-0.4654379, 1.239395, 0.356075, 0.09019608, 1, 0, 1,
-0.4621742, -0.3792844, -2.255486, 0.08627451, 1, 0, 1,
-0.4564205, 1.90076, -2.200811, 0.07843138, 1, 0, 1,
-0.453312, -0.7241281, -3.151866, 0.07450981, 1, 0, 1,
-0.4518777, 1.206673, -1.591946, 0.06666667, 1, 0, 1,
-0.4483019, -0.6111093, -3.362991, 0.0627451, 1, 0, 1,
-0.4470013, 0.2794668, -0.3960222, 0.05490196, 1, 0, 1,
-0.4465381, -1.610043, -1.718654, 0.05098039, 1, 0, 1,
-0.4444132, -1.26199, -2.364234, 0.04313726, 1, 0, 1,
-0.4443711, 0.8703356, -2.414352, 0.03921569, 1, 0, 1,
-0.4442455, -0.9846157, -3.286095, 0.03137255, 1, 0, 1,
-0.4422148, 0.02334081, -1.380749, 0.02745098, 1, 0, 1,
-0.4420455, -0.885906, -3.384445, 0.01960784, 1, 0, 1,
-0.4412391, 1.222943, -0.2435993, 0.01568628, 1, 0, 1,
-0.428844, 1.438644, -1.040934, 0.007843138, 1, 0, 1,
-0.4280634, -0.7757279, -4.104426, 0.003921569, 1, 0, 1,
-0.4272034, 0.986378, -0.1707011, 0, 1, 0.003921569, 1,
-0.423139, -1.610154, -3.091857, 0, 1, 0.01176471, 1,
-0.4231015, 0.7225593, -0.2946981, 0, 1, 0.01568628, 1,
-0.420031, 1.030743, -2.120171, 0, 1, 0.02352941, 1,
-0.4176705, -0.8283808, -1.610561, 0, 1, 0.02745098, 1,
-0.4164931, 0.2382889, -0.8677562, 0, 1, 0.03529412, 1,
-0.416017, 1.337801, -0.4502287, 0, 1, 0.03921569, 1,
-0.4158146, 0.06516486, -1.467555, 0, 1, 0.04705882, 1,
-0.4145423, -0.2592305, -3.334894, 0, 1, 0.05098039, 1,
-0.4088091, 0.9663126, -1.484996, 0, 1, 0.05882353, 1,
-0.4049549, 1.628726, -0.5330852, 0, 1, 0.0627451, 1,
-0.4036114, -0.9376066, -3.015869, 0, 1, 0.07058824, 1,
-0.403017, 1.897772, -0.1030592, 0, 1, 0.07450981, 1,
-0.3965293, -0.5489232, -3.421508, 0, 1, 0.08235294, 1,
-0.3957498, 1.62088, -1.995672, 0, 1, 0.08627451, 1,
-0.3930135, 0.6887622, -1.814274, 0, 1, 0.09411765, 1,
-0.3903972, 1.344189, 0.1140017, 0, 1, 0.1019608, 1,
-0.3899572, 1.049407, -0.4380282, 0, 1, 0.1058824, 1,
-0.3868868, 0.9456803, -1.441815, 0, 1, 0.1137255, 1,
-0.3807419, -0.7561464, -2.480763, 0, 1, 0.1176471, 1,
-0.376076, 0.380701, 0.2731308, 0, 1, 0.1254902, 1,
-0.374484, 0.7063971, -1.268239, 0, 1, 0.1294118, 1,
-0.374398, 0.8791125, 2.053003, 0, 1, 0.1372549, 1,
-0.3729619, 1.372128, -0.7553239, 0, 1, 0.1411765, 1,
-0.3703049, -1.129307, -3.359204, 0, 1, 0.1490196, 1,
-0.3662906, 0.6011748, -0.5208023, 0, 1, 0.1529412, 1,
-0.3604619, -0.6486463, -1.739124, 0, 1, 0.1607843, 1,
-0.3604441, 1.711119, 0.5333887, 0, 1, 0.1647059, 1,
-0.3561417, 0.6154017, -1.827901, 0, 1, 0.172549, 1,
-0.3470241, -0.6245909, 0.3423676, 0, 1, 0.1764706, 1,
-0.3463363, -1.688301, -6.603855, 0, 1, 0.1843137, 1,
-0.3414896, 1.332894, -0.5093309, 0, 1, 0.1882353, 1,
-0.3362302, 1.250365, -1.683159, 0, 1, 0.1960784, 1,
-0.3341455, 0.5652451, 1.017069, 0, 1, 0.2039216, 1,
-0.3334367, 0.6268848, 0.5943306, 0, 1, 0.2078431, 1,
-0.3294201, -0.5971939, -4.411108, 0, 1, 0.2156863, 1,
-0.32666, -0.2685198, -2.355603, 0, 1, 0.2196078, 1,
-0.3263908, -0.6616657, -2.277514, 0, 1, 0.227451, 1,
-0.3192379, 1.300289, 1.22319, 0, 1, 0.2313726, 1,
-0.3187947, 1.540916, 0.7013981, 0, 1, 0.2392157, 1,
-0.3176396, 0.2007333, -0.7177771, 0, 1, 0.2431373, 1,
-0.3167473, 0.2502399, -2.297631, 0, 1, 0.2509804, 1,
-0.3107986, 0.1165241, -1.398699, 0, 1, 0.254902, 1,
-0.3106419, -0.1618384, -0.9923869, 0, 1, 0.2627451, 1,
-0.3103677, -2.567423, -1.960028, 0, 1, 0.2666667, 1,
-0.3099216, -0.8676252, -2.42538, 0, 1, 0.2745098, 1,
-0.306085, 1.615866, -0.3375196, 0, 1, 0.2784314, 1,
-0.3056844, 1.713259, -0.801761, 0, 1, 0.2862745, 1,
-0.3016138, -0.1334146, -4.668766, 0, 1, 0.2901961, 1,
-0.2984911, -0.7809505, -2.052881, 0, 1, 0.2980392, 1,
-0.2979519, -0.2480977, -3.294858, 0, 1, 0.3058824, 1,
-0.2905838, 0.03216676, -2.202235, 0, 1, 0.3098039, 1,
-0.2898051, -1.531403, -3.341831, 0, 1, 0.3176471, 1,
-0.2896235, -0.7981626, -2.862103, 0, 1, 0.3215686, 1,
-0.2785341, -1.238301, -2.67792, 0, 1, 0.3294118, 1,
-0.2774805, -0.4862653, -3.889971, 0, 1, 0.3333333, 1,
-0.2771891, 0.3237746, -1.107138, 0, 1, 0.3411765, 1,
-0.2758158, 1.01843, 1.670004, 0, 1, 0.345098, 1,
-0.2751828, 0.706082, 1.288245, 0, 1, 0.3529412, 1,
-0.273292, 0.6624844, 0.4470552, 0, 1, 0.3568628, 1,
-0.2726053, -0.1352688, -2.383218, 0, 1, 0.3647059, 1,
-0.2721178, 0.4344275, -2.940526, 0, 1, 0.3686275, 1,
-0.2698523, 0.4922449, 0.9862495, 0, 1, 0.3764706, 1,
-0.2676673, 0.4294799, 1.979404, 0, 1, 0.3803922, 1,
-0.2659731, -0.3028855, -3.36088, 0, 1, 0.3882353, 1,
-0.2645227, -0.874727, -3.011639, 0, 1, 0.3921569, 1,
-0.263257, 0.04209222, -1.227122, 0, 1, 0.4, 1,
-0.2613589, -2.210279, -2.509995, 0, 1, 0.4078431, 1,
-0.2564799, -0.9014609, -1.702275, 0, 1, 0.4117647, 1,
-0.2559634, 1.142452, 0.3639696, 0, 1, 0.4196078, 1,
-0.2556013, 2.126809, -1.316224, 0, 1, 0.4235294, 1,
-0.2545088, 0.8949974, -1.151547, 0, 1, 0.4313726, 1,
-0.2543193, 1.945606, -1.10106, 0, 1, 0.4352941, 1,
-0.2514934, -0.04687281, -2.122952, 0, 1, 0.4431373, 1,
-0.2509421, -1.595201, -2.3479, 0, 1, 0.4470588, 1,
-0.2503086, -0.1217167, -1.566999, 0, 1, 0.454902, 1,
-0.2466766, 0.9538226, -1.160132, 0, 1, 0.4588235, 1,
-0.2429457, 0.320931, -0.8673968, 0, 1, 0.4666667, 1,
-0.2356713, -1.210684, -1.639022, 0, 1, 0.4705882, 1,
-0.2240316, -1.268943, -1.922674, 0, 1, 0.4784314, 1,
-0.2223469, -1.543959, -3.330653, 0, 1, 0.4823529, 1,
-0.2204448, 0.6275544, 0.4308615, 0, 1, 0.4901961, 1,
-0.2201255, 0.655165, -1.866608, 0, 1, 0.4941176, 1,
-0.2200199, 0.2249733, 0.7679464, 0, 1, 0.5019608, 1,
-0.2192923, -1.321709, -3.681341, 0, 1, 0.509804, 1,
-0.2159082, 0.8983593, 0.9553426, 0, 1, 0.5137255, 1,
-0.2156431, 0.9999731, 0.8760604, 0, 1, 0.5215687, 1,
-0.2131966, -0.8501523, -1.458344, 0, 1, 0.5254902, 1,
-0.2108378, 1.218843, -2.00739, 0, 1, 0.5333334, 1,
-0.2100415, -1.878571, -3.485414, 0, 1, 0.5372549, 1,
-0.207627, -1.32782, -2.512711, 0, 1, 0.5450981, 1,
-0.1950958, -1.239514, -2.142595, 0, 1, 0.5490196, 1,
-0.1943273, -0.09921052, -1.340412, 0, 1, 0.5568628, 1,
-0.1893913, -0.110043, -2.613511, 0, 1, 0.5607843, 1,
-0.18871, -0.543705, -3.107425, 0, 1, 0.5686275, 1,
-0.1884412, 1.018619, 1.679012, 0, 1, 0.572549, 1,
-0.1837277, 0.4969248, -0.9499367, 0, 1, 0.5803922, 1,
-0.1803031, -0.8245926, -3.554198, 0, 1, 0.5843138, 1,
-0.1784648, 0.5442681, -1.304754, 0, 1, 0.5921569, 1,
-0.1754589, 0.1956636, -1.410292, 0, 1, 0.5960785, 1,
-0.1747847, 0.5505221, -1.485098, 0, 1, 0.6039216, 1,
-0.1744768, -1.046491, -2.862722, 0, 1, 0.6117647, 1,
-0.169497, -0.2810988, -2.153215, 0, 1, 0.6156863, 1,
-0.1676908, 1.019413, 0.6007207, 0, 1, 0.6235294, 1,
-0.1646408, 0.6904087, -1.551798, 0, 1, 0.627451, 1,
-0.1641302, -0.3665546, -4.163819, 0, 1, 0.6352941, 1,
-0.1583413, -0.7610094, -0.4258275, 0, 1, 0.6392157, 1,
-0.1564065, -0.3718215, -0.8919567, 0, 1, 0.6470588, 1,
-0.15606, 1.249517, -1.662107, 0, 1, 0.6509804, 1,
-0.1558034, 2.359737, -0.2450418, 0, 1, 0.6588235, 1,
-0.1471554, -1.707635, -4.055574, 0, 1, 0.6627451, 1,
-0.1458765, 1.171965, 0.6741608, 0, 1, 0.6705883, 1,
-0.1438518, 1.181174, 1.602541, 0, 1, 0.6745098, 1,
-0.1354245, -0.1804266, -1.731099, 0, 1, 0.682353, 1,
-0.1271695, -0.1394879, -2.42114, 0, 1, 0.6862745, 1,
-0.1168591, -0.3226073, -1.312358, 0, 1, 0.6941177, 1,
-0.1139643, 0.08024138, 0.2035133, 0, 1, 0.7019608, 1,
-0.1126504, -1.450956, -3.027905, 0, 1, 0.7058824, 1,
-0.1119628, -0.8280855, -2.540799, 0, 1, 0.7137255, 1,
-0.1113699, 0.5405329, -0.8143365, 0, 1, 0.7176471, 1,
-0.1111211, -1.167256, -3.074351, 0, 1, 0.7254902, 1,
-0.1103925, -0.8135216, -2.954792, 0, 1, 0.7294118, 1,
-0.1056659, 1.137147, -0.5992942, 0, 1, 0.7372549, 1,
-0.09035866, -2.507504, -3.519264, 0, 1, 0.7411765, 1,
-0.08763418, 1.58557, 0.2433143, 0, 1, 0.7490196, 1,
-0.0870113, 0.553403, 1.341961, 0, 1, 0.7529412, 1,
-0.08548906, -0.1303775, -2.639462, 0, 1, 0.7607843, 1,
-0.08503927, -0.206554, -2.167043, 0, 1, 0.7647059, 1,
-0.0849838, -1.712496, -1.619328, 0, 1, 0.772549, 1,
-0.08479863, 0.1760114, -0.4599844, 0, 1, 0.7764706, 1,
-0.08438799, 0.9554894, -1.530614, 0, 1, 0.7843137, 1,
-0.0817396, 0.8244877, 1.847493, 0, 1, 0.7882353, 1,
-0.07980306, -0.07679729, -3.646235, 0, 1, 0.7960784, 1,
-0.07940158, 0.6062878, -0.426888, 0, 1, 0.8039216, 1,
-0.07934722, -0.5735105, -4.749049, 0, 1, 0.8078431, 1,
-0.07816724, -0.4992968, -2.764477, 0, 1, 0.8156863, 1,
-0.07164814, 0.2451763, -1.384437, 0, 1, 0.8196079, 1,
-0.07106379, 0.4436014, 0.3655809, 0, 1, 0.827451, 1,
-0.06717427, -0.1283641, -1.86559, 0, 1, 0.8313726, 1,
-0.06674881, 0.2852867, 0.3470881, 0, 1, 0.8392157, 1,
-0.05995352, 0.9611939, 0.005102174, 0, 1, 0.8431373, 1,
-0.05302795, 1.692734, 0.009086075, 0, 1, 0.8509804, 1,
-0.05220223, -1.599212, -2.279362, 0, 1, 0.854902, 1,
-0.04640193, -1.480838, -1.320381, 0, 1, 0.8627451, 1,
-0.0458268, -0.50963, -3.864811, 0, 1, 0.8666667, 1,
-0.0435589, 0.4910942, -1.186548, 0, 1, 0.8745098, 1,
-0.04300892, 0.2553877, 0.6768389, 0, 1, 0.8784314, 1,
-0.04098649, -0.8449838, -3.302213, 0, 1, 0.8862745, 1,
-0.03188638, 0.7553093, -0.06873549, 0, 1, 0.8901961, 1,
-0.02941836, -0.5922664, -3.782494, 0, 1, 0.8980392, 1,
-0.02584508, 2.618107, -2.37606, 0, 1, 0.9058824, 1,
-0.01823052, 0.1407506, 0.8743461, 0, 1, 0.9098039, 1,
-0.01537745, -0.1990302, -2.661426, 0, 1, 0.9176471, 1,
-0.01195787, -0.5676713, -4.423552, 0, 1, 0.9215686, 1,
-0.01034635, 1.074245, -0.02322427, 0, 1, 0.9294118, 1,
-0.01005814, -0.8118002, -1.747507, 0, 1, 0.9333333, 1,
-0.00991719, -2.154052, -2.342455, 0, 1, 0.9411765, 1,
0.0003897785, 1.867583, 0.7076526, 0, 1, 0.945098, 1,
0.005624029, -0.5610488, 4.571967, 0, 1, 0.9529412, 1,
0.006258916, -0.5890193, 2.675085, 0, 1, 0.9568627, 1,
0.006394817, -0.6065535, 3.355088, 0, 1, 0.9647059, 1,
0.0158668, -0.8191525, 2.136603, 0, 1, 0.9686275, 1,
0.01694708, 0.2011123, 0.2261399, 0, 1, 0.9764706, 1,
0.01804464, -2.007174, 2.520237, 0, 1, 0.9803922, 1,
0.02286646, -2.269273, 3.367187, 0, 1, 0.9882353, 1,
0.02433297, 1.133009, -0.8376309, 0, 1, 0.9921569, 1,
0.02526951, -0.2353684, 2.516129, 0, 1, 1, 1,
0.02529608, 0.3923512, 0.3047092, 0, 0.9921569, 1, 1,
0.02740324, -0.6348049, 4.621093, 0, 0.9882353, 1, 1,
0.02866277, -1.952575, 4.169154, 0, 0.9803922, 1, 1,
0.03712158, -0.8331066, 3.774395, 0, 0.9764706, 1, 1,
0.03736568, 1.468892, 0.3380112, 0, 0.9686275, 1, 1,
0.03786737, 0.003180168, 2.042747, 0, 0.9647059, 1, 1,
0.04061958, 0.6266534, -0.9032783, 0, 0.9568627, 1, 1,
0.04151127, -0.2137754, 2.667092, 0, 0.9529412, 1, 1,
0.04767185, 1.074595, -1.874297, 0, 0.945098, 1, 1,
0.04839594, 0.4844765, 2.201652, 0, 0.9411765, 1, 1,
0.05103568, -1.727961, 3.031262, 0, 0.9333333, 1, 1,
0.05247649, -0.2633992, 2.35726, 0, 0.9294118, 1, 1,
0.05407344, 0.4388856, 1.108959, 0, 0.9215686, 1, 1,
0.05455197, -0.2703731, 2.619344, 0, 0.9176471, 1, 1,
0.0591388, -0.33304, 4.810127, 0, 0.9098039, 1, 1,
0.05964313, 1.620888, 1.193258, 0, 0.9058824, 1, 1,
0.06072663, 0.3964912, 0.5963361, 0, 0.8980392, 1, 1,
0.0625134, 0.9077758, -0.9000393, 0, 0.8901961, 1, 1,
0.06503725, 0.3792501, 1.240911, 0, 0.8862745, 1, 1,
0.06672363, 1.166383, -0.2488064, 0, 0.8784314, 1, 1,
0.07301004, 0.7687202, -0.8584941, 0, 0.8745098, 1, 1,
0.0750384, 0.1811623, 0.2202481, 0, 0.8666667, 1, 1,
0.07635583, -0.9306558, 3.698834, 0, 0.8627451, 1, 1,
0.07645421, 0.1049785, 0.07822441, 0, 0.854902, 1, 1,
0.07717317, 0.7770081, -1.204457, 0, 0.8509804, 1, 1,
0.0837459, 0.4897945, -1.284893, 0, 0.8431373, 1, 1,
0.08678777, 1.956902, 0.1809615, 0, 0.8392157, 1, 1,
0.09251418, -0.2276166, 2.997029, 0, 0.8313726, 1, 1,
0.1013297, 0.1329528, 1.47874, 0, 0.827451, 1, 1,
0.109683, 2.048785, 0.3865013, 0, 0.8196079, 1, 1,
0.1114473, 1.028342, -0.1022483, 0, 0.8156863, 1, 1,
0.1125432, -1.42557, 1.727902, 0, 0.8078431, 1, 1,
0.1151921, -0.2486479, 3.210821, 0, 0.8039216, 1, 1,
0.1172729, 0.7068732, -1.392614, 0, 0.7960784, 1, 1,
0.1176256, 0.4674149, -0.1065763, 0, 0.7882353, 1, 1,
0.1249858, 1.103257, 1.675121, 0, 0.7843137, 1, 1,
0.1260703, 1.338494, 2.518833, 0, 0.7764706, 1, 1,
0.1287882, 0.6224605, -0.1051492, 0, 0.772549, 1, 1,
0.1299851, -0.8128773, 3.896646, 0, 0.7647059, 1, 1,
0.1323603, 3.405662, -1.812347, 0, 0.7607843, 1, 1,
0.1326807, 0.9257135, -1.463547, 0, 0.7529412, 1, 1,
0.1328348, -1.101489, 3.374067, 0, 0.7490196, 1, 1,
0.1333965, -2.137198, 2.546541, 0, 0.7411765, 1, 1,
0.1337202, 0.6582649, -0.1628495, 0, 0.7372549, 1, 1,
0.1357497, -0.4104152, 1.56096, 0, 0.7294118, 1, 1,
0.1368046, 0.2044674, 0.2950462, 0, 0.7254902, 1, 1,
0.1376682, -0.1153922, 1.806373, 0, 0.7176471, 1, 1,
0.1402605, -0.2648414, 1.893653, 0, 0.7137255, 1, 1,
0.1428719, 0.338671, 0.9378933, 0, 0.7058824, 1, 1,
0.1456208, -0.6827348, 2.746907, 0, 0.6980392, 1, 1,
0.1535817, -1.78207, 5.370563, 0, 0.6941177, 1, 1,
0.1539866, 1.305812, -1.049979, 0, 0.6862745, 1, 1,
0.1583072, -0.3627961, 2.873361, 0, 0.682353, 1, 1,
0.1610676, -0.2716787, 2.63154, 0, 0.6745098, 1, 1,
0.161809, -0.5798139, 3.006257, 0, 0.6705883, 1, 1,
0.1642831, 0.19173, 0.949869, 0, 0.6627451, 1, 1,
0.1660182, 0.8086128, 1.151331, 0, 0.6588235, 1, 1,
0.1682245, -0.9064942, 3.724611, 0, 0.6509804, 1, 1,
0.168858, -1.32946, 3.383552, 0, 0.6470588, 1, 1,
0.1766784, -3.524256, 2.507668, 0, 0.6392157, 1, 1,
0.1790454, -0.1638624, 2.040216, 0, 0.6352941, 1, 1,
0.1829191, 0.07127285, 0.3489971, 0, 0.627451, 1, 1,
0.1840137, -0.0213518, 1.586218, 0, 0.6235294, 1, 1,
0.1845914, -0.4511689, 2.855522, 0, 0.6156863, 1, 1,
0.1863121, 0.145913, 1.601916, 0, 0.6117647, 1, 1,
0.1864342, 0.2361669, 0.8046295, 0, 0.6039216, 1, 1,
0.1920311, -0.9562637, 1.946918, 0, 0.5960785, 1, 1,
0.2076096, 1.994518, 0.4109269, 0, 0.5921569, 1, 1,
0.2107076, -0.04923542, 2.502469, 0, 0.5843138, 1, 1,
0.211399, -1.33213, 3.596213, 0, 0.5803922, 1, 1,
0.2124672, -1.102027, 2.48661, 0, 0.572549, 1, 1,
0.2139321, -1.283433, 1.832996, 0, 0.5686275, 1, 1,
0.2163887, -1.675861, 2.492931, 0, 0.5607843, 1, 1,
0.2187853, -0.753538, 3.151654, 0, 0.5568628, 1, 1,
0.2193239, -1.778929, 2.89697, 0, 0.5490196, 1, 1,
0.2201881, 0.1793071, 1.352278, 0, 0.5450981, 1, 1,
0.2213091, -0.5269442, 0.4725533, 0, 0.5372549, 1, 1,
0.2221093, -0.2879449, 2.699557, 0, 0.5333334, 1, 1,
0.2251233, -1.989908, 3.623653, 0, 0.5254902, 1, 1,
0.236432, -0.4272944, 3.832416, 0, 0.5215687, 1, 1,
0.2399707, -0.3326457, 2.611494, 0, 0.5137255, 1, 1,
0.2430499, 0.5491417, 0.6121027, 0, 0.509804, 1, 1,
0.2451037, 2.585156, -0.4163612, 0, 0.5019608, 1, 1,
0.2512702, 0.1248646, 0.1494208, 0, 0.4941176, 1, 1,
0.2516815, 0.3803923, 1.276527, 0, 0.4901961, 1, 1,
0.2517248, 0.40776, 0.9328729, 0, 0.4823529, 1, 1,
0.2525908, -0.9051686, 1.807723, 0, 0.4784314, 1, 1,
0.2537709, 0.4086484, -0.4874759, 0, 0.4705882, 1, 1,
0.2544987, 0.6689999, 1.282867, 0, 0.4666667, 1, 1,
0.2550592, 1.92404, 0.06883456, 0, 0.4588235, 1, 1,
0.2567096, -2.223932, 2.473664, 0, 0.454902, 1, 1,
0.2617455, -0.5919724, 4.378766, 0, 0.4470588, 1, 1,
0.2618026, 0.1056204, 1.273197, 0, 0.4431373, 1, 1,
0.2636983, -0.6357087, 2.755424, 0, 0.4352941, 1, 1,
0.2640256, 0.6189561, -0.04279449, 0, 0.4313726, 1, 1,
0.2641968, -0.4953184, 2.991601, 0, 0.4235294, 1, 1,
0.2670217, 1.625952, -0.02954925, 0, 0.4196078, 1, 1,
0.2721733, 0.5283223, -0.1915513, 0, 0.4117647, 1, 1,
0.2726516, 1.958592, 0.1868621, 0, 0.4078431, 1, 1,
0.275313, -0.3382012, 1.776823, 0, 0.4, 1, 1,
0.2766319, -2.499771, 3.016861, 0, 0.3921569, 1, 1,
0.2788012, 0.208323, -0.5939579, 0, 0.3882353, 1, 1,
0.2817292, -1.596461, 1.952309, 0, 0.3803922, 1, 1,
0.2876866, -0.1535537, 2.359757, 0, 0.3764706, 1, 1,
0.2901873, -0.3339677, 2.67604, 0, 0.3686275, 1, 1,
0.294279, 0.280561, 1.65059, 0, 0.3647059, 1, 1,
0.2989826, 1.515316, -0.9144176, 0, 0.3568628, 1, 1,
0.3002003, -3.379737, 3.545775, 0, 0.3529412, 1, 1,
0.3021487, -1.475612, 1.64937, 0, 0.345098, 1, 1,
0.3022644, 1.566265, 0.2336368, 0, 0.3411765, 1, 1,
0.3028166, -1.107434, 4.568408, 0, 0.3333333, 1, 1,
0.3118435, 1.429639, 0.5806695, 0, 0.3294118, 1, 1,
0.3130778, -1.17787, 2.079872, 0, 0.3215686, 1, 1,
0.314265, 0.1209122, 1.912515, 0, 0.3176471, 1, 1,
0.3159809, 0.3946942, 0.1066524, 0, 0.3098039, 1, 1,
0.3160045, -0.6550185, 0.8888685, 0, 0.3058824, 1, 1,
0.3169928, -1.608853, 2.176563, 0, 0.2980392, 1, 1,
0.317459, -1.257122, 4.703456, 0, 0.2901961, 1, 1,
0.3242037, -0.9081586, 1.949303, 0, 0.2862745, 1, 1,
0.3278883, -0.7208704, 3.178756, 0, 0.2784314, 1, 1,
0.328404, 0.1008474, 1.15022, 0, 0.2745098, 1, 1,
0.3292437, 0.04093263, -0.2769848, 0, 0.2666667, 1, 1,
0.3332695, 0.9525918, 0.5433028, 0, 0.2627451, 1, 1,
0.3352465, -0.7437428, 2.190913, 0, 0.254902, 1, 1,
0.3365256, 0.3192203, 0.2580196, 0, 0.2509804, 1, 1,
0.3399023, -0.636852, 1.935462, 0, 0.2431373, 1, 1,
0.3423453, -0.04357056, -0.6946005, 0, 0.2392157, 1, 1,
0.3498188, 1.68928, -1.323825, 0, 0.2313726, 1, 1,
0.3595449, 0.6709343, 0.1309297, 0, 0.227451, 1, 1,
0.3628596, -1.244216, 3.094705, 0, 0.2196078, 1, 1,
0.3630227, -0.183942, 0.450363, 0, 0.2156863, 1, 1,
0.3680828, -1.809386, 3.558119, 0, 0.2078431, 1, 1,
0.3709637, 0.3423716, 0.3397186, 0, 0.2039216, 1, 1,
0.3716388, 1.67527, -0.5882599, 0, 0.1960784, 1, 1,
0.3765535, -0.6666726, 1.014215, 0, 0.1882353, 1, 1,
0.3767189, -1.185307, 4.660957, 0, 0.1843137, 1, 1,
0.3786465, -0.2576313, 0.3338485, 0, 0.1764706, 1, 1,
0.3840455, -0.6283166, 2.318725, 0, 0.172549, 1, 1,
0.3856097, -0.1570483, 2.202535, 0, 0.1647059, 1, 1,
0.3885551, -0.5731818, 2.462673, 0, 0.1607843, 1, 1,
0.3908574, 0.42535, -0.03788305, 0, 0.1529412, 1, 1,
0.3918334, -0.1147646, 1.667398, 0, 0.1490196, 1, 1,
0.3920176, 0.4878384, 0.5438451, 0, 0.1411765, 1, 1,
0.395322, 1.271165, 0.8647362, 0, 0.1372549, 1, 1,
0.397153, -0.3817947, 0.8881262, 0, 0.1294118, 1, 1,
0.4001032, 0.3849261, 1.939374, 0, 0.1254902, 1, 1,
0.4039879, 0.1688118, 1.408407, 0, 0.1176471, 1, 1,
0.404693, -1.130873, 2.55985, 0, 0.1137255, 1, 1,
0.4056587, -2.274906, 3.313509, 0, 0.1058824, 1, 1,
0.4056969, -0.5733009, 3.208956, 0, 0.09803922, 1, 1,
0.409059, -2.215132, 3.732264, 0, 0.09411765, 1, 1,
0.4092613, -0.2524797, 2.103318, 0, 0.08627451, 1, 1,
0.4152559, -0.2405889, 2.275308, 0, 0.08235294, 1, 1,
0.4206118, 0.9103557, 1.407251, 0, 0.07450981, 1, 1,
0.4246305, 0.4916137, 0.7621058, 0, 0.07058824, 1, 1,
0.4251457, 0.2622828, 1.10751, 0, 0.0627451, 1, 1,
0.4251909, 0.333512, 1.453901, 0, 0.05882353, 1, 1,
0.4253895, 1.69211, -0.3984032, 0, 0.05098039, 1, 1,
0.4295959, -0.1995323, 1.106193, 0, 0.04705882, 1, 1,
0.4306259, 0.327933, 0.235225, 0, 0.03921569, 1, 1,
0.4319364, -2.100416, 3.440872, 0, 0.03529412, 1, 1,
0.4323174, 1.146212, 1.228097, 0, 0.02745098, 1, 1,
0.4345095, 2.369715, -0.1894885, 0, 0.02352941, 1, 1,
0.4351389, -0.6180936, 2.214439, 0, 0.01568628, 1, 1,
0.4362669, -1.407667, 2.827823, 0, 0.01176471, 1, 1,
0.4363786, -0.8886545, 2.670362, 0, 0.003921569, 1, 1,
0.4402452, 0.2413912, 1.832669, 0.003921569, 0, 1, 1,
0.4405142, -0.7736206, 3.544466, 0.007843138, 0, 1, 1,
0.4407888, 0.3079443, 1.333673, 0.01568628, 0, 1, 1,
0.4436622, -1.178864, 4.126375, 0.01960784, 0, 1, 1,
0.4453911, 0.816148, 0.9035257, 0.02745098, 0, 1, 1,
0.4457331, 0.4655954, 1.650152, 0.03137255, 0, 1, 1,
0.4469996, 0.6669644, 0.3214772, 0.03921569, 0, 1, 1,
0.4496541, -0.03444602, 3.502692, 0.04313726, 0, 1, 1,
0.4508466, -0.9689415, 2.604269, 0.05098039, 0, 1, 1,
0.4519169, 0.5531451, -0.5366825, 0.05490196, 0, 1, 1,
0.4546542, -0.2455579, 4.140028, 0.0627451, 0, 1, 1,
0.4582413, 0.6462249, -0.5299914, 0.06666667, 0, 1, 1,
0.4626355, 0.5903763, 0.6194883, 0.07450981, 0, 1, 1,
0.4672346, -0.4207484, 4.084585, 0.07843138, 0, 1, 1,
0.4686352, -1.008251, 3.270574, 0.08627451, 0, 1, 1,
0.4718522, -1.018742, 3.865267, 0.09019608, 0, 1, 1,
0.4719101, -0.5106679, 2.21131, 0.09803922, 0, 1, 1,
0.4745709, 1.296327, 1.012623, 0.1058824, 0, 1, 1,
0.4775444, 0.8611542, 0.6809523, 0.1098039, 0, 1, 1,
0.478084, -0.3723608, -0.1069412, 0.1176471, 0, 1, 1,
0.4799038, -0.7371001, 4.445729, 0.1215686, 0, 1, 1,
0.4809301, -0.0588139, 2.740822, 0.1294118, 0, 1, 1,
0.4813395, 0.8435759, 0.8083518, 0.1333333, 0, 1, 1,
0.4850736, 0.9094812, 0.7875184, 0.1411765, 0, 1, 1,
0.4909227, 0.1908389, 1.786483, 0.145098, 0, 1, 1,
0.4938115, -0.1014807, 1.401183, 0.1529412, 0, 1, 1,
0.4941829, 1.654249, -0.361188, 0.1568628, 0, 1, 1,
0.4948435, -0.1015922, 0.7941573, 0.1647059, 0, 1, 1,
0.5014743, -0.8083391, 1.546997, 0.1686275, 0, 1, 1,
0.5045421, 0.5730106, -0.9239794, 0.1764706, 0, 1, 1,
0.5096586, 0.04449079, 1.698201, 0.1803922, 0, 1, 1,
0.516292, 0.9783077, 1.576091, 0.1882353, 0, 1, 1,
0.51767, -1.496909, 4.633214, 0.1921569, 0, 1, 1,
0.5194924, 0.3403816, 0.4354604, 0.2, 0, 1, 1,
0.5297761, 0.2995588, 2.339318, 0.2078431, 0, 1, 1,
0.5309833, -0.03134623, 2.754686, 0.2117647, 0, 1, 1,
0.5310603, -1.621838, 3.364498, 0.2196078, 0, 1, 1,
0.5355729, -0.3452293, 2.067415, 0.2235294, 0, 1, 1,
0.5391122, 0.0043881, 1.084729, 0.2313726, 0, 1, 1,
0.5402645, -1.731777, 4.803894, 0.2352941, 0, 1, 1,
0.5411489, -1.167834, 2.072309, 0.2431373, 0, 1, 1,
0.5445868, 0.4319756, 1.132634, 0.2470588, 0, 1, 1,
0.5452071, -0.7346629, 2.60063, 0.254902, 0, 1, 1,
0.546109, 0.6268256, 1.562209, 0.2588235, 0, 1, 1,
0.5463185, 0.0993366, 0.9424167, 0.2666667, 0, 1, 1,
0.546559, 0.2155003, 1.108359, 0.2705882, 0, 1, 1,
0.5523005, 0.6622915, 1.051357, 0.2784314, 0, 1, 1,
0.5694881, 0.807643, 0.7114788, 0.282353, 0, 1, 1,
0.5765575, 1.088178, 2.996873, 0.2901961, 0, 1, 1,
0.5780116, -1.439537, 1.16502, 0.2941177, 0, 1, 1,
0.5792397, -0.7662343, 2.27366, 0.3019608, 0, 1, 1,
0.5861761, -0.9925577, 2.827406, 0.3098039, 0, 1, 1,
0.5899182, 0.434734, -0.2318094, 0.3137255, 0, 1, 1,
0.59668, 0.6724723, 1.011171, 0.3215686, 0, 1, 1,
0.5968368, 1.17276, 0.1764963, 0.3254902, 0, 1, 1,
0.6036703, 0.6104813, -0.3742311, 0.3333333, 0, 1, 1,
0.6081168, 1.828838, -0.485822, 0.3372549, 0, 1, 1,
0.6101276, 0.3591095, 1.173059, 0.345098, 0, 1, 1,
0.6111606, 0.01372476, 1.701908, 0.3490196, 0, 1, 1,
0.6143199, -0.4350148, 0.799188, 0.3568628, 0, 1, 1,
0.6151081, 0.2155315, 1.902801, 0.3607843, 0, 1, 1,
0.6284105, -0.5903408, 0.6517985, 0.3686275, 0, 1, 1,
0.6309285, 0.2025502, 1.810458, 0.372549, 0, 1, 1,
0.631562, 1.190751, 1.375263, 0.3803922, 0, 1, 1,
0.6339991, -0.06534123, 1.477167, 0.3843137, 0, 1, 1,
0.6368389, 1.194582, -0.01134577, 0.3921569, 0, 1, 1,
0.6397674, -1.410761, 2.511108, 0.3960784, 0, 1, 1,
0.6410761, 0.952381, 1.396969, 0.4039216, 0, 1, 1,
0.6477293, -1.375456, 2.65458, 0.4117647, 0, 1, 1,
0.649738, 0.3206656, 0.3922262, 0.4156863, 0, 1, 1,
0.6558195, 1.255395, 1.371272, 0.4235294, 0, 1, 1,
0.6560123, 1.502751, -1.29229, 0.427451, 0, 1, 1,
0.6606531, 1.543582, 0.8563277, 0.4352941, 0, 1, 1,
0.6613783, -0.08007728, 2.920087, 0.4392157, 0, 1, 1,
0.6693277, 0.1635217, 0.1251313, 0.4470588, 0, 1, 1,
0.6704116, 1.330336, -0.2185093, 0.4509804, 0, 1, 1,
0.6713157, -0.6181427, 1.841277, 0.4588235, 0, 1, 1,
0.6715165, -1.658067, 1.817304, 0.4627451, 0, 1, 1,
0.6725109, 2.313242, 0.9406358, 0.4705882, 0, 1, 1,
0.6805992, 0.4122561, -0.1738727, 0.4745098, 0, 1, 1,
0.6807876, -2.052463, 1.265373, 0.4823529, 0, 1, 1,
0.6813006, 0.511676, 0.2524368, 0.4862745, 0, 1, 1,
0.6833239, -0.5279912, 2.983581, 0.4941176, 0, 1, 1,
0.6897859, 1.501049, 0.8819607, 0.5019608, 0, 1, 1,
0.6908413, -0.1273563, 1.779377, 0.5058824, 0, 1, 1,
0.6920471, 0.03649315, 2.085107, 0.5137255, 0, 1, 1,
0.6924405, 1.722097, 1.797719, 0.5176471, 0, 1, 1,
0.692869, -1.333944, 3.823895, 0.5254902, 0, 1, 1,
0.6959631, -1.080473, 2.28138, 0.5294118, 0, 1, 1,
0.6967391, 1.609426, 0.1201483, 0.5372549, 0, 1, 1,
0.7006733, 1.351192, -0.6217874, 0.5411765, 0, 1, 1,
0.7045394, 0.9184335, 2.625502, 0.5490196, 0, 1, 1,
0.7050446, -1.432738, 2.581861, 0.5529412, 0, 1, 1,
0.7058326, 1.184947, 0.7714267, 0.5607843, 0, 1, 1,
0.707205, 0.5866199, -0.1784132, 0.5647059, 0, 1, 1,
0.7098965, -0.774617, 2.247589, 0.572549, 0, 1, 1,
0.7131656, -0.05961812, 2.033685, 0.5764706, 0, 1, 1,
0.7209411, -1.178933, 2.304774, 0.5843138, 0, 1, 1,
0.7307214, 1.083229, 1.382189, 0.5882353, 0, 1, 1,
0.7312649, -0.9463906, 2.780725, 0.5960785, 0, 1, 1,
0.7324349, 0.1833379, 1.370787, 0.6039216, 0, 1, 1,
0.7508399, 1.435592, 0.9141444, 0.6078432, 0, 1, 1,
0.7509494, 0.130946, -0.5444195, 0.6156863, 0, 1, 1,
0.7541894, -0.1392601, 1.223776, 0.6196079, 0, 1, 1,
0.7544534, -0.8795589, 2.658628, 0.627451, 0, 1, 1,
0.7547563, -1.400486, 4.070942, 0.6313726, 0, 1, 1,
0.7596158, 0.8552967, 1.633755, 0.6392157, 0, 1, 1,
0.7607842, 1.539051, -0.4170389, 0.6431373, 0, 1, 1,
0.7635452, 1.252706, 0.976852, 0.6509804, 0, 1, 1,
0.7643515, -1.484487, 2.660099, 0.654902, 0, 1, 1,
0.7665678, 0.7795971, 0.3848949, 0.6627451, 0, 1, 1,
0.7708442, -1.218728, 1.956322, 0.6666667, 0, 1, 1,
0.7835357, -1.603475, 2.674275, 0.6745098, 0, 1, 1,
0.7872289, 0.3719191, 2.437037, 0.6784314, 0, 1, 1,
0.7886968, 1.363626, -0.0496175, 0.6862745, 0, 1, 1,
0.7913463, 0.3370463, 0.8669427, 0.6901961, 0, 1, 1,
0.7916279, 0.3801154, 1.087362, 0.6980392, 0, 1, 1,
0.7919027, -0.3434018, 1.170122, 0.7058824, 0, 1, 1,
0.8009396, 1.171008, -0.4534243, 0.7098039, 0, 1, 1,
0.8024859, -0.4118667, 3.640228, 0.7176471, 0, 1, 1,
0.8030648, -1.567544, 1.503889, 0.7215686, 0, 1, 1,
0.8054746, -0.1872201, 1.020098, 0.7294118, 0, 1, 1,
0.8091108, -0.4761985, 1.728946, 0.7333333, 0, 1, 1,
0.809941, -0.6110866, 1.20142, 0.7411765, 0, 1, 1,
0.8119933, 0.2380562, 2.028136, 0.7450981, 0, 1, 1,
0.8200768, 1.057942, 3.293646, 0.7529412, 0, 1, 1,
0.8253468, -0.6676494, 1.739126, 0.7568628, 0, 1, 1,
0.8271213, 0.4342037, 0.5222099, 0.7647059, 0, 1, 1,
0.8278822, 0.2619759, 2.235957, 0.7686275, 0, 1, 1,
0.8316615, 0.4713816, 2.21368, 0.7764706, 0, 1, 1,
0.8348867, -1.635918, 3.102656, 0.7803922, 0, 1, 1,
0.8379291, 0.4155687, -0.7041616, 0.7882353, 0, 1, 1,
0.8470187, -0.7595127, 1.779141, 0.7921569, 0, 1, 1,
0.8493426, -0.7722741, -0.3363814, 0.8, 0, 1, 1,
0.8530803, 0.008805715, 1.754185, 0.8078431, 0, 1, 1,
0.855875, -0.4888828, 4.270501, 0.8117647, 0, 1, 1,
0.8565658, -0.4459302, 0.8283281, 0.8196079, 0, 1, 1,
0.8571925, 0.7441924, 1.594611, 0.8235294, 0, 1, 1,
0.8593397, -0.6129324, 1.745151, 0.8313726, 0, 1, 1,
0.8598425, -1.288097, 2.609077, 0.8352941, 0, 1, 1,
0.8608092, -1.890577, 2.750779, 0.8431373, 0, 1, 1,
0.8611974, 0.4593439, 0.803829, 0.8470588, 0, 1, 1,
0.8739019, 1.179722, 1.440494, 0.854902, 0, 1, 1,
0.8752926, 1.065938, 0.2513618, 0.8588235, 0, 1, 1,
0.8778821, -1.633559, 3.203151, 0.8666667, 0, 1, 1,
0.8780217, 1.218316, 1.923349, 0.8705882, 0, 1, 1,
0.8807425, -0.4314184, 2.124168, 0.8784314, 0, 1, 1,
0.8833401, -0.5585501, 2.827457, 0.8823529, 0, 1, 1,
0.8892182, 0.2142556, 3.18866, 0.8901961, 0, 1, 1,
0.8943096, -0.7505553, 3.656908, 0.8941177, 0, 1, 1,
0.9115727, 0.8578097, 2.401671, 0.9019608, 0, 1, 1,
0.9200668, -0.472851, 1.041876, 0.9098039, 0, 1, 1,
0.9281653, 1.889718, 0.04904842, 0.9137255, 0, 1, 1,
0.9283444, 0.6299888, 0.05120401, 0.9215686, 0, 1, 1,
0.9338337, 0.8366545, 0.6519564, 0.9254902, 0, 1, 1,
0.9362632, 0.3492053, 1.541418, 0.9333333, 0, 1, 1,
0.9428249, -0.5258756, 2.873323, 0.9372549, 0, 1, 1,
0.9554681, 1.598621, 0.1865158, 0.945098, 0, 1, 1,
0.9563104, -1.442381, 1.491802, 0.9490196, 0, 1, 1,
0.9611465, 0.2388395, 0.7294796, 0.9568627, 0, 1, 1,
0.9651545, 1.469911, 2.855951, 0.9607843, 0, 1, 1,
0.9664602, -1.525059, 3.160225, 0.9686275, 0, 1, 1,
0.9743761, -0.6286402, 4.026088, 0.972549, 0, 1, 1,
0.9760377, -1.80508, 2.737419, 0.9803922, 0, 1, 1,
0.983707, 0.8057251, -0.2277431, 0.9843137, 0, 1, 1,
0.9906334, -0.6392979, 2.281687, 0.9921569, 0, 1, 1,
0.9912919, 0.408133, 1.264613, 0.9960784, 0, 1, 1,
1.020667, -0.03170698, -0.2314165, 1, 0, 0.9960784, 1,
1.021298, 0.9620523, 1.356255, 1, 0, 0.9882353, 1,
1.023353, -0.3851699, -1.123122, 1, 0, 0.9843137, 1,
1.02627, 0.7510883, -1.804939, 1, 0, 0.9764706, 1,
1.028881, 0.4273061, 1.323006, 1, 0, 0.972549, 1,
1.031646, -2.042059, 1.235729, 1, 0, 0.9647059, 1,
1.037466, 0.2757937, 1.181887, 1, 0, 0.9607843, 1,
1.038025, -0.5559671, 2.786283, 1, 0, 0.9529412, 1,
1.054695, -0.4009416, 2.030205, 1, 0, 0.9490196, 1,
1.056785, -1.559287, 3.91969, 1, 0, 0.9411765, 1,
1.057377, 0.07861947, 1.599833, 1, 0, 0.9372549, 1,
1.060788, 0.06996911, 0.947256, 1, 0, 0.9294118, 1,
1.061849, 0.09883006, 2.090882, 1, 0, 0.9254902, 1,
1.068267, 1.254133, 0.1349162, 1, 0, 0.9176471, 1,
1.071126, -0.4762195, 3.289356, 1, 0, 0.9137255, 1,
1.073125, 0.7060951, 0.195181, 1, 0, 0.9058824, 1,
1.07689, -1.002743, 2.102074, 1, 0, 0.9019608, 1,
1.077449, 0.02496758, 2.378707, 1, 0, 0.8941177, 1,
1.092018, 0.7138411, 0.8132699, 1, 0, 0.8862745, 1,
1.096888, 0.2893561, 0.9944314, 1, 0, 0.8823529, 1,
1.105164, -0.08020038, 0.78907, 1, 0, 0.8745098, 1,
1.105504, -0.5032398, 2.412343, 1, 0, 0.8705882, 1,
1.120036, 0.8535504, 1.38357, 1, 0, 0.8627451, 1,
1.122047, 3.040616, 1.923224, 1, 0, 0.8588235, 1,
1.124014, 1.314055, -1.087861, 1, 0, 0.8509804, 1,
1.124459, -0.8399482, 2.821831, 1, 0, 0.8470588, 1,
1.127615, 0.7303601, 1.614639, 1, 0, 0.8392157, 1,
1.128489, 0.7313417, 0.1975657, 1, 0, 0.8352941, 1,
1.13633, 0.5570952, 1.142477, 1, 0, 0.827451, 1,
1.14439, 0.8402582, 1.572106, 1, 0, 0.8235294, 1,
1.150228, -0.9465997, 1.756556, 1, 0, 0.8156863, 1,
1.154297, -0.9672871, 3.216575, 1, 0, 0.8117647, 1,
1.155555, -0.1043404, 1.444781, 1, 0, 0.8039216, 1,
1.157184, 0.106011, 1.250001, 1, 0, 0.7960784, 1,
1.159947, -0.07568117, 0.158657, 1, 0, 0.7921569, 1,
1.165881, -0.5951323, 1.665712, 1, 0, 0.7843137, 1,
1.168236, -1.050512, 2.125764, 1, 0, 0.7803922, 1,
1.171286, -3.409228, 2.443914, 1, 0, 0.772549, 1,
1.17812, 0.8517154, 1.026165, 1, 0, 0.7686275, 1,
1.18102, 0.1896517, 0.5543731, 1, 0, 0.7607843, 1,
1.197789, 1.054405, 0.334642, 1, 0, 0.7568628, 1,
1.202157, -0.9870956, 1.724888, 1, 0, 0.7490196, 1,
1.203685, 1.494738, 0.1317973, 1, 0, 0.7450981, 1,
1.206453, -1.249263, 3.427472, 1, 0, 0.7372549, 1,
1.209982, 2.39352, -2.355376, 1, 0, 0.7333333, 1,
1.215706, -1.217635, 1.856118, 1, 0, 0.7254902, 1,
1.217774, 1.813978, 0.1874781, 1, 0, 0.7215686, 1,
1.217828, 1.60211, 1.236144, 1, 0, 0.7137255, 1,
1.217937, 0.8456591, -0.7715108, 1, 0, 0.7098039, 1,
1.224236, 0.1366622, 0.590406, 1, 0, 0.7019608, 1,
1.226133, -0.4072785, 1.521964, 1, 0, 0.6941177, 1,
1.227935, 1.629168, 0.8427109, 1, 0, 0.6901961, 1,
1.229578, -0.4178785, 2.33301, 1, 0, 0.682353, 1,
1.231873, -0.2415587, 1.602538, 1, 0, 0.6784314, 1,
1.235399, -1.05002, 0.9251457, 1, 0, 0.6705883, 1,
1.23992, 1.86873, 0.1990505, 1, 0, 0.6666667, 1,
1.242304, -0.3601623, 0.8767455, 1, 0, 0.6588235, 1,
1.244646, 0.2030418, 0.8622431, 1, 0, 0.654902, 1,
1.246179, 2.027527, 2.358886, 1, 0, 0.6470588, 1,
1.248083, 0.4825233, 0.8318917, 1, 0, 0.6431373, 1,
1.250197, -0.6600638, 2.453958, 1, 0, 0.6352941, 1,
1.25437, -1.319932, 2.51539, 1, 0, 0.6313726, 1,
1.261758, -1.276276, 2.674564, 1, 0, 0.6235294, 1,
1.268042, -1.286696, 1.299325, 1, 0, 0.6196079, 1,
1.268757, 0.8950114, 1.634126, 1, 0, 0.6117647, 1,
1.27111, 0.6633024, 1.292593, 1, 0, 0.6078432, 1,
1.271789, -1.224366, 1.075009, 1, 0, 0.6, 1,
1.273081, -1.145172, 2.649592, 1, 0, 0.5921569, 1,
1.274385, 0.1358068, 1.264475, 1, 0, 0.5882353, 1,
1.283873, -0.2075613, 1.69385, 1, 0, 0.5803922, 1,
1.284087, -1.91862, 3.962683, 1, 0, 0.5764706, 1,
1.29006, 0.9585819, -0.7770933, 1, 0, 0.5686275, 1,
1.291071, -0.02983338, 1.192534, 1, 0, 0.5647059, 1,
1.295945, 2.097761, 0.2536175, 1, 0, 0.5568628, 1,
1.299159, 2.193872, -0.6148682, 1, 0, 0.5529412, 1,
1.302115, -0.4200958, 2.613262, 1, 0, 0.5450981, 1,
1.304315, -0.5158606, 2.782568, 1, 0, 0.5411765, 1,
1.321088, 1.748678, -0.04541255, 1, 0, 0.5333334, 1,
1.334242, -0.2318908, 2.479451, 1, 0, 0.5294118, 1,
1.335527, -0.5384238, 1.425597, 1, 0, 0.5215687, 1,
1.335829, -1.354345, 2.707084, 1, 0, 0.5176471, 1,
1.336613, -1.615936, 2.167283, 1, 0, 0.509804, 1,
1.352772, 0.6144534, -0.1551241, 1, 0, 0.5058824, 1,
1.363933, -1.113627, 1.721984, 1, 0, 0.4980392, 1,
1.366575, 0.4386096, 1.122985, 1, 0, 0.4901961, 1,
1.379931, -0.9482374, 2.739073, 1, 0, 0.4862745, 1,
1.380056, 0.2636763, -0.3809458, 1, 0, 0.4784314, 1,
1.380623, -1.317901, 1.668445, 1, 0, 0.4745098, 1,
1.381136, -0.6865396, 1.96774, 1, 0, 0.4666667, 1,
1.383255, 0.3656656, 1.56338, 1, 0, 0.4627451, 1,
1.394588, -1.307488, 1.640635, 1, 0, 0.454902, 1,
1.395646, -1.055697, 2.79385, 1, 0, 0.4509804, 1,
1.395945, 0.436262, 2.626934, 1, 0, 0.4431373, 1,
1.399096, 1.408905, 1.647783, 1, 0, 0.4392157, 1,
1.403899, 2.256465, 2.006763, 1, 0, 0.4313726, 1,
1.406678, -0.7542203, 2.155498, 1, 0, 0.427451, 1,
1.410535, -0.9371093, 1.824642, 1, 0, 0.4196078, 1,
1.413217, 0.3730766, 0.3361021, 1, 0, 0.4156863, 1,
1.429579, 0.2326307, 0.8809155, 1, 0, 0.4078431, 1,
1.436406, -0.9326183, 3.35159, 1, 0, 0.4039216, 1,
1.447387, -0.3485098, 1.658333, 1, 0, 0.3960784, 1,
1.451935, -0.7004105, 3.900048, 1, 0, 0.3882353, 1,
1.458487, 1.563595, 0.6239837, 1, 0, 0.3843137, 1,
1.468805, -0.5958097, 2.078138, 1, 0, 0.3764706, 1,
1.491117, -0.04833097, 1.284107, 1, 0, 0.372549, 1,
1.501891, 1.603605, 0.7712521, 1, 0, 0.3647059, 1,
1.520073, -0.5360445, 3.033767, 1, 0, 0.3607843, 1,
1.530401, -1.579255, 0.7252327, 1, 0, 0.3529412, 1,
1.539849, -0.1151056, 1.345323, 1, 0, 0.3490196, 1,
1.544527, -0.6140728, 1.92487, 1, 0, 0.3411765, 1,
1.558512, -0.7341838, 1.0819, 1, 0, 0.3372549, 1,
1.560179, -0.5119572, 1.639054, 1, 0, 0.3294118, 1,
1.577429, 0.5245996, 1.486316, 1, 0, 0.3254902, 1,
1.601149, 0.7843722, 0.05398626, 1, 0, 0.3176471, 1,
1.603075, 0.9763719, 1.486641, 1, 0, 0.3137255, 1,
1.607987, 0.9714534, -0.4073089, 1, 0, 0.3058824, 1,
1.60946, 1.503358, 1.660669, 1, 0, 0.2980392, 1,
1.633494, -1.228711, 2.756043, 1, 0, 0.2941177, 1,
1.634877, -0.9725182, 2.003266, 1, 0, 0.2862745, 1,
1.640057, -0.3207574, 2.676684, 1, 0, 0.282353, 1,
1.640932, -2.003318, 3.524875, 1, 0, 0.2745098, 1,
1.662422, -0.9221498, 2.341177, 1, 0, 0.2705882, 1,
1.667576, -1.348281, 2.242324, 1, 0, 0.2627451, 1,
1.670495, -0.4159546, 3.037719, 1, 0, 0.2588235, 1,
1.688348, 0.9586558, 0.2200595, 1, 0, 0.2509804, 1,
1.702621, -0.07934992, 0.8083159, 1, 0, 0.2470588, 1,
1.713162, 0.4419122, 2.290489, 1, 0, 0.2392157, 1,
1.718522, 0.7538989, 0.9211025, 1, 0, 0.2352941, 1,
1.721032, -0.2915283, -0.3516976, 1, 0, 0.227451, 1,
1.72481, -0.263541, 1.012718, 1, 0, 0.2235294, 1,
1.726119, 0.1903615, 1.735341, 1, 0, 0.2156863, 1,
1.729601, 0.5657675, -0.1495704, 1, 0, 0.2117647, 1,
1.750041, -2.244685, 4.059081, 1, 0, 0.2039216, 1,
1.753987, -0.7076529, 2.450127, 1, 0, 0.1960784, 1,
1.762145, 1.428187, 1.380078, 1, 0, 0.1921569, 1,
1.763448, 1.034292, 1.595578, 1, 0, 0.1843137, 1,
1.773736, -0.7267783, 3.222729, 1, 0, 0.1803922, 1,
1.803531, 1.541102, 0.5384068, 1, 0, 0.172549, 1,
1.815267, -0.5016518, -0.5348438, 1, 0, 0.1686275, 1,
1.81867, 1.253157, 0.969462, 1, 0, 0.1607843, 1,
1.841511, -1.575435, 1.675556, 1, 0, 0.1568628, 1,
1.850821, 1.204087, 0.6292393, 1, 0, 0.1490196, 1,
1.876437, 0.2320111, 0.7042502, 1, 0, 0.145098, 1,
1.933299, 0.9430676, 0.2645889, 1, 0, 0.1372549, 1,
1.985709, -0.5747969, 1.594782, 1, 0, 0.1333333, 1,
2.018461, -0.3887883, 1.821221, 1, 0, 0.1254902, 1,
2.030861, 0.2060332, 1.063191, 1, 0, 0.1215686, 1,
2.06138, -0.4422445, 2.139407, 1, 0, 0.1137255, 1,
2.068776, 1.32294, 1.055649, 1, 0, 0.1098039, 1,
2.097374, -1.311182, 2.838113, 1, 0, 0.1019608, 1,
2.138042, 0.6823391, 2.707553, 1, 0, 0.09411765, 1,
2.14204, 0.6929787, -0.9779107, 1, 0, 0.09019608, 1,
2.145382, -0.1170087, 2.459966, 1, 0, 0.08235294, 1,
2.20485, -2.071682, 1.536572, 1, 0, 0.07843138, 1,
2.22128, 0.4559025, 2.825881, 1, 0, 0.07058824, 1,
2.226954, 0.6078299, 2.52162, 1, 0, 0.06666667, 1,
2.267261, -1.8823, 2.076206, 1, 0, 0.05882353, 1,
2.287097, 0.1209639, 0.04010161, 1, 0, 0.05490196, 1,
2.455045, -0.5975485, 1.564561, 1, 0, 0.04705882, 1,
2.475911, 0.7309334, 1.110285, 1, 0, 0.04313726, 1,
2.58904, -0.9620224, 2.837682, 1, 0, 0.03529412, 1,
2.679089, -1.137528, 1.036349, 1, 0, 0.03137255, 1,
2.68516, -0.2539597, 0.8265472, 1, 0, 0.02352941, 1,
2.716285, 0.9850129, 2.278641, 1, 0, 0.01960784, 1,
2.753117, -0.2239303, 1.725536, 1, 0, 0.01176471, 1,
3.095713, 0.6048796, 2.633005, 1, 0, 0.007843138, 1
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
-0.004007816, -4.698876, -8.633518, 0, -0.5, 0.5, 0.5,
-0.004007816, -4.698876, -8.633518, 1, -0.5, 0.5, 0.5,
-0.004007816, -4.698876, -8.633518, 1, 1.5, 0.5, 0.5,
-0.004007816, -4.698876, -8.633518, 0, 1.5, 0.5, 0.5
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
-4.154534, -0.05929697, -8.633518, 0, -0.5, 0.5, 0.5,
-4.154534, -0.05929697, -8.633518, 1, -0.5, 0.5, 0.5,
-4.154534, -0.05929697, -8.633518, 1, 1.5, 0.5, 0.5,
-4.154534, -0.05929697, -8.633518, 0, 1.5, 0.5, 0.5
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
-4.154534, -4.698876, -0.6166458, 0, -0.5, 0.5, 0.5,
-4.154534, -4.698876, -0.6166458, 1, -0.5, 0.5, 0.5,
-4.154534, -4.698876, -0.6166458, 1, 1.5, 0.5, 0.5,
-4.154534, -4.698876, -0.6166458, 0, 1.5, 0.5, 0.5
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
-3, -3.628204, -6.783471,
3, -3.628204, -6.783471,
-3, -3.628204, -6.783471,
-3, -3.80665, -7.091812,
-2, -3.628204, -6.783471,
-2, -3.80665, -7.091812,
-1, -3.628204, -6.783471,
-1, -3.80665, -7.091812,
0, -3.628204, -6.783471,
0, -3.80665, -7.091812,
1, -3.628204, -6.783471,
1, -3.80665, -7.091812,
2, -3.628204, -6.783471,
2, -3.80665, -7.091812,
3, -3.628204, -6.783471,
3, -3.80665, -7.091812
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
-3, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
-3, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
-3, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
-3, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5,
-2, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
-2, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
-2, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
-2, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5,
-1, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
-1, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
-1, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
-1, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5,
0, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
0, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
0, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
0, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5,
1, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
1, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
1, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
1, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5,
2, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
2, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
2, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
2, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5,
3, -4.16354, -7.708495, 0, -0.5, 0.5, 0.5,
3, -4.16354, -7.708495, 1, -0.5, 0.5, 0.5,
3, -4.16354, -7.708495, 1, 1.5, 0.5, 0.5,
3, -4.16354, -7.708495, 0, 1.5, 0.5, 0.5
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
-3.196721, -3, -6.783471,
-3.196721, 3, -6.783471,
-3.196721, -3, -6.783471,
-3.356356, -3, -7.091812,
-3.196721, -2, -6.783471,
-3.356356, -2, -7.091812,
-3.196721, -1, -6.783471,
-3.356356, -1, -7.091812,
-3.196721, 0, -6.783471,
-3.356356, 0, -7.091812,
-3.196721, 1, -6.783471,
-3.356356, 1, -7.091812,
-3.196721, 2, -6.783471,
-3.356356, 2, -7.091812,
-3.196721, 3, -6.783471,
-3.356356, 3, -7.091812
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
-3.675627, -3, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, -3, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, -3, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, -3, -7.708495, 0, 1.5, 0.5, 0.5,
-3.675627, -2, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, -2, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, -2, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, -2, -7.708495, 0, 1.5, 0.5, 0.5,
-3.675627, -1, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, -1, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, -1, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, -1, -7.708495, 0, 1.5, 0.5, 0.5,
-3.675627, 0, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, 0, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, 0, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, 0, -7.708495, 0, 1.5, 0.5, 0.5,
-3.675627, 1, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, 1, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, 1, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, 1, -7.708495, 0, 1.5, 0.5, 0.5,
-3.675627, 2, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, 2, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, 2, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, 2, -7.708495, 0, 1.5, 0.5, 0.5,
-3.675627, 3, -7.708495, 0, -0.5, 0.5, 0.5,
-3.675627, 3, -7.708495, 1, -0.5, 0.5, 0.5,
-3.675627, 3, -7.708495, 1, 1.5, 0.5, 0.5,
-3.675627, 3, -7.708495, 0, 1.5, 0.5, 0.5
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
-3.196721, -3.628204, -6,
-3.196721, -3.628204, 4,
-3.196721, -3.628204, -6,
-3.356356, -3.80665, -6,
-3.196721, -3.628204, -4,
-3.356356, -3.80665, -4,
-3.196721, -3.628204, -2,
-3.356356, -3.80665, -2,
-3.196721, -3.628204, 0,
-3.356356, -3.80665, 0,
-3.196721, -3.628204, 2,
-3.356356, -3.80665, 2,
-3.196721, -3.628204, 4,
-3.356356, -3.80665, 4
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
-3.675627, -4.16354, -6, 0, -0.5, 0.5, 0.5,
-3.675627, -4.16354, -6, 1, -0.5, 0.5, 0.5,
-3.675627, -4.16354, -6, 1, 1.5, 0.5, 0.5,
-3.675627, -4.16354, -6, 0, 1.5, 0.5, 0.5,
-3.675627, -4.16354, -4, 0, -0.5, 0.5, 0.5,
-3.675627, -4.16354, -4, 1, -0.5, 0.5, 0.5,
-3.675627, -4.16354, -4, 1, 1.5, 0.5, 0.5,
-3.675627, -4.16354, -4, 0, 1.5, 0.5, 0.5,
-3.675627, -4.16354, -2, 0, -0.5, 0.5, 0.5,
-3.675627, -4.16354, -2, 1, -0.5, 0.5, 0.5,
-3.675627, -4.16354, -2, 1, 1.5, 0.5, 0.5,
-3.675627, -4.16354, -2, 0, 1.5, 0.5, 0.5,
-3.675627, -4.16354, 0, 0, -0.5, 0.5, 0.5,
-3.675627, -4.16354, 0, 1, -0.5, 0.5, 0.5,
-3.675627, -4.16354, 0, 1, 1.5, 0.5, 0.5,
-3.675627, -4.16354, 0, 0, 1.5, 0.5, 0.5,
-3.675627, -4.16354, 2, 0, -0.5, 0.5, 0.5,
-3.675627, -4.16354, 2, 1, -0.5, 0.5, 0.5,
-3.675627, -4.16354, 2, 1, 1.5, 0.5, 0.5,
-3.675627, -4.16354, 2, 0, 1.5, 0.5, 0.5,
-3.675627, -4.16354, 4, 0, -0.5, 0.5, 0.5,
-3.675627, -4.16354, 4, 1, -0.5, 0.5, 0.5,
-3.675627, -4.16354, 4, 1, 1.5, 0.5, 0.5,
-3.675627, -4.16354, 4, 0, 1.5, 0.5, 0.5
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
-3.196721, -3.628204, -6.783471,
-3.196721, 3.50961, -6.783471,
-3.196721, -3.628204, 5.550179,
-3.196721, 3.50961, 5.550179,
-3.196721, -3.628204, -6.783471,
-3.196721, -3.628204, 5.550179,
-3.196721, 3.50961, -6.783471,
-3.196721, 3.50961, 5.550179,
-3.196721, -3.628204, -6.783471,
3.188705, -3.628204, -6.783471,
-3.196721, -3.628204, 5.550179,
3.188705, -3.628204, 5.550179,
-3.196721, 3.50961, -6.783471,
3.188705, 3.50961, -6.783471,
-3.196721, 3.50961, 5.550179,
3.188705, 3.50961, 5.550179,
3.188705, -3.628204, -6.783471,
3.188705, 3.50961, -6.783471,
3.188705, -3.628204, 5.550179,
3.188705, 3.50961, 5.550179,
3.188705, -3.628204, -6.783471,
3.188705, -3.628204, 5.550179,
3.188705, 3.50961, -6.783471,
3.188705, 3.50961, 5.550179
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
var radius = 8.338325;
var distance = 37.09815;
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
mvMatrix.translate( 0.004007816, 0.05929697, 0.6166458 );
mvMatrix.scale( 1.411897, 1.26307, 0.7309726 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.09815);
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
naphthaleneacetamide<-read.table("naphthaleneacetamide.xyz", skip=1)
```

```
## Error in read.table("naphthaleneacetamide.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-naphthaleneacetamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'naphthaleneacetamide' not found
```

```r
y<-naphthaleneacetamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'naphthaleneacetamide' not found
```

```r
z<-naphthaleneacetamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'naphthaleneacetamide' not found
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
-3.103729, -0.8503464, -0.02791173, 0, 0, 1, 1, 1,
-2.87638, 0.1334645, -0.9725773, 1, 0, 0, 1, 1,
-2.857901, -0.4928091, -1.562844, 1, 0, 0, 1, 1,
-2.806014, 0.8742123, -2.141106, 1, 0, 0, 1, 1,
-2.674989, -0.8103768, -1.654436, 1, 0, 0, 1, 1,
-2.587783, -1.595375, -1.58398, 1, 0, 0, 1, 1,
-2.578402, -0.1458358, -2.284847, 0, 0, 0, 1, 1,
-2.539907, -2.879644, -2.690722, 0, 0, 0, 1, 1,
-2.318984, -1.424458, -3.258203, 0, 0, 0, 1, 1,
-2.303316, 1.260219, -0.7263669, 0, 0, 0, 1, 1,
-2.263085, 0.4904994, -2.286924, 0, 0, 0, 1, 1,
-2.262743, -0.3044048, -1.490711, 0, 0, 0, 1, 1,
-2.262154, -0.693014, -2.788296, 0, 0, 0, 1, 1,
-2.221268, -0.05310548, -1.464719, 1, 1, 1, 1, 1,
-2.206834, -1.779294, -1.163768, 1, 1, 1, 1, 1,
-2.204206, 1.029687, -0.9403461, 1, 1, 1, 1, 1,
-2.199564, -0.9359105, -2.962774, 1, 1, 1, 1, 1,
-2.003621, 0.2452798, -1.038279, 1, 1, 1, 1, 1,
-1.994715, 0.3941098, -2.85799, 1, 1, 1, 1, 1,
-1.982444, 0.1667129, -2.536443, 1, 1, 1, 1, 1,
-1.962265, -1.399085, -0.5243597, 1, 1, 1, 1, 1,
-1.952616, -1.383305, -2.413929, 1, 1, 1, 1, 1,
-1.951379, -0.3849944, -2.188123, 1, 1, 1, 1, 1,
-1.91964, -0.8655646, -1.173838, 1, 1, 1, 1, 1,
-1.89688, 0.1304572, -1.172328, 1, 1, 1, 1, 1,
-1.833522, 0.4184374, -0.401106, 1, 1, 1, 1, 1,
-1.822516, 1.786796, -0.9206221, 1, 1, 1, 1, 1,
-1.815925, 0.1556398, -0.5199413, 1, 1, 1, 1, 1,
-1.81469, 1.452322, -0.4440532, 0, 0, 1, 1, 1,
-1.805713, -0.5688981, -2.368487, 1, 0, 0, 1, 1,
-1.80138, -0.4259003, -1.814747, 1, 0, 0, 1, 1,
-1.791505, 0.3816769, -1.476988, 1, 0, 0, 1, 1,
-1.785613, -1.335042, -2.00779, 1, 0, 0, 1, 1,
-1.781354, 1.938502, -0.5127553, 1, 0, 0, 1, 1,
-1.775623, -1.9122, -2.637042, 0, 0, 0, 1, 1,
-1.766926, -0.3503921, -1.600356, 0, 0, 0, 1, 1,
-1.76266, -1.586097, -0.9651882, 0, 0, 0, 1, 1,
-1.734749, 1.938509, -0.07273496, 0, 0, 0, 1, 1,
-1.720533, 0.5675361, -1.310524, 0, 0, 0, 1, 1,
-1.719362, -0.07041235, -2.525491, 0, 0, 0, 1, 1,
-1.695377, 0.201098, 1.234306, 0, 0, 0, 1, 1,
-1.674302, -2.585296, -3.243872, 1, 1, 1, 1, 1,
-1.668836, -1.757933, -1.497799, 1, 1, 1, 1, 1,
-1.661062, 0.1656338, -1.763015, 1, 1, 1, 1, 1,
-1.655195, 0.3057776, -0.6114617, 1, 1, 1, 1, 1,
-1.650485, -0.7733902, -1.321997, 1, 1, 1, 1, 1,
-1.636384, 0.9526315, -1.379164, 1, 1, 1, 1, 1,
-1.631544, -2.264595, -3.449715, 1, 1, 1, 1, 1,
-1.605105, 0.159087, -2.510917, 1, 1, 1, 1, 1,
-1.577345, 0.8788711, -1.561529, 1, 1, 1, 1, 1,
-1.567192, 0.9786208, 0.3527007, 1, 1, 1, 1, 1,
-1.566522, -0.1981605, 0.9942522, 1, 1, 1, 1, 1,
-1.557044, -1.334129, -3.296251, 1, 1, 1, 1, 1,
-1.544144, 2.081727, 0.4175526, 1, 1, 1, 1, 1,
-1.543949, 0.4305839, 0.02789298, 1, 1, 1, 1, 1,
-1.524096, -0.06642544, -1.216356, 1, 1, 1, 1, 1,
-1.523823, -1.73228, -0.7907432, 0, 0, 1, 1, 1,
-1.5235, 0.9091845, -0.3042178, 1, 0, 0, 1, 1,
-1.520406, -0.6491616, -2.307994, 1, 0, 0, 1, 1,
-1.516165, 0.7260444, -0.5766489, 1, 0, 0, 1, 1,
-1.509284, -2.335407, -1.731524, 1, 0, 0, 1, 1,
-1.507115, -0.5137245, -1.660399, 1, 0, 0, 1, 1,
-1.501311, 1.136507, -0.8950217, 0, 0, 0, 1, 1,
-1.491835, -0.3349801, -2.076073, 0, 0, 0, 1, 1,
-1.485786, -2.607774, -3.348161, 0, 0, 0, 1, 1,
-1.479213, -0.2001867, -1.019079, 0, 0, 0, 1, 1,
-1.477529, 1.084559, -0.09094594, 0, 0, 0, 1, 1,
-1.476964, -0.3450393, -2.174034, 0, 0, 0, 1, 1,
-1.463077, 0.7629392, -0.07255921, 0, 0, 0, 1, 1,
-1.457269, -1.463987, -0.8050078, 1, 1, 1, 1, 1,
-1.454971, -0.5853733, -1.614543, 1, 1, 1, 1, 1,
-1.440277, -0.490701, -0.681687, 1, 1, 1, 1, 1,
-1.43172, -0.1907967, -1.374246, 1, 1, 1, 1, 1,
-1.43141, 0.8355012, -1.500991, 1, 1, 1, 1, 1,
-1.427472, 2.593032, 0.480742, 1, 1, 1, 1, 1,
-1.426345, 0.8375973, -2.115949, 1, 1, 1, 1, 1,
-1.412276, -0.8205532, -1.636598, 1, 1, 1, 1, 1,
-1.402266, -1.091192, -1.318918, 1, 1, 1, 1, 1,
-1.399788, 0.6509439, 0.5144081, 1, 1, 1, 1, 1,
-1.391416, 0.37514, -1.405077, 1, 1, 1, 1, 1,
-1.380813, -1.807928, -2.156877, 1, 1, 1, 1, 1,
-1.365181, -1.326498, -1.525279, 1, 1, 1, 1, 1,
-1.362464, 1.503305, 0.5386024, 1, 1, 1, 1, 1,
-1.357826, 0.03949057, -1.952879, 1, 1, 1, 1, 1,
-1.331176, 0.6015854, -1.351955, 0, 0, 1, 1, 1,
-1.325281, -0.3281803, 0.212616, 1, 0, 0, 1, 1,
-1.313067, 0.8558051, -1.951256, 1, 0, 0, 1, 1,
-1.312983, 0.9390984, -0.8541891, 1, 0, 0, 1, 1,
-1.312419, -0.7871864, -1.268472, 1, 0, 0, 1, 1,
-1.309441, 2.785536, 0.109897, 1, 0, 0, 1, 1,
-1.308034, 0.1716009, -3.08621, 0, 0, 0, 1, 1,
-1.295717, 0.2477637, -0.3019346, 0, 0, 0, 1, 1,
-1.293295, -0.4408607, -1.222144, 0, 0, 0, 1, 1,
-1.273016, 0.8967121, -0.9998456, 0, 0, 0, 1, 1,
-1.272158, -1.405243, -2.724138, 0, 0, 0, 1, 1,
-1.265518, 0.003972532, -0.3473559, 0, 0, 0, 1, 1,
-1.24971, -0.9055272, -1.198033, 0, 0, 0, 1, 1,
-1.247708, 0.8910282, -1.257014, 1, 1, 1, 1, 1,
-1.236912, 0.9600617, -1.599317, 1, 1, 1, 1, 1,
-1.233559, 0.9947833, -1.493537, 1, 1, 1, 1, 1,
-1.231591, 1.880115, -0.09570307, 1, 1, 1, 1, 1,
-1.228323, 0.5272852, -0.5862541, 1, 1, 1, 1, 1,
-1.224346, 0.555342, -0.4727043, 1, 1, 1, 1, 1,
-1.21553, 1.031697, -0.9348377, 1, 1, 1, 1, 1,
-1.209595, 0.2351095, -1.381081, 1, 1, 1, 1, 1,
-1.207196, -0.05492957, -2.646347, 1, 1, 1, 1, 1,
-1.203897, -1.441398, -3.943434, 1, 1, 1, 1, 1,
-1.200086, -0.6794628, -2.483427, 1, 1, 1, 1, 1,
-1.192806, -0.6080719, 0.05113737, 1, 1, 1, 1, 1,
-1.186131, 0.9164737, 0.2286308, 1, 1, 1, 1, 1,
-1.18599, 0.3330748, -2.346708, 1, 1, 1, 1, 1,
-1.185754, 0.2811319, -0.6868495, 1, 1, 1, 1, 1,
-1.185581, -0.6119757, -1.156991, 0, 0, 1, 1, 1,
-1.17983, -0.2124577, -0.7101753, 1, 0, 0, 1, 1,
-1.178618, 0.3272264, -1.959086, 1, 0, 0, 1, 1,
-1.178153, -0.1542555, -1.524031, 1, 0, 0, 1, 1,
-1.178068, -0.5565486, -1.45171, 1, 0, 0, 1, 1,
-1.176853, 0.9989817, -2.002522, 1, 0, 0, 1, 1,
-1.172982, -0.0435195, -2.254555, 0, 0, 0, 1, 1,
-1.167792, -0.854711, -2.684794, 0, 0, 0, 1, 1,
-1.165172, 0.2694223, -2.517734, 0, 0, 0, 1, 1,
-1.155751, 1.574392, 0.6292395, 0, 0, 0, 1, 1,
-1.151773, 0.2386955, -0.9050772, 0, 0, 0, 1, 1,
-1.146969, -0.2773264, -1.964636, 0, 0, 0, 1, 1,
-1.138118, 1.560153, -1.762114, 0, 0, 0, 1, 1,
-1.136381, 0.6673657, -2.803749, 1, 1, 1, 1, 1,
-1.131324, 0.223969, -1.524711, 1, 1, 1, 1, 1,
-1.128402, 0.9218443, -1.463512, 1, 1, 1, 1, 1,
-1.126986, -1.31194, -2.084787, 1, 1, 1, 1, 1,
-1.12463, -1.485364, -3.013032, 1, 1, 1, 1, 1,
-1.123175, -0.4275827, -1.306685, 1, 1, 1, 1, 1,
-1.119721, -1.649592, -1.746454, 1, 1, 1, 1, 1,
-1.116515, 1.808299, -2.340613, 1, 1, 1, 1, 1,
-1.107736, -0.4518411, -1.952148, 1, 1, 1, 1, 1,
-1.107274, -0.8651478, -3.271792, 1, 1, 1, 1, 1,
-1.101173, -0.5285644, -2.996661, 1, 1, 1, 1, 1,
-1.090932, 0.0211941, -3.376357, 1, 1, 1, 1, 1,
-1.086939, -0.3178877, -1.900727, 1, 1, 1, 1, 1,
-1.08599, -0.5851887, -3.802853, 1, 1, 1, 1, 1,
-1.083326, 0.802718, -1.077604, 1, 1, 1, 1, 1,
-1.067498, 0.4499393, -0.8803738, 0, 0, 1, 1, 1,
-1.064937, -0.8798143, -2.669298, 1, 0, 0, 1, 1,
-1.063464, -1.207693, -3.279963, 1, 0, 0, 1, 1,
-1.052267, -0.7603397, -1.676919, 1, 0, 0, 1, 1,
-1.043175, 0.1410129, -2.160823, 1, 0, 0, 1, 1,
-1.039258, 0.08544932, 0.3329888, 1, 0, 0, 1, 1,
-1.025625, 0.1758344, -1.137346, 0, 0, 0, 1, 1,
-1.021758, 1.251969, -0.09831884, 0, 0, 0, 1, 1,
-1.020947, -0.06656682, -1.606802, 0, 0, 0, 1, 1,
-1.018667, -0.09437887, -2.554377, 0, 0, 0, 1, 1,
-1.014126, 1.026127, -1.089592, 0, 0, 0, 1, 1,
-1.003555, -0.8559835, -1.926069, 0, 0, 0, 1, 1,
-0.9897131, 0.4773893, -0.4172209, 0, 0, 0, 1, 1,
-0.9885058, 0.1042425, -0.6393599, 1, 1, 1, 1, 1,
-0.9702262, -0.6204019, -2.312593, 1, 1, 1, 1, 1,
-0.9631139, -0.7828906, -3.419297, 1, 1, 1, 1, 1,
-0.9615918, 0.1865869, -2.995978, 1, 1, 1, 1, 1,
-0.9602892, 1.081582, -2.447193, 1, 1, 1, 1, 1,
-0.9581376, -0.5530923, -2.399908, 1, 1, 1, 1, 1,
-0.950712, 1.681278, 0.5073264, 1, 1, 1, 1, 1,
-0.933531, -0.05147422, 0.515673, 1, 1, 1, 1, 1,
-0.9314442, 0.5597244, -0.7324625, 1, 1, 1, 1, 1,
-0.9155111, -0.4079849, -1.60874, 1, 1, 1, 1, 1,
-0.9086909, 0.4121017, 0.0915779, 1, 1, 1, 1, 1,
-0.9036541, -1.491678, -4.50519, 1, 1, 1, 1, 1,
-0.9004034, 0.1619033, -1.505969, 1, 1, 1, 1, 1,
-0.8967322, -1.788849, -2.769001, 1, 1, 1, 1, 1,
-0.8906063, -0.4782987, -3.56173, 1, 1, 1, 1, 1,
-0.8872623, 0.5536266, -1.762393, 0, 0, 1, 1, 1,
-0.8800377, 0.1452374, -3.12642, 1, 0, 0, 1, 1,
-0.8775585, -0.3303285, -1.628509, 1, 0, 0, 1, 1,
-0.8762127, 0.6642595, -1.24842, 1, 0, 0, 1, 1,
-0.8740368, 0.902109, -1.365848, 1, 0, 0, 1, 1,
-0.8670998, 0.6564066, -1.009662, 1, 0, 0, 1, 1,
-0.8597994, -0.2805225, -2.635261, 0, 0, 0, 1, 1,
-0.8592807, 0.7239667, -1.451659, 0, 0, 0, 1, 1,
-0.8589217, 0.1574339, -0.07536643, 0, 0, 0, 1, 1,
-0.8581467, -0.8993785, -3.223759, 0, 0, 0, 1, 1,
-0.8543118, -0.3723051, -1.238693, 0, 0, 0, 1, 1,
-0.8514206, 1.535015, -1.688387, 0, 0, 0, 1, 1,
-0.8450075, 1.60641, -0.4835711, 0, 0, 0, 1, 1,
-0.8435683, 0.2169098, -1.820337, 1, 1, 1, 1, 1,
-0.8429167, -1.253906, -0.9399922, 1, 1, 1, 1, 1,
-0.8412043, -0.5790127, -2.24814, 1, 1, 1, 1, 1,
-0.8334476, -2.197663, -2.610073, 1, 1, 1, 1, 1,
-0.8320549, -0.06789391, -1.522222, 1, 1, 1, 1, 1,
-0.8319827, -2.084079, -1.097878, 1, 1, 1, 1, 1,
-0.8318918, 1.565538, -1.729742, 1, 1, 1, 1, 1,
-0.8304168, -0.4946252, -2.436959, 1, 1, 1, 1, 1,
-0.8301558, 1.183179, 0.07718621, 1, 1, 1, 1, 1,
-0.8259558, 1.427937, -0.2275476, 1, 1, 1, 1, 1,
-0.8233771, 0.9623742, -0.7340122, 1, 1, 1, 1, 1,
-0.8220029, -0.8592622, -3.78156, 1, 1, 1, 1, 1,
-0.8204238, -0.9042088, -2.656837, 1, 1, 1, 1, 1,
-0.8141959, 1.303324, -0.1786478, 1, 1, 1, 1, 1,
-0.8130098, -1.351365, -4.664564, 1, 1, 1, 1, 1,
-0.8123827, 0.2242661, -1.003603, 0, 0, 1, 1, 1,
-0.8105252, 0.5056785, -2.320873, 1, 0, 0, 1, 1,
-0.8005612, 0.6443591, -1.469, 1, 0, 0, 1, 1,
-0.7964155, -0.3302126, -1.542947, 1, 0, 0, 1, 1,
-0.79624, 0.1433076, -1.921669, 1, 0, 0, 1, 1,
-0.7948481, 1.350631, 0.6561248, 1, 0, 0, 1, 1,
-0.7833061, -0.1798729, -1.963719, 0, 0, 0, 1, 1,
-0.7828448, 2.223992, -0.6023164, 0, 0, 0, 1, 1,
-0.7821012, -1.101929, -0.8522651, 0, 0, 0, 1, 1,
-0.7790674, -0.2591896, -0.7279088, 0, 0, 0, 1, 1,
-0.7763405, -0.9790986, -2.516853, 0, 0, 0, 1, 1,
-0.7747686, -0.1100679, -1.793751, 0, 0, 0, 1, 1,
-0.7739094, -1.339966, -2.931796, 0, 0, 0, 1, 1,
-0.7734079, -0.2057964, -3.379412, 1, 1, 1, 1, 1,
-0.7724707, 0.8020807, -0.970395, 1, 1, 1, 1, 1,
-0.7688554, 0.1058351, -0.7350729, 1, 1, 1, 1, 1,
-0.7688493, -0.3274146, -2.081175, 1, 1, 1, 1, 1,
-0.7680482, 0.1670906, -1.95989, 1, 1, 1, 1, 1,
-0.7673495, 0.9523222, 0.12944, 1, 1, 1, 1, 1,
-0.7672806, -0.04259077, -0.9851978, 1, 1, 1, 1, 1,
-0.7620074, 0.01711603, -1.361004, 1, 1, 1, 1, 1,
-0.7614117, -0.4532405, -2.46004, 1, 1, 1, 1, 1,
-0.7584455, -0.2321716, -2.063119, 1, 1, 1, 1, 1,
-0.7557942, -2.005708, -3.966171, 1, 1, 1, 1, 1,
-0.7554358, -0.6940719, -3.566851, 1, 1, 1, 1, 1,
-0.7544445, 0.0962871, 0.2341857, 1, 1, 1, 1, 1,
-0.752501, -0.3751034, -1.575766, 1, 1, 1, 1, 1,
-0.7509678, -1.223039, -3.529248, 1, 1, 1, 1, 1,
-0.7480121, -0.9458539, -1.323897, 0, 0, 1, 1, 1,
-0.7437794, -0.2164486, -1.325751, 1, 0, 0, 1, 1,
-0.7351658, -0.4612714, -2.238812, 1, 0, 0, 1, 1,
-0.734075, -1.422903, -3.387799, 1, 0, 0, 1, 1,
-0.7292796, -0.2060617, -3.082402, 1, 0, 0, 1, 1,
-0.7284863, 1.027196, -1.903618, 1, 0, 0, 1, 1,
-0.7281005, -1.178612, -3.661432, 0, 0, 0, 1, 1,
-0.7266112, -0.4681343, -2.496343, 0, 0, 0, 1, 1,
-0.7243716, -1.008608, -1.790779, 0, 0, 0, 1, 1,
-0.7156402, -0.727828, -1.891746, 0, 0, 0, 1, 1,
-0.7146168, 0.2026857, -1.025744, 0, 0, 0, 1, 1,
-0.71456, -0.2711766, -3.083472, 0, 0, 0, 1, 1,
-0.7144032, -0.371965, -2.834873, 0, 0, 0, 1, 1,
-0.7142628, -0.7469427, -4.240445, 1, 1, 1, 1, 1,
-0.7126727, 1.374927, -1.826011, 1, 1, 1, 1, 1,
-0.7124571, -1.120854, -2.584778, 1, 1, 1, 1, 1,
-0.7066379, 0.1710294, -2.097033, 1, 1, 1, 1, 1,
-0.7030594, 1.0628, -0.1217883, 1, 1, 1, 1, 1,
-0.6946869, 0.6893066, 0.1049514, 1, 1, 1, 1, 1,
-0.6934883, 0.4175814, 3.046911, 1, 1, 1, 1, 1,
-0.6916341, -1.332363, -2.926772, 1, 1, 1, 1, 1,
-0.6898794, -0.3678738, -2.337706, 1, 1, 1, 1, 1,
-0.6807764, -1.100722, -1.505728, 1, 1, 1, 1, 1,
-0.6792734, -3.372588, -3.81368, 1, 1, 1, 1, 1,
-0.6782677, 1.312758, 0.1064991, 1, 1, 1, 1, 1,
-0.676762, 0.7140378, -0.8193932, 1, 1, 1, 1, 1,
-0.6715466, -0.7257211, -2.918851, 1, 1, 1, 1, 1,
-0.6689142, 0.3418776, -1.850916, 1, 1, 1, 1, 1,
-0.6609433, -0.2488729, -1.552711, 0, 0, 1, 1, 1,
-0.6541551, -0.3186639, -1.418451, 1, 0, 0, 1, 1,
-0.6531751, 1.869363, -0.7357486, 1, 0, 0, 1, 1,
-0.6521901, -0.5165327, -3.024857, 1, 0, 0, 1, 1,
-0.650081, -0.2015504, -1.670426, 1, 0, 0, 1, 1,
-0.6486111, 1.665269, -0.7278713, 1, 0, 0, 1, 1,
-0.6462535, -0.05670918, -2.14911, 0, 0, 0, 1, 1,
-0.6449549, 0.04374163, -2.53569, 0, 0, 0, 1, 1,
-0.6408981, 0.3342093, -0.9175865, 0, 0, 0, 1, 1,
-0.6357213, 1.364594, -1.637211, 0, 0, 0, 1, 1,
-0.6322752, -0.5764705, -2.028363, 0, 0, 0, 1, 1,
-0.6309633, -0.2519671, -1.239685, 0, 0, 0, 1, 1,
-0.6307293, 1.58396, -1.979483, 0, 0, 0, 1, 1,
-0.6306955, 0.9355037, -1.482516, 1, 1, 1, 1, 1,
-0.6291679, 1.154298, -1.409694, 1, 1, 1, 1, 1,
-0.6249205, -0.4296258, -1.160422, 1, 1, 1, 1, 1,
-0.6156147, -0.9559645, -3.281058, 1, 1, 1, 1, 1,
-0.6149645, 0.5038362, -2.412886, 1, 1, 1, 1, 1,
-0.6133294, 1.014684, -0.6440916, 1, 1, 1, 1, 1,
-0.6114497, 1.368615, -1.074138, 1, 1, 1, 1, 1,
-0.610691, -1.876313, -2.516255, 1, 1, 1, 1, 1,
-0.6091924, -0.4869537, -1.322968, 1, 1, 1, 1, 1,
-0.6081154, 0.3670533, -0.7952722, 1, 1, 1, 1, 1,
-0.6064795, 0.7330601, -0.3012004, 1, 1, 1, 1, 1,
-0.5990167, -0.836454, -1.195775, 1, 1, 1, 1, 1,
-0.5947262, -0.6218762, -2.010164, 1, 1, 1, 1, 1,
-0.5918531, 0.904194, -0.6864668, 1, 1, 1, 1, 1,
-0.5859269, 0.2381769, -1.364076, 1, 1, 1, 1, 1,
-0.5811362, 0.318885, -1.160062, 0, 0, 1, 1, 1,
-0.5757061, 0.7378665, 0.7167532, 1, 0, 0, 1, 1,
-0.5679265, -0.8469325, -3.883093, 1, 0, 0, 1, 1,
-0.567794, -1.311751, -2.868142, 1, 0, 0, 1, 1,
-0.5660506, 0.3350671, -0.3724577, 1, 0, 0, 1, 1,
-0.5637175, 0.4626996, -0.4215532, 1, 0, 0, 1, 1,
-0.5600342, -0.3579561, -1.830468, 0, 0, 0, 1, 1,
-0.5586689, -0.5138807, -2.506069, 0, 0, 0, 1, 1,
-0.5548133, -1.098807, -2.962037, 0, 0, 0, 1, 1,
-0.5515187, -0.9975113, -1.881044, 0, 0, 0, 1, 1,
-0.5486456, -0.8792907, -1.311446, 0, 0, 0, 1, 1,
-0.5434519, -0.4276544, -2.310349, 0, 0, 0, 1, 1,
-0.5389329, -2.208189, -5.223909, 0, 0, 0, 1, 1,
-0.5348366, -0.7318621, -2.058204, 1, 1, 1, 1, 1,
-0.5196086, 0.4069075, -0.6741776, 1, 1, 1, 1, 1,
-0.5152125, -0.3427058, -3.064816, 1, 1, 1, 1, 1,
-0.5150549, -1.001638, -2.411016, 1, 1, 1, 1, 1,
-0.5147924, 1.414545, -0.8811626, 1, 1, 1, 1, 1,
-0.5139824, -0.7217086, -2.241189, 1, 1, 1, 1, 1,
-0.5128734, 0.1840157, -2.387949, 1, 1, 1, 1, 1,
-0.5127618, 1.496809, -1.251438, 1, 1, 1, 1, 1,
-0.5076356, 1.007901, -2.422607, 1, 1, 1, 1, 1,
-0.5055895, -1.343909, -4.201944, 1, 1, 1, 1, 1,
-0.49888, 0.9028582, -0.3903354, 1, 1, 1, 1, 1,
-0.4960659, -0.5851347, -1.841785, 1, 1, 1, 1, 1,
-0.4949178, -1.270965, -3.969513, 1, 1, 1, 1, 1,
-0.4946636, -0.1007474, -0.9841692, 1, 1, 1, 1, 1,
-0.4940644, -2.10753, -2.548251, 1, 1, 1, 1, 1,
-0.4871697, 0.1126911, -0.8879171, 0, 0, 1, 1, 1,
-0.4868306, -0.7477785, -3.110422, 1, 0, 0, 1, 1,
-0.4865567, 0.2657394, -1.888427, 1, 0, 0, 1, 1,
-0.4863387, 0.8888317, -0.8661921, 1, 0, 0, 1, 1,
-0.4842111, -1.252033, -3.008328, 1, 0, 0, 1, 1,
-0.4771475, -1.602979, -3.571873, 1, 0, 0, 1, 1,
-0.4756213, 1.033621, -0.7230334, 0, 0, 0, 1, 1,
-0.4694843, 0.6621639, 0.4528815, 0, 0, 0, 1, 1,
-0.4690977, 0.7982574, -1.848953, 0, 0, 0, 1, 1,
-0.4674083, -0.6371959, -2.505, 0, 0, 0, 1, 1,
-0.4654379, 1.239395, 0.356075, 0, 0, 0, 1, 1,
-0.4621742, -0.3792844, -2.255486, 0, 0, 0, 1, 1,
-0.4564205, 1.90076, -2.200811, 0, 0, 0, 1, 1,
-0.453312, -0.7241281, -3.151866, 1, 1, 1, 1, 1,
-0.4518777, 1.206673, -1.591946, 1, 1, 1, 1, 1,
-0.4483019, -0.6111093, -3.362991, 1, 1, 1, 1, 1,
-0.4470013, 0.2794668, -0.3960222, 1, 1, 1, 1, 1,
-0.4465381, -1.610043, -1.718654, 1, 1, 1, 1, 1,
-0.4444132, -1.26199, -2.364234, 1, 1, 1, 1, 1,
-0.4443711, 0.8703356, -2.414352, 1, 1, 1, 1, 1,
-0.4442455, -0.9846157, -3.286095, 1, 1, 1, 1, 1,
-0.4422148, 0.02334081, -1.380749, 1, 1, 1, 1, 1,
-0.4420455, -0.885906, -3.384445, 1, 1, 1, 1, 1,
-0.4412391, 1.222943, -0.2435993, 1, 1, 1, 1, 1,
-0.428844, 1.438644, -1.040934, 1, 1, 1, 1, 1,
-0.4280634, -0.7757279, -4.104426, 1, 1, 1, 1, 1,
-0.4272034, 0.986378, -0.1707011, 1, 1, 1, 1, 1,
-0.423139, -1.610154, -3.091857, 1, 1, 1, 1, 1,
-0.4231015, 0.7225593, -0.2946981, 0, 0, 1, 1, 1,
-0.420031, 1.030743, -2.120171, 1, 0, 0, 1, 1,
-0.4176705, -0.8283808, -1.610561, 1, 0, 0, 1, 1,
-0.4164931, 0.2382889, -0.8677562, 1, 0, 0, 1, 1,
-0.416017, 1.337801, -0.4502287, 1, 0, 0, 1, 1,
-0.4158146, 0.06516486, -1.467555, 1, 0, 0, 1, 1,
-0.4145423, -0.2592305, -3.334894, 0, 0, 0, 1, 1,
-0.4088091, 0.9663126, -1.484996, 0, 0, 0, 1, 1,
-0.4049549, 1.628726, -0.5330852, 0, 0, 0, 1, 1,
-0.4036114, -0.9376066, -3.015869, 0, 0, 0, 1, 1,
-0.403017, 1.897772, -0.1030592, 0, 0, 0, 1, 1,
-0.3965293, -0.5489232, -3.421508, 0, 0, 0, 1, 1,
-0.3957498, 1.62088, -1.995672, 0, 0, 0, 1, 1,
-0.3930135, 0.6887622, -1.814274, 1, 1, 1, 1, 1,
-0.3903972, 1.344189, 0.1140017, 1, 1, 1, 1, 1,
-0.3899572, 1.049407, -0.4380282, 1, 1, 1, 1, 1,
-0.3868868, 0.9456803, -1.441815, 1, 1, 1, 1, 1,
-0.3807419, -0.7561464, -2.480763, 1, 1, 1, 1, 1,
-0.376076, 0.380701, 0.2731308, 1, 1, 1, 1, 1,
-0.374484, 0.7063971, -1.268239, 1, 1, 1, 1, 1,
-0.374398, 0.8791125, 2.053003, 1, 1, 1, 1, 1,
-0.3729619, 1.372128, -0.7553239, 1, 1, 1, 1, 1,
-0.3703049, -1.129307, -3.359204, 1, 1, 1, 1, 1,
-0.3662906, 0.6011748, -0.5208023, 1, 1, 1, 1, 1,
-0.3604619, -0.6486463, -1.739124, 1, 1, 1, 1, 1,
-0.3604441, 1.711119, 0.5333887, 1, 1, 1, 1, 1,
-0.3561417, 0.6154017, -1.827901, 1, 1, 1, 1, 1,
-0.3470241, -0.6245909, 0.3423676, 1, 1, 1, 1, 1,
-0.3463363, -1.688301, -6.603855, 0, 0, 1, 1, 1,
-0.3414896, 1.332894, -0.5093309, 1, 0, 0, 1, 1,
-0.3362302, 1.250365, -1.683159, 1, 0, 0, 1, 1,
-0.3341455, 0.5652451, 1.017069, 1, 0, 0, 1, 1,
-0.3334367, 0.6268848, 0.5943306, 1, 0, 0, 1, 1,
-0.3294201, -0.5971939, -4.411108, 1, 0, 0, 1, 1,
-0.32666, -0.2685198, -2.355603, 0, 0, 0, 1, 1,
-0.3263908, -0.6616657, -2.277514, 0, 0, 0, 1, 1,
-0.3192379, 1.300289, 1.22319, 0, 0, 0, 1, 1,
-0.3187947, 1.540916, 0.7013981, 0, 0, 0, 1, 1,
-0.3176396, 0.2007333, -0.7177771, 0, 0, 0, 1, 1,
-0.3167473, 0.2502399, -2.297631, 0, 0, 0, 1, 1,
-0.3107986, 0.1165241, -1.398699, 0, 0, 0, 1, 1,
-0.3106419, -0.1618384, -0.9923869, 1, 1, 1, 1, 1,
-0.3103677, -2.567423, -1.960028, 1, 1, 1, 1, 1,
-0.3099216, -0.8676252, -2.42538, 1, 1, 1, 1, 1,
-0.306085, 1.615866, -0.3375196, 1, 1, 1, 1, 1,
-0.3056844, 1.713259, -0.801761, 1, 1, 1, 1, 1,
-0.3016138, -0.1334146, -4.668766, 1, 1, 1, 1, 1,
-0.2984911, -0.7809505, -2.052881, 1, 1, 1, 1, 1,
-0.2979519, -0.2480977, -3.294858, 1, 1, 1, 1, 1,
-0.2905838, 0.03216676, -2.202235, 1, 1, 1, 1, 1,
-0.2898051, -1.531403, -3.341831, 1, 1, 1, 1, 1,
-0.2896235, -0.7981626, -2.862103, 1, 1, 1, 1, 1,
-0.2785341, -1.238301, -2.67792, 1, 1, 1, 1, 1,
-0.2774805, -0.4862653, -3.889971, 1, 1, 1, 1, 1,
-0.2771891, 0.3237746, -1.107138, 1, 1, 1, 1, 1,
-0.2758158, 1.01843, 1.670004, 1, 1, 1, 1, 1,
-0.2751828, 0.706082, 1.288245, 0, 0, 1, 1, 1,
-0.273292, 0.6624844, 0.4470552, 1, 0, 0, 1, 1,
-0.2726053, -0.1352688, -2.383218, 1, 0, 0, 1, 1,
-0.2721178, 0.4344275, -2.940526, 1, 0, 0, 1, 1,
-0.2698523, 0.4922449, 0.9862495, 1, 0, 0, 1, 1,
-0.2676673, 0.4294799, 1.979404, 1, 0, 0, 1, 1,
-0.2659731, -0.3028855, -3.36088, 0, 0, 0, 1, 1,
-0.2645227, -0.874727, -3.011639, 0, 0, 0, 1, 1,
-0.263257, 0.04209222, -1.227122, 0, 0, 0, 1, 1,
-0.2613589, -2.210279, -2.509995, 0, 0, 0, 1, 1,
-0.2564799, -0.9014609, -1.702275, 0, 0, 0, 1, 1,
-0.2559634, 1.142452, 0.3639696, 0, 0, 0, 1, 1,
-0.2556013, 2.126809, -1.316224, 0, 0, 0, 1, 1,
-0.2545088, 0.8949974, -1.151547, 1, 1, 1, 1, 1,
-0.2543193, 1.945606, -1.10106, 1, 1, 1, 1, 1,
-0.2514934, -0.04687281, -2.122952, 1, 1, 1, 1, 1,
-0.2509421, -1.595201, -2.3479, 1, 1, 1, 1, 1,
-0.2503086, -0.1217167, -1.566999, 1, 1, 1, 1, 1,
-0.2466766, 0.9538226, -1.160132, 1, 1, 1, 1, 1,
-0.2429457, 0.320931, -0.8673968, 1, 1, 1, 1, 1,
-0.2356713, -1.210684, -1.639022, 1, 1, 1, 1, 1,
-0.2240316, -1.268943, -1.922674, 1, 1, 1, 1, 1,
-0.2223469, -1.543959, -3.330653, 1, 1, 1, 1, 1,
-0.2204448, 0.6275544, 0.4308615, 1, 1, 1, 1, 1,
-0.2201255, 0.655165, -1.866608, 1, 1, 1, 1, 1,
-0.2200199, 0.2249733, 0.7679464, 1, 1, 1, 1, 1,
-0.2192923, -1.321709, -3.681341, 1, 1, 1, 1, 1,
-0.2159082, 0.8983593, 0.9553426, 1, 1, 1, 1, 1,
-0.2156431, 0.9999731, 0.8760604, 0, 0, 1, 1, 1,
-0.2131966, -0.8501523, -1.458344, 1, 0, 0, 1, 1,
-0.2108378, 1.218843, -2.00739, 1, 0, 0, 1, 1,
-0.2100415, -1.878571, -3.485414, 1, 0, 0, 1, 1,
-0.207627, -1.32782, -2.512711, 1, 0, 0, 1, 1,
-0.1950958, -1.239514, -2.142595, 1, 0, 0, 1, 1,
-0.1943273, -0.09921052, -1.340412, 0, 0, 0, 1, 1,
-0.1893913, -0.110043, -2.613511, 0, 0, 0, 1, 1,
-0.18871, -0.543705, -3.107425, 0, 0, 0, 1, 1,
-0.1884412, 1.018619, 1.679012, 0, 0, 0, 1, 1,
-0.1837277, 0.4969248, -0.9499367, 0, 0, 0, 1, 1,
-0.1803031, -0.8245926, -3.554198, 0, 0, 0, 1, 1,
-0.1784648, 0.5442681, -1.304754, 0, 0, 0, 1, 1,
-0.1754589, 0.1956636, -1.410292, 1, 1, 1, 1, 1,
-0.1747847, 0.5505221, -1.485098, 1, 1, 1, 1, 1,
-0.1744768, -1.046491, -2.862722, 1, 1, 1, 1, 1,
-0.169497, -0.2810988, -2.153215, 1, 1, 1, 1, 1,
-0.1676908, 1.019413, 0.6007207, 1, 1, 1, 1, 1,
-0.1646408, 0.6904087, -1.551798, 1, 1, 1, 1, 1,
-0.1641302, -0.3665546, -4.163819, 1, 1, 1, 1, 1,
-0.1583413, -0.7610094, -0.4258275, 1, 1, 1, 1, 1,
-0.1564065, -0.3718215, -0.8919567, 1, 1, 1, 1, 1,
-0.15606, 1.249517, -1.662107, 1, 1, 1, 1, 1,
-0.1558034, 2.359737, -0.2450418, 1, 1, 1, 1, 1,
-0.1471554, -1.707635, -4.055574, 1, 1, 1, 1, 1,
-0.1458765, 1.171965, 0.6741608, 1, 1, 1, 1, 1,
-0.1438518, 1.181174, 1.602541, 1, 1, 1, 1, 1,
-0.1354245, -0.1804266, -1.731099, 1, 1, 1, 1, 1,
-0.1271695, -0.1394879, -2.42114, 0, 0, 1, 1, 1,
-0.1168591, -0.3226073, -1.312358, 1, 0, 0, 1, 1,
-0.1139643, 0.08024138, 0.2035133, 1, 0, 0, 1, 1,
-0.1126504, -1.450956, -3.027905, 1, 0, 0, 1, 1,
-0.1119628, -0.8280855, -2.540799, 1, 0, 0, 1, 1,
-0.1113699, 0.5405329, -0.8143365, 1, 0, 0, 1, 1,
-0.1111211, -1.167256, -3.074351, 0, 0, 0, 1, 1,
-0.1103925, -0.8135216, -2.954792, 0, 0, 0, 1, 1,
-0.1056659, 1.137147, -0.5992942, 0, 0, 0, 1, 1,
-0.09035866, -2.507504, -3.519264, 0, 0, 0, 1, 1,
-0.08763418, 1.58557, 0.2433143, 0, 0, 0, 1, 1,
-0.0870113, 0.553403, 1.341961, 0, 0, 0, 1, 1,
-0.08548906, -0.1303775, -2.639462, 0, 0, 0, 1, 1,
-0.08503927, -0.206554, -2.167043, 1, 1, 1, 1, 1,
-0.0849838, -1.712496, -1.619328, 1, 1, 1, 1, 1,
-0.08479863, 0.1760114, -0.4599844, 1, 1, 1, 1, 1,
-0.08438799, 0.9554894, -1.530614, 1, 1, 1, 1, 1,
-0.0817396, 0.8244877, 1.847493, 1, 1, 1, 1, 1,
-0.07980306, -0.07679729, -3.646235, 1, 1, 1, 1, 1,
-0.07940158, 0.6062878, -0.426888, 1, 1, 1, 1, 1,
-0.07934722, -0.5735105, -4.749049, 1, 1, 1, 1, 1,
-0.07816724, -0.4992968, -2.764477, 1, 1, 1, 1, 1,
-0.07164814, 0.2451763, -1.384437, 1, 1, 1, 1, 1,
-0.07106379, 0.4436014, 0.3655809, 1, 1, 1, 1, 1,
-0.06717427, -0.1283641, -1.86559, 1, 1, 1, 1, 1,
-0.06674881, 0.2852867, 0.3470881, 1, 1, 1, 1, 1,
-0.05995352, 0.9611939, 0.005102174, 1, 1, 1, 1, 1,
-0.05302795, 1.692734, 0.009086075, 1, 1, 1, 1, 1,
-0.05220223, -1.599212, -2.279362, 0, 0, 1, 1, 1,
-0.04640193, -1.480838, -1.320381, 1, 0, 0, 1, 1,
-0.0458268, -0.50963, -3.864811, 1, 0, 0, 1, 1,
-0.0435589, 0.4910942, -1.186548, 1, 0, 0, 1, 1,
-0.04300892, 0.2553877, 0.6768389, 1, 0, 0, 1, 1,
-0.04098649, -0.8449838, -3.302213, 1, 0, 0, 1, 1,
-0.03188638, 0.7553093, -0.06873549, 0, 0, 0, 1, 1,
-0.02941836, -0.5922664, -3.782494, 0, 0, 0, 1, 1,
-0.02584508, 2.618107, -2.37606, 0, 0, 0, 1, 1,
-0.01823052, 0.1407506, 0.8743461, 0, 0, 0, 1, 1,
-0.01537745, -0.1990302, -2.661426, 0, 0, 0, 1, 1,
-0.01195787, -0.5676713, -4.423552, 0, 0, 0, 1, 1,
-0.01034635, 1.074245, -0.02322427, 0, 0, 0, 1, 1,
-0.01005814, -0.8118002, -1.747507, 1, 1, 1, 1, 1,
-0.00991719, -2.154052, -2.342455, 1, 1, 1, 1, 1,
0.0003897785, 1.867583, 0.7076526, 1, 1, 1, 1, 1,
0.005624029, -0.5610488, 4.571967, 1, 1, 1, 1, 1,
0.006258916, -0.5890193, 2.675085, 1, 1, 1, 1, 1,
0.006394817, -0.6065535, 3.355088, 1, 1, 1, 1, 1,
0.0158668, -0.8191525, 2.136603, 1, 1, 1, 1, 1,
0.01694708, 0.2011123, 0.2261399, 1, 1, 1, 1, 1,
0.01804464, -2.007174, 2.520237, 1, 1, 1, 1, 1,
0.02286646, -2.269273, 3.367187, 1, 1, 1, 1, 1,
0.02433297, 1.133009, -0.8376309, 1, 1, 1, 1, 1,
0.02526951, -0.2353684, 2.516129, 1, 1, 1, 1, 1,
0.02529608, 0.3923512, 0.3047092, 1, 1, 1, 1, 1,
0.02740324, -0.6348049, 4.621093, 1, 1, 1, 1, 1,
0.02866277, -1.952575, 4.169154, 1, 1, 1, 1, 1,
0.03712158, -0.8331066, 3.774395, 0, 0, 1, 1, 1,
0.03736568, 1.468892, 0.3380112, 1, 0, 0, 1, 1,
0.03786737, 0.003180168, 2.042747, 1, 0, 0, 1, 1,
0.04061958, 0.6266534, -0.9032783, 1, 0, 0, 1, 1,
0.04151127, -0.2137754, 2.667092, 1, 0, 0, 1, 1,
0.04767185, 1.074595, -1.874297, 1, 0, 0, 1, 1,
0.04839594, 0.4844765, 2.201652, 0, 0, 0, 1, 1,
0.05103568, -1.727961, 3.031262, 0, 0, 0, 1, 1,
0.05247649, -0.2633992, 2.35726, 0, 0, 0, 1, 1,
0.05407344, 0.4388856, 1.108959, 0, 0, 0, 1, 1,
0.05455197, -0.2703731, 2.619344, 0, 0, 0, 1, 1,
0.0591388, -0.33304, 4.810127, 0, 0, 0, 1, 1,
0.05964313, 1.620888, 1.193258, 0, 0, 0, 1, 1,
0.06072663, 0.3964912, 0.5963361, 1, 1, 1, 1, 1,
0.0625134, 0.9077758, -0.9000393, 1, 1, 1, 1, 1,
0.06503725, 0.3792501, 1.240911, 1, 1, 1, 1, 1,
0.06672363, 1.166383, -0.2488064, 1, 1, 1, 1, 1,
0.07301004, 0.7687202, -0.8584941, 1, 1, 1, 1, 1,
0.0750384, 0.1811623, 0.2202481, 1, 1, 1, 1, 1,
0.07635583, -0.9306558, 3.698834, 1, 1, 1, 1, 1,
0.07645421, 0.1049785, 0.07822441, 1, 1, 1, 1, 1,
0.07717317, 0.7770081, -1.204457, 1, 1, 1, 1, 1,
0.0837459, 0.4897945, -1.284893, 1, 1, 1, 1, 1,
0.08678777, 1.956902, 0.1809615, 1, 1, 1, 1, 1,
0.09251418, -0.2276166, 2.997029, 1, 1, 1, 1, 1,
0.1013297, 0.1329528, 1.47874, 1, 1, 1, 1, 1,
0.109683, 2.048785, 0.3865013, 1, 1, 1, 1, 1,
0.1114473, 1.028342, -0.1022483, 1, 1, 1, 1, 1,
0.1125432, -1.42557, 1.727902, 0, 0, 1, 1, 1,
0.1151921, -0.2486479, 3.210821, 1, 0, 0, 1, 1,
0.1172729, 0.7068732, -1.392614, 1, 0, 0, 1, 1,
0.1176256, 0.4674149, -0.1065763, 1, 0, 0, 1, 1,
0.1249858, 1.103257, 1.675121, 1, 0, 0, 1, 1,
0.1260703, 1.338494, 2.518833, 1, 0, 0, 1, 1,
0.1287882, 0.6224605, -0.1051492, 0, 0, 0, 1, 1,
0.1299851, -0.8128773, 3.896646, 0, 0, 0, 1, 1,
0.1323603, 3.405662, -1.812347, 0, 0, 0, 1, 1,
0.1326807, 0.9257135, -1.463547, 0, 0, 0, 1, 1,
0.1328348, -1.101489, 3.374067, 0, 0, 0, 1, 1,
0.1333965, -2.137198, 2.546541, 0, 0, 0, 1, 1,
0.1337202, 0.6582649, -0.1628495, 0, 0, 0, 1, 1,
0.1357497, -0.4104152, 1.56096, 1, 1, 1, 1, 1,
0.1368046, 0.2044674, 0.2950462, 1, 1, 1, 1, 1,
0.1376682, -0.1153922, 1.806373, 1, 1, 1, 1, 1,
0.1402605, -0.2648414, 1.893653, 1, 1, 1, 1, 1,
0.1428719, 0.338671, 0.9378933, 1, 1, 1, 1, 1,
0.1456208, -0.6827348, 2.746907, 1, 1, 1, 1, 1,
0.1535817, -1.78207, 5.370563, 1, 1, 1, 1, 1,
0.1539866, 1.305812, -1.049979, 1, 1, 1, 1, 1,
0.1583072, -0.3627961, 2.873361, 1, 1, 1, 1, 1,
0.1610676, -0.2716787, 2.63154, 1, 1, 1, 1, 1,
0.161809, -0.5798139, 3.006257, 1, 1, 1, 1, 1,
0.1642831, 0.19173, 0.949869, 1, 1, 1, 1, 1,
0.1660182, 0.8086128, 1.151331, 1, 1, 1, 1, 1,
0.1682245, -0.9064942, 3.724611, 1, 1, 1, 1, 1,
0.168858, -1.32946, 3.383552, 1, 1, 1, 1, 1,
0.1766784, -3.524256, 2.507668, 0, 0, 1, 1, 1,
0.1790454, -0.1638624, 2.040216, 1, 0, 0, 1, 1,
0.1829191, 0.07127285, 0.3489971, 1, 0, 0, 1, 1,
0.1840137, -0.0213518, 1.586218, 1, 0, 0, 1, 1,
0.1845914, -0.4511689, 2.855522, 1, 0, 0, 1, 1,
0.1863121, 0.145913, 1.601916, 1, 0, 0, 1, 1,
0.1864342, 0.2361669, 0.8046295, 0, 0, 0, 1, 1,
0.1920311, -0.9562637, 1.946918, 0, 0, 0, 1, 1,
0.2076096, 1.994518, 0.4109269, 0, 0, 0, 1, 1,
0.2107076, -0.04923542, 2.502469, 0, 0, 0, 1, 1,
0.211399, -1.33213, 3.596213, 0, 0, 0, 1, 1,
0.2124672, -1.102027, 2.48661, 0, 0, 0, 1, 1,
0.2139321, -1.283433, 1.832996, 0, 0, 0, 1, 1,
0.2163887, -1.675861, 2.492931, 1, 1, 1, 1, 1,
0.2187853, -0.753538, 3.151654, 1, 1, 1, 1, 1,
0.2193239, -1.778929, 2.89697, 1, 1, 1, 1, 1,
0.2201881, 0.1793071, 1.352278, 1, 1, 1, 1, 1,
0.2213091, -0.5269442, 0.4725533, 1, 1, 1, 1, 1,
0.2221093, -0.2879449, 2.699557, 1, 1, 1, 1, 1,
0.2251233, -1.989908, 3.623653, 1, 1, 1, 1, 1,
0.236432, -0.4272944, 3.832416, 1, 1, 1, 1, 1,
0.2399707, -0.3326457, 2.611494, 1, 1, 1, 1, 1,
0.2430499, 0.5491417, 0.6121027, 1, 1, 1, 1, 1,
0.2451037, 2.585156, -0.4163612, 1, 1, 1, 1, 1,
0.2512702, 0.1248646, 0.1494208, 1, 1, 1, 1, 1,
0.2516815, 0.3803923, 1.276527, 1, 1, 1, 1, 1,
0.2517248, 0.40776, 0.9328729, 1, 1, 1, 1, 1,
0.2525908, -0.9051686, 1.807723, 1, 1, 1, 1, 1,
0.2537709, 0.4086484, -0.4874759, 0, 0, 1, 1, 1,
0.2544987, 0.6689999, 1.282867, 1, 0, 0, 1, 1,
0.2550592, 1.92404, 0.06883456, 1, 0, 0, 1, 1,
0.2567096, -2.223932, 2.473664, 1, 0, 0, 1, 1,
0.2617455, -0.5919724, 4.378766, 1, 0, 0, 1, 1,
0.2618026, 0.1056204, 1.273197, 1, 0, 0, 1, 1,
0.2636983, -0.6357087, 2.755424, 0, 0, 0, 1, 1,
0.2640256, 0.6189561, -0.04279449, 0, 0, 0, 1, 1,
0.2641968, -0.4953184, 2.991601, 0, 0, 0, 1, 1,
0.2670217, 1.625952, -0.02954925, 0, 0, 0, 1, 1,
0.2721733, 0.5283223, -0.1915513, 0, 0, 0, 1, 1,
0.2726516, 1.958592, 0.1868621, 0, 0, 0, 1, 1,
0.275313, -0.3382012, 1.776823, 0, 0, 0, 1, 1,
0.2766319, -2.499771, 3.016861, 1, 1, 1, 1, 1,
0.2788012, 0.208323, -0.5939579, 1, 1, 1, 1, 1,
0.2817292, -1.596461, 1.952309, 1, 1, 1, 1, 1,
0.2876866, -0.1535537, 2.359757, 1, 1, 1, 1, 1,
0.2901873, -0.3339677, 2.67604, 1, 1, 1, 1, 1,
0.294279, 0.280561, 1.65059, 1, 1, 1, 1, 1,
0.2989826, 1.515316, -0.9144176, 1, 1, 1, 1, 1,
0.3002003, -3.379737, 3.545775, 1, 1, 1, 1, 1,
0.3021487, -1.475612, 1.64937, 1, 1, 1, 1, 1,
0.3022644, 1.566265, 0.2336368, 1, 1, 1, 1, 1,
0.3028166, -1.107434, 4.568408, 1, 1, 1, 1, 1,
0.3118435, 1.429639, 0.5806695, 1, 1, 1, 1, 1,
0.3130778, -1.17787, 2.079872, 1, 1, 1, 1, 1,
0.314265, 0.1209122, 1.912515, 1, 1, 1, 1, 1,
0.3159809, 0.3946942, 0.1066524, 1, 1, 1, 1, 1,
0.3160045, -0.6550185, 0.8888685, 0, 0, 1, 1, 1,
0.3169928, -1.608853, 2.176563, 1, 0, 0, 1, 1,
0.317459, -1.257122, 4.703456, 1, 0, 0, 1, 1,
0.3242037, -0.9081586, 1.949303, 1, 0, 0, 1, 1,
0.3278883, -0.7208704, 3.178756, 1, 0, 0, 1, 1,
0.328404, 0.1008474, 1.15022, 1, 0, 0, 1, 1,
0.3292437, 0.04093263, -0.2769848, 0, 0, 0, 1, 1,
0.3332695, 0.9525918, 0.5433028, 0, 0, 0, 1, 1,
0.3352465, -0.7437428, 2.190913, 0, 0, 0, 1, 1,
0.3365256, 0.3192203, 0.2580196, 0, 0, 0, 1, 1,
0.3399023, -0.636852, 1.935462, 0, 0, 0, 1, 1,
0.3423453, -0.04357056, -0.6946005, 0, 0, 0, 1, 1,
0.3498188, 1.68928, -1.323825, 0, 0, 0, 1, 1,
0.3595449, 0.6709343, 0.1309297, 1, 1, 1, 1, 1,
0.3628596, -1.244216, 3.094705, 1, 1, 1, 1, 1,
0.3630227, -0.183942, 0.450363, 1, 1, 1, 1, 1,
0.3680828, -1.809386, 3.558119, 1, 1, 1, 1, 1,
0.3709637, 0.3423716, 0.3397186, 1, 1, 1, 1, 1,
0.3716388, 1.67527, -0.5882599, 1, 1, 1, 1, 1,
0.3765535, -0.6666726, 1.014215, 1, 1, 1, 1, 1,
0.3767189, -1.185307, 4.660957, 1, 1, 1, 1, 1,
0.3786465, -0.2576313, 0.3338485, 1, 1, 1, 1, 1,
0.3840455, -0.6283166, 2.318725, 1, 1, 1, 1, 1,
0.3856097, -0.1570483, 2.202535, 1, 1, 1, 1, 1,
0.3885551, -0.5731818, 2.462673, 1, 1, 1, 1, 1,
0.3908574, 0.42535, -0.03788305, 1, 1, 1, 1, 1,
0.3918334, -0.1147646, 1.667398, 1, 1, 1, 1, 1,
0.3920176, 0.4878384, 0.5438451, 1, 1, 1, 1, 1,
0.395322, 1.271165, 0.8647362, 0, 0, 1, 1, 1,
0.397153, -0.3817947, 0.8881262, 1, 0, 0, 1, 1,
0.4001032, 0.3849261, 1.939374, 1, 0, 0, 1, 1,
0.4039879, 0.1688118, 1.408407, 1, 0, 0, 1, 1,
0.404693, -1.130873, 2.55985, 1, 0, 0, 1, 1,
0.4056587, -2.274906, 3.313509, 1, 0, 0, 1, 1,
0.4056969, -0.5733009, 3.208956, 0, 0, 0, 1, 1,
0.409059, -2.215132, 3.732264, 0, 0, 0, 1, 1,
0.4092613, -0.2524797, 2.103318, 0, 0, 0, 1, 1,
0.4152559, -0.2405889, 2.275308, 0, 0, 0, 1, 1,
0.4206118, 0.9103557, 1.407251, 0, 0, 0, 1, 1,
0.4246305, 0.4916137, 0.7621058, 0, 0, 0, 1, 1,
0.4251457, 0.2622828, 1.10751, 0, 0, 0, 1, 1,
0.4251909, 0.333512, 1.453901, 1, 1, 1, 1, 1,
0.4253895, 1.69211, -0.3984032, 1, 1, 1, 1, 1,
0.4295959, -0.1995323, 1.106193, 1, 1, 1, 1, 1,
0.4306259, 0.327933, 0.235225, 1, 1, 1, 1, 1,
0.4319364, -2.100416, 3.440872, 1, 1, 1, 1, 1,
0.4323174, 1.146212, 1.228097, 1, 1, 1, 1, 1,
0.4345095, 2.369715, -0.1894885, 1, 1, 1, 1, 1,
0.4351389, -0.6180936, 2.214439, 1, 1, 1, 1, 1,
0.4362669, -1.407667, 2.827823, 1, 1, 1, 1, 1,
0.4363786, -0.8886545, 2.670362, 1, 1, 1, 1, 1,
0.4402452, 0.2413912, 1.832669, 1, 1, 1, 1, 1,
0.4405142, -0.7736206, 3.544466, 1, 1, 1, 1, 1,
0.4407888, 0.3079443, 1.333673, 1, 1, 1, 1, 1,
0.4436622, -1.178864, 4.126375, 1, 1, 1, 1, 1,
0.4453911, 0.816148, 0.9035257, 1, 1, 1, 1, 1,
0.4457331, 0.4655954, 1.650152, 0, 0, 1, 1, 1,
0.4469996, 0.6669644, 0.3214772, 1, 0, 0, 1, 1,
0.4496541, -0.03444602, 3.502692, 1, 0, 0, 1, 1,
0.4508466, -0.9689415, 2.604269, 1, 0, 0, 1, 1,
0.4519169, 0.5531451, -0.5366825, 1, 0, 0, 1, 1,
0.4546542, -0.2455579, 4.140028, 1, 0, 0, 1, 1,
0.4582413, 0.6462249, -0.5299914, 0, 0, 0, 1, 1,
0.4626355, 0.5903763, 0.6194883, 0, 0, 0, 1, 1,
0.4672346, -0.4207484, 4.084585, 0, 0, 0, 1, 1,
0.4686352, -1.008251, 3.270574, 0, 0, 0, 1, 1,
0.4718522, -1.018742, 3.865267, 0, 0, 0, 1, 1,
0.4719101, -0.5106679, 2.21131, 0, 0, 0, 1, 1,
0.4745709, 1.296327, 1.012623, 0, 0, 0, 1, 1,
0.4775444, 0.8611542, 0.6809523, 1, 1, 1, 1, 1,
0.478084, -0.3723608, -0.1069412, 1, 1, 1, 1, 1,
0.4799038, -0.7371001, 4.445729, 1, 1, 1, 1, 1,
0.4809301, -0.0588139, 2.740822, 1, 1, 1, 1, 1,
0.4813395, 0.8435759, 0.8083518, 1, 1, 1, 1, 1,
0.4850736, 0.9094812, 0.7875184, 1, 1, 1, 1, 1,
0.4909227, 0.1908389, 1.786483, 1, 1, 1, 1, 1,
0.4938115, -0.1014807, 1.401183, 1, 1, 1, 1, 1,
0.4941829, 1.654249, -0.361188, 1, 1, 1, 1, 1,
0.4948435, -0.1015922, 0.7941573, 1, 1, 1, 1, 1,
0.5014743, -0.8083391, 1.546997, 1, 1, 1, 1, 1,
0.5045421, 0.5730106, -0.9239794, 1, 1, 1, 1, 1,
0.5096586, 0.04449079, 1.698201, 1, 1, 1, 1, 1,
0.516292, 0.9783077, 1.576091, 1, 1, 1, 1, 1,
0.51767, -1.496909, 4.633214, 1, 1, 1, 1, 1,
0.5194924, 0.3403816, 0.4354604, 0, 0, 1, 1, 1,
0.5297761, 0.2995588, 2.339318, 1, 0, 0, 1, 1,
0.5309833, -0.03134623, 2.754686, 1, 0, 0, 1, 1,
0.5310603, -1.621838, 3.364498, 1, 0, 0, 1, 1,
0.5355729, -0.3452293, 2.067415, 1, 0, 0, 1, 1,
0.5391122, 0.0043881, 1.084729, 1, 0, 0, 1, 1,
0.5402645, -1.731777, 4.803894, 0, 0, 0, 1, 1,
0.5411489, -1.167834, 2.072309, 0, 0, 0, 1, 1,
0.5445868, 0.4319756, 1.132634, 0, 0, 0, 1, 1,
0.5452071, -0.7346629, 2.60063, 0, 0, 0, 1, 1,
0.546109, 0.6268256, 1.562209, 0, 0, 0, 1, 1,
0.5463185, 0.0993366, 0.9424167, 0, 0, 0, 1, 1,
0.546559, 0.2155003, 1.108359, 0, 0, 0, 1, 1,
0.5523005, 0.6622915, 1.051357, 1, 1, 1, 1, 1,
0.5694881, 0.807643, 0.7114788, 1, 1, 1, 1, 1,
0.5765575, 1.088178, 2.996873, 1, 1, 1, 1, 1,
0.5780116, -1.439537, 1.16502, 1, 1, 1, 1, 1,
0.5792397, -0.7662343, 2.27366, 1, 1, 1, 1, 1,
0.5861761, -0.9925577, 2.827406, 1, 1, 1, 1, 1,
0.5899182, 0.434734, -0.2318094, 1, 1, 1, 1, 1,
0.59668, 0.6724723, 1.011171, 1, 1, 1, 1, 1,
0.5968368, 1.17276, 0.1764963, 1, 1, 1, 1, 1,
0.6036703, 0.6104813, -0.3742311, 1, 1, 1, 1, 1,
0.6081168, 1.828838, -0.485822, 1, 1, 1, 1, 1,
0.6101276, 0.3591095, 1.173059, 1, 1, 1, 1, 1,
0.6111606, 0.01372476, 1.701908, 1, 1, 1, 1, 1,
0.6143199, -0.4350148, 0.799188, 1, 1, 1, 1, 1,
0.6151081, 0.2155315, 1.902801, 1, 1, 1, 1, 1,
0.6284105, -0.5903408, 0.6517985, 0, 0, 1, 1, 1,
0.6309285, 0.2025502, 1.810458, 1, 0, 0, 1, 1,
0.631562, 1.190751, 1.375263, 1, 0, 0, 1, 1,
0.6339991, -0.06534123, 1.477167, 1, 0, 0, 1, 1,
0.6368389, 1.194582, -0.01134577, 1, 0, 0, 1, 1,
0.6397674, -1.410761, 2.511108, 1, 0, 0, 1, 1,
0.6410761, 0.952381, 1.396969, 0, 0, 0, 1, 1,
0.6477293, -1.375456, 2.65458, 0, 0, 0, 1, 1,
0.649738, 0.3206656, 0.3922262, 0, 0, 0, 1, 1,
0.6558195, 1.255395, 1.371272, 0, 0, 0, 1, 1,
0.6560123, 1.502751, -1.29229, 0, 0, 0, 1, 1,
0.6606531, 1.543582, 0.8563277, 0, 0, 0, 1, 1,
0.6613783, -0.08007728, 2.920087, 0, 0, 0, 1, 1,
0.6693277, 0.1635217, 0.1251313, 1, 1, 1, 1, 1,
0.6704116, 1.330336, -0.2185093, 1, 1, 1, 1, 1,
0.6713157, -0.6181427, 1.841277, 1, 1, 1, 1, 1,
0.6715165, -1.658067, 1.817304, 1, 1, 1, 1, 1,
0.6725109, 2.313242, 0.9406358, 1, 1, 1, 1, 1,
0.6805992, 0.4122561, -0.1738727, 1, 1, 1, 1, 1,
0.6807876, -2.052463, 1.265373, 1, 1, 1, 1, 1,
0.6813006, 0.511676, 0.2524368, 1, 1, 1, 1, 1,
0.6833239, -0.5279912, 2.983581, 1, 1, 1, 1, 1,
0.6897859, 1.501049, 0.8819607, 1, 1, 1, 1, 1,
0.6908413, -0.1273563, 1.779377, 1, 1, 1, 1, 1,
0.6920471, 0.03649315, 2.085107, 1, 1, 1, 1, 1,
0.6924405, 1.722097, 1.797719, 1, 1, 1, 1, 1,
0.692869, -1.333944, 3.823895, 1, 1, 1, 1, 1,
0.6959631, -1.080473, 2.28138, 1, 1, 1, 1, 1,
0.6967391, 1.609426, 0.1201483, 0, 0, 1, 1, 1,
0.7006733, 1.351192, -0.6217874, 1, 0, 0, 1, 1,
0.7045394, 0.9184335, 2.625502, 1, 0, 0, 1, 1,
0.7050446, -1.432738, 2.581861, 1, 0, 0, 1, 1,
0.7058326, 1.184947, 0.7714267, 1, 0, 0, 1, 1,
0.707205, 0.5866199, -0.1784132, 1, 0, 0, 1, 1,
0.7098965, -0.774617, 2.247589, 0, 0, 0, 1, 1,
0.7131656, -0.05961812, 2.033685, 0, 0, 0, 1, 1,
0.7209411, -1.178933, 2.304774, 0, 0, 0, 1, 1,
0.7307214, 1.083229, 1.382189, 0, 0, 0, 1, 1,
0.7312649, -0.9463906, 2.780725, 0, 0, 0, 1, 1,
0.7324349, 0.1833379, 1.370787, 0, 0, 0, 1, 1,
0.7508399, 1.435592, 0.9141444, 0, 0, 0, 1, 1,
0.7509494, 0.130946, -0.5444195, 1, 1, 1, 1, 1,
0.7541894, -0.1392601, 1.223776, 1, 1, 1, 1, 1,
0.7544534, -0.8795589, 2.658628, 1, 1, 1, 1, 1,
0.7547563, -1.400486, 4.070942, 1, 1, 1, 1, 1,
0.7596158, 0.8552967, 1.633755, 1, 1, 1, 1, 1,
0.7607842, 1.539051, -0.4170389, 1, 1, 1, 1, 1,
0.7635452, 1.252706, 0.976852, 1, 1, 1, 1, 1,
0.7643515, -1.484487, 2.660099, 1, 1, 1, 1, 1,
0.7665678, 0.7795971, 0.3848949, 1, 1, 1, 1, 1,
0.7708442, -1.218728, 1.956322, 1, 1, 1, 1, 1,
0.7835357, -1.603475, 2.674275, 1, 1, 1, 1, 1,
0.7872289, 0.3719191, 2.437037, 1, 1, 1, 1, 1,
0.7886968, 1.363626, -0.0496175, 1, 1, 1, 1, 1,
0.7913463, 0.3370463, 0.8669427, 1, 1, 1, 1, 1,
0.7916279, 0.3801154, 1.087362, 1, 1, 1, 1, 1,
0.7919027, -0.3434018, 1.170122, 0, 0, 1, 1, 1,
0.8009396, 1.171008, -0.4534243, 1, 0, 0, 1, 1,
0.8024859, -0.4118667, 3.640228, 1, 0, 0, 1, 1,
0.8030648, -1.567544, 1.503889, 1, 0, 0, 1, 1,
0.8054746, -0.1872201, 1.020098, 1, 0, 0, 1, 1,
0.8091108, -0.4761985, 1.728946, 1, 0, 0, 1, 1,
0.809941, -0.6110866, 1.20142, 0, 0, 0, 1, 1,
0.8119933, 0.2380562, 2.028136, 0, 0, 0, 1, 1,
0.8200768, 1.057942, 3.293646, 0, 0, 0, 1, 1,
0.8253468, -0.6676494, 1.739126, 0, 0, 0, 1, 1,
0.8271213, 0.4342037, 0.5222099, 0, 0, 0, 1, 1,
0.8278822, 0.2619759, 2.235957, 0, 0, 0, 1, 1,
0.8316615, 0.4713816, 2.21368, 0, 0, 0, 1, 1,
0.8348867, -1.635918, 3.102656, 1, 1, 1, 1, 1,
0.8379291, 0.4155687, -0.7041616, 1, 1, 1, 1, 1,
0.8470187, -0.7595127, 1.779141, 1, 1, 1, 1, 1,
0.8493426, -0.7722741, -0.3363814, 1, 1, 1, 1, 1,
0.8530803, 0.008805715, 1.754185, 1, 1, 1, 1, 1,
0.855875, -0.4888828, 4.270501, 1, 1, 1, 1, 1,
0.8565658, -0.4459302, 0.8283281, 1, 1, 1, 1, 1,
0.8571925, 0.7441924, 1.594611, 1, 1, 1, 1, 1,
0.8593397, -0.6129324, 1.745151, 1, 1, 1, 1, 1,
0.8598425, -1.288097, 2.609077, 1, 1, 1, 1, 1,
0.8608092, -1.890577, 2.750779, 1, 1, 1, 1, 1,
0.8611974, 0.4593439, 0.803829, 1, 1, 1, 1, 1,
0.8739019, 1.179722, 1.440494, 1, 1, 1, 1, 1,
0.8752926, 1.065938, 0.2513618, 1, 1, 1, 1, 1,
0.8778821, -1.633559, 3.203151, 1, 1, 1, 1, 1,
0.8780217, 1.218316, 1.923349, 0, 0, 1, 1, 1,
0.8807425, -0.4314184, 2.124168, 1, 0, 0, 1, 1,
0.8833401, -0.5585501, 2.827457, 1, 0, 0, 1, 1,
0.8892182, 0.2142556, 3.18866, 1, 0, 0, 1, 1,
0.8943096, -0.7505553, 3.656908, 1, 0, 0, 1, 1,
0.9115727, 0.8578097, 2.401671, 1, 0, 0, 1, 1,
0.9200668, -0.472851, 1.041876, 0, 0, 0, 1, 1,
0.9281653, 1.889718, 0.04904842, 0, 0, 0, 1, 1,
0.9283444, 0.6299888, 0.05120401, 0, 0, 0, 1, 1,
0.9338337, 0.8366545, 0.6519564, 0, 0, 0, 1, 1,
0.9362632, 0.3492053, 1.541418, 0, 0, 0, 1, 1,
0.9428249, -0.5258756, 2.873323, 0, 0, 0, 1, 1,
0.9554681, 1.598621, 0.1865158, 0, 0, 0, 1, 1,
0.9563104, -1.442381, 1.491802, 1, 1, 1, 1, 1,
0.9611465, 0.2388395, 0.7294796, 1, 1, 1, 1, 1,
0.9651545, 1.469911, 2.855951, 1, 1, 1, 1, 1,
0.9664602, -1.525059, 3.160225, 1, 1, 1, 1, 1,
0.9743761, -0.6286402, 4.026088, 1, 1, 1, 1, 1,
0.9760377, -1.80508, 2.737419, 1, 1, 1, 1, 1,
0.983707, 0.8057251, -0.2277431, 1, 1, 1, 1, 1,
0.9906334, -0.6392979, 2.281687, 1, 1, 1, 1, 1,
0.9912919, 0.408133, 1.264613, 1, 1, 1, 1, 1,
1.020667, -0.03170698, -0.2314165, 1, 1, 1, 1, 1,
1.021298, 0.9620523, 1.356255, 1, 1, 1, 1, 1,
1.023353, -0.3851699, -1.123122, 1, 1, 1, 1, 1,
1.02627, 0.7510883, -1.804939, 1, 1, 1, 1, 1,
1.028881, 0.4273061, 1.323006, 1, 1, 1, 1, 1,
1.031646, -2.042059, 1.235729, 1, 1, 1, 1, 1,
1.037466, 0.2757937, 1.181887, 0, 0, 1, 1, 1,
1.038025, -0.5559671, 2.786283, 1, 0, 0, 1, 1,
1.054695, -0.4009416, 2.030205, 1, 0, 0, 1, 1,
1.056785, -1.559287, 3.91969, 1, 0, 0, 1, 1,
1.057377, 0.07861947, 1.599833, 1, 0, 0, 1, 1,
1.060788, 0.06996911, 0.947256, 1, 0, 0, 1, 1,
1.061849, 0.09883006, 2.090882, 0, 0, 0, 1, 1,
1.068267, 1.254133, 0.1349162, 0, 0, 0, 1, 1,
1.071126, -0.4762195, 3.289356, 0, 0, 0, 1, 1,
1.073125, 0.7060951, 0.195181, 0, 0, 0, 1, 1,
1.07689, -1.002743, 2.102074, 0, 0, 0, 1, 1,
1.077449, 0.02496758, 2.378707, 0, 0, 0, 1, 1,
1.092018, 0.7138411, 0.8132699, 0, 0, 0, 1, 1,
1.096888, 0.2893561, 0.9944314, 1, 1, 1, 1, 1,
1.105164, -0.08020038, 0.78907, 1, 1, 1, 1, 1,
1.105504, -0.5032398, 2.412343, 1, 1, 1, 1, 1,
1.120036, 0.8535504, 1.38357, 1, 1, 1, 1, 1,
1.122047, 3.040616, 1.923224, 1, 1, 1, 1, 1,
1.124014, 1.314055, -1.087861, 1, 1, 1, 1, 1,
1.124459, -0.8399482, 2.821831, 1, 1, 1, 1, 1,
1.127615, 0.7303601, 1.614639, 1, 1, 1, 1, 1,
1.128489, 0.7313417, 0.1975657, 1, 1, 1, 1, 1,
1.13633, 0.5570952, 1.142477, 1, 1, 1, 1, 1,
1.14439, 0.8402582, 1.572106, 1, 1, 1, 1, 1,
1.150228, -0.9465997, 1.756556, 1, 1, 1, 1, 1,
1.154297, -0.9672871, 3.216575, 1, 1, 1, 1, 1,
1.155555, -0.1043404, 1.444781, 1, 1, 1, 1, 1,
1.157184, 0.106011, 1.250001, 1, 1, 1, 1, 1,
1.159947, -0.07568117, 0.158657, 0, 0, 1, 1, 1,
1.165881, -0.5951323, 1.665712, 1, 0, 0, 1, 1,
1.168236, -1.050512, 2.125764, 1, 0, 0, 1, 1,
1.171286, -3.409228, 2.443914, 1, 0, 0, 1, 1,
1.17812, 0.8517154, 1.026165, 1, 0, 0, 1, 1,
1.18102, 0.1896517, 0.5543731, 1, 0, 0, 1, 1,
1.197789, 1.054405, 0.334642, 0, 0, 0, 1, 1,
1.202157, -0.9870956, 1.724888, 0, 0, 0, 1, 1,
1.203685, 1.494738, 0.1317973, 0, 0, 0, 1, 1,
1.206453, -1.249263, 3.427472, 0, 0, 0, 1, 1,
1.209982, 2.39352, -2.355376, 0, 0, 0, 1, 1,
1.215706, -1.217635, 1.856118, 0, 0, 0, 1, 1,
1.217774, 1.813978, 0.1874781, 0, 0, 0, 1, 1,
1.217828, 1.60211, 1.236144, 1, 1, 1, 1, 1,
1.217937, 0.8456591, -0.7715108, 1, 1, 1, 1, 1,
1.224236, 0.1366622, 0.590406, 1, 1, 1, 1, 1,
1.226133, -0.4072785, 1.521964, 1, 1, 1, 1, 1,
1.227935, 1.629168, 0.8427109, 1, 1, 1, 1, 1,
1.229578, -0.4178785, 2.33301, 1, 1, 1, 1, 1,
1.231873, -0.2415587, 1.602538, 1, 1, 1, 1, 1,
1.235399, -1.05002, 0.9251457, 1, 1, 1, 1, 1,
1.23992, 1.86873, 0.1990505, 1, 1, 1, 1, 1,
1.242304, -0.3601623, 0.8767455, 1, 1, 1, 1, 1,
1.244646, 0.2030418, 0.8622431, 1, 1, 1, 1, 1,
1.246179, 2.027527, 2.358886, 1, 1, 1, 1, 1,
1.248083, 0.4825233, 0.8318917, 1, 1, 1, 1, 1,
1.250197, -0.6600638, 2.453958, 1, 1, 1, 1, 1,
1.25437, -1.319932, 2.51539, 1, 1, 1, 1, 1,
1.261758, -1.276276, 2.674564, 0, 0, 1, 1, 1,
1.268042, -1.286696, 1.299325, 1, 0, 0, 1, 1,
1.268757, 0.8950114, 1.634126, 1, 0, 0, 1, 1,
1.27111, 0.6633024, 1.292593, 1, 0, 0, 1, 1,
1.271789, -1.224366, 1.075009, 1, 0, 0, 1, 1,
1.273081, -1.145172, 2.649592, 1, 0, 0, 1, 1,
1.274385, 0.1358068, 1.264475, 0, 0, 0, 1, 1,
1.283873, -0.2075613, 1.69385, 0, 0, 0, 1, 1,
1.284087, -1.91862, 3.962683, 0, 0, 0, 1, 1,
1.29006, 0.9585819, -0.7770933, 0, 0, 0, 1, 1,
1.291071, -0.02983338, 1.192534, 0, 0, 0, 1, 1,
1.295945, 2.097761, 0.2536175, 0, 0, 0, 1, 1,
1.299159, 2.193872, -0.6148682, 0, 0, 0, 1, 1,
1.302115, -0.4200958, 2.613262, 1, 1, 1, 1, 1,
1.304315, -0.5158606, 2.782568, 1, 1, 1, 1, 1,
1.321088, 1.748678, -0.04541255, 1, 1, 1, 1, 1,
1.334242, -0.2318908, 2.479451, 1, 1, 1, 1, 1,
1.335527, -0.5384238, 1.425597, 1, 1, 1, 1, 1,
1.335829, -1.354345, 2.707084, 1, 1, 1, 1, 1,
1.336613, -1.615936, 2.167283, 1, 1, 1, 1, 1,
1.352772, 0.6144534, -0.1551241, 1, 1, 1, 1, 1,
1.363933, -1.113627, 1.721984, 1, 1, 1, 1, 1,
1.366575, 0.4386096, 1.122985, 1, 1, 1, 1, 1,
1.379931, -0.9482374, 2.739073, 1, 1, 1, 1, 1,
1.380056, 0.2636763, -0.3809458, 1, 1, 1, 1, 1,
1.380623, -1.317901, 1.668445, 1, 1, 1, 1, 1,
1.381136, -0.6865396, 1.96774, 1, 1, 1, 1, 1,
1.383255, 0.3656656, 1.56338, 1, 1, 1, 1, 1,
1.394588, -1.307488, 1.640635, 0, 0, 1, 1, 1,
1.395646, -1.055697, 2.79385, 1, 0, 0, 1, 1,
1.395945, 0.436262, 2.626934, 1, 0, 0, 1, 1,
1.399096, 1.408905, 1.647783, 1, 0, 0, 1, 1,
1.403899, 2.256465, 2.006763, 1, 0, 0, 1, 1,
1.406678, -0.7542203, 2.155498, 1, 0, 0, 1, 1,
1.410535, -0.9371093, 1.824642, 0, 0, 0, 1, 1,
1.413217, 0.3730766, 0.3361021, 0, 0, 0, 1, 1,
1.429579, 0.2326307, 0.8809155, 0, 0, 0, 1, 1,
1.436406, -0.9326183, 3.35159, 0, 0, 0, 1, 1,
1.447387, -0.3485098, 1.658333, 0, 0, 0, 1, 1,
1.451935, -0.7004105, 3.900048, 0, 0, 0, 1, 1,
1.458487, 1.563595, 0.6239837, 0, 0, 0, 1, 1,
1.468805, -0.5958097, 2.078138, 1, 1, 1, 1, 1,
1.491117, -0.04833097, 1.284107, 1, 1, 1, 1, 1,
1.501891, 1.603605, 0.7712521, 1, 1, 1, 1, 1,
1.520073, -0.5360445, 3.033767, 1, 1, 1, 1, 1,
1.530401, -1.579255, 0.7252327, 1, 1, 1, 1, 1,
1.539849, -0.1151056, 1.345323, 1, 1, 1, 1, 1,
1.544527, -0.6140728, 1.92487, 1, 1, 1, 1, 1,
1.558512, -0.7341838, 1.0819, 1, 1, 1, 1, 1,
1.560179, -0.5119572, 1.639054, 1, 1, 1, 1, 1,
1.577429, 0.5245996, 1.486316, 1, 1, 1, 1, 1,
1.601149, 0.7843722, 0.05398626, 1, 1, 1, 1, 1,
1.603075, 0.9763719, 1.486641, 1, 1, 1, 1, 1,
1.607987, 0.9714534, -0.4073089, 1, 1, 1, 1, 1,
1.60946, 1.503358, 1.660669, 1, 1, 1, 1, 1,
1.633494, -1.228711, 2.756043, 1, 1, 1, 1, 1,
1.634877, -0.9725182, 2.003266, 0, 0, 1, 1, 1,
1.640057, -0.3207574, 2.676684, 1, 0, 0, 1, 1,
1.640932, -2.003318, 3.524875, 1, 0, 0, 1, 1,
1.662422, -0.9221498, 2.341177, 1, 0, 0, 1, 1,
1.667576, -1.348281, 2.242324, 1, 0, 0, 1, 1,
1.670495, -0.4159546, 3.037719, 1, 0, 0, 1, 1,
1.688348, 0.9586558, 0.2200595, 0, 0, 0, 1, 1,
1.702621, -0.07934992, 0.8083159, 0, 0, 0, 1, 1,
1.713162, 0.4419122, 2.290489, 0, 0, 0, 1, 1,
1.718522, 0.7538989, 0.9211025, 0, 0, 0, 1, 1,
1.721032, -0.2915283, -0.3516976, 0, 0, 0, 1, 1,
1.72481, -0.263541, 1.012718, 0, 0, 0, 1, 1,
1.726119, 0.1903615, 1.735341, 0, 0, 0, 1, 1,
1.729601, 0.5657675, -0.1495704, 1, 1, 1, 1, 1,
1.750041, -2.244685, 4.059081, 1, 1, 1, 1, 1,
1.753987, -0.7076529, 2.450127, 1, 1, 1, 1, 1,
1.762145, 1.428187, 1.380078, 1, 1, 1, 1, 1,
1.763448, 1.034292, 1.595578, 1, 1, 1, 1, 1,
1.773736, -0.7267783, 3.222729, 1, 1, 1, 1, 1,
1.803531, 1.541102, 0.5384068, 1, 1, 1, 1, 1,
1.815267, -0.5016518, -0.5348438, 1, 1, 1, 1, 1,
1.81867, 1.253157, 0.969462, 1, 1, 1, 1, 1,
1.841511, -1.575435, 1.675556, 1, 1, 1, 1, 1,
1.850821, 1.204087, 0.6292393, 1, 1, 1, 1, 1,
1.876437, 0.2320111, 0.7042502, 1, 1, 1, 1, 1,
1.933299, 0.9430676, 0.2645889, 1, 1, 1, 1, 1,
1.985709, -0.5747969, 1.594782, 1, 1, 1, 1, 1,
2.018461, -0.3887883, 1.821221, 1, 1, 1, 1, 1,
2.030861, 0.2060332, 1.063191, 0, 0, 1, 1, 1,
2.06138, -0.4422445, 2.139407, 1, 0, 0, 1, 1,
2.068776, 1.32294, 1.055649, 1, 0, 0, 1, 1,
2.097374, -1.311182, 2.838113, 1, 0, 0, 1, 1,
2.138042, 0.6823391, 2.707553, 1, 0, 0, 1, 1,
2.14204, 0.6929787, -0.9779107, 1, 0, 0, 1, 1,
2.145382, -0.1170087, 2.459966, 0, 0, 0, 1, 1,
2.20485, -2.071682, 1.536572, 0, 0, 0, 1, 1,
2.22128, 0.4559025, 2.825881, 0, 0, 0, 1, 1,
2.226954, 0.6078299, 2.52162, 0, 0, 0, 1, 1,
2.267261, -1.8823, 2.076206, 0, 0, 0, 1, 1,
2.287097, 0.1209639, 0.04010161, 0, 0, 0, 1, 1,
2.455045, -0.5975485, 1.564561, 0, 0, 0, 1, 1,
2.475911, 0.7309334, 1.110285, 1, 1, 1, 1, 1,
2.58904, -0.9620224, 2.837682, 1, 1, 1, 1, 1,
2.679089, -1.137528, 1.036349, 1, 1, 1, 1, 1,
2.68516, -0.2539597, 0.8265472, 1, 1, 1, 1, 1,
2.716285, 0.9850129, 2.278641, 1, 1, 1, 1, 1,
2.753117, -0.2239303, 1.725536, 1, 1, 1, 1, 1,
3.095713, 0.6048796, 2.633005, 1, 1, 1, 1, 1
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
var radius = 10.17513;
var distance = 35.7397;
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
mvMatrix.translate( 0.004007816, 0.05929708, 0.6166458 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.7397);
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
