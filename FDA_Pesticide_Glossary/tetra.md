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
-2.839593, 0.785259, -1.349208, 1, 0, 0, 1,
-2.733014, 0.2162909, -2.861934, 1, 0.007843138, 0, 1,
-2.650148, 0.05963953, -1.476312, 1, 0.01176471, 0, 1,
-2.565746, -0.6007667, -1.237506, 1, 0.01960784, 0, 1,
-2.563858, -1.055999, -2.443967, 1, 0.02352941, 0, 1,
-2.522602, 0.9698389, -2.860229, 1, 0.03137255, 0, 1,
-2.502141, 2.220454, -2.444909, 1, 0.03529412, 0, 1,
-2.476811, 1.142159, -2.105131, 1, 0.04313726, 0, 1,
-2.466793, -1.118452, -2.663767, 1, 0.04705882, 0, 1,
-2.432635, -0.04513596, -0.6156496, 1, 0.05490196, 0, 1,
-2.417449, -0.5967008, -0.5777717, 1, 0.05882353, 0, 1,
-2.353697, 1.606269, -1.361496, 1, 0.06666667, 0, 1,
-2.342749, 1.047621, -0.1740466, 1, 0.07058824, 0, 1,
-2.313281, 0.1854431, -1.011484, 1, 0.07843138, 0, 1,
-2.27502, -0.5708992, -1.835871, 1, 0.08235294, 0, 1,
-2.206059, -0.3527415, -2.390746, 1, 0.09019608, 0, 1,
-2.189229, -1.089358, -1.966726, 1, 0.09411765, 0, 1,
-2.160296, 0.6794708, -1.233107, 1, 0.1019608, 0, 1,
-2.142079, 0.8460647, -1.484738, 1, 0.1098039, 0, 1,
-2.096627, 0.9612752, -3.651461, 1, 0.1137255, 0, 1,
-2.070115, 0.9426448, -0.6737615, 1, 0.1215686, 0, 1,
-2.063397, 0.2954045, -0.9826584, 1, 0.1254902, 0, 1,
-2.02763, -0.04353389, -1.55778, 1, 0.1333333, 0, 1,
-2.000418, 0.8859362, -2.065432, 1, 0.1372549, 0, 1,
-1.980549, 0.8162319, -1.801911, 1, 0.145098, 0, 1,
-1.970209, -2.15427, -4.357438, 1, 0.1490196, 0, 1,
-1.963009, -0.7164222, -1.158655, 1, 0.1568628, 0, 1,
-1.946515, 0.3777095, -1.917973, 1, 0.1607843, 0, 1,
-1.942576, 2.195076, -0.9425569, 1, 0.1686275, 0, 1,
-1.936434, 0.4521749, -1.410536, 1, 0.172549, 0, 1,
-1.86557, -1.287177, -1.964906, 1, 0.1803922, 0, 1,
-1.864373, 1.129855, -2.290865, 1, 0.1843137, 0, 1,
-1.863474, -1.215868, -3.046907, 1, 0.1921569, 0, 1,
-1.863143, 0.7829012, 0.325606, 1, 0.1960784, 0, 1,
-1.85987, -0.7565485, -2.078264, 1, 0.2039216, 0, 1,
-1.829133, 0.4018054, -0.9325491, 1, 0.2117647, 0, 1,
-1.781718, -0.9488837, -1.387674, 1, 0.2156863, 0, 1,
-1.734635, 0.2981077, -0.8878751, 1, 0.2235294, 0, 1,
-1.731327, 2.058769, -1.56441, 1, 0.227451, 0, 1,
-1.695095, 0.5302833, -1.54282, 1, 0.2352941, 0, 1,
-1.669755, -0.1818382, -2.075308, 1, 0.2392157, 0, 1,
-1.669248, 0.6061125, -1.612708, 1, 0.2470588, 0, 1,
-1.665024, -0.03447657, -0.6284385, 1, 0.2509804, 0, 1,
-1.661635, -0.9312958, -3.207093, 1, 0.2588235, 0, 1,
-1.643352, 0.3573337, -0.9584294, 1, 0.2627451, 0, 1,
-1.638589, -0.3882665, -2.586306, 1, 0.2705882, 0, 1,
-1.632625, 0.04806728, -0.74435, 1, 0.2745098, 0, 1,
-1.622811, -0.2572413, -3.095856, 1, 0.282353, 0, 1,
-1.613433, 2.321046, -1.545953, 1, 0.2862745, 0, 1,
-1.610336, -0.1185589, -3.234877, 1, 0.2941177, 0, 1,
-1.594499, -1.628933, -2.523752, 1, 0.3019608, 0, 1,
-1.571781, 0.1780097, -1.387836, 1, 0.3058824, 0, 1,
-1.563753, -0.6578089, -3.461263, 1, 0.3137255, 0, 1,
-1.563278, -1.391404, -2.343861, 1, 0.3176471, 0, 1,
-1.561247, 0.9325362, -1.34447, 1, 0.3254902, 0, 1,
-1.557292, -1.115771, -2.381368, 1, 0.3294118, 0, 1,
-1.551281, -0.5055763, -3.331579, 1, 0.3372549, 0, 1,
-1.54374, 0.3480239, -0.7972519, 1, 0.3411765, 0, 1,
-1.530372, -1.945443, -2.931442, 1, 0.3490196, 0, 1,
-1.520911, 0.4685294, -1.141539, 1, 0.3529412, 0, 1,
-1.520881, -1.05071, -2.314808, 1, 0.3607843, 0, 1,
-1.504635, 1.850782, -0.887722, 1, 0.3647059, 0, 1,
-1.490268, 0.0218826, -0.2025918, 1, 0.372549, 0, 1,
-1.484777, -0.5223161, -4.404303, 1, 0.3764706, 0, 1,
-1.461419, 0.4889545, -0.4324616, 1, 0.3843137, 0, 1,
-1.451238, 0.9029196, -2.680517, 1, 0.3882353, 0, 1,
-1.437895, -0.7204496, -2.180571, 1, 0.3960784, 0, 1,
-1.43269, 0.419353, -1.274082, 1, 0.4039216, 0, 1,
-1.424228, 0.871444, -2.895627, 1, 0.4078431, 0, 1,
-1.423479, -1.111859, -2.545689, 1, 0.4156863, 0, 1,
-1.4221, -0.3521309, -2.091587, 1, 0.4196078, 0, 1,
-1.420691, 0.0688828, -2.279121, 1, 0.427451, 0, 1,
-1.420677, 0.9096187, -1.763625, 1, 0.4313726, 0, 1,
-1.414239, 0.9662725, -0.7625803, 1, 0.4392157, 0, 1,
-1.413754, -1.156116, -2.585387, 1, 0.4431373, 0, 1,
-1.410306, 0.1529375, -0.6035144, 1, 0.4509804, 0, 1,
-1.406003, 0.6902158, 0.1266521, 1, 0.454902, 0, 1,
-1.397284, 1.23622, -1.321743, 1, 0.4627451, 0, 1,
-1.391564, 1.872694, 0.4976085, 1, 0.4666667, 0, 1,
-1.386406, -1.062187, -2.175913, 1, 0.4745098, 0, 1,
-1.382073, -0.4850321, -1.728735, 1, 0.4784314, 0, 1,
-1.378425, 0.9193819, -1.98382, 1, 0.4862745, 0, 1,
-1.374184, 0.3755745, -2.700731, 1, 0.4901961, 0, 1,
-1.369749, -0.6066565, -0.3353643, 1, 0.4980392, 0, 1,
-1.363432, 1.851223, -0.1381299, 1, 0.5058824, 0, 1,
-1.358909, 0.5559057, 0.7040688, 1, 0.509804, 0, 1,
-1.349208, -0.381556, -0.9465842, 1, 0.5176471, 0, 1,
-1.33726, 0.8576777, -2.380904, 1, 0.5215687, 0, 1,
-1.327415, 0.6712204, -0.6045094, 1, 0.5294118, 0, 1,
-1.323539, 1.669091, -1.181488, 1, 0.5333334, 0, 1,
-1.323034, 0.5873747, 0.471992, 1, 0.5411765, 0, 1,
-1.316045, -0.8307567, -4.378783, 1, 0.5450981, 0, 1,
-1.31328, -1.192472, -2.030421, 1, 0.5529412, 0, 1,
-1.292222, -0.4217696, -2.560906, 1, 0.5568628, 0, 1,
-1.290009, -0.1091342, -0.9070054, 1, 0.5647059, 0, 1,
-1.285574, 0.2139936, -0.9232059, 1, 0.5686275, 0, 1,
-1.284514, -1.490514, -2.695595, 1, 0.5764706, 0, 1,
-1.271847, 1.031373, -0.344081, 1, 0.5803922, 0, 1,
-1.267349, 1.654864, -2.588268, 1, 0.5882353, 0, 1,
-1.266208, 0.3385052, -1.535601, 1, 0.5921569, 0, 1,
-1.264601, -0.3438825, -2.421339, 1, 0.6, 0, 1,
-1.264204, -0.7248927, -2.011158, 1, 0.6078432, 0, 1,
-1.256663, 1.624875, 0.8277639, 1, 0.6117647, 0, 1,
-1.25386, -0.09005749, -1.729088, 1, 0.6196079, 0, 1,
-1.245998, -0.5653812, -1.284821, 1, 0.6235294, 0, 1,
-1.242632, -0.1911771, -1.029765, 1, 0.6313726, 0, 1,
-1.233297, 1.048579, -2.210613, 1, 0.6352941, 0, 1,
-1.22743, -0.2939225, -1.902865, 1, 0.6431373, 0, 1,
-1.223245, 1.278393, 0.121437, 1, 0.6470588, 0, 1,
-1.209747, 1.313489, -1.139289, 1, 0.654902, 0, 1,
-1.208099, -0.6133774, -2.344817, 1, 0.6588235, 0, 1,
-1.205666, 1.535613, -0.8700456, 1, 0.6666667, 0, 1,
-1.199967, 0.744671, -2.076076, 1, 0.6705883, 0, 1,
-1.196939, -0.1877475, -2.207769, 1, 0.6784314, 0, 1,
-1.196786, -0.5984374, -2.914029, 1, 0.682353, 0, 1,
-1.196654, 1.081899, -0.1523213, 1, 0.6901961, 0, 1,
-1.190838, 1.322496, -1.460671, 1, 0.6941177, 0, 1,
-1.189938, -0.7916026, -1.78117, 1, 0.7019608, 0, 1,
-1.173256, -2.43662, -3.541041, 1, 0.7098039, 0, 1,
-1.170712, -1.320034, -2.629197, 1, 0.7137255, 0, 1,
-1.164475, -0.6275054, -2.855546, 1, 0.7215686, 0, 1,
-1.161214, -1.072437, -2.035573, 1, 0.7254902, 0, 1,
-1.158482, 0.6217818, -1.63758, 1, 0.7333333, 0, 1,
-1.155293, -0.7369112, -2.417495, 1, 0.7372549, 0, 1,
-1.149901, -0.115352, -0.8993388, 1, 0.7450981, 0, 1,
-1.131958, 1.411835, -0.6136242, 1, 0.7490196, 0, 1,
-1.122981, -0.07570876, -1.935278, 1, 0.7568628, 0, 1,
-1.117632, 0.7098497, -1.703504, 1, 0.7607843, 0, 1,
-1.114507, -0.302087, -2.190765, 1, 0.7686275, 0, 1,
-1.114215, -0.8334579, -2.360284, 1, 0.772549, 0, 1,
-1.110402, -1.698445, -2.25196, 1, 0.7803922, 0, 1,
-1.110351, -0.4620158, -0.5176983, 1, 0.7843137, 0, 1,
-1.108369, -0.09745695, -0.8295361, 1, 0.7921569, 0, 1,
-1.104447, -0.543843, -0.3274308, 1, 0.7960784, 0, 1,
-1.100872, 0.06391566, -0.6698107, 1, 0.8039216, 0, 1,
-1.093716, 0.9451278, 0.1182069, 1, 0.8117647, 0, 1,
-1.093574, -0.6605224, -2.40045, 1, 0.8156863, 0, 1,
-1.091525, -0.6806744, -3.912151, 1, 0.8235294, 0, 1,
-1.091161, -1.259829, -1.96797, 1, 0.827451, 0, 1,
-1.084635, -0.0104893, -1.216725, 1, 0.8352941, 0, 1,
-1.083848, -0.07471297, -1.522387, 1, 0.8392157, 0, 1,
-1.075478, 0.5762674, -1.068289, 1, 0.8470588, 0, 1,
-1.072078, 0.7627919, -0.7829632, 1, 0.8509804, 0, 1,
-1.064467, 2.019737, 0.9161218, 1, 0.8588235, 0, 1,
-1.061818, -0.8960923, -0.7721325, 1, 0.8627451, 0, 1,
-1.057989, 0.1758119, 0.4931985, 1, 0.8705882, 0, 1,
-1.052945, -2.111811, -2.844738, 1, 0.8745098, 0, 1,
-1.048407, 1.082234, -0.6198321, 1, 0.8823529, 0, 1,
-1.048173, 0.03350129, -1.248321, 1, 0.8862745, 0, 1,
-1.044738, -1.507704, -1.661653, 1, 0.8941177, 0, 1,
-1.042097, -1.009379, -0.6770402, 1, 0.8980392, 0, 1,
-1.040497, -0.07077647, -3.347365, 1, 0.9058824, 0, 1,
-1.04031, -0.7688003, -2.332364, 1, 0.9137255, 0, 1,
-1.034327, 1.171922, -3.73895, 1, 0.9176471, 0, 1,
-1.025152, 0.4082352, -1.59545, 1, 0.9254902, 0, 1,
-1.014571, 0.4383367, -1.344467, 1, 0.9294118, 0, 1,
-1.014117, -0.104248, -0.2403033, 1, 0.9372549, 0, 1,
-0.9993734, 0.4308141, -0.7164243, 1, 0.9411765, 0, 1,
-0.9926999, 1.025221, -0.809005, 1, 0.9490196, 0, 1,
-0.9925567, -1.418715, -3.970388, 1, 0.9529412, 0, 1,
-0.9924403, -0.6520265, -2.501995, 1, 0.9607843, 0, 1,
-0.9764394, -1.414879, -3.918755, 1, 0.9647059, 0, 1,
-0.9654554, 0.05676207, -0.6320097, 1, 0.972549, 0, 1,
-0.9654499, 0.8398233, -3.196789, 1, 0.9764706, 0, 1,
-0.9636033, -3.111109, -1.346587, 1, 0.9843137, 0, 1,
-0.9630908, -0.8458082, -1.378716, 1, 0.9882353, 0, 1,
-0.9624126, 0.3854493, -0.4865138, 1, 0.9960784, 0, 1,
-0.9591917, -1.210661, -1.087721, 0.9960784, 1, 0, 1,
-0.9511421, 0.7876297, -0.8118305, 0.9921569, 1, 0, 1,
-0.9447685, -0.5946097, -3.135086, 0.9843137, 1, 0, 1,
-0.938454, -0.4979977, -0.7899483, 0.9803922, 1, 0, 1,
-0.9357448, -1.224024, -1.940779, 0.972549, 1, 0, 1,
-0.9340627, 0.3278225, -1.688469, 0.9686275, 1, 0, 1,
-0.9222672, 1.185818, -1.191819, 0.9607843, 1, 0, 1,
-0.920097, 1.51251, -1.613853, 0.9568627, 1, 0, 1,
-0.9195762, -1.073214, -0.8282785, 0.9490196, 1, 0, 1,
-0.9185296, -0.01768332, -2.276317, 0.945098, 1, 0, 1,
-0.913429, -0.09524623, -2.434954, 0.9372549, 1, 0, 1,
-0.9130985, 0.7879478, -0.7228652, 0.9333333, 1, 0, 1,
-0.9118465, -0.06476867, -0.2918358, 0.9254902, 1, 0, 1,
-0.9094464, 0.1123679, -1.389615, 0.9215686, 1, 0, 1,
-0.9091875, 0.3052033, -0.4327737, 0.9137255, 1, 0, 1,
-0.907055, 2.074774, -0.41355, 0.9098039, 1, 0, 1,
-0.9046645, 1.071737, -1.549748, 0.9019608, 1, 0, 1,
-0.8992517, -0.732815, -2.996846, 0.8941177, 1, 0, 1,
-0.8983252, 0.2263923, -1.078175, 0.8901961, 1, 0, 1,
-0.8980503, 1.629183, 0.2233478, 0.8823529, 1, 0, 1,
-0.8973911, 1.737966, -0.4313722, 0.8784314, 1, 0, 1,
-0.8929495, -2.523049, -3.225029, 0.8705882, 1, 0, 1,
-0.8877011, 1.01401, 1.932613, 0.8666667, 1, 0, 1,
-0.8860464, 1.354348, -1.714841, 0.8588235, 1, 0, 1,
-0.8845084, 0.504276, -1.79268, 0.854902, 1, 0, 1,
-0.8833019, 0.9952843, -1.073613, 0.8470588, 1, 0, 1,
-0.8808668, 0.5906917, -1.434957, 0.8431373, 1, 0, 1,
-0.8733204, 0.2824855, 0.342708, 0.8352941, 1, 0, 1,
-0.8722358, 0.1796091, -2.12088, 0.8313726, 1, 0, 1,
-0.8579496, 1.493021, -0.6526926, 0.8235294, 1, 0, 1,
-0.8573444, -0.7482873, -2.692913, 0.8196079, 1, 0, 1,
-0.8492029, -0.2196355, -1.172272, 0.8117647, 1, 0, 1,
-0.8478563, -0.5685051, -4.125366, 0.8078431, 1, 0, 1,
-0.8474255, 0.6885232, -1.604106, 0.8, 1, 0, 1,
-0.8423596, -0.2493273, -2.113653, 0.7921569, 1, 0, 1,
-0.8412401, -0.5308241, -2.758058, 0.7882353, 1, 0, 1,
-0.8404863, -0.7230347, -1.104798, 0.7803922, 1, 0, 1,
-0.8398386, -0.3641452, -2.188428, 0.7764706, 1, 0, 1,
-0.8371025, -1.218913, 0.1533192, 0.7686275, 1, 0, 1,
-0.8353587, -0.7251852, -2.087243, 0.7647059, 1, 0, 1,
-0.8297585, -0.3982367, -1.386943, 0.7568628, 1, 0, 1,
-0.8283821, -0.4608954, -2.665303, 0.7529412, 1, 0, 1,
-0.8249879, 1.59305, -0.3584737, 0.7450981, 1, 0, 1,
-0.8210191, -1.203132, -1.885385, 0.7411765, 1, 0, 1,
-0.8154126, -0.6278625, -2.875072, 0.7333333, 1, 0, 1,
-0.8089048, -0.9728861, -3.989382, 0.7294118, 1, 0, 1,
-0.7893338, -0.2299281, -2.443446, 0.7215686, 1, 0, 1,
-0.7875822, 1.266726, 0.1289044, 0.7176471, 1, 0, 1,
-0.7866047, -1.111315, -4.030635, 0.7098039, 1, 0, 1,
-0.7777742, 1.763115, 0.8726988, 0.7058824, 1, 0, 1,
-0.7774901, 1.648381, -1.052935, 0.6980392, 1, 0, 1,
-0.7755211, 0.5685985, -1.510081, 0.6901961, 1, 0, 1,
-0.7752542, -1.258038, -2.236927, 0.6862745, 1, 0, 1,
-0.7730465, -0.5123199, -1.575043, 0.6784314, 1, 0, 1,
-0.768882, -0.08300925, -1.07321, 0.6745098, 1, 0, 1,
-0.7568208, 0.02347626, -2.421671, 0.6666667, 1, 0, 1,
-0.7546325, -1.335245, -3.225134, 0.6627451, 1, 0, 1,
-0.7517474, -0.8130863, -2.786275, 0.654902, 1, 0, 1,
-0.7484346, -0.2220102, -1.970686, 0.6509804, 1, 0, 1,
-0.7460113, -0.8141333, -0.6191486, 0.6431373, 1, 0, 1,
-0.7452919, -1.105859, -2.363614, 0.6392157, 1, 0, 1,
-0.7351384, -1.03873, -3.401402, 0.6313726, 1, 0, 1,
-0.7341636, -1.405512, -3.108099, 0.627451, 1, 0, 1,
-0.7213526, -1.408558, -2.868865, 0.6196079, 1, 0, 1,
-0.7204987, 0.3096868, -3.550037, 0.6156863, 1, 0, 1,
-0.7151108, 1.30982, -1.427585, 0.6078432, 1, 0, 1,
-0.7139972, -1.908915, -3.10891, 0.6039216, 1, 0, 1,
-0.7139441, -0.5137342, -1.030146, 0.5960785, 1, 0, 1,
-0.7117888, -0.9087512, -3.627424, 0.5882353, 1, 0, 1,
-0.7093956, 0.1741639, -0.9941344, 0.5843138, 1, 0, 1,
-0.7021437, -0.7865351, -3.283344, 0.5764706, 1, 0, 1,
-0.6971787, -0.4796252, -2.309172, 0.572549, 1, 0, 1,
-0.6965262, -0.5108277, -2.080353, 0.5647059, 1, 0, 1,
-0.6938479, 0.2995813, -1.156556, 0.5607843, 1, 0, 1,
-0.6925503, -0.4507853, -1.66746, 0.5529412, 1, 0, 1,
-0.6925218, 0.2043005, -0.3266113, 0.5490196, 1, 0, 1,
-0.6900305, 0.9560089, 0.9980925, 0.5411765, 1, 0, 1,
-0.6824489, -1.205544, -4.492652, 0.5372549, 1, 0, 1,
-0.6814895, -0.5328482, -3.46622, 0.5294118, 1, 0, 1,
-0.6776481, -0.9205687, -3.490475, 0.5254902, 1, 0, 1,
-0.6757045, 0.0610761, -1.439134, 0.5176471, 1, 0, 1,
-0.6699877, -0.9466534, -3.517119, 0.5137255, 1, 0, 1,
-0.6654866, -0.5522328, -0.3811089, 0.5058824, 1, 0, 1,
-0.6650282, 0.9517905, -0.5509965, 0.5019608, 1, 0, 1,
-0.6617358, 0.3313659, -0.8475881, 0.4941176, 1, 0, 1,
-0.6611272, -0.6023108, -3.175545, 0.4862745, 1, 0, 1,
-0.6598437, -0.9496255, -3.368691, 0.4823529, 1, 0, 1,
-0.6571931, 0.3841173, -2.281774, 0.4745098, 1, 0, 1,
-0.6510901, 1.827967, -0.29905, 0.4705882, 1, 0, 1,
-0.6438891, -0.3044621, -0.6559814, 0.4627451, 1, 0, 1,
-0.6424003, 0.3171063, -1.264878, 0.4588235, 1, 0, 1,
-0.623051, -0.8831453, -1.715275, 0.4509804, 1, 0, 1,
-0.6197086, 0.2485393, -0.6807615, 0.4470588, 1, 0, 1,
-0.6195977, -0.9332867, -1.093913, 0.4392157, 1, 0, 1,
-0.6173534, 0.3380504, -1.276715, 0.4352941, 1, 0, 1,
-0.6150467, -0.3929344, -3.059913, 0.427451, 1, 0, 1,
-0.6138265, -0.8422658, -2.298625, 0.4235294, 1, 0, 1,
-0.6122805, -0.730875, -0.6078654, 0.4156863, 1, 0, 1,
-0.6065628, -1.798694, -3.312446, 0.4117647, 1, 0, 1,
-0.6060029, -0.6241098, -2.429493, 0.4039216, 1, 0, 1,
-0.6032385, -0.4560182, -0.9917026, 0.3960784, 1, 0, 1,
-0.6016116, 1.04664, 1.051297, 0.3921569, 1, 0, 1,
-0.5966217, -1.022341, -1.263088, 0.3843137, 1, 0, 1,
-0.5952768, -0.4266642, -2.050426, 0.3803922, 1, 0, 1,
-0.5927671, 0.007041335, -1.765037, 0.372549, 1, 0, 1,
-0.592006, -0.9859849, -2.707085, 0.3686275, 1, 0, 1,
-0.5868258, -0.2479184, -1.310556, 0.3607843, 1, 0, 1,
-0.5861484, -0.4964148, -2.693903, 0.3568628, 1, 0, 1,
-0.5841066, 0.08845475, 0.4132369, 0.3490196, 1, 0, 1,
-0.5750412, -0.2054845, -2.89813, 0.345098, 1, 0, 1,
-0.5748531, 0.5173091, -1.51024, 0.3372549, 1, 0, 1,
-0.5724972, 0.8764021, 1.372563, 0.3333333, 1, 0, 1,
-0.5719265, -0.4645498, -1.887487, 0.3254902, 1, 0, 1,
-0.570714, -1.176061, -4.567618, 0.3215686, 1, 0, 1,
-0.5648038, -0.4953753, -0.8874034, 0.3137255, 1, 0, 1,
-0.5594691, -0.3622773, -0.7807279, 0.3098039, 1, 0, 1,
-0.5519363, -2.132828, -3.656972, 0.3019608, 1, 0, 1,
-0.5519317, -2.068099, -1.728353, 0.2941177, 1, 0, 1,
-0.547751, -0.3001094, -0.9715799, 0.2901961, 1, 0, 1,
-0.541241, 1.377597, -0.8557048, 0.282353, 1, 0, 1,
-0.5410535, -1.214162, -2.803662, 0.2784314, 1, 0, 1,
-0.534501, -0.272736, -2.210844, 0.2705882, 1, 0, 1,
-0.5272001, -1.025311, -2.919666, 0.2666667, 1, 0, 1,
-0.5228953, 1.191401, -1.194364, 0.2588235, 1, 0, 1,
-0.520413, -0.2025348, -2.67545, 0.254902, 1, 0, 1,
-0.5199061, 0.08944199, -1.34748, 0.2470588, 1, 0, 1,
-0.5163333, 0.2879312, -0.7364255, 0.2431373, 1, 0, 1,
-0.5158369, 0.7140114, -0.5397143, 0.2352941, 1, 0, 1,
-0.5155595, 1.370233, -0.4999516, 0.2313726, 1, 0, 1,
-0.5037476, -0.4544437, -2.006659, 0.2235294, 1, 0, 1,
-0.5027189, 1.494988, -1.245775, 0.2196078, 1, 0, 1,
-0.501106, -0.2889054, -0.3227102, 0.2117647, 1, 0, 1,
-0.5009757, 1.670267, 0.8401897, 0.2078431, 1, 0, 1,
-0.4963861, -0.2795396, -0.8742503, 0.2, 1, 0, 1,
-0.4896864, 0.1351046, -2.256731, 0.1921569, 1, 0, 1,
-0.4846712, -1.904789, -2.945628, 0.1882353, 1, 0, 1,
-0.4812922, -1.144344, -3.719486, 0.1803922, 1, 0, 1,
-0.4800467, -1.695459, -1.686285, 0.1764706, 1, 0, 1,
-0.4782907, 0.0263892, -1.086041, 0.1686275, 1, 0, 1,
-0.4747927, 0.8536081, -0.3089849, 0.1647059, 1, 0, 1,
-0.473788, 0.09512072, -1.272565, 0.1568628, 1, 0, 1,
-0.4705732, -0.003305669, -1.23345, 0.1529412, 1, 0, 1,
-0.4625308, -1.234567, -2.439695, 0.145098, 1, 0, 1,
-0.4545682, 0.3559704, 0.5135146, 0.1411765, 1, 0, 1,
-0.4459036, 0.01911918, -2.175085, 0.1333333, 1, 0, 1,
-0.4438647, -0.5116659, -3.61807, 0.1294118, 1, 0, 1,
-0.4431119, 0.7480898, 1.171649, 0.1215686, 1, 0, 1,
-0.4421439, 1.081351, -1.764781, 0.1176471, 1, 0, 1,
-0.4355813, 0.7137342, -0.8521637, 0.1098039, 1, 0, 1,
-0.4352992, 0.397155, -1.649391, 0.1058824, 1, 0, 1,
-0.4348054, 1.735196, -2.19568, 0.09803922, 1, 0, 1,
-0.4299148, 1.993682, 0.01780811, 0.09019608, 1, 0, 1,
-0.4295278, -0.06809731, -0.9718413, 0.08627451, 1, 0, 1,
-0.4266378, 2.197641, -1.398387, 0.07843138, 1, 0, 1,
-0.4247728, 0.2172022, -1.246392, 0.07450981, 1, 0, 1,
-0.4199758, 1.342048, -2.350174, 0.06666667, 1, 0, 1,
-0.4139245, -0.374299, -2.005946, 0.0627451, 1, 0, 1,
-0.4109138, 1.840101, -0.09987269, 0.05490196, 1, 0, 1,
-0.4106119, -0.5325587, -1.068136, 0.05098039, 1, 0, 1,
-0.4098554, -0.0668985, -3.444667, 0.04313726, 1, 0, 1,
-0.4079124, 1.639852, 0.8386708, 0.03921569, 1, 0, 1,
-0.4040635, 0.727554, -1.232012, 0.03137255, 1, 0, 1,
-0.4039603, 0.9935245, 0.1278115, 0.02745098, 1, 0, 1,
-0.4020104, 0.4340116, 1.417696, 0.01960784, 1, 0, 1,
-0.3951724, 0.135574, -1.722893, 0.01568628, 1, 0, 1,
-0.3897954, 0.3047596, -0.9972754, 0.007843138, 1, 0, 1,
-0.3843383, 0.7023059, -0.972249, 0.003921569, 1, 0, 1,
-0.3774973, 0.02233381, -2.175564, 0, 1, 0.003921569, 1,
-0.3767616, -0.09802292, -1.068853, 0, 1, 0.01176471, 1,
-0.3757124, 1.170796, 0.1051547, 0, 1, 0.01568628, 1,
-0.3745149, -1.020156, -3.928723, 0, 1, 0.02352941, 1,
-0.371547, -0.8884017, -1.340942, 0, 1, 0.02745098, 1,
-0.3702691, 2.028148, -0.5301453, 0, 1, 0.03529412, 1,
-0.3686397, -0.2002245, -2.69725, 0, 1, 0.03921569, 1,
-0.3673892, -1.70278, -3.502309, 0, 1, 0.04705882, 1,
-0.3662794, -0.8046338, -4.909378, 0, 1, 0.05098039, 1,
-0.365712, 2.050504, -2.066629, 0, 1, 0.05882353, 1,
-0.3607148, 0.1147389, -0.4034513, 0, 1, 0.0627451, 1,
-0.3605658, -0.5347618, -2.738574, 0, 1, 0.07058824, 1,
-0.3592388, -0.376803, -3.767215, 0, 1, 0.07450981, 1,
-0.3571981, 0.5584457, -1.269349, 0, 1, 0.08235294, 1,
-0.3565526, -0.4189919, -3.558854, 0, 1, 0.08627451, 1,
-0.3537277, 1.526878, -1.231361, 0, 1, 0.09411765, 1,
-0.3534847, -0.8440262, -2.098474, 0, 1, 0.1019608, 1,
-0.3530902, 1.09662, 0.1362865, 0, 1, 0.1058824, 1,
-0.347926, -1.781519, -3.030435, 0, 1, 0.1137255, 1,
-0.3465356, -0.310105, -2.242215, 0, 1, 0.1176471, 1,
-0.3449264, -0.3664239, -3.66248, 0, 1, 0.1254902, 1,
-0.3434551, -0.5703704, -4.552804, 0, 1, 0.1294118, 1,
-0.3423505, 0.04112973, -0.5279598, 0, 1, 0.1372549, 1,
-0.3418185, -2.044953, -1.913181, 0, 1, 0.1411765, 1,
-0.3417269, -1.465261, -1.796461, 0, 1, 0.1490196, 1,
-0.3377458, -0.9437894, -4.248693, 0, 1, 0.1529412, 1,
-0.329366, 1.860093, -0.8683308, 0, 1, 0.1607843, 1,
-0.3284355, 1.535599, -0.3827279, 0, 1, 0.1647059, 1,
-0.3235522, 0.6822994, 0.03276093, 0, 1, 0.172549, 1,
-0.3233007, -1.472239, -2.98717, 0, 1, 0.1764706, 1,
-0.3146454, -0.874904, -3.017811, 0, 1, 0.1843137, 1,
-0.3074546, 0.2780086, -0.4132267, 0, 1, 0.1882353, 1,
-0.3066378, 0.7927125, -2.857869, 0, 1, 0.1960784, 1,
-0.3058389, 0.4657497, -1.567071, 0, 1, 0.2039216, 1,
-0.3042108, -0.6121417, -3.767568, 0, 1, 0.2078431, 1,
-0.2972509, -0.4720544, -3.139614, 0, 1, 0.2156863, 1,
-0.2966882, -1.020246, -2.308892, 0, 1, 0.2196078, 1,
-0.2920446, -1.641968, -2.677386, 0, 1, 0.227451, 1,
-0.2916843, 0.6582916, 0.4703154, 0, 1, 0.2313726, 1,
-0.2916183, 0.6194457, -0.5651429, 0, 1, 0.2392157, 1,
-0.2868365, -1.133821, -3.957247, 0, 1, 0.2431373, 1,
-0.2848847, -1.862915, -2.363047, 0, 1, 0.2509804, 1,
-0.2828405, 0.1299361, -1.926135, 0, 1, 0.254902, 1,
-0.2806694, -0.1727451, -5.238443, 0, 1, 0.2627451, 1,
-0.2792405, 0.4608563, -2.189024, 0, 1, 0.2666667, 1,
-0.2757601, 0.9972035, 0.7055633, 0, 1, 0.2745098, 1,
-0.2739104, 1.189047, 1.604304, 0, 1, 0.2784314, 1,
-0.2734898, -1.744207, -3.479734, 0, 1, 0.2862745, 1,
-0.2603422, 0.6438542, -1.27186, 0, 1, 0.2901961, 1,
-0.2545221, 0.5416645, -1.325014, 0, 1, 0.2980392, 1,
-0.2509353, -0.717554, -2.799712, 0, 1, 0.3058824, 1,
-0.2507388, 0.9927167, -0.6083098, 0, 1, 0.3098039, 1,
-0.2400901, -2.819727, -4.797199, 0, 1, 0.3176471, 1,
-0.2387816, -1.417612, -2.676677, 0, 1, 0.3215686, 1,
-0.2340637, -0.5993422, -3.451009, 0, 1, 0.3294118, 1,
-0.2340076, -1.074573, -2.847983, 0, 1, 0.3333333, 1,
-0.2261971, -0.5053871, -1.161751, 0, 1, 0.3411765, 1,
-0.224975, -0.7175629, -1.643071, 0, 1, 0.345098, 1,
-0.2236424, -1.756438, -4.210017, 0, 1, 0.3529412, 1,
-0.2195111, -0.3943612, -3.04583, 0, 1, 0.3568628, 1,
-0.2164071, 1.354459, -0.6315866, 0, 1, 0.3647059, 1,
-0.2160329, 0.9116893, 0.2157726, 0, 1, 0.3686275, 1,
-0.2136608, 2.008202, 0.3703148, 0, 1, 0.3764706, 1,
-0.2098756, 0.3142415, -0.2581359, 0, 1, 0.3803922, 1,
-0.2031561, -1.8528, -4.912842, 0, 1, 0.3882353, 1,
-0.2025975, -1.224946, -3.753124, 0, 1, 0.3921569, 1,
-0.2012008, 1.34723, 0.3349241, 0, 1, 0.4, 1,
-0.1982898, -2.356577, -4.159505, 0, 1, 0.4078431, 1,
-0.1982058, -2.367277, -4.156834, 0, 1, 0.4117647, 1,
-0.1975759, -0.1512973, -2.421898, 0, 1, 0.4196078, 1,
-0.1955739, 0.1992944, -0.5436834, 0, 1, 0.4235294, 1,
-0.1946873, -1.682606, -0.6480095, 0, 1, 0.4313726, 1,
-0.1935357, 0.5367416, -0.5716405, 0, 1, 0.4352941, 1,
-0.1933348, -1.527775, -3.527656, 0, 1, 0.4431373, 1,
-0.1914821, -1.26012, -2.692662, 0, 1, 0.4470588, 1,
-0.1881277, -0.2092495, -2.376636, 0, 1, 0.454902, 1,
-0.1840415, -0.7347348, -3.687714, 0, 1, 0.4588235, 1,
-0.1796193, -0.5738639, -2.058855, 0, 1, 0.4666667, 1,
-0.1793932, 0.3857658, 0.7515427, 0, 1, 0.4705882, 1,
-0.1748169, 0.3744376, -1.256284, 0, 1, 0.4784314, 1,
-0.1667784, -3.144418, -2.232833, 0, 1, 0.4823529, 1,
-0.1664961, -1.511397, -3.395329, 0, 1, 0.4901961, 1,
-0.1654878, 1.579384, 1.456357, 0, 1, 0.4941176, 1,
-0.1639839, -1.90593, -3.131886, 0, 1, 0.5019608, 1,
-0.1583979, -0.09701816, -2.338769, 0, 1, 0.509804, 1,
-0.1582368, 3.039644, 0.07725383, 0, 1, 0.5137255, 1,
-0.1572502, 0.08718762, 1.669915, 0, 1, 0.5215687, 1,
-0.1517406, -0.6220403, -1.754442, 0, 1, 0.5254902, 1,
-0.1487083, -0.3878777, -3.048686, 0, 1, 0.5333334, 1,
-0.1451679, -1.270428, -2.269659, 0, 1, 0.5372549, 1,
-0.1439068, 0.4283715, 0.2363954, 0, 1, 0.5450981, 1,
-0.1418646, -0.7971511, -3.462407, 0, 1, 0.5490196, 1,
-0.1376121, -0.7877443, -3.713223, 0, 1, 0.5568628, 1,
-0.1311437, 0.246778, -1.197449, 0, 1, 0.5607843, 1,
-0.1257169, 0.1968454, -2.31927, 0, 1, 0.5686275, 1,
-0.1249872, 0.2848569, -0.4967072, 0, 1, 0.572549, 1,
-0.124738, 0.8404192, 1.813482, 0, 1, 0.5803922, 1,
-0.1233194, -0.3235355, -3.158667, 0, 1, 0.5843138, 1,
-0.1228046, -0.2989691, -4.097575, 0, 1, 0.5921569, 1,
-0.119543, 0.7422385, 1.233175, 0, 1, 0.5960785, 1,
-0.1177514, -0.1550983, -1.176547, 0, 1, 0.6039216, 1,
-0.1173348, 0.644756, -1.922028, 0, 1, 0.6117647, 1,
-0.1127694, -1.22016, -0.9635321, 0, 1, 0.6156863, 1,
-0.1108057, -0.4439299, -2.389438, 0, 1, 0.6235294, 1,
-0.1106204, 1.110792, -0.6233127, 0, 1, 0.627451, 1,
-0.1103201, -0.00615947, 0.8688402, 0, 1, 0.6352941, 1,
-0.1102796, -2.270397, -2.438508, 0, 1, 0.6392157, 1,
-0.1098756, 0.2723061, -0.8916221, 0, 1, 0.6470588, 1,
-0.1085551, 0.006938362, -0.6687446, 0, 1, 0.6509804, 1,
-0.1083561, -1.00518, -4.042485, 0, 1, 0.6588235, 1,
-0.1066662, 1.576798, 0.2264677, 0, 1, 0.6627451, 1,
-0.1043495, 0.8286074, 0.5059153, 0, 1, 0.6705883, 1,
-0.1005987, 0.4303125, -1.423333, 0, 1, 0.6745098, 1,
-0.09988464, 1.296202, 1.019764, 0, 1, 0.682353, 1,
-0.09955236, -0.4920328, -3.395295, 0, 1, 0.6862745, 1,
-0.09716805, 1.595688, 0.004431712, 0, 1, 0.6941177, 1,
-0.09639497, 0.5045043, -1.607276, 0, 1, 0.7019608, 1,
-0.09555687, 0.4164878, 1.432179, 0, 1, 0.7058824, 1,
-0.09441973, 1.168542, 1.699066, 0, 1, 0.7137255, 1,
-0.09425841, -0.257405, -3.278093, 0, 1, 0.7176471, 1,
-0.09068573, 1.373964, 1.563226, 0, 1, 0.7254902, 1,
-0.09039372, -1.164317, -2.234078, 0, 1, 0.7294118, 1,
-0.08860005, -1.356962, -3.856458, 0, 1, 0.7372549, 1,
-0.08346225, -0.7891604, -2.797671, 0, 1, 0.7411765, 1,
-0.0828327, 0.1165054, -1.042285, 0, 1, 0.7490196, 1,
-0.08118334, -0.3840582, -3.186296, 0, 1, 0.7529412, 1,
-0.07817019, 0.5374896, -0.4748199, 0, 1, 0.7607843, 1,
-0.07336177, -0.5085238, -2.755081, 0, 1, 0.7647059, 1,
-0.06707505, -1.635241, -2.997155, 0, 1, 0.772549, 1,
-0.06190216, 0.9828463, 0.1044957, 0, 1, 0.7764706, 1,
-0.06167857, 1.606536, 0.7775339, 0, 1, 0.7843137, 1,
-0.05927329, 1.348881, 1.163928, 0, 1, 0.7882353, 1,
-0.05803538, -1.277074, -2.039213, 0, 1, 0.7960784, 1,
-0.05731781, 0.3329806, 0.1195153, 0, 1, 0.8039216, 1,
-0.05527369, 1.128011, -0.8136169, 0, 1, 0.8078431, 1,
-0.05158198, -0.5390536, -3.365605, 0, 1, 0.8156863, 1,
-0.05112682, 0.9268827, -0.2696892, 0, 1, 0.8196079, 1,
-0.05090646, 0.1503901, -0.9498237, 0, 1, 0.827451, 1,
-0.05084229, 1.854012, 0.5968521, 0, 1, 0.8313726, 1,
-0.05068095, -0.3058775, -5.3035, 0, 1, 0.8392157, 1,
-0.05056784, 0.9759411, -0.2088636, 0, 1, 0.8431373, 1,
-0.05000453, 1.302899, 0.9540955, 0, 1, 0.8509804, 1,
-0.04941289, 0.8590192, -0.9974194, 0, 1, 0.854902, 1,
-0.04927782, 1.234316, 0.4103342, 0, 1, 0.8627451, 1,
-0.04544475, 1.094144, -1.634728, 0, 1, 0.8666667, 1,
-0.04408452, 0.2298421, 1.741158, 0, 1, 0.8745098, 1,
-0.04278516, 0.7364662, 0.6747838, 0, 1, 0.8784314, 1,
-0.03241786, -1.326304, -4.155764, 0, 1, 0.8862745, 1,
-0.02987091, -2.172093, -4.797112, 0, 1, 0.8901961, 1,
-0.02839991, -0.9580725, -1.831824, 0, 1, 0.8980392, 1,
-0.02788372, -0.9410332, -4.724231, 0, 1, 0.9058824, 1,
-0.02553007, 0.3838052, 0.8454496, 0, 1, 0.9098039, 1,
-0.02415457, -1.550756, -3.612386, 0, 1, 0.9176471, 1,
-0.02294191, -0.2004749, -2.168312, 0, 1, 0.9215686, 1,
-0.01611292, 1.640054, 0.9215959, 0, 1, 0.9294118, 1,
-0.01007364, -1.067511, -2.78761, 0, 1, 0.9333333, 1,
-0.005514317, -1.264936, -1.499421, 0, 1, 0.9411765, 1,
-0.00549933, -0.6964011, -3.469732, 0, 1, 0.945098, 1,
0.0006125933, -0.2075618, 3.131356, 0, 1, 0.9529412, 1,
0.002932532, 0.4627978, 0.9535096, 0, 1, 0.9568627, 1,
0.009771393, -1.982741, 4.607419, 0, 1, 0.9647059, 1,
0.01090148, -1.115828, 3.524886, 0, 1, 0.9686275, 1,
0.01324807, -0.1192742, 3.427623, 0, 1, 0.9764706, 1,
0.01573734, 0.9561015, 1.468153, 0, 1, 0.9803922, 1,
0.01675652, 1.145954, -0.2265865, 0, 1, 0.9882353, 1,
0.0176029, 1.903546, -0.3133992, 0, 1, 0.9921569, 1,
0.02652961, -0.407569, 1.170497, 0, 1, 1, 1,
0.02721828, -1.138858, 2.449845, 0, 0.9921569, 1, 1,
0.02897582, 0.08917091, -0.2687267, 0, 0.9882353, 1, 1,
0.02975677, -0.2295319, 1.941782, 0, 0.9803922, 1, 1,
0.03929101, -0.08240841, 1.311192, 0, 0.9764706, 1, 1,
0.05629896, -1.283569, 3.362153, 0, 0.9686275, 1, 1,
0.05644329, 0.8854847, -0.2242034, 0, 0.9647059, 1, 1,
0.05664316, -0.9766627, 2.606937, 0, 0.9568627, 1, 1,
0.0575651, -0.6122431, 3.550611, 0, 0.9529412, 1, 1,
0.05791637, -0.4111435, 3.322806, 0, 0.945098, 1, 1,
0.06304666, -1.443705, 2.756073, 0, 0.9411765, 1, 1,
0.06760056, -0.208828, 3.206118, 0, 0.9333333, 1, 1,
0.06984208, 0.7647804, 0.0560102, 0, 0.9294118, 1, 1,
0.07209589, -1.102901, 3.348128, 0, 0.9215686, 1, 1,
0.07222174, -0.1872678, 2.172181, 0, 0.9176471, 1, 1,
0.07589181, -0.5154443, 3.544825, 0, 0.9098039, 1, 1,
0.07865467, -0.515099, 3.755748, 0, 0.9058824, 1, 1,
0.07888955, -0.1326661, 3.930061, 0, 0.8980392, 1, 1,
0.0806058, -0.4279843, 2.214668, 0, 0.8901961, 1, 1,
0.08074465, 1.528799, 0.5638846, 0, 0.8862745, 1, 1,
0.08374798, 0.7008318, -0.5539092, 0, 0.8784314, 1, 1,
0.08734543, 0.3878585, -0.5723129, 0, 0.8745098, 1, 1,
0.08972339, -0.3665606, 3.329311, 0, 0.8666667, 1, 1,
0.09088781, -0.9846436, 3.789141, 0, 0.8627451, 1, 1,
0.09367281, -1.155515, 4.946067, 0, 0.854902, 1, 1,
0.09810751, -0.430629, 3.209427, 0, 0.8509804, 1, 1,
0.1023604, 0.2178188, 1.37118, 0, 0.8431373, 1, 1,
0.1059662, -0.4518434, 4.310101, 0, 0.8392157, 1, 1,
0.1071191, 0.3290232, -1.360289, 0, 0.8313726, 1, 1,
0.1079019, 0.6247734, 1.425889, 0, 0.827451, 1, 1,
0.1102051, 1.852507, -1.494483, 0, 0.8196079, 1, 1,
0.1102477, 0.4541433, 1.534079, 0, 0.8156863, 1, 1,
0.1168389, -1.032503, 3.562907, 0, 0.8078431, 1, 1,
0.1190461, -0.2132497, 2.349517, 0, 0.8039216, 1, 1,
0.1207154, 0.4117005, 0.9718488, 0, 0.7960784, 1, 1,
0.1288315, 0.02981704, 0.9405762, 0, 0.7882353, 1, 1,
0.1295318, -0.4210935, 3.075592, 0, 0.7843137, 1, 1,
0.1295428, 0.436002, 0.72593, 0, 0.7764706, 1, 1,
0.1296405, 0.3414292, 1.2363, 0, 0.772549, 1, 1,
0.1338831, -0.6564728, 2.481884, 0, 0.7647059, 1, 1,
0.1371922, 1.026751, -1.260853, 0, 0.7607843, 1, 1,
0.1391107, -0.9542446, 4.000578, 0, 0.7529412, 1, 1,
0.1415766, -0.9606666, 0.1797895, 0, 0.7490196, 1, 1,
0.1421191, -0.07226261, 1.310225, 0, 0.7411765, 1, 1,
0.1483911, 0.07534251, 2.427683, 0, 0.7372549, 1, 1,
0.1500533, -0.367256, 3.539635, 0, 0.7294118, 1, 1,
0.1504343, 0.06124363, 0.1225369, 0, 0.7254902, 1, 1,
0.1504399, 1.330835, 0.02470967, 0, 0.7176471, 1, 1,
0.1547553, -0.01127893, 0.5776095, 0, 0.7137255, 1, 1,
0.1578813, -1.306861, 0.7964134, 0, 0.7058824, 1, 1,
0.1583008, -0.6139429, 3.823203, 0, 0.6980392, 1, 1,
0.1629818, 0.5690902, -0.8848768, 0, 0.6941177, 1, 1,
0.1650106, -0.9651467, 4.441543, 0, 0.6862745, 1, 1,
0.1745268, 0.1661939, -0.2415302, 0, 0.682353, 1, 1,
0.1745635, -1.553696, 4.611858, 0, 0.6745098, 1, 1,
0.1780293, -2.19424, 3.639009, 0, 0.6705883, 1, 1,
0.1816465, 0.07988658, 1.643392, 0, 0.6627451, 1, 1,
0.1874332, 0.6272132, 0.01221717, 0, 0.6588235, 1, 1,
0.1896982, 0.09110663, 2.943566, 0, 0.6509804, 1, 1,
0.1903574, -0.5248613, 4.855458, 0, 0.6470588, 1, 1,
0.1935288, -0.112329, 0.8604456, 0, 0.6392157, 1, 1,
0.1938426, -1.356749, 2.508358, 0, 0.6352941, 1, 1,
0.2066304, 0.3264423, -1.838581, 0, 0.627451, 1, 1,
0.2078359, -1.580948, 2.18139, 0, 0.6235294, 1, 1,
0.2104995, 1.332064, -1.442833, 0, 0.6156863, 1, 1,
0.2116136, 0.3401989, 2.06367, 0, 0.6117647, 1, 1,
0.2135108, 1.64514, -1.06966, 0, 0.6039216, 1, 1,
0.2164525, -0.4500781, 2.795363, 0, 0.5960785, 1, 1,
0.216998, -0.2376097, 1.358081, 0, 0.5921569, 1, 1,
0.2195687, -0.497749, 2.747034, 0, 0.5843138, 1, 1,
0.2208087, 1.101824, -0.6850184, 0, 0.5803922, 1, 1,
0.2262221, 0.3282416, 0.637841, 0, 0.572549, 1, 1,
0.2310355, -0.2327064, 2.321026, 0, 0.5686275, 1, 1,
0.2317393, 0.2979774, -0.5697969, 0, 0.5607843, 1, 1,
0.2405158, -1.272374, 2.719656, 0, 0.5568628, 1, 1,
0.2406301, -1.232516, 3.805129, 0, 0.5490196, 1, 1,
0.2455998, 0.07499396, 0.7771346, 0, 0.5450981, 1, 1,
0.248992, 0.1406091, -0.911375, 0, 0.5372549, 1, 1,
0.249742, -0.0119085, 0.1693883, 0, 0.5333334, 1, 1,
0.2522041, -0.1487972, 1.591857, 0, 0.5254902, 1, 1,
0.2533624, -0.5641719, 4.290068, 0, 0.5215687, 1, 1,
0.2547394, -0.3649079, 2.017142, 0, 0.5137255, 1, 1,
0.2550506, -0.9413698, 3.778947, 0, 0.509804, 1, 1,
0.2553059, 0.174586, -0.3768877, 0, 0.5019608, 1, 1,
0.2553449, 1.301388, 1.036616, 0, 0.4941176, 1, 1,
0.2567252, -0.02260826, 1.615221, 0, 0.4901961, 1, 1,
0.2570692, -0.008353136, 0.4807589, 0, 0.4823529, 1, 1,
0.2633237, -0.3797728, 2.823661, 0, 0.4784314, 1, 1,
0.2658525, -1.659247, 2.29059, 0, 0.4705882, 1, 1,
0.2704456, -0.2086198, 1.518862, 0, 0.4666667, 1, 1,
0.2760116, 0.8785915, -0.625259, 0, 0.4588235, 1, 1,
0.2797021, -0.5282902, 2.675894, 0, 0.454902, 1, 1,
0.2832845, -2.021743, 4.227686, 0, 0.4470588, 1, 1,
0.2834974, -0.5467657, -0.04985013, 0, 0.4431373, 1, 1,
0.2841179, 0.4769959, 0.3225682, 0, 0.4352941, 1, 1,
0.2857414, -1.80377, 1.82811, 0, 0.4313726, 1, 1,
0.2877307, 0.4887723, -0.5533631, 0, 0.4235294, 1, 1,
0.2941735, 0.3177554, -0.1874812, 0, 0.4196078, 1, 1,
0.3060247, -0.6232394, 1.686951, 0, 0.4117647, 1, 1,
0.3067358, -1.086876, 3.044532, 0, 0.4078431, 1, 1,
0.3088845, -0.9362467, 3.418947, 0, 0.4, 1, 1,
0.3115182, 0.9234397, -0.3118045, 0, 0.3921569, 1, 1,
0.3149515, -0.3266166, 2.335256, 0, 0.3882353, 1, 1,
0.3215594, 0.7325597, 2.932845, 0, 0.3803922, 1, 1,
0.3258497, 1.006073, 1.891546, 0, 0.3764706, 1, 1,
0.3278814, -0.3116258, 1.429193, 0, 0.3686275, 1, 1,
0.3285483, 0.1546546, -0.2178338, 0, 0.3647059, 1, 1,
0.3386298, -0.825029, 1.577127, 0, 0.3568628, 1, 1,
0.3390192, -0.9741409, 3.892312, 0, 0.3529412, 1, 1,
0.3398755, 0.718321, 0.1183498, 0, 0.345098, 1, 1,
0.3406285, 0.4556638, 1.077818, 0, 0.3411765, 1, 1,
0.343491, 1.595192, 1.374429, 0, 0.3333333, 1, 1,
0.3477123, 0.3873895, -1.19522, 0, 0.3294118, 1, 1,
0.3510571, -0.03641533, 1.134701, 0, 0.3215686, 1, 1,
0.3532203, -1.050226, 3.266634, 0, 0.3176471, 1, 1,
0.3551621, 0.8278305, 0.3109638, 0, 0.3098039, 1, 1,
0.3557251, 1.206838, -0.1950544, 0, 0.3058824, 1, 1,
0.3561085, -0.9897743, 2.31365, 0, 0.2980392, 1, 1,
0.3592206, 1.67964, 0.7764182, 0, 0.2901961, 1, 1,
0.3594598, -0.9661059, 2.122929, 0, 0.2862745, 1, 1,
0.3600593, -1.352652, 1.422531, 0, 0.2784314, 1, 1,
0.3602455, 0.8307302, 0.5766332, 0, 0.2745098, 1, 1,
0.3687513, 1.417733, -0.1629695, 0, 0.2666667, 1, 1,
0.3694646, -0.07782903, 1.666501, 0, 0.2627451, 1, 1,
0.3715959, 1.047018, -0.7831755, 0, 0.254902, 1, 1,
0.3722161, -1.039267, 2.944582, 0, 0.2509804, 1, 1,
0.3730761, -0.406087, 1.562311, 0, 0.2431373, 1, 1,
0.3743452, -1.582561, 3.634386, 0, 0.2392157, 1, 1,
0.3745849, -0.5884356, 2.599726, 0, 0.2313726, 1, 1,
0.3754791, -1.288885, 3.547002, 0, 0.227451, 1, 1,
0.3771868, -0.8607398, 1.047726, 0, 0.2196078, 1, 1,
0.3820601, -1.974982, 2.559854, 0, 0.2156863, 1, 1,
0.3838791, 1.183143, 1.638344, 0, 0.2078431, 1, 1,
0.3848878, -1.290328, 4.399691, 0, 0.2039216, 1, 1,
0.3901594, 0.4829358, 1.042058, 0, 0.1960784, 1, 1,
0.3903301, 1.244283, 1.622433, 0, 0.1882353, 1, 1,
0.3905599, -0.2935811, 1.314566, 0, 0.1843137, 1, 1,
0.3905679, -1.493918, 0.5353755, 0, 0.1764706, 1, 1,
0.3931163, 2.041151, 0.8293197, 0, 0.172549, 1, 1,
0.397833, -0.6319409, 2.192835, 0, 0.1647059, 1, 1,
0.3988178, 1.380026, -0.02416733, 0, 0.1607843, 1, 1,
0.3996913, 0.08220972, 1.402509, 0, 0.1529412, 1, 1,
0.3999315, 0.8189816, 0.4880406, 0, 0.1490196, 1, 1,
0.4000278, -0.536318, 3.105599, 0, 0.1411765, 1, 1,
0.4019855, -0.08411306, 2.746553, 0, 0.1372549, 1, 1,
0.4024408, -0.8455637, 3.271188, 0, 0.1294118, 1, 1,
0.4048313, -0.4651037, 2.063494, 0, 0.1254902, 1, 1,
0.406452, 0.4965669, -0.5953122, 0, 0.1176471, 1, 1,
0.40811, -0.3063122, 2.744529, 0, 0.1137255, 1, 1,
0.4086972, 0.2804005, 0.1938538, 0, 0.1058824, 1, 1,
0.409681, -0.04386069, 2.187853, 0, 0.09803922, 1, 1,
0.411144, -0.4495812, 3.979286, 0, 0.09411765, 1, 1,
0.412551, 0.8708785, 0.5843219, 0, 0.08627451, 1, 1,
0.41638, 2.164717, -0.3860932, 0, 0.08235294, 1, 1,
0.4205402, 0.1737989, -0.02397753, 0, 0.07450981, 1, 1,
0.4229891, 0.741954, 1.592016, 0, 0.07058824, 1, 1,
0.4252011, 0.5420514, -0.6709815, 0, 0.0627451, 1, 1,
0.4263588, 1.255098, 0.4531213, 0, 0.05882353, 1, 1,
0.4278615, -1.200065, 2.241566, 0, 0.05098039, 1, 1,
0.4287329, 0.7882046, 0.01267901, 0, 0.04705882, 1, 1,
0.431237, -0.03242655, 1.760902, 0, 0.03921569, 1, 1,
0.4316064, 1.090042, 0.4478371, 0, 0.03529412, 1, 1,
0.4329801, -1.189382, 0.6316596, 0, 0.02745098, 1, 1,
0.4366486, -1.012264, 3.891642, 0, 0.02352941, 1, 1,
0.4381689, 0.5709702, 1.428582, 0, 0.01568628, 1, 1,
0.438508, -0.07575667, 1.22604, 0, 0.01176471, 1, 1,
0.4400266, 0.8994246, 0.2677616, 0, 0.003921569, 1, 1,
0.4455068, -0.2504721, 4.150794, 0.003921569, 0, 1, 1,
0.447187, 0.2380259, 1.508683, 0.007843138, 0, 1, 1,
0.4472349, -0.5837283, 2.306006, 0.01568628, 0, 1, 1,
0.4539817, 0.5565242, 0.4767126, 0.01960784, 0, 1, 1,
0.4550103, 0.1190918, 2.111763, 0.02745098, 0, 1, 1,
0.4560327, -0.8627936, 2.632263, 0.03137255, 0, 1, 1,
0.4570552, -0.001190559, 1.398509, 0.03921569, 0, 1, 1,
0.457714, -1.993637, 2.878873, 0.04313726, 0, 1, 1,
0.4578279, 1.707904, -0.1251982, 0.05098039, 0, 1, 1,
0.459068, -0.06596453, 0.5398587, 0.05490196, 0, 1, 1,
0.4592068, -1.157792, 2.485574, 0.0627451, 0, 1, 1,
0.4636508, 0.2529573, 0.1593763, 0.06666667, 0, 1, 1,
0.4704349, 0.6086834, 0.6064779, 0.07450981, 0, 1, 1,
0.4720368, -1.273278, 2.761629, 0.07843138, 0, 1, 1,
0.4732375, 1.206009, 0.2911097, 0.08627451, 0, 1, 1,
0.4773064, 0.5240998, -0.7627084, 0.09019608, 0, 1, 1,
0.4783301, 0.5580308, -0.2104066, 0.09803922, 0, 1, 1,
0.4894041, -0.08104628, 2.487068, 0.1058824, 0, 1, 1,
0.4904615, -1.212517, 3.281163, 0.1098039, 0, 1, 1,
0.4911881, -0.3629892, 3.445194, 0.1176471, 0, 1, 1,
0.4940449, 0.7278086, 0.5109914, 0.1215686, 0, 1, 1,
0.4941916, -1.920788, 1.624275, 0.1294118, 0, 1, 1,
0.4995726, 0.8472641, 2.262418, 0.1333333, 0, 1, 1,
0.4996989, 0.04324217, 1.874027, 0.1411765, 0, 1, 1,
0.500064, 0.6602316, 0.4928202, 0.145098, 0, 1, 1,
0.5130298, 0.6363305, 3.244165, 0.1529412, 0, 1, 1,
0.5213122, 0.1502741, -0.6418994, 0.1568628, 0, 1, 1,
0.5233193, 0.9024237, 0.3011054, 0.1647059, 0, 1, 1,
0.5235121, -0.420089, 2.113565, 0.1686275, 0, 1, 1,
0.5258981, -0.08718043, 1.152618, 0.1764706, 0, 1, 1,
0.5262088, 0.6220584, 0.9041157, 0.1803922, 0, 1, 1,
0.5296578, -1.018347, 3.034995, 0.1882353, 0, 1, 1,
0.5300752, -0.09974474, 0.1833599, 0.1921569, 0, 1, 1,
0.5301262, -0.5462972, 2.530349, 0.2, 0, 1, 1,
0.5368868, -0.4075919, 2.658391, 0.2078431, 0, 1, 1,
0.5423248, 0.9865903, 1.757441, 0.2117647, 0, 1, 1,
0.5448306, -1.294404, 3.005371, 0.2196078, 0, 1, 1,
0.5553808, -1.878854, 2.900438, 0.2235294, 0, 1, 1,
0.559464, -0.3234547, 1.233512, 0.2313726, 0, 1, 1,
0.5648885, -0.9761993, 2.830711, 0.2352941, 0, 1, 1,
0.5687656, 1.086878, 1.244577, 0.2431373, 0, 1, 1,
0.5722714, -0.3675939, 1.076728, 0.2470588, 0, 1, 1,
0.5736569, -0.2367387, 0.9684075, 0.254902, 0, 1, 1,
0.5749857, 1.946253, -0.533164, 0.2588235, 0, 1, 1,
0.5754105, 1.092642, -0.3249767, 0.2666667, 0, 1, 1,
0.5761507, -0.1257744, 2.002093, 0.2705882, 0, 1, 1,
0.5765907, 0.9791366, 0.6240275, 0.2784314, 0, 1, 1,
0.5773137, -0.7184486, 1.514696, 0.282353, 0, 1, 1,
0.5814152, -1.102857, 3.964995, 0.2901961, 0, 1, 1,
0.5822397, 0.9521562, 1.018997, 0.2941177, 0, 1, 1,
0.5896143, 0.7578567, -0.1232466, 0.3019608, 0, 1, 1,
0.5909751, 0.3581585, 3.348477, 0.3098039, 0, 1, 1,
0.5915823, 1.13607, 0.06110321, 0.3137255, 0, 1, 1,
0.5917203, 1.43284, -0.1260591, 0.3215686, 0, 1, 1,
0.5929618, 1.524818, -0.01895425, 0.3254902, 0, 1, 1,
0.5970448, -0.1274598, 1.212182, 0.3333333, 0, 1, 1,
0.5996899, 0.6208543, 2.521743, 0.3372549, 0, 1, 1,
0.6001747, -1.230977, 3.197626, 0.345098, 0, 1, 1,
0.6080142, 0.7045021, 1.420709, 0.3490196, 0, 1, 1,
0.6081104, -0.1816417, 0.4461937, 0.3568628, 0, 1, 1,
0.6091066, -0.6731874, 2.061814, 0.3607843, 0, 1, 1,
0.6095464, -1.145181, 2.152204, 0.3686275, 0, 1, 1,
0.6171109, -0.6884739, 2.618104, 0.372549, 0, 1, 1,
0.6247612, 0.2860635, 0.1912155, 0.3803922, 0, 1, 1,
0.6290016, 1.786126, -0.3183139, 0.3843137, 0, 1, 1,
0.6342515, 0.07358019, 2.774844, 0.3921569, 0, 1, 1,
0.6393805, 1.511526, 0.6861151, 0.3960784, 0, 1, 1,
0.6430344, 1.376066, 0.2473514, 0.4039216, 0, 1, 1,
0.6434398, 1.167716, 0.4706939, 0.4117647, 0, 1, 1,
0.6448988, -0.2280965, 1.614664, 0.4156863, 0, 1, 1,
0.64608, -0.7668431, 4.227807, 0.4235294, 0, 1, 1,
0.6469768, -1.579686, 3.557734, 0.427451, 0, 1, 1,
0.6479042, -0.3167333, 2.447301, 0.4352941, 0, 1, 1,
0.6493519, -1.634861, 1.524496, 0.4392157, 0, 1, 1,
0.6495924, 0.5004175, 3.988074, 0.4470588, 0, 1, 1,
0.6577619, -1.147395, 5.51635, 0.4509804, 0, 1, 1,
0.6589535, -0.0570794, 1.669303, 0.4588235, 0, 1, 1,
0.6599903, -1.47209, 2.26116, 0.4627451, 0, 1, 1,
0.6651638, 0.1186094, 1.519048, 0.4705882, 0, 1, 1,
0.6727974, -1.231681, 1.917721, 0.4745098, 0, 1, 1,
0.6740694, -0.6508892, 0.6807948, 0.4823529, 0, 1, 1,
0.6740977, -1.409078, 1.931009, 0.4862745, 0, 1, 1,
0.6764806, 1.817418, 1.374026, 0.4941176, 0, 1, 1,
0.6770825, 0.4396886, 0.05210931, 0.5019608, 0, 1, 1,
0.6777146, -1.30816, 2.937606, 0.5058824, 0, 1, 1,
0.6785337, 0.8142905, -0.6701553, 0.5137255, 0, 1, 1,
0.6785879, 0.249837, 1.599533, 0.5176471, 0, 1, 1,
0.6883959, -1.092602, 1.283486, 0.5254902, 0, 1, 1,
0.6890608, -1.917089, 3.144927, 0.5294118, 0, 1, 1,
0.6903668, 0.6025974, 1.420611, 0.5372549, 0, 1, 1,
0.7026004, 0.6134169, -0.4273224, 0.5411765, 0, 1, 1,
0.7031242, 1.147151, 2.368642, 0.5490196, 0, 1, 1,
0.7069589, 0.7078313, 3.808502, 0.5529412, 0, 1, 1,
0.7126859, -1.377537, 1.45326, 0.5607843, 0, 1, 1,
0.7146289, 0.2768373, 0.9489198, 0.5647059, 0, 1, 1,
0.7177521, 0.339222, -0.05791609, 0.572549, 0, 1, 1,
0.7212993, -0.0493177, 2.251777, 0.5764706, 0, 1, 1,
0.7234312, -0.5280391, 3.719746, 0.5843138, 0, 1, 1,
0.7277963, 1.549914, 1.303354, 0.5882353, 0, 1, 1,
0.7286037, 1.273147, 0.08348445, 0.5960785, 0, 1, 1,
0.7328146, -0.8041679, 3.397552, 0.6039216, 0, 1, 1,
0.7344736, -0.5228622, 2.232477, 0.6078432, 0, 1, 1,
0.7363217, -0.7652795, 2.139241, 0.6156863, 0, 1, 1,
0.7418922, 0.2602334, -0.3142426, 0.6196079, 0, 1, 1,
0.7458593, -1.248614, 3.266174, 0.627451, 0, 1, 1,
0.746051, -1.233429, 2.291047, 0.6313726, 0, 1, 1,
0.7472691, -0.4522138, 3.533888, 0.6392157, 0, 1, 1,
0.7476544, 0.5434526, 0.8234799, 0.6431373, 0, 1, 1,
0.7555484, 0.04889469, 1.633911, 0.6509804, 0, 1, 1,
0.7559302, 2.665725, -0.3756481, 0.654902, 0, 1, 1,
0.7569685, -0.3337795, 2.320845, 0.6627451, 0, 1, 1,
0.7666312, 2.157078, 0.4599207, 0.6666667, 0, 1, 1,
0.7707418, -0.1627489, 2.015497, 0.6745098, 0, 1, 1,
0.7711505, -0.938587, 1.961334, 0.6784314, 0, 1, 1,
0.7716562, -1.809289, 2.679308, 0.6862745, 0, 1, 1,
0.7746443, 0.5686154, 1.737302, 0.6901961, 0, 1, 1,
0.7764518, -1.022437, 2.377283, 0.6980392, 0, 1, 1,
0.7834072, -1.476683, 2.650681, 0.7058824, 0, 1, 1,
0.7953684, -0.5659477, 1.861871, 0.7098039, 0, 1, 1,
0.8006476, 0.5614167, 1.139004, 0.7176471, 0, 1, 1,
0.801647, -0.6405612, 2.28982, 0.7215686, 0, 1, 1,
0.8043736, -1.97323, 3.798076, 0.7294118, 0, 1, 1,
0.8068554, 0.2680281, 1.396466, 0.7333333, 0, 1, 1,
0.809107, 1.625222, -0.6112181, 0.7411765, 0, 1, 1,
0.8097973, 1.123578, 0.2460945, 0.7450981, 0, 1, 1,
0.8165077, -1.28358, 2.494341, 0.7529412, 0, 1, 1,
0.8181466, -0.1388072, -0.4790788, 0.7568628, 0, 1, 1,
0.8188196, -2.330083, 4.978207, 0.7647059, 0, 1, 1,
0.8248485, 1.629481, 1.579865, 0.7686275, 0, 1, 1,
0.8301868, -1.862571, 2.85844, 0.7764706, 0, 1, 1,
0.830516, 1.266423, 0.894146, 0.7803922, 0, 1, 1,
0.8320704, -0.274195, 0.5434669, 0.7882353, 0, 1, 1,
0.8381765, -1.345329, 2.525262, 0.7921569, 0, 1, 1,
0.8490497, 1.183841, -0.1484808, 0.8, 0, 1, 1,
0.8508694, -1.250353, 2.313159, 0.8078431, 0, 1, 1,
0.8516596, 0.5328537, 2.359943, 0.8117647, 0, 1, 1,
0.8561863, -0.3278199, 2.093196, 0.8196079, 0, 1, 1,
0.8620395, 0.7789786, -0.05564037, 0.8235294, 0, 1, 1,
0.8695254, -1.061904, 4.689398, 0.8313726, 0, 1, 1,
0.8704939, -0.4438624, 2.685692, 0.8352941, 0, 1, 1,
0.8721684, -0.8779386, 1.762903, 0.8431373, 0, 1, 1,
0.8778954, 0.245092, 0.505041, 0.8470588, 0, 1, 1,
0.8801908, 1.537151, 0.5253387, 0.854902, 0, 1, 1,
0.8860092, -1.046478, 2.90906, 0.8588235, 0, 1, 1,
0.8886367, 0.01382693, 1.229153, 0.8666667, 0, 1, 1,
0.8960719, -1.155679, 2.266647, 0.8705882, 0, 1, 1,
0.8984403, -1.552223, 4.189205, 0.8784314, 0, 1, 1,
0.9048949, 0.5519495, 1.728892, 0.8823529, 0, 1, 1,
0.9088023, -1.357937, 1.083514, 0.8901961, 0, 1, 1,
0.915181, -0.6352913, 2.589908, 0.8941177, 0, 1, 1,
0.9155882, -1.15717, 2.938618, 0.9019608, 0, 1, 1,
0.9233605, -2.10466, 3.263689, 0.9098039, 0, 1, 1,
0.9252048, -0.5247568, 0.4989186, 0.9137255, 0, 1, 1,
0.930446, 0.3387884, 1.232398, 0.9215686, 0, 1, 1,
0.9365897, 0.159098, 1.861188, 0.9254902, 0, 1, 1,
0.9399642, 0.640994, -0.7476723, 0.9333333, 0, 1, 1,
0.9415506, -1.035986, 1.613945, 0.9372549, 0, 1, 1,
0.9472483, -0.2047608, 1.61423, 0.945098, 0, 1, 1,
0.948582, 0.6640716, 1.556559, 0.9490196, 0, 1, 1,
0.9487962, -0.6751229, 1.083799, 0.9568627, 0, 1, 1,
0.9496283, 2.161749, 0.5997214, 0.9607843, 0, 1, 1,
0.9524332, 0.9581167, 0.6280888, 0.9686275, 0, 1, 1,
0.9614719, -0.4335471, 1.845274, 0.972549, 0, 1, 1,
0.9679506, -0.7103733, 3.636023, 0.9803922, 0, 1, 1,
0.9711924, 0.7428311, 0.7349413, 0.9843137, 0, 1, 1,
0.9760924, 0.8292005, 1.21084, 0.9921569, 0, 1, 1,
0.9770219, 1.040357, -0.4406229, 0.9960784, 0, 1, 1,
0.9788597, 1.10369, 0.7082893, 1, 0, 0.9960784, 1,
0.9883117, -0.8088772, 3.00888, 1, 0, 0.9882353, 1,
0.9931059, 0.1233162, 3.412697, 1, 0, 0.9843137, 1,
0.9997899, -1.203736, 2.764662, 1, 0, 0.9764706, 1,
1.002739, 0.55098, 1.232299, 1, 0, 0.972549, 1,
1.01441, 1.950154, -1.02475, 1, 0, 0.9647059, 1,
1.014428, 0.06525496, 1.894253, 1, 0, 0.9607843, 1,
1.014831, 1.259279, 1.851654, 1, 0, 0.9529412, 1,
1.015086, -0.3661076, 1.205253, 1, 0, 0.9490196, 1,
1.017057, 2.733845, 0.7679459, 1, 0, 0.9411765, 1,
1.017686, 0.206199, -0.1282024, 1, 0, 0.9372549, 1,
1.019364, 1.680717, -0.6616224, 1, 0, 0.9294118, 1,
1.020338, -0.1733373, 2.451905, 1, 0, 0.9254902, 1,
1.020522, 0.233038, -0.06358384, 1, 0, 0.9176471, 1,
1.031528, 0.1432178, 2.148766, 1, 0, 0.9137255, 1,
1.032443, 0.5243778, 0.7088809, 1, 0, 0.9058824, 1,
1.038735, 0.3627712, 0.6422803, 1, 0, 0.9019608, 1,
1.039104, -0.2103652, 2.546504, 1, 0, 0.8941177, 1,
1.048685, -0.3048719, 1.962428, 1, 0, 0.8862745, 1,
1.059112, -2.608903, 2.48238, 1, 0, 0.8823529, 1,
1.071061, -1.946427, 1.839496, 1, 0, 0.8745098, 1,
1.071731, -0.1877035, 2.143461, 1, 0, 0.8705882, 1,
1.071939, 1.062662, 0.9586268, 1, 0, 0.8627451, 1,
1.092536, -0.6754739, 1.973821, 1, 0, 0.8588235, 1,
1.095785, -1.134621, 1.703269, 1, 0, 0.8509804, 1,
1.096565, -0.1528642, 2.654237, 1, 0, 0.8470588, 1,
1.100899, 0.562862, 0.4177223, 1, 0, 0.8392157, 1,
1.106101, 0.695279, 2.801577, 1, 0, 0.8352941, 1,
1.106174, 0.4463108, 0.7053007, 1, 0, 0.827451, 1,
1.109636, 0.5757617, 1.810447, 1, 0, 0.8235294, 1,
1.109717, -0.8874326, 3.787297, 1, 0, 0.8156863, 1,
1.113805, -0.6544306, 2.115735, 1, 0, 0.8117647, 1,
1.114601, -3.588119, 2.063837, 1, 0, 0.8039216, 1,
1.115224, -0.04004471, 0.2597541, 1, 0, 0.7960784, 1,
1.116067, 0.1256804, 2.249861, 1, 0, 0.7921569, 1,
1.120939, 0.5267266, 0.6718543, 1, 0, 0.7843137, 1,
1.1242, 0.4554616, 2.60949, 1, 0, 0.7803922, 1,
1.124608, 0.3177463, 0.3365039, 1, 0, 0.772549, 1,
1.125723, -0.329455, 2.165479, 1, 0, 0.7686275, 1,
1.13255, 0.6603018, 0.1915705, 1, 0, 0.7607843, 1,
1.13473, -1.407044, 2.30163, 1, 0, 0.7568628, 1,
1.147071, -0.9955428, 1.679521, 1, 0, 0.7490196, 1,
1.151679, -1.546185, 1.648314, 1, 0, 0.7450981, 1,
1.156517, 0.3267324, 2.373083, 1, 0, 0.7372549, 1,
1.160897, -1.25915, 2.577309, 1, 0, 0.7333333, 1,
1.170466, -0.09592621, 3.575795, 1, 0, 0.7254902, 1,
1.17155, -0.3265967, 2.933244, 1, 0, 0.7215686, 1,
1.176425, -0.791753, 4.140358, 1, 0, 0.7137255, 1,
1.178366, -0.5630599, 1.615264, 1, 0, 0.7098039, 1,
1.180218, 0.1264173, 2.432769, 1, 0, 0.7019608, 1,
1.191628, -0.5562272, 3.327823, 1, 0, 0.6941177, 1,
1.199008, -0.6226599, 3.849993, 1, 0, 0.6901961, 1,
1.19948, 0.4569039, 2.366953, 1, 0, 0.682353, 1,
1.20207, -0.715982, 2.177233, 1, 0, 0.6784314, 1,
1.206627, -1.013452, 0.4916212, 1, 0, 0.6705883, 1,
1.212077, -0.3476354, 1.939718, 1, 0, 0.6666667, 1,
1.229871, -0.8135765, 2.110609, 1, 0, 0.6588235, 1,
1.236336, -1.251896, 4.192644, 1, 0, 0.654902, 1,
1.238812, -0.8402904, 0.202841, 1, 0, 0.6470588, 1,
1.265128, 0.1656484, 0.6917096, 1, 0, 0.6431373, 1,
1.270582, -0.2146126, 1.161709, 1, 0, 0.6352941, 1,
1.27316, 0.3757638, 1.836479, 1, 0, 0.6313726, 1,
1.274088, -0.5592893, 2.768856, 1, 0, 0.6235294, 1,
1.275639, -0.6270244, 2.121735, 1, 0, 0.6196079, 1,
1.277638, 0.1883597, 0.2617603, 1, 0, 0.6117647, 1,
1.280787, 0.09046565, 1.28149, 1, 0, 0.6078432, 1,
1.282316, -0.9570088, 2.745362, 1, 0, 0.6, 1,
1.302099, 0.1722871, 3.548947, 1, 0, 0.5921569, 1,
1.303064, -1.335199, 3.338626, 1, 0, 0.5882353, 1,
1.30663, -0.931236, 4.829511, 1, 0, 0.5803922, 1,
1.311374, 1.346788, 1.788469, 1, 0, 0.5764706, 1,
1.312934, 1.429515, 1.953098, 1, 0, 0.5686275, 1,
1.318111, 0.01078448, 1.907019, 1, 0, 0.5647059, 1,
1.319824, -0.7395949, 2.671101, 1, 0, 0.5568628, 1,
1.322676, 1.063515, 0.6634329, 1, 0, 0.5529412, 1,
1.330286, -1.49971, 1.536157, 1, 0, 0.5450981, 1,
1.337398, 2.291132, 0.09743457, 1, 0, 0.5411765, 1,
1.340003, -0.05772373, 1.941214, 1, 0, 0.5333334, 1,
1.3416, 0.7371627, 0.7241475, 1, 0, 0.5294118, 1,
1.347135, -0.4728783, 2.760537, 1, 0, 0.5215687, 1,
1.354706, 2.317795, 0.2397271, 1, 0, 0.5176471, 1,
1.373461, -0.5425768, 0.7547578, 1, 0, 0.509804, 1,
1.378871, 0.3564926, 0.3148261, 1, 0, 0.5058824, 1,
1.383976, 0.4234748, 1.01961, 1, 0, 0.4980392, 1,
1.393537, -1.907287, 2.790454, 1, 0, 0.4901961, 1,
1.406077, -1.133118, 1.895972, 1, 0, 0.4862745, 1,
1.406291, 0.184834, 2.609761, 1, 0, 0.4784314, 1,
1.424907, 0.9909299, 2.33427, 1, 0, 0.4745098, 1,
1.429036, -1.16555, 1.492793, 1, 0, 0.4666667, 1,
1.429397, -0.07370207, 3.099233, 1, 0, 0.4627451, 1,
1.43373, -0.9836603, 0.2609398, 1, 0, 0.454902, 1,
1.43398, 0.8210293, 0.577592, 1, 0, 0.4509804, 1,
1.452843, -0.4886383, 1.196903, 1, 0, 0.4431373, 1,
1.453915, 0.3853307, 2.557096, 1, 0, 0.4392157, 1,
1.467473, -0.7064597, 2.038558, 1, 0, 0.4313726, 1,
1.475556, -0.5889611, 0.5764179, 1, 0, 0.427451, 1,
1.475774, -1.595157, 3.604523, 1, 0, 0.4196078, 1,
1.476482, 0.9924629, 3.416066, 1, 0, 0.4156863, 1,
1.478507, -0.4700293, 1.334444, 1, 0, 0.4078431, 1,
1.506182, -1.558229, 0.4636539, 1, 0, 0.4039216, 1,
1.529543, 1.748143, -2.308577, 1, 0, 0.3960784, 1,
1.552536, 1.719962, 2.028574, 1, 0, 0.3882353, 1,
1.564886, 1.174298, 2.795006, 1, 0, 0.3843137, 1,
1.570668, 1.392394, -1.971615, 1, 0, 0.3764706, 1,
1.617031, 0.8355628, 2.106408, 1, 0, 0.372549, 1,
1.627873, 0.305415, 1.184938, 1, 0, 0.3647059, 1,
1.635085, 0.2914668, 2.392958, 1, 0, 0.3607843, 1,
1.636862, -1.395046, 1.219827, 1, 0, 0.3529412, 1,
1.645002, 0.3594168, 0.9155317, 1, 0, 0.3490196, 1,
1.674874, -2.275466, 3.771489, 1, 0, 0.3411765, 1,
1.715004, -0.7866238, 2.701299, 1, 0, 0.3372549, 1,
1.716359, -0.6486319, 2.559991, 1, 0, 0.3294118, 1,
1.730656, -0.008824321, 1.050732, 1, 0, 0.3254902, 1,
1.735535, 0.08536635, 0.6097077, 1, 0, 0.3176471, 1,
1.73861, 0.8339007, 1.886836, 1, 0, 0.3137255, 1,
1.75649, 2.096603, 1.31332, 1, 0, 0.3058824, 1,
1.763004, -1.184795, 1.913614, 1, 0, 0.2980392, 1,
1.764148, -0.2237163, 1.855455, 1, 0, 0.2941177, 1,
1.764867, 0.08909103, 1.906529, 1, 0, 0.2862745, 1,
1.765946, 1.550697, 1.324675, 1, 0, 0.282353, 1,
1.773427, -0.3507663, 1.565583, 1, 0, 0.2745098, 1,
1.777751, -0.204779, 1.748847, 1, 0, 0.2705882, 1,
1.796204, 1.708022, 0.106104, 1, 0, 0.2627451, 1,
1.796297, 0.04451672, 2.460606, 1, 0, 0.2588235, 1,
1.80017, 1.759254, -1.310051, 1, 0, 0.2509804, 1,
1.805629, 0.7847677, 0.3933893, 1, 0, 0.2470588, 1,
1.808446, 0.1482161, 1.99643, 1, 0, 0.2392157, 1,
1.811578, 1.128864, 2.076286, 1, 0, 0.2352941, 1,
1.814654, 1.293838, 1.938841, 1, 0, 0.227451, 1,
1.82844, 1.287687, 0.4902889, 1, 0, 0.2235294, 1,
1.835989, -0.8026694, 2.456186, 1, 0, 0.2156863, 1,
1.84643, 1.574443, 1.902976, 1, 0, 0.2117647, 1,
1.846441, 1.794733, 0.09846141, 1, 0, 0.2039216, 1,
1.846784, 1.514362, 1.294109, 1, 0, 0.1960784, 1,
1.854997, 0.7009261, 1.402667, 1, 0, 0.1921569, 1,
1.859817, -0.7926945, 3.658536, 1, 0, 0.1843137, 1,
1.869973, -0.222373, 1.553095, 1, 0, 0.1803922, 1,
1.882419, -1.501497, 3.901226, 1, 0, 0.172549, 1,
1.885249, -1.564966, 0.2387906, 1, 0, 0.1686275, 1,
1.890657, 2.079398, 2.496512, 1, 0, 0.1607843, 1,
1.890952, -0.6698021, 0.9079995, 1, 0, 0.1568628, 1,
1.898187, 1.765926, 0.9047095, 1, 0, 0.1490196, 1,
1.906663, -0.9277909, 2.906597, 1, 0, 0.145098, 1,
1.943577, -0.3588312, 0.2113799, 1, 0, 0.1372549, 1,
1.947873, -0.0743359, 2.745376, 1, 0, 0.1333333, 1,
1.96028, 0.6746359, 0.04725963, 1, 0, 0.1254902, 1,
1.967228, 1.109069, 0.1058909, 1, 0, 0.1215686, 1,
1.991757, -1.895212, 2.708851, 1, 0, 0.1137255, 1,
2.088804, 1.189617, 0.8674022, 1, 0, 0.1098039, 1,
2.090953, 0.8491424, 2.062735, 1, 0, 0.1019608, 1,
2.096322, -2.313707, 2.573051, 1, 0, 0.09411765, 1,
2.131788, -0.04321668, 2.413588, 1, 0, 0.09019608, 1,
2.157657, 1.883355, 0.5084136, 1, 0, 0.08235294, 1,
2.227492, 0.04382371, 2.22374, 1, 0, 0.07843138, 1,
2.230167, -1.234581, 2.971812, 1, 0, 0.07058824, 1,
2.269707, 0.534315, 2.096444, 1, 0, 0.06666667, 1,
2.367005, -1.366604, 2.169823, 1, 0, 0.05882353, 1,
2.399389, 0.6049408, 1.479758, 1, 0, 0.05490196, 1,
2.5521, -0.8770692, 2.891153, 1, 0, 0.04705882, 1,
2.565897, 0.7548108, 0.7716994, 1, 0, 0.04313726, 1,
2.603574, -1.110222, 2.441046, 1, 0, 0.03529412, 1,
2.727127, -0.1086705, 2.372574, 1, 0, 0.03137255, 1,
2.800776, -0.6987163, 2.991811, 1, 0, 0.02352941, 1,
2.823533, -0.1307905, 1.741609, 1, 0, 0.01960784, 1,
2.890732, -1.60721, 1.730214, 1, 0, 0.01176471, 1,
2.897345, -1.517836, 1.185414, 1, 0, 0.007843138, 1
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
0.02887595, -4.711524, -7.137465, 0, -0.5, 0.5, 0.5,
0.02887595, -4.711524, -7.137465, 1, -0.5, 0.5, 0.5,
0.02887595, -4.711524, -7.137465, 1, 1.5, 0.5, 0.5,
0.02887595, -4.711524, -7.137465, 0, 1.5, 0.5, 0.5
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
-3.812004, -0.2742373, -7.137465, 0, -0.5, 0.5, 0.5,
-3.812004, -0.2742373, -7.137465, 1, -0.5, 0.5, 0.5,
-3.812004, -0.2742373, -7.137465, 1, 1.5, 0.5, 0.5,
-3.812004, -0.2742373, -7.137465, 0, 1.5, 0.5, 0.5
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
-3.812004, -4.711524, 0.1064248, 0, -0.5, 0.5, 0.5,
-3.812004, -4.711524, 0.1064248, 1, -0.5, 0.5, 0.5,
-3.812004, -4.711524, 0.1064248, 1, 1.5, 0.5, 0.5,
-3.812004, -4.711524, 0.1064248, 0, 1.5, 0.5, 0.5
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
-2, -3.687535, -5.465798,
2, -3.687535, -5.465798,
-2, -3.687535, -5.465798,
-2, -3.8582, -5.744409,
-1, -3.687535, -5.465798,
-1, -3.8582, -5.744409,
0, -3.687535, -5.465798,
0, -3.8582, -5.744409,
1, -3.687535, -5.465798,
1, -3.8582, -5.744409,
2, -3.687535, -5.465798,
2, -3.8582, -5.744409
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
-2, -4.19953, -6.301631, 0, -0.5, 0.5, 0.5,
-2, -4.19953, -6.301631, 1, -0.5, 0.5, 0.5,
-2, -4.19953, -6.301631, 1, 1.5, 0.5, 0.5,
-2, -4.19953, -6.301631, 0, 1.5, 0.5, 0.5,
-1, -4.19953, -6.301631, 0, -0.5, 0.5, 0.5,
-1, -4.19953, -6.301631, 1, -0.5, 0.5, 0.5,
-1, -4.19953, -6.301631, 1, 1.5, 0.5, 0.5,
-1, -4.19953, -6.301631, 0, 1.5, 0.5, 0.5,
0, -4.19953, -6.301631, 0, -0.5, 0.5, 0.5,
0, -4.19953, -6.301631, 1, -0.5, 0.5, 0.5,
0, -4.19953, -6.301631, 1, 1.5, 0.5, 0.5,
0, -4.19953, -6.301631, 0, 1.5, 0.5, 0.5,
1, -4.19953, -6.301631, 0, -0.5, 0.5, 0.5,
1, -4.19953, -6.301631, 1, -0.5, 0.5, 0.5,
1, -4.19953, -6.301631, 1, 1.5, 0.5, 0.5,
1, -4.19953, -6.301631, 0, 1.5, 0.5, 0.5,
2, -4.19953, -6.301631, 0, -0.5, 0.5, 0.5,
2, -4.19953, -6.301631, 1, -0.5, 0.5, 0.5,
2, -4.19953, -6.301631, 1, 1.5, 0.5, 0.5,
2, -4.19953, -6.301631, 0, 1.5, 0.5, 0.5
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
-2.925647, -3, -5.465798,
-2.925647, 3, -5.465798,
-2.925647, -3, -5.465798,
-3.073373, -3, -5.744409,
-2.925647, -2, -5.465798,
-3.073373, -2, -5.744409,
-2.925647, -1, -5.465798,
-3.073373, -1, -5.744409,
-2.925647, 0, -5.465798,
-3.073373, 0, -5.744409,
-2.925647, 1, -5.465798,
-3.073373, 1, -5.744409,
-2.925647, 2, -5.465798,
-3.073373, 2, -5.744409,
-2.925647, 3, -5.465798,
-3.073373, 3, -5.744409
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
-3.368825, -3, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, -3, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, -3, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, -3, -6.301631, 0, 1.5, 0.5, 0.5,
-3.368825, -2, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, -2, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, -2, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, -2, -6.301631, 0, 1.5, 0.5, 0.5,
-3.368825, -1, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, -1, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, -1, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, -1, -6.301631, 0, 1.5, 0.5, 0.5,
-3.368825, 0, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, 0, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, 0, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, 0, -6.301631, 0, 1.5, 0.5, 0.5,
-3.368825, 1, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, 1, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, 1, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, 1, -6.301631, 0, 1.5, 0.5, 0.5,
-3.368825, 2, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, 2, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, 2, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, 2, -6.301631, 0, 1.5, 0.5, 0.5,
-3.368825, 3, -6.301631, 0, -0.5, 0.5, 0.5,
-3.368825, 3, -6.301631, 1, -0.5, 0.5, 0.5,
-3.368825, 3, -6.301631, 1, 1.5, 0.5, 0.5,
-3.368825, 3, -6.301631, 0, 1.5, 0.5, 0.5
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
-2.925647, -3.687535, -4,
-2.925647, -3.687535, 4,
-2.925647, -3.687535, -4,
-3.073373, -3.8582, -4,
-2.925647, -3.687535, -2,
-3.073373, -3.8582, -2,
-2.925647, -3.687535, 0,
-3.073373, -3.8582, 0,
-2.925647, -3.687535, 2,
-3.073373, -3.8582, 2,
-2.925647, -3.687535, 4,
-3.073373, -3.8582, 4
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
-3.368825, -4.19953, -4, 0, -0.5, 0.5, 0.5,
-3.368825, -4.19953, -4, 1, -0.5, 0.5, 0.5,
-3.368825, -4.19953, -4, 1, 1.5, 0.5, 0.5,
-3.368825, -4.19953, -4, 0, 1.5, 0.5, 0.5,
-3.368825, -4.19953, -2, 0, -0.5, 0.5, 0.5,
-3.368825, -4.19953, -2, 1, -0.5, 0.5, 0.5,
-3.368825, -4.19953, -2, 1, 1.5, 0.5, 0.5,
-3.368825, -4.19953, -2, 0, 1.5, 0.5, 0.5,
-3.368825, -4.19953, 0, 0, -0.5, 0.5, 0.5,
-3.368825, -4.19953, 0, 1, -0.5, 0.5, 0.5,
-3.368825, -4.19953, 0, 1, 1.5, 0.5, 0.5,
-3.368825, -4.19953, 0, 0, 1.5, 0.5, 0.5,
-3.368825, -4.19953, 2, 0, -0.5, 0.5, 0.5,
-3.368825, -4.19953, 2, 1, -0.5, 0.5, 0.5,
-3.368825, -4.19953, 2, 1, 1.5, 0.5, 0.5,
-3.368825, -4.19953, 2, 0, 1.5, 0.5, 0.5,
-3.368825, -4.19953, 4, 0, -0.5, 0.5, 0.5,
-3.368825, -4.19953, 4, 1, -0.5, 0.5, 0.5,
-3.368825, -4.19953, 4, 1, 1.5, 0.5, 0.5,
-3.368825, -4.19953, 4, 0, 1.5, 0.5, 0.5
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
-2.925647, -3.687535, -5.465798,
-2.925647, 3.139061, -5.465798,
-2.925647, -3.687535, 5.678648,
-2.925647, 3.139061, 5.678648,
-2.925647, -3.687535, -5.465798,
-2.925647, -3.687535, 5.678648,
-2.925647, 3.139061, -5.465798,
-2.925647, 3.139061, 5.678648,
-2.925647, -3.687535, -5.465798,
2.983399, -3.687535, -5.465798,
-2.925647, -3.687535, 5.678648,
2.983399, -3.687535, 5.678648,
-2.925647, 3.139061, -5.465798,
2.983399, 3.139061, -5.465798,
-2.925647, 3.139061, 5.678648,
2.983399, 3.139061, 5.678648,
2.983399, -3.687535, -5.465798,
2.983399, 3.139061, -5.465798,
2.983399, -3.687535, 5.678648,
2.983399, 3.139061, 5.678648,
2.983399, -3.687535, -5.465798,
2.983399, -3.687535, 5.678648,
2.983399, 3.139061, -5.465798,
2.983399, 3.139061, 5.678648
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
var radius = 7.658814;
var distance = 34.07492;
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
mvMatrix.translate( -0.02887595, 0.2742373, -0.1064248 );
mvMatrix.scale( 1.401387, 1.213029, 0.7430481 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.07492);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
tetra<-read.table("tetra.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetra$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetra' not found
```

```r
y<-tetra$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetra' not found
```

```r
z<-tetra$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetra' not found
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
-2.839593, 0.785259, -1.349208, 0, 0, 1, 1, 1,
-2.733014, 0.2162909, -2.861934, 1, 0, 0, 1, 1,
-2.650148, 0.05963953, -1.476312, 1, 0, 0, 1, 1,
-2.565746, -0.6007667, -1.237506, 1, 0, 0, 1, 1,
-2.563858, -1.055999, -2.443967, 1, 0, 0, 1, 1,
-2.522602, 0.9698389, -2.860229, 1, 0, 0, 1, 1,
-2.502141, 2.220454, -2.444909, 0, 0, 0, 1, 1,
-2.476811, 1.142159, -2.105131, 0, 0, 0, 1, 1,
-2.466793, -1.118452, -2.663767, 0, 0, 0, 1, 1,
-2.432635, -0.04513596, -0.6156496, 0, 0, 0, 1, 1,
-2.417449, -0.5967008, -0.5777717, 0, 0, 0, 1, 1,
-2.353697, 1.606269, -1.361496, 0, 0, 0, 1, 1,
-2.342749, 1.047621, -0.1740466, 0, 0, 0, 1, 1,
-2.313281, 0.1854431, -1.011484, 1, 1, 1, 1, 1,
-2.27502, -0.5708992, -1.835871, 1, 1, 1, 1, 1,
-2.206059, -0.3527415, -2.390746, 1, 1, 1, 1, 1,
-2.189229, -1.089358, -1.966726, 1, 1, 1, 1, 1,
-2.160296, 0.6794708, -1.233107, 1, 1, 1, 1, 1,
-2.142079, 0.8460647, -1.484738, 1, 1, 1, 1, 1,
-2.096627, 0.9612752, -3.651461, 1, 1, 1, 1, 1,
-2.070115, 0.9426448, -0.6737615, 1, 1, 1, 1, 1,
-2.063397, 0.2954045, -0.9826584, 1, 1, 1, 1, 1,
-2.02763, -0.04353389, -1.55778, 1, 1, 1, 1, 1,
-2.000418, 0.8859362, -2.065432, 1, 1, 1, 1, 1,
-1.980549, 0.8162319, -1.801911, 1, 1, 1, 1, 1,
-1.970209, -2.15427, -4.357438, 1, 1, 1, 1, 1,
-1.963009, -0.7164222, -1.158655, 1, 1, 1, 1, 1,
-1.946515, 0.3777095, -1.917973, 1, 1, 1, 1, 1,
-1.942576, 2.195076, -0.9425569, 0, 0, 1, 1, 1,
-1.936434, 0.4521749, -1.410536, 1, 0, 0, 1, 1,
-1.86557, -1.287177, -1.964906, 1, 0, 0, 1, 1,
-1.864373, 1.129855, -2.290865, 1, 0, 0, 1, 1,
-1.863474, -1.215868, -3.046907, 1, 0, 0, 1, 1,
-1.863143, 0.7829012, 0.325606, 1, 0, 0, 1, 1,
-1.85987, -0.7565485, -2.078264, 0, 0, 0, 1, 1,
-1.829133, 0.4018054, -0.9325491, 0, 0, 0, 1, 1,
-1.781718, -0.9488837, -1.387674, 0, 0, 0, 1, 1,
-1.734635, 0.2981077, -0.8878751, 0, 0, 0, 1, 1,
-1.731327, 2.058769, -1.56441, 0, 0, 0, 1, 1,
-1.695095, 0.5302833, -1.54282, 0, 0, 0, 1, 1,
-1.669755, -0.1818382, -2.075308, 0, 0, 0, 1, 1,
-1.669248, 0.6061125, -1.612708, 1, 1, 1, 1, 1,
-1.665024, -0.03447657, -0.6284385, 1, 1, 1, 1, 1,
-1.661635, -0.9312958, -3.207093, 1, 1, 1, 1, 1,
-1.643352, 0.3573337, -0.9584294, 1, 1, 1, 1, 1,
-1.638589, -0.3882665, -2.586306, 1, 1, 1, 1, 1,
-1.632625, 0.04806728, -0.74435, 1, 1, 1, 1, 1,
-1.622811, -0.2572413, -3.095856, 1, 1, 1, 1, 1,
-1.613433, 2.321046, -1.545953, 1, 1, 1, 1, 1,
-1.610336, -0.1185589, -3.234877, 1, 1, 1, 1, 1,
-1.594499, -1.628933, -2.523752, 1, 1, 1, 1, 1,
-1.571781, 0.1780097, -1.387836, 1, 1, 1, 1, 1,
-1.563753, -0.6578089, -3.461263, 1, 1, 1, 1, 1,
-1.563278, -1.391404, -2.343861, 1, 1, 1, 1, 1,
-1.561247, 0.9325362, -1.34447, 1, 1, 1, 1, 1,
-1.557292, -1.115771, -2.381368, 1, 1, 1, 1, 1,
-1.551281, -0.5055763, -3.331579, 0, 0, 1, 1, 1,
-1.54374, 0.3480239, -0.7972519, 1, 0, 0, 1, 1,
-1.530372, -1.945443, -2.931442, 1, 0, 0, 1, 1,
-1.520911, 0.4685294, -1.141539, 1, 0, 0, 1, 1,
-1.520881, -1.05071, -2.314808, 1, 0, 0, 1, 1,
-1.504635, 1.850782, -0.887722, 1, 0, 0, 1, 1,
-1.490268, 0.0218826, -0.2025918, 0, 0, 0, 1, 1,
-1.484777, -0.5223161, -4.404303, 0, 0, 0, 1, 1,
-1.461419, 0.4889545, -0.4324616, 0, 0, 0, 1, 1,
-1.451238, 0.9029196, -2.680517, 0, 0, 0, 1, 1,
-1.437895, -0.7204496, -2.180571, 0, 0, 0, 1, 1,
-1.43269, 0.419353, -1.274082, 0, 0, 0, 1, 1,
-1.424228, 0.871444, -2.895627, 0, 0, 0, 1, 1,
-1.423479, -1.111859, -2.545689, 1, 1, 1, 1, 1,
-1.4221, -0.3521309, -2.091587, 1, 1, 1, 1, 1,
-1.420691, 0.0688828, -2.279121, 1, 1, 1, 1, 1,
-1.420677, 0.9096187, -1.763625, 1, 1, 1, 1, 1,
-1.414239, 0.9662725, -0.7625803, 1, 1, 1, 1, 1,
-1.413754, -1.156116, -2.585387, 1, 1, 1, 1, 1,
-1.410306, 0.1529375, -0.6035144, 1, 1, 1, 1, 1,
-1.406003, 0.6902158, 0.1266521, 1, 1, 1, 1, 1,
-1.397284, 1.23622, -1.321743, 1, 1, 1, 1, 1,
-1.391564, 1.872694, 0.4976085, 1, 1, 1, 1, 1,
-1.386406, -1.062187, -2.175913, 1, 1, 1, 1, 1,
-1.382073, -0.4850321, -1.728735, 1, 1, 1, 1, 1,
-1.378425, 0.9193819, -1.98382, 1, 1, 1, 1, 1,
-1.374184, 0.3755745, -2.700731, 1, 1, 1, 1, 1,
-1.369749, -0.6066565, -0.3353643, 1, 1, 1, 1, 1,
-1.363432, 1.851223, -0.1381299, 0, 0, 1, 1, 1,
-1.358909, 0.5559057, 0.7040688, 1, 0, 0, 1, 1,
-1.349208, -0.381556, -0.9465842, 1, 0, 0, 1, 1,
-1.33726, 0.8576777, -2.380904, 1, 0, 0, 1, 1,
-1.327415, 0.6712204, -0.6045094, 1, 0, 0, 1, 1,
-1.323539, 1.669091, -1.181488, 1, 0, 0, 1, 1,
-1.323034, 0.5873747, 0.471992, 0, 0, 0, 1, 1,
-1.316045, -0.8307567, -4.378783, 0, 0, 0, 1, 1,
-1.31328, -1.192472, -2.030421, 0, 0, 0, 1, 1,
-1.292222, -0.4217696, -2.560906, 0, 0, 0, 1, 1,
-1.290009, -0.1091342, -0.9070054, 0, 0, 0, 1, 1,
-1.285574, 0.2139936, -0.9232059, 0, 0, 0, 1, 1,
-1.284514, -1.490514, -2.695595, 0, 0, 0, 1, 1,
-1.271847, 1.031373, -0.344081, 1, 1, 1, 1, 1,
-1.267349, 1.654864, -2.588268, 1, 1, 1, 1, 1,
-1.266208, 0.3385052, -1.535601, 1, 1, 1, 1, 1,
-1.264601, -0.3438825, -2.421339, 1, 1, 1, 1, 1,
-1.264204, -0.7248927, -2.011158, 1, 1, 1, 1, 1,
-1.256663, 1.624875, 0.8277639, 1, 1, 1, 1, 1,
-1.25386, -0.09005749, -1.729088, 1, 1, 1, 1, 1,
-1.245998, -0.5653812, -1.284821, 1, 1, 1, 1, 1,
-1.242632, -0.1911771, -1.029765, 1, 1, 1, 1, 1,
-1.233297, 1.048579, -2.210613, 1, 1, 1, 1, 1,
-1.22743, -0.2939225, -1.902865, 1, 1, 1, 1, 1,
-1.223245, 1.278393, 0.121437, 1, 1, 1, 1, 1,
-1.209747, 1.313489, -1.139289, 1, 1, 1, 1, 1,
-1.208099, -0.6133774, -2.344817, 1, 1, 1, 1, 1,
-1.205666, 1.535613, -0.8700456, 1, 1, 1, 1, 1,
-1.199967, 0.744671, -2.076076, 0, 0, 1, 1, 1,
-1.196939, -0.1877475, -2.207769, 1, 0, 0, 1, 1,
-1.196786, -0.5984374, -2.914029, 1, 0, 0, 1, 1,
-1.196654, 1.081899, -0.1523213, 1, 0, 0, 1, 1,
-1.190838, 1.322496, -1.460671, 1, 0, 0, 1, 1,
-1.189938, -0.7916026, -1.78117, 1, 0, 0, 1, 1,
-1.173256, -2.43662, -3.541041, 0, 0, 0, 1, 1,
-1.170712, -1.320034, -2.629197, 0, 0, 0, 1, 1,
-1.164475, -0.6275054, -2.855546, 0, 0, 0, 1, 1,
-1.161214, -1.072437, -2.035573, 0, 0, 0, 1, 1,
-1.158482, 0.6217818, -1.63758, 0, 0, 0, 1, 1,
-1.155293, -0.7369112, -2.417495, 0, 0, 0, 1, 1,
-1.149901, -0.115352, -0.8993388, 0, 0, 0, 1, 1,
-1.131958, 1.411835, -0.6136242, 1, 1, 1, 1, 1,
-1.122981, -0.07570876, -1.935278, 1, 1, 1, 1, 1,
-1.117632, 0.7098497, -1.703504, 1, 1, 1, 1, 1,
-1.114507, -0.302087, -2.190765, 1, 1, 1, 1, 1,
-1.114215, -0.8334579, -2.360284, 1, 1, 1, 1, 1,
-1.110402, -1.698445, -2.25196, 1, 1, 1, 1, 1,
-1.110351, -0.4620158, -0.5176983, 1, 1, 1, 1, 1,
-1.108369, -0.09745695, -0.8295361, 1, 1, 1, 1, 1,
-1.104447, -0.543843, -0.3274308, 1, 1, 1, 1, 1,
-1.100872, 0.06391566, -0.6698107, 1, 1, 1, 1, 1,
-1.093716, 0.9451278, 0.1182069, 1, 1, 1, 1, 1,
-1.093574, -0.6605224, -2.40045, 1, 1, 1, 1, 1,
-1.091525, -0.6806744, -3.912151, 1, 1, 1, 1, 1,
-1.091161, -1.259829, -1.96797, 1, 1, 1, 1, 1,
-1.084635, -0.0104893, -1.216725, 1, 1, 1, 1, 1,
-1.083848, -0.07471297, -1.522387, 0, 0, 1, 1, 1,
-1.075478, 0.5762674, -1.068289, 1, 0, 0, 1, 1,
-1.072078, 0.7627919, -0.7829632, 1, 0, 0, 1, 1,
-1.064467, 2.019737, 0.9161218, 1, 0, 0, 1, 1,
-1.061818, -0.8960923, -0.7721325, 1, 0, 0, 1, 1,
-1.057989, 0.1758119, 0.4931985, 1, 0, 0, 1, 1,
-1.052945, -2.111811, -2.844738, 0, 0, 0, 1, 1,
-1.048407, 1.082234, -0.6198321, 0, 0, 0, 1, 1,
-1.048173, 0.03350129, -1.248321, 0, 0, 0, 1, 1,
-1.044738, -1.507704, -1.661653, 0, 0, 0, 1, 1,
-1.042097, -1.009379, -0.6770402, 0, 0, 0, 1, 1,
-1.040497, -0.07077647, -3.347365, 0, 0, 0, 1, 1,
-1.04031, -0.7688003, -2.332364, 0, 0, 0, 1, 1,
-1.034327, 1.171922, -3.73895, 1, 1, 1, 1, 1,
-1.025152, 0.4082352, -1.59545, 1, 1, 1, 1, 1,
-1.014571, 0.4383367, -1.344467, 1, 1, 1, 1, 1,
-1.014117, -0.104248, -0.2403033, 1, 1, 1, 1, 1,
-0.9993734, 0.4308141, -0.7164243, 1, 1, 1, 1, 1,
-0.9926999, 1.025221, -0.809005, 1, 1, 1, 1, 1,
-0.9925567, -1.418715, -3.970388, 1, 1, 1, 1, 1,
-0.9924403, -0.6520265, -2.501995, 1, 1, 1, 1, 1,
-0.9764394, -1.414879, -3.918755, 1, 1, 1, 1, 1,
-0.9654554, 0.05676207, -0.6320097, 1, 1, 1, 1, 1,
-0.9654499, 0.8398233, -3.196789, 1, 1, 1, 1, 1,
-0.9636033, -3.111109, -1.346587, 1, 1, 1, 1, 1,
-0.9630908, -0.8458082, -1.378716, 1, 1, 1, 1, 1,
-0.9624126, 0.3854493, -0.4865138, 1, 1, 1, 1, 1,
-0.9591917, -1.210661, -1.087721, 1, 1, 1, 1, 1,
-0.9511421, 0.7876297, -0.8118305, 0, 0, 1, 1, 1,
-0.9447685, -0.5946097, -3.135086, 1, 0, 0, 1, 1,
-0.938454, -0.4979977, -0.7899483, 1, 0, 0, 1, 1,
-0.9357448, -1.224024, -1.940779, 1, 0, 0, 1, 1,
-0.9340627, 0.3278225, -1.688469, 1, 0, 0, 1, 1,
-0.9222672, 1.185818, -1.191819, 1, 0, 0, 1, 1,
-0.920097, 1.51251, -1.613853, 0, 0, 0, 1, 1,
-0.9195762, -1.073214, -0.8282785, 0, 0, 0, 1, 1,
-0.9185296, -0.01768332, -2.276317, 0, 0, 0, 1, 1,
-0.913429, -0.09524623, -2.434954, 0, 0, 0, 1, 1,
-0.9130985, 0.7879478, -0.7228652, 0, 0, 0, 1, 1,
-0.9118465, -0.06476867, -0.2918358, 0, 0, 0, 1, 1,
-0.9094464, 0.1123679, -1.389615, 0, 0, 0, 1, 1,
-0.9091875, 0.3052033, -0.4327737, 1, 1, 1, 1, 1,
-0.907055, 2.074774, -0.41355, 1, 1, 1, 1, 1,
-0.9046645, 1.071737, -1.549748, 1, 1, 1, 1, 1,
-0.8992517, -0.732815, -2.996846, 1, 1, 1, 1, 1,
-0.8983252, 0.2263923, -1.078175, 1, 1, 1, 1, 1,
-0.8980503, 1.629183, 0.2233478, 1, 1, 1, 1, 1,
-0.8973911, 1.737966, -0.4313722, 1, 1, 1, 1, 1,
-0.8929495, -2.523049, -3.225029, 1, 1, 1, 1, 1,
-0.8877011, 1.01401, 1.932613, 1, 1, 1, 1, 1,
-0.8860464, 1.354348, -1.714841, 1, 1, 1, 1, 1,
-0.8845084, 0.504276, -1.79268, 1, 1, 1, 1, 1,
-0.8833019, 0.9952843, -1.073613, 1, 1, 1, 1, 1,
-0.8808668, 0.5906917, -1.434957, 1, 1, 1, 1, 1,
-0.8733204, 0.2824855, 0.342708, 1, 1, 1, 1, 1,
-0.8722358, 0.1796091, -2.12088, 1, 1, 1, 1, 1,
-0.8579496, 1.493021, -0.6526926, 0, 0, 1, 1, 1,
-0.8573444, -0.7482873, -2.692913, 1, 0, 0, 1, 1,
-0.8492029, -0.2196355, -1.172272, 1, 0, 0, 1, 1,
-0.8478563, -0.5685051, -4.125366, 1, 0, 0, 1, 1,
-0.8474255, 0.6885232, -1.604106, 1, 0, 0, 1, 1,
-0.8423596, -0.2493273, -2.113653, 1, 0, 0, 1, 1,
-0.8412401, -0.5308241, -2.758058, 0, 0, 0, 1, 1,
-0.8404863, -0.7230347, -1.104798, 0, 0, 0, 1, 1,
-0.8398386, -0.3641452, -2.188428, 0, 0, 0, 1, 1,
-0.8371025, -1.218913, 0.1533192, 0, 0, 0, 1, 1,
-0.8353587, -0.7251852, -2.087243, 0, 0, 0, 1, 1,
-0.8297585, -0.3982367, -1.386943, 0, 0, 0, 1, 1,
-0.8283821, -0.4608954, -2.665303, 0, 0, 0, 1, 1,
-0.8249879, 1.59305, -0.3584737, 1, 1, 1, 1, 1,
-0.8210191, -1.203132, -1.885385, 1, 1, 1, 1, 1,
-0.8154126, -0.6278625, -2.875072, 1, 1, 1, 1, 1,
-0.8089048, -0.9728861, -3.989382, 1, 1, 1, 1, 1,
-0.7893338, -0.2299281, -2.443446, 1, 1, 1, 1, 1,
-0.7875822, 1.266726, 0.1289044, 1, 1, 1, 1, 1,
-0.7866047, -1.111315, -4.030635, 1, 1, 1, 1, 1,
-0.7777742, 1.763115, 0.8726988, 1, 1, 1, 1, 1,
-0.7774901, 1.648381, -1.052935, 1, 1, 1, 1, 1,
-0.7755211, 0.5685985, -1.510081, 1, 1, 1, 1, 1,
-0.7752542, -1.258038, -2.236927, 1, 1, 1, 1, 1,
-0.7730465, -0.5123199, -1.575043, 1, 1, 1, 1, 1,
-0.768882, -0.08300925, -1.07321, 1, 1, 1, 1, 1,
-0.7568208, 0.02347626, -2.421671, 1, 1, 1, 1, 1,
-0.7546325, -1.335245, -3.225134, 1, 1, 1, 1, 1,
-0.7517474, -0.8130863, -2.786275, 0, 0, 1, 1, 1,
-0.7484346, -0.2220102, -1.970686, 1, 0, 0, 1, 1,
-0.7460113, -0.8141333, -0.6191486, 1, 0, 0, 1, 1,
-0.7452919, -1.105859, -2.363614, 1, 0, 0, 1, 1,
-0.7351384, -1.03873, -3.401402, 1, 0, 0, 1, 1,
-0.7341636, -1.405512, -3.108099, 1, 0, 0, 1, 1,
-0.7213526, -1.408558, -2.868865, 0, 0, 0, 1, 1,
-0.7204987, 0.3096868, -3.550037, 0, 0, 0, 1, 1,
-0.7151108, 1.30982, -1.427585, 0, 0, 0, 1, 1,
-0.7139972, -1.908915, -3.10891, 0, 0, 0, 1, 1,
-0.7139441, -0.5137342, -1.030146, 0, 0, 0, 1, 1,
-0.7117888, -0.9087512, -3.627424, 0, 0, 0, 1, 1,
-0.7093956, 0.1741639, -0.9941344, 0, 0, 0, 1, 1,
-0.7021437, -0.7865351, -3.283344, 1, 1, 1, 1, 1,
-0.6971787, -0.4796252, -2.309172, 1, 1, 1, 1, 1,
-0.6965262, -0.5108277, -2.080353, 1, 1, 1, 1, 1,
-0.6938479, 0.2995813, -1.156556, 1, 1, 1, 1, 1,
-0.6925503, -0.4507853, -1.66746, 1, 1, 1, 1, 1,
-0.6925218, 0.2043005, -0.3266113, 1, 1, 1, 1, 1,
-0.6900305, 0.9560089, 0.9980925, 1, 1, 1, 1, 1,
-0.6824489, -1.205544, -4.492652, 1, 1, 1, 1, 1,
-0.6814895, -0.5328482, -3.46622, 1, 1, 1, 1, 1,
-0.6776481, -0.9205687, -3.490475, 1, 1, 1, 1, 1,
-0.6757045, 0.0610761, -1.439134, 1, 1, 1, 1, 1,
-0.6699877, -0.9466534, -3.517119, 1, 1, 1, 1, 1,
-0.6654866, -0.5522328, -0.3811089, 1, 1, 1, 1, 1,
-0.6650282, 0.9517905, -0.5509965, 1, 1, 1, 1, 1,
-0.6617358, 0.3313659, -0.8475881, 1, 1, 1, 1, 1,
-0.6611272, -0.6023108, -3.175545, 0, 0, 1, 1, 1,
-0.6598437, -0.9496255, -3.368691, 1, 0, 0, 1, 1,
-0.6571931, 0.3841173, -2.281774, 1, 0, 0, 1, 1,
-0.6510901, 1.827967, -0.29905, 1, 0, 0, 1, 1,
-0.6438891, -0.3044621, -0.6559814, 1, 0, 0, 1, 1,
-0.6424003, 0.3171063, -1.264878, 1, 0, 0, 1, 1,
-0.623051, -0.8831453, -1.715275, 0, 0, 0, 1, 1,
-0.6197086, 0.2485393, -0.6807615, 0, 0, 0, 1, 1,
-0.6195977, -0.9332867, -1.093913, 0, 0, 0, 1, 1,
-0.6173534, 0.3380504, -1.276715, 0, 0, 0, 1, 1,
-0.6150467, -0.3929344, -3.059913, 0, 0, 0, 1, 1,
-0.6138265, -0.8422658, -2.298625, 0, 0, 0, 1, 1,
-0.6122805, -0.730875, -0.6078654, 0, 0, 0, 1, 1,
-0.6065628, -1.798694, -3.312446, 1, 1, 1, 1, 1,
-0.6060029, -0.6241098, -2.429493, 1, 1, 1, 1, 1,
-0.6032385, -0.4560182, -0.9917026, 1, 1, 1, 1, 1,
-0.6016116, 1.04664, 1.051297, 1, 1, 1, 1, 1,
-0.5966217, -1.022341, -1.263088, 1, 1, 1, 1, 1,
-0.5952768, -0.4266642, -2.050426, 1, 1, 1, 1, 1,
-0.5927671, 0.007041335, -1.765037, 1, 1, 1, 1, 1,
-0.592006, -0.9859849, -2.707085, 1, 1, 1, 1, 1,
-0.5868258, -0.2479184, -1.310556, 1, 1, 1, 1, 1,
-0.5861484, -0.4964148, -2.693903, 1, 1, 1, 1, 1,
-0.5841066, 0.08845475, 0.4132369, 1, 1, 1, 1, 1,
-0.5750412, -0.2054845, -2.89813, 1, 1, 1, 1, 1,
-0.5748531, 0.5173091, -1.51024, 1, 1, 1, 1, 1,
-0.5724972, 0.8764021, 1.372563, 1, 1, 1, 1, 1,
-0.5719265, -0.4645498, -1.887487, 1, 1, 1, 1, 1,
-0.570714, -1.176061, -4.567618, 0, 0, 1, 1, 1,
-0.5648038, -0.4953753, -0.8874034, 1, 0, 0, 1, 1,
-0.5594691, -0.3622773, -0.7807279, 1, 0, 0, 1, 1,
-0.5519363, -2.132828, -3.656972, 1, 0, 0, 1, 1,
-0.5519317, -2.068099, -1.728353, 1, 0, 0, 1, 1,
-0.547751, -0.3001094, -0.9715799, 1, 0, 0, 1, 1,
-0.541241, 1.377597, -0.8557048, 0, 0, 0, 1, 1,
-0.5410535, -1.214162, -2.803662, 0, 0, 0, 1, 1,
-0.534501, -0.272736, -2.210844, 0, 0, 0, 1, 1,
-0.5272001, -1.025311, -2.919666, 0, 0, 0, 1, 1,
-0.5228953, 1.191401, -1.194364, 0, 0, 0, 1, 1,
-0.520413, -0.2025348, -2.67545, 0, 0, 0, 1, 1,
-0.5199061, 0.08944199, -1.34748, 0, 0, 0, 1, 1,
-0.5163333, 0.2879312, -0.7364255, 1, 1, 1, 1, 1,
-0.5158369, 0.7140114, -0.5397143, 1, 1, 1, 1, 1,
-0.5155595, 1.370233, -0.4999516, 1, 1, 1, 1, 1,
-0.5037476, -0.4544437, -2.006659, 1, 1, 1, 1, 1,
-0.5027189, 1.494988, -1.245775, 1, 1, 1, 1, 1,
-0.501106, -0.2889054, -0.3227102, 1, 1, 1, 1, 1,
-0.5009757, 1.670267, 0.8401897, 1, 1, 1, 1, 1,
-0.4963861, -0.2795396, -0.8742503, 1, 1, 1, 1, 1,
-0.4896864, 0.1351046, -2.256731, 1, 1, 1, 1, 1,
-0.4846712, -1.904789, -2.945628, 1, 1, 1, 1, 1,
-0.4812922, -1.144344, -3.719486, 1, 1, 1, 1, 1,
-0.4800467, -1.695459, -1.686285, 1, 1, 1, 1, 1,
-0.4782907, 0.0263892, -1.086041, 1, 1, 1, 1, 1,
-0.4747927, 0.8536081, -0.3089849, 1, 1, 1, 1, 1,
-0.473788, 0.09512072, -1.272565, 1, 1, 1, 1, 1,
-0.4705732, -0.003305669, -1.23345, 0, 0, 1, 1, 1,
-0.4625308, -1.234567, -2.439695, 1, 0, 0, 1, 1,
-0.4545682, 0.3559704, 0.5135146, 1, 0, 0, 1, 1,
-0.4459036, 0.01911918, -2.175085, 1, 0, 0, 1, 1,
-0.4438647, -0.5116659, -3.61807, 1, 0, 0, 1, 1,
-0.4431119, 0.7480898, 1.171649, 1, 0, 0, 1, 1,
-0.4421439, 1.081351, -1.764781, 0, 0, 0, 1, 1,
-0.4355813, 0.7137342, -0.8521637, 0, 0, 0, 1, 1,
-0.4352992, 0.397155, -1.649391, 0, 0, 0, 1, 1,
-0.4348054, 1.735196, -2.19568, 0, 0, 0, 1, 1,
-0.4299148, 1.993682, 0.01780811, 0, 0, 0, 1, 1,
-0.4295278, -0.06809731, -0.9718413, 0, 0, 0, 1, 1,
-0.4266378, 2.197641, -1.398387, 0, 0, 0, 1, 1,
-0.4247728, 0.2172022, -1.246392, 1, 1, 1, 1, 1,
-0.4199758, 1.342048, -2.350174, 1, 1, 1, 1, 1,
-0.4139245, -0.374299, -2.005946, 1, 1, 1, 1, 1,
-0.4109138, 1.840101, -0.09987269, 1, 1, 1, 1, 1,
-0.4106119, -0.5325587, -1.068136, 1, 1, 1, 1, 1,
-0.4098554, -0.0668985, -3.444667, 1, 1, 1, 1, 1,
-0.4079124, 1.639852, 0.8386708, 1, 1, 1, 1, 1,
-0.4040635, 0.727554, -1.232012, 1, 1, 1, 1, 1,
-0.4039603, 0.9935245, 0.1278115, 1, 1, 1, 1, 1,
-0.4020104, 0.4340116, 1.417696, 1, 1, 1, 1, 1,
-0.3951724, 0.135574, -1.722893, 1, 1, 1, 1, 1,
-0.3897954, 0.3047596, -0.9972754, 1, 1, 1, 1, 1,
-0.3843383, 0.7023059, -0.972249, 1, 1, 1, 1, 1,
-0.3774973, 0.02233381, -2.175564, 1, 1, 1, 1, 1,
-0.3767616, -0.09802292, -1.068853, 1, 1, 1, 1, 1,
-0.3757124, 1.170796, 0.1051547, 0, 0, 1, 1, 1,
-0.3745149, -1.020156, -3.928723, 1, 0, 0, 1, 1,
-0.371547, -0.8884017, -1.340942, 1, 0, 0, 1, 1,
-0.3702691, 2.028148, -0.5301453, 1, 0, 0, 1, 1,
-0.3686397, -0.2002245, -2.69725, 1, 0, 0, 1, 1,
-0.3673892, -1.70278, -3.502309, 1, 0, 0, 1, 1,
-0.3662794, -0.8046338, -4.909378, 0, 0, 0, 1, 1,
-0.365712, 2.050504, -2.066629, 0, 0, 0, 1, 1,
-0.3607148, 0.1147389, -0.4034513, 0, 0, 0, 1, 1,
-0.3605658, -0.5347618, -2.738574, 0, 0, 0, 1, 1,
-0.3592388, -0.376803, -3.767215, 0, 0, 0, 1, 1,
-0.3571981, 0.5584457, -1.269349, 0, 0, 0, 1, 1,
-0.3565526, -0.4189919, -3.558854, 0, 0, 0, 1, 1,
-0.3537277, 1.526878, -1.231361, 1, 1, 1, 1, 1,
-0.3534847, -0.8440262, -2.098474, 1, 1, 1, 1, 1,
-0.3530902, 1.09662, 0.1362865, 1, 1, 1, 1, 1,
-0.347926, -1.781519, -3.030435, 1, 1, 1, 1, 1,
-0.3465356, -0.310105, -2.242215, 1, 1, 1, 1, 1,
-0.3449264, -0.3664239, -3.66248, 1, 1, 1, 1, 1,
-0.3434551, -0.5703704, -4.552804, 1, 1, 1, 1, 1,
-0.3423505, 0.04112973, -0.5279598, 1, 1, 1, 1, 1,
-0.3418185, -2.044953, -1.913181, 1, 1, 1, 1, 1,
-0.3417269, -1.465261, -1.796461, 1, 1, 1, 1, 1,
-0.3377458, -0.9437894, -4.248693, 1, 1, 1, 1, 1,
-0.329366, 1.860093, -0.8683308, 1, 1, 1, 1, 1,
-0.3284355, 1.535599, -0.3827279, 1, 1, 1, 1, 1,
-0.3235522, 0.6822994, 0.03276093, 1, 1, 1, 1, 1,
-0.3233007, -1.472239, -2.98717, 1, 1, 1, 1, 1,
-0.3146454, -0.874904, -3.017811, 0, 0, 1, 1, 1,
-0.3074546, 0.2780086, -0.4132267, 1, 0, 0, 1, 1,
-0.3066378, 0.7927125, -2.857869, 1, 0, 0, 1, 1,
-0.3058389, 0.4657497, -1.567071, 1, 0, 0, 1, 1,
-0.3042108, -0.6121417, -3.767568, 1, 0, 0, 1, 1,
-0.2972509, -0.4720544, -3.139614, 1, 0, 0, 1, 1,
-0.2966882, -1.020246, -2.308892, 0, 0, 0, 1, 1,
-0.2920446, -1.641968, -2.677386, 0, 0, 0, 1, 1,
-0.2916843, 0.6582916, 0.4703154, 0, 0, 0, 1, 1,
-0.2916183, 0.6194457, -0.5651429, 0, 0, 0, 1, 1,
-0.2868365, -1.133821, -3.957247, 0, 0, 0, 1, 1,
-0.2848847, -1.862915, -2.363047, 0, 0, 0, 1, 1,
-0.2828405, 0.1299361, -1.926135, 0, 0, 0, 1, 1,
-0.2806694, -0.1727451, -5.238443, 1, 1, 1, 1, 1,
-0.2792405, 0.4608563, -2.189024, 1, 1, 1, 1, 1,
-0.2757601, 0.9972035, 0.7055633, 1, 1, 1, 1, 1,
-0.2739104, 1.189047, 1.604304, 1, 1, 1, 1, 1,
-0.2734898, -1.744207, -3.479734, 1, 1, 1, 1, 1,
-0.2603422, 0.6438542, -1.27186, 1, 1, 1, 1, 1,
-0.2545221, 0.5416645, -1.325014, 1, 1, 1, 1, 1,
-0.2509353, -0.717554, -2.799712, 1, 1, 1, 1, 1,
-0.2507388, 0.9927167, -0.6083098, 1, 1, 1, 1, 1,
-0.2400901, -2.819727, -4.797199, 1, 1, 1, 1, 1,
-0.2387816, -1.417612, -2.676677, 1, 1, 1, 1, 1,
-0.2340637, -0.5993422, -3.451009, 1, 1, 1, 1, 1,
-0.2340076, -1.074573, -2.847983, 1, 1, 1, 1, 1,
-0.2261971, -0.5053871, -1.161751, 1, 1, 1, 1, 1,
-0.224975, -0.7175629, -1.643071, 1, 1, 1, 1, 1,
-0.2236424, -1.756438, -4.210017, 0, 0, 1, 1, 1,
-0.2195111, -0.3943612, -3.04583, 1, 0, 0, 1, 1,
-0.2164071, 1.354459, -0.6315866, 1, 0, 0, 1, 1,
-0.2160329, 0.9116893, 0.2157726, 1, 0, 0, 1, 1,
-0.2136608, 2.008202, 0.3703148, 1, 0, 0, 1, 1,
-0.2098756, 0.3142415, -0.2581359, 1, 0, 0, 1, 1,
-0.2031561, -1.8528, -4.912842, 0, 0, 0, 1, 1,
-0.2025975, -1.224946, -3.753124, 0, 0, 0, 1, 1,
-0.2012008, 1.34723, 0.3349241, 0, 0, 0, 1, 1,
-0.1982898, -2.356577, -4.159505, 0, 0, 0, 1, 1,
-0.1982058, -2.367277, -4.156834, 0, 0, 0, 1, 1,
-0.1975759, -0.1512973, -2.421898, 0, 0, 0, 1, 1,
-0.1955739, 0.1992944, -0.5436834, 0, 0, 0, 1, 1,
-0.1946873, -1.682606, -0.6480095, 1, 1, 1, 1, 1,
-0.1935357, 0.5367416, -0.5716405, 1, 1, 1, 1, 1,
-0.1933348, -1.527775, -3.527656, 1, 1, 1, 1, 1,
-0.1914821, -1.26012, -2.692662, 1, 1, 1, 1, 1,
-0.1881277, -0.2092495, -2.376636, 1, 1, 1, 1, 1,
-0.1840415, -0.7347348, -3.687714, 1, 1, 1, 1, 1,
-0.1796193, -0.5738639, -2.058855, 1, 1, 1, 1, 1,
-0.1793932, 0.3857658, 0.7515427, 1, 1, 1, 1, 1,
-0.1748169, 0.3744376, -1.256284, 1, 1, 1, 1, 1,
-0.1667784, -3.144418, -2.232833, 1, 1, 1, 1, 1,
-0.1664961, -1.511397, -3.395329, 1, 1, 1, 1, 1,
-0.1654878, 1.579384, 1.456357, 1, 1, 1, 1, 1,
-0.1639839, -1.90593, -3.131886, 1, 1, 1, 1, 1,
-0.1583979, -0.09701816, -2.338769, 1, 1, 1, 1, 1,
-0.1582368, 3.039644, 0.07725383, 1, 1, 1, 1, 1,
-0.1572502, 0.08718762, 1.669915, 0, 0, 1, 1, 1,
-0.1517406, -0.6220403, -1.754442, 1, 0, 0, 1, 1,
-0.1487083, -0.3878777, -3.048686, 1, 0, 0, 1, 1,
-0.1451679, -1.270428, -2.269659, 1, 0, 0, 1, 1,
-0.1439068, 0.4283715, 0.2363954, 1, 0, 0, 1, 1,
-0.1418646, -0.7971511, -3.462407, 1, 0, 0, 1, 1,
-0.1376121, -0.7877443, -3.713223, 0, 0, 0, 1, 1,
-0.1311437, 0.246778, -1.197449, 0, 0, 0, 1, 1,
-0.1257169, 0.1968454, -2.31927, 0, 0, 0, 1, 1,
-0.1249872, 0.2848569, -0.4967072, 0, 0, 0, 1, 1,
-0.124738, 0.8404192, 1.813482, 0, 0, 0, 1, 1,
-0.1233194, -0.3235355, -3.158667, 0, 0, 0, 1, 1,
-0.1228046, -0.2989691, -4.097575, 0, 0, 0, 1, 1,
-0.119543, 0.7422385, 1.233175, 1, 1, 1, 1, 1,
-0.1177514, -0.1550983, -1.176547, 1, 1, 1, 1, 1,
-0.1173348, 0.644756, -1.922028, 1, 1, 1, 1, 1,
-0.1127694, -1.22016, -0.9635321, 1, 1, 1, 1, 1,
-0.1108057, -0.4439299, -2.389438, 1, 1, 1, 1, 1,
-0.1106204, 1.110792, -0.6233127, 1, 1, 1, 1, 1,
-0.1103201, -0.00615947, 0.8688402, 1, 1, 1, 1, 1,
-0.1102796, -2.270397, -2.438508, 1, 1, 1, 1, 1,
-0.1098756, 0.2723061, -0.8916221, 1, 1, 1, 1, 1,
-0.1085551, 0.006938362, -0.6687446, 1, 1, 1, 1, 1,
-0.1083561, -1.00518, -4.042485, 1, 1, 1, 1, 1,
-0.1066662, 1.576798, 0.2264677, 1, 1, 1, 1, 1,
-0.1043495, 0.8286074, 0.5059153, 1, 1, 1, 1, 1,
-0.1005987, 0.4303125, -1.423333, 1, 1, 1, 1, 1,
-0.09988464, 1.296202, 1.019764, 1, 1, 1, 1, 1,
-0.09955236, -0.4920328, -3.395295, 0, 0, 1, 1, 1,
-0.09716805, 1.595688, 0.004431712, 1, 0, 0, 1, 1,
-0.09639497, 0.5045043, -1.607276, 1, 0, 0, 1, 1,
-0.09555687, 0.4164878, 1.432179, 1, 0, 0, 1, 1,
-0.09441973, 1.168542, 1.699066, 1, 0, 0, 1, 1,
-0.09425841, -0.257405, -3.278093, 1, 0, 0, 1, 1,
-0.09068573, 1.373964, 1.563226, 0, 0, 0, 1, 1,
-0.09039372, -1.164317, -2.234078, 0, 0, 0, 1, 1,
-0.08860005, -1.356962, -3.856458, 0, 0, 0, 1, 1,
-0.08346225, -0.7891604, -2.797671, 0, 0, 0, 1, 1,
-0.0828327, 0.1165054, -1.042285, 0, 0, 0, 1, 1,
-0.08118334, -0.3840582, -3.186296, 0, 0, 0, 1, 1,
-0.07817019, 0.5374896, -0.4748199, 0, 0, 0, 1, 1,
-0.07336177, -0.5085238, -2.755081, 1, 1, 1, 1, 1,
-0.06707505, -1.635241, -2.997155, 1, 1, 1, 1, 1,
-0.06190216, 0.9828463, 0.1044957, 1, 1, 1, 1, 1,
-0.06167857, 1.606536, 0.7775339, 1, 1, 1, 1, 1,
-0.05927329, 1.348881, 1.163928, 1, 1, 1, 1, 1,
-0.05803538, -1.277074, -2.039213, 1, 1, 1, 1, 1,
-0.05731781, 0.3329806, 0.1195153, 1, 1, 1, 1, 1,
-0.05527369, 1.128011, -0.8136169, 1, 1, 1, 1, 1,
-0.05158198, -0.5390536, -3.365605, 1, 1, 1, 1, 1,
-0.05112682, 0.9268827, -0.2696892, 1, 1, 1, 1, 1,
-0.05090646, 0.1503901, -0.9498237, 1, 1, 1, 1, 1,
-0.05084229, 1.854012, 0.5968521, 1, 1, 1, 1, 1,
-0.05068095, -0.3058775, -5.3035, 1, 1, 1, 1, 1,
-0.05056784, 0.9759411, -0.2088636, 1, 1, 1, 1, 1,
-0.05000453, 1.302899, 0.9540955, 1, 1, 1, 1, 1,
-0.04941289, 0.8590192, -0.9974194, 0, 0, 1, 1, 1,
-0.04927782, 1.234316, 0.4103342, 1, 0, 0, 1, 1,
-0.04544475, 1.094144, -1.634728, 1, 0, 0, 1, 1,
-0.04408452, 0.2298421, 1.741158, 1, 0, 0, 1, 1,
-0.04278516, 0.7364662, 0.6747838, 1, 0, 0, 1, 1,
-0.03241786, -1.326304, -4.155764, 1, 0, 0, 1, 1,
-0.02987091, -2.172093, -4.797112, 0, 0, 0, 1, 1,
-0.02839991, -0.9580725, -1.831824, 0, 0, 0, 1, 1,
-0.02788372, -0.9410332, -4.724231, 0, 0, 0, 1, 1,
-0.02553007, 0.3838052, 0.8454496, 0, 0, 0, 1, 1,
-0.02415457, -1.550756, -3.612386, 0, 0, 0, 1, 1,
-0.02294191, -0.2004749, -2.168312, 0, 0, 0, 1, 1,
-0.01611292, 1.640054, 0.9215959, 0, 0, 0, 1, 1,
-0.01007364, -1.067511, -2.78761, 1, 1, 1, 1, 1,
-0.005514317, -1.264936, -1.499421, 1, 1, 1, 1, 1,
-0.00549933, -0.6964011, -3.469732, 1, 1, 1, 1, 1,
0.0006125933, -0.2075618, 3.131356, 1, 1, 1, 1, 1,
0.002932532, 0.4627978, 0.9535096, 1, 1, 1, 1, 1,
0.009771393, -1.982741, 4.607419, 1, 1, 1, 1, 1,
0.01090148, -1.115828, 3.524886, 1, 1, 1, 1, 1,
0.01324807, -0.1192742, 3.427623, 1, 1, 1, 1, 1,
0.01573734, 0.9561015, 1.468153, 1, 1, 1, 1, 1,
0.01675652, 1.145954, -0.2265865, 1, 1, 1, 1, 1,
0.0176029, 1.903546, -0.3133992, 1, 1, 1, 1, 1,
0.02652961, -0.407569, 1.170497, 1, 1, 1, 1, 1,
0.02721828, -1.138858, 2.449845, 1, 1, 1, 1, 1,
0.02897582, 0.08917091, -0.2687267, 1, 1, 1, 1, 1,
0.02975677, -0.2295319, 1.941782, 1, 1, 1, 1, 1,
0.03929101, -0.08240841, 1.311192, 0, 0, 1, 1, 1,
0.05629896, -1.283569, 3.362153, 1, 0, 0, 1, 1,
0.05644329, 0.8854847, -0.2242034, 1, 0, 0, 1, 1,
0.05664316, -0.9766627, 2.606937, 1, 0, 0, 1, 1,
0.0575651, -0.6122431, 3.550611, 1, 0, 0, 1, 1,
0.05791637, -0.4111435, 3.322806, 1, 0, 0, 1, 1,
0.06304666, -1.443705, 2.756073, 0, 0, 0, 1, 1,
0.06760056, -0.208828, 3.206118, 0, 0, 0, 1, 1,
0.06984208, 0.7647804, 0.0560102, 0, 0, 0, 1, 1,
0.07209589, -1.102901, 3.348128, 0, 0, 0, 1, 1,
0.07222174, -0.1872678, 2.172181, 0, 0, 0, 1, 1,
0.07589181, -0.5154443, 3.544825, 0, 0, 0, 1, 1,
0.07865467, -0.515099, 3.755748, 0, 0, 0, 1, 1,
0.07888955, -0.1326661, 3.930061, 1, 1, 1, 1, 1,
0.0806058, -0.4279843, 2.214668, 1, 1, 1, 1, 1,
0.08074465, 1.528799, 0.5638846, 1, 1, 1, 1, 1,
0.08374798, 0.7008318, -0.5539092, 1, 1, 1, 1, 1,
0.08734543, 0.3878585, -0.5723129, 1, 1, 1, 1, 1,
0.08972339, -0.3665606, 3.329311, 1, 1, 1, 1, 1,
0.09088781, -0.9846436, 3.789141, 1, 1, 1, 1, 1,
0.09367281, -1.155515, 4.946067, 1, 1, 1, 1, 1,
0.09810751, -0.430629, 3.209427, 1, 1, 1, 1, 1,
0.1023604, 0.2178188, 1.37118, 1, 1, 1, 1, 1,
0.1059662, -0.4518434, 4.310101, 1, 1, 1, 1, 1,
0.1071191, 0.3290232, -1.360289, 1, 1, 1, 1, 1,
0.1079019, 0.6247734, 1.425889, 1, 1, 1, 1, 1,
0.1102051, 1.852507, -1.494483, 1, 1, 1, 1, 1,
0.1102477, 0.4541433, 1.534079, 1, 1, 1, 1, 1,
0.1168389, -1.032503, 3.562907, 0, 0, 1, 1, 1,
0.1190461, -0.2132497, 2.349517, 1, 0, 0, 1, 1,
0.1207154, 0.4117005, 0.9718488, 1, 0, 0, 1, 1,
0.1288315, 0.02981704, 0.9405762, 1, 0, 0, 1, 1,
0.1295318, -0.4210935, 3.075592, 1, 0, 0, 1, 1,
0.1295428, 0.436002, 0.72593, 1, 0, 0, 1, 1,
0.1296405, 0.3414292, 1.2363, 0, 0, 0, 1, 1,
0.1338831, -0.6564728, 2.481884, 0, 0, 0, 1, 1,
0.1371922, 1.026751, -1.260853, 0, 0, 0, 1, 1,
0.1391107, -0.9542446, 4.000578, 0, 0, 0, 1, 1,
0.1415766, -0.9606666, 0.1797895, 0, 0, 0, 1, 1,
0.1421191, -0.07226261, 1.310225, 0, 0, 0, 1, 1,
0.1483911, 0.07534251, 2.427683, 0, 0, 0, 1, 1,
0.1500533, -0.367256, 3.539635, 1, 1, 1, 1, 1,
0.1504343, 0.06124363, 0.1225369, 1, 1, 1, 1, 1,
0.1504399, 1.330835, 0.02470967, 1, 1, 1, 1, 1,
0.1547553, -0.01127893, 0.5776095, 1, 1, 1, 1, 1,
0.1578813, -1.306861, 0.7964134, 1, 1, 1, 1, 1,
0.1583008, -0.6139429, 3.823203, 1, 1, 1, 1, 1,
0.1629818, 0.5690902, -0.8848768, 1, 1, 1, 1, 1,
0.1650106, -0.9651467, 4.441543, 1, 1, 1, 1, 1,
0.1745268, 0.1661939, -0.2415302, 1, 1, 1, 1, 1,
0.1745635, -1.553696, 4.611858, 1, 1, 1, 1, 1,
0.1780293, -2.19424, 3.639009, 1, 1, 1, 1, 1,
0.1816465, 0.07988658, 1.643392, 1, 1, 1, 1, 1,
0.1874332, 0.6272132, 0.01221717, 1, 1, 1, 1, 1,
0.1896982, 0.09110663, 2.943566, 1, 1, 1, 1, 1,
0.1903574, -0.5248613, 4.855458, 1, 1, 1, 1, 1,
0.1935288, -0.112329, 0.8604456, 0, 0, 1, 1, 1,
0.1938426, -1.356749, 2.508358, 1, 0, 0, 1, 1,
0.2066304, 0.3264423, -1.838581, 1, 0, 0, 1, 1,
0.2078359, -1.580948, 2.18139, 1, 0, 0, 1, 1,
0.2104995, 1.332064, -1.442833, 1, 0, 0, 1, 1,
0.2116136, 0.3401989, 2.06367, 1, 0, 0, 1, 1,
0.2135108, 1.64514, -1.06966, 0, 0, 0, 1, 1,
0.2164525, -0.4500781, 2.795363, 0, 0, 0, 1, 1,
0.216998, -0.2376097, 1.358081, 0, 0, 0, 1, 1,
0.2195687, -0.497749, 2.747034, 0, 0, 0, 1, 1,
0.2208087, 1.101824, -0.6850184, 0, 0, 0, 1, 1,
0.2262221, 0.3282416, 0.637841, 0, 0, 0, 1, 1,
0.2310355, -0.2327064, 2.321026, 0, 0, 0, 1, 1,
0.2317393, 0.2979774, -0.5697969, 1, 1, 1, 1, 1,
0.2405158, -1.272374, 2.719656, 1, 1, 1, 1, 1,
0.2406301, -1.232516, 3.805129, 1, 1, 1, 1, 1,
0.2455998, 0.07499396, 0.7771346, 1, 1, 1, 1, 1,
0.248992, 0.1406091, -0.911375, 1, 1, 1, 1, 1,
0.249742, -0.0119085, 0.1693883, 1, 1, 1, 1, 1,
0.2522041, -0.1487972, 1.591857, 1, 1, 1, 1, 1,
0.2533624, -0.5641719, 4.290068, 1, 1, 1, 1, 1,
0.2547394, -0.3649079, 2.017142, 1, 1, 1, 1, 1,
0.2550506, -0.9413698, 3.778947, 1, 1, 1, 1, 1,
0.2553059, 0.174586, -0.3768877, 1, 1, 1, 1, 1,
0.2553449, 1.301388, 1.036616, 1, 1, 1, 1, 1,
0.2567252, -0.02260826, 1.615221, 1, 1, 1, 1, 1,
0.2570692, -0.008353136, 0.4807589, 1, 1, 1, 1, 1,
0.2633237, -0.3797728, 2.823661, 1, 1, 1, 1, 1,
0.2658525, -1.659247, 2.29059, 0, 0, 1, 1, 1,
0.2704456, -0.2086198, 1.518862, 1, 0, 0, 1, 1,
0.2760116, 0.8785915, -0.625259, 1, 0, 0, 1, 1,
0.2797021, -0.5282902, 2.675894, 1, 0, 0, 1, 1,
0.2832845, -2.021743, 4.227686, 1, 0, 0, 1, 1,
0.2834974, -0.5467657, -0.04985013, 1, 0, 0, 1, 1,
0.2841179, 0.4769959, 0.3225682, 0, 0, 0, 1, 1,
0.2857414, -1.80377, 1.82811, 0, 0, 0, 1, 1,
0.2877307, 0.4887723, -0.5533631, 0, 0, 0, 1, 1,
0.2941735, 0.3177554, -0.1874812, 0, 0, 0, 1, 1,
0.3060247, -0.6232394, 1.686951, 0, 0, 0, 1, 1,
0.3067358, -1.086876, 3.044532, 0, 0, 0, 1, 1,
0.3088845, -0.9362467, 3.418947, 0, 0, 0, 1, 1,
0.3115182, 0.9234397, -0.3118045, 1, 1, 1, 1, 1,
0.3149515, -0.3266166, 2.335256, 1, 1, 1, 1, 1,
0.3215594, 0.7325597, 2.932845, 1, 1, 1, 1, 1,
0.3258497, 1.006073, 1.891546, 1, 1, 1, 1, 1,
0.3278814, -0.3116258, 1.429193, 1, 1, 1, 1, 1,
0.3285483, 0.1546546, -0.2178338, 1, 1, 1, 1, 1,
0.3386298, -0.825029, 1.577127, 1, 1, 1, 1, 1,
0.3390192, -0.9741409, 3.892312, 1, 1, 1, 1, 1,
0.3398755, 0.718321, 0.1183498, 1, 1, 1, 1, 1,
0.3406285, 0.4556638, 1.077818, 1, 1, 1, 1, 1,
0.343491, 1.595192, 1.374429, 1, 1, 1, 1, 1,
0.3477123, 0.3873895, -1.19522, 1, 1, 1, 1, 1,
0.3510571, -0.03641533, 1.134701, 1, 1, 1, 1, 1,
0.3532203, -1.050226, 3.266634, 1, 1, 1, 1, 1,
0.3551621, 0.8278305, 0.3109638, 1, 1, 1, 1, 1,
0.3557251, 1.206838, -0.1950544, 0, 0, 1, 1, 1,
0.3561085, -0.9897743, 2.31365, 1, 0, 0, 1, 1,
0.3592206, 1.67964, 0.7764182, 1, 0, 0, 1, 1,
0.3594598, -0.9661059, 2.122929, 1, 0, 0, 1, 1,
0.3600593, -1.352652, 1.422531, 1, 0, 0, 1, 1,
0.3602455, 0.8307302, 0.5766332, 1, 0, 0, 1, 1,
0.3687513, 1.417733, -0.1629695, 0, 0, 0, 1, 1,
0.3694646, -0.07782903, 1.666501, 0, 0, 0, 1, 1,
0.3715959, 1.047018, -0.7831755, 0, 0, 0, 1, 1,
0.3722161, -1.039267, 2.944582, 0, 0, 0, 1, 1,
0.3730761, -0.406087, 1.562311, 0, 0, 0, 1, 1,
0.3743452, -1.582561, 3.634386, 0, 0, 0, 1, 1,
0.3745849, -0.5884356, 2.599726, 0, 0, 0, 1, 1,
0.3754791, -1.288885, 3.547002, 1, 1, 1, 1, 1,
0.3771868, -0.8607398, 1.047726, 1, 1, 1, 1, 1,
0.3820601, -1.974982, 2.559854, 1, 1, 1, 1, 1,
0.3838791, 1.183143, 1.638344, 1, 1, 1, 1, 1,
0.3848878, -1.290328, 4.399691, 1, 1, 1, 1, 1,
0.3901594, 0.4829358, 1.042058, 1, 1, 1, 1, 1,
0.3903301, 1.244283, 1.622433, 1, 1, 1, 1, 1,
0.3905599, -0.2935811, 1.314566, 1, 1, 1, 1, 1,
0.3905679, -1.493918, 0.5353755, 1, 1, 1, 1, 1,
0.3931163, 2.041151, 0.8293197, 1, 1, 1, 1, 1,
0.397833, -0.6319409, 2.192835, 1, 1, 1, 1, 1,
0.3988178, 1.380026, -0.02416733, 1, 1, 1, 1, 1,
0.3996913, 0.08220972, 1.402509, 1, 1, 1, 1, 1,
0.3999315, 0.8189816, 0.4880406, 1, 1, 1, 1, 1,
0.4000278, -0.536318, 3.105599, 1, 1, 1, 1, 1,
0.4019855, -0.08411306, 2.746553, 0, 0, 1, 1, 1,
0.4024408, -0.8455637, 3.271188, 1, 0, 0, 1, 1,
0.4048313, -0.4651037, 2.063494, 1, 0, 0, 1, 1,
0.406452, 0.4965669, -0.5953122, 1, 0, 0, 1, 1,
0.40811, -0.3063122, 2.744529, 1, 0, 0, 1, 1,
0.4086972, 0.2804005, 0.1938538, 1, 0, 0, 1, 1,
0.409681, -0.04386069, 2.187853, 0, 0, 0, 1, 1,
0.411144, -0.4495812, 3.979286, 0, 0, 0, 1, 1,
0.412551, 0.8708785, 0.5843219, 0, 0, 0, 1, 1,
0.41638, 2.164717, -0.3860932, 0, 0, 0, 1, 1,
0.4205402, 0.1737989, -0.02397753, 0, 0, 0, 1, 1,
0.4229891, 0.741954, 1.592016, 0, 0, 0, 1, 1,
0.4252011, 0.5420514, -0.6709815, 0, 0, 0, 1, 1,
0.4263588, 1.255098, 0.4531213, 1, 1, 1, 1, 1,
0.4278615, -1.200065, 2.241566, 1, 1, 1, 1, 1,
0.4287329, 0.7882046, 0.01267901, 1, 1, 1, 1, 1,
0.431237, -0.03242655, 1.760902, 1, 1, 1, 1, 1,
0.4316064, 1.090042, 0.4478371, 1, 1, 1, 1, 1,
0.4329801, -1.189382, 0.6316596, 1, 1, 1, 1, 1,
0.4366486, -1.012264, 3.891642, 1, 1, 1, 1, 1,
0.4381689, 0.5709702, 1.428582, 1, 1, 1, 1, 1,
0.438508, -0.07575667, 1.22604, 1, 1, 1, 1, 1,
0.4400266, 0.8994246, 0.2677616, 1, 1, 1, 1, 1,
0.4455068, -0.2504721, 4.150794, 1, 1, 1, 1, 1,
0.447187, 0.2380259, 1.508683, 1, 1, 1, 1, 1,
0.4472349, -0.5837283, 2.306006, 1, 1, 1, 1, 1,
0.4539817, 0.5565242, 0.4767126, 1, 1, 1, 1, 1,
0.4550103, 0.1190918, 2.111763, 1, 1, 1, 1, 1,
0.4560327, -0.8627936, 2.632263, 0, 0, 1, 1, 1,
0.4570552, -0.001190559, 1.398509, 1, 0, 0, 1, 1,
0.457714, -1.993637, 2.878873, 1, 0, 0, 1, 1,
0.4578279, 1.707904, -0.1251982, 1, 0, 0, 1, 1,
0.459068, -0.06596453, 0.5398587, 1, 0, 0, 1, 1,
0.4592068, -1.157792, 2.485574, 1, 0, 0, 1, 1,
0.4636508, 0.2529573, 0.1593763, 0, 0, 0, 1, 1,
0.4704349, 0.6086834, 0.6064779, 0, 0, 0, 1, 1,
0.4720368, -1.273278, 2.761629, 0, 0, 0, 1, 1,
0.4732375, 1.206009, 0.2911097, 0, 0, 0, 1, 1,
0.4773064, 0.5240998, -0.7627084, 0, 0, 0, 1, 1,
0.4783301, 0.5580308, -0.2104066, 0, 0, 0, 1, 1,
0.4894041, -0.08104628, 2.487068, 0, 0, 0, 1, 1,
0.4904615, -1.212517, 3.281163, 1, 1, 1, 1, 1,
0.4911881, -0.3629892, 3.445194, 1, 1, 1, 1, 1,
0.4940449, 0.7278086, 0.5109914, 1, 1, 1, 1, 1,
0.4941916, -1.920788, 1.624275, 1, 1, 1, 1, 1,
0.4995726, 0.8472641, 2.262418, 1, 1, 1, 1, 1,
0.4996989, 0.04324217, 1.874027, 1, 1, 1, 1, 1,
0.500064, 0.6602316, 0.4928202, 1, 1, 1, 1, 1,
0.5130298, 0.6363305, 3.244165, 1, 1, 1, 1, 1,
0.5213122, 0.1502741, -0.6418994, 1, 1, 1, 1, 1,
0.5233193, 0.9024237, 0.3011054, 1, 1, 1, 1, 1,
0.5235121, -0.420089, 2.113565, 1, 1, 1, 1, 1,
0.5258981, -0.08718043, 1.152618, 1, 1, 1, 1, 1,
0.5262088, 0.6220584, 0.9041157, 1, 1, 1, 1, 1,
0.5296578, -1.018347, 3.034995, 1, 1, 1, 1, 1,
0.5300752, -0.09974474, 0.1833599, 1, 1, 1, 1, 1,
0.5301262, -0.5462972, 2.530349, 0, 0, 1, 1, 1,
0.5368868, -0.4075919, 2.658391, 1, 0, 0, 1, 1,
0.5423248, 0.9865903, 1.757441, 1, 0, 0, 1, 1,
0.5448306, -1.294404, 3.005371, 1, 0, 0, 1, 1,
0.5553808, -1.878854, 2.900438, 1, 0, 0, 1, 1,
0.559464, -0.3234547, 1.233512, 1, 0, 0, 1, 1,
0.5648885, -0.9761993, 2.830711, 0, 0, 0, 1, 1,
0.5687656, 1.086878, 1.244577, 0, 0, 0, 1, 1,
0.5722714, -0.3675939, 1.076728, 0, 0, 0, 1, 1,
0.5736569, -0.2367387, 0.9684075, 0, 0, 0, 1, 1,
0.5749857, 1.946253, -0.533164, 0, 0, 0, 1, 1,
0.5754105, 1.092642, -0.3249767, 0, 0, 0, 1, 1,
0.5761507, -0.1257744, 2.002093, 0, 0, 0, 1, 1,
0.5765907, 0.9791366, 0.6240275, 1, 1, 1, 1, 1,
0.5773137, -0.7184486, 1.514696, 1, 1, 1, 1, 1,
0.5814152, -1.102857, 3.964995, 1, 1, 1, 1, 1,
0.5822397, 0.9521562, 1.018997, 1, 1, 1, 1, 1,
0.5896143, 0.7578567, -0.1232466, 1, 1, 1, 1, 1,
0.5909751, 0.3581585, 3.348477, 1, 1, 1, 1, 1,
0.5915823, 1.13607, 0.06110321, 1, 1, 1, 1, 1,
0.5917203, 1.43284, -0.1260591, 1, 1, 1, 1, 1,
0.5929618, 1.524818, -0.01895425, 1, 1, 1, 1, 1,
0.5970448, -0.1274598, 1.212182, 1, 1, 1, 1, 1,
0.5996899, 0.6208543, 2.521743, 1, 1, 1, 1, 1,
0.6001747, -1.230977, 3.197626, 1, 1, 1, 1, 1,
0.6080142, 0.7045021, 1.420709, 1, 1, 1, 1, 1,
0.6081104, -0.1816417, 0.4461937, 1, 1, 1, 1, 1,
0.6091066, -0.6731874, 2.061814, 1, 1, 1, 1, 1,
0.6095464, -1.145181, 2.152204, 0, 0, 1, 1, 1,
0.6171109, -0.6884739, 2.618104, 1, 0, 0, 1, 1,
0.6247612, 0.2860635, 0.1912155, 1, 0, 0, 1, 1,
0.6290016, 1.786126, -0.3183139, 1, 0, 0, 1, 1,
0.6342515, 0.07358019, 2.774844, 1, 0, 0, 1, 1,
0.6393805, 1.511526, 0.6861151, 1, 0, 0, 1, 1,
0.6430344, 1.376066, 0.2473514, 0, 0, 0, 1, 1,
0.6434398, 1.167716, 0.4706939, 0, 0, 0, 1, 1,
0.6448988, -0.2280965, 1.614664, 0, 0, 0, 1, 1,
0.64608, -0.7668431, 4.227807, 0, 0, 0, 1, 1,
0.6469768, -1.579686, 3.557734, 0, 0, 0, 1, 1,
0.6479042, -0.3167333, 2.447301, 0, 0, 0, 1, 1,
0.6493519, -1.634861, 1.524496, 0, 0, 0, 1, 1,
0.6495924, 0.5004175, 3.988074, 1, 1, 1, 1, 1,
0.6577619, -1.147395, 5.51635, 1, 1, 1, 1, 1,
0.6589535, -0.0570794, 1.669303, 1, 1, 1, 1, 1,
0.6599903, -1.47209, 2.26116, 1, 1, 1, 1, 1,
0.6651638, 0.1186094, 1.519048, 1, 1, 1, 1, 1,
0.6727974, -1.231681, 1.917721, 1, 1, 1, 1, 1,
0.6740694, -0.6508892, 0.6807948, 1, 1, 1, 1, 1,
0.6740977, -1.409078, 1.931009, 1, 1, 1, 1, 1,
0.6764806, 1.817418, 1.374026, 1, 1, 1, 1, 1,
0.6770825, 0.4396886, 0.05210931, 1, 1, 1, 1, 1,
0.6777146, -1.30816, 2.937606, 1, 1, 1, 1, 1,
0.6785337, 0.8142905, -0.6701553, 1, 1, 1, 1, 1,
0.6785879, 0.249837, 1.599533, 1, 1, 1, 1, 1,
0.6883959, -1.092602, 1.283486, 1, 1, 1, 1, 1,
0.6890608, -1.917089, 3.144927, 1, 1, 1, 1, 1,
0.6903668, 0.6025974, 1.420611, 0, 0, 1, 1, 1,
0.7026004, 0.6134169, -0.4273224, 1, 0, 0, 1, 1,
0.7031242, 1.147151, 2.368642, 1, 0, 0, 1, 1,
0.7069589, 0.7078313, 3.808502, 1, 0, 0, 1, 1,
0.7126859, -1.377537, 1.45326, 1, 0, 0, 1, 1,
0.7146289, 0.2768373, 0.9489198, 1, 0, 0, 1, 1,
0.7177521, 0.339222, -0.05791609, 0, 0, 0, 1, 1,
0.7212993, -0.0493177, 2.251777, 0, 0, 0, 1, 1,
0.7234312, -0.5280391, 3.719746, 0, 0, 0, 1, 1,
0.7277963, 1.549914, 1.303354, 0, 0, 0, 1, 1,
0.7286037, 1.273147, 0.08348445, 0, 0, 0, 1, 1,
0.7328146, -0.8041679, 3.397552, 0, 0, 0, 1, 1,
0.7344736, -0.5228622, 2.232477, 0, 0, 0, 1, 1,
0.7363217, -0.7652795, 2.139241, 1, 1, 1, 1, 1,
0.7418922, 0.2602334, -0.3142426, 1, 1, 1, 1, 1,
0.7458593, -1.248614, 3.266174, 1, 1, 1, 1, 1,
0.746051, -1.233429, 2.291047, 1, 1, 1, 1, 1,
0.7472691, -0.4522138, 3.533888, 1, 1, 1, 1, 1,
0.7476544, 0.5434526, 0.8234799, 1, 1, 1, 1, 1,
0.7555484, 0.04889469, 1.633911, 1, 1, 1, 1, 1,
0.7559302, 2.665725, -0.3756481, 1, 1, 1, 1, 1,
0.7569685, -0.3337795, 2.320845, 1, 1, 1, 1, 1,
0.7666312, 2.157078, 0.4599207, 1, 1, 1, 1, 1,
0.7707418, -0.1627489, 2.015497, 1, 1, 1, 1, 1,
0.7711505, -0.938587, 1.961334, 1, 1, 1, 1, 1,
0.7716562, -1.809289, 2.679308, 1, 1, 1, 1, 1,
0.7746443, 0.5686154, 1.737302, 1, 1, 1, 1, 1,
0.7764518, -1.022437, 2.377283, 1, 1, 1, 1, 1,
0.7834072, -1.476683, 2.650681, 0, 0, 1, 1, 1,
0.7953684, -0.5659477, 1.861871, 1, 0, 0, 1, 1,
0.8006476, 0.5614167, 1.139004, 1, 0, 0, 1, 1,
0.801647, -0.6405612, 2.28982, 1, 0, 0, 1, 1,
0.8043736, -1.97323, 3.798076, 1, 0, 0, 1, 1,
0.8068554, 0.2680281, 1.396466, 1, 0, 0, 1, 1,
0.809107, 1.625222, -0.6112181, 0, 0, 0, 1, 1,
0.8097973, 1.123578, 0.2460945, 0, 0, 0, 1, 1,
0.8165077, -1.28358, 2.494341, 0, 0, 0, 1, 1,
0.8181466, -0.1388072, -0.4790788, 0, 0, 0, 1, 1,
0.8188196, -2.330083, 4.978207, 0, 0, 0, 1, 1,
0.8248485, 1.629481, 1.579865, 0, 0, 0, 1, 1,
0.8301868, -1.862571, 2.85844, 0, 0, 0, 1, 1,
0.830516, 1.266423, 0.894146, 1, 1, 1, 1, 1,
0.8320704, -0.274195, 0.5434669, 1, 1, 1, 1, 1,
0.8381765, -1.345329, 2.525262, 1, 1, 1, 1, 1,
0.8490497, 1.183841, -0.1484808, 1, 1, 1, 1, 1,
0.8508694, -1.250353, 2.313159, 1, 1, 1, 1, 1,
0.8516596, 0.5328537, 2.359943, 1, 1, 1, 1, 1,
0.8561863, -0.3278199, 2.093196, 1, 1, 1, 1, 1,
0.8620395, 0.7789786, -0.05564037, 1, 1, 1, 1, 1,
0.8695254, -1.061904, 4.689398, 1, 1, 1, 1, 1,
0.8704939, -0.4438624, 2.685692, 1, 1, 1, 1, 1,
0.8721684, -0.8779386, 1.762903, 1, 1, 1, 1, 1,
0.8778954, 0.245092, 0.505041, 1, 1, 1, 1, 1,
0.8801908, 1.537151, 0.5253387, 1, 1, 1, 1, 1,
0.8860092, -1.046478, 2.90906, 1, 1, 1, 1, 1,
0.8886367, 0.01382693, 1.229153, 1, 1, 1, 1, 1,
0.8960719, -1.155679, 2.266647, 0, 0, 1, 1, 1,
0.8984403, -1.552223, 4.189205, 1, 0, 0, 1, 1,
0.9048949, 0.5519495, 1.728892, 1, 0, 0, 1, 1,
0.9088023, -1.357937, 1.083514, 1, 0, 0, 1, 1,
0.915181, -0.6352913, 2.589908, 1, 0, 0, 1, 1,
0.9155882, -1.15717, 2.938618, 1, 0, 0, 1, 1,
0.9233605, -2.10466, 3.263689, 0, 0, 0, 1, 1,
0.9252048, -0.5247568, 0.4989186, 0, 0, 0, 1, 1,
0.930446, 0.3387884, 1.232398, 0, 0, 0, 1, 1,
0.9365897, 0.159098, 1.861188, 0, 0, 0, 1, 1,
0.9399642, 0.640994, -0.7476723, 0, 0, 0, 1, 1,
0.9415506, -1.035986, 1.613945, 0, 0, 0, 1, 1,
0.9472483, -0.2047608, 1.61423, 0, 0, 0, 1, 1,
0.948582, 0.6640716, 1.556559, 1, 1, 1, 1, 1,
0.9487962, -0.6751229, 1.083799, 1, 1, 1, 1, 1,
0.9496283, 2.161749, 0.5997214, 1, 1, 1, 1, 1,
0.9524332, 0.9581167, 0.6280888, 1, 1, 1, 1, 1,
0.9614719, -0.4335471, 1.845274, 1, 1, 1, 1, 1,
0.9679506, -0.7103733, 3.636023, 1, 1, 1, 1, 1,
0.9711924, 0.7428311, 0.7349413, 1, 1, 1, 1, 1,
0.9760924, 0.8292005, 1.21084, 1, 1, 1, 1, 1,
0.9770219, 1.040357, -0.4406229, 1, 1, 1, 1, 1,
0.9788597, 1.10369, 0.7082893, 1, 1, 1, 1, 1,
0.9883117, -0.8088772, 3.00888, 1, 1, 1, 1, 1,
0.9931059, 0.1233162, 3.412697, 1, 1, 1, 1, 1,
0.9997899, -1.203736, 2.764662, 1, 1, 1, 1, 1,
1.002739, 0.55098, 1.232299, 1, 1, 1, 1, 1,
1.01441, 1.950154, -1.02475, 1, 1, 1, 1, 1,
1.014428, 0.06525496, 1.894253, 0, 0, 1, 1, 1,
1.014831, 1.259279, 1.851654, 1, 0, 0, 1, 1,
1.015086, -0.3661076, 1.205253, 1, 0, 0, 1, 1,
1.017057, 2.733845, 0.7679459, 1, 0, 0, 1, 1,
1.017686, 0.206199, -0.1282024, 1, 0, 0, 1, 1,
1.019364, 1.680717, -0.6616224, 1, 0, 0, 1, 1,
1.020338, -0.1733373, 2.451905, 0, 0, 0, 1, 1,
1.020522, 0.233038, -0.06358384, 0, 0, 0, 1, 1,
1.031528, 0.1432178, 2.148766, 0, 0, 0, 1, 1,
1.032443, 0.5243778, 0.7088809, 0, 0, 0, 1, 1,
1.038735, 0.3627712, 0.6422803, 0, 0, 0, 1, 1,
1.039104, -0.2103652, 2.546504, 0, 0, 0, 1, 1,
1.048685, -0.3048719, 1.962428, 0, 0, 0, 1, 1,
1.059112, -2.608903, 2.48238, 1, 1, 1, 1, 1,
1.071061, -1.946427, 1.839496, 1, 1, 1, 1, 1,
1.071731, -0.1877035, 2.143461, 1, 1, 1, 1, 1,
1.071939, 1.062662, 0.9586268, 1, 1, 1, 1, 1,
1.092536, -0.6754739, 1.973821, 1, 1, 1, 1, 1,
1.095785, -1.134621, 1.703269, 1, 1, 1, 1, 1,
1.096565, -0.1528642, 2.654237, 1, 1, 1, 1, 1,
1.100899, 0.562862, 0.4177223, 1, 1, 1, 1, 1,
1.106101, 0.695279, 2.801577, 1, 1, 1, 1, 1,
1.106174, 0.4463108, 0.7053007, 1, 1, 1, 1, 1,
1.109636, 0.5757617, 1.810447, 1, 1, 1, 1, 1,
1.109717, -0.8874326, 3.787297, 1, 1, 1, 1, 1,
1.113805, -0.6544306, 2.115735, 1, 1, 1, 1, 1,
1.114601, -3.588119, 2.063837, 1, 1, 1, 1, 1,
1.115224, -0.04004471, 0.2597541, 1, 1, 1, 1, 1,
1.116067, 0.1256804, 2.249861, 0, 0, 1, 1, 1,
1.120939, 0.5267266, 0.6718543, 1, 0, 0, 1, 1,
1.1242, 0.4554616, 2.60949, 1, 0, 0, 1, 1,
1.124608, 0.3177463, 0.3365039, 1, 0, 0, 1, 1,
1.125723, -0.329455, 2.165479, 1, 0, 0, 1, 1,
1.13255, 0.6603018, 0.1915705, 1, 0, 0, 1, 1,
1.13473, -1.407044, 2.30163, 0, 0, 0, 1, 1,
1.147071, -0.9955428, 1.679521, 0, 0, 0, 1, 1,
1.151679, -1.546185, 1.648314, 0, 0, 0, 1, 1,
1.156517, 0.3267324, 2.373083, 0, 0, 0, 1, 1,
1.160897, -1.25915, 2.577309, 0, 0, 0, 1, 1,
1.170466, -0.09592621, 3.575795, 0, 0, 0, 1, 1,
1.17155, -0.3265967, 2.933244, 0, 0, 0, 1, 1,
1.176425, -0.791753, 4.140358, 1, 1, 1, 1, 1,
1.178366, -0.5630599, 1.615264, 1, 1, 1, 1, 1,
1.180218, 0.1264173, 2.432769, 1, 1, 1, 1, 1,
1.191628, -0.5562272, 3.327823, 1, 1, 1, 1, 1,
1.199008, -0.6226599, 3.849993, 1, 1, 1, 1, 1,
1.19948, 0.4569039, 2.366953, 1, 1, 1, 1, 1,
1.20207, -0.715982, 2.177233, 1, 1, 1, 1, 1,
1.206627, -1.013452, 0.4916212, 1, 1, 1, 1, 1,
1.212077, -0.3476354, 1.939718, 1, 1, 1, 1, 1,
1.229871, -0.8135765, 2.110609, 1, 1, 1, 1, 1,
1.236336, -1.251896, 4.192644, 1, 1, 1, 1, 1,
1.238812, -0.8402904, 0.202841, 1, 1, 1, 1, 1,
1.265128, 0.1656484, 0.6917096, 1, 1, 1, 1, 1,
1.270582, -0.2146126, 1.161709, 1, 1, 1, 1, 1,
1.27316, 0.3757638, 1.836479, 1, 1, 1, 1, 1,
1.274088, -0.5592893, 2.768856, 0, 0, 1, 1, 1,
1.275639, -0.6270244, 2.121735, 1, 0, 0, 1, 1,
1.277638, 0.1883597, 0.2617603, 1, 0, 0, 1, 1,
1.280787, 0.09046565, 1.28149, 1, 0, 0, 1, 1,
1.282316, -0.9570088, 2.745362, 1, 0, 0, 1, 1,
1.302099, 0.1722871, 3.548947, 1, 0, 0, 1, 1,
1.303064, -1.335199, 3.338626, 0, 0, 0, 1, 1,
1.30663, -0.931236, 4.829511, 0, 0, 0, 1, 1,
1.311374, 1.346788, 1.788469, 0, 0, 0, 1, 1,
1.312934, 1.429515, 1.953098, 0, 0, 0, 1, 1,
1.318111, 0.01078448, 1.907019, 0, 0, 0, 1, 1,
1.319824, -0.7395949, 2.671101, 0, 0, 0, 1, 1,
1.322676, 1.063515, 0.6634329, 0, 0, 0, 1, 1,
1.330286, -1.49971, 1.536157, 1, 1, 1, 1, 1,
1.337398, 2.291132, 0.09743457, 1, 1, 1, 1, 1,
1.340003, -0.05772373, 1.941214, 1, 1, 1, 1, 1,
1.3416, 0.7371627, 0.7241475, 1, 1, 1, 1, 1,
1.347135, -0.4728783, 2.760537, 1, 1, 1, 1, 1,
1.354706, 2.317795, 0.2397271, 1, 1, 1, 1, 1,
1.373461, -0.5425768, 0.7547578, 1, 1, 1, 1, 1,
1.378871, 0.3564926, 0.3148261, 1, 1, 1, 1, 1,
1.383976, 0.4234748, 1.01961, 1, 1, 1, 1, 1,
1.393537, -1.907287, 2.790454, 1, 1, 1, 1, 1,
1.406077, -1.133118, 1.895972, 1, 1, 1, 1, 1,
1.406291, 0.184834, 2.609761, 1, 1, 1, 1, 1,
1.424907, 0.9909299, 2.33427, 1, 1, 1, 1, 1,
1.429036, -1.16555, 1.492793, 1, 1, 1, 1, 1,
1.429397, -0.07370207, 3.099233, 1, 1, 1, 1, 1,
1.43373, -0.9836603, 0.2609398, 0, 0, 1, 1, 1,
1.43398, 0.8210293, 0.577592, 1, 0, 0, 1, 1,
1.452843, -0.4886383, 1.196903, 1, 0, 0, 1, 1,
1.453915, 0.3853307, 2.557096, 1, 0, 0, 1, 1,
1.467473, -0.7064597, 2.038558, 1, 0, 0, 1, 1,
1.475556, -0.5889611, 0.5764179, 1, 0, 0, 1, 1,
1.475774, -1.595157, 3.604523, 0, 0, 0, 1, 1,
1.476482, 0.9924629, 3.416066, 0, 0, 0, 1, 1,
1.478507, -0.4700293, 1.334444, 0, 0, 0, 1, 1,
1.506182, -1.558229, 0.4636539, 0, 0, 0, 1, 1,
1.529543, 1.748143, -2.308577, 0, 0, 0, 1, 1,
1.552536, 1.719962, 2.028574, 0, 0, 0, 1, 1,
1.564886, 1.174298, 2.795006, 0, 0, 0, 1, 1,
1.570668, 1.392394, -1.971615, 1, 1, 1, 1, 1,
1.617031, 0.8355628, 2.106408, 1, 1, 1, 1, 1,
1.627873, 0.305415, 1.184938, 1, 1, 1, 1, 1,
1.635085, 0.2914668, 2.392958, 1, 1, 1, 1, 1,
1.636862, -1.395046, 1.219827, 1, 1, 1, 1, 1,
1.645002, 0.3594168, 0.9155317, 1, 1, 1, 1, 1,
1.674874, -2.275466, 3.771489, 1, 1, 1, 1, 1,
1.715004, -0.7866238, 2.701299, 1, 1, 1, 1, 1,
1.716359, -0.6486319, 2.559991, 1, 1, 1, 1, 1,
1.730656, -0.008824321, 1.050732, 1, 1, 1, 1, 1,
1.735535, 0.08536635, 0.6097077, 1, 1, 1, 1, 1,
1.73861, 0.8339007, 1.886836, 1, 1, 1, 1, 1,
1.75649, 2.096603, 1.31332, 1, 1, 1, 1, 1,
1.763004, -1.184795, 1.913614, 1, 1, 1, 1, 1,
1.764148, -0.2237163, 1.855455, 1, 1, 1, 1, 1,
1.764867, 0.08909103, 1.906529, 0, 0, 1, 1, 1,
1.765946, 1.550697, 1.324675, 1, 0, 0, 1, 1,
1.773427, -0.3507663, 1.565583, 1, 0, 0, 1, 1,
1.777751, -0.204779, 1.748847, 1, 0, 0, 1, 1,
1.796204, 1.708022, 0.106104, 1, 0, 0, 1, 1,
1.796297, 0.04451672, 2.460606, 1, 0, 0, 1, 1,
1.80017, 1.759254, -1.310051, 0, 0, 0, 1, 1,
1.805629, 0.7847677, 0.3933893, 0, 0, 0, 1, 1,
1.808446, 0.1482161, 1.99643, 0, 0, 0, 1, 1,
1.811578, 1.128864, 2.076286, 0, 0, 0, 1, 1,
1.814654, 1.293838, 1.938841, 0, 0, 0, 1, 1,
1.82844, 1.287687, 0.4902889, 0, 0, 0, 1, 1,
1.835989, -0.8026694, 2.456186, 0, 0, 0, 1, 1,
1.84643, 1.574443, 1.902976, 1, 1, 1, 1, 1,
1.846441, 1.794733, 0.09846141, 1, 1, 1, 1, 1,
1.846784, 1.514362, 1.294109, 1, 1, 1, 1, 1,
1.854997, 0.7009261, 1.402667, 1, 1, 1, 1, 1,
1.859817, -0.7926945, 3.658536, 1, 1, 1, 1, 1,
1.869973, -0.222373, 1.553095, 1, 1, 1, 1, 1,
1.882419, -1.501497, 3.901226, 1, 1, 1, 1, 1,
1.885249, -1.564966, 0.2387906, 1, 1, 1, 1, 1,
1.890657, 2.079398, 2.496512, 1, 1, 1, 1, 1,
1.890952, -0.6698021, 0.9079995, 1, 1, 1, 1, 1,
1.898187, 1.765926, 0.9047095, 1, 1, 1, 1, 1,
1.906663, -0.9277909, 2.906597, 1, 1, 1, 1, 1,
1.943577, -0.3588312, 0.2113799, 1, 1, 1, 1, 1,
1.947873, -0.0743359, 2.745376, 1, 1, 1, 1, 1,
1.96028, 0.6746359, 0.04725963, 1, 1, 1, 1, 1,
1.967228, 1.109069, 0.1058909, 0, 0, 1, 1, 1,
1.991757, -1.895212, 2.708851, 1, 0, 0, 1, 1,
2.088804, 1.189617, 0.8674022, 1, 0, 0, 1, 1,
2.090953, 0.8491424, 2.062735, 1, 0, 0, 1, 1,
2.096322, -2.313707, 2.573051, 1, 0, 0, 1, 1,
2.131788, -0.04321668, 2.413588, 1, 0, 0, 1, 1,
2.157657, 1.883355, 0.5084136, 0, 0, 0, 1, 1,
2.227492, 0.04382371, 2.22374, 0, 0, 0, 1, 1,
2.230167, -1.234581, 2.971812, 0, 0, 0, 1, 1,
2.269707, 0.534315, 2.096444, 0, 0, 0, 1, 1,
2.367005, -1.366604, 2.169823, 0, 0, 0, 1, 1,
2.399389, 0.6049408, 1.479758, 0, 0, 0, 1, 1,
2.5521, -0.8770692, 2.891153, 0, 0, 0, 1, 1,
2.565897, 0.7548108, 0.7716994, 1, 1, 1, 1, 1,
2.603574, -1.110222, 2.441046, 1, 1, 1, 1, 1,
2.727127, -0.1086705, 2.372574, 1, 1, 1, 1, 1,
2.800776, -0.6987163, 2.991811, 1, 1, 1, 1, 1,
2.823533, -0.1307905, 1.741609, 1, 1, 1, 1, 1,
2.890732, -1.60721, 1.730214, 1, 1, 1, 1, 1,
2.897345, -1.517836, 1.185414, 1, 1, 1, 1, 1
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
var radius = 9.504774;
var distance = 33.38511;
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
mvMatrix.translate( -0.02887595, 0.2742372, -0.1064248 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38511);
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
