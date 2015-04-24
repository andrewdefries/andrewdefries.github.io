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
-3.396999, 0.3961959, -2.888442, 1, 0, 0, 1,
-2.846724, 0.4526344, -1.581963, 1, 0.007843138, 0, 1,
-2.708949, 0.7881367, -0.6025619, 1, 0.01176471, 0, 1,
-2.641793, 0.8372564, 0.2968042, 1, 0.01960784, 0, 1,
-2.564661, -1.1757, -0.9270438, 1, 0.02352941, 0, 1,
-2.501397, -0.4218189, -0.3837128, 1, 0.03137255, 0, 1,
-2.468847, -0.1768616, -1.968778, 1, 0.03529412, 0, 1,
-2.453541, 1.056593, -2.371502, 1, 0.04313726, 0, 1,
-2.439977, -0.6072573, -2.260542, 1, 0.04705882, 0, 1,
-2.344312, 1.02196, -2.425678, 1, 0.05490196, 0, 1,
-2.313586, -2.531114, -0.4532014, 1, 0.05882353, 0, 1,
-2.272696, 0.9554714, -0.8410826, 1, 0.06666667, 0, 1,
-2.262601, -0.5197299, -3.012613, 1, 0.07058824, 0, 1,
-2.228135, 0.348088, -2.068238, 1, 0.07843138, 0, 1,
-2.191491, -0.3395562, -4.268501, 1, 0.08235294, 0, 1,
-2.181042, -0.1057641, -2.422481, 1, 0.09019608, 0, 1,
-2.161904, -1.143168, -3.246913, 1, 0.09411765, 0, 1,
-2.158333, 0.6270592, 0.362343, 1, 0.1019608, 0, 1,
-2.155455, 0.4578772, -1.503288, 1, 0.1098039, 0, 1,
-2.097144, 0.7023542, -2.833718, 1, 0.1137255, 0, 1,
-2.090116, 1.90811, -1.360982, 1, 0.1215686, 0, 1,
-2.061271, 0.7234243, -1.431326, 1, 0.1254902, 0, 1,
-2.031339, 0.3649046, -0.3507793, 1, 0.1333333, 0, 1,
-2.024384, -0.147016, -1.819003, 1, 0.1372549, 0, 1,
-1.994296, -0.352376, -2.268631, 1, 0.145098, 0, 1,
-1.993691, 0.2275878, -1.591087, 1, 0.1490196, 0, 1,
-1.981896, -0.7500476, -1.356561, 1, 0.1568628, 0, 1,
-1.964898, 1.021, 0.700855, 1, 0.1607843, 0, 1,
-1.960353, 1.559282, 0.5305212, 1, 0.1686275, 0, 1,
-1.959847, -0.2238023, -1.632765, 1, 0.172549, 0, 1,
-1.917119, 0.5261709, -0.3899611, 1, 0.1803922, 0, 1,
-1.889994, 0.3867371, -1.745335, 1, 0.1843137, 0, 1,
-1.861111, 0.1467408, -2.481785, 1, 0.1921569, 0, 1,
-1.819462, -0.7910654, -1.468142, 1, 0.1960784, 0, 1,
-1.813753, 2.149188, 0.1128558, 1, 0.2039216, 0, 1,
-1.788097, 0.7046316, -2.147153, 1, 0.2117647, 0, 1,
-1.784267, 0.01403538, -3.44303, 1, 0.2156863, 0, 1,
-1.766471, -1.022178, -2.529805, 1, 0.2235294, 0, 1,
-1.715466, -1.056254, -3.277784, 1, 0.227451, 0, 1,
-1.707085, -1.869089, -2.301692, 1, 0.2352941, 0, 1,
-1.698027, -1.390281, -2.359162, 1, 0.2392157, 0, 1,
-1.695804, -1.042703, -3.09144, 1, 0.2470588, 0, 1,
-1.690584, 0.843963, 0.8569088, 1, 0.2509804, 0, 1,
-1.68568, -0.5491101, -1.376535, 1, 0.2588235, 0, 1,
-1.667058, 0.775192, -2.54785, 1, 0.2627451, 0, 1,
-1.665933, -2.783285, -4.323065, 1, 0.2705882, 0, 1,
-1.653271, 0.5715936, -2.148857, 1, 0.2745098, 0, 1,
-1.619951, 0.3090084, -2.494821, 1, 0.282353, 0, 1,
-1.607705, -0.162831, -1.499012, 1, 0.2862745, 0, 1,
-1.598272, 0.7392421, -1.52273, 1, 0.2941177, 0, 1,
-1.577684, 1.282691, 1.109967, 1, 0.3019608, 0, 1,
-1.577572, 1.147248, -0.9439104, 1, 0.3058824, 0, 1,
-1.550582, 0.08937382, -0.4413275, 1, 0.3137255, 0, 1,
-1.547475, 0.4045455, -1.758081, 1, 0.3176471, 0, 1,
-1.537174, -1.849293, -2.651458, 1, 0.3254902, 0, 1,
-1.530227, 0.6925027, -0.6706999, 1, 0.3294118, 0, 1,
-1.530227, -0.1502723, -1.042251, 1, 0.3372549, 0, 1,
-1.522001, 0.8353466, -1.83491, 1, 0.3411765, 0, 1,
-1.515594, 0.997068, 0.2485501, 1, 0.3490196, 0, 1,
-1.505737, -0.4990897, -1.319526, 1, 0.3529412, 0, 1,
-1.505713, -1.132641, -2.007453, 1, 0.3607843, 0, 1,
-1.505324, -0.7707166, -1.351874, 1, 0.3647059, 0, 1,
-1.487881, -0.4953917, -1.235679, 1, 0.372549, 0, 1,
-1.483579, -0.0775919, -1.20965, 1, 0.3764706, 0, 1,
-1.479059, -0.06822808, -0.9603373, 1, 0.3843137, 0, 1,
-1.471228, 1.093898, -0.4666951, 1, 0.3882353, 0, 1,
-1.465414, 1.929963, -1.940846, 1, 0.3960784, 0, 1,
-1.45256, -0.04838076, -0.4459984, 1, 0.4039216, 0, 1,
-1.444435, 0.9269323, 0.09788076, 1, 0.4078431, 0, 1,
-1.443522, 0.05171045, -1.658118, 1, 0.4156863, 0, 1,
-1.442454, 0.02809914, -3.27236, 1, 0.4196078, 0, 1,
-1.433185, -1.130425, -3.085922, 1, 0.427451, 0, 1,
-1.431292, 1.31541, -4.158017, 1, 0.4313726, 0, 1,
-1.412374, 0.1642445, -0.713988, 1, 0.4392157, 0, 1,
-1.412355, -0.5435875, -2.683736, 1, 0.4431373, 0, 1,
-1.411594, -0.08695441, -0.9520598, 1, 0.4509804, 0, 1,
-1.382257, -0.5654437, -1.030058, 1, 0.454902, 0, 1,
-1.382, 1.086868, 0.2361582, 1, 0.4627451, 0, 1,
-1.377879, -2.505117, -2.069093, 1, 0.4666667, 0, 1,
-1.373801, 1.786932, 0.4707898, 1, 0.4745098, 0, 1,
-1.373153, 0.8249994, -1.08417, 1, 0.4784314, 0, 1,
-1.36887, -0.05236036, -1.768952, 1, 0.4862745, 0, 1,
-1.366598, -1.140685, -1.917259, 1, 0.4901961, 0, 1,
-1.352769, 1.151318, -0.5381826, 1, 0.4980392, 0, 1,
-1.350769, 1.524424, -0.2551813, 1, 0.5058824, 0, 1,
-1.332443, -0.2107357, -1.639889, 1, 0.509804, 0, 1,
-1.330574, -0.240572, -0.1699746, 1, 0.5176471, 0, 1,
-1.317918, 0.3657566, -1.038844, 1, 0.5215687, 0, 1,
-1.317293, 1.066757, -0.5472945, 1, 0.5294118, 0, 1,
-1.316615, 1.752059, -1.043106, 1, 0.5333334, 0, 1,
-1.31092, -0.6345067, -4.241376, 1, 0.5411765, 0, 1,
-1.309265, 0.2104772, -1.787026, 1, 0.5450981, 0, 1,
-1.295478, 1.302385, 0.09013221, 1, 0.5529412, 0, 1,
-1.292457, 0.02057503, -1.014221, 1, 0.5568628, 0, 1,
-1.292318, 0.01750366, -1.712516, 1, 0.5647059, 0, 1,
-1.281751, -0.1042906, -0.8338991, 1, 0.5686275, 0, 1,
-1.277864, -1.850512, -4.427332, 1, 0.5764706, 0, 1,
-1.264891, -0.7311782, -2.625216, 1, 0.5803922, 0, 1,
-1.263493, 1.220062, -1.845704, 1, 0.5882353, 0, 1,
-1.26016, 2.214786, 0.3615028, 1, 0.5921569, 0, 1,
-1.258191, -0.9356813, -2.057881, 1, 0.6, 0, 1,
-1.245719, 0.3374061, -2.779765, 1, 0.6078432, 0, 1,
-1.240156, -0.1216533, -4.132756, 1, 0.6117647, 0, 1,
-1.231667, 0.2029385, -0.007011815, 1, 0.6196079, 0, 1,
-1.229546, -1.525456, -2.990429, 1, 0.6235294, 0, 1,
-1.225229, 0.3627892, -2.754292, 1, 0.6313726, 0, 1,
-1.224963, 1.244596, -1.260263, 1, 0.6352941, 0, 1,
-1.219414, 1.298556, -0.8420263, 1, 0.6431373, 0, 1,
-1.215966, 1.022452, 0.3180258, 1, 0.6470588, 0, 1,
-1.1997, -0.3374786, -2.031912, 1, 0.654902, 0, 1,
-1.189493, -0.4613942, -2.80776, 1, 0.6588235, 0, 1,
-1.181849, 1.964122, 0.2412403, 1, 0.6666667, 0, 1,
-1.170384, 0.08765164, 0.01218503, 1, 0.6705883, 0, 1,
-1.161478, -0.1501987, -3.126503, 1, 0.6784314, 0, 1,
-1.145271, -1.900772, -1.899686, 1, 0.682353, 0, 1,
-1.144491, -0.9187649, -1.21439, 1, 0.6901961, 0, 1,
-1.143418, -1.129535, -1.395018, 1, 0.6941177, 0, 1,
-1.133153, -2.214913, -4.297322, 1, 0.7019608, 0, 1,
-1.131429, 1.561055, -1.891827, 1, 0.7098039, 0, 1,
-1.125754, -1.745406, -2.62235, 1, 0.7137255, 0, 1,
-1.124133, 0.4992027, -0.4531915, 1, 0.7215686, 0, 1,
-1.12349, 1.888558, -1.467698, 1, 0.7254902, 0, 1,
-1.120937, 1.375737, 0.576957, 1, 0.7333333, 0, 1,
-1.117384, -0.9236615, -1.440268, 1, 0.7372549, 0, 1,
-1.103285, 0.151295, -1.535099, 1, 0.7450981, 0, 1,
-1.099363, 0.04943464, -0.6518136, 1, 0.7490196, 0, 1,
-1.096479, -0.2394172, -1.217199, 1, 0.7568628, 0, 1,
-1.096048, 0.7671229, -1.870777, 1, 0.7607843, 0, 1,
-1.093921, -0.3284621, -1.570303, 1, 0.7686275, 0, 1,
-1.092643, 1.418126, -1.308035, 1, 0.772549, 0, 1,
-1.086732, -0.2791381, -3.618868, 1, 0.7803922, 0, 1,
-1.083609, -0.456531, -1.069952, 1, 0.7843137, 0, 1,
-1.081911, 1.508251, -0.6078188, 1, 0.7921569, 0, 1,
-1.081239, 0.2970572, -1.279134, 1, 0.7960784, 0, 1,
-1.07958, 0.4137012, 0.7913336, 1, 0.8039216, 0, 1,
-1.061572, -0.2396071, -2.480961, 1, 0.8117647, 0, 1,
-1.057114, 0.1462483, -1.142459, 1, 0.8156863, 0, 1,
-1.054581, 0.8388362, 0.452359, 1, 0.8235294, 0, 1,
-1.052325, -0.4552361, -1.364187, 1, 0.827451, 0, 1,
-1.049025, 0.4726238, -1.947078, 1, 0.8352941, 0, 1,
-1.041594, -0.5726922, -1.605728, 1, 0.8392157, 0, 1,
-1.037945, -1.178431, -3.593443, 1, 0.8470588, 0, 1,
-1.037608, -0.4276504, 0.1069978, 1, 0.8509804, 0, 1,
-1.037144, -0.2060144, -1.124439, 1, 0.8588235, 0, 1,
-1.03704, -1.748017, -1.978922, 1, 0.8627451, 0, 1,
-1.027058, 2.259506, -0.3265244, 1, 0.8705882, 0, 1,
-1.026986, -0.6811035, -0.9538093, 1, 0.8745098, 0, 1,
-1.025712, -0.2580626, -0.9535524, 1, 0.8823529, 0, 1,
-1.016996, 0.7358693, -0.1680348, 1, 0.8862745, 0, 1,
-1.010912, 0.03967483, 0.5678234, 1, 0.8941177, 0, 1,
-1.005646, 1.550165, -1.540985, 1, 0.8980392, 0, 1,
-1.001723, -0.9976963, -1.729502, 1, 0.9058824, 0, 1,
-0.9974702, -0.2331913, -1.541558, 1, 0.9137255, 0, 1,
-0.9960517, 1.807466, 0.3043068, 1, 0.9176471, 0, 1,
-0.9960023, -0.2007078, -1.080454, 1, 0.9254902, 0, 1,
-0.9882201, -0.05608023, -2.402984, 1, 0.9294118, 0, 1,
-0.9881666, -0.3187147, -3.033515, 1, 0.9372549, 0, 1,
-0.986199, -0.6673354, -2.797854, 1, 0.9411765, 0, 1,
-0.9745122, -0.2128629, 1.190017, 1, 0.9490196, 0, 1,
-0.9721053, 0.2870218, 0.2569019, 1, 0.9529412, 0, 1,
-0.9609795, -0.004816448, -1.971824, 1, 0.9607843, 0, 1,
-0.959793, 0.4544309, -1.557319, 1, 0.9647059, 0, 1,
-0.9592025, 0.157849, -2.293459, 1, 0.972549, 0, 1,
-0.9521874, 0.7223865, -0.413294, 1, 0.9764706, 0, 1,
-0.9477654, -1.342916, -1.605645, 1, 0.9843137, 0, 1,
-0.9403313, 2.079988, -1.69316, 1, 0.9882353, 0, 1,
-0.9354782, 0.7871163, -0.9788057, 1, 0.9960784, 0, 1,
-0.9324484, 0.5692624, -1.556021, 0.9960784, 1, 0, 1,
-0.9310228, -0.03377532, -1.065649, 0.9921569, 1, 0, 1,
-0.9245871, -0.3694605, -0.3800646, 0.9843137, 1, 0, 1,
-0.9224177, -0.9314153, -2.202085, 0.9803922, 1, 0, 1,
-0.922031, -0.07766713, -0.5153721, 0.972549, 1, 0, 1,
-0.9179549, 1.268819, -0.4954807, 0.9686275, 1, 0, 1,
-0.9161983, 0.2798804, 0.146464, 0.9607843, 1, 0, 1,
-0.9153079, -0.5653728, -2.640895, 0.9568627, 1, 0, 1,
-0.9047153, -0.6157193, -1.743334, 0.9490196, 1, 0, 1,
-0.9013849, 1.380678, -2.874496, 0.945098, 1, 0, 1,
-0.9003496, -0.6888531, -2.526877, 0.9372549, 1, 0, 1,
-0.8996668, -0.03476102, -2.051777, 0.9333333, 1, 0, 1,
-0.8944526, 0.02292083, -1.780596, 0.9254902, 1, 0, 1,
-0.8916451, -1.223525, -2.973234, 0.9215686, 1, 0, 1,
-0.8840148, -0.2169147, 0.1816359, 0.9137255, 1, 0, 1,
-0.8838218, -1.385764, -2.934357, 0.9098039, 1, 0, 1,
-0.8833533, 0.6873174, -0.2687931, 0.9019608, 1, 0, 1,
-0.8817456, 1.091047, 0.04425589, 0.8941177, 1, 0, 1,
-0.8681843, -1.490122, -2.02478, 0.8901961, 1, 0, 1,
-0.86419, -0.3372792, -0.8071574, 0.8823529, 1, 0, 1,
-0.8588297, 0.1351844, -1.549507, 0.8784314, 1, 0, 1,
-0.8537269, 0.407302, -0.5919722, 0.8705882, 1, 0, 1,
-0.8492144, 0.7860681, -0.4004706, 0.8666667, 1, 0, 1,
-0.8410592, -0.6089816, -1.861573, 0.8588235, 1, 0, 1,
-0.8391851, -0.9240714, -2.234425, 0.854902, 1, 0, 1,
-0.8362701, 0.3824025, -0.3639853, 0.8470588, 1, 0, 1,
-0.8279678, 0.08393231, -0.9946835, 0.8431373, 1, 0, 1,
-0.8224618, 2.265176, 0.1962676, 0.8352941, 1, 0, 1,
-0.8218248, 0.2746284, -1.670988, 0.8313726, 1, 0, 1,
-0.821128, 0.7542736, 0.2311438, 0.8235294, 1, 0, 1,
-0.8113729, 1.281884, -0.9198048, 0.8196079, 1, 0, 1,
-0.8092493, -0.4328019, -0.5591232, 0.8117647, 1, 0, 1,
-0.8049176, 1.137248, -1.097691, 0.8078431, 1, 0, 1,
-0.8020937, 0.2579371, -1.674816, 0.8, 1, 0, 1,
-0.7965063, -0.2121237, -1.339925, 0.7921569, 1, 0, 1,
-0.7929538, -0.3985877, -4.051813, 0.7882353, 1, 0, 1,
-0.788854, 0.08960654, -0.2658773, 0.7803922, 1, 0, 1,
-0.7855506, -0.137991, -3.328286, 0.7764706, 1, 0, 1,
-0.7847273, 0.3741394, -0.2036979, 0.7686275, 1, 0, 1,
-0.7846413, 0.4457025, -1.9714, 0.7647059, 1, 0, 1,
-0.7845345, -0.547015, -1.721511, 0.7568628, 1, 0, 1,
-0.770682, 0.1796214, -0.7344633, 0.7529412, 1, 0, 1,
-0.7677547, 2.518234, 0.6550335, 0.7450981, 1, 0, 1,
-0.7669075, -0.5890532, -0.9970432, 0.7411765, 1, 0, 1,
-0.7523673, 1.347231, 1.098538, 0.7333333, 1, 0, 1,
-0.7476636, -0.4250107, -4.05511, 0.7294118, 1, 0, 1,
-0.7447644, 1.182821, -1.132831, 0.7215686, 1, 0, 1,
-0.7344273, 0.9059274, -1.607304, 0.7176471, 1, 0, 1,
-0.7329674, -0.3716186, -2.117438, 0.7098039, 1, 0, 1,
-0.7326544, -0.6046343, -2.619208, 0.7058824, 1, 0, 1,
-0.7296391, -0.2693667, -0.07149155, 0.6980392, 1, 0, 1,
-0.7262915, 2.254718, -0.004339379, 0.6901961, 1, 0, 1,
-0.7211717, 0.112654, -1.866419, 0.6862745, 1, 0, 1,
-0.7207921, -0.3849412, -2.828156, 0.6784314, 1, 0, 1,
-0.711762, 0.6676088, -0.2202077, 0.6745098, 1, 0, 1,
-0.705668, -1.574119, -2.578086, 0.6666667, 1, 0, 1,
-0.7042361, 0.3665134, -1.342591, 0.6627451, 1, 0, 1,
-0.7040347, -0.7953618, -2.464389, 0.654902, 1, 0, 1,
-0.7012057, 0.5824761, -0.3624137, 0.6509804, 1, 0, 1,
-0.7009975, 1.481185, -1.273439, 0.6431373, 1, 0, 1,
-0.7003934, 0.08131979, -2.438454, 0.6392157, 1, 0, 1,
-0.6986308, -0.6884292, -2.565839, 0.6313726, 1, 0, 1,
-0.6871088, 1.299682, 0.1036351, 0.627451, 1, 0, 1,
-0.6848552, 0.6430098, -1.012002, 0.6196079, 1, 0, 1,
-0.6842256, 0.9420242, 1.293406, 0.6156863, 1, 0, 1,
-0.6812699, 0.1899809, -2.143203, 0.6078432, 1, 0, 1,
-0.6777517, 0.220146, -2.288547, 0.6039216, 1, 0, 1,
-0.676955, -0.3689062, -2.626914, 0.5960785, 1, 0, 1,
-0.6702927, 0.5579758, -1.566656, 0.5882353, 1, 0, 1,
-0.6658641, -1.695459, -2.138813, 0.5843138, 1, 0, 1,
-0.6657793, -1.599567, -2.714171, 0.5764706, 1, 0, 1,
-0.6645809, -0.4221134, -2.741561, 0.572549, 1, 0, 1,
-0.6604706, -1.319282, -1.582438, 0.5647059, 1, 0, 1,
-0.6573334, 1.572841, 0.3742519, 0.5607843, 1, 0, 1,
-0.657171, -0.4763711, -2.534079, 0.5529412, 1, 0, 1,
-0.6545089, -0.009675158, -1.297225, 0.5490196, 1, 0, 1,
-0.6532739, -0.5836205, -1.069022, 0.5411765, 1, 0, 1,
-0.6496274, -1.621618, -3.435873, 0.5372549, 1, 0, 1,
-0.6469705, 2.761503, 0.3223291, 0.5294118, 1, 0, 1,
-0.6456481, 0.1996032, -1.334618, 0.5254902, 1, 0, 1,
-0.6422186, 2.303968, 0.1351118, 0.5176471, 1, 0, 1,
-0.6389002, 1.602878, -0.0192733, 0.5137255, 1, 0, 1,
-0.638025, -0.2411696, -2.124202, 0.5058824, 1, 0, 1,
-0.6339244, -0.8309309, -2.445211, 0.5019608, 1, 0, 1,
-0.6242462, 0.429208, -0.9822934, 0.4941176, 1, 0, 1,
-0.6229782, 1.124474, -1.038742, 0.4862745, 1, 0, 1,
-0.6220495, 1.255507, -2.226019, 0.4823529, 1, 0, 1,
-0.6203319, 0.5443018, -2.055944, 0.4745098, 1, 0, 1,
-0.6184234, -1.971893, -2.416808, 0.4705882, 1, 0, 1,
-0.6068966, 0.5233647, -0.6067681, 0.4627451, 1, 0, 1,
-0.6002346, -0.8052528, -2.63405, 0.4588235, 1, 0, 1,
-0.5963576, 1.529113, -0.4199474, 0.4509804, 1, 0, 1,
-0.5948071, 1.535385, -1.144263, 0.4470588, 1, 0, 1,
-0.5916144, 0.01237207, -0.3183768, 0.4392157, 1, 0, 1,
-0.589452, 1.273364, 0.540302, 0.4352941, 1, 0, 1,
-0.5893518, -1.405272, -2.694404, 0.427451, 1, 0, 1,
-0.5875103, -0.3014292, -0.2857162, 0.4235294, 1, 0, 1,
-0.5822259, 1.444157, -0.4445806, 0.4156863, 1, 0, 1,
-0.5752034, 0.9089969, -0.9987394, 0.4117647, 1, 0, 1,
-0.5727891, -1.342538, -1.635972, 0.4039216, 1, 0, 1,
-0.5664769, -0.4307993, -2.917734, 0.3960784, 1, 0, 1,
-0.5662509, -0.1571295, -1.495892, 0.3921569, 1, 0, 1,
-0.5659353, 0.2461902, -1.724284, 0.3843137, 1, 0, 1,
-0.5626288, 1.272704, -1.062403, 0.3803922, 1, 0, 1,
-0.5622525, 0.3286618, -2.61208, 0.372549, 1, 0, 1,
-0.5590832, -0.13543, -1.411033, 0.3686275, 1, 0, 1,
-0.552032, 0.02137498, -0.1094405, 0.3607843, 1, 0, 1,
-0.5501037, 0.6054662, 0.7226612, 0.3568628, 1, 0, 1,
-0.5495653, 2.625859, -0.3719261, 0.3490196, 1, 0, 1,
-0.5488378, 1.069503, 0.5756816, 0.345098, 1, 0, 1,
-0.5416515, 0.9001211, -1.355517, 0.3372549, 1, 0, 1,
-0.5412989, -1.147837, -1.925925, 0.3333333, 1, 0, 1,
-0.5411606, -1.566388, -3.0484, 0.3254902, 1, 0, 1,
-0.5392705, -0.5095881, -2.535792, 0.3215686, 1, 0, 1,
-0.5355983, -0.4761364, -2.720882, 0.3137255, 1, 0, 1,
-0.5333892, 0.1092649, -0.7537588, 0.3098039, 1, 0, 1,
-0.5313126, 1.583071, -0.3969653, 0.3019608, 1, 0, 1,
-0.5265867, -0.3749281, -2.429641, 0.2941177, 1, 0, 1,
-0.5252067, -0.885452, -4.133093, 0.2901961, 1, 0, 1,
-0.5208479, -0.2562414, -3.063673, 0.282353, 1, 0, 1,
-0.5184525, -0.3461671, -3.282882, 0.2784314, 1, 0, 1,
-0.518118, -0.8079651, -3.179491, 0.2705882, 1, 0, 1,
-0.517351, 0.6399161, -1.522376, 0.2666667, 1, 0, 1,
-0.5165317, -0.08190754, -2.271471, 0.2588235, 1, 0, 1,
-0.5146875, -0.06273573, -1.609246, 0.254902, 1, 0, 1,
-0.5146015, 1.185184, -1.241221, 0.2470588, 1, 0, 1,
-0.5112676, 0.4147914, -0.895855, 0.2431373, 1, 0, 1,
-0.5103815, 0.290915, -2.269844, 0.2352941, 1, 0, 1,
-0.5079689, -1.061226, -2.011064, 0.2313726, 1, 0, 1,
-0.5045934, 1.153383, -0.8053075, 0.2235294, 1, 0, 1,
-0.5010086, 1.611131, -0.7697625, 0.2196078, 1, 0, 1,
-0.4979271, 1.123359, -1.729834, 0.2117647, 1, 0, 1,
-0.493995, -0.1656483, -1.830142, 0.2078431, 1, 0, 1,
-0.4937746, -1.415525, -4.44122, 0.2, 1, 0, 1,
-0.4932159, -0.1326855, -1.331976, 0.1921569, 1, 0, 1,
-0.4900675, 1.062513, 0.3029937, 0.1882353, 1, 0, 1,
-0.4849133, -0.773666, -1.811807, 0.1803922, 1, 0, 1,
-0.480925, 0.5380749, -2.024588, 0.1764706, 1, 0, 1,
-0.4799259, 0.8909701, -0.5059835, 0.1686275, 1, 0, 1,
-0.4746175, 0.2145987, -1.884192, 0.1647059, 1, 0, 1,
-0.4716193, 1.190053, -0.4450717, 0.1568628, 1, 0, 1,
-0.4707564, 0.2151889, -0.7737525, 0.1529412, 1, 0, 1,
-0.4696652, 0.6255939, -2.39704, 0.145098, 1, 0, 1,
-0.464469, 0.7206379, 0.2802718, 0.1411765, 1, 0, 1,
-0.4582111, 1.662802, -0.3475955, 0.1333333, 1, 0, 1,
-0.4494553, -0.620599, -1.282692, 0.1294118, 1, 0, 1,
-0.4455469, 0.1121522, -0.9360572, 0.1215686, 1, 0, 1,
-0.4435449, -1.326037, -2.140675, 0.1176471, 1, 0, 1,
-0.4423138, 1.384399, 0.5364673, 0.1098039, 1, 0, 1,
-0.4402766, 0.9506393, 1.41403, 0.1058824, 1, 0, 1,
-0.4400419, -0.2534199, -3.246798, 0.09803922, 1, 0, 1,
-0.4328052, -0.3040985, -2.797796, 0.09019608, 1, 0, 1,
-0.4277476, 1.085909, -2.732684, 0.08627451, 1, 0, 1,
-0.4265777, -1.566163, -1.654791, 0.07843138, 1, 0, 1,
-0.4249391, 0.2354583, -0.02357095, 0.07450981, 1, 0, 1,
-0.42218, -0.00893198, -3.062376, 0.06666667, 1, 0, 1,
-0.421902, 0.3711681, -1.064665, 0.0627451, 1, 0, 1,
-0.4199437, 0.4046632, -1.432744, 0.05490196, 1, 0, 1,
-0.4162292, -1.008097, -1.054464, 0.05098039, 1, 0, 1,
-0.4093408, 0.4750602, -1.730844, 0.04313726, 1, 0, 1,
-0.4092325, 0.2427625, -0.9771467, 0.03921569, 1, 0, 1,
-0.4087144, -1.645771, -2.636905, 0.03137255, 1, 0, 1,
-0.4078339, 0.6160197, 0.5414031, 0.02745098, 1, 0, 1,
-0.4060248, -2.152411, -1.341774, 0.01960784, 1, 0, 1,
-0.4048773, 0.0967145, -1.477924, 0.01568628, 1, 0, 1,
-0.404087, 0.9764729, 1.149625, 0.007843138, 1, 0, 1,
-0.4040434, 0.7528004, -1.276088, 0.003921569, 1, 0, 1,
-0.4009873, 1.043412, -0.03035926, 0, 1, 0.003921569, 1,
-0.4008146, 0.8887994, -0.5966535, 0, 1, 0.01176471, 1,
-0.4002444, -0.8538963, -1.699104, 0, 1, 0.01568628, 1,
-0.397548, 0.7332555, -2.379171, 0, 1, 0.02352941, 1,
-0.3934857, 0.5566839, 0.4043654, 0, 1, 0.02745098, 1,
-0.3930437, -1.602396, -3.790308, 0, 1, 0.03529412, 1,
-0.392714, -1.867964, -1.176269, 0, 1, 0.03921569, 1,
-0.3891654, -1.061214, -2.40843, 0, 1, 0.04705882, 1,
-0.3883365, -0.02571202, -2.685469, 0, 1, 0.05098039, 1,
-0.3842848, 1.456877, 1.227163, 0, 1, 0.05882353, 1,
-0.3825501, 0.6960823, -1.336564, 0, 1, 0.0627451, 1,
-0.3806791, -1.748172, -2.480969, 0, 1, 0.07058824, 1,
-0.3725112, -0.6021711, -3.250527, 0, 1, 0.07450981, 1,
-0.3683267, -0.5307397, -3.912529, 0, 1, 0.08235294, 1,
-0.3681807, -0.2548396, -1.634739, 0, 1, 0.08627451, 1,
-0.3648264, -1.272526, -2.226307, 0, 1, 0.09411765, 1,
-0.3577032, 0.5148239, -0.7967395, 0, 1, 0.1019608, 1,
-0.3574278, 1.416456, 0.455478, 0, 1, 0.1058824, 1,
-0.3566055, -1.271308, -3.989658, 0, 1, 0.1137255, 1,
-0.3544834, -0.644247, -1.447375, 0, 1, 0.1176471, 1,
-0.3536027, -1.041474, -3.417961, 0, 1, 0.1254902, 1,
-0.3528781, -1.712633, -3.338585, 0, 1, 0.1294118, 1,
-0.3528146, 0.3151538, -1.291064, 0, 1, 0.1372549, 1,
-0.3481791, -0.1822482, -0.8704348, 0, 1, 0.1411765, 1,
-0.3436945, -0.1313667, -2.05456, 0, 1, 0.1490196, 1,
-0.3414005, -1.176806, -4.003661, 0, 1, 0.1529412, 1,
-0.3382519, 0.2021415, -2.028293, 0, 1, 0.1607843, 1,
-0.3365375, 1.068341, -0.7887678, 0, 1, 0.1647059, 1,
-0.3310803, 0.5406306, 0.4402226, 0, 1, 0.172549, 1,
-0.3305666, -0.4623895, -2.197779, 0, 1, 0.1764706, 1,
-0.3237156, -1.088145, -3.765008, 0, 1, 0.1843137, 1,
-0.3185731, 0.449132, -1.338861, 0, 1, 0.1882353, 1,
-0.3115954, 1.081363, -1.026161, 0, 1, 0.1960784, 1,
-0.3106157, -0.961085, -3.834738, 0, 1, 0.2039216, 1,
-0.3102798, -0.3980154, -2.667126, 0, 1, 0.2078431, 1,
-0.3086267, -1.534814, -2.164793, 0, 1, 0.2156863, 1,
-0.3084723, 0.7999631, 0.7996194, 0, 1, 0.2196078, 1,
-0.3027903, -0.9894309, -2.78252, 0, 1, 0.227451, 1,
-0.2986328, -2.225262, -1.788628, 0, 1, 0.2313726, 1,
-0.2941486, -2.170422, -4.252036, 0, 1, 0.2392157, 1,
-0.2895634, 0.460671, -1.092294, 0, 1, 0.2431373, 1,
-0.2844953, -0.5379317, -3.789193, 0, 1, 0.2509804, 1,
-0.2829014, -0.5730065, -2.210029, 0, 1, 0.254902, 1,
-0.2824791, 0.1024859, 0.183049, 0, 1, 0.2627451, 1,
-0.2780379, 0.07267287, -2.184508, 0, 1, 0.2666667, 1,
-0.2779632, -0.5622535, -1.860272, 0, 1, 0.2745098, 1,
-0.2763066, 0.1596094, -0.2647006, 0, 1, 0.2784314, 1,
-0.2753911, -0.4566391, -3.241431, 0, 1, 0.2862745, 1,
-0.2750537, -0.8260211, -2.36776, 0, 1, 0.2901961, 1,
-0.2721229, -0.5683421, -2.172571, 0, 1, 0.2980392, 1,
-0.2701508, -1.082541, -1.590436, 0, 1, 0.3058824, 1,
-0.261777, -0.5199054, -2.62613, 0, 1, 0.3098039, 1,
-0.2569912, -0.3939877, -1.847795, 0, 1, 0.3176471, 1,
-0.2564146, -0.4732426, -3.478891, 0, 1, 0.3215686, 1,
-0.255092, -0.2714649, -4.03848, 0, 1, 0.3294118, 1,
-0.2522881, -0.2165592, -3.969362, 0, 1, 0.3333333, 1,
-0.2492561, 0.01902736, -0.4901289, 0, 1, 0.3411765, 1,
-0.2406024, -0.7585313, -3.728384, 0, 1, 0.345098, 1,
-0.240305, -0.2522309, -0.6890126, 0, 1, 0.3529412, 1,
-0.2397096, 1.92946, -0.6441116, 0, 1, 0.3568628, 1,
-0.2306421, -0.9768716, -2.438323, 0, 1, 0.3647059, 1,
-0.2295997, -0.8513784, -2.45038, 0, 1, 0.3686275, 1,
-0.2284296, 0.4307286, 0.08901994, 0, 1, 0.3764706, 1,
-0.2275749, 0.2849416, 0.06392952, 0, 1, 0.3803922, 1,
-0.2268147, 0.6328608, -0.8329126, 0, 1, 0.3882353, 1,
-0.2235242, -1.451683, -4.706207, 0, 1, 0.3921569, 1,
-0.2219771, 0.8489369, -0.9880107, 0, 1, 0.4, 1,
-0.215292, 1.912731, -1.449437, 0, 1, 0.4078431, 1,
-0.2149562, -0.8137158, -1.659518, 0, 1, 0.4117647, 1,
-0.2131894, -1.161713, -4.283215, 0, 1, 0.4196078, 1,
-0.206195, -1.139055, -2.569869, 0, 1, 0.4235294, 1,
-0.2061317, -0.210869, -3.028935, 0, 1, 0.4313726, 1,
-0.2051525, -0.1184944, -0.8636436, 0, 1, 0.4352941, 1,
-0.205119, -0.7286219, -2.861166, 0, 1, 0.4431373, 1,
-0.2004382, 0.5910417, -0.2317525, 0, 1, 0.4470588, 1,
-0.1960152, -0.4983214, -2.856161, 0, 1, 0.454902, 1,
-0.1934791, -0.4442248, -3.80634, 0, 1, 0.4588235, 1,
-0.1857155, -0.5585482, -3.045596, 0, 1, 0.4666667, 1,
-0.1842957, -0.6126379, -5.047295, 0, 1, 0.4705882, 1,
-0.1825003, 0.5785817, -0.8858965, 0, 1, 0.4784314, 1,
-0.1823573, -1.894667, -1.92161, 0, 1, 0.4823529, 1,
-0.1808972, 0.7231371, 0.8297789, 0, 1, 0.4901961, 1,
-0.1739449, -0.6440684, -2.788584, 0, 1, 0.4941176, 1,
-0.172427, -0.4163809, -1.689276, 0, 1, 0.5019608, 1,
-0.1706122, -0.8672136, -3.965855, 0, 1, 0.509804, 1,
-0.1685728, 0.6476848, 0.237307, 0, 1, 0.5137255, 1,
-0.1676979, 0.812255, -1.848772, 0, 1, 0.5215687, 1,
-0.1656225, -0.1779932, -4.404288, 0, 1, 0.5254902, 1,
-0.1636359, 0.6915841, 0.1568279, 0, 1, 0.5333334, 1,
-0.1632424, -0.2097697, -2.675557, 0, 1, 0.5372549, 1,
-0.1614914, -1.138382, -2.923008, 0, 1, 0.5450981, 1,
-0.1604098, -0.6556604, -3.357924, 0, 1, 0.5490196, 1,
-0.1600521, 0.3908064, 0.4861603, 0, 1, 0.5568628, 1,
-0.1567398, -0.1111376, -1.305919, 0, 1, 0.5607843, 1,
-0.1552036, -0.6040173, -2.685178, 0, 1, 0.5686275, 1,
-0.1537186, -0.6459683, -2.252136, 0, 1, 0.572549, 1,
-0.152875, 0.5000175, -0.1532375, 0, 1, 0.5803922, 1,
-0.1525988, 0.5552955, 1.062838, 0, 1, 0.5843138, 1,
-0.1508045, 1.334902, 2.308165, 0, 1, 0.5921569, 1,
-0.1497556, -0.4786745, -2.787086, 0, 1, 0.5960785, 1,
-0.1478742, -0.7508816, -4.569996, 0, 1, 0.6039216, 1,
-0.1454071, 0.5502033, 0.4075213, 0, 1, 0.6117647, 1,
-0.1437665, -1.839452, -2.029637, 0, 1, 0.6156863, 1,
-0.1427015, 0.1540235, 0.09513618, 0, 1, 0.6235294, 1,
-0.142106, 0.04558812, 0.1161675, 0, 1, 0.627451, 1,
-0.1419189, -1.563621, -3.417645, 0, 1, 0.6352941, 1,
-0.1376354, 0.7406633, -2.744745, 0, 1, 0.6392157, 1,
-0.1358776, -1.856339, -5.169989, 0, 1, 0.6470588, 1,
-0.1319765, -0.5913957, -1.880722, 0, 1, 0.6509804, 1,
-0.129613, 2.096558, -1.808592, 0, 1, 0.6588235, 1,
-0.1280359, -2.088376, -1.904787, 0, 1, 0.6627451, 1,
-0.1218696, -0.1922769, -2.816624, 0, 1, 0.6705883, 1,
-0.1188096, 1.179976, 0.9208243, 0, 1, 0.6745098, 1,
-0.1169062, -0.3532107, -3.173703, 0, 1, 0.682353, 1,
-0.1167339, 1.04086, -1.089749, 0, 1, 0.6862745, 1,
-0.1159309, -1.115647, -4.172964, 0, 1, 0.6941177, 1,
-0.1142618, -0.6108648, -2.698569, 0, 1, 0.7019608, 1,
-0.1135117, 0.05980197, -1.938386, 0, 1, 0.7058824, 1,
-0.1133405, 0.5749366, -0.2066937, 0, 1, 0.7137255, 1,
-0.1128149, 0.09057057, -0.3183472, 0, 1, 0.7176471, 1,
-0.1127665, 0.8310887, 1.245882, 0, 1, 0.7254902, 1,
-0.1103515, 0.7005591, 0.4635096, 0, 1, 0.7294118, 1,
-0.1065054, -1.055499, -2.947676, 0, 1, 0.7372549, 1,
-0.106124, 1.52864, -0.6304788, 0, 1, 0.7411765, 1,
-0.1039289, -0.6600942, -2.457587, 0, 1, 0.7490196, 1,
-0.1020348, -0.8862352, -2.277752, 0, 1, 0.7529412, 1,
-0.101298, 0.4637025, 0.4734118, 0, 1, 0.7607843, 1,
-0.1001503, -1.570454, -3.221684, 0, 1, 0.7647059, 1,
-0.09867239, -1.989627, -1.682212, 0, 1, 0.772549, 1,
-0.09567241, 1.004438, -0.503924, 0, 1, 0.7764706, 1,
-0.09486794, 0.5045405, 0.02590626, 0, 1, 0.7843137, 1,
-0.09060165, 0.7652572, 0.6900138, 0, 1, 0.7882353, 1,
-0.0878523, -0.1379908, -3.135979, 0, 1, 0.7960784, 1,
-0.08729089, 0.4753037, -1.368631, 0, 1, 0.8039216, 1,
-0.08505168, 1.138648, -0.0956766, 0, 1, 0.8078431, 1,
-0.08314462, 0.0246728, 1.00314, 0, 1, 0.8156863, 1,
-0.07959226, 0.346705, -0.1445256, 0, 1, 0.8196079, 1,
-0.07956054, 0.6540913, -0.2305456, 0, 1, 0.827451, 1,
-0.07791395, 1.253055, -0.3384699, 0, 1, 0.8313726, 1,
-0.07706012, -0.3324094, -2.522541, 0, 1, 0.8392157, 1,
-0.07559296, 0.9731308, 0.3024839, 0, 1, 0.8431373, 1,
-0.07188753, 0.5616219, -0.5560287, 0, 1, 0.8509804, 1,
-0.0684653, -0.8130693, -1.813873, 0, 1, 0.854902, 1,
-0.06782362, -0.09177876, -2.440845, 0, 1, 0.8627451, 1,
-0.06703858, 2.397511, -0.6934574, 0, 1, 0.8666667, 1,
-0.06698804, 2.046582, -1.027516, 0, 1, 0.8745098, 1,
-0.06330432, 0.9857768, -1.891095, 0, 1, 0.8784314, 1,
-0.06169466, -0.3612719, -4.176031, 0, 1, 0.8862745, 1,
-0.05704794, -0.5975555, -4.008772, 0, 1, 0.8901961, 1,
-0.05688792, -0.4289084, -3.467343, 0, 1, 0.8980392, 1,
-0.05557594, 0.7045622, 1.063692, 0, 1, 0.9058824, 1,
-0.04636423, -0.4623264, -4.331357, 0, 1, 0.9098039, 1,
-0.04228123, -1.085009, -4.73307, 0, 1, 0.9176471, 1,
-0.04212462, 0.9900807, -0.0871414, 0, 1, 0.9215686, 1,
-0.041437, -0.3639858, -4.354275, 0, 1, 0.9294118, 1,
-0.04078778, -0.9065894, -3.774541, 0, 1, 0.9333333, 1,
-0.04001126, -0.2413344, -3.73207, 0, 1, 0.9411765, 1,
-0.03533753, -2.13923, -1.868461, 0, 1, 0.945098, 1,
-0.03503445, 1.143835, -0.2527348, 0, 1, 0.9529412, 1,
-0.03265003, -0.6769353, -5.332176, 0, 1, 0.9568627, 1,
-0.02732749, 0.6495497, -1.077738, 0, 1, 0.9647059, 1,
-0.02622022, 1.371702, 0.5805192, 0, 1, 0.9686275, 1,
-0.02438858, 1.335659, 0.7325079, 0, 1, 0.9764706, 1,
-0.02267124, -0.1278701, -1.51644, 0, 1, 0.9803922, 1,
-0.02251951, 0.9055117, 0.7913153, 0, 1, 0.9882353, 1,
-0.02119263, -3.428456, -4.092209, 0, 1, 0.9921569, 1,
-0.01885445, -0.5282087, -5.418213, 0, 1, 1, 1,
-0.01783247, 0.6055046, -0.399059, 0, 0.9921569, 1, 1,
-0.01720503, -0.1263525, -4.174839, 0, 0.9882353, 1, 1,
-0.01406991, -0.3069003, -3.625891, 0, 0.9803922, 1, 1,
-0.0122184, 1.051858, 0.06327513, 0, 0.9764706, 1, 1,
-0.009855601, -0.1134499, -2.636426, 0, 0.9686275, 1, 1,
-0.007721822, -2.440167, -2.406654, 0, 0.9647059, 1, 1,
-0.004024728, 1.193684, -0.1018847, 0, 0.9568627, 1, 1,
-0.002754207, -0.9874161, -2.903605, 0, 0.9529412, 1, 1,
-0.001404573, -1.871928, -2.072228, 0, 0.945098, 1, 1,
0.003077853, 0.9282753, -0.6151033, 0, 0.9411765, 1, 1,
0.00586489, -0.3648204, 4.77712, 0, 0.9333333, 1, 1,
0.01292184, -0.7853778, 4.728239, 0, 0.9294118, 1, 1,
0.01368157, 1.877934, -0.3279814, 0, 0.9215686, 1, 1,
0.01402654, -1.284048, 2.216337, 0, 0.9176471, 1, 1,
0.01733366, -0.3061644, 1.636416, 0, 0.9098039, 1, 1,
0.01827599, 1.216167, -1.485296, 0, 0.9058824, 1, 1,
0.01864371, 1.522443, 0.7711288, 0, 0.8980392, 1, 1,
0.02107844, -0.004178678, 2.370804, 0, 0.8901961, 1, 1,
0.02397528, -1.563297, 3.074055, 0, 0.8862745, 1, 1,
0.03487682, 2.488484, -1.022914, 0, 0.8784314, 1, 1,
0.03768607, -0.1195224, 1.783565, 0, 0.8745098, 1, 1,
0.03844396, 1.64684, -0.03944945, 0, 0.8666667, 1, 1,
0.03926076, 0.477243, 1.55755, 0, 0.8627451, 1, 1,
0.03931522, 1.085221, 1.228928, 0, 0.854902, 1, 1,
0.04033915, -1.034054, 3.347624, 0, 0.8509804, 1, 1,
0.04161882, -3.150642, 3.218637, 0, 0.8431373, 1, 1,
0.04451142, 0.5119461, 1.770726, 0, 0.8392157, 1, 1,
0.04568197, -0.903048, 4.362227, 0, 0.8313726, 1, 1,
0.04888549, 0.9906012, -1.409928, 0, 0.827451, 1, 1,
0.05237832, -1.428613, 1.52368, 0, 0.8196079, 1, 1,
0.06920013, -0.07244524, 2.799359, 0, 0.8156863, 1, 1,
0.07116653, 0.5638174, -1.751255, 0, 0.8078431, 1, 1,
0.07128404, 0.7078905, -0.4816631, 0, 0.8039216, 1, 1,
0.07194709, -0.3258921, 3.280305, 0, 0.7960784, 1, 1,
0.07364606, -0.5151958, 5.080526, 0, 0.7882353, 1, 1,
0.08421527, 0.1831875, -0.7790807, 0, 0.7843137, 1, 1,
0.08592211, -0.3766632, 3.073738, 0, 0.7764706, 1, 1,
0.08632348, 0.3755682, -1.696992, 0, 0.772549, 1, 1,
0.09091989, 0.4058324, -0.5784382, 0, 0.7647059, 1, 1,
0.09708051, -0.1844004, 2.21014, 0, 0.7607843, 1, 1,
0.1008006, -0.5886636, 4.366425, 0, 0.7529412, 1, 1,
0.1013273, 0.3672544, 0.9786266, 0, 0.7490196, 1, 1,
0.1046418, -0.2829009, 2.355158, 0, 0.7411765, 1, 1,
0.1089144, -0.1820948, 1.869433, 0, 0.7372549, 1, 1,
0.1093527, 0.8990411, 1.120706, 0, 0.7294118, 1, 1,
0.1099291, -0.5444196, 2.446127, 0, 0.7254902, 1, 1,
0.1100554, -0.8715905, 3.982369, 0, 0.7176471, 1, 1,
0.1106829, 0.02093384, 1.681243, 0, 0.7137255, 1, 1,
0.1132207, -1.762609, 4.339725, 0, 0.7058824, 1, 1,
0.1145297, -1.458726, 2.428906, 0, 0.6980392, 1, 1,
0.114824, -0.2739874, 1.604225, 0, 0.6941177, 1, 1,
0.1153172, 0.428647, -0.2568991, 0, 0.6862745, 1, 1,
0.1165084, 0.8766871, 0.2424547, 0, 0.682353, 1, 1,
0.1175544, -0.9254342, 3.19007, 0, 0.6745098, 1, 1,
0.1176028, 0.1338389, -0.2340779, 0, 0.6705883, 1, 1,
0.1186809, 1.175492, 0.008242505, 0, 0.6627451, 1, 1,
0.1189503, -1.413681, 3.215978, 0, 0.6588235, 1, 1,
0.1202901, -0.5439599, 3.24925, 0, 0.6509804, 1, 1,
0.1203335, -1.191794, 2.078881, 0, 0.6470588, 1, 1,
0.121649, 1.574553, 1.223423, 0, 0.6392157, 1, 1,
0.125531, -0.3596995, 4.361453, 0, 0.6352941, 1, 1,
0.1260629, -0.8360842, 1.488813, 0, 0.627451, 1, 1,
0.1291003, -1.91546, 2.905333, 0, 0.6235294, 1, 1,
0.130774, 0.2744648, -0.09630181, 0, 0.6156863, 1, 1,
0.1334728, 0.3396555, 0.0001619223, 0, 0.6117647, 1, 1,
0.1335115, 0.6120898, -0.3171285, 0, 0.6039216, 1, 1,
0.1394867, -1.261703, 3.94373, 0, 0.5960785, 1, 1,
0.140529, -1.082001, 3.195968, 0, 0.5921569, 1, 1,
0.1411037, 0.4697943, -0.01117321, 0, 0.5843138, 1, 1,
0.1425679, 0.6824223, 1.538924, 0, 0.5803922, 1, 1,
0.1431664, -0.3851905, 3.116376, 0, 0.572549, 1, 1,
0.1444551, 0.1299461, 1.42217, 0, 0.5686275, 1, 1,
0.1444812, 0.3053916, -1.654222, 0, 0.5607843, 1, 1,
0.1454536, -0.4591716, 3.264428, 0, 0.5568628, 1, 1,
0.1456283, -0.772673, 4.310192, 0, 0.5490196, 1, 1,
0.1486355, 0.4521783, 0.3517628, 0, 0.5450981, 1, 1,
0.1506039, 0.03683174, -1.766746, 0, 0.5372549, 1, 1,
0.15255, -0.4169673, 2.779037, 0, 0.5333334, 1, 1,
0.1538197, 0.1533182, 1.21551, 0, 0.5254902, 1, 1,
0.155134, -0.2065959, 1.457617, 0, 0.5215687, 1, 1,
0.1553051, -0.5147315, 1.490685, 0, 0.5137255, 1, 1,
0.1581229, 0.2695293, 1.98715, 0, 0.509804, 1, 1,
0.1645553, -0.0785808, 3.070521, 0, 0.5019608, 1, 1,
0.1650537, 1.844407, -0.4063957, 0, 0.4941176, 1, 1,
0.1703684, 0.6736809, 0.5979661, 0, 0.4901961, 1, 1,
0.170637, 0.8432024, 0.4768777, 0, 0.4823529, 1, 1,
0.1713327, 0.5191299, -0.8067017, 0, 0.4784314, 1, 1,
0.1734208, 3.318789, -1.932403, 0, 0.4705882, 1, 1,
0.1756075, 1.101958, 2.211454, 0, 0.4666667, 1, 1,
0.177146, 0.01818169, 1.392911, 0, 0.4588235, 1, 1,
0.1836283, -0.7070172, 1.278925, 0, 0.454902, 1, 1,
0.1879238, -0.32668, 3.158922, 0, 0.4470588, 1, 1,
0.1902442, 0.7652821, -1.792938, 0, 0.4431373, 1, 1,
0.1943565, 2.350204, 0.8370705, 0, 0.4352941, 1, 1,
0.1966881, 0.2896697, 0.08930387, 0, 0.4313726, 1, 1,
0.1975766, -0.6437436, 2.720376, 0, 0.4235294, 1, 1,
0.2016406, -0.2039075, 2.378946, 0, 0.4196078, 1, 1,
0.2021506, -0.9853625, 2.745377, 0, 0.4117647, 1, 1,
0.203044, 2.050163, -0.1903926, 0, 0.4078431, 1, 1,
0.2040347, -1.446919, 1.472232, 0, 0.4, 1, 1,
0.2072039, 0.9103535, -0.4357675, 0, 0.3921569, 1, 1,
0.2084427, -0.9185733, 1.627235, 0, 0.3882353, 1, 1,
0.2144134, 0.5467417, 1.218265, 0, 0.3803922, 1, 1,
0.2206088, -0.7807514, 2.452905, 0, 0.3764706, 1, 1,
0.2207757, -0.2098559, 3.193501, 0, 0.3686275, 1, 1,
0.2211453, 0.8140898, 0.4280759, 0, 0.3647059, 1, 1,
0.2239497, 2.395519, 0.1245954, 0, 0.3568628, 1, 1,
0.225224, -1.970508, 5.462785, 0, 0.3529412, 1, 1,
0.2313929, 2.490642, -0.8403839, 0, 0.345098, 1, 1,
0.2389474, 0.1425663, 1.12647, 0, 0.3411765, 1, 1,
0.2463093, 0.6382204, 0.4568417, 0, 0.3333333, 1, 1,
0.2493563, -0.3515179, 2.079617, 0, 0.3294118, 1, 1,
0.2534289, -0.959479, 3.918851, 0, 0.3215686, 1, 1,
0.2544011, -0.4133655, 1.036543, 0, 0.3176471, 1, 1,
0.2555971, -1.590003, 3.851141, 0, 0.3098039, 1, 1,
0.2617795, 1.208835, 2.537394, 0, 0.3058824, 1, 1,
0.2634338, -0.5559348, 2.35101, 0, 0.2980392, 1, 1,
0.268943, 0.2360469, -0.7516676, 0, 0.2901961, 1, 1,
0.2737169, -1.179112, 2.377234, 0, 0.2862745, 1, 1,
0.2738869, 1.058492, 0.8818852, 0, 0.2784314, 1, 1,
0.2745681, -0.3386668, 2.83726, 0, 0.2745098, 1, 1,
0.2769142, 1.284127, -0.5229356, 0, 0.2666667, 1, 1,
0.2784843, -0.546422, 3.2736, 0, 0.2627451, 1, 1,
0.2846945, 2.066415, 1.202224, 0, 0.254902, 1, 1,
0.2865039, 0.9551308, -0.1330884, 0, 0.2509804, 1, 1,
0.2884963, 1.436479, 0.154245, 0, 0.2431373, 1, 1,
0.288958, 0.4432763, 0.852949, 0, 0.2392157, 1, 1,
0.292865, -0.2348958, 2.851118, 0, 0.2313726, 1, 1,
0.3091899, -0.5752904, 3.307737, 0, 0.227451, 1, 1,
0.3107018, 0.09563579, 2.324893, 0, 0.2196078, 1, 1,
0.3139887, -1.56633, 2.077394, 0, 0.2156863, 1, 1,
0.3142232, 0.4582686, 0.7572208, 0, 0.2078431, 1, 1,
0.3234663, -0.7105973, 1.809761, 0, 0.2039216, 1, 1,
0.3260229, -0.2179921, 2.054765, 0, 0.1960784, 1, 1,
0.327569, -1.449669, 2.769724, 0, 0.1882353, 1, 1,
0.3276332, -0.3499646, 2.278899, 0, 0.1843137, 1, 1,
0.3314883, -0.7517478, 2.283365, 0, 0.1764706, 1, 1,
0.3330359, 0.8867128, -0.5942599, 0, 0.172549, 1, 1,
0.3356691, 0.1096935, 0.834772, 0, 0.1647059, 1, 1,
0.3396535, 0.9661287, -0.9280238, 0, 0.1607843, 1, 1,
0.3429624, 2.230019, 0.02847479, 0, 0.1529412, 1, 1,
0.3492213, -0.5181236, 1.36586, 0, 0.1490196, 1, 1,
0.351793, 0.01372844, 1.334553, 0, 0.1411765, 1, 1,
0.3519377, -0.9038697, 3.346004, 0, 0.1372549, 1, 1,
0.3572452, -1.198387, 1.234993, 0, 0.1294118, 1, 1,
0.3585583, 0.4541528, -0.4056323, 0, 0.1254902, 1, 1,
0.3594093, -0.5257968, 0.7709116, 0, 0.1176471, 1, 1,
0.360539, 0.03524909, 1.601245, 0, 0.1137255, 1, 1,
0.3628267, -0.6852794, 2.783902, 0, 0.1058824, 1, 1,
0.3630502, 0.8831305, 0.4677932, 0, 0.09803922, 1, 1,
0.3673143, 0.6339285, 0.1261307, 0, 0.09411765, 1, 1,
0.3688117, -0.753433, 2.810909, 0, 0.08627451, 1, 1,
0.3735926, -0.04240489, 2.963438, 0, 0.08235294, 1, 1,
0.3736819, 0.9612847, -0.9272107, 0, 0.07450981, 1, 1,
0.3762502, 0.3966401, 2.230113, 0, 0.07058824, 1, 1,
0.3780149, -0.07030442, 2.862006, 0, 0.0627451, 1, 1,
0.3807319, 0.04773015, 2.375887, 0, 0.05882353, 1, 1,
0.3807482, -0.6434073, 2.797196, 0, 0.05098039, 1, 1,
0.3810236, -0.9918283, 2.091702, 0, 0.04705882, 1, 1,
0.3850023, -0.3418106, 2.493637, 0, 0.03921569, 1, 1,
0.386041, -1.840448, 3.834429, 0, 0.03529412, 1, 1,
0.3876981, -0.6206217, 1.249876, 0, 0.02745098, 1, 1,
0.3882824, 0.1079663, 1.119202, 0, 0.02352941, 1, 1,
0.388329, 0.1457687, 1.162081, 0, 0.01568628, 1, 1,
0.3911402, -2.160473, 1.711009, 0, 0.01176471, 1, 1,
0.3946551, 1.403052, -2.074499, 0, 0.003921569, 1, 1,
0.4023876, 0.4301995, 0.7509953, 0.003921569, 0, 1, 1,
0.402777, -0.0173796, 1.300672, 0.007843138, 0, 1, 1,
0.4044748, -0.7829443, 3.22709, 0.01568628, 0, 1, 1,
0.4046272, 1.369641, 0.9629195, 0.01960784, 0, 1, 1,
0.4049722, 1.07939, 1.501152, 0.02745098, 0, 1, 1,
0.4060157, 0.6648331, -0.6162201, 0.03137255, 0, 1, 1,
0.4088791, 0.7836516, 0.4402896, 0.03921569, 0, 1, 1,
0.4161399, 0.9931572, -1.154288, 0.04313726, 0, 1, 1,
0.4164911, 0.8024856, 1.486862, 0.05098039, 0, 1, 1,
0.4169984, 1.307482, -0.7094996, 0.05490196, 0, 1, 1,
0.4181855, -0.1455752, 3.269037, 0.0627451, 0, 1, 1,
0.4258497, 0.920229, -0.3890653, 0.06666667, 0, 1, 1,
0.4277124, -0.5939124, 1.776567, 0.07450981, 0, 1, 1,
0.4303072, 1.501531, 0.6462709, 0.07843138, 0, 1, 1,
0.4371048, -1.263244, 3.395498, 0.08627451, 0, 1, 1,
0.4470361, -0.0497275, -0.2033223, 0.09019608, 0, 1, 1,
0.4474035, -0.4335149, 2.997245, 0.09803922, 0, 1, 1,
0.4497354, 0.1682448, 0.8598187, 0.1058824, 0, 1, 1,
0.4528704, -1.830326, 3.591609, 0.1098039, 0, 1, 1,
0.4556452, -0.7184206, 3.549457, 0.1176471, 0, 1, 1,
0.4604601, 0.3236853, 0.144138, 0.1215686, 0, 1, 1,
0.4671043, 0.9888407, 0.0009137025, 0.1294118, 0, 1, 1,
0.4692999, -0.8813761, 2.813473, 0.1333333, 0, 1, 1,
0.4804049, -0.6074541, 1.710503, 0.1411765, 0, 1, 1,
0.4806568, 0.3852772, 1.696755, 0.145098, 0, 1, 1,
0.4842048, 0.4352213, 1.020602, 0.1529412, 0, 1, 1,
0.4863269, 0.3663675, 2.055321, 0.1568628, 0, 1, 1,
0.4900549, 1.145471, -0.01301635, 0.1647059, 0, 1, 1,
0.4904832, -0.5211502, 1.507352, 0.1686275, 0, 1, 1,
0.494702, -1.702013, 1.677167, 0.1764706, 0, 1, 1,
0.4995382, -0.2909185, 2.085645, 0.1803922, 0, 1, 1,
0.500663, -2.710133, 2.892153, 0.1882353, 0, 1, 1,
0.5007812, -0.08371043, 1.510258, 0.1921569, 0, 1, 1,
0.5021504, -1.065122, 3.151875, 0.2, 0, 1, 1,
0.5035923, -0.3126111, 0.6694049, 0.2078431, 0, 1, 1,
0.5068429, -1.119138, 3.771348, 0.2117647, 0, 1, 1,
0.5122724, -0.06255762, 1.753057, 0.2196078, 0, 1, 1,
0.5123665, 1.771197, 0.3244976, 0.2235294, 0, 1, 1,
0.5131091, 1.08316, 1.355463, 0.2313726, 0, 1, 1,
0.5166995, -0.6485581, 3.984818, 0.2352941, 0, 1, 1,
0.5234877, -0.6840606, 0.7901039, 0.2431373, 0, 1, 1,
0.5254651, 0.06788766, 1.361087, 0.2470588, 0, 1, 1,
0.5281382, 0.031585, 1.525197, 0.254902, 0, 1, 1,
0.5347938, -0.1617151, 2.621001, 0.2588235, 0, 1, 1,
0.5366479, -0.1864369, 1.658975, 0.2666667, 0, 1, 1,
0.5385062, -0.247669, 1.098114, 0.2705882, 0, 1, 1,
0.5421372, 0.3544974, 0.8786375, 0.2784314, 0, 1, 1,
0.5541037, 0.1936578, 3.412894, 0.282353, 0, 1, 1,
0.5553763, 0.2134027, 2.276446, 0.2901961, 0, 1, 1,
0.5574139, -0.8326307, 2.836085, 0.2941177, 0, 1, 1,
0.5628986, 0.1417253, 0.9318329, 0.3019608, 0, 1, 1,
0.5635022, 1.050502, 1.439526, 0.3098039, 0, 1, 1,
0.5696819, 1.848156, -0.1670417, 0.3137255, 0, 1, 1,
0.5720854, -1.013079, 3.281132, 0.3215686, 0, 1, 1,
0.5873194, 0.667078, 0.06780928, 0.3254902, 0, 1, 1,
0.5876765, -1.585823, 2.275997, 0.3333333, 0, 1, 1,
0.5882999, -1.668744, 2.19797, 0.3372549, 0, 1, 1,
0.5888259, -0.5720546, 1.075256, 0.345098, 0, 1, 1,
0.5940343, -0.4874874, 0.4063195, 0.3490196, 0, 1, 1,
0.5978798, 0.4577269, 1.753356, 0.3568628, 0, 1, 1,
0.6041123, -0.3004574, 4.829696, 0.3607843, 0, 1, 1,
0.6060805, 0.6077689, 1.675539, 0.3686275, 0, 1, 1,
0.6070789, -0.3404947, 2.324243, 0.372549, 0, 1, 1,
0.6091007, 0.166884, 0.1229098, 0.3803922, 0, 1, 1,
0.6092543, -0.187074, 3.496644, 0.3843137, 0, 1, 1,
0.6095517, -0.7613872, 2.611241, 0.3921569, 0, 1, 1,
0.6160938, 0.3761916, -0.2652876, 0.3960784, 0, 1, 1,
0.6163297, 1.623794, -0.3108079, 0.4039216, 0, 1, 1,
0.6212189, 1.152699, 1.105905, 0.4117647, 0, 1, 1,
0.6240465, -0.3200334, 2.384432, 0.4156863, 0, 1, 1,
0.625999, -1.222257, 1.161592, 0.4235294, 0, 1, 1,
0.6294163, -0.2085296, 2.184653, 0.427451, 0, 1, 1,
0.6306579, -0.5846649, 0.7245166, 0.4352941, 0, 1, 1,
0.6306991, -1.267106, 3.120911, 0.4392157, 0, 1, 1,
0.63082, 0.2359415, -0.7352326, 0.4470588, 0, 1, 1,
0.6342204, -0.06936082, -0.2384533, 0.4509804, 0, 1, 1,
0.637193, 0.7103313, -1.932804, 0.4588235, 0, 1, 1,
0.6424809, 0.3307292, 1.294866, 0.4627451, 0, 1, 1,
0.6450905, 1.594708, -0.1426036, 0.4705882, 0, 1, 1,
0.650302, -1.037794, 2.670167, 0.4745098, 0, 1, 1,
0.6525261, -1.581441, 1.259639, 0.4823529, 0, 1, 1,
0.6536552, -0.9464697, 1.290133, 0.4862745, 0, 1, 1,
0.6548517, -0.4982909, 2.172647, 0.4941176, 0, 1, 1,
0.6559156, 0.447651, 1.393212, 0.5019608, 0, 1, 1,
0.6567259, -1.810994, 3.019887, 0.5058824, 0, 1, 1,
0.65783, 1.100504, 0.2239223, 0.5137255, 0, 1, 1,
0.6624672, 0.9168873, 0.5021049, 0.5176471, 0, 1, 1,
0.6650486, -0.4618741, 3.602885, 0.5254902, 0, 1, 1,
0.6680016, -0.5307553, 4.110579, 0.5294118, 0, 1, 1,
0.6691003, -1.995718, 2.952162, 0.5372549, 0, 1, 1,
0.6809983, 1.037975, -1.046425, 0.5411765, 0, 1, 1,
0.6827841, 0.4980911, -1.770833, 0.5490196, 0, 1, 1,
0.6867409, -0.7911623, 2.442089, 0.5529412, 0, 1, 1,
0.6887876, 1.019287, -0.5041196, 0.5607843, 0, 1, 1,
0.6957286, 0.3743021, 1.565532, 0.5647059, 0, 1, 1,
0.695872, -0.14649, 1.690786, 0.572549, 0, 1, 1,
0.69735, 0.7897619, 2.080566, 0.5764706, 0, 1, 1,
0.6976504, -2.285318, 1.317946, 0.5843138, 0, 1, 1,
0.7044356, 0.5327726, -0.4547665, 0.5882353, 0, 1, 1,
0.7086823, -0.3662131, 2.909514, 0.5960785, 0, 1, 1,
0.7087237, -0.5773631, 1.234706, 0.6039216, 0, 1, 1,
0.7164971, 0.1165434, 3.33856, 0.6078432, 0, 1, 1,
0.7171729, -0.460221, 0.8356639, 0.6156863, 0, 1, 1,
0.7173702, -0.7891486, 1.205316, 0.6196079, 0, 1, 1,
0.726459, 0.7053602, -0.004696683, 0.627451, 0, 1, 1,
0.7286801, 0.7564348, 0.4650645, 0.6313726, 0, 1, 1,
0.7319145, 1.068562, 1.042262, 0.6392157, 0, 1, 1,
0.7340128, -0.3906721, 0.2387603, 0.6431373, 0, 1, 1,
0.7390943, -0.06948578, 2.659762, 0.6509804, 0, 1, 1,
0.7401456, -0.4741237, 1.726367, 0.654902, 0, 1, 1,
0.7427551, 1.460029, 0.3064884, 0.6627451, 0, 1, 1,
0.7456491, -1.824982, 3.671433, 0.6666667, 0, 1, 1,
0.7558362, -0.4071288, 2.826725, 0.6745098, 0, 1, 1,
0.759885, -0.6029174, 2.152337, 0.6784314, 0, 1, 1,
0.7614468, -0.005035729, 1.564006, 0.6862745, 0, 1, 1,
0.761812, -0.9518407, 2.191193, 0.6901961, 0, 1, 1,
0.7625025, -0.004392203, 3.077021, 0.6980392, 0, 1, 1,
0.7656631, 0.7723092, -0.1980901, 0.7058824, 0, 1, 1,
0.7706813, -0.5623729, 3.276989, 0.7098039, 0, 1, 1,
0.7723699, 0.8109596, -0.8631921, 0.7176471, 0, 1, 1,
0.7747827, -0.2880682, 1.557811, 0.7215686, 0, 1, 1,
0.7754222, -0.1102431, 2.40259, 0.7294118, 0, 1, 1,
0.7754552, 2.142839, -1.947569, 0.7333333, 0, 1, 1,
0.7792525, 1.008803, 0.244017, 0.7411765, 0, 1, 1,
0.7832726, 1.086047, -0.6663498, 0.7450981, 0, 1, 1,
0.7866716, 0.0005003661, 2.994353, 0.7529412, 0, 1, 1,
0.78795, -0.4383981, 1.233613, 0.7568628, 0, 1, 1,
0.7887912, -1.334479, 4.074694, 0.7647059, 0, 1, 1,
0.7905713, 1.43462, 0.4374791, 0.7686275, 0, 1, 1,
0.7935222, 0.1840526, 0.4737195, 0.7764706, 0, 1, 1,
0.7957965, 0.180008, -0.3124905, 0.7803922, 0, 1, 1,
0.7976224, -0.3121201, 1.55543, 0.7882353, 0, 1, 1,
0.8001291, -0.7370874, 3.325948, 0.7921569, 0, 1, 1,
0.8078634, -1.87067, 3.397457, 0.8, 0, 1, 1,
0.8102237, -0.4569924, 1.05805, 0.8078431, 0, 1, 1,
0.8106337, 0.4617855, 1.041828, 0.8117647, 0, 1, 1,
0.8109779, 0.4822649, 2.051417, 0.8196079, 0, 1, 1,
0.8137893, 0.9797347, 0.6947254, 0.8235294, 0, 1, 1,
0.8138748, -1.062663, 2.078877, 0.8313726, 0, 1, 1,
0.8156595, 1.403594, 1.412246, 0.8352941, 0, 1, 1,
0.8172646, -1.477999, 1.51414, 0.8431373, 0, 1, 1,
0.8199199, 0.2566707, -1.01137, 0.8470588, 0, 1, 1,
0.8214015, -1.147788, 2.491235, 0.854902, 0, 1, 1,
0.8255365, -0.8117992, 3.638168, 0.8588235, 0, 1, 1,
0.8275265, -0.6895702, 0.1930424, 0.8666667, 0, 1, 1,
0.8300465, -2.664049, 2.683353, 0.8705882, 0, 1, 1,
0.8323129, 0.07166775, 2.008395, 0.8784314, 0, 1, 1,
0.8330767, -0.2197901, -1.594452, 0.8823529, 0, 1, 1,
0.8349224, 0.7956116, 0.487647, 0.8901961, 0, 1, 1,
0.8360206, -0.2793213, 3.555357, 0.8941177, 0, 1, 1,
0.8374085, -0.02736889, 1.958409, 0.9019608, 0, 1, 1,
0.839833, -0.4670539, 3.088364, 0.9098039, 0, 1, 1,
0.8400297, 2.216232, 1.724519, 0.9137255, 0, 1, 1,
0.8455526, 1.579145, 0.03017318, 0.9215686, 0, 1, 1,
0.8471398, -0.2162752, 3.379289, 0.9254902, 0, 1, 1,
0.8548065, 0.7289684, 0.4508646, 0.9333333, 0, 1, 1,
0.8573187, 0.09042361, 1.280779, 0.9372549, 0, 1, 1,
0.8582582, -0.8841737, 1.352564, 0.945098, 0, 1, 1,
0.8643193, 1.474237, 1.792746, 0.9490196, 0, 1, 1,
0.8715535, -0.957322, 2.555869, 0.9568627, 0, 1, 1,
0.8768724, -1.010601, 0.3544514, 0.9607843, 0, 1, 1,
0.8835629, -0.2776096, 2.149166, 0.9686275, 0, 1, 1,
0.8858323, -0.6930022, 1.307825, 0.972549, 0, 1, 1,
0.886864, -0.7268736, 3.436879, 0.9803922, 0, 1, 1,
0.8956739, -0.2685296, 2.193817, 0.9843137, 0, 1, 1,
0.8960621, 1.269102, -0.159969, 0.9921569, 0, 1, 1,
0.8980336, 0.1709472, 0.650364, 0.9960784, 0, 1, 1,
0.9007872, 0.6053395, -0.3196487, 1, 0, 0.9960784, 1,
0.9028864, -0.05469962, 1.145948, 1, 0, 0.9882353, 1,
0.904248, 0.2156221, 0.773495, 1, 0, 0.9843137, 1,
0.9051905, 0.04267688, 0.9668586, 1, 0, 0.9764706, 1,
0.9116692, 0.1549901, 0.589779, 1, 0, 0.972549, 1,
0.9171824, -1.653073, 2.144504, 1, 0, 0.9647059, 1,
0.9174919, -0.1258402, 3.448751, 1, 0, 0.9607843, 1,
0.9195944, 0.7059815, 2.895655, 1, 0, 0.9529412, 1,
0.9243575, 0.6874725, 1.486486, 1, 0, 0.9490196, 1,
0.9252595, -1.091397, 2.837077, 1, 0, 0.9411765, 1,
0.9303025, -0.4447149, 2.821131, 1, 0, 0.9372549, 1,
0.9325876, -1.976639, 4.144366, 1, 0, 0.9294118, 1,
0.9344524, 0.283717, -0.8575991, 1, 0, 0.9254902, 1,
0.9368192, -0.02829239, 0.9936216, 1, 0, 0.9176471, 1,
0.9369941, 0.8811755, 1.349676, 1, 0, 0.9137255, 1,
0.9384065, 0.7306094, 1.19946, 1, 0, 0.9058824, 1,
0.9405562, -2.462962, 3.176272, 1, 0, 0.9019608, 1,
0.9508272, -0.439685, 3.265868, 1, 0, 0.8941177, 1,
0.9512623, 0.6143279, 0.4895399, 1, 0, 0.8862745, 1,
0.9516674, 0.6054935, 0.4703766, 1, 0, 0.8823529, 1,
0.958092, 1.985905, -0.05607045, 1, 0, 0.8745098, 1,
0.9593093, 1.952515, 0.6816874, 1, 0, 0.8705882, 1,
0.9627623, 0.6154908, 0.50906, 1, 0, 0.8627451, 1,
0.9678679, -0.3246315, 0.467161, 1, 0, 0.8588235, 1,
0.9760835, -0.04928041, 0.3833878, 1, 0, 0.8509804, 1,
0.9862007, 0.1233498, 2.596926, 1, 0, 0.8470588, 1,
0.9921121, -1.29028, 2.320566, 1, 0, 0.8392157, 1,
1.001854, -0.7549075, 2.346575, 1, 0, 0.8352941, 1,
1.003277, -1.300164, 0.7211644, 1, 0, 0.827451, 1,
1.00699, 0.008119908, 2.24366, 1, 0, 0.8235294, 1,
1.008093, 0.6041484, 2.429306, 1, 0, 0.8156863, 1,
1.009117, 0.4277651, 1.382766, 1, 0, 0.8117647, 1,
1.009887, 1.876808, 1.180685, 1, 0, 0.8039216, 1,
1.010206, 0.8047233, 2.072973, 1, 0, 0.7960784, 1,
1.023076, 0.2816623, 1.936675, 1, 0, 0.7921569, 1,
1.02472, 0.2314115, 0.4686554, 1, 0, 0.7843137, 1,
1.026116, 1.132707, 2.175383, 1, 0, 0.7803922, 1,
1.032658, -0.8573323, 2.78326, 1, 0, 0.772549, 1,
1.048762, -0.4139936, 3.426305, 1, 0, 0.7686275, 1,
1.060871, 0.3035991, 2.263572, 1, 0, 0.7607843, 1,
1.062362, -1.874318, 2.073863, 1, 0, 0.7568628, 1,
1.066233, 1.689026, 0.3538007, 1, 0, 0.7490196, 1,
1.067003, -0.4408711, 1.808493, 1, 0, 0.7450981, 1,
1.067341, -0.8487399, 1.866141, 1, 0, 0.7372549, 1,
1.079407, 1.245577, 0.3329088, 1, 0, 0.7333333, 1,
1.081738, 0.04777497, 1.140357, 1, 0, 0.7254902, 1,
1.088537, -0.4918581, 0.9606385, 1, 0, 0.7215686, 1,
1.091348, -0.2799574, 2.827409, 1, 0, 0.7137255, 1,
1.092647, -0.9702184, 3.148083, 1, 0, 0.7098039, 1,
1.112197, -0.1885379, 0.449121, 1, 0, 0.7019608, 1,
1.125551, 0.292911, 0.4944791, 1, 0, 0.6941177, 1,
1.127688, -0.6559073, 1.722872, 1, 0, 0.6901961, 1,
1.142737, -0.5298925, 1.837747, 1, 0, 0.682353, 1,
1.142751, 0.4721998, 1.372442, 1, 0, 0.6784314, 1,
1.146253, 1.760746, 0.02143228, 1, 0, 0.6705883, 1,
1.14825, 1.813108, -0.1884341, 1, 0, 0.6666667, 1,
1.15953, 0.9557952, 1.821488, 1, 0, 0.6588235, 1,
1.177125, -1.314948, 2.933656, 1, 0, 0.654902, 1,
1.177921, -0.02242838, -0.5885079, 1, 0, 0.6470588, 1,
1.178681, -0.7517953, 1.996716, 1, 0, 0.6431373, 1,
1.186988, 0.2216291, 3.517703, 1, 0, 0.6352941, 1,
1.196021, -0.1806826, 2.105288, 1, 0, 0.6313726, 1,
1.200684, -1.112193, 1.356273, 1, 0, 0.6235294, 1,
1.204658, -1.118946, 1.870461, 1, 0, 0.6196079, 1,
1.209866, -1.13706, 3.577885, 1, 0, 0.6117647, 1,
1.211617, 0.09418967, 2.720206, 1, 0, 0.6078432, 1,
1.213016, -0.2064819, 2.314955, 1, 0, 0.6, 1,
1.21328, -0.1012185, 0.7071608, 1, 0, 0.5921569, 1,
1.218081, -0.8234918, 1.703619, 1, 0, 0.5882353, 1,
1.225193, 0.2547196, 0.9480664, 1, 0, 0.5803922, 1,
1.227658, 1.057833, 1.313455, 1, 0, 0.5764706, 1,
1.227684, -1.399221, 2.536134, 1, 0, 0.5686275, 1,
1.23119, 0.7109622, -0.7441394, 1, 0, 0.5647059, 1,
1.240548, -1.513172, 1.487712, 1, 0, 0.5568628, 1,
1.246687, -0.5857893, 2.197134, 1, 0, 0.5529412, 1,
1.247163, 0.180231, 0.6639779, 1, 0, 0.5450981, 1,
1.25017, 0.2295352, 1.410095, 1, 0, 0.5411765, 1,
1.260438, -0.1221553, 0.1586668, 1, 0, 0.5333334, 1,
1.269876, -0.5701118, 1.673951, 1, 0, 0.5294118, 1,
1.273165, 1.054118, 0.9667043, 1, 0, 0.5215687, 1,
1.276904, -0.7588655, 0.4073196, 1, 0, 0.5176471, 1,
1.281175, 0.2097802, 2.182627, 1, 0, 0.509804, 1,
1.285148, -1.715536, 3.491992, 1, 0, 0.5058824, 1,
1.286264, -0.2427797, 1.754693, 1, 0, 0.4980392, 1,
1.28836, 1.035339, -0.1269859, 1, 0, 0.4901961, 1,
1.296091, -1.632466, 2.58745, 1, 0, 0.4862745, 1,
1.298952, 0.9248022, 0.1637507, 1, 0, 0.4784314, 1,
1.316306, 0.2898372, 1.768889, 1, 0, 0.4745098, 1,
1.318918, 1.037897, 1.253999, 1, 0, 0.4666667, 1,
1.33251, -0.05048128, 1.231919, 1, 0, 0.4627451, 1,
1.333237, 1.38819, 2.887532, 1, 0, 0.454902, 1,
1.342181, -0.3209918, 2.202426, 1, 0, 0.4509804, 1,
1.342739, -0.2848967, 1.60257, 1, 0, 0.4431373, 1,
1.345764, -0.04568618, 0.234242, 1, 0, 0.4392157, 1,
1.354104, -0.4357617, 2.821403, 1, 0, 0.4313726, 1,
1.374063, 0.3303196, 2.830506, 1, 0, 0.427451, 1,
1.377679, -1.310846, 1.901218, 1, 0, 0.4196078, 1,
1.382292, 0.5319133, 1.447492, 1, 0, 0.4156863, 1,
1.397053, -0.2265358, 2.577017, 1, 0, 0.4078431, 1,
1.402241, 0.6225657, 1.28431, 1, 0, 0.4039216, 1,
1.415206, -1.219079, 2.606764, 1, 0, 0.3960784, 1,
1.420895, 0.4476475, 1.552957, 1, 0, 0.3882353, 1,
1.445118, -0.393851, 0.09507428, 1, 0, 0.3843137, 1,
1.467967, 0.9852955, 1.716187, 1, 0, 0.3764706, 1,
1.468517, 1.516481, 1.449366, 1, 0, 0.372549, 1,
1.477746, -0.3914905, 0.7941159, 1, 0, 0.3647059, 1,
1.485377, -0.5180687, 1.336165, 1, 0, 0.3607843, 1,
1.498315, 0.2389584, 2.184113, 1, 0, 0.3529412, 1,
1.501763, -0.6869119, 1.148743, 1, 0, 0.3490196, 1,
1.506216, 1.720237, 0.9454933, 1, 0, 0.3411765, 1,
1.508551, -0.00448942, 1.390155, 1, 0, 0.3372549, 1,
1.527132, 0.02864417, 0.703128, 1, 0, 0.3294118, 1,
1.549467, 0.9338752, 0.360669, 1, 0, 0.3254902, 1,
1.600553, -1.249988, 2.07181, 1, 0, 0.3176471, 1,
1.607339, 2.30856, 0.3202095, 1, 0, 0.3137255, 1,
1.61178, -0.2419748, 3.163599, 1, 0, 0.3058824, 1,
1.619908, 0.02058329, -0.2238437, 1, 0, 0.2980392, 1,
1.623269, 0.8423738, 2.573281, 1, 0, 0.2941177, 1,
1.628665, -0.4761964, 0.2951154, 1, 0, 0.2862745, 1,
1.633816, 0.5744124, 1.479621, 1, 0, 0.282353, 1,
1.652885, -0.4554677, 2.222842, 1, 0, 0.2745098, 1,
1.677308, -0.8531278, 0.8400381, 1, 0, 0.2705882, 1,
1.711632, 1.139492, 1.708175, 1, 0, 0.2627451, 1,
1.722261, 0.1242223, 2.388888, 1, 0, 0.2588235, 1,
1.736583, 1.997013, 0.568626, 1, 0, 0.2509804, 1,
1.738148, 1.676064, 1.88325, 1, 0, 0.2470588, 1,
1.744336, -0.6725205, 0.8440937, 1, 0, 0.2392157, 1,
1.746265, -0.005782811, 2.022242, 1, 0, 0.2352941, 1,
1.761913, -1.548938, 1.195576, 1, 0, 0.227451, 1,
1.768312, 1.6235, 0.9960886, 1, 0, 0.2235294, 1,
1.778301, -0.9124992, 4.267215, 1, 0, 0.2156863, 1,
1.780847, 0.4657679, 1.644715, 1, 0, 0.2117647, 1,
1.780921, -0.5230863, 2.216325, 1, 0, 0.2039216, 1,
1.784065, 0.08864036, 2.188908, 1, 0, 0.1960784, 1,
1.787476, -0.4807989, 0.7927094, 1, 0, 0.1921569, 1,
1.802192, -1.82736, 3.312392, 1, 0, 0.1843137, 1,
1.808923, -0.2176713, 2.236617, 1, 0, 0.1803922, 1,
1.880101, -1.56906, 0.8625555, 1, 0, 0.172549, 1,
1.881701, 0.8260653, 1.65392, 1, 0, 0.1686275, 1,
1.893593, 0.5577284, 1.83362, 1, 0, 0.1607843, 1,
1.911195, -1.316613, 1.943073, 1, 0, 0.1568628, 1,
1.917357, -0.2729752, 1.492226, 1, 0, 0.1490196, 1,
1.958062, 0.0973858, 0.1714701, 1, 0, 0.145098, 1,
1.96691, 0.6443437, 0.8345823, 1, 0, 0.1372549, 1,
1.972745, 1.400163, -0.3063749, 1, 0, 0.1333333, 1,
1.981048, 0.0779807, 1.403301, 1, 0, 0.1254902, 1,
2.044096, 0.1317396, 2.97041, 1, 0, 0.1215686, 1,
2.049289, 0.160217, 1.21298, 1, 0, 0.1137255, 1,
2.076579, -0.6181189, 3.058328, 1, 0, 0.1098039, 1,
2.099643, -0.7168907, 1.676094, 1, 0, 0.1019608, 1,
2.109797, 0.5475811, 1.254504, 1, 0, 0.09411765, 1,
2.12387, 0.2529721, 2.315161, 1, 0, 0.09019608, 1,
2.12421, 0.1974766, 1.074998, 1, 0, 0.08235294, 1,
2.18683, 2.167532, 0.002047108, 1, 0, 0.07843138, 1,
2.191198, 0.6305277, 1.122254, 1, 0, 0.07058824, 1,
2.202068, 0.9082213, 2.472767, 1, 0, 0.06666667, 1,
2.249874, -0.3646671, 0.184379, 1, 0, 0.05882353, 1,
2.275693, 0.4430384, 0.7041497, 1, 0, 0.05490196, 1,
2.293284, -0.3124713, 1.839483, 1, 0, 0.04705882, 1,
2.35039, -2.213008, 1.707221, 1, 0, 0.04313726, 1,
2.383702, 1.52181, -0.5438658, 1, 0, 0.03529412, 1,
2.531695, -0.8787148, 1.199811, 1, 0, 0.03137255, 1,
2.540625, 0.7545254, 2.511126, 1, 0, 0.02352941, 1,
2.866019, -0.7317096, 1.658629, 1, 0, 0.01960784, 1,
3.091069, -0.477013, -0.1317483, 1, 0, 0.01176471, 1,
3.097424, 1.144369, -0.2360136, 1, 0, 0.007843138, 1
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
-0.1497875, -4.572114, -7.262543, 0, -0.5, 0.5, 0.5,
-0.1497875, -4.572114, -7.262543, 1, -0.5, 0.5, 0.5,
-0.1497875, -4.572114, -7.262543, 1, 1.5, 0.5, 0.5,
-0.1497875, -4.572114, -7.262543, 0, 1.5, 0.5, 0.5
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
-4.497803, -0.05483329, -7.262543, 0, -0.5, 0.5, 0.5,
-4.497803, -0.05483329, -7.262543, 1, -0.5, 0.5, 0.5,
-4.497803, -0.05483329, -7.262543, 1, 1.5, 0.5, 0.5,
-4.497803, -0.05483329, -7.262543, 0, 1.5, 0.5, 0.5
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
-4.497803, -4.572114, 0.02228594, 0, -0.5, 0.5, 0.5,
-4.497803, -4.572114, 0.02228594, 1, -0.5, 0.5, 0.5,
-4.497803, -4.572114, 0.02228594, 1, 1.5, 0.5, 0.5,
-4.497803, -4.572114, 0.02228594, 0, 1.5, 0.5, 0.5
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
-3, -3.529664, -5.581429,
3, -3.529664, -5.581429,
-3, -3.529664, -5.581429,
-3, -3.703406, -5.861614,
-2, -3.529664, -5.581429,
-2, -3.703406, -5.861614,
-1, -3.529664, -5.581429,
-1, -3.703406, -5.861614,
0, -3.529664, -5.581429,
0, -3.703406, -5.861614,
1, -3.529664, -5.581429,
1, -3.703406, -5.861614,
2, -3.529664, -5.581429,
2, -3.703406, -5.861614,
3, -3.529664, -5.581429,
3, -3.703406, -5.861614
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
-3, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
-3, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
-3, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
-3, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5,
-2, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
-2, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
-2, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
-2, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5,
-1, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
-1, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
-1, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
-1, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5,
0, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
0, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
0, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
0, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5,
1, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
1, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
1, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
1, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5,
2, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
2, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
2, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
2, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5,
3, -4.050889, -6.421986, 0, -0.5, 0.5, 0.5,
3, -4.050889, -6.421986, 1, -0.5, 0.5, 0.5,
3, -4.050889, -6.421986, 1, 1.5, 0.5, 0.5,
3, -4.050889, -6.421986, 0, 1.5, 0.5, 0.5
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
-3.494415, -3, -5.581429,
-3.494415, 3, -5.581429,
-3.494415, -3, -5.581429,
-3.661646, -3, -5.861614,
-3.494415, -2, -5.581429,
-3.661646, -2, -5.861614,
-3.494415, -1, -5.581429,
-3.661646, -1, -5.861614,
-3.494415, 0, -5.581429,
-3.661646, 0, -5.861614,
-3.494415, 1, -5.581429,
-3.661646, 1, -5.861614,
-3.494415, 2, -5.581429,
-3.661646, 2, -5.861614,
-3.494415, 3, -5.581429,
-3.661646, 3, -5.861614
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
-3.996109, -3, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, -3, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, -3, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, -3, -6.421986, 0, 1.5, 0.5, 0.5,
-3.996109, -2, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, -2, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, -2, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, -2, -6.421986, 0, 1.5, 0.5, 0.5,
-3.996109, -1, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, -1, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, -1, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, -1, -6.421986, 0, 1.5, 0.5, 0.5,
-3.996109, 0, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, 0, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, 0, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, 0, -6.421986, 0, 1.5, 0.5, 0.5,
-3.996109, 1, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, 1, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, 1, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, 1, -6.421986, 0, 1.5, 0.5, 0.5,
-3.996109, 2, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, 2, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, 2, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, 2, -6.421986, 0, 1.5, 0.5, 0.5,
-3.996109, 3, -6.421986, 0, -0.5, 0.5, 0.5,
-3.996109, 3, -6.421986, 1, -0.5, 0.5, 0.5,
-3.996109, 3, -6.421986, 1, 1.5, 0.5, 0.5,
-3.996109, 3, -6.421986, 0, 1.5, 0.5, 0.5
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
-3.494415, -3.529664, -4,
-3.494415, -3.529664, 4,
-3.494415, -3.529664, -4,
-3.661646, -3.703406, -4,
-3.494415, -3.529664, -2,
-3.661646, -3.703406, -2,
-3.494415, -3.529664, 0,
-3.661646, -3.703406, 0,
-3.494415, -3.529664, 2,
-3.661646, -3.703406, 2,
-3.494415, -3.529664, 4,
-3.661646, -3.703406, 4
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
-3.996109, -4.050889, -4, 0, -0.5, 0.5, 0.5,
-3.996109, -4.050889, -4, 1, -0.5, 0.5, 0.5,
-3.996109, -4.050889, -4, 1, 1.5, 0.5, 0.5,
-3.996109, -4.050889, -4, 0, 1.5, 0.5, 0.5,
-3.996109, -4.050889, -2, 0, -0.5, 0.5, 0.5,
-3.996109, -4.050889, -2, 1, -0.5, 0.5, 0.5,
-3.996109, -4.050889, -2, 1, 1.5, 0.5, 0.5,
-3.996109, -4.050889, -2, 0, 1.5, 0.5, 0.5,
-3.996109, -4.050889, 0, 0, -0.5, 0.5, 0.5,
-3.996109, -4.050889, 0, 1, -0.5, 0.5, 0.5,
-3.996109, -4.050889, 0, 1, 1.5, 0.5, 0.5,
-3.996109, -4.050889, 0, 0, 1.5, 0.5, 0.5,
-3.996109, -4.050889, 2, 0, -0.5, 0.5, 0.5,
-3.996109, -4.050889, 2, 1, -0.5, 0.5, 0.5,
-3.996109, -4.050889, 2, 1, 1.5, 0.5, 0.5,
-3.996109, -4.050889, 2, 0, 1.5, 0.5, 0.5,
-3.996109, -4.050889, 4, 0, -0.5, 0.5, 0.5,
-3.996109, -4.050889, 4, 1, -0.5, 0.5, 0.5,
-3.996109, -4.050889, 4, 1, 1.5, 0.5, 0.5,
-3.996109, -4.050889, 4, 0, 1.5, 0.5, 0.5
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
-3.494415, -3.529664, -5.581429,
-3.494415, 3.419998, -5.581429,
-3.494415, -3.529664, 5.626,
-3.494415, 3.419998, 5.626,
-3.494415, -3.529664, -5.581429,
-3.494415, -3.529664, 5.626,
-3.494415, 3.419998, -5.581429,
-3.494415, 3.419998, 5.626,
-3.494415, -3.529664, -5.581429,
3.19484, -3.529664, -5.581429,
-3.494415, -3.529664, 5.626,
3.19484, -3.529664, 5.626,
-3.494415, 3.419998, -5.581429,
3.19484, 3.419998, -5.581429,
-3.494415, 3.419998, 5.626,
3.19484, 3.419998, 5.626,
3.19484, -3.529664, -5.581429,
3.19484, 3.419998, -5.581429,
3.19484, -3.529664, 5.626,
3.19484, 3.419998, 5.626,
3.19484, -3.529664, -5.581429,
3.19484, -3.529664, 5.626,
3.19484, 3.419998, -5.581429,
3.19484, 3.419998, 5.626
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
var radius = 7.895881;
var distance = 35.12967;
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
mvMatrix.translate( 0.1497875, 0.05483329, -0.02228594 );
mvMatrix.scale( 1.276253, 1.228431, 0.7617431 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12967);
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
sulfite<-read.table("sulfite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfite$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfite' not found
```

```r
y<-sulfite$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfite' not found
```

```r
z<-sulfite$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfite' not found
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
-3.396999, 0.3961959, -2.888442, 0, 0, 1, 1, 1,
-2.846724, 0.4526344, -1.581963, 1, 0, 0, 1, 1,
-2.708949, 0.7881367, -0.6025619, 1, 0, 0, 1, 1,
-2.641793, 0.8372564, 0.2968042, 1, 0, 0, 1, 1,
-2.564661, -1.1757, -0.9270438, 1, 0, 0, 1, 1,
-2.501397, -0.4218189, -0.3837128, 1, 0, 0, 1, 1,
-2.468847, -0.1768616, -1.968778, 0, 0, 0, 1, 1,
-2.453541, 1.056593, -2.371502, 0, 0, 0, 1, 1,
-2.439977, -0.6072573, -2.260542, 0, 0, 0, 1, 1,
-2.344312, 1.02196, -2.425678, 0, 0, 0, 1, 1,
-2.313586, -2.531114, -0.4532014, 0, 0, 0, 1, 1,
-2.272696, 0.9554714, -0.8410826, 0, 0, 0, 1, 1,
-2.262601, -0.5197299, -3.012613, 0, 0, 0, 1, 1,
-2.228135, 0.348088, -2.068238, 1, 1, 1, 1, 1,
-2.191491, -0.3395562, -4.268501, 1, 1, 1, 1, 1,
-2.181042, -0.1057641, -2.422481, 1, 1, 1, 1, 1,
-2.161904, -1.143168, -3.246913, 1, 1, 1, 1, 1,
-2.158333, 0.6270592, 0.362343, 1, 1, 1, 1, 1,
-2.155455, 0.4578772, -1.503288, 1, 1, 1, 1, 1,
-2.097144, 0.7023542, -2.833718, 1, 1, 1, 1, 1,
-2.090116, 1.90811, -1.360982, 1, 1, 1, 1, 1,
-2.061271, 0.7234243, -1.431326, 1, 1, 1, 1, 1,
-2.031339, 0.3649046, -0.3507793, 1, 1, 1, 1, 1,
-2.024384, -0.147016, -1.819003, 1, 1, 1, 1, 1,
-1.994296, -0.352376, -2.268631, 1, 1, 1, 1, 1,
-1.993691, 0.2275878, -1.591087, 1, 1, 1, 1, 1,
-1.981896, -0.7500476, -1.356561, 1, 1, 1, 1, 1,
-1.964898, 1.021, 0.700855, 1, 1, 1, 1, 1,
-1.960353, 1.559282, 0.5305212, 0, 0, 1, 1, 1,
-1.959847, -0.2238023, -1.632765, 1, 0, 0, 1, 1,
-1.917119, 0.5261709, -0.3899611, 1, 0, 0, 1, 1,
-1.889994, 0.3867371, -1.745335, 1, 0, 0, 1, 1,
-1.861111, 0.1467408, -2.481785, 1, 0, 0, 1, 1,
-1.819462, -0.7910654, -1.468142, 1, 0, 0, 1, 1,
-1.813753, 2.149188, 0.1128558, 0, 0, 0, 1, 1,
-1.788097, 0.7046316, -2.147153, 0, 0, 0, 1, 1,
-1.784267, 0.01403538, -3.44303, 0, 0, 0, 1, 1,
-1.766471, -1.022178, -2.529805, 0, 0, 0, 1, 1,
-1.715466, -1.056254, -3.277784, 0, 0, 0, 1, 1,
-1.707085, -1.869089, -2.301692, 0, 0, 0, 1, 1,
-1.698027, -1.390281, -2.359162, 0, 0, 0, 1, 1,
-1.695804, -1.042703, -3.09144, 1, 1, 1, 1, 1,
-1.690584, 0.843963, 0.8569088, 1, 1, 1, 1, 1,
-1.68568, -0.5491101, -1.376535, 1, 1, 1, 1, 1,
-1.667058, 0.775192, -2.54785, 1, 1, 1, 1, 1,
-1.665933, -2.783285, -4.323065, 1, 1, 1, 1, 1,
-1.653271, 0.5715936, -2.148857, 1, 1, 1, 1, 1,
-1.619951, 0.3090084, -2.494821, 1, 1, 1, 1, 1,
-1.607705, -0.162831, -1.499012, 1, 1, 1, 1, 1,
-1.598272, 0.7392421, -1.52273, 1, 1, 1, 1, 1,
-1.577684, 1.282691, 1.109967, 1, 1, 1, 1, 1,
-1.577572, 1.147248, -0.9439104, 1, 1, 1, 1, 1,
-1.550582, 0.08937382, -0.4413275, 1, 1, 1, 1, 1,
-1.547475, 0.4045455, -1.758081, 1, 1, 1, 1, 1,
-1.537174, -1.849293, -2.651458, 1, 1, 1, 1, 1,
-1.530227, 0.6925027, -0.6706999, 1, 1, 1, 1, 1,
-1.530227, -0.1502723, -1.042251, 0, 0, 1, 1, 1,
-1.522001, 0.8353466, -1.83491, 1, 0, 0, 1, 1,
-1.515594, 0.997068, 0.2485501, 1, 0, 0, 1, 1,
-1.505737, -0.4990897, -1.319526, 1, 0, 0, 1, 1,
-1.505713, -1.132641, -2.007453, 1, 0, 0, 1, 1,
-1.505324, -0.7707166, -1.351874, 1, 0, 0, 1, 1,
-1.487881, -0.4953917, -1.235679, 0, 0, 0, 1, 1,
-1.483579, -0.0775919, -1.20965, 0, 0, 0, 1, 1,
-1.479059, -0.06822808, -0.9603373, 0, 0, 0, 1, 1,
-1.471228, 1.093898, -0.4666951, 0, 0, 0, 1, 1,
-1.465414, 1.929963, -1.940846, 0, 0, 0, 1, 1,
-1.45256, -0.04838076, -0.4459984, 0, 0, 0, 1, 1,
-1.444435, 0.9269323, 0.09788076, 0, 0, 0, 1, 1,
-1.443522, 0.05171045, -1.658118, 1, 1, 1, 1, 1,
-1.442454, 0.02809914, -3.27236, 1, 1, 1, 1, 1,
-1.433185, -1.130425, -3.085922, 1, 1, 1, 1, 1,
-1.431292, 1.31541, -4.158017, 1, 1, 1, 1, 1,
-1.412374, 0.1642445, -0.713988, 1, 1, 1, 1, 1,
-1.412355, -0.5435875, -2.683736, 1, 1, 1, 1, 1,
-1.411594, -0.08695441, -0.9520598, 1, 1, 1, 1, 1,
-1.382257, -0.5654437, -1.030058, 1, 1, 1, 1, 1,
-1.382, 1.086868, 0.2361582, 1, 1, 1, 1, 1,
-1.377879, -2.505117, -2.069093, 1, 1, 1, 1, 1,
-1.373801, 1.786932, 0.4707898, 1, 1, 1, 1, 1,
-1.373153, 0.8249994, -1.08417, 1, 1, 1, 1, 1,
-1.36887, -0.05236036, -1.768952, 1, 1, 1, 1, 1,
-1.366598, -1.140685, -1.917259, 1, 1, 1, 1, 1,
-1.352769, 1.151318, -0.5381826, 1, 1, 1, 1, 1,
-1.350769, 1.524424, -0.2551813, 0, 0, 1, 1, 1,
-1.332443, -0.2107357, -1.639889, 1, 0, 0, 1, 1,
-1.330574, -0.240572, -0.1699746, 1, 0, 0, 1, 1,
-1.317918, 0.3657566, -1.038844, 1, 0, 0, 1, 1,
-1.317293, 1.066757, -0.5472945, 1, 0, 0, 1, 1,
-1.316615, 1.752059, -1.043106, 1, 0, 0, 1, 1,
-1.31092, -0.6345067, -4.241376, 0, 0, 0, 1, 1,
-1.309265, 0.2104772, -1.787026, 0, 0, 0, 1, 1,
-1.295478, 1.302385, 0.09013221, 0, 0, 0, 1, 1,
-1.292457, 0.02057503, -1.014221, 0, 0, 0, 1, 1,
-1.292318, 0.01750366, -1.712516, 0, 0, 0, 1, 1,
-1.281751, -0.1042906, -0.8338991, 0, 0, 0, 1, 1,
-1.277864, -1.850512, -4.427332, 0, 0, 0, 1, 1,
-1.264891, -0.7311782, -2.625216, 1, 1, 1, 1, 1,
-1.263493, 1.220062, -1.845704, 1, 1, 1, 1, 1,
-1.26016, 2.214786, 0.3615028, 1, 1, 1, 1, 1,
-1.258191, -0.9356813, -2.057881, 1, 1, 1, 1, 1,
-1.245719, 0.3374061, -2.779765, 1, 1, 1, 1, 1,
-1.240156, -0.1216533, -4.132756, 1, 1, 1, 1, 1,
-1.231667, 0.2029385, -0.007011815, 1, 1, 1, 1, 1,
-1.229546, -1.525456, -2.990429, 1, 1, 1, 1, 1,
-1.225229, 0.3627892, -2.754292, 1, 1, 1, 1, 1,
-1.224963, 1.244596, -1.260263, 1, 1, 1, 1, 1,
-1.219414, 1.298556, -0.8420263, 1, 1, 1, 1, 1,
-1.215966, 1.022452, 0.3180258, 1, 1, 1, 1, 1,
-1.1997, -0.3374786, -2.031912, 1, 1, 1, 1, 1,
-1.189493, -0.4613942, -2.80776, 1, 1, 1, 1, 1,
-1.181849, 1.964122, 0.2412403, 1, 1, 1, 1, 1,
-1.170384, 0.08765164, 0.01218503, 0, 0, 1, 1, 1,
-1.161478, -0.1501987, -3.126503, 1, 0, 0, 1, 1,
-1.145271, -1.900772, -1.899686, 1, 0, 0, 1, 1,
-1.144491, -0.9187649, -1.21439, 1, 0, 0, 1, 1,
-1.143418, -1.129535, -1.395018, 1, 0, 0, 1, 1,
-1.133153, -2.214913, -4.297322, 1, 0, 0, 1, 1,
-1.131429, 1.561055, -1.891827, 0, 0, 0, 1, 1,
-1.125754, -1.745406, -2.62235, 0, 0, 0, 1, 1,
-1.124133, 0.4992027, -0.4531915, 0, 0, 0, 1, 1,
-1.12349, 1.888558, -1.467698, 0, 0, 0, 1, 1,
-1.120937, 1.375737, 0.576957, 0, 0, 0, 1, 1,
-1.117384, -0.9236615, -1.440268, 0, 0, 0, 1, 1,
-1.103285, 0.151295, -1.535099, 0, 0, 0, 1, 1,
-1.099363, 0.04943464, -0.6518136, 1, 1, 1, 1, 1,
-1.096479, -0.2394172, -1.217199, 1, 1, 1, 1, 1,
-1.096048, 0.7671229, -1.870777, 1, 1, 1, 1, 1,
-1.093921, -0.3284621, -1.570303, 1, 1, 1, 1, 1,
-1.092643, 1.418126, -1.308035, 1, 1, 1, 1, 1,
-1.086732, -0.2791381, -3.618868, 1, 1, 1, 1, 1,
-1.083609, -0.456531, -1.069952, 1, 1, 1, 1, 1,
-1.081911, 1.508251, -0.6078188, 1, 1, 1, 1, 1,
-1.081239, 0.2970572, -1.279134, 1, 1, 1, 1, 1,
-1.07958, 0.4137012, 0.7913336, 1, 1, 1, 1, 1,
-1.061572, -0.2396071, -2.480961, 1, 1, 1, 1, 1,
-1.057114, 0.1462483, -1.142459, 1, 1, 1, 1, 1,
-1.054581, 0.8388362, 0.452359, 1, 1, 1, 1, 1,
-1.052325, -0.4552361, -1.364187, 1, 1, 1, 1, 1,
-1.049025, 0.4726238, -1.947078, 1, 1, 1, 1, 1,
-1.041594, -0.5726922, -1.605728, 0, 0, 1, 1, 1,
-1.037945, -1.178431, -3.593443, 1, 0, 0, 1, 1,
-1.037608, -0.4276504, 0.1069978, 1, 0, 0, 1, 1,
-1.037144, -0.2060144, -1.124439, 1, 0, 0, 1, 1,
-1.03704, -1.748017, -1.978922, 1, 0, 0, 1, 1,
-1.027058, 2.259506, -0.3265244, 1, 0, 0, 1, 1,
-1.026986, -0.6811035, -0.9538093, 0, 0, 0, 1, 1,
-1.025712, -0.2580626, -0.9535524, 0, 0, 0, 1, 1,
-1.016996, 0.7358693, -0.1680348, 0, 0, 0, 1, 1,
-1.010912, 0.03967483, 0.5678234, 0, 0, 0, 1, 1,
-1.005646, 1.550165, -1.540985, 0, 0, 0, 1, 1,
-1.001723, -0.9976963, -1.729502, 0, 0, 0, 1, 1,
-0.9974702, -0.2331913, -1.541558, 0, 0, 0, 1, 1,
-0.9960517, 1.807466, 0.3043068, 1, 1, 1, 1, 1,
-0.9960023, -0.2007078, -1.080454, 1, 1, 1, 1, 1,
-0.9882201, -0.05608023, -2.402984, 1, 1, 1, 1, 1,
-0.9881666, -0.3187147, -3.033515, 1, 1, 1, 1, 1,
-0.986199, -0.6673354, -2.797854, 1, 1, 1, 1, 1,
-0.9745122, -0.2128629, 1.190017, 1, 1, 1, 1, 1,
-0.9721053, 0.2870218, 0.2569019, 1, 1, 1, 1, 1,
-0.9609795, -0.004816448, -1.971824, 1, 1, 1, 1, 1,
-0.959793, 0.4544309, -1.557319, 1, 1, 1, 1, 1,
-0.9592025, 0.157849, -2.293459, 1, 1, 1, 1, 1,
-0.9521874, 0.7223865, -0.413294, 1, 1, 1, 1, 1,
-0.9477654, -1.342916, -1.605645, 1, 1, 1, 1, 1,
-0.9403313, 2.079988, -1.69316, 1, 1, 1, 1, 1,
-0.9354782, 0.7871163, -0.9788057, 1, 1, 1, 1, 1,
-0.9324484, 0.5692624, -1.556021, 1, 1, 1, 1, 1,
-0.9310228, -0.03377532, -1.065649, 0, 0, 1, 1, 1,
-0.9245871, -0.3694605, -0.3800646, 1, 0, 0, 1, 1,
-0.9224177, -0.9314153, -2.202085, 1, 0, 0, 1, 1,
-0.922031, -0.07766713, -0.5153721, 1, 0, 0, 1, 1,
-0.9179549, 1.268819, -0.4954807, 1, 0, 0, 1, 1,
-0.9161983, 0.2798804, 0.146464, 1, 0, 0, 1, 1,
-0.9153079, -0.5653728, -2.640895, 0, 0, 0, 1, 1,
-0.9047153, -0.6157193, -1.743334, 0, 0, 0, 1, 1,
-0.9013849, 1.380678, -2.874496, 0, 0, 0, 1, 1,
-0.9003496, -0.6888531, -2.526877, 0, 0, 0, 1, 1,
-0.8996668, -0.03476102, -2.051777, 0, 0, 0, 1, 1,
-0.8944526, 0.02292083, -1.780596, 0, 0, 0, 1, 1,
-0.8916451, -1.223525, -2.973234, 0, 0, 0, 1, 1,
-0.8840148, -0.2169147, 0.1816359, 1, 1, 1, 1, 1,
-0.8838218, -1.385764, -2.934357, 1, 1, 1, 1, 1,
-0.8833533, 0.6873174, -0.2687931, 1, 1, 1, 1, 1,
-0.8817456, 1.091047, 0.04425589, 1, 1, 1, 1, 1,
-0.8681843, -1.490122, -2.02478, 1, 1, 1, 1, 1,
-0.86419, -0.3372792, -0.8071574, 1, 1, 1, 1, 1,
-0.8588297, 0.1351844, -1.549507, 1, 1, 1, 1, 1,
-0.8537269, 0.407302, -0.5919722, 1, 1, 1, 1, 1,
-0.8492144, 0.7860681, -0.4004706, 1, 1, 1, 1, 1,
-0.8410592, -0.6089816, -1.861573, 1, 1, 1, 1, 1,
-0.8391851, -0.9240714, -2.234425, 1, 1, 1, 1, 1,
-0.8362701, 0.3824025, -0.3639853, 1, 1, 1, 1, 1,
-0.8279678, 0.08393231, -0.9946835, 1, 1, 1, 1, 1,
-0.8224618, 2.265176, 0.1962676, 1, 1, 1, 1, 1,
-0.8218248, 0.2746284, -1.670988, 1, 1, 1, 1, 1,
-0.821128, 0.7542736, 0.2311438, 0, 0, 1, 1, 1,
-0.8113729, 1.281884, -0.9198048, 1, 0, 0, 1, 1,
-0.8092493, -0.4328019, -0.5591232, 1, 0, 0, 1, 1,
-0.8049176, 1.137248, -1.097691, 1, 0, 0, 1, 1,
-0.8020937, 0.2579371, -1.674816, 1, 0, 0, 1, 1,
-0.7965063, -0.2121237, -1.339925, 1, 0, 0, 1, 1,
-0.7929538, -0.3985877, -4.051813, 0, 0, 0, 1, 1,
-0.788854, 0.08960654, -0.2658773, 0, 0, 0, 1, 1,
-0.7855506, -0.137991, -3.328286, 0, 0, 0, 1, 1,
-0.7847273, 0.3741394, -0.2036979, 0, 0, 0, 1, 1,
-0.7846413, 0.4457025, -1.9714, 0, 0, 0, 1, 1,
-0.7845345, -0.547015, -1.721511, 0, 0, 0, 1, 1,
-0.770682, 0.1796214, -0.7344633, 0, 0, 0, 1, 1,
-0.7677547, 2.518234, 0.6550335, 1, 1, 1, 1, 1,
-0.7669075, -0.5890532, -0.9970432, 1, 1, 1, 1, 1,
-0.7523673, 1.347231, 1.098538, 1, 1, 1, 1, 1,
-0.7476636, -0.4250107, -4.05511, 1, 1, 1, 1, 1,
-0.7447644, 1.182821, -1.132831, 1, 1, 1, 1, 1,
-0.7344273, 0.9059274, -1.607304, 1, 1, 1, 1, 1,
-0.7329674, -0.3716186, -2.117438, 1, 1, 1, 1, 1,
-0.7326544, -0.6046343, -2.619208, 1, 1, 1, 1, 1,
-0.7296391, -0.2693667, -0.07149155, 1, 1, 1, 1, 1,
-0.7262915, 2.254718, -0.004339379, 1, 1, 1, 1, 1,
-0.7211717, 0.112654, -1.866419, 1, 1, 1, 1, 1,
-0.7207921, -0.3849412, -2.828156, 1, 1, 1, 1, 1,
-0.711762, 0.6676088, -0.2202077, 1, 1, 1, 1, 1,
-0.705668, -1.574119, -2.578086, 1, 1, 1, 1, 1,
-0.7042361, 0.3665134, -1.342591, 1, 1, 1, 1, 1,
-0.7040347, -0.7953618, -2.464389, 0, 0, 1, 1, 1,
-0.7012057, 0.5824761, -0.3624137, 1, 0, 0, 1, 1,
-0.7009975, 1.481185, -1.273439, 1, 0, 0, 1, 1,
-0.7003934, 0.08131979, -2.438454, 1, 0, 0, 1, 1,
-0.6986308, -0.6884292, -2.565839, 1, 0, 0, 1, 1,
-0.6871088, 1.299682, 0.1036351, 1, 0, 0, 1, 1,
-0.6848552, 0.6430098, -1.012002, 0, 0, 0, 1, 1,
-0.6842256, 0.9420242, 1.293406, 0, 0, 0, 1, 1,
-0.6812699, 0.1899809, -2.143203, 0, 0, 0, 1, 1,
-0.6777517, 0.220146, -2.288547, 0, 0, 0, 1, 1,
-0.676955, -0.3689062, -2.626914, 0, 0, 0, 1, 1,
-0.6702927, 0.5579758, -1.566656, 0, 0, 0, 1, 1,
-0.6658641, -1.695459, -2.138813, 0, 0, 0, 1, 1,
-0.6657793, -1.599567, -2.714171, 1, 1, 1, 1, 1,
-0.6645809, -0.4221134, -2.741561, 1, 1, 1, 1, 1,
-0.6604706, -1.319282, -1.582438, 1, 1, 1, 1, 1,
-0.6573334, 1.572841, 0.3742519, 1, 1, 1, 1, 1,
-0.657171, -0.4763711, -2.534079, 1, 1, 1, 1, 1,
-0.6545089, -0.009675158, -1.297225, 1, 1, 1, 1, 1,
-0.6532739, -0.5836205, -1.069022, 1, 1, 1, 1, 1,
-0.6496274, -1.621618, -3.435873, 1, 1, 1, 1, 1,
-0.6469705, 2.761503, 0.3223291, 1, 1, 1, 1, 1,
-0.6456481, 0.1996032, -1.334618, 1, 1, 1, 1, 1,
-0.6422186, 2.303968, 0.1351118, 1, 1, 1, 1, 1,
-0.6389002, 1.602878, -0.0192733, 1, 1, 1, 1, 1,
-0.638025, -0.2411696, -2.124202, 1, 1, 1, 1, 1,
-0.6339244, -0.8309309, -2.445211, 1, 1, 1, 1, 1,
-0.6242462, 0.429208, -0.9822934, 1, 1, 1, 1, 1,
-0.6229782, 1.124474, -1.038742, 0, 0, 1, 1, 1,
-0.6220495, 1.255507, -2.226019, 1, 0, 0, 1, 1,
-0.6203319, 0.5443018, -2.055944, 1, 0, 0, 1, 1,
-0.6184234, -1.971893, -2.416808, 1, 0, 0, 1, 1,
-0.6068966, 0.5233647, -0.6067681, 1, 0, 0, 1, 1,
-0.6002346, -0.8052528, -2.63405, 1, 0, 0, 1, 1,
-0.5963576, 1.529113, -0.4199474, 0, 0, 0, 1, 1,
-0.5948071, 1.535385, -1.144263, 0, 0, 0, 1, 1,
-0.5916144, 0.01237207, -0.3183768, 0, 0, 0, 1, 1,
-0.589452, 1.273364, 0.540302, 0, 0, 0, 1, 1,
-0.5893518, -1.405272, -2.694404, 0, 0, 0, 1, 1,
-0.5875103, -0.3014292, -0.2857162, 0, 0, 0, 1, 1,
-0.5822259, 1.444157, -0.4445806, 0, 0, 0, 1, 1,
-0.5752034, 0.9089969, -0.9987394, 1, 1, 1, 1, 1,
-0.5727891, -1.342538, -1.635972, 1, 1, 1, 1, 1,
-0.5664769, -0.4307993, -2.917734, 1, 1, 1, 1, 1,
-0.5662509, -0.1571295, -1.495892, 1, 1, 1, 1, 1,
-0.5659353, 0.2461902, -1.724284, 1, 1, 1, 1, 1,
-0.5626288, 1.272704, -1.062403, 1, 1, 1, 1, 1,
-0.5622525, 0.3286618, -2.61208, 1, 1, 1, 1, 1,
-0.5590832, -0.13543, -1.411033, 1, 1, 1, 1, 1,
-0.552032, 0.02137498, -0.1094405, 1, 1, 1, 1, 1,
-0.5501037, 0.6054662, 0.7226612, 1, 1, 1, 1, 1,
-0.5495653, 2.625859, -0.3719261, 1, 1, 1, 1, 1,
-0.5488378, 1.069503, 0.5756816, 1, 1, 1, 1, 1,
-0.5416515, 0.9001211, -1.355517, 1, 1, 1, 1, 1,
-0.5412989, -1.147837, -1.925925, 1, 1, 1, 1, 1,
-0.5411606, -1.566388, -3.0484, 1, 1, 1, 1, 1,
-0.5392705, -0.5095881, -2.535792, 0, 0, 1, 1, 1,
-0.5355983, -0.4761364, -2.720882, 1, 0, 0, 1, 1,
-0.5333892, 0.1092649, -0.7537588, 1, 0, 0, 1, 1,
-0.5313126, 1.583071, -0.3969653, 1, 0, 0, 1, 1,
-0.5265867, -0.3749281, -2.429641, 1, 0, 0, 1, 1,
-0.5252067, -0.885452, -4.133093, 1, 0, 0, 1, 1,
-0.5208479, -0.2562414, -3.063673, 0, 0, 0, 1, 1,
-0.5184525, -0.3461671, -3.282882, 0, 0, 0, 1, 1,
-0.518118, -0.8079651, -3.179491, 0, 0, 0, 1, 1,
-0.517351, 0.6399161, -1.522376, 0, 0, 0, 1, 1,
-0.5165317, -0.08190754, -2.271471, 0, 0, 0, 1, 1,
-0.5146875, -0.06273573, -1.609246, 0, 0, 0, 1, 1,
-0.5146015, 1.185184, -1.241221, 0, 0, 0, 1, 1,
-0.5112676, 0.4147914, -0.895855, 1, 1, 1, 1, 1,
-0.5103815, 0.290915, -2.269844, 1, 1, 1, 1, 1,
-0.5079689, -1.061226, -2.011064, 1, 1, 1, 1, 1,
-0.5045934, 1.153383, -0.8053075, 1, 1, 1, 1, 1,
-0.5010086, 1.611131, -0.7697625, 1, 1, 1, 1, 1,
-0.4979271, 1.123359, -1.729834, 1, 1, 1, 1, 1,
-0.493995, -0.1656483, -1.830142, 1, 1, 1, 1, 1,
-0.4937746, -1.415525, -4.44122, 1, 1, 1, 1, 1,
-0.4932159, -0.1326855, -1.331976, 1, 1, 1, 1, 1,
-0.4900675, 1.062513, 0.3029937, 1, 1, 1, 1, 1,
-0.4849133, -0.773666, -1.811807, 1, 1, 1, 1, 1,
-0.480925, 0.5380749, -2.024588, 1, 1, 1, 1, 1,
-0.4799259, 0.8909701, -0.5059835, 1, 1, 1, 1, 1,
-0.4746175, 0.2145987, -1.884192, 1, 1, 1, 1, 1,
-0.4716193, 1.190053, -0.4450717, 1, 1, 1, 1, 1,
-0.4707564, 0.2151889, -0.7737525, 0, 0, 1, 1, 1,
-0.4696652, 0.6255939, -2.39704, 1, 0, 0, 1, 1,
-0.464469, 0.7206379, 0.2802718, 1, 0, 0, 1, 1,
-0.4582111, 1.662802, -0.3475955, 1, 0, 0, 1, 1,
-0.4494553, -0.620599, -1.282692, 1, 0, 0, 1, 1,
-0.4455469, 0.1121522, -0.9360572, 1, 0, 0, 1, 1,
-0.4435449, -1.326037, -2.140675, 0, 0, 0, 1, 1,
-0.4423138, 1.384399, 0.5364673, 0, 0, 0, 1, 1,
-0.4402766, 0.9506393, 1.41403, 0, 0, 0, 1, 1,
-0.4400419, -0.2534199, -3.246798, 0, 0, 0, 1, 1,
-0.4328052, -0.3040985, -2.797796, 0, 0, 0, 1, 1,
-0.4277476, 1.085909, -2.732684, 0, 0, 0, 1, 1,
-0.4265777, -1.566163, -1.654791, 0, 0, 0, 1, 1,
-0.4249391, 0.2354583, -0.02357095, 1, 1, 1, 1, 1,
-0.42218, -0.00893198, -3.062376, 1, 1, 1, 1, 1,
-0.421902, 0.3711681, -1.064665, 1, 1, 1, 1, 1,
-0.4199437, 0.4046632, -1.432744, 1, 1, 1, 1, 1,
-0.4162292, -1.008097, -1.054464, 1, 1, 1, 1, 1,
-0.4093408, 0.4750602, -1.730844, 1, 1, 1, 1, 1,
-0.4092325, 0.2427625, -0.9771467, 1, 1, 1, 1, 1,
-0.4087144, -1.645771, -2.636905, 1, 1, 1, 1, 1,
-0.4078339, 0.6160197, 0.5414031, 1, 1, 1, 1, 1,
-0.4060248, -2.152411, -1.341774, 1, 1, 1, 1, 1,
-0.4048773, 0.0967145, -1.477924, 1, 1, 1, 1, 1,
-0.404087, 0.9764729, 1.149625, 1, 1, 1, 1, 1,
-0.4040434, 0.7528004, -1.276088, 1, 1, 1, 1, 1,
-0.4009873, 1.043412, -0.03035926, 1, 1, 1, 1, 1,
-0.4008146, 0.8887994, -0.5966535, 1, 1, 1, 1, 1,
-0.4002444, -0.8538963, -1.699104, 0, 0, 1, 1, 1,
-0.397548, 0.7332555, -2.379171, 1, 0, 0, 1, 1,
-0.3934857, 0.5566839, 0.4043654, 1, 0, 0, 1, 1,
-0.3930437, -1.602396, -3.790308, 1, 0, 0, 1, 1,
-0.392714, -1.867964, -1.176269, 1, 0, 0, 1, 1,
-0.3891654, -1.061214, -2.40843, 1, 0, 0, 1, 1,
-0.3883365, -0.02571202, -2.685469, 0, 0, 0, 1, 1,
-0.3842848, 1.456877, 1.227163, 0, 0, 0, 1, 1,
-0.3825501, 0.6960823, -1.336564, 0, 0, 0, 1, 1,
-0.3806791, -1.748172, -2.480969, 0, 0, 0, 1, 1,
-0.3725112, -0.6021711, -3.250527, 0, 0, 0, 1, 1,
-0.3683267, -0.5307397, -3.912529, 0, 0, 0, 1, 1,
-0.3681807, -0.2548396, -1.634739, 0, 0, 0, 1, 1,
-0.3648264, -1.272526, -2.226307, 1, 1, 1, 1, 1,
-0.3577032, 0.5148239, -0.7967395, 1, 1, 1, 1, 1,
-0.3574278, 1.416456, 0.455478, 1, 1, 1, 1, 1,
-0.3566055, -1.271308, -3.989658, 1, 1, 1, 1, 1,
-0.3544834, -0.644247, -1.447375, 1, 1, 1, 1, 1,
-0.3536027, -1.041474, -3.417961, 1, 1, 1, 1, 1,
-0.3528781, -1.712633, -3.338585, 1, 1, 1, 1, 1,
-0.3528146, 0.3151538, -1.291064, 1, 1, 1, 1, 1,
-0.3481791, -0.1822482, -0.8704348, 1, 1, 1, 1, 1,
-0.3436945, -0.1313667, -2.05456, 1, 1, 1, 1, 1,
-0.3414005, -1.176806, -4.003661, 1, 1, 1, 1, 1,
-0.3382519, 0.2021415, -2.028293, 1, 1, 1, 1, 1,
-0.3365375, 1.068341, -0.7887678, 1, 1, 1, 1, 1,
-0.3310803, 0.5406306, 0.4402226, 1, 1, 1, 1, 1,
-0.3305666, -0.4623895, -2.197779, 1, 1, 1, 1, 1,
-0.3237156, -1.088145, -3.765008, 0, 0, 1, 1, 1,
-0.3185731, 0.449132, -1.338861, 1, 0, 0, 1, 1,
-0.3115954, 1.081363, -1.026161, 1, 0, 0, 1, 1,
-0.3106157, -0.961085, -3.834738, 1, 0, 0, 1, 1,
-0.3102798, -0.3980154, -2.667126, 1, 0, 0, 1, 1,
-0.3086267, -1.534814, -2.164793, 1, 0, 0, 1, 1,
-0.3084723, 0.7999631, 0.7996194, 0, 0, 0, 1, 1,
-0.3027903, -0.9894309, -2.78252, 0, 0, 0, 1, 1,
-0.2986328, -2.225262, -1.788628, 0, 0, 0, 1, 1,
-0.2941486, -2.170422, -4.252036, 0, 0, 0, 1, 1,
-0.2895634, 0.460671, -1.092294, 0, 0, 0, 1, 1,
-0.2844953, -0.5379317, -3.789193, 0, 0, 0, 1, 1,
-0.2829014, -0.5730065, -2.210029, 0, 0, 0, 1, 1,
-0.2824791, 0.1024859, 0.183049, 1, 1, 1, 1, 1,
-0.2780379, 0.07267287, -2.184508, 1, 1, 1, 1, 1,
-0.2779632, -0.5622535, -1.860272, 1, 1, 1, 1, 1,
-0.2763066, 0.1596094, -0.2647006, 1, 1, 1, 1, 1,
-0.2753911, -0.4566391, -3.241431, 1, 1, 1, 1, 1,
-0.2750537, -0.8260211, -2.36776, 1, 1, 1, 1, 1,
-0.2721229, -0.5683421, -2.172571, 1, 1, 1, 1, 1,
-0.2701508, -1.082541, -1.590436, 1, 1, 1, 1, 1,
-0.261777, -0.5199054, -2.62613, 1, 1, 1, 1, 1,
-0.2569912, -0.3939877, -1.847795, 1, 1, 1, 1, 1,
-0.2564146, -0.4732426, -3.478891, 1, 1, 1, 1, 1,
-0.255092, -0.2714649, -4.03848, 1, 1, 1, 1, 1,
-0.2522881, -0.2165592, -3.969362, 1, 1, 1, 1, 1,
-0.2492561, 0.01902736, -0.4901289, 1, 1, 1, 1, 1,
-0.2406024, -0.7585313, -3.728384, 1, 1, 1, 1, 1,
-0.240305, -0.2522309, -0.6890126, 0, 0, 1, 1, 1,
-0.2397096, 1.92946, -0.6441116, 1, 0, 0, 1, 1,
-0.2306421, -0.9768716, -2.438323, 1, 0, 0, 1, 1,
-0.2295997, -0.8513784, -2.45038, 1, 0, 0, 1, 1,
-0.2284296, 0.4307286, 0.08901994, 1, 0, 0, 1, 1,
-0.2275749, 0.2849416, 0.06392952, 1, 0, 0, 1, 1,
-0.2268147, 0.6328608, -0.8329126, 0, 0, 0, 1, 1,
-0.2235242, -1.451683, -4.706207, 0, 0, 0, 1, 1,
-0.2219771, 0.8489369, -0.9880107, 0, 0, 0, 1, 1,
-0.215292, 1.912731, -1.449437, 0, 0, 0, 1, 1,
-0.2149562, -0.8137158, -1.659518, 0, 0, 0, 1, 1,
-0.2131894, -1.161713, -4.283215, 0, 0, 0, 1, 1,
-0.206195, -1.139055, -2.569869, 0, 0, 0, 1, 1,
-0.2061317, -0.210869, -3.028935, 1, 1, 1, 1, 1,
-0.2051525, -0.1184944, -0.8636436, 1, 1, 1, 1, 1,
-0.205119, -0.7286219, -2.861166, 1, 1, 1, 1, 1,
-0.2004382, 0.5910417, -0.2317525, 1, 1, 1, 1, 1,
-0.1960152, -0.4983214, -2.856161, 1, 1, 1, 1, 1,
-0.1934791, -0.4442248, -3.80634, 1, 1, 1, 1, 1,
-0.1857155, -0.5585482, -3.045596, 1, 1, 1, 1, 1,
-0.1842957, -0.6126379, -5.047295, 1, 1, 1, 1, 1,
-0.1825003, 0.5785817, -0.8858965, 1, 1, 1, 1, 1,
-0.1823573, -1.894667, -1.92161, 1, 1, 1, 1, 1,
-0.1808972, 0.7231371, 0.8297789, 1, 1, 1, 1, 1,
-0.1739449, -0.6440684, -2.788584, 1, 1, 1, 1, 1,
-0.172427, -0.4163809, -1.689276, 1, 1, 1, 1, 1,
-0.1706122, -0.8672136, -3.965855, 1, 1, 1, 1, 1,
-0.1685728, 0.6476848, 0.237307, 1, 1, 1, 1, 1,
-0.1676979, 0.812255, -1.848772, 0, 0, 1, 1, 1,
-0.1656225, -0.1779932, -4.404288, 1, 0, 0, 1, 1,
-0.1636359, 0.6915841, 0.1568279, 1, 0, 0, 1, 1,
-0.1632424, -0.2097697, -2.675557, 1, 0, 0, 1, 1,
-0.1614914, -1.138382, -2.923008, 1, 0, 0, 1, 1,
-0.1604098, -0.6556604, -3.357924, 1, 0, 0, 1, 1,
-0.1600521, 0.3908064, 0.4861603, 0, 0, 0, 1, 1,
-0.1567398, -0.1111376, -1.305919, 0, 0, 0, 1, 1,
-0.1552036, -0.6040173, -2.685178, 0, 0, 0, 1, 1,
-0.1537186, -0.6459683, -2.252136, 0, 0, 0, 1, 1,
-0.152875, 0.5000175, -0.1532375, 0, 0, 0, 1, 1,
-0.1525988, 0.5552955, 1.062838, 0, 0, 0, 1, 1,
-0.1508045, 1.334902, 2.308165, 0, 0, 0, 1, 1,
-0.1497556, -0.4786745, -2.787086, 1, 1, 1, 1, 1,
-0.1478742, -0.7508816, -4.569996, 1, 1, 1, 1, 1,
-0.1454071, 0.5502033, 0.4075213, 1, 1, 1, 1, 1,
-0.1437665, -1.839452, -2.029637, 1, 1, 1, 1, 1,
-0.1427015, 0.1540235, 0.09513618, 1, 1, 1, 1, 1,
-0.142106, 0.04558812, 0.1161675, 1, 1, 1, 1, 1,
-0.1419189, -1.563621, -3.417645, 1, 1, 1, 1, 1,
-0.1376354, 0.7406633, -2.744745, 1, 1, 1, 1, 1,
-0.1358776, -1.856339, -5.169989, 1, 1, 1, 1, 1,
-0.1319765, -0.5913957, -1.880722, 1, 1, 1, 1, 1,
-0.129613, 2.096558, -1.808592, 1, 1, 1, 1, 1,
-0.1280359, -2.088376, -1.904787, 1, 1, 1, 1, 1,
-0.1218696, -0.1922769, -2.816624, 1, 1, 1, 1, 1,
-0.1188096, 1.179976, 0.9208243, 1, 1, 1, 1, 1,
-0.1169062, -0.3532107, -3.173703, 1, 1, 1, 1, 1,
-0.1167339, 1.04086, -1.089749, 0, 0, 1, 1, 1,
-0.1159309, -1.115647, -4.172964, 1, 0, 0, 1, 1,
-0.1142618, -0.6108648, -2.698569, 1, 0, 0, 1, 1,
-0.1135117, 0.05980197, -1.938386, 1, 0, 0, 1, 1,
-0.1133405, 0.5749366, -0.2066937, 1, 0, 0, 1, 1,
-0.1128149, 0.09057057, -0.3183472, 1, 0, 0, 1, 1,
-0.1127665, 0.8310887, 1.245882, 0, 0, 0, 1, 1,
-0.1103515, 0.7005591, 0.4635096, 0, 0, 0, 1, 1,
-0.1065054, -1.055499, -2.947676, 0, 0, 0, 1, 1,
-0.106124, 1.52864, -0.6304788, 0, 0, 0, 1, 1,
-0.1039289, -0.6600942, -2.457587, 0, 0, 0, 1, 1,
-0.1020348, -0.8862352, -2.277752, 0, 0, 0, 1, 1,
-0.101298, 0.4637025, 0.4734118, 0, 0, 0, 1, 1,
-0.1001503, -1.570454, -3.221684, 1, 1, 1, 1, 1,
-0.09867239, -1.989627, -1.682212, 1, 1, 1, 1, 1,
-0.09567241, 1.004438, -0.503924, 1, 1, 1, 1, 1,
-0.09486794, 0.5045405, 0.02590626, 1, 1, 1, 1, 1,
-0.09060165, 0.7652572, 0.6900138, 1, 1, 1, 1, 1,
-0.0878523, -0.1379908, -3.135979, 1, 1, 1, 1, 1,
-0.08729089, 0.4753037, -1.368631, 1, 1, 1, 1, 1,
-0.08505168, 1.138648, -0.0956766, 1, 1, 1, 1, 1,
-0.08314462, 0.0246728, 1.00314, 1, 1, 1, 1, 1,
-0.07959226, 0.346705, -0.1445256, 1, 1, 1, 1, 1,
-0.07956054, 0.6540913, -0.2305456, 1, 1, 1, 1, 1,
-0.07791395, 1.253055, -0.3384699, 1, 1, 1, 1, 1,
-0.07706012, -0.3324094, -2.522541, 1, 1, 1, 1, 1,
-0.07559296, 0.9731308, 0.3024839, 1, 1, 1, 1, 1,
-0.07188753, 0.5616219, -0.5560287, 1, 1, 1, 1, 1,
-0.0684653, -0.8130693, -1.813873, 0, 0, 1, 1, 1,
-0.06782362, -0.09177876, -2.440845, 1, 0, 0, 1, 1,
-0.06703858, 2.397511, -0.6934574, 1, 0, 0, 1, 1,
-0.06698804, 2.046582, -1.027516, 1, 0, 0, 1, 1,
-0.06330432, 0.9857768, -1.891095, 1, 0, 0, 1, 1,
-0.06169466, -0.3612719, -4.176031, 1, 0, 0, 1, 1,
-0.05704794, -0.5975555, -4.008772, 0, 0, 0, 1, 1,
-0.05688792, -0.4289084, -3.467343, 0, 0, 0, 1, 1,
-0.05557594, 0.7045622, 1.063692, 0, 0, 0, 1, 1,
-0.04636423, -0.4623264, -4.331357, 0, 0, 0, 1, 1,
-0.04228123, -1.085009, -4.73307, 0, 0, 0, 1, 1,
-0.04212462, 0.9900807, -0.0871414, 0, 0, 0, 1, 1,
-0.041437, -0.3639858, -4.354275, 0, 0, 0, 1, 1,
-0.04078778, -0.9065894, -3.774541, 1, 1, 1, 1, 1,
-0.04001126, -0.2413344, -3.73207, 1, 1, 1, 1, 1,
-0.03533753, -2.13923, -1.868461, 1, 1, 1, 1, 1,
-0.03503445, 1.143835, -0.2527348, 1, 1, 1, 1, 1,
-0.03265003, -0.6769353, -5.332176, 1, 1, 1, 1, 1,
-0.02732749, 0.6495497, -1.077738, 1, 1, 1, 1, 1,
-0.02622022, 1.371702, 0.5805192, 1, 1, 1, 1, 1,
-0.02438858, 1.335659, 0.7325079, 1, 1, 1, 1, 1,
-0.02267124, -0.1278701, -1.51644, 1, 1, 1, 1, 1,
-0.02251951, 0.9055117, 0.7913153, 1, 1, 1, 1, 1,
-0.02119263, -3.428456, -4.092209, 1, 1, 1, 1, 1,
-0.01885445, -0.5282087, -5.418213, 1, 1, 1, 1, 1,
-0.01783247, 0.6055046, -0.399059, 1, 1, 1, 1, 1,
-0.01720503, -0.1263525, -4.174839, 1, 1, 1, 1, 1,
-0.01406991, -0.3069003, -3.625891, 1, 1, 1, 1, 1,
-0.0122184, 1.051858, 0.06327513, 0, 0, 1, 1, 1,
-0.009855601, -0.1134499, -2.636426, 1, 0, 0, 1, 1,
-0.007721822, -2.440167, -2.406654, 1, 0, 0, 1, 1,
-0.004024728, 1.193684, -0.1018847, 1, 0, 0, 1, 1,
-0.002754207, -0.9874161, -2.903605, 1, 0, 0, 1, 1,
-0.001404573, -1.871928, -2.072228, 1, 0, 0, 1, 1,
0.003077853, 0.9282753, -0.6151033, 0, 0, 0, 1, 1,
0.00586489, -0.3648204, 4.77712, 0, 0, 0, 1, 1,
0.01292184, -0.7853778, 4.728239, 0, 0, 0, 1, 1,
0.01368157, 1.877934, -0.3279814, 0, 0, 0, 1, 1,
0.01402654, -1.284048, 2.216337, 0, 0, 0, 1, 1,
0.01733366, -0.3061644, 1.636416, 0, 0, 0, 1, 1,
0.01827599, 1.216167, -1.485296, 0, 0, 0, 1, 1,
0.01864371, 1.522443, 0.7711288, 1, 1, 1, 1, 1,
0.02107844, -0.004178678, 2.370804, 1, 1, 1, 1, 1,
0.02397528, -1.563297, 3.074055, 1, 1, 1, 1, 1,
0.03487682, 2.488484, -1.022914, 1, 1, 1, 1, 1,
0.03768607, -0.1195224, 1.783565, 1, 1, 1, 1, 1,
0.03844396, 1.64684, -0.03944945, 1, 1, 1, 1, 1,
0.03926076, 0.477243, 1.55755, 1, 1, 1, 1, 1,
0.03931522, 1.085221, 1.228928, 1, 1, 1, 1, 1,
0.04033915, -1.034054, 3.347624, 1, 1, 1, 1, 1,
0.04161882, -3.150642, 3.218637, 1, 1, 1, 1, 1,
0.04451142, 0.5119461, 1.770726, 1, 1, 1, 1, 1,
0.04568197, -0.903048, 4.362227, 1, 1, 1, 1, 1,
0.04888549, 0.9906012, -1.409928, 1, 1, 1, 1, 1,
0.05237832, -1.428613, 1.52368, 1, 1, 1, 1, 1,
0.06920013, -0.07244524, 2.799359, 1, 1, 1, 1, 1,
0.07116653, 0.5638174, -1.751255, 0, 0, 1, 1, 1,
0.07128404, 0.7078905, -0.4816631, 1, 0, 0, 1, 1,
0.07194709, -0.3258921, 3.280305, 1, 0, 0, 1, 1,
0.07364606, -0.5151958, 5.080526, 1, 0, 0, 1, 1,
0.08421527, 0.1831875, -0.7790807, 1, 0, 0, 1, 1,
0.08592211, -0.3766632, 3.073738, 1, 0, 0, 1, 1,
0.08632348, 0.3755682, -1.696992, 0, 0, 0, 1, 1,
0.09091989, 0.4058324, -0.5784382, 0, 0, 0, 1, 1,
0.09708051, -0.1844004, 2.21014, 0, 0, 0, 1, 1,
0.1008006, -0.5886636, 4.366425, 0, 0, 0, 1, 1,
0.1013273, 0.3672544, 0.9786266, 0, 0, 0, 1, 1,
0.1046418, -0.2829009, 2.355158, 0, 0, 0, 1, 1,
0.1089144, -0.1820948, 1.869433, 0, 0, 0, 1, 1,
0.1093527, 0.8990411, 1.120706, 1, 1, 1, 1, 1,
0.1099291, -0.5444196, 2.446127, 1, 1, 1, 1, 1,
0.1100554, -0.8715905, 3.982369, 1, 1, 1, 1, 1,
0.1106829, 0.02093384, 1.681243, 1, 1, 1, 1, 1,
0.1132207, -1.762609, 4.339725, 1, 1, 1, 1, 1,
0.1145297, -1.458726, 2.428906, 1, 1, 1, 1, 1,
0.114824, -0.2739874, 1.604225, 1, 1, 1, 1, 1,
0.1153172, 0.428647, -0.2568991, 1, 1, 1, 1, 1,
0.1165084, 0.8766871, 0.2424547, 1, 1, 1, 1, 1,
0.1175544, -0.9254342, 3.19007, 1, 1, 1, 1, 1,
0.1176028, 0.1338389, -0.2340779, 1, 1, 1, 1, 1,
0.1186809, 1.175492, 0.008242505, 1, 1, 1, 1, 1,
0.1189503, -1.413681, 3.215978, 1, 1, 1, 1, 1,
0.1202901, -0.5439599, 3.24925, 1, 1, 1, 1, 1,
0.1203335, -1.191794, 2.078881, 1, 1, 1, 1, 1,
0.121649, 1.574553, 1.223423, 0, 0, 1, 1, 1,
0.125531, -0.3596995, 4.361453, 1, 0, 0, 1, 1,
0.1260629, -0.8360842, 1.488813, 1, 0, 0, 1, 1,
0.1291003, -1.91546, 2.905333, 1, 0, 0, 1, 1,
0.130774, 0.2744648, -0.09630181, 1, 0, 0, 1, 1,
0.1334728, 0.3396555, 0.0001619223, 1, 0, 0, 1, 1,
0.1335115, 0.6120898, -0.3171285, 0, 0, 0, 1, 1,
0.1394867, -1.261703, 3.94373, 0, 0, 0, 1, 1,
0.140529, -1.082001, 3.195968, 0, 0, 0, 1, 1,
0.1411037, 0.4697943, -0.01117321, 0, 0, 0, 1, 1,
0.1425679, 0.6824223, 1.538924, 0, 0, 0, 1, 1,
0.1431664, -0.3851905, 3.116376, 0, 0, 0, 1, 1,
0.1444551, 0.1299461, 1.42217, 0, 0, 0, 1, 1,
0.1444812, 0.3053916, -1.654222, 1, 1, 1, 1, 1,
0.1454536, -0.4591716, 3.264428, 1, 1, 1, 1, 1,
0.1456283, -0.772673, 4.310192, 1, 1, 1, 1, 1,
0.1486355, 0.4521783, 0.3517628, 1, 1, 1, 1, 1,
0.1506039, 0.03683174, -1.766746, 1, 1, 1, 1, 1,
0.15255, -0.4169673, 2.779037, 1, 1, 1, 1, 1,
0.1538197, 0.1533182, 1.21551, 1, 1, 1, 1, 1,
0.155134, -0.2065959, 1.457617, 1, 1, 1, 1, 1,
0.1553051, -0.5147315, 1.490685, 1, 1, 1, 1, 1,
0.1581229, 0.2695293, 1.98715, 1, 1, 1, 1, 1,
0.1645553, -0.0785808, 3.070521, 1, 1, 1, 1, 1,
0.1650537, 1.844407, -0.4063957, 1, 1, 1, 1, 1,
0.1703684, 0.6736809, 0.5979661, 1, 1, 1, 1, 1,
0.170637, 0.8432024, 0.4768777, 1, 1, 1, 1, 1,
0.1713327, 0.5191299, -0.8067017, 1, 1, 1, 1, 1,
0.1734208, 3.318789, -1.932403, 0, 0, 1, 1, 1,
0.1756075, 1.101958, 2.211454, 1, 0, 0, 1, 1,
0.177146, 0.01818169, 1.392911, 1, 0, 0, 1, 1,
0.1836283, -0.7070172, 1.278925, 1, 0, 0, 1, 1,
0.1879238, -0.32668, 3.158922, 1, 0, 0, 1, 1,
0.1902442, 0.7652821, -1.792938, 1, 0, 0, 1, 1,
0.1943565, 2.350204, 0.8370705, 0, 0, 0, 1, 1,
0.1966881, 0.2896697, 0.08930387, 0, 0, 0, 1, 1,
0.1975766, -0.6437436, 2.720376, 0, 0, 0, 1, 1,
0.2016406, -0.2039075, 2.378946, 0, 0, 0, 1, 1,
0.2021506, -0.9853625, 2.745377, 0, 0, 0, 1, 1,
0.203044, 2.050163, -0.1903926, 0, 0, 0, 1, 1,
0.2040347, -1.446919, 1.472232, 0, 0, 0, 1, 1,
0.2072039, 0.9103535, -0.4357675, 1, 1, 1, 1, 1,
0.2084427, -0.9185733, 1.627235, 1, 1, 1, 1, 1,
0.2144134, 0.5467417, 1.218265, 1, 1, 1, 1, 1,
0.2206088, -0.7807514, 2.452905, 1, 1, 1, 1, 1,
0.2207757, -0.2098559, 3.193501, 1, 1, 1, 1, 1,
0.2211453, 0.8140898, 0.4280759, 1, 1, 1, 1, 1,
0.2239497, 2.395519, 0.1245954, 1, 1, 1, 1, 1,
0.225224, -1.970508, 5.462785, 1, 1, 1, 1, 1,
0.2313929, 2.490642, -0.8403839, 1, 1, 1, 1, 1,
0.2389474, 0.1425663, 1.12647, 1, 1, 1, 1, 1,
0.2463093, 0.6382204, 0.4568417, 1, 1, 1, 1, 1,
0.2493563, -0.3515179, 2.079617, 1, 1, 1, 1, 1,
0.2534289, -0.959479, 3.918851, 1, 1, 1, 1, 1,
0.2544011, -0.4133655, 1.036543, 1, 1, 1, 1, 1,
0.2555971, -1.590003, 3.851141, 1, 1, 1, 1, 1,
0.2617795, 1.208835, 2.537394, 0, 0, 1, 1, 1,
0.2634338, -0.5559348, 2.35101, 1, 0, 0, 1, 1,
0.268943, 0.2360469, -0.7516676, 1, 0, 0, 1, 1,
0.2737169, -1.179112, 2.377234, 1, 0, 0, 1, 1,
0.2738869, 1.058492, 0.8818852, 1, 0, 0, 1, 1,
0.2745681, -0.3386668, 2.83726, 1, 0, 0, 1, 1,
0.2769142, 1.284127, -0.5229356, 0, 0, 0, 1, 1,
0.2784843, -0.546422, 3.2736, 0, 0, 0, 1, 1,
0.2846945, 2.066415, 1.202224, 0, 0, 0, 1, 1,
0.2865039, 0.9551308, -0.1330884, 0, 0, 0, 1, 1,
0.2884963, 1.436479, 0.154245, 0, 0, 0, 1, 1,
0.288958, 0.4432763, 0.852949, 0, 0, 0, 1, 1,
0.292865, -0.2348958, 2.851118, 0, 0, 0, 1, 1,
0.3091899, -0.5752904, 3.307737, 1, 1, 1, 1, 1,
0.3107018, 0.09563579, 2.324893, 1, 1, 1, 1, 1,
0.3139887, -1.56633, 2.077394, 1, 1, 1, 1, 1,
0.3142232, 0.4582686, 0.7572208, 1, 1, 1, 1, 1,
0.3234663, -0.7105973, 1.809761, 1, 1, 1, 1, 1,
0.3260229, -0.2179921, 2.054765, 1, 1, 1, 1, 1,
0.327569, -1.449669, 2.769724, 1, 1, 1, 1, 1,
0.3276332, -0.3499646, 2.278899, 1, 1, 1, 1, 1,
0.3314883, -0.7517478, 2.283365, 1, 1, 1, 1, 1,
0.3330359, 0.8867128, -0.5942599, 1, 1, 1, 1, 1,
0.3356691, 0.1096935, 0.834772, 1, 1, 1, 1, 1,
0.3396535, 0.9661287, -0.9280238, 1, 1, 1, 1, 1,
0.3429624, 2.230019, 0.02847479, 1, 1, 1, 1, 1,
0.3492213, -0.5181236, 1.36586, 1, 1, 1, 1, 1,
0.351793, 0.01372844, 1.334553, 1, 1, 1, 1, 1,
0.3519377, -0.9038697, 3.346004, 0, 0, 1, 1, 1,
0.3572452, -1.198387, 1.234993, 1, 0, 0, 1, 1,
0.3585583, 0.4541528, -0.4056323, 1, 0, 0, 1, 1,
0.3594093, -0.5257968, 0.7709116, 1, 0, 0, 1, 1,
0.360539, 0.03524909, 1.601245, 1, 0, 0, 1, 1,
0.3628267, -0.6852794, 2.783902, 1, 0, 0, 1, 1,
0.3630502, 0.8831305, 0.4677932, 0, 0, 0, 1, 1,
0.3673143, 0.6339285, 0.1261307, 0, 0, 0, 1, 1,
0.3688117, -0.753433, 2.810909, 0, 0, 0, 1, 1,
0.3735926, -0.04240489, 2.963438, 0, 0, 0, 1, 1,
0.3736819, 0.9612847, -0.9272107, 0, 0, 0, 1, 1,
0.3762502, 0.3966401, 2.230113, 0, 0, 0, 1, 1,
0.3780149, -0.07030442, 2.862006, 0, 0, 0, 1, 1,
0.3807319, 0.04773015, 2.375887, 1, 1, 1, 1, 1,
0.3807482, -0.6434073, 2.797196, 1, 1, 1, 1, 1,
0.3810236, -0.9918283, 2.091702, 1, 1, 1, 1, 1,
0.3850023, -0.3418106, 2.493637, 1, 1, 1, 1, 1,
0.386041, -1.840448, 3.834429, 1, 1, 1, 1, 1,
0.3876981, -0.6206217, 1.249876, 1, 1, 1, 1, 1,
0.3882824, 0.1079663, 1.119202, 1, 1, 1, 1, 1,
0.388329, 0.1457687, 1.162081, 1, 1, 1, 1, 1,
0.3911402, -2.160473, 1.711009, 1, 1, 1, 1, 1,
0.3946551, 1.403052, -2.074499, 1, 1, 1, 1, 1,
0.4023876, 0.4301995, 0.7509953, 1, 1, 1, 1, 1,
0.402777, -0.0173796, 1.300672, 1, 1, 1, 1, 1,
0.4044748, -0.7829443, 3.22709, 1, 1, 1, 1, 1,
0.4046272, 1.369641, 0.9629195, 1, 1, 1, 1, 1,
0.4049722, 1.07939, 1.501152, 1, 1, 1, 1, 1,
0.4060157, 0.6648331, -0.6162201, 0, 0, 1, 1, 1,
0.4088791, 0.7836516, 0.4402896, 1, 0, 0, 1, 1,
0.4161399, 0.9931572, -1.154288, 1, 0, 0, 1, 1,
0.4164911, 0.8024856, 1.486862, 1, 0, 0, 1, 1,
0.4169984, 1.307482, -0.7094996, 1, 0, 0, 1, 1,
0.4181855, -0.1455752, 3.269037, 1, 0, 0, 1, 1,
0.4258497, 0.920229, -0.3890653, 0, 0, 0, 1, 1,
0.4277124, -0.5939124, 1.776567, 0, 0, 0, 1, 1,
0.4303072, 1.501531, 0.6462709, 0, 0, 0, 1, 1,
0.4371048, -1.263244, 3.395498, 0, 0, 0, 1, 1,
0.4470361, -0.0497275, -0.2033223, 0, 0, 0, 1, 1,
0.4474035, -0.4335149, 2.997245, 0, 0, 0, 1, 1,
0.4497354, 0.1682448, 0.8598187, 0, 0, 0, 1, 1,
0.4528704, -1.830326, 3.591609, 1, 1, 1, 1, 1,
0.4556452, -0.7184206, 3.549457, 1, 1, 1, 1, 1,
0.4604601, 0.3236853, 0.144138, 1, 1, 1, 1, 1,
0.4671043, 0.9888407, 0.0009137025, 1, 1, 1, 1, 1,
0.4692999, -0.8813761, 2.813473, 1, 1, 1, 1, 1,
0.4804049, -0.6074541, 1.710503, 1, 1, 1, 1, 1,
0.4806568, 0.3852772, 1.696755, 1, 1, 1, 1, 1,
0.4842048, 0.4352213, 1.020602, 1, 1, 1, 1, 1,
0.4863269, 0.3663675, 2.055321, 1, 1, 1, 1, 1,
0.4900549, 1.145471, -0.01301635, 1, 1, 1, 1, 1,
0.4904832, -0.5211502, 1.507352, 1, 1, 1, 1, 1,
0.494702, -1.702013, 1.677167, 1, 1, 1, 1, 1,
0.4995382, -0.2909185, 2.085645, 1, 1, 1, 1, 1,
0.500663, -2.710133, 2.892153, 1, 1, 1, 1, 1,
0.5007812, -0.08371043, 1.510258, 1, 1, 1, 1, 1,
0.5021504, -1.065122, 3.151875, 0, 0, 1, 1, 1,
0.5035923, -0.3126111, 0.6694049, 1, 0, 0, 1, 1,
0.5068429, -1.119138, 3.771348, 1, 0, 0, 1, 1,
0.5122724, -0.06255762, 1.753057, 1, 0, 0, 1, 1,
0.5123665, 1.771197, 0.3244976, 1, 0, 0, 1, 1,
0.5131091, 1.08316, 1.355463, 1, 0, 0, 1, 1,
0.5166995, -0.6485581, 3.984818, 0, 0, 0, 1, 1,
0.5234877, -0.6840606, 0.7901039, 0, 0, 0, 1, 1,
0.5254651, 0.06788766, 1.361087, 0, 0, 0, 1, 1,
0.5281382, 0.031585, 1.525197, 0, 0, 0, 1, 1,
0.5347938, -0.1617151, 2.621001, 0, 0, 0, 1, 1,
0.5366479, -0.1864369, 1.658975, 0, 0, 0, 1, 1,
0.5385062, -0.247669, 1.098114, 0, 0, 0, 1, 1,
0.5421372, 0.3544974, 0.8786375, 1, 1, 1, 1, 1,
0.5541037, 0.1936578, 3.412894, 1, 1, 1, 1, 1,
0.5553763, 0.2134027, 2.276446, 1, 1, 1, 1, 1,
0.5574139, -0.8326307, 2.836085, 1, 1, 1, 1, 1,
0.5628986, 0.1417253, 0.9318329, 1, 1, 1, 1, 1,
0.5635022, 1.050502, 1.439526, 1, 1, 1, 1, 1,
0.5696819, 1.848156, -0.1670417, 1, 1, 1, 1, 1,
0.5720854, -1.013079, 3.281132, 1, 1, 1, 1, 1,
0.5873194, 0.667078, 0.06780928, 1, 1, 1, 1, 1,
0.5876765, -1.585823, 2.275997, 1, 1, 1, 1, 1,
0.5882999, -1.668744, 2.19797, 1, 1, 1, 1, 1,
0.5888259, -0.5720546, 1.075256, 1, 1, 1, 1, 1,
0.5940343, -0.4874874, 0.4063195, 1, 1, 1, 1, 1,
0.5978798, 0.4577269, 1.753356, 1, 1, 1, 1, 1,
0.6041123, -0.3004574, 4.829696, 1, 1, 1, 1, 1,
0.6060805, 0.6077689, 1.675539, 0, 0, 1, 1, 1,
0.6070789, -0.3404947, 2.324243, 1, 0, 0, 1, 1,
0.6091007, 0.166884, 0.1229098, 1, 0, 0, 1, 1,
0.6092543, -0.187074, 3.496644, 1, 0, 0, 1, 1,
0.6095517, -0.7613872, 2.611241, 1, 0, 0, 1, 1,
0.6160938, 0.3761916, -0.2652876, 1, 0, 0, 1, 1,
0.6163297, 1.623794, -0.3108079, 0, 0, 0, 1, 1,
0.6212189, 1.152699, 1.105905, 0, 0, 0, 1, 1,
0.6240465, -0.3200334, 2.384432, 0, 0, 0, 1, 1,
0.625999, -1.222257, 1.161592, 0, 0, 0, 1, 1,
0.6294163, -0.2085296, 2.184653, 0, 0, 0, 1, 1,
0.6306579, -0.5846649, 0.7245166, 0, 0, 0, 1, 1,
0.6306991, -1.267106, 3.120911, 0, 0, 0, 1, 1,
0.63082, 0.2359415, -0.7352326, 1, 1, 1, 1, 1,
0.6342204, -0.06936082, -0.2384533, 1, 1, 1, 1, 1,
0.637193, 0.7103313, -1.932804, 1, 1, 1, 1, 1,
0.6424809, 0.3307292, 1.294866, 1, 1, 1, 1, 1,
0.6450905, 1.594708, -0.1426036, 1, 1, 1, 1, 1,
0.650302, -1.037794, 2.670167, 1, 1, 1, 1, 1,
0.6525261, -1.581441, 1.259639, 1, 1, 1, 1, 1,
0.6536552, -0.9464697, 1.290133, 1, 1, 1, 1, 1,
0.6548517, -0.4982909, 2.172647, 1, 1, 1, 1, 1,
0.6559156, 0.447651, 1.393212, 1, 1, 1, 1, 1,
0.6567259, -1.810994, 3.019887, 1, 1, 1, 1, 1,
0.65783, 1.100504, 0.2239223, 1, 1, 1, 1, 1,
0.6624672, 0.9168873, 0.5021049, 1, 1, 1, 1, 1,
0.6650486, -0.4618741, 3.602885, 1, 1, 1, 1, 1,
0.6680016, -0.5307553, 4.110579, 1, 1, 1, 1, 1,
0.6691003, -1.995718, 2.952162, 0, 0, 1, 1, 1,
0.6809983, 1.037975, -1.046425, 1, 0, 0, 1, 1,
0.6827841, 0.4980911, -1.770833, 1, 0, 0, 1, 1,
0.6867409, -0.7911623, 2.442089, 1, 0, 0, 1, 1,
0.6887876, 1.019287, -0.5041196, 1, 0, 0, 1, 1,
0.6957286, 0.3743021, 1.565532, 1, 0, 0, 1, 1,
0.695872, -0.14649, 1.690786, 0, 0, 0, 1, 1,
0.69735, 0.7897619, 2.080566, 0, 0, 0, 1, 1,
0.6976504, -2.285318, 1.317946, 0, 0, 0, 1, 1,
0.7044356, 0.5327726, -0.4547665, 0, 0, 0, 1, 1,
0.7086823, -0.3662131, 2.909514, 0, 0, 0, 1, 1,
0.7087237, -0.5773631, 1.234706, 0, 0, 0, 1, 1,
0.7164971, 0.1165434, 3.33856, 0, 0, 0, 1, 1,
0.7171729, -0.460221, 0.8356639, 1, 1, 1, 1, 1,
0.7173702, -0.7891486, 1.205316, 1, 1, 1, 1, 1,
0.726459, 0.7053602, -0.004696683, 1, 1, 1, 1, 1,
0.7286801, 0.7564348, 0.4650645, 1, 1, 1, 1, 1,
0.7319145, 1.068562, 1.042262, 1, 1, 1, 1, 1,
0.7340128, -0.3906721, 0.2387603, 1, 1, 1, 1, 1,
0.7390943, -0.06948578, 2.659762, 1, 1, 1, 1, 1,
0.7401456, -0.4741237, 1.726367, 1, 1, 1, 1, 1,
0.7427551, 1.460029, 0.3064884, 1, 1, 1, 1, 1,
0.7456491, -1.824982, 3.671433, 1, 1, 1, 1, 1,
0.7558362, -0.4071288, 2.826725, 1, 1, 1, 1, 1,
0.759885, -0.6029174, 2.152337, 1, 1, 1, 1, 1,
0.7614468, -0.005035729, 1.564006, 1, 1, 1, 1, 1,
0.761812, -0.9518407, 2.191193, 1, 1, 1, 1, 1,
0.7625025, -0.004392203, 3.077021, 1, 1, 1, 1, 1,
0.7656631, 0.7723092, -0.1980901, 0, 0, 1, 1, 1,
0.7706813, -0.5623729, 3.276989, 1, 0, 0, 1, 1,
0.7723699, 0.8109596, -0.8631921, 1, 0, 0, 1, 1,
0.7747827, -0.2880682, 1.557811, 1, 0, 0, 1, 1,
0.7754222, -0.1102431, 2.40259, 1, 0, 0, 1, 1,
0.7754552, 2.142839, -1.947569, 1, 0, 0, 1, 1,
0.7792525, 1.008803, 0.244017, 0, 0, 0, 1, 1,
0.7832726, 1.086047, -0.6663498, 0, 0, 0, 1, 1,
0.7866716, 0.0005003661, 2.994353, 0, 0, 0, 1, 1,
0.78795, -0.4383981, 1.233613, 0, 0, 0, 1, 1,
0.7887912, -1.334479, 4.074694, 0, 0, 0, 1, 1,
0.7905713, 1.43462, 0.4374791, 0, 0, 0, 1, 1,
0.7935222, 0.1840526, 0.4737195, 0, 0, 0, 1, 1,
0.7957965, 0.180008, -0.3124905, 1, 1, 1, 1, 1,
0.7976224, -0.3121201, 1.55543, 1, 1, 1, 1, 1,
0.8001291, -0.7370874, 3.325948, 1, 1, 1, 1, 1,
0.8078634, -1.87067, 3.397457, 1, 1, 1, 1, 1,
0.8102237, -0.4569924, 1.05805, 1, 1, 1, 1, 1,
0.8106337, 0.4617855, 1.041828, 1, 1, 1, 1, 1,
0.8109779, 0.4822649, 2.051417, 1, 1, 1, 1, 1,
0.8137893, 0.9797347, 0.6947254, 1, 1, 1, 1, 1,
0.8138748, -1.062663, 2.078877, 1, 1, 1, 1, 1,
0.8156595, 1.403594, 1.412246, 1, 1, 1, 1, 1,
0.8172646, -1.477999, 1.51414, 1, 1, 1, 1, 1,
0.8199199, 0.2566707, -1.01137, 1, 1, 1, 1, 1,
0.8214015, -1.147788, 2.491235, 1, 1, 1, 1, 1,
0.8255365, -0.8117992, 3.638168, 1, 1, 1, 1, 1,
0.8275265, -0.6895702, 0.1930424, 1, 1, 1, 1, 1,
0.8300465, -2.664049, 2.683353, 0, 0, 1, 1, 1,
0.8323129, 0.07166775, 2.008395, 1, 0, 0, 1, 1,
0.8330767, -0.2197901, -1.594452, 1, 0, 0, 1, 1,
0.8349224, 0.7956116, 0.487647, 1, 0, 0, 1, 1,
0.8360206, -0.2793213, 3.555357, 1, 0, 0, 1, 1,
0.8374085, -0.02736889, 1.958409, 1, 0, 0, 1, 1,
0.839833, -0.4670539, 3.088364, 0, 0, 0, 1, 1,
0.8400297, 2.216232, 1.724519, 0, 0, 0, 1, 1,
0.8455526, 1.579145, 0.03017318, 0, 0, 0, 1, 1,
0.8471398, -0.2162752, 3.379289, 0, 0, 0, 1, 1,
0.8548065, 0.7289684, 0.4508646, 0, 0, 0, 1, 1,
0.8573187, 0.09042361, 1.280779, 0, 0, 0, 1, 1,
0.8582582, -0.8841737, 1.352564, 0, 0, 0, 1, 1,
0.8643193, 1.474237, 1.792746, 1, 1, 1, 1, 1,
0.8715535, -0.957322, 2.555869, 1, 1, 1, 1, 1,
0.8768724, -1.010601, 0.3544514, 1, 1, 1, 1, 1,
0.8835629, -0.2776096, 2.149166, 1, 1, 1, 1, 1,
0.8858323, -0.6930022, 1.307825, 1, 1, 1, 1, 1,
0.886864, -0.7268736, 3.436879, 1, 1, 1, 1, 1,
0.8956739, -0.2685296, 2.193817, 1, 1, 1, 1, 1,
0.8960621, 1.269102, -0.159969, 1, 1, 1, 1, 1,
0.8980336, 0.1709472, 0.650364, 1, 1, 1, 1, 1,
0.9007872, 0.6053395, -0.3196487, 1, 1, 1, 1, 1,
0.9028864, -0.05469962, 1.145948, 1, 1, 1, 1, 1,
0.904248, 0.2156221, 0.773495, 1, 1, 1, 1, 1,
0.9051905, 0.04267688, 0.9668586, 1, 1, 1, 1, 1,
0.9116692, 0.1549901, 0.589779, 1, 1, 1, 1, 1,
0.9171824, -1.653073, 2.144504, 1, 1, 1, 1, 1,
0.9174919, -0.1258402, 3.448751, 0, 0, 1, 1, 1,
0.9195944, 0.7059815, 2.895655, 1, 0, 0, 1, 1,
0.9243575, 0.6874725, 1.486486, 1, 0, 0, 1, 1,
0.9252595, -1.091397, 2.837077, 1, 0, 0, 1, 1,
0.9303025, -0.4447149, 2.821131, 1, 0, 0, 1, 1,
0.9325876, -1.976639, 4.144366, 1, 0, 0, 1, 1,
0.9344524, 0.283717, -0.8575991, 0, 0, 0, 1, 1,
0.9368192, -0.02829239, 0.9936216, 0, 0, 0, 1, 1,
0.9369941, 0.8811755, 1.349676, 0, 0, 0, 1, 1,
0.9384065, 0.7306094, 1.19946, 0, 0, 0, 1, 1,
0.9405562, -2.462962, 3.176272, 0, 0, 0, 1, 1,
0.9508272, -0.439685, 3.265868, 0, 0, 0, 1, 1,
0.9512623, 0.6143279, 0.4895399, 0, 0, 0, 1, 1,
0.9516674, 0.6054935, 0.4703766, 1, 1, 1, 1, 1,
0.958092, 1.985905, -0.05607045, 1, 1, 1, 1, 1,
0.9593093, 1.952515, 0.6816874, 1, 1, 1, 1, 1,
0.9627623, 0.6154908, 0.50906, 1, 1, 1, 1, 1,
0.9678679, -0.3246315, 0.467161, 1, 1, 1, 1, 1,
0.9760835, -0.04928041, 0.3833878, 1, 1, 1, 1, 1,
0.9862007, 0.1233498, 2.596926, 1, 1, 1, 1, 1,
0.9921121, -1.29028, 2.320566, 1, 1, 1, 1, 1,
1.001854, -0.7549075, 2.346575, 1, 1, 1, 1, 1,
1.003277, -1.300164, 0.7211644, 1, 1, 1, 1, 1,
1.00699, 0.008119908, 2.24366, 1, 1, 1, 1, 1,
1.008093, 0.6041484, 2.429306, 1, 1, 1, 1, 1,
1.009117, 0.4277651, 1.382766, 1, 1, 1, 1, 1,
1.009887, 1.876808, 1.180685, 1, 1, 1, 1, 1,
1.010206, 0.8047233, 2.072973, 1, 1, 1, 1, 1,
1.023076, 0.2816623, 1.936675, 0, 0, 1, 1, 1,
1.02472, 0.2314115, 0.4686554, 1, 0, 0, 1, 1,
1.026116, 1.132707, 2.175383, 1, 0, 0, 1, 1,
1.032658, -0.8573323, 2.78326, 1, 0, 0, 1, 1,
1.048762, -0.4139936, 3.426305, 1, 0, 0, 1, 1,
1.060871, 0.3035991, 2.263572, 1, 0, 0, 1, 1,
1.062362, -1.874318, 2.073863, 0, 0, 0, 1, 1,
1.066233, 1.689026, 0.3538007, 0, 0, 0, 1, 1,
1.067003, -0.4408711, 1.808493, 0, 0, 0, 1, 1,
1.067341, -0.8487399, 1.866141, 0, 0, 0, 1, 1,
1.079407, 1.245577, 0.3329088, 0, 0, 0, 1, 1,
1.081738, 0.04777497, 1.140357, 0, 0, 0, 1, 1,
1.088537, -0.4918581, 0.9606385, 0, 0, 0, 1, 1,
1.091348, -0.2799574, 2.827409, 1, 1, 1, 1, 1,
1.092647, -0.9702184, 3.148083, 1, 1, 1, 1, 1,
1.112197, -0.1885379, 0.449121, 1, 1, 1, 1, 1,
1.125551, 0.292911, 0.4944791, 1, 1, 1, 1, 1,
1.127688, -0.6559073, 1.722872, 1, 1, 1, 1, 1,
1.142737, -0.5298925, 1.837747, 1, 1, 1, 1, 1,
1.142751, 0.4721998, 1.372442, 1, 1, 1, 1, 1,
1.146253, 1.760746, 0.02143228, 1, 1, 1, 1, 1,
1.14825, 1.813108, -0.1884341, 1, 1, 1, 1, 1,
1.15953, 0.9557952, 1.821488, 1, 1, 1, 1, 1,
1.177125, -1.314948, 2.933656, 1, 1, 1, 1, 1,
1.177921, -0.02242838, -0.5885079, 1, 1, 1, 1, 1,
1.178681, -0.7517953, 1.996716, 1, 1, 1, 1, 1,
1.186988, 0.2216291, 3.517703, 1, 1, 1, 1, 1,
1.196021, -0.1806826, 2.105288, 1, 1, 1, 1, 1,
1.200684, -1.112193, 1.356273, 0, 0, 1, 1, 1,
1.204658, -1.118946, 1.870461, 1, 0, 0, 1, 1,
1.209866, -1.13706, 3.577885, 1, 0, 0, 1, 1,
1.211617, 0.09418967, 2.720206, 1, 0, 0, 1, 1,
1.213016, -0.2064819, 2.314955, 1, 0, 0, 1, 1,
1.21328, -0.1012185, 0.7071608, 1, 0, 0, 1, 1,
1.218081, -0.8234918, 1.703619, 0, 0, 0, 1, 1,
1.225193, 0.2547196, 0.9480664, 0, 0, 0, 1, 1,
1.227658, 1.057833, 1.313455, 0, 0, 0, 1, 1,
1.227684, -1.399221, 2.536134, 0, 0, 0, 1, 1,
1.23119, 0.7109622, -0.7441394, 0, 0, 0, 1, 1,
1.240548, -1.513172, 1.487712, 0, 0, 0, 1, 1,
1.246687, -0.5857893, 2.197134, 0, 0, 0, 1, 1,
1.247163, 0.180231, 0.6639779, 1, 1, 1, 1, 1,
1.25017, 0.2295352, 1.410095, 1, 1, 1, 1, 1,
1.260438, -0.1221553, 0.1586668, 1, 1, 1, 1, 1,
1.269876, -0.5701118, 1.673951, 1, 1, 1, 1, 1,
1.273165, 1.054118, 0.9667043, 1, 1, 1, 1, 1,
1.276904, -0.7588655, 0.4073196, 1, 1, 1, 1, 1,
1.281175, 0.2097802, 2.182627, 1, 1, 1, 1, 1,
1.285148, -1.715536, 3.491992, 1, 1, 1, 1, 1,
1.286264, -0.2427797, 1.754693, 1, 1, 1, 1, 1,
1.28836, 1.035339, -0.1269859, 1, 1, 1, 1, 1,
1.296091, -1.632466, 2.58745, 1, 1, 1, 1, 1,
1.298952, 0.9248022, 0.1637507, 1, 1, 1, 1, 1,
1.316306, 0.2898372, 1.768889, 1, 1, 1, 1, 1,
1.318918, 1.037897, 1.253999, 1, 1, 1, 1, 1,
1.33251, -0.05048128, 1.231919, 1, 1, 1, 1, 1,
1.333237, 1.38819, 2.887532, 0, 0, 1, 1, 1,
1.342181, -0.3209918, 2.202426, 1, 0, 0, 1, 1,
1.342739, -0.2848967, 1.60257, 1, 0, 0, 1, 1,
1.345764, -0.04568618, 0.234242, 1, 0, 0, 1, 1,
1.354104, -0.4357617, 2.821403, 1, 0, 0, 1, 1,
1.374063, 0.3303196, 2.830506, 1, 0, 0, 1, 1,
1.377679, -1.310846, 1.901218, 0, 0, 0, 1, 1,
1.382292, 0.5319133, 1.447492, 0, 0, 0, 1, 1,
1.397053, -0.2265358, 2.577017, 0, 0, 0, 1, 1,
1.402241, 0.6225657, 1.28431, 0, 0, 0, 1, 1,
1.415206, -1.219079, 2.606764, 0, 0, 0, 1, 1,
1.420895, 0.4476475, 1.552957, 0, 0, 0, 1, 1,
1.445118, -0.393851, 0.09507428, 0, 0, 0, 1, 1,
1.467967, 0.9852955, 1.716187, 1, 1, 1, 1, 1,
1.468517, 1.516481, 1.449366, 1, 1, 1, 1, 1,
1.477746, -0.3914905, 0.7941159, 1, 1, 1, 1, 1,
1.485377, -0.5180687, 1.336165, 1, 1, 1, 1, 1,
1.498315, 0.2389584, 2.184113, 1, 1, 1, 1, 1,
1.501763, -0.6869119, 1.148743, 1, 1, 1, 1, 1,
1.506216, 1.720237, 0.9454933, 1, 1, 1, 1, 1,
1.508551, -0.00448942, 1.390155, 1, 1, 1, 1, 1,
1.527132, 0.02864417, 0.703128, 1, 1, 1, 1, 1,
1.549467, 0.9338752, 0.360669, 1, 1, 1, 1, 1,
1.600553, -1.249988, 2.07181, 1, 1, 1, 1, 1,
1.607339, 2.30856, 0.3202095, 1, 1, 1, 1, 1,
1.61178, -0.2419748, 3.163599, 1, 1, 1, 1, 1,
1.619908, 0.02058329, -0.2238437, 1, 1, 1, 1, 1,
1.623269, 0.8423738, 2.573281, 1, 1, 1, 1, 1,
1.628665, -0.4761964, 0.2951154, 0, 0, 1, 1, 1,
1.633816, 0.5744124, 1.479621, 1, 0, 0, 1, 1,
1.652885, -0.4554677, 2.222842, 1, 0, 0, 1, 1,
1.677308, -0.8531278, 0.8400381, 1, 0, 0, 1, 1,
1.711632, 1.139492, 1.708175, 1, 0, 0, 1, 1,
1.722261, 0.1242223, 2.388888, 1, 0, 0, 1, 1,
1.736583, 1.997013, 0.568626, 0, 0, 0, 1, 1,
1.738148, 1.676064, 1.88325, 0, 0, 0, 1, 1,
1.744336, -0.6725205, 0.8440937, 0, 0, 0, 1, 1,
1.746265, -0.005782811, 2.022242, 0, 0, 0, 1, 1,
1.761913, -1.548938, 1.195576, 0, 0, 0, 1, 1,
1.768312, 1.6235, 0.9960886, 0, 0, 0, 1, 1,
1.778301, -0.9124992, 4.267215, 0, 0, 0, 1, 1,
1.780847, 0.4657679, 1.644715, 1, 1, 1, 1, 1,
1.780921, -0.5230863, 2.216325, 1, 1, 1, 1, 1,
1.784065, 0.08864036, 2.188908, 1, 1, 1, 1, 1,
1.787476, -0.4807989, 0.7927094, 1, 1, 1, 1, 1,
1.802192, -1.82736, 3.312392, 1, 1, 1, 1, 1,
1.808923, -0.2176713, 2.236617, 1, 1, 1, 1, 1,
1.880101, -1.56906, 0.8625555, 1, 1, 1, 1, 1,
1.881701, 0.8260653, 1.65392, 1, 1, 1, 1, 1,
1.893593, 0.5577284, 1.83362, 1, 1, 1, 1, 1,
1.911195, -1.316613, 1.943073, 1, 1, 1, 1, 1,
1.917357, -0.2729752, 1.492226, 1, 1, 1, 1, 1,
1.958062, 0.0973858, 0.1714701, 1, 1, 1, 1, 1,
1.96691, 0.6443437, 0.8345823, 1, 1, 1, 1, 1,
1.972745, 1.400163, -0.3063749, 1, 1, 1, 1, 1,
1.981048, 0.0779807, 1.403301, 1, 1, 1, 1, 1,
2.044096, 0.1317396, 2.97041, 0, 0, 1, 1, 1,
2.049289, 0.160217, 1.21298, 1, 0, 0, 1, 1,
2.076579, -0.6181189, 3.058328, 1, 0, 0, 1, 1,
2.099643, -0.7168907, 1.676094, 1, 0, 0, 1, 1,
2.109797, 0.5475811, 1.254504, 1, 0, 0, 1, 1,
2.12387, 0.2529721, 2.315161, 1, 0, 0, 1, 1,
2.12421, 0.1974766, 1.074998, 0, 0, 0, 1, 1,
2.18683, 2.167532, 0.002047108, 0, 0, 0, 1, 1,
2.191198, 0.6305277, 1.122254, 0, 0, 0, 1, 1,
2.202068, 0.9082213, 2.472767, 0, 0, 0, 1, 1,
2.249874, -0.3646671, 0.184379, 0, 0, 0, 1, 1,
2.275693, 0.4430384, 0.7041497, 0, 0, 0, 1, 1,
2.293284, -0.3124713, 1.839483, 0, 0, 0, 1, 1,
2.35039, -2.213008, 1.707221, 1, 1, 1, 1, 1,
2.383702, 1.52181, -0.5438658, 1, 1, 1, 1, 1,
2.531695, -0.8787148, 1.199811, 1, 1, 1, 1, 1,
2.540625, 0.7545254, 2.511126, 1, 1, 1, 1, 1,
2.866019, -0.7317096, 1.658629, 1, 1, 1, 1, 1,
3.091069, -0.477013, -0.1317483, 1, 1, 1, 1, 1,
3.097424, 1.144369, -0.2360136, 1, 1, 1, 1, 1
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
var radius = 9.755171;
var distance = 34.26462;
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
mvMatrix.translate( 0.1497874, 0.05483317, -0.02228594 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26462);
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