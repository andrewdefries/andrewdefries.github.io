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
-3.602328, 0.09995354, -0.3017882, 1, 0, 0, 1,
-2.737146, -0.5715517, -4.184838, 1, 0.007843138, 0, 1,
-2.682785, -1.2385, -2.838622, 1, 0.01176471, 0, 1,
-2.640144, -0.8848294, -0.8503831, 1, 0.01960784, 0, 1,
-2.607931, 0.2491196, -2.196914, 1, 0.02352941, 0, 1,
-2.557922, -1.656101, -1.047974, 1, 0.03137255, 0, 1,
-2.423454, -0.3483847, -2.993528, 1, 0.03529412, 0, 1,
-2.399883, 1.597768, -1.858464, 1, 0.04313726, 0, 1,
-2.399876, 0.7579693, 0.8817143, 1, 0.04705882, 0, 1,
-2.370951, -0.3642671, -1.184672, 1, 0.05490196, 0, 1,
-2.3664, 0.5866306, 1.07818, 1, 0.05882353, 0, 1,
-2.358633, 1.534181, -0.9163433, 1, 0.06666667, 0, 1,
-2.352398, -1.814027, -0.795191, 1, 0.07058824, 0, 1,
-2.283535, 0.9939424, -1.007914, 1, 0.07843138, 0, 1,
-2.263444, -0.8505178, -2.978468, 1, 0.08235294, 0, 1,
-2.225456, 1.120264, -0.5137765, 1, 0.09019608, 0, 1,
-2.22212, -0.3937177, -1.701538, 1, 0.09411765, 0, 1,
-2.144757, 0.7621859, 0.2035393, 1, 0.1019608, 0, 1,
-2.136559, 0.4226072, -2.105547, 1, 0.1098039, 0, 1,
-2.068141, 0.2221613, -0.3669502, 1, 0.1137255, 0, 1,
-2.018098, 0.347724, -1.566781, 1, 0.1215686, 0, 1,
-2.001555, 0.8696046, -1.22146, 1, 0.1254902, 0, 1,
-2.000825, 1.032278, -1.573343, 1, 0.1333333, 0, 1,
-1.994944, 1.29563, -0.9847368, 1, 0.1372549, 0, 1,
-1.970845, -0.4462215, -1.980218, 1, 0.145098, 0, 1,
-1.952221, 0.6199508, -0.7049903, 1, 0.1490196, 0, 1,
-1.942979, -0.2390212, -1.317988, 1, 0.1568628, 0, 1,
-1.94241, 1.141171, -0.6464605, 1, 0.1607843, 0, 1,
-1.93905, -0.6936077, -2.196391, 1, 0.1686275, 0, 1,
-1.930257, -1.628882, -2.708705, 1, 0.172549, 0, 1,
-1.928326, -0.4779383, -3.451827, 1, 0.1803922, 0, 1,
-1.924538, 0.512832, -1.627146, 1, 0.1843137, 0, 1,
-1.918663, -0.6210856, -3.172646, 1, 0.1921569, 0, 1,
-1.898079, -0.8573661, -2.391158, 1, 0.1960784, 0, 1,
-1.886342, 0.2490021, -1.375471, 1, 0.2039216, 0, 1,
-1.882763, -0.7101031, -2.111448, 1, 0.2117647, 0, 1,
-1.875197, 0.3768938, -1.60115, 1, 0.2156863, 0, 1,
-1.874572, 1.74772, -2.095225, 1, 0.2235294, 0, 1,
-1.842126, -2.386447, -2.369771, 1, 0.227451, 0, 1,
-1.841659, 0.6046389, -2.049002, 1, 0.2352941, 0, 1,
-1.827379, 0.207561, -0.2529194, 1, 0.2392157, 0, 1,
-1.811136, 0.09256969, -0.005483031, 1, 0.2470588, 0, 1,
-1.809884, 1.694809, -0.1745024, 1, 0.2509804, 0, 1,
-1.785332, -0.3624281, -1.380728, 1, 0.2588235, 0, 1,
-1.758461, 0.9721076, -0.8390235, 1, 0.2627451, 0, 1,
-1.719106, -0.3596532, -0.8070582, 1, 0.2705882, 0, 1,
-1.715188, -1.62625, -2.871415, 1, 0.2745098, 0, 1,
-1.71177, 1.887439, -0.1049143, 1, 0.282353, 0, 1,
-1.705717, -0.6533349, -2.9053, 1, 0.2862745, 0, 1,
-1.696347, -0.4725298, -1.870219, 1, 0.2941177, 0, 1,
-1.684815, -0.08435865, -0.8989856, 1, 0.3019608, 0, 1,
-1.665268, 1.077671, -1.562995, 1, 0.3058824, 0, 1,
-1.663468, 1.576978, -0.388746, 1, 0.3137255, 0, 1,
-1.64684, -1.94631, -1.33579, 1, 0.3176471, 0, 1,
-1.606262, 0.871978, -0.4436774, 1, 0.3254902, 0, 1,
-1.605988, 0.0229552, -2.282278, 1, 0.3294118, 0, 1,
-1.605864, -2.274062, -2.257243, 1, 0.3372549, 0, 1,
-1.601311, 0.2547575, -2.22218, 1, 0.3411765, 0, 1,
-1.59431, -1.560043, -1.910571, 1, 0.3490196, 0, 1,
-1.586195, 0.1214942, -1.328187, 1, 0.3529412, 0, 1,
-1.569788, 1.813231, -0.9858024, 1, 0.3607843, 0, 1,
-1.567405, -1.592723, -2.154312, 1, 0.3647059, 0, 1,
-1.561771, 1.37557, -2.470215, 1, 0.372549, 0, 1,
-1.56091, -1.323446, -2.422608, 1, 0.3764706, 0, 1,
-1.55173, -0.2070345, -1.020058, 1, 0.3843137, 0, 1,
-1.542702, -1.364435, -3.059899, 1, 0.3882353, 0, 1,
-1.531124, 0.7715267, -0.8736464, 1, 0.3960784, 0, 1,
-1.530818, 2.01239, 0.4649935, 1, 0.4039216, 0, 1,
-1.527879, 0.8687398, -0.5026017, 1, 0.4078431, 0, 1,
-1.523375, 0.9312633, -0.5959765, 1, 0.4156863, 0, 1,
-1.520913, 0.1017279, -0.7287436, 1, 0.4196078, 0, 1,
-1.517156, -1.190679, -4.238322, 1, 0.427451, 0, 1,
-1.506141, -0.4538211, -2.147005, 1, 0.4313726, 0, 1,
-1.503217, 0.172652, -0.9498593, 1, 0.4392157, 0, 1,
-1.48346, -0.452425, -2.740127, 1, 0.4431373, 0, 1,
-1.481537, -1.34953, -3.798067, 1, 0.4509804, 0, 1,
-1.472348, -2.12311, -2.795085, 1, 0.454902, 0, 1,
-1.472331, -0.1410654, 0.09605695, 1, 0.4627451, 0, 1,
-1.471974, 0.3219843, 1.119542, 1, 0.4666667, 0, 1,
-1.468399, 1.494133, -0.6310938, 1, 0.4745098, 0, 1,
-1.465422, 0.8859849, -0.7909907, 1, 0.4784314, 0, 1,
-1.461725, -1.526017, -1.697816, 1, 0.4862745, 0, 1,
-1.440037, -1.731118, -2.364144, 1, 0.4901961, 0, 1,
-1.437314, 1.597841, -1.512503, 1, 0.4980392, 0, 1,
-1.430884, -0.5632787, -2.795476, 1, 0.5058824, 0, 1,
-1.428313, 0.8247141, 1.283407, 1, 0.509804, 0, 1,
-1.425122, 0.07111477, -0.3239709, 1, 0.5176471, 0, 1,
-1.418871, -0.2047412, -2.336833, 1, 0.5215687, 0, 1,
-1.418599, 0.3942011, 0.05864681, 1, 0.5294118, 0, 1,
-1.388246, 0.1088697, -0.4399354, 1, 0.5333334, 0, 1,
-1.369944, 1.158246, -0.7430304, 1, 0.5411765, 0, 1,
-1.363517, 0.9064685, -0.3826378, 1, 0.5450981, 0, 1,
-1.357262, -0.2783493, 0.2787013, 1, 0.5529412, 0, 1,
-1.355232, 0.1913351, -1.043868, 1, 0.5568628, 0, 1,
-1.347516, 0.5148002, -1.130451, 1, 0.5647059, 0, 1,
-1.346396, -0.2000031, -3.783458, 1, 0.5686275, 0, 1,
-1.340669, 1.610491, -1.615924, 1, 0.5764706, 0, 1,
-1.340178, -0.7764048, -3.623515, 1, 0.5803922, 0, 1,
-1.335624, 1.437698, -0.6186536, 1, 0.5882353, 0, 1,
-1.335163, -0.6207799, -1.918066, 1, 0.5921569, 0, 1,
-1.305831, 0.6411706, -2.201187, 1, 0.6, 0, 1,
-1.303903, -1.053123, -3.640593, 1, 0.6078432, 0, 1,
-1.290662, 0.9667668, -1.29912, 1, 0.6117647, 0, 1,
-1.28408, 0.2463581, -1.025493, 1, 0.6196079, 0, 1,
-1.281254, 0.2323395, -2.089879, 1, 0.6235294, 0, 1,
-1.279012, -0.06878208, -0.4749243, 1, 0.6313726, 0, 1,
-1.26794, 0.006194769, -2.518796, 1, 0.6352941, 0, 1,
-1.266892, -1.341795, -2.778011, 1, 0.6431373, 0, 1,
-1.266152, -1.380283, -3.17163, 1, 0.6470588, 0, 1,
-1.26612, -0.5114067, -0.9904479, 1, 0.654902, 0, 1,
-1.265615, -0.07564405, -2.241758, 1, 0.6588235, 0, 1,
-1.260028, -1.966752, -1.56984, 1, 0.6666667, 0, 1,
-1.259657, -0.7033966, -2.595545, 1, 0.6705883, 0, 1,
-1.251269, 0.1710111, -1.20866, 1, 0.6784314, 0, 1,
-1.238758, -0.2318085, -3.057633, 1, 0.682353, 0, 1,
-1.234006, -0.08557224, 0.09917883, 1, 0.6901961, 0, 1,
-1.230368, -1.047251, -3.13018, 1, 0.6941177, 0, 1,
-1.229257, -3.648135, -3.572039, 1, 0.7019608, 0, 1,
-1.224482, 0.6756103, -0.6625418, 1, 0.7098039, 0, 1,
-1.207215, 1.05988, -1.881114, 1, 0.7137255, 0, 1,
-1.207103, -1.53591, -0.1162502, 1, 0.7215686, 0, 1,
-1.201217, 0.02037335, -2.088847, 1, 0.7254902, 0, 1,
-1.199244, -0.686998, -1.699908, 1, 0.7333333, 0, 1,
-1.19472, -0.2143512, -1.601621, 1, 0.7372549, 0, 1,
-1.184362, 1.128352e-05, 0.03111955, 1, 0.7450981, 0, 1,
-1.182685, 2.354428, -0.4259474, 1, 0.7490196, 0, 1,
-1.179366, 0.2295953, -1.721619, 1, 0.7568628, 0, 1,
-1.177778, 1.105614, -1.083008, 1, 0.7607843, 0, 1,
-1.174619, 1.402271, -0.221837, 1, 0.7686275, 0, 1,
-1.173143, -2.165653, -2.223604, 1, 0.772549, 0, 1,
-1.16998, -0.316169, -0.05255123, 1, 0.7803922, 0, 1,
-1.168347, -0.3961278, -2.769028, 1, 0.7843137, 0, 1,
-1.153497, 0.0393952, -1.856916, 1, 0.7921569, 0, 1,
-1.150478, -0.6815099, -0.4116104, 1, 0.7960784, 0, 1,
-1.149069, -1.306786, -0.572271, 1, 0.8039216, 0, 1,
-1.143408, 0.3207752, -1.95879, 1, 0.8117647, 0, 1,
-1.132767, -0.712424, -4.174682, 1, 0.8156863, 0, 1,
-1.132069, 1.124431, -0.5423064, 1, 0.8235294, 0, 1,
-1.128846, 0.3012789, -0.2300867, 1, 0.827451, 0, 1,
-1.127648, -0.8896633, -1.604455, 1, 0.8352941, 0, 1,
-1.123517, 0.3632092, -2.095378, 1, 0.8392157, 0, 1,
-1.121889, -0.9018179, -1.074077, 1, 0.8470588, 0, 1,
-1.121309, -0.2528716, -2.101202, 1, 0.8509804, 0, 1,
-1.119008, -0.1228614, -2.227439, 1, 0.8588235, 0, 1,
-1.11214, 0.4820187, 0.2507237, 1, 0.8627451, 0, 1,
-1.110355, -0.6855711, -3.156724, 1, 0.8705882, 0, 1,
-1.110197, -0.2367191, -2.085929, 1, 0.8745098, 0, 1,
-1.109844, -1.425143, -2.497661, 1, 0.8823529, 0, 1,
-1.094069, -1.430184, -1.395202, 1, 0.8862745, 0, 1,
-1.080453, 0.948681, -0.1598927, 1, 0.8941177, 0, 1,
-1.07058, -0.1282718, -2.038492, 1, 0.8980392, 0, 1,
-1.067215, -0.009126975, -0.9098085, 1, 0.9058824, 0, 1,
-1.066814, 0.3324731, -1.433247, 1, 0.9137255, 0, 1,
-1.066812, 0.1844334, -0.8761348, 1, 0.9176471, 0, 1,
-1.065246, -1.334723, -3.612818, 1, 0.9254902, 0, 1,
-1.064318, -0.9082457, -3.479619, 1, 0.9294118, 0, 1,
-1.058295, 0.1840761, -1.407129, 1, 0.9372549, 0, 1,
-1.054523, 1.033915, -1.440405, 1, 0.9411765, 0, 1,
-1.04489, 0.635995, -2.877264, 1, 0.9490196, 0, 1,
-1.043125, -1.85858, -0.5122696, 1, 0.9529412, 0, 1,
-1.041677, -0.7492191, -0.3758995, 1, 0.9607843, 0, 1,
-1.027866, 0.4182985, -2.255599, 1, 0.9647059, 0, 1,
-1.025653, 1.132144, 0.6112971, 1, 0.972549, 0, 1,
-1.024839, 2.315872, -0.0868246, 1, 0.9764706, 0, 1,
-1.022571, 0.5291108, -1.242828, 1, 0.9843137, 0, 1,
-1.019466, -1.518605, -3.103461, 1, 0.9882353, 0, 1,
-1.007281, 1.351006, 0.1607778, 1, 0.9960784, 0, 1,
-0.9944974, 0.4943724, -0.8274946, 0.9960784, 1, 0, 1,
-0.9888592, -0.7451109, -1.784544, 0.9921569, 1, 0, 1,
-0.9881484, 0.7376911, -1.1779, 0.9843137, 1, 0, 1,
-0.9851925, -0.1283177, -1.23054, 0.9803922, 1, 0, 1,
-0.9846304, -0.4311775, -1.660334, 0.972549, 1, 0, 1,
-0.9690572, -1.759344, -1.726434, 0.9686275, 1, 0, 1,
-0.9656599, -1.056654, -4.137477, 0.9607843, 1, 0, 1,
-0.9609706, -0.5613796, -1.920349, 0.9568627, 1, 0, 1,
-0.957309, -1.599262, -1.814189, 0.9490196, 1, 0, 1,
-0.9542645, 0.902939, 0.8488524, 0.945098, 1, 0, 1,
-0.9525765, -1.244295, -3.676348, 0.9372549, 1, 0, 1,
-0.9509376, 0.2665589, -1.977365, 0.9333333, 1, 0, 1,
-0.9349518, 0.9246801, -0.5721357, 0.9254902, 1, 0, 1,
-0.9311234, -1.596942, -1.666728, 0.9215686, 1, 0, 1,
-0.9283389, -1.010519, -0.6892598, 0.9137255, 1, 0, 1,
-0.92805, -1.444346, -3.061526, 0.9098039, 1, 0, 1,
-0.909426, -0.01641756, -1.19571, 0.9019608, 1, 0, 1,
-0.9074134, -0.4467671, -2.494372, 0.8941177, 1, 0, 1,
-0.9018251, 0.5197892, -0.7824403, 0.8901961, 1, 0, 1,
-0.9000968, -0.1558011, -1.171162, 0.8823529, 1, 0, 1,
-0.8917794, -2.131339, -1.458467, 0.8784314, 1, 0, 1,
-0.8854411, -0.1150215, -2.090559, 0.8705882, 1, 0, 1,
-0.8826692, 1.356094, -0.02406339, 0.8666667, 1, 0, 1,
-0.8746353, -0.3578112, -1.202137, 0.8588235, 1, 0, 1,
-0.8744625, -0.1290339, -2.39794, 0.854902, 1, 0, 1,
-0.8725162, -0.8160254, -3.020445, 0.8470588, 1, 0, 1,
-0.8684362, -0.1469557, -2.936466, 0.8431373, 1, 0, 1,
-0.8650515, -0.1038957, -1.153655, 0.8352941, 1, 0, 1,
-0.8577206, -1.739291, -2.677601, 0.8313726, 1, 0, 1,
-0.8497426, 1.013693, -0.7163975, 0.8235294, 1, 0, 1,
-0.846499, -0.3187816, -2.758779, 0.8196079, 1, 0, 1,
-0.8454688, 2.542981, -0.5099136, 0.8117647, 1, 0, 1,
-0.8314772, -0.4764911, -1.141279, 0.8078431, 1, 0, 1,
-0.8283045, -0.2339827, -2.532174, 0.8, 1, 0, 1,
-0.8223988, -0.5383282, -1.956791, 0.7921569, 1, 0, 1,
-0.8221738, -1.371213, -1.743388, 0.7882353, 1, 0, 1,
-0.8211927, 0.4493569, -0.6737061, 0.7803922, 1, 0, 1,
-0.816065, 0.8961443, -2.431765, 0.7764706, 1, 0, 1,
-0.8109496, 1.261811, 0.3121905, 0.7686275, 1, 0, 1,
-0.8085974, 1.280934, -0.5532504, 0.7647059, 1, 0, 1,
-0.8067355, 0.1079621, -3.487858, 0.7568628, 1, 0, 1,
-0.8054572, 2.068561, -0.5555026, 0.7529412, 1, 0, 1,
-0.8023342, 1.030777, 0.4043433, 0.7450981, 1, 0, 1,
-0.8001078, -1.189881, -0.5023935, 0.7411765, 1, 0, 1,
-0.800041, 0.2924595, 0.4079786, 0.7333333, 1, 0, 1,
-0.8000351, 0.6447766, -0.01555412, 0.7294118, 1, 0, 1,
-0.799117, 0.7749333, -1.114461, 0.7215686, 1, 0, 1,
-0.7980607, 0.6568668, 0.4861656, 0.7176471, 1, 0, 1,
-0.7922469, 0.755363, -1.825024, 0.7098039, 1, 0, 1,
-0.7895485, -0.2869561, -3.339219, 0.7058824, 1, 0, 1,
-0.7885755, -0.4830325, -2.378871, 0.6980392, 1, 0, 1,
-0.7841405, -0.9912343, -1.598076, 0.6901961, 1, 0, 1,
-0.7823496, -0.3957419, -0.5646262, 0.6862745, 1, 0, 1,
-0.7744184, 1.785409, -0.9527937, 0.6784314, 1, 0, 1,
-0.7724501, 0.04616762, -1.90754, 0.6745098, 1, 0, 1,
-0.7678429, 1.603467, -0.2769669, 0.6666667, 1, 0, 1,
-0.7651278, 0.6442897, -0.2240013, 0.6627451, 1, 0, 1,
-0.7633909, 1.036404, -0.8286579, 0.654902, 1, 0, 1,
-0.7603464, 0.8988433, -1.578515, 0.6509804, 1, 0, 1,
-0.7551346, -0.8483983, -2.450804, 0.6431373, 1, 0, 1,
-0.7546595, -1.234405, -1.932661, 0.6392157, 1, 0, 1,
-0.7537208, -1.59314, -2.148189, 0.6313726, 1, 0, 1,
-0.7491709, 0.9080315, -1.714805, 0.627451, 1, 0, 1,
-0.7428015, -0.3135708, -2.280094, 0.6196079, 1, 0, 1,
-0.7424312, 0.08523329, -2.027014, 0.6156863, 1, 0, 1,
-0.7424061, 0.8113121, -1.305452, 0.6078432, 1, 0, 1,
-0.7414541, -0.07399046, -2.432474, 0.6039216, 1, 0, 1,
-0.740584, -1.119685, -3.196539, 0.5960785, 1, 0, 1,
-0.7404641, -0.03287437, -4.076463, 0.5882353, 1, 0, 1,
-0.7384134, -0.1836777, -0.4773531, 0.5843138, 1, 0, 1,
-0.7328986, 0.5300557, -1.583073, 0.5764706, 1, 0, 1,
-0.7308601, -2.227994, -3.649388, 0.572549, 1, 0, 1,
-0.7296467, -0.8689551, -1.990422, 0.5647059, 1, 0, 1,
-0.7287705, 1.312845, -0.956473, 0.5607843, 1, 0, 1,
-0.725562, 0.1399979, -2.971566, 0.5529412, 1, 0, 1,
-0.7251888, -2.328136, -3.302635, 0.5490196, 1, 0, 1,
-0.7250249, 1.218744, -1.355726, 0.5411765, 1, 0, 1,
-0.7237843, 1.8527, 0.6990515, 0.5372549, 1, 0, 1,
-0.720729, 1.883933, -0.8558772, 0.5294118, 1, 0, 1,
-0.7137755, 0.4958121, 0.1495796, 0.5254902, 1, 0, 1,
-0.7122881, 1.563647, 1.036276, 0.5176471, 1, 0, 1,
-0.7052846, 0.44515, 1.654092, 0.5137255, 1, 0, 1,
-0.7039629, -0.5498691, -4.332697, 0.5058824, 1, 0, 1,
-0.7025793, 0.1663027, -2.637042, 0.5019608, 1, 0, 1,
-0.6909965, -1.59445, -3.787217, 0.4941176, 1, 0, 1,
-0.690061, -1.317749, -3.792882, 0.4862745, 1, 0, 1,
-0.6823369, -0.8450446, -3.363902, 0.4823529, 1, 0, 1,
-0.6790354, 0.3225204, 0.5600021, 0.4745098, 1, 0, 1,
-0.6773783, -0.3804241, -1.443245, 0.4705882, 1, 0, 1,
-0.6756563, 0.5650663, 0.3790012, 0.4627451, 1, 0, 1,
-0.6753846, 0.0673618, -0.3617196, 0.4588235, 1, 0, 1,
-0.6743723, 0.6568161, -0.9147339, 0.4509804, 1, 0, 1,
-0.6743466, 0.7765693, 0.3195252, 0.4470588, 1, 0, 1,
-0.6712095, -0.19578, -1.934913, 0.4392157, 1, 0, 1,
-0.6685923, 0.4827906, -1.419034, 0.4352941, 1, 0, 1,
-0.6667638, 1.863862, 0.1270174, 0.427451, 1, 0, 1,
-0.6623194, -1.524553, -3.902027, 0.4235294, 1, 0, 1,
-0.6622853, -0.2496151, -1.857536, 0.4156863, 1, 0, 1,
-0.6622426, -0.8964917, -3.337897, 0.4117647, 1, 0, 1,
-0.6555883, -0.7470936, -2.813376, 0.4039216, 1, 0, 1,
-0.6548873, -1.044085, -3.423318, 0.3960784, 1, 0, 1,
-0.6472011, 0.7931061, 0.1631987, 0.3921569, 1, 0, 1,
-0.6443551, 0.4235869, -0.4231952, 0.3843137, 1, 0, 1,
-0.6427966, 2.314828, 0.6735699, 0.3803922, 1, 0, 1,
-0.6405302, -0.1841104, -1.900617, 0.372549, 1, 0, 1,
-0.637537, -0.4684484, -1.730347, 0.3686275, 1, 0, 1,
-0.6359298, -0.1073819, -1.550473, 0.3607843, 1, 0, 1,
-0.6348572, 0.5628623, -1.622915, 0.3568628, 1, 0, 1,
-0.6335567, 0.6704734, -0.8849422, 0.3490196, 1, 0, 1,
-0.6315768, -0.2609755, -2.360835, 0.345098, 1, 0, 1,
-0.6211731, -1.511849, -3.205504, 0.3372549, 1, 0, 1,
-0.6195036, 0.8755203, -0.826955, 0.3333333, 1, 0, 1,
-0.6131551, -0.7604222, -1.855009, 0.3254902, 1, 0, 1,
-0.6096175, -0.260606, -1.14484, 0.3215686, 1, 0, 1,
-0.60434, 0.4347029, -1.768905, 0.3137255, 1, 0, 1,
-0.6026228, 0.3351079, -1.739533, 0.3098039, 1, 0, 1,
-0.5943579, -0.764467, -3.597552, 0.3019608, 1, 0, 1,
-0.5937217, 0.06453369, -1.624905, 0.2941177, 1, 0, 1,
-0.591869, -1.25394, -2.164012, 0.2901961, 1, 0, 1,
-0.5862298, -0.108989, 0.08761601, 0.282353, 1, 0, 1,
-0.5831411, 0.3185554, -0.8993027, 0.2784314, 1, 0, 1,
-0.5830942, 1.235489, -2.493927, 0.2705882, 1, 0, 1,
-0.5744777, -0.4276003, -2.387164, 0.2666667, 1, 0, 1,
-0.573745, -0.2797581, -1.360873, 0.2588235, 1, 0, 1,
-0.5730001, 0.07195108, -1.765143, 0.254902, 1, 0, 1,
-0.56902, -0.8476976, -0.7504597, 0.2470588, 1, 0, 1,
-0.5677117, -0.1668507, -1.760603, 0.2431373, 1, 0, 1,
-0.5669634, 2.705464, 2.252351, 0.2352941, 1, 0, 1,
-0.5504847, -0.2887687, -1.534501, 0.2313726, 1, 0, 1,
-0.5461758, 1.50744, -1.829643, 0.2235294, 1, 0, 1,
-0.5408899, -0.004245392, -2.198512, 0.2196078, 1, 0, 1,
-0.5397916, -0.1534949, -2.883224, 0.2117647, 1, 0, 1,
-0.533684, 0.4658154, -2.469023, 0.2078431, 1, 0, 1,
-0.5174384, 2.384551, 0.4352493, 0.2, 1, 0, 1,
-0.5134892, 0.55771, -0.597343, 0.1921569, 1, 0, 1,
-0.5133116, -2.043753, -4.079905, 0.1882353, 1, 0, 1,
-0.5128615, 0.05103812, -1.734729, 0.1803922, 1, 0, 1,
-0.512688, 2.141619, 0.5243647, 0.1764706, 1, 0, 1,
-0.5061199, 0.9203856, -1.656189, 0.1686275, 1, 0, 1,
-0.5051935, 1.38643, -0.6239568, 0.1647059, 1, 0, 1,
-0.4995666, -0.9275604, -0.9104704, 0.1568628, 1, 0, 1,
-0.4990523, -0.1428357, -1.615983, 0.1529412, 1, 0, 1,
-0.4960446, -2.729006, -3.50206, 0.145098, 1, 0, 1,
-0.4926144, 0.8852146, 0.528089, 0.1411765, 1, 0, 1,
-0.4892572, -0.216424, -1.970252, 0.1333333, 1, 0, 1,
-0.4883084, 1.067518, 0.7477635, 0.1294118, 1, 0, 1,
-0.4852371, -0.1818655, -1.27767, 0.1215686, 1, 0, 1,
-0.4844724, 0.3210894, -1.475788, 0.1176471, 1, 0, 1,
-0.4836295, -1.599363, -3.293086, 0.1098039, 1, 0, 1,
-0.482717, 0.6457849, -1.882333, 0.1058824, 1, 0, 1,
-0.480622, 0.7907007, -2.039978, 0.09803922, 1, 0, 1,
-0.4797879, -0.8760947, -4.673884, 0.09019608, 1, 0, 1,
-0.4795584, -1.915868, -2.492509, 0.08627451, 1, 0, 1,
-0.4768078, -0.2423892, -1.657588, 0.07843138, 1, 0, 1,
-0.4702209, 0.8621585, -1.580629, 0.07450981, 1, 0, 1,
-0.4673598, -0.08946391, -1.294661, 0.06666667, 1, 0, 1,
-0.4628457, 0.5148457, -0.4702612, 0.0627451, 1, 0, 1,
-0.4613564, -0.6386889, -3.041944, 0.05490196, 1, 0, 1,
-0.4559155, -0.5472214, -3.120572, 0.05098039, 1, 0, 1,
-0.453057, -0.1652114, -2.067007, 0.04313726, 1, 0, 1,
-0.4525282, -0.1325026, -2.12745, 0.03921569, 1, 0, 1,
-0.4500588, 0.8548408, -2.053659, 0.03137255, 1, 0, 1,
-0.4497579, 1.097579, 0.4208015, 0.02745098, 1, 0, 1,
-0.4456427, 0.8235412, -0.1892099, 0.01960784, 1, 0, 1,
-0.4395747, 1.593423, 0.1183379, 0.01568628, 1, 0, 1,
-0.4323759, 1.096742, -0.03064106, 0.007843138, 1, 0, 1,
-0.4321827, 0.3619057, 0.7019114, 0.003921569, 1, 0, 1,
-0.4320693, 0.3544396, -0.4786467, 0, 1, 0.003921569, 1,
-0.431212, -0.2247208, -1.414977, 0, 1, 0.01176471, 1,
-0.4303483, 0.7862297, -1.639697, 0, 1, 0.01568628, 1,
-0.4282572, 1.422539, -0.1322133, 0, 1, 0.02352941, 1,
-0.4276152, -0.326614, -2.429144, 0, 1, 0.02745098, 1,
-0.4217416, -0.9050305, -1.254448, 0, 1, 0.03529412, 1,
-0.4196496, 2.225554, -0.3677014, 0, 1, 0.03921569, 1,
-0.4176429, -0.8450704, -4.120184, 0, 1, 0.04705882, 1,
-0.4147136, -0.5563663, -1.839105, 0, 1, 0.05098039, 1,
-0.4146075, -0.1885314, -3.412086, 0, 1, 0.05882353, 1,
-0.4130135, 0.09516826, -1.562836, 0, 1, 0.0627451, 1,
-0.4094308, -0.06664582, -0.6380545, 0, 1, 0.07058824, 1,
-0.409223, -0.3342772, -2.340811, 0, 1, 0.07450981, 1,
-0.405771, -0.5262902, -2.147445, 0, 1, 0.08235294, 1,
-0.3992489, 0.1435507, -1.38717, 0, 1, 0.08627451, 1,
-0.3967391, 0.5442138, -2.367763, 0, 1, 0.09411765, 1,
-0.3913027, -2.086626, -2.494833, 0, 1, 0.1019608, 1,
-0.389679, 1.118625, -0.9541701, 0, 1, 0.1058824, 1,
-0.3842303, 1.32044, -0.354872, 0, 1, 0.1137255, 1,
-0.3776363, -0.6269579, -1.255387, 0, 1, 0.1176471, 1,
-0.3751121, -2.00605, -1.991987, 0, 1, 0.1254902, 1,
-0.3742687, -1.167516, -4.314728, 0, 1, 0.1294118, 1,
-0.3733536, -0.4118085, -2.58146, 0, 1, 0.1372549, 1,
-0.3708245, -1.514323, -1.695342, 0, 1, 0.1411765, 1,
-0.3691671, 0.7276407, -1.537242, 0, 1, 0.1490196, 1,
-0.3571427, -0.221037, -1.306055, 0, 1, 0.1529412, 1,
-0.3564487, -0.6126951, -2.385792, 0, 1, 0.1607843, 1,
-0.3555751, 0.08579268, -2.222362, 0, 1, 0.1647059, 1,
-0.3548104, -1.519885, -2.089068, 0, 1, 0.172549, 1,
-0.3514782, -0.7851781, -3.851698, 0, 1, 0.1764706, 1,
-0.3485959, 0.5347247, -2.356413, 0, 1, 0.1843137, 1,
-0.3458019, -0.7780123, -1.850155, 0, 1, 0.1882353, 1,
-0.3322395, -0.5359675, -2.167214, 0, 1, 0.1960784, 1,
-0.3305835, -0.870705, -2.600261, 0, 1, 0.2039216, 1,
-0.3298255, -1.070375, -3.606796, 0, 1, 0.2078431, 1,
-0.3282673, 0.3955566, 0.03438053, 0, 1, 0.2156863, 1,
-0.3282003, -0.006799157, -0.3563251, 0, 1, 0.2196078, 1,
-0.3261016, -1.540817, -2.801739, 0, 1, 0.227451, 1,
-0.3251233, -0.2059591, -2.111494, 0, 1, 0.2313726, 1,
-0.3220082, 0.6305912, -0.4680295, 0, 1, 0.2392157, 1,
-0.3205432, 0.6193317, -0.1019099, 0, 1, 0.2431373, 1,
-0.3159553, 1.465637, -1.137887, 0, 1, 0.2509804, 1,
-0.3124975, 0.4362515, -2.88869, 0, 1, 0.254902, 1,
-0.3121762, 0.9054781, -1.43573, 0, 1, 0.2627451, 1,
-0.3049997, 0.6728066, -0.3657958, 0, 1, 0.2666667, 1,
-0.3030909, -1.782085, -3.671607, 0, 1, 0.2745098, 1,
-0.3009408, 0.009662006, -1.99003, 0, 1, 0.2784314, 1,
-0.2981335, -1.169823, -3.744038, 0, 1, 0.2862745, 1,
-0.293336, -0.3651419, -2.764893, 0, 1, 0.2901961, 1,
-0.2927214, 0.5190557, -1.231072, 0, 1, 0.2980392, 1,
-0.2909192, 0.1056435, 0.8627329, 0, 1, 0.3058824, 1,
-0.2853867, -0.003768738, -2.577793, 0, 1, 0.3098039, 1,
-0.2846945, -0.1565047, -2.974592, 0, 1, 0.3176471, 1,
-0.2836541, -0.07735746, -3.052929, 0, 1, 0.3215686, 1,
-0.2819933, -1.005957, -5.169633, 0, 1, 0.3294118, 1,
-0.2779322, 1.446209, -0.900478, 0, 1, 0.3333333, 1,
-0.2761304, -0.2332583, -3.420125, 0, 1, 0.3411765, 1,
-0.275963, -0.1887198, -1.733513, 0, 1, 0.345098, 1,
-0.2660405, 0.7584768, -0.08563147, 0, 1, 0.3529412, 1,
-0.2621564, -1.179243, -3.024523, 0, 1, 0.3568628, 1,
-0.260967, 0.1879047, -2.25437, 0, 1, 0.3647059, 1,
-0.2585061, -0.2946319, -2.461047, 0, 1, 0.3686275, 1,
-0.2578647, -1.289897, -3.59474, 0, 1, 0.3764706, 1,
-0.2577668, -0.7709314, -2.964026, 0, 1, 0.3803922, 1,
-0.2567731, 1.45245, -0.604062, 0, 1, 0.3882353, 1,
-0.2566893, 0.441003, -0.02960123, 0, 1, 0.3921569, 1,
-0.2506512, -0.9080479, -2.338821, 0, 1, 0.4, 1,
-0.2497461, -0.06489353, -3.690831, 0, 1, 0.4078431, 1,
-0.2394141, -0.1701349, -2.51508, 0, 1, 0.4117647, 1,
-0.2342715, 0.04474188, -2.060924, 0, 1, 0.4196078, 1,
-0.2298669, 0.6332601, 0.8262157, 0, 1, 0.4235294, 1,
-0.2269718, 0.6482961, 1.169207, 0, 1, 0.4313726, 1,
-0.2203351, -1.650714, -3.622015, 0, 1, 0.4352941, 1,
-0.2182966, 1.092555, 0.4462653, 0, 1, 0.4431373, 1,
-0.2182748, -0.1193769, -3.245717, 0, 1, 0.4470588, 1,
-0.2179077, -0.3312073, -1.867939, 0, 1, 0.454902, 1,
-0.2178065, 1.812007, -0.1083443, 0, 1, 0.4588235, 1,
-0.2174764, -0.8402026, -3.462484, 0, 1, 0.4666667, 1,
-0.2154858, 1.92707, -1.588199, 0, 1, 0.4705882, 1,
-0.2027176, -0.5697197, -0.8924791, 0, 1, 0.4784314, 1,
-0.2018618, 0.6192215, 0.1946076, 0, 1, 0.4823529, 1,
-0.2010703, 0.9848629, -0.5719742, 0, 1, 0.4901961, 1,
-0.197566, 0.8321906, -0.3399485, 0, 1, 0.4941176, 1,
-0.1921163, -0.5481768, -3.919029, 0, 1, 0.5019608, 1,
-0.1908693, 1.13787, -1.024537, 0, 1, 0.509804, 1,
-0.1862932, 0.2579748, -0.03999263, 0, 1, 0.5137255, 1,
-0.1819297, -1.752206, -1.845691, 0, 1, 0.5215687, 1,
-0.1813124, -1.907339, -2.629056, 0, 1, 0.5254902, 1,
-0.1758177, -0.4572987, -2.169583, 0, 1, 0.5333334, 1,
-0.1745259, 0.9381794, -1.255665, 0, 1, 0.5372549, 1,
-0.1700236, 0.9586506, -1.058808, 0, 1, 0.5450981, 1,
-0.1673489, -0.2432147, -2.333416, 0, 1, 0.5490196, 1,
-0.1672337, 1.177273, 1.531049, 0, 1, 0.5568628, 1,
-0.1667564, -0.01430579, -1.886369, 0, 1, 0.5607843, 1,
-0.1665112, -1.766428, -4.095984, 0, 1, 0.5686275, 1,
-0.1658331, 2.259001, -1.114342, 0, 1, 0.572549, 1,
-0.1596853, 1.820387, 0.8673871, 0, 1, 0.5803922, 1,
-0.1561285, -0.05578602, -3.607301, 0, 1, 0.5843138, 1,
-0.1533681, 0.9403909, 1.195357, 0, 1, 0.5921569, 1,
-0.1531266, -1.000912, -4.395506, 0, 1, 0.5960785, 1,
-0.1519267, 1.545535, 0.2091035, 0, 1, 0.6039216, 1,
-0.1516225, 0.131177, -1.269235, 0, 1, 0.6117647, 1,
-0.1507266, 1.002259, 1.952324, 0, 1, 0.6156863, 1,
-0.1479985, 0.1373078, 0.8389198, 0, 1, 0.6235294, 1,
-0.1457532, 0.3228191, -1.130321, 0, 1, 0.627451, 1,
-0.1423811, 0.5374812, -0.9738824, 0, 1, 0.6352941, 1,
-0.1418789, -0.0006573456, -2.581042, 0, 1, 0.6392157, 1,
-0.140244, -0.02872763, -2.03326, 0, 1, 0.6470588, 1,
-0.1388003, -3.118508, -4.096597, 0, 1, 0.6509804, 1,
-0.1346161, -1.282858, -3.109397, 0, 1, 0.6588235, 1,
-0.1306561, -0.5146059, -5.368965, 0, 1, 0.6627451, 1,
-0.1280318, -0.2690024, -2.0744, 0, 1, 0.6705883, 1,
-0.1271121, -0.7637499, -0.8013684, 0, 1, 0.6745098, 1,
-0.1260462, -1.017124, -2.988805, 0, 1, 0.682353, 1,
-0.1237669, 0.5484233, 0.780952, 0, 1, 0.6862745, 1,
-0.1231328, -0.74775, -0.8104735, 0, 1, 0.6941177, 1,
-0.1158871, -1.87403, -4.249237, 0, 1, 0.7019608, 1,
-0.1145114, -1.131581, -3.812591, 0, 1, 0.7058824, 1,
-0.1137709, 0.1245371, -0.6283334, 0, 1, 0.7137255, 1,
-0.1132179, 0.1501625, -1.737491, 0, 1, 0.7176471, 1,
-0.1115505, 0.2248217, 1.370965, 0, 1, 0.7254902, 1,
-0.1048943, -1.537578, -1.95067, 0, 1, 0.7294118, 1,
-0.1022433, 1.350632, -1.874034, 0, 1, 0.7372549, 1,
-0.1020707, 0.03872921, 0.2984343, 0, 1, 0.7411765, 1,
-0.1020415, 2.687619, -0.009889196, 0, 1, 0.7490196, 1,
-0.09906867, -1.336263, -3.047112, 0, 1, 0.7529412, 1,
-0.09746371, 0.1414287, -1.957368, 0, 1, 0.7607843, 1,
-0.09447223, 0.4141438, -0.06524583, 0, 1, 0.7647059, 1,
-0.08971336, 1.404102, 1.588635, 0, 1, 0.772549, 1,
-0.08595234, -0.08927655, -1.180968, 0, 1, 0.7764706, 1,
-0.07427299, 1.298038, 1.001834, 0, 1, 0.7843137, 1,
-0.06935405, -0.5382004, -3.942939, 0, 1, 0.7882353, 1,
-0.06550334, 1.357775, -0.8048685, 0, 1, 0.7960784, 1,
-0.06450006, 0.7542932, 1.38638, 0, 1, 0.8039216, 1,
-0.05965272, 1.133089, -1.528656, 0, 1, 0.8078431, 1,
-0.05192558, 0.06197827, -1.767308, 0, 1, 0.8156863, 1,
-0.04717579, -0.002033063, -1.635512, 0, 1, 0.8196079, 1,
-0.04705551, -1.579661, -4.453342, 0, 1, 0.827451, 1,
-0.04653516, -1.497931, -3.810097, 0, 1, 0.8313726, 1,
-0.04516653, 1.687387, -0.4862359, 0, 1, 0.8392157, 1,
-0.0416525, -0.2239108, -2.739088, 0, 1, 0.8431373, 1,
-0.04119486, -0.1423425, -2.442451, 0, 1, 0.8509804, 1,
-0.03809505, 0.1110512, -0.7931724, 0, 1, 0.854902, 1,
-0.03513982, 0.4932068, 0.3738737, 0, 1, 0.8627451, 1,
-0.03144548, 0.8913485, -1.179561, 0, 1, 0.8666667, 1,
-0.03125644, -0.4977503, -3.706941, 0, 1, 0.8745098, 1,
-0.02602676, -0.6563501, -3.242272, 0, 1, 0.8784314, 1,
-0.01735612, 2.25119, 1.071431, 0, 1, 0.8862745, 1,
-0.01693164, -0.7170327, -3.303141, 0, 1, 0.8901961, 1,
-0.01690842, 2.099779, 0.7602383, 0, 1, 0.8980392, 1,
-0.01656732, 0.1955835, -0.1657746, 0, 1, 0.9058824, 1,
-0.01517477, -0.6424549, -1.829446, 0, 1, 0.9098039, 1,
-0.01139681, -0.7428237, -2.719191, 0, 1, 0.9176471, 1,
-0.009915072, -1.191584, -3.527144, 0, 1, 0.9215686, 1,
-0.008075779, -0.4553786, -3.829178, 0, 1, 0.9294118, 1,
-0.006459701, 0.577225, -0.9064338, 0, 1, 0.9333333, 1,
-0.005788394, 0.8286355, 0.3552049, 0, 1, 0.9411765, 1,
-0.00500699, -1.020869, -4.051655, 0, 1, 0.945098, 1,
-0.004596865, -1.772532, -3.549934, 0, 1, 0.9529412, 1,
-0.003609564, -1.338525, -2.854037, 0, 1, 0.9568627, 1,
-0.001238449, -0.72664, -4.562468, 0, 1, 0.9647059, 1,
0.006729114, -0.6756638, 2.619618, 0, 1, 0.9686275, 1,
0.009796552, 1.417702, 1.354895, 0, 1, 0.9764706, 1,
0.0106701, -1.136551, 4.415564, 0, 1, 0.9803922, 1,
0.02005864, 0.1911096, -0.2607823, 0, 1, 0.9882353, 1,
0.02150341, 0.5483076, -0.6790508, 0, 1, 0.9921569, 1,
0.02345654, 1.301701, 1.335492, 0, 1, 1, 1,
0.03078819, 1.816825, 0.4264938, 0, 0.9921569, 1, 1,
0.04606238, 0.736491, -0.502555, 0, 0.9882353, 1, 1,
0.05023091, 0.4531656, -0.8030553, 0, 0.9803922, 1, 1,
0.05356407, 1.435383, -0.1787574, 0, 0.9764706, 1, 1,
0.05913166, -1.711736, 3.710308, 0, 0.9686275, 1, 1,
0.06118247, -0.5617337, 1.609511, 0, 0.9647059, 1, 1,
0.06979555, 0.6436248, 1.520264, 0, 0.9568627, 1, 1,
0.07257122, 0.7736092, 0.247467, 0, 0.9529412, 1, 1,
0.07536282, -0.6228543, 3.525129, 0, 0.945098, 1, 1,
0.07640057, -1.018457, 2.644753, 0, 0.9411765, 1, 1,
0.07788778, 0.3050618, -0.686458, 0, 0.9333333, 1, 1,
0.07873912, -1.854498, 4.151081, 0, 0.9294118, 1, 1,
0.08046429, -1.230276, 3.800806, 0, 0.9215686, 1, 1,
0.08593165, 0.7431848, 1.054517, 0, 0.9176471, 1, 1,
0.09076915, 1.816261, 1.297546, 0, 0.9098039, 1, 1,
0.09379552, 0.471221, 0.0003664227, 0, 0.9058824, 1, 1,
0.09427116, 0.6928437, -1.59948, 0, 0.8980392, 1, 1,
0.09499066, -0.6772823, 2.444977, 0, 0.8901961, 1, 1,
0.09558342, 0.116272, 0.3322159, 0, 0.8862745, 1, 1,
0.09643294, -1.27431, 2.160797, 0, 0.8784314, 1, 1,
0.09746975, -0.2723905, 3.282591, 0, 0.8745098, 1, 1,
0.1012994, -0.6100582, 4.029611, 0, 0.8666667, 1, 1,
0.1051359, 1.066282, -0.3058816, 0, 0.8627451, 1, 1,
0.107356, 0.05825871, 1.059747, 0, 0.854902, 1, 1,
0.1130161, -0.2206256, 1.967443, 0, 0.8509804, 1, 1,
0.1138504, 0.6735173, -0.0126772, 0, 0.8431373, 1, 1,
0.1147925, -0.3899922, 1.596609, 0, 0.8392157, 1, 1,
0.1155037, -1.350915, 2.089546, 0, 0.8313726, 1, 1,
0.1155129, 0.5403636, 0.84566, 0, 0.827451, 1, 1,
0.1164894, -0.2766218, 3.182854, 0, 0.8196079, 1, 1,
0.1174466, 0.1909841, 2.32191, 0, 0.8156863, 1, 1,
0.1187301, -0.09939589, 1.096278, 0, 0.8078431, 1, 1,
0.1187845, -0.8013524, 3.175496, 0, 0.8039216, 1, 1,
0.1198385, -0.003409861, 2.881041, 0, 0.7960784, 1, 1,
0.1218783, 0.1000798, 0.2588376, 0, 0.7882353, 1, 1,
0.1331264, -0.3246779, 3.479118, 0, 0.7843137, 1, 1,
0.1346342, -0.02877121, 3.882359, 0, 0.7764706, 1, 1,
0.135568, 1.559461, -0.2435404, 0, 0.772549, 1, 1,
0.1393086, -0.9105074, 2.998623, 0, 0.7647059, 1, 1,
0.1414197, 0.1429683, 0.8243863, 0, 0.7607843, 1, 1,
0.1454966, 2.059822, -0.2708101, 0, 0.7529412, 1, 1,
0.1472357, 1.254387, -0.681347, 0, 0.7490196, 1, 1,
0.1517492, -0.1004213, 2.829608, 0, 0.7411765, 1, 1,
0.1519072, 0.8443835, 0.6039078, 0, 0.7372549, 1, 1,
0.154792, -0.7840623, 4.229468, 0, 0.7294118, 1, 1,
0.1565264, -0.2039826, 2.295704, 0, 0.7254902, 1, 1,
0.1586576, 0.4692607, -1.245678, 0, 0.7176471, 1, 1,
0.1591576, 0.01181857, 0.8664103, 0, 0.7137255, 1, 1,
0.1606171, -0.07059416, 1.850887, 0, 0.7058824, 1, 1,
0.160936, 0.7248842, -0.7347099, 0, 0.6980392, 1, 1,
0.1611031, -1.367376, 1.048299, 0, 0.6941177, 1, 1,
0.1617876, 1.681688, -0.1007912, 0, 0.6862745, 1, 1,
0.1623387, -0.4213739, 2.802738, 0, 0.682353, 1, 1,
0.1746712, 1.55717, 1.815335, 0, 0.6745098, 1, 1,
0.1776322, -0.4805137, 3.828569, 0, 0.6705883, 1, 1,
0.17772, 0.1868474, 1.455924, 0, 0.6627451, 1, 1,
0.1798245, 1.337903, -0.1264813, 0, 0.6588235, 1, 1,
0.1815173, -0.6514808, 2.125911, 0, 0.6509804, 1, 1,
0.1863029, 0.2785571, -0.1147219, 0, 0.6470588, 1, 1,
0.1873067, -0.259148, 4.108532, 0, 0.6392157, 1, 1,
0.189145, 0.9821166, 0.7775668, 0, 0.6352941, 1, 1,
0.1921208, 1.357556, 1.390261, 0, 0.627451, 1, 1,
0.1939649, -0.9742434, 1.592475, 0, 0.6235294, 1, 1,
0.1957659, 2.21839, 1.435524, 0, 0.6156863, 1, 1,
0.20211, 0.872421, 0.6599713, 0, 0.6117647, 1, 1,
0.2069554, -0.2317408, -0.820186, 0, 0.6039216, 1, 1,
0.208281, 2.223332, 0.8323109, 0, 0.5960785, 1, 1,
0.2095803, -0.6054274, 2.391264, 0, 0.5921569, 1, 1,
0.2101785, -0.1689364, 2.456814, 0, 0.5843138, 1, 1,
0.211992, 0.9642949, 0.8795479, 0, 0.5803922, 1, 1,
0.2142809, -1.446994, 2.07874, 0, 0.572549, 1, 1,
0.2169359, 0.3834989, 1.527887, 0, 0.5686275, 1, 1,
0.2200211, -0.4426888, 1.220969, 0, 0.5607843, 1, 1,
0.2275588, -0.6225398, 3.166283, 0, 0.5568628, 1, 1,
0.2290399, 1.558971, -1.795805, 0, 0.5490196, 1, 1,
0.2292734, 0.2359848, 0.5660117, 0, 0.5450981, 1, 1,
0.2294534, 0.002601013, 2.489202, 0, 0.5372549, 1, 1,
0.2315328, -0.3112768, 2.931206, 0, 0.5333334, 1, 1,
0.2319874, 0.006388513, 0.7809449, 0, 0.5254902, 1, 1,
0.235423, 0.9932556, -0.7081077, 0, 0.5215687, 1, 1,
0.2365968, 0.1947549, -0.6748493, 0, 0.5137255, 1, 1,
0.2394519, 0.7681693, 2.129346, 0, 0.509804, 1, 1,
0.2401381, 1.718612, -0.01918704, 0, 0.5019608, 1, 1,
0.2443273, 0.0603947, -0.1497162, 0, 0.4941176, 1, 1,
0.2448364, 0.9707907, 0.9734623, 0, 0.4901961, 1, 1,
0.2456961, -1.830656, 3.722543, 0, 0.4823529, 1, 1,
0.2466908, 0.5414617, 1.943563, 0, 0.4784314, 1, 1,
0.2500046, 0.6264271, 2.219701, 0, 0.4705882, 1, 1,
0.2540547, -1.294941, 3.446457, 0, 0.4666667, 1, 1,
0.257675, 0.6798359, 0.2889441, 0, 0.4588235, 1, 1,
0.258493, 0.5684439, -0.8755227, 0, 0.454902, 1, 1,
0.2632183, 0.04872727, 1.759573, 0, 0.4470588, 1, 1,
0.2748078, 0.5306402, 0.1991906, 0, 0.4431373, 1, 1,
0.2760335, -0.2975366, 2.788467, 0, 0.4352941, 1, 1,
0.2780065, 0.3434667, 1.167104, 0, 0.4313726, 1, 1,
0.2805907, -1.000003, 3.339793, 0, 0.4235294, 1, 1,
0.2844511, 1.249568, 0.8250927, 0, 0.4196078, 1, 1,
0.2864735, -0.9464015, 2.975368, 0, 0.4117647, 1, 1,
0.2915385, -1.057245, 2.710637, 0, 0.4078431, 1, 1,
0.2925904, 0.9211679, 0.8309781, 0, 0.4, 1, 1,
0.2958828, -0.851057, 0.0887946, 0, 0.3921569, 1, 1,
0.2959491, 0.7524937, -1.25236, 0, 0.3882353, 1, 1,
0.2978055, -1.432449, 3.299535, 0, 0.3803922, 1, 1,
0.2987972, 0.08152866, -0.1346262, 0, 0.3764706, 1, 1,
0.3026384, 2.30963, -1.259131, 0, 0.3686275, 1, 1,
0.3117248, 0.3868644, -0.1440313, 0, 0.3647059, 1, 1,
0.3119116, -1.997154, 1.952982, 0, 0.3568628, 1, 1,
0.3128204, 0.7462065, 1.664859, 0, 0.3529412, 1, 1,
0.3129241, -0.168314, 3.514697, 0, 0.345098, 1, 1,
0.319815, 0.4264071, 0.4477635, 0, 0.3411765, 1, 1,
0.3206308, 1.995802, 0.8419612, 0, 0.3333333, 1, 1,
0.3216416, -1.028204, 4.212809, 0, 0.3294118, 1, 1,
0.3245962, 1.3132, -1.018167, 0, 0.3215686, 1, 1,
0.3293338, 1.043386, 1.109833, 0, 0.3176471, 1, 1,
0.3349095, 1.018515, 0.6715174, 0, 0.3098039, 1, 1,
0.3356808, -0.683814, 2.656815, 0, 0.3058824, 1, 1,
0.3374017, -0.07296279, 1.595344, 0, 0.2980392, 1, 1,
0.3426324, -1.347571, 4.612092, 0, 0.2901961, 1, 1,
0.3431843, -0.1124358, -0.05649687, 0, 0.2862745, 1, 1,
0.344739, 1.325412, 1.226215, 0, 0.2784314, 1, 1,
0.3457101, -1.327286, 1.703631, 0, 0.2745098, 1, 1,
0.3532186, -0.3311383, 1.958647, 0, 0.2666667, 1, 1,
0.3557757, -0.9924695, 0.7487782, 0, 0.2627451, 1, 1,
0.3580506, -1.330951, 1.771511, 0, 0.254902, 1, 1,
0.3595091, -0.252898, 1.370491, 0, 0.2509804, 1, 1,
0.359937, -0.7784712, 1.546073, 0, 0.2431373, 1, 1,
0.3601689, -0.4623792, 2.867112, 0, 0.2392157, 1, 1,
0.3625586, -1.231279, 1.779708, 0, 0.2313726, 1, 1,
0.3656511, 1.270749, -0.7217682, 0, 0.227451, 1, 1,
0.3664473, -1.611312, 1.184207, 0, 0.2196078, 1, 1,
0.3718805, 0.1889432, 1.22387, 0, 0.2156863, 1, 1,
0.3734221, 1.528299, 1.279152, 0, 0.2078431, 1, 1,
0.3753006, -1.112254, 3.452282, 0, 0.2039216, 1, 1,
0.3754608, -0.2145252, 2.819839, 0, 0.1960784, 1, 1,
0.3802612, -0.4833395, 2.593318, 0, 0.1882353, 1, 1,
0.3802803, -0.6878101, 0.6671618, 0, 0.1843137, 1, 1,
0.3805673, 0.7762935, -0.8054612, 0, 0.1764706, 1, 1,
0.3806889, 0.08658722, -0.1436823, 0, 0.172549, 1, 1,
0.3816264, 0.9941399, 0.121998, 0, 0.1647059, 1, 1,
0.3839633, 0.07645872, 2.642812, 0, 0.1607843, 1, 1,
0.3874942, -0.1737221, 2.280247, 0, 0.1529412, 1, 1,
0.3908627, -0.333682, 0.9159442, 0, 0.1490196, 1, 1,
0.3923159, -0.2921214, 3.270493, 0, 0.1411765, 1, 1,
0.3982177, -1.251124, 2.123924, 0, 0.1372549, 1, 1,
0.3996494, -1.230619, 2.426461, 0, 0.1294118, 1, 1,
0.402002, 0.4595896, 0.1415397, 0, 0.1254902, 1, 1,
0.4081417, 1.745458, 0.8086843, 0, 0.1176471, 1, 1,
0.4082456, 0.7826121, 0.01651096, 0, 0.1137255, 1, 1,
0.4098324, 0.1810105, 1.520084, 0, 0.1058824, 1, 1,
0.4196771, -0.2878751, 2.441587, 0, 0.09803922, 1, 1,
0.4210623, 0.01909046, 0.5180755, 0, 0.09411765, 1, 1,
0.4282084, -0.6798241, 1.898056, 0, 0.08627451, 1, 1,
0.4299028, 0.0333441, 0.8695081, 0, 0.08235294, 1, 1,
0.4327857, -1.083221, 2.979649, 0, 0.07450981, 1, 1,
0.4350988, 0.1499985, 0.506376, 0, 0.07058824, 1, 1,
0.4351138, 0.9426958, -0.7972561, 0, 0.0627451, 1, 1,
0.4368144, -0.5174904, 2.701429, 0, 0.05882353, 1, 1,
0.4378384, 1.165797, 0.3699997, 0, 0.05098039, 1, 1,
0.438896, 0.4127029, 1.362965, 0, 0.04705882, 1, 1,
0.4397437, -1.889225, 3.945683, 0, 0.03921569, 1, 1,
0.4402318, -0.5248742, 3.107486, 0, 0.03529412, 1, 1,
0.4443907, -0.7324516, 3.432965, 0, 0.02745098, 1, 1,
0.4475667, 1.581283, -0.1575722, 0, 0.02352941, 1, 1,
0.4484182, -0.4325202, 1.288616, 0, 0.01568628, 1, 1,
0.4490741, 0.9459162, 0.529047, 0, 0.01176471, 1, 1,
0.4492774, 0.6068839, 0.5470685, 0, 0.003921569, 1, 1,
0.4514411, -0.3703646, 2.201601, 0.003921569, 0, 1, 1,
0.4514451, 2.234258, 0.8575003, 0.007843138, 0, 1, 1,
0.4518038, 0.2152362, 0.513159, 0.01568628, 0, 1, 1,
0.4537482, 0.1627007, 1.539231, 0.01960784, 0, 1, 1,
0.4560991, -0.4389936, 0.9071628, 0.02745098, 0, 1, 1,
0.4575604, -0.8716024, 3.319327, 0.03137255, 0, 1, 1,
0.460165, 1.193671, 1.366417, 0.03921569, 0, 1, 1,
0.4629372, 0.05976096, 3.171469, 0.04313726, 0, 1, 1,
0.4636887, -1.119729, 3.727182, 0.05098039, 0, 1, 1,
0.4659168, -2.370598, 1.605245, 0.05490196, 0, 1, 1,
0.4740289, -1.199584, 3.384983, 0.0627451, 0, 1, 1,
0.4761876, -0.8621435, 3.974154, 0.06666667, 0, 1, 1,
0.4765311, 0.4713698, 1.269024, 0.07450981, 0, 1, 1,
0.4766984, -0.5792834, 3.30915, 0.07843138, 0, 1, 1,
0.4797594, -0.9508657, 3.378184, 0.08627451, 0, 1, 1,
0.4802076, -0.7128597, 2.47652, 0.09019608, 0, 1, 1,
0.4859584, 0.8591102, 1.311567, 0.09803922, 0, 1, 1,
0.4870545, -0.8272581, 1.517468, 0.1058824, 0, 1, 1,
0.4873796, -0.1771132, 0.8407871, 0.1098039, 0, 1, 1,
0.4912777, -1.431509, 3.534496, 0.1176471, 0, 1, 1,
0.4956474, -0.1483377, 1.899355, 0.1215686, 0, 1, 1,
0.4980471, 1.54278, -0.4023548, 0.1294118, 0, 1, 1,
0.4989243, -1.126311, 5.473155, 0.1333333, 0, 1, 1,
0.5010723, 1.294097, 1.750792, 0.1411765, 0, 1, 1,
0.5062094, 0.8687674, -0.320159, 0.145098, 0, 1, 1,
0.5082061, 0.1568914, -0.5783527, 0.1529412, 0, 1, 1,
0.5132688, 0.6045724, 0.1805384, 0.1568628, 0, 1, 1,
0.5210195, 0.1690983, 1.542279, 0.1647059, 0, 1, 1,
0.5239851, 0.3787205, -1.051976, 0.1686275, 0, 1, 1,
0.5273132, 2.222487, 1.226767, 0.1764706, 0, 1, 1,
0.5357268, 2.236016, -1.297705, 0.1803922, 0, 1, 1,
0.5371676, 0.3214973, 1.530556, 0.1882353, 0, 1, 1,
0.5387508, 0.5624546, 0.716728, 0.1921569, 0, 1, 1,
0.5435023, -0.6912349, 2.697212, 0.2, 0, 1, 1,
0.5462287, 0.1618633, 1.975242, 0.2078431, 0, 1, 1,
0.5580914, 2.783768, 0.2764371, 0.2117647, 0, 1, 1,
0.5630361, 2.091798, 1.036054, 0.2196078, 0, 1, 1,
0.5650944, -1.230315, 2.362146, 0.2235294, 0, 1, 1,
0.5690466, 2.366492, -0.3229446, 0.2313726, 0, 1, 1,
0.5717956, 1.056854, -0.563912, 0.2352941, 0, 1, 1,
0.5831191, 0.5315126, 2.883325, 0.2431373, 0, 1, 1,
0.5922483, -0.1980579, 1.97241, 0.2470588, 0, 1, 1,
0.5922978, 0.7587973, 0.3822029, 0.254902, 0, 1, 1,
0.6009012, 0.1517778, 1.23271, 0.2588235, 0, 1, 1,
0.6009988, -1.004212, 2.412249, 0.2666667, 0, 1, 1,
0.6042955, -0.1739273, 0.3100694, 0.2705882, 0, 1, 1,
0.6052706, -0.08471455, 1.078282, 0.2784314, 0, 1, 1,
0.608911, -1.467496, 4.113075, 0.282353, 0, 1, 1,
0.612662, -0.402197, 1.069871, 0.2901961, 0, 1, 1,
0.613519, -0.4951114, 1.37818, 0.2941177, 0, 1, 1,
0.613865, 0.0501978, 0.476885, 0.3019608, 0, 1, 1,
0.6142196, -0.4666387, 2.370277, 0.3098039, 0, 1, 1,
0.6142992, 0.8268462, 2.193149, 0.3137255, 0, 1, 1,
0.6143023, 0.5909853, 0.9834782, 0.3215686, 0, 1, 1,
0.6148212, -0.499335, 2.177075, 0.3254902, 0, 1, 1,
0.6168665, -0.2945678, 0.2389629, 0.3333333, 0, 1, 1,
0.629646, -0.3995183, 1.710426, 0.3372549, 0, 1, 1,
0.6374181, -0.1087319, 1.855621, 0.345098, 0, 1, 1,
0.6385324, -1.857162, 3.456505, 0.3490196, 0, 1, 1,
0.6495226, 1.010087, 1.85971, 0.3568628, 0, 1, 1,
0.6535093, 0.7704632, -0.02156116, 0.3607843, 0, 1, 1,
0.6606243, -1.132293, 3.214457, 0.3686275, 0, 1, 1,
0.663894, -0.2685662, 2.175943, 0.372549, 0, 1, 1,
0.6694447, -0.1641293, 0.2442159, 0.3803922, 0, 1, 1,
0.6698549, -0.3963628, 0.5060658, 0.3843137, 0, 1, 1,
0.6704165, 0.5809472, 2.66883, 0.3921569, 0, 1, 1,
0.6747634, -0.2634129, 2.079016, 0.3960784, 0, 1, 1,
0.6757297, -0.8945204, 3.231782, 0.4039216, 0, 1, 1,
0.6783753, 1.26319, 1.820575, 0.4117647, 0, 1, 1,
0.6838311, 0.6253994, -0.4838834, 0.4156863, 0, 1, 1,
0.689011, 0.3588657, 0.1868642, 0.4235294, 0, 1, 1,
0.6911144, 0.03061754, -1.711924, 0.427451, 0, 1, 1,
0.6928632, 1.047345, 1.63099, 0.4352941, 0, 1, 1,
0.6931022, 0.8385656, 0.3375097, 0.4392157, 0, 1, 1,
0.6932093, 0.820397, 2.078686, 0.4470588, 0, 1, 1,
0.6965517, -1.260375, 3.792366, 0.4509804, 0, 1, 1,
0.7022308, -0.6733258, 2.122127, 0.4588235, 0, 1, 1,
0.7022658, -0.3623134, 1.507664, 0.4627451, 0, 1, 1,
0.7042003, -1.273815, 2.610338, 0.4705882, 0, 1, 1,
0.7069664, -0.4373115, 1.583188, 0.4745098, 0, 1, 1,
0.7077895, -0.05109045, 1.390638, 0.4823529, 0, 1, 1,
0.7134538, -0.7931967, 3.556718, 0.4862745, 0, 1, 1,
0.7165577, -1.548998, 3.479278, 0.4941176, 0, 1, 1,
0.7176456, -0.2087184, 3.442177, 0.5019608, 0, 1, 1,
0.7225072, -0.7779343, 1.871123, 0.5058824, 0, 1, 1,
0.7227316, 0.169465, 1.848891, 0.5137255, 0, 1, 1,
0.7273389, 0.5888724, 2.655163, 0.5176471, 0, 1, 1,
0.7322535, 0.2859099, 0.306867, 0.5254902, 0, 1, 1,
0.7328427, 0.5840037, 0.1620584, 0.5294118, 0, 1, 1,
0.7385845, -1.000587, 2.61554, 0.5372549, 0, 1, 1,
0.7441966, 1.467941, -0.4989176, 0.5411765, 0, 1, 1,
0.7472512, -0.7971182, 4.121116, 0.5490196, 0, 1, 1,
0.7501246, 0.835094, -0.1731226, 0.5529412, 0, 1, 1,
0.7505375, -1.158231, 3.278665, 0.5607843, 0, 1, 1,
0.7516022, -0.2689421, 2.246535, 0.5647059, 0, 1, 1,
0.7552586, -1.537455, 1.81339, 0.572549, 0, 1, 1,
0.7570444, -0.7889502, 2.970854, 0.5764706, 0, 1, 1,
0.7626333, -0.7653494, 2.45125, 0.5843138, 0, 1, 1,
0.7633538, -0.5674359, 2.648469, 0.5882353, 0, 1, 1,
0.764049, -0.5947829, 3.812367, 0.5960785, 0, 1, 1,
0.764937, 1.187388, 1.322409, 0.6039216, 0, 1, 1,
0.7671888, 1.560487, 0.4249301, 0.6078432, 0, 1, 1,
0.7674698, -0.9028321, 0.8270044, 0.6156863, 0, 1, 1,
0.7681986, 0.1300297, 1.216591, 0.6196079, 0, 1, 1,
0.7756715, 1.238344, 0.2248413, 0.627451, 0, 1, 1,
0.7775477, 0.4179627, 0.7072135, 0.6313726, 0, 1, 1,
0.7800708, 1.764471, 0.2141016, 0.6392157, 0, 1, 1,
0.7844791, 1.095694, 0.2720391, 0.6431373, 0, 1, 1,
0.7903978, 0.7872823, -0.9136305, 0.6509804, 0, 1, 1,
0.7919828, 0.9576487, -0.5611144, 0.654902, 0, 1, 1,
0.7942368, 2.877375, 0.09150337, 0.6627451, 0, 1, 1,
0.7946398, -0.3706926, 2.154671, 0.6666667, 0, 1, 1,
0.7957033, -1.610143, 1.503109, 0.6745098, 0, 1, 1,
0.7973003, -0.2055902, 2.713065, 0.6784314, 0, 1, 1,
0.8077297, 1.150928, 0.2022246, 0.6862745, 0, 1, 1,
0.8099801, 0.1848579, 1.373699, 0.6901961, 0, 1, 1,
0.8121458, 0.5828527, 2.142614, 0.6980392, 0, 1, 1,
0.8126561, -1.651096, 4.336654, 0.7058824, 0, 1, 1,
0.8138829, 1.160826, 0.5924897, 0.7098039, 0, 1, 1,
0.8146172, 0.5972793, 0.7161345, 0.7176471, 0, 1, 1,
0.8186588, 0.1247194, 1.326382, 0.7215686, 0, 1, 1,
0.8187174, -1.752672, 2.354568, 0.7294118, 0, 1, 1,
0.8215099, 0.5195505, -0.005394033, 0.7333333, 0, 1, 1,
0.8290295, 0.626267, 1.252105, 0.7411765, 0, 1, 1,
0.8359377, -0.6457902, 1.770796, 0.7450981, 0, 1, 1,
0.8363781, 0.3191414, 1.366853, 0.7529412, 0, 1, 1,
0.8432568, 1.133564, 1.525531, 0.7568628, 0, 1, 1,
0.8479477, 0.971624, 0.2256293, 0.7647059, 0, 1, 1,
0.8512924, 1.294213, 0.1630856, 0.7686275, 0, 1, 1,
0.8547115, 1.146289, -0.03840326, 0.7764706, 0, 1, 1,
0.8575573, -0.3040374, 0.9662542, 0.7803922, 0, 1, 1,
0.8652534, 0.1468856, 0.9043784, 0.7882353, 0, 1, 1,
0.8720047, 2.445697, -0.3049412, 0.7921569, 0, 1, 1,
0.8742433, -0.7868945, 0.7213628, 0.8, 0, 1, 1,
0.8812849, 0.5634742, 0.1555704, 0.8078431, 0, 1, 1,
0.8818043, 1.233148, 0.4567378, 0.8117647, 0, 1, 1,
0.8838526, -0.2771596, 0.7802249, 0.8196079, 0, 1, 1,
0.8846223, 1.862017, 1.762973, 0.8235294, 0, 1, 1,
0.8865156, -0.01448422, -0.5698256, 0.8313726, 0, 1, 1,
0.8928872, 0.6248627, 1.882331, 0.8352941, 0, 1, 1,
0.8978401, -1.091451, 0.9082381, 0.8431373, 0, 1, 1,
0.9006543, 1.024367, 3.141724, 0.8470588, 0, 1, 1,
0.9067857, 1.28952, 0.009147817, 0.854902, 0, 1, 1,
0.9079257, -0.01260545, 3.686943, 0.8588235, 0, 1, 1,
0.9106137, 1.846506, 1.918781, 0.8666667, 0, 1, 1,
0.9130204, -1.526522, 2.799165, 0.8705882, 0, 1, 1,
0.917932, -0.5553332, 2.311578, 0.8784314, 0, 1, 1,
0.9218988, 1.369159, 0.3650579, 0.8823529, 0, 1, 1,
0.9294816, 0.03967089, 1.107892, 0.8901961, 0, 1, 1,
0.9298419, 0.09427518, 1.653162, 0.8941177, 0, 1, 1,
0.9319669, 0.215377, -0.5593911, 0.9019608, 0, 1, 1,
0.9332075, -0.01446475, 1.640846, 0.9098039, 0, 1, 1,
0.9338851, 0.3807518, 2.841347, 0.9137255, 0, 1, 1,
0.934517, 0.8613899, 1.063079, 0.9215686, 0, 1, 1,
0.9395534, -0.6912799, 3.233778, 0.9254902, 0, 1, 1,
0.9468048, -1.711923, 0.07324806, 0.9333333, 0, 1, 1,
0.9489844, -0.1330012, 2.413629, 0.9372549, 0, 1, 1,
0.9495924, -0.5464671, 2.978576, 0.945098, 0, 1, 1,
0.951262, -1.953591, 1.160268, 0.9490196, 0, 1, 1,
0.9515046, 0.09373203, 2.492711, 0.9568627, 0, 1, 1,
0.9553647, -1.128325, 3.266086, 0.9607843, 0, 1, 1,
0.959514, 0.2504086, 0.9104396, 0.9686275, 0, 1, 1,
0.9595504, -0.6297742, 0.765569, 0.972549, 0, 1, 1,
0.9658605, 1.067344, 1.157295, 0.9803922, 0, 1, 1,
0.9862906, -1.569044, 2.159768, 0.9843137, 0, 1, 1,
0.9918491, 1.131175, -0.6819178, 0.9921569, 0, 1, 1,
0.9956545, -0.1825704, 1.06924, 0.9960784, 0, 1, 1,
0.9966464, -0.1354002, 1.818394, 1, 0, 0.9960784, 1,
1.000637, 1.874304, 1.058194, 1, 0, 0.9882353, 1,
1.001224, 0.04727167, 1.427734, 1, 0, 0.9843137, 1,
1.007043, -0.9297846, 2.433887, 1, 0, 0.9764706, 1,
1.007087, -1.816748, 3.244295, 1, 0, 0.972549, 1,
1.007276, -1.203232, 3.257796, 1, 0, 0.9647059, 1,
1.020262, -0.3788039, 2.865723, 1, 0, 0.9607843, 1,
1.023196, -2.364565, 2.550971, 1, 0, 0.9529412, 1,
1.03988, 1.383182, -0.2162751, 1, 0, 0.9490196, 1,
1.040802, -0.8803436, 1.298102, 1, 0, 0.9411765, 1,
1.05232, 0.6277192, 0.1418519, 1, 0, 0.9372549, 1,
1.054756, 0.3702391, 1.829338, 1, 0, 0.9294118, 1,
1.071724, 0.3298297, 1.297376, 1, 0, 0.9254902, 1,
1.083874, 0.2496058, 1.501847, 1, 0, 0.9176471, 1,
1.090896, 0.4383631, 0.4059516, 1, 0, 0.9137255, 1,
1.101904, -0.5116163, -0.1855625, 1, 0, 0.9058824, 1,
1.103526, -1.036512, 2.114431, 1, 0, 0.9019608, 1,
1.109147, -0.2053147, 1.657171, 1, 0, 0.8941177, 1,
1.118367, -1.595531, 1.796624, 1, 0, 0.8862745, 1,
1.119034, -0.8061744, 0.9367943, 1, 0, 0.8823529, 1,
1.120583, -0.5143491, 2.885249, 1, 0, 0.8745098, 1,
1.122782, -0.3465957, 1.553552, 1, 0, 0.8705882, 1,
1.122826, 1.209009, 1.02658, 1, 0, 0.8627451, 1,
1.126717, 0.9445965, 0.9088399, 1, 0, 0.8588235, 1,
1.130634, -0.5455427, 2.312417, 1, 0, 0.8509804, 1,
1.130681, 0.8729335, -0.351791, 1, 0, 0.8470588, 1,
1.131755, 1.777533, -0.08415371, 1, 0, 0.8392157, 1,
1.13288, -2.09752, 0.9521906, 1, 0, 0.8352941, 1,
1.136132, 1.661728, 0.9867239, 1, 0, 0.827451, 1,
1.144031, 0.01391871, 1.117798, 1, 0, 0.8235294, 1,
1.154933, -0.7767219, 2.181054, 1, 0, 0.8156863, 1,
1.155206, -0.1712582, 1.638514, 1, 0, 0.8117647, 1,
1.159225, -0.5133997, 2.514928, 1, 0, 0.8039216, 1,
1.160236, 1.85328, 0.7307687, 1, 0, 0.7960784, 1,
1.160886, 0.0168206, 1.485821, 1, 0, 0.7921569, 1,
1.16328, -0.7252743, 1.706958, 1, 0, 0.7843137, 1,
1.163419, -0.417704, 2.846245, 1, 0, 0.7803922, 1,
1.18695, -0.04618621, 1.586018, 1, 0, 0.772549, 1,
1.201248, 0.5238129, 0.7283279, 1, 0, 0.7686275, 1,
1.204482, 0.206246, 4.112409, 1, 0, 0.7607843, 1,
1.205653, -0.3660036, 1.848091, 1, 0, 0.7568628, 1,
1.212631, -1.232682, 0.3242022, 1, 0, 0.7490196, 1,
1.212893, 1.923304, -0.2247126, 1, 0, 0.7450981, 1,
1.222251, -1.003546, 5.383984, 1, 0, 0.7372549, 1,
1.222795, -0.06084102, 1.585649, 1, 0, 0.7333333, 1,
1.22394, 1.19376, 2.049035, 1, 0, 0.7254902, 1,
1.232172, 1.251505, 0.4471903, 1, 0, 0.7215686, 1,
1.232408, -0.0898909, 2.063053, 1, 0, 0.7137255, 1,
1.241965, -0.6550447, 2.878517, 1, 0, 0.7098039, 1,
1.250699, 0.9590726, -0.3370788, 1, 0, 0.7019608, 1,
1.251161, 0.4816684, 2.320883, 1, 0, 0.6941177, 1,
1.254925, 1.405191, -0.8308267, 1, 0, 0.6901961, 1,
1.257326, 1.356868, 2.532754, 1, 0, 0.682353, 1,
1.258809, 0.6801485, 0.6188852, 1, 0, 0.6784314, 1,
1.277738, -0.1862985, 2.042112, 1, 0, 0.6705883, 1,
1.278311, -0.8688057, 3.038064, 1, 0, 0.6666667, 1,
1.280932, -0.1440213, 1.204035, 1, 0, 0.6588235, 1,
1.285001, -3.674269, 1.58104, 1, 0, 0.654902, 1,
1.293998, 0.5391096, -0.9302978, 1, 0, 0.6470588, 1,
1.294292, 0.1175527, 2.937624, 1, 0, 0.6431373, 1,
1.297822, -1.337898, 4.575586, 1, 0, 0.6352941, 1,
1.300612, 0.4932734, 0.747254, 1, 0, 0.6313726, 1,
1.314753, 1.267779, 1.186776, 1, 0, 0.6235294, 1,
1.323751, 0.1729595, 1.968688, 1, 0, 0.6196079, 1,
1.335594, -1.426395, 1.36638, 1, 0, 0.6117647, 1,
1.33827, -0.7072024, 2.84403, 1, 0, 0.6078432, 1,
1.339186, -1.425417, -0.2542365, 1, 0, 0.6, 1,
1.340072, 0.2714106, 0.6385194, 1, 0, 0.5921569, 1,
1.349477, 1.048352, 0.9432381, 1, 0, 0.5882353, 1,
1.3501, -0.5575212, 3.377161, 1, 0, 0.5803922, 1,
1.360284, 1.096026, 2.294405, 1, 0, 0.5764706, 1,
1.361338, -0.3294544, 2.469856, 1, 0, 0.5686275, 1,
1.363542, 1.528395, -0.1117126, 1, 0, 0.5647059, 1,
1.37254, 0.5911645, 0.2268695, 1, 0, 0.5568628, 1,
1.3761, 0.3159729, 1.495669, 1, 0, 0.5529412, 1,
1.378043, -1.068231, 0.7430652, 1, 0, 0.5450981, 1,
1.378236, 0.2969022, 1.544231, 1, 0, 0.5411765, 1,
1.382528, -0.8201496, 1.256987, 1, 0, 0.5333334, 1,
1.393279, -1.685754, 1.026659, 1, 0, 0.5294118, 1,
1.394826, -0.3096241, 0.2029578, 1, 0, 0.5215687, 1,
1.402247, 1.079258, 1.539857, 1, 0, 0.5176471, 1,
1.406659, 0.3310982, -0.6655034, 1, 0, 0.509804, 1,
1.407208, -0.7367526, 2.207626, 1, 0, 0.5058824, 1,
1.407894, 1.182732, 1.132239, 1, 0, 0.4980392, 1,
1.416395, -0.7178219, 0.637282, 1, 0, 0.4901961, 1,
1.423431, 0.1316277, 1.280197, 1, 0, 0.4862745, 1,
1.430568, -0.3604774, 2.626557, 1, 0, 0.4784314, 1,
1.43477, 0.6870962, 2.584187, 1, 0, 0.4745098, 1,
1.438041, -0.7129003, 2.182635, 1, 0, 0.4666667, 1,
1.438189, -0.9669735, 2.084961, 1, 0, 0.4627451, 1,
1.442909, 0.5979074, 1.860732, 1, 0, 0.454902, 1,
1.444396, 1.116722, 1.38475, 1, 0, 0.4509804, 1,
1.449368, 2.860094, -0.4243416, 1, 0, 0.4431373, 1,
1.450774, -1.502306, 3.445657, 1, 0, 0.4392157, 1,
1.452998, -0.1993599, 1.474077, 1, 0, 0.4313726, 1,
1.454818, 0.95654, 2.594844, 1, 0, 0.427451, 1,
1.462915, -0.4847411, 0.5756736, 1, 0, 0.4196078, 1,
1.476311, 2.158208, 2.167352, 1, 0, 0.4156863, 1,
1.476643, 0.9186294, 0.9753982, 1, 0, 0.4078431, 1,
1.48661, -0.6928501, 1.95423, 1, 0, 0.4039216, 1,
1.488817, -0.8367879, 0.6960912, 1, 0, 0.3960784, 1,
1.501047, -1.037812, 1.808656, 1, 0, 0.3882353, 1,
1.501925, -0.6250183, -0.1157939, 1, 0, 0.3843137, 1,
1.513151, -0.3417691, 0.4607245, 1, 0, 0.3764706, 1,
1.526099, 2.575955, 2.341409, 1, 0, 0.372549, 1,
1.529969, 0.5688412, -0.9540828, 1, 0, 0.3647059, 1,
1.550472, -0.02794545, 1.133196, 1, 0, 0.3607843, 1,
1.562201, 0.146029, 1.682633, 1, 0, 0.3529412, 1,
1.574255, 0.05356656, 0.8108898, 1, 0, 0.3490196, 1,
1.575478, -0.6032324, 0.8508846, 1, 0, 0.3411765, 1,
1.589013, -0.8887249, 2.796369, 1, 0, 0.3372549, 1,
1.5951, 1.188788, -0.480828, 1, 0, 0.3294118, 1,
1.603637, 1.613877, -0.03025494, 1, 0, 0.3254902, 1,
1.610363, -0.8327526, 2.632686, 1, 0, 0.3176471, 1,
1.612866, 0.3994482, 1.513822, 1, 0, 0.3137255, 1,
1.631032, -0.6379556, 1.646082, 1, 0, 0.3058824, 1,
1.6323, 0.2084769, 0.487544, 1, 0, 0.2980392, 1,
1.639318, -1.278309, -0.2347678, 1, 0, 0.2941177, 1,
1.665866, 0.6889156, 2.150445, 1, 0, 0.2862745, 1,
1.670676, -0.1584994, 0.9553479, 1, 0, 0.282353, 1,
1.675923, 1.861075, 0.2239684, 1, 0, 0.2745098, 1,
1.681324, -0.3520737, 0.9155185, 1, 0, 0.2705882, 1,
1.70053, -0.7383529, 3.208745, 1, 0, 0.2627451, 1,
1.702329, -0.2182215, 0.1496111, 1, 0, 0.2588235, 1,
1.718825, -0.1275455, 2.043518, 1, 0, 0.2509804, 1,
1.7316, 0.39505, 0.1270731, 1, 0, 0.2470588, 1,
1.73305, -0.07669367, 0.5451069, 1, 0, 0.2392157, 1,
1.73905, 0.303143, 1.809693, 1, 0, 0.2352941, 1,
1.743759, -1.707039, 4.662334, 1, 0, 0.227451, 1,
1.755292, 1.091001, 1.091968, 1, 0, 0.2235294, 1,
1.759194, 0.3950268, 1.394166, 1, 0, 0.2156863, 1,
1.759908, -0.6479411, 0.6180362, 1, 0, 0.2117647, 1,
1.778645, -0.40635, 1.813783, 1, 0, 0.2039216, 1,
1.781163, -0.2861468, 1.160828, 1, 0, 0.1960784, 1,
1.787518, -1.30076, 2.613224, 1, 0, 0.1921569, 1,
1.788406, -2.103792, 3.121818, 1, 0, 0.1843137, 1,
1.816475, 0.1756625, 0.6305982, 1, 0, 0.1803922, 1,
1.822938, 0.7565513, 0.5043136, 1, 0, 0.172549, 1,
1.829958, -0.517531, 3.841679, 1, 0, 0.1686275, 1,
1.845816, -0.3153872, 1.890918, 1, 0, 0.1607843, 1,
1.863912, 0.6253278, 2.008825, 1, 0, 0.1568628, 1,
1.893163, 1.509159, 0.7045246, 1, 0, 0.1490196, 1,
1.90231, 1.014455, 2.531864, 1, 0, 0.145098, 1,
1.950064, 0.5368359, 2.846202, 1, 0, 0.1372549, 1,
2.028492, -0.5918804, 2.88586, 1, 0, 0.1333333, 1,
2.035417, -0.4715311, 0.908212, 1, 0, 0.1254902, 1,
2.066777, 0.4369055, 2.266256, 1, 0, 0.1215686, 1,
2.090048, -0.8677373, 2.141151, 1, 0, 0.1137255, 1,
2.094312, -1.204521, 1.8165, 1, 0, 0.1098039, 1,
2.105129, 1.426361, 1.601382, 1, 0, 0.1019608, 1,
2.126701, 2.098575, 1.18586, 1, 0, 0.09411765, 1,
2.206684, -0.8032352, 1.993294, 1, 0, 0.09019608, 1,
2.224077, -0.5456153, 2.321613, 1, 0, 0.08235294, 1,
2.228727, -1.636996, 2.921073, 1, 0, 0.07843138, 1,
2.241205, -0.72147, 2.043573, 1, 0, 0.07058824, 1,
2.245483, -0.05863023, 1.81689, 1, 0, 0.06666667, 1,
2.258212, 0.6973063, 2.815774, 1, 0, 0.05882353, 1,
2.279119, 1.415792, 2.288102, 1, 0, 0.05490196, 1,
2.334521, 0.4542297, 2.814615, 1, 0, 0.04705882, 1,
2.468209, 0.7498099, 1.343983, 1, 0, 0.04313726, 1,
2.549769, 0.008694901, 1.751986, 1, 0, 0.03529412, 1,
2.610819, -0.8472029, 1.205432, 1, 0, 0.03137255, 1,
2.721579, 0.7204975, 0.3257379, 1, 0, 0.02352941, 1,
2.755549, 1.52242, 1.084545, 1, 0, 0.01960784, 1,
2.792269, -1.035614, 2.235934, 1, 0, 0.01176471, 1,
2.9993, 1.218248, -0.251036, 1, 0, 0.007843138, 1
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
-0.3015138, -4.784773, -7.206705, 0, -0.5, 0.5, 0.5,
-0.3015138, -4.784773, -7.206705, 1, -0.5, 0.5, 0.5,
-0.3015138, -4.784773, -7.206705, 1, 1.5, 0.5, 0.5,
-0.3015138, -4.784773, -7.206705, 0, 1.5, 0.5, 0.5
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
-4.721304, -0.3984472, -7.206705, 0, -0.5, 0.5, 0.5,
-4.721304, -0.3984472, -7.206705, 1, -0.5, 0.5, 0.5,
-4.721304, -0.3984472, -7.206705, 1, 1.5, 0.5, 0.5,
-4.721304, -0.3984472, -7.206705, 0, 1.5, 0.5, 0.5
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
-4.721304, -4.784773, 0.05209517, 0, -0.5, 0.5, 0.5,
-4.721304, -4.784773, 0.05209517, 1, -0.5, 0.5, 0.5,
-4.721304, -4.784773, 0.05209517, 1, 1.5, 0.5, 0.5,
-4.721304, -4.784773, 0.05209517, 0, 1.5, 0.5, 0.5
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
-3, -3.772544, -5.531597,
2, -3.772544, -5.531597,
-3, -3.772544, -5.531597,
-3, -3.941249, -5.810781,
-2, -3.772544, -5.531597,
-2, -3.941249, -5.810781,
-1, -3.772544, -5.531597,
-1, -3.941249, -5.810781,
0, -3.772544, -5.531597,
0, -3.941249, -5.810781,
1, -3.772544, -5.531597,
1, -3.941249, -5.810781,
2, -3.772544, -5.531597,
2, -3.941249, -5.810781
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
-3, -4.278658, -6.369151, 0, -0.5, 0.5, 0.5,
-3, -4.278658, -6.369151, 1, -0.5, 0.5, 0.5,
-3, -4.278658, -6.369151, 1, 1.5, 0.5, 0.5,
-3, -4.278658, -6.369151, 0, 1.5, 0.5, 0.5,
-2, -4.278658, -6.369151, 0, -0.5, 0.5, 0.5,
-2, -4.278658, -6.369151, 1, -0.5, 0.5, 0.5,
-2, -4.278658, -6.369151, 1, 1.5, 0.5, 0.5,
-2, -4.278658, -6.369151, 0, 1.5, 0.5, 0.5,
-1, -4.278658, -6.369151, 0, -0.5, 0.5, 0.5,
-1, -4.278658, -6.369151, 1, -0.5, 0.5, 0.5,
-1, -4.278658, -6.369151, 1, 1.5, 0.5, 0.5,
-1, -4.278658, -6.369151, 0, 1.5, 0.5, 0.5,
0, -4.278658, -6.369151, 0, -0.5, 0.5, 0.5,
0, -4.278658, -6.369151, 1, -0.5, 0.5, 0.5,
0, -4.278658, -6.369151, 1, 1.5, 0.5, 0.5,
0, -4.278658, -6.369151, 0, 1.5, 0.5, 0.5,
1, -4.278658, -6.369151, 0, -0.5, 0.5, 0.5,
1, -4.278658, -6.369151, 1, -0.5, 0.5, 0.5,
1, -4.278658, -6.369151, 1, 1.5, 0.5, 0.5,
1, -4.278658, -6.369151, 0, 1.5, 0.5, 0.5,
2, -4.278658, -6.369151, 0, -0.5, 0.5, 0.5,
2, -4.278658, -6.369151, 1, -0.5, 0.5, 0.5,
2, -4.278658, -6.369151, 1, 1.5, 0.5, 0.5,
2, -4.278658, -6.369151, 0, 1.5, 0.5, 0.5
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
-3.701353, -3, -5.531597,
-3.701353, 2, -5.531597,
-3.701353, -3, -5.531597,
-3.871344, -3, -5.810781,
-3.701353, -2, -5.531597,
-3.871344, -2, -5.810781,
-3.701353, -1, -5.531597,
-3.871344, -1, -5.810781,
-3.701353, 0, -5.531597,
-3.871344, 0, -5.810781,
-3.701353, 1, -5.531597,
-3.871344, 1, -5.810781,
-3.701353, 2, -5.531597,
-3.871344, 2, -5.810781
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
-4.211329, -3, -6.369151, 0, -0.5, 0.5, 0.5,
-4.211329, -3, -6.369151, 1, -0.5, 0.5, 0.5,
-4.211329, -3, -6.369151, 1, 1.5, 0.5, 0.5,
-4.211329, -3, -6.369151, 0, 1.5, 0.5, 0.5,
-4.211329, -2, -6.369151, 0, -0.5, 0.5, 0.5,
-4.211329, -2, -6.369151, 1, -0.5, 0.5, 0.5,
-4.211329, -2, -6.369151, 1, 1.5, 0.5, 0.5,
-4.211329, -2, -6.369151, 0, 1.5, 0.5, 0.5,
-4.211329, -1, -6.369151, 0, -0.5, 0.5, 0.5,
-4.211329, -1, -6.369151, 1, -0.5, 0.5, 0.5,
-4.211329, -1, -6.369151, 1, 1.5, 0.5, 0.5,
-4.211329, -1, -6.369151, 0, 1.5, 0.5, 0.5,
-4.211329, 0, -6.369151, 0, -0.5, 0.5, 0.5,
-4.211329, 0, -6.369151, 1, -0.5, 0.5, 0.5,
-4.211329, 0, -6.369151, 1, 1.5, 0.5, 0.5,
-4.211329, 0, -6.369151, 0, 1.5, 0.5, 0.5,
-4.211329, 1, -6.369151, 0, -0.5, 0.5, 0.5,
-4.211329, 1, -6.369151, 1, -0.5, 0.5, 0.5,
-4.211329, 1, -6.369151, 1, 1.5, 0.5, 0.5,
-4.211329, 1, -6.369151, 0, 1.5, 0.5, 0.5,
-4.211329, 2, -6.369151, 0, -0.5, 0.5, 0.5,
-4.211329, 2, -6.369151, 1, -0.5, 0.5, 0.5,
-4.211329, 2, -6.369151, 1, 1.5, 0.5, 0.5,
-4.211329, 2, -6.369151, 0, 1.5, 0.5, 0.5
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
-3.701353, -3.772544, -4,
-3.701353, -3.772544, 4,
-3.701353, -3.772544, -4,
-3.871344, -3.941249, -4,
-3.701353, -3.772544, -2,
-3.871344, -3.941249, -2,
-3.701353, -3.772544, 0,
-3.871344, -3.941249, 0,
-3.701353, -3.772544, 2,
-3.871344, -3.941249, 2,
-3.701353, -3.772544, 4,
-3.871344, -3.941249, 4
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
-4.211329, -4.278658, -4, 0, -0.5, 0.5, 0.5,
-4.211329, -4.278658, -4, 1, -0.5, 0.5, 0.5,
-4.211329, -4.278658, -4, 1, 1.5, 0.5, 0.5,
-4.211329, -4.278658, -4, 0, 1.5, 0.5, 0.5,
-4.211329, -4.278658, -2, 0, -0.5, 0.5, 0.5,
-4.211329, -4.278658, -2, 1, -0.5, 0.5, 0.5,
-4.211329, -4.278658, -2, 1, 1.5, 0.5, 0.5,
-4.211329, -4.278658, -2, 0, 1.5, 0.5, 0.5,
-4.211329, -4.278658, 0, 0, -0.5, 0.5, 0.5,
-4.211329, -4.278658, 0, 1, -0.5, 0.5, 0.5,
-4.211329, -4.278658, 0, 1, 1.5, 0.5, 0.5,
-4.211329, -4.278658, 0, 0, 1.5, 0.5, 0.5,
-4.211329, -4.278658, 2, 0, -0.5, 0.5, 0.5,
-4.211329, -4.278658, 2, 1, -0.5, 0.5, 0.5,
-4.211329, -4.278658, 2, 1, 1.5, 0.5, 0.5,
-4.211329, -4.278658, 2, 0, 1.5, 0.5, 0.5,
-4.211329, -4.278658, 4, 0, -0.5, 0.5, 0.5,
-4.211329, -4.278658, 4, 1, -0.5, 0.5, 0.5,
-4.211329, -4.278658, 4, 1, 1.5, 0.5, 0.5,
-4.211329, -4.278658, 4, 0, 1.5, 0.5, 0.5
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
-3.701353, -3.772544, -5.531597,
-3.701353, 2.97565, -5.531597,
-3.701353, -3.772544, 5.635787,
-3.701353, 2.97565, 5.635787,
-3.701353, -3.772544, -5.531597,
-3.701353, -3.772544, 5.635787,
-3.701353, 2.97565, -5.531597,
-3.701353, 2.97565, 5.635787,
-3.701353, -3.772544, -5.531597,
3.098325, -3.772544, -5.531597,
-3.701353, -3.772544, 5.635787,
3.098325, -3.772544, 5.635787,
-3.701353, 2.97565, -5.531597,
3.098325, 2.97565, -5.531597,
-3.701353, 2.97565, 5.635787,
3.098325, 2.97565, 5.635787,
3.098325, -3.772544, -5.531597,
3.098325, 2.97565, -5.531597,
3.098325, -3.772544, 5.635787,
3.098325, 2.97565, 5.635787,
3.098325, -3.772544, -5.531597,
3.098325, -3.772544, 5.635787,
3.098325, 2.97565, -5.531597,
3.098325, 2.97565, 5.635787
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
var radius = 7.856671;
var distance = 34.95522;
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
mvMatrix.translate( 0.3015138, 0.3984472, -0.05209517 );
mvMatrix.scale( 1.249293, 1.258824, 0.7606783 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.95522);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
picloram<-read.table("picloram.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-picloram$V2
```

```
## Error in eval(expr, envir, enclos): object 'picloram' not found
```

```r
y<-picloram$V3
```

```
## Error in eval(expr, envir, enclos): object 'picloram' not found
```

```r
z<-picloram$V4
```

```
## Error in eval(expr, envir, enclos): object 'picloram' not found
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
-3.602328, 0.09995354, -0.3017882, 0, 0, 1, 1, 1,
-2.737146, -0.5715517, -4.184838, 1, 0, 0, 1, 1,
-2.682785, -1.2385, -2.838622, 1, 0, 0, 1, 1,
-2.640144, -0.8848294, -0.8503831, 1, 0, 0, 1, 1,
-2.607931, 0.2491196, -2.196914, 1, 0, 0, 1, 1,
-2.557922, -1.656101, -1.047974, 1, 0, 0, 1, 1,
-2.423454, -0.3483847, -2.993528, 0, 0, 0, 1, 1,
-2.399883, 1.597768, -1.858464, 0, 0, 0, 1, 1,
-2.399876, 0.7579693, 0.8817143, 0, 0, 0, 1, 1,
-2.370951, -0.3642671, -1.184672, 0, 0, 0, 1, 1,
-2.3664, 0.5866306, 1.07818, 0, 0, 0, 1, 1,
-2.358633, 1.534181, -0.9163433, 0, 0, 0, 1, 1,
-2.352398, -1.814027, -0.795191, 0, 0, 0, 1, 1,
-2.283535, 0.9939424, -1.007914, 1, 1, 1, 1, 1,
-2.263444, -0.8505178, -2.978468, 1, 1, 1, 1, 1,
-2.225456, 1.120264, -0.5137765, 1, 1, 1, 1, 1,
-2.22212, -0.3937177, -1.701538, 1, 1, 1, 1, 1,
-2.144757, 0.7621859, 0.2035393, 1, 1, 1, 1, 1,
-2.136559, 0.4226072, -2.105547, 1, 1, 1, 1, 1,
-2.068141, 0.2221613, -0.3669502, 1, 1, 1, 1, 1,
-2.018098, 0.347724, -1.566781, 1, 1, 1, 1, 1,
-2.001555, 0.8696046, -1.22146, 1, 1, 1, 1, 1,
-2.000825, 1.032278, -1.573343, 1, 1, 1, 1, 1,
-1.994944, 1.29563, -0.9847368, 1, 1, 1, 1, 1,
-1.970845, -0.4462215, -1.980218, 1, 1, 1, 1, 1,
-1.952221, 0.6199508, -0.7049903, 1, 1, 1, 1, 1,
-1.942979, -0.2390212, -1.317988, 1, 1, 1, 1, 1,
-1.94241, 1.141171, -0.6464605, 1, 1, 1, 1, 1,
-1.93905, -0.6936077, -2.196391, 0, 0, 1, 1, 1,
-1.930257, -1.628882, -2.708705, 1, 0, 0, 1, 1,
-1.928326, -0.4779383, -3.451827, 1, 0, 0, 1, 1,
-1.924538, 0.512832, -1.627146, 1, 0, 0, 1, 1,
-1.918663, -0.6210856, -3.172646, 1, 0, 0, 1, 1,
-1.898079, -0.8573661, -2.391158, 1, 0, 0, 1, 1,
-1.886342, 0.2490021, -1.375471, 0, 0, 0, 1, 1,
-1.882763, -0.7101031, -2.111448, 0, 0, 0, 1, 1,
-1.875197, 0.3768938, -1.60115, 0, 0, 0, 1, 1,
-1.874572, 1.74772, -2.095225, 0, 0, 0, 1, 1,
-1.842126, -2.386447, -2.369771, 0, 0, 0, 1, 1,
-1.841659, 0.6046389, -2.049002, 0, 0, 0, 1, 1,
-1.827379, 0.207561, -0.2529194, 0, 0, 0, 1, 1,
-1.811136, 0.09256969, -0.005483031, 1, 1, 1, 1, 1,
-1.809884, 1.694809, -0.1745024, 1, 1, 1, 1, 1,
-1.785332, -0.3624281, -1.380728, 1, 1, 1, 1, 1,
-1.758461, 0.9721076, -0.8390235, 1, 1, 1, 1, 1,
-1.719106, -0.3596532, -0.8070582, 1, 1, 1, 1, 1,
-1.715188, -1.62625, -2.871415, 1, 1, 1, 1, 1,
-1.71177, 1.887439, -0.1049143, 1, 1, 1, 1, 1,
-1.705717, -0.6533349, -2.9053, 1, 1, 1, 1, 1,
-1.696347, -0.4725298, -1.870219, 1, 1, 1, 1, 1,
-1.684815, -0.08435865, -0.8989856, 1, 1, 1, 1, 1,
-1.665268, 1.077671, -1.562995, 1, 1, 1, 1, 1,
-1.663468, 1.576978, -0.388746, 1, 1, 1, 1, 1,
-1.64684, -1.94631, -1.33579, 1, 1, 1, 1, 1,
-1.606262, 0.871978, -0.4436774, 1, 1, 1, 1, 1,
-1.605988, 0.0229552, -2.282278, 1, 1, 1, 1, 1,
-1.605864, -2.274062, -2.257243, 0, 0, 1, 1, 1,
-1.601311, 0.2547575, -2.22218, 1, 0, 0, 1, 1,
-1.59431, -1.560043, -1.910571, 1, 0, 0, 1, 1,
-1.586195, 0.1214942, -1.328187, 1, 0, 0, 1, 1,
-1.569788, 1.813231, -0.9858024, 1, 0, 0, 1, 1,
-1.567405, -1.592723, -2.154312, 1, 0, 0, 1, 1,
-1.561771, 1.37557, -2.470215, 0, 0, 0, 1, 1,
-1.56091, -1.323446, -2.422608, 0, 0, 0, 1, 1,
-1.55173, -0.2070345, -1.020058, 0, 0, 0, 1, 1,
-1.542702, -1.364435, -3.059899, 0, 0, 0, 1, 1,
-1.531124, 0.7715267, -0.8736464, 0, 0, 0, 1, 1,
-1.530818, 2.01239, 0.4649935, 0, 0, 0, 1, 1,
-1.527879, 0.8687398, -0.5026017, 0, 0, 0, 1, 1,
-1.523375, 0.9312633, -0.5959765, 1, 1, 1, 1, 1,
-1.520913, 0.1017279, -0.7287436, 1, 1, 1, 1, 1,
-1.517156, -1.190679, -4.238322, 1, 1, 1, 1, 1,
-1.506141, -0.4538211, -2.147005, 1, 1, 1, 1, 1,
-1.503217, 0.172652, -0.9498593, 1, 1, 1, 1, 1,
-1.48346, -0.452425, -2.740127, 1, 1, 1, 1, 1,
-1.481537, -1.34953, -3.798067, 1, 1, 1, 1, 1,
-1.472348, -2.12311, -2.795085, 1, 1, 1, 1, 1,
-1.472331, -0.1410654, 0.09605695, 1, 1, 1, 1, 1,
-1.471974, 0.3219843, 1.119542, 1, 1, 1, 1, 1,
-1.468399, 1.494133, -0.6310938, 1, 1, 1, 1, 1,
-1.465422, 0.8859849, -0.7909907, 1, 1, 1, 1, 1,
-1.461725, -1.526017, -1.697816, 1, 1, 1, 1, 1,
-1.440037, -1.731118, -2.364144, 1, 1, 1, 1, 1,
-1.437314, 1.597841, -1.512503, 1, 1, 1, 1, 1,
-1.430884, -0.5632787, -2.795476, 0, 0, 1, 1, 1,
-1.428313, 0.8247141, 1.283407, 1, 0, 0, 1, 1,
-1.425122, 0.07111477, -0.3239709, 1, 0, 0, 1, 1,
-1.418871, -0.2047412, -2.336833, 1, 0, 0, 1, 1,
-1.418599, 0.3942011, 0.05864681, 1, 0, 0, 1, 1,
-1.388246, 0.1088697, -0.4399354, 1, 0, 0, 1, 1,
-1.369944, 1.158246, -0.7430304, 0, 0, 0, 1, 1,
-1.363517, 0.9064685, -0.3826378, 0, 0, 0, 1, 1,
-1.357262, -0.2783493, 0.2787013, 0, 0, 0, 1, 1,
-1.355232, 0.1913351, -1.043868, 0, 0, 0, 1, 1,
-1.347516, 0.5148002, -1.130451, 0, 0, 0, 1, 1,
-1.346396, -0.2000031, -3.783458, 0, 0, 0, 1, 1,
-1.340669, 1.610491, -1.615924, 0, 0, 0, 1, 1,
-1.340178, -0.7764048, -3.623515, 1, 1, 1, 1, 1,
-1.335624, 1.437698, -0.6186536, 1, 1, 1, 1, 1,
-1.335163, -0.6207799, -1.918066, 1, 1, 1, 1, 1,
-1.305831, 0.6411706, -2.201187, 1, 1, 1, 1, 1,
-1.303903, -1.053123, -3.640593, 1, 1, 1, 1, 1,
-1.290662, 0.9667668, -1.29912, 1, 1, 1, 1, 1,
-1.28408, 0.2463581, -1.025493, 1, 1, 1, 1, 1,
-1.281254, 0.2323395, -2.089879, 1, 1, 1, 1, 1,
-1.279012, -0.06878208, -0.4749243, 1, 1, 1, 1, 1,
-1.26794, 0.006194769, -2.518796, 1, 1, 1, 1, 1,
-1.266892, -1.341795, -2.778011, 1, 1, 1, 1, 1,
-1.266152, -1.380283, -3.17163, 1, 1, 1, 1, 1,
-1.26612, -0.5114067, -0.9904479, 1, 1, 1, 1, 1,
-1.265615, -0.07564405, -2.241758, 1, 1, 1, 1, 1,
-1.260028, -1.966752, -1.56984, 1, 1, 1, 1, 1,
-1.259657, -0.7033966, -2.595545, 0, 0, 1, 1, 1,
-1.251269, 0.1710111, -1.20866, 1, 0, 0, 1, 1,
-1.238758, -0.2318085, -3.057633, 1, 0, 0, 1, 1,
-1.234006, -0.08557224, 0.09917883, 1, 0, 0, 1, 1,
-1.230368, -1.047251, -3.13018, 1, 0, 0, 1, 1,
-1.229257, -3.648135, -3.572039, 1, 0, 0, 1, 1,
-1.224482, 0.6756103, -0.6625418, 0, 0, 0, 1, 1,
-1.207215, 1.05988, -1.881114, 0, 0, 0, 1, 1,
-1.207103, -1.53591, -0.1162502, 0, 0, 0, 1, 1,
-1.201217, 0.02037335, -2.088847, 0, 0, 0, 1, 1,
-1.199244, -0.686998, -1.699908, 0, 0, 0, 1, 1,
-1.19472, -0.2143512, -1.601621, 0, 0, 0, 1, 1,
-1.184362, 1.128352e-05, 0.03111955, 0, 0, 0, 1, 1,
-1.182685, 2.354428, -0.4259474, 1, 1, 1, 1, 1,
-1.179366, 0.2295953, -1.721619, 1, 1, 1, 1, 1,
-1.177778, 1.105614, -1.083008, 1, 1, 1, 1, 1,
-1.174619, 1.402271, -0.221837, 1, 1, 1, 1, 1,
-1.173143, -2.165653, -2.223604, 1, 1, 1, 1, 1,
-1.16998, -0.316169, -0.05255123, 1, 1, 1, 1, 1,
-1.168347, -0.3961278, -2.769028, 1, 1, 1, 1, 1,
-1.153497, 0.0393952, -1.856916, 1, 1, 1, 1, 1,
-1.150478, -0.6815099, -0.4116104, 1, 1, 1, 1, 1,
-1.149069, -1.306786, -0.572271, 1, 1, 1, 1, 1,
-1.143408, 0.3207752, -1.95879, 1, 1, 1, 1, 1,
-1.132767, -0.712424, -4.174682, 1, 1, 1, 1, 1,
-1.132069, 1.124431, -0.5423064, 1, 1, 1, 1, 1,
-1.128846, 0.3012789, -0.2300867, 1, 1, 1, 1, 1,
-1.127648, -0.8896633, -1.604455, 1, 1, 1, 1, 1,
-1.123517, 0.3632092, -2.095378, 0, 0, 1, 1, 1,
-1.121889, -0.9018179, -1.074077, 1, 0, 0, 1, 1,
-1.121309, -0.2528716, -2.101202, 1, 0, 0, 1, 1,
-1.119008, -0.1228614, -2.227439, 1, 0, 0, 1, 1,
-1.11214, 0.4820187, 0.2507237, 1, 0, 0, 1, 1,
-1.110355, -0.6855711, -3.156724, 1, 0, 0, 1, 1,
-1.110197, -0.2367191, -2.085929, 0, 0, 0, 1, 1,
-1.109844, -1.425143, -2.497661, 0, 0, 0, 1, 1,
-1.094069, -1.430184, -1.395202, 0, 0, 0, 1, 1,
-1.080453, 0.948681, -0.1598927, 0, 0, 0, 1, 1,
-1.07058, -0.1282718, -2.038492, 0, 0, 0, 1, 1,
-1.067215, -0.009126975, -0.9098085, 0, 0, 0, 1, 1,
-1.066814, 0.3324731, -1.433247, 0, 0, 0, 1, 1,
-1.066812, 0.1844334, -0.8761348, 1, 1, 1, 1, 1,
-1.065246, -1.334723, -3.612818, 1, 1, 1, 1, 1,
-1.064318, -0.9082457, -3.479619, 1, 1, 1, 1, 1,
-1.058295, 0.1840761, -1.407129, 1, 1, 1, 1, 1,
-1.054523, 1.033915, -1.440405, 1, 1, 1, 1, 1,
-1.04489, 0.635995, -2.877264, 1, 1, 1, 1, 1,
-1.043125, -1.85858, -0.5122696, 1, 1, 1, 1, 1,
-1.041677, -0.7492191, -0.3758995, 1, 1, 1, 1, 1,
-1.027866, 0.4182985, -2.255599, 1, 1, 1, 1, 1,
-1.025653, 1.132144, 0.6112971, 1, 1, 1, 1, 1,
-1.024839, 2.315872, -0.0868246, 1, 1, 1, 1, 1,
-1.022571, 0.5291108, -1.242828, 1, 1, 1, 1, 1,
-1.019466, -1.518605, -3.103461, 1, 1, 1, 1, 1,
-1.007281, 1.351006, 0.1607778, 1, 1, 1, 1, 1,
-0.9944974, 0.4943724, -0.8274946, 1, 1, 1, 1, 1,
-0.9888592, -0.7451109, -1.784544, 0, 0, 1, 1, 1,
-0.9881484, 0.7376911, -1.1779, 1, 0, 0, 1, 1,
-0.9851925, -0.1283177, -1.23054, 1, 0, 0, 1, 1,
-0.9846304, -0.4311775, -1.660334, 1, 0, 0, 1, 1,
-0.9690572, -1.759344, -1.726434, 1, 0, 0, 1, 1,
-0.9656599, -1.056654, -4.137477, 1, 0, 0, 1, 1,
-0.9609706, -0.5613796, -1.920349, 0, 0, 0, 1, 1,
-0.957309, -1.599262, -1.814189, 0, 0, 0, 1, 1,
-0.9542645, 0.902939, 0.8488524, 0, 0, 0, 1, 1,
-0.9525765, -1.244295, -3.676348, 0, 0, 0, 1, 1,
-0.9509376, 0.2665589, -1.977365, 0, 0, 0, 1, 1,
-0.9349518, 0.9246801, -0.5721357, 0, 0, 0, 1, 1,
-0.9311234, -1.596942, -1.666728, 0, 0, 0, 1, 1,
-0.9283389, -1.010519, -0.6892598, 1, 1, 1, 1, 1,
-0.92805, -1.444346, -3.061526, 1, 1, 1, 1, 1,
-0.909426, -0.01641756, -1.19571, 1, 1, 1, 1, 1,
-0.9074134, -0.4467671, -2.494372, 1, 1, 1, 1, 1,
-0.9018251, 0.5197892, -0.7824403, 1, 1, 1, 1, 1,
-0.9000968, -0.1558011, -1.171162, 1, 1, 1, 1, 1,
-0.8917794, -2.131339, -1.458467, 1, 1, 1, 1, 1,
-0.8854411, -0.1150215, -2.090559, 1, 1, 1, 1, 1,
-0.8826692, 1.356094, -0.02406339, 1, 1, 1, 1, 1,
-0.8746353, -0.3578112, -1.202137, 1, 1, 1, 1, 1,
-0.8744625, -0.1290339, -2.39794, 1, 1, 1, 1, 1,
-0.8725162, -0.8160254, -3.020445, 1, 1, 1, 1, 1,
-0.8684362, -0.1469557, -2.936466, 1, 1, 1, 1, 1,
-0.8650515, -0.1038957, -1.153655, 1, 1, 1, 1, 1,
-0.8577206, -1.739291, -2.677601, 1, 1, 1, 1, 1,
-0.8497426, 1.013693, -0.7163975, 0, 0, 1, 1, 1,
-0.846499, -0.3187816, -2.758779, 1, 0, 0, 1, 1,
-0.8454688, 2.542981, -0.5099136, 1, 0, 0, 1, 1,
-0.8314772, -0.4764911, -1.141279, 1, 0, 0, 1, 1,
-0.8283045, -0.2339827, -2.532174, 1, 0, 0, 1, 1,
-0.8223988, -0.5383282, -1.956791, 1, 0, 0, 1, 1,
-0.8221738, -1.371213, -1.743388, 0, 0, 0, 1, 1,
-0.8211927, 0.4493569, -0.6737061, 0, 0, 0, 1, 1,
-0.816065, 0.8961443, -2.431765, 0, 0, 0, 1, 1,
-0.8109496, 1.261811, 0.3121905, 0, 0, 0, 1, 1,
-0.8085974, 1.280934, -0.5532504, 0, 0, 0, 1, 1,
-0.8067355, 0.1079621, -3.487858, 0, 0, 0, 1, 1,
-0.8054572, 2.068561, -0.5555026, 0, 0, 0, 1, 1,
-0.8023342, 1.030777, 0.4043433, 1, 1, 1, 1, 1,
-0.8001078, -1.189881, -0.5023935, 1, 1, 1, 1, 1,
-0.800041, 0.2924595, 0.4079786, 1, 1, 1, 1, 1,
-0.8000351, 0.6447766, -0.01555412, 1, 1, 1, 1, 1,
-0.799117, 0.7749333, -1.114461, 1, 1, 1, 1, 1,
-0.7980607, 0.6568668, 0.4861656, 1, 1, 1, 1, 1,
-0.7922469, 0.755363, -1.825024, 1, 1, 1, 1, 1,
-0.7895485, -0.2869561, -3.339219, 1, 1, 1, 1, 1,
-0.7885755, -0.4830325, -2.378871, 1, 1, 1, 1, 1,
-0.7841405, -0.9912343, -1.598076, 1, 1, 1, 1, 1,
-0.7823496, -0.3957419, -0.5646262, 1, 1, 1, 1, 1,
-0.7744184, 1.785409, -0.9527937, 1, 1, 1, 1, 1,
-0.7724501, 0.04616762, -1.90754, 1, 1, 1, 1, 1,
-0.7678429, 1.603467, -0.2769669, 1, 1, 1, 1, 1,
-0.7651278, 0.6442897, -0.2240013, 1, 1, 1, 1, 1,
-0.7633909, 1.036404, -0.8286579, 0, 0, 1, 1, 1,
-0.7603464, 0.8988433, -1.578515, 1, 0, 0, 1, 1,
-0.7551346, -0.8483983, -2.450804, 1, 0, 0, 1, 1,
-0.7546595, -1.234405, -1.932661, 1, 0, 0, 1, 1,
-0.7537208, -1.59314, -2.148189, 1, 0, 0, 1, 1,
-0.7491709, 0.9080315, -1.714805, 1, 0, 0, 1, 1,
-0.7428015, -0.3135708, -2.280094, 0, 0, 0, 1, 1,
-0.7424312, 0.08523329, -2.027014, 0, 0, 0, 1, 1,
-0.7424061, 0.8113121, -1.305452, 0, 0, 0, 1, 1,
-0.7414541, -0.07399046, -2.432474, 0, 0, 0, 1, 1,
-0.740584, -1.119685, -3.196539, 0, 0, 0, 1, 1,
-0.7404641, -0.03287437, -4.076463, 0, 0, 0, 1, 1,
-0.7384134, -0.1836777, -0.4773531, 0, 0, 0, 1, 1,
-0.7328986, 0.5300557, -1.583073, 1, 1, 1, 1, 1,
-0.7308601, -2.227994, -3.649388, 1, 1, 1, 1, 1,
-0.7296467, -0.8689551, -1.990422, 1, 1, 1, 1, 1,
-0.7287705, 1.312845, -0.956473, 1, 1, 1, 1, 1,
-0.725562, 0.1399979, -2.971566, 1, 1, 1, 1, 1,
-0.7251888, -2.328136, -3.302635, 1, 1, 1, 1, 1,
-0.7250249, 1.218744, -1.355726, 1, 1, 1, 1, 1,
-0.7237843, 1.8527, 0.6990515, 1, 1, 1, 1, 1,
-0.720729, 1.883933, -0.8558772, 1, 1, 1, 1, 1,
-0.7137755, 0.4958121, 0.1495796, 1, 1, 1, 1, 1,
-0.7122881, 1.563647, 1.036276, 1, 1, 1, 1, 1,
-0.7052846, 0.44515, 1.654092, 1, 1, 1, 1, 1,
-0.7039629, -0.5498691, -4.332697, 1, 1, 1, 1, 1,
-0.7025793, 0.1663027, -2.637042, 1, 1, 1, 1, 1,
-0.6909965, -1.59445, -3.787217, 1, 1, 1, 1, 1,
-0.690061, -1.317749, -3.792882, 0, 0, 1, 1, 1,
-0.6823369, -0.8450446, -3.363902, 1, 0, 0, 1, 1,
-0.6790354, 0.3225204, 0.5600021, 1, 0, 0, 1, 1,
-0.6773783, -0.3804241, -1.443245, 1, 0, 0, 1, 1,
-0.6756563, 0.5650663, 0.3790012, 1, 0, 0, 1, 1,
-0.6753846, 0.0673618, -0.3617196, 1, 0, 0, 1, 1,
-0.6743723, 0.6568161, -0.9147339, 0, 0, 0, 1, 1,
-0.6743466, 0.7765693, 0.3195252, 0, 0, 0, 1, 1,
-0.6712095, -0.19578, -1.934913, 0, 0, 0, 1, 1,
-0.6685923, 0.4827906, -1.419034, 0, 0, 0, 1, 1,
-0.6667638, 1.863862, 0.1270174, 0, 0, 0, 1, 1,
-0.6623194, -1.524553, -3.902027, 0, 0, 0, 1, 1,
-0.6622853, -0.2496151, -1.857536, 0, 0, 0, 1, 1,
-0.6622426, -0.8964917, -3.337897, 1, 1, 1, 1, 1,
-0.6555883, -0.7470936, -2.813376, 1, 1, 1, 1, 1,
-0.6548873, -1.044085, -3.423318, 1, 1, 1, 1, 1,
-0.6472011, 0.7931061, 0.1631987, 1, 1, 1, 1, 1,
-0.6443551, 0.4235869, -0.4231952, 1, 1, 1, 1, 1,
-0.6427966, 2.314828, 0.6735699, 1, 1, 1, 1, 1,
-0.6405302, -0.1841104, -1.900617, 1, 1, 1, 1, 1,
-0.637537, -0.4684484, -1.730347, 1, 1, 1, 1, 1,
-0.6359298, -0.1073819, -1.550473, 1, 1, 1, 1, 1,
-0.6348572, 0.5628623, -1.622915, 1, 1, 1, 1, 1,
-0.6335567, 0.6704734, -0.8849422, 1, 1, 1, 1, 1,
-0.6315768, -0.2609755, -2.360835, 1, 1, 1, 1, 1,
-0.6211731, -1.511849, -3.205504, 1, 1, 1, 1, 1,
-0.6195036, 0.8755203, -0.826955, 1, 1, 1, 1, 1,
-0.6131551, -0.7604222, -1.855009, 1, 1, 1, 1, 1,
-0.6096175, -0.260606, -1.14484, 0, 0, 1, 1, 1,
-0.60434, 0.4347029, -1.768905, 1, 0, 0, 1, 1,
-0.6026228, 0.3351079, -1.739533, 1, 0, 0, 1, 1,
-0.5943579, -0.764467, -3.597552, 1, 0, 0, 1, 1,
-0.5937217, 0.06453369, -1.624905, 1, 0, 0, 1, 1,
-0.591869, -1.25394, -2.164012, 1, 0, 0, 1, 1,
-0.5862298, -0.108989, 0.08761601, 0, 0, 0, 1, 1,
-0.5831411, 0.3185554, -0.8993027, 0, 0, 0, 1, 1,
-0.5830942, 1.235489, -2.493927, 0, 0, 0, 1, 1,
-0.5744777, -0.4276003, -2.387164, 0, 0, 0, 1, 1,
-0.573745, -0.2797581, -1.360873, 0, 0, 0, 1, 1,
-0.5730001, 0.07195108, -1.765143, 0, 0, 0, 1, 1,
-0.56902, -0.8476976, -0.7504597, 0, 0, 0, 1, 1,
-0.5677117, -0.1668507, -1.760603, 1, 1, 1, 1, 1,
-0.5669634, 2.705464, 2.252351, 1, 1, 1, 1, 1,
-0.5504847, -0.2887687, -1.534501, 1, 1, 1, 1, 1,
-0.5461758, 1.50744, -1.829643, 1, 1, 1, 1, 1,
-0.5408899, -0.004245392, -2.198512, 1, 1, 1, 1, 1,
-0.5397916, -0.1534949, -2.883224, 1, 1, 1, 1, 1,
-0.533684, 0.4658154, -2.469023, 1, 1, 1, 1, 1,
-0.5174384, 2.384551, 0.4352493, 1, 1, 1, 1, 1,
-0.5134892, 0.55771, -0.597343, 1, 1, 1, 1, 1,
-0.5133116, -2.043753, -4.079905, 1, 1, 1, 1, 1,
-0.5128615, 0.05103812, -1.734729, 1, 1, 1, 1, 1,
-0.512688, 2.141619, 0.5243647, 1, 1, 1, 1, 1,
-0.5061199, 0.9203856, -1.656189, 1, 1, 1, 1, 1,
-0.5051935, 1.38643, -0.6239568, 1, 1, 1, 1, 1,
-0.4995666, -0.9275604, -0.9104704, 1, 1, 1, 1, 1,
-0.4990523, -0.1428357, -1.615983, 0, 0, 1, 1, 1,
-0.4960446, -2.729006, -3.50206, 1, 0, 0, 1, 1,
-0.4926144, 0.8852146, 0.528089, 1, 0, 0, 1, 1,
-0.4892572, -0.216424, -1.970252, 1, 0, 0, 1, 1,
-0.4883084, 1.067518, 0.7477635, 1, 0, 0, 1, 1,
-0.4852371, -0.1818655, -1.27767, 1, 0, 0, 1, 1,
-0.4844724, 0.3210894, -1.475788, 0, 0, 0, 1, 1,
-0.4836295, -1.599363, -3.293086, 0, 0, 0, 1, 1,
-0.482717, 0.6457849, -1.882333, 0, 0, 0, 1, 1,
-0.480622, 0.7907007, -2.039978, 0, 0, 0, 1, 1,
-0.4797879, -0.8760947, -4.673884, 0, 0, 0, 1, 1,
-0.4795584, -1.915868, -2.492509, 0, 0, 0, 1, 1,
-0.4768078, -0.2423892, -1.657588, 0, 0, 0, 1, 1,
-0.4702209, 0.8621585, -1.580629, 1, 1, 1, 1, 1,
-0.4673598, -0.08946391, -1.294661, 1, 1, 1, 1, 1,
-0.4628457, 0.5148457, -0.4702612, 1, 1, 1, 1, 1,
-0.4613564, -0.6386889, -3.041944, 1, 1, 1, 1, 1,
-0.4559155, -0.5472214, -3.120572, 1, 1, 1, 1, 1,
-0.453057, -0.1652114, -2.067007, 1, 1, 1, 1, 1,
-0.4525282, -0.1325026, -2.12745, 1, 1, 1, 1, 1,
-0.4500588, 0.8548408, -2.053659, 1, 1, 1, 1, 1,
-0.4497579, 1.097579, 0.4208015, 1, 1, 1, 1, 1,
-0.4456427, 0.8235412, -0.1892099, 1, 1, 1, 1, 1,
-0.4395747, 1.593423, 0.1183379, 1, 1, 1, 1, 1,
-0.4323759, 1.096742, -0.03064106, 1, 1, 1, 1, 1,
-0.4321827, 0.3619057, 0.7019114, 1, 1, 1, 1, 1,
-0.4320693, 0.3544396, -0.4786467, 1, 1, 1, 1, 1,
-0.431212, -0.2247208, -1.414977, 1, 1, 1, 1, 1,
-0.4303483, 0.7862297, -1.639697, 0, 0, 1, 1, 1,
-0.4282572, 1.422539, -0.1322133, 1, 0, 0, 1, 1,
-0.4276152, -0.326614, -2.429144, 1, 0, 0, 1, 1,
-0.4217416, -0.9050305, -1.254448, 1, 0, 0, 1, 1,
-0.4196496, 2.225554, -0.3677014, 1, 0, 0, 1, 1,
-0.4176429, -0.8450704, -4.120184, 1, 0, 0, 1, 1,
-0.4147136, -0.5563663, -1.839105, 0, 0, 0, 1, 1,
-0.4146075, -0.1885314, -3.412086, 0, 0, 0, 1, 1,
-0.4130135, 0.09516826, -1.562836, 0, 0, 0, 1, 1,
-0.4094308, -0.06664582, -0.6380545, 0, 0, 0, 1, 1,
-0.409223, -0.3342772, -2.340811, 0, 0, 0, 1, 1,
-0.405771, -0.5262902, -2.147445, 0, 0, 0, 1, 1,
-0.3992489, 0.1435507, -1.38717, 0, 0, 0, 1, 1,
-0.3967391, 0.5442138, -2.367763, 1, 1, 1, 1, 1,
-0.3913027, -2.086626, -2.494833, 1, 1, 1, 1, 1,
-0.389679, 1.118625, -0.9541701, 1, 1, 1, 1, 1,
-0.3842303, 1.32044, -0.354872, 1, 1, 1, 1, 1,
-0.3776363, -0.6269579, -1.255387, 1, 1, 1, 1, 1,
-0.3751121, -2.00605, -1.991987, 1, 1, 1, 1, 1,
-0.3742687, -1.167516, -4.314728, 1, 1, 1, 1, 1,
-0.3733536, -0.4118085, -2.58146, 1, 1, 1, 1, 1,
-0.3708245, -1.514323, -1.695342, 1, 1, 1, 1, 1,
-0.3691671, 0.7276407, -1.537242, 1, 1, 1, 1, 1,
-0.3571427, -0.221037, -1.306055, 1, 1, 1, 1, 1,
-0.3564487, -0.6126951, -2.385792, 1, 1, 1, 1, 1,
-0.3555751, 0.08579268, -2.222362, 1, 1, 1, 1, 1,
-0.3548104, -1.519885, -2.089068, 1, 1, 1, 1, 1,
-0.3514782, -0.7851781, -3.851698, 1, 1, 1, 1, 1,
-0.3485959, 0.5347247, -2.356413, 0, 0, 1, 1, 1,
-0.3458019, -0.7780123, -1.850155, 1, 0, 0, 1, 1,
-0.3322395, -0.5359675, -2.167214, 1, 0, 0, 1, 1,
-0.3305835, -0.870705, -2.600261, 1, 0, 0, 1, 1,
-0.3298255, -1.070375, -3.606796, 1, 0, 0, 1, 1,
-0.3282673, 0.3955566, 0.03438053, 1, 0, 0, 1, 1,
-0.3282003, -0.006799157, -0.3563251, 0, 0, 0, 1, 1,
-0.3261016, -1.540817, -2.801739, 0, 0, 0, 1, 1,
-0.3251233, -0.2059591, -2.111494, 0, 0, 0, 1, 1,
-0.3220082, 0.6305912, -0.4680295, 0, 0, 0, 1, 1,
-0.3205432, 0.6193317, -0.1019099, 0, 0, 0, 1, 1,
-0.3159553, 1.465637, -1.137887, 0, 0, 0, 1, 1,
-0.3124975, 0.4362515, -2.88869, 0, 0, 0, 1, 1,
-0.3121762, 0.9054781, -1.43573, 1, 1, 1, 1, 1,
-0.3049997, 0.6728066, -0.3657958, 1, 1, 1, 1, 1,
-0.3030909, -1.782085, -3.671607, 1, 1, 1, 1, 1,
-0.3009408, 0.009662006, -1.99003, 1, 1, 1, 1, 1,
-0.2981335, -1.169823, -3.744038, 1, 1, 1, 1, 1,
-0.293336, -0.3651419, -2.764893, 1, 1, 1, 1, 1,
-0.2927214, 0.5190557, -1.231072, 1, 1, 1, 1, 1,
-0.2909192, 0.1056435, 0.8627329, 1, 1, 1, 1, 1,
-0.2853867, -0.003768738, -2.577793, 1, 1, 1, 1, 1,
-0.2846945, -0.1565047, -2.974592, 1, 1, 1, 1, 1,
-0.2836541, -0.07735746, -3.052929, 1, 1, 1, 1, 1,
-0.2819933, -1.005957, -5.169633, 1, 1, 1, 1, 1,
-0.2779322, 1.446209, -0.900478, 1, 1, 1, 1, 1,
-0.2761304, -0.2332583, -3.420125, 1, 1, 1, 1, 1,
-0.275963, -0.1887198, -1.733513, 1, 1, 1, 1, 1,
-0.2660405, 0.7584768, -0.08563147, 0, 0, 1, 1, 1,
-0.2621564, -1.179243, -3.024523, 1, 0, 0, 1, 1,
-0.260967, 0.1879047, -2.25437, 1, 0, 0, 1, 1,
-0.2585061, -0.2946319, -2.461047, 1, 0, 0, 1, 1,
-0.2578647, -1.289897, -3.59474, 1, 0, 0, 1, 1,
-0.2577668, -0.7709314, -2.964026, 1, 0, 0, 1, 1,
-0.2567731, 1.45245, -0.604062, 0, 0, 0, 1, 1,
-0.2566893, 0.441003, -0.02960123, 0, 0, 0, 1, 1,
-0.2506512, -0.9080479, -2.338821, 0, 0, 0, 1, 1,
-0.2497461, -0.06489353, -3.690831, 0, 0, 0, 1, 1,
-0.2394141, -0.1701349, -2.51508, 0, 0, 0, 1, 1,
-0.2342715, 0.04474188, -2.060924, 0, 0, 0, 1, 1,
-0.2298669, 0.6332601, 0.8262157, 0, 0, 0, 1, 1,
-0.2269718, 0.6482961, 1.169207, 1, 1, 1, 1, 1,
-0.2203351, -1.650714, -3.622015, 1, 1, 1, 1, 1,
-0.2182966, 1.092555, 0.4462653, 1, 1, 1, 1, 1,
-0.2182748, -0.1193769, -3.245717, 1, 1, 1, 1, 1,
-0.2179077, -0.3312073, -1.867939, 1, 1, 1, 1, 1,
-0.2178065, 1.812007, -0.1083443, 1, 1, 1, 1, 1,
-0.2174764, -0.8402026, -3.462484, 1, 1, 1, 1, 1,
-0.2154858, 1.92707, -1.588199, 1, 1, 1, 1, 1,
-0.2027176, -0.5697197, -0.8924791, 1, 1, 1, 1, 1,
-0.2018618, 0.6192215, 0.1946076, 1, 1, 1, 1, 1,
-0.2010703, 0.9848629, -0.5719742, 1, 1, 1, 1, 1,
-0.197566, 0.8321906, -0.3399485, 1, 1, 1, 1, 1,
-0.1921163, -0.5481768, -3.919029, 1, 1, 1, 1, 1,
-0.1908693, 1.13787, -1.024537, 1, 1, 1, 1, 1,
-0.1862932, 0.2579748, -0.03999263, 1, 1, 1, 1, 1,
-0.1819297, -1.752206, -1.845691, 0, 0, 1, 1, 1,
-0.1813124, -1.907339, -2.629056, 1, 0, 0, 1, 1,
-0.1758177, -0.4572987, -2.169583, 1, 0, 0, 1, 1,
-0.1745259, 0.9381794, -1.255665, 1, 0, 0, 1, 1,
-0.1700236, 0.9586506, -1.058808, 1, 0, 0, 1, 1,
-0.1673489, -0.2432147, -2.333416, 1, 0, 0, 1, 1,
-0.1672337, 1.177273, 1.531049, 0, 0, 0, 1, 1,
-0.1667564, -0.01430579, -1.886369, 0, 0, 0, 1, 1,
-0.1665112, -1.766428, -4.095984, 0, 0, 0, 1, 1,
-0.1658331, 2.259001, -1.114342, 0, 0, 0, 1, 1,
-0.1596853, 1.820387, 0.8673871, 0, 0, 0, 1, 1,
-0.1561285, -0.05578602, -3.607301, 0, 0, 0, 1, 1,
-0.1533681, 0.9403909, 1.195357, 0, 0, 0, 1, 1,
-0.1531266, -1.000912, -4.395506, 1, 1, 1, 1, 1,
-0.1519267, 1.545535, 0.2091035, 1, 1, 1, 1, 1,
-0.1516225, 0.131177, -1.269235, 1, 1, 1, 1, 1,
-0.1507266, 1.002259, 1.952324, 1, 1, 1, 1, 1,
-0.1479985, 0.1373078, 0.8389198, 1, 1, 1, 1, 1,
-0.1457532, 0.3228191, -1.130321, 1, 1, 1, 1, 1,
-0.1423811, 0.5374812, -0.9738824, 1, 1, 1, 1, 1,
-0.1418789, -0.0006573456, -2.581042, 1, 1, 1, 1, 1,
-0.140244, -0.02872763, -2.03326, 1, 1, 1, 1, 1,
-0.1388003, -3.118508, -4.096597, 1, 1, 1, 1, 1,
-0.1346161, -1.282858, -3.109397, 1, 1, 1, 1, 1,
-0.1306561, -0.5146059, -5.368965, 1, 1, 1, 1, 1,
-0.1280318, -0.2690024, -2.0744, 1, 1, 1, 1, 1,
-0.1271121, -0.7637499, -0.8013684, 1, 1, 1, 1, 1,
-0.1260462, -1.017124, -2.988805, 1, 1, 1, 1, 1,
-0.1237669, 0.5484233, 0.780952, 0, 0, 1, 1, 1,
-0.1231328, -0.74775, -0.8104735, 1, 0, 0, 1, 1,
-0.1158871, -1.87403, -4.249237, 1, 0, 0, 1, 1,
-0.1145114, -1.131581, -3.812591, 1, 0, 0, 1, 1,
-0.1137709, 0.1245371, -0.6283334, 1, 0, 0, 1, 1,
-0.1132179, 0.1501625, -1.737491, 1, 0, 0, 1, 1,
-0.1115505, 0.2248217, 1.370965, 0, 0, 0, 1, 1,
-0.1048943, -1.537578, -1.95067, 0, 0, 0, 1, 1,
-0.1022433, 1.350632, -1.874034, 0, 0, 0, 1, 1,
-0.1020707, 0.03872921, 0.2984343, 0, 0, 0, 1, 1,
-0.1020415, 2.687619, -0.009889196, 0, 0, 0, 1, 1,
-0.09906867, -1.336263, -3.047112, 0, 0, 0, 1, 1,
-0.09746371, 0.1414287, -1.957368, 0, 0, 0, 1, 1,
-0.09447223, 0.4141438, -0.06524583, 1, 1, 1, 1, 1,
-0.08971336, 1.404102, 1.588635, 1, 1, 1, 1, 1,
-0.08595234, -0.08927655, -1.180968, 1, 1, 1, 1, 1,
-0.07427299, 1.298038, 1.001834, 1, 1, 1, 1, 1,
-0.06935405, -0.5382004, -3.942939, 1, 1, 1, 1, 1,
-0.06550334, 1.357775, -0.8048685, 1, 1, 1, 1, 1,
-0.06450006, 0.7542932, 1.38638, 1, 1, 1, 1, 1,
-0.05965272, 1.133089, -1.528656, 1, 1, 1, 1, 1,
-0.05192558, 0.06197827, -1.767308, 1, 1, 1, 1, 1,
-0.04717579, -0.002033063, -1.635512, 1, 1, 1, 1, 1,
-0.04705551, -1.579661, -4.453342, 1, 1, 1, 1, 1,
-0.04653516, -1.497931, -3.810097, 1, 1, 1, 1, 1,
-0.04516653, 1.687387, -0.4862359, 1, 1, 1, 1, 1,
-0.0416525, -0.2239108, -2.739088, 1, 1, 1, 1, 1,
-0.04119486, -0.1423425, -2.442451, 1, 1, 1, 1, 1,
-0.03809505, 0.1110512, -0.7931724, 0, 0, 1, 1, 1,
-0.03513982, 0.4932068, 0.3738737, 1, 0, 0, 1, 1,
-0.03144548, 0.8913485, -1.179561, 1, 0, 0, 1, 1,
-0.03125644, -0.4977503, -3.706941, 1, 0, 0, 1, 1,
-0.02602676, -0.6563501, -3.242272, 1, 0, 0, 1, 1,
-0.01735612, 2.25119, 1.071431, 1, 0, 0, 1, 1,
-0.01693164, -0.7170327, -3.303141, 0, 0, 0, 1, 1,
-0.01690842, 2.099779, 0.7602383, 0, 0, 0, 1, 1,
-0.01656732, 0.1955835, -0.1657746, 0, 0, 0, 1, 1,
-0.01517477, -0.6424549, -1.829446, 0, 0, 0, 1, 1,
-0.01139681, -0.7428237, -2.719191, 0, 0, 0, 1, 1,
-0.009915072, -1.191584, -3.527144, 0, 0, 0, 1, 1,
-0.008075779, -0.4553786, -3.829178, 0, 0, 0, 1, 1,
-0.006459701, 0.577225, -0.9064338, 1, 1, 1, 1, 1,
-0.005788394, 0.8286355, 0.3552049, 1, 1, 1, 1, 1,
-0.00500699, -1.020869, -4.051655, 1, 1, 1, 1, 1,
-0.004596865, -1.772532, -3.549934, 1, 1, 1, 1, 1,
-0.003609564, -1.338525, -2.854037, 1, 1, 1, 1, 1,
-0.001238449, -0.72664, -4.562468, 1, 1, 1, 1, 1,
0.006729114, -0.6756638, 2.619618, 1, 1, 1, 1, 1,
0.009796552, 1.417702, 1.354895, 1, 1, 1, 1, 1,
0.0106701, -1.136551, 4.415564, 1, 1, 1, 1, 1,
0.02005864, 0.1911096, -0.2607823, 1, 1, 1, 1, 1,
0.02150341, 0.5483076, -0.6790508, 1, 1, 1, 1, 1,
0.02345654, 1.301701, 1.335492, 1, 1, 1, 1, 1,
0.03078819, 1.816825, 0.4264938, 1, 1, 1, 1, 1,
0.04606238, 0.736491, -0.502555, 1, 1, 1, 1, 1,
0.05023091, 0.4531656, -0.8030553, 1, 1, 1, 1, 1,
0.05356407, 1.435383, -0.1787574, 0, 0, 1, 1, 1,
0.05913166, -1.711736, 3.710308, 1, 0, 0, 1, 1,
0.06118247, -0.5617337, 1.609511, 1, 0, 0, 1, 1,
0.06979555, 0.6436248, 1.520264, 1, 0, 0, 1, 1,
0.07257122, 0.7736092, 0.247467, 1, 0, 0, 1, 1,
0.07536282, -0.6228543, 3.525129, 1, 0, 0, 1, 1,
0.07640057, -1.018457, 2.644753, 0, 0, 0, 1, 1,
0.07788778, 0.3050618, -0.686458, 0, 0, 0, 1, 1,
0.07873912, -1.854498, 4.151081, 0, 0, 0, 1, 1,
0.08046429, -1.230276, 3.800806, 0, 0, 0, 1, 1,
0.08593165, 0.7431848, 1.054517, 0, 0, 0, 1, 1,
0.09076915, 1.816261, 1.297546, 0, 0, 0, 1, 1,
0.09379552, 0.471221, 0.0003664227, 0, 0, 0, 1, 1,
0.09427116, 0.6928437, -1.59948, 1, 1, 1, 1, 1,
0.09499066, -0.6772823, 2.444977, 1, 1, 1, 1, 1,
0.09558342, 0.116272, 0.3322159, 1, 1, 1, 1, 1,
0.09643294, -1.27431, 2.160797, 1, 1, 1, 1, 1,
0.09746975, -0.2723905, 3.282591, 1, 1, 1, 1, 1,
0.1012994, -0.6100582, 4.029611, 1, 1, 1, 1, 1,
0.1051359, 1.066282, -0.3058816, 1, 1, 1, 1, 1,
0.107356, 0.05825871, 1.059747, 1, 1, 1, 1, 1,
0.1130161, -0.2206256, 1.967443, 1, 1, 1, 1, 1,
0.1138504, 0.6735173, -0.0126772, 1, 1, 1, 1, 1,
0.1147925, -0.3899922, 1.596609, 1, 1, 1, 1, 1,
0.1155037, -1.350915, 2.089546, 1, 1, 1, 1, 1,
0.1155129, 0.5403636, 0.84566, 1, 1, 1, 1, 1,
0.1164894, -0.2766218, 3.182854, 1, 1, 1, 1, 1,
0.1174466, 0.1909841, 2.32191, 1, 1, 1, 1, 1,
0.1187301, -0.09939589, 1.096278, 0, 0, 1, 1, 1,
0.1187845, -0.8013524, 3.175496, 1, 0, 0, 1, 1,
0.1198385, -0.003409861, 2.881041, 1, 0, 0, 1, 1,
0.1218783, 0.1000798, 0.2588376, 1, 0, 0, 1, 1,
0.1331264, -0.3246779, 3.479118, 1, 0, 0, 1, 1,
0.1346342, -0.02877121, 3.882359, 1, 0, 0, 1, 1,
0.135568, 1.559461, -0.2435404, 0, 0, 0, 1, 1,
0.1393086, -0.9105074, 2.998623, 0, 0, 0, 1, 1,
0.1414197, 0.1429683, 0.8243863, 0, 0, 0, 1, 1,
0.1454966, 2.059822, -0.2708101, 0, 0, 0, 1, 1,
0.1472357, 1.254387, -0.681347, 0, 0, 0, 1, 1,
0.1517492, -0.1004213, 2.829608, 0, 0, 0, 1, 1,
0.1519072, 0.8443835, 0.6039078, 0, 0, 0, 1, 1,
0.154792, -0.7840623, 4.229468, 1, 1, 1, 1, 1,
0.1565264, -0.2039826, 2.295704, 1, 1, 1, 1, 1,
0.1586576, 0.4692607, -1.245678, 1, 1, 1, 1, 1,
0.1591576, 0.01181857, 0.8664103, 1, 1, 1, 1, 1,
0.1606171, -0.07059416, 1.850887, 1, 1, 1, 1, 1,
0.160936, 0.7248842, -0.7347099, 1, 1, 1, 1, 1,
0.1611031, -1.367376, 1.048299, 1, 1, 1, 1, 1,
0.1617876, 1.681688, -0.1007912, 1, 1, 1, 1, 1,
0.1623387, -0.4213739, 2.802738, 1, 1, 1, 1, 1,
0.1746712, 1.55717, 1.815335, 1, 1, 1, 1, 1,
0.1776322, -0.4805137, 3.828569, 1, 1, 1, 1, 1,
0.17772, 0.1868474, 1.455924, 1, 1, 1, 1, 1,
0.1798245, 1.337903, -0.1264813, 1, 1, 1, 1, 1,
0.1815173, -0.6514808, 2.125911, 1, 1, 1, 1, 1,
0.1863029, 0.2785571, -0.1147219, 1, 1, 1, 1, 1,
0.1873067, -0.259148, 4.108532, 0, 0, 1, 1, 1,
0.189145, 0.9821166, 0.7775668, 1, 0, 0, 1, 1,
0.1921208, 1.357556, 1.390261, 1, 0, 0, 1, 1,
0.1939649, -0.9742434, 1.592475, 1, 0, 0, 1, 1,
0.1957659, 2.21839, 1.435524, 1, 0, 0, 1, 1,
0.20211, 0.872421, 0.6599713, 1, 0, 0, 1, 1,
0.2069554, -0.2317408, -0.820186, 0, 0, 0, 1, 1,
0.208281, 2.223332, 0.8323109, 0, 0, 0, 1, 1,
0.2095803, -0.6054274, 2.391264, 0, 0, 0, 1, 1,
0.2101785, -0.1689364, 2.456814, 0, 0, 0, 1, 1,
0.211992, 0.9642949, 0.8795479, 0, 0, 0, 1, 1,
0.2142809, -1.446994, 2.07874, 0, 0, 0, 1, 1,
0.2169359, 0.3834989, 1.527887, 0, 0, 0, 1, 1,
0.2200211, -0.4426888, 1.220969, 1, 1, 1, 1, 1,
0.2275588, -0.6225398, 3.166283, 1, 1, 1, 1, 1,
0.2290399, 1.558971, -1.795805, 1, 1, 1, 1, 1,
0.2292734, 0.2359848, 0.5660117, 1, 1, 1, 1, 1,
0.2294534, 0.002601013, 2.489202, 1, 1, 1, 1, 1,
0.2315328, -0.3112768, 2.931206, 1, 1, 1, 1, 1,
0.2319874, 0.006388513, 0.7809449, 1, 1, 1, 1, 1,
0.235423, 0.9932556, -0.7081077, 1, 1, 1, 1, 1,
0.2365968, 0.1947549, -0.6748493, 1, 1, 1, 1, 1,
0.2394519, 0.7681693, 2.129346, 1, 1, 1, 1, 1,
0.2401381, 1.718612, -0.01918704, 1, 1, 1, 1, 1,
0.2443273, 0.0603947, -0.1497162, 1, 1, 1, 1, 1,
0.2448364, 0.9707907, 0.9734623, 1, 1, 1, 1, 1,
0.2456961, -1.830656, 3.722543, 1, 1, 1, 1, 1,
0.2466908, 0.5414617, 1.943563, 1, 1, 1, 1, 1,
0.2500046, 0.6264271, 2.219701, 0, 0, 1, 1, 1,
0.2540547, -1.294941, 3.446457, 1, 0, 0, 1, 1,
0.257675, 0.6798359, 0.2889441, 1, 0, 0, 1, 1,
0.258493, 0.5684439, -0.8755227, 1, 0, 0, 1, 1,
0.2632183, 0.04872727, 1.759573, 1, 0, 0, 1, 1,
0.2748078, 0.5306402, 0.1991906, 1, 0, 0, 1, 1,
0.2760335, -0.2975366, 2.788467, 0, 0, 0, 1, 1,
0.2780065, 0.3434667, 1.167104, 0, 0, 0, 1, 1,
0.2805907, -1.000003, 3.339793, 0, 0, 0, 1, 1,
0.2844511, 1.249568, 0.8250927, 0, 0, 0, 1, 1,
0.2864735, -0.9464015, 2.975368, 0, 0, 0, 1, 1,
0.2915385, -1.057245, 2.710637, 0, 0, 0, 1, 1,
0.2925904, 0.9211679, 0.8309781, 0, 0, 0, 1, 1,
0.2958828, -0.851057, 0.0887946, 1, 1, 1, 1, 1,
0.2959491, 0.7524937, -1.25236, 1, 1, 1, 1, 1,
0.2978055, -1.432449, 3.299535, 1, 1, 1, 1, 1,
0.2987972, 0.08152866, -0.1346262, 1, 1, 1, 1, 1,
0.3026384, 2.30963, -1.259131, 1, 1, 1, 1, 1,
0.3117248, 0.3868644, -0.1440313, 1, 1, 1, 1, 1,
0.3119116, -1.997154, 1.952982, 1, 1, 1, 1, 1,
0.3128204, 0.7462065, 1.664859, 1, 1, 1, 1, 1,
0.3129241, -0.168314, 3.514697, 1, 1, 1, 1, 1,
0.319815, 0.4264071, 0.4477635, 1, 1, 1, 1, 1,
0.3206308, 1.995802, 0.8419612, 1, 1, 1, 1, 1,
0.3216416, -1.028204, 4.212809, 1, 1, 1, 1, 1,
0.3245962, 1.3132, -1.018167, 1, 1, 1, 1, 1,
0.3293338, 1.043386, 1.109833, 1, 1, 1, 1, 1,
0.3349095, 1.018515, 0.6715174, 1, 1, 1, 1, 1,
0.3356808, -0.683814, 2.656815, 0, 0, 1, 1, 1,
0.3374017, -0.07296279, 1.595344, 1, 0, 0, 1, 1,
0.3426324, -1.347571, 4.612092, 1, 0, 0, 1, 1,
0.3431843, -0.1124358, -0.05649687, 1, 0, 0, 1, 1,
0.344739, 1.325412, 1.226215, 1, 0, 0, 1, 1,
0.3457101, -1.327286, 1.703631, 1, 0, 0, 1, 1,
0.3532186, -0.3311383, 1.958647, 0, 0, 0, 1, 1,
0.3557757, -0.9924695, 0.7487782, 0, 0, 0, 1, 1,
0.3580506, -1.330951, 1.771511, 0, 0, 0, 1, 1,
0.3595091, -0.252898, 1.370491, 0, 0, 0, 1, 1,
0.359937, -0.7784712, 1.546073, 0, 0, 0, 1, 1,
0.3601689, -0.4623792, 2.867112, 0, 0, 0, 1, 1,
0.3625586, -1.231279, 1.779708, 0, 0, 0, 1, 1,
0.3656511, 1.270749, -0.7217682, 1, 1, 1, 1, 1,
0.3664473, -1.611312, 1.184207, 1, 1, 1, 1, 1,
0.3718805, 0.1889432, 1.22387, 1, 1, 1, 1, 1,
0.3734221, 1.528299, 1.279152, 1, 1, 1, 1, 1,
0.3753006, -1.112254, 3.452282, 1, 1, 1, 1, 1,
0.3754608, -0.2145252, 2.819839, 1, 1, 1, 1, 1,
0.3802612, -0.4833395, 2.593318, 1, 1, 1, 1, 1,
0.3802803, -0.6878101, 0.6671618, 1, 1, 1, 1, 1,
0.3805673, 0.7762935, -0.8054612, 1, 1, 1, 1, 1,
0.3806889, 0.08658722, -0.1436823, 1, 1, 1, 1, 1,
0.3816264, 0.9941399, 0.121998, 1, 1, 1, 1, 1,
0.3839633, 0.07645872, 2.642812, 1, 1, 1, 1, 1,
0.3874942, -0.1737221, 2.280247, 1, 1, 1, 1, 1,
0.3908627, -0.333682, 0.9159442, 1, 1, 1, 1, 1,
0.3923159, -0.2921214, 3.270493, 1, 1, 1, 1, 1,
0.3982177, -1.251124, 2.123924, 0, 0, 1, 1, 1,
0.3996494, -1.230619, 2.426461, 1, 0, 0, 1, 1,
0.402002, 0.4595896, 0.1415397, 1, 0, 0, 1, 1,
0.4081417, 1.745458, 0.8086843, 1, 0, 0, 1, 1,
0.4082456, 0.7826121, 0.01651096, 1, 0, 0, 1, 1,
0.4098324, 0.1810105, 1.520084, 1, 0, 0, 1, 1,
0.4196771, -0.2878751, 2.441587, 0, 0, 0, 1, 1,
0.4210623, 0.01909046, 0.5180755, 0, 0, 0, 1, 1,
0.4282084, -0.6798241, 1.898056, 0, 0, 0, 1, 1,
0.4299028, 0.0333441, 0.8695081, 0, 0, 0, 1, 1,
0.4327857, -1.083221, 2.979649, 0, 0, 0, 1, 1,
0.4350988, 0.1499985, 0.506376, 0, 0, 0, 1, 1,
0.4351138, 0.9426958, -0.7972561, 0, 0, 0, 1, 1,
0.4368144, -0.5174904, 2.701429, 1, 1, 1, 1, 1,
0.4378384, 1.165797, 0.3699997, 1, 1, 1, 1, 1,
0.438896, 0.4127029, 1.362965, 1, 1, 1, 1, 1,
0.4397437, -1.889225, 3.945683, 1, 1, 1, 1, 1,
0.4402318, -0.5248742, 3.107486, 1, 1, 1, 1, 1,
0.4443907, -0.7324516, 3.432965, 1, 1, 1, 1, 1,
0.4475667, 1.581283, -0.1575722, 1, 1, 1, 1, 1,
0.4484182, -0.4325202, 1.288616, 1, 1, 1, 1, 1,
0.4490741, 0.9459162, 0.529047, 1, 1, 1, 1, 1,
0.4492774, 0.6068839, 0.5470685, 1, 1, 1, 1, 1,
0.4514411, -0.3703646, 2.201601, 1, 1, 1, 1, 1,
0.4514451, 2.234258, 0.8575003, 1, 1, 1, 1, 1,
0.4518038, 0.2152362, 0.513159, 1, 1, 1, 1, 1,
0.4537482, 0.1627007, 1.539231, 1, 1, 1, 1, 1,
0.4560991, -0.4389936, 0.9071628, 1, 1, 1, 1, 1,
0.4575604, -0.8716024, 3.319327, 0, 0, 1, 1, 1,
0.460165, 1.193671, 1.366417, 1, 0, 0, 1, 1,
0.4629372, 0.05976096, 3.171469, 1, 0, 0, 1, 1,
0.4636887, -1.119729, 3.727182, 1, 0, 0, 1, 1,
0.4659168, -2.370598, 1.605245, 1, 0, 0, 1, 1,
0.4740289, -1.199584, 3.384983, 1, 0, 0, 1, 1,
0.4761876, -0.8621435, 3.974154, 0, 0, 0, 1, 1,
0.4765311, 0.4713698, 1.269024, 0, 0, 0, 1, 1,
0.4766984, -0.5792834, 3.30915, 0, 0, 0, 1, 1,
0.4797594, -0.9508657, 3.378184, 0, 0, 0, 1, 1,
0.4802076, -0.7128597, 2.47652, 0, 0, 0, 1, 1,
0.4859584, 0.8591102, 1.311567, 0, 0, 0, 1, 1,
0.4870545, -0.8272581, 1.517468, 0, 0, 0, 1, 1,
0.4873796, -0.1771132, 0.8407871, 1, 1, 1, 1, 1,
0.4912777, -1.431509, 3.534496, 1, 1, 1, 1, 1,
0.4956474, -0.1483377, 1.899355, 1, 1, 1, 1, 1,
0.4980471, 1.54278, -0.4023548, 1, 1, 1, 1, 1,
0.4989243, -1.126311, 5.473155, 1, 1, 1, 1, 1,
0.5010723, 1.294097, 1.750792, 1, 1, 1, 1, 1,
0.5062094, 0.8687674, -0.320159, 1, 1, 1, 1, 1,
0.5082061, 0.1568914, -0.5783527, 1, 1, 1, 1, 1,
0.5132688, 0.6045724, 0.1805384, 1, 1, 1, 1, 1,
0.5210195, 0.1690983, 1.542279, 1, 1, 1, 1, 1,
0.5239851, 0.3787205, -1.051976, 1, 1, 1, 1, 1,
0.5273132, 2.222487, 1.226767, 1, 1, 1, 1, 1,
0.5357268, 2.236016, -1.297705, 1, 1, 1, 1, 1,
0.5371676, 0.3214973, 1.530556, 1, 1, 1, 1, 1,
0.5387508, 0.5624546, 0.716728, 1, 1, 1, 1, 1,
0.5435023, -0.6912349, 2.697212, 0, 0, 1, 1, 1,
0.5462287, 0.1618633, 1.975242, 1, 0, 0, 1, 1,
0.5580914, 2.783768, 0.2764371, 1, 0, 0, 1, 1,
0.5630361, 2.091798, 1.036054, 1, 0, 0, 1, 1,
0.5650944, -1.230315, 2.362146, 1, 0, 0, 1, 1,
0.5690466, 2.366492, -0.3229446, 1, 0, 0, 1, 1,
0.5717956, 1.056854, -0.563912, 0, 0, 0, 1, 1,
0.5831191, 0.5315126, 2.883325, 0, 0, 0, 1, 1,
0.5922483, -0.1980579, 1.97241, 0, 0, 0, 1, 1,
0.5922978, 0.7587973, 0.3822029, 0, 0, 0, 1, 1,
0.6009012, 0.1517778, 1.23271, 0, 0, 0, 1, 1,
0.6009988, -1.004212, 2.412249, 0, 0, 0, 1, 1,
0.6042955, -0.1739273, 0.3100694, 0, 0, 0, 1, 1,
0.6052706, -0.08471455, 1.078282, 1, 1, 1, 1, 1,
0.608911, -1.467496, 4.113075, 1, 1, 1, 1, 1,
0.612662, -0.402197, 1.069871, 1, 1, 1, 1, 1,
0.613519, -0.4951114, 1.37818, 1, 1, 1, 1, 1,
0.613865, 0.0501978, 0.476885, 1, 1, 1, 1, 1,
0.6142196, -0.4666387, 2.370277, 1, 1, 1, 1, 1,
0.6142992, 0.8268462, 2.193149, 1, 1, 1, 1, 1,
0.6143023, 0.5909853, 0.9834782, 1, 1, 1, 1, 1,
0.6148212, -0.499335, 2.177075, 1, 1, 1, 1, 1,
0.6168665, -0.2945678, 0.2389629, 1, 1, 1, 1, 1,
0.629646, -0.3995183, 1.710426, 1, 1, 1, 1, 1,
0.6374181, -0.1087319, 1.855621, 1, 1, 1, 1, 1,
0.6385324, -1.857162, 3.456505, 1, 1, 1, 1, 1,
0.6495226, 1.010087, 1.85971, 1, 1, 1, 1, 1,
0.6535093, 0.7704632, -0.02156116, 1, 1, 1, 1, 1,
0.6606243, -1.132293, 3.214457, 0, 0, 1, 1, 1,
0.663894, -0.2685662, 2.175943, 1, 0, 0, 1, 1,
0.6694447, -0.1641293, 0.2442159, 1, 0, 0, 1, 1,
0.6698549, -0.3963628, 0.5060658, 1, 0, 0, 1, 1,
0.6704165, 0.5809472, 2.66883, 1, 0, 0, 1, 1,
0.6747634, -0.2634129, 2.079016, 1, 0, 0, 1, 1,
0.6757297, -0.8945204, 3.231782, 0, 0, 0, 1, 1,
0.6783753, 1.26319, 1.820575, 0, 0, 0, 1, 1,
0.6838311, 0.6253994, -0.4838834, 0, 0, 0, 1, 1,
0.689011, 0.3588657, 0.1868642, 0, 0, 0, 1, 1,
0.6911144, 0.03061754, -1.711924, 0, 0, 0, 1, 1,
0.6928632, 1.047345, 1.63099, 0, 0, 0, 1, 1,
0.6931022, 0.8385656, 0.3375097, 0, 0, 0, 1, 1,
0.6932093, 0.820397, 2.078686, 1, 1, 1, 1, 1,
0.6965517, -1.260375, 3.792366, 1, 1, 1, 1, 1,
0.7022308, -0.6733258, 2.122127, 1, 1, 1, 1, 1,
0.7022658, -0.3623134, 1.507664, 1, 1, 1, 1, 1,
0.7042003, -1.273815, 2.610338, 1, 1, 1, 1, 1,
0.7069664, -0.4373115, 1.583188, 1, 1, 1, 1, 1,
0.7077895, -0.05109045, 1.390638, 1, 1, 1, 1, 1,
0.7134538, -0.7931967, 3.556718, 1, 1, 1, 1, 1,
0.7165577, -1.548998, 3.479278, 1, 1, 1, 1, 1,
0.7176456, -0.2087184, 3.442177, 1, 1, 1, 1, 1,
0.7225072, -0.7779343, 1.871123, 1, 1, 1, 1, 1,
0.7227316, 0.169465, 1.848891, 1, 1, 1, 1, 1,
0.7273389, 0.5888724, 2.655163, 1, 1, 1, 1, 1,
0.7322535, 0.2859099, 0.306867, 1, 1, 1, 1, 1,
0.7328427, 0.5840037, 0.1620584, 1, 1, 1, 1, 1,
0.7385845, -1.000587, 2.61554, 0, 0, 1, 1, 1,
0.7441966, 1.467941, -0.4989176, 1, 0, 0, 1, 1,
0.7472512, -0.7971182, 4.121116, 1, 0, 0, 1, 1,
0.7501246, 0.835094, -0.1731226, 1, 0, 0, 1, 1,
0.7505375, -1.158231, 3.278665, 1, 0, 0, 1, 1,
0.7516022, -0.2689421, 2.246535, 1, 0, 0, 1, 1,
0.7552586, -1.537455, 1.81339, 0, 0, 0, 1, 1,
0.7570444, -0.7889502, 2.970854, 0, 0, 0, 1, 1,
0.7626333, -0.7653494, 2.45125, 0, 0, 0, 1, 1,
0.7633538, -0.5674359, 2.648469, 0, 0, 0, 1, 1,
0.764049, -0.5947829, 3.812367, 0, 0, 0, 1, 1,
0.764937, 1.187388, 1.322409, 0, 0, 0, 1, 1,
0.7671888, 1.560487, 0.4249301, 0, 0, 0, 1, 1,
0.7674698, -0.9028321, 0.8270044, 1, 1, 1, 1, 1,
0.7681986, 0.1300297, 1.216591, 1, 1, 1, 1, 1,
0.7756715, 1.238344, 0.2248413, 1, 1, 1, 1, 1,
0.7775477, 0.4179627, 0.7072135, 1, 1, 1, 1, 1,
0.7800708, 1.764471, 0.2141016, 1, 1, 1, 1, 1,
0.7844791, 1.095694, 0.2720391, 1, 1, 1, 1, 1,
0.7903978, 0.7872823, -0.9136305, 1, 1, 1, 1, 1,
0.7919828, 0.9576487, -0.5611144, 1, 1, 1, 1, 1,
0.7942368, 2.877375, 0.09150337, 1, 1, 1, 1, 1,
0.7946398, -0.3706926, 2.154671, 1, 1, 1, 1, 1,
0.7957033, -1.610143, 1.503109, 1, 1, 1, 1, 1,
0.7973003, -0.2055902, 2.713065, 1, 1, 1, 1, 1,
0.8077297, 1.150928, 0.2022246, 1, 1, 1, 1, 1,
0.8099801, 0.1848579, 1.373699, 1, 1, 1, 1, 1,
0.8121458, 0.5828527, 2.142614, 1, 1, 1, 1, 1,
0.8126561, -1.651096, 4.336654, 0, 0, 1, 1, 1,
0.8138829, 1.160826, 0.5924897, 1, 0, 0, 1, 1,
0.8146172, 0.5972793, 0.7161345, 1, 0, 0, 1, 1,
0.8186588, 0.1247194, 1.326382, 1, 0, 0, 1, 1,
0.8187174, -1.752672, 2.354568, 1, 0, 0, 1, 1,
0.8215099, 0.5195505, -0.005394033, 1, 0, 0, 1, 1,
0.8290295, 0.626267, 1.252105, 0, 0, 0, 1, 1,
0.8359377, -0.6457902, 1.770796, 0, 0, 0, 1, 1,
0.8363781, 0.3191414, 1.366853, 0, 0, 0, 1, 1,
0.8432568, 1.133564, 1.525531, 0, 0, 0, 1, 1,
0.8479477, 0.971624, 0.2256293, 0, 0, 0, 1, 1,
0.8512924, 1.294213, 0.1630856, 0, 0, 0, 1, 1,
0.8547115, 1.146289, -0.03840326, 0, 0, 0, 1, 1,
0.8575573, -0.3040374, 0.9662542, 1, 1, 1, 1, 1,
0.8652534, 0.1468856, 0.9043784, 1, 1, 1, 1, 1,
0.8720047, 2.445697, -0.3049412, 1, 1, 1, 1, 1,
0.8742433, -0.7868945, 0.7213628, 1, 1, 1, 1, 1,
0.8812849, 0.5634742, 0.1555704, 1, 1, 1, 1, 1,
0.8818043, 1.233148, 0.4567378, 1, 1, 1, 1, 1,
0.8838526, -0.2771596, 0.7802249, 1, 1, 1, 1, 1,
0.8846223, 1.862017, 1.762973, 1, 1, 1, 1, 1,
0.8865156, -0.01448422, -0.5698256, 1, 1, 1, 1, 1,
0.8928872, 0.6248627, 1.882331, 1, 1, 1, 1, 1,
0.8978401, -1.091451, 0.9082381, 1, 1, 1, 1, 1,
0.9006543, 1.024367, 3.141724, 1, 1, 1, 1, 1,
0.9067857, 1.28952, 0.009147817, 1, 1, 1, 1, 1,
0.9079257, -0.01260545, 3.686943, 1, 1, 1, 1, 1,
0.9106137, 1.846506, 1.918781, 1, 1, 1, 1, 1,
0.9130204, -1.526522, 2.799165, 0, 0, 1, 1, 1,
0.917932, -0.5553332, 2.311578, 1, 0, 0, 1, 1,
0.9218988, 1.369159, 0.3650579, 1, 0, 0, 1, 1,
0.9294816, 0.03967089, 1.107892, 1, 0, 0, 1, 1,
0.9298419, 0.09427518, 1.653162, 1, 0, 0, 1, 1,
0.9319669, 0.215377, -0.5593911, 1, 0, 0, 1, 1,
0.9332075, -0.01446475, 1.640846, 0, 0, 0, 1, 1,
0.9338851, 0.3807518, 2.841347, 0, 0, 0, 1, 1,
0.934517, 0.8613899, 1.063079, 0, 0, 0, 1, 1,
0.9395534, -0.6912799, 3.233778, 0, 0, 0, 1, 1,
0.9468048, -1.711923, 0.07324806, 0, 0, 0, 1, 1,
0.9489844, -0.1330012, 2.413629, 0, 0, 0, 1, 1,
0.9495924, -0.5464671, 2.978576, 0, 0, 0, 1, 1,
0.951262, -1.953591, 1.160268, 1, 1, 1, 1, 1,
0.9515046, 0.09373203, 2.492711, 1, 1, 1, 1, 1,
0.9553647, -1.128325, 3.266086, 1, 1, 1, 1, 1,
0.959514, 0.2504086, 0.9104396, 1, 1, 1, 1, 1,
0.9595504, -0.6297742, 0.765569, 1, 1, 1, 1, 1,
0.9658605, 1.067344, 1.157295, 1, 1, 1, 1, 1,
0.9862906, -1.569044, 2.159768, 1, 1, 1, 1, 1,
0.9918491, 1.131175, -0.6819178, 1, 1, 1, 1, 1,
0.9956545, -0.1825704, 1.06924, 1, 1, 1, 1, 1,
0.9966464, -0.1354002, 1.818394, 1, 1, 1, 1, 1,
1.000637, 1.874304, 1.058194, 1, 1, 1, 1, 1,
1.001224, 0.04727167, 1.427734, 1, 1, 1, 1, 1,
1.007043, -0.9297846, 2.433887, 1, 1, 1, 1, 1,
1.007087, -1.816748, 3.244295, 1, 1, 1, 1, 1,
1.007276, -1.203232, 3.257796, 1, 1, 1, 1, 1,
1.020262, -0.3788039, 2.865723, 0, 0, 1, 1, 1,
1.023196, -2.364565, 2.550971, 1, 0, 0, 1, 1,
1.03988, 1.383182, -0.2162751, 1, 0, 0, 1, 1,
1.040802, -0.8803436, 1.298102, 1, 0, 0, 1, 1,
1.05232, 0.6277192, 0.1418519, 1, 0, 0, 1, 1,
1.054756, 0.3702391, 1.829338, 1, 0, 0, 1, 1,
1.071724, 0.3298297, 1.297376, 0, 0, 0, 1, 1,
1.083874, 0.2496058, 1.501847, 0, 0, 0, 1, 1,
1.090896, 0.4383631, 0.4059516, 0, 0, 0, 1, 1,
1.101904, -0.5116163, -0.1855625, 0, 0, 0, 1, 1,
1.103526, -1.036512, 2.114431, 0, 0, 0, 1, 1,
1.109147, -0.2053147, 1.657171, 0, 0, 0, 1, 1,
1.118367, -1.595531, 1.796624, 0, 0, 0, 1, 1,
1.119034, -0.8061744, 0.9367943, 1, 1, 1, 1, 1,
1.120583, -0.5143491, 2.885249, 1, 1, 1, 1, 1,
1.122782, -0.3465957, 1.553552, 1, 1, 1, 1, 1,
1.122826, 1.209009, 1.02658, 1, 1, 1, 1, 1,
1.126717, 0.9445965, 0.9088399, 1, 1, 1, 1, 1,
1.130634, -0.5455427, 2.312417, 1, 1, 1, 1, 1,
1.130681, 0.8729335, -0.351791, 1, 1, 1, 1, 1,
1.131755, 1.777533, -0.08415371, 1, 1, 1, 1, 1,
1.13288, -2.09752, 0.9521906, 1, 1, 1, 1, 1,
1.136132, 1.661728, 0.9867239, 1, 1, 1, 1, 1,
1.144031, 0.01391871, 1.117798, 1, 1, 1, 1, 1,
1.154933, -0.7767219, 2.181054, 1, 1, 1, 1, 1,
1.155206, -0.1712582, 1.638514, 1, 1, 1, 1, 1,
1.159225, -0.5133997, 2.514928, 1, 1, 1, 1, 1,
1.160236, 1.85328, 0.7307687, 1, 1, 1, 1, 1,
1.160886, 0.0168206, 1.485821, 0, 0, 1, 1, 1,
1.16328, -0.7252743, 1.706958, 1, 0, 0, 1, 1,
1.163419, -0.417704, 2.846245, 1, 0, 0, 1, 1,
1.18695, -0.04618621, 1.586018, 1, 0, 0, 1, 1,
1.201248, 0.5238129, 0.7283279, 1, 0, 0, 1, 1,
1.204482, 0.206246, 4.112409, 1, 0, 0, 1, 1,
1.205653, -0.3660036, 1.848091, 0, 0, 0, 1, 1,
1.212631, -1.232682, 0.3242022, 0, 0, 0, 1, 1,
1.212893, 1.923304, -0.2247126, 0, 0, 0, 1, 1,
1.222251, -1.003546, 5.383984, 0, 0, 0, 1, 1,
1.222795, -0.06084102, 1.585649, 0, 0, 0, 1, 1,
1.22394, 1.19376, 2.049035, 0, 0, 0, 1, 1,
1.232172, 1.251505, 0.4471903, 0, 0, 0, 1, 1,
1.232408, -0.0898909, 2.063053, 1, 1, 1, 1, 1,
1.241965, -0.6550447, 2.878517, 1, 1, 1, 1, 1,
1.250699, 0.9590726, -0.3370788, 1, 1, 1, 1, 1,
1.251161, 0.4816684, 2.320883, 1, 1, 1, 1, 1,
1.254925, 1.405191, -0.8308267, 1, 1, 1, 1, 1,
1.257326, 1.356868, 2.532754, 1, 1, 1, 1, 1,
1.258809, 0.6801485, 0.6188852, 1, 1, 1, 1, 1,
1.277738, -0.1862985, 2.042112, 1, 1, 1, 1, 1,
1.278311, -0.8688057, 3.038064, 1, 1, 1, 1, 1,
1.280932, -0.1440213, 1.204035, 1, 1, 1, 1, 1,
1.285001, -3.674269, 1.58104, 1, 1, 1, 1, 1,
1.293998, 0.5391096, -0.9302978, 1, 1, 1, 1, 1,
1.294292, 0.1175527, 2.937624, 1, 1, 1, 1, 1,
1.297822, -1.337898, 4.575586, 1, 1, 1, 1, 1,
1.300612, 0.4932734, 0.747254, 1, 1, 1, 1, 1,
1.314753, 1.267779, 1.186776, 0, 0, 1, 1, 1,
1.323751, 0.1729595, 1.968688, 1, 0, 0, 1, 1,
1.335594, -1.426395, 1.36638, 1, 0, 0, 1, 1,
1.33827, -0.7072024, 2.84403, 1, 0, 0, 1, 1,
1.339186, -1.425417, -0.2542365, 1, 0, 0, 1, 1,
1.340072, 0.2714106, 0.6385194, 1, 0, 0, 1, 1,
1.349477, 1.048352, 0.9432381, 0, 0, 0, 1, 1,
1.3501, -0.5575212, 3.377161, 0, 0, 0, 1, 1,
1.360284, 1.096026, 2.294405, 0, 0, 0, 1, 1,
1.361338, -0.3294544, 2.469856, 0, 0, 0, 1, 1,
1.363542, 1.528395, -0.1117126, 0, 0, 0, 1, 1,
1.37254, 0.5911645, 0.2268695, 0, 0, 0, 1, 1,
1.3761, 0.3159729, 1.495669, 0, 0, 0, 1, 1,
1.378043, -1.068231, 0.7430652, 1, 1, 1, 1, 1,
1.378236, 0.2969022, 1.544231, 1, 1, 1, 1, 1,
1.382528, -0.8201496, 1.256987, 1, 1, 1, 1, 1,
1.393279, -1.685754, 1.026659, 1, 1, 1, 1, 1,
1.394826, -0.3096241, 0.2029578, 1, 1, 1, 1, 1,
1.402247, 1.079258, 1.539857, 1, 1, 1, 1, 1,
1.406659, 0.3310982, -0.6655034, 1, 1, 1, 1, 1,
1.407208, -0.7367526, 2.207626, 1, 1, 1, 1, 1,
1.407894, 1.182732, 1.132239, 1, 1, 1, 1, 1,
1.416395, -0.7178219, 0.637282, 1, 1, 1, 1, 1,
1.423431, 0.1316277, 1.280197, 1, 1, 1, 1, 1,
1.430568, -0.3604774, 2.626557, 1, 1, 1, 1, 1,
1.43477, 0.6870962, 2.584187, 1, 1, 1, 1, 1,
1.438041, -0.7129003, 2.182635, 1, 1, 1, 1, 1,
1.438189, -0.9669735, 2.084961, 1, 1, 1, 1, 1,
1.442909, 0.5979074, 1.860732, 0, 0, 1, 1, 1,
1.444396, 1.116722, 1.38475, 1, 0, 0, 1, 1,
1.449368, 2.860094, -0.4243416, 1, 0, 0, 1, 1,
1.450774, -1.502306, 3.445657, 1, 0, 0, 1, 1,
1.452998, -0.1993599, 1.474077, 1, 0, 0, 1, 1,
1.454818, 0.95654, 2.594844, 1, 0, 0, 1, 1,
1.462915, -0.4847411, 0.5756736, 0, 0, 0, 1, 1,
1.476311, 2.158208, 2.167352, 0, 0, 0, 1, 1,
1.476643, 0.9186294, 0.9753982, 0, 0, 0, 1, 1,
1.48661, -0.6928501, 1.95423, 0, 0, 0, 1, 1,
1.488817, -0.8367879, 0.6960912, 0, 0, 0, 1, 1,
1.501047, -1.037812, 1.808656, 0, 0, 0, 1, 1,
1.501925, -0.6250183, -0.1157939, 0, 0, 0, 1, 1,
1.513151, -0.3417691, 0.4607245, 1, 1, 1, 1, 1,
1.526099, 2.575955, 2.341409, 1, 1, 1, 1, 1,
1.529969, 0.5688412, -0.9540828, 1, 1, 1, 1, 1,
1.550472, -0.02794545, 1.133196, 1, 1, 1, 1, 1,
1.562201, 0.146029, 1.682633, 1, 1, 1, 1, 1,
1.574255, 0.05356656, 0.8108898, 1, 1, 1, 1, 1,
1.575478, -0.6032324, 0.8508846, 1, 1, 1, 1, 1,
1.589013, -0.8887249, 2.796369, 1, 1, 1, 1, 1,
1.5951, 1.188788, -0.480828, 1, 1, 1, 1, 1,
1.603637, 1.613877, -0.03025494, 1, 1, 1, 1, 1,
1.610363, -0.8327526, 2.632686, 1, 1, 1, 1, 1,
1.612866, 0.3994482, 1.513822, 1, 1, 1, 1, 1,
1.631032, -0.6379556, 1.646082, 1, 1, 1, 1, 1,
1.6323, 0.2084769, 0.487544, 1, 1, 1, 1, 1,
1.639318, -1.278309, -0.2347678, 1, 1, 1, 1, 1,
1.665866, 0.6889156, 2.150445, 0, 0, 1, 1, 1,
1.670676, -0.1584994, 0.9553479, 1, 0, 0, 1, 1,
1.675923, 1.861075, 0.2239684, 1, 0, 0, 1, 1,
1.681324, -0.3520737, 0.9155185, 1, 0, 0, 1, 1,
1.70053, -0.7383529, 3.208745, 1, 0, 0, 1, 1,
1.702329, -0.2182215, 0.1496111, 1, 0, 0, 1, 1,
1.718825, -0.1275455, 2.043518, 0, 0, 0, 1, 1,
1.7316, 0.39505, 0.1270731, 0, 0, 0, 1, 1,
1.73305, -0.07669367, 0.5451069, 0, 0, 0, 1, 1,
1.73905, 0.303143, 1.809693, 0, 0, 0, 1, 1,
1.743759, -1.707039, 4.662334, 0, 0, 0, 1, 1,
1.755292, 1.091001, 1.091968, 0, 0, 0, 1, 1,
1.759194, 0.3950268, 1.394166, 0, 0, 0, 1, 1,
1.759908, -0.6479411, 0.6180362, 1, 1, 1, 1, 1,
1.778645, -0.40635, 1.813783, 1, 1, 1, 1, 1,
1.781163, -0.2861468, 1.160828, 1, 1, 1, 1, 1,
1.787518, -1.30076, 2.613224, 1, 1, 1, 1, 1,
1.788406, -2.103792, 3.121818, 1, 1, 1, 1, 1,
1.816475, 0.1756625, 0.6305982, 1, 1, 1, 1, 1,
1.822938, 0.7565513, 0.5043136, 1, 1, 1, 1, 1,
1.829958, -0.517531, 3.841679, 1, 1, 1, 1, 1,
1.845816, -0.3153872, 1.890918, 1, 1, 1, 1, 1,
1.863912, 0.6253278, 2.008825, 1, 1, 1, 1, 1,
1.893163, 1.509159, 0.7045246, 1, 1, 1, 1, 1,
1.90231, 1.014455, 2.531864, 1, 1, 1, 1, 1,
1.950064, 0.5368359, 2.846202, 1, 1, 1, 1, 1,
2.028492, -0.5918804, 2.88586, 1, 1, 1, 1, 1,
2.035417, -0.4715311, 0.908212, 1, 1, 1, 1, 1,
2.066777, 0.4369055, 2.266256, 0, 0, 1, 1, 1,
2.090048, -0.8677373, 2.141151, 1, 0, 0, 1, 1,
2.094312, -1.204521, 1.8165, 1, 0, 0, 1, 1,
2.105129, 1.426361, 1.601382, 1, 0, 0, 1, 1,
2.126701, 2.098575, 1.18586, 1, 0, 0, 1, 1,
2.206684, -0.8032352, 1.993294, 1, 0, 0, 1, 1,
2.224077, -0.5456153, 2.321613, 0, 0, 0, 1, 1,
2.228727, -1.636996, 2.921073, 0, 0, 0, 1, 1,
2.241205, -0.72147, 2.043573, 0, 0, 0, 1, 1,
2.245483, -0.05863023, 1.81689, 0, 0, 0, 1, 1,
2.258212, 0.6973063, 2.815774, 0, 0, 0, 1, 1,
2.279119, 1.415792, 2.288102, 0, 0, 0, 1, 1,
2.334521, 0.4542297, 2.814615, 0, 0, 0, 1, 1,
2.468209, 0.7498099, 1.343983, 1, 1, 1, 1, 1,
2.549769, 0.008694901, 1.751986, 1, 1, 1, 1, 1,
2.610819, -0.8472029, 1.205432, 1, 1, 1, 1, 1,
2.721579, 0.7204975, 0.3257379, 1, 1, 1, 1, 1,
2.755549, 1.52242, 1.084545, 1, 1, 1, 1, 1,
2.792269, -1.035614, 2.235934, 1, 1, 1, 1, 1,
2.9993, 1.218248, -0.251036, 1, 1, 1, 1, 1
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
var radius = 9.715539;
var distance = 34.12542;
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
mvMatrix.translate( 0.3015139, 0.3984472, -0.05209517 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12542);
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