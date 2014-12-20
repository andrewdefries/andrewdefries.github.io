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
-3.454058, -0.677435, -1.624549, 1, 0, 0, 1,
-3.118812, 0.4427069, -1.244646, 1, 0.007843138, 0, 1,
-2.815199, 0.2897355, -0.9529086, 1, 0.01176471, 0, 1,
-2.774045, -0.05818228, -1.964758, 1, 0.01960784, 0, 1,
-2.725498, 1.213033, -2.67806, 1, 0.02352941, 0, 1,
-2.416349, -0.930872, -1.974001, 1, 0.03137255, 0, 1,
-2.327655, 0.1750751, -0.5060274, 1, 0.03529412, 0, 1,
-2.303188, 0.2549552, -0.5589007, 1, 0.04313726, 0, 1,
-2.28823, -0.6590653, -2.131358, 1, 0.04705882, 0, 1,
-2.287542, 0.2414761, 0.001530614, 1, 0.05490196, 0, 1,
-2.263399, 0.4485881, -0.6580878, 1, 0.05882353, 0, 1,
-2.261305, 0.873882, -1.388985, 1, 0.06666667, 0, 1,
-2.24033, -0.1521499, -1.621313, 1, 0.07058824, 0, 1,
-2.227806, -1.758741, -4.323799, 1, 0.07843138, 0, 1,
-2.216745, 0.6192635, -0.1811178, 1, 0.08235294, 0, 1,
-2.169516, 0.6469442, -0.1716879, 1, 0.09019608, 0, 1,
-2.074311, -0.9086307, -1.821474, 1, 0.09411765, 0, 1,
-2.046723, -0.8184357, -1.206106, 1, 0.1019608, 0, 1,
-2.0136, 1.445275, -3.56125, 1, 0.1098039, 0, 1,
-2.006764, -0.5339373, -1.942661, 1, 0.1137255, 0, 1,
-2.002883, -0.465168, -4.114498, 1, 0.1215686, 0, 1,
-1.993354, 2.138324, 0.4841574, 1, 0.1254902, 0, 1,
-1.963205, 1.468877, -1.448304, 1, 0.1333333, 0, 1,
-1.951278, -1.140958, -3.143591, 1, 0.1372549, 0, 1,
-1.93348, 0.01234259, -3.483793, 1, 0.145098, 0, 1,
-1.914967, -0.5064011, -1.705389, 1, 0.1490196, 0, 1,
-1.898432, -1.322898, -2.432704, 1, 0.1568628, 0, 1,
-1.898111, 1.429176, -0.4758724, 1, 0.1607843, 0, 1,
-1.889792, 1.728911, -1.886354, 1, 0.1686275, 0, 1,
-1.874954, 0.6293049, -1.019072, 1, 0.172549, 0, 1,
-1.857761, -0.7945114, -2.816422, 1, 0.1803922, 0, 1,
-1.830204, 0.09416765, -1.975078, 1, 0.1843137, 0, 1,
-1.816679, 1.150745, -0.5643924, 1, 0.1921569, 0, 1,
-1.770337, 0.05785149, -0.8098236, 1, 0.1960784, 0, 1,
-1.769727, -0.60435, -0.2687699, 1, 0.2039216, 0, 1,
-1.755523, -3.34516, -2.34062, 1, 0.2117647, 0, 1,
-1.748803, 0.3648364, -0.581349, 1, 0.2156863, 0, 1,
-1.744977, 1.693853, -1.260753, 1, 0.2235294, 0, 1,
-1.740236, 0.6625975, 0.5658135, 1, 0.227451, 0, 1,
-1.730833, 1.05182, -2.971265, 1, 0.2352941, 0, 1,
-1.698081, 0.4473826, -2.041672, 1, 0.2392157, 0, 1,
-1.684581, -0.5450126, -2.160415, 1, 0.2470588, 0, 1,
-1.641602, -2.501006, -3.491827, 1, 0.2509804, 0, 1,
-1.62657, -1.447444, -1.31479, 1, 0.2588235, 0, 1,
-1.624039, 0.9298726, -1.058856, 1, 0.2627451, 0, 1,
-1.623501, 0.1368207, 0.2735516, 1, 0.2705882, 0, 1,
-1.610188, -0.1311159, -0.6416772, 1, 0.2745098, 0, 1,
-1.59868, 0.9672993, -0.2557126, 1, 0.282353, 0, 1,
-1.595882, -1.056544, -2.663457, 1, 0.2862745, 0, 1,
-1.582764, -0.8007858, -1.514083, 1, 0.2941177, 0, 1,
-1.571816, 0.2807064, 0.3858089, 1, 0.3019608, 0, 1,
-1.571803, -0.4134491, -2.538933, 1, 0.3058824, 0, 1,
-1.56173, -1.150965, -2.720444, 1, 0.3137255, 0, 1,
-1.555894, 2.296716, -1.128704, 1, 0.3176471, 0, 1,
-1.548788, -0.07478419, -1.322241, 1, 0.3254902, 0, 1,
-1.546023, -0.6029672, -2.032701, 1, 0.3294118, 0, 1,
-1.536759, -1.490777, -2.235257, 1, 0.3372549, 0, 1,
-1.534285, 0.06037181, -1.304525, 1, 0.3411765, 0, 1,
-1.524642, 1.021639, -0.8332796, 1, 0.3490196, 0, 1,
-1.521239, -2.140335, -2.573044, 1, 0.3529412, 0, 1,
-1.513609, 0.08419335, -1.925665, 1, 0.3607843, 0, 1,
-1.492744, 1.330064, -1.250414, 1, 0.3647059, 0, 1,
-1.489424, -1.482418, -1.31346, 1, 0.372549, 0, 1,
-1.480727, -0.7271838, -2.162696, 1, 0.3764706, 0, 1,
-1.469044, -0.2752163, -1.292348, 1, 0.3843137, 0, 1,
-1.465647, -1.455968, -3.004494, 1, 0.3882353, 0, 1,
-1.445777, 1.851633, -1.336017, 1, 0.3960784, 0, 1,
-1.444971, 0.628202, -0.507261, 1, 0.4039216, 0, 1,
-1.444048, 1.280589, -0.605921, 1, 0.4078431, 0, 1,
-1.4297, 0.2330888, -0.9567887, 1, 0.4156863, 0, 1,
-1.42499, 1.364911, -1.30844, 1, 0.4196078, 0, 1,
-1.423463, -0.279812, -3.070333, 1, 0.427451, 0, 1,
-1.403905, 1.297102, -2.612475, 1, 0.4313726, 0, 1,
-1.401144, 1.001566, -0.3491189, 1, 0.4392157, 0, 1,
-1.38625, -1.134583, -0.227262, 1, 0.4431373, 0, 1,
-1.3722, 1.96855, -1.743605, 1, 0.4509804, 0, 1,
-1.355049, 2.462752, -0.1844833, 1, 0.454902, 0, 1,
-1.35197, 0.242499, -1.297478, 1, 0.4627451, 0, 1,
-1.347357, -0.3353752, -1.478375, 1, 0.4666667, 0, 1,
-1.34117, 0.5566739, -1.875847, 1, 0.4745098, 0, 1,
-1.33842, -0.9657236, -1.321993, 1, 0.4784314, 0, 1,
-1.336527, 0.1893215, -0.5281066, 1, 0.4862745, 0, 1,
-1.327808, 0.09066515, -2.903017, 1, 0.4901961, 0, 1,
-1.317925, -0.3600298, -0.5081477, 1, 0.4980392, 0, 1,
-1.312332, 1.358017, -2.769533, 1, 0.5058824, 0, 1,
-1.292468, 0.8335925, -0.9725201, 1, 0.509804, 0, 1,
-1.288235, -0.1053178, -1.399116, 1, 0.5176471, 0, 1,
-1.282496, -0.05932175, -2.527984, 1, 0.5215687, 0, 1,
-1.281829, -2.057798, -1.879436, 1, 0.5294118, 0, 1,
-1.276503, -1.775074, -1.338794, 1, 0.5333334, 0, 1,
-1.27539, -1.281679, -3.344642, 1, 0.5411765, 0, 1,
-1.27442, 1.12569, -2.03646, 1, 0.5450981, 0, 1,
-1.271346, 1.143317, -0.5844922, 1, 0.5529412, 0, 1,
-1.265812, 0.2200951, -2.291611, 1, 0.5568628, 0, 1,
-1.262973, 1.225856, 0.03654768, 1, 0.5647059, 0, 1,
-1.255762, -0.5025832, -0.1447048, 1, 0.5686275, 0, 1,
-1.252735, 0.03492166, -2.014414, 1, 0.5764706, 0, 1,
-1.252574, 0.3490912, -0.4727769, 1, 0.5803922, 0, 1,
-1.250479, 0.9896981, -1.029931, 1, 0.5882353, 0, 1,
-1.242358, -0.8909811, -2.915501, 1, 0.5921569, 0, 1,
-1.234926, -2.666737, -1.991874, 1, 0.6, 0, 1,
-1.231628, -1.778731, -4.197375, 1, 0.6078432, 0, 1,
-1.227714, -1.21259, -1.747661, 1, 0.6117647, 0, 1,
-1.225701, -1.33576, -3.450494, 1, 0.6196079, 0, 1,
-1.213486, -0.9887549, -0.9810746, 1, 0.6235294, 0, 1,
-1.212351, 0.7802603, 0.8813664, 1, 0.6313726, 0, 1,
-1.209196, -0.9239241, -1.444898, 1, 0.6352941, 0, 1,
-1.207134, -0.9411389, -2.107155, 1, 0.6431373, 0, 1,
-1.204569, -0.04795791, -1.676343, 1, 0.6470588, 0, 1,
-1.198642, 0.5532946, -1.082064, 1, 0.654902, 0, 1,
-1.198514, -2.266311, -1.226346, 1, 0.6588235, 0, 1,
-1.194085, 0.3077924, -0.9763734, 1, 0.6666667, 0, 1,
-1.187507, 0.8691838, -1.15532, 1, 0.6705883, 0, 1,
-1.185862, -1.784986, -3.605974, 1, 0.6784314, 0, 1,
-1.184622, 0.2478247, -2.011358, 1, 0.682353, 0, 1,
-1.180802, -0.3165808, -3.24591, 1, 0.6901961, 0, 1,
-1.17855, -0.7710788, -3.155684, 1, 0.6941177, 0, 1,
-1.175382, 0.4518892, -0.7762573, 1, 0.7019608, 0, 1,
-1.173026, 0.8342565, -0.2474097, 1, 0.7098039, 0, 1,
-1.160168, -0.8765626, -1.486732, 1, 0.7137255, 0, 1,
-1.15734, 0.4360155, -1.171774, 1, 0.7215686, 0, 1,
-1.150842, -0.7511902, -3.510854, 1, 0.7254902, 0, 1,
-1.141655, -0.4688087, -2.631348, 1, 0.7333333, 0, 1,
-1.138417, -1.913163, -1.694761, 1, 0.7372549, 0, 1,
-1.137657, 1.240911, 0.8254859, 1, 0.7450981, 0, 1,
-1.122416, 0.09998663, -1.53433, 1, 0.7490196, 0, 1,
-1.113291, 0.395086, -0.209119, 1, 0.7568628, 0, 1,
-1.100377, -1.377179, -3.308728, 1, 0.7607843, 0, 1,
-1.095476, -0.636367, -1.944115, 1, 0.7686275, 0, 1,
-1.094101, 0.695057, 0.2847287, 1, 0.772549, 0, 1,
-1.090117, 0.3321135, 0.07230511, 1, 0.7803922, 0, 1,
-1.085464, 1.888534, 0.3692443, 1, 0.7843137, 0, 1,
-1.084565, 0.3623329, -2.080027, 1, 0.7921569, 0, 1,
-1.079481, 0.02411668, -1.823061, 1, 0.7960784, 0, 1,
-1.07723, 0.2199555, -0.5938145, 1, 0.8039216, 0, 1,
-1.076254, 0.2110861, -0.6890266, 1, 0.8117647, 0, 1,
-1.071039, -1.811503, -2.62517, 1, 0.8156863, 0, 1,
-1.069734, 0.6686759, -1.025735, 1, 0.8235294, 0, 1,
-1.049423, 1.171326, -0.1086831, 1, 0.827451, 0, 1,
-1.044769, -0.2947786, -2.701463, 1, 0.8352941, 0, 1,
-1.044263, -2.799741, -3.151228, 1, 0.8392157, 0, 1,
-1.035762, 0.6862513, 0.7394059, 1, 0.8470588, 0, 1,
-1.030051, 0.1431361, -1.271296, 1, 0.8509804, 0, 1,
-1.027002, -0.1844307, -1.486226, 1, 0.8588235, 0, 1,
-1.023142, -0.4151665, -3.443569, 1, 0.8627451, 0, 1,
-1.018969, -0.5151395, -1.119551, 1, 0.8705882, 0, 1,
-1.018629, -0.2136404, -2.167506, 1, 0.8745098, 0, 1,
-1.016899, -0.7136257, -2.421815, 1, 0.8823529, 0, 1,
-1.007222, 0.3984495, -1.118387, 1, 0.8862745, 0, 1,
-1.00105, 1.077278, 1.322284, 1, 0.8941177, 0, 1,
-0.9885989, 1.167846, 0.4482122, 1, 0.8980392, 0, 1,
-0.9885365, 0.4710883, -0.5155122, 1, 0.9058824, 0, 1,
-0.988444, -0.9690226, -2.222278, 1, 0.9137255, 0, 1,
-0.9807837, -0.8070372, -1.98469, 1, 0.9176471, 0, 1,
-0.9804691, 0.2723294, 0.5495079, 1, 0.9254902, 0, 1,
-0.9795144, 0.2059576, -2.412124, 1, 0.9294118, 0, 1,
-0.9770778, -0.6931566, -2.678302, 1, 0.9372549, 0, 1,
-0.9725473, 0.2721395, -1.207449, 1, 0.9411765, 0, 1,
-0.9679465, 1.314314, 0.6611748, 1, 0.9490196, 0, 1,
-0.9676876, -1.603796, -3.674653, 1, 0.9529412, 0, 1,
-0.9640147, 1.176227, -1.32273, 1, 0.9607843, 0, 1,
-0.9626765, 0.6389629, 0.1449715, 1, 0.9647059, 0, 1,
-0.9554089, -1.346393, -3.242258, 1, 0.972549, 0, 1,
-0.9539255, -0.3192359, -1.868107, 1, 0.9764706, 0, 1,
-0.9513559, -0.3425982, -2.934464, 1, 0.9843137, 0, 1,
-0.9479294, -0.3617433, -0.6810895, 1, 0.9882353, 0, 1,
-0.9229451, 0.1331037, -0.986636, 1, 0.9960784, 0, 1,
-0.9203191, -0.8467643, -2.46511, 0.9960784, 1, 0, 1,
-0.9164721, 2.013919, -1.72111, 0.9921569, 1, 0, 1,
-0.9146338, -0.6298279, -0.9108241, 0.9843137, 1, 0, 1,
-0.9126478, -0.3571562, -1.85334, 0.9803922, 1, 0, 1,
-0.9091247, -1.644322, -3.275291, 0.972549, 1, 0, 1,
-0.9024866, 0.5638767, -2.15911, 0.9686275, 1, 0, 1,
-0.9024712, 0.03243043, -1.662985, 0.9607843, 1, 0, 1,
-0.8927888, 0.3312208, -0.9790069, 0.9568627, 1, 0, 1,
-0.8911807, 1.428813, -0.9498439, 0.9490196, 1, 0, 1,
-0.8870414, -1.028315, -1.057159, 0.945098, 1, 0, 1,
-0.8820278, -1.611067, -2.187177, 0.9372549, 1, 0, 1,
-0.8812969, 1.609246, -0.5623067, 0.9333333, 1, 0, 1,
-0.8812218, 1.054249, -0.6964896, 0.9254902, 1, 0, 1,
-0.8811319, 0.6907018, -0.4088472, 0.9215686, 1, 0, 1,
-0.871914, 0.2117183, -1.652478, 0.9137255, 1, 0, 1,
-0.8691639, 0.6130566, -0.4782296, 0.9098039, 1, 0, 1,
-0.8671447, -0.2480679, -0.03135362, 0.9019608, 1, 0, 1,
-0.8608822, 1.26451, -2.443987, 0.8941177, 1, 0, 1,
-0.8563322, 1.458147, -1.526962, 0.8901961, 1, 0, 1,
-0.8553004, -0.5392304, -1.913813, 0.8823529, 1, 0, 1,
-0.852779, 1.712211, -1.420079, 0.8784314, 1, 0, 1,
-0.851586, 0.8546108, -1.188213, 0.8705882, 1, 0, 1,
-0.8493605, -0.2011542, -4.035766, 0.8666667, 1, 0, 1,
-0.8489557, 1.158261, -0.3645713, 0.8588235, 1, 0, 1,
-0.8477085, 0.3617212, -0.8833016, 0.854902, 1, 0, 1,
-0.8411986, 0.4525876, -2.851159, 0.8470588, 1, 0, 1,
-0.8360487, -0.3834525, -1.729754, 0.8431373, 1, 0, 1,
-0.8340212, -0.1766423, -2.233606, 0.8352941, 1, 0, 1,
-0.8313677, -1.289069, -2.948258, 0.8313726, 1, 0, 1,
-0.8279333, -2.320192, -3.627383, 0.8235294, 1, 0, 1,
-0.8233512, -0.08943338, -2.279186, 0.8196079, 1, 0, 1,
-0.821575, 1.48919, -0.8327975, 0.8117647, 1, 0, 1,
-0.8207635, -0.2556877, -1.693064, 0.8078431, 1, 0, 1,
-0.8138404, 0.996702, -1.308581, 0.8, 1, 0, 1,
-0.8108996, 0.9729534, 0.5668261, 0.7921569, 1, 0, 1,
-0.808642, 0.4591625, -0.7827348, 0.7882353, 1, 0, 1,
-0.8082402, 0.1556204, -0.7737358, 0.7803922, 1, 0, 1,
-0.8078791, 0.2377376, -0.9029245, 0.7764706, 1, 0, 1,
-0.8069329, -1.307957, -3.022825, 0.7686275, 1, 0, 1,
-0.8040164, 0.414003, -1.588926, 0.7647059, 1, 0, 1,
-0.8016381, 1.493923, -0.6951963, 0.7568628, 1, 0, 1,
-0.799484, -0.9901167, -3.721172, 0.7529412, 1, 0, 1,
-0.7913644, -0.6304006, -2.18294, 0.7450981, 1, 0, 1,
-0.7905631, -0.4665654, -3.40982, 0.7411765, 1, 0, 1,
-0.785014, 0.2799069, -1.067703, 0.7333333, 1, 0, 1,
-0.7761553, 0.8462424, -1.283466, 0.7294118, 1, 0, 1,
-0.7671215, -1.050883, -3.625442, 0.7215686, 1, 0, 1,
-0.7662001, 0.8087451, -2.020601, 0.7176471, 1, 0, 1,
-0.7618064, 0.2869144, -0.3569654, 0.7098039, 1, 0, 1,
-0.7582638, 0.7753644, -1.005472, 0.7058824, 1, 0, 1,
-0.7565783, -1.453425, -3.842363, 0.6980392, 1, 0, 1,
-0.7474104, 0.3663994, -0.3494726, 0.6901961, 1, 0, 1,
-0.7399553, -1.314965, -2.764562, 0.6862745, 1, 0, 1,
-0.7383751, 1.716423, -1.424295, 0.6784314, 1, 0, 1,
-0.7352788, -0.9799912, -1.492351, 0.6745098, 1, 0, 1,
-0.7313378, -1.604491, -0.9891597, 0.6666667, 1, 0, 1,
-0.7312934, -0.2275785, -0.6898901, 0.6627451, 1, 0, 1,
-0.727577, 0.6467521, -0.8275464, 0.654902, 1, 0, 1,
-0.7242315, 1.91726, -1.467366, 0.6509804, 1, 0, 1,
-0.7237823, 1.358436, 1.148987, 0.6431373, 1, 0, 1,
-0.7231382, -0.6136576, -1.018445, 0.6392157, 1, 0, 1,
-0.7206408, -2.088523, -2.548409, 0.6313726, 1, 0, 1,
-0.7164569, -1.611813, -3.593358, 0.627451, 1, 0, 1,
-0.7147413, 0.7056198, -0.4311224, 0.6196079, 1, 0, 1,
-0.7108423, 0.4829388, -2.783489, 0.6156863, 1, 0, 1,
-0.7104579, -0.7795081, -2.344913, 0.6078432, 1, 0, 1,
-0.7099084, 0.8559722, 0.1414007, 0.6039216, 1, 0, 1,
-0.7065713, -1.943936, -2.379571, 0.5960785, 1, 0, 1,
-0.6950583, 0.8365547, -1.101457, 0.5882353, 1, 0, 1,
-0.6819342, -0.8489498, -1.017488, 0.5843138, 1, 0, 1,
-0.6817495, -1.766056, -1.713081, 0.5764706, 1, 0, 1,
-0.6796346, 1.819461, 0.1974594, 0.572549, 1, 0, 1,
-0.6785926, -1.605875, -2.342904, 0.5647059, 1, 0, 1,
-0.6738117, 1.311751, 0.217129, 0.5607843, 1, 0, 1,
-0.6721133, 0.2535097, -4.854563, 0.5529412, 1, 0, 1,
-0.6675981, 0.002441931, -1.581349, 0.5490196, 1, 0, 1,
-0.6672667, -0.2781946, -4.210308, 0.5411765, 1, 0, 1,
-0.6632692, -2.024903, -2.306853, 0.5372549, 1, 0, 1,
-0.6621011, -0.5445561, -0.9787104, 0.5294118, 1, 0, 1,
-0.6600161, 0.2592075, -2.13564, 0.5254902, 1, 0, 1,
-0.6598693, -0.2129169, -2.152651, 0.5176471, 1, 0, 1,
-0.6577998, 0.325758, 0.3914849, 0.5137255, 1, 0, 1,
-0.6549, -1.726026, -2.354846, 0.5058824, 1, 0, 1,
-0.6541873, -0.1827268, -2.531985, 0.5019608, 1, 0, 1,
-0.6529632, 1.30376, -1.371854, 0.4941176, 1, 0, 1,
-0.6519036, -1.562015, -2.67895, 0.4862745, 1, 0, 1,
-0.6509854, -0.4600659, -5.451564, 0.4823529, 1, 0, 1,
-0.6503863, 0.9576408, 0.6648329, 0.4745098, 1, 0, 1,
-0.6452918, -0.3965606, -3.379395, 0.4705882, 1, 0, 1,
-0.6441466, 0.1180361, -1.416587, 0.4627451, 1, 0, 1,
-0.6388299, -1.228743, -2.108609, 0.4588235, 1, 0, 1,
-0.634461, 1.112187, -0.8362952, 0.4509804, 1, 0, 1,
-0.6213284, -0.04604727, -0.3586034, 0.4470588, 1, 0, 1,
-0.619519, 0.5036855, -1.077671, 0.4392157, 1, 0, 1,
-0.6182434, -0.3084714, -3.68573, 0.4352941, 1, 0, 1,
-0.6172172, 0.8124204, -1.05155, 0.427451, 1, 0, 1,
-0.6104897, 1.813549, 0.06867106, 0.4235294, 1, 0, 1,
-0.6074461, -1.197542, -2.435233, 0.4156863, 1, 0, 1,
-0.6057642, -0.1478482, -2.325175, 0.4117647, 1, 0, 1,
-0.603568, 0.7329483, -1.825032, 0.4039216, 1, 0, 1,
-0.6004747, -0.9845591, -2.292783, 0.3960784, 1, 0, 1,
-0.5997725, 1.275098, 0.5404373, 0.3921569, 1, 0, 1,
-0.5880107, 1.516279, 0.1577908, 0.3843137, 1, 0, 1,
-0.586383, -1.136078, -0.9671671, 0.3803922, 1, 0, 1,
-0.5822055, -0.097621, -2.807443, 0.372549, 1, 0, 1,
-0.5818206, 0.199484, -0.5899463, 0.3686275, 1, 0, 1,
-0.5815364, 0.2097228, -0.9692781, 0.3607843, 1, 0, 1,
-0.5797917, -0.3316197, -1.770836, 0.3568628, 1, 0, 1,
-0.5797895, 1.680414, -0.07342339, 0.3490196, 1, 0, 1,
-0.5793045, 1.38994, -0.5308077, 0.345098, 1, 0, 1,
-0.5780165, -0.09465608, -2.882837, 0.3372549, 1, 0, 1,
-0.5770814, -0.2281067, -2.778578, 0.3333333, 1, 0, 1,
-0.5765043, 0.859833, -0.767212, 0.3254902, 1, 0, 1,
-0.5736635, -0.4673236, -3.542261, 0.3215686, 1, 0, 1,
-0.5707569, -0.8230552, -2.091771, 0.3137255, 1, 0, 1,
-0.570283, 0.2718154, -1.225052, 0.3098039, 1, 0, 1,
-0.5599828, -0.2954627, -1.680889, 0.3019608, 1, 0, 1,
-0.5595958, 0.3713208, -1.133886, 0.2941177, 1, 0, 1,
-0.5595175, -0.2794159, -3.280161, 0.2901961, 1, 0, 1,
-0.5527601, 0.4373705, -0.5992488, 0.282353, 1, 0, 1,
-0.5469455, 0.02481637, -2.37842, 0.2784314, 1, 0, 1,
-0.5461029, 1.340004, -1.768839, 0.2705882, 1, 0, 1,
-0.5428132, -0.5314403, -2.711937, 0.2666667, 1, 0, 1,
-0.5380365, -0.5244312, -0.04470149, 0.2588235, 1, 0, 1,
-0.5341884, 0.6194512, -0.8568889, 0.254902, 1, 0, 1,
-0.5325173, -1.453544, -3.219085, 0.2470588, 1, 0, 1,
-0.5321055, -0.5022628, -1.758493, 0.2431373, 1, 0, 1,
-0.531324, 0.5198514, -0.4941433, 0.2352941, 1, 0, 1,
-0.5313057, 1.035386, -2.359055, 0.2313726, 1, 0, 1,
-0.5267747, -0.7297333, -2.239736, 0.2235294, 1, 0, 1,
-0.5267264, 0.4159475, -0.6653132, 0.2196078, 1, 0, 1,
-0.5204229, -0.1926043, -2.573, 0.2117647, 1, 0, 1,
-0.5197234, 0.5743346, -1.900129, 0.2078431, 1, 0, 1,
-0.5193898, -1.223725, -2.532822, 0.2, 1, 0, 1,
-0.516167, 1.119934, -0.5407882, 0.1921569, 1, 0, 1,
-0.5128289, 0.7976834, -1.426643, 0.1882353, 1, 0, 1,
-0.5117891, -0.1966681, -2.874878, 0.1803922, 1, 0, 1,
-0.5117299, 0.6612648, 0.1892168, 0.1764706, 1, 0, 1,
-0.4997164, -0.07041775, -1.183067, 0.1686275, 1, 0, 1,
-0.4961076, 1.695599, -0.5929883, 0.1647059, 1, 0, 1,
-0.4907048, -0.2010968, -1.565837, 0.1568628, 1, 0, 1,
-0.4903014, -1.195199, -2.961365, 0.1529412, 1, 0, 1,
-0.4898589, -1.670938, -1.853966, 0.145098, 1, 0, 1,
-0.4878702, 1.884588, 0.4373992, 0.1411765, 1, 0, 1,
-0.4834808, 0.7585902, -0.5491031, 0.1333333, 1, 0, 1,
-0.4789468, 1.028923, -0.8641211, 0.1294118, 1, 0, 1,
-0.4768347, -0.08388551, -0.2576979, 0.1215686, 1, 0, 1,
-0.4742123, 0.8561974, -0.6565231, 0.1176471, 1, 0, 1,
-0.4713295, -0.5677517, -4.577059, 0.1098039, 1, 0, 1,
-0.4710546, -0.9640206, -2.087503, 0.1058824, 1, 0, 1,
-0.4695269, 1.029474, -0.0655354, 0.09803922, 1, 0, 1,
-0.4688304, 0.02369487, -1.657964, 0.09019608, 1, 0, 1,
-0.4682556, -0.8826378, -2.079235, 0.08627451, 1, 0, 1,
-0.4668273, 1.696581, 0.1004292, 0.07843138, 1, 0, 1,
-0.4666271, -0.7831035, -1.358007, 0.07450981, 1, 0, 1,
-0.4617177, 0.4516671, -0.2352688, 0.06666667, 1, 0, 1,
-0.4585913, -0.4363388, -3.240088, 0.0627451, 1, 0, 1,
-0.4531013, 0.2291858, -2.090687, 0.05490196, 1, 0, 1,
-0.4522911, -1.218707, -3.289973, 0.05098039, 1, 0, 1,
-0.4480892, 0.7338979, -2.074688, 0.04313726, 1, 0, 1,
-0.4428968, -0.2815061, -2.902075, 0.03921569, 1, 0, 1,
-0.4428097, -1.060081, -3.850424, 0.03137255, 1, 0, 1,
-0.442213, 0.6648714, -0.9285238, 0.02745098, 1, 0, 1,
-0.4411015, -0.2037206, -1.195839, 0.01960784, 1, 0, 1,
-0.4388084, -1.652313, -3.439302, 0.01568628, 1, 0, 1,
-0.438253, -0.8639379, -0.8131394, 0.007843138, 1, 0, 1,
-0.4351724, 1.483868, -1.70594, 0.003921569, 1, 0, 1,
-0.4339475, -1.474799, -1.931389, 0, 1, 0.003921569, 1,
-0.4320301, 0.02601301, -2.546192, 0, 1, 0.01176471, 1,
-0.4314627, 0.7197468, 0.01111543, 0, 1, 0.01568628, 1,
-0.4268214, -0.4143607, -2.333187, 0, 1, 0.02352941, 1,
-0.4235399, 0.9059588, 0.06407627, 0, 1, 0.02745098, 1,
-0.4209001, -0.5700336, -1.414023, 0, 1, 0.03529412, 1,
-0.4168587, 1.660342, 0.2436377, 0, 1, 0.03921569, 1,
-0.4149337, -0.2904081, -0.6856365, 0, 1, 0.04705882, 1,
-0.4113312, 0.5186246, -1.205345, 0, 1, 0.05098039, 1,
-0.4109379, 0.1480457, -2.976353, 0, 1, 0.05882353, 1,
-0.406757, 0.6875678, -0.7160665, 0, 1, 0.0627451, 1,
-0.4050801, 0.08802124, -2.069691, 0, 1, 0.07058824, 1,
-0.3951079, -0.225079, -4.087944, 0, 1, 0.07450981, 1,
-0.3903027, -0.6579258, -2.776816, 0, 1, 0.08235294, 1,
-0.3838488, -0.4607203, -2.196868, 0, 1, 0.08627451, 1,
-0.3823259, 0.1016856, -1.037772, 0, 1, 0.09411765, 1,
-0.3823093, 0.4096198, -1.574888, 0, 1, 0.1019608, 1,
-0.3805171, -0.1289753, -3.569576, 0, 1, 0.1058824, 1,
-0.3792142, 0.1356843, -0.9346446, 0, 1, 0.1137255, 1,
-0.3734892, -0.3127727, -2.377799, 0, 1, 0.1176471, 1,
-0.370951, -0.723119, -1.270346, 0, 1, 0.1254902, 1,
-0.3642928, -0.6881219, -2.75045, 0, 1, 0.1294118, 1,
-0.3611288, 0.5269597, 1.026141, 0, 1, 0.1372549, 1,
-0.3603348, -0.06439518, -1.913991, 0, 1, 0.1411765, 1,
-0.3562386, 1.444556, 0.6347138, 0, 1, 0.1490196, 1,
-0.35372, -0.04141461, -0.5243103, 0, 1, 0.1529412, 1,
-0.3492856, 0.6614723, -1.190581, 0, 1, 0.1607843, 1,
-0.3476948, -0.4533264, -2.457667, 0, 1, 0.1647059, 1,
-0.3463356, 1.318978, -0.4690361, 0, 1, 0.172549, 1,
-0.3410354, 0.6655324, -0.2682356, 0, 1, 0.1764706, 1,
-0.3347067, 0.1778696, -1.203381, 0, 1, 0.1843137, 1,
-0.3318129, 0.2705432, -1.215391, 0, 1, 0.1882353, 1,
-0.3158818, 0.7899352, -0.1715087, 0, 1, 0.1960784, 1,
-0.3150983, 0.03797515, 0.366453, 0, 1, 0.2039216, 1,
-0.3123507, 0.461054, -0.03492924, 0, 1, 0.2078431, 1,
-0.3109896, 1.748376, 0.2142295, 0, 1, 0.2156863, 1,
-0.3099756, -0.987296, -1.991391, 0, 1, 0.2196078, 1,
-0.3084873, -0.1595406, -2.055844, 0, 1, 0.227451, 1,
-0.3074165, 0.9716939, 0.02688256, 0, 1, 0.2313726, 1,
-0.301234, 0.4699789, 0.6679845, 0, 1, 0.2392157, 1,
-0.2933636, -2.095438, -2.011644, 0, 1, 0.2431373, 1,
-0.2822401, -1.277676, -2.812623, 0, 1, 0.2509804, 1,
-0.2804963, -0.08204105, 0.1229211, 0, 1, 0.254902, 1,
-0.2757768, 0.03419747, -1.649843, 0, 1, 0.2627451, 1,
-0.2756813, -0.6172139, -4.657073, 0, 1, 0.2666667, 1,
-0.2731854, -0.8348652, -3.763505, 0, 1, 0.2745098, 1,
-0.2707987, 0.1302009, -1.572883, 0, 1, 0.2784314, 1,
-0.2694193, 1.085833, -2.305761, 0, 1, 0.2862745, 1,
-0.2610919, -0.1737858, -1.102273, 0, 1, 0.2901961, 1,
-0.2552614, -0.9060584, -2.509397, 0, 1, 0.2980392, 1,
-0.2552405, -0.4619265, -2.136081, 0, 1, 0.3058824, 1,
-0.2532517, -0.2853646, -2.113312, 0, 1, 0.3098039, 1,
-0.250478, 1.00126, -0.8404722, 0, 1, 0.3176471, 1,
-0.2501009, -0.2546206, -3.672077, 0, 1, 0.3215686, 1,
-0.2486981, -0.2034286, -3.111247, 0, 1, 0.3294118, 1,
-0.2393928, 0.2856693, -0.5455377, 0, 1, 0.3333333, 1,
-0.2385951, 0.7260506, 0.8769687, 0, 1, 0.3411765, 1,
-0.234541, -0.7624516, -3.445188, 0, 1, 0.345098, 1,
-0.2330789, -0.8687388, -2.44716, 0, 1, 0.3529412, 1,
-0.2319147, -0.7491434, -2.41282, 0, 1, 0.3568628, 1,
-0.225926, -0.2713995, -3.121476, 0, 1, 0.3647059, 1,
-0.2234314, 1.213362, -1.414103, 0, 1, 0.3686275, 1,
-0.220118, 0.6329493, -0.6773452, 0, 1, 0.3764706, 1,
-0.2164551, 0.885041, -0.454084, 0, 1, 0.3803922, 1,
-0.2159318, 1.874385, -0.2479172, 0, 1, 0.3882353, 1,
-0.2136555, 0.4581823, -1.152851, 0, 1, 0.3921569, 1,
-0.2087657, -1.794348, -3.721372, 0, 1, 0.4, 1,
-0.2039848, 0.1418187, -2.151927, 0, 1, 0.4078431, 1,
-0.1976059, 0.8004625, 0.3777446, 0, 1, 0.4117647, 1,
-0.1961495, 0.5312703, -0.3588266, 0, 1, 0.4196078, 1,
-0.193223, -0.007295865, -0.0986205, 0, 1, 0.4235294, 1,
-0.1914429, 0.7583596, -1.419504, 0, 1, 0.4313726, 1,
-0.1892148, 0.1736735, -0.7568976, 0, 1, 0.4352941, 1,
-0.1891404, -0.8182178, -3.427389, 0, 1, 0.4431373, 1,
-0.1837826, -0.3845741, -3.500306, 0, 1, 0.4470588, 1,
-0.1827769, 0.03868422, 1.083214, 0, 1, 0.454902, 1,
-0.1822798, 1.307495, 1.913871, 0, 1, 0.4588235, 1,
-0.1781228, 0.1510991, -0.03268253, 0, 1, 0.4666667, 1,
-0.1765462, 0.5200274, -1.000583, 0, 1, 0.4705882, 1,
-0.1740121, -0.8715687, -3.173346, 0, 1, 0.4784314, 1,
-0.1734937, 0.176835, -3.087495, 0, 1, 0.4823529, 1,
-0.1702009, -0.2582333, -1.515244, 0, 1, 0.4901961, 1,
-0.1672788, 0.2394549, 1.409383, 0, 1, 0.4941176, 1,
-0.1615802, 0.3055992, -0.5006778, 0, 1, 0.5019608, 1,
-0.1590337, -0.1503266, -3.166093, 0, 1, 0.509804, 1,
-0.1560262, -0.2710602, -1.867808, 0, 1, 0.5137255, 1,
-0.150277, 0.5062872, 0.2907259, 0, 1, 0.5215687, 1,
-0.1460047, -0.01474503, -1.207541, 0, 1, 0.5254902, 1,
-0.1451267, 1.205612, 0.0328483, 0, 1, 0.5333334, 1,
-0.144364, -0.2981329, -2.564467, 0, 1, 0.5372549, 1,
-0.1418592, -0.3436078, -0.5171083, 0, 1, 0.5450981, 1,
-0.1360799, -0.8493279, -2.616148, 0, 1, 0.5490196, 1,
-0.1339605, 1.23317, -0.319147, 0, 1, 0.5568628, 1,
-0.1318866, 0.2452595, 0.4893851, 0, 1, 0.5607843, 1,
-0.124045, 0.1058511, -0.4938905, 0, 1, 0.5686275, 1,
-0.1208294, -0.8968872, -3.659476, 0, 1, 0.572549, 1,
-0.107863, -0.3881207, -3.263256, 0, 1, 0.5803922, 1,
-0.104479, 1.38656, -0.8654936, 0, 1, 0.5843138, 1,
-0.1006708, 0.2274453, 0.06519986, 0, 1, 0.5921569, 1,
-0.10014, -0.79601, -3.853022, 0, 1, 0.5960785, 1,
-0.09550267, -0.5973025, -1.888233, 0, 1, 0.6039216, 1,
-0.09093299, 0.5039106, 0.1721252, 0, 1, 0.6117647, 1,
-0.09009892, -0.8460088, -1.870581, 0, 1, 0.6156863, 1,
-0.08913542, -0.8899208, -4.079488, 0, 1, 0.6235294, 1,
-0.08770957, -1.16285, -5.103964, 0, 1, 0.627451, 1,
-0.08513092, 0.2392455, -1.63961, 0, 1, 0.6352941, 1,
-0.08511243, -0.120529, -2.792773, 0, 1, 0.6392157, 1,
-0.08426502, 1.130801, -0.9580902, 0, 1, 0.6470588, 1,
-0.07822425, 1.122416, -1.09322, 0, 1, 0.6509804, 1,
-0.07061936, 0.3586231, -0.02091195, 0, 1, 0.6588235, 1,
-0.06951179, 0.6693482, 0.0865702, 0, 1, 0.6627451, 1,
-0.06536477, -1.038489, -3.125526, 0, 1, 0.6705883, 1,
-0.06298668, -0.3001035, -2.811114, 0, 1, 0.6745098, 1,
-0.0605349, 0.2539817, -2.560794, 0, 1, 0.682353, 1,
-0.06041184, 0.3691512, 1.894177, 0, 1, 0.6862745, 1,
-0.05719945, 0.8961197, 0.1482259, 0, 1, 0.6941177, 1,
-0.05687107, 0.4557979, 0.4296394, 0, 1, 0.7019608, 1,
-0.05420127, -2.316258, -3.106817, 0, 1, 0.7058824, 1,
-0.04879842, 1.093122, 0.1038802, 0, 1, 0.7137255, 1,
-0.04791863, -2.546091, -0.1194604, 0, 1, 0.7176471, 1,
-0.0463642, -0.4493147, -3.44318, 0, 1, 0.7254902, 1,
-0.0390261, 1.103586, 1.820418, 0, 1, 0.7294118, 1,
-0.03385441, 1.075214, 0.9891141, 0, 1, 0.7372549, 1,
-0.03219878, -0.2180657, -1.30401, 0, 1, 0.7411765, 1,
-0.02988742, 0.02454478, -0.7582577, 0, 1, 0.7490196, 1,
-0.02475456, -0.005895579, -3.344339, 0, 1, 0.7529412, 1,
-0.02368607, -0.8243649, -3.434086, 0, 1, 0.7607843, 1,
-0.02141658, 0.2527688, -0.4343198, 0, 1, 0.7647059, 1,
-0.01960009, 1.034081, 1.407312, 0, 1, 0.772549, 1,
-0.0174329, 2.843327, -0.2611349, 0, 1, 0.7764706, 1,
-0.01557891, -0.6162481, -2.660074, 0, 1, 0.7843137, 1,
-0.01445711, -0.3714549, -3.124934, 0, 1, 0.7882353, 1,
-0.009618255, -0.4214233, -3.181686, 0, 1, 0.7960784, 1,
-0.006479472, -1.692262, -3.006756, 0, 1, 0.8039216, 1,
-0.00611338, 1.17954, 0.6416762, 0, 1, 0.8078431, 1,
-0.003056051, -0.4774351, -4.020743, 0, 1, 0.8156863, 1,
0.002222823, -0.5703568, 3.977142, 0, 1, 0.8196079, 1,
0.005474742, 1.100152, -0.2252936, 0, 1, 0.827451, 1,
0.006528421, 0.4118268, 0.2392031, 0, 1, 0.8313726, 1,
0.009058163, 1.333557, 1.23514, 0, 1, 0.8392157, 1,
0.009159509, 0.559019, 0.7870203, 0, 1, 0.8431373, 1,
0.01171134, 0.3166343, 0.2712855, 0, 1, 0.8509804, 1,
0.01395356, 1.823037, 0.2559208, 0, 1, 0.854902, 1,
0.0148627, 0.5456179, 0.8048401, 0, 1, 0.8627451, 1,
0.02148534, 0.857188, 0.6428564, 0, 1, 0.8666667, 1,
0.02250364, 0.9606141, -0.3381883, 0, 1, 0.8745098, 1,
0.02741436, 2.240657, 0.5578679, 0, 1, 0.8784314, 1,
0.02822406, 0.2731206, -0.2751622, 0, 1, 0.8862745, 1,
0.02833355, -0.4039456, 2.976083, 0, 1, 0.8901961, 1,
0.02901045, 0.1735026, 0.2109581, 0, 1, 0.8980392, 1,
0.0292295, -0.1779943, 3.957957, 0, 1, 0.9058824, 1,
0.03083282, -0.3980952, 3.301187, 0, 1, 0.9098039, 1,
0.03212047, 0.2357602, -0.3167264, 0, 1, 0.9176471, 1,
0.03410657, 0.291389, -0.3358132, 0, 1, 0.9215686, 1,
0.03433751, 0.3494129, -0.6153041, 0, 1, 0.9294118, 1,
0.03627703, -0.8347698, 3.801966, 0, 1, 0.9333333, 1,
0.03916612, 0.1280481, 0.6461803, 0, 1, 0.9411765, 1,
0.04143148, 0.6408297, -1.610616, 0, 1, 0.945098, 1,
0.04474078, 0.6498515, -0.7039602, 0, 1, 0.9529412, 1,
0.04624264, 0.9923227, 0.8391802, 0, 1, 0.9568627, 1,
0.05034601, -2.059357, 2.713515, 0, 1, 0.9647059, 1,
0.05589419, -0.2937942, 2.628037, 0, 1, 0.9686275, 1,
0.05812357, -0.2540222, 3.584028, 0, 1, 0.9764706, 1,
0.06228701, 0.1703296, 0.183405, 0, 1, 0.9803922, 1,
0.06482861, -0.6064569, 3.009453, 0, 1, 0.9882353, 1,
0.06652023, -0.3520936, 2.226065, 0, 1, 0.9921569, 1,
0.06984099, 1.920247, -1.21714, 0, 1, 1, 1,
0.07473435, 1.779977, -0.3185329, 0, 0.9921569, 1, 1,
0.07756519, 0.5903828, -1.960185, 0, 0.9882353, 1, 1,
0.07788217, 1.513425, 0.7247756, 0, 0.9803922, 1, 1,
0.08000523, 0.772553, 0.8719687, 0, 0.9764706, 1, 1,
0.08090331, -0.1033898, 4.091456, 0, 0.9686275, 1, 1,
0.0818939, 0.5920688, -1.189745, 0, 0.9647059, 1, 1,
0.08939887, -0.5156665, 2.844898, 0, 0.9568627, 1, 1,
0.09136477, -2.917868, 1.486144, 0, 0.9529412, 1, 1,
0.09159847, 0.8635502, -0.3795922, 0, 0.945098, 1, 1,
0.09404347, 0.8686865, 0.8320124, 0, 0.9411765, 1, 1,
0.09491714, -0.9760867, 2.903522, 0, 0.9333333, 1, 1,
0.09728967, -0.1477416, 1.227579, 0, 0.9294118, 1, 1,
0.09980422, 1.227424, -0.2416038, 0, 0.9215686, 1, 1,
0.1052189, 1.137987, -0.4354342, 0, 0.9176471, 1, 1,
0.1112586, 0.7235547, -0.1668955, 0, 0.9098039, 1, 1,
0.112086, -0.01512163, 1.03709, 0, 0.9058824, 1, 1,
0.1138552, 0.5948365, -0.6686463, 0, 0.8980392, 1, 1,
0.1149595, -0.8923709, 2.001827, 0, 0.8901961, 1, 1,
0.1170103, 0.5005787, 0.09322831, 0, 0.8862745, 1, 1,
0.1186239, 3.197395, 0.4716972, 0, 0.8784314, 1, 1,
0.1231026, -0.8025603, 2.115445, 0, 0.8745098, 1, 1,
0.1244826, -1.460349, 2.66626, 0, 0.8666667, 1, 1,
0.1258156, -0.1703233, 2.854049, 0, 0.8627451, 1, 1,
0.1271625, 3.757858, 0.1315978, 0, 0.854902, 1, 1,
0.1305077, -0.07657581, 4.771104, 0, 0.8509804, 1, 1,
0.1308802, 1.027697, 1.587606, 0, 0.8431373, 1, 1,
0.1324517, -1.625775, 2.472975, 0, 0.8392157, 1, 1,
0.1351607, 1.054286, 0.9166613, 0, 0.8313726, 1, 1,
0.1355052, 2.145487, 1.355848, 0, 0.827451, 1, 1,
0.1391634, 1.786873, -0.3293327, 0, 0.8196079, 1, 1,
0.139324, 0.7569923, 1.056007, 0, 0.8156863, 1, 1,
0.140557, 1.524259, -0.928337, 0, 0.8078431, 1, 1,
0.1409685, 0.4166521, -1.006328, 0, 0.8039216, 1, 1,
0.146947, 0.2304627, 0.6085286, 0, 0.7960784, 1, 1,
0.1481005, -0.7116559, 5.367996, 0, 0.7882353, 1, 1,
0.150324, 0.978918, -1.030392, 0, 0.7843137, 1, 1,
0.1522191, -0.7225431, 3.189944, 0, 0.7764706, 1, 1,
0.1566678, -0.26362, 0.8855097, 0, 0.772549, 1, 1,
0.1568575, -0.3207968, 1.640855, 0, 0.7647059, 1, 1,
0.1575147, 0.1092081, 1.760725, 0, 0.7607843, 1, 1,
0.1576453, 1.857259, -0.07629918, 0, 0.7529412, 1, 1,
0.159878, -0.9789788, 2.622712, 0, 0.7490196, 1, 1,
0.1603291, -0.4964021, 1.913319, 0, 0.7411765, 1, 1,
0.1612838, 1.41584, -0.05416633, 0, 0.7372549, 1, 1,
0.1702848, -0.1916499, 2.768883, 0, 0.7294118, 1, 1,
0.1704177, -0.3887147, 2.935588, 0, 0.7254902, 1, 1,
0.1715106, -1.308606, 3.102739, 0, 0.7176471, 1, 1,
0.1722363, -1.316301, 4.297194, 0, 0.7137255, 1, 1,
0.1746954, 0.2572422, -0.1229188, 0, 0.7058824, 1, 1,
0.1786919, 1.356227, 0.1115801, 0, 0.6980392, 1, 1,
0.1789226, -0.06376243, -0.01715496, 0, 0.6941177, 1, 1,
0.1799643, -2.563938, 2.372213, 0, 0.6862745, 1, 1,
0.1869972, 0.6753446, -0.07323367, 0, 0.682353, 1, 1,
0.1871033, -0.1763097, 3.273175, 0, 0.6745098, 1, 1,
0.1875385, -0.215335, 1.763419, 0, 0.6705883, 1, 1,
0.1886531, -0.941385, 4.552956, 0, 0.6627451, 1, 1,
0.1906321, -0.3989858, 3.824333, 0, 0.6588235, 1, 1,
0.1929294, 0.0299466, 0.3083563, 0, 0.6509804, 1, 1,
0.1954747, 0.9753059, 0.005507261, 0, 0.6470588, 1, 1,
0.1958203, -2.302967, 2.772664, 0, 0.6392157, 1, 1,
0.1985671, 0.2862251, 0.2216521, 0, 0.6352941, 1, 1,
0.198663, 0.08196983, 2.003495, 0, 0.627451, 1, 1,
0.2082542, -0.003658753, 1.81067, 0, 0.6235294, 1, 1,
0.2083238, -0.9375774, 2.673405, 0, 0.6156863, 1, 1,
0.2123353, 0.1973903, 0.3754212, 0, 0.6117647, 1, 1,
0.2137759, -0.8647477, 2.810974, 0, 0.6039216, 1, 1,
0.2142162, -1.895366, 3.735002, 0, 0.5960785, 1, 1,
0.2143131, -0.6651427, 2.181076, 0, 0.5921569, 1, 1,
0.217199, -1.511807, 2.420638, 0, 0.5843138, 1, 1,
0.2199786, -0.4187919, 2.223427, 0, 0.5803922, 1, 1,
0.2238606, 0.5600778, -0.3886653, 0, 0.572549, 1, 1,
0.2259804, 1.986462, 2.702626, 0, 0.5686275, 1, 1,
0.2267535, -0.5171382, 3.917886, 0, 0.5607843, 1, 1,
0.2269854, -1.93458, 3.818358, 0, 0.5568628, 1, 1,
0.2270966, -0.5790497, 3.362423, 0, 0.5490196, 1, 1,
0.2302094, -0.7639033, 3.59276, 0, 0.5450981, 1, 1,
0.2337177, 0.3217615, 0.7012843, 0, 0.5372549, 1, 1,
0.2397678, 0.582647, -0.6775786, 0, 0.5333334, 1, 1,
0.2404777, -0.191205, 2.437078, 0, 0.5254902, 1, 1,
0.2479936, -0.000258821, 0.4022586, 0, 0.5215687, 1, 1,
0.2485924, 2.09561, 2.121921, 0, 0.5137255, 1, 1,
0.2520665, -0.1948759, 1.159929, 0, 0.509804, 1, 1,
0.2543727, 0.3432081, 1.51172, 0, 0.5019608, 1, 1,
0.2556293, -1.326147, 3.282933, 0, 0.4941176, 1, 1,
0.256106, 0.852964, -1.229949, 0, 0.4901961, 1, 1,
0.2592978, -0.7886113, 3.114141, 0, 0.4823529, 1, 1,
0.2645789, -0.143926, 1.45233, 0, 0.4784314, 1, 1,
0.2655132, 1.21402, 1.004275, 0, 0.4705882, 1, 1,
0.2669646, 0.1987753, 1.557626, 0, 0.4666667, 1, 1,
0.2719965, -1.208213, 2.569549, 0, 0.4588235, 1, 1,
0.273868, 0.5461592, 0.1149768, 0, 0.454902, 1, 1,
0.2741391, 1.264869, 0.7856407, 0, 0.4470588, 1, 1,
0.2786525, -1.401003, 2.356447, 0, 0.4431373, 1, 1,
0.2790509, -1.406066, 3.356725, 0, 0.4352941, 1, 1,
0.2811999, 0.08818296, 0.2216862, 0, 0.4313726, 1, 1,
0.2832151, -1.71933, 0.9987808, 0, 0.4235294, 1, 1,
0.2862961, 1.403109, 1.459219, 0, 0.4196078, 1, 1,
0.2864686, 0.4714296, 0.2182602, 0, 0.4117647, 1, 1,
0.2882964, -0.386353, 3.75405, 0, 0.4078431, 1, 1,
0.2910292, -0.1055682, 2.168256, 0, 0.4, 1, 1,
0.2970609, -1.010865, 1.171263, 0, 0.3921569, 1, 1,
0.2973939, -1.169312, 2.161092, 0, 0.3882353, 1, 1,
0.297913, 0.1026125, 1.150762, 0, 0.3803922, 1, 1,
0.3023856, -0.0005752546, 0.2010188, 0, 0.3764706, 1, 1,
0.3030488, -0.5136154, 1.959001, 0, 0.3686275, 1, 1,
0.3106412, -1.104027, 4.306462, 0, 0.3647059, 1, 1,
0.311096, -0.87547, 2.434705, 0, 0.3568628, 1, 1,
0.3113663, -0.175045, 2.682978, 0, 0.3529412, 1, 1,
0.311517, -0.7696405, 3.570518, 0, 0.345098, 1, 1,
0.3136924, -0.3141615, 1.834596, 0, 0.3411765, 1, 1,
0.3153356, -2.21677, 3.228365, 0, 0.3333333, 1, 1,
0.3164184, 0.480399, -0.5880275, 0, 0.3294118, 1, 1,
0.3213202, 0.3382467, 0.8401028, 0, 0.3215686, 1, 1,
0.32276, -0.4177705, 2.882344, 0, 0.3176471, 1, 1,
0.3232471, -0.9147502, 2.015841, 0, 0.3098039, 1, 1,
0.330653, -1.832627, 1.504913, 0, 0.3058824, 1, 1,
0.3322099, 1.439294, 0.3606607, 0, 0.2980392, 1, 1,
0.3332564, -0.5237648, 2.405444, 0, 0.2901961, 1, 1,
0.334517, 1.026489, -1.230154, 0, 0.2862745, 1, 1,
0.3352138, -0.1022548, 0.3941635, 0, 0.2784314, 1, 1,
0.3423399, -0.2673114, 2.258146, 0, 0.2745098, 1, 1,
0.3450453, -0.7706943, 3.401647, 0, 0.2666667, 1, 1,
0.3456949, -1.64066, 1.913518, 0, 0.2627451, 1, 1,
0.3468091, -0.5943326, 2.707979, 0, 0.254902, 1, 1,
0.3470545, -0.7233535, 2.300563, 0, 0.2509804, 1, 1,
0.3478004, 0.3781995, 1.061245, 0, 0.2431373, 1, 1,
0.3515552, 1.442892, -0.690078, 0, 0.2392157, 1, 1,
0.3523163, 0.114751, 2.728994, 0, 0.2313726, 1, 1,
0.3532518, -0.9950579, 1.879656, 0, 0.227451, 1, 1,
0.3554212, -2.004072, 2.375526, 0, 0.2196078, 1, 1,
0.357146, 0.1006034, 0.4993202, 0, 0.2156863, 1, 1,
0.3583916, -0.8128881, 2.464668, 0, 0.2078431, 1, 1,
0.3644962, 2.841498, 1.322599, 0, 0.2039216, 1, 1,
0.3651918, -0.3015042, 2.008338, 0, 0.1960784, 1, 1,
0.3670862, -1.013821, 2.434016, 0, 0.1882353, 1, 1,
0.3682824, 1.956983, 1.169725, 0, 0.1843137, 1, 1,
0.3693703, 1.280688, -0.01542481, 0, 0.1764706, 1, 1,
0.3695737, 0.4117148, 0.3520827, 0, 0.172549, 1, 1,
0.3711015, -0.6458266, 1.745229, 0, 0.1647059, 1, 1,
0.3795253, -0.08662105, 1.17976, 0, 0.1607843, 1, 1,
0.382031, -0.5534294, 3.094167, 0, 0.1529412, 1, 1,
0.3874504, -0.5466965, 2.506493, 0, 0.1490196, 1, 1,
0.389399, -0.1420294, 4.206137, 0, 0.1411765, 1, 1,
0.3925879, -0.04999571, 0.9759057, 0, 0.1372549, 1, 1,
0.3941255, -1.015457, 1.096018, 0, 0.1294118, 1, 1,
0.3949662, -0.5674484, 3.625859, 0, 0.1254902, 1, 1,
0.3958341, 1.173443, 1.004153, 0, 0.1176471, 1, 1,
0.4006432, 1.259447, 0.3154394, 0, 0.1137255, 1, 1,
0.4032522, -0.6057446, 2.287084, 0, 0.1058824, 1, 1,
0.4050005, 0.7189364, 0.5024766, 0, 0.09803922, 1, 1,
0.4057397, 0.1267673, 2.585237, 0, 0.09411765, 1, 1,
0.4060964, -1.382534, 3.515794, 0, 0.08627451, 1, 1,
0.4118682, 0.8414891, 0.2433783, 0, 0.08235294, 1, 1,
0.4132627, 0.2956263, 1.066156, 0, 0.07450981, 1, 1,
0.4179521, -0.2839206, 4.449053, 0, 0.07058824, 1, 1,
0.4201881, -0.4557835, 2.644521, 0, 0.0627451, 1, 1,
0.4204859, 0.562474, 1.15179, 0, 0.05882353, 1, 1,
0.4205452, -1.275261, 2.837346, 0, 0.05098039, 1, 1,
0.4211743, -0.04238167, 1.814828, 0, 0.04705882, 1, 1,
0.4285548, -0.5656028, 1.032665, 0, 0.03921569, 1, 1,
0.4343216, 0.1998533, 2.285587, 0, 0.03529412, 1, 1,
0.4366843, -0.6486849, 4.597112, 0, 0.02745098, 1, 1,
0.4374311, -0.3150979, 3.945014, 0, 0.02352941, 1, 1,
0.4403852, -0.02552609, 1.04416, 0, 0.01568628, 1, 1,
0.4417236, 0.9188892, 2.338844, 0, 0.01176471, 1, 1,
0.4421025, 1.273597, -0.6868759, 0, 0.003921569, 1, 1,
0.4424463, 0.4940619, 0.5889881, 0.003921569, 0, 1, 1,
0.4425928, -0.07602728, 3.835149, 0.007843138, 0, 1, 1,
0.4429638, -1.944559, 1.966386, 0.01568628, 0, 1, 1,
0.4456373, -0.337419, 0.992987, 0.01960784, 0, 1, 1,
0.4471662, 0.86781, 1.759958, 0.02745098, 0, 1, 1,
0.4498732, -0.03774857, 1.792638, 0.03137255, 0, 1, 1,
0.4502444, -2.387229, 4.249081, 0.03921569, 0, 1, 1,
0.451391, -0.1030794, 1.574711, 0.04313726, 0, 1, 1,
0.4531649, 0.2716381, 3.410487, 0.05098039, 0, 1, 1,
0.4546977, 0.5381641, 0.7343423, 0.05490196, 0, 1, 1,
0.4557244, 0.3479233, -1.217028, 0.0627451, 0, 1, 1,
0.4587749, 0.7872314, 1.046945, 0.06666667, 0, 1, 1,
0.4644714, -1.178387, 2.821826, 0.07450981, 0, 1, 1,
0.4681387, 2.069934, -0.623885, 0.07843138, 0, 1, 1,
0.4735882, -0.9218817, 2.833255, 0.08627451, 0, 1, 1,
0.4792215, 0.8435974, 1.352175, 0.09019608, 0, 1, 1,
0.4797033, 0.1212731, 1.018324, 0.09803922, 0, 1, 1,
0.4797877, -1.047317, 2.82744, 0.1058824, 0, 1, 1,
0.4819374, -0.05200784, 0.3130913, 0.1098039, 0, 1, 1,
0.482278, 0.917049, 0.003467125, 0.1176471, 0, 1, 1,
0.4824396, 0.9372699, -0.3623735, 0.1215686, 0, 1, 1,
0.4842466, 0.6382095, -1.206982, 0.1294118, 0, 1, 1,
0.4844001, 2.25689, -0.3153873, 0.1333333, 0, 1, 1,
0.490131, -1.472052, 2.383342, 0.1411765, 0, 1, 1,
0.4939908, 0.5364956, -0.2891745, 0.145098, 0, 1, 1,
0.5004418, -1.007676, 2.369416, 0.1529412, 0, 1, 1,
0.5007209, -0.2162125, 2.861699, 0.1568628, 0, 1, 1,
0.5075904, 0.6471866, 1.047918, 0.1647059, 0, 1, 1,
0.50916, -0.1766835, 1.027588, 0.1686275, 0, 1, 1,
0.5116399, 0.9166433, 0.7561745, 0.1764706, 0, 1, 1,
0.5129669, -1.07465, 1.530572, 0.1803922, 0, 1, 1,
0.5164729, 0.1961425, 1.063669, 0.1882353, 0, 1, 1,
0.518273, -0.9584596, 1.948703, 0.1921569, 0, 1, 1,
0.5207316, 0.1244138, 1.812129, 0.2, 0, 1, 1,
0.5238417, -1.359386, 1.440208, 0.2078431, 0, 1, 1,
0.5241498, 1.81239, -0.517468, 0.2117647, 0, 1, 1,
0.5288361, -0.5526966, 2.81732, 0.2196078, 0, 1, 1,
0.5299717, -0.9795004, 4.111794, 0.2235294, 0, 1, 1,
0.5310857, 0.5245393, 2.204207, 0.2313726, 0, 1, 1,
0.5315485, 1.534197, 1.642499, 0.2352941, 0, 1, 1,
0.5335677, -1.251866, 3.11783, 0.2431373, 0, 1, 1,
0.5359754, -0.07044641, 0.6453799, 0.2470588, 0, 1, 1,
0.5368134, -1.125911, 5.504586, 0.254902, 0, 1, 1,
0.5378408, -1.032943, 1.464436, 0.2588235, 0, 1, 1,
0.5476009, 0.7353755, -1.173318, 0.2666667, 0, 1, 1,
0.5502836, -1.522934, 2.140809, 0.2705882, 0, 1, 1,
0.550761, 0.7494568, -1.56898, 0.2784314, 0, 1, 1,
0.5520213, -1.517017, 2.316933, 0.282353, 0, 1, 1,
0.5541609, 0.1269923, 2.193501, 0.2901961, 0, 1, 1,
0.5558974, -0.008030175, 3.299017, 0.2941177, 0, 1, 1,
0.5627451, -1.002139, 2.643044, 0.3019608, 0, 1, 1,
0.5729782, -0.1323026, 1.492241, 0.3098039, 0, 1, 1,
0.574002, -1.000455, 2.731261, 0.3137255, 0, 1, 1,
0.5785777, 1.331235, 0.9508522, 0.3215686, 0, 1, 1,
0.5798406, 1.416306, -1.6065, 0.3254902, 0, 1, 1,
0.5808805, 0.267991, 0.02925377, 0.3333333, 0, 1, 1,
0.5812684, 1.684499, 1.061213, 0.3372549, 0, 1, 1,
0.5834235, -1.178004, 2.083352, 0.345098, 0, 1, 1,
0.5834586, 0.4651776, 1.40463, 0.3490196, 0, 1, 1,
0.5889524, -0.120427, 1.53741, 0.3568628, 0, 1, 1,
0.5898982, 1.076291, 1.350251, 0.3607843, 0, 1, 1,
0.5931955, -1.508933, 3.615223, 0.3686275, 0, 1, 1,
0.5934083, 0.4237685, 0.7481971, 0.372549, 0, 1, 1,
0.5941028, 2.015741, 0.03043415, 0.3803922, 0, 1, 1,
0.5941782, -0.6871101, 3.052093, 0.3843137, 0, 1, 1,
0.6004153, -0.3580151, 2.257233, 0.3921569, 0, 1, 1,
0.6035944, 1.353717, 0.4524956, 0.3960784, 0, 1, 1,
0.6086067, 0.2339987, 0.8083375, 0.4039216, 0, 1, 1,
0.6124821, -0.7432093, 2.320654, 0.4117647, 0, 1, 1,
0.612646, 0.7557117, 2.016148, 0.4156863, 0, 1, 1,
0.6128387, 1.126334, 0.1345198, 0.4235294, 0, 1, 1,
0.6128485, -0.4294538, 0.9745369, 0.427451, 0, 1, 1,
0.6150129, 3.669437, -0.08551843, 0.4352941, 0, 1, 1,
0.6255085, -0.2970102, 1.87979, 0.4392157, 0, 1, 1,
0.6292748, -1.319749, 2.194119, 0.4470588, 0, 1, 1,
0.6316417, -2.554213, 4.402474, 0.4509804, 0, 1, 1,
0.6344746, -0.690809, 1.833474, 0.4588235, 0, 1, 1,
0.6350074, 2.402689, -0.09146269, 0.4627451, 0, 1, 1,
0.6371288, -1.459604, 2.374529, 0.4705882, 0, 1, 1,
0.6393161, 0.3874208, 0.2612844, 0.4745098, 0, 1, 1,
0.642499, 0.721156, -0.5543371, 0.4823529, 0, 1, 1,
0.6440829, -2.604629, 3.179797, 0.4862745, 0, 1, 1,
0.6499643, -0.3554635, 0.9757259, 0.4941176, 0, 1, 1,
0.65093, 0.6569635, 0.806114, 0.5019608, 0, 1, 1,
0.6514307, -0.2275725, 2.40837, 0.5058824, 0, 1, 1,
0.6516585, 0.3276235, 2.445762, 0.5137255, 0, 1, 1,
0.6520369, -2.213264, 1.350124, 0.5176471, 0, 1, 1,
0.6527603, 0.6884925, -0.03232129, 0.5254902, 0, 1, 1,
0.6563559, 0.7860724, 0.2285229, 0.5294118, 0, 1, 1,
0.6571995, 0.5544807, 0.07835082, 0.5372549, 0, 1, 1,
0.6587662, 0.8963344, 0.1796813, 0.5411765, 0, 1, 1,
0.65974, -1.323313, 2.586097, 0.5490196, 0, 1, 1,
0.6623675, 0.9578588, 0.975733, 0.5529412, 0, 1, 1,
0.6663961, -0.5487694, 3.217841, 0.5607843, 0, 1, 1,
0.6682917, 1.479204, -1.297412, 0.5647059, 0, 1, 1,
0.6687849, 1.491827, -0.3312724, 0.572549, 0, 1, 1,
0.674975, -1.776604, 2.414221, 0.5764706, 0, 1, 1,
0.6764197, -0.384672, 1.463143, 0.5843138, 0, 1, 1,
0.6804944, 1.943035, 0.5477795, 0.5882353, 0, 1, 1,
0.6809487, -0.06133156, 1.645072, 0.5960785, 0, 1, 1,
0.6845171, 1.99015, -0.0527647, 0.6039216, 0, 1, 1,
0.6914662, -0.65141, 3.15254, 0.6078432, 0, 1, 1,
0.6951176, -1.184349, 2.123201, 0.6156863, 0, 1, 1,
0.7065734, -1.472492, 0.8707472, 0.6196079, 0, 1, 1,
0.7088234, -1.320247, 3.780009, 0.627451, 0, 1, 1,
0.7122484, -2.147506, 1.738881, 0.6313726, 0, 1, 1,
0.713716, 0.3745741, 1.532843, 0.6392157, 0, 1, 1,
0.7184855, -1.055867, 1.774511, 0.6431373, 0, 1, 1,
0.7189819, -0.7259801, 2.123531, 0.6509804, 0, 1, 1,
0.7190761, 1.142034, 0.0755339, 0.654902, 0, 1, 1,
0.720302, -1.290164, 4.006841, 0.6627451, 0, 1, 1,
0.720319, 1.33251, -0.4990879, 0.6666667, 0, 1, 1,
0.7225423, -0.323929, 0.9575139, 0.6745098, 0, 1, 1,
0.7270077, 0.423901, 1.890708, 0.6784314, 0, 1, 1,
0.7330313, 0.5135065, 2.753145, 0.6862745, 0, 1, 1,
0.7366285, -2.395935, 2.446605, 0.6901961, 0, 1, 1,
0.7401716, -1.970785, 1.504192, 0.6980392, 0, 1, 1,
0.7403895, -0.5705705, 1.045213, 0.7058824, 0, 1, 1,
0.7438743, 0.555212, 2.209667, 0.7098039, 0, 1, 1,
0.7506205, -1.541624, 2.105303, 0.7176471, 0, 1, 1,
0.7506403, -2.00605, 3.231294, 0.7215686, 0, 1, 1,
0.7566214, 1.109993, -2.355237, 0.7294118, 0, 1, 1,
0.7630867, -1.123635, 2.679821, 0.7333333, 0, 1, 1,
0.7698808, -0.8543428, 2.497616, 0.7411765, 0, 1, 1,
0.774579, -0.7385035, 2.69296, 0.7450981, 0, 1, 1,
0.7752289, -0.9878555, 2.731484, 0.7529412, 0, 1, 1,
0.791275, -0.0818105, 2.550623, 0.7568628, 0, 1, 1,
0.7920266, 0.6931673, 0.4366106, 0.7647059, 0, 1, 1,
0.7939546, 0.3137029, 2.723455, 0.7686275, 0, 1, 1,
0.7982101, -0.09938543, 1.450804, 0.7764706, 0, 1, 1,
0.7995705, 1.568689, -0.386077, 0.7803922, 0, 1, 1,
0.8092164, 0.8268089, 0.09244107, 0.7882353, 0, 1, 1,
0.8095921, 0.7429525, -0.6589886, 0.7921569, 0, 1, 1,
0.8183234, -0.3419507, 2.640026, 0.8, 0, 1, 1,
0.8200156, 1.923202, -0.1113096, 0.8078431, 0, 1, 1,
0.8222182, 0.09206582, 2.067885, 0.8117647, 0, 1, 1,
0.822834, 0.07406948, 1.109194, 0.8196079, 0, 1, 1,
0.8273861, -0.9321594, 1.892473, 0.8235294, 0, 1, 1,
0.8276358, 0.02825452, 1.879685, 0.8313726, 0, 1, 1,
0.8315586, 1.062569, 0.6638565, 0.8352941, 0, 1, 1,
0.835101, -0.1915773, 1.608727, 0.8431373, 0, 1, 1,
0.8371655, -0.2546214, 1.538894, 0.8470588, 0, 1, 1,
0.8381062, -1.03662, 1.40746, 0.854902, 0, 1, 1,
0.8401775, 0.902698, 1.265409, 0.8588235, 0, 1, 1,
0.8413678, 1.053474, 1.26695, 0.8666667, 0, 1, 1,
0.84381, 0.02924293, 2.218825, 0.8705882, 0, 1, 1,
0.8531124, -1.619167, 3.096266, 0.8784314, 0, 1, 1,
0.8557904, -1.235121, 2.349326, 0.8823529, 0, 1, 1,
0.8652326, 0.2430771, 1.500539, 0.8901961, 0, 1, 1,
0.8659827, 0.8333094, 0.03260773, 0.8941177, 0, 1, 1,
0.8710291, -1.703225, 2.54718, 0.9019608, 0, 1, 1,
0.8715767, 1.426405, -0.1891739, 0.9098039, 0, 1, 1,
0.8717812, 1.347264, -0.426675, 0.9137255, 0, 1, 1,
0.8737208, 0.2067484, 1.983904, 0.9215686, 0, 1, 1,
0.8781592, 0.3240086, 0.3590446, 0.9254902, 0, 1, 1,
0.8808697, -0.4282599, 2.182347, 0.9333333, 0, 1, 1,
0.8819212, -0.1736896, 0.5357981, 0.9372549, 0, 1, 1,
0.8827665, -0.3620014, 1.157037, 0.945098, 0, 1, 1,
0.8966115, 0.2873349, 2.223797, 0.9490196, 0, 1, 1,
0.9000393, -0.29608, 3.579826, 0.9568627, 0, 1, 1,
0.9012291, -1.92264, 3.402011, 0.9607843, 0, 1, 1,
0.9062617, 1.759408, -1.06857, 0.9686275, 0, 1, 1,
0.9066276, 0.6777784, 0.4706916, 0.972549, 0, 1, 1,
0.913775, 1.211804, 2.759732, 0.9803922, 0, 1, 1,
0.9169991, -0.230698, 1.771639, 0.9843137, 0, 1, 1,
0.9177049, 1.236619, 1.162403, 0.9921569, 0, 1, 1,
0.9218181, 0.2272427, -0.3111564, 0.9960784, 0, 1, 1,
0.9219017, -0.1350062, 0.4482173, 1, 0, 0.9960784, 1,
0.9231021, 0.4531492, 1.350027, 1, 0, 0.9882353, 1,
0.9315032, 1.070502, 0.351709, 1, 0, 0.9843137, 1,
0.9390923, 0.2710668, -0.9551049, 1, 0, 0.9764706, 1,
0.9426153, 0.5652174, 1.125193, 1, 0, 0.972549, 1,
0.9464077, 1.539983, -0.5202547, 1, 0, 0.9647059, 1,
0.9479327, -1.128319, 2.335408, 1, 0, 0.9607843, 1,
0.9518198, 0.4036859, 2.934096, 1, 0, 0.9529412, 1,
0.9554898, -0.3464281, 2.836443, 1, 0, 0.9490196, 1,
0.95824, 0.00389174, 0.8947317, 1, 0, 0.9411765, 1,
0.9587749, 0.2649529, 0.9149453, 1, 0, 0.9372549, 1,
0.9601179, 0.1938664, -0.1017046, 1, 0, 0.9294118, 1,
0.9688947, 0.9074245, 0.5008176, 1, 0, 0.9254902, 1,
0.9711813, -0.8440866, 2.907871, 1, 0, 0.9176471, 1,
0.9715047, 0.2727277, 2.570423, 1, 0, 0.9137255, 1,
0.9720705, 0.1576886, 2.341513, 1, 0, 0.9058824, 1,
0.9834005, 1.650031, -0.6547465, 1, 0, 0.9019608, 1,
0.9976006, -0.5232122, 3.273232, 1, 0, 0.8941177, 1,
0.9987405, -0.004270842, 1.30407, 1, 0, 0.8862745, 1,
1.002367, -0.8021191, 1.852576, 1, 0, 0.8823529, 1,
1.005391, -0.566523, 3.74429, 1, 0, 0.8745098, 1,
1.008116, -0.9563051, 0.6672867, 1, 0, 0.8705882, 1,
1.011878, 1.380021, 1.323036, 1, 0, 0.8627451, 1,
1.020516, 0.549602, 2.309208, 1, 0, 0.8588235, 1,
1.024889, 0.07085432, -0.9471504, 1, 0, 0.8509804, 1,
1.028891, 0.1732868, 2.857834, 1, 0, 0.8470588, 1,
1.031449, -1.010401, 1.267013, 1, 0, 0.8392157, 1,
1.032511, -0.07827206, 1.032882, 1, 0, 0.8352941, 1,
1.035848, 0.7748957, 1.890131, 1, 0, 0.827451, 1,
1.043706, -1.812288, 2.496236, 1, 0, 0.8235294, 1,
1.045091, 0.681738, 0.7918826, 1, 0, 0.8156863, 1,
1.045679, 0.3793431, 2.284192, 1, 0, 0.8117647, 1,
1.054604, -0.3447255, 2.971046, 1, 0, 0.8039216, 1,
1.056072, 0.3815781, 2.635373, 1, 0, 0.7960784, 1,
1.060007, 0.6869647, -0.1832335, 1, 0, 0.7921569, 1,
1.061838, 0.06281966, 0.5693752, 1, 0, 0.7843137, 1,
1.074548, 0.7303678, 1.035403, 1, 0, 0.7803922, 1,
1.081494, -0.4930757, 0.7510073, 1, 0, 0.772549, 1,
1.08199, -1.220335, 2.361853, 1, 0, 0.7686275, 1,
1.102349, -1.571277, 3.277859, 1, 0, 0.7607843, 1,
1.104432, 1.2044, 1.640718, 1, 0, 0.7568628, 1,
1.109059, -0.828282, 1.883054, 1, 0, 0.7490196, 1,
1.109827, -0.3535446, 1.521106, 1, 0, 0.7450981, 1,
1.124716, -0.4855715, 3.029121, 1, 0, 0.7372549, 1,
1.147851, -1.075651, 1.837611, 1, 0, 0.7333333, 1,
1.150528, -0.2795654, 1.691642, 1, 0, 0.7254902, 1,
1.150909, -0.9637324, 3.848897, 1, 0, 0.7215686, 1,
1.152701, 0.9180682, 2.258809, 1, 0, 0.7137255, 1,
1.154539, -1.627676, 2.494348, 1, 0, 0.7098039, 1,
1.161726, -0.5983097, 2.043471, 1, 0, 0.7019608, 1,
1.16688, 0.2613071, 0.4638359, 1, 0, 0.6941177, 1,
1.173616, -0.5023824, 2.829142, 1, 0, 0.6901961, 1,
1.178102, 3.070659, -0.8588653, 1, 0, 0.682353, 1,
1.181104, -1.179206, 4.946058, 1, 0, 0.6784314, 1,
1.192961, -0.0720236, 0.4941134, 1, 0, 0.6705883, 1,
1.196947, -1.964108, 4.313138, 1, 0, 0.6666667, 1,
1.201752, -0.1948354, 0.3129156, 1, 0, 0.6588235, 1,
1.210466, -0.1337373, 2.344589, 1, 0, 0.654902, 1,
1.214565, 2.147157, 0.8640943, 1, 0, 0.6470588, 1,
1.225296, 0.4808888, 0.3752832, 1, 0, 0.6431373, 1,
1.2375, -1.509707, 2.791855, 1, 0, 0.6352941, 1,
1.256842, -0.9662121, 3.043421, 1, 0, 0.6313726, 1,
1.262502, 0.4012199, 1.043093, 1, 0, 0.6235294, 1,
1.263622, -0.3847202, 1.337711, 1, 0, 0.6196079, 1,
1.272017, -1.103846, 4.160632, 1, 0, 0.6117647, 1,
1.275246, 0.2887775, 1.437434, 1, 0, 0.6078432, 1,
1.284296, -0.2846052, 2.370646, 1, 0, 0.6, 1,
1.294539, 0.642152, 2.04075, 1, 0, 0.5921569, 1,
1.29476, -0.5772021, 1.641518, 1, 0, 0.5882353, 1,
1.301682, -0.1899665, 1.225907, 1, 0, 0.5803922, 1,
1.334859, 0.7277857, 0.6819059, 1, 0, 0.5764706, 1,
1.33935, 0.8872564, 1.543949, 1, 0, 0.5686275, 1,
1.344097, -0.8739254, 1.900873, 1, 0, 0.5647059, 1,
1.345056, -0.8889583, 2.576926, 1, 0, 0.5568628, 1,
1.347489, 0.2584734, 2.020524, 1, 0, 0.5529412, 1,
1.352845, 0.2819556, 1.001095, 1, 0, 0.5450981, 1,
1.354227, 0.309388, 1.348911, 1, 0, 0.5411765, 1,
1.354751, -0.08865202, 1.40935, 1, 0, 0.5333334, 1,
1.357537, -0.07018887, 2.080847, 1, 0, 0.5294118, 1,
1.363936, -1.719054, 1.759965, 1, 0, 0.5215687, 1,
1.37598, -0.642872, 2.373345, 1, 0, 0.5176471, 1,
1.379893, -0.7854199, 3.340034, 1, 0, 0.509804, 1,
1.384505, 0.3522975, 0.7532364, 1, 0, 0.5058824, 1,
1.390975, -0.6535068, 1.467726, 1, 0, 0.4980392, 1,
1.393707, 1.735837, 0.6955767, 1, 0, 0.4901961, 1,
1.394267, -0.9204184, 1.869748, 1, 0, 0.4862745, 1,
1.395723, -0.6163642, 2.274237, 1, 0, 0.4784314, 1,
1.399131, -0.9742453, 4.121422, 1, 0, 0.4745098, 1,
1.407508, -0.9434061, 2.118253, 1, 0, 0.4666667, 1,
1.408783, -0.6947888, -0.5730854, 1, 0, 0.4627451, 1,
1.410114, -0.08166556, 0.04108143, 1, 0, 0.454902, 1,
1.412673, -0.8075794, 4.215896, 1, 0, 0.4509804, 1,
1.423441, -0.1023251, 3.560817, 1, 0, 0.4431373, 1,
1.428414, 0.133653, 1.724561, 1, 0, 0.4392157, 1,
1.432749, -1.029272, 2.530793, 1, 0, 0.4313726, 1,
1.436573, 0.617776, 2.187252, 1, 0, 0.427451, 1,
1.439291, -0.2533511, 0.9329428, 1, 0, 0.4196078, 1,
1.444791, -0.7968372, 3.710092, 1, 0, 0.4156863, 1,
1.448789, 2.183433, 0.1292527, 1, 0, 0.4078431, 1,
1.46019, 0.2094843, 1.646505, 1, 0, 0.4039216, 1,
1.46765, -1.598373, 2.93922, 1, 0, 0.3960784, 1,
1.477398, -1.1464, 4.389804, 1, 0, 0.3882353, 1,
1.486758, 0.1695855, 1.88235, 1, 0, 0.3843137, 1,
1.498515, -0.8608553, 2.368737, 1, 0, 0.3764706, 1,
1.519372, -0.9917864, 2.284586, 1, 0, 0.372549, 1,
1.520362, -1.733633, 1.770929, 1, 0, 0.3647059, 1,
1.524006, -0.06444372, 1.158076, 1, 0, 0.3607843, 1,
1.526854, 0.5366451, 1.367251, 1, 0, 0.3529412, 1,
1.528233, 0.9362305, 0.8557783, 1, 0, 0.3490196, 1,
1.540559, 0.7619045, 0.4941933, 1, 0, 0.3411765, 1,
1.553078, -0.7802024, 1.448673, 1, 0, 0.3372549, 1,
1.559532, 0.06804722, 0.8031403, 1, 0, 0.3294118, 1,
1.575412, -0.07254239, 0.1830599, 1, 0, 0.3254902, 1,
1.575788, -1.028707, 0.7303197, 1, 0, 0.3176471, 1,
1.60351, 0.3525214, 2.473472, 1, 0, 0.3137255, 1,
1.605631, -1.789161, 1.6342, 1, 0, 0.3058824, 1,
1.606996, -0.1473884, -0.1124717, 1, 0, 0.2980392, 1,
1.618854, 0.8699716, 2.175049, 1, 0, 0.2941177, 1,
1.624862, 1.391999, 1.093646, 1, 0, 0.2862745, 1,
1.628745, 0.5917145, -1.091717, 1, 0, 0.282353, 1,
1.634422, 0.8716192, 1.229163, 1, 0, 0.2745098, 1,
1.641157, -0.4550636, 4.359431, 1, 0, 0.2705882, 1,
1.644686, 0.3497266, 1.862944, 1, 0, 0.2627451, 1,
1.644797, 0.1730357, -0.4327565, 1, 0, 0.2588235, 1,
1.651241, -1.673297, 2.409849, 1, 0, 0.2509804, 1,
1.656422, 1.094925, 0.6079772, 1, 0, 0.2470588, 1,
1.657154, -1.013579, 2.59596, 1, 0, 0.2392157, 1,
1.662139, -2.115362, 2.476136, 1, 0, 0.2352941, 1,
1.690417, -0.2218916, 1.298542, 1, 0, 0.227451, 1,
1.707771, -0.6567352, 3.17484, 1, 0, 0.2235294, 1,
1.716518, -1.655561, 2.156784, 1, 0, 0.2156863, 1,
1.721212, -1.903227, 0.9257937, 1, 0, 0.2117647, 1,
1.748317, 0.6887062, 1.499058, 1, 0, 0.2039216, 1,
1.75976, -1.527422, 0.8124297, 1, 0, 0.1960784, 1,
1.770247, 1.011809, -0.09900228, 1, 0, 0.1921569, 1,
1.786746, 1.328591, -0.9467353, 1, 0, 0.1843137, 1,
1.790045, -1.428414, 4.096928, 1, 0, 0.1803922, 1,
1.79333, 0.8997282, 0.2143986, 1, 0, 0.172549, 1,
1.818843, -0.6325365, 1.473148, 1, 0, 0.1686275, 1,
1.848725, -0.6481467, 2.658926, 1, 0, 0.1607843, 1,
1.88273, 1.217603, -0.4376392, 1, 0, 0.1568628, 1,
1.895097, 0.7822332, 2.621499, 1, 0, 0.1490196, 1,
1.909608, 0.6612681, 0.3109944, 1, 0, 0.145098, 1,
1.926694, 0.1880533, -0.3504963, 1, 0, 0.1372549, 1,
1.942208, -1.73185, 3.2304, 1, 0, 0.1333333, 1,
1.951204, -0.4998913, 0.8696299, 1, 0, 0.1254902, 1,
1.960765, 1.202792, -1.15885, 1, 0, 0.1215686, 1,
1.975605, 0.1440662, 2.76089, 1, 0, 0.1137255, 1,
2.010235, -2.363081, 0.9232491, 1, 0, 0.1098039, 1,
2.020705, -0.01000447, 1.582106, 1, 0, 0.1019608, 1,
2.034898, 0.05325465, 0.9783689, 1, 0, 0.09411765, 1,
2.073507, -0.6913819, 2.012079, 1, 0, 0.09019608, 1,
2.079633, 1.465497, 0.7668283, 1, 0, 0.08235294, 1,
2.118319, -1.847849, 1.778094, 1, 0, 0.07843138, 1,
2.125166, -0.3290538, 2.361422, 1, 0, 0.07058824, 1,
2.16212, 1.34391, 2.006399, 1, 0, 0.06666667, 1,
2.231159, 1.402073, 0.6932219, 1, 0, 0.05882353, 1,
2.292504, 0.7737643, 1.173667, 1, 0, 0.05490196, 1,
2.352714, -0.5221536, 4.12944, 1, 0, 0.04705882, 1,
2.369236, -0.3322044, 1.276613, 1, 0, 0.04313726, 1,
2.435325, -0.9945263, 1.546351, 1, 0, 0.03529412, 1,
2.484383, 2.165684, 1.172797, 1, 0, 0.03137255, 1,
2.677125, 1.27232, 1.284964, 1, 0, 0.02352941, 1,
3.041029, 0.2710404, 0.9039051, 1, 0, 0.01960784, 1,
3.099149, -0.1074706, 2.241576, 1, 0, 0.01176471, 1,
3.159461, 0.3341528, 2.480541, 1, 0, 0.007843138, 1
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
-0.1472987, -4.549121, -7.308632, 0, -0.5, 0.5, 0.5,
-0.1472987, -4.549121, -7.308632, 1, -0.5, 0.5, 0.5,
-0.1472987, -4.549121, -7.308632, 1, 1.5, 0.5, 0.5,
-0.1472987, -4.549121, -7.308632, 0, 1.5, 0.5, 0.5
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
-4.57505, 0.206349, -7.308632, 0, -0.5, 0.5, 0.5,
-4.57505, 0.206349, -7.308632, 1, -0.5, 0.5, 0.5,
-4.57505, 0.206349, -7.308632, 1, 1.5, 0.5, 0.5,
-4.57505, 0.206349, -7.308632, 0, 1.5, 0.5, 0.5
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
-4.57505, -4.549121, 0.02651095, 0, -0.5, 0.5, 0.5,
-4.57505, -4.549121, 0.02651095, 1, -0.5, 0.5, 0.5,
-4.57505, -4.549121, 0.02651095, 1, 1.5, 0.5, 0.5,
-4.57505, -4.549121, 0.02651095, 0, 1.5, 0.5, 0.5
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
-3, -3.451705, -5.615907,
3, -3.451705, -5.615907,
-3, -3.451705, -5.615907,
-3, -3.634608, -5.898027,
-2, -3.451705, -5.615907,
-2, -3.634608, -5.898027,
-1, -3.451705, -5.615907,
-1, -3.634608, -5.898027,
0, -3.451705, -5.615907,
0, -3.634608, -5.898027,
1, -3.451705, -5.615907,
1, -3.634608, -5.898027,
2, -3.451705, -5.615907,
2, -3.634608, -5.898027,
3, -3.451705, -5.615907,
3, -3.634608, -5.898027
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
-3, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
-3, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
-3, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
-3, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5,
-2, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
-2, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
-2, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
-2, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5,
-1, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
-1, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
-1, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
-1, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5,
0, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
0, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
0, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
0, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5,
1, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
1, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
1, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
1, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5,
2, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
2, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
2, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
2, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5,
3, -4.000413, -6.462269, 0, -0.5, 0.5, 0.5,
3, -4.000413, -6.462269, 1, -0.5, 0.5, 0.5,
3, -4.000413, -6.462269, 1, 1.5, 0.5, 0.5,
3, -4.000413, -6.462269, 0, 1.5, 0.5, 0.5
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
-3.553261, -2, -5.615907,
-3.553261, 2, -5.615907,
-3.553261, -2, -5.615907,
-3.723559, -2, -5.898027,
-3.553261, 0, -5.615907,
-3.723559, 0, -5.898027,
-3.553261, 2, -5.615907,
-3.723559, 2, -5.898027
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
"0",
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
-4.064156, -2, -6.462269, 0, -0.5, 0.5, 0.5,
-4.064156, -2, -6.462269, 1, -0.5, 0.5, 0.5,
-4.064156, -2, -6.462269, 1, 1.5, 0.5, 0.5,
-4.064156, -2, -6.462269, 0, 1.5, 0.5, 0.5,
-4.064156, 0, -6.462269, 0, -0.5, 0.5, 0.5,
-4.064156, 0, -6.462269, 1, -0.5, 0.5, 0.5,
-4.064156, 0, -6.462269, 1, 1.5, 0.5, 0.5,
-4.064156, 0, -6.462269, 0, 1.5, 0.5, 0.5,
-4.064156, 2, -6.462269, 0, -0.5, 0.5, 0.5,
-4.064156, 2, -6.462269, 1, -0.5, 0.5, 0.5,
-4.064156, 2, -6.462269, 1, 1.5, 0.5, 0.5,
-4.064156, 2, -6.462269, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.553261, -3.451705, -4,
-3.553261, -3.451705, 4,
-3.553261, -3.451705, -4,
-3.723559, -3.634608, -4,
-3.553261, -3.451705, -2,
-3.723559, -3.634608, -2,
-3.553261, -3.451705, 0,
-3.723559, -3.634608, 0,
-3.553261, -3.451705, 2,
-3.723559, -3.634608, 2,
-3.553261, -3.451705, 4,
-3.723559, -3.634608, 4
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
-4.064156, -4.000413, -4, 0, -0.5, 0.5, 0.5,
-4.064156, -4.000413, -4, 1, -0.5, 0.5, 0.5,
-4.064156, -4.000413, -4, 1, 1.5, 0.5, 0.5,
-4.064156, -4.000413, -4, 0, 1.5, 0.5, 0.5,
-4.064156, -4.000413, -2, 0, -0.5, 0.5, 0.5,
-4.064156, -4.000413, -2, 1, -0.5, 0.5, 0.5,
-4.064156, -4.000413, -2, 1, 1.5, 0.5, 0.5,
-4.064156, -4.000413, -2, 0, 1.5, 0.5, 0.5,
-4.064156, -4.000413, 0, 0, -0.5, 0.5, 0.5,
-4.064156, -4.000413, 0, 1, -0.5, 0.5, 0.5,
-4.064156, -4.000413, 0, 1, 1.5, 0.5, 0.5,
-4.064156, -4.000413, 0, 0, 1.5, 0.5, 0.5,
-4.064156, -4.000413, 2, 0, -0.5, 0.5, 0.5,
-4.064156, -4.000413, 2, 1, -0.5, 0.5, 0.5,
-4.064156, -4.000413, 2, 1, 1.5, 0.5, 0.5,
-4.064156, -4.000413, 2, 0, 1.5, 0.5, 0.5,
-4.064156, -4.000413, 4, 0, -0.5, 0.5, 0.5,
-4.064156, -4.000413, 4, 1, -0.5, 0.5, 0.5,
-4.064156, -4.000413, 4, 1, 1.5, 0.5, 0.5,
-4.064156, -4.000413, 4, 0, 1.5, 0.5, 0.5
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
-3.553261, -3.451705, -5.615907,
-3.553261, 3.864403, -5.615907,
-3.553261, -3.451705, 5.668929,
-3.553261, 3.864403, 5.668929,
-3.553261, -3.451705, -5.615907,
-3.553261, -3.451705, 5.668929,
-3.553261, 3.864403, -5.615907,
-3.553261, 3.864403, 5.668929,
-3.553261, -3.451705, -5.615907,
3.258664, -3.451705, -5.615907,
-3.553261, -3.451705, 5.668929,
3.258664, -3.451705, 5.668929,
-3.553261, 3.864403, -5.615907,
3.258664, 3.864403, -5.615907,
-3.553261, 3.864403, 5.668929,
3.258664, 3.864403, 5.668929,
3.258664, -3.451705, -5.615907,
3.258664, 3.864403, -5.615907,
3.258664, -3.451705, 5.668929,
3.258664, 3.864403, 5.668929,
3.258664, -3.451705, -5.615907,
3.258664, -3.451705, 5.668929,
3.258664, 3.864403, -5.615907,
3.258664, 3.864403, 5.668929
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
var radius = 8.050105;
var distance = 35.81582;
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
mvMatrix.translate( 0.1472987, -0.206349, -0.02651095 );
mvMatrix.scale( 1.277749, 1.189694, 0.7712945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81582);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
uniconazole<-read.table("uniconazole.xyz")
```

```
## Error in read.table("uniconazole.xyz"): no lines available in input
```

```r
x<-uniconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'uniconazole' not found
```

```r
y<-uniconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'uniconazole' not found
```

```r
z<-uniconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'uniconazole' not found
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
-3.454058, -0.677435, -1.624549, 0, 0, 1, 1, 1,
-3.118812, 0.4427069, -1.244646, 1, 0, 0, 1, 1,
-2.815199, 0.2897355, -0.9529086, 1, 0, 0, 1, 1,
-2.774045, -0.05818228, -1.964758, 1, 0, 0, 1, 1,
-2.725498, 1.213033, -2.67806, 1, 0, 0, 1, 1,
-2.416349, -0.930872, -1.974001, 1, 0, 0, 1, 1,
-2.327655, 0.1750751, -0.5060274, 0, 0, 0, 1, 1,
-2.303188, 0.2549552, -0.5589007, 0, 0, 0, 1, 1,
-2.28823, -0.6590653, -2.131358, 0, 0, 0, 1, 1,
-2.287542, 0.2414761, 0.001530614, 0, 0, 0, 1, 1,
-2.263399, 0.4485881, -0.6580878, 0, 0, 0, 1, 1,
-2.261305, 0.873882, -1.388985, 0, 0, 0, 1, 1,
-2.24033, -0.1521499, -1.621313, 0, 0, 0, 1, 1,
-2.227806, -1.758741, -4.323799, 1, 1, 1, 1, 1,
-2.216745, 0.6192635, -0.1811178, 1, 1, 1, 1, 1,
-2.169516, 0.6469442, -0.1716879, 1, 1, 1, 1, 1,
-2.074311, -0.9086307, -1.821474, 1, 1, 1, 1, 1,
-2.046723, -0.8184357, -1.206106, 1, 1, 1, 1, 1,
-2.0136, 1.445275, -3.56125, 1, 1, 1, 1, 1,
-2.006764, -0.5339373, -1.942661, 1, 1, 1, 1, 1,
-2.002883, -0.465168, -4.114498, 1, 1, 1, 1, 1,
-1.993354, 2.138324, 0.4841574, 1, 1, 1, 1, 1,
-1.963205, 1.468877, -1.448304, 1, 1, 1, 1, 1,
-1.951278, -1.140958, -3.143591, 1, 1, 1, 1, 1,
-1.93348, 0.01234259, -3.483793, 1, 1, 1, 1, 1,
-1.914967, -0.5064011, -1.705389, 1, 1, 1, 1, 1,
-1.898432, -1.322898, -2.432704, 1, 1, 1, 1, 1,
-1.898111, 1.429176, -0.4758724, 1, 1, 1, 1, 1,
-1.889792, 1.728911, -1.886354, 0, 0, 1, 1, 1,
-1.874954, 0.6293049, -1.019072, 1, 0, 0, 1, 1,
-1.857761, -0.7945114, -2.816422, 1, 0, 0, 1, 1,
-1.830204, 0.09416765, -1.975078, 1, 0, 0, 1, 1,
-1.816679, 1.150745, -0.5643924, 1, 0, 0, 1, 1,
-1.770337, 0.05785149, -0.8098236, 1, 0, 0, 1, 1,
-1.769727, -0.60435, -0.2687699, 0, 0, 0, 1, 1,
-1.755523, -3.34516, -2.34062, 0, 0, 0, 1, 1,
-1.748803, 0.3648364, -0.581349, 0, 0, 0, 1, 1,
-1.744977, 1.693853, -1.260753, 0, 0, 0, 1, 1,
-1.740236, 0.6625975, 0.5658135, 0, 0, 0, 1, 1,
-1.730833, 1.05182, -2.971265, 0, 0, 0, 1, 1,
-1.698081, 0.4473826, -2.041672, 0, 0, 0, 1, 1,
-1.684581, -0.5450126, -2.160415, 1, 1, 1, 1, 1,
-1.641602, -2.501006, -3.491827, 1, 1, 1, 1, 1,
-1.62657, -1.447444, -1.31479, 1, 1, 1, 1, 1,
-1.624039, 0.9298726, -1.058856, 1, 1, 1, 1, 1,
-1.623501, 0.1368207, 0.2735516, 1, 1, 1, 1, 1,
-1.610188, -0.1311159, -0.6416772, 1, 1, 1, 1, 1,
-1.59868, 0.9672993, -0.2557126, 1, 1, 1, 1, 1,
-1.595882, -1.056544, -2.663457, 1, 1, 1, 1, 1,
-1.582764, -0.8007858, -1.514083, 1, 1, 1, 1, 1,
-1.571816, 0.2807064, 0.3858089, 1, 1, 1, 1, 1,
-1.571803, -0.4134491, -2.538933, 1, 1, 1, 1, 1,
-1.56173, -1.150965, -2.720444, 1, 1, 1, 1, 1,
-1.555894, 2.296716, -1.128704, 1, 1, 1, 1, 1,
-1.548788, -0.07478419, -1.322241, 1, 1, 1, 1, 1,
-1.546023, -0.6029672, -2.032701, 1, 1, 1, 1, 1,
-1.536759, -1.490777, -2.235257, 0, 0, 1, 1, 1,
-1.534285, 0.06037181, -1.304525, 1, 0, 0, 1, 1,
-1.524642, 1.021639, -0.8332796, 1, 0, 0, 1, 1,
-1.521239, -2.140335, -2.573044, 1, 0, 0, 1, 1,
-1.513609, 0.08419335, -1.925665, 1, 0, 0, 1, 1,
-1.492744, 1.330064, -1.250414, 1, 0, 0, 1, 1,
-1.489424, -1.482418, -1.31346, 0, 0, 0, 1, 1,
-1.480727, -0.7271838, -2.162696, 0, 0, 0, 1, 1,
-1.469044, -0.2752163, -1.292348, 0, 0, 0, 1, 1,
-1.465647, -1.455968, -3.004494, 0, 0, 0, 1, 1,
-1.445777, 1.851633, -1.336017, 0, 0, 0, 1, 1,
-1.444971, 0.628202, -0.507261, 0, 0, 0, 1, 1,
-1.444048, 1.280589, -0.605921, 0, 0, 0, 1, 1,
-1.4297, 0.2330888, -0.9567887, 1, 1, 1, 1, 1,
-1.42499, 1.364911, -1.30844, 1, 1, 1, 1, 1,
-1.423463, -0.279812, -3.070333, 1, 1, 1, 1, 1,
-1.403905, 1.297102, -2.612475, 1, 1, 1, 1, 1,
-1.401144, 1.001566, -0.3491189, 1, 1, 1, 1, 1,
-1.38625, -1.134583, -0.227262, 1, 1, 1, 1, 1,
-1.3722, 1.96855, -1.743605, 1, 1, 1, 1, 1,
-1.355049, 2.462752, -0.1844833, 1, 1, 1, 1, 1,
-1.35197, 0.242499, -1.297478, 1, 1, 1, 1, 1,
-1.347357, -0.3353752, -1.478375, 1, 1, 1, 1, 1,
-1.34117, 0.5566739, -1.875847, 1, 1, 1, 1, 1,
-1.33842, -0.9657236, -1.321993, 1, 1, 1, 1, 1,
-1.336527, 0.1893215, -0.5281066, 1, 1, 1, 1, 1,
-1.327808, 0.09066515, -2.903017, 1, 1, 1, 1, 1,
-1.317925, -0.3600298, -0.5081477, 1, 1, 1, 1, 1,
-1.312332, 1.358017, -2.769533, 0, 0, 1, 1, 1,
-1.292468, 0.8335925, -0.9725201, 1, 0, 0, 1, 1,
-1.288235, -0.1053178, -1.399116, 1, 0, 0, 1, 1,
-1.282496, -0.05932175, -2.527984, 1, 0, 0, 1, 1,
-1.281829, -2.057798, -1.879436, 1, 0, 0, 1, 1,
-1.276503, -1.775074, -1.338794, 1, 0, 0, 1, 1,
-1.27539, -1.281679, -3.344642, 0, 0, 0, 1, 1,
-1.27442, 1.12569, -2.03646, 0, 0, 0, 1, 1,
-1.271346, 1.143317, -0.5844922, 0, 0, 0, 1, 1,
-1.265812, 0.2200951, -2.291611, 0, 0, 0, 1, 1,
-1.262973, 1.225856, 0.03654768, 0, 0, 0, 1, 1,
-1.255762, -0.5025832, -0.1447048, 0, 0, 0, 1, 1,
-1.252735, 0.03492166, -2.014414, 0, 0, 0, 1, 1,
-1.252574, 0.3490912, -0.4727769, 1, 1, 1, 1, 1,
-1.250479, 0.9896981, -1.029931, 1, 1, 1, 1, 1,
-1.242358, -0.8909811, -2.915501, 1, 1, 1, 1, 1,
-1.234926, -2.666737, -1.991874, 1, 1, 1, 1, 1,
-1.231628, -1.778731, -4.197375, 1, 1, 1, 1, 1,
-1.227714, -1.21259, -1.747661, 1, 1, 1, 1, 1,
-1.225701, -1.33576, -3.450494, 1, 1, 1, 1, 1,
-1.213486, -0.9887549, -0.9810746, 1, 1, 1, 1, 1,
-1.212351, 0.7802603, 0.8813664, 1, 1, 1, 1, 1,
-1.209196, -0.9239241, -1.444898, 1, 1, 1, 1, 1,
-1.207134, -0.9411389, -2.107155, 1, 1, 1, 1, 1,
-1.204569, -0.04795791, -1.676343, 1, 1, 1, 1, 1,
-1.198642, 0.5532946, -1.082064, 1, 1, 1, 1, 1,
-1.198514, -2.266311, -1.226346, 1, 1, 1, 1, 1,
-1.194085, 0.3077924, -0.9763734, 1, 1, 1, 1, 1,
-1.187507, 0.8691838, -1.15532, 0, 0, 1, 1, 1,
-1.185862, -1.784986, -3.605974, 1, 0, 0, 1, 1,
-1.184622, 0.2478247, -2.011358, 1, 0, 0, 1, 1,
-1.180802, -0.3165808, -3.24591, 1, 0, 0, 1, 1,
-1.17855, -0.7710788, -3.155684, 1, 0, 0, 1, 1,
-1.175382, 0.4518892, -0.7762573, 1, 0, 0, 1, 1,
-1.173026, 0.8342565, -0.2474097, 0, 0, 0, 1, 1,
-1.160168, -0.8765626, -1.486732, 0, 0, 0, 1, 1,
-1.15734, 0.4360155, -1.171774, 0, 0, 0, 1, 1,
-1.150842, -0.7511902, -3.510854, 0, 0, 0, 1, 1,
-1.141655, -0.4688087, -2.631348, 0, 0, 0, 1, 1,
-1.138417, -1.913163, -1.694761, 0, 0, 0, 1, 1,
-1.137657, 1.240911, 0.8254859, 0, 0, 0, 1, 1,
-1.122416, 0.09998663, -1.53433, 1, 1, 1, 1, 1,
-1.113291, 0.395086, -0.209119, 1, 1, 1, 1, 1,
-1.100377, -1.377179, -3.308728, 1, 1, 1, 1, 1,
-1.095476, -0.636367, -1.944115, 1, 1, 1, 1, 1,
-1.094101, 0.695057, 0.2847287, 1, 1, 1, 1, 1,
-1.090117, 0.3321135, 0.07230511, 1, 1, 1, 1, 1,
-1.085464, 1.888534, 0.3692443, 1, 1, 1, 1, 1,
-1.084565, 0.3623329, -2.080027, 1, 1, 1, 1, 1,
-1.079481, 0.02411668, -1.823061, 1, 1, 1, 1, 1,
-1.07723, 0.2199555, -0.5938145, 1, 1, 1, 1, 1,
-1.076254, 0.2110861, -0.6890266, 1, 1, 1, 1, 1,
-1.071039, -1.811503, -2.62517, 1, 1, 1, 1, 1,
-1.069734, 0.6686759, -1.025735, 1, 1, 1, 1, 1,
-1.049423, 1.171326, -0.1086831, 1, 1, 1, 1, 1,
-1.044769, -0.2947786, -2.701463, 1, 1, 1, 1, 1,
-1.044263, -2.799741, -3.151228, 0, 0, 1, 1, 1,
-1.035762, 0.6862513, 0.7394059, 1, 0, 0, 1, 1,
-1.030051, 0.1431361, -1.271296, 1, 0, 0, 1, 1,
-1.027002, -0.1844307, -1.486226, 1, 0, 0, 1, 1,
-1.023142, -0.4151665, -3.443569, 1, 0, 0, 1, 1,
-1.018969, -0.5151395, -1.119551, 1, 0, 0, 1, 1,
-1.018629, -0.2136404, -2.167506, 0, 0, 0, 1, 1,
-1.016899, -0.7136257, -2.421815, 0, 0, 0, 1, 1,
-1.007222, 0.3984495, -1.118387, 0, 0, 0, 1, 1,
-1.00105, 1.077278, 1.322284, 0, 0, 0, 1, 1,
-0.9885989, 1.167846, 0.4482122, 0, 0, 0, 1, 1,
-0.9885365, 0.4710883, -0.5155122, 0, 0, 0, 1, 1,
-0.988444, -0.9690226, -2.222278, 0, 0, 0, 1, 1,
-0.9807837, -0.8070372, -1.98469, 1, 1, 1, 1, 1,
-0.9804691, 0.2723294, 0.5495079, 1, 1, 1, 1, 1,
-0.9795144, 0.2059576, -2.412124, 1, 1, 1, 1, 1,
-0.9770778, -0.6931566, -2.678302, 1, 1, 1, 1, 1,
-0.9725473, 0.2721395, -1.207449, 1, 1, 1, 1, 1,
-0.9679465, 1.314314, 0.6611748, 1, 1, 1, 1, 1,
-0.9676876, -1.603796, -3.674653, 1, 1, 1, 1, 1,
-0.9640147, 1.176227, -1.32273, 1, 1, 1, 1, 1,
-0.9626765, 0.6389629, 0.1449715, 1, 1, 1, 1, 1,
-0.9554089, -1.346393, -3.242258, 1, 1, 1, 1, 1,
-0.9539255, -0.3192359, -1.868107, 1, 1, 1, 1, 1,
-0.9513559, -0.3425982, -2.934464, 1, 1, 1, 1, 1,
-0.9479294, -0.3617433, -0.6810895, 1, 1, 1, 1, 1,
-0.9229451, 0.1331037, -0.986636, 1, 1, 1, 1, 1,
-0.9203191, -0.8467643, -2.46511, 1, 1, 1, 1, 1,
-0.9164721, 2.013919, -1.72111, 0, 0, 1, 1, 1,
-0.9146338, -0.6298279, -0.9108241, 1, 0, 0, 1, 1,
-0.9126478, -0.3571562, -1.85334, 1, 0, 0, 1, 1,
-0.9091247, -1.644322, -3.275291, 1, 0, 0, 1, 1,
-0.9024866, 0.5638767, -2.15911, 1, 0, 0, 1, 1,
-0.9024712, 0.03243043, -1.662985, 1, 0, 0, 1, 1,
-0.8927888, 0.3312208, -0.9790069, 0, 0, 0, 1, 1,
-0.8911807, 1.428813, -0.9498439, 0, 0, 0, 1, 1,
-0.8870414, -1.028315, -1.057159, 0, 0, 0, 1, 1,
-0.8820278, -1.611067, -2.187177, 0, 0, 0, 1, 1,
-0.8812969, 1.609246, -0.5623067, 0, 0, 0, 1, 1,
-0.8812218, 1.054249, -0.6964896, 0, 0, 0, 1, 1,
-0.8811319, 0.6907018, -0.4088472, 0, 0, 0, 1, 1,
-0.871914, 0.2117183, -1.652478, 1, 1, 1, 1, 1,
-0.8691639, 0.6130566, -0.4782296, 1, 1, 1, 1, 1,
-0.8671447, -0.2480679, -0.03135362, 1, 1, 1, 1, 1,
-0.8608822, 1.26451, -2.443987, 1, 1, 1, 1, 1,
-0.8563322, 1.458147, -1.526962, 1, 1, 1, 1, 1,
-0.8553004, -0.5392304, -1.913813, 1, 1, 1, 1, 1,
-0.852779, 1.712211, -1.420079, 1, 1, 1, 1, 1,
-0.851586, 0.8546108, -1.188213, 1, 1, 1, 1, 1,
-0.8493605, -0.2011542, -4.035766, 1, 1, 1, 1, 1,
-0.8489557, 1.158261, -0.3645713, 1, 1, 1, 1, 1,
-0.8477085, 0.3617212, -0.8833016, 1, 1, 1, 1, 1,
-0.8411986, 0.4525876, -2.851159, 1, 1, 1, 1, 1,
-0.8360487, -0.3834525, -1.729754, 1, 1, 1, 1, 1,
-0.8340212, -0.1766423, -2.233606, 1, 1, 1, 1, 1,
-0.8313677, -1.289069, -2.948258, 1, 1, 1, 1, 1,
-0.8279333, -2.320192, -3.627383, 0, 0, 1, 1, 1,
-0.8233512, -0.08943338, -2.279186, 1, 0, 0, 1, 1,
-0.821575, 1.48919, -0.8327975, 1, 0, 0, 1, 1,
-0.8207635, -0.2556877, -1.693064, 1, 0, 0, 1, 1,
-0.8138404, 0.996702, -1.308581, 1, 0, 0, 1, 1,
-0.8108996, 0.9729534, 0.5668261, 1, 0, 0, 1, 1,
-0.808642, 0.4591625, -0.7827348, 0, 0, 0, 1, 1,
-0.8082402, 0.1556204, -0.7737358, 0, 0, 0, 1, 1,
-0.8078791, 0.2377376, -0.9029245, 0, 0, 0, 1, 1,
-0.8069329, -1.307957, -3.022825, 0, 0, 0, 1, 1,
-0.8040164, 0.414003, -1.588926, 0, 0, 0, 1, 1,
-0.8016381, 1.493923, -0.6951963, 0, 0, 0, 1, 1,
-0.799484, -0.9901167, -3.721172, 0, 0, 0, 1, 1,
-0.7913644, -0.6304006, -2.18294, 1, 1, 1, 1, 1,
-0.7905631, -0.4665654, -3.40982, 1, 1, 1, 1, 1,
-0.785014, 0.2799069, -1.067703, 1, 1, 1, 1, 1,
-0.7761553, 0.8462424, -1.283466, 1, 1, 1, 1, 1,
-0.7671215, -1.050883, -3.625442, 1, 1, 1, 1, 1,
-0.7662001, 0.8087451, -2.020601, 1, 1, 1, 1, 1,
-0.7618064, 0.2869144, -0.3569654, 1, 1, 1, 1, 1,
-0.7582638, 0.7753644, -1.005472, 1, 1, 1, 1, 1,
-0.7565783, -1.453425, -3.842363, 1, 1, 1, 1, 1,
-0.7474104, 0.3663994, -0.3494726, 1, 1, 1, 1, 1,
-0.7399553, -1.314965, -2.764562, 1, 1, 1, 1, 1,
-0.7383751, 1.716423, -1.424295, 1, 1, 1, 1, 1,
-0.7352788, -0.9799912, -1.492351, 1, 1, 1, 1, 1,
-0.7313378, -1.604491, -0.9891597, 1, 1, 1, 1, 1,
-0.7312934, -0.2275785, -0.6898901, 1, 1, 1, 1, 1,
-0.727577, 0.6467521, -0.8275464, 0, 0, 1, 1, 1,
-0.7242315, 1.91726, -1.467366, 1, 0, 0, 1, 1,
-0.7237823, 1.358436, 1.148987, 1, 0, 0, 1, 1,
-0.7231382, -0.6136576, -1.018445, 1, 0, 0, 1, 1,
-0.7206408, -2.088523, -2.548409, 1, 0, 0, 1, 1,
-0.7164569, -1.611813, -3.593358, 1, 0, 0, 1, 1,
-0.7147413, 0.7056198, -0.4311224, 0, 0, 0, 1, 1,
-0.7108423, 0.4829388, -2.783489, 0, 0, 0, 1, 1,
-0.7104579, -0.7795081, -2.344913, 0, 0, 0, 1, 1,
-0.7099084, 0.8559722, 0.1414007, 0, 0, 0, 1, 1,
-0.7065713, -1.943936, -2.379571, 0, 0, 0, 1, 1,
-0.6950583, 0.8365547, -1.101457, 0, 0, 0, 1, 1,
-0.6819342, -0.8489498, -1.017488, 0, 0, 0, 1, 1,
-0.6817495, -1.766056, -1.713081, 1, 1, 1, 1, 1,
-0.6796346, 1.819461, 0.1974594, 1, 1, 1, 1, 1,
-0.6785926, -1.605875, -2.342904, 1, 1, 1, 1, 1,
-0.6738117, 1.311751, 0.217129, 1, 1, 1, 1, 1,
-0.6721133, 0.2535097, -4.854563, 1, 1, 1, 1, 1,
-0.6675981, 0.002441931, -1.581349, 1, 1, 1, 1, 1,
-0.6672667, -0.2781946, -4.210308, 1, 1, 1, 1, 1,
-0.6632692, -2.024903, -2.306853, 1, 1, 1, 1, 1,
-0.6621011, -0.5445561, -0.9787104, 1, 1, 1, 1, 1,
-0.6600161, 0.2592075, -2.13564, 1, 1, 1, 1, 1,
-0.6598693, -0.2129169, -2.152651, 1, 1, 1, 1, 1,
-0.6577998, 0.325758, 0.3914849, 1, 1, 1, 1, 1,
-0.6549, -1.726026, -2.354846, 1, 1, 1, 1, 1,
-0.6541873, -0.1827268, -2.531985, 1, 1, 1, 1, 1,
-0.6529632, 1.30376, -1.371854, 1, 1, 1, 1, 1,
-0.6519036, -1.562015, -2.67895, 0, 0, 1, 1, 1,
-0.6509854, -0.4600659, -5.451564, 1, 0, 0, 1, 1,
-0.6503863, 0.9576408, 0.6648329, 1, 0, 0, 1, 1,
-0.6452918, -0.3965606, -3.379395, 1, 0, 0, 1, 1,
-0.6441466, 0.1180361, -1.416587, 1, 0, 0, 1, 1,
-0.6388299, -1.228743, -2.108609, 1, 0, 0, 1, 1,
-0.634461, 1.112187, -0.8362952, 0, 0, 0, 1, 1,
-0.6213284, -0.04604727, -0.3586034, 0, 0, 0, 1, 1,
-0.619519, 0.5036855, -1.077671, 0, 0, 0, 1, 1,
-0.6182434, -0.3084714, -3.68573, 0, 0, 0, 1, 1,
-0.6172172, 0.8124204, -1.05155, 0, 0, 0, 1, 1,
-0.6104897, 1.813549, 0.06867106, 0, 0, 0, 1, 1,
-0.6074461, -1.197542, -2.435233, 0, 0, 0, 1, 1,
-0.6057642, -0.1478482, -2.325175, 1, 1, 1, 1, 1,
-0.603568, 0.7329483, -1.825032, 1, 1, 1, 1, 1,
-0.6004747, -0.9845591, -2.292783, 1, 1, 1, 1, 1,
-0.5997725, 1.275098, 0.5404373, 1, 1, 1, 1, 1,
-0.5880107, 1.516279, 0.1577908, 1, 1, 1, 1, 1,
-0.586383, -1.136078, -0.9671671, 1, 1, 1, 1, 1,
-0.5822055, -0.097621, -2.807443, 1, 1, 1, 1, 1,
-0.5818206, 0.199484, -0.5899463, 1, 1, 1, 1, 1,
-0.5815364, 0.2097228, -0.9692781, 1, 1, 1, 1, 1,
-0.5797917, -0.3316197, -1.770836, 1, 1, 1, 1, 1,
-0.5797895, 1.680414, -0.07342339, 1, 1, 1, 1, 1,
-0.5793045, 1.38994, -0.5308077, 1, 1, 1, 1, 1,
-0.5780165, -0.09465608, -2.882837, 1, 1, 1, 1, 1,
-0.5770814, -0.2281067, -2.778578, 1, 1, 1, 1, 1,
-0.5765043, 0.859833, -0.767212, 1, 1, 1, 1, 1,
-0.5736635, -0.4673236, -3.542261, 0, 0, 1, 1, 1,
-0.5707569, -0.8230552, -2.091771, 1, 0, 0, 1, 1,
-0.570283, 0.2718154, -1.225052, 1, 0, 0, 1, 1,
-0.5599828, -0.2954627, -1.680889, 1, 0, 0, 1, 1,
-0.5595958, 0.3713208, -1.133886, 1, 0, 0, 1, 1,
-0.5595175, -0.2794159, -3.280161, 1, 0, 0, 1, 1,
-0.5527601, 0.4373705, -0.5992488, 0, 0, 0, 1, 1,
-0.5469455, 0.02481637, -2.37842, 0, 0, 0, 1, 1,
-0.5461029, 1.340004, -1.768839, 0, 0, 0, 1, 1,
-0.5428132, -0.5314403, -2.711937, 0, 0, 0, 1, 1,
-0.5380365, -0.5244312, -0.04470149, 0, 0, 0, 1, 1,
-0.5341884, 0.6194512, -0.8568889, 0, 0, 0, 1, 1,
-0.5325173, -1.453544, -3.219085, 0, 0, 0, 1, 1,
-0.5321055, -0.5022628, -1.758493, 1, 1, 1, 1, 1,
-0.531324, 0.5198514, -0.4941433, 1, 1, 1, 1, 1,
-0.5313057, 1.035386, -2.359055, 1, 1, 1, 1, 1,
-0.5267747, -0.7297333, -2.239736, 1, 1, 1, 1, 1,
-0.5267264, 0.4159475, -0.6653132, 1, 1, 1, 1, 1,
-0.5204229, -0.1926043, -2.573, 1, 1, 1, 1, 1,
-0.5197234, 0.5743346, -1.900129, 1, 1, 1, 1, 1,
-0.5193898, -1.223725, -2.532822, 1, 1, 1, 1, 1,
-0.516167, 1.119934, -0.5407882, 1, 1, 1, 1, 1,
-0.5128289, 0.7976834, -1.426643, 1, 1, 1, 1, 1,
-0.5117891, -0.1966681, -2.874878, 1, 1, 1, 1, 1,
-0.5117299, 0.6612648, 0.1892168, 1, 1, 1, 1, 1,
-0.4997164, -0.07041775, -1.183067, 1, 1, 1, 1, 1,
-0.4961076, 1.695599, -0.5929883, 1, 1, 1, 1, 1,
-0.4907048, -0.2010968, -1.565837, 1, 1, 1, 1, 1,
-0.4903014, -1.195199, -2.961365, 0, 0, 1, 1, 1,
-0.4898589, -1.670938, -1.853966, 1, 0, 0, 1, 1,
-0.4878702, 1.884588, 0.4373992, 1, 0, 0, 1, 1,
-0.4834808, 0.7585902, -0.5491031, 1, 0, 0, 1, 1,
-0.4789468, 1.028923, -0.8641211, 1, 0, 0, 1, 1,
-0.4768347, -0.08388551, -0.2576979, 1, 0, 0, 1, 1,
-0.4742123, 0.8561974, -0.6565231, 0, 0, 0, 1, 1,
-0.4713295, -0.5677517, -4.577059, 0, 0, 0, 1, 1,
-0.4710546, -0.9640206, -2.087503, 0, 0, 0, 1, 1,
-0.4695269, 1.029474, -0.0655354, 0, 0, 0, 1, 1,
-0.4688304, 0.02369487, -1.657964, 0, 0, 0, 1, 1,
-0.4682556, -0.8826378, -2.079235, 0, 0, 0, 1, 1,
-0.4668273, 1.696581, 0.1004292, 0, 0, 0, 1, 1,
-0.4666271, -0.7831035, -1.358007, 1, 1, 1, 1, 1,
-0.4617177, 0.4516671, -0.2352688, 1, 1, 1, 1, 1,
-0.4585913, -0.4363388, -3.240088, 1, 1, 1, 1, 1,
-0.4531013, 0.2291858, -2.090687, 1, 1, 1, 1, 1,
-0.4522911, -1.218707, -3.289973, 1, 1, 1, 1, 1,
-0.4480892, 0.7338979, -2.074688, 1, 1, 1, 1, 1,
-0.4428968, -0.2815061, -2.902075, 1, 1, 1, 1, 1,
-0.4428097, -1.060081, -3.850424, 1, 1, 1, 1, 1,
-0.442213, 0.6648714, -0.9285238, 1, 1, 1, 1, 1,
-0.4411015, -0.2037206, -1.195839, 1, 1, 1, 1, 1,
-0.4388084, -1.652313, -3.439302, 1, 1, 1, 1, 1,
-0.438253, -0.8639379, -0.8131394, 1, 1, 1, 1, 1,
-0.4351724, 1.483868, -1.70594, 1, 1, 1, 1, 1,
-0.4339475, -1.474799, -1.931389, 1, 1, 1, 1, 1,
-0.4320301, 0.02601301, -2.546192, 1, 1, 1, 1, 1,
-0.4314627, 0.7197468, 0.01111543, 0, 0, 1, 1, 1,
-0.4268214, -0.4143607, -2.333187, 1, 0, 0, 1, 1,
-0.4235399, 0.9059588, 0.06407627, 1, 0, 0, 1, 1,
-0.4209001, -0.5700336, -1.414023, 1, 0, 0, 1, 1,
-0.4168587, 1.660342, 0.2436377, 1, 0, 0, 1, 1,
-0.4149337, -0.2904081, -0.6856365, 1, 0, 0, 1, 1,
-0.4113312, 0.5186246, -1.205345, 0, 0, 0, 1, 1,
-0.4109379, 0.1480457, -2.976353, 0, 0, 0, 1, 1,
-0.406757, 0.6875678, -0.7160665, 0, 0, 0, 1, 1,
-0.4050801, 0.08802124, -2.069691, 0, 0, 0, 1, 1,
-0.3951079, -0.225079, -4.087944, 0, 0, 0, 1, 1,
-0.3903027, -0.6579258, -2.776816, 0, 0, 0, 1, 1,
-0.3838488, -0.4607203, -2.196868, 0, 0, 0, 1, 1,
-0.3823259, 0.1016856, -1.037772, 1, 1, 1, 1, 1,
-0.3823093, 0.4096198, -1.574888, 1, 1, 1, 1, 1,
-0.3805171, -0.1289753, -3.569576, 1, 1, 1, 1, 1,
-0.3792142, 0.1356843, -0.9346446, 1, 1, 1, 1, 1,
-0.3734892, -0.3127727, -2.377799, 1, 1, 1, 1, 1,
-0.370951, -0.723119, -1.270346, 1, 1, 1, 1, 1,
-0.3642928, -0.6881219, -2.75045, 1, 1, 1, 1, 1,
-0.3611288, 0.5269597, 1.026141, 1, 1, 1, 1, 1,
-0.3603348, -0.06439518, -1.913991, 1, 1, 1, 1, 1,
-0.3562386, 1.444556, 0.6347138, 1, 1, 1, 1, 1,
-0.35372, -0.04141461, -0.5243103, 1, 1, 1, 1, 1,
-0.3492856, 0.6614723, -1.190581, 1, 1, 1, 1, 1,
-0.3476948, -0.4533264, -2.457667, 1, 1, 1, 1, 1,
-0.3463356, 1.318978, -0.4690361, 1, 1, 1, 1, 1,
-0.3410354, 0.6655324, -0.2682356, 1, 1, 1, 1, 1,
-0.3347067, 0.1778696, -1.203381, 0, 0, 1, 1, 1,
-0.3318129, 0.2705432, -1.215391, 1, 0, 0, 1, 1,
-0.3158818, 0.7899352, -0.1715087, 1, 0, 0, 1, 1,
-0.3150983, 0.03797515, 0.366453, 1, 0, 0, 1, 1,
-0.3123507, 0.461054, -0.03492924, 1, 0, 0, 1, 1,
-0.3109896, 1.748376, 0.2142295, 1, 0, 0, 1, 1,
-0.3099756, -0.987296, -1.991391, 0, 0, 0, 1, 1,
-0.3084873, -0.1595406, -2.055844, 0, 0, 0, 1, 1,
-0.3074165, 0.9716939, 0.02688256, 0, 0, 0, 1, 1,
-0.301234, 0.4699789, 0.6679845, 0, 0, 0, 1, 1,
-0.2933636, -2.095438, -2.011644, 0, 0, 0, 1, 1,
-0.2822401, -1.277676, -2.812623, 0, 0, 0, 1, 1,
-0.2804963, -0.08204105, 0.1229211, 0, 0, 0, 1, 1,
-0.2757768, 0.03419747, -1.649843, 1, 1, 1, 1, 1,
-0.2756813, -0.6172139, -4.657073, 1, 1, 1, 1, 1,
-0.2731854, -0.8348652, -3.763505, 1, 1, 1, 1, 1,
-0.2707987, 0.1302009, -1.572883, 1, 1, 1, 1, 1,
-0.2694193, 1.085833, -2.305761, 1, 1, 1, 1, 1,
-0.2610919, -0.1737858, -1.102273, 1, 1, 1, 1, 1,
-0.2552614, -0.9060584, -2.509397, 1, 1, 1, 1, 1,
-0.2552405, -0.4619265, -2.136081, 1, 1, 1, 1, 1,
-0.2532517, -0.2853646, -2.113312, 1, 1, 1, 1, 1,
-0.250478, 1.00126, -0.8404722, 1, 1, 1, 1, 1,
-0.2501009, -0.2546206, -3.672077, 1, 1, 1, 1, 1,
-0.2486981, -0.2034286, -3.111247, 1, 1, 1, 1, 1,
-0.2393928, 0.2856693, -0.5455377, 1, 1, 1, 1, 1,
-0.2385951, 0.7260506, 0.8769687, 1, 1, 1, 1, 1,
-0.234541, -0.7624516, -3.445188, 1, 1, 1, 1, 1,
-0.2330789, -0.8687388, -2.44716, 0, 0, 1, 1, 1,
-0.2319147, -0.7491434, -2.41282, 1, 0, 0, 1, 1,
-0.225926, -0.2713995, -3.121476, 1, 0, 0, 1, 1,
-0.2234314, 1.213362, -1.414103, 1, 0, 0, 1, 1,
-0.220118, 0.6329493, -0.6773452, 1, 0, 0, 1, 1,
-0.2164551, 0.885041, -0.454084, 1, 0, 0, 1, 1,
-0.2159318, 1.874385, -0.2479172, 0, 0, 0, 1, 1,
-0.2136555, 0.4581823, -1.152851, 0, 0, 0, 1, 1,
-0.2087657, -1.794348, -3.721372, 0, 0, 0, 1, 1,
-0.2039848, 0.1418187, -2.151927, 0, 0, 0, 1, 1,
-0.1976059, 0.8004625, 0.3777446, 0, 0, 0, 1, 1,
-0.1961495, 0.5312703, -0.3588266, 0, 0, 0, 1, 1,
-0.193223, -0.007295865, -0.0986205, 0, 0, 0, 1, 1,
-0.1914429, 0.7583596, -1.419504, 1, 1, 1, 1, 1,
-0.1892148, 0.1736735, -0.7568976, 1, 1, 1, 1, 1,
-0.1891404, -0.8182178, -3.427389, 1, 1, 1, 1, 1,
-0.1837826, -0.3845741, -3.500306, 1, 1, 1, 1, 1,
-0.1827769, 0.03868422, 1.083214, 1, 1, 1, 1, 1,
-0.1822798, 1.307495, 1.913871, 1, 1, 1, 1, 1,
-0.1781228, 0.1510991, -0.03268253, 1, 1, 1, 1, 1,
-0.1765462, 0.5200274, -1.000583, 1, 1, 1, 1, 1,
-0.1740121, -0.8715687, -3.173346, 1, 1, 1, 1, 1,
-0.1734937, 0.176835, -3.087495, 1, 1, 1, 1, 1,
-0.1702009, -0.2582333, -1.515244, 1, 1, 1, 1, 1,
-0.1672788, 0.2394549, 1.409383, 1, 1, 1, 1, 1,
-0.1615802, 0.3055992, -0.5006778, 1, 1, 1, 1, 1,
-0.1590337, -0.1503266, -3.166093, 1, 1, 1, 1, 1,
-0.1560262, -0.2710602, -1.867808, 1, 1, 1, 1, 1,
-0.150277, 0.5062872, 0.2907259, 0, 0, 1, 1, 1,
-0.1460047, -0.01474503, -1.207541, 1, 0, 0, 1, 1,
-0.1451267, 1.205612, 0.0328483, 1, 0, 0, 1, 1,
-0.144364, -0.2981329, -2.564467, 1, 0, 0, 1, 1,
-0.1418592, -0.3436078, -0.5171083, 1, 0, 0, 1, 1,
-0.1360799, -0.8493279, -2.616148, 1, 0, 0, 1, 1,
-0.1339605, 1.23317, -0.319147, 0, 0, 0, 1, 1,
-0.1318866, 0.2452595, 0.4893851, 0, 0, 0, 1, 1,
-0.124045, 0.1058511, -0.4938905, 0, 0, 0, 1, 1,
-0.1208294, -0.8968872, -3.659476, 0, 0, 0, 1, 1,
-0.107863, -0.3881207, -3.263256, 0, 0, 0, 1, 1,
-0.104479, 1.38656, -0.8654936, 0, 0, 0, 1, 1,
-0.1006708, 0.2274453, 0.06519986, 0, 0, 0, 1, 1,
-0.10014, -0.79601, -3.853022, 1, 1, 1, 1, 1,
-0.09550267, -0.5973025, -1.888233, 1, 1, 1, 1, 1,
-0.09093299, 0.5039106, 0.1721252, 1, 1, 1, 1, 1,
-0.09009892, -0.8460088, -1.870581, 1, 1, 1, 1, 1,
-0.08913542, -0.8899208, -4.079488, 1, 1, 1, 1, 1,
-0.08770957, -1.16285, -5.103964, 1, 1, 1, 1, 1,
-0.08513092, 0.2392455, -1.63961, 1, 1, 1, 1, 1,
-0.08511243, -0.120529, -2.792773, 1, 1, 1, 1, 1,
-0.08426502, 1.130801, -0.9580902, 1, 1, 1, 1, 1,
-0.07822425, 1.122416, -1.09322, 1, 1, 1, 1, 1,
-0.07061936, 0.3586231, -0.02091195, 1, 1, 1, 1, 1,
-0.06951179, 0.6693482, 0.0865702, 1, 1, 1, 1, 1,
-0.06536477, -1.038489, -3.125526, 1, 1, 1, 1, 1,
-0.06298668, -0.3001035, -2.811114, 1, 1, 1, 1, 1,
-0.0605349, 0.2539817, -2.560794, 1, 1, 1, 1, 1,
-0.06041184, 0.3691512, 1.894177, 0, 0, 1, 1, 1,
-0.05719945, 0.8961197, 0.1482259, 1, 0, 0, 1, 1,
-0.05687107, 0.4557979, 0.4296394, 1, 0, 0, 1, 1,
-0.05420127, -2.316258, -3.106817, 1, 0, 0, 1, 1,
-0.04879842, 1.093122, 0.1038802, 1, 0, 0, 1, 1,
-0.04791863, -2.546091, -0.1194604, 1, 0, 0, 1, 1,
-0.0463642, -0.4493147, -3.44318, 0, 0, 0, 1, 1,
-0.0390261, 1.103586, 1.820418, 0, 0, 0, 1, 1,
-0.03385441, 1.075214, 0.9891141, 0, 0, 0, 1, 1,
-0.03219878, -0.2180657, -1.30401, 0, 0, 0, 1, 1,
-0.02988742, 0.02454478, -0.7582577, 0, 0, 0, 1, 1,
-0.02475456, -0.005895579, -3.344339, 0, 0, 0, 1, 1,
-0.02368607, -0.8243649, -3.434086, 0, 0, 0, 1, 1,
-0.02141658, 0.2527688, -0.4343198, 1, 1, 1, 1, 1,
-0.01960009, 1.034081, 1.407312, 1, 1, 1, 1, 1,
-0.0174329, 2.843327, -0.2611349, 1, 1, 1, 1, 1,
-0.01557891, -0.6162481, -2.660074, 1, 1, 1, 1, 1,
-0.01445711, -0.3714549, -3.124934, 1, 1, 1, 1, 1,
-0.009618255, -0.4214233, -3.181686, 1, 1, 1, 1, 1,
-0.006479472, -1.692262, -3.006756, 1, 1, 1, 1, 1,
-0.00611338, 1.17954, 0.6416762, 1, 1, 1, 1, 1,
-0.003056051, -0.4774351, -4.020743, 1, 1, 1, 1, 1,
0.002222823, -0.5703568, 3.977142, 1, 1, 1, 1, 1,
0.005474742, 1.100152, -0.2252936, 1, 1, 1, 1, 1,
0.006528421, 0.4118268, 0.2392031, 1, 1, 1, 1, 1,
0.009058163, 1.333557, 1.23514, 1, 1, 1, 1, 1,
0.009159509, 0.559019, 0.7870203, 1, 1, 1, 1, 1,
0.01171134, 0.3166343, 0.2712855, 1, 1, 1, 1, 1,
0.01395356, 1.823037, 0.2559208, 0, 0, 1, 1, 1,
0.0148627, 0.5456179, 0.8048401, 1, 0, 0, 1, 1,
0.02148534, 0.857188, 0.6428564, 1, 0, 0, 1, 1,
0.02250364, 0.9606141, -0.3381883, 1, 0, 0, 1, 1,
0.02741436, 2.240657, 0.5578679, 1, 0, 0, 1, 1,
0.02822406, 0.2731206, -0.2751622, 1, 0, 0, 1, 1,
0.02833355, -0.4039456, 2.976083, 0, 0, 0, 1, 1,
0.02901045, 0.1735026, 0.2109581, 0, 0, 0, 1, 1,
0.0292295, -0.1779943, 3.957957, 0, 0, 0, 1, 1,
0.03083282, -0.3980952, 3.301187, 0, 0, 0, 1, 1,
0.03212047, 0.2357602, -0.3167264, 0, 0, 0, 1, 1,
0.03410657, 0.291389, -0.3358132, 0, 0, 0, 1, 1,
0.03433751, 0.3494129, -0.6153041, 0, 0, 0, 1, 1,
0.03627703, -0.8347698, 3.801966, 1, 1, 1, 1, 1,
0.03916612, 0.1280481, 0.6461803, 1, 1, 1, 1, 1,
0.04143148, 0.6408297, -1.610616, 1, 1, 1, 1, 1,
0.04474078, 0.6498515, -0.7039602, 1, 1, 1, 1, 1,
0.04624264, 0.9923227, 0.8391802, 1, 1, 1, 1, 1,
0.05034601, -2.059357, 2.713515, 1, 1, 1, 1, 1,
0.05589419, -0.2937942, 2.628037, 1, 1, 1, 1, 1,
0.05812357, -0.2540222, 3.584028, 1, 1, 1, 1, 1,
0.06228701, 0.1703296, 0.183405, 1, 1, 1, 1, 1,
0.06482861, -0.6064569, 3.009453, 1, 1, 1, 1, 1,
0.06652023, -0.3520936, 2.226065, 1, 1, 1, 1, 1,
0.06984099, 1.920247, -1.21714, 1, 1, 1, 1, 1,
0.07473435, 1.779977, -0.3185329, 1, 1, 1, 1, 1,
0.07756519, 0.5903828, -1.960185, 1, 1, 1, 1, 1,
0.07788217, 1.513425, 0.7247756, 1, 1, 1, 1, 1,
0.08000523, 0.772553, 0.8719687, 0, 0, 1, 1, 1,
0.08090331, -0.1033898, 4.091456, 1, 0, 0, 1, 1,
0.0818939, 0.5920688, -1.189745, 1, 0, 0, 1, 1,
0.08939887, -0.5156665, 2.844898, 1, 0, 0, 1, 1,
0.09136477, -2.917868, 1.486144, 1, 0, 0, 1, 1,
0.09159847, 0.8635502, -0.3795922, 1, 0, 0, 1, 1,
0.09404347, 0.8686865, 0.8320124, 0, 0, 0, 1, 1,
0.09491714, -0.9760867, 2.903522, 0, 0, 0, 1, 1,
0.09728967, -0.1477416, 1.227579, 0, 0, 0, 1, 1,
0.09980422, 1.227424, -0.2416038, 0, 0, 0, 1, 1,
0.1052189, 1.137987, -0.4354342, 0, 0, 0, 1, 1,
0.1112586, 0.7235547, -0.1668955, 0, 0, 0, 1, 1,
0.112086, -0.01512163, 1.03709, 0, 0, 0, 1, 1,
0.1138552, 0.5948365, -0.6686463, 1, 1, 1, 1, 1,
0.1149595, -0.8923709, 2.001827, 1, 1, 1, 1, 1,
0.1170103, 0.5005787, 0.09322831, 1, 1, 1, 1, 1,
0.1186239, 3.197395, 0.4716972, 1, 1, 1, 1, 1,
0.1231026, -0.8025603, 2.115445, 1, 1, 1, 1, 1,
0.1244826, -1.460349, 2.66626, 1, 1, 1, 1, 1,
0.1258156, -0.1703233, 2.854049, 1, 1, 1, 1, 1,
0.1271625, 3.757858, 0.1315978, 1, 1, 1, 1, 1,
0.1305077, -0.07657581, 4.771104, 1, 1, 1, 1, 1,
0.1308802, 1.027697, 1.587606, 1, 1, 1, 1, 1,
0.1324517, -1.625775, 2.472975, 1, 1, 1, 1, 1,
0.1351607, 1.054286, 0.9166613, 1, 1, 1, 1, 1,
0.1355052, 2.145487, 1.355848, 1, 1, 1, 1, 1,
0.1391634, 1.786873, -0.3293327, 1, 1, 1, 1, 1,
0.139324, 0.7569923, 1.056007, 1, 1, 1, 1, 1,
0.140557, 1.524259, -0.928337, 0, 0, 1, 1, 1,
0.1409685, 0.4166521, -1.006328, 1, 0, 0, 1, 1,
0.146947, 0.2304627, 0.6085286, 1, 0, 0, 1, 1,
0.1481005, -0.7116559, 5.367996, 1, 0, 0, 1, 1,
0.150324, 0.978918, -1.030392, 1, 0, 0, 1, 1,
0.1522191, -0.7225431, 3.189944, 1, 0, 0, 1, 1,
0.1566678, -0.26362, 0.8855097, 0, 0, 0, 1, 1,
0.1568575, -0.3207968, 1.640855, 0, 0, 0, 1, 1,
0.1575147, 0.1092081, 1.760725, 0, 0, 0, 1, 1,
0.1576453, 1.857259, -0.07629918, 0, 0, 0, 1, 1,
0.159878, -0.9789788, 2.622712, 0, 0, 0, 1, 1,
0.1603291, -0.4964021, 1.913319, 0, 0, 0, 1, 1,
0.1612838, 1.41584, -0.05416633, 0, 0, 0, 1, 1,
0.1702848, -0.1916499, 2.768883, 1, 1, 1, 1, 1,
0.1704177, -0.3887147, 2.935588, 1, 1, 1, 1, 1,
0.1715106, -1.308606, 3.102739, 1, 1, 1, 1, 1,
0.1722363, -1.316301, 4.297194, 1, 1, 1, 1, 1,
0.1746954, 0.2572422, -0.1229188, 1, 1, 1, 1, 1,
0.1786919, 1.356227, 0.1115801, 1, 1, 1, 1, 1,
0.1789226, -0.06376243, -0.01715496, 1, 1, 1, 1, 1,
0.1799643, -2.563938, 2.372213, 1, 1, 1, 1, 1,
0.1869972, 0.6753446, -0.07323367, 1, 1, 1, 1, 1,
0.1871033, -0.1763097, 3.273175, 1, 1, 1, 1, 1,
0.1875385, -0.215335, 1.763419, 1, 1, 1, 1, 1,
0.1886531, -0.941385, 4.552956, 1, 1, 1, 1, 1,
0.1906321, -0.3989858, 3.824333, 1, 1, 1, 1, 1,
0.1929294, 0.0299466, 0.3083563, 1, 1, 1, 1, 1,
0.1954747, 0.9753059, 0.005507261, 1, 1, 1, 1, 1,
0.1958203, -2.302967, 2.772664, 0, 0, 1, 1, 1,
0.1985671, 0.2862251, 0.2216521, 1, 0, 0, 1, 1,
0.198663, 0.08196983, 2.003495, 1, 0, 0, 1, 1,
0.2082542, -0.003658753, 1.81067, 1, 0, 0, 1, 1,
0.2083238, -0.9375774, 2.673405, 1, 0, 0, 1, 1,
0.2123353, 0.1973903, 0.3754212, 1, 0, 0, 1, 1,
0.2137759, -0.8647477, 2.810974, 0, 0, 0, 1, 1,
0.2142162, -1.895366, 3.735002, 0, 0, 0, 1, 1,
0.2143131, -0.6651427, 2.181076, 0, 0, 0, 1, 1,
0.217199, -1.511807, 2.420638, 0, 0, 0, 1, 1,
0.2199786, -0.4187919, 2.223427, 0, 0, 0, 1, 1,
0.2238606, 0.5600778, -0.3886653, 0, 0, 0, 1, 1,
0.2259804, 1.986462, 2.702626, 0, 0, 0, 1, 1,
0.2267535, -0.5171382, 3.917886, 1, 1, 1, 1, 1,
0.2269854, -1.93458, 3.818358, 1, 1, 1, 1, 1,
0.2270966, -0.5790497, 3.362423, 1, 1, 1, 1, 1,
0.2302094, -0.7639033, 3.59276, 1, 1, 1, 1, 1,
0.2337177, 0.3217615, 0.7012843, 1, 1, 1, 1, 1,
0.2397678, 0.582647, -0.6775786, 1, 1, 1, 1, 1,
0.2404777, -0.191205, 2.437078, 1, 1, 1, 1, 1,
0.2479936, -0.000258821, 0.4022586, 1, 1, 1, 1, 1,
0.2485924, 2.09561, 2.121921, 1, 1, 1, 1, 1,
0.2520665, -0.1948759, 1.159929, 1, 1, 1, 1, 1,
0.2543727, 0.3432081, 1.51172, 1, 1, 1, 1, 1,
0.2556293, -1.326147, 3.282933, 1, 1, 1, 1, 1,
0.256106, 0.852964, -1.229949, 1, 1, 1, 1, 1,
0.2592978, -0.7886113, 3.114141, 1, 1, 1, 1, 1,
0.2645789, -0.143926, 1.45233, 1, 1, 1, 1, 1,
0.2655132, 1.21402, 1.004275, 0, 0, 1, 1, 1,
0.2669646, 0.1987753, 1.557626, 1, 0, 0, 1, 1,
0.2719965, -1.208213, 2.569549, 1, 0, 0, 1, 1,
0.273868, 0.5461592, 0.1149768, 1, 0, 0, 1, 1,
0.2741391, 1.264869, 0.7856407, 1, 0, 0, 1, 1,
0.2786525, -1.401003, 2.356447, 1, 0, 0, 1, 1,
0.2790509, -1.406066, 3.356725, 0, 0, 0, 1, 1,
0.2811999, 0.08818296, 0.2216862, 0, 0, 0, 1, 1,
0.2832151, -1.71933, 0.9987808, 0, 0, 0, 1, 1,
0.2862961, 1.403109, 1.459219, 0, 0, 0, 1, 1,
0.2864686, 0.4714296, 0.2182602, 0, 0, 0, 1, 1,
0.2882964, -0.386353, 3.75405, 0, 0, 0, 1, 1,
0.2910292, -0.1055682, 2.168256, 0, 0, 0, 1, 1,
0.2970609, -1.010865, 1.171263, 1, 1, 1, 1, 1,
0.2973939, -1.169312, 2.161092, 1, 1, 1, 1, 1,
0.297913, 0.1026125, 1.150762, 1, 1, 1, 1, 1,
0.3023856, -0.0005752546, 0.2010188, 1, 1, 1, 1, 1,
0.3030488, -0.5136154, 1.959001, 1, 1, 1, 1, 1,
0.3106412, -1.104027, 4.306462, 1, 1, 1, 1, 1,
0.311096, -0.87547, 2.434705, 1, 1, 1, 1, 1,
0.3113663, -0.175045, 2.682978, 1, 1, 1, 1, 1,
0.311517, -0.7696405, 3.570518, 1, 1, 1, 1, 1,
0.3136924, -0.3141615, 1.834596, 1, 1, 1, 1, 1,
0.3153356, -2.21677, 3.228365, 1, 1, 1, 1, 1,
0.3164184, 0.480399, -0.5880275, 1, 1, 1, 1, 1,
0.3213202, 0.3382467, 0.8401028, 1, 1, 1, 1, 1,
0.32276, -0.4177705, 2.882344, 1, 1, 1, 1, 1,
0.3232471, -0.9147502, 2.015841, 1, 1, 1, 1, 1,
0.330653, -1.832627, 1.504913, 0, 0, 1, 1, 1,
0.3322099, 1.439294, 0.3606607, 1, 0, 0, 1, 1,
0.3332564, -0.5237648, 2.405444, 1, 0, 0, 1, 1,
0.334517, 1.026489, -1.230154, 1, 0, 0, 1, 1,
0.3352138, -0.1022548, 0.3941635, 1, 0, 0, 1, 1,
0.3423399, -0.2673114, 2.258146, 1, 0, 0, 1, 1,
0.3450453, -0.7706943, 3.401647, 0, 0, 0, 1, 1,
0.3456949, -1.64066, 1.913518, 0, 0, 0, 1, 1,
0.3468091, -0.5943326, 2.707979, 0, 0, 0, 1, 1,
0.3470545, -0.7233535, 2.300563, 0, 0, 0, 1, 1,
0.3478004, 0.3781995, 1.061245, 0, 0, 0, 1, 1,
0.3515552, 1.442892, -0.690078, 0, 0, 0, 1, 1,
0.3523163, 0.114751, 2.728994, 0, 0, 0, 1, 1,
0.3532518, -0.9950579, 1.879656, 1, 1, 1, 1, 1,
0.3554212, -2.004072, 2.375526, 1, 1, 1, 1, 1,
0.357146, 0.1006034, 0.4993202, 1, 1, 1, 1, 1,
0.3583916, -0.8128881, 2.464668, 1, 1, 1, 1, 1,
0.3644962, 2.841498, 1.322599, 1, 1, 1, 1, 1,
0.3651918, -0.3015042, 2.008338, 1, 1, 1, 1, 1,
0.3670862, -1.013821, 2.434016, 1, 1, 1, 1, 1,
0.3682824, 1.956983, 1.169725, 1, 1, 1, 1, 1,
0.3693703, 1.280688, -0.01542481, 1, 1, 1, 1, 1,
0.3695737, 0.4117148, 0.3520827, 1, 1, 1, 1, 1,
0.3711015, -0.6458266, 1.745229, 1, 1, 1, 1, 1,
0.3795253, -0.08662105, 1.17976, 1, 1, 1, 1, 1,
0.382031, -0.5534294, 3.094167, 1, 1, 1, 1, 1,
0.3874504, -0.5466965, 2.506493, 1, 1, 1, 1, 1,
0.389399, -0.1420294, 4.206137, 1, 1, 1, 1, 1,
0.3925879, -0.04999571, 0.9759057, 0, 0, 1, 1, 1,
0.3941255, -1.015457, 1.096018, 1, 0, 0, 1, 1,
0.3949662, -0.5674484, 3.625859, 1, 0, 0, 1, 1,
0.3958341, 1.173443, 1.004153, 1, 0, 0, 1, 1,
0.4006432, 1.259447, 0.3154394, 1, 0, 0, 1, 1,
0.4032522, -0.6057446, 2.287084, 1, 0, 0, 1, 1,
0.4050005, 0.7189364, 0.5024766, 0, 0, 0, 1, 1,
0.4057397, 0.1267673, 2.585237, 0, 0, 0, 1, 1,
0.4060964, -1.382534, 3.515794, 0, 0, 0, 1, 1,
0.4118682, 0.8414891, 0.2433783, 0, 0, 0, 1, 1,
0.4132627, 0.2956263, 1.066156, 0, 0, 0, 1, 1,
0.4179521, -0.2839206, 4.449053, 0, 0, 0, 1, 1,
0.4201881, -0.4557835, 2.644521, 0, 0, 0, 1, 1,
0.4204859, 0.562474, 1.15179, 1, 1, 1, 1, 1,
0.4205452, -1.275261, 2.837346, 1, 1, 1, 1, 1,
0.4211743, -0.04238167, 1.814828, 1, 1, 1, 1, 1,
0.4285548, -0.5656028, 1.032665, 1, 1, 1, 1, 1,
0.4343216, 0.1998533, 2.285587, 1, 1, 1, 1, 1,
0.4366843, -0.6486849, 4.597112, 1, 1, 1, 1, 1,
0.4374311, -0.3150979, 3.945014, 1, 1, 1, 1, 1,
0.4403852, -0.02552609, 1.04416, 1, 1, 1, 1, 1,
0.4417236, 0.9188892, 2.338844, 1, 1, 1, 1, 1,
0.4421025, 1.273597, -0.6868759, 1, 1, 1, 1, 1,
0.4424463, 0.4940619, 0.5889881, 1, 1, 1, 1, 1,
0.4425928, -0.07602728, 3.835149, 1, 1, 1, 1, 1,
0.4429638, -1.944559, 1.966386, 1, 1, 1, 1, 1,
0.4456373, -0.337419, 0.992987, 1, 1, 1, 1, 1,
0.4471662, 0.86781, 1.759958, 1, 1, 1, 1, 1,
0.4498732, -0.03774857, 1.792638, 0, 0, 1, 1, 1,
0.4502444, -2.387229, 4.249081, 1, 0, 0, 1, 1,
0.451391, -0.1030794, 1.574711, 1, 0, 0, 1, 1,
0.4531649, 0.2716381, 3.410487, 1, 0, 0, 1, 1,
0.4546977, 0.5381641, 0.7343423, 1, 0, 0, 1, 1,
0.4557244, 0.3479233, -1.217028, 1, 0, 0, 1, 1,
0.4587749, 0.7872314, 1.046945, 0, 0, 0, 1, 1,
0.4644714, -1.178387, 2.821826, 0, 0, 0, 1, 1,
0.4681387, 2.069934, -0.623885, 0, 0, 0, 1, 1,
0.4735882, -0.9218817, 2.833255, 0, 0, 0, 1, 1,
0.4792215, 0.8435974, 1.352175, 0, 0, 0, 1, 1,
0.4797033, 0.1212731, 1.018324, 0, 0, 0, 1, 1,
0.4797877, -1.047317, 2.82744, 0, 0, 0, 1, 1,
0.4819374, -0.05200784, 0.3130913, 1, 1, 1, 1, 1,
0.482278, 0.917049, 0.003467125, 1, 1, 1, 1, 1,
0.4824396, 0.9372699, -0.3623735, 1, 1, 1, 1, 1,
0.4842466, 0.6382095, -1.206982, 1, 1, 1, 1, 1,
0.4844001, 2.25689, -0.3153873, 1, 1, 1, 1, 1,
0.490131, -1.472052, 2.383342, 1, 1, 1, 1, 1,
0.4939908, 0.5364956, -0.2891745, 1, 1, 1, 1, 1,
0.5004418, -1.007676, 2.369416, 1, 1, 1, 1, 1,
0.5007209, -0.2162125, 2.861699, 1, 1, 1, 1, 1,
0.5075904, 0.6471866, 1.047918, 1, 1, 1, 1, 1,
0.50916, -0.1766835, 1.027588, 1, 1, 1, 1, 1,
0.5116399, 0.9166433, 0.7561745, 1, 1, 1, 1, 1,
0.5129669, -1.07465, 1.530572, 1, 1, 1, 1, 1,
0.5164729, 0.1961425, 1.063669, 1, 1, 1, 1, 1,
0.518273, -0.9584596, 1.948703, 1, 1, 1, 1, 1,
0.5207316, 0.1244138, 1.812129, 0, 0, 1, 1, 1,
0.5238417, -1.359386, 1.440208, 1, 0, 0, 1, 1,
0.5241498, 1.81239, -0.517468, 1, 0, 0, 1, 1,
0.5288361, -0.5526966, 2.81732, 1, 0, 0, 1, 1,
0.5299717, -0.9795004, 4.111794, 1, 0, 0, 1, 1,
0.5310857, 0.5245393, 2.204207, 1, 0, 0, 1, 1,
0.5315485, 1.534197, 1.642499, 0, 0, 0, 1, 1,
0.5335677, -1.251866, 3.11783, 0, 0, 0, 1, 1,
0.5359754, -0.07044641, 0.6453799, 0, 0, 0, 1, 1,
0.5368134, -1.125911, 5.504586, 0, 0, 0, 1, 1,
0.5378408, -1.032943, 1.464436, 0, 0, 0, 1, 1,
0.5476009, 0.7353755, -1.173318, 0, 0, 0, 1, 1,
0.5502836, -1.522934, 2.140809, 0, 0, 0, 1, 1,
0.550761, 0.7494568, -1.56898, 1, 1, 1, 1, 1,
0.5520213, -1.517017, 2.316933, 1, 1, 1, 1, 1,
0.5541609, 0.1269923, 2.193501, 1, 1, 1, 1, 1,
0.5558974, -0.008030175, 3.299017, 1, 1, 1, 1, 1,
0.5627451, -1.002139, 2.643044, 1, 1, 1, 1, 1,
0.5729782, -0.1323026, 1.492241, 1, 1, 1, 1, 1,
0.574002, -1.000455, 2.731261, 1, 1, 1, 1, 1,
0.5785777, 1.331235, 0.9508522, 1, 1, 1, 1, 1,
0.5798406, 1.416306, -1.6065, 1, 1, 1, 1, 1,
0.5808805, 0.267991, 0.02925377, 1, 1, 1, 1, 1,
0.5812684, 1.684499, 1.061213, 1, 1, 1, 1, 1,
0.5834235, -1.178004, 2.083352, 1, 1, 1, 1, 1,
0.5834586, 0.4651776, 1.40463, 1, 1, 1, 1, 1,
0.5889524, -0.120427, 1.53741, 1, 1, 1, 1, 1,
0.5898982, 1.076291, 1.350251, 1, 1, 1, 1, 1,
0.5931955, -1.508933, 3.615223, 0, 0, 1, 1, 1,
0.5934083, 0.4237685, 0.7481971, 1, 0, 0, 1, 1,
0.5941028, 2.015741, 0.03043415, 1, 0, 0, 1, 1,
0.5941782, -0.6871101, 3.052093, 1, 0, 0, 1, 1,
0.6004153, -0.3580151, 2.257233, 1, 0, 0, 1, 1,
0.6035944, 1.353717, 0.4524956, 1, 0, 0, 1, 1,
0.6086067, 0.2339987, 0.8083375, 0, 0, 0, 1, 1,
0.6124821, -0.7432093, 2.320654, 0, 0, 0, 1, 1,
0.612646, 0.7557117, 2.016148, 0, 0, 0, 1, 1,
0.6128387, 1.126334, 0.1345198, 0, 0, 0, 1, 1,
0.6128485, -0.4294538, 0.9745369, 0, 0, 0, 1, 1,
0.6150129, 3.669437, -0.08551843, 0, 0, 0, 1, 1,
0.6255085, -0.2970102, 1.87979, 0, 0, 0, 1, 1,
0.6292748, -1.319749, 2.194119, 1, 1, 1, 1, 1,
0.6316417, -2.554213, 4.402474, 1, 1, 1, 1, 1,
0.6344746, -0.690809, 1.833474, 1, 1, 1, 1, 1,
0.6350074, 2.402689, -0.09146269, 1, 1, 1, 1, 1,
0.6371288, -1.459604, 2.374529, 1, 1, 1, 1, 1,
0.6393161, 0.3874208, 0.2612844, 1, 1, 1, 1, 1,
0.642499, 0.721156, -0.5543371, 1, 1, 1, 1, 1,
0.6440829, -2.604629, 3.179797, 1, 1, 1, 1, 1,
0.6499643, -0.3554635, 0.9757259, 1, 1, 1, 1, 1,
0.65093, 0.6569635, 0.806114, 1, 1, 1, 1, 1,
0.6514307, -0.2275725, 2.40837, 1, 1, 1, 1, 1,
0.6516585, 0.3276235, 2.445762, 1, 1, 1, 1, 1,
0.6520369, -2.213264, 1.350124, 1, 1, 1, 1, 1,
0.6527603, 0.6884925, -0.03232129, 1, 1, 1, 1, 1,
0.6563559, 0.7860724, 0.2285229, 1, 1, 1, 1, 1,
0.6571995, 0.5544807, 0.07835082, 0, 0, 1, 1, 1,
0.6587662, 0.8963344, 0.1796813, 1, 0, 0, 1, 1,
0.65974, -1.323313, 2.586097, 1, 0, 0, 1, 1,
0.6623675, 0.9578588, 0.975733, 1, 0, 0, 1, 1,
0.6663961, -0.5487694, 3.217841, 1, 0, 0, 1, 1,
0.6682917, 1.479204, -1.297412, 1, 0, 0, 1, 1,
0.6687849, 1.491827, -0.3312724, 0, 0, 0, 1, 1,
0.674975, -1.776604, 2.414221, 0, 0, 0, 1, 1,
0.6764197, -0.384672, 1.463143, 0, 0, 0, 1, 1,
0.6804944, 1.943035, 0.5477795, 0, 0, 0, 1, 1,
0.6809487, -0.06133156, 1.645072, 0, 0, 0, 1, 1,
0.6845171, 1.99015, -0.0527647, 0, 0, 0, 1, 1,
0.6914662, -0.65141, 3.15254, 0, 0, 0, 1, 1,
0.6951176, -1.184349, 2.123201, 1, 1, 1, 1, 1,
0.7065734, -1.472492, 0.8707472, 1, 1, 1, 1, 1,
0.7088234, -1.320247, 3.780009, 1, 1, 1, 1, 1,
0.7122484, -2.147506, 1.738881, 1, 1, 1, 1, 1,
0.713716, 0.3745741, 1.532843, 1, 1, 1, 1, 1,
0.7184855, -1.055867, 1.774511, 1, 1, 1, 1, 1,
0.7189819, -0.7259801, 2.123531, 1, 1, 1, 1, 1,
0.7190761, 1.142034, 0.0755339, 1, 1, 1, 1, 1,
0.720302, -1.290164, 4.006841, 1, 1, 1, 1, 1,
0.720319, 1.33251, -0.4990879, 1, 1, 1, 1, 1,
0.7225423, -0.323929, 0.9575139, 1, 1, 1, 1, 1,
0.7270077, 0.423901, 1.890708, 1, 1, 1, 1, 1,
0.7330313, 0.5135065, 2.753145, 1, 1, 1, 1, 1,
0.7366285, -2.395935, 2.446605, 1, 1, 1, 1, 1,
0.7401716, -1.970785, 1.504192, 1, 1, 1, 1, 1,
0.7403895, -0.5705705, 1.045213, 0, 0, 1, 1, 1,
0.7438743, 0.555212, 2.209667, 1, 0, 0, 1, 1,
0.7506205, -1.541624, 2.105303, 1, 0, 0, 1, 1,
0.7506403, -2.00605, 3.231294, 1, 0, 0, 1, 1,
0.7566214, 1.109993, -2.355237, 1, 0, 0, 1, 1,
0.7630867, -1.123635, 2.679821, 1, 0, 0, 1, 1,
0.7698808, -0.8543428, 2.497616, 0, 0, 0, 1, 1,
0.774579, -0.7385035, 2.69296, 0, 0, 0, 1, 1,
0.7752289, -0.9878555, 2.731484, 0, 0, 0, 1, 1,
0.791275, -0.0818105, 2.550623, 0, 0, 0, 1, 1,
0.7920266, 0.6931673, 0.4366106, 0, 0, 0, 1, 1,
0.7939546, 0.3137029, 2.723455, 0, 0, 0, 1, 1,
0.7982101, -0.09938543, 1.450804, 0, 0, 0, 1, 1,
0.7995705, 1.568689, -0.386077, 1, 1, 1, 1, 1,
0.8092164, 0.8268089, 0.09244107, 1, 1, 1, 1, 1,
0.8095921, 0.7429525, -0.6589886, 1, 1, 1, 1, 1,
0.8183234, -0.3419507, 2.640026, 1, 1, 1, 1, 1,
0.8200156, 1.923202, -0.1113096, 1, 1, 1, 1, 1,
0.8222182, 0.09206582, 2.067885, 1, 1, 1, 1, 1,
0.822834, 0.07406948, 1.109194, 1, 1, 1, 1, 1,
0.8273861, -0.9321594, 1.892473, 1, 1, 1, 1, 1,
0.8276358, 0.02825452, 1.879685, 1, 1, 1, 1, 1,
0.8315586, 1.062569, 0.6638565, 1, 1, 1, 1, 1,
0.835101, -0.1915773, 1.608727, 1, 1, 1, 1, 1,
0.8371655, -0.2546214, 1.538894, 1, 1, 1, 1, 1,
0.8381062, -1.03662, 1.40746, 1, 1, 1, 1, 1,
0.8401775, 0.902698, 1.265409, 1, 1, 1, 1, 1,
0.8413678, 1.053474, 1.26695, 1, 1, 1, 1, 1,
0.84381, 0.02924293, 2.218825, 0, 0, 1, 1, 1,
0.8531124, -1.619167, 3.096266, 1, 0, 0, 1, 1,
0.8557904, -1.235121, 2.349326, 1, 0, 0, 1, 1,
0.8652326, 0.2430771, 1.500539, 1, 0, 0, 1, 1,
0.8659827, 0.8333094, 0.03260773, 1, 0, 0, 1, 1,
0.8710291, -1.703225, 2.54718, 1, 0, 0, 1, 1,
0.8715767, 1.426405, -0.1891739, 0, 0, 0, 1, 1,
0.8717812, 1.347264, -0.426675, 0, 0, 0, 1, 1,
0.8737208, 0.2067484, 1.983904, 0, 0, 0, 1, 1,
0.8781592, 0.3240086, 0.3590446, 0, 0, 0, 1, 1,
0.8808697, -0.4282599, 2.182347, 0, 0, 0, 1, 1,
0.8819212, -0.1736896, 0.5357981, 0, 0, 0, 1, 1,
0.8827665, -0.3620014, 1.157037, 0, 0, 0, 1, 1,
0.8966115, 0.2873349, 2.223797, 1, 1, 1, 1, 1,
0.9000393, -0.29608, 3.579826, 1, 1, 1, 1, 1,
0.9012291, -1.92264, 3.402011, 1, 1, 1, 1, 1,
0.9062617, 1.759408, -1.06857, 1, 1, 1, 1, 1,
0.9066276, 0.6777784, 0.4706916, 1, 1, 1, 1, 1,
0.913775, 1.211804, 2.759732, 1, 1, 1, 1, 1,
0.9169991, -0.230698, 1.771639, 1, 1, 1, 1, 1,
0.9177049, 1.236619, 1.162403, 1, 1, 1, 1, 1,
0.9218181, 0.2272427, -0.3111564, 1, 1, 1, 1, 1,
0.9219017, -0.1350062, 0.4482173, 1, 1, 1, 1, 1,
0.9231021, 0.4531492, 1.350027, 1, 1, 1, 1, 1,
0.9315032, 1.070502, 0.351709, 1, 1, 1, 1, 1,
0.9390923, 0.2710668, -0.9551049, 1, 1, 1, 1, 1,
0.9426153, 0.5652174, 1.125193, 1, 1, 1, 1, 1,
0.9464077, 1.539983, -0.5202547, 1, 1, 1, 1, 1,
0.9479327, -1.128319, 2.335408, 0, 0, 1, 1, 1,
0.9518198, 0.4036859, 2.934096, 1, 0, 0, 1, 1,
0.9554898, -0.3464281, 2.836443, 1, 0, 0, 1, 1,
0.95824, 0.00389174, 0.8947317, 1, 0, 0, 1, 1,
0.9587749, 0.2649529, 0.9149453, 1, 0, 0, 1, 1,
0.9601179, 0.1938664, -0.1017046, 1, 0, 0, 1, 1,
0.9688947, 0.9074245, 0.5008176, 0, 0, 0, 1, 1,
0.9711813, -0.8440866, 2.907871, 0, 0, 0, 1, 1,
0.9715047, 0.2727277, 2.570423, 0, 0, 0, 1, 1,
0.9720705, 0.1576886, 2.341513, 0, 0, 0, 1, 1,
0.9834005, 1.650031, -0.6547465, 0, 0, 0, 1, 1,
0.9976006, -0.5232122, 3.273232, 0, 0, 0, 1, 1,
0.9987405, -0.004270842, 1.30407, 0, 0, 0, 1, 1,
1.002367, -0.8021191, 1.852576, 1, 1, 1, 1, 1,
1.005391, -0.566523, 3.74429, 1, 1, 1, 1, 1,
1.008116, -0.9563051, 0.6672867, 1, 1, 1, 1, 1,
1.011878, 1.380021, 1.323036, 1, 1, 1, 1, 1,
1.020516, 0.549602, 2.309208, 1, 1, 1, 1, 1,
1.024889, 0.07085432, -0.9471504, 1, 1, 1, 1, 1,
1.028891, 0.1732868, 2.857834, 1, 1, 1, 1, 1,
1.031449, -1.010401, 1.267013, 1, 1, 1, 1, 1,
1.032511, -0.07827206, 1.032882, 1, 1, 1, 1, 1,
1.035848, 0.7748957, 1.890131, 1, 1, 1, 1, 1,
1.043706, -1.812288, 2.496236, 1, 1, 1, 1, 1,
1.045091, 0.681738, 0.7918826, 1, 1, 1, 1, 1,
1.045679, 0.3793431, 2.284192, 1, 1, 1, 1, 1,
1.054604, -0.3447255, 2.971046, 1, 1, 1, 1, 1,
1.056072, 0.3815781, 2.635373, 1, 1, 1, 1, 1,
1.060007, 0.6869647, -0.1832335, 0, 0, 1, 1, 1,
1.061838, 0.06281966, 0.5693752, 1, 0, 0, 1, 1,
1.074548, 0.7303678, 1.035403, 1, 0, 0, 1, 1,
1.081494, -0.4930757, 0.7510073, 1, 0, 0, 1, 1,
1.08199, -1.220335, 2.361853, 1, 0, 0, 1, 1,
1.102349, -1.571277, 3.277859, 1, 0, 0, 1, 1,
1.104432, 1.2044, 1.640718, 0, 0, 0, 1, 1,
1.109059, -0.828282, 1.883054, 0, 0, 0, 1, 1,
1.109827, -0.3535446, 1.521106, 0, 0, 0, 1, 1,
1.124716, -0.4855715, 3.029121, 0, 0, 0, 1, 1,
1.147851, -1.075651, 1.837611, 0, 0, 0, 1, 1,
1.150528, -0.2795654, 1.691642, 0, 0, 0, 1, 1,
1.150909, -0.9637324, 3.848897, 0, 0, 0, 1, 1,
1.152701, 0.9180682, 2.258809, 1, 1, 1, 1, 1,
1.154539, -1.627676, 2.494348, 1, 1, 1, 1, 1,
1.161726, -0.5983097, 2.043471, 1, 1, 1, 1, 1,
1.16688, 0.2613071, 0.4638359, 1, 1, 1, 1, 1,
1.173616, -0.5023824, 2.829142, 1, 1, 1, 1, 1,
1.178102, 3.070659, -0.8588653, 1, 1, 1, 1, 1,
1.181104, -1.179206, 4.946058, 1, 1, 1, 1, 1,
1.192961, -0.0720236, 0.4941134, 1, 1, 1, 1, 1,
1.196947, -1.964108, 4.313138, 1, 1, 1, 1, 1,
1.201752, -0.1948354, 0.3129156, 1, 1, 1, 1, 1,
1.210466, -0.1337373, 2.344589, 1, 1, 1, 1, 1,
1.214565, 2.147157, 0.8640943, 1, 1, 1, 1, 1,
1.225296, 0.4808888, 0.3752832, 1, 1, 1, 1, 1,
1.2375, -1.509707, 2.791855, 1, 1, 1, 1, 1,
1.256842, -0.9662121, 3.043421, 1, 1, 1, 1, 1,
1.262502, 0.4012199, 1.043093, 0, 0, 1, 1, 1,
1.263622, -0.3847202, 1.337711, 1, 0, 0, 1, 1,
1.272017, -1.103846, 4.160632, 1, 0, 0, 1, 1,
1.275246, 0.2887775, 1.437434, 1, 0, 0, 1, 1,
1.284296, -0.2846052, 2.370646, 1, 0, 0, 1, 1,
1.294539, 0.642152, 2.04075, 1, 0, 0, 1, 1,
1.29476, -0.5772021, 1.641518, 0, 0, 0, 1, 1,
1.301682, -0.1899665, 1.225907, 0, 0, 0, 1, 1,
1.334859, 0.7277857, 0.6819059, 0, 0, 0, 1, 1,
1.33935, 0.8872564, 1.543949, 0, 0, 0, 1, 1,
1.344097, -0.8739254, 1.900873, 0, 0, 0, 1, 1,
1.345056, -0.8889583, 2.576926, 0, 0, 0, 1, 1,
1.347489, 0.2584734, 2.020524, 0, 0, 0, 1, 1,
1.352845, 0.2819556, 1.001095, 1, 1, 1, 1, 1,
1.354227, 0.309388, 1.348911, 1, 1, 1, 1, 1,
1.354751, -0.08865202, 1.40935, 1, 1, 1, 1, 1,
1.357537, -0.07018887, 2.080847, 1, 1, 1, 1, 1,
1.363936, -1.719054, 1.759965, 1, 1, 1, 1, 1,
1.37598, -0.642872, 2.373345, 1, 1, 1, 1, 1,
1.379893, -0.7854199, 3.340034, 1, 1, 1, 1, 1,
1.384505, 0.3522975, 0.7532364, 1, 1, 1, 1, 1,
1.390975, -0.6535068, 1.467726, 1, 1, 1, 1, 1,
1.393707, 1.735837, 0.6955767, 1, 1, 1, 1, 1,
1.394267, -0.9204184, 1.869748, 1, 1, 1, 1, 1,
1.395723, -0.6163642, 2.274237, 1, 1, 1, 1, 1,
1.399131, -0.9742453, 4.121422, 1, 1, 1, 1, 1,
1.407508, -0.9434061, 2.118253, 1, 1, 1, 1, 1,
1.408783, -0.6947888, -0.5730854, 1, 1, 1, 1, 1,
1.410114, -0.08166556, 0.04108143, 0, 0, 1, 1, 1,
1.412673, -0.8075794, 4.215896, 1, 0, 0, 1, 1,
1.423441, -0.1023251, 3.560817, 1, 0, 0, 1, 1,
1.428414, 0.133653, 1.724561, 1, 0, 0, 1, 1,
1.432749, -1.029272, 2.530793, 1, 0, 0, 1, 1,
1.436573, 0.617776, 2.187252, 1, 0, 0, 1, 1,
1.439291, -0.2533511, 0.9329428, 0, 0, 0, 1, 1,
1.444791, -0.7968372, 3.710092, 0, 0, 0, 1, 1,
1.448789, 2.183433, 0.1292527, 0, 0, 0, 1, 1,
1.46019, 0.2094843, 1.646505, 0, 0, 0, 1, 1,
1.46765, -1.598373, 2.93922, 0, 0, 0, 1, 1,
1.477398, -1.1464, 4.389804, 0, 0, 0, 1, 1,
1.486758, 0.1695855, 1.88235, 0, 0, 0, 1, 1,
1.498515, -0.8608553, 2.368737, 1, 1, 1, 1, 1,
1.519372, -0.9917864, 2.284586, 1, 1, 1, 1, 1,
1.520362, -1.733633, 1.770929, 1, 1, 1, 1, 1,
1.524006, -0.06444372, 1.158076, 1, 1, 1, 1, 1,
1.526854, 0.5366451, 1.367251, 1, 1, 1, 1, 1,
1.528233, 0.9362305, 0.8557783, 1, 1, 1, 1, 1,
1.540559, 0.7619045, 0.4941933, 1, 1, 1, 1, 1,
1.553078, -0.7802024, 1.448673, 1, 1, 1, 1, 1,
1.559532, 0.06804722, 0.8031403, 1, 1, 1, 1, 1,
1.575412, -0.07254239, 0.1830599, 1, 1, 1, 1, 1,
1.575788, -1.028707, 0.7303197, 1, 1, 1, 1, 1,
1.60351, 0.3525214, 2.473472, 1, 1, 1, 1, 1,
1.605631, -1.789161, 1.6342, 1, 1, 1, 1, 1,
1.606996, -0.1473884, -0.1124717, 1, 1, 1, 1, 1,
1.618854, 0.8699716, 2.175049, 1, 1, 1, 1, 1,
1.624862, 1.391999, 1.093646, 0, 0, 1, 1, 1,
1.628745, 0.5917145, -1.091717, 1, 0, 0, 1, 1,
1.634422, 0.8716192, 1.229163, 1, 0, 0, 1, 1,
1.641157, -0.4550636, 4.359431, 1, 0, 0, 1, 1,
1.644686, 0.3497266, 1.862944, 1, 0, 0, 1, 1,
1.644797, 0.1730357, -0.4327565, 1, 0, 0, 1, 1,
1.651241, -1.673297, 2.409849, 0, 0, 0, 1, 1,
1.656422, 1.094925, 0.6079772, 0, 0, 0, 1, 1,
1.657154, -1.013579, 2.59596, 0, 0, 0, 1, 1,
1.662139, -2.115362, 2.476136, 0, 0, 0, 1, 1,
1.690417, -0.2218916, 1.298542, 0, 0, 0, 1, 1,
1.707771, -0.6567352, 3.17484, 0, 0, 0, 1, 1,
1.716518, -1.655561, 2.156784, 0, 0, 0, 1, 1,
1.721212, -1.903227, 0.9257937, 1, 1, 1, 1, 1,
1.748317, 0.6887062, 1.499058, 1, 1, 1, 1, 1,
1.75976, -1.527422, 0.8124297, 1, 1, 1, 1, 1,
1.770247, 1.011809, -0.09900228, 1, 1, 1, 1, 1,
1.786746, 1.328591, -0.9467353, 1, 1, 1, 1, 1,
1.790045, -1.428414, 4.096928, 1, 1, 1, 1, 1,
1.79333, 0.8997282, 0.2143986, 1, 1, 1, 1, 1,
1.818843, -0.6325365, 1.473148, 1, 1, 1, 1, 1,
1.848725, -0.6481467, 2.658926, 1, 1, 1, 1, 1,
1.88273, 1.217603, -0.4376392, 1, 1, 1, 1, 1,
1.895097, 0.7822332, 2.621499, 1, 1, 1, 1, 1,
1.909608, 0.6612681, 0.3109944, 1, 1, 1, 1, 1,
1.926694, 0.1880533, -0.3504963, 1, 1, 1, 1, 1,
1.942208, -1.73185, 3.2304, 1, 1, 1, 1, 1,
1.951204, -0.4998913, 0.8696299, 1, 1, 1, 1, 1,
1.960765, 1.202792, -1.15885, 0, 0, 1, 1, 1,
1.975605, 0.1440662, 2.76089, 1, 0, 0, 1, 1,
2.010235, -2.363081, 0.9232491, 1, 0, 0, 1, 1,
2.020705, -0.01000447, 1.582106, 1, 0, 0, 1, 1,
2.034898, 0.05325465, 0.9783689, 1, 0, 0, 1, 1,
2.073507, -0.6913819, 2.012079, 1, 0, 0, 1, 1,
2.079633, 1.465497, 0.7668283, 0, 0, 0, 1, 1,
2.118319, -1.847849, 1.778094, 0, 0, 0, 1, 1,
2.125166, -0.3290538, 2.361422, 0, 0, 0, 1, 1,
2.16212, 1.34391, 2.006399, 0, 0, 0, 1, 1,
2.231159, 1.402073, 0.6932219, 0, 0, 0, 1, 1,
2.292504, 0.7737643, 1.173667, 0, 0, 0, 1, 1,
2.352714, -0.5221536, 4.12944, 0, 0, 0, 1, 1,
2.369236, -0.3322044, 1.276613, 1, 1, 1, 1, 1,
2.435325, -0.9945263, 1.546351, 1, 1, 1, 1, 1,
2.484383, 2.165684, 1.172797, 1, 1, 1, 1, 1,
2.677125, 1.27232, 1.284964, 1, 1, 1, 1, 1,
3.041029, 0.2710404, 0.9039051, 1, 1, 1, 1, 1,
3.099149, -0.1074706, 2.241576, 1, 1, 1, 1, 1,
3.159461, 0.3341528, 2.480541, 1, 1, 1, 1, 1
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
var radius = 9.914038;
var distance = 34.82264;
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
mvMatrix.translate( 0.1472988, -0.2063489, -0.02651095 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82264);
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
