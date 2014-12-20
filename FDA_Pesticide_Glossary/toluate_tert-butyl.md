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
-2.799109, -1.158055, -1.093007, 1, 0, 0, 1,
-2.753337, 1.088974, -1.552449, 1, 0.007843138, 0, 1,
-2.598516, 1.247743, -1.803508, 1, 0.01176471, 0, 1,
-2.481251, 1.225531, -1.40617, 1, 0.01960784, 0, 1,
-2.474382, 1.146613, -0.3524012, 1, 0.02352941, 0, 1,
-2.352953, -1.872491, -1.002612, 1, 0.03137255, 0, 1,
-2.300734, 1.208199, -0.555196, 1, 0.03529412, 0, 1,
-2.29449, -0.1049367, -3.536213, 1, 0.04313726, 0, 1,
-2.285422, 0.2781027, -1.206134, 1, 0.04705882, 0, 1,
-2.256941, -1.370604, -0.5940107, 1, 0.05490196, 0, 1,
-2.217354, -0.5224657, -1.194098, 1, 0.05882353, 0, 1,
-2.198617, 0.8674501, -0.8628834, 1, 0.06666667, 0, 1,
-2.166914, -0.02070112, -1.060373, 1, 0.07058824, 0, 1,
-2.086689, 0.08562803, -0.1625399, 1, 0.07843138, 0, 1,
-2.08528, -1.545455, -3.298999, 1, 0.08235294, 0, 1,
-2.082487, -0.2303506, -0.5411852, 1, 0.09019608, 0, 1,
-2.076127, 0.1943285, -2.781362, 1, 0.09411765, 0, 1,
-2.04737, 0.04446907, -2.007758, 1, 0.1019608, 0, 1,
-1.991024, -0.30857, -2.197294, 1, 0.1098039, 0, 1,
-1.97807, -1.597128, -0.004425622, 1, 0.1137255, 0, 1,
-1.975402, -1.20128, -1.628242, 1, 0.1215686, 0, 1,
-1.906045, 0.06264593, 0.06831378, 1, 0.1254902, 0, 1,
-1.892154, 0.1713963, 0.1780633, 1, 0.1333333, 0, 1,
-1.851716, -1.088313, -2.719082, 1, 0.1372549, 0, 1,
-1.831848, -0.7947604, -3.83249, 1, 0.145098, 0, 1,
-1.825309, 1.40009, 0.7444659, 1, 0.1490196, 0, 1,
-1.821568, -1.382776, -1.317726, 1, 0.1568628, 0, 1,
-1.810718, -2.522631, -2.223479, 1, 0.1607843, 0, 1,
-1.806592, -0.4833485, -0.3336577, 1, 0.1686275, 0, 1,
-1.806119, 0.1213462, -1.790133, 1, 0.172549, 0, 1,
-1.804123, 1.212806, -0.7680627, 1, 0.1803922, 0, 1,
-1.797236, 1.149079, -0.8621926, 1, 0.1843137, 0, 1,
-1.757351, -1.668715, -2.11612, 1, 0.1921569, 0, 1,
-1.748279, 0.2149449, -1.856649, 1, 0.1960784, 0, 1,
-1.74277, -0.6029933, -0.2225157, 1, 0.2039216, 0, 1,
-1.727081, 1.370093, -2.177236, 1, 0.2117647, 0, 1,
-1.699137, 0.3701243, -3.985783, 1, 0.2156863, 0, 1,
-1.698122, 0.8534835, -3.619363, 1, 0.2235294, 0, 1,
-1.695653, -1.331372, -3.742664, 1, 0.227451, 0, 1,
-1.672106, -0.2902182, -0.1715332, 1, 0.2352941, 0, 1,
-1.648561, -0.4535053, -1.853739, 1, 0.2392157, 0, 1,
-1.644827, -2.285658, -2.77386, 1, 0.2470588, 0, 1,
-1.64389, -0.1198246, -3.186568, 1, 0.2509804, 0, 1,
-1.643543, -1.296951, -0.7255387, 1, 0.2588235, 0, 1,
-1.631852, 0.3770472, -1.881228, 1, 0.2627451, 0, 1,
-1.616012, 0.5184089, -1.338749, 1, 0.2705882, 0, 1,
-1.612295, 0.7463614, -1.23047, 1, 0.2745098, 0, 1,
-1.609597, 0.8603824, -0.9973992, 1, 0.282353, 0, 1,
-1.607646, 1.044983, -0.5468642, 1, 0.2862745, 0, 1,
-1.601341, 1.255577, -0.7191009, 1, 0.2941177, 0, 1,
-1.596771, -0.04325189, -1.909932, 1, 0.3019608, 0, 1,
-1.574447, 0.5152213, -2.197861, 1, 0.3058824, 0, 1,
-1.558372, 0.8750302, 0.4052165, 1, 0.3137255, 0, 1,
-1.556787, 0.2590603, -1.077639, 1, 0.3176471, 0, 1,
-1.556227, -1.949294, -2.268075, 1, 0.3254902, 0, 1,
-1.555195, -0.7475474, -1.819217, 1, 0.3294118, 0, 1,
-1.554131, 0.5555347, -0.9380332, 1, 0.3372549, 0, 1,
-1.545384, -0.2415545, -3.225178, 1, 0.3411765, 0, 1,
-1.536451, -1.013696, -1.197123, 1, 0.3490196, 0, 1,
-1.531668, 1.376846, 0.4081271, 1, 0.3529412, 0, 1,
-1.52019, 1.054015, -0.5744393, 1, 0.3607843, 0, 1,
-1.501369, 1.104079, -0.6721339, 1, 0.3647059, 0, 1,
-1.49204, -1.174363, -0.08139046, 1, 0.372549, 0, 1,
-1.481782, -0.9586381, -2.676324, 1, 0.3764706, 0, 1,
-1.47179, -1.17821, -2.131217, 1, 0.3843137, 0, 1,
-1.436146, -0.3784805, -1.420512, 1, 0.3882353, 0, 1,
-1.434008, 0.5496898, -0.7159694, 1, 0.3960784, 0, 1,
-1.413955, 0.5933432, -2.01454, 1, 0.4039216, 0, 1,
-1.411165, 0.3341035, -0.6092463, 1, 0.4078431, 0, 1,
-1.398529, -0.2687773, -0.4681585, 1, 0.4156863, 0, 1,
-1.387674, 0.1566921, -2.467792, 1, 0.4196078, 0, 1,
-1.382776, -1.061035, -1.513341, 1, 0.427451, 0, 1,
-1.38086, 2.604668, -0.7989454, 1, 0.4313726, 0, 1,
-1.374931, -1.20436, -1.178769, 1, 0.4392157, 0, 1,
-1.372056, -0.2562832, -2.783184, 1, 0.4431373, 0, 1,
-1.36916, 0.428515, -0.5461472, 1, 0.4509804, 0, 1,
-1.364546, -0.5140244, -2.598113, 1, 0.454902, 0, 1,
-1.354939, 1.466522, 0.4468943, 1, 0.4627451, 0, 1,
-1.344313, 0.256479, -1.007428, 1, 0.4666667, 0, 1,
-1.336806, 1.122872, -0.2773313, 1, 0.4745098, 0, 1,
-1.336037, -1.300425, -2.567148, 1, 0.4784314, 0, 1,
-1.329549, 0.9839513, -0.7186719, 1, 0.4862745, 0, 1,
-1.328417, -0.2932785, -0.02479658, 1, 0.4901961, 0, 1,
-1.312776, 0.2982211, -1.320739, 1, 0.4980392, 0, 1,
-1.309489, 0.6993498, -0.9664137, 1, 0.5058824, 0, 1,
-1.306083, 0.1307083, 1.012921, 1, 0.509804, 0, 1,
-1.30594, 0.1107466, -2.45506, 1, 0.5176471, 0, 1,
-1.30546, -0.9579784, -2.015164, 1, 0.5215687, 0, 1,
-1.305135, 0.3136812, -0.6635067, 1, 0.5294118, 0, 1,
-1.285986, -0.7792655, -1.536044, 1, 0.5333334, 0, 1,
-1.28577, -0.3747291, -3.244816, 1, 0.5411765, 0, 1,
-1.276732, -0.5671542, -3.520049, 1, 0.5450981, 0, 1,
-1.27302, 1.122521, 0.4703139, 1, 0.5529412, 0, 1,
-1.257695, 1.020911, -1.314667, 1, 0.5568628, 0, 1,
-1.254671, 0.5882615, -3.20903, 1, 0.5647059, 0, 1,
-1.251831, -0.1604493, -4.094396, 1, 0.5686275, 0, 1,
-1.251166, -0.6508538, -2.376105, 1, 0.5764706, 0, 1,
-1.246992, 0.7423769, -0.9339009, 1, 0.5803922, 0, 1,
-1.237013, 0.3100383, -0.6502451, 1, 0.5882353, 0, 1,
-1.235246, 0.6203138, -0.1817422, 1, 0.5921569, 0, 1,
-1.232742, 0.5840691, -0.5624746, 1, 0.6, 0, 1,
-1.221235, -0.951795, -1.941956, 1, 0.6078432, 0, 1,
-1.214047, -0.1942791, -0.3621101, 1, 0.6117647, 0, 1,
-1.213116, 0.9241623, 0.4704996, 1, 0.6196079, 0, 1,
-1.210068, 0.6840358, -0.4385872, 1, 0.6235294, 0, 1,
-1.204382, -1.004408, -0.9493908, 1, 0.6313726, 0, 1,
-1.200664, 1.301173, 0.2073454, 1, 0.6352941, 0, 1,
-1.184115, 0.5916626, -2.56584, 1, 0.6431373, 0, 1,
-1.175873, -0.8319668, -2.050952, 1, 0.6470588, 0, 1,
-1.165305, 0.8108336, -1.140707, 1, 0.654902, 0, 1,
-1.161869, -0.1795906, -3.436988, 1, 0.6588235, 0, 1,
-1.158664, 2.037933, -0.4000941, 1, 0.6666667, 0, 1,
-1.129305, -0.293623, -2.533504, 1, 0.6705883, 0, 1,
-1.128872, -0.4137807, -2.479253, 1, 0.6784314, 0, 1,
-1.124535, 0.06799506, -0.2538206, 1, 0.682353, 0, 1,
-1.12023, 0.5679408, -1.855161, 1, 0.6901961, 0, 1,
-1.108965, 1.002207, -1.168289, 1, 0.6941177, 0, 1,
-1.106194, 0.09651612, -0.9911111, 1, 0.7019608, 0, 1,
-1.101089, 0.8507428, -1.756108, 1, 0.7098039, 0, 1,
-1.096599, 0.3921974, -1.776336, 1, 0.7137255, 0, 1,
-1.092024, 0.900967, 1.40537, 1, 0.7215686, 0, 1,
-1.088824, -1.792135, -2.865708, 1, 0.7254902, 0, 1,
-1.088055, 0.7679487, -1.288294, 1, 0.7333333, 0, 1,
-1.085832, 1.450608, -0.5615864, 1, 0.7372549, 0, 1,
-1.081473, -0.3480326, -1.007212, 1, 0.7450981, 0, 1,
-1.070818, -0.1430804, -1.706343, 1, 0.7490196, 0, 1,
-1.06965, -0.146, -1.635677, 1, 0.7568628, 0, 1,
-1.063115, -0.06216896, -1.893633, 1, 0.7607843, 0, 1,
-1.059883, -0.7209743, -1.962585, 1, 0.7686275, 0, 1,
-1.049861, -0.8417622, -2.576133, 1, 0.772549, 0, 1,
-1.044523, -0.5262566, -3.70665, 1, 0.7803922, 0, 1,
-1.040971, 0.6230502, -0.874893, 1, 0.7843137, 0, 1,
-1.033275, -0.7553081, -2.177162, 1, 0.7921569, 0, 1,
-1.031393, -1.055834, -3.122483, 1, 0.7960784, 0, 1,
-1.025371, 0.1631166, -1.926463, 1, 0.8039216, 0, 1,
-1.021731, 0.03013887, -1.437929, 1, 0.8117647, 0, 1,
-1.018263, -1.878515, -2.702449, 1, 0.8156863, 0, 1,
-1.016279, 0.4047745, -1.453836, 1, 0.8235294, 0, 1,
-1.014856, -0.4969184, -0.4032306, 1, 0.827451, 0, 1,
-1.000162, 0.3747274, 0.09485324, 1, 0.8352941, 0, 1,
-0.9984182, 1.355471, -1.764814, 1, 0.8392157, 0, 1,
-0.9927028, 1.185182, -0.08228606, 1, 0.8470588, 0, 1,
-0.9885641, 0.2732633, -0.7440906, 1, 0.8509804, 0, 1,
-0.9862216, 0.7558529, -1.487425, 1, 0.8588235, 0, 1,
-0.9749559, -0.6448488, -2.224273, 1, 0.8627451, 0, 1,
-0.9735883, -1.263758, -4.309553, 1, 0.8705882, 0, 1,
-0.9705742, 2.429602, 0.229977, 1, 0.8745098, 0, 1,
-0.9619326, -0.6590393, -0.4144615, 1, 0.8823529, 0, 1,
-0.9517376, -1.37701, -1.281682, 1, 0.8862745, 0, 1,
-0.9455716, -0.04759743, -2.294522, 1, 0.8941177, 0, 1,
-0.938526, 1.543358, -0.2088409, 1, 0.8980392, 0, 1,
-0.9348752, 0.1999291, 0.2560238, 1, 0.9058824, 0, 1,
-0.9337902, -0.2729042, -4.444063, 1, 0.9137255, 0, 1,
-0.9332392, -1.860415, -2.996793, 1, 0.9176471, 0, 1,
-0.9309857, -0.566344, -0.4762769, 1, 0.9254902, 0, 1,
-0.9282816, -0.06674717, -1.8046, 1, 0.9294118, 0, 1,
-0.9276052, 1.905379, -0.06555748, 1, 0.9372549, 0, 1,
-0.9274924, -0.08180533, -2.233209, 1, 0.9411765, 0, 1,
-0.9255318, -1.159783, -1.540565, 1, 0.9490196, 0, 1,
-0.9191093, 0.7488112, -2.276474, 1, 0.9529412, 0, 1,
-0.913331, -0.3456638, -1.159261, 1, 0.9607843, 0, 1,
-0.9127741, 1.104725, -2.511101, 1, 0.9647059, 0, 1,
-0.9079856, 0.5300422, -0.6996543, 1, 0.972549, 0, 1,
-0.9058355, 0.2690804, -2.347882, 1, 0.9764706, 0, 1,
-0.9021648, 1.394461, 0.02492914, 1, 0.9843137, 0, 1,
-0.8954112, -0.2849945, -0.2272886, 1, 0.9882353, 0, 1,
-0.8831394, -0.2064525, -4.103906, 1, 0.9960784, 0, 1,
-0.8814366, -0.3926921, -2.698748, 0.9960784, 1, 0, 1,
-0.8745818, 0.2932944, 0.1364998, 0.9921569, 1, 0, 1,
-0.8738645, 0.4106687, -2.440187, 0.9843137, 1, 0, 1,
-0.869289, 0.8554757, -0.8199409, 0.9803922, 1, 0, 1,
-0.8567978, 0.7631974, -2.464423, 0.972549, 1, 0, 1,
-0.8536706, 0.2814133, -0.7335706, 0.9686275, 1, 0, 1,
-0.8515368, -0.1536525, -1.273662, 0.9607843, 1, 0, 1,
-0.8411354, 0.1201621, -0.245753, 0.9568627, 1, 0, 1,
-0.8404717, 1.592575, 0.5598906, 0.9490196, 1, 0, 1,
-0.8322294, -2.010505, -3.423337, 0.945098, 1, 0, 1,
-0.8266904, 0.6752604, -0.1874228, 0.9372549, 1, 0, 1,
-0.8211364, 1.34532, -0.586083, 0.9333333, 1, 0, 1,
-0.8185458, 0.9737781, -1.460698, 0.9254902, 1, 0, 1,
-0.8184099, 0.5431741, -0.4582953, 0.9215686, 1, 0, 1,
-0.8159775, 0.5520116, -1.290423, 0.9137255, 1, 0, 1,
-0.8122563, 0.3305049, -1.051522, 0.9098039, 1, 0, 1,
-0.8078443, -1.037608, -2.43834, 0.9019608, 1, 0, 1,
-0.8052143, -1.096824, -2.365813, 0.8941177, 1, 0, 1,
-0.7947283, -0.8446944, -1.20505, 0.8901961, 1, 0, 1,
-0.7944057, -1.645568, -2.645592, 0.8823529, 1, 0, 1,
-0.7920007, -0.6676162, -2.586385, 0.8784314, 1, 0, 1,
-0.7863795, -0.8260758, -2.656742, 0.8705882, 1, 0, 1,
-0.7821522, -1.049868, -2.799225, 0.8666667, 1, 0, 1,
-0.7810814, -0.6469682, -1.175311, 0.8588235, 1, 0, 1,
-0.7801487, -2.190905, -2.737344, 0.854902, 1, 0, 1,
-0.7763505, -0.9259666, -3.339935, 0.8470588, 1, 0, 1,
-0.7755568, 0.44798, -1.528659, 0.8431373, 1, 0, 1,
-0.7744486, 2.454585, 0.2052538, 0.8352941, 1, 0, 1,
-0.7733106, 0.6575058, -1.746128, 0.8313726, 1, 0, 1,
-0.7721348, 1.244972, -1.343096, 0.8235294, 1, 0, 1,
-0.769952, -0.1431371, -2.915643, 0.8196079, 1, 0, 1,
-0.7676383, -0.01787721, 0.4602699, 0.8117647, 1, 0, 1,
-0.7667447, -0.2709916, -0.5573065, 0.8078431, 1, 0, 1,
-0.7666706, 0.633253, -2.044965, 0.8, 1, 0, 1,
-0.7610372, 1.508581, 0.34707, 0.7921569, 1, 0, 1,
-0.7568946, 0.5015385, 0.9097094, 0.7882353, 1, 0, 1,
-0.7482395, 0.343201, -0.2972223, 0.7803922, 1, 0, 1,
-0.738675, -1.291315, -1.924207, 0.7764706, 1, 0, 1,
-0.737924, 0.1513522, -1.589516, 0.7686275, 1, 0, 1,
-0.736701, -0.04090143, -2.290963, 0.7647059, 1, 0, 1,
-0.7357783, -1.09728, -2.181126, 0.7568628, 1, 0, 1,
-0.7226439, 2.348645, 1.205332, 0.7529412, 1, 0, 1,
-0.7224248, -0.03262679, -2.509913, 0.7450981, 1, 0, 1,
-0.7164456, -1.879, -3.933698, 0.7411765, 1, 0, 1,
-0.7156593, 0.3456569, -0.3708625, 0.7333333, 1, 0, 1,
-0.7119308, 1.024565, -0.1806218, 0.7294118, 1, 0, 1,
-0.7089412, -0.9357069, -5.117157, 0.7215686, 1, 0, 1,
-0.7037159, 0.4828485, -2.913811, 0.7176471, 1, 0, 1,
-0.7001827, -0.3645965, -2.111523, 0.7098039, 1, 0, 1,
-0.6964708, -1.909575, -2.629302, 0.7058824, 1, 0, 1,
-0.6942604, 0.9377703, -1.297984, 0.6980392, 1, 0, 1,
-0.6845973, -1.853546, -3.540715, 0.6901961, 1, 0, 1,
-0.6822341, -0.3577863, -2.643444, 0.6862745, 1, 0, 1,
-0.6798467, 0.3676299, -1.949593, 0.6784314, 1, 0, 1,
-0.6789044, -0.8354778, -2.63767, 0.6745098, 1, 0, 1,
-0.6764746, -0.5814581, -1.82487, 0.6666667, 1, 0, 1,
-0.6659842, 0.0003930236, -1.555449, 0.6627451, 1, 0, 1,
-0.6647565, -0.2047267, -3.19532, 0.654902, 1, 0, 1,
-0.6630018, 0.2615165, 1.15418, 0.6509804, 1, 0, 1,
-0.6620828, 0.3871962, -2.828896, 0.6431373, 1, 0, 1,
-0.6538187, -0.76376, -2.968593, 0.6392157, 1, 0, 1,
-0.6421912, -0.6362975, -3.266917, 0.6313726, 1, 0, 1,
-0.6408133, 1.17454, 0.6517385, 0.627451, 1, 0, 1,
-0.6389737, -1.164557, -2.109257, 0.6196079, 1, 0, 1,
-0.6345313, -0.7179081, -1.805, 0.6156863, 1, 0, 1,
-0.6337869, 0.7209296, -0.9564846, 0.6078432, 1, 0, 1,
-0.6336991, 1.291886, -0.713144, 0.6039216, 1, 0, 1,
-0.6336539, -0.4734125, -1.946719, 0.5960785, 1, 0, 1,
-0.6333143, 1.371791, -1.066915, 0.5882353, 1, 0, 1,
-0.6329451, 0.6699963, -1.756512, 0.5843138, 1, 0, 1,
-0.6300941, -1.252689, -1.359276, 0.5764706, 1, 0, 1,
-0.6288762, 0.1910385, -4.469707, 0.572549, 1, 0, 1,
-0.6235307, 0.9295384, -3.368618, 0.5647059, 1, 0, 1,
-0.6220295, -0.4281272, -0.7003395, 0.5607843, 1, 0, 1,
-0.6125817, -0.1429935, -2.553272, 0.5529412, 1, 0, 1,
-0.6102998, -1.256386, -3.745042, 0.5490196, 1, 0, 1,
-0.6055255, -1.632104, -6.202986, 0.5411765, 1, 0, 1,
-0.6001838, 1.389835, 0.2659434, 0.5372549, 1, 0, 1,
-0.5980312, -0.6920904, -2.425132, 0.5294118, 1, 0, 1,
-0.5972381, 0.5081801, -1.20349, 0.5254902, 1, 0, 1,
-0.5941274, -1.269077, -1.994751, 0.5176471, 1, 0, 1,
-0.5911444, 0.9525254, 0.3684852, 0.5137255, 1, 0, 1,
-0.5880433, 0.2725767, 0.1376765, 0.5058824, 1, 0, 1,
-0.5867277, -0.6314004, -2.871149, 0.5019608, 1, 0, 1,
-0.5856727, -0.8190102, -1.559182, 0.4941176, 1, 0, 1,
-0.5856581, -0.538884, -1.844701, 0.4862745, 1, 0, 1,
-0.584874, -0.6127839, -3.243745, 0.4823529, 1, 0, 1,
-0.5814874, -0.1932188, -2.533807, 0.4745098, 1, 0, 1,
-0.5750931, 1.40735, -0.5919911, 0.4705882, 1, 0, 1,
-0.5749514, 1.037695, -0.003298836, 0.4627451, 1, 0, 1,
-0.5742468, -1.647272, -0.6899179, 0.4588235, 1, 0, 1,
-0.5721378, -0.478935, -2.247811, 0.4509804, 1, 0, 1,
-0.5682381, 0.4342008, -1.647355, 0.4470588, 1, 0, 1,
-0.5676265, -1.265617, -2.848538, 0.4392157, 1, 0, 1,
-0.5657297, -0.02402403, -1.883248, 0.4352941, 1, 0, 1,
-0.5637271, 1.384437, 1.274309, 0.427451, 1, 0, 1,
-0.5626283, 0.1955501, 0.32805, 0.4235294, 1, 0, 1,
-0.5622283, 0.3860888, 0.01203623, 0.4156863, 1, 0, 1,
-0.5611556, -0.9492202, -3.619508, 0.4117647, 1, 0, 1,
-0.5585065, -0.7408017, -2.801844, 0.4039216, 1, 0, 1,
-0.5566319, -1.63826, -3.94923, 0.3960784, 1, 0, 1,
-0.5545873, 0.8263128, -1.049074, 0.3921569, 1, 0, 1,
-0.5497512, -0.4147715, -2.834192, 0.3843137, 1, 0, 1,
-0.5493658, 0.296356, -0.8832235, 0.3803922, 1, 0, 1,
-0.5444323, -0.5028309, -3.794451, 0.372549, 1, 0, 1,
-0.5429617, -0.4374319, -2.310138, 0.3686275, 1, 0, 1,
-0.5407491, -0.7103608, -3.118533, 0.3607843, 1, 0, 1,
-0.526551, -1.00775, -1.899185, 0.3568628, 1, 0, 1,
-0.5197453, -0.6944136, -3.099558, 0.3490196, 1, 0, 1,
-0.5182328, -0.3350653, -0.7996088, 0.345098, 1, 0, 1,
-0.5124756, 0.8579975, -1.786943, 0.3372549, 1, 0, 1,
-0.5121239, -0.9243824, -3.518915, 0.3333333, 1, 0, 1,
-0.5112671, 0.2930532, -2.569548, 0.3254902, 1, 0, 1,
-0.5090492, 0.946748, -0.3969136, 0.3215686, 1, 0, 1,
-0.5087643, -0.4735365, -2.553114, 0.3137255, 1, 0, 1,
-0.5061925, 1.076619, -0.1966656, 0.3098039, 1, 0, 1,
-0.5030155, -0.2748334, -2.303782, 0.3019608, 1, 0, 1,
-0.5002791, -0.4808652, -3.290218, 0.2941177, 1, 0, 1,
-0.5002116, -0.5192931, -1.283261, 0.2901961, 1, 0, 1,
-0.4985324, 0.980179, -0.1039053, 0.282353, 1, 0, 1,
-0.4963006, -0.6458656, -4.821381, 0.2784314, 1, 0, 1,
-0.4953033, 2.079324, -2.07454, 0.2705882, 1, 0, 1,
-0.4925873, 1.060765, 1.569018, 0.2666667, 1, 0, 1,
-0.4920679, 0.4254912, -0.69285, 0.2588235, 1, 0, 1,
-0.4840555, 0.2890406, -0.9808004, 0.254902, 1, 0, 1,
-0.4840186, 0.1529731, -1.484802, 0.2470588, 1, 0, 1,
-0.4728028, 0.5587591, -1.428702, 0.2431373, 1, 0, 1,
-0.471234, 0.08883765, -2.294223, 0.2352941, 1, 0, 1,
-0.4710099, 0.06748865, -3.428886, 0.2313726, 1, 0, 1,
-0.4690357, -0.4562314, -2.691867, 0.2235294, 1, 0, 1,
-0.4637263, 0.2187525, -0.7646565, 0.2196078, 1, 0, 1,
-0.4613328, 0.290679, -3.475294, 0.2117647, 1, 0, 1,
-0.4590496, 0.2642989, 0.487343, 0.2078431, 1, 0, 1,
-0.4522196, -0.8052409, -2.277967, 0.2, 1, 0, 1,
-0.4472193, -0.7772733, -2.042394, 0.1921569, 1, 0, 1,
-0.4468375, 0.4247439, -0.2790289, 0.1882353, 1, 0, 1,
-0.4445603, -0.6536903, -1.324168, 0.1803922, 1, 0, 1,
-0.4430744, 0.2101108, -0.006831198, 0.1764706, 1, 0, 1,
-0.4400845, -0.7083916, -2.953863, 0.1686275, 1, 0, 1,
-0.4356409, 0.6164969, -0.2440052, 0.1647059, 1, 0, 1,
-0.4333555, 0.966879, -0.2935764, 0.1568628, 1, 0, 1,
-0.4309296, -0.9043261, -1.771244, 0.1529412, 1, 0, 1,
-0.4282537, 0.08963042, -3.218982, 0.145098, 1, 0, 1,
-0.4272872, 0.7480578, -0.6170408, 0.1411765, 1, 0, 1,
-0.4262609, -2.46242, -2.138859, 0.1333333, 1, 0, 1,
-0.425281, 0.5114449, -0.3655588, 0.1294118, 1, 0, 1,
-0.4228277, 1.78501, 0.1102266, 0.1215686, 1, 0, 1,
-0.4152733, 0.3024785, 0.2167036, 0.1176471, 1, 0, 1,
-0.4122377, 1.072277, -0.8371052, 0.1098039, 1, 0, 1,
-0.3997279, -0.1625381, -3.366199, 0.1058824, 1, 0, 1,
-0.3989079, -0.05260184, -2.775036, 0.09803922, 1, 0, 1,
-0.3958565, 1.91015, -1.951437, 0.09019608, 1, 0, 1,
-0.3915892, 1.418398, -0.3798866, 0.08627451, 1, 0, 1,
-0.3878143, 0.6817039, -0.8261386, 0.07843138, 1, 0, 1,
-0.3849124, 0.5729931, 0.3605061, 0.07450981, 1, 0, 1,
-0.3847084, 1.118999, -1.435692, 0.06666667, 1, 0, 1,
-0.3795392, 1.831114, -1.472633, 0.0627451, 1, 0, 1,
-0.3793787, 0.2261982, 0.0005472417, 0.05490196, 1, 0, 1,
-0.3742386, -0.6404697, -1.381146, 0.05098039, 1, 0, 1,
-0.3729812, -0.1766412, -2.448509, 0.04313726, 1, 0, 1,
-0.3727232, -0.6329401, -1.919494, 0.03921569, 1, 0, 1,
-0.3716138, -0.4817284, -2.946833, 0.03137255, 1, 0, 1,
-0.3714483, -1.067679, -2.199741, 0.02745098, 1, 0, 1,
-0.3698493, -0.221516, -2.810349, 0.01960784, 1, 0, 1,
-0.3659189, -0.2218249, -1.371066, 0.01568628, 1, 0, 1,
-0.3645397, 0.530758, -0.2804756, 0.007843138, 1, 0, 1,
-0.3639237, 0.3316257, -1.697396, 0.003921569, 1, 0, 1,
-0.3593268, -0.3454348, -3.884475, 0, 1, 0.003921569, 1,
-0.3577438, 1.490655, -1.349473, 0, 1, 0.01176471, 1,
-0.3571351, -0.9950326, -2.298501, 0, 1, 0.01568628, 1,
-0.3562845, -0.2263723, -3.310094, 0, 1, 0.02352941, 1,
-0.3543121, -0.08377255, -1.347432, 0, 1, 0.02745098, 1,
-0.35385, 0.2300377, -0.5703675, 0, 1, 0.03529412, 1,
-0.3492506, -0.4967393, -4.695774, 0, 1, 0.03921569, 1,
-0.3484609, 1.283561, -1.275937, 0, 1, 0.04705882, 1,
-0.3483011, -1.151182, -2.542637, 0, 1, 0.05098039, 1,
-0.3459092, -0.4477865, -3.593212, 0, 1, 0.05882353, 1,
-0.3431216, 1.920275, 0.01705942, 0, 1, 0.0627451, 1,
-0.3420788, 0.1550686, -1.740455, 0, 1, 0.07058824, 1,
-0.3334407, 1.449261, 0.209337, 0, 1, 0.07450981, 1,
-0.3282771, 0.2585273, -1.596186, 0, 1, 0.08235294, 1,
-0.3249193, 0.7117794, 0.6356539, 0, 1, 0.08627451, 1,
-0.3238744, 0.6608157, -1.368139, 0, 1, 0.09411765, 1,
-0.3223628, -1.270879, -3.862445, 0, 1, 0.1019608, 1,
-0.3203174, -0.2759756, -2.56881, 0, 1, 0.1058824, 1,
-0.3184147, 0.8564247, 0.2610574, 0, 1, 0.1137255, 1,
-0.3163669, 1.294732, -0.6823105, 0, 1, 0.1176471, 1,
-0.3154692, -0.4701631, -2.14546, 0, 1, 0.1254902, 1,
-0.3118602, 0.9395163, -1.984478, 0, 1, 0.1294118, 1,
-0.3087161, 1.540889, 0.1147932, 0, 1, 0.1372549, 1,
-0.2986537, 0.717249, -0.2390055, 0, 1, 0.1411765, 1,
-0.2936947, -0.1029085, -2.616248, 0, 1, 0.1490196, 1,
-0.2905039, -1.480272, -1.75081, 0, 1, 0.1529412, 1,
-0.2904187, 0.7431496, 1.063501, 0, 1, 0.1607843, 1,
-0.2882079, 0.9225581, -1.28565, 0, 1, 0.1647059, 1,
-0.2853211, 0.5741609, -1.068258, 0, 1, 0.172549, 1,
-0.2832215, -0.502127, -2.677535, 0, 1, 0.1764706, 1,
-0.2807209, -0.2450416, -1.546465, 0, 1, 0.1843137, 1,
-0.2788495, 0.1143654, -2.996497, 0, 1, 0.1882353, 1,
-0.2767087, -0.4060811, -3.283627, 0, 1, 0.1960784, 1,
-0.2736185, -0.3701144, -3.395625, 0, 1, 0.2039216, 1,
-0.2730147, 0.7259722, -0.6256976, 0, 1, 0.2078431, 1,
-0.2703343, -0.3884515, -2.355479, 0, 1, 0.2156863, 1,
-0.269816, 0.3611053, -3.040697, 0, 1, 0.2196078, 1,
-0.2672158, 0.5207162, 0.7824045, 0, 1, 0.227451, 1,
-0.263485, -0.006503954, -0.3933903, 0, 1, 0.2313726, 1,
-0.2560342, -1.757627, -3.199521, 0, 1, 0.2392157, 1,
-0.2496954, 1.08464, -0.439537, 0, 1, 0.2431373, 1,
-0.2495841, 0.8305386, 0.7800245, 0, 1, 0.2509804, 1,
-0.2494675, -0.4555024, -2.628999, 0, 1, 0.254902, 1,
-0.2491461, -1.347025, -2.59548, 0, 1, 0.2627451, 1,
-0.2365101, -2.000185, -2.833617, 0, 1, 0.2666667, 1,
-0.2362196, 1.380723, -1.171827, 0, 1, 0.2745098, 1,
-0.2326673, 0.004304467, -0.1665317, 0, 1, 0.2784314, 1,
-0.2299658, 0.2231361, -2.483719, 0, 1, 0.2862745, 1,
-0.2259015, -0.09357632, -0.5115628, 0, 1, 0.2901961, 1,
-0.2257856, 0.6556294, 2.449701, 0, 1, 0.2980392, 1,
-0.2253172, 1.547467, 0.854643, 0, 1, 0.3058824, 1,
-0.225157, -0.1682755, -2.735516, 0, 1, 0.3098039, 1,
-0.2162205, -0.8083097, -3.962621, 0, 1, 0.3176471, 1,
-0.2095731, -0.5657402, -3.783919, 0, 1, 0.3215686, 1,
-0.2093035, 0.8503762, -0.5918103, 0, 1, 0.3294118, 1,
-0.2045896, -0.2516306, -2.724007, 0, 1, 0.3333333, 1,
-0.2036724, 0.2967387, 0.06768128, 0, 1, 0.3411765, 1,
-0.200185, 0.8516526, 0.01763346, 0, 1, 0.345098, 1,
-0.1995141, -0.2065811, -3.429069, 0, 1, 0.3529412, 1,
-0.1977323, 0.5911779, -0.002762359, 0, 1, 0.3568628, 1,
-0.1970448, -0.907327, -1.34079, 0, 1, 0.3647059, 1,
-0.1965935, -0.6220315, -2.035892, 0, 1, 0.3686275, 1,
-0.1957748, -1.237504, -1.588408, 0, 1, 0.3764706, 1,
-0.1936923, 1.35524, -1.225566, 0, 1, 0.3803922, 1,
-0.1912584, 0.07542222, -2.161359, 0, 1, 0.3882353, 1,
-0.1883069, 1.355292, -1.085155, 0, 1, 0.3921569, 1,
-0.1865966, 0.7023139, 1.053063, 0, 1, 0.4, 1,
-0.1839099, 0.3258587, 0.764882, 0, 1, 0.4078431, 1,
-0.1836475, 0.8280387, -0.5593897, 0, 1, 0.4117647, 1,
-0.1831322, -1.323155, -3.386367, 0, 1, 0.4196078, 1,
-0.1797822, -0.6012591, -3.987138, 0, 1, 0.4235294, 1,
-0.1765021, 0.5019146, 0.09635293, 0, 1, 0.4313726, 1,
-0.1753595, -0.01087732, -1.109569, 0, 1, 0.4352941, 1,
-0.1744963, -0.07205894, -3.049733, 0, 1, 0.4431373, 1,
-0.1705945, 1.351465, -0.3045165, 0, 1, 0.4470588, 1,
-0.1690274, 1.024151, 0.3595687, 0, 1, 0.454902, 1,
-0.1652901, -0.3805512, -3.721544, 0, 1, 0.4588235, 1,
-0.1633846, -0.4241356, -2.834629, 0, 1, 0.4666667, 1,
-0.1572066, 0.01987942, -1.725958, 0, 1, 0.4705882, 1,
-0.1564659, 0.580259, 0.6427798, 0, 1, 0.4784314, 1,
-0.1543626, -0.8311135, -2.966506, 0, 1, 0.4823529, 1,
-0.1518113, 0.921393, -0.9979982, 0, 1, 0.4901961, 1,
-0.1500213, 0.4091451, -0.06433576, 0, 1, 0.4941176, 1,
-0.1497611, 1.108151, -0.2120471, 0, 1, 0.5019608, 1,
-0.1493521, -0.6138011, -3.237107, 0, 1, 0.509804, 1,
-0.1481121, 0.3797458, 0.03615187, 0, 1, 0.5137255, 1,
-0.1465111, 1.612304, -0.2176464, 0, 1, 0.5215687, 1,
-0.1460866, 0.6525357, 1.138097, 0, 1, 0.5254902, 1,
-0.1426344, -0.3082765, -2.064709, 0, 1, 0.5333334, 1,
-0.1403378, 0.4050689, 0.9577798, 0, 1, 0.5372549, 1,
-0.1391053, 0.8646461, -0.2024792, 0, 1, 0.5450981, 1,
-0.1384843, -0.1002661, -1.554714, 0, 1, 0.5490196, 1,
-0.1384534, 0.1314354, -1.324233, 0, 1, 0.5568628, 1,
-0.1365585, 1.05208, 0.1612525, 0, 1, 0.5607843, 1,
-0.1357663, 0.3282761, -0.7003043, 0, 1, 0.5686275, 1,
-0.1248317, -0.7439008, -3.39389, 0, 1, 0.572549, 1,
-0.124396, -0.5500002, -3.991809, 0, 1, 0.5803922, 1,
-0.1180491, -0.6846417, -2.230889, 0, 1, 0.5843138, 1,
-0.1140025, 0.105788, -0.9708868, 0, 1, 0.5921569, 1,
-0.1055421, 0.970382, -0.7582577, 0, 1, 0.5960785, 1,
-0.1053265, -1.305777, -3.433086, 0, 1, 0.6039216, 1,
-0.1012308, 0.2446952, -0.4743263, 0, 1, 0.6117647, 1,
-0.09725701, -0.316514, -2.929052, 0, 1, 0.6156863, 1,
-0.09545965, 0.3460517, 0.02927655, 0, 1, 0.6235294, 1,
-0.09441803, 0.6307285, -1.366946, 0, 1, 0.627451, 1,
-0.08927567, -0.5740921, -4.916499, 0, 1, 0.6352941, 1,
-0.08444665, 0.7074332, -0.2461799, 0, 1, 0.6392157, 1,
-0.07772737, 0.04080309, 0.2171704, 0, 1, 0.6470588, 1,
-0.07692969, -0.2806376, -3.288995, 0, 1, 0.6509804, 1,
-0.07250767, 1.006683, -1.479772, 0, 1, 0.6588235, 1,
-0.06320228, 1.346283, 0.9506803, 0, 1, 0.6627451, 1,
-0.0623874, -0.00981533, -2.447814, 0, 1, 0.6705883, 1,
-0.06073593, 0.4042437, 1.787686, 0, 1, 0.6745098, 1,
-0.055102, -0.1989769, -1.314677, 0, 1, 0.682353, 1,
-0.05353668, 0.02404024, 0.4454575, 0, 1, 0.6862745, 1,
-0.04670314, 0.4641381, -0.9171534, 0, 1, 0.6941177, 1,
-0.0456267, 1.541478, 0.9895402, 0, 1, 0.7019608, 1,
-0.04469509, 0.3121141, -2.751472, 0, 1, 0.7058824, 1,
-0.04323302, -0.7069992, -3.133599, 0, 1, 0.7137255, 1,
-0.03871181, 0.4008796, -0.4647481, 0, 1, 0.7176471, 1,
-0.03788926, -0.4799108, -2.500557, 0, 1, 0.7254902, 1,
-0.03276139, 0.6252142, 0.3554782, 0, 1, 0.7294118, 1,
-0.03263769, -0.7580449, -2.796581, 0, 1, 0.7372549, 1,
-0.02655825, -0.2236121, -2.474194, 0, 1, 0.7411765, 1,
-0.02428612, 0.2089214, 0.3216892, 0, 1, 0.7490196, 1,
-0.02352777, -0.7955964, -4.261053, 0, 1, 0.7529412, 1,
-0.02161063, 0.4093353, 0.4845328, 0, 1, 0.7607843, 1,
-0.02058164, 1.402773, 0.2988452, 0, 1, 0.7647059, 1,
-0.01719065, -0.3560509, -4.725915, 0, 1, 0.772549, 1,
-0.01567642, 0.5276477, -1.812847, 0, 1, 0.7764706, 1,
-0.01124287, 2.326211, -0.4789202, 0, 1, 0.7843137, 1,
-0.009328437, 0.4727907, 0.6439307, 0, 1, 0.7882353, 1,
-0.008316124, 2.275445, -1.002504, 0, 1, 0.7960784, 1,
-0.007857583, 0.1979415, 0.4773929, 0, 1, 0.8039216, 1,
-0.006506702, -0.07088354, -3.990216, 0, 1, 0.8078431, 1,
-0.006021887, -0.8474808, -3.193089, 0, 1, 0.8156863, 1,
0.006709269, 0.8076469, -0.2560113, 0, 1, 0.8196079, 1,
0.006812336, -0.5866738, 1.943087, 0, 1, 0.827451, 1,
0.008741837, 1.114607, 0.09260115, 0, 1, 0.8313726, 1,
0.009451924, -0.5826101, 3.851488, 0, 1, 0.8392157, 1,
0.01028859, -0.6377273, 2.526858, 0, 1, 0.8431373, 1,
0.01330361, 0.208148, 2.256824, 0, 1, 0.8509804, 1,
0.02189824, -0.3165863, 3.759074, 0, 1, 0.854902, 1,
0.02896716, -0.1569903, 2.837838, 0, 1, 0.8627451, 1,
0.02915636, 0.1631503, 1.364272, 0, 1, 0.8666667, 1,
0.03000247, 0.8789767, 1.336479, 0, 1, 0.8745098, 1,
0.03016524, 0.7604367, 0.3430172, 0, 1, 0.8784314, 1,
0.0319145, 2.071603, -1.184027, 0, 1, 0.8862745, 1,
0.03359731, -0.5498444, 2.857372, 0, 1, 0.8901961, 1,
0.03470024, 0.961198, 0.1470533, 0, 1, 0.8980392, 1,
0.03568653, 0.01695257, 0.4696345, 0, 1, 0.9058824, 1,
0.0403081, 0.7094769, -0.9903783, 0, 1, 0.9098039, 1,
0.04102615, -1.510916, 2.022911, 0, 1, 0.9176471, 1,
0.04747167, -0.5291252, 1.979135, 0, 1, 0.9215686, 1,
0.04852116, 0.5728482, -0.6633849, 0, 1, 0.9294118, 1,
0.04925279, -0.5517913, 3.093773, 0, 1, 0.9333333, 1,
0.05274034, 0.5368446, -0.6661647, 0, 1, 0.9411765, 1,
0.05283099, 2.032489, -0.6332656, 0, 1, 0.945098, 1,
0.05314077, 1.02485, -1.130869, 0, 1, 0.9529412, 1,
0.05524081, 1.463819, 1.04076, 0, 1, 0.9568627, 1,
0.05583175, 0.1484008, -0.03280278, 0, 1, 0.9647059, 1,
0.05629836, -1.01436, 3.576549, 0, 1, 0.9686275, 1,
0.05728147, 0.1519366, 1.279235, 0, 1, 0.9764706, 1,
0.05728732, -0.3997905, 2.081388, 0, 1, 0.9803922, 1,
0.05851354, -0.3846379, 5.784803, 0, 1, 0.9882353, 1,
0.06093793, 0.485566, 2.129513, 0, 1, 0.9921569, 1,
0.06265637, 0.5310281, -0.4907569, 0, 1, 1, 1,
0.06585013, -0.3358793, 2.722835, 0, 0.9921569, 1, 1,
0.06752583, -0.07672173, 1.116752, 0, 0.9882353, 1, 1,
0.06880072, -0.5186073, 4.194308, 0, 0.9803922, 1, 1,
0.07186404, 1.771921, 1.937289, 0, 0.9764706, 1, 1,
0.07471294, 0.7363561, 1.39257, 0, 0.9686275, 1, 1,
0.07719351, 0.3302342, 0.2118814, 0, 0.9647059, 1, 1,
0.08411795, -1.448186, 2.530754, 0, 0.9568627, 1, 1,
0.08464676, -1.562578, 3.209409, 0, 0.9529412, 1, 1,
0.08467788, -0.004625482, 2.115036, 0, 0.945098, 1, 1,
0.08730865, 0.947906, 1.472912, 0, 0.9411765, 1, 1,
0.0950909, 0.4502896, 1.430788, 0, 0.9333333, 1, 1,
0.09533913, 0.7134561, 1.466749, 0, 0.9294118, 1, 1,
0.0960645, 0.9132174, -0.3759414, 0, 0.9215686, 1, 1,
0.096123, -0.2988316, 2.821042, 0, 0.9176471, 1, 1,
0.09713434, -1.370007, 1.174985, 0, 0.9098039, 1, 1,
0.09731665, 0.8560964, -0.6414692, 0, 0.9058824, 1, 1,
0.0976131, 0.627037, -0.4822395, 0, 0.8980392, 1, 1,
0.09906791, -1.244234, 2.797274, 0, 0.8901961, 1, 1,
0.1009021, -0.3718552, 4.931174, 0, 0.8862745, 1, 1,
0.101356, 0.5691526, 1.657538, 0, 0.8784314, 1, 1,
0.1024198, 0.2917524, 0.08831454, 0, 0.8745098, 1, 1,
0.1032351, 1.597611, -0.8907529, 0, 0.8666667, 1, 1,
0.1064713, -0.04103784, 2.997779, 0, 0.8627451, 1, 1,
0.1079806, -0.4465257, 4.102013, 0, 0.854902, 1, 1,
0.1131947, -0.712145, 3.415734, 0, 0.8509804, 1, 1,
0.1152639, -0.8779917, 2.419304, 0, 0.8431373, 1, 1,
0.115767, -1.151775, 2.529303, 0, 0.8392157, 1, 1,
0.1188541, 0.8548456, 0.842591, 0, 0.8313726, 1, 1,
0.1193538, 0.2771479, 0.1150054, 0, 0.827451, 1, 1,
0.1242179, 0.3060536, -0.5606266, 0, 0.8196079, 1, 1,
0.1256629, 2.018257, 1.817122, 0, 0.8156863, 1, 1,
0.1296078, -0.3554114, 4.494138, 0, 0.8078431, 1, 1,
0.1318682, -0.227964, 2.071542, 0, 0.8039216, 1, 1,
0.1323773, 0.04808203, 1.109633, 0, 0.7960784, 1, 1,
0.1364234, -2.153283, 4.169827, 0, 0.7882353, 1, 1,
0.1372762, -0.1894585, 1.987247, 0, 0.7843137, 1, 1,
0.1374467, 1.172768, 1.130672, 0, 0.7764706, 1, 1,
0.1430503, 1.637773, 0.3361066, 0, 0.772549, 1, 1,
0.1458685, 0.7374815, 0.09749033, 0, 0.7647059, 1, 1,
0.1465725, 0.7247311, 0.06352579, 0, 0.7607843, 1, 1,
0.1468008, 1.542611, 1.668305, 0, 0.7529412, 1, 1,
0.147225, -0.1322374, 2.375969, 0, 0.7490196, 1, 1,
0.1475785, 2.063502, -0.6602845, 0, 0.7411765, 1, 1,
0.1484172, -0.6605378, 3.46386, 0, 0.7372549, 1, 1,
0.1490284, 0.7875591, -0.0692882, 0, 0.7294118, 1, 1,
0.1532634, 1.318388, 0.5689296, 0, 0.7254902, 1, 1,
0.1549022, 0.1229366, 1.701787, 0, 0.7176471, 1, 1,
0.1572007, -0.3023094, 3.160473, 0, 0.7137255, 1, 1,
0.1579838, 0.001459311, 1.615961, 0, 0.7058824, 1, 1,
0.160801, -0.0504007, 2.686047, 0, 0.6980392, 1, 1,
0.1608521, 0.2363807, 0.9846659, 0, 0.6941177, 1, 1,
0.1623492, -0.04054291, 3.124753, 0, 0.6862745, 1, 1,
0.1689449, -0.1123413, 1.407763, 0, 0.682353, 1, 1,
0.1703317, -1.090564, 2.749673, 0, 0.6745098, 1, 1,
0.1715938, 0.5754939, 1.792139, 0, 0.6705883, 1, 1,
0.1735032, -0.7411419, 2.872306, 0, 0.6627451, 1, 1,
0.1818748, 1.400418, -0.7707046, 0, 0.6588235, 1, 1,
0.185411, -0.7428778, 2.706609, 0, 0.6509804, 1, 1,
0.1855971, 2.498941, 1.262412, 0, 0.6470588, 1, 1,
0.1896372, 1.385335, 1.58195, 0, 0.6392157, 1, 1,
0.1958456, -0.5581759, 1.854532, 0, 0.6352941, 1, 1,
0.1968943, 0.02134931, 0.5148444, 0, 0.627451, 1, 1,
0.1986512, -0.4110775, 3.912813, 0, 0.6235294, 1, 1,
0.1988711, 0.02151585, 0.3421801, 0, 0.6156863, 1, 1,
0.2002503, 0.3037207, 0.8757373, 0, 0.6117647, 1, 1,
0.2004692, 1.537109, -0.1393824, 0, 0.6039216, 1, 1,
0.2007639, 1.121682, -1.062186, 0, 0.5960785, 1, 1,
0.2011578, 1.159555, 0.4273008, 0, 0.5921569, 1, 1,
0.2042926, -1.156901, 2.73086, 0, 0.5843138, 1, 1,
0.2090626, -1.678624, 2.961671, 0, 0.5803922, 1, 1,
0.2104933, -0.5524628, 5.432351, 0, 0.572549, 1, 1,
0.2151275, 1.40755, -0.855798, 0, 0.5686275, 1, 1,
0.215478, -1.11182, 4.027725, 0, 0.5607843, 1, 1,
0.2193884, 0.8423373, 1.064492, 0, 0.5568628, 1, 1,
0.2244173, 1.641328, -0.5163364, 0, 0.5490196, 1, 1,
0.2250745, 1.243684, 1.192973, 0, 0.5450981, 1, 1,
0.22962, -1.070963, 1.422556, 0, 0.5372549, 1, 1,
0.2302376, 1.352668, 0.2140939, 0, 0.5333334, 1, 1,
0.2332799, 0.2396995, 1.120246, 0, 0.5254902, 1, 1,
0.2388836, 1.766956, -0.08363897, 0, 0.5215687, 1, 1,
0.2394649, 0.9338402, 0.8820447, 0, 0.5137255, 1, 1,
0.2407948, -1.259215, 3.228617, 0, 0.509804, 1, 1,
0.241324, -2.562868, 1.331694, 0, 0.5019608, 1, 1,
0.2507653, -0.4008658, 1.207035, 0, 0.4941176, 1, 1,
0.2519259, -0.3562227, 1.186992, 0, 0.4901961, 1, 1,
0.2556238, -0.4053746, 3.125479, 0, 0.4823529, 1, 1,
0.2583708, -0.4326355, 2.891062, 0, 0.4784314, 1, 1,
0.2596353, -0.3908424, 1.576712, 0, 0.4705882, 1, 1,
0.2688701, -0.0542775, 2.106051, 0, 0.4666667, 1, 1,
0.271065, -0.202955, 2.492684, 0, 0.4588235, 1, 1,
0.2739255, -0.8329408, 2.341836, 0, 0.454902, 1, 1,
0.2818051, 1.288852, -0.04031575, 0, 0.4470588, 1, 1,
0.2834617, 1.40405, 0.8417213, 0, 0.4431373, 1, 1,
0.2872929, -0.6601803, 5.072636, 0, 0.4352941, 1, 1,
0.2902541, -1.160846, 4.669122, 0, 0.4313726, 1, 1,
0.2920785, 0.3888749, 1.077351, 0, 0.4235294, 1, 1,
0.2970355, -1.05355, 0.7865748, 0, 0.4196078, 1, 1,
0.2971068, 0.5970392, -0.1715523, 0, 0.4117647, 1, 1,
0.2973623, 0.4875748, 1.494153, 0, 0.4078431, 1, 1,
0.3029213, -0.8503534, 4.033809, 0, 0.4, 1, 1,
0.304098, 0.1221843, 1.398752, 0, 0.3921569, 1, 1,
0.3109232, 0.2686498, 1.488023, 0, 0.3882353, 1, 1,
0.3110223, 0.5977388, -0.6160765, 0, 0.3803922, 1, 1,
0.3113417, 0.2768577, -0.3603707, 0, 0.3764706, 1, 1,
0.3177356, 1.224833, 0.4061351, 0, 0.3686275, 1, 1,
0.3180354, -0.03429943, 2.669709, 0, 0.3647059, 1, 1,
0.3183158, 1.592926, 1.841996, 0, 0.3568628, 1, 1,
0.3190393, -0.2957911, 3.455739, 0, 0.3529412, 1, 1,
0.3206058, -0.225975, 1.691592, 0, 0.345098, 1, 1,
0.3222772, -0.6094291, 1.212301, 0, 0.3411765, 1, 1,
0.3226845, -0.345862, 2.265407, 0, 0.3333333, 1, 1,
0.3227492, 1.724746, 0.6111967, 0, 0.3294118, 1, 1,
0.3314643, -0.3449455, 1.906509, 0, 0.3215686, 1, 1,
0.3327981, -0.4337282, 2.864702, 0, 0.3176471, 1, 1,
0.3331557, 0.06720866, 1.215278, 0, 0.3098039, 1, 1,
0.3346136, 2.718004, 0.1977062, 0, 0.3058824, 1, 1,
0.336307, -0.2077247, 0.8313287, 0, 0.2980392, 1, 1,
0.3365027, -0.2532204, 2.881809, 0, 0.2901961, 1, 1,
0.339126, 1.092357, 0.6472611, 0, 0.2862745, 1, 1,
0.3429253, 1.15229, -0.04997373, 0, 0.2784314, 1, 1,
0.3444484, -0.6364918, 2.707345, 0, 0.2745098, 1, 1,
0.3512222, -0.9778833, 2.721578, 0, 0.2666667, 1, 1,
0.3551291, 0.6477129, -0.06588824, 0, 0.2627451, 1, 1,
0.358741, -0.5654483, 1.314391, 0, 0.254902, 1, 1,
0.3595658, -0.257288, 2.941679, 0, 0.2509804, 1, 1,
0.3610877, 1.71828, -0.881947, 0, 0.2431373, 1, 1,
0.3639095, 1.453269, 0.07759023, 0, 0.2392157, 1, 1,
0.3659147, 1.564954, 1.949737, 0, 0.2313726, 1, 1,
0.3720663, 0.8361452, 0.7747328, 0, 0.227451, 1, 1,
0.3772845, -1.049571, 2.147608, 0, 0.2196078, 1, 1,
0.3775495, 1.196082, 1.760589, 0, 0.2156863, 1, 1,
0.3780449, 0.5141907, 2.647197, 0, 0.2078431, 1, 1,
0.3794834, -0.3727819, 1.739644, 0, 0.2039216, 1, 1,
0.3812034, 0.2065806, 2.810314, 0, 0.1960784, 1, 1,
0.3830518, -0.4275371, 0.7257999, 0, 0.1882353, 1, 1,
0.3856261, 1.122205, 1.893772, 0, 0.1843137, 1, 1,
0.3913357, -0.77997, 3.652496, 0, 0.1764706, 1, 1,
0.3938242, -2.139063, 1.592524, 0, 0.172549, 1, 1,
0.3971256, -1.540079, 4.990871, 0, 0.1647059, 1, 1,
0.4045329, 0.3606458, 0.2184013, 0, 0.1607843, 1, 1,
0.4065108, -0.2458371, 4.271663, 0, 0.1529412, 1, 1,
0.4081191, 0.8752168, 2.553852, 0, 0.1490196, 1, 1,
0.4104891, -1.039621, 2.185472, 0, 0.1411765, 1, 1,
0.4121113, -0.2633978, 2.063641, 0, 0.1372549, 1, 1,
0.4139185, 2.30978, 1.592258, 0, 0.1294118, 1, 1,
0.4205242, -0.4922208, 3.666023, 0, 0.1254902, 1, 1,
0.4207873, 1.332353, -1.09809, 0, 0.1176471, 1, 1,
0.4220104, 0.2730405, 0.3887514, 0, 0.1137255, 1, 1,
0.4232104, 0.8563422, 1.608811, 0, 0.1058824, 1, 1,
0.4235032, 0.009671314, 1.160861, 0, 0.09803922, 1, 1,
0.4240375, -0.4672513, 2.47184, 0, 0.09411765, 1, 1,
0.4282615, 0.162326, 1.211196, 0, 0.08627451, 1, 1,
0.4351493, -0.6244431, 2.910224, 0, 0.08235294, 1, 1,
0.4367881, -1.738344, 4.223862, 0, 0.07450981, 1, 1,
0.4488406, -0.3653875, 0.9134332, 0, 0.07058824, 1, 1,
0.4524062, -0.5566705, 3.944317, 0, 0.0627451, 1, 1,
0.4526391, -0.4874987, 0.5321641, 0, 0.05882353, 1, 1,
0.453059, -0.399671, 1.540228, 0, 0.05098039, 1, 1,
0.4534796, -0.1038471, 0.1706261, 0, 0.04705882, 1, 1,
0.4565837, -0.515161, 3.413007, 0, 0.03921569, 1, 1,
0.4574436, -0.5598509, 2.193377, 0, 0.03529412, 1, 1,
0.4575264, -0.08004324, 2.586786, 0, 0.02745098, 1, 1,
0.4581005, -0.1933055, 2.549503, 0, 0.02352941, 1, 1,
0.4583322, -0.7458403, 2.350911, 0, 0.01568628, 1, 1,
0.4598418, 0.6122524, 1.685842, 0, 0.01176471, 1, 1,
0.4616269, -0.01295492, -0.06934806, 0, 0.003921569, 1, 1,
0.4622199, -0.7465806, 1.873104, 0.003921569, 0, 1, 1,
0.4631631, -1.12774, 3.260966, 0.007843138, 0, 1, 1,
0.4642026, 1.898943, 0.6241722, 0.01568628, 0, 1, 1,
0.465765, 0.2877199, -1.82484, 0.01960784, 0, 1, 1,
0.4663363, 0.6164789, -0.211788, 0.02745098, 0, 1, 1,
0.4691048, 0.03499332, 1.440256, 0.03137255, 0, 1, 1,
0.4691125, -0.2242653, 0.07617637, 0.03921569, 0, 1, 1,
0.4691186, 1.717814, 0.1382708, 0.04313726, 0, 1, 1,
0.4746795, -0.9556611, 3.60762, 0.05098039, 0, 1, 1,
0.4750676, 0.6460456, -0.3579631, 0.05490196, 0, 1, 1,
0.4778285, -0.3874289, 3.040382, 0.0627451, 0, 1, 1,
0.4780887, 0.5850954, 0.3782195, 0.06666667, 0, 1, 1,
0.4791256, 0.6994388, 3.298861, 0.07450981, 0, 1, 1,
0.4837995, 1.422899, 0.2166381, 0.07843138, 0, 1, 1,
0.4983183, -0.02279636, 2.41945, 0.08627451, 0, 1, 1,
0.4985003, 0.2087475, 0.8175533, 0.09019608, 0, 1, 1,
0.5005735, -1.32533, 3.19687, 0.09803922, 0, 1, 1,
0.504072, -1.217482, 2.837137, 0.1058824, 0, 1, 1,
0.51094, -0.06918791, 1.240011, 0.1098039, 0, 1, 1,
0.5156557, -0.9516885, 2.583092, 0.1176471, 0, 1, 1,
0.5159251, 0.3298166, -0.1821827, 0.1215686, 0, 1, 1,
0.5160022, -0.8204558, 3.066164, 0.1294118, 0, 1, 1,
0.5184087, 0.7220799, 1.422121, 0.1333333, 0, 1, 1,
0.520286, 0.6003123, 1.396739, 0.1411765, 0, 1, 1,
0.5235015, -0.4491934, 2.042989, 0.145098, 0, 1, 1,
0.5246217, 1.739616, 0.4610789, 0.1529412, 0, 1, 1,
0.5268918, 0.2046058, 1.264414, 0.1568628, 0, 1, 1,
0.5281528, 0.08189505, -0.4949141, 0.1647059, 0, 1, 1,
0.5327053, -0.8318661, 1.71438, 0.1686275, 0, 1, 1,
0.5386204, 0.7405537, 0.3788438, 0.1764706, 0, 1, 1,
0.5393968, -1.139415, 2.380239, 0.1803922, 0, 1, 1,
0.5399643, 0.09631144, 2.26154, 0.1882353, 0, 1, 1,
0.5413805, 0.241933, 0.2063102, 0.1921569, 0, 1, 1,
0.5449904, 0.7807895, -0.429978, 0.2, 0, 1, 1,
0.5485269, -0.3972728, 1.543123, 0.2078431, 0, 1, 1,
0.5553555, -1.110983, 2.533609, 0.2117647, 0, 1, 1,
0.5579329, -0.05249957, 0.8503759, 0.2196078, 0, 1, 1,
0.5592934, -1.812907, 4.333256, 0.2235294, 0, 1, 1,
0.5602954, -1.023669, 1.47402, 0.2313726, 0, 1, 1,
0.5617401, -1.280138, 2.003973, 0.2352941, 0, 1, 1,
0.5638496, -0.6254536, 2.586323, 0.2431373, 0, 1, 1,
0.570028, 0.1411555, 1.479227, 0.2470588, 0, 1, 1,
0.5710206, -0.3453704, 2.166669, 0.254902, 0, 1, 1,
0.5744071, 0.623769, 1.955742, 0.2588235, 0, 1, 1,
0.5818194, 1.039793, 1.282831, 0.2666667, 0, 1, 1,
0.5833021, 0.03128826, 2.011482, 0.2705882, 0, 1, 1,
0.5854746, -0.1157982, 2.773536, 0.2784314, 0, 1, 1,
0.5858636, 1.317611, -0.4695751, 0.282353, 0, 1, 1,
0.5859308, 0.6367429, 2.036269, 0.2901961, 0, 1, 1,
0.5860563, 0.203257, 1.304132, 0.2941177, 0, 1, 1,
0.5865401, -0.5260655, 1.518523, 0.3019608, 0, 1, 1,
0.5880516, 2.250653, -1.43971, 0.3098039, 0, 1, 1,
0.5883561, 0.2476143, -0.05030129, 0.3137255, 0, 1, 1,
0.5888379, 0.8978306, 0.1810445, 0.3215686, 0, 1, 1,
0.5897548, -0.204803, 0.7476348, 0.3254902, 0, 1, 1,
0.5900141, 0.6812824, 0.9544267, 0.3333333, 0, 1, 1,
0.5908359, -0.3457946, 2.113201, 0.3372549, 0, 1, 1,
0.5958549, 0.7209742, 1.781894, 0.345098, 0, 1, 1,
0.5972781, 1.246426, 1.903323, 0.3490196, 0, 1, 1,
0.5991666, 1.420065, -0.970603, 0.3568628, 0, 1, 1,
0.5998583, 0.1532649, 1.194186, 0.3607843, 0, 1, 1,
0.6012149, -0.4268556, 2.192613, 0.3686275, 0, 1, 1,
0.6021881, -0.3671253, 2.571832, 0.372549, 0, 1, 1,
0.6036866, 0.8941799, 1.128918, 0.3803922, 0, 1, 1,
0.6041169, 1.450779, -0.05977141, 0.3843137, 0, 1, 1,
0.6098695, 0.7773475, -0.009821248, 0.3921569, 0, 1, 1,
0.610516, -0.2234422, 2.570865, 0.3960784, 0, 1, 1,
0.6189393, 1.438591, 0.3153656, 0.4039216, 0, 1, 1,
0.6211358, -1.168471, 3.488114, 0.4117647, 0, 1, 1,
0.6225092, 0.01415279, 2.993333, 0.4156863, 0, 1, 1,
0.6227038, -0.5603623, 1.633565, 0.4235294, 0, 1, 1,
0.6243186, 1.043767, 1.640989, 0.427451, 0, 1, 1,
0.6291363, 0.8387311, 0.5947769, 0.4352941, 0, 1, 1,
0.6295052, 0.03061237, 2.987267, 0.4392157, 0, 1, 1,
0.630688, 0.6728479, 1.39491, 0.4470588, 0, 1, 1,
0.6342353, -1.797454, 2.386932, 0.4509804, 0, 1, 1,
0.6378456, -0.2916624, 3.123416, 0.4588235, 0, 1, 1,
0.6385875, -0.6358897, 2.348774, 0.4627451, 0, 1, 1,
0.6386721, -0.685438, 1.953176, 0.4705882, 0, 1, 1,
0.6402206, -0.5059624, 4.421089, 0.4745098, 0, 1, 1,
0.6425994, -0.1569206, 0.7957477, 0.4823529, 0, 1, 1,
0.6465587, -0.356224, 2.998145, 0.4862745, 0, 1, 1,
0.6506469, 0.8606335, 0.4733025, 0.4941176, 0, 1, 1,
0.6570598, -0.05760884, 1.128834, 0.5019608, 0, 1, 1,
0.6586628, 0.6186063, 2.143328, 0.5058824, 0, 1, 1,
0.6677487, 0.7534502, -0.02502168, 0.5137255, 0, 1, 1,
0.6680812, -0.2459033, 1.604565, 0.5176471, 0, 1, 1,
0.6731629, -0.8847073, 3.702806, 0.5254902, 0, 1, 1,
0.6762202, 0.5893617, 0.8448815, 0.5294118, 0, 1, 1,
0.676361, -0.9897437, 3.368306, 0.5372549, 0, 1, 1,
0.6829389, 1.300322, 0.1512541, 0.5411765, 0, 1, 1,
0.6864408, -0.8255031, 3.159519, 0.5490196, 0, 1, 1,
0.698296, -0.7683217, 2.952446, 0.5529412, 0, 1, 1,
0.7048646, 0.2993025, 0.1808117, 0.5607843, 0, 1, 1,
0.7084193, 0.8612431, 0.07525846, 0.5647059, 0, 1, 1,
0.7229795, -1.626178, 3.025881, 0.572549, 0, 1, 1,
0.7238426, 0.2087475, 1.522585, 0.5764706, 0, 1, 1,
0.7277063, -0.7579637, 1.647682, 0.5843138, 0, 1, 1,
0.7298653, 0.2963801, 0.1888079, 0.5882353, 0, 1, 1,
0.7352589, -1.475913, 2.56937, 0.5960785, 0, 1, 1,
0.7404394, 0.07034884, 1.082259, 0.6039216, 0, 1, 1,
0.7478299, 0.8869642, -0.09443087, 0.6078432, 0, 1, 1,
0.7493402, 0.1731363, 1.574004, 0.6156863, 0, 1, 1,
0.7545727, 0.6743171, 1.408582, 0.6196079, 0, 1, 1,
0.7559086, 0.5710869, 1.189876, 0.627451, 0, 1, 1,
0.7635746, 0.252964, 1.043042, 0.6313726, 0, 1, 1,
0.7683812, -0.3930711, 0.980649, 0.6392157, 0, 1, 1,
0.7737649, 1.258278, -0.525556, 0.6431373, 0, 1, 1,
0.774093, -0.6998323, 2.046952, 0.6509804, 0, 1, 1,
0.7798296, 0.3476599, 0.7067245, 0.654902, 0, 1, 1,
0.7820272, -0.08442198, 3.157077, 0.6627451, 0, 1, 1,
0.7862206, -0.7383265, 0.1342503, 0.6666667, 0, 1, 1,
0.7883314, -1.035146, 3.135747, 0.6745098, 0, 1, 1,
0.7887115, -0.6959488, 3.076925, 0.6784314, 0, 1, 1,
0.7961034, 0.9377261, 1.970004, 0.6862745, 0, 1, 1,
0.798942, 2.805175, 0.9152936, 0.6901961, 0, 1, 1,
0.8035136, -0.9285919, 2.605586, 0.6980392, 0, 1, 1,
0.8065455, -0.9155474, 1.294234, 0.7058824, 0, 1, 1,
0.8068817, 0.07585682, 3.723917, 0.7098039, 0, 1, 1,
0.807035, -0.4240621, 2.370334, 0.7176471, 0, 1, 1,
0.8090466, 0.6405798, 1.156825, 0.7215686, 0, 1, 1,
0.8109045, -0.5416593, 1.400517, 0.7294118, 0, 1, 1,
0.8144838, -0.9122373, 3.252281, 0.7333333, 0, 1, 1,
0.8184104, -0.1016585, 2.347219, 0.7411765, 0, 1, 1,
0.8203321, -1.608892, 3.68115, 0.7450981, 0, 1, 1,
0.8207455, -0.6966169, 1.979432, 0.7529412, 0, 1, 1,
0.8238644, -0.1354082, 1.941288, 0.7568628, 0, 1, 1,
0.837374, 0.4626691, -0.4955307, 0.7647059, 0, 1, 1,
0.8432106, -1.117891, 2.89085, 0.7686275, 0, 1, 1,
0.8439368, 0.1861473, 0.610041, 0.7764706, 0, 1, 1,
0.8445611, -0.3675025, 1.198323, 0.7803922, 0, 1, 1,
0.8507625, 0.8275338, 1.055156, 0.7882353, 0, 1, 1,
0.8561265, 0.6080606, 1.782477, 0.7921569, 0, 1, 1,
0.8622354, 0.3287947, 0.8399969, 0.8, 0, 1, 1,
0.8663672, 0.6986912, 0.05787253, 0.8078431, 0, 1, 1,
0.882023, -1.343138, 4.410471, 0.8117647, 0, 1, 1,
0.8860089, -0.4266781, 1.515881, 0.8196079, 0, 1, 1,
0.8876541, -0.1537297, -0.08812859, 0.8235294, 0, 1, 1,
0.8882416, -0.5314392, 2.987759, 0.8313726, 0, 1, 1,
0.8883842, -0.189564, 1.665858, 0.8352941, 0, 1, 1,
0.8920041, 0.4580841, 0.5020407, 0.8431373, 0, 1, 1,
0.9016965, -0.1205701, 2.600557, 0.8470588, 0, 1, 1,
0.9059684, 0.0543561, 1.634432, 0.854902, 0, 1, 1,
0.9065061, -0.5699574, 3.615867, 0.8588235, 0, 1, 1,
0.9066889, 0.7649585, 0.1088328, 0.8666667, 0, 1, 1,
0.9101427, -0.7482045, 4.398015, 0.8705882, 0, 1, 1,
0.9107653, 1.220912, 0.7238391, 0.8784314, 0, 1, 1,
0.9132501, 0.2137958, 1.150812, 0.8823529, 0, 1, 1,
0.9151358, 0.8937884, 1.30929, 0.8901961, 0, 1, 1,
0.9157591, 0.2217464, 2.025017, 0.8941177, 0, 1, 1,
0.9167874, 1.350375, 2.825803, 0.9019608, 0, 1, 1,
0.9169588, 1.11026, 0.8714849, 0.9098039, 0, 1, 1,
0.9183319, 1.658641, -0.2040342, 0.9137255, 0, 1, 1,
0.9201412, 2.77105, -0.1753561, 0.9215686, 0, 1, 1,
0.9204144, -0.1622693, 0.0971166, 0.9254902, 0, 1, 1,
0.9231228, 0.2227753, 0.447749, 0.9333333, 0, 1, 1,
0.9285746, 1.378268, 3.260739, 0.9372549, 0, 1, 1,
0.9338394, 2.171662, -0.611329, 0.945098, 0, 1, 1,
0.9344876, -0.5961834, 2.60294, 0.9490196, 0, 1, 1,
0.9443346, -0.835686, 3.162897, 0.9568627, 0, 1, 1,
0.9494726, -1.120828, 0.9429757, 0.9607843, 0, 1, 1,
0.9515294, -1.487374, 2.078661, 0.9686275, 0, 1, 1,
0.9562607, -1.364301, 2.122498, 0.972549, 0, 1, 1,
0.9614193, 0.218071, 0.7969322, 0.9803922, 0, 1, 1,
0.9660113, -1.21218, 1.451621, 0.9843137, 0, 1, 1,
0.9831955, 1.60449, -1.077473, 0.9921569, 0, 1, 1,
0.9898233, 1.475882, 1.507153, 0.9960784, 0, 1, 1,
0.9907601, -0.1010864, 0.9953112, 1, 0, 0.9960784, 1,
1.003208, 0.02517873, 1.391181, 1, 0, 0.9882353, 1,
1.003318, 0.9366377, -0.3160309, 1, 0, 0.9843137, 1,
1.005683, -1.143868, 2.91705, 1, 0, 0.9764706, 1,
1.010623, -0.3057392, 1.001288, 1, 0, 0.972549, 1,
1.013432, -0.2838722, 2.694554, 1, 0, 0.9647059, 1,
1.019633, -0.6590276, 1.587343, 1, 0, 0.9607843, 1,
1.022345, 0.3653998, 0.667271, 1, 0, 0.9529412, 1,
1.030538, 0.946398, -0.5646314, 1, 0, 0.9490196, 1,
1.032462, 0.2124837, 2.325265, 1, 0, 0.9411765, 1,
1.045082, -1.682775, 1.520799, 1, 0, 0.9372549, 1,
1.045682, -0.4746457, 3.594402, 1, 0, 0.9294118, 1,
1.046496, 0.4903714, 1.818339, 1, 0, 0.9254902, 1,
1.046707, -1.756914, 2.052862, 1, 0, 0.9176471, 1,
1.047075, 1.184748, 1.514019, 1, 0, 0.9137255, 1,
1.05238, -0.2422078, 1.775589, 1, 0, 0.9058824, 1,
1.056508, -0.05171655, 2.971126, 1, 0, 0.9019608, 1,
1.06053, -0.8768756, 3.254874, 1, 0, 0.8941177, 1,
1.069527, 0.9501351, 1.235077, 1, 0, 0.8862745, 1,
1.08745, -0.3408279, 0.7528028, 1, 0, 0.8823529, 1,
1.091757, -0.823362, 1.536504, 1, 0, 0.8745098, 1,
1.096058, -0.2768371, 1.902489, 1, 0, 0.8705882, 1,
1.114569, -0.6678234, 1.035396, 1, 0, 0.8627451, 1,
1.114813, -0.5302178, 1.874171, 1, 0, 0.8588235, 1,
1.120448, -0.4462527, 2.101691, 1, 0, 0.8509804, 1,
1.124911, 0.839653, 1.147923, 1, 0, 0.8470588, 1,
1.140913, 0.3259771, 0.981294, 1, 0, 0.8392157, 1,
1.141446, 1.000973, 1.544494, 1, 0, 0.8352941, 1,
1.141541, 1.138104, -0.1195706, 1, 0, 0.827451, 1,
1.146524, 0.06414516, 0.5019686, 1, 0, 0.8235294, 1,
1.148302, 0.2469315, 2.017243, 1, 0, 0.8156863, 1,
1.156683, 1.602553, -1.042865, 1, 0, 0.8117647, 1,
1.158213, -1.444437, 2.038781, 1, 0, 0.8039216, 1,
1.178454, 1.228567, 0.9977381, 1, 0, 0.7960784, 1,
1.178971, 1.080282, 1.232866, 1, 0, 0.7921569, 1,
1.180147, -0.4247673, -1.613869, 1, 0, 0.7843137, 1,
1.183883, 0.6956096, -0.007185875, 1, 0, 0.7803922, 1,
1.18724, -0.02828952, 1.37642, 1, 0, 0.772549, 1,
1.190678, 1.741128, 0.2051958, 1, 0, 0.7686275, 1,
1.194059, -1.764074, 2.631707, 1, 0, 0.7607843, 1,
1.196706, -0.4479377, 0.6336789, 1, 0, 0.7568628, 1,
1.201356, 1.931237, 0.9229662, 1, 0, 0.7490196, 1,
1.202516, -0.9841123, 1.799212, 1, 0, 0.7450981, 1,
1.20652, 1.191902, -0.4665362, 1, 0, 0.7372549, 1,
1.207497, -0.02259392, 2.825351, 1, 0, 0.7333333, 1,
1.213599, 0.5845038, 0.3100528, 1, 0, 0.7254902, 1,
1.21676, -0.2259035, 2.606058, 1, 0, 0.7215686, 1,
1.217916, 0.7225345, 0.9994663, 1, 0, 0.7137255, 1,
1.224259, 0.3679114, 2.288174, 1, 0, 0.7098039, 1,
1.232837, 1.066513, -1.14415, 1, 0, 0.7019608, 1,
1.235075, 1.505053, -0.03101104, 1, 0, 0.6941177, 1,
1.236245, -0.05698293, 3.718473, 1, 0, 0.6901961, 1,
1.237801, 0.2911795, 3.304013, 1, 0, 0.682353, 1,
1.239427, 1.778423, -0.5815402, 1, 0, 0.6784314, 1,
1.245615, -1.104009, 1.459429, 1, 0, 0.6705883, 1,
1.251141, -1.306999, 2.11699, 1, 0, 0.6666667, 1,
1.25187, 0.6891968, 1.678548, 1, 0, 0.6588235, 1,
1.255642, -1.057709, 3.70889, 1, 0, 0.654902, 1,
1.259397, -0.753734, 2.512891, 1, 0, 0.6470588, 1,
1.264364, 0.5216347, 1.07832, 1, 0, 0.6431373, 1,
1.267612, -0.3164043, 2.039085, 1, 0, 0.6352941, 1,
1.268541, -1.350818, 1.692793, 1, 0, 0.6313726, 1,
1.268618, 0.3774044, 0.5184178, 1, 0, 0.6235294, 1,
1.268873, -0.3163242, 3.274594, 1, 0, 0.6196079, 1,
1.269796, -1.159558, 2.396507, 1, 0, 0.6117647, 1,
1.27574, -0.1716072, 2.466856, 1, 0, 0.6078432, 1,
1.286278, 0.2894825, 2.796177, 1, 0, 0.6, 1,
1.287993, 0.175484, 1.687811, 1, 0, 0.5921569, 1,
1.291248, -1.336592, 1.607415, 1, 0, 0.5882353, 1,
1.293769, -1.594551, 0.07232112, 1, 0, 0.5803922, 1,
1.295468, 0.03374821, 2.154154, 1, 0, 0.5764706, 1,
1.304784, 0.3702977, 0.9753287, 1, 0, 0.5686275, 1,
1.325487, 1.464337, 1.008282, 1, 0, 0.5647059, 1,
1.328567, -0.8792251, 2.434431, 1, 0, 0.5568628, 1,
1.329358, -0.4535772, 3.455145, 1, 0, 0.5529412, 1,
1.345323, -1.551846, 1.155198, 1, 0, 0.5450981, 1,
1.353106, 1.366448, 0.1278869, 1, 0, 0.5411765, 1,
1.358789, -0.01903552, 2.029289, 1, 0, 0.5333334, 1,
1.382587, 0.8478138, 1.47718, 1, 0, 0.5294118, 1,
1.405502, -0.5720329, 2.4285, 1, 0, 0.5215687, 1,
1.412211, 0.9677119, 0.5356568, 1, 0, 0.5176471, 1,
1.415498, -1.237388, 2.196877, 1, 0, 0.509804, 1,
1.419839, -1.227024, 2.057684, 1, 0, 0.5058824, 1,
1.426546, -1.004527, 1.640138, 1, 0, 0.4980392, 1,
1.440756, 1.80317, 1.092833, 1, 0, 0.4901961, 1,
1.442469, 1.076817, 0.4394709, 1, 0, 0.4862745, 1,
1.446659, -0.2886834, 0.3217106, 1, 0, 0.4784314, 1,
1.453547, 0.6345086, 2.225708, 1, 0, 0.4745098, 1,
1.467432, 1.313116, 0.1779003, 1, 0, 0.4666667, 1,
1.476348, 1.366476, 2.667503, 1, 0, 0.4627451, 1,
1.483039, 1.004282, -0.06151732, 1, 0, 0.454902, 1,
1.483329, 0.266759, 0.6077564, 1, 0, 0.4509804, 1,
1.487194, 1.967351, 1.910014, 1, 0, 0.4431373, 1,
1.49658, 0.236261, 2.421715, 1, 0, 0.4392157, 1,
1.503599, 0.1467295, 1.962205, 1, 0, 0.4313726, 1,
1.509114, -0.351624, 2.371074, 1, 0, 0.427451, 1,
1.510634, -0.1364097, 1.4038, 1, 0, 0.4196078, 1,
1.511168, -0.482476, 1.528371, 1, 0, 0.4156863, 1,
1.516105, -1.326746, 2.115137, 1, 0, 0.4078431, 1,
1.518128, -1.079806, 0.7194124, 1, 0, 0.4039216, 1,
1.530398, 1.628211, 1.590842, 1, 0, 0.3960784, 1,
1.540719, -0.3402494, 2.160488, 1, 0, 0.3882353, 1,
1.548852, -0.02857977, 3.263764, 1, 0, 0.3843137, 1,
1.554325, -0.3365048, 2.253232, 1, 0, 0.3764706, 1,
1.558202, -1.80074, 2.290485, 1, 0, 0.372549, 1,
1.559521, -1.273724, 1.520347, 1, 0, 0.3647059, 1,
1.565861, 1.179737, 0.5112413, 1, 0, 0.3607843, 1,
1.58109, 0.9606506, 0.849753, 1, 0, 0.3529412, 1,
1.585552, 0.7183259, 3.061231, 1, 0, 0.3490196, 1,
1.602656, -1.183728, 0.2950122, 1, 0, 0.3411765, 1,
1.602923, -0.3645746, 0.2941062, 1, 0, 0.3372549, 1,
1.628521, -0.0710441, 1.077854, 1, 0, 0.3294118, 1,
1.631962, -0.5476511, 2.397741, 1, 0, 0.3254902, 1,
1.647846, -2.829894, 2.331056, 1, 0, 0.3176471, 1,
1.651714, -2.754379, 3.643839, 1, 0, 0.3137255, 1,
1.659105, 0.689296, 0.02425552, 1, 0, 0.3058824, 1,
1.660789, -0.09227478, 1.464271, 1, 0, 0.2980392, 1,
1.664697, -0.8714724, 2.682493, 1, 0, 0.2941177, 1,
1.668824, 1.308561, 1.33415, 1, 0, 0.2862745, 1,
1.676293, -0.1666376, 1.999131, 1, 0, 0.282353, 1,
1.685003, 0.2677003, 2.187418, 1, 0, 0.2745098, 1,
1.699358, -0.06248916, 0.5394544, 1, 0, 0.2705882, 1,
1.722617, 0.2437033, 1.096918, 1, 0, 0.2627451, 1,
1.726882, 0.02064582, 2.696686, 1, 0, 0.2588235, 1,
1.750437, 0.7691604, 0.5673838, 1, 0, 0.2509804, 1,
1.796613, 1.164024, 1.235707, 1, 0, 0.2470588, 1,
1.81103, -2.478662, 2.23034, 1, 0, 0.2392157, 1,
1.818327, -2.148102, 3.226764, 1, 0, 0.2352941, 1,
1.825748, 0.1969939, 0.8033688, 1, 0, 0.227451, 1,
1.826262, -0.4170563, 2.329819, 1, 0, 0.2235294, 1,
1.848073, 2.191142, 1.042784, 1, 0, 0.2156863, 1,
1.850611, 0.4739406, 1.035521, 1, 0, 0.2117647, 1,
1.875351, 1.207546, 0.5374777, 1, 0, 0.2039216, 1,
1.89405, 0.4024402, 1.882562, 1, 0, 0.1960784, 1,
1.897134, 0.7946476, 1.39527, 1, 0, 0.1921569, 1,
1.899304, -0.8326765, 2.371604, 1, 0, 0.1843137, 1,
1.903588, 0.380219, 0.8165112, 1, 0, 0.1803922, 1,
1.920879, -1.652407, 1.389645, 1, 0, 0.172549, 1,
1.944085, -0.8481119, -0.9997638, 1, 0, 0.1686275, 1,
1.980998, -0.578196, 2.256268, 1, 0, 0.1607843, 1,
1.993572, -0.6830006, 1.621143, 1, 0, 0.1568628, 1,
2.021697, 0.9130851, 0.1540854, 1, 0, 0.1490196, 1,
2.061858, 1.176957, 1.778381, 1, 0, 0.145098, 1,
2.080839, 0.4459899, 0.8843117, 1, 0, 0.1372549, 1,
2.087821, 1.605644, 3.346168, 1, 0, 0.1333333, 1,
2.097707, -1.249363, 1.539072, 1, 0, 0.1254902, 1,
2.108448, -0.1074083, -0.1136748, 1, 0, 0.1215686, 1,
2.125392, -0.6088699, 0.9850132, 1, 0, 0.1137255, 1,
2.12896, -0.09224822, 3.339974, 1, 0, 0.1098039, 1,
2.135259, -1.001756, 1.361256, 1, 0, 0.1019608, 1,
2.155468, -1.366433, 3.452275, 1, 0, 0.09411765, 1,
2.182964, -0.1909364, 1.146014, 1, 0, 0.09019608, 1,
2.208903, -0.4378152, 0.618647, 1, 0, 0.08235294, 1,
2.242184, -0.6084661, 2.461548, 1, 0, 0.07843138, 1,
2.247919, 0.1258886, 1.536675, 1, 0, 0.07058824, 1,
2.313217, 1.408288, 2.564729, 1, 0, 0.06666667, 1,
2.317586, 0.1126933, 2.451605, 1, 0, 0.05882353, 1,
2.351946, 0.5503086, 4.225156, 1, 0, 0.05490196, 1,
2.368133, -1.353119, 3.262051, 1, 0, 0.04705882, 1,
2.38691, 0.3533404, 1.581329, 1, 0, 0.04313726, 1,
2.48185, 0.9711827, -0.3912639, 1, 0, 0.03529412, 1,
2.507795, 1.840987, -0.2347127, 1, 0, 0.03137255, 1,
2.525936, -1.82147, 3.860795, 1, 0, 0.02352941, 1,
2.562867, 0.3358943, 1.865335, 1, 0, 0.01960784, 1,
2.710117, -0.8684953, 2.329785, 1, 0, 0.01176471, 1,
3.520676, 0.8903385, 0.7380859, 1, 0, 0.007843138, 1
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
0.3607836, -3.785039, -8.234916, 0, -0.5, 0.5, 0.5,
0.3607836, -3.785039, -8.234916, 1, -0.5, 0.5, 0.5,
0.3607836, -3.785039, -8.234916, 1, 1.5, 0.5, 0.5,
0.3607836, -3.785039, -8.234916, 0, 1.5, 0.5, 0.5
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
-3.870312, -0.0123595, -8.234916, 0, -0.5, 0.5, 0.5,
-3.870312, -0.0123595, -8.234916, 1, -0.5, 0.5, 0.5,
-3.870312, -0.0123595, -8.234916, 1, 1.5, 0.5, 0.5,
-3.870312, -0.0123595, -8.234916, 0, 1.5, 0.5, 0.5
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
-3.870312, -3.785039, -0.2090914, 0, -0.5, 0.5, 0.5,
-3.870312, -3.785039, -0.2090914, 1, -0.5, 0.5, 0.5,
-3.870312, -3.785039, -0.2090914, 1, 1.5, 0.5, 0.5,
-3.870312, -3.785039, -0.2090914, 0, 1.5, 0.5, 0.5
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
-2, -2.91442, -6.382802,
3, -2.91442, -6.382802,
-2, -2.91442, -6.382802,
-2, -3.059523, -6.691488,
-1, -2.91442, -6.382802,
-1, -3.059523, -6.691488,
0, -2.91442, -6.382802,
0, -3.059523, -6.691488,
1, -2.91442, -6.382802,
1, -3.059523, -6.691488,
2, -2.91442, -6.382802,
2, -3.059523, -6.691488,
3, -2.91442, -6.382802,
3, -3.059523, -6.691488
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
-2, -3.34973, -7.308859, 0, -0.5, 0.5, 0.5,
-2, -3.34973, -7.308859, 1, -0.5, 0.5, 0.5,
-2, -3.34973, -7.308859, 1, 1.5, 0.5, 0.5,
-2, -3.34973, -7.308859, 0, 1.5, 0.5, 0.5,
-1, -3.34973, -7.308859, 0, -0.5, 0.5, 0.5,
-1, -3.34973, -7.308859, 1, -0.5, 0.5, 0.5,
-1, -3.34973, -7.308859, 1, 1.5, 0.5, 0.5,
-1, -3.34973, -7.308859, 0, 1.5, 0.5, 0.5,
0, -3.34973, -7.308859, 0, -0.5, 0.5, 0.5,
0, -3.34973, -7.308859, 1, -0.5, 0.5, 0.5,
0, -3.34973, -7.308859, 1, 1.5, 0.5, 0.5,
0, -3.34973, -7.308859, 0, 1.5, 0.5, 0.5,
1, -3.34973, -7.308859, 0, -0.5, 0.5, 0.5,
1, -3.34973, -7.308859, 1, -0.5, 0.5, 0.5,
1, -3.34973, -7.308859, 1, 1.5, 0.5, 0.5,
1, -3.34973, -7.308859, 0, 1.5, 0.5, 0.5,
2, -3.34973, -7.308859, 0, -0.5, 0.5, 0.5,
2, -3.34973, -7.308859, 1, -0.5, 0.5, 0.5,
2, -3.34973, -7.308859, 1, 1.5, 0.5, 0.5,
2, -3.34973, -7.308859, 0, 1.5, 0.5, 0.5,
3, -3.34973, -7.308859, 0, -0.5, 0.5, 0.5,
3, -3.34973, -7.308859, 1, -0.5, 0.5, 0.5,
3, -3.34973, -7.308859, 1, 1.5, 0.5, 0.5,
3, -3.34973, -7.308859, 0, 1.5, 0.5, 0.5
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
-2.893905, -2, -6.382802,
-2.893905, 2, -6.382802,
-2.893905, -2, -6.382802,
-3.05664, -2, -6.691488,
-2.893905, -1, -6.382802,
-3.05664, -1, -6.691488,
-2.893905, 0, -6.382802,
-3.05664, 0, -6.691488,
-2.893905, 1, -6.382802,
-3.05664, 1, -6.691488,
-2.893905, 2, -6.382802,
-3.05664, 2, -6.691488
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
-3.382109, -2, -7.308859, 0, -0.5, 0.5, 0.5,
-3.382109, -2, -7.308859, 1, -0.5, 0.5, 0.5,
-3.382109, -2, -7.308859, 1, 1.5, 0.5, 0.5,
-3.382109, -2, -7.308859, 0, 1.5, 0.5, 0.5,
-3.382109, -1, -7.308859, 0, -0.5, 0.5, 0.5,
-3.382109, -1, -7.308859, 1, -0.5, 0.5, 0.5,
-3.382109, -1, -7.308859, 1, 1.5, 0.5, 0.5,
-3.382109, -1, -7.308859, 0, 1.5, 0.5, 0.5,
-3.382109, 0, -7.308859, 0, -0.5, 0.5, 0.5,
-3.382109, 0, -7.308859, 1, -0.5, 0.5, 0.5,
-3.382109, 0, -7.308859, 1, 1.5, 0.5, 0.5,
-3.382109, 0, -7.308859, 0, 1.5, 0.5, 0.5,
-3.382109, 1, -7.308859, 0, -0.5, 0.5, 0.5,
-3.382109, 1, -7.308859, 1, -0.5, 0.5, 0.5,
-3.382109, 1, -7.308859, 1, 1.5, 0.5, 0.5,
-3.382109, 1, -7.308859, 0, 1.5, 0.5, 0.5,
-3.382109, 2, -7.308859, 0, -0.5, 0.5, 0.5,
-3.382109, 2, -7.308859, 1, -0.5, 0.5, 0.5,
-3.382109, 2, -7.308859, 1, 1.5, 0.5, 0.5,
-3.382109, 2, -7.308859, 0, 1.5, 0.5, 0.5
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
-2.893905, -2.91442, -6,
-2.893905, -2.91442, 4,
-2.893905, -2.91442, -6,
-3.05664, -3.059523, -6,
-2.893905, -2.91442, -4,
-3.05664, -3.059523, -4,
-2.893905, -2.91442, -2,
-3.05664, -3.059523, -2,
-2.893905, -2.91442, 0,
-3.05664, -3.059523, 0,
-2.893905, -2.91442, 2,
-3.05664, -3.059523, 2,
-2.893905, -2.91442, 4,
-3.05664, -3.059523, 4
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
"-6",
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
-3.382109, -3.34973, -6, 0, -0.5, 0.5, 0.5,
-3.382109, -3.34973, -6, 1, -0.5, 0.5, 0.5,
-3.382109, -3.34973, -6, 1, 1.5, 0.5, 0.5,
-3.382109, -3.34973, -6, 0, 1.5, 0.5, 0.5,
-3.382109, -3.34973, -4, 0, -0.5, 0.5, 0.5,
-3.382109, -3.34973, -4, 1, -0.5, 0.5, 0.5,
-3.382109, -3.34973, -4, 1, 1.5, 0.5, 0.5,
-3.382109, -3.34973, -4, 0, 1.5, 0.5, 0.5,
-3.382109, -3.34973, -2, 0, -0.5, 0.5, 0.5,
-3.382109, -3.34973, -2, 1, -0.5, 0.5, 0.5,
-3.382109, -3.34973, -2, 1, 1.5, 0.5, 0.5,
-3.382109, -3.34973, -2, 0, 1.5, 0.5, 0.5,
-3.382109, -3.34973, 0, 0, -0.5, 0.5, 0.5,
-3.382109, -3.34973, 0, 1, -0.5, 0.5, 0.5,
-3.382109, -3.34973, 0, 1, 1.5, 0.5, 0.5,
-3.382109, -3.34973, 0, 0, 1.5, 0.5, 0.5,
-3.382109, -3.34973, 2, 0, -0.5, 0.5, 0.5,
-3.382109, -3.34973, 2, 1, -0.5, 0.5, 0.5,
-3.382109, -3.34973, 2, 1, 1.5, 0.5, 0.5,
-3.382109, -3.34973, 2, 0, 1.5, 0.5, 0.5,
-3.382109, -3.34973, 4, 0, -0.5, 0.5, 0.5,
-3.382109, -3.34973, 4, 1, -0.5, 0.5, 0.5,
-3.382109, -3.34973, 4, 1, 1.5, 0.5, 0.5,
-3.382109, -3.34973, 4, 0, 1.5, 0.5, 0.5
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
-2.893905, -2.91442, -6.382802,
-2.893905, 2.889701, -6.382802,
-2.893905, -2.91442, 5.96462,
-2.893905, 2.889701, 5.96462,
-2.893905, -2.91442, -6.382802,
-2.893905, -2.91442, 5.96462,
-2.893905, 2.889701, -6.382802,
-2.893905, 2.889701, 5.96462,
-2.893905, -2.91442, -6.382802,
3.615472, -2.91442, -6.382802,
-2.893905, -2.91442, 5.96462,
3.615472, -2.91442, 5.96462,
-2.893905, 2.889701, -6.382802,
3.615472, 2.889701, -6.382802,
-2.893905, 2.889701, 5.96462,
3.615472, 2.889701, 5.96462,
3.615472, -2.91442, -6.382802,
3.615472, 2.889701, -6.382802,
3.615472, -2.91442, 5.96462,
3.615472, 2.889701, 5.96462,
3.615472, -2.91442, -6.382802,
3.615472, -2.91442, 5.96462,
3.615472, 2.889701, -6.382802,
3.615472, 2.889701, 5.96462
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
var radius = 8.072096;
var distance = 35.91367;
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
mvMatrix.translate( -0.3607836, 0.0123595, 0.2090914 );
mvMatrix.scale( 1.34079, 1.503709, 0.7068446 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.91367);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
toluate_tert-butyl<-read.table("toluate_tert-butyl.xyz")
```

```
## Error in read.table("toluate_tert-butyl.xyz"): no lines available in input
```

```r
x<-toluate_tert-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
```

```r
y<-toluate_tert-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
```

```r
z<-toluate_tert-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
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
-2.799109, -1.158055, -1.093007, 0, 0, 1, 1, 1,
-2.753337, 1.088974, -1.552449, 1, 0, 0, 1, 1,
-2.598516, 1.247743, -1.803508, 1, 0, 0, 1, 1,
-2.481251, 1.225531, -1.40617, 1, 0, 0, 1, 1,
-2.474382, 1.146613, -0.3524012, 1, 0, 0, 1, 1,
-2.352953, -1.872491, -1.002612, 1, 0, 0, 1, 1,
-2.300734, 1.208199, -0.555196, 0, 0, 0, 1, 1,
-2.29449, -0.1049367, -3.536213, 0, 0, 0, 1, 1,
-2.285422, 0.2781027, -1.206134, 0, 0, 0, 1, 1,
-2.256941, -1.370604, -0.5940107, 0, 0, 0, 1, 1,
-2.217354, -0.5224657, -1.194098, 0, 0, 0, 1, 1,
-2.198617, 0.8674501, -0.8628834, 0, 0, 0, 1, 1,
-2.166914, -0.02070112, -1.060373, 0, 0, 0, 1, 1,
-2.086689, 0.08562803, -0.1625399, 1, 1, 1, 1, 1,
-2.08528, -1.545455, -3.298999, 1, 1, 1, 1, 1,
-2.082487, -0.2303506, -0.5411852, 1, 1, 1, 1, 1,
-2.076127, 0.1943285, -2.781362, 1, 1, 1, 1, 1,
-2.04737, 0.04446907, -2.007758, 1, 1, 1, 1, 1,
-1.991024, -0.30857, -2.197294, 1, 1, 1, 1, 1,
-1.97807, -1.597128, -0.004425622, 1, 1, 1, 1, 1,
-1.975402, -1.20128, -1.628242, 1, 1, 1, 1, 1,
-1.906045, 0.06264593, 0.06831378, 1, 1, 1, 1, 1,
-1.892154, 0.1713963, 0.1780633, 1, 1, 1, 1, 1,
-1.851716, -1.088313, -2.719082, 1, 1, 1, 1, 1,
-1.831848, -0.7947604, -3.83249, 1, 1, 1, 1, 1,
-1.825309, 1.40009, 0.7444659, 1, 1, 1, 1, 1,
-1.821568, -1.382776, -1.317726, 1, 1, 1, 1, 1,
-1.810718, -2.522631, -2.223479, 1, 1, 1, 1, 1,
-1.806592, -0.4833485, -0.3336577, 0, 0, 1, 1, 1,
-1.806119, 0.1213462, -1.790133, 1, 0, 0, 1, 1,
-1.804123, 1.212806, -0.7680627, 1, 0, 0, 1, 1,
-1.797236, 1.149079, -0.8621926, 1, 0, 0, 1, 1,
-1.757351, -1.668715, -2.11612, 1, 0, 0, 1, 1,
-1.748279, 0.2149449, -1.856649, 1, 0, 0, 1, 1,
-1.74277, -0.6029933, -0.2225157, 0, 0, 0, 1, 1,
-1.727081, 1.370093, -2.177236, 0, 0, 0, 1, 1,
-1.699137, 0.3701243, -3.985783, 0, 0, 0, 1, 1,
-1.698122, 0.8534835, -3.619363, 0, 0, 0, 1, 1,
-1.695653, -1.331372, -3.742664, 0, 0, 0, 1, 1,
-1.672106, -0.2902182, -0.1715332, 0, 0, 0, 1, 1,
-1.648561, -0.4535053, -1.853739, 0, 0, 0, 1, 1,
-1.644827, -2.285658, -2.77386, 1, 1, 1, 1, 1,
-1.64389, -0.1198246, -3.186568, 1, 1, 1, 1, 1,
-1.643543, -1.296951, -0.7255387, 1, 1, 1, 1, 1,
-1.631852, 0.3770472, -1.881228, 1, 1, 1, 1, 1,
-1.616012, 0.5184089, -1.338749, 1, 1, 1, 1, 1,
-1.612295, 0.7463614, -1.23047, 1, 1, 1, 1, 1,
-1.609597, 0.8603824, -0.9973992, 1, 1, 1, 1, 1,
-1.607646, 1.044983, -0.5468642, 1, 1, 1, 1, 1,
-1.601341, 1.255577, -0.7191009, 1, 1, 1, 1, 1,
-1.596771, -0.04325189, -1.909932, 1, 1, 1, 1, 1,
-1.574447, 0.5152213, -2.197861, 1, 1, 1, 1, 1,
-1.558372, 0.8750302, 0.4052165, 1, 1, 1, 1, 1,
-1.556787, 0.2590603, -1.077639, 1, 1, 1, 1, 1,
-1.556227, -1.949294, -2.268075, 1, 1, 1, 1, 1,
-1.555195, -0.7475474, -1.819217, 1, 1, 1, 1, 1,
-1.554131, 0.5555347, -0.9380332, 0, 0, 1, 1, 1,
-1.545384, -0.2415545, -3.225178, 1, 0, 0, 1, 1,
-1.536451, -1.013696, -1.197123, 1, 0, 0, 1, 1,
-1.531668, 1.376846, 0.4081271, 1, 0, 0, 1, 1,
-1.52019, 1.054015, -0.5744393, 1, 0, 0, 1, 1,
-1.501369, 1.104079, -0.6721339, 1, 0, 0, 1, 1,
-1.49204, -1.174363, -0.08139046, 0, 0, 0, 1, 1,
-1.481782, -0.9586381, -2.676324, 0, 0, 0, 1, 1,
-1.47179, -1.17821, -2.131217, 0, 0, 0, 1, 1,
-1.436146, -0.3784805, -1.420512, 0, 0, 0, 1, 1,
-1.434008, 0.5496898, -0.7159694, 0, 0, 0, 1, 1,
-1.413955, 0.5933432, -2.01454, 0, 0, 0, 1, 1,
-1.411165, 0.3341035, -0.6092463, 0, 0, 0, 1, 1,
-1.398529, -0.2687773, -0.4681585, 1, 1, 1, 1, 1,
-1.387674, 0.1566921, -2.467792, 1, 1, 1, 1, 1,
-1.382776, -1.061035, -1.513341, 1, 1, 1, 1, 1,
-1.38086, 2.604668, -0.7989454, 1, 1, 1, 1, 1,
-1.374931, -1.20436, -1.178769, 1, 1, 1, 1, 1,
-1.372056, -0.2562832, -2.783184, 1, 1, 1, 1, 1,
-1.36916, 0.428515, -0.5461472, 1, 1, 1, 1, 1,
-1.364546, -0.5140244, -2.598113, 1, 1, 1, 1, 1,
-1.354939, 1.466522, 0.4468943, 1, 1, 1, 1, 1,
-1.344313, 0.256479, -1.007428, 1, 1, 1, 1, 1,
-1.336806, 1.122872, -0.2773313, 1, 1, 1, 1, 1,
-1.336037, -1.300425, -2.567148, 1, 1, 1, 1, 1,
-1.329549, 0.9839513, -0.7186719, 1, 1, 1, 1, 1,
-1.328417, -0.2932785, -0.02479658, 1, 1, 1, 1, 1,
-1.312776, 0.2982211, -1.320739, 1, 1, 1, 1, 1,
-1.309489, 0.6993498, -0.9664137, 0, 0, 1, 1, 1,
-1.306083, 0.1307083, 1.012921, 1, 0, 0, 1, 1,
-1.30594, 0.1107466, -2.45506, 1, 0, 0, 1, 1,
-1.30546, -0.9579784, -2.015164, 1, 0, 0, 1, 1,
-1.305135, 0.3136812, -0.6635067, 1, 0, 0, 1, 1,
-1.285986, -0.7792655, -1.536044, 1, 0, 0, 1, 1,
-1.28577, -0.3747291, -3.244816, 0, 0, 0, 1, 1,
-1.276732, -0.5671542, -3.520049, 0, 0, 0, 1, 1,
-1.27302, 1.122521, 0.4703139, 0, 0, 0, 1, 1,
-1.257695, 1.020911, -1.314667, 0, 0, 0, 1, 1,
-1.254671, 0.5882615, -3.20903, 0, 0, 0, 1, 1,
-1.251831, -0.1604493, -4.094396, 0, 0, 0, 1, 1,
-1.251166, -0.6508538, -2.376105, 0, 0, 0, 1, 1,
-1.246992, 0.7423769, -0.9339009, 1, 1, 1, 1, 1,
-1.237013, 0.3100383, -0.6502451, 1, 1, 1, 1, 1,
-1.235246, 0.6203138, -0.1817422, 1, 1, 1, 1, 1,
-1.232742, 0.5840691, -0.5624746, 1, 1, 1, 1, 1,
-1.221235, -0.951795, -1.941956, 1, 1, 1, 1, 1,
-1.214047, -0.1942791, -0.3621101, 1, 1, 1, 1, 1,
-1.213116, 0.9241623, 0.4704996, 1, 1, 1, 1, 1,
-1.210068, 0.6840358, -0.4385872, 1, 1, 1, 1, 1,
-1.204382, -1.004408, -0.9493908, 1, 1, 1, 1, 1,
-1.200664, 1.301173, 0.2073454, 1, 1, 1, 1, 1,
-1.184115, 0.5916626, -2.56584, 1, 1, 1, 1, 1,
-1.175873, -0.8319668, -2.050952, 1, 1, 1, 1, 1,
-1.165305, 0.8108336, -1.140707, 1, 1, 1, 1, 1,
-1.161869, -0.1795906, -3.436988, 1, 1, 1, 1, 1,
-1.158664, 2.037933, -0.4000941, 1, 1, 1, 1, 1,
-1.129305, -0.293623, -2.533504, 0, 0, 1, 1, 1,
-1.128872, -0.4137807, -2.479253, 1, 0, 0, 1, 1,
-1.124535, 0.06799506, -0.2538206, 1, 0, 0, 1, 1,
-1.12023, 0.5679408, -1.855161, 1, 0, 0, 1, 1,
-1.108965, 1.002207, -1.168289, 1, 0, 0, 1, 1,
-1.106194, 0.09651612, -0.9911111, 1, 0, 0, 1, 1,
-1.101089, 0.8507428, -1.756108, 0, 0, 0, 1, 1,
-1.096599, 0.3921974, -1.776336, 0, 0, 0, 1, 1,
-1.092024, 0.900967, 1.40537, 0, 0, 0, 1, 1,
-1.088824, -1.792135, -2.865708, 0, 0, 0, 1, 1,
-1.088055, 0.7679487, -1.288294, 0, 0, 0, 1, 1,
-1.085832, 1.450608, -0.5615864, 0, 0, 0, 1, 1,
-1.081473, -0.3480326, -1.007212, 0, 0, 0, 1, 1,
-1.070818, -0.1430804, -1.706343, 1, 1, 1, 1, 1,
-1.06965, -0.146, -1.635677, 1, 1, 1, 1, 1,
-1.063115, -0.06216896, -1.893633, 1, 1, 1, 1, 1,
-1.059883, -0.7209743, -1.962585, 1, 1, 1, 1, 1,
-1.049861, -0.8417622, -2.576133, 1, 1, 1, 1, 1,
-1.044523, -0.5262566, -3.70665, 1, 1, 1, 1, 1,
-1.040971, 0.6230502, -0.874893, 1, 1, 1, 1, 1,
-1.033275, -0.7553081, -2.177162, 1, 1, 1, 1, 1,
-1.031393, -1.055834, -3.122483, 1, 1, 1, 1, 1,
-1.025371, 0.1631166, -1.926463, 1, 1, 1, 1, 1,
-1.021731, 0.03013887, -1.437929, 1, 1, 1, 1, 1,
-1.018263, -1.878515, -2.702449, 1, 1, 1, 1, 1,
-1.016279, 0.4047745, -1.453836, 1, 1, 1, 1, 1,
-1.014856, -0.4969184, -0.4032306, 1, 1, 1, 1, 1,
-1.000162, 0.3747274, 0.09485324, 1, 1, 1, 1, 1,
-0.9984182, 1.355471, -1.764814, 0, 0, 1, 1, 1,
-0.9927028, 1.185182, -0.08228606, 1, 0, 0, 1, 1,
-0.9885641, 0.2732633, -0.7440906, 1, 0, 0, 1, 1,
-0.9862216, 0.7558529, -1.487425, 1, 0, 0, 1, 1,
-0.9749559, -0.6448488, -2.224273, 1, 0, 0, 1, 1,
-0.9735883, -1.263758, -4.309553, 1, 0, 0, 1, 1,
-0.9705742, 2.429602, 0.229977, 0, 0, 0, 1, 1,
-0.9619326, -0.6590393, -0.4144615, 0, 0, 0, 1, 1,
-0.9517376, -1.37701, -1.281682, 0, 0, 0, 1, 1,
-0.9455716, -0.04759743, -2.294522, 0, 0, 0, 1, 1,
-0.938526, 1.543358, -0.2088409, 0, 0, 0, 1, 1,
-0.9348752, 0.1999291, 0.2560238, 0, 0, 0, 1, 1,
-0.9337902, -0.2729042, -4.444063, 0, 0, 0, 1, 1,
-0.9332392, -1.860415, -2.996793, 1, 1, 1, 1, 1,
-0.9309857, -0.566344, -0.4762769, 1, 1, 1, 1, 1,
-0.9282816, -0.06674717, -1.8046, 1, 1, 1, 1, 1,
-0.9276052, 1.905379, -0.06555748, 1, 1, 1, 1, 1,
-0.9274924, -0.08180533, -2.233209, 1, 1, 1, 1, 1,
-0.9255318, -1.159783, -1.540565, 1, 1, 1, 1, 1,
-0.9191093, 0.7488112, -2.276474, 1, 1, 1, 1, 1,
-0.913331, -0.3456638, -1.159261, 1, 1, 1, 1, 1,
-0.9127741, 1.104725, -2.511101, 1, 1, 1, 1, 1,
-0.9079856, 0.5300422, -0.6996543, 1, 1, 1, 1, 1,
-0.9058355, 0.2690804, -2.347882, 1, 1, 1, 1, 1,
-0.9021648, 1.394461, 0.02492914, 1, 1, 1, 1, 1,
-0.8954112, -0.2849945, -0.2272886, 1, 1, 1, 1, 1,
-0.8831394, -0.2064525, -4.103906, 1, 1, 1, 1, 1,
-0.8814366, -0.3926921, -2.698748, 1, 1, 1, 1, 1,
-0.8745818, 0.2932944, 0.1364998, 0, 0, 1, 1, 1,
-0.8738645, 0.4106687, -2.440187, 1, 0, 0, 1, 1,
-0.869289, 0.8554757, -0.8199409, 1, 0, 0, 1, 1,
-0.8567978, 0.7631974, -2.464423, 1, 0, 0, 1, 1,
-0.8536706, 0.2814133, -0.7335706, 1, 0, 0, 1, 1,
-0.8515368, -0.1536525, -1.273662, 1, 0, 0, 1, 1,
-0.8411354, 0.1201621, -0.245753, 0, 0, 0, 1, 1,
-0.8404717, 1.592575, 0.5598906, 0, 0, 0, 1, 1,
-0.8322294, -2.010505, -3.423337, 0, 0, 0, 1, 1,
-0.8266904, 0.6752604, -0.1874228, 0, 0, 0, 1, 1,
-0.8211364, 1.34532, -0.586083, 0, 0, 0, 1, 1,
-0.8185458, 0.9737781, -1.460698, 0, 0, 0, 1, 1,
-0.8184099, 0.5431741, -0.4582953, 0, 0, 0, 1, 1,
-0.8159775, 0.5520116, -1.290423, 1, 1, 1, 1, 1,
-0.8122563, 0.3305049, -1.051522, 1, 1, 1, 1, 1,
-0.8078443, -1.037608, -2.43834, 1, 1, 1, 1, 1,
-0.8052143, -1.096824, -2.365813, 1, 1, 1, 1, 1,
-0.7947283, -0.8446944, -1.20505, 1, 1, 1, 1, 1,
-0.7944057, -1.645568, -2.645592, 1, 1, 1, 1, 1,
-0.7920007, -0.6676162, -2.586385, 1, 1, 1, 1, 1,
-0.7863795, -0.8260758, -2.656742, 1, 1, 1, 1, 1,
-0.7821522, -1.049868, -2.799225, 1, 1, 1, 1, 1,
-0.7810814, -0.6469682, -1.175311, 1, 1, 1, 1, 1,
-0.7801487, -2.190905, -2.737344, 1, 1, 1, 1, 1,
-0.7763505, -0.9259666, -3.339935, 1, 1, 1, 1, 1,
-0.7755568, 0.44798, -1.528659, 1, 1, 1, 1, 1,
-0.7744486, 2.454585, 0.2052538, 1, 1, 1, 1, 1,
-0.7733106, 0.6575058, -1.746128, 1, 1, 1, 1, 1,
-0.7721348, 1.244972, -1.343096, 0, 0, 1, 1, 1,
-0.769952, -0.1431371, -2.915643, 1, 0, 0, 1, 1,
-0.7676383, -0.01787721, 0.4602699, 1, 0, 0, 1, 1,
-0.7667447, -0.2709916, -0.5573065, 1, 0, 0, 1, 1,
-0.7666706, 0.633253, -2.044965, 1, 0, 0, 1, 1,
-0.7610372, 1.508581, 0.34707, 1, 0, 0, 1, 1,
-0.7568946, 0.5015385, 0.9097094, 0, 0, 0, 1, 1,
-0.7482395, 0.343201, -0.2972223, 0, 0, 0, 1, 1,
-0.738675, -1.291315, -1.924207, 0, 0, 0, 1, 1,
-0.737924, 0.1513522, -1.589516, 0, 0, 0, 1, 1,
-0.736701, -0.04090143, -2.290963, 0, 0, 0, 1, 1,
-0.7357783, -1.09728, -2.181126, 0, 0, 0, 1, 1,
-0.7226439, 2.348645, 1.205332, 0, 0, 0, 1, 1,
-0.7224248, -0.03262679, -2.509913, 1, 1, 1, 1, 1,
-0.7164456, -1.879, -3.933698, 1, 1, 1, 1, 1,
-0.7156593, 0.3456569, -0.3708625, 1, 1, 1, 1, 1,
-0.7119308, 1.024565, -0.1806218, 1, 1, 1, 1, 1,
-0.7089412, -0.9357069, -5.117157, 1, 1, 1, 1, 1,
-0.7037159, 0.4828485, -2.913811, 1, 1, 1, 1, 1,
-0.7001827, -0.3645965, -2.111523, 1, 1, 1, 1, 1,
-0.6964708, -1.909575, -2.629302, 1, 1, 1, 1, 1,
-0.6942604, 0.9377703, -1.297984, 1, 1, 1, 1, 1,
-0.6845973, -1.853546, -3.540715, 1, 1, 1, 1, 1,
-0.6822341, -0.3577863, -2.643444, 1, 1, 1, 1, 1,
-0.6798467, 0.3676299, -1.949593, 1, 1, 1, 1, 1,
-0.6789044, -0.8354778, -2.63767, 1, 1, 1, 1, 1,
-0.6764746, -0.5814581, -1.82487, 1, 1, 1, 1, 1,
-0.6659842, 0.0003930236, -1.555449, 1, 1, 1, 1, 1,
-0.6647565, -0.2047267, -3.19532, 0, 0, 1, 1, 1,
-0.6630018, 0.2615165, 1.15418, 1, 0, 0, 1, 1,
-0.6620828, 0.3871962, -2.828896, 1, 0, 0, 1, 1,
-0.6538187, -0.76376, -2.968593, 1, 0, 0, 1, 1,
-0.6421912, -0.6362975, -3.266917, 1, 0, 0, 1, 1,
-0.6408133, 1.17454, 0.6517385, 1, 0, 0, 1, 1,
-0.6389737, -1.164557, -2.109257, 0, 0, 0, 1, 1,
-0.6345313, -0.7179081, -1.805, 0, 0, 0, 1, 1,
-0.6337869, 0.7209296, -0.9564846, 0, 0, 0, 1, 1,
-0.6336991, 1.291886, -0.713144, 0, 0, 0, 1, 1,
-0.6336539, -0.4734125, -1.946719, 0, 0, 0, 1, 1,
-0.6333143, 1.371791, -1.066915, 0, 0, 0, 1, 1,
-0.6329451, 0.6699963, -1.756512, 0, 0, 0, 1, 1,
-0.6300941, -1.252689, -1.359276, 1, 1, 1, 1, 1,
-0.6288762, 0.1910385, -4.469707, 1, 1, 1, 1, 1,
-0.6235307, 0.9295384, -3.368618, 1, 1, 1, 1, 1,
-0.6220295, -0.4281272, -0.7003395, 1, 1, 1, 1, 1,
-0.6125817, -0.1429935, -2.553272, 1, 1, 1, 1, 1,
-0.6102998, -1.256386, -3.745042, 1, 1, 1, 1, 1,
-0.6055255, -1.632104, -6.202986, 1, 1, 1, 1, 1,
-0.6001838, 1.389835, 0.2659434, 1, 1, 1, 1, 1,
-0.5980312, -0.6920904, -2.425132, 1, 1, 1, 1, 1,
-0.5972381, 0.5081801, -1.20349, 1, 1, 1, 1, 1,
-0.5941274, -1.269077, -1.994751, 1, 1, 1, 1, 1,
-0.5911444, 0.9525254, 0.3684852, 1, 1, 1, 1, 1,
-0.5880433, 0.2725767, 0.1376765, 1, 1, 1, 1, 1,
-0.5867277, -0.6314004, -2.871149, 1, 1, 1, 1, 1,
-0.5856727, -0.8190102, -1.559182, 1, 1, 1, 1, 1,
-0.5856581, -0.538884, -1.844701, 0, 0, 1, 1, 1,
-0.584874, -0.6127839, -3.243745, 1, 0, 0, 1, 1,
-0.5814874, -0.1932188, -2.533807, 1, 0, 0, 1, 1,
-0.5750931, 1.40735, -0.5919911, 1, 0, 0, 1, 1,
-0.5749514, 1.037695, -0.003298836, 1, 0, 0, 1, 1,
-0.5742468, -1.647272, -0.6899179, 1, 0, 0, 1, 1,
-0.5721378, -0.478935, -2.247811, 0, 0, 0, 1, 1,
-0.5682381, 0.4342008, -1.647355, 0, 0, 0, 1, 1,
-0.5676265, -1.265617, -2.848538, 0, 0, 0, 1, 1,
-0.5657297, -0.02402403, -1.883248, 0, 0, 0, 1, 1,
-0.5637271, 1.384437, 1.274309, 0, 0, 0, 1, 1,
-0.5626283, 0.1955501, 0.32805, 0, 0, 0, 1, 1,
-0.5622283, 0.3860888, 0.01203623, 0, 0, 0, 1, 1,
-0.5611556, -0.9492202, -3.619508, 1, 1, 1, 1, 1,
-0.5585065, -0.7408017, -2.801844, 1, 1, 1, 1, 1,
-0.5566319, -1.63826, -3.94923, 1, 1, 1, 1, 1,
-0.5545873, 0.8263128, -1.049074, 1, 1, 1, 1, 1,
-0.5497512, -0.4147715, -2.834192, 1, 1, 1, 1, 1,
-0.5493658, 0.296356, -0.8832235, 1, 1, 1, 1, 1,
-0.5444323, -0.5028309, -3.794451, 1, 1, 1, 1, 1,
-0.5429617, -0.4374319, -2.310138, 1, 1, 1, 1, 1,
-0.5407491, -0.7103608, -3.118533, 1, 1, 1, 1, 1,
-0.526551, -1.00775, -1.899185, 1, 1, 1, 1, 1,
-0.5197453, -0.6944136, -3.099558, 1, 1, 1, 1, 1,
-0.5182328, -0.3350653, -0.7996088, 1, 1, 1, 1, 1,
-0.5124756, 0.8579975, -1.786943, 1, 1, 1, 1, 1,
-0.5121239, -0.9243824, -3.518915, 1, 1, 1, 1, 1,
-0.5112671, 0.2930532, -2.569548, 1, 1, 1, 1, 1,
-0.5090492, 0.946748, -0.3969136, 0, 0, 1, 1, 1,
-0.5087643, -0.4735365, -2.553114, 1, 0, 0, 1, 1,
-0.5061925, 1.076619, -0.1966656, 1, 0, 0, 1, 1,
-0.5030155, -0.2748334, -2.303782, 1, 0, 0, 1, 1,
-0.5002791, -0.4808652, -3.290218, 1, 0, 0, 1, 1,
-0.5002116, -0.5192931, -1.283261, 1, 0, 0, 1, 1,
-0.4985324, 0.980179, -0.1039053, 0, 0, 0, 1, 1,
-0.4963006, -0.6458656, -4.821381, 0, 0, 0, 1, 1,
-0.4953033, 2.079324, -2.07454, 0, 0, 0, 1, 1,
-0.4925873, 1.060765, 1.569018, 0, 0, 0, 1, 1,
-0.4920679, 0.4254912, -0.69285, 0, 0, 0, 1, 1,
-0.4840555, 0.2890406, -0.9808004, 0, 0, 0, 1, 1,
-0.4840186, 0.1529731, -1.484802, 0, 0, 0, 1, 1,
-0.4728028, 0.5587591, -1.428702, 1, 1, 1, 1, 1,
-0.471234, 0.08883765, -2.294223, 1, 1, 1, 1, 1,
-0.4710099, 0.06748865, -3.428886, 1, 1, 1, 1, 1,
-0.4690357, -0.4562314, -2.691867, 1, 1, 1, 1, 1,
-0.4637263, 0.2187525, -0.7646565, 1, 1, 1, 1, 1,
-0.4613328, 0.290679, -3.475294, 1, 1, 1, 1, 1,
-0.4590496, 0.2642989, 0.487343, 1, 1, 1, 1, 1,
-0.4522196, -0.8052409, -2.277967, 1, 1, 1, 1, 1,
-0.4472193, -0.7772733, -2.042394, 1, 1, 1, 1, 1,
-0.4468375, 0.4247439, -0.2790289, 1, 1, 1, 1, 1,
-0.4445603, -0.6536903, -1.324168, 1, 1, 1, 1, 1,
-0.4430744, 0.2101108, -0.006831198, 1, 1, 1, 1, 1,
-0.4400845, -0.7083916, -2.953863, 1, 1, 1, 1, 1,
-0.4356409, 0.6164969, -0.2440052, 1, 1, 1, 1, 1,
-0.4333555, 0.966879, -0.2935764, 1, 1, 1, 1, 1,
-0.4309296, -0.9043261, -1.771244, 0, 0, 1, 1, 1,
-0.4282537, 0.08963042, -3.218982, 1, 0, 0, 1, 1,
-0.4272872, 0.7480578, -0.6170408, 1, 0, 0, 1, 1,
-0.4262609, -2.46242, -2.138859, 1, 0, 0, 1, 1,
-0.425281, 0.5114449, -0.3655588, 1, 0, 0, 1, 1,
-0.4228277, 1.78501, 0.1102266, 1, 0, 0, 1, 1,
-0.4152733, 0.3024785, 0.2167036, 0, 0, 0, 1, 1,
-0.4122377, 1.072277, -0.8371052, 0, 0, 0, 1, 1,
-0.3997279, -0.1625381, -3.366199, 0, 0, 0, 1, 1,
-0.3989079, -0.05260184, -2.775036, 0, 0, 0, 1, 1,
-0.3958565, 1.91015, -1.951437, 0, 0, 0, 1, 1,
-0.3915892, 1.418398, -0.3798866, 0, 0, 0, 1, 1,
-0.3878143, 0.6817039, -0.8261386, 0, 0, 0, 1, 1,
-0.3849124, 0.5729931, 0.3605061, 1, 1, 1, 1, 1,
-0.3847084, 1.118999, -1.435692, 1, 1, 1, 1, 1,
-0.3795392, 1.831114, -1.472633, 1, 1, 1, 1, 1,
-0.3793787, 0.2261982, 0.0005472417, 1, 1, 1, 1, 1,
-0.3742386, -0.6404697, -1.381146, 1, 1, 1, 1, 1,
-0.3729812, -0.1766412, -2.448509, 1, 1, 1, 1, 1,
-0.3727232, -0.6329401, -1.919494, 1, 1, 1, 1, 1,
-0.3716138, -0.4817284, -2.946833, 1, 1, 1, 1, 1,
-0.3714483, -1.067679, -2.199741, 1, 1, 1, 1, 1,
-0.3698493, -0.221516, -2.810349, 1, 1, 1, 1, 1,
-0.3659189, -0.2218249, -1.371066, 1, 1, 1, 1, 1,
-0.3645397, 0.530758, -0.2804756, 1, 1, 1, 1, 1,
-0.3639237, 0.3316257, -1.697396, 1, 1, 1, 1, 1,
-0.3593268, -0.3454348, -3.884475, 1, 1, 1, 1, 1,
-0.3577438, 1.490655, -1.349473, 1, 1, 1, 1, 1,
-0.3571351, -0.9950326, -2.298501, 0, 0, 1, 1, 1,
-0.3562845, -0.2263723, -3.310094, 1, 0, 0, 1, 1,
-0.3543121, -0.08377255, -1.347432, 1, 0, 0, 1, 1,
-0.35385, 0.2300377, -0.5703675, 1, 0, 0, 1, 1,
-0.3492506, -0.4967393, -4.695774, 1, 0, 0, 1, 1,
-0.3484609, 1.283561, -1.275937, 1, 0, 0, 1, 1,
-0.3483011, -1.151182, -2.542637, 0, 0, 0, 1, 1,
-0.3459092, -0.4477865, -3.593212, 0, 0, 0, 1, 1,
-0.3431216, 1.920275, 0.01705942, 0, 0, 0, 1, 1,
-0.3420788, 0.1550686, -1.740455, 0, 0, 0, 1, 1,
-0.3334407, 1.449261, 0.209337, 0, 0, 0, 1, 1,
-0.3282771, 0.2585273, -1.596186, 0, 0, 0, 1, 1,
-0.3249193, 0.7117794, 0.6356539, 0, 0, 0, 1, 1,
-0.3238744, 0.6608157, -1.368139, 1, 1, 1, 1, 1,
-0.3223628, -1.270879, -3.862445, 1, 1, 1, 1, 1,
-0.3203174, -0.2759756, -2.56881, 1, 1, 1, 1, 1,
-0.3184147, 0.8564247, 0.2610574, 1, 1, 1, 1, 1,
-0.3163669, 1.294732, -0.6823105, 1, 1, 1, 1, 1,
-0.3154692, -0.4701631, -2.14546, 1, 1, 1, 1, 1,
-0.3118602, 0.9395163, -1.984478, 1, 1, 1, 1, 1,
-0.3087161, 1.540889, 0.1147932, 1, 1, 1, 1, 1,
-0.2986537, 0.717249, -0.2390055, 1, 1, 1, 1, 1,
-0.2936947, -0.1029085, -2.616248, 1, 1, 1, 1, 1,
-0.2905039, -1.480272, -1.75081, 1, 1, 1, 1, 1,
-0.2904187, 0.7431496, 1.063501, 1, 1, 1, 1, 1,
-0.2882079, 0.9225581, -1.28565, 1, 1, 1, 1, 1,
-0.2853211, 0.5741609, -1.068258, 1, 1, 1, 1, 1,
-0.2832215, -0.502127, -2.677535, 1, 1, 1, 1, 1,
-0.2807209, -0.2450416, -1.546465, 0, 0, 1, 1, 1,
-0.2788495, 0.1143654, -2.996497, 1, 0, 0, 1, 1,
-0.2767087, -0.4060811, -3.283627, 1, 0, 0, 1, 1,
-0.2736185, -0.3701144, -3.395625, 1, 0, 0, 1, 1,
-0.2730147, 0.7259722, -0.6256976, 1, 0, 0, 1, 1,
-0.2703343, -0.3884515, -2.355479, 1, 0, 0, 1, 1,
-0.269816, 0.3611053, -3.040697, 0, 0, 0, 1, 1,
-0.2672158, 0.5207162, 0.7824045, 0, 0, 0, 1, 1,
-0.263485, -0.006503954, -0.3933903, 0, 0, 0, 1, 1,
-0.2560342, -1.757627, -3.199521, 0, 0, 0, 1, 1,
-0.2496954, 1.08464, -0.439537, 0, 0, 0, 1, 1,
-0.2495841, 0.8305386, 0.7800245, 0, 0, 0, 1, 1,
-0.2494675, -0.4555024, -2.628999, 0, 0, 0, 1, 1,
-0.2491461, -1.347025, -2.59548, 1, 1, 1, 1, 1,
-0.2365101, -2.000185, -2.833617, 1, 1, 1, 1, 1,
-0.2362196, 1.380723, -1.171827, 1, 1, 1, 1, 1,
-0.2326673, 0.004304467, -0.1665317, 1, 1, 1, 1, 1,
-0.2299658, 0.2231361, -2.483719, 1, 1, 1, 1, 1,
-0.2259015, -0.09357632, -0.5115628, 1, 1, 1, 1, 1,
-0.2257856, 0.6556294, 2.449701, 1, 1, 1, 1, 1,
-0.2253172, 1.547467, 0.854643, 1, 1, 1, 1, 1,
-0.225157, -0.1682755, -2.735516, 1, 1, 1, 1, 1,
-0.2162205, -0.8083097, -3.962621, 1, 1, 1, 1, 1,
-0.2095731, -0.5657402, -3.783919, 1, 1, 1, 1, 1,
-0.2093035, 0.8503762, -0.5918103, 1, 1, 1, 1, 1,
-0.2045896, -0.2516306, -2.724007, 1, 1, 1, 1, 1,
-0.2036724, 0.2967387, 0.06768128, 1, 1, 1, 1, 1,
-0.200185, 0.8516526, 0.01763346, 1, 1, 1, 1, 1,
-0.1995141, -0.2065811, -3.429069, 0, 0, 1, 1, 1,
-0.1977323, 0.5911779, -0.002762359, 1, 0, 0, 1, 1,
-0.1970448, -0.907327, -1.34079, 1, 0, 0, 1, 1,
-0.1965935, -0.6220315, -2.035892, 1, 0, 0, 1, 1,
-0.1957748, -1.237504, -1.588408, 1, 0, 0, 1, 1,
-0.1936923, 1.35524, -1.225566, 1, 0, 0, 1, 1,
-0.1912584, 0.07542222, -2.161359, 0, 0, 0, 1, 1,
-0.1883069, 1.355292, -1.085155, 0, 0, 0, 1, 1,
-0.1865966, 0.7023139, 1.053063, 0, 0, 0, 1, 1,
-0.1839099, 0.3258587, 0.764882, 0, 0, 0, 1, 1,
-0.1836475, 0.8280387, -0.5593897, 0, 0, 0, 1, 1,
-0.1831322, -1.323155, -3.386367, 0, 0, 0, 1, 1,
-0.1797822, -0.6012591, -3.987138, 0, 0, 0, 1, 1,
-0.1765021, 0.5019146, 0.09635293, 1, 1, 1, 1, 1,
-0.1753595, -0.01087732, -1.109569, 1, 1, 1, 1, 1,
-0.1744963, -0.07205894, -3.049733, 1, 1, 1, 1, 1,
-0.1705945, 1.351465, -0.3045165, 1, 1, 1, 1, 1,
-0.1690274, 1.024151, 0.3595687, 1, 1, 1, 1, 1,
-0.1652901, -0.3805512, -3.721544, 1, 1, 1, 1, 1,
-0.1633846, -0.4241356, -2.834629, 1, 1, 1, 1, 1,
-0.1572066, 0.01987942, -1.725958, 1, 1, 1, 1, 1,
-0.1564659, 0.580259, 0.6427798, 1, 1, 1, 1, 1,
-0.1543626, -0.8311135, -2.966506, 1, 1, 1, 1, 1,
-0.1518113, 0.921393, -0.9979982, 1, 1, 1, 1, 1,
-0.1500213, 0.4091451, -0.06433576, 1, 1, 1, 1, 1,
-0.1497611, 1.108151, -0.2120471, 1, 1, 1, 1, 1,
-0.1493521, -0.6138011, -3.237107, 1, 1, 1, 1, 1,
-0.1481121, 0.3797458, 0.03615187, 1, 1, 1, 1, 1,
-0.1465111, 1.612304, -0.2176464, 0, 0, 1, 1, 1,
-0.1460866, 0.6525357, 1.138097, 1, 0, 0, 1, 1,
-0.1426344, -0.3082765, -2.064709, 1, 0, 0, 1, 1,
-0.1403378, 0.4050689, 0.9577798, 1, 0, 0, 1, 1,
-0.1391053, 0.8646461, -0.2024792, 1, 0, 0, 1, 1,
-0.1384843, -0.1002661, -1.554714, 1, 0, 0, 1, 1,
-0.1384534, 0.1314354, -1.324233, 0, 0, 0, 1, 1,
-0.1365585, 1.05208, 0.1612525, 0, 0, 0, 1, 1,
-0.1357663, 0.3282761, -0.7003043, 0, 0, 0, 1, 1,
-0.1248317, -0.7439008, -3.39389, 0, 0, 0, 1, 1,
-0.124396, -0.5500002, -3.991809, 0, 0, 0, 1, 1,
-0.1180491, -0.6846417, -2.230889, 0, 0, 0, 1, 1,
-0.1140025, 0.105788, -0.9708868, 0, 0, 0, 1, 1,
-0.1055421, 0.970382, -0.7582577, 1, 1, 1, 1, 1,
-0.1053265, -1.305777, -3.433086, 1, 1, 1, 1, 1,
-0.1012308, 0.2446952, -0.4743263, 1, 1, 1, 1, 1,
-0.09725701, -0.316514, -2.929052, 1, 1, 1, 1, 1,
-0.09545965, 0.3460517, 0.02927655, 1, 1, 1, 1, 1,
-0.09441803, 0.6307285, -1.366946, 1, 1, 1, 1, 1,
-0.08927567, -0.5740921, -4.916499, 1, 1, 1, 1, 1,
-0.08444665, 0.7074332, -0.2461799, 1, 1, 1, 1, 1,
-0.07772737, 0.04080309, 0.2171704, 1, 1, 1, 1, 1,
-0.07692969, -0.2806376, -3.288995, 1, 1, 1, 1, 1,
-0.07250767, 1.006683, -1.479772, 1, 1, 1, 1, 1,
-0.06320228, 1.346283, 0.9506803, 1, 1, 1, 1, 1,
-0.0623874, -0.00981533, -2.447814, 1, 1, 1, 1, 1,
-0.06073593, 0.4042437, 1.787686, 1, 1, 1, 1, 1,
-0.055102, -0.1989769, -1.314677, 1, 1, 1, 1, 1,
-0.05353668, 0.02404024, 0.4454575, 0, 0, 1, 1, 1,
-0.04670314, 0.4641381, -0.9171534, 1, 0, 0, 1, 1,
-0.0456267, 1.541478, 0.9895402, 1, 0, 0, 1, 1,
-0.04469509, 0.3121141, -2.751472, 1, 0, 0, 1, 1,
-0.04323302, -0.7069992, -3.133599, 1, 0, 0, 1, 1,
-0.03871181, 0.4008796, -0.4647481, 1, 0, 0, 1, 1,
-0.03788926, -0.4799108, -2.500557, 0, 0, 0, 1, 1,
-0.03276139, 0.6252142, 0.3554782, 0, 0, 0, 1, 1,
-0.03263769, -0.7580449, -2.796581, 0, 0, 0, 1, 1,
-0.02655825, -0.2236121, -2.474194, 0, 0, 0, 1, 1,
-0.02428612, 0.2089214, 0.3216892, 0, 0, 0, 1, 1,
-0.02352777, -0.7955964, -4.261053, 0, 0, 0, 1, 1,
-0.02161063, 0.4093353, 0.4845328, 0, 0, 0, 1, 1,
-0.02058164, 1.402773, 0.2988452, 1, 1, 1, 1, 1,
-0.01719065, -0.3560509, -4.725915, 1, 1, 1, 1, 1,
-0.01567642, 0.5276477, -1.812847, 1, 1, 1, 1, 1,
-0.01124287, 2.326211, -0.4789202, 1, 1, 1, 1, 1,
-0.009328437, 0.4727907, 0.6439307, 1, 1, 1, 1, 1,
-0.008316124, 2.275445, -1.002504, 1, 1, 1, 1, 1,
-0.007857583, 0.1979415, 0.4773929, 1, 1, 1, 1, 1,
-0.006506702, -0.07088354, -3.990216, 1, 1, 1, 1, 1,
-0.006021887, -0.8474808, -3.193089, 1, 1, 1, 1, 1,
0.006709269, 0.8076469, -0.2560113, 1, 1, 1, 1, 1,
0.006812336, -0.5866738, 1.943087, 1, 1, 1, 1, 1,
0.008741837, 1.114607, 0.09260115, 1, 1, 1, 1, 1,
0.009451924, -0.5826101, 3.851488, 1, 1, 1, 1, 1,
0.01028859, -0.6377273, 2.526858, 1, 1, 1, 1, 1,
0.01330361, 0.208148, 2.256824, 1, 1, 1, 1, 1,
0.02189824, -0.3165863, 3.759074, 0, 0, 1, 1, 1,
0.02896716, -0.1569903, 2.837838, 1, 0, 0, 1, 1,
0.02915636, 0.1631503, 1.364272, 1, 0, 0, 1, 1,
0.03000247, 0.8789767, 1.336479, 1, 0, 0, 1, 1,
0.03016524, 0.7604367, 0.3430172, 1, 0, 0, 1, 1,
0.0319145, 2.071603, -1.184027, 1, 0, 0, 1, 1,
0.03359731, -0.5498444, 2.857372, 0, 0, 0, 1, 1,
0.03470024, 0.961198, 0.1470533, 0, 0, 0, 1, 1,
0.03568653, 0.01695257, 0.4696345, 0, 0, 0, 1, 1,
0.0403081, 0.7094769, -0.9903783, 0, 0, 0, 1, 1,
0.04102615, -1.510916, 2.022911, 0, 0, 0, 1, 1,
0.04747167, -0.5291252, 1.979135, 0, 0, 0, 1, 1,
0.04852116, 0.5728482, -0.6633849, 0, 0, 0, 1, 1,
0.04925279, -0.5517913, 3.093773, 1, 1, 1, 1, 1,
0.05274034, 0.5368446, -0.6661647, 1, 1, 1, 1, 1,
0.05283099, 2.032489, -0.6332656, 1, 1, 1, 1, 1,
0.05314077, 1.02485, -1.130869, 1, 1, 1, 1, 1,
0.05524081, 1.463819, 1.04076, 1, 1, 1, 1, 1,
0.05583175, 0.1484008, -0.03280278, 1, 1, 1, 1, 1,
0.05629836, -1.01436, 3.576549, 1, 1, 1, 1, 1,
0.05728147, 0.1519366, 1.279235, 1, 1, 1, 1, 1,
0.05728732, -0.3997905, 2.081388, 1, 1, 1, 1, 1,
0.05851354, -0.3846379, 5.784803, 1, 1, 1, 1, 1,
0.06093793, 0.485566, 2.129513, 1, 1, 1, 1, 1,
0.06265637, 0.5310281, -0.4907569, 1, 1, 1, 1, 1,
0.06585013, -0.3358793, 2.722835, 1, 1, 1, 1, 1,
0.06752583, -0.07672173, 1.116752, 1, 1, 1, 1, 1,
0.06880072, -0.5186073, 4.194308, 1, 1, 1, 1, 1,
0.07186404, 1.771921, 1.937289, 0, 0, 1, 1, 1,
0.07471294, 0.7363561, 1.39257, 1, 0, 0, 1, 1,
0.07719351, 0.3302342, 0.2118814, 1, 0, 0, 1, 1,
0.08411795, -1.448186, 2.530754, 1, 0, 0, 1, 1,
0.08464676, -1.562578, 3.209409, 1, 0, 0, 1, 1,
0.08467788, -0.004625482, 2.115036, 1, 0, 0, 1, 1,
0.08730865, 0.947906, 1.472912, 0, 0, 0, 1, 1,
0.0950909, 0.4502896, 1.430788, 0, 0, 0, 1, 1,
0.09533913, 0.7134561, 1.466749, 0, 0, 0, 1, 1,
0.0960645, 0.9132174, -0.3759414, 0, 0, 0, 1, 1,
0.096123, -0.2988316, 2.821042, 0, 0, 0, 1, 1,
0.09713434, -1.370007, 1.174985, 0, 0, 0, 1, 1,
0.09731665, 0.8560964, -0.6414692, 0, 0, 0, 1, 1,
0.0976131, 0.627037, -0.4822395, 1, 1, 1, 1, 1,
0.09906791, -1.244234, 2.797274, 1, 1, 1, 1, 1,
0.1009021, -0.3718552, 4.931174, 1, 1, 1, 1, 1,
0.101356, 0.5691526, 1.657538, 1, 1, 1, 1, 1,
0.1024198, 0.2917524, 0.08831454, 1, 1, 1, 1, 1,
0.1032351, 1.597611, -0.8907529, 1, 1, 1, 1, 1,
0.1064713, -0.04103784, 2.997779, 1, 1, 1, 1, 1,
0.1079806, -0.4465257, 4.102013, 1, 1, 1, 1, 1,
0.1131947, -0.712145, 3.415734, 1, 1, 1, 1, 1,
0.1152639, -0.8779917, 2.419304, 1, 1, 1, 1, 1,
0.115767, -1.151775, 2.529303, 1, 1, 1, 1, 1,
0.1188541, 0.8548456, 0.842591, 1, 1, 1, 1, 1,
0.1193538, 0.2771479, 0.1150054, 1, 1, 1, 1, 1,
0.1242179, 0.3060536, -0.5606266, 1, 1, 1, 1, 1,
0.1256629, 2.018257, 1.817122, 1, 1, 1, 1, 1,
0.1296078, -0.3554114, 4.494138, 0, 0, 1, 1, 1,
0.1318682, -0.227964, 2.071542, 1, 0, 0, 1, 1,
0.1323773, 0.04808203, 1.109633, 1, 0, 0, 1, 1,
0.1364234, -2.153283, 4.169827, 1, 0, 0, 1, 1,
0.1372762, -0.1894585, 1.987247, 1, 0, 0, 1, 1,
0.1374467, 1.172768, 1.130672, 1, 0, 0, 1, 1,
0.1430503, 1.637773, 0.3361066, 0, 0, 0, 1, 1,
0.1458685, 0.7374815, 0.09749033, 0, 0, 0, 1, 1,
0.1465725, 0.7247311, 0.06352579, 0, 0, 0, 1, 1,
0.1468008, 1.542611, 1.668305, 0, 0, 0, 1, 1,
0.147225, -0.1322374, 2.375969, 0, 0, 0, 1, 1,
0.1475785, 2.063502, -0.6602845, 0, 0, 0, 1, 1,
0.1484172, -0.6605378, 3.46386, 0, 0, 0, 1, 1,
0.1490284, 0.7875591, -0.0692882, 1, 1, 1, 1, 1,
0.1532634, 1.318388, 0.5689296, 1, 1, 1, 1, 1,
0.1549022, 0.1229366, 1.701787, 1, 1, 1, 1, 1,
0.1572007, -0.3023094, 3.160473, 1, 1, 1, 1, 1,
0.1579838, 0.001459311, 1.615961, 1, 1, 1, 1, 1,
0.160801, -0.0504007, 2.686047, 1, 1, 1, 1, 1,
0.1608521, 0.2363807, 0.9846659, 1, 1, 1, 1, 1,
0.1623492, -0.04054291, 3.124753, 1, 1, 1, 1, 1,
0.1689449, -0.1123413, 1.407763, 1, 1, 1, 1, 1,
0.1703317, -1.090564, 2.749673, 1, 1, 1, 1, 1,
0.1715938, 0.5754939, 1.792139, 1, 1, 1, 1, 1,
0.1735032, -0.7411419, 2.872306, 1, 1, 1, 1, 1,
0.1818748, 1.400418, -0.7707046, 1, 1, 1, 1, 1,
0.185411, -0.7428778, 2.706609, 1, 1, 1, 1, 1,
0.1855971, 2.498941, 1.262412, 1, 1, 1, 1, 1,
0.1896372, 1.385335, 1.58195, 0, 0, 1, 1, 1,
0.1958456, -0.5581759, 1.854532, 1, 0, 0, 1, 1,
0.1968943, 0.02134931, 0.5148444, 1, 0, 0, 1, 1,
0.1986512, -0.4110775, 3.912813, 1, 0, 0, 1, 1,
0.1988711, 0.02151585, 0.3421801, 1, 0, 0, 1, 1,
0.2002503, 0.3037207, 0.8757373, 1, 0, 0, 1, 1,
0.2004692, 1.537109, -0.1393824, 0, 0, 0, 1, 1,
0.2007639, 1.121682, -1.062186, 0, 0, 0, 1, 1,
0.2011578, 1.159555, 0.4273008, 0, 0, 0, 1, 1,
0.2042926, -1.156901, 2.73086, 0, 0, 0, 1, 1,
0.2090626, -1.678624, 2.961671, 0, 0, 0, 1, 1,
0.2104933, -0.5524628, 5.432351, 0, 0, 0, 1, 1,
0.2151275, 1.40755, -0.855798, 0, 0, 0, 1, 1,
0.215478, -1.11182, 4.027725, 1, 1, 1, 1, 1,
0.2193884, 0.8423373, 1.064492, 1, 1, 1, 1, 1,
0.2244173, 1.641328, -0.5163364, 1, 1, 1, 1, 1,
0.2250745, 1.243684, 1.192973, 1, 1, 1, 1, 1,
0.22962, -1.070963, 1.422556, 1, 1, 1, 1, 1,
0.2302376, 1.352668, 0.2140939, 1, 1, 1, 1, 1,
0.2332799, 0.2396995, 1.120246, 1, 1, 1, 1, 1,
0.2388836, 1.766956, -0.08363897, 1, 1, 1, 1, 1,
0.2394649, 0.9338402, 0.8820447, 1, 1, 1, 1, 1,
0.2407948, -1.259215, 3.228617, 1, 1, 1, 1, 1,
0.241324, -2.562868, 1.331694, 1, 1, 1, 1, 1,
0.2507653, -0.4008658, 1.207035, 1, 1, 1, 1, 1,
0.2519259, -0.3562227, 1.186992, 1, 1, 1, 1, 1,
0.2556238, -0.4053746, 3.125479, 1, 1, 1, 1, 1,
0.2583708, -0.4326355, 2.891062, 1, 1, 1, 1, 1,
0.2596353, -0.3908424, 1.576712, 0, 0, 1, 1, 1,
0.2688701, -0.0542775, 2.106051, 1, 0, 0, 1, 1,
0.271065, -0.202955, 2.492684, 1, 0, 0, 1, 1,
0.2739255, -0.8329408, 2.341836, 1, 0, 0, 1, 1,
0.2818051, 1.288852, -0.04031575, 1, 0, 0, 1, 1,
0.2834617, 1.40405, 0.8417213, 1, 0, 0, 1, 1,
0.2872929, -0.6601803, 5.072636, 0, 0, 0, 1, 1,
0.2902541, -1.160846, 4.669122, 0, 0, 0, 1, 1,
0.2920785, 0.3888749, 1.077351, 0, 0, 0, 1, 1,
0.2970355, -1.05355, 0.7865748, 0, 0, 0, 1, 1,
0.2971068, 0.5970392, -0.1715523, 0, 0, 0, 1, 1,
0.2973623, 0.4875748, 1.494153, 0, 0, 0, 1, 1,
0.3029213, -0.8503534, 4.033809, 0, 0, 0, 1, 1,
0.304098, 0.1221843, 1.398752, 1, 1, 1, 1, 1,
0.3109232, 0.2686498, 1.488023, 1, 1, 1, 1, 1,
0.3110223, 0.5977388, -0.6160765, 1, 1, 1, 1, 1,
0.3113417, 0.2768577, -0.3603707, 1, 1, 1, 1, 1,
0.3177356, 1.224833, 0.4061351, 1, 1, 1, 1, 1,
0.3180354, -0.03429943, 2.669709, 1, 1, 1, 1, 1,
0.3183158, 1.592926, 1.841996, 1, 1, 1, 1, 1,
0.3190393, -0.2957911, 3.455739, 1, 1, 1, 1, 1,
0.3206058, -0.225975, 1.691592, 1, 1, 1, 1, 1,
0.3222772, -0.6094291, 1.212301, 1, 1, 1, 1, 1,
0.3226845, -0.345862, 2.265407, 1, 1, 1, 1, 1,
0.3227492, 1.724746, 0.6111967, 1, 1, 1, 1, 1,
0.3314643, -0.3449455, 1.906509, 1, 1, 1, 1, 1,
0.3327981, -0.4337282, 2.864702, 1, 1, 1, 1, 1,
0.3331557, 0.06720866, 1.215278, 1, 1, 1, 1, 1,
0.3346136, 2.718004, 0.1977062, 0, 0, 1, 1, 1,
0.336307, -0.2077247, 0.8313287, 1, 0, 0, 1, 1,
0.3365027, -0.2532204, 2.881809, 1, 0, 0, 1, 1,
0.339126, 1.092357, 0.6472611, 1, 0, 0, 1, 1,
0.3429253, 1.15229, -0.04997373, 1, 0, 0, 1, 1,
0.3444484, -0.6364918, 2.707345, 1, 0, 0, 1, 1,
0.3512222, -0.9778833, 2.721578, 0, 0, 0, 1, 1,
0.3551291, 0.6477129, -0.06588824, 0, 0, 0, 1, 1,
0.358741, -0.5654483, 1.314391, 0, 0, 0, 1, 1,
0.3595658, -0.257288, 2.941679, 0, 0, 0, 1, 1,
0.3610877, 1.71828, -0.881947, 0, 0, 0, 1, 1,
0.3639095, 1.453269, 0.07759023, 0, 0, 0, 1, 1,
0.3659147, 1.564954, 1.949737, 0, 0, 0, 1, 1,
0.3720663, 0.8361452, 0.7747328, 1, 1, 1, 1, 1,
0.3772845, -1.049571, 2.147608, 1, 1, 1, 1, 1,
0.3775495, 1.196082, 1.760589, 1, 1, 1, 1, 1,
0.3780449, 0.5141907, 2.647197, 1, 1, 1, 1, 1,
0.3794834, -0.3727819, 1.739644, 1, 1, 1, 1, 1,
0.3812034, 0.2065806, 2.810314, 1, 1, 1, 1, 1,
0.3830518, -0.4275371, 0.7257999, 1, 1, 1, 1, 1,
0.3856261, 1.122205, 1.893772, 1, 1, 1, 1, 1,
0.3913357, -0.77997, 3.652496, 1, 1, 1, 1, 1,
0.3938242, -2.139063, 1.592524, 1, 1, 1, 1, 1,
0.3971256, -1.540079, 4.990871, 1, 1, 1, 1, 1,
0.4045329, 0.3606458, 0.2184013, 1, 1, 1, 1, 1,
0.4065108, -0.2458371, 4.271663, 1, 1, 1, 1, 1,
0.4081191, 0.8752168, 2.553852, 1, 1, 1, 1, 1,
0.4104891, -1.039621, 2.185472, 1, 1, 1, 1, 1,
0.4121113, -0.2633978, 2.063641, 0, 0, 1, 1, 1,
0.4139185, 2.30978, 1.592258, 1, 0, 0, 1, 1,
0.4205242, -0.4922208, 3.666023, 1, 0, 0, 1, 1,
0.4207873, 1.332353, -1.09809, 1, 0, 0, 1, 1,
0.4220104, 0.2730405, 0.3887514, 1, 0, 0, 1, 1,
0.4232104, 0.8563422, 1.608811, 1, 0, 0, 1, 1,
0.4235032, 0.009671314, 1.160861, 0, 0, 0, 1, 1,
0.4240375, -0.4672513, 2.47184, 0, 0, 0, 1, 1,
0.4282615, 0.162326, 1.211196, 0, 0, 0, 1, 1,
0.4351493, -0.6244431, 2.910224, 0, 0, 0, 1, 1,
0.4367881, -1.738344, 4.223862, 0, 0, 0, 1, 1,
0.4488406, -0.3653875, 0.9134332, 0, 0, 0, 1, 1,
0.4524062, -0.5566705, 3.944317, 0, 0, 0, 1, 1,
0.4526391, -0.4874987, 0.5321641, 1, 1, 1, 1, 1,
0.453059, -0.399671, 1.540228, 1, 1, 1, 1, 1,
0.4534796, -0.1038471, 0.1706261, 1, 1, 1, 1, 1,
0.4565837, -0.515161, 3.413007, 1, 1, 1, 1, 1,
0.4574436, -0.5598509, 2.193377, 1, 1, 1, 1, 1,
0.4575264, -0.08004324, 2.586786, 1, 1, 1, 1, 1,
0.4581005, -0.1933055, 2.549503, 1, 1, 1, 1, 1,
0.4583322, -0.7458403, 2.350911, 1, 1, 1, 1, 1,
0.4598418, 0.6122524, 1.685842, 1, 1, 1, 1, 1,
0.4616269, -0.01295492, -0.06934806, 1, 1, 1, 1, 1,
0.4622199, -0.7465806, 1.873104, 1, 1, 1, 1, 1,
0.4631631, -1.12774, 3.260966, 1, 1, 1, 1, 1,
0.4642026, 1.898943, 0.6241722, 1, 1, 1, 1, 1,
0.465765, 0.2877199, -1.82484, 1, 1, 1, 1, 1,
0.4663363, 0.6164789, -0.211788, 1, 1, 1, 1, 1,
0.4691048, 0.03499332, 1.440256, 0, 0, 1, 1, 1,
0.4691125, -0.2242653, 0.07617637, 1, 0, 0, 1, 1,
0.4691186, 1.717814, 0.1382708, 1, 0, 0, 1, 1,
0.4746795, -0.9556611, 3.60762, 1, 0, 0, 1, 1,
0.4750676, 0.6460456, -0.3579631, 1, 0, 0, 1, 1,
0.4778285, -0.3874289, 3.040382, 1, 0, 0, 1, 1,
0.4780887, 0.5850954, 0.3782195, 0, 0, 0, 1, 1,
0.4791256, 0.6994388, 3.298861, 0, 0, 0, 1, 1,
0.4837995, 1.422899, 0.2166381, 0, 0, 0, 1, 1,
0.4983183, -0.02279636, 2.41945, 0, 0, 0, 1, 1,
0.4985003, 0.2087475, 0.8175533, 0, 0, 0, 1, 1,
0.5005735, -1.32533, 3.19687, 0, 0, 0, 1, 1,
0.504072, -1.217482, 2.837137, 0, 0, 0, 1, 1,
0.51094, -0.06918791, 1.240011, 1, 1, 1, 1, 1,
0.5156557, -0.9516885, 2.583092, 1, 1, 1, 1, 1,
0.5159251, 0.3298166, -0.1821827, 1, 1, 1, 1, 1,
0.5160022, -0.8204558, 3.066164, 1, 1, 1, 1, 1,
0.5184087, 0.7220799, 1.422121, 1, 1, 1, 1, 1,
0.520286, 0.6003123, 1.396739, 1, 1, 1, 1, 1,
0.5235015, -0.4491934, 2.042989, 1, 1, 1, 1, 1,
0.5246217, 1.739616, 0.4610789, 1, 1, 1, 1, 1,
0.5268918, 0.2046058, 1.264414, 1, 1, 1, 1, 1,
0.5281528, 0.08189505, -0.4949141, 1, 1, 1, 1, 1,
0.5327053, -0.8318661, 1.71438, 1, 1, 1, 1, 1,
0.5386204, 0.7405537, 0.3788438, 1, 1, 1, 1, 1,
0.5393968, -1.139415, 2.380239, 1, 1, 1, 1, 1,
0.5399643, 0.09631144, 2.26154, 1, 1, 1, 1, 1,
0.5413805, 0.241933, 0.2063102, 1, 1, 1, 1, 1,
0.5449904, 0.7807895, -0.429978, 0, 0, 1, 1, 1,
0.5485269, -0.3972728, 1.543123, 1, 0, 0, 1, 1,
0.5553555, -1.110983, 2.533609, 1, 0, 0, 1, 1,
0.5579329, -0.05249957, 0.8503759, 1, 0, 0, 1, 1,
0.5592934, -1.812907, 4.333256, 1, 0, 0, 1, 1,
0.5602954, -1.023669, 1.47402, 1, 0, 0, 1, 1,
0.5617401, -1.280138, 2.003973, 0, 0, 0, 1, 1,
0.5638496, -0.6254536, 2.586323, 0, 0, 0, 1, 1,
0.570028, 0.1411555, 1.479227, 0, 0, 0, 1, 1,
0.5710206, -0.3453704, 2.166669, 0, 0, 0, 1, 1,
0.5744071, 0.623769, 1.955742, 0, 0, 0, 1, 1,
0.5818194, 1.039793, 1.282831, 0, 0, 0, 1, 1,
0.5833021, 0.03128826, 2.011482, 0, 0, 0, 1, 1,
0.5854746, -0.1157982, 2.773536, 1, 1, 1, 1, 1,
0.5858636, 1.317611, -0.4695751, 1, 1, 1, 1, 1,
0.5859308, 0.6367429, 2.036269, 1, 1, 1, 1, 1,
0.5860563, 0.203257, 1.304132, 1, 1, 1, 1, 1,
0.5865401, -0.5260655, 1.518523, 1, 1, 1, 1, 1,
0.5880516, 2.250653, -1.43971, 1, 1, 1, 1, 1,
0.5883561, 0.2476143, -0.05030129, 1, 1, 1, 1, 1,
0.5888379, 0.8978306, 0.1810445, 1, 1, 1, 1, 1,
0.5897548, -0.204803, 0.7476348, 1, 1, 1, 1, 1,
0.5900141, 0.6812824, 0.9544267, 1, 1, 1, 1, 1,
0.5908359, -0.3457946, 2.113201, 1, 1, 1, 1, 1,
0.5958549, 0.7209742, 1.781894, 1, 1, 1, 1, 1,
0.5972781, 1.246426, 1.903323, 1, 1, 1, 1, 1,
0.5991666, 1.420065, -0.970603, 1, 1, 1, 1, 1,
0.5998583, 0.1532649, 1.194186, 1, 1, 1, 1, 1,
0.6012149, -0.4268556, 2.192613, 0, 0, 1, 1, 1,
0.6021881, -0.3671253, 2.571832, 1, 0, 0, 1, 1,
0.6036866, 0.8941799, 1.128918, 1, 0, 0, 1, 1,
0.6041169, 1.450779, -0.05977141, 1, 0, 0, 1, 1,
0.6098695, 0.7773475, -0.009821248, 1, 0, 0, 1, 1,
0.610516, -0.2234422, 2.570865, 1, 0, 0, 1, 1,
0.6189393, 1.438591, 0.3153656, 0, 0, 0, 1, 1,
0.6211358, -1.168471, 3.488114, 0, 0, 0, 1, 1,
0.6225092, 0.01415279, 2.993333, 0, 0, 0, 1, 1,
0.6227038, -0.5603623, 1.633565, 0, 0, 0, 1, 1,
0.6243186, 1.043767, 1.640989, 0, 0, 0, 1, 1,
0.6291363, 0.8387311, 0.5947769, 0, 0, 0, 1, 1,
0.6295052, 0.03061237, 2.987267, 0, 0, 0, 1, 1,
0.630688, 0.6728479, 1.39491, 1, 1, 1, 1, 1,
0.6342353, -1.797454, 2.386932, 1, 1, 1, 1, 1,
0.6378456, -0.2916624, 3.123416, 1, 1, 1, 1, 1,
0.6385875, -0.6358897, 2.348774, 1, 1, 1, 1, 1,
0.6386721, -0.685438, 1.953176, 1, 1, 1, 1, 1,
0.6402206, -0.5059624, 4.421089, 1, 1, 1, 1, 1,
0.6425994, -0.1569206, 0.7957477, 1, 1, 1, 1, 1,
0.6465587, -0.356224, 2.998145, 1, 1, 1, 1, 1,
0.6506469, 0.8606335, 0.4733025, 1, 1, 1, 1, 1,
0.6570598, -0.05760884, 1.128834, 1, 1, 1, 1, 1,
0.6586628, 0.6186063, 2.143328, 1, 1, 1, 1, 1,
0.6677487, 0.7534502, -0.02502168, 1, 1, 1, 1, 1,
0.6680812, -0.2459033, 1.604565, 1, 1, 1, 1, 1,
0.6731629, -0.8847073, 3.702806, 1, 1, 1, 1, 1,
0.6762202, 0.5893617, 0.8448815, 1, 1, 1, 1, 1,
0.676361, -0.9897437, 3.368306, 0, 0, 1, 1, 1,
0.6829389, 1.300322, 0.1512541, 1, 0, 0, 1, 1,
0.6864408, -0.8255031, 3.159519, 1, 0, 0, 1, 1,
0.698296, -0.7683217, 2.952446, 1, 0, 0, 1, 1,
0.7048646, 0.2993025, 0.1808117, 1, 0, 0, 1, 1,
0.7084193, 0.8612431, 0.07525846, 1, 0, 0, 1, 1,
0.7229795, -1.626178, 3.025881, 0, 0, 0, 1, 1,
0.7238426, 0.2087475, 1.522585, 0, 0, 0, 1, 1,
0.7277063, -0.7579637, 1.647682, 0, 0, 0, 1, 1,
0.7298653, 0.2963801, 0.1888079, 0, 0, 0, 1, 1,
0.7352589, -1.475913, 2.56937, 0, 0, 0, 1, 1,
0.7404394, 0.07034884, 1.082259, 0, 0, 0, 1, 1,
0.7478299, 0.8869642, -0.09443087, 0, 0, 0, 1, 1,
0.7493402, 0.1731363, 1.574004, 1, 1, 1, 1, 1,
0.7545727, 0.6743171, 1.408582, 1, 1, 1, 1, 1,
0.7559086, 0.5710869, 1.189876, 1, 1, 1, 1, 1,
0.7635746, 0.252964, 1.043042, 1, 1, 1, 1, 1,
0.7683812, -0.3930711, 0.980649, 1, 1, 1, 1, 1,
0.7737649, 1.258278, -0.525556, 1, 1, 1, 1, 1,
0.774093, -0.6998323, 2.046952, 1, 1, 1, 1, 1,
0.7798296, 0.3476599, 0.7067245, 1, 1, 1, 1, 1,
0.7820272, -0.08442198, 3.157077, 1, 1, 1, 1, 1,
0.7862206, -0.7383265, 0.1342503, 1, 1, 1, 1, 1,
0.7883314, -1.035146, 3.135747, 1, 1, 1, 1, 1,
0.7887115, -0.6959488, 3.076925, 1, 1, 1, 1, 1,
0.7961034, 0.9377261, 1.970004, 1, 1, 1, 1, 1,
0.798942, 2.805175, 0.9152936, 1, 1, 1, 1, 1,
0.8035136, -0.9285919, 2.605586, 1, 1, 1, 1, 1,
0.8065455, -0.9155474, 1.294234, 0, 0, 1, 1, 1,
0.8068817, 0.07585682, 3.723917, 1, 0, 0, 1, 1,
0.807035, -0.4240621, 2.370334, 1, 0, 0, 1, 1,
0.8090466, 0.6405798, 1.156825, 1, 0, 0, 1, 1,
0.8109045, -0.5416593, 1.400517, 1, 0, 0, 1, 1,
0.8144838, -0.9122373, 3.252281, 1, 0, 0, 1, 1,
0.8184104, -0.1016585, 2.347219, 0, 0, 0, 1, 1,
0.8203321, -1.608892, 3.68115, 0, 0, 0, 1, 1,
0.8207455, -0.6966169, 1.979432, 0, 0, 0, 1, 1,
0.8238644, -0.1354082, 1.941288, 0, 0, 0, 1, 1,
0.837374, 0.4626691, -0.4955307, 0, 0, 0, 1, 1,
0.8432106, -1.117891, 2.89085, 0, 0, 0, 1, 1,
0.8439368, 0.1861473, 0.610041, 0, 0, 0, 1, 1,
0.8445611, -0.3675025, 1.198323, 1, 1, 1, 1, 1,
0.8507625, 0.8275338, 1.055156, 1, 1, 1, 1, 1,
0.8561265, 0.6080606, 1.782477, 1, 1, 1, 1, 1,
0.8622354, 0.3287947, 0.8399969, 1, 1, 1, 1, 1,
0.8663672, 0.6986912, 0.05787253, 1, 1, 1, 1, 1,
0.882023, -1.343138, 4.410471, 1, 1, 1, 1, 1,
0.8860089, -0.4266781, 1.515881, 1, 1, 1, 1, 1,
0.8876541, -0.1537297, -0.08812859, 1, 1, 1, 1, 1,
0.8882416, -0.5314392, 2.987759, 1, 1, 1, 1, 1,
0.8883842, -0.189564, 1.665858, 1, 1, 1, 1, 1,
0.8920041, 0.4580841, 0.5020407, 1, 1, 1, 1, 1,
0.9016965, -0.1205701, 2.600557, 1, 1, 1, 1, 1,
0.9059684, 0.0543561, 1.634432, 1, 1, 1, 1, 1,
0.9065061, -0.5699574, 3.615867, 1, 1, 1, 1, 1,
0.9066889, 0.7649585, 0.1088328, 1, 1, 1, 1, 1,
0.9101427, -0.7482045, 4.398015, 0, 0, 1, 1, 1,
0.9107653, 1.220912, 0.7238391, 1, 0, 0, 1, 1,
0.9132501, 0.2137958, 1.150812, 1, 0, 0, 1, 1,
0.9151358, 0.8937884, 1.30929, 1, 0, 0, 1, 1,
0.9157591, 0.2217464, 2.025017, 1, 0, 0, 1, 1,
0.9167874, 1.350375, 2.825803, 1, 0, 0, 1, 1,
0.9169588, 1.11026, 0.8714849, 0, 0, 0, 1, 1,
0.9183319, 1.658641, -0.2040342, 0, 0, 0, 1, 1,
0.9201412, 2.77105, -0.1753561, 0, 0, 0, 1, 1,
0.9204144, -0.1622693, 0.0971166, 0, 0, 0, 1, 1,
0.9231228, 0.2227753, 0.447749, 0, 0, 0, 1, 1,
0.9285746, 1.378268, 3.260739, 0, 0, 0, 1, 1,
0.9338394, 2.171662, -0.611329, 0, 0, 0, 1, 1,
0.9344876, -0.5961834, 2.60294, 1, 1, 1, 1, 1,
0.9443346, -0.835686, 3.162897, 1, 1, 1, 1, 1,
0.9494726, -1.120828, 0.9429757, 1, 1, 1, 1, 1,
0.9515294, -1.487374, 2.078661, 1, 1, 1, 1, 1,
0.9562607, -1.364301, 2.122498, 1, 1, 1, 1, 1,
0.9614193, 0.218071, 0.7969322, 1, 1, 1, 1, 1,
0.9660113, -1.21218, 1.451621, 1, 1, 1, 1, 1,
0.9831955, 1.60449, -1.077473, 1, 1, 1, 1, 1,
0.9898233, 1.475882, 1.507153, 1, 1, 1, 1, 1,
0.9907601, -0.1010864, 0.9953112, 1, 1, 1, 1, 1,
1.003208, 0.02517873, 1.391181, 1, 1, 1, 1, 1,
1.003318, 0.9366377, -0.3160309, 1, 1, 1, 1, 1,
1.005683, -1.143868, 2.91705, 1, 1, 1, 1, 1,
1.010623, -0.3057392, 1.001288, 1, 1, 1, 1, 1,
1.013432, -0.2838722, 2.694554, 1, 1, 1, 1, 1,
1.019633, -0.6590276, 1.587343, 0, 0, 1, 1, 1,
1.022345, 0.3653998, 0.667271, 1, 0, 0, 1, 1,
1.030538, 0.946398, -0.5646314, 1, 0, 0, 1, 1,
1.032462, 0.2124837, 2.325265, 1, 0, 0, 1, 1,
1.045082, -1.682775, 1.520799, 1, 0, 0, 1, 1,
1.045682, -0.4746457, 3.594402, 1, 0, 0, 1, 1,
1.046496, 0.4903714, 1.818339, 0, 0, 0, 1, 1,
1.046707, -1.756914, 2.052862, 0, 0, 0, 1, 1,
1.047075, 1.184748, 1.514019, 0, 0, 0, 1, 1,
1.05238, -0.2422078, 1.775589, 0, 0, 0, 1, 1,
1.056508, -0.05171655, 2.971126, 0, 0, 0, 1, 1,
1.06053, -0.8768756, 3.254874, 0, 0, 0, 1, 1,
1.069527, 0.9501351, 1.235077, 0, 0, 0, 1, 1,
1.08745, -0.3408279, 0.7528028, 1, 1, 1, 1, 1,
1.091757, -0.823362, 1.536504, 1, 1, 1, 1, 1,
1.096058, -0.2768371, 1.902489, 1, 1, 1, 1, 1,
1.114569, -0.6678234, 1.035396, 1, 1, 1, 1, 1,
1.114813, -0.5302178, 1.874171, 1, 1, 1, 1, 1,
1.120448, -0.4462527, 2.101691, 1, 1, 1, 1, 1,
1.124911, 0.839653, 1.147923, 1, 1, 1, 1, 1,
1.140913, 0.3259771, 0.981294, 1, 1, 1, 1, 1,
1.141446, 1.000973, 1.544494, 1, 1, 1, 1, 1,
1.141541, 1.138104, -0.1195706, 1, 1, 1, 1, 1,
1.146524, 0.06414516, 0.5019686, 1, 1, 1, 1, 1,
1.148302, 0.2469315, 2.017243, 1, 1, 1, 1, 1,
1.156683, 1.602553, -1.042865, 1, 1, 1, 1, 1,
1.158213, -1.444437, 2.038781, 1, 1, 1, 1, 1,
1.178454, 1.228567, 0.9977381, 1, 1, 1, 1, 1,
1.178971, 1.080282, 1.232866, 0, 0, 1, 1, 1,
1.180147, -0.4247673, -1.613869, 1, 0, 0, 1, 1,
1.183883, 0.6956096, -0.007185875, 1, 0, 0, 1, 1,
1.18724, -0.02828952, 1.37642, 1, 0, 0, 1, 1,
1.190678, 1.741128, 0.2051958, 1, 0, 0, 1, 1,
1.194059, -1.764074, 2.631707, 1, 0, 0, 1, 1,
1.196706, -0.4479377, 0.6336789, 0, 0, 0, 1, 1,
1.201356, 1.931237, 0.9229662, 0, 0, 0, 1, 1,
1.202516, -0.9841123, 1.799212, 0, 0, 0, 1, 1,
1.20652, 1.191902, -0.4665362, 0, 0, 0, 1, 1,
1.207497, -0.02259392, 2.825351, 0, 0, 0, 1, 1,
1.213599, 0.5845038, 0.3100528, 0, 0, 0, 1, 1,
1.21676, -0.2259035, 2.606058, 0, 0, 0, 1, 1,
1.217916, 0.7225345, 0.9994663, 1, 1, 1, 1, 1,
1.224259, 0.3679114, 2.288174, 1, 1, 1, 1, 1,
1.232837, 1.066513, -1.14415, 1, 1, 1, 1, 1,
1.235075, 1.505053, -0.03101104, 1, 1, 1, 1, 1,
1.236245, -0.05698293, 3.718473, 1, 1, 1, 1, 1,
1.237801, 0.2911795, 3.304013, 1, 1, 1, 1, 1,
1.239427, 1.778423, -0.5815402, 1, 1, 1, 1, 1,
1.245615, -1.104009, 1.459429, 1, 1, 1, 1, 1,
1.251141, -1.306999, 2.11699, 1, 1, 1, 1, 1,
1.25187, 0.6891968, 1.678548, 1, 1, 1, 1, 1,
1.255642, -1.057709, 3.70889, 1, 1, 1, 1, 1,
1.259397, -0.753734, 2.512891, 1, 1, 1, 1, 1,
1.264364, 0.5216347, 1.07832, 1, 1, 1, 1, 1,
1.267612, -0.3164043, 2.039085, 1, 1, 1, 1, 1,
1.268541, -1.350818, 1.692793, 1, 1, 1, 1, 1,
1.268618, 0.3774044, 0.5184178, 0, 0, 1, 1, 1,
1.268873, -0.3163242, 3.274594, 1, 0, 0, 1, 1,
1.269796, -1.159558, 2.396507, 1, 0, 0, 1, 1,
1.27574, -0.1716072, 2.466856, 1, 0, 0, 1, 1,
1.286278, 0.2894825, 2.796177, 1, 0, 0, 1, 1,
1.287993, 0.175484, 1.687811, 1, 0, 0, 1, 1,
1.291248, -1.336592, 1.607415, 0, 0, 0, 1, 1,
1.293769, -1.594551, 0.07232112, 0, 0, 0, 1, 1,
1.295468, 0.03374821, 2.154154, 0, 0, 0, 1, 1,
1.304784, 0.3702977, 0.9753287, 0, 0, 0, 1, 1,
1.325487, 1.464337, 1.008282, 0, 0, 0, 1, 1,
1.328567, -0.8792251, 2.434431, 0, 0, 0, 1, 1,
1.329358, -0.4535772, 3.455145, 0, 0, 0, 1, 1,
1.345323, -1.551846, 1.155198, 1, 1, 1, 1, 1,
1.353106, 1.366448, 0.1278869, 1, 1, 1, 1, 1,
1.358789, -0.01903552, 2.029289, 1, 1, 1, 1, 1,
1.382587, 0.8478138, 1.47718, 1, 1, 1, 1, 1,
1.405502, -0.5720329, 2.4285, 1, 1, 1, 1, 1,
1.412211, 0.9677119, 0.5356568, 1, 1, 1, 1, 1,
1.415498, -1.237388, 2.196877, 1, 1, 1, 1, 1,
1.419839, -1.227024, 2.057684, 1, 1, 1, 1, 1,
1.426546, -1.004527, 1.640138, 1, 1, 1, 1, 1,
1.440756, 1.80317, 1.092833, 1, 1, 1, 1, 1,
1.442469, 1.076817, 0.4394709, 1, 1, 1, 1, 1,
1.446659, -0.2886834, 0.3217106, 1, 1, 1, 1, 1,
1.453547, 0.6345086, 2.225708, 1, 1, 1, 1, 1,
1.467432, 1.313116, 0.1779003, 1, 1, 1, 1, 1,
1.476348, 1.366476, 2.667503, 1, 1, 1, 1, 1,
1.483039, 1.004282, -0.06151732, 0, 0, 1, 1, 1,
1.483329, 0.266759, 0.6077564, 1, 0, 0, 1, 1,
1.487194, 1.967351, 1.910014, 1, 0, 0, 1, 1,
1.49658, 0.236261, 2.421715, 1, 0, 0, 1, 1,
1.503599, 0.1467295, 1.962205, 1, 0, 0, 1, 1,
1.509114, -0.351624, 2.371074, 1, 0, 0, 1, 1,
1.510634, -0.1364097, 1.4038, 0, 0, 0, 1, 1,
1.511168, -0.482476, 1.528371, 0, 0, 0, 1, 1,
1.516105, -1.326746, 2.115137, 0, 0, 0, 1, 1,
1.518128, -1.079806, 0.7194124, 0, 0, 0, 1, 1,
1.530398, 1.628211, 1.590842, 0, 0, 0, 1, 1,
1.540719, -0.3402494, 2.160488, 0, 0, 0, 1, 1,
1.548852, -0.02857977, 3.263764, 0, 0, 0, 1, 1,
1.554325, -0.3365048, 2.253232, 1, 1, 1, 1, 1,
1.558202, -1.80074, 2.290485, 1, 1, 1, 1, 1,
1.559521, -1.273724, 1.520347, 1, 1, 1, 1, 1,
1.565861, 1.179737, 0.5112413, 1, 1, 1, 1, 1,
1.58109, 0.9606506, 0.849753, 1, 1, 1, 1, 1,
1.585552, 0.7183259, 3.061231, 1, 1, 1, 1, 1,
1.602656, -1.183728, 0.2950122, 1, 1, 1, 1, 1,
1.602923, -0.3645746, 0.2941062, 1, 1, 1, 1, 1,
1.628521, -0.0710441, 1.077854, 1, 1, 1, 1, 1,
1.631962, -0.5476511, 2.397741, 1, 1, 1, 1, 1,
1.647846, -2.829894, 2.331056, 1, 1, 1, 1, 1,
1.651714, -2.754379, 3.643839, 1, 1, 1, 1, 1,
1.659105, 0.689296, 0.02425552, 1, 1, 1, 1, 1,
1.660789, -0.09227478, 1.464271, 1, 1, 1, 1, 1,
1.664697, -0.8714724, 2.682493, 1, 1, 1, 1, 1,
1.668824, 1.308561, 1.33415, 0, 0, 1, 1, 1,
1.676293, -0.1666376, 1.999131, 1, 0, 0, 1, 1,
1.685003, 0.2677003, 2.187418, 1, 0, 0, 1, 1,
1.699358, -0.06248916, 0.5394544, 1, 0, 0, 1, 1,
1.722617, 0.2437033, 1.096918, 1, 0, 0, 1, 1,
1.726882, 0.02064582, 2.696686, 1, 0, 0, 1, 1,
1.750437, 0.7691604, 0.5673838, 0, 0, 0, 1, 1,
1.796613, 1.164024, 1.235707, 0, 0, 0, 1, 1,
1.81103, -2.478662, 2.23034, 0, 0, 0, 1, 1,
1.818327, -2.148102, 3.226764, 0, 0, 0, 1, 1,
1.825748, 0.1969939, 0.8033688, 0, 0, 0, 1, 1,
1.826262, -0.4170563, 2.329819, 0, 0, 0, 1, 1,
1.848073, 2.191142, 1.042784, 0, 0, 0, 1, 1,
1.850611, 0.4739406, 1.035521, 1, 1, 1, 1, 1,
1.875351, 1.207546, 0.5374777, 1, 1, 1, 1, 1,
1.89405, 0.4024402, 1.882562, 1, 1, 1, 1, 1,
1.897134, 0.7946476, 1.39527, 1, 1, 1, 1, 1,
1.899304, -0.8326765, 2.371604, 1, 1, 1, 1, 1,
1.903588, 0.380219, 0.8165112, 1, 1, 1, 1, 1,
1.920879, -1.652407, 1.389645, 1, 1, 1, 1, 1,
1.944085, -0.8481119, -0.9997638, 1, 1, 1, 1, 1,
1.980998, -0.578196, 2.256268, 1, 1, 1, 1, 1,
1.993572, -0.6830006, 1.621143, 1, 1, 1, 1, 1,
2.021697, 0.9130851, 0.1540854, 1, 1, 1, 1, 1,
2.061858, 1.176957, 1.778381, 1, 1, 1, 1, 1,
2.080839, 0.4459899, 0.8843117, 1, 1, 1, 1, 1,
2.087821, 1.605644, 3.346168, 1, 1, 1, 1, 1,
2.097707, -1.249363, 1.539072, 1, 1, 1, 1, 1,
2.108448, -0.1074083, -0.1136748, 0, 0, 1, 1, 1,
2.125392, -0.6088699, 0.9850132, 1, 0, 0, 1, 1,
2.12896, -0.09224822, 3.339974, 1, 0, 0, 1, 1,
2.135259, -1.001756, 1.361256, 1, 0, 0, 1, 1,
2.155468, -1.366433, 3.452275, 1, 0, 0, 1, 1,
2.182964, -0.1909364, 1.146014, 1, 0, 0, 1, 1,
2.208903, -0.4378152, 0.618647, 0, 0, 0, 1, 1,
2.242184, -0.6084661, 2.461548, 0, 0, 0, 1, 1,
2.247919, 0.1258886, 1.536675, 0, 0, 0, 1, 1,
2.313217, 1.408288, 2.564729, 0, 0, 0, 1, 1,
2.317586, 0.1126933, 2.451605, 0, 0, 0, 1, 1,
2.351946, 0.5503086, 4.225156, 0, 0, 0, 1, 1,
2.368133, -1.353119, 3.262051, 0, 0, 0, 1, 1,
2.38691, 0.3533404, 1.581329, 1, 1, 1, 1, 1,
2.48185, 0.9711827, -0.3912639, 1, 1, 1, 1, 1,
2.507795, 1.840987, -0.2347127, 1, 1, 1, 1, 1,
2.525936, -1.82147, 3.860795, 1, 1, 1, 1, 1,
2.562867, 0.3358943, 1.865335, 1, 1, 1, 1, 1,
2.710117, -0.8684953, 2.329785, 1, 1, 1, 1, 1,
3.520676, 0.8903385, 0.7380859, 1, 1, 1, 1, 1
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
var radius = 9.887332;
var distance = 34.72883;
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
mvMatrix.translate( -0.3607836, 0.0123595, 0.2090914 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72883);
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
