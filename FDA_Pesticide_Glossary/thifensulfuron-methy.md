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
-2.8068, 1.145693, -1.761554, 1, 0, 0, 1,
-2.756691, 0.3278343, -0.2913861, 1, 0.007843138, 0, 1,
-2.700633, -0.03660674, -0.8987758, 1, 0.01176471, 0, 1,
-2.622175, 0.5634832, -2.962777, 1, 0.01960784, 0, 1,
-2.570472, 0.8455061, -0.5655701, 1, 0.02352941, 0, 1,
-2.496403, 1.445816, -2.532569, 1, 0.03137255, 0, 1,
-2.457975, -0.3756773, -1.746297, 1, 0.03529412, 0, 1,
-2.423895, 0.9960197, -1.300524, 1, 0.04313726, 0, 1,
-2.3946, 0.8875317, -1.548598, 1, 0.04705882, 0, 1,
-2.331004, 0.9594977, -1.625251, 1, 0.05490196, 0, 1,
-2.282637, -0.9980853, -2.1468, 1, 0.05882353, 0, 1,
-2.273412, -0.1458107, -1.450024, 1, 0.06666667, 0, 1,
-2.256107, 0.3222725, -0.838474, 1, 0.07058824, 0, 1,
-2.238038, 0.06430216, -0.9608088, 1, 0.07843138, 0, 1,
-2.202405, 0.6499131, -0.6212763, 1, 0.08235294, 0, 1,
-2.163474, -1.218791, -1.435302, 1, 0.09019608, 0, 1,
-2.108861, -0.2343285, -2.368895, 1, 0.09411765, 0, 1,
-2.107788, -0.1841326, -1.701509, 1, 0.1019608, 0, 1,
-2.064484, -0.5508246, -0.8574644, 1, 0.1098039, 0, 1,
-2.062284, -0.4602572, -0.6280429, 1, 0.1137255, 0, 1,
-2.037187, -0.5672147, -3.003772, 1, 0.1215686, 0, 1,
-2.03154, 1.547801, -0.4005924, 1, 0.1254902, 0, 1,
-2.024656, -1.396201, -1.368882, 1, 0.1333333, 0, 1,
-2.020959, -1.196417, -1.539353, 1, 0.1372549, 0, 1,
-1.996988, -1.48282, -3.289033, 1, 0.145098, 0, 1,
-1.939334, -2.032133, -3.300363, 1, 0.1490196, 0, 1,
-1.923761, -1.755489, -3.448598, 1, 0.1568628, 0, 1,
-1.911093, 0.8044046, -1.815725, 1, 0.1607843, 0, 1,
-1.901896, 0.8006119, -1.622671, 1, 0.1686275, 0, 1,
-1.899361, 2.138972, -1.448531, 1, 0.172549, 0, 1,
-1.882108, -1.156191, -3.807768, 1, 0.1803922, 0, 1,
-1.87625, -1.388043, -2.495863, 1, 0.1843137, 0, 1,
-1.854444, 1.832898, 0.535898, 1, 0.1921569, 0, 1,
-1.854257, 0.1591199, -1.417419, 1, 0.1960784, 0, 1,
-1.838957, -0.5388663, -1.629714, 1, 0.2039216, 0, 1,
-1.836105, 0.3464167, -1.533883, 1, 0.2117647, 0, 1,
-1.807682, 1.281982, -0.2876409, 1, 0.2156863, 0, 1,
-1.80435, -0.5440454, -2.385004, 1, 0.2235294, 0, 1,
-1.774539, 1.001512, 0.6702589, 1, 0.227451, 0, 1,
-1.759932, -1.284543, -2.088168, 1, 0.2352941, 0, 1,
-1.753342, -1.139398, -3.182154, 1, 0.2392157, 0, 1,
-1.749734, 1.079472, 0.3914474, 1, 0.2470588, 0, 1,
-1.690996, 0.3551541, -1.012406, 1, 0.2509804, 0, 1,
-1.679284, -1.445856, -1.253881, 1, 0.2588235, 0, 1,
-1.677012, 0.4926687, 0.1313508, 1, 0.2627451, 0, 1,
-1.640197, 0.0484456, -2.176053, 1, 0.2705882, 0, 1,
-1.638918, -0.6881875, -2.393764, 1, 0.2745098, 0, 1,
-1.629468, -1.479085, -0.5994403, 1, 0.282353, 0, 1,
-1.617181, 0.1540046, -0.3523901, 1, 0.2862745, 0, 1,
-1.610865, -0.2677249, -1.867823, 1, 0.2941177, 0, 1,
-1.604801, 0.6378201, -0.4197721, 1, 0.3019608, 0, 1,
-1.588326, 1.299328, -0.9436577, 1, 0.3058824, 0, 1,
-1.587869, 0.1202233, -3.066053, 1, 0.3137255, 0, 1,
-1.575819, -0.02467524, -1.945509, 1, 0.3176471, 0, 1,
-1.570633, 1.032536, -2.440898, 1, 0.3254902, 0, 1,
-1.567876, -2.224767, -4.297937, 1, 0.3294118, 0, 1,
-1.567025, -0.825517, -2.009942, 1, 0.3372549, 0, 1,
-1.542698, -1.044837, -1.932521, 1, 0.3411765, 0, 1,
-1.539557, 0.1492275, -1.107729, 1, 0.3490196, 0, 1,
-1.533879, -1.274125, -0.2784241, 1, 0.3529412, 0, 1,
-1.532253, 0.8469347, -0.07215977, 1, 0.3607843, 0, 1,
-1.532225, 1.131815, -1.010411, 1, 0.3647059, 0, 1,
-1.531613, -0.1467368, -2.564573, 1, 0.372549, 0, 1,
-1.530454, -0.3077843, -2.554668, 1, 0.3764706, 0, 1,
-1.527342, -2.277344, -1.223676, 1, 0.3843137, 0, 1,
-1.498827, -0.1515136, -1.486869, 1, 0.3882353, 0, 1,
-1.492114, 0.8757403, -1.95041, 1, 0.3960784, 0, 1,
-1.485985, 0.778904, -1.174702, 1, 0.4039216, 0, 1,
-1.483649, -0.7149882, 0.8123752, 1, 0.4078431, 0, 1,
-1.479651, 1.064942, -1.452004, 1, 0.4156863, 0, 1,
-1.47584, -0.546851, -0.9018452, 1, 0.4196078, 0, 1,
-1.456924, 0.1083564, -0.9000622, 1, 0.427451, 0, 1,
-1.451217, 1.283991, 0.5882567, 1, 0.4313726, 0, 1,
-1.436309, -0.5044165, -2.30087, 1, 0.4392157, 0, 1,
-1.41797, 1.056638, -0.6348984, 1, 0.4431373, 0, 1,
-1.414657, -1.080954, -2.087903, 1, 0.4509804, 0, 1,
-1.409728, 0.01543184, -0.8762016, 1, 0.454902, 0, 1,
-1.409592, -1.018685, -2.994705, 1, 0.4627451, 0, 1,
-1.403401, 0.4419198, -0.7410791, 1, 0.4666667, 0, 1,
-1.400711, -0.2145035, 0.4356974, 1, 0.4745098, 0, 1,
-1.391507, 0.1169353, -0.729504, 1, 0.4784314, 0, 1,
-1.384426, 1.016764, -0.6386043, 1, 0.4862745, 0, 1,
-1.381086, 0.4253289, -0.05660944, 1, 0.4901961, 0, 1,
-1.377071, 0.2303157, 0.05346928, 1, 0.4980392, 0, 1,
-1.369716, 1.493235, 0.6551604, 1, 0.5058824, 0, 1,
-1.356109, 2.140449, -0.8964453, 1, 0.509804, 0, 1,
-1.355304, 1.231067, -2.002428, 1, 0.5176471, 0, 1,
-1.338056, 0.8104049, -1.423636, 1, 0.5215687, 0, 1,
-1.337382, -3.524592, -2.671125, 1, 0.5294118, 0, 1,
-1.332348, 0.1808096, -1.537254, 1, 0.5333334, 0, 1,
-1.307864, -0.5737537, -0.3799019, 1, 0.5411765, 0, 1,
-1.304575, -1.910592, -1.471116, 1, 0.5450981, 0, 1,
-1.304133, -1.141979, -4.066382, 1, 0.5529412, 0, 1,
-1.300802, -0.01443594, -2.362368, 1, 0.5568628, 0, 1,
-1.296053, -0.5135971, -3.320186, 1, 0.5647059, 0, 1,
-1.296005, 0.1201578, -0.351301, 1, 0.5686275, 0, 1,
-1.295686, 0.2907266, -1.173381, 1, 0.5764706, 0, 1,
-1.292205, 0.8149962, -0.1216212, 1, 0.5803922, 0, 1,
-1.262334, 1.299369, 0.05973775, 1, 0.5882353, 0, 1,
-1.261161, -0.9763313, -2.710301, 1, 0.5921569, 0, 1,
-1.254539, -0.08047495, -0.4952742, 1, 0.6, 0, 1,
-1.253936, -1.008048, -2.277795, 1, 0.6078432, 0, 1,
-1.252013, -1.475476, -2.135575, 1, 0.6117647, 0, 1,
-1.249356, 1.515006, -0.9957769, 1, 0.6196079, 0, 1,
-1.22723, -0.2495282, -0.8247918, 1, 0.6235294, 0, 1,
-1.219162, -0.1130507, -0.3557117, 1, 0.6313726, 0, 1,
-1.218029, 0.6053125, -1.183826, 1, 0.6352941, 0, 1,
-1.203064, 0.4949846, 0.8069845, 1, 0.6431373, 0, 1,
-1.19592, -0.4328254, -1.495643, 1, 0.6470588, 0, 1,
-1.194684, -0.4393212, -2.192822, 1, 0.654902, 0, 1,
-1.191406, 0.2331685, -0.9876517, 1, 0.6588235, 0, 1,
-1.164212, 0.5588228, -2.355999, 1, 0.6666667, 0, 1,
-1.163875, -1.009605, -2.723794, 1, 0.6705883, 0, 1,
-1.160641, -1.243469, -2.558911, 1, 0.6784314, 0, 1,
-1.159468, 0.05063135, -3.412529, 1, 0.682353, 0, 1,
-1.158208, 0.2782385, -1.952017, 1, 0.6901961, 0, 1,
-1.155318, 0.2159486, -1.640915, 1, 0.6941177, 0, 1,
-1.153708, -0.08838662, -1.508999, 1, 0.7019608, 0, 1,
-1.153446, 1.225219, -1.304318, 1, 0.7098039, 0, 1,
-1.151904, -0.6386582, -1.684325, 1, 0.7137255, 0, 1,
-1.150774, -0.9184619, -1.254004, 1, 0.7215686, 0, 1,
-1.136372, 0.758123, -0.7151076, 1, 0.7254902, 0, 1,
-1.128803, 0.9387558, -1.750795, 1, 0.7333333, 0, 1,
-1.117833, 0.4429222, -0.9602378, 1, 0.7372549, 0, 1,
-1.108481, -0.6291798, -2.300651, 1, 0.7450981, 0, 1,
-1.100018, -1.471431, -2.011438, 1, 0.7490196, 0, 1,
-1.099105, 0.4740943, -1.039555, 1, 0.7568628, 0, 1,
-1.083683, -0.367361, -1.853208, 1, 0.7607843, 0, 1,
-1.072686, -1.015731, -2.55757, 1, 0.7686275, 0, 1,
-1.067929, 0.0218818, -1.457797, 1, 0.772549, 0, 1,
-1.064924, -0.3757881, -3.197972, 1, 0.7803922, 0, 1,
-1.063668, 1.283221, -1.298653, 1, 0.7843137, 0, 1,
-1.063501, -1.932395, -3.59942, 1, 0.7921569, 0, 1,
-1.058574, 1.164974, -1.365815, 1, 0.7960784, 0, 1,
-1.054519, -0.2150485, -1.362173, 1, 0.8039216, 0, 1,
-1.05346, -0.3860691, -3.703946, 1, 0.8117647, 0, 1,
-1.041126, -1.386162, -2.353609, 1, 0.8156863, 0, 1,
-1.035868, 0.765838, 0.4599257, 1, 0.8235294, 0, 1,
-1.029549, 0.5312235, -3.489837, 1, 0.827451, 0, 1,
-1.025975, 0.1626695, -1.720446, 1, 0.8352941, 0, 1,
-1.018724, -0.2473668, -1.641636, 1, 0.8392157, 0, 1,
-1.01689, -1.798735, -1.464759, 1, 0.8470588, 0, 1,
-1.014627, -0.734073, -0.9727324, 1, 0.8509804, 0, 1,
-1.000573, 0.7785218, -0.9300052, 1, 0.8588235, 0, 1,
-0.9993142, -1.254064, -2.050339, 1, 0.8627451, 0, 1,
-0.984657, 0.4804043, -1.987433, 1, 0.8705882, 0, 1,
-0.9827071, 0.5818701, -0.1273057, 1, 0.8745098, 0, 1,
-0.9703268, 0.3192188, -2.368359, 1, 0.8823529, 0, 1,
-0.961036, -1.645909, -1.381609, 1, 0.8862745, 0, 1,
-0.9530693, 1.853169, -0.80131, 1, 0.8941177, 0, 1,
-0.9517512, 0.9457724, 1.916905, 1, 0.8980392, 0, 1,
-0.9390431, -0.08988884, -0.9790189, 1, 0.9058824, 0, 1,
-0.9359724, -0.08313968, -1.061463, 1, 0.9137255, 0, 1,
-0.9345019, 0.3067794, -2.582937, 1, 0.9176471, 0, 1,
-0.9331601, -1.568758, -2.826643, 1, 0.9254902, 0, 1,
-0.9294782, -0.4253779, -3.229094, 1, 0.9294118, 0, 1,
-0.9265806, 0.7116386, -0.4829617, 1, 0.9372549, 0, 1,
-0.9223425, -0.7038269, -1.483779, 1, 0.9411765, 0, 1,
-0.9159487, 0.261733, -0.3810971, 1, 0.9490196, 0, 1,
-0.9085706, -0.9415885, -0.9373045, 1, 0.9529412, 0, 1,
-0.908225, 0.1166451, -2.463039, 1, 0.9607843, 0, 1,
-0.9065919, 1.651481, 1.632743, 1, 0.9647059, 0, 1,
-0.901152, 0.9207357, -1.564149, 1, 0.972549, 0, 1,
-0.8953357, -0.1346489, -1.07069, 1, 0.9764706, 0, 1,
-0.8951616, -0.5049278, -1.624441, 1, 0.9843137, 0, 1,
-0.8950841, 1.590659, -1.411011, 1, 0.9882353, 0, 1,
-0.8888272, -0.5626237, -1.761414, 1, 0.9960784, 0, 1,
-0.886568, 1.206338, -0.4996249, 0.9960784, 1, 0, 1,
-0.8846956, 0.7943122, 1.232309, 0.9921569, 1, 0, 1,
-0.8830652, -1.5873, -2.411357, 0.9843137, 1, 0, 1,
-0.8771858, -0.3945602, -1.356645, 0.9803922, 1, 0, 1,
-0.8740727, 1.066913, -0.3481898, 0.972549, 1, 0, 1,
-0.8727793, -0.5527983, -1.651222, 0.9686275, 1, 0, 1,
-0.861522, -0.2175752, -1.703323, 0.9607843, 1, 0, 1,
-0.8567935, -1.623645, -1.377578, 0.9568627, 1, 0, 1,
-0.8567162, 1.60511, -0.1169392, 0.9490196, 1, 0, 1,
-0.8555018, 1.017322, -0.147664, 0.945098, 1, 0, 1,
-0.853568, 1.030042, -0.492772, 0.9372549, 1, 0, 1,
-0.8534184, 0.2213052, 0.07829864, 0.9333333, 1, 0, 1,
-0.8532401, 0.1860776, -1.32537, 0.9254902, 1, 0, 1,
-0.8473565, 1.139149, -0.09110838, 0.9215686, 1, 0, 1,
-0.8338897, -0.03451432, -2.218063, 0.9137255, 1, 0, 1,
-0.8304197, -0.1139005, -1.420852, 0.9098039, 1, 0, 1,
-0.8275204, -0.2060827, -0.2385308, 0.9019608, 1, 0, 1,
-0.8262411, -0.8019937, -2.744109, 0.8941177, 1, 0, 1,
-0.8261853, 0.3586897, -1.573938, 0.8901961, 1, 0, 1,
-0.8259475, -2.41466, -1.783047, 0.8823529, 1, 0, 1,
-0.8235145, -0.2343016, -1.222528, 0.8784314, 1, 0, 1,
-0.8206958, -1.7664, -3.908871, 0.8705882, 1, 0, 1,
-0.817243, -0.6410208, -1.458422, 0.8666667, 1, 0, 1,
-0.8158943, 0.375468, -1.984326, 0.8588235, 1, 0, 1,
-0.8113657, 0.2122295, -2.021991, 0.854902, 1, 0, 1,
-0.8079678, -0.1738581, -1.15893, 0.8470588, 1, 0, 1,
-0.8035408, 0.38559, -1.376493, 0.8431373, 1, 0, 1,
-0.8023279, -1.693008, -3.292978, 0.8352941, 1, 0, 1,
-0.8003634, 0.4860264, 0.08600099, 0.8313726, 1, 0, 1,
-0.7996603, -0.5923675, -2.033814, 0.8235294, 1, 0, 1,
-0.7990904, 1.152943, -0.09709888, 0.8196079, 1, 0, 1,
-0.7988101, 0.04863381, -0.4991761, 0.8117647, 1, 0, 1,
-0.794723, 1.72851, -2.583312, 0.8078431, 1, 0, 1,
-0.7904648, -0.8752538, -2.331498, 0.8, 1, 0, 1,
-0.7750297, 0.6584716, -1.078857, 0.7921569, 1, 0, 1,
-0.770183, -0.6666622, -4.106424, 0.7882353, 1, 0, 1,
-0.7667425, 2.054058, -1.175275, 0.7803922, 1, 0, 1,
-0.7662557, -0.3604538, -0.6970898, 0.7764706, 1, 0, 1,
-0.7652059, -1.178721, -3.044915, 0.7686275, 1, 0, 1,
-0.7589535, 1.37901, 0.06310175, 0.7647059, 1, 0, 1,
-0.7518359, -0.3739818, -2.571963, 0.7568628, 1, 0, 1,
-0.7468446, -0.7758939, -2.226395, 0.7529412, 1, 0, 1,
-0.7437507, 0.3797788, -2.607248, 0.7450981, 1, 0, 1,
-0.7415442, 1.428744, -1.829723, 0.7411765, 1, 0, 1,
-0.7415322, -0.27848, -1.338774, 0.7333333, 1, 0, 1,
-0.7387395, -0.1880371, -1.535371, 0.7294118, 1, 0, 1,
-0.7387192, 0.5919855, -0.7360122, 0.7215686, 1, 0, 1,
-0.738324, 1.757455, 0.0006990887, 0.7176471, 1, 0, 1,
-0.7321526, -0.7280705, -1.541738, 0.7098039, 1, 0, 1,
-0.7319016, -0.2209219, -1.941447, 0.7058824, 1, 0, 1,
-0.7301137, -1.682357, -3.47808, 0.6980392, 1, 0, 1,
-0.7283981, -0.6555958, -2.003683, 0.6901961, 1, 0, 1,
-0.7203905, -0.8305091, -2.771686, 0.6862745, 1, 0, 1,
-0.7148551, -0.460205, -3.600937, 0.6784314, 1, 0, 1,
-0.7147087, 0.4510475, -2.089908, 0.6745098, 1, 0, 1,
-0.7140001, -1.11697, -4.52353, 0.6666667, 1, 0, 1,
-0.7126546, 0.02411222, -0.4368471, 0.6627451, 1, 0, 1,
-0.7089266, 1.316711, -2.210886, 0.654902, 1, 0, 1,
-0.7073541, 0.5825042, -0.682567, 0.6509804, 1, 0, 1,
-0.7047024, -1.099254, -2.112656, 0.6431373, 1, 0, 1,
-0.7027349, -1.228556, -2.174124, 0.6392157, 1, 0, 1,
-0.7020205, -0.5155152, -3.211845, 0.6313726, 1, 0, 1,
-0.7003065, 0.4567721, -1.97595, 0.627451, 1, 0, 1,
-0.697684, -0.03933289, -0.946107, 0.6196079, 1, 0, 1,
-0.6910639, 1.20566, -1.2217, 0.6156863, 1, 0, 1,
-0.6898041, 0.4131848, -0.3839683, 0.6078432, 1, 0, 1,
-0.6891708, 0.5567412, 0.1872015, 0.6039216, 1, 0, 1,
-0.6845927, 1.474173, -0.04849195, 0.5960785, 1, 0, 1,
-0.6669139, -0.5629905, -1.553978, 0.5882353, 1, 0, 1,
-0.6666212, 0.06031337, -1.069451, 0.5843138, 1, 0, 1,
-0.6652156, -1.2086, -2.460504, 0.5764706, 1, 0, 1,
-0.6648867, -0.06547307, -1.103274, 0.572549, 1, 0, 1,
-0.6624801, 0.8094642, 0.980798, 0.5647059, 1, 0, 1,
-0.6614687, 1.278649, 0.5088515, 0.5607843, 1, 0, 1,
-0.6561618, 1.467715, -1.295251, 0.5529412, 1, 0, 1,
-0.6536561, -0.3957121, -0.8878458, 0.5490196, 1, 0, 1,
-0.6534613, 1.117203, -0.2362926, 0.5411765, 1, 0, 1,
-0.6520891, 0.7867112, -2.12787, 0.5372549, 1, 0, 1,
-0.650435, -0.7818708, -3.251474, 0.5294118, 1, 0, 1,
-0.6502798, 0.8317404, 0.9820282, 0.5254902, 1, 0, 1,
-0.6470546, 1.239855, -0.3021904, 0.5176471, 1, 0, 1,
-0.6464047, 2.745066, -0.1522598, 0.5137255, 1, 0, 1,
-0.6440353, 2.677426, -1.330903, 0.5058824, 1, 0, 1,
-0.6428064, -0.318128, -0.4523138, 0.5019608, 1, 0, 1,
-0.6396754, 1.020232, -2.821416, 0.4941176, 1, 0, 1,
-0.6359491, -1.417472, -3.05925, 0.4862745, 1, 0, 1,
-0.6357242, -0.6376539, -1.723497, 0.4823529, 1, 0, 1,
-0.6305296, -1.078851, -1.900176, 0.4745098, 1, 0, 1,
-0.6235862, -1.569346, -3.608112, 0.4705882, 1, 0, 1,
-0.6233228, -0.5263807, -1.837056, 0.4627451, 1, 0, 1,
-0.6213752, -0.03228234, -1.591721, 0.4588235, 1, 0, 1,
-0.6194476, 2.001348, -0.3141674, 0.4509804, 1, 0, 1,
-0.6176478, 1.809875, -1.401814, 0.4470588, 1, 0, 1,
-0.6168857, 0.4202215, 0.7059492, 0.4392157, 1, 0, 1,
-0.609704, -0.07343778, -1.65406, 0.4352941, 1, 0, 1,
-0.6043963, 1.868012, -1.636515, 0.427451, 1, 0, 1,
-0.6026897, -0.2529707, -1.802874, 0.4235294, 1, 0, 1,
-0.6005846, -1.09844, -3.189632, 0.4156863, 1, 0, 1,
-0.5986273, -0.7921894, -2.592395, 0.4117647, 1, 0, 1,
-0.594368, 0.6663222, -2.02776, 0.4039216, 1, 0, 1,
-0.5911563, 0.1386497, -1.662041, 0.3960784, 1, 0, 1,
-0.5900939, -0.3456869, -1.901674, 0.3921569, 1, 0, 1,
-0.5877151, -1.263082, -2.800605, 0.3843137, 1, 0, 1,
-0.5864724, 0.9911342, -0.7680293, 0.3803922, 1, 0, 1,
-0.5858036, -0.7469705, -4.554931, 0.372549, 1, 0, 1,
-0.5850196, 1.060493, 0.5845108, 0.3686275, 1, 0, 1,
-0.5845087, -0.4638445, -0.7282175, 0.3607843, 1, 0, 1,
-0.582253, -0.3110281, 0.4087952, 0.3568628, 1, 0, 1,
-0.5776838, 1.605761, -0.7749736, 0.3490196, 1, 0, 1,
-0.5769454, -0.1369635, -4.426787, 0.345098, 1, 0, 1,
-0.5729136, -0.002183483, -0.01361517, 0.3372549, 1, 0, 1,
-0.5718871, 0.7553033, -0.1695805, 0.3333333, 1, 0, 1,
-0.5705501, 1.115069, -0.8894588, 0.3254902, 1, 0, 1,
-0.5695919, 0.670404, -1.46715, 0.3215686, 1, 0, 1,
-0.5681608, -0.5936561, -1.834376, 0.3137255, 1, 0, 1,
-0.5642918, -0.1356356, -2.508863, 0.3098039, 1, 0, 1,
-0.5614431, -0.1703822, -3.378774, 0.3019608, 1, 0, 1,
-0.5529105, -2.964912, -4.346901, 0.2941177, 1, 0, 1,
-0.5514916, 0.07273739, -1.579407, 0.2901961, 1, 0, 1,
-0.5513247, 0.5171717, 0.1495903, 0.282353, 1, 0, 1,
-0.5490731, -0.7646846, -1.462673, 0.2784314, 1, 0, 1,
-0.5490327, 0.5160977, -1.239604, 0.2705882, 1, 0, 1,
-0.5488499, -1.952696, -4.340462, 0.2666667, 1, 0, 1,
-0.5435366, 0.3742169, -1.515524, 0.2588235, 1, 0, 1,
-0.5407982, 0.08627851, -0.7902901, 0.254902, 1, 0, 1,
-0.5333975, 1.268517, -1.583096, 0.2470588, 1, 0, 1,
-0.5321383, -0.1613309, -1.011936, 0.2431373, 1, 0, 1,
-0.5274332, -0.2115355, -3.426829, 0.2352941, 1, 0, 1,
-0.5261235, 0.2184444, -0.1809775, 0.2313726, 1, 0, 1,
-0.5192482, 1.111502, -1.141903, 0.2235294, 1, 0, 1,
-0.5186781, -0.4509338, -2.141369, 0.2196078, 1, 0, 1,
-0.5177852, 0.5863929, -2.120953, 0.2117647, 1, 0, 1,
-0.5133755, -0.1308681, 0.09597399, 0.2078431, 1, 0, 1,
-0.5108462, 0.3040218, 0.4339096, 0.2, 1, 0, 1,
-0.506283, -0.3823837, -2.502865, 0.1921569, 1, 0, 1,
-0.5048547, -0.2275798, -2.045412, 0.1882353, 1, 0, 1,
-0.5032582, -0.04224909, -1.210028, 0.1803922, 1, 0, 1,
-0.4962875, 0.7768358, -1.854973, 0.1764706, 1, 0, 1,
-0.4936258, -2.088017, -3.294042, 0.1686275, 1, 0, 1,
-0.4902124, 0.6194906, -0.9513627, 0.1647059, 1, 0, 1,
-0.4890355, 1.649281, -0.5584903, 0.1568628, 1, 0, 1,
-0.4816133, 1.399041, 0.01022052, 0.1529412, 1, 0, 1,
-0.4769914, -0.7924852, -1.357649, 0.145098, 1, 0, 1,
-0.475411, -1.844861, -3.01784, 0.1411765, 1, 0, 1,
-0.4744181, 0.3233463, -2.704509, 0.1333333, 1, 0, 1,
-0.4739211, 0.4188507, -0.2961912, 0.1294118, 1, 0, 1,
-0.4727268, 0.1535547, -3.213241, 0.1215686, 1, 0, 1,
-0.4726746, 1.484597, 0.4939902, 0.1176471, 1, 0, 1,
-0.470882, -0.2979801, -2.248001, 0.1098039, 1, 0, 1,
-0.4686879, -1.230342, -3.855655, 0.1058824, 1, 0, 1,
-0.4676684, 0.135421, -2.0755, 0.09803922, 1, 0, 1,
-0.4645044, 1.171666, -2.182998, 0.09019608, 1, 0, 1,
-0.4636441, 2.409761, -1.315815, 0.08627451, 1, 0, 1,
-0.4552637, 0.03589911, -3.84703, 0.07843138, 1, 0, 1,
-0.4543762, -0.05763931, -2.213171, 0.07450981, 1, 0, 1,
-0.4538372, 0.69278, -0.8626847, 0.06666667, 1, 0, 1,
-0.451513, -0.7154148, -2.889142, 0.0627451, 1, 0, 1,
-0.450956, -0.3772272, -1.609399, 0.05490196, 1, 0, 1,
-0.4494716, -0.2115018, -1.124067, 0.05098039, 1, 0, 1,
-0.4463441, -1.935543, -3.124955, 0.04313726, 1, 0, 1,
-0.4433804, -0.06556443, -2.499959, 0.03921569, 1, 0, 1,
-0.4411906, 0.5810083, -2.286644, 0.03137255, 1, 0, 1,
-0.4393536, -0.144603, -0.8886048, 0.02745098, 1, 0, 1,
-0.4339219, -0.639043, -1.533979, 0.01960784, 1, 0, 1,
-0.430723, -0.4783899, -2.58977, 0.01568628, 1, 0, 1,
-0.4284783, 0.7450298, -1.803683, 0.007843138, 1, 0, 1,
-0.4264836, -1.336445, -0.8633692, 0.003921569, 1, 0, 1,
-0.4251029, 0.01143851, -3.000651, 0, 1, 0.003921569, 1,
-0.4187746, -0.0483866, -1.465025, 0, 1, 0.01176471, 1,
-0.4149286, 0.9897674, -1.008952, 0, 1, 0.01568628, 1,
-0.4117936, 0.2527934, -2.02566, 0, 1, 0.02352941, 1,
-0.4067309, -1.427092, -3.091579, 0, 1, 0.02745098, 1,
-0.4009429, 0.3573551, -0.2068205, 0, 1, 0.03529412, 1,
-0.3995793, -0.193716, 0.5235018, 0, 1, 0.03921569, 1,
-0.3981992, 0.1054658, -1.01941, 0, 1, 0.04705882, 1,
-0.3960675, -1.083419, -3.178642, 0, 1, 0.05098039, 1,
-0.3930647, 0.1644963, -1.678093, 0, 1, 0.05882353, 1,
-0.3916838, 1.03949, -0.8999217, 0, 1, 0.0627451, 1,
-0.3910985, -0.7262735, -4.118124, 0, 1, 0.07058824, 1,
-0.3909156, 1.341032, 1.436624, 0, 1, 0.07450981, 1,
-0.3861523, 1.073384, -0.1987952, 0, 1, 0.08235294, 1,
-0.3819377, -1.124501, -2.974441, 0, 1, 0.08627451, 1,
-0.3810214, 0.9975023, -1.821298, 0, 1, 0.09411765, 1,
-0.376951, -2.897538, -3.068474, 0, 1, 0.1019608, 1,
-0.3662437, 1.241201, -1.556616, 0, 1, 0.1058824, 1,
-0.3565902, -3.123972, -2.766629, 0, 1, 0.1137255, 1,
-0.3546664, 0.4868026, -0.8878016, 0, 1, 0.1176471, 1,
-0.3540328, -0.169266, -2.872757, 0, 1, 0.1254902, 1,
-0.3529444, 0.2530439, -0.03991706, 0, 1, 0.1294118, 1,
-0.3494295, 1.324128, 0.00852586, 0, 1, 0.1372549, 1,
-0.3474383, -0.5144035, -4.149916, 0, 1, 0.1411765, 1,
-0.3451592, -0.02785781, -2.324292, 0, 1, 0.1490196, 1,
-0.3372769, 0.9939369, 0.3059193, 0, 1, 0.1529412, 1,
-0.3362499, 0.2153544, 0.167393, 0, 1, 0.1607843, 1,
-0.3344173, 0.3845713, -0.155205, 0, 1, 0.1647059, 1,
-0.3315724, -0.1304179, -3.020127, 0, 1, 0.172549, 1,
-0.3271958, -0.01462051, -1.687583, 0, 1, 0.1764706, 1,
-0.3248172, -0.1777208, -2.621986, 0, 1, 0.1843137, 1,
-0.3229592, 2.101747, -0.2559181, 0, 1, 0.1882353, 1,
-0.3149493, 0.5732681, -0.4587107, 0, 1, 0.1960784, 1,
-0.3125968, -0.0978478, -1.575415, 0, 1, 0.2039216, 1,
-0.3056483, 0.5196282, 0.06508996, 0, 1, 0.2078431, 1,
-0.2987355, 0.3917338, -1.545323, 0, 1, 0.2156863, 1,
-0.2966621, 1.873963, -0.6546991, 0, 1, 0.2196078, 1,
-0.2941543, 1.052564, -1.692163, 0, 1, 0.227451, 1,
-0.2917569, -1.228217, -2.968102, 0, 1, 0.2313726, 1,
-0.2890133, -0.8679743, -2.124491, 0, 1, 0.2392157, 1,
-0.2860227, -0.9731364, -2.411255, 0, 1, 0.2431373, 1,
-0.2834446, 1.145399, 0.3331079, 0, 1, 0.2509804, 1,
-0.2828131, -1.619124, -3.308016, 0, 1, 0.254902, 1,
-0.276446, -0.6717293, -1.650365, 0, 1, 0.2627451, 1,
-0.2745952, -0.6014664, -2.757397, 0, 1, 0.2666667, 1,
-0.2742817, 0.4618132, 0.2672455, 0, 1, 0.2745098, 1,
-0.2596282, -1.013248, -3.255408, 0, 1, 0.2784314, 1,
-0.257917, 0.1523177, -2.427738, 0, 1, 0.2862745, 1,
-0.2571262, 0.07027972, -0.9721078, 0, 1, 0.2901961, 1,
-0.2543198, -0.7262411, -4.762226, 0, 1, 0.2980392, 1,
-0.2496091, 0.573742, 0.4797004, 0, 1, 0.3058824, 1,
-0.2476556, -0.7485379, -2.962332, 0, 1, 0.3098039, 1,
-0.2400086, -0.3655694, -4.217247, 0, 1, 0.3176471, 1,
-0.2364705, 0.2692674, -1.107914, 0, 1, 0.3215686, 1,
-0.2364294, 0.4156124, -1.847288, 0, 1, 0.3294118, 1,
-0.2346253, 0.406088, -0.6717013, 0, 1, 0.3333333, 1,
-0.2345843, -0.03820229, -2.079187, 0, 1, 0.3411765, 1,
-0.2318996, 0.4384392, -0.2316795, 0, 1, 0.345098, 1,
-0.2273664, -0.382719, -2.352809, 0, 1, 0.3529412, 1,
-0.2262458, -1.495577, -4.456257, 0, 1, 0.3568628, 1,
-0.2241055, 0.1127401, -1.382546, 0, 1, 0.3647059, 1,
-0.2233687, -0.9043118, -1.331613, 0, 1, 0.3686275, 1,
-0.220759, -0.363483, -3.458773, 0, 1, 0.3764706, 1,
-0.2203322, -0.9614065, -3.261023, 0, 1, 0.3803922, 1,
-0.2156067, -1.631756, -1.740966, 0, 1, 0.3882353, 1,
-0.2131434, -0.2082364, -1.07567, 0, 1, 0.3921569, 1,
-0.2125686, 0.3161671, -1.578477, 0, 1, 0.4, 1,
-0.206476, -0.22065, -1.868176, 0, 1, 0.4078431, 1,
-0.2016609, 1.750853, -0.3708939, 0, 1, 0.4117647, 1,
-0.1994091, -0.1775075, -1.13735, 0, 1, 0.4196078, 1,
-0.1982861, -0.1935478, -3.206228, 0, 1, 0.4235294, 1,
-0.1942208, 0.944636, -0.5056689, 0, 1, 0.4313726, 1,
-0.1879826, 0.03861187, -0.3588113, 0, 1, 0.4352941, 1,
-0.1845585, -0.04342645, -2.14373, 0, 1, 0.4431373, 1,
-0.1838378, -2.063096, -3.380256, 0, 1, 0.4470588, 1,
-0.1827498, 0.281105, 0.08744678, 0, 1, 0.454902, 1,
-0.181771, -0.9279348, -1.444482, 0, 1, 0.4588235, 1,
-0.1811332, 0.7256767, -0.5753462, 0, 1, 0.4666667, 1,
-0.176541, 0.9673698, 0.1477314, 0, 1, 0.4705882, 1,
-0.1763073, -0.5681197, -2.396929, 0, 1, 0.4784314, 1,
-0.1757941, 0.1124893, 0.6747691, 0, 1, 0.4823529, 1,
-0.1732482, 1.919678, -0.5722569, 0, 1, 0.4901961, 1,
-0.1724905, 0.3881867, 0.6493129, 0, 1, 0.4941176, 1,
-0.1697674, -0.6994486, -4.232752, 0, 1, 0.5019608, 1,
-0.1669617, -0.2364098, -1.730205, 0, 1, 0.509804, 1,
-0.1583003, -1.894251, -3.267483, 0, 1, 0.5137255, 1,
-0.1573454, 0.06512346, -2.464646, 0, 1, 0.5215687, 1,
-0.1505493, -1.984787, -4.2132, 0, 1, 0.5254902, 1,
-0.1497029, -0.8715189, -4.669803, 0, 1, 0.5333334, 1,
-0.1485626, -0.4421242, -3.931198, 0, 1, 0.5372549, 1,
-0.1464513, 0.0964789, -1.642624, 0, 1, 0.5450981, 1,
-0.1453486, 0.3219719, 0.173509, 0, 1, 0.5490196, 1,
-0.1427722, -1.064437, -4.365246, 0, 1, 0.5568628, 1,
-0.1417957, 1.253886, -0.3316426, 0, 1, 0.5607843, 1,
-0.14041, 0.4327385, 0.1040758, 0, 1, 0.5686275, 1,
-0.1388795, -0.9444019, -4.015713, 0, 1, 0.572549, 1,
-0.1380902, -2.762665, -1.425994, 0, 1, 0.5803922, 1,
-0.1331661, -0.6892103, -3.007484, 0, 1, 0.5843138, 1,
-0.1328104, -1.242296, -2.764096, 0, 1, 0.5921569, 1,
-0.13274, -1.305453, -3.170057, 0, 1, 0.5960785, 1,
-0.131193, -0.8443855, -3.388253, 0, 1, 0.6039216, 1,
-0.1291817, 1.057615, -0.1365541, 0, 1, 0.6117647, 1,
-0.1283238, 1.186549, -1.312534, 0, 1, 0.6156863, 1,
-0.1234137, -0.6770799, -2.728675, 0, 1, 0.6235294, 1,
-0.1233997, 0.6333719, 1.18763, 0, 1, 0.627451, 1,
-0.118219, 0.1210958, -0.367416, 0, 1, 0.6352941, 1,
-0.115673, -0.009265414, -1.658512, 0, 1, 0.6392157, 1,
-0.1095395, -1.550165, -4.381466, 0, 1, 0.6470588, 1,
-0.1094889, 0.03888443, -1.457833, 0, 1, 0.6509804, 1,
-0.1093534, 0.1647747, -3.125757, 0, 1, 0.6588235, 1,
-0.100769, -1.159779, -2.646587, 0, 1, 0.6627451, 1,
-0.1006842, -0.9173746, -2.304211, 0, 1, 0.6705883, 1,
-0.09538547, -0.5313157, -3.518533, 0, 1, 0.6745098, 1,
-0.09517898, -1.443454, -4.532078, 0, 1, 0.682353, 1,
-0.09361091, -0.8625155, -3.013754, 0, 1, 0.6862745, 1,
-0.09327947, -0.3052497, -2.294316, 0, 1, 0.6941177, 1,
-0.0916567, 0.0774191, 0.7450122, 0, 1, 0.7019608, 1,
-0.08596966, 1.47765, -1.255633, 0, 1, 0.7058824, 1,
-0.08495936, -1.244227, -2.912858, 0, 1, 0.7137255, 1,
-0.08343352, -0.9245983, -4.246388, 0, 1, 0.7176471, 1,
-0.08255462, -1.791289, -3.492545, 0, 1, 0.7254902, 1,
-0.08208618, 1.587299, -1.54772, 0, 1, 0.7294118, 1,
-0.08074364, 0.08251433, 1.519299, 0, 1, 0.7372549, 1,
-0.0794177, -0.8928224, -0.4224293, 0, 1, 0.7411765, 1,
-0.07883732, -0.1651041, -2.584123, 0, 1, 0.7490196, 1,
-0.07688629, -1.095143, -3.422189, 0, 1, 0.7529412, 1,
-0.07266261, -1.003594, -3.401431, 0, 1, 0.7607843, 1,
-0.06811919, 2.435074, 1.296669, 0, 1, 0.7647059, 1,
-0.06450856, -1.725417, -2.239456, 0, 1, 0.772549, 1,
-0.06423936, -1.508323, -3.822314, 0, 1, 0.7764706, 1,
-0.06147214, -0.3344634, -3.814977, 0, 1, 0.7843137, 1,
-0.0595501, 0.8004701, 1.21809, 0, 1, 0.7882353, 1,
-0.05766195, 1.9704, 0.04639041, 0, 1, 0.7960784, 1,
-0.05542, -0.6386515, -1.141042, 0, 1, 0.8039216, 1,
-0.05456679, 2.994978, -0.1140144, 0, 1, 0.8078431, 1,
-0.05229556, -0.3902681, -0.7132494, 0, 1, 0.8156863, 1,
-0.05174772, -0.0127026, -0.8257896, 0, 1, 0.8196079, 1,
-0.04731668, -0.9198822, -3.011876, 0, 1, 0.827451, 1,
-0.0471033, 0.009404085, -1.375653, 0, 1, 0.8313726, 1,
-0.04543237, 0.3253338, 1.751097, 0, 1, 0.8392157, 1,
-0.04471582, -0.2189296, -2.089396, 0, 1, 0.8431373, 1,
-0.03958108, -0.1705697, -2.647747, 0, 1, 0.8509804, 1,
-0.03953461, 1.073035, 1.568491, 0, 1, 0.854902, 1,
-0.03013902, -0.8381526, -2.164889, 0, 1, 0.8627451, 1,
-0.02496725, -0.381987, -3.902036, 0, 1, 0.8666667, 1,
-0.02369064, 1.196905, 1.124128, 0, 1, 0.8745098, 1,
-0.02065777, -1.67733, -1.488795, 0, 1, 0.8784314, 1,
-0.0173768, -1.347885, -1.638856, 0, 1, 0.8862745, 1,
-0.01316787, 0.6975359, 0.6806803, 0, 1, 0.8901961, 1,
-0.01168077, 1.700902, -0.2414586, 0, 1, 0.8980392, 1,
-0.01058842, 0.07707674, 0.6450412, 0, 1, 0.9058824, 1,
-0.01040975, -0.5047787, -4.777468, 0, 1, 0.9098039, 1,
-0.00933629, 0.01420053, -0.154079, 0, 1, 0.9176471, 1,
-0.005355447, -0.8119019, -1.174806, 0, 1, 0.9215686, 1,
-0.0007449099, -1.28133, -3.760956, 0, 1, 0.9294118, 1,
0.001392518, -0.3794195, 5.17049, 0, 1, 0.9333333, 1,
0.001518099, 0.2338943, 0.1405238, 0, 1, 0.9411765, 1,
0.002395181, -0.8231341, 3.511009, 0, 1, 0.945098, 1,
0.003069018, -0.2806939, 3.365834, 0, 1, 0.9529412, 1,
0.006868419, -1.446418, 4.598897, 0, 1, 0.9568627, 1,
0.007041728, 0.0448091, 1.449761, 0, 1, 0.9647059, 1,
0.008911864, 1.225341, -0.3352951, 0, 1, 0.9686275, 1,
0.009139521, -0.522293, 1.182798, 0, 1, 0.9764706, 1,
0.009646716, -0.4709066, 2.323491, 0, 1, 0.9803922, 1,
0.009841328, 1.451893, 0.4844143, 0, 1, 0.9882353, 1,
0.01075244, -0.8585261, 3.293154, 0, 1, 0.9921569, 1,
0.0111202, 0.4478151, -0.07699995, 0, 1, 1, 1,
0.01152579, 0.4206157, -0.7465428, 0, 0.9921569, 1, 1,
0.0141311, 0.9731619, -0.8769231, 0, 0.9882353, 1, 1,
0.01488482, -1.027748, 4.645977, 0, 0.9803922, 1, 1,
0.01506528, 0.6607707, -0.1290019, 0, 0.9764706, 1, 1,
0.01851936, 1.192681, 0.4829756, 0, 0.9686275, 1, 1,
0.01935599, -2.978496, 3.575659, 0, 0.9647059, 1, 1,
0.02043214, -0.5274454, 2.975503, 0, 0.9568627, 1, 1,
0.02299813, 0.7788665, 1.328088, 0, 0.9529412, 1, 1,
0.02507741, 0.1662261, -0.4825529, 0, 0.945098, 1, 1,
0.02789601, -0.7563004, 2.994465, 0, 0.9411765, 1, 1,
0.028057, 1.556784, 0.3959426, 0, 0.9333333, 1, 1,
0.03087482, -0.8363235, 3.412964, 0, 0.9294118, 1, 1,
0.03194232, -0.8840203, 4.678618, 0, 0.9215686, 1, 1,
0.03833615, 0.2836567, -1.256816, 0, 0.9176471, 1, 1,
0.04185757, -0.004269596, 1.208659, 0, 0.9098039, 1, 1,
0.04199395, 0.5300136, 0.2823896, 0, 0.9058824, 1, 1,
0.0461692, 0.9951257, -0.1035678, 0, 0.8980392, 1, 1,
0.04865171, -0.8838039, 3.77467, 0, 0.8901961, 1, 1,
0.05296822, 1.695121, -0.4721072, 0, 0.8862745, 1, 1,
0.05337873, -0.9019216, 2.447652, 0, 0.8784314, 1, 1,
0.0536651, 0.3951642, 0.3965235, 0, 0.8745098, 1, 1,
0.05855968, -0.2566488, 3.000945, 0, 0.8666667, 1, 1,
0.06007465, -1.302124, 3.112607, 0, 0.8627451, 1, 1,
0.06259772, 1.911108, 0.1682215, 0, 0.854902, 1, 1,
0.06677457, 0.4550833, 1.347712, 0, 0.8509804, 1, 1,
0.06755061, -0.6517906, 4.630874, 0, 0.8431373, 1, 1,
0.06759092, 1.089908, -0.04630731, 0, 0.8392157, 1, 1,
0.07308146, 0.1743986, -0.846148, 0, 0.8313726, 1, 1,
0.07548855, 1.168498, -1.268824, 0, 0.827451, 1, 1,
0.0829395, 0.8334643, 1.363574, 0, 0.8196079, 1, 1,
0.08700223, 0.1234767, 1.053747, 0, 0.8156863, 1, 1,
0.08730882, -0.357325, 1.947286, 0, 0.8078431, 1, 1,
0.09056092, 2.282643, -0.5557532, 0, 0.8039216, 1, 1,
0.09658557, -2.29543, 3.214123, 0, 0.7960784, 1, 1,
0.09852838, 0.2483052, 1.854981, 0, 0.7882353, 1, 1,
0.1043955, 1.910849, 0.3458848, 0, 0.7843137, 1, 1,
0.118394, -0.4408417, 3.362416, 0, 0.7764706, 1, 1,
0.1224409, -0.3112109, 3.599921, 0, 0.772549, 1, 1,
0.1224997, -0.7681985, 2.948209, 0, 0.7647059, 1, 1,
0.1265631, 0.8164824, 0.3566156, 0, 0.7607843, 1, 1,
0.1266796, -0.5604005, 3.454329, 0, 0.7529412, 1, 1,
0.1272456, 0.03209779, 0.9585121, 0, 0.7490196, 1, 1,
0.1297661, -0.9506757, 2.8175, 0, 0.7411765, 1, 1,
0.1306249, 0.2734649, -1.2104, 0, 0.7372549, 1, 1,
0.1329111, 1.094513, 0.5393168, 0, 0.7294118, 1, 1,
0.1421343, 0.06023753, 0.8935034, 0, 0.7254902, 1, 1,
0.1449693, -0.3058982, 1.759926, 0, 0.7176471, 1, 1,
0.145453, 0.5921412, 2.338972, 0, 0.7137255, 1, 1,
0.1459307, 0.1912021, 0.5324807, 0, 0.7058824, 1, 1,
0.1532805, 0.0003105364, 1.352469, 0, 0.6980392, 1, 1,
0.1532866, 0.4498796, 1.267818, 0, 0.6941177, 1, 1,
0.1539113, -0.1317909, 1.530903, 0, 0.6862745, 1, 1,
0.1563012, 0.8021272, -1.878761, 0, 0.682353, 1, 1,
0.1566478, -0.02227348, 1.27517, 0, 0.6745098, 1, 1,
0.15695, 0.4268969, 0.4462888, 0, 0.6705883, 1, 1,
0.1627715, 1.375211, 0.4695918, 0, 0.6627451, 1, 1,
0.1634664, -0.9530063, 4.118804, 0, 0.6588235, 1, 1,
0.1641756, 1.794388, 1.064487, 0, 0.6509804, 1, 1,
0.1643064, -0.299386, 2.695946, 0, 0.6470588, 1, 1,
0.1684426, 1.107735, -0.01935355, 0, 0.6392157, 1, 1,
0.1698517, -1.595216, 1.588045, 0, 0.6352941, 1, 1,
0.1707173, 0.1972805, 0.1136845, 0, 0.627451, 1, 1,
0.1712245, 1.368459, -0.04851878, 0, 0.6235294, 1, 1,
0.1799245, 0.668695, 0.7569932, 0, 0.6156863, 1, 1,
0.1893931, -0.6006303, 4.80495, 0, 0.6117647, 1, 1,
0.1913355, -0.009162197, 1.119982, 0, 0.6039216, 1, 1,
0.1937173, 0.1288992, 0.1978864, 0, 0.5960785, 1, 1,
0.197654, -0.6180903, 2.973835, 0, 0.5921569, 1, 1,
0.1978455, 0.4907184, -0.7819789, 0, 0.5843138, 1, 1,
0.198091, 0.5178247, 1.371645, 0, 0.5803922, 1, 1,
0.1987853, 2.258703, -1.613937, 0, 0.572549, 1, 1,
0.2001473, 0.6366668, 0.06248238, 0, 0.5686275, 1, 1,
0.2016982, -2.066297, 2.61547, 0, 0.5607843, 1, 1,
0.202371, -1.137964, 1.324759, 0, 0.5568628, 1, 1,
0.2033858, 0.4722984, 1.18516, 0, 0.5490196, 1, 1,
0.2087236, 2.595174, 0.2922494, 0, 0.5450981, 1, 1,
0.2087258, -0.8578821, 3.261883, 0, 0.5372549, 1, 1,
0.2116447, -0.8197824, 1.133991, 0, 0.5333334, 1, 1,
0.2138084, 0.8596088, -0.6319306, 0, 0.5254902, 1, 1,
0.2138292, 1.351443, 0.2155976, 0, 0.5215687, 1, 1,
0.216521, -0.7955376, 3.042898, 0, 0.5137255, 1, 1,
0.2166474, -0.7150033, 2.369638, 0, 0.509804, 1, 1,
0.2228261, -1.184183, 4.31313, 0, 0.5019608, 1, 1,
0.2322769, -0.1984469, 3.713137, 0, 0.4941176, 1, 1,
0.2336351, 1.448414, 1.278257, 0, 0.4901961, 1, 1,
0.2362415, -0.5414429, 2.598455, 0, 0.4823529, 1, 1,
0.2489007, 1.241493, 1.271471, 0, 0.4784314, 1, 1,
0.2513093, -0.7048237, 2.09236, 0, 0.4705882, 1, 1,
0.2517084, 0.2832605, -0.09193091, 0, 0.4666667, 1, 1,
0.2561274, 0.6228867, -0.3604876, 0, 0.4588235, 1, 1,
0.2595796, -1.423385, 3.654488, 0, 0.454902, 1, 1,
0.2635602, 2.028007, -1.58207, 0, 0.4470588, 1, 1,
0.2638971, -0.001112671, 1.221908, 0, 0.4431373, 1, 1,
0.2661831, 0.1212307, 0.7980769, 0, 0.4352941, 1, 1,
0.2662006, 0.0866859, 3.001413, 0, 0.4313726, 1, 1,
0.2772811, 0.6045654, 0.4963663, 0, 0.4235294, 1, 1,
0.2773714, 1.186311, -0.6772603, 0, 0.4196078, 1, 1,
0.2794462, -0.2395824, 0.7976118, 0, 0.4117647, 1, 1,
0.2815845, -1.62121, 2.434056, 0, 0.4078431, 1, 1,
0.285118, -0.9875478, 4.218521, 0, 0.4, 1, 1,
0.2880355, -0.9205838, 2.84921, 0, 0.3921569, 1, 1,
0.288134, 0.5300734, 1.703962, 0, 0.3882353, 1, 1,
0.2925647, -1.907655, 2.277019, 0, 0.3803922, 1, 1,
0.292853, 1.672649, 0.6357319, 0, 0.3764706, 1, 1,
0.2943796, -0.1649697, 3.611339, 0, 0.3686275, 1, 1,
0.2949346, -0.2118998, 2.169214, 0, 0.3647059, 1, 1,
0.295422, 0.3778364, 1.969036, 0, 0.3568628, 1, 1,
0.2963195, -1.54167, 3.421579, 0, 0.3529412, 1, 1,
0.3019264, -0.2526783, 2.171266, 0, 0.345098, 1, 1,
0.3104201, 0.3502743, 0.6406547, 0, 0.3411765, 1, 1,
0.3114619, -1.540213, 3.432784, 0, 0.3333333, 1, 1,
0.3136708, 0.914966, 0.2859272, 0, 0.3294118, 1, 1,
0.3163888, -0.41815, 1.583612, 0, 0.3215686, 1, 1,
0.3186584, -0.2535736, 0.4700629, 0, 0.3176471, 1, 1,
0.3257842, -0.9549865, 0.8955526, 0, 0.3098039, 1, 1,
0.3352326, -0.566486, 3.650632, 0, 0.3058824, 1, 1,
0.3367092, 2.063463, -0.5517471, 0, 0.2980392, 1, 1,
0.3401854, 0.1310429, 1.190926, 0, 0.2901961, 1, 1,
0.3454465, -1.414593, 2.690387, 0, 0.2862745, 1, 1,
0.3466052, 0.1234396, 0.1823537, 0, 0.2784314, 1, 1,
0.3497257, -0.5404948, 0.91219, 0, 0.2745098, 1, 1,
0.3531828, -0.04759341, 0.9810932, 0, 0.2666667, 1, 1,
0.3543412, -0.2191878, 2.277987, 0, 0.2627451, 1, 1,
0.3553779, -0.7475722, 2.425032, 0, 0.254902, 1, 1,
0.3575287, -1.276637, 3.588068, 0, 0.2509804, 1, 1,
0.3590309, -0.7875138, 1.109166, 0, 0.2431373, 1, 1,
0.3595865, -1.474961, 4.653183, 0, 0.2392157, 1, 1,
0.3627975, -0.5992125, 1.906924, 0, 0.2313726, 1, 1,
0.3655423, -1.554283, 2.90077, 0, 0.227451, 1, 1,
0.3671063, -0.2796361, 1.378908, 0, 0.2196078, 1, 1,
0.3703621, 1.119318, -0.2903808, 0, 0.2156863, 1, 1,
0.3711374, -0.7292831, 2.449708, 0, 0.2078431, 1, 1,
0.3719011, 2.413169, 0.9390925, 0, 0.2039216, 1, 1,
0.3719362, -0.3377956, 1.233961, 0, 0.1960784, 1, 1,
0.372803, -0.252827, 2.342852, 0, 0.1882353, 1, 1,
0.3752879, 0.3576728, 1.801423, 0, 0.1843137, 1, 1,
0.3803781, 1.467329, 1.141601, 0, 0.1764706, 1, 1,
0.3818138, -0.7818066, 2.819995, 0, 0.172549, 1, 1,
0.3823573, -2.277319, 4.116824, 0, 0.1647059, 1, 1,
0.3827934, 0.2820315, 2.181775, 0, 0.1607843, 1, 1,
0.3831432, 0.5653872, 1.190355, 0, 0.1529412, 1, 1,
0.3839479, 0.414901, 0.3181501, 0, 0.1490196, 1, 1,
0.3888575, 0.8561482, 1.085974, 0, 0.1411765, 1, 1,
0.3901824, 1.373062, 0.06880847, 0, 0.1372549, 1, 1,
0.3929659, 1.097057, 2.935415, 0, 0.1294118, 1, 1,
0.3931764, -0.2727579, 0.9923232, 0, 0.1254902, 1, 1,
0.3952259, -1.571214, 1.719821, 0, 0.1176471, 1, 1,
0.3963084, 0.5590528, 2.178467, 0, 0.1137255, 1, 1,
0.4019046, -0.9719118, 5.219145, 0, 0.1058824, 1, 1,
0.4021088, -0.03191769, 2.823728, 0, 0.09803922, 1, 1,
0.4050305, -0.1850152, 2.917843, 0, 0.09411765, 1, 1,
0.4084007, 0.674095, -0.1162758, 0, 0.08627451, 1, 1,
0.4101963, -1.13367, 1.779454, 0, 0.08235294, 1, 1,
0.411193, -1.752256, 2.125524, 0, 0.07450981, 1, 1,
0.4150016, -0.1720333, 1.28689, 0, 0.07058824, 1, 1,
0.4158476, 0.460196, 0.6992415, 0, 0.0627451, 1, 1,
0.4197663, 2.132081, -0.8746637, 0, 0.05882353, 1, 1,
0.4230678, -2.327002, 3.93703, 0, 0.05098039, 1, 1,
0.4259961, 1.78606, 1.221835, 0, 0.04705882, 1, 1,
0.4267136, 0.04346675, 3.232373, 0, 0.03921569, 1, 1,
0.435601, 1.192113, -0.07590486, 0, 0.03529412, 1, 1,
0.4410655, 0.3554398, -0.8868583, 0, 0.02745098, 1, 1,
0.4431722, 0.8040578, 0.4707565, 0, 0.02352941, 1, 1,
0.4474877, 0.1892178, -0.4417934, 0, 0.01568628, 1, 1,
0.4487376, 2.057139, 0.9431999, 0, 0.01176471, 1, 1,
0.4491856, 0.7477789, -0.5667187, 0, 0.003921569, 1, 1,
0.4512788, -1.090489, 3.702769, 0.003921569, 0, 1, 1,
0.4551001, -0.66245, 3.865493, 0.007843138, 0, 1, 1,
0.4604533, 0.08062402, 1.071535, 0.01568628, 0, 1, 1,
0.4637521, 0.9167459, -0.6566641, 0.01960784, 0, 1, 1,
0.4637705, 2.631735, 0.45182, 0.02745098, 0, 1, 1,
0.4728099, 2.676579, -1.149071, 0.03137255, 0, 1, 1,
0.4732133, -0.3907613, 1.914557, 0.03921569, 0, 1, 1,
0.4733405, -0.06079001, -0.222178, 0.04313726, 0, 1, 1,
0.4752382, -0.6502538, 2.957956, 0.05098039, 0, 1, 1,
0.4759075, 0.575651, 1.638461, 0.05490196, 0, 1, 1,
0.488822, -0.3541554, 2.233538, 0.0627451, 0, 1, 1,
0.4928672, 0.07965095, 1.245549, 0.06666667, 0, 1, 1,
0.4954799, 0.02937451, 1.018773, 0.07450981, 0, 1, 1,
0.4997509, 0.4373842, 0.1096517, 0.07843138, 0, 1, 1,
0.5006785, -0.427862, 1.581944, 0.08627451, 0, 1, 1,
0.501516, -2.257922, 2.0396, 0.09019608, 0, 1, 1,
0.5113964, -0.5384164, 1.867782, 0.09803922, 0, 1, 1,
0.5120678, -0.09664459, 0.5061328, 0.1058824, 0, 1, 1,
0.5216254, -1.303356, 2.075178, 0.1098039, 0, 1, 1,
0.5217459, 1.231972, 1.616114, 0.1176471, 0, 1, 1,
0.5220056, -1.184195, 3.559384, 0.1215686, 0, 1, 1,
0.5222551, -0.9159202, 3.365128, 0.1294118, 0, 1, 1,
0.5227373, -0.5716868, 1.999989, 0.1333333, 0, 1, 1,
0.5233651, 0.1231363, 2.244369, 0.1411765, 0, 1, 1,
0.5280471, 1.366561, 0.9141635, 0.145098, 0, 1, 1,
0.5284668, 0.6623787, 0.6499003, 0.1529412, 0, 1, 1,
0.5317923, 1.561024, 0.04661445, 0.1568628, 0, 1, 1,
0.5359999, -0.4545847, 2.735546, 0.1647059, 0, 1, 1,
0.541996, 0.4247493, -0.3513684, 0.1686275, 0, 1, 1,
0.5445695, -1.974038, 4.28955, 0.1764706, 0, 1, 1,
0.5465217, 1.048699, 1.228569, 0.1803922, 0, 1, 1,
0.5474092, 1.238146, 0.01109793, 0.1882353, 0, 1, 1,
0.5498801, 1.909736, 0.6923593, 0.1921569, 0, 1, 1,
0.5503177, -0.3024615, 0.3879803, 0.2, 0, 1, 1,
0.5521574, 0.6444046, -0.5921553, 0.2078431, 0, 1, 1,
0.5549758, -0.01387152, 2.424826, 0.2117647, 0, 1, 1,
0.556197, -0.8546908, 3.363055, 0.2196078, 0, 1, 1,
0.5567439, 0.3653578, 2.246099, 0.2235294, 0, 1, 1,
0.5568335, -1.053401, 3.674795, 0.2313726, 0, 1, 1,
0.5610977, -0.09541643, 2.281194, 0.2352941, 0, 1, 1,
0.5640418, 1.477923, 0.1834091, 0.2431373, 0, 1, 1,
0.5687647, 0.3212725, 1.328167, 0.2470588, 0, 1, 1,
0.5714064, -2.175084, 2.83066, 0.254902, 0, 1, 1,
0.5775706, -0.0009756098, 0.8484493, 0.2588235, 0, 1, 1,
0.581536, -1.372627, 2.625118, 0.2666667, 0, 1, 1,
0.5827648, -1.226848, 1.76881, 0.2705882, 0, 1, 1,
0.5838631, 1.294898, -0.1763307, 0.2784314, 0, 1, 1,
0.5914543, 0.06189115, 1.09331, 0.282353, 0, 1, 1,
0.5931596, -0.5985593, 2.568112, 0.2901961, 0, 1, 1,
0.5960333, 0.334418, 0.2742645, 0.2941177, 0, 1, 1,
0.6072707, -1.099356, 2.175049, 0.3019608, 0, 1, 1,
0.6126733, -0.1004696, 1.556984, 0.3098039, 0, 1, 1,
0.613153, -0.7630017, 4.642521, 0.3137255, 0, 1, 1,
0.6147205, 0.815576, 1.147133, 0.3215686, 0, 1, 1,
0.6173023, -2.333504, 3.375743, 0.3254902, 0, 1, 1,
0.6187184, 0.3390132, 0.05689086, 0.3333333, 0, 1, 1,
0.6195853, 0.07787386, 0.6706149, 0.3372549, 0, 1, 1,
0.6198077, -0.8535566, 3.004388, 0.345098, 0, 1, 1,
0.6207716, -1.301797, 4.218446, 0.3490196, 0, 1, 1,
0.6313879, 1.416433, 0.9751475, 0.3568628, 0, 1, 1,
0.6316196, 0.8441069, 2.259222, 0.3607843, 0, 1, 1,
0.6317685, -1.056164, 1.082796, 0.3686275, 0, 1, 1,
0.6379095, 0.5963086, 0.1972545, 0.372549, 0, 1, 1,
0.6396633, -0.2342017, 3.338588, 0.3803922, 0, 1, 1,
0.6402465, -1.455627, 4.657382, 0.3843137, 0, 1, 1,
0.6416056, 1.397835, -0.4740615, 0.3921569, 0, 1, 1,
0.6436115, 1.012547, 1.225684, 0.3960784, 0, 1, 1,
0.6442518, 0.1259142, 2.021248, 0.4039216, 0, 1, 1,
0.6548352, 1.257069, -0.4597729, 0.4117647, 0, 1, 1,
0.6564592, 0.250821, 2.571079, 0.4156863, 0, 1, 1,
0.6616216, 0.7982628, 1.823615, 0.4235294, 0, 1, 1,
0.6638219, 0.2930467, -0.1058374, 0.427451, 0, 1, 1,
0.6676695, 0.9213826, 2.138066, 0.4352941, 0, 1, 1,
0.6745505, 0.3067455, 1.530185, 0.4392157, 0, 1, 1,
0.6850779, -3.319978, 2.586703, 0.4470588, 0, 1, 1,
0.6873828, -0.03479225, 0.3044951, 0.4509804, 0, 1, 1,
0.6878622, -1.123914, 2.900058, 0.4588235, 0, 1, 1,
0.6881443, 0.388365, 1.649742, 0.4627451, 0, 1, 1,
0.6929272, 1.35109, 1.041723, 0.4705882, 0, 1, 1,
0.6931822, -0.62454, 3.121524, 0.4745098, 0, 1, 1,
0.6948564, 1.384, 0.04018696, 0.4823529, 0, 1, 1,
0.6998891, -0.8223251, 3.001547, 0.4862745, 0, 1, 1,
0.7026337, 1.337703, 1.207511, 0.4941176, 0, 1, 1,
0.7094964, -0.4181597, 1.699444, 0.5019608, 0, 1, 1,
0.7159059, 1.014574, 1.809332, 0.5058824, 0, 1, 1,
0.7270126, -2.171808, 3.736011, 0.5137255, 0, 1, 1,
0.7307654, 1.594833, 0.4520505, 0.5176471, 0, 1, 1,
0.7311336, 1.556421, -0.5738209, 0.5254902, 0, 1, 1,
0.7363126, -1.419349, 2.804017, 0.5294118, 0, 1, 1,
0.7365234, -0.8897672, 2.410993, 0.5372549, 0, 1, 1,
0.7376154, 0.1630671, 1.545614, 0.5411765, 0, 1, 1,
0.7434983, -0.8897478, 2.622485, 0.5490196, 0, 1, 1,
0.7445562, -0.692997, 1.849643, 0.5529412, 0, 1, 1,
0.7524636, -2.087785, 1.265994, 0.5607843, 0, 1, 1,
0.7528777, -1.178807, 1.85986, 0.5647059, 0, 1, 1,
0.7571175, 1.25112, 1.559405, 0.572549, 0, 1, 1,
0.7592564, -0.5176917, 1.571672, 0.5764706, 0, 1, 1,
0.7596458, -0.6827303, 2.781188, 0.5843138, 0, 1, 1,
0.7634881, 0.1421468, 1.300398, 0.5882353, 0, 1, 1,
0.7707613, 1.292643, -1.428588, 0.5960785, 0, 1, 1,
0.7746898, -0.8215889, 2.698483, 0.6039216, 0, 1, 1,
0.7784077, 0.250645, 2.080048, 0.6078432, 0, 1, 1,
0.7873578, 1.821982, -1.027472, 0.6156863, 0, 1, 1,
0.7937045, 1.087391, -0.3172474, 0.6196079, 0, 1, 1,
0.7950001, -0.5765676, 2.622728, 0.627451, 0, 1, 1,
0.8051653, 0.7768716, 0.3941644, 0.6313726, 0, 1, 1,
0.8122047, 0.03228353, 1.188836, 0.6392157, 0, 1, 1,
0.8183778, 1.353495, -0.94586, 0.6431373, 0, 1, 1,
0.8261541, 1.386438, 0.09666292, 0.6509804, 0, 1, 1,
0.8288421, -0.03730131, 2.764571, 0.654902, 0, 1, 1,
0.8316156, 0.7343847, 0.7133872, 0.6627451, 0, 1, 1,
0.8325585, -1.36577, 2.115524, 0.6666667, 0, 1, 1,
0.832925, -1.12089, 2.281574, 0.6745098, 0, 1, 1,
0.8345724, 0.4504759, 1.189853, 0.6784314, 0, 1, 1,
0.8383093, -0.4867804, 1.873055, 0.6862745, 0, 1, 1,
0.8389971, 1.386959, -1.740887, 0.6901961, 0, 1, 1,
0.8400921, 0.3511221, 1.536807, 0.6980392, 0, 1, 1,
0.8440202, -0.3691052, 1.500805, 0.7058824, 0, 1, 1,
0.844224, 0.1917178, 1.1353, 0.7098039, 0, 1, 1,
0.8450733, -0.02244602, -0.2522282, 0.7176471, 0, 1, 1,
0.8480842, 0.4407876, 0.8517495, 0.7215686, 0, 1, 1,
0.850278, -0.6886876, 0.6020213, 0.7294118, 0, 1, 1,
0.8519966, -1.240379, 1.174817, 0.7333333, 0, 1, 1,
0.8543301, 1.071971, 1.134647, 0.7411765, 0, 1, 1,
0.8558905, -0.5791728, -0.03812868, 0.7450981, 0, 1, 1,
0.8651404, 1.413936, -1.236548, 0.7529412, 0, 1, 1,
0.880227, 0.6314304, 0.6588106, 0.7568628, 0, 1, 1,
0.8893775, -0.2905498, 0.5843429, 0.7647059, 0, 1, 1,
0.8980826, -1.644283, 2.293098, 0.7686275, 0, 1, 1,
0.9023985, 0.06457241, 2.086495, 0.7764706, 0, 1, 1,
0.9045619, -0.08088703, 2.194664, 0.7803922, 0, 1, 1,
0.9064261, 0.34155, 0.6016236, 0.7882353, 0, 1, 1,
0.9069946, 0.3622793, -0.01021651, 0.7921569, 0, 1, 1,
0.9087645, 0.2411636, 1.604057, 0.8, 0, 1, 1,
0.9147215, -0.1407452, 2.731469, 0.8078431, 0, 1, 1,
0.9164665, -0.7225475, 2.729576, 0.8117647, 0, 1, 1,
0.9179465, 1.201495, 1.136799, 0.8196079, 0, 1, 1,
0.9188253, 0.1158151, 1.753611, 0.8235294, 0, 1, 1,
0.920921, 0.2423254, 3.942674, 0.8313726, 0, 1, 1,
0.9221146, -0.2625453, 1.995817, 0.8352941, 0, 1, 1,
0.9269431, 0.357873, 1.731139, 0.8431373, 0, 1, 1,
0.9357868, 0.2581595, 2.041608, 0.8470588, 0, 1, 1,
0.9358554, 0.1962332, 2.17229, 0.854902, 0, 1, 1,
0.9461269, 0.04775667, 0.4236968, 0.8588235, 0, 1, 1,
0.9533188, -1.053445, 3.9937, 0.8666667, 0, 1, 1,
0.9555127, -0.2991667, 2.719242, 0.8705882, 0, 1, 1,
0.9562498, -0.6997333, 1.977733, 0.8784314, 0, 1, 1,
0.9608436, 0.3305839, 1.624683, 0.8823529, 0, 1, 1,
0.9612424, 0.7684293, 1.805572, 0.8901961, 0, 1, 1,
0.9655591, 0.6449814, -0.05589029, 0.8941177, 0, 1, 1,
0.9659694, 0.3747395, 1.100258, 0.9019608, 0, 1, 1,
0.9713982, -0.5640364, 2.693287, 0.9098039, 0, 1, 1,
0.9779552, -2.135493, 2.659745, 0.9137255, 0, 1, 1,
0.9791099, -2.28217, 1.487816, 0.9215686, 0, 1, 1,
0.9822413, 0.1713858, 1.89326, 0.9254902, 0, 1, 1,
0.9854025, -0.009561638, 0.633531, 0.9333333, 0, 1, 1,
0.9872527, 0.6666076, 1.075778, 0.9372549, 0, 1, 1,
0.9874586, -0.9244173, 3.41778, 0.945098, 0, 1, 1,
0.9895273, -0.009026065, 2.655412, 0.9490196, 0, 1, 1,
0.9897775, 0.830108, -1.168452, 0.9568627, 0, 1, 1,
1.001625, 0.4576924, 2.830466, 0.9607843, 0, 1, 1,
1.007862, 0.4073397, 0.5471408, 0.9686275, 0, 1, 1,
1.009194, 0.7539313, 2.627954, 0.972549, 0, 1, 1,
1.009532, 1.709909, 0.4427339, 0.9803922, 0, 1, 1,
1.012033, 0.5868074, -0.2593829, 0.9843137, 0, 1, 1,
1.018572, 0.03403892, 0.5765384, 0.9921569, 0, 1, 1,
1.021781, 1.535874, 0.0924489, 0.9960784, 0, 1, 1,
1.026382, -0.8167377, 2.242459, 1, 0, 0.9960784, 1,
1.026851, -1.138263, 4.011351, 1, 0, 0.9882353, 1,
1.033323, -2.038748, 4.10557, 1, 0, 0.9843137, 1,
1.034025, -0.7884328, 4.690487, 1, 0, 0.9764706, 1,
1.039814, 0.2160677, 1.11012, 1, 0, 0.972549, 1,
1.042706, 2.405655, 1.053073, 1, 0, 0.9647059, 1,
1.048208, -0.593402, 2.882102, 1, 0, 0.9607843, 1,
1.049753, 0.1701702, 1.259893, 1, 0, 0.9529412, 1,
1.053153, -0.8570879, 3.084518, 1, 0, 0.9490196, 1,
1.055472, -0.8760588, 3.760331, 1, 0, 0.9411765, 1,
1.061777, 1.234367, 0.819522, 1, 0, 0.9372549, 1,
1.064447, -1.893052, 3.351623, 1, 0, 0.9294118, 1,
1.06697, -1.183336, 2.554403, 1, 0, 0.9254902, 1,
1.07278, 0.4493895, 0.6480771, 1, 0, 0.9176471, 1,
1.079059, -1.822047, 1.34062, 1, 0, 0.9137255, 1,
1.087351, 0.02977901, 2.283787, 1, 0, 0.9058824, 1,
1.090794, -0.09122951, 2.236766, 1, 0, 0.9019608, 1,
1.092635, -1.222672, 1.158585, 1, 0, 0.8941177, 1,
1.093359, 2.713019, 1.645801, 1, 0, 0.8862745, 1,
1.093421, 0.6610642, 1.551289, 1, 0, 0.8823529, 1,
1.116128, -1.927472, 2.819766, 1, 0, 0.8745098, 1,
1.12232, -0.8005152, 3.629375, 1, 0, 0.8705882, 1,
1.12241, -0.8484487, 2.146424, 1, 0, 0.8627451, 1,
1.126071, 0.1405641, 1.665566, 1, 0, 0.8588235, 1,
1.127725, -0.07517752, 0.7364357, 1, 0, 0.8509804, 1,
1.128092, 0.4018686, 1.57637, 1, 0, 0.8470588, 1,
1.130665, 0.3528768, 1.37321, 1, 0, 0.8392157, 1,
1.139585, 0.4448469, 1.205207, 1, 0, 0.8352941, 1,
1.146846, -2.505305, 3.213151, 1, 0, 0.827451, 1,
1.147541, -1.22662, 3.205755, 1, 0, 0.8235294, 1,
1.148946, 1.461395, -1.249755, 1, 0, 0.8156863, 1,
1.151676, -0.7431275, 0.6342378, 1, 0, 0.8117647, 1,
1.153948, -0.5605378, 2.503892, 1, 0, 0.8039216, 1,
1.157202, -0.2936124, 1.459078, 1, 0, 0.7960784, 1,
1.159154, -0.2243016, 1.840798, 1, 0, 0.7921569, 1,
1.159837, -0.3904573, 2.816856, 1, 0, 0.7843137, 1,
1.161163, 0.6002188, 0.01552912, 1, 0, 0.7803922, 1,
1.164391, 1.292533, 0.8882214, 1, 0, 0.772549, 1,
1.16928, -1.283355, 3.740418, 1, 0, 0.7686275, 1,
1.172989, -0.8116343, 1.168949, 1, 0, 0.7607843, 1,
1.178138, 0.007600488, 1.495216, 1, 0, 0.7568628, 1,
1.187176, -0.1100942, 2.916031, 1, 0, 0.7490196, 1,
1.188207, -0.05484154, 1.138239, 1, 0, 0.7450981, 1,
1.207244, 2.099685, 0.4335628, 1, 0, 0.7372549, 1,
1.215597, 1.513469, 1.002546, 1, 0, 0.7333333, 1,
1.219236, 0.02703399, -0.1973352, 1, 0, 0.7254902, 1,
1.219961, -1.456222, 0.5149039, 1, 0, 0.7215686, 1,
1.23676, 0.3704678, -0.1595354, 1, 0, 0.7137255, 1,
1.256676, -0.7219694, 2.22807, 1, 0, 0.7098039, 1,
1.258682, -0.569603, 3.556446, 1, 0, 0.7019608, 1,
1.265998, -1.063425, 2.033771, 1, 0, 0.6941177, 1,
1.266063, 0.2664493, 1.349179, 1, 0, 0.6901961, 1,
1.268101, 0.1538275, 2.183712, 1, 0, 0.682353, 1,
1.268807, 0.2738206, 0.811954, 1, 0, 0.6784314, 1,
1.272985, 0.69414, 0.6841833, 1, 0, 0.6705883, 1,
1.280548, -1.279904, 3.453012, 1, 0, 0.6666667, 1,
1.286375, 0.3538946, 0.7407986, 1, 0, 0.6588235, 1,
1.29397, 1.61399, -0.7498487, 1, 0, 0.654902, 1,
1.307228, 1.071584, -0.3250491, 1, 0, 0.6470588, 1,
1.313042, 0.4368511, 1.300787, 1, 0, 0.6431373, 1,
1.321687, 1.286051, 1.390211, 1, 0, 0.6352941, 1,
1.324784, -1.154179, 3.145521, 1, 0, 0.6313726, 1,
1.333141, 1.16555, 0.6487126, 1, 0, 0.6235294, 1,
1.333162, 1.257946, 0.907055, 1, 0, 0.6196079, 1,
1.339594, 0.9037031, 1.040232, 1, 0, 0.6117647, 1,
1.340989, -0.9191525, 2.237785, 1, 0, 0.6078432, 1,
1.343948, 0.1551802, 3.634838, 1, 0, 0.6, 1,
1.346559, -0.3834177, 1.879961, 1, 0, 0.5921569, 1,
1.347046, 1.123271, -0.005303149, 1, 0, 0.5882353, 1,
1.35066, 0.5128233, 1.487175, 1, 0, 0.5803922, 1,
1.356912, 0.06302582, 0.7746109, 1, 0, 0.5764706, 1,
1.362188, -0.7980806, 3.319494, 1, 0, 0.5686275, 1,
1.385401, -2.228878, 2.469711, 1, 0, 0.5647059, 1,
1.386831, -1.099739, 2.138716, 1, 0, 0.5568628, 1,
1.389359, -1.65969, -0.618457, 1, 0, 0.5529412, 1,
1.390837, -0.1422632, 0.7596658, 1, 0, 0.5450981, 1,
1.398694, 0.1359469, -0.4759893, 1, 0, 0.5411765, 1,
1.399787, 1.096102, -0.1364261, 1, 0, 0.5333334, 1,
1.409312, 1.136921, 2.279226, 1, 0, 0.5294118, 1,
1.413346, 0.5494033, 2.081366, 1, 0, 0.5215687, 1,
1.434067, -0.3991313, 1.422966, 1, 0, 0.5176471, 1,
1.442513, 0.5378808, 1.448316, 1, 0, 0.509804, 1,
1.45592, -0.2598869, 0.6359844, 1, 0, 0.5058824, 1,
1.459284, 0.8351701, 0.4568833, 1, 0, 0.4980392, 1,
1.47162, 0.5370698, 1.361862, 1, 0, 0.4901961, 1,
1.472927, 0.02277793, 2.402216, 1, 0, 0.4862745, 1,
1.473839, -0.05210846, 0.9091054, 1, 0, 0.4784314, 1,
1.493784, -1.571298, 1.231378, 1, 0, 0.4745098, 1,
1.496957, -0.01781833, 2.335793, 1, 0, 0.4666667, 1,
1.518455, 1.086699, 0.9823391, 1, 0, 0.4627451, 1,
1.519429, -0.3851575, 1.229011, 1, 0, 0.454902, 1,
1.533382, 1.04371, -0.2037105, 1, 0, 0.4509804, 1,
1.536928, 2.200786, 1.530658, 1, 0, 0.4431373, 1,
1.537004, -0.4984418, 2.062419, 1, 0, 0.4392157, 1,
1.560397, -0.9834723, 1.983996, 1, 0, 0.4313726, 1,
1.562336, 0.3896886, 2.471856, 1, 0, 0.427451, 1,
1.563041, 0.1268293, 1.832073, 1, 0, 0.4196078, 1,
1.578336, 0.1887986, 1.359901, 1, 0, 0.4156863, 1,
1.597014, -0.2727169, 1.095861, 1, 0, 0.4078431, 1,
1.597353, -0.2363274, 0.6355303, 1, 0, 0.4039216, 1,
1.604126, 1.114892, 0.9335706, 1, 0, 0.3960784, 1,
1.606578, 0.6085299, 1.125749, 1, 0, 0.3882353, 1,
1.614095, 0.3791318, -0.03838093, 1, 0, 0.3843137, 1,
1.62157, 0.1914708, 1.652379, 1, 0, 0.3764706, 1,
1.63583, 0.4274327, 2.116531, 1, 0, 0.372549, 1,
1.639969, 0.2553869, 1.84372, 1, 0, 0.3647059, 1,
1.655248, -0.5430455, 0.9520251, 1, 0, 0.3607843, 1,
1.656299, -1.406917, 3.343401, 1, 0, 0.3529412, 1,
1.660739, -0.4206066, 4.8117, 1, 0, 0.3490196, 1,
1.660962, -1.309357, 2.141452, 1, 0, 0.3411765, 1,
1.665405, 0.832859, -0.1756343, 1, 0, 0.3372549, 1,
1.668777, 0.3864116, 2.867266, 1, 0, 0.3294118, 1,
1.696495, 0.4918035, 1.520344, 1, 0, 0.3254902, 1,
1.702158, -0.1643019, 2.180548, 1, 0, 0.3176471, 1,
1.715957, 0.009486584, 1.803904, 1, 0, 0.3137255, 1,
1.719781, -0.6835796, 1.20808, 1, 0, 0.3058824, 1,
1.74713, 0.5551615, 3.607246, 1, 0, 0.2980392, 1,
1.756212, 0.8618303, 0.8743477, 1, 0, 0.2941177, 1,
1.757107, -0.1792734, 1.581917, 1, 0, 0.2862745, 1,
1.766636, 0.240745, 1.670943, 1, 0, 0.282353, 1,
1.775694, 0.6619812, 1.297094, 1, 0, 0.2745098, 1,
1.793341, 0.09353135, 2.006355, 1, 0, 0.2705882, 1,
1.793466, 0.4894341, 0.9280034, 1, 0, 0.2627451, 1,
1.797665, 0.4953572, 2.342099, 1, 0, 0.2588235, 1,
1.805612, 0.6514574, 0.3025482, 1, 0, 0.2509804, 1,
1.814152, -0.9376477, 2.408594, 1, 0, 0.2470588, 1,
1.82082, 1.067351, 1.886228, 1, 0, 0.2392157, 1,
1.839327, 0.4057769, 2.126286, 1, 0, 0.2352941, 1,
1.853009, 0.3073334, 1.372181, 1, 0, 0.227451, 1,
1.855336, 0.3621366, 1.861732, 1, 0, 0.2235294, 1,
1.858869, 0.9217522, 1.476026, 1, 0, 0.2156863, 1,
1.917311, -1.059712, 0.955378, 1, 0, 0.2117647, 1,
1.920931, 0.06932166, 1.877678, 1, 0, 0.2039216, 1,
1.954881, 0.5813764, 1.755392, 1, 0, 0.1960784, 1,
1.981066, -0.5438426, 1.390178, 1, 0, 0.1921569, 1,
1.988433, -0.6158535, 2.464784, 1, 0, 0.1843137, 1,
1.992526, 0.9098075, 1.27902, 1, 0, 0.1803922, 1,
1.997116, -0.3458908, 1.602676, 1, 0, 0.172549, 1,
2.056696, -0.1120634, 2.189967, 1, 0, 0.1686275, 1,
2.058604, 1.62032, -0.5301801, 1, 0, 0.1607843, 1,
2.064627, -0.7099966, 2.74138, 1, 0, 0.1568628, 1,
2.083287, -0.1487059, 1.953974, 1, 0, 0.1490196, 1,
2.111344, 0.7848331, 0.01798107, 1, 0, 0.145098, 1,
2.145582, -0.5204614, 2.420006, 1, 0, 0.1372549, 1,
2.146435, -0.8261975, 0.2987499, 1, 0, 0.1333333, 1,
2.196702, 1.076647, 0.4589365, 1, 0, 0.1254902, 1,
2.221092, 0.9809332, 2.486907, 1, 0, 0.1215686, 1,
2.346716, -1.468711, 2.415482, 1, 0, 0.1137255, 1,
2.361174, 0.1109414, 0.2626821, 1, 0, 0.1098039, 1,
2.376745, 0.4259818, 0.6793365, 1, 0, 0.1019608, 1,
2.395688, 1.506495, 1.19481, 1, 0, 0.09411765, 1,
2.419056, -0.1514058, 1.478953, 1, 0, 0.09019608, 1,
2.427617, -0.628574, 0.3888825, 1, 0, 0.08235294, 1,
2.429686, -1.304658, 1.426237, 1, 0, 0.07843138, 1,
2.46624, 1.628389, 0.6240537, 1, 0, 0.07058824, 1,
2.502684, 0.6653362, 2.844941, 1, 0, 0.06666667, 1,
2.512428, -0.2937823, 1.045376, 1, 0, 0.05882353, 1,
2.578475, -1.31493, 2.439725, 1, 0, 0.05490196, 1,
2.60525, 0.004572035, 2.485642, 1, 0, 0.04705882, 1,
2.664278, 0.06601985, 0.6697664, 1, 0, 0.04313726, 1,
2.67257, -1.024064, 2.25356, 1, 0, 0.03529412, 1,
2.812967, 1.17225, 2.259732, 1, 0, 0.03137255, 1,
2.947811, -0.5097144, 3.146681, 1, 0, 0.02352941, 1,
2.952792, 1.883678, 1.29048, 1, 0, 0.01960784, 1,
2.978821, 0.833651, 0.6792323, 1, 0, 0.01176471, 1,
3.128652, -1.650433, 3.267039, 1, 0, 0.007843138, 1
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
0.1609259, -4.62966, -6.471894, 0, -0.5, 0.5, 0.5,
0.1609259, -4.62966, -6.471894, 1, -0.5, 0.5, 0.5,
0.1609259, -4.62966, -6.471894, 1, 1.5, 0.5, 0.5,
0.1609259, -4.62966, -6.471894, 0, 1.5, 0.5, 0.5
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
-3.81286, -0.2648071, -6.471894, 0, -0.5, 0.5, 0.5,
-3.81286, -0.2648071, -6.471894, 1, -0.5, 0.5, 0.5,
-3.81286, -0.2648071, -6.471894, 1, 1.5, 0.5, 0.5,
-3.81286, -0.2648071, -6.471894, 0, 1.5, 0.5, 0.5
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
-3.81286, -4.62966, 0.2208385, 0, -0.5, 0.5, 0.5,
-3.81286, -4.62966, 0.2208385, 1, -0.5, 0.5, 0.5,
-3.81286, -4.62966, 0.2208385, 1, 1.5, 0.5, 0.5,
-3.81286, -4.62966, 0.2208385, 0, 1.5, 0.5, 0.5
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
-2, -3.622386, -4.927417,
3, -3.622386, -4.927417,
-2, -3.622386, -4.927417,
-2, -3.790265, -5.18483,
-1, -3.622386, -4.927417,
-1, -3.790265, -5.18483,
0, -3.622386, -4.927417,
0, -3.790265, -5.18483,
1, -3.622386, -4.927417,
1, -3.790265, -5.18483,
2, -3.622386, -4.927417,
2, -3.790265, -5.18483,
3, -3.622386, -4.927417,
3, -3.790265, -5.18483
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
-2, -4.126023, -5.699656, 0, -0.5, 0.5, 0.5,
-2, -4.126023, -5.699656, 1, -0.5, 0.5, 0.5,
-2, -4.126023, -5.699656, 1, 1.5, 0.5, 0.5,
-2, -4.126023, -5.699656, 0, 1.5, 0.5, 0.5,
-1, -4.126023, -5.699656, 0, -0.5, 0.5, 0.5,
-1, -4.126023, -5.699656, 1, -0.5, 0.5, 0.5,
-1, -4.126023, -5.699656, 1, 1.5, 0.5, 0.5,
-1, -4.126023, -5.699656, 0, 1.5, 0.5, 0.5,
0, -4.126023, -5.699656, 0, -0.5, 0.5, 0.5,
0, -4.126023, -5.699656, 1, -0.5, 0.5, 0.5,
0, -4.126023, -5.699656, 1, 1.5, 0.5, 0.5,
0, -4.126023, -5.699656, 0, 1.5, 0.5, 0.5,
1, -4.126023, -5.699656, 0, -0.5, 0.5, 0.5,
1, -4.126023, -5.699656, 1, -0.5, 0.5, 0.5,
1, -4.126023, -5.699656, 1, 1.5, 0.5, 0.5,
1, -4.126023, -5.699656, 0, 1.5, 0.5, 0.5,
2, -4.126023, -5.699656, 0, -0.5, 0.5, 0.5,
2, -4.126023, -5.699656, 1, -0.5, 0.5, 0.5,
2, -4.126023, -5.699656, 1, 1.5, 0.5, 0.5,
2, -4.126023, -5.699656, 0, 1.5, 0.5, 0.5,
3, -4.126023, -5.699656, 0, -0.5, 0.5, 0.5,
3, -4.126023, -5.699656, 1, -0.5, 0.5, 0.5,
3, -4.126023, -5.699656, 1, 1.5, 0.5, 0.5,
3, -4.126023, -5.699656, 0, 1.5, 0.5, 0.5
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
-2.895832, -3, -4.927417,
-2.895832, 2, -4.927417,
-2.895832, -3, -4.927417,
-3.04867, -3, -5.18483,
-2.895832, -2, -4.927417,
-3.04867, -2, -5.18483,
-2.895832, -1, -4.927417,
-3.04867, -1, -5.18483,
-2.895832, 0, -4.927417,
-3.04867, 0, -5.18483,
-2.895832, 1, -4.927417,
-3.04867, 1, -5.18483,
-2.895832, 2, -4.927417,
-3.04867, 2, -5.18483
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
-3.354346, -3, -5.699656, 0, -0.5, 0.5, 0.5,
-3.354346, -3, -5.699656, 1, -0.5, 0.5, 0.5,
-3.354346, -3, -5.699656, 1, 1.5, 0.5, 0.5,
-3.354346, -3, -5.699656, 0, 1.5, 0.5, 0.5,
-3.354346, -2, -5.699656, 0, -0.5, 0.5, 0.5,
-3.354346, -2, -5.699656, 1, -0.5, 0.5, 0.5,
-3.354346, -2, -5.699656, 1, 1.5, 0.5, 0.5,
-3.354346, -2, -5.699656, 0, 1.5, 0.5, 0.5,
-3.354346, -1, -5.699656, 0, -0.5, 0.5, 0.5,
-3.354346, -1, -5.699656, 1, -0.5, 0.5, 0.5,
-3.354346, -1, -5.699656, 1, 1.5, 0.5, 0.5,
-3.354346, -1, -5.699656, 0, 1.5, 0.5, 0.5,
-3.354346, 0, -5.699656, 0, -0.5, 0.5, 0.5,
-3.354346, 0, -5.699656, 1, -0.5, 0.5, 0.5,
-3.354346, 0, -5.699656, 1, 1.5, 0.5, 0.5,
-3.354346, 0, -5.699656, 0, 1.5, 0.5, 0.5,
-3.354346, 1, -5.699656, 0, -0.5, 0.5, 0.5,
-3.354346, 1, -5.699656, 1, -0.5, 0.5, 0.5,
-3.354346, 1, -5.699656, 1, 1.5, 0.5, 0.5,
-3.354346, 1, -5.699656, 0, 1.5, 0.5, 0.5,
-3.354346, 2, -5.699656, 0, -0.5, 0.5, 0.5,
-3.354346, 2, -5.699656, 1, -0.5, 0.5, 0.5,
-3.354346, 2, -5.699656, 1, 1.5, 0.5, 0.5,
-3.354346, 2, -5.699656, 0, 1.5, 0.5, 0.5
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
-2.895832, -3.622386, -4,
-2.895832, -3.622386, 4,
-2.895832, -3.622386, -4,
-3.04867, -3.790265, -4,
-2.895832, -3.622386, -2,
-3.04867, -3.790265, -2,
-2.895832, -3.622386, 0,
-3.04867, -3.790265, 0,
-2.895832, -3.622386, 2,
-3.04867, -3.790265, 2,
-2.895832, -3.622386, 4,
-3.04867, -3.790265, 4
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
-3.354346, -4.126023, -4, 0, -0.5, 0.5, 0.5,
-3.354346, -4.126023, -4, 1, -0.5, 0.5, 0.5,
-3.354346, -4.126023, -4, 1, 1.5, 0.5, 0.5,
-3.354346, -4.126023, -4, 0, 1.5, 0.5, 0.5,
-3.354346, -4.126023, -2, 0, -0.5, 0.5, 0.5,
-3.354346, -4.126023, -2, 1, -0.5, 0.5, 0.5,
-3.354346, -4.126023, -2, 1, 1.5, 0.5, 0.5,
-3.354346, -4.126023, -2, 0, 1.5, 0.5, 0.5,
-3.354346, -4.126023, 0, 0, -0.5, 0.5, 0.5,
-3.354346, -4.126023, 0, 1, -0.5, 0.5, 0.5,
-3.354346, -4.126023, 0, 1, 1.5, 0.5, 0.5,
-3.354346, -4.126023, 0, 0, 1.5, 0.5, 0.5,
-3.354346, -4.126023, 2, 0, -0.5, 0.5, 0.5,
-3.354346, -4.126023, 2, 1, -0.5, 0.5, 0.5,
-3.354346, -4.126023, 2, 1, 1.5, 0.5, 0.5,
-3.354346, -4.126023, 2, 0, 1.5, 0.5, 0.5,
-3.354346, -4.126023, 4, 0, -0.5, 0.5, 0.5,
-3.354346, -4.126023, 4, 1, -0.5, 0.5, 0.5,
-3.354346, -4.126023, 4, 1, 1.5, 0.5, 0.5,
-3.354346, -4.126023, 4, 0, 1.5, 0.5, 0.5
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
-2.895832, -3.622386, -4.927417,
-2.895832, 3.092772, -4.927417,
-2.895832, -3.622386, 5.369094,
-2.895832, 3.092772, 5.369094,
-2.895832, -3.622386, -4.927417,
-2.895832, -3.622386, 5.369094,
-2.895832, 3.092772, -4.927417,
-2.895832, 3.092772, 5.369094,
-2.895832, -3.622386, -4.927417,
3.217684, -3.622386, -4.927417,
-2.895832, -3.622386, 5.369094,
3.217684, -3.622386, 5.369094,
-2.895832, 3.092772, -4.927417,
3.217684, 3.092772, -4.927417,
-2.895832, 3.092772, 5.369094,
3.217684, 3.092772, 5.369094,
3.217684, -3.622386, -4.927417,
3.217684, 3.092772, -4.927417,
3.217684, -3.622386, 5.369094,
3.217684, 3.092772, 5.369094,
3.217684, -3.622386, -4.927417,
3.217684, -3.622386, 5.369094,
3.217684, 3.092772, -4.927417,
3.217684, 3.092772, 5.369094
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
var radius = 7.331042;
var distance = 32.61663;
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
mvMatrix.translate( -0.1609259, 0.2648071, -0.2208385 );
mvMatrix.scale( 1.296548, 1.180384, 0.7698205 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.61663);
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
thifensulfuron-methy<-read.table("thifensulfuron-methy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thifensulfuron-methy$V2
```

```
## Error in eval(expr, envir, enclos): object 'thifensulfuron' not found
```

```r
y<-thifensulfuron-methy$V3
```

```
## Error in eval(expr, envir, enclos): object 'thifensulfuron' not found
```

```r
z<-thifensulfuron-methy$V4
```

```
## Error in eval(expr, envir, enclos): object 'thifensulfuron' not found
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
-2.8068, 1.145693, -1.761554, 0, 0, 1, 1, 1,
-2.756691, 0.3278343, -0.2913861, 1, 0, 0, 1, 1,
-2.700633, -0.03660674, -0.8987758, 1, 0, 0, 1, 1,
-2.622175, 0.5634832, -2.962777, 1, 0, 0, 1, 1,
-2.570472, 0.8455061, -0.5655701, 1, 0, 0, 1, 1,
-2.496403, 1.445816, -2.532569, 1, 0, 0, 1, 1,
-2.457975, -0.3756773, -1.746297, 0, 0, 0, 1, 1,
-2.423895, 0.9960197, -1.300524, 0, 0, 0, 1, 1,
-2.3946, 0.8875317, -1.548598, 0, 0, 0, 1, 1,
-2.331004, 0.9594977, -1.625251, 0, 0, 0, 1, 1,
-2.282637, -0.9980853, -2.1468, 0, 0, 0, 1, 1,
-2.273412, -0.1458107, -1.450024, 0, 0, 0, 1, 1,
-2.256107, 0.3222725, -0.838474, 0, 0, 0, 1, 1,
-2.238038, 0.06430216, -0.9608088, 1, 1, 1, 1, 1,
-2.202405, 0.6499131, -0.6212763, 1, 1, 1, 1, 1,
-2.163474, -1.218791, -1.435302, 1, 1, 1, 1, 1,
-2.108861, -0.2343285, -2.368895, 1, 1, 1, 1, 1,
-2.107788, -0.1841326, -1.701509, 1, 1, 1, 1, 1,
-2.064484, -0.5508246, -0.8574644, 1, 1, 1, 1, 1,
-2.062284, -0.4602572, -0.6280429, 1, 1, 1, 1, 1,
-2.037187, -0.5672147, -3.003772, 1, 1, 1, 1, 1,
-2.03154, 1.547801, -0.4005924, 1, 1, 1, 1, 1,
-2.024656, -1.396201, -1.368882, 1, 1, 1, 1, 1,
-2.020959, -1.196417, -1.539353, 1, 1, 1, 1, 1,
-1.996988, -1.48282, -3.289033, 1, 1, 1, 1, 1,
-1.939334, -2.032133, -3.300363, 1, 1, 1, 1, 1,
-1.923761, -1.755489, -3.448598, 1, 1, 1, 1, 1,
-1.911093, 0.8044046, -1.815725, 1, 1, 1, 1, 1,
-1.901896, 0.8006119, -1.622671, 0, 0, 1, 1, 1,
-1.899361, 2.138972, -1.448531, 1, 0, 0, 1, 1,
-1.882108, -1.156191, -3.807768, 1, 0, 0, 1, 1,
-1.87625, -1.388043, -2.495863, 1, 0, 0, 1, 1,
-1.854444, 1.832898, 0.535898, 1, 0, 0, 1, 1,
-1.854257, 0.1591199, -1.417419, 1, 0, 0, 1, 1,
-1.838957, -0.5388663, -1.629714, 0, 0, 0, 1, 1,
-1.836105, 0.3464167, -1.533883, 0, 0, 0, 1, 1,
-1.807682, 1.281982, -0.2876409, 0, 0, 0, 1, 1,
-1.80435, -0.5440454, -2.385004, 0, 0, 0, 1, 1,
-1.774539, 1.001512, 0.6702589, 0, 0, 0, 1, 1,
-1.759932, -1.284543, -2.088168, 0, 0, 0, 1, 1,
-1.753342, -1.139398, -3.182154, 0, 0, 0, 1, 1,
-1.749734, 1.079472, 0.3914474, 1, 1, 1, 1, 1,
-1.690996, 0.3551541, -1.012406, 1, 1, 1, 1, 1,
-1.679284, -1.445856, -1.253881, 1, 1, 1, 1, 1,
-1.677012, 0.4926687, 0.1313508, 1, 1, 1, 1, 1,
-1.640197, 0.0484456, -2.176053, 1, 1, 1, 1, 1,
-1.638918, -0.6881875, -2.393764, 1, 1, 1, 1, 1,
-1.629468, -1.479085, -0.5994403, 1, 1, 1, 1, 1,
-1.617181, 0.1540046, -0.3523901, 1, 1, 1, 1, 1,
-1.610865, -0.2677249, -1.867823, 1, 1, 1, 1, 1,
-1.604801, 0.6378201, -0.4197721, 1, 1, 1, 1, 1,
-1.588326, 1.299328, -0.9436577, 1, 1, 1, 1, 1,
-1.587869, 0.1202233, -3.066053, 1, 1, 1, 1, 1,
-1.575819, -0.02467524, -1.945509, 1, 1, 1, 1, 1,
-1.570633, 1.032536, -2.440898, 1, 1, 1, 1, 1,
-1.567876, -2.224767, -4.297937, 1, 1, 1, 1, 1,
-1.567025, -0.825517, -2.009942, 0, 0, 1, 1, 1,
-1.542698, -1.044837, -1.932521, 1, 0, 0, 1, 1,
-1.539557, 0.1492275, -1.107729, 1, 0, 0, 1, 1,
-1.533879, -1.274125, -0.2784241, 1, 0, 0, 1, 1,
-1.532253, 0.8469347, -0.07215977, 1, 0, 0, 1, 1,
-1.532225, 1.131815, -1.010411, 1, 0, 0, 1, 1,
-1.531613, -0.1467368, -2.564573, 0, 0, 0, 1, 1,
-1.530454, -0.3077843, -2.554668, 0, 0, 0, 1, 1,
-1.527342, -2.277344, -1.223676, 0, 0, 0, 1, 1,
-1.498827, -0.1515136, -1.486869, 0, 0, 0, 1, 1,
-1.492114, 0.8757403, -1.95041, 0, 0, 0, 1, 1,
-1.485985, 0.778904, -1.174702, 0, 0, 0, 1, 1,
-1.483649, -0.7149882, 0.8123752, 0, 0, 0, 1, 1,
-1.479651, 1.064942, -1.452004, 1, 1, 1, 1, 1,
-1.47584, -0.546851, -0.9018452, 1, 1, 1, 1, 1,
-1.456924, 0.1083564, -0.9000622, 1, 1, 1, 1, 1,
-1.451217, 1.283991, 0.5882567, 1, 1, 1, 1, 1,
-1.436309, -0.5044165, -2.30087, 1, 1, 1, 1, 1,
-1.41797, 1.056638, -0.6348984, 1, 1, 1, 1, 1,
-1.414657, -1.080954, -2.087903, 1, 1, 1, 1, 1,
-1.409728, 0.01543184, -0.8762016, 1, 1, 1, 1, 1,
-1.409592, -1.018685, -2.994705, 1, 1, 1, 1, 1,
-1.403401, 0.4419198, -0.7410791, 1, 1, 1, 1, 1,
-1.400711, -0.2145035, 0.4356974, 1, 1, 1, 1, 1,
-1.391507, 0.1169353, -0.729504, 1, 1, 1, 1, 1,
-1.384426, 1.016764, -0.6386043, 1, 1, 1, 1, 1,
-1.381086, 0.4253289, -0.05660944, 1, 1, 1, 1, 1,
-1.377071, 0.2303157, 0.05346928, 1, 1, 1, 1, 1,
-1.369716, 1.493235, 0.6551604, 0, 0, 1, 1, 1,
-1.356109, 2.140449, -0.8964453, 1, 0, 0, 1, 1,
-1.355304, 1.231067, -2.002428, 1, 0, 0, 1, 1,
-1.338056, 0.8104049, -1.423636, 1, 0, 0, 1, 1,
-1.337382, -3.524592, -2.671125, 1, 0, 0, 1, 1,
-1.332348, 0.1808096, -1.537254, 1, 0, 0, 1, 1,
-1.307864, -0.5737537, -0.3799019, 0, 0, 0, 1, 1,
-1.304575, -1.910592, -1.471116, 0, 0, 0, 1, 1,
-1.304133, -1.141979, -4.066382, 0, 0, 0, 1, 1,
-1.300802, -0.01443594, -2.362368, 0, 0, 0, 1, 1,
-1.296053, -0.5135971, -3.320186, 0, 0, 0, 1, 1,
-1.296005, 0.1201578, -0.351301, 0, 0, 0, 1, 1,
-1.295686, 0.2907266, -1.173381, 0, 0, 0, 1, 1,
-1.292205, 0.8149962, -0.1216212, 1, 1, 1, 1, 1,
-1.262334, 1.299369, 0.05973775, 1, 1, 1, 1, 1,
-1.261161, -0.9763313, -2.710301, 1, 1, 1, 1, 1,
-1.254539, -0.08047495, -0.4952742, 1, 1, 1, 1, 1,
-1.253936, -1.008048, -2.277795, 1, 1, 1, 1, 1,
-1.252013, -1.475476, -2.135575, 1, 1, 1, 1, 1,
-1.249356, 1.515006, -0.9957769, 1, 1, 1, 1, 1,
-1.22723, -0.2495282, -0.8247918, 1, 1, 1, 1, 1,
-1.219162, -0.1130507, -0.3557117, 1, 1, 1, 1, 1,
-1.218029, 0.6053125, -1.183826, 1, 1, 1, 1, 1,
-1.203064, 0.4949846, 0.8069845, 1, 1, 1, 1, 1,
-1.19592, -0.4328254, -1.495643, 1, 1, 1, 1, 1,
-1.194684, -0.4393212, -2.192822, 1, 1, 1, 1, 1,
-1.191406, 0.2331685, -0.9876517, 1, 1, 1, 1, 1,
-1.164212, 0.5588228, -2.355999, 1, 1, 1, 1, 1,
-1.163875, -1.009605, -2.723794, 0, 0, 1, 1, 1,
-1.160641, -1.243469, -2.558911, 1, 0, 0, 1, 1,
-1.159468, 0.05063135, -3.412529, 1, 0, 0, 1, 1,
-1.158208, 0.2782385, -1.952017, 1, 0, 0, 1, 1,
-1.155318, 0.2159486, -1.640915, 1, 0, 0, 1, 1,
-1.153708, -0.08838662, -1.508999, 1, 0, 0, 1, 1,
-1.153446, 1.225219, -1.304318, 0, 0, 0, 1, 1,
-1.151904, -0.6386582, -1.684325, 0, 0, 0, 1, 1,
-1.150774, -0.9184619, -1.254004, 0, 0, 0, 1, 1,
-1.136372, 0.758123, -0.7151076, 0, 0, 0, 1, 1,
-1.128803, 0.9387558, -1.750795, 0, 0, 0, 1, 1,
-1.117833, 0.4429222, -0.9602378, 0, 0, 0, 1, 1,
-1.108481, -0.6291798, -2.300651, 0, 0, 0, 1, 1,
-1.100018, -1.471431, -2.011438, 1, 1, 1, 1, 1,
-1.099105, 0.4740943, -1.039555, 1, 1, 1, 1, 1,
-1.083683, -0.367361, -1.853208, 1, 1, 1, 1, 1,
-1.072686, -1.015731, -2.55757, 1, 1, 1, 1, 1,
-1.067929, 0.0218818, -1.457797, 1, 1, 1, 1, 1,
-1.064924, -0.3757881, -3.197972, 1, 1, 1, 1, 1,
-1.063668, 1.283221, -1.298653, 1, 1, 1, 1, 1,
-1.063501, -1.932395, -3.59942, 1, 1, 1, 1, 1,
-1.058574, 1.164974, -1.365815, 1, 1, 1, 1, 1,
-1.054519, -0.2150485, -1.362173, 1, 1, 1, 1, 1,
-1.05346, -0.3860691, -3.703946, 1, 1, 1, 1, 1,
-1.041126, -1.386162, -2.353609, 1, 1, 1, 1, 1,
-1.035868, 0.765838, 0.4599257, 1, 1, 1, 1, 1,
-1.029549, 0.5312235, -3.489837, 1, 1, 1, 1, 1,
-1.025975, 0.1626695, -1.720446, 1, 1, 1, 1, 1,
-1.018724, -0.2473668, -1.641636, 0, 0, 1, 1, 1,
-1.01689, -1.798735, -1.464759, 1, 0, 0, 1, 1,
-1.014627, -0.734073, -0.9727324, 1, 0, 0, 1, 1,
-1.000573, 0.7785218, -0.9300052, 1, 0, 0, 1, 1,
-0.9993142, -1.254064, -2.050339, 1, 0, 0, 1, 1,
-0.984657, 0.4804043, -1.987433, 1, 0, 0, 1, 1,
-0.9827071, 0.5818701, -0.1273057, 0, 0, 0, 1, 1,
-0.9703268, 0.3192188, -2.368359, 0, 0, 0, 1, 1,
-0.961036, -1.645909, -1.381609, 0, 0, 0, 1, 1,
-0.9530693, 1.853169, -0.80131, 0, 0, 0, 1, 1,
-0.9517512, 0.9457724, 1.916905, 0, 0, 0, 1, 1,
-0.9390431, -0.08988884, -0.9790189, 0, 0, 0, 1, 1,
-0.9359724, -0.08313968, -1.061463, 0, 0, 0, 1, 1,
-0.9345019, 0.3067794, -2.582937, 1, 1, 1, 1, 1,
-0.9331601, -1.568758, -2.826643, 1, 1, 1, 1, 1,
-0.9294782, -0.4253779, -3.229094, 1, 1, 1, 1, 1,
-0.9265806, 0.7116386, -0.4829617, 1, 1, 1, 1, 1,
-0.9223425, -0.7038269, -1.483779, 1, 1, 1, 1, 1,
-0.9159487, 0.261733, -0.3810971, 1, 1, 1, 1, 1,
-0.9085706, -0.9415885, -0.9373045, 1, 1, 1, 1, 1,
-0.908225, 0.1166451, -2.463039, 1, 1, 1, 1, 1,
-0.9065919, 1.651481, 1.632743, 1, 1, 1, 1, 1,
-0.901152, 0.9207357, -1.564149, 1, 1, 1, 1, 1,
-0.8953357, -0.1346489, -1.07069, 1, 1, 1, 1, 1,
-0.8951616, -0.5049278, -1.624441, 1, 1, 1, 1, 1,
-0.8950841, 1.590659, -1.411011, 1, 1, 1, 1, 1,
-0.8888272, -0.5626237, -1.761414, 1, 1, 1, 1, 1,
-0.886568, 1.206338, -0.4996249, 1, 1, 1, 1, 1,
-0.8846956, 0.7943122, 1.232309, 0, 0, 1, 1, 1,
-0.8830652, -1.5873, -2.411357, 1, 0, 0, 1, 1,
-0.8771858, -0.3945602, -1.356645, 1, 0, 0, 1, 1,
-0.8740727, 1.066913, -0.3481898, 1, 0, 0, 1, 1,
-0.8727793, -0.5527983, -1.651222, 1, 0, 0, 1, 1,
-0.861522, -0.2175752, -1.703323, 1, 0, 0, 1, 1,
-0.8567935, -1.623645, -1.377578, 0, 0, 0, 1, 1,
-0.8567162, 1.60511, -0.1169392, 0, 0, 0, 1, 1,
-0.8555018, 1.017322, -0.147664, 0, 0, 0, 1, 1,
-0.853568, 1.030042, -0.492772, 0, 0, 0, 1, 1,
-0.8534184, 0.2213052, 0.07829864, 0, 0, 0, 1, 1,
-0.8532401, 0.1860776, -1.32537, 0, 0, 0, 1, 1,
-0.8473565, 1.139149, -0.09110838, 0, 0, 0, 1, 1,
-0.8338897, -0.03451432, -2.218063, 1, 1, 1, 1, 1,
-0.8304197, -0.1139005, -1.420852, 1, 1, 1, 1, 1,
-0.8275204, -0.2060827, -0.2385308, 1, 1, 1, 1, 1,
-0.8262411, -0.8019937, -2.744109, 1, 1, 1, 1, 1,
-0.8261853, 0.3586897, -1.573938, 1, 1, 1, 1, 1,
-0.8259475, -2.41466, -1.783047, 1, 1, 1, 1, 1,
-0.8235145, -0.2343016, -1.222528, 1, 1, 1, 1, 1,
-0.8206958, -1.7664, -3.908871, 1, 1, 1, 1, 1,
-0.817243, -0.6410208, -1.458422, 1, 1, 1, 1, 1,
-0.8158943, 0.375468, -1.984326, 1, 1, 1, 1, 1,
-0.8113657, 0.2122295, -2.021991, 1, 1, 1, 1, 1,
-0.8079678, -0.1738581, -1.15893, 1, 1, 1, 1, 1,
-0.8035408, 0.38559, -1.376493, 1, 1, 1, 1, 1,
-0.8023279, -1.693008, -3.292978, 1, 1, 1, 1, 1,
-0.8003634, 0.4860264, 0.08600099, 1, 1, 1, 1, 1,
-0.7996603, -0.5923675, -2.033814, 0, 0, 1, 1, 1,
-0.7990904, 1.152943, -0.09709888, 1, 0, 0, 1, 1,
-0.7988101, 0.04863381, -0.4991761, 1, 0, 0, 1, 1,
-0.794723, 1.72851, -2.583312, 1, 0, 0, 1, 1,
-0.7904648, -0.8752538, -2.331498, 1, 0, 0, 1, 1,
-0.7750297, 0.6584716, -1.078857, 1, 0, 0, 1, 1,
-0.770183, -0.6666622, -4.106424, 0, 0, 0, 1, 1,
-0.7667425, 2.054058, -1.175275, 0, 0, 0, 1, 1,
-0.7662557, -0.3604538, -0.6970898, 0, 0, 0, 1, 1,
-0.7652059, -1.178721, -3.044915, 0, 0, 0, 1, 1,
-0.7589535, 1.37901, 0.06310175, 0, 0, 0, 1, 1,
-0.7518359, -0.3739818, -2.571963, 0, 0, 0, 1, 1,
-0.7468446, -0.7758939, -2.226395, 0, 0, 0, 1, 1,
-0.7437507, 0.3797788, -2.607248, 1, 1, 1, 1, 1,
-0.7415442, 1.428744, -1.829723, 1, 1, 1, 1, 1,
-0.7415322, -0.27848, -1.338774, 1, 1, 1, 1, 1,
-0.7387395, -0.1880371, -1.535371, 1, 1, 1, 1, 1,
-0.7387192, 0.5919855, -0.7360122, 1, 1, 1, 1, 1,
-0.738324, 1.757455, 0.0006990887, 1, 1, 1, 1, 1,
-0.7321526, -0.7280705, -1.541738, 1, 1, 1, 1, 1,
-0.7319016, -0.2209219, -1.941447, 1, 1, 1, 1, 1,
-0.7301137, -1.682357, -3.47808, 1, 1, 1, 1, 1,
-0.7283981, -0.6555958, -2.003683, 1, 1, 1, 1, 1,
-0.7203905, -0.8305091, -2.771686, 1, 1, 1, 1, 1,
-0.7148551, -0.460205, -3.600937, 1, 1, 1, 1, 1,
-0.7147087, 0.4510475, -2.089908, 1, 1, 1, 1, 1,
-0.7140001, -1.11697, -4.52353, 1, 1, 1, 1, 1,
-0.7126546, 0.02411222, -0.4368471, 1, 1, 1, 1, 1,
-0.7089266, 1.316711, -2.210886, 0, 0, 1, 1, 1,
-0.7073541, 0.5825042, -0.682567, 1, 0, 0, 1, 1,
-0.7047024, -1.099254, -2.112656, 1, 0, 0, 1, 1,
-0.7027349, -1.228556, -2.174124, 1, 0, 0, 1, 1,
-0.7020205, -0.5155152, -3.211845, 1, 0, 0, 1, 1,
-0.7003065, 0.4567721, -1.97595, 1, 0, 0, 1, 1,
-0.697684, -0.03933289, -0.946107, 0, 0, 0, 1, 1,
-0.6910639, 1.20566, -1.2217, 0, 0, 0, 1, 1,
-0.6898041, 0.4131848, -0.3839683, 0, 0, 0, 1, 1,
-0.6891708, 0.5567412, 0.1872015, 0, 0, 0, 1, 1,
-0.6845927, 1.474173, -0.04849195, 0, 0, 0, 1, 1,
-0.6669139, -0.5629905, -1.553978, 0, 0, 0, 1, 1,
-0.6666212, 0.06031337, -1.069451, 0, 0, 0, 1, 1,
-0.6652156, -1.2086, -2.460504, 1, 1, 1, 1, 1,
-0.6648867, -0.06547307, -1.103274, 1, 1, 1, 1, 1,
-0.6624801, 0.8094642, 0.980798, 1, 1, 1, 1, 1,
-0.6614687, 1.278649, 0.5088515, 1, 1, 1, 1, 1,
-0.6561618, 1.467715, -1.295251, 1, 1, 1, 1, 1,
-0.6536561, -0.3957121, -0.8878458, 1, 1, 1, 1, 1,
-0.6534613, 1.117203, -0.2362926, 1, 1, 1, 1, 1,
-0.6520891, 0.7867112, -2.12787, 1, 1, 1, 1, 1,
-0.650435, -0.7818708, -3.251474, 1, 1, 1, 1, 1,
-0.6502798, 0.8317404, 0.9820282, 1, 1, 1, 1, 1,
-0.6470546, 1.239855, -0.3021904, 1, 1, 1, 1, 1,
-0.6464047, 2.745066, -0.1522598, 1, 1, 1, 1, 1,
-0.6440353, 2.677426, -1.330903, 1, 1, 1, 1, 1,
-0.6428064, -0.318128, -0.4523138, 1, 1, 1, 1, 1,
-0.6396754, 1.020232, -2.821416, 1, 1, 1, 1, 1,
-0.6359491, -1.417472, -3.05925, 0, 0, 1, 1, 1,
-0.6357242, -0.6376539, -1.723497, 1, 0, 0, 1, 1,
-0.6305296, -1.078851, -1.900176, 1, 0, 0, 1, 1,
-0.6235862, -1.569346, -3.608112, 1, 0, 0, 1, 1,
-0.6233228, -0.5263807, -1.837056, 1, 0, 0, 1, 1,
-0.6213752, -0.03228234, -1.591721, 1, 0, 0, 1, 1,
-0.6194476, 2.001348, -0.3141674, 0, 0, 0, 1, 1,
-0.6176478, 1.809875, -1.401814, 0, 0, 0, 1, 1,
-0.6168857, 0.4202215, 0.7059492, 0, 0, 0, 1, 1,
-0.609704, -0.07343778, -1.65406, 0, 0, 0, 1, 1,
-0.6043963, 1.868012, -1.636515, 0, 0, 0, 1, 1,
-0.6026897, -0.2529707, -1.802874, 0, 0, 0, 1, 1,
-0.6005846, -1.09844, -3.189632, 0, 0, 0, 1, 1,
-0.5986273, -0.7921894, -2.592395, 1, 1, 1, 1, 1,
-0.594368, 0.6663222, -2.02776, 1, 1, 1, 1, 1,
-0.5911563, 0.1386497, -1.662041, 1, 1, 1, 1, 1,
-0.5900939, -0.3456869, -1.901674, 1, 1, 1, 1, 1,
-0.5877151, -1.263082, -2.800605, 1, 1, 1, 1, 1,
-0.5864724, 0.9911342, -0.7680293, 1, 1, 1, 1, 1,
-0.5858036, -0.7469705, -4.554931, 1, 1, 1, 1, 1,
-0.5850196, 1.060493, 0.5845108, 1, 1, 1, 1, 1,
-0.5845087, -0.4638445, -0.7282175, 1, 1, 1, 1, 1,
-0.582253, -0.3110281, 0.4087952, 1, 1, 1, 1, 1,
-0.5776838, 1.605761, -0.7749736, 1, 1, 1, 1, 1,
-0.5769454, -0.1369635, -4.426787, 1, 1, 1, 1, 1,
-0.5729136, -0.002183483, -0.01361517, 1, 1, 1, 1, 1,
-0.5718871, 0.7553033, -0.1695805, 1, 1, 1, 1, 1,
-0.5705501, 1.115069, -0.8894588, 1, 1, 1, 1, 1,
-0.5695919, 0.670404, -1.46715, 0, 0, 1, 1, 1,
-0.5681608, -0.5936561, -1.834376, 1, 0, 0, 1, 1,
-0.5642918, -0.1356356, -2.508863, 1, 0, 0, 1, 1,
-0.5614431, -0.1703822, -3.378774, 1, 0, 0, 1, 1,
-0.5529105, -2.964912, -4.346901, 1, 0, 0, 1, 1,
-0.5514916, 0.07273739, -1.579407, 1, 0, 0, 1, 1,
-0.5513247, 0.5171717, 0.1495903, 0, 0, 0, 1, 1,
-0.5490731, -0.7646846, -1.462673, 0, 0, 0, 1, 1,
-0.5490327, 0.5160977, -1.239604, 0, 0, 0, 1, 1,
-0.5488499, -1.952696, -4.340462, 0, 0, 0, 1, 1,
-0.5435366, 0.3742169, -1.515524, 0, 0, 0, 1, 1,
-0.5407982, 0.08627851, -0.7902901, 0, 0, 0, 1, 1,
-0.5333975, 1.268517, -1.583096, 0, 0, 0, 1, 1,
-0.5321383, -0.1613309, -1.011936, 1, 1, 1, 1, 1,
-0.5274332, -0.2115355, -3.426829, 1, 1, 1, 1, 1,
-0.5261235, 0.2184444, -0.1809775, 1, 1, 1, 1, 1,
-0.5192482, 1.111502, -1.141903, 1, 1, 1, 1, 1,
-0.5186781, -0.4509338, -2.141369, 1, 1, 1, 1, 1,
-0.5177852, 0.5863929, -2.120953, 1, 1, 1, 1, 1,
-0.5133755, -0.1308681, 0.09597399, 1, 1, 1, 1, 1,
-0.5108462, 0.3040218, 0.4339096, 1, 1, 1, 1, 1,
-0.506283, -0.3823837, -2.502865, 1, 1, 1, 1, 1,
-0.5048547, -0.2275798, -2.045412, 1, 1, 1, 1, 1,
-0.5032582, -0.04224909, -1.210028, 1, 1, 1, 1, 1,
-0.4962875, 0.7768358, -1.854973, 1, 1, 1, 1, 1,
-0.4936258, -2.088017, -3.294042, 1, 1, 1, 1, 1,
-0.4902124, 0.6194906, -0.9513627, 1, 1, 1, 1, 1,
-0.4890355, 1.649281, -0.5584903, 1, 1, 1, 1, 1,
-0.4816133, 1.399041, 0.01022052, 0, 0, 1, 1, 1,
-0.4769914, -0.7924852, -1.357649, 1, 0, 0, 1, 1,
-0.475411, -1.844861, -3.01784, 1, 0, 0, 1, 1,
-0.4744181, 0.3233463, -2.704509, 1, 0, 0, 1, 1,
-0.4739211, 0.4188507, -0.2961912, 1, 0, 0, 1, 1,
-0.4727268, 0.1535547, -3.213241, 1, 0, 0, 1, 1,
-0.4726746, 1.484597, 0.4939902, 0, 0, 0, 1, 1,
-0.470882, -0.2979801, -2.248001, 0, 0, 0, 1, 1,
-0.4686879, -1.230342, -3.855655, 0, 0, 0, 1, 1,
-0.4676684, 0.135421, -2.0755, 0, 0, 0, 1, 1,
-0.4645044, 1.171666, -2.182998, 0, 0, 0, 1, 1,
-0.4636441, 2.409761, -1.315815, 0, 0, 0, 1, 1,
-0.4552637, 0.03589911, -3.84703, 0, 0, 0, 1, 1,
-0.4543762, -0.05763931, -2.213171, 1, 1, 1, 1, 1,
-0.4538372, 0.69278, -0.8626847, 1, 1, 1, 1, 1,
-0.451513, -0.7154148, -2.889142, 1, 1, 1, 1, 1,
-0.450956, -0.3772272, -1.609399, 1, 1, 1, 1, 1,
-0.4494716, -0.2115018, -1.124067, 1, 1, 1, 1, 1,
-0.4463441, -1.935543, -3.124955, 1, 1, 1, 1, 1,
-0.4433804, -0.06556443, -2.499959, 1, 1, 1, 1, 1,
-0.4411906, 0.5810083, -2.286644, 1, 1, 1, 1, 1,
-0.4393536, -0.144603, -0.8886048, 1, 1, 1, 1, 1,
-0.4339219, -0.639043, -1.533979, 1, 1, 1, 1, 1,
-0.430723, -0.4783899, -2.58977, 1, 1, 1, 1, 1,
-0.4284783, 0.7450298, -1.803683, 1, 1, 1, 1, 1,
-0.4264836, -1.336445, -0.8633692, 1, 1, 1, 1, 1,
-0.4251029, 0.01143851, -3.000651, 1, 1, 1, 1, 1,
-0.4187746, -0.0483866, -1.465025, 1, 1, 1, 1, 1,
-0.4149286, 0.9897674, -1.008952, 0, 0, 1, 1, 1,
-0.4117936, 0.2527934, -2.02566, 1, 0, 0, 1, 1,
-0.4067309, -1.427092, -3.091579, 1, 0, 0, 1, 1,
-0.4009429, 0.3573551, -0.2068205, 1, 0, 0, 1, 1,
-0.3995793, -0.193716, 0.5235018, 1, 0, 0, 1, 1,
-0.3981992, 0.1054658, -1.01941, 1, 0, 0, 1, 1,
-0.3960675, -1.083419, -3.178642, 0, 0, 0, 1, 1,
-0.3930647, 0.1644963, -1.678093, 0, 0, 0, 1, 1,
-0.3916838, 1.03949, -0.8999217, 0, 0, 0, 1, 1,
-0.3910985, -0.7262735, -4.118124, 0, 0, 0, 1, 1,
-0.3909156, 1.341032, 1.436624, 0, 0, 0, 1, 1,
-0.3861523, 1.073384, -0.1987952, 0, 0, 0, 1, 1,
-0.3819377, -1.124501, -2.974441, 0, 0, 0, 1, 1,
-0.3810214, 0.9975023, -1.821298, 1, 1, 1, 1, 1,
-0.376951, -2.897538, -3.068474, 1, 1, 1, 1, 1,
-0.3662437, 1.241201, -1.556616, 1, 1, 1, 1, 1,
-0.3565902, -3.123972, -2.766629, 1, 1, 1, 1, 1,
-0.3546664, 0.4868026, -0.8878016, 1, 1, 1, 1, 1,
-0.3540328, -0.169266, -2.872757, 1, 1, 1, 1, 1,
-0.3529444, 0.2530439, -0.03991706, 1, 1, 1, 1, 1,
-0.3494295, 1.324128, 0.00852586, 1, 1, 1, 1, 1,
-0.3474383, -0.5144035, -4.149916, 1, 1, 1, 1, 1,
-0.3451592, -0.02785781, -2.324292, 1, 1, 1, 1, 1,
-0.3372769, 0.9939369, 0.3059193, 1, 1, 1, 1, 1,
-0.3362499, 0.2153544, 0.167393, 1, 1, 1, 1, 1,
-0.3344173, 0.3845713, -0.155205, 1, 1, 1, 1, 1,
-0.3315724, -0.1304179, -3.020127, 1, 1, 1, 1, 1,
-0.3271958, -0.01462051, -1.687583, 1, 1, 1, 1, 1,
-0.3248172, -0.1777208, -2.621986, 0, 0, 1, 1, 1,
-0.3229592, 2.101747, -0.2559181, 1, 0, 0, 1, 1,
-0.3149493, 0.5732681, -0.4587107, 1, 0, 0, 1, 1,
-0.3125968, -0.0978478, -1.575415, 1, 0, 0, 1, 1,
-0.3056483, 0.5196282, 0.06508996, 1, 0, 0, 1, 1,
-0.2987355, 0.3917338, -1.545323, 1, 0, 0, 1, 1,
-0.2966621, 1.873963, -0.6546991, 0, 0, 0, 1, 1,
-0.2941543, 1.052564, -1.692163, 0, 0, 0, 1, 1,
-0.2917569, -1.228217, -2.968102, 0, 0, 0, 1, 1,
-0.2890133, -0.8679743, -2.124491, 0, 0, 0, 1, 1,
-0.2860227, -0.9731364, -2.411255, 0, 0, 0, 1, 1,
-0.2834446, 1.145399, 0.3331079, 0, 0, 0, 1, 1,
-0.2828131, -1.619124, -3.308016, 0, 0, 0, 1, 1,
-0.276446, -0.6717293, -1.650365, 1, 1, 1, 1, 1,
-0.2745952, -0.6014664, -2.757397, 1, 1, 1, 1, 1,
-0.2742817, 0.4618132, 0.2672455, 1, 1, 1, 1, 1,
-0.2596282, -1.013248, -3.255408, 1, 1, 1, 1, 1,
-0.257917, 0.1523177, -2.427738, 1, 1, 1, 1, 1,
-0.2571262, 0.07027972, -0.9721078, 1, 1, 1, 1, 1,
-0.2543198, -0.7262411, -4.762226, 1, 1, 1, 1, 1,
-0.2496091, 0.573742, 0.4797004, 1, 1, 1, 1, 1,
-0.2476556, -0.7485379, -2.962332, 1, 1, 1, 1, 1,
-0.2400086, -0.3655694, -4.217247, 1, 1, 1, 1, 1,
-0.2364705, 0.2692674, -1.107914, 1, 1, 1, 1, 1,
-0.2364294, 0.4156124, -1.847288, 1, 1, 1, 1, 1,
-0.2346253, 0.406088, -0.6717013, 1, 1, 1, 1, 1,
-0.2345843, -0.03820229, -2.079187, 1, 1, 1, 1, 1,
-0.2318996, 0.4384392, -0.2316795, 1, 1, 1, 1, 1,
-0.2273664, -0.382719, -2.352809, 0, 0, 1, 1, 1,
-0.2262458, -1.495577, -4.456257, 1, 0, 0, 1, 1,
-0.2241055, 0.1127401, -1.382546, 1, 0, 0, 1, 1,
-0.2233687, -0.9043118, -1.331613, 1, 0, 0, 1, 1,
-0.220759, -0.363483, -3.458773, 1, 0, 0, 1, 1,
-0.2203322, -0.9614065, -3.261023, 1, 0, 0, 1, 1,
-0.2156067, -1.631756, -1.740966, 0, 0, 0, 1, 1,
-0.2131434, -0.2082364, -1.07567, 0, 0, 0, 1, 1,
-0.2125686, 0.3161671, -1.578477, 0, 0, 0, 1, 1,
-0.206476, -0.22065, -1.868176, 0, 0, 0, 1, 1,
-0.2016609, 1.750853, -0.3708939, 0, 0, 0, 1, 1,
-0.1994091, -0.1775075, -1.13735, 0, 0, 0, 1, 1,
-0.1982861, -0.1935478, -3.206228, 0, 0, 0, 1, 1,
-0.1942208, 0.944636, -0.5056689, 1, 1, 1, 1, 1,
-0.1879826, 0.03861187, -0.3588113, 1, 1, 1, 1, 1,
-0.1845585, -0.04342645, -2.14373, 1, 1, 1, 1, 1,
-0.1838378, -2.063096, -3.380256, 1, 1, 1, 1, 1,
-0.1827498, 0.281105, 0.08744678, 1, 1, 1, 1, 1,
-0.181771, -0.9279348, -1.444482, 1, 1, 1, 1, 1,
-0.1811332, 0.7256767, -0.5753462, 1, 1, 1, 1, 1,
-0.176541, 0.9673698, 0.1477314, 1, 1, 1, 1, 1,
-0.1763073, -0.5681197, -2.396929, 1, 1, 1, 1, 1,
-0.1757941, 0.1124893, 0.6747691, 1, 1, 1, 1, 1,
-0.1732482, 1.919678, -0.5722569, 1, 1, 1, 1, 1,
-0.1724905, 0.3881867, 0.6493129, 1, 1, 1, 1, 1,
-0.1697674, -0.6994486, -4.232752, 1, 1, 1, 1, 1,
-0.1669617, -0.2364098, -1.730205, 1, 1, 1, 1, 1,
-0.1583003, -1.894251, -3.267483, 1, 1, 1, 1, 1,
-0.1573454, 0.06512346, -2.464646, 0, 0, 1, 1, 1,
-0.1505493, -1.984787, -4.2132, 1, 0, 0, 1, 1,
-0.1497029, -0.8715189, -4.669803, 1, 0, 0, 1, 1,
-0.1485626, -0.4421242, -3.931198, 1, 0, 0, 1, 1,
-0.1464513, 0.0964789, -1.642624, 1, 0, 0, 1, 1,
-0.1453486, 0.3219719, 0.173509, 1, 0, 0, 1, 1,
-0.1427722, -1.064437, -4.365246, 0, 0, 0, 1, 1,
-0.1417957, 1.253886, -0.3316426, 0, 0, 0, 1, 1,
-0.14041, 0.4327385, 0.1040758, 0, 0, 0, 1, 1,
-0.1388795, -0.9444019, -4.015713, 0, 0, 0, 1, 1,
-0.1380902, -2.762665, -1.425994, 0, 0, 0, 1, 1,
-0.1331661, -0.6892103, -3.007484, 0, 0, 0, 1, 1,
-0.1328104, -1.242296, -2.764096, 0, 0, 0, 1, 1,
-0.13274, -1.305453, -3.170057, 1, 1, 1, 1, 1,
-0.131193, -0.8443855, -3.388253, 1, 1, 1, 1, 1,
-0.1291817, 1.057615, -0.1365541, 1, 1, 1, 1, 1,
-0.1283238, 1.186549, -1.312534, 1, 1, 1, 1, 1,
-0.1234137, -0.6770799, -2.728675, 1, 1, 1, 1, 1,
-0.1233997, 0.6333719, 1.18763, 1, 1, 1, 1, 1,
-0.118219, 0.1210958, -0.367416, 1, 1, 1, 1, 1,
-0.115673, -0.009265414, -1.658512, 1, 1, 1, 1, 1,
-0.1095395, -1.550165, -4.381466, 1, 1, 1, 1, 1,
-0.1094889, 0.03888443, -1.457833, 1, 1, 1, 1, 1,
-0.1093534, 0.1647747, -3.125757, 1, 1, 1, 1, 1,
-0.100769, -1.159779, -2.646587, 1, 1, 1, 1, 1,
-0.1006842, -0.9173746, -2.304211, 1, 1, 1, 1, 1,
-0.09538547, -0.5313157, -3.518533, 1, 1, 1, 1, 1,
-0.09517898, -1.443454, -4.532078, 1, 1, 1, 1, 1,
-0.09361091, -0.8625155, -3.013754, 0, 0, 1, 1, 1,
-0.09327947, -0.3052497, -2.294316, 1, 0, 0, 1, 1,
-0.0916567, 0.0774191, 0.7450122, 1, 0, 0, 1, 1,
-0.08596966, 1.47765, -1.255633, 1, 0, 0, 1, 1,
-0.08495936, -1.244227, -2.912858, 1, 0, 0, 1, 1,
-0.08343352, -0.9245983, -4.246388, 1, 0, 0, 1, 1,
-0.08255462, -1.791289, -3.492545, 0, 0, 0, 1, 1,
-0.08208618, 1.587299, -1.54772, 0, 0, 0, 1, 1,
-0.08074364, 0.08251433, 1.519299, 0, 0, 0, 1, 1,
-0.0794177, -0.8928224, -0.4224293, 0, 0, 0, 1, 1,
-0.07883732, -0.1651041, -2.584123, 0, 0, 0, 1, 1,
-0.07688629, -1.095143, -3.422189, 0, 0, 0, 1, 1,
-0.07266261, -1.003594, -3.401431, 0, 0, 0, 1, 1,
-0.06811919, 2.435074, 1.296669, 1, 1, 1, 1, 1,
-0.06450856, -1.725417, -2.239456, 1, 1, 1, 1, 1,
-0.06423936, -1.508323, -3.822314, 1, 1, 1, 1, 1,
-0.06147214, -0.3344634, -3.814977, 1, 1, 1, 1, 1,
-0.0595501, 0.8004701, 1.21809, 1, 1, 1, 1, 1,
-0.05766195, 1.9704, 0.04639041, 1, 1, 1, 1, 1,
-0.05542, -0.6386515, -1.141042, 1, 1, 1, 1, 1,
-0.05456679, 2.994978, -0.1140144, 1, 1, 1, 1, 1,
-0.05229556, -0.3902681, -0.7132494, 1, 1, 1, 1, 1,
-0.05174772, -0.0127026, -0.8257896, 1, 1, 1, 1, 1,
-0.04731668, -0.9198822, -3.011876, 1, 1, 1, 1, 1,
-0.0471033, 0.009404085, -1.375653, 1, 1, 1, 1, 1,
-0.04543237, 0.3253338, 1.751097, 1, 1, 1, 1, 1,
-0.04471582, -0.2189296, -2.089396, 1, 1, 1, 1, 1,
-0.03958108, -0.1705697, -2.647747, 1, 1, 1, 1, 1,
-0.03953461, 1.073035, 1.568491, 0, 0, 1, 1, 1,
-0.03013902, -0.8381526, -2.164889, 1, 0, 0, 1, 1,
-0.02496725, -0.381987, -3.902036, 1, 0, 0, 1, 1,
-0.02369064, 1.196905, 1.124128, 1, 0, 0, 1, 1,
-0.02065777, -1.67733, -1.488795, 1, 0, 0, 1, 1,
-0.0173768, -1.347885, -1.638856, 1, 0, 0, 1, 1,
-0.01316787, 0.6975359, 0.6806803, 0, 0, 0, 1, 1,
-0.01168077, 1.700902, -0.2414586, 0, 0, 0, 1, 1,
-0.01058842, 0.07707674, 0.6450412, 0, 0, 0, 1, 1,
-0.01040975, -0.5047787, -4.777468, 0, 0, 0, 1, 1,
-0.00933629, 0.01420053, -0.154079, 0, 0, 0, 1, 1,
-0.005355447, -0.8119019, -1.174806, 0, 0, 0, 1, 1,
-0.0007449099, -1.28133, -3.760956, 0, 0, 0, 1, 1,
0.001392518, -0.3794195, 5.17049, 1, 1, 1, 1, 1,
0.001518099, 0.2338943, 0.1405238, 1, 1, 1, 1, 1,
0.002395181, -0.8231341, 3.511009, 1, 1, 1, 1, 1,
0.003069018, -0.2806939, 3.365834, 1, 1, 1, 1, 1,
0.006868419, -1.446418, 4.598897, 1, 1, 1, 1, 1,
0.007041728, 0.0448091, 1.449761, 1, 1, 1, 1, 1,
0.008911864, 1.225341, -0.3352951, 1, 1, 1, 1, 1,
0.009139521, -0.522293, 1.182798, 1, 1, 1, 1, 1,
0.009646716, -0.4709066, 2.323491, 1, 1, 1, 1, 1,
0.009841328, 1.451893, 0.4844143, 1, 1, 1, 1, 1,
0.01075244, -0.8585261, 3.293154, 1, 1, 1, 1, 1,
0.0111202, 0.4478151, -0.07699995, 1, 1, 1, 1, 1,
0.01152579, 0.4206157, -0.7465428, 1, 1, 1, 1, 1,
0.0141311, 0.9731619, -0.8769231, 1, 1, 1, 1, 1,
0.01488482, -1.027748, 4.645977, 1, 1, 1, 1, 1,
0.01506528, 0.6607707, -0.1290019, 0, 0, 1, 1, 1,
0.01851936, 1.192681, 0.4829756, 1, 0, 0, 1, 1,
0.01935599, -2.978496, 3.575659, 1, 0, 0, 1, 1,
0.02043214, -0.5274454, 2.975503, 1, 0, 0, 1, 1,
0.02299813, 0.7788665, 1.328088, 1, 0, 0, 1, 1,
0.02507741, 0.1662261, -0.4825529, 1, 0, 0, 1, 1,
0.02789601, -0.7563004, 2.994465, 0, 0, 0, 1, 1,
0.028057, 1.556784, 0.3959426, 0, 0, 0, 1, 1,
0.03087482, -0.8363235, 3.412964, 0, 0, 0, 1, 1,
0.03194232, -0.8840203, 4.678618, 0, 0, 0, 1, 1,
0.03833615, 0.2836567, -1.256816, 0, 0, 0, 1, 1,
0.04185757, -0.004269596, 1.208659, 0, 0, 0, 1, 1,
0.04199395, 0.5300136, 0.2823896, 0, 0, 0, 1, 1,
0.0461692, 0.9951257, -0.1035678, 1, 1, 1, 1, 1,
0.04865171, -0.8838039, 3.77467, 1, 1, 1, 1, 1,
0.05296822, 1.695121, -0.4721072, 1, 1, 1, 1, 1,
0.05337873, -0.9019216, 2.447652, 1, 1, 1, 1, 1,
0.0536651, 0.3951642, 0.3965235, 1, 1, 1, 1, 1,
0.05855968, -0.2566488, 3.000945, 1, 1, 1, 1, 1,
0.06007465, -1.302124, 3.112607, 1, 1, 1, 1, 1,
0.06259772, 1.911108, 0.1682215, 1, 1, 1, 1, 1,
0.06677457, 0.4550833, 1.347712, 1, 1, 1, 1, 1,
0.06755061, -0.6517906, 4.630874, 1, 1, 1, 1, 1,
0.06759092, 1.089908, -0.04630731, 1, 1, 1, 1, 1,
0.07308146, 0.1743986, -0.846148, 1, 1, 1, 1, 1,
0.07548855, 1.168498, -1.268824, 1, 1, 1, 1, 1,
0.0829395, 0.8334643, 1.363574, 1, 1, 1, 1, 1,
0.08700223, 0.1234767, 1.053747, 1, 1, 1, 1, 1,
0.08730882, -0.357325, 1.947286, 0, 0, 1, 1, 1,
0.09056092, 2.282643, -0.5557532, 1, 0, 0, 1, 1,
0.09658557, -2.29543, 3.214123, 1, 0, 0, 1, 1,
0.09852838, 0.2483052, 1.854981, 1, 0, 0, 1, 1,
0.1043955, 1.910849, 0.3458848, 1, 0, 0, 1, 1,
0.118394, -0.4408417, 3.362416, 1, 0, 0, 1, 1,
0.1224409, -0.3112109, 3.599921, 0, 0, 0, 1, 1,
0.1224997, -0.7681985, 2.948209, 0, 0, 0, 1, 1,
0.1265631, 0.8164824, 0.3566156, 0, 0, 0, 1, 1,
0.1266796, -0.5604005, 3.454329, 0, 0, 0, 1, 1,
0.1272456, 0.03209779, 0.9585121, 0, 0, 0, 1, 1,
0.1297661, -0.9506757, 2.8175, 0, 0, 0, 1, 1,
0.1306249, 0.2734649, -1.2104, 0, 0, 0, 1, 1,
0.1329111, 1.094513, 0.5393168, 1, 1, 1, 1, 1,
0.1421343, 0.06023753, 0.8935034, 1, 1, 1, 1, 1,
0.1449693, -0.3058982, 1.759926, 1, 1, 1, 1, 1,
0.145453, 0.5921412, 2.338972, 1, 1, 1, 1, 1,
0.1459307, 0.1912021, 0.5324807, 1, 1, 1, 1, 1,
0.1532805, 0.0003105364, 1.352469, 1, 1, 1, 1, 1,
0.1532866, 0.4498796, 1.267818, 1, 1, 1, 1, 1,
0.1539113, -0.1317909, 1.530903, 1, 1, 1, 1, 1,
0.1563012, 0.8021272, -1.878761, 1, 1, 1, 1, 1,
0.1566478, -0.02227348, 1.27517, 1, 1, 1, 1, 1,
0.15695, 0.4268969, 0.4462888, 1, 1, 1, 1, 1,
0.1627715, 1.375211, 0.4695918, 1, 1, 1, 1, 1,
0.1634664, -0.9530063, 4.118804, 1, 1, 1, 1, 1,
0.1641756, 1.794388, 1.064487, 1, 1, 1, 1, 1,
0.1643064, -0.299386, 2.695946, 1, 1, 1, 1, 1,
0.1684426, 1.107735, -0.01935355, 0, 0, 1, 1, 1,
0.1698517, -1.595216, 1.588045, 1, 0, 0, 1, 1,
0.1707173, 0.1972805, 0.1136845, 1, 0, 0, 1, 1,
0.1712245, 1.368459, -0.04851878, 1, 0, 0, 1, 1,
0.1799245, 0.668695, 0.7569932, 1, 0, 0, 1, 1,
0.1893931, -0.6006303, 4.80495, 1, 0, 0, 1, 1,
0.1913355, -0.009162197, 1.119982, 0, 0, 0, 1, 1,
0.1937173, 0.1288992, 0.1978864, 0, 0, 0, 1, 1,
0.197654, -0.6180903, 2.973835, 0, 0, 0, 1, 1,
0.1978455, 0.4907184, -0.7819789, 0, 0, 0, 1, 1,
0.198091, 0.5178247, 1.371645, 0, 0, 0, 1, 1,
0.1987853, 2.258703, -1.613937, 0, 0, 0, 1, 1,
0.2001473, 0.6366668, 0.06248238, 0, 0, 0, 1, 1,
0.2016982, -2.066297, 2.61547, 1, 1, 1, 1, 1,
0.202371, -1.137964, 1.324759, 1, 1, 1, 1, 1,
0.2033858, 0.4722984, 1.18516, 1, 1, 1, 1, 1,
0.2087236, 2.595174, 0.2922494, 1, 1, 1, 1, 1,
0.2087258, -0.8578821, 3.261883, 1, 1, 1, 1, 1,
0.2116447, -0.8197824, 1.133991, 1, 1, 1, 1, 1,
0.2138084, 0.8596088, -0.6319306, 1, 1, 1, 1, 1,
0.2138292, 1.351443, 0.2155976, 1, 1, 1, 1, 1,
0.216521, -0.7955376, 3.042898, 1, 1, 1, 1, 1,
0.2166474, -0.7150033, 2.369638, 1, 1, 1, 1, 1,
0.2228261, -1.184183, 4.31313, 1, 1, 1, 1, 1,
0.2322769, -0.1984469, 3.713137, 1, 1, 1, 1, 1,
0.2336351, 1.448414, 1.278257, 1, 1, 1, 1, 1,
0.2362415, -0.5414429, 2.598455, 1, 1, 1, 1, 1,
0.2489007, 1.241493, 1.271471, 1, 1, 1, 1, 1,
0.2513093, -0.7048237, 2.09236, 0, 0, 1, 1, 1,
0.2517084, 0.2832605, -0.09193091, 1, 0, 0, 1, 1,
0.2561274, 0.6228867, -0.3604876, 1, 0, 0, 1, 1,
0.2595796, -1.423385, 3.654488, 1, 0, 0, 1, 1,
0.2635602, 2.028007, -1.58207, 1, 0, 0, 1, 1,
0.2638971, -0.001112671, 1.221908, 1, 0, 0, 1, 1,
0.2661831, 0.1212307, 0.7980769, 0, 0, 0, 1, 1,
0.2662006, 0.0866859, 3.001413, 0, 0, 0, 1, 1,
0.2772811, 0.6045654, 0.4963663, 0, 0, 0, 1, 1,
0.2773714, 1.186311, -0.6772603, 0, 0, 0, 1, 1,
0.2794462, -0.2395824, 0.7976118, 0, 0, 0, 1, 1,
0.2815845, -1.62121, 2.434056, 0, 0, 0, 1, 1,
0.285118, -0.9875478, 4.218521, 0, 0, 0, 1, 1,
0.2880355, -0.9205838, 2.84921, 1, 1, 1, 1, 1,
0.288134, 0.5300734, 1.703962, 1, 1, 1, 1, 1,
0.2925647, -1.907655, 2.277019, 1, 1, 1, 1, 1,
0.292853, 1.672649, 0.6357319, 1, 1, 1, 1, 1,
0.2943796, -0.1649697, 3.611339, 1, 1, 1, 1, 1,
0.2949346, -0.2118998, 2.169214, 1, 1, 1, 1, 1,
0.295422, 0.3778364, 1.969036, 1, 1, 1, 1, 1,
0.2963195, -1.54167, 3.421579, 1, 1, 1, 1, 1,
0.3019264, -0.2526783, 2.171266, 1, 1, 1, 1, 1,
0.3104201, 0.3502743, 0.6406547, 1, 1, 1, 1, 1,
0.3114619, -1.540213, 3.432784, 1, 1, 1, 1, 1,
0.3136708, 0.914966, 0.2859272, 1, 1, 1, 1, 1,
0.3163888, -0.41815, 1.583612, 1, 1, 1, 1, 1,
0.3186584, -0.2535736, 0.4700629, 1, 1, 1, 1, 1,
0.3257842, -0.9549865, 0.8955526, 1, 1, 1, 1, 1,
0.3352326, -0.566486, 3.650632, 0, 0, 1, 1, 1,
0.3367092, 2.063463, -0.5517471, 1, 0, 0, 1, 1,
0.3401854, 0.1310429, 1.190926, 1, 0, 0, 1, 1,
0.3454465, -1.414593, 2.690387, 1, 0, 0, 1, 1,
0.3466052, 0.1234396, 0.1823537, 1, 0, 0, 1, 1,
0.3497257, -0.5404948, 0.91219, 1, 0, 0, 1, 1,
0.3531828, -0.04759341, 0.9810932, 0, 0, 0, 1, 1,
0.3543412, -0.2191878, 2.277987, 0, 0, 0, 1, 1,
0.3553779, -0.7475722, 2.425032, 0, 0, 0, 1, 1,
0.3575287, -1.276637, 3.588068, 0, 0, 0, 1, 1,
0.3590309, -0.7875138, 1.109166, 0, 0, 0, 1, 1,
0.3595865, -1.474961, 4.653183, 0, 0, 0, 1, 1,
0.3627975, -0.5992125, 1.906924, 0, 0, 0, 1, 1,
0.3655423, -1.554283, 2.90077, 1, 1, 1, 1, 1,
0.3671063, -0.2796361, 1.378908, 1, 1, 1, 1, 1,
0.3703621, 1.119318, -0.2903808, 1, 1, 1, 1, 1,
0.3711374, -0.7292831, 2.449708, 1, 1, 1, 1, 1,
0.3719011, 2.413169, 0.9390925, 1, 1, 1, 1, 1,
0.3719362, -0.3377956, 1.233961, 1, 1, 1, 1, 1,
0.372803, -0.252827, 2.342852, 1, 1, 1, 1, 1,
0.3752879, 0.3576728, 1.801423, 1, 1, 1, 1, 1,
0.3803781, 1.467329, 1.141601, 1, 1, 1, 1, 1,
0.3818138, -0.7818066, 2.819995, 1, 1, 1, 1, 1,
0.3823573, -2.277319, 4.116824, 1, 1, 1, 1, 1,
0.3827934, 0.2820315, 2.181775, 1, 1, 1, 1, 1,
0.3831432, 0.5653872, 1.190355, 1, 1, 1, 1, 1,
0.3839479, 0.414901, 0.3181501, 1, 1, 1, 1, 1,
0.3888575, 0.8561482, 1.085974, 1, 1, 1, 1, 1,
0.3901824, 1.373062, 0.06880847, 0, 0, 1, 1, 1,
0.3929659, 1.097057, 2.935415, 1, 0, 0, 1, 1,
0.3931764, -0.2727579, 0.9923232, 1, 0, 0, 1, 1,
0.3952259, -1.571214, 1.719821, 1, 0, 0, 1, 1,
0.3963084, 0.5590528, 2.178467, 1, 0, 0, 1, 1,
0.4019046, -0.9719118, 5.219145, 1, 0, 0, 1, 1,
0.4021088, -0.03191769, 2.823728, 0, 0, 0, 1, 1,
0.4050305, -0.1850152, 2.917843, 0, 0, 0, 1, 1,
0.4084007, 0.674095, -0.1162758, 0, 0, 0, 1, 1,
0.4101963, -1.13367, 1.779454, 0, 0, 0, 1, 1,
0.411193, -1.752256, 2.125524, 0, 0, 0, 1, 1,
0.4150016, -0.1720333, 1.28689, 0, 0, 0, 1, 1,
0.4158476, 0.460196, 0.6992415, 0, 0, 0, 1, 1,
0.4197663, 2.132081, -0.8746637, 1, 1, 1, 1, 1,
0.4230678, -2.327002, 3.93703, 1, 1, 1, 1, 1,
0.4259961, 1.78606, 1.221835, 1, 1, 1, 1, 1,
0.4267136, 0.04346675, 3.232373, 1, 1, 1, 1, 1,
0.435601, 1.192113, -0.07590486, 1, 1, 1, 1, 1,
0.4410655, 0.3554398, -0.8868583, 1, 1, 1, 1, 1,
0.4431722, 0.8040578, 0.4707565, 1, 1, 1, 1, 1,
0.4474877, 0.1892178, -0.4417934, 1, 1, 1, 1, 1,
0.4487376, 2.057139, 0.9431999, 1, 1, 1, 1, 1,
0.4491856, 0.7477789, -0.5667187, 1, 1, 1, 1, 1,
0.4512788, -1.090489, 3.702769, 1, 1, 1, 1, 1,
0.4551001, -0.66245, 3.865493, 1, 1, 1, 1, 1,
0.4604533, 0.08062402, 1.071535, 1, 1, 1, 1, 1,
0.4637521, 0.9167459, -0.6566641, 1, 1, 1, 1, 1,
0.4637705, 2.631735, 0.45182, 1, 1, 1, 1, 1,
0.4728099, 2.676579, -1.149071, 0, 0, 1, 1, 1,
0.4732133, -0.3907613, 1.914557, 1, 0, 0, 1, 1,
0.4733405, -0.06079001, -0.222178, 1, 0, 0, 1, 1,
0.4752382, -0.6502538, 2.957956, 1, 0, 0, 1, 1,
0.4759075, 0.575651, 1.638461, 1, 0, 0, 1, 1,
0.488822, -0.3541554, 2.233538, 1, 0, 0, 1, 1,
0.4928672, 0.07965095, 1.245549, 0, 0, 0, 1, 1,
0.4954799, 0.02937451, 1.018773, 0, 0, 0, 1, 1,
0.4997509, 0.4373842, 0.1096517, 0, 0, 0, 1, 1,
0.5006785, -0.427862, 1.581944, 0, 0, 0, 1, 1,
0.501516, -2.257922, 2.0396, 0, 0, 0, 1, 1,
0.5113964, -0.5384164, 1.867782, 0, 0, 0, 1, 1,
0.5120678, -0.09664459, 0.5061328, 0, 0, 0, 1, 1,
0.5216254, -1.303356, 2.075178, 1, 1, 1, 1, 1,
0.5217459, 1.231972, 1.616114, 1, 1, 1, 1, 1,
0.5220056, -1.184195, 3.559384, 1, 1, 1, 1, 1,
0.5222551, -0.9159202, 3.365128, 1, 1, 1, 1, 1,
0.5227373, -0.5716868, 1.999989, 1, 1, 1, 1, 1,
0.5233651, 0.1231363, 2.244369, 1, 1, 1, 1, 1,
0.5280471, 1.366561, 0.9141635, 1, 1, 1, 1, 1,
0.5284668, 0.6623787, 0.6499003, 1, 1, 1, 1, 1,
0.5317923, 1.561024, 0.04661445, 1, 1, 1, 1, 1,
0.5359999, -0.4545847, 2.735546, 1, 1, 1, 1, 1,
0.541996, 0.4247493, -0.3513684, 1, 1, 1, 1, 1,
0.5445695, -1.974038, 4.28955, 1, 1, 1, 1, 1,
0.5465217, 1.048699, 1.228569, 1, 1, 1, 1, 1,
0.5474092, 1.238146, 0.01109793, 1, 1, 1, 1, 1,
0.5498801, 1.909736, 0.6923593, 1, 1, 1, 1, 1,
0.5503177, -0.3024615, 0.3879803, 0, 0, 1, 1, 1,
0.5521574, 0.6444046, -0.5921553, 1, 0, 0, 1, 1,
0.5549758, -0.01387152, 2.424826, 1, 0, 0, 1, 1,
0.556197, -0.8546908, 3.363055, 1, 0, 0, 1, 1,
0.5567439, 0.3653578, 2.246099, 1, 0, 0, 1, 1,
0.5568335, -1.053401, 3.674795, 1, 0, 0, 1, 1,
0.5610977, -0.09541643, 2.281194, 0, 0, 0, 1, 1,
0.5640418, 1.477923, 0.1834091, 0, 0, 0, 1, 1,
0.5687647, 0.3212725, 1.328167, 0, 0, 0, 1, 1,
0.5714064, -2.175084, 2.83066, 0, 0, 0, 1, 1,
0.5775706, -0.0009756098, 0.8484493, 0, 0, 0, 1, 1,
0.581536, -1.372627, 2.625118, 0, 0, 0, 1, 1,
0.5827648, -1.226848, 1.76881, 0, 0, 0, 1, 1,
0.5838631, 1.294898, -0.1763307, 1, 1, 1, 1, 1,
0.5914543, 0.06189115, 1.09331, 1, 1, 1, 1, 1,
0.5931596, -0.5985593, 2.568112, 1, 1, 1, 1, 1,
0.5960333, 0.334418, 0.2742645, 1, 1, 1, 1, 1,
0.6072707, -1.099356, 2.175049, 1, 1, 1, 1, 1,
0.6126733, -0.1004696, 1.556984, 1, 1, 1, 1, 1,
0.613153, -0.7630017, 4.642521, 1, 1, 1, 1, 1,
0.6147205, 0.815576, 1.147133, 1, 1, 1, 1, 1,
0.6173023, -2.333504, 3.375743, 1, 1, 1, 1, 1,
0.6187184, 0.3390132, 0.05689086, 1, 1, 1, 1, 1,
0.6195853, 0.07787386, 0.6706149, 1, 1, 1, 1, 1,
0.6198077, -0.8535566, 3.004388, 1, 1, 1, 1, 1,
0.6207716, -1.301797, 4.218446, 1, 1, 1, 1, 1,
0.6313879, 1.416433, 0.9751475, 1, 1, 1, 1, 1,
0.6316196, 0.8441069, 2.259222, 1, 1, 1, 1, 1,
0.6317685, -1.056164, 1.082796, 0, 0, 1, 1, 1,
0.6379095, 0.5963086, 0.1972545, 1, 0, 0, 1, 1,
0.6396633, -0.2342017, 3.338588, 1, 0, 0, 1, 1,
0.6402465, -1.455627, 4.657382, 1, 0, 0, 1, 1,
0.6416056, 1.397835, -0.4740615, 1, 0, 0, 1, 1,
0.6436115, 1.012547, 1.225684, 1, 0, 0, 1, 1,
0.6442518, 0.1259142, 2.021248, 0, 0, 0, 1, 1,
0.6548352, 1.257069, -0.4597729, 0, 0, 0, 1, 1,
0.6564592, 0.250821, 2.571079, 0, 0, 0, 1, 1,
0.6616216, 0.7982628, 1.823615, 0, 0, 0, 1, 1,
0.6638219, 0.2930467, -0.1058374, 0, 0, 0, 1, 1,
0.6676695, 0.9213826, 2.138066, 0, 0, 0, 1, 1,
0.6745505, 0.3067455, 1.530185, 0, 0, 0, 1, 1,
0.6850779, -3.319978, 2.586703, 1, 1, 1, 1, 1,
0.6873828, -0.03479225, 0.3044951, 1, 1, 1, 1, 1,
0.6878622, -1.123914, 2.900058, 1, 1, 1, 1, 1,
0.6881443, 0.388365, 1.649742, 1, 1, 1, 1, 1,
0.6929272, 1.35109, 1.041723, 1, 1, 1, 1, 1,
0.6931822, -0.62454, 3.121524, 1, 1, 1, 1, 1,
0.6948564, 1.384, 0.04018696, 1, 1, 1, 1, 1,
0.6998891, -0.8223251, 3.001547, 1, 1, 1, 1, 1,
0.7026337, 1.337703, 1.207511, 1, 1, 1, 1, 1,
0.7094964, -0.4181597, 1.699444, 1, 1, 1, 1, 1,
0.7159059, 1.014574, 1.809332, 1, 1, 1, 1, 1,
0.7270126, -2.171808, 3.736011, 1, 1, 1, 1, 1,
0.7307654, 1.594833, 0.4520505, 1, 1, 1, 1, 1,
0.7311336, 1.556421, -0.5738209, 1, 1, 1, 1, 1,
0.7363126, -1.419349, 2.804017, 1, 1, 1, 1, 1,
0.7365234, -0.8897672, 2.410993, 0, 0, 1, 1, 1,
0.7376154, 0.1630671, 1.545614, 1, 0, 0, 1, 1,
0.7434983, -0.8897478, 2.622485, 1, 0, 0, 1, 1,
0.7445562, -0.692997, 1.849643, 1, 0, 0, 1, 1,
0.7524636, -2.087785, 1.265994, 1, 0, 0, 1, 1,
0.7528777, -1.178807, 1.85986, 1, 0, 0, 1, 1,
0.7571175, 1.25112, 1.559405, 0, 0, 0, 1, 1,
0.7592564, -0.5176917, 1.571672, 0, 0, 0, 1, 1,
0.7596458, -0.6827303, 2.781188, 0, 0, 0, 1, 1,
0.7634881, 0.1421468, 1.300398, 0, 0, 0, 1, 1,
0.7707613, 1.292643, -1.428588, 0, 0, 0, 1, 1,
0.7746898, -0.8215889, 2.698483, 0, 0, 0, 1, 1,
0.7784077, 0.250645, 2.080048, 0, 0, 0, 1, 1,
0.7873578, 1.821982, -1.027472, 1, 1, 1, 1, 1,
0.7937045, 1.087391, -0.3172474, 1, 1, 1, 1, 1,
0.7950001, -0.5765676, 2.622728, 1, 1, 1, 1, 1,
0.8051653, 0.7768716, 0.3941644, 1, 1, 1, 1, 1,
0.8122047, 0.03228353, 1.188836, 1, 1, 1, 1, 1,
0.8183778, 1.353495, -0.94586, 1, 1, 1, 1, 1,
0.8261541, 1.386438, 0.09666292, 1, 1, 1, 1, 1,
0.8288421, -0.03730131, 2.764571, 1, 1, 1, 1, 1,
0.8316156, 0.7343847, 0.7133872, 1, 1, 1, 1, 1,
0.8325585, -1.36577, 2.115524, 1, 1, 1, 1, 1,
0.832925, -1.12089, 2.281574, 1, 1, 1, 1, 1,
0.8345724, 0.4504759, 1.189853, 1, 1, 1, 1, 1,
0.8383093, -0.4867804, 1.873055, 1, 1, 1, 1, 1,
0.8389971, 1.386959, -1.740887, 1, 1, 1, 1, 1,
0.8400921, 0.3511221, 1.536807, 1, 1, 1, 1, 1,
0.8440202, -0.3691052, 1.500805, 0, 0, 1, 1, 1,
0.844224, 0.1917178, 1.1353, 1, 0, 0, 1, 1,
0.8450733, -0.02244602, -0.2522282, 1, 0, 0, 1, 1,
0.8480842, 0.4407876, 0.8517495, 1, 0, 0, 1, 1,
0.850278, -0.6886876, 0.6020213, 1, 0, 0, 1, 1,
0.8519966, -1.240379, 1.174817, 1, 0, 0, 1, 1,
0.8543301, 1.071971, 1.134647, 0, 0, 0, 1, 1,
0.8558905, -0.5791728, -0.03812868, 0, 0, 0, 1, 1,
0.8651404, 1.413936, -1.236548, 0, 0, 0, 1, 1,
0.880227, 0.6314304, 0.6588106, 0, 0, 0, 1, 1,
0.8893775, -0.2905498, 0.5843429, 0, 0, 0, 1, 1,
0.8980826, -1.644283, 2.293098, 0, 0, 0, 1, 1,
0.9023985, 0.06457241, 2.086495, 0, 0, 0, 1, 1,
0.9045619, -0.08088703, 2.194664, 1, 1, 1, 1, 1,
0.9064261, 0.34155, 0.6016236, 1, 1, 1, 1, 1,
0.9069946, 0.3622793, -0.01021651, 1, 1, 1, 1, 1,
0.9087645, 0.2411636, 1.604057, 1, 1, 1, 1, 1,
0.9147215, -0.1407452, 2.731469, 1, 1, 1, 1, 1,
0.9164665, -0.7225475, 2.729576, 1, 1, 1, 1, 1,
0.9179465, 1.201495, 1.136799, 1, 1, 1, 1, 1,
0.9188253, 0.1158151, 1.753611, 1, 1, 1, 1, 1,
0.920921, 0.2423254, 3.942674, 1, 1, 1, 1, 1,
0.9221146, -0.2625453, 1.995817, 1, 1, 1, 1, 1,
0.9269431, 0.357873, 1.731139, 1, 1, 1, 1, 1,
0.9357868, 0.2581595, 2.041608, 1, 1, 1, 1, 1,
0.9358554, 0.1962332, 2.17229, 1, 1, 1, 1, 1,
0.9461269, 0.04775667, 0.4236968, 1, 1, 1, 1, 1,
0.9533188, -1.053445, 3.9937, 1, 1, 1, 1, 1,
0.9555127, -0.2991667, 2.719242, 0, 0, 1, 1, 1,
0.9562498, -0.6997333, 1.977733, 1, 0, 0, 1, 1,
0.9608436, 0.3305839, 1.624683, 1, 0, 0, 1, 1,
0.9612424, 0.7684293, 1.805572, 1, 0, 0, 1, 1,
0.9655591, 0.6449814, -0.05589029, 1, 0, 0, 1, 1,
0.9659694, 0.3747395, 1.100258, 1, 0, 0, 1, 1,
0.9713982, -0.5640364, 2.693287, 0, 0, 0, 1, 1,
0.9779552, -2.135493, 2.659745, 0, 0, 0, 1, 1,
0.9791099, -2.28217, 1.487816, 0, 0, 0, 1, 1,
0.9822413, 0.1713858, 1.89326, 0, 0, 0, 1, 1,
0.9854025, -0.009561638, 0.633531, 0, 0, 0, 1, 1,
0.9872527, 0.6666076, 1.075778, 0, 0, 0, 1, 1,
0.9874586, -0.9244173, 3.41778, 0, 0, 0, 1, 1,
0.9895273, -0.009026065, 2.655412, 1, 1, 1, 1, 1,
0.9897775, 0.830108, -1.168452, 1, 1, 1, 1, 1,
1.001625, 0.4576924, 2.830466, 1, 1, 1, 1, 1,
1.007862, 0.4073397, 0.5471408, 1, 1, 1, 1, 1,
1.009194, 0.7539313, 2.627954, 1, 1, 1, 1, 1,
1.009532, 1.709909, 0.4427339, 1, 1, 1, 1, 1,
1.012033, 0.5868074, -0.2593829, 1, 1, 1, 1, 1,
1.018572, 0.03403892, 0.5765384, 1, 1, 1, 1, 1,
1.021781, 1.535874, 0.0924489, 1, 1, 1, 1, 1,
1.026382, -0.8167377, 2.242459, 1, 1, 1, 1, 1,
1.026851, -1.138263, 4.011351, 1, 1, 1, 1, 1,
1.033323, -2.038748, 4.10557, 1, 1, 1, 1, 1,
1.034025, -0.7884328, 4.690487, 1, 1, 1, 1, 1,
1.039814, 0.2160677, 1.11012, 1, 1, 1, 1, 1,
1.042706, 2.405655, 1.053073, 1, 1, 1, 1, 1,
1.048208, -0.593402, 2.882102, 0, 0, 1, 1, 1,
1.049753, 0.1701702, 1.259893, 1, 0, 0, 1, 1,
1.053153, -0.8570879, 3.084518, 1, 0, 0, 1, 1,
1.055472, -0.8760588, 3.760331, 1, 0, 0, 1, 1,
1.061777, 1.234367, 0.819522, 1, 0, 0, 1, 1,
1.064447, -1.893052, 3.351623, 1, 0, 0, 1, 1,
1.06697, -1.183336, 2.554403, 0, 0, 0, 1, 1,
1.07278, 0.4493895, 0.6480771, 0, 0, 0, 1, 1,
1.079059, -1.822047, 1.34062, 0, 0, 0, 1, 1,
1.087351, 0.02977901, 2.283787, 0, 0, 0, 1, 1,
1.090794, -0.09122951, 2.236766, 0, 0, 0, 1, 1,
1.092635, -1.222672, 1.158585, 0, 0, 0, 1, 1,
1.093359, 2.713019, 1.645801, 0, 0, 0, 1, 1,
1.093421, 0.6610642, 1.551289, 1, 1, 1, 1, 1,
1.116128, -1.927472, 2.819766, 1, 1, 1, 1, 1,
1.12232, -0.8005152, 3.629375, 1, 1, 1, 1, 1,
1.12241, -0.8484487, 2.146424, 1, 1, 1, 1, 1,
1.126071, 0.1405641, 1.665566, 1, 1, 1, 1, 1,
1.127725, -0.07517752, 0.7364357, 1, 1, 1, 1, 1,
1.128092, 0.4018686, 1.57637, 1, 1, 1, 1, 1,
1.130665, 0.3528768, 1.37321, 1, 1, 1, 1, 1,
1.139585, 0.4448469, 1.205207, 1, 1, 1, 1, 1,
1.146846, -2.505305, 3.213151, 1, 1, 1, 1, 1,
1.147541, -1.22662, 3.205755, 1, 1, 1, 1, 1,
1.148946, 1.461395, -1.249755, 1, 1, 1, 1, 1,
1.151676, -0.7431275, 0.6342378, 1, 1, 1, 1, 1,
1.153948, -0.5605378, 2.503892, 1, 1, 1, 1, 1,
1.157202, -0.2936124, 1.459078, 1, 1, 1, 1, 1,
1.159154, -0.2243016, 1.840798, 0, 0, 1, 1, 1,
1.159837, -0.3904573, 2.816856, 1, 0, 0, 1, 1,
1.161163, 0.6002188, 0.01552912, 1, 0, 0, 1, 1,
1.164391, 1.292533, 0.8882214, 1, 0, 0, 1, 1,
1.16928, -1.283355, 3.740418, 1, 0, 0, 1, 1,
1.172989, -0.8116343, 1.168949, 1, 0, 0, 1, 1,
1.178138, 0.007600488, 1.495216, 0, 0, 0, 1, 1,
1.187176, -0.1100942, 2.916031, 0, 0, 0, 1, 1,
1.188207, -0.05484154, 1.138239, 0, 0, 0, 1, 1,
1.207244, 2.099685, 0.4335628, 0, 0, 0, 1, 1,
1.215597, 1.513469, 1.002546, 0, 0, 0, 1, 1,
1.219236, 0.02703399, -0.1973352, 0, 0, 0, 1, 1,
1.219961, -1.456222, 0.5149039, 0, 0, 0, 1, 1,
1.23676, 0.3704678, -0.1595354, 1, 1, 1, 1, 1,
1.256676, -0.7219694, 2.22807, 1, 1, 1, 1, 1,
1.258682, -0.569603, 3.556446, 1, 1, 1, 1, 1,
1.265998, -1.063425, 2.033771, 1, 1, 1, 1, 1,
1.266063, 0.2664493, 1.349179, 1, 1, 1, 1, 1,
1.268101, 0.1538275, 2.183712, 1, 1, 1, 1, 1,
1.268807, 0.2738206, 0.811954, 1, 1, 1, 1, 1,
1.272985, 0.69414, 0.6841833, 1, 1, 1, 1, 1,
1.280548, -1.279904, 3.453012, 1, 1, 1, 1, 1,
1.286375, 0.3538946, 0.7407986, 1, 1, 1, 1, 1,
1.29397, 1.61399, -0.7498487, 1, 1, 1, 1, 1,
1.307228, 1.071584, -0.3250491, 1, 1, 1, 1, 1,
1.313042, 0.4368511, 1.300787, 1, 1, 1, 1, 1,
1.321687, 1.286051, 1.390211, 1, 1, 1, 1, 1,
1.324784, -1.154179, 3.145521, 1, 1, 1, 1, 1,
1.333141, 1.16555, 0.6487126, 0, 0, 1, 1, 1,
1.333162, 1.257946, 0.907055, 1, 0, 0, 1, 1,
1.339594, 0.9037031, 1.040232, 1, 0, 0, 1, 1,
1.340989, -0.9191525, 2.237785, 1, 0, 0, 1, 1,
1.343948, 0.1551802, 3.634838, 1, 0, 0, 1, 1,
1.346559, -0.3834177, 1.879961, 1, 0, 0, 1, 1,
1.347046, 1.123271, -0.005303149, 0, 0, 0, 1, 1,
1.35066, 0.5128233, 1.487175, 0, 0, 0, 1, 1,
1.356912, 0.06302582, 0.7746109, 0, 0, 0, 1, 1,
1.362188, -0.7980806, 3.319494, 0, 0, 0, 1, 1,
1.385401, -2.228878, 2.469711, 0, 0, 0, 1, 1,
1.386831, -1.099739, 2.138716, 0, 0, 0, 1, 1,
1.389359, -1.65969, -0.618457, 0, 0, 0, 1, 1,
1.390837, -0.1422632, 0.7596658, 1, 1, 1, 1, 1,
1.398694, 0.1359469, -0.4759893, 1, 1, 1, 1, 1,
1.399787, 1.096102, -0.1364261, 1, 1, 1, 1, 1,
1.409312, 1.136921, 2.279226, 1, 1, 1, 1, 1,
1.413346, 0.5494033, 2.081366, 1, 1, 1, 1, 1,
1.434067, -0.3991313, 1.422966, 1, 1, 1, 1, 1,
1.442513, 0.5378808, 1.448316, 1, 1, 1, 1, 1,
1.45592, -0.2598869, 0.6359844, 1, 1, 1, 1, 1,
1.459284, 0.8351701, 0.4568833, 1, 1, 1, 1, 1,
1.47162, 0.5370698, 1.361862, 1, 1, 1, 1, 1,
1.472927, 0.02277793, 2.402216, 1, 1, 1, 1, 1,
1.473839, -0.05210846, 0.9091054, 1, 1, 1, 1, 1,
1.493784, -1.571298, 1.231378, 1, 1, 1, 1, 1,
1.496957, -0.01781833, 2.335793, 1, 1, 1, 1, 1,
1.518455, 1.086699, 0.9823391, 1, 1, 1, 1, 1,
1.519429, -0.3851575, 1.229011, 0, 0, 1, 1, 1,
1.533382, 1.04371, -0.2037105, 1, 0, 0, 1, 1,
1.536928, 2.200786, 1.530658, 1, 0, 0, 1, 1,
1.537004, -0.4984418, 2.062419, 1, 0, 0, 1, 1,
1.560397, -0.9834723, 1.983996, 1, 0, 0, 1, 1,
1.562336, 0.3896886, 2.471856, 1, 0, 0, 1, 1,
1.563041, 0.1268293, 1.832073, 0, 0, 0, 1, 1,
1.578336, 0.1887986, 1.359901, 0, 0, 0, 1, 1,
1.597014, -0.2727169, 1.095861, 0, 0, 0, 1, 1,
1.597353, -0.2363274, 0.6355303, 0, 0, 0, 1, 1,
1.604126, 1.114892, 0.9335706, 0, 0, 0, 1, 1,
1.606578, 0.6085299, 1.125749, 0, 0, 0, 1, 1,
1.614095, 0.3791318, -0.03838093, 0, 0, 0, 1, 1,
1.62157, 0.1914708, 1.652379, 1, 1, 1, 1, 1,
1.63583, 0.4274327, 2.116531, 1, 1, 1, 1, 1,
1.639969, 0.2553869, 1.84372, 1, 1, 1, 1, 1,
1.655248, -0.5430455, 0.9520251, 1, 1, 1, 1, 1,
1.656299, -1.406917, 3.343401, 1, 1, 1, 1, 1,
1.660739, -0.4206066, 4.8117, 1, 1, 1, 1, 1,
1.660962, -1.309357, 2.141452, 1, 1, 1, 1, 1,
1.665405, 0.832859, -0.1756343, 1, 1, 1, 1, 1,
1.668777, 0.3864116, 2.867266, 1, 1, 1, 1, 1,
1.696495, 0.4918035, 1.520344, 1, 1, 1, 1, 1,
1.702158, -0.1643019, 2.180548, 1, 1, 1, 1, 1,
1.715957, 0.009486584, 1.803904, 1, 1, 1, 1, 1,
1.719781, -0.6835796, 1.20808, 1, 1, 1, 1, 1,
1.74713, 0.5551615, 3.607246, 1, 1, 1, 1, 1,
1.756212, 0.8618303, 0.8743477, 1, 1, 1, 1, 1,
1.757107, -0.1792734, 1.581917, 0, 0, 1, 1, 1,
1.766636, 0.240745, 1.670943, 1, 0, 0, 1, 1,
1.775694, 0.6619812, 1.297094, 1, 0, 0, 1, 1,
1.793341, 0.09353135, 2.006355, 1, 0, 0, 1, 1,
1.793466, 0.4894341, 0.9280034, 1, 0, 0, 1, 1,
1.797665, 0.4953572, 2.342099, 1, 0, 0, 1, 1,
1.805612, 0.6514574, 0.3025482, 0, 0, 0, 1, 1,
1.814152, -0.9376477, 2.408594, 0, 0, 0, 1, 1,
1.82082, 1.067351, 1.886228, 0, 0, 0, 1, 1,
1.839327, 0.4057769, 2.126286, 0, 0, 0, 1, 1,
1.853009, 0.3073334, 1.372181, 0, 0, 0, 1, 1,
1.855336, 0.3621366, 1.861732, 0, 0, 0, 1, 1,
1.858869, 0.9217522, 1.476026, 0, 0, 0, 1, 1,
1.917311, -1.059712, 0.955378, 1, 1, 1, 1, 1,
1.920931, 0.06932166, 1.877678, 1, 1, 1, 1, 1,
1.954881, 0.5813764, 1.755392, 1, 1, 1, 1, 1,
1.981066, -0.5438426, 1.390178, 1, 1, 1, 1, 1,
1.988433, -0.6158535, 2.464784, 1, 1, 1, 1, 1,
1.992526, 0.9098075, 1.27902, 1, 1, 1, 1, 1,
1.997116, -0.3458908, 1.602676, 1, 1, 1, 1, 1,
2.056696, -0.1120634, 2.189967, 1, 1, 1, 1, 1,
2.058604, 1.62032, -0.5301801, 1, 1, 1, 1, 1,
2.064627, -0.7099966, 2.74138, 1, 1, 1, 1, 1,
2.083287, -0.1487059, 1.953974, 1, 1, 1, 1, 1,
2.111344, 0.7848331, 0.01798107, 1, 1, 1, 1, 1,
2.145582, -0.5204614, 2.420006, 1, 1, 1, 1, 1,
2.146435, -0.8261975, 0.2987499, 1, 1, 1, 1, 1,
2.196702, 1.076647, 0.4589365, 1, 1, 1, 1, 1,
2.221092, 0.9809332, 2.486907, 0, 0, 1, 1, 1,
2.346716, -1.468711, 2.415482, 1, 0, 0, 1, 1,
2.361174, 0.1109414, 0.2626821, 1, 0, 0, 1, 1,
2.376745, 0.4259818, 0.6793365, 1, 0, 0, 1, 1,
2.395688, 1.506495, 1.19481, 1, 0, 0, 1, 1,
2.419056, -0.1514058, 1.478953, 1, 0, 0, 1, 1,
2.427617, -0.628574, 0.3888825, 0, 0, 0, 1, 1,
2.429686, -1.304658, 1.426237, 0, 0, 0, 1, 1,
2.46624, 1.628389, 0.6240537, 0, 0, 0, 1, 1,
2.502684, 0.6653362, 2.844941, 0, 0, 0, 1, 1,
2.512428, -0.2937823, 1.045376, 0, 0, 0, 1, 1,
2.578475, -1.31493, 2.439725, 0, 0, 0, 1, 1,
2.60525, 0.004572035, 2.485642, 0, 0, 0, 1, 1,
2.664278, 0.06601985, 0.6697664, 1, 1, 1, 1, 1,
2.67257, -1.024064, 2.25356, 1, 1, 1, 1, 1,
2.812967, 1.17225, 2.259732, 1, 1, 1, 1, 1,
2.947811, -0.5097144, 3.146681, 1, 1, 1, 1, 1,
2.952792, 1.883678, 1.29048, 1, 1, 1, 1, 1,
2.978821, 0.833651, 0.6792323, 1, 1, 1, 1, 1,
3.128652, -1.650433, 3.267039, 1, 1, 1, 1, 1
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
var radius = 9.194599;
var distance = 32.29564;
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
mvMatrix.translate( -0.1609259, 0.2648071, -0.2208385 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.29564);
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
