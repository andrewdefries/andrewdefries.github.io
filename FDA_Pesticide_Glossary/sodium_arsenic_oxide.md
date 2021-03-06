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
-3.241466, 1.103794, -1.158568, 1, 0, 0, 1,
-2.867523, -1.763019, -1.415103, 1, 0.007843138, 0, 1,
-2.823259, -0.007867006, -0.03467124, 1, 0.01176471, 0, 1,
-2.642557, -0.07231802, -1.747391, 1, 0.01960784, 0, 1,
-2.513353, 0.1142256, -1.101046, 1, 0.02352941, 0, 1,
-2.512146, -0.9895766, -0.1113024, 1, 0.03137255, 0, 1,
-2.510672, 0.236999, -1.494655, 1, 0.03529412, 0, 1,
-2.401845, 1.610257, 1.144848, 1, 0.04313726, 0, 1,
-2.345131, -0.1895243, -2.169999, 1, 0.04705882, 0, 1,
-2.291869, -0.9729424, -2.773263, 1, 0.05490196, 0, 1,
-2.272535, 0.3169765, -1.342917, 1, 0.05882353, 0, 1,
-2.235372, 0.8031769, -1.081324, 1, 0.06666667, 0, 1,
-2.194737, 0.8296673, -0.9229743, 1, 0.07058824, 0, 1,
-2.147651, -0.4180757, 0.502822, 1, 0.07843138, 0, 1,
-2.117985, -1.693137, -2.957749, 1, 0.08235294, 0, 1,
-2.110041, -1.099093, -1.49448, 1, 0.09019608, 0, 1,
-2.1001, -0.1412173, -3.236735, 1, 0.09411765, 0, 1,
-2.072846, -0.3306894, -1.667927, 1, 0.1019608, 0, 1,
-2.072154, 0.9130723, -0.1048272, 1, 0.1098039, 0, 1,
-2.06769, 2.159236, 0.4162668, 1, 0.1137255, 0, 1,
-2.052326, -1.220882, 0.1898661, 1, 0.1215686, 0, 1,
-2.010473, -0.3385009, -2.214013, 1, 0.1254902, 0, 1,
-1.995263, 1.596038, -2.306489, 1, 0.1333333, 0, 1,
-1.982372, 1.463501, -0.5343491, 1, 0.1372549, 0, 1,
-1.96686, -0.4319983, -2.158605, 1, 0.145098, 0, 1,
-1.949027, -0.2705596, -1.813722, 1, 0.1490196, 0, 1,
-1.930626, -1.462907, -2.862669, 1, 0.1568628, 0, 1,
-1.887282, 0.4239087, -1.818429, 1, 0.1607843, 0, 1,
-1.881634, -0.01373087, -0.6566615, 1, 0.1686275, 0, 1,
-1.872218, 0.1517765, -1.477921, 1, 0.172549, 0, 1,
-1.868037, 0.1216926, -1.289983, 1, 0.1803922, 0, 1,
-1.866593, 0.8046718, -1.559046, 1, 0.1843137, 0, 1,
-1.841944, 0.3319595, -2.415965, 1, 0.1921569, 0, 1,
-1.833432, -0.8649611, -1.711411, 1, 0.1960784, 0, 1,
-1.830318, -0.4359647, -1.65732, 1, 0.2039216, 0, 1,
-1.806005, -0.6829067, -1.047889, 1, 0.2117647, 0, 1,
-1.745226, -1.372742, -4.154747, 1, 0.2156863, 0, 1,
-1.744633, -1.066851, -3.341301, 1, 0.2235294, 0, 1,
-1.737143, 1.126884, -1.570178, 1, 0.227451, 0, 1,
-1.737027, -0.1725091, -0.9971096, 1, 0.2352941, 0, 1,
-1.732058, 0.1590114, -0.99116, 1, 0.2392157, 0, 1,
-1.725729, -0.6572137, -3.062286, 1, 0.2470588, 0, 1,
-1.721309, 0.6115777, -0.04021602, 1, 0.2509804, 0, 1,
-1.718491, 2.505464, -0.2433732, 1, 0.2588235, 0, 1,
-1.718294, -0.1970896, -1.28336, 1, 0.2627451, 0, 1,
-1.717373, -0.1491376, -2.451465, 1, 0.2705882, 0, 1,
-1.695757, -1.108709, -3.1222, 1, 0.2745098, 0, 1,
-1.694651, -0.4683834, -2.517118, 1, 0.282353, 0, 1,
-1.692121, 0.4064182, -1.040569, 1, 0.2862745, 0, 1,
-1.677787, 0.02397098, -2.419777, 1, 0.2941177, 0, 1,
-1.665574, -0.8157023, -1.191881, 1, 0.3019608, 0, 1,
-1.657291, -0.7829821, -2.952405, 1, 0.3058824, 0, 1,
-1.656612, 0.3262679, -1.462265, 1, 0.3137255, 0, 1,
-1.647135, 0.04382331, -0.5222098, 1, 0.3176471, 0, 1,
-1.639235, 0.6992297, 1.553917, 1, 0.3254902, 0, 1,
-1.628827, -0.7986584, -2.171953, 1, 0.3294118, 0, 1,
-1.62305, 0.9783285, -1.214619, 1, 0.3372549, 0, 1,
-1.619366, 0.4872502, -0.4377854, 1, 0.3411765, 0, 1,
-1.610042, 0.2081929, -1.062604, 1, 0.3490196, 0, 1,
-1.603558, 0.8689738, -3.346216, 1, 0.3529412, 0, 1,
-1.589346, 0.8572843, -0.07245748, 1, 0.3607843, 0, 1,
-1.563281, -0.5383559, -1.244521, 1, 0.3647059, 0, 1,
-1.559908, -0.09396709, -1.331098, 1, 0.372549, 0, 1,
-1.553018, -1.827683, -3.799249, 1, 0.3764706, 0, 1,
-1.550952, -0.4040695, -1.282186, 1, 0.3843137, 0, 1,
-1.550367, -0.2709546, 0.003117306, 1, 0.3882353, 0, 1,
-1.541687, 0.1843083, -1.683442, 1, 0.3960784, 0, 1,
-1.534673, -0.6656327, -1.425794, 1, 0.4039216, 0, 1,
-1.52183, 0.9857472, -2.106162, 1, 0.4078431, 0, 1,
-1.520626, -1.200075, -2.313674, 1, 0.4156863, 0, 1,
-1.518266, -1.190295, -4.35166, 1, 0.4196078, 0, 1,
-1.517351, 1.695979, 0.4115616, 1, 0.427451, 0, 1,
-1.509247, 1.549902, -0.3736003, 1, 0.4313726, 0, 1,
-1.494441, -1.401167, -3.142394, 1, 0.4392157, 0, 1,
-1.488109, -0.2421383, -0.8976433, 1, 0.4431373, 0, 1,
-1.479086, 0.4354025, -0.9366403, 1, 0.4509804, 0, 1,
-1.469575, 0.6669729, -2.092476, 1, 0.454902, 0, 1,
-1.468058, 0.9083013, 0.4062105, 1, 0.4627451, 0, 1,
-1.463116, -0.9207998, -2.109399, 1, 0.4666667, 0, 1,
-1.447854, -0.9056568, -3.136468, 1, 0.4745098, 0, 1,
-1.445773, 0.9043623, 1.755688, 1, 0.4784314, 0, 1,
-1.437926, -0.9184144, -3.772439, 1, 0.4862745, 0, 1,
-1.42217, 0.5344638, -0.7978404, 1, 0.4901961, 0, 1,
-1.419744, -1.348862, -1.461462, 1, 0.4980392, 0, 1,
-1.419647, 1.060961, -0.4717238, 1, 0.5058824, 0, 1,
-1.413469, 2.608818, -0.2282625, 1, 0.509804, 0, 1,
-1.413327, 0.5666317, -2.872779, 1, 0.5176471, 0, 1,
-1.411533, 1.071709, -0.8943154, 1, 0.5215687, 0, 1,
-1.408533, -1.81676, -2.228302, 1, 0.5294118, 0, 1,
-1.393174, 0.9139097, 0.7304694, 1, 0.5333334, 0, 1,
-1.385835, -1.05021, -1.48696, 1, 0.5411765, 0, 1,
-1.375419, 0.1892829, -3.132545, 1, 0.5450981, 0, 1,
-1.36251, -0.552779, -3.483767, 1, 0.5529412, 0, 1,
-1.338307, -0.4124898, -2.281918, 1, 0.5568628, 0, 1,
-1.335628, -0.5607681, -3.362263, 1, 0.5647059, 0, 1,
-1.328312, 0.8087307, -2.820784, 1, 0.5686275, 0, 1,
-1.323629, -1.196614, -4.170526, 1, 0.5764706, 0, 1,
-1.316832, 0.5989185, -2.550801, 1, 0.5803922, 0, 1,
-1.3031, 1.121427, -0.3800533, 1, 0.5882353, 0, 1,
-1.302491, 0.2448392, -1.782944, 1, 0.5921569, 0, 1,
-1.301679, -1.016299, -1.143867, 1, 0.6, 0, 1,
-1.294402, -0.2650304, -2.911268, 1, 0.6078432, 0, 1,
-1.294317, -0.8835468, -2.576854, 1, 0.6117647, 0, 1,
-1.285335, -0.899673, -2.129336, 1, 0.6196079, 0, 1,
-1.281249, -1.412361, -3.028827, 1, 0.6235294, 0, 1,
-1.277663, -1.203624, -3.538032, 1, 0.6313726, 0, 1,
-1.275951, 0.7643684, -1.058331, 1, 0.6352941, 0, 1,
-1.273515, 0.1215923, -0.4561197, 1, 0.6431373, 0, 1,
-1.273266, -0.2404452, -1.02155, 1, 0.6470588, 0, 1,
-1.265877, 2.035014, -0.1295969, 1, 0.654902, 0, 1,
-1.255983, 0.973357, 0.287807, 1, 0.6588235, 0, 1,
-1.251148, 0.6063821, -2.019717, 1, 0.6666667, 0, 1,
-1.244512, -1.527787, -2.435887, 1, 0.6705883, 0, 1,
-1.23622, -1.096055, -0.7470452, 1, 0.6784314, 0, 1,
-1.234377, -0.758292, -2.194667, 1, 0.682353, 0, 1,
-1.231863, -1.098746, -2.908709, 1, 0.6901961, 0, 1,
-1.214049, -0.819711, -1.418263, 1, 0.6941177, 0, 1,
-1.212952, 0.05017732, -1.059228, 1, 0.7019608, 0, 1,
-1.20657, 0.04118086, 0.479269, 1, 0.7098039, 0, 1,
-1.204357, -0.4841329, -2.200887, 1, 0.7137255, 0, 1,
-1.200069, -0.1633406, -1.72692, 1, 0.7215686, 0, 1,
-1.182833, 0.248333, -0.7778863, 1, 0.7254902, 0, 1,
-1.180515, -0.7494866, -2.399506, 1, 0.7333333, 0, 1,
-1.180058, 0.4272959, -2.059609, 1, 0.7372549, 0, 1,
-1.177867, 0.7204682, 1.007254, 1, 0.7450981, 0, 1,
-1.170736, -1.962531, -1.209432, 1, 0.7490196, 0, 1,
-1.167603, -1.331225, -1.839452, 1, 0.7568628, 0, 1,
-1.167197, 1.470571, -0.8368824, 1, 0.7607843, 0, 1,
-1.164309, 0.9521656, -2.981925, 1, 0.7686275, 0, 1,
-1.16374, 0.1671969, -1.718791, 1, 0.772549, 0, 1,
-1.158104, 0.9068996, -0.4242665, 1, 0.7803922, 0, 1,
-1.155068, -1.629615, -3.330802, 1, 0.7843137, 0, 1,
-1.154296, -0.9899256, -2.993613, 1, 0.7921569, 0, 1,
-1.152404, -0.9180717, -2.179942, 1, 0.7960784, 0, 1,
-1.151329, -0.1255062, -1.57835, 1, 0.8039216, 0, 1,
-1.1439, -1.278109, -1.998674, 1, 0.8117647, 0, 1,
-1.141722, -0.2861665, -1.833627, 1, 0.8156863, 0, 1,
-1.140599, 0.3762074, -0.044536, 1, 0.8235294, 0, 1,
-1.135543, 1.418462, -2.115117, 1, 0.827451, 0, 1,
-1.130321, 0.5097347, -1.911891, 1, 0.8352941, 0, 1,
-1.129332, 0.7004061, -1.610396, 1, 0.8392157, 0, 1,
-1.119944, -2.041778, -1.564973, 1, 0.8470588, 0, 1,
-1.112274, -0.2699625, -1.633173, 1, 0.8509804, 0, 1,
-1.109943, 1.671652, 0.6507527, 1, 0.8588235, 0, 1,
-1.102289, 0.9646105, -0.5088838, 1, 0.8627451, 0, 1,
-1.090029, -0.198115, -2.738819, 1, 0.8705882, 0, 1,
-1.085235, -0.9423609, -2.480156, 1, 0.8745098, 0, 1,
-1.078277, -1.547267, -1.808708, 1, 0.8823529, 0, 1,
-1.074657, -1.353114, -2.858183, 1, 0.8862745, 0, 1,
-1.072267, -0.07220595, -2.14941, 1, 0.8941177, 0, 1,
-1.070897, -0.353288, -0.570862, 1, 0.8980392, 0, 1,
-1.069946, 0.2011608, -2.311116, 1, 0.9058824, 0, 1,
-1.067154, -1.050863, -1.738677, 1, 0.9137255, 0, 1,
-1.065375, -1.089661, -1.755325, 1, 0.9176471, 0, 1,
-1.059735, -0.1764701, -0.7611477, 1, 0.9254902, 0, 1,
-1.051178, 0.9494877, -0.9334282, 1, 0.9294118, 0, 1,
-1.042595, 0.1156182, -0.6531343, 1, 0.9372549, 0, 1,
-1.040123, -0.7207354, -0.9053124, 1, 0.9411765, 0, 1,
-1.03712, 0.9926156, -1.699364, 1, 0.9490196, 0, 1,
-1.031456, -0.9612391, -2.564167, 1, 0.9529412, 0, 1,
-1.024558, -1.531732, -4.268185, 1, 0.9607843, 0, 1,
-1.024208, -0.459358, -2.897657, 1, 0.9647059, 0, 1,
-1.016434, -0.1348721, -0.6651667, 1, 0.972549, 0, 1,
-1.015588, 0.13324, -1.349728, 1, 0.9764706, 0, 1,
-1.014227, -1.717875, -1.590942, 1, 0.9843137, 0, 1,
-1.010736, 1.211304, -1.647983, 1, 0.9882353, 0, 1,
-1.007536, 1.177496, -0.2811763, 1, 0.9960784, 0, 1,
-1.004744, -2.265891, -2.826044, 0.9960784, 1, 0, 1,
-1.002739, 0.6299725, -0.9435592, 0.9921569, 1, 0, 1,
-1.000147, 1.415837, 0.4022713, 0.9843137, 1, 0, 1,
-0.9893038, 0.8694888, -0.7751073, 0.9803922, 1, 0, 1,
-0.9885899, -0.7774295, -2.742126, 0.972549, 1, 0, 1,
-0.9852594, -0.691763, -2.791111, 0.9686275, 1, 0, 1,
-0.9849682, 0.3216667, -1.311597, 0.9607843, 1, 0, 1,
-0.9800498, 1.12155, -0.1893057, 0.9568627, 1, 0, 1,
-0.9788905, -1.381724, -3.415378, 0.9490196, 1, 0, 1,
-0.978455, -0.3320627, -2.634527, 0.945098, 1, 0, 1,
-0.9784234, -0.03878405, -2.12034, 0.9372549, 1, 0, 1,
-0.9756352, -0.2005875, -2.132589, 0.9333333, 1, 0, 1,
-0.9732629, 0.399878, -2.092161, 0.9254902, 1, 0, 1,
-0.9603228, 0.3713042, -1.282925, 0.9215686, 1, 0, 1,
-0.9585746, -0.01051731, -0.2043313, 0.9137255, 1, 0, 1,
-0.9554253, -2.743902, -1.616404, 0.9098039, 1, 0, 1,
-0.9505786, -0.6898766, -4.121277, 0.9019608, 1, 0, 1,
-0.9498618, 0.6009952, -0.2286162, 0.8941177, 1, 0, 1,
-0.9497061, -0.1728658, 0.8053181, 0.8901961, 1, 0, 1,
-0.9456037, -0.187827, -0.8358234, 0.8823529, 1, 0, 1,
-0.9236457, -0.4815305, -3.423317, 0.8784314, 1, 0, 1,
-0.9116967, -0.3150589, -1.99828, 0.8705882, 1, 0, 1,
-0.9110568, 0.6578496, -1.243133, 0.8666667, 1, 0, 1,
-0.9088516, -0.3834294, -4.293915, 0.8588235, 1, 0, 1,
-0.9023018, 0.191079, 0.2624541, 0.854902, 1, 0, 1,
-0.9012004, -0.2250473, -2.477043, 0.8470588, 1, 0, 1,
-0.8943591, -0.4630399, -1.893686, 0.8431373, 1, 0, 1,
-0.8909622, 0.8618515, 0.5979766, 0.8352941, 1, 0, 1,
-0.8866275, 0.5593026, -0.0351624, 0.8313726, 1, 0, 1,
-0.885052, -0.1972516, -2.804654, 0.8235294, 1, 0, 1,
-0.8849354, -0.358953, -4.095468, 0.8196079, 1, 0, 1,
-0.8844678, -0.7272574, -2.672397, 0.8117647, 1, 0, 1,
-0.8836313, -0.4859801, -1.406827, 0.8078431, 1, 0, 1,
-0.8818387, 0.4836397, -1.844957, 0.8, 1, 0, 1,
-0.8795563, 0.3615615, -1.530429, 0.7921569, 1, 0, 1,
-0.8778702, 0.375494, -1.385027, 0.7882353, 1, 0, 1,
-0.8778035, 0.5811161, -1.697327, 0.7803922, 1, 0, 1,
-0.8768812, 0.4182216, -1.020771, 0.7764706, 1, 0, 1,
-0.8755842, -1.358866, -1.492251, 0.7686275, 1, 0, 1,
-0.8753794, 0.43422, -2.315564, 0.7647059, 1, 0, 1,
-0.8689356, 0.04240924, -1.095487, 0.7568628, 1, 0, 1,
-0.8595444, -0.1154883, -0.8708601, 0.7529412, 1, 0, 1,
-0.8532999, 0.2262253, -2.154608, 0.7450981, 1, 0, 1,
-0.8532604, 0.5301051, -2.638604, 0.7411765, 1, 0, 1,
-0.8462902, 0.7472657, -0.9041599, 0.7333333, 1, 0, 1,
-0.8439915, -0.4921374, -3.588137, 0.7294118, 1, 0, 1,
-0.8432862, 1.611056, 0.9444256, 0.7215686, 1, 0, 1,
-0.8413129, -0.7799751, -1.846598, 0.7176471, 1, 0, 1,
-0.8382663, -1.408543, -3.191655, 0.7098039, 1, 0, 1,
-0.8326429, 0.1231175, -2.156108, 0.7058824, 1, 0, 1,
-0.8319513, -0.03142413, -2.282628, 0.6980392, 1, 0, 1,
-0.8240047, 0.1059636, -0.2009625, 0.6901961, 1, 0, 1,
-0.8188695, 1.220632, -0.9326978, 0.6862745, 1, 0, 1,
-0.8172462, -0.4727692, -2.228172, 0.6784314, 1, 0, 1,
-0.8172078, -0.03891835, -2.90511, 0.6745098, 1, 0, 1,
-0.8139303, -0.4525308, -1.91498, 0.6666667, 1, 0, 1,
-0.8089742, 1.057131, 0.01950353, 0.6627451, 1, 0, 1,
-0.8026653, -0.4515483, -2.353564, 0.654902, 1, 0, 1,
-0.8004689, 0.8117622, -1.672082, 0.6509804, 1, 0, 1,
-0.7977981, 1.310869, -0.7281842, 0.6431373, 1, 0, 1,
-0.7928925, -0.4959427, -2.025985, 0.6392157, 1, 0, 1,
-0.7924353, 0.8384726, 0.2441711, 0.6313726, 1, 0, 1,
-0.7901353, 1.05848, 0.03238835, 0.627451, 1, 0, 1,
-0.7901041, -0.4939119, -4.035709, 0.6196079, 1, 0, 1,
-0.7869242, 0.03277034, -2.143158, 0.6156863, 1, 0, 1,
-0.7780112, 0.6542333, -0.5354857, 0.6078432, 1, 0, 1,
-0.7729029, -0.9220699, -1.323262, 0.6039216, 1, 0, 1,
-0.7689128, 1.304938, -1.471844, 0.5960785, 1, 0, 1,
-0.764745, 0.4997493, -2.23887, 0.5882353, 1, 0, 1,
-0.7587476, -0.503116, -2.939845, 0.5843138, 1, 0, 1,
-0.752906, -1.768063, -2.959314, 0.5764706, 1, 0, 1,
-0.7513898, 1.151781, -1.43598, 0.572549, 1, 0, 1,
-0.7484638, -1.089856, -0.5245349, 0.5647059, 1, 0, 1,
-0.747914, 0.4849496, -2.493271, 0.5607843, 1, 0, 1,
-0.7404978, 0.03850791, -2.993729, 0.5529412, 1, 0, 1,
-0.7380687, 0.2530867, -0.8879609, 0.5490196, 1, 0, 1,
-0.7212478, -0.2478222, -0.05433369, 0.5411765, 1, 0, 1,
-0.716203, 1.376558, -0.04652134, 0.5372549, 1, 0, 1,
-0.7112648, 0.09378979, -2.450505, 0.5294118, 1, 0, 1,
-0.7079701, -0.8457718, -1.662564, 0.5254902, 1, 0, 1,
-0.70732, 0.4080563, -0.7163951, 0.5176471, 1, 0, 1,
-0.7071779, 0.659986, -1.838496, 0.5137255, 1, 0, 1,
-0.6997061, 0.2248452, -2.584609, 0.5058824, 1, 0, 1,
-0.6927226, -1.408826, -2.891654, 0.5019608, 1, 0, 1,
-0.6897377, -1.157273, -2.805218, 0.4941176, 1, 0, 1,
-0.6845191, 0.915659, -1.770339, 0.4862745, 1, 0, 1,
-0.6775321, -0.2457947, -0.6648759, 0.4823529, 1, 0, 1,
-0.6676177, -0.03343812, -2.58949, 0.4745098, 1, 0, 1,
-0.6675044, -1.652966, -2.337472, 0.4705882, 1, 0, 1,
-0.6657766, 1.614343, 0.5108763, 0.4627451, 1, 0, 1,
-0.6649714, -1.141891, -1.131659, 0.4588235, 1, 0, 1,
-0.6646554, 1.343918, -1.406742, 0.4509804, 1, 0, 1,
-0.6642423, 0.09475483, -1.645218, 0.4470588, 1, 0, 1,
-0.6607798, -0.7459549, -1.38742, 0.4392157, 1, 0, 1,
-0.6605185, 0.1866387, -1.560302, 0.4352941, 1, 0, 1,
-0.653928, -0.4522192, -2.97842, 0.427451, 1, 0, 1,
-0.6504045, 1.770297, -0.6021524, 0.4235294, 1, 0, 1,
-0.649892, 0.4438424, -2.875876, 0.4156863, 1, 0, 1,
-0.648757, -0.03976762, 0.7890347, 0.4117647, 1, 0, 1,
-0.6469252, 0.0664892, -2.929379, 0.4039216, 1, 0, 1,
-0.6373539, 1.600712, -2.181318, 0.3960784, 1, 0, 1,
-0.6362062, -0.3646616, -0.9284309, 0.3921569, 1, 0, 1,
-0.6316221, 1.573531, 1.027934, 0.3843137, 1, 0, 1,
-0.6270016, 0.8405342, -1.091093, 0.3803922, 1, 0, 1,
-0.6254627, 0.7556337, -0.7341866, 0.372549, 1, 0, 1,
-0.6252805, -0.1918153, -3.057477, 0.3686275, 1, 0, 1,
-0.6132122, -0.9749965, -2.204566, 0.3607843, 1, 0, 1,
-0.6126835, -0.3983415, -2.409447, 0.3568628, 1, 0, 1,
-0.6105742, 1.008784, -0.6465758, 0.3490196, 1, 0, 1,
-0.6089461, -0.9189416, -2.704518, 0.345098, 1, 0, 1,
-0.6039131, -0.0456862, -2.537737, 0.3372549, 1, 0, 1,
-0.6033058, 0.1322541, -0.4071332, 0.3333333, 1, 0, 1,
-0.6031972, 0.4609933, -2.175649, 0.3254902, 1, 0, 1,
-0.6013741, 0.05388749, -0.865406, 0.3215686, 1, 0, 1,
-0.6001055, 1.315047, -0.954165, 0.3137255, 1, 0, 1,
-0.5993093, -0.292298, -4.23885, 0.3098039, 1, 0, 1,
-0.5981872, -2.531342, -3.814079, 0.3019608, 1, 0, 1,
-0.597899, 0.2936856, -1.250941, 0.2941177, 1, 0, 1,
-0.5942017, -0.2396425, -2.442278, 0.2901961, 1, 0, 1,
-0.5934018, 0.2238853, -1.809968, 0.282353, 1, 0, 1,
-0.5910403, 1.312875, -0.4735664, 0.2784314, 1, 0, 1,
-0.5876966, 1.16155, -0.900292, 0.2705882, 1, 0, 1,
-0.5816519, 0.2041185, -1.140844, 0.2666667, 1, 0, 1,
-0.5815653, -0.5839304, -1.798167, 0.2588235, 1, 0, 1,
-0.5794873, 0.04282955, -1.52189, 0.254902, 1, 0, 1,
-0.5794035, 0.2111833, -2.781628, 0.2470588, 1, 0, 1,
-0.5750861, 0.2547014, -1.812215, 0.2431373, 1, 0, 1,
-0.5704824, -0.2860309, -1.80856, 0.2352941, 1, 0, 1,
-0.5588446, -0.3937627, -1.690911, 0.2313726, 1, 0, 1,
-0.5588068, -0.2540385, -1.20639, 0.2235294, 1, 0, 1,
-0.5558195, 0.3401378, -1.159704, 0.2196078, 1, 0, 1,
-0.5501939, 0.4232401, -0.9208137, 0.2117647, 1, 0, 1,
-0.5474554, -0.299698, -2.626399, 0.2078431, 1, 0, 1,
-0.5449219, 1.165889, 1.301665, 0.2, 1, 0, 1,
-0.5436229, -0.3685614, -4.240581, 0.1921569, 1, 0, 1,
-0.5392923, -0.4734765, -2.683221, 0.1882353, 1, 0, 1,
-0.536509, -1.256731, -3.167105, 0.1803922, 1, 0, 1,
-0.5296564, -0.2276344, -2.664361, 0.1764706, 1, 0, 1,
-0.5198592, 0.3105729, -0.8951688, 0.1686275, 1, 0, 1,
-0.5180961, -0.8417004, -3.652029, 0.1647059, 1, 0, 1,
-0.5145015, -0.6691265, -4.235415, 0.1568628, 1, 0, 1,
-0.5088858, 0.2601075, -0.9040536, 0.1529412, 1, 0, 1,
-0.5080907, 0.880173, 0.2560405, 0.145098, 1, 0, 1,
-0.5034559, -0.5200668, -1.429338, 0.1411765, 1, 0, 1,
-0.5029789, -0.369842, -2.88458, 0.1333333, 1, 0, 1,
-0.4972314, 1.010592, 0.7305295, 0.1294118, 1, 0, 1,
-0.4929917, 0.4140598, -0.6017631, 0.1215686, 1, 0, 1,
-0.491262, -1.49625, -2.195379, 0.1176471, 1, 0, 1,
-0.4902385, -1.107996, -2.526802, 0.1098039, 1, 0, 1,
-0.488133, -0.642125, -2.617932, 0.1058824, 1, 0, 1,
-0.4867853, -0.7732071, -2.15533, 0.09803922, 1, 0, 1,
-0.4759511, -0.3595885, -3.853845, 0.09019608, 1, 0, 1,
-0.4746854, -0.5825702, -1.903892, 0.08627451, 1, 0, 1,
-0.4724499, 0.169997, -2.256028, 0.07843138, 1, 0, 1,
-0.4716288, -0.2789207, -1.68262, 0.07450981, 1, 0, 1,
-0.4702568, -0.4771238, -1.889507, 0.06666667, 1, 0, 1,
-0.4653299, -0.9200906, -1.552016, 0.0627451, 1, 0, 1,
-0.4602345, -2.265217, -1.704471, 0.05490196, 1, 0, 1,
-0.459639, 1.09963, 0.2973728, 0.05098039, 1, 0, 1,
-0.4593593, 0.6395316, -0.6349291, 0.04313726, 1, 0, 1,
-0.4505696, -0.6726962, -2.827758, 0.03921569, 1, 0, 1,
-0.4485012, -0.9602424, -3.568345, 0.03137255, 1, 0, 1,
-0.4457911, 0.2480585, -1.98286, 0.02745098, 1, 0, 1,
-0.4454103, 0.1264778, -2.045194, 0.01960784, 1, 0, 1,
-0.4392754, 0.6727238, -1.231535, 0.01568628, 1, 0, 1,
-0.4390637, 0.3019608, -1.764186, 0.007843138, 1, 0, 1,
-0.4382856, -1.46824, -3.996896, 0.003921569, 1, 0, 1,
-0.4364261, -0.1236341, -3.377205, 0, 1, 0.003921569, 1,
-0.4355037, -0.7750341, -2.449862, 0, 1, 0.01176471, 1,
-0.4346684, 0.06463929, -1.883866, 0, 1, 0.01568628, 1,
-0.4300961, 1.009441, -0.1611794, 0, 1, 0.02352941, 1,
-0.4296463, 1.483798, 1.470723, 0, 1, 0.02745098, 1,
-0.4244079, 0.09673794, -2.418142, 0, 1, 0.03529412, 1,
-0.4226792, -0.1637575, -1.709788, 0, 1, 0.03921569, 1,
-0.4222301, -0.2514665, -0.8964615, 0, 1, 0.04705882, 1,
-0.419408, 0.544628, 0.4259413, 0, 1, 0.05098039, 1,
-0.4192007, 0.1281528, -0.7102262, 0, 1, 0.05882353, 1,
-0.417624, -0.1153136, -2.48426, 0, 1, 0.0627451, 1,
-0.4115009, -0.5393897, -3.776637, 0, 1, 0.07058824, 1,
-0.4084284, 0.8997121, -0.05718063, 0, 1, 0.07450981, 1,
-0.4070035, 1.29815, -0.3986166, 0, 1, 0.08235294, 1,
-0.3991473, -0.4805571, -2.523468, 0, 1, 0.08627451, 1,
-0.3968644, 0.1075585, -1.806158, 0, 1, 0.09411765, 1,
-0.396291, 2.647109, 0.03484561, 0, 1, 0.1019608, 1,
-0.3958536, 1.489701, 0.3035829, 0, 1, 0.1058824, 1,
-0.3933832, 0.2682321, 0.1268423, 0, 1, 0.1137255, 1,
-0.3929129, 0.7274964, -1.177162, 0, 1, 0.1176471, 1,
-0.3883565, 1.074098, -0.4840565, 0, 1, 0.1254902, 1,
-0.3865251, 0.4133413, -0.8270657, 0, 1, 0.1294118, 1,
-0.3856427, -1.519799, -2.021321, 0, 1, 0.1372549, 1,
-0.3848048, -0.005420714, -0.2241751, 0, 1, 0.1411765, 1,
-0.3795893, 0.221672, -1.616471, 0, 1, 0.1490196, 1,
-0.3792332, 0.4652905, 0.0410873, 0, 1, 0.1529412, 1,
-0.3777515, -0.349796, -0.7902688, 0, 1, 0.1607843, 1,
-0.3758324, 1.72795, -0.1967804, 0, 1, 0.1647059, 1,
-0.3646601, 0.2324053, -1.749048, 0, 1, 0.172549, 1,
-0.3530342, 0.2855455, -0.8265068, 0, 1, 0.1764706, 1,
-0.3488634, 0.4320545, -1.658606, 0, 1, 0.1843137, 1,
-0.3451522, -0.4191257, -3.410466, 0, 1, 0.1882353, 1,
-0.3411111, -0.2603369, -1.724834, 0, 1, 0.1960784, 1,
-0.3337055, 0.3795704, -0.4433598, 0, 1, 0.2039216, 1,
-0.3335658, -0.3350236, -2.622402, 0, 1, 0.2078431, 1,
-0.3328776, -1.832518, -4.545868, 0, 1, 0.2156863, 1,
-0.3308716, 0.8545277, -1.624884, 0, 1, 0.2196078, 1,
-0.3277743, -0.5699339, -3.098388, 0, 1, 0.227451, 1,
-0.3177471, -0.6496523, -2.774549, 0, 1, 0.2313726, 1,
-0.3167131, 0.6597134, -0.1491464, 0, 1, 0.2392157, 1,
-0.3165168, -0.9038686, -1.806849, 0, 1, 0.2431373, 1,
-0.3053816, 0.9820892, -0.07483867, 0, 1, 0.2509804, 1,
-0.3039814, -0.6019077, 0.2634999, 0, 1, 0.254902, 1,
-0.3025677, 1.044771, -0.04120087, 0, 1, 0.2627451, 1,
-0.3024387, 0.6858497, -1.311886, 0, 1, 0.2666667, 1,
-0.3023241, -1.781269, -3.490414, 0, 1, 0.2745098, 1,
-0.3017342, 0.3214117, -1.23533, 0, 1, 0.2784314, 1,
-0.3007596, -0.9347504, -3.586332, 0, 1, 0.2862745, 1,
-0.3003058, 0.6401501, 0.3336262, 0, 1, 0.2901961, 1,
-0.3001702, 0.8077927, 0.3843564, 0, 1, 0.2980392, 1,
-0.2975518, 0.2781859, 0.8904542, 0, 1, 0.3058824, 1,
-0.2944855, -1.422678, -2.13172, 0, 1, 0.3098039, 1,
-0.2927341, -0.6721466, -1.866472, 0, 1, 0.3176471, 1,
-0.2919381, 0.7763562, -1.169623, 0, 1, 0.3215686, 1,
-0.2913745, 0.08158536, -0.5847899, 0, 1, 0.3294118, 1,
-0.2882755, 0.2739508, -0.9418336, 0, 1, 0.3333333, 1,
-0.2849464, 0.1942707, -0.9810335, 0, 1, 0.3411765, 1,
-0.2836368, 0.2750973, -1.64435, 0, 1, 0.345098, 1,
-0.2831089, 0.1377316, -1.514669, 0, 1, 0.3529412, 1,
-0.2812574, 0.5366929, -0.845703, 0, 1, 0.3568628, 1,
-0.278321, 0.06097976, -2.046759, 0, 1, 0.3647059, 1,
-0.2775609, 0.2401609, -2.164976, 0, 1, 0.3686275, 1,
-0.2771724, -0.06016132, -1.492985, 0, 1, 0.3764706, 1,
-0.2745847, -0.7091553, -2.4635, 0, 1, 0.3803922, 1,
-0.2700002, 0.9113181, -1.099478, 0, 1, 0.3882353, 1,
-0.2672468, 0.1906254, -1.164257, 0, 1, 0.3921569, 1,
-0.2662936, 1.026222, 0.4750499, 0, 1, 0.4, 1,
-0.2581193, 1.676895, -0.1365472, 0, 1, 0.4078431, 1,
-0.2517199, -0.1719719, -2.006043, 0, 1, 0.4117647, 1,
-0.2479353, 1.516588, -1.968301, 0, 1, 0.4196078, 1,
-0.2477667, -1.898349, -2.832783, 0, 1, 0.4235294, 1,
-0.2469151, -1.135232, -1.150514, 0, 1, 0.4313726, 1,
-0.2452078, -0.4356104, -0.8892847, 0, 1, 0.4352941, 1,
-0.2409869, -1.414193, -5.15602, 0, 1, 0.4431373, 1,
-0.2390848, 0.2013888, -1.323732, 0, 1, 0.4470588, 1,
-0.2378485, -0.7042567, -2.410094, 0, 1, 0.454902, 1,
-0.2376456, -1.183554, -2.094502, 0, 1, 0.4588235, 1,
-0.236692, -1.00281, -2.839845, 0, 1, 0.4666667, 1,
-0.2357971, 0.5078231, -1.852608, 0, 1, 0.4705882, 1,
-0.2303283, 0.137005, -1.443836, 0, 1, 0.4784314, 1,
-0.2240695, 0.08077721, -1.668231, 0, 1, 0.4823529, 1,
-0.2231063, 0.109875, -2.7306, 0, 1, 0.4901961, 1,
-0.2204836, -1.883979, -3.2044, 0, 1, 0.4941176, 1,
-0.2195117, -0.3992203, -4.488283, 0, 1, 0.5019608, 1,
-0.2189258, 1.100131, 2.483571, 0, 1, 0.509804, 1,
-0.2163393, 0.0275118, -2.745257, 0, 1, 0.5137255, 1,
-0.2158457, 0.08336467, -1.356079, 0, 1, 0.5215687, 1,
-0.2130088, -0.6819661, -0.3684475, 0, 1, 0.5254902, 1,
-0.2102626, 0.2725769, -0.6200078, 0, 1, 0.5333334, 1,
-0.2045946, 0.8442999, -0.5185606, 0, 1, 0.5372549, 1,
-0.1976061, 0.5653346, -0.1964547, 0, 1, 0.5450981, 1,
-0.1938095, 0.1620696, -1.370103, 0, 1, 0.5490196, 1,
-0.1860699, 0.4443448, 0.9598826, 0, 1, 0.5568628, 1,
-0.1860369, -1.546774, -5.310563, 0, 1, 0.5607843, 1,
-0.1845789, -0.3580561, -2.509294, 0, 1, 0.5686275, 1,
-0.1834012, 2.223163, 0.8274255, 0, 1, 0.572549, 1,
-0.1739376, 1.053311, 0.9434173, 0, 1, 0.5803922, 1,
-0.1715118, -1.44177, -3.474281, 0, 1, 0.5843138, 1,
-0.1712641, -0.8940602, -3.173579, 0, 1, 0.5921569, 1,
-0.168127, 0.7514054, -0.7442558, 0, 1, 0.5960785, 1,
-0.1677614, 0.6735813, -0.597337, 0, 1, 0.6039216, 1,
-0.1664234, 0.3927051, 0.07837512, 0, 1, 0.6117647, 1,
-0.1618484, -0.5271662, -2.900412, 0, 1, 0.6156863, 1,
-0.1607112, 0.8688335, -0.5496824, 0, 1, 0.6235294, 1,
-0.1599957, -0.05221321, -1.947963, 0, 1, 0.627451, 1,
-0.1594177, 1.221269, 0.6544613, 0, 1, 0.6352941, 1,
-0.1580542, 0.9017941, -0.06455852, 0, 1, 0.6392157, 1,
-0.150307, 0.3487307, 0.1234501, 0, 1, 0.6470588, 1,
-0.1366643, 0.8844311, -0.3387804, 0, 1, 0.6509804, 1,
-0.128837, 1.025695, 0.7078927, 0, 1, 0.6588235, 1,
-0.1266273, 1.718078, -0.4724325, 0, 1, 0.6627451, 1,
-0.1237857, -1.683893, -3.363781, 0, 1, 0.6705883, 1,
-0.1236019, -0.3339694, -3.066206, 0, 1, 0.6745098, 1,
-0.1226253, 0.6238078, 0.6201696, 0, 1, 0.682353, 1,
-0.12224, -1.573774, -3.24899, 0, 1, 0.6862745, 1,
-0.121641, 1.371369, -1.024994, 0, 1, 0.6941177, 1,
-0.1215218, 0.6597495, -1.076769, 0, 1, 0.7019608, 1,
-0.1073436, -0.8464353, -3.729066, 0, 1, 0.7058824, 1,
-0.1060735, 1.685776, 1.955786, 0, 1, 0.7137255, 1,
-0.1020927, -0.05181301, -2.811915, 0, 1, 0.7176471, 1,
-0.1019732, -1.18331, -0.9229342, 0, 1, 0.7254902, 1,
-0.1017618, 0.547399, -1.276479, 0, 1, 0.7294118, 1,
-0.09772996, -0.7377713, -3.919466, 0, 1, 0.7372549, 1,
-0.0971342, -0.2901419, -2.701423, 0, 1, 0.7411765, 1,
-0.09584214, -0.34275, -3.104688, 0, 1, 0.7490196, 1,
-0.09551353, 2.273819, -0.1856505, 0, 1, 0.7529412, 1,
-0.09411208, -1.473964, -2.325243, 0, 1, 0.7607843, 1,
-0.09250438, 1.129589, -1.733156, 0, 1, 0.7647059, 1,
-0.09028031, 0.6877331, 0.7587203, 0, 1, 0.772549, 1,
-0.08983323, -0.7035038, -4.429753, 0, 1, 0.7764706, 1,
-0.08639751, -2.220483, -1.990795, 0, 1, 0.7843137, 1,
-0.08225203, 0.9553336, 0.6339272, 0, 1, 0.7882353, 1,
-0.07794996, -2.132723, -2.890748, 0, 1, 0.7960784, 1,
-0.0778411, 0.9372635, -0.7952366, 0, 1, 0.8039216, 1,
-0.07653758, -1.080554, -3.380418, 0, 1, 0.8078431, 1,
-0.07423428, 0.3164574, -0.1710515, 0, 1, 0.8156863, 1,
-0.07002311, -1.399105, -3.049681, 0, 1, 0.8196079, 1,
-0.06531949, 0.6098751, 0.04516695, 0, 1, 0.827451, 1,
-0.06521834, -0.1461638, -3.132952, 0, 1, 0.8313726, 1,
-0.05310383, -0.9176568, -2.114815, 0, 1, 0.8392157, 1,
-0.04841686, -0.6031116, -2.442641, 0, 1, 0.8431373, 1,
-0.04812758, -0.4367701, -3.373725, 0, 1, 0.8509804, 1,
-0.04507347, -0.2287331, -1.644511, 0, 1, 0.854902, 1,
-0.04245984, -0.3155252, -0.367409, 0, 1, 0.8627451, 1,
-0.03933639, -1.087754, -5.287442, 0, 1, 0.8666667, 1,
-0.03898517, -1.339394, -3.125993, 0, 1, 0.8745098, 1,
-0.03819662, -0.3371286, -3.209517, 0, 1, 0.8784314, 1,
-0.03696624, -1.610791, -2.843565, 0, 1, 0.8862745, 1,
-0.03485315, -1.897144, -1.45588, 0, 1, 0.8901961, 1,
-0.03001642, 0.9243423, 0.6761608, 0, 1, 0.8980392, 1,
-0.02569857, -2.150246, -3.401322, 0, 1, 0.9058824, 1,
-0.02530506, 0.4746257, -1.132118, 0, 1, 0.9098039, 1,
-0.02512516, -0.668689, -4.059479, 0, 1, 0.9176471, 1,
-0.0221604, 0.5588315, -0.6474723, 0, 1, 0.9215686, 1,
-0.02025058, -0.6174437, -2.120708, 0, 1, 0.9294118, 1,
-0.01480478, 0.116465, -1.771055, 0, 1, 0.9333333, 1,
-0.0139704, 0.3847444, 0.6522259, 0, 1, 0.9411765, 1,
-0.01147899, -0.6739591, -1.298791, 0, 1, 0.945098, 1,
-0.006002319, -0.439227, -2.852381, 0, 1, 0.9529412, 1,
-0.005705649, -0.7989601, -2.956254, 0, 1, 0.9568627, 1,
-0.00503207, -0.9023858, -2.896796, 0, 1, 0.9647059, 1,
0.0002783123, 1.351734, -0.4249222, 0, 1, 0.9686275, 1,
0.002136142, -0.4782167, 2.5762, 0, 1, 0.9764706, 1,
0.003051442, -2.249424, 2.067327, 0, 1, 0.9803922, 1,
0.003789142, -0.2514564, 2.528439, 0, 1, 0.9882353, 1,
0.006529115, 0.539853, 0.5292805, 0, 1, 0.9921569, 1,
0.01066113, 0.664728, 0.2712897, 0, 1, 1, 1,
0.01168614, -0.4675845, 3.349118, 0, 0.9921569, 1, 1,
0.01181109, 1.627434, -0.4034694, 0, 0.9882353, 1, 1,
0.01382331, 1.247466, 1.809338, 0, 0.9803922, 1, 1,
0.03004044, -0.7060724, 2.625769, 0, 0.9764706, 1, 1,
0.03073899, -0.8100165, 1.965381, 0, 0.9686275, 1, 1,
0.04084041, -0.4118443, 4.145534, 0, 0.9647059, 1, 1,
0.04094104, 0.3405949, -0.154344, 0, 0.9568627, 1, 1,
0.04160498, 0.9892384, -0.0206599, 0, 0.9529412, 1, 1,
0.04418999, 1.367987, 0.7776229, 0, 0.945098, 1, 1,
0.04952848, -0.3888132, 2.980558, 0, 0.9411765, 1, 1,
0.05163708, 0.2684193, 2.357996, 0, 0.9333333, 1, 1,
0.05530801, -0.6740347, 4.217518, 0, 0.9294118, 1, 1,
0.05572718, 1.493589, 1.496796, 0, 0.9215686, 1, 1,
0.0585906, 0.5490482, 0.2144765, 0, 0.9176471, 1, 1,
0.06142789, 1.552028, 0.5486121, 0, 0.9098039, 1, 1,
0.06537713, -0.9278709, 2.551648, 0, 0.9058824, 1, 1,
0.06865396, 0.6007428, 0.2776335, 0, 0.8980392, 1, 1,
0.07394887, 0.5847053, -0.2663118, 0, 0.8901961, 1, 1,
0.07516269, -0.1517896, 0.2851108, 0, 0.8862745, 1, 1,
0.0827451, 0.8813109, -1.029728, 0, 0.8784314, 1, 1,
0.08490828, -0.711554, 3.14406, 0, 0.8745098, 1, 1,
0.08554964, -2.39148, 3.177846, 0, 0.8666667, 1, 1,
0.087668, -0.4813962, 4.3512, 0, 0.8627451, 1, 1,
0.08785191, -0.7799288, 0.9390396, 0, 0.854902, 1, 1,
0.08795448, 0.9138637, -0.4289537, 0, 0.8509804, 1, 1,
0.08861386, 0.6064686, -0.01296936, 0, 0.8431373, 1, 1,
0.08872373, 2.210373, -1.149872, 0, 0.8392157, 1, 1,
0.08892185, 0.3051956, 1.622196, 0, 0.8313726, 1, 1,
0.09002874, 0.6730407, -0.8787566, 0, 0.827451, 1, 1,
0.09258927, -0.0753966, 2.391704, 0, 0.8196079, 1, 1,
0.09461556, 0.7295927, 1.264601, 0, 0.8156863, 1, 1,
0.09748008, 2.033064, -1.026405, 0, 0.8078431, 1, 1,
0.09963614, 1.25787, -0.3912363, 0, 0.8039216, 1, 1,
0.1039225, 1.185236, -2.325479, 0, 0.7960784, 1, 1,
0.1055586, 0.01653354, 0.9727874, 0, 0.7882353, 1, 1,
0.1062647, 0.6249482, -0.391279, 0, 0.7843137, 1, 1,
0.1083343, 0.9501081, -0.7365391, 0, 0.7764706, 1, 1,
0.1133344, -0.8333357, 2.078464, 0, 0.772549, 1, 1,
0.1181639, 0.9411723, 0.4140229, 0, 0.7647059, 1, 1,
0.1191305, -1.975537, 3.27039, 0, 0.7607843, 1, 1,
0.1192481, 0.1939037, -0.3698816, 0, 0.7529412, 1, 1,
0.1243595, 1.157296, 0.03347237, 0, 0.7490196, 1, 1,
0.1255156, 1.547155, 0.3036233, 0, 0.7411765, 1, 1,
0.1312792, 0.2465358, 1.436549, 0, 0.7372549, 1, 1,
0.1347166, 1.914983, 0.3824944, 0, 0.7294118, 1, 1,
0.1434366, -0.1012255, 3.636256, 0, 0.7254902, 1, 1,
0.1483128, -0.05349173, 0.2321841, 0, 0.7176471, 1, 1,
0.1521411, -0.8066419, 2.103211, 0, 0.7137255, 1, 1,
0.1541038, -0.3261394, 1.680496, 0, 0.7058824, 1, 1,
0.1554563, -0.03319854, 1.892734, 0, 0.6980392, 1, 1,
0.1623556, -0.539305, 3.647414, 0, 0.6941177, 1, 1,
0.1624232, 0.623575, 2.449788, 0, 0.6862745, 1, 1,
0.1631913, 3.472754, -0.7477849, 0, 0.682353, 1, 1,
0.1650967, -0.4165488, 3.227119, 0, 0.6745098, 1, 1,
0.1664235, 0.08602244, 1.130185, 0, 0.6705883, 1, 1,
0.1684195, 0.07775195, 0.03703922, 0, 0.6627451, 1, 1,
0.1687244, 1.897506, 0.02898061, 0, 0.6588235, 1, 1,
0.1694856, -0.1858658, 1.899534, 0, 0.6509804, 1, 1,
0.1701846, -0.3243824, 3.715629, 0, 0.6470588, 1, 1,
0.172186, 0.004042918, 0.782481, 0, 0.6392157, 1, 1,
0.1768207, 1.06478, -1.363502, 0, 0.6352941, 1, 1,
0.1768879, 1.461024, -1.242213, 0, 0.627451, 1, 1,
0.1782429, 0.4345962, 0.2614207, 0, 0.6235294, 1, 1,
0.1790095, 0.3348169, 1.864761, 0, 0.6156863, 1, 1,
0.182167, -0.5086483, 4.407353, 0, 0.6117647, 1, 1,
0.1856142, -0.8445678, 0.8496608, 0, 0.6039216, 1, 1,
0.1905514, 2.152169, 1.38472, 0, 0.5960785, 1, 1,
0.1940328, 1.421412, 0.01918746, 0, 0.5921569, 1, 1,
0.1954985, 1.047352, 0.8069662, 0, 0.5843138, 1, 1,
0.1994572, -1.177021, 1.004462, 0, 0.5803922, 1, 1,
0.2011358, -0.4037969, 2.892085, 0, 0.572549, 1, 1,
0.2023585, -0.5557759, 4.44249, 0, 0.5686275, 1, 1,
0.202369, -0.8029249, 3.635431, 0, 0.5607843, 1, 1,
0.2030141, 0.09973852, 3.067029, 0, 0.5568628, 1, 1,
0.2046755, -0.7879886, 1.308281, 0, 0.5490196, 1, 1,
0.2071175, 0.5354939, 0.2790372, 0, 0.5450981, 1, 1,
0.208691, -0.9078025, 3.273252, 0, 0.5372549, 1, 1,
0.2112934, -1.161496, 2.506823, 0, 0.5333334, 1, 1,
0.2140673, -0.2768636, 1.74771, 0, 0.5254902, 1, 1,
0.215623, -0.3091879, 2.840345, 0, 0.5215687, 1, 1,
0.2198128, -0.864013, 2.857262, 0, 0.5137255, 1, 1,
0.2207449, 0.8832992, 1.30281, 0, 0.509804, 1, 1,
0.2216949, -0.22808, 0.4182056, 0, 0.5019608, 1, 1,
0.2223016, 0.7564831, -0.1425749, 0, 0.4941176, 1, 1,
0.2247897, -0.8855276, 1.681832, 0, 0.4901961, 1, 1,
0.2279196, -0.2046299, 2.918354, 0, 0.4823529, 1, 1,
0.2328597, 0.0104551, 2.16782, 0, 0.4784314, 1, 1,
0.2328782, 0.4054665, 0.9173169, 0, 0.4705882, 1, 1,
0.2355016, 0.4581543, -0.2208656, 0, 0.4666667, 1, 1,
0.2416404, -0.2772786, 2.751028, 0, 0.4588235, 1, 1,
0.2457225, -0.1991582, 2.847968, 0, 0.454902, 1, 1,
0.2496835, -0.338007, 2.381203, 0, 0.4470588, 1, 1,
0.2514975, -0.5572658, 4.131672, 0, 0.4431373, 1, 1,
0.2541245, 0.08545501, 2.585808, 0, 0.4352941, 1, 1,
0.2573743, -0.3898185, 1.017201, 0, 0.4313726, 1, 1,
0.2628905, -0.4013306, 2.364089, 0, 0.4235294, 1, 1,
0.2660895, -0.3920229, 2.184038, 0, 0.4196078, 1, 1,
0.2670241, 0.04006718, 1.200158, 0, 0.4117647, 1, 1,
0.2683513, -1.268818, 2.944727, 0, 0.4078431, 1, 1,
0.2690507, -1.099001, 1.884331, 0, 0.4, 1, 1,
0.2722758, -0.3983972, 2.77848, 0, 0.3921569, 1, 1,
0.2730281, 0.3084954, 0.4169341, 0, 0.3882353, 1, 1,
0.2775652, -1.473585, 2.801791, 0, 0.3803922, 1, 1,
0.2777893, 0.05576059, -1.186212, 0, 0.3764706, 1, 1,
0.282127, -1.618374, 3.185126, 0, 0.3686275, 1, 1,
0.2873238, 1.550764, 0.1929967, 0, 0.3647059, 1, 1,
0.2873406, 0.03330711, 0.2594463, 0, 0.3568628, 1, 1,
0.2883088, -1.897632, 3.468282, 0, 0.3529412, 1, 1,
0.2898189, -1.176339, 3.224854, 0, 0.345098, 1, 1,
0.2900847, 0.8252167, 1.113679, 0, 0.3411765, 1, 1,
0.2904043, -0.3868319, 1.074959, 0, 0.3333333, 1, 1,
0.2910561, 0.1693758, 2.489159, 0, 0.3294118, 1, 1,
0.2944762, 0.4589348, 1.053312, 0, 0.3215686, 1, 1,
0.2963917, 0.3203921, 0.1338042, 0, 0.3176471, 1, 1,
0.2970223, 0.9973962, -0.3615671, 0, 0.3098039, 1, 1,
0.2991858, 0.5022027, -0.6754955, 0, 0.3058824, 1, 1,
0.3075107, -1.182609, 4.362618, 0, 0.2980392, 1, 1,
0.3082218, 1.854201, 1.941494, 0, 0.2901961, 1, 1,
0.3114694, 1.03549, 1.715296, 0, 0.2862745, 1, 1,
0.3159814, 0.5139066, 1.885232, 0, 0.2784314, 1, 1,
0.3168691, 0.2380894, 1.761866, 0, 0.2745098, 1, 1,
0.3221472, -0.7377958, 3.895305, 0, 0.2666667, 1, 1,
0.3265589, 1.268237, 0.8631399, 0, 0.2627451, 1, 1,
0.328301, 1.465587, -1.333566, 0, 0.254902, 1, 1,
0.3302216, -1.337122, 2.189412, 0, 0.2509804, 1, 1,
0.3310362, 2.333678, 0.9729375, 0, 0.2431373, 1, 1,
0.3343947, 0.02218942, 1.150365, 0, 0.2392157, 1, 1,
0.3366534, 1.499484, 0.6531107, 0, 0.2313726, 1, 1,
0.3375483, 0.2549764, -0.262796, 0, 0.227451, 1, 1,
0.3388814, -0.4588065, 2.164929, 0, 0.2196078, 1, 1,
0.3405173, -0.1453623, 3.027833, 0, 0.2156863, 1, 1,
0.3405955, 1.190775, -0.2779958, 0, 0.2078431, 1, 1,
0.3421474, 0.6709685, 0.470328, 0, 0.2039216, 1, 1,
0.3442223, -0.7667369, 2.59558, 0, 0.1960784, 1, 1,
0.3445214, 1.164732, 2.58018, 0, 0.1882353, 1, 1,
0.3461599, -2.205387, 1.006689, 0, 0.1843137, 1, 1,
0.3489532, -0.1768686, 1.875285, 0, 0.1764706, 1, 1,
0.3517919, 0.1632651, 0.1076484, 0, 0.172549, 1, 1,
0.3539758, 1.451624, 1.136551, 0, 0.1647059, 1, 1,
0.3552938, 0.2975639, -0.5274599, 0, 0.1607843, 1, 1,
0.357005, -0.9130942, 3.751668, 0, 0.1529412, 1, 1,
0.3582505, 1.358059, 0.2010315, 0, 0.1490196, 1, 1,
0.3617195, 0.05738033, 1.857045, 0, 0.1411765, 1, 1,
0.3623251, 0.593918, -0.4010786, 0, 0.1372549, 1, 1,
0.3628644, 0.3737921, 0.3843205, 0, 0.1294118, 1, 1,
0.3629519, -0.5911132, 2.540772, 0, 0.1254902, 1, 1,
0.3633773, -1.627663, 3.749332, 0, 0.1176471, 1, 1,
0.3639403, 0.01595861, 1.107961, 0, 0.1137255, 1, 1,
0.3650447, -0.1469178, 1.096906, 0, 0.1058824, 1, 1,
0.3676704, -0.9390859, 2.970397, 0, 0.09803922, 1, 1,
0.3694792, -0.6486817, 4.31199, 0, 0.09411765, 1, 1,
0.3722741, 0.1967294, 2.742418, 0, 0.08627451, 1, 1,
0.3732175, -0.3925989, 2.888422, 0, 0.08235294, 1, 1,
0.3777984, -0.805903, 2.2715, 0, 0.07450981, 1, 1,
0.3819585, -1.932284, 1.304055, 0, 0.07058824, 1, 1,
0.3825792, -0.1574773, 1.640789, 0, 0.0627451, 1, 1,
0.3844659, 0.4337333, 1.460877, 0, 0.05882353, 1, 1,
0.3846327, 0.7922551, 0.8327077, 0, 0.05098039, 1, 1,
0.3856283, -0.7710456, 3.419103, 0, 0.04705882, 1, 1,
0.3871354, 0.5143824, -0.495176, 0, 0.03921569, 1, 1,
0.39161, -0.7055299, 2.255182, 0, 0.03529412, 1, 1,
0.3957601, 1.62035, -0.2362122, 0, 0.02745098, 1, 1,
0.3965567, -1.421897, 4.734162, 0, 0.02352941, 1, 1,
0.3987229, -0.6781635, 2.867542, 0, 0.01568628, 1, 1,
0.4011413, 0.02841639, 0.6143469, 0, 0.01176471, 1, 1,
0.4066018, 0.01880396, 1.712647, 0, 0.003921569, 1, 1,
0.4107317, 0.3795393, 2.540829, 0.003921569, 0, 1, 1,
0.4131098, -1.473765, 2.107974, 0.007843138, 0, 1, 1,
0.4133484, -0.3848965, 2.282596, 0.01568628, 0, 1, 1,
0.4197952, -0.5240119, 2.627365, 0.01960784, 0, 1, 1,
0.4225976, 0.1080027, 2.822075, 0.02745098, 0, 1, 1,
0.4250386, -0.005856375, 1.37072, 0.03137255, 0, 1, 1,
0.4267378, 0.09668622, 3.908131, 0.03921569, 0, 1, 1,
0.4267724, -0.2760601, 2.378, 0.04313726, 0, 1, 1,
0.4270559, 0.8270129, -0.02592401, 0.05098039, 0, 1, 1,
0.427842, 0.234023, 1.170016, 0.05490196, 0, 1, 1,
0.4426282, 0.4616669, 0.04814954, 0.0627451, 0, 1, 1,
0.4444518, -2.935396, 3.228972, 0.06666667, 0, 1, 1,
0.4453782, 1.689047, -0.182777, 0.07450981, 0, 1, 1,
0.4470597, -0.0472437, 2.702042, 0.07843138, 0, 1, 1,
0.4485164, 1.263776, 0.2718638, 0.08627451, 0, 1, 1,
0.4545539, 0.3560924, 2.129319, 0.09019608, 0, 1, 1,
0.4571757, 0.01725452, 0.5542317, 0.09803922, 0, 1, 1,
0.466632, -0.5844456, 2.254104, 0.1058824, 0, 1, 1,
0.4681267, 1.517267, 0.2055134, 0.1098039, 0, 1, 1,
0.4766952, 1.419138, 1.062978, 0.1176471, 0, 1, 1,
0.4768538, 0.9139941, 0.5987002, 0.1215686, 0, 1, 1,
0.4771198, 1.140467, -0.7647887, 0.1294118, 0, 1, 1,
0.4904025, 0.8122302, -1.758808, 0.1333333, 0, 1, 1,
0.4941004, 0.4442229, 2.722461, 0.1411765, 0, 1, 1,
0.494447, -1.606176, 3.221879, 0.145098, 0, 1, 1,
0.494672, -0.4355601, 1.716785, 0.1529412, 0, 1, 1,
0.500414, 0.5121744, 1.191025, 0.1568628, 0, 1, 1,
0.5022805, -0.9877397, 1.505565, 0.1647059, 0, 1, 1,
0.5045295, -0.856073, 1.190336, 0.1686275, 0, 1, 1,
0.5135854, -0.3964553, 0.7080858, 0.1764706, 0, 1, 1,
0.5155828, -0.3812616, 3.113353, 0.1803922, 0, 1, 1,
0.5158906, 0.4581702, -0.473801, 0.1882353, 0, 1, 1,
0.5166329, 0.04892474, 0.06517694, 0.1921569, 0, 1, 1,
0.5167655, -1.148372, 2.074345, 0.2, 0, 1, 1,
0.5207747, 0.4012518, 0.8471038, 0.2078431, 0, 1, 1,
0.5247176, 0.7886648, 1.163696, 0.2117647, 0, 1, 1,
0.5252994, -0.5225951, 0.2032286, 0.2196078, 0, 1, 1,
0.5320424, 1.120887, -1.055876, 0.2235294, 0, 1, 1,
0.5334523, 0.1501039, 0.5228748, 0.2313726, 0, 1, 1,
0.5354127, 0.4372497, 0.6970397, 0.2352941, 0, 1, 1,
0.5354699, -1.555563, 2.505772, 0.2431373, 0, 1, 1,
0.5384299, 0.02419977, 3.192754, 0.2470588, 0, 1, 1,
0.5467227, -0.1696589, 4.947151, 0.254902, 0, 1, 1,
0.547174, -1.602382, 4.560519, 0.2588235, 0, 1, 1,
0.5531838, -0.8030903, 4.88193, 0.2666667, 0, 1, 1,
0.5561308, -1.227709, 2.603222, 0.2705882, 0, 1, 1,
0.5573248, -0.03953517, 2.334217, 0.2784314, 0, 1, 1,
0.558218, 1.511352, -0.8510699, 0.282353, 0, 1, 1,
0.5616876, -0.5049669, 1.739122, 0.2901961, 0, 1, 1,
0.5636264, -0.1625203, 1.242602, 0.2941177, 0, 1, 1,
0.5670511, -0.5703325, 2.49362, 0.3019608, 0, 1, 1,
0.5679669, 0.006421594, 2.78206, 0.3098039, 0, 1, 1,
0.5707409, -0.2250855, 2.825354, 0.3137255, 0, 1, 1,
0.5727772, 0.3518131, 1.709267, 0.3215686, 0, 1, 1,
0.5755742, -0.8494788, 1.004848, 0.3254902, 0, 1, 1,
0.5778177, 0.472805, 2.044718, 0.3333333, 0, 1, 1,
0.5835935, -0.598994, 0.3672498, 0.3372549, 0, 1, 1,
0.5869586, -0.9369716, 1.82036, 0.345098, 0, 1, 1,
0.5897895, -0.4654213, 2.367108, 0.3490196, 0, 1, 1,
0.5933047, -0.03841286, 1.582292, 0.3568628, 0, 1, 1,
0.5938236, 0.3777085, 2.199682, 0.3607843, 0, 1, 1,
0.6020721, -2.46399, 3.342737, 0.3686275, 0, 1, 1,
0.6052213, 0.9830456, -0.8318557, 0.372549, 0, 1, 1,
0.6109125, 1.102411, -0.5494255, 0.3803922, 0, 1, 1,
0.6115971, -2.679339, 4.450648, 0.3843137, 0, 1, 1,
0.61311, 1.487518, -1.449935, 0.3921569, 0, 1, 1,
0.6131397, 0.7576448, 0.07565448, 0.3960784, 0, 1, 1,
0.6193894, 1.011521, 0.9952865, 0.4039216, 0, 1, 1,
0.6276588, 1.346113, 0.542563, 0.4117647, 0, 1, 1,
0.6321616, -2.182054, 1.465896, 0.4156863, 0, 1, 1,
0.6331793, 0.1640293, 1.587445, 0.4235294, 0, 1, 1,
0.6334645, 1.782373, -1.121623, 0.427451, 0, 1, 1,
0.6354307, -0.3245875, 0.6021382, 0.4352941, 0, 1, 1,
0.6373133, -1.859777, 1.887018, 0.4392157, 0, 1, 1,
0.6387473, 0.4583712, 1.651119, 0.4470588, 0, 1, 1,
0.639827, -1.130697, 0.8385066, 0.4509804, 0, 1, 1,
0.6405851, 0.9580702, -1.057359, 0.4588235, 0, 1, 1,
0.6408763, 1.890142, 0.1238639, 0.4627451, 0, 1, 1,
0.6461421, 0.6192439, 0.7056977, 0.4705882, 0, 1, 1,
0.6470319, 1.219309, 0.5114304, 0.4745098, 0, 1, 1,
0.6476882, -0.3488952, 3.449673, 0.4823529, 0, 1, 1,
0.6526132, -0.1418208, 3.022374, 0.4862745, 0, 1, 1,
0.6649738, -1.256376, 2.774667, 0.4941176, 0, 1, 1,
0.6649939, -1.649945, 3.924156, 0.5019608, 0, 1, 1,
0.6670388, -0.904891, 3.391309, 0.5058824, 0, 1, 1,
0.6673222, -0.8103706, 3.675404, 0.5137255, 0, 1, 1,
0.6763141, -0.5779691, 0.5543051, 0.5176471, 0, 1, 1,
0.677956, 0.5470186, 1.622269, 0.5254902, 0, 1, 1,
0.6856525, 0.8695487, 2.263597, 0.5294118, 0, 1, 1,
0.6881499, -0.9918384, 2.933829, 0.5372549, 0, 1, 1,
0.6973038, -1.165239, 1.119279, 0.5411765, 0, 1, 1,
0.7000713, 1.397065, 2.413488, 0.5490196, 0, 1, 1,
0.7069067, 1.231605, 0.7776688, 0.5529412, 0, 1, 1,
0.7097331, 0.9512872, 0.4503734, 0.5607843, 0, 1, 1,
0.7215045, 0.9673176, 0.4094666, 0.5647059, 0, 1, 1,
0.7223641, -1.072109, 1.262045, 0.572549, 0, 1, 1,
0.7234402, -1.041901, 3.673456, 0.5764706, 0, 1, 1,
0.7277341, -0.2986595, 3.039986, 0.5843138, 0, 1, 1,
0.7283238, 0.2616925, 1.342139, 0.5882353, 0, 1, 1,
0.7287915, -0.1368599, 1.460448, 0.5960785, 0, 1, 1,
0.7305919, -0.3304646, 2.074838, 0.6039216, 0, 1, 1,
0.7343197, 0.1734294, 1.494559, 0.6078432, 0, 1, 1,
0.7418267, 1.712051, 1.459409, 0.6156863, 0, 1, 1,
0.7449929, -0.7650478, 3.229534, 0.6196079, 0, 1, 1,
0.7454466, -0.7631386, 0.963912, 0.627451, 0, 1, 1,
0.7486472, 0.7980023, -0.6686174, 0.6313726, 0, 1, 1,
0.749678, 1.07218, 0.8435102, 0.6392157, 0, 1, 1,
0.7511556, 0.7614958, 1.489128, 0.6431373, 0, 1, 1,
0.7526484, -0.2771104, 1.233502, 0.6509804, 0, 1, 1,
0.7548247, -0.1039712, 2.899173, 0.654902, 0, 1, 1,
0.7593274, 1.399131, -1.264957, 0.6627451, 0, 1, 1,
0.7655061, -0.9079745, 2.359231, 0.6666667, 0, 1, 1,
0.7722934, 1.370509, 0.172951, 0.6745098, 0, 1, 1,
0.7812425, 1.264895, 0.0190244, 0.6784314, 0, 1, 1,
0.7845441, 0.09904191, 1.275373, 0.6862745, 0, 1, 1,
0.7850621, -0.9705527, 1.691445, 0.6901961, 0, 1, 1,
0.7889823, -1.177309, 2.568817, 0.6980392, 0, 1, 1,
0.7929428, -1.299135, 3.783867, 0.7058824, 0, 1, 1,
0.7969928, -0.4109529, 1.648251, 0.7098039, 0, 1, 1,
0.8027179, 0.2605878, 1.689759, 0.7176471, 0, 1, 1,
0.804368, -0.1336119, 1.702682, 0.7215686, 0, 1, 1,
0.8050277, -1.413296, 2.419113, 0.7294118, 0, 1, 1,
0.8053236, 0.7176533, 2.206537, 0.7333333, 0, 1, 1,
0.8069292, -0.8499439, 2.500606, 0.7411765, 0, 1, 1,
0.8104331, -1.155609, 4.147827, 0.7450981, 0, 1, 1,
0.8105889, 0.1330306, 2.30597, 0.7529412, 0, 1, 1,
0.8163317, 1.771568, -1.087133, 0.7568628, 0, 1, 1,
0.8195074, -0.762996, 3.799893, 0.7647059, 0, 1, 1,
0.8218645, -0.227399, 2.650511, 0.7686275, 0, 1, 1,
0.8301228, -2.15483, 2.852553, 0.7764706, 0, 1, 1,
0.8332055, 0.7905633, 2.403807, 0.7803922, 0, 1, 1,
0.8337406, 0.4467024, 1.493779, 0.7882353, 0, 1, 1,
0.8339272, -0.5659611, 2.315316, 0.7921569, 0, 1, 1,
0.8342345, -0.6547583, 3.362546, 0.8, 0, 1, 1,
0.8354352, -2.294251, 3.372843, 0.8078431, 0, 1, 1,
0.8367416, 0.4983617, -0.6049928, 0.8117647, 0, 1, 1,
0.8416482, -0.6024567, 2.967533, 0.8196079, 0, 1, 1,
0.8446416, 0.005874338, 2.978831, 0.8235294, 0, 1, 1,
0.8511231, -0.4200757, 2.845283, 0.8313726, 0, 1, 1,
0.8572628, 0.2014558, 1.297902, 0.8352941, 0, 1, 1,
0.8591344, -0.3689815, 1.264591, 0.8431373, 0, 1, 1,
0.8652503, 3.09447, -0.3604954, 0.8470588, 0, 1, 1,
0.86735, 0.9198635, 2.674284, 0.854902, 0, 1, 1,
0.8718597, 0.9012409, 1.274443, 0.8588235, 0, 1, 1,
0.8797757, -0.4608176, 2.851457, 0.8666667, 0, 1, 1,
0.8843533, -0.9113072, 2.187438, 0.8705882, 0, 1, 1,
0.8853282, -0.7813318, 3.864634, 0.8784314, 0, 1, 1,
0.8930849, -1.744157, 3.574975, 0.8823529, 0, 1, 1,
0.8947444, -0.6380482, 2.392543, 0.8901961, 0, 1, 1,
0.9003724, 0.4034083, 1.343626, 0.8941177, 0, 1, 1,
0.9017299, -0.4297057, 3.37745, 0.9019608, 0, 1, 1,
0.9065323, -0.07013986, 0.6052259, 0.9098039, 0, 1, 1,
0.9092138, 0.7622331, 1.065324, 0.9137255, 0, 1, 1,
0.9100916, -0.4005258, 2.110461, 0.9215686, 0, 1, 1,
0.9123128, 0.8980635, -0.886865, 0.9254902, 0, 1, 1,
0.9128576, 0.1068621, -0.2962612, 0.9333333, 0, 1, 1,
0.919558, 0.08883169, 1.778246, 0.9372549, 0, 1, 1,
0.9217902, 1.163551, -1.406623, 0.945098, 0, 1, 1,
0.9281003, -1.588671, 2.89678, 0.9490196, 0, 1, 1,
0.9350355, 0.2247582, 1.317854, 0.9568627, 0, 1, 1,
0.9360817, -1.886563, 3.451313, 0.9607843, 0, 1, 1,
0.9364265, -0.2110571, 2.739501, 0.9686275, 0, 1, 1,
0.9375357, -0.5892693, 2.015084, 0.972549, 0, 1, 1,
0.9412788, 0.1180986, 2.515912, 0.9803922, 0, 1, 1,
0.9429557, 2.517601, 0.9579988, 0.9843137, 0, 1, 1,
0.9478634, -0.8274478, 1.236303, 0.9921569, 0, 1, 1,
0.9526609, -0.1594604, 1.692258, 0.9960784, 0, 1, 1,
0.9538062, -0.5635982, 2.256342, 1, 0, 0.9960784, 1,
0.9560181, -0.7568493, 2.703876, 1, 0, 0.9882353, 1,
0.9563742, 1.427441, 0.2078585, 1, 0, 0.9843137, 1,
0.9632861, 1.173878, -0.4160451, 1, 0, 0.9764706, 1,
0.9661112, 0.5017823, 0.4654144, 1, 0, 0.972549, 1,
0.9706181, -1.263234, 1.826465, 1, 0, 0.9647059, 1,
0.9710543, -0.4313543, 2.632682, 1, 0, 0.9607843, 1,
0.97651, -1.361768, 3.378035, 1, 0, 0.9529412, 1,
0.978965, -1.440346, 3.360831, 1, 0, 0.9490196, 1,
0.9848367, 0.002345216, 2.71242, 1, 0, 0.9411765, 1,
0.9865459, -2.199371, 2.188957, 1, 0, 0.9372549, 1,
0.9871204, 0.5527055, 2.44266, 1, 0, 0.9294118, 1,
0.9900098, 0.2910309, -0.06640599, 1, 0, 0.9254902, 1,
0.9907521, 1.195371, 1.496423, 1, 0, 0.9176471, 1,
0.9954172, -0.9725797, -0.01111998, 1, 0, 0.9137255, 1,
0.9980321, -0.8822425, 1.305545, 1, 0, 0.9058824, 1,
1.001509, -0.2992891, 1.202313, 1, 0, 0.9019608, 1,
1.005688, 0.986243, 0.02774667, 1, 0, 0.8941177, 1,
1.008273, 0.2206593, -0.8065857, 1, 0, 0.8862745, 1,
1.011462, -1.745376, 1.906069, 1, 0, 0.8823529, 1,
1.014391, 1.158084, -0.335714, 1, 0, 0.8745098, 1,
1.015099, 2.314476, -0.5277375, 1, 0, 0.8705882, 1,
1.019584, 0.8665129, -1.187827, 1, 0, 0.8627451, 1,
1.021047, -0.1934437, -0.02954477, 1, 0, 0.8588235, 1,
1.026575, 0.852378, 0.6782357, 1, 0, 0.8509804, 1,
1.028347, 1.07318, 1.884284, 1, 0, 0.8470588, 1,
1.030448, 1.724268, 0.4901863, 1, 0, 0.8392157, 1,
1.04373, 1.181645, 0.5665872, 1, 0, 0.8352941, 1,
1.058989, 1.015005, 2.686097, 1, 0, 0.827451, 1,
1.065394, 0.4837728, 0.3866491, 1, 0, 0.8235294, 1,
1.069823, 1.234969, 1.399956, 1, 0, 0.8156863, 1,
1.075899, -2.445781, 2.149254, 1, 0, 0.8117647, 1,
1.075948, -0.994868, 3.576657, 1, 0, 0.8039216, 1,
1.082261, 0.5867923, 0.5035457, 1, 0, 0.7960784, 1,
1.086342, 0.007549076, 0.6611271, 1, 0, 0.7921569, 1,
1.088053, -1.666569, 1.959466, 1, 0, 0.7843137, 1,
1.088555, 1.849477, 0.4445943, 1, 0, 0.7803922, 1,
1.097786, 0.4484967, 1.540447, 1, 0, 0.772549, 1,
1.103704, -1.033856, 2.140405, 1, 0, 0.7686275, 1,
1.103966, -1.982468, 0.5621284, 1, 0, 0.7607843, 1,
1.104609, -1.544268, 3.394424, 1, 0, 0.7568628, 1,
1.111969, 0.8793651, 1.855263, 1, 0, 0.7490196, 1,
1.114222, -0.8103222, 2.496489, 1, 0, 0.7450981, 1,
1.120667, 0.07523403, 2.015358, 1, 0, 0.7372549, 1,
1.140417, 0.6954296, -0.1578634, 1, 0, 0.7333333, 1,
1.152617, 0.782846, 0.5644292, 1, 0, 0.7254902, 1,
1.159714, -1.177622, 3.758688, 1, 0, 0.7215686, 1,
1.16375, 1.089027, 0.7826964, 1, 0, 0.7137255, 1,
1.167252, 1.892218, 1.011796, 1, 0, 0.7098039, 1,
1.174168, -0.6799543, 1.514274, 1, 0, 0.7019608, 1,
1.174765, 0.2175836, 1.807902, 1, 0, 0.6941177, 1,
1.175892, 1.343554, -0.4306492, 1, 0, 0.6901961, 1,
1.17954, 1.811864, -0.1158128, 1, 0, 0.682353, 1,
1.187034, -0.9640248, 2.062893, 1, 0, 0.6784314, 1,
1.188359, -0.3501483, 4.558857, 1, 0, 0.6705883, 1,
1.188456, -0.4801193, 0.1748281, 1, 0, 0.6666667, 1,
1.198344, 0.7822362, 1.5683, 1, 0, 0.6588235, 1,
1.20157, 0.3269894, 2.008246, 1, 0, 0.654902, 1,
1.20519, 0.9698644, -0.5617324, 1, 0, 0.6470588, 1,
1.211421, -0.792433, 1.838715, 1, 0, 0.6431373, 1,
1.213555, -0.2031405, 0.3837399, 1, 0, 0.6352941, 1,
1.213914, 0.1801775, 1.381415, 1, 0, 0.6313726, 1,
1.218673, -0.006534184, 2.315919, 1, 0, 0.6235294, 1,
1.223961, 0.06266378, 0.9409261, 1, 0, 0.6196079, 1,
1.232247, 1.261559, -0.5632985, 1, 0, 0.6117647, 1,
1.240279, -0.5044529, 0.3538267, 1, 0, 0.6078432, 1,
1.243182, 0.6660545, 0.204464, 1, 0, 0.6, 1,
1.245442, 0.5031081, -0.1404126, 1, 0, 0.5921569, 1,
1.247137, 0.08722712, 0.5238997, 1, 0, 0.5882353, 1,
1.248136, -0.9321774, 2.284987, 1, 0, 0.5803922, 1,
1.24826, 1.881597, 0.9894015, 1, 0, 0.5764706, 1,
1.249649, -0.3012559, 0.34777, 1, 0, 0.5686275, 1,
1.251306, -1.590824, 3.975786, 1, 0, 0.5647059, 1,
1.256982, 0.359483, 2.27332, 1, 0, 0.5568628, 1,
1.269912, -0.9664335, 1.804656, 1, 0, 0.5529412, 1,
1.277259, -1.649401, 1.65292, 1, 0, 0.5450981, 1,
1.280913, 0.2922215, 1.235777, 1, 0, 0.5411765, 1,
1.280945, 0.5922806, 1.930756, 1, 0, 0.5333334, 1,
1.29397, 0.04943097, 1.929081, 1, 0, 0.5294118, 1,
1.300251, -1.050189, 2.633747, 1, 0, 0.5215687, 1,
1.305127, 2.356037, 0.4348108, 1, 0, 0.5176471, 1,
1.305988, 0.2992063, 0.4226663, 1, 0, 0.509804, 1,
1.326228, -0.5969574, 1.497231, 1, 0, 0.5058824, 1,
1.338225, -1.951465, 1.92796, 1, 0, 0.4980392, 1,
1.34657, 0.5620772, 0.2951736, 1, 0, 0.4901961, 1,
1.351049, 0.6203323, 1.962493, 1, 0, 0.4862745, 1,
1.355945, 0.1886125, 2.077809, 1, 0, 0.4784314, 1,
1.367586, -1.662866, 4.424309, 1, 0, 0.4745098, 1,
1.368409, 0.7612074, 0.6447285, 1, 0, 0.4666667, 1,
1.369153, 1.580167, -0.9641628, 1, 0, 0.4627451, 1,
1.37987, -1.987262, 2.948835, 1, 0, 0.454902, 1,
1.383874, -0.4098057, 1.827154, 1, 0, 0.4509804, 1,
1.410023, 2.085264, 0.9872776, 1, 0, 0.4431373, 1,
1.416857, -1.217729, 2.976086, 1, 0, 0.4392157, 1,
1.416956, 0.9986653, 0.625548, 1, 0, 0.4313726, 1,
1.427891, 0.4790488, 1.026724, 1, 0, 0.427451, 1,
1.430514, 0.5072304, 1.800726, 1, 0, 0.4196078, 1,
1.433615, -0.2427016, 1.976822, 1, 0, 0.4156863, 1,
1.434376, -1.027349, 2.612987, 1, 0, 0.4078431, 1,
1.437458, -0.2691099, -0.6089156, 1, 0, 0.4039216, 1,
1.446299, 0.6947312, -0.5726219, 1, 0, 0.3960784, 1,
1.446462, 0.08360962, 3.643713, 1, 0, 0.3882353, 1,
1.455041, -2.280423, 2.012651, 1, 0, 0.3843137, 1,
1.459157, -0.9147342, 1.790898, 1, 0, 0.3764706, 1,
1.461571, 0.9776462, 1.330948, 1, 0, 0.372549, 1,
1.472459, -0.4902324, 3.782071, 1, 0, 0.3647059, 1,
1.486847, 2.593806, 2.32696, 1, 0, 0.3607843, 1,
1.495414, -0.3237369, 1.885267, 1, 0, 0.3529412, 1,
1.497353, -0.7116436, 1.374624, 1, 0, 0.3490196, 1,
1.506982, 0.08436672, 3.168222, 1, 0, 0.3411765, 1,
1.512177, 0.5694681, 0.902131, 1, 0, 0.3372549, 1,
1.530759, 0.6358847, 1.772847, 1, 0, 0.3294118, 1,
1.535315, 0.3818395, 0.8421695, 1, 0, 0.3254902, 1,
1.538105, 1.054123, 2.276545, 1, 0, 0.3176471, 1,
1.549218, -0.3318607, 1.126754, 1, 0, 0.3137255, 1,
1.55132, -0.2351507, 1.274068, 1, 0, 0.3058824, 1,
1.560702, 0.5279316, 1.723904, 1, 0, 0.2980392, 1,
1.571233, -0.1258175, 2.149639, 1, 0, 0.2941177, 1,
1.572161, -0.1348277, 0.8532327, 1, 0, 0.2862745, 1,
1.597348, 0.3854048, 0.7680701, 1, 0, 0.282353, 1,
1.601504, -0.3844954, 1.89394, 1, 0, 0.2745098, 1,
1.615296, -0.9902843, 2.105264, 1, 0, 0.2705882, 1,
1.622149, 0.2523441, 1.203697, 1, 0, 0.2627451, 1,
1.630902, 0.6406557, 1.788051, 1, 0, 0.2588235, 1,
1.642542, 1.944803, -0.1671851, 1, 0, 0.2509804, 1,
1.643743, 0.2924955, 2.461413, 1, 0, 0.2470588, 1,
1.644518, -0.06719423, 2.677328, 1, 0, 0.2392157, 1,
1.645735, 1.327449, 0.9298528, 1, 0, 0.2352941, 1,
1.647636, 0.8881736, -0.7065458, 1, 0, 0.227451, 1,
1.670364, 0.5026647, 1.896586, 1, 0, 0.2235294, 1,
1.677542, -0.7918943, 1.421381, 1, 0, 0.2156863, 1,
1.713864, 0.1772072, 1.167789, 1, 0, 0.2117647, 1,
1.735248, -1.129962, 2.775625, 1, 0, 0.2039216, 1,
1.741753, 0.6140076, 1.479005, 1, 0, 0.1960784, 1,
1.757318, -0.8962571, 4.369245, 1, 0, 0.1921569, 1,
1.760291, -1.413777, 1.333457, 1, 0, 0.1843137, 1,
1.782941, 0.3852762, 1.343971, 1, 0, 0.1803922, 1,
1.817709, -2.010819, 1.839797, 1, 0, 0.172549, 1,
1.83035, 0.186714, 2.525842, 1, 0, 0.1686275, 1,
1.841671, 1.083895, -0.486836, 1, 0, 0.1607843, 1,
1.85127, -1.828056, 1.873255, 1, 0, 0.1568628, 1,
1.903816, 1.29965, 2.748191, 1, 0, 0.1490196, 1,
1.923415, 0.07253518, 0.304508, 1, 0, 0.145098, 1,
1.943737, -0.6976992, 1.903281, 1, 0, 0.1372549, 1,
1.979965, 0.8229874, -1.03347, 1, 0, 0.1333333, 1,
1.986364, -1.366701, 2.774168, 1, 0, 0.1254902, 1,
2.012672, -0.1318518, 1.006914, 1, 0, 0.1215686, 1,
2.041826, 1.557982, -0.1789808, 1, 0, 0.1137255, 1,
2.058048, 1.072295, 2.652677, 1, 0, 0.1098039, 1,
2.107523, -0.4325571, 3.198046, 1, 0, 0.1019608, 1,
2.111036, 0.5370662, 1.604411, 1, 0, 0.09411765, 1,
2.194634, 0.4447812, -0.4161506, 1, 0, 0.09019608, 1,
2.197467, -0.00677477, 2.541127, 1, 0, 0.08235294, 1,
2.248777, -1.965218, 1.290187, 1, 0, 0.07843138, 1,
2.252169, 0.2549707, 1.811659, 1, 0, 0.07058824, 1,
2.304328, 0.4724753, 0.7699761, 1, 0, 0.06666667, 1,
2.427938, 1.744701, 2.116625, 1, 0, 0.05882353, 1,
2.534534, 1.143741, 1.313093, 1, 0, 0.05490196, 1,
2.548363, 0.5884269, 0.4783441, 1, 0, 0.04705882, 1,
2.562736, 0.9108397, 0.1872404, 1, 0, 0.04313726, 1,
2.564203, 0.1272065, 1.966282, 1, 0, 0.03529412, 1,
2.578497, -1.102565, 1.907787, 1, 0, 0.03137255, 1,
2.59994, 2.268625, 2.239057, 1, 0, 0.02352941, 1,
2.707613, -0.1658079, 0.3644658, 1, 0, 0.01960784, 1,
2.752755, 0.005782126, 1.353642, 1, 0, 0.01176471, 1,
3.603082, 0.7607359, 0.9570624, 1, 0, 0.007843138, 1
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
0.1808081, -4.021577, -7.049245, 0, -0.5, 0.5, 0.5,
0.1808081, -4.021577, -7.049245, 1, -0.5, 0.5, 0.5,
0.1808081, -4.021577, -7.049245, 1, 1.5, 0.5, 0.5,
0.1808081, -4.021577, -7.049245, 0, 1.5, 0.5, 0.5
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
-4.401617, 0.2686793, -7.049245, 0, -0.5, 0.5, 0.5,
-4.401617, 0.2686793, -7.049245, 1, -0.5, 0.5, 0.5,
-4.401617, 0.2686793, -7.049245, 1, 1.5, 0.5, 0.5,
-4.401617, 0.2686793, -7.049245, 0, 1.5, 0.5, 0.5
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
-4.401617, -4.021577, -0.181706, 0, -0.5, 0.5, 0.5,
-4.401617, -4.021577, -0.181706, 1, -0.5, 0.5, 0.5,
-4.401617, -4.021577, -0.181706, 1, 1.5, 0.5, 0.5,
-4.401617, -4.021577, -0.181706, 0, 1.5, 0.5, 0.5
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
-3, -3.031518, -5.464428,
3, -3.031518, -5.464428,
-3, -3.031518, -5.464428,
-3, -3.196528, -5.728564,
-2, -3.031518, -5.464428,
-2, -3.196528, -5.728564,
-1, -3.031518, -5.464428,
-1, -3.196528, -5.728564,
0, -3.031518, -5.464428,
0, -3.196528, -5.728564,
1, -3.031518, -5.464428,
1, -3.196528, -5.728564,
2, -3.031518, -5.464428,
2, -3.196528, -5.728564,
3, -3.031518, -5.464428,
3, -3.196528, -5.728564
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
-3, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
-3, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
-3, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
-3, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5,
-2, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
-2, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
-2, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
-2, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5,
-1, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
-1, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
-1, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
-1, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5,
0, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
0, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
0, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
0, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5,
1, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
1, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
1, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
1, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5,
2, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
2, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
2, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
2, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5,
3, -3.526548, -6.256837, 0, -0.5, 0.5, 0.5,
3, -3.526548, -6.256837, 1, -0.5, 0.5, 0.5,
3, -3.526548, -6.256837, 1, 1.5, 0.5, 0.5,
3, -3.526548, -6.256837, 0, 1.5, 0.5, 0.5
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
-3.344134, -2, -5.464428,
-3.344134, 3, -5.464428,
-3.344134, -2, -5.464428,
-3.520381, -2, -5.728564,
-3.344134, -1, -5.464428,
-3.520381, -1, -5.728564,
-3.344134, 0, -5.464428,
-3.520381, 0, -5.728564,
-3.344134, 1, -5.464428,
-3.520381, 1, -5.728564,
-3.344134, 2, -5.464428,
-3.520381, 2, -5.728564,
-3.344134, 3, -5.464428,
-3.520381, 3, -5.728564
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
-3.872876, -2, -6.256837, 0, -0.5, 0.5, 0.5,
-3.872876, -2, -6.256837, 1, -0.5, 0.5, 0.5,
-3.872876, -2, -6.256837, 1, 1.5, 0.5, 0.5,
-3.872876, -2, -6.256837, 0, 1.5, 0.5, 0.5,
-3.872876, -1, -6.256837, 0, -0.5, 0.5, 0.5,
-3.872876, -1, -6.256837, 1, -0.5, 0.5, 0.5,
-3.872876, -1, -6.256837, 1, 1.5, 0.5, 0.5,
-3.872876, -1, -6.256837, 0, 1.5, 0.5, 0.5,
-3.872876, 0, -6.256837, 0, -0.5, 0.5, 0.5,
-3.872876, 0, -6.256837, 1, -0.5, 0.5, 0.5,
-3.872876, 0, -6.256837, 1, 1.5, 0.5, 0.5,
-3.872876, 0, -6.256837, 0, 1.5, 0.5, 0.5,
-3.872876, 1, -6.256837, 0, -0.5, 0.5, 0.5,
-3.872876, 1, -6.256837, 1, -0.5, 0.5, 0.5,
-3.872876, 1, -6.256837, 1, 1.5, 0.5, 0.5,
-3.872876, 1, -6.256837, 0, 1.5, 0.5, 0.5,
-3.872876, 2, -6.256837, 0, -0.5, 0.5, 0.5,
-3.872876, 2, -6.256837, 1, -0.5, 0.5, 0.5,
-3.872876, 2, -6.256837, 1, 1.5, 0.5, 0.5,
-3.872876, 2, -6.256837, 0, 1.5, 0.5, 0.5,
-3.872876, 3, -6.256837, 0, -0.5, 0.5, 0.5,
-3.872876, 3, -6.256837, 1, -0.5, 0.5, 0.5,
-3.872876, 3, -6.256837, 1, 1.5, 0.5, 0.5,
-3.872876, 3, -6.256837, 0, 1.5, 0.5, 0.5
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
-3.344134, -3.031518, -4,
-3.344134, -3.031518, 4,
-3.344134, -3.031518, -4,
-3.520381, -3.196528, -4,
-3.344134, -3.031518, -2,
-3.520381, -3.196528, -2,
-3.344134, -3.031518, 0,
-3.520381, -3.196528, 0,
-3.344134, -3.031518, 2,
-3.520381, -3.196528, 2,
-3.344134, -3.031518, 4,
-3.520381, -3.196528, 4
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
-3.872876, -3.526548, -4, 0, -0.5, 0.5, 0.5,
-3.872876, -3.526548, -4, 1, -0.5, 0.5, 0.5,
-3.872876, -3.526548, -4, 1, 1.5, 0.5, 0.5,
-3.872876, -3.526548, -4, 0, 1.5, 0.5, 0.5,
-3.872876, -3.526548, -2, 0, -0.5, 0.5, 0.5,
-3.872876, -3.526548, -2, 1, -0.5, 0.5, 0.5,
-3.872876, -3.526548, -2, 1, 1.5, 0.5, 0.5,
-3.872876, -3.526548, -2, 0, 1.5, 0.5, 0.5,
-3.872876, -3.526548, 0, 0, -0.5, 0.5, 0.5,
-3.872876, -3.526548, 0, 1, -0.5, 0.5, 0.5,
-3.872876, -3.526548, 0, 1, 1.5, 0.5, 0.5,
-3.872876, -3.526548, 0, 0, 1.5, 0.5, 0.5,
-3.872876, -3.526548, 2, 0, -0.5, 0.5, 0.5,
-3.872876, -3.526548, 2, 1, -0.5, 0.5, 0.5,
-3.872876, -3.526548, 2, 1, 1.5, 0.5, 0.5,
-3.872876, -3.526548, 2, 0, 1.5, 0.5, 0.5,
-3.872876, -3.526548, 4, 0, -0.5, 0.5, 0.5,
-3.872876, -3.526548, 4, 1, -0.5, 0.5, 0.5,
-3.872876, -3.526548, 4, 1, 1.5, 0.5, 0.5,
-3.872876, -3.526548, 4, 0, 1.5, 0.5, 0.5
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
-3.344134, -3.031518, -5.464428,
-3.344134, 3.568877, -5.464428,
-3.344134, -3.031518, 5.101017,
-3.344134, 3.568877, 5.101017,
-3.344134, -3.031518, -5.464428,
-3.344134, -3.031518, 5.101017,
-3.344134, 3.568877, -5.464428,
-3.344134, 3.568877, 5.101017,
-3.344134, -3.031518, -5.464428,
3.70575, -3.031518, -5.464428,
-3.344134, -3.031518, 5.101017,
3.70575, -3.031518, 5.101017,
-3.344134, 3.568877, -5.464428,
3.70575, 3.568877, -5.464428,
-3.344134, 3.568877, 5.101017,
3.70575, 3.568877, 5.101017,
3.70575, -3.031518, -5.464428,
3.70575, 3.568877, -5.464428,
3.70575, -3.031518, 5.101017,
3.70575, 3.568877, 5.101017,
3.70575, -3.031518, -5.464428,
3.70575, -3.031518, 5.101017,
3.70575, 3.568877, -5.464428,
3.70575, 3.568877, 5.101017
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
var radius = 7.643475;
var distance = 34.00668;
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
mvMatrix.translate( -0.1808081, -0.2686793, 0.181706 );
mvMatrix.scale( 1.172257, 1.252088, 0.7821985 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00668);
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
sodium_arsenic_oxide<-read.table("sodium_arsenic_oxide.xyz", skip=1)
```

```
## Error in read.table("sodium_arsenic_oxide.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-sodium_arsenic_oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_arsenic_oxide' not found
```

```r
y<-sodium_arsenic_oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_arsenic_oxide' not found
```

```r
z<-sodium_arsenic_oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_arsenic_oxide' not found
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
-3.241466, 1.103794, -1.158568, 0, 0, 1, 1, 1,
-2.867523, -1.763019, -1.415103, 1, 0, 0, 1, 1,
-2.823259, -0.007867006, -0.03467124, 1, 0, 0, 1, 1,
-2.642557, -0.07231802, -1.747391, 1, 0, 0, 1, 1,
-2.513353, 0.1142256, -1.101046, 1, 0, 0, 1, 1,
-2.512146, -0.9895766, -0.1113024, 1, 0, 0, 1, 1,
-2.510672, 0.236999, -1.494655, 0, 0, 0, 1, 1,
-2.401845, 1.610257, 1.144848, 0, 0, 0, 1, 1,
-2.345131, -0.1895243, -2.169999, 0, 0, 0, 1, 1,
-2.291869, -0.9729424, -2.773263, 0, 0, 0, 1, 1,
-2.272535, 0.3169765, -1.342917, 0, 0, 0, 1, 1,
-2.235372, 0.8031769, -1.081324, 0, 0, 0, 1, 1,
-2.194737, 0.8296673, -0.9229743, 0, 0, 0, 1, 1,
-2.147651, -0.4180757, 0.502822, 1, 1, 1, 1, 1,
-2.117985, -1.693137, -2.957749, 1, 1, 1, 1, 1,
-2.110041, -1.099093, -1.49448, 1, 1, 1, 1, 1,
-2.1001, -0.1412173, -3.236735, 1, 1, 1, 1, 1,
-2.072846, -0.3306894, -1.667927, 1, 1, 1, 1, 1,
-2.072154, 0.9130723, -0.1048272, 1, 1, 1, 1, 1,
-2.06769, 2.159236, 0.4162668, 1, 1, 1, 1, 1,
-2.052326, -1.220882, 0.1898661, 1, 1, 1, 1, 1,
-2.010473, -0.3385009, -2.214013, 1, 1, 1, 1, 1,
-1.995263, 1.596038, -2.306489, 1, 1, 1, 1, 1,
-1.982372, 1.463501, -0.5343491, 1, 1, 1, 1, 1,
-1.96686, -0.4319983, -2.158605, 1, 1, 1, 1, 1,
-1.949027, -0.2705596, -1.813722, 1, 1, 1, 1, 1,
-1.930626, -1.462907, -2.862669, 1, 1, 1, 1, 1,
-1.887282, 0.4239087, -1.818429, 1, 1, 1, 1, 1,
-1.881634, -0.01373087, -0.6566615, 0, 0, 1, 1, 1,
-1.872218, 0.1517765, -1.477921, 1, 0, 0, 1, 1,
-1.868037, 0.1216926, -1.289983, 1, 0, 0, 1, 1,
-1.866593, 0.8046718, -1.559046, 1, 0, 0, 1, 1,
-1.841944, 0.3319595, -2.415965, 1, 0, 0, 1, 1,
-1.833432, -0.8649611, -1.711411, 1, 0, 0, 1, 1,
-1.830318, -0.4359647, -1.65732, 0, 0, 0, 1, 1,
-1.806005, -0.6829067, -1.047889, 0, 0, 0, 1, 1,
-1.745226, -1.372742, -4.154747, 0, 0, 0, 1, 1,
-1.744633, -1.066851, -3.341301, 0, 0, 0, 1, 1,
-1.737143, 1.126884, -1.570178, 0, 0, 0, 1, 1,
-1.737027, -0.1725091, -0.9971096, 0, 0, 0, 1, 1,
-1.732058, 0.1590114, -0.99116, 0, 0, 0, 1, 1,
-1.725729, -0.6572137, -3.062286, 1, 1, 1, 1, 1,
-1.721309, 0.6115777, -0.04021602, 1, 1, 1, 1, 1,
-1.718491, 2.505464, -0.2433732, 1, 1, 1, 1, 1,
-1.718294, -0.1970896, -1.28336, 1, 1, 1, 1, 1,
-1.717373, -0.1491376, -2.451465, 1, 1, 1, 1, 1,
-1.695757, -1.108709, -3.1222, 1, 1, 1, 1, 1,
-1.694651, -0.4683834, -2.517118, 1, 1, 1, 1, 1,
-1.692121, 0.4064182, -1.040569, 1, 1, 1, 1, 1,
-1.677787, 0.02397098, -2.419777, 1, 1, 1, 1, 1,
-1.665574, -0.8157023, -1.191881, 1, 1, 1, 1, 1,
-1.657291, -0.7829821, -2.952405, 1, 1, 1, 1, 1,
-1.656612, 0.3262679, -1.462265, 1, 1, 1, 1, 1,
-1.647135, 0.04382331, -0.5222098, 1, 1, 1, 1, 1,
-1.639235, 0.6992297, 1.553917, 1, 1, 1, 1, 1,
-1.628827, -0.7986584, -2.171953, 1, 1, 1, 1, 1,
-1.62305, 0.9783285, -1.214619, 0, 0, 1, 1, 1,
-1.619366, 0.4872502, -0.4377854, 1, 0, 0, 1, 1,
-1.610042, 0.2081929, -1.062604, 1, 0, 0, 1, 1,
-1.603558, 0.8689738, -3.346216, 1, 0, 0, 1, 1,
-1.589346, 0.8572843, -0.07245748, 1, 0, 0, 1, 1,
-1.563281, -0.5383559, -1.244521, 1, 0, 0, 1, 1,
-1.559908, -0.09396709, -1.331098, 0, 0, 0, 1, 1,
-1.553018, -1.827683, -3.799249, 0, 0, 0, 1, 1,
-1.550952, -0.4040695, -1.282186, 0, 0, 0, 1, 1,
-1.550367, -0.2709546, 0.003117306, 0, 0, 0, 1, 1,
-1.541687, 0.1843083, -1.683442, 0, 0, 0, 1, 1,
-1.534673, -0.6656327, -1.425794, 0, 0, 0, 1, 1,
-1.52183, 0.9857472, -2.106162, 0, 0, 0, 1, 1,
-1.520626, -1.200075, -2.313674, 1, 1, 1, 1, 1,
-1.518266, -1.190295, -4.35166, 1, 1, 1, 1, 1,
-1.517351, 1.695979, 0.4115616, 1, 1, 1, 1, 1,
-1.509247, 1.549902, -0.3736003, 1, 1, 1, 1, 1,
-1.494441, -1.401167, -3.142394, 1, 1, 1, 1, 1,
-1.488109, -0.2421383, -0.8976433, 1, 1, 1, 1, 1,
-1.479086, 0.4354025, -0.9366403, 1, 1, 1, 1, 1,
-1.469575, 0.6669729, -2.092476, 1, 1, 1, 1, 1,
-1.468058, 0.9083013, 0.4062105, 1, 1, 1, 1, 1,
-1.463116, -0.9207998, -2.109399, 1, 1, 1, 1, 1,
-1.447854, -0.9056568, -3.136468, 1, 1, 1, 1, 1,
-1.445773, 0.9043623, 1.755688, 1, 1, 1, 1, 1,
-1.437926, -0.9184144, -3.772439, 1, 1, 1, 1, 1,
-1.42217, 0.5344638, -0.7978404, 1, 1, 1, 1, 1,
-1.419744, -1.348862, -1.461462, 1, 1, 1, 1, 1,
-1.419647, 1.060961, -0.4717238, 0, 0, 1, 1, 1,
-1.413469, 2.608818, -0.2282625, 1, 0, 0, 1, 1,
-1.413327, 0.5666317, -2.872779, 1, 0, 0, 1, 1,
-1.411533, 1.071709, -0.8943154, 1, 0, 0, 1, 1,
-1.408533, -1.81676, -2.228302, 1, 0, 0, 1, 1,
-1.393174, 0.9139097, 0.7304694, 1, 0, 0, 1, 1,
-1.385835, -1.05021, -1.48696, 0, 0, 0, 1, 1,
-1.375419, 0.1892829, -3.132545, 0, 0, 0, 1, 1,
-1.36251, -0.552779, -3.483767, 0, 0, 0, 1, 1,
-1.338307, -0.4124898, -2.281918, 0, 0, 0, 1, 1,
-1.335628, -0.5607681, -3.362263, 0, 0, 0, 1, 1,
-1.328312, 0.8087307, -2.820784, 0, 0, 0, 1, 1,
-1.323629, -1.196614, -4.170526, 0, 0, 0, 1, 1,
-1.316832, 0.5989185, -2.550801, 1, 1, 1, 1, 1,
-1.3031, 1.121427, -0.3800533, 1, 1, 1, 1, 1,
-1.302491, 0.2448392, -1.782944, 1, 1, 1, 1, 1,
-1.301679, -1.016299, -1.143867, 1, 1, 1, 1, 1,
-1.294402, -0.2650304, -2.911268, 1, 1, 1, 1, 1,
-1.294317, -0.8835468, -2.576854, 1, 1, 1, 1, 1,
-1.285335, -0.899673, -2.129336, 1, 1, 1, 1, 1,
-1.281249, -1.412361, -3.028827, 1, 1, 1, 1, 1,
-1.277663, -1.203624, -3.538032, 1, 1, 1, 1, 1,
-1.275951, 0.7643684, -1.058331, 1, 1, 1, 1, 1,
-1.273515, 0.1215923, -0.4561197, 1, 1, 1, 1, 1,
-1.273266, -0.2404452, -1.02155, 1, 1, 1, 1, 1,
-1.265877, 2.035014, -0.1295969, 1, 1, 1, 1, 1,
-1.255983, 0.973357, 0.287807, 1, 1, 1, 1, 1,
-1.251148, 0.6063821, -2.019717, 1, 1, 1, 1, 1,
-1.244512, -1.527787, -2.435887, 0, 0, 1, 1, 1,
-1.23622, -1.096055, -0.7470452, 1, 0, 0, 1, 1,
-1.234377, -0.758292, -2.194667, 1, 0, 0, 1, 1,
-1.231863, -1.098746, -2.908709, 1, 0, 0, 1, 1,
-1.214049, -0.819711, -1.418263, 1, 0, 0, 1, 1,
-1.212952, 0.05017732, -1.059228, 1, 0, 0, 1, 1,
-1.20657, 0.04118086, 0.479269, 0, 0, 0, 1, 1,
-1.204357, -0.4841329, -2.200887, 0, 0, 0, 1, 1,
-1.200069, -0.1633406, -1.72692, 0, 0, 0, 1, 1,
-1.182833, 0.248333, -0.7778863, 0, 0, 0, 1, 1,
-1.180515, -0.7494866, -2.399506, 0, 0, 0, 1, 1,
-1.180058, 0.4272959, -2.059609, 0, 0, 0, 1, 1,
-1.177867, 0.7204682, 1.007254, 0, 0, 0, 1, 1,
-1.170736, -1.962531, -1.209432, 1, 1, 1, 1, 1,
-1.167603, -1.331225, -1.839452, 1, 1, 1, 1, 1,
-1.167197, 1.470571, -0.8368824, 1, 1, 1, 1, 1,
-1.164309, 0.9521656, -2.981925, 1, 1, 1, 1, 1,
-1.16374, 0.1671969, -1.718791, 1, 1, 1, 1, 1,
-1.158104, 0.9068996, -0.4242665, 1, 1, 1, 1, 1,
-1.155068, -1.629615, -3.330802, 1, 1, 1, 1, 1,
-1.154296, -0.9899256, -2.993613, 1, 1, 1, 1, 1,
-1.152404, -0.9180717, -2.179942, 1, 1, 1, 1, 1,
-1.151329, -0.1255062, -1.57835, 1, 1, 1, 1, 1,
-1.1439, -1.278109, -1.998674, 1, 1, 1, 1, 1,
-1.141722, -0.2861665, -1.833627, 1, 1, 1, 1, 1,
-1.140599, 0.3762074, -0.044536, 1, 1, 1, 1, 1,
-1.135543, 1.418462, -2.115117, 1, 1, 1, 1, 1,
-1.130321, 0.5097347, -1.911891, 1, 1, 1, 1, 1,
-1.129332, 0.7004061, -1.610396, 0, 0, 1, 1, 1,
-1.119944, -2.041778, -1.564973, 1, 0, 0, 1, 1,
-1.112274, -0.2699625, -1.633173, 1, 0, 0, 1, 1,
-1.109943, 1.671652, 0.6507527, 1, 0, 0, 1, 1,
-1.102289, 0.9646105, -0.5088838, 1, 0, 0, 1, 1,
-1.090029, -0.198115, -2.738819, 1, 0, 0, 1, 1,
-1.085235, -0.9423609, -2.480156, 0, 0, 0, 1, 1,
-1.078277, -1.547267, -1.808708, 0, 0, 0, 1, 1,
-1.074657, -1.353114, -2.858183, 0, 0, 0, 1, 1,
-1.072267, -0.07220595, -2.14941, 0, 0, 0, 1, 1,
-1.070897, -0.353288, -0.570862, 0, 0, 0, 1, 1,
-1.069946, 0.2011608, -2.311116, 0, 0, 0, 1, 1,
-1.067154, -1.050863, -1.738677, 0, 0, 0, 1, 1,
-1.065375, -1.089661, -1.755325, 1, 1, 1, 1, 1,
-1.059735, -0.1764701, -0.7611477, 1, 1, 1, 1, 1,
-1.051178, 0.9494877, -0.9334282, 1, 1, 1, 1, 1,
-1.042595, 0.1156182, -0.6531343, 1, 1, 1, 1, 1,
-1.040123, -0.7207354, -0.9053124, 1, 1, 1, 1, 1,
-1.03712, 0.9926156, -1.699364, 1, 1, 1, 1, 1,
-1.031456, -0.9612391, -2.564167, 1, 1, 1, 1, 1,
-1.024558, -1.531732, -4.268185, 1, 1, 1, 1, 1,
-1.024208, -0.459358, -2.897657, 1, 1, 1, 1, 1,
-1.016434, -0.1348721, -0.6651667, 1, 1, 1, 1, 1,
-1.015588, 0.13324, -1.349728, 1, 1, 1, 1, 1,
-1.014227, -1.717875, -1.590942, 1, 1, 1, 1, 1,
-1.010736, 1.211304, -1.647983, 1, 1, 1, 1, 1,
-1.007536, 1.177496, -0.2811763, 1, 1, 1, 1, 1,
-1.004744, -2.265891, -2.826044, 1, 1, 1, 1, 1,
-1.002739, 0.6299725, -0.9435592, 0, 0, 1, 1, 1,
-1.000147, 1.415837, 0.4022713, 1, 0, 0, 1, 1,
-0.9893038, 0.8694888, -0.7751073, 1, 0, 0, 1, 1,
-0.9885899, -0.7774295, -2.742126, 1, 0, 0, 1, 1,
-0.9852594, -0.691763, -2.791111, 1, 0, 0, 1, 1,
-0.9849682, 0.3216667, -1.311597, 1, 0, 0, 1, 1,
-0.9800498, 1.12155, -0.1893057, 0, 0, 0, 1, 1,
-0.9788905, -1.381724, -3.415378, 0, 0, 0, 1, 1,
-0.978455, -0.3320627, -2.634527, 0, 0, 0, 1, 1,
-0.9784234, -0.03878405, -2.12034, 0, 0, 0, 1, 1,
-0.9756352, -0.2005875, -2.132589, 0, 0, 0, 1, 1,
-0.9732629, 0.399878, -2.092161, 0, 0, 0, 1, 1,
-0.9603228, 0.3713042, -1.282925, 0, 0, 0, 1, 1,
-0.9585746, -0.01051731, -0.2043313, 1, 1, 1, 1, 1,
-0.9554253, -2.743902, -1.616404, 1, 1, 1, 1, 1,
-0.9505786, -0.6898766, -4.121277, 1, 1, 1, 1, 1,
-0.9498618, 0.6009952, -0.2286162, 1, 1, 1, 1, 1,
-0.9497061, -0.1728658, 0.8053181, 1, 1, 1, 1, 1,
-0.9456037, -0.187827, -0.8358234, 1, 1, 1, 1, 1,
-0.9236457, -0.4815305, -3.423317, 1, 1, 1, 1, 1,
-0.9116967, -0.3150589, -1.99828, 1, 1, 1, 1, 1,
-0.9110568, 0.6578496, -1.243133, 1, 1, 1, 1, 1,
-0.9088516, -0.3834294, -4.293915, 1, 1, 1, 1, 1,
-0.9023018, 0.191079, 0.2624541, 1, 1, 1, 1, 1,
-0.9012004, -0.2250473, -2.477043, 1, 1, 1, 1, 1,
-0.8943591, -0.4630399, -1.893686, 1, 1, 1, 1, 1,
-0.8909622, 0.8618515, 0.5979766, 1, 1, 1, 1, 1,
-0.8866275, 0.5593026, -0.0351624, 1, 1, 1, 1, 1,
-0.885052, -0.1972516, -2.804654, 0, 0, 1, 1, 1,
-0.8849354, -0.358953, -4.095468, 1, 0, 0, 1, 1,
-0.8844678, -0.7272574, -2.672397, 1, 0, 0, 1, 1,
-0.8836313, -0.4859801, -1.406827, 1, 0, 0, 1, 1,
-0.8818387, 0.4836397, -1.844957, 1, 0, 0, 1, 1,
-0.8795563, 0.3615615, -1.530429, 1, 0, 0, 1, 1,
-0.8778702, 0.375494, -1.385027, 0, 0, 0, 1, 1,
-0.8778035, 0.5811161, -1.697327, 0, 0, 0, 1, 1,
-0.8768812, 0.4182216, -1.020771, 0, 0, 0, 1, 1,
-0.8755842, -1.358866, -1.492251, 0, 0, 0, 1, 1,
-0.8753794, 0.43422, -2.315564, 0, 0, 0, 1, 1,
-0.8689356, 0.04240924, -1.095487, 0, 0, 0, 1, 1,
-0.8595444, -0.1154883, -0.8708601, 0, 0, 0, 1, 1,
-0.8532999, 0.2262253, -2.154608, 1, 1, 1, 1, 1,
-0.8532604, 0.5301051, -2.638604, 1, 1, 1, 1, 1,
-0.8462902, 0.7472657, -0.9041599, 1, 1, 1, 1, 1,
-0.8439915, -0.4921374, -3.588137, 1, 1, 1, 1, 1,
-0.8432862, 1.611056, 0.9444256, 1, 1, 1, 1, 1,
-0.8413129, -0.7799751, -1.846598, 1, 1, 1, 1, 1,
-0.8382663, -1.408543, -3.191655, 1, 1, 1, 1, 1,
-0.8326429, 0.1231175, -2.156108, 1, 1, 1, 1, 1,
-0.8319513, -0.03142413, -2.282628, 1, 1, 1, 1, 1,
-0.8240047, 0.1059636, -0.2009625, 1, 1, 1, 1, 1,
-0.8188695, 1.220632, -0.9326978, 1, 1, 1, 1, 1,
-0.8172462, -0.4727692, -2.228172, 1, 1, 1, 1, 1,
-0.8172078, -0.03891835, -2.90511, 1, 1, 1, 1, 1,
-0.8139303, -0.4525308, -1.91498, 1, 1, 1, 1, 1,
-0.8089742, 1.057131, 0.01950353, 1, 1, 1, 1, 1,
-0.8026653, -0.4515483, -2.353564, 0, 0, 1, 1, 1,
-0.8004689, 0.8117622, -1.672082, 1, 0, 0, 1, 1,
-0.7977981, 1.310869, -0.7281842, 1, 0, 0, 1, 1,
-0.7928925, -0.4959427, -2.025985, 1, 0, 0, 1, 1,
-0.7924353, 0.8384726, 0.2441711, 1, 0, 0, 1, 1,
-0.7901353, 1.05848, 0.03238835, 1, 0, 0, 1, 1,
-0.7901041, -0.4939119, -4.035709, 0, 0, 0, 1, 1,
-0.7869242, 0.03277034, -2.143158, 0, 0, 0, 1, 1,
-0.7780112, 0.6542333, -0.5354857, 0, 0, 0, 1, 1,
-0.7729029, -0.9220699, -1.323262, 0, 0, 0, 1, 1,
-0.7689128, 1.304938, -1.471844, 0, 0, 0, 1, 1,
-0.764745, 0.4997493, -2.23887, 0, 0, 0, 1, 1,
-0.7587476, -0.503116, -2.939845, 0, 0, 0, 1, 1,
-0.752906, -1.768063, -2.959314, 1, 1, 1, 1, 1,
-0.7513898, 1.151781, -1.43598, 1, 1, 1, 1, 1,
-0.7484638, -1.089856, -0.5245349, 1, 1, 1, 1, 1,
-0.747914, 0.4849496, -2.493271, 1, 1, 1, 1, 1,
-0.7404978, 0.03850791, -2.993729, 1, 1, 1, 1, 1,
-0.7380687, 0.2530867, -0.8879609, 1, 1, 1, 1, 1,
-0.7212478, -0.2478222, -0.05433369, 1, 1, 1, 1, 1,
-0.716203, 1.376558, -0.04652134, 1, 1, 1, 1, 1,
-0.7112648, 0.09378979, -2.450505, 1, 1, 1, 1, 1,
-0.7079701, -0.8457718, -1.662564, 1, 1, 1, 1, 1,
-0.70732, 0.4080563, -0.7163951, 1, 1, 1, 1, 1,
-0.7071779, 0.659986, -1.838496, 1, 1, 1, 1, 1,
-0.6997061, 0.2248452, -2.584609, 1, 1, 1, 1, 1,
-0.6927226, -1.408826, -2.891654, 1, 1, 1, 1, 1,
-0.6897377, -1.157273, -2.805218, 1, 1, 1, 1, 1,
-0.6845191, 0.915659, -1.770339, 0, 0, 1, 1, 1,
-0.6775321, -0.2457947, -0.6648759, 1, 0, 0, 1, 1,
-0.6676177, -0.03343812, -2.58949, 1, 0, 0, 1, 1,
-0.6675044, -1.652966, -2.337472, 1, 0, 0, 1, 1,
-0.6657766, 1.614343, 0.5108763, 1, 0, 0, 1, 1,
-0.6649714, -1.141891, -1.131659, 1, 0, 0, 1, 1,
-0.6646554, 1.343918, -1.406742, 0, 0, 0, 1, 1,
-0.6642423, 0.09475483, -1.645218, 0, 0, 0, 1, 1,
-0.6607798, -0.7459549, -1.38742, 0, 0, 0, 1, 1,
-0.6605185, 0.1866387, -1.560302, 0, 0, 0, 1, 1,
-0.653928, -0.4522192, -2.97842, 0, 0, 0, 1, 1,
-0.6504045, 1.770297, -0.6021524, 0, 0, 0, 1, 1,
-0.649892, 0.4438424, -2.875876, 0, 0, 0, 1, 1,
-0.648757, -0.03976762, 0.7890347, 1, 1, 1, 1, 1,
-0.6469252, 0.0664892, -2.929379, 1, 1, 1, 1, 1,
-0.6373539, 1.600712, -2.181318, 1, 1, 1, 1, 1,
-0.6362062, -0.3646616, -0.9284309, 1, 1, 1, 1, 1,
-0.6316221, 1.573531, 1.027934, 1, 1, 1, 1, 1,
-0.6270016, 0.8405342, -1.091093, 1, 1, 1, 1, 1,
-0.6254627, 0.7556337, -0.7341866, 1, 1, 1, 1, 1,
-0.6252805, -0.1918153, -3.057477, 1, 1, 1, 1, 1,
-0.6132122, -0.9749965, -2.204566, 1, 1, 1, 1, 1,
-0.6126835, -0.3983415, -2.409447, 1, 1, 1, 1, 1,
-0.6105742, 1.008784, -0.6465758, 1, 1, 1, 1, 1,
-0.6089461, -0.9189416, -2.704518, 1, 1, 1, 1, 1,
-0.6039131, -0.0456862, -2.537737, 1, 1, 1, 1, 1,
-0.6033058, 0.1322541, -0.4071332, 1, 1, 1, 1, 1,
-0.6031972, 0.4609933, -2.175649, 1, 1, 1, 1, 1,
-0.6013741, 0.05388749, -0.865406, 0, 0, 1, 1, 1,
-0.6001055, 1.315047, -0.954165, 1, 0, 0, 1, 1,
-0.5993093, -0.292298, -4.23885, 1, 0, 0, 1, 1,
-0.5981872, -2.531342, -3.814079, 1, 0, 0, 1, 1,
-0.597899, 0.2936856, -1.250941, 1, 0, 0, 1, 1,
-0.5942017, -0.2396425, -2.442278, 1, 0, 0, 1, 1,
-0.5934018, 0.2238853, -1.809968, 0, 0, 0, 1, 1,
-0.5910403, 1.312875, -0.4735664, 0, 0, 0, 1, 1,
-0.5876966, 1.16155, -0.900292, 0, 0, 0, 1, 1,
-0.5816519, 0.2041185, -1.140844, 0, 0, 0, 1, 1,
-0.5815653, -0.5839304, -1.798167, 0, 0, 0, 1, 1,
-0.5794873, 0.04282955, -1.52189, 0, 0, 0, 1, 1,
-0.5794035, 0.2111833, -2.781628, 0, 0, 0, 1, 1,
-0.5750861, 0.2547014, -1.812215, 1, 1, 1, 1, 1,
-0.5704824, -0.2860309, -1.80856, 1, 1, 1, 1, 1,
-0.5588446, -0.3937627, -1.690911, 1, 1, 1, 1, 1,
-0.5588068, -0.2540385, -1.20639, 1, 1, 1, 1, 1,
-0.5558195, 0.3401378, -1.159704, 1, 1, 1, 1, 1,
-0.5501939, 0.4232401, -0.9208137, 1, 1, 1, 1, 1,
-0.5474554, -0.299698, -2.626399, 1, 1, 1, 1, 1,
-0.5449219, 1.165889, 1.301665, 1, 1, 1, 1, 1,
-0.5436229, -0.3685614, -4.240581, 1, 1, 1, 1, 1,
-0.5392923, -0.4734765, -2.683221, 1, 1, 1, 1, 1,
-0.536509, -1.256731, -3.167105, 1, 1, 1, 1, 1,
-0.5296564, -0.2276344, -2.664361, 1, 1, 1, 1, 1,
-0.5198592, 0.3105729, -0.8951688, 1, 1, 1, 1, 1,
-0.5180961, -0.8417004, -3.652029, 1, 1, 1, 1, 1,
-0.5145015, -0.6691265, -4.235415, 1, 1, 1, 1, 1,
-0.5088858, 0.2601075, -0.9040536, 0, 0, 1, 1, 1,
-0.5080907, 0.880173, 0.2560405, 1, 0, 0, 1, 1,
-0.5034559, -0.5200668, -1.429338, 1, 0, 0, 1, 1,
-0.5029789, -0.369842, -2.88458, 1, 0, 0, 1, 1,
-0.4972314, 1.010592, 0.7305295, 1, 0, 0, 1, 1,
-0.4929917, 0.4140598, -0.6017631, 1, 0, 0, 1, 1,
-0.491262, -1.49625, -2.195379, 0, 0, 0, 1, 1,
-0.4902385, -1.107996, -2.526802, 0, 0, 0, 1, 1,
-0.488133, -0.642125, -2.617932, 0, 0, 0, 1, 1,
-0.4867853, -0.7732071, -2.15533, 0, 0, 0, 1, 1,
-0.4759511, -0.3595885, -3.853845, 0, 0, 0, 1, 1,
-0.4746854, -0.5825702, -1.903892, 0, 0, 0, 1, 1,
-0.4724499, 0.169997, -2.256028, 0, 0, 0, 1, 1,
-0.4716288, -0.2789207, -1.68262, 1, 1, 1, 1, 1,
-0.4702568, -0.4771238, -1.889507, 1, 1, 1, 1, 1,
-0.4653299, -0.9200906, -1.552016, 1, 1, 1, 1, 1,
-0.4602345, -2.265217, -1.704471, 1, 1, 1, 1, 1,
-0.459639, 1.09963, 0.2973728, 1, 1, 1, 1, 1,
-0.4593593, 0.6395316, -0.6349291, 1, 1, 1, 1, 1,
-0.4505696, -0.6726962, -2.827758, 1, 1, 1, 1, 1,
-0.4485012, -0.9602424, -3.568345, 1, 1, 1, 1, 1,
-0.4457911, 0.2480585, -1.98286, 1, 1, 1, 1, 1,
-0.4454103, 0.1264778, -2.045194, 1, 1, 1, 1, 1,
-0.4392754, 0.6727238, -1.231535, 1, 1, 1, 1, 1,
-0.4390637, 0.3019608, -1.764186, 1, 1, 1, 1, 1,
-0.4382856, -1.46824, -3.996896, 1, 1, 1, 1, 1,
-0.4364261, -0.1236341, -3.377205, 1, 1, 1, 1, 1,
-0.4355037, -0.7750341, -2.449862, 1, 1, 1, 1, 1,
-0.4346684, 0.06463929, -1.883866, 0, 0, 1, 1, 1,
-0.4300961, 1.009441, -0.1611794, 1, 0, 0, 1, 1,
-0.4296463, 1.483798, 1.470723, 1, 0, 0, 1, 1,
-0.4244079, 0.09673794, -2.418142, 1, 0, 0, 1, 1,
-0.4226792, -0.1637575, -1.709788, 1, 0, 0, 1, 1,
-0.4222301, -0.2514665, -0.8964615, 1, 0, 0, 1, 1,
-0.419408, 0.544628, 0.4259413, 0, 0, 0, 1, 1,
-0.4192007, 0.1281528, -0.7102262, 0, 0, 0, 1, 1,
-0.417624, -0.1153136, -2.48426, 0, 0, 0, 1, 1,
-0.4115009, -0.5393897, -3.776637, 0, 0, 0, 1, 1,
-0.4084284, 0.8997121, -0.05718063, 0, 0, 0, 1, 1,
-0.4070035, 1.29815, -0.3986166, 0, 0, 0, 1, 1,
-0.3991473, -0.4805571, -2.523468, 0, 0, 0, 1, 1,
-0.3968644, 0.1075585, -1.806158, 1, 1, 1, 1, 1,
-0.396291, 2.647109, 0.03484561, 1, 1, 1, 1, 1,
-0.3958536, 1.489701, 0.3035829, 1, 1, 1, 1, 1,
-0.3933832, 0.2682321, 0.1268423, 1, 1, 1, 1, 1,
-0.3929129, 0.7274964, -1.177162, 1, 1, 1, 1, 1,
-0.3883565, 1.074098, -0.4840565, 1, 1, 1, 1, 1,
-0.3865251, 0.4133413, -0.8270657, 1, 1, 1, 1, 1,
-0.3856427, -1.519799, -2.021321, 1, 1, 1, 1, 1,
-0.3848048, -0.005420714, -0.2241751, 1, 1, 1, 1, 1,
-0.3795893, 0.221672, -1.616471, 1, 1, 1, 1, 1,
-0.3792332, 0.4652905, 0.0410873, 1, 1, 1, 1, 1,
-0.3777515, -0.349796, -0.7902688, 1, 1, 1, 1, 1,
-0.3758324, 1.72795, -0.1967804, 1, 1, 1, 1, 1,
-0.3646601, 0.2324053, -1.749048, 1, 1, 1, 1, 1,
-0.3530342, 0.2855455, -0.8265068, 1, 1, 1, 1, 1,
-0.3488634, 0.4320545, -1.658606, 0, 0, 1, 1, 1,
-0.3451522, -0.4191257, -3.410466, 1, 0, 0, 1, 1,
-0.3411111, -0.2603369, -1.724834, 1, 0, 0, 1, 1,
-0.3337055, 0.3795704, -0.4433598, 1, 0, 0, 1, 1,
-0.3335658, -0.3350236, -2.622402, 1, 0, 0, 1, 1,
-0.3328776, -1.832518, -4.545868, 1, 0, 0, 1, 1,
-0.3308716, 0.8545277, -1.624884, 0, 0, 0, 1, 1,
-0.3277743, -0.5699339, -3.098388, 0, 0, 0, 1, 1,
-0.3177471, -0.6496523, -2.774549, 0, 0, 0, 1, 1,
-0.3167131, 0.6597134, -0.1491464, 0, 0, 0, 1, 1,
-0.3165168, -0.9038686, -1.806849, 0, 0, 0, 1, 1,
-0.3053816, 0.9820892, -0.07483867, 0, 0, 0, 1, 1,
-0.3039814, -0.6019077, 0.2634999, 0, 0, 0, 1, 1,
-0.3025677, 1.044771, -0.04120087, 1, 1, 1, 1, 1,
-0.3024387, 0.6858497, -1.311886, 1, 1, 1, 1, 1,
-0.3023241, -1.781269, -3.490414, 1, 1, 1, 1, 1,
-0.3017342, 0.3214117, -1.23533, 1, 1, 1, 1, 1,
-0.3007596, -0.9347504, -3.586332, 1, 1, 1, 1, 1,
-0.3003058, 0.6401501, 0.3336262, 1, 1, 1, 1, 1,
-0.3001702, 0.8077927, 0.3843564, 1, 1, 1, 1, 1,
-0.2975518, 0.2781859, 0.8904542, 1, 1, 1, 1, 1,
-0.2944855, -1.422678, -2.13172, 1, 1, 1, 1, 1,
-0.2927341, -0.6721466, -1.866472, 1, 1, 1, 1, 1,
-0.2919381, 0.7763562, -1.169623, 1, 1, 1, 1, 1,
-0.2913745, 0.08158536, -0.5847899, 1, 1, 1, 1, 1,
-0.2882755, 0.2739508, -0.9418336, 1, 1, 1, 1, 1,
-0.2849464, 0.1942707, -0.9810335, 1, 1, 1, 1, 1,
-0.2836368, 0.2750973, -1.64435, 1, 1, 1, 1, 1,
-0.2831089, 0.1377316, -1.514669, 0, 0, 1, 1, 1,
-0.2812574, 0.5366929, -0.845703, 1, 0, 0, 1, 1,
-0.278321, 0.06097976, -2.046759, 1, 0, 0, 1, 1,
-0.2775609, 0.2401609, -2.164976, 1, 0, 0, 1, 1,
-0.2771724, -0.06016132, -1.492985, 1, 0, 0, 1, 1,
-0.2745847, -0.7091553, -2.4635, 1, 0, 0, 1, 1,
-0.2700002, 0.9113181, -1.099478, 0, 0, 0, 1, 1,
-0.2672468, 0.1906254, -1.164257, 0, 0, 0, 1, 1,
-0.2662936, 1.026222, 0.4750499, 0, 0, 0, 1, 1,
-0.2581193, 1.676895, -0.1365472, 0, 0, 0, 1, 1,
-0.2517199, -0.1719719, -2.006043, 0, 0, 0, 1, 1,
-0.2479353, 1.516588, -1.968301, 0, 0, 0, 1, 1,
-0.2477667, -1.898349, -2.832783, 0, 0, 0, 1, 1,
-0.2469151, -1.135232, -1.150514, 1, 1, 1, 1, 1,
-0.2452078, -0.4356104, -0.8892847, 1, 1, 1, 1, 1,
-0.2409869, -1.414193, -5.15602, 1, 1, 1, 1, 1,
-0.2390848, 0.2013888, -1.323732, 1, 1, 1, 1, 1,
-0.2378485, -0.7042567, -2.410094, 1, 1, 1, 1, 1,
-0.2376456, -1.183554, -2.094502, 1, 1, 1, 1, 1,
-0.236692, -1.00281, -2.839845, 1, 1, 1, 1, 1,
-0.2357971, 0.5078231, -1.852608, 1, 1, 1, 1, 1,
-0.2303283, 0.137005, -1.443836, 1, 1, 1, 1, 1,
-0.2240695, 0.08077721, -1.668231, 1, 1, 1, 1, 1,
-0.2231063, 0.109875, -2.7306, 1, 1, 1, 1, 1,
-0.2204836, -1.883979, -3.2044, 1, 1, 1, 1, 1,
-0.2195117, -0.3992203, -4.488283, 1, 1, 1, 1, 1,
-0.2189258, 1.100131, 2.483571, 1, 1, 1, 1, 1,
-0.2163393, 0.0275118, -2.745257, 1, 1, 1, 1, 1,
-0.2158457, 0.08336467, -1.356079, 0, 0, 1, 1, 1,
-0.2130088, -0.6819661, -0.3684475, 1, 0, 0, 1, 1,
-0.2102626, 0.2725769, -0.6200078, 1, 0, 0, 1, 1,
-0.2045946, 0.8442999, -0.5185606, 1, 0, 0, 1, 1,
-0.1976061, 0.5653346, -0.1964547, 1, 0, 0, 1, 1,
-0.1938095, 0.1620696, -1.370103, 1, 0, 0, 1, 1,
-0.1860699, 0.4443448, 0.9598826, 0, 0, 0, 1, 1,
-0.1860369, -1.546774, -5.310563, 0, 0, 0, 1, 1,
-0.1845789, -0.3580561, -2.509294, 0, 0, 0, 1, 1,
-0.1834012, 2.223163, 0.8274255, 0, 0, 0, 1, 1,
-0.1739376, 1.053311, 0.9434173, 0, 0, 0, 1, 1,
-0.1715118, -1.44177, -3.474281, 0, 0, 0, 1, 1,
-0.1712641, -0.8940602, -3.173579, 0, 0, 0, 1, 1,
-0.168127, 0.7514054, -0.7442558, 1, 1, 1, 1, 1,
-0.1677614, 0.6735813, -0.597337, 1, 1, 1, 1, 1,
-0.1664234, 0.3927051, 0.07837512, 1, 1, 1, 1, 1,
-0.1618484, -0.5271662, -2.900412, 1, 1, 1, 1, 1,
-0.1607112, 0.8688335, -0.5496824, 1, 1, 1, 1, 1,
-0.1599957, -0.05221321, -1.947963, 1, 1, 1, 1, 1,
-0.1594177, 1.221269, 0.6544613, 1, 1, 1, 1, 1,
-0.1580542, 0.9017941, -0.06455852, 1, 1, 1, 1, 1,
-0.150307, 0.3487307, 0.1234501, 1, 1, 1, 1, 1,
-0.1366643, 0.8844311, -0.3387804, 1, 1, 1, 1, 1,
-0.128837, 1.025695, 0.7078927, 1, 1, 1, 1, 1,
-0.1266273, 1.718078, -0.4724325, 1, 1, 1, 1, 1,
-0.1237857, -1.683893, -3.363781, 1, 1, 1, 1, 1,
-0.1236019, -0.3339694, -3.066206, 1, 1, 1, 1, 1,
-0.1226253, 0.6238078, 0.6201696, 1, 1, 1, 1, 1,
-0.12224, -1.573774, -3.24899, 0, 0, 1, 1, 1,
-0.121641, 1.371369, -1.024994, 1, 0, 0, 1, 1,
-0.1215218, 0.6597495, -1.076769, 1, 0, 0, 1, 1,
-0.1073436, -0.8464353, -3.729066, 1, 0, 0, 1, 1,
-0.1060735, 1.685776, 1.955786, 1, 0, 0, 1, 1,
-0.1020927, -0.05181301, -2.811915, 1, 0, 0, 1, 1,
-0.1019732, -1.18331, -0.9229342, 0, 0, 0, 1, 1,
-0.1017618, 0.547399, -1.276479, 0, 0, 0, 1, 1,
-0.09772996, -0.7377713, -3.919466, 0, 0, 0, 1, 1,
-0.0971342, -0.2901419, -2.701423, 0, 0, 0, 1, 1,
-0.09584214, -0.34275, -3.104688, 0, 0, 0, 1, 1,
-0.09551353, 2.273819, -0.1856505, 0, 0, 0, 1, 1,
-0.09411208, -1.473964, -2.325243, 0, 0, 0, 1, 1,
-0.09250438, 1.129589, -1.733156, 1, 1, 1, 1, 1,
-0.09028031, 0.6877331, 0.7587203, 1, 1, 1, 1, 1,
-0.08983323, -0.7035038, -4.429753, 1, 1, 1, 1, 1,
-0.08639751, -2.220483, -1.990795, 1, 1, 1, 1, 1,
-0.08225203, 0.9553336, 0.6339272, 1, 1, 1, 1, 1,
-0.07794996, -2.132723, -2.890748, 1, 1, 1, 1, 1,
-0.0778411, 0.9372635, -0.7952366, 1, 1, 1, 1, 1,
-0.07653758, -1.080554, -3.380418, 1, 1, 1, 1, 1,
-0.07423428, 0.3164574, -0.1710515, 1, 1, 1, 1, 1,
-0.07002311, -1.399105, -3.049681, 1, 1, 1, 1, 1,
-0.06531949, 0.6098751, 0.04516695, 1, 1, 1, 1, 1,
-0.06521834, -0.1461638, -3.132952, 1, 1, 1, 1, 1,
-0.05310383, -0.9176568, -2.114815, 1, 1, 1, 1, 1,
-0.04841686, -0.6031116, -2.442641, 1, 1, 1, 1, 1,
-0.04812758, -0.4367701, -3.373725, 1, 1, 1, 1, 1,
-0.04507347, -0.2287331, -1.644511, 0, 0, 1, 1, 1,
-0.04245984, -0.3155252, -0.367409, 1, 0, 0, 1, 1,
-0.03933639, -1.087754, -5.287442, 1, 0, 0, 1, 1,
-0.03898517, -1.339394, -3.125993, 1, 0, 0, 1, 1,
-0.03819662, -0.3371286, -3.209517, 1, 0, 0, 1, 1,
-0.03696624, -1.610791, -2.843565, 1, 0, 0, 1, 1,
-0.03485315, -1.897144, -1.45588, 0, 0, 0, 1, 1,
-0.03001642, 0.9243423, 0.6761608, 0, 0, 0, 1, 1,
-0.02569857, -2.150246, -3.401322, 0, 0, 0, 1, 1,
-0.02530506, 0.4746257, -1.132118, 0, 0, 0, 1, 1,
-0.02512516, -0.668689, -4.059479, 0, 0, 0, 1, 1,
-0.0221604, 0.5588315, -0.6474723, 0, 0, 0, 1, 1,
-0.02025058, -0.6174437, -2.120708, 0, 0, 0, 1, 1,
-0.01480478, 0.116465, -1.771055, 1, 1, 1, 1, 1,
-0.0139704, 0.3847444, 0.6522259, 1, 1, 1, 1, 1,
-0.01147899, -0.6739591, -1.298791, 1, 1, 1, 1, 1,
-0.006002319, -0.439227, -2.852381, 1, 1, 1, 1, 1,
-0.005705649, -0.7989601, -2.956254, 1, 1, 1, 1, 1,
-0.00503207, -0.9023858, -2.896796, 1, 1, 1, 1, 1,
0.0002783123, 1.351734, -0.4249222, 1, 1, 1, 1, 1,
0.002136142, -0.4782167, 2.5762, 1, 1, 1, 1, 1,
0.003051442, -2.249424, 2.067327, 1, 1, 1, 1, 1,
0.003789142, -0.2514564, 2.528439, 1, 1, 1, 1, 1,
0.006529115, 0.539853, 0.5292805, 1, 1, 1, 1, 1,
0.01066113, 0.664728, 0.2712897, 1, 1, 1, 1, 1,
0.01168614, -0.4675845, 3.349118, 1, 1, 1, 1, 1,
0.01181109, 1.627434, -0.4034694, 1, 1, 1, 1, 1,
0.01382331, 1.247466, 1.809338, 1, 1, 1, 1, 1,
0.03004044, -0.7060724, 2.625769, 0, 0, 1, 1, 1,
0.03073899, -0.8100165, 1.965381, 1, 0, 0, 1, 1,
0.04084041, -0.4118443, 4.145534, 1, 0, 0, 1, 1,
0.04094104, 0.3405949, -0.154344, 1, 0, 0, 1, 1,
0.04160498, 0.9892384, -0.0206599, 1, 0, 0, 1, 1,
0.04418999, 1.367987, 0.7776229, 1, 0, 0, 1, 1,
0.04952848, -0.3888132, 2.980558, 0, 0, 0, 1, 1,
0.05163708, 0.2684193, 2.357996, 0, 0, 0, 1, 1,
0.05530801, -0.6740347, 4.217518, 0, 0, 0, 1, 1,
0.05572718, 1.493589, 1.496796, 0, 0, 0, 1, 1,
0.0585906, 0.5490482, 0.2144765, 0, 0, 0, 1, 1,
0.06142789, 1.552028, 0.5486121, 0, 0, 0, 1, 1,
0.06537713, -0.9278709, 2.551648, 0, 0, 0, 1, 1,
0.06865396, 0.6007428, 0.2776335, 1, 1, 1, 1, 1,
0.07394887, 0.5847053, -0.2663118, 1, 1, 1, 1, 1,
0.07516269, -0.1517896, 0.2851108, 1, 1, 1, 1, 1,
0.0827451, 0.8813109, -1.029728, 1, 1, 1, 1, 1,
0.08490828, -0.711554, 3.14406, 1, 1, 1, 1, 1,
0.08554964, -2.39148, 3.177846, 1, 1, 1, 1, 1,
0.087668, -0.4813962, 4.3512, 1, 1, 1, 1, 1,
0.08785191, -0.7799288, 0.9390396, 1, 1, 1, 1, 1,
0.08795448, 0.9138637, -0.4289537, 1, 1, 1, 1, 1,
0.08861386, 0.6064686, -0.01296936, 1, 1, 1, 1, 1,
0.08872373, 2.210373, -1.149872, 1, 1, 1, 1, 1,
0.08892185, 0.3051956, 1.622196, 1, 1, 1, 1, 1,
0.09002874, 0.6730407, -0.8787566, 1, 1, 1, 1, 1,
0.09258927, -0.0753966, 2.391704, 1, 1, 1, 1, 1,
0.09461556, 0.7295927, 1.264601, 1, 1, 1, 1, 1,
0.09748008, 2.033064, -1.026405, 0, 0, 1, 1, 1,
0.09963614, 1.25787, -0.3912363, 1, 0, 0, 1, 1,
0.1039225, 1.185236, -2.325479, 1, 0, 0, 1, 1,
0.1055586, 0.01653354, 0.9727874, 1, 0, 0, 1, 1,
0.1062647, 0.6249482, -0.391279, 1, 0, 0, 1, 1,
0.1083343, 0.9501081, -0.7365391, 1, 0, 0, 1, 1,
0.1133344, -0.8333357, 2.078464, 0, 0, 0, 1, 1,
0.1181639, 0.9411723, 0.4140229, 0, 0, 0, 1, 1,
0.1191305, -1.975537, 3.27039, 0, 0, 0, 1, 1,
0.1192481, 0.1939037, -0.3698816, 0, 0, 0, 1, 1,
0.1243595, 1.157296, 0.03347237, 0, 0, 0, 1, 1,
0.1255156, 1.547155, 0.3036233, 0, 0, 0, 1, 1,
0.1312792, 0.2465358, 1.436549, 0, 0, 0, 1, 1,
0.1347166, 1.914983, 0.3824944, 1, 1, 1, 1, 1,
0.1434366, -0.1012255, 3.636256, 1, 1, 1, 1, 1,
0.1483128, -0.05349173, 0.2321841, 1, 1, 1, 1, 1,
0.1521411, -0.8066419, 2.103211, 1, 1, 1, 1, 1,
0.1541038, -0.3261394, 1.680496, 1, 1, 1, 1, 1,
0.1554563, -0.03319854, 1.892734, 1, 1, 1, 1, 1,
0.1623556, -0.539305, 3.647414, 1, 1, 1, 1, 1,
0.1624232, 0.623575, 2.449788, 1, 1, 1, 1, 1,
0.1631913, 3.472754, -0.7477849, 1, 1, 1, 1, 1,
0.1650967, -0.4165488, 3.227119, 1, 1, 1, 1, 1,
0.1664235, 0.08602244, 1.130185, 1, 1, 1, 1, 1,
0.1684195, 0.07775195, 0.03703922, 1, 1, 1, 1, 1,
0.1687244, 1.897506, 0.02898061, 1, 1, 1, 1, 1,
0.1694856, -0.1858658, 1.899534, 1, 1, 1, 1, 1,
0.1701846, -0.3243824, 3.715629, 1, 1, 1, 1, 1,
0.172186, 0.004042918, 0.782481, 0, 0, 1, 1, 1,
0.1768207, 1.06478, -1.363502, 1, 0, 0, 1, 1,
0.1768879, 1.461024, -1.242213, 1, 0, 0, 1, 1,
0.1782429, 0.4345962, 0.2614207, 1, 0, 0, 1, 1,
0.1790095, 0.3348169, 1.864761, 1, 0, 0, 1, 1,
0.182167, -0.5086483, 4.407353, 1, 0, 0, 1, 1,
0.1856142, -0.8445678, 0.8496608, 0, 0, 0, 1, 1,
0.1905514, 2.152169, 1.38472, 0, 0, 0, 1, 1,
0.1940328, 1.421412, 0.01918746, 0, 0, 0, 1, 1,
0.1954985, 1.047352, 0.8069662, 0, 0, 0, 1, 1,
0.1994572, -1.177021, 1.004462, 0, 0, 0, 1, 1,
0.2011358, -0.4037969, 2.892085, 0, 0, 0, 1, 1,
0.2023585, -0.5557759, 4.44249, 0, 0, 0, 1, 1,
0.202369, -0.8029249, 3.635431, 1, 1, 1, 1, 1,
0.2030141, 0.09973852, 3.067029, 1, 1, 1, 1, 1,
0.2046755, -0.7879886, 1.308281, 1, 1, 1, 1, 1,
0.2071175, 0.5354939, 0.2790372, 1, 1, 1, 1, 1,
0.208691, -0.9078025, 3.273252, 1, 1, 1, 1, 1,
0.2112934, -1.161496, 2.506823, 1, 1, 1, 1, 1,
0.2140673, -0.2768636, 1.74771, 1, 1, 1, 1, 1,
0.215623, -0.3091879, 2.840345, 1, 1, 1, 1, 1,
0.2198128, -0.864013, 2.857262, 1, 1, 1, 1, 1,
0.2207449, 0.8832992, 1.30281, 1, 1, 1, 1, 1,
0.2216949, -0.22808, 0.4182056, 1, 1, 1, 1, 1,
0.2223016, 0.7564831, -0.1425749, 1, 1, 1, 1, 1,
0.2247897, -0.8855276, 1.681832, 1, 1, 1, 1, 1,
0.2279196, -0.2046299, 2.918354, 1, 1, 1, 1, 1,
0.2328597, 0.0104551, 2.16782, 1, 1, 1, 1, 1,
0.2328782, 0.4054665, 0.9173169, 0, 0, 1, 1, 1,
0.2355016, 0.4581543, -0.2208656, 1, 0, 0, 1, 1,
0.2416404, -0.2772786, 2.751028, 1, 0, 0, 1, 1,
0.2457225, -0.1991582, 2.847968, 1, 0, 0, 1, 1,
0.2496835, -0.338007, 2.381203, 1, 0, 0, 1, 1,
0.2514975, -0.5572658, 4.131672, 1, 0, 0, 1, 1,
0.2541245, 0.08545501, 2.585808, 0, 0, 0, 1, 1,
0.2573743, -0.3898185, 1.017201, 0, 0, 0, 1, 1,
0.2628905, -0.4013306, 2.364089, 0, 0, 0, 1, 1,
0.2660895, -0.3920229, 2.184038, 0, 0, 0, 1, 1,
0.2670241, 0.04006718, 1.200158, 0, 0, 0, 1, 1,
0.2683513, -1.268818, 2.944727, 0, 0, 0, 1, 1,
0.2690507, -1.099001, 1.884331, 0, 0, 0, 1, 1,
0.2722758, -0.3983972, 2.77848, 1, 1, 1, 1, 1,
0.2730281, 0.3084954, 0.4169341, 1, 1, 1, 1, 1,
0.2775652, -1.473585, 2.801791, 1, 1, 1, 1, 1,
0.2777893, 0.05576059, -1.186212, 1, 1, 1, 1, 1,
0.282127, -1.618374, 3.185126, 1, 1, 1, 1, 1,
0.2873238, 1.550764, 0.1929967, 1, 1, 1, 1, 1,
0.2873406, 0.03330711, 0.2594463, 1, 1, 1, 1, 1,
0.2883088, -1.897632, 3.468282, 1, 1, 1, 1, 1,
0.2898189, -1.176339, 3.224854, 1, 1, 1, 1, 1,
0.2900847, 0.8252167, 1.113679, 1, 1, 1, 1, 1,
0.2904043, -0.3868319, 1.074959, 1, 1, 1, 1, 1,
0.2910561, 0.1693758, 2.489159, 1, 1, 1, 1, 1,
0.2944762, 0.4589348, 1.053312, 1, 1, 1, 1, 1,
0.2963917, 0.3203921, 0.1338042, 1, 1, 1, 1, 1,
0.2970223, 0.9973962, -0.3615671, 1, 1, 1, 1, 1,
0.2991858, 0.5022027, -0.6754955, 0, 0, 1, 1, 1,
0.3075107, -1.182609, 4.362618, 1, 0, 0, 1, 1,
0.3082218, 1.854201, 1.941494, 1, 0, 0, 1, 1,
0.3114694, 1.03549, 1.715296, 1, 0, 0, 1, 1,
0.3159814, 0.5139066, 1.885232, 1, 0, 0, 1, 1,
0.3168691, 0.2380894, 1.761866, 1, 0, 0, 1, 1,
0.3221472, -0.7377958, 3.895305, 0, 0, 0, 1, 1,
0.3265589, 1.268237, 0.8631399, 0, 0, 0, 1, 1,
0.328301, 1.465587, -1.333566, 0, 0, 0, 1, 1,
0.3302216, -1.337122, 2.189412, 0, 0, 0, 1, 1,
0.3310362, 2.333678, 0.9729375, 0, 0, 0, 1, 1,
0.3343947, 0.02218942, 1.150365, 0, 0, 0, 1, 1,
0.3366534, 1.499484, 0.6531107, 0, 0, 0, 1, 1,
0.3375483, 0.2549764, -0.262796, 1, 1, 1, 1, 1,
0.3388814, -0.4588065, 2.164929, 1, 1, 1, 1, 1,
0.3405173, -0.1453623, 3.027833, 1, 1, 1, 1, 1,
0.3405955, 1.190775, -0.2779958, 1, 1, 1, 1, 1,
0.3421474, 0.6709685, 0.470328, 1, 1, 1, 1, 1,
0.3442223, -0.7667369, 2.59558, 1, 1, 1, 1, 1,
0.3445214, 1.164732, 2.58018, 1, 1, 1, 1, 1,
0.3461599, -2.205387, 1.006689, 1, 1, 1, 1, 1,
0.3489532, -0.1768686, 1.875285, 1, 1, 1, 1, 1,
0.3517919, 0.1632651, 0.1076484, 1, 1, 1, 1, 1,
0.3539758, 1.451624, 1.136551, 1, 1, 1, 1, 1,
0.3552938, 0.2975639, -0.5274599, 1, 1, 1, 1, 1,
0.357005, -0.9130942, 3.751668, 1, 1, 1, 1, 1,
0.3582505, 1.358059, 0.2010315, 1, 1, 1, 1, 1,
0.3617195, 0.05738033, 1.857045, 1, 1, 1, 1, 1,
0.3623251, 0.593918, -0.4010786, 0, 0, 1, 1, 1,
0.3628644, 0.3737921, 0.3843205, 1, 0, 0, 1, 1,
0.3629519, -0.5911132, 2.540772, 1, 0, 0, 1, 1,
0.3633773, -1.627663, 3.749332, 1, 0, 0, 1, 1,
0.3639403, 0.01595861, 1.107961, 1, 0, 0, 1, 1,
0.3650447, -0.1469178, 1.096906, 1, 0, 0, 1, 1,
0.3676704, -0.9390859, 2.970397, 0, 0, 0, 1, 1,
0.3694792, -0.6486817, 4.31199, 0, 0, 0, 1, 1,
0.3722741, 0.1967294, 2.742418, 0, 0, 0, 1, 1,
0.3732175, -0.3925989, 2.888422, 0, 0, 0, 1, 1,
0.3777984, -0.805903, 2.2715, 0, 0, 0, 1, 1,
0.3819585, -1.932284, 1.304055, 0, 0, 0, 1, 1,
0.3825792, -0.1574773, 1.640789, 0, 0, 0, 1, 1,
0.3844659, 0.4337333, 1.460877, 1, 1, 1, 1, 1,
0.3846327, 0.7922551, 0.8327077, 1, 1, 1, 1, 1,
0.3856283, -0.7710456, 3.419103, 1, 1, 1, 1, 1,
0.3871354, 0.5143824, -0.495176, 1, 1, 1, 1, 1,
0.39161, -0.7055299, 2.255182, 1, 1, 1, 1, 1,
0.3957601, 1.62035, -0.2362122, 1, 1, 1, 1, 1,
0.3965567, -1.421897, 4.734162, 1, 1, 1, 1, 1,
0.3987229, -0.6781635, 2.867542, 1, 1, 1, 1, 1,
0.4011413, 0.02841639, 0.6143469, 1, 1, 1, 1, 1,
0.4066018, 0.01880396, 1.712647, 1, 1, 1, 1, 1,
0.4107317, 0.3795393, 2.540829, 1, 1, 1, 1, 1,
0.4131098, -1.473765, 2.107974, 1, 1, 1, 1, 1,
0.4133484, -0.3848965, 2.282596, 1, 1, 1, 1, 1,
0.4197952, -0.5240119, 2.627365, 1, 1, 1, 1, 1,
0.4225976, 0.1080027, 2.822075, 1, 1, 1, 1, 1,
0.4250386, -0.005856375, 1.37072, 0, 0, 1, 1, 1,
0.4267378, 0.09668622, 3.908131, 1, 0, 0, 1, 1,
0.4267724, -0.2760601, 2.378, 1, 0, 0, 1, 1,
0.4270559, 0.8270129, -0.02592401, 1, 0, 0, 1, 1,
0.427842, 0.234023, 1.170016, 1, 0, 0, 1, 1,
0.4426282, 0.4616669, 0.04814954, 1, 0, 0, 1, 1,
0.4444518, -2.935396, 3.228972, 0, 0, 0, 1, 1,
0.4453782, 1.689047, -0.182777, 0, 0, 0, 1, 1,
0.4470597, -0.0472437, 2.702042, 0, 0, 0, 1, 1,
0.4485164, 1.263776, 0.2718638, 0, 0, 0, 1, 1,
0.4545539, 0.3560924, 2.129319, 0, 0, 0, 1, 1,
0.4571757, 0.01725452, 0.5542317, 0, 0, 0, 1, 1,
0.466632, -0.5844456, 2.254104, 0, 0, 0, 1, 1,
0.4681267, 1.517267, 0.2055134, 1, 1, 1, 1, 1,
0.4766952, 1.419138, 1.062978, 1, 1, 1, 1, 1,
0.4768538, 0.9139941, 0.5987002, 1, 1, 1, 1, 1,
0.4771198, 1.140467, -0.7647887, 1, 1, 1, 1, 1,
0.4904025, 0.8122302, -1.758808, 1, 1, 1, 1, 1,
0.4941004, 0.4442229, 2.722461, 1, 1, 1, 1, 1,
0.494447, -1.606176, 3.221879, 1, 1, 1, 1, 1,
0.494672, -0.4355601, 1.716785, 1, 1, 1, 1, 1,
0.500414, 0.5121744, 1.191025, 1, 1, 1, 1, 1,
0.5022805, -0.9877397, 1.505565, 1, 1, 1, 1, 1,
0.5045295, -0.856073, 1.190336, 1, 1, 1, 1, 1,
0.5135854, -0.3964553, 0.7080858, 1, 1, 1, 1, 1,
0.5155828, -0.3812616, 3.113353, 1, 1, 1, 1, 1,
0.5158906, 0.4581702, -0.473801, 1, 1, 1, 1, 1,
0.5166329, 0.04892474, 0.06517694, 1, 1, 1, 1, 1,
0.5167655, -1.148372, 2.074345, 0, 0, 1, 1, 1,
0.5207747, 0.4012518, 0.8471038, 1, 0, 0, 1, 1,
0.5247176, 0.7886648, 1.163696, 1, 0, 0, 1, 1,
0.5252994, -0.5225951, 0.2032286, 1, 0, 0, 1, 1,
0.5320424, 1.120887, -1.055876, 1, 0, 0, 1, 1,
0.5334523, 0.1501039, 0.5228748, 1, 0, 0, 1, 1,
0.5354127, 0.4372497, 0.6970397, 0, 0, 0, 1, 1,
0.5354699, -1.555563, 2.505772, 0, 0, 0, 1, 1,
0.5384299, 0.02419977, 3.192754, 0, 0, 0, 1, 1,
0.5467227, -0.1696589, 4.947151, 0, 0, 0, 1, 1,
0.547174, -1.602382, 4.560519, 0, 0, 0, 1, 1,
0.5531838, -0.8030903, 4.88193, 0, 0, 0, 1, 1,
0.5561308, -1.227709, 2.603222, 0, 0, 0, 1, 1,
0.5573248, -0.03953517, 2.334217, 1, 1, 1, 1, 1,
0.558218, 1.511352, -0.8510699, 1, 1, 1, 1, 1,
0.5616876, -0.5049669, 1.739122, 1, 1, 1, 1, 1,
0.5636264, -0.1625203, 1.242602, 1, 1, 1, 1, 1,
0.5670511, -0.5703325, 2.49362, 1, 1, 1, 1, 1,
0.5679669, 0.006421594, 2.78206, 1, 1, 1, 1, 1,
0.5707409, -0.2250855, 2.825354, 1, 1, 1, 1, 1,
0.5727772, 0.3518131, 1.709267, 1, 1, 1, 1, 1,
0.5755742, -0.8494788, 1.004848, 1, 1, 1, 1, 1,
0.5778177, 0.472805, 2.044718, 1, 1, 1, 1, 1,
0.5835935, -0.598994, 0.3672498, 1, 1, 1, 1, 1,
0.5869586, -0.9369716, 1.82036, 1, 1, 1, 1, 1,
0.5897895, -0.4654213, 2.367108, 1, 1, 1, 1, 1,
0.5933047, -0.03841286, 1.582292, 1, 1, 1, 1, 1,
0.5938236, 0.3777085, 2.199682, 1, 1, 1, 1, 1,
0.6020721, -2.46399, 3.342737, 0, 0, 1, 1, 1,
0.6052213, 0.9830456, -0.8318557, 1, 0, 0, 1, 1,
0.6109125, 1.102411, -0.5494255, 1, 0, 0, 1, 1,
0.6115971, -2.679339, 4.450648, 1, 0, 0, 1, 1,
0.61311, 1.487518, -1.449935, 1, 0, 0, 1, 1,
0.6131397, 0.7576448, 0.07565448, 1, 0, 0, 1, 1,
0.6193894, 1.011521, 0.9952865, 0, 0, 0, 1, 1,
0.6276588, 1.346113, 0.542563, 0, 0, 0, 1, 1,
0.6321616, -2.182054, 1.465896, 0, 0, 0, 1, 1,
0.6331793, 0.1640293, 1.587445, 0, 0, 0, 1, 1,
0.6334645, 1.782373, -1.121623, 0, 0, 0, 1, 1,
0.6354307, -0.3245875, 0.6021382, 0, 0, 0, 1, 1,
0.6373133, -1.859777, 1.887018, 0, 0, 0, 1, 1,
0.6387473, 0.4583712, 1.651119, 1, 1, 1, 1, 1,
0.639827, -1.130697, 0.8385066, 1, 1, 1, 1, 1,
0.6405851, 0.9580702, -1.057359, 1, 1, 1, 1, 1,
0.6408763, 1.890142, 0.1238639, 1, 1, 1, 1, 1,
0.6461421, 0.6192439, 0.7056977, 1, 1, 1, 1, 1,
0.6470319, 1.219309, 0.5114304, 1, 1, 1, 1, 1,
0.6476882, -0.3488952, 3.449673, 1, 1, 1, 1, 1,
0.6526132, -0.1418208, 3.022374, 1, 1, 1, 1, 1,
0.6649738, -1.256376, 2.774667, 1, 1, 1, 1, 1,
0.6649939, -1.649945, 3.924156, 1, 1, 1, 1, 1,
0.6670388, -0.904891, 3.391309, 1, 1, 1, 1, 1,
0.6673222, -0.8103706, 3.675404, 1, 1, 1, 1, 1,
0.6763141, -0.5779691, 0.5543051, 1, 1, 1, 1, 1,
0.677956, 0.5470186, 1.622269, 1, 1, 1, 1, 1,
0.6856525, 0.8695487, 2.263597, 1, 1, 1, 1, 1,
0.6881499, -0.9918384, 2.933829, 0, 0, 1, 1, 1,
0.6973038, -1.165239, 1.119279, 1, 0, 0, 1, 1,
0.7000713, 1.397065, 2.413488, 1, 0, 0, 1, 1,
0.7069067, 1.231605, 0.7776688, 1, 0, 0, 1, 1,
0.7097331, 0.9512872, 0.4503734, 1, 0, 0, 1, 1,
0.7215045, 0.9673176, 0.4094666, 1, 0, 0, 1, 1,
0.7223641, -1.072109, 1.262045, 0, 0, 0, 1, 1,
0.7234402, -1.041901, 3.673456, 0, 0, 0, 1, 1,
0.7277341, -0.2986595, 3.039986, 0, 0, 0, 1, 1,
0.7283238, 0.2616925, 1.342139, 0, 0, 0, 1, 1,
0.7287915, -0.1368599, 1.460448, 0, 0, 0, 1, 1,
0.7305919, -0.3304646, 2.074838, 0, 0, 0, 1, 1,
0.7343197, 0.1734294, 1.494559, 0, 0, 0, 1, 1,
0.7418267, 1.712051, 1.459409, 1, 1, 1, 1, 1,
0.7449929, -0.7650478, 3.229534, 1, 1, 1, 1, 1,
0.7454466, -0.7631386, 0.963912, 1, 1, 1, 1, 1,
0.7486472, 0.7980023, -0.6686174, 1, 1, 1, 1, 1,
0.749678, 1.07218, 0.8435102, 1, 1, 1, 1, 1,
0.7511556, 0.7614958, 1.489128, 1, 1, 1, 1, 1,
0.7526484, -0.2771104, 1.233502, 1, 1, 1, 1, 1,
0.7548247, -0.1039712, 2.899173, 1, 1, 1, 1, 1,
0.7593274, 1.399131, -1.264957, 1, 1, 1, 1, 1,
0.7655061, -0.9079745, 2.359231, 1, 1, 1, 1, 1,
0.7722934, 1.370509, 0.172951, 1, 1, 1, 1, 1,
0.7812425, 1.264895, 0.0190244, 1, 1, 1, 1, 1,
0.7845441, 0.09904191, 1.275373, 1, 1, 1, 1, 1,
0.7850621, -0.9705527, 1.691445, 1, 1, 1, 1, 1,
0.7889823, -1.177309, 2.568817, 1, 1, 1, 1, 1,
0.7929428, -1.299135, 3.783867, 0, 0, 1, 1, 1,
0.7969928, -0.4109529, 1.648251, 1, 0, 0, 1, 1,
0.8027179, 0.2605878, 1.689759, 1, 0, 0, 1, 1,
0.804368, -0.1336119, 1.702682, 1, 0, 0, 1, 1,
0.8050277, -1.413296, 2.419113, 1, 0, 0, 1, 1,
0.8053236, 0.7176533, 2.206537, 1, 0, 0, 1, 1,
0.8069292, -0.8499439, 2.500606, 0, 0, 0, 1, 1,
0.8104331, -1.155609, 4.147827, 0, 0, 0, 1, 1,
0.8105889, 0.1330306, 2.30597, 0, 0, 0, 1, 1,
0.8163317, 1.771568, -1.087133, 0, 0, 0, 1, 1,
0.8195074, -0.762996, 3.799893, 0, 0, 0, 1, 1,
0.8218645, -0.227399, 2.650511, 0, 0, 0, 1, 1,
0.8301228, -2.15483, 2.852553, 0, 0, 0, 1, 1,
0.8332055, 0.7905633, 2.403807, 1, 1, 1, 1, 1,
0.8337406, 0.4467024, 1.493779, 1, 1, 1, 1, 1,
0.8339272, -0.5659611, 2.315316, 1, 1, 1, 1, 1,
0.8342345, -0.6547583, 3.362546, 1, 1, 1, 1, 1,
0.8354352, -2.294251, 3.372843, 1, 1, 1, 1, 1,
0.8367416, 0.4983617, -0.6049928, 1, 1, 1, 1, 1,
0.8416482, -0.6024567, 2.967533, 1, 1, 1, 1, 1,
0.8446416, 0.005874338, 2.978831, 1, 1, 1, 1, 1,
0.8511231, -0.4200757, 2.845283, 1, 1, 1, 1, 1,
0.8572628, 0.2014558, 1.297902, 1, 1, 1, 1, 1,
0.8591344, -0.3689815, 1.264591, 1, 1, 1, 1, 1,
0.8652503, 3.09447, -0.3604954, 1, 1, 1, 1, 1,
0.86735, 0.9198635, 2.674284, 1, 1, 1, 1, 1,
0.8718597, 0.9012409, 1.274443, 1, 1, 1, 1, 1,
0.8797757, -0.4608176, 2.851457, 1, 1, 1, 1, 1,
0.8843533, -0.9113072, 2.187438, 0, 0, 1, 1, 1,
0.8853282, -0.7813318, 3.864634, 1, 0, 0, 1, 1,
0.8930849, -1.744157, 3.574975, 1, 0, 0, 1, 1,
0.8947444, -0.6380482, 2.392543, 1, 0, 0, 1, 1,
0.9003724, 0.4034083, 1.343626, 1, 0, 0, 1, 1,
0.9017299, -0.4297057, 3.37745, 1, 0, 0, 1, 1,
0.9065323, -0.07013986, 0.6052259, 0, 0, 0, 1, 1,
0.9092138, 0.7622331, 1.065324, 0, 0, 0, 1, 1,
0.9100916, -0.4005258, 2.110461, 0, 0, 0, 1, 1,
0.9123128, 0.8980635, -0.886865, 0, 0, 0, 1, 1,
0.9128576, 0.1068621, -0.2962612, 0, 0, 0, 1, 1,
0.919558, 0.08883169, 1.778246, 0, 0, 0, 1, 1,
0.9217902, 1.163551, -1.406623, 0, 0, 0, 1, 1,
0.9281003, -1.588671, 2.89678, 1, 1, 1, 1, 1,
0.9350355, 0.2247582, 1.317854, 1, 1, 1, 1, 1,
0.9360817, -1.886563, 3.451313, 1, 1, 1, 1, 1,
0.9364265, -0.2110571, 2.739501, 1, 1, 1, 1, 1,
0.9375357, -0.5892693, 2.015084, 1, 1, 1, 1, 1,
0.9412788, 0.1180986, 2.515912, 1, 1, 1, 1, 1,
0.9429557, 2.517601, 0.9579988, 1, 1, 1, 1, 1,
0.9478634, -0.8274478, 1.236303, 1, 1, 1, 1, 1,
0.9526609, -0.1594604, 1.692258, 1, 1, 1, 1, 1,
0.9538062, -0.5635982, 2.256342, 1, 1, 1, 1, 1,
0.9560181, -0.7568493, 2.703876, 1, 1, 1, 1, 1,
0.9563742, 1.427441, 0.2078585, 1, 1, 1, 1, 1,
0.9632861, 1.173878, -0.4160451, 1, 1, 1, 1, 1,
0.9661112, 0.5017823, 0.4654144, 1, 1, 1, 1, 1,
0.9706181, -1.263234, 1.826465, 1, 1, 1, 1, 1,
0.9710543, -0.4313543, 2.632682, 0, 0, 1, 1, 1,
0.97651, -1.361768, 3.378035, 1, 0, 0, 1, 1,
0.978965, -1.440346, 3.360831, 1, 0, 0, 1, 1,
0.9848367, 0.002345216, 2.71242, 1, 0, 0, 1, 1,
0.9865459, -2.199371, 2.188957, 1, 0, 0, 1, 1,
0.9871204, 0.5527055, 2.44266, 1, 0, 0, 1, 1,
0.9900098, 0.2910309, -0.06640599, 0, 0, 0, 1, 1,
0.9907521, 1.195371, 1.496423, 0, 0, 0, 1, 1,
0.9954172, -0.9725797, -0.01111998, 0, 0, 0, 1, 1,
0.9980321, -0.8822425, 1.305545, 0, 0, 0, 1, 1,
1.001509, -0.2992891, 1.202313, 0, 0, 0, 1, 1,
1.005688, 0.986243, 0.02774667, 0, 0, 0, 1, 1,
1.008273, 0.2206593, -0.8065857, 0, 0, 0, 1, 1,
1.011462, -1.745376, 1.906069, 1, 1, 1, 1, 1,
1.014391, 1.158084, -0.335714, 1, 1, 1, 1, 1,
1.015099, 2.314476, -0.5277375, 1, 1, 1, 1, 1,
1.019584, 0.8665129, -1.187827, 1, 1, 1, 1, 1,
1.021047, -0.1934437, -0.02954477, 1, 1, 1, 1, 1,
1.026575, 0.852378, 0.6782357, 1, 1, 1, 1, 1,
1.028347, 1.07318, 1.884284, 1, 1, 1, 1, 1,
1.030448, 1.724268, 0.4901863, 1, 1, 1, 1, 1,
1.04373, 1.181645, 0.5665872, 1, 1, 1, 1, 1,
1.058989, 1.015005, 2.686097, 1, 1, 1, 1, 1,
1.065394, 0.4837728, 0.3866491, 1, 1, 1, 1, 1,
1.069823, 1.234969, 1.399956, 1, 1, 1, 1, 1,
1.075899, -2.445781, 2.149254, 1, 1, 1, 1, 1,
1.075948, -0.994868, 3.576657, 1, 1, 1, 1, 1,
1.082261, 0.5867923, 0.5035457, 1, 1, 1, 1, 1,
1.086342, 0.007549076, 0.6611271, 0, 0, 1, 1, 1,
1.088053, -1.666569, 1.959466, 1, 0, 0, 1, 1,
1.088555, 1.849477, 0.4445943, 1, 0, 0, 1, 1,
1.097786, 0.4484967, 1.540447, 1, 0, 0, 1, 1,
1.103704, -1.033856, 2.140405, 1, 0, 0, 1, 1,
1.103966, -1.982468, 0.5621284, 1, 0, 0, 1, 1,
1.104609, -1.544268, 3.394424, 0, 0, 0, 1, 1,
1.111969, 0.8793651, 1.855263, 0, 0, 0, 1, 1,
1.114222, -0.8103222, 2.496489, 0, 0, 0, 1, 1,
1.120667, 0.07523403, 2.015358, 0, 0, 0, 1, 1,
1.140417, 0.6954296, -0.1578634, 0, 0, 0, 1, 1,
1.152617, 0.782846, 0.5644292, 0, 0, 0, 1, 1,
1.159714, -1.177622, 3.758688, 0, 0, 0, 1, 1,
1.16375, 1.089027, 0.7826964, 1, 1, 1, 1, 1,
1.167252, 1.892218, 1.011796, 1, 1, 1, 1, 1,
1.174168, -0.6799543, 1.514274, 1, 1, 1, 1, 1,
1.174765, 0.2175836, 1.807902, 1, 1, 1, 1, 1,
1.175892, 1.343554, -0.4306492, 1, 1, 1, 1, 1,
1.17954, 1.811864, -0.1158128, 1, 1, 1, 1, 1,
1.187034, -0.9640248, 2.062893, 1, 1, 1, 1, 1,
1.188359, -0.3501483, 4.558857, 1, 1, 1, 1, 1,
1.188456, -0.4801193, 0.1748281, 1, 1, 1, 1, 1,
1.198344, 0.7822362, 1.5683, 1, 1, 1, 1, 1,
1.20157, 0.3269894, 2.008246, 1, 1, 1, 1, 1,
1.20519, 0.9698644, -0.5617324, 1, 1, 1, 1, 1,
1.211421, -0.792433, 1.838715, 1, 1, 1, 1, 1,
1.213555, -0.2031405, 0.3837399, 1, 1, 1, 1, 1,
1.213914, 0.1801775, 1.381415, 1, 1, 1, 1, 1,
1.218673, -0.006534184, 2.315919, 0, 0, 1, 1, 1,
1.223961, 0.06266378, 0.9409261, 1, 0, 0, 1, 1,
1.232247, 1.261559, -0.5632985, 1, 0, 0, 1, 1,
1.240279, -0.5044529, 0.3538267, 1, 0, 0, 1, 1,
1.243182, 0.6660545, 0.204464, 1, 0, 0, 1, 1,
1.245442, 0.5031081, -0.1404126, 1, 0, 0, 1, 1,
1.247137, 0.08722712, 0.5238997, 0, 0, 0, 1, 1,
1.248136, -0.9321774, 2.284987, 0, 0, 0, 1, 1,
1.24826, 1.881597, 0.9894015, 0, 0, 0, 1, 1,
1.249649, -0.3012559, 0.34777, 0, 0, 0, 1, 1,
1.251306, -1.590824, 3.975786, 0, 0, 0, 1, 1,
1.256982, 0.359483, 2.27332, 0, 0, 0, 1, 1,
1.269912, -0.9664335, 1.804656, 0, 0, 0, 1, 1,
1.277259, -1.649401, 1.65292, 1, 1, 1, 1, 1,
1.280913, 0.2922215, 1.235777, 1, 1, 1, 1, 1,
1.280945, 0.5922806, 1.930756, 1, 1, 1, 1, 1,
1.29397, 0.04943097, 1.929081, 1, 1, 1, 1, 1,
1.300251, -1.050189, 2.633747, 1, 1, 1, 1, 1,
1.305127, 2.356037, 0.4348108, 1, 1, 1, 1, 1,
1.305988, 0.2992063, 0.4226663, 1, 1, 1, 1, 1,
1.326228, -0.5969574, 1.497231, 1, 1, 1, 1, 1,
1.338225, -1.951465, 1.92796, 1, 1, 1, 1, 1,
1.34657, 0.5620772, 0.2951736, 1, 1, 1, 1, 1,
1.351049, 0.6203323, 1.962493, 1, 1, 1, 1, 1,
1.355945, 0.1886125, 2.077809, 1, 1, 1, 1, 1,
1.367586, -1.662866, 4.424309, 1, 1, 1, 1, 1,
1.368409, 0.7612074, 0.6447285, 1, 1, 1, 1, 1,
1.369153, 1.580167, -0.9641628, 1, 1, 1, 1, 1,
1.37987, -1.987262, 2.948835, 0, 0, 1, 1, 1,
1.383874, -0.4098057, 1.827154, 1, 0, 0, 1, 1,
1.410023, 2.085264, 0.9872776, 1, 0, 0, 1, 1,
1.416857, -1.217729, 2.976086, 1, 0, 0, 1, 1,
1.416956, 0.9986653, 0.625548, 1, 0, 0, 1, 1,
1.427891, 0.4790488, 1.026724, 1, 0, 0, 1, 1,
1.430514, 0.5072304, 1.800726, 0, 0, 0, 1, 1,
1.433615, -0.2427016, 1.976822, 0, 0, 0, 1, 1,
1.434376, -1.027349, 2.612987, 0, 0, 0, 1, 1,
1.437458, -0.2691099, -0.6089156, 0, 0, 0, 1, 1,
1.446299, 0.6947312, -0.5726219, 0, 0, 0, 1, 1,
1.446462, 0.08360962, 3.643713, 0, 0, 0, 1, 1,
1.455041, -2.280423, 2.012651, 0, 0, 0, 1, 1,
1.459157, -0.9147342, 1.790898, 1, 1, 1, 1, 1,
1.461571, 0.9776462, 1.330948, 1, 1, 1, 1, 1,
1.472459, -0.4902324, 3.782071, 1, 1, 1, 1, 1,
1.486847, 2.593806, 2.32696, 1, 1, 1, 1, 1,
1.495414, -0.3237369, 1.885267, 1, 1, 1, 1, 1,
1.497353, -0.7116436, 1.374624, 1, 1, 1, 1, 1,
1.506982, 0.08436672, 3.168222, 1, 1, 1, 1, 1,
1.512177, 0.5694681, 0.902131, 1, 1, 1, 1, 1,
1.530759, 0.6358847, 1.772847, 1, 1, 1, 1, 1,
1.535315, 0.3818395, 0.8421695, 1, 1, 1, 1, 1,
1.538105, 1.054123, 2.276545, 1, 1, 1, 1, 1,
1.549218, -0.3318607, 1.126754, 1, 1, 1, 1, 1,
1.55132, -0.2351507, 1.274068, 1, 1, 1, 1, 1,
1.560702, 0.5279316, 1.723904, 1, 1, 1, 1, 1,
1.571233, -0.1258175, 2.149639, 1, 1, 1, 1, 1,
1.572161, -0.1348277, 0.8532327, 0, 0, 1, 1, 1,
1.597348, 0.3854048, 0.7680701, 1, 0, 0, 1, 1,
1.601504, -0.3844954, 1.89394, 1, 0, 0, 1, 1,
1.615296, -0.9902843, 2.105264, 1, 0, 0, 1, 1,
1.622149, 0.2523441, 1.203697, 1, 0, 0, 1, 1,
1.630902, 0.6406557, 1.788051, 1, 0, 0, 1, 1,
1.642542, 1.944803, -0.1671851, 0, 0, 0, 1, 1,
1.643743, 0.2924955, 2.461413, 0, 0, 0, 1, 1,
1.644518, -0.06719423, 2.677328, 0, 0, 0, 1, 1,
1.645735, 1.327449, 0.9298528, 0, 0, 0, 1, 1,
1.647636, 0.8881736, -0.7065458, 0, 0, 0, 1, 1,
1.670364, 0.5026647, 1.896586, 0, 0, 0, 1, 1,
1.677542, -0.7918943, 1.421381, 0, 0, 0, 1, 1,
1.713864, 0.1772072, 1.167789, 1, 1, 1, 1, 1,
1.735248, -1.129962, 2.775625, 1, 1, 1, 1, 1,
1.741753, 0.6140076, 1.479005, 1, 1, 1, 1, 1,
1.757318, -0.8962571, 4.369245, 1, 1, 1, 1, 1,
1.760291, -1.413777, 1.333457, 1, 1, 1, 1, 1,
1.782941, 0.3852762, 1.343971, 1, 1, 1, 1, 1,
1.817709, -2.010819, 1.839797, 1, 1, 1, 1, 1,
1.83035, 0.186714, 2.525842, 1, 1, 1, 1, 1,
1.841671, 1.083895, -0.486836, 1, 1, 1, 1, 1,
1.85127, -1.828056, 1.873255, 1, 1, 1, 1, 1,
1.903816, 1.29965, 2.748191, 1, 1, 1, 1, 1,
1.923415, 0.07253518, 0.304508, 1, 1, 1, 1, 1,
1.943737, -0.6976992, 1.903281, 1, 1, 1, 1, 1,
1.979965, 0.8229874, -1.03347, 1, 1, 1, 1, 1,
1.986364, -1.366701, 2.774168, 1, 1, 1, 1, 1,
2.012672, -0.1318518, 1.006914, 0, 0, 1, 1, 1,
2.041826, 1.557982, -0.1789808, 1, 0, 0, 1, 1,
2.058048, 1.072295, 2.652677, 1, 0, 0, 1, 1,
2.107523, -0.4325571, 3.198046, 1, 0, 0, 1, 1,
2.111036, 0.5370662, 1.604411, 1, 0, 0, 1, 1,
2.194634, 0.4447812, -0.4161506, 1, 0, 0, 1, 1,
2.197467, -0.00677477, 2.541127, 0, 0, 0, 1, 1,
2.248777, -1.965218, 1.290187, 0, 0, 0, 1, 1,
2.252169, 0.2549707, 1.811659, 0, 0, 0, 1, 1,
2.304328, 0.4724753, 0.7699761, 0, 0, 0, 1, 1,
2.427938, 1.744701, 2.116625, 0, 0, 0, 1, 1,
2.534534, 1.143741, 1.313093, 0, 0, 0, 1, 1,
2.548363, 0.5884269, 0.4783441, 0, 0, 0, 1, 1,
2.562736, 0.9108397, 0.1872404, 1, 1, 1, 1, 1,
2.564203, 0.1272065, 1.966282, 1, 1, 1, 1, 1,
2.578497, -1.102565, 1.907787, 1, 1, 1, 1, 1,
2.59994, 2.268625, 2.239057, 1, 1, 1, 1, 1,
2.707613, -0.1658079, 0.3644658, 1, 1, 1, 1, 1,
2.752755, 0.005782126, 1.353642, 1, 1, 1, 1, 1,
3.603082, 0.7607359, 0.9570624, 1, 1, 1, 1, 1
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
var radius = 9.513165;
var distance = 33.41459;
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
mvMatrix.translate( -0.1808081, -0.2686793, 0.181706 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41459);
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
