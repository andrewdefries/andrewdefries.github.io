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
-3.107001, -0.7749146, -0.4640584, 1, 0, 0, 1,
-3.021243, 1.826174, -0.6286387, 1, 0.007843138, 0, 1,
-2.962094, -1.126115, -2.99619, 1, 0.01176471, 0, 1,
-2.666597, 0.6946556, -2.336437, 1, 0.01960784, 0, 1,
-2.659709, -0.4646554, 0.0668829, 1, 0.02352941, 0, 1,
-2.64619, 0.5503386, 0.1784295, 1, 0.03137255, 0, 1,
-2.452078, -1.550136, -2.817644, 1, 0.03529412, 0, 1,
-2.377637, -1.025675, -0.7716845, 1, 0.04313726, 0, 1,
-2.351628, 1.985925, -1.355143, 1, 0.04705882, 0, 1,
-2.279834, 0.7745409, -0.8416762, 1, 0.05490196, 0, 1,
-2.176447, -0.705944, -1.926982, 1, 0.05882353, 0, 1,
-2.170474, -1.647969, -0.8755111, 1, 0.06666667, 0, 1,
-2.169216, -0.3807489, -2.200035, 1, 0.07058824, 0, 1,
-2.168119, -0.7828489, -2.94259, 1, 0.07843138, 0, 1,
-2.163932, 0.8929681, -2.335441, 1, 0.08235294, 0, 1,
-2.160376, -0.8350439, -2.994328, 1, 0.09019608, 0, 1,
-2.146153, 0.4086199, -0.8055425, 1, 0.09411765, 0, 1,
-2.129983, -0.2688257, -2.159184, 1, 0.1019608, 0, 1,
-2.129193, 0.9806937, -2.18583, 1, 0.1098039, 0, 1,
-2.122663, 0.1831431, -2.029929, 1, 0.1137255, 0, 1,
-2.111218, -0.0933451, -0.8160307, 1, 0.1215686, 0, 1,
-2.090072, -0.09257413, 0.304811, 1, 0.1254902, 0, 1,
-2.068772, 0.6649563, -0.3942595, 1, 0.1333333, 0, 1,
-2.06839, 0.4767929, -1.467251, 1, 0.1372549, 0, 1,
-2.039833, -0.5923657, -1.97174, 1, 0.145098, 0, 1,
-2.016499, -0.933634, -3.671004, 1, 0.1490196, 0, 1,
-2.011716, 1.411563, 0.3110644, 1, 0.1568628, 0, 1,
-2.009948, -0.059329, -1.594644, 1, 0.1607843, 0, 1,
-2.004224, -1.262708, -0.5610929, 1, 0.1686275, 0, 1,
-1.98209, -0.1546605, -1.899798, 1, 0.172549, 0, 1,
-1.943269, 0.5580548, -0.5111849, 1, 0.1803922, 0, 1,
-1.926552, -0.754539, -0.8744614, 1, 0.1843137, 0, 1,
-1.915732, 0.05276905, -0.6002265, 1, 0.1921569, 0, 1,
-1.912459, -0.06613515, -0.9703884, 1, 0.1960784, 0, 1,
-1.895466, -0.2558908, -1.472739, 1, 0.2039216, 0, 1,
-1.884484, 0.4563121, -2.509766, 1, 0.2117647, 0, 1,
-1.841891, -0.3946448, -1.72334, 1, 0.2156863, 0, 1,
-1.768531, 0.5085239, 0.8374499, 1, 0.2235294, 0, 1,
-1.765051, 0.2635704, -0.9140061, 1, 0.227451, 0, 1,
-1.727113, -0.1798248, 0.2733972, 1, 0.2352941, 0, 1,
-1.71797, 0.8432644, -1.258637, 1, 0.2392157, 0, 1,
-1.67626, -0.8972637, -2.085154, 1, 0.2470588, 0, 1,
-1.673495, 0.7554497, 0.02858242, 1, 0.2509804, 0, 1,
-1.657182, -3.025371, -2.25552, 1, 0.2588235, 0, 1,
-1.632564, -0.7641377, -0.7678409, 1, 0.2627451, 0, 1,
-1.631533, -0.1071626, -1.671575, 1, 0.2705882, 0, 1,
-1.627808, 0.001650123, -1.823381, 1, 0.2745098, 0, 1,
-1.627507, -1.193029, -2.572325, 1, 0.282353, 0, 1,
-1.623872, 0.2674471, -0.3608133, 1, 0.2862745, 0, 1,
-1.618495, 0.2602418, -0.4905435, 1, 0.2941177, 0, 1,
-1.609698, -1.119421, -2.395429, 1, 0.3019608, 0, 1,
-1.592221, 1.929034, -1.222587, 1, 0.3058824, 0, 1,
-1.589718, 0.04805561, -2.592158, 1, 0.3137255, 0, 1,
-1.582304, -0.3242446, -1.570235, 1, 0.3176471, 0, 1,
-1.580489, -1.301047, -2.922291, 1, 0.3254902, 0, 1,
-1.577429, 1.324286, -0.5218654, 1, 0.3294118, 0, 1,
-1.577015, 0.82527, -1.644156, 1, 0.3372549, 0, 1,
-1.571125, -0.1308679, -0.6058503, 1, 0.3411765, 0, 1,
-1.570934, 1.183694, -0.0005878552, 1, 0.3490196, 0, 1,
-1.567542, -0.2053522, 0.05795185, 1, 0.3529412, 0, 1,
-1.559711, 1.451919, -0.2929216, 1, 0.3607843, 0, 1,
-1.555783, 0.9704388, -0.3284911, 1, 0.3647059, 0, 1,
-1.552115, -0.3790528, -2.444141, 1, 0.372549, 0, 1,
-1.55198, 0.07261054, -0.7825153, 1, 0.3764706, 0, 1,
-1.54539, -1.276109, -1.961434, 1, 0.3843137, 0, 1,
-1.53433, -0.06725404, -1.937137, 1, 0.3882353, 0, 1,
-1.532472, -0.08985417, -2.336723, 1, 0.3960784, 0, 1,
-1.530264, -0.2505841, -2.099707, 1, 0.4039216, 0, 1,
-1.529068, -0.1935921, -0.003866637, 1, 0.4078431, 0, 1,
-1.51689, 1.050241, -0.3210581, 1, 0.4156863, 0, 1,
-1.501894, 0.8024628, -2.232942, 1, 0.4196078, 0, 1,
-1.461493, 0.3708777, -0.0386504, 1, 0.427451, 0, 1,
-1.458086, 1.739152, -1.623326, 1, 0.4313726, 0, 1,
-1.4536, 0.9943435, -0.07826365, 1, 0.4392157, 0, 1,
-1.451195, 0.8422991, -2.033171, 1, 0.4431373, 0, 1,
-1.446033, 1.802018, -2.165547, 1, 0.4509804, 0, 1,
-1.442974, -1.142879, -1.506832, 1, 0.454902, 0, 1,
-1.4412, -0.04144786, -1.614991, 1, 0.4627451, 0, 1,
-1.433035, 1.617992, -2.780183, 1, 0.4666667, 0, 1,
-1.416299, -0.3186715, -1.618904, 1, 0.4745098, 0, 1,
-1.409971, 0.6205676, -1.492344, 1, 0.4784314, 0, 1,
-1.403292, -0.3185644, -1.890571, 1, 0.4862745, 0, 1,
-1.403013, -1.37117, -2.17534, 1, 0.4901961, 0, 1,
-1.397797, 0.3068302, -2.283779, 1, 0.4980392, 0, 1,
-1.396508, 1.282056, 0.2797603, 1, 0.5058824, 0, 1,
-1.38653, 0.901653, -0.01474547, 1, 0.509804, 0, 1,
-1.385457, -1.868525, -3.238822, 1, 0.5176471, 0, 1,
-1.384341, 0.1800626, 0.1309768, 1, 0.5215687, 0, 1,
-1.367985, 2.445446, 0.8337275, 1, 0.5294118, 0, 1,
-1.360051, -0.6966816, -1.232106, 1, 0.5333334, 0, 1,
-1.358715, 0.1676372, -1.92844, 1, 0.5411765, 0, 1,
-1.358511, 0.08890428, -1.505207, 1, 0.5450981, 0, 1,
-1.353012, -1.113469, -1.83196, 1, 0.5529412, 0, 1,
-1.341608, -0.8958887, -3.654821, 1, 0.5568628, 0, 1,
-1.338573, 2.290429, 0.7709735, 1, 0.5647059, 0, 1,
-1.327326, 0.2446715, -1.359033, 1, 0.5686275, 0, 1,
-1.316113, -0.8192157, -1.272411, 1, 0.5764706, 0, 1,
-1.316004, -0.310198, -0.4458509, 1, 0.5803922, 0, 1,
-1.315574, -0.04427688, 0.8425854, 1, 0.5882353, 0, 1,
-1.298991, -0.06582958, -1.558989, 1, 0.5921569, 0, 1,
-1.297238, -0.8279133, -0.8796618, 1, 0.6, 0, 1,
-1.288449, -0.1655999, -3.743969, 1, 0.6078432, 0, 1,
-1.287477, 1.444153, -2.273477, 1, 0.6117647, 0, 1,
-1.285915, -0.0737358, -1.044129, 1, 0.6196079, 0, 1,
-1.273151, -0.9137884, -1.786682, 1, 0.6235294, 0, 1,
-1.272531, -0.07263729, -2.319875, 1, 0.6313726, 0, 1,
-1.266208, -0.6396547, -2.288556, 1, 0.6352941, 0, 1,
-1.259206, -0.02072524, -0.5621109, 1, 0.6431373, 0, 1,
-1.258848, -2.102784, -3.626181, 1, 0.6470588, 0, 1,
-1.25825, 0.2431264, 0.4497257, 1, 0.654902, 0, 1,
-1.257271, 0.4093581, -1.891257, 1, 0.6588235, 0, 1,
-1.238764, 0.665129, -2.199168, 1, 0.6666667, 0, 1,
-1.221284, -1.132092, -1.417869, 1, 0.6705883, 0, 1,
-1.210038, -2.402231, -2.757061, 1, 0.6784314, 0, 1,
-1.208253, -0.1055505, -2.032745, 1, 0.682353, 0, 1,
-1.206533, 1.147141, -0.4343855, 1, 0.6901961, 0, 1,
-1.201675, -1.032575, -3.132414, 1, 0.6941177, 0, 1,
-1.197952, 0.9748341, 0.7730597, 1, 0.7019608, 0, 1,
-1.197713, 0.2140972, -1.141192, 1, 0.7098039, 0, 1,
-1.196048, -0.5413409, -1.685387, 1, 0.7137255, 0, 1,
-1.187201, -1.985695, -3.161079, 1, 0.7215686, 0, 1,
-1.184579, 1.104519, -0.1579889, 1, 0.7254902, 0, 1,
-1.172789, -0.2279213, -2.947381, 1, 0.7333333, 0, 1,
-1.168199, -3.067728, -2.492519, 1, 0.7372549, 0, 1,
-1.167113, -0.5800194, -1.830516, 1, 0.7450981, 0, 1,
-1.145829, 1.341169, -0.03923079, 1, 0.7490196, 0, 1,
-1.14475, 1.124143, 0.6232666, 1, 0.7568628, 0, 1,
-1.141317, -1.122782, -1.78283, 1, 0.7607843, 0, 1,
-1.13652, 0.1737281, -2.735075, 1, 0.7686275, 0, 1,
-1.12776, -0.3836622, -0.2344318, 1, 0.772549, 0, 1,
-1.125981, -1.792069, -1.893783, 1, 0.7803922, 0, 1,
-1.1235, -0.691507, -3.484919, 1, 0.7843137, 0, 1,
-1.122961, -0.4349625, -4.305583, 1, 0.7921569, 0, 1,
-1.122855, 1.946108, -1.308063, 1, 0.7960784, 0, 1,
-1.121733, 0.1619437, -1.994478, 1, 0.8039216, 0, 1,
-1.118575, 0.8137248, -1.200837, 1, 0.8117647, 0, 1,
-1.112788, -0.8729859, -0.7243418, 1, 0.8156863, 0, 1,
-1.105739, -0.3300634, -2.392353, 1, 0.8235294, 0, 1,
-1.102825, -0.07419184, -2.115624, 1, 0.827451, 0, 1,
-1.090274, -0.867056, -0.6518075, 1, 0.8352941, 0, 1,
-1.083984, 1.098702, -1.717921, 1, 0.8392157, 0, 1,
-1.076448, -0.9645979, -3.630717, 1, 0.8470588, 0, 1,
-1.072353, 0.59045, -0.7763364, 1, 0.8509804, 0, 1,
-1.07092, -1.404537, -3.357339, 1, 0.8588235, 0, 1,
-1.063832, 0.1076413, -2.388411, 1, 0.8627451, 0, 1,
-1.063642, 1.058939, 0.660822, 1, 0.8705882, 0, 1,
-1.059719, -0.5494683, -3.528106, 1, 0.8745098, 0, 1,
-1.054623, -0.5865156, -1.07785, 1, 0.8823529, 0, 1,
-1.052818, 0.7284578, -1.049709, 1, 0.8862745, 0, 1,
-1.05192, 0.5190558, -0.1007191, 1, 0.8941177, 0, 1,
-1.050907, 0.6532247, -1.150669, 1, 0.8980392, 0, 1,
-1.050447, 0.6748597, -1.135387, 1, 0.9058824, 0, 1,
-1.047226, 2.199382, -1.213978, 1, 0.9137255, 0, 1,
-1.046376, -0.5530185, -2.842735, 1, 0.9176471, 0, 1,
-1.045429, -0.8032289, -0.6867492, 1, 0.9254902, 0, 1,
-1.04456, -0.2892497, -1.321481, 1, 0.9294118, 0, 1,
-1.04304, 0.7186109, -1.849367, 1, 0.9372549, 0, 1,
-1.040329, 1.082011, -1.865816, 1, 0.9411765, 0, 1,
-1.03732, 0.8603917, -1.042691, 1, 0.9490196, 0, 1,
-1.029794, -0.2577932, -1.147565, 1, 0.9529412, 0, 1,
-1.029614, -0.5506145, -3.452106, 1, 0.9607843, 0, 1,
-1.029498, -0.9211072, -1.839227, 1, 0.9647059, 0, 1,
-1.029345, -2.698176, -2.509067, 1, 0.972549, 0, 1,
-1.027181, -0.07805304, -2.998283, 1, 0.9764706, 0, 1,
-1.024742, -0.01112538, 0.5500629, 1, 0.9843137, 0, 1,
-1.022286, 0.1335067, -0.8816122, 1, 0.9882353, 0, 1,
-1.00986, -0.3443977, -0.8890026, 1, 0.9960784, 0, 1,
-1.007772, -0.5374259, -1.677583, 0.9960784, 1, 0, 1,
-1.006701, 0.2806308, -1.071662, 0.9921569, 1, 0, 1,
-1.003359, 0.9954129, -1.052585, 0.9843137, 1, 0, 1,
-0.9987771, -0.9116813, -4.296177, 0.9803922, 1, 0, 1,
-0.9961595, -0.8501813, -2.513032, 0.972549, 1, 0, 1,
-0.9933368, -0.3854371, -2.059557, 0.9686275, 1, 0, 1,
-0.9928051, -0.8508069, -3.897527, 0.9607843, 1, 0, 1,
-0.9910132, -0.05716044, -1.488535, 0.9568627, 1, 0, 1,
-0.9869482, 0.1756054, -0.982775, 0.9490196, 1, 0, 1,
-0.9613289, 0.607529, 1.177824, 0.945098, 1, 0, 1,
-0.9585061, -0.1376038, -2.130763, 0.9372549, 1, 0, 1,
-0.9570143, -0.0833376, 1.037938, 0.9333333, 1, 0, 1,
-0.9568691, -2.308969, -2.333898, 0.9254902, 1, 0, 1,
-0.9541609, 0.9723072, -0.6821191, 0.9215686, 1, 0, 1,
-0.9512842, -1.174397, -2.151944, 0.9137255, 1, 0, 1,
-0.9371192, -1.513437, -0.8050943, 0.9098039, 1, 0, 1,
-0.9295678, 0.8585101, 0.5249174, 0.9019608, 1, 0, 1,
-0.923114, 0.6033405, 0.6770132, 0.8941177, 1, 0, 1,
-0.9186266, -1.551956, -0.9719812, 0.8901961, 1, 0, 1,
-0.9128876, -0.07819718, -0.951969, 0.8823529, 1, 0, 1,
-0.912142, -0.2577041, -1.153051, 0.8784314, 1, 0, 1,
-0.9075286, -0.451326, -2.390625, 0.8705882, 1, 0, 1,
-0.8910589, -0.3348322, -1.293084, 0.8666667, 1, 0, 1,
-0.8903726, 0.9189979, -0.7203577, 0.8588235, 1, 0, 1,
-0.8776792, 0.6242865, -0.2365585, 0.854902, 1, 0, 1,
-0.8755051, 0.00690648, -2.451943, 0.8470588, 1, 0, 1,
-0.8717645, -0.7321772, -2.229079, 0.8431373, 1, 0, 1,
-0.8715703, 0.2513748, -0.8190909, 0.8352941, 1, 0, 1,
-0.867131, -0.04280317, 0.4366763, 0.8313726, 1, 0, 1,
-0.8603655, 0.06150364, -2.504601, 0.8235294, 1, 0, 1,
-0.8568683, -0.4523934, -2.686869, 0.8196079, 1, 0, 1,
-0.8522313, -0.7884935, -2.420456, 0.8117647, 1, 0, 1,
-0.8441603, -0.5439506, -2.919745, 0.8078431, 1, 0, 1,
-0.8426251, 0.9516316, 0.1495977, 0.8, 1, 0, 1,
-0.8399983, -0.4851762, -1.968021, 0.7921569, 1, 0, 1,
-0.8367331, 0.7248015, -0.7233815, 0.7882353, 1, 0, 1,
-0.8337142, 0.1361995, -2.065161, 0.7803922, 1, 0, 1,
-0.832827, 0.01460901, -2.653321, 0.7764706, 1, 0, 1,
-0.8315536, -0.9086622, -0.6505902, 0.7686275, 1, 0, 1,
-0.8283904, -1.13952, -3.055037, 0.7647059, 1, 0, 1,
-0.828219, 0.1026243, -2.321655, 0.7568628, 1, 0, 1,
-0.8258234, 0.2335185, -0.4174025, 0.7529412, 1, 0, 1,
-0.8239359, 0.992994, -0.8499716, 0.7450981, 1, 0, 1,
-0.819515, -0.7429661, -3.228938, 0.7411765, 1, 0, 1,
-0.8154464, -1.211017, -2.08977, 0.7333333, 1, 0, 1,
-0.8071269, 0.2795407, -1.474884, 0.7294118, 1, 0, 1,
-0.799745, 0.7784876, -3.465469, 0.7215686, 1, 0, 1,
-0.7948409, -0.611274, -1.627242, 0.7176471, 1, 0, 1,
-0.7927325, 0.2663956, -2.047746, 0.7098039, 1, 0, 1,
-0.792688, 0.7785558, -0.2283498, 0.7058824, 1, 0, 1,
-0.7898151, 1.349332, 0.197562, 0.6980392, 1, 0, 1,
-0.7868121, -0.06789619, -1.469954, 0.6901961, 1, 0, 1,
-0.7854418, 0.3480221, -1.286023, 0.6862745, 1, 0, 1,
-0.784737, -1.034361, -2.471987, 0.6784314, 1, 0, 1,
-0.7833313, 1.028835, -1.412826, 0.6745098, 1, 0, 1,
-0.7821161, -0.09298589, 0.09648991, 0.6666667, 1, 0, 1,
-0.7805201, -2.360933, -2.095876, 0.6627451, 1, 0, 1,
-0.7800387, -2.058121, -2.308247, 0.654902, 1, 0, 1,
-0.776907, -0.7624118, -1.030574, 0.6509804, 1, 0, 1,
-0.7751173, 0.1533497, -0.9909362, 0.6431373, 1, 0, 1,
-0.774509, -1.90588, -3.142018, 0.6392157, 1, 0, 1,
-0.7722465, -0.1205034, -1.524625, 0.6313726, 1, 0, 1,
-0.7691928, 0.1309455, -2.104631, 0.627451, 1, 0, 1,
-0.7664394, -1.248504, -1.626961, 0.6196079, 1, 0, 1,
-0.7648386, -1.650491, -4.678504, 0.6156863, 1, 0, 1,
-0.7621977, -0.2748658, -2.274211, 0.6078432, 1, 0, 1,
-0.7600799, -0.8733355, -2.11959, 0.6039216, 1, 0, 1,
-0.7573949, 1.231583, -0.1839018, 0.5960785, 1, 0, 1,
-0.7557951, -0.9154629, -3.123726, 0.5882353, 1, 0, 1,
-0.7483357, -0.4149747, -1.639211, 0.5843138, 1, 0, 1,
-0.7475477, 0.4601389, -1.765259, 0.5764706, 1, 0, 1,
-0.7410527, 1.550623, 0.2631993, 0.572549, 1, 0, 1,
-0.7394556, -0.05786471, -2.317201, 0.5647059, 1, 0, 1,
-0.7321674, 1.660102, -0.9156687, 0.5607843, 1, 0, 1,
-0.722064, 0.002267825, -1.268682, 0.5529412, 1, 0, 1,
-0.7211432, -0.3057352, -3.278483, 0.5490196, 1, 0, 1,
-0.7198006, 1.406517, -3.578655, 0.5411765, 1, 0, 1,
-0.7141946, 0.08198482, -1.634953, 0.5372549, 1, 0, 1,
-0.7124515, -0.739785, -3.490491, 0.5294118, 1, 0, 1,
-0.7056112, 1.388524, -0.8669986, 0.5254902, 1, 0, 1,
-0.7034221, -0.04037277, -3.947409, 0.5176471, 1, 0, 1,
-0.7019922, -0.188801, -2.707716, 0.5137255, 1, 0, 1,
-0.6983292, 1.265181, -1.472015, 0.5058824, 1, 0, 1,
-0.696012, -1.183097, -2.48825, 0.5019608, 1, 0, 1,
-0.6957995, -1.495885, -1.481928, 0.4941176, 1, 0, 1,
-0.6950635, 1.50888, -1.447984, 0.4862745, 1, 0, 1,
-0.6892752, -0.00575014, -0.6423575, 0.4823529, 1, 0, 1,
-0.677112, 1.564314, -0.1014015, 0.4745098, 1, 0, 1,
-0.6765347, -1.488531, -3.469447, 0.4705882, 1, 0, 1,
-0.6757093, -0.6404648, 1.137652, 0.4627451, 1, 0, 1,
-0.6626221, 1.411339, 1.413067, 0.4588235, 1, 0, 1,
-0.6601723, 1.16362, -1.672446, 0.4509804, 1, 0, 1,
-0.6566002, -0.2439208, -1.334521, 0.4470588, 1, 0, 1,
-0.6547201, -0.03218969, -3.217301, 0.4392157, 1, 0, 1,
-0.650279, 0.7066485, -1.234857, 0.4352941, 1, 0, 1,
-0.6437581, 2.318316, -0.3967542, 0.427451, 1, 0, 1,
-0.6394302, 1.879696, -0.1957408, 0.4235294, 1, 0, 1,
-0.6375228, -0.9213188, -3.699024, 0.4156863, 1, 0, 1,
-0.636438, 0.1050951, -1.041158, 0.4117647, 1, 0, 1,
-0.6321328, 0.7956513, -0.7174196, 0.4039216, 1, 0, 1,
-0.631884, -1.669651, -5.019551, 0.3960784, 1, 0, 1,
-0.6309866, 0.2558719, -1.045771, 0.3921569, 1, 0, 1,
-0.6308743, -1.589823, -1.749444, 0.3843137, 1, 0, 1,
-0.6280015, 0.8273643, -2.462123, 0.3803922, 1, 0, 1,
-0.6179895, -0.0928806, -2.073076, 0.372549, 1, 0, 1,
-0.6171649, 0.5004376, 0.6419738, 0.3686275, 1, 0, 1,
-0.616096, 0.04912787, -1.74694, 0.3607843, 1, 0, 1,
-0.6103983, 0.3543558, -2.882789, 0.3568628, 1, 0, 1,
-0.6079453, -0.08045682, -1.334837, 0.3490196, 1, 0, 1,
-0.607495, -0.9516611, -0.4769073, 0.345098, 1, 0, 1,
-0.6072268, -0.6842118, -3.020521, 0.3372549, 1, 0, 1,
-0.6032073, -0.5327036, -3.241784, 0.3333333, 1, 0, 1,
-0.6021997, -0.2097432, -1.833209, 0.3254902, 1, 0, 1,
-0.6013858, 0.8835632, -1.098704, 0.3215686, 1, 0, 1,
-0.5949811, 0.2774637, -0.9229867, 0.3137255, 1, 0, 1,
-0.5918795, -1.011835, -1.430685, 0.3098039, 1, 0, 1,
-0.5820549, 0.7758989, 0.3448179, 0.3019608, 1, 0, 1,
-0.5787102, 0.2789313, -0.299546, 0.2941177, 1, 0, 1,
-0.5752085, 0.6042947, 0.2499942, 0.2901961, 1, 0, 1,
-0.5747636, 0.7901793, -0.3815697, 0.282353, 1, 0, 1,
-0.5650014, -1.24111, -2.756325, 0.2784314, 1, 0, 1,
-0.5549454, 0.5389243, -3.249725, 0.2705882, 1, 0, 1,
-0.5527399, 1.377597, 1.298558, 0.2666667, 1, 0, 1,
-0.5487633, 0.5033562, -1.367878, 0.2588235, 1, 0, 1,
-0.5450701, 1.561708, 0.7865392, 0.254902, 1, 0, 1,
-0.5395378, -0.5344347, -2.222902, 0.2470588, 1, 0, 1,
-0.5307103, 0.2784097, -0.9794486, 0.2431373, 1, 0, 1,
-0.5280247, -1.018612, -2.798405, 0.2352941, 1, 0, 1,
-0.5251337, 0.02645416, -1.291879, 0.2313726, 1, 0, 1,
-0.5203426, 0.04719854, -0.5807441, 0.2235294, 1, 0, 1,
-0.5196701, -2.278306, -3.348992, 0.2196078, 1, 0, 1,
-0.514843, 0.4206245, -0.07572993, 0.2117647, 1, 0, 1,
-0.5082909, -0.9156837, -2.498846, 0.2078431, 1, 0, 1,
-0.5013682, 1.096432, -0.9949596, 0.2, 1, 0, 1,
-0.5004382, 0.02598552, -1.830526, 0.1921569, 1, 0, 1,
-0.4956854, -0.1816848, -2.746241, 0.1882353, 1, 0, 1,
-0.4853913, 0.2327611, -1.880816, 0.1803922, 1, 0, 1,
-0.4835739, 0.4643646, -0.03663756, 0.1764706, 1, 0, 1,
-0.475506, 0.2147688, -0.04832267, 0.1686275, 1, 0, 1,
-0.4748162, -0.7175025, -2.486579, 0.1647059, 1, 0, 1,
-0.4720777, 1.770323, -0.6696756, 0.1568628, 1, 0, 1,
-0.4698529, -0.7696917, -4.036086, 0.1529412, 1, 0, 1,
-0.4663748, -0.3270818, -1.88695, 0.145098, 1, 0, 1,
-0.4662298, 0.5173734, -0.8102689, 0.1411765, 1, 0, 1,
-0.4592765, -1.066856, -3.386671, 0.1333333, 1, 0, 1,
-0.4542617, -0.00953719, -1.460076, 0.1294118, 1, 0, 1,
-0.4534167, 0.05942775, -1.07672, 0.1215686, 1, 0, 1,
-0.448284, -0.06344905, -2.827107, 0.1176471, 1, 0, 1,
-0.4478207, 1.730017, 0.1770964, 0.1098039, 1, 0, 1,
-0.4457742, -0.789159, -2.016486, 0.1058824, 1, 0, 1,
-0.4409847, 0.6669426, 0.07425544, 0.09803922, 1, 0, 1,
-0.4395125, -0.7829042, -4.466768, 0.09019608, 1, 0, 1,
-0.4389883, 0.9336376, 0.09983268, 0.08627451, 1, 0, 1,
-0.437965, 0.1283647, -2.015611, 0.07843138, 1, 0, 1,
-0.4349833, 1.066885, 0.2545416, 0.07450981, 1, 0, 1,
-0.4339302, 2.199367, -0.4988724, 0.06666667, 1, 0, 1,
-0.4330736, 0.272234, -0.3625914, 0.0627451, 1, 0, 1,
-0.4315084, 1.508839, -1.150472, 0.05490196, 1, 0, 1,
-0.4303756, -0.4093195, -1.660337, 0.05098039, 1, 0, 1,
-0.4264839, -2.198889, -2.751117, 0.04313726, 1, 0, 1,
-0.4263138, 0.1042207, -3.117473, 0.03921569, 1, 0, 1,
-0.4196877, 0.2276728, -0.2868178, 0.03137255, 1, 0, 1,
-0.4159629, 0.4028507, -1.671305, 0.02745098, 1, 0, 1,
-0.4078883, -0.6647187, -2.787642, 0.01960784, 1, 0, 1,
-0.4024576, -1.564258, -2.074828, 0.01568628, 1, 0, 1,
-0.4006798, 1.256229, -1.222229, 0.007843138, 1, 0, 1,
-0.4004269, -1.47568, -2.0892, 0.003921569, 1, 0, 1,
-0.3979763, -0.1995544, -3.07094, 0, 1, 0.003921569, 1,
-0.3977071, -0.5814325, -1.358594, 0, 1, 0.01176471, 1,
-0.3974623, -1.022077, -2.47805, 0, 1, 0.01568628, 1,
-0.3964647, 0.9880432, -0.9893419, 0, 1, 0.02352941, 1,
-0.3955765, -0.02877436, -2.385489, 0, 1, 0.02745098, 1,
-0.3933905, 0.02342523, -2.93994, 0, 1, 0.03529412, 1,
-0.3876534, -0.1180758, -1.875436, 0, 1, 0.03921569, 1,
-0.383397, -0.8586273, -3.481025, 0, 1, 0.04705882, 1,
-0.3783881, 0.2855248, -1.780362, 0, 1, 0.05098039, 1,
-0.377601, 0.4068765, -1.813145, 0, 1, 0.05882353, 1,
-0.3773917, 0.1364167, -2.429581, 0, 1, 0.0627451, 1,
-0.3749865, -0.404845, -2.223844, 0, 1, 0.07058824, 1,
-0.3717397, 1.01583, -0.3834338, 0, 1, 0.07450981, 1,
-0.3670512, -1.699425, -3.465309, 0, 1, 0.08235294, 1,
-0.3645447, 1.234207, 1.039551, 0, 1, 0.08627451, 1,
-0.3627667, -0.2302013, -0.1198462, 0, 1, 0.09411765, 1,
-0.3498554, -0.8384619, -2.442393, 0, 1, 0.1019608, 1,
-0.3485393, 1.022006, -1.173939, 0, 1, 0.1058824, 1,
-0.3295364, 0.5999223, 0.3822842, 0, 1, 0.1137255, 1,
-0.3244483, -2.078266, -2.85786, 0, 1, 0.1176471, 1,
-0.3233418, 0.620616, -0.9114975, 0, 1, 0.1254902, 1,
-0.3227549, 0.1464096, 0.2781452, 0, 1, 0.1294118, 1,
-0.3207711, -1.36328, -5.282151, 0, 1, 0.1372549, 1,
-0.3179399, 0.9782515, -1.439312, 0, 1, 0.1411765, 1,
-0.3167003, -0.8972723, -2.218541, 0, 1, 0.1490196, 1,
-0.3159646, 0.2484727, -0.1128884, 0, 1, 0.1529412, 1,
-0.3111965, -1.283367, -3.148454, 0, 1, 0.1607843, 1,
-0.310845, -0.9379445, -1.878426, 0, 1, 0.1647059, 1,
-0.3106321, -0.4702067, -3.659218, 0, 1, 0.172549, 1,
-0.3096665, 0.4119238, -1.054505, 0, 1, 0.1764706, 1,
-0.309639, -0.6516982, -4.850182, 0, 1, 0.1843137, 1,
-0.3093843, 0.3691666, -2.035468, 0, 1, 0.1882353, 1,
-0.3081288, -1.019353, -2.451279, 0, 1, 0.1960784, 1,
-0.305276, 2.023271, 0.9073735, 0, 1, 0.2039216, 1,
-0.3024146, 0.5570871, 0.01792242, 0, 1, 0.2078431, 1,
-0.3003094, -0.9685161, -2.704368, 0, 1, 0.2156863, 1,
-0.292969, 0.8492056, -0.6469246, 0, 1, 0.2196078, 1,
-0.2922049, -0.9776766, -2.978287, 0, 1, 0.227451, 1,
-0.2834161, 0.7351707, 0.2986899, 0, 1, 0.2313726, 1,
-0.2824283, -0.5700084, -1.406432, 0, 1, 0.2392157, 1,
-0.2822978, -0.1196777, -3.309261, 0, 1, 0.2431373, 1,
-0.2806279, -0.8914503, -3.441134, 0, 1, 0.2509804, 1,
-0.2765128, 0.06518269, -0.4080111, 0, 1, 0.254902, 1,
-0.2758537, -0.9708306, -2.711878, 0, 1, 0.2627451, 1,
-0.27255, 1.27827, -0.3276369, 0, 1, 0.2666667, 1,
-0.2690542, 1.601999, -0.09510657, 0, 1, 0.2745098, 1,
-0.2656862, 1.389209, -1.936086, 0, 1, 0.2784314, 1,
-0.2656681, 0.8712503, 0.3546975, 0, 1, 0.2862745, 1,
-0.2656426, 0.6711691, -0.8715572, 0, 1, 0.2901961, 1,
-0.2625767, 1.250613, -2.09555, 0, 1, 0.2980392, 1,
-0.2584534, 0.7502416, 0.4812914, 0, 1, 0.3058824, 1,
-0.2575873, -0.01308649, -1.686155, 0, 1, 0.3098039, 1,
-0.2510221, -0.1904346, -2.273529, 0, 1, 0.3176471, 1,
-0.2471436, 0.680216, -0.06940146, 0, 1, 0.3215686, 1,
-0.2465599, -1.021715, -1.263666, 0, 1, 0.3294118, 1,
-0.2446126, 1.592826, -1.344979, 0, 1, 0.3333333, 1,
-0.2406605, -1.495359, -2.927814, 0, 1, 0.3411765, 1,
-0.2338048, -1.308132, -3.88559, 0, 1, 0.345098, 1,
-0.2325835, 1.949896, -1.518027, 0, 1, 0.3529412, 1,
-0.2303207, 1.147084, -0.8547311, 0, 1, 0.3568628, 1,
-0.2272335, -0.1011591, -1.708834, 0, 1, 0.3647059, 1,
-0.2265036, 0.3269142, -0.107213, 0, 1, 0.3686275, 1,
-0.2227256, -2.146355, -1.815532, 0, 1, 0.3764706, 1,
-0.2210708, 0.25029, -0.1874079, 0, 1, 0.3803922, 1,
-0.2206791, -0.7883825, -3.311339, 0, 1, 0.3882353, 1,
-0.2185172, -0.2873328, -2.072114, 0, 1, 0.3921569, 1,
-0.2166471, -0.5180088, -2.08971, 0, 1, 0.4, 1,
-0.2115958, -0.009583229, -1.838506, 0, 1, 0.4078431, 1,
-0.2111239, -0.2795853, -4.668487, 0, 1, 0.4117647, 1,
-0.2068273, -0.2412735, -2.982771, 0, 1, 0.4196078, 1,
-0.2030472, -0.01117902, -0.6727694, 0, 1, 0.4235294, 1,
-0.2006864, -0.4463603, -1.686258, 0, 1, 0.4313726, 1,
-0.1999164, -1.301743, -4.919552, 0, 1, 0.4352941, 1,
-0.1986304, -0.2243637, -2.86976, 0, 1, 0.4431373, 1,
-0.1980944, 1.071412, -0.02579615, 0, 1, 0.4470588, 1,
-0.1890262, 0.6771057, -0.8699139, 0, 1, 0.454902, 1,
-0.1766114, 0.3919882, -1.401789, 0, 1, 0.4588235, 1,
-0.1722618, -1.403292, -5.175435, 0, 1, 0.4666667, 1,
-0.1587723, 0.6201343, -0.5247796, 0, 1, 0.4705882, 1,
-0.1532814, 0.308202, -1.048825, 0, 1, 0.4784314, 1,
-0.1470139, 1.108755, 0.6245627, 0, 1, 0.4823529, 1,
-0.141874, 1.432401, -0.4421318, 0, 1, 0.4901961, 1,
-0.1394676, -0.7970735, -2.082155, 0, 1, 0.4941176, 1,
-0.1362555, -1.087979, -3.30844, 0, 1, 0.5019608, 1,
-0.1307107, -0.07215432, -1.583464, 0, 1, 0.509804, 1,
-0.1300851, -0.6034672, -1.79839, 0, 1, 0.5137255, 1,
-0.1286914, -0.1445498, -1.85377, 0, 1, 0.5215687, 1,
-0.128119, 0.6710265, -0.805865, 0, 1, 0.5254902, 1,
-0.1279624, 0.6977674, 2.570453, 0, 1, 0.5333334, 1,
-0.1248625, 0.7004103, 0.1800562, 0, 1, 0.5372549, 1,
-0.1228056, -0.01503232, -0.3273704, 0, 1, 0.5450981, 1,
-0.1204812, -0.2783369, -3.715331, 0, 1, 0.5490196, 1,
-0.1174634, 1.957785, 0.2775497, 0, 1, 0.5568628, 1,
-0.1173398, -0.7014861, -2.707458, 0, 1, 0.5607843, 1,
-0.1159242, -0.1676318, -2.495092, 0, 1, 0.5686275, 1,
-0.1152466, -0.2715828, -2.927252, 0, 1, 0.572549, 1,
-0.1141143, -0.1880452, -3.858694, 0, 1, 0.5803922, 1,
-0.1131681, 1.018176, -0.06061508, 0, 1, 0.5843138, 1,
-0.1111613, -2.709987, -2.258038, 0, 1, 0.5921569, 1,
-0.1079821, 1.59095, -0.5382104, 0, 1, 0.5960785, 1,
-0.1067279, -0.4381707, -1.348186, 0, 1, 0.6039216, 1,
-0.1029631, 0.7664605, -0.8679564, 0, 1, 0.6117647, 1,
-0.1023319, 0.4433749, -0.5087016, 0, 1, 0.6156863, 1,
-0.09840317, 0.1039985, -0.656516, 0, 1, 0.6235294, 1,
-0.09826604, -1.734076, -3.854623, 0, 1, 0.627451, 1,
-0.09621158, -0.154254, -3.586591, 0, 1, 0.6352941, 1,
-0.09379115, 0.8695983, -1.790601, 0, 1, 0.6392157, 1,
-0.09304721, 1.049371, 0.1865418, 0, 1, 0.6470588, 1,
-0.09229454, 0.1803352, 0.2723413, 0, 1, 0.6509804, 1,
-0.08950221, 0.0663019, -0.800207, 0, 1, 0.6588235, 1,
-0.08942097, 1.126413, 0.7742994, 0, 1, 0.6627451, 1,
-0.08731078, -1.379806, -4.505266, 0, 1, 0.6705883, 1,
-0.08691317, -0.7736289, -3.085936, 0, 1, 0.6745098, 1,
-0.08475293, 2.001846, -1.453078, 0, 1, 0.682353, 1,
-0.08299334, 0.9793776, -2.464313, 0, 1, 0.6862745, 1,
-0.08163596, -0.3480999, -3.447565, 0, 1, 0.6941177, 1,
-0.07969743, -1.263205, -2.943964, 0, 1, 0.7019608, 1,
-0.07601675, -0.08413169, -3.274707, 0, 1, 0.7058824, 1,
-0.07492262, -0.5786737, -3.210847, 0, 1, 0.7137255, 1,
-0.07433498, -1.276784, -4.057793, 0, 1, 0.7176471, 1,
-0.07400523, 1.301229, -1.709234, 0, 1, 0.7254902, 1,
-0.07369235, 0.195475, 0.4329253, 0, 1, 0.7294118, 1,
-0.07276192, -1.078098, -3.592433, 0, 1, 0.7372549, 1,
-0.07230708, -0.1276385, -2.369406, 0, 1, 0.7411765, 1,
-0.07142497, -1.837024, -3.76729, 0, 1, 0.7490196, 1,
-0.07028019, 1.047605, 0.1971779, 0, 1, 0.7529412, 1,
-0.06960016, -0.2498772, -2.043966, 0, 1, 0.7607843, 1,
-0.06870633, -0.07930365, -0.8535483, 0, 1, 0.7647059, 1,
-0.06854357, 0.4818422, -1.233105, 0, 1, 0.772549, 1,
-0.06671258, -0.7609625, -2.833011, 0, 1, 0.7764706, 1,
-0.06343161, 1.075932, 1.264952, 0, 1, 0.7843137, 1,
-0.05818879, 0.08492984, -1.411196, 0, 1, 0.7882353, 1,
-0.04693917, -0.104136, -4.321811, 0, 1, 0.7960784, 1,
-0.04581044, 0.3331676, 0.6111974, 0, 1, 0.8039216, 1,
-0.04188942, -1.65672, -4.350872, 0, 1, 0.8078431, 1,
-0.03899432, 0.2377946, 0.5669273, 0, 1, 0.8156863, 1,
-0.03661086, 0.762077, 0.6631306, 0, 1, 0.8196079, 1,
-0.0339723, -1.172717, -2.583736, 0, 1, 0.827451, 1,
-0.03243305, 0.2873245, -0.1521331, 0, 1, 0.8313726, 1,
-0.0308968, 1.531113, -1.899301, 0, 1, 0.8392157, 1,
-0.02889778, 2.046834, -1.333033, 0, 1, 0.8431373, 1,
-0.02864626, 1.845933, -1.326025, 0, 1, 0.8509804, 1,
-0.02808888, 0.09335211, -1.936072, 0, 1, 0.854902, 1,
-0.02793146, -1.087958, -2.39215, 0, 1, 0.8627451, 1,
-0.02654931, -0.2929219, -2.06748, 0, 1, 0.8666667, 1,
-0.02639418, -0.2977073, -4.159301, 0, 1, 0.8745098, 1,
-0.02626149, 1.717469, -0.09750238, 0, 1, 0.8784314, 1,
-0.02479857, -0.5397809, -3.293473, 0, 1, 0.8862745, 1,
-0.02278382, -0.4520663, -2.896854, 0, 1, 0.8901961, 1,
-0.02071677, -0.5475297, -3.121526, 0, 1, 0.8980392, 1,
-0.01276421, -0.08307492, -3.326892, 0, 1, 0.9058824, 1,
-0.0125853, -0.598009, -3.133087, 0, 1, 0.9098039, 1,
-0.009894471, -0.7676181, -3.143308, 0, 1, 0.9176471, 1,
-0.007785687, -1.29887, -0.4868154, 0, 1, 0.9215686, 1,
-0.006971887, 2.345804, 0.1513452, 0, 1, 0.9294118, 1,
-0.005757173, -1.599648, -4.091411, 0, 1, 0.9333333, 1,
0.00054148, 0.117471, 1.075261, 0, 1, 0.9411765, 1,
0.001838834, 0.5093683, 0.1438421, 0, 1, 0.945098, 1,
0.002578622, -1.371551, 0.5603992, 0, 1, 0.9529412, 1,
0.005088749, 0.5811124, 0.420704, 0, 1, 0.9568627, 1,
0.006774528, -0.1788345, 5.66737, 0, 1, 0.9647059, 1,
0.007472944, -0.4113661, 2.572736, 0, 1, 0.9686275, 1,
0.008140539, -0.5989801, 3.83867, 0, 1, 0.9764706, 1,
0.009576576, 0.5353277, -0.1275498, 0, 1, 0.9803922, 1,
0.01079707, 1.032071, -1.501369, 0, 1, 0.9882353, 1,
0.01307129, 0.1447932, -0.4872341, 0, 1, 0.9921569, 1,
0.01573768, -0.8190627, 1.778509, 0, 1, 1, 1,
0.01644021, 0.1080157, -0.05995504, 0, 0.9921569, 1, 1,
0.01685794, 2.475917, 1.052979, 0, 0.9882353, 1, 1,
0.01714476, 0.7102154, 1.181417, 0, 0.9803922, 1, 1,
0.01776652, 0.7264702, -1.372282, 0, 0.9764706, 1, 1,
0.01873742, 1.594303, 0.9924086, 0, 0.9686275, 1, 1,
0.01902217, -1.023913, 3.363333, 0, 0.9647059, 1, 1,
0.0201913, 0.7814741, 0.8612019, 0, 0.9568627, 1, 1,
0.02104672, 1.768236, -1.581785, 0, 0.9529412, 1, 1,
0.02281172, -0.3865574, 3.200849, 0, 0.945098, 1, 1,
0.0281357, 0.174172, -0.1012697, 0, 0.9411765, 1, 1,
0.02859686, 0.1518696, 2.096108, 0, 0.9333333, 1, 1,
0.03156618, 2.140517, 0.712127, 0, 0.9294118, 1, 1,
0.03233113, 1.222285, -0.5386414, 0, 0.9215686, 1, 1,
0.03675039, -1.088108, 3.769985, 0, 0.9176471, 1, 1,
0.03921944, 0.9901401, 0.612061, 0, 0.9098039, 1, 1,
0.03993324, 0.1166369, 1.358953, 0, 0.9058824, 1, 1,
0.04364733, -1.71291, 2.286173, 0, 0.8980392, 1, 1,
0.04368952, -0.3621143, 2.161464, 0, 0.8901961, 1, 1,
0.04422143, -0.7330198, 2.133826, 0, 0.8862745, 1, 1,
0.04575523, 2.470715, -0.5808874, 0, 0.8784314, 1, 1,
0.05925792, -1.118342, 5.729724, 0, 0.8745098, 1, 1,
0.06111409, 0.1044408, 0.5334668, 0, 0.8666667, 1, 1,
0.06118685, -1.011632, 2.682479, 0, 0.8627451, 1, 1,
0.06231571, 0.7431288, -0.07765405, 0, 0.854902, 1, 1,
0.06586049, 0.9025022, -1.667014, 0, 0.8509804, 1, 1,
0.0660731, 0.03259529, 0.9845939, 0, 0.8431373, 1, 1,
0.06701155, -0.1088857, 3.280147, 0, 0.8392157, 1, 1,
0.06713506, -0.7188652, 3.909802, 0, 0.8313726, 1, 1,
0.07059756, -1.001012, 3.56583, 0, 0.827451, 1, 1,
0.07128891, 0.4160901, -1.610557, 0, 0.8196079, 1, 1,
0.07255589, -0.05406945, 1.074248, 0, 0.8156863, 1, 1,
0.07687224, 0.2921053, 0.07544849, 0, 0.8078431, 1, 1,
0.07751545, 0.360957, 0.9269009, 0, 0.8039216, 1, 1,
0.07923593, 0.09386913, -0.3678094, 0, 0.7960784, 1, 1,
0.08253369, 0.6685045, -0.272649, 0, 0.7882353, 1, 1,
0.08437898, -0.1076759, 3.097403, 0, 0.7843137, 1, 1,
0.08494983, 1.156507, 1.744232, 0, 0.7764706, 1, 1,
0.085082, -0.178303, 3.280555, 0, 0.772549, 1, 1,
0.09113982, -0.8027109, 2.719755, 0, 0.7647059, 1, 1,
0.09541544, -1.4272, 2.345676, 0, 0.7607843, 1, 1,
0.09618033, 0.5093828, 0.947664, 0, 0.7529412, 1, 1,
0.0996284, 0.05588917, 0.0979621, 0, 0.7490196, 1, 1,
0.1018087, -0.7047765, 3.641987, 0, 0.7411765, 1, 1,
0.1025232, 0.6128082, 0.5941063, 0, 0.7372549, 1, 1,
0.105988, -0.924496, 2.833736, 0, 0.7294118, 1, 1,
0.1097972, -0.142985, 2.393458, 0, 0.7254902, 1, 1,
0.115922, 0.921246, 1.100916, 0, 0.7176471, 1, 1,
0.1196386, 0.2809592, -0.9278438, 0, 0.7137255, 1, 1,
0.1246144, 0.8217555, -2.721492, 0, 0.7058824, 1, 1,
0.1255816, -0.3612359, 2.282933, 0, 0.6980392, 1, 1,
0.1295479, -0.279529, 4.048859, 0, 0.6941177, 1, 1,
0.1346843, 0.9646834, 0.4586489, 0, 0.6862745, 1, 1,
0.1360388, -1.948819, 3.892674, 0, 0.682353, 1, 1,
0.1369542, -1.263268, 4.733364, 0, 0.6745098, 1, 1,
0.144254, 0.4252038, -0.3880364, 0, 0.6705883, 1, 1,
0.1539104, 1.865176, -0.1826477, 0, 0.6627451, 1, 1,
0.1576907, 2.964005, -0.7929714, 0, 0.6588235, 1, 1,
0.1610035, -0.7966119, 5.492642, 0, 0.6509804, 1, 1,
0.1762471, 0.6035044, 0.3889229, 0, 0.6470588, 1, 1,
0.1831572, 0.5426667, 1.740324, 0, 0.6392157, 1, 1,
0.1855881, 0.299236, -0.1609218, 0, 0.6352941, 1, 1,
0.1866678, -1.033255, 3.384181, 0, 0.627451, 1, 1,
0.1893089, -0.8182461, 2.941944, 0, 0.6235294, 1, 1,
0.1897342, -0.7985065, 2.120376, 0, 0.6156863, 1, 1,
0.1916982, -0.5170598, 4.541178, 0, 0.6117647, 1, 1,
0.1933998, 0.6793654, 1.530944, 0, 0.6039216, 1, 1,
0.1936726, -0.8614147, 2.911683, 0, 0.5960785, 1, 1,
0.195931, 0.2742306, -0.7920241, 0, 0.5921569, 1, 1,
0.1968499, -0.4503173, 2.891837, 0, 0.5843138, 1, 1,
0.1978452, -0.708356, 1.343036, 0, 0.5803922, 1, 1,
0.198734, -0.3666116, 4.241014, 0, 0.572549, 1, 1,
0.2020195, -0.8950627, 2.784625, 0, 0.5686275, 1, 1,
0.2044351, -1.056332, 4.692795, 0, 0.5607843, 1, 1,
0.2090211, -0.1966568, 3.988465, 0, 0.5568628, 1, 1,
0.2096568, 0.1969608, 0.03967774, 0, 0.5490196, 1, 1,
0.209907, -1.652997, 4.093301, 0, 0.5450981, 1, 1,
0.2109126, 1.726553, -0.3963116, 0, 0.5372549, 1, 1,
0.2134404, -1.76886, 2.686897, 0, 0.5333334, 1, 1,
0.2137546, -0.1043926, 0.8288322, 0, 0.5254902, 1, 1,
0.2146413, 0.9733571, 0.03790031, 0, 0.5215687, 1, 1,
0.2147924, -0.9530532, 2.061276, 0, 0.5137255, 1, 1,
0.2168934, 0.07923255, 1.459079, 0, 0.509804, 1, 1,
0.2198719, 0.2244473, 0.9560321, 0, 0.5019608, 1, 1,
0.2218405, 0.5361578, 0.1491442, 0, 0.4941176, 1, 1,
0.226055, -0.4034518, 3.88667, 0, 0.4901961, 1, 1,
0.2260873, 1.107756, 1.83349, 0, 0.4823529, 1, 1,
0.2266387, -0.8152716, 2.353273, 0, 0.4784314, 1, 1,
0.2267823, -0.2172556, 3.702969, 0, 0.4705882, 1, 1,
0.2306304, -0.999242, 2.388064, 0, 0.4666667, 1, 1,
0.2329942, -0.4805281, 1.78822, 0, 0.4588235, 1, 1,
0.2343683, -1.068655, 3.295311, 0, 0.454902, 1, 1,
0.2357746, 0.9507707, 0.9375496, 0, 0.4470588, 1, 1,
0.2438742, 0.3067699, -0.1104971, 0, 0.4431373, 1, 1,
0.2478755, 0.2848996, 1.597521, 0, 0.4352941, 1, 1,
0.2495873, 0.8521593, 0.8901821, 0, 0.4313726, 1, 1,
0.2519284, 0.66158, 0.08456063, 0, 0.4235294, 1, 1,
0.2547865, -1.127236, 2.190799, 0, 0.4196078, 1, 1,
0.255684, 2.09793, 0.4666632, 0, 0.4117647, 1, 1,
0.2571894, 0.5726858, 1.063221, 0, 0.4078431, 1, 1,
0.2574806, -0.7127138, 1.58773, 0, 0.4, 1, 1,
0.261855, -0.7962995, 3.831161, 0, 0.3921569, 1, 1,
0.2641468, -0.4134211, 2.400864, 0, 0.3882353, 1, 1,
0.2663507, -2.046335, 3.186791, 0, 0.3803922, 1, 1,
0.2677189, -0.06863385, 2.194538, 0, 0.3764706, 1, 1,
0.2704442, -0.3896449, 1.677066, 0, 0.3686275, 1, 1,
0.2712102, 0.7936185, 1.312971, 0, 0.3647059, 1, 1,
0.2715305, -0.5632744, 2.410809, 0, 0.3568628, 1, 1,
0.2771977, -0.2657024, 0.2519069, 0, 0.3529412, 1, 1,
0.2779968, 0.8205473, 0.703541, 0, 0.345098, 1, 1,
0.2789789, -2.211407, 2.434158, 0, 0.3411765, 1, 1,
0.2824043, -1.290108, 2.248838, 0, 0.3333333, 1, 1,
0.2875997, -0.5349494, 1.875983, 0, 0.3294118, 1, 1,
0.2900532, 1.571801, -0.7302098, 0, 0.3215686, 1, 1,
0.2915728, 0.9676256, 1.14919, 0, 0.3176471, 1, 1,
0.2933542, 0.09442769, 2.424658, 0, 0.3098039, 1, 1,
0.299649, 0.9147497, -0.7272706, 0, 0.3058824, 1, 1,
0.3003598, -0.827612, 1.300084, 0, 0.2980392, 1, 1,
0.3008871, -1.653637, 4.603889, 0, 0.2901961, 1, 1,
0.301264, -0.00579718, 0.1349458, 0, 0.2862745, 1, 1,
0.3012969, 0.01671034, 1.796536, 0, 0.2784314, 1, 1,
0.3074257, -0.7826599, 3.451775, 0, 0.2745098, 1, 1,
0.3074569, 0.5038368, 0.04742776, 0, 0.2666667, 1, 1,
0.3080294, 0.5962475, -0.2172257, 0, 0.2627451, 1, 1,
0.3080926, -1.380403, 2.215891, 0, 0.254902, 1, 1,
0.3100654, 0.2384113, -0.3054038, 0, 0.2509804, 1, 1,
0.311767, 1.780145, 0.9198595, 0, 0.2431373, 1, 1,
0.3122332, 0.2774082, 1.009771, 0, 0.2392157, 1, 1,
0.3138028, 0.6780483, 1.647577, 0, 0.2313726, 1, 1,
0.3155306, -0.1716249, 1.324069, 0, 0.227451, 1, 1,
0.3268166, 0.3398511, 0.1489399, 0, 0.2196078, 1, 1,
0.3277398, 0.1218111, 0.9172199, 0, 0.2156863, 1, 1,
0.3278977, 1.386921, -2.41149, 0, 0.2078431, 1, 1,
0.3304186, -2.290358, 5.027336, 0, 0.2039216, 1, 1,
0.3310676, -0.2328478, 1.364508, 0, 0.1960784, 1, 1,
0.3366527, -1.352076, 3.140571, 0, 0.1882353, 1, 1,
0.3513281, 0.2770817, -0.5164293, 0, 0.1843137, 1, 1,
0.3534229, 0.08933323, 2.195195, 0, 0.1764706, 1, 1,
0.3585255, -0.6955296, 1.375982, 0, 0.172549, 1, 1,
0.3586397, -0.03017692, -0.1908763, 0, 0.1647059, 1, 1,
0.359906, -0.03991011, 2.537943, 0, 0.1607843, 1, 1,
0.3627586, -1.550026, 1.534157, 0, 0.1529412, 1, 1,
0.3638662, 0.2947705, 0.1587631, 0, 0.1490196, 1, 1,
0.3654686, -0.6425374, 2.409867, 0, 0.1411765, 1, 1,
0.3662545, -0.5759218, 1.764391, 0, 0.1372549, 1, 1,
0.3746012, -0.1600484, 4.284472, 0, 0.1294118, 1, 1,
0.376461, -0.2116238, 2.428437, 0, 0.1254902, 1, 1,
0.3853261, -0.2135589, 1.942204, 0, 0.1176471, 1, 1,
0.3875754, -0.841534, 5.015369, 0, 0.1137255, 1, 1,
0.3894948, 0.06703862, 1.995578, 0, 0.1058824, 1, 1,
0.3926015, 0.7649807, 0.7362287, 0, 0.09803922, 1, 1,
0.3937783, 1.323745, 1.846697, 0, 0.09411765, 1, 1,
0.3986694, -0.1155104, 0.935308, 0, 0.08627451, 1, 1,
0.4065832, -0.04498231, 1.361644, 0, 0.08235294, 1, 1,
0.4095806, -0.6758664, 1.312184, 0, 0.07450981, 1, 1,
0.4120067, -0.3257124, 0.797873, 0, 0.07058824, 1, 1,
0.4182016, -0.6614937, 1.917525, 0, 0.0627451, 1, 1,
0.4320701, 1.440224, 1.005504, 0, 0.05882353, 1, 1,
0.4332367, 0.3533251, 1.318751, 0, 0.05098039, 1, 1,
0.4367521, -0.495434, 3.082739, 0, 0.04705882, 1, 1,
0.4387073, 2.079327, 0.09139205, 0, 0.03921569, 1, 1,
0.4397126, -0.3878246, 2.313146, 0, 0.03529412, 1, 1,
0.4436636, -1.103773, 1.749169, 0, 0.02745098, 1, 1,
0.4469659, 0.2136153, 0.4177803, 0, 0.02352941, 1, 1,
0.4506724, -0.5864387, 3.212067, 0, 0.01568628, 1, 1,
0.4521368, -1.3077, 2.601237, 0, 0.01176471, 1, 1,
0.4533712, 0.1576132, 0.8956806, 0, 0.003921569, 1, 1,
0.4616921, 0.6064297, 1.244796, 0.003921569, 0, 1, 1,
0.4617195, -1.931159, 2.15746, 0.007843138, 0, 1, 1,
0.4641239, -1.351874, 2.526509, 0.01568628, 0, 1, 1,
0.4732179, 0.5284323, 2.902054, 0.01960784, 0, 1, 1,
0.4819292, -1.420688, 1.219754, 0.02745098, 0, 1, 1,
0.4852252, -0.4372879, 0.1643211, 0.03137255, 0, 1, 1,
0.4908375, -0.4055092, 1.526873, 0.03921569, 0, 1, 1,
0.4949589, -1.123029, 3.718367, 0.04313726, 0, 1, 1,
0.4978305, -1.999516, 2.678762, 0.05098039, 0, 1, 1,
0.5008398, -1.009114, 2.232242, 0.05490196, 0, 1, 1,
0.5018162, 0.3050252, 1.384823, 0.0627451, 0, 1, 1,
0.5043843, 0.7269744, 2.071083, 0.06666667, 0, 1, 1,
0.505887, 0.80045, 2.969721, 0.07450981, 0, 1, 1,
0.5066447, -0.891717, 1.740227, 0.07843138, 0, 1, 1,
0.5103987, -0.4316415, 1.363292, 0.08627451, 0, 1, 1,
0.5132366, -1.529019, 3.384591, 0.09019608, 0, 1, 1,
0.5140548, -1.122066, 1.604724, 0.09803922, 0, 1, 1,
0.5305046, -0.3626052, 1.585734, 0.1058824, 0, 1, 1,
0.5309584, 0.5676568, 1.873502, 0.1098039, 0, 1, 1,
0.5326262, -0.7174412, 4.230415, 0.1176471, 0, 1, 1,
0.5404644, 0.8625906, -0.03987366, 0.1215686, 0, 1, 1,
0.5470482, -1.891982, 3.496918, 0.1294118, 0, 1, 1,
0.5544803, 0.06194336, 1.036234, 0.1333333, 0, 1, 1,
0.5548415, 0.1061048, 0.6492913, 0.1411765, 0, 1, 1,
0.556658, -0.6777903, 3.685411, 0.145098, 0, 1, 1,
0.5578663, 1.208171, 0.5251701, 0.1529412, 0, 1, 1,
0.5613844, 1.487816, 0.2293528, 0.1568628, 0, 1, 1,
0.5623159, -1.372933, 2.078966, 0.1647059, 0, 1, 1,
0.5658065, -1.635826, 3.811067, 0.1686275, 0, 1, 1,
0.5660936, 0.1144691, 1.16018, 0.1764706, 0, 1, 1,
0.5670468, -0.3892846, 2.575507, 0.1803922, 0, 1, 1,
0.5698375, -1.917378, 2.279686, 0.1882353, 0, 1, 1,
0.5734159, -0.6311594, -0.03319368, 0.1921569, 0, 1, 1,
0.5757402, 0.3785604, 0.5930151, 0.2, 0, 1, 1,
0.5845175, 0.9941982, 0.1821682, 0.2078431, 0, 1, 1,
0.5884063, -1.074215, 2.670141, 0.2117647, 0, 1, 1,
0.5950612, 0.3890259, 0.4252933, 0.2196078, 0, 1, 1,
0.5979154, -1.216032, 1.989332, 0.2235294, 0, 1, 1,
0.5980827, 0.0395111, 3.20463, 0.2313726, 0, 1, 1,
0.6008224, -0.421575, 1.708699, 0.2352941, 0, 1, 1,
0.6036052, -0.7694428, 3.337394, 0.2431373, 0, 1, 1,
0.6042833, -0.1131667, 0.2107062, 0.2470588, 0, 1, 1,
0.6082579, 0.1304926, 1.821885, 0.254902, 0, 1, 1,
0.6096821, 1.261692, 0.8042316, 0.2588235, 0, 1, 1,
0.6104823, 0.9695333, 1.917763, 0.2666667, 0, 1, 1,
0.614998, -0.7745771, 2.359199, 0.2705882, 0, 1, 1,
0.6157244, -0.3376973, 0.3833365, 0.2784314, 0, 1, 1,
0.6204855, 0.6079111, 1.114607, 0.282353, 0, 1, 1,
0.6231693, -1.777848, 0.8821852, 0.2901961, 0, 1, 1,
0.6241624, -0.1135769, 3.407472, 0.2941177, 0, 1, 1,
0.628703, 1.137265, 2.156371, 0.3019608, 0, 1, 1,
0.6305454, -1.148013, 4.412169, 0.3098039, 0, 1, 1,
0.630617, 0.297014, 0.6899718, 0.3137255, 0, 1, 1,
0.6316144, -0.370827, 1.997866, 0.3215686, 0, 1, 1,
0.6371732, -0.4254372, 2.434105, 0.3254902, 0, 1, 1,
0.6372545, -0.494235, 4.151233, 0.3333333, 0, 1, 1,
0.645611, -0.7510938, 3.047723, 0.3372549, 0, 1, 1,
0.6457231, 0.3509993, -0.2461525, 0.345098, 0, 1, 1,
0.6471723, 1.541033, 1.110869, 0.3490196, 0, 1, 1,
0.6472689, 0.6009967, 1.008398, 0.3568628, 0, 1, 1,
0.6549007, 0.2861978, 2.74217, 0.3607843, 0, 1, 1,
0.6601784, -1.521394, 4.579828, 0.3686275, 0, 1, 1,
0.6633979, 0.9214083, -0.2607745, 0.372549, 0, 1, 1,
0.6635696, 0.2851207, -0.1679249, 0.3803922, 0, 1, 1,
0.6657861, 0.03568247, 1.922538, 0.3843137, 0, 1, 1,
0.6692917, 0.9190101, 0.4001661, 0.3921569, 0, 1, 1,
0.6704058, -0.8807474, 1.96902, 0.3960784, 0, 1, 1,
0.6777757, 0.1470011, 1.279009, 0.4039216, 0, 1, 1,
0.6800364, -0.1085057, 1.000991, 0.4117647, 0, 1, 1,
0.684113, -0.03101642, 1.653276, 0.4156863, 0, 1, 1,
0.6870247, 0.5525486, -0.3783089, 0.4235294, 0, 1, 1,
0.6872483, -0.7075537, 1.759086, 0.427451, 0, 1, 1,
0.6872561, 1.869986, 0.2075944, 0.4352941, 0, 1, 1,
0.6908597, 0.3499489, 1.410341, 0.4392157, 0, 1, 1,
0.6934502, -0.6808932, 1.873981, 0.4470588, 0, 1, 1,
0.6945676, -1.312905, 3.898475, 0.4509804, 0, 1, 1,
0.6960957, -0.4767006, 1.686115, 0.4588235, 0, 1, 1,
0.6994134, -0.4355458, 0.3266632, 0.4627451, 0, 1, 1,
0.704999, -2.176723, 2.937312, 0.4705882, 0, 1, 1,
0.7087138, -0.6750616, 2.163087, 0.4745098, 0, 1, 1,
0.7140713, -1.36464, 3.458496, 0.4823529, 0, 1, 1,
0.7147609, -0.4626999, 3.054407, 0.4862745, 0, 1, 1,
0.715867, 0.06216362, 1.679522, 0.4941176, 0, 1, 1,
0.7189065, -0.03631048, 1.772434, 0.5019608, 0, 1, 1,
0.7202146, 0.9193583, -0.1128014, 0.5058824, 0, 1, 1,
0.7203678, 0.4459583, 0.1489775, 0.5137255, 0, 1, 1,
0.7205877, -0.313648, 0.4690979, 0.5176471, 0, 1, 1,
0.7264859, -0.1549726, 2.27406, 0.5254902, 0, 1, 1,
0.7265057, -0.2098093, 3.720118, 0.5294118, 0, 1, 1,
0.7285814, -0.691821, 2.626428, 0.5372549, 0, 1, 1,
0.7290943, 0.2778094, 0.1323675, 0.5411765, 0, 1, 1,
0.7348697, 1.464665, -0.201051, 0.5490196, 0, 1, 1,
0.7371504, -0.6213108, 3.255011, 0.5529412, 0, 1, 1,
0.73973, -0.7115039, 1.434987, 0.5607843, 0, 1, 1,
0.7440838, 0.5328938, 3.534758, 0.5647059, 0, 1, 1,
0.7470888, -1.296194, 2.02387, 0.572549, 0, 1, 1,
0.7476698, 0.2009257, 0.3606728, 0.5764706, 0, 1, 1,
0.7484182, 0.3484578, -0.3106221, 0.5843138, 0, 1, 1,
0.7491426, -1.162438, 4.370177, 0.5882353, 0, 1, 1,
0.7583145, -0.7910784, 2.222644, 0.5960785, 0, 1, 1,
0.7680634, 1.868254, 0.4249045, 0.6039216, 0, 1, 1,
0.7683392, -0.1167004, 0.7078407, 0.6078432, 0, 1, 1,
0.7709139, 0.5192066, -0.7987171, 0.6156863, 0, 1, 1,
0.7746284, 0.8066412, 2.58258, 0.6196079, 0, 1, 1,
0.787521, -0.5598786, -0.2881151, 0.627451, 0, 1, 1,
0.7893627, 0.08262977, 0.9413638, 0.6313726, 0, 1, 1,
0.793855, 0.8846551, 1.239714, 0.6392157, 0, 1, 1,
0.8017627, 0.5188526, 2.020534, 0.6431373, 0, 1, 1,
0.8019162, 0.857586, 0.8290762, 0.6509804, 0, 1, 1,
0.8042794, 0.9323974, 0.04935526, 0.654902, 0, 1, 1,
0.8048835, 1.173102, 2.082267, 0.6627451, 0, 1, 1,
0.8107195, 0.933858, 1.328416, 0.6666667, 0, 1, 1,
0.8144535, 0.5223935, 0.382641, 0.6745098, 0, 1, 1,
0.815878, -1.25311, 2.759264, 0.6784314, 0, 1, 1,
0.8188379, -1.056179, 3.361336, 0.6862745, 0, 1, 1,
0.8254001, -0.8895605, 3.117684, 0.6901961, 0, 1, 1,
0.8258047, -0.6516287, 0.976998, 0.6980392, 0, 1, 1,
0.8265607, 1.025195, 1.255806, 0.7058824, 0, 1, 1,
0.8279613, 0.5630233, 0.3656354, 0.7098039, 0, 1, 1,
0.8290573, -0.3416996, 2.015273, 0.7176471, 0, 1, 1,
0.8326009, -0.4436708, 0.649323, 0.7215686, 0, 1, 1,
0.8331574, -0.6198189, 2.885255, 0.7294118, 0, 1, 1,
0.8341885, 0.04629137, 0.6879444, 0.7333333, 0, 1, 1,
0.8349876, 0.8488615, -0.4885391, 0.7411765, 0, 1, 1,
0.835111, -0.7244919, 2.282429, 0.7450981, 0, 1, 1,
0.8363286, -1.088263, 3.686618, 0.7529412, 0, 1, 1,
0.8416771, -0.4348536, 2.668561, 0.7568628, 0, 1, 1,
0.846426, -0.4970091, 0.870029, 0.7647059, 0, 1, 1,
0.8488346, 0.5970361, 0.7186939, 0.7686275, 0, 1, 1,
0.8635316, -1.784503, 3.692939, 0.7764706, 0, 1, 1,
0.8665855, 1.053655, -0.002026434, 0.7803922, 0, 1, 1,
0.8665971, 0.3570632, -1.095932, 0.7882353, 0, 1, 1,
0.8762618, 0.5431157, 1.277374, 0.7921569, 0, 1, 1,
0.8785516, 0.3341901, 2.7776, 0.8, 0, 1, 1,
0.8785807, -0.6227109, 3.166385, 0.8078431, 0, 1, 1,
0.8796198, -0.1796348, 2.303208, 0.8117647, 0, 1, 1,
0.8802419, -0.4758565, 2.278345, 0.8196079, 0, 1, 1,
0.8836789, 1.045473, -1.533913, 0.8235294, 0, 1, 1,
0.8883188, -0.5269085, 1.395913, 0.8313726, 0, 1, 1,
0.8935522, -0.9239275, 1.933384, 0.8352941, 0, 1, 1,
0.8955007, -0.7151448, 3.308791, 0.8431373, 0, 1, 1,
0.8994664, 1.05915, -0.4567128, 0.8470588, 0, 1, 1,
0.9001703, -0.06216751, 2.890585, 0.854902, 0, 1, 1,
0.9049673, 0.1612277, 0.5014241, 0.8588235, 0, 1, 1,
0.915341, 0.8152657, 3.774221, 0.8666667, 0, 1, 1,
0.916141, 0.2137344, 0.8496311, 0.8705882, 0, 1, 1,
0.9227818, 0.5322844, 1.379014, 0.8784314, 0, 1, 1,
0.9277914, -0.1173271, 2.52705, 0.8823529, 0, 1, 1,
0.9289564, -1.419573, 3.337778, 0.8901961, 0, 1, 1,
0.9298549, -0.161408, 1.658207, 0.8941177, 0, 1, 1,
0.9302766, -0.1645204, 1.139961, 0.9019608, 0, 1, 1,
0.9309708, -2.067453, 3.481169, 0.9098039, 0, 1, 1,
0.9316639, -0.5336071, 2.885555, 0.9137255, 0, 1, 1,
0.9316748, 0.7138996, 1.42062, 0.9215686, 0, 1, 1,
0.9362524, 0.8238261, 1.047024, 0.9254902, 0, 1, 1,
0.9440278, -0.1341253, -0.3334267, 0.9333333, 0, 1, 1,
0.9441106, 0.6481618, -0.7059219, 0.9372549, 0, 1, 1,
0.9554722, -1.107502, 1.637875, 0.945098, 0, 1, 1,
0.9565759, -0.1940267, 1.672345, 0.9490196, 0, 1, 1,
0.9601087, 0.2291172, 0.5948315, 0.9568627, 0, 1, 1,
0.9606363, -0.4701678, 1.060627, 0.9607843, 0, 1, 1,
0.9674062, -1.632553, 2.61665, 0.9686275, 0, 1, 1,
0.9703582, 2.12375, -1.99156, 0.972549, 0, 1, 1,
0.9735653, -0.9500124, 1.048235, 0.9803922, 0, 1, 1,
0.9757861, -1.273452, 2.956056, 0.9843137, 0, 1, 1,
0.9785216, -0.8130438, 3.603099, 0.9921569, 0, 1, 1,
0.9819447, 0.1261604, 2.487796, 0.9960784, 0, 1, 1,
0.9827571, -0.8786553, 2.962251, 1, 0, 0.9960784, 1,
0.9845007, 2.354233, 0.5057473, 1, 0, 0.9882353, 1,
0.9889321, 1.073238, 0.8983281, 1, 0, 0.9843137, 1,
0.9911093, -0.4456385, 2.643683, 1, 0, 0.9764706, 1,
0.9914795, -0.6364624, 1.578181, 1, 0, 0.972549, 1,
1.012622, -0.1811799, 1.756641, 1, 0, 0.9647059, 1,
1.012779, -1.296676, 3.505846, 1, 0, 0.9607843, 1,
1.012919, -0.9395455, 2.191413, 1, 0, 0.9529412, 1,
1.014807, 1.78734, 1.21065, 1, 0, 0.9490196, 1,
1.015339, 0.5430769, -0.9392015, 1, 0, 0.9411765, 1,
1.030146, 1.402075, 1.599976, 1, 0, 0.9372549, 1,
1.03664, -0.02550444, 1.011485, 1, 0, 0.9294118, 1,
1.044339, 0.05502335, 0.1246484, 1, 0, 0.9254902, 1,
1.04995, -1.570665, 2.208067, 1, 0, 0.9176471, 1,
1.055884, 0.4075974, 3.102547, 1, 0, 0.9137255, 1,
1.058376, 0.6084197, 1.253213, 1, 0, 0.9058824, 1,
1.058736, 0.9081746, 1.307442, 1, 0, 0.9019608, 1,
1.065261, 0.7647946, -0.1810351, 1, 0, 0.8941177, 1,
1.066411, 1.079231, 0.3817879, 1, 0, 0.8862745, 1,
1.073138, -0.1568012, 0.8886274, 1, 0, 0.8823529, 1,
1.079944, 0.1647726, 1.608608, 1, 0, 0.8745098, 1,
1.082764, -1.21393, 2.78065, 1, 0, 0.8705882, 1,
1.087454, -0.1689545, 2.193776, 1, 0, 0.8627451, 1,
1.091669, 0.6929401, 2.851506, 1, 0, 0.8588235, 1,
1.097854, -1.799091, 3.291507, 1, 0, 0.8509804, 1,
1.098096, 0.08083621, 2.292482, 1, 0, 0.8470588, 1,
1.106713, 0.03436008, 1.390886, 1, 0, 0.8392157, 1,
1.12333, 0.5936236, 0.4819635, 1, 0, 0.8352941, 1,
1.126193, -1.026006, 3.402059, 1, 0, 0.827451, 1,
1.134703, 0.3727503, 1.217237, 1, 0, 0.8235294, 1,
1.139288, -0.5874996, 1.155334, 1, 0, 0.8156863, 1,
1.154177, 0.392228, 1.955402, 1, 0, 0.8117647, 1,
1.155144, -0.4114056, 2.981143, 1, 0, 0.8039216, 1,
1.155465, -0.5444981, 2.018011, 1, 0, 0.7960784, 1,
1.184142, -0.3055188, 1.278951, 1, 0, 0.7921569, 1,
1.193185, 0.2314314, 1.436147, 1, 0, 0.7843137, 1,
1.193412, 0.146607, 2.704761, 1, 0, 0.7803922, 1,
1.204703, 0.1602298, 2.693363, 1, 0, 0.772549, 1,
1.207527, -0.4864037, 1.480868, 1, 0, 0.7686275, 1,
1.215631, -0.2415739, 1.606242, 1, 0, 0.7607843, 1,
1.218626, -0.1650507, 1.662911, 1, 0, 0.7568628, 1,
1.227612, -1.994508, 3.473228, 1, 0, 0.7490196, 1,
1.239447, 0.2988146, 1.471868, 1, 0, 0.7450981, 1,
1.245115, 1.080205, 0.3352936, 1, 0, 0.7372549, 1,
1.249547, -1.1903, 1.44729, 1, 0, 0.7333333, 1,
1.250427, 0.1966201, 1.385253, 1, 0, 0.7254902, 1,
1.251563, 0.6952865, -0.628717, 1, 0, 0.7215686, 1,
1.254121, 1.04033, 2.4798, 1, 0, 0.7137255, 1,
1.262023, 0.7871956, 1.829133, 1, 0, 0.7098039, 1,
1.266783, -1.111764, 2.530463, 1, 0, 0.7019608, 1,
1.268517, 0.3424388, -0.794362, 1, 0, 0.6941177, 1,
1.274865, 0.08795313, 1.558495, 1, 0, 0.6901961, 1,
1.283183, -0.5283996, 2.375186, 1, 0, 0.682353, 1,
1.290558, -0.9909574, 4.721365, 1, 0, 0.6784314, 1,
1.297335, -0.2188803, 1.822009, 1, 0, 0.6705883, 1,
1.310809, 0.2468769, 0.3798399, 1, 0, 0.6666667, 1,
1.31348, 0.4167116, 0.9160076, 1, 0, 0.6588235, 1,
1.322491, 0.9460045, 1.069079, 1, 0, 0.654902, 1,
1.32512, -1.008007, 2.103949, 1, 0, 0.6470588, 1,
1.326276, -0.4203248, 1.898078, 1, 0, 0.6431373, 1,
1.339526, -0.4628819, 1.397161, 1, 0, 0.6352941, 1,
1.34587, 0.4787559, 1.999473, 1, 0, 0.6313726, 1,
1.359221, -0.4839333, 0.4897252, 1, 0, 0.6235294, 1,
1.373601, -0.2615457, 0.9757441, 1, 0, 0.6196079, 1,
1.374793, -0.02446151, 3.130941, 1, 0, 0.6117647, 1,
1.380309, 1.105427, 1.136658, 1, 0, 0.6078432, 1,
1.401019, 1.219724, 2.635154, 1, 0, 0.6, 1,
1.403416, -0.2626778, 1.64649, 1, 0, 0.5921569, 1,
1.41057, -0.09399269, 0.940905, 1, 0, 0.5882353, 1,
1.411819, -0.715991, 1.729632, 1, 0, 0.5803922, 1,
1.414728, 1.402466, 1.679301, 1, 0, 0.5764706, 1,
1.415514, 0.2609108, 2.36158, 1, 0, 0.5686275, 1,
1.417626, -0.8293292, 1.604892, 1, 0, 0.5647059, 1,
1.425244, -0.6277708, 3.245348, 1, 0, 0.5568628, 1,
1.425293, 0.6872762, 0.7376384, 1, 0, 0.5529412, 1,
1.429227, 0.1814552, 1.418723, 1, 0, 0.5450981, 1,
1.44675, 0.1722114, 3.155192, 1, 0, 0.5411765, 1,
1.447733, 0.0465295, 1.453209, 1, 0, 0.5333334, 1,
1.448113, -0.3296525, 2.649878, 1, 0, 0.5294118, 1,
1.452424, -0.1298397, 2.69734, 1, 0, 0.5215687, 1,
1.453663, -0.5467768, 2.718719, 1, 0, 0.5176471, 1,
1.462799, -0.03037261, 2.509233, 1, 0, 0.509804, 1,
1.467477, 0.815778, 1.241042, 1, 0, 0.5058824, 1,
1.469154, 1.028682, 1.352379, 1, 0, 0.4980392, 1,
1.470454, 0.07596108, -0.3506467, 1, 0, 0.4901961, 1,
1.47503, 0.7768738, 0.1948399, 1, 0, 0.4862745, 1,
1.476137, 0.8200716, 1.280787, 1, 0, 0.4784314, 1,
1.481162, -1.62511, 2.399837, 1, 0, 0.4745098, 1,
1.483184, -2.742041, 2.247004, 1, 0, 0.4666667, 1,
1.485345, 1.649352, 0.6498668, 1, 0, 0.4627451, 1,
1.493412, 0.4707214, 2.177493, 1, 0, 0.454902, 1,
1.517475, -0.38797, 2.970404, 1, 0, 0.4509804, 1,
1.523519, -0.3781705, 1.289506, 1, 0, 0.4431373, 1,
1.523947, -1.408923, 2.551758, 1, 0, 0.4392157, 1,
1.555234, -1.628444, 2.247756, 1, 0, 0.4313726, 1,
1.560866, -0.6632733, 0.6849229, 1, 0, 0.427451, 1,
1.570893, 2.006089, -0.003373223, 1, 0, 0.4196078, 1,
1.571314, -0.992463, 2.88995, 1, 0, 0.4156863, 1,
1.585022, -0.1910689, 1.548082, 1, 0, 0.4078431, 1,
1.597358, 2.270505, 0.8167883, 1, 0, 0.4039216, 1,
1.600463, -1.501719, 2.586988, 1, 0, 0.3960784, 1,
1.602322, 0.9799223, 2.275488, 1, 0, 0.3882353, 1,
1.607376, -0.03628263, 2.520423, 1, 0, 0.3843137, 1,
1.608431, -0.6868496, 1.12294, 1, 0, 0.3764706, 1,
1.623589, -0.3254601, 1.102613, 1, 0, 0.372549, 1,
1.628613, 0.935492, 0.9559982, 1, 0, 0.3647059, 1,
1.638043, 1.79431, 1.394431, 1, 0, 0.3607843, 1,
1.646332, 0.9386316, 1.910263, 1, 0, 0.3529412, 1,
1.64903, -0.5713925, 1.512398, 1, 0, 0.3490196, 1,
1.654115, -1.160651, 2.09183, 1, 0, 0.3411765, 1,
1.665339, 0.01197223, 0.7442278, 1, 0, 0.3372549, 1,
1.667979, -1.160332, 2.453297, 1, 0, 0.3294118, 1,
1.676893, -1.569494, 3.278746, 1, 0, 0.3254902, 1,
1.678257, 1.21916, 1.068141, 1, 0, 0.3176471, 1,
1.691484, 0.8429716, 2.427146, 1, 0, 0.3137255, 1,
1.698686, 0.5094333, 0.2854734, 1, 0, 0.3058824, 1,
1.715005, -0.3195634, 2.409953, 1, 0, 0.2980392, 1,
1.715156, -1.428843, 1.679782, 1, 0, 0.2941177, 1,
1.716515, 1.567852, 0.9942149, 1, 0, 0.2862745, 1,
1.719795, -1.556626, 1.420409, 1, 0, 0.282353, 1,
1.736831, -0.2759993, 0.8748096, 1, 0, 0.2745098, 1,
1.741622, 1.655892, 0.2714641, 1, 0, 0.2705882, 1,
1.745885, 0.625214, 3.709564, 1, 0, 0.2627451, 1,
1.772849, -0.8713552, 1.321394, 1, 0, 0.2588235, 1,
1.784872, 0.4315908, 1.740535, 1, 0, 0.2509804, 1,
1.785103, -0.1096606, 1.223965, 1, 0, 0.2470588, 1,
1.813865, -1.923393, 1.785608, 1, 0, 0.2392157, 1,
1.833534, 0.523443, 2.729214, 1, 0, 0.2352941, 1,
1.858863, 0.2093989, 2.338414, 1, 0, 0.227451, 1,
1.873441, 0.8346797, 2.272507, 1, 0, 0.2235294, 1,
1.880845, 0.1562598, 2.565357, 1, 0, 0.2156863, 1,
1.911254, 0.2596772, 1.272007, 1, 0, 0.2117647, 1,
1.922266, 1.070869, 1.249412, 1, 0, 0.2039216, 1,
1.940436, 1.081463, 1.605614, 1, 0, 0.1960784, 1,
1.959454, 0.8437935, 1.361755, 1, 0, 0.1921569, 1,
1.967708, -0.2200693, 1.772228, 1, 0, 0.1843137, 1,
1.969361, -0.386345, 1.50909, 1, 0, 0.1803922, 1,
1.98477, 0.2465011, 1.430824, 1, 0, 0.172549, 1,
2.009639, -2.131936, 1.503969, 1, 0, 0.1686275, 1,
2.014024, 0.2129184, 3.188369, 1, 0, 0.1607843, 1,
2.02899, 1.744028, 0.6095431, 1, 0, 0.1568628, 1,
2.050357, -0.9443478, 1.80689, 1, 0, 0.1490196, 1,
2.051448, 0.6550177, 1.155957, 1, 0, 0.145098, 1,
2.095659, 0.64078, -0.09298983, 1, 0, 0.1372549, 1,
2.107997, 1.680335, 0.7284644, 1, 0, 0.1333333, 1,
2.127428, 0.9900419, 2.180939, 1, 0, 0.1254902, 1,
2.160367, -0.6488274, 0.2202171, 1, 0, 0.1215686, 1,
2.183833, 0.1124198, 0.5635843, 1, 0, 0.1137255, 1,
2.187226, -1.267583, 0.2055767, 1, 0, 0.1098039, 1,
2.189427, 0.5650641, 0.3414135, 1, 0, 0.1019608, 1,
2.198861, -0.008949478, 3.374862, 1, 0, 0.09411765, 1,
2.245985, -0.9605174, 1.906463, 1, 0, 0.09019608, 1,
2.255286, 0.4348077, 0.4574338, 1, 0, 0.08235294, 1,
2.259246, -0.6397053, 1.310241, 1, 0, 0.07843138, 1,
2.265653, 2.703802, 1.739431, 1, 0, 0.07058824, 1,
2.274202, 1.071594, 1.016096, 1, 0, 0.06666667, 1,
2.336174, 1.0606, 0.9259273, 1, 0, 0.05882353, 1,
2.370452, 0.6324651, 1.734671, 1, 0, 0.05490196, 1,
2.403138, 1.748649, -0.3273186, 1, 0, 0.04705882, 1,
2.494188, -0.1761495, 0.9105078, 1, 0, 0.04313726, 1,
2.498466, 0.3444982, 2.520585, 1, 0, 0.03529412, 1,
2.530619, 1.064501, 2.734676, 1, 0, 0.03137255, 1,
2.5812, 1.53697, -0.3442621, 1, 0, 0.02352941, 1,
2.806331, -0.2825159, 4.101335, 1, 0, 0.01960784, 1,
2.809203, -0.1275859, 2.812603, 1, 0, 0.01176471, 1,
3.463913, 0.2727247, 2.730293, 1, 0, 0.007843138, 1
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
0.1784563, -4.090107, -7.148664, 0, -0.5, 0.5, 0.5,
0.1784563, -4.090107, -7.148664, 1, -0.5, 0.5, 0.5,
0.1784563, -4.090107, -7.148664, 1, 1.5, 0.5, 0.5,
0.1784563, -4.090107, -7.148664, 0, 1.5, 0.5, 0.5
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
-4.220771, -0.05186152, -7.148664, 0, -0.5, 0.5, 0.5,
-4.220771, -0.05186152, -7.148664, 1, -0.5, 0.5, 0.5,
-4.220771, -0.05186152, -7.148664, 1, 1.5, 0.5, 0.5,
-4.220771, -0.05186152, -7.148664, 0, 1.5, 0.5, 0.5
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
-4.220771, -4.090107, 0.2237868, 0, -0.5, 0.5, 0.5,
-4.220771, -4.090107, 0.2237868, 1, -0.5, 0.5, 0.5,
-4.220771, -4.090107, 0.2237868, 1, 1.5, 0.5, 0.5,
-4.220771, -4.090107, 0.2237868, 0, 1.5, 0.5, 0.5
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
-3, -3.158204, -5.447329,
3, -3.158204, -5.447329,
-3, -3.158204, -5.447329,
-3, -3.313521, -5.730885,
-2, -3.158204, -5.447329,
-2, -3.313521, -5.730885,
-1, -3.158204, -5.447329,
-1, -3.313521, -5.730885,
0, -3.158204, -5.447329,
0, -3.313521, -5.730885,
1, -3.158204, -5.447329,
1, -3.313521, -5.730885,
2, -3.158204, -5.447329,
2, -3.313521, -5.730885,
3, -3.158204, -5.447329,
3, -3.313521, -5.730885
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
-3, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
-3, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
-3, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
-3, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5,
-2, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
-2, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
-2, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
-2, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5,
-1, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
-1, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
-1, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
-1, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5,
0, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
0, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
0, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
0, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5,
1, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
1, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
1, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
1, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5,
2, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
2, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
2, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
2, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5,
3, -3.624156, -6.297996, 0, -0.5, 0.5, 0.5,
3, -3.624156, -6.297996, 1, -0.5, 0.5, 0.5,
3, -3.624156, -6.297996, 1, 1.5, 0.5, 0.5,
3, -3.624156, -6.297996, 0, 1.5, 0.5, 0.5
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
-3.205564, -3, -5.447329,
-3.205564, 2, -5.447329,
-3.205564, -3, -5.447329,
-3.374766, -3, -5.730885,
-3.205564, -2, -5.447329,
-3.374766, -2, -5.730885,
-3.205564, -1, -5.447329,
-3.374766, -1, -5.730885,
-3.205564, 0, -5.447329,
-3.374766, 0, -5.730885,
-3.205564, 1, -5.447329,
-3.374766, 1, -5.730885,
-3.205564, 2, -5.447329,
-3.374766, 2, -5.730885
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
-3.713168, -3, -6.297996, 0, -0.5, 0.5, 0.5,
-3.713168, -3, -6.297996, 1, -0.5, 0.5, 0.5,
-3.713168, -3, -6.297996, 1, 1.5, 0.5, 0.5,
-3.713168, -3, -6.297996, 0, 1.5, 0.5, 0.5,
-3.713168, -2, -6.297996, 0, -0.5, 0.5, 0.5,
-3.713168, -2, -6.297996, 1, -0.5, 0.5, 0.5,
-3.713168, -2, -6.297996, 1, 1.5, 0.5, 0.5,
-3.713168, -2, -6.297996, 0, 1.5, 0.5, 0.5,
-3.713168, -1, -6.297996, 0, -0.5, 0.5, 0.5,
-3.713168, -1, -6.297996, 1, -0.5, 0.5, 0.5,
-3.713168, -1, -6.297996, 1, 1.5, 0.5, 0.5,
-3.713168, -1, -6.297996, 0, 1.5, 0.5, 0.5,
-3.713168, 0, -6.297996, 0, -0.5, 0.5, 0.5,
-3.713168, 0, -6.297996, 1, -0.5, 0.5, 0.5,
-3.713168, 0, -6.297996, 1, 1.5, 0.5, 0.5,
-3.713168, 0, -6.297996, 0, 1.5, 0.5, 0.5,
-3.713168, 1, -6.297996, 0, -0.5, 0.5, 0.5,
-3.713168, 1, -6.297996, 1, -0.5, 0.5, 0.5,
-3.713168, 1, -6.297996, 1, 1.5, 0.5, 0.5,
-3.713168, 1, -6.297996, 0, 1.5, 0.5, 0.5,
-3.713168, 2, -6.297996, 0, -0.5, 0.5, 0.5,
-3.713168, 2, -6.297996, 1, -0.5, 0.5, 0.5,
-3.713168, 2, -6.297996, 1, 1.5, 0.5, 0.5,
-3.713168, 2, -6.297996, 0, 1.5, 0.5, 0.5
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
-3.205564, -3.158204, -4,
-3.205564, -3.158204, 4,
-3.205564, -3.158204, -4,
-3.374766, -3.313521, -4,
-3.205564, -3.158204, -2,
-3.374766, -3.313521, -2,
-3.205564, -3.158204, 0,
-3.374766, -3.313521, 0,
-3.205564, -3.158204, 2,
-3.374766, -3.313521, 2,
-3.205564, -3.158204, 4,
-3.374766, -3.313521, 4
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
-3.713168, -3.624156, -4, 0, -0.5, 0.5, 0.5,
-3.713168, -3.624156, -4, 1, -0.5, 0.5, 0.5,
-3.713168, -3.624156, -4, 1, 1.5, 0.5, 0.5,
-3.713168, -3.624156, -4, 0, 1.5, 0.5, 0.5,
-3.713168, -3.624156, -2, 0, -0.5, 0.5, 0.5,
-3.713168, -3.624156, -2, 1, -0.5, 0.5, 0.5,
-3.713168, -3.624156, -2, 1, 1.5, 0.5, 0.5,
-3.713168, -3.624156, -2, 0, 1.5, 0.5, 0.5,
-3.713168, -3.624156, 0, 0, -0.5, 0.5, 0.5,
-3.713168, -3.624156, 0, 1, -0.5, 0.5, 0.5,
-3.713168, -3.624156, 0, 1, 1.5, 0.5, 0.5,
-3.713168, -3.624156, 0, 0, 1.5, 0.5, 0.5,
-3.713168, -3.624156, 2, 0, -0.5, 0.5, 0.5,
-3.713168, -3.624156, 2, 1, -0.5, 0.5, 0.5,
-3.713168, -3.624156, 2, 1, 1.5, 0.5, 0.5,
-3.713168, -3.624156, 2, 0, 1.5, 0.5, 0.5,
-3.713168, -3.624156, 4, 0, -0.5, 0.5, 0.5,
-3.713168, -3.624156, 4, 1, -0.5, 0.5, 0.5,
-3.713168, -3.624156, 4, 1, 1.5, 0.5, 0.5,
-3.713168, -3.624156, 4, 0, 1.5, 0.5, 0.5
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
-3.205564, -3.158204, -5.447329,
-3.205564, 3.054481, -5.447329,
-3.205564, -3.158204, 5.894903,
-3.205564, 3.054481, 5.894903,
-3.205564, -3.158204, -5.447329,
-3.205564, -3.158204, 5.894903,
-3.205564, 3.054481, -5.447329,
-3.205564, 3.054481, 5.894903,
-3.205564, -3.158204, -5.447329,
3.562477, -3.158204, -5.447329,
-3.205564, -3.158204, 5.894903,
3.562477, -3.158204, 5.894903,
-3.205564, 3.054481, -5.447329,
3.562477, 3.054481, -5.447329,
-3.205564, 3.054481, 5.894903,
3.562477, 3.054481, 5.894903,
3.562477, -3.158204, -5.447329,
3.562477, 3.054481, -5.447329,
3.562477, -3.158204, 5.894903,
3.562477, 3.054481, 5.894903,
3.562477, -3.158204, -5.447329,
3.562477, -3.158204, 5.894903,
3.562477, 3.054481, -5.447329,
3.562477, 3.054481, 5.894903
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
var radius = 7.794106;
var distance = 34.67686;
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
mvMatrix.translate( -0.1784563, 0.05186152, -0.2237868 );
mvMatrix.scale( 1.245137, 1.356441, 0.7429878 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67686);
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
pyrithiobac<-read.table("pyrithiobac.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrithiobac$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
```

```r
y<-pyrithiobac$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
```

```r
z<-pyrithiobac$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
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
-3.107001, -0.7749146, -0.4640584, 0, 0, 1, 1, 1,
-3.021243, 1.826174, -0.6286387, 1, 0, 0, 1, 1,
-2.962094, -1.126115, -2.99619, 1, 0, 0, 1, 1,
-2.666597, 0.6946556, -2.336437, 1, 0, 0, 1, 1,
-2.659709, -0.4646554, 0.0668829, 1, 0, 0, 1, 1,
-2.64619, 0.5503386, 0.1784295, 1, 0, 0, 1, 1,
-2.452078, -1.550136, -2.817644, 0, 0, 0, 1, 1,
-2.377637, -1.025675, -0.7716845, 0, 0, 0, 1, 1,
-2.351628, 1.985925, -1.355143, 0, 0, 0, 1, 1,
-2.279834, 0.7745409, -0.8416762, 0, 0, 0, 1, 1,
-2.176447, -0.705944, -1.926982, 0, 0, 0, 1, 1,
-2.170474, -1.647969, -0.8755111, 0, 0, 0, 1, 1,
-2.169216, -0.3807489, -2.200035, 0, 0, 0, 1, 1,
-2.168119, -0.7828489, -2.94259, 1, 1, 1, 1, 1,
-2.163932, 0.8929681, -2.335441, 1, 1, 1, 1, 1,
-2.160376, -0.8350439, -2.994328, 1, 1, 1, 1, 1,
-2.146153, 0.4086199, -0.8055425, 1, 1, 1, 1, 1,
-2.129983, -0.2688257, -2.159184, 1, 1, 1, 1, 1,
-2.129193, 0.9806937, -2.18583, 1, 1, 1, 1, 1,
-2.122663, 0.1831431, -2.029929, 1, 1, 1, 1, 1,
-2.111218, -0.0933451, -0.8160307, 1, 1, 1, 1, 1,
-2.090072, -0.09257413, 0.304811, 1, 1, 1, 1, 1,
-2.068772, 0.6649563, -0.3942595, 1, 1, 1, 1, 1,
-2.06839, 0.4767929, -1.467251, 1, 1, 1, 1, 1,
-2.039833, -0.5923657, -1.97174, 1, 1, 1, 1, 1,
-2.016499, -0.933634, -3.671004, 1, 1, 1, 1, 1,
-2.011716, 1.411563, 0.3110644, 1, 1, 1, 1, 1,
-2.009948, -0.059329, -1.594644, 1, 1, 1, 1, 1,
-2.004224, -1.262708, -0.5610929, 0, 0, 1, 1, 1,
-1.98209, -0.1546605, -1.899798, 1, 0, 0, 1, 1,
-1.943269, 0.5580548, -0.5111849, 1, 0, 0, 1, 1,
-1.926552, -0.754539, -0.8744614, 1, 0, 0, 1, 1,
-1.915732, 0.05276905, -0.6002265, 1, 0, 0, 1, 1,
-1.912459, -0.06613515, -0.9703884, 1, 0, 0, 1, 1,
-1.895466, -0.2558908, -1.472739, 0, 0, 0, 1, 1,
-1.884484, 0.4563121, -2.509766, 0, 0, 0, 1, 1,
-1.841891, -0.3946448, -1.72334, 0, 0, 0, 1, 1,
-1.768531, 0.5085239, 0.8374499, 0, 0, 0, 1, 1,
-1.765051, 0.2635704, -0.9140061, 0, 0, 0, 1, 1,
-1.727113, -0.1798248, 0.2733972, 0, 0, 0, 1, 1,
-1.71797, 0.8432644, -1.258637, 0, 0, 0, 1, 1,
-1.67626, -0.8972637, -2.085154, 1, 1, 1, 1, 1,
-1.673495, 0.7554497, 0.02858242, 1, 1, 1, 1, 1,
-1.657182, -3.025371, -2.25552, 1, 1, 1, 1, 1,
-1.632564, -0.7641377, -0.7678409, 1, 1, 1, 1, 1,
-1.631533, -0.1071626, -1.671575, 1, 1, 1, 1, 1,
-1.627808, 0.001650123, -1.823381, 1, 1, 1, 1, 1,
-1.627507, -1.193029, -2.572325, 1, 1, 1, 1, 1,
-1.623872, 0.2674471, -0.3608133, 1, 1, 1, 1, 1,
-1.618495, 0.2602418, -0.4905435, 1, 1, 1, 1, 1,
-1.609698, -1.119421, -2.395429, 1, 1, 1, 1, 1,
-1.592221, 1.929034, -1.222587, 1, 1, 1, 1, 1,
-1.589718, 0.04805561, -2.592158, 1, 1, 1, 1, 1,
-1.582304, -0.3242446, -1.570235, 1, 1, 1, 1, 1,
-1.580489, -1.301047, -2.922291, 1, 1, 1, 1, 1,
-1.577429, 1.324286, -0.5218654, 1, 1, 1, 1, 1,
-1.577015, 0.82527, -1.644156, 0, 0, 1, 1, 1,
-1.571125, -0.1308679, -0.6058503, 1, 0, 0, 1, 1,
-1.570934, 1.183694, -0.0005878552, 1, 0, 0, 1, 1,
-1.567542, -0.2053522, 0.05795185, 1, 0, 0, 1, 1,
-1.559711, 1.451919, -0.2929216, 1, 0, 0, 1, 1,
-1.555783, 0.9704388, -0.3284911, 1, 0, 0, 1, 1,
-1.552115, -0.3790528, -2.444141, 0, 0, 0, 1, 1,
-1.55198, 0.07261054, -0.7825153, 0, 0, 0, 1, 1,
-1.54539, -1.276109, -1.961434, 0, 0, 0, 1, 1,
-1.53433, -0.06725404, -1.937137, 0, 0, 0, 1, 1,
-1.532472, -0.08985417, -2.336723, 0, 0, 0, 1, 1,
-1.530264, -0.2505841, -2.099707, 0, 0, 0, 1, 1,
-1.529068, -0.1935921, -0.003866637, 0, 0, 0, 1, 1,
-1.51689, 1.050241, -0.3210581, 1, 1, 1, 1, 1,
-1.501894, 0.8024628, -2.232942, 1, 1, 1, 1, 1,
-1.461493, 0.3708777, -0.0386504, 1, 1, 1, 1, 1,
-1.458086, 1.739152, -1.623326, 1, 1, 1, 1, 1,
-1.4536, 0.9943435, -0.07826365, 1, 1, 1, 1, 1,
-1.451195, 0.8422991, -2.033171, 1, 1, 1, 1, 1,
-1.446033, 1.802018, -2.165547, 1, 1, 1, 1, 1,
-1.442974, -1.142879, -1.506832, 1, 1, 1, 1, 1,
-1.4412, -0.04144786, -1.614991, 1, 1, 1, 1, 1,
-1.433035, 1.617992, -2.780183, 1, 1, 1, 1, 1,
-1.416299, -0.3186715, -1.618904, 1, 1, 1, 1, 1,
-1.409971, 0.6205676, -1.492344, 1, 1, 1, 1, 1,
-1.403292, -0.3185644, -1.890571, 1, 1, 1, 1, 1,
-1.403013, -1.37117, -2.17534, 1, 1, 1, 1, 1,
-1.397797, 0.3068302, -2.283779, 1, 1, 1, 1, 1,
-1.396508, 1.282056, 0.2797603, 0, 0, 1, 1, 1,
-1.38653, 0.901653, -0.01474547, 1, 0, 0, 1, 1,
-1.385457, -1.868525, -3.238822, 1, 0, 0, 1, 1,
-1.384341, 0.1800626, 0.1309768, 1, 0, 0, 1, 1,
-1.367985, 2.445446, 0.8337275, 1, 0, 0, 1, 1,
-1.360051, -0.6966816, -1.232106, 1, 0, 0, 1, 1,
-1.358715, 0.1676372, -1.92844, 0, 0, 0, 1, 1,
-1.358511, 0.08890428, -1.505207, 0, 0, 0, 1, 1,
-1.353012, -1.113469, -1.83196, 0, 0, 0, 1, 1,
-1.341608, -0.8958887, -3.654821, 0, 0, 0, 1, 1,
-1.338573, 2.290429, 0.7709735, 0, 0, 0, 1, 1,
-1.327326, 0.2446715, -1.359033, 0, 0, 0, 1, 1,
-1.316113, -0.8192157, -1.272411, 0, 0, 0, 1, 1,
-1.316004, -0.310198, -0.4458509, 1, 1, 1, 1, 1,
-1.315574, -0.04427688, 0.8425854, 1, 1, 1, 1, 1,
-1.298991, -0.06582958, -1.558989, 1, 1, 1, 1, 1,
-1.297238, -0.8279133, -0.8796618, 1, 1, 1, 1, 1,
-1.288449, -0.1655999, -3.743969, 1, 1, 1, 1, 1,
-1.287477, 1.444153, -2.273477, 1, 1, 1, 1, 1,
-1.285915, -0.0737358, -1.044129, 1, 1, 1, 1, 1,
-1.273151, -0.9137884, -1.786682, 1, 1, 1, 1, 1,
-1.272531, -0.07263729, -2.319875, 1, 1, 1, 1, 1,
-1.266208, -0.6396547, -2.288556, 1, 1, 1, 1, 1,
-1.259206, -0.02072524, -0.5621109, 1, 1, 1, 1, 1,
-1.258848, -2.102784, -3.626181, 1, 1, 1, 1, 1,
-1.25825, 0.2431264, 0.4497257, 1, 1, 1, 1, 1,
-1.257271, 0.4093581, -1.891257, 1, 1, 1, 1, 1,
-1.238764, 0.665129, -2.199168, 1, 1, 1, 1, 1,
-1.221284, -1.132092, -1.417869, 0, 0, 1, 1, 1,
-1.210038, -2.402231, -2.757061, 1, 0, 0, 1, 1,
-1.208253, -0.1055505, -2.032745, 1, 0, 0, 1, 1,
-1.206533, 1.147141, -0.4343855, 1, 0, 0, 1, 1,
-1.201675, -1.032575, -3.132414, 1, 0, 0, 1, 1,
-1.197952, 0.9748341, 0.7730597, 1, 0, 0, 1, 1,
-1.197713, 0.2140972, -1.141192, 0, 0, 0, 1, 1,
-1.196048, -0.5413409, -1.685387, 0, 0, 0, 1, 1,
-1.187201, -1.985695, -3.161079, 0, 0, 0, 1, 1,
-1.184579, 1.104519, -0.1579889, 0, 0, 0, 1, 1,
-1.172789, -0.2279213, -2.947381, 0, 0, 0, 1, 1,
-1.168199, -3.067728, -2.492519, 0, 0, 0, 1, 1,
-1.167113, -0.5800194, -1.830516, 0, 0, 0, 1, 1,
-1.145829, 1.341169, -0.03923079, 1, 1, 1, 1, 1,
-1.14475, 1.124143, 0.6232666, 1, 1, 1, 1, 1,
-1.141317, -1.122782, -1.78283, 1, 1, 1, 1, 1,
-1.13652, 0.1737281, -2.735075, 1, 1, 1, 1, 1,
-1.12776, -0.3836622, -0.2344318, 1, 1, 1, 1, 1,
-1.125981, -1.792069, -1.893783, 1, 1, 1, 1, 1,
-1.1235, -0.691507, -3.484919, 1, 1, 1, 1, 1,
-1.122961, -0.4349625, -4.305583, 1, 1, 1, 1, 1,
-1.122855, 1.946108, -1.308063, 1, 1, 1, 1, 1,
-1.121733, 0.1619437, -1.994478, 1, 1, 1, 1, 1,
-1.118575, 0.8137248, -1.200837, 1, 1, 1, 1, 1,
-1.112788, -0.8729859, -0.7243418, 1, 1, 1, 1, 1,
-1.105739, -0.3300634, -2.392353, 1, 1, 1, 1, 1,
-1.102825, -0.07419184, -2.115624, 1, 1, 1, 1, 1,
-1.090274, -0.867056, -0.6518075, 1, 1, 1, 1, 1,
-1.083984, 1.098702, -1.717921, 0, 0, 1, 1, 1,
-1.076448, -0.9645979, -3.630717, 1, 0, 0, 1, 1,
-1.072353, 0.59045, -0.7763364, 1, 0, 0, 1, 1,
-1.07092, -1.404537, -3.357339, 1, 0, 0, 1, 1,
-1.063832, 0.1076413, -2.388411, 1, 0, 0, 1, 1,
-1.063642, 1.058939, 0.660822, 1, 0, 0, 1, 1,
-1.059719, -0.5494683, -3.528106, 0, 0, 0, 1, 1,
-1.054623, -0.5865156, -1.07785, 0, 0, 0, 1, 1,
-1.052818, 0.7284578, -1.049709, 0, 0, 0, 1, 1,
-1.05192, 0.5190558, -0.1007191, 0, 0, 0, 1, 1,
-1.050907, 0.6532247, -1.150669, 0, 0, 0, 1, 1,
-1.050447, 0.6748597, -1.135387, 0, 0, 0, 1, 1,
-1.047226, 2.199382, -1.213978, 0, 0, 0, 1, 1,
-1.046376, -0.5530185, -2.842735, 1, 1, 1, 1, 1,
-1.045429, -0.8032289, -0.6867492, 1, 1, 1, 1, 1,
-1.04456, -0.2892497, -1.321481, 1, 1, 1, 1, 1,
-1.04304, 0.7186109, -1.849367, 1, 1, 1, 1, 1,
-1.040329, 1.082011, -1.865816, 1, 1, 1, 1, 1,
-1.03732, 0.8603917, -1.042691, 1, 1, 1, 1, 1,
-1.029794, -0.2577932, -1.147565, 1, 1, 1, 1, 1,
-1.029614, -0.5506145, -3.452106, 1, 1, 1, 1, 1,
-1.029498, -0.9211072, -1.839227, 1, 1, 1, 1, 1,
-1.029345, -2.698176, -2.509067, 1, 1, 1, 1, 1,
-1.027181, -0.07805304, -2.998283, 1, 1, 1, 1, 1,
-1.024742, -0.01112538, 0.5500629, 1, 1, 1, 1, 1,
-1.022286, 0.1335067, -0.8816122, 1, 1, 1, 1, 1,
-1.00986, -0.3443977, -0.8890026, 1, 1, 1, 1, 1,
-1.007772, -0.5374259, -1.677583, 1, 1, 1, 1, 1,
-1.006701, 0.2806308, -1.071662, 0, 0, 1, 1, 1,
-1.003359, 0.9954129, -1.052585, 1, 0, 0, 1, 1,
-0.9987771, -0.9116813, -4.296177, 1, 0, 0, 1, 1,
-0.9961595, -0.8501813, -2.513032, 1, 0, 0, 1, 1,
-0.9933368, -0.3854371, -2.059557, 1, 0, 0, 1, 1,
-0.9928051, -0.8508069, -3.897527, 1, 0, 0, 1, 1,
-0.9910132, -0.05716044, -1.488535, 0, 0, 0, 1, 1,
-0.9869482, 0.1756054, -0.982775, 0, 0, 0, 1, 1,
-0.9613289, 0.607529, 1.177824, 0, 0, 0, 1, 1,
-0.9585061, -0.1376038, -2.130763, 0, 0, 0, 1, 1,
-0.9570143, -0.0833376, 1.037938, 0, 0, 0, 1, 1,
-0.9568691, -2.308969, -2.333898, 0, 0, 0, 1, 1,
-0.9541609, 0.9723072, -0.6821191, 0, 0, 0, 1, 1,
-0.9512842, -1.174397, -2.151944, 1, 1, 1, 1, 1,
-0.9371192, -1.513437, -0.8050943, 1, 1, 1, 1, 1,
-0.9295678, 0.8585101, 0.5249174, 1, 1, 1, 1, 1,
-0.923114, 0.6033405, 0.6770132, 1, 1, 1, 1, 1,
-0.9186266, -1.551956, -0.9719812, 1, 1, 1, 1, 1,
-0.9128876, -0.07819718, -0.951969, 1, 1, 1, 1, 1,
-0.912142, -0.2577041, -1.153051, 1, 1, 1, 1, 1,
-0.9075286, -0.451326, -2.390625, 1, 1, 1, 1, 1,
-0.8910589, -0.3348322, -1.293084, 1, 1, 1, 1, 1,
-0.8903726, 0.9189979, -0.7203577, 1, 1, 1, 1, 1,
-0.8776792, 0.6242865, -0.2365585, 1, 1, 1, 1, 1,
-0.8755051, 0.00690648, -2.451943, 1, 1, 1, 1, 1,
-0.8717645, -0.7321772, -2.229079, 1, 1, 1, 1, 1,
-0.8715703, 0.2513748, -0.8190909, 1, 1, 1, 1, 1,
-0.867131, -0.04280317, 0.4366763, 1, 1, 1, 1, 1,
-0.8603655, 0.06150364, -2.504601, 0, 0, 1, 1, 1,
-0.8568683, -0.4523934, -2.686869, 1, 0, 0, 1, 1,
-0.8522313, -0.7884935, -2.420456, 1, 0, 0, 1, 1,
-0.8441603, -0.5439506, -2.919745, 1, 0, 0, 1, 1,
-0.8426251, 0.9516316, 0.1495977, 1, 0, 0, 1, 1,
-0.8399983, -0.4851762, -1.968021, 1, 0, 0, 1, 1,
-0.8367331, 0.7248015, -0.7233815, 0, 0, 0, 1, 1,
-0.8337142, 0.1361995, -2.065161, 0, 0, 0, 1, 1,
-0.832827, 0.01460901, -2.653321, 0, 0, 0, 1, 1,
-0.8315536, -0.9086622, -0.6505902, 0, 0, 0, 1, 1,
-0.8283904, -1.13952, -3.055037, 0, 0, 0, 1, 1,
-0.828219, 0.1026243, -2.321655, 0, 0, 0, 1, 1,
-0.8258234, 0.2335185, -0.4174025, 0, 0, 0, 1, 1,
-0.8239359, 0.992994, -0.8499716, 1, 1, 1, 1, 1,
-0.819515, -0.7429661, -3.228938, 1, 1, 1, 1, 1,
-0.8154464, -1.211017, -2.08977, 1, 1, 1, 1, 1,
-0.8071269, 0.2795407, -1.474884, 1, 1, 1, 1, 1,
-0.799745, 0.7784876, -3.465469, 1, 1, 1, 1, 1,
-0.7948409, -0.611274, -1.627242, 1, 1, 1, 1, 1,
-0.7927325, 0.2663956, -2.047746, 1, 1, 1, 1, 1,
-0.792688, 0.7785558, -0.2283498, 1, 1, 1, 1, 1,
-0.7898151, 1.349332, 0.197562, 1, 1, 1, 1, 1,
-0.7868121, -0.06789619, -1.469954, 1, 1, 1, 1, 1,
-0.7854418, 0.3480221, -1.286023, 1, 1, 1, 1, 1,
-0.784737, -1.034361, -2.471987, 1, 1, 1, 1, 1,
-0.7833313, 1.028835, -1.412826, 1, 1, 1, 1, 1,
-0.7821161, -0.09298589, 0.09648991, 1, 1, 1, 1, 1,
-0.7805201, -2.360933, -2.095876, 1, 1, 1, 1, 1,
-0.7800387, -2.058121, -2.308247, 0, 0, 1, 1, 1,
-0.776907, -0.7624118, -1.030574, 1, 0, 0, 1, 1,
-0.7751173, 0.1533497, -0.9909362, 1, 0, 0, 1, 1,
-0.774509, -1.90588, -3.142018, 1, 0, 0, 1, 1,
-0.7722465, -0.1205034, -1.524625, 1, 0, 0, 1, 1,
-0.7691928, 0.1309455, -2.104631, 1, 0, 0, 1, 1,
-0.7664394, -1.248504, -1.626961, 0, 0, 0, 1, 1,
-0.7648386, -1.650491, -4.678504, 0, 0, 0, 1, 1,
-0.7621977, -0.2748658, -2.274211, 0, 0, 0, 1, 1,
-0.7600799, -0.8733355, -2.11959, 0, 0, 0, 1, 1,
-0.7573949, 1.231583, -0.1839018, 0, 0, 0, 1, 1,
-0.7557951, -0.9154629, -3.123726, 0, 0, 0, 1, 1,
-0.7483357, -0.4149747, -1.639211, 0, 0, 0, 1, 1,
-0.7475477, 0.4601389, -1.765259, 1, 1, 1, 1, 1,
-0.7410527, 1.550623, 0.2631993, 1, 1, 1, 1, 1,
-0.7394556, -0.05786471, -2.317201, 1, 1, 1, 1, 1,
-0.7321674, 1.660102, -0.9156687, 1, 1, 1, 1, 1,
-0.722064, 0.002267825, -1.268682, 1, 1, 1, 1, 1,
-0.7211432, -0.3057352, -3.278483, 1, 1, 1, 1, 1,
-0.7198006, 1.406517, -3.578655, 1, 1, 1, 1, 1,
-0.7141946, 0.08198482, -1.634953, 1, 1, 1, 1, 1,
-0.7124515, -0.739785, -3.490491, 1, 1, 1, 1, 1,
-0.7056112, 1.388524, -0.8669986, 1, 1, 1, 1, 1,
-0.7034221, -0.04037277, -3.947409, 1, 1, 1, 1, 1,
-0.7019922, -0.188801, -2.707716, 1, 1, 1, 1, 1,
-0.6983292, 1.265181, -1.472015, 1, 1, 1, 1, 1,
-0.696012, -1.183097, -2.48825, 1, 1, 1, 1, 1,
-0.6957995, -1.495885, -1.481928, 1, 1, 1, 1, 1,
-0.6950635, 1.50888, -1.447984, 0, 0, 1, 1, 1,
-0.6892752, -0.00575014, -0.6423575, 1, 0, 0, 1, 1,
-0.677112, 1.564314, -0.1014015, 1, 0, 0, 1, 1,
-0.6765347, -1.488531, -3.469447, 1, 0, 0, 1, 1,
-0.6757093, -0.6404648, 1.137652, 1, 0, 0, 1, 1,
-0.6626221, 1.411339, 1.413067, 1, 0, 0, 1, 1,
-0.6601723, 1.16362, -1.672446, 0, 0, 0, 1, 1,
-0.6566002, -0.2439208, -1.334521, 0, 0, 0, 1, 1,
-0.6547201, -0.03218969, -3.217301, 0, 0, 0, 1, 1,
-0.650279, 0.7066485, -1.234857, 0, 0, 0, 1, 1,
-0.6437581, 2.318316, -0.3967542, 0, 0, 0, 1, 1,
-0.6394302, 1.879696, -0.1957408, 0, 0, 0, 1, 1,
-0.6375228, -0.9213188, -3.699024, 0, 0, 0, 1, 1,
-0.636438, 0.1050951, -1.041158, 1, 1, 1, 1, 1,
-0.6321328, 0.7956513, -0.7174196, 1, 1, 1, 1, 1,
-0.631884, -1.669651, -5.019551, 1, 1, 1, 1, 1,
-0.6309866, 0.2558719, -1.045771, 1, 1, 1, 1, 1,
-0.6308743, -1.589823, -1.749444, 1, 1, 1, 1, 1,
-0.6280015, 0.8273643, -2.462123, 1, 1, 1, 1, 1,
-0.6179895, -0.0928806, -2.073076, 1, 1, 1, 1, 1,
-0.6171649, 0.5004376, 0.6419738, 1, 1, 1, 1, 1,
-0.616096, 0.04912787, -1.74694, 1, 1, 1, 1, 1,
-0.6103983, 0.3543558, -2.882789, 1, 1, 1, 1, 1,
-0.6079453, -0.08045682, -1.334837, 1, 1, 1, 1, 1,
-0.607495, -0.9516611, -0.4769073, 1, 1, 1, 1, 1,
-0.6072268, -0.6842118, -3.020521, 1, 1, 1, 1, 1,
-0.6032073, -0.5327036, -3.241784, 1, 1, 1, 1, 1,
-0.6021997, -0.2097432, -1.833209, 1, 1, 1, 1, 1,
-0.6013858, 0.8835632, -1.098704, 0, 0, 1, 1, 1,
-0.5949811, 0.2774637, -0.9229867, 1, 0, 0, 1, 1,
-0.5918795, -1.011835, -1.430685, 1, 0, 0, 1, 1,
-0.5820549, 0.7758989, 0.3448179, 1, 0, 0, 1, 1,
-0.5787102, 0.2789313, -0.299546, 1, 0, 0, 1, 1,
-0.5752085, 0.6042947, 0.2499942, 1, 0, 0, 1, 1,
-0.5747636, 0.7901793, -0.3815697, 0, 0, 0, 1, 1,
-0.5650014, -1.24111, -2.756325, 0, 0, 0, 1, 1,
-0.5549454, 0.5389243, -3.249725, 0, 0, 0, 1, 1,
-0.5527399, 1.377597, 1.298558, 0, 0, 0, 1, 1,
-0.5487633, 0.5033562, -1.367878, 0, 0, 0, 1, 1,
-0.5450701, 1.561708, 0.7865392, 0, 0, 0, 1, 1,
-0.5395378, -0.5344347, -2.222902, 0, 0, 0, 1, 1,
-0.5307103, 0.2784097, -0.9794486, 1, 1, 1, 1, 1,
-0.5280247, -1.018612, -2.798405, 1, 1, 1, 1, 1,
-0.5251337, 0.02645416, -1.291879, 1, 1, 1, 1, 1,
-0.5203426, 0.04719854, -0.5807441, 1, 1, 1, 1, 1,
-0.5196701, -2.278306, -3.348992, 1, 1, 1, 1, 1,
-0.514843, 0.4206245, -0.07572993, 1, 1, 1, 1, 1,
-0.5082909, -0.9156837, -2.498846, 1, 1, 1, 1, 1,
-0.5013682, 1.096432, -0.9949596, 1, 1, 1, 1, 1,
-0.5004382, 0.02598552, -1.830526, 1, 1, 1, 1, 1,
-0.4956854, -0.1816848, -2.746241, 1, 1, 1, 1, 1,
-0.4853913, 0.2327611, -1.880816, 1, 1, 1, 1, 1,
-0.4835739, 0.4643646, -0.03663756, 1, 1, 1, 1, 1,
-0.475506, 0.2147688, -0.04832267, 1, 1, 1, 1, 1,
-0.4748162, -0.7175025, -2.486579, 1, 1, 1, 1, 1,
-0.4720777, 1.770323, -0.6696756, 1, 1, 1, 1, 1,
-0.4698529, -0.7696917, -4.036086, 0, 0, 1, 1, 1,
-0.4663748, -0.3270818, -1.88695, 1, 0, 0, 1, 1,
-0.4662298, 0.5173734, -0.8102689, 1, 0, 0, 1, 1,
-0.4592765, -1.066856, -3.386671, 1, 0, 0, 1, 1,
-0.4542617, -0.00953719, -1.460076, 1, 0, 0, 1, 1,
-0.4534167, 0.05942775, -1.07672, 1, 0, 0, 1, 1,
-0.448284, -0.06344905, -2.827107, 0, 0, 0, 1, 1,
-0.4478207, 1.730017, 0.1770964, 0, 0, 0, 1, 1,
-0.4457742, -0.789159, -2.016486, 0, 0, 0, 1, 1,
-0.4409847, 0.6669426, 0.07425544, 0, 0, 0, 1, 1,
-0.4395125, -0.7829042, -4.466768, 0, 0, 0, 1, 1,
-0.4389883, 0.9336376, 0.09983268, 0, 0, 0, 1, 1,
-0.437965, 0.1283647, -2.015611, 0, 0, 0, 1, 1,
-0.4349833, 1.066885, 0.2545416, 1, 1, 1, 1, 1,
-0.4339302, 2.199367, -0.4988724, 1, 1, 1, 1, 1,
-0.4330736, 0.272234, -0.3625914, 1, 1, 1, 1, 1,
-0.4315084, 1.508839, -1.150472, 1, 1, 1, 1, 1,
-0.4303756, -0.4093195, -1.660337, 1, 1, 1, 1, 1,
-0.4264839, -2.198889, -2.751117, 1, 1, 1, 1, 1,
-0.4263138, 0.1042207, -3.117473, 1, 1, 1, 1, 1,
-0.4196877, 0.2276728, -0.2868178, 1, 1, 1, 1, 1,
-0.4159629, 0.4028507, -1.671305, 1, 1, 1, 1, 1,
-0.4078883, -0.6647187, -2.787642, 1, 1, 1, 1, 1,
-0.4024576, -1.564258, -2.074828, 1, 1, 1, 1, 1,
-0.4006798, 1.256229, -1.222229, 1, 1, 1, 1, 1,
-0.4004269, -1.47568, -2.0892, 1, 1, 1, 1, 1,
-0.3979763, -0.1995544, -3.07094, 1, 1, 1, 1, 1,
-0.3977071, -0.5814325, -1.358594, 1, 1, 1, 1, 1,
-0.3974623, -1.022077, -2.47805, 0, 0, 1, 1, 1,
-0.3964647, 0.9880432, -0.9893419, 1, 0, 0, 1, 1,
-0.3955765, -0.02877436, -2.385489, 1, 0, 0, 1, 1,
-0.3933905, 0.02342523, -2.93994, 1, 0, 0, 1, 1,
-0.3876534, -0.1180758, -1.875436, 1, 0, 0, 1, 1,
-0.383397, -0.8586273, -3.481025, 1, 0, 0, 1, 1,
-0.3783881, 0.2855248, -1.780362, 0, 0, 0, 1, 1,
-0.377601, 0.4068765, -1.813145, 0, 0, 0, 1, 1,
-0.3773917, 0.1364167, -2.429581, 0, 0, 0, 1, 1,
-0.3749865, -0.404845, -2.223844, 0, 0, 0, 1, 1,
-0.3717397, 1.01583, -0.3834338, 0, 0, 0, 1, 1,
-0.3670512, -1.699425, -3.465309, 0, 0, 0, 1, 1,
-0.3645447, 1.234207, 1.039551, 0, 0, 0, 1, 1,
-0.3627667, -0.2302013, -0.1198462, 1, 1, 1, 1, 1,
-0.3498554, -0.8384619, -2.442393, 1, 1, 1, 1, 1,
-0.3485393, 1.022006, -1.173939, 1, 1, 1, 1, 1,
-0.3295364, 0.5999223, 0.3822842, 1, 1, 1, 1, 1,
-0.3244483, -2.078266, -2.85786, 1, 1, 1, 1, 1,
-0.3233418, 0.620616, -0.9114975, 1, 1, 1, 1, 1,
-0.3227549, 0.1464096, 0.2781452, 1, 1, 1, 1, 1,
-0.3207711, -1.36328, -5.282151, 1, 1, 1, 1, 1,
-0.3179399, 0.9782515, -1.439312, 1, 1, 1, 1, 1,
-0.3167003, -0.8972723, -2.218541, 1, 1, 1, 1, 1,
-0.3159646, 0.2484727, -0.1128884, 1, 1, 1, 1, 1,
-0.3111965, -1.283367, -3.148454, 1, 1, 1, 1, 1,
-0.310845, -0.9379445, -1.878426, 1, 1, 1, 1, 1,
-0.3106321, -0.4702067, -3.659218, 1, 1, 1, 1, 1,
-0.3096665, 0.4119238, -1.054505, 1, 1, 1, 1, 1,
-0.309639, -0.6516982, -4.850182, 0, 0, 1, 1, 1,
-0.3093843, 0.3691666, -2.035468, 1, 0, 0, 1, 1,
-0.3081288, -1.019353, -2.451279, 1, 0, 0, 1, 1,
-0.305276, 2.023271, 0.9073735, 1, 0, 0, 1, 1,
-0.3024146, 0.5570871, 0.01792242, 1, 0, 0, 1, 1,
-0.3003094, -0.9685161, -2.704368, 1, 0, 0, 1, 1,
-0.292969, 0.8492056, -0.6469246, 0, 0, 0, 1, 1,
-0.2922049, -0.9776766, -2.978287, 0, 0, 0, 1, 1,
-0.2834161, 0.7351707, 0.2986899, 0, 0, 0, 1, 1,
-0.2824283, -0.5700084, -1.406432, 0, 0, 0, 1, 1,
-0.2822978, -0.1196777, -3.309261, 0, 0, 0, 1, 1,
-0.2806279, -0.8914503, -3.441134, 0, 0, 0, 1, 1,
-0.2765128, 0.06518269, -0.4080111, 0, 0, 0, 1, 1,
-0.2758537, -0.9708306, -2.711878, 1, 1, 1, 1, 1,
-0.27255, 1.27827, -0.3276369, 1, 1, 1, 1, 1,
-0.2690542, 1.601999, -0.09510657, 1, 1, 1, 1, 1,
-0.2656862, 1.389209, -1.936086, 1, 1, 1, 1, 1,
-0.2656681, 0.8712503, 0.3546975, 1, 1, 1, 1, 1,
-0.2656426, 0.6711691, -0.8715572, 1, 1, 1, 1, 1,
-0.2625767, 1.250613, -2.09555, 1, 1, 1, 1, 1,
-0.2584534, 0.7502416, 0.4812914, 1, 1, 1, 1, 1,
-0.2575873, -0.01308649, -1.686155, 1, 1, 1, 1, 1,
-0.2510221, -0.1904346, -2.273529, 1, 1, 1, 1, 1,
-0.2471436, 0.680216, -0.06940146, 1, 1, 1, 1, 1,
-0.2465599, -1.021715, -1.263666, 1, 1, 1, 1, 1,
-0.2446126, 1.592826, -1.344979, 1, 1, 1, 1, 1,
-0.2406605, -1.495359, -2.927814, 1, 1, 1, 1, 1,
-0.2338048, -1.308132, -3.88559, 1, 1, 1, 1, 1,
-0.2325835, 1.949896, -1.518027, 0, 0, 1, 1, 1,
-0.2303207, 1.147084, -0.8547311, 1, 0, 0, 1, 1,
-0.2272335, -0.1011591, -1.708834, 1, 0, 0, 1, 1,
-0.2265036, 0.3269142, -0.107213, 1, 0, 0, 1, 1,
-0.2227256, -2.146355, -1.815532, 1, 0, 0, 1, 1,
-0.2210708, 0.25029, -0.1874079, 1, 0, 0, 1, 1,
-0.2206791, -0.7883825, -3.311339, 0, 0, 0, 1, 1,
-0.2185172, -0.2873328, -2.072114, 0, 0, 0, 1, 1,
-0.2166471, -0.5180088, -2.08971, 0, 0, 0, 1, 1,
-0.2115958, -0.009583229, -1.838506, 0, 0, 0, 1, 1,
-0.2111239, -0.2795853, -4.668487, 0, 0, 0, 1, 1,
-0.2068273, -0.2412735, -2.982771, 0, 0, 0, 1, 1,
-0.2030472, -0.01117902, -0.6727694, 0, 0, 0, 1, 1,
-0.2006864, -0.4463603, -1.686258, 1, 1, 1, 1, 1,
-0.1999164, -1.301743, -4.919552, 1, 1, 1, 1, 1,
-0.1986304, -0.2243637, -2.86976, 1, 1, 1, 1, 1,
-0.1980944, 1.071412, -0.02579615, 1, 1, 1, 1, 1,
-0.1890262, 0.6771057, -0.8699139, 1, 1, 1, 1, 1,
-0.1766114, 0.3919882, -1.401789, 1, 1, 1, 1, 1,
-0.1722618, -1.403292, -5.175435, 1, 1, 1, 1, 1,
-0.1587723, 0.6201343, -0.5247796, 1, 1, 1, 1, 1,
-0.1532814, 0.308202, -1.048825, 1, 1, 1, 1, 1,
-0.1470139, 1.108755, 0.6245627, 1, 1, 1, 1, 1,
-0.141874, 1.432401, -0.4421318, 1, 1, 1, 1, 1,
-0.1394676, -0.7970735, -2.082155, 1, 1, 1, 1, 1,
-0.1362555, -1.087979, -3.30844, 1, 1, 1, 1, 1,
-0.1307107, -0.07215432, -1.583464, 1, 1, 1, 1, 1,
-0.1300851, -0.6034672, -1.79839, 1, 1, 1, 1, 1,
-0.1286914, -0.1445498, -1.85377, 0, 0, 1, 1, 1,
-0.128119, 0.6710265, -0.805865, 1, 0, 0, 1, 1,
-0.1279624, 0.6977674, 2.570453, 1, 0, 0, 1, 1,
-0.1248625, 0.7004103, 0.1800562, 1, 0, 0, 1, 1,
-0.1228056, -0.01503232, -0.3273704, 1, 0, 0, 1, 1,
-0.1204812, -0.2783369, -3.715331, 1, 0, 0, 1, 1,
-0.1174634, 1.957785, 0.2775497, 0, 0, 0, 1, 1,
-0.1173398, -0.7014861, -2.707458, 0, 0, 0, 1, 1,
-0.1159242, -0.1676318, -2.495092, 0, 0, 0, 1, 1,
-0.1152466, -0.2715828, -2.927252, 0, 0, 0, 1, 1,
-0.1141143, -0.1880452, -3.858694, 0, 0, 0, 1, 1,
-0.1131681, 1.018176, -0.06061508, 0, 0, 0, 1, 1,
-0.1111613, -2.709987, -2.258038, 0, 0, 0, 1, 1,
-0.1079821, 1.59095, -0.5382104, 1, 1, 1, 1, 1,
-0.1067279, -0.4381707, -1.348186, 1, 1, 1, 1, 1,
-0.1029631, 0.7664605, -0.8679564, 1, 1, 1, 1, 1,
-0.1023319, 0.4433749, -0.5087016, 1, 1, 1, 1, 1,
-0.09840317, 0.1039985, -0.656516, 1, 1, 1, 1, 1,
-0.09826604, -1.734076, -3.854623, 1, 1, 1, 1, 1,
-0.09621158, -0.154254, -3.586591, 1, 1, 1, 1, 1,
-0.09379115, 0.8695983, -1.790601, 1, 1, 1, 1, 1,
-0.09304721, 1.049371, 0.1865418, 1, 1, 1, 1, 1,
-0.09229454, 0.1803352, 0.2723413, 1, 1, 1, 1, 1,
-0.08950221, 0.0663019, -0.800207, 1, 1, 1, 1, 1,
-0.08942097, 1.126413, 0.7742994, 1, 1, 1, 1, 1,
-0.08731078, -1.379806, -4.505266, 1, 1, 1, 1, 1,
-0.08691317, -0.7736289, -3.085936, 1, 1, 1, 1, 1,
-0.08475293, 2.001846, -1.453078, 1, 1, 1, 1, 1,
-0.08299334, 0.9793776, -2.464313, 0, 0, 1, 1, 1,
-0.08163596, -0.3480999, -3.447565, 1, 0, 0, 1, 1,
-0.07969743, -1.263205, -2.943964, 1, 0, 0, 1, 1,
-0.07601675, -0.08413169, -3.274707, 1, 0, 0, 1, 1,
-0.07492262, -0.5786737, -3.210847, 1, 0, 0, 1, 1,
-0.07433498, -1.276784, -4.057793, 1, 0, 0, 1, 1,
-0.07400523, 1.301229, -1.709234, 0, 0, 0, 1, 1,
-0.07369235, 0.195475, 0.4329253, 0, 0, 0, 1, 1,
-0.07276192, -1.078098, -3.592433, 0, 0, 0, 1, 1,
-0.07230708, -0.1276385, -2.369406, 0, 0, 0, 1, 1,
-0.07142497, -1.837024, -3.76729, 0, 0, 0, 1, 1,
-0.07028019, 1.047605, 0.1971779, 0, 0, 0, 1, 1,
-0.06960016, -0.2498772, -2.043966, 0, 0, 0, 1, 1,
-0.06870633, -0.07930365, -0.8535483, 1, 1, 1, 1, 1,
-0.06854357, 0.4818422, -1.233105, 1, 1, 1, 1, 1,
-0.06671258, -0.7609625, -2.833011, 1, 1, 1, 1, 1,
-0.06343161, 1.075932, 1.264952, 1, 1, 1, 1, 1,
-0.05818879, 0.08492984, -1.411196, 1, 1, 1, 1, 1,
-0.04693917, -0.104136, -4.321811, 1, 1, 1, 1, 1,
-0.04581044, 0.3331676, 0.6111974, 1, 1, 1, 1, 1,
-0.04188942, -1.65672, -4.350872, 1, 1, 1, 1, 1,
-0.03899432, 0.2377946, 0.5669273, 1, 1, 1, 1, 1,
-0.03661086, 0.762077, 0.6631306, 1, 1, 1, 1, 1,
-0.0339723, -1.172717, -2.583736, 1, 1, 1, 1, 1,
-0.03243305, 0.2873245, -0.1521331, 1, 1, 1, 1, 1,
-0.0308968, 1.531113, -1.899301, 1, 1, 1, 1, 1,
-0.02889778, 2.046834, -1.333033, 1, 1, 1, 1, 1,
-0.02864626, 1.845933, -1.326025, 1, 1, 1, 1, 1,
-0.02808888, 0.09335211, -1.936072, 0, 0, 1, 1, 1,
-0.02793146, -1.087958, -2.39215, 1, 0, 0, 1, 1,
-0.02654931, -0.2929219, -2.06748, 1, 0, 0, 1, 1,
-0.02639418, -0.2977073, -4.159301, 1, 0, 0, 1, 1,
-0.02626149, 1.717469, -0.09750238, 1, 0, 0, 1, 1,
-0.02479857, -0.5397809, -3.293473, 1, 0, 0, 1, 1,
-0.02278382, -0.4520663, -2.896854, 0, 0, 0, 1, 1,
-0.02071677, -0.5475297, -3.121526, 0, 0, 0, 1, 1,
-0.01276421, -0.08307492, -3.326892, 0, 0, 0, 1, 1,
-0.0125853, -0.598009, -3.133087, 0, 0, 0, 1, 1,
-0.009894471, -0.7676181, -3.143308, 0, 0, 0, 1, 1,
-0.007785687, -1.29887, -0.4868154, 0, 0, 0, 1, 1,
-0.006971887, 2.345804, 0.1513452, 0, 0, 0, 1, 1,
-0.005757173, -1.599648, -4.091411, 1, 1, 1, 1, 1,
0.00054148, 0.117471, 1.075261, 1, 1, 1, 1, 1,
0.001838834, 0.5093683, 0.1438421, 1, 1, 1, 1, 1,
0.002578622, -1.371551, 0.5603992, 1, 1, 1, 1, 1,
0.005088749, 0.5811124, 0.420704, 1, 1, 1, 1, 1,
0.006774528, -0.1788345, 5.66737, 1, 1, 1, 1, 1,
0.007472944, -0.4113661, 2.572736, 1, 1, 1, 1, 1,
0.008140539, -0.5989801, 3.83867, 1, 1, 1, 1, 1,
0.009576576, 0.5353277, -0.1275498, 1, 1, 1, 1, 1,
0.01079707, 1.032071, -1.501369, 1, 1, 1, 1, 1,
0.01307129, 0.1447932, -0.4872341, 1, 1, 1, 1, 1,
0.01573768, -0.8190627, 1.778509, 1, 1, 1, 1, 1,
0.01644021, 0.1080157, -0.05995504, 1, 1, 1, 1, 1,
0.01685794, 2.475917, 1.052979, 1, 1, 1, 1, 1,
0.01714476, 0.7102154, 1.181417, 1, 1, 1, 1, 1,
0.01776652, 0.7264702, -1.372282, 0, 0, 1, 1, 1,
0.01873742, 1.594303, 0.9924086, 1, 0, 0, 1, 1,
0.01902217, -1.023913, 3.363333, 1, 0, 0, 1, 1,
0.0201913, 0.7814741, 0.8612019, 1, 0, 0, 1, 1,
0.02104672, 1.768236, -1.581785, 1, 0, 0, 1, 1,
0.02281172, -0.3865574, 3.200849, 1, 0, 0, 1, 1,
0.0281357, 0.174172, -0.1012697, 0, 0, 0, 1, 1,
0.02859686, 0.1518696, 2.096108, 0, 0, 0, 1, 1,
0.03156618, 2.140517, 0.712127, 0, 0, 0, 1, 1,
0.03233113, 1.222285, -0.5386414, 0, 0, 0, 1, 1,
0.03675039, -1.088108, 3.769985, 0, 0, 0, 1, 1,
0.03921944, 0.9901401, 0.612061, 0, 0, 0, 1, 1,
0.03993324, 0.1166369, 1.358953, 0, 0, 0, 1, 1,
0.04364733, -1.71291, 2.286173, 1, 1, 1, 1, 1,
0.04368952, -0.3621143, 2.161464, 1, 1, 1, 1, 1,
0.04422143, -0.7330198, 2.133826, 1, 1, 1, 1, 1,
0.04575523, 2.470715, -0.5808874, 1, 1, 1, 1, 1,
0.05925792, -1.118342, 5.729724, 1, 1, 1, 1, 1,
0.06111409, 0.1044408, 0.5334668, 1, 1, 1, 1, 1,
0.06118685, -1.011632, 2.682479, 1, 1, 1, 1, 1,
0.06231571, 0.7431288, -0.07765405, 1, 1, 1, 1, 1,
0.06586049, 0.9025022, -1.667014, 1, 1, 1, 1, 1,
0.0660731, 0.03259529, 0.9845939, 1, 1, 1, 1, 1,
0.06701155, -0.1088857, 3.280147, 1, 1, 1, 1, 1,
0.06713506, -0.7188652, 3.909802, 1, 1, 1, 1, 1,
0.07059756, -1.001012, 3.56583, 1, 1, 1, 1, 1,
0.07128891, 0.4160901, -1.610557, 1, 1, 1, 1, 1,
0.07255589, -0.05406945, 1.074248, 1, 1, 1, 1, 1,
0.07687224, 0.2921053, 0.07544849, 0, 0, 1, 1, 1,
0.07751545, 0.360957, 0.9269009, 1, 0, 0, 1, 1,
0.07923593, 0.09386913, -0.3678094, 1, 0, 0, 1, 1,
0.08253369, 0.6685045, -0.272649, 1, 0, 0, 1, 1,
0.08437898, -0.1076759, 3.097403, 1, 0, 0, 1, 1,
0.08494983, 1.156507, 1.744232, 1, 0, 0, 1, 1,
0.085082, -0.178303, 3.280555, 0, 0, 0, 1, 1,
0.09113982, -0.8027109, 2.719755, 0, 0, 0, 1, 1,
0.09541544, -1.4272, 2.345676, 0, 0, 0, 1, 1,
0.09618033, 0.5093828, 0.947664, 0, 0, 0, 1, 1,
0.0996284, 0.05588917, 0.0979621, 0, 0, 0, 1, 1,
0.1018087, -0.7047765, 3.641987, 0, 0, 0, 1, 1,
0.1025232, 0.6128082, 0.5941063, 0, 0, 0, 1, 1,
0.105988, -0.924496, 2.833736, 1, 1, 1, 1, 1,
0.1097972, -0.142985, 2.393458, 1, 1, 1, 1, 1,
0.115922, 0.921246, 1.100916, 1, 1, 1, 1, 1,
0.1196386, 0.2809592, -0.9278438, 1, 1, 1, 1, 1,
0.1246144, 0.8217555, -2.721492, 1, 1, 1, 1, 1,
0.1255816, -0.3612359, 2.282933, 1, 1, 1, 1, 1,
0.1295479, -0.279529, 4.048859, 1, 1, 1, 1, 1,
0.1346843, 0.9646834, 0.4586489, 1, 1, 1, 1, 1,
0.1360388, -1.948819, 3.892674, 1, 1, 1, 1, 1,
0.1369542, -1.263268, 4.733364, 1, 1, 1, 1, 1,
0.144254, 0.4252038, -0.3880364, 1, 1, 1, 1, 1,
0.1539104, 1.865176, -0.1826477, 1, 1, 1, 1, 1,
0.1576907, 2.964005, -0.7929714, 1, 1, 1, 1, 1,
0.1610035, -0.7966119, 5.492642, 1, 1, 1, 1, 1,
0.1762471, 0.6035044, 0.3889229, 1, 1, 1, 1, 1,
0.1831572, 0.5426667, 1.740324, 0, 0, 1, 1, 1,
0.1855881, 0.299236, -0.1609218, 1, 0, 0, 1, 1,
0.1866678, -1.033255, 3.384181, 1, 0, 0, 1, 1,
0.1893089, -0.8182461, 2.941944, 1, 0, 0, 1, 1,
0.1897342, -0.7985065, 2.120376, 1, 0, 0, 1, 1,
0.1916982, -0.5170598, 4.541178, 1, 0, 0, 1, 1,
0.1933998, 0.6793654, 1.530944, 0, 0, 0, 1, 1,
0.1936726, -0.8614147, 2.911683, 0, 0, 0, 1, 1,
0.195931, 0.2742306, -0.7920241, 0, 0, 0, 1, 1,
0.1968499, -0.4503173, 2.891837, 0, 0, 0, 1, 1,
0.1978452, -0.708356, 1.343036, 0, 0, 0, 1, 1,
0.198734, -0.3666116, 4.241014, 0, 0, 0, 1, 1,
0.2020195, -0.8950627, 2.784625, 0, 0, 0, 1, 1,
0.2044351, -1.056332, 4.692795, 1, 1, 1, 1, 1,
0.2090211, -0.1966568, 3.988465, 1, 1, 1, 1, 1,
0.2096568, 0.1969608, 0.03967774, 1, 1, 1, 1, 1,
0.209907, -1.652997, 4.093301, 1, 1, 1, 1, 1,
0.2109126, 1.726553, -0.3963116, 1, 1, 1, 1, 1,
0.2134404, -1.76886, 2.686897, 1, 1, 1, 1, 1,
0.2137546, -0.1043926, 0.8288322, 1, 1, 1, 1, 1,
0.2146413, 0.9733571, 0.03790031, 1, 1, 1, 1, 1,
0.2147924, -0.9530532, 2.061276, 1, 1, 1, 1, 1,
0.2168934, 0.07923255, 1.459079, 1, 1, 1, 1, 1,
0.2198719, 0.2244473, 0.9560321, 1, 1, 1, 1, 1,
0.2218405, 0.5361578, 0.1491442, 1, 1, 1, 1, 1,
0.226055, -0.4034518, 3.88667, 1, 1, 1, 1, 1,
0.2260873, 1.107756, 1.83349, 1, 1, 1, 1, 1,
0.2266387, -0.8152716, 2.353273, 1, 1, 1, 1, 1,
0.2267823, -0.2172556, 3.702969, 0, 0, 1, 1, 1,
0.2306304, -0.999242, 2.388064, 1, 0, 0, 1, 1,
0.2329942, -0.4805281, 1.78822, 1, 0, 0, 1, 1,
0.2343683, -1.068655, 3.295311, 1, 0, 0, 1, 1,
0.2357746, 0.9507707, 0.9375496, 1, 0, 0, 1, 1,
0.2438742, 0.3067699, -0.1104971, 1, 0, 0, 1, 1,
0.2478755, 0.2848996, 1.597521, 0, 0, 0, 1, 1,
0.2495873, 0.8521593, 0.8901821, 0, 0, 0, 1, 1,
0.2519284, 0.66158, 0.08456063, 0, 0, 0, 1, 1,
0.2547865, -1.127236, 2.190799, 0, 0, 0, 1, 1,
0.255684, 2.09793, 0.4666632, 0, 0, 0, 1, 1,
0.2571894, 0.5726858, 1.063221, 0, 0, 0, 1, 1,
0.2574806, -0.7127138, 1.58773, 0, 0, 0, 1, 1,
0.261855, -0.7962995, 3.831161, 1, 1, 1, 1, 1,
0.2641468, -0.4134211, 2.400864, 1, 1, 1, 1, 1,
0.2663507, -2.046335, 3.186791, 1, 1, 1, 1, 1,
0.2677189, -0.06863385, 2.194538, 1, 1, 1, 1, 1,
0.2704442, -0.3896449, 1.677066, 1, 1, 1, 1, 1,
0.2712102, 0.7936185, 1.312971, 1, 1, 1, 1, 1,
0.2715305, -0.5632744, 2.410809, 1, 1, 1, 1, 1,
0.2771977, -0.2657024, 0.2519069, 1, 1, 1, 1, 1,
0.2779968, 0.8205473, 0.703541, 1, 1, 1, 1, 1,
0.2789789, -2.211407, 2.434158, 1, 1, 1, 1, 1,
0.2824043, -1.290108, 2.248838, 1, 1, 1, 1, 1,
0.2875997, -0.5349494, 1.875983, 1, 1, 1, 1, 1,
0.2900532, 1.571801, -0.7302098, 1, 1, 1, 1, 1,
0.2915728, 0.9676256, 1.14919, 1, 1, 1, 1, 1,
0.2933542, 0.09442769, 2.424658, 1, 1, 1, 1, 1,
0.299649, 0.9147497, -0.7272706, 0, 0, 1, 1, 1,
0.3003598, -0.827612, 1.300084, 1, 0, 0, 1, 1,
0.3008871, -1.653637, 4.603889, 1, 0, 0, 1, 1,
0.301264, -0.00579718, 0.1349458, 1, 0, 0, 1, 1,
0.3012969, 0.01671034, 1.796536, 1, 0, 0, 1, 1,
0.3074257, -0.7826599, 3.451775, 1, 0, 0, 1, 1,
0.3074569, 0.5038368, 0.04742776, 0, 0, 0, 1, 1,
0.3080294, 0.5962475, -0.2172257, 0, 0, 0, 1, 1,
0.3080926, -1.380403, 2.215891, 0, 0, 0, 1, 1,
0.3100654, 0.2384113, -0.3054038, 0, 0, 0, 1, 1,
0.311767, 1.780145, 0.9198595, 0, 0, 0, 1, 1,
0.3122332, 0.2774082, 1.009771, 0, 0, 0, 1, 1,
0.3138028, 0.6780483, 1.647577, 0, 0, 0, 1, 1,
0.3155306, -0.1716249, 1.324069, 1, 1, 1, 1, 1,
0.3268166, 0.3398511, 0.1489399, 1, 1, 1, 1, 1,
0.3277398, 0.1218111, 0.9172199, 1, 1, 1, 1, 1,
0.3278977, 1.386921, -2.41149, 1, 1, 1, 1, 1,
0.3304186, -2.290358, 5.027336, 1, 1, 1, 1, 1,
0.3310676, -0.2328478, 1.364508, 1, 1, 1, 1, 1,
0.3366527, -1.352076, 3.140571, 1, 1, 1, 1, 1,
0.3513281, 0.2770817, -0.5164293, 1, 1, 1, 1, 1,
0.3534229, 0.08933323, 2.195195, 1, 1, 1, 1, 1,
0.3585255, -0.6955296, 1.375982, 1, 1, 1, 1, 1,
0.3586397, -0.03017692, -0.1908763, 1, 1, 1, 1, 1,
0.359906, -0.03991011, 2.537943, 1, 1, 1, 1, 1,
0.3627586, -1.550026, 1.534157, 1, 1, 1, 1, 1,
0.3638662, 0.2947705, 0.1587631, 1, 1, 1, 1, 1,
0.3654686, -0.6425374, 2.409867, 1, 1, 1, 1, 1,
0.3662545, -0.5759218, 1.764391, 0, 0, 1, 1, 1,
0.3746012, -0.1600484, 4.284472, 1, 0, 0, 1, 1,
0.376461, -0.2116238, 2.428437, 1, 0, 0, 1, 1,
0.3853261, -0.2135589, 1.942204, 1, 0, 0, 1, 1,
0.3875754, -0.841534, 5.015369, 1, 0, 0, 1, 1,
0.3894948, 0.06703862, 1.995578, 1, 0, 0, 1, 1,
0.3926015, 0.7649807, 0.7362287, 0, 0, 0, 1, 1,
0.3937783, 1.323745, 1.846697, 0, 0, 0, 1, 1,
0.3986694, -0.1155104, 0.935308, 0, 0, 0, 1, 1,
0.4065832, -0.04498231, 1.361644, 0, 0, 0, 1, 1,
0.4095806, -0.6758664, 1.312184, 0, 0, 0, 1, 1,
0.4120067, -0.3257124, 0.797873, 0, 0, 0, 1, 1,
0.4182016, -0.6614937, 1.917525, 0, 0, 0, 1, 1,
0.4320701, 1.440224, 1.005504, 1, 1, 1, 1, 1,
0.4332367, 0.3533251, 1.318751, 1, 1, 1, 1, 1,
0.4367521, -0.495434, 3.082739, 1, 1, 1, 1, 1,
0.4387073, 2.079327, 0.09139205, 1, 1, 1, 1, 1,
0.4397126, -0.3878246, 2.313146, 1, 1, 1, 1, 1,
0.4436636, -1.103773, 1.749169, 1, 1, 1, 1, 1,
0.4469659, 0.2136153, 0.4177803, 1, 1, 1, 1, 1,
0.4506724, -0.5864387, 3.212067, 1, 1, 1, 1, 1,
0.4521368, -1.3077, 2.601237, 1, 1, 1, 1, 1,
0.4533712, 0.1576132, 0.8956806, 1, 1, 1, 1, 1,
0.4616921, 0.6064297, 1.244796, 1, 1, 1, 1, 1,
0.4617195, -1.931159, 2.15746, 1, 1, 1, 1, 1,
0.4641239, -1.351874, 2.526509, 1, 1, 1, 1, 1,
0.4732179, 0.5284323, 2.902054, 1, 1, 1, 1, 1,
0.4819292, -1.420688, 1.219754, 1, 1, 1, 1, 1,
0.4852252, -0.4372879, 0.1643211, 0, 0, 1, 1, 1,
0.4908375, -0.4055092, 1.526873, 1, 0, 0, 1, 1,
0.4949589, -1.123029, 3.718367, 1, 0, 0, 1, 1,
0.4978305, -1.999516, 2.678762, 1, 0, 0, 1, 1,
0.5008398, -1.009114, 2.232242, 1, 0, 0, 1, 1,
0.5018162, 0.3050252, 1.384823, 1, 0, 0, 1, 1,
0.5043843, 0.7269744, 2.071083, 0, 0, 0, 1, 1,
0.505887, 0.80045, 2.969721, 0, 0, 0, 1, 1,
0.5066447, -0.891717, 1.740227, 0, 0, 0, 1, 1,
0.5103987, -0.4316415, 1.363292, 0, 0, 0, 1, 1,
0.5132366, -1.529019, 3.384591, 0, 0, 0, 1, 1,
0.5140548, -1.122066, 1.604724, 0, 0, 0, 1, 1,
0.5305046, -0.3626052, 1.585734, 0, 0, 0, 1, 1,
0.5309584, 0.5676568, 1.873502, 1, 1, 1, 1, 1,
0.5326262, -0.7174412, 4.230415, 1, 1, 1, 1, 1,
0.5404644, 0.8625906, -0.03987366, 1, 1, 1, 1, 1,
0.5470482, -1.891982, 3.496918, 1, 1, 1, 1, 1,
0.5544803, 0.06194336, 1.036234, 1, 1, 1, 1, 1,
0.5548415, 0.1061048, 0.6492913, 1, 1, 1, 1, 1,
0.556658, -0.6777903, 3.685411, 1, 1, 1, 1, 1,
0.5578663, 1.208171, 0.5251701, 1, 1, 1, 1, 1,
0.5613844, 1.487816, 0.2293528, 1, 1, 1, 1, 1,
0.5623159, -1.372933, 2.078966, 1, 1, 1, 1, 1,
0.5658065, -1.635826, 3.811067, 1, 1, 1, 1, 1,
0.5660936, 0.1144691, 1.16018, 1, 1, 1, 1, 1,
0.5670468, -0.3892846, 2.575507, 1, 1, 1, 1, 1,
0.5698375, -1.917378, 2.279686, 1, 1, 1, 1, 1,
0.5734159, -0.6311594, -0.03319368, 1, 1, 1, 1, 1,
0.5757402, 0.3785604, 0.5930151, 0, 0, 1, 1, 1,
0.5845175, 0.9941982, 0.1821682, 1, 0, 0, 1, 1,
0.5884063, -1.074215, 2.670141, 1, 0, 0, 1, 1,
0.5950612, 0.3890259, 0.4252933, 1, 0, 0, 1, 1,
0.5979154, -1.216032, 1.989332, 1, 0, 0, 1, 1,
0.5980827, 0.0395111, 3.20463, 1, 0, 0, 1, 1,
0.6008224, -0.421575, 1.708699, 0, 0, 0, 1, 1,
0.6036052, -0.7694428, 3.337394, 0, 0, 0, 1, 1,
0.6042833, -0.1131667, 0.2107062, 0, 0, 0, 1, 1,
0.6082579, 0.1304926, 1.821885, 0, 0, 0, 1, 1,
0.6096821, 1.261692, 0.8042316, 0, 0, 0, 1, 1,
0.6104823, 0.9695333, 1.917763, 0, 0, 0, 1, 1,
0.614998, -0.7745771, 2.359199, 0, 0, 0, 1, 1,
0.6157244, -0.3376973, 0.3833365, 1, 1, 1, 1, 1,
0.6204855, 0.6079111, 1.114607, 1, 1, 1, 1, 1,
0.6231693, -1.777848, 0.8821852, 1, 1, 1, 1, 1,
0.6241624, -0.1135769, 3.407472, 1, 1, 1, 1, 1,
0.628703, 1.137265, 2.156371, 1, 1, 1, 1, 1,
0.6305454, -1.148013, 4.412169, 1, 1, 1, 1, 1,
0.630617, 0.297014, 0.6899718, 1, 1, 1, 1, 1,
0.6316144, -0.370827, 1.997866, 1, 1, 1, 1, 1,
0.6371732, -0.4254372, 2.434105, 1, 1, 1, 1, 1,
0.6372545, -0.494235, 4.151233, 1, 1, 1, 1, 1,
0.645611, -0.7510938, 3.047723, 1, 1, 1, 1, 1,
0.6457231, 0.3509993, -0.2461525, 1, 1, 1, 1, 1,
0.6471723, 1.541033, 1.110869, 1, 1, 1, 1, 1,
0.6472689, 0.6009967, 1.008398, 1, 1, 1, 1, 1,
0.6549007, 0.2861978, 2.74217, 1, 1, 1, 1, 1,
0.6601784, -1.521394, 4.579828, 0, 0, 1, 1, 1,
0.6633979, 0.9214083, -0.2607745, 1, 0, 0, 1, 1,
0.6635696, 0.2851207, -0.1679249, 1, 0, 0, 1, 1,
0.6657861, 0.03568247, 1.922538, 1, 0, 0, 1, 1,
0.6692917, 0.9190101, 0.4001661, 1, 0, 0, 1, 1,
0.6704058, -0.8807474, 1.96902, 1, 0, 0, 1, 1,
0.6777757, 0.1470011, 1.279009, 0, 0, 0, 1, 1,
0.6800364, -0.1085057, 1.000991, 0, 0, 0, 1, 1,
0.684113, -0.03101642, 1.653276, 0, 0, 0, 1, 1,
0.6870247, 0.5525486, -0.3783089, 0, 0, 0, 1, 1,
0.6872483, -0.7075537, 1.759086, 0, 0, 0, 1, 1,
0.6872561, 1.869986, 0.2075944, 0, 0, 0, 1, 1,
0.6908597, 0.3499489, 1.410341, 0, 0, 0, 1, 1,
0.6934502, -0.6808932, 1.873981, 1, 1, 1, 1, 1,
0.6945676, -1.312905, 3.898475, 1, 1, 1, 1, 1,
0.6960957, -0.4767006, 1.686115, 1, 1, 1, 1, 1,
0.6994134, -0.4355458, 0.3266632, 1, 1, 1, 1, 1,
0.704999, -2.176723, 2.937312, 1, 1, 1, 1, 1,
0.7087138, -0.6750616, 2.163087, 1, 1, 1, 1, 1,
0.7140713, -1.36464, 3.458496, 1, 1, 1, 1, 1,
0.7147609, -0.4626999, 3.054407, 1, 1, 1, 1, 1,
0.715867, 0.06216362, 1.679522, 1, 1, 1, 1, 1,
0.7189065, -0.03631048, 1.772434, 1, 1, 1, 1, 1,
0.7202146, 0.9193583, -0.1128014, 1, 1, 1, 1, 1,
0.7203678, 0.4459583, 0.1489775, 1, 1, 1, 1, 1,
0.7205877, -0.313648, 0.4690979, 1, 1, 1, 1, 1,
0.7264859, -0.1549726, 2.27406, 1, 1, 1, 1, 1,
0.7265057, -0.2098093, 3.720118, 1, 1, 1, 1, 1,
0.7285814, -0.691821, 2.626428, 0, 0, 1, 1, 1,
0.7290943, 0.2778094, 0.1323675, 1, 0, 0, 1, 1,
0.7348697, 1.464665, -0.201051, 1, 0, 0, 1, 1,
0.7371504, -0.6213108, 3.255011, 1, 0, 0, 1, 1,
0.73973, -0.7115039, 1.434987, 1, 0, 0, 1, 1,
0.7440838, 0.5328938, 3.534758, 1, 0, 0, 1, 1,
0.7470888, -1.296194, 2.02387, 0, 0, 0, 1, 1,
0.7476698, 0.2009257, 0.3606728, 0, 0, 0, 1, 1,
0.7484182, 0.3484578, -0.3106221, 0, 0, 0, 1, 1,
0.7491426, -1.162438, 4.370177, 0, 0, 0, 1, 1,
0.7583145, -0.7910784, 2.222644, 0, 0, 0, 1, 1,
0.7680634, 1.868254, 0.4249045, 0, 0, 0, 1, 1,
0.7683392, -0.1167004, 0.7078407, 0, 0, 0, 1, 1,
0.7709139, 0.5192066, -0.7987171, 1, 1, 1, 1, 1,
0.7746284, 0.8066412, 2.58258, 1, 1, 1, 1, 1,
0.787521, -0.5598786, -0.2881151, 1, 1, 1, 1, 1,
0.7893627, 0.08262977, 0.9413638, 1, 1, 1, 1, 1,
0.793855, 0.8846551, 1.239714, 1, 1, 1, 1, 1,
0.8017627, 0.5188526, 2.020534, 1, 1, 1, 1, 1,
0.8019162, 0.857586, 0.8290762, 1, 1, 1, 1, 1,
0.8042794, 0.9323974, 0.04935526, 1, 1, 1, 1, 1,
0.8048835, 1.173102, 2.082267, 1, 1, 1, 1, 1,
0.8107195, 0.933858, 1.328416, 1, 1, 1, 1, 1,
0.8144535, 0.5223935, 0.382641, 1, 1, 1, 1, 1,
0.815878, -1.25311, 2.759264, 1, 1, 1, 1, 1,
0.8188379, -1.056179, 3.361336, 1, 1, 1, 1, 1,
0.8254001, -0.8895605, 3.117684, 1, 1, 1, 1, 1,
0.8258047, -0.6516287, 0.976998, 1, 1, 1, 1, 1,
0.8265607, 1.025195, 1.255806, 0, 0, 1, 1, 1,
0.8279613, 0.5630233, 0.3656354, 1, 0, 0, 1, 1,
0.8290573, -0.3416996, 2.015273, 1, 0, 0, 1, 1,
0.8326009, -0.4436708, 0.649323, 1, 0, 0, 1, 1,
0.8331574, -0.6198189, 2.885255, 1, 0, 0, 1, 1,
0.8341885, 0.04629137, 0.6879444, 1, 0, 0, 1, 1,
0.8349876, 0.8488615, -0.4885391, 0, 0, 0, 1, 1,
0.835111, -0.7244919, 2.282429, 0, 0, 0, 1, 1,
0.8363286, -1.088263, 3.686618, 0, 0, 0, 1, 1,
0.8416771, -0.4348536, 2.668561, 0, 0, 0, 1, 1,
0.846426, -0.4970091, 0.870029, 0, 0, 0, 1, 1,
0.8488346, 0.5970361, 0.7186939, 0, 0, 0, 1, 1,
0.8635316, -1.784503, 3.692939, 0, 0, 0, 1, 1,
0.8665855, 1.053655, -0.002026434, 1, 1, 1, 1, 1,
0.8665971, 0.3570632, -1.095932, 1, 1, 1, 1, 1,
0.8762618, 0.5431157, 1.277374, 1, 1, 1, 1, 1,
0.8785516, 0.3341901, 2.7776, 1, 1, 1, 1, 1,
0.8785807, -0.6227109, 3.166385, 1, 1, 1, 1, 1,
0.8796198, -0.1796348, 2.303208, 1, 1, 1, 1, 1,
0.8802419, -0.4758565, 2.278345, 1, 1, 1, 1, 1,
0.8836789, 1.045473, -1.533913, 1, 1, 1, 1, 1,
0.8883188, -0.5269085, 1.395913, 1, 1, 1, 1, 1,
0.8935522, -0.9239275, 1.933384, 1, 1, 1, 1, 1,
0.8955007, -0.7151448, 3.308791, 1, 1, 1, 1, 1,
0.8994664, 1.05915, -0.4567128, 1, 1, 1, 1, 1,
0.9001703, -0.06216751, 2.890585, 1, 1, 1, 1, 1,
0.9049673, 0.1612277, 0.5014241, 1, 1, 1, 1, 1,
0.915341, 0.8152657, 3.774221, 1, 1, 1, 1, 1,
0.916141, 0.2137344, 0.8496311, 0, 0, 1, 1, 1,
0.9227818, 0.5322844, 1.379014, 1, 0, 0, 1, 1,
0.9277914, -0.1173271, 2.52705, 1, 0, 0, 1, 1,
0.9289564, -1.419573, 3.337778, 1, 0, 0, 1, 1,
0.9298549, -0.161408, 1.658207, 1, 0, 0, 1, 1,
0.9302766, -0.1645204, 1.139961, 1, 0, 0, 1, 1,
0.9309708, -2.067453, 3.481169, 0, 0, 0, 1, 1,
0.9316639, -0.5336071, 2.885555, 0, 0, 0, 1, 1,
0.9316748, 0.7138996, 1.42062, 0, 0, 0, 1, 1,
0.9362524, 0.8238261, 1.047024, 0, 0, 0, 1, 1,
0.9440278, -0.1341253, -0.3334267, 0, 0, 0, 1, 1,
0.9441106, 0.6481618, -0.7059219, 0, 0, 0, 1, 1,
0.9554722, -1.107502, 1.637875, 0, 0, 0, 1, 1,
0.9565759, -0.1940267, 1.672345, 1, 1, 1, 1, 1,
0.9601087, 0.2291172, 0.5948315, 1, 1, 1, 1, 1,
0.9606363, -0.4701678, 1.060627, 1, 1, 1, 1, 1,
0.9674062, -1.632553, 2.61665, 1, 1, 1, 1, 1,
0.9703582, 2.12375, -1.99156, 1, 1, 1, 1, 1,
0.9735653, -0.9500124, 1.048235, 1, 1, 1, 1, 1,
0.9757861, -1.273452, 2.956056, 1, 1, 1, 1, 1,
0.9785216, -0.8130438, 3.603099, 1, 1, 1, 1, 1,
0.9819447, 0.1261604, 2.487796, 1, 1, 1, 1, 1,
0.9827571, -0.8786553, 2.962251, 1, 1, 1, 1, 1,
0.9845007, 2.354233, 0.5057473, 1, 1, 1, 1, 1,
0.9889321, 1.073238, 0.8983281, 1, 1, 1, 1, 1,
0.9911093, -0.4456385, 2.643683, 1, 1, 1, 1, 1,
0.9914795, -0.6364624, 1.578181, 1, 1, 1, 1, 1,
1.012622, -0.1811799, 1.756641, 1, 1, 1, 1, 1,
1.012779, -1.296676, 3.505846, 0, 0, 1, 1, 1,
1.012919, -0.9395455, 2.191413, 1, 0, 0, 1, 1,
1.014807, 1.78734, 1.21065, 1, 0, 0, 1, 1,
1.015339, 0.5430769, -0.9392015, 1, 0, 0, 1, 1,
1.030146, 1.402075, 1.599976, 1, 0, 0, 1, 1,
1.03664, -0.02550444, 1.011485, 1, 0, 0, 1, 1,
1.044339, 0.05502335, 0.1246484, 0, 0, 0, 1, 1,
1.04995, -1.570665, 2.208067, 0, 0, 0, 1, 1,
1.055884, 0.4075974, 3.102547, 0, 0, 0, 1, 1,
1.058376, 0.6084197, 1.253213, 0, 0, 0, 1, 1,
1.058736, 0.9081746, 1.307442, 0, 0, 0, 1, 1,
1.065261, 0.7647946, -0.1810351, 0, 0, 0, 1, 1,
1.066411, 1.079231, 0.3817879, 0, 0, 0, 1, 1,
1.073138, -0.1568012, 0.8886274, 1, 1, 1, 1, 1,
1.079944, 0.1647726, 1.608608, 1, 1, 1, 1, 1,
1.082764, -1.21393, 2.78065, 1, 1, 1, 1, 1,
1.087454, -0.1689545, 2.193776, 1, 1, 1, 1, 1,
1.091669, 0.6929401, 2.851506, 1, 1, 1, 1, 1,
1.097854, -1.799091, 3.291507, 1, 1, 1, 1, 1,
1.098096, 0.08083621, 2.292482, 1, 1, 1, 1, 1,
1.106713, 0.03436008, 1.390886, 1, 1, 1, 1, 1,
1.12333, 0.5936236, 0.4819635, 1, 1, 1, 1, 1,
1.126193, -1.026006, 3.402059, 1, 1, 1, 1, 1,
1.134703, 0.3727503, 1.217237, 1, 1, 1, 1, 1,
1.139288, -0.5874996, 1.155334, 1, 1, 1, 1, 1,
1.154177, 0.392228, 1.955402, 1, 1, 1, 1, 1,
1.155144, -0.4114056, 2.981143, 1, 1, 1, 1, 1,
1.155465, -0.5444981, 2.018011, 1, 1, 1, 1, 1,
1.184142, -0.3055188, 1.278951, 0, 0, 1, 1, 1,
1.193185, 0.2314314, 1.436147, 1, 0, 0, 1, 1,
1.193412, 0.146607, 2.704761, 1, 0, 0, 1, 1,
1.204703, 0.1602298, 2.693363, 1, 0, 0, 1, 1,
1.207527, -0.4864037, 1.480868, 1, 0, 0, 1, 1,
1.215631, -0.2415739, 1.606242, 1, 0, 0, 1, 1,
1.218626, -0.1650507, 1.662911, 0, 0, 0, 1, 1,
1.227612, -1.994508, 3.473228, 0, 0, 0, 1, 1,
1.239447, 0.2988146, 1.471868, 0, 0, 0, 1, 1,
1.245115, 1.080205, 0.3352936, 0, 0, 0, 1, 1,
1.249547, -1.1903, 1.44729, 0, 0, 0, 1, 1,
1.250427, 0.1966201, 1.385253, 0, 0, 0, 1, 1,
1.251563, 0.6952865, -0.628717, 0, 0, 0, 1, 1,
1.254121, 1.04033, 2.4798, 1, 1, 1, 1, 1,
1.262023, 0.7871956, 1.829133, 1, 1, 1, 1, 1,
1.266783, -1.111764, 2.530463, 1, 1, 1, 1, 1,
1.268517, 0.3424388, -0.794362, 1, 1, 1, 1, 1,
1.274865, 0.08795313, 1.558495, 1, 1, 1, 1, 1,
1.283183, -0.5283996, 2.375186, 1, 1, 1, 1, 1,
1.290558, -0.9909574, 4.721365, 1, 1, 1, 1, 1,
1.297335, -0.2188803, 1.822009, 1, 1, 1, 1, 1,
1.310809, 0.2468769, 0.3798399, 1, 1, 1, 1, 1,
1.31348, 0.4167116, 0.9160076, 1, 1, 1, 1, 1,
1.322491, 0.9460045, 1.069079, 1, 1, 1, 1, 1,
1.32512, -1.008007, 2.103949, 1, 1, 1, 1, 1,
1.326276, -0.4203248, 1.898078, 1, 1, 1, 1, 1,
1.339526, -0.4628819, 1.397161, 1, 1, 1, 1, 1,
1.34587, 0.4787559, 1.999473, 1, 1, 1, 1, 1,
1.359221, -0.4839333, 0.4897252, 0, 0, 1, 1, 1,
1.373601, -0.2615457, 0.9757441, 1, 0, 0, 1, 1,
1.374793, -0.02446151, 3.130941, 1, 0, 0, 1, 1,
1.380309, 1.105427, 1.136658, 1, 0, 0, 1, 1,
1.401019, 1.219724, 2.635154, 1, 0, 0, 1, 1,
1.403416, -0.2626778, 1.64649, 1, 0, 0, 1, 1,
1.41057, -0.09399269, 0.940905, 0, 0, 0, 1, 1,
1.411819, -0.715991, 1.729632, 0, 0, 0, 1, 1,
1.414728, 1.402466, 1.679301, 0, 0, 0, 1, 1,
1.415514, 0.2609108, 2.36158, 0, 0, 0, 1, 1,
1.417626, -0.8293292, 1.604892, 0, 0, 0, 1, 1,
1.425244, -0.6277708, 3.245348, 0, 0, 0, 1, 1,
1.425293, 0.6872762, 0.7376384, 0, 0, 0, 1, 1,
1.429227, 0.1814552, 1.418723, 1, 1, 1, 1, 1,
1.44675, 0.1722114, 3.155192, 1, 1, 1, 1, 1,
1.447733, 0.0465295, 1.453209, 1, 1, 1, 1, 1,
1.448113, -0.3296525, 2.649878, 1, 1, 1, 1, 1,
1.452424, -0.1298397, 2.69734, 1, 1, 1, 1, 1,
1.453663, -0.5467768, 2.718719, 1, 1, 1, 1, 1,
1.462799, -0.03037261, 2.509233, 1, 1, 1, 1, 1,
1.467477, 0.815778, 1.241042, 1, 1, 1, 1, 1,
1.469154, 1.028682, 1.352379, 1, 1, 1, 1, 1,
1.470454, 0.07596108, -0.3506467, 1, 1, 1, 1, 1,
1.47503, 0.7768738, 0.1948399, 1, 1, 1, 1, 1,
1.476137, 0.8200716, 1.280787, 1, 1, 1, 1, 1,
1.481162, -1.62511, 2.399837, 1, 1, 1, 1, 1,
1.483184, -2.742041, 2.247004, 1, 1, 1, 1, 1,
1.485345, 1.649352, 0.6498668, 1, 1, 1, 1, 1,
1.493412, 0.4707214, 2.177493, 0, 0, 1, 1, 1,
1.517475, -0.38797, 2.970404, 1, 0, 0, 1, 1,
1.523519, -0.3781705, 1.289506, 1, 0, 0, 1, 1,
1.523947, -1.408923, 2.551758, 1, 0, 0, 1, 1,
1.555234, -1.628444, 2.247756, 1, 0, 0, 1, 1,
1.560866, -0.6632733, 0.6849229, 1, 0, 0, 1, 1,
1.570893, 2.006089, -0.003373223, 0, 0, 0, 1, 1,
1.571314, -0.992463, 2.88995, 0, 0, 0, 1, 1,
1.585022, -0.1910689, 1.548082, 0, 0, 0, 1, 1,
1.597358, 2.270505, 0.8167883, 0, 0, 0, 1, 1,
1.600463, -1.501719, 2.586988, 0, 0, 0, 1, 1,
1.602322, 0.9799223, 2.275488, 0, 0, 0, 1, 1,
1.607376, -0.03628263, 2.520423, 0, 0, 0, 1, 1,
1.608431, -0.6868496, 1.12294, 1, 1, 1, 1, 1,
1.623589, -0.3254601, 1.102613, 1, 1, 1, 1, 1,
1.628613, 0.935492, 0.9559982, 1, 1, 1, 1, 1,
1.638043, 1.79431, 1.394431, 1, 1, 1, 1, 1,
1.646332, 0.9386316, 1.910263, 1, 1, 1, 1, 1,
1.64903, -0.5713925, 1.512398, 1, 1, 1, 1, 1,
1.654115, -1.160651, 2.09183, 1, 1, 1, 1, 1,
1.665339, 0.01197223, 0.7442278, 1, 1, 1, 1, 1,
1.667979, -1.160332, 2.453297, 1, 1, 1, 1, 1,
1.676893, -1.569494, 3.278746, 1, 1, 1, 1, 1,
1.678257, 1.21916, 1.068141, 1, 1, 1, 1, 1,
1.691484, 0.8429716, 2.427146, 1, 1, 1, 1, 1,
1.698686, 0.5094333, 0.2854734, 1, 1, 1, 1, 1,
1.715005, -0.3195634, 2.409953, 1, 1, 1, 1, 1,
1.715156, -1.428843, 1.679782, 1, 1, 1, 1, 1,
1.716515, 1.567852, 0.9942149, 0, 0, 1, 1, 1,
1.719795, -1.556626, 1.420409, 1, 0, 0, 1, 1,
1.736831, -0.2759993, 0.8748096, 1, 0, 0, 1, 1,
1.741622, 1.655892, 0.2714641, 1, 0, 0, 1, 1,
1.745885, 0.625214, 3.709564, 1, 0, 0, 1, 1,
1.772849, -0.8713552, 1.321394, 1, 0, 0, 1, 1,
1.784872, 0.4315908, 1.740535, 0, 0, 0, 1, 1,
1.785103, -0.1096606, 1.223965, 0, 0, 0, 1, 1,
1.813865, -1.923393, 1.785608, 0, 0, 0, 1, 1,
1.833534, 0.523443, 2.729214, 0, 0, 0, 1, 1,
1.858863, 0.2093989, 2.338414, 0, 0, 0, 1, 1,
1.873441, 0.8346797, 2.272507, 0, 0, 0, 1, 1,
1.880845, 0.1562598, 2.565357, 0, 0, 0, 1, 1,
1.911254, 0.2596772, 1.272007, 1, 1, 1, 1, 1,
1.922266, 1.070869, 1.249412, 1, 1, 1, 1, 1,
1.940436, 1.081463, 1.605614, 1, 1, 1, 1, 1,
1.959454, 0.8437935, 1.361755, 1, 1, 1, 1, 1,
1.967708, -0.2200693, 1.772228, 1, 1, 1, 1, 1,
1.969361, -0.386345, 1.50909, 1, 1, 1, 1, 1,
1.98477, 0.2465011, 1.430824, 1, 1, 1, 1, 1,
2.009639, -2.131936, 1.503969, 1, 1, 1, 1, 1,
2.014024, 0.2129184, 3.188369, 1, 1, 1, 1, 1,
2.02899, 1.744028, 0.6095431, 1, 1, 1, 1, 1,
2.050357, -0.9443478, 1.80689, 1, 1, 1, 1, 1,
2.051448, 0.6550177, 1.155957, 1, 1, 1, 1, 1,
2.095659, 0.64078, -0.09298983, 1, 1, 1, 1, 1,
2.107997, 1.680335, 0.7284644, 1, 1, 1, 1, 1,
2.127428, 0.9900419, 2.180939, 1, 1, 1, 1, 1,
2.160367, -0.6488274, 0.2202171, 0, 0, 1, 1, 1,
2.183833, 0.1124198, 0.5635843, 1, 0, 0, 1, 1,
2.187226, -1.267583, 0.2055767, 1, 0, 0, 1, 1,
2.189427, 0.5650641, 0.3414135, 1, 0, 0, 1, 1,
2.198861, -0.008949478, 3.374862, 1, 0, 0, 1, 1,
2.245985, -0.9605174, 1.906463, 1, 0, 0, 1, 1,
2.255286, 0.4348077, 0.4574338, 0, 0, 0, 1, 1,
2.259246, -0.6397053, 1.310241, 0, 0, 0, 1, 1,
2.265653, 2.703802, 1.739431, 0, 0, 0, 1, 1,
2.274202, 1.071594, 1.016096, 0, 0, 0, 1, 1,
2.336174, 1.0606, 0.9259273, 0, 0, 0, 1, 1,
2.370452, 0.6324651, 1.734671, 0, 0, 0, 1, 1,
2.403138, 1.748649, -0.3273186, 0, 0, 0, 1, 1,
2.494188, -0.1761495, 0.9105078, 1, 1, 1, 1, 1,
2.498466, 0.3444982, 2.520585, 1, 1, 1, 1, 1,
2.530619, 1.064501, 2.734676, 1, 1, 1, 1, 1,
2.5812, 1.53697, -0.3442621, 1, 1, 1, 1, 1,
2.806331, -0.2825159, 4.101335, 1, 1, 1, 1, 1,
2.809203, -0.1275859, 2.812603, 1, 1, 1, 1, 1,
3.463913, 0.2727247, 2.730293, 1, 1, 1, 1, 1
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
var radius = 9.641144;
var distance = 33.86411;
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
mvMatrix.translate( -0.1784563, 0.05186141, -0.2237868 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86411);
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
