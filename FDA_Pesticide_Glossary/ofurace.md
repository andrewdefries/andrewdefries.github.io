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
-3.433608, -0.8860418, -2.533509, 1, 0, 0, 1,
-2.785419, -0.9469956, -0.2912275, 1, 0.007843138, 0, 1,
-2.764813, -0.1513102, -3.676019, 1, 0.01176471, 0, 1,
-2.699355, -0.5166299, -4.07845, 1, 0.01960784, 0, 1,
-2.619671, -0.2848853, -0.5834823, 1, 0.02352941, 0, 1,
-2.607918, 1.223874, 0.7932023, 1, 0.03137255, 0, 1,
-2.521514, -1.822114, -2.008894, 1, 0.03529412, 0, 1,
-2.449836, -1.222605, -0.4409553, 1, 0.04313726, 0, 1,
-2.423451, -0.4197951, -1.79194, 1, 0.04705882, 0, 1,
-2.356926, -0.03411641, -2.639369, 1, 0.05490196, 0, 1,
-2.346902, -0.6421167, -2.580705, 1, 0.05882353, 0, 1,
-2.314954, 1.007215, -0.8740652, 1, 0.06666667, 0, 1,
-2.246408, -0.6635954, -1.881502, 1, 0.07058824, 0, 1,
-2.223149, 0.3493675, -1.183616, 1, 0.07843138, 0, 1,
-2.218846, -0.149596, -0.6816608, 1, 0.08235294, 0, 1,
-2.214222, -1.905254, -2.840205, 1, 0.09019608, 0, 1,
-2.129122, -2.314165, -1.410951, 1, 0.09411765, 0, 1,
-2.084574, 0.8710875, -2.787973, 1, 0.1019608, 0, 1,
-2.044278, -1.056469, -2.486098, 1, 0.1098039, 0, 1,
-2.016948, -1.281242, -2.432758, 1, 0.1137255, 0, 1,
-1.991129, 1.942406, -0.1254201, 1, 0.1215686, 0, 1,
-1.959659, 0.312331, -1.589123, 1, 0.1254902, 0, 1,
-1.882538, 1.017189, -0.7390537, 1, 0.1333333, 0, 1,
-1.865532, 0.432004, -0.4015043, 1, 0.1372549, 0, 1,
-1.846171, 0.757508, -3.045531, 1, 0.145098, 0, 1,
-1.81985, 0.9228997, -1.122156, 1, 0.1490196, 0, 1,
-1.816744, 3.258583, -1.457525, 1, 0.1568628, 0, 1,
-1.774961, 1.998395, -0.03484823, 1, 0.1607843, 0, 1,
-1.762513, 0.3862059, -1.988743, 1, 0.1686275, 0, 1,
-1.734066, 0.3885896, -0.2749344, 1, 0.172549, 0, 1,
-1.709733, 0.5839686, -1.531467, 1, 0.1803922, 0, 1,
-1.707725, -1.440522, -4.134438, 1, 0.1843137, 0, 1,
-1.706399, -1.784629, -2.783493, 1, 0.1921569, 0, 1,
-1.700929, 0.5546089, -2.082989, 1, 0.1960784, 0, 1,
-1.697978, 1.590554, -0.7967325, 1, 0.2039216, 0, 1,
-1.697545, 0.7131417, 0.684213, 1, 0.2117647, 0, 1,
-1.679408, -0.1683047, -0.5148863, 1, 0.2156863, 0, 1,
-1.674708, -0.1553346, -2.344563, 1, 0.2235294, 0, 1,
-1.67403, 0.9645691, -0.402919, 1, 0.227451, 0, 1,
-1.667846, 0.1247982, -2.044169, 1, 0.2352941, 0, 1,
-1.666549, -0.326881, -3.011444, 1, 0.2392157, 0, 1,
-1.66642, -0.4274143, -0.3475965, 1, 0.2470588, 0, 1,
-1.658801, 0.8243034, -1.318581, 1, 0.2509804, 0, 1,
-1.651168, -0.5756982, -2.033359, 1, 0.2588235, 0, 1,
-1.637756, -1.086848, -2.191724, 1, 0.2627451, 0, 1,
-1.626543, -0.1088188, -1.294132, 1, 0.2705882, 0, 1,
-1.617889, 0.3297018, -1.798139, 1, 0.2745098, 0, 1,
-1.61651, -1.923427, -2.985355, 1, 0.282353, 0, 1,
-1.60552, -0.3015791, -1.745562, 1, 0.2862745, 0, 1,
-1.599961, -1.227603, -1.662434, 1, 0.2941177, 0, 1,
-1.593539, -0.8113683, -2.164054, 1, 0.3019608, 0, 1,
-1.59303, -0.9407392, -3.07733, 1, 0.3058824, 0, 1,
-1.584426, 0.4070509, -1.116574, 1, 0.3137255, 0, 1,
-1.572128, -0.6874039, -2.536727, 1, 0.3176471, 0, 1,
-1.518325, 0.3945676, -2.433138, 1, 0.3254902, 0, 1,
-1.510856, -1.107773, -4.466662, 1, 0.3294118, 0, 1,
-1.50872, 0.9424762, -1.077805, 1, 0.3372549, 0, 1,
-1.504554, -0.7395445, -2.668391, 1, 0.3411765, 0, 1,
-1.503007, 0.222165, -1.553491, 1, 0.3490196, 0, 1,
-1.500242, 1.770738, -1.439646, 1, 0.3529412, 0, 1,
-1.470746, -0.2488824, -1.355409, 1, 0.3607843, 0, 1,
-1.449259, 0.9413727, 0.4723403, 1, 0.3647059, 0, 1,
-1.445979, 0.8000238, -0.7901869, 1, 0.372549, 0, 1,
-1.441481, -0.08836947, -2.291089, 1, 0.3764706, 0, 1,
-1.425003, 0.2746429, -1.168758, 1, 0.3843137, 0, 1,
-1.399594, -0.9206755, -3.600735, 1, 0.3882353, 0, 1,
-1.39958, 2.665477, -0.5065473, 1, 0.3960784, 0, 1,
-1.394102, -0.07573228, -1.869857, 1, 0.4039216, 0, 1,
-1.385189, 0.2981556, -1.814009, 1, 0.4078431, 0, 1,
-1.37352, 0.494128, -1.946541, 1, 0.4156863, 0, 1,
-1.365586, 0.9077601, -0.8088892, 1, 0.4196078, 0, 1,
-1.365463, -0.5581622, -1.289694, 1, 0.427451, 0, 1,
-1.363669, -0.4746284, -1.594363, 1, 0.4313726, 0, 1,
-1.34848, -1.402162, -1.821034, 1, 0.4392157, 0, 1,
-1.346446, -1.26668, -1.678113, 1, 0.4431373, 0, 1,
-1.340987, -0.01641454, -0.09735587, 1, 0.4509804, 0, 1,
-1.334781, 0.5281215, -1.223422, 1, 0.454902, 0, 1,
-1.328437, 1.56818, -0.3854421, 1, 0.4627451, 0, 1,
-1.324679, 1.671849, -0.8599353, 1, 0.4666667, 0, 1,
-1.316669, -0.5396368, -1.350116, 1, 0.4745098, 0, 1,
-1.304252, -0.3529006, -2.742804, 1, 0.4784314, 0, 1,
-1.301327, 0.3727044, -1.71954, 1, 0.4862745, 0, 1,
-1.30126, -2.482645, -2.29362, 1, 0.4901961, 0, 1,
-1.300683, 1.226912, -0.5209333, 1, 0.4980392, 0, 1,
-1.295238, 3.333934, -0.09410602, 1, 0.5058824, 0, 1,
-1.279973, 0.9497871, -0.4537807, 1, 0.509804, 0, 1,
-1.27598, -0.9800383, -4.085181, 1, 0.5176471, 0, 1,
-1.271664, -1.733298, -1.30934, 1, 0.5215687, 0, 1,
-1.270879, -0.4987003, -1.191872, 1, 0.5294118, 0, 1,
-1.260764, -1.323615, -2.165493, 1, 0.5333334, 0, 1,
-1.254514, -1.330468, -2.769767, 1, 0.5411765, 0, 1,
-1.253602, -0.05105053, -0.437205, 1, 0.5450981, 0, 1,
-1.252834, -0.3246428, -0.6826271, 1, 0.5529412, 0, 1,
-1.250858, 0.1866007, -1.833217, 1, 0.5568628, 0, 1,
-1.24638, -0.3226766, -1.96615, 1, 0.5647059, 0, 1,
-1.232358, 0.3898749, -0.7524269, 1, 0.5686275, 0, 1,
-1.231095, 0.4963296, -1.015492, 1, 0.5764706, 0, 1,
-1.225164, 0.05156562, -2.930667, 1, 0.5803922, 0, 1,
-1.222557, 0.2042197, -0.3059053, 1, 0.5882353, 0, 1,
-1.216329, 0.05614075, -0.9593433, 1, 0.5921569, 0, 1,
-1.215156, 0.8565288, 0.1900849, 1, 0.6, 0, 1,
-1.207322, -0.09301859, -2.347678, 1, 0.6078432, 0, 1,
-1.206846, 1.047564, -0.1365296, 1, 0.6117647, 0, 1,
-1.201082, -0.1750217, -2.454026, 1, 0.6196079, 0, 1,
-1.200457, 0.1679168, -0.1264333, 1, 0.6235294, 0, 1,
-1.198131, 1.616542, -1.541444, 1, 0.6313726, 0, 1,
-1.192303, 1.240122, 0.691766, 1, 0.6352941, 0, 1,
-1.190973, 1.478011, 0.07001923, 1, 0.6431373, 0, 1,
-1.190437, -0.005204822, -2.14763, 1, 0.6470588, 0, 1,
-1.186641, 1.624453, -1.750883, 1, 0.654902, 0, 1,
-1.184378, 0.7524825, -0.9643841, 1, 0.6588235, 0, 1,
-1.184278, -0.7674477, -3.387247, 1, 0.6666667, 0, 1,
-1.175899, -0.9373787, -1.874808, 1, 0.6705883, 0, 1,
-1.171817, 0.9150488, -0.06060725, 1, 0.6784314, 0, 1,
-1.170506, -2.74774, -3.16234, 1, 0.682353, 0, 1,
-1.158866, -0.9082184, -2.234682, 1, 0.6901961, 0, 1,
-1.154454, -0.4488168, -1.878781, 1, 0.6941177, 0, 1,
-1.15251, -1.543796, -3.604931, 1, 0.7019608, 0, 1,
-1.15002, 0.01097596, -0.06989149, 1, 0.7098039, 0, 1,
-1.147171, -0.4826186, -1.417676, 1, 0.7137255, 0, 1,
-1.142834, -1.187733, -1.816038, 1, 0.7215686, 0, 1,
-1.141229, -1.117799, -2.889886, 1, 0.7254902, 0, 1,
-1.131918, -1.436162, -3.598516, 1, 0.7333333, 0, 1,
-1.127192, -0.5053638, -1.49909, 1, 0.7372549, 0, 1,
-1.126586, -1.351336, -3.36617, 1, 0.7450981, 0, 1,
-1.125125, -0.8960286, -3.458778, 1, 0.7490196, 0, 1,
-1.123841, 0.8040784, -0.3403737, 1, 0.7568628, 0, 1,
-1.123107, -0.945221, -3.111594, 1, 0.7607843, 0, 1,
-1.121738, 1.316938, -1.454612, 1, 0.7686275, 0, 1,
-1.111378, 0.2615062, -1.806301, 1, 0.772549, 0, 1,
-1.103877, -1.501206, -3.407217, 1, 0.7803922, 0, 1,
-1.096102, -1.615656, -2.256214, 1, 0.7843137, 0, 1,
-1.095874, 0.979683, -1.786373, 1, 0.7921569, 0, 1,
-1.085651, 0.2299679, -0.4352723, 1, 0.7960784, 0, 1,
-1.082711, -0.03834729, -1.054655, 1, 0.8039216, 0, 1,
-1.077135, -1.345452, -2.391585, 1, 0.8117647, 0, 1,
-1.075916, -0.9834925, -2.298573, 1, 0.8156863, 0, 1,
-1.073132, -0.7924643, -2.613743, 1, 0.8235294, 0, 1,
-1.072379, -1.039994, -1.889572, 1, 0.827451, 0, 1,
-1.0689, -0.4289575, -2.372656, 1, 0.8352941, 0, 1,
-1.064115, 1.644926, 0.2044884, 1, 0.8392157, 0, 1,
-1.063839, 1.287623, -1.245332, 1, 0.8470588, 0, 1,
-1.042637, 0.2016028, -1.886691, 1, 0.8509804, 0, 1,
-1.040108, 0.6666202, -0.9919181, 1, 0.8588235, 0, 1,
-1.035568, 1.969786, -0.7000765, 1, 0.8627451, 0, 1,
-1.031409, 1.054948, 0.1886366, 1, 0.8705882, 0, 1,
-1.031222, -0.01505669, -2.461655, 1, 0.8745098, 0, 1,
-1.031079, 0.06311585, -1.256464, 1, 0.8823529, 0, 1,
-1.028967, -0.2581086, -4.160549, 1, 0.8862745, 0, 1,
-1.027054, 1.103365, -1.042427, 1, 0.8941177, 0, 1,
-1.024007, 2.187663, 0.07093387, 1, 0.8980392, 0, 1,
-1.018958, 0.08267844, -1.597956, 1, 0.9058824, 0, 1,
-1.005523, -0.5378192, -0.1962723, 1, 0.9137255, 0, 1,
-1.004302, 0.2821583, -0.6260477, 1, 0.9176471, 0, 1,
-0.9998737, 2.028179, 2.299962, 1, 0.9254902, 0, 1,
-0.9986254, 0.1883832, -0.7731265, 1, 0.9294118, 0, 1,
-0.9947844, -0.8256695, -2.756359, 1, 0.9372549, 0, 1,
-0.9945627, 0.1915749, -1.469214, 1, 0.9411765, 0, 1,
-0.9889397, -1.360452, -2.944186, 1, 0.9490196, 0, 1,
-0.9855568, -1.27879, -3.730277, 1, 0.9529412, 0, 1,
-0.9828374, -1.258345, -3.401274, 1, 0.9607843, 0, 1,
-0.9765211, -1.476036, -2.563884, 1, 0.9647059, 0, 1,
-0.9713186, 0.4635004, -0.6545421, 1, 0.972549, 0, 1,
-0.9687061, 0.5290775, -1.554924, 1, 0.9764706, 0, 1,
-0.9671105, -1.836852, -2.370343, 1, 0.9843137, 0, 1,
-0.9669245, -0.9218109, -1.663006, 1, 0.9882353, 0, 1,
-0.9658633, -1.242273, -4.097456, 1, 0.9960784, 0, 1,
-0.9643062, 0.6346146, -1.210754, 0.9960784, 1, 0, 1,
-0.9590517, 0.6172631, 1.013239, 0.9921569, 1, 0, 1,
-0.955192, -1.217465, -1.658026, 0.9843137, 1, 0, 1,
-0.9490504, 0.6814004, -1.613884, 0.9803922, 1, 0, 1,
-0.9485431, -1.168818, -0.9025859, 0.972549, 1, 0, 1,
-0.9478992, -1.476987, -3.114531, 0.9686275, 1, 0, 1,
-0.947537, -0.8792595, -1.908845, 0.9607843, 1, 0, 1,
-0.9421828, 0.8427828, 0.03839122, 0.9568627, 1, 0, 1,
-0.9387315, -2.233486, -3.116758, 0.9490196, 1, 0, 1,
-0.9342406, -2.314081, -2.907727, 0.945098, 1, 0, 1,
-0.9256744, 0.3266153, -2.541724, 0.9372549, 1, 0, 1,
-0.9184825, -1.417138, -2.364473, 0.9333333, 1, 0, 1,
-0.9173681, -1.598582, -2.427164, 0.9254902, 1, 0, 1,
-0.9152237, 0.5014763, -0.06541004, 0.9215686, 1, 0, 1,
-0.9137692, -1.206157, -1.218496, 0.9137255, 1, 0, 1,
-0.8985754, 1.208316, 0.3414475, 0.9098039, 1, 0, 1,
-0.8971256, -1.736361, -3.060075, 0.9019608, 1, 0, 1,
-0.8951866, 0.7469988, -1.246949, 0.8941177, 1, 0, 1,
-0.8902308, 1.64863, -0.4297464, 0.8901961, 1, 0, 1,
-0.8843309, 0.3515641, -1.646783, 0.8823529, 1, 0, 1,
-0.8830501, -0.3448808, -1.378219, 0.8784314, 1, 0, 1,
-0.8815349, 0.9575284, -1.273785, 0.8705882, 1, 0, 1,
-0.8811445, 2.205838, -1.045451, 0.8666667, 1, 0, 1,
-0.8808529, 0.1679071, -3.615344, 0.8588235, 1, 0, 1,
-0.8790311, 0.5807415, -2.967094, 0.854902, 1, 0, 1,
-0.8744631, 0.3669975, 0.1016183, 0.8470588, 1, 0, 1,
-0.8699429, -2.126014, -3.588989, 0.8431373, 1, 0, 1,
-0.8683252, 0.3896006, -1.408062, 0.8352941, 1, 0, 1,
-0.8663244, 0.7340811, -1.029528, 0.8313726, 1, 0, 1,
-0.8651708, 0.8722933, -1.08429, 0.8235294, 1, 0, 1,
-0.8641126, 0.577786, 0.1967484, 0.8196079, 1, 0, 1,
-0.8532861, -1.247879, -3.993631, 0.8117647, 1, 0, 1,
-0.8488371, 0.3564587, -1.511862, 0.8078431, 1, 0, 1,
-0.8379517, -0.3936438, -2.361589, 0.8, 1, 0, 1,
-0.8373336, -0.06602661, -2.036481, 0.7921569, 1, 0, 1,
-0.8359438, -0.1700408, -1.348799, 0.7882353, 1, 0, 1,
-0.8325423, -1.527657, -3.446939, 0.7803922, 1, 0, 1,
-0.8286616, -1.084714, -3.049729, 0.7764706, 1, 0, 1,
-0.8186995, 0.1477378, -1.480832, 0.7686275, 1, 0, 1,
-0.8171943, 0.06104205, -2.948698, 0.7647059, 1, 0, 1,
-0.8165816, -0.6866564, -1.838966, 0.7568628, 1, 0, 1,
-0.8138301, 0.5997715, 0.6598924, 0.7529412, 1, 0, 1,
-0.8135715, 0.06068919, 0.2569599, 0.7450981, 1, 0, 1,
-0.809622, -0.4676735, -2.082851, 0.7411765, 1, 0, 1,
-0.8038135, -1.556076, -2.874016, 0.7333333, 1, 0, 1,
-0.7984225, -0.3124273, -3.561988, 0.7294118, 1, 0, 1,
-0.7978686, 0.4714493, 0.18611, 0.7215686, 1, 0, 1,
-0.7907756, -1.462448, -3.66407, 0.7176471, 1, 0, 1,
-0.7857525, 0.6682149, 0.3591471, 0.7098039, 1, 0, 1,
-0.7819283, 0.5881575, 0.189228, 0.7058824, 1, 0, 1,
-0.7750703, -0.6819242, -2.812055, 0.6980392, 1, 0, 1,
-0.7750061, 0.5593921, -0.230676, 0.6901961, 1, 0, 1,
-0.7737745, 1.184394, -0.954768, 0.6862745, 1, 0, 1,
-0.7711594, 0.4303753, -2.401182, 0.6784314, 1, 0, 1,
-0.7707661, -0.1234526, -1.743796, 0.6745098, 1, 0, 1,
-0.7701714, -0.8155375, -3.226652, 0.6666667, 1, 0, 1,
-0.769129, 0.0979531, -1.600599, 0.6627451, 1, 0, 1,
-0.7688898, -0.03386674, -0.935647, 0.654902, 1, 0, 1,
-0.755583, 0.4385942, -1.581977, 0.6509804, 1, 0, 1,
-0.7504125, 0.5672529, -1.581892, 0.6431373, 1, 0, 1,
-0.7426979, 0.3388938, -1.399165, 0.6392157, 1, 0, 1,
-0.7399673, 0.5967757, -2.098202, 0.6313726, 1, 0, 1,
-0.7370716, 0.6385159, 1.083646, 0.627451, 1, 0, 1,
-0.7332921, -1.331156, -2.121664, 0.6196079, 1, 0, 1,
-0.7312638, -1.823678, -3.937657, 0.6156863, 1, 0, 1,
-0.7269908, 0.9611484, 1.056579, 0.6078432, 1, 0, 1,
-0.7244825, -0.4560466, -1.187064, 0.6039216, 1, 0, 1,
-0.7241846, 0.03751179, -0.6108868, 0.5960785, 1, 0, 1,
-0.7199648, -1.023602, -1.739517, 0.5882353, 1, 0, 1,
-0.7181947, 0.7151861, 0.1427045, 0.5843138, 1, 0, 1,
-0.7180874, 0.3795583, -2.657294, 0.5764706, 1, 0, 1,
-0.7121766, -2.076142, -3.964537, 0.572549, 1, 0, 1,
-0.7101792, -0.7241126, -1.988675, 0.5647059, 1, 0, 1,
-0.7079201, 1.125116, -0.7686329, 0.5607843, 1, 0, 1,
-0.7068291, -0.3368983, -2.401085, 0.5529412, 1, 0, 1,
-0.7053165, -0.6469791, -1.146613, 0.5490196, 1, 0, 1,
-0.7008297, 1.676222, 0.6511281, 0.5411765, 1, 0, 1,
-0.7007878, -0.5919675, -1.371198, 0.5372549, 1, 0, 1,
-0.7001223, 1.201455, -0.6756428, 0.5294118, 1, 0, 1,
-0.7000582, 2.291647, -1.343729, 0.5254902, 1, 0, 1,
-0.6939976, 0.4166698, -1.227386, 0.5176471, 1, 0, 1,
-0.6917548, -1.956687, -2.412177, 0.5137255, 1, 0, 1,
-0.6916312, 0.4278713, -0.9138625, 0.5058824, 1, 0, 1,
-0.6891188, -1.333252, -1.05829, 0.5019608, 1, 0, 1,
-0.6870759, -0.7241524, -2.166432, 0.4941176, 1, 0, 1,
-0.6854106, 1.378887, 0.871443, 0.4862745, 1, 0, 1,
-0.684242, -2.39245, -4.201569, 0.4823529, 1, 0, 1,
-0.684127, -2.268445, -0.08597321, 0.4745098, 1, 0, 1,
-0.6839098, -0.2396813, -2.067342, 0.4705882, 1, 0, 1,
-0.6807549, -0.4837041, -3.431584, 0.4627451, 1, 0, 1,
-0.6769843, 1.877345, -0.681441, 0.4588235, 1, 0, 1,
-0.676032, -0.7666489, -2.670553, 0.4509804, 1, 0, 1,
-0.6708162, 0.4933584, -1.210659, 0.4470588, 1, 0, 1,
-0.6702685, -0.9786384, -3.284326, 0.4392157, 1, 0, 1,
-0.6689261, -0.4154263, -1.888388, 0.4352941, 1, 0, 1,
-0.6686879, -0.161808, -0.2945425, 0.427451, 1, 0, 1,
-0.6670278, -0.03185746, -2.242548, 0.4235294, 1, 0, 1,
-0.6668712, 0.2117562, 0.1087778, 0.4156863, 1, 0, 1,
-0.6605789, 0.4039719, -1.106123, 0.4117647, 1, 0, 1,
-0.660102, -0.5286383, -0.9261117, 0.4039216, 1, 0, 1,
-0.6566417, -1.52591, -5.393103, 0.3960784, 1, 0, 1,
-0.6554922, -1.0851, -3.547124, 0.3921569, 1, 0, 1,
-0.6530734, 0.02490286, -2.739244, 0.3843137, 1, 0, 1,
-0.6526965, -0.15152, -1.447201, 0.3803922, 1, 0, 1,
-0.6501657, -0.2097349, -2.249814, 0.372549, 1, 0, 1,
-0.6119621, 0.4068096, -2.261703, 0.3686275, 1, 0, 1,
-0.6115099, -0.05209144, -2.073171, 0.3607843, 1, 0, 1,
-0.6106042, -0.04819059, -2.478542, 0.3568628, 1, 0, 1,
-0.6069486, -0.2668715, -3.552384, 0.3490196, 1, 0, 1,
-0.6069112, 0.9710463, 1.930053, 0.345098, 1, 0, 1,
-0.6053768, 0.1204723, -3.181199, 0.3372549, 1, 0, 1,
-0.5988564, 0.8943263, -1.349725, 0.3333333, 1, 0, 1,
-0.5959346, 1.099482, -0.6830064, 0.3254902, 1, 0, 1,
-0.5895274, -0.09801892, -1.6506, 0.3215686, 1, 0, 1,
-0.5891681, 0.1160683, -2.483916, 0.3137255, 1, 0, 1,
-0.585102, 0.3154332, -1.692069, 0.3098039, 1, 0, 1,
-0.5840722, 1.1842, -0.5134122, 0.3019608, 1, 0, 1,
-0.5831395, 1.950766, -0.07387609, 0.2941177, 1, 0, 1,
-0.5823207, 0.7714543, -0.6988346, 0.2901961, 1, 0, 1,
-0.5802375, -0.857026, -4.281019, 0.282353, 1, 0, 1,
-0.5723466, 0.291777, -0.3483432, 0.2784314, 1, 0, 1,
-0.5713718, 0.04290874, -2.45324, 0.2705882, 1, 0, 1,
-0.570231, 1.470468, 0.3805937, 0.2666667, 1, 0, 1,
-0.5688135, -1.181408, -1.800428, 0.2588235, 1, 0, 1,
-0.5677121, 0.9677906, -0.1115521, 0.254902, 1, 0, 1,
-0.5673087, -0.8868753, -2.036623, 0.2470588, 1, 0, 1,
-0.5657888, -0.3490297, -2.598676, 0.2431373, 1, 0, 1,
-0.5553657, -0.8135579, -1.813899, 0.2352941, 1, 0, 1,
-0.5547727, 0.08810919, 0.4799365, 0.2313726, 1, 0, 1,
-0.5509882, -0.5420303, -2.265393, 0.2235294, 1, 0, 1,
-0.5494322, -1.387591, -2.903041, 0.2196078, 1, 0, 1,
-0.5469232, 0.7123262, -0.6762968, 0.2117647, 1, 0, 1,
-0.5459125, 0.7610219, -0.6001992, 0.2078431, 1, 0, 1,
-0.536823, -1.342425, -3.391989, 0.2, 1, 0, 1,
-0.5353131, 0.4077481, -1.761092, 0.1921569, 1, 0, 1,
-0.5350039, 0.6013463, -1.346537, 0.1882353, 1, 0, 1,
-0.5332901, -1.229856, -2.083521, 0.1803922, 1, 0, 1,
-0.5225185, 1.780943, 0.3956853, 0.1764706, 1, 0, 1,
-0.5204746, 0.5679872, 0.3911903, 0.1686275, 1, 0, 1,
-0.5199869, 0.3174867, -0.6542631, 0.1647059, 1, 0, 1,
-0.518349, 0.2171988, -1.411495, 0.1568628, 1, 0, 1,
-0.5182537, 2.028637, -0.44271, 0.1529412, 1, 0, 1,
-0.5177419, 0.9001938, 0.706758, 0.145098, 1, 0, 1,
-0.5168912, -1.182104, -3.234158, 0.1411765, 1, 0, 1,
-0.5134605, 0.0871683, -3.391344, 0.1333333, 1, 0, 1,
-0.5074939, 0.8497046, -0.8538052, 0.1294118, 1, 0, 1,
-0.5058014, -0.7725551, -2.823024, 0.1215686, 1, 0, 1,
-0.5000677, -0.6052572, -3.426706, 0.1176471, 1, 0, 1,
-0.4998056, 0.4731778, -1.803329, 0.1098039, 1, 0, 1,
-0.4989126, 0.5057244, -0.689496, 0.1058824, 1, 0, 1,
-0.4965792, -0.4106327, -1.650355, 0.09803922, 1, 0, 1,
-0.4956852, -0.2497203, -0.722365, 0.09019608, 1, 0, 1,
-0.4948964, 2.25637, -2.089396, 0.08627451, 1, 0, 1,
-0.4939122, 0.1141625, -1.949445, 0.07843138, 1, 0, 1,
-0.4889844, 0.1472882, -3.001787, 0.07450981, 1, 0, 1,
-0.4868198, -0.6164016, -2.822417, 0.06666667, 1, 0, 1,
-0.4866378, 1.379301, -2.000626, 0.0627451, 1, 0, 1,
-0.4856797, 0.2495349, -0.6490524, 0.05490196, 1, 0, 1,
-0.4809292, 0.06393436, -1.246022, 0.05098039, 1, 0, 1,
-0.4788271, 1.439133, -1.832704, 0.04313726, 1, 0, 1,
-0.4725754, -1.234495, -3.479303, 0.03921569, 1, 0, 1,
-0.4699461, -0.8187022, -2.996855, 0.03137255, 1, 0, 1,
-0.468017, 0.1047821, -0.3581297, 0.02745098, 1, 0, 1,
-0.4675325, -1.296848, -2.895672, 0.01960784, 1, 0, 1,
-0.4666216, 0.004403142, -1.438233, 0.01568628, 1, 0, 1,
-0.4618599, -0.7714925, -3.594486, 0.007843138, 1, 0, 1,
-0.4580031, -0.515024, -1.24957, 0.003921569, 1, 0, 1,
-0.4522541, 0.8398867, 0.05119614, 0, 1, 0.003921569, 1,
-0.4508099, 1.259497, 0.3936392, 0, 1, 0.01176471, 1,
-0.4473872, 0.7038694, -0.4443191, 0, 1, 0.01568628, 1,
-0.4473463, 0.5453394, 0.4344749, 0, 1, 0.02352941, 1,
-0.4453536, 0.7560817, -2.371196, 0, 1, 0.02745098, 1,
-0.4432358, -0.7477616, -0.4366788, 0, 1, 0.03529412, 1,
-0.4373249, -0.02330471, -1.570892, 0, 1, 0.03921569, 1,
-0.4371794, 0.04789472, -1.851942, 0, 1, 0.04705882, 1,
-0.4356515, -2.874166, -3.505344, 0, 1, 0.05098039, 1,
-0.428346, -0.1975708, -2.397041, 0, 1, 0.05882353, 1,
-0.4281271, -1.501082, -3.485413, 0, 1, 0.0627451, 1,
-0.4271389, -0.09138428, -2.460283, 0, 1, 0.07058824, 1,
-0.4240845, 1.101424, 0.3285035, 0, 1, 0.07450981, 1,
-0.4134622, -1.674791, -1.928798, 0, 1, 0.08235294, 1,
-0.4080677, -0.3024802, -2.470629, 0, 1, 0.08627451, 1,
-0.4068917, -0.5254604, -5.303085, 0, 1, 0.09411765, 1,
-0.4062515, -1.608583, -4.149251, 0, 1, 0.1019608, 1,
-0.4030546, 1.415764, 0.05620785, 0, 1, 0.1058824, 1,
-0.4014288, -1.033518, -2.540348, 0, 1, 0.1137255, 1,
-0.3990285, 1.789473, -1.740933, 0, 1, 0.1176471, 1,
-0.3990245, 0.5516559, -1.860645, 0, 1, 0.1254902, 1,
-0.3989177, -0.9217101, -1.989854, 0, 1, 0.1294118, 1,
-0.3970645, -1.624671, -1.793198, 0, 1, 0.1372549, 1,
-0.396532, -1.20935, -1.821984, 0, 1, 0.1411765, 1,
-0.3945856, 1.041174, 0.6727458, 0, 1, 0.1490196, 1,
-0.3938951, -0.3038982, -0.7327828, 0, 1, 0.1529412, 1,
-0.3892638, 0.3530301, -1.261074, 0, 1, 0.1607843, 1,
-0.3888893, -0.3956709, -1.738536, 0, 1, 0.1647059, 1,
-0.3847207, 1.079411, -0.03813348, 0, 1, 0.172549, 1,
-0.3745274, 0.08927564, -1.681921, 0, 1, 0.1764706, 1,
-0.3717273, -0.7911016, -2.246313, 0, 1, 0.1843137, 1,
-0.3703987, -1.025465, -1.865808, 0, 1, 0.1882353, 1,
-0.369899, -0.0394818, -1.484572, 0, 1, 0.1960784, 1,
-0.3695471, 0.02131242, -2.380341, 0, 1, 0.2039216, 1,
-0.3652681, -0.3219125, -3.714709, 0, 1, 0.2078431, 1,
-0.359832, 0.1884561, -1.332316, 0, 1, 0.2156863, 1,
-0.3596944, -1.301007, -2.094876, 0, 1, 0.2196078, 1,
-0.3594182, 0.02036536, -1.329316, 0, 1, 0.227451, 1,
-0.3591719, 1.409132, 0.6952896, 0, 1, 0.2313726, 1,
-0.3569949, -0.05057568, -2.518408, 0, 1, 0.2392157, 1,
-0.3470218, 0.7925132, 0.3439662, 0, 1, 0.2431373, 1,
-0.3466914, 0.04792127, -1.244918, 0, 1, 0.2509804, 1,
-0.3449813, -0.9115156, -2.008338, 0, 1, 0.254902, 1,
-0.3419852, 0.2604233, -0.7679214, 0, 1, 0.2627451, 1,
-0.3363073, -0.1344263, -3.095454, 0, 1, 0.2666667, 1,
-0.3326818, 0.5276433, -0.7423739, 0, 1, 0.2745098, 1,
-0.3322177, -0.5802013, -3.671435, 0, 1, 0.2784314, 1,
-0.3308704, -0.4013399, -2.611524, 0, 1, 0.2862745, 1,
-0.3137311, -0.6770054, -1.980256, 0, 1, 0.2901961, 1,
-0.3081682, 0.216438, -1.710049, 0, 1, 0.2980392, 1,
-0.3068771, 1.243678, -1.185985, 0, 1, 0.3058824, 1,
-0.3056676, 0.3214932, 0.4060565, 0, 1, 0.3098039, 1,
-0.2976276, 0.9147081, 0.7280245, 0, 1, 0.3176471, 1,
-0.2846227, -0.005285032, -1.988772, 0, 1, 0.3215686, 1,
-0.2842427, -0.1194585, -2.557582, 0, 1, 0.3294118, 1,
-0.2769169, -0.9372033, -3.684896, 0, 1, 0.3333333, 1,
-0.2752516, 0.522684, -0.4218537, 0, 1, 0.3411765, 1,
-0.2744164, 0.9998226, -0.7901671, 0, 1, 0.345098, 1,
-0.2718823, -1.042031, -2.342433, 0, 1, 0.3529412, 1,
-0.2710711, -1.810369, -2.875352, 0, 1, 0.3568628, 1,
-0.2676002, 0.7406393, -0.3813765, 0, 1, 0.3647059, 1,
-0.2634377, 0.9107493, 0.4681059, 0, 1, 0.3686275, 1,
-0.261318, -0.9807737, -3.012681, 0, 1, 0.3764706, 1,
-0.2593187, 0.1067757, -1.761801, 0, 1, 0.3803922, 1,
-0.2588956, 0.6537137, -1.585318, 0, 1, 0.3882353, 1,
-0.258329, -0.1648385, -3.557051, 0, 1, 0.3921569, 1,
-0.2544151, -0.7410614, -3.875076, 0, 1, 0.4, 1,
-0.2533759, 0.07158683, -1.193368, 0, 1, 0.4078431, 1,
-0.2471558, 1.128463, 1.2083, 0, 1, 0.4117647, 1,
-0.2450637, 0.6621561, -0.09290043, 0, 1, 0.4196078, 1,
-0.2433242, 1.327488, -0.1907812, 0, 1, 0.4235294, 1,
-0.2432995, 0.4058683, 0.3047375, 0, 1, 0.4313726, 1,
-0.2388653, 0.8863297, 0.7904233, 0, 1, 0.4352941, 1,
-0.2215861, -0.8208015, -4.844689, 0, 1, 0.4431373, 1,
-0.2201638, 0.6257306, -0.5261092, 0, 1, 0.4470588, 1,
-0.2171877, 0.06586225, -0.8236743, 0, 1, 0.454902, 1,
-0.2116187, 0.49141, -0.5351105, 0, 1, 0.4588235, 1,
-0.211235, -0.7294495, -2.29945, 0, 1, 0.4666667, 1,
-0.2099216, -0.4965004, -0.6231595, 0, 1, 0.4705882, 1,
-0.2098809, -0.1531487, -3.669186, 0, 1, 0.4784314, 1,
-0.2092564, 2.103557, 2.364986, 0, 1, 0.4823529, 1,
-0.2046289, -0.3902866, -3.748326, 0, 1, 0.4901961, 1,
-0.2022458, 0.9537591, -1.740865, 0, 1, 0.4941176, 1,
-0.1991678, -0.9456788, -3.049538, 0, 1, 0.5019608, 1,
-0.1952614, -0.5839499, -1.922058, 0, 1, 0.509804, 1,
-0.1901748, -2.063524, -3.451246, 0, 1, 0.5137255, 1,
-0.1901253, 0.8609036, -0.4943479, 0, 1, 0.5215687, 1,
-0.1873478, -1.540265, -3.476928, 0, 1, 0.5254902, 1,
-0.1820307, -0.814467, -4.096877, 0, 1, 0.5333334, 1,
-0.175909, -0.06916948, -0.4380124, 0, 1, 0.5372549, 1,
-0.1741377, -0.591491, -3.430014, 0, 1, 0.5450981, 1,
-0.1701234, -0.7644349, -2.544899, 0, 1, 0.5490196, 1,
-0.1656945, 0.2935796, 0.5237234, 0, 1, 0.5568628, 1,
-0.16341, -1.127242, -2.941972, 0, 1, 0.5607843, 1,
-0.1631446, -0.662469, -3.559532, 0, 1, 0.5686275, 1,
-0.1607759, 0.4959981, -0.5306712, 0, 1, 0.572549, 1,
-0.1570967, -1.052325, -3.281409, 0, 1, 0.5803922, 1,
-0.1557476, -0.2630378, -3.21736, 0, 1, 0.5843138, 1,
-0.1511632, 1.423513, -0.02362868, 0, 1, 0.5921569, 1,
-0.1507904, -0.1053389, -1.361805, 0, 1, 0.5960785, 1,
-0.1504102, -0.3113438, -2.980121, 0, 1, 0.6039216, 1,
-0.1503886, 0.570663, -0.1276762, 0, 1, 0.6117647, 1,
-0.145432, 0.2265631, -1.058836, 0, 1, 0.6156863, 1,
-0.1415473, -0.265031, -2.81021, 0, 1, 0.6235294, 1,
-0.1382094, -2.131727, -2.934475, 0, 1, 0.627451, 1,
-0.1339522, -0.0259325, -2.208983, 0, 1, 0.6352941, 1,
-0.1198814, 0.1665853, -0.9283956, 0, 1, 0.6392157, 1,
-0.1167, -0.9908516, -3.520708, 0, 1, 0.6470588, 1,
-0.1149994, 0.5707167, -0.4437209, 0, 1, 0.6509804, 1,
-0.1109264, 0.5063732, 2.275175, 0, 1, 0.6588235, 1,
-0.1098364, 0.3969077, 0.4034932, 0, 1, 0.6627451, 1,
-0.1014049, -0.7263407, -2.899725, 0, 1, 0.6705883, 1,
-0.09672599, -1.358551, -3.139519, 0, 1, 0.6745098, 1,
-0.0953291, 0.1739304, -0.50305, 0, 1, 0.682353, 1,
-0.09467244, 1.490589, 0.3292538, 0, 1, 0.6862745, 1,
-0.09366257, -1.344462, -3.706025, 0, 1, 0.6941177, 1,
-0.09153528, 0.6663282, -0.4277332, 0, 1, 0.7019608, 1,
-0.09016363, 0.375222, 0.2419921, 0, 1, 0.7058824, 1,
-0.08982162, -1.528287, -4.877571, 0, 1, 0.7137255, 1,
-0.08915162, -1.270521, -1.666879, 0, 1, 0.7176471, 1,
-0.08893269, -0.08043531, -3.801247, 0, 1, 0.7254902, 1,
-0.08693794, -0.7507582, -2.283401, 0, 1, 0.7294118, 1,
-0.08671091, 0.6645556, -0.2731187, 0, 1, 0.7372549, 1,
-0.0855173, -1.645581, -2.162018, 0, 1, 0.7411765, 1,
-0.08386452, 0.7069595, -0.7134476, 0, 1, 0.7490196, 1,
-0.08295265, -1.860556, -2.137912, 0, 1, 0.7529412, 1,
-0.07970351, -0.3234626, -2.808909, 0, 1, 0.7607843, 1,
-0.07526416, 0.378792, -0.527529, 0, 1, 0.7647059, 1,
-0.07487866, -0.5899779, -3.045318, 0, 1, 0.772549, 1,
-0.07398657, -0.4543782, -3.414691, 0, 1, 0.7764706, 1,
-0.07328793, -0.044652, -0.817061, 0, 1, 0.7843137, 1,
-0.06713844, 0.1896816, 0.7826298, 0, 1, 0.7882353, 1,
-0.06514626, 0.3197186, 0.06867228, 0, 1, 0.7960784, 1,
-0.05980025, -0.6555852, -4.540482, 0, 1, 0.8039216, 1,
-0.05516585, 1.328161, -0.6366625, 0, 1, 0.8078431, 1,
-0.05223921, 0.3962316, -0.5510669, 0, 1, 0.8156863, 1,
-0.05197638, -0.8047012, -2.780287, 0, 1, 0.8196079, 1,
-0.04868965, 1.080127, -0.0904148, 0, 1, 0.827451, 1,
-0.04768154, 1.181764, -0.9598037, 0, 1, 0.8313726, 1,
-0.04290247, 0.588637, 0.3419105, 0, 1, 0.8392157, 1,
-0.04226362, -1.219507, -3.03816, 0, 1, 0.8431373, 1,
-0.04213063, 0.9560267, -1.66352, 0, 1, 0.8509804, 1,
-0.04106738, -1.25402, -1.861854, 0, 1, 0.854902, 1,
-0.03952233, 0.3676897, -1.626478, 0, 1, 0.8627451, 1,
-0.03944707, 0.09183881, 0.03160059, 0, 1, 0.8666667, 1,
-0.03533564, -1.083718, -2.909156, 0, 1, 0.8745098, 1,
-0.03525585, 0.2117794, -0.5346038, 0, 1, 0.8784314, 1,
-0.03340488, 1.134285, -0.1159023, 0, 1, 0.8862745, 1,
-0.03174483, 0.08449774, -0.7717035, 0, 1, 0.8901961, 1,
-0.03110254, -1.526612, -3.716671, 0, 1, 0.8980392, 1,
-0.02374516, -0.3461804, -3.872625, 0, 1, 0.9058824, 1,
-0.02236412, -2.118138, -2.110653, 0, 1, 0.9098039, 1,
-0.02233609, 0.2606082, 0.462141, 0, 1, 0.9176471, 1,
-0.02219227, -0.3507293, -2.188386, 0, 1, 0.9215686, 1,
-0.01064079, 1.000751, 0.2279933, 0, 1, 0.9294118, 1,
-0.001052662, 1.829164, -1.324731, 0, 1, 0.9333333, 1,
-0.0009151433, -1.547126, -3.321091, 0, 1, 0.9411765, 1,
0.0002027982, -0.1197939, 3.174652, 0, 1, 0.945098, 1,
0.001129537, -0.1591096, 2.674314, 0, 1, 0.9529412, 1,
0.003407879, -0.3959177, 2.198071, 0, 1, 0.9568627, 1,
0.004439352, 0.27369, 0.2935818, 0, 1, 0.9647059, 1,
0.00745527, -1.835201, 2.867856, 0, 1, 0.9686275, 1,
0.01033766, -0.3362588, 2.111745, 0, 1, 0.9764706, 1,
0.01203239, -0.09283467, 3.443598, 0, 1, 0.9803922, 1,
0.01381693, 0.3826092, 0.304449, 0, 1, 0.9882353, 1,
0.01503054, 0.4501808, -1.100655, 0, 1, 0.9921569, 1,
0.02050464, -0.566088, 2.326036, 0, 1, 1, 1,
0.02398751, 0.4294936, -1.165727, 0, 0.9921569, 1, 1,
0.02565233, 1.209553, -0.1168988, 0, 0.9882353, 1, 1,
0.02741326, -0.5492914, 1.055682, 0, 0.9803922, 1, 1,
0.02850944, 0.6884006, 1.002259, 0, 0.9764706, 1, 1,
0.03456514, -0.05538348, 3.433309, 0, 0.9686275, 1, 1,
0.03635866, -1.094554, 1.516163, 0, 0.9647059, 1, 1,
0.03820159, 0.4212337, -1.109519, 0, 0.9568627, 1, 1,
0.03829042, 0.01861314, 0.859056, 0, 0.9529412, 1, 1,
0.03840747, -1.428267, 1.610981, 0, 0.945098, 1, 1,
0.03918967, -0.2750582, 4.119663, 0, 0.9411765, 1, 1,
0.03965153, 1.480746, 1.037979, 0, 0.9333333, 1, 1,
0.03971732, -0.6113545, 4.562387, 0, 0.9294118, 1, 1,
0.04335877, 0.2041537, -0.2098639, 0, 0.9215686, 1, 1,
0.04591595, -0.3763064, 4.96256, 0, 0.9176471, 1, 1,
0.04838387, -0.3047897, 4.320357, 0, 0.9098039, 1, 1,
0.04907175, 1.363599, 1.223065, 0, 0.9058824, 1, 1,
0.05295112, 0.5656655, -0.7638276, 0, 0.8980392, 1, 1,
0.05320912, -0.0716659, 0.8996234, 0, 0.8901961, 1, 1,
0.05548395, -1.40813, 3.564566, 0, 0.8862745, 1, 1,
0.05582969, -1.210062, 3.479697, 0, 0.8784314, 1, 1,
0.06386127, -0.4472286, 2.625087, 0, 0.8745098, 1, 1,
0.06612918, -1.292958, 4.929189, 0, 0.8666667, 1, 1,
0.06631016, 0.4290295, -0.7706839, 0, 0.8627451, 1, 1,
0.06710675, 0.4526509, 0.6113998, 0, 0.854902, 1, 1,
0.06831508, -0.2638161, 5.351107, 0, 0.8509804, 1, 1,
0.07380502, -0.2071454, 2.161518, 0, 0.8431373, 1, 1,
0.0744549, 0.2018124, 0.6389145, 0, 0.8392157, 1, 1,
0.07576047, 0.1844639, 2.038052, 0, 0.8313726, 1, 1,
0.07581719, -0.5316988, 2.046108, 0, 0.827451, 1, 1,
0.08047879, -0.750499, 2.670905, 0, 0.8196079, 1, 1,
0.08319771, 0.6712405, 0.4445302, 0, 0.8156863, 1, 1,
0.08731786, 0.7356998, 0.1432025, 0, 0.8078431, 1, 1,
0.09285128, -1.928351, 4.398007, 0, 0.8039216, 1, 1,
0.09363973, 1.196941, 0.2643658, 0, 0.7960784, 1, 1,
0.09508562, 1.471757, 2.368602, 0, 0.7882353, 1, 1,
0.09801728, -1.121243, 2.623442, 0, 0.7843137, 1, 1,
0.09831329, 0.331673, 0.282079, 0, 0.7764706, 1, 1,
0.09839109, -0.7537707, 3.42639, 0, 0.772549, 1, 1,
0.09905605, 0.1511472, -0.3445259, 0, 0.7647059, 1, 1,
0.1005374, 0.1016188, -0.09950486, 0, 0.7607843, 1, 1,
0.1041701, 0.2490572, 1.349154, 0, 0.7529412, 1, 1,
0.1083305, -0.8986953, 3.870897, 0, 0.7490196, 1, 1,
0.1132018, 1.295717, 0.07160009, 0, 0.7411765, 1, 1,
0.1142996, -0.2185766, 2.404113, 0, 0.7372549, 1, 1,
0.1147387, 2.274233, 0.6545576, 0, 0.7294118, 1, 1,
0.1149428, 1.952448, -1.666811, 0, 0.7254902, 1, 1,
0.1182273, -0.8660374, 1.760967, 0, 0.7176471, 1, 1,
0.1196467, 3.347521, 1.247912, 0, 0.7137255, 1, 1,
0.1213772, -0.1455348, 3.002457, 0, 0.7058824, 1, 1,
0.1215852, -0.3516166, 0.6526223, 0, 0.6980392, 1, 1,
0.1217108, 0.2085024, 1.017444, 0, 0.6941177, 1, 1,
0.1231191, 1.860785, -0.5333425, 0, 0.6862745, 1, 1,
0.1261221, 0.7302729, 0.6308003, 0, 0.682353, 1, 1,
0.1273839, -0.1574777, 4.352586, 0, 0.6745098, 1, 1,
0.1289201, 0.5215902, 0.6251701, 0, 0.6705883, 1, 1,
0.1290993, 1.086594, -0.4471153, 0, 0.6627451, 1, 1,
0.1355116, -0.07855469, 2.271227, 0, 0.6588235, 1, 1,
0.1367151, 0.8529325, -1.125701, 0, 0.6509804, 1, 1,
0.1412105, -0.3554768, 3.76876, 0, 0.6470588, 1, 1,
0.1446143, 0.0641572, 0.4668011, 0, 0.6392157, 1, 1,
0.1484313, 0.2168355, 0.628496, 0, 0.6352941, 1, 1,
0.1502884, 0.9656402, 0.825631, 0, 0.627451, 1, 1,
0.1540677, 1.798275, 0.2742016, 0, 0.6235294, 1, 1,
0.1585666, 2.624724, -1.515505, 0, 0.6156863, 1, 1,
0.1602006, 0.840139, -0.2851384, 0, 0.6117647, 1, 1,
0.1603816, 1.950648, -1.003787, 0, 0.6039216, 1, 1,
0.1607617, -0.4898362, 3.197921, 0, 0.5960785, 1, 1,
0.164312, 1.83651, -0.1131463, 0, 0.5921569, 1, 1,
0.1652977, 0.6854466, 0.2437766, 0, 0.5843138, 1, 1,
0.1671537, -0.2106405, 2.11868, 0, 0.5803922, 1, 1,
0.1688916, 1.100425, 0.2361082, 0, 0.572549, 1, 1,
0.1698167, -1.166617, 1.450322, 0, 0.5686275, 1, 1,
0.1752039, -0.2624642, 2.003732, 0, 0.5607843, 1, 1,
0.1759242, -1.197826, 3.443872, 0, 0.5568628, 1, 1,
0.1815109, 1.456516, 1.455345, 0, 0.5490196, 1, 1,
0.1840214, 0.638894, 0.7383356, 0, 0.5450981, 1, 1,
0.1847936, -0.2559157, 3.059306, 0, 0.5372549, 1, 1,
0.1853171, -0.1488398, 3.405508, 0, 0.5333334, 1, 1,
0.1893213, -0.02492168, 2.994445, 0, 0.5254902, 1, 1,
0.1905683, 0.4822144, -0.05310332, 0, 0.5215687, 1, 1,
0.1971934, 0.4055271, -1.347121, 0, 0.5137255, 1, 1,
0.1994174, -0.9799047, 3.038171, 0, 0.509804, 1, 1,
0.2013846, -1.840365, 1.04959, 0, 0.5019608, 1, 1,
0.2069856, -0.5326884, 2.136404, 0, 0.4941176, 1, 1,
0.207715, 0.1091834, 1.851604, 0, 0.4901961, 1, 1,
0.2088962, 1.161383, -0.3605752, 0, 0.4823529, 1, 1,
0.2106279, 1.525201, -1.328346, 0, 0.4784314, 1, 1,
0.2136449, -2.486953, 1.922807, 0, 0.4705882, 1, 1,
0.2139772, -0.122166, 0.593205, 0, 0.4666667, 1, 1,
0.2235707, 1.220316, 0.08123833, 0, 0.4588235, 1, 1,
0.2271476, -2.898882, 2.747316, 0, 0.454902, 1, 1,
0.2274194, -1.285363, 3.940844, 0, 0.4470588, 1, 1,
0.2313119, 1.629697, -0.5803773, 0, 0.4431373, 1, 1,
0.2318227, -0.2459649, 2.276002, 0, 0.4352941, 1, 1,
0.2335327, -0.593545, 2.74314, 0, 0.4313726, 1, 1,
0.233763, -0.3687956, 2.491053, 0, 0.4235294, 1, 1,
0.2357481, 0.6679824, 1.461539, 0, 0.4196078, 1, 1,
0.2403385, 0.9176664, -0.7716168, 0, 0.4117647, 1, 1,
0.2425943, -1.401989, 2.990466, 0, 0.4078431, 1, 1,
0.2468762, -0.0206438, 1.031801, 0, 0.4, 1, 1,
0.2494808, -0.6688738, 3.722234, 0, 0.3921569, 1, 1,
0.2498037, -1.87868, 3.248875, 0, 0.3882353, 1, 1,
0.2512976, 0.5098193, 0.7852646, 0, 0.3803922, 1, 1,
0.2565844, -1.57023, 3.579739, 0, 0.3764706, 1, 1,
0.2572813, 2.145442, 0.8849463, 0, 0.3686275, 1, 1,
0.2634203, -1.007401, 4.527172, 0, 0.3647059, 1, 1,
0.2641225, -1.201182, 3.454673, 0, 0.3568628, 1, 1,
0.2660797, 1.759197, -0.192066, 0, 0.3529412, 1, 1,
0.2660968, -0.3196579, 2.675814, 0, 0.345098, 1, 1,
0.2665829, -1.458301, 2.500121, 0, 0.3411765, 1, 1,
0.2712553, 0.2913074, 0.2111249, 0, 0.3333333, 1, 1,
0.2714645, 1.226628, 0.5503384, 0, 0.3294118, 1, 1,
0.2735939, 2.222011, 0.7026346, 0, 0.3215686, 1, 1,
0.2765726, 0.8956712, 0.3448168, 0, 0.3176471, 1, 1,
0.2771087, 0.05930963, 0.697468, 0, 0.3098039, 1, 1,
0.2773193, 0.2465935, 0.6448611, 0, 0.3058824, 1, 1,
0.2789914, -0.03726852, 1.418768, 0, 0.2980392, 1, 1,
0.2843621, 1.042211, -0.7753583, 0, 0.2901961, 1, 1,
0.2847799, -1.200327, 2.569096, 0, 0.2862745, 1, 1,
0.2890763, -0.7144651, 3.092328, 0, 0.2784314, 1, 1,
0.2910553, -1.184805, 3.125485, 0, 0.2745098, 1, 1,
0.2916162, 3.334181, -1.112152, 0, 0.2666667, 1, 1,
0.2927949, -0.9972078, 3.220437, 0, 0.2627451, 1, 1,
0.2950312, -1.46585, 2.43482, 0, 0.254902, 1, 1,
0.3067965, 0.817674, 0.09493463, 0, 0.2509804, 1, 1,
0.3073558, 0.5767307, 0.4310664, 0, 0.2431373, 1, 1,
0.3083015, 0.2423601, 1.070664, 0, 0.2392157, 1, 1,
0.3122559, 0.3507503, -0.5131971, 0, 0.2313726, 1, 1,
0.3135093, -1.836434, 4.056205, 0, 0.227451, 1, 1,
0.3187449, -1.303636, 1.588245, 0, 0.2196078, 1, 1,
0.3200137, 0.1266269, 2.202506, 0, 0.2156863, 1, 1,
0.3240457, 0.1817347, -1.333759, 0, 0.2078431, 1, 1,
0.324865, -0.8421006, 4.606082, 0, 0.2039216, 1, 1,
0.3248861, 1.219086, 1.104634, 0, 0.1960784, 1, 1,
0.3375101, -1.584779, 2.962962, 0, 0.1882353, 1, 1,
0.3375689, -0.2408438, 0.9678639, 0, 0.1843137, 1, 1,
0.3392444, -0.3255105, 2.031546, 0, 0.1764706, 1, 1,
0.3439356, 0.01524486, 0.9603758, 0, 0.172549, 1, 1,
0.3468472, 0.2319909, 1.94456, 0, 0.1647059, 1, 1,
0.348647, 1.02637, -0.2098598, 0, 0.1607843, 1, 1,
0.3578853, 0.6922988, 1.309102, 0, 0.1529412, 1, 1,
0.360987, -1.404812, 0.960708, 0, 0.1490196, 1, 1,
0.3616933, 0.190061, 0.6435356, 0, 0.1411765, 1, 1,
0.3646763, 0.1834221, 1.733346, 0, 0.1372549, 1, 1,
0.3648072, 0.4654884, 2.037419, 0, 0.1294118, 1, 1,
0.3665688, 0.2270527, -0.1173197, 0, 0.1254902, 1, 1,
0.3666056, 1.66038, -0.4394951, 0, 0.1176471, 1, 1,
0.3764516, -0.1631287, 2.30669, 0, 0.1137255, 1, 1,
0.3801431, 0.340381, 1.008412, 0, 0.1058824, 1, 1,
0.3810359, 1.360227, 1.692359, 0, 0.09803922, 1, 1,
0.3835483, -0.6414579, 2.014467, 0, 0.09411765, 1, 1,
0.3849157, -1.034153, 1.065814, 0, 0.08627451, 1, 1,
0.3972009, 0.645267, -0.2819766, 0, 0.08235294, 1, 1,
0.398182, 1.579187, -0.5920605, 0, 0.07450981, 1, 1,
0.4007647, 0.119529, 2.084957, 0, 0.07058824, 1, 1,
0.4044921, -0.7038258, 3.043704, 0, 0.0627451, 1, 1,
0.4058783, 0.4409189, -0.3020143, 0, 0.05882353, 1, 1,
0.4067451, -0.3160709, 2.527997, 0, 0.05098039, 1, 1,
0.4072337, 1.635855, -0.4600395, 0, 0.04705882, 1, 1,
0.40858, 0.01536923, 2.010386, 0, 0.03921569, 1, 1,
0.4109772, 0.5675604, 1.30208, 0, 0.03529412, 1, 1,
0.4134294, 0.7813211, -0.9618205, 0, 0.02745098, 1, 1,
0.4147828, -0.09990544, -0.1684785, 0, 0.02352941, 1, 1,
0.4177018, 0.05868493, 0.9516616, 0, 0.01568628, 1, 1,
0.4185098, 0.03628849, 2.287619, 0, 0.01176471, 1, 1,
0.4212635, -0.272273, 3.346792, 0, 0.003921569, 1, 1,
0.4236322, -0.1094082, 0.4256212, 0.003921569, 0, 1, 1,
0.4237457, -0.7154245, 1.813623, 0.007843138, 0, 1, 1,
0.4243486, -0.06693546, 1.751374, 0.01568628, 0, 1, 1,
0.4248159, -0.5599338, 2.411802, 0.01960784, 0, 1, 1,
0.4265535, -2.091691, 2.9954, 0.02745098, 0, 1, 1,
0.4265854, -1.543251, 3.34908, 0.03137255, 0, 1, 1,
0.4269639, -0.5345773, 2.299216, 0.03921569, 0, 1, 1,
0.4320504, -1.277962, 2.131879, 0.04313726, 0, 1, 1,
0.4439458, -0.8433757, 2.268664, 0.05098039, 0, 1, 1,
0.4516184, -0.3097797, 0.826491, 0.05490196, 0, 1, 1,
0.451726, 0.08104087, -0.302064, 0.0627451, 0, 1, 1,
0.4551265, 0.1259728, 2.073462, 0.06666667, 0, 1, 1,
0.4568183, -0.165309, -0.3117421, 0.07450981, 0, 1, 1,
0.4596935, -0.2415177, 2.337515, 0.07843138, 0, 1, 1,
0.4621884, -0.1151659, 0.121118, 0.08627451, 0, 1, 1,
0.4628302, 0.8972329, 0.6652418, 0.09019608, 0, 1, 1,
0.4642514, -0.5191798, 1.268597, 0.09803922, 0, 1, 1,
0.464376, 1.7902, -0.9608748, 0.1058824, 0, 1, 1,
0.466996, -0.1504954, 0.08072782, 0.1098039, 0, 1, 1,
0.4729839, -0.3735288, 1.779294, 0.1176471, 0, 1, 1,
0.473024, 0.322175, 2.384811, 0.1215686, 0, 1, 1,
0.4753926, 0.8273121, 1.508629, 0.1294118, 0, 1, 1,
0.4807971, -0.9630656, 3.166441, 0.1333333, 0, 1, 1,
0.4831491, -0.2705983, 2.335754, 0.1411765, 0, 1, 1,
0.4876029, 0.4043706, 0.4266168, 0.145098, 0, 1, 1,
0.4890699, 1.753913, 0.1209676, 0.1529412, 0, 1, 1,
0.4898599, -0.4968465, 0.7101835, 0.1568628, 0, 1, 1,
0.4899705, -0.3082447, 1.376502, 0.1647059, 0, 1, 1,
0.4906422, -0.05367319, 0.9648374, 0.1686275, 0, 1, 1,
0.4909013, -0.01998275, 1.135279, 0.1764706, 0, 1, 1,
0.4931644, -1.490119, 2.734464, 0.1803922, 0, 1, 1,
0.4937261, 0.3003237, 1.682568, 0.1882353, 0, 1, 1,
0.4953586, -0.3520831, 1.25864, 0.1921569, 0, 1, 1,
0.502672, -1.131922, 0.8514584, 0.2, 0, 1, 1,
0.5046272, -0.1165797, 3.097212, 0.2078431, 0, 1, 1,
0.512957, 0.2701208, 1.319447, 0.2117647, 0, 1, 1,
0.514929, 2.105828, 0.1964877, 0.2196078, 0, 1, 1,
0.5162102, 3.055929, -1.455286, 0.2235294, 0, 1, 1,
0.5191562, -1.686236, 2.694367, 0.2313726, 0, 1, 1,
0.51941, 0.4199512, -0.86576, 0.2352941, 0, 1, 1,
0.5216888, 0.4957841, 1.210941, 0.2431373, 0, 1, 1,
0.5244023, -0.4941394, 2.059956, 0.2470588, 0, 1, 1,
0.5249366, 0.03394342, 2.855962, 0.254902, 0, 1, 1,
0.5299605, -2.452576, 0.9242145, 0.2588235, 0, 1, 1,
0.5315641, -0.1494092, 1.14184, 0.2666667, 0, 1, 1,
0.5324822, -1.258907, 3.997711, 0.2705882, 0, 1, 1,
0.5335526, 1.177592, -0.8134582, 0.2784314, 0, 1, 1,
0.5343757, -1.152736, 1.316251, 0.282353, 0, 1, 1,
0.5348728, 0.7589063, -1.008281, 0.2901961, 0, 1, 1,
0.5375942, 0.8046224, -0.4179536, 0.2941177, 0, 1, 1,
0.5394927, -2.393018, 2.735319, 0.3019608, 0, 1, 1,
0.5417324, -0.1142922, 1.898076, 0.3098039, 0, 1, 1,
0.5422475, -0.1805532, 2.752491, 0.3137255, 0, 1, 1,
0.546917, 1.153125, -0.4790911, 0.3215686, 0, 1, 1,
0.5481322, 0.1799421, 2.379589, 0.3254902, 0, 1, 1,
0.5494402, -0.7693576, 3.129801, 0.3333333, 0, 1, 1,
0.5498657, -0.3465619, 1.958819, 0.3372549, 0, 1, 1,
0.5579531, -1.766358, 4.888833, 0.345098, 0, 1, 1,
0.5615132, -0.1160079, 1.055966, 0.3490196, 0, 1, 1,
0.5629233, 0.320927, 1.499957, 0.3568628, 0, 1, 1,
0.5645368, -0.8680449, 4.494943, 0.3607843, 0, 1, 1,
0.5647963, -1.152971, 1.486072, 0.3686275, 0, 1, 1,
0.5689118, 0.4172305, 1.140284, 0.372549, 0, 1, 1,
0.574384, -0.5287116, 2.035417, 0.3803922, 0, 1, 1,
0.5764062, 0.7381404, 0.3948133, 0.3843137, 0, 1, 1,
0.5789233, -0.08979186, 3.14532, 0.3921569, 0, 1, 1,
0.5830158, 0.5294331, 2.138998, 0.3960784, 0, 1, 1,
0.5856798, -0.05294637, 2.039689, 0.4039216, 0, 1, 1,
0.593637, -1.646485, 2.778316, 0.4117647, 0, 1, 1,
0.6023989, -0.5136981, -0.5568852, 0.4156863, 0, 1, 1,
0.6094751, -0.1971539, 1.726108, 0.4235294, 0, 1, 1,
0.6102167, 0.772298, 2.504596, 0.427451, 0, 1, 1,
0.6227733, -0.5373724, 3.839818, 0.4352941, 0, 1, 1,
0.6242937, 0.3163233, 1.615277, 0.4392157, 0, 1, 1,
0.6253082, 0.9416473, -0.3559216, 0.4470588, 0, 1, 1,
0.6286377, -0.1743972, 4.647918, 0.4509804, 0, 1, 1,
0.6330119, -1.127559, 2.49327, 0.4588235, 0, 1, 1,
0.636871, 0.3316867, 0.8430117, 0.4627451, 0, 1, 1,
0.6381067, 0.3492014, -0.04436265, 0.4705882, 0, 1, 1,
0.6509268, -0.8593376, 3.420735, 0.4745098, 0, 1, 1,
0.6538297, 0.6302124, -0.2877908, 0.4823529, 0, 1, 1,
0.6570985, 0.7954905, 0.2602973, 0.4862745, 0, 1, 1,
0.6652159, -0.2952118, 1.810518, 0.4941176, 0, 1, 1,
0.6681952, 0.5550314, 1.675313, 0.5019608, 0, 1, 1,
0.675539, 1.288864, -1.240986, 0.5058824, 0, 1, 1,
0.6799496, 0.4825763, -0.151792, 0.5137255, 0, 1, 1,
0.6807728, -0.2886023, 2.458419, 0.5176471, 0, 1, 1,
0.6860081, -2.468309, 3.228683, 0.5254902, 0, 1, 1,
0.6886652, 0.910339, 0.8942757, 0.5294118, 0, 1, 1,
0.6899498, 0.5968343, 0.9358138, 0.5372549, 0, 1, 1,
0.6925011, -0.8157095, 2.345852, 0.5411765, 0, 1, 1,
0.7168753, 1.046893, 0.4614469, 0.5490196, 0, 1, 1,
0.7214655, -0.9678229, 2.318776, 0.5529412, 0, 1, 1,
0.7231656, 0.9658759, 0.8488477, 0.5607843, 0, 1, 1,
0.7353829, -1.526913, 2.654844, 0.5647059, 0, 1, 1,
0.7479929, 0.4341977, -0.09433952, 0.572549, 0, 1, 1,
0.7523817, 0.6206527, 1.430193, 0.5764706, 0, 1, 1,
0.7533045, 0.3623965, 0.1164861, 0.5843138, 0, 1, 1,
0.7535511, 1.584168, -0.1219942, 0.5882353, 0, 1, 1,
0.7535762, 0.8934928, -0.3987319, 0.5960785, 0, 1, 1,
0.7674496, 0.08511525, 0.9312735, 0.6039216, 0, 1, 1,
0.7720783, -0.2753584, 2.434772, 0.6078432, 0, 1, 1,
0.7763104, 0.9217873, -0.5633417, 0.6156863, 0, 1, 1,
0.7797154, 1.212315, 0.167579, 0.6196079, 0, 1, 1,
0.7805132, -1.001172, 1.663482, 0.627451, 0, 1, 1,
0.7821239, 1.655427, 2.578314, 0.6313726, 0, 1, 1,
0.7824641, -0.2103052, 0.361625, 0.6392157, 0, 1, 1,
0.7825751, -0.1940843, 2.175703, 0.6431373, 0, 1, 1,
0.7854967, 0.1793866, -0.2546837, 0.6509804, 0, 1, 1,
0.7888201, 0.6691049, 1.419225, 0.654902, 0, 1, 1,
0.7898652, 0.08504146, 0.8258969, 0.6627451, 0, 1, 1,
0.792852, 0.5593346, 0.7723598, 0.6666667, 0, 1, 1,
0.8035311, -0.974013, 2.36379, 0.6745098, 0, 1, 1,
0.8040523, 1.241764, -0.2666122, 0.6784314, 0, 1, 1,
0.8066627, -1.138317, 2.079305, 0.6862745, 0, 1, 1,
0.8082172, -0.4225933, 1.497513, 0.6901961, 0, 1, 1,
0.809691, 0.8941494, 2.770446, 0.6980392, 0, 1, 1,
0.8125058, 1.07121, 0.6669875, 0.7058824, 0, 1, 1,
0.8158054, 1.052129, 0.625551, 0.7098039, 0, 1, 1,
0.8192528, -0.2958876, 1.752867, 0.7176471, 0, 1, 1,
0.8277348, 1.22072, 1.313823, 0.7215686, 0, 1, 1,
0.8295221, 0.1220938, 1.203836, 0.7294118, 0, 1, 1,
0.8309408, -0.01308598, 2.551492, 0.7333333, 0, 1, 1,
0.8418936, 1.689157, 0.1910336, 0.7411765, 0, 1, 1,
0.846796, 0.04309973, -0.2938625, 0.7450981, 0, 1, 1,
0.8507, -0.6106142, 1.635695, 0.7529412, 0, 1, 1,
0.8519911, 1.083323, 1.866494, 0.7568628, 0, 1, 1,
0.8536431, -0.7562497, 3.35211, 0.7647059, 0, 1, 1,
0.858232, -0.768668, 3.254329, 0.7686275, 0, 1, 1,
0.8656155, 0.4212844, 1.863705, 0.7764706, 0, 1, 1,
0.8715757, 0.1511698, 1.157658, 0.7803922, 0, 1, 1,
0.8760586, 0.08124381, 1.996137, 0.7882353, 0, 1, 1,
0.8805919, 0.6521314, 2.14441, 0.7921569, 0, 1, 1,
0.8811487, -0.2301116, 1.080618, 0.8, 0, 1, 1,
0.8851006, 0.2248605, 1.525049, 0.8078431, 0, 1, 1,
0.8984973, -1.305296, 2.234555, 0.8117647, 0, 1, 1,
0.9166618, 1.154534, 0.5477989, 0.8196079, 0, 1, 1,
0.9169721, 0.2184423, 2.988754, 0.8235294, 0, 1, 1,
0.9196715, 0.6258484, 0.9009337, 0.8313726, 0, 1, 1,
0.9226377, -1.143119, -0.1191552, 0.8352941, 0, 1, 1,
0.9230132, -0.17931, 2.227381, 0.8431373, 0, 1, 1,
0.9235901, -0.8030068, -0.04771197, 0.8470588, 0, 1, 1,
0.9246687, 0.855227, 0.2611919, 0.854902, 0, 1, 1,
0.9302891, 0.3163189, 1.277436, 0.8588235, 0, 1, 1,
0.9316909, -0.4787374, 2.280177, 0.8666667, 0, 1, 1,
0.9332807, -1.044439, 3.366433, 0.8705882, 0, 1, 1,
0.9376441, -0.3165241, 0.95956, 0.8784314, 0, 1, 1,
0.9391468, 1.560999, 1.536068, 0.8823529, 0, 1, 1,
0.9492238, 1.800732, 1.81499, 0.8901961, 0, 1, 1,
0.9514286, 0.2799669, 2.865101, 0.8941177, 0, 1, 1,
0.9544548, 1.510837, 1.730444, 0.9019608, 0, 1, 1,
0.9607688, -1.422353, 2.656469, 0.9098039, 0, 1, 1,
0.9609613, -0.2933849, 3.240304, 0.9137255, 0, 1, 1,
0.9647417, 1.048161, 1.253492, 0.9215686, 0, 1, 1,
0.9668371, -0.8862604, 3.39166, 0.9254902, 0, 1, 1,
0.9689888, 0.6973757, 0.6267194, 0.9333333, 0, 1, 1,
0.9735585, 1.099818, 1.435181, 0.9372549, 0, 1, 1,
0.9789176, 2.46924, 0.8842365, 0.945098, 0, 1, 1,
0.9846676, 0.1163347, 0.9176404, 0.9490196, 0, 1, 1,
0.987269, -0.6894315, 1.496153, 0.9568627, 0, 1, 1,
0.9895788, -1.150142, 1.761248, 0.9607843, 0, 1, 1,
0.9924222, -1.082311, 2.992387, 0.9686275, 0, 1, 1,
0.992741, -1.228745, 4.652698, 0.972549, 0, 1, 1,
0.9957175, 0.1682831, 1.80944, 0.9803922, 0, 1, 1,
0.9987842, -0.2598812, 1.53752, 0.9843137, 0, 1, 1,
0.9995556, 0.4853033, 0.8162591, 0.9921569, 0, 1, 1,
1.000853, -0.876681, 2.480625, 0.9960784, 0, 1, 1,
1.004346, -0.329666, 2.025872, 1, 0, 0.9960784, 1,
1.00625, 1.312506, 1.70518, 1, 0, 0.9882353, 1,
1.008927, -0.08640748, 3.2919, 1, 0, 0.9843137, 1,
1.011131, -4.110104e-05, 2.701605, 1, 0, 0.9764706, 1,
1.012878, -1.017019, 1.496802, 1, 0, 0.972549, 1,
1.021597, 0.6781009, 1.343104, 1, 0, 0.9647059, 1,
1.035134, -0.1110408, 2.921414, 1, 0, 0.9607843, 1,
1.040735, -1.593696, 2.113168, 1, 0, 0.9529412, 1,
1.041277, 1.163923, -1.251016, 1, 0, 0.9490196, 1,
1.045103, 0.3027114, 0.2019453, 1, 0, 0.9411765, 1,
1.04937, -0.3601143, 3.761088, 1, 0, 0.9372549, 1,
1.050282, 1.743436, -0.7615719, 1, 0, 0.9294118, 1,
1.051937, -2.698857, 0.2972523, 1, 0, 0.9254902, 1,
1.055018, -1.430856, 3.269219, 1, 0, 0.9176471, 1,
1.056603, -0.6976042, 1.657107, 1, 0, 0.9137255, 1,
1.062854, -0.4058287, 1.002069, 1, 0, 0.9058824, 1,
1.063395, 1.419617, 0.7211841, 1, 0, 0.9019608, 1,
1.064494, 1.032754, 1.898932, 1, 0, 0.8941177, 1,
1.068161, -1.378954, 2.686295, 1, 0, 0.8862745, 1,
1.069694, -0.2618668, 1.613587, 1, 0, 0.8823529, 1,
1.072343, 0.5245123, 2.38708, 1, 0, 0.8745098, 1,
1.072788, -0.2511913, -0.1075414, 1, 0, 0.8705882, 1,
1.074219, 0.4828029, 1.206177, 1, 0, 0.8627451, 1,
1.076364, 0.2351371, 1.483139, 1, 0, 0.8588235, 1,
1.082432, -0.2860435, 2.19508, 1, 0, 0.8509804, 1,
1.087916, 0.3872551, 1.848255, 1, 0, 0.8470588, 1,
1.088781, -0.2754263, 1.22583, 1, 0, 0.8392157, 1,
1.09435, 0.6292995, 1.40573, 1, 0, 0.8352941, 1,
1.095549, -1.879164, 2.960788, 1, 0, 0.827451, 1,
1.098312, -0.09514751, 2.657053, 1, 0, 0.8235294, 1,
1.108501, -0.5211022, 2.178942, 1, 0, 0.8156863, 1,
1.109109, 1.873376, 0.9174004, 1, 0, 0.8117647, 1,
1.109623, 0.488648, -0.1157879, 1, 0, 0.8039216, 1,
1.114769, -0.4220083, 1.427583, 1, 0, 0.7960784, 1,
1.117108, 0.2467817, 0.6308321, 1, 0, 0.7921569, 1,
1.117381, 2.387396, 1.138707, 1, 0, 0.7843137, 1,
1.122482, -0.250238, 2.021013, 1, 0, 0.7803922, 1,
1.123967, -0.4419274, 1.317459, 1, 0, 0.772549, 1,
1.128227, 0.112643, 1.097031, 1, 0, 0.7686275, 1,
1.13741, 0.1806962, 2.642725, 1, 0, 0.7607843, 1,
1.140342, -0.4989961, 2.03576, 1, 0, 0.7568628, 1,
1.144609, 1.133515, 1.763865, 1, 0, 0.7490196, 1,
1.149512, 0.2094272, 2.320053, 1, 0, 0.7450981, 1,
1.159544, -0.1020179, 0.7190054, 1, 0, 0.7372549, 1,
1.173584, 0.7284508, 0.8452436, 1, 0, 0.7333333, 1,
1.176689, 0.6051019, 3.697649, 1, 0, 0.7254902, 1,
1.20684, -0.8498294, 2.803883, 1, 0, 0.7215686, 1,
1.210042, 1.228267, 1.606902, 1, 0, 0.7137255, 1,
1.217641, 0.2348283, 2.014763, 1, 0, 0.7098039, 1,
1.227139, 1.825253, 0.9770809, 1, 0, 0.7019608, 1,
1.227406, 0.5068514, 0.1587271, 1, 0, 0.6941177, 1,
1.244676, -0.7377588, 2.236224, 1, 0, 0.6901961, 1,
1.250174, -1.657335, 3.55678, 1, 0, 0.682353, 1,
1.251055, 0.6768249, 1.41157, 1, 0, 0.6784314, 1,
1.255154, -0.07765257, 2.24757, 1, 0, 0.6705883, 1,
1.257693, -2.264024, 2.617743, 1, 0, 0.6666667, 1,
1.258374, 0.2107297, 0.5115705, 1, 0, 0.6588235, 1,
1.260544, 0.2101999, 0.5978943, 1, 0, 0.654902, 1,
1.261005, 0.9775195, 0.6686956, 1, 0, 0.6470588, 1,
1.305247, 0.2756137, 1.087117, 1, 0, 0.6431373, 1,
1.31655, -0.6513099, 2.516941, 1, 0, 0.6352941, 1,
1.324836, -0.119173, 1.683379, 1, 0, 0.6313726, 1,
1.330796, -0.1506287, 0.7672139, 1, 0, 0.6235294, 1,
1.331028, -0.8400806, 3.363499, 1, 0, 0.6196079, 1,
1.33642, -0.2293016, 2.090093, 1, 0, 0.6117647, 1,
1.338694, -1.12131, 1.753529, 1, 0, 0.6078432, 1,
1.342442, -0.574625, 2.005493, 1, 0, 0.6, 1,
1.352964, 1.678725, 0.6177421, 1, 0, 0.5921569, 1,
1.362275, -0.2727296, 1.365161, 1, 0, 0.5882353, 1,
1.368211, -1.358495, 3.523992, 1, 0, 0.5803922, 1,
1.368953, 0.01320512, 1.084791, 1, 0, 0.5764706, 1,
1.370371, 0.3214351, 1.260166, 1, 0, 0.5686275, 1,
1.377198, -0.7194648, 2.126349, 1, 0, 0.5647059, 1,
1.382252, 1.02226, -0.1548531, 1, 0, 0.5568628, 1,
1.387925, -0.232772, 1.645208, 1, 0, 0.5529412, 1,
1.388991, 1.05317, 1.050181, 1, 0, 0.5450981, 1,
1.410087, -1.445605, 1.556828, 1, 0, 0.5411765, 1,
1.419634, -0.7322131, 2.387179, 1, 0, 0.5333334, 1,
1.430324, 1.479351, 2.776003, 1, 0, 0.5294118, 1,
1.433956, -0.7309219, 1.803829, 1, 0, 0.5215687, 1,
1.436985, 0.1753386, 2.939423, 1, 0, 0.5176471, 1,
1.440895, 0.2417822, 0.9233029, 1, 0, 0.509804, 1,
1.453415, 0.3673193, -0.32205, 1, 0, 0.5058824, 1,
1.454212, 1.109965, 1.501675, 1, 0, 0.4980392, 1,
1.457662, -0.1162952, 1.896896, 1, 0, 0.4901961, 1,
1.473584, -0.6162555, 1.879177, 1, 0, 0.4862745, 1,
1.474517, 1.321468, 1.278552, 1, 0, 0.4784314, 1,
1.477746, 1.691363, 2.049085, 1, 0, 0.4745098, 1,
1.482175, 0.3211083, 0.6681529, 1, 0, 0.4666667, 1,
1.48668, 1.409611, 0.1908403, 1, 0, 0.4627451, 1,
1.48682, -0.464128, 4.476579, 1, 0, 0.454902, 1,
1.492926, 1.009681, 1.855138, 1, 0, 0.4509804, 1,
1.493462, 0.01588653, 0.3308279, 1, 0, 0.4431373, 1,
1.510485, 0.3497214, 0.9728066, 1, 0, 0.4392157, 1,
1.510895, -0.6544548, 3.293228, 1, 0, 0.4313726, 1,
1.538941, -1.990049, 3.070689, 1, 0, 0.427451, 1,
1.550523, 1.275902, 0.5537944, 1, 0, 0.4196078, 1,
1.571706, -1.03514, 0.9880976, 1, 0, 0.4156863, 1,
1.572992, 0.09429565, 1.998909, 1, 0, 0.4078431, 1,
1.595114, -0.444201, -0.7411913, 1, 0, 0.4039216, 1,
1.595943, -1.34439, 2.801473, 1, 0, 0.3960784, 1,
1.602976, -1.02654, 2.173861, 1, 0, 0.3882353, 1,
1.60316, 0.4327025, 2.304404, 1, 0, 0.3843137, 1,
1.615934, -0.805266, 0.7031454, 1, 0, 0.3764706, 1,
1.619356, 0.8662612, 0.02554095, 1, 0, 0.372549, 1,
1.622658, 0.314739, -0.3165537, 1, 0, 0.3647059, 1,
1.651662, -0.2196734, 1.675353, 1, 0, 0.3607843, 1,
1.654273, -0.4104597, 1.331943, 1, 0, 0.3529412, 1,
1.65599, -0.605911, 3.336327, 1, 0, 0.3490196, 1,
1.662001, 0.6240368, 1.047421, 1, 0, 0.3411765, 1,
1.676097, 0.9493062, 0.187979, 1, 0, 0.3372549, 1,
1.677178, 0.3596559, 2.302137, 1, 0, 0.3294118, 1,
1.678073, -1.128662, 3.541785, 1, 0, 0.3254902, 1,
1.679544, -0.6572975, 1.546826, 1, 0, 0.3176471, 1,
1.680769, 0.2719752, -0.02286802, 1, 0, 0.3137255, 1,
1.68099, -1.077184, 5.143599, 1, 0, 0.3058824, 1,
1.692781, -0.1254233, 2.971014, 1, 0, 0.2980392, 1,
1.697616, -0.1898012, -0.3773519, 1, 0, 0.2941177, 1,
1.713956, 1.109846, 2.163341, 1, 0, 0.2862745, 1,
1.714117, -0.3233142, 2.294186, 1, 0, 0.282353, 1,
1.732734, -1.604412, 3.899381, 1, 0, 0.2745098, 1,
1.734764, 2.467342, 0.03342996, 1, 0, 0.2705882, 1,
1.740506, -0.7050121, 2.988548, 1, 0, 0.2627451, 1,
1.758768, -0.9386356, 1.792274, 1, 0, 0.2588235, 1,
1.766658, -0.2384093, 2.631219, 1, 0, 0.2509804, 1,
1.770294, 1.129985, 1.822037, 1, 0, 0.2470588, 1,
1.77652, -1.531163, 0.7448124, 1, 0, 0.2392157, 1,
1.78166, 0.08917091, 1.896799, 1, 0, 0.2352941, 1,
1.784632, -1.45804, 0.8498057, 1, 0, 0.227451, 1,
1.794835, 0.6645765, -0.1057592, 1, 0, 0.2235294, 1,
1.822559, -0.1445262, 2.638457, 1, 0, 0.2156863, 1,
1.827137, 1.249836, 3.158886, 1, 0, 0.2117647, 1,
1.847772, -0.1507978, 2.948991, 1, 0, 0.2039216, 1,
1.902389, 0.1943562, 2.790508, 1, 0, 0.1960784, 1,
1.906763, 0.7710218, 0.6021491, 1, 0, 0.1921569, 1,
1.935586, -0.04496705, 2.647657, 1, 0, 0.1843137, 1,
1.941484, -0.5117688, 1.331643, 1, 0, 0.1803922, 1,
1.962787, 0.7887669, 0.9506814, 1, 0, 0.172549, 1,
1.969177, 1.169386, 1.106335, 1, 0, 0.1686275, 1,
1.981491, -0.2082135, 1.160929, 1, 0, 0.1607843, 1,
1.986376, 1.74228, 1.485279, 1, 0, 0.1568628, 1,
2.031717, -0.618051, 1.123956, 1, 0, 0.1490196, 1,
2.03606, 0.2740806, 1.410162, 1, 0, 0.145098, 1,
2.052972, -0.9498469, 1.302894, 1, 0, 0.1372549, 1,
2.083196, 0.4192185, 0.7958407, 1, 0, 0.1333333, 1,
2.130533, 0.705522, 0.04849838, 1, 0, 0.1254902, 1,
2.132794, -0.3542269, 2.003406, 1, 0, 0.1215686, 1,
2.148567, 0.4726883, 1.698187, 1, 0, 0.1137255, 1,
2.184183, -0.01644573, 1.978572, 1, 0, 0.1098039, 1,
2.192649, 1.633851, 1.460781, 1, 0, 0.1019608, 1,
2.229083, 0.44972, 2.487841, 1, 0, 0.09411765, 1,
2.260969, 1.788215, 1.776913, 1, 0, 0.09019608, 1,
2.300717, -0.7987943, 0.9597825, 1, 0, 0.08235294, 1,
2.351655, -1.75173, 1.665353, 1, 0, 0.07843138, 1,
2.486464, -1.246071, 3.715863, 1, 0, 0.07058824, 1,
2.588415, 0.08721428, 1.740394, 1, 0, 0.06666667, 1,
2.63122, -0.4210368, 1.760905, 1, 0, 0.05882353, 1,
2.634416, 1.36118, 0.8856789, 1, 0, 0.05490196, 1,
2.697161, 0.6332593, 0.6515983, 1, 0, 0.04705882, 1,
2.743547, 0.762041, 1.640701, 1, 0, 0.04313726, 1,
2.953573, 0.8141761, 1.71254, 1, 0, 0.03529412, 1,
2.960876, 0.4708247, 1.488067, 1, 0, 0.03137255, 1,
2.986043, -0.3290452, 1.09733, 1, 0, 0.02352941, 1,
3.027733, -0.9150625, 0.9351277, 1, 0, 0.01960784, 1,
3.060178, -1.404668, 0.7248803, 1, 0, 0.01176471, 1,
3.123409, -0.8876407, 3.391066, 1, 0, 0.007843138, 1
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
-0.1550996, -3.957648, -7.214246, 0, -0.5, 0.5, 0.5,
-0.1550996, -3.957648, -7.214246, 1, -0.5, 0.5, 0.5,
-0.1550996, -3.957648, -7.214246, 1, 1.5, 0.5, 0.5,
-0.1550996, -3.957648, -7.214246, 0, 1.5, 0.5, 0.5
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
-4.545022, 0.2243193, -7.214246, 0, -0.5, 0.5, 0.5,
-4.545022, 0.2243193, -7.214246, 1, -0.5, 0.5, 0.5,
-4.545022, 0.2243193, -7.214246, 1, 1.5, 0.5, 0.5,
-4.545022, 0.2243193, -7.214246, 0, 1.5, 0.5, 0.5
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
-4.545022, -3.957648, -0.020998, 0, -0.5, 0.5, 0.5,
-4.545022, -3.957648, -0.020998, 1, -0.5, 0.5, 0.5,
-4.545022, -3.957648, -0.020998, 1, 1.5, 0.5, 0.5,
-4.545022, -3.957648, -0.020998, 0, 1.5, 0.5, 0.5
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
-3, -2.992578, -5.554266,
3, -2.992578, -5.554266,
-3, -2.992578, -5.554266,
-3, -3.153423, -5.830929,
-2, -2.992578, -5.554266,
-2, -3.153423, -5.830929,
-1, -2.992578, -5.554266,
-1, -3.153423, -5.830929,
0, -2.992578, -5.554266,
0, -3.153423, -5.830929,
1, -2.992578, -5.554266,
1, -3.153423, -5.830929,
2, -2.992578, -5.554266,
2, -3.153423, -5.830929,
3, -2.992578, -5.554266,
3, -3.153423, -5.830929
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
-3, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
-3, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
-3, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
-3, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5,
-2, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
-2, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
-2, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
-2, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5,
-1, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
-1, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
-1, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
-1, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5,
0, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
0, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
0, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
0, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5,
1, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
1, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
1, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
1, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5,
2, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
2, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
2, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
2, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5,
3, -3.475113, -6.384256, 0, -0.5, 0.5, 0.5,
3, -3.475113, -6.384256, 1, -0.5, 0.5, 0.5,
3, -3.475113, -6.384256, 1, 1.5, 0.5, 0.5,
3, -3.475113, -6.384256, 0, 1.5, 0.5, 0.5
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
-3.531963, -2, -5.554266,
-3.531963, 3, -5.554266,
-3.531963, -2, -5.554266,
-3.700806, -2, -5.830929,
-3.531963, -1, -5.554266,
-3.700806, -1, -5.830929,
-3.531963, 0, -5.554266,
-3.700806, 0, -5.830929,
-3.531963, 1, -5.554266,
-3.700806, 1, -5.830929,
-3.531963, 2, -5.554266,
-3.700806, 2, -5.830929,
-3.531963, 3, -5.554266,
-3.700806, 3, -5.830929
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
-4.038493, -2, -6.384256, 0, -0.5, 0.5, 0.5,
-4.038493, -2, -6.384256, 1, -0.5, 0.5, 0.5,
-4.038493, -2, -6.384256, 1, 1.5, 0.5, 0.5,
-4.038493, -2, -6.384256, 0, 1.5, 0.5, 0.5,
-4.038493, -1, -6.384256, 0, -0.5, 0.5, 0.5,
-4.038493, -1, -6.384256, 1, -0.5, 0.5, 0.5,
-4.038493, -1, -6.384256, 1, 1.5, 0.5, 0.5,
-4.038493, -1, -6.384256, 0, 1.5, 0.5, 0.5,
-4.038493, 0, -6.384256, 0, -0.5, 0.5, 0.5,
-4.038493, 0, -6.384256, 1, -0.5, 0.5, 0.5,
-4.038493, 0, -6.384256, 1, 1.5, 0.5, 0.5,
-4.038493, 0, -6.384256, 0, 1.5, 0.5, 0.5,
-4.038493, 1, -6.384256, 0, -0.5, 0.5, 0.5,
-4.038493, 1, -6.384256, 1, -0.5, 0.5, 0.5,
-4.038493, 1, -6.384256, 1, 1.5, 0.5, 0.5,
-4.038493, 1, -6.384256, 0, 1.5, 0.5, 0.5,
-4.038493, 2, -6.384256, 0, -0.5, 0.5, 0.5,
-4.038493, 2, -6.384256, 1, -0.5, 0.5, 0.5,
-4.038493, 2, -6.384256, 1, 1.5, 0.5, 0.5,
-4.038493, 2, -6.384256, 0, 1.5, 0.5, 0.5,
-4.038493, 3, -6.384256, 0, -0.5, 0.5, 0.5,
-4.038493, 3, -6.384256, 1, -0.5, 0.5, 0.5,
-4.038493, 3, -6.384256, 1, 1.5, 0.5, 0.5,
-4.038493, 3, -6.384256, 0, 1.5, 0.5, 0.5
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
-3.531963, -2.992578, -4,
-3.531963, -2.992578, 4,
-3.531963, -2.992578, -4,
-3.700806, -3.153423, -4,
-3.531963, -2.992578, -2,
-3.700806, -3.153423, -2,
-3.531963, -2.992578, 0,
-3.700806, -3.153423, 0,
-3.531963, -2.992578, 2,
-3.700806, -3.153423, 2,
-3.531963, -2.992578, 4,
-3.700806, -3.153423, 4
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
-4.038493, -3.475113, -4, 0, -0.5, 0.5, 0.5,
-4.038493, -3.475113, -4, 1, -0.5, 0.5, 0.5,
-4.038493, -3.475113, -4, 1, 1.5, 0.5, 0.5,
-4.038493, -3.475113, -4, 0, 1.5, 0.5, 0.5,
-4.038493, -3.475113, -2, 0, -0.5, 0.5, 0.5,
-4.038493, -3.475113, -2, 1, -0.5, 0.5, 0.5,
-4.038493, -3.475113, -2, 1, 1.5, 0.5, 0.5,
-4.038493, -3.475113, -2, 0, 1.5, 0.5, 0.5,
-4.038493, -3.475113, 0, 0, -0.5, 0.5, 0.5,
-4.038493, -3.475113, 0, 1, -0.5, 0.5, 0.5,
-4.038493, -3.475113, 0, 1, 1.5, 0.5, 0.5,
-4.038493, -3.475113, 0, 0, 1.5, 0.5, 0.5,
-4.038493, -3.475113, 2, 0, -0.5, 0.5, 0.5,
-4.038493, -3.475113, 2, 1, -0.5, 0.5, 0.5,
-4.038493, -3.475113, 2, 1, 1.5, 0.5, 0.5,
-4.038493, -3.475113, 2, 0, 1.5, 0.5, 0.5,
-4.038493, -3.475113, 4, 0, -0.5, 0.5, 0.5,
-4.038493, -3.475113, 4, 1, -0.5, 0.5, 0.5,
-4.038493, -3.475113, 4, 1, 1.5, 0.5, 0.5,
-4.038493, -3.475113, 4, 0, 1.5, 0.5, 0.5
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
-3.531963, -2.992578, -5.554266,
-3.531963, 3.441217, -5.554266,
-3.531963, -2.992578, 5.51227,
-3.531963, 3.441217, 5.51227,
-3.531963, -2.992578, -5.554266,
-3.531963, -2.992578, 5.51227,
-3.531963, 3.441217, -5.554266,
-3.531963, 3.441217, 5.51227,
-3.531963, -2.992578, -5.554266,
3.221764, -2.992578, -5.554266,
-3.531963, -2.992578, 5.51227,
3.221764, -2.992578, 5.51227,
-3.531963, 3.441217, -5.554266,
3.221764, 3.441217, -5.554266,
-3.531963, 3.441217, 5.51227,
3.221764, 3.441217, 5.51227,
3.221764, -2.992578, -5.554266,
3.221764, 3.441217, -5.554266,
3.221764, -2.992578, 5.51227,
3.221764, 3.441217, 5.51227,
3.221764, -2.992578, -5.554266,
3.221764, -2.992578, 5.51227,
3.221764, 3.441217, -5.554266,
3.221764, 3.441217, 5.51227
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
var radius = 7.728431;
var distance = 34.38466;
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
mvMatrix.translate( 0.1550996, -0.2243193, 0.020998 );
mvMatrix.scale( 1.237262, 1.298787, 0.755081 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38466);
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
ofurace<-read.table("ofurace.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ofurace$V2
```

```
## Error in eval(expr, envir, enclos): object 'ofurace' not found
```

```r
y<-ofurace$V3
```

```
## Error in eval(expr, envir, enclos): object 'ofurace' not found
```

```r
z<-ofurace$V4
```

```
## Error in eval(expr, envir, enclos): object 'ofurace' not found
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
-3.433608, -0.8860418, -2.533509, 0, 0, 1, 1, 1,
-2.785419, -0.9469956, -0.2912275, 1, 0, 0, 1, 1,
-2.764813, -0.1513102, -3.676019, 1, 0, 0, 1, 1,
-2.699355, -0.5166299, -4.07845, 1, 0, 0, 1, 1,
-2.619671, -0.2848853, -0.5834823, 1, 0, 0, 1, 1,
-2.607918, 1.223874, 0.7932023, 1, 0, 0, 1, 1,
-2.521514, -1.822114, -2.008894, 0, 0, 0, 1, 1,
-2.449836, -1.222605, -0.4409553, 0, 0, 0, 1, 1,
-2.423451, -0.4197951, -1.79194, 0, 0, 0, 1, 1,
-2.356926, -0.03411641, -2.639369, 0, 0, 0, 1, 1,
-2.346902, -0.6421167, -2.580705, 0, 0, 0, 1, 1,
-2.314954, 1.007215, -0.8740652, 0, 0, 0, 1, 1,
-2.246408, -0.6635954, -1.881502, 0, 0, 0, 1, 1,
-2.223149, 0.3493675, -1.183616, 1, 1, 1, 1, 1,
-2.218846, -0.149596, -0.6816608, 1, 1, 1, 1, 1,
-2.214222, -1.905254, -2.840205, 1, 1, 1, 1, 1,
-2.129122, -2.314165, -1.410951, 1, 1, 1, 1, 1,
-2.084574, 0.8710875, -2.787973, 1, 1, 1, 1, 1,
-2.044278, -1.056469, -2.486098, 1, 1, 1, 1, 1,
-2.016948, -1.281242, -2.432758, 1, 1, 1, 1, 1,
-1.991129, 1.942406, -0.1254201, 1, 1, 1, 1, 1,
-1.959659, 0.312331, -1.589123, 1, 1, 1, 1, 1,
-1.882538, 1.017189, -0.7390537, 1, 1, 1, 1, 1,
-1.865532, 0.432004, -0.4015043, 1, 1, 1, 1, 1,
-1.846171, 0.757508, -3.045531, 1, 1, 1, 1, 1,
-1.81985, 0.9228997, -1.122156, 1, 1, 1, 1, 1,
-1.816744, 3.258583, -1.457525, 1, 1, 1, 1, 1,
-1.774961, 1.998395, -0.03484823, 1, 1, 1, 1, 1,
-1.762513, 0.3862059, -1.988743, 0, 0, 1, 1, 1,
-1.734066, 0.3885896, -0.2749344, 1, 0, 0, 1, 1,
-1.709733, 0.5839686, -1.531467, 1, 0, 0, 1, 1,
-1.707725, -1.440522, -4.134438, 1, 0, 0, 1, 1,
-1.706399, -1.784629, -2.783493, 1, 0, 0, 1, 1,
-1.700929, 0.5546089, -2.082989, 1, 0, 0, 1, 1,
-1.697978, 1.590554, -0.7967325, 0, 0, 0, 1, 1,
-1.697545, 0.7131417, 0.684213, 0, 0, 0, 1, 1,
-1.679408, -0.1683047, -0.5148863, 0, 0, 0, 1, 1,
-1.674708, -0.1553346, -2.344563, 0, 0, 0, 1, 1,
-1.67403, 0.9645691, -0.402919, 0, 0, 0, 1, 1,
-1.667846, 0.1247982, -2.044169, 0, 0, 0, 1, 1,
-1.666549, -0.326881, -3.011444, 0, 0, 0, 1, 1,
-1.66642, -0.4274143, -0.3475965, 1, 1, 1, 1, 1,
-1.658801, 0.8243034, -1.318581, 1, 1, 1, 1, 1,
-1.651168, -0.5756982, -2.033359, 1, 1, 1, 1, 1,
-1.637756, -1.086848, -2.191724, 1, 1, 1, 1, 1,
-1.626543, -0.1088188, -1.294132, 1, 1, 1, 1, 1,
-1.617889, 0.3297018, -1.798139, 1, 1, 1, 1, 1,
-1.61651, -1.923427, -2.985355, 1, 1, 1, 1, 1,
-1.60552, -0.3015791, -1.745562, 1, 1, 1, 1, 1,
-1.599961, -1.227603, -1.662434, 1, 1, 1, 1, 1,
-1.593539, -0.8113683, -2.164054, 1, 1, 1, 1, 1,
-1.59303, -0.9407392, -3.07733, 1, 1, 1, 1, 1,
-1.584426, 0.4070509, -1.116574, 1, 1, 1, 1, 1,
-1.572128, -0.6874039, -2.536727, 1, 1, 1, 1, 1,
-1.518325, 0.3945676, -2.433138, 1, 1, 1, 1, 1,
-1.510856, -1.107773, -4.466662, 1, 1, 1, 1, 1,
-1.50872, 0.9424762, -1.077805, 0, 0, 1, 1, 1,
-1.504554, -0.7395445, -2.668391, 1, 0, 0, 1, 1,
-1.503007, 0.222165, -1.553491, 1, 0, 0, 1, 1,
-1.500242, 1.770738, -1.439646, 1, 0, 0, 1, 1,
-1.470746, -0.2488824, -1.355409, 1, 0, 0, 1, 1,
-1.449259, 0.9413727, 0.4723403, 1, 0, 0, 1, 1,
-1.445979, 0.8000238, -0.7901869, 0, 0, 0, 1, 1,
-1.441481, -0.08836947, -2.291089, 0, 0, 0, 1, 1,
-1.425003, 0.2746429, -1.168758, 0, 0, 0, 1, 1,
-1.399594, -0.9206755, -3.600735, 0, 0, 0, 1, 1,
-1.39958, 2.665477, -0.5065473, 0, 0, 0, 1, 1,
-1.394102, -0.07573228, -1.869857, 0, 0, 0, 1, 1,
-1.385189, 0.2981556, -1.814009, 0, 0, 0, 1, 1,
-1.37352, 0.494128, -1.946541, 1, 1, 1, 1, 1,
-1.365586, 0.9077601, -0.8088892, 1, 1, 1, 1, 1,
-1.365463, -0.5581622, -1.289694, 1, 1, 1, 1, 1,
-1.363669, -0.4746284, -1.594363, 1, 1, 1, 1, 1,
-1.34848, -1.402162, -1.821034, 1, 1, 1, 1, 1,
-1.346446, -1.26668, -1.678113, 1, 1, 1, 1, 1,
-1.340987, -0.01641454, -0.09735587, 1, 1, 1, 1, 1,
-1.334781, 0.5281215, -1.223422, 1, 1, 1, 1, 1,
-1.328437, 1.56818, -0.3854421, 1, 1, 1, 1, 1,
-1.324679, 1.671849, -0.8599353, 1, 1, 1, 1, 1,
-1.316669, -0.5396368, -1.350116, 1, 1, 1, 1, 1,
-1.304252, -0.3529006, -2.742804, 1, 1, 1, 1, 1,
-1.301327, 0.3727044, -1.71954, 1, 1, 1, 1, 1,
-1.30126, -2.482645, -2.29362, 1, 1, 1, 1, 1,
-1.300683, 1.226912, -0.5209333, 1, 1, 1, 1, 1,
-1.295238, 3.333934, -0.09410602, 0, 0, 1, 1, 1,
-1.279973, 0.9497871, -0.4537807, 1, 0, 0, 1, 1,
-1.27598, -0.9800383, -4.085181, 1, 0, 0, 1, 1,
-1.271664, -1.733298, -1.30934, 1, 0, 0, 1, 1,
-1.270879, -0.4987003, -1.191872, 1, 0, 0, 1, 1,
-1.260764, -1.323615, -2.165493, 1, 0, 0, 1, 1,
-1.254514, -1.330468, -2.769767, 0, 0, 0, 1, 1,
-1.253602, -0.05105053, -0.437205, 0, 0, 0, 1, 1,
-1.252834, -0.3246428, -0.6826271, 0, 0, 0, 1, 1,
-1.250858, 0.1866007, -1.833217, 0, 0, 0, 1, 1,
-1.24638, -0.3226766, -1.96615, 0, 0, 0, 1, 1,
-1.232358, 0.3898749, -0.7524269, 0, 0, 0, 1, 1,
-1.231095, 0.4963296, -1.015492, 0, 0, 0, 1, 1,
-1.225164, 0.05156562, -2.930667, 1, 1, 1, 1, 1,
-1.222557, 0.2042197, -0.3059053, 1, 1, 1, 1, 1,
-1.216329, 0.05614075, -0.9593433, 1, 1, 1, 1, 1,
-1.215156, 0.8565288, 0.1900849, 1, 1, 1, 1, 1,
-1.207322, -0.09301859, -2.347678, 1, 1, 1, 1, 1,
-1.206846, 1.047564, -0.1365296, 1, 1, 1, 1, 1,
-1.201082, -0.1750217, -2.454026, 1, 1, 1, 1, 1,
-1.200457, 0.1679168, -0.1264333, 1, 1, 1, 1, 1,
-1.198131, 1.616542, -1.541444, 1, 1, 1, 1, 1,
-1.192303, 1.240122, 0.691766, 1, 1, 1, 1, 1,
-1.190973, 1.478011, 0.07001923, 1, 1, 1, 1, 1,
-1.190437, -0.005204822, -2.14763, 1, 1, 1, 1, 1,
-1.186641, 1.624453, -1.750883, 1, 1, 1, 1, 1,
-1.184378, 0.7524825, -0.9643841, 1, 1, 1, 1, 1,
-1.184278, -0.7674477, -3.387247, 1, 1, 1, 1, 1,
-1.175899, -0.9373787, -1.874808, 0, 0, 1, 1, 1,
-1.171817, 0.9150488, -0.06060725, 1, 0, 0, 1, 1,
-1.170506, -2.74774, -3.16234, 1, 0, 0, 1, 1,
-1.158866, -0.9082184, -2.234682, 1, 0, 0, 1, 1,
-1.154454, -0.4488168, -1.878781, 1, 0, 0, 1, 1,
-1.15251, -1.543796, -3.604931, 1, 0, 0, 1, 1,
-1.15002, 0.01097596, -0.06989149, 0, 0, 0, 1, 1,
-1.147171, -0.4826186, -1.417676, 0, 0, 0, 1, 1,
-1.142834, -1.187733, -1.816038, 0, 0, 0, 1, 1,
-1.141229, -1.117799, -2.889886, 0, 0, 0, 1, 1,
-1.131918, -1.436162, -3.598516, 0, 0, 0, 1, 1,
-1.127192, -0.5053638, -1.49909, 0, 0, 0, 1, 1,
-1.126586, -1.351336, -3.36617, 0, 0, 0, 1, 1,
-1.125125, -0.8960286, -3.458778, 1, 1, 1, 1, 1,
-1.123841, 0.8040784, -0.3403737, 1, 1, 1, 1, 1,
-1.123107, -0.945221, -3.111594, 1, 1, 1, 1, 1,
-1.121738, 1.316938, -1.454612, 1, 1, 1, 1, 1,
-1.111378, 0.2615062, -1.806301, 1, 1, 1, 1, 1,
-1.103877, -1.501206, -3.407217, 1, 1, 1, 1, 1,
-1.096102, -1.615656, -2.256214, 1, 1, 1, 1, 1,
-1.095874, 0.979683, -1.786373, 1, 1, 1, 1, 1,
-1.085651, 0.2299679, -0.4352723, 1, 1, 1, 1, 1,
-1.082711, -0.03834729, -1.054655, 1, 1, 1, 1, 1,
-1.077135, -1.345452, -2.391585, 1, 1, 1, 1, 1,
-1.075916, -0.9834925, -2.298573, 1, 1, 1, 1, 1,
-1.073132, -0.7924643, -2.613743, 1, 1, 1, 1, 1,
-1.072379, -1.039994, -1.889572, 1, 1, 1, 1, 1,
-1.0689, -0.4289575, -2.372656, 1, 1, 1, 1, 1,
-1.064115, 1.644926, 0.2044884, 0, 0, 1, 1, 1,
-1.063839, 1.287623, -1.245332, 1, 0, 0, 1, 1,
-1.042637, 0.2016028, -1.886691, 1, 0, 0, 1, 1,
-1.040108, 0.6666202, -0.9919181, 1, 0, 0, 1, 1,
-1.035568, 1.969786, -0.7000765, 1, 0, 0, 1, 1,
-1.031409, 1.054948, 0.1886366, 1, 0, 0, 1, 1,
-1.031222, -0.01505669, -2.461655, 0, 0, 0, 1, 1,
-1.031079, 0.06311585, -1.256464, 0, 0, 0, 1, 1,
-1.028967, -0.2581086, -4.160549, 0, 0, 0, 1, 1,
-1.027054, 1.103365, -1.042427, 0, 0, 0, 1, 1,
-1.024007, 2.187663, 0.07093387, 0, 0, 0, 1, 1,
-1.018958, 0.08267844, -1.597956, 0, 0, 0, 1, 1,
-1.005523, -0.5378192, -0.1962723, 0, 0, 0, 1, 1,
-1.004302, 0.2821583, -0.6260477, 1, 1, 1, 1, 1,
-0.9998737, 2.028179, 2.299962, 1, 1, 1, 1, 1,
-0.9986254, 0.1883832, -0.7731265, 1, 1, 1, 1, 1,
-0.9947844, -0.8256695, -2.756359, 1, 1, 1, 1, 1,
-0.9945627, 0.1915749, -1.469214, 1, 1, 1, 1, 1,
-0.9889397, -1.360452, -2.944186, 1, 1, 1, 1, 1,
-0.9855568, -1.27879, -3.730277, 1, 1, 1, 1, 1,
-0.9828374, -1.258345, -3.401274, 1, 1, 1, 1, 1,
-0.9765211, -1.476036, -2.563884, 1, 1, 1, 1, 1,
-0.9713186, 0.4635004, -0.6545421, 1, 1, 1, 1, 1,
-0.9687061, 0.5290775, -1.554924, 1, 1, 1, 1, 1,
-0.9671105, -1.836852, -2.370343, 1, 1, 1, 1, 1,
-0.9669245, -0.9218109, -1.663006, 1, 1, 1, 1, 1,
-0.9658633, -1.242273, -4.097456, 1, 1, 1, 1, 1,
-0.9643062, 0.6346146, -1.210754, 1, 1, 1, 1, 1,
-0.9590517, 0.6172631, 1.013239, 0, 0, 1, 1, 1,
-0.955192, -1.217465, -1.658026, 1, 0, 0, 1, 1,
-0.9490504, 0.6814004, -1.613884, 1, 0, 0, 1, 1,
-0.9485431, -1.168818, -0.9025859, 1, 0, 0, 1, 1,
-0.9478992, -1.476987, -3.114531, 1, 0, 0, 1, 1,
-0.947537, -0.8792595, -1.908845, 1, 0, 0, 1, 1,
-0.9421828, 0.8427828, 0.03839122, 0, 0, 0, 1, 1,
-0.9387315, -2.233486, -3.116758, 0, 0, 0, 1, 1,
-0.9342406, -2.314081, -2.907727, 0, 0, 0, 1, 1,
-0.9256744, 0.3266153, -2.541724, 0, 0, 0, 1, 1,
-0.9184825, -1.417138, -2.364473, 0, 0, 0, 1, 1,
-0.9173681, -1.598582, -2.427164, 0, 0, 0, 1, 1,
-0.9152237, 0.5014763, -0.06541004, 0, 0, 0, 1, 1,
-0.9137692, -1.206157, -1.218496, 1, 1, 1, 1, 1,
-0.8985754, 1.208316, 0.3414475, 1, 1, 1, 1, 1,
-0.8971256, -1.736361, -3.060075, 1, 1, 1, 1, 1,
-0.8951866, 0.7469988, -1.246949, 1, 1, 1, 1, 1,
-0.8902308, 1.64863, -0.4297464, 1, 1, 1, 1, 1,
-0.8843309, 0.3515641, -1.646783, 1, 1, 1, 1, 1,
-0.8830501, -0.3448808, -1.378219, 1, 1, 1, 1, 1,
-0.8815349, 0.9575284, -1.273785, 1, 1, 1, 1, 1,
-0.8811445, 2.205838, -1.045451, 1, 1, 1, 1, 1,
-0.8808529, 0.1679071, -3.615344, 1, 1, 1, 1, 1,
-0.8790311, 0.5807415, -2.967094, 1, 1, 1, 1, 1,
-0.8744631, 0.3669975, 0.1016183, 1, 1, 1, 1, 1,
-0.8699429, -2.126014, -3.588989, 1, 1, 1, 1, 1,
-0.8683252, 0.3896006, -1.408062, 1, 1, 1, 1, 1,
-0.8663244, 0.7340811, -1.029528, 1, 1, 1, 1, 1,
-0.8651708, 0.8722933, -1.08429, 0, 0, 1, 1, 1,
-0.8641126, 0.577786, 0.1967484, 1, 0, 0, 1, 1,
-0.8532861, -1.247879, -3.993631, 1, 0, 0, 1, 1,
-0.8488371, 0.3564587, -1.511862, 1, 0, 0, 1, 1,
-0.8379517, -0.3936438, -2.361589, 1, 0, 0, 1, 1,
-0.8373336, -0.06602661, -2.036481, 1, 0, 0, 1, 1,
-0.8359438, -0.1700408, -1.348799, 0, 0, 0, 1, 1,
-0.8325423, -1.527657, -3.446939, 0, 0, 0, 1, 1,
-0.8286616, -1.084714, -3.049729, 0, 0, 0, 1, 1,
-0.8186995, 0.1477378, -1.480832, 0, 0, 0, 1, 1,
-0.8171943, 0.06104205, -2.948698, 0, 0, 0, 1, 1,
-0.8165816, -0.6866564, -1.838966, 0, 0, 0, 1, 1,
-0.8138301, 0.5997715, 0.6598924, 0, 0, 0, 1, 1,
-0.8135715, 0.06068919, 0.2569599, 1, 1, 1, 1, 1,
-0.809622, -0.4676735, -2.082851, 1, 1, 1, 1, 1,
-0.8038135, -1.556076, -2.874016, 1, 1, 1, 1, 1,
-0.7984225, -0.3124273, -3.561988, 1, 1, 1, 1, 1,
-0.7978686, 0.4714493, 0.18611, 1, 1, 1, 1, 1,
-0.7907756, -1.462448, -3.66407, 1, 1, 1, 1, 1,
-0.7857525, 0.6682149, 0.3591471, 1, 1, 1, 1, 1,
-0.7819283, 0.5881575, 0.189228, 1, 1, 1, 1, 1,
-0.7750703, -0.6819242, -2.812055, 1, 1, 1, 1, 1,
-0.7750061, 0.5593921, -0.230676, 1, 1, 1, 1, 1,
-0.7737745, 1.184394, -0.954768, 1, 1, 1, 1, 1,
-0.7711594, 0.4303753, -2.401182, 1, 1, 1, 1, 1,
-0.7707661, -0.1234526, -1.743796, 1, 1, 1, 1, 1,
-0.7701714, -0.8155375, -3.226652, 1, 1, 1, 1, 1,
-0.769129, 0.0979531, -1.600599, 1, 1, 1, 1, 1,
-0.7688898, -0.03386674, -0.935647, 0, 0, 1, 1, 1,
-0.755583, 0.4385942, -1.581977, 1, 0, 0, 1, 1,
-0.7504125, 0.5672529, -1.581892, 1, 0, 0, 1, 1,
-0.7426979, 0.3388938, -1.399165, 1, 0, 0, 1, 1,
-0.7399673, 0.5967757, -2.098202, 1, 0, 0, 1, 1,
-0.7370716, 0.6385159, 1.083646, 1, 0, 0, 1, 1,
-0.7332921, -1.331156, -2.121664, 0, 0, 0, 1, 1,
-0.7312638, -1.823678, -3.937657, 0, 0, 0, 1, 1,
-0.7269908, 0.9611484, 1.056579, 0, 0, 0, 1, 1,
-0.7244825, -0.4560466, -1.187064, 0, 0, 0, 1, 1,
-0.7241846, 0.03751179, -0.6108868, 0, 0, 0, 1, 1,
-0.7199648, -1.023602, -1.739517, 0, 0, 0, 1, 1,
-0.7181947, 0.7151861, 0.1427045, 0, 0, 0, 1, 1,
-0.7180874, 0.3795583, -2.657294, 1, 1, 1, 1, 1,
-0.7121766, -2.076142, -3.964537, 1, 1, 1, 1, 1,
-0.7101792, -0.7241126, -1.988675, 1, 1, 1, 1, 1,
-0.7079201, 1.125116, -0.7686329, 1, 1, 1, 1, 1,
-0.7068291, -0.3368983, -2.401085, 1, 1, 1, 1, 1,
-0.7053165, -0.6469791, -1.146613, 1, 1, 1, 1, 1,
-0.7008297, 1.676222, 0.6511281, 1, 1, 1, 1, 1,
-0.7007878, -0.5919675, -1.371198, 1, 1, 1, 1, 1,
-0.7001223, 1.201455, -0.6756428, 1, 1, 1, 1, 1,
-0.7000582, 2.291647, -1.343729, 1, 1, 1, 1, 1,
-0.6939976, 0.4166698, -1.227386, 1, 1, 1, 1, 1,
-0.6917548, -1.956687, -2.412177, 1, 1, 1, 1, 1,
-0.6916312, 0.4278713, -0.9138625, 1, 1, 1, 1, 1,
-0.6891188, -1.333252, -1.05829, 1, 1, 1, 1, 1,
-0.6870759, -0.7241524, -2.166432, 1, 1, 1, 1, 1,
-0.6854106, 1.378887, 0.871443, 0, 0, 1, 1, 1,
-0.684242, -2.39245, -4.201569, 1, 0, 0, 1, 1,
-0.684127, -2.268445, -0.08597321, 1, 0, 0, 1, 1,
-0.6839098, -0.2396813, -2.067342, 1, 0, 0, 1, 1,
-0.6807549, -0.4837041, -3.431584, 1, 0, 0, 1, 1,
-0.6769843, 1.877345, -0.681441, 1, 0, 0, 1, 1,
-0.676032, -0.7666489, -2.670553, 0, 0, 0, 1, 1,
-0.6708162, 0.4933584, -1.210659, 0, 0, 0, 1, 1,
-0.6702685, -0.9786384, -3.284326, 0, 0, 0, 1, 1,
-0.6689261, -0.4154263, -1.888388, 0, 0, 0, 1, 1,
-0.6686879, -0.161808, -0.2945425, 0, 0, 0, 1, 1,
-0.6670278, -0.03185746, -2.242548, 0, 0, 0, 1, 1,
-0.6668712, 0.2117562, 0.1087778, 0, 0, 0, 1, 1,
-0.6605789, 0.4039719, -1.106123, 1, 1, 1, 1, 1,
-0.660102, -0.5286383, -0.9261117, 1, 1, 1, 1, 1,
-0.6566417, -1.52591, -5.393103, 1, 1, 1, 1, 1,
-0.6554922, -1.0851, -3.547124, 1, 1, 1, 1, 1,
-0.6530734, 0.02490286, -2.739244, 1, 1, 1, 1, 1,
-0.6526965, -0.15152, -1.447201, 1, 1, 1, 1, 1,
-0.6501657, -0.2097349, -2.249814, 1, 1, 1, 1, 1,
-0.6119621, 0.4068096, -2.261703, 1, 1, 1, 1, 1,
-0.6115099, -0.05209144, -2.073171, 1, 1, 1, 1, 1,
-0.6106042, -0.04819059, -2.478542, 1, 1, 1, 1, 1,
-0.6069486, -0.2668715, -3.552384, 1, 1, 1, 1, 1,
-0.6069112, 0.9710463, 1.930053, 1, 1, 1, 1, 1,
-0.6053768, 0.1204723, -3.181199, 1, 1, 1, 1, 1,
-0.5988564, 0.8943263, -1.349725, 1, 1, 1, 1, 1,
-0.5959346, 1.099482, -0.6830064, 1, 1, 1, 1, 1,
-0.5895274, -0.09801892, -1.6506, 0, 0, 1, 1, 1,
-0.5891681, 0.1160683, -2.483916, 1, 0, 0, 1, 1,
-0.585102, 0.3154332, -1.692069, 1, 0, 0, 1, 1,
-0.5840722, 1.1842, -0.5134122, 1, 0, 0, 1, 1,
-0.5831395, 1.950766, -0.07387609, 1, 0, 0, 1, 1,
-0.5823207, 0.7714543, -0.6988346, 1, 0, 0, 1, 1,
-0.5802375, -0.857026, -4.281019, 0, 0, 0, 1, 1,
-0.5723466, 0.291777, -0.3483432, 0, 0, 0, 1, 1,
-0.5713718, 0.04290874, -2.45324, 0, 0, 0, 1, 1,
-0.570231, 1.470468, 0.3805937, 0, 0, 0, 1, 1,
-0.5688135, -1.181408, -1.800428, 0, 0, 0, 1, 1,
-0.5677121, 0.9677906, -0.1115521, 0, 0, 0, 1, 1,
-0.5673087, -0.8868753, -2.036623, 0, 0, 0, 1, 1,
-0.5657888, -0.3490297, -2.598676, 1, 1, 1, 1, 1,
-0.5553657, -0.8135579, -1.813899, 1, 1, 1, 1, 1,
-0.5547727, 0.08810919, 0.4799365, 1, 1, 1, 1, 1,
-0.5509882, -0.5420303, -2.265393, 1, 1, 1, 1, 1,
-0.5494322, -1.387591, -2.903041, 1, 1, 1, 1, 1,
-0.5469232, 0.7123262, -0.6762968, 1, 1, 1, 1, 1,
-0.5459125, 0.7610219, -0.6001992, 1, 1, 1, 1, 1,
-0.536823, -1.342425, -3.391989, 1, 1, 1, 1, 1,
-0.5353131, 0.4077481, -1.761092, 1, 1, 1, 1, 1,
-0.5350039, 0.6013463, -1.346537, 1, 1, 1, 1, 1,
-0.5332901, -1.229856, -2.083521, 1, 1, 1, 1, 1,
-0.5225185, 1.780943, 0.3956853, 1, 1, 1, 1, 1,
-0.5204746, 0.5679872, 0.3911903, 1, 1, 1, 1, 1,
-0.5199869, 0.3174867, -0.6542631, 1, 1, 1, 1, 1,
-0.518349, 0.2171988, -1.411495, 1, 1, 1, 1, 1,
-0.5182537, 2.028637, -0.44271, 0, 0, 1, 1, 1,
-0.5177419, 0.9001938, 0.706758, 1, 0, 0, 1, 1,
-0.5168912, -1.182104, -3.234158, 1, 0, 0, 1, 1,
-0.5134605, 0.0871683, -3.391344, 1, 0, 0, 1, 1,
-0.5074939, 0.8497046, -0.8538052, 1, 0, 0, 1, 1,
-0.5058014, -0.7725551, -2.823024, 1, 0, 0, 1, 1,
-0.5000677, -0.6052572, -3.426706, 0, 0, 0, 1, 1,
-0.4998056, 0.4731778, -1.803329, 0, 0, 0, 1, 1,
-0.4989126, 0.5057244, -0.689496, 0, 0, 0, 1, 1,
-0.4965792, -0.4106327, -1.650355, 0, 0, 0, 1, 1,
-0.4956852, -0.2497203, -0.722365, 0, 0, 0, 1, 1,
-0.4948964, 2.25637, -2.089396, 0, 0, 0, 1, 1,
-0.4939122, 0.1141625, -1.949445, 0, 0, 0, 1, 1,
-0.4889844, 0.1472882, -3.001787, 1, 1, 1, 1, 1,
-0.4868198, -0.6164016, -2.822417, 1, 1, 1, 1, 1,
-0.4866378, 1.379301, -2.000626, 1, 1, 1, 1, 1,
-0.4856797, 0.2495349, -0.6490524, 1, 1, 1, 1, 1,
-0.4809292, 0.06393436, -1.246022, 1, 1, 1, 1, 1,
-0.4788271, 1.439133, -1.832704, 1, 1, 1, 1, 1,
-0.4725754, -1.234495, -3.479303, 1, 1, 1, 1, 1,
-0.4699461, -0.8187022, -2.996855, 1, 1, 1, 1, 1,
-0.468017, 0.1047821, -0.3581297, 1, 1, 1, 1, 1,
-0.4675325, -1.296848, -2.895672, 1, 1, 1, 1, 1,
-0.4666216, 0.004403142, -1.438233, 1, 1, 1, 1, 1,
-0.4618599, -0.7714925, -3.594486, 1, 1, 1, 1, 1,
-0.4580031, -0.515024, -1.24957, 1, 1, 1, 1, 1,
-0.4522541, 0.8398867, 0.05119614, 1, 1, 1, 1, 1,
-0.4508099, 1.259497, 0.3936392, 1, 1, 1, 1, 1,
-0.4473872, 0.7038694, -0.4443191, 0, 0, 1, 1, 1,
-0.4473463, 0.5453394, 0.4344749, 1, 0, 0, 1, 1,
-0.4453536, 0.7560817, -2.371196, 1, 0, 0, 1, 1,
-0.4432358, -0.7477616, -0.4366788, 1, 0, 0, 1, 1,
-0.4373249, -0.02330471, -1.570892, 1, 0, 0, 1, 1,
-0.4371794, 0.04789472, -1.851942, 1, 0, 0, 1, 1,
-0.4356515, -2.874166, -3.505344, 0, 0, 0, 1, 1,
-0.428346, -0.1975708, -2.397041, 0, 0, 0, 1, 1,
-0.4281271, -1.501082, -3.485413, 0, 0, 0, 1, 1,
-0.4271389, -0.09138428, -2.460283, 0, 0, 0, 1, 1,
-0.4240845, 1.101424, 0.3285035, 0, 0, 0, 1, 1,
-0.4134622, -1.674791, -1.928798, 0, 0, 0, 1, 1,
-0.4080677, -0.3024802, -2.470629, 0, 0, 0, 1, 1,
-0.4068917, -0.5254604, -5.303085, 1, 1, 1, 1, 1,
-0.4062515, -1.608583, -4.149251, 1, 1, 1, 1, 1,
-0.4030546, 1.415764, 0.05620785, 1, 1, 1, 1, 1,
-0.4014288, -1.033518, -2.540348, 1, 1, 1, 1, 1,
-0.3990285, 1.789473, -1.740933, 1, 1, 1, 1, 1,
-0.3990245, 0.5516559, -1.860645, 1, 1, 1, 1, 1,
-0.3989177, -0.9217101, -1.989854, 1, 1, 1, 1, 1,
-0.3970645, -1.624671, -1.793198, 1, 1, 1, 1, 1,
-0.396532, -1.20935, -1.821984, 1, 1, 1, 1, 1,
-0.3945856, 1.041174, 0.6727458, 1, 1, 1, 1, 1,
-0.3938951, -0.3038982, -0.7327828, 1, 1, 1, 1, 1,
-0.3892638, 0.3530301, -1.261074, 1, 1, 1, 1, 1,
-0.3888893, -0.3956709, -1.738536, 1, 1, 1, 1, 1,
-0.3847207, 1.079411, -0.03813348, 1, 1, 1, 1, 1,
-0.3745274, 0.08927564, -1.681921, 1, 1, 1, 1, 1,
-0.3717273, -0.7911016, -2.246313, 0, 0, 1, 1, 1,
-0.3703987, -1.025465, -1.865808, 1, 0, 0, 1, 1,
-0.369899, -0.0394818, -1.484572, 1, 0, 0, 1, 1,
-0.3695471, 0.02131242, -2.380341, 1, 0, 0, 1, 1,
-0.3652681, -0.3219125, -3.714709, 1, 0, 0, 1, 1,
-0.359832, 0.1884561, -1.332316, 1, 0, 0, 1, 1,
-0.3596944, -1.301007, -2.094876, 0, 0, 0, 1, 1,
-0.3594182, 0.02036536, -1.329316, 0, 0, 0, 1, 1,
-0.3591719, 1.409132, 0.6952896, 0, 0, 0, 1, 1,
-0.3569949, -0.05057568, -2.518408, 0, 0, 0, 1, 1,
-0.3470218, 0.7925132, 0.3439662, 0, 0, 0, 1, 1,
-0.3466914, 0.04792127, -1.244918, 0, 0, 0, 1, 1,
-0.3449813, -0.9115156, -2.008338, 0, 0, 0, 1, 1,
-0.3419852, 0.2604233, -0.7679214, 1, 1, 1, 1, 1,
-0.3363073, -0.1344263, -3.095454, 1, 1, 1, 1, 1,
-0.3326818, 0.5276433, -0.7423739, 1, 1, 1, 1, 1,
-0.3322177, -0.5802013, -3.671435, 1, 1, 1, 1, 1,
-0.3308704, -0.4013399, -2.611524, 1, 1, 1, 1, 1,
-0.3137311, -0.6770054, -1.980256, 1, 1, 1, 1, 1,
-0.3081682, 0.216438, -1.710049, 1, 1, 1, 1, 1,
-0.3068771, 1.243678, -1.185985, 1, 1, 1, 1, 1,
-0.3056676, 0.3214932, 0.4060565, 1, 1, 1, 1, 1,
-0.2976276, 0.9147081, 0.7280245, 1, 1, 1, 1, 1,
-0.2846227, -0.005285032, -1.988772, 1, 1, 1, 1, 1,
-0.2842427, -0.1194585, -2.557582, 1, 1, 1, 1, 1,
-0.2769169, -0.9372033, -3.684896, 1, 1, 1, 1, 1,
-0.2752516, 0.522684, -0.4218537, 1, 1, 1, 1, 1,
-0.2744164, 0.9998226, -0.7901671, 1, 1, 1, 1, 1,
-0.2718823, -1.042031, -2.342433, 0, 0, 1, 1, 1,
-0.2710711, -1.810369, -2.875352, 1, 0, 0, 1, 1,
-0.2676002, 0.7406393, -0.3813765, 1, 0, 0, 1, 1,
-0.2634377, 0.9107493, 0.4681059, 1, 0, 0, 1, 1,
-0.261318, -0.9807737, -3.012681, 1, 0, 0, 1, 1,
-0.2593187, 0.1067757, -1.761801, 1, 0, 0, 1, 1,
-0.2588956, 0.6537137, -1.585318, 0, 0, 0, 1, 1,
-0.258329, -0.1648385, -3.557051, 0, 0, 0, 1, 1,
-0.2544151, -0.7410614, -3.875076, 0, 0, 0, 1, 1,
-0.2533759, 0.07158683, -1.193368, 0, 0, 0, 1, 1,
-0.2471558, 1.128463, 1.2083, 0, 0, 0, 1, 1,
-0.2450637, 0.6621561, -0.09290043, 0, 0, 0, 1, 1,
-0.2433242, 1.327488, -0.1907812, 0, 0, 0, 1, 1,
-0.2432995, 0.4058683, 0.3047375, 1, 1, 1, 1, 1,
-0.2388653, 0.8863297, 0.7904233, 1, 1, 1, 1, 1,
-0.2215861, -0.8208015, -4.844689, 1, 1, 1, 1, 1,
-0.2201638, 0.6257306, -0.5261092, 1, 1, 1, 1, 1,
-0.2171877, 0.06586225, -0.8236743, 1, 1, 1, 1, 1,
-0.2116187, 0.49141, -0.5351105, 1, 1, 1, 1, 1,
-0.211235, -0.7294495, -2.29945, 1, 1, 1, 1, 1,
-0.2099216, -0.4965004, -0.6231595, 1, 1, 1, 1, 1,
-0.2098809, -0.1531487, -3.669186, 1, 1, 1, 1, 1,
-0.2092564, 2.103557, 2.364986, 1, 1, 1, 1, 1,
-0.2046289, -0.3902866, -3.748326, 1, 1, 1, 1, 1,
-0.2022458, 0.9537591, -1.740865, 1, 1, 1, 1, 1,
-0.1991678, -0.9456788, -3.049538, 1, 1, 1, 1, 1,
-0.1952614, -0.5839499, -1.922058, 1, 1, 1, 1, 1,
-0.1901748, -2.063524, -3.451246, 1, 1, 1, 1, 1,
-0.1901253, 0.8609036, -0.4943479, 0, 0, 1, 1, 1,
-0.1873478, -1.540265, -3.476928, 1, 0, 0, 1, 1,
-0.1820307, -0.814467, -4.096877, 1, 0, 0, 1, 1,
-0.175909, -0.06916948, -0.4380124, 1, 0, 0, 1, 1,
-0.1741377, -0.591491, -3.430014, 1, 0, 0, 1, 1,
-0.1701234, -0.7644349, -2.544899, 1, 0, 0, 1, 1,
-0.1656945, 0.2935796, 0.5237234, 0, 0, 0, 1, 1,
-0.16341, -1.127242, -2.941972, 0, 0, 0, 1, 1,
-0.1631446, -0.662469, -3.559532, 0, 0, 0, 1, 1,
-0.1607759, 0.4959981, -0.5306712, 0, 0, 0, 1, 1,
-0.1570967, -1.052325, -3.281409, 0, 0, 0, 1, 1,
-0.1557476, -0.2630378, -3.21736, 0, 0, 0, 1, 1,
-0.1511632, 1.423513, -0.02362868, 0, 0, 0, 1, 1,
-0.1507904, -0.1053389, -1.361805, 1, 1, 1, 1, 1,
-0.1504102, -0.3113438, -2.980121, 1, 1, 1, 1, 1,
-0.1503886, 0.570663, -0.1276762, 1, 1, 1, 1, 1,
-0.145432, 0.2265631, -1.058836, 1, 1, 1, 1, 1,
-0.1415473, -0.265031, -2.81021, 1, 1, 1, 1, 1,
-0.1382094, -2.131727, -2.934475, 1, 1, 1, 1, 1,
-0.1339522, -0.0259325, -2.208983, 1, 1, 1, 1, 1,
-0.1198814, 0.1665853, -0.9283956, 1, 1, 1, 1, 1,
-0.1167, -0.9908516, -3.520708, 1, 1, 1, 1, 1,
-0.1149994, 0.5707167, -0.4437209, 1, 1, 1, 1, 1,
-0.1109264, 0.5063732, 2.275175, 1, 1, 1, 1, 1,
-0.1098364, 0.3969077, 0.4034932, 1, 1, 1, 1, 1,
-0.1014049, -0.7263407, -2.899725, 1, 1, 1, 1, 1,
-0.09672599, -1.358551, -3.139519, 1, 1, 1, 1, 1,
-0.0953291, 0.1739304, -0.50305, 1, 1, 1, 1, 1,
-0.09467244, 1.490589, 0.3292538, 0, 0, 1, 1, 1,
-0.09366257, -1.344462, -3.706025, 1, 0, 0, 1, 1,
-0.09153528, 0.6663282, -0.4277332, 1, 0, 0, 1, 1,
-0.09016363, 0.375222, 0.2419921, 1, 0, 0, 1, 1,
-0.08982162, -1.528287, -4.877571, 1, 0, 0, 1, 1,
-0.08915162, -1.270521, -1.666879, 1, 0, 0, 1, 1,
-0.08893269, -0.08043531, -3.801247, 0, 0, 0, 1, 1,
-0.08693794, -0.7507582, -2.283401, 0, 0, 0, 1, 1,
-0.08671091, 0.6645556, -0.2731187, 0, 0, 0, 1, 1,
-0.0855173, -1.645581, -2.162018, 0, 0, 0, 1, 1,
-0.08386452, 0.7069595, -0.7134476, 0, 0, 0, 1, 1,
-0.08295265, -1.860556, -2.137912, 0, 0, 0, 1, 1,
-0.07970351, -0.3234626, -2.808909, 0, 0, 0, 1, 1,
-0.07526416, 0.378792, -0.527529, 1, 1, 1, 1, 1,
-0.07487866, -0.5899779, -3.045318, 1, 1, 1, 1, 1,
-0.07398657, -0.4543782, -3.414691, 1, 1, 1, 1, 1,
-0.07328793, -0.044652, -0.817061, 1, 1, 1, 1, 1,
-0.06713844, 0.1896816, 0.7826298, 1, 1, 1, 1, 1,
-0.06514626, 0.3197186, 0.06867228, 1, 1, 1, 1, 1,
-0.05980025, -0.6555852, -4.540482, 1, 1, 1, 1, 1,
-0.05516585, 1.328161, -0.6366625, 1, 1, 1, 1, 1,
-0.05223921, 0.3962316, -0.5510669, 1, 1, 1, 1, 1,
-0.05197638, -0.8047012, -2.780287, 1, 1, 1, 1, 1,
-0.04868965, 1.080127, -0.0904148, 1, 1, 1, 1, 1,
-0.04768154, 1.181764, -0.9598037, 1, 1, 1, 1, 1,
-0.04290247, 0.588637, 0.3419105, 1, 1, 1, 1, 1,
-0.04226362, -1.219507, -3.03816, 1, 1, 1, 1, 1,
-0.04213063, 0.9560267, -1.66352, 1, 1, 1, 1, 1,
-0.04106738, -1.25402, -1.861854, 0, 0, 1, 1, 1,
-0.03952233, 0.3676897, -1.626478, 1, 0, 0, 1, 1,
-0.03944707, 0.09183881, 0.03160059, 1, 0, 0, 1, 1,
-0.03533564, -1.083718, -2.909156, 1, 0, 0, 1, 1,
-0.03525585, 0.2117794, -0.5346038, 1, 0, 0, 1, 1,
-0.03340488, 1.134285, -0.1159023, 1, 0, 0, 1, 1,
-0.03174483, 0.08449774, -0.7717035, 0, 0, 0, 1, 1,
-0.03110254, -1.526612, -3.716671, 0, 0, 0, 1, 1,
-0.02374516, -0.3461804, -3.872625, 0, 0, 0, 1, 1,
-0.02236412, -2.118138, -2.110653, 0, 0, 0, 1, 1,
-0.02233609, 0.2606082, 0.462141, 0, 0, 0, 1, 1,
-0.02219227, -0.3507293, -2.188386, 0, 0, 0, 1, 1,
-0.01064079, 1.000751, 0.2279933, 0, 0, 0, 1, 1,
-0.001052662, 1.829164, -1.324731, 1, 1, 1, 1, 1,
-0.0009151433, -1.547126, -3.321091, 1, 1, 1, 1, 1,
0.0002027982, -0.1197939, 3.174652, 1, 1, 1, 1, 1,
0.001129537, -0.1591096, 2.674314, 1, 1, 1, 1, 1,
0.003407879, -0.3959177, 2.198071, 1, 1, 1, 1, 1,
0.004439352, 0.27369, 0.2935818, 1, 1, 1, 1, 1,
0.00745527, -1.835201, 2.867856, 1, 1, 1, 1, 1,
0.01033766, -0.3362588, 2.111745, 1, 1, 1, 1, 1,
0.01203239, -0.09283467, 3.443598, 1, 1, 1, 1, 1,
0.01381693, 0.3826092, 0.304449, 1, 1, 1, 1, 1,
0.01503054, 0.4501808, -1.100655, 1, 1, 1, 1, 1,
0.02050464, -0.566088, 2.326036, 1, 1, 1, 1, 1,
0.02398751, 0.4294936, -1.165727, 1, 1, 1, 1, 1,
0.02565233, 1.209553, -0.1168988, 1, 1, 1, 1, 1,
0.02741326, -0.5492914, 1.055682, 1, 1, 1, 1, 1,
0.02850944, 0.6884006, 1.002259, 0, 0, 1, 1, 1,
0.03456514, -0.05538348, 3.433309, 1, 0, 0, 1, 1,
0.03635866, -1.094554, 1.516163, 1, 0, 0, 1, 1,
0.03820159, 0.4212337, -1.109519, 1, 0, 0, 1, 1,
0.03829042, 0.01861314, 0.859056, 1, 0, 0, 1, 1,
0.03840747, -1.428267, 1.610981, 1, 0, 0, 1, 1,
0.03918967, -0.2750582, 4.119663, 0, 0, 0, 1, 1,
0.03965153, 1.480746, 1.037979, 0, 0, 0, 1, 1,
0.03971732, -0.6113545, 4.562387, 0, 0, 0, 1, 1,
0.04335877, 0.2041537, -0.2098639, 0, 0, 0, 1, 1,
0.04591595, -0.3763064, 4.96256, 0, 0, 0, 1, 1,
0.04838387, -0.3047897, 4.320357, 0, 0, 0, 1, 1,
0.04907175, 1.363599, 1.223065, 0, 0, 0, 1, 1,
0.05295112, 0.5656655, -0.7638276, 1, 1, 1, 1, 1,
0.05320912, -0.0716659, 0.8996234, 1, 1, 1, 1, 1,
0.05548395, -1.40813, 3.564566, 1, 1, 1, 1, 1,
0.05582969, -1.210062, 3.479697, 1, 1, 1, 1, 1,
0.06386127, -0.4472286, 2.625087, 1, 1, 1, 1, 1,
0.06612918, -1.292958, 4.929189, 1, 1, 1, 1, 1,
0.06631016, 0.4290295, -0.7706839, 1, 1, 1, 1, 1,
0.06710675, 0.4526509, 0.6113998, 1, 1, 1, 1, 1,
0.06831508, -0.2638161, 5.351107, 1, 1, 1, 1, 1,
0.07380502, -0.2071454, 2.161518, 1, 1, 1, 1, 1,
0.0744549, 0.2018124, 0.6389145, 1, 1, 1, 1, 1,
0.07576047, 0.1844639, 2.038052, 1, 1, 1, 1, 1,
0.07581719, -0.5316988, 2.046108, 1, 1, 1, 1, 1,
0.08047879, -0.750499, 2.670905, 1, 1, 1, 1, 1,
0.08319771, 0.6712405, 0.4445302, 1, 1, 1, 1, 1,
0.08731786, 0.7356998, 0.1432025, 0, 0, 1, 1, 1,
0.09285128, -1.928351, 4.398007, 1, 0, 0, 1, 1,
0.09363973, 1.196941, 0.2643658, 1, 0, 0, 1, 1,
0.09508562, 1.471757, 2.368602, 1, 0, 0, 1, 1,
0.09801728, -1.121243, 2.623442, 1, 0, 0, 1, 1,
0.09831329, 0.331673, 0.282079, 1, 0, 0, 1, 1,
0.09839109, -0.7537707, 3.42639, 0, 0, 0, 1, 1,
0.09905605, 0.1511472, -0.3445259, 0, 0, 0, 1, 1,
0.1005374, 0.1016188, -0.09950486, 0, 0, 0, 1, 1,
0.1041701, 0.2490572, 1.349154, 0, 0, 0, 1, 1,
0.1083305, -0.8986953, 3.870897, 0, 0, 0, 1, 1,
0.1132018, 1.295717, 0.07160009, 0, 0, 0, 1, 1,
0.1142996, -0.2185766, 2.404113, 0, 0, 0, 1, 1,
0.1147387, 2.274233, 0.6545576, 1, 1, 1, 1, 1,
0.1149428, 1.952448, -1.666811, 1, 1, 1, 1, 1,
0.1182273, -0.8660374, 1.760967, 1, 1, 1, 1, 1,
0.1196467, 3.347521, 1.247912, 1, 1, 1, 1, 1,
0.1213772, -0.1455348, 3.002457, 1, 1, 1, 1, 1,
0.1215852, -0.3516166, 0.6526223, 1, 1, 1, 1, 1,
0.1217108, 0.2085024, 1.017444, 1, 1, 1, 1, 1,
0.1231191, 1.860785, -0.5333425, 1, 1, 1, 1, 1,
0.1261221, 0.7302729, 0.6308003, 1, 1, 1, 1, 1,
0.1273839, -0.1574777, 4.352586, 1, 1, 1, 1, 1,
0.1289201, 0.5215902, 0.6251701, 1, 1, 1, 1, 1,
0.1290993, 1.086594, -0.4471153, 1, 1, 1, 1, 1,
0.1355116, -0.07855469, 2.271227, 1, 1, 1, 1, 1,
0.1367151, 0.8529325, -1.125701, 1, 1, 1, 1, 1,
0.1412105, -0.3554768, 3.76876, 1, 1, 1, 1, 1,
0.1446143, 0.0641572, 0.4668011, 0, 0, 1, 1, 1,
0.1484313, 0.2168355, 0.628496, 1, 0, 0, 1, 1,
0.1502884, 0.9656402, 0.825631, 1, 0, 0, 1, 1,
0.1540677, 1.798275, 0.2742016, 1, 0, 0, 1, 1,
0.1585666, 2.624724, -1.515505, 1, 0, 0, 1, 1,
0.1602006, 0.840139, -0.2851384, 1, 0, 0, 1, 1,
0.1603816, 1.950648, -1.003787, 0, 0, 0, 1, 1,
0.1607617, -0.4898362, 3.197921, 0, 0, 0, 1, 1,
0.164312, 1.83651, -0.1131463, 0, 0, 0, 1, 1,
0.1652977, 0.6854466, 0.2437766, 0, 0, 0, 1, 1,
0.1671537, -0.2106405, 2.11868, 0, 0, 0, 1, 1,
0.1688916, 1.100425, 0.2361082, 0, 0, 0, 1, 1,
0.1698167, -1.166617, 1.450322, 0, 0, 0, 1, 1,
0.1752039, -0.2624642, 2.003732, 1, 1, 1, 1, 1,
0.1759242, -1.197826, 3.443872, 1, 1, 1, 1, 1,
0.1815109, 1.456516, 1.455345, 1, 1, 1, 1, 1,
0.1840214, 0.638894, 0.7383356, 1, 1, 1, 1, 1,
0.1847936, -0.2559157, 3.059306, 1, 1, 1, 1, 1,
0.1853171, -0.1488398, 3.405508, 1, 1, 1, 1, 1,
0.1893213, -0.02492168, 2.994445, 1, 1, 1, 1, 1,
0.1905683, 0.4822144, -0.05310332, 1, 1, 1, 1, 1,
0.1971934, 0.4055271, -1.347121, 1, 1, 1, 1, 1,
0.1994174, -0.9799047, 3.038171, 1, 1, 1, 1, 1,
0.2013846, -1.840365, 1.04959, 1, 1, 1, 1, 1,
0.2069856, -0.5326884, 2.136404, 1, 1, 1, 1, 1,
0.207715, 0.1091834, 1.851604, 1, 1, 1, 1, 1,
0.2088962, 1.161383, -0.3605752, 1, 1, 1, 1, 1,
0.2106279, 1.525201, -1.328346, 1, 1, 1, 1, 1,
0.2136449, -2.486953, 1.922807, 0, 0, 1, 1, 1,
0.2139772, -0.122166, 0.593205, 1, 0, 0, 1, 1,
0.2235707, 1.220316, 0.08123833, 1, 0, 0, 1, 1,
0.2271476, -2.898882, 2.747316, 1, 0, 0, 1, 1,
0.2274194, -1.285363, 3.940844, 1, 0, 0, 1, 1,
0.2313119, 1.629697, -0.5803773, 1, 0, 0, 1, 1,
0.2318227, -0.2459649, 2.276002, 0, 0, 0, 1, 1,
0.2335327, -0.593545, 2.74314, 0, 0, 0, 1, 1,
0.233763, -0.3687956, 2.491053, 0, 0, 0, 1, 1,
0.2357481, 0.6679824, 1.461539, 0, 0, 0, 1, 1,
0.2403385, 0.9176664, -0.7716168, 0, 0, 0, 1, 1,
0.2425943, -1.401989, 2.990466, 0, 0, 0, 1, 1,
0.2468762, -0.0206438, 1.031801, 0, 0, 0, 1, 1,
0.2494808, -0.6688738, 3.722234, 1, 1, 1, 1, 1,
0.2498037, -1.87868, 3.248875, 1, 1, 1, 1, 1,
0.2512976, 0.5098193, 0.7852646, 1, 1, 1, 1, 1,
0.2565844, -1.57023, 3.579739, 1, 1, 1, 1, 1,
0.2572813, 2.145442, 0.8849463, 1, 1, 1, 1, 1,
0.2634203, -1.007401, 4.527172, 1, 1, 1, 1, 1,
0.2641225, -1.201182, 3.454673, 1, 1, 1, 1, 1,
0.2660797, 1.759197, -0.192066, 1, 1, 1, 1, 1,
0.2660968, -0.3196579, 2.675814, 1, 1, 1, 1, 1,
0.2665829, -1.458301, 2.500121, 1, 1, 1, 1, 1,
0.2712553, 0.2913074, 0.2111249, 1, 1, 1, 1, 1,
0.2714645, 1.226628, 0.5503384, 1, 1, 1, 1, 1,
0.2735939, 2.222011, 0.7026346, 1, 1, 1, 1, 1,
0.2765726, 0.8956712, 0.3448168, 1, 1, 1, 1, 1,
0.2771087, 0.05930963, 0.697468, 1, 1, 1, 1, 1,
0.2773193, 0.2465935, 0.6448611, 0, 0, 1, 1, 1,
0.2789914, -0.03726852, 1.418768, 1, 0, 0, 1, 1,
0.2843621, 1.042211, -0.7753583, 1, 0, 0, 1, 1,
0.2847799, -1.200327, 2.569096, 1, 0, 0, 1, 1,
0.2890763, -0.7144651, 3.092328, 1, 0, 0, 1, 1,
0.2910553, -1.184805, 3.125485, 1, 0, 0, 1, 1,
0.2916162, 3.334181, -1.112152, 0, 0, 0, 1, 1,
0.2927949, -0.9972078, 3.220437, 0, 0, 0, 1, 1,
0.2950312, -1.46585, 2.43482, 0, 0, 0, 1, 1,
0.3067965, 0.817674, 0.09493463, 0, 0, 0, 1, 1,
0.3073558, 0.5767307, 0.4310664, 0, 0, 0, 1, 1,
0.3083015, 0.2423601, 1.070664, 0, 0, 0, 1, 1,
0.3122559, 0.3507503, -0.5131971, 0, 0, 0, 1, 1,
0.3135093, -1.836434, 4.056205, 1, 1, 1, 1, 1,
0.3187449, -1.303636, 1.588245, 1, 1, 1, 1, 1,
0.3200137, 0.1266269, 2.202506, 1, 1, 1, 1, 1,
0.3240457, 0.1817347, -1.333759, 1, 1, 1, 1, 1,
0.324865, -0.8421006, 4.606082, 1, 1, 1, 1, 1,
0.3248861, 1.219086, 1.104634, 1, 1, 1, 1, 1,
0.3375101, -1.584779, 2.962962, 1, 1, 1, 1, 1,
0.3375689, -0.2408438, 0.9678639, 1, 1, 1, 1, 1,
0.3392444, -0.3255105, 2.031546, 1, 1, 1, 1, 1,
0.3439356, 0.01524486, 0.9603758, 1, 1, 1, 1, 1,
0.3468472, 0.2319909, 1.94456, 1, 1, 1, 1, 1,
0.348647, 1.02637, -0.2098598, 1, 1, 1, 1, 1,
0.3578853, 0.6922988, 1.309102, 1, 1, 1, 1, 1,
0.360987, -1.404812, 0.960708, 1, 1, 1, 1, 1,
0.3616933, 0.190061, 0.6435356, 1, 1, 1, 1, 1,
0.3646763, 0.1834221, 1.733346, 0, 0, 1, 1, 1,
0.3648072, 0.4654884, 2.037419, 1, 0, 0, 1, 1,
0.3665688, 0.2270527, -0.1173197, 1, 0, 0, 1, 1,
0.3666056, 1.66038, -0.4394951, 1, 0, 0, 1, 1,
0.3764516, -0.1631287, 2.30669, 1, 0, 0, 1, 1,
0.3801431, 0.340381, 1.008412, 1, 0, 0, 1, 1,
0.3810359, 1.360227, 1.692359, 0, 0, 0, 1, 1,
0.3835483, -0.6414579, 2.014467, 0, 0, 0, 1, 1,
0.3849157, -1.034153, 1.065814, 0, 0, 0, 1, 1,
0.3972009, 0.645267, -0.2819766, 0, 0, 0, 1, 1,
0.398182, 1.579187, -0.5920605, 0, 0, 0, 1, 1,
0.4007647, 0.119529, 2.084957, 0, 0, 0, 1, 1,
0.4044921, -0.7038258, 3.043704, 0, 0, 0, 1, 1,
0.4058783, 0.4409189, -0.3020143, 1, 1, 1, 1, 1,
0.4067451, -0.3160709, 2.527997, 1, 1, 1, 1, 1,
0.4072337, 1.635855, -0.4600395, 1, 1, 1, 1, 1,
0.40858, 0.01536923, 2.010386, 1, 1, 1, 1, 1,
0.4109772, 0.5675604, 1.30208, 1, 1, 1, 1, 1,
0.4134294, 0.7813211, -0.9618205, 1, 1, 1, 1, 1,
0.4147828, -0.09990544, -0.1684785, 1, 1, 1, 1, 1,
0.4177018, 0.05868493, 0.9516616, 1, 1, 1, 1, 1,
0.4185098, 0.03628849, 2.287619, 1, 1, 1, 1, 1,
0.4212635, -0.272273, 3.346792, 1, 1, 1, 1, 1,
0.4236322, -0.1094082, 0.4256212, 1, 1, 1, 1, 1,
0.4237457, -0.7154245, 1.813623, 1, 1, 1, 1, 1,
0.4243486, -0.06693546, 1.751374, 1, 1, 1, 1, 1,
0.4248159, -0.5599338, 2.411802, 1, 1, 1, 1, 1,
0.4265535, -2.091691, 2.9954, 1, 1, 1, 1, 1,
0.4265854, -1.543251, 3.34908, 0, 0, 1, 1, 1,
0.4269639, -0.5345773, 2.299216, 1, 0, 0, 1, 1,
0.4320504, -1.277962, 2.131879, 1, 0, 0, 1, 1,
0.4439458, -0.8433757, 2.268664, 1, 0, 0, 1, 1,
0.4516184, -0.3097797, 0.826491, 1, 0, 0, 1, 1,
0.451726, 0.08104087, -0.302064, 1, 0, 0, 1, 1,
0.4551265, 0.1259728, 2.073462, 0, 0, 0, 1, 1,
0.4568183, -0.165309, -0.3117421, 0, 0, 0, 1, 1,
0.4596935, -0.2415177, 2.337515, 0, 0, 0, 1, 1,
0.4621884, -0.1151659, 0.121118, 0, 0, 0, 1, 1,
0.4628302, 0.8972329, 0.6652418, 0, 0, 0, 1, 1,
0.4642514, -0.5191798, 1.268597, 0, 0, 0, 1, 1,
0.464376, 1.7902, -0.9608748, 0, 0, 0, 1, 1,
0.466996, -0.1504954, 0.08072782, 1, 1, 1, 1, 1,
0.4729839, -0.3735288, 1.779294, 1, 1, 1, 1, 1,
0.473024, 0.322175, 2.384811, 1, 1, 1, 1, 1,
0.4753926, 0.8273121, 1.508629, 1, 1, 1, 1, 1,
0.4807971, -0.9630656, 3.166441, 1, 1, 1, 1, 1,
0.4831491, -0.2705983, 2.335754, 1, 1, 1, 1, 1,
0.4876029, 0.4043706, 0.4266168, 1, 1, 1, 1, 1,
0.4890699, 1.753913, 0.1209676, 1, 1, 1, 1, 1,
0.4898599, -0.4968465, 0.7101835, 1, 1, 1, 1, 1,
0.4899705, -0.3082447, 1.376502, 1, 1, 1, 1, 1,
0.4906422, -0.05367319, 0.9648374, 1, 1, 1, 1, 1,
0.4909013, -0.01998275, 1.135279, 1, 1, 1, 1, 1,
0.4931644, -1.490119, 2.734464, 1, 1, 1, 1, 1,
0.4937261, 0.3003237, 1.682568, 1, 1, 1, 1, 1,
0.4953586, -0.3520831, 1.25864, 1, 1, 1, 1, 1,
0.502672, -1.131922, 0.8514584, 0, 0, 1, 1, 1,
0.5046272, -0.1165797, 3.097212, 1, 0, 0, 1, 1,
0.512957, 0.2701208, 1.319447, 1, 0, 0, 1, 1,
0.514929, 2.105828, 0.1964877, 1, 0, 0, 1, 1,
0.5162102, 3.055929, -1.455286, 1, 0, 0, 1, 1,
0.5191562, -1.686236, 2.694367, 1, 0, 0, 1, 1,
0.51941, 0.4199512, -0.86576, 0, 0, 0, 1, 1,
0.5216888, 0.4957841, 1.210941, 0, 0, 0, 1, 1,
0.5244023, -0.4941394, 2.059956, 0, 0, 0, 1, 1,
0.5249366, 0.03394342, 2.855962, 0, 0, 0, 1, 1,
0.5299605, -2.452576, 0.9242145, 0, 0, 0, 1, 1,
0.5315641, -0.1494092, 1.14184, 0, 0, 0, 1, 1,
0.5324822, -1.258907, 3.997711, 0, 0, 0, 1, 1,
0.5335526, 1.177592, -0.8134582, 1, 1, 1, 1, 1,
0.5343757, -1.152736, 1.316251, 1, 1, 1, 1, 1,
0.5348728, 0.7589063, -1.008281, 1, 1, 1, 1, 1,
0.5375942, 0.8046224, -0.4179536, 1, 1, 1, 1, 1,
0.5394927, -2.393018, 2.735319, 1, 1, 1, 1, 1,
0.5417324, -0.1142922, 1.898076, 1, 1, 1, 1, 1,
0.5422475, -0.1805532, 2.752491, 1, 1, 1, 1, 1,
0.546917, 1.153125, -0.4790911, 1, 1, 1, 1, 1,
0.5481322, 0.1799421, 2.379589, 1, 1, 1, 1, 1,
0.5494402, -0.7693576, 3.129801, 1, 1, 1, 1, 1,
0.5498657, -0.3465619, 1.958819, 1, 1, 1, 1, 1,
0.5579531, -1.766358, 4.888833, 1, 1, 1, 1, 1,
0.5615132, -0.1160079, 1.055966, 1, 1, 1, 1, 1,
0.5629233, 0.320927, 1.499957, 1, 1, 1, 1, 1,
0.5645368, -0.8680449, 4.494943, 1, 1, 1, 1, 1,
0.5647963, -1.152971, 1.486072, 0, 0, 1, 1, 1,
0.5689118, 0.4172305, 1.140284, 1, 0, 0, 1, 1,
0.574384, -0.5287116, 2.035417, 1, 0, 0, 1, 1,
0.5764062, 0.7381404, 0.3948133, 1, 0, 0, 1, 1,
0.5789233, -0.08979186, 3.14532, 1, 0, 0, 1, 1,
0.5830158, 0.5294331, 2.138998, 1, 0, 0, 1, 1,
0.5856798, -0.05294637, 2.039689, 0, 0, 0, 1, 1,
0.593637, -1.646485, 2.778316, 0, 0, 0, 1, 1,
0.6023989, -0.5136981, -0.5568852, 0, 0, 0, 1, 1,
0.6094751, -0.1971539, 1.726108, 0, 0, 0, 1, 1,
0.6102167, 0.772298, 2.504596, 0, 0, 0, 1, 1,
0.6227733, -0.5373724, 3.839818, 0, 0, 0, 1, 1,
0.6242937, 0.3163233, 1.615277, 0, 0, 0, 1, 1,
0.6253082, 0.9416473, -0.3559216, 1, 1, 1, 1, 1,
0.6286377, -0.1743972, 4.647918, 1, 1, 1, 1, 1,
0.6330119, -1.127559, 2.49327, 1, 1, 1, 1, 1,
0.636871, 0.3316867, 0.8430117, 1, 1, 1, 1, 1,
0.6381067, 0.3492014, -0.04436265, 1, 1, 1, 1, 1,
0.6509268, -0.8593376, 3.420735, 1, 1, 1, 1, 1,
0.6538297, 0.6302124, -0.2877908, 1, 1, 1, 1, 1,
0.6570985, 0.7954905, 0.2602973, 1, 1, 1, 1, 1,
0.6652159, -0.2952118, 1.810518, 1, 1, 1, 1, 1,
0.6681952, 0.5550314, 1.675313, 1, 1, 1, 1, 1,
0.675539, 1.288864, -1.240986, 1, 1, 1, 1, 1,
0.6799496, 0.4825763, -0.151792, 1, 1, 1, 1, 1,
0.6807728, -0.2886023, 2.458419, 1, 1, 1, 1, 1,
0.6860081, -2.468309, 3.228683, 1, 1, 1, 1, 1,
0.6886652, 0.910339, 0.8942757, 1, 1, 1, 1, 1,
0.6899498, 0.5968343, 0.9358138, 0, 0, 1, 1, 1,
0.6925011, -0.8157095, 2.345852, 1, 0, 0, 1, 1,
0.7168753, 1.046893, 0.4614469, 1, 0, 0, 1, 1,
0.7214655, -0.9678229, 2.318776, 1, 0, 0, 1, 1,
0.7231656, 0.9658759, 0.8488477, 1, 0, 0, 1, 1,
0.7353829, -1.526913, 2.654844, 1, 0, 0, 1, 1,
0.7479929, 0.4341977, -0.09433952, 0, 0, 0, 1, 1,
0.7523817, 0.6206527, 1.430193, 0, 0, 0, 1, 1,
0.7533045, 0.3623965, 0.1164861, 0, 0, 0, 1, 1,
0.7535511, 1.584168, -0.1219942, 0, 0, 0, 1, 1,
0.7535762, 0.8934928, -0.3987319, 0, 0, 0, 1, 1,
0.7674496, 0.08511525, 0.9312735, 0, 0, 0, 1, 1,
0.7720783, -0.2753584, 2.434772, 0, 0, 0, 1, 1,
0.7763104, 0.9217873, -0.5633417, 1, 1, 1, 1, 1,
0.7797154, 1.212315, 0.167579, 1, 1, 1, 1, 1,
0.7805132, -1.001172, 1.663482, 1, 1, 1, 1, 1,
0.7821239, 1.655427, 2.578314, 1, 1, 1, 1, 1,
0.7824641, -0.2103052, 0.361625, 1, 1, 1, 1, 1,
0.7825751, -0.1940843, 2.175703, 1, 1, 1, 1, 1,
0.7854967, 0.1793866, -0.2546837, 1, 1, 1, 1, 1,
0.7888201, 0.6691049, 1.419225, 1, 1, 1, 1, 1,
0.7898652, 0.08504146, 0.8258969, 1, 1, 1, 1, 1,
0.792852, 0.5593346, 0.7723598, 1, 1, 1, 1, 1,
0.8035311, -0.974013, 2.36379, 1, 1, 1, 1, 1,
0.8040523, 1.241764, -0.2666122, 1, 1, 1, 1, 1,
0.8066627, -1.138317, 2.079305, 1, 1, 1, 1, 1,
0.8082172, -0.4225933, 1.497513, 1, 1, 1, 1, 1,
0.809691, 0.8941494, 2.770446, 1, 1, 1, 1, 1,
0.8125058, 1.07121, 0.6669875, 0, 0, 1, 1, 1,
0.8158054, 1.052129, 0.625551, 1, 0, 0, 1, 1,
0.8192528, -0.2958876, 1.752867, 1, 0, 0, 1, 1,
0.8277348, 1.22072, 1.313823, 1, 0, 0, 1, 1,
0.8295221, 0.1220938, 1.203836, 1, 0, 0, 1, 1,
0.8309408, -0.01308598, 2.551492, 1, 0, 0, 1, 1,
0.8418936, 1.689157, 0.1910336, 0, 0, 0, 1, 1,
0.846796, 0.04309973, -0.2938625, 0, 0, 0, 1, 1,
0.8507, -0.6106142, 1.635695, 0, 0, 0, 1, 1,
0.8519911, 1.083323, 1.866494, 0, 0, 0, 1, 1,
0.8536431, -0.7562497, 3.35211, 0, 0, 0, 1, 1,
0.858232, -0.768668, 3.254329, 0, 0, 0, 1, 1,
0.8656155, 0.4212844, 1.863705, 0, 0, 0, 1, 1,
0.8715757, 0.1511698, 1.157658, 1, 1, 1, 1, 1,
0.8760586, 0.08124381, 1.996137, 1, 1, 1, 1, 1,
0.8805919, 0.6521314, 2.14441, 1, 1, 1, 1, 1,
0.8811487, -0.2301116, 1.080618, 1, 1, 1, 1, 1,
0.8851006, 0.2248605, 1.525049, 1, 1, 1, 1, 1,
0.8984973, -1.305296, 2.234555, 1, 1, 1, 1, 1,
0.9166618, 1.154534, 0.5477989, 1, 1, 1, 1, 1,
0.9169721, 0.2184423, 2.988754, 1, 1, 1, 1, 1,
0.9196715, 0.6258484, 0.9009337, 1, 1, 1, 1, 1,
0.9226377, -1.143119, -0.1191552, 1, 1, 1, 1, 1,
0.9230132, -0.17931, 2.227381, 1, 1, 1, 1, 1,
0.9235901, -0.8030068, -0.04771197, 1, 1, 1, 1, 1,
0.9246687, 0.855227, 0.2611919, 1, 1, 1, 1, 1,
0.9302891, 0.3163189, 1.277436, 1, 1, 1, 1, 1,
0.9316909, -0.4787374, 2.280177, 1, 1, 1, 1, 1,
0.9332807, -1.044439, 3.366433, 0, 0, 1, 1, 1,
0.9376441, -0.3165241, 0.95956, 1, 0, 0, 1, 1,
0.9391468, 1.560999, 1.536068, 1, 0, 0, 1, 1,
0.9492238, 1.800732, 1.81499, 1, 0, 0, 1, 1,
0.9514286, 0.2799669, 2.865101, 1, 0, 0, 1, 1,
0.9544548, 1.510837, 1.730444, 1, 0, 0, 1, 1,
0.9607688, -1.422353, 2.656469, 0, 0, 0, 1, 1,
0.9609613, -0.2933849, 3.240304, 0, 0, 0, 1, 1,
0.9647417, 1.048161, 1.253492, 0, 0, 0, 1, 1,
0.9668371, -0.8862604, 3.39166, 0, 0, 0, 1, 1,
0.9689888, 0.6973757, 0.6267194, 0, 0, 0, 1, 1,
0.9735585, 1.099818, 1.435181, 0, 0, 0, 1, 1,
0.9789176, 2.46924, 0.8842365, 0, 0, 0, 1, 1,
0.9846676, 0.1163347, 0.9176404, 1, 1, 1, 1, 1,
0.987269, -0.6894315, 1.496153, 1, 1, 1, 1, 1,
0.9895788, -1.150142, 1.761248, 1, 1, 1, 1, 1,
0.9924222, -1.082311, 2.992387, 1, 1, 1, 1, 1,
0.992741, -1.228745, 4.652698, 1, 1, 1, 1, 1,
0.9957175, 0.1682831, 1.80944, 1, 1, 1, 1, 1,
0.9987842, -0.2598812, 1.53752, 1, 1, 1, 1, 1,
0.9995556, 0.4853033, 0.8162591, 1, 1, 1, 1, 1,
1.000853, -0.876681, 2.480625, 1, 1, 1, 1, 1,
1.004346, -0.329666, 2.025872, 1, 1, 1, 1, 1,
1.00625, 1.312506, 1.70518, 1, 1, 1, 1, 1,
1.008927, -0.08640748, 3.2919, 1, 1, 1, 1, 1,
1.011131, -4.110104e-05, 2.701605, 1, 1, 1, 1, 1,
1.012878, -1.017019, 1.496802, 1, 1, 1, 1, 1,
1.021597, 0.6781009, 1.343104, 1, 1, 1, 1, 1,
1.035134, -0.1110408, 2.921414, 0, 0, 1, 1, 1,
1.040735, -1.593696, 2.113168, 1, 0, 0, 1, 1,
1.041277, 1.163923, -1.251016, 1, 0, 0, 1, 1,
1.045103, 0.3027114, 0.2019453, 1, 0, 0, 1, 1,
1.04937, -0.3601143, 3.761088, 1, 0, 0, 1, 1,
1.050282, 1.743436, -0.7615719, 1, 0, 0, 1, 1,
1.051937, -2.698857, 0.2972523, 0, 0, 0, 1, 1,
1.055018, -1.430856, 3.269219, 0, 0, 0, 1, 1,
1.056603, -0.6976042, 1.657107, 0, 0, 0, 1, 1,
1.062854, -0.4058287, 1.002069, 0, 0, 0, 1, 1,
1.063395, 1.419617, 0.7211841, 0, 0, 0, 1, 1,
1.064494, 1.032754, 1.898932, 0, 0, 0, 1, 1,
1.068161, -1.378954, 2.686295, 0, 0, 0, 1, 1,
1.069694, -0.2618668, 1.613587, 1, 1, 1, 1, 1,
1.072343, 0.5245123, 2.38708, 1, 1, 1, 1, 1,
1.072788, -0.2511913, -0.1075414, 1, 1, 1, 1, 1,
1.074219, 0.4828029, 1.206177, 1, 1, 1, 1, 1,
1.076364, 0.2351371, 1.483139, 1, 1, 1, 1, 1,
1.082432, -0.2860435, 2.19508, 1, 1, 1, 1, 1,
1.087916, 0.3872551, 1.848255, 1, 1, 1, 1, 1,
1.088781, -0.2754263, 1.22583, 1, 1, 1, 1, 1,
1.09435, 0.6292995, 1.40573, 1, 1, 1, 1, 1,
1.095549, -1.879164, 2.960788, 1, 1, 1, 1, 1,
1.098312, -0.09514751, 2.657053, 1, 1, 1, 1, 1,
1.108501, -0.5211022, 2.178942, 1, 1, 1, 1, 1,
1.109109, 1.873376, 0.9174004, 1, 1, 1, 1, 1,
1.109623, 0.488648, -0.1157879, 1, 1, 1, 1, 1,
1.114769, -0.4220083, 1.427583, 1, 1, 1, 1, 1,
1.117108, 0.2467817, 0.6308321, 0, 0, 1, 1, 1,
1.117381, 2.387396, 1.138707, 1, 0, 0, 1, 1,
1.122482, -0.250238, 2.021013, 1, 0, 0, 1, 1,
1.123967, -0.4419274, 1.317459, 1, 0, 0, 1, 1,
1.128227, 0.112643, 1.097031, 1, 0, 0, 1, 1,
1.13741, 0.1806962, 2.642725, 1, 0, 0, 1, 1,
1.140342, -0.4989961, 2.03576, 0, 0, 0, 1, 1,
1.144609, 1.133515, 1.763865, 0, 0, 0, 1, 1,
1.149512, 0.2094272, 2.320053, 0, 0, 0, 1, 1,
1.159544, -0.1020179, 0.7190054, 0, 0, 0, 1, 1,
1.173584, 0.7284508, 0.8452436, 0, 0, 0, 1, 1,
1.176689, 0.6051019, 3.697649, 0, 0, 0, 1, 1,
1.20684, -0.8498294, 2.803883, 0, 0, 0, 1, 1,
1.210042, 1.228267, 1.606902, 1, 1, 1, 1, 1,
1.217641, 0.2348283, 2.014763, 1, 1, 1, 1, 1,
1.227139, 1.825253, 0.9770809, 1, 1, 1, 1, 1,
1.227406, 0.5068514, 0.1587271, 1, 1, 1, 1, 1,
1.244676, -0.7377588, 2.236224, 1, 1, 1, 1, 1,
1.250174, -1.657335, 3.55678, 1, 1, 1, 1, 1,
1.251055, 0.6768249, 1.41157, 1, 1, 1, 1, 1,
1.255154, -0.07765257, 2.24757, 1, 1, 1, 1, 1,
1.257693, -2.264024, 2.617743, 1, 1, 1, 1, 1,
1.258374, 0.2107297, 0.5115705, 1, 1, 1, 1, 1,
1.260544, 0.2101999, 0.5978943, 1, 1, 1, 1, 1,
1.261005, 0.9775195, 0.6686956, 1, 1, 1, 1, 1,
1.305247, 0.2756137, 1.087117, 1, 1, 1, 1, 1,
1.31655, -0.6513099, 2.516941, 1, 1, 1, 1, 1,
1.324836, -0.119173, 1.683379, 1, 1, 1, 1, 1,
1.330796, -0.1506287, 0.7672139, 0, 0, 1, 1, 1,
1.331028, -0.8400806, 3.363499, 1, 0, 0, 1, 1,
1.33642, -0.2293016, 2.090093, 1, 0, 0, 1, 1,
1.338694, -1.12131, 1.753529, 1, 0, 0, 1, 1,
1.342442, -0.574625, 2.005493, 1, 0, 0, 1, 1,
1.352964, 1.678725, 0.6177421, 1, 0, 0, 1, 1,
1.362275, -0.2727296, 1.365161, 0, 0, 0, 1, 1,
1.368211, -1.358495, 3.523992, 0, 0, 0, 1, 1,
1.368953, 0.01320512, 1.084791, 0, 0, 0, 1, 1,
1.370371, 0.3214351, 1.260166, 0, 0, 0, 1, 1,
1.377198, -0.7194648, 2.126349, 0, 0, 0, 1, 1,
1.382252, 1.02226, -0.1548531, 0, 0, 0, 1, 1,
1.387925, -0.232772, 1.645208, 0, 0, 0, 1, 1,
1.388991, 1.05317, 1.050181, 1, 1, 1, 1, 1,
1.410087, -1.445605, 1.556828, 1, 1, 1, 1, 1,
1.419634, -0.7322131, 2.387179, 1, 1, 1, 1, 1,
1.430324, 1.479351, 2.776003, 1, 1, 1, 1, 1,
1.433956, -0.7309219, 1.803829, 1, 1, 1, 1, 1,
1.436985, 0.1753386, 2.939423, 1, 1, 1, 1, 1,
1.440895, 0.2417822, 0.9233029, 1, 1, 1, 1, 1,
1.453415, 0.3673193, -0.32205, 1, 1, 1, 1, 1,
1.454212, 1.109965, 1.501675, 1, 1, 1, 1, 1,
1.457662, -0.1162952, 1.896896, 1, 1, 1, 1, 1,
1.473584, -0.6162555, 1.879177, 1, 1, 1, 1, 1,
1.474517, 1.321468, 1.278552, 1, 1, 1, 1, 1,
1.477746, 1.691363, 2.049085, 1, 1, 1, 1, 1,
1.482175, 0.3211083, 0.6681529, 1, 1, 1, 1, 1,
1.48668, 1.409611, 0.1908403, 1, 1, 1, 1, 1,
1.48682, -0.464128, 4.476579, 0, 0, 1, 1, 1,
1.492926, 1.009681, 1.855138, 1, 0, 0, 1, 1,
1.493462, 0.01588653, 0.3308279, 1, 0, 0, 1, 1,
1.510485, 0.3497214, 0.9728066, 1, 0, 0, 1, 1,
1.510895, -0.6544548, 3.293228, 1, 0, 0, 1, 1,
1.538941, -1.990049, 3.070689, 1, 0, 0, 1, 1,
1.550523, 1.275902, 0.5537944, 0, 0, 0, 1, 1,
1.571706, -1.03514, 0.9880976, 0, 0, 0, 1, 1,
1.572992, 0.09429565, 1.998909, 0, 0, 0, 1, 1,
1.595114, -0.444201, -0.7411913, 0, 0, 0, 1, 1,
1.595943, -1.34439, 2.801473, 0, 0, 0, 1, 1,
1.602976, -1.02654, 2.173861, 0, 0, 0, 1, 1,
1.60316, 0.4327025, 2.304404, 0, 0, 0, 1, 1,
1.615934, -0.805266, 0.7031454, 1, 1, 1, 1, 1,
1.619356, 0.8662612, 0.02554095, 1, 1, 1, 1, 1,
1.622658, 0.314739, -0.3165537, 1, 1, 1, 1, 1,
1.651662, -0.2196734, 1.675353, 1, 1, 1, 1, 1,
1.654273, -0.4104597, 1.331943, 1, 1, 1, 1, 1,
1.65599, -0.605911, 3.336327, 1, 1, 1, 1, 1,
1.662001, 0.6240368, 1.047421, 1, 1, 1, 1, 1,
1.676097, 0.9493062, 0.187979, 1, 1, 1, 1, 1,
1.677178, 0.3596559, 2.302137, 1, 1, 1, 1, 1,
1.678073, -1.128662, 3.541785, 1, 1, 1, 1, 1,
1.679544, -0.6572975, 1.546826, 1, 1, 1, 1, 1,
1.680769, 0.2719752, -0.02286802, 1, 1, 1, 1, 1,
1.68099, -1.077184, 5.143599, 1, 1, 1, 1, 1,
1.692781, -0.1254233, 2.971014, 1, 1, 1, 1, 1,
1.697616, -0.1898012, -0.3773519, 1, 1, 1, 1, 1,
1.713956, 1.109846, 2.163341, 0, 0, 1, 1, 1,
1.714117, -0.3233142, 2.294186, 1, 0, 0, 1, 1,
1.732734, -1.604412, 3.899381, 1, 0, 0, 1, 1,
1.734764, 2.467342, 0.03342996, 1, 0, 0, 1, 1,
1.740506, -0.7050121, 2.988548, 1, 0, 0, 1, 1,
1.758768, -0.9386356, 1.792274, 1, 0, 0, 1, 1,
1.766658, -0.2384093, 2.631219, 0, 0, 0, 1, 1,
1.770294, 1.129985, 1.822037, 0, 0, 0, 1, 1,
1.77652, -1.531163, 0.7448124, 0, 0, 0, 1, 1,
1.78166, 0.08917091, 1.896799, 0, 0, 0, 1, 1,
1.784632, -1.45804, 0.8498057, 0, 0, 0, 1, 1,
1.794835, 0.6645765, -0.1057592, 0, 0, 0, 1, 1,
1.822559, -0.1445262, 2.638457, 0, 0, 0, 1, 1,
1.827137, 1.249836, 3.158886, 1, 1, 1, 1, 1,
1.847772, -0.1507978, 2.948991, 1, 1, 1, 1, 1,
1.902389, 0.1943562, 2.790508, 1, 1, 1, 1, 1,
1.906763, 0.7710218, 0.6021491, 1, 1, 1, 1, 1,
1.935586, -0.04496705, 2.647657, 1, 1, 1, 1, 1,
1.941484, -0.5117688, 1.331643, 1, 1, 1, 1, 1,
1.962787, 0.7887669, 0.9506814, 1, 1, 1, 1, 1,
1.969177, 1.169386, 1.106335, 1, 1, 1, 1, 1,
1.981491, -0.2082135, 1.160929, 1, 1, 1, 1, 1,
1.986376, 1.74228, 1.485279, 1, 1, 1, 1, 1,
2.031717, -0.618051, 1.123956, 1, 1, 1, 1, 1,
2.03606, 0.2740806, 1.410162, 1, 1, 1, 1, 1,
2.052972, -0.9498469, 1.302894, 1, 1, 1, 1, 1,
2.083196, 0.4192185, 0.7958407, 1, 1, 1, 1, 1,
2.130533, 0.705522, 0.04849838, 1, 1, 1, 1, 1,
2.132794, -0.3542269, 2.003406, 0, 0, 1, 1, 1,
2.148567, 0.4726883, 1.698187, 1, 0, 0, 1, 1,
2.184183, -0.01644573, 1.978572, 1, 0, 0, 1, 1,
2.192649, 1.633851, 1.460781, 1, 0, 0, 1, 1,
2.229083, 0.44972, 2.487841, 1, 0, 0, 1, 1,
2.260969, 1.788215, 1.776913, 1, 0, 0, 1, 1,
2.300717, -0.7987943, 0.9597825, 0, 0, 0, 1, 1,
2.351655, -1.75173, 1.665353, 0, 0, 0, 1, 1,
2.486464, -1.246071, 3.715863, 0, 0, 0, 1, 1,
2.588415, 0.08721428, 1.740394, 0, 0, 0, 1, 1,
2.63122, -0.4210368, 1.760905, 0, 0, 0, 1, 1,
2.634416, 1.36118, 0.8856789, 0, 0, 0, 1, 1,
2.697161, 0.6332593, 0.6515983, 0, 0, 0, 1, 1,
2.743547, 0.762041, 1.640701, 1, 1, 1, 1, 1,
2.953573, 0.8141761, 1.71254, 1, 1, 1, 1, 1,
2.960876, 0.4708247, 1.488067, 1, 1, 1, 1, 1,
2.986043, -0.3290452, 1.09733, 1, 1, 1, 1, 1,
3.027733, -0.9150625, 0.9351277, 1, 1, 1, 1, 1,
3.060178, -1.404668, 0.7248803, 1, 1, 1, 1, 1,
3.123409, -0.8876407, 3.391066, 1, 1, 1, 1, 1
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
var radius = 9.583907;
var distance = 33.66307;
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
mvMatrix.translate( 0.1550999, -0.2243193, 0.020998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66307);
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
