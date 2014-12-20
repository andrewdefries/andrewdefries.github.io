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
-3.244089, 1.359827, -0.8235942, 1, 0, 0, 1,
-3.198766, 0.7309411, -2.485084, 1, 0.007843138, 0, 1,
-2.732543, 0.6612528, -0.4695861, 1, 0.01176471, 0, 1,
-2.584776, -0.3125469, -1.162637, 1, 0.01960784, 0, 1,
-2.575231, 0.3464935, -1.51834, 1, 0.02352941, 0, 1,
-2.550465, 0.5389947, -1.455835, 1, 0.03137255, 0, 1,
-2.531619, -1.467161, -0.01776638, 1, 0.03529412, 0, 1,
-2.523287, 0.1556019, -0.5465872, 1, 0.04313726, 0, 1,
-2.511274, 0.7788976, 0.854192, 1, 0.04705882, 0, 1,
-2.481599, -0.6619425, -0.6272447, 1, 0.05490196, 0, 1,
-2.472133, -1.493971, -2.100838, 1, 0.05882353, 0, 1,
-2.385772, -2.189557, -2.449548, 1, 0.06666667, 0, 1,
-2.375464, 0.08047391, -0.5463599, 1, 0.07058824, 0, 1,
-2.285655, -0.4127941, -2.064131, 1, 0.07843138, 0, 1,
-2.282514, 0.04289914, 0.06519759, 1, 0.08235294, 0, 1,
-2.25196, -0.1042337, -1.071826, 1, 0.09019608, 0, 1,
-2.219908, -0.157298, -1.043792, 1, 0.09411765, 0, 1,
-2.214962, -0.5555671, -1.600831, 1, 0.1019608, 0, 1,
-2.209676, -2.932017, -1.425008, 1, 0.1098039, 0, 1,
-2.202533, -1.377361, -3.355998, 1, 0.1137255, 0, 1,
-2.201932, -2.423149, -3.729119, 1, 0.1215686, 0, 1,
-2.186129, 0.4475278, 0.02348042, 1, 0.1254902, 0, 1,
-2.16119, 0.5813556, -2.578579, 1, 0.1333333, 0, 1,
-2.092431, -1.01581, -2.276488, 1, 0.1372549, 0, 1,
-2.064132, 1.512479, -1.030646, 1, 0.145098, 0, 1,
-2.003026, 0.2961262, -0.9426715, 1, 0.1490196, 0, 1,
-2.000188, 1.152614, 0.1065738, 1, 0.1568628, 0, 1,
-1.954244, 0.7451029, -1.737279, 1, 0.1607843, 0, 1,
-1.951642, 0.5452319, -1.458904, 1, 0.1686275, 0, 1,
-1.92382, -0.9012206, -2.909867, 1, 0.172549, 0, 1,
-1.900062, 0.03734949, -3.659085, 1, 0.1803922, 0, 1,
-1.892787, 0.3675899, -1.407745, 1, 0.1843137, 0, 1,
-1.890559, -0.4295654, -2.342727, 1, 0.1921569, 0, 1,
-1.879747, -0.5742581, -2.754613, 1, 0.1960784, 0, 1,
-1.858645, -1.141857, -1.880779, 1, 0.2039216, 0, 1,
-1.853393, 0.4506181, -0.5499058, 1, 0.2117647, 0, 1,
-1.852895, -0.2825644, -2.381725, 1, 0.2156863, 0, 1,
-1.852061, 1.851811, -1.353978, 1, 0.2235294, 0, 1,
-1.852051, -1.080357, -2.475364, 1, 0.227451, 0, 1,
-1.849686, 1.024708, -1.052521, 1, 0.2352941, 0, 1,
-1.846113, -0.3371577, -3.631585, 1, 0.2392157, 0, 1,
-1.801897, 0.6282491, -0.9611841, 1, 0.2470588, 0, 1,
-1.801545, 0.7698041, -1.038073, 1, 0.2509804, 0, 1,
-1.79877, -0.1248948, -2.003095, 1, 0.2588235, 0, 1,
-1.798475, -1.906923, -0.8384714, 1, 0.2627451, 0, 1,
-1.77957, 0.6249252, 0.05943901, 1, 0.2705882, 0, 1,
-1.759335, 0.4663124, -2.564355, 1, 0.2745098, 0, 1,
-1.753194, -0.02972587, -3.011504, 1, 0.282353, 0, 1,
-1.748855, 0.6424015, -2.310562, 1, 0.2862745, 0, 1,
-1.747627, 0.7652486, -2.558248, 1, 0.2941177, 0, 1,
-1.742704, 0.08921918, -1.414385, 1, 0.3019608, 0, 1,
-1.728472, 0.2151449, -3.01109, 1, 0.3058824, 0, 1,
-1.690479, -0.5524032, -1.585322, 1, 0.3137255, 0, 1,
-1.659426, 1.032638, 0.6824902, 1, 0.3176471, 0, 1,
-1.652922, 0.2861725, -0.5995682, 1, 0.3254902, 0, 1,
-1.648645, 0.09884361, -1.214883, 1, 0.3294118, 0, 1,
-1.648633, 1.005488, -0.7267472, 1, 0.3372549, 0, 1,
-1.647687, -0.6469977, -1.852616, 1, 0.3411765, 0, 1,
-1.639176, 1.330183, -0.6987647, 1, 0.3490196, 0, 1,
-1.636408, -1.442136, -2.512979, 1, 0.3529412, 0, 1,
-1.633717, 0.5249792, 0.113096, 1, 0.3607843, 0, 1,
-1.63146, -0.7277911, -0.9063361, 1, 0.3647059, 0, 1,
-1.617253, -0.9147379, -2.45387, 1, 0.372549, 0, 1,
-1.603563, -0.415729, -2.041954, 1, 0.3764706, 0, 1,
-1.60206, -0.2190543, -1.167726, 1, 0.3843137, 0, 1,
-1.599751, 0.7812321, -1.439723, 1, 0.3882353, 0, 1,
-1.596355, 2.162229, -1.276604, 1, 0.3960784, 0, 1,
-1.577942, 1.474897, 1.05889, 1, 0.4039216, 0, 1,
-1.567396, -0.3440234, -2.522379, 1, 0.4078431, 0, 1,
-1.545907, -0.1825092, 0.009317865, 1, 0.4156863, 0, 1,
-1.524873, -1.079136, -2.871637, 1, 0.4196078, 0, 1,
-1.496957, 0.8868925, 0.3251788, 1, 0.427451, 0, 1,
-1.487739, -0.392088, -0.1141162, 1, 0.4313726, 0, 1,
-1.48634, 0.3066023, -1.945438, 1, 0.4392157, 0, 1,
-1.48553, 1.807783, -1.688593, 1, 0.4431373, 0, 1,
-1.477566, -0.001806699, -1.40403, 1, 0.4509804, 0, 1,
-1.474924, 0.5521889, -2.041969, 1, 0.454902, 0, 1,
-1.474113, 0.07565904, -0.8866192, 1, 0.4627451, 0, 1,
-1.456716, -0.7366498, -1.894096, 1, 0.4666667, 0, 1,
-1.456697, 1.511367, 0.3784532, 1, 0.4745098, 0, 1,
-1.439012, 0.333751, 0.466738, 1, 0.4784314, 0, 1,
-1.438584, 0.8185288, -2.107629, 1, 0.4862745, 0, 1,
-1.434818, -0.7102078, -2.997934, 1, 0.4901961, 0, 1,
-1.429051, -1.162309, -1.649852, 1, 0.4980392, 0, 1,
-1.411695, 0.7737515, -1.542636, 1, 0.5058824, 0, 1,
-1.406343, 1.12944, -1.924149, 1, 0.509804, 0, 1,
-1.398244, -0.2670955, -3.608816, 1, 0.5176471, 0, 1,
-1.38597, 1.142202, -1.124772, 1, 0.5215687, 0, 1,
-1.372452, -1.739469, -2.74816, 1, 0.5294118, 0, 1,
-1.359496, -0.06836551, -2.384613, 1, 0.5333334, 0, 1,
-1.359223, 1.02079, -1.881898, 1, 0.5411765, 0, 1,
-1.354904, 0.218972, -1.502381, 1, 0.5450981, 0, 1,
-1.347795, 0.3564782, -1.851146, 1, 0.5529412, 0, 1,
-1.346761, 0.2750971, -1.06699, 1, 0.5568628, 0, 1,
-1.329815, 0.1380108, -1.4492, 1, 0.5647059, 0, 1,
-1.321007, 0.8714433, -1.0886, 1, 0.5686275, 0, 1,
-1.315665, -1.083009, -0.5241241, 1, 0.5764706, 0, 1,
-1.306714, -1.205013, -1.837312, 1, 0.5803922, 0, 1,
-1.304852, 0.01810523, -2.373521, 1, 0.5882353, 0, 1,
-1.301489, -0.8806322, -3.411909, 1, 0.5921569, 0, 1,
-1.295096, 1.599026, -0.2313536, 1, 0.6, 0, 1,
-1.294018, 0.3034451, -1.493419, 1, 0.6078432, 0, 1,
-1.279516, 0.6208287, -0.3431891, 1, 0.6117647, 0, 1,
-1.274035, -1.94453, -2.975109, 1, 0.6196079, 0, 1,
-1.2728, -0.007427641, -1.36398, 1, 0.6235294, 0, 1,
-1.270225, 0.7183586, -0.9135851, 1, 0.6313726, 0, 1,
-1.26393, 0.9974677, 1.5973, 1, 0.6352941, 0, 1,
-1.262197, -0.1077191, -1.268375, 1, 0.6431373, 0, 1,
-1.259874, -1.759171, -3.468281, 1, 0.6470588, 0, 1,
-1.246812, -0.3555056, -0.6747414, 1, 0.654902, 0, 1,
-1.241783, 1.026526, 1.293002, 1, 0.6588235, 0, 1,
-1.241573, 1.347525, 0.2084801, 1, 0.6666667, 0, 1,
-1.234403, 0.3331963, -2.318882, 1, 0.6705883, 0, 1,
-1.232582, 0.8011611, -2.330122, 1, 0.6784314, 0, 1,
-1.220113, -1.903328, -2.814806, 1, 0.682353, 0, 1,
-1.212723, 1.173967, -1.566707, 1, 0.6901961, 0, 1,
-1.206572, -0.3264162, -2.605365, 1, 0.6941177, 0, 1,
-1.198683, 0.8880354, 0.6377824, 1, 0.7019608, 0, 1,
-1.193054, 0.2499628, -1.160472, 1, 0.7098039, 0, 1,
-1.176158, 1.882068, -2.104821, 1, 0.7137255, 0, 1,
-1.176078, 0.2053543, -1.965843, 1, 0.7215686, 0, 1,
-1.174574, -0.09171623, -1.177191, 1, 0.7254902, 0, 1,
-1.158376, -1.498332, -2.493819, 1, 0.7333333, 0, 1,
-1.157334, -1.940234, -3.639674, 1, 0.7372549, 0, 1,
-1.15224, 0.3367348, -1.869431, 1, 0.7450981, 0, 1,
-1.150214, -0.1603628, -2.594409, 1, 0.7490196, 0, 1,
-1.148568, -0.4696232, -0.3494038, 1, 0.7568628, 0, 1,
-1.147694, -0.4091587, -0.2023849, 1, 0.7607843, 0, 1,
-1.136563, -0.1945704, -1.0471, 1, 0.7686275, 0, 1,
-1.135809, 0.4186095, -1.163897, 1, 0.772549, 0, 1,
-1.130335, -0.8995314, -2.827889, 1, 0.7803922, 0, 1,
-1.127091, 0.1122229, -0.3345087, 1, 0.7843137, 0, 1,
-1.115728, -0.7089138, -2.145933, 1, 0.7921569, 0, 1,
-1.115407, -2.295458, -3.242299, 1, 0.7960784, 0, 1,
-1.114416, 0.1157734, -1.731223, 1, 0.8039216, 0, 1,
-1.113613, 0.2018901, -1.380347, 1, 0.8117647, 0, 1,
-1.110491, 1.094147, -0.4392043, 1, 0.8156863, 0, 1,
-1.110339, 0.9168782, 0.166654, 1, 0.8235294, 0, 1,
-1.102503, -1.346187, -2.460309, 1, 0.827451, 0, 1,
-1.097592, 0.4770803, 0.7602609, 1, 0.8352941, 0, 1,
-1.090184, 0.4907455, -2.024567, 1, 0.8392157, 0, 1,
-1.089351, -0.8177816, -2.338558, 1, 0.8470588, 0, 1,
-1.086748, 1.954729, -1.317767, 1, 0.8509804, 0, 1,
-1.077371, 1.018411, -0.7430675, 1, 0.8588235, 0, 1,
-1.074339, -0.8463063, -0.8549361, 1, 0.8627451, 0, 1,
-1.071241, 0.1898402, -3.347193, 1, 0.8705882, 0, 1,
-1.070332, 0.2879204, 1.172683, 1, 0.8745098, 0, 1,
-1.0652, -0.6930617, -1.251931, 1, 0.8823529, 0, 1,
-1.064387, -0.03868934, -2.719388, 1, 0.8862745, 0, 1,
-1.061958, 0.3267715, -0.7410243, 1, 0.8941177, 0, 1,
-1.061177, -1.582202, -3.950302, 1, 0.8980392, 0, 1,
-1.04876, 0.05612968, -2.27617, 1, 0.9058824, 0, 1,
-1.045577, -1.583373, -3.776287, 1, 0.9137255, 0, 1,
-1.042801, 0.1018145, -2.46404, 1, 0.9176471, 0, 1,
-1.037159, -0.296567, -2.958431, 1, 0.9254902, 0, 1,
-1.033077, -1.309757, -3.094286, 1, 0.9294118, 0, 1,
-1.026094, 0.1180437, -1.235497, 1, 0.9372549, 0, 1,
-1.024031, -0.9123222, -0.6884236, 1, 0.9411765, 0, 1,
-1.022277, -1.348067, -1.800135, 1, 0.9490196, 0, 1,
-1.020779, -0.4905486, -2.35702, 1, 0.9529412, 0, 1,
-1.020475, -0.08337241, -1.161374, 1, 0.9607843, 0, 1,
-1.01836, -0.6372151, -2.477121, 1, 0.9647059, 0, 1,
-1.015486, -0.04233309, -0.6496574, 1, 0.972549, 0, 1,
-1.014221, -0.8332819, -1.939277, 1, 0.9764706, 0, 1,
-1.004166, 0.3991664, -0.1155242, 1, 0.9843137, 0, 1,
-1.003886, 0.4671139, -1.93331, 1, 0.9882353, 0, 1,
-1.00257, -0.0005558015, -0.9444554, 1, 0.9960784, 0, 1,
-0.9947413, 0.139392, -2.00092, 0.9960784, 1, 0, 1,
-0.9907426, 0.4915473, -0.7031573, 0.9921569, 1, 0, 1,
-0.9788077, 0.6740448, -1.430343, 0.9843137, 1, 0, 1,
-0.9753484, 1.489138, -1.329872, 0.9803922, 1, 0, 1,
-0.973396, 1.470873, -0.1627598, 0.972549, 1, 0, 1,
-0.9710261, -0.9443413, -1.921657, 0.9686275, 1, 0, 1,
-0.9685362, 1.716001, 0.1321689, 0.9607843, 1, 0, 1,
-0.9685305, -0.07654478, -2.093556, 0.9568627, 1, 0, 1,
-0.9434042, 0.9179218, -2.340593, 0.9490196, 1, 0, 1,
-0.9392442, -0.427535, -1.322415, 0.945098, 1, 0, 1,
-0.9382973, -1.562513, -1.498775, 0.9372549, 1, 0, 1,
-0.93628, 1.411926, -0.7955166, 0.9333333, 1, 0, 1,
-0.9341962, 0.7626767, 1.046844, 0.9254902, 1, 0, 1,
-0.9340214, -0.395836, -0.476313, 0.9215686, 1, 0, 1,
-0.9339309, 0.8399003, -0.9173104, 0.9137255, 1, 0, 1,
-0.9337491, 1.24435, -0.7814245, 0.9098039, 1, 0, 1,
-0.9333493, 0.02619295, -1.195503, 0.9019608, 1, 0, 1,
-0.930396, 1.936795, 0.784335, 0.8941177, 1, 0, 1,
-0.9303345, 0.1967335, -0.5122924, 0.8901961, 1, 0, 1,
-0.9268943, 0.1326425, -0.02118312, 0.8823529, 1, 0, 1,
-0.9008129, 2.538493, -1.05789, 0.8784314, 1, 0, 1,
-0.89939, 0.1503183, -0.4065528, 0.8705882, 1, 0, 1,
-0.8985839, 0.3502819, -0.2910576, 0.8666667, 1, 0, 1,
-0.8963577, 0.8482794, 0.7833239, 0.8588235, 1, 0, 1,
-0.8924075, 0.6508055, -0.7251393, 0.854902, 1, 0, 1,
-0.8917685, 0.8350486, -1.817304, 0.8470588, 1, 0, 1,
-0.8907019, 0.1597401, -2.090985, 0.8431373, 1, 0, 1,
-0.8880582, -1.53608, -3.192233, 0.8352941, 1, 0, 1,
-0.887633, -0.1786864, -0.4885916, 0.8313726, 1, 0, 1,
-0.8815361, -0.1161828, 0.9910259, 0.8235294, 1, 0, 1,
-0.8681438, 0.8047961, -0.5645415, 0.8196079, 1, 0, 1,
-0.86513, 1.920781, -1.216377, 0.8117647, 1, 0, 1,
-0.862964, 0.821547, -0.4903961, 0.8078431, 1, 0, 1,
-0.852445, -0.6989501, -2.470023, 0.8, 1, 0, 1,
-0.8509708, -0.2905844, -1.209286, 0.7921569, 1, 0, 1,
-0.8496345, -1.520054, -2.822979, 0.7882353, 1, 0, 1,
-0.8447446, 0.06402609, -0.7518162, 0.7803922, 1, 0, 1,
-0.8326605, -0.792236, -3.154413, 0.7764706, 1, 0, 1,
-0.8322331, -0.4078945, -2.311634, 0.7686275, 1, 0, 1,
-0.8281089, -0.180696, -2.661918, 0.7647059, 1, 0, 1,
-0.8238921, 1.768762, -1.025705, 0.7568628, 1, 0, 1,
-0.823616, 1.044566, -0.1067266, 0.7529412, 1, 0, 1,
-0.8159221, -1.146653, -2.732106, 0.7450981, 1, 0, 1,
-0.8142414, 1.181325, -1.108247, 0.7411765, 1, 0, 1,
-0.8126329, 0.08598479, -1.543383, 0.7333333, 1, 0, 1,
-0.8073567, -0.418499, -2.084783, 0.7294118, 1, 0, 1,
-0.8035949, -0.4752585, -1.768403, 0.7215686, 1, 0, 1,
-0.8030235, -0.4475786, -1.926418, 0.7176471, 1, 0, 1,
-0.8025016, -0.6137539, -1.418444, 0.7098039, 1, 0, 1,
-0.7992342, 0.6481197, 0.9164627, 0.7058824, 1, 0, 1,
-0.7988389, 1.354725, -0.1767219, 0.6980392, 1, 0, 1,
-0.7975306, 0.6756584, -1.926123, 0.6901961, 1, 0, 1,
-0.7937526, -0.1179852, -1.274305, 0.6862745, 1, 0, 1,
-0.787007, -0.6545315, -4.655253, 0.6784314, 1, 0, 1,
-0.786135, 0.6330058, -0.7714458, 0.6745098, 1, 0, 1,
-0.7852529, -0.0467638, -1.660736, 0.6666667, 1, 0, 1,
-0.770034, -0.1483541, -2.090828, 0.6627451, 1, 0, 1,
-0.7647243, 0.6045905, -1.067287, 0.654902, 1, 0, 1,
-0.7639359, -0.260317, -3.567618, 0.6509804, 1, 0, 1,
-0.7555968, -1.021063, -1.506788, 0.6431373, 1, 0, 1,
-0.7527381, -0.9105749, -1.691134, 0.6392157, 1, 0, 1,
-0.7527328, 1.627781, -1.090233, 0.6313726, 1, 0, 1,
-0.750154, 0.06120741, -3.203719, 0.627451, 1, 0, 1,
-0.7487863, 0.5390245, -1.399534, 0.6196079, 1, 0, 1,
-0.738331, -1.442182, -1.820644, 0.6156863, 1, 0, 1,
-0.7363795, 0.8300781, 0.6403393, 0.6078432, 1, 0, 1,
-0.7362518, -2.896414, -2.588129, 0.6039216, 1, 0, 1,
-0.7333617, 2.062202, 0.6956781, 0.5960785, 1, 0, 1,
-0.733354, 1.701275, -1.062222, 0.5882353, 1, 0, 1,
-0.7328686, 0.1019787, 0.7079537, 0.5843138, 1, 0, 1,
-0.7232335, 0.5035678, -1.473819, 0.5764706, 1, 0, 1,
-0.7224274, 0.01091012, -0.08065727, 0.572549, 1, 0, 1,
-0.7196947, -0.08916581, -0.8781315, 0.5647059, 1, 0, 1,
-0.7170433, -1.564595, -1.930258, 0.5607843, 1, 0, 1,
-0.7162199, 0.3378147, -2.342255, 0.5529412, 1, 0, 1,
-0.7136242, 0.004433667, -1.06915, 0.5490196, 1, 0, 1,
-0.7120688, 0.2753734, -0.8705424, 0.5411765, 1, 0, 1,
-0.7114181, 0.6571484, -0.02440822, 0.5372549, 1, 0, 1,
-0.7093971, 1.531349, -1.854768, 0.5294118, 1, 0, 1,
-0.7090847, 1.416746, -1.03199, 0.5254902, 1, 0, 1,
-0.7029027, -0.4973709, -2.74077, 0.5176471, 1, 0, 1,
-0.6982054, -0.6036239, -2.075273, 0.5137255, 1, 0, 1,
-0.6927785, -1.311755, -1.649245, 0.5058824, 1, 0, 1,
-0.6916978, 1.804765, -2.778056, 0.5019608, 1, 0, 1,
-0.6909142, -1.093784, -1.18973, 0.4941176, 1, 0, 1,
-0.6845199, 1.246059, -0.7139776, 0.4862745, 1, 0, 1,
-0.6806867, -0.3225706, -2.717789, 0.4823529, 1, 0, 1,
-0.6748872, 0.1296616, -1.914324, 0.4745098, 1, 0, 1,
-0.6671672, 1.556866, -0.4132617, 0.4705882, 1, 0, 1,
-0.6540061, -0.4851108, -3.794303, 0.4627451, 1, 0, 1,
-0.6526304, -0.05115086, -2.332161, 0.4588235, 1, 0, 1,
-0.6495533, 1.088349, 1.849314, 0.4509804, 1, 0, 1,
-0.6475477, -0.680477, -3.236847, 0.4470588, 1, 0, 1,
-0.6423107, -0.4547667, -0.7134034, 0.4392157, 1, 0, 1,
-0.6413666, 1.329467, -1.914173, 0.4352941, 1, 0, 1,
-0.6406251, 0.5397018, 0.01159461, 0.427451, 1, 0, 1,
-0.6406128, -0.7868323, -4.07091, 0.4235294, 1, 0, 1,
-0.6345716, 2.312174, -0.1815746, 0.4156863, 1, 0, 1,
-0.6305004, -1.193695, -1.98271, 0.4117647, 1, 0, 1,
-0.6292869, 0.7093567, -3.068083, 0.4039216, 1, 0, 1,
-0.6289544, -0.6599425, -2.357256, 0.3960784, 1, 0, 1,
-0.6243746, 1.497909, -0.4815326, 0.3921569, 1, 0, 1,
-0.6239314, 0.3264381, -1.786098, 0.3843137, 1, 0, 1,
-0.6239275, -1.343455, -4.995867, 0.3803922, 1, 0, 1,
-0.623896, -2.157524, -3.255918, 0.372549, 1, 0, 1,
-0.6181707, -1.176796, -1.738145, 0.3686275, 1, 0, 1,
-0.6146208, 1.095154, -1.507842, 0.3607843, 1, 0, 1,
-0.610041, -0.2848659, -2.890889, 0.3568628, 1, 0, 1,
-0.609853, -1.394783, -2.301522, 0.3490196, 1, 0, 1,
-0.6094077, 0.7104573, -0.997963, 0.345098, 1, 0, 1,
-0.6074156, 1.139468, -0.07242427, 0.3372549, 1, 0, 1,
-0.6071112, -1.357708, -1.788499, 0.3333333, 1, 0, 1,
-0.6030219, 0.08876884, 0.178719, 0.3254902, 1, 0, 1,
-0.6011435, 2.008361, -1.455067, 0.3215686, 1, 0, 1,
-0.5983798, 0.1573783, -1.530312, 0.3137255, 1, 0, 1,
-0.5968607, 1.576891, 0.06137288, 0.3098039, 1, 0, 1,
-0.5955731, -1.658059, -2.916544, 0.3019608, 1, 0, 1,
-0.5894535, -0.3685772, -2.287701, 0.2941177, 1, 0, 1,
-0.589384, -0.197802, -1.225531, 0.2901961, 1, 0, 1,
-0.5882851, -0.9350815, -0.8565385, 0.282353, 1, 0, 1,
-0.5746698, -0.3958755, -2.307791, 0.2784314, 1, 0, 1,
-0.5613422, -0.1222795, -1.176681, 0.2705882, 1, 0, 1,
-0.5566666, -1.2502, -1.730442, 0.2666667, 1, 0, 1,
-0.5495172, 0.2513492, -0.3803461, 0.2588235, 1, 0, 1,
-0.5474198, 1.029509, -2.143605, 0.254902, 1, 0, 1,
-0.5412426, -1.458226, -0.7021112, 0.2470588, 1, 0, 1,
-0.5378281, -0.01121775, -0.4618765, 0.2431373, 1, 0, 1,
-0.536847, -0.08107438, -1.844419, 0.2352941, 1, 0, 1,
-0.5336894, -0.8681227, -3.107443, 0.2313726, 1, 0, 1,
-0.5315518, -0.4017139, -2.455668, 0.2235294, 1, 0, 1,
-0.5304655, 0.4754271, -0.2008716, 0.2196078, 1, 0, 1,
-0.5295851, 0.2788467, -0.843145, 0.2117647, 1, 0, 1,
-0.5274389, 0.2483851, -0.6926159, 0.2078431, 1, 0, 1,
-0.5214875, -0.1704961, -2.972924, 0.2, 1, 0, 1,
-0.5186017, -0.0398661, -0.6858599, 0.1921569, 1, 0, 1,
-0.5178921, 0.3074315, 0.05199261, 0.1882353, 1, 0, 1,
-0.5132007, 1.875183, 0.5353888, 0.1803922, 1, 0, 1,
-0.5108626, 0.968909, -1.334899, 0.1764706, 1, 0, 1,
-0.5088149, 1.579736, -0.3284443, 0.1686275, 1, 0, 1,
-0.5061198, 1.271472, -1.704459, 0.1647059, 1, 0, 1,
-0.5045193, -0.1315733, -1.656614, 0.1568628, 1, 0, 1,
-0.496522, 0.08516745, -2.399783, 0.1529412, 1, 0, 1,
-0.4943477, -0.5132536, -2.769438, 0.145098, 1, 0, 1,
-0.4925359, 1.625649, -1.668044, 0.1411765, 1, 0, 1,
-0.4918148, 0.2666379, -0.8290028, 0.1333333, 1, 0, 1,
-0.4916442, -1.688963, -1.679526, 0.1294118, 1, 0, 1,
-0.4915959, -0.6555238, -2.656098, 0.1215686, 1, 0, 1,
-0.4914258, 0.5873374, -1.324927, 0.1176471, 1, 0, 1,
-0.4893987, 0.2315129, -3.566976, 0.1098039, 1, 0, 1,
-0.4861662, 1.534951, -1.039904, 0.1058824, 1, 0, 1,
-0.4753152, 0.3187922, -2.964093, 0.09803922, 1, 0, 1,
-0.4742379, -0.39546, -5.573787, 0.09019608, 1, 0, 1,
-0.4703968, 0.3730625, -0.08502781, 0.08627451, 1, 0, 1,
-0.4694576, -0.04902609, -1.481911, 0.07843138, 1, 0, 1,
-0.4694351, -1.488387, -3.153588, 0.07450981, 1, 0, 1,
-0.4635906, -0.1309807, -2.687494, 0.06666667, 1, 0, 1,
-0.4613547, -0.1345679, -2.936359, 0.0627451, 1, 0, 1,
-0.4541814, 0.5154676, -2.364953, 0.05490196, 1, 0, 1,
-0.4541211, 0.009703491, -2.39762, 0.05098039, 1, 0, 1,
-0.4516227, -1.705039, -2.747568, 0.04313726, 1, 0, 1,
-0.4485768, -1.342308, -1.660937, 0.03921569, 1, 0, 1,
-0.4474839, -0.6425418, -2.553181, 0.03137255, 1, 0, 1,
-0.4470905, 1.254797, -0.4874367, 0.02745098, 1, 0, 1,
-0.4398798, 0.6348616, -1.638596, 0.01960784, 1, 0, 1,
-0.4379673, -0.5527843, -3.167566, 0.01568628, 1, 0, 1,
-0.4374135, -0.1384705, -1.295096, 0.007843138, 1, 0, 1,
-0.4343111, -1.695381, -2.88773, 0.003921569, 1, 0, 1,
-0.4323977, -0.4995456, -1.814138, 0, 1, 0.003921569, 1,
-0.4285403, 0.7201348, 0.1818492, 0, 1, 0.01176471, 1,
-0.4254917, -0.891688, -2.097565, 0, 1, 0.01568628, 1,
-0.4233821, -0.03085042, -2.61394, 0, 1, 0.02352941, 1,
-0.4201556, -1.31614, -2.635909, 0, 1, 0.02745098, 1,
-0.4162912, -1.329451, -3.410892, 0, 1, 0.03529412, 1,
-0.4159898, 0.03367318, -1.741103, 0, 1, 0.03921569, 1,
-0.4120427, -1.784976, -1.576541, 0, 1, 0.04705882, 1,
-0.4102578, 0.3997121, -0.014349, 0, 1, 0.05098039, 1,
-0.4066624, 0.5271063, -0.2578332, 0, 1, 0.05882353, 1,
-0.4066391, -0.05938613, -0.3890963, 0, 1, 0.0627451, 1,
-0.4059674, 1.411597, -0.009516621, 0, 1, 0.07058824, 1,
-0.4034549, -1.671436, -2.499492, 0, 1, 0.07450981, 1,
-0.395303, -1.456262, -3.233617, 0, 1, 0.08235294, 1,
-0.3916974, 1.084645, -0.807857, 0, 1, 0.08627451, 1,
-0.3906903, -0.6488917, -2.691648, 0, 1, 0.09411765, 1,
-0.3903864, 0.5698438, -0.6006787, 0, 1, 0.1019608, 1,
-0.3893778, 0.0995792, -0.7498365, 0, 1, 0.1058824, 1,
-0.3881446, -0.9353696, -4.141882, 0, 1, 0.1137255, 1,
-0.3847093, 0.5068421, -0.3856971, 0, 1, 0.1176471, 1,
-0.382953, -0.2842514, -2.605027, 0, 1, 0.1254902, 1,
-0.3821792, -1.086348, -3.808801, 0, 1, 0.1294118, 1,
-0.3811535, 0.2241956, -0.5968804, 0, 1, 0.1372549, 1,
-0.3793226, 1.381397, -0.7443628, 0, 1, 0.1411765, 1,
-0.3786425, 1.066509, -0.0234655, 0, 1, 0.1490196, 1,
-0.3749371, 1.582981, -0.1935541, 0, 1, 0.1529412, 1,
-0.3682209, 0.8272537, 0.2776202, 0, 1, 0.1607843, 1,
-0.3679433, -0.6762643, -1.976559, 0, 1, 0.1647059, 1,
-0.3670372, 0.9269211, 0.04494695, 0, 1, 0.172549, 1,
-0.3607373, 0.7293264, -0.1245862, 0, 1, 0.1764706, 1,
-0.354007, -0.1071823, -3.051519, 0, 1, 0.1843137, 1,
-0.3524917, 1.413544, 0.1346085, 0, 1, 0.1882353, 1,
-0.349408, 1.107417, -1.081179, 0, 1, 0.1960784, 1,
-0.3454325, -1.054161, -0.7326677, 0, 1, 0.2039216, 1,
-0.3439207, 3.217131, -1.967598, 0, 1, 0.2078431, 1,
-0.3437948, -0.02454383, -0.6218336, 0, 1, 0.2156863, 1,
-0.3387387, 0.32123, -0.9280609, 0, 1, 0.2196078, 1,
-0.3359844, 0.01175928, -0.8054089, 0, 1, 0.227451, 1,
-0.3298717, 0.6783482, 0.5807982, 0, 1, 0.2313726, 1,
-0.3274994, -0.4192451, -2.712249, 0, 1, 0.2392157, 1,
-0.3274081, 0.4894786, -1.0265, 0, 1, 0.2431373, 1,
-0.3240333, 0.4577114, -2.877441, 0, 1, 0.2509804, 1,
-0.3228465, -1.351595, -2.731326, 0, 1, 0.254902, 1,
-0.3222968, -0.06671026, -0.4905151, 0, 1, 0.2627451, 1,
-0.319256, 0.3872114, -1.819453, 0, 1, 0.2666667, 1,
-0.3154492, 0.08737739, 0.3877032, 0, 1, 0.2745098, 1,
-0.3148073, 0.03810687, -4.309541, 0, 1, 0.2784314, 1,
-0.3038994, 0.6936119, -0.8166597, 0, 1, 0.2862745, 1,
-0.3013372, -1.706702, -3.538832, 0, 1, 0.2901961, 1,
-0.2944079, -0.3425922, -2.337349, 0, 1, 0.2980392, 1,
-0.2920983, -2.068487, -3.169819, 0, 1, 0.3058824, 1,
-0.2905536, 0.9231329, 0.08273612, 0, 1, 0.3098039, 1,
-0.2894409, -0.7146019, -2.231652, 0, 1, 0.3176471, 1,
-0.2879308, 0.3481822, -2.440278, 0, 1, 0.3215686, 1,
-0.2815062, 1.289154, -0.8491614, 0, 1, 0.3294118, 1,
-0.2795208, 1.24469, -0.727982, 0, 1, 0.3333333, 1,
-0.2786534, -1.71969, -3.058232, 0, 1, 0.3411765, 1,
-0.276298, 1.692557, 0.3354369, 0, 1, 0.345098, 1,
-0.2676246, 0.8141708, 0.7149266, 0, 1, 0.3529412, 1,
-0.2674741, -0.928309, -1.813857, 0, 1, 0.3568628, 1,
-0.2670454, -0.8928705, -3.373807, 0, 1, 0.3647059, 1,
-0.2662872, -0.05083272, -2.161292, 0, 1, 0.3686275, 1,
-0.2641394, -2.187546, -4.369611, 0, 1, 0.3764706, 1,
-0.2614474, 2.198678, 0.3950592, 0, 1, 0.3803922, 1,
-0.2599872, 0.7768453, -0.6637762, 0, 1, 0.3882353, 1,
-0.2584712, -0.6945807, -2.202204, 0, 1, 0.3921569, 1,
-0.2517821, 0.8115744, -0.2207699, 0, 1, 0.4, 1,
-0.2481661, -0.3822738, -3.248451, 0, 1, 0.4078431, 1,
-0.2475779, -0.4748506, -2.580852, 0, 1, 0.4117647, 1,
-0.2469013, -0.6505759, -2.181249, 0, 1, 0.4196078, 1,
-0.2439418, -1.058565, -1.44533, 0, 1, 0.4235294, 1,
-0.2395273, -0.1918107, -2.493086, 0, 1, 0.4313726, 1,
-0.2368159, -1.773408, -2.397887, 0, 1, 0.4352941, 1,
-0.2326467, -0.5636926, -1.828582, 0, 1, 0.4431373, 1,
-0.2321009, 1.35479, -0.7916548, 0, 1, 0.4470588, 1,
-0.2309957, -0.6121986, -2.525827, 0, 1, 0.454902, 1,
-0.2299179, 0.03329233, -2.138985, 0, 1, 0.4588235, 1,
-0.2281286, 1.076715, 0.3435871, 0, 1, 0.4666667, 1,
-0.2243471, 0.08667241, -0.5612568, 0, 1, 0.4705882, 1,
-0.2202824, 0.8901402, 1.318047, 0, 1, 0.4784314, 1,
-0.2195912, 0.6908271, 0.2343418, 0, 1, 0.4823529, 1,
-0.2191209, 0.6903923, -1.526656, 0, 1, 0.4901961, 1,
-0.211157, 1.229577, -0.9246587, 0, 1, 0.4941176, 1,
-0.2099226, -0.9271024, -1.577903, 0, 1, 0.5019608, 1,
-0.2080926, 0.4786964, -0.09998272, 0, 1, 0.509804, 1,
-0.2034893, 0.5982753, -0.5737155, 0, 1, 0.5137255, 1,
-0.2003297, 0.2139421, -1.205287, 0, 1, 0.5215687, 1,
-0.1936107, -0.0581376, -1.797637, 0, 1, 0.5254902, 1,
-0.1904529, -0.929925, -3.391768, 0, 1, 0.5333334, 1,
-0.1815323, -0.5057644, -3.553397, 0, 1, 0.5372549, 1,
-0.1809808, 0.2295724, 0.3314353, 0, 1, 0.5450981, 1,
-0.1802745, 1.135387, 0.879188, 0, 1, 0.5490196, 1,
-0.1790337, -0.4618177, -3.655641, 0, 1, 0.5568628, 1,
-0.1781587, 0.9437621, 1.271349, 0, 1, 0.5607843, 1,
-0.1780866, -1.205639, -3.539823, 0, 1, 0.5686275, 1,
-0.1725084, -0.3716123, -1.534134, 0, 1, 0.572549, 1,
-0.1676584, 1.128404, -1.052737, 0, 1, 0.5803922, 1,
-0.1676303, -1.115118, -3.033105, 0, 1, 0.5843138, 1,
-0.1644163, -0.8054804, -2.308729, 0, 1, 0.5921569, 1,
-0.1625534, -0.8241934, -3.621858, 0, 1, 0.5960785, 1,
-0.1598899, -0.4797926, -2.106786, 0, 1, 0.6039216, 1,
-0.1588335, -1.639981, -4.152079, 0, 1, 0.6117647, 1,
-0.1583594, -1.777861, -2.794592, 0, 1, 0.6156863, 1,
-0.1565538, 0.9117823, -0.4329048, 0, 1, 0.6235294, 1,
-0.1545116, -1.402148, -1.137038, 0, 1, 0.627451, 1,
-0.1500853, 3.07687, 1.151704, 0, 1, 0.6352941, 1,
-0.1494828, -0.3173619, -0.8255668, 0, 1, 0.6392157, 1,
-0.1446038, 1.169071, -0.6737199, 0, 1, 0.6470588, 1,
-0.1399142, -0.6701233, -2.860244, 0, 1, 0.6509804, 1,
-0.1335681, 1.776733, 0.002542504, 0, 1, 0.6588235, 1,
-0.1298514, 1.236879, 0.9472425, 0, 1, 0.6627451, 1,
-0.1295189, -0.3624395, -2.681402, 0, 1, 0.6705883, 1,
-0.1234811, 0.7186132, -1.493735, 0, 1, 0.6745098, 1,
-0.1198871, -0.3620372, -2.179083, 0, 1, 0.682353, 1,
-0.1139943, 2.276783, 0.684657, 0, 1, 0.6862745, 1,
-0.1100281, -0.6245305, -3.347877, 0, 1, 0.6941177, 1,
-0.1095272, 0.1402625, 0.8175176, 0, 1, 0.7019608, 1,
-0.1087957, 2.102189, 1.129977, 0, 1, 0.7058824, 1,
-0.1067968, -0.8288427, -2.221824, 0, 1, 0.7137255, 1,
-0.1031463, -0.04207451, -1.35056, 0, 1, 0.7176471, 1,
-0.0996653, 0.13492, -2.632454, 0, 1, 0.7254902, 1,
-0.09716273, 0.237505, 1.551648, 0, 1, 0.7294118, 1,
-0.09409478, -1.750787, -2.620351, 0, 1, 0.7372549, 1,
-0.09269979, -0.5151876, -3.362224, 0, 1, 0.7411765, 1,
-0.09151472, 1.046723, -1.118151, 0, 1, 0.7490196, 1,
-0.08696075, 1.617238, -1.099016, 0, 1, 0.7529412, 1,
-0.08418351, -0.5009683, -1.606704, 0, 1, 0.7607843, 1,
-0.08217958, 0.3038581, -0.2209897, 0, 1, 0.7647059, 1,
-0.07933554, -0.4191107, -4.599303, 0, 1, 0.772549, 1,
-0.07567336, 0.4389854, -1.82616, 0, 1, 0.7764706, 1,
-0.06340977, -0.1404958, -2.909718, 0, 1, 0.7843137, 1,
-0.06226232, -1.738002, -3.872526, 0, 1, 0.7882353, 1,
-0.05975792, 0.911809, -1.567019, 0, 1, 0.7960784, 1,
-0.05907598, -0.3935191, -3.326084, 0, 1, 0.8039216, 1,
-0.05802769, -0.990985, -3.989099, 0, 1, 0.8078431, 1,
-0.05331756, -0.4509906, -2.596028, 0, 1, 0.8156863, 1,
-0.05298525, 1.088917, 0.2733166, 0, 1, 0.8196079, 1,
-0.05092267, -0.2328359, -1.992301, 0, 1, 0.827451, 1,
-0.04905232, 2.117272, 0.3618187, 0, 1, 0.8313726, 1,
-0.04658295, 2.006227, -0.1252981, 0, 1, 0.8392157, 1,
-0.04287378, -1.544881, -2.889463, 0, 1, 0.8431373, 1,
-0.04201494, 1.142336, 0.5095819, 0, 1, 0.8509804, 1,
-0.04143245, -0.7660351, -2.446412, 0, 1, 0.854902, 1,
-0.04057968, 0.315762, -1.441181, 0, 1, 0.8627451, 1,
-0.03265189, 1.613553, -1.643898, 0, 1, 0.8666667, 1,
-0.03254494, 1.017302, -0.962279, 0, 1, 0.8745098, 1,
-0.02994477, 0.8172964, 1.450104, 0, 1, 0.8784314, 1,
-0.02739338, 0.1261044, 0.04909667, 0, 1, 0.8862745, 1,
-0.02502271, -0.5523565, -2.854024, 0, 1, 0.8901961, 1,
-0.02150709, -0.3497095, -3.430499, 0, 1, 0.8980392, 1,
-0.02137608, -0.1493274, -2.511321, 0, 1, 0.9058824, 1,
-0.02033183, -2.008782, -2.802247, 0, 1, 0.9098039, 1,
-0.01993257, -1.027349, -3.902838, 0, 1, 0.9176471, 1,
-0.01947265, -0.04431997, -1.395777, 0, 1, 0.9215686, 1,
-0.01669073, -1.901013, -3.526206, 0, 1, 0.9294118, 1,
-0.01127689, -0.610146, -1.969558, 0, 1, 0.9333333, 1,
-0.009398856, 0.4746902, 0.4486155, 0, 1, 0.9411765, 1,
-0.005829835, -0.07232413, -2.603152, 0, 1, 0.945098, 1,
-0.004683196, 0.07016496, -1.133833, 0, 1, 0.9529412, 1,
0.001247084, -0.6846546, 2.435752, 0, 1, 0.9568627, 1,
0.004828623, -1.113263, 4.010773, 0, 1, 0.9647059, 1,
0.008186962, 1.091425, -1.63408, 0, 1, 0.9686275, 1,
0.009290889, -2.211625, 3.219849, 0, 1, 0.9764706, 1,
0.01064336, -0.8360998, 4.305342, 0, 1, 0.9803922, 1,
0.01081547, -0.5376999, 2.994728, 0, 1, 0.9882353, 1,
0.01331156, 0.8136542, -1.486309, 0, 1, 0.9921569, 1,
0.01422237, -0.4434061, 2.311252, 0, 1, 1, 1,
0.01422507, -0.7302859, 4.856872, 0, 0.9921569, 1, 1,
0.01548624, -1.45745, 4.279733, 0, 0.9882353, 1, 1,
0.01574225, 0.1397114, -1.00812, 0, 0.9803922, 1, 1,
0.01899948, -0.07260905, 4.082095, 0, 0.9764706, 1, 1,
0.02015154, 0.8671793, 0.2923722, 0, 0.9686275, 1, 1,
0.02228438, 1.568719, 1.284988, 0, 0.9647059, 1, 1,
0.02342838, 0.5875844, -0.05027305, 0, 0.9568627, 1, 1,
0.02784494, -1.653637, 2.814843, 0, 0.9529412, 1, 1,
0.02967309, -0.8473151, 2.889853, 0, 0.945098, 1, 1,
0.03230977, 0.09557343, 3.183577, 0, 0.9411765, 1, 1,
0.04032174, -0.2076581, 1.953556, 0, 0.9333333, 1, 1,
0.04165566, -0.447889, 1.752497, 0, 0.9294118, 1, 1,
0.04313301, -0.3040992, 3.594563, 0, 0.9215686, 1, 1,
0.04643135, 2.382526, 1.21332, 0, 0.9176471, 1, 1,
0.04850909, 0.01900085, 1.087584, 0, 0.9098039, 1, 1,
0.05020927, -0.01246427, 2.696559, 0, 0.9058824, 1, 1,
0.05084039, -1.847078, 4.025882, 0, 0.8980392, 1, 1,
0.05244477, 0.780312, -0.1127621, 0, 0.8901961, 1, 1,
0.05681112, -0.4088049, 3.774535, 0, 0.8862745, 1, 1,
0.06099229, 0.4725246, -1.285546, 0, 0.8784314, 1, 1,
0.06267919, 0.7391868, -0.2558382, 0, 0.8745098, 1, 1,
0.06311864, 1.024378, 0.1642715, 0, 0.8666667, 1, 1,
0.06420415, -0.5201593, 4.531263, 0, 0.8627451, 1, 1,
0.06458468, -0.8084239, 4.499141, 0, 0.854902, 1, 1,
0.06662837, 0.963311, 1.039635, 0, 0.8509804, 1, 1,
0.06670012, 1.844122, 0.4987403, 0, 0.8431373, 1, 1,
0.0675352, -0.2006058, 3.354155, 0, 0.8392157, 1, 1,
0.06765316, -0.256747, 3.228561, 0, 0.8313726, 1, 1,
0.06926841, -0.8411782, 2.095787, 0, 0.827451, 1, 1,
0.07009126, 0.2215119, -0.1752201, 0, 0.8196079, 1, 1,
0.07053303, -2.43037, 3.861075, 0, 0.8156863, 1, 1,
0.07266114, 0.6922449, -0.2445697, 0, 0.8078431, 1, 1,
0.07588779, 0.5752984, 2.417989, 0, 0.8039216, 1, 1,
0.07730524, 1.591485, -0.7200135, 0, 0.7960784, 1, 1,
0.08108518, -0.7343152, 3.128679, 0, 0.7882353, 1, 1,
0.08134821, 0.06084226, 0.5205096, 0, 0.7843137, 1, 1,
0.08253347, -2.257761, 2.539578, 0, 0.7764706, 1, 1,
0.09157869, -0.7173706, 5.451754, 0, 0.772549, 1, 1,
0.09424932, 1.01484, -0.2002036, 0, 0.7647059, 1, 1,
0.09620997, -1.168203, 4.602164, 0, 0.7607843, 1, 1,
0.09621143, -0.1133376, 3.156993, 0, 0.7529412, 1, 1,
0.09812759, 0.723001, 0.7454688, 0, 0.7490196, 1, 1,
0.10079, 1.190262, 0.4871279, 0, 0.7411765, 1, 1,
0.1014999, 1.07117, -0.006948291, 0, 0.7372549, 1, 1,
0.1043051, -1.649134, 3.561838, 0, 0.7294118, 1, 1,
0.1047033, 1.541084, -0.4952209, 0, 0.7254902, 1, 1,
0.1047372, -0.1165269, 3.171213, 0, 0.7176471, 1, 1,
0.1073047, -2.391274, 5.139698, 0, 0.7137255, 1, 1,
0.1085065, -0.252813, 2.336221, 0, 0.7058824, 1, 1,
0.1168198, 1.215331, 1.090785, 0, 0.6980392, 1, 1,
0.1170232, 0.5203069, 0.6783498, 0, 0.6941177, 1, 1,
0.1171439, -1.22185, 2.784415, 0, 0.6862745, 1, 1,
0.1181902, 1.226668, 0.3144929, 0, 0.682353, 1, 1,
0.1310358, 1.585462, -0.1263195, 0, 0.6745098, 1, 1,
0.1328428, -1.049744, 4.387529, 0, 0.6705883, 1, 1,
0.136285, -0.2643597, 3.51215, 0, 0.6627451, 1, 1,
0.1427785, -0.395188, 2.081995, 0, 0.6588235, 1, 1,
0.1450435, -0.5197022, 2.13386, 0, 0.6509804, 1, 1,
0.1458378, -0.2961018, 3.580635, 0, 0.6470588, 1, 1,
0.1481574, -1.189029, 4.290865, 0, 0.6392157, 1, 1,
0.150223, 0.7008412, 0.8378567, 0, 0.6352941, 1, 1,
0.1505779, 1.48333, 0.7336762, 0, 0.627451, 1, 1,
0.1525671, -1.031757, 4.721052, 0, 0.6235294, 1, 1,
0.1553078, -0.8283753, 2.542047, 0, 0.6156863, 1, 1,
0.1558401, 0.3203041, -1.722545, 0, 0.6117647, 1, 1,
0.1575493, -0.1644166, 1.866001, 0, 0.6039216, 1, 1,
0.1612984, 0.6407926, 0.9457108, 0, 0.5960785, 1, 1,
0.1616169, -1.011832, 3.455254, 0, 0.5921569, 1, 1,
0.162545, 1.367949, -0.3741516, 0, 0.5843138, 1, 1,
0.16649, -0.2800082, 3.31994, 0, 0.5803922, 1, 1,
0.1666898, -0.1062455, 2.471418, 0, 0.572549, 1, 1,
0.1672419, 0.6012182, 1.29545, 0, 0.5686275, 1, 1,
0.1688695, -0.4923453, 3.386924, 0, 0.5607843, 1, 1,
0.1703128, -0.2386749, 2.057066, 0, 0.5568628, 1, 1,
0.1713147, 0.399306, 0.6894836, 0, 0.5490196, 1, 1,
0.1718233, -2.06714, 2.224512, 0, 0.5450981, 1, 1,
0.1760764, -0.3127336, 2.102314, 0, 0.5372549, 1, 1,
0.180744, 0.8132358, 0.5611197, 0, 0.5333334, 1, 1,
0.1809803, 0.2864309, 1.907929, 0, 0.5254902, 1, 1,
0.1825484, 3.463877, -0.6094777, 0, 0.5215687, 1, 1,
0.1831949, -1.312754, 3.10243, 0, 0.5137255, 1, 1,
0.1835077, 0.5066601, 2.680206, 0, 0.509804, 1, 1,
0.1844397, -0.356304, 4.596972, 0, 0.5019608, 1, 1,
0.1852691, 0.5322894, 0.7227149, 0, 0.4941176, 1, 1,
0.1865904, -0.704301, 2.531144, 0, 0.4901961, 1, 1,
0.1873345, -0.132074, 1.254427, 0, 0.4823529, 1, 1,
0.189044, -1.832428, 2.787465, 0, 0.4784314, 1, 1,
0.1899143, 1.390226, 1.100214, 0, 0.4705882, 1, 1,
0.1915647, 0.1220846, -0.05625449, 0, 0.4666667, 1, 1,
0.1919255, -0.9314046, 2.153944, 0, 0.4588235, 1, 1,
0.1979064, -1.644042, 3.696657, 0, 0.454902, 1, 1,
0.1980928, 1.315212, 0.9007728, 0, 0.4470588, 1, 1,
0.2032485, 0.5409264, 3.201844, 0, 0.4431373, 1, 1,
0.2039744, -1.910087, 3.391574, 0, 0.4352941, 1, 1,
0.2053501, -0.3840372, 3.292918, 0, 0.4313726, 1, 1,
0.2114367, -0.7999035, 3.024466, 0, 0.4235294, 1, 1,
0.2146159, -0.4023113, 1.355128, 0, 0.4196078, 1, 1,
0.2149075, -0.8006966, 2.188068, 0, 0.4117647, 1, 1,
0.215037, 0.07283971, 2.043708, 0, 0.4078431, 1, 1,
0.215515, 1.61025, -0.1134106, 0, 0.4, 1, 1,
0.2176044, 0.4015306, 0.2354243, 0, 0.3921569, 1, 1,
0.2177196, -0.7995142, 2.591048, 0, 0.3882353, 1, 1,
0.2206892, -0.1419795, 0.4332363, 0, 0.3803922, 1, 1,
0.2242478, 0.4053691, 1.454485, 0, 0.3764706, 1, 1,
0.2290134, -0.1215344, 3.948146, 0, 0.3686275, 1, 1,
0.2335256, -0.4380638, 4.55069, 0, 0.3647059, 1, 1,
0.2376006, -0.3092237, 2.718754, 0, 0.3568628, 1, 1,
0.2401978, 1.753552, -0.1002938, 0, 0.3529412, 1, 1,
0.2468409, 0.5109474, -0.1136824, 0, 0.345098, 1, 1,
0.2496198, 0.0384227, 2.345137, 0, 0.3411765, 1, 1,
0.2529214, 1.51135, 0.1556252, 0, 0.3333333, 1, 1,
0.2566107, 0.3645465, 0.9006242, 0, 0.3294118, 1, 1,
0.258746, 0.1920968, 0.350146, 0, 0.3215686, 1, 1,
0.2615867, 0.8676683, -0.9965336, 0, 0.3176471, 1, 1,
0.2635382, -0.2255296, 4.214935, 0, 0.3098039, 1, 1,
0.2662744, -0.3247223, 2.124455, 0, 0.3058824, 1, 1,
0.2762671, 0.3652948, 1.4523, 0, 0.2980392, 1, 1,
0.280382, -0.8786396, 2.402372, 0, 0.2901961, 1, 1,
0.2804039, -0.2586685, 2.597199, 0, 0.2862745, 1, 1,
0.281171, 0.4666655, -0.1167359, 0, 0.2784314, 1, 1,
0.283392, 0.3101464, -1.042971, 0, 0.2745098, 1, 1,
0.2908489, -0.5981283, 2.113687, 0, 0.2666667, 1, 1,
0.2911099, -0.7641615, 3.901693, 0, 0.2627451, 1, 1,
0.2969915, 1.129353, 1.099759, 0, 0.254902, 1, 1,
0.2999833, -0.1052475, 2.828639, 0, 0.2509804, 1, 1,
0.3002542, 0.9785847, -0.1004122, 0, 0.2431373, 1, 1,
0.3023426, 1.474831, 0.4606627, 0, 0.2392157, 1, 1,
0.3024087, 0.08195082, -0.5342189, 0, 0.2313726, 1, 1,
0.3065386, -0.7472514, 2.099365, 0, 0.227451, 1, 1,
0.3083362, -0.1618479, 3.388623, 0, 0.2196078, 1, 1,
0.3097254, 1.364297, -0.704455, 0, 0.2156863, 1, 1,
0.3122768, 0.2423612, 0.3519218, 0, 0.2078431, 1, 1,
0.3132881, 0.5625631, 1.290368, 0, 0.2039216, 1, 1,
0.3145024, 0.009858768, 1.475425, 0, 0.1960784, 1, 1,
0.3157976, -1.275357, 2.215751, 0, 0.1882353, 1, 1,
0.3195491, 1.185388, 0.01624097, 0, 0.1843137, 1, 1,
0.3225206, 1.890899, 0.6239119, 0, 0.1764706, 1, 1,
0.322914, -0.667239, 1.89864, 0, 0.172549, 1, 1,
0.3229768, 0.5078628, 1.212371, 0, 0.1647059, 1, 1,
0.3362185, 0.1866302, -0.6215214, 0, 0.1607843, 1, 1,
0.3394215, -1.425868, 2.614961, 0, 0.1529412, 1, 1,
0.3404853, 0.2340545, 0.8329081, 0, 0.1490196, 1, 1,
0.3454925, 1.300442, 1.595424, 0, 0.1411765, 1, 1,
0.3581351, 1.072651, 0.4059138, 0, 0.1372549, 1, 1,
0.3631961, 2.171443, -1.399104, 0, 0.1294118, 1, 1,
0.3718099, -0.3829214, 3.759766, 0, 0.1254902, 1, 1,
0.3733044, 0.6027507, -0.329239, 0, 0.1176471, 1, 1,
0.3737312, 3.923095e-05, 2.828255, 0, 0.1137255, 1, 1,
0.3757451, -1.090875, 3.276546, 0, 0.1058824, 1, 1,
0.3761217, 0.3746175, 0.1800011, 0, 0.09803922, 1, 1,
0.3805687, -0.4475564, 0.3973746, 0, 0.09411765, 1, 1,
0.3806781, -1.350969, 3.036251, 0, 0.08627451, 1, 1,
0.3810689, 0.8272606, 1.189955, 0, 0.08235294, 1, 1,
0.3857305, -1.141393, 1.820365, 0, 0.07450981, 1, 1,
0.389813, 0.3727929, -0.2919314, 0, 0.07058824, 1, 1,
0.3912062, 2.493676, 1.158918, 0, 0.0627451, 1, 1,
0.3948606, 0.4235933, 1.277466, 0, 0.05882353, 1, 1,
0.3950521, 0.5983131, 1.080983, 0, 0.05098039, 1, 1,
0.3959496, -0.01760304, 1.338112, 0, 0.04705882, 1, 1,
0.3993117, 0.2276131, 0.1648568, 0, 0.03921569, 1, 1,
0.4010738, 1.079643, -0.4324063, 0, 0.03529412, 1, 1,
0.4017366, -1.485949, 2.351453, 0, 0.02745098, 1, 1,
0.4042831, -0.5206745, 1.528656, 0, 0.02352941, 1, 1,
0.4059374, -0.8550634, 1.896159, 0, 0.01568628, 1, 1,
0.4060636, -0.848436, 4.42135, 0, 0.01176471, 1, 1,
0.4062927, 0.7257688, -0.5144357, 0, 0.003921569, 1, 1,
0.4110806, 0.3718119, -0.08276246, 0.003921569, 0, 1, 1,
0.4195321, -1.184399, 2.467453, 0.007843138, 0, 1, 1,
0.4216712, 1.381586, 0.1228251, 0.01568628, 0, 1, 1,
0.4331597, -0.9000455, 2.692808, 0.01960784, 0, 1, 1,
0.4374524, 1.494885, -0.6433484, 0.02745098, 0, 1, 1,
0.4378477, -0.2625219, 2.669837, 0.03137255, 0, 1, 1,
0.446412, 0.3923117, 0.3858936, 0.03921569, 0, 1, 1,
0.4511668, 0.4205143, 0.6022004, 0.04313726, 0, 1, 1,
0.4527695, -1.133609, 3.118056, 0.05098039, 0, 1, 1,
0.453096, -0.4179502, 0.9868324, 0.05490196, 0, 1, 1,
0.4570196, -0.5645602, 1.863283, 0.0627451, 0, 1, 1,
0.4596991, -0.005291981, 2.644817, 0.06666667, 0, 1, 1,
0.4616651, -0.3559544, 2.434674, 0.07450981, 0, 1, 1,
0.4656671, -0.06630693, 1.082519, 0.07843138, 0, 1, 1,
0.4663539, -0.9446733, 3.214219, 0.08627451, 0, 1, 1,
0.4684658, 0.4537904, 0.4982348, 0.09019608, 0, 1, 1,
0.4692921, -1.86283, 2.347755, 0.09803922, 0, 1, 1,
0.4695873, 0.124237, 3.640999, 0.1058824, 0, 1, 1,
0.4703829, 1.029318, 2.050569, 0.1098039, 0, 1, 1,
0.4715371, -0.9499103, 2.802264, 0.1176471, 0, 1, 1,
0.4741394, 2.103593, 1.195507, 0.1215686, 0, 1, 1,
0.4865398, 0.5447194, 1.114676, 0.1294118, 0, 1, 1,
0.4885769, -0.7276736, 1.851563, 0.1333333, 0, 1, 1,
0.4917626, 1.413937, 0.5669802, 0.1411765, 0, 1, 1,
0.4943588, -0.2905451, 2.233253, 0.145098, 0, 1, 1,
0.4967902, -0.3541902, 2.700573, 0.1529412, 0, 1, 1,
0.4990395, -1.873038, 2.67037, 0.1568628, 0, 1, 1,
0.5017818, -1.381103, 2.696863, 0.1647059, 0, 1, 1,
0.506161, 0.4055697, 0.09524487, 0.1686275, 0, 1, 1,
0.5130303, 0.7175564, 1.50675, 0.1764706, 0, 1, 1,
0.5138265, 0.03081777, 1.249945, 0.1803922, 0, 1, 1,
0.5146306, -0.3589386, 2.353697, 0.1882353, 0, 1, 1,
0.5148759, 1.127166, 0.9692973, 0.1921569, 0, 1, 1,
0.5158206, -0.453642, 4.277692, 0.2, 0, 1, 1,
0.5159464, 0.427108, 0.8768854, 0.2078431, 0, 1, 1,
0.5164449, -0.0305164, 2.522774, 0.2117647, 0, 1, 1,
0.5200537, 0.6243386, 1.369298, 0.2196078, 0, 1, 1,
0.5226256, -0.8075332, 2.035597, 0.2235294, 0, 1, 1,
0.5259857, -0.1520826, 2.038868, 0.2313726, 0, 1, 1,
0.5262248, 0.685766, -1.464927, 0.2352941, 0, 1, 1,
0.5292413, -0.1269408, 2.125214, 0.2431373, 0, 1, 1,
0.5361127, -0.7977825, 2.500672, 0.2470588, 0, 1, 1,
0.5441265, -1.626191, 2.229349, 0.254902, 0, 1, 1,
0.5500961, 1.125814, -0.1456992, 0.2588235, 0, 1, 1,
0.5516003, 1.637675, 0.7394164, 0.2666667, 0, 1, 1,
0.5523031, 0.5014225, 1.421597, 0.2705882, 0, 1, 1,
0.553942, -0.06606872, 1.765303, 0.2784314, 0, 1, 1,
0.556416, 0.1572298, 0.8043076, 0.282353, 0, 1, 1,
0.5589696, 1.832068, 0.0762989, 0.2901961, 0, 1, 1,
0.5594566, 0.383209, 0.461666, 0.2941177, 0, 1, 1,
0.5618801, -1.096831, 3.121706, 0.3019608, 0, 1, 1,
0.5662312, 0.7252129, 1.208923, 0.3098039, 0, 1, 1,
0.5665668, 0.3007736, 0.7196308, 0.3137255, 0, 1, 1,
0.5685589, -0.899233, 4.664758, 0.3215686, 0, 1, 1,
0.570428, 1.04528, 2.778111, 0.3254902, 0, 1, 1,
0.5716882, 0.6198148, 0.05389243, 0.3333333, 0, 1, 1,
0.5717058, 1.723851, 0.9017834, 0.3372549, 0, 1, 1,
0.5733917, -0.2191302, 1.477183, 0.345098, 0, 1, 1,
0.581005, 0.5554503, 0.5886089, 0.3490196, 0, 1, 1,
0.5899801, -1.024862, 2.976795, 0.3568628, 0, 1, 1,
0.5904323, 0.005730133, 0.5936253, 0.3607843, 0, 1, 1,
0.5920023, 0.2094867, 1.549129, 0.3686275, 0, 1, 1,
0.5932241, -0.3605477, 2.23674, 0.372549, 0, 1, 1,
0.5974293, -0.8287951, 4.109275, 0.3803922, 0, 1, 1,
0.5981044, 2.520055, 1.456222, 0.3843137, 0, 1, 1,
0.6005261, -0.3159214, 2.212087, 0.3921569, 0, 1, 1,
0.614616, 1.601024, 1.3459, 0.3960784, 0, 1, 1,
0.6148121, -0.4956487, 2.307131, 0.4039216, 0, 1, 1,
0.6151971, -0.4507029, 1.758079, 0.4117647, 0, 1, 1,
0.6161268, 1.225489, -0.1250555, 0.4156863, 0, 1, 1,
0.6162434, -0.8560029, 2.750556, 0.4235294, 0, 1, 1,
0.6263514, 0.4004115, 1.17909, 0.427451, 0, 1, 1,
0.6265605, 0.6914523, 0.8740457, 0.4352941, 0, 1, 1,
0.6272954, 1.259947, 0.002483362, 0.4392157, 0, 1, 1,
0.6324521, -1.237406, 2.468496, 0.4470588, 0, 1, 1,
0.6332292, 0.6745868, 0.972738, 0.4509804, 0, 1, 1,
0.6333874, -0.3230455, 2.782616, 0.4588235, 0, 1, 1,
0.6353216, -0.731213, 3.395744, 0.4627451, 0, 1, 1,
0.6389318, -0.9974089, 2.503503, 0.4705882, 0, 1, 1,
0.639005, 1.155801, 0.9771625, 0.4745098, 0, 1, 1,
0.6423301, -0.1360909, 2.713057, 0.4823529, 0, 1, 1,
0.6423672, 0.08388984, 1.744817, 0.4862745, 0, 1, 1,
0.6427113, 2.629702, 0.132466, 0.4941176, 0, 1, 1,
0.6450349, -0.5727359, 1.963883, 0.5019608, 0, 1, 1,
0.6459996, 1.34427, 0.5239728, 0.5058824, 0, 1, 1,
0.6461757, 0.2519899, 1.373651, 0.5137255, 0, 1, 1,
0.6506197, 0.3963318, -0.01872377, 0.5176471, 0, 1, 1,
0.6506863, -0.6768942, 2.967034, 0.5254902, 0, 1, 1,
0.6515715, 0.4846289, 0.715449, 0.5294118, 0, 1, 1,
0.6519756, 1.971549, -0.8523573, 0.5372549, 0, 1, 1,
0.6534705, -1.980644, 0.4192468, 0.5411765, 0, 1, 1,
0.6540798, -0.623082, 1.622422, 0.5490196, 0, 1, 1,
0.6550713, 0.5892746, 0.06806743, 0.5529412, 0, 1, 1,
0.6592143, -0.2429204, 3.290894, 0.5607843, 0, 1, 1,
0.6603165, -0.4199554, 2.503848, 0.5647059, 0, 1, 1,
0.6632432, 0.1442387, 1.917297, 0.572549, 0, 1, 1,
0.6646467, -0.3280428, 2.063577, 0.5764706, 0, 1, 1,
0.6657967, 1.088491, 1.417518, 0.5843138, 0, 1, 1,
0.6738187, -0.9738775, -0.06192405, 0.5882353, 0, 1, 1,
0.6773247, -2.134182, 2.574829, 0.5960785, 0, 1, 1,
0.6798658, -0.7931662, 2.925614, 0.6039216, 0, 1, 1,
0.6878563, 0.6831128, 1.932234, 0.6078432, 0, 1, 1,
0.6907597, -0.3278561, 0.2070479, 0.6156863, 0, 1, 1,
0.6921283, 1.090963, -2.148669, 0.6196079, 0, 1, 1,
0.6922087, 0.2037675, 0.4618846, 0.627451, 0, 1, 1,
0.6975234, 0.5060438, 0.61786, 0.6313726, 0, 1, 1,
0.6977282, -0.7726118, 1.064353, 0.6392157, 0, 1, 1,
0.7064183, 0.1985544, -0.3170709, 0.6431373, 0, 1, 1,
0.708993, -1.969276, 2.004703, 0.6509804, 0, 1, 1,
0.710084, 0.09814021, 1.337589, 0.654902, 0, 1, 1,
0.7138147, 0.1243613, 2.051282, 0.6627451, 0, 1, 1,
0.7169133, 0.5445271, 2.128024, 0.6666667, 0, 1, 1,
0.7190931, 0.2345059, 1.480872, 0.6745098, 0, 1, 1,
0.7196332, 0.493262, -0.2065299, 0.6784314, 0, 1, 1,
0.7228991, 0.6483548, 1.033532, 0.6862745, 0, 1, 1,
0.7291834, -1.36007, 1.740181, 0.6901961, 0, 1, 1,
0.7301887, -0.1866066, 1.277352, 0.6980392, 0, 1, 1,
0.731224, -0.988849, 2.695337, 0.7058824, 0, 1, 1,
0.7312304, 0.1414892, 1.454355, 0.7098039, 0, 1, 1,
0.7366303, -1.497657, 3.518881, 0.7176471, 0, 1, 1,
0.7376819, 0.6752104, 2.191286, 0.7215686, 0, 1, 1,
0.7391014, -0.8126, 2.913618, 0.7294118, 0, 1, 1,
0.7423473, 0.5022991, -0.2184465, 0.7333333, 0, 1, 1,
0.747942, -1.002853, 3.22999, 0.7411765, 0, 1, 1,
0.7488697, -0.3981461, 2.058692, 0.7450981, 0, 1, 1,
0.7677783, -0.1908403, 1.512886, 0.7529412, 0, 1, 1,
0.7708014, 0.5111633, 1.287665, 0.7568628, 0, 1, 1,
0.773241, -0.872952, 1.833352, 0.7647059, 0, 1, 1,
0.7807112, -1.321853, 5.080231, 0.7686275, 0, 1, 1,
0.7811393, 0.635585, 0.9518071, 0.7764706, 0, 1, 1,
0.7971375, -1.010894, 2.489275, 0.7803922, 0, 1, 1,
0.8000461, -0.1272347, -1.152308, 0.7882353, 0, 1, 1,
0.804449, 0.1302077, 0.7289825, 0.7921569, 0, 1, 1,
0.8058494, -0.06324507, -0.3989788, 0.8, 0, 1, 1,
0.8066447, 0.08683112, 1.486133, 0.8078431, 0, 1, 1,
0.8071976, -0.1354977, 2.516111, 0.8117647, 0, 1, 1,
0.8139749, -0.356911, 1.626155, 0.8196079, 0, 1, 1,
0.8167838, 0.7609673, 1.57679, 0.8235294, 0, 1, 1,
0.8173164, -0.6502845, 4.874489, 0.8313726, 0, 1, 1,
0.8183206, 0.2581709, 1.459569, 0.8352941, 0, 1, 1,
0.8228961, 1.079391, -0.734551, 0.8431373, 0, 1, 1,
0.8277155, 0.0002125137, 3.037107, 0.8470588, 0, 1, 1,
0.82899, 0.8085434, 2.174639, 0.854902, 0, 1, 1,
0.8401767, 1.055905, 0.7002873, 0.8588235, 0, 1, 1,
0.8439055, -0.5914919, 1.744137, 0.8666667, 0, 1, 1,
0.84613, 2.396938, -0.7577484, 0.8705882, 0, 1, 1,
0.8490078, 0.9341474, 2.162563, 0.8784314, 0, 1, 1,
0.849393, -1.851741, 3.201529, 0.8823529, 0, 1, 1,
0.8563874, -0.4177169, 4.19396, 0.8901961, 0, 1, 1,
0.8594913, 0.3877752, 0.9056338, 0.8941177, 0, 1, 1,
0.8617355, -0.1893954, 2.802525, 0.9019608, 0, 1, 1,
0.8668001, 0.5968766, 0.4191183, 0.9098039, 0, 1, 1,
0.8673967, -0.550219, 2.035899, 0.9137255, 0, 1, 1,
0.8724982, -2.578856, 3.721901, 0.9215686, 0, 1, 1,
0.8733304, -0.4280612, 1.540023, 0.9254902, 0, 1, 1,
0.8742068, -1.331437, 1.954644, 0.9333333, 0, 1, 1,
0.8805158, -0.6948564, 3.413993, 0.9372549, 0, 1, 1,
0.8833488, 0.5296492, 1.094928, 0.945098, 0, 1, 1,
0.8849831, -1.876606, 2.543716, 0.9490196, 0, 1, 1,
0.8907381, -0.4405634, 3.782868, 0.9568627, 0, 1, 1,
0.8910523, -0.3123107, 3.027469, 0.9607843, 0, 1, 1,
0.8923127, -1.624415, 1.958532, 0.9686275, 0, 1, 1,
0.8935103, 0.5404045, 0.4043534, 0.972549, 0, 1, 1,
0.8947499, -1.796703, 3.063894, 0.9803922, 0, 1, 1,
0.9079356, 1.369759, 0.9606126, 0.9843137, 0, 1, 1,
0.9085232, 0.4887012, 3.665624, 0.9921569, 0, 1, 1,
0.9095963, -1.176686, 3.443265, 0.9960784, 0, 1, 1,
0.9099915, -0.3448451, 2.166151, 1, 0, 0.9960784, 1,
0.9100541, 0.5356897, -0.3926472, 1, 0, 0.9882353, 1,
0.9159741, -0.8105044, 1.747728, 1, 0, 0.9843137, 1,
0.9411592, -0.009920516, 3.700719, 1, 0, 0.9764706, 1,
0.9419113, 0.4911024, 0.953044, 1, 0, 0.972549, 1,
0.9571, 0.3126512, 0.1340214, 1, 0, 0.9647059, 1,
0.9646865, 1.34697, 0.4272845, 1, 0, 0.9607843, 1,
0.9657798, -0.7225099, 3.158418, 1, 0, 0.9529412, 1,
0.9665177, -0.1236925, 2.708106, 1, 0, 0.9490196, 1,
0.972317, 0.2792515, 1.355024, 1, 0, 0.9411765, 1,
0.9741329, 0.167385, 0.4026984, 1, 0, 0.9372549, 1,
0.9769204, -0.376174, 3.820548, 1, 0, 0.9294118, 1,
0.9775277, -0.5813444, 0.6283082, 1, 0, 0.9254902, 1,
0.9792022, 0.2665148, 1.79876, 1, 0, 0.9176471, 1,
0.9822698, 1.883272, -0.7077309, 1, 0, 0.9137255, 1,
0.9851701, -0.2011742, 0.7998355, 1, 0, 0.9058824, 1,
0.9872634, -0.9456405, 2.560908, 1, 0, 0.9019608, 1,
0.9888991, 0.2060477, 0.8105968, 1, 0, 0.8941177, 1,
1.010897, 0.8081019, 0.04337711, 1, 0, 0.8862745, 1,
1.011731, -1.0475, 1.720034, 1, 0, 0.8823529, 1,
1.019917, -1.336746, 2.945682, 1, 0, 0.8745098, 1,
1.021535, -0.3055622, 1.30096, 1, 0, 0.8705882, 1,
1.027688, 0.5406008, -0.4722526, 1, 0, 0.8627451, 1,
1.02776, -1.237903, 2.041323, 1, 0, 0.8588235, 1,
1.029078, 0.04925778, 1.543191, 1, 0, 0.8509804, 1,
1.030661, 0.7526615, -0.4598188, 1, 0, 0.8470588, 1,
1.035406, -0.3469524, 2.725948, 1, 0, 0.8392157, 1,
1.039198, 0.5581386, 1.253275, 1, 0, 0.8352941, 1,
1.045241, 0.7171703, 1.358316, 1, 0, 0.827451, 1,
1.045549, 0.1971559, 1.760522, 1, 0, 0.8235294, 1,
1.047262, -1.148414, 1.824937, 1, 0, 0.8156863, 1,
1.06799, -0.4701265, 0.3749543, 1, 0, 0.8117647, 1,
1.07329, 1.48978, -0.6656197, 1, 0, 0.8039216, 1,
1.074547, 1.112268, 2.154337, 1, 0, 0.7960784, 1,
1.076648, 0.6679678, 0.965228, 1, 0, 0.7921569, 1,
1.083055, -0.02782216, 1.588489, 1, 0, 0.7843137, 1,
1.094882, -0.88258, 2.371325, 1, 0, 0.7803922, 1,
1.09698, 0.2455165, 1.640153, 1, 0, 0.772549, 1,
1.102973, 0.6659502, -0.1337095, 1, 0, 0.7686275, 1,
1.107721, 0.2576905, -0.6117889, 1, 0, 0.7607843, 1,
1.109259, -0.4258401, 2.543978, 1, 0, 0.7568628, 1,
1.109514, -0.02678232, 0.1488976, 1, 0, 0.7490196, 1,
1.112348, -0.004314961, 1.317003, 1, 0, 0.7450981, 1,
1.113712, -0.1176145, 2.832624, 1, 0, 0.7372549, 1,
1.119464, -1.157079, 1.710442, 1, 0, 0.7333333, 1,
1.132907, 1.0957, 0.978797, 1, 0, 0.7254902, 1,
1.133919, 1.723991, 0.2736041, 1, 0, 0.7215686, 1,
1.136998, 0.1867349, 1.965927, 1, 0, 0.7137255, 1,
1.139396, 0.1798893, -0.1984756, 1, 0, 0.7098039, 1,
1.142514, -0.7462366, 2.340586, 1, 0, 0.7019608, 1,
1.143032, 0.5494419, 1.58881, 1, 0, 0.6941177, 1,
1.147192, -0.4667277, 1.625531, 1, 0, 0.6901961, 1,
1.156764, -0.1929446, 2.379723, 1, 0, 0.682353, 1,
1.160967, -2.006598, 0.6585079, 1, 0, 0.6784314, 1,
1.164142, 1.205096, 0.5134248, 1, 0, 0.6705883, 1,
1.165894, -1.047984, 2.126245, 1, 0, 0.6666667, 1,
1.170749, 0.660864, 0.6241093, 1, 0, 0.6588235, 1,
1.176151, 0.5170289, 0.2504103, 1, 0, 0.654902, 1,
1.183384, 0.4055911, 3.706237, 1, 0, 0.6470588, 1,
1.187527, 0.446959, 0.773303, 1, 0, 0.6431373, 1,
1.201961, -0.03541809, 3.140578, 1, 0, 0.6352941, 1,
1.206645, -0.2150553, 1.556435, 1, 0, 0.6313726, 1,
1.209121, 1.406287, 0.6187469, 1, 0, 0.6235294, 1,
1.213321, -0.892536, 2.695992, 1, 0, 0.6196079, 1,
1.22082, -0.001282125, 2.57547, 1, 0, 0.6117647, 1,
1.227768, 0.09715131, 1.634974, 1, 0, 0.6078432, 1,
1.235878, -0.3826378, 1.714864, 1, 0, 0.6, 1,
1.23869, -0.5421262, 0.7622539, 1, 0, 0.5921569, 1,
1.250836, -0.6544604, 2.322055, 1, 0, 0.5882353, 1,
1.254051, 0.181972, 1.728411, 1, 0, 0.5803922, 1,
1.255084, 1.455674, 0.5036371, 1, 0, 0.5764706, 1,
1.26078, -0.8958903, 2.650676, 1, 0, 0.5686275, 1,
1.2642, 0.9831976, -0.07428858, 1, 0, 0.5647059, 1,
1.266208, -0.6154357, 1.485502, 1, 0, 0.5568628, 1,
1.267962, 0.1287588, 1.677882, 1, 0, 0.5529412, 1,
1.275012, -0.3946992, 2.336756, 1, 0, 0.5450981, 1,
1.282822, 1.669254, 1.043179, 1, 0, 0.5411765, 1,
1.29253, 0.5709258, -0.07647315, 1, 0, 0.5333334, 1,
1.302625, 1.016377, 1.776105, 1, 0, 0.5294118, 1,
1.318449, 0.5729761, 1.286914, 1, 0, 0.5215687, 1,
1.325931, 0.7394037, 0.3571428, 1, 0, 0.5176471, 1,
1.336606, 0.3532609, 1.465014, 1, 0, 0.509804, 1,
1.346789, -0.8615613, 3.478892, 1, 0, 0.5058824, 1,
1.347128, 1.478699, -0.6285551, 1, 0, 0.4980392, 1,
1.363896, -0.4122473, 1.266795, 1, 0, 0.4901961, 1,
1.370265, 1.123896, -0.4943469, 1, 0, 0.4862745, 1,
1.376242, -0.1270228, 1.842803, 1, 0, 0.4784314, 1,
1.384489, 0.9552373, 1.205278, 1, 0, 0.4745098, 1,
1.388296, 0.9029921, 1.404271, 1, 0, 0.4666667, 1,
1.388575, 0.2593242, 0.8041492, 1, 0, 0.4627451, 1,
1.393924, -0.8521433, 1.591469, 1, 0, 0.454902, 1,
1.395804, -0.782523, 2.326155, 1, 0, 0.4509804, 1,
1.396792, -0.2597449, 2.977266, 1, 0, 0.4431373, 1,
1.402256, -0.9368004, 2.208508, 1, 0, 0.4392157, 1,
1.415792, 0.9177904, 0.8834065, 1, 0, 0.4313726, 1,
1.418149, -0.4786202, 3.784752, 1, 0, 0.427451, 1,
1.42391, -0.1046292, 0.1109881, 1, 0, 0.4196078, 1,
1.42795, -0.4679767, 3.916965, 1, 0, 0.4156863, 1,
1.448486, 1.018037, 1.496795, 1, 0, 0.4078431, 1,
1.454556, 0.7466807, 2.967849, 1, 0, 0.4039216, 1,
1.459388, 1.319136, 0.4262173, 1, 0, 0.3960784, 1,
1.462305, -0.6666348, 3.947621, 1, 0, 0.3882353, 1,
1.465799, -0.01796156, 2.878323, 1, 0, 0.3843137, 1,
1.469135, -0.03625755, 0.2983397, 1, 0, 0.3764706, 1,
1.469359, 1.597565, -0.4697651, 1, 0, 0.372549, 1,
1.474854, 1.511714, -0.01164579, 1, 0, 0.3647059, 1,
1.487192, 0.6179954, 2.852025, 1, 0, 0.3607843, 1,
1.503219, -2.605721, 2.261358, 1, 0, 0.3529412, 1,
1.514918, 0.5788344, 1.086082, 1, 0, 0.3490196, 1,
1.542271, 0.5322926, 2.164677, 1, 0, 0.3411765, 1,
1.547097, 0.1776592, 1.185739, 1, 0, 0.3372549, 1,
1.556397, 0.2615876, 1.443756, 1, 0, 0.3294118, 1,
1.580256, -0.9959837, 2.8555, 1, 0, 0.3254902, 1,
1.584868, -0.557794, 2.702731, 1, 0, 0.3176471, 1,
1.607452, -1.655349, 3.09974, 1, 0, 0.3137255, 1,
1.610231, -0.1688329, 2.46002, 1, 0, 0.3058824, 1,
1.610391, 0.2594148, 2.666293, 1, 0, 0.2980392, 1,
1.63016, 1.001427, 1.553317, 1, 0, 0.2941177, 1,
1.640462, 0.372476, 1.453599, 1, 0, 0.2862745, 1,
1.643857, 0.2621633, 1.435692, 1, 0, 0.282353, 1,
1.654901, 0.985094, 3.106277, 1, 0, 0.2745098, 1,
1.663567, 0.2445536, -0.1706585, 1, 0, 0.2705882, 1,
1.679474, -0.422938, 0.7722288, 1, 0, 0.2627451, 1,
1.682977, 0.2739282, 1.113877, 1, 0, 0.2588235, 1,
1.684114, -0.05676127, 0.3691898, 1, 0, 0.2509804, 1,
1.69831, 1.73151, 0.1698667, 1, 0, 0.2470588, 1,
1.701186, -0.7416638, 1.105755, 1, 0, 0.2392157, 1,
1.709108, -0.3533745, 2.792092, 1, 0, 0.2352941, 1,
1.71145, 2.321589, 0.4616876, 1, 0, 0.227451, 1,
1.715975, 0.4125029, -0.2250638, 1, 0, 0.2235294, 1,
1.722588, 0.4337852, 1.587402, 1, 0, 0.2156863, 1,
1.763086, 0.8299181, 2.646812, 1, 0, 0.2117647, 1,
1.773151, 0.03307449, -0.06850725, 1, 0, 0.2039216, 1,
1.78047, 0.7544489, -0.04884681, 1, 0, 0.1960784, 1,
1.791334, 0.1029233, 0.4906124, 1, 0, 0.1921569, 1,
1.813696, 0.4917894, 1.78714, 1, 0, 0.1843137, 1,
1.851754, -0.1260454, 0.9652089, 1, 0, 0.1803922, 1,
1.854534, 0.7719756, 1.552959, 1, 0, 0.172549, 1,
1.868971, -0.127919, 1.310903, 1, 0, 0.1686275, 1,
1.89053, -0.06323028, 1.668563, 1, 0, 0.1607843, 1,
1.901643, 0.7405286, 0.9493482, 1, 0, 0.1568628, 1,
1.913705, -1.623673, 2.534125, 1, 0, 0.1490196, 1,
1.930078, -0.7476071, 0.6260332, 1, 0, 0.145098, 1,
1.930931, -1.119551, 2.088653, 1, 0, 0.1372549, 1,
1.954788, -0.7048898, -0.8476303, 1, 0, 0.1333333, 1,
1.978817, 0.5874792, 0.8951043, 1, 0, 0.1254902, 1,
2.001796, 0.4377782, -0.2791303, 1, 0, 0.1215686, 1,
2.066156, -2.058261, 2.95854, 1, 0, 0.1137255, 1,
2.068467, -1.102676, 1.659747, 1, 0, 0.1098039, 1,
2.102136, 0.6102178, 1.239804, 1, 0, 0.1019608, 1,
2.113069, 1.092761, 1.867304, 1, 0, 0.09411765, 1,
2.148641, 2.457291, 0.07024187, 1, 0, 0.09019608, 1,
2.207369, 0.8834625, 1.233575, 1, 0, 0.08235294, 1,
2.244592, 0.3821485, -0.1057254, 1, 0, 0.07843138, 1,
2.266508, -1.248919, 2.632576, 1, 0, 0.07058824, 1,
2.312448, -0.916415, 1.144805, 1, 0, 0.06666667, 1,
2.320371, 0.8789709, -0.4465, 1, 0, 0.05882353, 1,
2.339379, -0.4357955, 3.168111, 1, 0, 0.05490196, 1,
2.343144, -0.6964519, 2.491872, 1, 0, 0.04705882, 1,
2.406896, 1.057807, 1.681426, 1, 0, 0.04313726, 1,
2.428353, 0.06237246, 1.169568, 1, 0, 0.03529412, 1,
2.510079, -0.04982018, 1.581305, 1, 0, 0.03137255, 1,
2.527223, 1.046743, 0.08341237, 1, 0, 0.02352941, 1,
2.535864, 0.08783765, 2.307159, 1, 0, 0.01960784, 1,
2.750522, 2.075006, 0.5930396, 1, 0, 0.01176471, 1,
2.811084, -1.150111, 2.610764, 1, 0, 0.007843138, 1
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
-0.2165029, -4.01612, -7.442616, 0, -0.5, 0.5, 0.5,
-0.2165029, -4.01612, -7.442616, 1, -0.5, 0.5, 0.5,
-0.2165029, -4.01612, -7.442616, 1, 1.5, 0.5, 0.5,
-0.2165029, -4.01612, -7.442616, 0, 1.5, 0.5, 0.5
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
-4.270441, 0.2659302, -7.442616, 0, -0.5, 0.5, 0.5,
-4.270441, 0.2659302, -7.442616, 1, -0.5, 0.5, 0.5,
-4.270441, 0.2659302, -7.442616, 1, 1.5, 0.5, 0.5,
-4.270441, 0.2659302, -7.442616, 0, 1.5, 0.5, 0.5
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
-4.270441, -4.01612, -0.06101656, 0, -0.5, 0.5, 0.5,
-4.270441, -4.01612, -0.06101656, 1, -0.5, 0.5, 0.5,
-4.270441, -4.01612, -0.06101656, 1, 1.5, 0.5, 0.5,
-4.270441, -4.01612, -0.06101656, 0, 1.5, 0.5, 0.5
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
-3, -3.027955, -5.739171,
2, -3.027955, -5.739171,
-3, -3.027955, -5.739171,
-3, -3.192649, -6.023078,
-2, -3.027955, -5.739171,
-2, -3.192649, -6.023078,
-1, -3.027955, -5.739171,
-1, -3.192649, -6.023078,
0, -3.027955, -5.739171,
0, -3.192649, -6.023078,
1, -3.027955, -5.739171,
1, -3.192649, -6.023078,
2, -3.027955, -5.739171,
2, -3.192649, -6.023078
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
-3, -3.522038, -6.590893, 0, -0.5, 0.5, 0.5,
-3, -3.522038, -6.590893, 1, -0.5, 0.5, 0.5,
-3, -3.522038, -6.590893, 1, 1.5, 0.5, 0.5,
-3, -3.522038, -6.590893, 0, 1.5, 0.5, 0.5,
-2, -3.522038, -6.590893, 0, -0.5, 0.5, 0.5,
-2, -3.522038, -6.590893, 1, -0.5, 0.5, 0.5,
-2, -3.522038, -6.590893, 1, 1.5, 0.5, 0.5,
-2, -3.522038, -6.590893, 0, 1.5, 0.5, 0.5,
-1, -3.522038, -6.590893, 0, -0.5, 0.5, 0.5,
-1, -3.522038, -6.590893, 1, -0.5, 0.5, 0.5,
-1, -3.522038, -6.590893, 1, 1.5, 0.5, 0.5,
-1, -3.522038, -6.590893, 0, 1.5, 0.5, 0.5,
0, -3.522038, -6.590893, 0, -0.5, 0.5, 0.5,
0, -3.522038, -6.590893, 1, -0.5, 0.5, 0.5,
0, -3.522038, -6.590893, 1, 1.5, 0.5, 0.5,
0, -3.522038, -6.590893, 0, 1.5, 0.5, 0.5,
1, -3.522038, -6.590893, 0, -0.5, 0.5, 0.5,
1, -3.522038, -6.590893, 1, -0.5, 0.5, 0.5,
1, -3.522038, -6.590893, 1, 1.5, 0.5, 0.5,
1, -3.522038, -6.590893, 0, 1.5, 0.5, 0.5,
2, -3.522038, -6.590893, 0, -0.5, 0.5, 0.5,
2, -3.522038, -6.590893, 1, -0.5, 0.5, 0.5,
2, -3.522038, -6.590893, 1, 1.5, 0.5, 0.5,
2, -3.522038, -6.590893, 0, 1.5, 0.5, 0.5
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
-3.334917, -2, -5.739171,
-3.334917, 3, -5.739171,
-3.334917, -2, -5.739171,
-3.490838, -2, -6.023078,
-3.334917, -1, -5.739171,
-3.490838, -1, -6.023078,
-3.334917, 0, -5.739171,
-3.490838, 0, -6.023078,
-3.334917, 1, -5.739171,
-3.490838, 1, -6.023078,
-3.334917, 2, -5.739171,
-3.490838, 2, -6.023078,
-3.334917, 3, -5.739171,
-3.490838, 3, -6.023078
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
-3.802679, -2, -6.590893, 0, -0.5, 0.5, 0.5,
-3.802679, -2, -6.590893, 1, -0.5, 0.5, 0.5,
-3.802679, -2, -6.590893, 1, 1.5, 0.5, 0.5,
-3.802679, -2, -6.590893, 0, 1.5, 0.5, 0.5,
-3.802679, -1, -6.590893, 0, -0.5, 0.5, 0.5,
-3.802679, -1, -6.590893, 1, -0.5, 0.5, 0.5,
-3.802679, -1, -6.590893, 1, 1.5, 0.5, 0.5,
-3.802679, -1, -6.590893, 0, 1.5, 0.5, 0.5,
-3.802679, 0, -6.590893, 0, -0.5, 0.5, 0.5,
-3.802679, 0, -6.590893, 1, -0.5, 0.5, 0.5,
-3.802679, 0, -6.590893, 1, 1.5, 0.5, 0.5,
-3.802679, 0, -6.590893, 0, 1.5, 0.5, 0.5,
-3.802679, 1, -6.590893, 0, -0.5, 0.5, 0.5,
-3.802679, 1, -6.590893, 1, -0.5, 0.5, 0.5,
-3.802679, 1, -6.590893, 1, 1.5, 0.5, 0.5,
-3.802679, 1, -6.590893, 0, 1.5, 0.5, 0.5,
-3.802679, 2, -6.590893, 0, -0.5, 0.5, 0.5,
-3.802679, 2, -6.590893, 1, -0.5, 0.5, 0.5,
-3.802679, 2, -6.590893, 1, 1.5, 0.5, 0.5,
-3.802679, 2, -6.590893, 0, 1.5, 0.5, 0.5,
-3.802679, 3, -6.590893, 0, -0.5, 0.5, 0.5,
-3.802679, 3, -6.590893, 1, -0.5, 0.5, 0.5,
-3.802679, 3, -6.590893, 1, 1.5, 0.5, 0.5,
-3.802679, 3, -6.590893, 0, 1.5, 0.5, 0.5
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
-3.334917, -3.027955, -4,
-3.334917, -3.027955, 4,
-3.334917, -3.027955, -4,
-3.490838, -3.192649, -4,
-3.334917, -3.027955, -2,
-3.490838, -3.192649, -2,
-3.334917, -3.027955, 0,
-3.490838, -3.192649, 0,
-3.334917, -3.027955, 2,
-3.490838, -3.192649, 2,
-3.334917, -3.027955, 4,
-3.490838, -3.192649, 4
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
-3.802679, -3.522038, -4, 0, -0.5, 0.5, 0.5,
-3.802679, -3.522038, -4, 1, -0.5, 0.5, 0.5,
-3.802679, -3.522038, -4, 1, 1.5, 0.5, 0.5,
-3.802679, -3.522038, -4, 0, 1.5, 0.5, 0.5,
-3.802679, -3.522038, -2, 0, -0.5, 0.5, 0.5,
-3.802679, -3.522038, -2, 1, -0.5, 0.5, 0.5,
-3.802679, -3.522038, -2, 1, 1.5, 0.5, 0.5,
-3.802679, -3.522038, -2, 0, 1.5, 0.5, 0.5,
-3.802679, -3.522038, 0, 0, -0.5, 0.5, 0.5,
-3.802679, -3.522038, 0, 1, -0.5, 0.5, 0.5,
-3.802679, -3.522038, 0, 1, 1.5, 0.5, 0.5,
-3.802679, -3.522038, 0, 0, 1.5, 0.5, 0.5,
-3.802679, -3.522038, 2, 0, -0.5, 0.5, 0.5,
-3.802679, -3.522038, 2, 1, -0.5, 0.5, 0.5,
-3.802679, -3.522038, 2, 1, 1.5, 0.5, 0.5,
-3.802679, -3.522038, 2, 0, 1.5, 0.5, 0.5,
-3.802679, -3.522038, 4, 0, -0.5, 0.5, 0.5,
-3.802679, -3.522038, 4, 1, -0.5, 0.5, 0.5,
-3.802679, -3.522038, 4, 1, 1.5, 0.5, 0.5,
-3.802679, -3.522038, 4, 0, 1.5, 0.5, 0.5
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
-3.334917, -3.027955, -5.739171,
-3.334917, 3.559815, -5.739171,
-3.334917, -3.027955, 5.617137,
-3.334917, 3.559815, 5.617137,
-3.334917, -3.027955, -5.739171,
-3.334917, -3.027955, 5.617137,
-3.334917, 3.559815, -5.739171,
-3.334917, 3.559815, 5.617137,
-3.334917, -3.027955, -5.739171,
2.901911, -3.027955, -5.739171,
-3.334917, -3.027955, 5.617137,
2.901911, -3.027955, 5.617137,
-3.334917, 3.559815, -5.739171,
2.901911, 3.559815, -5.739171,
-3.334917, 3.559815, 5.617137,
2.901911, 3.559815, 5.617137,
2.901911, -3.027955, -5.739171,
2.901911, 3.559815, -5.739171,
2.901911, -3.027955, 5.617137,
2.901911, 3.559815, 5.617137,
2.901911, -3.027955, -5.739171,
2.901911, -3.027955, 5.617137,
2.901911, 3.559815, -5.739171,
2.901911, 3.559815, 5.617137
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
var radius = 7.761339;
var distance = 34.53107;
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
mvMatrix.translate( 0.2165029, -0.2659302, 0.06101656 );
mvMatrix.scale( 1.34551, 1.273832, 0.7389472 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.53107);
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
trichloromethylthio<-read.table("trichloromethylthio.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trichloromethylthio$V2
```

```
## Error in eval(expr, envir, enclos): object 'trichloromethylthio' not found
```

```r
y<-trichloromethylthio$V3
```

```
## Error in eval(expr, envir, enclos): object 'trichloromethylthio' not found
```

```r
z<-trichloromethylthio$V4
```

```
## Error in eval(expr, envir, enclos): object 'trichloromethylthio' not found
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
-3.244089, 1.359827, -0.8235942, 0, 0, 1, 1, 1,
-3.198766, 0.7309411, -2.485084, 1, 0, 0, 1, 1,
-2.732543, 0.6612528, -0.4695861, 1, 0, 0, 1, 1,
-2.584776, -0.3125469, -1.162637, 1, 0, 0, 1, 1,
-2.575231, 0.3464935, -1.51834, 1, 0, 0, 1, 1,
-2.550465, 0.5389947, -1.455835, 1, 0, 0, 1, 1,
-2.531619, -1.467161, -0.01776638, 0, 0, 0, 1, 1,
-2.523287, 0.1556019, -0.5465872, 0, 0, 0, 1, 1,
-2.511274, 0.7788976, 0.854192, 0, 0, 0, 1, 1,
-2.481599, -0.6619425, -0.6272447, 0, 0, 0, 1, 1,
-2.472133, -1.493971, -2.100838, 0, 0, 0, 1, 1,
-2.385772, -2.189557, -2.449548, 0, 0, 0, 1, 1,
-2.375464, 0.08047391, -0.5463599, 0, 0, 0, 1, 1,
-2.285655, -0.4127941, -2.064131, 1, 1, 1, 1, 1,
-2.282514, 0.04289914, 0.06519759, 1, 1, 1, 1, 1,
-2.25196, -0.1042337, -1.071826, 1, 1, 1, 1, 1,
-2.219908, -0.157298, -1.043792, 1, 1, 1, 1, 1,
-2.214962, -0.5555671, -1.600831, 1, 1, 1, 1, 1,
-2.209676, -2.932017, -1.425008, 1, 1, 1, 1, 1,
-2.202533, -1.377361, -3.355998, 1, 1, 1, 1, 1,
-2.201932, -2.423149, -3.729119, 1, 1, 1, 1, 1,
-2.186129, 0.4475278, 0.02348042, 1, 1, 1, 1, 1,
-2.16119, 0.5813556, -2.578579, 1, 1, 1, 1, 1,
-2.092431, -1.01581, -2.276488, 1, 1, 1, 1, 1,
-2.064132, 1.512479, -1.030646, 1, 1, 1, 1, 1,
-2.003026, 0.2961262, -0.9426715, 1, 1, 1, 1, 1,
-2.000188, 1.152614, 0.1065738, 1, 1, 1, 1, 1,
-1.954244, 0.7451029, -1.737279, 1, 1, 1, 1, 1,
-1.951642, 0.5452319, -1.458904, 0, 0, 1, 1, 1,
-1.92382, -0.9012206, -2.909867, 1, 0, 0, 1, 1,
-1.900062, 0.03734949, -3.659085, 1, 0, 0, 1, 1,
-1.892787, 0.3675899, -1.407745, 1, 0, 0, 1, 1,
-1.890559, -0.4295654, -2.342727, 1, 0, 0, 1, 1,
-1.879747, -0.5742581, -2.754613, 1, 0, 0, 1, 1,
-1.858645, -1.141857, -1.880779, 0, 0, 0, 1, 1,
-1.853393, 0.4506181, -0.5499058, 0, 0, 0, 1, 1,
-1.852895, -0.2825644, -2.381725, 0, 0, 0, 1, 1,
-1.852061, 1.851811, -1.353978, 0, 0, 0, 1, 1,
-1.852051, -1.080357, -2.475364, 0, 0, 0, 1, 1,
-1.849686, 1.024708, -1.052521, 0, 0, 0, 1, 1,
-1.846113, -0.3371577, -3.631585, 0, 0, 0, 1, 1,
-1.801897, 0.6282491, -0.9611841, 1, 1, 1, 1, 1,
-1.801545, 0.7698041, -1.038073, 1, 1, 1, 1, 1,
-1.79877, -0.1248948, -2.003095, 1, 1, 1, 1, 1,
-1.798475, -1.906923, -0.8384714, 1, 1, 1, 1, 1,
-1.77957, 0.6249252, 0.05943901, 1, 1, 1, 1, 1,
-1.759335, 0.4663124, -2.564355, 1, 1, 1, 1, 1,
-1.753194, -0.02972587, -3.011504, 1, 1, 1, 1, 1,
-1.748855, 0.6424015, -2.310562, 1, 1, 1, 1, 1,
-1.747627, 0.7652486, -2.558248, 1, 1, 1, 1, 1,
-1.742704, 0.08921918, -1.414385, 1, 1, 1, 1, 1,
-1.728472, 0.2151449, -3.01109, 1, 1, 1, 1, 1,
-1.690479, -0.5524032, -1.585322, 1, 1, 1, 1, 1,
-1.659426, 1.032638, 0.6824902, 1, 1, 1, 1, 1,
-1.652922, 0.2861725, -0.5995682, 1, 1, 1, 1, 1,
-1.648645, 0.09884361, -1.214883, 1, 1, 1, 1, 1,
-1.648633, 1.005488, -0.7267472, 0, 0, 1, 1, 1,
-1.647687, -0.6469977, -1.852616, 1, 0, 0, 1, 1,
-1.639176, 1.330183, -0.6987647, 1, 0, 0, 1, 1,
-1.636408, -1.442136, -2.512979, 1, 0, 0, 1, 1,
-1.633717, 0.5249792, 0.113096, 1, 0, 0, 1, 1,
-1.63146, -0.7277911, -0.9063361, 1, 0, 0, 1, 1,
-1.617253, -0.9147379, -2.45387, 0, 0, 0, 1, 1,
-1.603563, -0.415729, -2.041954, 0, 0, 0, 1, 1,
-1.60206, -0.2190543, -1.167726, 0, 0, 0, 1, 1,
-1.599751, 0.7812321, -1.439723, 0, 0, 0, 1, 1,
-1.596355, 2.162229, -1.276604, 0, 0, 0, 1, 1,
-1.577942, 1.474897, 1.05889, 0, 0, 0, 1, 1,
-1.567396, -0.3440234, -2.522379, 0, 0, 0, 1, 1,
-1.545907, -0.1825092, 0.009317865, 1, 1, 1, 1, 1,
-1.524873, -1.079136, -2.871637, 1, 1, 1, 1, 1,
-1.496957, 0.8868925, 0.3251788, 1, 1, 1, 1, 1,
-1.487739, -0.392088, -0.1141162, 1, 1, 1, 1, 1,
-1.48634, 0.3066023, -1.945438, 1, 1, 1, 1, 1,
-1.48553, 1.807783, -1.688593, 1, 1, 1, 1, 1,
-1.477566, -0.001806699, -1.40403, 1, 1, 1, 1, 1,
-1.474924, 0.5521889, -2.041969, 1, 1, 1, 1, 1,
-1.474113, 0.07565904, -0.8866192, 1, 1, 1, 1, 1,
-1.456716, -0.7366498, -1.894096, 1, 1, 1, 1, 1,
-1.456697, 1.511367, 0.3784532, 1, 1, 1, 1, 1,
-1.439012, 0.333751, 0.466738, 1, 1, 1, 1, 1,
-1.438584, 0.8185288, -2.107629, 1, 1, 1, 1, 1,
-1.434818, -0.7102078, -2.997934, 1, 1, 1, 1, 1,
-1.429051, -1.162309, -1.649852, 1, 1, 1, 1, 1,
-1.411695, 0.7737515, -1.542636, 0, 0, 1, 1, 1,
-1.406343, 1.12944, -1.924149, 1, 0, 0, 1, 1,
-1.398244, -0.2670955, -3.608816, 1, 0, 0, 1, 1,
-1.38597, 1.142202, -1.124772, 1, 0, 0, 1, 1,
-1.372452, -1.739469, -2.74816, 1, 0, 0, 1, 1,
-1.359496, -0.06836551, -2.384613, 1, 0, 0, 1, 1,
-1.359223, 1.02079, -1.881898, 0, 0, 0, 1, 1,
-1.354904, 0.218972, -1.502381, 0, 0, 0, 1, 1,
-1.347795, 0.3564782, -1.851146, 0, 0, 0, 1, 1,
-1.346761, 0.2750971, -1.06699, 0, 0, 0, 1, 1,
-1.329815, 0.1380108, -1.4492, 0, 0, 0, 1, 1,
-1.321007, 0.8714433, -1.0886, 0, 0, 0, 1, 1,
-1.315665, -1.083009, -0.5241241, 0, 0, 0, 1, 1,
-1.306714, -1.205013, -1.837312, 1, 1, 1, 1, 1,
-1.304852, 0.01810523, -2.373521, 1, 1, 1, 1, 1,
-1.301489, -0.8806322, -3.411909, 1, 1, 1, 1, 1,
-1.295096, 1.599026, -0.2313536, 1, 1, 1, 1, 1,
-1.294018, 0.3034451, -1.493419, 1, 1, 1, 1, 1,
-1.279516, 0.6208287, -0.3431891, 1, 1, 1, 1, 1,
-1.274035, -1.94453, -2.975109, 1, 1, 1, 1, 1,
-1.2728, -0.007427641, -1.36398, 1, 1, 1, 1, 1,
-1.270225, 0.7183586, -0.9135851, 1, 1, 1, 1, 1,
-1.26393, 0.9974677, 1.5973, 1, 1, 1, 1, 1,
-1.262197, -0.1077191, -1.268375, 1, 1, 1, 1, 1,
-1.259874, -1.759171, -3.468281, 1, 1, 1, 1, 1,
-1.246812, -0.3555056, -0.6747414, 1, 1, 1, 1, 1,
-1.241783, 1.026526, 1.293002, 1, 1, 1, 1, 1,
-1.241573, 1.347525, 0.2084801, 1, 1, 1, 1, 1,
-1.234403, 0.3331963, -2.318882, 0, 0, 1, 1, 1,
-1.232582, 0.8011611, -2.330122, 1, 0, 0, 1, 1,
-1.220113, -1.903328, -2.814806, 1, 0, 0, 1, 1,
-1.212723, 1.173967, -1.566707, 1, 0, 0, 1, 1,
-1.206572, -0.3264162, -2.605365, 1, 0, 0, 1, 1,
-1.198683, 0.8880354, 0.6377824, 1, 0, 0, 1, 1,
-1.193054, 0.2499628, -1.160472, 0, 0, 0, 1, 1,
-1.176158, 1.882068, -2.104821, 0, 0, 0, 1, 1,
-1.176078, 0.2053543, -1.965843, 0, 0, 0, 1, 1,
-1.174574, -0.09171623, -1.177191, 0, 0, 0, 1, 1,
-1.158376, -1.498332, -2.493819, 0, 0, 0, 1, 1,
-1.157334, -1.940234, -3.639674, 0, 0, 0, 1, 1,
-1.15224, 0.3367348, -1.869431, 0, 0, 0, 1, 1,
-1.150214, -0.1603628, -2.594409, 1, 1, 1, 1, 1,
-1.148568, -0.4696232, -0.3494038, 1, 1, 1, 1, 1,
-1.147694, -0.4091587, -0.2023849, 1, 1, 1, 1, 1,
-1.136563, -0.1945704, -1.0471, 1, 1, 1, 1, 1,
-1.135809, 0.4186095, -1.163897, 1, 1, 1, 1, 1,
-1.130335, -0.8995314, -2.827889, 1, 1, 1, 1, 1,
-1.127091, 0.1122229, -0.3345087, 1, 1, 1, 1, 1,
-1.115728, -0.7089138, -2.145933, 1, 1, 1, 1, 1,
-1.115407, -2.295458, -3.242299, 1, 1, 1, 1, 1,
-1.114416, 0.1157734, -1.731223, 1, 1, 1, 1, 1,
-1.113613, 0.2018901, -1.380347, 1, 1, 1, 1, 1,
-1.110491, 1.094147, -0.4392043, 1, 1, 1, 1, 1,
-1.110339, 0.9168782, 0.166654, 1, 1, 1, 1, 1,
-1.102503, -1.346187, -2.460309, 1, 1, 1, 1, 1,
-1.097592, 0.4770803, 0.7602609, 1, 1, 1, 1, 1,
-1.090184, 0.4907455, -2.024567, 0, 0, 1, 1, 1,
-1.089351, -0.8177816, -2.338558, 1, 0, 0, 1, 1,
-1.086748, 1.954729, -1.317767, 1, 0, 0, 1, 1,
-1.077371, 1.018411, -0.7430675, 1, 0, 0, 1, 1,
-1.074339, -0.8463063, -0.8549361, 1, 0, 0, 1, 1,
-1.071241, 0.1898402, -3.347193, 1, 0, 0, 1, 1,
-1.070332, 0.2879204, 1.172683, 0, 0, 0, 1, 1,
-1.0652, -0.6930617, -1.251931, 0, 0, 0, 1, 1,
-1.064387, -0.03868934, -2.719388, 0, 0, 0, 1, 1,
-1.061958, 0.3267715, -0.7410243, 0, 0, 0, 1, 1,
-1.061177, -1.582202, -3.950302, 0, 0, 0, 1, 1,
-1.04876, 0.05612968, -2.27617, 0, 0, 0, 1, 1,
-1.045577, -1.583373, -3.776287, 0, 0, 0, 1, 1,
-1.042801, 0.1018145, -2.46404, 1, 1, 1, 1, 1,
-1.037159, -0.296567, -2.958431, 1, 1, 1, 1, 1,
-1.033077, -1.309757, -3.094286, 1, 1, 1, 1, 1,
-1.026094, 0.1180437, -1.235497, 1, 1, 1, 1, 1,
-1.024031, -0.9123222, -0.6884236, 1, 1, 1, 1, 1,
-1.022277, -1.348067, -1.800135, 1, 1, 1, 1, 1,
-1.020779, -0.4905486, -2.35702, 1, 1, 1, 1, 1,
-1.020475, -0.08337241, -1.161374, 1, 1, 1, 1, 1,
-1.01836, -0.6372151, -2.477121, 1, 1, 1, 1, 1,
-1.015486, -0.04233309, -0.6496574, 1, 1, 1, 1, 1,
-1.014221, -0.8332819, -1.939277, 1, 1, 1, 1, 1,
-1.004166, 0.3991664, -0.1155242, 1, 1, 1, 1, 1,
-1.003886, 0.4671139, -1.93331, 1, 1, 1, 1, 1,
-1.00257, -0.0005558015, -0.9444554, 1, 1, 1, 1, 1,
-0.9947413, 0.139392, -2.00092, 1, 1, 1, 1, 1,
-0.9907426, 0.4915473, -0.7031573, 0, 0, 1, 1, 1,
-0.9788077, 0.6740448, -1.430343, 1, 0, 0, 1, 1,
-0.9753484, 1.489138, -1.329872, 1, 0, 0, 1, 1,
-0.973396, 1.470873, -0.1627598, 1, 0, 0, 1, 1,
-0.9710261, -0.9443413, -1.921657, 1, 0, 0, 1, 1,
-0.9685362, 1.716001, 0.1321689, 1, 0, 0, 1, 1,
-0.9685305, -0.07654478, -2.093556, 0, 0, 0, 1, 1,
-0.9434042, 0.9179218, -2.340593, 0, 0, 0, 1, 1,
-0.9392442, -0.427535, -1.322415, 0, 0, 0, 1, 1,
-0.9382973, -1.562513, -1.498775, 0, 0, 0, 1, 1,
-0.93628, 1.411926, -0.7955166, 0, 0, 0, 1, 1,
-0.9341962, 0.7626767, 1.046844, 0, 0, 0, 1, 1,
-0.9340214, -0.395836, -0.476313, 0, 0, 0, 1, 1,
-0.9339309, 0.8399003, -0.9173104, 1, 1, 1, 1, 1,
-0.9337491, 1.24435, -0.7814245, 1, 1, 1, 1, 1,
-0.9333493, 0.02619295, -1.195503, 1, 1, 1, 1, 1,
-0.930396, 1.936795, 0.784335, 1, 1, 1, 1, 1,
-0.9303345, 0.1967335, -0.5122924, 1, 1, 1, 1, 1,
-0.9268943, 0.1326425, -0.02118312, 1, 1, 1, 1, 1,
-0.9008129, 2.538493, -1.05789, 1, 1, 1, 1, 1,
-0.89939, 0.1503183, -0.4065528, 1, 1, 1, 1, 1,
-0.8985839, 0.3502819, -0.2910576, 1, 1, 1, 1, 1,
-0.8963577, 0.8482794, 0.7833239, 1, 1, 1, 1, 1,
-0.8924075, 0.6508055, -0.7251393, 1, 1, 1, 1, 1,
-0.8917685, 0.8350486, -1.817304, 1, 1, 1, 1, 1,
-0.8907019, 0.1597401, -2.090985, 1, 1, 1, 1, 1,
-0.8880582, -1.53608, -3.192233, 1, 1, 1, 1, 1,
-0.887633, -0.1786864, -0.4885916, 1, 1, 1, 1, 1,
-0.8815361, -0.1161828, 0.9910259, 0, 0, 1, 1, 1,
-0.8681438, 0.8047961, -0.5645415, 1, 0, 0, 1, 1,
-0.86513, 1.920781, -1.216377, 1, 0, 0, 1, 1,
-0.862964, 0.821547, -0.4903961, 1, 0, 0, 1, 1,
-0.852445, -0.6989501, -2.470023, 1, 0, 0, 1, 1,
-0.8509708, -0.2905844, -1.209286, 1, 0, 0, 1, 1,
-0.8496345, -1.520054, -2.822979, 0, 0, 0, 1, 1,
-0.8447446, 0.06402609, -0.7518162, 0, 0, 0, 1, 1,
-0.8326605, -0.792236, -3.154413, 0, 0, 0, 1, 1,
-0.8322331, -0.4078945, -2.311634, 0, 0, 0, 1, 1,
-0.8281089, -0.180696, -2.661918, 0, 0, 0, 1, 1,
-0.8238921, 1.768762, -1.025705, 0, 0, 0, 1, 1,
-0.823616, 1.044566, -0.1067266, 0, 0, 0, 1, 1,
-0.8159221, -1.146653, -2.732106, 1, 1, 1, 1, 1,
-0.8142414, 1.181325, -1.108247, 1, 1, 1, 1, 1,
-0.8126329, 0.08598479, -1.543383, 1, 1, 1, 1, 1,
-0.8073567, -0.418499, -2.084783, 1, 1, 1, 1, 1,
-0.8035949, -0.4752585, -1.768403, 1, 1, 1, 1, 1,
-0.8030235, -0.4475786, -1.926418, 1, 1, 1, 1, 1,
-0.8025016, -0.6137539, -1.418444, 1, 1, 1, 1, 1,
-0.7992342, 0.6481197, 0.9164627, 1, 1, 1, 1, 1,
-0.7988389, 1.354725, -0.1767219, 1, 1, 1, 1, 1,
-0.7975306, 0.6756584, -1.926123, 1, 1, 1, 1, 1,
-0.7937526, -0.1179852, -1.274305, 1, 1, 1, 1, 1,
-0.787007, -0.6545315, -4.655253, 1, 1, 1, 1, 1,
-0.786135, 0.6330058, -0.7714458, 1, 1, 1, 1, 1,
-0.7852529, -0.0467638, -1.660736, 1, 1, 1, 1, 1,
-0.770034, -0.1483541, -2.090828, 1, 1, 1, 1, 1,
-0.7647243, 0.6045905, -1.067287, 0, 0, 1, 1, 1,
-0.7639359, -0.260317, -3.567618, 1, 0, 0, 1, 1,
-0.7555968, -1.021063, -1.506788, 1, 0, 0, 1, 1,
-0.7527381, -0.9105749, -1.691134, 1, 0, 0, 1, 1,
-0.7527328, 1.627781, -1.090233, 1, 0, 0, 1, 1,
-0.750154, 0.06120741, -3.203719, 1, 0, 0, 1, 1,
-0.7487863, 0.5390245, -1.399534, 0, 0, 0, 1, 1,
-0.738331, -1.442182, -1.820644, 0, 0, 0, 1, 1,
-0.7363795, 0.8300781, 0.6403393, 0, 0, 0, 1, 1,
-0.7362518, -2.896414, -2.588129, 0, 0, 0, 1, 1,
-0.7333617, 2.062202, 0.6956781, 0, 0, 0, 1, 1,
-0.733354, 1.701275, -1.062222, 0, 0, 0, 1, 1,
-0.7328686, 0.1019787, 0.7079537, 0, 0, 0, 1, 1,
-0.7232335, 0.5035678, -1.473819, 1, 1, 1, 1, 1,
-0.7224274, 0.01091012, -0.08065727, 1, 1, 1, 1, 1,
-0.7196947, -0.08916581, -0.8781315, 1, 1, 1, 1, 1,
-0.7170433, -1.564595, -1.930258, 1, 1, 1, 1, 1,
-0.7162199, 0.3378147, -2.342255, 1, 1, 1, 1, 1,
-0.7136242, 0.004433667, -1.06915, 1, 1, 1, 1, 1,
-0.7120688, 0.2753734, -0.8705424, 1, 1, 1, 1, 1,
-0.7114181, 0.6571484, -0.02440822, 1, 1, 1, 1, 1,
-0.7093971, 1.531349, -1.854768, 1, 1, 1, 1, 1,
-0.7090847, 1.416746, -1.03199, 1, 1, 1, 1, 1,
-0.7029027, -0.4973709, -2.74077, 1, 1, 1, 1, 1,
-0.6982054, -0.6036239, -2.075273, 1, 1, 1, 1, 1,
-0.6927785, -1.311755, -1.649245, 1, 1, 1, 1, 1,
-0.6916978, 1.804765, -2.778056, 1, 1, 1, 1, 1,
-0.6909142, -1.093784, -1.18973, 1, 1, 1, 1, 1,
-0.6845199, 1.246059, -0.7139776, 0, 0, 1, 1, 1,
-0.6806867, -0.3225706, -2.717789, 1, 0, 0, 1, 1,
-0.6748872, 0.1296616, -1.914324, 1, 0, 0, 1, 1,
-0.6671672, 1.556866, -0.4132617, 1, 0, 0, 1, 1,
-0.6540061, -0.4851108, -3.794303, 1, 0, 0, 1, 1,
-0.6526304, -0.05115086, -2.332161, 1, 0, 0, 1, 1,
-0.6495533, 1.088349, 1.849314, 0, 0, 0, 1, 1,
-0.6475477, -0.680477, -3.236847, 0, 0, 0, 1, 1,
-0.6423107, -0.4547667, -0.7134034, 0, 0, 0, 1, 1,
-0.6413666, 1.329467, -1.914173, 0, 0, 0, 1, 1,
-0.6406251, 0.5397018, 0.01159461, 0, 0, 0, 1, 1,
-0.6406128, -0.7868323, -4.07091, 0, 0, 0, 1, 1,
-0.6345716, 2.312174, -0.1815746, 0, 0, 0, 1, 1,
-0.6305004, -1.193695, -1.98271, 1, 1, 1, 1, 1,
-0.6292869, 0.7093567, -3.068083, 1, 1, 1, 1, 1,
-0.6289544, -0.6599425, -2.357256, 1, 1, 1, 1, 1,
-0.6243746, 1.497909, -0.4815326, 1, 1, 1, 1, 1,
-0.6239314, 0.3264381, -1.786098, 1, 1, 1, 1, 1,
-0.6239275, -1.343455, -4.995867, 1, 1, 1, 1, 1,
-0.623896, -2.157524, -3.255918, 1, 1, 1, 1, 1,
-0.6181707, -1.176796, -1.738145, 1, 1, 1, 1, 1,
-0.6146208, 1.095154, -1.507842, 1, 1, 1, 1, 1,
-0.610041, -0.2848659, -2.890889, 1, 1, 1, 1, 1,
-0.609853, -1.394783, -2.301522, 1, 1, 1, 1, 1,
-0.6094077, 0.7104573, -0.997963, 1, 1, 1, 1, 1,
-0.6074156, 1.139468, -0.07242427, 1, 1, 1, 1, 1,
-0.6071112, -1.357708, -1.788499, 1, 1, 1, 1, 1,
-0.6030219, 0.08876884, 0.178719, 1, 1, 1, 1, 1,
-0.6011435, 2.008361, -1.455067, 0, 0, 1, 1, 1,
-0.5983798, 0.1573783, -1.530312, 1, 0, 0, 1, 1,
-0.5968607, 1.576891, 0.06137288, 1, 0, 0, 1, 1,
-0.5955731, -1.658059, -2.916544, 1, 0, 0, 1, 1,
-0.5894535, -0.3685772, -2.287701, 1, 0, 0, 1, 1,
-0.589384, -0.197802, -1.225531, 1, 0, 0, 1, 1,
-0.5882851, -0.9350815, -0.8565385, 0, 0, 0, 1, 1,
-0.5746698, -0.3958755, -2.307791, 0, 0, 0, 1, 1,
-0.5613422, -0.1222795, -1.176681, 0, 0, 0, 1, 1,
-0.5566666, -1.2502, -1.730442, 0, 0, 0, 1, 1,
-0.5495172, 0.2513492, -0.3803461, 0, 0, 0, 1, 1,
-0.5474198, 1.029509, -2.143605, 0, 0, 0, 1, 1,
-0.5412426, -1.458226, -0.7021112, 0, 0, 0, 1, 1,
-0.5378281, -0.01121775, -0.4618765, 1, 1, 1, 1, 1,
-0.536847, -0.08107438, -1.844419, 1, 1, 1, 1, 1,
-0.5336894, -0.8681227, -3.107443, 1, 1, 1, 1, 1,
-0.5315518, -0.4017139, -2.455668, 1, 1, 1, 1, 1,
-0.5304655, 0.4754271, -0.2008716, 1, 1, 1, 1, 1,
-0.5295851, 0.2788467, -0.843145, 1, 1, 1, 1, 1,
-0.5274389, 0.2483851, -0.6926159, 1, 1, 1, 1, 1,
-0.5214875, -0.1704961, -2.972924, 1, 1, 1, 1, 1,
-0.5186017, -0.0398661, -0.6858599, 1, 1, 1, 1, 1,
-0.5178921, 0.3074315, 0.05199261, 1, 1, 1, 1, 1,
-0.5132007, 1.875183, 0.5353888, 1, 1, 1, 1, 1,
-0.5108626, 0.968909, -1.334899, 1, 1, 1, 1, 1,
-0.5088149, 1.579736, -0.3284443, 1, 1, 1, 1, 1,
-0.5061198, 1.271472, -1.704459, 1, 1, 1, 1, 1,
-0.5045193, -0.1315733, -1.656614, 1, 1, 1, 1, 1,
-0.496522, 0.08516745, -2.399783, 0, 0, 1, 1, 1,
-0.4943477, -0.5132536, -2.769438, 1, 0, 0, 1, 1,
-0.4925359, 1.625649, -1.668044, 1, 0, 0, 1, 1,
-0.4918148, 0.2666379, -0.8290028, 1, 0, 0, 1, 1,
-0.4916442, -1.688963, -1.679526, 1, 0, 0, 1, 1,
-0.4915959, -0.6555238, -2.656098, 1, 0, 0, 1, 1,
-0.4914258, 0.5873374, -1.324927, 0, 0, 0, 1, 1,
-0.4893987, 0.2315129, -3.566976, 0, 0, 0, 1, 1,
-0.4861662, 1.534951, -1.039904, 0, 0, 0, 1, 1,
-0.4753152, 0.3187922, -2.964093, 0, 0, 0, 1, 1,
-0.4742379, -0.39546, -5.573787, 0, 0, 0, 1, 1,
-0.4703968, 0.3730625, -0.08502781, 0, 0, 0, 1, 1,
-0.4694576, -0.04902609, -1.481911, 0, 0, 0, 1, 1,
-0.4694351, -1.488387, -3.153588, 1, 1, 1, 1, 1,
-0.4635906, -0.1309807, -2.687494, 1, 1, 1, 1, 1,
-0.4613547, -0.1345679, -2.936359, 1, 1, 1, 1, 1,
-0.4541814, 0.5154676, -2.364953, 1, 1, 1, 1, 1,
-0.4541211, 0.009703491, -2.39762, 1, 1, 1, 1, 1,
-0.4516227, -1.705039, -2.747568, 1, 1, 1, 1, 1,
-0.4485768, -1.342308, -1.660937, 1, 1, 1, 1, 1,
-0.4474839, -0.6425418, -2.553181, 1, 1, 1, 1, 1,
-0.4470905, 1.254797, -0.4874367, 1, 1, 1, 1, 1,
-0.4398798, 0.6348616, -1.638596, 1, 1, 1, 1, 1,
-0.4379673, -0.5527843, -3.167566, 1, 1, 1, 1, 1,
-0.4374135, -0.1384705, -1.295096, 1, 1, 1, 1, 1,
-0.4343111, -1.695381, -2.88773, 1, 1, 1, 1, 1,
-0.4323977, -0.4995456, -1.814138, 1, 1, 1, 1, 1,
-0.4285403, 0.7201348, 0.1818492, 1, 1, 1, 1, 1,
-0.4254917, -0.891688, -2.097565, 0, 0, 1, 1, 1,
-0.4233821, -0.03085042, -2.61394, 1, 0, 0, 1, 1,
-0.4201556, -1.31614, -2.635909, 1, 0, 0, 1, 1,
-0.4162912, -1.329451, -3.410892, 1, 0, 0, 1, 1,
-0.4159898, 0.03367318, -1.741103, 1, 0, 0, 1, 1,
-0.4120427, -1.784976, -1.576541, 1, 0, 0, 1, 1,
-0.4102578, 0.3997121, -0.014349, 0, 0, 0, 1, 1,
-0.4066624, 0.5271063, -0.2578332, 0, 0, 0, 1, 1,
-0.4066391, -0.05938613, -0.3890963, 0, 0, 0, 1, 1,
-0.4059674, 1.411597, -0.009516621, 0, 0, 0, 1, 1,
-0.4034549, -1.671436, -2.499492, 0, 0, 0, 1, 1,
-0.395303, -1.456262, -3.233617, 0, 0, 0, 1, 1,
-0.3916974, 1.084645, -0.807857, 0, 0, 0, 1, 1,
-0.3906903, -0.6488917, -2.691648, 1, 1, 1, 1, 1,
-0.3903864, 0.5698438, -0.6006787, 1, 1, 1, 1, 1,
-0.3893778, 0.0995792, -0.7498365, 1, 1, 1, 1, 1,
-0.3881446, -0.9353696, -4.141882, 1, 1, 1, 1, 1,
-0.3847093, 0.5068421, -0.3856971, 1, 1, 1, 1, 1,
-0.382953, -0.2842514, -2.605027, 1, 1, 1, 1, 1,
-0.3821792, -1.086348, -3.808801, 1, 1, 1, 1, 1,
-0.3811535, 0.2241956, -0.5968804, 1, 1, 1, 1, 1,
-0.3793226, 1.381397, -0.7443628, 1, 1, 1, 1, 1,
-0.3786425, 1.066509, -0.0234655, 1, 1, 1, 1, 1,
-0.3749371, 1.582981, -0.1935541, 1, 1, 1, 1, 1,
-0.3682209, 0.8272537, 0.2776202, 1, 1, 1, 1, 1,
-0.3679433, -0.6762643, -1.976559, 1, 1, 1, 1, 1,
-0.3670372, 0.9269211, 0.04494695, 1, 1, 1, 1, 1,
-0.3607373, 0.7293264, -0.1245862, 1, 1, 1, 1, 1,
-0.354007, -0.1071823, -3.051519, 0, 0, 1, 1, 1,
-0.3524917, 1.413544, 0.1346085, 1, 0, 0, 1, 1,
-0.349408, 1.107417, -1.081179, 1, 0, 0, 1, 1,
-0.3454325, -1.054161, -0.7326677, 1, 0, 0, 1, 1,
-0.3439207, 3.217131, -1.967598, 1, 0, 0, 1, 1,
-0.3437948, -0.02454383, -0.6218336, 1, 0, 0, 1, 1,
-0.3387387, 0.32123, -0.9280609, 0, 0, 0, 1, 1,
-0.3359844, 0.01175928, -0.8054089, 0, 0, 0, 1, 1,
-0.3298717, 0.6783482, 0.5807982, 0, 0, 0, 1, 1,
-0.3274994, -0.4192451, -2.712249, 0, 0, 0, 1, 1,
-0.3274081, 0.4894786, -1.0265, 0, 0, 0, 1, 1,
-0.3240333, 0.4577114, -2.877441, 0, 0, 0, 1, 1,
-0.3228465, -1.351595, -2.731326, 0, 0, 0, 1, 1,
-0.3222968, -0.06671026, -0.4905151, 1, 1, 1, 1, 1,
-0.319256, 0.3872114, -1.819453, 1, 1, 1, 1, 1,
-0.3154492, 0.08737739, 0.3877032, 1, 1, 1, 1, 1,
-0.3148073, 0.03810687, -4.309541, 1, 1, 1, 1, 1,
-0.3038994, 0.6936119, -0.8166597, 1, 1, 1, 1, 1,
-0.3013372, -1.706702, -3.538832, 1, 1, 1, 1, 1,
-0.2944079, -0.3425922, -2.337349, 1, 1, 1, 1, 1,
-0.2920983, -2.068487, -3.169819, 1, 1, 1, 1, 1,
-0.2905536, 0.9231329, 0.08273612, 1, 1, 1, 1, 1,
-0.2894409, -0.7146019, -2.231652, 1, 1, 1, 1, 1,
-0.2879308, 0.3481822, -2.440278, 1, 1, 1, 1, 1,
-0.2815062, 1.289154, -0.8491614, 1, 1, 1, 1, 1,
-0.2795208, 1.24469, -0.727982, 1, 1, 1, 1, 1,
-0.2786534, -1.71969, -3.058232, 1, 1, 1, 1, 1,
-0.276298, 1.692557, 0.3354369, 1, 1, 1, 1, 1,
-0.2676246, 0.8141708, 0.7149266, 0, 0, 1, 1, 1,
-0.2674741, -0.928309, -1.813857, 1, 0, 0, 1, 1,
-0.2670454, -0.8928705, -3.373807, 1, 0, 0, 1, 1,
-0.2662872, -0.05083272, -2.161292, 1, 0, 0, 1, 1,
-0.2641394, -2.187546, -4.369611, 1, 0, 0, 1, 1,
-0.2614474, 2.198678, 0.3950592, 1, 0, 0, 1, 1,
-0.2599872, 0.7768453, -0.6637762, 0, 0, 0, 1, 1,
-0.2584712, -0.6945807, -2.202204, 0, 0, 0, 1, 1,
-0.2517821, 0.8115744, -0.2207699, 0, 0, 0, 1, 1,
-0.2481661, -0.3822738, -3.248451, 0, 0, 0, 1, 1,
-0.2475779, -0.4748506, -2.580852, 0, 0, 0, 1, 1,
-0.2469013, -0.6505759, -2.181249, 0, 0, 0, 1, 1,
-0.2439418, -1.058565, -1.44533, 0, 0, 0, 1, 1,
-0.2395273, -0.1918107, -2.493086, 1, 1, 1, 1, 1,
-0.2368159, -1.773408, -2.397887, 1, 1, 1, 1, 1,
-0.2326467, -0.5636926, -1.828582, 1, 1, 1, 1, 1,
-0.2321009, 1.35479, -0.7916548, 1, 1, 1, 1, 1,
-0.2309957, -0.6121986, -2.525827, 1, 1, 1, 1, 1,
-0.2299179, 0.03329233, -2.138985, 1, 1, 1, 1, 1,
-0.2281286, 1.076715, 0.3435871, 1, 1, 1, 1, 1,
-0.2243471, 0.08667241, -0.5612568, 1, 1, 1, 1, 1,
-0.2202824, 0.8901402, 1.318047, 1, 1, 1, 1, 1,
-0.2195912, 0.6908271, 0.2343418, 1, 1, 1, 1, 1,
-0.2191209, 0.6903923, -1.526656, 1, 1, 1, 1, 1,
-0.211157, 1.229577, -0.9246587, 1, 1, 1, 1, 1,
-0.2099226, -0.9271024, -1.577903, 1, 1, 1, 1, 1,
-0.2080926, 0.4786964, -0.09998272, 1, 1, 1, 1, 1,
-0.2034893, 0.5982753, -0.5737155, 1, 1, 1, 1, 1,
-0.2003297, 0.2139421, -1.205287, 0, 0, 1, 1, 1,
-0.1936107, -0.0581376, -1.797637, 1, 0, 0, 1, 1,
-0.1904529, -0.929925, -3.391768, 1, 0, 0, 1, 1,
-0.1815323, -0.5057644, -3.553397, 1, 0, 0, 1, 1,
-0.1809808, 0.2295724, 0.3314353, 1, 0, 0, 1, 1,
-0.1802745, 1.135387, 0.879188, 1, 0, 0, 1, 1,
-0.1790337, -0.4618177, -3.655641, 0, 0, 0, 1, 1,
-0.1781587, 0.9437621, 1.271349, 0, 0, 0, 1, 1,
-0.1780866, -1.205639, -3.539823, 0, 0, 0, 1, 1,
-0.1725084, -0.3716123, -1.534134, 0, 0, 0, 1, 1,
-0.1676584, 1.128404, -1.052737, 0, 0, 0, 1, 1,
-0.1676303, -1.115118, -3.033105, 0, 0, 0, 1, 1,
-0.1644163, -0.8054804, -2.308729, 0, 0, 0, 1, 1,
-0.1625534, -0.8241934, -3.621858, 1, 1, 1, 1, 1,
-0.1598899, -0.4797926, -2.106786, 1, 1, 1, 1, 1,
-0.1588335, -1.639981, -4.152079, 1, 1, 1, 1, 1,
-0.1583594, -1.777861, -2.794592, 1, 1, 1, 1, 1,
-0.1565538, 0.9117823, -0.4329048, 1, 1, 1, 1, 1,
-0.1545116, -1.402148, -1.137038, 1, 1, 1, 1, 1,
-0.1500853, 3.07687, 1.151704, 1, 1, 1, 1, 1,
-0.1494828, -0.3173619, -0.8255668, 1, 1, 1, 1, 1,
-0.1446038, 1.169071, -0.6737199, 1, 1, 1, 1, 1,
-0.1399142, -0.6701233, -2.860244, 1, 1, 1, 1, 1,
-0.1335681, 1.776733, 0.002542504, 1, 1, 1, 1, 1,
-0.1298514, 1.236879, 0.9472425, 1, 1, 1, 1, 1,
-0.1295189, -0.3624395, -2.681402, 1, 1, 1, 1, 1,
-0.1234811, 0.7186132, -1.493735, 1, 1, 1, 1, 1,
-0.1198871, -0.3620372, -2.179083, 1, 1, 1, 1, 1,
-0.1139943, 2.276783, 0.684657, 0, 0, 1, 1, 1,
-0.1100281, -0.6245305, -3.347877, 1, 0, 0, 1, 1,
-0.1095272, 0.1402625, 0.8175176, 1, 0, 0, 1, 1,
-0.1087957, 2.102189, 1.129977, 1, 0, 0, 1, 1,
-0.1067968, -0.8288427, -2.221824, 1, 0, 0, 1, 1,
-0.1031463, -0.04207451, -1.35056, 1, 0, 0, 1, 1,
-0.0996653, 0.13492, -2.632454, 0, 0, 0, 1, 1,
-0.09716273, 0.237505, 1.551648, 0, 0, 0, 1, 1,
-0.09409478, -1.750787, -2.620351, 0, 0, 0, 1, 1,
-0.09269979, -0.5151876, -3.362224, 0, 0, 0, 1, 1,
-0.09151472, 1.046723, -1.118151, 0, 0, 0, 1, 1,
-0.08696075, 1.617238, -1.099016, 0, 0, 0, 1, 1,
-0.08418351, -0.5009683, -1.606704, 0, 0, 0, 1, 1,
-0.08217958, 0.3038581, -0.2209897, 1, 1, 1, 1, 1,
-0.07933554, -0.4191107, -4.599303, 1, 1, 1, 1, 1,
-0.07567336, 0.4389854, -1.82616, 1, 1, 1, 1, 1,
-0.06340977, -0.1404958, -2.909718, 1, 1, 1, 1, 1,
-0.06226232, -1.738002, -3.872526, 1, 1, 1, 1, 1,
-0.05975792, 0.911809, -1.567019, 1, 1, 1, 1, 1,
-0.05907598, -0.3935191, -3.326084, 1, 1, 1, 1, 1,
-0.05802769, -0.990985, -3.989099, 1, 1, 1, 1, 1,
-0.05331756, -0.4509906, -2.596028, 1, 1, 1, 1, 1,
-0.05298525, 1.088917, 0.2733166, 1, 1, 1, 1, 1,
-0.05092267, -0.2328359, -1.992301, 1, 1, 1, 1, 1,
-0.04905232, 2.117272, 0.3618187, 1, 1, 1, 1, 1,
-0.04658295, 2.006227, -0.1252981, 1, 1, 1, 1, 1,
-0.04287378, -1.544881, -2.889463, 1, 1, 1, 1, 1,
-0.04201494, 1.142336, 0.5095819, 1, 1, 1, 1, 1,
-0.04143245, -0.7660351, -2.446412, 0, 0, 1, 1, 1,
-0.04057968, 0.315762, -1.441181, 1, 0, 0, 1, 1,
-0.03265189, 1.613553, -1.643898, 1, 0, 0, 1, 1,
-0.03254494, 1.017302, -0.962279, 1, 0, 0, 1, 1,
-0.02994477, 0.8172964, 1.450104, 1, 0, 0, 1, 1,
-0.02739338, 0.1261044, 0.04909667, 1, 0, 0, 1, 1,
-0.02502271, -0.5523565, -2.854024, 0, 0, 0, 1, 1,
-0.02150709, -0.3497095, -3.430499, 0, 0, 0, 1, 1,
-0.02137608, -0.1493274, -2.511321, 0, 0, 0, 1, 1,
-0.02033183, -2.008782, -2.802247, 0, 0, 0, 1, 1,
-0.01993257, -1.027349, -3.902838, 0, 0, 0, 1, 1,
-0.01947265, -0.04431997, -1.395777, 0, 0, 0, 1, 1,
-0.01669073, -1.901013, -3.526206, 0, 0, 0, 1, 1,
-0.01127689, -0.610146, -1.969558, 1, 1, 1, 1, 1,
-0.009398856, 0.4746902, 0.4486155, 1, 1, 1, 1, 1,
-0.005829835, -0.07232413, -2.603152, 1, 1, 1, 1, 1,
-0.004683196, 0.07016496, -1.133833, 1, 1, 1, 1, 1,
0.001247084, -0.6846546, 2.435752, 1, 1, 1, 1, 1,
0.004828623, -1.113263, 4.010773, 1, 1, 1, 1, 1,
0.008186962, 1.091425, -1.63408, 1, 1, 1, 1, 1,
0.009290889, -2.211625, 3.219849, 1, 1, 1, 1, 1,
0.01064336, -0.8360998, 4.305342, 1, 1, 1, 1, 1,
0.01081547, -0.5376999, 2.994728, 1, 1, 1, 1, 1,
0.01331156, 0.8136542, -1.486309, 1, 1, 1, 1, 1,
0.01422237, -0.4434061, 2.311252, 1, 1, 1, 1, 1,
0.01422507, -0.7302859, 4.856872, 1, 1, 1, 1, 1,
0.01548624, -1.45745, 4.279733, 1, 1, 1, 1, 1,
0.01574225, 0.1397114, -1.00812, 1, 1, 1, 1, 1,
0.01899948, -0.07260905, 4.082095, 0, 0, 1, 1, 1,
0.02015154, 0.8671793, 0.2923722, 1, 0, 0, 1, 1,
0.02228438, 1.568719, 1.284988, 1, 0, 0, 1, 1,
0.02342838, 0.5875844, -0.05027305, 1, 0, 0, 1, 1,
0.02784494, -1.653637, 2.814843, 1, 0, 0, 1, 1,
0.02967309, -0.8473151, 2.889853, 1, 0, 0, 1, 1,
0.03230977, 0.09557343, 3.183577, 0, 0, 0, 1, 1,
0.04032174, -0.2076581, 1.953556, 0, 0, 0, 1, 1,
0.04165566, -0.447889, 1.752497, 0, 0, 0, 1, 1,
0.04313301, -0.3040992, 3.594563, 0, 0, 0, 1, 1,
0.04643135, 2.382526, 1.21332, 0, 0, 0, 1, 1,
0.04850909, 0.01900085, 1.087584, 0, 0, 0, 1, 1,
0.05020927, -0.01246427, 2.696559, 0, 0, 0, 1, 1,
0.05084039, -1.847078, 4.025882, 1, 1, 1, 1, 1,
0.05244477, 0.780312, -0.1127621, 1, 1, 1, 1, 1,
0.05681112, -0.4088049, 3.774535, 1, 1, 1, 1, 1,
0.06099229, 0.4725246, -1.285546, 1, 1, 1, 1, 1,
0.06267919, 0.7391868, -0.2558382, 1, 1, 1, 1, 1,
0.06311864, 1.024378, 0.1642715, 1, 1, 1, 1, 1,
0.06420415, -0.5201593, 4.531263, 1, 1, 1, 1, 1,
0.06458468, -0.8084239, 4.499141, 1, 1, 1, 1, 1,
0.06662837, 0.963311, 1.039635, 1, 1, 1, 1, 1,
0.06670012, 1.844122, 0.4987403, 1, 1, 1, 1, 1,
0.0675352, -0.2006058, 3.354155, 1, 1, 1, 1, 1,
0.06765316, -0.256747, 3.228561, 1, 1, 1, 1, 1,
0.06926841, -0.8411782, 2.095787, 1, 1, 1, 1, 1,
0.07009126, 0.2215119, -0.1752201, 1, 1, 1, 1, 1,
0.07053303, -2.43037, 3.861075, 1, 1, 1, 1, 1,
0.07266114, 0.6922449, -0.2445697, 0, 0, 1, 1, 1,
0.07588779, 0.5752984, 2.417989, 1, 0, 0, 1, 1,
0.07730524, 1.591485, -0.7200135, 1, 0, 0, 1, 1,
0.08108518, -0.7343152, 3.128679, 1, 0, 0, 1, 1,
0.08134821, 0.06084226, 0.5205096, 1, 0, 0, 1, 1,
0.08253347, -2.257761, 2.539578, 1, 0, 0, 1, 1,
0.09157869, -0.7173706, 5.451754, 0, 0, 0, 1, 1,
0.09424932, 1.01484, -0.2002036, 0, 0, 0, 1, 1,
0.09620997, -1.168203, 4.602164, 0, 0, 0, 1, 1,
0.09621143, -0.1133376, 3.156993, 0, 0, 0, 1, 1,
0.09812759, 0.723001, 0.7454688, 0, 0, 0, 1, 1,
0.10079, 1.190262, 0.4871279, 0, 0, 0, 1, 1,
0.1014999, 1.07117, -0.006948291, 0, 0, 0, 1, 1,
0.1043051, -1.649134, 3.561838, 1, 1, 1, 1, 1,
0.1047033, 1.541084, -0.4952209, 1, 1, 1, 1, 1,
0.1047372, -0.1165269, 3.171213, 1, 1, 1, 1, 1,
0.1073047, -2.391274, 5.139698, 1, 1, 1, 1, 1,
0.1085065, -0.252813, 2.336221, 1, 1, 1, 1, 1,
0.1168198, 1.215331, 1.090785, 1, 1, 1, 1, 1,
0.1170232, 0.5203069, 0.6783498, 1, 1, 1, 1, 1,
0.1171439, -1.22185, 2.784415, 1, 1, 1, 1, 1,
0.1181902, 1.226668, 0.3144929, 1, 1, 1, 1, 1,
0.1310358, 1.585462, -0.1263195, 1, 1, 1, 1, 1,
0.1328428, -1.049744, 4.387529, 1, 1, 1, 1, 1,
0.136285, -0.2643597, 3.51215, 1, 1, 1, 1, 1,
0.1427785, -0.395188, 2.081995, 1, 1, 1, 1, 1,
0.1450435, -0.5197022, 2.13386, 1, 1, 1, 1, 1,
0.1458378, -0.2961018, 3.580635, 1, 1, 1, 1, 1,
0.1481574, -1.189029, 4.290865, 0, 0, 1, 1, 1,
0.150223, 0.7008412, 0.8378567, 1, 0, 0, 1, 1,
0.1505779, 1.48333, 0.7336762, 1, 0, 0, 1, 1,
0.1525671, -1.031757, 4.721052, 1, 0, 0, 1, 1,
0.1553078, -0.8283753, 2.542047, 1, 0, 0, 1, 1,
0.1558401, 0.3203041, -1.722545, 1, 0, 0, 1, 1,
0.1575493, -0.1644166, 1.866001, 0, 0, 0, 1, 1,
0.1612984, 0.6407926, 0.9457108, 0, 0, 0, 1, 1,
0.1616169, -1.011832, 3.455254, 0, 0, 0, 1, 1,
0.162545, 1.367949, -0.3741516, 0, 0, 0, 1, 1,
0.16649, -0.2800082, 3.31994, 0, 0, 0, 1, 1,
0.1666898, -0.1062455, 2.471418, 0, 0, 0, 1, 1,
0.1672419, 0.6012182, 1.29545, 0, 0, 0, 1, 1,
0.1688695, -0.4923453, 3.386924, 1, 1, 1, 1, 1,
0.1703128, -0.2386749, 2.057066, 1, 1, 1, 1, 1,
0.1713147, 0.399306, 0.6894836, 1, 1, 1, 1, 1,
0.1718233, -2.06714, 2.224512, 1, 1, 1, 1, 1,
0.1760764, -0.3127336, 2.102314, 1, 1, 1, 1, 1,
0.180744, 0.8132358, 0.5611197, 1, 1, 1, 1, 1,
0.1809803, 0.2864309, 1.907929, 1, 1, 1, 1, 1,
0.1825484, 3.463877, -0.6094777, 1, 1, 1, 1, 1,
0.1831949, -1.312754, 3.10243, 1, 1, 1, 1, 1,
0.1835077, 0.5066601, 2.680206, 1, 1, 1, 1, 1,
0.1844397, -0.356304, 4.596972, 1, 1, 1, 1, 1,
0.1852691, 0.5322894, 0.7227149, 1, 1, 1, 1, 1,
0.1865904, -0.704301, 2.531144, 1, 1, 1, 1, 1,
0.1873345, -0.132074, 1.254427, 1, 1, 1, 1, 1,
0.189044, -1.832428, 2.787465, 1, 1, 1, 1, 1,
0.1899143, 1.390226, 1.100214, 0, 0, 1, 1, 1,
0.1915647, 0.1220846, -0.05625449, 1, 0, 0, 1, 1,
0.1919255, -0.9314046, 2.153944, 1, 0, 0, 1, 1,
0.1979064, -1.644042, 3.696657, 1, 0, 0, 1, 1,
0.1980928, 1.315212, 0.9007728, 1, 0, 0, 1, 1,
0.2032485, 0.5409264, 3.201844, 1, 0, 0, 1, 1,
0.2039744, -1.910087, 3.391574, 0, 0, 0, 1, 1,
0.2053501, -0.3840372, 3.292918, 0, 0, 0, 1, 1,
0.2114367, -0.7999035, 3.024466, 0, 0, 0, 1, 1,
0.2146159, -0.4023113, 1.355128, 0, 0, 0, 1, 1,
0.2149075, -0.8006966, 2.188068, 0, 0, 0, 1, 1,
0.215037, 0.07283971, 2.043708, 0, 0, 0, 1, 1,
0.215515, 1.61025, -0.1134106, 0, 0, 0, 1, 1,
0.2176044, 0.4015306, 0.2354243, 1, 1, 1, 1, 1,
0.2177196, -0.7995142, 2.591048, 1, 1, 1, 1, 1,
0.2206892, -0.1419795, 0.4332363, 1, 1, 1, 1, 1,
0.2242478, 0.4053691, 1.454485, 1, 1, 1, 1, 1,
0.2290134, -0.1215344, 3.948146, 1, 1, 1, 1, 1,
0.2335256, -0.4380638, 4.55069, 1, 1, 1, 1, 1,
0.2376006, -0.3092237, 2.718754, 1, 1, 1, 1, 1,
0.2401978, 1.753552, -0.1002938, 1, 1, 1, 1, 1,
0.2468409, 0.5109474, -0.1136824, 1, 1, 1, 1, 1,
0.2496198, 0.0384227, 2.345137, 1, 1, 1, 1, 1,
0.2529214, 1.51135, 0.1556252, 1, 1, 1, 1, 1,
0.2566107, 0.3645465, 0.9006242, 1, 1, 1, 1, 1,
0.258746, 0.1920968, 0.350146, 1, 1, 1, 1, 1,
0.2615867, 0.8676683, -0.9965336, 1, 1, 1, 1, 1,
0.2635382, -0.2255296, 4.214935, 1, 1, 1, 1, 1,
0.2662744, -0.3247223, 2.124455, 0, 0, 1, 1, 1,
0.2762671, 0.3652948, 1.4523, 1, 0, 0, 1, 1,
0.280382, -0.8786396, 2.402372, 1, 0, 0, 1, 1,
0.2804039, -0.2586685, 2.597199, 1, 0, 0, 1, 1,
0.281171, 0.4666655, -0.1167359, 1, 0, 0, 1, 1,
0.283392, 0.3101464, -1.042971, 1, 0, 0, 1, 1,
0.2908489, -0.5981283, 2.113687, 0, 0, 0, 1, 1,
0.2911099, -0.7641615, 3.901693, 0, 0, 0, 1, 1,
0.2969915, 1.129353, 1.099759, 0, 0, 0, 1, 1,
0.2999833, -0.1052475, 2.828639, 0, 0, 0, 1, 1,
0.3002542, 0.9785847, -0.1004122, 0, 0, 0, 1, 1,
0.3023426, 1.474831, 0.4606627, 0, 0, 0, 1, 1,
0.3024087, 0.08195082, -0.5342189, 0, 0, 0, 1, 1,
0.3065386, -0.7472514, 2.099365, 1, 1, 1, 1, 1,
0.3083362, -0.1618479, 3.388623, 1, 1, 1, 1, 1,
0.3097254, 1.364297, -0.704455, 1, 1, 1, 1, 1,
0.3122768, 0.2423612, 0.3519218, 1, 1, 1, 1, 1,
0.3132881, 0.5625631, 1.290368, 1, 1, 1, 1, 1,
0.3145024, 0.009858768, 1.475425, 1, 1, 1, 1, 1,
0.3157976, -1.275357, 2.215751, 1, 1, 1, 1, 1,
0.3195491, 1.185388, 0.01624097, 1, 1, 1, 1, 1,
0.3225206, 1.890899, 0.6239119, 1, 1, 1, 1, 1,
0.322914, -0.667239, 1.89864, 1, 1, 1, 1, 1,
0.3229768, 0.5078628, 1.212371, 1, 1, 1, 1, 1,
0.3362185, 0.1866302, -0.6215214, 1, 1, 1, 1, 1,
0.3394215, -1.425868, 2.614961, 1, 1, 1, 1, 1,
0.3404853, 0.2340545, 0.8329081, 1, 1, 1, 1, 1,
0.3454925, 1.300442, 1.595424, 1, 1, 1, 1, 1,
0.3581351, 1.072651, 0.4059138, 0, 0, 1, 1, 1,
0.3631961, 2.171443, -1.399104, 1, 0, 0, 1, 1,
0.3718099, -0.3829214, 3.759766, 1, 0, 0, 1, 1,
0.3733044, 0.6027507, -0.329239, 1, 0, 0, 1, 1,
0.3737312, 3.923095e-05, 2.828255, 1, 0, 0, 1, 1,
0.3757451, -1.090875, 3.276546, 1, 0, 0, 1, 1,
0.3761217, 0.3746175, 0.1800011, 0, 0, 0, 1, 1,
0.3805687, -0.4475564, 0.3973746, 0, 0, 0, 1, 1,
0.3806781, -1.350969, 3.036251, 0, 0, 0, 1, 1,
0.3810689, 0.8272606, 1.189955, 0, 0, 0, 1, 1,
0.3857305, -1.141393, 1.820365, 0, 0, 0, 1, 1,
0.389813, 0.3727929, -0.2919314, 0, 0, 0, 1, 1,
0.3912062, 2.493676, 1.158918, 0, 0, 0, 1, 1,
0.3948606, 0.4235933, 1.277466, 1, 1, 1, 1, 1,
0.3950521, 0.5983131, 1.080983, 1, 1, 1, 1, 1,
0.3959496, -0.01760304, 1.338112, 1, 1, 1, 1, 1,
0.3993117, 0.2276131, 0.1648568, 1, 1, 1, 1, 1,
0.4010738, 1.079643, -0.4324063, 1, 1, 1, 1, 1,
0.4017366, -1.485949, 2.351453, 1, 1, 1, 1, 1,
0.4042831, -0.5206745, 1.528656, 1, 1, 1, 1, 1,
0.4059374, -0.8550634, 1.896159, 1, 1, 1, 1, 1,
0.4060636, -0.848436, 4.42135, 1, 1, 1, 1, 1,
0.4062927, 0.7257688, -0.5144357, 1, 1, 1, 1, 1,
0.4110806, 0.3718119, -0.08276246, 1, 1, 1, 1, 1,
0.4195321, -1.184399, 2.467453, 1, 1, 1, 1, 1,
0.4216712, 1.381586, 0.1228251, 1, 1, 1, 1, 1,
0.4331597, -0.9000455, 2.692808, 1, 1, 1, 1, 1,
0.4374524, 1.494885, -0.6433484, 1, 1, 1, 1, 1,
0.4378477, -0.2625219, 2.669837, 0, 0, 1, 1, 1,
0.446412, 0.3923117, 0.3858936, 1, 0, 0, 1, 1,
0.4511668, 0.4205143, 0.6022004, 1, 0, 0, 1, 1,
0.4527695, -1.133609, 3.118056, 1, 0, 0, 1, 1,
0.453096, -0.4179502, 0.9868324, 1, 0, 0, 1, 1,
0.4570196, -0.5645602, 1.863283, 1, 0, 0, 1, 1,
0.4596991, -0.005291981, 2.644817, 0, 0, 0, 1, 1,
0.4616651, -0.3559544, 2.434674, 0, 0, 0, 1, 1,
0.4656671, -0.06630693, 1.082519, 0, 0, 0, 1, 1,
0.4663539, -0.9446733, 3.214219, 0, 0, 0, 1, 1,
0.4684658, 0.4537904, 0.4982348, 0, 0, 0, 1, 1,
0.4692921, -1.86283, 2.347755, 0, 0, 0, 1, 1,
0.4695873, 0.124237, 3.640999, 0, 0, 0, 1, 1,
0.4703829, 1.029318, 2.050569, 1, 1, 1, 1, 1,
0.4715371, -0.9499103, 2.802264, 1, 1, 1, 1, 1,
0.4741394, 2.103593, 1.195507, 1, 1, 1, 1, 1,
0.4865398, 0.5447194, 1.114676, 1, 1, 1, 1, 1,
0.4885769, -0.7276736, 1.851563, 1, 1, 1, 1, 1,
0.4917626, 1.413937, 0.5669802, 1, 1, 1, 1, 1,
0.4943588, -0.2905451, 2.233253, 1, 1, 1, 1, 1,
0.4967902, -0.3541902, 2.700573, 1, 1, 1, 1, 1,
0.4990395, -1.873038, 2.67037, 1, 1, 1, 1, 1,
0.5017818, -1.381103, 2.696863, 1, 1, 1, 1, 1,
0.506161, 0.4055697, 0.09524487, 1, 1, 1, 1, 1,
0.5130303, 0.7175564, 1.50675, 1, 1, 1, 1, 1,
0.5138265, 0.03081777, 1.249945, 1, 1, 1, 1, 1,
0.5146306, -0.3589386, 2.353697, 1, 1, 1, 1, 1,
0.5148759, 1.127166, 0.9692973, 1, 1, 1, 1, 1,
0.5158206, -0.453642, 4.277692, 0, 0, 1, 1, 1,
0.5159464, 0.427108, 0.8768854, 1, 0, 0, 1, 1,
0.5164449, -0.0305164, 2.522774, 1, 0, 0, 1, 1,
0.5200537, 0.6243386, 1.369298, 1, 0, 0, 1, 1,
0.5226256, -0.8075332, 2.035597, 1, 0, 0, 1, 1,
0.5259857, -0.1520826, 2.038868, 1, 0, 0, 1, 1,
0.5262248, 0.685766, -1.464927, 0, 0, 0, 1, 1,
0.5292413, -0.1269408, 2.125214, 0, 0, 0, 1, 1,
0.5361127, -0.7977825, 2.500672, 0, 0, 0, 1, 1,
0.5441265, -1.626191, 2.229349, 0, 0, 0, 1, 1,
0.5500961, 1.125814, -0.1456992, 0, 0, 0, 1, 1,
0.5516003, 1.637675, 0.7394164, 0, 0, 0, 1, 1,
0.5523031, 0.5014225, 1.421597, 0, 0, 0, 1, 1,
0.553942, -0.06606872, 1.765303, 1, 1, 1, 1, 1,
0.556416, 0.1572298, 0.8043076, 1, 1, 1, 1, 1,
0.5589696, 1.832068, 0.0762989, 1, 1, 1, 1, 1,
0.5594566, 0.383209, 0.461666, 1, 1, 1, 1, 1,
0.5618801, -1.096831, 3.121706, 1, 1, 1, 1, 1,
0.5662312, 0.7252129, 1.208923, 1, 1, 1, 1, 1,
0.5665668, 0.3007736, 0.7196308, 1, 1, 1, 1, 1,
0.5685589, -0.899233, 4.664758, 1, 1, 1, 1, 1,
0.570428, 1.04528, 2.778111, 1, 1, 1, 1, 1,
0.5716882, 0.6198148, 0.05389243, 1, 1, 1, 1, 1,
0.5717058, 1.723851, 0.9017834, 1, 1, 1, 1, 1,
0.5733917, -0.2191302, 1.477183, 1, 1, 1, 1, 1,
0.581005, 0.5554503, 0.5886089, 1, 1, 1, 1, 1,
0.5899801, -1.024862, 2.976795, 1, 1, 1, 1, 1,
0.5904323, 0.005730133, 0.5936253, 1, 1, 1, 1, 1,
0.5920023, 0.2094867, 1.549129, 0, 0, 1, 1, 1,
0.5932241, -0.3605477, 2.23674, 1, 0, 0, 1, 1,
0.5974293, -0.8287951, 4.109275, 1, 0, 0, 1, 1,
0.5981044, 2.520055, 1.456222, 1, 0, 0, 1, 1,
0.6005261, -0.3159214, 2.212087, 1, 0, 0, 1, 1,
0.614616, 1.601024, 1.3459, 1, 0, 0, 1, 1,
0.6148121, -0.4956487, 2.307131, 0, 0, 0, 1, 1,
0.6151971, -0.4507029, 1.758079, 0, 0, 0, 1, 1,
0.6161268, 1.225489, -0.1250555, 0, 0, 0, 1, 1,
0.6162434, -0.8560029, 2.750556, 0, 0, 0, 1, 1,
0.6263514, 0.4004115, 1.17909, 0, 0, 0, 1, 1,
0.6265605, 0.6914523, 0.8740457, 0, 0, 0, 1, 1,
0.6272954, 1.259947, 0.002483362, 0, 0, 0, 1, 1,
0.6324521, -1.237406, 2.468496, 1, 1, 1, 1, 1,
0.6332292, 0.6745868, 0.972738, 1, 1, 1, 1, 1,
0.6333874, -0.3230455, 2.782616, 1, 1, 1, 1, 1,
0.6353216, -0.731213, 3.395744, 1, 1, 1, 1, 1,
0.6389318, -0.9974089, 2.503503, 1, 1, 1, 1, 1,
0.639005, 1.155801, 0.9771625, 1, 1, 1, 1, 1,
0.6423301, -0.1360909, 2.713057, 1, 1, 1, 1, 1,
0.6423672, 0.08388984, 1.744817, 1, 1, 1, 1, 1,
0.6427113, 2.629702, 0.132466, 1, 1, 1, 1, 1,
0.6450349, -0.5727359, 1.963883, 1, 1, 1, 1, 1,
0.6459996, 1.34427, 0.5239728, 1, 1, 1, 1, 1,
0.6461757, 0.2519899, 1.373651, 1, 1, 1, 1, 1,
0.6506197, 0.3963318, -0.01872377, 1, 1, 1, 1, 1,
0.6506863, -0.6768942, 2.967034, 1, 1, 1, 1, 1,
0.6515715, 0.4846289, 0.715449, 1, 1, 1, 1, 1,
0.6519756, 1.971549, -0.8523573, 0, 0, 1, 1, 1,
0.6534705, -1.980644, 0.4192468, 1, 0, 0, 1, 1,
0.6540798, -0.623082, 1.622422, 1, 0, 0, 1, 1,
0.6550713, 0.5892746, 0.06806743, 1, 0, 0, 1, 1,
0.6592143, -0.2429204, 3.290894, 1, 0, 0, 1, 1,
0.6603165, -0.4199554, 2.503848, 1, 0, 0, 1, 1,
0.6632432, 0.1442387, 1.917297, 0, 0, 0, 1, 1,
0.6646467, -0.3280428, 2.063577, 0, 0, 0, 1, 1,
0.6657967, 1.088491, 1.417518, 0, 0, 0, 1, 1,
0.6738187, -0.9738775, -0.06192405, 0, 0, 0, 1, 1,
0.6773247, -2.134182, 2.574829, 0, 0, 0, 1, 1,
0.6798658, -0.7931662, 2.925614, 0, 0, 0, 1, 1,
0.6878563, 0.6831128, 1.932234, 0, 0, 0, 1, 1,
0.6907597, -0.3278561, 0.2070479, 1, 1, 1, 1, 1,
0.6921283, 1.090963, -2.148669, 1, 1, 1, 1, 1,
0.6922087, 0.2037675, 0.4618846, 1, 1, 1, 1, 1,
0.6975234, 0.5060438, 0.61786, 1, 1, 1, 1, 1,
0.6977282, -0.7726118, 1.064353, 1, 1, 1, 1, 1,
0.7064183, 0.1985544, -0.3170709, 1, 1, 1, 1, 1,
0.708993, -1.969276, 2.004703, 1, 1, 1, 1, 1,
0.710084, 0.09814021, 1.337589, 1, 1, 1, 1, 1,
0.7138147, 0.1243613, 2.051282, 1, 1, 1, 1, 1,
0.7169133, 0.5445271, 2.128024, 1, 1, 1, 1, 1,
0.7190931, 0.2345059, 1.480872, 1, 1, 1, 1, 1,
0.7196332, 0.493262, -0.2065299, 1, 1, 1, 1, 1,
0.7228991, 0.6483548, 1.033532, 1, 1, 1, 1, 1,
0.7291834, -1.36007, 1.740181, 1, 1, 1, 1, 1,
0.7301887, -0.1866066, 1.277352, 1, 1, 1, 1, 1,
0.731224, -0.988849, 2.695337, 0, 0, 1, 1, 1,
0.7312304, 0.1414892, 1.454355, 1, 0, 0, 1, 1,
0.7366303, -1.497657, 3.518881, 1, 0, 0, 1, 1,
0.7376819, 0.6752104, 2.191286, 1, 0, 0, 1, 1,
0.7391014, -0.8126, 2.913618, 1, 0, 0, 1, 1,
0.7423473, 0.5022991, -0.2184465, 1, 0, 0, 1, 1,
0.747942, -1.002853, 3.22999, 0, 0, 0, 1, 1,
0.7488697, -0.3981461, 2.058692, 0, 0, 0, 1, 1,
0.7677783, -0.1908403, 1.512886, 0, 0, 0, 1, 1,
0.7708014, 0.5111633, 1.287665, 0, 0, 0, 1, 1,
0.773241, -0.872952, 1.833352, 0, 0, 0, 1, 1,
0.7807112, -1.321853, 5.080231, 0, 0, 0, 1, 1,
0.7811393, 0.635585, 0.9518071, 0, 0, 0, 1, 1,
0.7971375, -1.010894, 2.489275, 1, 1, 1, 1, 1,
0.8000461, -0.1272347, -1.152308, 1, 1, 1, 1, 1,
0.804449, 0.1302077, 0.7289825, 1, 1, 1, 1, 1,
0.8058494, -0.06324507, -0.3989788, 1, 1, 1, 1, 1,
0.8066447, 0.08683112, 1.486133, 1, 1, 1, 1, 1,
0.8071976, -0.1354977, 2.516111, 1, 1, 1, 1, 1,
0.8139749, -0.356911, 1.626155, 1, 1, 1, 1, 1,
0.8167838, 0.7609673, 1.57679, 1, 1, 1, 1, 1,
0.8173164, -0.6502845, 4.874489, 1, 1, 1, 1, 1,
0.8183206, 0.2581709, 1.459569, 1, 1, 1, 1, 1,
0.8228961, 1.079391, -0.734551, 1, 1, 1, 1, 1,
0.8277155, 0.0002125137, 3.037107, 1, 1, 1, 1, 1,
0.82899, 0.8085434, 2.174639, 1, 1, 1, 1, 1,
0.8401767, 1.055905, 0.7002873, 1, 1, 1, 1, 1,
0.8439055, -0.5914919, 1.744137, 1, 1, 1, 1, 1,
0.84613, 2.396938, -0.7577484, 0, 0, 1, 1, 1,
0.8490078, 0.9341474, 2.162563, 1, 0, 0, 1, 1,
0.849393, -1.851741, 3.201529, 1, 0, 0, 1, 1,
0.8563874, -0.4177169, 4.19396, 1, 0, 0, 1, 1,
0.8594913, 0.3877752, 0.9056338, 1, 0, 0, 1, 1,
0.8617355, -0.1893954, 2.802525, 1, 0, 0, 1, 1,
0.8668001, 0.5968766, 0.4191183, 0, 0, 0, 1, 1,
0.8673967, -0.550219, 2.035899, 0, 0, 0, 1, 1,
0.8724982, -2.578856, 3.721901, 0, 0, 0, 1, 1,
0.8733304, -0.4280612, 1.540023, 0, 0, 0, 1, 1,
0.8742068, -1.331437, 1.954644, 0, 0, 0, 1, 1,
0.8805158, -0.6948564, 3.413993, 0, 0, 0, 1, 1,
0.8833488, 0.5296492, 1.094928, 0, 0, 0, 1, 1,
0.8849831, -1.876606, 2.543716, 1, 1, 1, 1, 1,
0.8907381, -0.4405634, 3.782868, 1, 1, 1, 1, 1,
0.8910523, -0.3123107, 3.027469, 1, 1, 1, 1, 1,
0.8923127, -1.624415, 1.958532, 1, 1, 1, 1, 1,
0.8935103, 0.5404045, 0.4043534, 1, 1, 1, 1, 1,
0.8947499, -1.796703, 3.063894, 1, 1, 1, 1, 1,
0.9079356, 1.369759, 0.9606126, 1, 1, 1, 1, 1,
0.9085232, 0.4887012, 3.665624, 1, 1, 1, 1, 1,
0.9095963, -1.176686, 3.443265, 1, 1, 1, 1, 1,
0.9099915, -0.3448451, 2.166151, 1, 1, 1, 1, 1,
0.9100541, 0.5356897, -0.3926472, 1, 1, 1, 1, 1,
0.9159741, -0.8105044, 1.747728, 1, 1, 1, 1, 1,
0.9411592, -0.009920516, 3.700719, 1, 1, 1, 1, 1,
0.9419113, 0.4911024, 0.953044, 1, 1, 1, 1, 1,
0.9571, 0.3126512, 0.1340214, 1, 1, 1, 1, 1,
0.9646865, 1.34697, 0.4272845, 0, 0, 1, 1, 1,
0.9657798, -0.7225099, 3.158418, 1, 0, 0, 1, 1,
0.9665177, -0.1236925, 2.708106, 1, 0, 0, 1, 1,
0.972317, 0.2792515, 1.355024, 1, 0, 0, 1, 1,
0.9741329, 0.167385, 0.4026984, 1, 0, 0, 1, 1,
0.9769204, -0.376174, 3.820548, 1, 0, 0, 1, 1,
0.9775277, -0.5813444, 0.6283082, 0, 0, 0, 1, 1,
0.9792022, 0.2665148, 1.79876, 0, 0, 0, 1, 1,
0.9822698, 1.883272, -0.7077309, 0, 0, 0, 1, 1,
0.9851701, -0.2011742, 0.7998355, 0, 0, 0, 1, 1,
0.9872634, -0.9456405, 2.560908, 0, 0, 0, 1, 1,
0.9888991, 0.2060477, 0.8105968, 0, 0, 0, 1, 1,
1.010897, 0.8081019, 0.04337711, 0, 0, 0, 1, 1,
1.011731, -1.0475, 1.720034, 1, 1, 1, 1, 1,
1.019917, -1.336746, 2.945682, 1, 1, 1, 1, 1,
1.021535, -0.3055622, 1.30096, 1, 1, 1, 1, 1,
1.027688, 0.5406008, -0.4722526, 1, 1, 1, 1, 1,
1.02776, -1.237903, 2.041323, 1, 1, 1, 1, 1,
1.029078, 0.04925778, 1.543191, 1, 1, 1, 1, 1,
1.030661, 0.7526615, -0.4598188, 1, 1, 1, 1, 1,
1.035406, -0.3469524, 2.725948, 1, 1, 1, 1, 1,
1.039198, 0.5581386, 1.253275, 1, 1, 1, 1, 1,
1.045241, 0.7171703, 1.358316, 1, 1, 1, 1, 1,
1.045549, 0.1971559, 1.760522, 1, 1, 1, 1, 1,
1.047262, -1.148414, 1.824937, 1, 1, 1, 1, 1,
1.06799, -0.4701265, 0.3749543, 1, 1, 1, 1, 1,
1.07329, 1.48978, -0.6656197, 1, 1, 1, 1, 1,
1.074547, 1.112268, 2.154337, 1, 1, 1, 1, 1,
1.076648, 0.6679678, 0.965228, 0, 0, 1, 1, 1,
1.083055, -0.02782216, 1.588489, 1, 0, 0, 1, 1,
1.094882, -0.88258, 2.371325, 1, 0, 0, 1, 1,
1.09698, 0.2455165, 1.640153, 1, 0, 0, 1, 1,
1.102973, 0.6659502, -0.1337095, 1, 0, 0, 1, 1,
1.107721, 0.2576905, -0.6117889, 1, 0, 0, 1, 1,
1.109259, -0.4258401, 2.543978, 0, 0, 0, 1, 1,
1.109514, -0.02678232, 0.1488976, 0, 0, 0, 1, 1,
1.112348, -0.004314961, 1.317003, 0, 0, 0, 1, 1,
1.113712, -0.1176145, 2.832624, 0, 0, 0, 1, 1,
1.119464, -1.157079, 1.710442, 0, 0, 0, 1, 1,
1.132907, 1.0957, 0.978797, 0, 0, 0, 1, 1,
1.133919, 1.723991, 0.2736041, 0, 0, 0, 1, 1,
1.136998, 0.1867349, 1.965927, 1, 1, 1, 1, 1,
1.139396, 0.1798893, -0.1984756, 1, 1, 1, 1, 1,
1.142514, -0.7462366, 2.340586, 1, 1, 1, 1, 1,
1.143032, 0.5494419, 1.58881, 1, 1, 1, 1, 1,
1.147192, -0.4667277, 1.625531, 1, 1, 1, 1, 1,
1.156764, -0.1929446, 2.379723, 1, 1, 1, 1, 1,
1.160967, -2.006598, 0.6585079, 1, 1, 1, 1, 1,
1.164142, 1.205096, 0.5134248, 1, 1, 1, 1, 1,
1.165894, -1.047984, 2.126245, 1, 1, 1, 1, 1,
1.170749, 0.660864, 0.6241093, 1, 1, 1, 1, 1,
1.176151, 0.5170289, 0.2504103, 1, 1, 1, 1, 1,
1.183384, 0.4055911, 3.706237, 1, 1, 1, 1, 1,
1.187527, 0.446959, 0.773303, 1, 1, 1, 1, 1,
1.201961, -0.03541809, 3.140578, 1, 1, 1, 1, 1,
1.206645, -0.2150553, 1.556435, 1, 1, 1, 1, 1,
1.209121, 1.406287, 0.6187469, 0, 0, 1, 1, 1,
1.213321, -0.892536, 2.695992, 1, 0, 0, 1, 1,
1.22082, -0.001282125, 2.57547, 1, 0, 0, 1, 1,
1.227768, 0.09715131, 1.634974, 1, 0, 0, 1, 1,
1.235878, -0.3826378, 1.714864, 1, 0, 0, 1, 1,
1.23869, -0.5421262, 0.7622539, 1, 0, 0, 1, 1,
1.250836, -0.6544604, 2.322055, 0, 0, 0, 1, 1,
1.254051, 0.181972, 1.728411, 0, 0, 0, 1, 1,
1.255084, 1.455674, 0.5036371, 0, 0, 0, 1, 1,
1.26078, -0.8958903, 2.650676, 0, 0, 0, 1, 1,
1.2642, 0.9831976, -0.07428858, 0, 0, 0, 1, 1,
1.266208, -0.6154357, 1.485502, 0, 0, 0, 1, 1,
1.267962, 0.1287588, 1.677882, 0, 0, 0, 1, 1,
1.275012, -0.3946992, 2.336756, 1, 1, 1, 1, 1,
1.282822, 1.669254, 1.043179, 1, 1, 1, 1, 1,
1.29253, 0.5709258, -0.07647315, 1, 1, 1, 1, 1,
1.302625, 1.016377, 1.776105, 1, 1, 1, 1, 1,
1.318449, 0.5729761, 1.286914, 1, 1, 1, 1, 1,
1.325931, 0.7394037, 0.3571428, 1, 1, 1, 1, 1,
1.336606, 0.3532609, 1.465014, 1, 1, 1, 1, 1,
1.346789, -0.8615613, 3.478892, 1, 1, 1, 1, 1,
1.347128, 1.478699, -0.6285551, 1, 1, 1, 1, 1,
1.363896, -0.4122473, 1.266795, 1, 1, 1, 1, 1,
1.370265, 1.123896, -0.4943469, 1, 1, 1, 1, 1,
1.376242, -0.1270228, 1.842803, 1, 1, 1, 1, 1,
1.384489, 0.9552373, 1.205278, 1, 1, 1, 1, 1,
1.388296, 0.9029921, 1.404271, 1, 1, 1, 1, 1,
1.388575, 0.2593242, 0.8041492, 1, 1, 1, 1, 1,
1.393924, -0.8521433, 1.591469, 0, 0, 1, 1, 1,
1.395804, -0.782523, 2.326155, 1, 0, 0, 1, 1,
1.396792, -0.2597449, 2.977266, 1, 0, 0, 1, 1,
1.402256, -0.9368004, 2.208508, 1, 0, 0, 1, 1,
1.415792, 0.9177904, 0.8834065, 1, 0, 0, 1, 1,
1.418149, -0.4786202, 3.784752, 1, 0, 0, 1, 1,
1.42391, -0.1046292, 0.1109881, 0, 0, 0, 1, 1,
1.42795, -0.4679767, 3.916965, 0, 0, 0, 1, 1,
1.448486, 1.018037, 1.496795, 0, 0, 0, 1, 1,
1.454556, 0.7466807, 2.967849, 0, 0, 0, 1, 1,
1.459388, 1.319136, 0.4262173, 0, 0, 0, 1, 1,
1.462305, -0.6666348, 3.947621, 0, 0, 0, 1, 1,
1.465799, -0.01796156, 2.878323, 0, 0, 0, 1, 1,
1.469135, -0.03625755, 0.2983397, 1, 1, 1, 1, 1,
1.469359, 1.597565, -0.4697651, 1, 1, 1, 1, 1,
1.474854, 1.511714, -0.01164579, 1, 1, 1, 1, 1,
1.487192, 0.6179954, 2.852025, 1, 1, 1, 1, 1,
1.503219, -2.605721, 2.261358, 1, 1, 1, 1, 1,
1.514918, 0.5788344, 1.086082, 1, 1, 1, 1, 1,
1.542271, 0.5322926, 2.164677, 1, 1, 1, 1, 1,
1.547097, 0.1776592, 1.185739, 1, 1, 1, 1, 1,
1.556397, 0.2615876, 1.443756, 1, 1, 1, 1, 1,
1.580256, -0.9959837, 2.8555, 1, 1, 1, 1, 1,
1.584868, -0.557794, 2.702731, 1, 1, 1, 1, 1,
1.607452, -1.655349, 3.09974, 1, 1, 1, 1, 1,
1.610231, -0.1688329, 2.46002, 1, 1, 1, 1, 1,
1.610391, 0.2594148, 2.666293, 1, 1, 1, 1, 1,
1.63016, 1.001427, 1.553317, 1, 1, 1, 1, 1,
1.640462, 0.372476, 1.453599, 0, 0, 1, 1, 1,
1.643857, 0.2621633, 1.435692, 1, 0, 0, 1, 1,
1.654901, 0.985094, 3.106277, 1, 0, 0, 1, 1,
1.663567, 0.2445536, -0.1706585, 1, 0, 0, 1, 1,
1.679474, -0.422938, 0.7722288, 1, 0, 0, 1, 1,
1.682977, 0.2739282, 1.113877, 1, 0, 0, 1, 1,
1.684114, -0.05676127, 0.3691898, 0, 0, 0, 1, 1,
1.69831, 1.73151, 0.1698667, 0, 0, 0, 1, 1,
1.701186, -0.7416638, 1.105755, 0, 0, 0, 1, 1,
1.709108, -0.3533745, 2.792092, 0, 0, 0, 1, 1,
1.71145, 2.321589, 0.4616876, 0, 0, 0, 1, 1,
1.715975, 0.4125029, -0.2250638, 0, 0, 0, 1, 1,
1.722588, 0.4337852, 1.587402, 0, 0, 0, 1, 1,
1.763086, 0.8299181, 2.646812, 1, 1, 1, 1, 1,
1.773151, 0.03307449, -0.06850725, 1, 1, 1, 1, 1,
1.78047, 0.7544489, -0.04884681, 1, 1, 1, 1, 1,
1.791334, 0.1029233, 0.4906124, 1, 1, 1, 1, 1,
1.813696, 0.4917894, 1.78714, 1, 1, 1, 1, 1,
1.851754, -0.1260454, 0.9652089, 1, 1, 1, 1, 1,
1.854534, 0.7719756, 1.552959, 1, 1, 1, 1, 1,
1.868971, -0.127919, 1.310903, 1, 1, 1, 1, 1,
1.89053, -0.06323028, 1.668563, 1, 1, 1, 1, 1,
1.901643, 0.7405286, 0.9493482, 1, 1, 1, 1, 1,
1.913705, -1.623673, 2.534125, 1, 1, 1, 1, 1,
1.930078, -0.7476071, 0.6260332, 1, 1, 1, 1, 1,
1.930931, -1.119551, 2.088653, 1, 1, 1, 1, 1,
1.954788, -0.7048898, -0.8476303, 1, 1, 1, 1, 1,
1.978817, 0.5874792, 0.8951043, 1, 1, 1, 1, 1,
2.001796, 0.4377782, -0.2791303, 0, 0, 1, 1, 1,
2.066156, -2.058261, 2.95854, 1, 0, 0, 1, 1,
2.068467, -1.102676, 1.659747, 1, 0, 0, 1, 1,
2.102136, 0.6102178, 1.239804, 1, 0, 0, 1, 1,
2.113069, 1.092761, 1.867304, 1, 0, 0, 1, 1,
2.148641, 2.457291, 0.07024187, 1, 0, 0, 1, 1,
2.207369, 0.8834625, 1.233575, 0, 0, 0, 1, 1,
2.244592, 0.3821485, -0.1057254, 0, 0, 0, 1, 1,
2.266508, -1.248919, 2.632576, 0, 0, 0, 1, 1,
2.312448, -0.916415, 1.144805, 0, 0, 0, 1, 1,
2.320371, 0.8789709, -0.4465, 0, 0, 0, 1, 1,
2.339379, -0.4357955, 3.168111, 0, 0, 0, 1, 1,
2.343144, -0.6964519, 2.491872, 0, 0, 0, 1, 1,
2.406896, 1.057807, 1.681426, 1, 1, 1, 1, 1,
2.428353, 0.06237246, 1.169568, 1, 1, 1, 1, 1,
2.510079, -0.04982018, 1.581305, 1, 1, 1, 1, 1,
2.527223, 1.046743, 0.08341237, 1, 1, 1, 1, 1,
2.535864, 0.08783765, 2.307159, 1, 1, 1, 1, 1,
2.750522, 2.075006, 0.5930396, 1, 1, 1, 1, 1,
2.811084, -1.150111, 2.610764, 1, 1, 1, 1, 1
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
var radius = 9.605991;
var distance = 33.74064;
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
mvMatrix.translate( 0.2165028, -0.2659301, 0.06101656 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74064);
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
