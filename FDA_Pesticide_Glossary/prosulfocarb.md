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
-3.458903, -0.04011049, -0.3684847, 1, 0, 0, 1,
-3.229871, -0.7103074, -2.141731, 1, 0.007843138, 0, 1,
-2.633033, -0.1080307, -1.139899, 1, 0.01176471, 0, 1,
-2.628291, -1.214028, -2.168564, 1, 0.01960784, 0, 1,
-2.577685, -1.129344, -1.722434, 1, 0.02352941, 0, 1,
-2.505591, 0.1062221, -0.4358592, 1, 0.03137255, 0, 1,
-2.484459, -1.420581, -2.271172, 1, 0.03529412, 0, 1,
-2.466422, 0.2445945, -1.429942, 1, 0.04313726, 0, 1,
-2.369824, -1.643489, -0.9146277, 1, 0.04705882, 0, 1,
-2.223429, 1.232286, -1.381754, 1, 0.05490196, 0, 1,
-2.155591, -0.3877291, -2.10596, 1, 0.05882353, 0, 1,
-2.099353, 0.1937676, -2.05908, 1, 0.06666667, 0, 1,
-2.098032, -0.7892366, -3.495731, 1, 0.07058824, 0, 1,
-2.080623, -0.2995746, -0.6651763, 1, 0.07843138, 0, 1,
-2.054092, -1.405294, -2.163116, 1, 0.08235294, 0, 1,
-2.046145, 1.175698, 0.8634205, 1, 0.09019608, 0, 1,
-2.038773, -0.7961713, -1.268691, 1, 0.09411765, 0, 1,
-1.999038, 1.094396, -0.7895624, 1, 0.1019608, 0, 1,
-1.986472, 0.09769294, -0.7830867, 1, 0.1098039, 0, 1,
-1.960019, 1.144851, -2.544173, 1, 0.1137255, 0, 1,
-1.946261, 1.04573, 0.9362993, 1, 0.1215686, 0, 1,
-1.937232, -1.26861, -2.018035, 1, 0.1254902, 0, 1,
-1.930517, -1.279929, -3.176697, 1, 0.1333333, 0, 1,
-1.921244, -0.09173997, -1.204561, 1, 0.1372549, 0, 1,
-1.916335, -0.6350363, -3.127266, 1, 0.145098, 0, 1,
-1.889641, 0.07738744, 0.5957222, 1, 0.1490196, 0, 1,
-1.884602, 0.4383007, -1.901105, 1, 0.1568628, 0, 1,
-1.879546, 0.2087613, -2.923497, 1, 0.1607843, 0, 1,
-1.872294, 0.8755351, -0.7421241, 1, 0.1686275, 0, 1,
-1.853474, 0.06345801, -2.146801, 1, 0.172549, 0, 1,
-1.845011, -1.792365, -2.207369, 1, 0.1803922, 0, 1,
-1.841645, 1.615459, -1.227901, 1, 0.1843137, 0, 1,
-1.839957, 1.224223, -2.346676, 1, 0.1921569, 0, 1,
-1.830616, -0.566905, -1.394715, 1, 0.1960784, 0, 1,
-1.828812, -0.5834707, -0.7380672, 1, 0.2039216, 0, 1,
-1.810648, -1.271869, -4.006193, 1, 0.2117647, 0, 1,
-1.802341, 0.6450345, -0.9816078, 1, 0.2156863, 0, 1,
-1.798785, -0.8519458, -2.569329, 1, 0.2235294, 0, 1,
-1.784009, -0.6617851, -1.964499, 1, 0.227451, 0, 1,
-1.763228, 1.314394, 0.2173708, 1, 0.2352941, 0, 1,
-1.756721, 0.6839742, -2.959049, 1, 0.2392157, 0, 1,
-1.755332, -2.320199, -1.60862, 1, 0.2470588, 0, 1,
-1.699402, -0.5616207, -3.447194, 1, 0.2509804, 0, 1,
-1.653415, -0.09292481, -1.973054, 1, 0.2588235, 0, 1,
-1.645578, -1.98223, -3.794413, 1, 0.2627451, 0, 1,
-1.630362, -0.5563241, -2.287162, 1, 0.2705882, 0, 1,
-1.627794, 1.474502, -0.8996592, 1, 0.2745098, 0, 1,
-1.621209, 0.7824322, 1.498754, 1, 0.282353, 0, 1,
-1.595775, -2.34421, -3.671692, 1, 0.2862745, 0, 1,
-1.589352, 0.3428003, -1.683148, 1, 0.2941177, 0, 1,
-1.588465, -0.412512, -2.358684, 1, 0.3019608, 0, 1,
-1.578436, -1.400706, -3.788137, 1, 0.3058824, 0, 1,
-1.57577, 1.462999, -0.7517102, 1, 0.3137255, 0, 1,
-1.558987, -0.4862647, -2.41077, 1, 0.3176471, 0, 1,
-1.55404, -0.5693356, -2.982596, 1, 0.3254902, 0, 1,
-1.530867, 0.6559956, -0.4546285, 1, 0.3294118, 0, 1,
-1.526546, 0.4516243, -2.052359, 1, 0.3372549, 0, 1,
-1.516688, 0.1536389, 0.3268459, 1, 0.3411765, 0, 1,
-1.499685, -1.176884, -3.152996, 1, 0.3490196, 0, 1,
-1.478329, -1.230033, -0.5807215, 1, 0.3529412, 0, 1,
-1.476757, 0.9653022, -1.045685, 1, 0.3607843, 0, 1,
-1.464949, 0.9130167, -0.9393759, 1, 0.3647059, 0, 1,
-1.460397, -0.05575057, -1.360705, 1, 0.372549, 0, 1,
-1.451331, -0.5824878, -0.4193949, 1, 0.3764706, 0, 1,
-1.432373, 1.062561, -0.9329349, 1, 0.3843137, 0, 1,
-1.431777, -0.3726096, -2.424191, 1, 0.3882353, 0, 1,
-1.431001, 2.31357, -0.2787068, 1, 0.3960784, 0, 1,
-1.418858, 0.697001, -0.2926295, 1, 0.4039216, 0, 1,
-1.400708, 0.391969, -1.683641, 1, 0.4078431, 0, 1,
-1.399098, -0.03971957, -1.640401, 1, 0.4156863, 0, 1,
-1.398992, -0.7303967, -1.246264, 1, 0.4196078, 0, 1,
-1.397345, -0.5406055, -3.715078, 1, 0.427451, 0, 1,
-1.391792, -1.154819, -4.154945, 1, 0.4313726, 0, 1,
-1.382981, -1.167894, -1.998081, 1, 0.4392157, 0, 1,
-1.373415, -1.338988, -4.296583, 1, 0.4431373, 0, 1,
-1.368657, -0.5689225, -2.692863, 1, 0.4509804, 0, 1,
-1.36077, 0.4558818, -2.991207, 1, 0.454902, 0, 1,
-1.347489, -0.3810814, -2.039676, 1, 0.4627451, 0, 1,
-1.338596, 1.046699, 0.2914641, 1, 0.4666667, 0, 1,
-1.336762, -0.4181901, -1.901954, 1, 0.4745098, 0, 1,
-1.336481, -0.6221743, -0.08915129, 1, 0.4784314, 0, 1,
-1.322123, -1.667313, -0.8380729, 1, 0.4862745, 0, 1,
-1.315817, -0.8379136, -1.940651, 1, 0.4901961, 0, 1,
-1.311806, -0.1640632, -3.796813, 1, 0.4980392, 0, 1,
-1.302626, 0.4568788, -0.9318537, 1, 0.5058824, 0, 1,
-1.30108, -1.504374, -1.17189, 1, 0.509804, 0, 1,
-1.299799, -1.745699, -2.214836, 1, 0.5176471, 0, 1,
-1.289317, -0.1291519, -0.08483246, 1, 0.5215687, 0, 1,
-1.284662, 2.116485, 1.137218, 1, 0.5294118, 0, 1,
-1.281538, 0.4752695, -2.343169, 1, 0.5333334, 0, 1,
-1.273075, 1.224501, -0.773259, 1, 0.5411765, 0, 1,
-1.272544, 0.09489382, -0.7787706, 1, 0.5450981, 0, 1,
-1.265366, -0.8745708, 0.5225227, 1, 0.5529412, 0, 1,
-1.25609, -0.5335313, -3.968688, 1, 0.5568628, 0, 1,
-1.249902, -0.2885512, -2.124981, 1, 0.5647059, 0, 1,
-1.248187, 0.9215147, -1.652002, 1, 0.5686275, 0, 1,
-1.23332, 0.5233536, -1.968514, 1, 0.5764706, 0, 1,
-1.224939, 0.1911724, -0.4427578, 1, 0.5803922, 0, 1,
-1.223032, 1.246714, -1.644893, 1, 0.5882353, 0, 1,
-1.219091, -0.5505044, -2.914705, 1, 0.5921569, 0, 1,
-1.212013, -1.562576, -4.152196, 1, 0.6, 0, 1,
-1.203179, -0.2640021, -0.8895003, 1, 0.6078432, 0, 1,
-1.199803, 1.26959, -0.4968059, 1, 0.6117647, 0, 1,
-1.195629, 1.033841, -0.6234251, 1, 0.6196079, 0, 1,
-1.192405, 0.6032081, 0.1179426, 1, 0.6235294, 0, 1,
-1.190743, 0.5711006, 0.5427623, 1, 0.6313726, 0, 1,
-1.190535, -2.67069, -2.533719, 1, 0.6352941, 0, 1,
-1.188417, 1.106724, -1.264505, 1, 0.6431373, 0, 1,
-1.177421, 0.4921468, -1.394722, 1, 0.6470588, 0, 1,
-1.173, 1.105767, -1.278685, 1, 0.654902, 0, 1,
-1.166979, 0.8834045, -2.633856, 1, 0.6588235, 0, 1,
-1.166369, -0.4046776, -0.6640778, 1, 0.6666667, 0, 1,
-1.166299, -1.304657, -2.098497, 1, 0.6705883, 0, 1,
-1.159145, -0.7101753, -1.287197, 1, 0.6784314, 0, 1,
-1.158771, -0.008206548, -1.076194, 1, 0.682353, 0, 1,
-1.156904, -0.09736896, -1.685265, 1, 0.6901961, 0, 1,
-1.154474, 0.3258234, -3.45656, 1, 0.6941177, 0, 1,
-1.153919, -0.3043022, -1.036441, 1, 0.7019608, 0, 1,
-1.152417, 0.4532433, -1.687733, 1, 0.7098039, 0, 1,
-1.150406, -1.810314, -3.425358, 1, 0.7137255, 0, 1,
-1.145221, -1.373239, -3.494304, 1, 0.7215686, 0, 1,
-1.134917, -0.05155554, -2.899985, 1, 0.7254902, 0, 1,
-1.129109, -0.625115, -2.408617, 1, 0.7333333, 0, 1,
-1.111526, -1.146497, -2.770787, 1, 0.7372549, 0, 1,
-1.110941, -0.4804789, -1.111973, 1, 0.7450981, 0, 1,
-1.102778, 0.6636968, -2.470476, 1, 0.7490196, 0, 1,
-1.101708, -0.689097, -0.8776633, 1, 0.7568628, 0, 1,
-1.098971, 0.9017301, -1.625015, 1, 0.7607843, 0, 1,
-1.098932, 0.1223055, -0.8153252, 1, 0.7686275, 0, 1,
-1.098778, 1.83287, -2.014269, 1, 0.772549, 0, 1,
-1.095103, -0.4787428, -2.52864, 1, 0.7803922, 0, 1,
-1.092013, 0.09721939, -0.9348446, 1, 0.7843137, 0, 1,
-1.090081, -0.9758631, -2.125005, 1, 0.7921569, 0, 1,
-1.089882, -0.3699012, -0.5722135, 1, 0.7960784, 0, 1,
-1.087724, -0.24947, -1.065933, 1, 0.8039216, 0, 1,
-1.087419, -1.706181, -2.128751, 1, 0.8117647, 0, 1,
-1.083334, -0.6306851, -1.887624, 1, 0.8156863, 0, 1,
-1.076431, -0.8148912, -1.171068, 1, 0.8235294, 0, 1,
-1.069473, -1.253363, -1.94122, 1, 0.827451, 0, 1,
-1.065249, -0.8139042, -1.510783, 1, 0.8352941, 0, 1,
-1.04878, 0.4383688, -0.8822784, 1, 0.8392157, 0, 1,
-1.04669, -0.2726342, -1.250313, 1, 0.8470588, 0, 1,
-1.044947, 0.7325488, -1.109804, 1, 0.8509804, 0, 1,
-1.041402, -1.746677, -3.130384, 1, 0.8588235, 0, 1,
-1.038618, -1.799338, -1.081696, 1, 0.8627451, 0, 1,
-1.036127, 0.2336941, -0.7423283, 1, 0.8705882, 0, 1,
-1.028972, 0.4827043, -0.4340876, 1, 0.8745098, 0, 1,
-1.024137, 0.9403498, 0.2149301, 1, 0.8823529, 0, 1,
-1.022819, 0.3284943, -2.739569, 1, 0.8862745, 0, 1,
-1.01556, -0.3584142, -1.947135, 1, 0.8941177, 0, 1,
-1.012945, -0.2022773, -2.70069, 1, 0.8980392, 0, 1,
-1.012157, -1.389722, -3.408612, 1, 0.9058824, 0, 1,
-1.01213, -2.352888, -2.763988, 1, 0.9137255, 0, 1,
-1.011722, -0.844399, -2.556404, 1, 0.9176471, 0, 1,
-1.008695, 1.794458, -0.7957744, 1, 0.9254902, 0, 1,
-1.006277, -0.2241094, -3.050452, 1, 0.9294118, 0, 1,
-1.005185, 0.8336883, -1.254538, 1, 0.9372549, 0, 1,
-1.003118, 1.837941, -1.229976, 1, 0.9411765, 0, 1,
-1.000814, -0.9433401, -1.728641, 1, 0.9490196, 0, 1,
-0.9974234, 0.4915654, -0.9616076, 1, 0.9529412, 0, 1,
-0.9949472, 0.1760845, -2.775853, 1, 0.9607843, 0, 1,
-0.9918464, 0.3589792, -2.295571, 1, 0.9647059, 0, 1,
-0.9897937, -0.4208366, -4.847497, 1, 0.972549, 0, 1,
-0.9891083, -0.3733719, -0.7852678, 1, 0.9764706, 0, 1,
-0.9867067, -1.042801, -2.144104, 1, 0.9843137, 0, 1,
-0.980045, 0.3305598, -0.9979333, 1, 0.9882353, 0, 1,
-0.9792195, 0.2235041, -0.414198, 1, 0.9960784, 0, 1,
-0.9745894, -1.010312, -2.021512, 0.9960784, 1, 0, 1,
-0.9735666, -0.2346421, -1.86922, 0.9921569, 1, 0, 1,
-0.9698203, 0.7749922, -2.450414, 0.9843137, 1, 0, 1,
-0.9647459, -1.251733, -3.944292, 0.9803922, 1, 0, 1,
-0.956346, 0.485933, -1.295967, 0.972549, 1, 0, 1,
-0.9535413, 1.424432, -0.8446867, 0.9686275, 1, 0, 1,
-0.9500404, 0.6941278, 0.1126405, 0.9607843, 1, 0, 1,
-0.9479209, -1.289728, -2.876689, 0.9568627, 1, 0, 1,
-0.9435992, 1.065381, -2.59295, 0.9490196, 1, 0, 1,
-0.9396573, -0.4429179, -3.36116, 0.945098, 1, 0, 1,
-0.9342972, -1.570412, -0.788473, 0.9372549, 1, 0, 1,
-0.931001, -1.355712, -1.611906, 0.9333333, 1, 0, 1,
-0.9160682, 0.5189217, 1.000095, 0.9254902, 1, 0, 1,
-0.915848, 0.02677432, -2.220099, 0.9215686, 1, 0, 1,
-0.9137424, 0.7394126, 0.7078406, 0.9137255, 1, 0, 1,
-0.9126328, 0.6215583, -2.997911, 0.9098039, 1, 0, 1,
-0.9100474, 0.06817126, -1.858975, 0.9019608, 1, 0, 1,
-0.9098506, -0.8766116, -1.225953, 0.8941177, 1, 0, 1,
-0.901675, 0.8950428, -0.8081279, 0.8901961, 1, 0, 1,
-0.8990012, 0.3094465, -2.165459, 0.8823529, 1, 0, 1,
-0.8962057, 1.631699, 0.6168941, 0.8784314, 1, 0, 1,
-0.8959963, -1.001658, -2.452342, 0.8705882, 1, 0, 1,
-0.8927702, -1.707958, -2.970481, 0.8666667, 1, 0, 1,
-0.8923945, 0.4848206, -0.9010732, 0.8588235, 1, 0, 1,
-0.8885996, 0.002699361, -0.9566079, 0.854902, 1, 0, 1,
-0.8841795, -0.2123639, -1.222251, 0.8470588, 1, 0, 1,
-0.8729298, 0.4475727, -2.355547, 0.8431373, 1, 0, 1,
-0.8680909, 0.008626721, -2.152253, 0.8352941, 1, 0, 1,
-0.8631507, -1.985909, -2.269999, 0.8313726, 1, 0, 1,
-0.8617152, 0.8178124, -1.355283, 0.8235294, 1, 0, 1,
-0.8579722, -0.6825955, -3.243696, 0.8196079, 1, 0, 1,
-0.83767, 0.08071344, -1.266231, 0.8117647, 1, 0, 1,
-0.8374747, 0.5298509, -0.06114211, 0.8078431, 1, 0, 1,
-0.8373098, 0.314531, 0.2425409, 0.8, 1, 0, 1,
-0.8287358, -0.4109111, -2.421741, 0.7921569, 1, 0, 1,
-0.8161648, -0.5793104, -3.987146, 0.7882353, 1, 0, 1,
-0.815616, -0.938767, -1.941286, 0.7803922, 1, 0, 1,
-0.8149552, -0.3946698, -0.5749226, 0.7764706, 1, 0, 1,
-0.8131139, -0.3462971, 1.713498, 0.7686275, 1, 0, 1,
-0.8117488, 1.34393, 1.347011, 0.7647059, 1, 0, 1,
-0.8058586, 0.4416147, -0.00538946, 0.7568628, 1, 0, 1,
-0.8031743, -0.2325746, -0.3489553, 0.7529412, 1, 0, 1,
-0.8021144, -0.01453832, -1.257007, 0.7450981, 1, 0, 1,
-0.8008628, -1.852871, -2.80236, 0.7411765, 1, 0, 1,
-0.7958174, 0.9152227, -1.424072, 0.7333333, 1, 0, 1,
-0.7939496, -0.356277, -1.782657, 0.7294118, 1, 0, 1,
-0.7893512, 0.233149, -2.900218, 0.7215686, 1, 0, 1,
-0.7847201, -0.06301545, -0.6934038, 0.7176471, 1, 0, 1,
-0.7834964, -0.9929859, -1.404398, 0.7098039, 1, 0, 1,
-0.7818539, 0.2111132, -1.99555, 0.7058824, 1, 0, 1,
-0.779297, 0.862312, -0.02241863, 0.6980392, 1, 0, 1,
-0.7673724, 0.124174, -1.109663, 0.6901961, 1, 0, 1,
-0.7649463, 0.7174571, -1.803063, 0.6862745, 1, 0, 1,
-0.7573033, 1.402648, -0.1529366, 0.6784314, 1, 0, 1,
-0.74996, 0.03471218, -0.3039286, 0.6745098, 1, 0, 1,
-0.7407837, -0.7127782, -2.872508, 0.6666667, 1, 0, 1,
-0.7384705, 0.764625, -1.31314, 0.6627451, 1, 0, 1,
-0.7335974, -0.1594321, -2.912408, 0.654902, 1, 0, 1,
-0.731253, -0.4534479, -1.602457, 0.6509804, 1, 0, 1,
-0.7297067, 0.8452075, -0.4771562, 0.6431373, 1, 0, 1,
-0.7247559, 1.26428, -1.803827, 0.6392157, 1, 0, 1,
-0.7226173, 1.666885, 0.3565238, 0.6313726, 1, 0, 1,
-0.7170526, 0.4602148, 1.346743, 0.627451, 1, 0, 1,
-0.7109892, 0.3059847, -1.116542, 0.6196079, 1, 0, 1,
-0.7104627, 0.5366736, -1.672981, 0.6156863, 1, 0, 1,
-0.7100871, -0.001543262, -1.559153, 0.6078432, 1, 0, 1,
-0.7065687, 1.00222, -2.158303, 0.6039216, 1, 0, 1,
-0.7058501, -0.05134217, -1.747925, 0.5960785, 1, 0, 1,
-0.7049769, 0.786305, 0.6303925, 0.5882353, 1, 0, 1,
-0.7034268, 1.605191, 0.006718521, 0.5843138, 1, 0, 1,
-0.7027278, 0.1253896, -0.1451709, 0.5764706, 1, 0, 1,
-0.7026682, 1.216998, -0.4214551, 0.572549, 1, 0, 1,
-0.6997278, 0.1637053, -0.6425627, 0.5647059, 1, 0, 1,
-0.698676, -0.7855606, -2.25927, 0.5607843, 1, 0, 1,
-0.6950498, 0.3512658, -2.77902, 0.5529412, 1, 0, 1,
-0.6950418, 0.7804525, -0.1707973, 0.5490196, 1, 0, 1,
-0.6928496, 0.8526597, 0.6031646, 0.5411765, 1, 0, 1,
-0.6831586, 0.3414081, -1.941308, 0.5372549, 1, 0, 1,
-0.6795903, -1.076855, -2.612708, 0.5294118, 1, 0, 1,
-0.6720254, -2.254899, -2.813612, 0.5254902, 1, 0, 1,
-0.6709329, 0.8976321, -1.949187, 0.5176471, 1, 0, 1,
-0.6694406, 1.136236, -0.4147491, 0.5137255, 1, 0, 1,
-0.6684156, -1.460142, -2.920266, 0.5058824, 1, 0, 1,
-0.6527689, -0.9646993, -2.854574, 0.5019608, 1, 0, 1,
-0.6431907, 1.249446, -0.2357486, 0.4941176, 1, 0, 1,
-0.6431038, -0.01106674, -2.028386, 0.4862745, 1, 0, 1,
-0.6364862, -0.53324, -3.336966, 0.4823529, 1, 0, 1,
-0.6315904, -0.5841656, -2.234478, 0.4745098, 1, 0, 1,
-0.6287565, 1.941654, -0.8609356, 0.4705882, 1, 0, 1,
-0.6278425, 0.5568377, -2.991839, 0.4627451, 1, 0, 1,
-0.6238917, 0.7649005, -0.4289983, 0.4588235, 1, 0, 1,
-0.6238328, 0.6029408, 0.05743557, 0.4509804, 1, 0, 1,
-0.6232334, 0.6974855, -0.8223843, 0.4470588, 1, 0, 1,
-0.6177049, -0.1479398, -1.519882, 0.4392157, 1, 0, 1,
-0.6155181, 1.740238, 0.419887, 0.4352941, 1, 0, 1,
-0.6109523, -0.1866065, -0.9086038, 0.427451, 1, 0, 1,
-0.6056141, -0.9262598, -3.447425, 0.4235294, 1, 0, 1,
-0.6021339, 0.2048777, -2.016218, 0.4156863, 1, 0, 1,
-0.5995104, 0.4191727, -0.4236423, 0.4117647, 1, 0, 1,
-0.5982703, -0.4101071, -1.084106, 0.4039216, 1, 0, 1,
-0.5981855, 0.4449298, -1.684417, 0.3960784, 1, 0, 1,
-0.5864236, -0.1332558, -1.814996, 0.3921569, 1, 0, 1,
-0.5855547, -0.5486126, -1.912229, 0.3843137, 1, 0, 1,
-0.5738764, -1.542493, -3.800797, 0.3803922, 1, 0, 1,
-0.5656793, -0.3157293, -3.394077, 0.372549, 1, 0, 1,
-0.5656649, 0.2072126, -1.589967, 0.3686275, 1, 0, 1,
-0.5581834, 1.00282, -1.35533, 0.3607843, 1, 0, 1,
-0.5570332, 0.002424602, 0.5435914, 0.3568628, 1, 0, 1,
-0.5459473, 2.082614, 1.564476, 0.3490196, 1, 0, 1,
-0.5447294, -0.3126045, -1.302253, 0.345098, 1, 0, 1,
-0.5415127, -0.06942589, -3.949179, 0.3372549, 1, 0, 1,
-0.5388765, 0.7663015, 1.528138, 0.3333333, 1, 0, 1,
-0.5361612, -0.5622208, -0.9573888, 0.3254902, 1, 0, 1,
-0.5294389, -0.7311234, -3.910228, 0.3215686, 1, 0, 1,
-0.5292709, 0.6657375, -0.1946364, 0.3137255, 1, 0, 1,
-0.5266546, -0.5964158, -3.269727, 0.3098039, 1, 0, 1,
-0.5264694, -0.8766448, -3.420606, 0.3019608, 1, 0, 1,
-0.5260745, -0.5289216, -2.294789, 0.2941177, 1, 0, 1,
-0.518143, -0.3909717, -1.967466, 0.2901961, 1, 0, 1,
-0.514375, -1.537102, -2.163911, 0.282353, 1, 0, 1,
-0.5108429, -1.087599, -1.378218, 0.2784314, 1, 0, 1,
-0.5100559, -0.8121085, -3.155364, 0.2705882, 1, 0, 1,
-0.5087097, -0.3658796, -1.074926, 0.2666667, 1, 0, 1,
-0.5083625, -0.3788832, -1.879985, 0.2588235, 1, 0, 1,
-0.5073065, 1.905303, -2.292856, 0.254902, 1, 0, 1,
-0.5058519, -0.512171, -2.029502, 0.2470588, 1, 0, 1,
-0.5049333, 1.043823, -1.428415, 0.2431373, 1, 0, 1,
-0.5024117, -0.1313345, -3.024211, 0.2352941, 1, 0, 1,
-0.5018088, 0.5797985, -0.9145385, 0.2313726, 1, 0, 1,
-0.4961617, 0.2576157, -1.699007, 0.2235294, 1, 0, 1,
-0.4901945, -0.8809907, -3.022826, 0.2196078, 1, 0, 1,
-0.4872516, 0.70203, -0.5833921, 0.2117647, 1, 0, 1,
-0.4865985, -0.8850327, -2.033795, 0.2078431, 1, 0, 1,
-0.485603, -1.914845, -2.724245, 0.2, 1, 0, 1,
-0.4851417, -0.7176424, -2.715101, 0.1921569, 1, 0, 1,
-0.4851342, 0.7142159, -0.7154103, 0.1882353, 1, 0, 1,
-0.4825282, 0.7401404, 0.9679013, 0.1803922, 1, 0, 1,
-0.4767542, -0.297728, -1.004843, 0.1764706, 1, 0, 1,
-0.4750568, -0.1418326, -2.34734, 0.1686275, 1, 0, 1,
-0.4713683, -1.398021, -3.258036, 0.1647059, 1, 0, 1,
-0.4690126, 0.7952901, -1.600345, 0.1568628, 1, 0, 1,
-0.4684381, -0.4496199, -1.981463, 0.1529412, 1, 0, 1,
-0.4662473, -0.06285302, -2.286263, 0.145098, 1, 0, 1,
-0.4630867, 1.466926, 2.029899, 0.1411765, 1, 0, 1,
-0.4595359, -0.6811219, -3.652907, 0.1333333, 1, 0, 1,
-0.454915, -0.5615698, -3.031538, 0.1294118, 1, 0, 1,
-0.4535193, 0.6438071, -0.839851, 0.1215686, 1, 0, 1,
-0.4517561, 0.7894876, -0.9263113, 0.1176471, 1, 0, 1,
-0.4495028, 2.246484, 0.03947339, 0.1098039, 1, 0, 1,
-0.4492739, 0.7728001, -0.5498837, 0.1058824, 1, 0, 1,
-0.4475647, -0.2831374, -1.452267, 0.09803922, 1, 0, 1,
-0.4439979, 1.230584, 1.147288, 0.09019608, 1, 0, 1,
-0.4413654, -0.7127178, -2.019819, 0.08627451, 1, 0, 1,
-0.4392222, 0.7579044, -0.9313321, 0.07843138, 1, 0, 1,
-0.4369826, 0.9109531, -0.7289224, 0.07450981, 1, 0, 1,
-0.4338754, 0.1730414, -0.8998599, 0.06666667, 1, 0, 1,
-0.4321355, 0.3475895, 0.553457, 0.0627451, 1, 0, 1,
-0.4299859, 1.897325, 0.6642791, 0.05490196, 1, 0, 1,
-0.4289422, 0.1002602, -2.395533, 0.05098039, 1, 0, 1,
-0.4287244, 0.4713403, -0.4361272, 0.04313726, 1, 0, 1,
-0.4250179, 0.6277486, -0.1255584, 0.03921569, 1, 0, 1,
-0.4238193, -0.4450009, -2.134525, 0.03137255, 1, 0, 1,
-0.4193592, -0.1655735, -2.854362, 0.02745098, 1, 0, 1,
-0.4115878, 0.5974714, -0.1444265, 0.01960784, 1, 0, 1,
-0.40659, 2.084943, -0.8086694, 0.01568628, 1, 0, 1,
-0.4036548, -0.1642848, -0.3403125, 0.007843138, 1, 0, 1,
-0.4033147, 0.4318161, -0.5895059, 0.003921569, 1, 0, 1,
-0.4008923, -2.020371, -2.43913, 0, 1, 0.003921569, 1,
-0.4005162, 0.06183118, -2.585719, 0, 1, 0.01176471, 1,
-0.4000371, -0.9634952, -3.60643, 0, 1, 0.01568628, 1,
-0.39967, -0.7476352, -3.27512, 0, 1, 0.02352941, 1,
-0.3977306, 1.024321, -2.127822, 0, 1, 0.02745098, 1,
-0.3964465, -0.2322236, -1.157638, 0, 1, 0.03529412, 1,
-0.3955415, -0.2564315, -3.147196, 0, 1, 0.03921569, 1,
-0.3940353, -0.2433333, -3.708537, 0, 1, 0.04705882, 1,
-0.3916193, -0.2357496, -3.736581, 0, 1, 0.05098039, 1,
-0.3914323, 0.5636928, -1.342849, 0, 1, 0.05882353, 1,
-0.3910967, -0.751745, -2.276307, 0, 1, 0.0627451, 1,
-0.3895359, -1.305896, -2.413977, 0, 1, 0.07058824, 1,
-0.3891441, -0.769875, -1.163338, 0, 1, 0.07450981, 1,
-0.3874196, -0.1061327, -1.369024, 0, 1, 0.08235294, 1,
-0.3852258, 0.310907, -2.227222, 0, 1, 0.08627451, 1,
-0.3832477, -0.2640959, -1.158059, 0, 1, 0.09411765, 1,
-0.3796407, -0.4711879, -2.50951, 0, 1, 0.1019608, 1,
-0.3770756, -0.3793837, -2.587179, 0, 1, 0.1058824, 1,
-0.3756897, -0.7598141, -1.484887, 0, 1, 0.1137255, 1,
-0.3724547, 2.13355, -0.2479568, 0, 1, 0.1176471, 1,
-0.3691589, 2.683945, 0.9787503, 0, 1, 0.1254902, 1,
-0.3684241, -0.3275411, -2.460231, 0, 1, 0.1294118, 1,
-0.3676406, -0.3112601, -2.484478, 0, 1, 0.1372549, 1,
-0.365235, 0.8474067, -1.119362, 0, 1, 0.1411765, 1,
-0.3630053, 0.06154457, -1.735744, 0, 1, 0.1490196, 1,
-0.362076, 0.1807146, -1.170601, 0, 1, 0.1529412, 1,
-0.3590814, 0.08720817, -0.2563682, 0, 1, 0.1607843, 1,
-0.3509029, -0.4169196, -3.747197, 0, 1, 0.1647059, 1,
-0.3478151, -0.207266, -1.301191, 0, 1, 0.172549, 1,
-0.3473797, 1.062515, 1.144245, 0, 1, 0.1764706, 1,
-0.3472787, -0.1808161, -0.7602169, 0, 1, 0.1843137, 1,
-0.3471538, -0.72094, -2.793686, 0, 1, 0.1882353, 1,
-0.3449221, 2.125009, 1.278935, 0, 1, 0.1960784, 1,
-0.3435247, -1.708898, -2.488312, 0, 1, 0.2039216, 1,
-0.3377834, -2.13186, -2.481101, 0, 1, 0.2078431, 1,
-0.3370371, -0.7463263, -1.937425, 0, 1, 0.2156863, 1,
-0.3328519, -0.4126662, -2.378268, 0, 1, 0.2196078, 1,
-0.3305131, -0.09212449, -0.1690143, 0, 1, 0.227451, 1,
-0.3280271, -0.1065369, -3.81368, 0, 1, 0.2313726, 1,
-0.3280042, 0.07753859, -0.7832034, 0, 1, 0.2392157, 1,
-0.3276605, -0.9904829, -3.220726, 0, 1, 0.2431373, 1,
-0.3264058, -1.627044, -2.808977, 0, 1, 0.2509804, 1,
-0.3240174, 0.04620241, -0.5009734, 0, 1, 0.254902, 1,
-0.3185874, 1.278426, 0.3738573, 0, 1, 0.2627451, 1,
-0.3161973, 0.1795336, -0.6141836, 0, 1, 0.2666667, 1,
-0.3146314, -0.05937228, -3.289312, 0, 1, 0.2745098, 1,
-0.3084105, 0.8618006, -0.007073632, 0, 1, 0.2784314, 1,
-0.3035015, -0.3691461, -2.912093, 0, 1, 0.2862745, 1,
-0.3016362, -0.03342091, -1.745774, 0, 1, 0.2901961, 1,
-0.2943795, -1.777503, -1.697777, 0, 1, 0.2980392, 1,
-0.2942323, 0.4680757, -2.634224, 0, 1, 0.3058824, 1,
-0.2917359, 1.32145, -1.316275, 0, 1, 0.3098039, 1,
-0.2875493, -0.5349125, -0.6107023, 0, 1, 0.3176471, 1,
-0.2850411, 0.9064201, 0.2981802, 0, 1, 0.3215686, 1,
-0.2828917, 0.1272299, -1.84027, 0, 1, 0.3294118, 1,
-0.2817202, 0.922241, -0.2236658, 0, 1, 0.3333333, 1,
-0.2749458, 1.275022, 1.788624, 0, 1, 0.3411765, 1,
-0.2704625, -1.62232, -2.939072, 0, 1, 0.345098, 1,
-0.2669694, -0.5787969, -3.195012, 0, 1, 0.3529412, 1,
-0.26404, 0.2182248, -0.9118351, 0, 1, 0.3568628, 1,
-0.2636169, 1.321529, -0.4596512, 0, 1, 0.3647059, 1,
-0.2577527, 0.2063359, 0.6016162, 0, 1, 0.3686275, 1,
-0.2561313, 0.2340763, -1.126905, 0, 1, 0.3764706, 1,
-0.2554309, 0.2585198, -2.142844, 0, 1, 0.3803922, 1,
-0.2515588, 0.3243069, 0.9072722, 0, 1, 0.3882353, 1,
-0.24938, 0.787028, 0.5475459, 0, 1, 0.3921569, 1,
-0.249299, -1.274114, -3.315933, 0, 1, 0.4, 1,
-0.2477219, 0.7525249, 0.1220326, 0, 1, 0.4078431, 1,
-0.2470252, 0.1861461, -1.15328, 0, 1, 0.4117647, 1,
-0.2394046, -0.3158551, -5.66784, 0, 1, 0.4196078, 1,
-0.2371198, -0.9104691, -1.923396, 0, 1, 0.4235294, 1,
-0.2351232, 0.2124928, -1.022379, 0, 1, 0.4313726, 1,
-0.2324418, 0.01376452, -1.035114, 0, 1, 0.4352941, 1,
-0.2301938, 0.7335221, -1.106911, 0, 1, 0.4431373, 1,
-0.2245645, 0.007472795, -2.755588, 0, 1, 0.4470588, 1,
-0.2241524, 1.13773, 0.9337484, 0, 1, 0.454902, 1,
-0.22298, 0.01192285, 0.2818239, 0, 1, 0.4588235, 1,
-0.2210408, -0.1066317, -2.725665, 0, 1, 0.4666667, 1,
-0.2200903, 0.1695817, -1.690386, 0, 1, 0.4705882, 1,
-0.2197389, -1.546227, -2.447446, 0, 1, 0.4784314, 1,
-0.2159949, 1.071932, 0.6182559, 0, 1, 0.4823529, 1,
-0.214581, 2.143189, -0.4970886, 0, 1, 0.4901961, 1,
-0.2104546, -0.6160631, -1.802045, 0, 1, 0.4941176, 1,
-0.2061523, 1.313367, -0.4338079, 0, 1, 0.5019608, 1,
-0.2042576, 0.9984121, 0.1510446, 0, 1, 0.509804, 1,
-0.2015117, 0.3665277, -0.3712608, 0, 1, 0.5137255, 1,
-0.2002036, 1.11033, -0.6933553, 0, 1, 0.5215687, 1,
-0.1997844, -0.6275984, -3.513492, 0, 1, 0.5254902, 1,
-0.1986005, 2.428101, -0.3701033, 0, 1, 0.5333334, 1,
-0.1985852, 1.113855, -0.8810495, 0, 1, 0.5372549, 1,
-0.1969292, -1.85639, -3.871164, 0, 1, 0.5450981, 1,
-0.1968546, 0.6140662, -1.282582, 0, 1, 0.5490196, 1,
-0.1942425, -1.734785, -3.024603, 0, 1, 0.5568628, 1,
-0.1927001, 0.521835, 0.8911225, 0, 1, 0.5607843, 1,
-0.1906168, -1.006402, -1.407056, 0, 1, 0.5686275, 1,
-0.188482, 0.7205366, -0.165348, 0, 1, 0.572549, 1,
-0.1859257, 1.046203, -1.080665, 0, 1, 0.5803922, 1,
-0.1851658, 1.124749, -0.3081696, 0, 1, 0.5843138, 1,
-0.1848198, -0.2511083, -3.928501, 0, 1, 0.5921569, 1,
-0.17941, -0.8045009, -3.129383, 0, 1, 0.5960785, 1,
-0.1793282, -1.419061, -4.502287, 0, 1, 0.6039216, 1,
-0.179131, -0.7855812, -3.749003, 0, 1, 0.6117647, 1,
-0.1756558, -0.6930083, -2.823126, 0, 1, 0.6156863, 1,
-0.1729038, 0.04048676, -1.801155, 0, 1, 0.6235294, 1,
-0.1726541, -0.3582808, -2.717521, 0, 1, 0.627451, 1,
-0.1715831, -0.3521476, -2.035709, 0, 1, 0.6352941, 1,
-0.1702721, -0.3587511, -1.803754, 0, 1, 0.6392157, 1,
-0.1540893, 0.15641, -1.505153, 0, 1, 0.6470588, 1,
-0.1533831, -0.08425466, -1.698224, 0, 1, 0.6509804, 1,
-0.1473265, -1.180975, -1.957819, 0, 1, 0.6588235, 1,
-0.1468404, -0.02790992, -1.812762, 0, 1, 0.6627451, 1,
-0.1392485, 0.3935601, 0.5373207, 0, 1, 0.6705883, 1,
-0.1386822, 1.412356, 0.659067, 0, 1, 0.6745098, 1,
-0.137299, 0.4909356, -0.1293112, 0, 1, 0.682353, 1,
-0.1366349, 1.075112, -1.290616, 0, 1, 0.6862745, 1,
-0.1253716, 1.344005, -0.4389827, 0, 1, 0.6941177, 1,
-0.1210724, 0.8723425, 0.3633271, 0, 1, 0.7019608, 1,
-0.1200116, -0.449795, -3.518233, 0, 1, 0.7058824, 1,
-0.1170247, -0.01136355, -2.972086, 0, 1, 0.7137255, 1,
-0.1153472, 0.8657817, 0.8138053, 0, 1, 0.7176471, 1,
-0.1142754, -0.4760338, -3.152167, 0, 1, 0.7254902, 1,
-0.1095192, -0.04220154, -0.7112774, 0, 1, 0.7294118, 1,
-0.1066154, -0.9297758, -1.749809, 0, 1, 0.7372549, 1,
-0.1057847, -0.5012959, -3.300454, 0, 1, 0.7411765, 1,
-0.1056793, 1.201419, -0.04411407, 0, 1, 0.7490196, 1,
-0.1029708, 1.734519, -0.2631518, 0, 1, 0.7529412, 1,
-0.1026287, 1.098581, -0.6247407, 0, 1, 0.7607843, 1,
-0.1013763, -0.7503952, -1.87704, 0, 1, 0.7647059, 1,
-0.09871555, 1.65928, -0.6547446, 0, 1, 0.772549, 1,
-0.09397013, -0.7678903, -3.348082, 0, 1, 0.7764706, 1,
-0.08631563, 1.519979, -0.7222701, 0, 1, 0.7843137, 1,
-0.0859549, -1.980633, -2.931596, 0, 1, 0.7882353, 1,
-0.08387148, -0.5725064, -2.296794, 0, 1, 0.7960784, 1,
-0.08258558, 0.3240061, -0.6579029, 0, 1, 0.8039216, 1,
-0.07928602, -0.8191271, -4.41915, 0, 1, 0.8078431, 1,
-0.07919919, 0.4525717, 0.3132498, 0, 1, 0.8156863, 1,
-0.07711001, -1.605561, -2.237237, 0, 1, 0.8196079, 1,
-0.06958122, -1.420087, -2.520126, 0, 1, 0.827451, 1,
-0.06951934, -0.4840002, -2.774878, 0, 1, 0.8313726, 1,
-0.06809334, -0.8978143, -2.2242, 0, 1, 0.8392157, 1,
-0.06704983, 0.2952736, -1.387965, 0, 1, 0.8431373, 1,
-0.06673986, 0.9129599, -0.2321965, 0, 1, 0.8509804, 1,
-0.0656456, -0.128623, -1.387214, 0, 1, 0.854902, 1,
-0.06494761, -0.6034341, -2.667405, 0, 1, 0.8627451, 1,
-0.05559641, -0.3487655, -4.203765, 0, 1, 0.8666667, 1,
-0.05347728, -0.1726753, -3.791483, 0, 1, 0.8745098, 1,
-0.05123679, -1.085298, -4.411891, 0, 1, 0.8784314, 1,
-0.03677408, 0.4180793, -1.148456, 0, 1, 0.8862745, 1,
-0.0346709, 0.4950159, 0.58146, 0, 1, 0.8901961, 1,
-0.03413926, -0.7307731, -4.367435, 0, 1, 0.8980392, 1,
-0.03309455, 0.2998954, -0.07023027, 0, 1, 0.9058824, 1,
-0.03306746, -0.8488118, -4.612415, 0, 1, 0.9098039, 1,
-0.03046146, 1.340665, -0.1040336, 0, 1, 0.9176471, 1,
-0.0287051, -1.234329, -3.979088, 0, 1, 0.9215686, 1,
-0.02686804, 1.004995, -1.309664, 0, 1, 0.9294118, 1,
-0.02641087, -0.01145749, -1.81878, 0, 1, 0.9333333, 1,
-0.0256561, -0.2834403, -3.481511, 0, 1, 0.9411765, 1,
-0.02502245, -0.8762009, -3.431818, 0, 1, 0.945098, 1,
-0.02270124, -0.8665994, -2.728398, 0, 1, 0.9529412, 1,
-0.02193034, -0.2765541, -3.873336, 0, 1, 0.9568627, 1,
-0.01839663, -0.7558132, -2.986768, 0, 1, 0.9647059, 1,
-0.01750807, -0.786847, -5.847845, 0, 1, 0.9686275, 1,
-0.01526973, -0.5909429, -3.700094, 0, 1, 0.9764706, 1,
-0.01524494, -0.3027884, -2.377535, 0, 1, 0.9803922, 1,
-0.01495246, 0.9470128, -0.7268603, 0, 1, 0.9882353, 1,
-0.01429115, 0.1832376, 2.673711, 0, 1, 0.9921569, 1,
-0.01252258, 0.2792059, -0.5195236, 0, 1, 1, 1,
-0.008778146, 0.5917372, -0.2808062, 0, 0.9921569, 1, 1,
-0.008179591, -1.342685, -1.765965, 0, 0.9882353, 1, 1,
-0.002000363, 1.044973, 0.4569492, 0, 0.9803922, 1, 1,
-0.001958095, 0.4999849, -0.2741314, 0, 0.9764706, 1, 1,
0.004068627, -1.747504, 2.67399, 0, 0.9686275, 1, 1,
0.01064861, 1.142663, -0.5541651, 0, 0.9647059, 1, 1,
0.01169749, 0.1437076, -0.09203482, 0, 0.9568627, 1, 1,
0.01550233, 0.2571196, 1.278177, 0, 0.9529412, 1, 1,
0.01678894, 0.1600682, 1.621437, 0, 0.945098, 1, 1,
0.02512717, 0.09205589, 0.8562413, 0, 0.9411765, 1, 1,
0.02736846, 0.7588229, 1.362291, 0, 0.9333333, 1, 1,
0.03030588, 0.3823467, 1.238472, 0, 0.9294118, 1, 1,
0.03064128, -0.8025534, 2.634599, 0, 0.9215686, 1, 1,
0.03133149, -1.906113, 1.68181, 0, 0.9176471, 1, 1,
0.03227827, 0.1786797, -0.9852842, 0, 0.9098039, 1, 1,
0.03358268, -0.4499672, 3.62093, 0, 0.9058824, 1, 1,
0.03400254, -2.040614, 2.9849, 0, 0.8980392, 1, 1,
0.03666761, 2.975624, 0.4455397, 0, 0.8901961, 1, 1,
0.03822363, 1.237661, 1.027651, 0, 0.8862745, 1, 1,
0.04042995, 0.9617764, -1.174096, 0, 0.8784314, 1, 1,
0.04254989, -0.05002043, 0.1944801, 0, 0.8745098, 1, 1,
0.04951338, 1.151455, 0.08581816, 0, 0.8666667, 1, 1,
0.04999095, 0.04921601, -0.6270497, 0, 0.8627451, 1, 1,
0.05175319, 0.6786363, -0.1169662, 0, 0.854902, 1, 1,
0.05266128, -0.5792544, 2.846984, 0, 0.8509804, 1, 1,
0.05446557, 0.8853985, -0.9679385, 0, 0.8431373, 1, 1,
0.05622203, 1.43197, 1.906154, 0, 0.8392157, 1, 1,
0.05714766, 1.234957, 0.8213942, 0, 0.8313726, 1, 1,
0.05724462, -1.606857, 4.300982, 0, 0.827451, 1, 1,
0.06844602, -0.2204699, 3.707125, 0, 0.8196079, 1, 1,
0.06860426, -0.4416743, 3.321423, 0, 0.8156863, 1, 1,
0.06914028, 1.015481, -0.04760763, 0, 0.8078431, 1, 1,
0.07492488, 0.06553466, 0.002293538, 0, 0.8039216, 1, 1,
0.07726888, -0.7319229, 3.660813, 0, 0.7960784, 1, 1,
0.07910683, 0.2761695, -0.5776861, 0, 0.7882353, 1, 1,
0.07959706, 1.195937, 1.321968, 0, 0.7843137, 1, 1,
0.07999728, 1.943172, 2.687036, 0, 0.7764706, 1, 1,
0.08200805, 1.62796, -0.9091806, 0, 0.772549, 1, 1,
0.08317555, -1.399315, 1.933161, 0, 0.7647059, 1, 1,
0.08446427, 0.3417385, 0.04580426, 0, 0.7607843, 1, 1,
0.08621385, -0.2455948, 3.77034, 0, 0.7529412, 1, 1,
0.08693516, 0.8648215, -1.151808, 0, 0.7490196, 1, 1,
0.08777107, 0.4924793, 0.7656681, 0, 0.7411765, 1, 1,
0.08818221, -0.3346297, 3.235255, 0, 0.7372549, 1, 1,
0.08889807, -0.8050339, 2.673184, 0, 0.7294118, 1, 1,
0.08927479, -0.3271162, 2.370053, 0, 0.7254902, 1, 1,
0.09053274, 1.726931, 0.8154656, 0, 0.7176471, 1, 1,
0.09835482, 0.9047649, 2.052908, 0, 0.7137255, 1, 1,
0.1008189, -0.3483002, 3.459049, 0, 0.7058824, 1, 1,
0.102209, -0.00649947, 2.202912, 0, 0.6980392, 1, 1,
0.1067563, -0.8331149, 3.048326, 0, 0.6941177, 1, 1,
0.1068791, 0.5764633, 0.01041665, 0, 0.6862745, 1, 1,
0.1071133, -1.671334, 2.658288, 0, 0.682353, 1, 1,
0.1073439, 0.001694066, 1.573851, 0, 0.6745098, 1, 1,
0.1076475, 0.5432941, 0.5078397, 0, 0.6705883, 1, 1,
0.107666, -0.1255475, 2.937554, 0, 0.6627451, 1, 1,
0.1233822, -1.134443, 3.73152, 0, 0.6588235, 1, 1,
0.125812, 1.711689, 0.5612231, 0, 0.6509804, 1, 1,
0.1259156, 1.305026, -0.5718828, 0, 0.6470588, 1, 1,
0.1265015, 0.281781, 1.102951, 0, 0.6392157, 1, 1,
0.1322447, -0.805038, 3.627229, 0, 0.6352941, 1, 1,
0.1346918, -1.287971, 2.109916, 0, 0.627451, 1, 1,
0.1373718, -0.4766227, 1.459326, 0, 0.6235294, 1, 1,
0.1379721, -0.8547356, 4.168105, 0, 0.6156863, 1, 1,
0.1384809, 1.359799, 1.327837, 0, 0.6117647, 1, 1,
0.1466431, -0.1036983, 2.312989, 0, 0.6039216, 1, 1,
0.1485492, -0.1468138, 1.778644, 0, 0.5960785, 1, 1,
0.1496999, -0.9282413, 2.54254, 0, 0.5921569, 1, 1,
0.1508498, -1.750468, 4.355258, 0, 0.5843138, 1, 1,
0.1547556, 0.04646382, 2.235489, 0, 0.5803922, 1, 1,
0.156954, 2.012188, 0.8784109, 0, 0.572549, 1, 1,
0.1646103, 1.434672, -0.4975368, 0, 0.5686275, 1, 1,
0.1675008, -1.059435, 3.332736, 0, 0.5607843, 1, 1,
0.1676132, 1.715463, -0.4846339, 0, 0.5568628, 1, 1,
0.1690056, -1.054899, 3.722436, 0, 0.5490196, 1, 1,
0.1710096, 0.2691017, -0.2762761, 0, 0.5450981, 1, 1,
0.1710424, 0.984357, -1.370215, 0, 0.5372549, 1, 1,
0.1754234, -0.8995499, 1.960567, 0, 0.5333334, 1, 1,
0.1754536, 1.601539, -0.6650149, 0, 0.5254902, 1, 1,
0.1855089, -0.1596269, 2.116161, 0, 0.5215687, 1, 1,
0.190648, 1.172765, 0.6673434, 0, 0.5137255, 1, 1,
0.1954815, -0.2089126, 2.11796, 0, 0.509804, 1, 1,
0.2014915, 2.760792, -0.02623832, 0, 0.5019608, 1, 1,
0.2036758, 0.3204897, 0.4892214, 0, 0.4941176, 1, 1,
0.2042188, 0.2901873, 1.049295, 0, 0.4901961, 1, 1,
0.2055271, 1.056488, 1.355821, 0, 0.4823529, 1, 1,
0.2058839, 0.852345, 0.2194109, 0, 0.4784314, 1, 1,
0.2068453, -0.08707386, 3.556626, 0, 0.4705882, 1, 1,
0.2095732, 0.9554499, 0.3138664, 0, 0.4666667, 1, 1,
0.2100286, -0.4724465, 2.341439, 0, 0.4588235, 1, 1,
0.2128536, 0.02360698, 1.389272, 0, 0.454902, 1, 1,
0.213193, -0.3141123, 1.399581, 0, 0.4470588, 1, 1,
0.2148553, -1.157438, 3.30772, 0, 0.4431373, 1, 1,
0.2150194, 0.2888171, 0.8667791, 0, 0.4352941, 1, 1,
0.2232956, 0.9944459, 0.05905719, 0, 0.4313726, 1, 1,
0.2235693, 0.3638907, 0.5477022, 0, 0.4235294, 1, 1,
0.2249064, -0.2092167, 2.016326, 0, 0.4196078, 1, 1,
0.2271453, -1.492931, 4.012304, 0, 0.4117647, 1, 1,
0.2283115, 1.041009, -0.3875178, 0, 0.4078431, 1, 1,
0.2301618, -0.23062, 4.462313, 0, 0.4, 1, 1,
0.2337386, -0.03712391, 1.260989, 0, 0.3921569, 1, 1,
0.2374439, -0.4295235, 2.006454, 0, 0.3882353, 1, 1,
0.2383645, 1.666201, 2.1158, 0, 0.3803922, 1, 1,
0.2483063, 0.1556603, 0.383253, 0, 0.3764706, 1, 1,
0.2517309, 1.191354, 3.196991, 0, 0.3686275, 1, 1,
0.2520348, -0.4671016, 3.704945, 0, 0.3647059, 1, 1,
0.2555626, -0.3837982, 1.730329, 0, 0.3568628, 1, 1,
0.2564809, 2.07109, 0.06220804, 0, 0.3529412, 1, 1,
0.2573728, 0.949142, -0.2323888, 0, 0.345098, 1, 1,
0.2653086, 1.578613, 0.9848909, 0, 0.3411765, 1, 1,
0.2690194, -0.2211713, 2.362845, 0, 0.3333333, 1, 1,
0.2698623, 0.5885229, -0.3391144, 0, 0.3294118, 1, 1,
0.272568, -0.7207243, 1.010019, 0, 0.3215686, 1, 1,
0.2772245, 1.962535, -1.286823, 0, 0.3176471, 1, 1,
0.2800357, 2.366126, -0.6824185, 0, 0.3098039, 1, 1,
0.2819695, 0.489498, 0.5443521, 0, 0.3058824, 1, 1,
0.2850838, 0.6514665, 0.67247, 0, 0.2980392, 1, 1,
0.285245, 0.951902, -0.9847838, 0, 0.2901961, 1, 1,
0.2904684, -0.3478129, 0.4128273, 0, 0.2862745, 1, 1,
0.2919686, -0.04224485, 2.049878, 0, 0.2784314, 1, 1,
0.2934236, 0.5249555, 0.7527691, 0, 0.2745098, 1, 1,
0.2960411, -1.678792, 3.684111, 0, 0.2666667, 1, 1,
0.2971664, -2.012501, 1.697748, 0, 0.2627451, 1, 1,
0.3059362, 0.2982488, -0.9854346, 0, 0.254902, 1, 1,
0.3117487, -0.3968503, 1.316874, 0, 0.2509804, 1, 1,
0.3131618, -0.3391598, 2.905122, 0, 0.2431373, 1, 1,
0.3186905, 0.1275904, 1.184318, 0, 0.2392157, 1, 1,
0.3187502, -0.144559, 3.354917, 0, 0.2313726, 1, 1,
0.3191075, -1.539704, 3.99294, 0, 0.227451, 1, 1,
0.3201808, -1.744855, 3.162162, 0, 0.2196078, 1, 1,
0.3207271, 1.27789, 0.8064576, 0, 0.2156863, 1, 1,
0.3224293, -0.183299, 1.605774, 0, 0.2078431, 1, 1,
0.3272825, -0.5336334, 2.927951, 0, 0.2039216, 1, 1,
0.3321811, 0.969763, -0.9661208, 0, 0.1960784, 1, 1,
0.337547, -3.423555, 2.286445, 0, 0.1882353, 1, 1,
0.3432738, 0.9046197, -1.411542, 0, 0.1843137, 1, 1,
0.3452632, 0.1356155, 3.456246, 0, 0.1764706, 1, 1,
0.3558737, 0.682973, 0.3270546, 0, 0.172549, 1, 1,
0.3565476, 0.8526874, 0.3600314, 0, 0.1647059, 1, 1,
0.3582718, 0.9701431, 0.07089593, 0, 0.1607843, 1, 1,
0.3623239, 0.03494769, 3.484328, 0, 0.1529412, 1, 1,
0.3624385, 1.22145, -0.8062885, 0, 0.1490196, 1, 1,
0.3639416, 1.066849, 0.2443032, 0, 0.1411765, 1, 1,
0.3674387, -0.3904798, 2.132457, 0, 0.1372549, 1, 1,
0.3676603, -0.6783076, 3.465203, 0, 0.1294118, 1, 1,
0.3732919, -0.2470733, 1.47602, 0, 0.1254902, 1, 1,
0.3765787, 0.2322576, 1.388726, 0, 0.1176471, 1, 1,
0.3771363, -0.4673152, 3.141803, 0, 0.1137255, 1, 1,
0.3795476, -0.6712656, 3.618088, 0, 0.1058824, 1, 1,
0.3891006, 0.4359792, 2.131642, 0, 0.09803922, 1, 1,
0.3930187, 1.307692, 1.454034, 0, 0.09411765, 1, 1,
0.3991111, -0.3607188, 3.329869, 0, 0.08627451, 1, 1,
0.399176, -0.2862263, 2.445045, 0, 0.08235294, 1, 1,
0.402055, 2.234739, 0.4664874, 0, 0.07450981, 1, 1,
0.4027719, 0.8227192, 1.606429, 0, 0.07058824, 1, 1,
0.4030786, -0.6127047, 2.931417, 0, 0.0627451, 1, 1,
0.4055443, 0.2666616, -0.327834, 0, 0.05882353, 1, 1,
0.4058157, -1.833854, 3.172756, 0, 0.05098039, 1, 1,
0.4068016, -1.84294, 2.740035, 0, 0.04705882, 1, 1,
0.4075003, -0.1552305, 1.790024, 0, 0.03921569, 1, 1,
0.4104275, -0.01690286, 1.236578, 0, 0.03529412, 1, 1,
0.4105402, -0.3517466, 1.43149, 0, 0.02745098, 1, 1,
0.4180932, -1.364189, 4.013807, 0, 0.02352941, 1, 1,
0.4299273, 0.8915877, 0.427855, 0, 0.01568628, 1, 1,
0.4315435, 1.608491, 0.4594906, 0, 0.01176471, 1, 1,
0.434348, -0.4490416, 1.835957, 0, 0.003921569, 1, 1,
0.4353674, 0.5940676, 0.5793135, 0.003921569, 0, 1, 1,
0.4396386, -0.4715551, 0.6258506, 0.007843138, 0, 1, 1,
0.4432602, -2.144974, 3.187734, 0.01568628, 0, 1, 1,
0.4441187, -0.5273279, 2.653578, 0.01960784, 0, 1, 1,
0.4478419, 0.0108905, 1.541961, 0.02745098, 0, 1, 1,
0.4488088, -1.999809, 4.59887, 0.03137255, 0, 1, 1,
0.4560518, -1.641603, 2.742293, 0.03921569, 0, 1, 1,
0.4580277, -0.6024681, 2.327836, 0.04313726, 0, 1, 1,
0.4697683, 0.1552468, 0.5829929, 0.05098039, 0, 1, 1,
0.4706177, 0.4353667, 1.643819, 0.05490196, 0, 1, 1,
0.4718813, -0.1909674, 0.347596, 0.0627451, 0, 1, 1,
0.4727942, -0.2125563, 0.1954882, 0.06666667, 0, 1, 1,
0.4730499, -1.211472, 1.558138, 0.07450981, 0, 1, 1,
0.4739965, 0.8105226, 1.362709, 0.07843138, 0, 1, 1,
0.4741887, -0.2875906, 2.141816, 0.08627451, 0, 1, 1,
0.4840552, -0.6050534, 1.090751, 0.09019608, 0, 1, 1,
0.4857297, 1.074939, 0.04133027, 0.09803922, 0, 1, 1,
0.4880387, 1.074418, 0.8236407, 0.1058824, 0, 1, 1,
0.4932402, -1.388032, 4.808453, 0.1098039, 0, 1, 1,
0.4987521, -1.187773, 3.878931, 0.1176471, 0, 1, 1,
0.5004114, -1.09231, 3.504962, 0.1215686, 0, 1, 1,
0.5049925, 0.4586301, 1.080859, 0.1294118, 0, 1, 1,
0.5067594, -1.722683, 3.048327, 0.1333333, 0, 1, 1,
0.5070181, 1.709991, 0.1098171, 0.1411765, 0, 1, 1,
0.5098168, -0.3760608, 3.866554, 0.145098, 0, 1, 1,
0.5105889, -0.9570283, 5.043862, 0.1529412, 0, 1, 1,
0.5125883, -0.1855725, 2.964987, 0.1568628, 0, 1, 1,
0.5133103, 1.491263, -0.5947626, 0.1647059, 0, 1, 1,
0.5146731, -0.5416963, 2.187951, 0.1686275, 0, 1, 1,
0.516898, 1.560011, 0.07487223, 0.1764706, 0, 1, 1,
0.5173155, 0.7823516, 1.572705, 0.1803922, 0, 1, 1,
0.5238698, -0.5887887, 1.77784, 0.1882353, 0, 1, 1,
0.5293939, 0.2841117, 1.913017, 0.1921569, 0, 1, 1,
0.5299472, 0.02421995, 0.1221463, 0.2, 0, 1, 1,
0.5317201, 0.5537093, 0.963634, 0.2078431, 0, 1, 1,
0.5403782, 0.5114217, 1.473397, 0.2117647, 0, 1, 1,
0.5408466, 0.6889096, 0.1344709, 0.2196078, 0, 1, 1,
0.5433758, -1.273218, 2.334244, 0.2235294, 0, 1, 1,
0.5476499, 1.030776, -0.3191205, 0.2313726, 0, 1, 1,
0.5489442, -0.1207905, 3.922488, 0.2352941, 0, 1, 1,
0.5503947, 0.0947284, -0.2501494, 0.2431373, 0, 1, 1,
0.5513449, 1.195175, -1.275035, 0.2470588, 0, 1, 1,
0.5553917, 0.6234333, 1.161479, 0.254902, 0, 1, 1,
0.5560265, -0.7996897, 1.329587, 0.2588235, 0, 1, 1,
0.5578466, -1.04289, 3.748885, 0.2666667, 0, 1, 1,
0.5635274, 0.7833545, 0.5093981, 0.2705882, 0, 1, 1,
0.5670326, 1.025317, 1.614462, 0.2784314, 0, 1, 1,
0.5679282, 0.474245, 1.0634, 0.282353, 0, 1, 1,
0.5729974, 0.8044785, 0.4702986, 0.2901961, 0, 1, 1,
0.5749378, -0.6844895, 1.369824, 0.2941177, 0, 1, 1,
0.5760809, 1.258959, -0.921524, 0.3019608, 0, 1, 1,
0.5771739, 0.151896, 0.366948, 0.3098039, 0, 1, 1,
0.5819447, -0.7851822, 1.339512, 0.3137255, 0, 1, 1,
0.5882872, -0.6015827, 1.963874, 0.3215686, 0, 1, 1,
0.5890783, -0.008295063, 1.155241, 0.3254902, 0, 1, 1,
0.5914492, 0.08636961, 0.171841, 0.3333333, 0, 1, 1,
0.5933061, 1.561815, 0.4794014, 0.3372549, 0, 1, 1,
0.5941294, -0.1463298, 3.164917, 0.345098, 0, 1, 1,
0.6025645, -1.511458, 3.496157, 0.3490196, 0, 1, 1,
0.6044263, 0.665499, 0.2304413, 0.3568628, 0, 1, 1,
0.604551, -1.718883, 5.160702, 0.3607843, 0, 1, 1,
0.6085894, -0.7113464, 2.580244, 0.3686275, 0, 1, 1,
0.6113943, 0.1629672, 1.596267, 0.372549, 0, 1, 1,
0.6115837, -0.3893397, 2.758405, 0.3803922, 0, 1, 1,
0.615832, -0.8919759, 1.50698, 0.3843137, 0, 1, 1,
0.619481, 0.4401323, -0.2047, 0.3921569, 0, 1, 1,
0.6195865, 1.487973, 0.6743764, 0.3960784, 0, 1, 1,
0.6205084, 0.3808494, 0.9214019, 0.4039216, 0, 1, 1,
0.6210209, 1.521275, 0.02870042, 0.4117647, 0, 1, 1,
0.6246296, -1.463808, 1.284157, 0.4156863, 0, 1, 1,
0.6274543, -1.14979, 2.814284, 0.4235294, 0, 1, 1,
0.6288066, 0.04492024, 1.761214, 0.427451, 0, 1, 1,
0.630367, 0.2198164, 2.164301, 0.4352941, 0, 1, 1,
0.6377003, 0.07809906, 1.941324, 0.4392157, 0, 1, 1,
0.6411836, 2.137375, -0.1167955, 0.4470588, 0, 1, 1,
0.6429798, 0.1635534, 2.021112, 0.4509804, 0, 1, 1,
0.6449004, -0.8082503, 2.516523, 0.4588235, 0, 1, 1,
0.6455532, -0.2082129, 2.058669, 0.4627451, 0, 1, 1,
0.6523857, 0.3219778, 1.37373, 0.4705882, 0, 1, 1,
0.6644055, 0.2124895, 1.274064, 0.4745098, 0, 1, 1,
0.6724079, 1.269853, -1.329121, 0.4823529, 0, 1, 1,
0.6750141, 0.3066885, 0.6197542, 0.4862745, 0, 1, 1,
0.6758279, -0.563233, 1.953586, 0.4941176, 0, 1, 1,
0.6813601, 0.5153075, 0.3237333, 0.5019608, 0, 1, 1,
0.6885617, -1.69085, 2.304633, 0.5058824, 0, 1, 1,
0.6899452, -0.6683033, 1.646719, 0.5137255, 0, 1, 1,
0.6926001, -0.599902, 1.562021, 0.5176471, 0, 1, 1,
0.6927205, 1.617798, 0.5584934, 0.5254902, 0, 1, 1,
0.6964538, -0.7183419, 1.211767, 0.5294118, 0, 1, 1,
0.6970934, 1.806272, -0.2102407, 0.5372549, 0, 1, 1,
0.6983246, -0.8612618, 3.075893, 0.5411765, 0, 1, 1,
0.6999456, -0.6297252, 2.220432, 0.5490196, 0, 1, 1,
0.7002667, 0.07027587, 1.8253, 0.5529412, 0, 1, 1,
0.7024257, -0.7186331, 1.959522, 0.5607843, 0, 1, 1,
0.7032706, 1.237406, -0.742134, 0.5647059, 0, 1, 1,
0.7036942, -0.668911, 0.5633039, 0.572549, 0, 1, 1,
0.7056066, -1.702938, 4.146904, 0.5764706, 0, 1, 1,
0.7079228, 0.1252033, -0.3001281, 0.5843138, 0, 1, 1,
0.7081625, -0.2245028, 2.472713, 0.5882353, 0, 1, 1,
0.7088845, -2.18167, 3.403605, 0.5960785, 0, 1, 1,
0.7089953, -0.2502793, 1.87062, 0.6039216, 0, 1, 1,
0.7090707, 0.6125944, 0.9726759, 0.6078432, 0, 1, 1,
0.7122458, 1.673561, -1.070041, 0.6156863, 0, 1, 1,
0.7127261, 1.463354, -0.5963218, 0.6196079, 0, 1, 1,
0.7140457, -1.100711, 2.683307, 0.627451, 0, 1, 1,
0.7147942, 0.250214, 0.06180265, 0.6313726, 0, 1, 1,
0.7162249, -0.04674698, 1.849443, 0.6392157, 0, 1, 1,
0.7170765, 0.1783387, 2.517189, 0.6431373, 0, 1, 1,
0.7174441, -0.735162, 1.5749, 0.6509804, 0, 1, 1,
0.723748, -0.5321788, 1.737865, 0.654902, 0, 1, 1,
0.7267774, -1.514833, 2.523227, 0.6627451, 0, 1, 1,
0.7318503, -1.776756, 3.10693, 0.6666667, 0, 1, 1,
0.7459098, 0.6511106, 0.4844179, 0.6745098, 0, 1, 1,
0.752422, 0.4425313, 3.463051, 0.6784314, 0, 1, 1,
0.754641, -0.08145264, 0.4193327, 0.6862745, 0, 1, 1,
0.7564516, 0.2719887, 3.215672, 0.6901961, 0, 1, 1,
0.7566917, -1.531502, 4.094824, 0.6980392, 0, 1, 1,
0.7600402, -0.8458367, 2.309019, 0.7058824, 0, 1, 1,
0.7617968, 0.3126195, 1.583535, 0.7098039, 0, 1, 1,
0.7633975, -0.02780437, 2.847883, 0.7176471, 0, 1, 1,
0.7666857, 0.9266025, -0.3840915, 0.7215686, 0, 1, 1,
0.7723607, 0.2274754, 0.976523, 0.7294118, 0, 1, 1,
0.7775607, -1.293008, 2.9954, 0.7333333, 0, 1, 1,
0.7792178, 1.1923, -0.7923079, 0.7411765, 0, 1, 1,
0.7811838, 1.305359, -0.9183838, 0.7450981, 0, 1, 1,
0.7823828, 0.6950567, 1.841405, 0.7529412, 0, 1, 1,
0.7838769, 1.589012, 0.2207405, 0.7568628, 0, 1, 1,
0.7882648, 0.06207186, 1.263506, 0.7647059, 0, 1, 1,
0.8070986, -1.229526, 4.446135, 0.7686275, 0, 1, 1,
0.8096749, 1.205318, 0.03463055, 0.7764706, 0, 1, 1,
0.8097672, -1.216073, 0.8373688, 0.7803922, 0, 1, 1,
0.8101028, -0.3908888, 3.693907, 0.7882353, 0, 1, 1,
0.8201844, 0.1111172, 1.755671, 0.7921569, 0, 1, 1,
0.822417, 0.7990904, 2.64329, 0.8, 0, 1, 1,
0.8283724, -0.4589283, 2.896958, 0.8078431, 0, 1, 1,
0.830614, 0.8184777, 0.2819562, 0.8117647, 0, 1, 1,
0.8321851, -2.185186, 4.423036, 0.8196079, 0, 1, 1,
0.8372573, 0.6320375, 0.6789001, 0.8235294, 0, 1, 1,
0.8373538, 1.13316, 0.8724158, 0.8313726, 0, 1, 1,
0.8408123, -0.5225888, 1.883076, 0.8352941, 0, 1, 1,
0.8574604, -1.702573, 2.538018, 0.8431373, 0, 1, 1,
0.8622098, 0.4379277, 0.9171433, 0.8470588, 0, 1, 1,
0.8636779, 0.5874082, 1.452224, 0.854902, 0, 1, 1,
0.8685654, 0.03197607, 0.1244119, 0.8588235, 0, 1, 1,
0.8694802, -2.251616, 3.323753, 0.8666667, 0, 1, 1,
0.8723242, -0.8013361, 3.037297, 0.8705882, 0, 1, 1,
0.8787597, 0.6884143, 0.2374659, 0.8784314, 0, 1, 1,
0.880782, 0.6633, 1.192151, 0.8823529, 0, 1, 1,
0.8816726, 1.51452, -0.0107379, 0.8901961, 0, 1, 1,
0.8830813, 1.036729, 1.731273, 0.8941177, 0, 1, 1,
0.8851569, -1.845794, 1.862037, 0.9019608, 0, 1, 1,
0.8913324, 0.6999577, 0.9926258, 0.9098039, 0, 1, 1,
0.8935689, 0.4041098, 1.367657, 0.9137255, 0, 1, 1,
0.8941439, -1.313407, 0.7500057, 0.9215686, 0, 1, 1,
0.8948569, 0.1952005, 0.8888051, 0.9254902, 0, 1, 1,
0.8972283, -0.08107392, 1.536468, 0.9333333, 0, 1, 1,
0.8985551, -0.02154421, 2.233845, 0.9372549, 0, 1, 1,
0.8990036, 0.7118124, 1.231026, 0.945098, 0, 1, 1,
0.9036263, 0.5656347, 2.842048, 0.9490196, 0, 1, 1,
0.904045, 1.419401, -0.2985898, 0.9568627, 0, 1, 1,
0.9125443, -0.4386246, 1.725476, 0.9607843, 0, 1, 1,
0.9194605, 0.4314368, 1.120871, 0.9686275, 0, 1, 1,
0.9202081, 0.5071423, 0.6580646, 0.972549, 0, 1, 1,
0.9270778, 0.4119892, 0.2971362, 0.9803922, 0, 1, 1,
0.9276187, -0.4202106, 1.444442, 0.9843137, 0, 1, 1,
0.9306167, -1.186996, 2.596688, 0.9921569, 0, 1, 1,
0.9328537, 0.5162802, 1.093769, 0.9960784, 0, 1, 1,
0.9439499, -0.4339325, 2.706329, 1, 0, 0.9960784, 1,
0.9442131, 1.396902, -1.662502, 1, 0, 0.9882353, 1,
0.947054, -1.355844, 3.506247, 1, 0, 0.9843137, 1,
0.949246, -0.5391133, 1.547691, 1, 0, 0.9764706, 1,
0.9503878, 0.2714314, 0.1805291, 1, 0, 0.972549, 1,
0.9535235, -1.428452, 3.504339, 1, 0, 0.9647059, 1,
0.9552897, 1.370856, 0.5267087, 1, 0, 0.9607843, 1,
0.9570701, -0.2369856, 1.533894, 1, 0, 0.9529412, 1,
0.9695256, 0.768732, 0.3335791, 1, 0, 0.9490196, 1,
0.9697108, 0.2800247, 1.635882, 1, 0, 0.9411765, 1,
0.9780134, -0.1677021, 2.264494, 1, 0, 0.9372549, 1,
0.9815972, 1.049196, 0.2661426, 1, 0, 0.9294118, 1,
0.9915746, -0.9518385, 1.022624, 1, 0, 0.9254902, 1,
0.9997227, -0.01040114, 1.321313, 1, 0, 0.9176471, 1,
1.001422, 0.828811, 0.4147182, 1, 0, 0.9137255, 1,
1.003592, -1.755882, 3.339231, 1, 0, 0.9058824, 1,
1.005567, 1.314924, -0.3841094, 1, 0, 0.9019608, 1,
1.007839, -0.2647806, 2.865002, 1, 0, 0.8941177, 1,
1.009473, 1.344075, 0.1399219, 1, 0, 0.8862745, 1,
1.014495, -1.266381, 0.6042098, 1, 0, 0.8823529, 1,
1.019854, 0.2281209, 0.9624281, 1, 0, 0.8745098, 1,
1.027203, -0.4964218, 1.563576, 1, 0, 0.8705882, 1,
1.028847, -0.04307105, 1.151435, 1, 0, 0.8627451, 1,
1.031961, -1.67082, 3.872499, 1, 0, 0.8588235, 1,
1.036622, 0.5614318, 1.907379, 1, 0, 0.8509804, 1,
1.050485, -1.436509, 1.477796, 1, 0, 0.8470588, 1,
1.053267, -1.521756, 3.487166, 1, 0, 0.8392157, 1,
1.055697, -0.1165089, 2.993284, 1, 0, 0.8352941, 1,
1.056119, 0.9556355, -0.1713605, 1, 0, 0.827451, 1,
1.057607, -0.9076955, 0.9361145, 1, 0, 0.8235294, 1,
1.058796, 0.3217911, 0.5002828, 1, 0, 0.8156863, 1,
1.066729, 0.07191128, 0.4358393, 1, 0, 0.8117647, 1,
1.068611, -1.836801, 3.418692, 1, 0, 0.8039216, 1,
1.081936, -2.254481, 4.135738, 1, 0, 0.7960784, 1,
1.082536, 0.1864797, 2.891333, 1, 0, 0.7921569, 1,
1.085142, -1.001323, 1.891532, 1, 0, 0.7843137, 1,
1.088451, 0.1829764, 1.291967, 1, 0, 0.7803922, 1,
1.095061, 0.2296698, 0.3270775, 1, 0, 0.772549, 1,
1.095105, -1.312407, 2.66002, 1, 0, 0.7686275, 1,
1.096873, 0.8016109, 0.2347706, 1, 0, 0.7607843, 1,
1.09928, 0.2331593, 0.3843037, 1, 0, 0.7568628, 1,
1.113824, 0.7030627, -0.617936, 1, 0, 0.7490196, 1,
1.119319, 1.225084, 0.6655356, 1, 0, 0.7450981, 1,
1.122862, 0.2167845, 0.8713818, 1, 0, 0.7372549, 1,
1.128425, 1.650368, -1.060984, 1, 0, 0.7333333, 1,
1.137784, 0.9332982, 3.496859, 1, 0, 0.7254902, 1,
1.139491, -0.007381314, 3.245172, 1, 0, 0.7215686, 1,
1.142157, -1.9404, 2.743823, 1, 0, 0.7137255, 1,
1.146845, 0.8905616, 0.4458236, 1, 0, 0.7098039, 1,
1.151326, 0.5926498, 0.02354464, 1, 0, 0.7019608, 1,
1.154208, -1.781741, 2.333857, 1, 0, 0.6941177, 1,
1.15512, -0.7895662, 2.080349, 1, 0, 0.6901961, 1,
1.156404, 1.308615, 0.7754714, 1, 0, 0.682353, 1,
1.160822, -0.7097906, 2.153588, 1, 0, 0.6784314, 1,
1.1652, 0.02119546, 1.269033, 1, 0, 0.6705883, 1,
1.183834, -0.1681325, 0.795309, 1, 0, 0.6666667, 1,
1.191488, -1.187908, 1.296573, 1, 0, 0.6588235, 1,
1.193481, 0.3237237, -0.0320323, 1, 0, 0.654902, 1,
1.199756, 0.6988563, 2.331743, 1, 0, 0.6470588, 1,
1.199936, -1.918188, 0.7976572, 1, 0, 0.6431373, 1,
1.207867, -1.719714, 2.60654, 1, 0, 0.6352941, 1,
1.213497, -0.03979072, 1.078772, 1, 0, 0.6313726, 1,
1.21553, -1.181012, 0.8441117, 1, 0, 0.6235294, 1,
1.220098, -0.4331877, 1.320439, 1, 0, 0.6196079, 1,
1.221823, 0.3946371, -1.230123, 1, 0, 0.6117647, 1,
1.25019, 1.167594, 0.7861124, 1, 0, 0.6078432, 1,
1.261984, 0.5634817, -0.6592529, 1, 0, 0.6, 1,
1.262116, 0.2070886, 0.464174, 1, 0, 0.5921569, 1,
1.265627, -0.5103253, 1.221331, 1, 0, 0.5882353, 1,
1.268495, -0.851965, 2.315486, 1, 0, 0.5803922, 1,
1.276523, 0.8521658, -0.6952905, 1, 0, 0.5764706, 1,
1.281173, -0.8495683, 1.396623, 1, 0, 0.5686275, 1,
1.285428, 0.3052602, 1.616284, 1, 0, 0.5647059, 1,
1.286246, 0.667338, 0.5429569, 1, 0, 0.5568628, 1,
1.295619, 0.3618058, 2.179861, 1, 0, 0.5529412, 1,
1.296899, 0.2010486, 3.110045, 1, 0, 0.5450981, 1,
1.317012, -0.3259446, 1.771124, 1, 0, 0.5411765, 1,
1.320993, -1.086312, 1.870993, 1, 0, 0.5333334, 1,
1.324225, 0.2720252, 1.724227, 1, 0, 0.5294118, 1,
1.344349, 0.6723439, 1.145208, 1, 0, 0.5215687, 1,
1.349691, -0.2676278, 1.300061, 1, 0, 0.5176471, 1,
1.351153, 0.2863951, 0.2762797, 1, 0, 0.509804, 1,
1.35579, 1.458204, 1.512281, 1, 0, 0.5058824, 1,
1.383155, -0.1298389, 0.1125218, 1, 0, 0.4980392, 1,
1.388167, 0.5686623, -1.557898, 1, 0, 0.4901961, 1,
1.391495, 1.210266, 0.9188288, 1, 0, 0.4862745, 1,
1.392445, 0.3292781, -0.1600176, 1, 0, 0.4784314, 1,
1.394621, -1.925939, 1.440365, 1, 0, 0.4745098, 1,
1.395606, -0.5437152, -0.3261362, 1, 0, 0.4666667, 1,
1.404753, -1.22527, 1.242264, 1, 0, 0.4627451, 1,
1.41775, 2.305093, -0.06464909, 1, 0, 0.454902, 1,
1.418486, 2.029127, -0.1244183, 1, 0, 0.4509804, 1,
1.422683, -1.76085, 2.61059, 1, 0, 0.4431373, 1,
1.428003, -0.7232171, 1.998748, 1, 0, 0.4392157, 1,
1.455037, 1.865856, 0.0764828, 1, 0, 0.4313726, 1,
1.465035, 0.758444, 2.11892, 1, 0, 0.427451, 1,
1.465063, -1.09646, 4.322358, 1, 0, 0.4196078, 1,
1.465278, 1.611455, -0.5196704, 1, 0, 0.4156863, 1,
1.466786, -1.322861, 2.576855, 1, 0, 0.4078431, 1,
1.473045, 1.414366, 2.742034, 1, 0, 0.4039216, 1,
1.482582, -0.2110078, 2.51633, 1, 0, 0.3960784, 1,
1.484727, 0.1574319, 0.9973114, 1, 0, 0.3882353, 1,
1.50252, -0.09011768, 0.8173323, 1, 0, 0.3843137, 1,
1.506427, -0.1712349, 1.664248, 1, 0, 0.3764706, 1,
1.516643, 0.5570229, 2.144597, 1, 0, 0.372549, 1,
1.524941, 0.5095312, -0.8033353, 1, 0, 0.3647059, 1,
1.525387, 2.871879, 1.768771, 1, 0, 0.3607843, 1,
1.548872, 1.182674, 2.095798, 1, 0, 0.3529412, 1,
1.556949, 0.6683777, 1.185887, 1, 0, 0.3490196, 1,
1.560388, -1.1196, 3.171795, 1, 0, 0.3411765, 1,
1.578829, 0.9677401, 1.502028, 1, 0, 0.3372549, 1,
1.581896, -1.443355, 2.791397, 1, 0, 0.3294118, 1,
1.582261, 1.799244, 0.1602427, 1, 0, 0.3254902, 1,
1.594009, 0.4637145, 0.580107, 1, 0, 0.3176471, 1,
1.607033, 1.743022, 0.3534964, 1, 0, 0.3137255, 1,
1.620148, -0.06913617, 0.6733869, 1, 0, 0.3058824, 1,
1.627674, -0.3121019, 1.379184, 1, 0, 0.2980392, 1,
1.649413, -0.1818002, 1.348573, 1, 0, 0.2941177, 1,
1.667699, -0.3516069, 1.805558, 1, 0, 0.2862745, 1,
1.667934, -0.4033462, -0.1569172, 1, 0, 0.282353, 1,
1.669651, -1.089137, 1.391054, 1, 0, 0.2745098, 1,
1.672656, 0.3798194, 1.42669, 1, 0, 0.2705882, 1,
1.674037, 1.501527, 0.3890571, 1, 0, 0.2627451, 1,
1.689347, 0.04175986, 1.85186, 1, 0, 0.2588235, 1,
1.723454, -0.0398133, 2.278043, 1, 0, 0.2509804, 1,
1.751904, -0.1397191, 2.074341, 1, 0, 0.2470588, 1,
1.754611, 0.01422955, 0.2815473, 1, 0, 0.2392157, 1,
1.761582, 1.208885, -0.09510991, 1, 0, 0.2352941, 1,
1.7616, 0.3547009, -0.524307, 1, 0, 0.227451, 1,
1.766494, -0.9566951, 2.197357, 1, 0, 0.2235294, 1,
1.786378, -0.04888115, 1.586558, 1, 0, 0.2156863, 1,
1.815183, -0.4433008, 1.82686, 1, 0, 0.2117647, 1,
1.81528, -0.8515793, 3.503636, 1, 0, 0.2039216, 1,
1.819288, -1.95758, 1.898381, 1, 0, 0.1960784, 1,
1.82006, -0.619639, 1.020555, 1, 0, 0.1921569, 1,
1.8359, -2.256887, 3.488207, 1, 0, 0.1843137, 1,
1.846627, -1.277262, 1.1755, 1, 0, 0.1803922, 1,
1.869198, -1.178803, 0.6337428, 1, 0, 0.172549, 1,
1.883601, -1.966076, 1.519104, 1, 0, 0.1686275, 1,
1.8902, -0.5004424, 2.900765, 1, 0, 0.1607843, 1,
1.899697, 0.9678545, -0.005974432, 1, 0, 0.1568628, 1,
1.908797, 0.5614083, 2.571659, 1, 0, 0.1490196, 1,
1.927652, -0.5976432, 2.179091, 1, 0, 0.145098, 1,
1.928769, -0.08586695, 2.423833, 1, 0, 0.1372549, 1,
1.930681, -0.8842769, 1.360413, 1, 0, 0.1333333, 1,
1.975306, -1.364534, 4.675232, 1, 0, 0.1254902, 1,
2.023715, -0.7385119, 1.829121, 1, 0, 0.1215686, 1,
2.034098, 0.8187898, 0.7653186, 1, 0, 0.1137255, 1,
2.050774, 0.1647802, 1.65499, 1, 0, 0.1098039, 1,
2.062527, 0.8246697, 1.040161, 1, 0, 0.1019608, 1,
2.083359, 0.04802517, 2.155846, 1, 0, 0.09411765, 1,
2.086434, 1.238827, -1.199472, 1, 0, 0.09019608, 1,
2.10151, 1.34113, 2.578733, 1, 0, 0.08235294, 1,
2.12411, 0.5488478, 0.8593979, 1, 0, 0.07843138, 1,
2.167628, 0.1615664, 1.450968, 1, 0, 0.07058824, 1,
2.193195, 0.4301896, 1.464362, 1, 0, 0.06666667, 1,
2.199468, -1.099366, 2.044548, 1, 0, 0.05882353, 1,
2.237039, -0.1365406, 2.626147, 1, 0, 0.05490196, 1,
2.241498, -0.2047487, 1.310626, 1, 0, 0.04705882, 1,
2.281931, -0.2397549, 0.8006463, 1, 0, 0.04313726, 1,
2.286389, -0.1320367, 2.312105, 1, 0, 0.03529412, 1,
2.332753, 0.754449, 1.598074, 1, 0, 0.03137255, 1,
2.498787, -0.3862799, 1.567666, 1, 0, 0.02352941, 1,
2.696394, 0.0827619, 3.219024, 1, 0, 0.01960784, 1,
2.732224, -0.9120145, 2.826465, 1, 0, 0.01176471, 1,
2.740622, 0.3704162, 1.161717, 1, 0, 0.007843138, 1
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
-0.3591408, -4.508215, -7.713793, 0, -0.5, 0.5, 0.5,
-0.3591408, -4.508215, -7.713793, 1, -0.5, 0.5, 0.5,
-0.3591408, -4.508215, -7.713793, 1, 1.5, 0.5, 0.5,
-0.3591408, -4.508215, -7.713793, 0, 1.5, 0.5, 0.5
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
-4.509723, -0.2239654, -7.713793, 0, -0.5, 0.5, 0.5,
-4.509723, -0.2239654, -7.713793, 1, -0.5, 0.5, 0.5,
-4.509723, -0.2239654, -7.713793, 1, 1.5, 0.5, 0.5,
-4.509723, -0.2239654, -7.713793, 0, 1.5, 0.5, 0.5
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
-4.509723, -4.508215, -0.3435714, 0, -0.5, 0.5, 0.5,
-4.509723, -4.508215, -0.3435714, 1, -0.5, 0.5, 0.5,
-4.509723, -4.508215, -0.3435714, 1, 1.5, 0.5, 0.5,
-4.509723, -4.508215, -0.3435714, 0, 1.5, 0.5, 0.5
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
-3, -3.519542, -6.012973,
2, -3.519542, -6.012973,
-3, -3.519542, -6.012973,
-3, -3.684321, -6.296443,
-2, -3.519542, -6.012973,
-2, -3.684321, -6.296443,
-1, -3.519542, -6.012973,
-1, -3.684321, -6.296443,
0, -3.519542, -6.012973,
0, -3.684321, -6.296443,
1, -3.519542, -6.012973,
1, -3.684321, -6.296443,
2, -3.519542, -6.012973,
2, -3.684321, -6.296443
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
-3, -4.013879, -6.863383, 0, -0.5, 0.5, 0.5,
-3, -4.013879, -6.863383, 1, -0.5, 0.5, 0.5,
-3, -4.013879, -6.863383, 1, 1.5, 0.5, 0.5,
-3, -4.013879, -6.863383, 0, 1.5, 0.5, 0.5,
-2, -4.013879, -6.863383, 0, -0.5, 0.5, 0.5,
-2, -4.013879, -6.863383, 1, -0.5, 0.5, 0.5,
-2, -4.013879, -6.863383, 1, 1.5, 0.5, 0.5,
-2, -4.013879, -6.863383, 0, 1.5, 0.5, 0.5,
-1, -4.013879, -6.863383, 0, -0.5, 0.5, 0.5,
-1, -4.013879, -6.863383, 1, -0.5, 0.5, 0.5,
-1, -4.013879, -6.863383, 1, 1.5, 0.5, 0.5,
-1, -4.013879, -6.863383, 0, 1.5, 0.5, 0.5,
0, -4.013879, -6.863383, 0, -0.5, 0.5, 0.5,
0, -4.013879, -6.863383, 1, -0.5, 0.5, 0.5,
0, -4.013879, -6.863383, 1, 1.5, 0.5, 0.5,
0, -4.013879, -6.863383, 0, 1.5, 0.5, 0.5,
1, -4.013879, -6.863383, 0, -0.5, 0.5, 0.5,
1, -4.013879, -6.863383, 1, -0.5, 0.5, 0.5,
1, -4.013879, -6.863383, 1, 1.5, 0.5, 0.5,
1, -4.013879, -6.863383, 0, 1.5, 0.5, 0.5,
2, -4.013879, -6.863383, 0, -0.5, 0.5, 0.5,
2, -4.013879, -6.863383, 1, -0.5, 0.5, 0.5,
2, -4.013879, -6.863383, 1, 1.5, 0.5, 0.5,
2, -4.013879, -6.863383, 0, 1.5, 0.5, 0.5
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
-3.551896, -3, -6.012973,
-3.551896, 2, -6.012973,
-3.551896, -3, -6.012973,
-3.711534, -3, -6.296443,
-3.551896, -2, -6.012973,
-3.711534, -2, -6.296443,
-3.551896, -1, -6.012973,
-3.711534, -1, -6.296443,
-3.551896, 0, -6.012973,
-3.711534, 0, -6.296443,
-3.551896, 1, -6.012973,
-3.711534, 1, -6.296443,
-3.551896, 2, -6.012973,
-3.711534, 2, -6.296443
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
-4.030809, -3, -6.863383, 0, -0.5, 0.5, 0.5,
-4.030809, -3, -6.863383, 1, -0.5, 0.5, 0.5,
-4.030809, -3, -6.863383, 1, 1.5, 0.5, 0.5,
-4.030809, -3, -6.863383, 0, 1.5, 0.5, 0.5,
-4.030809, -2, -6.863383, 0, -0.5, 0.5, 0.5,
-4.030809, -2, -6.863383, 1, -0.5, 0.5, 0.5,
-4.030809, -2, -6.863383, 1, 1.5, 0.5, 0.5,
-4.030809, -2, -6.863383, 0, 1.5, 0.5, 0.5,
-4.030809, -1, -6.863383, 0, -0.5, 0.5, 0.5,
-4.030809, -1, -6.863383, 1, -0.5, 0.5, 0.5,
-4.030809, -1, -6.863383, 1, 1.5, 0.5, 0.5,
-4.030809, -1, -6.863383, 0, 1.5, 0.5, 0.5,
-4.030809, 0, -6.863383, 0, -0.5, 0.5, 0.5,
-4.030809, 0, -6.863383, 1, -0.5, 0.5, 0.5,
-4.030809, 0, -6.863383, 1, 1.5, 0.5, 0.5,
-4.030809, 0, -6.863383, 0, 1.5, 0.5, 0.5,
-4.030809, 1, -6.863383, 0, -0.5, 0.5, 0.5,
-4.030809, 1, -6.863383, 1, -0.5, 0.5, 0.5,
-4.030809, 1, -6.863383, 1, 1.5, 0.5, 0.5,
-4.030809, 1, -6.863383, 0, 1.5, 0.5, 0.5,
-4.030809, 2, -6.863383, 0, -0.5, 0.5, 0.5,
-4.030809, 2, -6.863383, 1, -0.5, 0.5, 0.5,
-4.030809, 2, -6.863383, 1, 1.5, 0.5, 0.5,
-4.030809, 2, -6.863383, 0, 1.5, 0.5, 0.5
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
-3.551896, -3.519542, -4,
-3.551896, -3.519542, 4,
-3.551896, -3.519542, -4,
-3.711534, -3.684321, -4,
-3.551896, -3.519542, -2,
-3.711534, -3.684321, -2,
-3.551896, -3.519542, 0,
-3.711534, -3.684321, 0,
-3.551896, -3.519542, 2,
-3.711534, -3.684321, 2,
-3.551896, -3.519542, 4,
-3.711534, -3.684321, 4
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
-4.030809, -4.013879, -4, 0, -0.5, 0.5, 0.5,
-4.030809, -4.013879, -4, 1, -0.5, 0.5, 0.5,
-4.030809, -4.013879, -4, 1, 1.5, 0.5, 0.5,
-4.030809, -4.013879, -4, 0, 1.5, 0.5, 0.5,
-4.030809, -4.013879, -2, 0, -0.5, 0.5, 0.5,
-4.030809, -4.013879, -2, 1, -0.5, 0.5, 0.5,
-4.030809, -4.013879, -2, 1, 1.5, 0.5, 0.5,
-4.030809, -4.013879, -2, 0, 1.5, 0.5, 0.5,
-4.030809, -4.013879, 0, 0, -0.5, 0.5, 0.5,
-4.030809, -4.013879, 0, 1, -0.5, 0.5, 0.5,
-4.030809, -4.013879, 0, 1, 1.5, 0.5, 0.5,
-4.030809, -4.013879, 0, 0, 1.5, 0.5, 0.5,
-4.030809, -4.013879, 2, 0, -0.5, 0.5, 0.5,
-4.030809, -4.013879, 2, 1, -0.5, 0.5, 0.5,
-4.030809, -4.013879, 2, 1, 1.5, 0.5, 0.5,
-4.030809, -4.013879, 2, 0, 1.5, 0.5, 0.5,
-4.030809, -4.013879, 4, 0, -0.5, 0.5, 0.5,
-4.030809, -4.013879, 4, 1, -0.5, 0.5, 0.5,
-4.030809, -4.013879, 4, 1, 1.5, 0.5, 0.5,
-4.030809, -4.013879, 4, 0, 1.5, 0.5, 0.5
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
-3.551896, -3.519542, -6.012973,
-3.551896, 3.071611, -6.012973,
-3.551896, -3.519542, 5.32583,
-3.551896, 3.071611, 5.32583,
-3.551896, -3.519542, -6.012973,
-3.551896, -3.519542, 5.32583,
-3.551896, 3.071611, -6.012973,
-3.551896, 3.071611, 5.32583,
-3.551896, -3.519542, -6.012973,
2.833615, -3.519542, -6.012973,
-3.551896, -3.519542, 5.32583,
2.833615, -3.519542, 5.32583,
-3.551896, 3.071611, -6.012973,
2.833615, 3.071611, -6.012973,
-3.551896, 3.071611, 5.32583,
2.833615, 3.071611, 5.32583,
2.833615, -3.519542, -6.012973,
2.833615, 3.071611, -6.012973,
2.833615, -3.519542, 5.32583,
2.833615, 3.071611, 5.32583,
2.833615, -3.519542, -6.012973,
2.833615, -3.519542, 5.32583,
2.833615, 3.071611, -6.012973,
2.833615, 3.071611, 5.32583
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
var radius = 7.789283;
var distance = 34.6554;
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
mvMatrix.translate( 0.3591408, 0.2239654, 0.3435714 );
mvMatrix.scale( 1.318912, 1.277762, 0.7427527 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.6554);
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
prosulfocarb<-read.table("prosulfocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prosulfocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'prosulfocarb' not found
```

```r
y<-prosulfocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'prosulfocarb' not found
```

```r
z<-prosulfocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'prosulfocarb' not found
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
-3.458903, -0.04011049, -0.3684847, 0, 0, 1, 1, 1,
-3.229871, -0.7103074, -2.141731, 1, 0, 0, 1, 1,
-2.633033, -0.1080307, -1.139899, 1, 0, 0, 1, 1,
-2.628291, -1.214028, -2.168564, 1, 0, 0, 1, 1,
-2.577685, -1.129344, -1.722434, 1, 0, 0, 1, 1,
-2.505591, 0.1062221, -0.4358592, 1, 0, 0, 1, 1,
-2.484459, -1.420581, -2.271172, 0, 0, 0, 1, 1,
-2.466422, 0.2445945, -1.429942, 0, 0, 0, 1, 1,
-2.369824, -1.643489, -0.9146277, 0, 0, 0, 1, 1,
-2.223429, 1.232286, -1.381754, 0, 0, 0, 1, 1,
-2.155591, -0.3877291, -2.10596, 0, 0, 0, 1, 1,
-2.099353, 0.1937676, -2.05908, 0, 0, 0, 1, 1,
-2.098032, -0.7892366, -3.495731, 0, 0, 0, 1, 1,
-2.080623, -0.2995746, -0.6651763, 1, 1, 1, 1, 1,
-2.054092, -1.405294, -2.163116, 1, 1, 1, 1, 1,
-2.046145, 1.175698, 0.8634205, 1, 1, 1, 1, 1,
-2.038773, -0.7961713, -1.268691, 1, 1, 1, 1, 1,
-1.999038, 1.094396, -0.7895624, 1, 1, 1, 1, 1,
-1.986472, 0.09769294, -0.7830867, 1, 1, 1, 1, 1,
-1.960019, 1.144851, -2.544173, 1, 1, 1, 1, 1,
-1.946261, 1.04573, 0.9362993, 1, 1, 1, 1, 1,
-1.937232, -1.26861, -2.018035, 1, 1, 1, 1, 1,
-1.930517, -1.279929, -3.176697, 1, 1, 1, 1, 1,
-1.921244, -0.09173997, -1.204561, 1, 1, 1, 1, 1,
-1.916335, -0.6350363, -3.127266, 1, 1, 1, 1, 1,
-1.889641, 0.07738744, 0.5957222, 1, 1, 1, 1, 1,
-1.884602, 0.4383007, -1.901105, 1, 1, 1, 1, 1,
-1.879546, 0.2087613, -2.923497, 1, 1, 1, 1, 1,
-1.872294, 0.8755351, -0.7421241, 0, 0, 1, 1, 1,
-1.853474, 0.06345801, -2.146801, 1, 0, 0, 1, 1,
-1.845011, -1.792365, -2.207369, 1, 0, 0, 1, 1,
-1.841645, 1.615459, -1.227901, 1, 0, 0, 1, 1,
-1.839957, 1.224223, -2.346676, 1, 0, 0, 1, 1,
-1.830616, -0.566905, -1.394715, 1, 0, 0, 1, 1,
-1.828812, -0.5834707, -0.7380672, 0, 0, 0, 1, 1,
-1.810648, -1.271869, -4.006193, 0, 0, 0, 1, 1,
-1.802341, 0.6450345, -0.9816078, 0, 0, 0, 1, 1,
-1.798785, -0.8519458, -2.569329, 0, 0, 0, 1, 1,
-1.784009, -0.6617851, -1.964499, 0, 0, 0, 1, 1,
-1.763228, 1.314394, 0.2173708, 0, 0, 0, 1, 1,
-1.756721, 0.6839742, -2.959049, 0, 0, 0, 1, 1,
-1.755332, -2.320199, -1.60862, 1, 1, 1, 1, 1,
-1.699402, -0.5616207, -3.447194, 1, 1, 1, 1, 1,
-1.653415, -0.09292481, -1.973054, 1, 1, 1, 1, 1,
-1.645578, -1.98223, -3.794413, 1, 1, 1, 1, 1,
-1.630362, -0.5563241, -2.287162, 1, 1, 1, 1, 1,
-1.627794, 1.474502, -0.8996592, 1, 1, 1, 1, 1,
-1.621209, 0.7824322, 1.498754, 1, 1, 1, 1, 1,
-1.595775, -2.34421, -3.671692, 1, 1, 1, 1, 1,
-1.589352, 0.3428003, -1.683148, 1, 1, 1, 1, 1,
-1.588465, -0.412512, -2.358684, 1, 1, 1, 1, 1,
-1.578436, -1.400706, -3.788137, 1, 1, 1, 1, 1,
-1.57577, 1.462999, -0.7517102, 1, 1, 1, 1, 1,
-1.558987, -0.4862647, -2.41077, 1, 1, 1, 1, 1,
-1.55404, -0.5693356, -2.982596, 1, 1, 1, 1, 1,
-1.530867, 0.6559956, -0.4546285, 1, 1, 1, 1, 1,
-1.526546, 0.4516243, -2.052359, 0, 0, 1, 1, 1,
-1.516688, 0.1536389, 0.3268459, 1, 0, 0, 1, 1,
-1.499685, -1.176884, -3.152996, 1, 0, 0, 1, 1,
-1.478329, -1.230033, -0.5807215, 1, 0, 0, 1, 1,
-1.476757, 0.9653022, -1.045685, 1, 0, 0, 1, 1,
-1.464949, 0.9130167, -0.9393759, 1, 0, 0, 1, 1,
-1.460397, -0.05575057, -1.360705, 0, 0, 0, 1, 1,
-1.451331, -0.5824878, -0.4193949, 0, 0, 0, 1, 1,
-1.432373, 1.062561, -0.9329349, 0, 0, 0, 1, 1,
-1.431777, -0.3726096, -2.424191, 0, 0, 0, 1, 1,
-1.431001, 2.31357, -0.2787068, 0, 0, 0, 1, 1,
-1.418858, 0.697001, -0.2926295, 0, 0, 0, 1, 1,
-1.400708, 0.391969, -1.683641, 0, 0, 0, 1, 1,
-1.399098, -0.03971957, -1.640401, 1, 1, 1, 1, 1,
-1.398992, -0.7303967, -1.246264, 1, 1, 1, 1, 1,
-1.397345, -0.5406055, -3.715078, 1, 1, 1, 1, 1,
-1.391792, -1.154819, -4.154945, 1, 1, 1, 1, 1,
-1.382981, -1.167894, -1.998081, 1, 1, 1, 1, 1,
-1.373415, -1.338988, -4.296583, 1, 1, 1, 1, 1,
-1.368657, -0.5689225, -2.692863, 1, 1, 1, 1, 1,
-1.36077, 0.4558818, -2.991207, 1, 1, 1, 1, 1,
-1.347489, -0.3810814, -2.039676, 1, 1, 1, 1, 1,
-1.338596, 1.046699, 0.2914641, 1, 1, 1, 1, 1,
-1.336762, -0.4181901, -1.901954, 1, 1, 1, 1, 1,
-1.336481, -0.6221743, -0.08915129, 1, 1, 1, 1, 1,
-1.322123, -1.667313, -0.8380729, 1, 1, 1, 1, 1,
-1.315817, -0.8379136, -1.940651, 1, 1, 1, 1, 1,
-1.311806, -0.1640632, -3.796813, 1, 1, 1, 1, 1,
-1.302626, 0.4568788, -0.9318537, 0, 0, 1, 1, 1,
-1.30108, -1.504374, -1.17189, 1, 0, 0, 1, 1,
-1.299799, -1.745699, -2.214836, 1, 0, 0, 1, 1,
-1.289317, -0.1291519, -0.08483246, 1, 0, 0, 1, 1,
-1.284662, 2.116485, 1.137218, 1, 0, 0, 1, 1,
-1.281538, 0.4752695, -2.343169, 1, 0, 0, 1, 1,
-1.273075, 1.224501, -0.773259, 0, 0, 0, 1, 1,
-1.272544, 0.09489382, -0.7787706, 0, 0, 0, 1, 1,
-1.265366, -0.8745708, 0.5225227, 0, 0, 0, 1, 1,
-1.25609, -0.5335313, -3.968688, 0, 0, 0, 1, 1,
-1.249902, -0.2885512, -2.124981, 0, 0, 0, 1, 1,
-1.248187, 0.9215147, -1.652002, 0, 0, 0, 1, 1,
-1.23332, 0.5233536, -1.968514, 0, 0, 0, 1, 1,
-1.224939, 0.1911724, -0.4427578, 1, 1, 1, 1, 1,
-1.223032, 1.246714, -1.644893, 1, 1, 1, 1, 1,
-1.219091, -0.5505044, -2.914705, 1, 1, 1, 1, 1,
-1.212013, -1.562576, -4.152196, 1, 1, 1, 1, 1,
-1.203179, -0.2640021, -0.8895003, 1, 1, 1, 1, 1,
-1.199803, 1.26959, -0.4968059, 1, 1, 1, 1, 1,
-1.195629, 1.033841, -0.6234251, 1, 1, 1, 1, 1,
-1.192405, 0.6032081, 0.1179426, 1, 1, 1, 1, 1,
-1.190743, 0.5711006, 0.5427623, 1, 1, 1, 1, 1,
-1.190535, -2.67069, -2.533719, 1, 1, 1, 1, 1,
-1.188417, 1.106724, -1.264505, 1, 1, 1, 1, 1,
-1.177421, 0.4921468, -1.394722, 1, 1, 1, 1, 1,
-1.173, 1.105767, -1.278685, 1, 1, 1, 1, 1,
-1.166979, 0.8834045, -2.633856, 1, 1, 1, 1, 1,
-1.166369, -0.4046776, -0.6640778, 1, 1, 1, 1, 1,
-1.166299, -1.304657, -2.098497, 0, 0, 1, 1, 1,
-1.159145, -0.7101753, -1.287197, 1, 0, 0, 1, 1,
-1.158771, -0.008206548, -1.076194, 1, 0, 0, 1, 1,
-1.156904, -0.09736896, -1.685265, 1, 0, 0, 1, 1,
-1.154474, 0.3258234, -3.45656, 1, 0, 0, 1, 1,
-1.153919, -0.3043022, -1.036441, 1, 0, 0, 1, 1,
-1.152417, 0.4532433, -1.687733, 0, 0, 0, 1, 1,
-1.150406, -1.810314, -3.425358, 0, 0, 0, 1, 1,
-1.145221, -1.373239, -3.494304, 0, 0, 0, 1, 1,
-1.134917, -0.05155554, -2.899985, 0, 0, 0, 1, 1,
-1.129109, -0.625115, -2.408617, 0, 0, 0, 1, 1,
-1.111526, -1.146497, -2.770787, 0, 0, 0, 1, 1,
-1.110941, -0.4804789, -1.111973, 0, 0, 0, 1, 1,
-1.102778, 0.6636968, -2.470476, 1, 1, 1, 1, 1,
-1.101708, -0.689097, -0.8776633, 1, 1, 1, 1, 1,
-1.098971, 0.9017301, -1.625015, 1, 1, 1, 1, 1,
-1.098932, 0.1223055, -0.8153252, 1, 1, 1, 1, 1,
-1.098778, 1.83287, -2.014269, 1, 1, 1, 1, 1,
-1.095103, -0.4787428, -2.52864, 1, 1, 1, 1, 1,
-1.092013, 0.09721939, -0.9348446, 1, 1, 1, 1, 1,
-1.090081, -0.9758631, -2.125005, 1, 1, 1, 1, 1,
-1.089882, -0.3699012, -0.5722135, 1, 1, 1, 1, 1,
-1.087724, -0.24947, -1.065933, 1, 1, 1, 1, 1,
-1.087419, -1.706181, -2.128751, 1, 1, 1, 1, 1,
-1.083334, -0.6306851, -1.887624, 1, 1, 1, 1, 1,
-1.076431, -0.8148912, -1.171068, 1, 1, 1, 1, 1,
-1.069473, -1.253363, -1.94122, 1, 1, 1, 1, 1,
-1.065249, -0.8139042, -1.510783, 1, 1, 1, 1, 1,
-1.04878, 0.4383688, -0.8822784, 0, 0, 1, 1, 1,
-1.04669, -0.2726342, -1.250313, 1, 0, 0, 1, 1,
-1.044947, 0.7325488, -1.109804, 1, 0, 0, 1, 1,
-1.041402, -1.746677, -3.130384, 1, 0, 0, 1, 1,
-1.038618, -1.799338, -1.081696, 1, 0, 0, 1, 1,
-1.036127, 0.2336941, -0.7423283, 1, 0, 0, 1, 1,
-1.028972, 0.4827043, -0.4340876, 0, 0, 0, 1, 1,
-1.024137, 0.9403498, 0.2149301, 0, 0, 0, 1, 1,
-1.022819, 0.3284943, -2.739569, 0, 0, 0, 1, 1,
-1.01556, -0.3584142, -1.947135, 0, 0, 0, 1, 1,
-1.012945, -0.2022773, -2.70069, 0, 0, 0, 1, 1,
-1.012157, -1.389722, -3.408612, 0, 0, 0, 1, 1,
-1.01213, -2.352888, -2.763988, 0, 0, 0, 1, 1,
-1.011722, -0.844399, -2.556404, 1, 1, 1, 1, 1,
-1.008695, 1.794458, -0.7957744, 1, 1, 1, 1, 1,
-1.006277, -0.2241094, -3.050452, 1, 1, 1, 1, 1,
-1.005185, 0.8336883, -1.254538, 1, 1, 1, 1, 1,
-1.003118, 1.837941, -1.229976, 1, 1, 1, 1, 1,
-1.000814, -0.9433401, -1.728641, 1, 1, 1, 1, 1,
-0.9974234, 0.4915654, -0.9616076, 1, 1, 1, 1, 1,
-0.9949472, 0.1760845, -2.775853, 1, 1, 1, 1, 1,
-0.9918464, 0.3589792, -2.295571, 1, 1, 1, 1, 1,
-0.9897937, -0.4208366, -4.847497, 1, 1, 1, 1, 1,
-0.9891083, -0.3733719, -0.7852678, 1, 1, 1, 1, 1,
-0.9867067, -1.042801, -2.144104, 1, 1, 1, 1, 1,
-0.980045, 0.3305598, -0.9979333, 1, 1, 1, 1, 1,
-0.9792195, 0.2235041, -0.414198, 1, 1, 1, 1, 1,
-0.9745894, -1.010312, -2.021512, 1, 1, 1, 1, 1,
-0.9735666, -0.2346421, -1.86922, 0, 0, 1, 1, 1,
-0.9698203, 0.7749922, -2.450414, 1, 0, 0, 1, 1,
-0.9647459, -1.251733, -3.944292, 1, 0, 0, 1, 1,
-0.956346, 0.485933, -1.295967, 1, 0, 0, 1, 1,
-0.9535413, 1.424432, -0.8446867, 1, 0, 0, 1, 1,
-0.9500404, 0.6941278, 0.1126405, 1, 0, 0, 1, 1,
-0.9479209, -1.289728, -2.876689, 0, 0, 0, 1, 1,
-0.9435992, 1.065381, -2.59295, 0, 0, 0, 1, 1,
-0.9396573, -0.4429179, -3.36116, 0, 0, 0, 1, 1,
-0.9342972, -1.570412, -0.788473, 0, 0, 0, 1, 1,
-0.931001, -1.355712, -1.611906, 0, 0, 0, 1, 1,
-0.9160682, 0.5189217, 1.000095, 0, 0, 0, 1, 1,
-0.915848, 0.02677432, -2.220099, 0, 0, 0, 1, 1,
-0.9137424, 0.7394126, 0.7078406, 1, 1, 1, 1, 1,
-0.9126328, 0.6215583, -2.997911, 1, 1, 1, 1, 1,
-0.9100474, 0.06817126, -1.858975, 1, 1, 1, 1, 1,
-0.9098506, -0.8766116, -1.225953, 1, 1, 1, 1, 1,
-0.901675, 0.8950428, -0.8081279, 1, 1, 1, 1, 1,
-0.8990012, 0.3094465, -2.165459, 1, 1, 1, 1, 1,
-0.8962057, 1.631699, 0.6168941, 1, 1, 1, 1, 1,
-0.8959963, -1.001658, -2.452342, 1, 1, 1, 1, 1,
-0.8927702, -1.707958, -2.970481, 1, 1, 1, 1, 1,
-0.8923945, 0.4848206, -0.9010732, 1, 1, 1, 1, 1,
-0.8885996, 0.002699361, -0.9566079, 1, 1, 1, 1, 1,
-0.8841795, -0.2123639, -1.222251, 1, 1, 1, 1, 1,
-0.8729298, 0.4475727, -2.355547, 1, 1, 1, 1, 1,
-0.8680909, 0.008626721, -2.152253, 1, 1, 1, 1, 1,
-0.8631507, -1.985909, -2.269999, 1, 1, 1, 1, 1,
-0.8617152, 0.8178124, -1.355283, 0, 0, 1, 1, 1,
-0.8579722, -0.6825955, -3.243696, 1, 0, 0, 1, 1,
-0.83767, 0.08071344, -1.266231, 1, 0, 0, 1, 1,
-0.8374747, 0.5298509, -0.06114211, 1, 0, 0, 1, 1,
-0.8373098, 0.314531, 0.2425409, 1, 0, 0, 1, 1,
-0.8287358, -0.4109111, -2.421741, 1, 0, 0, 1, 1,
-0.8161648, -0.5793104, -3.987146, 0, 0, 0, 1, 1,
-0.815616, -0.938767, -1.941286, 0, 0, 0, 1, 1,
-0.8149552, -0.3946698, -0.5749226, 0, 0, 0, 1, 1,
-0.8131139, -0.3462971, 1.713498, 0, 0, 0, 1, 1,
-0.8117488, 1.34393, 1.347011, 0, 0, 0, 1, 1,
-0.8058586, 0.4416147, -0.00538946, 0, 0, 0, 1, 1,
-0.8031743, -0.2325746, -0.3489553, 0, 0, 0, 1, 1,
-0.8021144, -0.01453832, -1.257007, 1, 1, 1, 1, 1,
-0.8008628, -1.852871, -2.80236, 1, 1, 1, 1, 1,
-0.7958174, 0.9152227, -1.424072, 1, 1, 1, 1, 1,
-0.7939496, -0.356277, -1.782657, 1, 1, 1, 1, 1,
-0.7893512, 0.233149, -2.900218, 1, 1, 1, 1, 1,
-0.7847201, -0.06301545, -0.6934038, 1, 1, 1, 1, 1,
-0.7834964, -0.9929859, -1.404398, 1, 1, 1, 1, 1,
-0.7818539, 0.2111132, -1.99555, 1, 1, 1, 1, 1,
-0.779297, 0.862312, -0.02241863, 1, 1, 1, 1, 1,
-0.7673724, 0.124174, -1.109663, 1, 1, 1, 1, 1,
-0.7649463, 0.7174571, -1.803063, 1, 1, 1, 1, 1,
-0.7573033, 1.402648, -0.1529366, 1, 1, 1, 1, 1,
-0.74996, 0.03471218, -0.3039286, 1, 1, 1, 1, 1,
-0.7407837, -0.7127782, -2.872508, 1, 1, 1, 1, 1,
-0.7384705, 0.764625, -1.31314, 1, 1, 1, 1, 1,
-0.7335974, -0.1594321, -2.912408, 0, 0, 1, 1, 1,
-0.731253, -0.4534479, -1.602457, 1, 0, 0, 1, 1,
-0.7297067, 0.8452075, -0.4771562, 1, 0, 0, 1, 1,
-0.7247559, 1.26428, -1.803827, 1, 0, 0, 1, 1,
-0.7226173, 1.666885, 0.3565238, 1, 0, 0, 1, 1,
-0.7170526, 0.4602148, 1.346743, 1, 0, 0, 1, 1,
-0.7109892, 0.3059847, -1.116542, 0, 0, 0, 1, 1,
-0.7104627, 0.5366736, -1.672981, 0, 0, 0, 1, 1,
-0.7100871, -0.001543262, -1.559153, 0, 0, 0, 1, 1,
-0.7065687, 1.00222, -2.158303, 0, 0, 0, 1, 1,
-0.7058501, -0.05134217, -1.747925, 0, 0, 0, 1, 1,
-0.7049769, 0.786305, 0.6303925, 0, 0, 0, 1, 1,
-0.7034268, 1.605191, 0.006718521, 0, 0, 0, 1, 1,
-0.7027278, 0.1253896, -0.1451709, 1, 1, 1, 1, 1,
-0.7026682, 1.216998, -0.4214551, 1, 1, 1, 1, 1,
-0.6997278, 0.1637053, -0.6425627, 1, 1, 1, 1, 1,
-0.698676, -0.7855606, -2.25927, 1, 1, 1, 1, 1,
-0.6950498, 0.3512658, -2.77902, 1, 1, 1, 1, 1,
-0.6950418, 0.7804525, -0.1707973, 1, 1, 1, 1, 1,
-0.6928496, 0.8526597, 0.6031646, 1, 1, 1, 1, 1,
-0.6831586, 0.3414081, -1.941308, 1, 1, 1, 1, 1,
-0.6795903, -1.076855, -2.612708, 1, 1, 1, 1, 1,
-0.6720254, -2.254899, -2.813612, 1, 1, 1, 1, 1,
-0.6709329, 0.8976321, -1.949187, 1, 1, 1, 1, 1,
-0.6694406, 1.136236, -0.4147491, 1, 1, 1, 1, 1,
-0.6684156, -1.460142, -2.920266, 1, 1, 1, 1, 1,
-0.6527689, -0.9646993, -2.854574, 1, 1, 1, 1, 1,
-0.6431907, 1.249446, -0.2357486, 1, 1, 1, 1, 1,
-0.6431038, -0.01106674, -2.028386, 0, 0, 1, 1, 1,
-0.6364862, -0.53324, -3.336966, 1, 0, 0, 1, 1,
-0.6315904, -0.5841656, -2.234478, 1, 0, 0, 1, 1,
-0.6287565, 1.941654, -0.8609356, 1, 0, 0, 1, 1,
-0.6278425, 0.5568377, -2.991839, 1, 0, 0, 1, 1,
-0.6238917, 0.7649005, -0.4289983, 1, 0, 0, 1, 1,
-0.6238328, 0.6029408, 0.05743557, 0, 0, 0, 1, 1,
-0.6232334, 0.6974855, -0.8223843, 0, 0, 0, 1, 1,
-0.6177049, -0.1479398, -1.519882, 0, 0, 0, 1, 1,
-0.6155181, 1.740238, 0.419887, 0, 0, 0, 1, 1,
-0.6109523, -0.1866065, -0.9086038, 0, 0, 0, 1, 1,
-0.6056141, -0.9262598, -3.447425, 0, 0, 0, 1, 1,
-0.6021339, 0.2048777, -2.016218, 0, 0, 0, 1, 1,
-0.5995104, 0.4191727, -0.4236423, 1, 1, 1, 1, 1,
-0.5982703, -0.4101071, -1.084106, 1, 1, 1, 1, 1,
-0.5981855, 0.4449298, -1.684417, 1, 1, 1, 1, 1,
-0.5864236, -0.1332558, -1.814996, 1, 1, 1, 1, 1,
-0.5855547, -0.5486126, -1.912229, 1, 1, 1, 1, 1,
-0.5738764, -1.542493, -3.800797, 1, 1, 1, 1, 1,
-0.5656793, -0.3157293, -3.394077, 1, 1, 1, 1, 1,
-0.5656649, 0.2072126, -1.589967, 1, 1, 1, 1, 1,
-0.5581834, 1.00282, -1.35533, 1, 1, 1, 1, 1,
-0.5570332, 0.002424602, 0.5435914, 1, 1, 1, 1, 1,
-0.5459473, 2.082614, 1.564476, 1, 1, 1, 1, 1,
-0.5447294, -0.3126045, -1.302253, 1, 1, 1, 1, 1,
-0.5415127, -0.06942589, -3.949179, 1, 1, 1, 1, 1,
-0.5388765, 0.7663015, 1.528138, 1, 1, 1, 1, 1,
-0.5361612, -0.5622208, -0.9573888, 1, 1, 1, 1, 1,
-0.5294389, -0.7311234, -3.910228, 0, 0, 1, 1, 1,
-0.5292709, 0.6657375, -0.1946364, 1, 0, 0, 1, 1,
-0.5266546, -0.5964158, -3.269727, 1, 0, 0, 1, 1,
-0.5264694, -0.8766448, -3.420606, 1, 0, 0, 1, 1,
-0.5260745, -0.5289216, -2.294789, 1, 0, 0, 1, 1,
-0.518143, -0.3909717, -1.967466, 1, 0, 0, 1, 1,
-0.514375, -1.537102, -2.163911, 0, 0, 0, 1, 1,
-0.5108429, -1.087599, -1.378218, 0, 0, 0, 1, 1,
-0.5100559, -0.8121085, -3.155364, 0, 0, 0, 1, 1,
-0.5087097, -0.3658796, -1.074926, 0, 0, 0, 1, 1,
-0.5083625, -0.3788832, -1.879985, 0, 0, 0, 1, 1,
-0.5073065, 1.905303, -2.292856, 0, 0, 0, 1, 1,
-0.5058519, -0.512171, -2.029502, 0, 0, 0, 1, 1,
-0.5049333, 1.043823, -1.428415, 1, 1, 1, 1, 1,
-0.5024117, -0.1313345, -3.024211, 1, 1, 1, 1, 1,
-0.5018088, 0.5797985, -0.9145385, 1, 1, 1, 1, 1,
-0.4961617, 0.2576157, -1.699007, 1, 1, 1, 1, 1,
-0.4901945, -0.8809907, -3.022826, 1, 1, 1, 1, 1,
-0.4872516, 0.70203, -0.5833921, 1, 1, 1, 1, 1,
-0.4865985, -0.8850327, -2.033795, 1, 1, 1, 1, 1,
-0.485603, -1.914845, -2.724245, 1, 1, 1, 1, 1,
-0.4851417, -0.7176424, -2.715101, 1, 1, 1, 1, 1,
-0.4851342, 0.7142159, -0.7154103, 1, 1, 1, 1, 1,
-0.4825282, 0.7401404, 0.9679013, 1, 1, 1, 1, 1,
-0.4767542, -0.297728, -1.004843, 1, 1, 1, 1, 1,
-0.4750568, -0.1418326, -2.34734, 1, 1, 1, 1, 1,
-0.4713683, -1.398021, -3.258036, 1, 1, 1, 1, 1,
-0.4690126, 0.7952901, -1.600345, 1, 1, 1, 1, 1,
-0.4684381, -0.4496199, -1.981463, 0, 0, 1, 1, 1,
-0.4662473, -0.06285302, -2.286263, 1, 0, 0, 1, 1,
-0.4630867, 1.466926, 2.029899, 1, 0, 0, 1, 1,
-0.4595359, -0.6811219, -3.652907, 1, 0, 0, 1, 1,
-0.454915, -0.5615698, -3.031538, 1, 0, 0, 1, 1,
-0.4535193, 0.6438071, -0.839851, 1, 0, 0, 1, 1,
-0.4517561, 0.7894876, -0.9263113, 0, 0, 0, 1, 1,
-0.4495028, 2.246484, 0.03947339, 0, 0, 0, 1, 1,
-0.4492739, 0.7728001, -0.5498837, 0, 0, 0, 1, 1,
-0.4475647, -0.2831374, -1.452267, 0, 0, 0, 1, 1,
-0.4439979, 1.230584, 1.147288, 0, 0, 0, 1, 1,
-0.4413654, -0.7127178, -2.019819, 0, 0, 0, 1, 1,
-0.4392222, 0.7579044, -0.9313321, 0, 0, 0, 1, 1,
-0.4369826, 0.9109531, -0.7289224, 1, 1, 1, 1, 1,
-0.4338754, 0.1730414, -0.8998599, 1, 1, 1, 1, 1,
-0.4321355, 0.3475895, 0.553457, 1, 1, 1, 1, 1,
-0.4299859, 1.897325, 0.6642791, 1, 1, 1, 1, 1,
-0.4289422, 0.1002602, -2.395533, 1, 1, 1, 1, 1,
-0.4287244, 0.4713403, -0.4361272, 1, 1, 1, 1, 1,
-0.4250179, 0.6277486, -0.1255584, 1, 1, 1, 1, 1,
-0.4238193, -0.4450009, -2.134525, 1, 1, 1, 1, 1,
-0.4193592, -0.1655735, -2.854362, 1, 1, 1, 1, 1,
-0.4115878, 0.5974714, -0.1444265, 1, 1, 1, 1, 1,
-0.40659, 2.084943, -0.8086694, 1, 1, 1, 1, 1,
-0.4036548, -0.1642848, -0.3403125, 1, 1, 1, 1, 1,
-0.4033147, 0.4318161, -0.5895059, 1, 1, 1, 1, 1,
-0.4008923, -2.020371, -2.43913, 1, 1, 1, 1, 1,
-0.4005162, 0.06183118, -2.585719, 1, 1, 1, 1, 1,
-0.4000371, -0.9634952, -3.60643, 0, 0, 1, 1, 1,
-0.39967, -0.7476352, -3.27512, 1, 0, 0, 1, 1,
-0.3977306, 1.024321, -2.127822, 1, 0, 0, 1, 1,
-0.3964465, -0.2322236, -1.157638, 1, 0, 0, 1, 1,
-0.3955415, -0.2564315, -3.147196, 1, 0, 0, 1, 1,
-0.3940353, -0.2433333, -3.708537, 1, 0, 0, 1, 1,
-0.3916193, -0.2357496, -3.736581, 0, 0, 0, 1, 1,
-0.3914323, 0.5636928, -1.342849, 0, 0, 0, 1, 1,
-0.3910967, -0.751745, -2.276307, 0, 0, 0, 1, 1,
-0.3895359, -1.305896, -2.413977, 0, 0, 0, 1, 1,
-0.3891441, -0.769875, -1.163338, 0, 0, 0, 1, 1,
-0.3874196, -0.1061327, -1.369024, 0, 0, 0, 1, 1,
-0.3852258, 0.310907, -2.227222, 0, 0, 0, 1, 1,
-0.3832477, -0.2640959, -1.158059, 1, 1, 1, 1, 1,
-0.3796407, -0.4711879, -2.50951, 1, 1, 1, 1, 1,
-0.3770756, -0.3793837, -2.587179, 1, 1, 1, 1, 1,
-0.3756897, -0.7598141, -1.484887, 1, 1, 1, 1, 1,
-0.3724547, 2.13355, -0.2479568, 1, 1, 1, 1, 1,
-0.3691589, 2.683945, 0.9787503, 1, 1, 1, 1, 1,
-0.3684241, -0.3275411, -2.460231, 1, 1, 1, 1, 1,
-0.3676406, -0.3112601, -2.484478, 1, 1, 1, 1, 1,
-0.365235, 0.8474067, -1.119362, 1, 1, 1, 1, 1,
-0.3630053, 0.06154457, -1.735744, 1, 1, 1, 1, 1,
-0.362076, 0.1807146, -1.170601, 1, 1, 1, 1, 1,
-0.3590814, 0.08720817, -0.2563682, 1, 1, 1, 1, 1,
-0.3509029, -0.4169196, -3.747197, 1, 1, 1, 1, 1,
-0.3478151, -0.207266, -1.301191, 1, 1, 1, 1, 1,
-0.3473797, 1.062515, 1.144245, 1, 1, 1, 1, 1,
-0.3472787, -0.1808161, -0.7602169, 0, 0, 1, 1, 1,
-0.3471538, -0.72094, -2.793686, 1, 0, 0, 1, 1,
-0.3449221, 2.125009, 1.278935, 1, 0, 0, 1, 1,
-0.3435247, -1.708898, -2.488312, 1, 0, 0, 1, 1,
-0.3377834, -2.13186, -2.481101, 1, 0, 0, 1, 1,
-0.3370371, -0.7463263, -1.937425, 1, 0, 0, 1, 1,
-0.3328519, -0.4126662, -2.378268, 0, 0, 0, 1, 1,
-0.3305131, -0.09212449, -0.1690143, 0, 0, 0, 1, 1,
-0.3280271, -0.1065369, -3.81368, 0, 0, 0, 1, 1,
-0.3280042, 0.07753859, -0.7832034, 0, 0, 0, 1, 1,
-0.3276605, -0.9904829, -3.220726, 0, 0, 0, 1, 1,
-0.3264058, -1.627044, -2.808977, 0, 0, 0, 1, 1,
-0.3240174, 0.04620241, -0.5009734, 0, 0, 0, 1, 1,
-0.3185874, 1.278426, 0.3738573, 1, 1, 1, 1, 1,
-0.3161973, 0.1795336, -0.6141836, 1, 1, 1, 1, 1,
-0.3146314, -0.05937228, -3.289312, 1, 1, 1, 1, 1,
-0.3084105, 0.8618006, -0.007073632, 1, 1, 1, 1, 1,
-0.3035015, -0.3691461, -2.912093, 1, 1, 1, 1, 1,
-0.3016362, -0.03342091, -1.745774, 1, 1, 1, 1, 1,
-0.2943795, -1.777503, -1.697777, 1, 1, 1, 1, 1,
-0.2942323, 0.4680757, -2.634224, 1, 1, 1, 1, 1,
-0.2917359, 1.32145, -1.316275, 1, 1, 1, 1, 1,
-0.2875493, -0.5349125, -0.6107023, 1, 1, 1, 1, 1,
-0.2850411, 0.9064201, 0.2981802, 1, 1, 1, 1, 1,
-0.2828917, 0.1272299, -1.84027, 1, 1, 1, 1, 1,
-0.2817202, 0.922241, -0.2236658, 1, 1, 1, 1, 1,
-0.2749458, 1.275022, 1.788624, 1, 1, 1, 1, 1,
-0.2704625, -1.62232, -2.939072, 1, 1, 1, 1, 1,
-0.2669694, -0.5787969, -3.195012, 0, 0, 1, 1, 1,
-0.26404, 0.2182248, -0.9118351, 1, 0, 0, 1, 1,
-0.2636169, 1.321529, -0.4596512, 1, 0, 0, 1, 1,
-0.2577527, 0.2063359, 0.6016162, 1, 0, 0, 1, 1,
-0.2561313, 0.2340763, -1.126905, 1, 0, 0, 1, 1,
-0.2554309, 0.2585198, -2.142844, 1, 0, 0, 1, 1,
-0.2515588, 0.3243069, 0.9072722, 0, 0, 0, 1, 1,
-0.24938, 0.787028, 0.5475459, 0, 0, 0, 1, 1,
-0.249299, -1.274114, -3.315933, 0, 0, 0, 1, 1,
-0.2477219, 0.7525249, 0.1220326, 0, 0, 0, 1, 1,
-0.2470252, 0.1861461, -1.15328, 0, 0, 0, 1, 1,
-0.2394046, -0.3158551, -5.66784, 0, 0, 0, 1, 1,
-0.2371198, -0.9104691, -1.923396, 0, 0, 0, 1, 1,
-0.2351232, 0.2124928, -1.022379, 1, 1, 1, 1, 1,
-0.2324418, 0.01376452, -1.035114, 1, 1, 1, 1, 1,
-0.2301938, 0.7335221, -1.106911, 1, 1, 1, 1, 1,
-0.2245645, 0.007472795, -2.755588, 1, 1, 1, 1, 1,
-0.2241524, 1.13773, 0.9337484, 1, 1, 1, 1, 1,
-0.22298, 0.01192285, 0.2818239, 1, 1, 1, 1, 1,
-0.2210408, -0.1066317, -2.725665, 1, 1, 1, 1, 1,
-0.2200903, 0.1695817, -1.690386, 1, 1, 1, 1, 1,
-0.2197389, -1.546227, -2.447446, 1, 1, 1, 1, 1,
-0.2159949, 1.071932, 0.6182559, 1, 1, 1, 1, 1,
-0.214581, 2.143189, -0.4970886, 1, 1, 1, 1, 1,
-0.2104546, -0.6160631, -1.802045, 1, 1, 1, 1, 1,
-0.2061523, 1.313367, -0.4338079, 1, 1, 1, 1, 1,
-0.2042576, 0.9984121, 0.1510446, 1, 1, 1, 1, 1,
-0.2015117, 0.3665277, -0.3712608, 1, 1, 1, 1, 1,
-0.2002036, 1.11033, -0.6933553, 0, 0, 1, 1, 1,
-0.1997844, -0.6275984, -3.513492, 1, 0, 0, 1, 1,
-0.1986005, 2.428101, -0.3701033, 1, 0, 0, 1, 1,
-0.1985852, 1.113855, -0.8810495, 1, 0, 0, 1, 1,
-0.1969292, -1.85639, -3.871164, 1, 0, 0, 1, 1,
-0.1968546, 0.6140662, -1.282582, 1, 0, 0, 1, 1,
-0.1942425, -1.734785, -3.024603, 0, 0, 0, 1, 1,
-0.1927001, 0.521835, 0.8911225, 0, 0, 0, 1, 1,
-0.1906168, -1.006402, -1.407056, 0, 0, 0, 1, 1,
-0.188482, 0.7205366, -0.165348, 0, 0, 0, 1, 1,
-0.1859257, 1.046203, -1.080665, 0, 0, 0, 1, 1,
-0.1851658, 1.124749, -0.3081696, 0, 0, 0, 1, 1,
-0.1848198, -0.2511083, -3.928501, 0, 0, 0, 1, 1,
-0.17941, -0.8045009, -3.129383, 1, 1, 1, 1, 1,
-0.1793282, -1.419061, -4.502287, 1, 1, 1, 1, 1,
-0.179131, -0.7855812, -3.749003, 1, 1, 1, 1, 1,
-0.1756558, -0.6930083, -2.823126, 1, 1, 1, 1, 1,
-0.1729038, 0.04048676, -1.801155, 1, 1, 1, 1, 1,
-0.1726541, -0.3582808, -2.717521, 1, 1, 1, 1, 1,
-0.1715831, -0.3521476, -2.035709, 1, 1, 1, 1, 1,
-0.1702721, -0.3587511, -1.803754, 1, 1, 1, 1, 1,
-0.1540893, 0.15641, -1.505153, 1, 1, 1, 1, 1,
-0.1533831, -0.08425466, -1.698224, 1, 1, 1, 1, 1,
-0.1473265, -1.180975, -1.957819, 1, 1, 1, 1, 1,
-0.1468404, -0.02790992, -1.812762, 1, 1, 1, 1, 1,
-0.1392485, 0.3935601, 0.5373207, 1, 1, 1, 1, 1,
-0.1386822, 1.412356, 0.659067, 1, 1, 1, 1, 1,
-0.137299, 0.4909356, -0.1293112, 1, 1, 1, 1, 1,
-0.1366349, 1.075112, -1.290616, 0, 0, 1, 1, 1,
-0.1253716, 1.344005, -0.4389827, 1, 0, 0, 1, 1,
-0.1210724, 0.8723425, 0.3633271, 1, 0, 0, 1, 1,
-0.1200116, -0.449795, -3.518233, 1, 0, 0, 1, 1,
-0.1170247, -0.01136355, -2.972086, 1, 0, 0, 1, 1,
-0.1153472, 0.8657817, 0.8138053, 1, 0, 0, 1, 1,
-0.1142754, -0.4760338, -3.152167, 0, 0, 0, 1, 1,
-0.1095192, -0.04220154, -0.7112774, 0, 0, 0, 1, 1,
-0.1066154, -0.9297758, -1.749809, 0, 0, 0, 1, 1,
-0.1057847, -0.5012959, -3.300454, 0, 0, 0, 1, 1,
-0.1056793, 1.201419, -0.04411407, 0, 0, 0, 1, 1,
-0.1029708, 1.734519, -0.2631518, 0, 0, 0, 1, 1,
-0.1026287, 1.098581, -0.6247407, 0, 0, 0, 1, 1,
-0.1013763, -0.7503952, -1.87704, 1, 1, 1, 1, 1,
-0.09871555, 1.65928, -0.6547446, 1, 1, 1, 1, 1,
-0.09397013, -0.7678903, -3.348082, 1, 1, 1, 1, 1,
-0.08631563, 1.519979, -0.7222701, 1, 1, 1, 1, 1,
-0.0859549, -1.980633, -2.931596, 1, 1, 1, 1, 1,
-0.08387148, -0.5725064, -2.296794, 1, 1, 1, 1, 1,
-0.08258558, 0.3240061, -0.6579029, 1, 1, 1, 1, 1,
-0.07928602, -0.8191271, -4.41915, 1, 1, 1, 1, 1,
-0.07919919, 0.4525717, 0.3132498, 1, 1, 1, 1, 1,
-0.07711001, -1.605561, -2.237237, 1, 1, 1, 1, 1,
-0.06958122, -1.420087, -2.520126, 1, 1, 1, 1, 1,
-0.06951934, -0.4840002, -2.774878, 1, 1, 1, 1, 1,
-0.06809334, -0.8978143, -2.2242, 1, 1, 1, 1, 1,
-0.06704983, 0.2952736, -1.387965, 1, 1, 1, 1, 1,
-0.06673986, 0.9129599, -0.2321965, 1, 1, 1, 1, 1,
-0.0656456, -0.128623, -1.387214, 0, 0, 1, 1, 1,
-0.06494761, -0.6034341, -2.667405, 1, 0, 0, 1, 1,
-0.05559641, -0.3487655, -4.203765, 1, 0, 0, 1, 1,
-0.05347728, -0.1726753, -3.791483, 1, 0, 0, 1, 1,
-0.05123679, -1.085298, -4.411891, 1, 0, 0, 1, 1,
-0.03677408, 0.4180793, -1.148456, 1, 0, 0, 1, 1,
-0.0346709, 0.4950159, 0.58146, 0, 0, 0, 1, 1,
-0.03413926, -0.7307731, -4.367435, 0, 0, 0, 1, 1,
-0.03309455, 0.2998954, -0.07023027, 0, 0, 0, 1, 1,
-0.03306746, -0.8488118, -4.612415, 0, 0, 0, 1, 1,
-0.03046146, 1.340665, -0.1040336, 0, 0, 0, 1, 1,
-0.0287051, -1.234329, -3.979088, 0, 0, 0, 1, 1,
-0.02686804, 1.004995, -1.309664, 0, 0, 0, 1, 1,
-0.02641087, -0.01145749, -1.81878, 1, 1, 1, 1, 1,
-0.0256561, -0.2834403, -3.481511, 1, 1, 1, 1, 1,
-0.02502245, -0.8762009, -3.431818, 1, 1, 1, 1, 1,
-0.02270124, -0.8665994, -2.728398, 1, 1, 1, 1, 1,
-0.02193034, -0.2765541, -3.873336, 1, 1, 1, 1, 1,
-0.01839663, -0.7558132, -2.986768, 1, 1, 1, 1, 1,
-0.01750807, -0.786847, -5.847845, 1, 1, 1, 1, 1,
-0.01526973, -0.5909429, -3.700094, 1, 1, 1, 1, 1,
-0.01524494, -0.3027884, -2.377535, 1, 1, 1, 1, 1,
-0.01495246, 0.9470128, -0.7268603, 1, 1, 1, 1, 1,
-0.01429115, 0.1832376, 2.673711, 1, 1, 1, 1, 1,
-0.01252258, 0.2792059, -0.5195236, 1, 1, 1, 1, 1,
-0.008778146, 0.5917372, -0.2808062, 1, 1, 1, 1, 1,
-0.008179591, -1.342685, -1.765965, 1, 1, 1, 1, 1,
-0.002000363, 1.044973, 0.4569492, 1, 1, 1, 1, 1,
-0.001958095, 0.4999849, -0.2741314, 0, 0, 1, 1, 1,
0.004068627, -1.747504, 2.67399, 1, 0, 0, 1, 1,
0.01064861, 1.142663, -0.5541651, 1, 0, 0, 1, 1,
0.01169749, 0.1437076, -0.09203482, 1, 0, 0, 1, 1,
0.01550233, 0.2571196, 1.278177, 1, 0, 0, 1, 1,
0.01678894, 0.1600682, 1.621437, 1, 0, 0, 1, 1,
0.02512717, 0.09205589, 0.8562413, 0, 0, 0, 1, 1,
0.02736846, 0.7588229, 1.362291, 0, 0, 0, 1, 1,
0.03030588, 0.3823467, 1.238472, 0, 0, 0, 1, 1,
0.03064128, -0.8025534, 2.634599, 0, 0, 0, 1, 1,
0.03133149, -1.906113, 1.68181, 0, 0, 0, 1, 1,
0.03227827, 0.1786797, -0.9852842, 0, 0, 0, 1, 1,
0.03358268, -0.4499672, 3.62093, 0, 0, 0, 1, 1,
0.03400254, -2.040614, 2.9849, 1, 1, 1, 1, 1,
0.03666761, 2.975624, 0.4455397, 1, 1, 1, 1, 1,
0.03822363, 1.237661, 1.027651, 1, 1, 1, 1, 1,
0.04042995, 0.9617764, -1.174096, 1, 1, 1, 1, 1,
0.04254989, -0.05002043, 0.1944801, 1, 1, 1, 1, 1,
0.04951338, 1.151455, 0.08581816, 1, 1, 1, 1, 1,
0.04999095, 0.04921601, -0.6270497, 1, 1, 1, 1, 1,
0.05175319, 0.6786363, -0.1169662, 1, 1, 1, 1, 1,
0.05266128, -0.5792544, 2.846984, 1, 1, 1, 1, 1,
0.05446557, 0.8853985, -0.9679385, 1, 1, 1, 1, 1,
0.05622203, 1.43197, 1.906154, 1, 1, 1, 1, 1,
0.05714766, 1.234957, 0.8213942, 1, 1, 1, 1, 1,
0.05724462, -1.606857, 4.300982, 1, 1, 1, 1, 1,
0.06844602, -0.2204699, 3.707125, 1, 1, 1, 1, 1,
0.06860426, -0.4416743, 3.321423, 1, 1, 1, 1, 1,
0.06914028, 1.015481, -0.04760763, 0, 0, 1, 1, 1,
0.07492488, 0.06553466, 0.002293538, 1, 0, 0, 1, 1,
0.07726888, -0.7319229, 3.660813, 1, 0, 0, 1, 1,
0.07910683, 0.2761695, -0.5776861, 1, 0, 0, 1, 1,
0.07959706, 1.195937, 1.321968, 1, 0, 0, 1, 1,
0.07999728, 1.943172, 2.687036, 1, 0, 0, 1, 1,
0.08200805, 1.62796, -0.9091806, 0, 0, 0, 1, 1,
0.08317555, -1.399315, 1.933161, 0, 0, 0, 1, 1,
0.08446427, 0.3417385, 0.04580426, 0, 0, 0, 1, 1,
0.08621385, -0.2455948, 3.77034, 0, 0, 0, 1, 1,
0.08693516, 0.8648215, -1.151808, 0, 0, 0, 1, 1,
0.08777107, 0.4924793, 0.7656681, 0, 0, 0, 1, 1,
0.08818221, -0.3346297, 3.235255, 0, 0, 0, 1, 1,
0.08889807, -0.8050339, 2.673184, 1, 1, 1, 1, 1,
0.08927479, -0.3271162, 2.370053, 1, 1, 1, 1, 1,
0.09053274, 1.726931, 0.8154656, 1, 1, 1, 1, 1,
0.09835482, 0.9047649, 2.052908, 1, 1, 1, 1, 1,
0.1008189, -0.3483002, 3.459049, 1, 1, 1, 1, 1,
0.102209, -0.00649947, 2.202912, 1, 1, 1, 1, 1,
0.1067563, -0.8331149, 3.048326, 1, 1, 1, 1, 1,
0.1068791, 0.5764633, 0.01041665, 1, 1, 1, 1, 1,
0.1071133, -1.671334, 2.658288, 1, 1, 1, 1, 1,
0.1073439, 0.001694066, 1.573851, 1, 1, 1, 1, 1,
0.1076475, 0.5432941, 0.5078397, 1, 1, 1, 1, 1,
0.107666, -0.1255475, 2.937554, 1, 1, 1, 1, 1,
0.1233822, -1.134443, 3.73152, 1, 1, 1, 1, 1,
0.125812, 1.711689, 0.5612231, 1, 1, 1, 1, 1,
0.1259156, 1.305026, -0.5718828, 1, 1, 1, 1, 1,
0.1265015, 0.281781, 1.102951, 0, 0, 1, 1, 1,
0.1322447, -0.805038, 3.627229, 1, 0, 0, 1, 1,
0.1346918, -1.287971, 2.109916, 1, 0, 0, 1, 1,
0.1373718, -0.4766227, 1.459326, 1, 0, 0, 1, 1,
0.1379721, -0.8547356, 4.168105, 1, 0, 0, 1, 1,
0.1384809, 1.359799, 1.327837, 1, 0, 0, 1, 1,
0.1466431, -0.1036983, 2.312989, 0, 0, 0, 1, 1,
0.1485492, -0.1468138, 1.778644, 0, 0, 0, 1, 1,
0.1496999, -0.9282413, 2.54254, 0, 0, 0, 1, 1,
0.1508498, -1.750468, 4.355258, 0, 0, 0, 1, 1,
0.1547556, 0.04646382, 2.235489, 0, 0, 0, 1, 1,
0.156954, 2.012188, 0.8784109, 0, 0, 0, 1, 1,
0.1646103, 1.434672, -0.4975368, 0, 0, 0, 1, 1,
0.1675008, -1.059435, 3.332736, 1, 1, 1, 1, 1,
0.1676132, 1.715463, -0.4846339, 1, 1, 1, 1, 1,
0.1690056, -1.054899, 3.722436, 1, 1, 1, 1, 1,
0.1710096, 0.2691017, -0.2762761, 1, 1, 1, 1, 1,
0.1710424, 0.984357, -1.370215, 1, 1, 1, 1, 1,
0.1754234, -0.8995499, 1.960567, 1, 1, 1, 1, 1,
0.1754536, 1.601539, -0.6650149, 1, 1, 1, 1, 1,
0.1855089, -0.1596269, 2.116161, 1, 1, 1, 1, 1,
0.190648, 1.172765, 0.6673434, 1, 1, 1, 1, 1,
0.1954815, -0.2089126, 2.11796, 1, 1, 1, 1, 1,
0.2014915, 2.760792, -0.02623832, 1, 1, 1, 1, 1,
0.2036758, 0.3204897, 0.4892214, 1, 1, 1, 1, 1,
0.2042188, 0.2901873, 1.049295, 1, 1, 1, 1, 1,
0.2055271, 1.056488, 1.355821, 1, 1, 1, 1, 1,
0.2058839, 0.852345, 0.2194109, 1, 1, 1, 1, 1,
0.2068453, -0.08707386, 3.556626, 0, 0, 1, 1, 1,
0.2095732, 0.9554499, 0.3138664, 1, 0, 0, 1, 1,
0.2100286, -0.4724465, 2.341439, 1, 0, 0, 1, 1,
0.2128536, 0.02360698, 1.389272, 1, 0, 0, 1, 1,
0.213193, -0.3141123, 1.399581, 1, 0, 0, 1, 1,
0.2148553, -1.157438, 3.30772, 1, 0, 0, 1, 1,
0.2150194, 0.2888171, 0.8667791, 0, 0, 0, 1, 1,
0.2232956, 0.9944459, 0.05905719, 0, 0, 0, 1, 1,
0.2235693, 0.3638907, 0.5477022, 0, 0, 0, 1, 1,
0.2249064, -0.2092167, 2.016326, 0, 0, 0, 1, 1,
0.2271453, -1.492931, 4.012304, 0, 0, 0, 1, 1,
0.2283115, 1.041009, -0.3875178, 0, 0, 0, 1, 1,
0.2301618, -0.23062, 4.462313, 0, 0, 0, 1, 1,
0.2337386, -0.03712391, 1.260989, 1, 1, 1, 1, 1,
0.2374439, -0.4295235, 2.006454, 1, 1, 1, 1, 1,
0.2383645, 1.666201, 2.1158, 1, 1, 1, 1, 1,
0.2483063, 0.1556603, 0.383253, 1, 1, 1, 1, 1,
0.2517309, 1.191354, 3.196991, 1, 1, 1, 1, 1,
0.2520348, -0.4671016, 3.704945, 1, 1, 1, 1, 1,
0.2555626, -0.3837982, 1.730329, 1, 1, 1, 1, 1,
0.2564809, 2.07109, 0.06220804, 1, 1, 1, 1, 1,
0.2573728, 0.949142, -0.2323888, 1, 1, 1, 1, 1,
0.2653086, 1.578613, 0.9848909, 1, 1, 1, 1, 1,
0.2690194, -0.2211713, 2.362845, 1, 1, 1, 1, 1,
0.2698623, 0.5885229, -0.3391144, 1, 1, 1, 1, 1,
0.272568, -0.7207243, 1.010019, 1, 1, 1, 1, 1,
0.2772245, 1.962535, -1.286823, 1, 1, 1, 1, 1,
0.2800357, 2.366126, -0.6824185, 1, 1, 1, 1, 1,
0.2819695, 0.489498, 0.5443521, 0, 0, 1, 1, 1,
0.2850838, 0.6514665, 0.67247, 1, 0, 0, 1, 1,
0.285245, 0.951902, -0.9847838, 1, 0, 0, 1, 1,
0.2904684, -0.3478129, 0.4128273, 1, 0, 0, 1, 1,
0.2919686, -0.04224485, 2.049878, 1, 0, 0, 1, 1,
0.2934236, 0.5249555, 0.7527691, 1, 0, 0, 1, 1,
0.2960411, -1.678792, 3.684111, 0, 0, 0, 1, 1,
0.2971664, -2.012501, 1.697748, 0, 0, 0, 1, 1,
0.3059362, 0.2982488, -0.9854346, 0, 0, 0, 1, 1,
0.3117487, -0.3968503, 1.316874, 0, 0, 0, 1, 1,
0.3131618, -0.3391598, 2.905122, 0, 0, 0, 1, 1,
0.3186905, 0.1275904, 1.184318, 0, 0, 0, 1, 1,
0.3187502, -0.144559, 3.354917, 0, 0, 0, 1, 1,
0.3191075, -1.539704, 3.99294, 1, 1, 1, 1, 1,
0.3201808, -1.744855, 3.162162, 1, 1, 1, 1, 1,
0.3207271, 1.27789, 0.8064576, 1, 1, 1, 1, 1,
0.3224293, -0.183299, 1.605774, 1, 1, 1, 1, 1,
0.3272825, -0.5336334, 2.927951, 1, 1, 1, 1, 1,
0.3321811, 0.969763, -0.9661208, 1, 1, 1, 1, 1,
0.337547, -3.423555, 2.286445, 1, 1, 1, 1, 1,
0.3432738, 0.9046197, -1.411542, 1, 1, 1, 1, 1,
0.3452632, 0.1356155, 3.456246, 1, 1, 1, 1, 1,
0.3558737, 0.682973, 0.3270546, 1, 1, 1, 1, 1,
0.3565476, 0.8526874, 0.3600314, 1, 1, 1, 1, 1,
0.3582718, 0.9701431, 0.07089593, 1, 1, 1, 1, 1,
0.3623239, 0.03494769, 3.484328, 1, 1, 1, 1, 1,
0.3624385, 1.22145, -0.8062885, 1, 1, 1, 1, 1,
0.3639416, 1.066849, 0.2443032, 1, 1, 1, 1, 1,
0.3674387, -0.3904798, 2.132457, 0, 0, 1, 1, 1,
0.3676603, -0.6783076, 3.465203, 1, 0, 0, 1, 1,
0.3732919, -0.2470733, 1.47602, 1, 0, 0, 1, 1,
0.3765787, 0.2322576, 1.388726, 1, 0, 0, 1, 1,
0.3771363, -0.4673152, 3.141803, 1, 0, 0, 1, 1,
0.3795476, -0.6712656, 3.618088, 1, 0, 0, 1, 1,
0.3891006, 0.4359792, 2.131642, 0, 0, 0, 1, 1,
0.3930187, 1.307692, 1.454034, 0, 0, 0, 1, 1,
0.3991111, -0.3607188, 3.329869, 0, 0, 0, 1, 1,
0.399176, -0.2862263, 2.445045, 0, 0, 0, 1, 1,
0.402055, 2.234739, 0.4664874, 0, 0, 0, 1, 1,
0.4027719, 0.8227192, 1.606429, 0, 0, 0, 1, 1,
0.4030786, -0.6127047, 2.931417, 0, 0, 0, 1, 1,
0.4055443, 0.2666616, -0.327834, 1, 1, 1, 1, 1,
0.4058157, -1.833854, 3.172756, 1, 1, 1, 1, 1,
0.4068016, -1.84294, 2.740035, 1, 1, 1, 1, 1,
0.4075003, -0.1552305, 1.790024, 1, 1, 1, 1, 1,
0.4104275, -0.01690286, 1.236578, 1, 1, 1, 1, 1,
0.4105402, -0.3517466, 1.43149, 1, 1, 1, 1, 1,
0.4180932, -1.364189, 4.013807, 1, 1, 1, 1, 1,
0.4299273, 0.8915877, 0.427855, 1, 1, 1, 1, 1,
0.4315435, 1.608491, 0.4594906, 1, 1, 1, 1, 1,
0.434348, -0.4490416, 1.835957, 1, 1, 1, 1, 1,
0.4353674, 0.5940676, 0.5793135, 1, 1, 1, 1, 1,
0.4396386, -0.4715551, 0.6258506, 1, 1, 1, 1, 1,
0.4432602, -2.144974, 3.187734, 1, 1, 1, 1, 1,
0.4441187, -0.5273279, 2.653578, 1, 1, 1, 1, 1,
0.4478419, 0.0108905, 1.541961, 1, 1, 1, 1, 1,
0.4488088, -1.999809, 4.59887, 0, 0, 1, 1, 1,
0.4560518, -1.641603, 2.742293, 1, 0, 0, 1, 1,
0.4580277, -0.6024681, 2.327836, 1, 0, 0, 1, 1,
0.4697683, 0.1552468, 0.5829929, 1, 0, 0, 1, 1,
0.4706177, 0.4353667, 1.643819, 1, 0, 0, 1, 1,
0.4718813, -0.1909674, 0.347596, 1, 0, 0, 1, 1,
0.4727942, -0.2125563, 0.1954882, 0, 0, 0, 1, 1,
0.4730499, -1.211472, 1.558138, 0, 0, 0, 1, 1,
0.4739965, 0.8105226, 1.362709, 0, 0, 0, 1, 1,
0.4741887, -0.2875906, 2.141816, 0, 0, 0, 1, 1,
0.4840552, -0.6050534, 1.090751, 0, 0, 0, 1, 1,
0.4857297, 1.074939, 0.04133027, 0, 0, 0, 1, 1,
0.4880387, 1.074418, 0.8236407, 0, 0, 0, 1, 1,
0.4932402, -1.388032, 4.808453, 1, 1, 1, 1, 1,
0.4987521, -1.187773, 3.878931, 1, 1, 1, 1, 1,
0.5004114, -1.09231, 3.504962, 1, 1, 1, 1, 1,
0.5049925, 0.4586301, 1.080859, 1, 1, 1, 1, 1,
0.5067594, -1.722683, 3.048327, 1, 1, 1, 1, 1,
0.5070181, 1.709991, 0.1098171, 1, 1, 1, 1, 1,
0.5098168, -0.3760608, 3.866554, 1, 1, 1, 1, 1,
0.5105889, -0.9570283, 5.043862, 1, 1, 1, 1, 1,
0.5125883, -0.1855725, 2.964987, 1, 1, 1, 1, 1,
0.5133103, 1.491263, -0.5947626, 1, 1, 1, 1, 1,
0.5146731, -0.5416963, 2.187951, 1, 1, 1, 1, 1,
0.516898, 1.560011, 0.07487223, 1, 1, 1, 1, 1,
0.5173155, 0.7823516, 1.572705, 1, 1, 1, 1, 1,
0.5238698, -0.5887887, 1.77784, 1, 1, 1, 1, 1,
0.5293939, 0.2841117, 1.913017, 1, 1, 1, 1, 1,
0.5299472, 0.02421995, 0.1221463, 0, 0, 1, 1, 1,
0.5317201, 0.5537093, 0.963634, 1, 0, 0, 1, 1,
0.5403782, 0.5114217, 1.473397, 1, 0, 0, 1, 1,
0.5408466, 0.6889096, 0.1344709, 1, 0, 0, 1, 1,
0.5433758, -1.273218, 2.334244, 1, 0, 0, 1, 1,
0.5476499, 1.030776, -0.3191205, 1, 0, 0, 1, 1,
0.5489442, -0.1207905, 3.922488, 0, 0, 0, 1, 1,
0.5503947, 0.0947284, -0.2501494, 0, 0, 0, 1, 1,
0.5513449, 1.195175, -1.275035, 0, 0, 0, 1, 1,
0.5553917, 0.6234333, 1.161479, 0, 0, 0, 1, 1,
0.5560265, -0.7996897, 1.329587, 0, 0, 0, 1, 1,
0.5578466, -1.04289, 3.748885, 0, 0, 0, 1, 1,
0.5635274, 0.7833545, 0.5093981, 0, 0, 0, 1, 1,
0.5670326, 1.025317, 1.614462, 1, 1, 1, 1, 1,
0.5679282, 0.474245, 1.0634, 1, 1, 1, 1, 1,
0.5729974, 0.8044785, 0.4702986, 1, 1, 1, 1, 1,
0.5749378, -0.6844895, 1.369824, 1, 1, 1, 1, 1,
0.5760809, 1.258959, -0.921524, 1, 1, 1, 1, 1,
0.5771739, 0.151896, 0.366948, 1, 1, 1, 1, 1,
0.5819447, -0.7851822, 1.339512, 1, 1, 1, 1, 1,
0.5882872, -0.6015827, 1.963874, 1, 1, 1, 1, 1,
0.5890783, -0.008295063, 1.155241, 1, 1, 1, 1, 1,
0.5914492, 0.08636961, 0.171841, 1, 1, 1, 1, 1,
0.5933061, 1.561815, 0.4794014, 1, 1, 1, 1, 1,
0.5941294, -0.1463298, 3.164917, 1, 1, 1, 1, 1,
0.6025645, -1.511458, 3.496157, 1, 1, 1, 1, 1,
0.6044263, 0.665499, 0.2304413, 1, 1, 1, 1, 1,
0.604551, -1.718883, 5.160702, 1, 1, 1, 1, 1,
0.6085894, -0.7113464, 2.580244, 0, 0, 1, 1, 1,
0.6113943, 0.1629672, 1.596267, 1, 0, 0, 1, 1,
0.6115837, -0.3893397, 2.758405, 1, 0, 0, 1, 1,
0.615832, -0.8919759, 1.50698, 1, 0, 0, 1, 1,
0.619481, 0.4401323, -0.2047, 1, 0, 0, 1, 1,
0.6195865, 1.487973, 0.6743764, 1, 0, 0, 1, 1,
0.6205084, 0.3808494, 0.9214019, 0, 0, 0, 1, 1,
0.6210209, 1.521275, 0.02870042, 0, 0, 0, 1, 1,
0.6246296, -1.463808, 1.284157, 0, 0, 0, 1, 1,
0.6274543, -1.14979, 2.814284, 0, 0, 0, 1, 1,
0.6288066, 0.04492024, 1.761214, 0, 0, 0, 1, 1,
0.630367, 0.2198164, 2.164301, 0, 0, 0, 1, 1,
0.6377003, 0.07809906, 1.941324, 0, 0, 0, 1, 1,
0.6411836, 2.137375, -0.1167955, 1, 1, 1, 1, 1,
0.6429798, 0.1635534, 2.021112, 1, 1, 1, 1, 1,
0.6449004, -0.8082503, 2.516523, 1, 1, 1, 1, 1,
0.6455532, -0.2082129, 2.058669, 1, 1, 1, 1, 1,
0.6523857, 0.3219778, 1.37373, 1, 1, 1, 1, 1,
0.6644055, 0.2124895, 1.274064, 1, 1, 1, 1, 1,
0.6724079, 1.269853, -1.329121, 1, 1, 1, 1, 1,
0.6750141, 0.3066885, 0.6197542, 1, 1, 1, 1, 1,
0.6758279, -0.563233, 1.953586, 1, 1, 1, 1, 1,
0.6813601, 0.5153075, 0.3237333, 1, 1, 1, 1, 1,
0.6885617, -1.69085, 2.304633, 1, 1, 1, 1, 1,
0.6899452, -0.6683033, 1.646719, 1, 1, 1, 1, 1,
0.6926001, -0.599902, 1.562021, 1, 1, 1, 1, 1,
0.6927205, 1.617798, 0.5584934, 1, 1, 1, 1, 1,
0.6964538, -0.7183419, 1.211767, 1, 1, 1, 1, 1,
0.6970934, 1.806272, -0.2102407, 0, 0, 1, 1, 1,
0.6983246, -0.8612618, 3.075893, 1, 0, 0, 1, 1,
0.6999456, -0.6297252, 2.220432, 1, 0, 0, 1, 1,
0.7002667, 0.07027587, 1.8253, 1, 0, 0, 1, 1,
0.7024257, -0.7186331, 1.959522, 1, 0, 0, 1, 1,
0.7032706, 1.237406, -0.742134, 1, 0, 0, 1, 1,
0.7036942, -0.668911, 0.5633039, 0, 0, 0, 1, 1,
0.7056066, -1.702938, 4.146904, 0, 0, 0, 1, 1,
0.7079228, 0.1252033, -0.3001281, 0, 0, 0, 1, 1,
0.7081625, -0.2245028, 2.472713, 0, 0, 0, 1, 1,
0.7088845, -2.18167, 3.403605, 0, 0, 0, 1, 1,
0.7089953, -0.2502793, 1.87062, 0, 0, 0, 1, 1,
0.7090707, 0.6125944, 0.9726759, 0, 0, 0, 1, 1,
0.7122458, 1.673561, -1.070041, 1, 1, 1, 1, 1,
0.7127261, 1.463354, -0.5963218, 1, 1, 1, 1, 1,
0.7140457, -1.100711, 2.683307, 1, 1, 1, 1, 1,
0.7147942, 0.250214, 0.06180265, 1, 1, 1, 1, 1,
0.7162249, -0.04674698, 1.849443, 1, 1, 1, 1, 1,
0.7170765, 0.1783387, 2.517189, 1, 1, 1, 1, 1,
0.7174441, -0.735162, 1.5749, 1, 1, 1, 1, 1,
0.723748, -0.5321788, 1.737865, 1, 1, 1, 1, 1,
0.7267774, -1.514833, 2.523227, 1, 1, 1, 1, 1,
0.7318503, -1.776756, 3.10693, 1, 1, 1, 1, 1,
0.7459098, 0.6511106, 0.4844179, 1, 1, 1, 1, 1,
0.752422, 0.4425313, 3.463051, 1, 1, 1, 1, 1,
0.754641, -0.08145264, 0.4193327, 1, 1, 1, 1, 1,
0.7564516, 0.2719887, 3.215672, 1, 1, 1, 1, 1,
0.7566917, -1.531502, 4.094824, 1, 1, 1, 1, 1,
0.7600402, -0.8458367, 2.309019, 0, 0, 1, 1, 1,
0.7617968, 0.3126195, 1.583535, 1, 0, 0, 1, 1,
0.7633975, -0.02780437, 2.847883, 1, 0, 0, 1, 1,
0.7666857, 0.9266025, -0.3840915, 1, 0, 0, 1, 1,
0.7723607, 0.2274754, 0.976523, 1, 0, 0, 1, 1,
0.7775607, -1.293008, 2.9954, 1, 0, 0, 1, 1,
0.7792178, 1.1923, -0.7923079, 0, 0, 0, 1, 1,
0.7811838, 1.305359, -0.9183838, 0, 0, 0, 1, 1,
0.7823828, 0.6950567, 1.841405, 0, 0, 0, 1, 1,
0.7838769, 1.589012, 0.2207405, 0, 0, 0, 1, 1,
0.7882648, 0.06207186, 1.263506, 0, 0, 0, 1, 1,
0.8070986, -1.229526, 4.446135, 0, 0, 0, 1, 1,
0.8096749, 1.205318, 0.03463055, 0, 0, 0, 1, 1,
0.8097672, -1.216073, 0.8373688, 1, 1, 1, 1, 1,
0.8101028, -0.3908888, 3.693907, 1, 1, 1, 1, 1,
0.8201844, 0.1111172, 1.755671, 1, 1, 1, 1, 1,
0.822417, 0.7990904, 2.64329, 1, 1, 1, 1, 1,
0.8283724, -0.4589283, 2.896958, 1, 1, 1, 1, 1,
0.830614, 0.8184777, 0.2819562, 1, 1, 1, 1, 1,
0.8321851, -2.185186, 4.423036, 1, 1, 1, 1, 1,
0.8372573, 0.6320375, 0.6789001, 1, 1, 1, 1, 1,
0.8373538, 1.13316, 0.8724158, 1, 1, 1, 1, 1,
0.8408123, -0.5225888, 1.883076, 1, 1, 1, 1, 1,
0.8574604, -1.702573, 2.538018, 1, 1, 1, 1, 1,
0.8622098, 0.4379277, 0.9171433, 1, 1, 1, 1, 1,
0.8636779, 0.5874082, 1.452224, 1, 1, 1, 1, 1,
0.8685654, 0.03197607, 0.1244119, 1, 1, 1, 1, 1,
0.8694802, -2.251616, 3.323753, 1, 1, 1, 1, 1,
0.8723242, -0.8013361, 3.037297, 0, 0, 1, 1, 1,
0.8787597, 0.6884143, 0.2374659, 1, 0, 0, 1, 1,
0.880782, 0.6633, 1.192151, 1, 0, 0, 1, 1,
0.8816726, 1.51452, -0.0107379, 1, 0, 0, 1, 1,
0.8830813, 1.036729, 1.731273, 1, 0, 0, 1, 1,
0.8851569, -1.845794, 1.862037, 1, 0, 0, 1, 1,
0.8913324, 0.6999577, 0.9926258, 0, 0, 0, 1, 1,
0.8935689, 0.4041098, 1.367657, 0, 0, 0, 1, 1,
0.8941439, -1.313407, 0.7500057, 0, 0, 0, 1, 1,
0.8948569, 0.1952005, 0.8888051, 0, 0, 0, 1, 1,
0.8972283, -0.08107392, 1.536468, 0, 0, 0, 1, 1,
0.8985551, -0.02154421, 2.233845, 0, 0, 0, 1, 1,
0.8990036, 0.7118124, 1.231026, 0, 0, 0, 1, 1,
0.9036263, 0.5656347, 2.842048, 1, 1, 1, 1, 1,
0.904045, 1.419401, -0.2985898, 1, 1, 1, 1, 1,
0.9125443, -0.4386246, 1.725476, 1, 1, 1, 1, 1,
0.9194605, 0.4314368, 1.120871, 1, 1, 1, 1, 1,
0.9202081, 0.5071423, 0.6580646, 1, 1, 1, 1, 1,
0.9270778, 0.4119892, 0.2971362, 1, 1, 1, 1, 1,
0.9276187, -0.4202106, 1.444442, 1, 1, 1, 1, 1,
0.9306167, -1.186996, 2.596688, 1, 1, 1, 1, 1,
0.9328537, 0.5162802, 1.093769, 1, 1, 1, 1, 1,
0.9439499, -0.4339325, 2.706329, 1, 1, 1, 1, 1,
0.9442131, 1.396902, -1.662502, 1, 1, 1, 1, 1,
0.947054, -1.355844, 3.506247, 1, 1, 1, 1, 1,
0.949246, -0.5391133, 1.547691, 1, 1, 1, 1, 1,
0.9503878, 0.2714314, 0.1805291, 1, 1, 1, 1, 1,
0.9535235, -1.428452, 3.504339, 1, 1, 1, 1, 1,
0.9552897, 1.370856, 0.5267087, 0, 0, 1, 1, 1,
0.9570701, -0.2369856, 1.533894, 1, 0, 0, 1, 1,
0.9695256, 0.768732, 0.3335791, 1, 0, 0, 1, 1,
0.9697108, 0.2800247, 1.635882, 1, 0, 0, 1, 1,
0.9780134, -0.1677021, 2.264494, 1, 0, 0, 1, 1,
0.9815972, 1.049196, 0.2661426, 1, 0, 0, 1, 1,
0.9915746, -0.9518385, 1.022624, 0, 0, 0, 1, 1,
0.9997227, -0.01040114, 1.321313, 0, 0, 0, 1, 1,
1.001422, 0.828811, 0.4147182, 0, 0, 0, 1, 1,
1.003592, -1.755882, 3.339231, 0, 0, 0, 1, 1,
1.005567, 1.314924, -0.3841094, 0, 0, 0, 1, 1,
1.007839, -0.2647806, 2.865002, 0, 0, 0, 1, 1,
1.009473, 1.344075, 0.1399219, 0, 0, 0, 1, 1,
1.014495, -1.266381, 0.6042098, 1, 1, 1, 1, 1,
1.019854, 0.2281209, 0.9624281, 1, 1, 1, 1, 1,
1.027203, -0.4964218, 1.563576, 1, 1, 1, 1, 1,
1.028847, -0.04307105, 1.151435, 1, 1, 1, 1, 1,
1.031961, -1.67082, 3.872499, 1, 1, 1, 1, 1,
1.036622, 0.5614318, 1.907379, 1, 1, 1, 1, 1,
1.050485, -1.436509, 1.477796, 1, 1, 1, 1, 1,
1.053267, -1.521756, 3.487166, 1, 1, 1, 1, 1,
1.055697, -0.1165089, 2.993284, 1, 1, 1, 1, 1,
1.056119, 0.9556355, -0.1713605, 1, 1, 1, 1, 1,
1.057607, -0.9076955, 0.9361145, 1, 1, 1, 1, 1,
1.058796, 0.3217911, 0.5002828, 1, 1, 1, 1, 1,
1.066729, 0.07191128, 0.4358393, 1, 1, 1, 1, 1,
1.068611, -1.836801, 3.418692, 1, 1, 1, 1, 1,
1.081936, -2.254481, 4.135738, 1, 1, 1, 1, 1,
1.082536, 0.1864797, 2.891333, 0, 0, 1, 1, 1,
1.085142, -1.001323, 1.891532, 1, 0, 0, 1, 1,
1.088451, 0.1829764, 1.291967, 1, 0, 0, 1, 1,
1.095061, 0.2296698, 0.3270775, 1, 0, 0, 1, 1,
1.095105, -1.312407, 2.66002, 1, 0, 0, 1, 1,
1.096873, 0.8016109, 0.2347706, 1, 0, 0, 1, 1,
1.09928, 0.2331593, 0.3843037, 0, 0, 0, 1, 1,
1.113824, 0.7030627, -0.617936, 0, 0, 0, 1, 1,
1.119319, 1.225084, 0.6655356, 0, 0, 0, 1, 1,
1.122862, 0.2167845, 0.8713818, 0, 0, 0, 1, 1,
1.128425, 1.650368, -1.060984, 0, 0, 0, 1, 1,
1.137784, 0.9332982, 3.496859, 0, 0, 0, 1, 1,
1.139491, -0.007381314, 3.245172, 0, 0, 0, 1, 1,
1.142157, -1.9404, 2.743823, 1, 1, 1, 1, 1,
1.146845, 0.8905616, 0.4458236, 1, 1, 1, 1, 1,
1.151326, 0.5926498, 0.02354464, 1, 1, 1, 1, 1,
1.154208, -1.781741, 2.333857, 1, 1, 1, 1, 1,
1.15512, -0.7895662, 2.080349, 1, 1, 1, 1, 1,
1.156404, 1.308615, 0.7754714, 1, 1, 1, 1, 1,
1.160822, -0.7097906, 2.153588, 1, 1, 1, 1, 1,
1.1652, 0.02119546, 1.269033, 1, 1, 1, 1, 1,
1.183834, -0.1681325, 0.795309, 1, 1, 1, 1, 1,
1.191488, -1.187908, 1.296573, 1, 1, 1, 1, 1,
1.193481, 0.3237237, -0.0320323, 1, 1, 1, 1, 1,
1.199756, 0.6988563, 2.331743, 1, 1, 1, 1, 1,
1.199936, -1.918188, 0.7976572, 1, 1, 1, 1, 1,
1.207867, -1.719714, 2.60654, 1, 1, 1, 1, 1,
1.213497, -0.03979072, 1.078772, 1, 1, 1, 1, 1,
1.21553, -1.181012, 0.8441117, 0, 0, 1, 1, 1,
1.220098, -0.4331877, 1.320439, 1, 0, 0, 1, 1,
1.221823, 0.3946371, -1.230123, 1, 0, 0, 1, 1,
1.25019, 1.167594, 0.7861124, 1, 0, 0, 1, 1,
1.261984, 0.5634817, -0.6592529, 1, 0, 0, 1, 1,
1.262116, 0.2070886, 0.464174, 1, 0, 0, 1, 1,
1.265627, -0.5103253, 1.221331, 0, 0, 0, 1, 1,
1.268495, -0.851965, 2.315486, 0, 0, 0, 1, 1,
1.276523, 0.8521658, -0.6952905, 0, 0, 0, 1, 1,
1.281173, -0.8495683, 1.396623, 0, 0, 0, 1, 1,
1.285428, 0.3052602, 1.616284, 0, 0, 0, 1, 1,
1.286246, 0.667338, 0.5429569, 0, 0, 0, 1, 1,
1.295619, 0.3618058, 2.179861, 0, 0, 0, 1, 1,
1.296899, 0.2010486, 3.110045, 1, 1, 1, 1, 1,
1.317012, -0.3259446, 1.771124, 1, 1, 1, 1, 1,
1.320993, -1.086312, 1.870993, 1, 1, 1, 1, 1,
1.324225, 0.2720252, 1.724227, 1, 1, 1, 1, 1,
1.344349, 0.6723439, 1.145208, 1, 1, 1, 1, 1,
1.349691, -0.2676278, 1.300061, 1, 1, 1, 1, 1,
1.351153, 0.2863951, 0.2762797, 1, 1, 1, 1, 1,
1.35579, 1.458204, 1.512281, 1, 1, 1, 1, 1,
1.383155, -0.1298389, 0.1125218, 1, 1, 1, 1, 1,
1.388167, 0.5686623, -1.557898, 1, 1, 1, 1, 1,
1.391495, 1.210266, 0.9188288, 1, 1, 1, 1, 1,
1.392445, 0.3292781, -0.1600176, 1, 1, 1, 1, 1,
1.394621, -1.925939, 1.440365, 1, 1, 1, 1, 1,
1.395606, -0.5437152, -0.3261362, 1, 1, 1, 1, 1,
1.404753, -1.22527, 1.242264, 1, 1, 1, 1, 1,
1.41775, 2.305093, -0.06464909, 0, 0, 1, 1, 1,
1.418486, 2.029127, -0.1244183, 1, 0, 0, 1, 1,
1.422683, -1.76085, 2.61059, 1, 0, 0, 1, 1,
1.428003, -0.7232171, 1.998748, 1, 0, 0, 1, 1,
1.455037, 1.865856, 0.0764828, 1, 0, 0, 1, 1,
1.465035, 0.758444, 2.11892, 1, 0, 0, 1, 1,
1.465063, -1.09646, 4.322358, 0, 0, 0, 1, 1,
1.465278, 1.611455, -0.5196704, 0, 0, 0, 1, 1,
1.466786, -1.322861, 2.576855, 0, 0, 0, 1, 1,
1.473045, 1.414366, 2.742034, 0, 0, 0, 1, 1,
1.482582, -0.2110078, 2.51633, 0, 0, 0, 1, 1,
1.484727, 0.1574319, 0.9973114, 0, 0, 0, 1, 1,
1.50252, -0.09011768, 0.8173323, 0, 0, 0, 1, 1,
1.506427, -0.1712349, 1.664248, 1, 1, 1, 1, 1,
1.516643, 0.5570229, 2.144597, 1, 1, 1, 1, 1,
1.524941, 0.5095312, -0.8033353, 1, 1, 1, 1, 1,
1.525387, 2.871879, 1.768771, 1, 1, 1, 1, 1,
1.548872, 1.182674, 2.095798, 1, 1, 1, 1, 1,
1.556949, 0.6683777, 1.185887, 1, 1, 1, 1, 1,
1.560388, -1.1196, 3.171795, 1, 1, 1, 1, 1,
1.578829, 0.9677401, 1.502028, 1, 1, 1, 1, 1,
1.581896, -1.443355, 2.791397, 1, 1, 1, 1, 1,
1.582261, 1.799244, 0.1602427, 1, 1, 1, 1, 1,
1.594009, 0.4637145, 0.580107, 1, 1, 1, 1, 1,
1.607033, 1.743022, 0.3534964, 1, 1, 1, 1, 1,
1.620148, -0.06913617, 0.6733869, 1, 1, 1, 1, 1,
1.627674, -0.3121019, 1.379184, 1, 1, 1, 1, 1,
1.649413, -0.1818002, 1.348573, 1, 1, 1, 1, 1,
1.667699, -0.3516069, 1.805558, 0, 0, 1, 1, 1,
1.667934, -0.4033462, -0.1569172, 1, 0, 0, 1, 1,
1.669651, -1.089137, 1.391054, 1, 0, 0, 1, 1,
1.672656, 0.3798194, 1.42669, 1, 0, 0, 1, 1,
1.674037, 1.501527, 0.3890571, 1, 0, 0, 1, 1,
1.689347, 0.04175986, 1.85186, 1, 0, 0, 1, 1,
1.723454, -0.0398133, 2.278043, 0, 0, 0, 1, 1,
1.751904, -0.1397191, 2.074341, 0, 0, 0, 1, 1,
1.754611, 0.01422955, 0.2815473, 0, 0, 0, 1, 1,
1.761582, 1.208885, -0.09510991, 0, 0, 0, 1, 1,
1.7616, 0.3547009, -0.524307, 0, 0, 0, 1, 1,
1.766494, -0.9566951, 2.197357, 0, 0, 0, 1, 1,
1.786378, -0.04888115, 1.586558, 0, 0, 0, 1, 1,
1.815183, -0.4433008, 1.82686, 1, 1, 1, 1, 1,
1.81528, -0.8515793, 3.503636, 1, 1, 1, 1, 1,
1.819288, -1.95758, 1.898381, 1, 1, 1, 1, 1,
1.82006, -0.619639, 1.020555, 1, 1, 1, 1, 1,
1.8359, -2.256887, 3.488207, 1, 1, 1, 1, 1,
1.846627, -1.277262, 1.1755, 1, 1, 1, 1, 1,
1.869198, -1.178803, 0.6337428, 1, 1, 1, 1, 1,
1.883601, -1.966076, 1.519104, 1, 1, 1, 1, 1,
1.8902, -0.5004424, 2.900765, 1, 1, 1, 1, 1,
1.899697, 0.9678545, -0.005974432, 1, 1, 1, 1, 1,
1.908797, 0.5614083, 2.571659, 1, 1, 1, 1, 1,
1.927652, -0.5976432, 2.179091, 1, 1, 1, 1, 1,
1.928769, -0.08586695, 2.423833, 1, 1, 1, 1, 1,
1.930681, -0.8842769, 1.360413, 1, 1, 1, 1, 1,
1.975306, -1.364534, 4.675232, 1, 1, 1, 1, 1,
2.023715, -0.7385119, 1.829121, 0, 0, 1, 1, 1,
2.034098, 0.8187898, 0.7653186, 1, 0, 0, 1, 1,
2.050774, 0.1647802, 1.65499, 1, 0, 0, 1, 1,
2.062527, 0.8246697, 1.040161, 1, 0, 0, 1, 1,
2.083359, 0.04802517, 2.155846, 1, 0, 0, 1, 1,
2.086434, 1.238827, -1.199472, 1, 0, 0, 1, 1,
2.10151, 1.34113, 2.578733, 0, 0, 0, 1, 1,
2.12411, 0.5488478, 0.8593979, 0, 0, 0, 1, 1,
2.167628, 0.1615664, 1.450968, 0, 0, 0, 1, 1,
2.193195, 0.4301896, 1.464362, 0, 0, 0, 1, 1,
2.199468, -1.099366, 2.044548, 0, 0, 0, 1, 1,
2.237039, -0.1365406, 2.626147, 0, 0, 0, 1, 1,
2.241498, -0.2047487, 1.310626, 0, 0, 0, 1, 1,
2.281931, -0.2397549, 0.8006463, 1, 1, 1, 1, 1,
2.286389, -0.1320367, 2.312105, 1, 1, 1, 1, 1,
2.332753, 0.754449, 1.598074, 1, 1, 1, 1, 1,
2.498787, -0.3862799, 1.567666, 1, 1, 1, 1, 1,
2.696394, 0.0827619, 3.219024, 1, 1, 1, 1, 1,
2.732224, -0.9120145, 2.826465, 1, 1, 1, 1, 1,
2.740622, 0.3704162, 1.161717, 1, 1, 1, 1, 1
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
var radius = 9.636789;
var distance = 33.84881;
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
mvMatrix.translate( 0.3591408, 0.2239653, 0.3435714 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84881);
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
