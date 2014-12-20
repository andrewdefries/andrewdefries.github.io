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
-3.355474, -0.1389177, -3.249135, 1, 0, 0, 1,
-3.201193, 1.097234, -2.094824, 1, 0.007843138, 0, 1,
-3.166606, -1.058137, -4.452039, 1, 0.01176471, 0, 1,
-2.993602, -0.1618123, -2.020132, 1, 0.01960784, 0, 1,
-2.637967, 0.600372, -0.6968617, 1, 0.02352941, 0, 1,
-2.582949, 1.060387, -1.674227, 1, 0.03137255, 0, 1,
-2.538471, 1.682382, -0.1777377, 1, 0.03529412, 0, 1,
-2.531292, -0.9103153, -1.429182, 1, 0.04313726, 0, 1,
-2.438166, 1.661661, -1.703411, 1, 0.04705882, 0, 1,
-2.435778, -0.09199416, -2.771224, 1, 0.05490196, 0, 1,
-2.406065, -0.07563236, -0.4194221, 1, 0.05882353, 0, 1,
-2.364474, 1.299711, -0.2840146, 1, 0.06666667, 0, 1,
-2.340031, 0.4572584, -2.55607, 1, 0.07058824, 0, 1,
-2.303403, 1.033346, -1.735821, 1, 0.07843138, 0, 1,
-2.209891, -0.05262785, -0.7933607, 1, 0.08235294, 0, 1,
-2.167393, 1.220223, -0.917439, 1, 0.09019608, 0, 1,
-2.146915, 0.6653223, -0.2253647, 1, 0.09411765, 0, 1,
-2.094512, 0.439054, -2.721446, 1, 0.1019608, 0, 1,
-2.042725, 0.8503185, 0.4088275, 1, 0.1098039, 0, 1,
-1.984483, -0.8667477, -2.547738, 1, 0.1137255, 0, 1,
-1.965277, 0.1305949, -1.925977, 1, 0.1215686, 0, 1,
-1.90137, 0.7323914, -3.458768, 1, 0.1254902, 0, 1,
-1.888389, 0.2050416, -2.006939, 1, 0.1333333, 0, 1,
-1.873078, -1.157675, -2.396154, 1, 0.1372549, 0, 1,
-1.840477, 1.194769, 2.291731, 1, 0.145098, 0, 1,
-1.833102, -0.853763, -2.524112, 1, 0.1490196, 0, 1,
-1.815412, 1.108624, -0.7112508, 1, 0.1568628, 0, 1,
-1.809051, 0.9961524, -0.5337932, 1, 0.1607843, 0, 1,
-1.789168, 0.7977398, -2.838787, 1, 0.1686275, 0, 1,
-1.778379, 1.25676, -1.652168, 1, 0.172549, 0, 1,
-1.769922, -0.0334727, -2.818302, 1, 0.1803922, 0, 1,
-1.766267, -0.3425072, -1.378275, 1, 0.1843137, 0, 1,
-1.721594, -1.479049, -3.359878, 1, 0.1921569, 0, 1,
-1.689874, -0.4299557, -2.838878, 1, 0.1960784, 0, 1,
-1.67802, -0.4388542, -2.906911, 1, 0.2039216, 0, 1,
-1.676321, -0.2967803, -2.407629, 1, 0.2117647, 0, 1,
-1.665785, 0.6844847, -1.333737, 1, 0.2156863, 0, 1,
-1.657752, 0.2345187, -2.32288, 1, 0.2235294, 0, 1,
-1.647496, -0.4425448, -1.609276, 1, 0.227451, 0, 1,
-1.631051, 0.6707078, -2.317059, 1, 0.2352941, 0, 1,
-1.587404, 0.4102084, -0.7490896, 1, 0.2392157, 0, 1,
-1.58636, 0.7263368, -1.771829, 1, 0.2470588, 0, 1,
-1.580328, -0.2746119, -3.259186, 1, 0.2509804, 0, 1,
-1.571653, -0.1269656, -0.1495114, 1, 0.2588235, 0, 1,
-1.568844, 0.07426057, -0.7345942, 1, 0.2627451, 0, 1,
-1.554301, 0.04662273, -1.916357, 1, 0.2705882, 0, 1,
-1.533254, 0.6950683, -2.325092, 1, 0.2745098, 0, 1,
-1.517901, -0.2579708, -0.1748977, 1, 0.282353, 0, 1,
-1.506823, 0.4751, -1.034472, 1, 0.2862745, 0, 1,
-1.50506, -0.2107431, -1.635214, 1, 0.2941177, 0, 1,
-1.504076, 0.1145972, -2.901902, 1, 0.3019608, 0, 1,
-1.498595, -0.6664472, -0.7118038, 1, 0.3058824, 0, 1,
-1.493323, 1.118895, -1.140643, 1, 0.3137255, 0, 1,
-1.488609, -1.749465, -1.668787, 1, 0.3176471, 0, 1,
-1.479762, 0.3043724, -1.376386, 1, 0.3254902, 0, 1,
-1.474573, -0.1679689, 0.875286, 1, 0.3294118, 0, 1,
-1.469439, -0.788217, -2.632135, 1, 0.3372549, 0, 1,
-1.463249, -0.8605084, -2.888093, 1, 0.3411765, 0, 1,
-1.452244, 0.3138974, -0.2721014, 1, 0.3490196, 0, 1,
-1.451794, 1.137984, -3.34346, 1, 0.3529412, 0, 1,
-1.450134, -0.6688064, -1.078909, 1, 0.3607843, 0, 1,
-1.441306, -0.971733, -1.487602, 1, 0.3647059, 0, 1,
-1.425738, 0.2648605, -1.887778, 1, 0.372549, 0, 1,
-1.425217, -0.1367716, -1.486799, 1, 0.3764706, 0, 1,
-1.415523, -1.308258, -1.380103, 1, 0.3843137, 0, 1,
-1.400495, 1.163836, -0.7227695, 1, 0.3882353, 0, 1,
-1.392012, 0.3380848, -0.789726, 1, 0.3960784, 0, 1,
-1.391388, 0.2409588, -0.4156577, 1, 0.4039216, 0, 1,
-1.390834, 1.330774, -2.853776, 1, 0.4078431, 0, 1,
-1.385556, -0.2061536, -1.67483, 1, 0.4156863, 0, 1,
-1.381664, 0.325075, -2.587085, 1, 0.4196078, 0, 1,
-1.376122, -0.6308852, -2.367076, 1, 0.427451, 0, 1,
-1.372982, -1.954043, -3.599891, 1, 0.4313726, 0, 1,
-1.369147, 0.324959, -2.035117, 1, 0.4392157, 0, 1,
-1.368949, 1.192785, -2.000413, 1, 0.4431373, 0, 1,
-1.359202, 0.2247582, -0.1340453, 1, 0.4509804, 0, 1,
-1.350618, -0.06745465, -1.325859, 1, 0.454902, 0, 1,
-1.349625, 2.785468, -0.2594622, 1, 0.4627451, 0, 1,
-1.335495, 2.441558, -1.771914, 1, 0.4666667, 0, 1,
-1.332064, 0.731151, -1.437882, 1, 0.4745098, 0, 1,
-1.331652, -0.6126417, -1.108799, 1, 0.4784314, 0, 1,
-1.321293, -1.288092, -2.473838, 1, 0.4862745, 0, 1,
-1.317878, 0.6597669, -0.1312485, 1, 0.4901961, 0, 1,
-1.302901, 1.160678, -0.5835125, 1, 0.4980392, 0, 1,
-1.293391, 0.6851636, -1.539716, 1, 0.5058824, 0, 1,
-1.293365, 0.05206925, -2.052423, 1, 0.509804, 0, 1,
-1.292548, 0.7955318, -1.394954, 1, 0.5176471, 0, 1,
-1.287073, -0.5340163, -1.702353, 1, 0.5215687, 0, 1,
-1.274662, 1.31191, 0.6662661, 1, 0.5294118, 0, 1,
-1.273632, -0.7147119, -3.392976, 1, 0.5333334, 0, 1,
-1.270805, 0.6605773, -1.441084, 1, 0.5411765, 0, 1,
-1.254756, 0.9626736, -2.504928, 1, 0.5450981, 0, 1,
-1.234566, -0.4821955, -2.175228, 1, 0.5529412, 0, 1,
-1.229636, -0.7728915, -2.31622, 1, 0.5568628, 0, 1,
-1.222106, 0.1530188, -1.080431, 1, 0.5647059, 0, 1,
-1.218566, -0.4766114, -1.574752, 1, 0.5686275, 0, 1,
-1.217062, -1.449309, -2.83708, 1, 0.5764706, 0, 1,
-1.216324, 1.254051, -0.289292, 1, 0.5803922, 0, 1,
-1.186648, 1.539411, -1.406112, 1, 0.5882353, 0, 1,
-1.186004, 1.455073, -0.0935887, 1, 0.5921569, 0, 1,
-1.180526, 0.08014727, -1.606553, 1, 0.6, 0, 1,
-1.17888, -0.5799214, -3.122319, 1, 0.6078432, 0, 1,
-1.172612, 0.8253236, -2.53224, 1, 0.6117647, 0, 1,
-1.16889, -0.4186879, -1.930532, 1, 0.6196079, 0, 1,
-1.156986, -0.3628614, -2.714529, 1, 0.6235294, 0, 1,
-1.15045, 0.2942315, -3.849735, 1, 0.6313726, 0, 1,
-1.138962, 0.01857538, -1.90456, 1, 0.6352941, 0, 1,
-1.12509, -0.4231787, -1.216886, 1, 0.6431373, 0, 1,
-1.115498, -0.4560029, -1.688137, 1, 0.6470588, 0, 1,
-1.106624, 0.5532113, -0.7683355, 1, 0.654902, 0, 1,
-1.098574, 1.493184, -0.1533597, 1, 0.6588235, 0, 1,
-1.095387, -0.3531218, -3.465196, 1, 0.6666667, 0, 1,
-1.092654, 1.404777, -1.091941, 1, 0.6705883, 0, 1,
-1.084988, -0.2992223, -2.396494, 1, 0.6784314, 0, 1,
-1.083416, -0.4604684, -1.821193, 1, 0.682353, 0, 1,
-1.082808, 1.02394, -1.661685, 1, 0.6901961, 0, 1,
-1.062762, 1.71436, -1.263382, 1, 0.6941177, 0, 1,
-1.054417, -1.496559, -4.346728, 1, 0.7019608, 0, 1,
-1.054275, 0.1505676, -0.09808572, 1, 0.7098039, 0, 1,
-1.037761, -1.240702, -1.938369, 1, 0.7137255, 0, 1,
-1.032255, 0.2283315, -1.582989, 1, 0.7215686, 0, 1,
-1.029945, -0.1887326, -3.60758, 1, 0.7254902, 0, 1,
-1.029223, 1.284247, -0.02156089, 1, 0.7333333, 0, 1,
-1.0208, -0.4050896, -1.36264, 1, 0.7372549, 0, 1,
-1.020562, 1.085935, -1.056562, 1, 0.7450981, 0, 1,
-1.016864, -0.004095598, -0.08387515, 1, 0.7490196, 0, 1,
-1.011916, 0.3857347, -0.8582602, 1, 0.7568628, 0, 1,
-0.9970931, 0.6723529, -0.3326965, 1, 0.7607843, 0, 1,
-0.9944657, -0.02687798, -2.500905, 1, 0.7686275, 0, 1,
-0.9938042, 0.1613171, -3.020436, 1, 0.772549, 0, 1,
-0.9934027, -1.403872, -3.737979, 1, 0.7803922, 0, 1,
-0.9902598, -1.103395, -3.52867, 1, 0.7843137, 0, 1,
-0.9861404, 0.6419167, -1.038662, 1, 0.7921569, 0, 1,
-0.9804537, 2.343581, 0.7619053, 1, 0.7960784, 0, 1,
-0.9797438, -0.1784698, -2.453693, 1, 0.8039216, 0, 1,
-0.9787319, -0.8683326, -0.502171, 1, 0.8117647, 0, 1,
-0.9659983, -0.7551341, -2.186214, 1, 0.8156863, 0, 1,
-0.9637445, -0.2833061, 0.09624626, 1, 0.8235294, 0, 1,
-0.961014, -0.2135944, -3.165413, 1, 0.827451, 0, 1,
-0.9578367, -0.02148987, 0.3355016, 1, 0.8352941, 0, 1,
-0.9577246, -0.2629426, -1.738421, 1, 0.8392157, 0, 1,
-0.9556171, -1.390533, -1.904369, 1, 0.8470588, 0, 1,
-0.9553092, -0.6641409, -2.886363, 1, 0.8509804, 0, 1,
-0.9504592, -0.9469529, -2.472584, 1, 0.8588235, 0, 1,
-0.9446907, 0.1211388, -0.9311437, 1, 0.8627451, 0, 1,
-0.9441004, -1.090828, -4.520509, 1, 0.8705882, 0, 1,
-0.9439445, -1.017607, -1.636015, 1, 0.8745098, 0, 1,
-0.9402714, -1.594339, -2.498316, 1, 0.8823529, 0, 1,
-0.9363075, -0.600764, -3.153696, 1, 0.8862745, 0, 1,
-0.925281, -1.672615, -2.385446, 1, 0.8941177, 0, 1,
-0.9242867, -0.9441442, -2.006391, 1, 0.8980392, 0, 1,
-0.9232442, -2.687928, -2.785227, 1, 0.9058824, 0, 1,
-0.9180321, 0.887638, -1.46084, 1, 0.9137255, 0, 1,
-0.9156951, 2.04101, 0.8404147, 1, 0.9176471, 0, 1,
-0.9150511, 1.069299, -0.1102029, 1, 0.9254902, 0, 1,
-0.9117083, 0.9182869, -0.3077784, 1, 0.9294118, 0, 1,
-0.9055226, -0.6595093, -2.517544, 1, 0.9372549, 0, 1,
-0.9020671, 0.02303096, -1.247645, 1, 0.9411765, 0, 1,
-0.8998451, 0.6504031, -1.797547, 1, 0.9490196, 0, 1,
-0.8952339, -1.614787, -2.651872, 1, 0.9529412, 0, 1,
-0.8950706, -0.8018633, -1.131075, 1, 0.9607843, 0, 1,
-0.8936462, 0.6595451, -1.11437, 1, 0.9647059, 0, 1,
-0.8893096, 0.06952788, -3.417547, 1, 0.972549, 0, 1,
-0.8775485, -0.2436059, -0.6417113, 1, 0.9764706, 0, 1,
-0.8768274, -0.08585374, -1.785416, 1, 0.9843137, 0, 1,
-0.8731523, -0.7462488, -2.615575, 1, 0.9882353, 0, 1,
-0.8717905, 0.1270854, -0.257918, 1, 0.9960784, 0, 1,
-0.870599, 0.05093281, 0.3154156, 0.9960784, 1, 0, 1,
-0.8642346, 0.0903566, -1.582908, 0.9921569, 1, 0, 1,
-0.8631581, 0.1476115, -1.268879, 0.9843137, 1, 0, 1,
-0.8630223, -0.6010365, -1.165963, 0.9803922, 1, 0, 1,
-0.8625477, -0.5846029, -1.441146, 0.972549, 1, 0, 1,
-0.8572856, -0.7559386, -1.11648, 0.9686275, 1, 0, 1,
-0.8430281, -0.6051252, -2.09727, 0.9607843, 1, 0, 1,
-0.8429471, 0.6436111, 0.9780455, 0.9568627, 1, 0, 1,
-0.8418974, 1.191662, -0.9801037, 0.9490196, 1, 0, 1,
-0.8408768, 0.0508948, -1.638996, 0.945098, 1, 0, 1,
-0.840459, -0.3848948, -0.2080906, 0.9372549, 1, 0, 1,
-0.8404064, -1.486638, -1.832357, 0.9333333, 1, 0, 1,
-0.8336524, 1.278116, -2.485057, 0.9254902, 1, 0, 1,
-0.8257894, -0.05658744, -1.993025, 0.9215686, 1, 0, 1,
-0.824381, -0.0953983, -0.7640299, 0.9137255, 1, 0, 1,
-0.8221104, -0.5698783, -0.8462083, 0.9098039, 1, 0, 1,
-0.8219849, -0.4665352, -2.173398, 0.9019608, 1, 0, 1,
-0.8150353, -0.1608539, -2.460647, 0.8941177, 1, 0, 1,
-0.8104419, -0.04757285, 0.5240306, 0.8901961, 1, 0, 1,
-0.8081598, 1.903572, -1.78167, 0.8823529, 1, 0, 1,
-0.8041487, 0.2906846, -0.8783808, 0.8784314, 1, 0, 1,
-0.8023695, -1.147496, -2.877968, 0.8705882, 1, 0, 1,
-0.8017647, 0.5650162, -0.9642004, 0.8666667, 1, 0, 1,
-0.8004606, -1.733012, -2.837406, 0.8588235, 1, 0, 1,
-0.7979332, -1.547542, -1.613175, 0.854902, 1, 0, 1,
-0.7914915, 0.4517871, -0.7662139, 0.8470588, 1, 0, 1,
-0.7893494, -1.071131, -3.04955, 0.8431373, 1, 0, 1,
-0.7786601, 1.283251, -0.8730269, 0.8352941, 1, 0, 1,
-0.7756277, 1.621388, -0.4509952, 0.8313726, 1, 0, 1,
-0.7727309, 0.7509865, 0.1361714, 0.8235294, 1, 0, 1,
-0.7697786, -0.5797135, -1.638737, 0.8196079, 1, 0, 1,
-0.7685499, -0.5141612, -1.144681, 0.8117647, 1, 0, 1,
-0.7673478, 1.026697, 0.4802507, 0.8078431, 1, 0, 1,
-0.7640355, 0.7913812, -0.003898423, 0.8, 1, 0, 1,
-0.7611331, -0.1772035, -1.666807, 0.7921569, 1, 0, 1,
-0.7611128, -0.7734398, -2.389092, 0.7882353, 1, 0, 1,
-0.7607512, -0.1051858, -1.015517, 0.7803922, 1, 0, 1,
-0.7607302, -1.154754, -2.151389, 0.7764706, 1, 0, 1,
-0.7578157, -1.49046, -1.532271, 0.7686275, 1, 0, 1,
-0.7568559, 0.02113904, -1.42567, 0.7647059, 1, 0, 1,
-0.7544794, 2.108053, -1.083118, 0.7568628, 1, 0, 1,
-0.7536421, 0.5872256, -2.405248, 0.7529412, 1, 0, 1,
-0.7400588, 1.721775, 0.3268567, 0.7450981, 1, 0, 1,
-0.7327524, -1.174203, -1.29407, 0.7411765, 1, 0, 1,
-0.7284446, -0.7130563, -2.004242, 0.7333333, 1, 0, 1,
-0.7223684, 1.12559, -0.5910563, 0.7294118, 1, 0, 1,
-0.7165309, -0.5005668, -1.625584, 0.7215686, 1, 0, 1,
-0.7113543, 0.9594606, -1.0777, 0.7176471, 1, 0, 1,
-0.7104366, 1.764321, -0.06938802, 0.7098039, 1, 0, 1,
-0.7069498, -0.3155388, -3.435869, 0.7058824, 1, 0, 1,
-0.7066262, 0.1822341, -2.590589, 0.6980392, 1, 0, 1,
-0.7045172, -1.100962, -2.853564, 0.6901961, 1, 0, 1,
-0.6980847, 0.891863, -1.339185, 0.6862745, 1, 0, 1,
-0.6909927, -0.9756881, -3.58148, 0.6784314, 1, 0, 1,
-0.6909658, 1.773847, -1.646296, 0.6745098, 1, 0, 1,
-0.6903787, 0.8098494, -0.04971742, 0.6666667, 1, 0, 1,
-0.6880676, 1.615507, -1.371733, 0.6627451, 1, 0, 1,
-0.6872296, 0.7026083, -1.37283, 0.654902, 1, 0, 1,
-0.6866323, 1.937904, -0.4028012, 0.6509804, 1, 0, 1,
-0.6817471, 0.2119692, -0.6991687, 0.6431373, 1, 0, 1,
-0.6812769, -0.7510749, -1.429376, 0.6392157, 1, 0, 1,
-0.6790576, -0.6505064, -2.74448, 0.6313726, 1, 0, 1,
-0.6777666, -0.6591113, -2.644773, 0.627451, 1, 0, 1,
-0.676535, -0.2367701, -3.899386, 0.6196079, 1, 0, 1,
-0.6661276, -0.8407922, -3.324863, 0.6156863, 1, 0, 1,
-0.664892, -1.567333, -4.310559, 0.6078432, 1, 0, 1,
-0.6624998, -1.030931, -2.255517, 0.6039216, 1, 0, 1,
-0.6620026, -1.29867, -1.058776, 0.5960785, 1, 0, 1,
-0.6602077, 0.03882431, -1.558134, 0.5882353, 1, 0, 1,
-0.6549062, -0.6903145, -1.057883, 0.5843138, 1, 0, 1,
-0.6385908, 0.664817, -1.826967, 0.5764706, 1, 0, 1,
-0.6362529, 0.546905, 0.1335337, 0.572549, 1, 0, 1,
-0.6351053, 0.2774096, 0.07366142, 0.5647059, 1, 0, 1,
-0.6332576, -0.9277917, -2.541404, 0.5607843, 1, 0, 1,
-0.6301206, -0.5206236, -3.856638, 0.5529412, 1, 0, 1,
-0.6180022, 0.6844082, -1.465773, 0.5490196, 1, 0, 1,
-0.6135098, -0.6796623, -2.994872, 0.5411765, 1, 0, 1,
-0.6131405, -0.3236752, -1.923836, 0.5372549, 1, 0, 1,
-0.6114666, -0.8386534, -2.549726, 0.5294118, 1, 0, 1,
-0.6099222, 0.1720747, -1.889249, 0.5254902, 1, 0, 1,
-0.6054369, -0.4825031, -1.796451, 0.5176471, 1, 0, 1,
-0.6052645, 0.34065, -1.023306, 0.5137255, 1, 0, 1,
-0.6042604, 0.596452, -0.1838607, 0.5058824, 1, 0, 1,
-0.5996285, 0.03574071, -1.39424, 0.5019608, 1, 0, 1,
-0.5973263, -2.147623, -3.389904, 0.4941176, 1, 0, 1,
-0.5935724, -0.2237193, -2.196354, 0.4862745, 1, 0, 1,
-0.5932698, 1.080061, 0.1452609, 0.4823529, 1, 0, 1,
-0.5919744, 2.004823, -0.5711807, 0.4745098, 1, 0, 1,
-0.590719, -0.6522444, -2.576186, 0.4705882, 1, 0, 1,
-0.5883576, 1.225436, 0.7393613, 0.4627451, 1, 0, 1,
-0.5879297, -0.4521827, -2.124327, 0.4588235, 1, 0, 1,
-0.5782778, 0.04695253, -4.305934, 0.4509804, 1, 0, 1,
-0.5766708, 0.876781, -2.841665, 0.4470588, 1, 0, 1,
-0.5766441, 1.215024, -3.440498, 0.4392157, 1, 0, 1,
-0.5760285, -0.9896843, -2.869595, 0.4352941, 1, 0, 1,
-0.5755079, 0.2840592, 0.7343621, 0.427451, 1, 0, 1,
-0.5716301, 0.6289943, -0.4068489, 0.4235294, 1, 0, 1,
-0.570364, -1.443201, -0.9549373, 0.4156863, 1, 0, 1,
-0.5668798, -1.303579, -2.633611, 0.4117647, 1, 0, 1,
-0.5651159, 1.663391, -2.170568, 0.4039216, 1, 0, 1,
-0.5632783, 1.43033, -0.110822, 0.3960784, 1, 0, 1,
-0.5615736, 1.351349, -1.272895, 0.3921569, 1, 0, 1,
-0.561185, 0.9017842, 0.9790283, 0.3843137, 1, 0, 1,
-0.5585718, 0.7111735, -0.935262, 0.3803922, 1, 0, 1,
-0.5555404, -0.4024691, -1.955567, 0.372549, 1, 0, 1,
-0.5528328, 0.5475413, 0.4756588, 0.3686275, 1, 0, 1,
-0.5520933, -0.05294783, -0.8206165, 0.3607843, 1, 0, 1,
-0.5506854, 0.400812, -0.3735579, 0.3568628, 1, 0, 1,
-0.5502723, -1.0119, -2.440299, 0.3490196, 1, 0, 1,
-0.5462888, 1.56137, 0.4682381, 0.345098, 1, 0, 1,
-0.5451992, -0.5355088, -1.330784, 0.3372549, 1, 0, 1,
-0.5450938, -1.444457, -2.758497, 0.3333333, 1, 0, 1,
-0.5440047, -0.1442471, -2.239386, 0.3254902, 1, 0, 1,
-0.5406372, 0.872251, -1.19587, 0.3215686, 1, 0, 1,
-0.5396831, -0.3281083, -1.903252, 0.3137255, 1, 0, 1,
-0.5366262, -0.510586, -1.975734, 0.3098039, 1, 0, 1,
-0.5236676, -0.2739501, -2.261774, 0.3019608, 1, 0, 1,
-0.5156268, 0.4034688, -1.553949, 0.2941177, 1, 0, 1,
-0.5145772, -1.434988, -1.482479, 0.2901961, 1, 0, 1,
-0.5144389, 1.081362, -0.174831, 0.282353, 1, 0, 1,
-0.5136511, -0.09622886, -0.6059046, 0.2784314, 1, 0, 1,
-0.5096612, -0.5085567, -2.499739, 0.2705882, 1, 0, 1,
-0.5056654, -2.624112, -3.054397, 0.2666667, 1, 0, 1,
-0.5026367, -0.3487606, -1.537822, 0.2588235, 1, 0, 1,
-0.4974151, -0.02179599, -2.254774, 0.254902, 1, 0, 1,
-0.493321, -0.6191226, -4.166879, 0.2470588, 1, 0, 1,
-0.4930983, 0.2331143, 0.5361165, 0.2431373, 1, 0, 1,
-0.4855829, -0.7861081, -3.120818, 0.2352941, 1, 0, 1,
-0.4838896, 0.3435247, -1.891173, 0.2313726, 1, 0, 1,
-0.4836735, -0.2283013, -0.8505308, 0.2235294, 1, 0, 1,
-0.4819747, 0.7029098, 0.8672056, 0.2196078, 1, 0, 1,
-0.4811001, 2.966286, 0.3092427, 0.2117647, 1, 0, 1,
-0.4803077, -1.477425, -3.104066, 0.2078431, 1, 0, 1,
-0.4769518, 0.5579722, -0.5742097, 0.2, 1, 0, 1,
-0.4724146, -0.4736421, -2.398903, 0.1921569, 1, 0, 1,
-0.4714765, -0.2744235, -2.881303, 0.1882353, 1, 0, 1,
-0.4705011, 0.3343411, -1.445649, 0.1803922, 1, 0, 1,
-0.4685816, -0.4878431, -1.432126, 0.1764706, 1, 0, 1,
-0.4661315, -1.062023, -3.64946, 0.1686275, 1, 0, 1,
-0.4600925, 0.04137205, -1.571274, 0.1647059, 1, 0, 1,
-0.4561736, 0.5689886, 0.02844394, 0.1568628, 1, 0, 1,
-0.4549226, -0.3454468, -1.876764, 0.1529412, 1, 0, 1,
-0.4547181, -0.8614715, -2.373158, 0.145098, 1, 0, 1,
-0.4524744, -0.7539597, -2.573935, 0.1411765, 1, 0, 1,
-0.4463213, 0.6709918, -1.195959, 0.1333333, 1, 0, 1,
-0.4420009, 2.872741, 0.06011597, 0.1294118, 1, 0, 1,
-0.441258, 0.7347964, 0.5551152, 0.1215686, 1, 0, 1,
-0.4383528, 0.1290706, -2.200598, 0.1176471, 1, 0, 1,
-0.4381842, -0.4226606, -2.235349, 0.1098039, 1, 0, 1,
-0.4369309, 0.4571574, -1.475497, 0.1058824, 1, 0, 1,
-0.4359356, -2.851993, -2.829139, 0.09803922, 1, 0, 1,
-0.4336084, 1.05294, 0.3336411, 0.09019608, 1, 0, 1,
-0.4317358, 0.3704449, -1.863457, 0.08627451, 1, 0, 1,
-0.4279672, -0.552461, -2.783915, 0.07843138, 1, 0, 1,
-0.416326, 0.4420668, -0.08103912, 0.07450981, 1, 0, 1,
-0.4143401, -0.420795, -2.134312, 0.06666667, 1, 0, 1,
-0.4106925, 1.441266, -0.5068321, 0.0627451, 1, 0, 1,
-0.4078845, -0.7602434, -1.805319, 0.05490196, 1, 0, 1,
-0.4073545, 2.023208, -0.299583, 0.05098039, 1, 0, 1,
-0.4073037, -1.256212, -2.106108, 0.04313726, 1, 0, 1,
-0.4062934, 1.005225, -0.5680116, 0.03921569, 1, 0, 1,
-0.4035541, 0.1665143, -0.9317495, 0.03137255, 1, 0, 1,
-0.4027633, -0.6104565, -3.705485, 0.02745098, 1, 0, 1,
-0.3968219, 0.1390916, -0.2348935, 0.01960784, 1, 0, 1,
-0.3965775, 0.3504011, -2.326992, 0.01568628, 1, 0, 1,
-0.3946324, 0.440175, -2.180406, 0.007843138, 1, 0, 1,
-0.3887644, -0.2256655, -2.446344, 0.003921569, 1, 0, 1,
-0.3874756, -0.007206415, -0.9452924, 0, 1, 0.003921569, 1,
-0.3839507, -0.2824011, -2.473933, 0, 1, 0.01176471, 1,
-0.3831566, -0.07195535, -2.140124, 0, 1, 0.01568628, 1,
-0.3801253, -2.465708, -4.07863, 0, 1, 0.02352941, 1,
-0.3770318, -0.3475766, -2.75092, 0, 1, 0.02745098, 1,
-0.3713713, 0.01850484, -1.982686, 0, 1, 0.03529412, 1,
-0.3674947, -0.4409963, -4.122058, 0, 1, 0.03921569, 1,
-0.3667735, -0.2085329, -2.705454, 0, 1, 0.04705882, 1,
-0.3635983, -0.08940982, -2.178854, 0, 1, 0.05098039, 1,
-0.3621621, 1.353451, 0.6968899, 0, 1, 0.05882353, 1,
-0.3488545, 0.4164559, -0.6356218, 0, 1, 0.0627451, 1,
-0.3446551, 1.175728, 0.1639002, 0, 1, 0.07058824, 1,
-0.3422628, -0.6671883, -3.027029, 0, 1, 0.07450981, 1,
-0.339864, -0.8972054, -3.504184, 0, 1, 0.08235294, 1,
-0.3365071, 0.8977169, -3.492991, 0, 1, 0.08627451, 1,
-0.3323181, -0.8153445, -2.435373, 0, 1, 0.09411765, 1,
-0.3300562, -2.50072, -2.690723, 0, 1, 0.1019608, 1,
-0.325721, 1.294568, 0.6675712, 0, 1, 0.1058824, 1,
-0.3197295, 1.208841, -1.839254, 0, 1, 0.1137255, 1,
-0.3152995, 1.072027, -0.4915477, 0, 1, 0.1176471, 1,
-0.312526, -1.23809, -2.454712, 0, 1, 0.1254902, 1,
-0.309589, -0.2147826, -3.361172, 0, 1, 0.1294118, 1,
-0.3092386, -1.106387, -2.863223, 0, 1, 0.1372549, 1,
-0.3078853, -1.218174, -2.958529, 0, 1, 0.1411765, 1,
-0.3063293, -0.3311355, -2.870926, 0, 1, 0.1490196, 1,
-0.2997146, 1.368785, 0.3891037, 0, 1, 0.1529412, 1,
-0.2966127, 0.3972454, -1.169284, 0, 1, 0.1607843, 1,
-0.2953857, 0.7630385, -1.519968, 0, 1, 0.1647059, 1,
-0.2922792, 0.9940497, -1.053835, 0, 1, 0.172549, 1,
-0.2865688, 0.4294716, 0.3251548, 0, 1, 0.1764706, 1,
-0.2846423, 0.3120127, -0.0507597, 0, 1, 0.1843137, 1,
-0.2819289, -0.01343912, -1.544981, 0, 1, 0.1882353, 1,
-0.2816528, -0.650886, -2.679166, 0, 1, 0.1960784, 1,
-0.2795186, -1.192978, -2.278379, 0, 1, 0.2039216, 1,
-0.2774297, 1.154698, 1.500871, 0, 1, 0.2078431, 1,
-0.2768963, 0.1496339, -0.3529241, 0, 1, 0.2156863, 1,
-0.2754027, -1.532394, -2.847106, 0, 1, 0.2196078, 1,
-0.2753677, 0.7794366, 0.4966011, 0, 1, 0.227451, 1,
-0.266731, 0.1518952, -1.753473, 0, 1, 0.2313726, 1,
-0.2613444, 1.901977, -1.365839, 0, 1, 0.2392157, 1,
-0.2612475, -0.4814468, -2.800688, 0, 1, 0.2431373, 1,
-0.2603468, 0.333393, -1.9058, 0, 1, 0.2509804, 1,
-0.2587949, 1.672968, 0.3645915, 0, 1, 0.254902, 1,
-0.2587325, -1.531659, -1.131547, 0, 1, 0.2627451, 1,
-0.2548694, -1.089031, -2.152802, 0, 1, 0.2666667, 1,
-0.2532547, -0.02875017, -0.915693, 0, 1, 0.2745098, 1,
-0.2515015, 0.103626, -2.765742, 0, 1, 0.2784314, 1,
-0.2487614, -0.4882135, -4.493579, 0, 1, 0.2862745, 1,
-0.2396757, 0.8215463, -1.144418, 0, 1, 0.2901961, 1,
-0.234166, -0.7184449, -2.456375, 0, 1, 0.2980392, 1,
-0.2303435, -0.6209922, -1.583546, 0, 1, 0.3058824, 1,
-0.2287755, -0.1802897, -3.961173, 0, 1, 0.3098039, 1,
-0.2284355, 0.5974272, 0.02000533, 0, 1, 0.3176471, 1,
-0.2256654, -0.7665119, -2.674005, 0, 1, 0.3215686, 1,
-0.2237723, 1.204775, 1.459643, 0, 1, 0.3294118, 1,
-0.2103452, -1.659647, -3.52786, 0, 1, 0.3333333, 1,
-0.2089377, 0.4324008, 0.9223672, 0, 1, 0.3411765, 1,
-0.2046096, -0.9225335, -2.597696, 0, 1, 0.345098, 1,
-0.2018892, -0.4102544, -3.419994, 0, 1, 0.3529412, 1,
-0.2007768, 0.3194386, -2.126489, 0, 1, 0.3568628, 1,
-0.1973551, -0.8980609, -1.675819, 0, 1, 0.3647059, 1,
-0.1949468, -0.6505116, -1.813517, 0, 1, 0.3686275, 1,
-0.1941549, -0.9043599, -1.785605, 0, 1, 0.3764706, 1,
-0.1935468, -0.2837998, -3.324884, 0, 1, 0.3803922, 1,
-0.1935316, 0.7576923, 0.4497327, 0, 1, 0.3882353, 1,
-0.1928307, 0.8488763, -1.878877, 0, 1, 0.3921569, 1,
-0.1880783, 0.01474359, -0.7538478, 0, 1, 0.4, 1,
-0.184154, -0.2156805, -1.906769, 0, 1, 0.4078431, 1,
-0.1793043, -1.443689, -2.64713, 0, 1, 0.4117647, 1,
-0.1762887, -0.8496747, -3.95955, 0, 1, 0.4196078, 1,
-0.1749144, -0.9642045, -4.278492, 0, 1, 0.4235294, 1,
-0.1714376, -1.116459, -1.95342, 0, 1, 0.4313726, 1,
-0.1694362, -0.5857046, -2.929098, 0, 1, 0.4352941, 1,
-0.1658916, -0.4390495, -4.003621, 0, 1, 0.4431373, 1,
-0.1650057, -0.830941, -2.578083, 0, 1, 0.4470588, 1,
-0.1647134, -0.8125507, -3.622467, 0, 1, 0.454902, 1,
-0.1630606, -0.06443989, -1.461262, 0, 1, 0.4588235, 1,
-0.1614442, 0.3157002, -1.128569, 0, 1, 0.4666667, 1,
-0.1608067, 0.9133061, -1.000524, 0, 1, 0.4705882, 1,
-0.1554582, -0.7115644, -2.185502, 0, 1, 0.4784314, 1,
-0.1546794, 0.5438746, 0.1719192, 0, 1, 0.4823529, 1,
-0.1527975, -0.03876892, -3.458233, 0, 1, 0.4901961, 1,
-0.1517748, -1.407439, -2.085963, 0, 1, 0.4941176, 1,
-0.1497893, -0.448417, -3.921134, 0, 1, 0.5019608, 1,
-0.1495166, -0.8114552, -1.441567, 0, 1, 0.509804, 1,
-0.147835, 0.9620363, 0.6989067, 0, 1, 0.5137255, 1,
-0.14635, 0.1326652, -0.1242546, 0, 1, 0.5215687, 1,
-0.1460274, 1.214124, 0.7262906, 0, 1, 0.5254902, 1,
-0.1377195, -0.2660688, -1.124375, 0, 1, 0.5333334, 1,
-0.1322328, -0.4959744, -4.759323, 0, 1, 0.5372549, 1,
-0.126857, 0.1277606, -1.003145, 0, 1, 0.5450981, 1,
-0.1245615, -0.4142236, -3.320015, 0, 1, 0.5490196, 1,
-0.1236386, -1.444997, -3.477062, 0, 1, 0.5568628, 1,
-0.1216973, 0.8335593, -0.1142099, 0, 1, 0.5607843, 1,
-0.1199974, -0.1014295, -3.472553, 0, 1, 0.5686275, 1,
-0.1195096, 0.9135688, 0.8, 0, 1, 0.572549, 1,
-0.1177367, -0.33159, -1.965177, 0, 1, 0.5803922, 1,
-0.1171149, -1.007351, -4.14487, 0, 1, 0.5843138, 1,
-0.1156586, 1.221113, -0.9806437, 0, 1, 0.5921569, 1,
-0.1152995, -0.7533332, -3.879085, 0, 1, 0.5960785, 1,
-0.1132964, -1.041644, -3.279507, 0, 1, 0.6039216, 1,
-0.1116586, 0.4176292, -1.39145, 0, 1, 0.6117647, 1,
-0.1112098, 0.219691, 0.01578658, 0, 1, 0.6156863, 1,
-0.1085557, -1.255294, -3.745901, 0, 1, 0.6235294, 1,
-0.1084069, -1.615925, -0.09718277, 0, 1, 0.627451, 1,
-0.1061353, 1.706018, -1.425227, 0, 1, 0.6352941, 1,
-0.1006205, 0.1026832, -0.8291212, 0, 1, 0.6392157, 1,
-0.100447, -3.212135, -4.760047, 0, 1, 0.6470588, 1,
-0.09420706, -0.4935388, -1.065917, 0, 1, 0.6509804, 1,
-0.09269734, 0.1400901, -0.5196342, 0, 1, 0.6588235, 1,
-0.09140882, 0.8316983, 1.008871, 0, 1, 0.6627451, 1,
-0.09055326, -0.3381092, -3.616744, 0, 1, 0.6705883, 1,
-0.09011518, 0.7220265, 0.6976857, 0, 1, 0.6745098, 1,
-0.08952651, 1.492987, 1.028751, 0, 1, 0.682353, 1,
-0.08846331, 1.780923, 1.347126, 0, 1, 0.6862745, 1,
-0.08361583, -0.1762792, -3.480857, 0, 1, 0.6941177, 1,
-0.07950995, 2.149448, -0.6447309, 0, 1, 0.7019608, 1,
-0.07490182, 0.7621493, 0.1187794, 0, 1, 0.7058824, 1,
-0.07283732, 2.28521, -0.9453375, 0, 1, 0.7137255, 1,
-0.07276775, -0.6118522, -2.874078, 0, 1, 0.7176471, 1,
-0.07271792, -1.013151, -3.719126, 0, 1, 0.7254902, 1,
-0.07246087, 1.463334, -0.4095379, 0, 1, 0.7294118, 1,
-0.06448318, 1.789976, 2.25288, 0, 1, 0.7372549, 1,
-0.05165659, -0.3360176, -2.737844, 0, 1, 0.7411765, 1,
-0.05055166, 1.711467, -1.24885, 0, 1, 0.7490196, 1,
-0.04799658, -0.5403546, -2.912394, 0, 1, 0.7529412, 1,
-0.04323592, -1.855505, -1.002341, 0, 1, 0.7607843, 1,
-0.04208218, -0.221963, -2.621236, 0, 1, 0.7647059, 1,
-0.04147442, 0.1566389, 1.442345, 0, 1, 0.772549, 1,
-0.04084658, 0.3965839, -1.091135, 0, 1, 0.7764706, 1,
-0.03907257, 0.6035092, 0.1059621, 0, 1, 0.7843137, 1,
-0.02961551, 0.9554753, -1.830676, 0, 1, 0.7882353, 1,
-0.02453115, 2.257531, -1.290341, 0, 1, 0.7960784, 1,
-0.02120795, -1.284801, -3.620901, 0, 1, 0.8039216, 1,
-0.01779568, -1.419441, -2.874086, 0, 1, 0.8078431, 1,
-0.01746733, 0.7634178, 0.2211404, 0, 1, 0.8156863, 1,
-0.0171686, -0.07542242, -1.952684, 0, 1, 0.8196079, 1,
-0.01236912, 0.8380746, -0.8155664, 0, 1, 0.827451, 1,
-0.01085999, 0.07497638, -1.058164, 0, 1, 0.8313726, 1,
-0.007953642, -1.013892, -2.420032, 0, 1, 0.8392157, 1,
-0.00736146, -0.8876321, -1.765399, 0, 1, 0.8431373, 1,
-0.00410517, 1.086395, 0.2121362, 0, 1, 0.8509804, 1,
-0.00266109, 1.396562, 1.9477, 0, 1, 0.854902, 1,
-0.002610182, -1.478763, -2.207115, 0, 1, 0.8627451, 1,
-0.001236349, -0.4824483, -1.823005, 0, 1, 0.8666667, 1,
0.000281142, -2.279556, 3.11719, 0, 1, 0.8745098, 1,
0.002750986, -0.0840839, 2.797982, 0, 1, 0.8784314, 1,
0.008803575, -1.335199, 4.238374, 0, 1, 0.8862745, 1,
0.009492447, -1.871133, 4.464567, 0, 1, 0.8901961, 1,
0.01187764, -0.2727868, 3.735231, 0, 1, 0.8980392, 1,
0.01475275, 1.40017, 0.4588556, 0, 1, 0.9058824, 1,
0.01863384, -0.3683814, 3.204219, 0, 1, 0.9098039, 1,
0.01874708, -0.04165244, 1.924441, 0, 1, 0.9176471, 1,
0.01917735, 0.9705822, 1.531868, 0, 1, 0.9215686, 1,
0.02696983, 0.7615428, 0.1522358, 0, 1, 0.9294118, 1,
0.02751946, -0.2246414, 3.29921, 0, 1, 0.9333333, 1,
0.02760905, 0.3056526, 1.725827, 0, 1, 0.9411765, 1,
0.02808883, -0.4905715, 4.169561, 0, 1, 0.945098, 1,
0.02876127, 0.7038643, -0.6743321, 0, 1, 0.9529412, 1,
0.03170082, -1.068819, 2.328349, 0, 1, 0.9568627, 1,
0.035039, 1.048012, -2.08595, 0, 1, 0.9647059, 1,
0.03857553, -0.1180541, 3.423009, 0, 1, 0.9686275, 1,
0.04179882, -1.650452, 5.789744, 0, 1, 0.9764706, 1,
0.04267389, 0.3019917, -0.65029, 0, 1, 0.9803922, 1,
0.0433932, -0.1587773, 2.81039, 0, 1, 0.9882353, 1,
0.04365035, -1.140649, 2.085102, 0, 1, 0.9921569, 1,
0.04376382, -1.087787, 5.073149, 0, 1, 1, 1,
0.04415013, -0.4922478, 2.815764, 0, 0.9921569, 1, 1,
0.04453332, -0.6355671, 2.30018, 0, 0.9882353, 1, 1,
0.04507572, 0.6727163, 1.358338, 0, 0.9803922, 1, 1,
0.04644985, -1.63568, 3.695819, 0, 0.9764706, 1, 1,
0.0510867, 0.2353621, 0.1958431, 0, 0.9686275, 1, 1,
0.05159068, -0.7050408, 4.623426, 0, 0.9647059, 1, 1,
0.05344981, -0.4546447, 2.803713, 0, 0.9568627, 1, 1,
0.0553708, 1.172091, -0.7006912, 0, 0.9529412, 1, 1,
0.05960137, 0.2594543, 0.555684, 0, 0.945098, 1, 1,
0.06034708, -0.1050853, 2.479419, 0, 0.9411765, 1, 1,
0.06356357, 0.6142861, 0.7315373, 0, 0.9333333, 1, 1,
0.06905537, -0.3469765, 3.57596, 0, 0.9294118, 1, 1,
0.06993559, -0.7044131, 1.420578, 0, 0.9215686, 1, 1,
0.07259647, -0.3250997, 3.692362, 0, 0.9176471, 1, 1,
0.0733737, 0.2391779, 1.065665, 0, 0.9098039, 1, 1,
0.07408715, 1.168969, -0.1100838, 0, 0.9058824, 1, 1,
0.07533339, -0.5579308, 2.97635, 0, 0.8980392, 1, 1,
0.07995522, 0.3901828, 1.35406, 0, 0.8901961, 1, 1,
0.08035371, 1.319925, 1.035128, 0, 0.8862745, 1, 1,
0.08264666, -0.1883376, 2.297578, 0, 0.8784314, 1, 1,
0.09024163, -0.02302173, 1.533668, 0, 0.8745098, 1, 1,
0.0905318, -0.5296738, 5.138251, 0, 0.8666667, 1, 1,
0.09114663, 0.149545, -0.3699038, 0, 0.8627451, 1, 1,
0.09157676, 1.620165, 0.2465827, 0, 0.854902, 1, 1,
0.09202999, -0.3280767, 3.091773, 0, 0.8509804, 1, 1,
0.09468301, -0.2360889, 2.808159, 0, 0.8431373, 1, 1,
0.09515163, -1.953201, 1.896978, 0, 0.8392157, 1, 1,
0.1064006, -0.7740774, 1.659323, 0, 0.8313726, 1, 1,
0.1079372, -1.375427, 4.271815, 0, 0.827451, 1, 1,
0.1092389, -0.4543758, 2.681947, 0, 0.8196079, 1, 1,
0.1098721, 0.3557948, 1.006272, 0, 0.8156863, 1, 1,
0.114743, 0.5739542, 0.06304733, 0, 0.8078431, 1, 1,
0.1163262, 1.735726, -0.343228, 0, 0.8039216, 1, 1,
0.1192547, 1.213626, 0.4236612, 0, 0.7960784, 1, 1,
0.1207833, 1.18453, 0.9157959, 0, 0.7882353, 1, 1,
0.125188, -0.03749377, 2.5217, 0, 0.7843137, 1, 1,
0.1296719, 0.2308925, 1.299804, 0, 0.7764706, 1, 1,
0.1359009, 0.6753951, 1.204386, 0, 0.772549, 1, 1,
0.1360071, -1.189495, 4.537251, 0, 0.7647059, 1, 1,
0.1375182, -0.8530498, 4.364053, 0, 0.7607843, 1, 1,
0.1402294, -0.5762004, 3.087068, 0, 0.7529412, 1, 1,
0.1429917, 0.9496968, 0.6734811, 0, 0.7490196, 1, 1,
0.1431998, -0.3426924, 1.506281, 0, 0.7411765, 1, 1,
0.1481537, 1.032398, -0.2737711, 0, 0.7372549, 1, 1,
0.1484579, 0.05496127, 1.317414, 0, 0.7294118, 1, 1,
0.1494651, 0.8161873, -0.8342254, 0, 0.7254902, 1, 1,
0.1534808, 0.5447038, -1.534728, 0, 0.7176471, 1, 1,
0.1540805, -1.018122, 3.185604, 0, 0.7137255, 1, 1,
0.1579002, -0.3341734, 3.297361, 0, 0.7058824, 1, 1,
0.162791, 2.096421, -0.7465714, 0, 0.6980392, 1, 1,
0.1667759, 1.407037, -1.164767, 0, 0.6941177, 1, 1,
0.1697523, -0.5360627, 3.476578, 0, 0.6862745, 1, 1,
0.1717667, -1.406495, 2.508009, 0, 0.682353, 1, 1,
0.1734125, 1.523484, -0.4137423, 0, 0.6745098, 1, 1,
0.1750899, 1.97388, 1.977173, 0, 0.6705883, 1, 1,
0.1793828, 2.690411, 3.308697, 0, 0.6627451, 1, 1,
0.1814875, 0.739639, -1.169897, 0, 0.6588235, 1, 1,
0.1824936, 1.127924, -1.035482, 0, 0.6509804, 1, 1,
0.1861702, -0.8000206, 3.73615, 0, 0.6470588, 1, 1,
0.1884556, -0.7702864, 3.948437, 0, 0.6392157, 1, 1,
0.1888052, -0.30539, 3.118177, 0, 0.6352941, 1, 1,
0.1905284, -1.170994, 4.304975, 0, 0.627451, 1, 1,
0.1956389, -1.868323, 4.053723, 0, 0.6235294, 1, 1,
0.1977071, -0.2137636, 2.380821, 0, 0.6156863, 1, 1,
0.1984451, 0.2218191, 1.065284, 0, 0.6117647, 1, 1,
0.1986775, -0.5269767, 3.070963, 0, 0.6039216, 1, 1,
0.2000424, 1.405476, 1.557948, 0, 0.5960785, 1, 1,
0.206026, 0.01270021, 2.104971, 0, 0.5921569, 1, 1,
0.2085535, 1.314023, 1.149782, 0, 0.5843138, 1, 1,
0.2089223, -1.437414, 3.422909, 0, 0.5803922, 1, 1,
0.2100027, 0.236566, 0.5212035, 0, 0.572549, 1, 1,
0.2113879, -1.657744, 1.923476, 0, 0.5686275, 1, 1,
0.2173404, 0.2510749, 0.5602388, 0, 0.5607843, 1, 1,
0.2177858, 0.5134308, 0.06644277, 0, 0.5568628, 1, 1,
0.2220951, -0.1293594, 2.930811, 0, 0.5490196, 1, 1,
0.2245686, -0.8488987, 1.631296, 0, 0.5450981, 1, 1,
0.2255244, 0.2467423, 0.8093017, 0, 0.5372549, 1, 1,
0.2366255, 0.6593266, 0.1503524, 0, 0.5333334, 1, 1,
0.237513, -0.9038216, 5.106695, 0, 0.5254902, 1, 1,
0.2405106, -2.333388, 2.976674, 0, 0.5215687, 1, 1,
0.2416385, 0.9348233, 1.047902, 0, 0.5137255, 1, 1,
0.2446722, 0.6462194, 1.001007, 0, 0.509804, 1, 1,
0.2481995, 1.405641, 2.132726, 0, 0.5019608, 1, 1,
0.2499208, -2.220172, 4.530753, 0, 0.4941176, 1, 1,
0.2522651, 0.7265441, -0.183503, 0, 0.4901961, 1, 1,
0.2542218, 0.4290535, -2.600004, 0, 0.4823529, 1, 1,
0.2599375, 1.049604, -0.2985189, 0, 0.4784314, 1, 1,
0.266388, 0.06411028, 0.6472571, 0, 0.4705882, 1, 1,
0.26673, -0.9445665, 2.615469, 0, 0.4666667, 1, 1,
0.2678233, -0.3619184, 1.659279, 0, 0.4588235, 1, 1,
0.2718893, -1.609151, 3.418441, 0, 0.454902, 1, 1,
0.2756522, -0.3029667, 2.225814, 0, 0.4470588, 1, 1,
0.2772295, -0.5226229, 2.928236, 0, 0.4431373, 1, 1,
0.2790772, -0.1277388, 1.128615, 0, 0.4352941, 1, 1,
0.2790927, -0.6471427, 3.289298, 0, 0.4313726, 1, 1,
0.2818157, -0.945236, 2.542928, 0, 0.4235294, 1, 1,
0.284843, -0.5791981, 2.386384, 0, 0.4196078, 1, 1,
0.2881563, -1.145006, 3.699581, 0, 0.4117647, 1, 1,
0.295577, -1.068659, 1.814808, 0, 0.4078431, 1, 1,
0.2956099, -0.35372, 1.290278, 0, 0.4, 1, 1,
0.2990218, 0.09437334, 1.822516, 0, 0.3921569, 1, 1,
0.3040169, -1.257072, 1.904455, 0, 0.3882353, 1, 1,
0.3097923, -0.6856139, 3.512536, 0, 0.3803922, 1, 1,
0.3174618, -0.5407342, 1.75129, 0, 0.3764706, 1, 1,
0.3192992, 0.7005509, -1.427137, 0, 0.3686275, 1, 1,
0.3214892, -2.359586, 3.19216, 0, 0.3647059, 1, 1,
0.3234662, -0.05858792, 3.804253, 0, 0.3568628, 1, 1,
0.3246268, -0.5625365, 3.09223, 0, 0.3529412, 1, 1,
0.3251528, -0.1078455, 0.3571323, 0, 0.345098, 1, 1,
0.3261469, 1.721213, 1.079719, 0, 0.3411765, 1, 1,
0.3270788, -3.11611, 2.151361, 0, 0.3333333, 1, 1,
0.3302957, -2.386707, 1.484846, 0, 0.3294118, 1, 1,
0.3417233, 0.478279, 0.3434832, 0, 0.3215686, 1, 1,
0.3432206, 0.01352645, 2.888888, 0, 0.3176471, 1, 1,
0.3444065, -1.673965, 2.241168, 0, 0.3098039, 1, 1,
0.3459089, -0.003625416, 2.423723, 0, 0.3058824, 1, 1,
0.3575904, 0.3713408, 1.566005, 0, 0.2980392, 1, 1,
0.3621983, 1.700454, 1.04756, 0, 0.2901961, 1, 1,
0.3661193, 0.5785699, 0.3183042, 0, 0.2862745, 1, 1,
0.3704142, -0.3374919, 0.4267812, 0, 0.2784314, 1, 1,
0.3735479, -0.4743795, 1.068233, 0, 0.2745098, 1, 1,
0.3772717, 0.8153437, 1.062375, 0, 0.2666667, 1, 1,
0.3792884, -0.3858036, 1.152385, 0, 0.2627451, 1, 1,
0.3793989, 0.3189116, 1.966532, 0, 0.254902, 1, 1,
0.3816152, 0.5438504, 1.623329, 0, 0.2509804, 1, 1,
0.3832813, 0.3208185, 0.8163727, 0, 0.2431373, 1, 1,
0.3833935, -2.303968, 2.284679, 0, 0.2392157, 1, 1,
0.3836039, -1.283543, 2.907824, 0, 0.2313726, 1, 1,
0.3850752, -0.5732516, 2.01317, 0, 0.227451, 1, 1,
0.3851693, -0.5306532, 3.21355, 0, 0.2196078, 1, 1,
0.386127, -0.6867759, 2.538209, 0, 0.2156863, 1, 1,
0.3877243, -0.2051883, 2.075217, 0, 0.2078431, 1, 1,
0.3886574, 0.1768428, -0.2848266, 0, 0.2039216, 1, 1,
0.390125, -1.58616, 3.079138, 0, 0.1960784, 1, 1,
0.391844, -0.6766615, 1.653097, 0, 0.1882353, 1, 1,
0.3995907, -0.5805101, 3.535121, 0, 0.1843137, 1, 1,
0.404572, -1.895064, 2.645964, 0, 0.1764706, 1, 1,
0.4077336, 0.720799, -0.3028756, 0, 0.172549, 1, 1,
0.4121415, 1.649809, -0.3214151, 0, 0.1647059, 1, 1,
0.4137707, 0.3852304, 0.04566472, 0, 0.1607843, 1, 1,
0.414832, -1.331402, 4.572102, 0, 0.1529412, 1, 1,
0.415775, 0.7649747, -0.3032544, 0, 0.1490196, 1, 1,
0.4168604, 1.281257, 1.164701, 0, 0.1411765, 1, 1,
0.4186789, 0.7900993, 1.906698, 0, 0.1372549, 1, 1,
0.4241951, -1.455059, 5.592107, 0, 0.1294118, 1, 1,
0.4245501, 1.283242, 0.9505416, 0, 0.1254902, 1, 1,
0.4246148, -1.498699, 1.878731, 0, 0.1176471, 1, 1,
0.4262657, 0.0901003, 2.294832, 0, 0.1137255, 1, 1,
0.4275684, -0.4722417, 2.303177, 0, 0.1058824, 1, 1,
0.4304695, 0.2083703, 1.459789, 0, 0.09803922, 1, 1,
0.4328915, 0.7804272, -0.06703852, 0, 0.09411765, 1, 1,
0.4352162, 0.8542596, -0.7122304, 0, 0.08627451, 1, 1,
0.43826, -0.1141166, 0.655341, 0, 0.08235294, 1, 1,
0.4441829, 1.502707, 0.58575, 0, 0.07450981, 1, 1,
0.4484951, 2.191953, -1.625549, 0, 0.07058824, 1, 1,
0.4492, 0.7669422, -0.2131873, 0, 0.0627451, 1, 1,
0.4497731, -0.264823, 3.930583, 0, 0.05882353, 1, 1,
0.4502086, 0.3698952, 0.716456, 0, 0.05098039, 1, 1,
0.4549412, 0.05456222, 2.692574, 0, 0.04705882, 1, 1,
0.4600868, -2.25302, 2.007504, 0, 0.03921569, 1, 1,
0.4614237, -0.8202261, 2.853653, 0, 0.03529412, 1, 1,
0.4629948, -0.7097843, 4.533642, 0, 0.02745098, 1, 1,
0.4672962, 1.760966, 0.2165798, 0, 0.02352941, 1, 1,
0.4697332, -0.7479215, 3.071475, 0, 0.01568628, 1, 1,
0.4729527, 0.2252664, 0.1531198, 0, 0.01176471, 1, 1,
0.4736587, 0.8286422, 1.675889, 0, 0.003921569, 1, 1,
0.4739116, 0.5567525, 0.7097222, 0.003921569, 0, 1, 1,
0.4794113, -0.3681558, 2.904355, 0.007843138, 0, 1, 1,
0.4823761, -1.661426, 2.397497, 0.01568628, 0, 1, 1,
0.4824568, 0.8830938, 0.5476255, 0.01960784, 0, 1, 1,
0.482778, -0.06483864, 1.562888, 0.02745098, 0, 1, 1,
0.4832035, 0.4041148, 0.1771805, 0.03137255, 0, 1, 1,
0.4833503, 0.2158672, 1.034511, 0.03921569, 0, 1, 1,
0.4855354, -0.3161686, 1.506136, 0.04313726, 0, 1, 1,
0.4891108, 0.7310684, -0.3323556, 0.05098039, 0, 1, 1,
0.4907713, 0.4831323, -0.2024952, 0.05490196, 0, 1, 1,
0.4913878, 0.2518716, 2.323432, 0.0627451, 0, 1, 1,
0.4932579, -1.946335, 2.856116, 0.06666667, 0, 1, 1,
0.5006376, 0.4690304, 1.064707, 0.07450981, 0, 1, 1,
0.5015676, 0.3001584, 0.8501445, 0.07843138, 0, 1, 1,
0.5020384, 0.9017608, 2.506951, 0.08627451, 0, 1, 1,
0.5027235, -1.98893, 1.022766, 0.09019608, 0, 1, 1,
0.502732, 0.6613684, 1.09382, 0.09803922, 0, 1, 1,
0.5070102, -1.82596, 2.756112, 0.1058824, 0, 1, 1,
0.5111732, 0.3846402, 0.9986755, 0.1098039, 0, 1, 1,
0.5138423, 0.3568655, 1.759558, 0.1176471, 0, 1, 1,
0.520049, 0.7036888, -1.367717, 0.1215686, 0, 1, 1,
0.5205693, 1.076529, 0.2230899, 0.1294118, 0, 1, 1,
0.520879, 0.1699783, 0.133829, 0.1333333, 0, 1, 1,
0.5241598, 1.333777, -1.664079, 0.1411765, 0, 1, 1,
0.5250779, 0.8049135, 1.537719, 0.145098, 0, 1, 1,
0.5292535, 1.072582, -0.4829469, 0.1529412, 0, 1, 1,
0.53434, 0.832083, 0.6723791, 0.1568628, 0, 1, 1,
0.5366056, -2.043349, 3.245312, 0.1647059, 0, 1, 1,
0.5425076, -0.7550593, 0.1908392, 0.1686275, 0, 1, 1,
0.546562, -0.467125, 2.389318, 0.1764706, 0, 1, 1,
0.5474321, -0.1051902, 2.215649, 0.1803922, 0, 1, 1,
0.5476082, 0.8479303, 1.761894, 0.1882353, 0, 1, 1,
0.5519623, 1.032973, 0.2928634, 0.1921569, 0, 1, 1,
0.5572191, -0.3367042, 1.024347, 0.2, 0, 1, 1,
0.5597884, -0.1527675, 3.022401, 0.2078431, 0, 1, 1,
0.5602848, -0.7193565, 2.375914, 0.2117647, 0, 1, 1,
0.5629623, -1.215494, 2.47941, 0.2196078, 0, 1, 1,
0.5644783, 0.6145637, 0.4017223, 0.2235294, 0, 1, 1,
0.5660908, -0.2062564, 2.068751, 0.2313726, 0, 1, 1,
0.5703338, 1.674834, 0.2127713, 0.2352941, 0, 1, 1,
0.5721956, 1.454729, 0.3305606, 0.2431373, 0, 1, 1,
0.5736851, -0.08901002, 3.416165, 0.2470588, 0, 1, 1,
0.5739095, 1.056804, 0.3544792, 0.254902, 0, 1, 1,
0.5798563, 1.59091, -0.2653862, 0.2588235, 0, 1, 1,
0.5803496, 0.4348078, 0.617287, 0.2666667, 0, 1, 1,
0.5836205, -0.2604294, 0.5506988, 0.2705882, 0, 1, 1,
0.5849113, 1.033193, -0.229142, 0.2784314, 0, 1, 1,
0.5862954, 0.3628377, 1.607727, 0.282353, 0, 1, 1,
0.5887159, 0.4268615, 1.299696, 0.2901961, 0, 1, 1,
0.5924364, -0.4619572, 2.459384, 0.2941177, 0, 1, 1,
0.5936231, 0.3896666, 1.122167, 0.3019608, 0, 1, 1,
0.5986011, 1.037932, -0.2338594, 0.3098039, 0, 1, 1,
0.5994622, -0.2756231, 2.75758, 0.3137255, 0, 1, 1,
0.5999845, -1.028445, 2.429676, 0.3215686, 0, 1, 1,
0.6021259, 0.9900153, -0.9191747, 0.3254902, 0, 1, 1,
0.6027716, 1.365496, -1.075005, 0.3333333, 0, 1, 1,
0.6038421, -1.050509, 1.171763, 0.3372549, 0, 1, 1,
0.6057099, -0.6089653, 2.179328, 0.345098, 0, 1, 1,
0.610658, -0.645255, 2.285284, 0.3490196, 0, 1, 1,
0.6110084, -2.517629, 3.018445, 0.3568628, 0, 1, 1,
0.6147399, -0.1001253, 1.249529, 0.3607843, 0, 1, 1,
0.6160669, -2.250869, 1.926914, 0.3686275, 0, 1, 1,
0.6179589, -0.5454648, 2.222207, 0.372549, 0, 1, 1,
0.6221735, 0.1571991, 1.476913, 0.3803922, 0, 1, 1,
0.6232412, 0.9463015, 1.234076, 0.3843137, 0, 1, 1,
0.6336436, -0.3579619, 2.297308, 0.3921569, 0, 1, 1,
0.6361738, -1.149166, 2.684562, 0.3960784, 0, 1, 1,
0.6396164, 1.439521, 0.2327444, 0.4039216, 0, 1, 1,
0.6397055, 0.5189662, 0.1475963, 0.4117647, 0, 1, 1,
0.6452364, 0.4079583, -0.2225379, 0.4156863, 0, 1, 1,
0.645327, 1.049085, -0.6454329, 0.4235294, 0, 1, 1,
0.6453781, 1.129619, -1.126177, 0.427451, 0, 1, 1,
0.6469682, 1.903144, 0.3003769, 0.4352941, 0, 1, 1,
0.6516154, -0.4256434, 1.028409, 0.4392157, 0, 1, 1,
0.6527601, 0.9095524, -0.1677316, 0.4470588, 0, 1, 1,
0.6568405, 0.7031285, 0.03934839, 0.4509804, 0, 1, 1,
0.658179, 0.8487675, 0.1275461, 0.4588235, 0, 1, 1,
0.6592482, -1.377061, 3.739589, 0.4627451, 0, 1, 1,
0.6621762, 0.1394769, 0.8268988, 0.4705882, 0, 1, 1,
0.6637245, 0.9925975, 1.26001, 0.4745098, 0, 1, 1,
0.6679684, 0.09837264, 1.772006, 0.4823529, 0, 1, 1,
0.6737088, 0.3006396, 0.7183356, 0.4862745, 0, 1, 1,
0.6745286, -0.1319054, 2.508487, 0.4941176, 0, 1, 1,
0.6781971, -1.338714, 1.198579, 0.5019608, 0, 1, 1,
0.6876084, 0.1906754, 1.298004, 0.5058824, 0, 1, 1,
0.6896899, -0.5377909, 2.717274, 0.5137255, 0, 1, 1,
0.6928872, -1.281847, 1.569089, 0.5176471, 0, 1, 1,
0.6935176, 0.09364965, 2.125551, 0.5254902, 0, 1, 1,
0.6951203, 2.200631, -0.3420334, 0.5294118, 0, 1, 1,
0.6985058, 2.180476, 0.6157674, 0.5372549, 0, 1, 1,
0.7015315, -0.9101952, 2.224887, 0.5411765, 0, 1, 1,
0.707268, -0.6616422, 1.744936, 0.5490196, 0, 1, 1,
0.7123585, 0.7421215, -0.5931078, 0.5529412, 0, 1, 1,
0.7136496, -0.06602779, 2.414841, 0.5607843, 0, 1, 1,
0.7187861, 0.3014287, 0.9922922, 0.5647059, 0, 1, 1,
0.7230574, 0.2243317, 2.099931, 0.572549, 0, 1, 1,
0.7294368, 1.117552, 0.8114863, 0.5764706, 0, 1, 1,
0.7383293, 0.2029447, 1.484869, 0.5843138, 0, 1, 1,
0.7425409, -0.7949648, 2.64985, 0.5882353, 0, 1, 1,
0.7427709, 0.006983175, 2.356709, 0.5960785, 0, 1, 1,
0.7434759, -0.2050993, 2.97615, 0.6039216, 0, 1, 1,
0.7472774, 1.628095, 0.5982401, 0.6078432, 0, 1, 1,
0.7583324, -0.2759305, 1.922496, 0.6156863, 0, 1, 1,
0.7597591, 0.6701798, 1.373796, 0.6196079, 0, 1, 1,
0.7622444, -0.256065, 0.8763875, 0.627451, 0, 1, 1,
0.7629153, -1.020727, 3.134453, 0.6313726, 0, 1, 1,
0.764599, -2.381284, 3.369884, 0.6392157, 0, 1, 1,
0.770592, -0.9409148, 2.405236, 0.6431373, 0, 1, 1,
0.7739365, 0.1727136, -0.09046839, 0.6509804, 0, 1, 1,
0.779815, 0.6385486, -0.6209514, 0.654902, 0, 1, 1,
0.780246, 0.1302286, 2.515376, 0.6627451, 0, 1, 1,
0.7829986, -1.320549, 3.786064, 0.6666667, 0, 1, 1,
0.7865459, 0.6628772, -0.03347387, 0.6745098, 0, 1, 1,
0.7889749, -0.1087001, 1.251499, 0.6784314, 0, 1, 1,
0.7902762, -1.868624, 2.360149, 0.6862745, 0, 1, 1,
0.7913787, -1.264373, 4.313223, 0.6901961, 0, 1, 1,
0.7983168, 1.58604, 1.198238, 0.6980392, 0, 1, 1,
0.7984096, 1.009018, 1.227776, 0.7058824, 0, 1, 1,
0.8011993, -1.376821, 2.999486, 0.7098039, 0, 1, 1,
0.8060211, -0.7405397, 3.105717, 0.7176471, 0, 1, 1,
0.8081192, -0.7527521, 3.213246, 0.7215686, 0, 1, 1,
0.8099679, 0.09854583, 1.450471, 0.7294118, 0, 1, 1,
0.8105735, 0.0766396, 1.460553, 0.7333333, 0, 1, 1,
0.8122152, 1.178065, 1.017448, 0.7411765, 0, 1, 1,
0.8139116, -1.057235, 2.117177, 0.7450981, 0, 1, 1,
0.8147977, -0.8365201, 3.105325, 0.7529412, 0, 1, 1,
0.8280063, -0.6515211, 2.702312, 0.7568628, 0, 1, 1,
0.8299528, -0.9313722, 3.194735, 0.7647059, 0, 1, 1,
0.830143, 1.70997, 0.8529252, 0.7686275, 0, 1, 1,
0.8323258, -0.6786538, 3.65869, 0.7764706, 0, 1, 1,
0.8341062, 1.14097, 0.0005907851, 0.7803922, 0, 1, 1,
0.8344464, -0.1278787, 1.537715, 0.7882353, 0, 1, 1,
0.8355704, -0.1651942, 1.004159, 0.7921569, 0, 1, 1,
0.8357981, -0.0547388, 2.950946, 0.8, 0, 1, 1,
0.8428612, 0.6040742, 0.2991556, 0.8078431, 0, 1, 1,
0.8480856, -0.5004606, 2.553714, 0.8117647, 0, 1, 1,
0.8530325, 0.06458587, 0.2731001, 0.8196079, 0, 1, 1,
0.8551229, -1.807361, 3.27509, 0.8235294, 0, 1, 1,
0.8603885, -0.8066928, 3.586612, 0.8313726, 0, 1, 1,
0.863691, 1.137572, 1.996735, 0.8352941, 0, 1, 1,
0.8745854, -0.2252771, 1.492144, 0.8431373, 0, 1, 1,
0.8748086, -0.889134, 3.114706, 0.8470588, 0, 1, 1,
0.878823, -2.235138, 4.585827, 0.854902, 0, 1, 1,
0.8799645, 0.3062887, 1.186028, 0.8588235, 0, 1, 1,
0.8810984, 2.323054, 2.001865, 0.8666667, 0, 1, 1,
0.8816957, 1.139585, 1.801084, 0.8705882, 0, 1, 1,
0.8894461, -1.530458, 2.279597, 0.8784314, 0, 1, 1,
0.8933016, 0.2385607, 4.071313, 0.8823529, 0, 1, 1,
0.896342, 0.05594184, 1.092935, 0.8901961, 0, 1, 1,
0.9081578, -0.7203346, 3.702358, 0.8941177, 0, 1, 1,
0.9158115, 1.909723, 2.299779, 0.9019608, 0, 1, 1,
0.9258269, -2.244384, 3.264616, 0.9098039, 0, 1, 1,
0.9387044, -0.8030704, 2.887676, 0.9137255, 0, 1, 1,
0.9410039, 0.5269706, 1.224115, 0.9215686, 0, 1, 1,
0.9411787, 0.2486578, 0.9864945, 0.9254902, 0, 1, 1,
0.9488637, 1.668556, 0.3393078, 0.9333333, 0, 1, 1,
0.9514612, 0.01595374, 1.415034, 0.9372549, 0, 1, 1,
0.9542875, 0.8879079, 0.3595479, 0.945098, 0, 1, 1,
0.9570974, 1.990816, -0.3001867, 0.9490196, 0, 1, 1,
0.9654099, -1.499698, 2.012684, 0.9568627, 0, 1, 1,
0.967301, 2.874087, 0.456095, 0.9607843, 0, 1, 1,
0.9716902, 0.000393349, 2.118957, 0.9686275, 0, 1, 1,
0.9794165, -0.03312395, 0.7687921, 0.972549, 0, 1, 1,
0.981986, -2.03469, 2.370447, 0.9803922, 0, 1, 1,
0.9895629, 0.9385017, -0.7598693, 0.9843137, 0, 1, 1,
0.9915713, 0.3786646, 0.8446395, 0.9921569, 0, 1, 1,
0.9998783, -1.379579, 2.241325, 0.9960784, 0, 1, 1,
1.003309, 1.349559, 1.647496, 1, 0, 0.9960784, 1,
1.003553, -1.505544, 4.108633, 1, 0, 0.9882353, 1,
1.009813, 1.44092, -0.1659671, 1, 0, 0.9843137, 1,
1.015172, 0.4160908, 1.157408, 1, 0, 0.9764706, 1,
1.01572, 0.9092531, 0.3750823, 1, 0, 0.972549, 1,
1.023029, 1.13181, -0.08756242, 1, 0, 0.9647059, 1,
1.027014, 0.600094, 1.923972, 1, 0, 0.9607843, 1,
1.039818, -0.8470383, 1.813952, 1, 0, 0.9529412, 1,
1.047161, -1.548453, 3.808918, 1, 0, 0.9490196, 1,
1.049506, 0.2100587, 2.019037, 1, 0, 0.9411765, 1,
1.062647, -1.33261, 2.253555, 1, 0, 0.9372549, 1,
1.07281, -0.390334, 3.737314, 1, 0, 0.9294118, 1,
1.079038, -0.1200933, 4.50179, 1, 0, 0.9254902, 1,
1.079174, -1.317281, 2.515702, 1, 0, 0.9176471, 1,
1.090842, -0.1081777, 1.482527, 1, 0, 0.9137255, 1,
1.095476, -0.7987404, 3.030254, 1, 0, 0.9058824, 1,
1.102681, -1.329185, 2.772004, 1, 0, 0.9019608, 1,
1.103057, -0.5337747, 1.484729, 1, 0, 0.8941177, 1,
1.103643, 1.074613, 0.7572641, 1, 0, 0.8862745, 1,
1.117988, -1.423072, 2.228142, 1, 0, 0.8823529, 1,
1.124257, 0.1663235, 0.2357474, 1, 0, 0.8745098, 1,
1.126038, 0.8682072, -0.05447726, 1, 0, 0.8705882, 1,
1.127059, 0.2912886, 0.506528, 1, 0, 0.8627451, 1,
1.128031, -0.01610787, 2.105625, 1, 0, 0.8588235, 1,
1.128144, 1.342753, 1.390445, 1, 0, 0.8509804, 1,
1.130745, -0.486443, 2.715279, 1, 0, 0.8470588, 1,
1.131857, -1.098774, 3.271381, 1, 0, 0.8392157, 1,
1.132361, -1.444105, 3.361688, 1, 0, 0.8352941, 1,
1.135221, 0.8459075, 0.1962077, 1, 0, 0.827451, 1,
1.142192, -0.5361077, 2.427697, 1, 0, 0.8235294, 1,
1.143093, 0.1574304, -0.3399248, 1, 0, 0.8156863, 1,
1.145629, 0.7037148, 1.422345, 1, 0, 0.8117647, 1,
1.146466, 0.3145593, 2.358563, 1, 0, 0.8039216, 1,
1.157278, -0.2634077, 2.369819, 1, 0, 0.7960784, 1,
1.176714, 1.515007, 2.19848, 1, 0, 0.7921569, 1,
1.182792, 0.3144027, 1.675298, 1, 0, 0.7843137, 1,
1.183381, 2.541579, 1.302663, 1, 0, 0.7803922, 1,
1.18414, 0.7250833, -0.1499382, 1, 0, 0.772549, 1,
1.186844, -1.12948, 3.173131, 1, 0, 0.7686275, 1,
1.203962, -0.7836556, 2.251057, 1, 0, 0.7607843, 1,
1.207492, -2.548707, 3.8068, 1, 0, 0.7568628, 1,
1.217139, 0.4849625, -0.6704638, 1, 0, 0.7490196, 1,
1.223012, -0.6333429, 1.687538, 1, 0, 0.7450981, 1,
1.223494, 0.3626897, 1.572036, 1, 0, 0.7372549, 1,
1.235206, -2.815061, 3.02297, 1, 0, 0.7333333, 1,
1.253779, -1.541872, 2.562772, 1, 0, 0.7254902, 1,
1.255498, 0.3954601, 0.2591402, 1, 0, 0.7215686, 1,
1.257594, -1.309736, 1.310952, 1, 0, 0.7137255, 1,
1.257944, 0.5211679, 1.201969, 1, 0, 0.7098039, 1,
1.259147, 0.6690608, 0.4679486, 1, 0, 0.7019608, 1,
1.260784, 1.360721, -0.1769378, 1, 0, 0.6941177, 1,
1.262456, -0.7620391, 0.3807445, 1, 0, 0.6901961, 1,
1.266545, -0.5577162, 2.471896, 1, 0, 0.682353, 1,
1.268082, -1.003204, 2.737401, 1, 0, 0.6784314, 1,
1.276764, -0.1168655, 2.307886, 1, 0, 0.6705883, 1,
1.278772, -0.6005396, 3.662791, 1, 0, 0.6666667, 1,
1.28198, -0.5520782, 3.196456, 1, 0, 0.6588235, 1,
1.288585, 0.6761145, 1.212995, 1, 0, 0.654902, 1,
1.2938, 0.4062766, 1.828663, 1, 0, 0.6470588, 1,
1.294018, 1.015487, 0.08199206, 1, 0, 0.6431373, 1,
1.299431, -1.007978, 0.604427, 1, 0, 0.6352941, 1,
1.30361, -0.4371554, 2.266906, 1, 0, 0.6313726, 1,
1.310395, -0.4091948, 4.345586, 1, 0, 0.6235294, 1,
1.316766, -0.61786, 2.613055, 1, 0, 0.6196079, 1,
1.321067, -0.0613222, -0.3827551, 1, 0, 0.6117647, 1,
1.324214, -0.3331791, 0.9934166, 1, 0, 0.6078432, 1,
1.328793, -0.2521433, 1.102475, 1, 0, 0.6, 1,
1.333429, -1.963068, 2.001547, 1, 0, 0.5921569, 1,
1.339263, -1.132456, 3.275985, 1, 0, 0.5882353, 1,
1.34463, 1.858392, 0.7577314, 1, 0, 0.5803922, 1,
1.345998, 0.1958595, 1.803404, 1, 0, 0.5764706, 1,
1.34691, -1.345258, 3.871095, 1, 0, 0.5686275, 1,
1.348932, -0.4068977, 1.617359, 1, 0, 0.5647059, 1,
1.349749, 0.6445836, 1.563372, 1, 0, 0.5568628, 1,
1.355275, 0.9081948, -0.01764188, 1, 0, 0.5529412, 1,
1.366553, 1.084995, 1.533464, 1, 0, 0.5450981, 1,
1.370988, 0.3168284, 1.540286, 1, 0, 0.5411765, 1,
1.379772, 0.0633035, 0.988441, 1, 0, 0.5333334, 1,
1.384095, 1.389786, 1.687218, 1, 0, 0.5294118, 1,
1.38426, -0.782739, 2.399154, 1, 0, 0.5215687, 1,
1.389732, 1.661564, 3.629022, 1, 0, 0.5176471, 1,
1.399975, 1.075064, 1.535812, 1, 0, 0.509804, 1,
1.404981, -1.103601, 2.077349, 1, 0, 0.5058824, 1,
1.420157, -1.560149, 2.083004, 1, 0, 0.4980392, 1,
1.424867, -0.529326, 1.836319, 1, 0, 0.4901961, 1,
1.435961, 0.2485694, 1.218493, 1, 0, 0.4862745, 1,
1.442316, -0.3772234, 2.645432, 1, 0, 0.4784314, 1,
1.442624, 1.256211, 0.6070126, 1, 0, 0.4745098, 1,
1.445728, 0.4373237, 1.242884, 1, 0, 0.4666667, 1,
1.449441, 1.596694, 0.7946925, 1, 0, 0.4627451, 1,
1.462205, 0.3355323, 2.46223, 1, 0, 0.454902, 1,
1.471387, -0.8704684, 3.611295, 1, 0, 0.4509804, 1,
1.47611, -0.3256105, 1.40595, 1, 0, 0.4431373, 1,
1.485267, 0.9750302, 1.349076, 1, 0, 0.4392157, 1,
1.487216, 1.494643, -0.8250415, 1, 0, 0.4313726, 1,
1.490081, 0.8192257, -0.1793713, 1, 0, 0.427451, 1,
1.522467, 1.460342, 1.923158, 1, 0, 0.4196078, 1,
1.523072, 0.3491255, 2.886346, 1, 0, 0.4156863, 1,
1.53975, 1.864323, 2.219158, 1, 0, 0.4078431, 1,
1.547326, -1.54692, 1.999921, 1, 0, 0.4039216, 1,
1.548093, 0.2740657, 2.246996, 1, 0, 0.3960784, 1,
1.559018, -0.913792, 4.102769, 1, 0, 0.3882353, 1,
1.565097, 0.3298046, 1.371418, 1, 0, 0.3843137, 1,
1.571935, 0.5559301, 2.948171, 1, 0, 0.3764706, 1,
1.574058, -0.4834692, 0.5730743, 1, 0, 0.372549, 1,
1.574216, -0.3773714, 2.318501, 1, 0, 0.3647059, 1,
1.582613, 0.7225199, 3.128582, 1, 0, 0.3607843, 1,
1.590595, -0.8544763, 1.761339, 1, 0, 0.3529412, 1,
1.617214, -1.222855, 2.631236, 1, 0, 0.3490196, 1,
1.62189, -0.1790417, 0.02074274, 1, 0, 0.3411765, 1,
1.623115, -1.033476, 1.346098, 1, 0, 0.3372549, 1,
1.624866, 1.032461, 1.354677, 1, 0, 0.3294118, 1,
1.625646, -1.986892, 1.860605, 1, 0, 0.3254902, 1,
1.628726, 0.1630631, 1.905271, 1, 0, 0.3176471, 1,
1.641259, -1.348449, 2.532727, 1, 0, 0.3137255, 1,
1.64167, 1.182715, 3.211763, 1, 0, 0.3058824, 1,
1.661616, 0.8804818, 1.475872, 1, 0, 0.2980392, 1,
1.663654, -1.716815, 4.244774, 1, 0, 0.2941177, 1,
1.665397, 0.05548159, 2.964571, 1, 0, 0.2862745, 1,
1.67622, 1.013626, 0.9179798, 1, 0, 0.282353, 1,
1.681699, -0.181908, 1.798748, 1, 0, 0.2745098, 1,
1.688247, 0.8461446, 1.375856, 1, 0, 0.2705882, 1,
1.695592, 0.4363716, 0.1817125, 1, 0, 0.2627451, 1,
1.695733, -0.5995695, 0.9617497, 1, 0, 0.2588235, 1,
1.697447, -0.1925492, 1.551278, 1, 0, 0.2509804, 1,
1.69963, -0.8084837, 4.006709, 1, 0, 0.2470588, 1,
1.72369, 1.969037, 1.516822, 1, 0, 0.2392157, 1,
1.723945, 0.3535217, 1.359214, 1, 0, 0.2352941, 1,
1.72687, -0.2665991, 3.043343, 1, 0, 0.227451, 1,
1.728205, 1.277006, 1.625543, 1, 0, 0.2235294, 1,
1.747935, 1.802208, 0.2433243, 1, 0, 0.2156863, 1,
1.766858, -0.6660705, 3.136762, 1, 0, 0.2117647, 1,
1.766895, 1.16951, 1.112159, 1, 0, 0.2039216, 1,
1.77741, 0.4673415, 2.39197, 1, 0, 0.1960784, 1,
1.795721, 0.4199102, 2.280296, 1, 0, 0.1921569, 1,
1.804804, 0.4530547, 1.123424, 1, 0, 0.1843137, 1,
1.823044, -0.842575, 0.6525176, 1, 0, 0.1803922, 1,
1.827378, 0.4562303, 1.275858, 1, 0, 0.172549, 1,
1.843131, -0.1293185, 1.740282, 1, 0, 0.1686275, 1,
1.851617, 0.8850822, 1.174379, 1, 0, 0.1607843, 1,
1.857475, -0.3948949, 0.9153273, 1, 0, 0.1568628, 1,
1.886448, -0.01047126, 2.92029, 1, 0, 0.1490196, 1,
1.910251, -1.18668, 2.1806, 1, 0, 0.145098, 1,
1.922516, -0.03293897, 0.1005474, 1, 0, 0.1372549, 1,
1.931217, 0.976293, -0.6814771, 1, 0, 0.1333333, 1,
1.939772, 0.8451471, 0.02667345, 1, 0, 0.1254902, 1,
1.967496, 0.4613195, 2.730151, 1, 0, 0.1215686, 1,
2.054921, -0.6369984, 2.421056, 1, 0, 0.1137255, 1,
2.056868, -0.7179204, 2.12083, 1, 0, 0.1098039, 1,
2.067284, -0.7773375, 1.928647, 1, 0, 0.1019608, 1,
2.073829, 0.01315014, 0.4324921, 1, 0, 0.09411765, 1,
2.077341, 1.5384, 0.387865, 1, 0, 0.09019608, 1,
2.110337, -0.2051683, 0.7102118, 1, 0, 0.08235294, 1,
2.114871, 0.2221033, 1.243113, 1, 0, 0.07843138, 1,
2.118687, -0.1707153, 0.3496896, 1, 0, 0.07058824, 1,
2.173004, -1.048082, 1.562128, 1, 0, 0.06666667, 1,
2.178514, 2.510136, 1.182684, 1, 0, 0.05882353, 1,
2.22045, 1.230932, -2.355458, 1, 0, 0.05490196, 1,
2.342848, -0.2881794, 2.187868, 1, 0, 0.04705882, 1,
2.35643, 0.5304333, 1.679081, 1, 0, 0.04313726, 1,
2.402081, 0.3580069, 0.7088802, 1, 0, 0.03529412, 1,
2.514969, -0.7426147, 3.119877, 1, 0, 0.03137255, 1,
2.55125, 0.01057718, 0.8852411, 1, 0, 0.02352941, 1,
2.830171, -0.6897578, 0.658994, 1, 0, 0.01960784, 1,
2.836092, 0.2694024, 0.3274945, 1, 0, 0.01176471, 1,
3.028701, -0.2988856, 1.24764, 1, 0, 0.007843138, 1
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
-0.1633865, -4.259377, -6.548236, 0, -0.5, 0.5, 0.5,
-0.1633865, -4.259377, -6.548236, 1, -0.5, 0.5, 0.5,
-0.1633865, -4.259377, -6.548236, 1, 1.5, 0.5, 0.5,
-0.1633865, -4.259377, -6.548236, 0, 1.5, 0.5, 0.5
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
-4.437592, -0.1229243, -6.548236, 0, -0.5, 0.5, 0.5,
-4.437592, -0.1229243, -6.548236, 1, -0.5, 0.5, 0.5,
-4.437592, -0.1229243, -6.548236, 1, 1.5, 0.5, 0.5,
-4.437592, -0.1229243, -6.548236, 0, 1.5, 0.5, 0.5
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
-4.437592, -4.259377, 0.5148485, 0, -0.5, 0.5, 0.5,
-4.437592, -4.259377, 0.5148485, 1, -0.5, 0.5, 0.5,
-4.437592, -4.259377, 0.5148485, 1, 1.5, 0.5, 0.5,
-4.437592, -4.259377, 0.5148485, 0, 1.5, 0.5, 0.5
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
-3, -3.304811, -4.918294,
3, -3.304811, -4.918294,
-3, -3.304811, -4.918294,
-3, -3.463905, -5.189951,
-2, -3.304811, -4.918294,
-2, -3.463905, -5.189951,
-1, -3.304811, -4.918294,
-1, -3.463905, -5.189951,
0, -3.304811, -4.918294,
0, -3.463905, -5.189951,
1, -3.304811, -4.918294,
1, -3.463905, -5.189951,
2, -3.304811, -4.918294,
2, -3.463905, -5.189951,
3, -3.304811, -4.918294,
3, -3.463905, -5.189951
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
-3, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
-3, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
-3, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
-3, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5,
-2, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
-2, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
-2, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
-2, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5,
-1, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
-1, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
-1, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
-1, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5,
0, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
0, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
0, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
0, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5,
1, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
1, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
1, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
1, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5,
2, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
2, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
2, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
2, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5,
3, -3.782094, -5.733265, 0, -0.5, 0.5, 0.5,
3, -3.782094, -5.733265, 1, -0.5, 0.5, 0.5,
3, -3.782094, -5.733265, 1, 1.5, 0.5, 0.5,
3, -3.782094, -5.733265, 0, 1.5, 0.5, 0.5
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
-3.451237, -3, -4.918294,
-3.451237, 2, -4.918294,
-3.451237, -3, -4.918294,
-3.615629, -3, -5.189951,
-3.451237, -2, -4.918294,
-3.615629, -2, -5.189951,
-3.451237, -1, -4.918294,
-3.615629, -1, -5.189951,
-3.451237, 0, -4.918294,
-3.615629, 0, -5.189951,
-3.451237, 1, -4.918294,
-3.615629, 1, -5.189951,
-3.451237, 2, -4.918294,
-3.615629, 2, -5.189951
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
-3.944414, -3, -5.733265, 0, -0.5, 0.5, 0.5,
-3.944414, -3, -5.733265, 1, -0.5, 0.5, 0.5,
-3.944414, -3, -5.733265, 1, 1.5, 0.5, 0.5,
-3.944414, -3, -5.733265, 0, 1.5, 0.5, 0.5,
-3.944414, -2, -5.733265, 0, -0.5, 0.5, 0.5,
-3.944414, -2, -5.733265, 1, -0.5, 0.5, 0.5,
-3.944414, -2, -5.733265, 1, 1.5, 0.5, 0.5,
-3.944414, -2, -5.733265, 0, 1.5, 0.5, 0.5,
-3.944414, -1, -5.733265, 0, -0.5, 0.5, 0.5,
-3.944414, -1, -5.733265, 1, -0.5, 0.5, 0.5,
-3.944414, -1, -5.733265, 1, 1.5, 0.5, 0.5,
-3.944414, -1, -5.733265, 0, 1.5, 0.5, 0.5,
-3.944414, 0, -5.733265, 0, -0.5, 0.5, 0.5,
-3.944414, 0, -5.733265, 1, -0.5, 0.5, 0.5,
-3.944414, 0, -5.733265, 1, 1.5, 0.5, 0.5,
-3.944414, 0, -5.733265, 0, 1.5, 0.5, 0.5,
-3.944414, 1, -5.733265, 0, -0.5, 0.5, 0.5,
-3.944414, 1, -5.733265, 1, -0.5, 0.5, 0.5,
-3.944414, 1, -5.733265, 1, 1.5, 0.5, 0.5,
-3.944414, 1, -5.733265, 0, 1.5, 0.5, 0.5,
-3.944414, 2, -5.733265, 0, -0.5, 0.5, 0.5,
-3.944414, 2, -5.733265, 1, -0.5, 0.5, 0.5,
-3.944414, 2, -5.733265, 1, 1.5, 0.5, 0.5,
-3.944414, 2, -5.733265, 0, 1.5, 0.5, 0.5
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
-3.451237, -3.304811, -4,
-3.451237, -3.304811, 4,
-3.451237, -3.304811, -4,
-3.615629, -3.463905, -4,
-3.451237, -3.304811, -2,
-3.615629, -3.463905, -2,
-3.451237, -3.304811, 0,
-3.615629, -3.463905, 0,
-3.451237, -3.304811, 2,
-3.615629, -3.463905, 2,
-3.451237, -3.304811, 4,
-3.615629, -3.463905, 4
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
-3.944414, -3.782094, -4, 0, -0.5, 0.5, 0.5,
-3.944414, -3.782094, -4, 1, -0.5, 0.5, 0.5,
-3.944414, -3.782094, -4, 1, 1.5, 0.5, 0.5,
-3.944414, -3.782094, -4, 0, 1.5, 0.5, 0.5,
-3.944414, -3.782094, -2, 0, -0.5, 0.5, 0.5,
-3.944414, -3.782094, -2, 1, -0.5, 0.5, 0.5,
-3.944414, -3.782094, -2, 1, 1.5, 0.5, 0.5,
-3.944414, -3.782094, -2, 0, 1.5, 0.5, 0.5,
-3.944414, -3.782094, 0, 0, -0.5, 0.5, 0.5,
-3.944414, -3.782094, 0, 1, -0.5, 0.5, 0.5,
-3.944414, -3.782094, 0, 1, 1.5, 0.5, 0.5,
-3.944414, -3.782094, 0, 0, 1.5, 0.5, 0.5,
-3.944414, -3.782094, 2, 0, -0.5, 0.5, 0.5,
-3.944414, -3.782094, 2, 1, -0.5, 0.5, 0.5,
-3.944414, -3.782094, 2, 1, 1.5, 0.5, 0.5,
-3.944414, -3.782094, 2, 0, 1.5, 0.5, 0.5,
-3.944414, -3.782094, 4, 0, -0.5, 0.5, 0.5,
-3.944414, -3.782094, 4, 1, -0.5, 0.5, 0.5,
-3.944414, -3.782094, 4, 1, 1.5, 0.5, 0.5,
-3.944414, -3.782094, 4, 0, 1.5, 0.5, 0.5
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
-3.451237, -3.304811, -4.918294,
-3.451237, 3.058962, -4.918294,
-3.451237, -3.304811, 5.947991,
-3.451237, 3.058962, 5.947991,
-3.451237, -3.304811, -4.918294,
-3.451237, -3.304811, 5.947991,
-3.451237, 3.058962, -4.918294,
-3.451237, 3.058962, 5.947991,
-3.451237, -3.304811, -4.918294,
3.124464, -3.304811, -4.918294,
-3.451237, -3.304811, 5.947991,
3.124464, -3.304811, 5.947991,
-3.451237, 3.058962, -4.918294,
3.124464, 3.058962, -4.918294,
-3.451237, 3.058962, 5.947991,
3.124464, 3.058962, 5.947991,
3.124464, -3.304811, -4.918294,
3.124464, 3.058962, -4.918294,
3.124464, -3.304811, 5.947991,
3.124464, 3.058962, 5.947991,
3.124464, -3.304811, -4.918294,
3.124464, -3.304811, 5.947991,
3.124464, 3.058962, -4.918294,
3.124464, 3.058962, 5.947991
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
var radius = 7.585787;
var distance = 33.75002;
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
mvMatrix.translate( 0.1633865, 0.1229243, -0.5148485 );
mvMatrix.scale( 1.247305, 1.288843, 0.7548028 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.75002);
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
sec-butylamine_2-but<-read.table("sec-butylamine_2-but.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sec-butylamine_2-but$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-but$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-but$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
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
-3.355474, -0.1389177, -3.249135, 0, 0, 1, 1, 1,
-3.201193, 1.097234, -2.094824, 1, 0, 0, 1, 1,
-3.166606, -1.058137, -4.452039, 1, 0, 0, 1, 1,
-2.993602, -0.1618123, -2.020132, 1, 0, 0, 1, 1,
-2.637967, 0.600372, -0.6968617, 1, 0, 0, 1, 1,
-2.582949, 1.060387, -1.674227, 1, 0, 0, 1, 1,
-2.538471, 1.682382, -0.1777377, 0, 0, 0, 1, 1,
-2.531292, -0.9103153, -1.429182, 0, 0, 0, 1, 1,
-2.438166, 1.661661, -1.703411, 0, 0, 0, 1, 1,
-2.435778, -0.09199416, -2.771224, 0, 0, 0, 1, 1,
-2.406065, -0.07563236, -0.4194221, 0, 0, 0, 1, 1,
-2.364474, 1.299711, -0.2840146, 0, 0, 0, 1, 1,
-2.340031, 0.4572584, -2.55607, 0, 0, 0, 1, 1,
-2.303403, 1.033346, -1.735821, 1, 1, 1, 1, 1,
-2.209891, -0.05262785, -0.7933607, 1, 1, 1, 1, 1,
-2.167393, 1.220223, -0.917439, 1, 1, 1, 1, 1,
-2.146915, 0.6653223, -0.2253647, 1, 1, 1, 1, 1,
-2.094512, 0.439054, -2.721446, 1, 1, 1, 1, 1,
-2.042725, 0.8503185, 0.4088275, 1, 1, 1, 1, 1,
-1.984483, -0.8667477, -2.547738, 1, 1, 1, 1, 1,
-1.965277, 0.1305949, -1.925977, 1, 1, 1, 1, 1,
-1.90137, 0.7323914, -3.458768, 1, 1, 1, 1, 1,
-1.888389, 0.2050416, -2.006939, 1, 1, 1, 1, 1,
-1.873078, -1.157675, -2.396154, 1, 1, 1, 1, 1,
-1.840477, 1.194769, 2.291731, 1, 1, 1, 1, 1,
-1.833102, -0.853763, -2.524112, 1, 1, 1, 1, 1,
-1.815412, 1.108624, -0.7112508, 1, 1, 1, 1, 1,
-1.809051, 0.9961524, -0.5337932, 1, 1, 1, 1, 1,
-1.789168, 0.7977398, -2.838787, 0, 0, 1, 1, 1,
-1.778379, 1.25676, -1.652168, 1, 0, 0, 1, 1,
-1.769922, -0.0334727, -2.818302, 1, 0, 0, 1, 1,
-1.766267, -0.3425072, -1.378275, 1, 0, 0, 1, 1,
-1.721594, -1.479049, -3.359878, 1, 0, 0, 1, 1,
-1.689874, -0.4299557, -2.838878, 1, 0, 0, 1, 1,
-1.67802, -0.4388542, -2.906911, 0, 0, 0, 1, 1,
-1.676321, -0.2967803, -2.407629, 0, 0, 0, 1, 1,
-1.665785, 0.6844847, -1.333737, 0, 0, 0, 1, 1,
-1.657752, 0.2345187, -2.32288, 0, 0, 0, 1, 1,
-1.647496, -0.4425448, -1.609276, 0, 0, 0, 1, 1,
-1.631051, 0.6707078, -2.317059, 0, 0, 0, 1, 1,
-1.587404, 0.4102084, -0.7490896, 0, 0, 0, 1, 1,
-1.58636, 0.7263368, -1.771829, 1, 1, 1, 1, 1,
-1.580328, -0.2746119, -3.259186, 1, 1, 1, 1, 1,
-1.571653, -0.1269656, -0.1495114, 1, 1, 1, 1, 1,
-1.568844, 0.07426057, -0.7345942, 1, 1, 1, 1, 1,
-1.554301, 0.04662273, -1.916357, 1, 1, 1, 1, 1,
-1.533254, 0.6950683, -2.325092, 1, 1, 1, 1, 1,
-1.517901, -0.2579708, -0.1748977, 1, 1, 1, 1, 1,
-1.506823, 0.4751, -1.034472, 1, 1, 1, 1, 1,
-1.50506, -0.2107431, -1.635214, 1, 1, 1, 1, 1,
-1.504076, 0.1145972, -2.901902, 1, 1, 1, 1, 1,
-1.498595, -0.6664472, -0.7118038, 1, 1, 1, 1, 1,
-1.493323, 1.118895, -1.140643, 1, 1, 1, 1, 1,
-1.488609, -1.749465, -1.668787, 1, 1, 1, 1, 1,
-1.479762, 0.3043724, -1.376386, 1, 1, 1, 1, 1,
-1.474573, -0.1679689, 0.875286, 1, 1, 1, 1, 1,
-1.469439, -0.788217, -2.632135, 0, 0, 1, 1, 1,
-1.463249, -0.8605084, -2.888093, 1, 0, 0, 1, 1,
-1.452244, 0.3138974, -0.2721014, 1, 0, 0, 1, 1,
-1.451794, 1.137984, -3.34346, 1, 0, 0, 1, 1,
-1.450134, -0.6688064, -1.078909, 1, 0, 0, 1, 1,
-1.441306, -0.971733, -1.487602, 1, 0, 0, 1, 1,
-1.425738, 0.2648605, -1.887778, 0, 0, 0, 1, 1,
-1.425217, -0.1367716, -1.486799, 0, 0, 0, 1, 1,
-1.415523, -1.308258, -1.380103, 0, 0, 0, 1, 1,
-1.400495, 1.163836, -0.7227695, 0, 0, 0, 1, 1,
-1.392012, 0.3380848, -0.789726, 0, 0, 0, 1, 1,
-1.391388, 0.2409588, -0.4156577, 0, 0, 0, 1, 1,
-1.390834, 1.330774, -2.853776, 0, 0, 0, 1, 1,
-1.385556, -0.2061536, -1.67483, 1, 1, 1, 1, 1,
-1.381664, 0.325075, -2.587085, 1, 1, 1, 1, 1,
-1.376122, -0.6308852, -2.367076, 1, 1, 1, 1, 1,
-1.372982, -1.954043, -3.599891, 1, 1, 1, 1, 1,
-1.369147, 0.324959, -2.035117, 1, 1, 1, 1, 1,
-1.368949, 1.192785, -2.000413, 1, 1, 1, 1, 1,
-1.359202, 0.2247582, -0.1340453, 1, 1, 1, 1, 1,
-1.350618, -0.06745465, -1.325859, 1, 1, 1, 1, 1,
-1.349625, 2.785468, -0.2594622, 1, 1, 1, 1, 1,
-1.335495, 2.441558, -1.771914, 1, 1, 1, 1, 1,
-1.332064, 0.731151, -1.437882, 1, 1, 1, 1, 1,
-1.331652, -0.6126417, -1.108799, 1, 1, 1, 1, 1,
-1.321293, -1.288092, -2.473838, 1, 1, 1, 1, 1,
-1.317878, 0.6597669, -0.1312485, 1, 1, 1, 1, 1,
-1.302901, 1.160678, -0.5835125, 1, 1, 1, 1, 1,
-1.293391, 0.6851636, -1.539716, 0, 0, 1, 1, 1,
-1.293365, 0.05206925, -2.052423, 1, 0, 0, 1, 1,
-1.292548, 0.7955318, -1.394954, 1, 0, 0, 1, 1,
-1.287073, -0.5340163, -1.702353, 1, 0, 0, 1, 1,
-1.274662, 1.31191, 0.6662661, 1, 0, 0, 1, 1,
-1.273632, -0.7147119, -3.392976, 1, 0, 0, 1, 1,
-1.270805, 0.6605773, -1.441084, 0, 0, 0, 1, 1,
-1.254756, 0.9626736, -2.504928, 0, 0, 0, 1, 1,
-1.234566, -0.4821955, -2.175228, 0, 0, 0, 1, 1,
-1.229636, -0.7728915, -2.31622, 0, 0, 0, 1, 1,
-1.222106, 0.1530188, -1.080431, 0, 0, 0, 1, 1,
-1.218566, -0.4766114, -1.574752, 0, 0, 0, 1, 1,
-1.217062, -1.449309, -2.83708, 0, 0, 0, 1, 1,
-1.216324, 1.254051, -0.289292, 1, 1, 1, 1, 1,
-1.186648, 1.539411, -1.406112, 1, 1, 1, 1, 1,
-1.186004, 1.455073, -0.0935887, 1, 1, 1, 1, 1,
-1.180526, 0.08014727, -1.606553, 1, 1, 1, 1, 1,
-1.17888, -0.5799214, -3.122319, 1, 1, 1, 1, 1,
-1.172612, 0.8253236, -2.53224, 1, 1, 1, 1, 1,
-1.16889, -0.4186879, -1.930532, 1, 1, 1, 1, 1,
-1.156986, -0.3628614, -2.714529, 1, 1, 1, 1, 1,
-1.15045, 0.2942315, -3.849735, 1, 1, 1, 1, 1,
-1.138962, 0.01857538, -1.90456, 1, 1, 1, 1, 1,
-1.12509, -0.4231787, -1.216886, 1, 1, 1, 1, 1,
-1.115498, -0.4560029, -1.688137, 1, 1, 1, 1, 1,
-1.106624, 0.5532113, -0.7683355, 1, 1, 1, 1, 1,
-1.098574, 1.493184, -0.1533597, 1, 1, 1, 1, 1,
-1.095387, -0.3531218, -3.465196, 1, 1, 1, 1, 1,
-1.092654, 1.404777, -1.091941, 0, 0, 1, 1, 1,
-1.084988, -0.2992223, -2.396494, 1, 0, 0, 1, 1,
-1.083416, -0.4604684, -1.821193, 1, 0, 0, 1, 1,
-1.082808, 1.02394, -1.661685, 1, 0, 0, 1, 1,
-1.062762, 1.71436, -1.263382, 1, 0, 0, 1, 1,
-1.054417, -1.496559, -4.346728, 1, 0, 0, 1, 1,
-1.054275, 0.1505676, -0.09808572, 0, 0, 0, 1, 1,
-1.037761, -1.240702, -1.938369, 0, 0, 0, 1, 1,
-1.032255, 0.2283315, -1.582989, 0, 0, 0, 1, 1,
-1.029945, -0.1887326, -3.60758, 0, 0, 0, 1, 1,
-1.029223, 1.284247, -0.02156089, 0, 0, 0, 1, 1,
-1.0208, -0.4050896, -1.36264, 0, 0, 0, 1, 1,
-1.020562, 1.085935, -1.056562, 0, 0, 0, 1, 1,
-1.016864, -0.004095598, -0.08387515, 1, 1, 1, 1, 1,
-1.011916, 0.3857347, -0.8582602, 1, 1, 1, 1, 1,
-0.9970931, 0.6723529, -0.3326965, 1, 1, 1, 1, 1,
-0.9944657, -0.02687798, -2.500905, 1, 1, 1, 1, 1,
-0.9938042, 0.1613171, -3.020436, 1, 1, 1, 1, 1,
-0.9934027, -1.403872, -3.737979, 1, 1, 1, 1, 1,
-0.9902598, -1.103395, -3.52867, 1, 1, 1, 1, 1,
-0.9861404, 0.6419167, -1.038662, 1, 1, 1, 1, 1,
-0.9804537, 2.343581, 0.7619053, 1, 1, 1, 1, 1,
-0.9797438, -0.1784698, -2.453693, 1, 1, 1, 1, 1,
-0.9787319, -0.8683326, -0.502171, 1, 1, 1, 1, 1,
-0.9659983, -0.7551341, -2.186214, 1, 1, 1, 1, 1,
-0.9637445, -0.2833061, 0.09624626, 1, 1, 1, 1, 1,
-0.961014, -0.2135944, -3.165413, 1, 1, 1, 1, 1,
-0.9578367, -0.02148987, 0.3355016, 1, 1, 1, 1, 1,
-0.9577246, -0.2629426, -1.738421, 0, 0, 1, 1, 1,
-0.9556171, -1.390533, -1.904369, 1, 0, 0, 1, 1,
-0.9553092, -0.6641409, -2.886363, 1, 0, 0, 1, 1,
-0.9504592, -0.9469529, -2.472584, 1, 0, 0, 1, 1,
-0.9446907, 0.1211388, -0.9311437, 1, 0, 0, 1, 1,
-0.9441004, -1.090828, -4.520509, 1, 0, 0, 1, 1,
-0.9439445, -1.017607, -1.636015, 0, 0, 0, 1, 1,
-0.9402714, -1.594339, -2.498316, 0, 0, 0, 1, 1,
-0.9363075, -0.600764, -3.153696, 0, 0, 0, 1, 1,
-0.925281, -1.672615, -2.385446, 0, 0, 0, 1, 1,
-0.9242867, -0.9441442, -2.006391, 0, 0, 0, 1, 1,
-0.9232442, -2.687928, -2.785227, 0, 0, 0, 1, 1,
-0.9180321, 0.887638, -1.46084, 0, 0, 0, 1, 1,
-0.9156951, 2.04101, 0.8404147, 1, 1, 1, 1, 1,
-0.9150511, 1.069299, -0.1102029, 1, 1, 1, 1, 1,
-0.9117083, 0.9182869, -0.3077784, 1, 1, 1, 1, 1,
-0.9055226, -0.6595093, -2.517544, 1, 1, 1, 1, 1,
-0.9020671, 0.02303096, -1.247645, 1, 1, 1, 1, 1,
-0.8998451, 0.6504031, -1.797547, 1, 1, 1, 1, 1,
-0.8952339, -1.614787, -2.651872, 1, 1, 1, 1, 1,
-0.8950706, -0.8018633, -1.131075, 1, 1, 1, 1, 1,
-0.8936462, 0.6595451, -1.11437, 1, 1, 1, 1, 1,
-0.8893096, 0.06952788, -3.417547, 1, 1, 1, 1, 1,
-0.8775485, -0.2436059, -0.6417113, 1, 1, 1, 1, 1,
-0.8768274, -0.08585374, -1.785416, 1, 1, 1, 1, 1,
-0.8731523, -0.7462488, -2.615575, 1, 1, 1, 1, 1,
-0.8717905, 0.1270854, -0.257918, 1, 1, 1, 1, 1,
-0.870599, 0.05093281, 0.3154156, 1, 1, 1, 1, 1,
-0.8642346, 0.0903566, -1.582908, 0, 0, 1, 1, 1,
-0.8631581, 0.1476115, -1.268879, 1, 0, 0, 1, 1,
-0.8630223, -0.6010365, -1.165963, 1, 0, 0, 1, 1,
-0.8625477, -0.5846029, -1.441146, 1, 0, 0, 1, 1,
-0.8572856, -0.7559386, -1.11648, 1, 0, 0, 1, 1,
-0.8430281, -0.6051252, -2.09727, 1, 0, 0, 1, 1,
-0.8429471, 0.6436111, 0.9780455, 0, 0, 0, 1, 1,
-0.8418974, 1.191662, -0.9801037, 0, 0, 0, 1, 1,
-0.8408768, 0.0508948, -1.638996, 0, 0, 0, 1, 1,
-0.840459, -0.3848948, -0.2080906, 0, 0, 0, 1, 1,
-0.8404064, -1.486638, -1.832357, 0, 0, 0, 1, 1,
-0.8336524, 1.278116, -2.485057, 0, 0, 0, 1, 1,
-0.8257894, -0.05658744, -1.993025, 0, 0, 0, 1, 1,
-0.824381, -0.0953983, -0.7640299, 1, 1, 1, 1, 1,
-0.8221104, -0.5698783, -0.8462083, 1, 1, 1, 1, 1,
-0.8219849, -0.4665352, -2.173398, 1, 1, 1, 1, 1,
-0.8150353, -0.1608539, -2.460647, 1, 1, 1, 1, 1,
-0.8104419, -0.04757285, 0.5240306, 1, 1, 1, 1, 1,
-0.8081598, 1.903572, -1.78167, 1, 1, 1, 1, 1,
-0.8041487, 0.2906846, -0.8783808, 1, 1, 1, 1, 1,
-0.8023695, -1.147496, -2.877968, 1, 1, 1, 1, 1,
-0.8017647, 0.5650162, -0.9642004, 1, 1, 1, 1, 1,
-0.8004606, -1.733012, -2.837406, 1, 1, 1, 1, 1,
-0.7979332, -1.547542, -1.613175, 1, 1, 1, 1, 1,
-0.7914915, 0.4517871, -0.7662139, 1, 1, 1, 1, 1,
-0.7893494, -1.071131, -3.04955, 1, 1, 1, 1, 1,
-0.7786601, 1.283251, -0.8730269, 1, 1, 1, 1, 1,
-0.7756277, 1.621388, -0.4509952, 1, 1, 1, 1, 1,
-0.7727309, 0.7509865, 0.1361714, 0, 0, 1, 1, 1,
-0.7697786, -0.5797135, -1.638737, 1, 0, 0, 1, 1,
-0.7685499, -0.5141612, -1.144681, 1, 0, 0, 1, 1,
-0.7673478, 1.026697, 0.4802507, 1, 0, 0, 1, 1,
-0.7640355, 0.7913812, -0.003898423, 1, 0, 0, 1, 1,
-0.7611331, -0.1772035, -1.666807, 1, 0, 0, 1, 1,
-0.7611128, -0.7734398, -2.389092, 0, 0, 0, 1, 1,
-0.7607512, -0.1051858, -1.015517, 0, 0, 0, 1, 1,
-0.7607302, -1.154754, -2.151389, 0, 0, 0, 1, 1,
-0.7578157, -1.49046, -1.532271, 0, 0, 0, 1, 1,
-0.7568559, 0.02113904, -1.42567, 0, 0, 0, 1, 1,
-0.7544794, 2.108053, -1.083118, 0, 0, 0, 1, 1,
-0.7536421, 0.5872256, -2.405248, 0, 0, 0, 1, 1,
-0.7400588, 1.721775, 0.3268567, 1, 1, 1, 1, 1,
-0.7327524, -1.174203, -1.29407, 1, 1, 1, 1, 1,
-0.7284446, -0.7130563, -2.004242, 1, 1, 1, 1, 1,
-0.7223684, 1.12559, -0.5910563, 1, 1, 1, 1, 1,
-0.7165309, -0.5005668, -1.625584, 1, 1, 1, 1, 1,
-0.7113543, 0.9594606, -1.0777, 1, 1, 1, 1, 1,
-0.7104366, 1.764321, -0.06938802, 1, 1, 1, 1, 1,
-0.7069498, -0.3155388, -3.435869, 1, 1, 1, 1, 1,
-0.7066262, 0.1822341, -2.590589, 1, 1, 1, 1, 1,
-0.7045172, -1.100962, -2.853564, 1, 1, 1, 1, 1,
-0.6980847, 0.891863, -1.339185, 1, 1, 1, 1, 1,
-0.6909927, -0.9756881, -3.58148, 1, 1, 1, 1, 1,
-0.6909658, 1.773847, -1.646296, 1, 1, 1, 1, 1,
-0.6903787, 0.8098494, -0.04971742, 1, 1, 1, 1, 1,
-0.6880676, 1.615507, -1.371733, 1, 1, 1, 1, 1,
-0.6872296, 0.7026083, -1.37283, 0, 0, 1, 1, 1,
-0.6866323, 1.937904, -0.4028012, 1, 0, 0, 1, 1,
-0.6817471, 0.2119692, -0.6991687, 1, 0, 0, 1, 1,
-0.6812769, -0.7510749, -1.429376, 1, 0, 0, 1, 1,
-0.6790576, -0.6505064, -2.74448, 1, 0, 0, 1, 1,
-0.6777666, -0.6591113, -2.644773, 1, 0, 0, 1, 1,
-0.676535, -0.2367701, -3.899386, 0, 0, 0, 1, 1,
-0.6661276, -0.8407922, -3.324863, 0, 0, 0, 1, 1,
-0.664892, -1.567333, -4.310559, 0, 0, 0, 1, 1,
-0.6624998, -1.030931, -2.255517, 0, 0, 0, 1, 1,
-0.6620026, -1.29867, -1.058776, 0, 0, 0, 1, 1,
-0.6602077, 0.03882431, -1.558134, 0, 0, 0, 1, 1,
-0.6549062, -0.6903145, -1.057883, 0, 0, 0, 1, 1,
-0.6385908, 0.664817, -1.826967, 1, 1, 1, 1, 1,
-0.6362529, 0.546905, 0.1335337, 1, 1, 1, 1, 1,
-0.6351053, 0.2774096, 0.07366142, 1, 1, 1, 1, 1,
-0.6332576, -0.9277917, -2.541404, 1, 1, 1, 1, 1,
-0.6301206, -0.5206236, -3.856638, 1, 1, 1, 1, 1,
-0.6180022, 0.6844082, -1.465773, 1, 1, 1, 1, 1,
-0.6135098, -0.6796623, -2.994872, 1, 1, 1, 1, 1,
-0.6131405, -0.3236752, -1.923836, 1, 1, 1, 1, 1,
-0.6114666, -0.8386534, -2.549726, 1, 1, 1, 1, 1,
-0.6099222, 0.1720747, -1.889249, 1, 1, 1, 1, 1,
-0.6054369, -0.4825031, -1.796451, 1, 1, 1, 1, 1,
-0.6052645, 0.34065, -1.023306, 1, 1, 1, 1, 1,
-0.6042604, 0.596452, -0.1838607, 1, 1, 1, 1, 1,
-0.5996285, 0.03574071, -1.39424, 1, 1, 1, 1, 1,
-0.5973263, -2.147623, -3.389904, 1, 1, 1, 1, 1,
-0.5935724, -0.2237193, -2.196354, 0, 0, 1, 1, 1,
-0.5932698, 1.080061, 0.1452609, 1, 0, 0, 1, 1,
-0.5919744, 2.004823, -0.5711807, 1, 0, 0, 1, 1,
-0.590719, -0.6522444, -2.576186, 1, 0, 0, 1, 1,
-0.5883576, 1.225436, 0.7393613, 1, 0, 0, 1, 1,
-0.5879297, -0.4521827, -2.124327, 1, 0, 0, 1, 1,
-0.5782778, 0.04695253, -4.305934, 0, 0, 0, 1, 1,
-0.5766708, 0.876781, -2.841665, 0, 0, 0, 1, 1,
-0.5766441, 1.215024, -3.440498, 0, 0, 0, 1, 1,
-0.5760285, -0.9896843, -2.869595, 0, 0, 0, 1, 1,
-0.5755079, 0.2840592, 0.7343621, 0, 0, 0, 1, 1,
-0.5716301, 0.6289943, -0.4068489, 0, 0, 0, 1, 1,
-0.570364, -1.443201, -0.9549373, 0, 0, 0, 1, 1,
-0.5668798, -1.303579, -2.633611, 1, 1, 1, 1, 1,
-0.5651159, 1.663391, -2.170568, 1, 1, 1, 1, 1,
-0.5632783, 1.43033, -0.110822, 1, 1, 1, 1, 1,
-0.5615736, 1.351349, -1.272895, 1, 1, 1, 1, 1,
-0.561185, 0.9017842, 0.9790283, 1, 1, 1, 1, 1,
-0.5585718, 0.7111735, -0.935262, 1, 1, 1, 1, 1,
-0.5555404, -0.4024691, -1.955567, 1, 1, 1, 1, 1,
-0.5528328, 0.5475413, 0.4756588, 1, 1, 1, 1, 1,
-0.5520933, -0.05294783, -0.8206165, 1, 1, 1, 1, 1,
-0.5506854, 0.400812, -0.3735579, 1, 1, 1, 1, 1,
-0.5502723, -1.0119, -2.440299, 1, 1, 1, 1, 1,
-0.5462888, 1.56137, 0.4682381, 1, 1, 1, 1, 1,
-0.5451992, -0.5355088, -1.330784, 1, 1, 1, 1, 1,
-0.5450938, -1.444457, -2.758497, 1, 1, 1, 1, 1,
-0.5440047, -0.1442471, -2.239386, 1, 1, 1, 1, 1,
-0.5406372, 0.872251, -1.19587, 0, 0, 1, 1, 1,
-0.5396831, -0.3281083, -1.903252, 1, 0, 0, 1, 1,
-0.5366262, -0.510586, -1.975734, 1, 0, 0, 1, 1,
-0.5236676, -0.2739501, -2.261774, 1, 0, 0, 1, 1,
-0.5156268, 0.4034688, -1.553949, 1, 0, 0, 1, 1,
-0.5145772, -1.434988, -1.482479, 1, 0, 0, 1, 1,
-0.5144389, 1.081362, -0.174831, 0, 0, 0, 1, 1,
-0.5136511, -0.09622886, -0.6059046, 0, 0, 0, 1, 1,
-0.5096612, -0.5085567, -2.499739, 0, 0, 0, 1, 1,
-0.5056654, -2.624112, -3.054397, 0, 0, 0, 1, 1,
-0.5026367, -0.3487606, -1.537822, 0, 0, 0, 1, 1,
-0.4974151, -0.02179599, -2.254774, 0, 0, 0, 1, 1,
-0.493321, -0.6191226, -4.166879, 0, 0, 0, 1, 1,
-0.4930983, 0.2331143, 0.5361165, 1, 1, 1, 1, 1,
-0.4855829, -0.7861081, -3.120818, 1, 1, 1, 1, 1,
-0.4838896, 0.3435247, -1.891173, 1, 1, 1, 1, 1,
-0.4836735, -0.2283013, -0.8505308, 1, 1, 1, 1, 1,
-0.4819747, 0.7029098, 0.8672056, 1, 1, 1, 1, 1,
-0.4811001, 2.966286, 0.3092427, 1, 1, 1, 1, 1,
-0.4803077, -1.477425, -3.104066, 1, 1, 1, 1, 1,
-0.4769518, 0.5579722, -0.5742097, 1, 1, 1, 1, 1,
-0.4724146, -0.4736421, -2.398903, 1, 1, 1, 1, 1,
-0.4714765, -0.2744235, -2.881303, 1, 1, 1, 1, 1,
-0.4705011, 0.3343411, -1.445649, 1, 1, 1, 1, 1,
-0.4685816, -0.4878431, -1.432126, 1, 1, 1, 1, 1,
-0.4661315, -1.062023, -3.64946, 1, 1, 1, 1, 1,
-0.4600925, 0.04137205, -1.571274, 1, 1, 1, 1, 1,
-0.4561736, 0.5689886, 0.02844394, 1, 1, 1, 1, 1,
-0.4549226, -0.3454468, -1.876764, 0, 0, 1, 1, 1,
-0.4547181, -0.8614715, -2.373158, 1, 0, 0, 1, 1,
-0.4524744, -0.7539597, -2.573935, 1, 0, 0, 1, 1,
-0.4463213, 0.6709918, -1.195959, 1, 0, 0, 1, 1,
-0.4420009, 2.872741, 0.06011597, 1, 0, 0, 1, 1,
-0.441258, 0.7347964, 0.5551152, 1, 0, 0, 1, 1,
-0.4383528, 0.1290706, -2.200598, 0, 0, 0, 1, 1,
-0.4381842, -0.4226606, -2.235349, 0, 0, 0, 1, 1,
-0.4369309, 0.4571574, -1.475497, 0, 0, 0, 1, 1,
-0.4359356, -2.851993, -2.829139, 0, 0, 0, 1, 1,
-0.4336084, 1.05294, 0.3336411, 0, 0, 0, 1, 1,
-0.4317358, 0.3704449, -1.863457, 0, 0, 0, 1, 1,
-0.4279672, -0.552461, -2.783915, 0, 0, 0, 1, 1,
-0.416326, 0.4420668, -0.08103912, 1, 1, 1, 1, 1,
-0.4143401, -0.420795, -2.134312, 1, 1, 1, 1, 1,
-0.4106925, 1.441266, -0.5068321, 1, 1, 1, 1, 1,
-0.4078845, -0.7602434, -1.805319, 1, 1, 1, 1, 1,
-0.4073545, 2.023208, -0.299583, 1, 1, 1, 1, 1,
-0.4073037, -1.256212, -2.106108, 1, 1, 1, 1, 1,
-0.4062934, 1.005225, -0.5680116, 1, 1, 1, 1, 1,
-0.4035541, 0.1665143, -0.9317495, 1, 1, 1, 1, 1,
-0.4027633, -0.6104565, -3.705485, 1, 1, 1, 1, 1,
-0.3968219, 0.1390916, -0.2348935, 1, 1, 1, 1, 1,
-0.3965775, 0.3504011, -2.326992, 1, 1, 1, 1, 1,
-0.3946324, 0.440175, -2.180406, 1, 1, 1, 1, 1,
-0.3887644, -0.2256655, -2.446344, 1, 1, 1, 1, 1,
-0.3874756, -0.007206415, -0.9452924, 1, 1, 1, 1, 1,
-0.3839507, -0.2824011, -2.473933, 1, 1, 1, 1, 1,
-0.3831566, -0.07195535, -2.140124, 0, 0, 1, 1, 1,
-0.3801253, -2.465708, -4.07863, 1, 0, 0, 1, 1,
-0.3770318, -0.3475766, -2.75092, 1, 0, 0, 1, 1,
-0.3713713, 0.01850484, -1.982686, 1, 0, 0, 1, 1,
-0.3674947, -0.4409963, -4.122058, 1, 0, 0, 1, 1,
-0.3667735, -0.2085329, -2.705454, 1, 0, 0, 1, 1,
-0.3635983, -0.08940982, -2.178854, 0, 0, 0, 1, 1,
-0.3621621, 1.353451, 0.6968899, 0, 0, 0, 1, 1,
-0.3488545, 0.4164559, -0.6356218, 0, 0, 0, 1, 1,
-0.3446551, 1.175728, 0.1639002, 0, 0, 0, 1, 1,
-0.3422628, -0.6671883, -3.027029, 0, 0, 0, 1, 1,
-0.339864, -0.8972054, -3.504184, 0, 0, 0, 1, 1,
-0.3365071, 0.8977169, -3.492991, 0, 0, 0, 1, 1,
-0.3323181, -0.8153445, -2.435373, 1, 1, 1, 1, 1,
-0.3300562, -2.50072, -2.690723, 1, 1, 1, 1, 1,
-0.325721, 1.294568, 0.6675712, 1, 1, 1, 1, 1,
-0.3197295, 1.208841, -1.839254, 1, 1, 1, 1, 1,
-0.3152995, 1.072027, -0.4915477, 1, 1, 1, 1, 1,
-0.312526, -1.23809, -2.454712, 1, 1, 1, 1, 1,
-0.309589, -0.2147826, -3.361172, 1, 1, 1, 1, 1,
-0.3092386, -1.106387, -2.863223, 1, 1, 1, 1, 1,
-0.3078853, -1.218174, -2.958529, 1, 1, 1, 1, 1,
-0.3063293, -0.3311355, -2.870926, 1, 1, 1, 1, 1,
-0.2997146, 1.368785, 0.3891037, 1, 1, 1, 1, 1,
-0.2966127, 0.3972454, -1.169284, 1, 1, 1, 1, 1,
-0.2953857, 0.7630385, -1.519968, 1, 1, 1, 1, 1,
-0.2922792, 0.9940497, -1.053835, 1, 1, 1, 1, 1,
-0.2865688, 0.4294716, 0.3251548, 1, 1, 1, 1, 1,
-0.2846423, 0.3120127, -0.0507597, 0, 0, 1, 1, 1,
-0.2819289, -0.01343912, -1.544981, 1, 0, 0, 1, 1,
-0.2816528, -0.650886, -2.679166, 1, 0, 0, 1, 1,
-0.2795186, -1.192978, -2.278379, 1, 0, 0, 1, 1,
-0.2774297, 1.154698, 1.500871, 1, 0, 0, 1, 1,
-0.2768963, 0.1496339, -0.3529241, 1, 0, 0, 1, 1,
-0.2754027, -1.532394, -2.847106, 0, 0, 0, 1, 1,
-0.2753677, 0.7794366, 0.4966011, 0, 0, 0, 1, 1,
-0.266731, 0.1518952, -1.753473, 0, 0, 0, 1, 1,
-0.2613444, 1.901977, -1.365839, 0, 0, 0, 1, 1,
-0.2612475, -0.4814468, -2.800688, 0, 0, 0, 1, 1,
-0.2603468, 0.333393, -1.9058, 0, 0, 0, 1, 1,
-0.2587949, 1.672968, 0.3645915, 0, 0, 0, 1, 1,
-0.2587325, -1.531659, -1.131547, 1, 1, 1, 1, 1,
-0.2548694, -1.089031, -2.152802, 1, 1, 1, 1, 1,
-0.2532547, -0.02875017, -0.915693, 1, 1, 1, 1, 1,
-0.2515015, 0.103626, -2.765742, 1, 1, 1, 1, 1,
-0.2487614, -0.4882135, -4.493579, 1, 1, 1, 1, 1,
-0.2396757, 0.8215463, -1.144418, 1, 1, 1, 1, 1,
-0.234166, -0.7184449, -2.456375, 1, 1, 1, 1, 1,
-0.2303435, -0.6209922, -1.583546, 1, 1, 1, 1, 1,
-0.2287755, -0.1802897, -3.961173, 1, 1, 1, 1, 1,
-0.2284355, 0.5974272, 0.02000533, 1, 1, 1, 1, 1,
-0.2256654, -0.7665119, -2.674005, 1, 1, 1, 1, 1,
-0.2237723, 1.204775, 1.459643, 1, 1, 1, 1, 1,
-0.2103452, -1.659647, -3.52786, 1, 1, 1, 1, 1,
-0.2089377, 0.4324008, 0.9223672, 1, 1, 1, 1, 1,
-0.2046096, -0.9225335, -2.597696, 1, 1, 1, 1, 1,
-0.2018892, -0.4102544, -3.419994, 0, 0, 1, 1, 1,
-0.2007768, 0.3194386, -2.126489, 1, 0, 0, 1, 1,
-0.1973551, -0.8980609, -1.675819, 1, 0, 0, 1, 1,
-0.1949468, -0.6505116, -1.813517, 1, 0, 0, 1, 1,
-0.1941549, -0.9043599, -1.785605, 1, 0, 0, 1, 1,
-0.1935468, -0.2837998, -3.324884, 1, 0, 0, 1, 1,
-0.1935316, 0.7576923, 0.4497327, 0, 0, 0, 1, 1,
-0.1928307, 0.8488763, -1.878877, 0, 0, 0, 1, 1,
-0.1880783, 0.01474359, -0.7538478, 0, 0, 0, 1, 1,
-0.184154, -0.2156805, -1.906769, 0, 0, 0, 1, 1,
-0.1793043, -1.443689, -2.64713, 0, 0, 0, 1, 1,
-0.1762887, -0.8496747, -3.95955, 0, 0, 0, 1, 1,
-0.1749144, -0.9642045, -4.278492, 0, 0, 0, 1, 1,
-0.1714376, -1.116459, -1.95342, 1, 1, 1, 1, 1,
-0.1694362, -0.5857046, -2.929098, 1, 1, 1, 1, 1,
-0.1658916, -0.4390495, -4.003621, 1, 1, 1, 1, 1,
-0.1650057, -0.830941, -2.578083, 1, 1, 1, 1, 1,
-0.1647134, -0.8125507, -3.622467, 1, 1, 1, 1, 1,
-0.1630606, -0.06443989, -1.461262, 1, 1, 1, 1, 1,
-0.1614442, 0.3157002, -1.128569, 1, 1, 1, 1, 1,
-0.1608067, 0.9133061, -1.000524, 1, 1, 1, 1, 1,
-0.1554582, -0.7115644, -2.185502, 1, 1, 1, 1, 1,
-0.1546794, 0.5438746, 0.1719192, 1, 1, 1, 1, 1,
-0.1527975, -0.03876892, -3.458233, 1, 1, 1, 1, 1,
-0.1517748, -1.407439, -2.085963, 1, 1, 1, 1, 1,
-0.1497893, -0.448417, -3.921134, 1, 1, 1, 1, 1,
-0.1495166, -0.8114552, -1.441567, 1, 1, 1, 1, 1,
-0.147835, 0.9620363, 0.6989067, 1, 1, 1, 1, 1,
-0.14635, 0.1326652, -0.1242546, 0, 0, 1, 1, 1,
-0.1460274, 1.214124, 0.7262906, 1, 0, 0, 1, 1,
-0.1377195, -0.2660688, -1.124375, 1, 0, 0, 1, 1,
-0.1322328, -0.4959744, -4.759323, 1, 0, 0, 1, 1,
-0.126857, 0.1277606, -1.003145, 1, 0, 0, 1, 1,
-0.1245615, -0.4142236, -3.320015, 1, 0, 0, 1, 1,
-0.1236386, -1.444997, -3.477062, 0, 0, 0, 1, 1,
-0.1216973, 0.8335593, -0.1142099, 0, 0, 0, 1, 1,
-0.1199974, -0.1014295, -3.472553, 0, 0, 0, 1, 1,
-0.1195096, 0.9135688, 0.8, 0, 0, 0, 1, 1,
-0.1177367, -0.33159, -1.965177, 0, 0, 0, 1, 1,
-0.1171149, -1.007351, -4.14487, 0, 0, 0, 1, 1,
-0.1156586, 1.221113, -0.9806437, 0, 0, 0, 1, 1,
-0.1152995, -0.7533332, -3.879085, 1, 1, 1, 1, 1,
-0.1132964, -1.041644, -3.279507, 1, 1, 1, 1, 1,
-0.1116586, 0.4176292, -1.39145, 1, 1, 1, 1, 1,
-0.1112098, 0.219691, 0.01578658, 1, 1, 1, 1, 1,
-0.1085557, -1.255294, -3.745901, 1, 1, 1, 1, 1,
-0.1084069, -1.615925, -0.09718277, 1, 1, 1, 1, 1,
-0.1061353, 1.706018, -1.425227, 1, 1, 1, 1, 1,
-0.1006205, 0.1026832, -0.8291212, 1, 1, 1, 1, 1,
-0.100447, -3.212135, -4.760047, 1, 1, 1, 1, 1,
-0.09420706, -0.4935388, -1.065917, 1, 1, 1, 1, 1,
-0.09269734, 0.1400901, -0.5196342, 1, 1, 1, 1, 1,
-0.09140882, 0.8316983, 1.008871, 1, 1, 1, 1, 1,
-0.09055326, -0.3381092, -3.616744, 1, 1, 1, 1, 1,
-0.09011518, 0.7220265, 0.6976857, 1, 1, 1, 1, 1,
-0.08952651, 1.492987, 1.028751, 1, 1, 1, 1, 1,
-0.08846331, 1.780923, 1.347126, 0, 0, 1, 1, 1,
-0.08361583, -0.1762792, -3.480857, 1, 0, 0, 1, 1,
-0.07950995, 2.149448, -0.6447309, 1, 0, 0, 1, 1,
-0.07490182, 0.7621493, 0.1187794, 1, 0, 0, 1, 1,
-0.07283732, 2.28521, -0.9453375, 1, 0, 0, 1, 1,
-0.07276775, -0.6118522, -2.874078, 1, 0, 0, 1, 1,
-0.07271792, -1.013151, -3.719126, 0, 0, 0, 1, 1,
-0.07246087, 1.463334, -0.4095379, 0, 0, 0, 1, 1,
-0.06448318, 1.789976, 2.25288, 0, 0, 0, 1, 1,
-0.05165659, -0.3360176, -2.737844, 0, 0, 0, 1, 1,
-0.05055166, 1.711467, -1.24885, 0, 0, 0, 1, 1,
-0.04799658, -0.5403546, -2.912394, 0, 0, 0, 1, 1,
-0.04323592, -1.855505, -1.002341, 0, 0, 0, 1, 1,
-0.04208218, -0.221963, -2.621236, 1, 1, 1, 1, 1,
-0.04147442, 0.1566389, 1.442345, 1, 1, 1, 1, 1,
-0.04084658, 0.3965839, -1.091135, 1, 1, 1, 1, 1,
-0.03907257, 0.6035092, 0.1059621, 1, 1, 1, 1, 1,
-0.02961551, 0.9554753, -1.830676, 1, 1, 1, 1, 1,
-0.02453115, 2.257531, -1.290341, 1, 1, 1, 1, 1,
-0.02120795, -1.284801, -3.620901, 1, 1, 1, 1, 1,
-0.01779568, -1.419441, -2.874086, 1, 1, 1, 1, 1,
-0.01746733, 0.7634178, 0.2211404, 1, 1, 1, 1, 1,
-0.0171686, -0.07542242, -1.952684, 1, 1, 1, 1, 1,
-0.01236912, 0.8380746, -0.8155664, 1, 1, 1, 1, 1,
-0.01085999, 0.07497638, -1.058164, 1, 1, 1, 1, 1,
-0.007953642, -1.013892, -2.420032, 1, 1, 1, 1, 1,
-0.00736146, -0.8876321, -1.765399, 1, 1, 1, 1, 1,
-0.00410517, 1.086395, 0.2121362, 1, 1, 1, 1, 1,
-0.00266109, 1.396562, 1.9477, 0, 0, 1, 1, 1,
-0.002610182, -1.478763, -2.207115, 1, 0, 0, 1, 1,
-0.001236349, -0.4824483, -1.823005, 1, 0, 0, 1, 1,
0.000281142, -2.279556, 3.11719, 1, 0, 0, 1, 1,
0.002750986, -0.0840839, 2.797982, 1, 0, 0, 1, 1,
0.008803575, -1.335199, 4.238374, 1, 0, 0, 1, 1,
0.009492447, -1.871133, 4.464567, 0, 0, 0, 1, 1,
0.01187764, -0.2727868, 3.735231, 0, 0, 0, 1, 1,
0.01475275, 1.40017, 0.4588556, 0, 0, 0, 1, 1,
0.01863384, -0.3683814, 3.204219, 0, 0, 0, 1, 1,
0.01874708, -0.04165244, 1.924441, 0, 0, 0, 1, 1,
0.01917735, 0.9705822, 1.531868, 0, 0, 0, 1, 1,
0.02696983, 0.7615428, 0.1522358, 0, 0, 0, 1, 1,
0.02751946, -0.2246414, 3.29921, 1, 1, 1, 1, 1,
0.02760905, 0.3056526, 1.725827, 1, 1, 1, 1, 1,
0.02808883, -0.4905715, 4.169561, 1, 1, 1, 1, 1,
0.02876127, 0.7038643, -0.6743321, 1, 1, 1, 1, 1,
0.03170082, -1.068819, 2.328349, 1, 1, 1, 1, 1,
0.035039, 1.048012, -2.08595, 1, 1, 1, 1, 1,
0.03857553, -0.1180541, 3.423009, 1, 1, 1, 1, 1,
0.04179882, -1.650452, 5.789744, 1, 1, 1, 1, 1,
0.04267389, 0.3019917, -0.65029, 1, 1, 1, 1, 1,
0.0433932, -0.1587773, 2.81039, 1, 1, 1, 1, 1,
0.04365035, -1.140649, 2.085102, 1, 1, 1, 1, 1,
0.04376382, -1.087787, 5.073149, 1, 1, 1, 1, 1,
0.04415013, -0.4922478, 2.815764, 1, 1, 1, 1, 1,
0.04453332, -0.6355671, 2.30018, 1, 1, 1, 1, 1,
0.04507572, 0.6727163, 1.358338, 1, 1, 1, 1, 1,
0.04644985, -1.63568, 3.695819, 0, 0, 1, 1, 1,
0.0510867, 0.2353621, 0.1958431, 1, 0, 0, 1, 1,
0.05159068, -0.7050408, 4.623426, 1, 0, 0, 1, 1,
0.05344981, -0.4546447, 2.803713, 1, 0, 0, 1, 1,
0.0553708, 1.172091, -0.7006912, 1, 0, 0, 1, 1,
0.05960137, 0.2594543, 0.555684, 1, 0, 0, 1, 1,
0.06034708, -0.1050853, 2.479419, 0, 0, 0, 1, 1,
0.06356357, 0.6142861, 0.7315373, 0, 0, 0, 1, 1,
0.06905537, -0.3469765, 3.57596, 0, 0, 0, 1, 1,
0.06993559, -0.7044131, 1.420578, 0, 0, 0, 1, 1,
0.07259647, -0.3250997, 3.692362, 0, 0, 0, 1, 1,
0.0733737, 0.2391779, 1.065665, 0, 0, 0, 1, 1,
0.07408715, 1.168969, -0.1100838, 0, 0, 0, 1, 1,
0.07533339, -0.5579308, 2.97635, 1, 1, 1, 1, 1,
0.07995522, 0.3901828, 1.35406, 1, 1, 1, 1, 1,
0.08035371, 1.319925, 1.035128, 1, 1, 1, 1, 1,
0.08264666, -0.1883376, 2.297578, 1, 1, 1, 1, 1,
0.09024163, -0.02302173, 1.533668, 1, 1, 1, 1, 1,
0.0905318, -0.5296738, 5.138251, 1, 1, 1, 1, 1,
0.09114663, 0.149545, -0.3699038, 1, 1, 1, 1, 1,
0.09157676, 1.620165, 0.2465827, 1, 1, 1, 1, 1,
0.09202999, -0.3280767, 3.091773, 1, 1, 1, 1, 1,
0.09468301, -0.2360889, 2.808159, 1, 1, 1, 1, 1,
0.09515163, -1.953201, 1.896978, 1, 1, 1, 1, 1,
0.1064006, -0.7740774, 1.659323, 1, 1, 1, 1, 1,
0.1079372, -1.375427, 4.271815, 1, 1, 1, 1, 1,
0.1092389, -0.4543758, 2.681947, 1, 1, 1, 1, 1,
0.1098721, 0.3557948, 1.006272, 1, 1, 1, 1, 1,
0.114743, 0.5739542, 0.06304733, 0, 0, 1, 1, 1,
0.1163262, 1.735726, -0.343228, 1, 0, 0, 1, 1,
0.1192547, 1.213626, 0.4236612, 1, 0, 0, 1, 1,
0.1207833, 1.18453, 0.9157959, 1, 0, 0, 1, 1,
0.125188, -0.03749377, 2.5217, 1, 0, 0, 1, 1,
0.1296719, 0.2308925, 1.299804, 1, 0, 0, 1, 1,
0.1359009, 0.6753951, 1.204386, 0, 0, 0, 1, 1,
0.1360071, -1.189495, 4.537251, 0, 0, 0, 1, 1,
0.1375182, -0.8530498, 4.364053, 0, 0, 0, 1, 1,
0.1402294, -0.5762004, 3.087068, 0, 0, 0, 1, 1,
0.1429917, 0.9496968, 0.6734811, 0, 0, 0, 1, 1,
0.1431998, -0.3426924, 1.506281, 0, 0, 0, 1, 1,
0.1481537, 1.032398, -0.2737711, 0, 0, 0, 1, 1,
0.1484579, 0.05496127, 1.317414, 1, 1, 1, 1, 1,
0.1494651, 0.8161873, -0.8342254, 1, 1, 1, 1, 1,
0.1534808, 0.5447038, -1.534728, 1, 1, 1, 1, 1,
0.1540805, -1.018122, 3.185604, 1, 1, 1, 1, 1,
0.1579002, -0.3341734, 3.297361, 1, 1, 1, 1, 1,
0.162791, 2.096421, -0.7465714, 1, 1, 1, 1, 1,
0.1667759, 1.407037, -1.164767, 1, 1, 1, 1, 1,
0.1697523, -0.5360627, 3.476578, 1, 1, 1, 1, 1,
0.1717667, -1.406495, 2.508009, 1, 1, 1, 1, 1,
0.1734125, 1.523484, -0.4137423, 1, 1, 1, 1, 1,
0.1750899, 1.97388, 1.977173, 1, 1, 1, 1, 1,
0.1793828, 2.690411, 3.308697, 1, 1, 1, 1, 1,
0.1814875, 0.739639, -1.169897, 1, 1, 1, 1, 1,
0.1824936, 1.127924, -1.035482, 1, 1, 1, 1, 1,
0.1861702, -0.8000206, 3.73615, 1, 1, 1, 1, 1,
0.1884556, -0.7702864, 3.948437, 0, 0, 1, 1, 1,
0.1888052, -0.30539, 3.118177, 1, 0, 0, 1, 1,
0.1905284, -1.170994, 4.304975, 1, 0, 0, 1, 1,
0.1956389, -1.868323, 4.053723, 1, 0, 0, 1, 1,
0.1977071, -0.2137636, 2.380821, 1, 0, 0, 1, 1,
0.1984451, 0.2218191, 1.065284, 1, 0, 0, 1, 1,
0.1986775, -0.5269767, 3.070963, 0, 0, 0, 1, 1,
0.2000424, 1.405476, 1.557948, 0, 0, 0, 1, 1,
0.206026, 0.01270021, 2.104971, 0, 0, 0, 1, 1,
0.2085535, 1.314023, 1.149782, 0, 0, 0, 1, 1,
0.2089223, -1.437414, 3.422909, 0, 0, 0, 1, 1,
0.2100027, 0.236566, 0.5212035, 0, 0, 0, 1, 1,
0.2113879, -1.657744, 1.923476, 0, 0, 0, 1, 1,
0.2173404, 0.2510749, 0.5602388, 1, 1, 1, 1, 1,
0.2177858, 0.5134308, 0.06644277, 1, 1, 1, 1, 1,
0.2220951, -0.1293594, 2.930811, 1, 1, 1, 1, 1,
0.2245686, -0.8488987, 1.631296, 1, 1, 1, 1, 1,
0.2255244, 0.2467423, 0.8093017, 1, 1, 1, 1, 1,
0.2366255, 0.6593266, 0.1503524, 1, 1, 1, 1, 1,
0.237513, -0.9038216, 5.106695, 1, 1, 1, 1, 1,
0.2405106, -2.333388, 2.976674, 1, 1, 1, 1, 1,
0.2416385, 0.9348233, 1.047902, 1, 1, 1, 1, 1,
0.2446722, 0.6462194, 1.001007, 1, 1, 1, 1, 1,
0.2481995, 1.405641, 2.132726, 1, 1, 1, 1, 1,
0.2499208, -2.220172, 4.530753, 1, 1, 1, 1, 1,
0.2522651, 0.7265441, -0.183503, 1, 1, 1, 1, 1,
0.2542218, 0.4290535, -2.600004, 1, 1, 1, 1, 1,
0.2599375, 1.049604, -0.2985189, 1, 1, 1, 1, 1,
0.266388, 0.06411028, 0.6472571, 0, 0, 1, 1, 1,
0.26673, -0.9445665, 2.615469, 1, 0, 0, 1, 1,
0.2678233, -0.3619184, 1.659279, 1, 0, 0, 1, 1,
0.2718893, -1.609151, 3.418441, 1, 0, 0, 1, 1,
0.2756522, -0.3029667, 2.225814, 1, 0, 0, 1, 1,
0.2772295, -0.5226229, 2.928236, 1, 0, 0, 1, 1,
0.2790772, -0.1277388, 1.128615, 0, 0, 0, 1, 1,
0.2790927, -0.6471427, 3.289298, 0, 0, 0, 1, 1,
0.2818157, -0.945236, 2.542928, 0, 0, 0, 1, 1,
0.284843, -0.5791981, 2.386384, 0, 0, 0, 1, 1,
0.2881563, -1.145006, 3.699581, 0, 0, 0, 1, 1,
0.295577, -1.068659, 1.814808, 0, 0, 0, 1, 1,
0.2956099, -0.35372, 1.290278, 0, 0, 0, 1, 1,
0.2990218, 0.09437334, 1.822516, 1, 1, 1, 1, 1,
0.3040169, -1.257072, 1.904455, 1, 1, 1, 1, 1,
0.3097923, -0.6856139, 3.512536, 1, 1, 1, 1, 1,
0.3174618, -0.5407342, 1.75129, 1, 1, 1, 1, 1,
0.3192992, 0.7005509, -1.427137, 1, 1, 1, 1, 1,
0.3214892, -2.359586, 3.19216, 1, 1, 1, 1, 1,
0.3234662, -0.05858792, 3.804253, 1, 1, 1, 1, 1,
0.3246268, -0.5625365, 3.09223, 1, 1, 1, 1, 1,
0.3251528, -0.1078455, 0.3571323, 1, 1, 1, 1, 1,
0.3261469, 1.721213, 1.079719, 1, 1, 1, 1, 1,
0.3270788, -3.11611, 2.151361, 1, 1, 1, 1, 1,
0.3302957, -2.386707, 1.484846, 1, 1, 1, 1, 1,
0.3417233, 0.478279, 0.3434832, 1, 1, 1, 1, 1,
0.3432206, 0.01352645, 2.888888, 1, 1, 1, 1, 1,
0.3444065, -1.673965, 2.241168, 1, 1, 1, 1, 1,
0.3459089, -0.003625416, 2.423723, 0, 0, 1, 1, 1,
0.3575904, 0.3713408, 1.566005, 1, 0, 0, 1, 1,
0.3621983, 1.700454, 1.04756, 1, 0, 0, 1, 1,
0.3661193, 0.5785699, 0.3183042, 1, 0, 0, 1, 1,
0.3704142, -0.3374919, 0.4267812, 1, 0, 0, 1, 1,
0.3735479, -0.4743795, 1.068233, 1, 0, 0, 1, 1,
0.3772717, 0.8153437, 1.062375, 0, 0, 0, 1, 1,
0.3792884, -0.3858036, 1.152385, 0, 0, 0, 1, 1,
0.3793989, 0.3189116, 1.966532, 0, 0, 0, 1, 1,
0.3816152, 0.5438504, 1.623329, 0, 0, 0, 1, 1,
0.3832813, 0.3208185, 0.8163727, 0, 0, 0, 1, 1,
0.3833935, -2.303968, 2.284679, 0, 0, 0, 1, 1,
0.3836039, -1.283543, 2.907824, 0, 0, 0, 1, 1,
0.3850752, -0.5732516, 2.01317, 1, 1, 1, 1, 1,
0.3851693, -0.5306532, 3.21355, 1, 1, 1, 1, 1,
0.386127, -0.6867759, 2.538209, 1, 1, 1, 1, 1,
0.3877243, -0.2051883, 2.075217, 1, 1, 1, 1, 1,
0.3886574, 0.1768428, -0.2848266, 1, 1, 1, 1, 1,
0.390125, -1.58616, 3.079138, 1, 1, 1, 1, 1,
0.391844, -0.6766615, 1.653097, 1, 1, 1, 1, 1,
0.3995907, -0.5805101, 3.535121, 1, 1, 1, 1, 1,
0.404572, -1.895064, 2.645964, 1, 1, 1, 1, 1,
0.4077336, 0.720799, -0.3028756, 1, 1, 1, 1, 1,
0.4121415, 1.649809, -0.3214151, 1, 1, 1, 1, 1,
0.4137707, 0.3852304, 0.04566472, 1, 1, 1, 1, 1,
0.414832, -1.331402, 4.572102, 1, 1, 1, 1, 1,
0.415775, 0.7649747, -0.3032544, 1, 1, 1, 1, 1,
0.4168604, 1.281257, 1.164701, 1, 1, 1, 1, 1,
0.4186789, 0.7900993, 1.906698, 0, 0, 1, 1, 1,
0.4241951, -1.455059, 5.592107, 1, 0, 0, 1, 1,
0.4245501, 1.283242, 0.9505416, 1, 0, 0, 1, 1,
0.4246148, -1.498699, 1.878731, 1, 0, 0, 1, 1,
0.4262657, 0.0901003, 2.294832, 1, 0, 0, 1, 1,
0.4275684, -0.4722417, 2.303177, 1, 0, 0, 1, 1,
0.4304695, 0.2083703, 1.459789, 0, 0, 0, 1, 1,
0.4328915, 0.7804272, -0.06703852, 0, 0, 0, 1, 1,
0.4352162, 0.8542596, -0.7122304, 0, 0, 0, 1, 1,
0.43826, -0.1141166, 0.655341, 0, 0, 0, 1, 1,
0.4441829, 1.502707, 0.58575, 0, 0, 0, 1, 1,
0.4484951, 2.191953, -1.625549, 0, 0, 0, 1, 1,
0.4492, 0.7669422, -0.2131873, 0, 0, 0, 1, 1,
0.4497731, -0.264823, 3.930583, 1, 1, 1, 1, 1,
0.4502086, 0.3698952, 0.716456, 1, 1, 1, 1, 1,
0.4549412, 0.05456222, 2.692574, 1, 1, 1, 1, 1,
0.4600868, -2.25302, 2.007504, 1, 1, 1, 1, 1,
0.4614237, -0.8202261, 2.853653, 1, 1, 1, 1, 1,
0.4629948, -0.7097843, 4.533642, 1, 1, 1, 1, 1,
0.4672962, 1.760966, 0.2165798, 1, 1, 1, 1, 1,
0.4697332, -0.7479215, 3.071475, 1, 1, 1, 1, 1,
0.4729527, 0.2252664, 0.1531198, 1, 1, 1, 1, 1,
0.4736587, 0.8286422, 1.675889, 1, 1, 1, 1, 1,
0.4739116, 0.5567525, 0.7097222, 1, 1, 1, 1, 1,
0.4794113, -0.3681558, 2.904355, 1, 1, 1, 1, 1,
0.4823761, -1.661426, 2.397497, 1, 1, 1, 1, 1,
0.4824568, 0.8830938, 0.5476255, 1, 1, 1, 1, 1,
0.482778, -0.06483864, 1.562888, 1, 1, 1, 1, 1,
0.4832035, 0.4041148, 0.1771805, 0, 0, 1, 1, 1,
0.4833503, 0.2158672, 1.034511, 1, 0, 0, 1, 1,
0.4855354, -0.3161686, 1.506136, 1, 0, 0, 1, 1,
0.4891108, 0.7310684, -0.3323556, 1, 0, 0, 1, 1,
0.4907713, 0.4831323, -0.2024952, 1, 0, 0, 1, 1,
0.4913878, 0.2518716, 2.323432, 1, 0, 0, 1, 1,
0.4932579, -1.946335, 2.856116, 0, 0, 0, 1, 1,
0.5006376, 0.4690304, 1.064707, 0, 0, 0, 1, 1,
0.5015676, 0.3001584, 0.8501445, 0, 0, 0, 1, 1,
0.5020384, 0.9017608, 2.506951, 0, 0, 0, 1, 1,
0.5027235, -1.98893, 1.022766, 0, 0, 0, 1, 1,
0.502732, 0.6613684, 1.09382, 0, 0, 0, 1, 1,
0.5070102, -1.82596, 2.756112, 0, 0, 0, 1, 1,
0.5111732, 0.3846402, 0.9986755, 1, 1, 1, 1, 1,
0.5138423, 0.3568655, 1.759558, 1, 1, 1, 1, 1,
0.520049, 0.7036888, -1.367717, 1, 1, 1, 1, 1,
0.5205693, 1.076529, 0.2230899, 1, 1, 1, 1, 1,
0.520879, 0.1699783, 0.133829, 1, 1, 1, 1, 1,
0.5241598, 1.333777, -1.664079, 1, 1, 1, 1, 1,
0.5250779, 0.8049135, 1.537719, 1, 1, 1, 1, 1,
0.5292535, 1.072582, -0.4829469, 1, 1, 1, 1, 1,
0.53434, 0.832083, 0.6723791, 1, 1, 1, 1, 1,
0.5366056, -2.043349, 3.245312, 1, 1, 1, 1, 1,
0.5425076, -0.7550593, 0.1908392, 1, 1, 1, 1, 1,
0.546562, -0.467125, 2.389318, 1, 1, 1, 1, 1,
0.5474321, -0.1051902, 2.215649, 1, 1, 1, 1, 1,
0.5476082, 0.8479303, 1.761894, 1, 1, 1, 1, 1,
0.5519623, 1.032973, 0.2928634, 1, 1, 1, 1, 1,
0.5572191, -0.3367042, 1.024347, 0, 0, 1, 1, 1,
0.5597884, -0.1527675, 3.022401, 1, 0, 0, 1, 1,
0.5602848, -0.7193565, 2.375914, 1, 0, 0, 1, 1,
0.5629623, -1.215494, 2.47941, 1, 0, 0, 1, 1,
0.5644783, 0.6145637, 0.4017223, 1, 0, 0, 1, 1,
0.5660908, -0.2062564, 2.068751, 1, 0, 0, 1, 1,
0.5703338, 1.674834, 0.2127713, 0, 0, 0, 1, 1,
0.5721956, 1.454729, 0.3305606, 0, 0, 0, 1, 1,
0.5736851, -0.08901002, 3.416165, 0, 0, 0, 1, 1,
0.5739095, 1.056804, 0.3544792, 0, 0, 0, 1, 1,
0.5798563, 1.59091, -0.2653862, 0, 0, 0, 1, 1,
0.5803496, 0.4348078, 0.617287, 0, 0, 0, 1, 1,
0.5836205, -0.2604294, 0.5506988, 0, 0, 0, 1, 1,
0.5849113, 1.033193, -0.229142, 1, 1, 1, 1, 1,
0.5862954, 0.3628377, 1.607727, 1, 1, 1, 1, 1,
0.5887159, 0.4268615, 1.299696, 1, 1, 1, 1, 1,
0.5924364, -0.4619572, 2.459384, 1, 1, 1, 1, 1,
0.5936231, 0.3896666, 1.122167, 1, 1, 1, 1, 1,
0.5986011, 1.037932, -0.2338594, 1, 1, 1, 1, 1,
0.5994622, -0.2756231, 2.75758, 1, 1, 1, 1, 1,
0.5999845, -1.028445, 2.429676, 1, 1, 1, 1, 1,
0.6021259, 0.9900153, -0.9191747, 1, 1, 1, 1, 1,
0.6027716, 1.365496, -1.075005, 1, 1, 1, 1, 1,
0.6038421, -1.050509, 1.171763, 1, 1, 1, 1, 1,
0.6057099, -0.6089653, 2.179328, 1, 1, 1, 1, 1,
0.610658, -0.645255, 2.285284, 1, 1, 1, 1, 1,
0.6110084, -2.517629, 3.018445, 1, 1, 1, 1, 1,
0.6147399, -0.1001253, 1.249529, 1, 1, 1, 1, 1,
0.6160669, -2.250869, 1.926914, 0, 0, 1, 1, 1,
0.6179589, -0.5454648, 2.222207, 1, 0, 0, 1, 1,
0.6221735, 0.1571991, 1.476913, 1, 0, 0, 1, 1,
0.6232412, 0.9463015, 1.234076, 1, 0, 0, 1, 1,
0.6336436, -0.3579619, 2.297308, 1, 0, 0, 1, 1,
0.6361738, -1.149166, 2.684562, 1, 0, 0, 1, 1,
0.6396164, 1.439521, 0.2327444, 0, 0, 0, 1, 1,
0.6397055, 0.5189662, 0.1475963, 0, 0, 0, 1, 1,
0.6452364, 0.4079583, -0.2225379, 0, 0, 0, 1, 1,
0.645327, 1.049085, -0.6454329, 0, 0, 0, 1, 1,
0.6453781, 1.129619, -1.126177, 0, 0, 0, 1, 1,
0.6469682, 1.903144, 0.3003769, 0, 0, 0, 1, 1,
0.6516154, -0.4256434, 1.028409, 0, 0, 0, 1, 1,
0.6527601, 0.9095524, -0.1677316, 1, 1, 1, 1, 1,
0.6568405, 0.7031285, 0.03934839, 1, 1, 1, 1, 1,
0.658179, 0.8487675, 0.1275461, 1, 1, 1, 1, 1,
0.6592482, -1.377061, 3.739589, 1, 1, 1, 1, 1,
0.6621762, 0.1394769, 0.8268988, 1, 1, 1, 1, 1,
0.6637245, 0.9925975, 1.26001, 1, 1, 1, 1, 1,
0.6679684, 0.09837264, 1.772006, 1, 1, 1, 1, 1,
0.6737088, 0.3006396, 0.7183356, 1, 1, 1, 1, 1,
0.6745286, -0.1319054, 2.508487, 1, 1, 1, 1, 1,
0.6781971, -1.338714, 1.198579, 1, 1, 1, 1, 1,
0.6876084, 0.1906754, 1.298004, 1, 1, 1, 1, 1,
0.6896899, -0.5377909, 2.717274, 1, 1, 1, 1, 1,
0.6928872, -1.281847, 1.569089, 1, 1, 1, 1, 1,
0.6935176, 0.09364965, 2.125551, 1, 1, 1, 1, 1,
0.6951203, 2.200631, -0.3420334, 1, 1, 1, 1, 1,
0.6985058, 2.180476, 0.6157674, 0, 0, 1, 1, 1,
0.7015315, -0.9101952, 2.224887, 1, 0, 0, 1, 1,
0.707268, -0.6616422, 1.744936, 1, 0, 0, 1, 1,
0.7123585, 0.7421215, -0.5931078, 1, 0, 0, 1, 1,
0.7136496, -0.06602779, 2.414841, 1, 0, 0, 1, 1,
0.7187861, 0.3014287, 0.9922922, 1, 0, 0, 1, 1,
0.7230574, 0.2243317, 2.099931, 0, 0, 0, 1, 1,
0.7294368, 1.117552, 0.8114863, 0, 0, 0, 1, 1,
0.7383293, 0.2029447, 1.484869, 0, 0, 0, 1, 1,
0.7425409, -0.7949648, 2.64985, 0, 0, 0, 1, 1,
0.7427709, 0.006983175, 2.356709, 0, 0, 0, 1, 1,
0.7434759, -0.2050993, 2.97615, 0, 0, 0, 1, 1,
0.7472774, 1.628095, 0.5982401, 0, 0, 0, 1, 1,
0.7583324, -0.2759305, 1.922496, 1, 1, 1, 1, 1,
0.7597591, 0.6701798, 1.373796, 1, 1, 1, 1, 1,
0.7622444, -0.256065, 0.8763875, 1, 1, 1, 1, 1,
0.7629153, -1.020727, 3.134453, 1, 1, 1, 1, 1,
0.764599, -2.381284, 3.369884, 1, 1, 1, 1, 1,
0.770592, -0.9409148, 2.405236, 1, 1, 1, 1, 1,
0.7739365, 0.1727136, -0.09046839, 1, 1, 1, 1, 1,
0.779815, 0.6385486, -0.6209514, 1, 1, 1, 1, 1,
0.780246, 0.1302286, 2.515376, 1, 1, 1, 1, 1,
0.7829986, -1.320549, 3.786064, 1, 1, 1, 1, 1,
0.7865459, 0.6628772, -0.03347387, 1, 1, 1, 1, 1,
0.7889749, -0.1087001, 1.251499, 1, 1, 1, 1, 1,
0.7902762, -1.868624, 2.360149, 1, 1, 1, 1, 1,
0.7913787, -1.264373, 4.313223, 1, 1, 1, 1, 1,
0.7983168, 1.58604, 1.198238, 1, 1, 1, 1, 1,
0.7984096, 1.009018, 1.227776, 0, 0, 1, 1, 1,
0.8011993, -1.376821, 2.999486, 1, 0, 0, 1, 1,
0.8060211, -0.7405397, 3.105717, 1, 0, 0, 1, 1,
0.8081192, -0.7527521, 3.213246, 1, 0, 0, 1, 1,
0.8099679, 0.09854583, 1.450471, 1, 0, 0, 1, 1,
0.8105735, 0.0766396, 1.460553, 1, 0, 0, 1, 1,
0.8122152, 1.178065, 1.017448, 0, 0, 0, 1, 1,
0.8139116, -1.057235, 2.117177, 0, 0, 0, 1, 1,
0.8147977, -0.8365201, 3.105325, 0, 0, 0, 1, 1,
0.8280063, -0.6515211, 2.702312, 0, 0, 0, 1, 1,
0.8299528, -0.9313722, 3.194735, 0, 0, 0, 1, 1,
0.830143, 1.70997, 0.8529252, 0, 0, 0, 1, 1,
0.8323258, -0.6786538, 3.65869, 0, 0, 0, 1, 1,
0.8341062, 1.14097, 0.0005907851, 1, 1, 1, 1, 1,
0.8344464, -0.1278787, 1.537715, 1, 1, 1, 1, 1,
0.8355704, -0.1651942, 1.004159, 1, 1, 1, 1, 1,
0.8357981, -0.0547388, 2.950946, 1, 1, 1, 1, 1,
0.8428612, 0.6040742, 0.2991556, 1, 1, 1, 1, 1,
0.8480856, -0.5004606, 2.553714, 1, 1, 1, 1, 1,
0.8530325, 0.06458587, 0.2731001, 1, 1, 1, 1, 1,
0.8551229, -1.807361, 3.27509, 1, 1, 1, 1, 1,
0.8603885, -0.8066928, 3.586612, 1, 1, 1, 1, 1,
0.863691, 1.137572, 1.996735, 1, 1, 1, 1, 1,
0.8745854, -0.2252771, 1.492144, 1, 1, 1, 1, 1,
0.8748086, -0.889134, 3.114706, 1, 1, 1, 1, 1,
0.878823, -2.235138, 4.585827, 1, 1, 1, 1, 1,
0.8799645, 0.3062887, 1.186028, 1, 1, 1, 1, 1,
0.8810984, 2.323054, 2.001865, 1, 1, 1, 1, 1,
0.8816957, 1.139585, 1.801084, 0, 0, 1, 1, 1,
0.8894461, -1.530458, 2.279597, 1, 0, 0, 1, 1,
0.8933016, 0.2385607, 4.071313, 1, 0, 0, 1, 1,
0.896342, 0.05594184, 1.092935, 1, 0, 0, 1, 1,
0.9081578, -0.7203346, 3.702358, 1, 0, 0, 1, 1,
0.9158115, 1.909723, 2.299779, 1, 0, 0, 1, 1,
0.9258269, -2.244384, 3.264616, 0, 0, 0, 1, 1,
0.9387044, -0.8030704, 2.887676, 0, 0, 0, 1, 1,
0.9410039, 0.5269706, 1.224115, 0, 0, 0, 1, 1,
0.9411787, 0.2486578, 0.9864945, 0, 0, 0, 1, 1,
0.9488637, 1.668556, 0.3393078, 0, 0, 0, 1, 1,
0.9514612, 0.01595374, 1.415034, 0, 0, 0, 1, 1,
0.9542875, 0.8879079, 0.3595479, 0, 0, 0, 1, 1,
0.9570974, 1.990816, -0.3001867, 1, 1, 1, 1, 1,
0.9654099, -1.499698, 2.012684, 1, 1, 1, 1, 1,
0.967301, 2.874087, 0.456095, 1, 1, 1, 1, 1,
0.9716902, 0.000393349, 2.118957, 1, 1, 1, 1, 1,
0.9794165, -0.03312395, 0.7687921, 1, 1, 1, 1, 1,
0.981986, -2.03469, 2.370447, 1, 1, 1, 1, 1,
0.9895629, 0.9385017, -0.7598693, 1, 1, 1, 1, 1,
0.9915713, 0.3786646, 0.8446395, 1, 1, 1, 1, 1,
0.9998783, -1.379579, 2.241325, 1, 1, 1, 1, 1,
1.003309, 1.349559, 1.647496, 1, 1, 1, 1, 1,
1.003553, -1.505544, 4.108633, 1, 1, 1, 1, 1,
1.009813, 1.44092, -0.1659671, 1, 1, 1, 1, 1,
1.015172, 0.4160908, 1.157408, 1, 1, 1, 1, 1,
1.01572, 0.9092531, 0.3750823, 1, 1, 1, 1, 1,
1.023029, 1.13181, -0.08756242, 1, 1, 1, 1, 1,
1.027014, 0.600094, 1.923972, 0, 0, 1, 1, 1,
1.039818, -0.8470383, 1.813952, 1, 0, 0, 1, 1,
1.047161, -1.548453, 3.808918, 1, 0, 0, 1, 1,
1.049506, 0.2100587, 2.019037, 1, 0, 0, 1, 1,
1.062647, -1.33261, 2.253555, 1, 0, 0, 1, 1,
1.07281, -0.390334, 3.737314, 1, 0, 0, 1, 1,
1.079038, -0.1200933, 4.50179, 0, 0, 0, 1, 1,
1.079174, -1.317281, 2.515702, 0, 0, 0, 1, 1,
1.090842, -0.1081777, 1.482527, 0, 0, 0, 1, 1,
1.095476, -0.7987404, 3.030254, 0, 0, 0, 1, 1,
1.102681, -1.329185, 2.772004, 0, 0, 0, 1, 1,
1.103057, -0.5337747, 1.484729, 0, 0, 0, 1, 1,
1.103643, 1.074613, 0.7572641, 0, 0, 0, 1, 1,
1.117988, -1.423072, 2.228142, 1, 1, 1, 1, 1,
1.124257, 0.1663235, 0.2357474, 1, 1, 1, 1, 1,
1.126038, 0.8682072, -0.05447726, 1, 1, 1, 1, 1,
1.127059, 0.2912886, 0.506528, 1, 1, 1, 1, 1,
1.128031, -0.01610787, 2.105625, 1, 1, 1, 1, 1,
1.128144, 1.342753, 1.390445, 1, 1, 1, 1, 1,
1.130745, -0.486443, 2.715279, 1, 1, 1, 1, 1,
1.131857, -1.098774, 3.271381, 1, 1, 1, 1, 1,
1.132361, -1.444105, 3.361688, 1, 1, 1, 1, 1,
1.135221, 0.8459075, 0.1962077, 1, 1, 1, 1, 1,
1.142192, -0.5361077, 2.427697, 1, 1, 1, 1, 1,
1.143093, 0.1574304, -0.3399248, 1, 1, 1, 1, 1,
1.145629, 0.7037148, 1.422345, 1, 1, 1, 1, 1,
1.146466, 0.3145593, 2.358563, 1, 1, 1, 1, 1,
1.157278, -0.2634077, 2.369819, 1, 1, 1, 1, 1,
1.176714, 1.515007, 2.19848, 0, 0, 1, 1, 1,
1.182792, 0.3144027, 1.675298, 1, 0, 0, 1, 1,
1.183381, 2.541579, 1.302663, 1, 0, 0, 1, 1,
1.18414, 0.7250833, -0.1499382, 1, 0, 0, 1, 1,
1.186844, -1.12948, 3.173131, 1, 0, 0, 1, 1,
1.203962, -0.7836556, 2.251057, 1, 0, 0, 1, 1,
1.207492, -2.548707, 3.8068, 0, 0, 0, 1, 1,
1.217139, 0.4849625, -0.6704638, 0, 0, 0, 1, 1,
1.223012, -0.6333429, 1.687538, 0, 0, 0, 1, 1,
1.223494, 0.3626897, 1.572036, 0, 0, 0, 1, 1,
1.235206, -2.815061, 3.02297, 0, 0, 0, 1, 1,
1.253779, -1.541872, 2.562772, 0, 0, 0, 1, 1,
1.255498, 0.3954601, 0.2591402, 0, 0, 0, 1, 1,
1.257594, -1.309736, 1.310952, 1, 1, 1, 1, 1,
1.257944, 0.5211679, 1.201969, 1, 1, 1, 1, 1,
1.259147, 0.6690608, 0.4679486, 1, 1, 1, 1, 1,
1.260784, 1.360721, -0.1769378, 1, 1, 1, 1, 1,
1.262456, -0.7620391, 0.3807445, 1, 1, 1, 1, 1,
1.266545, -0.5577162, 2.471896, 1, 1, 1, 1, 1,
1.268082, -1.003204, 2.737401, 1, 1, 1, 1, 1,
1.276764, -0.1168655, 2.307886, 1, 1, 1, 1, 1,
1.278772, -0.6005396, 3.662791, 1, 1, 1, 1, 1,
1.28198, -0.5520782, 3.196456, 1, 1, 1, 1, 1,
1.288585, 0.6761145, 1.212995, 1, 1, 1, 1, 1,
1.2938, 0.4062766, 1.828663, 1, 1, 1, 1, 1,
1.294018, 1.015487, 0.08199206, 1, 1, 1, 1, 1,
1.299431, -1.007978, 0.604427, 1, 1, 1, 1, 1,
1.30361, -0.4371554, 2.266906, 1, 1, 1, 1, 1,
1.310395, -0.4091948, 4.345586, 0, 0, 1, 1, 1,
1.316766, -0.61786, 2.613055, 1, 0, 0, 1, 1,
1.321067, -0.0613222, -0.3827551, 1, 0, 0, 1, 1,
1.324214, -0.3331791, 0.9934166, 1, 0, 0, 1, 1,
1.328793, -0.2521433, 1.102475, 1, 0, 0, 1, 1,
1.333429, -1.963068, 2.001547, 1, 0, 0, 1, 1,
1.339263, -1.132456, 3.275985, 0, 0, 0, 1, 1,
1.34463, 1.858392, 0.7577314, 0, 0, 0, 1, 1,
1.345998, 0.1958595, 1.803404, 0, 0, 0, 1, 1,
1.34691, -1.345258, 3.871095, 0, 0, 0, 1, 1,
1.348932, -0.4068977, 1.617359, 0, 0, 0, 1, 1,
1.349749, 0.6445836, 1.563372, 0, 0, 0, 1, 1,
1.355275, 0.9081948, -0.01764188, 0, 0, 0, 1, 1,
1.366553, 1.084995, 1.533464, 1, 1, 1, 1, 1,
1.370988, 0.3168284, 1.540286, 1, 1, 1, 1, 1,
1.379772, 0.0633035, 0.988441, 1, 1, 1, 1, 1,
1.384095, 1.389786, 1.687218, 1, 1, 1, 1, 1,
1.38426, -0.782739, 2.399154, 1, 1, 1, 1, 1,
1.389732, 1.661564, 3.629022, 1, 1, 1, 1, 1,
1.399975, 1.075064, 1.535812, 1, 1, 1, 1, 1,
1.404981, -1.103601, 2.077349, 1, 1, 1, 1, 1,
1.420157, -1.560149, 2.083004, 1, 1, 1, 1, 1,
1.424867, -0.529326, 1.836319, 1, 1, 1, 1, 1,
1.435961, 0.2485694, 1.218493, 1, 1, 1, 1, 1,
1.442316, -0.3772234, 2.645432, 1, 1, 1, 1, 1,
1.442624, 1.256211, 0.6070126, 1, 1, 1, 1, 1,
1.445728, 0.4373237, 1.242884, 1, 1, 1, 1, 1,
1.449441, 1.596694, 0.7946925, 1, 1, 1, 1, 1,
1.462205, 0.3355323, 2.46223, 0, 0, 1, 1, 1,
1.471387, -0.8704684, 3.611295, 1, 0, 0, 1, 1,
1.47611, -0.3256105, 1.40595, 1, 0, 0, 1, 1,
1.485267, 0.9750302, 1.349076, 1, 0, 0, 1, 1,
1.487216, 1.494643, -0.8250415, 1, 0, 0, 1, 1,
1.490081, 0.8192257, -0.1793713, 1, 0, 0, 1, 1,
1.522467, 1.460342, 1.923158, 0, 0, 0, 1, 1,
1.523072, 0.3491255, 2.886346, 0, 0, 0, 1, 1,
1.53975, 1.864323, 2.219158, 0, 0, 0, 1, 1,
1.547326, -1.54692, 1.999921, 0, 0, 0, 1, 1,
1.548093, 0.2740657, 2.246996, 0, 0, 0, 1, 1,
1.559018, -0.913792, 4.102769, 0, 0, 0, 1, 1,
1.565097, 0.3298046, 1.371418, 0, 0, 0, 1, 1,
1.571935, 0.5559301, 2.948171, 1, 1, 1, 1, 1,
1.574058, -0.4834692, 0.5730743, 1, 1, 1, 1, 1,
1.574216, -0.3773714, 2.318501, 1, 1, 1, 1, 1,
1.582613, 0.7225199, 3.128582, 1, 1, 1, 1, 1,
1.590595, -0.8544763, 1.761339, 1, 1, 1, 1, 1,
1.617214, -1.222855, 2.631236, 1, 1, 1, 1, 1,
1.62189, -0.1790417, 0.02074274, 1, 1, 1, 1, 1,
1.623115, -1.033476, 1.346098, 1, 1, 1, 1, 1,
1.624866, 1.032461, 1.354677, 1, 1, 1, 1, 1,
1.625646, -1.986892, 1.860605, 1, 1, 1, 1, 1,
1.628726, 0.1630631, 1.905271, 1, 1, 1, 1, 1,
1.641259, -1.348449, 2.532727, 1, 1, 1, 1, 1,
1.64167, 1.182715, 3.211763, 1, 1, 1, 1, 1,
1.661616, 0.8804818, 1.475872, 1, 1, 1, 1, 1,
1.663654, -1.716815, 4.244774, 1, 1, 1, 1, 1,
1.665397, 0.05548159, 2.964571, 0, 0, 1, 1, 1,
1.67622, 1.013626, 0.9179798, 1, 0, 0, 1, 1,
1.681699, -0.181908, 1.798748, 1, 0, 0, 1, 1,
1.688247, 0.8461446, 1.375856, 1, 0, 0, 1, 1,
1.695592, 0.4363716, 0.1817125, 1, 0, 0, 1, 1,
1.695733, -0.5995695, 0.9617497, 1, 0, 0, 1, 1,
1.697447, -0.1925492, 1.551278, 0, 0, 0, 1, 1,
1.69963, -0.8084837, 4.006709, 0, 0, 0, 1, 1,
1.72369, 1.969037, 1.516822, 0, 0, 0, 1, 1,
1.723945, 0.3535217, 1.359214, 0, 0, 0, 1, 1,
1.72687, -0.2665991, 3.043343, 0, 0, 0, 1, 1,
1.728205, 1.277006, 1.625543, 0, 0, 0, 1, 1,
1.747935, 1.802208, 0.2433243, 0, 0, 0, 1, 1,
1.766858, -0.6660705, 3.136762, 1, 1, 1, 1, 1,
1.766895, 1.16951, 1.112159, 1, 1, 1, 1, 1,
1.77741, 0.4673415, 2.39197, 1, 1, 1, 1, 1,
1.795721, 0.4199102, 2.280296, 1, 1, 1, 1, 1,
1.804804, 0.4530547, 1.123424, 1, 1, 1, 1, 1,
1.823044, -0.842575, 0.6525176, 1, 1, 1, 1, 1,
1.827378, 0.4562303, 1.275858, 1, 1, 1, 1, 1,
1.843131, -0.1293185, 1.740282, 1, 1, 1, 1, 1,
1.851617, 0.8850822, 1.174379, 1, 1, 1, 1, 1,
1.857475, -0.3948949, 0.9153273, 1, 1, 1, 1, 1,
1.886448, -0.01047126, 2.92029, 1, 1, 1, 1, 1,
1.910251, -1.18668, 2.1806, 1, 1, 1, 1, 1,
1.922516, -0.03293897, 0.1005474, 1, 1, 1, 1, 1,
1.931217, 0.976293, -0.6814771, 1, 1, 1, 1, 1,
1.939772, 0.8451471, 0.02667345, 1, 1, 1, 1, 1,
1.967496, 0.4613195, 2.730151, 0, 0, 1, 1, 1,
2.054921, -0.6369984, 2.421056, 1, 0, 0, 1, 1,
2.056868, -0.7179204, 2.12083, 1, 0, 0, 1, 1,
2.067284, -0.7773375, 1.928647, 1, 0, 0, 1, 1,
2.073829, 0.01315014, 0.4324921, 1, 0, 0, 1, 1,
2.077341, 1.5384, 0.387865, 1, 0, 0, 1, 1,
2.110337, -0.2051683, 0.7102118, 0, 0, 0, 1, 1,
2.114871, 0.2221033, 1.243113, 0, 0, 0, 1, 1,
2.118687, -0.1707153, 0.3496896, 0, 0, 0, 1, 1,
2.173004, -1.048082, 1.562128, 0, 0, 0, 1, 1,
2.178514, 2.510136, 1.182684, 0, 0, 0, 1, 1,
2.22045, 1.230932, -2.355458, 0, 0, 0, 1, 1,
2.342848, -0.2881794, 2.187868, 0, 0, 0, 1, 1,
2.35643, 0.5304333, 1.679081, 1, 1, 1, 1, 1,
2.402081, 0.3580069, 0.7088802, 1, 1, 1, 1, 1,
2.514969, -0.7426147, 3.119877, 1, 1, 1, 1, 1,
2.55125, 0.01057718, 0.8852411, 1, 1, 1, 1, 1,
2.830171, -0.6897578, 0.658994, 1, 1, 1, 1, 1,
2.836092, 0.2694024, 0.3274945, 1, 1, 1, 1, 1,
3.028701, -0.2988856, 1.24764, 1, 1, 1, 1, 1
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
var radius = 9.441406;
var distance = 33.16254;
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
mvMatrix.translate( 0.1633866, 0.1229242, -0.5148485 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16254);
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
