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
-3.615591, -0.8951279, -1.682761, 1, 0, 0, 1,
-3.33922, 1.35037, -0.1532045, 1, 0.007843138, 0, 1,
-3.212428, -0.2263712, -1.201112, 1, 0.01176471, 0, 1,
-3.042439, 1.886628, -0.7055453, 1, 0.01960784, 0, 1,
-2.889384, -0.5923239, -1.974613, 1, 0.02352941, 0, 1,
-2.792835, 0.3974371, -0.3198625, 1, 0.03137255, 0, 1,
-2.709366, 0.7879721, -1.797309, 1, 0.03529412, 0, 1,
-2.662803, -0.9095004, -1.431829, 1, 0.04313726, 0, 1,
-2.545945, 0.5987592, -1.928814, 1, 0.04705882, 0, 1,
-2.482409, -0.8965462, -2.226306, 1, 0.05490196, 0, 1,
-2.39236, -0.5090928, -1.243807, 1, 0.05882353, 0, 1,
-2.363217, 0.009815883, -0.8279136, 1, 0.06666667, 0, 1,
-2.358014, 0.08092561, -2.966417, 1, 0.07058824, 0, 1,
-2.196763, 1.546943, -1.018144, 1, 0.07843138, 0, 1,
-2.162501, 0.9284385, -1.461363, 1, 0.08235294, 0, 1,
-2.147958, 1.004562, 0.6521368, 1, 0.09019608, 0, 1,
-2.082382, -0.9877508, -1.050174, 1, 0.09411765, 0, 1,
-2.043279, -0.4868899, -1.657642, 1, 0.1019608, 0, 1,
-2.04094, 1.806066, -1.837372, 1, 0.1098039, 0, 1,
-2.025435, 1.282321, -2.710582, 1, 0.1137255, 0, 1,
-1.999398, -0.6000212, -2.391969, 1, 0.1215686, 0, 1,
-1.983594, -0.9356027, -0.7135279, 1, 0.1254902, 0, 1,
-1.958848, 0.003796378, 0.8428804, 1, 0.1333333, 0, 1,
-1.952686, -1.3136, -3.259077, 1, 0.1372549, 0, 1,
-1.940869, 0.9006215, -1.092697, 1, 0.145098, 0, 1,
-1.923846, -1.111295, -3.592924, 1, 0.1490196, 0, 1,
-1.921836, -0.5313119, -2.113453, 1, 0.1568628, 0, 1,
-1.921764, -0.4647375, -0.4287612, 1, 0.1607843, 0, 1,
-1.921383, -0.7225668, -4.277789, 1, 0.1686275, 0, 1,
-1.907368, 1.402459, -1.875586, 1, 0.172549, 0, 1,
-1.877582, -0.6021114, -2.24773, 1, 0.1803922, 0, 1,
-1.852412, -1.6308, -3.140141, 1, 0.1843137, 0, 1,
-1.844783, 1.430596, 1.346179, 1, 0.1921569, 0, 1,
-1.821241, 0.5539455, -0.2365311, 1, 0.1960784, 0, 1,
-1.814456, -0.09022529, -2.304895, 1, 0.2039216, 0, 1,
-1.803937, 1.06894, -1.775121, 1, 0.2117647, 0, 1,
-1.79981, -0.1049352, -0.294037, 1, 0.2156863, 0, 1,
-1.770903, -1.024221, -1.831877, 1, 0.2235294, 0, 1,
-1.75787, -1.041902, -2.473707, 1, 0.227451, 0, 1,
-1.755694, 0.6585704, -0.6794068, 1, 0.2352941, 0, 1,
-1.751246, 1.487508, 1.123527, 1, 0.2392157, 0, 1,
-1.750368, -0.4253216, -1.103198, 1, 0.2470588, 0, 1,
-1.747932, 0.8857462, -1.417922, 1, 0.2509804, 0, 1,
-1.742638, 0.4981354, -1.584828, 1, 0.2588235, 0, 1,
-1.735732, 1.788372, -1.239809, 1, 0.2627451, 0, 1,
-1.730903, 0.1867442, -1.28433, 1, 0.2705882, 0, 1,
-1.724084, -1.460798, -2.679685, 1, 0.2745098, 0, 1,
-1.667364, 0.08925298, -0.9172826, 1, 0.282353, 0, 1,
-1.665525, 0.03727536, -1.629028, 1, 0.2862745, 0, 1,
-1.659108, -0.05584268, -2.754272, 1, 0.2941177, 0, 1,
-1.659084, 0.4877259, -1.633517, 1, 0.3019608, 0, 1,
-1.650533, -1.145798, -3.383579, 1, 0.3058824, 0, 1,
-1.642624, 0.2318874, 1.025347, 1, 0.3137255, 0, 1,
-1.633211, 1.354317, 0.7429324, 1, 0.3176471, 0, 1,
-1.62744, -0.4935956, -1.101251, 1, 0.3254902, 0, 1,
-1.623383, 0.02877104, -2.611535, 1, 0.3294118, 0, 1,
-1.608406, 1.181536, 0.1848357, 1, 0.3372549, 0, 1,
-1.602114, -0.9971045, -1.461893, 1, 0.3411765, 0, 1,
-1.59533, 0.3321768, -0.6516358, 1, 0.3490196, 0, 1,
-1.58874, -0.280907, -2.634612, 1, 0.3529412, 0, 1,
-1.585973, -0.7454523, -2.1854, 1, 0.3607843, 0, 1,
-1.581206, 0.3775065, 1.328513, 1, 0.3647059, 0, 1,
-1.541867, 0.01830759, -1.490413, 1, 0.372549, 0, 1,
-1.536092, 0.1184012, -1.066819, 1, 0.3764706, 0, 1,
-1.53153, 1.167141, -0.09952296, 1, 0.3843137, 0, 1,
-1.519516, -0.1916941, -2.731981, 1, 0.3882353, 0, 1,
-1.511244, 1.271932, -0.9489762, 1, 0.3960784, 0, 1,
-1.50035, 0.08629882, 0.5255811, 1, 0.4039216, 0, 1,
-1.484972, 0.3995999, -0.2940424, 1, 0.4078431, 0, 1,
-1.47993, -0.3892018, -3.481663, 1, 0.4156863, 0, 1,
-1.466291, 0.6528193, 0.3121051, 1, 0.4196078, 0, 1,
-1.462722, -1.413822, -2.370933, 1, 0.427451, 0, 1,
-1.457328, 0.346613, -0.8511452, 1, 0.4313726, 0, 1,
-1.451014, -1.950274, -3.218538, 1, 0.4392157, 0, 1,
-1.446264, 0.5342626, -1.84578, 1, 0.4431373, 0, 1,
-1.442943, -1.327886, -2.335329, 1, 0.4509804, 0, 1,
-1.433644, 1.349932, -1.091715, 1, 0.454902, 0, 1,
-1.426937, -1.358418, -3.547385, 1, 0.4627451, 0, 1,
-1.419395, -0.8766978, -1.340248, 1, 0.4666667, 0, 1,
-1.418667, -0.09758462, -1.168633, 1, 0.4745098, 0, 1,
-1.402406, 0.3691951, -0.7252176, 1, 0.4784314, 0, 1,
-1.398878, -1.082794, -2.642637, 1, 0.4862745, 0, 1,
-1.386424, 0.040835, 0.1933054, 1, 0.4901961, 0, 1,
-1.384114, -0.4693515, -1.641884, 1, 0.4980392, 0, 1,
-1.381218, 0.9465172, -0.4250218, 1, 0.5058824, 0, 1,
-1.38015, 1.697546, 0.814033, 1, 0.509804, 0, 1,
-1.378942, -0.1113801, -1.217642, 1, 0.5176471, 0, 1,
-1.37413, -0.167008, -1.398205, 1, 0.5215687, 0, 1,
-1.37339, 1.194344, 1.110655, 1, 0.5294118, 0, 1,
-1.372365, -0.5896249, -3.289499, 1, 0.5333334, 0, 1,
-1.364954, 0.09160657, -1.030459, 1, 0.5411765, 0, 1,
-1.364057, -1.240861, -3.123445, 1, 0.5450981, 0, 1,
-1.351447, -0.1941874, -3.767146, 1, 0.5529412, 0, 1,
-1.346109, -0.1453703, -1.935585, 1, 0.5568628, 0, 1,
-1.29971, -1.695227, -1.840225, 1, 0.5647059, 0, 1,
-1.290969, 0.06552605, -1.042513, 1, 0.5686275, 0, 1,
-1.289878, 0.4711065, -2.410706, 1, 0.5764706, 0, 1,
-1.289138, 0.9218188, -0.6561359, 1, 0.5803922, 0, 1,
-1.285443, 1.869712, -0.4405967, 1, 0.5882353, 0, 1,
-1.284582, 0.4910088, -1.566825, 1, 0.5921569, 0, 1,
-1.283806, -1.589154, -3.950811, 1, 0.6, 0, 1,
-1.269918, 0.6512676, -1.164252, 1, 0.6078432, 0, 1,
-1.269859, -0.6083337, -1.994355, 1, 0.6117647, 0, 1,
-1.266222, -1.610477, -0.8173769, 1, 0.6196079, 0, 1,
-1.260572, -0.04179464, -0.7057539, 1, 0.6235294, 0, 1,
-1.244155, 0.3904255, -1.678739, 1, 0.6313726, 0, 1,
-1.239791, 1.29948, -0.3150631, 1, 0.6352941, 0, 1,
-1.232877, 0.7333551, -1.64694, 1, 0.6431373, 0, 1,
-1.226947, -0.7782086, -1.733073, 1, 0.6470588, 0, 1,
-1.225064, 1.48659, 0.3355322, 1, 0.654902, 0, 1,
-1.221625, 0.6693131, -0.8234872, 1, 0.6588235, 0, 1,
-1.217719, -0.5978165, -2.179714, 1, 0.6666667, 0, 1,
-1.210064, -0.02070306, -0.9741527, 1, 0.6705883, 0, 1,
-1.209282, -0.848167, -3.218599, 1, 0.6784314, 0, 1,
-1.201678, 0.1465575, -4.072764, 1, 0.682353, 0, 1,
-1.198903, -1.419706, -2.65221, 1, 0.6901961, 0, 1,
-1.197612, -0.7422419, -1.080737, 1, 0.6941177, 0, 1,
-1.190662, 0.4753362, -2.418346, 1, 0.7019608, 0, 1,
-1.180491, 0.336247, -1.404481, 1, 0.7098039, 0, 1,
-1.17774, -0.8195046, -1.237697, 1, 0.7137255, 0, 1,
-1.175717, 0.7946116, 0.4890505, 1, 0.7215686, 0, 1,
-1.173409, 1.262551, 1.072845, 1, 0.7254902, 0, 1,
-1.166321, 0.2297249, -1.099377, 1, 0.7333333, 0, 1,
-1.163465, 1.123142, -0.04301038, 1, 0.7372549, 0, 1,
-1.142208, -0.6026608, -1.38666, 1, 0.7450981, 0, 1,
-1.137428, 1.015079, -1.820247, 1, 0.7490196, 0, 1,
-1.137071, 0.5525321, -2.932213, 1, 0.7568628, 0, 1,
-1.126471, -0.5663176, -3.014038, 1, 0.7607843, 0, 1,
-1.126242, 0.01655846, -2.020394, 1, 0.7686275, 0, 1,
-1.110668, 0.354566, -1.817337, 1, 0.772549, 0, 1,
-1.109475, 1.172001, -0.9223853, 1, 0.7803922, 0, 1,
-1.108641, -0.3553434, -2.645997, 1, 0.7843137, 0, 1,
-1.104808, 0.7892742, -0.6760707, 1, 0.7921569, 0, 1,
-1.101797, -1.601677, -2.065371, 1, 0.7960784, 0, 1,
-1.100658, -1.093316, -3.552307, 1, 0.8039216, 0, 1,
-1.09307, -0.9077203, -3.971307, 1, 0.8117647, 0, 1,
-1.090453, -0.00101267, -1.814861, 1, 0.8156863, 0, 1,
-1.075219, -0.7584985, -1.876275, 1, 0.8235294, 0, 1,
-1.073363, -1.098822, -0.9917325, 1, 0.827451, 0, 1,
-1.057058, 0.6939636, -0.5664692, 1, 0.8352941, 0, 1,
-1.056964, -1.002256, -1.535549, 1, 0.8392157, 0, 1,
-1.049916, 0.1548152, -1.541038, 1, 0.8470588, 0, 1,
-1.042379, -2.214485, -2.160051, 1, 0.8509804, 0, 1,
-1.038594, 0.4373789, -1.991516, 1, 0.8588235, 0, 1,
-1.034179, -0.5935792, -1.924823, 1, 0.8627451, 0, 1,
-1.033778, -0.5094945, -2.819943, 1, 0.8705882, 0, 1,
-1.030371, -0.6626695, -1.784485, 1, 0.8745098, 0, 1,
-1.02617, 0.7917406, -2.147786, 1, 0.8823529, 0, 1,
-1.024202, 0.1550137, -2.189263, 1, 0.8862745, 0, 1,
-1.022644, 0.7740148, 0.7209231, 1, 0.8941177, 0, 1,
-1.012513, -0.9094414, -2.264154, 1, 0.8980392, 0, 1,
-1.008503, 0.03061379, -1.085604, 1, 0.9058824, 0, 1,
-1.005664, 0.0398165, -1.019246, 1, 0.9137255, 0, 1,
-1.000098, 0.009488926, -1.459871, 1, 0.9176471, 0, 1,
-0.9961803, 0.4935527, -0.7325112, 1, 0.9254902, 0, 1,
-0.9904889, 0.5097558, -1.357771, 1, 0.9294118, 0, 1,
-0.9856905, 0.2469678, -2.640197, 1, 0.9372549, 0, 1,
-0.9849722, -2.201908, -4.061391, 1, 0.9411765, 0, 1,
-0.9743001, -0.5949138, -1.532372, 1, 0.9490196, 0, 1,
-0.9715436, -0.1702275, -1.395003, 1, 0.9529412, 0, 1,
-0.9693466, -2.553053, -3.405707, 1, 0.9607843, 0, 1,
-0.9681858, -0.3384231, -1.108214, 1, 0.9647059, 0, 1,
-0.9587696, -0.4370028, -2.283715, 1, 0.972549, 0, 1,
-0.950689, -1.255167, -3.261406, 1, 0.9764706, 0, 1,
-0.9486052, 1.844185, -1.178442, 1, 0.9843137, 0, 1,
-0.9456519, 0.3320107, -1.481299, 1, 0.9882353, 0, 1,
-0.9425916, -0.8319883, -1.458603, 1, 0.9960784, 0, 1,
-0.9412833, 0.08641983, -2.540004, 0.9960784, 1, 0, 1,
-0.9395783, -0.6832449, -1.954677, 0.9921569, 1, 0, 1,
-0.9390305, -0.394807, -2.571417, 0.9843137, 1, 0, 1,
-0.9340388, 0.5926788, 0.03531696, 0.9803922, 1, 0, 1,
-0.9328594, -1.892485, -3.643118, 0.972549, 1, 0, 1,
-0.9323649, 0.1167007, -1.452018, 0.9686275, 1, 0, 1,
-0.9204542, 0.5585576, -1.50016, 0.9607843, 1, 0, 1,
-0.9159958, -0.6198969, -0.7823735, 0.9568627, 1, 0, 1,
-0.9159802, 2.414343, -0.1537017, 0.9490196, 1, 0, 1,
-0.9154097, 0.2806822, -1.218233, 0.945098, 1, 0, 1,
-0.9108084, -0.1371702, -0.2019885, 0.9372549, 1, 0, 1,
-0.9029073, -0.4896188, -0.1257949, 0.9333333, 1, 0, 1,
-0.9019161, 2.246823, -0.1216989, 0.9254902, 1, 0, 1,
-0.8997318, 0.8720487, -0.3272106, 0.9215686, 1, 0, 1,
-0.8948742, 0.1420605, -2.389619, 0.9137255, 1, 0, 1,
-0.8859376, -0.8604707, -2.548455, 0.9098039, 1, 0, 1,
-0.8786208, -0.3903564, -2.517099, 0.9019608, 1, 0, 1,
-0.8734072, -0.4816026, -1.885312, 0.8941177, 1, 0, 1,
-0.866205, -0.5723205, -1.755423, 0.8901961, 1, 0, 1,
-0.8639023, 0.4566073, -1.418875, 0.8823529, 1, 0, 1,
-0.8609903, 0.1044815, -1.624134, 0.8784314, 1, 0, 1,
-0.8595647, 0.8974002, -1.853343, 0.8705882, 1, 0, 1,
-0.8595553, -0.5239252, -1.231919, 0.8666667, 1, 0, 1,
-0.8553135, -1.35107, -3.978467, 0.8588235, 1, 0, 1,
-0.8498952, 0.6974363, 0.69263, 0.854902, 1, 0, 1,
-0.8488848, 0.09866016, -0.500057, 0.8470588, 1, 0, 1,
-0.8477895, -1.396021, -2.452604, 0.8431373, 1, 0, 1,
-0.8460056, -0.7926291, -1.132994, 0.8352941, 1, 0, 1,
-0.845829, -0.1484907, -1.145368, 0.8313726, 1, 0, 1,
-0.8409588, 1.30484, -0.3107894, 0.8235294, 1, 0, 1,
-0.83805, 0.08849616, -1.790636, 0.8196079, 1, 0, 1,
-0.8317011, -1.440522, -2.799137, 0.8117647, 1, 0, 1,
-0.8312129, 1.17527, -0.1526714, 0.8078431, 1, 0, 1,
-0.8293279, -0.9709694, -1.665471, 0.8, 1, 0, 1,
-0.8255598, 2.470811, -0.7551189, 0.7921569, 1, 0, 1,
-0.8246778, 0.6469087, -0.5125887, 0.7882353, 1, 0, 1,
-0.8243149, -0.4632369, -1.967871, 0.7803922, 1, 0, 1,
-0.8194513, -0.2672306, -2.836283, 0.7764706, 1, 0, 1,
-0.8121166, -1.77837, -2.365233, 0.7686275, 1, 0, 1,
-0.8054023, -2.305328, -2.890268, 0.7647059, 1, 0, 1,
-0.7918361, 0.4941325, -0.01704982, 0.7568628, 1, 0, 1,
-0.7820484, 1.79797, 0.6314084, 0.7529412, 1, 0, 1,
-0.7708178, -1.204147, -2.11659, 0.7450981, 1, 0, 1,
-0.7628755, -0.6821122, -0.8375703, 0.7411765, 1, 0, 1,
-0.760381, 0.4939764, -0.1462297, 0.7333333, 1, 0, 1,
-0.7575148, 2.511258, -2.143598, 0.7294118, 1, 0, 1,
-0.750635, 0.04401369, -2.297275, 0.7215686, 1, 0, 1,
-0.7499571, 0.6228569, -0.1699721, 0.7176471, 1, 0, 1,
-0.746303, -1.246481, -3.812916, 0.7098039, 1, 0, 1,
-0.743704, -1.671474, -3.197206, 0.7058824, 1, 0, 1,
-0.7428992, -0.4412417, -2.417337, 0.6980392, 1, 0, 1,
-0.7415262, -0.6093821, -0.4788955, 0.6901961, 1, 0, 1,
-0.7374375, 0.9760904, 0.3841955, 0.6862745, 1, 0, 1,
-0.7367846, -0.2071828, -0.3410297, 0.6784314, 1, 0, 1,
-0.7354002, -0.9445667, -0.9187589, 0.6745098, 1, 0, 1,
-0.732925, 0.9067056, 0.580038, 0.6666667, 1, 0, 1,
-0.7324909, 0.07632921, -0.4884078, 0.6627451, 1, 0, 1,
-0.7238587, 0.452952, 0.001432286, 0.654902, 1, 0, 1,
-0.723092, 0.4136108, -0.32022, 0.6509804, 1, 0, 1,
-0.7227713, 0.2733551, -0.7910177, 0.6431373, 1, 0, 1,
-0.7224386, 0.5082284, -1.226534, 0.6392157, 1, 0, 1,
-0.7223369, -0.5871182, -3.372364, 0.6313726, 1, 0, 1,
-0.7219152, 1.042845, 0.1647676, 0.627451, 1, 0, 1,
-0.7190692, -0.5557554, -2.763221, 0.6196079, 1, 0, 1,
-0.7188266, 0.6672891, -1.659728, 0.6156863, 1, 0, 1,
-0.7176438, -0.5794718, -5.650325, 0.6078432, 1, 0, 1,
-0.7151302, -1.038237, -1.236272, 0.6039216, 1, 0, 1,
-0.7101315, -1.44064, -1.664514, 0.5960785, 1, 0, 1,
-0.7045192, 0.6449871, -2.116069, 0.5882353, 1, 0, 1,
-0.6930017, -0.5661134, -2.087276, 0.5843138, 1, 0, 1,
-0.69087, -0.3046467, -4.775744, 0.5764706, 1, 0, 1,
-0.6818126, 0.4314634, -1.105978, 0.572549, 1, 0, 1,
-0.6767304, -1.754904, -3.40189, 0.5647059, 1, 0, 1,
-0.6724028, -0.01609775, -0.3138544, 0.5607843, 1, 0, 1,
-0.6713256, -0.4491228, -3.277812, 0.5529412, 1, 0, 1,
-0.6660332, 0.000579256, -1.340026, 0.5490196, 1, 0, 1,
-0.6641103, 1.237513, 0.8788505, 0.5411765, 1, 0, 1,
-0.6609195, -0.426056, -1.477802, 0.5372549, 1, 0, 1,
-0.6498544, -0.8201769, -1.093506, 0.5294118, 1, 0, 1,
-0.6495361, -1.389245, -1.807136, 0.5254902, 1, 0, 1,
-0.6462926, 0.8671032, -1.392706, 0.5176471, 1, 0, 1,
-0.6461321, 1.045222, 0.8481337, 0.5137255, 1, 0, 1,
-0.6423563, 0.354844, -0.8377051, 0.5058824, 1, 0, 1,
-0.6413131, 0.8712232, -0.3375866, 0.5019608, 1, 0, 1,
-0.6381445, 2.717109, 0.7528443, 0.4941176, 1, 0, 1,
-0.6356676, 0.828843, -0.2052247, 0.4862745, 1, 0, 1,
-0.628205, -1.399831, -2.4472, 0.4823529, 1, 0, 1,
-0.6261339, -0.05038317, -3.155831, 0.4745098, 1, 0, 1,
-0.6201734, 1.325814, 0.4702366, 0.4705882, 1, 0, 1,
-0.6154602, -1.035483, -2.225485, 0.4627451, 1, 0, 1,
-0.6127148, 1.241192, -2.270063, 0.4588235, 1, 0, 1,
-0.6079531, -1.350984, -0.736079, 0.4509804, 1, 0, 1,
-0.6074246, -1.020602, -2.261611, 0.4470588, 1, 0, 1,
-0.6065908, 0.3862731, -1.111041, 0.4392157, 1, 0, 1,
-0.5864453, 0.2919905, -2.498549, 0.4352941, 1, 0, 1,
-0.5807078, -0.5133162, -2.238436, 0.427451, 1, 0, 1,
-0.579092, 0.6348311, -1.880406, 0.4235294, 1, 0, 1,
-0.5774311, -0.5153725, -1.440075, 0.4156863, 1, 0, 1,
-0.5750972, 1.215086, -0.02102502, 0.4117647, 1, 0, 1,
-0.5747357, -0.4342722, -1.272083, 0.4039216, 1, 0, 1,
-0.5699241, 0.3215039, -1.699695, 0.3960784, 1, 0, 1,
-0.5681948, -0.2482894, -2.710334, 0.3921569, 1, 0, 1,
-0.5668219, -1.435197, -3.590848, 0.3843137, 1, 0, 1,
-0.5655733, 0.1315315, -1.035904, 0.3803922, 1, 0, 1,
-0.5655546, -0.03746958, -2.655706, 0.372549, 1, 0, 1,
-0.5629691, -0.9301666, -4.111385, 0.3686275, 1, 0, 1,
-0.5619228, -0.5552016, -2.397512, 0.3607843, 1, 0, 1,
-0.5593449, -1.228251, -2.493169, 0.3568628, 1, 0, 1,
-0.5582339, -0.6009802, -3.734972, 0.3490196, 1, 0, 1,
-0.5547204, 0.6076458, -1.212438, 0.345098, 1, 0, 1,
-0.554692, 1.12986, -1.09754, 0.3372549, 1, 0, 1,
-0.5541737, 1.670176, 0.9732814, 0.3333333, 1, 0, 1,
-0.5533862, -0.1602011, -1.2454, 0.3254902, 1, 0, 1,
-0.548987, 0.30562, -0.5925201, 0.3215686, 1, 0, 1,
-0.5481777, -1.439284, -1.982669, 0.3137255, 1, 0, 1,
-0.5467103, 2.254542, -1.114852, 0.3098039, 1, 0, 1,
-0.5460858, 0.02232661, -1.979611, 0.3019608, 1, 0, 1,
-0.5451238, 0.1050702, -1.269366, 0.2941177, 1, 0, 1,
-0.5423084, -1.445399, -2.504873, 0.2901961, 1, 0, 1,
-0.541247, -1.188663, -3.779294, 0.282353, 1, 0, 1,
-0.5371647, -0.7208524, -1.718833, 0.2784314, 1, 0, 1,
-0.5330079, -0.1935241, -1.719733, 0.2705882, 1, 0, 1,
-0.532777, -1.20925, -2.269021, 0.2666667, 1, 0, 1,
-0.5229903, -0.6014211, -1.822797, 0.2588235, 1, 0, 1,
-0.5221687, -1.433378, -2.883126, 0.254902, 1, 0, 1,
-0.5187336, 0.5800391, -0.09006513, 0.2470588, 1, 0, 1,
-0.5116827, -1.904542, -0.852231, 0.2431373, 1, 0, 1,
-0.5077533, 0.01564456, -3.530384, 0.2352941, 1, 0, 1,
-0.5049819, -2.415937, -3.979808, 0.2313726, 1, 0, 1,
-0.5046853, 1.434719, -0.4190586, 0.2235294, 1, 0, 1,
-0.5003827, 0.1654758, -1.8387, 0.2196078, 1, 0, 1,
-0.4985892, -0.422579, -1.698478, 0.2117647, 1, 0, 1,
-0.498492, -0.2448216, -1.572718, 0.2078431, 1, 0, 1,
-0.4964831, -0.3390408, -1.272256, 0.2, 1, 0, 1,
-0.4959615, 0.680756, 1.434105, 0.1921569, 1, 0, 1,
-0.4957666, -0.7321289, -2.897036, 0.1882353, 1, 0, 1,
-0.4930814, -0.02341279, -1.875312, 0.1803922, 1, 0, 1,
-0.4917349, 0.3899309, -0.6446988, 0.1764706, 1, 0, 1,
-0.491325, -0.006905396, -1.760561, 0.1686275, 1, 0, 1,
-0.4906447, 1.537071, 0.7990674, 0.1647059, 1, 0, 1,
-0.4901239, 0.6610364, -2.187631, 0.1568628, 1, 0, 1,
-0.4850941, -0.6205991, -2.549082, 0.1529412, 1, 0, 1,
-0.4813876, 0.959031, 0.04429831, 0.145098, 1, 0, 1,
-0.4741787, 2.529361, 0.6054322, 0.1411765, 1, 0, 1,
-0.4713205, 1.915146, 0.5388169, 0.1333333, 1, 0, 1,
-0.4713177, -0.2726611, -0.2950453, 0.1294118, 1, 0, 1,
-0.4627829, 0.6871168, -0.6519945, 0.1215686, 1, 0, 1,
-0.4607576, 0.02955655, -2.99293, 0.1176471, 1, 0, 1,
-0.4603851, -0.7699644, -1.374094, 0.1098039, 1, 0, 1,
-0.4586118, 1.204676, -0.3447272, 0.1058824, 1, 0, 1,
-0.4556528, -1.873103, -2.404329, 0.09803922, 1, 0, 1,
-0.4543152, -0.4780869, -1.547909, 0.09019608, 1, 0, 1,
-0.4538857, -0.1169091, -1.399575, 0.08627451, 1, 0, 1,
-0.4518935, -0.7432523, -2.668215, 0.07843138, 1, 0, 1,
-0.4502129, 1.165251, -2.779483, 0.07450981, 1, 0, 1,
-0.4473274, -1.823498, -1.064688, 0.06666667, 1, 0, 1,
-0.4470639, 0.8542186, 0.222097, 0.0627451, 1, 0, 1,
-0.4420538, -0.164964, -2.310999, 0.05490196, 1, 0, 1,
-0.4361319, -0.3316346, -2.700367, 0.05098039, 1, 0, 1,
-0.4356038, 0.7876831, -2.249592, 0.04313726, 1, 0, 1,
-0.4342702, 0.05812009, -2.544782, 0.03921569, 1, 0, 1,
-0.4317979, -0.592553, -1.905059, 0.03137255, 1, 0, 1,
-0.4317245, -0.3519595, -1.170438, 0.02745098, 1, 0, 1,
-0.427218, -1.283939, -4.288666, 0.01960784, 1, 0, 1,
-0.427036, 0.2365591, 0.04991337, 0.01568628, 1, 0, 1,
-0.4235246, 1.390383, -0.0863181, 0.007843138, 1, 0, 1,
-0.4215557, 0.08994658, -1.787788, 0.003921569, 1, 0, 1,
-0.4195236, -0.8702999, -3.345397, 0, 1, 0.003921569, 1,
-0.4170748, 0.4249736, -1.241486, 0, 1, 0.01176471, 1,
-0.412461, -0.2732232, -1.116517, 0, 1, 0.01568628, 1,
-0.411372, -1.103617, -1.617148, 0, 1, 0.02352941, 1,
-0.4099664, 0.4661227, -0.5611581, 0, 1, 0.02745098, 1,
-0.4087727, 0.8079373, -0.804785, 0, 1, 0.03529412, 1,
-0.4083439, -0.02077426, -0.9661126, 0, 1, 0.03921569, 1,
-0.4053453, 0.02785481, -2.059917, 0, 1, 0.04705882, 1,
-0.4030796, 0.5064902, -0.818733, 0, 1, 0.05098039, 1,
-0.3995212, -0.1013351, -0.1773974, 0, 1, 0.05882353, 1,
-0.3916319, -0.721256, -2.038646, 0, 1, 0.0627451, 1,
-0.3894645, -0.2464231, -1.351776, 0, 1, 0.07058824, 1,
-0.3885263, -0.7657593, -2.182919, 0, 1, 0.07450981, 1,
-0.3865995, 0.6325806, -1.362658, 0, 1, 0.08235294, 1,
-0.3828453, 0.945854, 1.339022, 0, 1, 0.08627451, 1,
-0.3824773, -0.9663607, -2.712752, 0, 1, 0.09411765, 1,
-0.3799867, 0.02532406, -1.524041, 0, 1, 0.1019608, 1,
-0.3758794, 0.143139, -0.1899334, 0, 1, 0.1058824, 1,
-0.3724858, 1.063077, 0.09165012, 0, 1, 0.1137255, 1,
-0.3709721, 0.4247946, -0.9335295, 0, 1, 0.1176471, 1,
-0.3683951, 1.313032, 0.7339108, 0, 1, 0.1254902, 1,
-0.3675486, -2.732098, -4.88777, 0, 1, 0.1294118, 1,
-0.3663895, -1.509205, -1.692344, 0, 1, 0.1372549, 1,
-0.3657484, 0.05956202, -2.693375, 0, 1, 0.1411765, 1,
-0.3547354, -0.9594516, -3.081141, 0, 1, 0.1490196, 1,
-0.3546731, 0.6131989, -1.623349, 0, 1, 0.1529412, 1,
-0.3544456, -2.148566, -4.216548, 0, 1, 0.1607843, 1,
-0.353962, 0.9072335, 0.284501, 0, 1, 0.1647059, 1,
-0.3479353, 2.695212, -1.083155, 0, 1, 0.172549, 1,
-0.3473005, 0.3625125, -0.7053874, 0, 1, 0.1764706, 1,
-0.3421684, 1.380933, -0.626112, 0, 1, 0.1843137, 1,
-0.3365479, -0.4497617, -2.504973, 0, 1, 0.1882353, 1,
-0.335527, 0.8013654, -0.3592694, 0, 1, 0.1960784, 1,
-0.3344332, -0.4507081, -3.4643, 0, 1, 0.2039216, 1,
-0.3341424, -1.305859, -2.589351, 0, 1, 0.2078431, 1,
-0.3341068, -2.043593, -3.653267, 0, 1, 0.2156863, 1,
-0.3314506, -1.373523, -3.543907, 0, 1, 0.2196078, 1,
-0.3296308, -1.24722, -2.575913, 0, 1, 0.227451, 1,
-0.3270476, 0.0918676, -1.781562, 0, 1, 0.2313726, 1,
-0.3252971, 0.2177357, -0.137423, 0, 1, 0.2392157, 1,
-0.3176056, -1.329283, -3.249148, 0, 1, 0.2431373, 1,
-0.2964317, 1.290108, 0.7526239, 0, 1, 0.2509804, 1,
-0.2938912, 0.5881956, -1.414131, 0, 1, 0.254902, 1,
-0.2917022, -1.213122, -0.8020034, 0, 1, 0.2627451, 1,
-0.2914769, 0.2268672, -0.8387514, 0, 1, 0.2666667, 1,
-0.2816642, -2.704269, -4.240278, 0, 1, 0.2745098, 1,
-0.2797636, 2.290736, -1.60599, 0, 1, 0.2784314, 1,
-0.276117, -1.221168, -3.257008, 0, 1, 0.2862745, 1,
-0.2752199, 1.214024, -1.671866, 0, 1, 0.2901961, 1,
-0.2737973, -0.7917143, -1.148922, 0, 1, 0.2980392, 1,
-0.2714657, 0.2069439, -0.5798559, 0, 1, 0.3058824, 1,
-0.2666243, 0.7939405, 0.4103775, 0, 1, 0.3098039, 1,
-0.2636513, 1.174646, 1.198687, 0, 1, 0.3176471, 1,
-0.2632444, 1.466592, 1.605793, 0, 1, 0.3215686, 1,
-0.2581763, 1.059432, -0.5573872, 0, 1, 0.3294118, 1,
-0.2565447, 0.4966515, -0.6438699, 0, 1, 0.3333333, 1,
-0.2551295, 1.031004, -0.684202, 0, 1, 0.3411765, 1,
-0.2523041, 1.141189, 0.02649636, 0, 1, 0.345098, 1,
-0.2522596, -0.6258255, -2.0292, 0, 1, 0.3529412, 1,
-0.2521704, 1.848172, 0.3385881, 0, 1, 0.3568628, 1,
-0.2514313, -0.3653712, -2.151951, 0, 1, 0.3647059, 1,
-0.2473913, -0.8830851, -3.656925, 0, 1, 0.3686275, 1,
-0.2466757, 0.625834, 0.5887995, 0, 1, 0.3764706, 1,
-0.240977, 1.093162, -1.157956, 0, 1, 0.3803922, 1,
-0.2393146, -0.05898682, -1.421489, 0, 1, 0.3882353, 1,
-0.2384785, 1.05831, -0.399758, 0, 1, 0.3921569, 1,
-0.2373828, -1.456635, -3.816055, 0, 1, 0.4, 1,
-0.2362626, -1.241249, -3.240622, 0, 1, 0.4078431, 1,
-0.2300654, 1.439595, 0.6421754, 0, 1, 0.4117647, 1,
-0.2299147, -1.045964, -3.302474, 0, 1, 0.4196078, 1,
-0.2296332, 0.8326964, -1.523136, 0, 1, 0.4235294, 1,
-0.2288171, -0.4158434, -2.075595, 0, 1, 0.4313726, 1,
-0.2287271, 1.102001, 0.6241671, 0, 1, 0.4352941, 1,
-0.2275813, -0.3640055, -2.719387, 0, 1, 0.4431373, 1,
-0.2255451, -0.04341824, -3.65996, 0, 1, 0.4470588, 1,
-0.2252331, 1.413868, 0.1167019, 0, 1, 0.454902, 1,
-0.2205022, -0.9334026, 0.1569398, 0, 1, 0.4588235, 1,
-0.2187582, -0.942547, -1.610015, 0, 1, 0.4666667, 1,
-0.218215, 1.427324, -0.2760213, 0, 1, 0.4705882, 1,
-0.2135524, -0.02287529, -2.348599, 0, 1, 0.4784314, 1,
-0.2129537, -1.78873, -1.581826, 0, 1, 0.4823529, 1,
-0.2105694, -0.3997411, -2.460318, 0, 1, 0.4901961, 1,
-0.2100423, 0.2341633, 0.007210078, 0, 1, 0.4941176, 1,
-0.2091824, -0.1549701, -1.934606, 0, 1, 0.5019608, 1,
-0.2043863, -0.1562351, -4.183836, 0, 1, 0.509804, 1,
-0.2017366, -0.1586923, -2.808076, 0, 1, 0.5137255, 1,
-0.2008394, -0.02212981, 1.422603, 0, 1, 0.5215687, 1,
-0.197991, 0.4992871, -2.068816, 0, 1, 0.5254902, 1,
-0.197261, -0.5827771, -4.782521, 0, 1, 0.5333334, 1,
-0.1965155, 1.741498, -1.182007, 0, 1, 0.5372549, 1,
-0.1955736, -0.2588786, -1.991177, 0, 1, 0.5450981, 1,
-0.1949393, -0.2674785, -1.600205, 0, 1, 0.5490196, 1,
-0.1929244, -1.18722, -3.620981, 0, 1, 0.5568628, 1,
-0.1928482, 0.7987575, 0.4681742, 0, 1, 0.5607843, 1,
-0.1892894, -0.7461581, -2.218407, 0, 1, 0.5686275, 1,
-0.187348, 1.623666, -1.483812, 0, 1, 0.572549, 1,
-0.1864376, 0.3345235, 0.07559442, 0, 1, 0.5803922, 1,
-0.185595, 0.4691515, -0.4194587, 0, 1, 0.5843138, 1,
-0.1842055, -0.105268, -3.153439, 0, 1, 0.5921569, 1,
-0.1841321, -0.2898929, -2.7064, 0, 1, 0.5960785, 1,
-0.180462, 0.4944252, 0.8755118, 0, 1, 0.6039216, 1,
-0.1792011, 0.1685409, -1.489905, 0, 1, 0.6117647, 1,
-0.1790771, 0.5728319, 1.447721, 0, 1, 0.6156863, 1,
-0.1745172, -0.9305443, -3.558323, 0, 1, 0.6235294, 1,
-0.1737988, -1.055436, -1.887672, 0, 1, 0.627451, 1,
-0.1695294, 0.6963395, -0.4422337, 0, 1, 0.6352941, 1,
-0.1683261, 0.3677331, -1.808779, 0, 1, 0.6392157, 1,
-0.1672678, -1.602925, -4.872766, 0, 1, 0.6470588, 1,
-0.1657715, -0.6878389, -2.112267, 0, 1, 0.6509804, 1,
-0.163183, 1.511462, 0.5186454, 0, 1, 0.6588235, 1,
-0.1576795, 0.6951372, -2.114814, 0, 1, 0.6627451, 1,
-0.1538522, -2.769255, -2.367069, 0, 1, 0.6705883, 1,
-0.148902, -0.3970592, -2.658334, 0, 1, 0.6745098, 1,
-0.1456055, 0.420246, 1.309326, 0, 1, 0.682353, 1,
-0.1450462, -1.069124, -1.730628, 0, 1, 0.6862745, 1,
-0.142337, -0.6234362, -3.706095, 0, 1, 0.6941177, 1,
-0.1400877, -0.7540688, -3.28599, 0, 1, 0.7019608, 1,
-0.1395465, 0.0951649, -1.66406, 0, 1, 0.7058824, 1,
-0.1368169, -0.3148551, -2.767911, 0, 1, 0.7137255, 1,
-0.1318132, -0.5335281, -2.495594, 0, 1, 0.7176471, 1,
-0.1301559, -0.1750522, -2.172479, 0, 1, 0.7254902, 1,
-0.1287825, -0.7753925, -2.590981, 0, 1, 0.7294118, 1,
-0.126885, 0.563592, -2.358289, 0, 1, 0.7372549, 1,
-0.1265459, -0.6954986, -1.311346, 0, 1, 0.7411765, 1,
-0.1251557, -0.09856781, -3.244332, 0, 1, 0.7490196, 1,
-0.1226362, 2.291868, -1.985488, 0, 1, 0.7529412, 1,
-0.121972, 0.7186716, 1.258869, 0, 1, 0.7607843, 1,
-0.1160896, 0.07533648, -1.862967, 0, 1, 0.7647059, 1,
-0.1158144, -1.659147, -3.773349, 0, 1, 0.772549, 1,
-0.1145327, 1.066566, 0.2333436, 0, 1, 0.7764706, 1,
-0.114429, 0.6528538, 0.188962, 0, 1, 0.7843137, 1,
-0.1140257, -0.9155546, -3.161089, 0, 1, 0.7882353, 1,
-0.1113885, 0.8758937, 0.0623817, 0, 1, 0.7960784, 1,
-0.1085319, 0.08147472, -0.1743387, 0, 1, 0.8039216, 1,
-0.1082064, -0.2659684, -0.8720492, 0, 1, 0.8078431, 1,
-0.1080246, -0.6508733, -4.271641, 0, 1, 0.8156863, 1,
-0.1032126, 0.7767826, 0.5448152, 0, 1, 0.8196079, 1,
-0.1016382, -2.801393, -2.58922, 0, 1, 0.827451, 1,
-0.1012627, -0.9417599, -3.459639, 0, 1, 0.8313726, 1,
-0.09280184, 0.5391347, 1.06731, 0, 1, 0.8392157, 1,
-0.09146908, 0.5554406, 0.1598966, 0, 1, 0.8431373, 1,
-0.09075095, 1.597479, 0.6755098, 0, 1, 0.8509804, 1,
-0.08914608, -0.780407, -5.588122, 0, 1, 0.854902, 1,
-0.08674055, 0.4001549, 0.742274, 0, 1, 0.8627451, 1,
-0.08236279, 0.72612, -1.240216, 0, 1, 0.8666667, 1,
-0.07982961, -0.9418542, -3.54296, 0, 1, 0.8745098, 1,
-0.0771693, -1.190677, -3.625529, 0, 1, 0.8784314, 1,
-0.06472363, 0.3286668, -0.6227584, 0, 1, 0.8862745, 1,
-0.06051065, -0.322093, -4.659986, 0, 1, 0.8901961, 1,
-0.05769947, 1.39354, -0.1623931, 0, 1, 0.8980392, 1,
-0.05444502, -1.450867, -2.297581, 0, 1, 0.9058824, 1,
-0.05342756, -0.8766239, -2.535112, 0, 1, 0.9098039, 1,
-0.0523299, -1.143505, -3.677524, 0, 1, 0.9176471, 1,
-0.0466377, 1.795309, -0.4347584, 0, 1, 0.9215686, 1,
-0.0371118, -0.5532305, -4.044372, 0, 1, 0.9294118, 1,
-0.03126789, 1.032642, -2.442276, 0, 1, 0.9333333, 1,
-0.01958476, 0.809818, 0.7206363, 0, 1, 0.9411765, 1,
-0.01708063, 0.6805046, -0.3047421, 0, 1, 0.945098, 1,
-0.01569637, -0.2111682, -3.979574, 0, 1, 0.9529412, 1,
-0.01546445, 0.6087644, -0.9824965, 0, 1, 0.9568627, 1,
-0.01374076, 0.5229009, -1.497872, 0, 1, 0.9647059, 1,
-0.01298538, 0.6457075, -1.433477, 0, 1, 0.9686275, 1,
-0.01251571, 2.002238, 0.3332421, 0, 1, 0.9764706, 1,
-0.008481211, 0.5726019, 1.985418, 0, 1, 0.9803922, 1,
-0.007810246, -1.6332, -2.515832, 0, 1, 0.9882353, 1,
-0.003937274, -0.5354846, -3.19023, 0, 1, 0.9921569, 1,
-0.002614721, 0.6388054, 0.2560788, 0, 1, 1, 1,
-0.002321936, -0.8837974, -4.820909, 0, 0.9921569, 1, 1,
-0.0008020837, 0.307306, -0.65301, 0, 0.9882353, 1, 1,
-0.0002082142, -1.563699, -2.649989, 0, 0.9803922, 1, 1,
-0.0001874932, -2.315799, -1.808652, 0, 0.9764706, 1, 1,
0.00166001, 1.281857, 0.9608571, 0, 0.9686275, 1, 1,
0.005392793, 1.569729, -0.9179627, 0, 0.9647059, 1, 1,
0.00650391, 1.835004, -0.4210767, 0, 0.9568627, 1, 1,
0.006765244, 0.1550254, -0.3253928, 0, 0.9529412, 1, 1,
0.009007167, -1.94041, 3.462089, 0, 0.945098, 1, 1,
0.01307329, 0.4006361, -0.5398661, 0, 0.9411765, 1, 1,
0.01462962, -1.024958, 2.939361, 0, 0.9333333, 1, 1,
0.01806412, 0.3436195, -0.41067, 0, 0.9294118, 1, 1,
0.01892148, -0.8854645, 3.045834, 0, 0.9215686, 1, 1,
0.02179263, -0.1713437, 1.873747, 0, 0.9176471, 1, 1,
0.02188512, -0.324338, 1.768852, 0, 0.9098039, 1, 1,
0.02199519, -0.8419579, 4.046766, 0, 0.9058824, 1, 1,
0.02283573, 1.129973, 0.8781247, 0, 0.8980392, 1, 1,
0.02293795, 0.9824129, -0.9077915, 0, 0.8901961, 1, 1,
0.02814194, -0.2078395, 2.199153, 0, 0.8862745, 1, 1,
0.03021228, 0.4478454, 0.2172483, 0, 0.8784314, 1, 1,
0.03212841, -0.8589309, 3.153836, 0, 0.8745098, 1, 1,
0.03317885, -0.9181119, 4.171842, 0, 0.8666667, 1, 1,
0.03418668, -0.7052673, 2.095539, 0, 0.8627451, 1, 1,
0.0374817, -1.428832, 4.89854, 0, 0.854902, 1, 1,
0.03970528, 2.05707, -0.7377741, 0, 0.8509804, 1, 1,
0.04160215, -1.225767, 3.682746, 0, 0.8431373, 1, 1,
0.04220669, -0.6675687, 2.151452, 0, 0.8392157, 1, 1,
0.04359451, -1.050979, 3.025286, 0, 0.8313726, 1, 1,
0.04459473, -1.212621, 3.781212, 0, 0.827451, 1, 1,
0.047734, -0.394469, 3.181537, 0, 0.8196079, 1, 1,
0.05184809, 0.862427, -0.2262601, 0, 0.8156863, 1, 1,
0.05444509, -0.9934509, 3.886914, 0, 0.8078431, 1, 1,
0.05479315, 1.623761, -0.1421957, 0, 0.8039216, 1, 1,
0.05673475, 0.5133072, 0.2679291, 0, 0.7960784, 1, 1,
0.05798923, 0.07671967, -0.3423283, 0, 0.7882353, 1, 1,
0.05884127, 0.509659, -1.523305, 0, 0.7843137, 1, 1,
0.06309034, -0.2716228, 2.858952, 0, 0.7764706, 1, 1,
0.06829724, -0.9883125, 2.960367, 0, 0.772549, 1, 1,
0.06988442, -0.2178236, 2.473501, 0, 0.7647059, 1, 1,
0.07128097, -0.9659041, 2.84407, 0, 0.7607843, 1, 1,
0.07136992, -0.446869, 2.293689, 0, 0.7529412, 1, 1,
0.07281782, 0.9078602, -0.7399412, 0, 0.7490196, 1, 1,
0.0764609, -1.427802, 5.103716, 0, 0.7411765, 1, 1,
0.07647634, 0.1973674, -0.2939592, 0, 0.7372549, 1, 1,
0.07796647, -1.846278, 3.18354, 0, 0.7294118, 1, 1,
0.08064036, 0.1330901, -0.6951878, 0, 0.7254902, 1, 1,
0.082302, -0.6366168, 1.4502, 0, 0.7176471, 1, 1,
0.08602692, 0.307129, -0.9591964, 0, 0.7137255, 1, 1,
0.086929, -0.5279374, 3.139176, 0, 0.7058824, 1, 1,
0.087222, 0.6095217, 1.539929, 0, 0.6980392, 1, 1,
0.09159718, 0.5456847, -0.4882763, 0, 0.6941177, 1, 1,
0.09214318, -0.5482292, 2.928671, 0, 0.6862745, 1, 1,
0.09350263, 1.384398, 1.201129, 0, 0.682353, 1, 1,
0.09795967, -2.732946, 3.280778, 0, 0.6745098, 1, 1,
0.1069602, 1.210729, 0.6352217, 0, 0.6705883, 1, 1,
0.1081195, 1.64555, 1.513051, 0, 0.6627451, 1, 1,
0.1141156, 0.538659, 0.1620336, 0, 0.6588235, 1, 1,
0.114387, -0.463064, 2.602051, 0, 0.6509804, 1, 1,
0.1182977, -1.395512, 3.522731, 0, 0.6470588, 1, 1,
0.1215715, -0.5265543, 2.744757, 0, 0.6392157, 1, 1,
0.1268487, 0.7984858, 0.7753145, 0, 0.6352941, 1, 1,
0.1330344, -0.8398011, 4.091099, 0, 0.627451, 1, 1,
0.1341925, 1.061693, -0.3628859, 0, 0.6235294, 1, 1,
0.1453297, -0.4617361, 3.00965, 0, 0.6156863, 1, 1,
0.1463576, 1.186968, 1.769342, 0, 0.6117647, 1, 1,
0.1470094, 0.2500248, 1.972796, 0, 0.6039216, 1, 1,
0.1472579, 1.421212, 2.157244, 0, 0.5960785, 1, 1,
0.1483958, 0.4721456, -1.156309, 0, 0.5921569, 1, 1,
0.1506411, 0.7638892, 0.7788903, 0, 0.5843138, 1, 1,
0.1597399, -0.4588075, 2.605377, 0, 0.5803922, 1, 1,
0.1598766, 0.8008566, -0.6535144, 0, 0.572549, 1, 1,
0.1619304, 0.01648168, 1.671287, 0, 0.5686275, 1, 1,
0.1620987, 0.6241797, -0.6676776, 0, 0.5607843, 1, 1,
0.1630427, 0.8437375, 1.116056, 0, 0.5568628, 1, 1,
0.1652769, -1.338683, 2.689008, 0, 0.5490196, 1, 1,
0.1666813, 0.1840782, 0.9194289, 0, 0.5450981, 1, 1,
0.1699418, -1.603557, 3.358665, 0, 0.5372549, 1, 1,
0.1725162, 0.6507428, -0.009878963, 0, 0.5333334, 1, 1,
0.1784306, 0.5198907, 1.614545, 0, 0.5254902, 1, 1,
0.181827, 0.3716379, -0.2143817, 0, 0.5215687, 1, 1,
0.1900695, -0.07690676, 0.6822786, 0, 0.5137255, 1, 1,
0.1909865, -0.3330177, 2.551982, 0, 0.509804, 1, 1,
0.192682, -0.09659799, 2.4662, 0, 0.5019608, 1, 1,
0.1940101, 1.36675, 1.766142, 0, 0.4941176, 1, 1,
0.1940634, 0.5171717, 1.972068, 0, 0.4901961, 1, 1,
0.1981549, 2.260252, 0.3294003, 0, 0.4823529, 1, 1,
0.1987094, 0.358443, 1.76633, 0, 0.4784314, 1, 1,
0.2018031, 0.1112234, -0.01246646, 0, 0.4705882, 1, 1,
0.2023842, -0.724416, 2.029678, 0, 0.4666667, 1, 1,
0.2069111, 0.6980213, 0.2550378, 0, 0.4588235, 1, 1,
0.2091001, -1.609019, 4.572832, 0, 0.454902, 1, 1,
0.2103752, -0.7943701, 0.8144591, 0, 0.4470588, 1, 1,
0.2116849, -0.5406653, 2.928473, 0, 0.4431373, 1, 1,
0.2120115, -0.7851502, 2.955668, 0, 0.4352941, 1, 1,
0.2126342, 0.6474231, 1.743092, 0, 0.4313726, 1, 1,
0.2133973, -1.084321, 3.03118, 0, 0.4235294, 1, 1,
0.214266, 1.268979, 2.876955, 0, 0.4196078, 1, 1,
0.2165031, -0.38265, 3.758651, 0, 0.4117647, 1, 1,
0.2176804, -0.124842, 1.311529, 0, 0.4078431, 1, 1,
0.2198251, 0.2683527, -0.04740431, 0, 0.4, 1, 1,
0.2201895, 0.8314974, -0.03623822, 0, 0.3921569, 1, 1,
0.220387, 0.3690556, -1.545053, 0, 0.3882353, 1, 1,
0.2213146, 0.8700327, -1.393407, 0, 0.3803922, 1, 1,
0.2232277, 0.6367884, 0.2692534, 0, 0.3764706, 1, 1,
0.2285536, -0.9590403, 4.166712, 0, 0.3686275, 1, 1,
0.2310248, -0.6827698, 3.721026, 0, 0.3647059, 1, 1,
0.2322729, 0.7559597, -0.5759038, 0, 0.3568628, 1, 1,
0.234722, 0.4056463, 2.063154, 0, 0.3529412, 1, 1,
0.2361085, -1.464149, 2.78149, 0, 0.345098, 1, 1,
0.2383827, 0.791804, 1.174541, 0, 0.3411765, 1, 1,
0.2409124, -0.875629, 3.134263, 0, 0.3333333, 1, 1,
0.2481424, -0.3868612, 2.862289, 0, 0.3294118, 1, 1,
0.2496932, 1.427757, -0.402719, 0, 0.3215686, 1, 1,
0.2497347, 0.01757948, 3.154382, 0, 0.3176471, 1, 1,
0.2542516, -0.45709, 3.169817, 0, 0.3098039, 1, 1,
0.2586292, -0.620427, 3.402664, 0, 0.3058824, 1, 1,
0.2590977, -1.196412, 3.67658, 0, 0.2980392, 1, 1,
0.259648, -0.269292, 1.246753, 0, 0.2901961, 1, 1,
0.263238, 0.8158554, -0.1627278, 0, 0.2862745, 1, 1,
0.2652846, 0.4696245, -0.7961208, 0, 0.2784314, 1, 1,
0.2669295, -1.141072, 3.85869, 0, 0.2745098, 1, 1,
0.2674898, -0.8724992, 4.214561, 0, 0.2666667, 1, 1,
0.2728051, -0.1452545, 3.081971, 0, 0.2627451, 1, 1,
0.2786199, -1.498198, 3.321655, 0, 0.254902, 1, 1,
0.2808899, 2.982955, -0.008295843, 0, 0.2509804, 1, 1,
0.2836518, -0.4125027, 1.042986, 0, 0.2431373, 1, 1,
0.286838, -2.999051, 3.201799, 0, 0.2392157, 1, 1,
0.2870148, -1.255476, 3.552624, 0, 0.2313726, 1, 1,
0.2888619, -0.5081114, -0.02996079, 0, 0.227451, 1, 1,
0.2909927, -0.04067376, 0.9952841, 0, 0.2196078, 1, 1,
0.291522, 0.311905, 0.7318276, 0, 0.2156863, 1, 1,
0.2915448, -1.259101, 3.232271, 0, 0.2078431, 1, 1,
0.3054252, -0.1852659, 1.922414, 0, 0.2039216, 1, 1,
0.3098822, -0.1387493, 1.444539, 0, 0.1960784, 1, 1,
0.3122005, 1.823298, -0.07266808, 0, 0.1882353, 1, 1,
0.313952, 0.9231555, 1.303273, 0, 0.1843137, 1, 1,
0.3157121, -0.3966905, 2.42694, 0, 0.1764706, 1, 1,
0.3157933, 2.18375, -0.1096393, 0, 0.172549, 1, 1,
0.3211185, -0.03272796, 1.102342, 0, 0.1647059, 1, 1,
0.3221987, -0.6366811, 3.909313, 0, 0.1607843, 1, 1,
0.3244286, 0.8456725, 2.787223, 0, 0.1529412, 1, 1,
0.3276313, -2.45235, 3.095391, 0, 0.1490196, 1, 1,
0.327978, 0.7514376, -0.2620808, 0, 0.1411765, 1, 1,
0.3299137, 0.5058819, 1.951539, 0, 0.1372549, 1, 1,
0.3310905, -0.3099553, 3.211875, 0, 0.1294118, 1, 1,
0.333396, 0.1934671, -0.08937955, 0, 0.1254902, 1, 1,
0.3385023, -0.7345119, 4.275548, 0, 0.1176471, 1, 1,
0.3394361, 2.536178, -0.9161377, 0, 0.1137255, 1, 1,
0.3461463, -1.85754, 2.237616, 0, 0.1058824, 1, 1,
0.3527493, 1.448303, 0.1162984, 0, 0.09803922, 1, 1,
0.3535462, -0.2108987, 2.840812, 0, 0.09411765, 1, 1,
0.3536119, -0.124159, -0.5604774, 0, 0.08627451, 1, 1,
0.3563755, -0.06748746, 2.37067, 0, 0.08235294, 1, 1,
0.3571784, -0.7096657, 3.83352, 0, 0.07450981, 1, 1,
0.3576348, 0.05229211, 1.697291, 0, 0.07058824, 1, 1,
0.3600592, -1.025359, 2.371218, 0, 0.0627451, 1, 1,
0.3609375, 2.055223, 1.099975, 0, 0.05882353, 1, 1,
0.3613494, 0.4475226, -0.1288154, 0, 0.05098039, 1, 1,
0.3615021, 0.7662855, 0.2500912, 0, 0.04705882, 1, 1,
0.3625486, 0.5007997, 1.740153, 0, 0.03921569, 1, 1,
0.3633445, 0.5810065, 0.5182142, 0, 0.03529412, 1, 1,
0.3695991, 2.240206, 1.363923, 0, 0.02745098, 1, 1,
0.3709793, -1.849788, 2.174405, 0, 0.02352941, 1, 1,
0.3764693, -1.983645, 3.306422, 0, 0.01568628, 1, 1,
0.3788768, -0.4127232, 2.745887, 0, 0.01176471, 1, 1,
0.380061, 0.2947671, 3.353047, 0, 0.003921569, 1, 1,
0.3812111, -0.1011607, 3.453624, 0.003921569, 0, 1, 1,
0.3815154, 0.6124868, 1.001415, 0.007843138, 0, 1, 1,
0.3833556, -1.442632, 2.643786, 0.01568628, 0, 1, 1,
0.3838728, 0.02549124, 0.7184731, 0.01960784, 0, 1, 1,
0.3868278, -1.126404, 3.396515, 0.02745098, 0, 1, 1,
0.3876656, 1.144761, 0.7549047, 0.03137255, 0, 1, 1,
0.3910578, 0.1094952, 1.900758, 0.03921569, 0, 1, 1,
0.3917566, 1.227251, -0.849403, 0.04313726, 0, 1, 1,
0.3954201, 0.4428822, 1.125596, 0.05098039, 0, 1, 1,
0.3978579, -0.5636895, 3.232116, 0.05490196, 0, 1, 1,
0.4019673, -0.04295198, 1.109623, 0.0627451, 0, 1, 1,
0.4033567, 0.3228821, -0.8098899, 0.06666667, 0, 1, 1,
0.4158769, 1.061805, 0.3294846, 0.07450981, 0, 1, 1,
0.4165326, -1.26942, 1.024669, 0.07843138, 0, 1, 1,
0.4217212, 1.609801, 0.208554, 0.08627451, 0, 1, 1,
0.430847, 0.2080018, 1.227465, 0.09019608, 0, 1, 1,
0.4328236, -0.4305104, 2.555461, 0.09803922, 0, 1, 1,
0.4362228, 0.2567996, 2.315261, 0.1058824, 0, 1, 1,
0.437061, -0.3622245, 2.720067, 0.1098039, 0, 1, 1,
0.4381347, -0.7842075, 2.025754, 0.1176471, 0, 1, 1,
0.4410039, 0.1830906, 4.213724, 0.1215686, 0, 1, 1,
0.4441523, 1.297366, 0.383091, 0.1294118, 0, 1, 1,
0.4445945, -0.2904098, 1.625873, 0.1333333, 0, 1, 1,
0.4478612, 0.02461814, 0.1844491, 0.1411765, 0, 1, 1,
0.4511501, 0.8260323, 1.133712, 0.145098, 0, 1, 1,
0.4525619, -1.292794, 1.938094, 0.1529412, 0, 1, 1,
0.457109, -0.1882567, 3.709611, 0.1568628, 0, 1, 1,
0.4578679, 0.1120842, 1.269633, 0.1647059, 0, 1, 1,
0.4594953, -1.280136, 2.342373, 0.1686275, 0, 1, 1,
0.4629992, 0.3459525, 1.620649, 0.1764706, 0, 1, 1,
0.4632903, -0.9859613, 1.293675, 0.1803922, 0, 1, 1,
0.4650353, 0.5906758, 0.3586911, 0.1882353, 0, 1, 1,
0.4666857, 0.2204884, 1.970219, 0.1921569, 0, 1, 1,
0.4667348, -0.6744858, 2.483131, 0.2, 0, 1, 1,
0.4696745, -1.315663, 2.256711, 0.2078431, 0, 1, 1,
0.4737156, 1.080796, 2.289211, 0.2117647, 0, 1, 1,
0.4799142, -2.388127, 2.918431, 0.2196078, 0, 1, 1,
0.4802341, -2.253468, 1.579441, 0.2235294, 0, 1, 1,
0.4860345, -0.8908964, 1.639791, 0.2313726, 0, 1, 1,
0.4877028, -1.248939, 2.954454, 0.2352941, 0, 1, 1,
0.492946, 1.03733, -1.349401, 0.2431373, 0, 1, 1,
0.4968596, -0.5393987, 1.474086, 0.2470588, 0, 1, 1,
0.4972266, -0.4222332, 1.802906, 0.254902, 0, 1, 1,
0.4983099, -0.9517139, 2.313282, 0.2588235, 0, 1, 1,
0.4996523, -0.0413738, 1.492453, 0.2666667, 0, 1, 1,
0.5061367, 0.3570577, 1.918582, 0.2705882, 0, 1, 1,
0.5090485, -1.641428, 3.173454, 0.2784314, 0, 1, 1,
0.5128528, 0.4264456, 1.099947, 0.282353, 0, 1, 1,
0.5132236, -0.957366, 3.931936, 0.2901961, 0, 1, 1,
0.5141364, -1.131807, 2.283007, 0.2941177, 0, 1, 1,
0.5163092, -0.4935558, 2.148652, 0.3019608, 0, 1, 1,
0.5201603, -0.2333047, 1.318884, 0.3098039, 0, 1, 1,
0.5206009, -1.35811, 4.480837, 0.3137255, 0, 1, 1,
0.5229193, -1.141901, 0.6911578, 0.3215686, 0, 1, 1,
0.5229206, 2.073344, -0.6210119, 0.3254902, 0, 1, 1,
0.5290406, 0.3921899, 0.1947989, 0.3333333, 0, 1, 1,
0.5299734, -0.07909367, 3.221193, 0.3372549, 0, 1, 1,
0.5302783, -0.9618257, 3.425155, 0.345098, 0, 1, 1,
0.5311334, 1.458082, 0.5820518, 0.3490196, 0, 1, 1,
0.5335636, 1.209948, 1.80999, 0.3568628, 0, 1, 1,
0.5442952, 0.1495618, 1.796795, 0.3607843, 0, 1, 1,
0.5444122, -0.9096373, 2.191099, 0.3686275, 0, 1, 1,
0.5466707, 0.2235357, 2.624171, 0.372549, 0, 1, 1,
0.5563468, 0.1647999, 1.594299, 0.3803922, 0, 1, 1,
0.557072, 0.7147143, 2.359161, 0.3843137, 0, 1, 1,
0.5593989, -0.6308885, 2.816627, 0.3921569, 0, 1, 1,
0.5597303, 0.001402564, 1.899663, 0.3960784, 0, 1, 1,
0.5658228, -0.05487772, 2.947875, 0.4039216, 0, 1, 1,
0.5667442, -1.200082, 2.549474, 0.4117647, 0, 1, 1,
0.5739678, -0.2963368, 1.466104, 0.4156863, 0, 1, 1,
0.5765415, 1.92173, 0.8568172, 0.4235294, 0, 1, 1,
0.5828071, 0.404909, 0.8657222, 0.427451, 0, 1, 1,
0.5864791, 0.740025, 1.031398, 0.4352941, 0, 1, 1,
0.5960587, 0.4544005, 0.9255294, 0.4392157, 0, 1, 1,
0.6043051, -1.357135, 4.145589, 0.4470588, 0, 1, 1,
0.6044703, -1.2909, 2.476711, 0.4509804, 0, 1, 1,
0.6068117, 0.2962487, 0.8020521, 0.4588235, 0, 1, 1,
0.6104375, -0.3226415, 1.666699, 0.4627451, 0, 1, 1,
0.6113359, 0.5979459, 0.8096196, 0.4705882, 0, 1, 1,
0.6246539, 2.183816, -0.3222095, 0.4745098, 0, 1, 1,
0.6264668, -0.925257, 3.049081, 0.4823529, 0, 1, 1,
0.6361812, 1.080573, 0.1583275, 0.4862745, 0, 1, 1,
0.6451085, 0.7025676, -0.04357487, 0.4941176, 0, 1, 1,
0.6460298, -0.890033, 0.1847487, 0.5019608, 0, 1, 1,
0.6464052, -0.2630891, 2.452858, 0.5058824, 0, 1, 1,
0.649471, 0.2533187, 0.4786468, 0.5137255, 0, 1, 1,
0.6536549, -0.3781108, 1.078104, 0.5176471, 0, 1, 1,
0.6585268, -2.343415, 2.180122, 0.5254902, 0, 1, 1,
0.664848, -0.6328242, 0.506688, 0.5294118, 0, 1, 1,
0.6661088, -0.05897011, 1.631198, 0.5372549, 0, 1, 1,
0.6676987, -0.3035808, 2.759587, 0.5411765, 0, 1, 1,
0.6688044, -0.331833, 2.753327, 0.5490196, 0, 1, 1,
0.6798866, -1.029681, 2.640073, 0.5529412, 0, 1, 1,
0.6811622, -1.18657, 1.959986, 0.5607843, 0, 1, 1,
0.683515, 0.9135647, 1.321387, 0.5647059, 0, 1, 1,
0.6842166, 0.5744931, 0.7674742, 0.572549, 0, 1, 1,
0.6845612, -0.01463524, 2.344521, 0.5764706, 0, 1, 1,
0.6973903, 0.6221754, 2.558194, 0.5843138, 0, 1, 1,
0.6974683, 0.4558898, -1.310337, 0.5882353, 0, 1, 1,
0.7045668, -0.3120845, 2.050059, 0.5960785, 0, 1, 1,
0.7048177, -1.164248, 2.309633, 0.6039216, 0, 1, 1,
0.7128338, 0.2102327, 1.936883, 0.6078432, 0, 1, 1,
0.7136024, -0.155784, 1.258337, 0.6156863, 0, 1, 1,
0.7147306, -0.3146739, 3.581292, 0.6196079, 0, 1, 1,
0.716305, 1.942941, 1.742825, 0.627451, 0, 1, 1,
0.7176717, 0.1412498, 1.405358, 0.6313726, 0, 1, 1,
0.7182715, 0.64644, 1.309566, 0.6392157, 0, 1, 1,
0.7213382, -0.9016842, 1.295037, 0.6431373, 0, 1, 1,
0.7237276, 1.463443, -0.7201952, 0.6509804, 0, 1, 1,
0.7242779, -0.4675255, 1.806171, 0.654902, 0, 1, 1,
0.7244934, -0.8204461, 2.725418, 0.6627451, 0, 1, 1,
0.7246041, -1.836061, 3.466079, 0.6666667, 0, 1, 1,
0.7296357, -0.5311191, 3.241732, 0.6745098, 0, 1, 1,
0.7299308, 0.3552935, 0.7766949, 0.6784314, 0, 1, 1,
0.7329801, 0.9625981, -0.37001, 0.6862745, 0, 1, 1,
0.738034, 0.6017317, 0.6733454, 0.6901961, 0, 1, 1,
0.7385248, 0.9348643, 1.907297, 0.6980392, 0, 1, 1,
0.7422822, 0.2816601, 0.2450694, 0.7058824, 0, 1, 1,
0.7436827, -0.9177509, 1.81858, 0.7098039, 0, 1, 1,
0.7440711, 1.747898, 1.641446, 0.7176471, 0, 1, 1,
0.7444069, 0.8015739, 0.7761968, 0.7215686, 0, 1, 1,
0.7630582, 0.09290126, 1.788109, 0.7294118, 0, 1, 1,
0.7642673, -0.62572, 3.357185, 0.7333333, 0, 1, 1,
0.7653561, -0.6540269, 2.992607, 0.7411765, 0, 1, 1,
0.7657985, -0.7437853, 3.964216, 0.7450981, 0, 1, 1,
0.7814025, -0.8183298, 3.261073, 0.7529412, 0, 1, 1,
0.785069, -0.2992573, 2.740742, 0.7568628, 0, 1, 1,
0.7873783, 0.9538391, 0.4230383, 0.7647059, 0, 1, 1,
0.7880002, -0.5438788, 1.523984, 0.7686275, 0, 1, 1,
0.7880747, 0.1819952, 0.4800127, 0.7764706, 0, 1, 1,
0.7922754, -1.088813, 2.812553, 0.7803922, 0, 1, 1,
0.8030239, -0.08249165, 1.7905, 0.7882353, 0, 1, 1,
0.8065606, -0.5240138, 1.839853, 0.7921569, 0, 1, 1,
0.8157323, -0.5006647, 1.921117, 0.8, 0, 1, 1,
0.8173259, -0.6361471, 2.333681, 0.8078431, 0, 1, 1,
0.8189347, -2.494129, 4.124913, 0.8117647, 0, 1, 1,
0.8321196, -0.8427944, 1.218615, 0.8196079, 0, 1, 1,
0.8324259, 0.04376252, -0.6116828, 0.8235294, 0, 1, 1,
0.8361281, 0.06414223, 1.761513, 0.8313726, 0, 1, 1,
0.8491212, -1.320319, 2.286219, 0.8352941, 0, 1, 1,
0.8510266, -1.076189, 2.824832, 0.8431373, 0, 1, 1,
0.852263, 0.9955093, 0.9477562, 0.8470588, 0, 1, 1,
0.8558202, 2.086362, 0.816628, 0.854902, 0, 1, 1,
0.8561215, 0.1323709, 2.003632, 0.8588235, 0, 1, 1,
0.8628331, -0.4805754, 1.762442, 0.8666667, 0, 1, 1,
0.8715908, -0.9057108, 1.33154, 0.8705882, 0, 1, 1,
0.874256, 1.086263, 0.6098536, 0.8784314, 0, 1, 1,
0.8761531, -0.7550072, 1.912954, 0.8823529, 0, 1, 1,
0.8774906, -0.9264473, 1.999309, 0.8901961, 0, 1, 1,
0.8844231, -0.6250604, 1.581971, 0.8941177, 0, 1, 1,
0.8989398, 0.01929012, 2.077931, 0.9019608, 0, 1, 1,
0.9062252, 1.448548, -0.3824303, 0.9098039, 0, 1, 1,
0.9148561, -0.9501234, 1.846299, 0.9137255, 0, 1, 1,
0.9153159, 0.2339779, 1.492999, 0.9215686, 0, 1, 1,
0.9160259, 1.721292, -0.1029009, 0.9254902, 0, 1, 1,
0.9184957, -0.2297308, 0.8431246, 0.9333333, 0, 1, 1,
0.9192608, -2.101137, 1.678636, 0.9372549, 0, 1, 1,
0.9194636, 1.798208, 0.6544341, 0.945098, 0, 1, 1,
0.932158, 0.3924311, 2.454491, 0.9490196, 0, 1, 1,
0.9348488, 0.1358536, 4.326064, 0.9568627, 0, 1, 1,
0.9516231, 0.3153087, 1.824627, 0.9607843, 0, 1, 1,
0.9533914, -0.6725177, 1.859012, 0.9686275, 0, 1, 1,
0.9556673, 0.4559422, 0.9203207, 0.972549, 0, 1, 1,
0.9595601, -0.04197121, 1.12615, 0.9803922, 0, 1, 1,
0.9609364, 0.1249849, 1.405398, 0.9843137, 0, 1, 1,
0.962836, -0.2711132, 1.68555, 0.9921569, 0, 1, 1,
0.9722783, 0.1438007, -0.1591236, 0.9960784, 0, 1, 1,
0.9768624, -1.257507, 3.78318, 1, 0, 0.9960784, 1,
0.9803243, 0.7785661, 1.135577, 1, 0, 0.9882353, 1,
0.9805796, -0.3621163, 2.76459, 1, 0, 0.9843137, 1,
0.981405, -0.7552745, 2.441171, 1, 0, 0.9764706, 1,
0.9828627, -1.611783, 2.741157, 1, 0, 0.972549, 1,
0.9832456, -1.257015, 2.522539, 1, 0, 0.9647059, 1,
0.9950362, -1.150087, 1.101886, 1, 0, 0.9607843, 1,
1.001309, 2.882076, 0.9002453, 1, 0, 0.9529412, 1,
1.002148, 1.480365, -0.1544759, 1, 0, 0.9490196, 1,
1.003315, 0.8547612, 0.04588085, 1, 0, 0.9411765, 1,
1.004983, -1.106381, 2.999263, 1, 0, 0.9372549, 1,
1.009578, -2.506077, 1.264216, 1, 0, 0.9294118, 1,
1.024127, -0.7935093, 1.61311, 1, 0, 0.9254902, 1,
1.028449, -0.1029606, 0.4001896, 1, 0, 0.9176471, 1,
1.038386, 0.7922721, 0.6806483, 1, 0, 0.9137255, 1,
1.039147, -1.065568, 2.541356, 1, 0, 0.9058824, 1,
1.046521, 0.1763828, 1.768798, 1, 0, 0.9019608, 1,
1.046728, 1.092092, -0.7296798, 1, 0, 0.8941177, 1,
1.051646, 1.14873, -0.5923052, 1, 0, 0.8862745, 1,
1.053528, 2.297995, 0.5655091, 1, 0, 0.8823529, 1,
1.054649, 0.3156117, 1.474103, 1, 0, 0.8745098, 1,
1.058842, 0.09236407, 0.7294773, 1, 0, 0.8705882, 1,
1.059189, 0.05053794, 2.215716, 1, 0, 0.8627451, 1,
1.063559, 0.3524305, 1.767152, 1, 0, 0.8588235, 1,
1.06563, -0.07853749, 2.81193, 1, 0, 0.8509804, 1,
1.071334, -0.007622052, 1.745312, 1, 0, 0.8470588, 1,
1.077959, 0.8755382, 1.011235, 1, 0, 0.8392157, 1,
1.078469, 1.049182, -0.6812229, 1, 0, 0.8352941, 1,
1.083401, 0.03436963, 2.687244, 1, 0, 0.827451, 1,
1.084398, 0.6107514, 0.6276969, 1, 0, 0.8235294, 1,
1.097001, 1.51969, 3.684327, 1, 0, 0.8156863, 1,
1.101159, 0.1182901, 2.732071, 1, 0, 0.8117647, 1,
1.106554, -0.04458646, 4.021469, 1, 0, 0.8039216, 1,
1.12145, -0.9217252, 3.629423, 1, 0, 0.7960784, 1,
1.131796, 0.7158027, -0.2613246, 1, 0, 0.7921569, 1,
1.132735, 0.02920692, 2.193504, 1, 0, 0.7843137, 1,
1.134302, 0.004284184, 2.728034, 1, 0, 0.7803922, 1,
1.140862, 0.3294607, 3.24272, 1, 0, 0.772549, 1,
1.145897, 1.207574, 0.4303774, 1, 0, 0.7686275, 1,
1.14663, -0.2038942, 2.51303, 1, 0, 0.7607843, 1,
1.150617, -1.500605, 1.865343, 1, 0, 0.7568628, 1,
1.154003, 0.518019, -0.9962728, 1, 0, 0.7490196, 1,
1.155829, 1.756274, 2.049947, 1, 0, 0.7450981, 1,
1.155844, 1.009719, -0.8147669, 1, 0, 0.7372549, 1,
1.159197, 0.3150047, 0.8627974, 1, 0, 0.7333333, 1,
1.164653, -1.230551, 2.13534, 1, 0, 0.7254902, 1,
1.169673, 0.1413369, 3.052464, 1, 0, 0.7215686, 1,
1.172509, -2.195263, 1.214861, 1, 0, 0.7137255, 1,
1.180962, -1.362931, 2.78288, 1, 0, 0.7098039, 1,
1.183894, 0.2823474, 1.409915, 1, 0, 0.7019608, 1,
1.195301, 0.1326015, 1.787158, 1, 0, 0.6941177, 1,
1.198831, -0.5142362, 1.651868, 1, 0, 0.6901961, 1,
1.204263, -0.02485227, 1.116836, 1, 0, 0.682353, 1,
1.214931, 0.6700521, 1.653317, 1, 0, 0.6784314, 1,
1.227376, -0.7072001, 3.004448, 1, 0, 0.6705883, 1,
1.247304, -0.6321536, 1.898599, 1, 0, 0.6666667, 1,
1.248392, 0.06361503, 1.320673, 1, 0, 0.6588235, 1,
1.250521, 1.732772, 1.245815, 1, 0, 0.654902, 1,
1.2516, -0.3333796, 1.27353, 1, 0, 0.6470588, 1,
1.254215, 0.1392907, 0.4981886, 1, 0, 0.6431373, 1,
1.259381, 1.171542, 0.1389021, 1, 0, 0.6352941, 1,
1.26413, -2.361344, 1.824486, 1, 0, 0.6313726, 1,
1.266574, 1.194019, 0.7818502, 1, 0, 0.6235294, 1,
1.284912, 0.1771063, 1.593832, 1, 0, 0.6196079, 1,
1.289277, -1.917586, 1.578764, 1, 0, 0.6117647, 1,
1.290284, 0.1329147, 3.044436, 1, 0, 0.6078432, 1,
1.292873, -0.7681002, 2.963801, 1, 0, 0.6, 1,
1.296367, 1.46817, 0.6733065, 1, 0, 0.5921569, 1,
1.298503, 0.265943, 2.413926, 1, 0, 0.5882353, 1,
1.299798, 0.3359694, -0.06888214, 1, 0, 0.5803922, 1,
1.31339, -1.619039, 0.6602598, 1, 0, 0.5764706, 1,
1.313841, 1.591621, 0.5491823, 1, 0, 0.5686275, 1,
1.319322, 1.315327, 0.6591266, 1, 0, 0.5647059, 1,
1.329508, -0.667035, 3.285339, 1, 0, 0.5568628, 1,
1.331972, -0.6428519, 3.09361, 1, 0, 0.5529412, 1,
1.338685, -1.361245, 3.183605, 1, 0, 0.5450981, 1,
1.338961, 0.2608198, 1.869636, 1, 0, 0.5411765, 1,
1.346136, 1.388448, -0.6017694, 1, 0, 0.5333334, 1,
1.353639, 0.2294638, 2.076165, 1, 0, 0.5294118, 1,
1.356953, -0.8911484, 1.631468, 1, 0, 0.5215687, 1,
1.369529, -0.5414371, 3.448362, 1, 0, 0.5176471, 1,
1.373181, 1.419677, 0.0446852, 1, 0, 0.509804, 1,
1.373632, -0.5241325, 2.584734, 1, 0, 0.5058824, 1,
1.382338, 0.7165812, 1.35447, 1, 0, 0.4980392, 1,
1.389813, -0.5299051, 1.886936, 1, 0, 0.4901961, 1,
1.410745, -0.1956832, 3.498469, 1, 0, 0.4862745, 1,
1.412279, 0.9893223, 1.151445, 1, 0, 0.4784314, 1,
1.416982, -1.689318, 1.968667, 1, 0, 0.4745098, 1,
1.422525, -0.5834158, 1.440217, 1, 0, 0.4666667, 1,
1.426387, 0.5707219, 0.6595688, 1, 0, 0.4627451, 1,
1.429097, 1.935694, 0.5706804, 1, 0, 0.454902, 1,
1.429572, -0.0484708, 0.5770938, 1, 0, 0.4509804, 1,
1.433887, -0.8299264, 4.028492, 1, 0, 0.4431373, 1,
1.43594, 1.130197, 1.572105, 1, 0, 0.4392157, 1,
1.446409, -1.401388, 3.476759, 1, 0, 0.4313726, 1,
1.449782, 0.2837909, 1.057523, 1, 0, 0.427451, 1,
1.457204, -0.1609785, 0.9670562, 1, 0, 0.4196078, 1,
1.486206, 1.694018, 1.932278, 1, 0, 0.4156863, 1,
1.486317, 1.215006, 0.1679972, 1, 0, 0.4078431, 1,
1.487401, 1.748602, 0.8810937, 1, 0, 0.4039216, 1,
1.489697, -0.5945723, 0.1069365, 1, 0, 0.3960784, 1,
1.502536, 0.4183476, 0.8475116, 1, 0, 0.3882353, 1,
1.509849, -0.5326844, 0.9330021, 1, 0, 0.3843137, 1,
1.509984, -0.3968658, 1.64131, 1, 0, 0.3764706, 1,
1.515885, 0.5663634, -0.7910974, 1, 0, 0.372549, 1,
1.516074, -1.270735, 1.405578, 1, 0, 0.3647059, 1,
1.537931, -0.9164747, 2.764282, 1, 0, 0.3607843, 1,
1.548086, -0.936926, 3.195735, 1, 0, 0.3529412, 1,
1.563441, -0.02307511, 1.650725, 1, 0, 0.3490196, 1,
1.573362, 0.5665413, 1.74777, 1, 0, 0.3411765, 1,
1.576086, -0.8917252, 1.077364, 1, 0, 0.3372549, 1,
1.582211, -0.1252012, 0.557494, 1, 0, 0.3294118, 1,
1.58428, -1.324343, 3.308144, 1, 0, 0.3254902, 1,
1.597159, -0.02110034, 1.668054, 1, 0, 0.3176471, 1,
1.601263, 1.756302, 1.145895, 1, 0, 0.3137255, 1,
1.618641, -1.371383, 3.097011, 1, 0, 0.3058824, 1,
1.622398, -0.05401327, 3.604206, 1, 0, 0.2980392, 1,
1.661166, -2.887243, 2.511189, 1, 0, 0.2941177, 1,
1.663293, 0.6184773, 0.1842885, 1, 0, 0.2862745, 1,
1.665073, 0.1270721, 1.503713, 1, 0, 0.282353, 1,
1.665768, -0.5018864, 2.104805, 1, 0, 0.2745098, 1,
1.705575, 1.04611, -0.1371518, 1, 0, 0.2705882, 1,
1.735994, 0.9058579, 1.254741, 1, 0, 0.2627451, 1,
1.748117, 0.4236417, 0.3104941, 1, 0, 0.2588235, 1,
1.763441, -0.07936038, 1.99747, 1, 0, 0.2509804, 1,
1.764336, 1.838307, 0.6990314, 1, 0, 0.2470588, 1,
1.78045, -0.5613671, 2.073629, 1, 0, 0.2392157, 1,
1.781605, 0.2966791, 1.054894, 1, 0, 0.2352941, 1,
1.783893, -1.126498, 3.138142, 1, 0, 0.227451, 1,
1.784964, -1.664662, 1.75064, 1, 0, 0.2235294, 1,
1.806852, -0.5062867, 1.861592, 1, 0, 0.2156863, 1,
1.813099, -0.8454576, 1.993788, 1, 0, 0.2117647, 1,
1.81563, -0.1914247, 2.24685, 1, 0, 0.2039216, 1,
1.856351, -0.1682471, 1.26908, 1, 0, 0.1960784, 1,
1.887244, 0.1335963, 1.15383, 1, 0, 0.1921569, 1,
1.897583, 0.7862331, 1.9207, 1, 0, 0.1843137, 1,
1.900021, 0.9369856, 1.526024, 1, 0, 0.1803922, 1,
1.900114, 0.3698878, 2.716995, 1, 0, 0.172549, 1,
1.902465, 1.548183, 0.01467107, 1, 0, 0.1686275, 1,
1.907157, 1.336408, 0.2907144, 1, 0, 0.1607843, 1,
1.908859, -0.08754264, 0.265969, 1, 0, 0.1568628, 1,
1.921741, -0.409442, 1.742834, 1, 0, 0.1490196, 1,
1.931729, 2.495152, 0.7125092, 1, 0, 0.145098, 1,
1.932023, 0.3005138, 0.738806, 1, 0, 0.1372549, 1,
1.933755, 0.9372227, 1.896494, 1, 0, 0.1333333, 1,
1.944886, 0.9281924, 1.175657, 1, 0, 0.1254902, 1,
1.960381, -0.4303312, 0.6202011, 1, 0, 0.1215686, 1,
1.974303, -1.525394, 2.506738, 1, 0, 0.1137255, 1,
1.998282, 0.5631298, 0.3366742, 1, 0, 0.1098039, 1,
2.048843, -0.4596204, 2.352668, 1, 0, 0.1019608, 1,
2.054265, 1.178465, 1.761317, 1, 0, 0.09411765, 1,
2.064924, 0.4951515, 0.4768928, 1, 0, 0.09019608, 1,
2.075741, -1.047689, 4.523069, 1, 0, 0.08235294, 1,
2.084801, -1.374603, 1.337394, 1, 0, 0.07843138, 1,
2.105912, -0.6607206, 1.692303, 1, 0, 0.07058824, 1,
2.141547, -0.0722734, 2.374588, 1, 0, 0.06666667, 1,
2.185196, 2.266559, -0.0934881, 1, 0, 0.05882353, 1,
2.189568, 1.318086, 2.986176, 1, 0, 0.05490196, 1,
2.229096, -1.074304, 1.201359, 1, 0, 0.04705882, 1,
2.237806, 0.5505633, 2.1148, 1, 0, 0.04313726, 1,
2.279548, 0.8573855, 2.654906, 1, 0, 0.03529412, 1,
2.434133, 1.098474, 1.335318, 1, 0, 0.03137255, 1,
2.739917, 0.4074506, 2.160003, 1, 0, 0.02352941, 1,
2.76867, -0.8442898, 3.255275, 1, 0, 0.01960784, 1,
3.003672, -0.5303476, 1.129264, 1, 0, 0.01176471, 1,
3.593962, -0.4450454, 3.031702, 1, 0, 0.007843138, 1
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
-0.01081443, -4.013001, -7.473135, 0, -0.5, 0.5, 0.5,
-0.01081443, -4.013001, -7.473135, 1, -0.5, 0.5, 0.5,
-0.01081443, -4.013001, -7.473135, 1, 1.5, 0.5, 0.5,
-0.01081443, -4.013001, -7.473135, 0, 1.5, 0.5, 0.5
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
-4.837611, -0.008048296, -7.473135, 0, -0.5, 0.5, 0.5,
-4.837611, -0.008048296, -7.473135, 1, -0.5, 0.5, 0.5,
-4.837611, -0.008048296, -7.473135, 1, 1.5, 0.5, 0.5,
-4.837611, -0.008048296, -7.473135, 0, 1.5, 0.5, 0.5
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
-4.837611, -4.013001, -0.2733045, 0, -0.5, 0.5, 0.5,
-4.837611, -4.013001, -0.2733045, 1, -0.5, 0.5, 0.5,
-4.837611, -4.013001, -0.2733045, 1, 1.5, 0.5, 0.5,
-4.837611, -4.013001, -0.2733045, 0, 1.5, 0.5, 0.5
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
-2, -3.088781, -5.811635,
2, -3.088781, -5.811635,
-2, -3.088781, -5.811635,
-2, -3.242818, -6.088552,
0, -3.088781, -5.811635,
0, -3.242818, -6.088552,
2, -3.088781, -5.811635,
2, -3.242818, -6.088552
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
-2, -3.550891, -6.642385, 0, -0.5, 0.5, 0.5,
-2, -3.550891, -6.642385, 1, -0.5, 0.5, 0.5,
-2, -3.550891, -6.642385, 1, 1.5, 0.5, 0.5,
-2, -3.550891, -6.642385, 0, 1.5, 0.5, 0.5,
0, -3.550891, -6.642385, 0, -0.5, 0.5, 0.5,
0, -3.550891, -6.642385, 1, -0.5, 0.5, 0.5,
0, -3.550891, -6.642385, 1, 1.5, 0.5, 0.5,
0, -3.550891, -6.642385, 0, 1.5, 0.5, 0.5,
2, -3.550891, -6.642385, 0, -0.5, 0.5, 0.5,
2, -3.550891, -6.642385, 1, -0.5, 0.5, 0.5,
2, -3.550891, -6.642385, 1, 1.5, 0.5, 0.5,
2, -3.550891, -6.642385, 0, 1.5, 0.5, 0.5
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
-3.723735, -2, -5.811635,
-3.723735, 2, -5.811635,
-3.723735, -2, -5.811635,
-3.909381, -2, -6.088552,
-3.723735, -1, -5.811635,
-3.909381, -1, -6.088552,
-3.723735, 0, -5.811635,
-3.909381, 0, -6.088552,
-3.723735, 1, -5.811635,
-3.909381, 1, -6.088552,
-3.723735, 2, -5.811635,
-3.909381, 2, -6.088552
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
-4.280673, -2, -6.642385, 0, -0.5, 0.5, 0.5,
-4.280673, -2, -6.642385, 1, -0.5, 0.5, 0.5,
-4.280673, -2, -6.642385, 1, 1.5, 0.5, 0.5,
-4.280673, -2, -6.642385, 0, 1.5, 0.5, 0.5,
-4.280673, -1, -6.642385, 0, -0.5, 0.5, 0.5,
-4.280673, -1, -6.642385, 1, -0.5, 0.5, 0.5,
-4.280673, -1, -6.642385, 1, 1.5, 0.5, 0.5,
-4.280673, -1, -6.642385, 0, 1.5, 0.5, 0.5,
-4.280673, 0, -6.642385, 0, -0.5, 0.5, 0.5,
-4.280673, 0, -6.642385, 1, -0.5, 0.5, 0.5,
-4.280673, 0, -6.642385, 1, 1.5, 0.5, 0.5,
-4.280673, 0, -6.642385, 0, 1.5, 0.5, 0.5,
-4.280673, 1, -6.642385, 0, -0.5, 0.5, 0.5,
-4.280673, 1, -6.642385, 1, -0.5, 0.5, 0.5,
-4.280673, 1, -6.642385, 1, 1.5, 0.5, 0.5,
-4.280673, 1, -6.642385, 0, 1.5, 0.5, 0.5,
-4.280673, 2, -6.642385, 0, -0.5, 0.5, 0.5,
-4.280673, 2, -6.642385, 1, -0.5, 0.5, 0.5,
-4.280673, 2, -6.642385, 1, 1.5, 0.5, 0.5,
-4.280673, 2, -6.642385, 0, 1.5, 0.5, 0.5
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
-3.723735, -3.088781, -4,
-3.723735, -3.088781, 4,
-3.723735, -3.088781, -4,
-3.909381, -3.242818, -4,
-3.723735, -3.088781, -2,
-3.909381, -3.242818, -2,
-3.723735, -3.088781, 0,
-3.909381, -3.242818, 0,
-3.723735, -3.088781, 2,
-3.909381, -3.242818, 2,
-3.723735, -3.088781, 4,
-3.909381, -3.242818, 4
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
-4.280673, -3.550891, -4, 0, -0.5, 0.5, 0.5,
-4.280673, -3.550891, -4, 1, -0.5, 0.5, 0.5,
-4.280673, -3.550891, -4, 1, 1.5, 0.5, 0.5,
-4.280673, -3.550891, -4, 0, 1.5, 0.5, 0.5,
-4.280673, -3.550891, -2, 0, -0.5, 0.5, 0.5,
-4.280673, -3.550891, -2, 1, -0.5, 0.5, 0.5,
-4.280673, -3.550891, -2, 1, 1.5, 0.5, 0.5,
-4.280673, -3.550891, -2, 0, 1.5, 0.5, 0.5,
-4.280673, -3.550891, 0, 0, -0.5, 0.5, 0.5,
-4.280673, -3.550891, 0, 1, -0.5, 0.5, 0.5,
-4.280673, -3.550891, 0, 1, 1.5, 0.5, 0.5,
-4.280673, -3.550891, 0, 0, 1.5, 0.5, 0.5,
-4.280673, -3.550891, 2, 0, -0.5, 0.5, 0.5,
-4.280673, -3.550891, 2, 1, -0.5, 0.5, 0.5,
-4.280673, -3.550891, 2, 1, 1.5, 0.5, 0.5,
-4.280673, -3.550891, 2, 0, 1.5, 0.5, 0.5,
-4.280673, -3.550891, 4, 0, -0.5, 0.5, 0.5,
-4.280673, -3.550891, 4, 1, -0.5, 0.5, 0.5,
-4.280673, -3.550891, 4, 1, 1.5, 0.5, 0.5,
-4.280673, -3.550891, 4, 0, 1.5, 0.5, 0.5
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
-3.723735, -3.088781, -5.811635,
-3.723735, 3.072685, -5.811635,
-3.723735, -3.088781, 5.265027,
-3.723735, 3.072685, 5.265027,
-3.723735, -3.088781, -5.811635,
-3.723735, -3.088781, 5.265027,
-3.723735, 3.072685, -5.811635,
-3.723735, 3.072685, 5.265027,
-3.723735, -3.088781, -5.811635,
3.702106, -3.088781, -5.811635,
-3.723735, -3.088781, 5.265027,
3.702106, -3.088781, 5.265027,
-3.723735, 3.072685, -5.811635,
3.702106, 3.072685, -5.811635,
-3.723735, 3.072685, 5.265027,
3.702106, 3.072685, 5.265027,
3.702106, -3.088781, -5.811635,
3.702106, 3.072685, -5.811635,
3.702106, -3.088781, 5.265027,
3.702106, 3.072685, 5.265027,
3.702106, -3.088781, -5.811635,
3.702106, -3.088781, 5.265027,
3.702106, 3.072685, -5.811635,
3.702106, 3.072685, 5.265027
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
var radius = 7.844231;
var distance = 34.89987;
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
mvMatrix.translate( 0.01081443, 0.008048296, 0.2733045 );
mvMatrix.scale( 1.142138, 1.376513, 0.7656943 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89987);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
permite<-read.table("permite.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-permite$V2
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
```

```r
y<-permite$V3
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
```

```r
z<-permite$V4
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
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
-3.615591, -0.8951279, -1.682761, 0, 0, 1, 1, 1,
-3.33922, 1.35037, -0.1532045, 1, 0, 0, 1, 1,
-3.212428, -0.2263712, -1.201112, 1, 0, 0, 1, 1,
-3.042439, 1.886628, -0.7055453, 1, 0, 0, 1, 1,
-2.889384, -0.5923239, -1.974613, 1, 0, 0, 1, 1,
-2.792835, 0.3974371, -0.3198625, 1, 0, 0, 1, 1,
-2.709366, 0.7879721, -1.797309, 0, 0, 0, 1, 1,
-2.662803, -0.9095004, -1.431829, 0, 0, 0, 1, 1,
-2.545945, 0.5987592, -1.928814, 0, 0, 0, 1, 1,
-2.482409, -0.8965462, -2.226306, 0, 0, 0, 1, 1,
-2.39236, -0.5090928, -1.243807, 0, 0, 0, 1, 1,
-2.363217, 0.009815883, -0.8279136, 0, 0, 0, 1, 1,
-2.358014, 0.08092561, -2.966417, 0, 0, 0, 1, 1,
-2.196763, 1.546943, -1.018144, 1, 1, 1, 1, 1,
-2.162501, 0.9284385, -1.461363, 1, 1, 1, 1, 1,
-2.147958, 1.004562, 0.6521368, 1, 1, 1, 1, 1,
-2.082382, -0.9877508, -1.050174, 1, 1, 1, 1, 1,
-2.043279, -0.4868899, -1.657642, 1, 1, 1, 1, 1,
-2.04094, 1.806066, -1.837372, 1, 1, 1, 1, 1,
-2.025435, 1.282321, -2.710582, 1, 1, 1, 1, 1,
-1.999398, -0.6000212, -2.391969, 1, 1, 1, 1, 1,
-1.983594, -0.9356027, -0.7135279, 1, 1, 1, 1, 1,
-1.958848, 0.003796378, 0.8428804, 1, 1, 1, 1, 1,
-1.952686, -1.3136, -3.259077, 1, 1, 1, 1, 1,
-1.940869, 0.9006215, -1.092697, 1, 1, 1, 1, 1,
-1.923846, -1.111295, -3.592924, 1, 1, 1, 1, 1,
-1.921836, -0.5313119, -2.113453, 1, 1, 1, 1, 1,
-1.921764, -0.4647375, -0.4287612, 1, 1, 1, 1, 1,
-1.921383, -0.7225668, -4.277789, 0, 0, 1, 1, 1,
-1.907368, 1.402459, -1.875586, 1, 0, 0, 1, 1,
-1.877582, -0.6021114, -2.24773, 1, 0, 0, 1, 1,
-1.852412, -1.6308, -3.140141, 1, 0, 0, 1, 1,
-1.844783, 1.430596, 1.346179, 1, 0, 0, 1, 1,
-1.821241, 0.5539455, -0.2365311, 1, 0, 0, 1, 1,
-1.814456, -0.09022529, -2.304895, 0, 0, 0, 1, 1,
-1.803937, 1.06894, -1.775121, 0, 0, 0, 1, 1,
-1.79981, -0.1049352, -0.294037, 0, 0, 0, 1, 1,
-1.770903, -1.024221, -1.831877, 0, 0, 0, 1, 1,
-1.75787, -1.041902, -2.473707, 0, 0, 0, 1, 1,
-1.755694, 0.6585704, -0.6794068, 0, 0, 0, 1, 1,
-1.751246, 1.487508, 1.123527, 0, 0, 0, 1, 1,
-1.750368, -0.4253216, -1.103198, 1, 1, 1, 1, 1,
-1.747932, 0.8857462, -1.417922, 1, 1, 1, 1, 1,
-1.742638, 0.4981354, -1.584828, 1, 1, 1, 1, 1,
-1.735732, 1.788372, -1.239809, 1, 1, 1, 1, 1,
-1.730903, 0.1867442, -1.28433, 1, 1, 1, 1, 1,
-1.724084, -1.460798, -2.679685, 1, 1, 1, 1, 1,
-1.667364, 0.08925298, -0.9172826, 1, 1, 1, 1, 1,
-1.665525, 0.03727536, -1.629028, 1, 1, 1, 1, 1,
-1.659108, -0.05584268, -2.754272, 1, 1, 1, 1, 1,
-1.659084, 0.4877259, -1.633517, 1, 1, 1, 1, 1,
-1.650533, -1.145798, -3.383579, 1, 1, 1, 1, 1,
-1.642624, 0.2318874, 1.025347, 1, 1, 1, 1, 1,
-1.633211, 1.354317, 0.7429324, 1, 1, 1, 1, 1,
-1.62744, -0.4935956, -1.101251, 1, 1, 1, 1, 1,
-1.623383, 0.02877104, -2.611535, 1, 1, 1, 1, 1,
-1.608406, 1.181536, 0.1848357, 0, 0, 1, 1, 1,
-1.602114, -0.9971045, -1.461893, 1, 0, 0, 1, 1,
-1.59533, 0.3321768, -0.6516358, 1, 0, 0, 1, 1,
-1.58874, -0.280907, -2.634612, 1, 0, 0, 1, 1,
-1.585973, -0.7454523, -2.1854, 1, 0, 0, 1, 1,
-1.581206, 0.3775065, 1.328513, 1, 0, 0, 1, 1,
-1.541867, 0.01830759, -1.490413, 0, 0, 0, 1, 1,
-1.536092, 0.1184012, -1.066819, 0, 0, 0, 1, 1,
-1.53153, 1.167141, -0.09952296, 0, 0, 0, 1, 1,
-1.519516, -0.1916941, -2.731981, 0, 0, 0, 1, 1,
-1.511244, 1.271932, -0.9489762, 0, 0, 0, 1, 1,
-1.50035, 0.08629882, 0.5255811, 0, 0, 0, 1, 1,
-1.484972, 0.3995999, -0.2940424, 0, 0, 0, 1, 1,
-1.47993, -0.3892018, -3.481663, 1, 1, 1, 1, 1,
-1.466291, 0.6528193, 0.3121051, 1, 1, 1, 1, 1,
-1.462722, -1.413822, -2.370933, 1, 1, 1, 1, 1,
-1.457328, 0.346613, -0.8511452, 1, 1, 1, 1, 1,
-1.451014, -1.950274, -3.218538, 1, 1, 1, 1, 1,
-1.446264, 0.5342626, -1.84578, 1, 1, 1, 1, 1,
-1.442943, -1.327886, -2.335329, 1, 1, 1, 1, 1,
-1.433644, 1.349932, -1.091715, 1, 1, 1, 1, 1,
-1.426937, -1.358418, -3.547385, 1, 1, 1, 1, 1,
-1.419395, -0.8766978, -1.340248, 1, 1, 1, 1, 1,
-1.418667, -0.09758462, -1.168633, 1, 1, 1, 1, 1,
-1.402406, 0.3691951, -0.7252176, 1, 1, 1, 1, 1,
-1.398878, -1.082794, -2.642637, 1, 1, 1, 1, 1,
-1.386424, 0.040835, 0.1933054, 1, 1, 1, 1, 1,
-1.384114, -0.4693515, -1.641884, 1, 1, 1, 1, 1,
-1.381218, 0.9465172, -0.4250218, 0, 0, 1, 1, 1,
-1.38015, 1.697546, 0.814033, 1, 0, 0, 1, 1,
-1.378942, -0.1113801, -1.217642, 1, 0, 0, 1, 1,
-1.37413, -0.167008, -1.398205, 1, 0, 0, 1, 1,
-1.37339, 1.194344, 1.110655, 1, 0, 0, 1, 1,
-1.372365, -0.5896249, -3.289499, 1, 0, 0, 1, 1,
-1.364954, 0.09160657, -1.030459, 0, 0, 0, 1, 1,
-1.364057, -1.240861, -3.123445, 0, 0, 0, 1, 1,
-1.351447, -0.1941874, -3.767146, 0, 0, 0, 1, 1,
-1.346109, -0.1453703, -1.935585, 0, 0, 0, 1, 1,
-1.29971, -1.695227, -1.840225, 0, 0, 0, 1, 1,
-1.290969, 0.06552605, -1.042513, 0, 0, 0, 1, 1,
-1.289878, 0.4711065, -2.410706, 0, 0, 0, 1, 1,
-1.289138, 0.9218188, -0.6561359, 1, 1, 1, 1, 1,
-1.285443, 1.869712, -0.4405967, 1, 1, 1, 1, 1,
-1.284582, 0.4910088, -1.566825, 1, 1, 1, 1, 1,
-1.283806, -1.589154, -3.950811, 1, 1, 1, 1, 1,
-1.269918, 0.6512676, -1.164252, 1, 1, 1, 1, 1,
-1.269859, -0.6083337, -1.994355, 1, 1, 1, 1, 1,
-1.266222, -1.610477, -0.8173769, 1, 1, 1, 1, 1,
-1.260572, -0.04179464, -0.7057539, 1, 1, 1, 1, 1,
-1.244155, 0.3904255, -1.678739, 1, 1, 1, 1, 1,
-1.239791, 1.29948, -0.3150631, 1, 1, 1, 1, 1,
-1.232877, 0.7333551, -1.64694, 1, 1, 1, 1, 1,
-1.226947, -0.7782086, -1.733073, 1, 1, 1, 1, 1,
-1.225064, 1.48659, 0.3355322, 1, 1, 1, 1, 1,
-1.221625, 0.6693131, -0.8234872, 1, 1, 1, 1, 1,
-1.217719, -0.5978165, -2.179714, 1, 1, 1, 1, 1,
-1.210064, -0.02070306, -0.9741527, 0, 0, 1, 1, 1,
-1.209282, -0.848167, -3.218599, 1, 0, 0, 1, 1,
-1.201678, 0.1465575, -4.072764, 1, 0, 0, 1, 1,
-1.198903, -1.419706, -2.65221, 1, 0, 0, 1, 1,
-1.197612, -0.7422419, -1.080737, 1, 0, 0, 1, 1,
-1.190662, 0.4753362, -2.418346, 1, 0, 0, 1, 1,
-1.180491, 0.336247, -1.404481, 0, 0, 0, 1, 1,
-1.17774, -0.8195046, -1.237697, 0, 0, 0, 1, 1,
-1.175717, 0.7946116, 0.4890505, 0, 0, 0, 1, 1,
-1.173409, 1.262551, 1.072845, 0, 0, 0, 1, 1,
-1.166321, 0.2297249, -1.099377, 0, 0, 0, 1, 1,
-1.163465, 1.123142, -0.04301038, 0, 0, 0, 1, 1,
-1.142208, -0.6026608, -1.38666, 0, 0, 0, 1, 1,
-1.137428, 1.015079, -1.820247, 1, 1, 1, 1, 1,
-1.137071, 0.5525321, -2.932213, 1, 1, 1, 1, 1,
-1.126471, -0.5663176, -3.014038, 1, 1, 1, 1, 1,
-1.126242, 0.01655846, -2.020394, 1, 1, 1, 1, 1,
-1.110668, 0.354566, -1.817337, 1, 1, 1, 1, 1,
-1.109475, 1.172001, -0.9223853, 1, 1, 1, 1, 1,
-1.108641, -0.3553434, -2.645997, 1, 1, 1, 1, 1,
-1.104808, 0.7892742, -0.6760707, 1, 1, 1, 1, 1,
-1.101797, -1.601677, -2.065371, 1, 1, 1, 1, 1,
-1.100658, -1.093316, -3.552307, 1, 1, 1, 1, 1,
-1.09307, -0.9077203, -3.971307, 1, 1, 1, 1, 1,
-1.090453, -0.00101267, -1.814861, 1, 1, 1, 1, 1,
-1.075219, -0.7584985, -1.876275, 1, 1, 1, 1, 1,
-1.073363, -1.098822, -0.9917325, 1, 1, 1, 1, 1,
-1.057058, 0.6939636, -0.5664692, 1, 1, 1, 1, 1,
-1.056964, -1.002256, -1.535549, 0, 0, 1, 1, 1,
-1.049916, 0.1548152, -1.541038, 1, 0, 0, 1, 1,
-1.042379, -2.214485, -2.160051, 1, 0, 0, 1, 1,
-1.038594, 0.4373789, -1.991516, 1, 0, 0, 1, 1,
-1.034179, -0.5935792, -1.924823, 1, 0, 0, 1, 1,
-1.033778, -0.5094945, -2.819943, 1, 0, 0, 1, 1,
-1.030371, -0.6626695, -1.784485, 0, 0, 0, 1, 1,
-1.02617, 0.7917406, -2.147786, 0, 0, 0, 1, 1,
-1.024202, 0.1550137, -2.189263, 0, 0, 0, 1, 1,
-1.022644, 0.7740148, 0.7209231, 0, 0, 0, 1, 1,
-1.012513, -0.9094414, -2.264154, 0, 0, 0, 1, 1,
-1.008503, 0.03061379, -1.085604, 0, 0, 0, 1, 1,
-1.005664, 0.0398165, -1.019246, 0, 0, 0, 1, 1,
-1.000098, 0.009488926, -1.459871, 1, 1, 1, 1, 1,
-0.9961803, 0.4935527, -0.7325112, 1, 1, 1, 1, 1,
-0.9904889, 0.5097558, -1.357771, 1, 1, 1, 1, 1,
-0.9856905, 0.2469678, -2.640197, 1, 1, 1, 1, 1,
-0.9849722, -2.201908, -4.061391, 1, 1, 1, 1, 1,
-0.9743001, -0.5949138, -1.532372, 1, 1, 1, 1, 1,
-0.9715436, -0.1702275, -1.395003, 1, 1, 1, 1, 1,
-0.9693466, -2.553053, -3.405707, 1, 1, 1, 1, 1,
-0.9681858, -0.3384231, -1.108214, 1, 1, 1, 1, 1,
-0.9587696, -0.4370028, -2.283715, 1, 1, 1, 1, 1,
-0.950689, -1.255167, -3.261406, 1, 1, 1, 1, 1,
-0.9486052, 1.844185, -1.178442, 1, 1, 1, 1, 1,
-0.9456519, 0.3320107, -1.481299, 1, 1, 1, 1, 1,
-0.9425916, -0.8319883, -1.458603, 1, 1, 1, 1, 1,
-0.9412833, 0.08641983, -2.540004, 1, 1, 1, 1, 1,
-0.9395783, -0.6832449, -1.954677, 0, 0, 1, 1, 1,
-0.9390305, -0.394807, -2.571417, 1, 0, 0, 1, 1,
-0.9340388, 0.5926788, 0.03531696, 1, 0, 0, 1, 1,
-0.9328594, -1.892485, -3.643118, 1, 0, 0, 1, 1,
-0.9323649, 0.1167007, -1.452018, 1, 0, 0, 1, 1,
-0.9204542, 0.5585576, -1.50016, 1, 0, 0, 1, 1,
-0.9159958, -0.6198969, -0.7823735, 0, 0, 0, 1, 1,
-0.9159802, 2.414343, -0.1537017, 0, 0, 0, 1, 1,
-0.9154097, 0.2806822, -1.218233, 0, 0, 0, 1, 1,
-0.9108084, -0.1371702, -0.2019885, 0, 0, 0, 1, 1,
-0.9029073, -0.4896188, -0.1257949, 0, 0, 0, 1, 1,
-0.9019161, 2.246823, -0.1216989, 0, 0, 0, 1, 1,
-0.8997318, 0.8720487, -0.3272106, 0, 0, 0, 1, 1,
-0.8948742, 0.1420605, -2.389619, 1, 1, 1, 1, 1,
-0.8859376, -0.8604707, -2.548455, 1, 1, 1, 1, 1,
-0.8786208, -0.3903564, -2.517099, 1, 1, 1, 1, 1,
-0.8734072, -0.4816026, -1.885312, 1, 1, 1, 1, 1,
-0.866205, -0.5723205, -1.755423, 1, 1, 1, 1, 1,
-0.8639023, 0.4566073, -1.418875, 1, 1, 1, 1, 1,
-0.8609903, 0.1044815, -1.624134, 1, 1, 1, 1, 1,
-0.8595647, 0.8974002, -1.853343, 1, 1, 1, 1, 1,
-0.8595553, -0.5239252, -1.231919, 1, 1, 1, 1, 1,
-0.8553135, -1.35107, -3.978467, 1, 1, 1, 1, 1,
-0.8498952, 0.6974363, 0.69263, 1, 1, 1, 1, 1,
-0.8488848, 0.09866016, -0.500057, 1, 1, 1, 1, 1,
-0.8477895, -1.396021, -2.452604, 1, 1, 1, 1, 1,
-0.8460056, -0.7926291, -1.132994, 1, 1, 1, 1, 1,
-0.845829, -0.1484907, -1.145368, 1, 1, 1, 1, 1,
-0.8409588, 1.30484, -0.3107894, 0, 0, 1, 1, 1,
-0.83805, 0.08849616, -1.790636, 1, 0, 0, 1, 1,
-0.8317011, -1.440522, -2.799137, 1, 0, 0, 1, 1,
-0.8312129, 1.17527, -0.1526714, 1, 0, 0, 1, 1,
-0.8293279, -0.9709694, -1.665471, 1, 0, 0, 1, 1,
-0.8255598, 2.470811, -0.7551189, 1, 0, 0, 1, 1,
-0.8246778, 0.6469087, -0.5125887, 0, 0, 0, 1, 1,
-0.8243149, -0.4632369, -1.967871, 0, 0, 0, 1, 1,
-0.8194513, -0.2672306, -2.836283, 0, 0, 0, 1, 1,
-0.8121166, -1.77837, -2.365233, 0, 0, 0, 1, 1,
-0.8054023, -2.305328, -2.890268, 0, 0, 0, 1, 1,
-0.7918361, 0.4941325, -0.01704982, 0, 0, 0, 1, 1,
-0.7820484, 1.79797, 0.6314084, 0, 0, 0, 1, 1,
-0.7708178, -1.204147, -2.11659, 1, 1, 1, 1, 1,
-0.7628755, -0.6821122, -0.8375703, 1, 1, 1, 1, 1,
-0.760381, 0.4939764, -0.1462297, 1, 1, 1, 1, 1,
-0.7575148, 2.511258, -2.143598, 1, 1, 1, 1, 1,
-0.750635, 0.04401369, -2.297275, 1, 1, 1, 1, 1,
-0.7499571, 0.6228569, -0.1699721, 1, 1, 1, 1, 1,
-0.746303, -1.246481, -3.812916, 1, 1, 1, 1, 1,
-0.743704, -1.671474, -3.197206, 1, 1, 1, 1, 1,
-0.7428992, -0.4412417, -2.417337, 1, 1, 1, 1, 1,
-0.7415262, -0.6093821, -0.4788955, 1, 1, 1, 1, 1,
-0.7374375, 0.9760904, 0.3841955, 1, 1, 1, 1, 1,
-0.7367846, -0.2071828, -0.3410297, 1, 1, 1, 1, 1,
-0.7354002, -0.9445667, -0.9187589, 1, 1, 1, 1, 1,
-0.732925, 0.9067056, 0.580038, 1, 1, 1, 1, 1,
-0.7324909, 0.07632921, -0.4884078, 1, 1, 1, 1, 1,
-0.7238587, 0.452952, 0.001432286, 0, 0, 1, 1, 1,
-0.723092, 0.4136108, -0.32022, 1, 0, 0, 1, 1,
-0.7227713, 0.2733551, -0.7910177, 1, 0, 0, 1, 1,
-0.7224386, 0.5082284, -1.226534, 1, 0, 0, 1, 1,
-0.7223369, -0.5871182, -3.372364, 1, 0, 0, 1, 1,
-0.7219152, 1.042845, 0.1647676, 1, 0, 0, 1, 1,
-0.7190692, -0.5557554, -2.763221, 0, 0, 0, 1, 1,
-0.7188266, 0.6672891, -1.659728, 0, 0, 0, 1, 1,
-0.7176438, -0.5794718, -5.650325, 0, 0, 0, 1, 1,
-0.7151302, -1.038237, -1.236272, 0, 0, 0, 1, 1,
-0.7101315, -1.44064, -1.664514, 0, 0, 0, 1, 1,
-0.7045192, 0.6449871, -2.116069, 0, 0, 0, 1, 1,
-0.6930017, -0.5661134, -2.087276, 0, 0, 0, 1, 1,
-0.69087, -0.3046467, -4.775744, 1, 1, 1, 1, 1,
-0.6818126, 0.4314634, -1.105978, 1, 1, 1, 1, 1,
-0.6767304, -1.754904, -3.40189, 1, 1, 1, 1, 1,
-0.6724028, -0.01609775, -0.3138544, 1, 1, 1, 1, 1,
-0.6713256, -0.4491228, -3.277812, 1, 1, 1, 1, 1,
-0.6660332, 0.000579256, -1.340026, 1, 1, 1, 1, 1,
-0.6641103, 1.237513, 0.8788505, 1, 1, 1, 1, 1,
-0.6609195, -0.426056, -1.477802, 1, 1, 1, 1, 1,
-0.6498544, -0.8201769, -1.093506, 1, 1, 1, 1, 1,
-0.6495361, -1.389245, -1.807136, 1, 1, 1, 1, 1,
-0.6462926, 0.8671032, -1.392706, 1, 1, 1, 1, 1,
-0.6461321, 1.045222, 0.8481337, 1, 1, 1, 1, 1,
-0.6423563, 0.354844, -0.8377051, 1, 1, 1, 1, 1,
-0.6413131, 0.8712232, -0.3375866, 1, 1, 1, 1, 1,
-0.6381445, 2.717109, 0.7528443, 1, 1, 1, 1, 1,
-0.6356676, 0.828843, -0.2052247, 0, 0, 1, 1, 1,
-0.628205, -1.399831, -2.4472, 1, 0, 0, 1, 1,
-0.6261339, -0.05038317, -3.155831, 1, 0, 0, 1, 1,
-0.6201734, 1.325814, 0.4702366, 1, 0, 0, 1, 1,
-0.6154602, -1.035483, -2.225485, 1, 0, 0, 1, 1,
-0.6127148, 1.241192, -2.270063, 1, 0, 0, 1, 1,
-0.6079531, -1.350984, -0.736079, 0, 0, 0, 1, 1,
-0.6074246, -1.020602, -2.261611, 0, 0, 0, 1, 1,
-0.6065908, 0.3862731, -1.111041, 0, 0, 0, 1, 1,
-0.5864453, 0.2919905, -2.498549, 0, 0, 0, 1, 1,
-0.5807078, -0.5133162, -2.238436, 0, 0, 0, 1, 1,
-0.579092, 0.6348311, -1.880406, 0, 0, 0, 1, 1,
-0.5774311, -0.5153725, -1.440075, 0, 0, 0, 1, 1,
-0.5750972, 1.215086, -0.02102502, 1, 1, 1, 1, 1,
-0.5747357, -0.4342722, -1.272083, 1, 1, 1, 1, 1,
-0.5699241, 0.3215039, -1.699695, 1, 1, 1, 1, 1,
-0.5681948, -0.2482894, -2.710334, 1, 1, 1, 1, 1,
-0.5668219, -1.435197, -3.590848, 1, 1, 1, 1, 1,
-0.5655733, 0.1315315, -1.035904, 1, 1, 1, 1, 1,
-0.5655546, -0.03746958, -2.655706, 1, 1, 1, 1, 1,
-0.5629691, -0.9301666, -4.111385, 1, 1, 1, 1, 1,
-0.5619228, -0.5552016, -2.397512, 1, 1, 1, 1, 1,
-0.5593449, -1.228251, -2.493169, 1, 1, 1, 1, 1,
-0.5582339, -0.6009802, -3.734972, 1, 1, 1, 1, 1,
-0.5547204, 0.6076458, -1.212438, 1, 1, 1, 1, 1,
-0.554692, 1.12986, -1.09754, 1, 1, 1, 1, 1,
-0.5541737, 1.670176, 0.9732814, 1, 1, 1, 1, 1,
-0.5533862, -0.1602011, -1.2454, 1, 1, 1, 1, 1,
-0.548987, 0.30562, -0.5925201, 0, 0, 1, 1, 1,
-0.5481777, -1.439284, -1.982669, 1, 0, 0, 1, 1,
-0.5467103, 2.254542, -1.114852, 1, 0, 0, 1, 1,
-0.5460858, 0.02232661, -1.979611, 1, 0, 0, 1, 1,
-0.5451238, 0.1050702, -1.269366, 1, 0, 0, 1, 1,
-0.5423084, -1.445399, -2.504873, 1, 0, 0, 1, 1,
-0.541247, -1.188663, -3.779294, 0, 0, 0, 1, 1,
-0.5371647, -0.7208524, -1.718833, 0, 0, 0, 1, 1,
-0.5330079, -0.1935241, -1.719733, 0, 0, 0, 1, 1,
-0.532777, -1.20925, -2.269021, 0, 0, 0, 1, 1,
-0.5229903, -0.6014211, -1.822797, 0, 0, 0, 1, 1,
-0.5221687, -1.433378, -2.883126, 0, 0, 0, 1, 1,
-0.5187336, 0.5800391, -0.09006513, 0, 0, 0, 1, 1,
-0.5116827, -1.904542, -0.852231, 1, 1, 1, 1, 1,
-0.5077533, 0.01564456, -3.530384, 1, 1, 1, 1, 1,
-0.5049819, -2.415937, -3.979808, 1, 1, 1, 1, 1,
-0.5046853, 1.434719, -0.4190586, 1, 1, 1, 1, 1,
-0.5003827, 0.1654758, -1.8387, 1, 1, 1, 1, 1,
-0.4985892, -0.422579, -1.698478, 1, 1, 1, 1, 1,
-0.498492, -0.2448216, -1.572718, 1, 1, 1, 1, 1,
-0.4964831, -0.3390408, -1.272256, 1, 1, 1, 1, 1,
-0.4959615, 0.680756, 1.434105, 1, 1, 1, 1, 1,
-0.4957666, -0.7321289, -2.897036, 1, 1, 1, 1, 1,
-0.4930814, -0.02341279, -1.875312, 1, 1, 1, 1, 1,
-0.4917349, 0.3899309, -0.6446988, 1, 1, 1, 1, 1,
-0.491325, -0.006905396, -1.760561, 1, 1, 1, 1, 1,
-0.4906447, 1.537071, 0.7990674, 1, 1, 1, 1, 1,
-0.4901239, 0.6610364, -2.187631, 1, 1, 1, 1, 1,
-0.4850941, -0.6205991, -2.549082, 0, 0, 1, 1, 1,
-0.4813876, 0.959031, 0.04429831, 1, 0, 0, 1, 1,
-0.4741787, 2.529361, 0.6054322, 1, 0, 0, 1, 1,
-0.4713205, 1.915146, 0.5388169, 1, 0, 0, 1, 1,
-0.4713177, -0.2726611, -0.2950453, 1, 0, 0, 1, 1,
-0.4627829, 0.6871168, -0.6519945, 1, 0, 0, 1, 1,
-0.4607576, 0.02955655, -2.99293, 0, 0, 0, 1, 1,
-0.4603851, -0.7699644, -1.374094, 0, 0, 0, 1, 1,
-0.4586118, 1.204676, -0.3447272, 0, 0, 0, 1, 1,
-0.4556528, -1.873103, -2.404329, 0, 0, 0, 1, 1,
-0.4543152, -0.4780869, -1.547909, 0, 0, 0, 1, 1,
-0.4538857, -0.1169091, -1.399575, 0, 0, 0, 1, 1,
-0.4518935, -0.7432523, -2.668215, 0, 0, 0, 1, 1,
-0.4502129, 1.165251, -2.779483, 1, 1, 1, 1, 1,
-0.4473274, -1.823498, -1.064688, 1, 1, 1, 1, 1,
-0.4470639, 0.8542186, 0.222097, 1, 1, 1, 1, 1,
-0.4420538, -0.164964, -2.310999, 1, 1, 1, 1, 1,
-0.4361319, -0.3316346, -2.700367, 1, 1, 1, 1, 1,
-0.4356038, 0.7876831, -2.249592, 1, 1, 1, 1, 1,
-0.4342702, 0.05812009, -2.544782, 1, 1, 1, 1, 1,
-0.4317979, -0.592553, -1.905059, 1, 1, 1, 1, 1,
-0.4317245, -0.3519595, -1.170438, 1, 1, 1, 1, 1,
-0.427218, -1.283939, -4.288666, 1, 1, 1, 1, 1,
-0.427036, 0.2365591, 0.04991337, 1, 1, 1, 1, 1,
-0.4235246, 1.390383, -0.0863181, 1, 1, 1, 1, 1,
-0.4215557, 0.08994658, -1.787788, 1, 1, 1, 1, 1,
-0.4195236, -0.8702999, -3.345397, 1, 1, 1, 1, 1,
-0.4170748, 0.4249736, -1.241486, 1, 1, 1, 1, 1,
-0.412461, -0.2732232, -1.116517, 0, 0, 1, 1, 1,
-0.411372, -1.103617, -1.617148, 1, 0, 0, 1, 1,
-0.4099664, 0.4661227, -0.5611581, 1, 0, 0, 1, 1,
-0.4087727, 0.8079373, -0.804785, 1, 0, 0, 1, 1,
-0.4083439, -0.02077426, -0.9661126, 1, 0, 0, 1, 1,
-0.4053453, 0.02785481, -2.059917, 1, 0, 0, 1, 1,
-0.4030796, 0.5064902, -0.818733, 0, 0, 0, 1, 1,
-0.3995212, -0.1013351, -0.1773974, 0, 0, 0, 1, 1,
-0.3916319, -0.721256, -2.038646, 0, 0, 0, 1, 1,
-0.3894645, -0.2464231, -1.351776, 0, 0, 0, 1, 1,
-0.3885263, -0.7657593, -2.182919, 0, 0, 0, 1, 1,
-0.3865995, 0.6325806, -1.362658, 0, 0, 0, 1, 1,
-0.3828453, 0.945854, 1.339022, 0, 0, 0, 1, 1,
-0.3824773, -0.9663607, -2.712752, 1, 1, 1, 1, 1,
-0.3799867, 0.02532406, -1.524041, 1, 1, 1, 1, 1,
-0.3758794, 0.143139, -0.1899334, 1, 1, 1, 1, 1,
-0.3724858, 1.063077, 0.09165012, 1, 1, 1, 1, 1,
-0.3709721, 0.4247946, -0.9335295, 1, 1, 1, 1, 1,
-0.3683951, 1.313032, 0.7339108, 1, 1, 1, 1, 1,
-0.3675486, -2.732098, -4.88777, 1, 1, 1, 1, 1,
-0.3663895, -1.509205, -1.692344, 1, 1, 1, 1, 1,
-0.3657484, 0.05956202, -2.693375, 1, 1, 1, 1, 1,
-0.3547354, -0.9594516, -3.081141, 1, 1, 1, 1, 1,
-0.3546731, 0.6131989, -1.623349, 1, 1, 1, 1, 1,
-0.3544456, -2.148566, -4.216548, 1, 1, 1, 1, 1,
-0.353962, 0.9072335, 0.284501, 1, 1, 1, 1, 1,
-0.3479353, 2.695212, -1.083155, 1, 1, 1, 1, 1,
-0.3473005, 0.3625125, -0.7053874, 1, 1, 1, 1, 1,
-0.3421684, 1.380933, -0.626112, 0, 0, 1, 1, 1,
-0.3365479, -0.4497617, -2.504973, 1, 0, 0, 1, 1,
-0.335527, 0.8013654, -0.3592694, 1, 0, 0, 1, 1,
-0.3344332, -0.4507081, -3.4643, 1, 0, 0, 1, 1,
-0.3341424, -1.305859, -2.589351, 1, 0, 0, 1, 1,
-0.3341068, -2.043593, -3.653267, 1, 0, 0, 1, 1,
-0.3314506, -1.373523, -3.543907, 0, 0, 0, 1, 1,
-0.3296308, -1.24722, -2.575913, 0, 0, 0, 1, 1,
-0.3270476, 0.0918676, -1.781562, 0, 0, 0, 1, 1,
-0.3252971, 0.2177357, -0.137423, 0, 0, 0, 1, 1,
-0.3176056, -1.329283, -3.249148, 0, 0, 0, 1, 1,
-0.2964317, 1.290108, 0.7526239, 0, 0, 0, 1, 1,
-0.2938912, 0.5881956, -1.414131, 0, 0, 0, 1, 1,
-0.2917022, -1.213122, -0.8020034, 1, 1, 1, 1, 1,
-0.2914769, 0.2268672, -0.8387514, 1, 1, 1, 1, 1,
-0.2816642, -2.704269, -4.240278, 1, 1, 1, 1, 1,
-0.2797636, 2.290736, -1.60599, 1, 1, 1, 1, 1,
-0.276117, -1.221168, -3.257008, 1, 1, 1, 1, 1,
-0.2752199, 1.214024, -1.671866, 1, 1, 1, 1, 1,
-0.2737973, -0.7917143, -1.148922, 1, 1, 1, 1, 1,
-0.2714657, 0.2069439, -0.5798559, 1, 1, 1, 1, 1,
-0.2666243, 0.7939405, 0.4103775, 1, 1, 1, 1, 1,
-0.2636513, 1.174646, 1.198687, 1, 1, 1, 1, 1,
-0.2632444, 1.466592, 1.605793, 1, 1, 1, 1, 1,
-0.2581763, 1.059432, -0.5573872, 1, 1, 1, 1, 1,
-0.2565447, 0.4966515, -0.6438699, 1, 1, 1, 1, 1,
-0.2551295, 1.031004, -0.684202, 1, 1, 1, 1, 1,
-0.2523041, 1.141189, 0.02649636, 1, 1, 1, 1, 1,
-0.2522596, -0.6258255, -2.0292, 0, 0, 1, 1, 1,
-0.2521704, 1.848172, 0.3385881, 1, 0, 0, 1, 1,
-0.2514313, -0.3653712, -2.151951, 1, 0, 0, 1, 1,
-0.2473913, -0.8830851, -3.656925, 1, 0, 0, 1, 1,
-0.2466757, 0.625834, 0.5887995, 1, 0, 0, 1, 1,
-0.240977, 1.093162, -1.157956, 1, 0, 0, 1, 1,
-0.2393146, -0.05898682, -1.421489, 0, 0, 0, 1, 1,
-0.2384785, 1.05831, -0.399758, 0, 0, 0, 1, 1,
-0.2373828, -1.456635, -3.816055, 0, 0, 0, 1, 1,
-0.2362626, -1.241249, -3.240622, 0, 0, 0, 1, 1,
-0.2300654, 1.439595, 0.6421754, 0, 0, 0, 1, 1,
-0.2299147, -1.045964, -3.302474, 0, 0, 0, 1, 1,
-0.2296332, 0.8326964, -1.523136, 0, 0, 0, 1, 1,
-0.2288171, -0.4158434, -2.075595, 1, 1, 1, 1, 1,
-0.2287271, 1.102001, 0.6241671, 1, 1, 1, 1, 1,
-0.2275813, -0.3640055, -2.719387, 1, 1, 1, 1, 1,
-0.2255451, -0.04341824, -3.65996, 1, 1, 1, 1, 1,
-0.2252331, 1.413868, 0.1167019, 1, 1, 1, 1, 1,
-0.2205022, -0.9334026, 0.1569398, 1, 1, 1, 1, 1,
-0.2187582, -0.942547, -1.610015, 1, 1, 1, 1, 1,
-0.218215, 1.427324, -0.2760213, 1, 1, 1, 1, 1,
-0.2135524, -0.02287529, -2.348599, 1, 1, 1, 1, 1,
-0.2129537, -1.78873, -1.581826, 1, 1, 1, 1, 1,
-0.2105694, -0.3997411, -2.460318, 1, 1, 1, 1, 1,
-0.2100423, 0.2341633, 0.007210078, 1, 1, 1, 1, 1,
-0.2091824, -0.1549701, -1.934606, 1, 1, 1, 1, 1,
-0.2043863, -0.1562351, -4.183836, 1, 1, 1, 1, 1,
-0.2017366, -0.1586923, -2.808076, 1, 1, 1, 1, 1,
-0.2008394, -0.02212981, 1.422603, 0, 0, 1, 1, 1,
-0.197991, 0.4992871, -2.068816, 1, 0, 0, 1, 1,
-0.197261, -0.5827771, -4.782521, 1, 0, 0, 1, 1,
-0.1965155, 1.741498, -1.182007, 1, 0, 0, 1, 1,
-0.1955736, -0.2588786, -1.991177, 1, 0, 0, 1, 1,
-0.1949393, -0.2674785, -1.600205, 1, 0, 0, 1, 1,
-0.1929244, -1.18722, -3.620981, 0, 0, 0, 1, 1,
-0.1928482, 0.7987575, 0.4681742, 0, 0, 0, 1, 1,
-0.1892894, -0.7461581, -2.218407, 0, 0, 0, 1, 1,
-0.187348, 1.623666, -1.483812, 0, 0, 0, 1, 1,
-0.1864376, 0.3345235, 0.07559442, 0, 0, 0, 1, 1,
-0.185595, 0.4691515, -0.4194587, 0, 0, 0, 1, 1,
-0.1842055, -0.105268, -3.153439, 0, 0, 0, 1, 1,
-0.1841321, -0.2898929, -2.7064, 1, 1, 1, 1, 1,
-0.180462, 0.4944252, 0.8755118, 1, 1, 1, 1, 1,
-0.1792011, 0.1685409, -1.489905, 1, 1, 1, 1, 1,
-0.1790771, 0.5728319, 1.447721, 1, 1, 1, 1, 1,
-0.1745172, -0.9305443, -3.558323, 1, 1, 1, 1, 1,
-0.1737988, -1.055436, -1.887672, 1, 1, 1, 1, 1,
-0.1695294, 0.6963395, -0.4422337, 1, 1, 1, 1, 1,
-0.1683261, 0.3677331, -1.808779, 1, 1, 1, 1, 1,
-0.1672678, -1.602925, -4.872766, 1, 1, 1, 1, 1,
-0.1657715, -0.6878389, -2.112267, 1, 1, 1, 1, 1,
-0.163183, 1.511462, 0.5186454, 1, 1, 1, 1, 1,
-0.1576795, 0.6951372, -2.114814, 1, 1, 1, 1, 1,
-0.1538522, -2.769255, -2.367069, 1, 1, 1, 1, 1,
-0.148902, -0.3970592, -2.658334, 1, 1, 1, 1, 1,
-0.1456055, 0.420246, 1.309326, 1, 1, 1, 1, 1,
-0.1450462, -1.069124, -1.730628, 0, 0, 1, 1, 1,
-0.142337, -0.6234362, -3.706095, 1, 0, 0, 1, 1,
-0.1400877, -0.7540688, -3.28599, 1, 0, 0, 1, 1,
-0.1395465, 0.0951649, -1.66406, 1, 0, 0, 1, 1,
-0.1368169, -0.3148551, -2.767911, 1, 0, 0, 1, 1,
-0.1318132, -0.5335281, -2.495594, 1, 0, 0, 1, 1,
-0.1301559, -0.1750522, -2.172479, 0, 0, 0, 1, 1,
-0.1287825, -0.7753925, -2.590981, 0, 0, 0, 1, 1,
-0.126885, 0.563592, -2.358289, 0, 0, 0, 1, 1,
-0.1265459, -0.6954986, -1.311346, 0, 0, 0, 1, 1,
-0.1251557, -0.09856781, -3.244332, 0, 0, 0, 1, 1,
-0.1226362, 2.291868, -1.985488, 0, 0, 0, 1, 1,
-0.121972, 0.7186716, 1.258869, 0, 0, 0, 1, 1,
-0.1160896, 0.07533648, -1.862967, 1, 1, 1, 1, 1,
-0.1158144, -1.659147, -3.773349, 1, 1, 1, 1, 1,
-0.1145327, 1.066566, 0.2333436, 1, 1, 1, 1, 1,
-0.114429, 0.6528538, 0.188962, 1, 1, 1, 1, 1,
-0.1140257, -0.9155546, -3.161089, 1, 1, 1, 1, 1,
-0.1113885, 0.8758937, 0.0623817, 1, 1, 1, 1, 1,
-0.1085319, 0.08147472, -0.1743387, 1, 1, 1, 1, 1,
-0.1082064, -0.2659684, -0.8720492, 1, 1, 1, 1, 1,
-0.1080246, -0.6508733, -4.271641, 1, 1, 1, 1, 1,
-0.1032126, 0.7767826, 0.5448152, 1, 1, 1, 1, 1,
-0.1016382, -2.801393, -2.58922, 1, 1, 1, 1, 1,
-0.1012627, -0.9417599, -3.459639, 1, 1, 1, 1, 1,
-0.09280184, 0.5391347, 1.06731, 1, 1, 1, 1, 1,
-0.09146908, 0.5554406, 0.1598966, 1, 1, 1, 1, 1,
-0.09075095, 1.597479, 0.6755098, 1, 1, 1, 1, 1,
-0.08914608, -0.780407, -5.588122, 0, 0, 1, 1, 1,
-0.08674055, 0.4001549, 0.742274, 1, 0, 0, 1, 1,
-0.08236279, 0.72612, -1.240216, 1, 0, 0, 1, 1,
-0.07982961, -0.9418542, -3.54296, 1, 0, 0, 1, 1,
-0.0771693, -1.190677, -3.625529, 1, 0, 0, 1, 1,
-0.06472363, 0.3286668, -0.6227584, 1, 0, 0, 1, 1,
-0.06051065, -0.322093, -4.659986, 0, 0, 0, 1, 1,
-0.05769947, 1.39354, -0.1623931, 0, 0, 0, 1, 1,
-0.05444502, -1.450867, -2.297581, 0, 0, 0, 1, 1,
-0.05342756, -0.8766239, -2.535112, 0, 0, 0, 1, 1,
-0.0523299, -1.143505, -3.677524, 0, 0, 0, 1, 1,
-0.0466377, 1.795309, -0.4347584, 0, 0, 0, 1, 1,
-0.0371118, -0.5532305, -4.044372, 0, 0, 0, 1, 1,
-0.03126789, 1.032642, -2.442276, 1, 1, 1, 1, 1,
-0.01958476, 0.809818, 0.7206363, 1, 1, 1, 1, 1,
-0.01708063, 0.6805046, -0.3047421, 1, 1, 1, 1, 1,
-0.01569637, -0.2111682, -3.979574, 1, 1, 1, 1, 1,
-0.01546445, 0.6087644, -0.9824965, 1, 1, 1, 1, 1,
-0.01374076, 0.5229009, -1.497872, 1, 1, 1, 1, 1,
-0.01298538, 0.6457075, -1.433477, 1, 1, 1, 1, 1,
-0.01251571, 2.002238, 0.3332421, 1, 1, 1, 1, 1,
-0.008481211, 0.5726019, 1.985418, 1, 1, 1, 1, 1,
-0.007810246, -1.6332, -2.515832, 1, 1, 1, 1, 1,
-0.003937274, -0.5354846, -3.19023, 1, 1, 1, 1, 1,
-0.002614721, 0.6388054, 0.2560788, 1, 1, 1, 1, 1,
-0.002321936, -0.8837974, -4.820909, 1, 1, 1, 1, 1,
-0.0008020837, 0.307306, -0.65301, 1, 1, 1, 1, 1,
-0.0002082142, -1.563699, -2.649989, 1, 1, 1, 1, 1,
-0.0001874932, -2.315799, -1.808652, 0, 0, 1, 1, 1,
0.00166001, 1.281857, 0.9608571, 1, 0, 0, 1, 1,
0.005392793, 1.569729, -0.9179627, 1, 0, 0, 1, 1,
0.00650391, 1.835004, -0.4210767, 1, 0, 0, 1, 1,
0.006765244, 0.1550254, -0.3253928, 1, 0, 0, 1, 1,
0.009007167, -1.94041, 3.462089, 1, 0, 0, 1, 1,
0.01307329, 0.4006361, -0.5398661, 0, 0, 0, 1, 1,
0.01462962, -1.024958, 2.939361, 0, 0, 0, 1, 1,
0.01806412, 0.3436195, -0.41067, 0, 0, 0, 1, 1,
0.01892148, -0.8854645, 3.045834, 0, 0, 0, 1, 1,
0.02179263, -0.1713437, 1.873747, 0, 0, 0, 1, 1,
0.02188512, -0.324338, 1.768852, 0, 0, 0, 1, 1,
0.02199519, -0.8419579, 4.046766, 0, 0, 0, 1, 1,
0.02283573, 1.129973, 0.8781247, 1, 1, 1, 1, 1,
0.02293795, 0.9824129, -0.9077915, 1, 1, 1, 1, 1,
0.02814194, -0.2078395, 2.199153, 1, 1, 1, 1, 1,
0.03021228, 0.4478454, 0.2172483, 1, 1, 1, 1, 1,
0.03212841, -0.8589309, 3.153836, 1, 1, 1, 1, 1,
0.03317885, -0.9181119, 4.171842, 1, 1, 1, 1, 1,
0.03418668, -0.7052673, 2.095539, 1, 1, 1, 1, 1,
0.0374817, -1.428832, 4.89854, 1, 1, 1, 1, 1,
0.03970528, 2.05707, -0.7377741, 1, 1, 1, 1, 1,
0.04160215, -1.225767, 3.682746, 1, 1, 1, 1, 1,
0.04220669, -0.6675687, 2.151452, 1, 1, 1, 1, 1,
0.04359451, -1.050979, 3.025286, 1, 1, 1, 1, 1,
0.04459473, -1.212621, 3.781212, 1, 1, 1, 1, 1,
0.047734, -0.394469, 3.181537, 1, 1, 1, 1, 1,
0.05184809, 0.862427, -0.2262601, 1, 1, 1, 1, 1,
0.05444509, -0.9934509, 3.886914, 0, 0, 1, 1, 1,
0.05479315, 1.623761, -0.1421957, 1, 0, 0, 1, 1,
0.05673475, 0.5133072, 0.2679291, 1, 0, 0, 1, 1,
0.05798923, 0.07671967, -0.3423283, 1, 0, 0, 1, 1,
0.05884127, 0.509659, -1.523305, 1, 0, 0, 1, 1,
0.06309034, -0.2716228, 2.858952, 1, 0, 0, 1, 1,
0.06829724, -0.9883125, 2.960367, 0, 0, 0, 1, 1,
0.06988442, -0.2178236, 2.473501, 0, 0, 0, 1, 1,
0.07128097, -0.9659041, 2.84407, 0, 0, 0, 1, 1,
0.07136992, -0.446869, 2.293689, 0, 0, 0, 1, 1,
0.07281782, 0.9078602, -0.7399412, 0, 0, 0, 1, 1,
0.0764609, -1.427802, 5.103716, 0, 0, 0, 1, 1,
0.07647634, 0.1973674, -0.2939592, 0, 0, 0, 1, 1,
0.07796647, -1.846278, 3.18354, 1, 1, 1, 1, 1,
0.08064036, 0.1330901, -0.6951878, 1, 1, 1, 1, 1,
0.082302, -0.6366168, 1.4502, 1, 1, 1, 1, 1,
0.08602692, 0.307129, -0.9591964, 1, 1, 1, 1, 1,
0.086929, -0.5279374, 3.139176, 1, 1, 1, 1, 1,
0.087222, 0.6095217, 1.539929, 1, 1, 1, 1, 1,
0.09159718, 0.5456847, -0.4882763, 1, 1, 1, 1, 1,
0.09214318, -0.5482292, 2.928671, 1, 1, 1, 1, 1,
0.09350263, 1.384398, 1.201129, 1, 1, 1, 1, 1,
0.09795967, -2.732946, 3.280778, 1, 1, 1, 1, 1,
0.1069602, 1.210729, 0.6352217, 1, 1, 1, 1, 1,
0.1081195, 1.64555, 1.513051, 1, 1, 1, 1, 1,
0.1141156, 0.538659, 0.1620336, 1, 1, 1, 1, 1,
0.114387, -0.463064, 2.602051, 1, 1, 1, 1, 1,
0.1182977, -1.395512, 3.522731, 1, 1, 1, 1, 1,
0.1215715, -0.5265543, 2.744757, 0, 0, 1, 1, 1,
0.1268487, 0.7984858, 0.7753145, 1, 0, 0, 1, 1,
0.1330344, -0.8398011, 4.091099, 1, 0, 0, 1, 1,
0.1341925, 1.061693, -0.3628859, 1, 0, 0, 1, 1,
0.1453297, -0.4617361, 3.00965, 1, 0, 0, 1, 1,
0.1463576, 1.186968, 1.769342, 1, 0, 0, 1, 1,
0.1470094, 0.2500248, 1.972796, 0, 0, 0, 1, 1,
0.1472579, 1.421212, 2.157244, 0, 0, 0, 1, 1,
0.1483958, 0.4721456, -1.156309, 0, 0, 0, 1, 1,
0.1506411, 0.7638892, 0.7788903, 0, 0, 0, 1, 1,
0.1597399, -0.4588075, 2.605377, 0, 0, 0, 1, 1,
0.1598766, 0.8008566, -0.6535144, 0, 0, 0, 1, 1,
0.1619304, 0.01648168, 1.671287, 0, 0, 0, 1, 1,
0.1620987, 0.6241797, -0.6676776, 1, 1, 1, 1, 1,
0.1630427, 0.8437375, 1.116056, 1, 1, 1, 1, 1,
0.1652769, -1.338683, 2.689008, 1, 1, 1, 1, 1,
0.1666813, 0.1840782, 0.9194289, 1, 1, 1, 1, 1,
0.1699418, -1.603557, 3.358665, 1, 1, 1, 1, 1,
0.1725162, 0.6507428, -0.009878963, 1, 1, 1, 1, 1,
0.1784306, 0.5198907, 1.614545, 1, 1, 1, 1, 1,
0.181827, 0.3716379, -0.2143817, 1, 1, 1, 1, 1,
0.1900695, -0.07690676, 0.6822786, 1, 1, 1, 1, 1,
0.1909865, -0.3330177, 2.551982, 1, 1, 1, 1, 1,
0.192682, -0.09659799, 2.4662, 1, 1, 1, 1, 1,
0.1940101, 1.36675, 1.766142, 1, 1, 1, 1, 1,
0.1940634, 0.5171717, 1.972068, 1, 1, 1, 1, 1,
0.1981549, 2.260252, 0.3294003, 1, 1, 1, 1, 1,
0.1987094, 0.358443, 1.76633, 1, 1, 1, 1, 1,
0.2018031, 0.1112234, -0.01246646, 0, 0, 1, 1, 1,
0.2023842, -0.724416, 2.029678, 1, 0, 0, 1, 1,
0.2069111, 0.6980213, 0.2550378, 1, 0, 0, 1, 1,
0.2091001, -1.609019, 4.572832, 1, 0, 0, 1, 1,
0.2103752, -0.7943701, 0.8144591, 1, 0, 0, 1, 1,
0.2116849, -0.5406653, 2.928473, 1, 0, 0, 1, 1,
0.2120115, -0.7851502, 2.955668, 0, 0, 0, 1, 1,
0.2126342, 0.6474231, 1.743092, 0, 0, 0, 1, 1,
0.2133973, -1.084321, 3.03118, 0, 0, 0, 1, 1,
0.214266, 1.268979, 2.876955, 0, 0, 0, 1, 1,
0.2165031, -0.38265, 3.758651, 0, 0, 0, 1, 1,
0.2176804, -0.124842, 1.311529, 0, 0, 0, 1, 1,
0.2198251, 0.2683527, -0.04740431, 0, 0, 0, 1, 1,
0.2201895, 0.8314974, -0.03623822, 1, 1, 1, 1, 1,
0.220387, 0.3690556, -1.545053, 1, 1, 1, 1, 1,
0.2213146, 0.8700327, -1.393407, 1, 1, 1, 1, 1,
0.2232277, 0.6367884, 0.2692534, 1, 1, 1, 1, 1,
0.2285536, -0.9590403, 4.166712, 1, 1, 1, 1, 1,
0.2310248, -0.6827698, 3.721026, 1, 1, 1, 1, 1,
0.2322729, 0.7559597, -0.5759038, 1, 1, 1, 1, 1,
0.234722, 0.4056463, 2.063154, 1, 1, 1, 1, 1,
0.2361085, -1.464149, 2.78149, 1, 1, 1, 1, 1,
0.2383827, 0.791804, 1.174541, 1, 1, 1, 1, 1,
0.2409124, -0.875629, 3.134263, 1, 1, 1, 1, 1,
0.2481424, -0.3868612, 2.862289, 1, 1, 1, 1, 1,
0.2496932, 1.427757, -0.402719, 1, 1, 1, 1, 1,
0.2497347, 0.01757948, 3.154382, 1, 1, 1, 1, 1,
0.2542516, -0.45709, 3.169817, 1, 1, 1, 1, 1,
0.2586292, -0.620427, 3.402664, 0, 0, 1, 1, 1,
0.2590977, -1.196412, 3.67658, 1, 0, 0, 1, 1,
0.259648, -0.269292, 1.246753, 1, 0, 0, 1, 1,
0.263238, 0.8158554, -0.1627278, 1, 0, 0, 1, 1,
0.2652846, 0.4696245, -0.7961208, 1, 0, 0, 1, 1,
0.2669295, -1.141072, 3.85869, 1, 0, 0, 1, 1,
0.2674898, -0.8724992, 4.214561, 0, 0, 0, 1, 1,
0.2728051, -0.1452545, 3.081971, 0, 0, 0, 1, 1,
0.2786199, -1.498198, 3.321655, 0, 0, 0, 1, 1,
0.2808899, 2.982955, -0.008295843, 0, 0, 0, 1, 1,
0.2836518, -0.4125027, 1.042986, 0, 0, 0, 1, 1,
0.286838, -2.999051, 3.201799, 0, 0, 0, 1, 1,
0.2870148, -1.255476, 3.552624, 0, 0, 0, 1, 1,
0.2888619, -0.5081114, -0.02996079, 1, 1, 1, 1, 1,
0.2909927, -0.04067376, 0.9952841, 1, 1, 1, 1, 1,
0.291522, 0.311905, 0.7318276, 1, 1, 1, 1, 1,
0.2915448, -1.259101, 3.232271, 1, 1, 1, 1, 1,
0.3054252, -0.1852659, 1.922414, 1, 1, 1, 1, 1,
0.3098822, -0.1387493, 1.444539, 1, 1, 1, 1, 1,
0.3122005, 1.823298, -0.07266808, 1, 1, 1, 1, 1,
0.313952, 0.9231555, 1.303273, 1, 1, 1, 1, 1,
0.3157121, -0.3966905, 2.42694, 1, 1, 1, 1, 1,
0.3157933, 2.18375, -0.1096393, 1, 1, 1, 1, 1,
0.3211185, -0.03272796, 1.102342, 1, 1, 1, 1, 1,
0.3221987, -0.6366811, 3.909313, 1, 1, 1, 1, 1,
0.3244286, 0.8456725, 2.787223, 1, 1, 1, 1, 1,
0.3276313, -2.45235, 3.095391, 1, 1, 1, 1, 1,
0.327978, 0.7514376, -0.2620808, 1, 1, 1, 1, 1,
0.3299137, 0.5058819, 1.951539, 0, 0, 1, 1, 1,
0.3310905, -0.3099553, 3.211875, 1, 0, 0, 1, 1,
0.333396, 0.1934671, -0.08937955, 1, 0, 0, 1, 1,
0.3385023, -0.7345119, 4.275548, 1, 0, 0, 1, 1,
0.3394361, 2.536178, -0.9161377, 1, 0, 0, 1, 1,
0.3461463, -1.85754, 2.237616, 1, 0, 0, 1, 1,
0.3527493, 1.448303, 0.1162984, 0, 0, 0, 1, 1,
0.3535462, -0.2108987, 2.840812, 0, 0, 0, 1, 1,
0.3536119, -0.124159, -0.5604774, 0, 0, 0, 1, 1,
0.3563755, -0.06748746, 2.37067, 0, 0, 0, 1, 1,
0.3571784, -0.7096657, 3.83352, 0, 0, 0, 1, 1,
0.3576348, 0.05229211, 1.697291, 0, 0, 0, 1, 1,
0.3600592, -1.025359, 2.371218, 0, 0, 0, 1, 1,
0.3609375, 2.055223, 1.099975, 1, 1, 1, 1, 1,
0.3613494, 0.4475226, -0.1288154, 1, 1, 1, 1, 1,
0.3615021, 0.7662855, 0.2500912, 1, 1, 1, 1, 1,
0.3625486, 0.5007997, 1.740153, 1, 1, 1, 1, 1,
0.3633445, 0.5810065, 0.5182142, 1, 1, 1, 1, 1,
0.3695991, 2.240206, 1.363923, 1, 1, 1, 1, 1,
0.3709793, -1.849788, 2.174405, 1, 1, 1, 1, 1,
0.3764693, -1.983645, 3.306422, 1, 1, 1, 1, 1,
0.3788768, -0.4127232, 2.745887, 1, 1, 1, 1, 1,
0.380061, 0.2947671, 3.353047, 1, 1, 1, 1, 1,
0.3812111, -0.1011607, 3.453624, 1, 1, 1, 1, 1,
0.3815154, 0.6124868, 1.001415, 1, 1, 1, 1, 1,
0.3833556, -1.442632, 2.643786, 1, 1, 1, 1, 1,
0.3838728, 0.02549124, 0.7184731, 1, 1, 1, 1, 1,
0.3868278, -1.126404, 3.396515, 1, 1, 1, 1, 1,
0.3876656, 1.144761, 0.7549047, 0, 0, 1, 1, 1,
0.3910578, 0.1094952, 1.900758, 1, 0, 0, 1, 1,
0.3917566, 1.227251, -0.849403, 1, 0, 0, 1, 1,
0.3954201, 0.4428822, 1.125596, 1, 0, 0, 1, 1,
0.3978579, -0.5636895, 3.232116, 1, 0, 0, 1, 1,
0.4019673, -0.04295198, 1.109623, 1, 0, 0, 1, 1,
0.4033567, 0.3228821, -0.8098899, 0, 0, 0, 1, 1,
0.4158769, 1.061805, 0.3294846, 0, 0, 0, 1, 1,
0.4165326, -1.26942, 1.024669, 0, 0, 0, 1, 1,
0.4217212, 1.609801, 0.208554, 0, 0, 0, 1, 1,
0.430847, 0.2080018, 1.227465, 0, 0, 0, 1, 1,
0.4328236, -0.4305104, 2.555461, 0, 0, 0, 1, 1,
0.4362228, 0.2567996, 2.315261, 0, 0, 0, 1, 1,
0.437061, -0.3622245, 2.720067, 1, 1, 1, 1, 1,
0.4381347, -0.7842075, 2.025754, 1, 1, 1, 1, 1,
0.4410039, 0.1830906, 4.213724, 1, 1, 1, 1, 1,
0.4441523, 1.297366, 0.383091, 1, 1, 1, 1, 1,
0.4445945, -0.2904098, 1.625873, 1, 1, 1, 1, 1,
0.4478612, 0.02461814, 0.1844491, 1, 1, 1, 1, 1,
0.4511501, 0.8260323, 1.133712, 1, 1, 1, 1, 1,
0.4525619, -1.292794, 1.938094, 1, 1, 1, 1, 1,
0.457109, -0.1882567, 3.709611, 1, 1, 1, 1, 1,
0.4578679, 0.1120842, 1.269633, 1, 1, 1, 1, 1,
0.4594953, -1.280136, 2.342373, 1, 1, 1, 1, 1,
0.4629992, 0.3459525, 1.620649, 1, 1, 1, 1, 1,
0.4632903, -0.9859613, 1.293675, 1, 1, 1, 1, 1,
0.4650353, 0.5906758, 0.3586911, 1, 1, 1, 1, 1,
0.4666857, 0.2204884, 1.970219, 1, 1, 1, 1, 1,
0.4667348, -0.6744858, 2.483131, 0, 0, 1, 1, 1,
0.4696745, -1.315663, 2.256711, 1, 0, 0, 1, 1,
0.4737156, 1.080796, 2.289211, 1, 0, 0, 1, 1,
0.4799142, -2.388127, 2.918431, 1, 0, 0, 1, 1,
0.4802341, -2.253468, 1.579441, 1, 0, 0, 1, 1,
0.4860345, -0.8908964, 1.639791, 1, 0, 0, 1, 1,
0.4877028, -1.248939, 2.954454, 0, 0, 0, 1, 1,
0.492946, 1.03733, -1.349401, 0, 0, 0, 1, 1,
0.4968596, -0.5393987, 1.474086, 0, 0, 0, 1, 1,
0.4972266, -0.4222332, 1.802906, 0, 0, 0, 1, 1,
0.4983099, -0.9517139, 2.313282, 0, 0, 0, 1, 1,
0.4996523, -0.0413738, 1.492453, 0, 0, 0, 1, 1,
0.5061367, 0.3570577, 1.918582, 0, 0, 0, 1, 1,
0.5090485, -1.641428, 3.173454, 1, 1, 1, 1, 1,
0.5128528, 0.4264456, 1.099947, 1, 1, 1, 1, 1,
0.5132236, -0.957366, 3.931936, 1, 1, 1, 1, 1,
0.5141364, -1.131807, 2.283007, 1, 1, 1, 1, 1,
0.5163092, -0.4935558, 2.148652, 1, 1, 1, 1, 1,
0.5201603, -0.2333047, 1.318884, 1, 1, 1, 1, 1,
0.5206009, -1.35811, 4.480837, 1, 1, 1, 1, 1,
0.5229193, -1.141901, 0.6911578, 1, 1, 1, 1, 1,
0.5229206, 2.073344, -0.6210119, 1, 1, 1, 1, 1,
0.5290406, 0.3921899, 0.1947989, 1, 1, 1, 1, 1,
0.5299734, -0.07909367, 3.221193, 1, 1, 1, 1, 1,
0.5302783, -0.9618257, 3.425155, 1, 1, 1, 1, 1,
0.5311334, 1.458082, 0.5820518, 1, 1, 1, 1, 1,
0.5335636, 1.209948, 1.80999, 1, 1, 1, 1, 1,
0.5442952, 0.1495618, 1.796795, 1, 1, 1, 1, 1,
0.5444122, -0.9096373, 2.191099, 0, 0, 1, 1, 1,
0.5466707, 0.2235357, 2.624171, 1, 0, 0, 1, 1,
0.5563468, 0.1647999, 1.594299, 1, 0, 0, 1, 1,
0.557072, 0.7147143, 2.359161, 1, 0, 0, 1, 1,
0.5593989, -0.6308885, 2.816627, 1, 0, 0, 1, 1,
0.5597303, 0.001402564, 1.899663, 1, 0, 0, 1, 1,
0.5658228, -0.05487772, 2.947875, 0, 0, 0, 1, 1,
0.5667442, -1.200082, 2.549474, 0, 0, 0, 1, 1,
0.5739678, -0.2963368, 1.466104, 0, 0, 0, 1, 1,
0.5765415, 1.92173, 0.8568172, 0, 0, 0, 1, 1,
0.5828071, 0.404909, 0.8657222, 0, 0, 0, 1, 1,
0.5864791, 0.740025, 1.031398, 0, 0, 0, 1, 1,
0.5960587, 0.4544005, 0.9255294, 0, 0, 0, 1, 1,
0.6043051, -1.357135, 4.145589, 1, 1, 1, 1, 1,
0.6044703, -1.2909, 2.476711, 1, 1, 1, 1, 1,
0.6068117, 0.2962487, 0.8020521, 1, 1, 1, 1, 1,
0.6104375, -0.3226415, 1.666699, 1, 1, 1, 1, 1,
0.6113359, 0.5979459, 0.8096196, 1, 1, 1, 1, 1,
0.6246539, 2.183816, -0.3222095, 1, 1, 1, 1, 1,
0.6264668, -0.925257, 3.049081, 1, 1, 1, 1, 1,
0.6361812, 1.080573, 0.1583275, 1, 1, 1, 1, 1,
0.6451085, 0.7025676, -0.04357487, 1, 1, 1, 1, 1,
0.6460298, -0.890033, 0.1847487, 1, 1, 1, 1, 1,
0.6464052, -0.2630891, 2.452858, 1, 1, 1, 1, 1,
0.649471, 0.2533187, 0.4786468, 1, 1, 1, 1, 1,
0.6536549, -0.3781108, 1.078104, 1, 1, 1, 1, 1,
0.6585268, -2.343415, 2.180122, 1, 1, 1, 1, 1,
0.664848, -0.6328242, 0.506688, 1, 1, 1, 1, 1,
0.6661088, -0.05897011, 1.631198, 0, 0, 1, 1, 1,
0.6676987, -0.3035808, 2.759587, 1, 0, 0, 1, 1,
0.6688044, -0.331833, 2.753327, 1, 0, 0, 1, 1,
0.6798866, -1.029681, 2.640073, 1, 0, 0, 1, 1,
0.6811622, -1.18657, 1.959986, 1, 0, 0, 1, 1,
0.683515, 0.9135647, 1.321387, 1, 0, 0, 1, 1,
0.6842166, 0.5744931, 0.7674742, 0, 0, 0, 1, 1,
0.6845612, -0.01463524, 2.344521, 0, 0, 0, 1, 1,
0.6973903, 0.6221754, 2.558194, 0, 0, 0, 1, 1,
0.6974683, 0.4558898, -1.310337, 0, 0, 0, 1, 1,
0.7045668, -0.3120845, 2.050059, 0, 0, 0, 1, 1,
0.7048177, -1.164248, 2.309633, 0, 0, 0, 1, 1,
0.7128338, 0.2102327, 1.936883, 0, 0, 0, 1, 1,
0.7136024, -0.155784, 1.258337, 1, 1, 1, 1, 1,
0.7147306, -0.3146739, 3.581292, 1, 1, 1, 1, 1,
0.716305, 1.942941, 1.742825, 1, 1, 1, 1, 1,
0.7176717, 0.1412498, 1.405358, 1, 1, 1, 1, 1,
0.7182715, 0.64644, 1.309566, 1, 1, 1, 1, 1,
0.7213382, -0.9016842, 1.295037, 1, 1, 1, 1, 1,
0.7237276, 1.463443, -0.7201952, 1, 1, 1, 1, 1,
0.7242779, -0.4675255, 1.806171, 1, 1, 1, 1, 1,
0.7244934, -0.8204461, 2.725418, 1, 1, 1, 1, 1,
0.7246041, -1.836061, 3.466079, 1, 1, 1, 1, 1,
0.7296357, -0.5311191, 3.241732, 1, 1, 1, 1, 1,
0.7299308, 0.3552935, 0.7766949, 1, 1, 1, 1, 1,
0.7329801, 0.9625981, -0.37001, 1, 1, 1, 1, 1,
0.738034, 0.6017317, 0.6733454, 1, 1, 1, 1, 1,
0.7385248, 0.9348643, 1.907297, 1, 1, 1, 1, 1,
0.7422822, 0.2816601, 0.2450694, 0, 0, 1, 1, 1,
0.7436827, -0.9177509, 1.81858, 1, 0, 0, 1, 1,
0.7440711, 1.747898, 1.641446, 1, 0, 0, 1, 1,
0.7444069, 0.8015739, 0.7761968, 1, 0, 0, 1, 1,
0.7630582, 0.09290126, 1.788109, 1, 0, 0, 1, 1,
0.7642673, -0.62572, 3.357185, 1, 0, 0, 1, 1,
0.7653561, -0.6540269, 2.992607, 0, 0, 0, 1, 1,
0.7657985, -0.7437853, 3.964216, 0, 0, 0, 1, 1,
0.7814025, -0.8183298, 3.261073, 0, 0, 0, 1, 1,
0.785069, -0.2992573, 2.740742, 0, 0, 0, 1, 1,
0.7873783, 0.9538391, 0.4230383, 0, 0, 0, 1, 1,
0.7880002, -0.5438788, 1.523984, 0, 0, 0, 1, 1,
0.7880747, 0.1819952, 0.4800127, 0, 0, 0, 1, 1,
0.7922754, -1.088813, 2.812553, 1, 1, 1, 1, 1,
0.8030239, -0.08249165, 1.7905, 1, 1, 1, 1, 1,
0.8065606, -0.5240138, 1.839853, 1, 1, 1, 1, 1,
0.8157323, -0.5006647, 1.921117, 1, 1, 1, 1, 1,
0.8173259, -0.6361471, 2.333681, 1, 1, 1, 1, 1,
0.8189347, -2.494129, 4.124913, 1, 1, 1, 1, 1,
0.8321196, -0.8427944, 1.218615, 1, 1, 1, 1, 1,
0.8324259, 0.04376252, -0.6116828, 1, 1, 1, 1, 1,
0.8361281, 0.06414223, 1.761513, 1, 1, 1, 1, 1,
0.8491212, -1.320319, 2.286219, 1, 1, 1, 1, 1,
0.8510266, -1.076189, 2.824832, 1, 1, 1, 1, 1,
0.852263, 0.9955093, 0.9477562, 1, 1, 1, 1, 1,
0.8558202, 2.086362, 0.816628, 1, 1, 1, 1, 1,
0.8561215, 0.1323709, 2.003632, 1, 1, 1, 1, 1,
0.8628331, -0.4805754, 1.762442, 1, 1, 1, 1, 1,
0.8715908, -0.9057108, 1.33154, 0, 0, 1, 1, 1,
0.874256, 1.086263, 0.6098536, 1, 0, 0, 1, 1,
0.8761531, -0.7550072, 1.912954, 1, 0, 0, 1, 1,
0.8774906, -0.9264473, 1.999309, 1, 0, 0, 1, 1,
0.8844231, -0.6250604, 1.581971, 1, 0, 0, 1, 1,
0.8989398, 0.01929012, 2.077931, 1, 0, 0, 1, 1,
0.9062252, 1.448548, -0.3824303, 0, 0, 0, 1, 1,
0.9148561, -0.9501234, 1.846299, 0, 0, 0, 1, 1,
0.9153159, 0.2339779, 1.492999, 0, 0, 0, 1, 1,
0.9160259, 1.721292, -0.1029009, 0, 0, 0, 1, 1,
0.9184957, -0.2297308, 0.8431246, 0, 0, 0, 1, 1,
0.9192608, -2.101137, 1.678636, 0, 0, 0, 1, 1,
0.9194636, 1.798208, 0.6544341, 0, 0, 0, 1, 1,
0.932158, 0.3924311, 2.454491, 1, 1, 1, 1, 1,
0.9348488, 0.1358536, 4.326064, 1, 1, 1, 1, 1,
0.9516231, 0.3153087, 1.824627, 1, 1, 1, 1, 1,
0.9533914, -0.6725177, 1.859012, 1, 1, 1, 1, 1,
0.9556673, 0.4559422, 0.9203207, 1, 1, 1, 1, 1,
0.9595601, -0.04197121, 1.12615, 1, 1, 1, 1, 1,
0.9609364, 0.1249849, 1.405398, 1, 1, 1, 1, 1,
0.962836, -0.2711132, 1.68555, 1, 1, 1, 1, 1,
0.9722783, 0.1438007, -0.1591236, 1, 1, 1, 1, 1,
0.9768624, -1.257507, 3.78318, 1, 1, 1, 1, 1,
0.9803243, 0.7785661, 1.135577, 1, 1, 1, 1, 1,
0.9805796, -0.3621163, 2.76459, 1, 1, 1, 1, 1,
0.981405, -0.7552745, 2.441171, 1, 1, 1, 1, 1,
0.9828627, -1.611783, 2.741157, 1, 1, 1, 1, 1,
0.9832456, -1.257015, 2.522539, 1, 1, 1, 1, 1,
0.9950362, -1.150087, 1.101886, 0, 0, 1, 1, 1,
1.001309, 2.882076, 0.9002453, 1, 0, 0, 1, 1,
1.002148, 1.480365, -0.1544759, 1, 0, 0, 1, 1,
1.003315, 0.8547612, 0.04588085, 1, 0, 0, 1, 1,
1.004983, -1.106381, 2.999263, 1, 0, 0, 1, 1,
1.009578, -2.506077, 1.264216, 1, 0, 0, 1, 1,
1.024127, -0.7935093, 1.61311, 0, 0, 0, 1, 1,
1.028449, -0.1029606, 0.4001896, 0, 0, 0, 1, 1,
1.038386, 0.7922721, 0.6806483, 0, 0, 0, 1, 1,
1.039147, -1.065568, 2.541356, 0, 0, 0, 1, 1,
1.046521, 0.1763828, 1.768798, 0, 0, 0, 1, 1,
1.046728, 1.092092, -0.7296798, 0, 0, 0, 1, 1,
1.051646, 1.14873, -0.5923052, 0, 0, 0, 1, 1,
1.053528, 2.297995, 0.5655091, 1, 1, 1, 1, 1,
1.054649, 0.3156117, 1.474103, 1, 1, 1, 1, 1,
1.058842, 0.09236407, 0.7294773, 1, 1, 1, 1, 1,
1.059189, 0.05053794, 2.215716, 1, 1, 1, 1, 1,
1.063559, 0.3524305, 1.767152, 1, 1, 1, 1, 1,
1.06563, -0.07853749, 2.81193, 1, 1, 1, 1, 1,
1.071334, -0.007622052, 1.745312, 1, 1, 1, 1, 1,
1.077959, 0.8755382, 1.011235, 1, 1, 1, 1, 1,
1.078469, 1.049182, -0.6812229, 1, 1, 1, 1, 1,
1.083401, 0.03436963, 2.687244, 1, 1, 1, 1, 1,
1.084398, 0.6107514, 0.6276969, 1, 1, 1, 1, 1,
1.097001, 1.51969, 3.684327, 1, 1, 1, 1, 1,
1.101159, 0.1182901, 2.732071, 1, 1, 1, 1, 1,
1.106554, -0.04458646, 4.021469, 1, 1, 1, 1, 1,
1.12145, -0.9217252, 3.629423, 1, 1, 1, 1, 1,
1.131796, 0.7158027, -0.2613246, 0, 0, 1, 1, 1,
1.132735, 0.02920692, 2.193504, 1, 0, 0, 1, 1,
1.134302, 0.004284184, 2.728034, 1, 0, 0, 1, 1,
1.140862, 0.3294607, 3.24272, 1, 0, 0, 1, 1,
1.145897, 1.207574, 0.4303774, 1, 0, 0, 1, 1,
1.14663, -0.2038942, 2.51303, 1, 0, 0, 1, 1,
1.150617, -1.500605, 1.865343, 0, 0, 0, 1, 1,
1.154003, 0.518019, -0.9962728, 0, 0, 0, 1, 1,
1.155829, 1.756274, 2.049947, 0, 0, 0, 1, 1,
1.155844, 1.009719, -0.8147669, 0, 0, 0, 1, 1,
1.159197, 0.3150047, 0.8627974, 0, 0, 0, 1, 1,
1.164653, -1.230551, 2.13534, 0, 0, 0, 1, 1,
1.169673, 0.1413369, 3.052464, 0, 0, 0, 1, 1,
1.172509, -2.195263, 1.214861, 1, 1, 1, 1, 1,
1.180962, -1.362931, 2.78288, 1, 1, 1, 1, 1,
1.183894, 0.2823474, 1.409915, 1, 1, 1, 1, 1,
1.195301, 0.1326015, 1.787158, 1, 1, 1, 1, 1,
1.198831, -0.5142362, 1.651868, 1, 1, 1, 1, 1,
1.204263, -0.02485227, 1.116836, 1, 1, 1, 1, 1,
1.214931, 0.6700521, 1.653317, 1, 1, 1, 1, 1,
1.227376, -0.7072001, 3.004448, 1, 1, 1, 1, 1,
1.247304, -0.6321536, 1.898599, 1, 1, 1, 1, 1,
1.248392, 0.06361503, 1.320673, 1, 1, 1, 1, 1,
1.250521, 1.732772, 1.245815, 1, 1, 1, 1, 1,
1.2516, -0.3333796, 1.27353, 1, 1, 1, 1, 1,
1.254215, 0.1392907, 0.4981886, 1, 1, 1, 1, 1,
1.259381, 1.171542, 0.1389021, 1, 1, 1, 1, 1,
1.26413, -2.361344, 1.824486, 1, 1, 1, 1, 1,
1.266574, 1.194019, 0.7818502, 0, 0, 1, 1, 1,
1.284912, 0.1771063, 1.593832, 1, 0, 0, 1, 1,
1.289277, -1.917586, 1.578764, 1, 0, 0, 1, 1,
1.290284, 0.1329147, 3.044436, 1, 0, 0, 1, 1,
1.292873, -0.7681002, 2.963801, 1, 0, 0, 1, 1,
1.296367, 1.46817, 0.6733065, 1, 0, 0, 1, 1,
1.298503, 0.265943, 2.413926, 0, 0, 0, 1, 1,
1.299798, 0.3359694, -0.06888214, 0, 0, 0, 1, 1,
1.31339, -1.619039, 0.6602598, 0, 0, 0, 1, 1,
1.313841, 1.591621, 0.5491823, 0, 0, 0, 1, 1,
1.319322, 1.315327, 0.6591266, 0, 0, 0, 1, 1,
1.329508, -0.667035, 3.285339, 0, 0, 0, 1, 1,
1.331972, -0.6428519, 3.09361, 0, 0, 0, 1, 1,
1.338685, -1.361245, 3.183605, 1, 1, 1, 1, 1,
1.338961, 0.2608198, 1.869636, 1, 1, 1, 1, 1,
1.346136, 1.388448, -0.6017694, 1, 1, 1, 1, 1,
1.353639, 0.2294638, 2.076165, 1, 1, 1, 1, 1,
1.356953, -0.8911484, 1.631468, 1, 1, 1, 1, 1,
1.369529, -0.5414371, 3.448362, 1, 1, 1, 1, 1,
1.373181, 1.419677, 0.0446852, 1, 1, 1, 1, 1,
1.373632, -0.5241325, 2.584734, 1, 1, 1, 1, 1,
1.382338, 0.7165812, 1.35447, 1, 1, 1, 1, 1,
1.389813, -0.5299051, 1.886936, 1, 1, 1, 1, 1,
1.410745, -0.1956832, 3.498469, 1, 1, 1, 1, 1,
1.412279, 0.9893223, 1.151445, 1, 1, 1, 1, 1,
1.416982, -1.689318, 1.968667, 1, 1, 1, 1, 1,
1.422525, -0.5834158, 1.440217, 1, 1, 1, 1, 1,
1.426387, 0.5707219, 0.6595688, 1, 1, 1, 1, 1,
1.429097, 1.935694, 0.5706804, 0, 0, 1, 1, 1,
1.429572, -0.0484708, 0.5770938, 1, 0, 0, 1, 1,
1.433887, -0.8299264, 4.028492, 1, 0, 0, 1, 1,
1.43594, 1.130197, 1.572105, 1, 0, 0, 1, 1,
1.446409, -1.401388, 3.476759, 1, 0, 0, 1, 1,
1.449782, 0.2837909, 1.057523, 1, 0, 0, 1, 1,
1.457204, -0.1609785, 0.9670562, 0, 0, 0, 1, 1,
1.486206, 1.694018, 1.932278, 0, 0, 0, 1, 1,
1.486317, 1.215006, 0.1679972, 0, 0, 0, 1, 1,
1.487401, 1.748602, 0.8810937, 0, 0, 0, 1, 1,
1.489697, -0.5945723, 0.1069365, 0, 0, 0, 1, 1,
1.502536, 0.4183476, 0.8475116, 0, 0, 0, 1, 1,
1.509849, -0.5326844, 0.9330021, 0, 0, 0, 1, 1,
1.509984, -0.3968658, 1.64131, 1, 1, 1, 1, 1,
1.515885, 0.5663634, -0.7910974, 1, 1, 1, 1, 1,
1.516074, -1.270735, 1.405578, 1, 1, 1, 1, 1,
1.537931, -0.9164747, 2.764282, 1, 1, 1, 1, 1,
1.548086, -0.936926, 3.195735, 1, 1, 1, 1, 1,
1.563441, -0.02307511, 1.650725, 1, 1, 1, 1, 1,
1.573362, 0.5665413, 1.74777, 1, 1, 1, 1, 1,
1.576086, -0.8917252, 1.077364, 1, 1, 1, 1, 1,
1.582211, -0.1252012, 0.557494, 1, 1, 1, 1, 1,
1.58428, -1.324343, 3.308144, 1, 1, 1, 1, 1,
1.597159, -0.02110034, 1.668054, 1, 1, 1, 1, 1,
1.601263, 1.756302, 1.145895, 1, 1, 1, 1, 1,
1.618641, -1.371383, 3.097011, 1, 1, 1, 1, 1,
1.622398, -0.05401327, 3.604206, 1, 1, 1, 1, 1,
1.661166, -2.887243, 2.511189, 1, 1, 1, 1, 1,
1.663293, 0.6184773, 0.1842885, 0, 0, 1, 1, 1,
1.665073, 0.1270721, 1.503713, 1, 0, 0, 1, 1,
1.665768, -0.5018864, 2.104805, 1, 0, 0, 1, 1,
1.705575, 1.04611, -0.1371518, 1, 0, 0, 1, 1,
1.735994, 0.9058579, 1.254741, 1, 0, 0, 1, 1,
1.748117, 0.4236417, 0.3104941, 1, 0, 0, 1, 1,
1.763441, -0.07936038, 1.99747, 0, 0, 0, 1, 1,
1.764336, 1.838307, 0.6990314, 0, 0, 0, 1, 1,
1.78045, -0.5613671, 2.073629, 0, 0, 0, 1, 1,
1.781605, 0.2966791, 1.054894, 0, 0, 0, 1, 1,
1.783893, -1.126498, 3.138142, 0, 0, 0, 1, 1,
1.784964, -1.664662, 1.75064, 0, 0, 0, 1, 1,
1.806852, -0.5062867, 1.861592, 0, 0, 0, 1, 1,
1.813099, -0.8454576, 1.993788, 1, 1, 1, 1, 1,
1.81563, -0.1914247, 2.24685, 1, 1, 1, 1, 1,
1.856351, -0.1682471, 1.26908, 1, 1, 1, 1, 1,
1.887244, 0.1335963, 1.15383, 1, 1, 1, 1, 1,
1.897583, 0.7862331, 1.9207, 1, 1, 1, 1, 1,
1.900021, 0.9369856, 1.526024, 1, 1, 1, 1, 1,
1.900114, 0.3698878, 2.716995, 1, 1, 1, 1, 1,
1.902465, 1.548183, 0.01467107, 1, 1, 1, 1, 1,
1.907157, 1.336408, 0.2907144, 1, 1, 1, 1, 1,
1.908859, -0.08754264, 0.265969, 1, 1, 1, 1, 1,
1.921741, -0.409442, 1.742834, 1, 1, 1, 1, 1,
1.931729, 2.495152, 0.7125092, 1, 1, 1, 1, 1,
1.932023, 0.3005138, 0.738806, 1, 1, 1, 1, 1,
1.933755, 0.9372227, 1.896494, 1, 1, 1, 1, 1,
1.944886, 0.9281924, 1.175657, 1, 1, 1, 1, 1,
1.960381, -0.4303312, 0.6202011, 0, 0, 1, 1, 1,
1.974303, -1.525394, 2.506738, 1, 0, 0, 1, 1,
1.998282, 0.5631298, 0.3366742, 1, 0, 0, 1, 1,
2.048843, -0.4596204, 2.352668, 1, 0, 0, 1, 1,
2.054265, 1.178465, 1.761317, 1, 0, 0, 1, 1,
2.064924, 0.4951515, 0.4768928, 1, 0, 0, 1, 1,
2.075741, -1.047689, 4.523069, 0, 0, 0, 1, 1,
2.084801, -1.374603, 1.337394, 0, 0, 0, 1, 1,
2.105912, -0.6607206, 1.692303, 0, 0, 0, 1, 1,
2.141547, -0.0722734, 2.374588, 0, 0, 0, 1, 1,
2.185196, 2.266559, -0.0934881, 0, 0, 0, 1, 1,
2.189568, 1.318086, 2.986176, 0, 0, 0, 1, 1,
2.229096, -1.074304, 1.201359, 0, 0, 0, 1, 1,
2.237806, 0.5505633, 2.1148, 1, 1, 1, 1, 1,
2.279548, 0.8573855, 2.654906, 1, 1, 1, 1, 1,
2.434133, 1.098474, 1.335318, 1, 1, 1, 1, 1,
2.739917, 0.4074506, 2.160003, 1, 1, 1, 1, 1,
2.76867, -0.8442898, 3.255275, 1, 1, 1, 1, 1,
3.003672, -0.5303476, 1.129264, 1, 1, 1, 1, 1,
3.593962, -0.4450454, 3.031702, 1, 1, 1, 1, 1
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
var radius = 9.702378;
var distance = 34.07919;
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
mvMatrix.translate( 0.01081419, 0.008048296, 0.2733045 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07919);
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
