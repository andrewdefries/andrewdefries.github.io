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
-3.419421, 0.8055716, -2.859042, 1, 0, 0, 1,
-3.020385, -0.7981359, -3.567611, 1, 0.007843138, 0, 1,
-2.838719, 0.8423907, -1.433756, 1, 0.01176471, 0, 1,
-2.592282, 0.2059123, -0.1073994, 1, 0.01960784, 0, 1,
-2.392745, -1.014438, -1.20715, 1, 0.02352941, 0, 1,
-2.345286, -0.8560324, -1.495443, 1, 0.03137255, 0, 1,
-2.340317, 1.834707, -0.6198745, 1, 0.03529412, 0, 1,
-2.251949, -1.078418, -2.502119, 1, 0.04313726, 0, 1,
-2.206788, 0.7444128, -0.5221331, 1, 0.04705882, 0, 1,
-2.185727, -0.3493142, -2.82111, 1, 0.05490196, 0, 1,
-2.163395, 0.4723577, -2.440895, 1, 0.05882353, 0, 1,
-2.149896, 0.7637011, -1.612332, 1, 0.06666667, 0, 1,
-2.059591, 0.6063305, -1.261575, 1, 0.07058824, 0, 1,
-2.04614, 1.338897, -0.3184163, 1, 0.07843138, 0, 1,
-2.018366, -0.6528355, -1.820181, 1, 0.08235294, 0, 1,
-2.005835, -0.7405465, -2.324535, 1, 0.09019608, 0, 1,
-2.000981, -1.104389, -2.311352, 1, 0.09411765, 0, 1,
-1.994593, -1.095095, -1.659782, 1, 0.1019608, 0, 1,
-1.992788, -0.1128827, -0.5936221, 1, 0.1098039, 0, 1,
-1.934302, -0.313934, -1.747226, 1, 0.1137255, 0, 1,
-1.916632, 1.351413, -0.132333, 1, 0.1215686, 0, 1,
-1.915708, -0.1299925, -0.8739323, 1, 0.1254902, 0, 1,
-1.904877, -2.278446, -3.324531, 1, 0.1333333, 0, 1,
-1.895244, -0.7874259, -2.664011, 1, 0.1372549, 0, 1,
-1.882409, -0.4590446, -3.159528, 1, 0.145098, 0, 1,
-1.867709, 1.612054, -0.862634, 1, 0.1490196, 0, 1,
-1.865321, -0.950532, -2.045083, 1, 0.1568628, 0, 1,
-1.861869, -1.898027, -2.180483, 1, 0.1607843, 0, 1,
-1.860451, 0.7126025, -2.133188, 1, 0.1686275, 0, 1,
-1.859388, 0.4118762, -1.809634, 1, 0.172549, 0, 1,
-1.844768, -0.6540483, -2.283027, 1, 0.1803922, 0, 1,
-1.834731, 1.079213, -1.794023, 1, 0.1843137, 0, 1,
-1.816272, -0.3655261, -1.85308, 1, 0.1921569, 0, 1,
-1.80382, -0.9806229, -2.884697, 1, 0.1960784, 0, 1,
-1.799585, 0.6920456, -0.6097133, 1, 0.2039216, 0, 1,
-1.797733, 2.282612, -0.2620114, 1, 0.2117647, 0, 1,
-1.776313, 1.190029, -1.755545, 1, 0.2156863, 0, 1,
-1.772797, -1.353389, -1.972594, 1, 0.2235294, 0, 1,
-1.771838, 0.4052229, -1.159577, 1, 0.227451, 0, 1,
-1.763435, 0.2960424, -2.350943, 1, 0.2352941, 0, 1,
-1.762708, 0.3351534, -2.471887, 1, 0.2392157, 0, 1,
-1.758481, 0.5598663, -3.192109, 1, 0.2470588, 0, 1,
-1.689082, -0.8913684, -1.588999, 1, 0.2509804, 0, 1,
-1.687939, 0.04103747, -2.451581, 1, 0.2588235, 0, 1,
-1.680526, 1.750073, -0.08329315, 1, 0.2627451, 0, 1,
-1.663731, 2.138798, 0.3669491, 1, 0.2705882, 0, 1,
-1.657658, -0.6862797, -3.087775, 1, 0.2745098, 0, 1,
-1.635704, 1.373426, -0.8426966, 1, 0.282353, 0, 1,
-1.608297, -0.2797497, 0.6628197, 1, 0.2862745, 0, 1,
-1.593272, -0.557817, -2.156556, 1, 0.2941177, 0, 1,
-1.58984, 1.4998, -1.346186, 1, 0.3019608, 0, 1,
-1.575879, 0.9186445, -1.3948, 1, 0.3058824, 0, 1,
-1.57333, -1.796593, -3.083067, 1, 0.3137255, 0, 1,
-1.572397, -1.530652, 0.7547132, 1, 0.3176471, 0, 1,
-1.555051, 0.1985144, -2.394729, 1, 0.3254902, 0, 1,
-1.554628, -0.467349, -0.8861359, 1, 0.3294118, 0, 1,
-1.541901, 0.8689823, -1.719905, 1, 0.3372549, 0, 1,
-1.53097, -0.4865011, -0.02301851, 1, 0.3411765, 0, 1,
-1.517144, 0.1090495, -1.241223, 1, 0.3490196, 0, 1,
-1.515237, -0.4912382, -1.988191, 1, 0.3529412, 0, 1,
-1.513339, 0.4907004, -2.088308, 1, 0.3607843, 0, 1,
-1.502077, -0.1668043, -2.224427, 1, 0.3647059, 0, 1,
-1.499579, -0.9929104, -3.4589, 1, 0.372549, 0, 1,
-1.498688, 0.5876914, -1.030746, 1, 0.3764706, 0, 1,
-1.472908, -1.425735, -2.791256, 1, 0.3843137, 0, 1,
-1.468967, -0.3780232, -3.687204, 1, 0.3882353, 0, 1,
-1.461086, 2.138612, 0.1512749, 1, 0.3960784, 0, 1,
-1.455187, -1.412034, -3.225753, 1, 0.4039216, 0, 1,
-1.448892, -0.2771847, -0.2358352, 1, 0.4078431, 0, 1,
-1.420395, 0.545085, -0.168497, 1, 0.4156863, 0, 1,
-1.414664, -0.9014956, 0.2663698, 1, 0.4196078, 0, 1,
-1.413229, -1.148986, -2.227093, 1, 0.427451, 0, 1,
-1.404629, 0.2009116, -2.484838, 1, 0.4313726, 0, 1,
-1.399781, 1.100745, -2.209266, 1, 0.4392157, 0, 1,
-1.391218, 0.8015719, -1.665356, 1, 0.4431373, 0, 1,
-1.391192, 0.7596443, -0.394962, 1, 0.4509804, 0, 1,
-1.390011, 1.116713, -2.269337, 1, 0.454902, 0, 1,
-1.386317, -0.9564776, -1.132156, 1, 0.4627451, 0, 1,
-1.380772, -0.5927015, -4.336354, 1, 0.4666667, 0, 1,
-1.379804, -0.6971297, -2.483575, 1, 0.4745098, 0, 1,
-1.379233, -0.2387227, -2.547743, 1, 0.4784314, 0, 1,
-1.372137, 0.007821746, -0.04999652, 1, 0.4862745, 0, 1,
-1.370428, 0.3784617, -1.984645, 1, 0.4901961, 0, 1,
-1.370084, 0.8955156, -0.3935892, 1, 0.4980392, 0, 1,
-1.36874, -1.025895, -5.439123, 1, 0.5058824, 0, 1,
-1.367873, 0.1419078, -0.5720614, 1, 0.509804, 0, 1,
-1.362367, 0.2588432, -1.533049, 1, 0.5176471, 0, 1,
-1.361552, 0.8605672, -1.852275, 1, 0.5215687, 0, 1,
-1.358575, 0.5269445, -1.549423, 1, 0.5294118, 0, 1,
-1.349603, 0.2222702, -0.9010571, 1, 0.5333334, 0, 1,
-1.339649, 0.7429314, -1.588051, 1, 0.5411765, 0, 1,
-1.338219, -1.21914, -2.304448, 1, 0.5450981, 0, 1,
-1.3364, -0.2408027, -2.733755, 1, 0.5529412, 0, 1,
-1.335903, -2.167337, -4.404389, 1, 0.5568628, 0, 1,
-1.332845, 0.1309382, -1.345544, 1, 0.5647059, 0, 1,
-1.322043, 1.637146, 1.220621, 1, 0.5686275, 0, 1,
-1.319645, -0.9731883, -2.863066, 1, 0.5764706, 0, 1,
-1.311863, -1.367112, -2.636877, 1, 0.5803922, 0, 1,
-1.311729, -0.2288293, -2.632443, 1, 0.5882353, 0, 1,
-1.30488, 0.05498544, -1.176227, 1, 0.5921569, 0, 1,
-1.298321, -1.347312, -1.423975, 1, 0.6, 0, 1,
-1.295421, 1.47866, 0.8647632, 1, 0.6078432, 0, 1,
-1.287844, 0.1590765, -0.8615223, 1, 0.6117647, 0, 1,
-1.286267, 0.9499444, 0.1257768, 1, 0.6196079, 0, 1,
-1.285204, -0.584991, -1.351612, 1, 0.6235294, 0, 1,
-1.271173, 1.399355, -3.445537, 1, 0.6313726, 0, 1,
-1.267825, -0.6876434, -0.7454875, 1, 0.6352941, 0, 1,
-1.258313, 1.526626, 0.3727123, 1, 0.6431373, 0, 1,
-1.249468, 0.1412995, -0.08928613, 1, 0.6470588, 0, 1,
-1.246136, -0.4636055, -1.86338, 1, 0.654902, 0, 1,
-1.245628, -0.1930954, -3.034573, 1, 0.6588235, 0, 1,
-1.241422, -0.0455666, -2.442945, 1, 0.6666667, 0, 1,
-1.232501, 2.194184, 0.5845743, 1, 0.6705883, 0, 1,
-1.228191, -0.1129911, -2.801661, 1, 0.6784314, 0, 1,
-1.216961, -0.4260581, -3.747957, 1, 0.682353, 0, 1,
-1.216612, -0.6594042, -3.267269, 1, 0.6901961, 0, 1,
-1.216059, 0.3295282, -0.920163, 1, 0.6941177, 0, 1,
-1.215772, -0.9797386, -1.981015, 1, 0.7019608, 0, 1,
-1.203127, 0.4480248, -1.54957, 1, 0.7098039, 0, 1,
-1.200181, 2.263634, -2.080426, 1, 0.7137255, 0, 1,
-1.195311, -0.4508052, -0.9297174, 1, 0.7215686, 0, 1,
-1.193318, 0.704191, -1.632425, 1, 0.7254902, 0, 1,
-1.193143, -1.709542, -1.677378, 1, 0.7333333, 0, 1,
-1.191719, 0.6324351, -0.8635744, 1, 0.7372549, 0, 1,
-1.181328, 1.80628, -1.082389, 1, 0.7450981, 0, 1,
-1.178791, -1.280509, -2.243254, 1, 0.7490196, 0, 1,
-1.168116, 0.6823178, -1.334122, 1, 0.7568628, 0, 1,
-1.155553, -1.086018, -1.384676, 1, 0.7607843, 0, 1,
-1.155484, -0.8946273, -1.449404, 1, 0.7686275, 0, 1,
-1.152012, -0.5566228, -1.667831, 1, 0.772549, 0, 1,
-1.139441, -0.6203666, -2.550202, 1, 0.7803922, 0, 1,
-1.135329, -0.3825814, -1.426719, 1, 0.7843137, 0, 1,
-1.127981, 0.4771868, -0.0924475, 1, 0.7921569, 0, 1,
-1.09697, -0.1304498, -0.73997, 1, 0.7960784, 0, 1,
-1.088576, -0.5664475, 0.1055909, 1, 0.8039216, 0, 1,
-1.08296, -2.101395, -1.275808, 1, 0.8117647, 0, 1,
-1.081588, 0.04040194, -0.4961793, 1, 0.8156863, 0, 1,
-1.070296, 2.068074, -2.002169, 1, 0.8235294, 0, 1,
-1.065747, 0.0869251, 1.065847, 1, 0.827451, 0, 1,
-1.055818, -1.124309, -3.02845, 1, 0.8352941, 0, 1,
-1.051222, -0.7168369, -0.1675744, 1, 0.8392157, 0, 1,
-1.049499, 0.6258067, 0.05997121, 1, 0.8470588, 0, 1,
-1.045986, -1.294101, -3.182937, 1, 0.8509804, 0, 1,
-1.044449, -0.3434254, -1.861547, 1, 0.8588235, 0, 1,
-1.044267, 1.359615, -1.968529, 1, 0.8627451, 0, 1,
-1.041374, 1.198335, 0.3541278, 1, 0.8705882, 0, 1,
-1.035545, 1.155627, -1.229396, 1, 0.8745098, 0, 1,
-1.035117, 0.7085481, -1.288286, 1, 0.8823529, 0, 1,
-1.033392, 0.1603911, -1.096523, 1, 0.8862745, 0, 1,
-1.031548, -0.02988543, 0.2429823, 1, 0.8941177, 0, 1,
-1.025542, 0.3903938, -0.4894227, 1, 0.8980392, 0, 1,
-1.023058, 0.3696161, -3.392482, 1, 0.9058824, 0, 1,
-1.022247, -0.3488552, -2.919807, 1, 0.9137255, 0, 1,
-1.021075, 1.264597, 0.2220942, 1, 0.9176471, 0, 1,
-1.016483, 0.03856212, -0.5657917, 1, 0.9254902, 0, 1,
-1.008718, 0.207116, -1.18155, 1, 0.9294118, 0, 1,
-1.001667, 0.5441031, -0.9820659, 1, 0.9372549, 0, 1,
-0.9994093, -0.5600793, -1.46398, 1, 0.9411765, 0, 1,
-0.997689, -2.027451, -3.069944, 1, 0.9490196, 0, 1,
-0.9968427, -1.653076, -4.14571, 1, 0.9529412, 0, 1,
-0.9965632, 0.6832132, 0.1173528, 1, 0.9607843, 0, 1,
-0.9910476, -0.2717585, -2.404398, 1, 0.9647059, 0, 1,
-0.9847957, 0.03206555, -1.037325, 1, 0.972549, 0, 1,
-0.9765841, -0.6156915, -2.813365, 1, 0.9764706, 0, 1,
-0.9746909, 2.070143, -2.347914, 1, 0.9843137, 0, 1,
-0.9734377, -1.320569, -3.585368, 1, 0.9882353, 0, 1,
-0.9728379, -0.3426968, -2.999019, 1, 0.9960784, 0, 1,
-0.9723796, -1.525968, -1.587738, 0.9960784, 1, 0, 1,
-0.97195, 0.07001838, -2.883485, 0.9921569, 1, 0, 1,
-0.9679121, -0.001219063, -1.519861, 0.9843137, 1, 0, 1,
-0.963149, -0.4818134, -1.409173, 0.9803922, 1, 0, 1,
-0.9630336, -0.7301808, -4.165821, 0.972549, 1, 0, 1,
-0.9615759, 0.5134683, -0.3258868, 0.9686275, 1, 0, 1,
-0.9584855, 0.01434324, -1.656359, 0.9607843, 1, 0, 1,
-0.9575515, -0.8628636, -4.92605, 0.9568627, 1, 0, 1,
-0.95703, -1.182585, -1.972663, 0.9490196, 1, 0, 1,
-0.9569213, 0.07074325, -2.134851, 0.945098, 1, 0, 1,
-0.9528576, 0.5444948, 0.0006017719, 0.9372549, 1, 0, 1,
-0.9520623, -0.2415563, -3.724445, 0.9333333, 1, 0, 1,
-0.9520326, 0.09675108, -2.017149, 0.9254902, 1, 0, 1,
-0.9519362, -0.5188118, -4.379732, 0.9215686, 1, 0, 1,
-0.9497434, -0.6957902, -1.562443, 0.9137255, 1, 0, 1,
-0.94846, -1.0997, -1.512897, 0.9098039, 1, 0, 1,
-0.9411597, 1.423703, -2.030314, 0.9019608, 1, 0, 1,
-0.9410623, 0.65159, -1.38132, 0.8941177, 1, 0, 1,
-0.939573, -0.9838597, -3.201647, 0.8901961, 1, 0, 1,
-0.9357646, -1.009533, -2.959291, 0.8823529, 1, 0, 1,
-0.9319821, -1.099817, -0.924054, 0.8784314, 1, 0, 1,
-0.9316552, -0.2024255, 0.6024091, 0.8705882, 1, 0, 1,
-0.9297858, 1.065359, 0.2699992, 0.8666667, 1, 0, 1,
-0.9289623, 0.5051822, -1.500855, 0.8588235, 1, 0, 1,
-0.9269221, 0.663255, -0.3124177, 0.854902, 1, 0, 1,
-0.9184428, -0.3261167, -1.384358, 0.8470588, 1, 0, 1,
-0.9137828, 0.3324294, -1.772744, 0.8431373, 1, 0, 1,
-0.9119014, -1.339376, -2.93847, 0.8352941, 1, 0, 1,
-0.9077385, 0.921655, -1.640979, 0.8313726, 1, 0, 1,
-0.9064749, 0.3539441, -0.7392012, 0.8235294, 1, 0, 1,
-0.9051998, 0.5743015, -0.6930438, 0.8196079, 1, 0, 1,
-0.900518, 1.507884, 1.117425, 0.8117647, 1, 0, 1,
-0.9002404, 0.09580166, -2.193557, 0.8078431, 1, 0, 1,
-0.8959765, -0.3393904, -2.504402, 0.8, 1, 0, 1,
-0.8933493, -1.127456, -3.230028, 0.7921569, 1, 0, 1,
-0.8919085, 0.2532907, -0.6305215, 0.7882353, 1, 0, 1,
-0.8917339, 0.3675021, -2.104611, 0.7803922, 1, 0, 1,
-0.891291, 0.2644194, 0.1422545, 0.7764706, 1, 0, 1,
-0.8889173, 0.6826561, -1.369499, 0.7686275, 1, 0, 1,
-0.88252, 0.9173964, -0.7254373, 0.7647059, 1, 0, 1,
-0.8641886, -1.410556, -0.8011503, 0.7568628, 1, 0, 1,
-0.863694, 0.1106536, -2.162666, 0.7529412, 1, 0, 1,
-0.8577136, -1.41862, -3.39238, 0.7450981, 1, 0, 1,
-0.857703, -2.180133, -3.890425, 0.7411765, 1, 0, 1,
-0.8556036, 1.269552, -0.6659592, 0.7333333, 1, 0, 1,
-0.8548558, 1.137562, -0.5633987, 0.7294118, 1, 0, 1,
-0.8535996, 0.8021103, 0.3691972, 0.7215686, 1, 0, 1,
-0.8498018, -1.697366, -2.445172, 0.7176471, 1, 0, 1,
-0.8477373, 0.01772179, -1.846243, 0.7098039, 1, 0, 1,
-0.8423946, -0.09533435, -0.7823176, 0.7058824, 1, 0, 1,
-0.8405716, -0.5495331, -2.144777, 0.6980392, 1, 0, 1,
-0.8399213, -1.045421, -3.172483, 0.6901961, 1, 0, 1,
-0.83796, 0.1673022, -2.038298, 0.6862745, 1, 0, 1,
-0.8378181, 1.481653, -1.436686, 0.6784314, 1, 0, 1,
-0.8374489, 0.530882, -2.10065, 0.6745098, 1, 0, 1,
-0.8356776, 1.430297, -0.5135613, 0.6666667, 1, 0, 1,
-0.8300936, 0.1669812, -2.203462, 0.6627451, 1, 0, 1,
-0.8299925, 0.6298453, -0.9071756, 0.654902, 1, 0, 1,
-0.8284198, -0.5245975, -1.330418, 0.6509804, 1, 0, 1,
-0.8261278, -0.1916786, -1.832678, 0.6431373, 1, 0, 1,
-0.818171, 0.2968975, -1.460185, 0.6392157, 1, 0, 1,
-0.8156955, -0.6479673, -3.905098, 0.6313726, 1, 0, 1,
-0.8134037, -0.02130263, -0.5592712, 0.627451, 1, 0, 1,
-0.8118333, -0.8460205, -1.8146, 0.6196079, 1, 0, 1,
-0.8111783, -0.105427, -1.014115, 0.6156863, 1, 0, 1,
-0.8101899, 0.8484697, -1.8561, 0.6078432, 1, 0, 1,
-0.8078153, -1.527402, -2.526266, 0.6039216, 1, 0, 1,
-0.7954203, 0.9448147, -0.4043676, 0.5960785, 1, 0, 1,
-0.7888064, -0.810383, -1.793428, 0.5882353, 1, 0, 1,
-0.7879315, -0.6687344, -1.35255, 0.5843138, 1, 0, 1,
-0.7878557, 0.9820981, 0.3613489, 0.5764706, 1, 0, 1,
-0.7845686, 0.2456509, 0.2597671, 0.572549, 1, 0, 1,
-0.7834771, 0.4688678, -0.4901281, 0.5647059, 1, 0, 1,
-0.7800716, 1.856021, -1.450522, 0.5607843, 1, 0, 1,
-0.7798836, 0.1663889, -1.422096, 0.5529412, 1, 0, 1,
-0.7788616, -1.363851, -2.487658, 0.5490196, 1, 0, 1,
-0.7747508, 0.3344212, -2.215678, 0.5411765, 1, 0, 1,
-0.7675623, -2.59391, -2.292085, 0.5372549, 1, 0, 1,
-0.7654982, -0.4022409, -2.777126, 0.5294118, 1, 0, 1,
-0.7648168, -0.1857203, -1.71855, 0.5254902, 1, 0, 1,
-0.7633277, -0.1239121, -2.512408, 0.5176471, 1, 0, 1,
-0.7535803, -0.1928274, 0.7709761, 0.5137255, 1, 0, 1,
-0.7512149, -0.6150994, -2.847847, 0.5058824, 1, 0, 1,
-0.7490447, 0.9078181, -2.321239, 0.5019608, 1, 0, 1,
-0.7449934, -0.6118528, -1.966457, 0.4941176, 1, 0, 1,
-0.7414436, -0.8146433, -2.207544, 0.4862745, 1, 0, 1,
-0.7383548, -0.2612893, -2.193487, 0.4823529, 1, 0, 1,
-0.7285329, -2.112008, -2.878038, 0.4745098, 1, 0, 1,
-0.7273485, -0.81381, -2.139249, 0.4705882, 1, 0, 1,
-0.7262331, 0.5344046, 0.6536635, 0.4627451, 1, 0, 1,
-0.7227505, 0.5093163, -0.9536697, 0.4588235, 1, 0, 1,
-0.7205516, 1.08402, 0.2977667, 0.4509804, 1, 0, 1,
-0.718784, 0.197128, -0.3869653, 0.4470588, 1, 0, 1,
-0.7183858, -0.4795404, -0.8556594, 0.4392157, 1, 0, 1,
-0.7158675, -0.6755663, -2.522402, 0.4352941, 1, 0, 1,
-0.7096568, -0.7030501, -2.857488, 0.427451, 1, 0, 1,
-0.704744, 0.4582565, -1.582127, 0.4235294, 1, 0, 1,
-0.7007016, -2.489667, -2.466004, 0.4156863, 1, 0, 1,
-0.6993755, 0.6511931, -1.233297, 0.4117647, 1, 0, 1,
-0.6856732, -0.1471286, -2.849587, 0.4039216, 1, 0, 1,
-0.6829649, 0.04547229, -1.570215, 0.3960784, 1, 0, 1,
-0.675239, -0.1449798, -0.4589257, 0.3921569, 1, 0, 1,
-0.675212, 1.479404, -0.8919467, 0.3843137, 1, 0, 1,
-0.6749936, -0.9998146, -3.150426, 0.3803922, 1, 0, 1,
-0.6642169, 0.7203574, -0.2320476, 0.372549, 1, 0, 1,
-0.662087, 0.3880408, -0.6425345, 0.3686275, 1, 0, 1,
-0.6606302, 1.008448, 0.3760991, 0.3607843, 1, 0, 1,
-0.6592539, -0.6609265, -1.529378, 0.3568628, 1, 0, 1,
-0.6591551, -1.76294, -0.8998285, 0.3490196, 1, 0, 1,
-0.6475585, -1.030591, -2.796102, 0.345098, 1, 0, 1,
-0.6395755, 1.060745, 0.4903235, 0.3372549, 1, 0, 1,
-0.6326847, -0.3932098, -1.385486, 0.3333333, 1, 0, 1,
-0.6320457, 0.1347926, -2.820394, 0.3254902, 1, 0, 1,
-0.6295661, -0.5313351, -1.700357, 0.3215686, 1, 0, 1,
-0.626776, -0.9133465, -3.13258, 0.3137255, 1, 0, 1,
-0.623913, 1.528898, -0.0265275, 0.3098039, 1, 0, 1,
-0.6155427, -0.8065854, -2.831918, 0.3019608, 1, 0, 1,
-0.6138816, 1.042094, -1.676068, 0.2941177, 1, 0, 1,
-0.6112028, -1.345221, -2.345017, 0.2901961, 1, 0, 1,
-0.6109461, -0.252607, -2.4523, 0.282353, 1, 0, 1,
-0.6089491, -0.2071504, -1.284792, 0.2784314, 1, 0, 1,
-0.608191, 0.3674301, 0.5249537, 0.2705882, 1, 0, 1,
-0.6079895, 0.2696628, -2.362538, 0.2666667, 1, 0, 1,
-0.6051559, 0.1973335, -0.3170918, 0.2588235, 1, 0, 1,
-0.6051207, -0.2085373, -2.166414, 0.254902, 1, 0, 1,
-0.6047847, -1.782995, -4.047425, 0.2470588, 1, 0, 1,
-0.6044182, -0.05166628, -1.478067, 0.2431373, 1, 0, 1,
-0.6028422, -1.400549, -4.819347, 0.2352941, 1, 0, 1,
-0.5981835, 1.308686, 0.9507999, 0.2313726, 1, 0, 1,
-0.5945315, -0.9198332, -3.231691, 0.2235294, 1, 0, 1,
-0.5819256, 0.3370551, 0.3459289, 0.2196078, 1, 0, 1,
-0.5769691, -0.2402139, -5.10398, 0.2117647, 1, 0, 1,
-0.5747199, -0.4616061, -2.299436, 0.2078431, 1, 0, 1,
-0.5629171, -1.900361, -3.962606, 0.2, 1, 0, 1,
-0.5593195, -1.066226, -3.693062, 0.1921569, 1, 0, 1,
-0.5575382, 1.455683, 0.09646536, 0.1882353, 1, 0, 1,
-0.5543438, 1.152842, -1.00462, 0.1803922, 1, 0, 1,
-0.5506746, 0.4619003, -0.7974004, 0.1764706, 1, 0, 1,
-0.548587, -2.131221, -2.898286, 0.1686275, 1, 0, 1,
-0.5467309, 0.2548322, -0.3958508, 0.1647059, 1, 0, 1,
-0.5438855, -0.0591216, -2.629691, 0.1568628, 1, 0, 1,
-0.5405912, -0.0516512, -3.136052, 0.1529412, 1, 0, 1,
-0.5393378, -0.3800147, -1.330938, 0.145098, 1, 0, 1,
-0.5380983, 0.04897063, -3.288437, 0.1411765, 1, 0, 1,
-0.5342343, 0.04929191, -2.306643, 0.1333333, 1, 0, 1,
-0.5342082, -0.2995228, -2.221294, 0.1294118, 1, 0, 1,
-0.5292604, -0.1113756, -2.477582, 0.1215686, 1, 0, 1,
-0.5279416, 0.07444089, -0.5779568, 0.1176471, 1, 0, 1,
-0.5267623, 2.188545, -1.70626, 0.1098039, 1, 0, 1,
-0.5267492, -0.2606207, -2.784055, 0.1058824, 1, 0, 1,
-0.521307, 1.23962, 0.3858393, 0.09803922, 1, 0, 1,
-0.5156665, 0.3756256, -0.7061864, 0.09019608, 1, 0, 1,
-0.5141183, -0.8689167, -2.818523, 0.08627451, 1, 0, 1,
-0.5138726, 0.9221622, -0.4762846, 0.07843138, 1, 0, 1,
-0.5116487, -0.2475755, -3.00551, 0.07450981, 1, 0, 1,
-0.5087324, -1.039611, -3.92377, 0.06666667, 1, 0, 1,
-0.5071447, 1.47266, 0.8475647, 0.0627451, 1, 0, 1,
-0.5046986, 0.8418422, -2.118997, 0.05490196, 1, 0, 1,
-0.5014665, -0.5577116, -3.103923, 0.05098039, 1, 0, 1,
-0.4993514, 0.836217, -0.4605864, 0.04313726, 1, 0, 1,
-0.4973034, 0.3122824, -3.295397, 0.03921569, 1, 0, 1,
-0.4969307, -0.03743167, -3.484778, 0.03137255, 1, 0, 1,
-0.4964485, -0.3738501, -2.016976, 0.02745098, 1, 0, 1,
-0.4931752, 0.5729628, 0.1767342, 0.01960784, 1, 0, 1,
-0.4902876, 1.57069, -0.7322513, 0.01568628, 1, 0, 1,
-0.4898227, 0.3769893, -1.309683, 0.007843138, 1, 0, 1,
-0.4895591, -1.227943, -0.9632488, 0.003921569, 1, 0, 1,
-0.4878488, -0.1307685, -1.413576, 0, 1, 0.003921569, 1,
-0.4841026, 0.2841808, -0.2311551, 0, 1, 0.01176471, 1,
-0.4769086, 0.2341324, -1.228584, 0, 1, 0.01568628, 1,
-0.4664655, 0.7946193, 0.7630271, 0, 1, 0.02352941, 1,
-0.4649352, 1.192754, -2.27505, 0, 1, 0.02745098, 1,
-0.4581986, -1.458796, -2.154466, 0, 1, 0.03529412, 1,
-0.455303, 0.2878698, 1.100707, 0, 1, 0.03921569, 1,
-0.4524886, -1.47564, -1.789817, 0, 1, 0.04705882, 1,
-0.4514023, -0.8300305, -3.134906, 0, 1, 0.05098039, 1,
-0.4478127, 0.873516, -0.1387841, 0, 1, 0.05882353, 1,
-0.4429388, -0.6684566, -0.7826096, 0, 1, 0.0627451, 1,
-0.4426741, -0.50225, -2.656977, 0, 1, 0.07058824, 1,
-0.4423729, -1.266217, -3.322415, 0, 1, 0.07450981, 1,
-0.4412438, 0.785036, 0.674555, 0, 1, 0.08235294, 1,
-0.4388265, -0.4015803, -0.8205278, 0, 1, 0.08627451, 1,
-0.4382762, -0.6285872, -1.290239, 0, 1, 0.09411765, 1,
-0.4375043, 0.5034326, 0.3375292, 0, 1, 0.1019608, 1,
-0.4348231, -2.240259, -2.657321, 0, 1, 0.1058824, 1,
-0.4259966, 0.6886595, -1.816889, 0, 1, 0.1137255, 1,
-0.4201954, 0.7540794, -0.5385385, 0, 1, 0.1176471, 1,
-0.4189667, -0.8313757, -2.900796, 0, 1, 0.1254902, 1,
-0.4172546, -2.425951, -2.590909, 0, 1, 0.1294118, 1,
-0.4168503, -0.7195176, -2.459611, 0, 1, 0.1372549, 1,
-0.4069328, -0.3338605, -3.677599, 0, 1, 0.1411765, 1,
-0.4059862, 1.402979, 0.1290906, 0, 1, 0.1490196, 1,
-0.4054891, -0.06211837, -2.850931, 0, 1, 0.1529412, 1,
-0.4053107, 0.4903731, 0.2221389, 0, 1, 0.1607843, 1,
-0.4050694, -0.76997, -2.957427, 0, 1, 0.1647059, 1,
-0.4031468, 1.800841, -0.4297912, 0, 1, 0.172549, 1,
-0.4019198, -0.3616285, -0.6804453, 0, 1, 0.1764706, 1,
-0.3981059, -0.6008517, -2.977897, 0, 1, 0.1843137, 1,
-0.3976447, -0.4572813, -4.227321, 0, 1, 0.1882353, 1,
-0.3953362, -2.645072, -4.317589, 0, 1, 0.1960784, 1,
-0.3921068, -1.004901, -3.063242, 0, 1, 0.2039216, 1,
-0.3900355, 0.2769966, -1.436806, 0, 1, 0.2078431, 1,
-0.3886968, 0.9980029, 0.1382978, 0, 1, 0.2156863, 1,
-0.3828378, 1.149556, -1.843838, 0, 1, 0.2196078, 1,
-0.3801594, -1.285619, -3.743073, 0, 1, 0.227451, 1,
-0.3794405, 1.550229, -0.8457441, 0, 1, 0.2313726, 1,
-0.3791964, -1.121239, -2.510662, 0, 1, 0.2392157, 1,
-0.3785708, -0.2054639, -4.205691, 0, 1, 0.2431373, 1,
-0.3778912, 1.606454, -0.04318501, 0, 1, 0.2509804, 1,
-0.3747624, 0.7211795, -0.9382473, 0, 1, 0.254902, 1,
-0.3743256, -0.625851, -2.074185, 0, 1, 0.2627451, 1,
-0.3647007, 1.22986, 0.8151439, 0, 1, 0.2666667, 1,
-0.3610159, 0.7066645, 0.03956411, 0, 1, 0.2745098, 1,
-0.360982, -1.689186, -3.068903, 0, 1, 0.2784314, 1,
-0.3603967, -0.1556642, -1.859481, 0, 1, 0.2862745, 1,
-0.3590559, -0.2751283, -3.046191, 0, 1, 0.2901961, 1,
-0.3573525, 1.204512, 0.08043864, 0, 1, 0.2980392, 1,
-0.3567397, 0.789019, -0.1366926, 0, 1, 0.3058824, 1,
-0.3545169, 0.228076, -0.8888571, 0, 1, 0.3098039, 1,
-0.3511479, 0.8768672, 0.1068395, 0, 1, 0.3176471, 1,
-0.3477959, 0.0195016, -1.900615, 0, 1, 0.3215686, 1,
-0.3423836, -0.003364734, -0.2909, 0, 1, 0.3294118, 1,
-0.3415172, -0.5506179, -2.514848, 0, 1, 0.3333333, 1,
-0.3409554, -1.355686, -3.842412, 0, 1, 0.3411765, 1,
-0.3408418, 0.03474972, -1.584999, 0, 1, 0.345098, 1,
-0.3395532, -2.534407, -3.0972, 0, 1, 0.3529412, 1,
-0.3387801, -0.9874291, -3.921414, 0, 1, 0.3568628, 1,
-0.3346726, -1.215851, -2.92535, 0, 1, 0.3647059, 1,
-0.3306866, 0.415767, -0.5083109, 0, 1, 0.3686275, 1,
-0.3237497, -1.092775, -2.295905, 0, 1, 0.3764706, 1,
-0.3234739, 0.256082, -1.495968, 0, 1, 0.3803922, 1,
-0.3204892, -0.3755262, -3.430536, 0, 1, 0.3882353, 1,
-0.3176681, 1.693984, 0.2931707, 0, 1, 0.3921569, 1,
-0.3155248, -0.2601502, -2.201906, 0, 1, 0.4, 1,
-0.3085793, 0.8191198, -1.0574, 0, 1, 0.4078431, 1,
-0.308362, 0.2363196, -1.80981, 0, 1, 0.4117647, 1,
-0.3074968, -0.06735781, -2.543361, 0, 1, 0.4196078, 1,
-0.3073035, 0.3867742, 0.5056301, 0, 1, 0.4235294, 1,
-0.3051223, -1.575406, -3.025726, 0, 1, 0.4313726, 1,
-0.3030481, 0.4006923, -1.87777, 0, 1, 0.4352941, 1,
-0.301463, 0.3201446, -0.5986816, 0, 1, 0.4431373, 1,
-0.2979564, 0.3904047, -0.6271295, 0, 1, 0.4470588, 1,
-0.2966169, -0.3159508, -3.683005, 0, 1, 0.454902, 1,
-0.2938346, -0.3525307, -4.727595, 0, 1, 0.4588235, 1,
-0.2931055, -0.6723998, -1.874346, 0, 1, 0.4666667, 1,
-0.2906738, 1.301029, -0.4012767, 0, 1, 0.4705882, 1,
-0.289402, 0.4942787, 0.2088449, 0, 1, 0.4784314, 1,
-0.2859301, 1.432933, -1.057989, 0, 1, 0.4823529, 1,
-0.2847389, 0.3873157, -0.6517563, 0, 1, 0.4901961, 1,
-0.2842096, -0.9592524, -2.600865, 0, 1, 0.4941176, 1,
-0.2841173, 0.4876084, -2.377579, 0, 1, 0.5019608, 1,
-0.2828711, 0.5011243, 0.01943877, 0, 1, 0.509804, 1,
-0.2724313, -1.365983, -4.422048, 0, 1, 0.5137255, 1,
-0.2701144, 0.6484585, -0.9483602, 0, 1, 0.5215687, 1,
-0.2662145, -1.78679, -4.407495, 0, 1, 0.5254902, 1,
-0.2661633, -1.722144, -3.13425, 0, 1, 0.5333334, 1,
-0.2628944, 0.7937187, 0.2019817, 0, 1, 0.5372549, 1,
-0.2621803, 0.3341225, 1.543513, 0, 1, 0.5450981, 1,
-0.2620716, -0.27307, -2.574381, 0, 1, 0.5490196, 1,
-0.2620667, -1.330744, -2.235473, 0, 1, 0.5568628, 1,
-0.2576563, -1.782557, -2.487537, 0, 1, 0.5607843, 1,
-0.2540312, -0.7672338, -2.632663, 0, 1, 0.5686275, 1,
-0.2530607, 0.1390324, -1.248607, 0, 1, 0.572549, 1,
-0.2483796, -0.00597752, -2.030535, 0, 1, 0.5803922, 1,
-0.245593, -0.253998, -2.817895, 0, 1, 0.5843138, 1,
-0.2419838, 1.433246, -1.073323, 0, 1, 0.5921569, 1,
-0.2409436, -0.1070464, -1.844521, 0, 1, 0.5960785, 1,
-0.2405059, 0.7980377, 1.419479, 0, 1, 0.6039216, 1,
-0.2393919, 0.3688963, 0.3764447, 0, 1, 0.6117647, 1,
-0.2390465, -0.9801915, -2.887038, 0, 1, 0.6156863, 1,
-0.2339675, -0.2660689, -3.150232, 0, 1, 0.6235294, 1,
-0.2304674, -0.9454409, -3.127235, 0, 1, 0.627451, 1,
-0.221555, 0.1429672, -0.4192155, 0, 1, 0.6352941, 1,
-0.2180614, -0.8222573, -2.05252, 0, 1, 0.6392157, 1,
-0.2163055, 2.327057, 0.5383809, 0, 1, 0.6470588, 1,
-0.2136106, -1.219514, -2.846073, 0, 1, 0.6509804, 1,
-0.2099293, 0.03765219, -1.875088, 0, 1, 0.6588235, 1,
-0.2089274, 0.05749208, 1.024589, 0, 1, 0.6627451, 1,
-0.2053504, -0.8944889, -3.974386, 0, 1, 0.6705883, 1,
-0.2035288, 0.1508739, -1.414359, 0, 1, 0.6745098, 1,
-0.2032134, -1.257401, -4.117613, 0, 1, 0.682353, 1,
-0.1988631, 0.6463757, -0.9945715, 0, 1, 0.6862745, 1,
-0.1982035, 0.8329545, 0.1884075, 0, 1, 0.6941177, 1,
-0.1894748, -0.4852879, -2.33438, 0, 1, 0.7019608, 1,
-0.1857874, 0.1475826, -0.9334971, 0, 1, 0.7058824, 1,
-0.184373, -0.04005995, -2.272822, 0, 1, 0.7137255, 1,
-0.1792666, -0.1246705, -2.314512, 0, 1, 0.7176471, 1,
-0.1785571, 1.136764, 0.05757787, 0, 1, 0.7254902, 1,
-0.1747651, -0.403662, -3.552111, 0, 1, 0.7294118, 1,
-0.1692808, -0.3950831, -1.981082, 0, 1, 0.7372549, 1,
-0.1652935, -1.098482, -3.322568, 0, 1, 0.7411765, 1,
-0.1622369, 1.096423, 0.4176915, 0, 1, 0.7490196, 1,
-0.1492094, -1.00564, -2.614975, 0, 1, 0.7529412, 1,
-0.148257, 0.288341, 1.318881, 0, 1, 0.7607843, 1,
-0.1475074, -0.4219634, -3.503484, 0, 1, 0.7647059, 1,
-0.1459784, -0.3783659, -2.144589, 0, 1, 0.772549, 1,
-0.145091, -0.2388583, -5.385554, 0, 1, 0.7764706, 1,
-0.1395079, -1.098831, -2.764785, 0, 1, 0.7843137, 1,
-0.13497, -1.507385, -2.829814, 0, 1, 0.7882353, 1,
-0.1335257, 0.6595415, -1.297898, 0, 1, 0.7960784, 1,
-0.1315525, 0.8991306, -1.950997, 0, 1, 0.8039216, 1,
-0.1217933, 0.1804644, -1.196361, 0, 1, 0.8078431, 1,
-0.1197348, -0.8714733, -1.584383, 0, 1, 0.8156863, 1,
-0.1112252, 1.261116, 0.729804, 0, 1, 0.8196079, 1,
-0.1111495, 0.7209703, -0.7175959, 0, 1, 0.827451, 1,
-0.1063902, -0.7057974, -2.470811, 0, 1, 0.8313726, 1,
-0.1050491, -2.068357, -2.909566, 0, 1, 0.8392157, 1,
-0.1023672, -0.08468837, -1.81166, 0, 1, 0.8431373, 1,
-0.09971903, 0.02718587, -2.185065, 0, 1, 0.8509804, 1,
-0.09946474, -0.2853624, -2.626678, 0, 1, 0.854902, 1,
-0.0961742, 0.4895259, -1.091993, 0, 1, 0.8627451, 1,
-0.09615143, 0.8350156, -0.1883641, 0, 1, 0.8666667, 1,
-0.09597775, 0.7126571, 1.039694, 0, 1, 0.8745098, 1,
-0.09548742, 0.2429081, 0.5720694, 0, 1, 0.8784314, 1,
-0.09205199, 1.850852, 0.9756646, 0, 1, 0.8862745, 1,
-0.0896204, 0.4886155, 0.7110957, 0, 1, 0.8901961, 1,
-0.08554858, -0.5884185, -3.023544, 0, 1, 0.8980392, 1,
-0.08536027, 0.8015727, 0.4886624, 0, 1, 0.9058824, 1,
-0.07933351, -0.2720121, -4.510031, 0, 1, 0.9098039, 1,
-0.0778271, -0.3153899, -3.518133, 0, 1, 0.9176471, 1,
-0.07669775, 0.1604359, -0.9544948, 0, 1, 0.9215686, 1,
-0.0757324, -0.3874423, -1.10163, 0, 1, 0.9294118, 1,
-0.07531363, 1.545939, -2.241465, 0, 1, 0.9333333, 1,
-0.07381792, 0.5668933, 0.2754501, 0, 1, 0.9411765, 1,
-0.07264625, 0.7580824, 1.926254, 0, 1, 0.945098, 1,
-0.07163732, -1.618006, -3.677563, 0, 1, 0.9529412, 1,
-0.07142793, 0.6544415, 0.9778901, 0, 1, 0.9568627, 1,
-0.06725793, -1.876207, -1.108961, 0, 1, 0.9647059, 1,
-0.06673869, -0.226854, -3.439915, 0, 1, 0.9686275, 1,
-0.05895929, -1.209983, -4.348211, 0, 1, 0.9764706, 1,
-0.05714084, 1.499178, -0.007769739, 0, 1, 0.9803922, 1,
-0.05555945, 0.08564328, 0.2196906, 0, 1, 0.9882353, 1,
-0.05350468, 0.7674857, 0.6614416, 0, 1, 0.9921569, 1,
-0.05057104, 1.125088, -0.5843122, 0, 1, 1, 1,
-0.04695059, -0.5395874, -3.658975, 0, 0.9921569, 1, 1,
-0.04665042, -1.640043, -3.85301, 0, 0.9882353, 1, 1,
-0.04513264, 0.279962, 0.06065883, 0, 0.9803922, 1, 1,
-0.0443342, -1.400721, -4.214345, 0, 0.9764706, 1, 1,
-0.04071526, 1.702677, -0.4091292, 0, 0.9686275, 1, 1,
-0.03743352, -0.9284695, -2.787851, 0, 0.9647059, 1, 1,
-0.03721178, 0.1631344, 0.5192156, 0, 0.9568627, 1, 1,
-0.03646109, -1.481328, -2.339635, 0, 0.9529412, 1, 1,
-0.02273487, -0.1920142, -3.897818, 0, 0.945098, 1, 1,
-0.003139381, 0.1621442, 0.2716628, 0, 0.9411765, 1, 1,
-0.002522441, 0.589738, 0.1323641, 0, 0.9333333, 1, 1,
0.003673358, 2.010527, 0.1074408, 0, 0.9294118, 1, 1,
0.004762269, 1.801085, 2.326322, 0, 0.9215686, 1, 1,
0.007418565, 0.427983, -0.03022015, 0, 0.9176471, 1, 1,
0.007682454, 0.7923214, 0.1665887, 0, 0.9098039, 1, 1,
0.01075096, 0.5285029, 0.37438, 0, 0.9058824, 1, 1,
0.01282467, 0.8595871, 0.9319272, 0, 0.8980392, 1, 1,
0.01796208, 1.389554, -0.2637439, 0, 0.8901961, 1, 1,
0.01873484, 1.264568, 2.943403, 0, 0.8862745, 1, 1,
0.02018978, -0.4727677, 4.489411, 0, 0.8784314, 1, 1,
0.02033604, -0.955166, 4.519334, 0, 0.8745098, 1, 1,
0.0257143, -0.1545795, 1.698491, 0, 0.8666667, 1, 1,
0.02648811, 1.970339, 0.9252841, 0, 0.8627451, 1, 1,
0.02844837, -0.6176257, 3.350276, 0, 0.854902, 1, 1,
0.02903478, -0.2532394, 4.224217, 0, 0.8509804, 1, 1,
0.03122575, 1.307169, -0.8061106, 0, 0.8431373, 1, 1,
0.03158893, -0.5853831, 2.863371, 0, 0.8392157, 1, 1,
0.03473786, -0.7607457, 2.804941, 0, 0.8313726, 1, 1,
0.03514515, 0.8941023, -0.5747827, 0, 0.827451, 1, 1,
0.04014619, 0.6896978, 0.1446082, 0, 0.8196079, 1, 1,
0.04146858, 1.760961, -1.01394, 0, 0.8156863, 1, 1,
0.04373372, -1.395228, 3.52567, 0, 0.8078431, 1, 1,
0.04812452, -1.265831, 5.194614, 0, 0.8039216, 1, 1,
0.04972626, 0.04181475, -0.8545628, 0, 0.7960784, 1, 1,
0.05157335, 0.2770562, -2.328592, 0, 0.7882353, 1, 1,
0.05558523, -0.0006869993, 2.348421, 0, 0.7843137, 1, 1,
0.05626969, -0.3545956, 2.12736, 0, 0.7764706, 1, 1,
0.0563881, -0.5303372, 2.988029, 0, 0.772549, 1, 1,
0.05809153, -0.4390571, 3.185558, 0, 0.7647059, 1, 1,
0.06395713, 0.3162803, -2.429489, 0, 0.7607843, 1, 1,
0.06647857, -2.064059, 0.8758404, 0, 0.7529412, 1, 1,
0.06733109, 0.4952599, 0.852168, 0, 0.7490196, 1, 1,
0.06827177, 0.2905983, -1.610633, 0, 0.7411765, 1, 1,
0.06846187, 0.2204479, 0.3554609, 0, 0.7372549, 1, 1,
0.06899191, -0.6711754, 2.103488, 0, 0.7294118, 1, 1,
0.07605986, 0.9508786, -0.1795047, 0, 0.7254902, 1, 1,
0.07758573, 0.4712557, 0.9089307, 0, 0.7176471, 1, 1,
0.079757, 1.802061, 2.205932, 0, 0.7137255, 1, 1,
0.08087248, -1.208463, 3.710173, 0, 0.7058824, 1, 1,
0.08275396, -0.2239003, 2.53703, 0, 0.6980392, 1, 1,
0.08553883, -0.712266, 5.136929, 0, 0.6941177, 1, 1,
0.08964536, -0.9724309, 3.756353, 0, 0.6862745, 1, 1,
0.08966292, 0.6702462, -0.3110372, 0, 0.682353, 1, 1,
0.09273563, -0.02125896, 2.654485, 0, 0.6745098, 1, 1,
0.09316503, -1.429488, 1.984308, 0, 0.6705883, 1, 1,
0.1037784, -1.7846, 3.766008, 0, 0.6627451, 1, 1,
0.110541, -1.831127, 2.92871, 0, 0.6588235, 1, 1,
0.1133676, 0.2170347, 2.594368, 0, 0.6509804, 1, 1,
0.1146522, 0.2233778, 0.3164286, 0, 0.6470588, 1, 1,
0.1199141, -0.760035, 3.080943, 0, 0.6392157, 1, 1,
0.1213668, -0.1408703, 2.700874, 0, 0.6352941, 1, 1,
0.1255972, 0.440044, -0.6362637, 0, 0.627451, 1, 1,
0.1258296, -0.6163425, 2.099342, 0, 0.6235294, 1, 1,
0.1267296, -0.9086476, 3.812768, 0, 0.6156863, 1, 1,
0.1273704, -0.07699127, 1.636504, 0, 0.6117647, 1, 1,
0.1284855, -0.7712684, 3.02016, 0, 0.6039216, 1, 1,
0.1310357, -0.04815999, 0.8364184, 0, 0.5960785, 1, 1,
0.1336248, 0.7789698, -0.9744615, 0, 0.5921569, 1, 1,
0.1356228, -0.9753249, 3.050153, 0, 0.5843138, 1, 1,
0.1419079, 1.229338, 0.01538084, 0, 0.5803922, 1, 1,
0.1426713, -0.5489978, 1.426026, 0, 0.572549, 1, 1,
0.1467798, -0.411999, 2.652977, 0, 0.5686275, 1, 1,
0.1476976, 1.327237, 0.280757, 0, 0.5607843, 1, 1,
0.1486398, 1.099837, -2.080289, 0, 0.5568628, 1, 1,
0.1489873, -1.047563, 3.152359, 0, 0.5490196, 1, 1,
0.1493076, 0.8046123, 1.201433, 0, 0.5450981, 1, 1,
0.1498839, -0.7709388, 1.755731, 0, 0.5372549, 1, 1,
0.1527622, 0.7561625, 0.9512371, 0, 0.5333334, 1, 1,
0.1533681, 0.2917351, 0.9444157, 0, 0.5254902, 1, 1,
0.1542569, 1.033932, -0.4221254, 0, 0.5215687, 1, 1,
0.1550607, 0.006100579, 1.590556, 0, 0.5137255, 1, 1,
0.1564237, -0.7197523, 3.782259, 0, 0.509804, 1, 1,
0.1580494, -0.8838996, 2.757272, 0, 0.5019608, 1, 1,
0.1593001, -0.2274894, 3.193997, 0, 0.4941176, 1, 1,
0.1594511, -0.2813803, 1.204752, 0, 0.4901961, 1, 1,
0.1607233, 0.918007, -1.175048, 0, 0.4823529, 1, 1,
0.1622532, 2.374543, -1.027774, 0, 0.4784314, 1, 1,
0.1629179, -0.2216407, 2.720313, 0, 0.4705882, 1, 1,
0.169921, -0.2803606, 2.886253, 0, 0.4666667, 1, 1,
0.1739229, 0.1463713, 1.939854, 0, 0.4588235, 1, 1,
0.1748855, -0.7683761, 3.29725, 0, 0.454902, 1, 1,
0.175341, -2.154819, 3.490286, 0, 0.4470588, 1, 1,
0.1755669, 0.198543, 1.976647, 0, 0.4431373, 1, 1,
0.1775056, 1.618385, 0.2235589, 0, 0.4352941, 1, 1,
0.1802685, -1.232308, 3.027633, 0, 0.4313726, 1, 1,
0.181907, 0.62023, 0.398351, 0, 0.4235294, 1, 1,
0.1820939, -0.7146096, 3.484388, 0, 0.4196078, 1, 1,
0.1850614, -1.686794, 3.717279, 0, 0.4117647, 1, 1,
0.1858438, -0.2894528, 0.1372399, 0, 0.4078431, 1, 1,
0.1972352, 0.9125563, -0.3715545, 0, 0.4, 1, 1,
0.2073867, 1.477344, -0.7444676, 0, 0.3921569, 1, 1,
0.2080941, 0.5453134, 1.267704, 0, 0.3882353, 1, 1,
0.211123, 0.7967278, -0.5476778, 0, 0.3803922, 1, 1,
0.2131047, 0.8440556, -1.546363, 0, 0.3764706, 1, 1,
0.2134489, -0.2676844, 2.569531, 0, 0.3686275, 1, 1,
0.216415, -0.4071644, 3.487861, 0, 0.3647059, 1, 1,
0.2176225, -0.3836051, 2.325384, 0, 0.3568628, 1, 1,
0.2209658, -0.2194209, 4.064115, 0, 0.3529412, 1, 1,
0.2220474, -1.846396, 0.3156406, 0, 0.345098, 1, 1,
0.222716, 0.7709616, 0.9534174, 0, 0.3411765, 1, 1,
0.224136, 0.5899303, -0.4866501, 0, 0.3333333, 1, 1,
0.2270158, -0.5554841, 2.018884, 0, 0.3294118, 1, 1,
0.2277283, 0.09138854, 1.001654, 0, 0.3215686, 1, 1,
0.2390291, 0.9213192, 0.3059719, 0, 0.3176471, 1, 1,
0.2401059, 1.8231, 0.3712247, 0, 0.3098039, 1, 1,
0.2413426, -0.5619875, 2.392785, 0, 0.3058824, 1, 1,
0.2440872, 0.4253525, -1.491771, 0, 0.2980392, 1, 1,
0.2476348, -0.9262185, 0.7475925, 0, 0.2901961, 1, 1,
0.2500597, 2.191752, 2.206128, 0, 0.2862745, 1, 1,
0.2545313, -0.001477122, 2.81732, 0, 0.2784314, 1, 1,
0.2557556, 0.8290818, 1.334244, 0, 0.2745098, 1, 1,
0.2560163, -0.1111947, 2.218666, 0, 0.2666667, 1, 1,
0.2577, -0.7908855, 3.237656, 0, 0.2627451, 1, 1,
0.2617612, -1.139041, 3.01338, 0, 0.254902, 1, 1,
0.2629841, -2.343998, 3.107098, 0, 0.2509804, 1, 1,
0.2698606, -0.01205389, 0.4532909, 0, 0.2431373, 1, 1,
0.2719998, 1.257684, -1.446977, 0, 0.2392157, 1, 1,
0.2738647, -0.2687796, 1.860046, 0, 0.2313726, 1, 1,
0.2748908, -1.10478, 2.182092, 0, 0.227451, 1, 1,
0.2765488, 0.1457073, -0.3645009, 0, 0.2196078, 1, 1,
0.2794516, -0.2396121, 2.717492, 0, 0.2156863, 1, 1,
0.2835594, 2.261635, 0.7151602, 0, 0.2078431, 1, 1,
0.2846051, -0.593123, 2.860835, 0, 0.2039216, 1, 1,
0.2870606, 0.1223281, 0.5590729, 0, 0.1960784, 1, 1,
0.2969502, 0.7591698, 0.07621501, 0, 0.1882353, 1, 1,
0.3001148, 0.2729274, 1.80852, 0, 0.1843137, 1, 1,
0.301279, 0.8543366, 1.556675, 0, 0.1764706, 1, 1,
0.3014675, 0.3535222, 1.020359, 0, 0.172549, 1, 1,
0.3063275, -0.2131517, 1.108878, 0, 0.1647059, 1, 1,
0.3143636, -0.7090835, 2.217273, 0, 0.1607843, 1, 1,
0.322707, 1.404309, 1.981482, 0, 0.1529412, 1, 1,
0.3243176, 1.149518, 1.332437, 0, 0.1490196, 1, 1,
0.3275197, -1.175803, 2.393, 0, 0.1411765, 1, 1,
0.3277334, -1.502869, 2.225392, 0, 0.1372549, 1, 1,
0.3304543, -0.8498892, 3.205989, 0, 0.1294118, 1, 1,
0.335863, 1.776526, 0.4276313, 0, 0.1254902, 1, 1,
0.3380295, -0.5482107, 2.293611, 0, 0.1176471, 1, 1,
0.3385167, -0.254918, 1.984371, 0, 0.1137255, 1, 1,
0.3428536, -0.7235829, 4.868343, 0, 0.1058824, 1, 1,
0.3458574, -0.007957252, -0.01959356, 0, 0.09803922, 1, 1,
0.3468289, -1.540367, 1.858223, 0, 0.09411765, 1, 1,
0.34735, -2.139517, 1.761112, 0, 0.08627451, 1, 1,
0.3545882, -1.569854, 4.984554, 0, 0.08235294, 1, 1,
0.3573303, -2.820012, 4.27463, 0, 0.07450981, 1, 1,
0.360849, 0.09673132, 1.315073, 0, 0.07058824, 1, 1,
0.3614551, 0.6465859, -0.1197475, 0, 0.0627451, 1, 1,
0.361842, -0.4670436, 3.520575, 0, 0.05882353, 1, 1,
0.3669033, 0.673798, 1.43754, 0, 0.05098039, 1, 1,
0.3703576, 1.324948, 0.582508, 0, 0.04705882, 1, 1,
0.372506, -0.9254894, 2.170021, 0, 0.03921569, 1, 1,
0.3769399, -0.3209615, 3.973191, 0, 0.03529412, 1, 1,
0.3774683, 0.7035254, 0.3076632, 0, 0.02745098, 1, 1,
0.3800223, 0.009662739, 2.490869, 0, 0.02352941, 1, 1,
0.3857479, -0.9294301, 4.071826, 0, 0.01568628, 1, 1,
0.3860672, -0.530497, 3.630353, 0, 0.01176471, 1, 1,
0.3903876, -0.577318, 3.928912, 0, 0.003921569, 1, 1,
0.3912058, 1.919102, -0.4142557, 0.003921569, 0, 1, 1,
0.3974976, -0.2341178, 1.377513, 0.007843138, 0, 1, 1,
0.3977677, -0.05378257, 2.163146, 0.01568628, 0, 1, 1,
0.3983305, 0.4920263, 0.7896338, 0.01960784, 0, 1, 1,
0.4011438, -1.359, 2.229281, 0.02745098, 0, 1, 1,
0.4040933, -0.5739431, 3.346189, 0.03137255, 0, 1, 1,
0.4090015, -0.1352423, 1.447868, 0.03921569, 0, 1, 1,
0.412304, 1.142434, 2.005211, 0.04313726, 0, 1, 1,
0.4151312, 0.06059105, 1.801517, 0.05098039, 0, 1, 1,
0.419625, 1.57403, 0.06375713, 0.05490196, 0, 1, 1,
0.4207817, -0.1389778, 2.118674, 0.0627451, 0, 1, 1,
0.4419638, -0.2182903, 0.9429451, 0.06666667, 0, 1, 1,
0.442108, -0.4955136, 1.906606, 0.07450981, 0, 1, 1,
0.4498003, 0.1284622, -0.3212118, 0.07843138, 0, 1, 1,
0.4508574, 1.373811, 0.5219663, 0.08627451, 0, 1, 1,
0.4632409, 0.3942685, 0.8841922, 0.09019608, 0, 1, 1,
0.4651716, -0.6967608, 1.810994, 0.09803922, 0, 1, 1,
0.4716047, -1.657359, 4.748313, 0.1058824, 0, 1, 1,
0.473551, 0.2370652, 1.234335, 0.1098039, 0, 1, 1,
0.4747887, 0.2274634, 2.255713, 0.1176471, 0, 1, 1,
0.4753183, -1.392124, 2.841986, 0.1215686, 0, 1, 1,
0.4795602, -0.1698146, 2.102169, 0.1294118, 0, 1, 1,
0.4815509, 0.4458195, 0.5706154, 0.1333333, 0, 1, 1,
0.4817186, -0.08232798, 3.633326, 0.1411765, 0, 1, 1,
0.493992, -0.1156994, 2.738032, 0.145098, 0, 1, 1,
0.496468, 2.08327, 0.6987497, 0.1529412, 0, 1, 1,
0.5003427, -0.1576055, 2.665495, 0.1568628, 0, 1, 1,
0.5008363, 0.9902731, 1.322806, 0.1647059, 0, 1, 1,
0.5085641, -1.923167, 1.794977, 0.1686275, 0, 1, 1,
0.5088341, 0.09622496, 0.2983929, 0.1764706, 0, 1, 1,
0.5123259, 0.4698956, 0.2803463, 0.1803922, 0, 1, 1,
0.5166129, 0.8640668, 1.094342, 0.1882353, 0, 1, 1,
0.5176882, 0.8701, 1.821342, 0.1921569, 0, 1, 1,
0.5177751, -2.177635, 3.54433, 0.2, 0, 1, 1,
0.5208977, -0.3873164, 0.9563353, 0.2078431, 0, 1, 1,
0.5238076, -0.06203931, 2.315404, 0.2117647, 0, 1, 1,
0.5254138, 0.2963873, 1.295192, 0.2196078, 0, 1, 1,
0.5256684, -0.9054344, 3.590143, 0.2235294, 0, 1, 1,
0.5262821, 1.073492, 0.593573, 0.2313726, 0, 1, 1,
0.5290728, 2.828514, -0.5371552, 0.2352941, 0, 1, 1,
0.5298587, -0.2541902, 1.025163, 0.2431373, 0, 1, 1,
0.5322158, 0.3171898, 0.6696059, 0.2470588, 0, 1, 1,
0.5410259, -0.7522768, 2.79157, 0.254902, 0, 1, 1,
0.5419808, -0.1006733, 1.598574, 0.2588235, 0, 1, 1,
0.5431179, 0.8811747, 2.463723, 0.2666667, 0, 1, 1,
0.5443457, 0.35553, 1.301892, 0.2705882, 0, 1, 1,
0.5453824, 0.1953273, -0.1546929, 0.2784314, 0, 1, 1,
0.550642, -0.9463895, 2.38188, 0.282353, 0, 1, 1,
0.5534313, 0.1345055, 1.561006, 0.2901961, 0, 1, 1,
0.554258, -0.6699759, 3.565902, 0.2941177, 0, 1, 1,
0.5547228, -2.717631, 3.278235, 0.3019608, 0, 1, 1,
0.5597641, -1.857007, 4.337791, 0.3098039, 0, 1, 1,
0.5706556, -0.04164857, 0.8205907, 0.3137255, 0, 1, 1,
0.5711508, -0.6539525, 2.202657, 0.3215686, 0, 1, 1,
0.5761743, 0.6089481, 2.025882, 0.3254902, 0, 1, 1,
0.5767489, -0.5870456, 0.3845119, 0.3333333, 0, 1, 1,
0.5827044, 0.8354866, 1.023805, 0.3372549, 0, 1, 1,
0.583097, 0.9123767, -1.12447, 0.345098, 0, 1, 1,
0.5843509, 1.123622, 0.9627332, 0.3490196, 0, 1, 1,
0.5855567, 0.6718743, -2.357664, 0.3568628, 0, 1, 1,
0.5891628, 1.617741, 0.1696235, 0.3607843, 0, 1, 1,
0.5907583, -0.3570442, 2.382501, 0.3686275, 0, 1, 1,
0.5928805, 0.116114, 1.240309, 0.372549, 0, 1, 1,
0.5948269, -0.3954478, 1.464629, 0.3803922, 0, 1, 1,
0.5980549, -0.01382965, 1.530855, 0.3843137, 0, 1, 1,
0.6056649, -0.3120643, 2.553434, 0.3921569, 0, 1, 1,
0.6094628, 1.915376, 0.7813025, 0.3960784, 0, 1, 1,
0.6107531, 0.543314, 0.1223595, 0.4039216, 0, 1, 1,
0.6142083, -1.105298, 2.886518, 0.4117647, 0, 1, 1,
0.616398, -1.126479, 3.11059, 0.4156863, 0, 1, 1,
0.6229759, 0.1217547, 1.151068, 0.4235294, 0, 1, 1,
0.6266462, -0.7848076, 3.391605, 0.427451, 0, 1, 1,
0.6279088, -0.2077547, 1.556896, 0.4352941, 0, 1, 1,
0.6317886, -0.6500419, 3.279216, 0.4392157, 0, 1, 1,
0.6330984, 0.6603301, 0.7365085, 0.4470588, 0, 1, 1,
0.635374, 0.7549726, 0.9514397, 0.4509804, 0, 1, 1,
0.6364787, -0.1581498, 1.300397, 0.4588235, 0, 1, 1,
0.6381288, -0.4664587, 1.718849, 0.4627451, 0, 1, 1,
0.6422369, 0.1918789, 1.259924, 0.4705882, 0, 1, 1,
0.642386, -0.8087575, 4.143379, 0.4745098, 0, 1, 1,
0.6491783, -1.934484, 3.01926, 0.4823529, 0, 1, 1,
0.654225, 1.085894, 1.153658, 0.4862745, 0, 1, 1,
0.6552634, -0.3908128, 3.053338, 0.4941176, 0, 1, 1,
0.6579401, 0.4661621, 1.183295, 0.5019608, 0, 1, 1,
0.6583403, 0.4486428, -0.3890878, 0.5058824, 0, 1, 1,
0.659409, 1.475414, 0.5555853, 0.5137255, 0, 1, 1,
0.6623822, -0.1996902, 2.808909, 0.5176471, 0, 1, 1,
0.6674643, -0.07842164, 1.675022, 0.5254902, 0, 1, 1,
0.6701983, -0.04240913, -0.4977207, 0.5294118, 0, 1, 1,
0.6797455, -0.7153758, 2.19927, 0.5372549, 0, 1, 1,
0.6842687, 1.010089, 2.102705, 0.5411765, 0, 1, 1,
0.686176, 1.372644, 1.08207, 0.5490196, 0, 1, 1,
0.6862858, 0.6134821, 1.972924, 0.5529412, 0, 1, 1,
0.6920449, 1.076154, -0.1658909, 0.5607843, 0, 1, 1,
0.6928878, 0.9189345, -0.03347664, 0.5647059, 0, 1, 1,
0.6941071, -1.516433, 3.239209, 0.572549, 0, 1, 1,
0.6956762, 0.3396688, 2.064615, 0.5764706, 0, 1, 1,
0.6978303, 0.7454216, 0.1697994, 0.5843138, 0, 1, 1,
0.7001352, 1.771648, 1.03676, 0.5882353, 0, 1, 1,
0.7072372, 0.4242974, 0.7511065, 0.5960785, 0, 1, 1,
0.7080626, -0.9128885, 0.6352749, 0.6039216, 0, 1, 1,
0.7176803, 0.9099007, -0.4953794, 0.6078432, 0, 1, 1,
0.7186281, -0.1601129, -0.1548697, 0.6156863, 0, 1, 1,
0.7234378, -0.2308576, 1.843615, 0.6196079, 0, 1, 1,
0.7255883, 2.422549, 0.797164, 0.627451, 0, 1, 1,
0.72824, -0.3754564, 3.142518, 0.6313726, 0, 1, 1,
0.7289537, -0.06844401, 2.706916, 0.6392157, 0, 1, 1,
0.7301452, -1.338036, 1.671967, 0.6431373, 0, 1, 1,
0.7307908, 0.8567494, 1.142117, 0.6509804, 0, 1, 1,
0.7339774, -0.126041, -0.3130098, 0.654902, 0, 1, 1,
0.7356611, 1.393377, -0.5656874, 0.6627451, 0, 1, 1,
0.744437, 0.198629, -0.6928486, 0.6666667, 0, 1, 1,
0.7456059, 0.2342743, 1.562387, 0.6745098, 0, 1, 1,
0.7467684, 0.7164239, 0.8642867, 0.6784314, 0, 1, 1,
0.750152, 1.334397, -1.463067, 0.6862745, 0, 1, 1,
0.7516185, 1.26616, 0.3232978, 0.6901961, 0, 1, 1,
0.7544165, 1.14142, 0.9110237, 0.6980392, 0, 1, 1,
0.7591222, -0.6892617, 1.53171, 0.7058824, 0, 1, 1,
0.7597252, 0.1170069, 0.8135818, 0.7098039, 0, 1, 1,
0.7634822, -1.706715, 4.676137, 0.7176471, 0, 1, 1,
0.7682236, -0.0326151, 1.649944, 0.7215686, 0, 1, 1,
0.7771609, 0.3397197, 2.439779, 0.7294118, 0, 1, 1,
0.7772736, -0.2804595, 1.290993, 0.7333333, 0, 1, 1,
0.7778092, 0.6354886, 1.930161, 0.7411765, 0, 1, 1,
0.7837971, 0.4484746, 1.053686, 0.7450981, 0, 1, 1,
0.7866057, 0.4356528, 1.216517, 0.7529412, 0, 1, 1,
0.7907009, -1.211111, 3.79591, 0.7568628, 0, 1, 1,
0.7910613, 0.6232623, 0.9200133, 0.7647059, 0, 1, 1,
0.7962157, -1.691044, 2.509831, 0.7686275, 0, 1, 1,
0.7967851, -0.4290387, 2.330018, 0.7764706, 0, 1, 1,
0.796792, -1.615101, 2.730464, 0.7803922, 0, 1, 1,
0.8056217, 0.8871523, 2.402315, 0.7882353, 0, 1, 1,
0.8109763, -1.484776, 4.13796, 0.7921569, 0, 1, 1,
0.8120071, -0.01130094, 0.604667, 0.8, 0, 1, 1,
0.8185134, 0.1875011, 2.422789, 0.8078431, 0, 1, 1,
0.8299551, 1.532078, 0.5100799, 0.8117647, 0, 1, 1,
0.8309796, -1.571465, 3.025106, 0.8196079, 0, 1, 1,
0.8364984, 1.050857, 1.553879, 0.8235294, 0, 1, 1,
0.8419823, -0.167582, 0.6526735, 0.8313726, 0, 1, 1,
0.8431541, -0.5918337, 1.492995, 0.8352941, 0, 1, 1,
0.8506191, 2.301144, 0.9729903, 0.8431373, 0, 1, 1,
0.8535824, -0.1397744, 2.307642, 0.8470588, 0, 1, 1,
0.8536946, 1.777516, 1.788314, 0.854902, 0, 1, 1,
0.8547439, -1.257167, 2.09667, 0.8588235, 0, 1, 1,
0.8586004, 0.4536377, 1.295298, 0.8666667, 0, 1, 1,
0.8593946, 1.122029, 1.139872, 0.8705882, 0, 1, 1,
0.8613077, -0.2847615, 3.184895, 0.8784314, 0, 1, 1,
0.8631564, -2.578927, 3.310762, 0.8823529, 0, 1, 1,
0.8657684, 0.4495631, -1.331188, 0.8901961, 0, 1, 1,
0.870664, -1.249093, 2.510084, 0.8941177, 0, 1, 1,
0.8738698, -0.8310853, 2.798758, 0.9019608, 0, 1, 1,
0.8739982, -0.7910936, 2.812524, 0.9098039, 0, 1, 1,
0.8749452, 0.202616, 1.068884, 0.9137255, 0, 1, 1,
0.8761423, -0.7002264, 1.899414, 0.9215686, 0, 1, 1,
0.8779918, -1.240897, 3.373346, 0.9254902, 0, 1, 1,
0.8842062, 2.169977, -1.605933, 0.9333333, 0, 1, 1,
0.8887546, -2.183883, 1.992499, 0.9372549, 0, 1, 1,
0.8982434, 0.1839232, 0.1005197, 0.945098, 0, 1, 1,
0.9077414, -0.7665365, 1.649099, 0.9490196, 0, 1, 1,
0.9086239, -1.905763, 3.887588, 0.9568627, 0, 1, 1,
0.9098625, 0.7782879, 1.033966, 0.9607843, 0, 1, 1,
0.9112279, -0.6487164, 1.244836, 0.9686275, 0, 1, 1,
0.9131483, 0.7215992, 0.5433172, 0.972549, 0, 1, 1,
0.9174914, 1.163861, 0.736639, 0.9803922, 0, 1, 1,
0.9211822, -0.9418758, 2.293874, 0.9843137, 0, 1, 1,
0.9242004, 0.4710499, 0.9243822, 0.9921569, 0, 1, 1,
0.9251994, 0.4084428, 1.074393, 0.9960784, 0, 1, 1,
0.9260303, 0.9381876, 1.147913, 1, 0, 0.9960784, 1,
0.927195, -0.1181651, 3.067333, 1, 0, 0.9882353, 1,
0.9280499, 0.9234686, 1.407301, 1, 0, 0.9843137, 1,
0.9290434, -0.5513353, -0.4000986, 1, 0, 0.9764706, 1,
0.9347211, -0.6660221, 2.035539, 1, 0, 0.972549, 1,
0.951847, -1.769433, 2.509913, 1, 0, 0.9647059, 1,
0.9558737, -0.8372617, 0.9578642, 1, 0, 0.9607843, 1,
0.9559678, -0.05418778, 2.288966, 1, 0, 0.9529412, 1,
0.9586563, 0.6156865, 1.793131, 1, 0, 0.9490196, 1,
0.960425, 0.9753329, 2.022015, 1, 0, 0.9411765, 1,
0.9629125, 1.615403, 1.087561, 1, 0, 0.9372549, 1,
0.9663391, 1.34502, 1.259602, 1, 0, 0.9294118, 1,
0.9676065, -1.11733, 1.761038, 1, 0, 0.9254902, 1,
0.9679366, 0.6163046, -0.397045, 1, 0, 0.9176471, 1,
0.9681873, -1.778114, 3.661597, 1, 0, 0.9137255, 1,
0.9702695, 0.3261899, 1.919941, 1, 0, 0.9058824, 1,
0.9752173, -2.106242, 3.944441, 1, 0, 0.9019608, 1,
0.9831659, 0.9239559, 0.1165498, 1, 0, 0.8941177, 1,
0.9871054, 0.7203118, 2.764512, 1, 0, 0.8862745, 1,
0.9879614, 1.008644, -1.844053, 1, 0, 0.8823529, 1,
0.9966015, -1.664484, 2.15937, 1, 0, 0.8745098, 1,
0.9980078, -0.0359167, 1.610396, 1, 0, 0.8705882, 1,
1.003039, -1.636965, 2.172376, 1, 0, 0.8627451, 1,
1.003868, 0.5045616, 0.5771195, 1, 0, 0.8588235, 1,
1.009351, -0.6970294, 2.408123, 1, 0, 0.8509804, 1,
1.021857, 0.309604, 1.324468, 1, 0, 0.8470588, 1,
1.025473, 0.553736, 3.1407, 1, 0, 0.8392157, 1,
1.036112, -0.03956718, 3.247108, 1, 0, 0.8352941, 1,
1.039483, -0.8338457, 3.791115, 1, 0, 0.827451, 1,
1.043212, -0.8319662, 1.47028, 1, 0, 0.8235294, 1,
1.043573, -2.311089, 3.791638, 1, 0, 0.8156863, 1,
1.046412, 0.6455954, 0.3954539, 1, 0, 0.8117647, 1,
1.046417, -0.3566599, 1.543801, 1, 0, 0.8039216, 1,
1.052706, -1.273158, 3.745038, 1, 0, 0.7960784, 1,
1.056875, -1.482922, 4.7709, 1, 0, 0.7921569, 1,
1.057437, 0.2487368, 1.348354, 1, 0, 0.7843137, 1,
1.061698, 0.128519, 2.803873, 1, 0, 0.7803922, 1,
1.064994, -0.442426, 2.637751, 1, 0, 0.772549, 1,
1.065014, 0.1806929, 0.8492989, 1, 0, 0.7686275, 1,
1.068036, -0.2190912, 1.057999, 1, 0, 0.7607843, 1,
1.084229, -2.204471, 3.37, 1, 0, 0.7568628, 1,
1.088374, 0.5708697, 1.815017, 1, 0, 0.7490196, 1,
1.09524, 1.906894, 1.395114, 1, 0, 0.7450981, 1,
1.096644, 1.434822, 2.828523, 1, 0, 0.7372549, 1,
1.102674, -0.08394928, 2.761686, 1, 0, 0.7333333, 1,
1.102946, 0.1605015, 1.79529, 1, 0, 0.7254902, 1,
1.116866, 0.1586932, 2.279954, 1, 0, 0.7215686, 1,
1.130017, 0.2167359, 3.616475, 1, 0, 0.7137255, 1,
1.130262, 1.579807, 1.931694, 1, 0, 0.7098039, 1,
1.131959, 1.326201, 2.30328, 1, 0, 0.7019608, 1,
1.157466, 0.2876811, 2.038834, 1, 0, 0.6941177, 1,
1.1689, -0.1893135, 1.698382, 1, 0, 0.6901961, 1,
1.170236, -0.8815222, 2.39342, 1, 0, 0.682353, 1,
1.17168, 0.5911344, 3.132282, 1, 0, 0.6784314, 1,
1.174369, 0.8791898, 1.243952, 1, 0, 0.6705883, 1,
1.185977, -1.791548, 0.8183652, 1, 0, 0.6666667, 1,
1.187139, 1.29373, 1.078701, 1, 0, 0.6588235, 1,
1.18828, 0.3855157, -0.9973612, 1, 0, 0.654902, 1,
1.189029, 1.607571, -0.01937032, 1, 0, 0.6470588, 1,
1.190847, 0.3484271, 1.178738, 1, 0, 0.6431373, 1,
1.193058, 1.262509, 0.3466779, 1, 0, 0.6352941, 1,
1.196014, -0.4471286, 2.576643, 1, 0, 0.6313726, 1,
1.198154, -2.399885, 2.270859, 1, 0, 0.6235294, 1,
1.203595, 1.155496, 0.4400631, 1, 0, 0.6196079, 1,
1.206907, -0.169857, 2.704953, 1, 0, 0.6117647, 1,
1.208758, 0.5342883, 2.805309, 1, 0, 0.6078432, 1,
1.211205, 1.456567, 0.5063888, 1, 0, 0.6, 1,
1.218481, -0.1332265, 3.293243, 1, 0, 0.5921569, 1,
1.232057, 1.556086, -0.511659, 1, 0, 0.5882353, 1,
1.233317, 1.14851, 1.309959, 1, 0, 0.5803922, 1,
1.235772, 0.06044827, 2.012638, 1, 0, 0.5764706, 1,
1.245105, 1.179891, 0.5523896, 1, 0, 0.5686275, 1,
1.264442, 0.7583543, 2.332968, 1, 0, 0.5647059, 1,
1.281605, 0.06170725, 1.845404, 1, 0, 0.5568628, 1,
1.292532, 0.05117872, 0.717526, 1, 0, 0.5529412, 1,
1.293906, -0.5465034, 2.256617, 1, 0, 0.5450981, 1,
1.296329, 0.6703519, -0.007737273, 1, 0, 0.5411765, 1,
1.297588, 0.04273333, 1.64479, 1, 0, 0.5333334, 1,
1.309233, 0.3665133, -0.04509328, 1, 0, 0.5294118, 1,
1.316025, 1.367898, 0.8643236, 1, 0, 0.5215687, 1,
1.320306, 0.2246955, -0.1762206, 1, 0, 0.5176471, 1,
1.324106, 0.1493814, 4.107482, 1, 0, 0.509804, 1,
1.330514, 1.886368, -1.255397, 1, 0, 0.5058824, 1,
1.334545, 0.3543966, 0.8616593, 1, 0, 0.4980392, 1,
1.336031, 0.8471336, 2.025108, 1, 0, 0.4901961, 1,
1.341348, -0.04993616, 0.6255897, 1, 0, 0.4862745, 1,
1.344653, 1.16401, 1.948576, 1, 0, 0.4784314, 1,
1.355507, 1.130295, 1.854133, 1, 0, 0.4745098, 1,
1.360804, -1.478281, 3.959104, 1, 0, 0.4666667, 1,
1.380114, -1.727794, 0.6723618, 1, 0, 0.4627451, 1,
1.395216, 0.686867, 0.9265436, 1, 0, 0.454902, 1,
1.398602, -0.3719539, 0.8107919, 1, 0, 0.4509804, 1,
1.400225, 0.964134, 0.8977084, 1, 0, 0.4431373, 1,
1.404519, 0.6549798, 0.8156829, 1, 0, 0.4392157, 1,
1.429102, 0.5474057, 0.2999974, 1, 0, 0.4313726, 1,
1.432346, -0.1511755, 1.971529, 1, 0, 0.427451, 1,
1.462075, 1.471041, 0.5194837, 1, 0, 0.4196078, 1,
1.467302, 0.3895689, 1.625959, 1, 0, 0.4156863, 1,
1.48352, -0.4026699, 2.111205, 1, 0, 0.4078431, 1,
1.488305, 0.3247684, 0.01122241, 1, 0, 0.4039216, 1,
1.495114, -0.1277971, 3.688884, 1, 0, 0.3960784, 1,
1.496929, 0.2918378, 3.108838, 1, 0, 0.3882353, 1,
1.498147, 0.8089388, 1.244151, 1, 0, 0.3843137, 1,
1.515353, 1.203539, -0.1949214, 1, 0, 0.3764706, 1,
1.521129, 2.099073, -1.687094, 1, 0, 0.372549, 1,
1.550086, -1.469909, 2.839235, 1, 0, 0.3647059, 1,
1.55169, -0.8559455, 2.437783, 1, 0, 0.3607843, 1,
1.567745, -0.1396583, 2.657479, 1, 0, 0.3529412, 1,
1.568543, 1.7046, 0.7641996, 1, 0, 0.3490196, 1,
1.578645, 0.6163695, 1.882413, 1, 0, 0.3411765, 1,
1.579133, -0.5312888, 2.060372, 1, 0, 0.3372549, 1,
1.592008, 0.01925988, 2.8917, 1, 0, 0.3294118, 1,
1.593069, 0.3323882, 3.143088, 1, 0, 0.3254902, 1,
1.604623, -1.806591, 2.404224, 1, 0, 0.3176471, 1,
1.605093, 0.2958605, 2.186971, 1, 0, 0.3137255, 1,
1.630887, -1.415017, 2.529023, 1, 0, 0.3058824, 1,
1.633182, 0.7939931, 0.2555884, 1, 0, 0.2980392, 1,
1.63692, 0.6038931, 2.08254, 1, 0, 0.2941177, 1,
1.638863, 0.6798761, 0.7827682, 1, 0, 0.2862745, 1,
1.6453, 0.6634243, 1.399997, 1, 0, 0.282353, 1,
1.657712, -0.1638267, 3.422457, 1, 0, 0.2745098, 1,
1.708813, 0.008629978, 1.700825, 1, 0, 0.2705882, 1,
1.715138, 1.61187, 1.219115, 1, 0, 0.2627451, 1,
1.716902, -0.5637958, 0.1847398, 1, 0, 0.2588235, 1,
1.719449, -1.256534, 1.239514, 1, 0, 0.2509804, 1,
1.731661, -1.611471, 1.896681, 1, 0, 0.2470588, 1,
1.741751, -0.5286276, 3.097142, 1, 0, 0.2392157, 1,
1.747206, -1.785084, 3.409521, 1, 0, 0.2352941, 1,
1.76885, -0.4406148, 0.02206014, 1, 0, 0.227451, 1,
1.80559, -0.9926999, 3.444611, 1, 0, 0.2235294, 1,
1.807274, 1.388753, 2.792835, 1, 0, 0.2156863, 1,
1.830184, 0.01971859, 2.438936, 1, 0, 0.2117647, 1,
1.840455, -0.6127973, 2.105161, 1, 0, 0.2039216, 1,
1.847517, -0.9394594, 4.623087, 1, 0, 0.1960784, 1,
1.856657, 0.9399571, 1.277023, 1, 0, 0.1921569, 1,
1.865474, 1.342124, -0.6372084, 1, 0, 0.1843137, 1,
1.883698, -0.4982254, 1.717478, 1, 0, 0.1803922, 1,
1.892962, 1.384515, 1.434656, 1, 0, 0.172549, 1,
1.901912, 0.7883925, 0.1834012, 1, 0, 0.1686275, 1,
1.913879, 0.4943524, 2.500928, 1, 0, 0.1607843, 1,
1.927335, -0.4581367, -0.3734793, 1, 0, 0.1568628, 1,
1.936945, -1.103594, 3.26759, 1, 0, 0.1490196, 1,
1.954249, 1.483314, -0.3768096, 1, 0, 0.145098, 1,
1.959726, 0.3832351, 2.473168, 1, 0, 0.1372549, 1,
1.966785, -0.9553787, 2.313843, 1, 0, 0.1333333, 1,
1.974173, -0.4054047, 2.829456, 1, 0, 0.1254902, 1,
1.983517, -1.306657, 2.300582, 1, 0, 0.1215686, 1,
1.985946, -1.825576, 2.528594, 1, 0, 0.1137255, 1,
2.003423, -0.01768117, 0.5389939, 1, 0, 0.1098039, 1,
2.009365, -0.5289301, 2.418452, 1, 0, 0.1019608, 1,
2.038598, 0.5184367, 1.922287, 1, 0, 0.09411765, 1,
2.086744, -0.4168084, 1.623649, 1, 0, 0.09019608, 1,
2.20231, -0.2387211, 2.354288, 1, 0, 0.08235294, 1,
2.290064, 0.3689052, -0.1147603, 1, 0, 0.07843138, 1,
2.338746, 0.08418215, 2.337402, 1, 0, 0.07058824, 1,
2.358293, 0.177938, 1.850783, 1, 0, 0.06666667, 1,
2.36753, 2.270275, 0.5293027, 1, 0, 0.05882353, 1,
2.533717, -1.328755, 2.395513, 1, 0, 0.05490196, 1,
2.618751, -0.1009353, 1.802151, 1, 0, 0.04705882, 1,
2.634623, -0.2110873, 2.430861, 1, 0, 0.04313726, 1,
2.717228, 0.7216623, 0.9441698, 1, 0, 0.03529412, 1,
2.731014, -1.965801, 2.424799, 1, 0, 0.03137255, 1,
2.748757, 0.5260544, 1.043404, 1, 0, 0.02352941, 1,
2.784294, 0.2073428, 0.8510051, 1, 0, 0.01960784, 1,
3.086832, 0.8619691, 1.563496, 1, 0, 0.01176471, 1,
3.533163, -0.4766674, 1.01206, 1, 0, 0.007843138, 1
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
0.05687094, -3.777437, -7.241541, 0, -0.5, 0.5, 0.5,
0.05687094, -3.777437, -7.241541, 1, -0.5, 0.5, 0.5,
0.05687094, -3.777437, -7.241541, 1, 1.5, 0.5, 0.5,
0.05687094, -3.777437, -7.241541, 0, 1.5, 0.5, 0.5
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
-4.597884, 0.004250884, -7.241541, 0, -0.5, 0.5, 0.5,
-4.597884, 0.004250884, -7.241541, 1, -0.5, 0.5, 0.5,
-4.597884, 0.004250884, -7.241541, 1, 1.5, 0.5, 0.5,
-4.597884, 0.004250884, -7.241541, 0, 1.5, 0.5, 0.5
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
-4.597884, -3.777437, -0.1222544, 0, -0.5, 0.5, 0.5,
-4.597884, -3.777437, -0.1222544, 1, -0.5, 0.5, 0.5,
-4.597884, -3.777437, -0.1222544, 1, 1.5, 0.5, 0.5,
-4.597884, -3.777437, -0.1222544, 0, 1.5, 0.5, 0.5
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
-3, -2.90474, -5.598629,
3, -2.90474, -5.598629,
-3, -2.90474, -5.598629,
-3, -3.050189, -5.872447,
-2, -2.90474, -5.598629,
-2, -3.050189, -5.872447,
-1, -2.90474, -5.598629,
-1, -3.050189, -5.872447,
0, -2.90474, -5.598629,
0, -3.050189, -5.872447,
1, -2.90474, -5.598629,
1, -3.050189, -5.872447,
2, -2.90474, -5.598629,
2, -3.050189, -5.872447,
3, -2.90474, -5.598629,
3, -3.050189, -5.872447
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
-3, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
-3, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
-3, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
-3, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5,
-2, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
-2, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
-2, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
-2, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5,
-1, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
-1, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
-1, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
-1, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5,
0, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
0, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
0, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
0, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5,
1, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
1, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
1, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
1, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5,
2, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
2, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
2, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
2, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5,
3, -3.341088, -6.420085, 0, -0.5, 0.5, 0.5,
3, -3.341088, -6.420085, 1, -0.5, 0.5, 0.5,
3, -3.341088, -6.420085, 1, 1.5, 0.5, 0.5,
3, -3.341088, -6.420085, 0, 1.5, 0.5, 0.5
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
-3.52371, -2, -5.598629,
-3.52371, 2, -5.598629,
-3.52371, -2, -5.598629,
-3.702739, -2, -5.872447,
-3.52371, -1, -5.598629,
-3.702739, -1, -5.872447,
-3.52371, 0, -5.598629,
-3.702739, 0, -5.872447,
-3.52371, 1, -5.598629,
-3.702739, 1, -5.872447,
-3.52371, 2, -5.598629,
-3.702739, 2, -5.872447
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
-4.060797, -2, -6.420085, 0, -0.5, 0.5, 0.5,
-4.060797, -2, -6.420085, 1, -0.5, 0.5, 0.5,
-4.060797, -2, -6.420085, 1, 1.5, 0.5, 0.5,
-4.060797, -2, -6.420085, 0, 1.5, 0.5, 0.5,
-4.060797, -1, -6.420085, 0, -0.5, 0.5, 0.5,
-4.060797, -1, -6.420085, 1, -0.5, 0.5, 0.5,
-4.060797, -1, -6.420085, 1, 1.5, 0.5, 0.5,
-4.060797, -1, -6.420085, 0, 1.5, 0.5, 0.5,
-4.060797, 0, -6.420085, 0, -0.5, 0.5, 0.5,
-4.060797, 0, -6.420085, 1, -0.5, 0.5, 0.5,
-4.060797, 0, -6.420085, 1, 1.5, 0.5, 0.5,
-4.060797, 0, -6.420085, 0, 1.5, 0.5, 0.5,
-4.060797, 1, -6.420085, 0, -0.5, 0.5, 0.5,
-4.060797, 1, -6.420085, 1, -0.5, 0.5, 0.5,
-4.060797, 1, -6.420085, 1, 1.5, 0.5, 0.5,
-4.060797, 1, -6.420085, 0, 1.5, 0.5, 0.5,
-4.060797, 2, -6.420085, 0, -0.5, 0.5, 0.5,
-4.060797, 2, -6.420085, 1, -0.5, 0.5, 0.5,
-4.060797, 2, -6.420085, 1, 1.5, 0.5, 0.5,
-4.060797, 2, -6.420085, 0, 1.5, 0.5, 0.5
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
-3.52371, -2.90474, -4,
-3.52371, -2.90474, 4,
-3.52371, -2.90474, -4,
-3.702739, -3.050189, -4,
-3.52371, -2.90474, -2,
-3.702739, -3.050189, -2,
-3.52371, -2.90474, 0,
-3.702739, -3.050189, 0,
-3.52371, -2.90474, 2,
-3.702739, -3.050189, 2,
-3.52371, -2.90474, 4,
-3.702739, -3.050189, 4
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
-4.060797, -3.341088, -4, 0, -0.5, 0.5, 0.5,
-4.060797, -3.341088, -4, 1, -0.5, 0.5, 0.5,
-4.060797, -3.341088, -4, 1, 1.5, 0.5, 0.5,
-4.060797, -3.341088, -4, 0, 1.5, 0.5, 0.5,
-4.060797, -3.341088, -2, 0, -0.5, 0.5, 0.5,
-4.060797, -3.341088, -2, 1, -0.5, 0.5, 0.5,
-4.060797, -3.341088, -2, 1, 1.5, 0.5, 0.5,
-4.060797, -3.341088, -2, 0, 1.5, 0.5, 0.5,
-4.060797, -3.341088, 0, 0, -0.5, 0.5, 0.5,
-4.060797, -3.341088, 0, 1, -0.5, 0.5, 0.5,
-4.060797, -3.341088, 0, 1, 1.5, 0.5, 0.5,
-4.060797, -3.341088, 0, 0, 1.5, 0.5, 0.5,
-4.060797, -3.341088, 2, 0, -0.5, 0.5, 0.5,
-4.060797, -3.341088, 2, 1, -0.5, 0.5, 0.5,
-4.060797, -3.341088, 2, 1, 1.5, 0.5, 0.5,
-4.060797, -3.341088, 2, 0, 1.5, 0.5, 0.5,
-4.060797, -3.341088, 4, 0, -0.5, 0.5, 0.5,
-4.060797, -3.341088, 4, 1, -0.5, 0.5, 0.5,
-4.060797, -3.341088, 4, 1, 1.5, 0.5, 0.5,
-4.060797, -3.341088, 4, 0, 1.5, 0.5, 0.5
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
-3.52371, -2.90474, -5.598629,
-3.52371, 2.913241, -5.598629,
-3.52371, -2.90474, 5.35412,
-3.52371, 2.913241, 5.35412,
-3.52371, -2.90474, -5.598629,
-3.52371, -2.90474, 5.35412,
-3.52371, 2.913241, -5.598629,
-3.52371, 2.913241, 5.35412,
-3.52371, -2.90474, -5.598629,
3.637451, -2.90474, -5.598629,
-3.52371, -2.90474, 5.35412,
3.637451, -2.90474, 5.35412,
-3.52371, 2.913241, -5.598629,
3.637451, 2.913241, -5.598629,
-3.52371, 2.913241, 5.35412,
3.637451, 2.913241, 5.35412,
3.637451, -2.90474, -5.598629,
3.637451, 2.913241, -5.598629,
3.637451, -2.90474, 5.35412,
3.637451, 2.913241, 5.35412,
3.637451, -2.90474, -5.598629,
3.637451, -2.90474, 5.35412,
3.637451, 2.913241, -5.598629,
3.637451, 2.913241, 5.35412
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
var radius = 7.647188;
var distance = 34.0232;
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
mvMatrix.translate( -0.05687094, -0.004250884, 0.1222544 );
mvMatrix.scale( 1.154602, 1.421161, 0.7549055 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.0232);
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
oxycarboxin<-read.table("oxycarboxin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxycarboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
```

```r
y<-oxycarboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
```

```r
z<-oxycarboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
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
-3.419421, 0.8055716, -2.859042, 0, 0, 1, 1, 1,
-3.020385, -0.7981359, -3.567611, 1, 0, 0, 1, 1,
-2.838719, 0.8423907, -1.433756, 1, 0, 0, 1, 1,
-2.592282, 0.2059123, -0.1073994, 1, 0, 0, 1, 1,
-2.392745, -1.014438, -1.20715, 1, 0, 0, 1, 1,
-2.345286, -0.8560324, -1.495443, 1, 0, 0, 1, 1,
-2.340317, 1.834707, -0.6198745, 0, 0, 0, 1, 1,
-2.251949, -1.078418, -2.502119, 0, 0, 0, 1, 1,
-2.206788, 0.7444128, -0.5221331, 0, 0, 0, 1, 1,
-2.185727, -0.3493142, -2.82111, 0, 0, 0, 1, 1,
-2.163395, 0.4723577, -2.440895, 0, 0, 0, 1, 1,
-2.149896, 0.7637011, -1.612332, 0, 0, 0, 1, 1,
-2.059591, 0.6063305, -1.261575, 0, 0, 0, 1, 1,
-2.04614, 1.338897, -0.3184163, 1, 1, 1, 1, 1,
-2.018366, -0.6528355, -1.820181, 1, 1, 1, 1, 1,
-2.005835, -0.7405465, -2.324535, 1, 1, 1, 1, 1,
-2.000981, -1.104389, -2.311352, 1, 1, 1, 1, 1,
-1.994593, -1.095095, -1.659782, 1, 1, 1, 1, 1,
-1.992788, -0.1128827, -0.5936221, 1, 1, 1, 1, 1,
-1.934302, -0.313934, -1.747226, 1, 1, 1, 1, 1,
-1.916632, 1.351413, -0.132333, 1, 1, 1, 1, 1,
-1.915708, -0.1299925, -0.8739323, 1, 1, 1, 1, 1,
-1.904877, -2.278446, -3.324531, 1, 1, 1, 1, 1,
-1.895244, -0.7874259, -2.664011, 1, 1, 1, 1, 1,
-1.882409, -0.4590446, -3.159528, 1, 1, 1, 1, 1,
-1.867709, 1.612054, -0.862634, 1, 1, 1, 1, 1,
-1.865321, -0.950532, -2.045083, 1, 1, 1, 1, 1,
-1.861869, -1.898027, -2.180483, 1, 1, 1, 1, 1,
-1.860451, 0.7126025, -2.133188, 0, 0, 1, 1, 1,
-1.859388, 0.4118762, -1.809634, 1, 0, 0, 1, 1,
-1.844768, -0.6540483, -2.283027, 1, 0, 0, 1, 1,
-1.834731, 1.079213, -1.794023, 1, 0, 0, 1, 1,
-1.816272, -0.3655261, -1.85308, 1, 0, 0, 1, 1,
-1.80382, -0.9806229, -2.884697, 1, 0, 0, 1, 1,
-1.799585, 0.6920456, -0.6097133, 0, 0, 0, 1, 1,
-1.797733, 2.282612, -0.2620114, 0, 0, 0, 1, 1,
-1.776313, 1.190029, -1.755545, 0, 0, 0, 1, 1,
-1.772797, -1.353389, -1.972594, 0, 0, 0, 1, 1,
-1.771838, 0.4052229, -1.159577, 0, 0, 0, 1, 1,
-1.763435, 0.2960424, -2.350943, 0, 0, 0, 1, 1,
-1.762708, 0.3351534, -2.471887, 0, 0, 0, 1, 1,
-1.758481, 0.5598663, -3.192109, 1, 1, 1, 1, 1,
-1.689082, -0.8913684, -1.588999, 1, 1, 1, 1, 1,
-1.687939, 0.04103747, -2.451581, 1, 1, 1, 1, 1,
-1.680526, 1.750073, -0.08329315, 1, 1, 1, 1, 1,
-1.663731, 2.138798, 0.3669491, 1, 1, 1, 1, 1,
-1.657658, -0.6862797, -3.087775, 1, 1, 1, 1, 1,
-1.635704, 1.373426, -0.8426966, 1, 1, 1, 1, 1,
-1.608297, -0.2797497, 0.6628197, 1, 1, 1, 1, 1,
-1.593272, -0.557817, -2.156556, 1, 1, 1, 1, 1,
-1.58984, 1.4998, -1.346186, 1, 1, 1, 1, 1,
-1.575879, 0.9186445, -1.3948, 1, 1, 1, 1, 1,
-1.57333, -1.796593, -3.083067, 1, 1, 1, 1, 1,
-1.572397, -1.530652, 0.7547132, 1, 1, 1, 1, 1,
-1.555051, 0.1985144, -2.394729, 1, 1, 1, 1, 1,
-1.554628, -0.467349, -0.8861359, 1, 1, 1, 1, 1,
-1.541901, 0.8689823, -1.719905, 0, 0, 1, 1, 1,
-1.53097, -0.4865011, -0.02301851, 1, 0, 0, 1, 1,
-1.517144, 0.1090495, -1.241223, 1, 0, 0, 1, 1,
-1.515237, -0.4912382, -1.988191, 1, 0, 0, 1, 1,
-1.513339, 0.4907004, -2.088308, 1, 0, 0, 1, 1,
-1.502077, -0.1668043, -2.224427, 1, 0, 0, 1, 1,
-1.499579, -0.9929104, -3.4589, 0, 0, 0, 1, 1,
-1.498688, 0.5876914, -1.030746, 0, 0, 0, 1, 1,
-1.472908, -1.425735, -2.791256, 0, 0, 0, 1, 1,
-1.468967, -0.3780232, -3.687204, 0, 0, 0, 1, 1,
-1.461086, 2.138612, 0.1512749, 0, 0, 0, 1, 1,
-1.455187, -1.412034, -3.225753, 0, 0, 0, 1, 1,
-1.448892, -0.2771847, -0.2358352, 0, 0, 0, 1, 1,
-1.420395, 0.545085, -0.168497, 1, 1, 1, 1, 1,
-1.414664, -0.9014956, 0.2663698, 1, 1, 1, 1, 1,
-1.413229, -1.148986, -2.227093, 1, 1, 1, 1, 1,
-1.404629, 0.2009116, -2.484838, 1, 1, 1, 1, 1,
-1.399781, 1.100745, -2.209266, 1, 1, 1, 1, 1,
-1.391218, 0.8015719, -1.665356, 1, 1, 1, 1, 1,
-1.391192, 0.7596443, -0.394962, 1, 1, 1, 1, 1,
-1.390011, 1.116713, -2.269337, 1, 1, 1, 1, 1,
-1.386317, -0.9564776, -1.132156, 1, 1, 1, 1, 1,
-1.380772, -0.5927015, -4.336354, 1, 1, 1, 1, 1,
-1.379804, -0.6971297, -2.483575, 1, 1, 1, 1, 1,
-1.379233, -0.2387227, -2.547743, 1, 1, 1, 1, 1,
-1.372137, 0.007821746, -0.04999652, 1, 1, 1, 1, 1,
-1.370428, 0.3784617, -1.984645, 1, 1, 1, 1, 1,
-1.370084, 0.8955156, -0.3935892, 1, 1, 1, 1, 1,
-1.36874, -1.025895, -5.439123, 0, 0, 1, 1, 1,
-1.367873, 0.1419078, -0.5720614, 1, 0, 0, 1, 1,
-1.362367, 0.2588432, -1.533049, 1, 0, 0, 1, 1,
-1.361552, 0.8605672, -1.852275, 1, 0, 0, 1, 1,
-1.358575, 0.5269445, -1.549423, 1, 0, 0, 1, 1,
-1.349603, 0.2222702, -0.9010571, 1, 0, 0, 1, 1,
-1.339649, 0.7429314, -1.588051, 0, 0, 0, 1, 1,
-1.338219, -1.21914, -2.304448, 0, 0, 0, 1, 1,
-1.3364, -0.2408027, -2.733755, 0, 0, 0, 1, 1,
-1.335903, -2.167337, -4.404389, 0, 0, 0, 1, 1,
-1.332845, 0.1309382, -1.345544, 0, 0, 0, 1, 1,
-1.322043, 1.637146, 1.220621, 0, 0, 0, 1, 1,
-1.319645, -0.9731883, -2.863066, 0, 0, 0, 1, 1,
-1.311863, -1.367112, -2.636877, 1, 1, 1, 1, 1,
-1.311729, -0.2288293, -2.632443, 1, 1, 1, 1, 1,
-1.30488, 0.05498544, -1.176227, 1, 1, 1, 1, 1,
-1.298321, -1.347312, -1.423975, 1, 1, 1, 1, 1,
-1.295421, 1.47866, 0.8647632, 1, 1, 1, 1, 1,
-1.287844, 0.1590765, -0.8615223, 1, 1, 1, 1, 1,
-1.286267, 0.9499444, 0.1257768, 1, 1, 1, 1, 1,
-1.285204, -0.584991, -1.351612, 1, 1, 1, 1, 1,
-1.271173, 1.399355, -3.445537, 1, 1, 1, 1, 1,
-1.267825, -0.6876434, -0.7454875, 1, 1, 1, 1, 1,
-1.258313, 1.526626, 0.3727123, 1, 1, 1, 1, 1,
-1.249468, 0.1412995, -0.08928613, 1, 1, 1, 1, 1,
-1.246136, -0.4636055, -1.86338, 1, 1, 1, 1, 1,
-1.245628, -0.1930954, -3.034573, 1, 1, 1, 1, 1,
-1.241422, -0.0455666, -2.442945, 1, 1, 1, 1, 1,
-1.232501, 2.194184, 0.5845743, 0, 0, 1, 1, 1,
-1.228191, -0.1129911, -2.801661, 1, 0, 0, 1, 1,
-1.216961, -0.4260581, -3.747957, 1, 0, 0, 1, 1,
-1.216612, -0.6594042, -3.267269, 1, 0, 0, 1, 1,
-1.216059, 0.3295282, -0.920163, 1, 0, 0, 1, 1,
-1.215772, -0.9797386, -1.981015, 1, 0, 0, 1, 1,
-1.203127, 0.4480248, -1.54957, 0, 0, 0, 1, 1,
-1.200181, 2.263634, -2.080426, 0, 0, 0, 1, 1,
-1.195311, -0.4508052, -0.9297174, 0, 0, 0, 1, 1,
-1.193318, 0.704191, -1.632425, 0, 0, 0, 1, 1,
-1.193143, -1.709542, -1.677378, 0, 0, 0, 1, 1,
-1.191719, 0.6324351, -0.8635744, 0, 0, 0, 1, 1,
-1.181328, 1.80628, -1.082389, 0, 0, 0, 1, 1,
-1.178791, -1.280509, -2.243254, 1, 1, 1, 1, 1,
-1.168116, 0.6823178, -1.334122, 1, 1, 1, 1, 1,
-1.155553, -1.086018, -1.384676, 1, 1, 1, 1, 1,
-1.155484, -0.8946273, -1.449404, 1, 1, 1, 1, 1,
-1.152012, -0.5566228, -1.667831, 1, 1, 1, 1, 1,
-1.139441, -0.6203666, -2.550202, 1, 1, 1, 1, 1,
-1.135329, -0.3825814, -1.426719, 1, 1, 1, 1, 1,
-1.127981, 0.4771868, -0.0924475, 1, 1, 1, 1, 1,
-1.09697, -0.1304498, -0.73997, 1, 1, 1, 1, 1,
-1.088576, -0.5664475, 0.1055909, 1, 1, 1, 1, 1,
-1.08296, -2.101395, -1.275808, 1, 1, 1, 1, 1,
-1.081588, 0.04040194, -0.4961793, 1, 1, 1, 1, 1,
-1.070296, 2.068074, -2.002169, 1, 1, 1, 1, 1,
-1.065747, 0.0869251, 1.065847, 1, 1, 1, 1, 1,
-1.055818, -1.124309, -3.02845, 1, 1, 1, 1, 1,
-1.051222, -0.7168369, -0.1675744, 0, 0, 1, 1, 1,
-1.049499, 0.6258067, 0.05997121, 1, 0, 0, 1, 1,
-1.045986, -1.294101, -3.182937, 1, 0, 0, 1, 1,
-1.044449, -0.3434254, -1.861547, 1, 0, 0, 1, 1,
-1.044267, 1.359615, -1.968529, 1, 0, 0, 1, 1,
-1.041374, 1.198335, 0.3541278, 1, 0, 0, 1, 1,
-1.035545, 1.155627, -1.229396, 0, 0, 0, 1, 1,
-1.035117, 0.7085481, -1.288286, 0, 0, 0, 1, 1,
-1.033392, 0.1603911, -1.096523, 0, 0, 0, 1, 1,
-1.031548, -0.02988543, 0.2429823, 0, 0, 0, 1, 1,
-1.025542, 0.3903938, -0.4894227, 0, 0, 0, 1, 1,
-1.023058, 0.3696161, -3.392482, 0, 0, 0, 1, 1,
-1.022247, -0.3488552, -2.919807, 0, 0, 0, 1, 1,
-1.021075, 1.264597, 0.2220942, 1, 1, 1, 1, 1,
-1.016483, 0.03856212, -0.5657917, 1, 1, 1, 1, 1,
-1.008718, 0.207116, -1.18155, 1, 1, 1, 1, 1,
-1.001667, 0.5441031, -0.9820659, 1, 1, 1, 1, 1,
-0.9994093, -0.5600793, -1.46398, 1, 1, 1, 1, 1,
-0.997689, -2.027451, -3.069944, 1, 1, 1, 1, 1,
-0.9968427, -1.653076, -4.14571, 1, 1, 1, 1, 1,
-0.9965632, 0.6832132, 0.1173528, 1, 1, 1, 1, 1,
-0.9910476, -0.2717585, -2.404398, 1, 1, 1, 1, 1,
-0.9847957, 0.03206555, -1.037325, 1, 1, 1, 1, 1,
-0.9765841, -0.6156915, -2.813365, 1, 1, 1, 1, 1,
-0.9746909, 2.070143, -2.347914, 1, 1, 1, 1, 1,
-0.9734377, -1.320569, -3.585368, 1, 1, 1, 1, 1,
-0.9728379, -0.3426968, -2.999019, 1, 1, 1, 1, 1,
-0.9723796, -1.525968, -1.587738, 1, 1, 1, 1, 1,
-0.97195, 0.07001838, -2.883485, 0, 0, 1, 1, 1,
-0.9679121, -0.001219063, -1.519861, 1, 0, 0, 1, 1,
-0.963149, -0.4818134, -1.409173, 1, 0, 0, 1, 1,
-0.9630336, -0.7301808, -4.165821, 1, 0, 0, 1, 1,
-0.9615759, 0.5134683, -0.3258868, 1, 0, 0, 1, 1,
-0.9584855, 0.01434324, -1.656359, 1, 0, 0, 1, 1,
-0.9575515, -0.8628636, -4.92605, 0, 0, 0, 1, 1,
-0.95703, -1.182585, -1.972663, 0, 0, 0, 1, 1,
-0.9569213, 0.07074325, -2.134851, 0, 0, 0, 1, 1,
-0.9528576, 0.5444948, 0.0006017719, 0, 0, 0, 1, 1,
-0.9520623, -0.2415563, -3.724445, 0, 0, 0, 1, 1,
-0.9520326, 0.09675108, -2.017149, 0, 0, 0, 1, 1,
-0.9519362, -0.5188118, -4.379732, 0, 0, 0, 1, 1,
-0.9497434, -0.6957902, -1.562443, 1, 1, 1, 1, 1,
-0.94846, -1.0997, -1.512897, 1, 1, 1, 1, 1,
-0.9411597, 1.423703, -2.030314, 1, 1, 1, 1, 1,
-0.9410623, 0.65159, -1.38132, 1, 1, 1, 1, 1,
-0.939573, -0.9838597, -3.201647, 1, 1, 1, 1, 1,
-0.9357646, -1.009533, -2.959291, 1, 1, 1, 1, 1,
-0.9319821, -1.099817, -0.924054, 1, 1, 1, 1, 1,
-0.9316552, -0.2024255, 0.6024091, 1, 1, 1, 1, 1,
-0.9297858, 1.065359, 0.2699992, 1, 1, 1, 1, 1,
-0.9289623, 0.5051822, -1.500855, 1, 1, 1, 1, 1,
-0.9269221, 0.663255, -0.3124177, 1, 1, 1, 1, 1,
-0.9184428, -0.3261167, -1.384358, 1, 1, 1, 1, 1,
-0.9137828, 0.3324294, -1.772744, 1, 1, 1, 1, 1,
-0.9119014, -1.339376, -2.93847, 1, 1, 1, 1, 1,
-0.9077385, 0.921655, -1.640979, 1, 1, 1, 1, 1,
-0.9064749, 0.3539441, -0.7392012, 0, 0, 1, 1, 1,
-0.9051998, 0.5743015, -0.6930438, 1, 0, 0, 1, 1,
-0.900518, 1.507884, 1.117425, 1, 0, 0, 1, 1,
-0.9002404, 0.09580166, -2.193557, 1, 0, 0, 1, 1,
-0.8959765, -0.3393904, -2.504402, 1, 0, 0, 1, 1,
-0.8933493, -1.127456, -3.230028, 1, 0, 0, 1, 1,
-0.8919085, 0.2532907, -0.6305215, 0, 0, 0, 1, 1,
-0.8917339, 0.3675021, -2.104611, 0, 0, 0, 1, 1,
-0.891291, 0.2644194, 0.1422545, 0, 0, 0, 1, 1,
-0.8889173, 0.6826561, -1.369499, 0, 0, 0, 1, 1,
-0.88252, 0.9173964, -0.7254373, 0, 0, 0, 1, 1,
-0.8641886, -1.410556, -0.8011503, 0, 0, 0, 1, 1,
-0.863694, 0.1106536, -2.162666, 0, 0, 0, 1, 1,
-0.8577136, -1.41862, -3.39238, 1, 1, 1, 1, 1,
-0.857703, -2.180133, -3.890425, 1, 1, 1, 1, 1,
-0.8556036, 1.269552, -0.6659592, 1, 1, 1, 1, 1,
-0.8548558, 1.137562, -0.5633987, 1, 1, 1, 1, 1,
-0.8535996, 0.8021103, 0.3691972, 1, 1, 1, 1, 1,
-0.8498018, -1.697366, -2.445172, 1, 1, 1, 1, 1,
-0.8477373, 0.01772179, -1.846243, 1, 1, 1, 1, 1,
-0.8423946, -0.09533435, -0.7823176, 1, 1, 1, 1, 1,
-0.8405716, -0.5495331, -2.144777, 1, 1, 1, 1, 1,
-0.8399213, -1.045421, -3.172483, 1, 1, 1, 1, 1,
-0.83796, 0.1673022, -2.038298, 1, 1, 1, 1, 1,
-0.8378181, 1.481653, -1.436686, 1, 1, 1, 1, 1,
-0.8374489, 0.530882, -2.10065, 1, 1, 1, 1, 1,
-0.8356776, 1.430297, -0.5135613, 1, 1, 1, 1, 1,
-0.8300936, 0.1669812, -2.203462, 1, 1, 1, 1, 1,
-0.8299925, 0.6298453, -0.9071756, 0, 0, 1, 1, 1,
-0.8284198, -0.5245975, -1.330418, 1, 0, 0, 1, 1,
-0.8261278, -0.1916786, -1.832678, 1, 0, 0, 1, 1,
-0.818171, 0.2968975, -1.460185, 1, 0, 0, 1, 1,
-0.8156955, -0.6479673, -3.905098, 1, 0, 0, 1, 1,
-0.8134037, -0.02130263, -0.5592712, 1, 0, 0, 1, 1,
-0.8118333, -0.8460205, -1.8146, 0, 0, 0, 1, 1,
-0.8111783, -0.105427, -1.014115, 0, 0, 0, 1, 1,
-0.8101899, 0.8484697, -1.8561, 0, 0, 0, 1, 1,
-0.8078153, -1.527402, -2.526266, 0, 0, 0, 1, 1,
-0.7954203, 0.9448147, -0.4043676, 0, 0, 0, 1, 1,
-0.7888064, -0.810383, -1.793428, 0, 0, 0, 1, 1,
-0.7879315, -0.6687344, -1.35255, 0, 0, 0, 1, 1,
-0.7878557, 0.9820981, 0.3613489, 1, 1, 1, 1, 1,
-0.7845686, 0.2456509, 0.2597671, 1, 1, 1, 1, 1,
-0.7834771, 0.4688678, -0.4901281, 1, 1, 1, 1, 1,
-0.7800716, 1.856021, -1.450522, 1, 1, 1, 1, 1,
-0.7798836, 0.1663889, -1.422096, 1, 1, 1, 1, 1,
-0.7788616, -1.363851, -2.487658, 1, 1, 1, 1, 1,
-0.7747508, 0.3344212, -2.215678, 1, 1, 1, 1, 1,
-0.7675623, -2.59391, -2.292085, 1, 1, 1, 1, 1,
-0.7654982, -0.4022409, -2.777126, 1, 1, 1, 1, 1,
-0.7648168, -0.1857203, -1.71855, 1, 1, 1, 1, 1,
-0.7633277, -0.1239121, -2.512408, 1, 1, 1, 1, 1,
-0.7535803, -0.1928274, 0.7709761, 1, 1, 1, 1, 1,
-0.7512149, -0.6150994, -2.847847, 1, 1, 1, 1, 1,
-0.7490447, 0.9078181, -2.321239, 1, 1, 1, 1, 1,
-0.7449934, -0.6118528, -1.966457, 1, 1, 1, 1, 1,
-0.7414436, -0.8146433, -2.207544, 0, 0, 1, 1, 1,
-0.7383548, -0.2612893, -2.193487, 1, 0, 0, 1, 1,
-0.7285329, -2.112008, -2.878038, 1, 0, 0, 1, 1,
-0.7273485, -0.81381, -2.139249, 1, 0, 0, 1, 1,
-0.7262331, 0.5344046, 0.6536635, 1, 0, 0, 1, 1,
-0.7227505, 0.5093163, -0.9536697, 1, 0, 0, 1, 1,
-0.7205516, 1.08402, 0.2977667, 0, 0, 0, 1, 1,
-0.718784, 0.197128, -0.3869653, 0, 0, 0, 1, 1,
-0.7183858, -0.4795404, -0.8556594, 0, 0, 0, 1, 1,
-0.7158675, -0.6755663, -2.522402, 0, 0, 0, 1, 1,
-0.7096568, -0.7030501, -2.857488, 0, 0, 0, 1, 1,
-0.704744, 0.4582565, -1.582127, 0, 0, 0, 1, 1,
-0.7007016, -2.489667, -2.466004, 0, 0, 0, 1, 1,
-0.6993755, 0.6511931, -1.233297, 1, 1, 1, 1, 1,
-0.6856732, -0.1471286, -2.849587, 1, 1, 1, 1, 1,
-0.6829649, 0.04547229, -1.570215, 1, 1, 1, 1, 1,
-0.675239, -0.1449798, -0.4589257, 1, 1, 1, 1, 1,
-0.675212, 1.479404, -0.8919467, 1, 1, 1, 1, 1,
-0.6749936, -0.9998146, -3.150426, 1, 1, 1, 1, 1,
-0.6642169, 0.7203574, -0.2320476, 1, 1, 1, 1, 1,
-0.662087, 0.3880408, -0.6425345, 1, 1, 1, 1, 1,
-0.6606302, 1.008448, 0.3760991, 1, 1, 1, 1, 1,
-0.6592539, -0.6609265, -1.529378, 1, 1, 1, 1, 1,
-0.6591551, -1.76294, -0.8998285, 1, 1, 1, 1, 1,
-0.6475585, -1.030591, -2.796102, 1, 1, 1, 1, 1,
-0.6395755, 1.060745, 0.4903235, 1, 1, 1, 1, 1,
-0.6326847, -0.3932098, -1.385486, 1, 1, 1, 1, 1,
-0.6320457, 0.1347926, -2.820394, 1, 1, 1, 1, 1,
-0.6295661, -0.5313351, -1.700357, 0, 0, 1, 1, 1,
-0.626776, -0.9133465, -3.13258, 1, 0, 0, 1, 1,
-0.623913, 1.528898, -0.0265275, 1, 0, 0, 1, 1,
-0.6155427, -0.8065854, -2.831918, 1, 0, 0, 1, 1,
-0.6138816, 1.042094, -1.676068, 1, 0, 0, 1, 1,
-0.6112028, -1.345221, -2.345017, 1, 0, 0, 1, 1,
-0.6109461, -0.252607, -2.4523, 0, 0, 0, 1, 1,
-0.6089491, -0.2071504, -1.284792, 0, 0, 0, 1, 1,
-0.608191, 0.3674301, 0.5249537, 0, 0, 0, 1, 1,
-0.6079895, 0.2696628, -2.362538, 0, 0, 0, 1, 1,
-0.6051559, 0.1973335, -0.3170918, 0, 0, 0, 1, 1,
-0.6051207, -0.2085373, -2.166414, 0, 0, 0, 1, 1,
-0.6047847, -1.782995, -4.047425, 0, 0, 0, 1, 1,
-0.6044182, -0.05166628, -1.478067, 1, 1, 1, 1, 1,
-0.6028422, -1.400549, -4.819347, 1, 1, 1, 1, 1,
-0.5981835, 1.308686, 0.9507999, 1, 1, 1, 1, 1,
-0.5945315, -0.9198332, -3.231691, 1, 1, 1, 1, 1,
-0.5819256, 0.3370551, 0.3459289, 1, 1, 1, 1, 1,
-0.5769691, -0.2402139, -5.10398, 1, 1, 1, 1, 1,
-0.5747199, -0.4616061, -2.299436, 1, 1, 1, 1, 1,
-0.5629171, -1.900361, -3.962606, 1, 1, 1, 1, 1,
-0.5593195, -1.066226, -3.693062, 1, 1, 1, 1, 1,
-0.5575382, 1.455683, 0.09646536, 1, 1, 1, 1, 1,
-0.5543438, 1.152842, -1.00462, 1, 1, 1, 1, 1,
-0.5506746, 0.4619003, -0.7974004, 1, 1, 1, 1, 1,
-0.548587, -2.131221, -2.898286, 1, 1, 1, 1, 1,
-0.5467309, 0.2548322, -0.3958508, 1, 1, 1, 1, 1,
-0.5438855, -0.0591216, -2.629691, 1, 1, 1, 1, 1,
-0.5405912, -0.0516512, -3.136052, 0, 0, 1, 1, 1,
-0.5393378, -0.3800147, -1.330938, 1, 0, 0, 1, 1,
-0.5380983, 0.04897063, -3.288437, 1, 0, 0, 1, 1,
-0.5342343, 0.04929191, -2.306643, 1, 0, 0, 1, 1,
-0.5342082, -0.2995228, -2.221294, 1, 0, 0, 1, 1,
-0.5292604, -0.1113756, -2.477582, 1, 0, 0, 1, 1,
-0.5279416, 0.07444089, -0.5779568, 0, 0, 0, 1, 1,
-0.5267623, 2.188545, -1.70626, 0, 0, 0, 1, 1,
-0.5267492, -0.2606207, -2.784055, 0, 0, 0, 1, 1,
-0.521307, 1.23962, 0.3858393, 0, 0, 0, 1, 1,
-0.5156665, 0.3756256, -0.7061864, 0, 0, 0, 1, 1,
-0.5141183, -0.8689167, -2.818523, 0, 0, 0, 1, 1,
-0.5138726, 0.9221622, -0.4762846, 0, 0, 0, 1, 1,
-0.5116487, -0.2475755, -3.00551, 1, 1, 1, 1, 1,
-0.5087324, -1.039611, -3.92377, 1, 1, 1, 1, 1,
-0.5071447, 1.47266, 0.8475647, 1, 1, 1, 1, 1,
-0.5046986, 0.8418422, -2.118997, 1, 1, 1, 1, 1,
-0.5014665, -0.5577116, -3.103923, 1, 1, 1, 1, 1,
-0.4993514, 0.836217, -0.4605864, 1, 1, 1, 1, 1,
-0.4973034, 0.3122824, -3.295397, 1, 1, 1, 1, 1,
-0.4969307, -0.03743167, -3.484778, 1, 1, 1, 1, 1,
-0.4964485, -0.3738501, -2.016976, 1, 1, 1, 1, 1,
-0.4931752, 0.5729628, 0.1767342, 1, 1, 1, 1, 1,
-0.4902876, 1.57069, -0.7322513, 1, 1, 1, 1, 1,
-0.4898227, 0.3769893, -1.309683, 1, 1, 1, 1, 1,
-0.4895591, -1.227943, -0.9632488, 1, 1, 1, 1, 1,
-0.4878488, -0.1307685, -1.413576, 1, 1, 1, 1, 1,
-0.4841026, 0.2841808, -0.2311551, 1, 1, 1, 1, 1,
-0.4769086, 0.2341324, -1.228584, 0, 0, 1, 1, 1,
-0.4664655, 0.7946193, 0.7630271, 1, 0, 0, 1, 1,
-0.4649352, 1.192754, -2.27505, 1, 0, 0, 1, 1,
-0.4581986, -1.458796, -2.154466, 1, 0, 0, 1, 1,
-0.455303, 0.2878698, 1.100707, 1, 0, 0, 1, 1,
-0.4524886, -1.47564, -1.789817, 1, 0, 0, 1, 1,
-0.4514023, -0.8300305, -3.134906, 0, 0, 0, 1, 1,
-0.4478127, 0.873516, -0.1387841, 0, 0, 0, 1, 1,
-0.4429388, -0.6684566, -0.7826096, 0, 0, 0, 1, 1,
-0.4426741, -0.50225, -2.656977, 0, 0, 0, 1, 1,
-0.4423729, -1.266217, -3.322415, 0, 0, 0, 1, 1,
-0.4412438, 0.785036, 0.674555, 0, 0, 0, 1, 1,
-0.4388265, -0.4015803, -0.8205278, 0, 0, 0, 1, 1,
-0.4382762, -0.6285872, -1.290239, 1, 1, 1, 1, 1,
-0.4375043, 0.5034326, 0.3375292, 1, 1, 1, 1, 1,
-0.4348231, -2.240259, -2.657321, 1, 1, 1, 1, 1,
-0.4259966, 0.6886595, -1.816889, 1, 1, 1, 1, 1,
-0.4201954, 0.7540794, -0.5385385, 1, 1, 1, 1, 1,
-0.4189667, -0.8313757, -2.900796, 1, 1, 1, 1, 1,
-0.4172546, -2.425951, -2.590909, 1, 1, 1, 1, 1,
-0.4168503, -0.7195176, -2.459611, 1, 1, 1, 1, 1,
-0.4069328, -0.3338605, -3.677599, 1, 1, 1, 1, 1,
-0.4059862, 1.402979, 0.1290906, 1, 1, 1, 1, 1,
-0.4054891, -0.06211837, -2.850931, 1, 1, 1, 1, 1,
-0.4053107, 0.4903731, 0.2221389, 1, 1, 1, 1, 1,
-0.4050694, -0.76997, -2.957427, 1, 1, 1, 1, 1,
-0.4031468, 1.800841, -0.4297912, 1, 1, 1, 1, 1,
-0.4019198, -0.3616285, -0.6804453, 1, 1, 1, 1, 1,
-0.3981059, -0.6008517, -2.977897, 0, 0, 1, 1, 1,
-0.3976447, -0.4572813, -4.227321, 1, 0, 0, 1, 1,
-0.3953362, -2.645072, -4.317589, 1, 0, 0, 1, 1,
-0.3921068, -1.004901, -3.063242, 1, 0, 0, 1, 1,
-0.3900355, 0.2769966, -1.436806, 1, 0, 0, 1, 1,
-0.3886968, 0.9980029, 0.1382978, 1, 0, 0, 1, 1,
-0.3828378, 1.149556, -1.843838, 0, 0, 0, 1, 1,
-0.3801594, -1.285619, -3.743073, 0, 0, 0, 1, 1,
-0.3794405, 1.550229, -0.8457441, 0, 0, 0, 1, 1,
-0.3791964, -1.121239, -2.510662, 0, 0, 0, 1, 1,
-0.3785708, -0.2054639, -4.205691, 0, 0, 0, 1, 1,
-0.3778912, 1.606454, -0.04318501, 0, 0, 0, 1, 1,
-0.3747624, 0.7211795, -0.9382473, 0, 0, 0, 1, 1,
-0.3743256, -0.625851, -2.074185, 1, 1, 1, 1, 1,
-0.3647007, 1.22986, 0.8151439, 1, 1, 1, 1, 1,
-0.3610159, 0.7066645, 0.03956411, 1, 1, 1, 1, 1,
-0.360982, -1.689186, -3.068903, 1, 1, 1, 1, 1,
-0.3603967, -0.1556642, -1.859481, 1, 1, 1, 1, 1,
-0.3590559, -0.2751283, -3.046191, 1, 1, 1, 1, 1,
-0.3573525, 1.204512, 0.08043864, 1, 1, 1, 1, 1,
-0.3567397, 0.789019, -0.1366926, 1, 1, 1, 1, 1,
-0.3545169, 0.228076, -0.8888571, 1, 1, 1, 1, 1,
-0.3511479, 0.8768672, 0.1068395, 1, 1, 1, 1, 1,
-0.3477959, 0.0195016, -1.900615, 1, 1, 1, 1, 1,
-0.3423836, -0.003364734, -0.2909, 1, 1, 1, 1, 1,
-0.3415172, -0.5506179, -2.514848, 1, 1, 1, 1, 1,
-0.3409554, -1.355686, -3.842412, 1, 1, 1, 1, 1,
-0.3408418, 0.03474972, -1.584999, 1, 1, 1, 1, 1,
-0.3395532, -2.534407, -3.0972, 0, 0, 1, 1, 1,
-0.3387801, -0.9874291, -3.921414, 1, 0, 0, 1, 1,
-0.3346726, -1.215851, -2.92535, 1, 0, 0, 1, 1,
-0.3306866, 0.415767, -0.5083109, 1, 0, 0, 1, 1,
-0.3237497, -1.092775, -2.295905, 1, 0, 0, 1, 1,
-0.3234739, 0.256082, -1.495968, 1, 0, 0, 1, 1,
-0.3204892, -0.3755262, -3.430536, 0, 0, 0, 1, 1,
-0.3176681, 1.693984, 0.2931707, 0, 0, 0, 1, 1,
-0.3155248, -0.2601502, -2.201906, 0, 0, 0, 1, 1,
-0.3085793, 0.8191198, -1.0574, 0, 0, 0, 1, 1,
-0.308362, 0.2363196, -1.80981, 0, 0, 0, 1, 1,
-0.3074968, -0.06735781, -2.543361, 0, 0, 0, 1, 1,
-0.3073035, 0.3867742, 0.5056301, 0, 0, 0, 1, 1,
-0.3051223, -1.575406, -3.025726, 1, 1, 1, 1, 1,
-0.3030481, 0.4006923, -1.87777, 1, 1, 1, 1, 1,
-0.301463, 0.3201446, -0.5986816, 1, 1, 1, 1, 1,
-0.2979564, 0.3904047, -0.6271295, 1, 1, 1, 1, 1,
-0.2966169, -0.3159508, -3.683005, 1, 1, 1, 1, 1,
-0.2938346, -0.3525307, -4.727595, 1, 1, 1, 1, 1,
-0.2931055, -0.6723998, -1.874346, 1, 1, 1, 1, 1,
-0.2906738, 1.301029, -0.4012767, 1, 1, 1, 1, 1,
-0.289402, 0.4942787, 0.2088449, 1, 1, 1, 1, 1,
-0.2859301, 1.432933, -1.057989, 1, 1, 1, 1, 1,
-0.2847389, 0.3873157, -0.6517563, 1, 1, 1, 1, 1,
-0.2842096, -0.9592524, -2.600865, 1, 1, 1, 1, 1,
-0.2841173, 0.4876084, -2.377579, 1, 1, 1, 1, 1,
-0.2828711, 0.5011243, 0.01943877, 1, 1, 1, 1, 1,
-0.2724313, -1.365983, -4.422048, 1, 1, 1, 1, 1,
-0.2701144, 0.6484585, -0.9483602, 0, 0, 1, 1, 1,
-0.2662145, -1.78679, -4.407495, 1, 0, 0, 1, 1,
-0.2661633, -1.722144, -3.13425, 1, 0, 0, 1, 1,
-0.2628944, 0.7937187, 0.2019817, 1, 0, 0, 1, 1,
-0.2621803, 0.3341225, 1.543513, 1, 0, 0, 1, 1,
-0.2620716, -0.27307, -2.574381, 1, 0, 0, 1, 1,
-0.2620667, -1.330744, -2.235473, 0, 0, 0, 1, 1,
-0.2576563, -1.782557, -2.487537, 0, 0, 0, 1, 1,
-0.2540312, -0.7672338, -2.632663, 0, 0, 0, 1, 1,
-0.2530607, 0.1390324, -1.248607, 0, 0, 0, 1, 1,
-0.2483796, -0.00597752, -2.030535, 0, 0, 0, 1, 1,
-0.245593, -0.253998, -2.817895, 0, 0, 0, 1, 1,
-0.2419838, 1.433246, -1.073323, 0, 0, 0, 1, 1,
-0.2409436, -0.1070464, -1.844521, 1, 1, 1, 1, 1,
-0.2405059, 0.7980377, 1.419479, 1, 1, 1, 1, 1,
-0.2393919, 0.3688963, 0.3764447, 1, 1, 1, 1, 1,
-0.2390465, -0.9801915, -2.887038, 1, 1, 1, 1, 1,
-0.2339675, -0.2660689, -3.150232, 1, 1, 1, 1, 1,
-0.2304674, -0.9454409, -3.127235, 1, 1, 1, 1, 1,
-0.221555, 0.1429672, -0.4192155, 1, 1, 1, 1, 1,
-0.2180614, -0.8222573, -2.05252, 1, 1, 1, 1, 1,
-0.2163055, 2.327057, 0.5383809, 1, 1, 1, 1, 1,
-0.2136106, -1.219514, -2.846073, 1, 1, 1, 1, 1,
-0.2099293, 0.03765219, -1.875088, 1, 1, 1, 1, 1,
-0.2089274, 0.05749208, 1.024589, 1, 1, 1, 1, 1,
-0.2053504, -0.8944889, -3.974386, 1, 1, 1, 1, 1,
-0.2035288, 0.1508739, -1.414359, 1, 1, 1, 1, 1,
-0.2032134, -1.257401, -4.117613, 1, 1, 1, 1, 1,
-0.1988631, 0.6463757, -0.9945715, 0, 0, 1, 1, 1,
-0.1982035, 0.8329545, 0.1884075, 1, 0, 0, 1, 1,
-0.1894748, -0.4852879, -2.33438, 1, 0, 0, 1, 1,
-0.1857874, 0.1475826, -0.9334971, 1, 0, 0, 1, 1,
-0.184373, -0.04005995, -2.272822, 1, 0, 0, 1, 1,
-0.1792666, -0.1246705, -2.314512, 1, 0, 0, 1, 1,
-0.1785571, 1.136764, 0.05757787, 0, 0, 0, 1, 1,
-0.1747651, -0.403662, -3.552111, 0, 0, 0, 1, 1,
-0.1692808, -0.3950831, -1.981082, 0, 0, 0, 1, 1,
-0.1652935, -1.098482, -3.322568, 0, 0, 0, 1, 1,
-0.1622369, 1.096423, 0.4176915, 0, 0, 0, 1, 1,
-0.1492094, -1.00564, -2.614975, 0, 0, 0, 1, 1,
-0.148257, 0.288341, 1.318881, 0, 0, 0, 1, 1,
-0.1475074, -0.4219634, -3.503484, 1, 1, 1, 1, 1,
-0.1459784, -0.3783659, -2.144589, 1, 1, 1, 1, 1,
-0.145091, -0.2388583, -5.385554, 1, 1, 1, 1, 1,
-0.1395079, -1.098831, -2.764785, 1, 1, 1, 1, 1,
-0.13497, -1.507385, -2.829814, 1, 1, 1, 1, 1,
-0.1335257, 0.6595415, -1.297898, 1, 1, 1, 1, 1,
-0.1315525, 0.8991306, -1.950997, 1, 1, 1, 1, 1,
-0.1217933, 0.1804644, -1.196361, 1, 1, 1, 1, 1,
-0.1197348, -0.8714733, -1.584383, 1, 1, 1, 1, 1,
-0.1112252, 1.261116, 0.729804, 1, 1, 1, 1, 1,
-0.1111495, 0.7209703, -0.7175959, 1, 1, 1, 1, 1,
-0.1063902, -0.7057974, -2.470811, 1, 1, 1, 1, 1,
-0.1050491, -2.068357, -2.909566, 1, 1, 1, 1, 1,
-0.1023672, -0.08468837, -1.81166, 1, 1, 1, 1, 1,
-0.09971903, 0.02718587, -2.185065, 1, 1, 1, 1, 1,
-0.09946474, -0.2853624, -2.626678, 0, 0, 1, 1, 1,
-0.0961742, 0.4895259, -1.091993, 1, 0, 0, 1, 1,
-0.09615143, 0.8350156, -0.1883641, 1, 0, 0, 1, 1,
-0.09597775, 0.7126571, 1.039694, 1, 0, 0, 1, 1,
-0.09548742, 0.2429081, 0.5720694, 1, 0, 0, 1, 1,
-0.09205199, 1.850852, 0.9756646, 1, 0, 0, 1, 1,
-0.0896204, 0.4886155, 0.7110957, 0, 0, 0, 1, 1,
-0.08554858, -0.5884185, -3.023544, 0, 0, 0, 1, 1,
-0.08536027, 0.8015727, 0.4886624, 0, 0, 0, 1, 1,
-0.07933351, -0.2720121, -4.510031, 0, 0, 0, 1, 1,
-0.0778271, -0.3153899, -3.518133, 0, 0, 0, 1, 1,
-0.07669775, 0.1604359, -0.9544948, 0, 0, 0, 1, 1,
-0.0757324, -0.3874423, -1.10163, 0, 0, 0, 1, 1,
-0.07531363, 1.545939, -2.241465, 1, 1, 1, 1, 1,
-0.07381792, 0.5668933, 0.2754501, 1, 1, 1, 1, 1,
-0.07264625, 0.7580824, 1.926254, 1, 1, 1, 1, 1,
-0.07163732, -1.618006, -3.677563, 1, 1, 1, 1, 1,
-0.07142793, 0.6544415, 0.9778901, 1, 1, 1, 1, 1,
-0.06725793, -1.876207, -1.108961, 1, 1, 1, 1, 1,
-0.06673869, -0.226854, -3.439915, 1, 1, 1, 1, 1,
-0.05895929, -1.209983, -4.348211, 1, 1, 1, 1, 1,
-0.05714084, 1.499178, -0.007769739, 1, 1, 1, 1, 1,
-0.05555945, 0.08564328, 0.2196906, 1, 1, 1, 1, 1,
-0.05350468, 0.7674857, 0.6614416, 1, 1, 1, 1, 1,
-0.05057104, 1.125088, -0.5843122, 1, 1, 1, 1, 1,
-0.04695059, -0.5395874, -3.658975, 1, 1, 1, 1, 1,
-0.04665042, -1.640043, -3.85301, 1, 1, 1, 1, 1,
-0.04513264, 0.279962, 0.06065883, 1, 1, 1, 1, 1,
-0.0443342, -1.400721, -4.214345, 0, 0, 1, 1, 1,
-0.04071526, 1.702677, -0.4091292, 1, 0, 0, 1, 1,
-0.03743352, -0.9284695, -2.787851, 1, 0, 0, 1, 1,
-0.03721178, 0.1631344, 0.5192156, 1, 0, 0, 1, 1,
-0.03646109, -1.481328, -2.339635, 1, 0, 0, 1, 1,
-0.02273487, -0.1920142, -3.897818, 1, 0, 0, 1, 1,
-0.003139381, 0.1621442, 0.2716628, 0, 0, 0, 1, 1,
-0.002522441, 0.589738, 0.1323641, 0, 0, 0, 1, 1,
0.003673358, 2.010527, 0.1074408, 0, 0, 0, 1, 1,
0.004762269, 1.801085, 2.326322, 0, 0, 0, 1, 1,
0.007418565, 0.427983, -0.03022015, 0, 0, 0, 1, 1,
0.007682454, 0.7923214, 0.1665887, 0, 0, 0, 1, 1,
0.01075096, 0.5285029, 0.37438, 0, 0, 0, 1, 1,
0.01282467, 0.8595871, 0.9319272, 1, 1, 1, 1, 1,
0.01796208, 1.389554, -0.2637439, 1, 1, 1, 1, 1,
0.01873484, 1.264568, 2.943403, 1, 1, 1, 1, 1,
0.02018978, -0.4727677, 4.489411, 1, 1, 1, 1, 1,
0.02033604, -0.955166, 4.519334, 1, 1, 1, 1, 1,
0.0257143, -0.1545795, 1.698491, 1, 1, 1, 1, 1,
0.02648811, 1.970339, 0.9252841, 1, 1, 1, 1, 1,
0.02844837, -0.6176257, 3.350276, 1, 1, 1, 1, 1,
0.02903478, -0.2532394, 4.224217, 1, 1, 1, 1, 1,
0.03122575, 1.307169, -0.8061106, 1, 1, 1, 1, 1,
0.03158893, -0.5853831, 2.863371, 1, 1, 1, 1, 1,
0.03473786, -0.7607457, 2.804941, 1, 1, 1, 1, 1,
0.03514515, 0.8941023, -0.5747827, 1, 1, 1, 1, 1,
0.04014619, 0.6896978, 0.1446082, 1, 1, 1, 1, 1,
0.04146858, 1.760961, -1.01394, 1, 1, 1, 1, 1,
0.04373372, -1.395228, 3.52567, 0, 0, 1, 1, 1,
0.04812452, -1.265831, 5.194614, 1, 0, 0, 1, 1,
0.04972626, 0.04181475, -0.8545628, 1, 0, 0, 1, 1,
0.05157335, 0.2770562, -2.328592, 1, 0, 0, 1, 1,
0.05558523, -0.0006869993, 2.348421, 1, 0, 0, 1, 1,
0.05626969, -0.3545956, 2.12736, 1, 0, 0, 1, 1,
0.0563881, -0.5303372, 2.988029, 0, 0, 0, 1, 1,
0.05809153, -0.4390571, 3.185558, 0, 0, 0, 1, 1,
0.06395713, 0.3162803, -2.429489, 0, 0, 0, 1, 1,
0.06647857, -2.064059, 0.8758404, 0, 0, 0, 1, 1,
0.06733109, 0.4952599, 0.852168, 0, 0, 0, 1, 1,
0.06827177, 0.2905983, -1.610633, 0, 0, 0, 1, 1,
0.06846187, 0.2204479, 0.3554609, 0, 0, 0, 1, 1,
0.06899191, -0.6711754, 2.103488, 1, 1, 1, 1, 1,
0.07605986, 0.9508786, -0.1795047, 1, 1, 1, 1, 1,
0.07758573, 0.4712557, 0.9089307, 1, 1, 1, 1, 1,
0.079757, 1.802061, 2.205932, 1, 1, 1, 1, 1,
0.08087248, -1.208463, 3.710173, 1, 1, 1, 1, 1,
0.08275396, -0.2239003, 2.53703, 1, 1, 1, 1, 1,
0.08553883, -0.712266, 5.136929, 1, 1, 1, 1, 1,
0.08964536, -0.9724309, 3.756353, 1, 1, 1, 1, 1,
0.08966292, 0.6702462, -0.3110372, 1, 1, 1, 1, 1,
0.09273563, -0.02125896, 2.654485, 1, 1, 1, 1, 1,
0.09316503, -1.429488, 1.984308, 1, 1, 1, 1, 1,
0.1037784, -1.7846, 3.766008, 1, 1, 1, 1, 1,
0.110541, -1.831127, 2.92871, 1, 1, 1, 1, 1,
0.1133676, 0.2170347, 2.594368, 1, 1, 1, 1, 1,
0.1146522, 0.2233778, 0.3164286, 1, 1, 1, 1, 1,
0.1199141, -0.760035, 3.080943, 0, 0, 1, 1, 1,
0.1213668, -0.1408703, 2.700874, 1, 0, 0, 1, 1,
0.1255972, 0.440044, -0.6362637, 1, 0, 0, 1, 1,
0.1258296, -0.6163425, 2.099342, 1, 0, 0, 1, 1,
0.1267296, -0.9086476, 3.812768, 1, 0, 0, 1, 1,
0.1273704, -0.07699127, 1.636504, 1, 0, 0, 1, 1,
0.1284855, -0.7712684, 3.02016, 0, 0, 0, 1, 1,
0.1310357, -0.04815999, 0.8364184, 0, 0, 0, 1, 1,
0.1336248, 0.7789698, -0.9744615, 0, 0, 0, 1, 1,
0.1356228, -0.9753249, 3.050153, 0, 0, 0, 1, 1,
0.1419079, 1.229338, 0.01538084, 0, 0, 0, 1, 1,
0.1426713, -0.5489978, 1.426026, 0, 0, 0, 1, 1,
0.1467798, -0.411999, 2.652977, 0, 0, 0, 1, 1,
0.1476976, 1.327237, 0.280757, 1, 1, 1, 1, 1,
0.1486398, 1.099837, -2.080289, 1, 1, 1, 1, 1,
0.1489873, -1.047563, 3.152359, 1, 1, 1, 1, 1,
0.1493076, 0.8046123, 1.201433, 1, 1, 1, 1, 1,
0.1498839, -0.7709388, 1.755731, 1, 1, 1, 1, 1,
0.1527622, 0.7561625, 0.9512371, 1, 1, 1, 1, 1,
0.1533681, 0.2917351, 0.9444157, 1, 1, 1, 1, 1,
0.1542569, 1.033932, -0.4221254, 1, 1, 1, 1, 1,
0.1550607, 0.006100579, 1.590556, 1, 1, 1, 1, 1,
0.1564237, -0.7197523, 3.782259, 1, 1, 1, 1, 1,
0.1580494, -0.8838996, 2.757272, 1, 1, 1, 1, 1,
0.1593001, -0.2274894, 3.193997, 1, 1, 1, 1, 1,
0.1594511, -0.2813803, 1.204752, 1, 1, 1, 1, 1,
0.1607233, 0.918007, -1.175048, 1, 1, 1, 1, 1,
0.1622532, 2.374543, -1.027774, 1, 1, 1, 1, 1,
0.1629179, -0.2216407, 2.720313, 0, 0, 1, 1, 1,
0.169921, -0.2803606, 2.886253, 1, 0, 0, 1, 1,
0.1739229, 0.1463713, 1.939854, 1, 0, 0, 1, 1,
0.1748855, -0.7683761, 3.29725, 1, 0, 0, 1, 1,
0.175341, -2.154819, 3.490286, 1, 0, 0, 1, 1,
0.1755669, 0.198543, 1.976647, 1, 0, 0, 1, 1,
0.1775056, 1.618385, 0.2235589, 0, 0, 0, 1, 1,
0.1802685, -1.232308, 3.027633, 0, 0, 0, 1, 1,
0.181907, 0.62023, 0.398351, 0, 0, 0, 1, 1,
0.1820939, -0.7146096, 3.484388, 0, 0, 0, 1, 1,
0.1850614, -1.686794, 3.717279, 0, 0, 0, 1, 1,
0.1858438, -0.2894528, 0.1372399, 0, 0, 0, 1, 1,
0.1972352, 0.9125563, -0.3715545, 0, 0, 0, 1, 1,
0.2073867, 1.477344, -0.7444676, 1, 1, 1, 1, 1,
0.2080941, 0.5453134, 1.267704, 1, 1, 1, 1, 1,
0.211123, 0.7967278, -0.5476778, 1, 1, 1, 1, 1,
0.2131047, 0.8440556, -1.546363, 1, 1, 1, 1, 1,
0.2134489, -0.2676844, 2.569531, 1, 1, 1, 1, 1,
0.216415, -0.4071644, 3.487861, 1, 1, 1, 1, 1,
0.2176225, -0.3836051, 2.325384, 1, 1, 1, 1, 1,
0.2209658, -0.2194209, 4.064115, 1, 1, 1, 1, 1,
0.2220474, -1.846396, 0.3156406, 1, 1, 1, 1, 1,
0.222716, 0.7709616, 0.9534174, 1, 1, 1, 1, 1,
0.224136, 0.5899303, -0.4866501, 1, 1, 1, 1, 1,
0.2270158, -0.5554841, 2.018884, 1, 1, 1, 1, 1,
0.2277283, 0.09138854, 1.001654, 1, 1, 1, 1, 1,
0.2390291, 0.9213192, 0.3059719, 1, 1, 1, 1, 1,
0.2401059, 1.8231, 0.3712247, 1, 1, 1, 1, 1,
0.2413426, -0.5619875, 2.392785, 0, 0, 1, 1, 1,
0.2440872, 0.4253525, -1.491771, 1, 0, 0, 1, 1,
0.2476348, -0.9262185, 0.7475925, 1, 0, 0, 1, 1,
0.2500597, 2.191752, 2.206128, 1, 0, 0, 1, 1,
0.2545313, -0.001477122, 2.81732, 1, 0, 0, 1, 1,
0.2557556, 0.8290818, 1.334244, 1, 0, 0, 1, 1,
0.2560163, -0.1111947, 2.218666, 0, 0, 0, 1, 1,
0.2577, -0.7908855, 3.237656, 0, 0, 0, 1, 1,
0.2617612, -1.139041, 3.01338, 0, 0, 0, 1, 1,
0.2629841, -2.343998, 3.107098, 0, 0, 0, 1, 1,
0.2698606, -0.01205389, 0.4532909, 0, 0, 0, 1, 1,
0.2719998, 1.257684, -1.446977, 0, 0, 0, 1, 1,
0.2738647, -0.2687796, 1.860046, 0, 0, 0, 1, 1,
0.2748908, -1.10478, 2.182092, 1, 1, 1, 1, 1,
0.2765488, 0.1457073, -0.3645009, 1, 1, 1, 1, 1,
0.2794516, -0.2396121, 2.717492, 1, 1, 1, 1, 1,
0.2835594, 2.261635, 0.7151602, 1, 1, 1, 1, 1,
0.2846051, -0.593123, 2.860835, 1, 1, 1, 1, 1,
0.2870606, 0.1223281, 0.5590729, 1, 1, 1, 1, 1,
0.2969502, 0.7591698, 0.07621501, 1, 1, 1, 1, 1,
0.3001148, 0.2729274, 1.80852, 1, 1, 1, 1, 1,
0.301279, 0.8543366, 1.556675, 1, 1, 1, 1, 1,
0.3014675, 0.3535222, 1.020359, 1, 1, 1, 1, 1,
0.3063275, -0.2131517, 1.108878, 1, 1, 1, 1, 1,
0.3143636, -0.7090835, 2.217273, 1, 1, 1, 1, 1,
0.322707, 1.404309, 1.981482, 1, 1, 1, 1, 1,
0.3243176, 1.149518, 1.332437, 1, 1, 1, 1, 1,
0.3275197, -1.175803, 2.393, 1, 1, 1, 1, 1,
0.3277334, -1.502869, 2.225392, 0, 0, 1, 1, 1,
0.3304543, -0.8498892, 3.205989, 1, 0, 0, 1, 1,
0.335863, 1.776526, 0.4276313, 1, 0, 0, 1, 1,
0.3380295, -0.5482107, 2.293611, 1, 0, 0, 1, 1,
0.3385167, -0.254918, 1.984371, 1, 0, 0, 1, 1,
0.3428536, -0.7235829, 4.868343, 1, 0, 0, 1, 1,
0.3458574, -0.007957252, -0.01959356, 0, 0, 0, 1, 1,
0.3468289, -1.540367, 1.858223, 0, 0, 0, 1, 1,
0.34735, -2.139517, 1.761112, 0, 0, 0, 1, 1,
0.3545882, -1.569854, 4.984554, 0, 0, 0, 1, 1,
0.3573303, -2.820012, 4.27463, 0, 0, 0, 1, 1,
0.360849, 0.09673132, 1.315073, 0, 0, 0, 1, 1,
0.3614551, 0.6465859, -0.1197475, 0, 0, 0, 1, 1,
0.361842, -0.4670436, 3.520575, 1, 1, 1, 1, 1,
0.3669033, 0.673798, 1.43754, 1, 1, 1, 1, 1,
0.3703576, 1.324948, 0.582508, 1, 1, 1, 1, 1,
0.372506, -0.9254894, 2.170021, 1, 1, 1, 1, 1,
0.3769399, -0.3209615, 3.973191, 1, 1, 1, 1, 1,
0.3774683, 0.7035254, 0.3076632, 1, 1, 1, 1, 1,
0.3800223, 0.009662739, 2.490869, 1, 1, 1, 1, 1,
0.3857479, -0.9294301, 4.071826, 1, 1, 1, 1, 1,
0.3860672, -0.530497, 3.630353, 1, 1, 1, 1, 1,
0.3903876, -0.577318, 3.928912, 1, 1, 1, 1, 1,
0.3912058, 1.919102, -0.4142557, 1, 1, 1, 1, 1,
0.3974976, -0.2341178, 1.377513, 1, 1, 1, 1, 1,
0.3977677, -0.05378257, 2.163146, 1, 1, 1, 1, 1,
0.3983305, 0.4920263, 0.7896338, 1, 1, 1, 1, 1,
0.4011438, -1.359, 2.229281, 1, 1, 1, 1, 1,
0.4040933, -0.5739431, 3.346189, 0, 0, 1, 1, 1,
0.4090015, -0.1352423, 1.447868, 1, 0, 0, 1, 1,
0.412304, 1.142434, 2.005211, 1, 0, 0, 1, 1,
0.4151312, 0.06059105, 1.801517, 1, 0, 0, 1, 1,
0.419625, 1.57403, 0.06375713, 1, 0, 0, 1, 1,
0.4207817, -0.1389778, 2.118674, 1, 0, 0, 1, 1,
0.4419638, -0.2182903, 0.9429451, 0, 0, 0, 1, 1,
0.442108, -0.4955136, 1.906606, 0, 0, 0, 1, 1,
0.4498003, 0.1284622, -0.3212118, 0, 0, 0, 1, 1,
0.4508574, 1.373811, 0.5219663, 0, 0, 0, 1, 1,
0.4632409, 0.3942685, 0.8841922, 0, 0, 0, 1, 1,
0.4651716, -0.6967608, 1.810994, 0, 0, 0, 1, 1,
0.4716047, -1.657359, 4.748313, 0, 0, 0, 1, 1,
0.473551, 0.2370652, 1.234335, 1, 1, 1, 1, 1,
0.4747887, 0.2274634, 2.255713, 1, 1, 1, 1, 1,
0.4753183, -1.392124, 2.841986, 1, 1, 1, 1, 1,
0.4795602, -0.1698146, 2.102169, 1, 1, 1, 1, 1,
0.4815509, 0.4458195, 0.5706154, 1, 1, 1, 1, 1,
0.4817186, -0.08232798, 3.633326, 1, 1, 1, 1, 1,
0.493992, -0.1156994, 2.738032, 1, 1, 1, 1, 1,
0.496468, 2.08327, 0.6987497, 1, 1, 1, 1, 1,
0.5003427, -0.1576055, 2.665495, 1, 1, 1, 1, 1,
0.5008363, 0.9902731, 1.322806, 1, 1, 1, 1, 1,
0.5085641, -1.923167, 1.794977, 1, 1, 1, 1, 1,
0.5088341, 0.09622496, 0.2983929, 1, 1, 1, 1, 1,
0.5123259, 0.4698956, 0.2803463, 1, 1, 1, 1, 1,
0.5166129, 0.8640668, 1.094342, 1, 1, 1, 1, 1,
0.5176882, 0.8701, 1.821342, 1, 1, 1, 1, 1,
0.5177751, -2.177635, 3.54433, 0, 0, 1, 1, 1,
0.5208977, -0.3873164, 0.9563353, 1, 0, 0, 1, 1,
0.5238076, -0.06203931, 2.315404, 1, 0, 0, 1, 1,
0.5254138, 0.2963873, 1.295192, 1, 0, 0, 1, 1,
0.5256684, -0.9054344, 3.590143, 1, 0, 0, 1, 1,
0.5262821, 1.073492, 0.593573, 1, 0, 0, 1, 1,
0.5290728, 2.828514, -0.5371552, 0, 0, 0, 1, 1,
0.5298587, -0.2541902, 1.025163, 0, 0, 0, 1, 1,
0.5322158, 0.3171898, 0.6696059, 0, 0, 0, 1, 1,
0.5410259, -0.7522768, 2.79157, 0, 0, 0, 1, 1,
0.5419808, -0.1006733, 1.598574, 0, 0, 0, 1, 1,
0.5431179, 0.8811747, 2.463723, 0, 0, 0, 1, 1,
0.5443457, 0.35553, 1.301892, 0, 0, 0, 1, 1,
0.5453824, 0.1953273, -0.1546929, 1, 1, 1, 1, 1,
0.550642, -0.9463895, 2.38188, 1, 1, 1, 1, 1,
0.5534313, 0.1345055, 1.561006, 1, 1, 1, 1, 1,
0.554258, -0.6699759, 3.565902, 1, 1, 1, 1, 1,
0.5547228, -2.717631, 3.278235, 1, 1, 1, 1, 1,
0.5597641, -1.857007, 4.337791, 1, 1, 1, 1, 1,
0.5706556, -0.04164857, 0.8205907, 1, 1, 1, 1, 1,
0.5711508, -0.6539525, 2.202657, 1, 1, 1, 1, 1,
0.5761743, 0.6089481, 2.025882, 1, 1, 1, 1, 1,
0.5767489, -0.5870456, 0.3845119, 1, 1, 1, 1, 1,
0.5827044, 0.8354866, 1.023805, 1, 1, 1, 1, 1,
0.583097, 0.9123767, -1.12447, 1, 1, 1, 1, 1,
0.5843509, 1.123622, 0.9627332, 1, 1, 1, 1, 1,
0.5855567, 0.6718743, -2.357664, 1, 1, 1, 1, 1,
0.5891628, 1.617741, 0.1696235, 1, 1, 1, 1, 1,
0.5907583, -0.3570442, 2.382501, 0, 0, 1, 1, 1,
0.5928805, 0.116114, 1.240309, 1, 0, 0, 1, 1,
0.5948269, -0.3954478, 1.464629, 1, 0, 0, 1, 1,
0.5980549, -0.01382965, 1.530855, 1, 0, 0, 1, 1,
0.6056649, -0.3120643, 2.553434, 1, 0, 0, 1, 1,
0.6094628, 1.915376, 0.7813025, 1, 0, 0, 1, 1,
0.6107531, 0.543314, 0.1223595, 0, 0, 0, 1, 1,
0.6142083, -1.105298, 2.886518, 0, 0, 0, 1, 1,
0.616398, -1.126479, 3.11059, 0, 0, 0, 1, 1,
0.6229759, 0.1217547, 1.151068, 0, 0, 0, 1, 1,
0.6266462, -0.7848076, 3.391605, 0, 0, 0, 1, 1,
0.6279088, -0.2077547, 1.556896, 0, 0, 0, 1, 1,
0.6317886, -0.6500419, 3.279216, 0, 0, 0, 1, 1,
0.6330984, 0.6603301, 0.7365085, 1, 1, 1, 1, 1,
0.635374, 0.7549726, 0.9514397, 1, 1, 1, 1, 1,
0.6364787, -0.1581498, 1.300397, 1, 1, 1, 1, 1,
0.6381288, -0.4664587, 1.718849, 1, 1, 1, 1, 1,
0.6422369, 0.1918789, 1.259924, 1, 1, 1, 1, 1,
0.642386, -0.8087575, 4.143379, 1, 1, 1, 1, 1,
0.6491783, -1.934484, 3.01926, 1, 1, 1, 1, 1,
0.654225, 1.085894, 1.153658, 1, 1, 1, 1, 1,
0.6552634, -0.3908128, 3.053338, 1, 1, 1, 1, 1,
0.6579401, 0.4661621, 1.183295, 1, 1, 1, 1, 1,
0.6583403, 0.4486428, -0.3890878, 1, 1, 1, 1, 1,
0.659409, 1.475414, 0.5555853, 1, 1, 1, 1, 1,
0.6623822, -0.1996902, 2.808909, 1, 1, 1, 1, 1,
0.6674643, -0.07842164, 1.675022, 1, 1, 1, 1, 1,
0.6701983, -0.04240913, -0.4977207, 1, 1, 1, 1, 1,
0.6797455, -0.7153758, 2.19927, 0, 0, 1, 1, 1,
0.6842687, 1.010089, 2.102705, 1, 0, 0, 1, 1,
0.686176, 1.372644, 1.08207, 1, 0, 0, 1, 1,
0.6862858, 0.6134821, 1.972924, 1, 0, 0, 1, 1,
0.6920449, 1.076154, -0.1658909, 1, 0, 0, 1, 1,
0.6928878, 0.9189345, -0.03347664, 1, 0, 0, 1, 1,
0.6941071, -1.516433, 3.239209, 0, 0, 0, 1, 1,
0.6956762, 0.3396688, 2.064615, 0, 0, 0, 1, 1,
0.6978303, 0.7454216, 0.1697994, 0, 0, 0, 1, 1,
0.7001352, 1.771648, 1.03676, 0, 0, 0, 1, 1,
0.7072372, 0.4242974, 0.7511065, 0, 0, 0, 1, 1,
0.7080626, -0.9128885, 0.6352749, 0, 0, 0, 1, 1,
0.7176803, 0.9099007, -0.4953794, 0, 0, 0, 1, 1,
0.7186281, -0.1601129, -0.1548697, 1, 1, 1, 1, 1,
0.7234378, -0.2308576, 1.843615, 1, 1, 1, 1, 1,
0.7255883, 2.422549, 0.797164, 1, 1, 1, 1, 1,
0.72824, -0.3754564, 3.142518, 1, 1, 1, 1, 1,
0.7289537, -0.06844401, 2.706916, 1, 1, 1, 1, 1,
0.7301452, -1.338036, 1.671967, 1, 1, 1, 1, 1,
0.7307908, 0.8567494, 1.142117, 1, 1, 1, 1, 1,
0.7339774, -0.126041, -0.3130098, 1, 1, 1, 1, 1,
0.7356611, 1.393377, -0.5656874, 1, 1, 1, 1, 1,
0.744437, 0.198629, -0.6928486, 1, 1, 1, 1, 1,
0.7456059, 0.2342743, 1.562387, 1, 1, 1, 1, 1,
0.7467684, 0.7164239, 0.8642867, 1, 1, 1, 1, 1,
0.750152, 1.334397, -1.463067, 1, 1, 1, 1, 1,
0.7516185, 1.26616, 0.3232978, 1, 1, 1, 1, 1,
0.7544165, 1.14142, 0.9110237, 1, 1, 1, 1, 1,
0.7591222, -0.6892617, 1.53171, 0, 0, 1, 1, 1,
0.7597252, 0.1170069, 0.8135818, 1, 0, 0, 1, 1,
0.7634822, -1.706715, 4.676137, 1, 0, 0, 1, 1,
0.7682236, -0.0326151, 1.649944, 1, 0, 0, 1, 1,
0.7771609, 0.3397197, 2.439779, 1, 0, 0, 1, 1,
0.7772736, -0.2804595, 1.290993, 1, 0, 0, 1, 1,
0.7778092, 0.6354886, 1.930161, 0, 0, 0, 1, 1,
0.7837971, 0.4484746, 1.053686, 0, 0, 0, 1, 1,
0.7866057, 0.4356528, 1.216517, 0, 0, 0, 1, 1,
0.7907009, -1.211111, 3.79591, 0, 0, 0, 1, 1,
0.7910613, 0.6232623, 0.9200133, 0, 0, 0, 1, 1,
0.7962157, -1.691044, 2.509831, 0, 0, 0, 1, 1,
0.7967851, -0.4290387, 2.330018, 0, 0, 0, 1, 1,
0.796792, -1.615101, 2.730464, 1, 1, 1, 1, 1,
0.8056217, 0.8871523, 2.402315, 1, 1, 1, 1, 1,
0.8109763, -1.484776, 4.13796, 1, 1, 1, 1, 1,
0.8120071, -0.01130094, 0.604667, 1, 1, 1, 1, 1,
0.8185134, 0.1875011, 2.422789, 1, 1, 1, 1, 1,
0.8299551, 1.532078, 0.5100799, 1, 1, 1, 1, 1,
0.8309796, -1.571465, 3.025106, 1, 1, 1, 1, 1,
0.8364984, 1.050857, 1.553879, 1, 1, 1, 1, 1,
0.8419823, -0.167582, 0.6526735, 1, 1, 1, 1, 1,
0.8431541, -0.5918337, 1.492995, 1, 1, 1, 1, 1,
0.8506191, 2.301144, 0.9729903, 1, 1, 1, 1, 1,
0.8535824, -0.1397744, 2.307642, 1, 1, 1, 1, 1,
0.8536946, 1.777516, 1.788314, 1, 1, 1, 1, 1,
0.8547439, -1.257167, 2.09667, 1, 1, 1, 1, 1,
0.8586004, 0.4536377, 1.295298, 1, 1, 1, 1, 1,
0.8593946, 1.122029, 1.139872, 0, 0, 1, 1, 1,
0.8613077, -0.2847615, 3.184895, 1, 0, 0, 1, 1,
0.8631564, -2.578927, 3.310762, 1, 0, 0, 1, 1,
0.8657684, 0.4495631, -1.331188, 1, 0, 0, 1, 1,
0.870664, -1.249093, 2.510084, 1, 0, 0, 1, 1,
0.8738698, -0.8310853, 2.798758, 1, 0, 0, 1, 1,
0.8739982, -0.7910936, 2.812524, 0, 0, 0, 1, 1,
0.8749452, 0.202616, 1.068884, 0, 0, 0, 1, 1,
0.8761423, -0.7002264, 1.899414, 0, 0, 0, 1, 1,
0.8779918, -1.240897, 3.373346, 0, 0, 0, 1, 1,
0.8842062, 2.169977, -1.605933, 0, 0, 0, 1, 1,
0.8887546, -2.183883, 1.992499, 0, 0, 0, 1, 1,
0.8982434, 0.1839232, 0.1005197, 0, 0, 0, 1, 1,
0.9077414, -0.7665365, 1.649099, 1, 1, 1, 1, 1,
0.9086239, -1.905763, 3.887588, 1, 1, 1, 1, 1,
0.9098625, 0.7782879, 1.033966, 1, 1, 1, 1, 1,
0.9112279, -0.6487164, 1.244836, 1, 1, 1, 1, 1,
0.9131483, 0.7215992, 0.5433172, 1, 1, 1, 1, 1,
0.9174914, 1.163861, 0.736639, 1, 1, 1, 1, 1,
0.9211822, -0.9418758, 2.293874, 1, 1, 1, 1, 1,
0.9242004, 0.4710499, 0.9243822, 1, 1, 1, 1, 1,
0.9251994, 0.4084428, 1.074393, 1, 1, 1, 1, 1,
0.9260303, 0.9381876, 1.147913, 1, 1, 1, 1, 1,
0.927195, -0.1181651, 3.067333, 1, 1, 1, 1, 1,
0.9280499, 0.9234686, 1.407301, 1, 1, 1, 1, 1,
0.9290434, -0.5513353, -0.4000986, 1, 1, 1, 1, 1,
0.9347211, -0.6660221, 2.035539, 1, 1, 1, 1, 1,
0.951847, -1.769433, 2.509913, 1, 1, 1, 1, 1,
0.9558737, -0.8372617, 0.9578642, 0, 0, 1, 1, 1,
0.9559678, -0.05418778, 2.288966, 1, 0, 0, 1, 1,
0.9586563, 0.6156865, 1.793131, 1, 0, 0, 1, 1,
0.960425, 0.9753329, 2.022015, 1, 0, 0, 1, 1,
0.9629125, 1.615403, 1.087561, 1, 0, 0, 1, 1,
0.9663391, 1.34502, 1.259602, 1, 0, 0, 1, 1,
0.9676065, -1.11733, 1.761038, 0, 0, 0, 1, 1,
0.9679366, 0.6163046, -0.397045, 0, 0, 0, 1, 1,
0.9681873, -1.778114, 3.661597, 0, 0, 0, 1, 1,
0.9702695, 0.3261899, 1.919941, 0, 0, 0, 1, 1,
0.9752173, -2.106242, 3.944441, 0, 0, 0, 1, 1,
0.9831659, 0.9239559, 0.1165498, 0, 0, 0, 1, 1,
0.9871054, 0.7203118, 2.764512, 0, 0, 0, 1, 1,
0.9879614, 1.008644, -1.844053, 1, 1, 1, 1, 1,
0.9966015, -1.664484, 2.15937, 1, 1, 1, 1, 1,
0.9980078, -0.0359167, 1.610396, 1, 1, 1, 1, 1,
1.003039, -1.636965, 2.172376, 1, 1, 1, 1, 1,
1.003868, 0.5045616, 0.5771195, 1, 1, 1, 1, 1,
1.009351, -0.6970294, 2.408123, 1, 1, 1, 1, 1,
1.021857, 0.309604, 1.324468, 1, 1, 1, 1, 1,
1.025473, 0.553736, 3.1407, 1, 1, 1, 1, 1,
1.036112, -0.03956718, 3.247108, 1, 1, 1, 1, 1,
1.039483, -0.8338457, 3.791115, 1, 1, 1, 1, 1,
1.043212, -0.8319662, 1.47028, 1, 1, 1, 1, 1,
1.043573, -2.311089, 3.791638, 1, 1, 1, 1, 1,
1.046412, 0.6455954, 0.3954539, 1, 1, 1, 1, 1,
1.046417, -0.3566599, 1.543801, 1, 1, 1, 1, 1,
1.052706, -1.273158, 3.745038, 1, 1, 1, 1, 1,
1.056875, -1.482922, 4.7709, 0, 0, 1, 1, 1,
1.057437, 0.2487368, 1.348354, 1, 0, 0, 1, 1,
1.061698, 0.128519, 2.803873, 1, 0, 0, 1, 1,
1.064994, -0.442426, 2.637751, 1, 0, 0, 1, 1,
1.065014, 0.1806929, 0.8492989, 1, 0, 0, 1, 1,
1.068036, -0.2190912, 1.057999, 1, 0, 0, 1, 1,
1.084229, -2.204471, 3.37, 0, 0, 0, 1, 1,
1.088374, 0.5708697, 1.815017, 0, 0, 0, 1, 1,
1.09524, 1.906894, 1.395114, 0, 0, 0, 1, 1,
1.096644, 1.434822, 2.828523, 0, 0, 0, 1, 1,
1.102674, -0.08394928, 2.761686, 0, 0, 0, 1, 1,
1.102946, 0.1605015, 1.79529, 0, 0, 0, 1, 1,
1.116866, 0.1586932, 2.279954, 0, 0, 0, 1, 1,
1.130017, 0.2167359, 3.616475, 1, 1, 1, 1, 1,
1.130262, 1.579807, 1.931694, 1, 1, 1, 1, 1,
1.131959, 1.326201, 2.30328, 1, 1, 1, 1, 1,
1.157466, 0.2876811, 2.038834, 1, 1, 1, 1, 1,
1.1689, -0.1893135, 1.698382, 1, 1, 1, 1, 1,
1.170236, -0.8815222, 2.39342, 1, 1, 1, 1, 1,
1.17168, 0.5911344, 3.132282, 1, 1, 1, 1, 1,
1.174369, 0.8791898, 1.243952, 1, 1, 1, 1, 1,
1.185977, -1.791548, 0.8183652, 1, 1, 1, 1, 1,
1.187139, 1.29373, 1.078701, 1, 1, 1, 1, 1,
1.18828, 0.3855157, -0.9973612, 1, 1, 1, 1, 1,
1.189029, 1.607571, -0.01937032, 1, 1, 1, 1, 1,
1.190847, 0.3484271, 1.178738, 1, 1, 1, 1, 1,
1.193058, 1.262509, 0.3466779, 1, 1, 1, 1, 1,
1.196014, -0.4471286, 2.576643, 1, 1, 1, 1, 1,
1.198154, -2.399885, 2.270859, 0, 0, 1, 1, 1,
1.203595, 1.155496, 0.4400631, 1, 0, 0, 1, 1,
1.206907, -0.169857, 2.704953, 1, 0, 0, 1, 1,
1.208758, 0.5342883, 2.805309, 1, 0, 0, 1, 1,
1.211205, 1.456567, 0.5063888, 1, 0, 0, 1, 1,
1.218481, -0.1332265, 3.293243, 1, 0, 0, 1, 1,
1.232057, 1.556086, -0.511659, 0, 0, 0, 1, 1,
1.233317, 1.14851, 1.309959, 0, 0, 0, 1, 1,
1.235772, 0.06044827, 2.012638, 0, 0, 0, 1, 1,
1.245105, 1.179891, 0.5523896, 0, 0, 0, 1, 1,
1.264442, 0.7583543, 2.332968, 0, 0, 0, 1, 1,
1.281605, 0.06170725, 1.845404, 0, 0, 0, 1, 1,
1.292532, 0.05117872, 0.717526, 0, 0, 0, 1, 1,
1.293906, -0.5465034, 2.256617, 1, 1, 1, 1, 1,
1.296329, 0.6703519, -0.007737273, 1, 1, 1, 1, 1,
1.297588, 0.04273333, 1.64479, 1, 1, 1, 1, 1,
1.309233, 0.3665133, -0.04509328, 1, 1, 1, 1, 1,
1.316025, 1.367898, 0.8643236, 1, 1, 1, 1, 1,
1.320306, 0.2246955, -0.1762206, 1, 1, 1, 1, 1,
1.324106, 0.1493814, 4.107482, 1, 1, 1, 1, 1,
1.330514, 1.886368, -1.255397, 1, 1, 1, 1, 1,
1.334545, 0.3543966, 0.8616593, 1, 1, 1, 1, 1,
1.336031, 0.8471336, 2.025108, 1, 1, 1, 1, 1,
1.341348, -0.04993616, 0.6255897, 1, 1, 1, 1, 1,
1.344653, 1.16401, 1.948576, 1, 1, 1, 1, 1,
1.355507, 1.130295, 1.854133, 1, 1, 1, 1, 1,
1.360804, -1.478281, 3.959104, 1, 1, 1, 1, 1,
1.380114, -1.727794, 0.6723618, 1, 1, 1, 1, 1,
1.395216, 0.686867, 0.9265436, 0, 0, 1, 1, 1,
1.398602, -0.3719539, 0.8107919, 1, 0, 0, 1, 1,
1.400225, 0.964134, 0.8977084, 1, 0, 0, 1, 1,
1.404519, 0.6549798, 0.8156829, 1, 0, 0, 1, 1,
1.429102, 0.5474057, 0.2999974, 1, 0, 0, 1, 1,
1.432346, -0.1511755, 1.971529, 1, 0, 0, 1, 1,
1.462075, 1.471041, 0.5194837, 0, 0, 0, 1, 1,
1.467302, 0.3895689, 1.625959, 0, 0, 0, 1, 1,
1.48352, -0.4026699, 2.111205, 0, 0, 0, 1, 1,
1.488305, 0.3247684, 0.01122241, 0, 0, 0, 1, 1,
1.495114, -0.1277971, 3.688884, 0, 0, 0, 1, 1,
1.496929, 0.2918378, 3.108838, 0, 0, 0, 1, 1,
1.498147, 0.8089388, 1.244151, 0, 0, 0, 1, 1,
1.515353, 1.203539, -0.1949214, 1, 1, 1, 1, 1,
1.521129, 2.099073, -1.687094, 1, 1, 1, 1, 1,
1.550086, -1.469909, 2.839235, 1, 1, 1, 1, 1,
1.55169, -0.8559455, 2.437783, 1, 1, 1, 1, 1,
1.567745, -0.1396583, 2.657479, 1, 1, 1, 1, 1,
1.568543, 1.7046, 0.7641996, 1, 1, 1, 1, 1,
1.578645, 0.6163695, 1.882413, 1, 1, 1, 1, 1,
1.579133, -0.5312888, 2.060372, 1, 1, 1, 1, 1,
1.592008, 0.01925988, 2.8917, 1, 1, 1, 1, 1,
1.593069, 0.3323882, 3.143088, 1, 1, 1, 1, 1,
1.604623, -1.806591, 2.404224, 1, 1, 1, 1, 1,
1.605093, 0.2958605, 2.186971, 1, 1, 1, 1, 1,
1.630887, -1.415017, 2.529023, 1, 1, 1, 1, 1,
1.633182, 0.7939931, 0.2555884, 1, 1, 1, 1, 1,
1.63692, 0.6038931, 2.08254, 1, 1, 1, 1, 1,
1.638863, 0.6798761, 0.7827682, 0, 0, 1, 1, 1,
1.6453, 0.6634243, 1.399997, 1, 0, 0, 1, 1,
1.657712, -0.1638267, 3.422457, 1, 0, 0, 1, 1,
1.708813, 0.008629978, 1.700825, 1, 0, 0, 1, 1,
1.715138, 1.61187, 1.219115, 1, 0, 0, 1, 1,
1.716902, -0.5637958, 0.1847398, 1, 0, 0, 1, 1,
1.719449, -1.256534, 1.239514, 0, 0, 0, 1, 1,
1.731661, -1.611471, 1.896681, 0, 0, 0, 1, 1,
1.741751, -0.5286276, 3.097142, 0, 0, 0, 1, 1,
1.747206, -1.785084, 3.409521, 0, 0, 0, 1, 1,
1.76885, -0.4406148, 0.02206014, 0, 0, 0, 1, 1,
1.80559, -0.9926999, 3.444611, 0, 0, 0, 1, 1,
1.807274, 1.388753, 2.792835, 0, 0, 0, 1, 1,
1.830184, 0.01971859, 2.438936, 1, 1, 1, 1, 1,
1.840455, -0.6127973, 2.105161, 1, 1, 1, 1, 1,
1.847517, -0.9394594, 4.623087, 1, 1, 1, 1, 1,
1.856657, 0.9399571, 1.277023, 1, 1, 1, 1, 1,
1.865474, 1.342124, -0.6372084, 1, 1, 1, 1, 1,
1.883698, -0.4982254, 1.717478, 1, 1, 1, 1, 1,
1.892962, 1.384515, 1.434656, 1, 1, 1, 1, 1,
1.901912, 0.7883925, 0.1834012, 1, 1, 1, 1, 1,
1.913879, 0.4943524, 2.500928, 1, 1, 1, 1, 1,
1.927335, -0.4581367, -0.3734793, 1, 1, 1, 1, 1,
1.936945, -1.103594, 3.26759, 1, 1, 1, 1, 1,
1.954249, 1.483314, -0.3768096, 1, 1, 1, 1, 1,
1.959726, 0.3832351, 2.473168, 1, 1, 1, 1, 1,
1.966785, -0.9553787, 2.313843, 1, 1, 1, 1, 1,
1.974173, -0.4054047, 2.829456, 1, 1, 1, 1, 1,
1.983517, -1.306657, 2.300582, 0, 0, 1, 1, 1,
1.985946, -1.825576, 2.528594, 1, 0, 0, 1, 1,
2.003423, -0.01768117, 0.5389939, 1, 0, 0, 1, 1,
2.009365, -0.5289301, 2.418452, 1, 0, 0, 1, 1,
2.038598, 0.5184367, 1.922287, 1, 0, 0, 1, 1,
2.086744, -0.4168084, 1.623649, 1, 0, 0, 1, 1,
2.20231, -0.2387211, 2.354288, 0, 0, 0, 1, 1,
2.290064, 0.3689052, -0.1147603, 0, 0, 0, 1, 1,
2.338746, 0.08418215, 2.337402, 0, 0, 0, 1, 1,
2.358293, 0.177938, 1.850783, 0, 0, 0, 1, 1,
2.36753, 2.270275, 0.5293027, 0, 0, 0, 1, 1,
2.533717, -1.328755, 2.395513, 0, 0, 0, 1, 1,
2.618751, -0.1009353, 1.802151, 0, 0, 0, 1, 1,
2.634623, -0.2110873, 2.430861, 1, 1, 1, 1, 1,
2.717228, 0.7216623, 0.9441698, 1, 1, 1, 1, 1,
2.731014, -1.965801, 2.424799, 1, 1, 1, 1, 1,
2.748757, 0.5260544, 1.043404, 1, 1, 1, 1, 1,
2.784294, 0.2073428, 0.8510051, 1, 1, 1, 1, 1,
3.086832, 0.8619691, 1.563496, 1, 1, 1, 1, 1,
3.533163, -0.4766674, 1.01206, 1, 1, 1, 1, 1
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
var radius = 9.498613;
var distance = 33.36347;
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
mvMatrix.translate( -0.05687094, -0.004250884, 0.1222544 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36347);
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
