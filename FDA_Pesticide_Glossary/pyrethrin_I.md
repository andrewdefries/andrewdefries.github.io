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
-2.724781, -0.3799916, -2.530446, 1, 0, 0, 1,
-2.645049, -0.04869269, -1.937433, 1, 0.007843138, 0, 1,
-2.537561, 0.7894851, -1.585055, 1, 0.01176471, 0, 1,
-2.402277, 0.3546145, -2.469584, 1, 0.01960784, 0, 1,
-2.385993, 0.38063, -3.106069, 1, 0.02352941, 0, 1,
-2.359697, 0.2580217, -1.715178, 1, 0.03137255, 0, 1,
-2.253201, -1.749083, -1.917057, 1, 0.03529412, 0, 1,
-2.22614, 0.4493843, -1.859859, 1, 0.04313726, 0, 1,
-2.218403, 0.552387, -1.287406, 1, 0.04705882, 0, 1,
-2.205574, 0.7126538, -1.625246, 1, 0.05490196, 0, 1,
-2.203208, -0.1260276, -2.385009, 1, 0.05882353, 0, 1,
-2.178549, -0.186603, -1.191787, 1, 0.06666667, 0, 1,
-2.126337, -0.964132, -1.234793, 1, 0.07058824, 0, 1,
-2.118713, -1.355873, -2.041309, 1, 0.07843138, 0, 1,
-2.089267, 1.017257, -1.426323, 1, 0.08235294, 0, 1,
-2.07619, -0.2351662, -2.359785, 1, 0.09019608, 0, 1,
-2.071719, -0.008102695, -2.328329, 1, 0.09411765, 0, 1,
-2.042511, 1.465558, -0.5439322, 1, 0.1019608, 0, 1,
-1.978444, -0.9684792, -1.415539, 1, 0.1098039, 0, 1,
-1.966103, 1.026455, 0.05959399, 1, 0.1137255, 0, 1,
-1.947855, 1.383159, -1.056396, 1, 0.1215686, 0, 1,
-1.923758, -1.779783, -0.3530008, 1, 0.1254902, 0, 1,
-1.915348, 0.2995747, -1.505334, 1, 0.1333333, 0, 1,
-1.912201, -1.149567, -2.120063, 1, 0.1372549, 0, 1,
-1.905358, -0.8192745, -0.2125566, 1, 0.145098, 0, 1,
-1.883729, 0.5019827, -1.155784, 1, 0.1490196, 0, 1,
-1.877903, -0.2558599, -0.5559291, 1, 0.1568628, 0, 1,
-1.851769, -0.8175559, -2.83134, 1, 0.1607843, 0, 1,
-1.851261, 0.1646383, -1.282602, 1, 0.1686275, 0, 1,
-1.847352, -1.343614, -0.4514287, 1, 0.172549, 0, 1,
-1.841402, -0.8755373, -0.3513046, 1, 0.1803922, 0, 1,
-1.839291, -0.4591315, -0.4398025, 1, 0.1843137, 0, 1,
-1.838973, 0.9577651, -1.168422, 1, 0.1921569, 0, 1,
-1.8151, -0.3366796, -1.37776, 1, 0.1960784, 0, 1,
-1.78291, -1.360915, -1.112806, 1, 0.2039216, 0, 1,
-1.771113, 0.5602534, -1.699667, 1, 0.2117647, 0, 1,
-1.742095, -1.829093, -4.375957, 1, 0.2156863, 0, 1,
-1.739743, 0.1761893, -0.4058558, 1, 0.2235294, 0, 1,
-1.73972, 0.1202369, -2.905947, 1, 0.227451, 0, 1,
-1.726322, -1.17719, -2.893609, 1, 0.2352941, 0, 1,
-1.709751, 0.6574768, -2.935124, 1, 0.2392157, 0, 1,
-1.683627, 0.7948852, -1.034691, 1, 0.2470588, 0, 1,
-1.674727, -1.193487, -4.330448, 1, 0.2509804, 0, 1,
-1.662486, 1.067918, -0.8528959, 1, 0.2588235, 0, 1,
-1.657398, -0.3075649, -1.609964, 1, 0.2627451, 0, 1,
-1.64883, -2.032791, -3.572942, 1, 0.2705882, 0, 1,
-1.643381, 0.1996514, -0.6540916, 1, 0.2745098, 0, 1,
-1.637128, 0.6089204, -1.179895, 1, 0.282353, 0, 1,
-1.6163, -1.654968, -2.645365, 1, 0.2862745, 0, 1,
-1.61581, 0.8863755, -2.157715, 1, 0.2941177, 0, 1,
-1.583982, -1.103922, -2.49594, 1, 0.3019608, 0, 1,
-1.5817, 0.1668999, -1.672161, 1, 0.3058824, 0, 1,
-1.577731, -1.892171, -2.832809, 1, 0.3137255, 0, 1,
-1.552559, -0.4498119, -2.054246, 1, 0.3176471, 0, 1,
-1.548503, 0.8027077, -0.6912261, 1, 0.3254902, 0, 1,
-1.534629, 1.390306, -0.4612683, 1, 0.3294118, 0, 1,
-1.532643, 0.4250123, -0.8035288, 1, 0.3372549, 0, 1,
-1.511776, 1.122174, -0.3920188, 1, 0.3411765, 0, 1,
-1.50681, 1.649382, -1.900902, 1, 0.3490196, 0, 1,
-1.506581, 0.4554788, -1.306904, 1, 0.3529412, 0, 1,
-1.506098, 0.8171387, -1.721855, 1, 0.3607843, 0, 1,
-1.50506, 0.5300625, -1.064582, 1, 0.3647059, 0, 1,
-1.489831, 0.835735, 0.7749201, 1, 0.372549, 0, 1,
-1.487717, -0.3062759, -2.239286, 1, 0.3764706, 0, 1,
-1.476316, -1.18856, -2.901527, 1, 0.3843137, 0, 1,
-1.474819, 1.539083, -2.254845, 1, 0.3882353, 0, 1,
-1.456233, -0.515154, -3.130705, 1, 0.3960784, 0, 1,
-1.451055, 2.459647, -1.041192, 1, 0.4039216, 0, 1,
-1.436572, 1.158336, -1.439903, 1, 0.4078431, 0, 1,
-1.429698, -2.371248, -2.833837, 1, 0.4156863, 0, 1,
-1.42534, 0.5893707, -2.823056, 1, 0.4196078, 0, 1,
-1.409241, -0.5642537, -1.442576, 1, 0.427451, 0, 1,
-1.400647, 0.6776066, -0.9241632, 1, 0.4313726, 0, 1,
-1.394374, -0.08271073, -0.5016782, 1, 0.4392157, 0, 1,
-1.38645, -1.729338, -3.029902, 1, 0.4431373, 0, 1,
-1.372225, -0.9368223, -2.775748, 1, 0.4509804, 0, 1,
-1.366052, 0.8569804, -0.4771312, 1, 0.454902, 0, 1,
-1.356886, 0.2482561, -0.7288483, 1, 0.4627451, 0, 1,
-1.344748, 2.221967, -3.160439, 1, 0.4666667, 0, 1,
-1.342375, 1.104076, -2.62861, 1, 0.4745098, 0, 1,
-1.341836, 0.750513, -1.047306, 1, 0.4784314, 0, 1,
-1.338068, -0.01182199, -1.34835, 1, 0.4862745, 0, 1,
-1.335275, 0.3339655, -2.043483, 1, 0.4901961, 0, 1,
-1.323165, 1.941964, -0.2160717, 1, 0.4980392, 0, 1,
-1.320548, -1.368841, -1.769174, 1, 0.5058824, 0, 1,
-1.301711, -0.9448677, -2.084413, 1, 0.509804, 0, 1,
-1.301094, 0.9853835, -1.007542, 1, 0.5176471, 0, 1,
-1.299619, 0.5657253, -0.5096888, 1, 0.5215687, 0, 1,
-1.29197, 0.6463015, -0.7666067, 1, 0.5294118, 0, 1,
-1.286498, 0.4977311, -1.199537, 1, 0.5333334, 0, 1,
-1.2845, -0.7363167, -1.863302, 1, 0.5411765, 0, 1,
-1.282174, 1.33278, 0.5382676, 1, 0.5450981, 0, 1,
-1.279044, 1.147454, 1.050925, 1, 0.5529412, 0, 1,
-1.271846, -0.2233564, -1.067934, 1, 0.5568628, 0, 1,
-1.270445, 0.3544331, -1.3227, 1, 0.5647059, 0, 1,
-1.269398, -1.107424, -2.606501, 1, 0.5686275, 0, 1,
-1.265887, 0.3801021, -2.118676, 1, 0.5764706, 0, 1,
-1.258702, 0.7508389, -2.86884, 1, 0.5803922, 0, 1,
-1.246402, 0.2518283, -2.103903, 1, 0.5882353, 0, 1,
-1.244468, 0.5783849, -1.947288, 1, 0.5921569, 0, 1,
-1.244051, -1.432038, -3.196078, 1, 0.6, 0, 1,
-1.233728, 1.95749, 0.3520295, 1, 0.6078432, 0, 1,
-1.233081, 0.9623666, -0.2785399, 1, 0.6117647, 0, 1,
-1.231623, 0.4593978, -1.606437, 1, 0.6196079, 0, 1,
-1.224846, 0.0553918, -0.4132133, 1, 0.6235294, 0, 1,
-1.221816, -0.5969593, -2.567388, 1, 0.6313726, 0, 1,
-1.215064, -1.103296, -3.569577, 1, 0.6352941, 0, 1,
-1.213342, -0.4008515, -1.549435, 1, 0.6431373, 0, 1,
-1.205366, 0.3341838, -1.519361, 1, 0.6470588, 0, 1,
-1.180357, -0.7989471, -0.645026, 1, 0.654902, 0, 1,
-1.171331, 0.137379, -0.6558407, 1, 0.6588235, 0, 1,
-1.170426, 1.229192, -0.5444946, 1, 0.6666667, 0, 1,
-1.165071, -0.9262487, -3.435004, 1, 0.6705883, 0, 1,
-1.164073, 0.9614598, -1.224522, 1, 0.6784314, 0, 1,
-1.148958, 0.8582883, 0.4449385, 1, 0.682353, 0, 1,
-1.139125, -0.5431243, -0.3097012, 1, 0.6901961, 0, 1,
-1.135963, -0.9284511, -2.008201, 1, 0.6941177, 0, 1,
-1.134158, -1.155701, -1.872792, 1, 0.7019608, 0, 1,
-1.121677, -1.029165, -0.6184669, 1, 0.7098039, 0, 1,
-1.1176, 0.1191067, -0.5526791, 1, 0.7137255, 0, 1,
-1.114202, 0.7959342, -3.420564, 1, 0.7215686, 0, 1,
-1.109753, -0.1874382, -3.564209, 1, 0.7254902, 0, 1,
-1.10918, -0.3418349, -3.824503, 1, 0.7333333, 0, 1,
-1.106642, -0.1046711, -2.248027, 1, 0.7372549, 0, 1,
-1.090755, -0.2873372, -2.567087, 1, 0.7450981, 0, 1,
-1.090595, 0.8045004, -1.725936, 1, 0.7490196, 0, 1,
-1.089781, 0.4518879, -0.2586412, 1, 0.7568628, 0, 1,
-1.083588, -1.19795, -0.8585291, 1, 0.7607843, 0, 1,
-1.082384, -1.621536, -3.250325, 1, 0.7686275, 0, 1,
-1.080577, -1.368026, -4.314744, 1, 0.772549, 0, 1,
-1.078412, 1.0717, -1.033243, 1, 0.7803922, 0, 1,
-1.077511, -1.408778, -3.20756, 1, 0.7843137, 0, 1,
-1.076844, 1.994307, -1.834062, 1, 0.7921569, 0, 1,
-1.073001, -0.4383647, -0.8242851, 1, 0.7960784, 0, 1,
-1.064951, -0.006785615, -0.5109033, 1, 0.8039216, 0, 1,
-1.064484, 0.9773002, -0.7847565, 1, 0.8117647, 0, 1,
-1.063564, -3.846854, -3.350601, 1, 0.8156863, 0, 1,
-1.055216, 0.1543771, 0.1103041, 1, 0.8235294, 0, 1,
-1.054783, 0.2453528, -1.291662, 1, 0.827451, 0, 1,
-1.052719, 1.121366, -1.43931, 1, 0.8352941, 0, 1,
-1.050204, -0.03847952, -2.565732, 1, 0.8392157, 0, 1,
-1.049831, -1.045028, -2.095173, 1, 0.8470588, 0, 1,
-1.045675, 0.3366052, -3.514112, 1, 0.8509804, 0, 1,
-1.041761, 0.6822712, 0.03141714, 1, 0.8588235, 0, 1,
-1.040905, 0.2650272, -1.590638, 1, 0.8627451, 0, 1,
-1.038048, 1.568972, -0.2118388, 1, 0.8705882, 0, 1,
-1.033897, -0.3690783, -0.7115874, 1, 0.8745098, 0, 1,
-1.033373, 0.2619457, -1.719431, 1, 0.8823529, 0, 1,
-1.025234, -0.6806356, -2.391358, 1, 0.8862745, 0, 1,
-1.022247, -0.8501568, -2.738527, 1, 0.8941177, 0, 1,
-1.012132, 0.736635, 0.8177507, 1, 0.8980392, 0, 1,
-1.005811, 0.6841612, -0.7112461, 1, 0.9058824, 0, 1,
-1.002561, 0.206232, -2.106327, 1, 0.9137255, 0, 1,
-1.001982, -0.4802662, -3.043093, 1, 0.9176471, 0, 1,
-1.001116, 2.01293, 0.9035626, 1, 0.9254902, 0, 1,
-0.997158, 0.4579987, -1.920165, 1, 0.9294118, 0, 1,
-0.9946222, 0.7792151, -0.2048727, 1, 0.9372549, 0, 1,
-0.9925078, -0.4647291, -0.4439395, 1, 0.9411765, 0, 1,
-0.9861388, 0.4574744, -0.1560398, 1, 0.9490196, 0, 1,
-0.9836946, -2.313801, -1.800704, 1, 0.9529412, 0, 1,
-0.9810638, 1.968411, -0.1783563, 1, 0.9607843, 0, 1,
-0.9722755, -1.020962, -2.146858, 1, 0.9647059, 0, 1,
-0.9643298, 0.1260766, -0.2804895, 1, 0.972549, 0, 1,
-0.9640645, -1.081067, -4.769568, 1, 0.9764706, 0, 1,
-0.9638861, 1.6025, -0.8332963, 1, 0.9843137, 0, 1,
-0.963646, -0.1776357, -1.64143, 1, 0.9882353, 0, 1,
-0.9551222, -0.8536357, -3.129807, 1, 0.9960784, 0, 1,
-0.9535046, -0.2996863, -2.442499, 0.9960784, 1, 0, 1,
-0.952951, -0.7166983, -2.481679, 0.9921569, 1, 0, 1,
-0.9465796, -0.641202, -2.040726, 0.9843137, 1, 0, 1,
-0.9443848, 0.2310834, -1.749904, 0.9803922, 1, 0, 1,
-0.9406727, -1.161228, -4.001399, 0.972549, 1, 0, 1,
-0.9372476, -1.36322, -2.562394, 0.9686275, 1, 0, 1,
-0.9362423, -0.1318949, -2.435966, 0.9607843, 1, 0, 1,
-0.9287214, 0.5346377, -1.718739, 0.9568627, 1, 0, 1,
-0.9203268, 0.3769321, -0.5593556, 0.9490196, 1, 0, 1,
-0.919043, -0.6862768, -0.1109577, 0.945098, 1, 0, 1,
-0.9186135, 1.538401, 0.02127568, 0.9372549, 1, 0, 1,
-0.9168877, -0.7647167, -2.000225, 0.9333333, 1, 0, 1,
-0.9168487, 1.84208, -0.7189237, 0.9254902, 1, 0, 1,
-0.9122709, -0.2088719, -2.780212, 0.9215686, 1, 0, 1,
-0.9110438, 0.2940675, -1.185756, 0.9137255, 1, 0, 1,
-0.908507, -1.352251, -1.534275, 0.9098039, 1, 0, 1,
-0.907065, 0.9675581, -1.83648, 0.9019608, 1, 0, 1,
-0.9063792, 0.9909959, -1.911525, 0.8941177, 1, 0, 1,
-0.9044824, -0.4072249, -3.704872, 0.8901961, 1, 0, 1,
-0.9024159, -1.557155, -1.954004, 0.8823529, 1, 0, 1,
-0.9020626, -0.7691445, -2.809038, 0.8784314, 1, 0, 1,
-0.9011729, 0.3257385, -1.36494, 0.8705882, 1, 0, 1,
-0.8989231, -0.7761677, -2.676324, 0.8666667, 1, 0, 1,
-0.8975663, -1.264896, -2.307595, 0.8588235, 1, 0, 1,
-0.8970434, -0.7334785, -3.440655, 0.854902, 1, 0, 1,
-0.8960869, -0.7672621, -4.282529, 0.8470588, 1, 0, 1,
-0.8879629, -0.2751706, -3.376726, 0.8431373, 1, 0, 1,
-0.8815016, 0.126857, -2.189267, 0.8352941, 1, 0, 1,
-0.8736573, -0.3231019, -3.589529, 0.8313726, 1, 0, 1,
-0.8708069, -0.3026991, -1.461694, 0.8235294, 1, 0, 1,
-0.8675675, 1.554058, -1.809476, 0.8196079, 1, 0, 1,
-0.8655538, -0.7696173, -3.65293, 0.8117647, 1, 0, 1,
-0.8643488, -0.4679972, -2.884364, 0.8078431, 1, 0, 1,
-0.8643122, -0.7513828, -1.085328, 0.8, 1, 0, 1,
-0.8630667, -0.6900411, -0.7498164, 0.7921569, 1, 0, 1,
-0.8628056, -0.05289484, -2.44867, 0.7882353, 1, 0, 1,
-0.856248, 0.4540762, -0.9707622, 0.7803922, 1, 0, 1,
-0.8525435, -1.229909, -3.244869, 0.7764706, 1, 0, 1,
-0.8499098, -1.84494, -2.621062, 0.7686275, 1, 0, 1,
-0.8494056, 0.5314698, -1.705921, 0.7647059, 1, 0, 1,
-0.8465219, 0.04351981, -2.175312, 0.7568628, 1, 0, 1,
-0.8429337, 0.06487358, -0.9136912, 0.7529412, 1, 0, 1,
-0.8404584, -0.2679912, -2.452227, 0.7450981, 1, 0, 1,
-0.8282048, 1.403713, 1.032329, 0.7411765, 1, 0, 1,
-0.8219818, -0.4195533, -1.684688, 0.7333333, 1, 0, 1,
-0.821198, -1.084228, -3.574811, 0.7294118, 1, 0, 1,
-0.818897, 0.4315667, -0.9455927, 0.7215686, 1, 0, 1,
-0.8146, -0.9307066, -2.800487, 0.7176471, 1, 0, 1,
-0.8133382, 1.215595, -0.9598972, 0.7098039, 1, 0, 1,
-0.8052356, -0.3430032, -3.567344, 0.7058824, 1, 0, 1,
-0.8012279, -0.4980836, -3.438491, 0.6980392, 1, 0, 1,
-0.7981365, 0.8783114, -0.2763979, 0.6901961, 1, 0, 1,
-0.7968063, 1.71649, -0.424125, 0.6862745, 1, 0, 1,
-0.7952737, -0.503507, -2.221243, 0.6784314, 1, 0, 1,
-0.7949309, 0.3715979, -1.691772, 0.6745098, 1, 0, 1,
-0.7907771, 0.7324839, -1.134091, 0.6666667, 1, 0, 1,
-0.7845167, -0.8584839, -1.682732, 0.6627451, 1, 0, 1,
-0.7836747, 0.7931864, -1.671695, 0.654902, 1, 0, 1,
-0.782083, -0.9055338, -4.075466, 0.6509804, 1, 0, 1,
-0.7804638, -1.861067, -2.81008, 0.6431373, 1, 0, 1,
-0.7788355, -1.824178, -3.106324, 0.6392157, 1, 0, 1,
-0.7777909, 0.745071, -0.3685707, 0.6313726, 1, 0, 1,
-0.7718565, 0.299709, -3.168182, 0.627451, 1, 0, 1,
-0.7677281, 0.6570192, -0.3721735, 0.6196079, 1, 0, 1,
-0.7672305, 0.3014245, -0.9279536, 0.6156863, 1, 0, 1,
-0.7610787, 0.1396003, -2.228584, 0.6078432, 1, 0, 1,
-0.7467775, 0.9734442, -1.700941, 0.6039216, 1, 0, 1,
-0.7424679, 0.04217137, -0.7610469, 0.5960785, 1, 0, 1,
-0.7412327, 1.749015, -1.058703, 0.5882353, 1, 0, 1,
-0.7370631, -0.110622, -1.036453, 0.5843138, 1, 0, 1,
-0.7347686, 1.054167, -0.2844688, 0.5764706, 1, 0, 1,
-0.7343637, 3.006976, -0.3490408, 0.572549, 1, 0, 1,
-0.7321266, -1.221743, -3.590005, 0.5647059, 1, 0, 1,
-0.7305057, -0.9294224, -2.434117, 0.5607843, 1, 0, 1,
-0.726877, 0.5939696, -1.418985, 0.5529412, 1, 0, 1,
-0.7235842, 1.330067, -0.6177415, 0.5490196, 1, 0, 1,
-0.7226495, -0.07233885, -0.9424242, 0.5411765, 1, 0, 1,
-0.7173356, -1.218492, -3.773578, 0.5372549, 1, 0, 1,
-0.7158669, -1.455919, -2.545942, 0.5294118, 1, 0, 1,
-0.7134096, 2.417518, -0.05692748, 0.5254902, 1, 0, 1,
-0.7132721, -0.9733496, -2.418359, 0.5176471, 1, 0, 1,
-0.7109634, -0.9728411, -2.803336, 0.5137255, 1, 0, 1,
-0.7085111, 1.677132, -0.978798, 0.5058824, 1, 0, 1,
-0.7071286, 1.459961, 0.4604296, 0.5019608, 1, 0, 1,
-0.7066628, 0.6163613, -1.830626, 0.4941176, 1, 0, 1,
-0.6803769, 0.01887107, -0.6017125, 0.4862745, 1, 0, 1,
-0.6774476, 0.9660403, -0.5704697, 0.4823529, 1, 0, 1,
-0.6746022, -0.1214038, -2.590052, 0.4745098, 1, 0, 1,
-0.674147, -2.390482, -4.292822, 0.4705882, 1, 0, 1,
-0.6731248, -0.2059446, -1.022501, 0.4627451, 1, 0, 1,
-0.6726122, -0.3286544, -1.327784, 0.4588235, 1, 0, 1,
-0.6598101, -2.041959, -1.365666, 0.4509804, 1, 0, 1,
-0.6566336, 0.1364069, -0.4974814, 0.4470588, 1, 0, 1,
-0.6542409, 0.4741713, -0.8461031, 0.4392157, 1, 0, 1,
-0.6468681, -0.03343933, -2.382114, 0.4352941, 1, 0, 1,
-0.6467059, 1.476416, 0.7321326, 0.427451, 1, 0, 1,
-0.6465792, 0.3766754, -0.9929576, 0.4235294, 1, 0, 1,
-0.6458718, 0.7913397, -2.313209, 0.4156863, 1, 0, 1,
-0.6443985, -0.5963392, -2.863943, 0.4117647, 1, 0, 1,
-0.6396512, 2.451567, -0.9853912, 0.4039216, 1, 0, 1,
-0.6393753, -0.2499053, -0.6323898, 0.3960784, 1, 0, 1,
-0.6382408, 0.1257465, -3.026425, 0.3921569, 1, 0, 1,
-0.6361269, -0.3515238, -2.711202, 0.3843137, 1, 0, 1,
-0.6340969, 0.8171445, 0.4763603, 0.3803922, 1, 0, 1,
-0.6294008, 0.2469046, 0.2722184, 0.372549, 1, 0, 1,
-0.624903, 0.6918899, 0.4053701, 0.3686275, 1, 0, 1,
-0.6215801, -1.182485, -2.973366, 0.3607843, 1, 0, 1,
-0.6211379, 0.8224568, -0.07712338, 0.3568628, 1, 0, 1,
-0.620474, -0.2688589, -2.10902, 0.3490196, 1, 0, 1,
-0.6153143, 0.02625765, -1.0754, 0.345098, 1, 0, 1,
-0.6133943, -0.281774, -2.682262, 0.3372549, 1, 0, 1,
-0.6111572, 0.61538, 0.6823423, 0.3333333, 1, 0, 1,
-0.6082321, 0.5367953, -2.360558, 0.3254902, 1, 0, 1,
-0.6044204, -0.6409362, -2.245557, 0.3215686, 1, 0, 1,
-0.6041943, 0.428919, -0.8929949, 0.3137255, 1, 0, 1,
-0.6041334, -1.09174, -2.58444, 0.3098039, 1, 0, 1,
-0.5993947, -1.041911, -1.605852, 0.3019608, 1, 0, 1,
-0.5993407, -0.9454374, -2.040344, 0.2941177, 1, 0, 1,
-0.5933298, -0.6810924, -1.852378, 0.2901961, 1, 0, 1,
-0.5852836, -1.059748, -1.551966, 0.282353, 1, 0, 1,
-0.5837457, -1.443171, -5.563958, 0.2784314, 1, 0, 1,
-0.5807408, -0.06040308, -1.49904, 0.2705882, 1, 0, 1,
-0.5778028, 0.05803975, -1.48651, 0.2666667, 1, 0, 1,
-0.5741563, 0.4555959, -1.073959, 0.2588235, 1, 0, 1,
-0.5740459, 0.2005694, -0.8784079, 0.254902, 1, 0, 1,
-0.5739211, -1.398318, -4.163682, 0.2470588, 1, 0, 1,
-0.5737844, -1.054032, -1.085934, 0.2431373, 1, 0, 1,
-0.5732183, 1.671926, -2.308453, 0.2352941, 1, 0, 1,
-0.568334, -0.6821036, -1.760382, 0.2313726, 1, 0, 1,
-0.5678101, 1.494381, 0.04286639, 0.2235294, 1, 0, 1,
-0.5659752, 1.328794, 0.3911933, 0.2196078, 1, 0, 1,
-0.5645028, 0.3726996, -1.062933, 0.2117647, 1, 0, 1,
-0.5614853, -0.628091, -3.306994, 0.2078431, 1, 0, 1,
-0.5568935, -0.08706167, -2.241022, 0.2, 1, 0, 1,
-0.5557894, 0.1564341, -1.859146, 0.1921569, 1, 0, 1,
-0.5509535, -0.6682091, -1.558456, 0.1882353, 1, 0, 1,
-0.5434929, 0.7121707, -1.378265, 0.1803922, 1, 0, 1,
-0.5431979, 0.9127094, -0.6375716, 0.1764706, 1, 0, 1,
-0.5376144, 1.694789, 0.7134329, 0.1686275, 1, 0, 1,
-0.5344697, -1.360356, -3.070323, 0.1647059, 1, 0, 1,
-0.5340332, -0.4913216, -1.694553, 0.1568628, 1, 0, 1,
-0.5320881, 1.342253, -2.70146, 0.1529412, 1, 0, 1,
-0.5292434, 0.1787255, -0.4680089, 0.145098, 1, 0, 1,
-0.5288971, -1.06813, -1.013052, 0.1411765, 1, 0, 1,
-0.5288478, 0.7884801, -0.6089356, 0.1333333, 1, 0, 1,
-0.5253099, 0.4237044, -2.724132, 0.1294118, 1, 0, 1,
-0.5107786, 0.6208307, -0.8616479, 0.1215686, 1, 0, 1,
-0.5091973, 0.7959404, -2.298587, 0.1176471, 1, 0, 1,
-0.509153, -0.8500252, -2.811298, 0.1098039, 1, 0, 1,
-0.5039071, 1.098526, 0.1871503, 0.1058824, 1, 0, 1,
-0.501735, 0.5694397, -1.579258, 0.09803922, 1, 0, 1,
-0.4955481, 0.4064187, -1.928798, 0.09019608, 1, 0, 1,
-0.4874296, 0.5247475, 0.4113343, 0.08627451, 1, 0, 1,
-0.4804054, 0.5645818, 0.000842018, 0.07843138, 1, 0, 1,
-0.4803466, -0.7209881, -1.320581, 0.07450981, 1, 0, 1,
-0.4785538, -1.238733, -2.488116, 0.06666667, 1, 0, 1,
-0.4756156, -0.3154781, -3.870658, 0.0627451, 1, 0, 1,
-0.4695045, 0.1379216, -2.143458, 0.05490196, 1, 0, 1,
-0.4650507, 0.09642893, -3.367979, 0.05098039, 1, 0, 1,
-0.4618913, 0.1879312, -1.777256, 0.04313726, 1, 0, 1,
-0.4584768, -1.728021, -2.824641, 0.03921569, 1, 0, 1,
-0.4584329, -0.6470147, -0.5716464, 0.03137255, 1, 0, 1,
-0.4576627, -0.4710585, -1.539846, 0.02745098, 1, 0, 1,
-0.4545563, -0.5896572, -3.611023, 0.01960784, 1, 0, 1,
-0.4494356, 1.254215, -0.1887492, 0.01568628, 1, 0, 1,
-0.4425885, -1.850068, -1.950734, 0.007843138, 1, 0, 1,
-0.4421793, 0.6261525, -0.745126, 0.003921569, 1, 0, 1,
-0.4385675, 0.9232919, -1.776455, 0, 1, 0.003921569, 1,
-0.4344704, -1.148611, -2.530404, 0, 1, 0.01176471, 1,
-0.4337454, -0.1427677, -2.114543, 0, 1, 0.01568628, 1,
-0.4331198, 0.4804358, -0.8618577, 0, 1, 0.02352941, 1,
-0.431254, -1.09926, -1.887803, 0, 1, 0.02745098, 1,
-0.425311, -0.1203862, -1.411336, 0, 1, 0.03529412, 1,
-0.4250247, 0.03690561, -1.402673, 0, 1, 0.03921569, 1,
-0.4172881, -1.246714, -1.667253, 0, 1, 0.04705882, 1,
-0.416181, 1.005843, 0.4183528, 0, 1, 0.05098039, 1,
-0.4079979, -1.691544, -2.653877, 0, 1, 0.05882353, 1,
-0.4032819, -0.1251511, -1.960493, 0, 1, 0.0627451, 1,
-0.399958, 0.4365715, -1.335215, 0, 1, 0.07058824, 1,
-0.3972894, 0.4564113, -1.466599, 0, 1, 0.07450981, 1,
-0.3957812, 0.0341786, 0.05887985, 0, 1, 0.08235294, 1,
-0.3922329, -0.8117157, -4.466416, 0, 1, 0.08627451, 1,
-0.389103, 0.5570745, 0.3973121, 0, 1, 0.09411765, 1,
-0.3880015, 1.601477, -0.7569453, 0, 1, 0.1019608, 1,
-0.381968, 0.6240251, -3.381344, 0, 1, 0.1058824, 1,
-0.3798893, -1.035915, -2.808768, 0, 1, 0.1137255, 1,
-0.3777461, -1.308058, -2.375126, 0, 1, 0.1176471, 1,
-0.3772647, 0.9210837, 0.3023757, 0, 1, 0.1254902, 1,
-0.3720354, 0.9233003, 0.7625077, 0, 1, 0.1294118, 1,
-0.3664745, 0.1236366, -1.546898, 0, 1, 0.1372549, 1,
-0.3650335, -0.7764027, -1.966759, 0, 1, 0.1411765, 1,
-0.3642579, 1.804089, 0.2428474, 0, 1, 0.1490196, 1,
-0.364013, 0.4051974, -1.134528, 0, 1, 0.1529412, 1,
-0.3611104, 1.126317, 0.5648186, 0, 1, 0.1607843, 1,
-0.3587915, 0.1860651, 1.007362, 0, 1, 0.1647059, 1,
-0.3501961, 0.7399333, 0.3329673, 0, 1, 0.172549, 1,
-0.3446479, -0.04264085, -1.980759, 0, 1, 0.1764706, 1,
-0.3433691, -0.1129056, -3.08014, 0, 1, 0.1843137, 1,
-0.3397573, 2.69862, -0.7843617, 0, 1, 0.1882353, 1,
-0.3388607, 0.2710229, 0.2076153, 0, 1, 0.1960784, 1,
-0.3368662, 0.350614, 0.7438801, 0, 1, 0.2039216, 1,
-0.3344336, 1.150988, -2.749153, 0, 1, 0.2078431, 1,
-0.3290474, -0.3870455, -4.870286, 0, 1, 0.2156863, 1,
-0.328108, 0.08698194, -0.5230669, 0, 1, 0.2196078, 1,
-0.3272864, 0.2918604, -1.884222, 0, 1, 0.227451, 1,
-0.3257474, 0.7165142, -1.577286, 0, 1, 0.2313726, 1,
-0.3224103, 0.6355117, -1.730428, 0, 1, 0.2392157, 1,
-0.3210325, -1.870871, -2.661317, 0, 1, 0.2431373, 1,
-0.3205606, -0.1555164, -1.231413, 0, 1, 0.2509804, 1,
-0.319623, -0.7061007, -2.244147, 0, 1, 0.254902, 1,
-0.3194729, -0.03113983, -4.228773, 0, 1, 0.2627451, 1,
-0.3168025, 1.006562, -0.4553381, 0, 1, 0.2666667, 1,
-0.3139454, -0.2740644, -2.71599, 0, 1, 0.2745098, 1,
-0.310925, -0.988738, -3.681133, 0, 1, 0.2784314, 1,
-0.3088778, 1.48003, -0.6173294, 0, 1, 0.2862745, 1,
-0.3088031, -2.032531, -2.512296, 0, 1, 0.2901961, 1,
-0.3002276, -0.01849125, -1.789487, 0, 1, 0.2980392, 1,
-0.292595, 1.501508, -0.1636532, 0, 1, 0.3058824, 1,
-0.2882032, 0.8196684, -0.3670438, 0, 1, 0.3098039, 1,
-0.2878179, -0.9680822, -2.60205, 0, 1, 0.3176471, 1,
-0.2868868, -0.4286101, -3.058015, 0, 1, 0.3215686, 1,
-0.286827, 0.5863066, -0.2336339, 0, 1, 0.3294118, 1,
-0.2848498, -1.446998, -2.774072, 0, 1, 0.3333333, 1,
-0.2771633, 1.040927, -1.525633, 0, 1, 0.3411765, 1,
-0.2715021, -0.04318533, -2.400545, 0, 1, 0.345098, 1,
-0.2697028, 1.287169, 0.3152684, 0, 1, 0.3529412, 1,
-0.264965, 0.002925508, -1.719946, 0, 1, 0.3568628, 1,
-0.2641064, -0.2184274, -1.55162, 0, 1, 0.3647059, 1,
-0.2582071, 1.656685, -1.448214, 0, 1, 0.3686275, 1,
-0.2577181, 1.146081, -1.739107, 0, 1, 0.3764706, 1,
-0.2548456, -0.1900268, -1.281682, 0, 1, 0.3803922, 1,
-0.2531536, -1.098844, -3.095089, 0, 1, 0.3882353, 1,
-0.246544, -1.281772, -2.990413, 0, 1, 0.3921569, 1,
-0.2454021, -0.9490758, -2.622052, 0, 1, 0.4, 1,
-0.2373474, -1.634264, -3.689083, 0, 1, 0.4078431, 1,
-0.2368618, 0.06813569, -0.5872695, 0, 1, 0.4117647, 1,
-0.2299526, -0.3499603, -2.10538, 0, 1, 0.4196078, 1,
-0.2271259, 1.079586, -1.126345, 0, 1, 0.4235294, 1,
-0.226932, 0.7529991, -1.102069, 0, 1, 0.4313726, 1,
-0.2266982, 0.06436791, -1.730666, 0, 1, 0.4352941, 1,
-0.2263192, 1.739241, -0.1601361, 0, 1, 0.4431373, 1,
-0.2245901, -0.02585544, -0.406021, 0, 1, 0.4470588, 1,
-0.2242014, 1.072438, 0.03708906, 0, 1, 0.454902, 1,
-0.2233582, 0.1839654, -3.121728, 0, 1, 0.4588235, 1,
-0.2221207, 1.135917, -1.501125, 0, 1, 0.4666667, 1,
-0.2206561, -1.175325, -1.447572, 0, 1, 0.4705882, 1,
-0.2204594, -0.6510342, -3.601992, 0, 1, 0.4784314, 1,
-0.2196526, 0.6570067, -0.3765244, 0, 1, 0.4823529, 1,
-0.2179114, 1.701679, -0.4095308, 0, 1, 0.4901961, 1,
-0.2125188, -0.4897197, -3.225144, 0, 1, 0.4941176, 1,
-0.2105151, 1.957186, -1.174266, 0, 1, 0.5019608, 1,
-0.208356, -1.186537, -2.940198, 0, 1, 0.509804, 1,
-0.2071992, 2.150049, -0.8459874, 0, 1, 0.5137255, 1,
-0.2044601, -1.710931, -4.268451, 0, 1, 0.5215687, 1,
-0.20172, -0.6801245, -1.433381, 0, 1, 0.5254902, 1,
-0.1987205, -0.327504, -2.583032, 0, 1, 0.5333334, 1,
-0.1979577, 0.06312799, 0.1446626, 0, 1, 0.5372549, 1,
-0.1974182, 0.4725734, -1.93018, 0, 1, 0.5450981, 1,
-0.1952119, 2.038413, -0.2724893, 0, 1, 0.5490196, 1,
-0.1915516, -1.167154, -3.855219, 0, 1, 0.5568628, 1,
-0.188496, 0.4197857, -0.7054151, 0, 1, 0.5607843, 1,
-0.187276, -0.35149, -3.102366, 0, 1, 0.5686275, 1,
-0.1848311, -0.5195212, -3.291448, 0, 1, 0.572549, 1,
-0.1833857, -0.1869098, -2.261548, 0, 1, 0.5803922, 1,
-0.1833121, -0.6838628, -2.576113, 0, 1, 0.5843138, 1,
-0.182036, 0.7685434, -0.8804198, 0, 1, 0.5921569, 1,
-0.1726368, 0.6031621, 0.3149317, 0, 1, 0.5960785, 1,
-0.1714026, 0.4141954, 0.2887884, 0, 1, 0.6039216, 1,
-0.1709946, 0.4063974, -0.6323008, 0, 1, 0.6117647, 1,
-0.1687022, 1.299613, -1.641399, 0, 1, 0.6156863, 1,
-0.1672779, 0.08078054, -2.619301, 0, 1, 0.6235294, 1,
-0.1669925, -0.5000322, -3.846129, 0, 1, 0.627451, 1,
-0.1662819, 0.5468359, 0.07281786, 0, 1, 0.6352941, 1,
-0.1636278, 0.1427599, -1.809078, 0, 1, 0.6392157, 1,
-0.162106, 0.8475295, -0.5054274, 0, 1, 0.6470588, 1,
-0.1610061, -0.2819549, -3.846473, 0, 1, 0.6509804, 1,
-0.1588663, 0.05882828, 1.034731, 0, 1, 0.6588235, 1,
-0.1588183, -2.182425, -3.948084, 0, 1, 0.6627451, 1,
-0.1573343, -1.472835, -1.896497, 0, 1, 0.6705883, 1,
-0.1511996, -1.32964, -1.750445, 0, 1, 0.6745098, 1,
-0.1505849, 0.4430607, 0.4687847, 0, 1, 0.682353, 1,
-0.1494617, -0.5608478, -2.183669, 0, 1, 0.6862745, 1,
-0.142232, 0.1483428, -0.5910897, 0, 1, 0.6941177, 1,
-0.1397445, 0.1630263, 0.4763582, 0, 1, 0.7019608, 1,
-0.1380375, 1.205356, -0.33157, 0, 1, 0.7058824, 1,
-0.1376765, -1.077911, -4.313089, 0, 1, 0.7137255, 1,
-0.1368018, -1.962188, -2.602772, 0, 1, 0.7176471, 1,
-0.1364964, 0.2309192, 0.09751196, 0, 1, 0.7254902, 1,
-0.1355982, 0.6110773, 0.9366805, 0, 1, 0.7294118, 1,
-0.1332624, 0.2023824, -1.174276, 0, 1, 0.7372549, 1,
-0.1283311, 0.7249843, -0.9716281, 0, 1, 0.7411765, 1,
-0.1259224, -0.7949246, -2.385639, 0, 1, 0.7490196, 1,
-0.1248874, 1.297151, -0.3151194, 0, 1, 0.7529412, 1,
-0.1235987, -0.423797, -1.73964, 0, 1, 0.7607843, 1,
-0.1235462, -0.305095, -2.509291, 0, 1, 0.7647059, 1,
-0.1185368, -0.7190539, -2.140471, 0, 1, 0.772549, 1,
-0.1183159, 1.15633, 2.031898, 0, 1, 0.7764706, 1,
-0.1102243, -0.926007, -2.710305, 0, 1, 0.7843137, 1,
-0.1080034, 2.60392, 0.5692043, 0, 1, 0.7882353, 1,
-0.1077995, -1.371268, -3.307546, 0, 1, 0.7960784, 1,
-0.1062824, 0.2673992, 0.9948924, 0, 1, 0.8039216, 1,
-0.1041594, -0.01252224, -2.765168, 0, 1, 0.8078431, 1,
-0.09503619, -0.6123657, -2.638276, 0, 1, 0.8156863, 1,
-0.09492238, 0.7675728, -2.203084, 0, 1, 0.8196079, 1,
-0.09464319, 0.2311238, -0.3274413, 0, 1, 0.827451, 1,
-0.0914246, -0.9920677, -5.421557, 0, 1, 0.8313726, 1,
-0.09133364, 0.3130164, 1.58976, 0, 1, 0.8392157, 1,
-0.09129758, 1.62536, 0.4181122, 0, 1, 0.8431373, 1,
-0.08767336, -0.7554958, -1.686424, 0, 1, 0.8509804, 1,
-0.08182214, -0.39539, -1.944719, 0, 1, 0.854902, 1,
-0.08162321, -0.8138717, -2.611563, 0, 1, 0.8627451, 1,
-0.0783366, 0.9855502, -1.435747, 0, 1, 0.8666667, 1,
-0.07282791, -0.1982253, -2.956055, 0, 1, 0.8745098, 1,
-0.07163445, -0.3163923, -2.608361, 0, 1, 0.8784314, 1,
-0.07141907, -0.8827924, -3.396622, 0, 1, 0.8862745, 1,
-0.06974948, -0.0193001, 0.4332484, 0, 1, 0.8901961, 1,
-0.06504228, -0.2678658, -4.411305, 0, 1, 0.8980392, 1,
-0.06481191, 0.7422236, -0.612595, 0, 1, 0.9058824, 1,
-0.06289852, 0.7527183, -0.5048683, 0, 1, 0.9098039, 1,
-0.05617479, -1.22558, -3.651629, 0, 1, 0.9176471, 1,
-0.05274358, -1.668588, -3.068804, 0, 1, 0.9215686, 1,
-0.05133851, -1.494149, -3.454815, 0, 1, 0.9294118, 1,
-0.05119801, 0.9866957, -2.026721, 0, 1, 0.9333333, 1,
-0.04864878, -2.021089, -0.5024348, 0, 1, 0.9411765, 1,
-0.04648669, 1.813955, 0.6624057, 0, 1, 0.945098, 1,
-0.04340596, -0.1802113, -2.211436, 0, 1, 0.9529412, 1,
-0.04141576, -0.2933046, -4.0188, 0, 1, 0.9568627, 1,
-0.04089247, -0.4469098, -1.182396, 0, 1, 0.9647059, 1,
-0.03942059, 0.601266, 0.4870023, 0, 1, 0.9686275, 1,
-0.03504954, 1.920536, -0.9967166, 0, 1, 0.9764706, 1,
-0.02624878, -0.08753562, -3.101282, 0, 1, 0.9803922, 1,
-0.0219739, -0.3122797, -3.094468, 0, 1, 0.9882353, 1,
-0.02160227, -1.134668, -2.302868, 0, 1, 0.9921569, 1,
-0.02114249, -0.1224089, -2.409568, 0, 1, 1, 1,
-0.02094564, 0.05146924, -1.914442, 0, 0.9921569, 1, 1,
-0.0195962, 0.7329971, 0.04683314, 0, 0.9882353, 1, 1,
-0.01637344, 0.1250324, -0.3640985, 0, 0.9803922, 1, 1,
-0.01631035, 0.1414756, -1.438638, 0, 0.9764706, 1, 1,
-0.01562479, 1.342499, 0.9839016, 0, 0.9686275, 1, 1,
-0.004901897, -0.3823932, -2.268004, 0, 0.9647059, 1, 1,
-2.443801e-05, -0.6211404, -4.29669, 0, 0.9568627, 1, 1,
0.0006623404, -2.014715, 0.832087, 0, 0.9529412, 1, 1,
0.001736185, 0.6360693, -0.6819776, 0, 0.945098, 1, 1,
0.003727799, 1.080664, -1.98684, 0, 0.9411765, 1, 1,
0.01616103, -2.215278, 2.25918, 0, 0.9333333, 1, 1,
0.01771903, 0.06928568, 1.075023, 0, 0.9294118, 1, 1,
0.01940717, -1.190764, 3.32724, 0, 0.9215686, 1, 1,
0.02044109, -0.3792738, 3.10067, 0, 0.9176471, 1, 1,
0.02321185, 0.6848037, -0.3388103, 0, 0.9098039, 1, 1,
0.03450462, 1.671679, 1.207571, 0, 0.9058824, 1, 1,
0.03535993, -1.293344, 3.223188, 0, 0.8980392, 1, 1,
0.03614435, 0.8839432, 1.230248, 0, 0.8901961, 1, 1,
0.03765605, -0.8556059, 3.005713, 0, 0.8862745, 1, 1,
0.03968693, -0.1896173, 1.313113, 0, 0.8784314, 1, 1,
0.04127456, -0.4537757, 2.472233, 0, 0.8745098, 1, 1,
0.04348956, -0.9334223, 3.728315, 0, 0.8666667, 1, 1,
0.04528005, -0.07251787, 3.077255, 0, 0.8627451, 1, 1,
0.04860331, 0.5110911, -1.657887, 0, 0.854902, 1, 1,
0.0554867, 1.149886, 2.04, 0, 0.8509804, 1, 1,
0.06092085, 1.999183, 0.291371, 0, 0.8431373, 1, 1,
0.06186271, 0.5211007, 0.4065025, 0, 0.8392157, 1, 1,
0.06325059, 1.992721, 0.154994, 0, 0.8313726, 1, 1,
0.06571709, -1.655663, 3.883773, 0, 0.827451, 1, 1,
0.06700312, -0.686734, 2.861577, 0, 0.8196079, 1, 1,
0.06853801, -0.593436, 3.332118, 0, 0.8156863, 1, 1,
0.06855451, 0.4876529, 0.4401254, 0, 0.8078431, 1, 1,
0.07091482, 0.8240026, -0.6063988, 0, 0.8039216, 1, 1,
0.07802199, 0.1943379, -0.1605641, 0, 0.7960784, 1, 1,
0.08089481, -0.8840897, 2.618792, 0, 0.7882353, 1, 1,
0.08115444, -0.1044717, 3.899026, 0, 0.7843137, 1, 1,
0.08238303, -0.06700458, 0.05933354, 0, 0.7764706, 1, 1,
0.08550274, -0.3037613, 3.235331, 0, 0.772549, 1, 1,
0.09169254, -1.289218, 2.38146, 0, 0.7647059, 1, 1,
0.09235644, -0.1614915, 2.661693, 0, 0.7607843, 1, 1,
0.09270219, -0.1046935, 2.513425, 0, 0.7529412, 1, 1,
0.0934637, 0.5893138, 0.4900737, 0, 0.7490196, 1, 1,
0.09570371, -1.422554, 3.118318, 0, 0.7411765, 1, 1,
0.09975793, -0.2741214, 3.135447, 0, 0.7372549, 1, 1,
0.1034091, -0.8088943, 2.014262, 0, 0.7294118, 1, 1,
0.1081539, -1.372972, 3.24824, 0, 0.7254902, 1, 1,
0.1123748, 0.9579168, -0.5293934, 0, 0.7176471, 1, 1,
0.1134173, -1.030599, 1.886648, 0, 0.7137255, 1, 1,
0.1145666, -0.3080457, 3.128546, 0, 0.7058824, 1, 1,
0.1168969, 0.8491904, -0.2256145, 0, 0.6980392, 1, 1,
0.1175504, 1.018532, 0.703765, 0, 0.6941177, 1, 1,
0.1177386, -0.9919791, 2.387954, 0, 0.6862745, 1, 1,
0.1188831, -0.3924272, 2.647313, 0, 0.682353, 1, 1,
0.1202307, -0.330123, 2.147147, 0, 0.6745098, 1, 1,
0.1208648, 0.3126617, -0.7195896, 0, 0.6705883, 1, 1,
0.123588, -0.8307362, 1.09132, 0, 0.6627451, 1, 1,
0.1246401, -0.3767615, 3.523772, 0, 0.6588235, 1, 1,
0.1284703, 1.335124, -0.2261701, 0, 0.6509804, 1, 1,
0.1286452, -1.285942, 5.898384, 0, 0.6470588, 1, 1,
0.1287483, -0.5400422, 4.260801, 0, 0.6392157, 1, 1,
0.133856, -1.201788, 1.605721, 0, 0.6352941, 1, 1,
0.1355326, -1.42452, 2.843548, 0, 0.627451, 1, 1,
0.1382831, 0.7362294, -0.8160225, 0, 0.6235294, 1, 1,
0.1385081, -0.5615962, 3.948132, 0, 0.6156863, 1, 1,
0.1432837, 1.070801, 2.468823, 0, 0.6117647, 1, 1,
0.1468605, 1.320606, -0.4790644, 0, 0.6039216, 1, 1,
0.151607, -0.1964346, 2.291682, 0, 0.5960785, 1, 1,
0.1548001, -0.06813192, 1.662059, 0, 0.5921569, 1, 1,
0.1589222, -0.4866714, 1.416325, 0, 0.5843138, 1, 1,
0.1607883, -0.454792, 1.583565, 0, 0.5803922, 1, 1,
0.1623103, 1.865819, 0.4574986, 0, 0.572549, 1, 1,
0.1706247, 0.778096, 0.05801815, 0, 0.5686275, 1, 1,
0.1710681, -1.238247, 4.329021, 0, 0.5607843, 1, 1,
0.1718031, -0.2468656, 2.68657, 0, 0.5568628, 1, 1,
0.1762034, 0.6618534, -0.4696584, 0, 0.5490196, 1, 1,
0.1808828, -0.1586239, 2.108922, 0, 0.5450981, 1, 1,
0.1818238, 0.2903712, 0.7761639, 0, 0.5372549, 1, 1,
0.1851188, 0.2509838, 0.5145708, 0, 0.5333334, 1, 1,
0.1898017, 0.7824147, 1.12222, 0, 0.5254902, 1, 1,
0.1922989, -1.257417, 2.939945, 0, 0.5215687, 1, 1,
0.1933765, -0.446256, 2.458522, 0, 0.5137255, 1, 1,
0.1941808, -0.3143874, 3.313256, 0, 0.509804, 1, 1,
0.1956123, -0.2052109, 1.015487, 0, 0.5019608, 1, 1,
0.200531, 0.1737556, 0.1333058, 0, 0.4941176, 1, 1,
0.2030698, -0.7010496, 3.363859, 0, 0.4901961, 1, 1,
0.2089593, 1.792071, 0.5055303, 0, 0.4823529, 1, 1,
0.2108374, -2.30089, 3.821063, 0, 0.4784314, 1, 1,
0.2109473, 0.2683878, 1.668326, 0, 0.4705882, 1, 1,
0.2126128, 0.8957372, 1.05572, 0, 0.4666667, 1, 1,
0.2134326, -0.7398447, 4.006136, 0, 0.4588235, 1, 1,
0.2134931, -0.7456945, 2.814912, 0, 0.454902, 1, 1,
0.2163768, -0.3064084, 1.303145, 0, 0.4470588, 1, 1,
0.2189069, 0.6723316, -0.1731326, 0, 0.4431373, 1, 1,
0.2319102, -1.516664, 3.088437, 0, 0.4352941, 1, 1,
0.2333366, -0.1019713, 1.732434, 0, 0.4313726, 1, 1,
0.2345197, -0.2242636, 3.340526, 0, 0.4235294, 1, 1,
0.2389103, -1.414389, 1.281688, 0, 0.4196078, 1, 1,
0.2418578, -0.4329434, 2.015609, 0, 0.4117647, 1, 1,
0.2430665, -0.4378661, 3.929514, 0, 0.4078431, 1, 1,
0.2432316, 0.997476, 1.007705, 0, 0.4, 1, 1,
0.2442014, -1.319537, 3.917639, 0, 0.3921569, 1, 1,
0.2509586, -0.3545372, 3.464938, 0, 0.3882353, 1, 1,
0.2541054, -0.6601365, 3.869685, 0, 0.3803922, 1, 1,
0.2572456, -1.467778, 1.787738, 0, 0.3764706, 1, 1,
0.2593982, 0.6032509, -0.1810196, 0, 0.3686275, 1, 1,
0.2609673, -1.488641, 2.624552, 0, 0.3647059, 1, 1,
0.2621723, 1.158615, -1.735901, 0, 0.3568628, 1, 1,
0.262673, 0.1340599, 2.859969, 0, 0.3529412, 1, 1,
0.266439, -0.7301141, 2.336895, 0, 0.345098, 1, 1,
0.2665265, 0.620584, 0.2697997, 0, 0.3411765, 1, 1,
0.2736132, -1.05708, 1.369262, 0, 0.3333333, 1, 1,
0.2768089, -0.9060454, 2.313278, 0, 0.3294118, 1, 1,
0.277466, -0.8772677, 3.578547, 0, 0.3215686, 1, 1,
0.2799642, 0.9707574, 0.9898817, 0, 0.3176471, 1, 1,
0.2813735, -0.3978881, 1.926345, 0, 0.3098039, 1, 1,
0.2833425, -0.6735272, 3.290819, 0, 0.3058824, 1, 1,
0.2834189, -0.07737525, 1.569728, 0, 0.2980392, 1, 1,
0.2864742, 1.114763, 0.2635752, 0, 0.2901961, 1, 1,
0.2871655, -0.1867274, 2.292143, 0, 0.2862745, 1, 1,
0.2886159, 0.1711802, 1.560626, 0, 0.2784314, 1, 1,
0.295281, -0.7915854, 3.361992, 0, 0.2745098, 1, 1,
0.2953458, -0.9306591, 4.090079, 0, 0.2666667, 1, 1,
0.2962906, -1.370694, 4.026402, 0, 0.2627451, 1, 1,
0.2977767, 1.084849, 1.104807, 0, 0.254902, 1, 1,
0.3009758, 0.5965203, -0.1120168, 0, 0.2509804, 1, 1,
0.3041991, 0.07064883, 1.472305, 0, 0.2431373, 1, 1,
0.3044273, -0.04001949, 2.902655, 0, 0.2392157, 1, 1,
0.304579, 0.3732753, -0.004769263, 0, 0.2313726, 1, 1,
0.3049362, -1.2509, 3.627991, 0, 0.227451, 1, 1,
0.306062, -0.9817153, 3.974379, 0, 0.2196078, 1, 1,
0.3066535, -1.330522, 3.688437, 0, 0.2156863, 1, 1,
0.3070194, -0.4550964, 3.645081, 0, 0.2078431, 1, 1,
0.3092713, 0.1785701, 1.445013, 0, 0.2039216, 1, 1,
0.3117194, -0.3136656, 1.482974, 0, 0.1960784, 1, 1,
0.3158315, -1.772123, 3.809592, 0, 0.1882353, 1, 1,
0.320103, -2.176162, 3.709266, 0, 0.1843137, 1, 1,
0.3205869, 1.06441, 0.2965052, 0, 0.1764706, 1, 1,
0.3287734, -0.92505, 2.24072, 0, 0.172549, 1, 1,
0.3292192, -0.6015939, 2.539132, 0, 0.1647059, 1, 1,
0.3333702, 0.8065574, 0.174357, 0, 0.1607843, 1, 1,
0.3339036, -1.45918, 3.58088, 0, 0.1529412, 1, 1,
0.3383163, -1.416663, 1.587369, 0, 0.1490196, 1, 1,
0.3392176, 0.0112713, 3.287036, 0, 0.1411765, 1, 1,
0.3407996, 0.2357544, 1.825277, 0, 0.1372549, 1, 1,
0.3419979, -0.9795578, 4.408211, 0, 0.1294118, 1, 1,
0.3420782, 1.348885, -0.9637662, 0, 0.1254902, 1, 1,
0.3444448, 0.5032699, 1.847766, 0, 0.1176471, 1, 1,
0.3483467, 0.7204726, 2.353244, 0, 0.1137255, 1, 1,
0.3500676, 0.8671045, -0.0835519, 0, 0.1058824, 1, 1,
0.3511301, 0.08029062, 0.6951488, 0, 0.09803922, 1, 1,
0.3547386, -0.5229384, 2.974419, 0, 0.09411765, 1, 1,
0.3573624, -0.7578589, 2.307708, 0, 0.08627451, 1, 1,
0.3575606, -0.02755119, 1.446093, 0, 0.08235294, 1, 1,
0.3579622, 1.175658, -1.060328, 0, 0.07450981, 1, 1,
0.3579789, -1.540096, 4.641021, 0, 0.07058824, 1, 1,
0.3613309, 1.165839, 0.9528171, 0, 0.0627451, 1, 1,
0.3614594, -1.186383, 2.9059, 0, 0.05882353, 1, 1,
0.3683395, 0.1230907, 0.6627305, 0, 0.05098039, 1, 1,
0.3822956, -0.4035417, 1.443444, 0, 0.04705882, 1, 1,
0.3856593, 0.6504895, -0.9243317, 0, 0.03921569, 1, 1,
0.3856684, -0.7505593, 2.333568, 0, 0.03529412, 1, 1,
0.3859014, -1.157451, 2.800703, 0, 0.02745098, 1, 1,
0.3861591, 0.634653, 0.2838324, 0, 0.02352941, 1, 1,
0.3877552, 0.06249349, -0.330378, 0, 0.01568628, 1, 1,
0.3908423, -0.9507343, 2.504127, 0, 0.01176471, 1, 1,
0.3920627, -0.3918985, 0.4666966, 0, 0.003921569, 1, 1,
0.3953974, 0.9321328, 0.2106787, 0.003921569, 0, 1, 1,
0.3969265, 1.017391, 1.228546, 0.007843138, 0, 1, 1,
0.3999673, 0.6731202, -0.4510318, 0.01568628, 0, 1, 1,
0.4065905, 1.425026, -1.722479, 0.01960784, 0, 1, 1,
0.4072235, 0.01078472, 3.768515, 0.02745098, 0, 1, 1,
0.4094051, -0.8832776, 4.972678, 0.03137255, 0, 1, 1,
0.4143314, 0.9574866, -0.0847788, 0.03921569, 0, 1, 1,
0.4154265, 1.684312, -1.53062, 0.04313726, 0, 1, 1,
0.421609, 1.028125, -0.3140903, 0.05098039, 0, 1, 1,
0.4247729, 0.2915256, 1.781851, 0.05490196, 0, 1, 1,
0.4297711, -1.131655, 3.192127, 0.0627451, 0, 1, 1,
0.4303769, -0.5869324, 3.591351, 0.06666667, 0, 1, 1,
0.4322445, 0.9566815, -0.3621893, 0.07450981, 0, 1, 1,
0.4377768, 0.5092298, 0.8551731, 0.07843138, 0, 1, 1,
0.4415178, 0.7452087, -0.2291808, 0.08627451, 0, 1, 1,
0.4452582, 1.99045, 0.3898881, 0.09019608, 0, 1, 1,
0.445484, 0.2393767, -1.028752, 0.09803922, 0, 1, 1,
0.4457214, -1.815455, 2.590068, 0.1058824, 0, 1, 1,
0.4478357, 0.3207723, -0.5442868, 0.1098039, 0, 1, 1,
0.4513648, -0.4299857, 1.492255, 0.1176471, 0, 1, 1,
0.4543559, -1.608588, 2.348444, 0.1215686, 0, 1, 1,
0.4546255, 0.4649114, -0.5528524, 0.1294118, 0, 1, 1,
0.4552599, 2.403172, -0.1086579, 0.1333333, 0, 1, 1,
0.4576915, 0.6843378, 0.4456604, 0.1411765, 0, 1, 1,
0.4588555, -0.01206751, 2.877397, 0.145098, 0, 1, 1,
0.4636352, 0.8213412, 0.2318236, 0.1529412, 0, 1, 1,
0.4640451, -0.5062032, 0.5305642, 0.1568628, 0, 1, 1,
0.4645144, -2.266046, 1.570408, 0.1647059, 0, 1, 1,
0.469113, 0.12017, 1.431575, 0.1686275, 0, 1, 1,
0.4725329, -0.7114194, 2.82837, 0.1764706, 0, 1, 1,
0.4733377, -1.44677, 1.424577, 0.1803922, 0, 1, 1,
0.4741314, -0.730432, 2.378006, 0.1882353, 0, 1, 1,
0.4754531, -0.5681708, 2.789287, 0.1921569, 0, 1, 1,
0.4806438, -0.1933798, 1.738036, 0.2, 0, 1, 1,
0.4811876, -1.711823, 1.774308, 0.2078431, 0, 1, 1,
0.4841163, 1.895533, -0.6336272, 0.2117647, 0, 1, 1,
0.4851903, -0.1617936, 2.250389, 0.2196078, 0, 1, 1,
0.4867556, -0.2445293, 1.649369, 0.2235294, 0, 1, 1,
0.4921693, 0.796287, 1.107832, 0.2313726, 0, 1, 1,
0.4979026, -2.11351, 2.166591, 0.2352941, 0, 1, 1,
0.5013741, 2.675625, -0.3024216, 0.2431373, 0, 1, 1,
0.503344, -0.9517926, 1.859466, 0.2470588, 0, 1, 1,
0.5041634, 0.4926985, 0.297832, 0.254902, 0, 1, 1,
0.5056472, 0.75102, -0.5625643, 0.2588235, 0, 1, 1,
0.506305, -2.427716, 1.919578, 0.2666667, 0, 1, 1,
0.506837, -0.8508015, 3.428127, 0.2705882, 0, 1, 1,
0.5099037, -0.2447709, 1.567649, 0.2784314, 0, 1, 1,
0.5100867, -1.230294, 1.526001, 0.282353, 0, 1, 1,
0.5105029, 0.4299402, -0.06961397, 0.2901961, 0, 1, 1,
0.5195516, 0.219364, 1.488473, 0.2941177, 0, 1, 1,
0.5200041, 1.575034, 1.290872, 0.3019608, 0, 1, 1,
0.5217101, -2.955855, 2.410334, 0.3098039, 0, 1, 1,
0.5271553, -0.5570811, 2.010955, 0.3137255, 0, 1, 1,
0.5292288, 1.864738, -0.6900736, 0.3215686, 0, 1, 1,
0.5370674, -1.496445, 1.580403, 0.3254902, 0, 1, 1,
0.5389515, 0.4530604, 2.356308, 0.3333333, 0, 1, 1,
0.5398645, -1.138104, 2.775261, 0.3372549, 0, 1, 1,
0.5415615, -1.108086, 4.077888, 0.345098, 0, 1, 1,
0.541908, 0.608655, 1.650169, 0.3490196, 0, 1, 1,
0.5427253, 0.9169619, -0.5894136, 0.3568628, 0, 1, 1,
0.5452693, -0.1110879, 1.250511, 0.3607843, 0, 1, 1,
0.5502883, 1.053344, -2.120189, 0.3686275, 0, 1, 1,
0.5582861, -1.512624, 2.197268, 0.372549, 0, 1, 1,
0.5620315, 0.9899142, 0.1537317, 0.3803922, 0, 1, 1,
0.570639, 0.3359237, -0.2760792, 0.3843137, 0, 1, 1,
0.5724533, 1.292868, 0.02326013, 0.3921569, 0, 1, 1,
0.5726328, -0.9052158, 2.995045, 0.3960784, 0, 1, 1,
0.5747129, -0.230348, 2.224152, 0.4039216, 0, 1, 1,
0.5747454, -0.498804, 0.6525452, 0.4117647, 0, 1, 1,
0.5757794, -1.919541, 1.837325, 0.4156863, 0, 1, 1,
0.5836465, -0.6430398, 2.090278, 0.4235294, 0, 1, 1,
0.5842733, -1.092209, 4.025144, 0.427451, 0, 1, 1,
0.588158, -0.3711568, 1.653391, 0.4352941, 0, 1, 1,
0.5899912, 1.422306, 0.6019901, 0.4392157, 0, 1, 1,
0.5946898, -0.389232, 1.406536, 0.4470588, 0, 1, 1,
0.5950922, 0.8539802, -1.003577, 0.4509804, 0, 1, 1,
0.5950958, -0.4341379, 1.410224, 0.4588235, 0, 1, 1,
0.5984679, -0.9231237, 2.004149, 0.4627451, 0, 1, 1,
0.5990754, 0.8515577, 0.1562373, 0.4705882, 0, 1, 1,
0.6016162, -0.255608, 1.147942, 0.4745098, 0, 1, 1,
0.6074101, -0.3431989, 1.432295, 0.4823529, 0, 1, 1,
0.6079141, -0.5176029, 0.904372, 0.4862745, 0, 1, 1,
0.6090369, 2.116872, 0.9120728, 0.4941176, 0, 1, 1,
0.620361, -0.06621922, 1.877323, 0.5019608, 0, 1, 1,
0.6262617, 1.309896, -0.2215063, 0.5058824, 0, 1, 1,
0.627269, 1.410301, 0.601397, 0.5137255, 0, 1, 1,
0.6325839, 0.2702863, 0.1423547, 0.5176471, 0, 1, 1,
0.6354225, -0.4786342, 2.799728, 0.5254902, 0, 1, 1,
0.6377739, 0.6689879, 1.111199, 0.5294118, 0, 1, 1,
0.6445881, 1.899445, 0.4750205, 0.5372549, 0, 1, 1,
0.6524061, -0.9154229, 1.465394, 0.5411765, 0, 1, 1,
0.6528615, -0.902438, 2.523878, 0.5490196, 0, 1, 1,
0.6600863, 0.3544054, 0.1666166, 0.5529412, 0, 1, 1,
0.6669311, 0.2910678, -0.2626187, 0.5607843, 0, 1, 1,
0.6681749, 0.170369, 0.1764908, 0.5647059, 0, 1, 1,
0.6711782, 0.53468, 2.091887, 0.572549, 0, 1, 1,
0.6725794, -0.2060558, 2.257623, 0.5764706, 0, 1, 1,
0.6735904, 0.3880428, 0.2711963, 0.5843138, 0, 1, 1,
0.6771364, 0.133583, 0.5598313, 0.5882353, 0, 1, 1,
0.6783375, -0.2959562, 1.836241, 0.5960785, 0, 1, 1,
0.6793137, 1.301069, -0.6372978, 0.6039216, 0, 1, 1,
0.6827701, -0.5013142, 3.08639, 0.6078432, 0, 1, 1,
0.6862771, 0.1721762, 1.611095, 0.6156863, 0, 1, 1,
0.6869074, -1.847735, 2.813686, 0.6196079, 0, 1, 1,
0.6930444, -0.35105, 1.37483, 0.627451, 0, 1, 1,
0.6987099, 1.013202, 0.3888028, 0.6313726, 0, 1, 1,
0.7032019, -0.8134542, 4.142758, 0.6392157, 0, 1, 1,
0.7098421, -1.599429, 3.553302, 0.6431373, 0, 1, 1,
0.7251735, -0.1343691, 2.959933, 0.6509804, 0, 1, 1,
0.7260489, 0.6859829, -0.6060047, 0.654902, 0, 1, 1,
0.7267922, 1.435678, 1.75894, 0.6627451, 0, 1, 1,
0.734516, 1.365689, 1.541499, 0.6666667, 0, 1, 1,
0.7365849, 0.5368857, 0.8003995, 0.6745098, 0, 1, 1,
0.7448914, 1.742741, 0.1733324, 0.6784314, 0, 1, 1,
0.7461244, 0.7753009, 1.16766, 0.6862745, 0, 1, 1,
0.7525973, 0.2693883, 0.5340024, 0.6901961, 0, 1, 1,
0.7602209, 0.1395933, 2.164268, 0.6980392, 0, 1, 1,
0.7649003, -1.267377, 2.881511, 0.7058824, 0, 1, 1,
0.7695476, 0.8739257, 1.704065, 0.7098039, 0, 1, 1,
0.7696818, -1.887641, 3.259996, 0.7176471, 0, 1, 1,
0.7748013, -0.01272003, -0.2973138, 0.7215686, 0, 1, 1,
0.7754006, 0.6690981, 0.1206084, 0.7294118, 0, 1, 1,
0.7820832, -1.200016, 1.975273, 0.7333333, 0, 1, 1,
0.7831882, 0.2845867, 2.153447, 0.7411765, 0, 1, 1,
0.7931403, -1.236375, 2.429073, 0.7450981, 0, 1, 1,
0.7981361, 0.3018635, 0.878256, 0.7529412, 0, 1, 1,
0.7984039, 0.2929546, 1.549188, 0.7568628, 0, 1, 1,
0.8019188, -1.888356, 2.605305, 0.7647059, 0, 1, 1,
0.8123235, 0.421162, 1.283368, 0.7686275, 0, 1, 1,
0.8139229, -1.119959, 3.382951, 0.7764706, 0, 1, 1,
0.8151025, -0.4202379, 3.405354, 0.7803922, 0, 1, 1,
0.8157086, -0.7072375, -0.238119, 0.7882353, 0, 1, 1,
0.8170806, -1.265167, 0.7848924, 0.7921569, 0, 1, 1,
0.8217556, -2.096791, 3.65555, 0.8, 0, 1, 1,
0.8313123, 0.3649613, 0.5686296, 0.8078431, 0, 1, 1,
0.8317774, -1.694864, 1.106944, 0.8117647, 0, 1, 1,
0.8363523, -0.7127517, 2.667409, 0.8196079, 0, 1, 1,
0.8365633, -0.3720784, 2.560945, 0.8235294, 0, 1, 1,
0.8408259, -1.192488, 1.677985, 0.8313726, 0, 1, 1,
0.8506977, 0.9024649, 2.989018, 0.8352941, 0, 1, 1,
0.8570565, -1.698303, 3.373361, 0.8431373, 0, 1, 1,
0.8651985, 0.3216857, 1.594477, 0.8470588, 0, 1, 1,
0.8656364, 1.359086, 1.913369, 0.854902, 0, 1, 1,
0.8684793, 0.1058802, 2.250257, 0.8588235, 0, 1, 1,
0.870487, -0.4388978, 1.988201, 0.8666667, 0, 1, 1,
0.8710252, 1.086499, 1.033671, 0.8705882, 0, 1, 1,
0.8765613, 0.8232535, 2.217295, 0.8784314, 0, 1, 1,
0.8804428, 0.4202661, 1.78341, 0.8823529, 0, 1, 1,
0.8820072, -0.839878, 1.945106, 0.8901961, 0, 1, 1,
0.8884418, -0.4930224, 0.1784493, 0.8941177, 0, 1, 1,
0.8899734, 0.7238631, 0.3804689, 0.9019608, 0, 1, 1,
0.8952615, 1.090523, 2.001012, 0.9098039, 0, 1, 1,
0.9063716, -0.6529016, 3.026596, 0.9137255, 0, 1, 1,
0.9183663, -0.09477221, 0.2709821, 0.9215686, 0, 1, 1,
0.929557, -0.2281743, 1.586066, 0.9254902, 0, 1, 1,
0.9323491, -0.2892708, 1.615799, 0.9333333, 0, 1, 1,
0.9351188, 0.8437866, 1.080801, 0.9372549, 0, 1, 1,
0.9433784, 2.131434, 0.6449165, 0.945098, 0, 1, 1,
0.945901, -0.2653618, 0.3523467, 0.9490196, 0, 1, 1,
0.95292, 0.6372946, -0.8730986, 0.9568627, 0, 1, 1,
0.953655, 0.04032703, 0.3648434, 0.9607843, 0, 1, 1,
0.9626145, 0.6079798, 0.1426668, 0.9686275, 0, 1, 1,
0.9638408, 1.791446, 1.844414, 0.972549, 0, 1, 1,
0.9643137, -0.6979508, 3.925253, 0.9803922, 0, 1, 1,
0.9658812, -1.392257, 3.076443, 0.9843137, 0, 1, 1,
0.9709473, -0.735622, 1.34173, 0.9921569, 0, 1, 1,
0.9746056, -1.420868, 4.04094, 0.9960784, 0, 1, 1,
0.9788392, -0.5832278, 2.712544, 1, 0, 0.9960784, 1,
0.9907898, 0.1497255, 1.858515, 1, 0, 0.9882353, 1,
0.9915217, 0.04674185, 0.8610429, 1, 0, 0.9843137, 1,
1.005588, -1.025636, 1.405435, 1, 0, 0.9764706, 1,
1.012916, -1.85459, 2.658427, 1, 0, 0.972549, 1,
1.016726, -1.320677, 1.197421, 1, 0, 0.9647059, 1,
1.021434, 0.1398532, 2.626327, 1, 0, 0.9607843, 1,
1.022986, 0.3446313, 0.602605, 1, 0, 0.9529412, 1,
1.025053, -0.9323905, 3.104224, 1, 0, 0.9490196, 1,
1.026168, -0.4062742, 2.641345, 1, 0, 0.9411765, 1,
1.029685, -0.6521601, 2.927281, 1, 0, 0.9372549, 1,
1.029875, 1.358983, -0.9850523, 1, 0, 0.9294118, 1,
1.035106, -0.6215041, 2.166962, 1, 0, 0.9254902, 1,
1.042341, -0.5026723, 1.270052, 1, 0, 0.9176471, 1,
1.044568, 0.8407231, 0.9551084, 1, 0, 0.9137255, 1,
1.047466, 0.9505336, 0.8648916, 1, 0, 0.9058824, 1,
1.049895, -1.827654, 3.77443, 1, 0, 0.9019608, 1,
1.062697, -0.3753995, 2.36665, 1, 0, 0.8941177, 1,
1.06354, -0.9843918, 3.612172, 1, 0, 0.8862745, 1,
1.073998, -0.2214872, 1.182857, 1, 0, 0.8823529, 1,
1.085515, 0.2156695, 2.287173, 1, 0, 0.8745098, 1,
1.09504, 0.4393091, -0.07113086, 1, 0, 0.8705882, 1,
1.096252, -1.659136, 2.949768, 1, 0, 0.8627451, 1,
1.100915, -0.05356404, 3.47941, 1, 0, 0.8588235, 1,
1.107572, -0.1422763, 2.070854, 1, 0, 0.8509804, 1,
1.122709, 0.8726496, 1.523703, 1, 0, 0.8470588, 1,
1.123969, 0.9943562, 1.532259, 1, 0, 0.8392157, 1,
1.124639, -0.00495907, 2.125781, 1, 0, 0.8352941, 1,
1.129704, 0.7953291, 1.506324, 1, 0, 0.827451, 1,
1.132568, -1.093039, 1.494886, 1, 0, 0.8235294, 1,
1.132696, -0.1808856, 1.47706, 1, 0, 0.8156863, 1,
1.138191, -0.6748278, 2.104803, 1, 0, 0.8117647, 1,
1.141224, 0.7778728, -0.3232938, 1, 0, 0.8039216, 1,
1.14601, 0.2869664, 1.273533, 1, 0, 0.7960784, 1,
1.146224, -0.1256582, 2.027743, 1, 0, 0.7921569, 1,
1.150224, -2.913955, 1.671372, 1, 0, 0.7843137, 1,
1.153253, 0.5460677, 0.6026219, 1, 0, 0.7803922, 1,
1.153487, -0.1833966, 1.517865, 1, 0, 0.772549, 1,
1.158585, -0.1299506, 1.625636, 1, 0, 0.7686275, 1,
1.161276, -0.8061457, 2.623549, 1, 0, 0.7607843, 1,
1.171143, 2.356716, 3.065175, 1, 0, 0.7568628, 1,
1.174883, 1.483227, 1.604159, 1, 0, 0.7490196, 1,
1.175279, -1.443624, 3.639897, 1, 0, 0.7450981, 1,
1.180952, -1.636269, 2.251992, 1, 0, 0.7372549, 1,
1.191953, -0.1462204, 1.814188, 1, 0, 0.7333333, 1,
1.198304, 0.47985, -0.7220185, 1, 0, 0.7254902, 1,
1.210145, -0.4686114, 1.410264, 1, 0, 0.7215686, 1,
1.214379, -0.4201688, 2.954329, 1, 0, 0.7137255, 1,
1.218424, -1.487186, 2.327104, 1, 0, 0.7098039, 1,
1.245363, -1.026755, 2.734416, 1, 0, 0.7019608, 1,
1.256423, -0.4297106, 3.655354, 1, 0, 0.6941177, 1,
1.258327, -0.3308433, 2.280436, 1, 0, 0.6901961, 1,
1.27043, 1.523584, 1.364254, 1, 0, 0.682353, 1,
1.270694, 1.930721, -0.1136748, 1, 0, 0.6784314, 1,
1.271695, -0.9337841, 1.935636, 1, 0, 0.6705883, 1,
1.282129, -1.730682, 3.917396, 1, 0, 0.6666667, 1,
1.28226, 0.1803546, 0.08032108, 1, 0, 0.6588235, 1,
1.285598, -0.8332059, 0.621502, 1, 0, 0.654902, 1,
1.299328, -0.4620609, 2.726095, 1, 0, 0.6470588, 1,
1.307047, -0.7790136, 2.609811, 1, 0, 0.6431373, 1,
1.310185, 0.04903362, 1.406145, 1, 0, 0.6352941, 1,
1.312743, -0.6660676, 2.556024, 1, 0, 0.6313726, 1,
1.314201, 2.157069, -1.025541, 1, 0, 0.6235294, 1,
1.320512, -1.583125, 1.878785, 1, 0, 0.6196079, 1,
1.322303, -0.08031847, -0.07605284, 1, 0, 0.6117647, 1,
1.326539, -0.1517806, 2.849377, 1, 0, 0.6078432, 1,
1.327803, -1.050967, 0.873325, 1, 0, 0.6, 1,
1.335828, -0.0001593898, 1.038574, 1, 0, 0.5921569, 1,
1.345881, 0.01179925, 1.589685, 1, 0, 0.5882353, 1,
1.346494, 0.07736519, 0.01553705, 1, 0, 0.5803922, 1,
1.358813, -0.5142764, 0.8366238, 1, 0, 0.5764706, 1,
1.363311, 0.2340286, -0.7343184, 1, 0, 0.5686275, 1,
1.380995, 0.1720708, -0.4389785, 1, 0, 0.5647059, 1,
1.39974, -1.201722, 1.988682, 1, 0, 0.5568628, 1,
1.405782, 0.6038443, 1.033583, 1, 0, 0.5529412, 1,
1.405933, -0.7267287, 2.861023, 1, 0, 0.5450981, 1,
1.420852, -0.4060757, 3.056304, 1, 0, 0.5411765, 1,
1.421193, 0.09398337, 1.288346, 1, 0, 0.5333334, 1,
1.425175, -0.2894294, 1.479884, 1, 0, 0.5294118, 1,
1.429639, 1.078059, 0.005888999, 1, 0, 0.5215687, 1,
1.431036, -0.4879903, 2.067976, 1, 0, 0.5176471, 1,
1.432425, 1.812795, 1.189085, 1, 0, 0.509804, 1,
1.433606, -0.6032577, 2.357226, 1, 0, 0.5058824, 1,
1.445175, 1.841044, 0.5241791, 1, 0, 0.4980392, 1,
1.446117, -0.5706957, 2.135982, 1, 0, 0.4901961, 1,
1.450077, -1.449457, 1.362033, 1, 0, 0.4862745, 1,
1.454207, 0.1431848, 1.444272, 1, 0, 0.4784314, 1,
1.454457, -1.872009, 2.704161, 1, 0, 0.4745098, 1,
1.462988, -2.011373, 3.429137, 1, 0, 0.4666667, 1,
1.47132, -0.6183515, 1.54758, 1, 0, 0.4627451, 1,
1.480697, 0.3818256, -0.499838, 1, 0, 0.454902, 1,
1.487885, 0.07810293, 1.952755, 1, 0, 0.4509804, 1,
1.489014, -0.690472, 2.227726, 1, 0, 0.4431373, 1,
1.493683, 0.5973619, 1.305657, 1, 0, 0.4392157, 1,
1.50373, 0.7656716, 0.7055395, 1, 0, 0.4313726, 1,
1.506323, -0.9171638, 1.173922, 1, 0, 0.427451, 1,
1.506596, 0.5600977, 2.639726, 1, 0, 0.4196078, 1,
1.508657, 0.04730798, 2.079197, 1, 0, 0.4156863, 1,
1.51169, -0.3144928, 2.559562, 1, 0, 0.4078431, 1,
1.522035, 0.5968959, 1.254616, 1, 0, 0.4039216, 1,
1.524607, -1.04592, 2.145834, 1, 0, 0.3960784, 1,
1.532783, 0.2725134, 2.812598, 1, 0, 0.3882353, 1,
1.542388, 0.4042968, 0.6248851, 1, 0, 0.3843137, 1,
1.542567, 0.5561478, 1.893973, 1, 0, 0.3764706, 1,
1.543267, 0.7889037, -1.129815, 1, 0, 0.372549, 1,
1.55048, -0.2570762, 1.117072, 1, 0, 0.3647059, 1,
1.559102, -2.229598, 3.512194, 1, 0, 0.3607843, 1,
1.561584, 0.1981132, 1.035658, 1, 0, 0.3529412, 1,
1.568206, 0.2565615, 2.284235, 1, 0, 0.3490196, 1,
1.583316, -0.1398666, 0.7674425, 1, 0, 0.3411765, 1,
1.587915, 0.8743853, 0.5603122, 1, 0, 0.3372549, 1,
1.590537, -0.8246619, 1.990272, 1, 0, 0.3294118, 1,
1.593848, 1.495525, 1.883893, 1, 0, 0.3254902, 1,
1.609828, 0.9232486, 1.432043, 1, 0, 0.3176471, 1,
1.610036, 0.4673676, 0.8390251, 1, 0, 0.3137255, 1,
1.61131, 1.05327, 3.367944, 1, 0, 0.3058824, 1,
1.617594, -0.03715276, -0.279004, 1, 0, 0.2980392, 1,
1.630528, 1.307238, -0.5435679, 1, 0, 0.2941177, 1,
1.631614, -1.481119, 2.701151, 1, 0, 0.2862745, 1,
1.638361, 0.1507084, 0.02191435, 1, 0, 0.282353, 1,
1.640717, 0.7431867, 3.02829, 1, 0, 0.2745098, 1,
1.646236, -0.2014463, -1.026603, 1, 0, 0.2705882, 1,
1.656303, 1.501639, 1.357698, 1, 0, 0.2627451, 1,
1.679607, -0.1473594, 2.204208, 1, 0, 0.2588235, 1,
1.684768, -1.72193, 2.744981, 1, 0, 0.2509804, 1,
1.689092, -1.291593, 2.442636, 1, 0, 0.2470588, 1,
1.69163, 0.2749862, 2.220536, 1, 0, 0.2392157, 1,
1.695094, 1.875516, 0.4661162, 1, 0, 0.2352941, 1,
1.700301, -1.645618, 1.549411, 1, 0, 0.227451, 1,
1.717646, -1.08315, 4.345456, 1, 0, 0.2235294, 1,
1.727007, -0.36915, 2.888012, 1, 0, 0.2156863, 1,
1.756483, -0.9372852, 1.082852, 1, 0, 0.2117647, 1,
1.785065, 0.3341692, 1.238604, 1, 0, 0.2039216, 1,
1.797541, -0.8383719, 3.190635, 1, 0, 0.1960784, 1,
1.806862, 0.8568819, 0.946739, 1, 0, 0.1921569, 1,
1.815725, 1.936877, 0.08212103, 1, 0, 0.1843137, 1,
1.832269, -0.9727702, 0.159042, 1, 0, 0.1803922, 1,
1.854736, 0.4800175, 0.8417352, 1, 0, 0.172549, 1,
1.866206, 0.2421368, 2.02311, 1, 0, 0.1686275, 1,
1.867817, 0.09090005, 1.103144, 1, 0, 0.1607843, 1,
1.870575, -0.6752217, 1.829399, 1, 0, 0.1568628, 1,
1.883329, 0.3932602, 0.5132202, 1, 0, 0.1490196, 1,
1.887478, -0.2394724, 2.982411, 1, 0, 0.145098, 1,
1.88856, 1.301858, -1.602878, 1, 0, 0.1372549, 1,
1.909039, 0.0977663, 1.072613, 1, 0, 0.1333333, 1,
1.917421, 0.2309222, 1.811648, 1, 0, 0.1254902, 1,
1.962907, 1.098606, 0.9996756, 1, 0, 0.1215686, 1,
1.971315, -0.9052945, 0.5623426, 1, 0, 0.1137255, 1,
1.974028, 1.59439, 0.7705806, 1, 0, 0.1098039, 1,
1.984762, -0.4293959, 2.817378, 1, 0, 0.1019608, 1,
2.029883, 0.6750621, 2.374783, 1, 0, 0.09411765, 1,
2.141826, -0.6067998, 2.004627, 1, 0, 0.09019608, 1,
2.174012, -0.1495517, -0.1756219, 1, 0, 0.08235294, 1,
2.198941, -0.5496072, 0.8206481, 1, 0, 0.07843138, 1,
2.233623, -0.3267334, 2.121739, 1, 0, 0.07058824, 1,
2.302761, 0.9293863, 0.5728619, 1, 0, 0.06666667, 1,
2.303928, -0.08605626, 1.059754, 1, 0, 0.05882353, 1,
2.317224, 1.38958, 0.4171579, 1, 0, 0.05490196, 1,
2.385532, -0.2225949, 0.3079684, 1, 0, 0.04705882, 1,
2.663139, 0.1414252, 0.1522331, 1, 0, 0.04313726, 1,
2.795423, -1.006682, 1.027349, 1, 0, 0.03529412, 1,
2.795898, 0.09920983, 1.285254, 1, 0, 0.03137255, 1,
2.797229, -0.03230705, -1.346929, 1, 0, 0.02352941, 1,
2.82995, -1.411286, 2.571907, 1, 0, 0.01960784, 1,
2.99092, -0.5107256, 2.191233, 1, 0, 0.01176471, 1,
3.266158, 1.754697, 1.660413, 1, 0, 0.007843138, 1
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
0.2706887, -5.008578, -7.506825, 0, -0.5, 0.5, 0.5,
0.2706887, -5.008578, -7.506825, 1, -0.5, 0.5, 0.5,
0.2706887, -5.008578, -7.506825, 1, 1.5, 0.5, 0.5,
0.2706887, -5.008578, -7.506825, 0, 1.5, 0.5, 0.5
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
-3.740245, -0.419939, -7.506825, 0, -0.5, 0.5, 0.5,
-3.740245, -0.419939, -7.506825, 1, -0.5, 0.5, 0.5,
-3.740245, -0.419939, -7.506825, 1, 1.5, 0.5, 0.5,
-3.740245, -0.419939, -7.506825, 0, 1.5, 0.5, 0.5
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
-3.740245, -5.008578, 0.1672127, 0, -0.5, 0.5, 0.5,
-3.740245, -5.008578, 0.1672127, 1, -0.5, 0.5, 0.5,
-3.740245, -5.008578, 0.1672127, 1, 1.5, 0.5, 0.5,
-3.740245, -5.008578, 0.1672127, 0, 1.5, 0.5, 0.5
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
-2, -3.949661, -5.735893,
3, -3.949661, -5.735893,
-2, -3.949661, -5.735893,
-2, -4.126147, -6.031049,
-1, -3.949661, -5.735893,
-1, -4.126147, -6.031049,
0, -3.949661, -5.735893,
0, -4.126147, -6.031049,
1, -3.949661, -5.735893,
1, -4.126147, -6.031049,
2, -3.949661, -5.735893,
2, -4.126147, -6.031049,
3, -3.949661, -5.735893,
3, -4.126147, -6.031049
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
-2, -4.479119, -6.621359, 0, -0.5, 0.5, 0.5,
-2, -4.479119, -6.621359, 1, -0.5, 0.5, 0.5,
-2, -4.479119, -6.621359, 1, 1.5, 0.5, 0.5,
-2, -4.479119, -6.621359, 0, 1.5, 0.5, 0.5,
-1, -4.479119, -6.621359, 0, -0.5, 0.5, 0.5,
-1, -4.479119, -6.621359, 1, -0.5, 0.5, 0.5,
-1, -4.479119, -6.621359, 1, 1.5, 0.5, 0.5,
-1, -4.479119, -6.621359, 0, 1.5, 0.5, 0.5,
0, -4.479119, -6.621359, 0, -0.5, 0.5, 0.5,
0, -4.479119, -6.621359, 1, -0.5, 0.5, 0.5,
0, -4.479119, -6.621359, 1, 1.5, 0.5, 0.5,
0, -4.479119, -6.621359, 0, 1.5, 0.5, 0.5,
1, -4.479119, -6.621359, 0, -0.5, 0.5, 0.5,
1, -4.479119, -6.621359, 1, -0.5, 0.5, 0.5,
1, -4.479119, -6.621359, 1, 1.5, 0.5, 0.5,
1, -4.479119, -6.621359, 0, 1.5, 0.5, 0.5,
2, -4.479119, -6.621359, 0, -0.5, 0.5, 0.5,
2, -4.479119, -6.621359, 1, -0.5, 0.5, 0.5,
2, -4.479119, -6.621359, 1, 1.5, 0.5, 0.5,
2, -4.479119, -6.621359, 0, 1.5, 0.5, 0.5,
3, -4.479119, -6.621359, 0, -0.5, 0.5, 0.5,
3, -4.479119, -6.621359, 1, -0.5, 0.5, 0.5,
3, -4.479119, -6.621359, 1, 1.5, 0.5, 0.5,
3, -4.479119, -6.621359, 0, 1.5, 0.5, 0.5
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
-2.814645, -3, -5.735893,
-2.814645, 3, -5.735893,
-2.814645, -3, -5.735893,
-2.968911, -3, -6.031049,
-2.814645, -2, -5.735893,
-2.968911, -2, -6.031049,
-2.814645, -1, -5.735893,
-2.968911, -1, -6.031049,
-2.814645, 0, -5.735893,
-2.968911, 0, -6.031049,
-2.814645, 1, -5.735893,
-2.968911, 1, -6.031049,
-2.814645, 2, -5.735893,
-2.968911, 2, -6.031049,
-2.814645, 3, -5.735893,
-2.968911, 3, -6.031049
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
-3.277445, -3, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, -3, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, -3, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, -3, -6.621359, 0, 1.5, 0.5, 0.5,
-3.277445, -2, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, -2, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, -2, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, -2, -6.621359, 0, 1.5, 0.5, 0.5,
-3.277445, -1, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, -1, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, -1, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, -1, -6.621359, 0, 1.5, 0.5, 0.5,
-3.277445, 0, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, 0, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, 0, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, 0, -6.621359, 0, 1.5, 0.5, 0.5,
-3.277445, 1, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, 1, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, 1, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, 1, -6.621359, 0, 1.5, 0.5, 0.5,
-3.277445, 2, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, 2, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, 2, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, 2, -6.621359, 0, 1.5, 0.5, 0.5,
-3.277445, 3, -6.621359, 0, -0.5, 0.5, 0.5,
-3.277445, 3, -6.621359, 1, -0.5, 0.5, 0.5,
-3.277445, 3, -6.621359, 1, 1.5, 0.5, 0.5,
-3.277445, 3, -6.621359, 0, 1.5, 0.5, 0.5
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
-2.814645, -3.949661, -4,
-2.814645, -3.949661, 4,
-2.814645, -3.949661, -4,
-2.968911, -4.126147, -4,
-2.814645, -3.949661, -2,
-2.968911, -4.126147, -2,
-2.814645, -3.949661, 0,
-2.968911, -4.126147, 0,
-2.814645, -3.949661, 2,
-2.968911, -4.126147, 2,
-2.814645, -3.949661, 4,
-2.968911, -4.126147, 4
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
-3.277445, -4.479119, -4, 0, -0.5, 0.5, 0.5,
-3.277445, -4.479119, -4, 1, -0.5, 0.5, 0.5,
-3.277445, -4.479119, -4, 1, 1.5, 0.5, 0.5,
-3.277445, -4.479119, -4, 0, 1.5, 0.5, 0.5,
-3.277445, -4.479119, -2, 0, -0.5, 0.5, 0.5,
-3.277445, -4.479119, -2, 1, -0.5, 0.5, 0.5,
-3.277445, -4.479119, -2, 1, 1.5, 0.5, 0.5,
-3.277445, -4.479119, -2, 0, 1.5, 0.5, 0.5,
-3.277445, -4.479119, 0, 0, -0.5, 0.5, 0.5,
-3.277445, -4.479119, 0, 1, -0.5, 0.5, 0.5,
-3.277445, -4.479119, 0, 1, 1.5, 0.5, 0.5,
-3.277445, -4.479119, 0, 0, 1.5, 0.5, 0.5,
-3.277445, -4.479119, 2, 0, -0.5, 0.5, 0.5,
-3.277445, -4.479119, 2, 1, -0.5, 0.5, 0.5,
-3.277445, -4.479119, 2, 1, 1.5, 0.5, 0.5,
-3.277445, -4.479119, 2, 0, 1.5, 0.5, 0.5,
-3.277445, -4.479119, 4, 0, -0.5, 0.5, 0.5,
-3.277445, -4.479119, 4, 1, -0.5, 0.5, 0.5,
-3.277445, -4.479119, 4, 1, 1.5, 0.5, 0.5,
-3.277445, -4.479119, 4, 0, 1.5, 0.5, 0.5
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
-2.814645, -3.949661, -5.735893,
-2.814645, 3.109783, -5.735893,
-2.814645, -3.949661, 6.070319,
-2.814645, 3.109783, 6.070319,
-2.814645, -3.949661, -5.735893,
-2.814645, -3.949661, 6.070319,
-2.814645, 3.109783, -5.735893,
-2.814645, 3.109783, 6.070319,
-2.814645, -3.949661, -5.735893,
3.356022, -3.949661, -5.735893,
-2.814645, -3.949661, 6.070319,
3.356022, -3.949661, 6.070319,
-2.814645, 3.109783, -5.735893,
3.356022, 3.109783, -5.735893,
-2.814645, 3.109783, 6.070319,
3.356022, 3.109783, 6.070319,
3.356022, -3.949661, -5.735893,
3.356022, 3.109783, -5.735893,
3.356022, -3.949661, 6.070319,
3.356022, 3.109783, 6.070319,
3.356022, -3.949661, -5.735893,
3.356022, -3.949661, 6.070319,
3.356022, 3.109783, -5.735893,
3.356022, 3.109783, 6.070319
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
var radius = 8.050535;
var distance = 35.81774;
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
mvMatrix.translate( -0.2706887, 0.419939, -0.1672127 );
mvMatrix.scale( 1.410609, 1.233014, 0.7372726 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81774);
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
pyrethrin_I<-read.table("pyrethrin_I.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrethrin_I$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
```

```r
y<-pyrethrin_I$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
```

```r
z<-pyrethrin_I$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
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
-2.724781, -0.3799916, -2.530446, 0, 0, 1, 1, 1,
-2.645049, -0.04869269, -1.937433, 1, 0, 0, 1, 1,
-2.537561, 0.7894851, -1.585055, 1, 0, 0, 1, 1,
-2.402277, 0.3546145, -2.469584, 1, 0, 0, 1, 1,
-2.385993, 0.38063, -3.106069, 1, 0, 0, 1, 1,
-2.359697, 0.2580217, -1.715178, 1, 0, 0, 1, 1,
-2.253201, -1.749083, -1.917057, 0, 0, 0, 1, 1,
-2.22614, 0.4493843, -1.859859, 0, 0, 0, 1, 1,
-2.218403, 0.552387, -1.287406, 0, 0, 0, 1, 1,
-2.205574, 0.7126538, -1.625246, 0, 0, 0, 1, 1,
-2.203208, -0.1260276, -2.385009, 0, 0, 0, 1, 1,
-2.178549, -0.186603, -1.191787, 0, 0, 0, 1, 1,
-2.126337, -0.964132, -1.234793, 0, 0, 0, 1, 1,
-2.118713, -1.355873, -2.041309, 1, 1, 1, 1, 1,
-2.089267, 1.017257, -1.426323, 1, 1, 1, 1, 1,
-2.07619, -0.2351662, -2.359785, 1, 1, 1, 1, 1,
-2.071719, -0.008102695, -2.328329, 1, 1, 1, 1, 1,
-2.042511, 1.465558, -0.5439322, 1, 1, 1, 1, 1,
-1.978444, -0.9684792, -1.415539, 1, 1, 1, 1, 1,
-1.966103, 1.026455, 0.05959399, 1, 1, 1, 1, 1,
-1.947855, 1.383159, -1.056396, 1, 1, 1, 1, 1,
-1.923758, -1.779783, -0.3530008, 1, 1, 1, 1, 1,
-1.915348, 0.2995747, -1.505334, 1, 1, 1, 1, 1,
-1.912201, -1.149567, -2.120063, 1, 1, 1, 1, 1,
-1.905358, -0.8192745, -0.2125566, 1, 1, 1, 1, 1,
-1.883729, 0.5019827, -1.155784, 1, 1, 1, 1, 1,
-1.877903, -0.2558599, -0.5559291, 1, 1, 1, 1, 1,
-1.851769, -0.8175559, -2.83134, 1, 1, 1, 1, 1,
-1.851261, 0.1646383, -1.282602, 0, 0, 1, 1, 1,
-1.847352, -1.343614, -0.4514287, 1, 0, 0, 1, 1,
-1.841402, -0.8755373, -0.3513046, 1, 0, 0, 1, 1,
-1.839291, -0.4591315, -0.4398025, 1, 0, 0, 1, 1,
-1.838973, 0.9577651, -1.168422, 1, 0, 0, 1, 1,
-1.8151, -0.3366796, -1.37776, 1, 0, 0, 1, 1,
-1.78291, -1.360915, -1.112806, 0, 0, 0, 1, 1,
-1.771113, 0.5602534, -1.699667, 0, 0, 0, 1, 1,
-1.742095, -1.829093, -4.375957, 0, 0, 0, 1, 1,
-1.739743, 0.1761893, -0.4058558, 0, 0, 0, 1, 1,
-1.73972, 0.1202369, -2.905947, 0, 0, 0, 1, 1,
-1.726322, -1.17719, -2.893609, 0, 0, 0, 1, 1,
-1.709751, 0.6574768, -2.935124, 0, 0, 0, 1, 1,
-1.683627, 0.7948852, -1.034691, 1, 1, 1, 1, 1,
-1.674727, -1.193487, -4.330448, 1, 1, 1, 1, 1,
-1.662486, 1.067918, -0.8528959, 1, 1, 1, 1, 1,
-1.657398, -0.3075649, -1.609964, 1, 1, 1, 1, 1,
-1.64883, -2.032791, -3.572942, 1, 1, 1, 1, 1,
-1.643381, 0.1996514, -0.6540916, 1, 1, 1, 1, 1,
-1.637128, 0.6089204, -1.179895, 1, 1, 1, 1, 1,
-1.6163, -1.654968, -2.645365, 1, 1, 1, 1, 1,
-1.61581, 0.8863755, -2.157715, 1, 1, 1, 1, 1,
-1.583982, -1.103922, -2.49594, 1, 1, 1, 1, 1,
-1.5817, 0.1668999, -1.672161, 1, 1, 1, 1, 1,
-1.577731, -1.892171, -2.832809, 1, 1, 1, 1, 1,
-1.552559, -0.4498119, -2.054246, 1, 1, 1, 1, 1,
-1.548503, 0.8027077, -0.6912261, 1, 1, 1, 1, 1,
-1.534629, 1.390306, -0.4612683, 1, 1, 1, 1, 1,
-1.532643, 0.4250123, -0.8035288, 0, 0, 1, 1, 1,
-1.511776, 1.122174, -0.3920188, 1, 0, 0, 1, 1,
-1.50681, 1.649382, -1.900902, 1, 0, 0, 1, 1,
-1.506581, 0.4554788, -1.306904, 1, 0, 0, 1, 1,
-1.506098, 0.8171387, -1.721855, 1, 0, 0, 1, 1,
-1.50506, 0.5300625, -1.064582, 1, 0, 0, 1, 1,
-1.489831, 0.835735, 0.7749201, 0, 0, 0, 1, 1,
-1.487717, -0.3062759, -2.239286, 0, 0, 0, 1, 1,
-1.476316, -1.18856, -2.901527, 0, 0, 0, 1, 1,
-1.474819, 1.539083, -2.254845, 0, 0, 0, 1, 1,
-1.456233, -0.515154, -3.130705, 0, 0, 0, 1, 1,
-1.451055, 2.459647, -1.041192, 0, 0, 0, 1, 1,
-1.436572, 1.158336, -1.439903, 0, 0, 0, 1, 1,
-1.429698, -2.371248, -2.833837, 1, 1, 1, 1, 1,
-1.42534, 0.5893707, -2.823056, 1, 1, 1, 1, 1,
-1.409241, -0.5642537, -1.442576, 1, 1, 1, 1, 1,
-1.400647, 0.6776066, -0.9241632, 1, 1, 1, 1, 1,
-1.394374, -0.08271073, -0.5016782, 1, 1, 1, 1, 1,
-1.38645, -1.729338, -3.029902, 1, 1, 1, 1, 1,
-1.372225, -0.9368223, -2.775748, 1, 1, 1, 1, 1,
-1.366052, 0.8569804, -0.4771312, 1, 1, 1, 1, 1,
-1.356886, 0.2482561, -0.7288483, 1, 1, 1, 1, 1,
-1.344748, 2.221967, -3.160439, 1, 1, 1, 1, 1,
-1.342375, 1.104076, -2.62861, 1, 1, 1, 1, 1,
-1.341836, 0.750513, -1.047306, 1, 1, 1, 1, 1,
-1.338068, -0.01182199, -1.34835, 1, 1, 1, 1, 1,
-1.335275, 0.3339655, -2.043483, 1, 1, 1, 1, 1,
-1.323165, 1.941964, -0.2160717, 1, 1, 1, 1, 1,
-1.320548, -1.368841, -1.769174, 0, 0, 1, 1, 1,
-1.301711, -0.9448677, -2.084413, 1, 0, 0, 1, 1,
-1.301094, 0.9853835, -1.007542, 1, 0, 0, 1, 1,
-1.299619, 0.5657253, -0.5096888, 1, 0, 0, 1, 1,
-1.29197, 0.6463015, -0.7666067, 1, 0, 0, 1, 1,
-1.286498, 0.4977311, -1.199537, 1, 0, 0, 1, 1,
-1.2845, -0.7363167, -1.863302, 0, 0, 0, 1, 1,
-1.282174, 1.33278, 0.5382676, 0, 0, 0, 1, 1,
-1.279044, 1.147454, 1.050925, 0, 0, 0, 1, 1,
-1.271846, -0.2233564, -1.067934, 0, 0, 0, 1, 1,
-1.270445, 0.3544331, -1.3227, 0, 0, 0, 1, 1,
-1.269398, -1.107424, -2.606501, 0, 0, 0, 1, 1,
-1.265887, 0.3801021, -2.118676, 0, 0, 0, 1, 1,
-1.258702, 0.7508389, -2.86884, 1, 1, 1, 1, 1,
-1.246402, 0.2518283, -2.103903, 1, 1, 1, 1, 1,
-1.244468, 0.5783849, -1.947288, 1, 1, 1, 1, 1,
-1.244051, -1.432038, -3.196078, 1, 1, 1, 1, 1,
-1.233728, 1.95749, 0.3520295, 1, 1, 1, 1, 1,
-1.233081, 0.9623666, -0.2785399, 1, 1, 1, 1, 1,
-1.231623, 0.4593978, -1.606437, 1, 1, 1, 1, 1,
-1.224846, 0.0553918, -0.4132133, 1, 1, 1, 1, 1,
-1.221816, -0.5969593, -2.567388, 1, 1, 1, 1, 1,
-1.215064, -1.103296, -3.569577, 1, 1, 1, 1, 1,
-1.213342, -0.4008515, -1.549435, 1, 1, 1, 1, 1,
-1.205366, 0.3341838, -1.519361, 1, 1, 1, 1, 1,
-1.180357, -0.7989471, -0.645026, 1, 1, 1, 1, 1,
-1.171331, 0.137379, -0.6558407, 1, 1, 1, 1, 1,
-1.170426, 1.229192, -0.5444946, 1, 1, 1, 1, 1,
-1.165071, -0.9262487, -3.435004, 0, 0, 1, 1, 1,
-1.164073, 0.9614598, -1.224522, 1, 0, 0, 1, 1,
-1.148958, 0.8582883, 0.4449385, 1, 0, 0, 1, 1,
-1.139125, -0.5431243, -0.3097012, 1, 0, 0, 1, 1,
-1.135963, -0.9284511, -2.008201, 1, 0, 0, 1, 1,
-1.134158, -1.155701, -1.872792, 1, 0, 0, 1, 1,
-1.121677, -1.029165, -0.6184669, 0, 0, 0, 1, 1,
-1.1176, 0.1191067, -0.5526791, 0, 0, 0, 1, 1,
-1.114202, 0.7959342, -3.420564, 0, 0, 0, 1, 1,
-1.109753, -0.1874382, -3.564209, 0, 0, 0, 1, 1,
-1.10918, -0.3418349, -3.824503, 0, 0, 0, 1, 1,
-1.106642, -0.1046711, -2.248027, 0, 0, 0, 1, 1,
-1.090755, -0.2873372, -2.567087, 0, 0, 0, 1, 1,
-1.090595, 0.8045004, -1.725936, 1, 1, 1, 1, 1,
-1.089781, 0.4518879, -0.2586412, 1, 1, 1, 1, 1,
-1.083588, -1.19795, -0.8585291, 1, 1, 1, 1, 1,
-1.082384, -1.621536, -3.250325, 1, 1, 1, 1, 1,
-1.080577, -1.368026, -4.314744, 1, 1, 1, 1, 1,
-1.078412, 1.0717, -1.033243, 1, 1, 1, 1, 1,
-1.077511, -1.408778, -3.20756, 1, 1, 1, 1, 1,
-1.076844, 1.994307, -1.834062, 1, 1, 1, 1, 1,
-1.073001, -0.4383647, -0.8242851, 1, 1, 1, 1, 1,
-1.064951, -0.006785615, -0.5109033, 1, 1, 1, 1, 1,
-1.064484, 0.9773002, -0.7847565, 1, 1, 1, 1, 1,
-1.063564, -3.846854, -3.350601, 1, 1, 1, 1, 1,
-1.055216, 0.1543771, 0.1103041, 1, 1, 1, 1, 1,
-1.054783, 0.2453528, -1.291662, 1, 1, 1, 1, 1,
-1.052719, 1.121366, -1.43931, 1, 1, 1, 1, 1,
-1.050204, -0.03847952, -2.565732, 0, 0, 1, 1, 1,
-1.049831, -1.045028, -2.095173, 1, 0, 0, 1, 1,
-1.045675, 0.3366052, -3.514112, 1, 0, 0, 1, 1,
-1.041761, 0.6822712, 0.03141714, 1, 0, 0, 1, 1,
-1.040905, 0.2650272, -1.590638, 1, 0, 0, 1, 1,
-1.038048, 1.568972, -0.2118388, 1, 0, 0, 1, 1,
-1.033897, -0.3690783, -0.7115874, 0, 0, 0, 1, 1,
-1.033373, 0.2619457, -1.719431, 0, 0, 0, 1, 1,
-1.025234, -0.6806356, -2.391358, 0, 0, 0, 1, 1,
-1.022247, -0.8501568, -2.738527, 0, 0, 0, 1, 1,
-1.012132, 0.736635, 0.8177507, 0, 0, 0, 1, 1,
-1.005811, 0.6841612, -0.7112461, 0, 0, 0, 1, 1,
-1.002561, 0.206232, -2.106327, 0, 0, 0, 1, 1,
-1.001982, -0.4802662, -3.043093, 1, 1, 1, 1, 1,
-1.001116, 2.01293, 0.9035626, 1, 1, 1, 1, 1,
-0.997158, 0.4579987, -1.920165, 1, 1, 1, 1, 1,
-0.9946222, 0.7792151, -0.2048727, 1, 1, 1, 1, 1,
-0.9925078, -0.4647291, -0.4439395, 1, 1, 1, 1, 1,
-0.9861388, 0.4574744, -0.1560398, 1, 1, 1, 1, 1,
-0.9836946, -2.313801, -1.800704, 1, 1, 1, 1, 1,
-0.9810638, 1.968411, -0.1783563, 1, 1, 1, 1, 1,
-0.9722755, -1.020962, -2.146858, 1, 1, 1, 1, 1,
-0.9643298, 0.1260766, -0.2804895, 1, 1, 1, 1, 1,
-0.9640645, -1.081067, -4.769568, 1, 1, 1, 1, 1,
-0.9638861, 1.6025, -0.8332963, 1, 1, 1, 1, 1,
-0.963646, -0.1776357, -1.64143, 1, 1, 1, 1, 1,
-0.9551222, -0.8536357, -3.129807, 1, 1, 1, 1, 1,
-0.9535046, -0.2996863, -2.442499, 1, 1, 1, 1, 1,
-0.952951, -0.7166983, -2.481679, 0, 0, 1, 1, 1,
-0.9465796, -0.641202, -2.040726, 1, 0, 0, 1, 1,
-0.9443848, 0.2310834, -1.749904, 1, 0, 0, 1, 1,
-0.9406727, -1.161228, -4.001399, 1, 0, 0, 1, 1,
-0.9372476, -1.36322, -2.562394, 1, 0, 0, 1, 1,
-0.9362423, -0.1318949, -2.435966, 1, 0, 0, 1, 1,
-0.9287214, 0.5346377, -1.718739, 0, 0, 0, 1, 1,
-0.9203268, 0.3769321, -0.5593556, 0, 0, 0, 1, 1,
-0.919043, -0.6862768, -0.1109577, 0, 0, 0, 1, 1,
-0.9186135, 1.538401, 0.02127568, 0, 0, 0, 1, 1,
-0.9168877, -0.7647167, -2.000225, 0, 0, 0, 1, 1,
-0.9168487, 1.84208, -0.7189237, 0, 0, 0, 1, 1,
-0.9122709, -0.2088719, -2.780212, 0, 0, 0, 1, 1,
-0.9110438, 0.2940675, -1.185756, 1, 1, 1, 1, 1,
-0.908507, -1.352251, -1.534275, 1, 1, 1, 1, 1,
-0.907065, 0.9675581, -1.83648, 1, 1, 1, 1, 1,
-0.9063792, 0.9909959, -1.911525, 1, 1, 1, 1, 1,
-0.9044824, -0.4072249, -3.704872, 1, 1, 1, 1, 1,
-0.9024159, -1.557155, -1.954004, 1, 1, 1, 1, 1,
-0.9020626, -0.7691445, -2.809038, 1, 1, 1, 1, 1,
-0.9011729, 0.3257385, -1.36494, 1, 1, 1, 1, 1,
-0.8989231, -0.7761677, -2.676324, 1, 1, 1, 1, 1,
-0.8975663, -1.264896, -2.307595, 1, 1, 1, 1, 1,
-0.8970434, -0.7334785, -3.440655, 1, 1, 1, 1, 1,
-0.8960869, -0.7672621, -4.282529, 1, 1, 1, 1, 1,
-0.8879629, -0.2751706, -3.376726, 1, 1, 1, 1, 1,
-0.8815016, 0.126857, -2.189267, 1, 1, 1, 1, 1,
-0.8736573, -0.3231019, -3.589529, 1, 1, 1, 1, 1,
-0.8708069, -0.3026991, -1.461694, 0, 0, 1, 1, 1,
-0.8675675, 1.554058, -1.809476, 1, 0, 0, 1, 1,
-0.8655538, -0.7696173, -3.65293, 1, 0, 0, 1, 1,
-0.8643488, -0.4679972, -2.884364, 1, 0, 0, 1, 1,
-0.8643122, -0.7513828, -1.085328, 1, 0, 0, 1, 1,
-0.8630667, -0.6900411, -0.7498164, 1, 0, 0, 1, 1,
-0.8628056, -0.05289484, -2.44867, 0, 0, 0, 1, 1,
-0.856248, 0.4540762, -0.9707622, 0, 0, 0, 1, 1,
-0.8525435, -1.229909, -3.244869, 0, 0, 0, 1, 1,
-0.8499098, -1.84494, -2.621062, 0, 0, 0, 1, 1,
-0.8494056, 0.5314698, -1.705921, 0, 0, 0, 1, 1,
-0.8465219, 0.04351981, -2.175312, 0, 0, 0, 1, 1,
-0.8429337, 0.06487358, -0.9136912, 0, 0, 0, 1, 1,
-0.8404584, -0.2679912, -2.452227, 1, 1, 1, 1, 1,
-0.8282048, 1.403713, 1.032329, 1, 1, 1, 1, 1,
-0.8219818, -0.4195533, -1.684688, 1, 1, 1, 1, 1,
-0.821198, -1.084228, -3.574811, 1, 1, 1, 1, 1,
-0.818897, 0.4315667, -0.9455927, 1, 1, 1, 1, 1,
-0.8146, -0.9307066, -2.800487, 1, 1, 1, 1, 1,
-0.8133382, 1.215595, -0.9598972, 1, 1, 1, 1, 1,
-0.8052356, -0.3430032, -3.567344, 1, 1, 1, 1, 1,
-0.8012279, -0.4980836, -3.438491, 1, 1, 1, 1, 1,
-0.7981365, 0.8783114, -0.2763979, 1, 1, 1, 1, 1,
-0.7968063, 1.71649, -0.424125, 1, 1, 1, 1, 1,
-0.7952737, -0.503507, -2.221243, 1, 1, 1, 1, 1,
-0.7949309, 0.3715979, -1.691772, 1, 1, 1, 1, 1,
-0.7907771, 0.7324839, -1.134091, 1, 1, 1, 1, 1,
-0.7845167, -0.8584839, -1.682732, 1, 1, 1, 1, 1,
-0.7836747, 0.7931864, -1.671695, 0, 0, 1, 1, 1,
-0.782083, -0.9055338, -4.075466, 1, 0, 0, 1, 1,
-0.7804638, -1.861067, -2.81008, 1, 0, 0, 1, 1,
-0.7788355, -1.824178, -3.106324, 1, 0, 0, 1, 1,
-0.7777909, 0.745071, -0.3685707, 1, 0, 0, 1, 1,
-0.7718565, 0.299709, -3.168182, 1, 0, 0, 1, 1,
-0.7677281, 0.6570192, -0.3721735, 0, 0, 0, 1, 1,
-0.7672305, 0.3014245, -0.9279536, 0, 0, 0, 1, 1,
-0.7610787, 0.1396003, -2.228584, 0, 0, 0, 1, 1,
-0.7467775, 0.9734442, -1.700941, 0, 0, 0, 1, 1,
-0.7424679, 0.04217137, -0.7610469, 0, 0, 0, 1, 1,
-0.7412327, 1.749015, -1.058703, 0, 0, 0, 1, 1,
-0.7370631, -0.110622, -1.036453, 0, 0, 0, 1, 1,
-0.7347686, 1.054167, -0.2844688, 1, 1, 1, 1, 1,
-0.7343637, 3.006976, -0.3490408, 1, 1, 1, 1, 1,
-0.7321266, -1.221743, -3.590005, 1, 1, 1, 1, 1,
-0.7305057, -0.9294224, -2.434117, 1, 1, 1, 1, 1,
-0.726877, 0.5939696, -1.418985, 1, 1, 1, 1, 1,
-0.7235842, 1.330067, -0.6177415, 1, 1, 1, 1, 1,
-0.7226495, -0.07233885, -0.9424242, 1, 1, 1, 1, 1,
-0.7173356, -1.218492, -3.773578, 1, 1, 1, 1, 1,
-0.7158669, -1.455919, -2.545942, 1, 1, 1, 1, 1,
-0.7134096, 2.417518, -0.05692748, 1, 1, 1, 1, 1,
-0.7132721, -0.9733496, -2.418359, 1, 1, 1, 1, 1,
-0.7109634, -0.9728411, -2.803336, 1, 1, 1, 1, 1,
-0.7085111, 1.677132, -0.978798, 1, 1, 1, 1, 1,
-0.7071286, 1.459961, 0.4604296, 1, 1, 1, 1, 1,
-0.7066628, 0.6163613, -1.830626, 1, 1, 1, 1, 1,
-0.6803769, 0.01887107, -0.6017125, 0, 0, 1, 1, 1,
-0.6774476, 0.9660403, -0.5704697, 1, 0, 0, 1, 1,
-0.6746022, -0.1214038, -2.590052, 1, 0, 0, 1, 1,
-0.674147, -2.390482, -4.292822, 1, 0, 0, 1, 1,
-0.6731248, -0.2059446, -1.022501, 1, 0, 0, 1, 1,
-0.6726122, -0.3286544, -1.327784, 1, 0, 0, 1, 1,
-0.6598101, -2.041959, -1.365666, 0, 0, 0, 1, 1,
-0.6566336, 0.1364069, -0.4974814, 0, 0, 0, 1, 1,
-0.6542409, 0.4741713, -0.8461031, 0, 0, 0, 1, 1,
-0.6468681, -0.03343933, -2.382114, 0, 0, 0, 1, 1,
-0.6467059, 1.476416, 0.7321326, 0, 0, 0, 1, 1,
-0.6465792, 0.3766754, -0.9929576, 0, 0, 0, 1, 1,
-0.6458718, 0.7913397, -2.313209, 0, 0, 0, 1, 1,
-0.6443985, -0.5963392, -2.863943, 1, 1, 1, 1, 1,
-0.6396512, 2.451567, -0.9853912, 1, 1, 1, 1, 1,
-0.6393753, -0.2499053, -0.6323898, 1, 1, 1, 1, 1,
-0.6382408, 0.1257465, -3.026425, 1, 1, 1, 1, 1,
-0.6361269, -0.3515238, -2.711202, 1, 1, 1, 1, 1,
-0.6340969, 0.8171445, 0.4763603, 1, 1, 1, 1, 1,
-0.6294008, 0.2469046, 0.2722184, 1, 1, 1, 1, 1,
-0.624903, 0.6918899, 0.4053701, 1, 1, 1, 1, 1,
-0.6215801, -1.182485, -2.973366, 1, 1, 1, 1, 1,
-0.6211379, 0.8224568, -0.07712338, 1, 1, 1, 1, 1,
-0.620474, -0.2688589, -2.10902, 1, 1, 1, 1, 1,
-0.6153143, 0.02625765, -1.0754, 1, 1, 1, 1, 1,
-0.6133943, -0.281774, -2.682262, 1, 1, 1, 1, 1,
-0.6111572, 0.61538, 0.6823423, 1, 1, 1, 1, 1,
-0.6082321, 0.5367953, -2.360558, 1, 1, 1, 1, 1,
-0.6044204, -0.6409362, -2.245557, 0, 0, 1, 1, 1,
-0.6041943, 0.428919, -0.8929949, 1, 0, 0, 1, 1,
-0.6041334, -1.09174, -2.58444, 1, 0, 0, 1, 1,
-0.5993947, -1.041911, -1.605852, 1, 0, 0, 1, 1,
-0.5993407, -0.9454374, -2.040344, 1, 0, 0, 1, 1,
-0.5933298, -0.6810924, -1.852378, 1, 0, 0, 1, 1,
-0.5852836, -1.059748, -1.551966, 0, 0, 0, 1, 1,
-0.5837457, -1.443171, -5.563958, 0, 0, 0, 1, 1,
-0.5807408, -0.06040308, -1.49904, 0, 0, 0, 1, 1,
-0.5778028, 0.05803975, -1.48651, 0, 0, 0, 1, 1,
-0.5741563, 0.4555959, -1.073959, 0, 0, 0, 1, 1,
-0.5740459, 0.2005694, -0.8784079, 0, 0, 0, 1, 1,
-0.5739211, -1.398318, -4.163682, 0, 0, 0, 1, 1,
-0.5737844, -1.054032, -1.085934, 1, 1, 1, 1, 1,
-0.5732183, 1.671926, -2.308453, 1, 1, 1, 1, 1,
-0.568334, -0.6821036, -1.760382, 1, 1, 1, 1, 1,
-0.5678101, 1.494381, 0.04286639, 1, 1, 1, 1, 1,
-0.5659752, 1.328794, 0.3911933, 1, 1, 1, 1, 1,
-0.5645028, 0.3726996, -1.062933, 1, 1, 1, 1, 1,
-0.5614853, -0.628091, -3.306994, 1, 1, 1, 1, 1,
-0.5568935, -0.08706167, -2.241022, 1, 1, 1, 1, 1,
-0.5557894, 0.1564341, -1.859146, 1, 1, 1, 1, 1,
-0.5509535, -0.6682091, -1.558456, 1, 1, 1, 1, 1,
-0.5434929, 0.7121707, -1.378265, 1, 1, 1, 1, 1,
-0.5431979, 0.9127094, -0.6375716, 1, 1, 1, 1, 1,
-0.5376144, 1.694789, 0.7134329, 1, 1, 1, 1, 1,
-0.5344697, -1.360356, -3.070323, 1, 1, 1, 1, 1,
-0.5340332, -0.4913216, -1.694553, 1, 1, 1, 1, 1,
-0.5320881, 1.342253, -2.70146, 0, 0, 1, 1, 1,
-0.5292434, 0.1787255, -0.4680089, 1, 0, 0, 1, 1,
-0.5288971, -1.06813, -1.013052, 1, 0, 0, 1, 1,
-0.5288478, 0.7884801, -0.6089356, 1, 0, 0, 1, 1,
-0.5253099, 0.4237044, -2.724132, 1, 0, 0, 1, 1,
-0.5107786, 0.6208307, -0.8616479, 1, 0, 0, 1, 1,
-0.5091973, 0.7959404, -2.298587, 0, 0, 0, 1, 1,
-0.509153, -0.8500252, -2.811298, 0, 0, 0, 1, 1,
-0.5039071, 1.098526, 0.1871503, 0, 0, 0, 1, 1,
-0.501735, 0.5694397, -1.579258, 0, 0, 0, 1, 1,
-0.4955481, 0.4064187, -1.928798, 0, 0, 0, 1, 1,
-0.4874296, 0.5247475, 0.4113343, 0, 0, 0, 1, 1,
-0.4804054, 0.5645818, 0.000842018, 0, 0, 0, 1, 1,
-0.4803466, -0.7209881, -1.320581, 1, 1, 1, 1, 1,
-0.4785538, -1.238733, -2.488116, 1, 1, 1, 1, 1,
-0.4756156, -0.3154781, -3.870658, 1, 1, 1, 1, 1,
-0.4695045, 0.1379216, -2.143458, 1, 1, 1, 1, 1,
-0.4650507, 0.09642893, -3.367979, 1, 1, 1, 1, 1,
-0.4618913, 0.1879312, -1.777256, 1, 1, 1, 1, 1,
-0.4584768, -1.728021, -2.824641, 1, 1, 1, 1, 1,
-0.4584329, -0.6470147, -0.5716464, 1, 1, 1, 1, 1,
-0.4576627, -0.4710585, -1.539846, 1, 1, 1, 1, 1,
-0.4545563, -0.5896572, -3.611023, 1, 1, 1, 1, 1,
-0.4494356, 1.254215, -0.1887492, 1, 1, 1, 1, 1,
-0.4425885, -1.850068, -1.950734, 1, 1, 1, 1, 1,
-0.4421793, 0.6261525, -0.745126, 1, 1, 1, 1, 1,
-0.4385675, 0.9232919, -1.776455, 1, 1, 1, 1, 1,
-0.4344704, -1.148611, -2.530404, 1, 1, 1, 1, 1,
-0.4337454, -0.1427677, -2.114543, 0, 0, 1, 1, 1,
-0.4331198, 0.4804358, -0.8618577, 1, 0, 0, 1, 1,
-0.431254, -1.09926, -1.887803, 1, 0, 0, 1, 1,
-0.425311, -0.1203862, -1.411336, 1, 0, 0, 1, 1,
-0.4250247, 0.03690561, -1.402673, 1, 0, 0, 1, 1,
-0.4172881, -1.246714, -1.667253, 1, 0, 0, 1, 1,
-0.416181, 1.005843, 0.4183528, 0, 0, 0, 1, 1,
-0.4079979, -1.691544, -2.653877, 0, 0, 0, 1, 1,
-0.4032819, -0.1251511, -1.960493, 0, 0, 0, 1, 1,
-0.399958, 0.4365715, -1.335215, 0, 0, 0, 1, 1,
-0.3972894, 0.4564113, -1.466599, 0, 0, 0, 1, 1,
-0.3957812, 0.0341786, 0.05887985, 0, 0, 0, 1, 1,
-0.3922329, -0.8117157, -4.466416, 0, 0, 0, 1, 1,
-0.389103, 0.5570745, 0.3973121, 1, 1, 1, 1, 1,
-0.3880015, 1.601477, -0.7569453, 1, 1, 1, 1, 1,
-0.381968, 0.6240251, -3.381344, 1, 1, 1, 1, 1,
-0.3798893, -1.035915, -2.808768, 1, 1, 1, 1, 1,
-0.3777461, -1.308058, -2.375126, 1, 1, 1, 1, 1,
-0.3772647, 0.9210837, 0.3023757, 1, 1, 1, 1, 1,
-0.3720354, 0.9233003, 0.7625077, 1, 1, 1, 1, 1,
-0.3664745, 0.1236366, -1.546898, 1, 1, 1, 1, 1,
-0.3650335, -0.7764027, -1.966759, 1, 1, 1, 1, 1,
-0.3642579, 1.804089, 0.2428474, 1, 1, 1, 1, 1,
-0.364013, 0.4051974, -1.134528, 1, 1, 1, 1, 1,
-0.3611104, 1.126317, 0.5648186, 1, 1, 1, 1, 1,
-0.3587915, 0.1860651, 1.007362, 1, 1, 1, 1, 1,
-0.3501961, 0.7399333, 0.3329673, 1, 1, 1, 1, 1,
-0.3446479, -0.04264085, -1.980759, 1, 1, 1, 1, 1,
-0.3433691, -0.1129056, -3.08014, 0, 0, 1, 1, 1,
-0.3397573, 2.69862, -0.7843617, 1, 0, 0, 1, 1,
-0.3388607, 0.2710229, 0.2076153, 1, 0, 0, 1, 1,
-0.3368662, 0.350614, 0.7438801, 1, 0, 0, 1, 1,
-0.3344336, 1.150988, -2.749153, 1, 0, 0, 1, 1,
-0.3290474, -0.3870455, -4.870286, 1, 0, 0, 1, 1,
-0.328108, 0.08698194, -0.5230669, 0, 0, 0, 1, 1,
-0.3272864, 0.2918604, -1.884222, 0, 0, 0, 1, 1,
-0.3257474, 0.7165142, -1.577286, 0, 0, 0, 1, 1,
-0.3224103, 0.6355117, -1.730428, 0, 0, 0, 1, 1,
-0.3210325, -1.870871, -2.661317, 0, 0, 0, 1, 1,
-0.3205606, -0.1555164, -1.231413, 0, 0, 0, 1, 1,
-0.319623, -0.7061007, -2.244147, 0, 0, 0, 1, 1,
-0.3194729, -0.03113983, -4.228773, 1, 1, 1, 1, 1,
-0.3168025, 1.006562, -0.4553381, 1, 1, 1, 1, 1,
-0.3139454, -0.2740644, -2.71599, 1, 1, 1, 1, 1,
-0.310925, -0.988738, -3.681133, 1, 1, 1, 1, 1,
-0.3088778, 1.48003, -0.6173294, 1, 1, 1, 1, 1,
-0.3088031, -2.032531, -2.512296, 1, 1, 1, 1, 1,
-0.3002276, -0.01849125, -1.789487, 1, 1, 1, 1, 1,
-0.292595, 1.501508, -0.1636532, 1, 1, 1, 1, 1,
-0.2882032, 0.8196684, -0.3670438, 1, 1, 1, 1, 1,
-0.2878179, -0.9680822, -2.60205, 1, 1, 1, 1, 1,
-0.2868868, -0.4286101, -3.058015, 1, 1, 1, 1, 1,
-0.286827, 0.5863066, -0.2336339, 1, 1, 1, 1, 1,
-0.2848498, -1.446998, -2.774072, 1, 1, 1, 1, 1,
-0.2771633, 1.040927, -1.525633, 1, 1, 1, 1, 1,
-0.2715021, -0.04318533, -2.400545, 1, 1, 1, 1, 1,
-0.2697028, 1.287169, 0.3152684, 0, 0, 1, 1, 1,
-0.264965, 0.002925508, -1.719946, 1, 0, 0, 1, 1,
-0.2641064, -0.2184274, -1.55162, 1, 0, 0, 1, 1,
-0.2582071, 1.656685, -1.448214, 1, 0, 0, 1, 1,
-0.2577181, 1.146081, -1.739107, 1, 0, 0, 1, 1,
-0.2548456, -0.1900268, -1.281682, 1, 0, 0, 1, 1,
-0.2531536, -1.098844, -3.095089, 0, 0, 0, 1, 1,
-0.246544, -1.281772, -2.990413, 0, 0, 0, 1, 1,
-0.2454021, -0.9490758, -2.622052, 0, 0, 0, 1, 1,
-0.2373474, -1.634264, -3.689083, 0, 0, 0, 1, 1,
-0.2368618, 0.06813569, -0.5872695, 0, 0, 0, 1, 1,
-0.2299526, -0.3499603, -2.10538, 0, 0, 0, 1, 1,
-0.2271259, 1.079586, -1.126345, 0, 0, 0, 1, 1,
-0.226932, 0.7529991, -1.102069, 1, 1, 1, 1, 1,
-0.2266982, 0.06436791, -1.730666, 1, 1, 1, 1, 1,
-0.2263192, 1.739241, -0.1601361, 1, 1, 1, 1, 1,
-0.2245901, -0.02585544, -0.406021, 1, 1, 1, 1, 1,
-0.2242014, 1.072438, 0.03708906, 1, 1, 1, 1, 1,
-0.2233582, 0.1839654, -3.121728, 1, 1, 1, 1, 1,
-0.2221207, 1.135917, -1.501125, 1, 1, 1, 1, 1,
-0.2206561, -1.175325, -1.447572, 1, 1, 1, 1, 1,
-0.2204594, -0.6510342, -3.601992, 1, 1, 1, 1, 1,
-0.2196526, 0.6570067, -0.3765244, 1, 1, 1, 1, 1,
-0.2179114, 1.701679, -0.4095308, 1, 1, 1, 1, 1,
-0.2125188, -0.4897197, -3.225144, 1, 1, 1, 1, 1,
-0.2105151, 1.957186, -1.174266, 1, 1, 1, 1, 1,
-0.208356, -1.186537, -2.940198, 1, 1, 1, 1, 1,
-0.2071992, 2.150049, -0.8459874, 1, 1, 1, 1, 1,
-0.2044601, -1.710931, -4.268451, 0, 0, 1, 1, 1,
-0.20172, -0.6801245, -1.433381, 1, 0, 0, 1, 1,
-0.1987205, -0.327504, -2.583032, 1, 0, 0, 1, 1,
-0.1979577, 0.06312799, 0.1446626, 1, 0, 0, 1, 1,
-0.1974182, 0.4725734, -1.93018, 1, 0, 0, 1, 1,
-0.1952119, 2.038413, -0.2724893, 1, 0, 0, 1, 1,
-0.1915516, -1.167154, -3.855219, 0, 0, 0, 1, 1,
-0.188496, 0.4197857, -0.7054151, 0, 0, 0, 1, 1,
-0.187276, -0.35149, -3.102366, 0, 0, 0, 1, 1,
-0.1848311, -0.5195212, -3.291448, 0, 0, 0, 1, 1,
-0.1833857, -0.1869098, -2.261548, 0, 0, 0, 1, 1,
-0.1833121, -0.6838628, -2.576113, 0, 0, 0, 1, 1,
-0.182036, 0.7685434, -0.8804198, 0, 0, 0, 1, 1,
-0.1726368, 0.6031621, 0.3149317, 1, 1, 1, 1, 1,
-0.1714026, 0.4141954, 0.2887884, 1, 1, 1, 1, 1,
-0.1709946, 0.4063974, -0.6323008, 1, 1, 1, 1, 1,
-0.1687022, 1.299613, -1.641399, 1, 1, 1, 1, 1,
-0.1672779, 0.08078054, -2.619301, 1, 1, 1, 1, 1,
-0.1669925, -0.5000322, -3.846129, 1, 1, 1, 1, 1,
-0.1662819, 0.5468359, 0.07281786, 1, 1, 1, 1, 1,
-0.1636278, 0.1427599, -1.809078, 1, 1, 1, 1, 1,
-0.162106, 0.8475295, -0.5054274, 1, 1, 1, 1, 1,
-0.1610061, -0.2819549, -3.846473, 1, 1, 1, 1, 1,
-0.1588663, 0.05882828, 1.034731, 1, 1, 1, 1, 1,
-0.1588183, -2.182425, -3.948084, 1, 1, 1, 1, 1,
-0.1573343, -1.472835, -1.896497, 1, 1, 1, 1, 1,
-0.1511996, -1.32964, -1.750445, 1, 1, 1, 1, 1,
-0.1505849, 0.4430607, 0.4687847, 1, 1, 1, 1, 1,
-0.1494617, -0.5608478, -2.183669, 0, 0, 1, 1, 1,
-0.142232, 0.1483428, -0.5910897, 1, 0, 0, 1, 1,
-0.1397445, 0.1630263, 0.4763582, 1, 0, 0, 1, 1,
-0.1380375, 1.205356, -0.33157, 1, 0, 0, 1, 1,
-0.1376765, -1.077911, -4.313089, 1, 0, 0, 1, 1,
-0.1368018, -1.962188, -2.602772, 1, 0, 0, 1, 1,
-0.1364964, 0.2309192, 0.09751196, 0, 0, 0, 1, 1,
-0.1355982, 0.6110773, 0.9366805, 0, 0, 0, 1, 1,
-0.1332624, 0.2023824, -1.174276, 0, 0, 0, 1, 1,
-0.1283311, 0.7249843, -0.9716281, 0, 0, 0, 1, 1,
-0.1259224, -0.7949246, -2.385639, 0, 0, 0, 1, 1,
-0.1248874, 1.297151, -0.3151194, 0, 0, 0, 1, 1,
-0.1235987, -0.423797, -1.73964, 0, 0, 0, 1, 1,
-0.1235462, -0.305095, -2.509291, 1, 1, 1, 1, 1,
-0.1185368, -0.7190539, -2.140471, 1, 1, 1, 1, 1,
-0.1183159, 1.15633, 2.031898, 1, 1, 1, 1, 1,
-0.1102243, -0.926007, -2.710305, 1, 1, 1, 1, 1,
-0.1080034, 2.60392, 0.5692043, 1, 1, 1, 1, 1,
-0.1077995, -1.371268, -3.307546, 1, 1, 1, 1, 1,
-0.1062824, 0.2673992, 0.9948924, 1, 1, 1, 1, 1,
-0.1041594, -0.01252224, -2.765168, 1, 1, 1, 1, 1,
-0.09503619, -0.6123657, -2.638276, 1, 1, 1, 1, 1,
-0.09492238, 0.7675728, -2.203084, 1, 1, 1, 1, 1,
-0.09464319, 0.2311238, -0.3274413, 1, 1, 1, 1, 1,
-0.0914246, -0.9920677, -5.421557, 1, 1, 1, 1, 1,
-0.09133364, 0.3130164, 1.58976, 1, 1, 1, 1, 1,
-0.09129758, 1.62536, 0.4181122, 1, 1, 1, 1, 1,
-0.08767336, -0.7554958, -1.686424, 1, 1, 1, 1, 1,
-0.08182214, -0.39539, -1.944719, 0, 0, 1, 1, 1,
-0.08162321, -0.8138717, -2.611563, 1, 0, 0, 1, 1,
-0.0783366, 0.9855502, -1.435747, 1, 0, 0, 1, 1,
-0.07282791, -0.1982253, -2.956055, 1, 0, 0, 1, 1,
-0.07163445, -0.3163923, -2.608361, 1, 0, 0, 1, 1,
-0.07141907, -0.8827924, -3.396622, 1, 0, 0, 1, 1,
-0.06974948, -0.0193001, 0.4332484, 0, 0, 0, 1, 1,
-0.06504228, -0.2678658, -4.411305, 0, 0, 0, 1, 1,
-0.06481191, 0.7422236, -0.612595, 0, 0, 0, 1, 1,
-0.06289852, 0.7527183, -0.5048683, 0, 0, 0, 1, 1,
-0.05617479, -1.22558, -3.651629, 0, 0, 0, 1, 1,
-0.05274358, -1.668588, -3.068804, 0, 0, 0, 1, 1,
-0.05133851, -1.494149, -3.454815, 0, 0, 0, 1, 1,
-0.05119801, 0.9866957, -2.026721, 1, 1, 1, 1, 1,
-0.04864878, -2.021089, -0.5024348, 1, 1, 1, 1, 1,
-0.04648669, 1.813955, 0.6624057, 1, 1, 1, 1, 1,
-0.04340596, -0.1802113, -2.211436, 1, 1, 1, 1, 1,
-0.04141576, -0.2933046, -4.0188, 1, 1, 1, 1, 1,
-0.04089247, -0.4469098, -1.182396, 1, 1, 1, 1, 1,
-0.03942059, 0.601266, 0.4870023, 1, 1, 1, 1, 1,
-0.03504954, 1.920536, -0.9967166, 1, 1, 1, 1, 1,
-0.02624878, -0.08753562, -3.101282, 1, 1, 1, 1, 1,
-0.0219739, -0.3122797, -3.094468, 1, 1, 1, 1, 1,
-0.02160227, -1.134668, -2.302868, 1, 1, 1, 1, 1,
-0.02114249, -0.1224089, -2.409568, 1, 1, 1, 1, 1,
-0.02094564, 0.05146924, -1.914442, 1, 1, 1, 1, 1,
-0.0195962, 0.7329971, 0.04683314, 1, 1, 1, 1, 1,
-0.01637344, 0.1250324, -0.3640985, 1, 1, 1, 1, 1,
-0.01631035, 0.1414756, -1.438638, 0, 0, 1, 1, 1,
-0.01562479, 1.342499, 0.9839016, 1, 0, 0, 1, 1,
-0.004901897, -0.3823932, -2.268004, 1, 0, 0, 1, 1,
-2.443801e-05, -0.6211404, -4.29669, 1, 0, 0, 1, 1,
0.0006623404, -2.014715, 0.832087, 1, 0, 0, 1, 1,
0.001736185, 0.6360693, -0.6819776, 1, 0, 0, 1, 1,
0.003727799, 1.080664, -1.98684, 0, 0, 0, 1, 1,
0.01616103, -2.215278, 2.25918, 0, 0, 0, 1, 1,
0.01771903, 0.06928568, 1.075023, 0, 0, 0, 1, 1,
0.01940717, -1.190764, 3.32724, 0, 0, 0, 1, 1,
0.02044109, -0.3792738, 3.10067, 0, 0, 0, 1, 1,
0.02321185, 0.6848037, -0.3388103, 0, 0, 0, 1, 1,
0.03450462, 1.671679, 1.207571, 0, 0, 0, 1, 1,
0.03535993, -1.293344, 3.223188, 1, 1, 1, 1, 1,
0.03614435, 0.8839432, 1.230248, 1, 1, 1, 1, 1,
0.03765605, -0.8556059, 3.005713, 1, 1, 1, 1, 1,
0.03968693, -0.1896173, 1.313113, 1, 1, 1, 1, 1,
0.04127456, -0.4537757, 2.472233, 1, 1, 1, 1, 1,
0.04348956, -0.9334223, 3.728315, 1, 1, 1, 1, 1,
0.04528005, -0.07251787, 3.077255, 1, 1, 1, 1, 1,
0.04860331, 0.5110911, -1.657887, 1, 1, 1, 1, 1,
0.0554867, 1.149886, 2.04, 1, 1, 1, 1, 1,
0.06092085, 1.999183, 0.291371, 1, 1, 1, 1, 1,
0.06186271, 0.5211007, 0.4065025, 1, 1, 1, 1, 1,
0.06325059, 1.992721, 0.154994, 1, 1, 1, 1, 1,
0.06571709, -1.655663, 3.883773, 1, 1, 1, 1, 1,
0.06700312, -0.686734, 2.861577, 1, 1, 1, 1, 1,
0.06853801, -0.593436, 3.332118, 1, 1, 1, 1, 1,
0.06855451, 0.4876529, 0.4401254, 0, 0, 1, 1, 1,
0.07091482, 0.8240026, -0.6063988, 1, 0, 0, 1, 1,
0.07802199, 0.1943379, -0.1605641, 1, 0, 0, 1, 1,
0.08089481, -0.8840897, 2.618792, 1, 0, 0, 1, 1,
0.08115444, -0.1044717, 3.899026, 1, 0, 0, 1, 1,
0.08238303, -0.06700458, 0.05933354, 1, 0, 0, 1, 1,
0.08550274, -0.3037613, 3.235331, 0, 0, 0, 1, 1,
0.09169254, -1.289218, 2.38146, 0, 0, 0, 1, 1,
0.09235644, -0.1614915, 2.661693, 0, 0, 0, 1, 1,
0.09270219, -0.1046935, 2.513425, 0, 0, 0, 1, 1,
0.0934637, 0.5893138, 0.4900737, 0, 0, 0, 1, 1,
0.09570371, -1.422554, 3.118318, 0, 0, 0, 1, 1,
0.09975793, -0.2741214, 3.135447, 0, 0, 0, 1, 1,
0.1034091, -0.8088943, 2.014262, 1, 1, 1, 1, 1,
0.1081539, -1.372972, 3.24824, 1, 1, 1, 1, 1,
0.1123748, 0.9579168, -0.5293934, 1, 1, 1, 1, 1,
0.1134173, -1.030599, 1.886648, 1, 1, 1, 1, 1,
0.1145666, -0.3080457, 3.128546, 1, 1, 1, 1, 1,
0.1168969, 0.8491904, -0.2256145, 1, 1, 1, 1, 1,
0.1175504, 1.018532, 0.703765, 1, 1, 1, 1, 1,
0.1177386, -0.9919791, 2.387954, 1, 1, 1, 1, 1,
0.1188831, -0.3924272, 2.647313, 1, 1, 1, 1, 1,
0.1202307, -0.330123, 2.147147, 1, 1, 1, 1, 1,
0.1208648, 0.3126617, -0.7195896, 1, 1, 1, 1, 1,
0.123588, -0.8307362, 1.09132, 1, 1, 1, 1, 1,
0.1246401, -0.3767615, 3.523772, 1, 1, 1, 1, 1,
0.1284703, 1.335124, -0.2261701, 1, 1, 1, 1, 1,
0.1286452, -1.285942, 5.898384, 1, 1, 1, 1, 1,
0.1287483, -0.5400422, 4.260801, 0, 0, 1, 1, 1,
0.133856, -1.201788, 1.605721, 1, 0, 0, 1, 1,
0.1355326, -1.42452, 2.843548, 1, 0, 0, 1, 1,
0.1382831, 0.7362294, -0.8160225, 1, 0, 0, 1, 1,
0.1385081, -0.5615962, 3.948132, 1, 0, 0, 1, 1,
0.1432837, 1.070801, 2.468823, 1, 0, 0, 1, 1,
0.1468605, 1.320606, -0.4790644, 0, 0, 0, 1, 1,
0.151607, -0.1964346, 2.291682, 0, 0, 0, 1, 1,
0.1548001, -0.06813192, 1.662059, 0, 0, 0, 1, 1,
0.1589222, -0.4866714, 1.416325, 0, 0, 0, 1, 1,
0.1607883, -0.454792, 1.583565, 0, 0, 0, 1, 1,
0.1623103, 1.865819, 0.4574986, 0, 0, 0, 1, 1,
0.1706247, 0.778096, 0.05801815, 0, 0, 0, 1, 1,
0.1710681, -1.238247, 4.329021, 1, 1, 1, 1, 1,
0.1718031, -0.2468656, 2.68657, 1, 1, 1, 1, 1,
0.1762034, 0.6618534, -0.4696584, 1, 1, 1, 1, 1,
0.1808828, -0.1586239, 2.108922, 1, 1, 1, 1, 1,
0.1818238, 0.2903712, 0.7761639, 1, 1, 1, 1, 1,
0.1851188, 0.2509838, 0.5145708, 1, 1, 1, 1, 1,
0.1898017, 0.7824147, 1.12222, 1, 1, 1, 1, 1,
0.1922989, -1.257417, 2.939945, 1, 1, 1, 1, 1,
0.1933765, -0.446256, 2.458522, 1, 1, 1, 1, 1,
0.1941808, -0.3143874, 3.313256, 1, 1, 1, 1, 1,
0.1956123, -0.2052109, 1.015487, 1, 1, 1, 1, 1,
0.200531, 0.1737556, 0.1333058, 1, 1, 1, 1, 1,
0.2030698, -0.7010496, 3.363859, 1, 1, 1, 1, 1,
0.2089593, 1.792071, 0.5055303, 1, 1, 1, 1, 1,
0.2108374, -2.30089, 3.821063, 1, 1, 1, 1, 1,
0.2109473, 0.2683878, 1.668326, 0, 0, 1, 1, 1,
0.2126128, 0.8957372, 1.05572, 1, 0, 0, 1, 1,
0.2134326, -0.7398447, 4.006136, 1, 0, 0, 1, 1,
0.2134931, -0.7456945, 2.814912, 1, 0, 0, 1, 1,
0.2163768, -0.3064084, 1.303145, 1, 0, 0, 1, 1,
0.2189069, 0.6723316, -0.1731326, 1, 0, 0, 1, 1,
0.2319102, -1.516664, 3.088437, 0, 0, 0, 1, 1,
0.2333366, -0.1019713, 1.732434, 0, 0, 0, 1, 1,
0.2345197, -0.2242636, 3.340526, 0, 0, 0, 1, 1,
0.2389103, -1.414389, 1.281688, 0, 0, 0, 1, 1,
0.2418578, -0.4329434, 2.015609, 0, 0, 0, 1, 1,
0.2430665, -0.4378661, 3.929514, 0, 0, 0, 1, 1,
0.2432316, 0.997476, 1.007705, 0, 0, 0, 1, 1,
0.2442014, -1.319537, 3.917639, 1, 1, 1, 1, 1,
0.2509586, -0.3545372, 3.464938, 1, 1, 1, 1, 1,
0.2541054, -0.6601365, 3.869685, 1, 1, 1, 1, 1,
0.2572456, -1.467778, 1.787738, 1, 1, 1, 1, 1,
0.2593982, 0.6032509, -0.1810196, 1, 1, 1, 1, 1,
0.2609673, -1.488641, 2.624552, 1, 1, 1, 1, 1,
0.2621723, 1.158615, -1.735901, 1, 1, 1, 1, 1,
0.262673, 0.1340599, 2.859969, 1, 1, 1, 1, 1,
0.266439, -0.7301141, 2.336895, 1, 1, 1, 1, 1,
0.2665265, 0.620584, 0.2697997, 1, 1, 1, 1, 1,
0.2736132, -1.05708, 1.369262, 1, 1, 1, 1, 1,
0.2768089, -0.9060454, 2.313278, 1, 1, 1, 1, 1,
0.277466, -0.8772677, 3.578547, 1, 1, 1, 1, 1,
0.2799642, 0.9707574, 0.9898817, 1, 1, 1, 1, 1,
0.2813735, -0.3978881, 1.926345, 1, 1, 1, 1, 1,
0.2833425, -0.6735272, 3.290819, 0, 0, 1, 1, 1,
0.2834189, -0.07737525, 1.569728, 1, 0, 0, 1, 1,
0.2864742, 1.114763, 0.2635752, 1, 0, 0, 1, 1,
0.2871655, -0.1867274, 2.292143, 1, 0, 0, 1, 1,
0.2886159, 0.1711802, 1.560626, 1, 0, 0, 1, 1,
0.295281, -0.7915854, 3.361992, 1, 0, 0, 1, 1,
0.2953458, -0.9306591, 4.090079, 0, 0, 0, 1, 1,
0.2962906, -1.370694, 4.026402, 0, 0, 0, 1, 1,
0.2977767, 1.084849, 1.104807, 0, 0, 0, 1, 1,
0.3009758, 0.5965203, -0.1120168, 0, 0, 0, 1, 1,
0.3041991, 0.07064883, 1.472305, 0, 0, 0, 1, 1,
0.3044273, -0.04001949, 2.902655, 0, 0, 0, 1, 1,
0.304579, 0.3732753, -0.004769263, 0, 0, 0, 1, 1,
0.3049362, -1.2509, 3.627991, 1, 1, 1, 1, 1,
0.306062, -0.9817153, 3.974379, 1, 1, 1, 1, 1,
0.3066535, -1.330522, 3.688437, 1, 1, 1, 1, 1,
0.3070194, -0.4550964, 3.645081, 1, 1, 1, 1, 1,
0.3092713, 0.1785701, 1.445013, 1, 1, 1, 1, 1,
0.3117194, -0.3136656, 1.482974, 1, 1, 1, 1, 1,
0.3158315, -1.772123, 3.809592, 1, 1, 1, 1, 1,
0.320103, -2.176162, 3.709266, 1, 1, 1, 1, 1,
0.3205869, 1.06441, 0.2965052, 1, 1, 1, 1, 1,
0.3287734, -0.92505, 2.24072, 1, 1, 1, 1, 1,
0.3292192, -0.6015939, 2.539132, 1, 1, 1, 1, 1,
0.3333702, 0.8065574, 0.174357, 1, 1, 1, 1, 1,
0.3339036, -1.45918, 3.58088, 1, 1, 1, 1, 1,
0.3383163, -1.416663, 1.587369, 1, 1, 1, 1, 1,
0.3392176, 0.0112713, 3.287036, 1, 1, 1, 1, 1,
0.3407996, 0.2357544, 1.825277, 0, 0, 1, 1, 1,
0.3419979, -0.9795578, 4.408211, 1, 0, 0, 1, 1,
0.3420782, 1.348885, -0.9637662, 1, 0, 0, 1, 1,
0.3444448, 0.5032699, 1.847766, 1, 0, 0, 1, 1,
0.3483467, 0.7204726, 2.353244, 1, 0, 0, 1, 1,
0.3500676, 0.8671045, -0.0835519, 1, 0, 0, 1, 1,
0.3511301, 0.08029062, 0.6951488, 0, 0, 0, 1, 1,
0.3547386, -0.5229384, 2.974419, 0, 0, 0, 1, 1,
0.3573624, -0.7578589, 2.307708, 0, 0, 0, 1, 1,
0.3575606, -0.02755119, 1.446093, 0, 0, 0, 1, 1,
0.3579622, 1.175658, -1.060328, 0, 0, 0, 1, 1,
0.3579789, -1.540096, 4.641021, 0, 0, 0, 1, 1,
0.3613309, 1.165839, 0.9528171, 0, 0, 0, 1, 1,
0.3614594, -1.186383, 2.9059, 1, 1, 1, 1, 1,
0.3683395, 0.1230907, 0.6627305, 1, 1, 1, 1, 1,
0.3822956, -0.4035417, 1.443444, 1, 1, 1, 1, 1,
0.3856593, 0.6504895, -0.9243317, 1, 1, 1, 1, 1,
0.3856684, -0.7505593, 2.333568, 1, 1, 1, 1, 1,
0.3859014, -1.157451, 2.800703, 1, 1, 1, 1, 1,
0.3861591, 0.634653, 0.2838324, 1, 1, 1, 1, 1,
0.3877552, 0.06249349, -0.330378, 1, 1, 1, 1, 1,
0.3908423, -0.9507343, 2.504127, 1, 1, 1, 1, 1,
0.3920627, -0.3918985, 0.4666966, 1, 1, 1, 1, 1,
0.3953974, 0.9321328, 0.2106787, 1, 1, 1, 1, 1,
0.3969265, 1.017391, 1.228546, 1, 1, 1, 1, 1,
0.3999673, 0.6731202, -0.4510318, 1, 1, 1, 1, 1,
0.4065905, 1.425026, -1.722479, 1, 1, 1, 1, 1,
0.4072235, 0.01078472, 3.768515, 1, 1, 1, 1, 1,
0.4094051, -0.8832776, 4.972678, 0, 0, 1, 1, 1,
0.4143314, 0.9574866, -0.0847788, 1, 0, 0, 1, 1,
0.4154265, 1.684312, -1.53062, 1, 0, 0, 1, 1,
0.421609, 1.028125, -0.3140903, 1, 0, 0, 1, 1,
0.4247729, 0.2915256, 1.781851, 1, 0, 0, 1, 1,
0.4297711, -1.131655, 3.192127, 1, 0, 0, 1, 1,
0.4303769, -0.5869324, 3.591351, 0, 0, 0, 1, 1,
0.4322445, 0.9566815, -0.3621893, 0, 0, 0, 1, 1,
0.4377768, 0.5092298, 0.8551731, 0, 0, 0, 1, 1,
0.4415178, 0.7452087, -0.2291808, 0, 0, 0, 1, 1,
0.4452582, 1.99045, 0.3898881, 0, 0, 0, 1, 1,
0.445484, 0.2393767, -1.028752, 0, 0, 0, 1, 1,
0.4457214, -1.815455, 2.590068, 0, 0, 0, 1, 1,
0.4478357, 0.3207723, -0.5442868, 1, 1, 1, 1, 1,
0.4513648, -0.4299857, 1.492255, 1, 1, 1, 1, 1,
0.4543559, -1.608588, 2.348444, 1, 1, 1, 1, 1,
0.4546255, 0.4649114, -0.5528524, 1, 1, 1, 1, 1,
0.4552599, 2.403172, -0.1086579, 1, 1, 1, 1, 1,
0.4576915, 0.6843378, 0.4456604, 1, 1, 1, 1, 1,
0.4588555, -0.01206751, 2.877397, 1, 1, 1, 1, 1,
0.4636352, 0.8213412, 0.2318236, 1, 1, 1, 1, 1,
0.4640451, -0.5062032, 0.5305642, 1, 1, 1, 1, 1,
0.4645144, -2.266046, 1.570408, 1, 1, 1, 1, 1,
0.469113, 0.12017, 1.431575, 1, 1, 1, 1, 1,
0.4725329, -0.7114194, 2.82837, 1, 1, 1, 1, 1,
0.4733377, -1.44677, 1.424577, 1, 1, 1, 1, 1,
0.4741314, -0.730432, 2.378006, 1, 1, 1, 1, 1,
0.4754531, -0.5681708, 2.789287, 1, 1, 1, 1, 1,
0.4806438, -0.1933798, 1.738036, 0, 0, 1, 1, 1,
0.4811876, -1.711823, 1.774308, 1, 0, 0, 1, 1,
0.4841163, 1.895533, -0.6336272, 1, 0, 0, 1, 1,
0.4851903, -0.1617936, 2.250389, 1, 0, 0, 1, 1,
0.4867556, -0.2445293, 1.649369, 1, 0, 0, 1, 1,
0.4921693, 0.796287, 1.107832, 1, 0, 0, 1, 1,
0.4979026, -2.11351, 2.166591, 0, 0, 0, 1, 1,
0.5013741, 2.675625, -0.3024216, 0, 0, 0, 1, 1,
0.503344, -0.9517926, 1.859466, 0, 0, 0, 1, 1,
0.5041634, 0.4926985, 0.297832, 0, 0, 0, 1, 1,
0.5056472, 0.75102, -0.5625643, 0, 0, 0, 1, 1,
0.506305, -2.427716, 1.919578, 0, 0, 0, 1, 1,
0.506837, -0.8508015, 3.428127, 0, 0, 0, 1, 1,
0.5099037, -0.2447709, 1.567649, 1, 1, 1, 1, 1,
0.5100867, -1.230294, 1.526001, 1, 1, 1, 1, 1,
0.5105029, 0.4299402, -0.06961397, 1, 1, 1, 1, 1,
0.5195516, 0.219364, 1.488473, 1, 1, 1, 1, 1,
0.5200041, 1.575034, 1.290872, 1, 1, 1, 1, 1,
0.5217101, -2.955855, 2.410334, 1, 1, 1, 1, 1,
0.5271553, -0.5570811, 2.010955, 1, 1, 1, 1, 1,
0.5292288, 1.864738, -0.6900736, 1, 1, 1, 1, 1,
0.5370674, -1.496445, 1.580403, 1, 1, 1, 1, 1,
0.5389515, 0.4530604, 2.356308, 1, 1, 1, 1, 1,
0.5398645, -1.138104, 2.775261, 1, 1, 1, 1, 1,
0.5415615, -1.108086, 4.077888, 1, 1, 1, 1, 1,
0.541908, 0.608655, 1.650169, 1, 1, 1, 1, 1,
0.5427253, 0.9169619, -0.5894136, 1, 1, 1, 1, 1,
0.5452693, -0.1110879, 1.250511, 1, 1, 1, 1, 1,
0.5502883, 1.053344, -2.120189, 0, 0, 1, 1, 1,
0.5582861, -1.512624, 2.197268, 1, 0, 0, 1, 1,
0.5620315, 0.9899142, 0.1537317, 1, 0, 0, 1, 1,
0.570639, 0.3359237, -0.2760792, 1, 0, 0, 1, 1,
0.5724533, 1.292868, 0.02326013, 1, 0, 0, 1, 1,
0.5726328, -0.9052158, 2.995045, 1, 0, 0, 1, 1,
0.5747129, -0.230348, 2.224152, 0, 0, 0, 1, 1,
0.5747454, -0.498804, 0.6525452, 0, 0, 0, 1, 1,
0.5757794, -1.919541, 1.837325, 0, 0, 0, 1, 1,
0.5836465, -0.6430398, 2.090278, 0, 0, 0, 1, 1,
0.5842733, -1.092209, 4.025144, 0, 0, 0, 1, 1,
0.588158, -0.3711568, 1.653391, 0, 0, 0, 1, 1,
0.5899912, 1.422306, 0.6019901, 0, 0, 0, 1, 1,
0.5946898, -0.389232, 1.406536, 1, 1, 1, 1, 1,
0.5950922, 0.8539802, -1.003577, 1, 1, 1, 1, 1,
0.5950958, -0.4341379, 1.410224, 1, 1, 1, 1, 1,
0.5984679, -0.9231237, 2.004149, 1, 1, 1, 1, 1,
0.5990754, 0.8515577, 0.1562373, 1, 1, 1, 1, 1,
0.6016162, -0.255608, 1.147942, 1, 1, 1, 1, 1,
0.6074101, -0.3431989, 1.432295, 1, 1, 1, 1, 1,
0.6079141, -0.5176029, 0.904372, 1, 1, 1, 1, 1,
0.6090369, 2.116872, 0.9120728, 1, 1, 1, 1, 1,
0.620361, -0.06621922, 1.877323, 1, 1, 1, 1, 1,
0.6262617, 1.309896, -0.2215063, 1, 1, 1, 1, 1,
0.627269, 1.410301, 0.601397, 1, 1, 1, 1, 1,
0.6325839, 0.2702863, 0.1423547, 1, 1, 1, 1, 1,
0.6354225, -0.4786342, 2.799728, 1, 1, 1, 1, 1,
0.6377739, 0.6689879, 1.111199, 1, 1, 1, 1, 1,
0.6445881, 1.899445, 0.4750205, 0, 0, 1, 1, 1,
0.6524061, -0.9154229, 1.465394, 1, 0, 0, 1, 1,
0.6528615, -0.902438, 2.523878, 1, 0, 0, 1, 1,
0.6600863, 0.3544054, 0.1666166, 1, 0, 0, 1, 1,
0.6669311, 0.2910678, -0.2626187, 1, 0, 0, 1, 1,
0.6681749, 0.170369, 0.1764908, 1, 0, 0, 1, 1,
0.6711782, 0.53468, 2.091887, 0, 0, 0, 1, 1,
0.6725794, -0.2060558, 2.257623, 0, 0, 0, 1, 1,
0.6735904, 0.3880428, 0.2711963, 0, 0, 0, 1, 1,
0.6771364, 0.133583, 0.5598313, 0, 0, 0, 1, 1,
0.6783375, -0.2959562, 1.836241, 0, 0, 0, 1, 1,
0.6793137, 1.301069, -0.6372978, 0, 0, 0, 1, 1,
0.6827701, -0.5013142, 3.08639, 0, 0, 0, 1, 1,
0.6862771, 0.1721762, 1.611095, 1, 1, 1, 1, 1,
0.6869074, -1.847735, 2.813686, 1, 1, 1, 1, 1,
0.6930444, -0.35105, 1.37483, 1, 1, 1, 1, 1,
0.6987099, 1.013202, 0.3888028, 1, 1, 1, 1, 1,
0.7032019, -0.8134542, 4.142758, 1, 1, 1, 1, 1,
0.7098421, -1.599429, 3.553302, 1, 1, 1, 1, 1,
0.7251735, -0.1343691, 2.959933, 1, 1, 1, 1, 1,
0.7260489, 0.6859829, -0.6060047, 1, 1, 1, 1, 1,
0.7267922, 1.435678, 1.75894, 1, 1, 1, 1, 1,
0.734516, 1.365689, 1.541499, 1, 1, 1, 1, 1,
0.7365849, 0.5368857, 0.8003995, 1, 1, 1, 1, 1,
0.7448914, 1.742741, 0.1733324, 1, 1, 1, 1, 1,
0.7461244, 0.7753009, 1.16766, 1, 1, 1, 1, 1,
0.7525973, 0.2693883, 0.5340024, 1, 1, 1, 1, 1,
0.7602209, 0.1395933, 2.164268, 1, 1, 1, 1, 1,
0.7649003, -1.267377, 2.881511, 0, 0, 1, 1, 1,
0.7695476, 0.8739257, 1.704065, 1, 0, 0, 1, 1,
0.7696818, -1.887641, 3.259996, 1, 0, 0, 1, 1,
0.7748013, -0.01272003, -0.2973138, 1, 0, 0, 1, 1,
0.7754006, 0.6690981, 0.1206084, 1, 0, 0, 1, 1,
0.7820832, -1.200016, 1.975273, 1, 0, 0, 1, 1,
0.7831882, 0.2845867, 2.153447, 0, 0, 0, 1, 1,
0.7931403, -1.236375, 2.429073, 0, 0, 0, 1, 1,
0.7981361, 0.3018635, 0.878256, 0, 0, 0, 1, 1,
0.7984039, 0.2929546, 1.549188, 0, 0, 0, 1, 1,
0.8019188, -1.888356, 2.605305, 0, 0, 0, 1, 1,
0.8123235, 0.421162, 1.283368, 0, 0, 0, 1, 1,
0.8139229, -1.119959, 3.382951, 0, 0, 0, 1, 1,
0.8151025, -0.4202379, 3.405354, 1, 1, 1, 1, 1,
0.8157086, -0.7072375, -0.238119, 1, 1, 1, 1, 1,
0.8170806, -1.265167, 0.7848924, 1, 1, 1, 1, 1,
0.8217556, -2.096791, 3.65555, 1, 1, 1, 1, 1,
0.8313123, 0.3649613, 0.5686296, 1, 1, 1, 1, 1,
0.8317774, -1.694864, 1.106944, 1, 1, 1, 1, 1,
0.8363523, -0.7127517, 2.667409, 1, 1, 1, 1, 1,
0.8365633, -0.3720784, 2.560945, 1, 1, 1, 1, 1,
0.8408259, -1.192488, 1.677985, 1, 1, 1, 1, 1,
0.8506977, 0.9024649, 2.989018, 1, 1, 1, 1, 1,
0.8570565, -1.698303, 3.373361, 1, 1, 1, 1, 1,
0.8651985, 0.3216857, 1.594477, 1, 1, 1, 1, 1,
0.8656364, 1.359086, 1.913369, 1, 1, 1, 1, 1,
0.8684793, 0.1058802, 2.250257, 1, 1, 1, 1, 1,
0.870487, -0.4388978, 1.988201, 1, 1, 1, 1, 1,
0.8710252, 1.086499, 1.033671, 0, 0, 1, 1, 1,
0.8765613, 0.8232535, 2.217295, 1, 0, 0, 1, 1,
0.8804428, 0.4202661, 1.78341, 1, 0, 0, 1, 1,
0.8820072, -0.839878, 1.945106, 1, 0, 0, 1, 1,
0.8884418, -0.4930224, 0.1784493, 1, 0, 0, 1, 1,
0.8899734, 0.7238631, 0.3804689, 1, 0, 0, 1, 1,
0.8952615, 1.090523, 2.001012, 0, 0, 0, 1, 1,
0.9063716, -0.6529016, 3.026596, 0, 0, 0, 1, 1,
0.9183663, -0.09477221, 0.2709821, 0, 0, 0, 1, 1,
0.929557, -0.2281743, 1.586066, 0, 0, 0, 1, 1,
0.9323491, -0.2892708, 1.615799, 0, 0, 0, 1, 1,
0.9351188, 0.8437866, 1.080801, 0, 0, 0, 1, 1,
0.9433784, 2.131434, 0.6449165, 0, 0, 0, 1, 1,
0.945901, -0.2653618, 0.3523467, 1, 1, 1, 1, 1,
0.95292, 0.6372946, -0.8730986, 1, 1, 1, 1, 1,
0.953655, 0.04032703, 0.3648434, 1, 1, 1, 1, 1,
0.9626145, 0.6079798, 0.1426668, 1, 1, 1, 1, 1,
0.9638408, 1.791446, 1.844414, 1, 1, 1, 1, 1,
0.9643137, -0.6979508, 3.925253, 1, 1, 1, 1, 1,
0.9658812, -1.392257, 3.076443, 1, 1, 1, 1, 1,
0.9709473, -0.735622, 1.34173, 1, 1, 1, 1, 1,
0.9746056, -1.420868, 4.04094, 1, 1, 1, 1, 1,
0.9788392, -0.5832278, 2.712544, 1, 1, 1, 1, 1,
0.9907898, 0.1497255, 1.858515, 1, 1, 1, 1, 1,
0.9915217, 0.04674185, 0.8610429, 1, 1, 1, 1, 1,
1.005588, -1.025636, 1.405435, 1, 1, 1, 1, 1,
1.012916, -1.85459, 2.658427, 1, 1, 1, 1, 1,
1.016726, -1.320677, 1.197421, 1, 1, 1, 1, 1,
1.021434, 0.1398532, 2.626327, 0, 0, 1, 1, 1,
1.022986, 0.3446313, 0.602605, 1, 0, 0, 1, 1,
1.025053, -0.9323905, 3.104224, 1, 0, 0, 1, 1,
1.026168, -0.4062742, 2.641345, 1, 0, 0, 1, 1,
1.029685, -0.6521601, 2.927281, 1, 0, 0, 1, 1,
1.029875, 1.358983, -0.9850523, 1, 0, 0, 1, 1,
1.035106, -0.6215041, 2.166962, 0, 0, 0, 1, 1,
1.042341, -0.5026723, 1.270052, 0, 0, 0, 1, 1,
1.044568, 0.8407231, 0.9551084, 0, 0, 0, 1, 1,
1.047466, 0.9505336, 0.8648916, 0, 0, 0, 1, 1,
1.049895, -1.827654, 3.77443, 0, 0, 0, 1, 1,
1.062697, -0.3753995, 2.36665, 0, 0, 0, 1, 1,
1.06354, -0.9843918, 3.612172, 0, 0, 0, 1, 1,
1.073998, -0.2214872, 1.182857, 1, 1, 1, 1, 1,
1.085515, 0.2156695, 2.287173, 1, 1, 1, 1, 1,
1.09504, 0.4393091, -0.07113086, 1, 1, 1, 1, 1,
1.096252, -1.659136, 2.949768, 1, 1, 1, 1, 1,
1.100915, -0.05356404, 3.47941, 1, 1, 1, 1, 1,
1.107572, -0.1422763, 2.070854, 1, 1, 1, 1, 1,
1.122709, 0.8726496, 1.523703, 1, 1, 1, 1, 1,
1.123969, 0.9943562, 1.532259, 1, 1, 1, 1, 1,
1.124639, -0.00495907, 2.125781, 1, 1, 1, 1, 1,
1.129704, 0.7953291, 1.506324, 1, 1, 1, 1, 1,
1.132568, -1.093039, 1.494886, 1, 1, 1, 1, 1,
1.132696, -0.1808856, 1.47706, 1, 1, 1, 1, 1,
1.138191, -0.6748278, 2.104803, 1, 1, 1, 1, 1,
1.141224, 0.7778728, -0.3232938, 1, 1, 1, 1, 1,
1.14601, 0.2869664, 1.273533, 1, 1, 1, 1, 1,
1.146224, -0.1256582, 2.027743, 0, 0, 1, 1, 1,
1.150224, -2.913955, 1.671372, 1, 0, 0, 1, 1,
1.153253, 0.5460677, 0.6026219, 1, 0, 0, 1, 1,
1.153487, -0.1833966, 1.517865, 1, 0, 0, 1, 1,
1.158585, -0.1299506, 1.625636, 1, 0, 0, 1, 1,
1.161276, -0.8061457, 2.623549, 1, 0, 0, 1, 1,
1.171143, 2.356716, 3.065175, 0, 0, 0, 1, 1,
1.174883, 1.483227, 1.604159, 0, 0, 0, 1, 1,
1.175279, -1.443624, 3.639897, 0, 0, 0, 1, 1,
1.180952, -1.636269, 2.251992, 0, 0, 0, 1, 1,
1.191953, -0.1462204, 1.814188, 0, 0, 0, 1, 1,
1.198304, 0.47985, -0.7220185, 0, 0, 0, 1, 1,
1.210145, -0.4686114, 1.410264, 0, 0, 0, 1, 1,
1.214379, -0.4201688, 2.954329, 1, 1, 1, 1, 1,
1.218424, -1.487186, 2.327104, 1, 1, 1, 1, 1,
1.245363, -1.026755, 2.734416, 1, 1, 1, 1, 1,
1.256423, -0.4297106, 3.655354, 1, 1, 1, 1, 1,
1.258327, -0.3308433, 2.280436, 1, 1, 1, 1, 1,
1.27043, 1.523584, 1.364254, 1, 1, 1, 1, 1,
1.270694, 1.930721, -0.1136748, 1, 1, 1, 1, 1,
1.271695, -0.9337841, 1.935636, 1, 1, 1, 1, 1,
1.282129, -1.730682, 3.917396, 1, 1, 1, 1, 1,
1.28226, 0.1803546, 0.08032108, 1, 1, 1, 1, 1,
1.285598, -0.8332059, 0.621502, 1, 1, 1, 1, 1,
1.299328, -0.4620609, 2.726095, 1, 1, 1, 1, 1,
1.307047, -0.7790136, 2.609811, 1, 1, 1, 1, 1,
1.310185, 0.04903362, 1.406145, 1, 1, 1, 1, 1,
1.312743, -0.6660676, 2.556024, 1, 1, 1, 1, 1,
1.314201, 2.157069, -1.025541, 0, 0, 1, 1, 1,
1.320512, -1.583125, 1.878785, 1, 0, 0, 1, 1,
1.322303, -0.08031847, -0.07605284, 1, 0, 0, 1, 1,
1.326539, -0.1517806, 2.849377, 1, 0, 0, 1, 1,
1.327803, -1.050967, 0.873325, 1, 0, 0, 1, 1,
1.335828, -0.0001593898, 1.038574, 1, 0, 0, 1, 1,
1.345881, 0.01179925, 1.589685, 0, 0, 0, 1, 1,
1.346494, 0.07736519, 0.01553705, 0, 0, 0, 1, 1,
1.358813, -0.5142764, 0.8366238, 0, 0, 0, 1, 1,
1.363311, 0.2340286, -0.7343184, 0, 0, 0, 1, 1,
1.380995, 0.1720708, -0.4389785, 0, 0, 0, 1, 1,
1.39974, -1.201722, 1.988682, 0, 0, 0, 1, 1,
1.405782, 0.6038443, 1.033583, 0, 0, 0, 1, 1,
1.405933, -0.7267287, 2.861023, 1, 1, 1, 1, 1,
1.420852, -0.4060757, 3.056304, 1, 1, 1, 1, 1,
1.421193, 0.09398337, 1.288346, 1, 1, 1, 1, 1,
1.425175, -0.2894294, 1.479884, 1, 1, 1, 1, 1,
1.429639, 1.078059, 0.005888999, 1, 1, 1, 1, 1,
1.431036, -0.4879903, 2.067976, 1, 1, 1, 1, 1,
1.432425, 1.812795, 1.189085, 1, 1, 1, 1, 1,
1.433606, -0.6032577, 2.357226, 1, 1, 1, 1, 1,
1.445175, 1.841044, 0.5241791, 1, 1, 1, 1, 1,
1.446117, -0.5706957, 2.135982, 1, 1, 1, 1, 1,
1.450077, -1.449457, 1.362033, 1, 1, 1, 1, 1,
1.454207, 0.1431848, 1.444272, 1, 1, 1, 1, 1,
1.454457, -1.872009, 2.704161, 1, 1, 1, 1, 1,
1.462988, -2.011373, 3.429137, 1, 1, 1, 1, 1,
1.47132, -0.6183515, 1.54758, 1, 1, 1, 1, 1,
1.480697, 0.3818256, -0.499838, 0, 0, 1, 1, 1,
1.487885, 0.07810293, 1.952755, 1, 0, 0, 1, 1,
1.489014, -0.690472, 2.227726, 1, 0, 0, 1, 1,
1.493683, 0.5973619, 1.305657, 1, 0, 0, 1, 1,
1.50373, 0.7656716, 0.7055395, 1, 0, 0, 1, 1,
1.506323, -0.9171638, 1.173922, 1, 0, 0, 1, 1,
1.506596, 0.5600977, 2.639726, 0, 0, 0, 1, 1,
1.508657, 0.04730798, 2.079197, 0, 0, 0, 1, 1,
1.51169, -0.3144928, 2.559562, 0, 0, 0, 1, 1,
1.522035, 0.5968959, 1.254616, 0, 0, 0, 1, 1,
1.524607, -1.04592, 2.145834, 0, 0, 0, 1, 1,
1.532783, 0.2725134, 2.812598, 0, 0, 0, 1, 1,
1.542388, 0.4042968, 0.6248851, 0, 0, 0, 1, 1,
1.542567, 0.5561478, 1.893973, 1, 1, 1, 1, 1,
1.543267, 0.7889037, -1.129815, 1, 1, 1, 1, 1,
1.55048, -0.2570762, 1.117072, 1, 1, 1, 1, 1,
1.559102, -2.229598, 3.512194, 1, 1, 1, 1, 1,
1.561584, 0.1981132, 1.035658, 1, 1, 1, 1, 1,
1.568206, 0.2565615, 2.284235, 1, 1, 1, 1, 1,
1.583316, -0.1398666, 0.7674425, 1, 1, 1, 1, 1,
1.587915, 0.8743853, 0.5603122, 1, 1, 1, 1, 1,
1.590537, -0.8246619, 1.990272, 1, 1, 1, 1, 1,
1.593848, 1.495525, 1.883893, 1, 1, 1, 1, 1,
1.609828, 0.9232486, 1.432043, 1, 1, 1, 1, 1,
1.610036, 0.4673676, 0.8390251, 1, 1, 1, 1, 1,
1.61131, 1.05327, 3.367944, 1, 1, 1, 1, 1,
1.617594, -0.03715276, -0.279004, 1, 1, 1, 1, 1,
1.630528, 1.307238, -0.5435679, 1, 1, 1, 1, 1,
1.631614, -1.481119, 2.701151, 0, 0, 1, 1, 1,
1.638361, 0.1507084, 0.02191435, 1, 0, 0, 1, 1,
1.640717, 0.7431867, 3.02829, 1, 0, 0, 1, 1,
1.646236, -0.2014463, -1.026603, 1, 0, 0, 1, 1,
1.656303, 1.501639, 1.357698, 1, 0, 0, 1, 1,
1.679607, -0.1473594, 2.204208, 1, 0, 0, 1, 1,
1.684768, -1.72193, 2.744981, 0, 0, 0, 1, 1,
1.689092, -1.291593, 2.442636, 0, 0, 0, 1, 1,
1.69163, 0.2749862, 2.220536, 0, 0, 0, 1, 1,
1.695094, 1.875516, 0.4661162, 0, 0, 0, 1, 1,
1.700301, -1.645618, 1.549411, 0, 0, 0, 1, 1,
1.717646, -1.08315, 4.345456, 0, 0, 0, 1, 1,
1.727007, -0.36915, 2.888012, 0, 0, 0, 1, 1,
1.756483, -0.9372852, 1.082852, 1, 1, 1, 1, 1,
1.785065, 0.3341692, 1.238604, 1, 1, 1, 1, 1,
1.797541, -0.8383719, 3.190635, 1, 1, 1, 1, 1,
1.806862, 0.8568819, 0.946739, 1, 1, 1, 1, 1,
1.815725, 1.936877, 0.08212103, 1, 1, 1, 1, 1,
1.832269, -0.9727702, 0.159042, 1, 1, 1, 1, 1,
1.854736, 0.4800175, 0.8417352, 1, 1, 1, 1, 1,
1.866206, 0.2421368, 2.02311, 1, 1, 1, 1, 1,
1.867817, 0.09090005, 1.103144, 1, 1, 1, 1, 1,
1.870575, -0.6752217, 1.829399, 1, 1, 1, 1, 1,
1.883329, 0.3932602, 0.5132202, 1, 1, 1, 1, 1,
1.887478, -0.2394724, 2.982411, 1, 1, 1, 1, 1,
1.88856, 1.301858, -1.602878, 1, 1, 1, 1, 1,
1.909039, 0.0977663, 1.072613, 1, 1, 1, 1, 1,
1.917421, 0.2309222, 1.811648, 1, 1, 1, 1, 1,
1.962907, 1.098606, 0.9996756, 0, 0, 1, 1, 1,
1.971315, -0.9052945, 0.5623426, 1, 0, 0, 1, 1,
1.974028, 1.59439, 0.7705806, 1, 0, 0, 1, 1,
1.984762, -0.4293959, 2.817378, 1, 0, 0, 1, 1,
2.029883, 0.6750621, 2.374783, 1, 0, 0, 1, 1,
2.141826, -0.6067998, 2.004627, 1, 0, 0, 1, 1,
2.174012, -0.1495517, -0.1756219, 0, 0, 0, 1, 1,
2.198941, -0.5496072, 0.8206481, 0, 0, 0, 1, 1,
2.233623, -0.3267334, 2.121739, 0, 0, 0, 1, 1,
2.302761, 0.9293863, 0.5728619, 0, 0, 0, 1, 1,
2.303928, -0.08605626, 1.059754, 0, 0, 0, 1, 1,
2.317224, 1.38958, 0.4171579, 0, 0, 0, 1, 1,
2.385532, -0.2225949, 0.3079684, 0, 0, 0, 1, 1,
2.663139, 0.1414252, 0.1522331, 1, 1, 1, 1, 1,
2.795423, -1.006682, 1.027349, 1, 1, 1, 1, 1,
2.795898, 0.09920983, 1.285254, 1, 1, 1, 1, 1,
2.797229, -0.03230705, -1.346929, 1, 1, 1, 1, 1,
2.82995, -1.411286, 2.571907, 1, 1, 1, 1, 1,
2.99092, -0.5107256, 2.191233, 1, 1, 1, 1, 1,
3.266158, 1.754697, 1.660413, 1, 1, 1, 1, 1
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
var radius = 9.892053;
var distance = 34.74542;
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
mvMatrix.translate( -0.2706888, 0.419939, -0.1672127 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74542);
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