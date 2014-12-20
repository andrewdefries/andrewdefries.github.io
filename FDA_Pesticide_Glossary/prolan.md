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
-3.017814, 0.4362815, -2.996754, 1, 0, 0, 1,
-2.989456, 0.08665369, -1.658122, 1, 0.007843138, 0, 1,
-2.770495, 2.344899, -0.7061325, 1, 0.01176471, 0, 1,
-2.652543, 0.4992066, -2.489101, 1, 0.01960784, 0, 1,
-2.638043, -1.025705, -2.561907, 1, 0.02352941, 0, 1,
-2.535283, -0.1601436, -2.625543, 1, 0.03137255, 0, 1,
-2.531995, 0.7312256, -2.290096, 1, 0.03529412, 0, 1,
-2.495612, 1.505138, -0.6539992, 1, 0.04313726, 0, 1,
-2.467546, -0.7435112, -1.202334, 1, 0.04705882, 0, 1,
-2.424898, -0.8041482, -2.225198, 1, 0.05490196, 0, 1,
-2.372717, -0.2924873, -0.5809255, 1, 0.05882353, 0, 1,
-2.367652, 0.0214557, -1.736453, 1, 0.06666667, 0, 1,
-2.363485, -1.506602, -1.473657, 1, 0.07058824, 0, 1,
-2.346326, -0.4002764, -1.447812, 1, 0.07843138, 0, 1,
-2.275057, -2.251564, -1.781349, 1, 0.08235294, 0, 1,
-2.243645, 0.9760594, 1.43045, 1, 0.09019608, 0, 1,
-2.237033, 0.6692916, -0.7604567, 1, 0.09411765, 0, 1,
-2.225437, 0.2498078, -3.179078, 1, 0.1019608, 0, 1,
-2.201484, -0.8361862, -2.495894, 1, 0.1098039, 0, 1,
-2.179603, 0.1128627, -3.169976, 1, 0.1137255, 0, 1,
-2.162615, -0.034795, -2.337177, 1, 0.1215686, 0, 1,
-2.113323, 0.6626049, -1.613271, 1, 0.1254902, 0, 1,
-2.067593, 0.00196656, -1.686699, 1, 0.1333333, 0, 1,
-2.049797, -1.205048, -3.020515, 1, 0.1372549, 0, 1,
-2.025139, -1.2163, -2.354222, 1, 0.145098, 0, 1,
-2.014246, -0.786779, -3.685012, 1, 0.1490196, 0, 1,
-1.966943, -0.9761502, -3.005067, 1, 0.1568628, 0, 1,
-1.948481, -0.283252, -1.352814, 1, 0.1607843, 0, 1,
-1.934203, 0.439801, -2.392823, 1, 0.1686275, 0, 1,
-1.90612, 0.5911759, -1.988161, 1, 0.172549, 0, 1,
-1.904819, 0.7014444, -1.392327, 1, 0.1803922, 0, 1,
-1.875421, 0.5063219, -1.268627, 1, 0.1843137, 0, 1,
-1.862725, 0.2071541, -1.300368, 1, 0.1921569, 0, 1,
-1.861114, -0.1368893, -1.890228, 1, 0.1960784, 0, 1,
-1.855912, -0.5740337, -2.604073, 1, 0.2039216, 0, 1,
-1.854471, -2.105828, -2.295221, 1, 0.2117647, 0, 1,
-1.842058, -2.366079, -3.662966, 1, 0.2156863, 0, 1,
-1.823941, -1.204854, -2.103273, 1, 0.2235294, 0, 1,
-1.811069, 0.9666691, -1.770976, 1, 0.227451, 0, 1,
-1.804929, -0.3040358, -1.427639, 1, 0.2352941, 0, 1,
-1.771888, -0.4006194, -0.7387713, 1, 0.2392157, 0, 1,
-1.767933, -0.4466105, -2.15864, 1, 0.2470588, 0, 1,
-1.762383, -0.6984146, -2.792112, 1, 0.2509804, 0, 1,
-1.760683, 1.186314, -1.500017, 1, 0.2588235, 0, 1,
-1.750156, 1.515852, -0.5085832, 1, 0.2627451, 0, 1,
-1.733971, 0.8585961, -2.567818, 1, 0.2705882, 0, 1,
-1.732725, 0.2097935, -1.846493, 1, 0.2745098, 0, 1,
-1.725217, 0.1958547, -0.6208335, 1, 0.282353, 0, 1,
-1.720815, -1.212241, -3.494868, 1, 0.2862745, 0, 1,
-1.715283, 1.516934, -1.049439, 1, 0.2941177, 0, 1,
-1.706055, -2.016403, -2.977064, 1, 0.3019608, 0, 1,
-1.702771, -0.6464682, -1.283398, 1, 0.3058824, 0, 1,
-1.666023, 2.238688, -1.928963, 1, 0.3137255, 0, 1,
-1.664682, -2.018519, -3.090018, 1, 0.3176471, 0, 1,
-1.649359, -1.037499, -2.304456, 1, 0.3254902, 0, 1,
-1.642347, -0.2252073, -0.5148504, 1, 0.3294118, 0, 1,
-1.63688, 1.343327, -1.680858, 1, 0.3372549, 0, 1,
-1.635444, 1.490597, -0.3781471, 1, 0.3411765, 0, 1,
-1.610813, -0.8056432, -1.96056, 1, 0.3490196, 0, 1,
-1.602655, 0.2229848, -0.6676384, 1, 0.3529412, 0, 1,
-1.601711, 0.1654553, 0.1939173, 1, 0.3607843, 0, 1,
-1.587382, -1.626517, -2.264629, 1, 0.3647059, 0, 1,
-1.58464, 0.341929, -0.9359236, 1, 0.372549, 0, 1,
-1.583531, 0.8136775, -2.282532, 1, 0.3764706, 0, 1,
-1.581684, 0.05771243, -0.9650877, 1, 0.3843137, 0, 1,
-1.566915, -0.2474858, -2.68919, 1, 0.3882353, 0, 1,
-1.533219, -0.213349, -0.6801947, 1, 0.3960784, 0, 1,
-1.522224, 1.14659, -0.1652792, 1, 0.4039216, 0, 1,
-1.498555, 0.9902947, -0.5551685, 1, 0.4078431, 0, 1,
-1.497611, 1.279069, -0.7158434, 1, 0.4156863, 0, 1,
-1.486054, -0.7202536, -1.731706, 1, 0.4196078, 0, 1,
-1.479969, -2.785607, -5.525515, 1, 0.427451, 0, 1,
-1.476043, 1.365504, -0.8432453, 1, 0.4313726, 0, 1,
-1.456324, -0.6891109, -1.94526, 1, 0.4392157, 0, 1,
-1.447894, -0.09896084, -2.52722, 1, 0.4431373, 0, 1,
-1.439414, 0.1561847, -1.950039, 1, 0.4509804, 0, 1,
-1.430444, -0.03938332, -1.800182, 1, 0.454902, 0, 1,
-1.424614, 0.9701896, -2.256577, 1, 0.4627451, 0, 1,
-1.416022, -0.2183843, -3.123435, 1, 0.4666667, 0, 1,
-1.412945, -1.115915, -2.497241, 1, 0.4745098, 0, 1,
-1.406392, -0.4753304, -1.363286, 1, 0.4784314, 0, 1,
-1.401384, -0.2628726, -2.351726, 1, 0.4862745, 0, 1,
-1.400101, 1.96412, 0.7019303, 1, 0.4901961, 0, 1,
-1.394804, -0.4928473, -0.4634532, 1, 0.4980392, 0, 1,
-1.387814, 1.004141, 0.9766876, 1, 0.5058824, 0, 1,
-1.382031, -0.1056201, -0.6363908, 1, 0.509804, 0, 1,
-1.372844, 0.1426932, -0.09058762, 1, 0.5176471, 0, 1,
-1.356757, -1.372177, -0.6093123, 1, 0.5215687, 0, 1,
-1.355577, 1.23652, -2.867421, 1, 0.5294118, 0, 1,
-1.351333, 0.6820429, -1.293773, 1, 0.5333334, 0, 1,
-1.339005, 0.5514062, -2.295514, 1, 0.5411765, 0, 1,
-1.336706, 0.06180311, -2.764163, 1, 0.5450981, 0, 1,
-1.335786, -0.08882159, -1.063391, 1, 0.5529412, 0, 1,
-1.333752, -0.1621455, -0.9356365, 1, 0.5568628, 0, 1,
-1.320737, 0.3289908, -1.591611, 1, 0.5647059, 0, 1,
-1.317995, 0.980988, 0.6837271, 1, 0.5686275, 0, 1,
-1.317176, -1.196517, -3.07612, 1, 0.5764706, 0, 1,
-1.307365, -2.180661, -4.108917, 1, 0.5803922, 0, 1,
-1.300782, 1.529895, -1.642645, 1, 0.5882353, 0, 1,
-1.297678, -0.01073763, -2.68521, 1, 0.5921569, 0, 1,
-1.297585, 0.3428316, -0.9341248, 1, 0.6, 0, 1,
-1.291971, -1.069851, -2.191736, 1, 0.6078432, 0, 1,
-1.29177, -0.5330619, -1.152464, 1, 0.6117647, 0, 1,
-1.286519, -0.3721535, -1.049868, 1, 0.6196079, 0, 1,
-1.282981, 0.7527418, -1.789372, 1, 0.6235294, 0, 1,
-1.282619, -0.2213446, -0.2730742, 1, 0.6313726, 0, 1,
-1.269042, -1.674577, -2.687594, 1, 0.6352941, 0, 1,
-1.268754, -0.9561747, -1.474871, 1, 0.6431373, 0, 1,
-1.260647, 0.4695408, -1.01738, 1, 0.6470588, 0, 1,
-1.248815, -0.9583666, -3.420098, 1, 0.654902, 0, 1,
-1.242733, -0.3720649, -2.682113, 1, 0.6588235, 0, 1,
-1.239191, -0.8647355, -3.012145, 1, 0.6666667, 0, 1,
-1.236471, -0.3890382, -3.484012, 1, 0.6705883, 0, 1,
-1.23622, -0.9084523, -3.2699, 1, 0.6784314, 0, 1,
-1.232936, -0.5239312, -1.641694, 1, 0.682353, 0, 1,
-1.219044, 1.927003, 0.1747434, 1, 0.6901961, 0, 1,
-1.204693, -0.6166102, -3.315766, 1, 0.6941177, 0, 1,
-1.203121, 1.388734, -0.8462545, 1, 0.7019608, 0, 1,
-1.195306, -0.1349107, -2.699007, 1, 0.7098039, 0, 1,
-1.194791, -0.2725801, -1.869657, 1, 0.7137255, 0, 1,
-1.193489, 0.008464074, -2.160523, 1, 0.7215686, 0, 1,
-1.185725, 1.265307, -0.7163807, 1, 0.7254902, 0, 1,
-1.184878, 0.3294946, 0.06256415, 1, 0.7333333, 0, 1,
-1.174613, 0.1138061, -1.122755, 1, 0.7372549, 0, 1,
-1.173172, -1.861051, -1.976711, 1, 0.7450981, 0, 1,
-1.170574, 0.4545739, -1.27091, 1, 0.7490196, 0, 1,
-1.153998, -0.4234143, -2.494362, 1, 0.7568628, 0, 1,
-1.152786, -2.036712, -3.642011, 1, 0.7607843, 0, 1,
-1.14865, -0.8848608, -2.531824, 1, 0.7686275, 0, 1,
-1.129906, 0.7130517, 0.2383625, 1, 0.772549, 0, 1,
-1.122954, -0.7225646, -0.6990165, 1, 0.7803922, 0, 1,
-1.120637, 1.284408, -0.264499, 1, 0.7843137, 0, 1,
-1.116327, 0.07871006, -2.267866, 1, 0.7921569, 0, 1,
-1.102699, -2.093338, -1.227523, 1, 0.7960784, 0, 1,
-1.10075, 0.66998, -0.7213832, 1, 0.8039216, 0, 1,
-1.098969, 0.126992, 0.04676586, 1, 0.8117647, 0, 1,
-1.097232, 0.1837159, -1.653984, 1, 0.8156863, 0, 1,
-1.094943, -0.77667, -3.591156, 1, 0.8235294, 0, 1,
-1.094758, 0.3752068, -0.09078991, 1, 0.827451, 0, 1,
-1.093206, -0.7961719, -2.225446, 1, 0.8352941, 0, 1,
-1.090451, -1.289417, -2.579912, 1, 0.8392157, 0, 1,
-1.088657, 0.7341051, -1.365302, 1, 0.8470588, 0, 1,
-1.08509, -0.160232, -0.3543414, 1, 0.8509804, 0, 1,
-1.079837, -1.243875, -3.381471, 1, 0.8588235, 0, 1,
-1.072965, 0.09154642, 0.4728279, 1, 0.8627451, 0, 1,
-1.067953, 0.4560765, -1.735125, 1, 0.8705882, 0, 1,
-1.063925, -0.3949603, -3.08239, 1, 0.8745098, 0, 1,
-1.048386, 0.6096777, -0.1974804, 1, 0.8823529, 0, 1,
-1.047149, 0.6056859, -0.2486925, 1, 0.8862745, 0, 1,
-1.045227, 0.3338232, -1.155081, 1, 0.8941177, 0, 1,
-1.035746, 3.72453, -1.239447, 1, 0.8980392, 0, 1,
-1.024481, -1.140932, -3.447344, 1, 0.9058824, 0, 1,
-1.020626, -0.2076936, -1.645409, 1, 0.9137255, 0, 1,
-1.011709, 0.1626741, -1.597648, 1, 0.9176471, 0, 1,
-0.9962462, 0.4330138, -1.562256, 1, 0.9254902, 0, 1,
-0.9954394, 0.6968253, -0.8653643, 1, 0.9294118, 0, 1,
-0.9867417, -0.9705252, -2.608835, 1, 0.9372549, 0, 1,
-0.9809906, -1.197636, -2.281007, 1, 0.9411765, 0, 1,
-0.9771958, 1.770695, 0.197192, 1, 0.9490196, 0, 1,
-0.9707513, 2.228695, 1.336574, 1, 0.9529412, 0, 1,
-0.9650521, 0.7660934, -0.3379659, 1, 0.9607843, 0, 1,
-0.9534029, 1.353354, 0.233244, 1, 0.9647059, 0, 1,
-0.9448487, 0.07026345, -1.687179, 1, 0.972549, 0, 1,
-0.9417301, 0.4047778, -1.067823, 1, 0.9764706, 0, 1,
-0.9391201, 0.6828518, -2.181105, 1, 0.9843137, 0, 1,
-0.938506, -0.4726868, -2.75751, 1, 0.9882353, 0, 1,
-0.9370352, -0.7115026, -2.185036, 1, 0.9960784, 0, 1,
-0.9370214, 0.7173715, -0.09909107, 0.9960784, 1, 0, 1,
-0.9367127, -0.0383133, -3.362206, 0.9921569, 1, 0, 1,
-0.9354288, 1.621187, -2.918914, 0.9843137, 1, 0, 1,
-0.9344741, 1.647485, -0.6824835, 0.9803922, 1, 0, 1,
-0.9305282, -0.4514927, 0.01226378, 0.972549, 1, 0, 1,
-0.9296256, -0.6737564, -2.125134, 0.9686275, 1, 0, 1,
-0.917211, 1.431003, 0.1831508, 0.9607843, 1, 0, 1,
-0.9148003, -0.2013644, -1.756863, 0.9568627, 1, 0, 1,
-0.9123624, 0.3687656, -0.9738947, 0.9490196, 1, 0, 1,
-0.9108421, 0.08012157, -0.2615434, 0.945098, 1, 0, 1,
-0.9046108, -0.8213086, -3.340904, 0.9372549, 1, 0, 1,
-0.8983187, 0.3325554, -0.318561, 0.9333333, 1, 0, 1,
-0.8976755, 0.09850196, -1.852545, 0.9254902, 1, 0, 1,
-0.8973603, 0.1462285, -1.423873, 0.9215686, 1, 0, 1,
-0.8947526, -0.4236363, -2.740307, 0.9137255, 1, 0, 1,
-0.8916634, 0.9406098, 0.1831257, 0.9098039, 1, 0, 1,
-0.8889208, 0.1237057, -1.532975, 0.9019608, 1, 0, 1,
-0.8853984, -0.9755424, -3.036362, 0.8941177, 1, 0, 1,
-0.8847409, -1.66831, -2.46051, 0.8901961, 1, 0, 1,
-0.8817267, 0.1502125, -1.697376, 0.8823529, 1, 0, 1,
-0.8801781, -1.138351, -0.9859465, 0.8784314, 1, 0, 1,
-0.8775959, -0.335884, -1.739596, 0.8705882, 1, 0, 1,
-0.8763072, 2.311273, 1.166819, 0.8666667, 1, 0, 1,
-0.8683122, 1.362759, 0.9440339, 0.8588235, 1, 0, 1,
-0.8591127, 0.51275, -0.6799725, 0.854902, 1, 0, 1,
-0.8586377, 0.4524152, 1.467865, 0.8470588, 1, 0, 1,
-0.8574802, 1.008689, -1.134821, 0.8431373, 1, 0, 1,
-0.8536696, -0.9619819, -4.235459, 0.8352941, 1, 0, 1,
-0.8504654, 0.7592712, -1.346214, 0.8313726, 1, 0, 1,
-0.8480273, -1.147731, -2.781195, 0.8235294, 1, 0, 1,
-0.8428264, -0.5904353, -2.376631, 0.8196079, 1, 0, 1,
-0.8428248, -0.294961, -2.742688, 0.8117647, 1, 0, 1,
-0.839021, 0.002915831, -1.043568, 0.8078431, 1, 0, 1,
-0.8311568, -0.9250748, -3.661472, 0.8, 1, 0, 1,
-0.8310359, -0.08831628, -1.001777, 0.7921569, 1, 0, 1,
-0.8292172, 0.7010418, -0.5855074, 0.7882353, 1, 0, 1,
-0.8250951, -0.1971855, -3.239712, 0.7803922, 1, 0, 1,
-0.8223593, 0.7041383, -0.313219, 0.7764706, 1, 0, 1,
-0.8198686, 1.596033, 1.034111, 0.7686275, 1, 0, 1,
-0.8150101, 0.5391809, 0.206235, 0.7647059, 1, 0, 1,
-0.8144571, 1.773892, -2.203783, 0.7568628, 1, 0, 1,
-0.8125102, 0.03301922, -0.4180377, 0.7529412, 1, 0, 1,
-0.8096162, 0.243255, -0.5492005, 0.7450981, 1, 0, 1,
-0.800944, -0.6367119, -1.041133, 0.7411765, 1, 0, 1,
-0.8008105, -0.3766185, -2.079799, 0.7333333, 1, 0, 1,
-0.7943491, -0.9534124, -2.400532, 0.7294118, 1, 0, 1,
-0.7930416, -1.576082, -1.299406, 0.7215686, 1, 0, 1,
-0.7847446, 0.5651807, -0.9157149, 0.7176471, 1, 0, 1,
-0.7794224, -0.6973494, -3.074914, 0.7098039, 1, 0, 1,
-0.7677841, -0.3234928, -2.432978, 0.7058824, 1, 0, 1,
-0.7666061, -0.2452012, -1.695533, 0.6980392, 1, 0, 1,
-0.7637695, 0.02922666, 0.868968, 0.6901961, 1, 0, 1,
-0.7535192, 0.7453672, 0.2069789, 0.6862745, 1, 0, 1,
-0.7521812, 0.06159311, -2.105853, 0.6784314, 1, 0, 1,
-0.7487062, -0.04616714, -1.290579, 0.6745098, 1, 0, 1,
-0.7465641, -0.7841602, -3.419779, 0.6666667, 1, 0, 1,
-0.7455286, 0.1223037, -3.090979, 0.6627451, 1, 0, 1,
-0.742788, 0.7632627, 0.6161978, 0.654902, 1, 0, 1,
-0.7399639, -0.9749728, -1.237624, 0.6509804, 1, 0, 1,
-0.7348611, 0.2108973, -1.032628, 0.6431373, 1, 0, 1,
-0.7310467, 0.4684013, -0.5469386, 0.6392157, 1, 0, 1,
-0.7253348, -0.8536844, -2.146258, 0.6313726, 1, 0, 1,
-0.7228361, 1.996054, -0.1971383, 0.627451, 1, 0, 1,
-0.7223316, 0.2293748, -1.265282, 0.6196079, 1, 0, 1,
-0.7198882, 0.6550627, -0.3034554, 0.6156863, 1, 0, 1,
-0.7172623, 0.6732778, -0.138796, 0.6078432, 1, 0, 1,
-0.7085674, 0.5474568, -0.450847, 0.6039216, 1, 0, 1,
-0.7017207, 1.258103, -1.09839, 0.5960785, 1, 0, 1,
-0.6959535, 0.8926173, -0.4988976, 0.5882353, 1, 0, 1,
-0.6936995, 0.327179, -1.10003, 0.5843138, 1, 0, 1,
-0.6933767, 0.709825, -1.015314, 0.5764706, 1, 0, 1,
-0.6916167, -1.190845, -2.203242, 0.572549, 1, 0, 1,
-0.6894721, 1.847453, 0.4899286, 0.5647059, 1, 0, 1,
-0.6852913, 0.7081584, -0.03385262, 0.5607843, 1, 0, 1,
-0.68104, 0.4541517, -1.733162, 0.5529412, 1, 0, 1,
-0.6728779, 0.007772102, -1.170265, 0.5490196, 1, 0, 1,
-0.6658037, 0.01276631, -1.48143, 0.5411765, 1, 0, 1,
-0.6656986, -0.7665593, -3.605863, 0.5372549, 1, 0, 1,
-0.6623418, -0.4448917, -1.743255, 0.5294118, 1, 0, 1,
-0.6613736, -0.2082609, -1.562864, 0.5254902, 1, 0, 1,
-0.6580018, 0.635815, 0.1363878, 0.5176471, 1, 0, 1,
-0.6529054, 0.7742409, 0.1856317, 0.5137255, 1, 0, 1,
-0.6507174, 0.6864355, -0.5815822, 0.5058824, 1, 0, 1,
-0.6471995, -1.880202, -2.815211, 0.5019608, 1, 0, 1,
-0.6445101, -1.235838, -2.696881, 0.4941176, 1, 0, 1,
-0.6443719, 0.7123327, -1.109131, 0.4862745, 1, 0, 1,
-0.6434293, 0.9065965, 0.8268377, 0.4823529, 1, 0, 1,
-0.6376151, -0.7015277, -2.550882, 0.4745098, 1, 0, 1,
-0.6317018, 0.8212662, -0.7937499, 0.4705882, 1, 0, 1,
-0.6250203, 1.665873, 0.6374873, 0.4627451, 1, 0, 1,
-0.622043, -0.03741937, -1.790845, 0.4588235, 1, 0, 1,
-0.6206614, -0.4797908, -3.868344, 0.4509804, 1, 0, 1,
-0.6189862, -0.9305266, -3.209484, 0.4470588, 1, 0, 1,
-0.6167526, 0.9473026, -0.8122306, 0.4392157, 1, 0, 1,
-0.6152598, 1.69672, 0.2348212, 0.4352941, 1, 0, 1,
-0.6125263, 1.333804, -0.5285908, 0.427451, 1, 0, 1,
-0.6076289, 0.331488, -0.9071401, 0.4235294, 1, 0, 1,
-0.6042788, -1.06198, -1.255188, 0.4156863, 1, 0, 1,
-0.6018788, -1.035516, -2.003008, 0.4117647, 1, 0, 1,
-0.6008377, -0.1619263, -4.124846, 0.4039216, 1, 0, 1,
-0.5965317, 1.490081, 0.1648447, 0.3960784, 1, 0, 1,
-0.5953476, -0.6467857, -2.333367, 0.3921569, 1, 0, 1,
-0.5928535, 0.3520564, -0.3123225, 0.3843137, 1, 0, 1,
-0.5840009, -0.7337213, -1.214049, 0.3803922, 1, 0, 1,
-0.5813743, 0.2113193, -1.602032, 0.372549, 1, 0, 1,
-0.5780398, -0.6574993, -0.08342932, 0.3686275, 1, 0, 1,
-0.5702811, 0.008067103, -3.008987, 0.3607843, 1, 0, 1,
-0.5694555, -1.549294, -2.609876, 0.3568628, 1, 0, 1,
-0.5574802, -1.047344, -3.233106, 0.3490196, 1, 0, 1,
-0.5571949, 0.9215785, -1.344578, 0.345098, 1, 0, 1,
-0.5548844, -0.1565934, -2.755865, 0.3372549, 1, 0, 1,
-0.5520071, 0.6606523, -1.657661, 0.3333333, 1, 0, 1,
-0.5510387, 0.6562148, -1.362689, 0.3254902, 1, 0, 1,
-0.550593, 0.234892, -1.254528, 0.3215686, 1, 0, 1,
-0.550202, 0.4712116, -0.7392969, 0.3137255, 1, 0, 1,
-0.5440788, 0.3511463, -0.9596139, 0.3098039, 1, 0, 1,
-0.5406584, -1.330163, -3.76138, 0.3019608, 1, 0, 1,
-0.5403462, -1.141605, -4.381714, 0.2941177, 1, 0, 1,
-0.5397904, -0.2717471, -1.630887, 0.2901961, 1, 0, 1,
-0.5387938, -1.458739, -1.303659, 0.282353, 1, 0, 1,
-0.536925, -0.05825329, -1.792139, 0.2784314, 1, 0, 1,
-0.5353953, 0.9432981, 1.138814, 0.2705882, 1, 0, 1,
-0.5286235, -0.2352727, -0.7156267, 0.2666667, 1, 0, 1,
-0.5280933, -1.947567, -3.727197, 0.2588235, 1, 0, 1,
-0.5235226, 1.663976, -1.142967, 0.254902, 1, 0, 1,
-0.5211039, 0.3424572, 0.401797, 0.2470588, 1, 0, 1,
-0.5199988, -0.1677902, -0.1925265, 0.2431373, 1, 0, 1,
-0.5176229, 1.556442, 0.8005493, 0.2352941, 1, 0, 1,
-0.5160524, 0.4083824, -1.067693, 0.2313726, 1, 0, 1,
-0.5139881, -1.028948, -3.422795, 0.2235294, 1, 0, 1,
-0.5091263, -0.5257122, -1.514401, 0.2196078, 1, 0, 1,
-0.5089819, 0.1824019, -1.403471, 0.2117647, 1, 0, 1,
-0.5083744, 0.1013171, -1.428557, 0.2078431, 1, 0, 1,
-0.5076838, -2.608127, -5.051375, 0.2, 1, 0, 1,
-0.5024931, -1.162876, -3.420869, 0.1921569, 1, 0, 1,
-0.4997004, 1.212259, 0.7740359, 0.1882353, 1, 0, 1,
-0.498263, 2.031016, -0.3446129, 0.1803922, 1, 0, 1,
-0.4925168, 1.582866, -1.44778, 0.1764706, 1, 0, 1,
-0.4887861, 0.6267038, -0.3010257, 0.1686275, 1, 0, 1,
-0.4885274, 0.7074097, -0.04141379, 0.1647059, 1, 0, 1,
-0.4862152, -1.555909, -4.305821, 0.1568628, 1, 0, 1,
-0.4851888, -0.2510155, -1.295072, 0.1529412, 1, 0, 1,
-0.4808465, 1.615598, -1.522455, 0.145098, 1, 0, 1,
-0.4778157, 0.7532348, -1.102367, 0.1411765, 1, 0, 1,
-0.4756487, 1.974374, 0.3500951, 0.1333333, 1, 0, 1,
-0.4746499, -0.0566485, -2.172777, 0.1294118, 1, 0, 1,
-0.4719812, 0.3540068, -0.754601, 0.1215686, 1, 0, 1,
-0.466804, 1.18069, 0.1379816, 0.1176471, 1, 0, 1,
-0.4656641, 1.359981, -2.345021, 0.1098039, 1, 0, 1,
-0.465494, -0.3262217, -2.864036, 0.1058824, 1, 0, 1,
-0.464539, -0.2901702, -1.129327, 0.09803922, 1, 0, 1,
-0.4617333, 0.7427489, -1.878623, 0.09019608, 1, 0, 1,
-0.4616791, -1.558824, -3.64111, 0.08627451, 1, 0, 1,
-0.4573895, 0.3232316, -1.041974, 0.07843138, 1, 0, 1,
-0.4563537, -1.394161, -2.627778, 0.07450981, 1, 0, 1,
-0.4540381, 0.3960131, -2.244018, 0.06666667, 1, 0, 1,
-0.4507636, -0.9879892, -2.117866, 0.0627451, 1, 0, 1,
-0.450533, -2.025285, -2.919551, 0.05490196, 1, 0, 1,
-0.4497307, 0.07111558, -2.26703, 0.05098039, 1, 0, 1,
-0.4482422, -0.1491211, -2.358584, 0.04313726, 1, 0, 1,
-0.4475167, 0.8605842, -0.01569518, 0.03921569, 1, 0, 1,
-0.447412, -1.772984, -3.314666, 0.03137255, 1, 0, 1,
-0.446669, -0.3322583, -0.7326234, 0.02745098, 1, 0, 1,
-0.4450433, 0.7536151, -1.386625, 0.01960784, 1, 0, 1,
-0.4448394, -0.4708258, -1.277847, 0.01568628, 1, 0, 1,
-0.4435579, 0.3405438, -0.8678433, 0.007843138, 1, 0, 1,
-0.440946, -1.554947, -4.551893, 0.003921569, 1, 0, 1,
-0.4406846, -0.3291362, -2.396122, 0, 1, 0.003921569, 1,
-0.4396218, -1.132238, -2.813282, 0, 1, 0.01176471, 1,
-0.4390635, -0.316988, -1.688196, 0, 1, 0.01568628, 1,
-0.4383438, -0.1103696, -0.04373631, 0, 1, 0.02352941, 1,
-0.434562, 0.06407267, 0.04476424, 0, 1, 0.02745098, 1,
-0.4310075, 0.5600528, 0.07822126, 0, 1, 0.03529412, 1,
-0.4305443, -0.5821459, -1.69875, 0, 1, 0.03921569, 1,
-0.4292614, 1.518175, 0.06861876, 0, 1, 0.04705882, 1,
-0.4256216, -0.2800243, -0.3809344, 0, 1, 0.05098039, 1,
-0.4247605, 0.9917713, 1.288688, 0, 1, 0.05882353, 1,
-0.4245057, -0.7664486, -0.7380432, 0, 1, 0.0627451, 1,
-0.4196957, 1.006548, -0.3537293, 0, 1, 0.07058824, 1,
-0.4179474, 0.9938963, 0.06160592, 0, 1, 0.07450981, 1,
-0.4149848, -0.2064605, -1.65492, 0, 1, 0.08235294, 1,
-0.4147962, -0.5028346, -3.387792, 0, 1, 0.08627451, 1,
-0.4091359, -0.3522023, -1.552645, 0, 1, 0.09411765, 1,
-0.4086793, -0.5945966, -1.485049, 0, 1, 0.1019608, 1,
-0.4038703, -1.521188, -3.362632, 0, 1, 0.1058824, 1,
-0.4030129, 0.6955183, 1.507648, 0, 1, 0.1137255, 1,
-0.4028367, -0.02701774, -1.329991, 0, 1, 0.1176471, 1,
-0.4013105, 0.7770716, -0.1331268, 0, 1, 0.1254902, 1,
-0.4008522, 0.7158616, 0.1356066, 0, 1, 0.1294118, 1,
-0.3960038, -0.2910327, -1.654133, 0, 1, 0.1372549, 1,
-0.3959147, -0.20449, -3.390661, 0, 1, 0.1411765, 1,
-0.3895452, 2.238047, 0.3725569, 0, 1, 0.1490196, 1,
-0.3868726, -0.1430971, -2.146297, 0, 1, 0.1529412, 1,
-0.3867274, -1.84563, -1.843985, 0, 1, 0.1607843, 1,
-0.3865227, -0.03091365, -2.27197, 0, 1, 0.1647059, 1,
-0.3840588, 0.4531549, -1.802867, 0, 1, 0.172549, 1,
-0.3805856, -2.291162, -2.944616, 0, 1, 0.1764706, 1,
-0.3795371, -0.318937, -2.173279, 0, 1, 0.1843137, 1,
-0.3793463, 0.03135602, -0.3490343, 0, 1, 0.1882353, 1,
-0.3751366, -2.226301, -2.966964, 0, 1, 0.1960784, 1,
-0.3737982, 2.051253, 0.3041382, 0, 1, 0.2039216, 1,
-0.3726284, 0.8189433, 0.00484133, 0, 1, 0.2078431, 1,
-0.3713521, 0.5240527, -1.666153, 0, 1, 0.2156863, 1,
-0.3706755, -0.9054123, -3.602646, 0, 1, 0.2196078, 1,
-0.3659696, -0.9020193, -3.093938, 0, 1, 0.227451, 1,
-0.3607625, -0.3820318, -3.207862, 0, 1, 0.2313726, 1,
-0.3597401, 1.020752, -1.185349, 0, 1, 0.2392157, 1,
-0.3594981, -1.107456, -2.803217, 0, 1, 0.2431373, 1,
-0.3587423, -1.917255, -1.792496, 0, 1, 0.2509804, 1,
-0.3582949, -1.877504, -2.855421, 0, 1, 0.254902, 1,
-0.3553883, 1.016048, 0.3077086, 0, 1, 0.2627451, 1,
-0.354876, -0.6027529, -0.6968523, 0, 1, 0.2666667, 1,
-0.3505942, 1.418556, -0.1619688, 0, 1, 0.2745098, 1,
-0.3498538, 1.45103, 0.05877721, 0, 1, 0.2784314, 1,
-0.3465849, -0.4565097, -3.193631, 0, 1, 0.2862745, 1,
-0.3443103, 0.1648722, -0.8574231, 0, 1, 0.2901961, 1,
-0.3441314, -0.8292502, -2.800668, 0, 1, 0.2980392, 1,
-0.3419943, -0.1229202, -2.891282, 0, 1, 0.3058824, 1,
-0.3401524, -0.1062166, -1.152356, 0, 1, 0.3098039, 1,
-0.3399585, 0.9345054, -0.05514206, 0, 1, 0.3176471, 1,
-0.3364354, -0.9912721, -3.315892, 0, 1, 0.3215686, 1,
-0.335285, -1.263546, -2.476456, 0, 1, 0.3294118, 1,
-0.3347954, -1.063892, -3.95428, 0, 1, 0.3333333, 1,
-0.3333073, -1.733725, -2.670027, 0, 1, 0.3411765, 1,
-0.3286204, -0.8263916, -3.804326, 0, 1, 0.345098, 1,
-0.3280554, 0.6293892, -1.171377, 0, 1, 0.3529412, 1,
-0.3277788, 0.9169589, -0.3037088, 0, 1, 0.3568628, 1,
-0.3255489, 0.1639197, -1.667391, 0, 1, 0.3647059, 1,
-0.3217038, 0.2839877, 2.024585, 0, 1, 0.3686275, 1,
-0.3192854, -1.820657, -2.957772, 0, 1, 0.3764706, 1,
-0.3189799, 0.2169326, -1.781377, 0, 1, 0.3803922, 1,
-0.3171889, 0.4448498, -0.5966096, 0, 1, 0.3882353, 1,
-0.3131722, -0.336393, -2.076106, 0, 1, 0.3921569, 1,
-0.3107437, -0.6902572, -3.256935, 0, 1, 0.4, 1,
-0.3040974, 0.2482074, -1.974988, 0, 1, 0.4078431, 1,
-0.2986247, -0.5962938, -2.969113, 0, 1, 0.4117647, 1,
-0.2933674, -1.46214, -2.862254, 0, 1, 0.4196078, 1,
-0.2896462, -0.6812853, -1.633029, 0, 1, 0.4235294, 1,
-0.2882086, -1.579375, -3.631331, 0, 1, 0.4313726, 1,
-0.2857453, 0.1169917, -2.860164, 0, 1, 0.4352941, 1,
-0.282889, 0.1391847, -0.4529032, 0, 1, 0.4431373, 1,
-0.2828379, -0.9057999, -3.033322, 0, 1, 0.4470588, 1,
-0.2819052, -0.854613, -2.856881, 0, 1, 0.454902, 1,
-0.278282, 0.5548186, -0.9829726, 0, 1, 0.4588235, 1,
-0.2746214, -0.5567397, -2.800147, 0, 1, 0.4666667, 1,
-0.2738648, 0.845774, -1.012035, 0, 1, 0.4705882, 1,
-0.2706076, 2.065222, 0.1016389, 0, 1, 0.4784314, 1,
-0.2661512, 0.77729, -0.8292378, 0, 1, 0.4823529, 1,
-0.2618344, -1.250121, -2.055822, 0, 1, 0.4901961, 1,
-0.2594372, -0.6334968, -3.708047, 0, 1, 0.4941176, 1,
-0.2570236, 0.204638, -0.9399216, 0, 1, 0.5019608, 1,
-0.2504714, -0.6397576, -4.503892, 0, 1, 0.509804, 1,
-0.2462763, -0.8632197, -3.196644, 0, 1, 0.5137255, 1,
-0.241659, -0.6829831, -1.914637, 0, 1, 0.5215687, 1,
-0.2403976, 0.3739907, -0.9241577, 0, 1, 0.5254902, 1,
-0.2386098, 0.05953708, -1.102897, 0, 1, 0.5333334, 1,
-0.2371299, 0.1025964, -1.432675, 0, 1, 0.5372549, 1,
-0.2298677, 0.7859768, 1.339029, 0, 1, 0.5450981, 1,
-0.2277284, 0.1879985, -1.570476, 0, 1, 0.5490196, 1,
-0.2276967, -1.434468, -1.526827, 0, 1, 0.5568628, 1,
-0.2241628, -0.3186414, -1.264505, 0, 1, 0.5607843, 1,
-0.2184714, 1.163308, 1.377074, 0, 1, 0.5686275, 1,
-0.2154361, 0.5039962, -0.7128513, 0, 1, 0.572549, 1,
-0.2151558, 0.3417763, -1.278061, 0, 1, 0.5803922, 1,
-0.2124901, 0.3247563, -1.395827, 0, 1, 0.5843138, 1,
-0.2110571, -0.3580448, -3.051241, 0, 1, 0.5921569, 1,
-0.2075226, 0.4406454, -2.697098, 0, 1, 0.5960785, 1,
-0.205753, -0.5556662, -2.194355, 0, 1, 0.6039216, 1,
-0.204998, -0.9267147, -3.108788, 0, 1, 0.6117647, 1,
-0.2040721, 0.1614171, -1.942615, 0, 1, 0.6156863, 1,
-0.2005101, -0.4427574, -1.689677, 0, 1, 0.6235294, 1,
-0.1976657, 0.3871545, 0.202399, 0, 1, 0.627451, 1,
-0.1919737, 1.407939, 0.7549218, 0, 1, 0.6352941, 1,
-0.1918318, -1.122685, -2.613173, 0, 1, 0.6392157, 1,
-0.1908453, -1.805956, -0.8397405, 0, 1, 0.6470588, 1,
-0.1897232, 1.061497, -0.004458358, 0, 1, 0.6509804, 1,
-0.1856873, 0.9473135, -0.8877945, 0, 1, 0.6588235, 1,
-0.1855972, 0.2444278, -0.545664, 0, 1, 0.6627451, 1,
-0.185073, -0.5578482, -2.240767, 0, 1, 0.6705883, 1,
-0.1706083, -1.047713, -3.488071, 0, 1, 0.6745098, 1,
-0.1693562, 0.3954034, 1.001372, 0, 1, 0.682353, 1,
-0.1677226, -0.3626919, -0.8964103, 0, 1, 0.6862745, 1,
-0.1675467, 0.1534655, -0.7904955, 0, 1, 0.6941177, 1,
-0.1673741, 1.32309, -2.055799, 0, 1, 0.7019608, 1,
-0.1667125, 0.1474514, 0.1386336, 0, 1, 0.7058824, 1,
-0.1630089, 0.3759763, -1.019226, 0, 1, 0.7137255, 1,
-0.1589808, 1.46347, -0.2579533, 0, 1, 0.7176471, 1,
-0.1585514, -0.4501011, -3.798894, 0, 1, 0.7254902, 1,
-0.1580064, 1.418668, 0.5216984, 0, 1, 0.7294118, 1,
-0.1579817, -0.8080191, -1.874158, 0, 1, 0.7372549, 1,
-0.1575712, -0.3497815, -2.647428, 0, 1, 0.7411765, 1,
-0.1574171, -1.017277, -2.519514, 0, 1, 0.7490196, 1,
-0.1568241, -0.9068045, -5.912255, 0, 1, 0.7529412, 1,
-0.1549188, 1.194718, -0.06658766, 0, 1, 0.7607843, 1,
-0.1518369, 0.8759888, -0.3763475, 0, 1, 0.7647059, 1,
-0.1488224, 0.3073962, -0.2002991, 0, 1, 0.772549, 1,
-0.1481841, 1.561133, 0.003565295, 0, 1, 0.7764706, 1,
-0.1426842, -1.33608, -2.910547, 0, 1, 0.7843137, 1,
-0.141676, 0.8048531, -2.481703, 0, 1, 0.7882353, 1,
-0.1402585, 1.069746, -0.8616643, 0, 1, 0.7960784, 1,
-0.1363533, 0.03145086, -1.296792, 0, 1, 0.8039216, 1,
-0.1353227, -1.789537, -4.555401, 0, 1, 0.8078431, 1,
-0.1343701, -0.3647186, -3.319766, 0, 1, 0.8156863, 1,
-0.1339724, -1.330507, -1.700603, 0, 1, 0.8196079, 1,
-0.1329881, -1.345427, -1.875479, 0, 1, 0.827451, 1,
-0.1301244, -0.6775917, -2.108027, 0, 1, 0.8313726, 1,
-0.1298839, -1.100207, -1.893764, 0, 1, 0.8392157, 1,
-0.1296817, 0.6413861, -1.558389, 0, 1, 0.8431373, 1,
-0.1292516, 0.4566538, 2.606838, 0, 1, 0.8509804, 1,
-0.1279638, -0.7110642, -1.820704, 0, 1, 0.854902, 1,
-0.1276599, 0.3484608, -1.506459, 0, 1, 0.8627451, 1,
-0.1269034, -0.3604077, -3.128577, 0, 1, 0.8666667, 1,
-0.1253288, 0.9630685, 0.7856233, 0, 1, 0.8745098, 1,
-0.122593, 0.8126409, 0.430444, 0, 1, 0.8784314, 1,
-0.1147707, -0.3272665, -1.525317, 0, 1, 0.8862745, 1,
-0.1118101, 0.6481547, 0.3345611, 0, 1, 0.8901961, 1,
-0.1107941, -0.4300809, -2.066024, 0, 1, 0.8980392, 1,
-0.0923862, -1.580403, -3.224378, 0, 1, 0.9058824, 1,
-0.08929105, 0.2730066, -0.5704473, 0, 1, 0.9098039, 1,
-0.08916799, 1.6383, 1.329063, 0, 1, 0.9176471, 1,
-0.08579177, -0.04623293, -1.704309, 0, 1, 0.9215686, 1,
-0.08366302, 0.117942, -1.601906, 0, 1, 0.9294118, 1,
-0.08091737, 0.4402352, 0.179045, 0, 1, 0.9333333, 1,
-0.08072371, 0.7628028, 0.5557439, 0, 1, 0.9411765, 1,
-0.0802561, 0.9503462, 1.983033, 0, 1, 0.945098, 1,
-0.07866227, -0.2996122, -4.379546, 0, 1, 0.9529412, 1,
-0.07724679, -0.740301, -3.943829, 0, 1, 0.9568627, 1,
-0.07472275, 1.155557, -0.2948629, 0, 1, 0.9647059, 1,
-0.07246151, -0.6917467, -3.167389, 0, 1, 0.9686275, 1,
-0.07169964, 0.1297048, 0.2279196, 0, 1, 0.9764706, 1,
-0.06592481, 0.1306548, -2.569823, 0, 1, 0.9803922, 1,
-0.06515333, -0.2449877, -1.250239, 0, 1, 0.9882353, 1,
-0.063395, -1.513487, -4.366292, 0, 1, 0.9921569, 1,
-0.06226229, 0.1498652, -0.08569717, 0, 1, 1, 1,
-0.0614629, -0.5860159, -4.466846, 0, 0.9921569, 1, 1,
-0.05837968, -0.5360801, -2.998554, 0, 0.9882353, 1, 1,
-0.05508957, 0.8411008, 1.087377, 0, 0.9803922, 1, 1,
-0.0541551, 0.127647, 0.7006543, 0, 0.9764706, 1, 1,
-0.05316935, 0.5320673, 1.685108, 0, 0.9686275, 1, 1,
-0.05085329, -0.01480156, -2.352171, 0, 0.9647059, 1, 1,
-0.04933266, 0.30905, 2.003127, 0, 0.9568627, 1, 1,
-0.04498537, -2.345883, -2.105807, 0, 0.9529412, 1, 1,
-0.04337686, 0.7128412, -1.919002, 0, 0.945098, 1, 1,
-0.04282332, -0.6429817, -4.108639, 0, 0.9411765, 1, 1,
-0.04007658, -0.1161906, -1.994021, 0, 0.9333333, 1, 1,
-0.03784082, -0.3379039, -2.344548, 0, 0.9294118, 1, 1,
-0.03615962, -0.355671, -4.583228, 0, 0.9215686, 1, 1,
-0.03557752, 0.6217626, 0.03005674, 0, 0.9176471, 1, 1,
-0.03510852, -1.883205, -4.996232, 0, 0.9098039, 1, 1,
-0.03345618, -0.1017342, -2.01937, 0, 0.9058824, 1, 1,
-0.03285137, -0.3970015, -3.619493, 0, 0.8980392, 1, 1,
-0.03163445, -0.006347968, -3.446138, 0, 0.8901961, 1, 1,
-0.0313934, -1.298459, -2.251657, 0, 0.8862745, 1, 1,
-0.03039079, -0.9939947, -3.084553, 0, 0.8784314, 1, 1,
-0.02647443, -1.448547, -3.695233, 0, 0.8745098, 1, 1,
-0.02502245, -0.370823, -2.269992, 0, 0.8666667, 1, 1,
-0.02301649, 0.9609383, 0.1177229, 0, 0.8627451, 1, 1,
-0.01754294, 1.253435, 0.7565708, 0, 0.854902, 1, 1,
-0.01750455, -0.9758369, -4.324922, 0, 0.8509804, 1, 1,
-0.01546961, -0.573927, -4.561737, 0, 0.8431373, 1, 1,
-0.01505996, 0.3142608, 1.479491, 0, 0.8392157, 1, 1,
-0.0135268, -0.08464382, -2.913682, 0, 0.8313726, 1, 1,
-0.007025384, -0.3298816, -2.576865, 0, 0.827451, 1, 1,
-0.006548211, -1.346082, -2.899529, 0, 0.8196079, 1, 1,
-0.002944303, 0.9602553, 0.2309792, 0, 0.8156863, 1, 1,
-0.001271636, -0.3836813, -2.013502, 0, 0.8078431, 1, 1,
0.002351937, -0.882966, 2.821121, 0, 0.8039216, 1, 1,
0.007416249, -1.959876, 2.48961, 0, 0.7960784, 1, 1,
0.009553216, -1.907607, 1.927671, 0, 0.7882353, 1, 1,
0.01322315, 0.02196935, 0.7741409, 0, 0.7843137, 1, 1,
0.01956114, -0.6441148, 3.1889, 0, 0.7764706, 1, 1,
0.02038527, -1.219061, 2.659638, 0, 0.772549, 1, 1,
0.02125746, -1.465214, 3.546325, 0, 0.7647059, 1, 1,
0.02425483, 0.03667149, 0.2618487, 0, 0.7607843, 1, 1,
0.02625749, 2.217094, -1.321772, 0, 0.7529412, 1, 1,
0.03140244, -0.6504969, 5.035282, 0, 0.7490196, 1, 1,
0.03226485, 1.088091, 1.571595, 0, 0.7411765, 1, 1,
0.04057902, -1.959449, 4.623372, 0, 0.7372549, 1, 1,
0.04205379, -0.01184411, 0.9144965, 0, 0.7294118, 1, 1,
0.04770092, -0.2695896, 2.387, 0, 0.7254902, 1, 1,
0.05035959, -0.07984506, 3.045973, 0, 0.7176471, 1, 1,
0.0550707, -1.081776, 4.053194, 0, 0.7137255, 1, 1,
0.05573367, 0.8403569, -1.167553, 0, 0.7058824, 1, 1,
0.059514, 0.4088055, 2.116197, 0, 0.6980392, 1, 1,
0.06386712, -1.999022, 3.718106, 0, 0.6941177, 1, 1,
0.06684401, 0.7806985, 1.361196, 0, 0.6862745, 1, 1,
0.06907299, -0.1382654, 3.236639, 0, 0.682353, 1, 1,
0.07073972, -0.5498465, 3.02306, 0, 0.6745098, 1, 1,
0.07237812, -0.6969618, 4.240899, 0, 0.6705883, 1, 1,
0.07532142, -1.608129, 2.027702, 0, 0.6627451, 1, 1,
0.07907823, 1.583261, -0.2154041, 0, 0.6588235, 1, 1,
0.07974074, 1.540623, 0.6835025, 0, 0.6509804, 1, 1,
0.0797674, 0.04065422, 2.305834, 0, 0.6470588, 1, 1,
0.08297653, -0.03627123, 1.869105, 0, 0.6392157, 1, 1,
0.08363672, -1.181837, 3.813073, 0, 0.6352941, 1, 1,
0.08477376, -0.7642784, 2.870229, 0, 0.627451, 1, 1,
0.0848074, 0.6799349, 0.5779863, 0, 0.6235294, 1, 1,
0.08548333, 0.6463283, -0.2399142, 0, 0.6156863, 1, 1,
0.08651295, -0.6601896, 2.622027, 0, 0.6117647, 1, 1,
0.08753296, 0.6654469, -1.004212, 0, 0.6039216, 1, 1,
0.08958893, -0.6819444, 4.072251, 0, 0.5960785, 1, 1,
0.09385628, 0.7547561, -1.073968, 0, 0.5921569, 1, 1,
0.0946982, 1.520246, -0.6987058, 0, 0.5843138, 1, 1,
0.09887858, -1.040973, 3.925194, 0, 0.5803922, 1, 1,
0.09954426, 0.03818927, 0.4848819, 0, 0.572549, 1, 1,
0.1013209, 0.1232796, 1.0518, 0, 0.5686275, 1, 1,
0.1078996, -0.2499916, 2.69085, 0, 0.5607843, 1, 1,
0.1086726, -0.1638187, 2.272146, 0, 0.5568628, 1, 1,
0.1093902, 1.452306, 2.013187, 0, 0.5490196, 1, 1,
0.1095609, 1.366487, -0.5053251, 0, 0.5450981, 1, 1,
0.1110545, -0.5318671, 2.488975, 0, 0.5372549, 1, 1,
0.1114996, 0.7000299, 0.7306238, 0, 0.5333334, 1, 1,
0.1126157, 0.6113719, 0.07033869, 0, 0.5254902, 1, 1,
0.1132024, 0.42446, 0.4869352, 0, 0.5215687, 1, 1,
0.1191296, -1.186552, 1.64459, 0, 0.5137255, 1, 1,
0.1197447, 1.34285, 1.242149, 0, 0.509804, 1, 1,
0.1237195, -0.3801402, 2.890111, 0, 0.5019608, 1, 1,
0.1243329, 0.268405, -0.1211059, 0, 0.4941176, 1, 1,
0.1247697, -1.331403, 4.567548, 0, 0.4901961, 1, 1,
0.1275988, -1.298246, 2.419589, 0, 0.4823529, 1, 1,
0.1291658, -0.420553, 2.365804, 0, 0.4784314, 1, 1,
0.1325612, -0.6680784, 2.394246, 0, 0.4705882, 1, 1,
0.1339726, 0.3948452, 2.128476, 0, 0.4666667, 1, 1,
0.1351952, -0.6365026, 5.418327, 0, 0.4588235, 1, 1,
0.1362556, 0.3728051, -0.09190692, 0, 0.454902, 1, 1,
0.1369922, -0.4387079, 2.194965, 0, 0.4470588, 1, 1,
0.1376015, 0.8909228, -1.273708, 0, 0.4431373, 1, 1,
0.1407981, 0.1906205, 0.02296634, 0, 0.4352941, 1, 1,
0.1410738, 0.3111155, -0.707316, 0, 0.4313726, 1, 1,
0.1447573, -1.319243, 1.525114, 0, 0.4235294, 1, 1,
0.1460269, -0.1758848, 2.27369, 0, 0.4196078, 1, 1,
0.1496915, 0.5591438, 0.4151543, 0, 0.4117647, 1, 1,
0.1513047, 0.7930132, 0.7972707, 0, 0.4078431, 1, 1,
0.1513784, 0.3576754, 1.316081, 0, 0.4, 1, 1,
0.1542265, 0.1032667, 0.4064667, 0, 0.3921569, 1, 1,
0.1577154, -0.2949317, 3.53883, 0, 0.3882353, 1, 1,
0.1625701, -0.210202, 3.265319, 0, 0.3803922, 1, 1,
0.1665408, -0.8005526, 4.828319, 0, 0.3764706, 1, 1,
0.1697425, 0.6666805, 0.1014524, 0, 0.3686275, 1, 1,
0.173198, -0.8686706, 2.425425, 0, 0.3647059, 1, 1,
0.1743055, 0.2374208, -0.08162253, 0, 0.3568628, 1, 1,
0.1753364, -2.465954, 2.455026, 0, 0.3529412, 1, 1,
0.178801, 1.874871, -1.163827, 0, 0.345098, 1, 1,
0.1798694, -1.382605, 2.742973, 0, 0.3411765, 1, 1,
0.1829757, -0.3772642, 1.410048, 0, 0.3333333, 1, 1,
0.1849193, -1.566344, 3.191723, 0, 0.3294118, 1, 1,
0.1870001, 1.693559, -0.03657497, 0, 0.3215686, 1, 1,
0.1891544, 0.2625743, 0.5197994, 0, 0.3176471, 1, 1,
0.1904548, 0.3725911, 1.280486, 0, 0.3098039, 1, 1,
0.1976798, -1.668899, 0.9037309, 0, 0.3058824, 1, 1,
0.1989095, -1.45566, 2.74678, 0, 0.2980392, 1, 1,
0.2022591, -0.4135179, 2.969271, 0, 0.2901961, 1, 1,
0.2084307, 1.010931, 0.4456262, 0, 0.2862745, 1, 1,
0.2102595, 0.8730949, 0.1457372, 0, 0.2784314, 1, 1,
0.211917, 1.368089, -1.691669, 0, 0.2745098, 1, 1,
0.2218913, 0.2445863, 1.581228, 0, 0.2666667, 1, 1,
0.2237448, -0.7507367, 2.893575, 0, 0.2627451, 1, 1,
0.2271493, 0.6311783, 0.0218817, 0, 0.254902, 1, 1,
0.228871, 0.4036561, 0.1752243, 0, 0.2509804, 1, 1,
0.2316333, 0.9529175, -1.461882, 0, 0.2431373, 1, 1,
0.232155, -0.2370674, 2.450848, 0, 0.2392157, 1, 1,
0.2373627, -0.07781158, 2.195517, 0, 0.2313726, 1, 1,
0.2422418, 1.157953, 1.319265, 0, 0.227451, 1, 1,
0.2440017, 1.328264, 0.5669011, 0, 0.2196078, 1, 1,
0.2463597, -0.8272515, 0.6231288, 0, 0.2156863, 1, 1,
0.2472354, -2.903186, 2.702181, 0, 0.2078431, 1, 1,
0.2474706, -0.8744436, 2.909024, 0, 0.2039216, 1, 1,
0.2490651, 0.6114702, -0.6670007, 0, 0.1960784, 1, 1,
0.2606148, 0.2862038, -0.3406907, 0, 0.1882353, 1, 1,
0.2633251, -1.555723, 2.837334, 0, 0.1843137, 1, 1,
0.2636119, -0.3276793, 0.784658, 0, 0.1764706, 1, 1,
0.2639071, 0.1555792, 0.522427, 0, 0.172549, 1, 1,
0.265772, 0.7083425, 0.1380307, 0, 0.1647059, 1, 1,
0.2713337, -1.031009, 2.651365, 0, 0.1607843, 1, 1,
0.2735057, 0.6309009, 0.6447951, 0, 0.1529412, 1, 1,
0.2791816, 0.0834738, 1.938916, 0, 0.1490196, 1, 1,
0.2793145, 0.09327988, 0.9211211, 0, 0.1411765, 1, 1,
0.2794463, -2.827798, -0.1337502, 0, 0.1372549, 1, 1,
0.286496, -0.7477884, 2.401246, 0, 0.1294118, 1, 1,
0.2866267, 2.315658, 0.335879, 0, 0.1254902, 1, 1,
0.2876421, -1.720862, 0.2107998, 0, 0.1176471, 1, 1,
0.2889116, -0.4598885, 2.330004, 0, 0.1137255, 1, 1,
0.2910307, 0.8633136, -0.4724602, 0, 0.1058824, 1, 1,
0.2928275, -0.1778167, 3.291081, 0, 0.09803922, 1, 1,
0.2950404, -0.1707672, 2.753671, 0, 0.09411765, 1, 1,
0.295541, 1.957646, 0.7978616, 0, 0.08627451, 1, 1,
0.2972907, -1.087541, 1.675052, 0, 0.08235294, 1, 1,
0.2987665, 0.1742092, 2.116909, 0, 0.07450981, 1, 1,
0.3039227, -0.4164919, 1.778126, 0, 0.07058824, 1, 1,
0.3124994, 0.7077584, 0.02004747, 0, 0.0627451, 1, 1,
0.3157067, 0.07417867, 0.6887345, 0, 0.05882353, 1, 1,
0.3199891, 0.2368814, 1.384841, 0, 0.05098039, 1, 1,
0.3202694, 0.08433975, 0.7782448, 0, 0.04705882, 1, 1,
0.3253073, 1.387348, 0.7380232, 0, 0.03921569, 1, 1,
0.3253919, 1.216478, -1.681709, 0, 0.03529412, 1, 1,
0.3258316, 0.6537145, 0.2484696, 0, 0.02745098, 1, 1,
0.3266474, 1.068487, 2.077315, 0, 0.02352941, 1, 1,
0.3269125, 1.716826, 0.7209827, 0, 0.01568628, 1, 1,
0.3275414, 1.543189, -0.5167246, 0, 0.01176471, 1, 1,
0.3331473, -0.8040617, 1.648667, 0, 0.003921569, 1, 1,
0.3332313, -0.3930145, 1.787753, 0.003921569, 0, 1, 1,
0.3396859, -0.8690727, 2.234654, 0.007843138, 0, 1, 1,
0.3419442, -1.086019, 3.064087, 0.01568628, 0, 1, 1,
0.3465871, -0.5779983, 2.10208, 0.01960784, 0, 1, 1,
0.3472921, -0.01604242, 2.534235, 0.02745098, 0, 1, 1,
0.354281, 1.302151, 1.093258, 0.03137255, 0, 1, 1,
0.3579165, 0.955699, -1.123706, 0.03921569, 0, 1, 1,
0.3664197, 0.2969093, 0.519029, 0.04313726, 0, 1, 1,
0.3686826, -0.2671856, 1.99808, 0.05098039, 0, 1, 1,
0.3708575, 0.7121257, 2.506988, 0.05490196, 0, 1, 1,
0.3717562, 0.9051681, 2.542109, 0.0627451, 0, 1, 1,
0.3720125, -0.05879873, 1.181159, 0.06666667, 0, 1, 1,
0.3721191, 0.1487775, -0.5513058, 0.07450981, 0, 1, 1,
0.3756691, -0.1099195, 2.714636, 0.07843138, 0, 1, 1,
0.376511, 0.1168581, 1.283575, 0.08627451, 0, 1, 1,
0.377617, -0.588002, 1.806013, 0.09019608, 0, 1, 1,
0.3778521, -0.4232351, 2.589449, 0.09803922, 0, 1, 1,
0.3791518, 1.476915, 1.721488, 0.1058824, 0, 1, 1,
0.3794012, 0.956337, 1.819209, 0.1098039, 0, 1, 1,
0.3910209, -0.7543754, 2.297978, 0.1176471, 0, 1, 1,
0.3918142, 0.3681531, 0.008958731, 0.1215686, 0, 1, 1,
0.3930907, -0.2377461, 2.084663, 0.1294118, 0, 1, 1,
0.3959616, 1.769546, -0.7975023, 0.1333333, 0, 1, 1,
0.3975114, -1.062575, 3.451162, 0.1411765, 0, 1, 1,
0.4011697, 0.4295749, 1.501319, 0.145098, 0, 1, 1,
0.406203, 0.09358445, 0.03359828, 0.1529412, 0, 1, 1,
0.4075533, 0.9372718, -1.824694, 0.1568628, 0, 1, 1,
0.4086362, -0.7772204, 3.836504, 0.1647059, 0, 1, 1,
0.410757, -0.7584727, 3.709642, 0.1686275, 0, 1, 1,
0.411046, -0.6570674, 3.080043, 0.1764706, 0, 1, 1,
0.4110872, 0.003786871, 1.761854, 0.1803922, 0, 1, 1,
0.4113977, -0.3845295, 2.38425, 0.1882353, 0, 1, 1,
0.4168853, 0.2464847, -0.2876629, 0.1921569, 0, 1, 1,
0.4254811, 0.1703655, 2.228904, 0.2, 0, 1, 1,
0.4273703, -1.384122, 4.337291, 0.2078431, 0, 1, 1,
0.4306176, 0.820716, 0.03609855, 0.2117647, 0, 1, 1,
0.4399388, -1.221232, 4.28534, 0.2196078, 0, 1, 1,
0.4489647, -0.128131, 1.733961, 0.2235294, 0, 1, 1,
0.4495962, 1.508314, 0.7231663, 0.2313726, 0, 1, 1,
0.4513848, -0.8198045, 3.95556, 0.2352941, 0, 1, 1,
0.4614594, -0.3957124, 1.280584, 0.2431373, 0, 1, 1,
0.4766115, 2.879438, 1.453877, 0.2470588, 0, 1, 1,
0.4781043, -2.013565, 2.826569, 0.254902, 0, 1, 1,
0.4786179, 1.270758, 0.6519806, 0.2588235, 0, 1, 1,
0.4789204, -0.9652596, 2.267021, 0.2666667, 0, 1, 1,
0.4846712, -0.8416554, 2.656757, 0.2705882, 0, 1, 1,
0.4854474, -0.1551397, 2.612687, 0.2784314, 0, 1, 1,
0.4877593, 0.3885386, -0.5669312, 0.282353, 0, 1, 1,
0.492337, -0.5579931, 1.706683, 0.2901961, 0, 1, 1,
0.4972498, 1.284006, 3.078032, 0.2941177, 0, 1, 1,
0.497843, 1.619233, -1.599737, 0.3019608, 0, 1, 1,
0.504338, 0.07192722, 2.020757, 0.3098039, 0, 1, 1,
0.5094603, 0.1867586, 1.804729, 0.3137255, 0, 1, 1,
0.5116333, 0.4655416, 3.774555, 0.3215686, 0, 1, 1,
0.5207239, 0.1878902, 3.056624, 0.3254902, 0, 1, 1,
0.5307533, -0.8498126, 1.695416, 0.3333333, 0, 1, 1,
0.5318292, -0.09193639, 3.896689, 0.3372549, 0, 1, 1,
0.5327152, -0.1248571, 2.932071, 0.345098, 0, 1, 1,
0.540055, 1.164549, -0.2253529, 0.3490196, 0, 1, 1,
0.5401711, -0.8619457, 1.192562, 0.3568628, 0, 1, 1,
0.5434835, 1.703481, 1.036013, 0.3607843, 0, 1, 1,
0.5448299, -0.7484326, 2.083304, 0.3686275, 0, 1, 1,
0.5499318, 2.05641, -1.041998, 0.372549, 0, 1, 1,
0.5521461, 1.717699, 0.5024813, 0.3803922, 0, 1, 1,
0.552986, -1.207093, 3.747022, 0.3843137, 0, 1, 1,
0.5545046, 0.8520057, 0.3413612, 0.3921569, 0, 1, 1,
0.5573099, 0.9115158, 0.2257681, 0.3960784, 0, 1, 1,
0.5573498, -0.8049744, 3.459491, 0.4039216, 0, 1, 1,
0.5574973, -0.3279065, 3.221332, 0.4117647, 0, 1, 1,
0.5596188, -0.1348366, 1.455161, 0.4156863, 0, 1, 1,
0.5667002, -1.330804, 2.157689, 0.4235294, 0, 1, 1,
0.5701735, 1.080094, -0.05700765, 0.427451, 0, 1, 1,
0.5725553, 0.5712018, 0.580626, 0.4352941, 0, 1, 1,
0.5727082, 1.156125, -0.5757611, 0.4392157, 0, 1, 1,
0.5738555, 0.07942734, 0.9062929, 0.4470588, 0, 1, 1,
0.5817502, -0.9852866, 2.862277, 0.4509804, 0, 1, 1,
0.5832617, 1.312933, 1.414619, 0.4588235, 0, 1, 1,
0.589893, 0.5556561, 1.083619, 0.4627451, 0, 1, 1,
0.6072031, 1.604519, -0.952254, 0.4705882, 0, 1, 1,
0.616313, 1.588364, 0.836656, 0.4745098, 0, 1, 1,
0.617028, -0.6091695, 1.311584, 0.4823529, 0, 1, 1,
0.6172305, 1.834298, 0.602689, 0.4862745, 0, 1, 1,
0.6202499, 1.052874, 1.825616, 0.4941176, 0, 1, 1,
0.6227223, -1.042778, 1.600739, 0.5019608, 0, 1, 1,
0.6252065, -1.076897, 2.443977, 0.5058824, 0, 1, 1,
0.6306495, -0.08704396, 1.565561, 0.5137255, 0, 1, 1,
0.6309707, -1.249779, 3.064033, 0.5176471, 0, 1, 1,
0.6335042, -0.8083198, 3.792086, 0.5254902, 0, 1, 1,
0.6357361, -1.118223, 1.208106, 0.5294118, 0, 1, 1,
0.6367973, -2.015926, 0.7502829, 0.5372549, 0, 1, 1,
0.6491531, 0.2632154, 2.127588, 0.5411765, 0, 1, 1,
0.6545203, 0.04844272, 1.686057, 0.5490196, 0, 1, 1,
0.6615446, 0.2885006, 0.2165315, 0.5529412, 0, 1, 1,
0.6638955, -0.1970516, -0.3498953, 0.5607843, 0, 1, 1,
0.6800262, -0.5174158, 1.88545, 0.5647059, 0, 1, 1,
0.6848521, 0.5463694, 0.6772918, 0.572549, 0, 1, 1,
0.6860821, 0.2020808, 1.796598, 0.5764706, 0, 1, 1,
0.6876408, 0.965718, -0.4784291, 0.5843138, 0, 1, 1,
0.6878252, -1.08547, 1.656555, 0.5882353, 0, 1, 1,
0.689304, -0.1545516, 0.4632812, 0.5960785, 0, 1, 1,
0.6897194, 0.1389061, 2.592277, 0.6039216, 0, 1, 1,
0.692615, 1.982767, 0.7628141, 0.6078432, 0, 1, 1,
0.6977066, -0.8151952, 2.173968, 0.6156863, 0, 1, 1,
0.6990656, -0.1240234, 1.29301, 0.6196079, 0, 1, 1,
0.7038581, -1.062432, 2.918534, 0.627451, 0, 1, 1,
0.7041278, -0.6273079, 2.254981, 0.6313726, 0, 1, 1,
0.7046663, 0.3312741, 0.2751331, 0.6392157, 0, 1, 1,
0.7053639, -0.5152819, 2.143701, 0.6431373, 0, 1, 1,
0.7115685, -0.5443257, 2.445935, 0.6509804, 0, 1, 1,
0.7179095, 0.6761596, 1.455306, 0.654902, 0, 1, 1,
0.7246155, 1.496284, 0.02161427, 0.6627451, 0, 1, 1,
0.7310297, -1.351423, 4.522917, 0.6666667, 0, 1, 1,
0.7407459, 0.1010104, 1.365691, 0.6745098, 0, 1, 1,
0.7451264, -0.4338133, 2.198721, 0.6784314, 0, 1, 1,
0.7456319, 0.8965936, 1.426152, 0.6862745, 0, 1, 1,
0.7458063, -1.713762, -0.1883018, 0.6901961, 0, 1, 1,
0.7461672, -0.04371025, 0.2857275, 0.6980392, 0, 1, 1,
0.7489174, 0.4124611, 0.9415987, 0.7058824, 0, 1, 1,
0.7502588, 0.24122, 1.127802, 0.7098039, 0, 1, 1,
0.7519423, 0.6563755, 2.22366, 0.7176471, 0, 1, 1,
0.752821, -1.206239, 1.464255, 0.7215686, 0, 1, 1,
0.7529404, -0.2177221, -0.1893805, 0.7294118, 0, 1, 1,
0.7553571, 1.361926, 0.004230762, 0.7333333, 0, 1, 1,
0.7567892, -0.9011388, 3.225462, 0.7411765, 0, 1, 1,
0.7636171, 0.3242224, 2.294693, 0.7450981, 0, 1, 1,
0.7697771, 2.467178, -1.12102, 0.7529412, 0, 1, 1,
0.7773507, 1.068192, 1.019534, 0.7568628, 0, 1, 1,
0.7850898, -0.6130878, 2.24064, 0.7647059, 0, 1, 1,
0.7905976, 0.29982, 1.450266, 0.7686275, 0, 1, 1,
0.7966298, 1.340301, 1.048233, 0.7764706, 0, 1, 1,
0.797433, -0.6206856, 2.047902, 0.7803922, 0, 1, 1,
0.7979534, 1.189097, 0.845109, 0.7882353, 0, 1, 1,
0.7991538, -0.2780952, 2.04773, 0.7921569, 0, 1, 1,
0.8057842, 0.3988534, 0.6076428, 0.8, 0, 1, 1,
0.8063787, -2.558172, 3.135546, 0.8078431, 0, 1, 1,
0.8117662, 0.5091201, 1.608875, 0.8117647, 0, 1, 1,
0.8123791, -0.9327331, 2.991229, 0.8196079, 0, 1, 1,
0.8127422, 1.636402, 0.8870972, 0.8235294, 0, 1, 1,
0.8128319, 0.7964042, 0.3679868, 0.8313726, 0, 1, 1,
0.8129201, 2.088299, 0.8660964, 0.8352941, 0, 1, 1,
0.8131335, 0.5835063, 1.476515, 0.8431373, 0, 1, 1,
0.8131693, 1.03537, 2.21205, 0.8470588, 0, 1, 1,
0.8158011, 2.026295, 0.7596963, 0.854902, 0, 1, 1,
0.821053, 0.3954569, 2.551945, 0.8588235, 0, 1, 1,
0.8217999, 0.339328, 2.477102, 0.8666667, 0, 1, 1,
0.8271282, -0.3298629, 1.79576, 0.8705882, 0, 1, 1,
0.8301597, -1.899533, 3.156136, 0.8784314, 0, 1, 1,
0.8464522, -0.3768625, 3.339222, 0.8823529, 0, 1, 1,
0.8472758, 0.3415406, 0.8220335, 0.8901961, 0, 1, 1,
0.8501432, -0.5818986, 1.109846, 0.8941177, 0, 1, 1,
0.8558603, -0.7641181, 2.028532, 0.9019608, 0, 1, 1,
0.8609759, -0.9126949, 3.475765, 0.9098039, 0, 1, 1,
0.8689187, 2.201287, -0.4951053, 0.9137255, 0, 1, 1,
0.8707787, -0.3105099, 2.7258, 0.9215686, 0, 1, 1,
0.8924754, 0.8848202, -0.267382, 0.9254902, 0, 1, 1,
0.8928173, -0.1240523, 2.365509, 0.9333333, 0, 1, 1,
0.8988876, 0.01976033, 1.067631, 0.9372549, 0, 1, 1,
0.9001586, -1.053053, 1.283712, 0.945098, 0, 1, 1,
0.9007043, 1.647896, 1.86218, 0.9490196, 0, 1, 1,
0.9043353, -0.6002117, 2.322631, 0.9568627, 0, 1, 1,
0.9083163, -0.1471453, 0.6782297, 0.9607843, 0, 1, 1,
0.9106174, 0.3909033, 1.989882, 0.9686275, 0, 1, 1,
0.9132797, 0.467406, 2.240263, 0.972549, 0, 1, 1,
0.9225572, 1.336416, -0.8052249, 0.9803922, 0, 1, 1,
0.9245806, -1.481159, 3.495701, 0.9843137, 0, 1, 1,
0.9257853, -0.5678843, 1.772636, 0.9921569, 0, 1, 1,
0.9267247, 0.6123093, 1.300479, 0.9960784, 0, 1, 1,
0.9288188, -1.808675, 1.746682, 1, 0, 0.9960784, 1,
0.937826, -2.296968, 4.229732, 1, 0, 0.9882353, 1,
0.938382, -1.505846, 3.111241, 1, 0, 0.9843137, 1,
0.951004, 0.6424351, 1.290514, 1, 0, 0.9764706, 1,
0.9528523, 1.784075, -0.126141, 1, 0, 0.972549, 1,
0.9561173, 0.3701384, 1.079199, 1, 0, 0.9647059, 1,
0.9642174, -0.3530793, 1.40849, 1, 0, 0.9607843, 1,
0.9666604, 0.09686122, 2.543291, 1, 0, 0.9529412, 1,
0.9676518, -0.5631149, 1.731994, 1, 0, 0.9490196, 1,
0.9684441, -1.760788, 2.710466, 1, 0, 0.9411765, 1,
0.9702823, 0.3056741, 2.438564, 1, 0, 0.9372549, 1,
0.9785131, 0.5452395, 0.4782784, 1, 0, 0.9294118, 1,
0.98368, 0.4577479, 0.5423993, 1, 0, 0.9254902, 1,
0.9903751, 0.70238, 0.6003426, 1, 0, 0.9176471, 1,
0.9931231, -1.260695, 3.052021, 1, 0, 0.9137255, 1,
0.9931626, -0.5725761, 2.064636, 1, 0, 0.9058824, 1,
0.9969124, 0.4619235, 0.4771442, 1, 0, 0.9019608, 1,
0.997431, 1.521502, 0.4111098, 1, 0, 0.8941177, 1,
0.9979208, 1.165256, -0.4028207, 1, 0, 0.8862745, 1,
1.017173, 1.341466, 1.038097, 1, 0, 0.8823529, 1,
1.017509, -1.338426, 4.197124, 1, 0, 0.8745098, 1,
1.034006, 0.3091338, 1.16289, 1, 0, 0.8705882, 1,
1.040219, -0.3302274, 0.1244248, 1, 0, 0.8627451, 1,
1.042914, 1.000041, 1.358515, 1, 0, 0.8588235, 1,
1.050872, -0.6102217, 2.907951, 1, 0, 0.8509804, 1,
1.050897, -1.230478, 0.5095826, 1, 0, 0.8470588, 1,
1.051353, -0.3280761, 2.124641, 1, 0, 0.8392157, 1,
1.054564, -0.4865211, 3.134191, 1, 0, 0.8352941, 1,
1.056463, -0.6731384, 3.283026, 1, 0, 0.827451, 1,
1.061232, 0.1674737, 1.651129, 1, 0, 0.8235294, 1,
1.063199, -0.6447099, 3.343442, 1, 0, 0.8156863, 1,
1.074294, 0.06740645, -0.383746, 1, 0, 0.8117647, 1,
1.074933, 0.2599466, 2.256241, 1, 0, 0.8039216, 1,
1.075312, 0.02383791, 0.4237033, 1, 0, 0.7960784, 1,
1.082799, 1.569788, 0.5738645, 1, 0, 0.7921569, 1,
1.093355, 0.3168045, 1.832326, 1, 0, 0.7843137, 1,
1.100689, 0.6589902, 1.400201, 1, 0, 0.7803922, 1,
1.10905, -1.221652, 2.076133, 1, 0, 0.772549, 1,
1.112767, 1.16214, 0.2138189, 1, 0, 0.7686275, 1,
1.113695, 1.551252, 1.040563, 1, 0, 0.7607843, 1,
1.115385, 0.4546651, 0.6259004, 1, 0, 0.7568628, 1,
1.118841, 0.3512537, -0.1813602, 1, 0, 0.7490196, 1,
1.122644, -1.506721, 1.54151, 1, 0, 0.7450981, 1,
1.12291, -0.06746921, 3.330777, 1, 0, 0.7372549, 1,
1.125296, 0.4618344, 0.808871, 1, 0, 0.7333333, 1,
1.131865, 2.714226, 0.7712843, 1, 0, 0.7254902, 1,
1.136736, -0.5174092, 4.714186, 1, 0, 0.7215686, 1,
1.143813, -1.129757, 1.912657, 1, 0, 0.7137255, 1,
1.152267, -1.327345, 1.872741, 1, 0, 0.7098039, 1,
1.154579, -0.5268253, 2.294732, 1, 0, 0.7019608, 1,
1.156416, -0.3203188, -0.08820061, 1, 0, 0.6941177, 1,
1.15648, -3.260442, 3.552345, 1, 0, 0.6901961, 1,
1.156507, -1.492535, 3.382497, 1, 0, 0.682353, 1,
1.174197, 0.3000023, 1.131875, 1, 0, 0.6784314, 1,
1.177771, -0.2865257, 3.593862, 1, 0, 0.6705883, 1,
1.18011, -0.696754, 2.096415, 1, 0, 0.6666667, 1,
1.185895, 0.09991619, 1.407887, 1, 0, 0.6588235, 1,
1.188299, 0.2228616, 1.347895, 1, 0, 0.654902, 1,
1.194018, 0.5039605, 2.330194, 1, 0, 0.6470588, 1,
1.195456, -0.4090324, 2.490764, 1, 0, 0.6431373, 1,
1.208496, -0.8282274, -0.4937506, 1, 0, 0.6352941, 1,
1.210422, 0.3308285, 0.4070279, 1, 0, 0.6313726, 1,
1.213156, 1.475367, 0.3397649, 1, 0, 0.6235294, 1,
1.223751, 0.7959442, 2.544012, 1, 0, 0.6196079, 1,
1.24629, 0.07320829, 1.108777, 1, 0, 0.6117647, 1,
1.25143, 0.7190244, 0.4024518, 1, 0, 0.6078432, 1,
1.25623, 2.040066, 2.743249, 1, 0, 0.6, 1,
1.263853, -0.5436114, 1.343244, 1, 0, 0.5921569, 1,
1.272602, -1.269895, 2.19473, 1, 0, 0.5882353, 1,
1.278356, -0.5268539, 1.72357, 1, 0, 0.5803922, 1,
1.282066, 2.310931, -0.8968285, 1, 0, 0.5764706, 1,
1.292305, 1.244805, 2.384235, 1, 0, 0.5686275, 1,
1.300693, 1.128089, 0.6858647, 1, 0, 0.5647059, 1,
1.304201, -0.1316055, 1.142329, 1, 0, 0.5568628, 1,
1.310583, 0.6616281, 1.124867, 1, 0, 0.5529412, 1,
1.311898, 0.237153, 1.952972, 1, 0, 0.5450981, 1,
1.327287, 0.06487318, 2.360522, 1, 0, 0.5411765, 1,
1.347219, -0.8247007, 2.176632, 1, 0, 0.5333334, 1,
1.347783, 1.00276, 0.6174274, 1, 0, 0.5294118, 1,
1.348113, 0.8343729, 2.238218, 1, 0, 0.5215687, 1,
1.348299, 1.721379, 1.312029, 1, 0, 0.5176471, 1,
1.361464, 0.5364097, -1.049947, 1, 0, 0.509804, 1,
1.362381, 0.2589831, 2.290094, 1, 0, 0.5058824, 1,
1.377833, 1.349461, 0.1574383, 1, 0, 0.4980392, 1,
1.391575, -2.409468, 2.957728, 1, 0, 0.4901961, 1,
1.408449, -0.9000873, 2.136796, 1, 0, 0.4862745, 1,
1.411479, 0.1432715, 1.298259, 1, 0, 0.4784314, 1,
1.419757, 0.6372625, 0.6985757, 1, 0, 0.4745098, 1,
1.425814, -0.9284813, 0.8139858, 1, 0, 0.4666667, 1,
1.426834, 0.5395765, 1.663635, 1, 0, 0.4627451, 1,
1.427138, -0.4749558, 0.6402177, 1, 0, 0.454902, 1,
1.441052, -2.880397, 3.563138, 1, 0, 0.4509804, 1,
1.445882, 0.9939346, 2.250271, 1, 0, 0.4431373, 1,
1.45297, -0.475825, 2.507018, 1, 0, 0.4392157, 1,
1.453143, -1.668948, 1.516671, 1, 0, 0.4313726, 1,
1.473681, 0.05213417, 2.282504, 1, 0, 0.427451, 1,
1.474083, -0.3063344, 0.8481742, 1, 0, 0.4196078, 1,
1.474968, 1.993117, 0.8634121, 1, 0, 0.4156863, 1,
1.478055, 0.2709144, 1.635978, 1, 0, 0.4078431, 1,
1.482958, -1.251639, 0.6674986, 1, 0, 0.4039216, 1,
1.483806, 1.561864, 1.33232, 1, 0, 0.3960784, 1,
1.500177, 1.173341, 1.129188, 1, 0, 0.3882353, 1,
1.503547, 0.3981422, 0.1537555, 1, 0, 0.3843137, 1,
1.503623, 0.07211203, -0.155161, 1, 0, 0.3764706, 1,
1.506034, -0.6869474, 0.6244506, 1, 0, 0.372549, 1,
1.506419, 1.421157, -0.3899953, 1, 0, 0.3647059, 1,
1.508169, -0.882805, 2.426856, 1, 0, 0.3607843, 1,
1.524706, 1.357252, 2.196206, 1, 0, 0.3529412, 1,
1.524857, 0.2100607, 1.279042, 1, 0, 0.3490196, 1,
1.548839, 1.395278, 2.232135, 1, 0, 0.3411765, 1,
1.552597, -0.372239, 0.1335904, 1, 0, 0.3372549, 1,
1.553306, -0.907365, 3.431001, 1, 0, 0.3294118, 1,
1.55689, 0.7734826, 0.1638806, 1, 0, 0.3254902, 1,
1.582897, 1.914802, 1.748119, 1, 0, 0.3176471, 1,
1.583024, 0.4294946, -0.8636384, 1, 0, 0.3137255, 1,
1.587856, 1.053621, 1.244737, 1, 0, 0.3058824, 1,
1.590547, -0.626676, 1.685155, 1, 0, 0.2980392, 1,
1.59787, 0.1468294, 2.663692, 1, 0, 0.2941177, 1,
1.615024, 1.477136, 0.6178608, 1, 0, 0.2862745, 1,
1.621128, -0.4763661, 0.5101734, 1, 0, 0.282353, 1,
1.683779, 0.8457536, 1.144174, 1, 0, 0.2745098, 1,
1.694291, -0.3472033, 1.07278, 1, 0, 0.2705882, 1,
1.701244, -0.8136645, 1.669929, 1, 0, 0.2627451, 1,
1.707124, -1.836273, 0.5466533, 1, 0, 0.2588235, 1,
1.713361, -1.248222, 2.724314, 1, 0, 0.2509804, 1,
1.714716, -0.1017593, 3.388171, 1, 0, 0.2470588, 1,
1.716377, -0.0766359, 0.6076674, 1, 0, 0.2392157, 1,
1.740033, 1.291584, 1.613601, 1, 0, 0.2352941, 1,
1.746994, 0.5064083, 0.005151793, 1, 0, 0.227451, 1,
1.752116, -1.556331, 2.370331, 1, 0, 0.2235294, 1,
1.768983, -0.3251854, 1.934222, 1, 0, 0.2156863, 1,
1.781648, -0.07722088, 2.122363, 1, 0, 0.2117647, 1,
1.785735, 1.041799, 0.5942471, 1, 0, 0.2039216, 1,
1.788601, 0.2808042, 3.296178, 1, 0, 0.1960784, 1,
1.791037, -0.4652835, 1.982884, 1, 0, 0.1921569, 1,
1.794865, -0.2641247, 2.129557, 1, 0, 0.1843137, 1,
1.824057, -1.493685, 3.052117, 1, 0, 0.1803922, 1,
1.840171, 2.399531, 1.578048, 1, 0, 0.172549, 1,
1.853236, -0.7902405, 1.123781, 1, 0, 0.1686275, 1,
1.906977, -1.502469, 1.584148, 1, 0, 0.1607843, 1,
1.939855, 1.034218, 1.187503, 1, 0, 0.1568628, 1,
1.983443, -0.03502154, 1.119314, 1, 0, 0.1490196, 1,
2.011852, 1.285552, 1.435022, 1, 0, 0.145098, 1,
2.030481, -0.5680777, 2.618336, 1, 0, 0.1372549, 1,
2.05563, 0.5993091, 2.015131, 1, 0, 0.1333333, 1,
2.075916, -1.412967, -0.08319699, 1, 0, 0.1254902, 1,
2.112089, -0.7092111, 0.9480662, 1, 0, 0.1215686, 1,
2.141917, 0.2296625, 2.477012, 1, 0, 0.1137255, 1,
2.152872, -0.1836957, 0.7342044, 1, 0, 0.1098039, 1,
2.155683, 0.8445397, 1.963202, 1, 0, 0.1019608, 1,
2.156408, -0.2934374, 1.893954, 1, 0, 0.09411765, 1,
2.159678, -1.959887, 1.486313, 1, 0, 0.09019608, 1,
2.170661, 0.9070122, 0.2220665, 1, 0, 0.08235294, 1,
2.183002, -1.154148, 3.221252, 1, 0, 0.07843138, 1,
2.206524, 0.8090346, 2.396636, 1, 0, 0.07058824, 1,
2.208435, 1.241061, 1.27123, 1, 0, 0.06666667, 1,
2.244206, 1.378685, 1.118845, 1, 0, 0.05882353, 1,
2.251028, -0.1604236, 1.91583, 1, 0, 0.05490196, 1,
2.271788, -1.878004, 3.592968, 1, 0, 0.04705882, 1,
2.272084, -0.01712234, 0.2493214, 1, 0, 0.04313726, 1,
2.398504, -1.961454, 2.714708, 1, 0, 0.03529412, 1,
2.426848, 1.28376, 1.591437, 1, 0, 0.03137255, 1,
2.541551, 0.7083983, 2.372522, 1, 0, 0.02352941, 1,
2.59214, -0.5397189, -1.562046, 1, 0, 0.01960784, 1,
2.597594, 1.363315, 0.04157229, 1, 0, 0.01176471, 1,
2.653574, 0.5740566, 0.876792, 1, 0, 0.007843138, 1
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
-0.1821197, -4.444395, -7.832789, 0, -0.5, 0.5, 0.5,
-0.1821197, -4.444395, -7.832789, 1, -0.5, 0.5, 0.5,
-0.1821197, -4.444395, -7.832789, 1, 1.5, 0.5, 0.5,
-0.1821197, -4.444395, -7.832789, 0, 1.5, 0.5, 0.5
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
-3.979114, 0.232044, -7.832789, 0, -0.5, 0.5, 0.5,
-3.979114, 0.232044, -7.832789, 1, -0.5, 0.5, 0.5,
-3.979114, 0.232044, -7.832789, 1, 1.5, 0.5, 0.5,
-3.979114, 0.232044, -7.832789, 0, 1.5, 0.5, 0.5
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
-3.979114, -4.444395, -0.246964, 0, -0.5, 0.5, 0.5,
-3.979114, -4.444395, -0.246964, 1, -0.5, 0.5, 0.5,
-3.979114, -4.444395, -0.246964, 1, 1.5, 0.5, 0.5,
-3.979114, -4.444395, -0.246964, 0, 1.5, 0.5, 0.5
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
-3, -3.365216, -6.082214,
2, -3.365216, -6.082214,
-3, -3.365216, -6.082214,
-3, -3.54508, -6.373977,
-2, -3.365216, -6.082214,
-2, -3.54508, -6.373977,
-1, -3.365216, -6.082214,
-1, -3.54508, -6.373977,
0, -3.365216, -6.082214,
0, -3.54508, -6.373977,
1, -3.365216, -6.082214,
1, -3.54508, -6.373977,
2, -3.365216, -6.082214,
2, -3.54508, -6.373977
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
-3, -3.904806, -6.957501, 0, -0.5, 0.5, 0.5,
-3, -3.904806, -6.957501, 1, -0.5, 0.5, 0.5,
-3, -3.904806, -6.957501, 1, 1.5, 0.5, 0.5,
-3, -3.904806, -6.957501, 0, 1.5, 0.5, 0.5,
-2, -3.904806, -6.957501, 0, -0.5, 0.5, 0.5,
-2, -3.904806, -6.957501, 1, -0.5, 0.5, 0.5,
-2, -3.904806, -6.957501, 1, 1.5, 0.5, 0.5,
-2, -3.904806, -6.957501, 0, 1.5, 0.5, 0.5,
-1, -3.904806, -6.957501, 0, -0.5, 0.5, 0.5,
-1, -3.904806, -6.957501, 1, -0.5, 0.5, 0.5,
-1, -3.904806, -6.957501, 1, 1.5, 0.5, 0.5,
-1, -3.904806, -6.957501, 0, 1.5, 0.5, 0.5,
0, -3.904806, -6.957501, 0, -0.5, 0.5, 0.5,
0, -3.904806, -6.957501, 1, -0.5, 0.5, 0.5,
0, -3.904806, -6.957501, 1, 1.5, 0.5, 0.5,
0, -3.904806, -6.957501, 0, 1.5, 0.5, 0.5,
1, -3.904806, -6.957501, 0, -0.5, 0.5, 0.5,
1, -3.904806, -6.957501, 1, -0.5, 0.5, 0.5,
1, -3.904806, -6.957501, 1, 1.5, 0.5, 0.5,
1, -3.904806, -6.957501, 0, 1.5, 0.5, 0.5,
2, -3.904806, -6.957501, 0, -0.5, 0.5, 0.5,
2, -3.904806, -6.957501, 1, -0.5, 0.5, 0.5,
2, -3.904806, -6.957501, 1, 1.5, 0.5, 0.5,
2, -3.904806, -6.957501, 0, 1.5, 0.5, 0.5
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
-3.102885, -3, -6.082214,
-3.102885, 3, -6.082214,
-3.102885, -3, -6.082214,
-3.248923, -3, -6.373977,
-3.102885, -2, -6.082214,
-3.248923, -2, -6.373977,
-3.102885, -1, -6.082214,
-3.248923, -1, -6.373977,
-3.102885, 0, -6.082214,
-3.248923, 0, -6.373977,
-3.102885, 1, -6.082214,
-3.248923, 1, -6.373977,
-3.102885, 2, -6.082214,
-3.248923, 2, -6.373977,
-3.102885, 3, -6.082214,
-3.248923, 3, -6.373977
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
-3.540999, -3, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, -3, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, -3, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, -3, -6.957501, 0, 1.5, 0.5, 0.5,
-3.540999, -2, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, -2, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, -2, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, -2, -6.957501, 0, 1.5, 0.5, 0.5,
-3.540999, -1, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, -1, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, -1, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, -1, -6.957501, 0, 1.5, 0.5, 0.5,
-3.540999, 0, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, 0, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, 0, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, 0, -6.957501, 0, 1.5, 0.5, 0.5,
-3.540999, 1, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, 1, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, 1, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, 1, -6.957501, 0, 1.5, 0.5, 0.5,
-3.540999, 2, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, 2, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, 2, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, 2, -6.957501, 0, 1.5, 0.5, 0.5,
-3.540999, 3, -6.957501, 0, -0.5, 0.5, 0.5,
-3.540999, 3, -6.957501, 1, -0.5, 0.5, 0.5,
-3.540999, 3, -6.957501, 1, 1.5, 0.5, 0.5,
-3.540999, 3, -6.957501, 0, 1.5, 0.5, 0.5
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
-3.102885, -3.365216, -4,
-3.102885, -3.365216, 4,
-3.102885, -3.365216, -4,
-3.248923, -3.54508, -4,
-3.102885, -3.365216, -2,
-3.248923, -3.54508, -2,
-3.102885, -3.365216, 0,
-3.248923, -3.54508, 0,
-3.102885, -3.365216, 2,
-3.248923, -3.54508, 2,
-3.102885, -3.365216, 4,
-3.248923, -3.54508, 4
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
-3.540999, -3.904806, -4, 0, -0.5, 0.5, 0.5,
-3.540999, -3.904806, -4, 1, -0.5, 0.5, 0.5,
-3.540999, -3.904806, -4, 1, 1.5, 0.5, 0.5,
-3.540999, -3.904806, -4, 0, 1.5, 0.5, 0.5,
-3.540999, -3.904806, -2, 0, -0.5, 0.5, 0.5,
-3.540999, -3.904806, -2, 1, -0.5, 0.5, 0.5,
-3.540999, -3.904806, -2, 1, 1.5, 0.5, 0.5,
-3.540999, -3.904806, -2, 0, 1.5, 0.5, 0.5,
-3.540999, -3.904806, 0, 0, -0.5, 0.5, 0.5,
-3.540999, -3.904806, 0, 1, -0.5, 0.5, 0.5,
-3.540999, -3.904806, 0, 1, 1.5, 0.5, 0.5,
-3.540999, -3.904806, 0, 0, 1.5, 0.5, 0.5,
-3.540999, -3.904806, 2, 0, -0.5, 0.5, 0.5,
-3.540999, -3.904806, 2, 1, -0.5, 0.5, 0.5,
-3.540999, -3.904806, 2, 1, 1.5, 0.5, 0.5,
-3.540999, -3.904806, 2, 0, 1.5, 0.5, 0.5,
-3.540999, -3.904806, 4, 0, -0.5, 0.5, 0.5,
-3.540999, -3.904806, 4, 1, -0.5, 0.5, 0.5,
-3.540999, -3.904806, 4, 1, 1.5, 0.5, 0.5,
-3.540999, -3.904806, 4, 0, 1.5, 0.5, 0.5
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
-3.102885, -3.365216, -6.082214,
-3.102885, 3.829304, -6.082214,
-3.102885, -3.365216, 5.588286,
-3.102885, 3.829304, 5.588286,
-3.102885, -3.365216, -6.082214,
-3.102885, -3.365216, 5.588286,
-3.102885, 3.829304, -6.082214,
-3.102885, 3.829304, 5.588286,
-3.102885, -3.365216, -6.082214,
2.738645, -3.365216, -6.082214,
-3.102885, -3.365216, 5.588286,
2.738645, -3.365216, 5.588286,
-3.102885, 3.829304, -6.082214,
2.738645, 3.829304, -6.082214,
-3.102885, 3.829304, 5.588286,
2.738645, 3.829304, 5.588286,
2.738645, -3.365216, -6.082214,
2.738645, 3.829304, -6.082214,
2.738645, -3.365216, 5.588286,
2.738645, 3.829304, 5.588286,
2.738645, -3.365216, -6.082214,
2.738645, -3.365216, 5.588286,
2.738645, 3.829304, -6.082214,
2.738645, 3.829304, 5.588286
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
var radius = 7.957658;
var distance = 35.40452;
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
mvMatrix.translate( 0.1821197, -0.232044, 0.246964 );
mvMatrix.scale( 1.472898, 1.195907, 0.7372414 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.40452);
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
prolan<-read.table("prolan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prolan$V2
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
```

```r
y<-prolan$V3
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
```

```r
z<-prolan$V4
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
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
-3.017814, 0.4362815, -2.996754, 0, 0, 1, 1, 1,
-2.989456, 0.08665369, -1.658122, 1, 0, 0, 1, 1,
-2.770495, 2.344899, -0.7061325, 1, 0, 0, 1, 1,
-2.652543, 0.4992066, -2.489101, 1, 0, 0, 1, 1,
-2.638043, -1.025705, -2.561907, 1, 0, 0, 1, 1,
-2.535283, -0.1601436, -2.625543, 1, 0, 0, 1, 1,
-2.531995, 0.7312256, -2.290096, 0, 0, 0, 1, 1,
-2.495612, 1.505138, -0.6539992, 0, 0, 0, 1, 1,
-2.467546, -0.7435112, -1.202334, 0, 0, 0, 1, 1,
-2.424898, -0.8041482, -2.225198, 0, 0, 0, 1, 1,
-2.372717, -0.2924873, -0.5809255, 0, 0, 0, 1, 1,
-2.367652, 0.0214557, -1.736453, 0, 0, 0, 1, 1,
-2.363485, -1.506602, -1.473657, 0, 0, 0, 1, 1,
-2.346326, -0.4002764, -1.447812, 1, 1, 1, 1, 1,
-2.275057, -2.251564, -1.781349, 1, 1, 1, 1, 1,
-2.243645, 0.9760594, 1.43045, 1, 1, 1, 1, 1,
-2.237033, 0.6692916, -0.7604567, 1, 1, 1, 1, 1,
-2.225437, 0.2498078, -3.179078, 1, 1, 1, 1, 1,
-2.201484, -0.8361862, -2.495894, 1, 1, 1, 1, 1,
-2.179603, 0.1128627, -3.169976, 1, 1, 1, 1, 1,
-2.162615, -0.034795, -2.337177, 1, 1, 1, 1, 1,
-2.113323, 0.6626049, -1.613271, 1, 1, 1, 1, 1,
-2.067593, 0.00196656, -1.686699, 1, 1, 1, 1, 1,
-2.049797, -1.205048, -3.020515, 1, 1, 1, 1, 1,
-2.025139, -1.2163, -2.354222, 1, 1, 1, 1, 1,
-2.014246, -0.786779, -3.685012, 1, 1, 1, 1, 1,
-1.966943, -0.9761502, -3.005067, 1, 1, 1, 1, 1,
-1.948481, -0.283252, -1.352814, 1, 1, 1, 1, 1,
-1.934203, 0.439801, -2.392823, 0, 0, 1, 1, 1,
-1.90612, 0.5911759, -1.988161, 1, 0, 0, 1, 1,
-1.904819, 0.7014444, -1.392327, 1, 0, 0, 1, 1,
-1.875421, 0.5063219, -1.268627, 1, 0, 0, 1, 1,
-1.862725, 0.2071541, -1.300368, 1, 0, 0, 1, 1,
-1.861114, -0.1368893, -1.890228, 1, 0, 0, 1, 1,
-1.855912, -0.5740337, -2.604073, 0, 0, 0, 1, 1,
-1.854471, -2.105828, -2.295221, 0, 0, 0, 1, 1,
-1.842058, -2.366079, -3.662966, 0, 0, 0, 1, 1,
-1.823941, -1.204854, -2.103273, 0, 0, 0, 1, 1,
-1.811069, 0.9666691, -1.770976, 0, 0, 0, 1, 1,
-1.804929, -0.3040358, -1.427639, 0, 0, 0, 1, 1,
-1.771888, -0.4006194, -0.7387713, 0, 0, 0, 1, 1,
-1.767933, -0.4466105, -2.15864, 1, 1, 1, 1, 1,
-1.762383, -0.6984146, -2.792112, 1, 1, 1, 1, 1,
-1.760683, 1.186314, -1.500017, 1, 1, 1, 1, 1,
-1.750156, 1.515852, -0.5085832, 1, 1, 1, 1, 1,
-1.733971, 0.8585961, -2.567818, 1, 1, 1, 1, 1,
-1.732725, 0.2097935, -1.846493, 1, 1, 1, 1, 1,
-1.725217, 0.1958547, -0.6208335, 1, 1, 1, 1, 1,
-1.720815, -1.212241, -3.494868, 1, 1, 1, 1, 1,
-1.715283, 1.516934, -1.049439, 1, 1, 1, 1, 1,
-1.706055, -2.016403, -2.977064, 1, 1, 1, 1, 1,
-1.702771, -0.6464682, -1.283398, 1, 1, 1, 1, 1,
-1.666023, 2.238688, -1.928963, 1, 1, 1, 1, 1,
-1.664682, -2.018519, -3.090018, 1, 1, 1, 1, 1,
-1.649359, -1.037499, -2.304456, 1, 1, 1, 1, 1,
-1.642347, -0.2252073, -0.5148504, 1, 1, 1, 1, 1,
-1.63688, 1.343327, -1.680858, 0, 0, 1, 1, 1,
-1.635444, 1.490597, -0.3781471, 1, 0, 0, 1, 1,
-1.610813, -0.8056432, -1.96056, 1, 0, 0, 1, 1,
-1.602655, 0.2229848, -0.6676384, 1, 0, 0, 1, 1,
-1.601711, 0.1654553, 0.1939173, 1, 0, 0, 1, 1,
-1.587382, -1.626517, -2.264629, 1, 0, 0, 1, 1,
-1.58464, 0.341929, -0.9359236, 0, 0, 0, 1, 1,
-1.583531, 0.8136775, -2.282532, 0, 0, 0, 1, 1,
-1.581684, 0.05771243, -0.9650877, 0, 0, 0, 1, 1,
-1.566915, -0.2474858, -2.68919, 0, 0, 0, 1, 1,
-1.533219, -0.213349, -0.6801947, 0, 0, 0, 1, 1,
-1.522224, 1.14659, -0.1652792, 0, 0, 0, 1, 1,
-1.498555, 0.9902947, -0.5551685, 0, 0, 0, 1, 1,
-1.497611, 1.279069, -0.7158434, 1, 1, 1, 1, 1,
-1.486054, -0.7202536, -1.731706, 1, 1, 1, 1, 1,
-1.479969, -2.785607, -5.525515, 1, 1, 1, 1, 1,
-1.476043, 1.365504, -0.8432453, 1, 1, 1, 1, 1,
-1.456324, -0.6891109, -1.94526, 1, 1, 1, 1, 1,
-1.447894, -0.09896084, -2.52722, 1, 1, 1, 1, 1,
-1.439414, 0.1561847, -1.950039, 1, 1, 1, 1, 1,
-1.430444, -0.03938332, -1.800182, 1, 1, 1, 1, 1,
-1.424614, 0.9701896, -2.256577, 1, 1, 1, 1, 1,
-1.416022, -0.2183843, -3.123435, 1, 1, 1, 1, 1,
-1.412945, -1.115915, -2.497241, 1, 1, 1, 1, 1,
-1.406392, -0.4753304, -1.363286, 1, 1, 1, 1, 1,
-1.401384, -0.2628726, -2.351726, 1, 1, 1, 1, 1,
-1.400101, 1.96412, 0.7019303, 1, 1, 1, 1, 1,
-1.394804, -0.4928473, -0.4634532, 1, 1, 1, 1, 1,
-1.387814, 1.004141, 0.9766876, 0, 0, 1, 1, 1,
-1.382031, -0.1056201, -0.6363908, 1, 0, 0, 1, 1,
-1.372844, 0.1426932, -0.09058762, 1, 0, 0, 1, 1,
-1.356757, -1.372177, -0.6093123, 1, 0, 0, 1, 1,
-1.355577, 1.23652, -2.867421, 1, 0, 0, 1, 1,
-1.351333, 0.6820429, -1.293773, 1, 0, 0, 1, 1,
-1.339005, 0.5514062, -2.295514, 0, 0, 0, 1, 1,
-1.336706, 0.06180311, -2.764163, 0, 0, 0, 1, 1,
-1.335786, -0.08882159, -1.063391, 0, 0, 0, 1, 1,
-1.333752, -0.1621455, -0.9356365, 0, 0, 0, 1, 1,
-1.320737, 0.3289908, -1.591611, 0, 0, 0, 1, 1,
-1.317995, 0.980988, 0.6837271, 0, 0, 0, 1, 1,
-1.317176, -1.196517, -3.07612, 0, 0, 0, 1, 1,
-1.307365, -2.180661, -4.108917, 1, 1, 1, 1, 1,
-1.300782, 1.529895, -1.642645, 1, 1, 1, 1, 1,
-1.297678, -0.01073763, -2.68521, 1, 1, 1, 1, 1,
-1.297585, 0.3428316, -0.9341248, 1, 1, 1, 1, 1,
-1.291971, -1.069851, -2.191736, 1, 1, 1, 1, 1,
-1.29177, -0.5330619, -1.152464, 1, 1, 1, 1, 1,
-1.286519, -0.3721535, -1.049868, 1, 1, 1, 1, 1,
-1.282981, 0.7527418, -1.789372, 1, 1, 1, 1, 1,
-1.282619, -0.2213446, -0.2730742, 1, 1, 1, 1, 1,
-1.269042, -1.674577, -2.687594, 1, 1, 1, 1, 1,
-1.268754, -0.9561747, -1.474871, 1, 1, 1, 1, 1,
-1.260647, 0.4695408, -1.01738, 1, 1, 1, 1, 1,
-1.248815, -0.9583666, -3.420098, 1, 1, 1, 1, 1,
-1.242733, -0.3720649, -2.682113, 1, 1, 1, 1, 1,
-1.239191, -0.8647355, -3.012145, 1, 1, 1, 1, 1,
-1.236471, -0.3890382, -3.484012, 0, 0, 1, 1, 1,
-1.23622, -0.9084523, -3.2699, 1, 0, 0, 1, 1,
-1.232936, -0.5239312, -1.641694, 1, 0, 0, 1, 1,
-1.219044, 1.927003, 0.1747434, 1, 0, 0, 1, 1,
-1.204693, -0.6166102, -3.315766, 1, 0, 0, 1, 1,
-1.203121, 1.388734, -0.8462545, 1, 0, 0, 1, 1,
-1.195306, -0.1349107, -2.699007, 0, 0, 0, 1, 1,
-1.194791, -0.2725801, -1.869657, 0, 0, 0, 1, 1,
-1.193489, 0.008464074, -2.160523, 0, 0, 0, 1, 1,
-1.185725, 1.265307, -0.7163807, 0, 0, 0, 1, 1,
-1.184878, 0.3294946, 0.06256415, 0, 0, 0, 1, 1,
-1.174613, 0.1138061, -1.122755, 0, 0, 0, 1, 1,
-1.173172, -1.861051, -1.976711, 0, 0, 0, 1, 1,
-1.170574, 0.4545739, -1.27091, 1, 1, 1, 1, 1,
-1.153998, -0.4234143, -2.494362, 1, 1, 1, 1, 1,
-1.152786, -2.036712, -3.642011, 1, 1, 1, 1, 1,
-1.14865, -0.8848608, -2.531824, 1, 1, 1, 1, 1,
-1.129906, 0.7130517, 0.2383625, 1, 1, 1, 1, 1,
-1.122954, -0.7225646, -0.6990165, 1, 1, 1, 1, 1,
-1.120637, 1.284408, -0.264499, 1, 1, 1, 1, 1,
-1.116327, 0.07871006, -2.267866, 1, 1, 1, 1, 1,
-1.102699, -2.093338, -1.227523, 1, 1, 1, 1, 1,
-1.10075, 0.66998, -0.7213832, 1, 1, 1, 1, 1,
-1.098969, 0.126992, 0.04676586, 1, 1, 1, 1, 1,
-1.097232, 0.1837159, -1.653984, 1, 1, 1, 1, 1,
-1.094943, -0.77667, -3.591156, 1, 1, 1, 1, 1,
-1.094758, 0.3752068, -0.09078991, 1, 1, 1, 1, 1,
-1.093206, -0.7961719, -2.225446, 1, 1, 1, 1, 1,
-1.090451, -1.289417, -2.579912, 0, 0, 1, 1, 1,
-1.088657, 0.7341051, -1.365302, 1, 0, 0, 1, 1,
-1.08509, -0.160232, -0.3543414, 1, 0, 0, 1, 1,
-1.079837, -1.243875, -3.381471, 1, 0, 0, 1, 1,
-1.072965, 0.09154642, 0.4728279, 1, 0, 0, 1, 1,
-1.067953, 0.4560765, -1.735125, 1, 0, 0, 1, 1,
-1.063925, -0.3949603, -3.08239, 0, 0, 0, 1, 1,
-1.048386, 0.6096777, -0.1974804, 0, 0, 0, 1, 1,
-1.047149, 0.6056859, -0.2486925, 0, 0, 0, 1, 1,
-1.045227, 0.3338232, -1.155081, 0, 0, 0, 1, 1,
-1.035746, 3.72453, -1.239447, 0, 0, 0, 1, 1,
-1.024481, -1.140932, -3.447344, 0, 0, 0, 1, 1,
-1.020626, -0.2076936, -1.645409, 0, 0, 0, 1, 1,
-1.011709, 0.1626741, -1.597648, 1, 1, 1, 1, 1,
-0.9962462, 0.4330138, -1.562256, 1, 1, 1, 1, 1,
-0.9954394, 0.6968253, -0.8653643, 1, 1, 1, 1, 1,
-0.9867417, -0.9705252, -2.608835, 1, 1, 1, 1, 1,
-0.9809906, -1.197636, -2.281007, 1, 1, 1, 1, 1,
-0.9771958, 1.770695, 0.197192, 1, 1, 1, 1, 1,
-0.9707513, 2.228695, 1.336574, 1, 1, 1, 1, 1,
-0.9650521, 0.7660934, -0.3379659, 1, 1, 1, 1, 1,
-0.9534029, 1.353354, 0.233244, 1, 1, 1, 1, 1,
-0.9448487, 0.07026345, -1.687179, 1, 1, 1, 1, 1,
-0.9417301, 0.4047778, -1.067823, 1, 1, 1, 1, 1,
-0.9391201, 0.6828518, -2.181105, 1, 1, 1, 1, 1,
-0.938506, -0.4726868, -2.75751, 1, 1, 1, 1, 1,
-0.9370352, -0.7115026, -2.185036, 1, 1, 1, 1, 1,
-0.9370214, 0.7173715, -0.09909107, 1, 1, 1, 1, 1,
-0.9367127, -0.0383133, -3.362206, 0, 0, 1, 1, 1,
-0.9354288, 1.621187, -2.918914, 1, 0, 0, 1, 1,
-0.9344741, 1.647485, -0.6824835, 1, 0, 0, 1, 1,
-0.9305282, -0.4514927, 0.01226378, 1, 0, 0, 1, 1,
-0.9296256, -0.6737564, -2.125134, 1, 0, 0, 1, 1,
-0.917211, 1.431003, 0.1831508, 1, 0, 0, 1, 1,
-0.9148003, -0.2013644, -1.756863, 0, 0, 0, 1, 1,
-0.9123624, 0.3687656, -0.9738947, 0, 0, 0, 1, 1,
-0.9108421, 0.08012157, -0.2615434, 0, 0, 0, 1, 1,
-0.9046108, -0.8213086, -3.340904, 0, 0, 0, 1, 1,
-0.8983187, 0.3325554, -0.318561, 0, 0, 0, 1, 1,
-0.8976755, 0.09850196, -1.852545, 0, 0, 0, 1, 1,
-0.8973603, 0.1462285, -1.423873, 0, 0, 0, 1, 1,
-0.8947526, -0.4236363, -2.740307, 1, 1, 1, 1, 1,
-0.8916634, 0.9406098, 0.1831257, 1, 1, 1, 1, 1,
-0.8889208, 0.1237057, -1.532975, 1, 1, 1, 1, 1,
-0.8853984, -0.9755424, -3.036362, 1, 1, 1, 1, 1,
-0.8847409, -1.66831, -2.46051, 1, 1, 1, 1, 1,
-0.8817267, 0.1502125, -1.697376, 1, 1, 1, 1, 1,
-0.8801781, -1.138351, -0.9859465, 1, 1, 1, 1, 1,
-0.8775959, -0.335884, -1.739596, 1, 1, 1, 1, 1,
-0.8763072, 2.311273, 1.166819, 1, 1, 1, 1, 1,
-0.8683122, 1.362759, 0.9440339, 1, 1, 1, 1, 1,
-0.8591127, 0.51275, -0.6799725, 1, 1, 1, 1, 1,
-0.8586377, 0.4524152, 1.467865, 1, 1, 1, 1, 1,
-0.8574802, 1.008689, -1.134821, 1, 1, 1, 1, 1,
-0.8536696, -0.9619819, -4.235459, 1, 1, 1, 1, 1,
-0.8504654, 0.7592712, -1.346214, 1, 1, 1, 1, 1,
-0.8480273, -1.147731, -2.781195, 0, 0, 1, 1, 1,
-0.8428264, -0.5904353, -2.376631, 1, 0, 0, 1, 1,
-0.8428248, -0.294961, -2.742688, 1, 0, 0, 1, 1,
-0.839021, 0.002915831, -1.043568, 1, 0, 0, 1, 1,
-0.8311568, -0.9250748, -3.661472, 1, 0, 0, 1, 1,
-0.8310359, -0.08831628, -1.001777, 1, 0, 0, 1, 1,
-0.8292172, 0.7010418, -0.5855074, 0, 0, 0, 1, 1,
-0.8250951, -0.1971855, -3.239712, 0, 0, 0, 1, 1,
-0.8223593, 0.7041383, -0.313219, 0, 0, 0, 1, 1,
-0.8198686, 1.596033, 1.034111, 0, 0, 0, 1, 1,
-0.8150101, 0.5391809, 0.206235, 0, 0, 0, 1, 1,
-0.8144571, 1.773892, -2.203783, 0, 0, 0, 1, 1,
-0.8125102, 0.03301922, -0.4180377, 0, 0, 0, 1, 1,
-0.8096162, 0.243255, -0.5492005, 1, 1, 1, 1, 1,
-0.800944, -0.6367119, -1.041133, 1, 1, 1, 1, 1,
-0.8008105, -0.3766185, -2.079799, 1, 1, 1, 1, 1,
-0.7943491, -0.9534124, -2.400532, 1, 1, 1, 1, 1,
-0.7930416, -1.576082, -1.299406, 1, 1, 1, 1, 1,
-0.7847446, 0.5651807, -0.9157149, 1, 1, 1, 1, 1,
-0.7794224, -0.6973494, -3.074914, 1, 1, 1, 1, 1,
-0.7677841, -0.3234928, -2.432978, 1, 1, 1, 1, 1,
-0.7666061, -0.2452012, -1.695533, 1, 1, 1, 1, 1,
-0.7637695, 0.02922666, 0.868968, 1, 1, 1, 1, 1,
-0.7535192, 0.7453672, 0.2069789, 1, 1, 1, 1, 1,
-0.7521812, 0.06159311, -2.105853, 1, 1, 1, 1, 1,
-0.7487062, -0.04616714, -1.290579, 1, 1, 1, 1, 1,
-0.7465641, -0.7841602, -3.419779, 1, 1, 1, 1, 1,
-0.7455286, 0.1223037, -3.090979, 1, 1, 1, 1, 1,
-0.742788, 0.7632627, 0.6161978, 0, 0, 1, 1, 1,
-0.7399639, -0.9749728, -1.237624, 1, 0, 0, 1, 1,
-0.7348611, 0.2108973, -1.032628, 1, 0, 0, 1, 1,
-0.7310467, 0.4684013, -0.5469386, 1, 0, 0, 1, 1,
-0.7253348, -0.8536844, -2.146258, 1, 0, 0, 1, 1,
-0.7228361, 1.996054, -0.1971383, 1, 0, 0, 1, 1,
-0.7223316, 0.2293748, -1.265282, 0, 0, 0, 1, 1,
-0.7198882, 0.6550627, -0.3034554, 0, 0, 0, 1, 1,
-0.7172623, 0.6732778, -0.138796, 0, 0, 0, 1, 1,
-0.7085674, 0.5474568, -0.450847, 0, 0, 0, 1, 1,
-0.7017207, 1.258103, -1.09839, 0, 0, 0, 1, 1,
-0.6959535, 0.8926173, -0.4988976, 0, 0, 0, 1, 1,
-0.6936995, 0.327179, -1.10003, 0, 0, 0, 1, 1,
-0.6933767, 0.709825, -1.015314, 1, 1, 1, 1, 1,
-0.6916167, -1.190845, -2.203242, 1, 1, 1, 1, 1,
-0.6894721, 1.847453, 0.4899286, 1, 1, 1, 1, 1,
-0.6852913, 0.7081584, -0.03385262, 1, 1, 1, 1, 1,
-0.68104, 0.4541517, -1.733162, 1, 1, 1, 1, 1,
-0.6728779, 0.007772102, -1.170265, 1, 1, 1, 1, 1,
-0.6658037, 0.01276631, -1.48143, 1, 1, 1, 1, 1,
-0.6656986, -0.7665593, -3.605863, 1, 1, 1, 1, 1,
-0.6623418, -0.4448917, -1.743255, 1, 1, 1, 1, 1,
-0.6613736, -0.2082609, -1.562864, 1, 1, 1, 1, 1,
-0.6580018, 0.635815, 0.1363878, 1, 1, 1, 1, 1,
-0.6529054, 0.7742409, 0.1856317, 1, 1, 1, 1, 1,
-0.6507174, 0.6864355, -0.5815822, 1, 1, 1, 1, 1,
-0.6471995, -1.880202, -2.815211, 1, 1, 1, 1, 1,
-0.6445101, -1.235838, -2.696881, 1, 1, 1, 1, 1,
-0.6443719, 0.7123327, -1.109131, 0, 0, 1, 1, 1,
-0.6434293, 0.9065965, 0.8268377, 1, 0, 0, 1, 1,
-0.6376151, -0.7015277, -2.550882, 1, 0, 0, 1, 1,
-0.6317018, 0.8212662, -0.7937499, 1, 0, 0, 1, 1,
-0.6250203, 1.665873, 0.6374873, 1, 0, 0, 1, 1,
-0.622043, -0.03741937, -1.790845, 1, 0, 0, 1, 1,
-0.6206614, -0.4797908, -3.868344, 0, 0, 0, 1, 1,
-0.6189862, -0.9305266, -3.209484, 0, 0, 0, 1, 1,
-0.6167526, 0.9473026, -0.8122306, 0, 0, 0, 1, 1,
-0.6152598, 1.69672, 0.2348212, 0, 0, 0, 1, 1,
-0.6125263, 1.333804, -0.5285908, 0, 0, 0, 1, 1,
-0.6076289, 0.331488, -0.9071401, 0, 0, 0, 1, 1,
-0.6042788, -1.06198, -1.255188, 0, 0, 0, 1, 1,
-0.6018788, -1.035516, -2.003008, 1, 1, 1, 1, 1,
-0.6008377, -0.1619263, -4.124846, 1, 1, 1, 1, 1,
-0.5965317, 1.490081, 0.1648447, 1, 1, 1, 1, 1,
-0.5953476, -0.6467857, -2.333367, 1, 1, 1, 1, 1,
-0.5928535, 0.3520564, -0.3123225, 1, 1, 1, 1, 1,
-0.5840009, -0.7337213, -1.214049, 1, 1, 1, 1, 1,
-0.5813743, 0.2113193, -1.602032, 1, 1, 1, 1, 1,
-0.5780398, -0.6574993, -0.08342932, 1, 1, 1, 1, 1,
-0.5702811, 0.008067103, -3.008987, 1, 1, 1, 1, 1,
-0.5694555, -1.549294, -2.609876, 1, 1, 1, 1, 1,
-0.5574802, -1.047344, -3.233106, 1, 1, 1, 1, 1,
-0.5571949, 0.9215785, -1.344578, 1, 1, 1, 1, 1,
-0.5548844, -0.1565934, -2.755865, 1, 1, 1, 1, 1,
-0.5520071, 0.6606523, -1.657661, 1, 1, 1, 1, 1,
-0.5510387, 0.6562148, -1.362689, 1, 1, 1, 1, 1,
-0.550593, 0.234892, -1.254528, 0, 0, 1, 1, 1,
-0.550202, 0.4712116, -0.7392969, 1, 0, 0, 1, 1,
-0.5440788, 0.3511463, -0.9596139, 1, 0, 0, 1, 1,
-0.5406584, -1.330163, -3.76138, 1, 0, 0, 1, 1,
-0.5403462, -1.141605, -4.381714, 1, 0, 0, 1, 1,
-0.5397904, -0.2717471, -1.630887, 1, 0, 0, 1, 1,
-0.5387938, -1.458739, -1.303659, 0, 0, 0, 1, 1,
-0.536925, -0.05825329, -1.792139, 0, 0, 0, 1, 1,
-0.5353953, 0.9432981, 1.138814, 0, 0, 0, 1, 1,
-0.5286235, -0.2352727, -0.7156267, 0, 0, 0, 1, 1,
-0.5280933, -1.947567, -3.727197, 0, 0, 0, 1, 1,
-0.5235226, 1.663976, -1.142967, 0, 0, 0, 1, 1,
-0.5211039, 0.3424572, 0.401797, 0, 0, 0, 1, 1,
-0.5199988, -0.1677902, -0.1925265, 1, 1, 1, 1, 1,
-0.5176229, 1.556442, 0.8005493, 1, 1, 1, 1, 1,
-0.5160524, 0.4083824, -1.067693, 1, 1, 1, 1, 1,
-0.5139881, -1.028948, -3.422795, 1, 1, 1, 1, 1,
-0.5091263, -0.5257122, -1.514401, 1, 1, 1, 1, 1,
-0.5089819, 0.1824019, -1.403471, 1, 1, 1, 1, 1,
-0.5083744, 0.1013171, -1.428557, 1, 1, 1, 1, 1,
-0.5076838, -2.608127, -5.051375, 1, 1, 1, 1, 1,
-0.5024931, -1.162876, -3.420869, 1, 1, 1, 1, 1,
-0.4997004, 1.212259, 0.7740359, 1, 1, 1, 1, 1,
-0.498263, 2.031016, -0.3446129, 1, 1, 1, 1, 1,
-0.4925168, 1.582866, -1.44778, 1, 1, 1, 1, 1,
-0.4887861, 0.6267038, -0.3010257, 1, 1, 1, 1, 1,
-0.4885274, 0.7074097, -0.04141379, 1, 1, 1, 1, 1,
-0.4862152, -1.555909, -4.305821, 1, 1, 1, 1, 1,
-0.4851888, -0.2510155, -1.295072, 0, 0, 1, 1, 1,
-0.4808465, 1.615598, -1.522455, 1, 0, 0, 1, 1,
-0.4778157, 0.7532348, -1.102367, 1, 0, 0, 1, 1,
-0.4756487, 1.974374, 0.3500951, 1, 0, 0, 1, 1,
-0.4746499, -0.0566485, -2.172777, 1, 0, 0, 1, 1,
-0.4719812, 0.3540068, -0.754601, 1, 0, 0, 1, 1,
-0.466804, 1.18069, 0.1379816, 0, 0, 0, 1, 1,
-0.4656641, 1.359981, -2.345021, 0, 0, 0, 1, 1,
-0.465494, -0.3262217, -2.864036, 0, 0, 0, 1, 1,
-0.464539, -0.2901702, -1.129327, 0, 0, 0, 1, 1,
-0.4617333, 0.7427489, -1.878623, 0, 0, 0, 1, 1,
-0.4616791, -1.558824, -3.64111, 0, 0, 0, 1, 1,
-0.4573895, 0.3232316, -1.041974, 0, 0, 0, 1, 1,
-0.4563537, -1.394161, -2.627778, 1, 1, 1, 1, 1,
-0.4540381, 0.3960131, -2.244018, 1, 1, 1, 1, 1,
-0.4507636, -0.9879892, -2.117866, 1, 1, 1, 1, 1,
-0.450533, -2.025285, -2.919551, 1, 1, 1, 1, 1,
-0.4497307, 0.07111558, -2.26703, 1, 1, 1, 1, 1,
-0.4482422, -0.1491211, -2.358584, 1, 1, 1, 1, 1,
-0.4475167, 0.8605842, -0.01569518, 1, 1, 1, 1, 1,
-0.447412, -1.772984, -3.314666, 1, 1, 1, 1, 1,
-0.446669, -0.3322583, -0.7326234, 1, 1, 1, 1, 1,
-0.4450433, 0.7536151, -1.386625, 1, 1, 1, 1, 1,
-0.4448394, -0.4708258, -1.277847, 1, 1, 1, 1, 1,
-0.4435579, 0.3405438, -0.8678433, 1, 1, 1, 1, 1,
-0.440946, -1.554947, -4.551893, 1, 1, 1, 1, 1,
-0.4406846, -0.3291362, -2.396122, 1, 1, 1, 1, 1,
-0.4396218, -1.132238, -2.813282, 1, 1, 1, 1, 1,
-0.4390635, -0.316988, -1.688196, 0, 0, 1, 1, 1,
-0.4383438, -0.1103696, -0.04373631, 1, 0, 0, 1, 1,
-0.434562, 0.06407267, 0.04476424, 1, 0, 0, 1, 1,
-0.4310075, 0.5600528, 0.07822126, 1, 0, 0, 1, 1,
-0.4305443, -0.5821459, -1.69875, 1, 0, 0, 1, 1,
-0.4292614, 1.518175, 0.06861876, 1, 0, 0, 1, 1,
-0.4256216, -0.2800243, -0.3809344, 0, 0, 0, 1, 1,
-0.4247605, 0.9917713, 1.288688, 0, 0, 0, 1, 1,
-0.4245057, -0.7664486, -0.7380432, 0, 0, 0, 1, 1,
-0.4196957, 1.006548, -0.3537293, 0, 0, 0, 1, 1,
-0.4179474, 0.9938963, 0.06160592, 0, 0, 0, 1, 1,
-0.4149848, -0.2064605, -1.65492, 0, 0, 0, 1, 1,
-0.4147962, -0.5028346, -3.387792, 0, 0, 0, 1, 1,
-0.4091359, -0.3522023, -1.552645, 1, 1, 1, 1, 1,
-0.4086793, -0.5945966, -1.485049, 1, 1, 1, 1, 1,
-0.4038703, -1.521188, -3.362632, 1, 1, 1, 1, 1,
-0.4030129, 0.6955183, 1.507648, 1, 1, 1, 1, 1,
-0.4028367, -0.02701774, -1.329991, 1, 1, 1, 1, 1,
-0.4013105, 0.7770716, -0.1331268, 1, 1, 1, 1, 1,
-0.4008522, 0.7158616, 0.1356066, 1, 1, 1, 1, 1,
-0.3960038, -0.2910327, -1.654133, 1, 1, 1, 1, 1,
-0.3959147, -0.20449, -3.390661, 1, 1, 1, 1, 1,
-0.3895452, 2.238047, 0.3725569, 1, 1, 1, 1, 1,
-0.3868726, -0.1430971, -2.146297, 1, 1, 1, 1, 1,
-0.3867274, -1.84563, -1.843985, 1, 1, 1, 1, 1,
-0.3865227, -0.03091365, -2.27197, 1, 1, 1, 1, 1,
-0.3840588, 0.4531549, -1.802867, 1, 1, 1, 1, 1,
-0.3805856, -2.291162, -2.944616, 1, 1, 1, 1, 1,
-0.3795371, -0.318937, -2.173279, 0, 0, 1, 1, 1,
-0.3793463, 0.03135602, -0.3490343, 1, 0, 0, 1, 1,
-0.3751366, -2.226301, -2.966964, 1, 0, 0, 1, 1,
-0.3737982, 2.051253, 0.3041382, 1, 0, 0, 1, 1,
-0.3726284, 0.8189433, 0.00484133, 1, 0, 0, 1, 1,
-0.3713521, 0.5240527, -1.666153, 1, 0, 0, 1, 1,
-0.3706755, -0.9054123, -3.602646, 0, 0, 0, 1, 1,
-0.3659696, -0.9020193, -3.093938, 0, 0, 0, 1, 1,
-0.3607625, -0.3820318, -3.207862, 0, 0, 0, 1, 1,
-0.3597401, 1.020752, -1.185349, 0, 0, 0, 1, 1,
-0.3594981, -1.107456, -2.803217, 0, 0, 0, 1, 1,
-0.3587423, -1.917255, -1.792496, 0, 0, 0, 1, 1,
-0.3582949, -1.877504, -2.855421, 0, 0, 0, 1, 1,
-0.3553883, 1.016048, 0.3077086, 1, 1, 1, 1, 1,
-0.354876, -0.6027529, -0.6968523, 1, 1, 1, 1, 1,
-0.3505942, 1.418556, -0.1619688, 1, 1, 1, 1, 1,
-0.3498538, 1.45103, 0.05877721, 1, 1, 1, 1, 1,
-0.3465849, -0.4565097, -3.193631, 1, 1, 1, 1, 1,
-0.3443103, 0.1648722, -0.8574231, 1, 1, 1, 1, 1,
-0.3441314, -0.8292502, -2.800668, 1, 1, 1, 1, 1,
-0.3419943, -0.1229202, -2.891282, 1, 1, 1, 1, 1,
-0.3401524, -0.1062166, -1.152356, 1, 1, 1, 1, 1,
-0.3399585, 0.9345054, -0.05514206, 1, 1, 1, 1, 1,
-0.3364354, -0.9912721, -3.315892, 1, 1, 1, 1, 1,
-0.335285, -1.263546, -2.476456, 1, 1, 1, 1, 1,
-0.3347954, -1.063892, -3.95428, 1, 1, 1, 1, 1,
-0.3333073, -1.733725, -2.670027, 1, 1, 1, 1, 1,
-0.3286204, -0.8263916, -3.804326, 1, 1, 1, 1, 1,
-0.3280554, 0.6293892, -1.171377, 0, 0, 1, 1, 1,
-0.3277788, 0.9169589, -0.3037088, 1, 0, 0, 1, 1,
-0.3255489, 0.1639197, -1.667391, 1, 0, 0, 1, 1,
-0.3217038, 0.2839877, 2.024585, 1, 0, 0, 1, 1,
-0.3192854, -1.820657, -2.957772, 1, 0, 0, 1, 1,
-0.3189799, 0.2169326, -1.781377, 1, 0, 0, 1, 1,
-0.3171889, 0.4448498, -0.5966096, 0, 0, 0, 1, 1,
-0.3131722, -0.336393, -2.076106, 0, 0, 0, 1, 1,
-0.3107437, -0.6902572, -3.256935, 0, 0, 0, 1, 1,
-0.3040974, 0.2482074, -1.974988, 0, 0, 0, 1, 1,
-0.2986247, -0.5962938, -2.969113, 0, 0, 0, 1, 1,
-0.2933674, -1.46214, -2.862254, 0, 0, 0, 1, 1,
-0.2896462, -0.6812853, -1.633029, 0, 0, 0, 1, 1,
-0.2882086, -1.579375, -3.631331, 1, 1, 1, 1, 1,
-0.2857453, 0.1169917, -2.860164, 1, 1, 1, 1, 1,
-0.282889, 0.1391847, -0.4529032, 1, 1, 1, 1, 1,
-0.2828379, -0.9057999, -3.033322, 1, 1, 1, 1, 1,
-0.2819052, -0.854613, -2.856881, 1, 1, 1, 1, 1,
-0.278282, 0.5548186, -0.9829726, 1, 1, 1, 1, 1,
-0.2746214, -0.5567397, -2.800147, 1, 1, 1, 1, 1,
-0.2738648, 0.845774, -1.012035, 1, 1, 1, 1, 1,
-0.2706076, 2.065222, 0.1016389, 1, 1, 1, 1, 1,
-0.2661512, 0.77729, -0.8292378, 1, 1, 1, 1, 1,
-0.2618344, -1.250121, -2.055822, 1, 1, 1, 1, 1,
-0.2594372, -0.6334968, -3.708047, 1, 1, 1, 1, 1,
-0.2570236, 0.204638, -0.9399216, 1, 1, 1, 1, 1,
-0.2504714, -0.6397576, -4.503892, 1, 1, 1, 1, 1,
-0.2462763, -0.8632197, -3.196644, 1, 1, 1, 1, 1,
-0.241659, -0.6829831, -1.914637, 0, 0, 1, 1, 1,
-0.2403976, 0.3739907, -0.9241577, 1, 0, 0, 1, 1,
-0.2386098, 0.05953708, -1.102897, 1, 0, 0, 1, 1,
-0.2371299, 0.1025964, -1.432675, 1, 0, 0, 1, 1,
-0.2298677, 0.7859768, 1.339029, 1, 0, 0, 1, 1,
-0.2277284, 0.1879985, -1.570476, 1, 0, 0, 1, 1,
-0.2276967, -1.434468, -1.526827, 0, 0, 0, 1, 1,
-0.2241628, -0.3186414, -1.264505, 0, 0, 0, 1, 1,
-0.2184714, 1.163308, 1.377074, 0, 0, 0, 1, 1,
-0.2154361, 0.5039962, -0.7128513, 0, 0, 0, 1, 1,
-0.2151558, 0.3417763, -1.278061, 0, 0, 0, 1, 1,
-0.2124901, 0.3247563, -1.395827, 0, 0, 0, 1, 1,
-0.2110571, -0.3580448, -3.051241, 0, 0, 0, 1, 1,
-0.2075226, 0.4406454, -2.697098, 1, 1, 1, 1, 1,
-0.205753, -0.5556662, -2.194355, 1, 1, 1, 1, 1,
-0.204998, -0.9267147, -3.108788, 1, 1, 1, 1, 1,
-0.2040721, 0.1614171, -1.942615, 1, 1, 1, 1, 1,
-0.2005101, -0.4427574, -1.689677, 1, 1, 1, 1, 1,
-0.1976657, 0.3871545, 0.202399, 1, 1, 1, 1, 1,
-0.1919737, 1.407939, 0.7549218, 1, 1, 1, 1, 1,
-0.1918318, -1.122685, -2.613173, 1, 1, 1, 1, 1,
-0.1908453, -1.805956, -0.8397405, 1, 1, 1, 1, 1,
-0.1897232, 1.061497, -0.004458358, 1, 1, 1, 1, 1,
-0.1856873, 0.9473135, -0.8877945, 1, 1, 1, 1, 1,
-0.1855972, 0.2444278, -0.545664, 1, 1, 1, 1, 1,
-0.185073, -0.5578482, -2.240767, 1, 1, 1, 1, 1,
-0.1706083, -1.047713, -3.488071, 1, 1, 1, 1, 1,
-0.1693562, 0.3954034, 1.001372, 1, 1, 1, 1, 1,
-0.1677226, -0.3626919, -0.8964103, 0, 0, 1, 1, 1,
-0.1675467, 0.1534655, -0.7904955, 1, 0, 0, 1, 1,
-0.1673741, 1.32309, -2.055799, 1, 0, 0, 1, 1,
-0.1667125, 0.1474514, 0.1386336, 1, 0, 0, 1, 1,
-0.1630089, 0.3759763, -1.019226, 1, 0, 0, 1, 1,
-0.1589808, 1.46347, -0.2579533, 1, 0, 0, 1, 1,
-0.1585514, -0.4501011, -3.798894, 0, 0, 0, 1, 1,
-0.1580064, 1.418668, 0.5216984, 0, 0, 0, 1, 1,
-0.1579817, -0.8080191, -1.874158, 0, 0, 0, 1, 1,
-0.1575712, -0.3497815, -2.647428, 0, 0, 0, 1, 1,
-0.1574171, -1.017277, -2.519514, 0, 0, 0, 1, 1,
-0.1568241, -0.9068045, -5.912255, 0, 0, 0, 1, 1,
-0.1549188, 1.194718, -0.06658766, 0, 0, 0, 1, 1,
-0.1518369, 0.8759888, -0.3763475, 1, 1, 1, 1, 1,
-0.1488224, 0.3073962, -0.2002991, 1, 1, 1, 1, 1,
-0.1481841, 1.561133, 0.003565295, 1, 1, 1, 1, 1,
-0.1426842, -1.33608, -2.910547, 1, 1, 1, 1, 1,
-0.141676, 0.8048531, -2.481703, 1, 1, 1, 1, 1,
-0.1402585, 1.069746, -0.8616643, 1, 1, 1, 1, 1,
-0.1363533, 0.03145086, -1.296792, 1, 1, 1, 1, 1,
-0.1353227, -1.789537, -4.555401, 1, 1, 1, 1, 1,
-0.1343701, -0.3647186, -3.319766, 1, 1, 1, 1, 1,
-0.1339724, -1.330507, -1.700603, 1, 1, 1, 1, 1,
-0.1329881, -1.345427, -1.875479, 1, 1, 1, 1, 1,
-0.1301244, -0.6775917, -2.108027, 1, 1, 1, 1, 1,
-0.1298839, -1.100207, -1.893764, 1, 1, 1, 1, 1,
-0.1296817, 0.6413861, -1.558389, 1, 1, 1, 1, 1,
-0.1292516, 0.4566538, 2.606838, 1, 1, 1, 1, 1,
-0.1279638, -0.7110642, -1.820704, 0, 0, 1, 1, 1,
-0.1276599, 0.3484608, -1.506459, 1, 0, 0, 1, 1,
-0.1269034, -0.3604077, -3.128577, 1, 0, 0, 1, 1,
-0.1253288, 0.9630685, 0.7856233, 1, 0, 0, 1, 1,
-0.122593, 0.8126409, 0.430444, 1, 0, 0, 1, 1,
-0.1147707, -0.3272665, -1.525317, 1, 0, 0, 1, 1,
-0.1118101, 0.6481547, 0.3345611, 0, 0, 0, 1, 1,
-0.1107941, -0.4300809, -2.066024, 0, 0, 0, 1, 1,
-0.0923862, -1.580403, -3.224378, 0, 0, 0, 1, 1,
-0.08929105, 0.2730066, -0.5704473, 0, 0, 0, 1, 1,
-0.08916799, 1.6383, 1.329063, 0, 0, 0, 1, 1,
-0.08579177, -0.04623293, -1.704309, 0, 0, 0, 1, 1,
-0.08366302, 0.117942, -1.601906, 0, 0, 0, 1, 1,
-0.08091737, 0.4402352, 0.179045, 1, 1, 1, 1, 1,
-0.08072371, 0.7628028, 0.5557439, 1, 1, 1, 1, 1,
-0.0802561, 0.9503462, 1.983033, 1, 1, 1, 1, 1,
-0.07866227, -0.2996122, -4.379546, 1, 1, 1, 1, 1,
-0.07724679, -0.740301, -3.943829, 1, 1, 1, 1, 1,
-0.07472275, 1.155557, -0.2948629, 1, 1, 1, 1, 1,
-0.07246151, -0.6917467, -3.167389, 1, 1, 1, 1, 1,
-0.07169964, 0.1297048, 0.2279196, 1, 1, 1, 1, 1,
-0.06592481, 0.1306548, -2.569823, 1, 1, 1, 1, 1,
-0.06515333, -0.2449877, -1.250239, 1, 1, 1, 1, 1,
-0.063395, -1.513487, -4.366292, 1, 1, 1, 1, 1,
-0.06226229, 0.1498652, -0.08569717, 1, 1, 1, 1, 1,
-0.0614629, -0.5860159, -4.466846, 1, 1, 1, 1, 1,
-0.05837968, -0.5360801, -2.998554, 1, 1, 1, 1, 1,
-0.05508957, 0.8411008, 1.087377, 1, 1, 1, 1, 1,
-0.0541551, 0.127647, 0.7006543, 0, 0, 1, 1, 1,
-0.05316935, 0.5320673, 1.685108, 1, 0, 0, 1, 1,
-0.05085329, -0.01480156, -2.352171, 1, 0, 0, 1, 1,
-0.04933266, 0.30905, 2.003127, 1, 0, 0, 1, 1,
-0.04498537, -2.345883, -2.105807, 1, 0, 0, 1, 1,
-0.04337686, 0.7128412, -1.919002, 1, 0, 0, 1, 1,
-0.04282332, -0.6429817, -4.108639, 0, 0, 0, 1, 1,
-0.04007658, -0.1161906, -1.994021, 0, 0, 0, 1, 1,
-0.03784082, -0.3379039, -2.344548, 0, 0, 0, 1, 1,
-0.03615962, -0.355671, -4.583228, 0, 0, 0, 1, 1,
-0.03557752, 0.6217626, 0.03005674, 0, 0, 0, 1, 1,
-0.03510852, -1.883205, -4.996232, 0, 0, 0, 1, 1,
-0.03345618, -0.1017342, -2.01937, 0, 0, 0, 1, 1,
-0.03285137, -0.3970015, -3.619493, 1, 1, 1, 1, 1,
-0.03163445, -0.006347968, -3.446138, 1, 1, 1, 1, 1,
-0.0313934, -1.298459, -2.251657, 1, 1, 1, 1, 1,
-0.03039079, -0.9939947, -3.084553, 1, 1, 1, 1, 1,
-0.02647443, -1.448547, -3.695233, 1, 1, 1, 1, 1,
-0.02502245, -0.370823, -2.269992, 1, 1, 1, 1, 1,
-0.02301649, 0.9609383, 0.1177229, 1, 1, 1, 1, 1,
-0.01754294, 1.253435, 0.7565708, 1, 1, 1, 1, 1,
-0.01750455, -0.9758369, -4.324922, 1, 1, 1, 1, 1,
-0.01546961, -0.573927, -4.561737, 1, 1, 1, 1, 1,
-0.01505996, 0.3142608, 1.479491, 1, 1, 1, 1, 1,
-0.0135268, -0.08464382, -2.913682, 1, 1, 1, 1, 1,
-0.007025384, -0.3298816, -2.576865, 1, 1, 1, 1, 1,
-0.006548211, -1.346082, -2.899529, 1, 1, 1, 1, 1,
-0.002944303, 0.9602553, 0.2309792, 1, 1, 1, 1, 1,
-0.001271636, -0.3836813, -2.013502, 0, 0, 1, 1, 1,
0.002351937, -0.882966, 2.821121, 1, 0, 0, 1, 1,
0.007416249, -1.959876, 2.48961, 1, 0, 0, 1, 1,
0.009553216, -1.907607, 1.927671, 1, 0, 0, 1, 1,
0.01322315, 0.02196935, 0.7741409, 1, 0, 0, 1, 1,
0.01956114, -0.6441148, 3.1889, 1, 0, 0, 1, 1,
0.02038527, -1.219061, 2.659638, 0, 0, 0, 1, 1,
0.02125746, -1.465214, 3.546325, 0, 0, 0, 1, 1,
0.02425483, 0.03667149, 0.2618487, 0, 0, 0, 1, 1,
0.02625749, 2.217094, -1.321772, 0, 0, 0, 1, 1,
0.03140244, -0.6504969, 5.035282, 0, 0, 0, 1, 1,
0.03226485, 1.088091, 1.571595, 0, 0, 0, 1, 1,
0.04057902, -1.959449, 4.623372, 0, 0, 0, 1, 1,
0.04205379, -0.01184411, 0.9144965, 1, 1, 1, 1, 1,
0.04770092, -0.2695896, 2.387, 1, 1, 1, 1, 1,
0.05035959, -0.07984506, 3.045973, 1, 1, 1, 1, 1,
0.0550707, -1.081776, 4.053194, 1, 1, 1, 1, 1,
0.05573367, 0.8403569, -1.167553, 1, 1, 1, 1, 1,
0.059514, 0.4088055, 2.116197, 1, 1, 1, 1, 1,
0.06386712, -1.999022, 3.718106, 1, 1, 1, 1, 1,
0.06684401, 0.7806985, 1.361196, 1, 1, 1, 1, 1,
0.06907299, -0.1382654, 3.236639, 1, 1, 1, 1, 1,
0.07073972, -0.5498465, 3.02306, 1, 1, 1, 1, 1,
0.07237812, -0.6969618, 4.240899, 1, 1, 1, 1, 1,
0.07532142, -1.608129, 2.027702, 1, 1, 1, 1, 1,
0.07907823, 1.583261, -0.2154041, 1, 1, 1, 1, 1,
0.07974074, 1.540623, 0.6835025, 1, 1, 1, 1, 1,
0.0797674, 0.04065422, 2.305834, 1, 1, 1, 1, 1,
0.08297653, -0.03627123, 1.869105, 0, 0, 1, 1, 1,
0.08363672, -1.181837, 3.813073, 1, 0, 0, 1, 1,
0.08477376, -0.7642784, 2.870229, 1, 0, 0, 1, 1,
0.0848074, 0.6799349, 0.5779863, 1, 0, 0, 1, 1,
0.08548333, 0.6463283, -0.2399142, 1, 0, 0, 1, 1,
0.08651295, -0.6601896, 2.622027, 1, 0, 0, 1, 1,
0.08753296, 0.6654469, -1.004212, 0, 0, 0, 1, 1,
0.08958893, -0.6819444, 4.072251, 0, 0, 0, 1, 1,
0.09385628, 0.7547561, -1.073968, 0, 0, 0, 1, 1,
0.0946982, 1.520246, -0.6987058, 0, 0, 0, 1, 1,
0.09887858, -1.040973, 3.925194, 0, 0, 0, 1, 1,
0.09954426, 0.03818927, 0.4848819, 0, 0, 0, 1, 1,
0.1013209, 0.1232796, 1.0518, 0, 0, 0, 1, 1,
0.1078996, -0.2499916, 2.69085, 1, 1, 1, 1, 1,
0.1086726, -0.1638187, 2.272146, 1, 1, 1, 1, 1,
0.1093902, 1.452306, 2.013187, 1, 1, 1, 1, 1,
0.1095609, 1.366487, -0.5053251, 1, 1, 1, 1, 1,
0.1110545, -0.5318671, 2.488975, 1, 1, 1, 1, 1,
0.1114996, 0.7000299, 0.7306238, 1, 1, 1, 1, 1,
0.1126157, 0.6113719, 0.07033869, 1, 1, 1, 1, 1,
0.1132024, 0.42446, 0.4869352, 1, 1, 1, 1, 1,
0.1191296, -1.186552, 1.64459, 1, 1, 1, 1, 1,
0.1197447, 1.34285, 1.242149, 1, 1, 1, 1, 1,
0.1237195, -0.3801402, 2.890111, 1, 1, 1, 1, 1,
0.1243329, 0.268405, -0.1211059, 1, 1, 1, 1, 1,
0.1247697, -1.331403, 4.567548, 1, 1, 1, 1, 1,
0.1275988, -1.298246, 2.419589, 1, 1, 1, 1, 1,
0.1291658, -0.420553, 2.365804, 1, 1, 1, 1, 1,
0.1325612, -0.6680784, 2.394246, 0, 0, 1, 1, 1,
0.1339726, 0.3948452, 2.128476, 1, 0, 0, 1, 1,
0.1351952, -0.6365026, 5.418327, 1, 0, 0, 1, 1,
0.1362556, 0.3728051, -0.09190692, 1, 0, 0, 1, 1,
0.1369922, -0.4387079, 2.194965, 1, 0, 0, 1, 1,
0.1376015, 0.8909228, -1.273708, 1, 0, 0, 1, 1,
0.1407981, 0.1906205, 0.02296634, 0, 0, 0, 1, 1,
0.1410738, 0.3111155, -0.707316, 0, 0, 0, 1, 1,
0.1447573, -1.319243, 1.525114, 0, 0, 0, 1, 1,
0.1460269, -0.1758848, 2.27369, 0, 0, 0, 1, 1,
0.1496915, 0.5591438, 0.4151543, 0, 0, 0, 1, 1,
0.1513047, 0.7930132, 0.7972707, 0, 0, 0, 1, 1,
0.1513784, 0.3576754, 1.316081, 0, 0, 0, 1, 1,
0.1542265, 0.1032667, 0.4064667, 1, 1, 1, 1, 1,
0.1577154, -0.2949317, 3.53883, 1, 1, 1, 1, 1,
0.1625701, -0.210202, 3.265319, 1, 1, 1, 1, 1,
0.1665408, -0.8005526, 4.828319, 1, 1, 1, 1, 1,
0.1697425, 0.6666805, 0.1014524, 1, 1, 1, 1, 1,
0.173198, -0.8686706, 2.425425, 1, 1, 1, 1, 1,
0.1743055, 0.2374208, -0.08162253, 1, 1, 1, 1, 1,
0.1753364, -2.465954, 2.455026, 1, 1, 1, 1, 1,
0.178801, 1.874871, -1.163827, 1, 1, 1, 1, 1,
0.1798694, -1.382605, 2.742973, 1, 1, 1, 1, 1,
0.1829757, -0.3772642, 1.410048, 1, 1, 1, 1, 1,
0.1849193, -1.566344, 3.191723, 1, 1, 1, 1, 1,
0.1870001, 1.693559, -0.03657497, 1, 1, 1, 1, 1,
0.1891544, 0.2625743, 0.5197994, 1, 1, 1, 1, 1,
0.1904548, 0.3725911, 1.280486, 1, 1, 1, 1, 1,
0.1976798, -1.668899, 0.9037309, 0, 0, 1, 1, 1,
0.1989095, -1.45566, 2.74678, 1, 0, 0, 1, 1,
0.2022591, -0.4135179, 2.969271, 1, 0, 0, 1, 1,
0.2084307, 1.010931, 0.4456262, 1, 0, 0, 1, 1,
0.2102595, 0.8730949, 0.1457372, 1, 0, 0, 1, 1,
0.211917, 1.368089, -1.691669, 1, 0, 0, 1, 1,
0.2218913, 0.2445863, 1.581228, 0, 0, 0, 1, 1,
0.2237448, -0.7507367, 2.893575, 0, 0, 0, 1, 1,
0.2271493, 0.6311783, 0.0218817, 0, 0, 0, 1, 1,
0.228871, 0.4036561, 0.1752243, 0, 0, 0, 1, 1,
0.2316333, 0.9529175, -1.461882, 0, 0, 0, 1, 1,
0.232155, -0.2370674, 2.450848, 0, 0, 0, 1, 1,
0.2373627, -0.07781158, 2.195517, 0, 0, 0, 1, 1,
0.2422418, 1.157953, 1.319265, 1, 1, 1, 1, 1,
0.2440017, 1.328264, 0.5669011, 1, 1, 1, 1, 1,
0.2463597, -0.8272515, 0.6231288, 1, 1, 1, 1, 1,
0.2472354, -2.903186, 2.702181, 1, 1, 1, 1, 1,
0.2474706, -0.8744436, 2.909024, 1, 1, 1, 1, 1,
0.2490651, 0.6114702, -0.6670007, 1, 1, 1, 1, 1,
0.2606148, 0.2862038, -0.3406907, 1, 1, 1, 1, 1,
0.2633251, -1.555723, 2.837334, 1, 1, 1, 1, 1,
0.2636119, -0.3276793, 0.784658, 1, 1, 1, 1, 1,
0.2639071, 0.1555792, 0.522427, 1, 1, 1, 1, 1,
0.265772, 0.7083425, 0.1380307, 1, 1, 1, 1, 1,
0.2713337, -1.031009, 2.651365, 1, 1, 1, 1, 1,
0.2735057, 0.6309009, 0.6447951, 1, 1, 1, 1, 1,
0.2791816, 0.0834738, 1.938916, 1, 1, 1, 1, 1,
0.2793145, 0.09327988, 0.9211211, 1, 1, 1, 1, 1,
0.2794463, -2.827798, -0.1337502, 0, 0, 1, 1, 1,
0.286496, -0.7477884, 2.401246, 1, 0, 0, 1, 1,
0.2866267, 2.315658, 0.335879, 1, 0, 0, 1, 1,
0.2876421, -1.720862, 0.2107998, 1, 0, 0, 1, 1,
0.2889116, -0.4598885, 2.330004, 1, 0, 0, 1, 1,
0.2910307, 0.8633136, -0.4724602, 1, 0, 0, 1, 1,
0.2928275, -0.1778167, 3.291081, 0, 0, 0, 1, 1,
0.2950404, -0.1707672, 2.753671, 0, 0, 0, 1, 1,
0.295541, 1.957646, 0.7978616, 0, 0, 0, 1, 1,
0.2972907, -1.087541, 1.675052, 0, 0, 0, 1, 1,
0.2987665, 0.1742092, 2.116909, 0, 0, 0, 1, 1,
0.3039227, -0.4164919, 1.778126, 0, 0, 0, 1, 1,
0.3124994, 0.7077584, 0.02004747, 0, 0, 0, 1, 1,
0.3157067, 0.07417867, 0.6887345, 1, 1, 1, 1, 1,
0.3199891, 0.2368814, 1.384841, 1, 1, 1, 1, 1,
0.3202694, 0.08433975, 0.7782448, 1, 1, 1, 1, 1,
0.3253073, 1.387348, 0.7380232, 1, 1, 1, 1, 1,
0.3253919, 1.216478, -1.681709, 1, 1, 1, 1, 1,
0.3258316, 0.6537145, 0.2484696, 1, 1, 1, 1, 1,
0.3266474, 1.068487, 2.077315, 1, 1, 1, 1, 1,
0.3269125, 1.716826, 0.7209827, 1, 1, 1, 1, 1,
0.3275414, 1.543189, -0.5167246, 1, 1, 1, 1, 1,
0.3331473, -0.8040617, 1.648667, 1, 1, 1, 1, 1,
0.3332313, -0.3930145, 1.787753, 1, 1, 1, 1, 1,
0.3396859, -0.8690727, 2.234654, 1, 1, 1, 1, 1,
0.3419442, -1.086019, 3.064087, 1, 1, 1, 1, 1,
0.3465871, -0.5779983, 2.10208, 1, 1, 1, 1, 1,
0.3472921, -0.01604242, 2.534235, 1, 1, 1, 1, 1,
0.354281, 1.302151, 1.093258, 0, 0, 1, 1, 1,
0.3579165, 0.955699, -1.123706, 1, 0, 0, 1, 1,
0.3664197, 0.2969093, 0.519029, 1, 0, 0, 1, 1,
0.3686826, -0.2671856, 1.99808, 1, 0, 0, 1, 1,
0.3708575, 0.7121257, 2.506988, 1, 0, 0, 1, 1,
0.3717562, 0.9051681, 2.542109, 1, 0, 0, 1, 1,
0.3720125, -0.05879873, 1.181159, 0, 0, 0, 1, 1,
0.3721191, 0.1487775, -0.5513058, 0, 0, 0, 1, 1,
0.3756691, -0.1099195, 2.714636, 0, 0, 0, 1, 1,
0.376511, 0.1168581, 1.283575, 0, 0, 0, 1, 1,
0.377617, -0.588002, 1.806013, 0, 0, 0, 1, 1,
0.3778521, -0.4232351, 2.589449, 0, 0, 0, 1, 1,
0.3791518, 1.476915, 1.721488, 0, 0, 0, 1, 1,
0.3794012, 0.956337, 1.819209, 1, 1, 1, 1, 1,
0.3910209, -0.7543754, 2.297978, 1, 1, 1, 1, 1,
0.3918142, 0.3681531, 0.008958731, 1, 1, 1, 1, 1,
0.3930907, -0.2377461, 2.084663, 1, 1, 1, 1, 1,
0.3959616, 1.769546, -0.7975023, 1, 1, 1, 1, 1,
0.3975114, -1.062575, 3.451162, 1, 1, 1, 1, 1,
0.4011697, 0.4295749, 1.501319, 1, 1, 1, 1, 1,
0.406203, 0.09358445, 0.03359828, 1, 1, 1, 1, 1,
0.4075533, 0.9372718, -1.824694, 1, 1, 1, 1, 1,
0.4086362, -0.7772204, 3.836504, 1, 1, 1, 1, 1,
0.410757, -0.7584727, 3.709642, 1, 1, 1, 1, 1,
0.411046, -0.6570674, 3.080043, 1, 1, 1, 1, 1,
0.4110872, 0.003786871, 1.761854, 1, 1, 1, 1, 1,
0.4113977, -0.3845295, 2.38425, 1, 1, 1, 1, 1,
0.4168853, 0.2464847, -0.2876629, 1, 1, 1, 1, 1,
0.4254811, 0.1703655, 2.228904, 0, 0, 1, 1, 1,
0.4273703, -1.384122, 4.337291, 1, 0, 0, 1, 1,
0.4306176, 0.820716, 0.03609855, 1, 0, 0, 1, 1,
0.4399388, -1.221232, 4.28534, 1, 0, 0, 1, 1,
0.4489647, -0.128131, 1.733961, 1, 0, 0, 1, 1,
0.4495962, 1.508314, 0.7231663, 1, 0, 0, 1, 1,
0.4513848, -0.8198045, 3.95556, 0, 0, 0, 1, 1,
0.4614594, -0.3957124, 1.280584, 0, 0, 0, 1, 1,
0.4766115, 2.879438, 1.453877, 0, 0, 0, 1, 1,
0.4781043, -2.013565, 2.826569, 0, 0, 0, 1, 1,
0.4786179, 1.270758, 0.6519806, 0, 0, 0, 1, 1,
0.4789204, -0.9652596, 2.267021, 0, 0, 0, 1, 1,
0.4846712, -0.8416554, 2.656757, 0, 0, 0, 1, 1,
0.4854474, -0.1551397, 2.612687, 1, 1, 1, 1, 1,
0.4877593, 0.3885386, -0.5669312, 1, 1, 1, 1, 1,
0.492337, -0.5579931, 1.706683, 1, 1, 1, 1, 1,
0.4972498, 1.284006, 3.078032, 1, 1, 1, 1, 1,
0.497843, 1.619233, -1.599737, 1, 1, 1, 1, 1,
0.504338, 0.07192722, 2.020757, 1, 1, 1, 1, 1,
0.5094603, 0.1867586, 1.804729, 1, 1, 1, 1, 1,
0.5116333, 0.4655416, 3.774555, 1, 1, 1, 1, 1,
0.5207239, 0.1878902, 3.056624, 1, 1, 1, 1, 1,
0.5307533, -0.8498126, 1.695416, 1, 1, 1, 1, 1,
0.5318292, -0.09193639, 3.896689, 1, 1, 1, 1, 1,
0.5327152, -0.1248571, 2.932071, 1, 1, 1, 1, 1,
0.540055, 1.164549, -0.2253529, 1, 1, 1, 1, 1,
0.5401711, -0.8619457, 1.192562, 1, 1, 1, 1, 1,
0.5434835, 1.703481, 1.036013, 1, 1, 1, 1, 1,
0.5448299, -0.7484326, 2.083304, 0, 0, 1, 1, 1,
0.5499318, 2.05641, -1.041998, 1, 0, 0, 1, 1,
0.5521461, 1.717699, 0.5024813, 1, 0, 0, 1, 1,
0.552986, -1.207093, 3.747022, 1, 0, 0, 1, 1,
0.5545046, 0.8520057, 0.3413612, 1, 0, 0, 1, 1,
0.5573099, 0.9115158, 0.2257681, 1, 0, 0, 1, 1,
0.5573498, -0.8049744, 3.459491, 0, 0, 0, 1, 1,
0.5574973, -0.3279065, 3.221332, 0, 0, 0, 1, 1,
0.5596188, -0.1348366, 1.455161, 0, 0, 0, 1, 1,
0.5667002, -1.330804, 2.157689, 0, 0, 0, 1, 1,
0.5701735, 1.080094, -0.05700765, 0, 0, 0, 1, 1,
0.5725553, 0.5712018, 0.580626, 0, 0, 0, 1, 1,
0.5727082, 1.156125, -0.5757611, 0, 0, 0, 1, 1,
0.5738555, 0.07942734, 0.9062929, 1, 1, 1, 1, 1,
0.5817502, -0.9852866, 2.862277, 1, 1, 1, 1, 1,
0.5832617, 1.312933, 1.414619, 1, 1, 1, 1, 1,
0.589893, 0.5556561, 1.083619, 1, 1, 1, 1, 1,
0.6072031, 1.604519, -0.952254, 1, 1, 1, 1, 1,
0.616313, 1.588364, 0.836656, 1, 1, 1, 1, 1,
0.617028, -0.6091695, 1.311584, 1, 1, 1, 1, 1,
0.6172305, 1.834298, 0.602689, 1, 1, 1, 1, 1,
0.6202499, 1.052874, 1.825616, 1, 1, 1, 1, 1,
0.6227223, -1.042778, 1.600739, 1, 1, 1, 1, 1,
0.6252065, -1.076897, 2.443977, 1, 1, 1, 1, 1,
0.6306495, -0.08704396, 1.565561, 1, 1, 1, 1, 1,
0.6309707, -1.249779, 3.064033, 1, 1, 1, 1, 1,
0.6335042, -0.8083198, 3.792086, 1, 1, 1, 1, 1,
0.6357361, -1.118223, 1.208106, 1, 1, 1, 1, 1,
0.6367973, -2.015926, 0.7502829, 0, 0, 1, 1, 1,
0.6491531, 0.2632154, 2.127588, 1, 0, 0, 1, 1,
0.6545203, 0.04844272, 1.686057, 1, 0, 0, 1, 1,
0.6615446, 0.2885006, 0.2165315, 1, 0, 0, 1, 1,
0.6638955, -0.1970516, -0.3498953, 1, 0, 0, 1, 1,
0.6800262, -0.5174158, 1.88545, 1, 0, 0, 1, 1,
0.6848521, 0.5463694, 0.6772918, 0, 0, 0, 1, 1,
0.6860821, 0.2020808, 1.796598, 0, 0, 0, 1, 1,
0.6876408, 0.965718, -0.4784291, 0, 0, 0, 1, 1,
0.6878252, -1.08547, 1.656555, 0, 0, 0, 1, 1,
0.689304, -0.1545516, 0.4632812, 0, 0, 0, 1, 1,
0.6897194, 0.1389061, 2.592277, 0, 0, 0, 1, 1,
0.692615, 1.982767, 0.7628141, 0, 0, 0, 1, 1,
0.6977066, -0.8151952, 2.173968, 1, 1, 1, 1, 1,
0.6990656, -0.1240234, 1.29301, 1, 1, 1, 1, 1,
0.7038581, -1.062432, 2.918534, 1, 1, 1, 1, 1,
0.7041278, -0.6273079, 2.254981, 1, 1, 1, 1, 1,
0.7046663, 0.3312741, 0.2751331, 1, 1, 1, 1, 1,
0.7053639, -0.5152819, 2.143701, 1, 1, 1, 1, 1,
0.7115685, -0.5443257, 2.445935, 1, 1, 1, 1, 1,
0.7179095, 0.6761596, 1.455306, 1, 1, 1, 1, 1,
0.7246155, 1.496284, 0.02161427, 1, 1, 1, 1, 1,
0.7310297, -1.351423, 4.522917, 1, 1, 1, 1, 1,
0.7407459, 0.1010104, 1.365691, 1, 1, 1, 1, 1,
0.7451264, -0.4338133, 2.198721, 1, 1, 1, 1, 1,
0.7456319, 0.8965936, 1.426152, 1, 1, 1, 1, 1,
0.7458063, -1.713762, -0.1883018, 1, 1, 1, 1, 1,
0.7461672, -0.04371025, 0.2857275, 1, 1, 1, 1, 1,
0.7489174, 0.4124611, 0.9415987, 0, 0, 1, 1, 1,
0.7502588, 0.24122, 1.127802, 1, 0, 0, 1, 1,
0.7519423, 0.6563755, 2.22366, 1, 0, 0, 1, 1,
0.752821, -1.206239, 1.464255, 1, 0, 0, 1, 1,
0.7529404, -0.2177221, -0.1893805, 1, 0, 0, 1, 1,
0.7553571, 1.361926, 0.004230762, 1, 0, 0, 1, 1,
0.7567892, -0.9011388, 3.225462, 0, 0, 0, 1, 1,
0.7636171, 0.3242224, 2.294693, 0, 0, 0, 1, 1,
0.7697771, 2.467178, -1.12102, 0, 0, 0, 1, 1,
0.7773507, 1.068192, 1.019534, 0, 0, 0, 1, 1,
0.7850898, -0.6130878, 2.24064, 0, 0, 0, 1, 1,
0.7905976, 0.29982, 1.450266, 0, 0, 0, 1, 1,
0.7966298, 1.340301, 1.048233, 0, 0, 0, 1, 1,
0.797433, -0.6206856, 2.047902, 1, 1, 1, 1, 1,
0.7979534, 1.189097, 0.845109, 1, 1, 1, 1, 1,
0.7991538, -0.2780952, 2.04773, 1, 1, 1, 1, 1,
0.8057842, 0.3988534, 0.6076428, 1, 1, 1, 1, 1,
0.8063787, -2.558172, 3.135546, 1, 1, 1, 1, 1,
0.8117662, 0.5091201, 1.608875, 1, 1, 1, 1, 1,
0.8123791, -0.9327331, 2.991229, 1, 1, 1, 1, 1,
0.8127422, 1.636402, 0.8870972, 1, 1, 1, 1, 1,
0.8128319, 0.7964042, 0.3679868, 1, 1, 1, 1, 1,
0.8129201, 2.088299, 0.8660964, 1, 1, 1, 1, 1,
0.8131335, 0.5835063, 1.476515, 1, 1, 1, 1, 1,
0.8131693, 1.03537, 2.21205, 1, 1, 1, 1, 1,
0.8158011, 2.026295, 0.7596963, 1, 1, 1, 1, 1,
0.821053, 0.3954569, 2.551945, 1, 1, 1, 1, 1,
0.8217999, 0.339328, 2.477102, 1, 1, 1, 1, 1,
0.8271282, -0.3298629, 1.79576, 0, 0, 1, 1, 1,
0.8301597, -1.899533, 3.156136, 1, 0, 0, 1, 1,
0.8464522, -0.3768625, 3.339222, 1, 0, 0, 1, 1,
0.8472758, 0.3415406, 0.8220335, 1, 0, 0, 1, 1,
0.8501432, -0.5818986, 1.109846, 1, 0, 0, 1, 1,
0.8558603, -0.7641181, 2.028532, 1, 0, 0, 1, 1,
0.8609759, -0.9126949, 3.475765, 0, 0, 0, 1, 1,
0.8689187, 2.201287, -0.4951053, 0, 0, 0, 1, 1,
0.8707787, -0.3105099, 2.7258, 0, 0, 0, 1, 1,
0.8924754, 0.8848202, -0.267382, 0, 0, 0, 1, 1,
0.8928173, -0.1240523, 2.365509, 0, 0, 0, 1, 1,
0.8988876, 0.01976033, 1.067631, 0, 0, 0, 1, 1,
0.9001586, -1.053053, 1.283712, 0, 0, 0, 1, 1,
0.9007043, 1.647896, 1.86218, 1, 1, 1, 1, 1,
0.9043353, -0.6002117, 2.322631, 1, 1, 1, 1, 1,
0.9083163, -0.1471453, 0.6782297, 1, 1, 1, 1, 1,
0.9106174, 0.3909033, 1.989882, 1, 1, 1, 1, 1,
0.9132797, 0.467406, 2.240263, 1, 1, 1, 1, 1,
0.9225572, 1.336416, -0.8052249, 1, 1, 1, 1, 1,
0.9245806, -1.481159, 3.495701, 1, 1, 1, 1, 1,
0.9257853, -0.5678843, 1.772636, 1, 1, 1, 1, 1,
0.9267247, 0.6123093, 1.300479, 1, 1, 1, 1, 1,
0.9288188, -1.808675, 1.746682, 1, 1, 1, 1, 1,
0.937826, -2.296968, 4.229732, 1, 1, 1, 1, 1,
0.938382, -1.505846, 3.111241, 1, 1, 1, 1, 1,
0.951004, 0.6424351, 1.290514, 1, 1, 1, 1, 1,
0.9528523, 1.784075, -0.126141, 1, 1, 1, 1, 1,
0.9561173, 0.3701384, 1.079199, 1, 1, 1, 1, 1,
0.9642174, -0.3530793, 1.40849, 0, 0, 1, 1, 1,
0.9666604, 0.09686122, 2.543291, 1, 0, 0, 1, 1,
0.9676518, -0.5631149, 1.731994, 1, 0, 0, 1, 1,
0.9684441, -1.760788, 2.710466, 1, 0, 0, 1, 1,
0.9702823, 0.3056741, 2.438564, 1, 0, 0, 1, 1,
0.9785131, 0.5452395, 0.4782784, 1, 0, 0, 1, 1,
0.98368, 0.4577479, 0.5423993, 0, 0, 0, 1, 1,
0.9903751, 0.70238, 0.6003426, 0, 0, 0, 1, 1,
0.9931231, -1.260695, 3.052021, 0, 0, 0, 1, 1,
0.9931626, -0.5725761, 2.064636, 0, 0, 0, 1, 1,
0.9969124, 0.4619235, 0.4771442, 0, 0, 0, 1, 1,
0.997431, 1.521502, 0.4111098, 0, 0, 0, 1, 1,
0.9979208, 1.165256, -0.4028207, 0, 0, 0, 1, 1,
1.017173, 1.341466, 1.038097, 1, 1, 1, 1, 1,
1.017509, -1.338426, 4.197124, 1, 1, 1, 1, 1,
1.034006, 0.3091338, 1.16289, 1, 1, 1, 1, 1,
1.040219, -0.3302274, 0.1244248, 1, 1, 1, 1, 1,
1.042914, 1.000041, 1.358515, 1, 1, 1, 1, 1,
1.050872, -0.6102217, 2.907951, 1, 1, 1, 1, 1,
1.050897, -1.230478, 0.5095826, 1, 1, 1, 1, 1,
1.051353, -0.3280761, 2.124641, 1, 1, 1, 1, 1,
1.054564, -0.4865211, 3.134191, 1, 1, 1, 1, 1,
1.056463, -0.6731384, 3.283026, 1, 1, 1, 1, 1,
1.061232, 0.1674737, 1.651129, 1, 1, 1, 1, 1,
1.063199, -0.6447099, 3.343442, 1, 1, 1, 1, 1,
1.074294, 0.06740645, -0.383746, 1, 1, 1, 1, 1,
1.074933, 0.2599466, 2.256241, 1, 1, 1, 1, 1,
1.075312, 0.02383791, 0.4237033, 1, 1, 1, 1, 1,
1.082799, 1.569788, 0.5738645, 0, 0, 1, 1, 1,
1.093355, 0.3168045, 1.832326, 1, 0, 0, 1, 1,
1.100689, 0.6589902, 1.400201, 1, 0, 0, 1, 1,
1.10905, -1.221652, 2.076133, 1, 0, 0, 1, 1,
1.112767, 1.16214, 0.2138189, 1, 0, 0, 1, 1,
1.113695, 1.551252, 1.040563, 1, 0, 0, 1, 1,
1.115385, 0.4546651, 0.6259004, 0, 0, 0, 1, 1,
1.118841, 0.3512537, -0.1813602, 0, 0, 0, 1, 1,
1.122644, -1.506721, 1.54151, 0, 0, 0, 1, 1,
1.12291, -0.06746921, 3.330777, 0, 0, 0, 1, 1,
1.125296, 0.4618344, 0.808871, 0, 0, 0, 1, 1,
1.131865, 2.714226, 0.7712843, 0, 0, 0, 1, 1,
1.136736, -0.5174092, 4.714186, 0, 0, 0, 1, 1,
1.143813, -1.129757, 1.912657, 1, 1, 1, 1, 1,
1.152267, -1.327345, 1.872741, 1, 1, 1, 1, 1,
1.154579, -0.5268253, 2.294732, 1, 1, 1, 1, 1,
1.156416, -0.3203188, -0.08820061, 1, 1, 1, 1, 1,
1.15648, -3.260442, 3.552345, 1, 1, 1, 1, 1,
1.156507, -1.492535, 3.382497, 1, 1, 1, 1, 1,
1.174197, 0.3000023, 1.131875, 1, 1, 1, 1, 1,
1.177771, -0.2865257, 3.593862, 1, 1, 1, 1, 1,
1.18011, -0.696754, 2.096415, 1, 1, 1, 1, 1,
1.185895, 0.09991619, 1.407887, 1, 1, 1, 1, 1,
1.188299, 0.2228616, 1.347895, 1, 1, 1, 1, 1,
1.194018, 0.5039605, 2.330194, 1, 1, 1, 1, 1,
1.195456, -0.4090324, 2.490764, 1, 1, 1, 1, 1,
1.208496, -0.8282274, -0.4937506, 1, 1, 1, 1, 1,
1.210422, 0.3308285, 0.4070279, 1, 1, 1, 1, 1,
1.213156, 1.475367, 0.3397649, 0, 0, 1, 1, 1,
1.223751, 0.7959442, 2.544012, 1, 0, 0, 1, 1,
1.24629, 0.07320829, 1.108777, 1, 0, 0, 1, 1,
1.25143, 0.7190244, 0.4024518, 1, 0, 0, 1, 1,
1.25623, 2.040066, 2.743249, 1, 0, 0, 1, 1,
1.263853, -0.5436114, 1.343244, 1, 0, 0, 1, 1,
1.272602, -1.269895, 2.19473, 0, 0, 0, 1, 1,
1.278356, -0.5268539, 1.72357, 0, 0, 0, 1, 1,
1.282066, 2.310931, -0.8968285, 0, 0, 0, 1, 1,
1.292305, 1.244805, 2.384235, 0, 0, 0, 1, 1,
1.300693, 1.128089, 0.6858647, 0, 0, 0, 1, 1,
1.304201, -0.1316055, 1.142329, 0, 0, 0, 1, 1,
1.310583, 0.6616281, 1.124867, 0, 0, 0, 1, 1,
1.311898, 0.237153, 1.952972, 1, 1, 1, 1, 1,
1.327287, 0.06487318, 2.360522, 1, 1, 1, 1, 1,
1.347219, -0.8247007, 2.176632, 1, 1, 1, 1, 1,
1.347783, 1.00276, 0.6174274, 1, 1, 1, 1, 1,
1.348113, 0.8343729, 2.238218, 1, 1, 1, 1, 1,
1.348299, 1.721379, 1.312029, 1, 1, 1, 1, 1,
1.361464, 0.5364097, -1.049947, 1, 1, 1, 1, 1,
1.362381, 0.2589831, 2.290094, 1, 1, 1, 1, 1,
1.377833, 1.349461, 0.1574383, 1, 1, 1, 1, 1,
1.391575, -2.409468, 2.957728, 1, 1, 1, 1, 1,
1.408449, -0.9000873, 2.136796, 1, 1, 1, 1, 1,
1.411479, 0.1432715, 1.298259, 1, 1, 1, 1, 1,
1.419757, 0.6372625, 0.6985757, 1, 1, 1, 1, 1,
1.425814, -0.9284813, 0.8139858, 1, 1, 1, 1, 1,
1.426834, 0.5395765, 1.663635, 1, 1, 1, 1, 1,
1.427138, -0.4749558, 0.6402177, 0, 0, 1, 1, 1,
1.441052, -2.880397, 3.563138, 1, 0, 0, 1, 1,
1.445882, 0.9939346, 2.250271, 1, 0, 0, 1, 1,
1.45297, -0.475825, 2.507018, 1, 0, 0, 1, 1,
1.453143, -1.668948, 1.516671, 1, 0, 0, 1, 1,
1.473681, 0.05213417, 2.282504, 1, 0, 0, 1, 1,
1.474083, -0.3063344, 0.8481742, 0, 0, 0, 1, 1,
1.474968, 1.993117, 0.8634121, 0, 0, 0, 1, 1,
1.478055, 0.2709144, 1.635978, 0, 0, 0, 1, 1,
1.482958, -1.251639, 0.6674986, 0, 0, 0, 1, 1,
1.483806, 1.561864, 1.33232, 0, 0, 0, 1, 1,
1.500177, 1.173341, 1.129188, 0, 0, 0, 1, 1,
1.503547, 0.3981422, 0.1537555, 0, 0, 0, 1, 1,
1.503623, 0.07211203, -0.155161, 1, 1, 1, 1, 1,
1.506034, -0.6869474, 0.6244506, 1, 1, 1, 1, 1,
1.506419, 1.421157, -0.3899953, 1, 1, 1, 1, 1,
1.508169, -0.882805, 2.426856, 1, 1, 1, 1, 1,
1.524706, 1.357252, 2.196206, 1, 1, 1, 1, 1,
1.524857, 0.2100607, 1.279042, 1, 1, 1, 1, 1,
1.548839, 1.395278, 2.232135, 1, 1, 1, 1, 1,
1.552597, -0.372239, 0.1335904, 1, 1, 1, 1, 1,
1.553306, -0.907365, 3.431001, 1, 1, 1, 1, 1,
1.55689, 0.7734826, 0.1638806, 1, 1, 1, 1, 1,
1.582897, 1.914802, 1.748119, 1, 1, 1, 1, 1,
1.583024, 0.4294946, -0.8636384, 1, 1, 1, 1, 1,
1.587856, 1.053621, 1.244737, 1, 1, 1, 1, 1,
1.590547, -0.626676, 1.685155, 1, 1, 1, 1, 1,
1.59787, 0.1468294, 2.663692, 1, 1, 1, 1, 1,
1.615024, 1.477136, 0.6178608, 0, 0, 1, 1, 1,
1.621128, -0.4763661, 0.5101734, 1, 0, 0, 1, 1,
1.683779, 0.8457536, 1.144174, 1, 0, 0, 1, 1,
1.694291, -0.3472033, 1.07278, 1, 0, 0, 1, 1,
1.701244, -0.8136645, 1.669929, 1, 0, 0, 1, 1,
1.707124, -1.836273, 0.5466533, 1, 0, 0, 1, 1,
1.713361, -1.248222, 2.724314, 0, 0, 0, 1, 1,
1.714716, -0.1017593, 3.388171, 0, 0, 0, 1, 1,
1.716377, -0.0766359, 0.6076674, 0, 0, 0, 1, 1,
1.740033, 1.291584, 1.613601, 0, 0, 0, 1, 1,
1.746994, 0.5064083, 0.005151793, 0, 0, 0, 1, 1,
1.752116, -1.556331, 2.370331, 0, 0, 0, 1, 1,
1.768983, -0.3251854, 1.934222, 0, 0, 0, 1, 1,
1.781648, -0.07722088, 2.122363, 1, 1, 1, 1, 1,
1.785735, 1.041799, 0.5942471, 1, 1, 1, 1, 1,
1.788601, 0.2808042, 3.296178, 1, 1, 1, 1, 1,
1.791037, -0.4652835, 1.982884, 1, 1, 1, 1, 1,
1.794865, -0.2641247, 2.129557, 1, 1, 1, 1, 1,
1.824057, -1.493685, 3.052117, 1, 1, 1, 1, 1,
1.840171, 2.399531, 1.578048, 1, 1, 1, 1, 1,
1.853236, -0.7902405, 1.123781, 1, 1, 1, 1, 1,
1.906977, -1.502469, 1.584148, 1, 1, 1, 1, 1,
1.939855, 1.034218, 1.187503, 1, 1, 1, 1, 1,
1.983443, -0.03502154, 1.119314, 1, 1, 1, 1, 1,
2.011852, 1.285552, 1.435022, 1, 1, 1, 1, 1,
2.030481, -0.5680777, 2.618336, 1, 1, 1, 1, 1,
2.05563, 0.5993091, 2.015131, 1, 1, 1, 1, 1,
2.075916, -1.412967, -0.08319699, 1, 1, 1, 1, 1,
2.112089, -0.7092111, 0.9480662, 0, 0, 1, 1, 1,
2.141917, 0.2296625, 2.477012, 1, 0, 0, 1, 1,
2.152872, -0.1836957, 0.7342044, 1, 0, 0, 1, 1,
2.155683, 0.8445397, 1.963202, 1, 0, 0, 1, 1,
2.156408, -0.2934374, 1.893954, 1, 0, 0, 1, 1,
2.159678, -1.959887, 1.486313, 1, 0, 0, 1, 1,
2.170661, 0.9070122, 0.2220665, 0, 0, 0, 1, 1,
2.183002, -1.154148, 3.221252, 0, 0, 0, 1, 1,
2.206524, 0.8090346, 2.396636, 0, 0, 0, 1, 1,
2.208435, 1.241061, 1.27123, 0, 0, 0, 1, 1,
2.244206, 1.378685, 1.118845, 0, 0, 0, 1, 1,
2.251028, -0.1604236, 1.91583, 0, 0, 0, 1, 1,
2.271788, -1.878004, 3.592968, 0, 0, 0, 1, 1,
2.272084, -0.01712234, 0.2493214, 1, 1, 1, 1, 1,
2.398504, -1.961454, 2.714708, 1, 1, 1, 1, 1,
2.426848, 1.28376, 1.591437, 1, 1, 1, 1, 1,
2.541551, 0.7083983, 2.372522, 1, 1, 1, 1, 1,
2.59214, -0.5397189, -1.562046, 1, 1, 1, 1, 1,
2.597594, 1.363315, 0.04157229, 1, 1, 1, 1, 1,
2.653574, 0.5740566, 0.876792, 1, 1, 1, 1, 1
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
var radius = 9.796863;
var distance = 34.41106;
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
mvMatrix.translate( 0.1821196, -0.2320442, 0.246964 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41106);
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
